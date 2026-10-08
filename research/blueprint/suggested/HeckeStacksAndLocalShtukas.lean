/-
Suggested Lean signatures for the roadmap "Hecke correspondences on the Fargues–Fontaine curve and
local shtuka cohomology" (blueprint packet `HeckeStacksAndLocalShtukas`).

This file is not the roadmap and it is not exhaustive. The roadmap document
`research/blueprint/readmes/HeckeStacksAndLocalShtukas.md` is definitive. The statements below
suggest Lean forms, so that contributors and reviewers converge on names and signatures. No
implementation is claimed: a body or a proof that is not built from the declarations above it is
`sorry`.

Pinned libraries: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

The section "Imported interfaces" declares opaque stand-ins for objects that other roadmaps own
(perfectoid spaces and v-stacks, the Fargues–Fontaine curve and `Div¹`, `Bun_G`, the local Hecke
stack and the affine Grassmannian, the Satake category, the categories of solid, lisse and étale
sheaves, smooth representations, rigid spaces). Their bodies are placeholders and not
constructions: the definition of the owner, named in each docstring, governs. Wherever Mathlib has
the ambient notion the stand-in is built on it (sheaves on a site, limits, adjunctions, monoidal
and triangulated categories, full subcategories, open subgroups), and the group-theoretic layer
(σ-conjugation, `B(G)`, the σ-centraliser, levels) is defined with no placeholder. A property of a
morphism or of an object that another roadmap supplies is an opaque `MorphismProperty`,
`ObjectProperty` or `Set`, with its owner in the docstring; no missing condition is replaced by a
`Prop`-valued field or by `def _ : Prop := sorry`. A clause of the packet that cannot be stated
with these interfaces is omitted and marked `-- Omitted:`.

After the interfaces the file follows the packet stage by stage (HS0 to HS4). Each API item of the
packet is a declaration with the packet's name; each unit test is an `example` preceded by the
comment line `-- <name of the test>`; each theorem, comparison and application node is a
declaration named after its slug, with the node id in its docstring.
-/
import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Basic
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Closed.Basic
import Mathlib.CategoryTheory.Monoidal.End
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Opposite
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Braided
import Mathlib.CategoryTheory.Monoidal.Subcategory
import Mathlib.CategoryTheory.MorphismProperty.Basic
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Preadditive.Yoneda.Basic
import Mathlib.CategoryTheory.Sites.Limits
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Triangulated.Subcategory
import Mathlib.Condensed.Basic
import Mathlib.Condensed.Module
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.GroupTheory.Index
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.NumberTheory.LocalField.Basic
import Mathlib.NumberTheory.Padics.LocalField
import Mathlib.RepresentationTheory.Induced
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.OpenSubgroup
import Mathlib.Topology.Category.Profinite.Basic
import Mathlib.Topology.Category.Stonean.Basic
import Mathlib.Topology.Category.TopCat.Basic

set_option autoImplicit false

noncomputable section

open CategoryTheory Limits MonoidalCategory Opposite
open scoped ValuativeRel

universe u

namespace TauCeti.HeckeShtukas

/-! ## Conventions

Definitions with no placeholder, used by every stage. -/

/-- Compact objects of a preadditive category with coproducts: `Hom(A, -)` commutes with
coproducts indexed by sets. For the homotopy category of a stable ∞-category with colimits these
are its compact objects; in `D(R)` they are the perfect complexes. -/
def isCompactObject (C : Type*) [Category C] [Preadditive C] : ObjectProperty C :=
  fun A => ∀ J : Type, PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (op A))

/-- An open subgroup `K` of a topological group is compact and pro-`p`: it is compact and every
open subgroup contained in it has index a power of `p` in it. -/
def IsOpenProP {H : Type*} [Group H] [TopologicalSpace H] (p : ℕ) (K : OpenSubgroup H) : Prop :=
  IsCompact (K : Set H) ∧
    ∀ U : OpenSubgroup H, U ≤ K → ∃ n : ℕ, U.toSubgroup.relIndex K.toSubgroup = p ^ n

attribute [local instance] HasDerivedCategory.standard in
/-- The derived category `D(R)` of modules over a ring: Mathlib's `DerivedCategory`. -/
abbrev DMod (R : Type) [CommRing R] : Type 1 := DerivedCategory (ModuleCat.{0} R)

/-- Perfect complexes of `R`-modules: the compact objects of `D(R)`. -/
abbrev DMod.isPerfect (R : Type) [CommRing R] : ObjectProperty (DMod R) := isCompactObject _

/-! ## Imported interfaces

Nothing in this section is planned by this roadmap. Each declaration stands in for an object that
another roadmap (named in its docstring) owns; the owner's definition governs. An opaque `def` is
a type, a functor, a morphism, a function or a property whose body is the placeholder; an
`instance` or a `theorem` proved by the placeholder records a structure or a fact of the owner. A
structure has only fields that the pinned libraries can state. -/

variable {p : ℕ} [Fact p.Prime]

/-! ### Local fields, Weil groups and coefficient rings -/

/-- A nonarchimedean local field `E` of residue characteristic `p`, of characteristic `0` or `p`:
Mathlib's `IsNonarchimedeanLocalField` together with the residue characteristic. -/
structure LocalField (p : ℕ) [Fact p.Prime] where
  /-- The field `E`. -/
  E : Type
  [field : Field E]
  [valuativeRel : ValuativeRel E]
  [topologicalSpace : TopologicalSpace E]
  [isNonarchimedeanLocalField : IsNonarchimedeanLocalField E]
  /-- The residue field has characteristic `p`. -/
  charP_residueField : CharP 𝓀[E] p

attribute [instance] LocalField.field LocalField.valuativeRel LocalField.topologicalSpace
  LocalField.isNonarchimedeanLocalField

/-- The cardinality `q` of the residue field of `E`. -/
def LocalField.q (F : LocalField p) : ℕ := Nat.card 𝓀[F.E]

/-- The local field `ℚ_p`. -/
def LocalField.Qp (p : ℕ) [Fact p.Prime] : LocalField p where
  E := ℚ_[p]
  charP_residueField := sorry

/-- A finite extension `E'` of `E`, given by the inclusion `E → E'`. -/
structure LocalField.Ext (F F' : LocalField p) where
  /-- The inclusion `E → E'`. -/
  toRingHom : F.E →+* F'.E
  finite : toRingHom.Finite

/-- RelativeFarguesFontaine RF0 (stand-in): `Ĕ`, the completion of the maximal unramified extension
of `E`; for `E = ℚ_p` it is `W(k)[1/p]`, `k` an algebraic closure of `𝔽_p`. -/
def LocalField.Breve (F : LocalField p) : Type := sorry

instance (F : LocalField p) : Field F.Breve := sorry
instance (F : LocalField p) : Algebra F.E F.Breve := sorry
instance (F : LocalField p) : TopologicalSpace F.Breve := sorry
instance (F : LocalField p) : IsTopologicalRing F.Breve := sorry

/-- RF0 (stand-in): the Frobenius `σ` of `Ĕ`, the continuous `E`-automorphism lifting `x ↦ x^q`. -/
def LocalField.frob (F : LocalField p) : F.Breve ≃ₐ[F.E] F.Breve := sorry

/-- RF0: `E` is the field of `σ`-fixed elements of `Ĕ`. -/
theorem LocalField.frob_eq_self_iff (F : LocalField p) (x : F.Breve) :
    F.frob x = x ↔ x ∈ (algebraMap F.E F.Breve).range := sorry

/-- RF0 (stand-in): the normalised valuation `Ĕ^× → ℤ`, a uniformiser of `E` having
valuation `1`. -/
def LocalField.valBreve (F : LocalField p) : F.Breveˣ →* Multiplicative ℤ := sorry

/-- Tau Ceti roadmap ClassFieldTheory, layer 9 (stand-in): the Weil group `W_E` of `E`, for a fixed
separable closure of `E`, with its locally profinite topology. The name is that of
`LanglandsParameterStacks.lean`. -/
def LocalField.WeilGroup (F : LocalField p) : Type := sorry

instance (F : LocalField p) : Group F.WeilGroup := sorry
instance (F : LocalField p) : TopologicalSpace F.WeilGroup := sorry
instance (F : LocalField p) : IsTopologicalGroup F.WeilGroup := sorry

/-- ClassFieldTheory, layer 9 (stand-in): the degree `W_E → ℤ`, which sends an element inducing
`x ↦ x^(q^n)` on the residue field of the separable closure to `n`. -/
def LocalField.weilDeg (F : LocalField p) : F.WeilGroup →ₜ* Multiplicative ℤ := sorry

/-- ClassFieldTheory, layer 9: the degree is surjective. -/
theorem LocalField.weilDeg_surjective (F : LocalField p) : Function.Surjective F.weilDeg := sorry

/-- The inertia subgroup `I_E`, the kernel of the degree. -/
def LocalField.inertia (F : LocalField p) : Subgroup F.WeilGroup := F.weilDeg.toMonoidHom.ker

/-- ClassFieldTheory (stand-in): the reciprocity map `W_E → E^×`, inducing `W_E^ab ≅ E^×`. Its
normalisation (which Frobenius goes to a uniformiser) is the owner's; Fargues–Scholze IX.6.4 use the
one given by the `E^×`-torsor `BC(𝒪(1)) ∖ {0} → Div¹` of their II.2.4. -/
def LocalField.reciprocity (F : LocalField p) : F.WeilGroup →ₜ* F.Eˣ := sorry

/-- A coefficient ring: a `ℤ_ℓ`-algebra `Λ`, for a prime `ℓ ≠ p`, with a chosen square root of
`q`; that is, a `ℤ_ℓ[√q]`-algebra. `Λ` is a discrete ring, regarded by the owners of the sheaf
categories as the condensed ring `ℤ_ℓ ⊗_{ℤ_ℓ,disc} Λ` (Fargues–Scholze VII.6). -/
structure Coeff (F : LocalField p) (ℓ : ℕ) [Fact ℓ.Prime] where
  /-- `ℓ ≠ p`. -/
  ne : ℓ ≠ p
  /-- The ring `Λ`. -/
  carrier : Type
  [commRing : CommRing carrier]
  [algebra : Algebra ℤ_[ℓ] carrier]
  /-- The chosen square root of `q`. -/
  sqrtq : carrier
  sqrtq_sq : sqrtq ^ 2 = (F.q : carrier)

attribute [instance] Coeff.commRing Coeff.algebra

variable {ℓ : ℕ} [Fact ℓ.Prime]

instance (F : LocalField p) : CoeSort (Coeff F ℓ) Type := ⟨Coeff.carrier⟩

/-- A homomorphism of `ℤ_ℓ[√q]`-algebras. -/
structure Coeff.Hom {F : LocalField p} (Λ Λ' : Coeff F ℓ) where
  /-- The underlying homomorphism of `ℤ_ℓ`-algebras. -/
  toAlgHom : Λ →ₐ[ℤ_[ℓ]] Λ'
  map_sqrtq : toAlgHom Λ.sqrtq = Λ'.sqrtq

/-- `Λ` is killed by a power of `ℓ`. -/
def Coeff.IsTorsion {F : LocalField p} (Λ : Coeff F ℓ) : Prop := ∃ n : ℕ, (ℓ : Λ) ^ n = 0

/-- The coefficient ring `ℤ_ℓ[√q] = ℤ_ℓ[x]/(x² - q)`. -/
def Coeff.base (F : LocalField p) (ℓ : ℕ) [Fact ℓ.Prime] (h : ℓ ≠ p) : Coeff F ℓ where
  ne := h
  carrier := AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (F.q : ℤ_[ℓ]))
  sqrtq := AdjoinRoot.root _
  sqrtq_sq := sorry

/-- `Λ` is `ℤ/ℓⁿ[√q] = ℤ_ℓ[√q]/ℓⁿ` for some `n ≥ 1`: the structure map from `ℤ_ℓ[√q]` is surjective
with kernel generated by `ℓⁿ`. These are the torsion coefficient rings for which the packet proves
the comparison of the solid kernel with the étale Satake sheaf. -/
def Coeff.IsBaseTorsion {F : LocalField p} (Λ : Coeff F ℓ) : Prop :=
  ∃ (n : ℕ) (φ : (Coeff.base F ℓ Λ.ne).Hom Λ), 0 < n ∧ Function.Surjective φ.toAlgHom ∧
    RingHom.ker φ.toAlgHom.toRingHom = Ideal.span {((ℓ : ℕ) : (Coeff.base F ℓ Λ.ne)) ^ n}

/-! ### Perfectoid spaces, v-sheaves and v-stacks -/

/-- DiamondsAndVStacks D1 (stand-in): perfectoid spaces over `k`, an algebraic closure of `𝔽_p`.
The name is that of `DiamondsAndVStacks.lean`. Opaque: neither library has perfectoid spaces. -/
def Perfd (p : ℕ) [Fact p.Prime] : Type 1 := sorry

/-- D1 (stand-in): morphisms of perfectoid spaces over `k`. -/
instance : LargeCategory (Perfd p) := sorry

/-- D1 (stand-in): the underlying topological space `|S|`. -/
def Perfd.toTop (p : ℕ) [Fact p.Prime] : Perfd p ⥤ TopCat.{0} := sorry

/-- DiamondsAndVStacks D2 (stand-in): the v-topology. -/
def Perfd.vTopology (p : ℕ) [Fact p.Prime] : GrothendieckTopology (Perfd p) := sorry

/-- D1 (stand-in): geometric points `Spa(C, C⁺)`, `C` an algebraically closed perfectoid field
over `k`. -/
def Perfd.GeomPoint (p : ℕ) [Fact p.Prime] : Type 1 := sorry

/-- D1 (stand-in): the perfectoid space of a geometric point. -/
def Perfd.GeomPoint.toPerfd (s : Perfd.GeomPoint p) : Perfd p := sorry

/-- v-sheaves of sets on `Perf_k`: Mathlib's sheaves on the stand-in site, so that morphisms,
isomorphisms, products and fibre products of v-sheaves are Mathlib's. The terminal object is
`Spd k`. The name is that of `GeometricSatakeAndFusion--GS0.lean`. Smallness is the owner's. -/
abbrev VSheaf (p : ℕ) [Fact p.Prime] : Type 1 := Sheaf (Perfd.vTopology p) (Type)

/-- DiamondsAndVStacks D3: the v-sheaf `S ↦ C(|S|, T)` of a topological space `T`, written
`underline T`, functorial in `T`. The sheaf condition (a v-cover is a quotient map on underlying
spaces) is the owner's. -/
def VSheaf.ofTop (p : ℕ) [Fact p.Prime] : TopCat.{0} ⥤ VSheaf p :=
  ObjectProperty.lift _ (yoneda ⋙ (Functor.whiskeringLeft _ _ _).obj (Perfd.toTop p).op)
    (fun _ => sorry)

/-- DiamondsAndVStacks D2: the v-sheaf represented by a perfectoid space. The sheaf condition (the
v-topology is subcanonical) is the owner's. -/
def VSheaf.ofPerfd (p : ℕ) [Fact p.Prime] : Perfd p ⥤ VSheaf p :=
  ObjectProperty.lift _ yoneda (fun _ => sorry)

/-- DiamondsAndVStacks D4 (stand-in): small v-stacks on `Perf_k`, as a category whose morphisms
are the 1-morphisms up to 2-isomorphism. So an isomorphism in this category is an equivalence of
v-stacks, and an equation of morphisms is a 2-isomorphism of 1-morphisms. The name is that of
`VStackSheavesAndLisseCategories.lean` and `BunGAndNewtonStrata.lean`. -/
def VStack (p : ℕ) [Fact p.Prime] : Type 1 := sorry

/-- D4 (stand-in): 1-morphisms of small v-stacks up to 2-isomorphism. -/
instance : LargeCategory (VStack p) := sorry

/-- D4: products of v-stacks; the terminal object is `Spd k`, written `∗`. -/
instance : HasFiniteProducts (VStack p) := sorry

/-- D4 (stand-in): a v-sheaf as a v-stack. -/
def VSheaf.toStack (p : ℕ) [Fact p.Prime] : VSheaf p ⥤ VStack p := sorry

instance : (VSheaf.toStack p).Full := sorry
instance : (VSheaf.toStack p).Faithful := sorry

/-- D4: products of v-sheaves are their products as v-stacks. -/
instance : PreservesFiniteProducts (VSheaf.toStack p) := sorry

/-- D4 (stand-in): the 2-fibre product `X ×_Z Y`. It is not the fibre product of the category
`VStack p`, in which morphisms are taken up to 2-isomorphism; it has the weak universal property
`VStack.fibre.exists_lift`. Over a v-sheaf `Z` it is the fibre product of `VStack p`. -/
def VStack.fibre {X Y Z : VStack p} (f : X ⟶ Z) (g : Y ⟶ Z) : VStack p := sorry

/-- D4 (stand-in): the first projection of the 2-fibre product. -/
def VStack.fibre.fst {X Y Z : VStack p} (f : X ⟶ Z) (g : Y ⟶ Z) : VStack.fibre f g ⟶ X := sorry

/-- D4 (stand-in): the second projection of the 2-fibre product. -/
def VStack.fibre.snd {X Y Z : VStack p} (f : X ⟶ Z) (g : Y ⟶ Z) : VStack.fibre f g ⟶ Y := sorry

/-- D4: the square of a 2-fibre product commutes up to 2-isomorphism. -/
theorem VStack.fibre.condition {X Y Z : VStack p} (f : X ⟶ Z) (g : Y ⟶ Z) :
    VStack.fibre.fst f g ≫ f = VStack.fibre.snd f g ≫ g := sorry

/-- D4: a pair of maps to `X` and `Y` that agree in `Z` up to 2-isomorphism factors through the
2-fibre product. The factorisation depends on the 2-isomorphism and is not unique. -/
theorem VStack.fibre.exists_lift {X Y Z T : VStack p} (f : X ⟶ Z) (g : Y ⟶ Z) (a : T ⟶ X)
    (b : T ⟶ Y) (h : a ≫ f = b ≫ g) :
    ∃ c : T ⟶ VStack.fibre f g, c ≫ VStack.fibre.fst f g = a ∧ c ≫ VStack.fibre.snd f g = b :=
  sorry

/-- A square of v-stacks is 2-cartesian: there is an equivalence of its corner with the 2-fibre
product, compatible with the two projections. -/
def VStack.IsCartesian {W X Y Z : VStack p} (a : W ⟶ X) (b : W ⟶ Y) (f : X ⟶ Z) (g : Y ⟶ Z) :
    Prop :=
  ∃ e : W ≅ VStack.fibre f g,
    e.hom ≫ VStack.fibre.fst f g = a ∧ e.hom ≫ VStack.fibre.snd f g = b

/-- D4 (stand-in): the presheaf of isomorphism classes of objects, `S ↦ π₀(X(S))`. -/
def VStack.isoClasses (p : ℕ) [Fact p.Prime] : VStack p ⥤ (Perfd p)ᵒᵖ ⥤ Type 1 := sorry

/-- The isomorphism classes of objects of `X` over a geometric point. -/
abbrev VStack.geomPts (X : VStack p) (s : Perfd.GeomPoint p) : Type 1 :=
  ((VStack.isoClasses p).obj X).obj (op s.toPerfd)

/-- D4 (stand-in): the automorphism group in `X(S)` of an object in the class `x`; it is defined
up to inner automorphisms. -/
def VStack.autGroup (X : VStack p) (S : Perfd p)
    (x : ((VStack.isoClasses p).obj X).obj (op S)) : Type := sorry

instance (X : VStack p) (S : Perfd p) (x : ((VStack.isoClasses p).obj X).obj (op S)) :
    Group (X.autGroup S x) := sorry

/-- D4 (stand-in): the underlying topological space `|X|` of a small v-stack. -/
def VStack.toTop (p : ℕ) [Fact p.Prime] : VStack p ⥤ TopCat.{0} := sorry

/-- D4 (stand-in): the classifying stack `[∗/underline H]` of a topological group `H`. -/
def VStack.classifying (p : ℕ) [Fact p.Prime] (H : Type) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] : VStack p := sorry

/-- D4 (stand-in): the point `∗ → [∗/underline H]` given by the trivial torsor. -/
def VStack.classifying.point (p : ℕ) [Fact p.Prime] (H : Type) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] : ⊤_ (VStack p) ⟶ VStack.classifying p H := sorry

/-- D4 (stand-in): the map of classifying stacks induced by a continuous homomorphism. -/
def VStack.classifying.map (p : ℕ) [Fact p.Prime] {H H' : Type} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [Group H'] [TopologicalSpace H'] [IsTopologicalGroup H']
    (φ : H →ₜ* H') : VStack.classifying p H ⟶ VStack.classifying p H' := sorry

/-! Properties of morphisms of small v-stacks. Each is a property of 1-morphisms that is invariant
under 2-isomorphism, supplied by the roadmap named. -/

/-- DiamondsAndVStacks D3 (stand-in): open immersions. -/
def VStack.openImmersion (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D3 (stand-in): closed immersions. -/
def VStack.closedImmersion (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D3 (stand-in): locally closed immersions. -/
def VStack.locallyClosedImmersion (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D4 (stand-in): maps that are fully faithful on `S`-points for every `S`
(monomorphisms of v-stacks). -/
def VStack.fullyFaithful (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D4 (stand-in): surjective maps of v-stacks (surjective on `S`-points
v-locally on `S`). -/
def VStack.surjective (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): maps representable in spatial diamonds. -/
def VStack.reprSpatial (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): maps representable in locally spatial diamonds. -/
def VStack.reprLocSpatial (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): quasicompact maps. -/
def VStack.quasicompact (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S0 (stand-in): separated maps. -/
def VStack.separated (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S0 (stand-in): proper maps. -/
def VStack.proper (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S0 (stand-in): partially proper maps. -/
def VStack.partiallyProper (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S0 (stand-in): compactifiable maps. -/
def VStack.compactifiable (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S0 (stand-in): maps of finite `dim.trg`. -/
def VStack.finiteDimTrg (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S0 (stand-in): maps locally of finite `dim.trg`. -/
def VStack.locFiniteDimTrg (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): étale maps (representable in locally spatial diamonds). -/
def VStack.etale (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): finite étale maps. -/
def VStack.finiteEtale (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): finite étale maps all of whose geometric fibres have `d`
points. -/
def VStack.finiteEtaleOfDegree (p : ℕ) [Fact p.Prime] (d : ℕ) : MorphismProperty (VStack p) :=
  sorry

/-- DiamondSixOperations S4 (stand-in): separated maps, representable in locally spatial diamonds,
that are `ℓ`-cohomologically smooth. -/
def VStack.cohSmooth (p : ℕ) [Fact p.Prime] (ℓ : ℕ) : MorphismProperty (VStack p) := sorry

/-- DiamondSixOperations S4 (stand-in): `ℓ`-cohomologically smooth maps of pure `ℓ`-dimension
`d`. -/
def VStack.cohSmoothOfDim (p : ℕ) [Fact p.Prime] (ℓ : ℕ) (d : ℤ) : MorphismProperty (VStack p) :=
  sorry

/-! ### The base `Spd Ĕ`, the divisor sheaf `Div¹` and its powers -/

/-- RelativeFarguesFontaine RF2 (stand-in): the v-sheaf `Spd Ĕ` over `Spd k`, the sheaf of untilts
over `Ĕ`. -/
def LocalField.spdBreve (F : LocalField p) : VSheaf p := sorry

/-- RF2 (stand-in): the Frobenius automorphism `φ` of `Spd Ĕ` over `Spd k`, which keeps the untilt
and composes the identification of its tilt with the `q`-Frobenius. -/
def LocalField.spdBreveFrob (F : LocalField p) : F.spdBreve ≅ F.spdBreve := sorry

/-- RF2 (stand-in): `Spd C`, for `C` the completion of the separable closure of `E` used for
`W_E`. -/
def LocalField.spdC (F : LocalField p) : VSheaf p := sorry

/-- RF2 (stand-in): `Spd C → Spd Ĕ`. -/
def LocalField.spdCToBreve (F : LocalField p) : F.spdC ⟶ F.spdBreve := sorry

/-- RF2 (stand-in): the map `Spd Ĕ' → Spd Ĕ` of a finite extension. -/
def LocalField.Ext.spdBreveMap {F F' : LocalField p} (e : F.Ext F') : F'.spdBreve ⟶ F.spdBreve :=
  sorry

/-- RelativeFarguesFontaine RF2 (stand-in): `Div¹ = Spd Ĕ/φ^ℤ`, the v-sheaf of degree-one closed
Cartier divisors on the relative Fargues–Fontaine curve `X_S` of `E`. -/
def Div1 (F : LocalField p) : VSheaf p := sorry

/-- RF2 (stand-in): the quotient map `Spd Ĕ → Div¹`. -/
def Div1.proj (F : LocalField p) : F.spdBreve ⟶ Div1 F := sorry

/-- RF2: the quotient map is invariant under `φ`. -/
theorem Div1.frob_proj (F : LocalField p) : F.spdBreveFrob.hom ≫ Div1.proj F = Div1.proj F :=
  sorry

/-- RF2 (stand-in): the finite étale map `Div¹_{E'} → Div¹_E` of a finite extension. -/
def LocalField.Ext.div1Map {F F' : LocalField p} (e : F.Ext F') : Div1 F' ⟶ Div1 F := sorry

/-- The geometric point `Spd C → Div¹`. -/
def Div1.geomPoint (F : LocalField p) : F.spdC ⟶ Div1 F := F.spdCToBreve ≫ Div1.proj F

/-- `(Div¹)^I`, the product in v-sheaves. -/
abbrev Div1.pow (F : LocalField p) (I : Type) [Finite I] : VSheaf p := ∏ᶜ fun _ : I => Div1 F

/-- `Δ_a : (Div¹)^J → (Div¹)^I`, `(D_j) ↦ (D_{a(i)})`, for a map `a : I → J`. -/
def Div1.diag (F : LocalField p) {I J : Type} [Finite I] [Finite J] (a : I → J) :
    Div1.pow F J ⟶ Div1.pow F I :=
  Pi.lift fun i => Pi.π _ (a i)

/-- The diagonal geometric point `Spd C → (Div¹)^I`. -/
def Div1.geomPointPow (F : LocalField p) (I : Type) [Finite I] : F.spdC ⟶ Div1.pow F I :=
  Pi.lift fun _ => Div1.geomPoint F

/-- `(Div¹)^I` as a v-stack. -/
abbrev Div1.stack (F : LocalField p) (I : Type) [Finite I] : VStack p :=
  (VSheaf.toStack p).obj (Div1.pow F I)

/-- RF2 with ClassFieldTheory (stand-in): `(Div¹)^I → [∗/underline{W_E^I}]`, given by the
`W_E`-torsor `Spd C → Div¹` (Fargues–Scholze IV.7, VII.2). -/
def Div1.toClassifyingWeil (F : LocalField p) (I : Type) [Finite I] :
    Div1.stack F I ⟶ VStack.classifying p (I → F.WeilGroup) := sorry

/-- RF2 (stand-in): the action of `W_E` on `Spd C` over `Div¹`. -/
def LocalField.weilActionSpdC (F : LocalField p) : F.WeilGroup →* Aut F.spdC := sorry

/-! ### Reductive groups, cocharacters and `B(G)` -/

/-- ReductiveGroups (stand-in): reductive groups over `E`; the pinned carrier is
`TauCeti.ReductiveAffineGroupSchemeCat E`, which the shared build does not compile. -/
def RedGrp (F : LocalField p) : Type 1 := sorry

/-- ReductiveGroups (stand-in): homomorphisms of group schemes over `E`. -/
instance (F : LocalField p) : LargeCategory (RedGrp F) := sorry

namespace RedGrp

variable {F : LocalField p}

/-- ReductiveGroups (stand-in): the trivial group. -/
def trivial (F : LocalField p) : RedGrp F := sorry

/-- ReductiveGroups (stand-in): the multiplicative group `𝔾_m`. -/
def Gm (F : LocalField p) : RedGrp F := sorry

/-- ReductiveGroups (stand-in): `GL_n`. -/
def GLn (F : LocalField p) (n : ℕ) : RedGrp F := sorry

/-- ReductiveGroups (stand-in): `PGL_n`. -/
def PGLn (F : LocalField p) (n : ℕ) : RedGrp F := sorry

/-- ReductiveGroups (stand-in): the determinant `GL_n → 𝔾_m`. -/
def GLn.det (F : LocalField p) (n : ℕ) : GLn F n ⟶ Gm F := sorry

/-- ReductiveGroups (stand-in): the product of two reductive groups. -/
def prod (G H : RedGrp F) : RedGrp F := sorry

/-- ReductiveGroups (stand-in): the split groups. -/
def isSplit (F : LocalField p) : ObjectProperty (RedGrp F) := sorry

/-- ReductiveGroups (stand-in): the tori. -/
def isTorus (F : LocalField p) : ObjectProperty (RedGrp F) := sorry

/-- ReductiveGroups (stand-in): the locally profinite group `G(E)`. -/
def pts (G : RedGrp F) : Type := sorry

instance (G : RedGrp F) : Group G.pts := sorry
instance (G : RedGrp F) : TopologicalSpace G.pts := sorry
instance (G : RedGrp F) : IsTopologicalGroup G.pts := sorry

/-- ReductiveGroups (stand-in): the topological group `G(Ĕ)`. -/
def ptsBreve (G : RedGrp F) : Type := sorry

instance (G : RedGrp F) : Group G.ptsBreve := sorry
instance (G : RedGrp F) : TopologicalSpace G.ptsBreve := sorry
instance (G : RedGrp F) : IsTopologicalGroup G.ptsBreve := sorry

/-- BunGAndNewtonStrata BG0 (stand-in): the Frobenius `σ` of `G(Ĕ)`. -/
def frob (G : RedGrp F) : G.ptsBreve ≃* G.ptsBreve := sorry

/-- BG0 (stand-in): the inclusion `G(E) → G(Ĕ)`. -/
def incl (G : RedGrp F) : G.pts →* G.ptsBreve := sorry

/-- BG0: `G(E) → G(Ĕ)` is injective. -/
theorem incl_injective (G : RedGrp F) : Function.Injective G.incl := sorry

/-- BG0: `G(E)` is the group of `σ`-fixed points of `G(Ĕ)`. -/
theorem mem_range_incl_iff (G : RedGrp F) (g : G.ptsBreve) : g ∈ G.incl.range ↔ G.frob g = g :=
  sorry

/-- ReductiveGroups (stand-in): a homomorphism induces a continuous homomorphism on `E`-points. -/
def ptsMap {G H : RedGrp F} (f : G ⟶ H) : G.pts →ₜ* H.pts := sorry

/-- ReductiveGroups (stand-in): a homomorphism induces a homomorphism on `Ĕ`-points, commuting
with `σ`. -/
def ptsBreveMap {G H : RedGrp F} (f : G ⟶ H) : G.ptsBreve →* H.ptsBreve := sorry

/-- ReductiveGroups (stand-in): `𝔾_m(E) = E^×`. -/
def Gm.ptsEquiv (F : LocalField p) : (Gm F).pts ≃* F.Eˣ := sorry

/-- ReductiveGroups (stand-in): `𝔾_m(Ĕ) = Ĕ^×`. -/
def Gm.ptsBreveEquiv (F : LocalField p) : (Gm F).ptsBreve ≃* F.Breveˣ := sorry

/-- ReductiveGroups (stand-in): `GL_n(E)`. -/
def GLn.ptsEquiv (F : LocalField p) (n : ℕ) :
    (GLn F n).pts ≃* Matrix.GeneralLinearGroup (Fin n) F.E := sorry

/-- ReductiveGroups (stand-in): `GL_n(Ĕ)`. -/
def GLn.ptsBreveEquiv (F : LocalField p) (n : ℕ) :
    (GLn F n).ptsBreve ≃* Matrix.GeneralLinearGroup (Fin n) F.Breve := sorry

/-- The levels: compact open subgroups of `G(E)`. -/
abbrev Level (G : RedGrp F) : Type := {K : OpenSubgroup G.pts // IsCompact (K : Set G.pts)}

/-- ReductiveGroups (stand-in): smooth affine models `𝒢` of `G` over the ring of integers of `E`
with connected special fibre. -/
def Model (G : RedGrp F) : Type := sorry

/-- ReductiveGroups (stand-in): the compact open subgroup `𝒢(𝒪_E)` of `G(E)`. -/
def Model.level {G : RedGrp F} (𝒢 : G.Model) : G.Level := sorry

/-- The coset space `G(E)/K` with its quotient topology (discrete, as `K` is open). -/
abbrev cosets (G : RedGrp F) (K : G.Level) : TopCat.{0} := TopCat.of (G.pts ⧸ K.1.toSubgroup)

/-- The continuous map `G(E)/K' → G(E)/K` for `K' ≤ K`: Mathlib's `Subgroup.quotientMapOfLE`. -/
def cosetsMap (G : RedGrp F) {K' K : G.Level} (h : K' ≤ K) : G.cosets K' ⟶ G.cosets K :=
  TopCat.ofHom ⟨Subgroup.quotientMapOfLE (s := K'.1.toSubgroup) (t := K.1.toSubgroup) h,
    continuous_id.quotient_map' _⟩

/-! σ-conjugation, `B(G)` and the σ-centraliser, in the orientation of BunGAndNewtonStrata BG0 and
Fargues–Scholze III.2: `g · b = g b σ(g)⁻¹` and `J_b = {g | g b = b σ(g)}`. Nothing here is
opaque. -/

/-- σ-conjugation: `g · b = g b σ(g)⁻¹`. -/
def sigmaConj (G : RedGrp F) (g b : G.ptsBreve) : G.ptsBreve := g * b * (G.frob g)⁻¹

/-- σ-conjugacy as an equivalence relation on `G(Ĕ)`. -/
def sigmaConjSetoid (G : RedGrp F) : Setoid G.ptsBreve where
  r b b' := ∃ g, G.sigmaConj g b = b'
  iseqv :=
    { refl := fun b => ⟨1, by simp [sigmaConj]⟩
      symm := by
        rintro b b' ⟨g, rfl⟩
        exact ⟨g⁻¹, by simp [sigmaConj, mul_assoc]⟩
      trans := by
        rintro b b' b'' ⟨g, rfl⟩ ⟨g', rfl⟩
        exact ⟨g' * g, by simp [sigmaConj, mul_assoc]⟩ }

/-- BG0: the Kottwitz set `B(G)`, the set of σ-conjugacy classes in `G(Ĕ)`. The name is that of
`BunGAndNewtonStrata.lean`. -/
def BofG (G : RedGrp F) : Type := Quotient G.sigmaConjSetoid

/-- The class `[b] ∈ B(G)`. -/
def BofG.mk {G : RedGrp F} (b : G.ptsBreve) : G.BofG := Quotient.mk _ b

/-- BG0: `J_b(E) = G_b(E) = {g ∈ G(Ĕ) | g b = b σ(g)}`, the stabiliser of `b` under σ-conjugation,
with the topology induced from `G(Ĕ)`. The name is that of `BunGAndNewtonStrata.lean`. -/
def sigmaCentralizer (G : RedGrp F) (b : G.ptsBreve) : Subgroup G.ptsBreve where
  carrier := {g | g * b = b * G.frob g}
  mul_mem' {g h} hg hh := by
    change g * b = b * G.frob g at hg
    change h * b = b * G.frob h at hh
    change g * h * b = b * G.frob (g * h)
    rw [map_mul, mul_assoc, hh, ← mul_assoc, hg, mul_assoc]
  one_mem' := by change (1 : G.ptsBreve) * b = b * G.frob 1; simp
  inv_mem' {g} hg := by
    change g * b = b * G.frob g at hg
    change g⁻¹ * b = b * G.frob g⁻¹
    rw [map_inv, eq_mul_inv_iff_mul_eq, mul_assoc, ← hg, inv_mul_cancel_left]

/-- BG0 (stand-in): the reductive group `G_b` over `E` with `G_b(E) = J_b(E)`; an inner form of
`G` when `b` is basic, and of a Levi subgroup in general. -/
def innerForm (G : RedGrp F) (b : G.ptsBreve) : RedGrp F := sorry

/-- BG0 (stand-in): `G_b(E) = J_b(E)`, as topological groups. -/
def innerFormPts (G : RedGrp F) (b : G.ptsBreve) : (G.innerForm b).pts ≃ₜ* G.sigmaCentralizer b :=
  sorry

/-- ReductiveGroups (stand-in): the set `X_*(T)⁺` of dominant cocharacters of `G` over a separable
closure of `E`, equivalently of geometric conjugacy classes of cocharacters, for a fixed maximal
torus and Borel subgroup over a splitting field. -/
def Cochar (G : RedGrp F) : Type := sorry

/-- ReductiveGroups (stand-in): the dominance order, `μ' ≤ μ` iff `μ - μ'` is a sum of positive
coroots with coefficients in `ℤ_{≥0}`. -/
instance (G : RedGrp F) : PartialOrder G.Cochar := sorry

/-- ReductiveGroups (stand-in): sums of dominant cocharacters. -/
instance (G : RedGrp F) : AddCommMonoid G.Cochar := sorry

/-- ReductiveGroups (stand-in): the action of `Γ = Gal(Ē|E)` on `X_*(T)⁺`, restricted to `W_E`
(which has the same orbits, as the action factors through a finite quotient). -/
instance (G : RedGrp F) : MulAction F.WeilGroup G.Cochar := sorry

/-- ReductiveGroups (stand-in): `μ ↦ -w₀μ`, the dominant representative of `μ⁻¹`. -/
def Cochar.dual {G : RedGrp F} (μ : G.Cochar) : G.Cochar := sorry

/-- ReductiveGroups: `μ ↦ -w₀μ` is an involution. -/
theorem Cochar.dual_dual {G : RedGrp F} (μ : G.Cochar) : μ.dual.dual = μ := sorry

/-- ReductiveGroups (stand-in): `⟨2ρ, μ⟩`. -/
def Cochar.twoRho {G : RedGrp F} : G.Cochar →+ ℕ := sorry

/-- `μ` is minuscule (possibly central): there is no dominant `μ' < μ`. -/
def Cochar.IsMinuscule {G : RedGrp F} (μ : G.Cochar) : Prop := IsMin μ

/-- ReductiveGroups (stand-in): the dominant representative `f(μ)` of the conjugacy class of
`f ∘ μ`, for a homomorphism `f : G → H`. -/
def Cochar.map {G H : RedGrp F} (f : G ⟶ H) : G.Cochar → H.Cochar := sorry

/-- ReductiveGroups (stand-in): the field of definition `E_μ` of the conjugacy class of `μ`, the
fixed field of its stabiliser in `Γ`; a finite extension of `E`. -/
def reflexField (G : RedGrp F) (μ : G.Cochar) : LocalField p := sorry

/-- ReductiveGroups (stand-in): `E ⊂ E_μ`. -/
def reflexExt (G : RedGrp F) (μ : G.Cochar) : F.Ext (G.reflexField μ) := sorry

/-- The base `∏_{i ∈ I} Spd Ĕ_{μ_i}` of the legs of a tuple of cocharacters, the product over
`Spd k`. -/
abbrev legBase (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) : VSheaf p :=
  ∏ᶜ fun i : I => (G.reflexField (μ i)).spdBreve

/-- The map `∏ Spd Ĕ_{μ_i} → (Div¹_E)^I`. -/
def legBaseToDiv1 (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    G.legBase μ ⟶ Div1.pow F I :=
  Pi.lift fun i => Pi.π _ i ≫ (G.reflexExt (μ i)).spdBreveMap ≫ Div1.proj F

/-- BunGAndNewtonStrata BG1 (stand-in): `π₁(G)_Γ`, the coinvariants of the algebraic fundamental
group; it is the set of connected components of `Bun_G`. -/
def pi1 (G : RedGrp F) : Type := sorry

instance (G : RedGrp F) : AddCommGroup G.pi1 := sorry

/-- BG1 (stand-in): `μ ↦ μ♯`, the image of `μ` under `X_*(T) → π₁(G) → π₁(G)_Γ`. -/
def Cochar.sharp {G : RedGrp F} : G.Cochar →+ G.pi1 := sorry

/-- BG1 (stand-in): the Kottwitz map `κ : B(G) → π₁(G)_Γ`, normalised as in Fargues–Scholze
III.2.2: for `GL_n` it is the valuation of the determinant, and the first Chern class of `E_b` is
`-κ(b)`. -/
def kottwitz (G : RedGrp F) : G.BofG → G.pi1 := sorry

/-- BG1 (stand-in): the cone `(X_*(T)_ℚ⁺)^Γ` of rational dominant Galois-invariant cocharacters,
in which Newton points lie, with its dominance order. -/
def NewtonCone (G : RedGrp F) : Type := sorry

instance (G : RedGrp F) : PartialOrder G.NewtonCone := sorry
instance (G : RedGrp F) : AddCommMonoid G.NewtonCone := sorry

/-- BG1 (stand-in): the Newton point `ν_b`. -/
def newton (G : RedGrp F) : G.BofG → G.NewtonCone := sorry

/-- BG1 (stand-in): the Galois average `μ^♦` of a dominant cocharacter. -/
def Cochar.diamond {G : RedGrp F} (μ : G.Cochar) : G.NewtonCone := sorry

/-- BG1 (stand-in): the basic elements of `B(G)`, those whose Newton point is central. -/
def basic (G : RedGrp F) : Set G.BofG := sorry

/-- The Kottwitz set `B(G, μ) = {b | κ(b) = μ♯, ν_b ≤ μ^♦}`. -/
def BGmu (G : RedGrp F) (μ : G.Cochar) : Set G.BofG :=
  {b | G.kottwitz b = Cochar.sharp μ ∧ G.newton b ≤ μ.diamond}

/-- ReductiveGroups (stand-in): cocharacters of `𝔾_m`, `n ↦ (z ↦ zⁿ)`. -/
def Gm.cochar (F : LocalField p) : ℤ ≃+ (Gm F).Cochar := sorry

/-- BG1 (stand-in): `π₁(𝔾_m) = ℤ`, compatibly with `Gm.cochar`. -/
def Gm.pi1Equiv (F : LocalField p) : (Gm F).pi1 ≃+ ℤ := sorry

/-- BG1: for `𝔾_m`, `μ♯` is the integer of the cocharacter. -/
theorem Gm.pi1Equiv_sharp (F : LocalField p) (n : ℤ) :
    Gm.pi1Equiv F (Cochar.sharp (Gm.cochar F n)) = n := sorry

/-- BG1: for `𝔾_m`, `κ(b)` is the valuation of `b ∈ Ĕ^×`. -/
theorem Gm.pi1Equiv_kottwitz (F : LocalField p) (b : (Gm F).ptsBreve) :
    Gm.pi1Equiv F ((Gm F).kottwitz (BofG.mk b)) =
      Multiplicative.toAdd (F.valBreve (Gm.ptsBreveEquiv F b)) := sorry

/-- ReductiveGroups (stand-in): dominant cocharacters of `GL_n`, the decreasing tuples
`μ_1 ≥ … ≥ μ_n`. -/
def GLn.cochar (F : LocalField p) (n : ℕ) : {v : Fin n → ℤ // Antitone v} ≃ (GLn F n).Cochar :=
  sorry

end RedGrp

/-! ### The dual group side -/

section DualGroup

variable {F : LocalField p}

/-- GeometricSatakeAndFusion GS4 (stand-in): `Rep_Λ((Ĝ ⋊ Q)^I)`, the exact category of algebraic
representations on finite projective `Λ`-modules of the `I`-th power of `Ĝ ⋊ Q`, for `Ĝ` the
pinned dual group over `ℤ_ℓ` and `Q` a finite quotient of `W_E` through which the action on `Ĝ`
factors. Its tensor product is the tensor product over `Λ`; every object has a dual, the
contragredient `Vᘁ`. -/
def SatRep (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] : Type 1 := sorry

/-- GS4 (stand-in): `Rep_Λ(Ĝ^I)`, the representations of the `I`-th power of the dual group
alone; the Satake category at a geometric point of the legs. -/
def GeomSatRep (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] : Type 1 := sorry

/-- GS4 (stand-in): `Rep_Λ(Q^I)`, the representations of `Q^I` on finite projective
`Λ`-modules. -/
def WeilQuotRep (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] : Type 1 := sorry

variable (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I]

instance : LargeCategory (SatRep G Λ I) := sorry
instance : Preadditive (SatRep G Λ I) := sorry
instance : Linear Λ.carrier (SatRep G Λ I) := sorry
instance : HasFiniteBiproducts (SatRep G Λ I) := sorry
instance : MonoidalCategory (SatRep G Λ I) := sorry
instance : SymmetricCategory (SatRep G Λ I) := sorry
instance : RigidCategory (SatRep G Λ I) := sorry

instance : LargeCategory (GeomSatRep G Λ I) := sorry
instance : Preadditive (GeomSatRep G Λ I) := sorry
instance : Linear Λ.carrier (GeomSatRep G Λ I) := sorry
instance : HasFiniteBiproducts (GeomSatRep G Λ I) := sorry
instance : MonoidalCategory (GeomSatRep G Λ I) := sorry
instance : SymmetricCategory (GeomSatRep G Λ I) := sorry
instance : RigidCategory (GeomSatRep G Λ I) := sorry

instance : LargeCategory (WeilQuotRep G Λ I) := sorry
instance : Preadditive (WeilQuotRep G Λ I) := sorry
instance : Linear Λ.carrier (WeilQuotRep G Λ I) := sorry
instance : MonoidalCategory (WeilQuotRep G Λ I) := sorry
instance : SymmetricCategory (WeilQuotRep G Λ I) := sorry
instance : RigidCategory (WeilQuotRep G Λ I) := sorry

/-- GS4 (stand-in): the underlying `Λ`-module of a representation. -/
def SatRep.forget : SatRep G Λ I ⥤ ModuleCat.{0} Λ.carrier := sorry

/-- GS4 (stand-in): the underlying `Λ`-module of a representation of `Ĝ^I`. -/
def GeomSatRep.forget : GeomSatRep G Λ I ⥤ ModuleCat.{0} Λ.carrier := sorry

/-- GS4 (stand-in): the underlying `Λ`-module of a representation of `Q^I`. -/
def WeilQuotRep.forget : WeilQuotRep G Λ I ⥤ ModuleCat.{0} Λ.carrier := sorry

/-- GS4 (stand-in): restriction along `Ĝ^I → (Ĝ ⋊ Q)^I`. -/
def SatRep.toGeom : SatRep G Λ I ⥤ GeomSatRep G Λ I := sorry

instance : (SatRep.toGeom G Λ I).Monoidal := sorry
instance : (SatRep.toGeom G Λ I).Additive := sorry

/-- GS4 (stand-in): inflation along `(Ĝ ⋊ Q)^I → Q^I`. -/
def SatRep.inflate : WeilQuotRep G Λ I ⥤ SatRep G Λ I := sorry

instance : (SatRep.inflate G Λ I).Monoidal := sorry
instance : (SatRep.inflate G Λ I).Additive := sorry

/-- GS4 (stand-in): for a map `ζ : I → J` of finite sets, restriction `ζ^*` along
`(Ĝ ⋊ Q)^J → (Ĝ ⋊ Q)^I`, `(g_j) ↦ (g_{ζ(i)})`. -/
def SatRep.res {I J : Type} [Finite I] [Finite J] (ζ : I → J) : SatRep G Λ I ⥤ SatRep G Λ J :=
  sorry

instance {I J : Type} [Finite I] [Finite J] (ζ : I → J) : (SatRep.res G Λ ζ).Monoidal := sorry
instance {I J : Type} [Finite I] [Finite J] (ζ : I → J) : (SatRep.res G Λ ζ).Additive := sorry

/-- GS4 (stand-in): restriction along `Ĝ^J → Ĝ^I` for a map `ζ : I → J`. -/
def GeomSatRep.res {I J : Type} [Finite I] [Finite J] (ζ : I → J) :
    GeomSatRep G Λ I ⥤ GeomSatRep G Λ J := sorry

instance {I J : Type} [Finite I] [Finite J] (ζ : I → J) : (GeomSatRep.res G Λ ζ).Monoidal :=
  sorry

/-- GS4 (stand-in): the exterior tensor product `⊠_{i ∈ I} V_i`, the tensor product of the
inflations of the `V_i` along the projections. -/
def SatRep.boxtimes {I : Type} [Finite I] (V : I → SatRep G Λ Unit) : SatRep G Λ I := sorry

/-- GS4 (stand-in): the exterior tensor product of representations of `Ĝ`. -/
def GeomSatRep.boxtimes {I : Type} [Finite I] (V : I → GeomSatRep G Λ Unit) : GeomSatRep G Λ I :=
  sorry

/-- GeometricSatakeAndFusion GS4, chevalley-involution (stand-in): the autoequivalence `sw^*` of
`Rep_Λ(Ĝ^I)` that corresponds under the Satake equivalence to pullback along the involution of the
Hecke stack exchanging the two bundles; on each factor it is induced by the Chevalley involution of
`Ĝ` composed with conjugation by `ρ̂(-1)` (Fargues–Scholze VI.12.1). -/
def GeomSatRep.sw : GeomSatRep G Λ I ≌ GeomSatRep G Λ I := sorry

instance : (GeomSatRep.sw G Λ I).functor.Monoidal := sorry

/-- GS4 with the requested ReductiveGroupsIntegralRepresentationsPartII extension (stand-in): the representation `V_μ` of `Ĝ` over `Λ`
that the Satake equivalence attaches to the Schubert variety of `μ`, the closure of the
`L⁺G`-orbit of `μ(ξ)`; its highest weight is `μ` in the owner's identification of `X_*(T)` with
the characters of the dual torus. -/
def GeomSatRep.highestWeight (μ : G.Cochar) : GeomSatRep G Λ Unit := sorry

/-- GS4 (stand-in): for a `Γ`-invariant `μ`, the representation `V_μ` of `Ĝ ⋊ Q` that the Satake
equivalence attaches to the Schubert variety of `μ` (see `GeomSatRep.highestWeight`), on which
`Q` acts through the pinning. -/
def SatRep.highestWeight (μ : G.Cochar) (hμ : ∀ w : F.WeilGroup, w • μ = μ) : SatRep G Λ Unit :=
  sorry

/-- GS4 (stand-in): the character `z ↦ zⁿ` of the dual group `𝔾_m` of `𝔾_m`, with `Q` acting
trivially. -/
def SatRep.char (F : LocalField p) (Λ : Coeff F ℓ) (n : ℤ) : SatRep (RedGrp.Gm F) Λ Unit := sorry

/-- GS4 (stand-in): the standard representation of the dual group `SL_n` of `PGL_n`, with `Q`
acting trivially. -/
def SatRep.std (F : LocalField p) (Λ : Coeff F ℓ) (n : ℕ) : SatRep (RedGrp.PGLn F n) Λ Unit := sorry

/-- GS4 (stand-in): the standard representation of the dual group `GL_n` of `GL_n`, with `Q`
acting trivially. -/
def SatRep.stdGL (F : LocalField p) (Λ : Coeff F ℓ) (n : ℕ) : SatRep (RedGrp.GLn F n) Λ Unit :=
  sorry

/-- ReductiveGroups (stand-in): the minuscule dominant cocharacter of `PGL_n` whose Schubert
variety corresponds under the Satake equivalence to the standard representation of `SL_n`. -/
def RedGrp.PGLn.fundamental (F : LocalField p) (n : ℕ) : (RedGrp.PGLn F n).Cochar := sorry

/-- GS4 (stand-in): extension of scalars `V ↦ V ⊗_Λ Λ'` along a homomorphism of coefficient
rings. -/
def SatRep.baseChange {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') : SatRep G Λ I ⥤ SatRep G Λ' I := sorry

instance {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') : (SatRep.baseChange G I φ).Monoidal := sorry

end DualGroup

/-! ### Solid, lisse and étale sheaves on small v-stacks

`D_■(X, Λ)` and its subcategories are categories here, the homotopy categories of the stable
∞-categories of the owner, with their triangulated structure. In such a category the limits and
colimits that exist are products and coproducts; "commutes with all colimits" for an exact functor
of the ∞-categories reads "is triangulated and commutes with coproducts". As morphisms of v-stacks
are taken up to 2-isomorphism, a pullback functor is determined up to a non-unique isomorphism;
the isomorphisms `DSolid.pullbackComp` are choices. -/

section Sheaves

variable {F : LocalField p}

/-- VStackSheavesAndLisseCategories VS2 (stand-in): `D_■(X, Λ)`, solid sheaves on a small v-stack
(Fargues–Scholze VII.1–VII.2). The name is that of `VStackSheavesAndLisseCategories.lean`. -/
def DSolid (X : VStack p) (Λ : Coeff F ℓ) : Type 1 := sorry

section
variable (X : VStack p) (Λ : Coeff F ℓ)

instance : LargeCategory (DSolid X Λ) := sorry
instance : Preadditive (DSolid X Λ) := sorry
instance : Linear Λ.carrier (DSolid X Λ) := sorry
instance : HasZeroObject (DSolid X Λ) := sorry
instance : HasShift (DSolid X Λ) ℤ := sorry
instance (n : ℤ) : (shiftFunctor (DSolid X Λ) n).Additive := sorry
instance : Pretriangulated (DSolid X Λ) := sorry
instance : IsTriangulated (DSolid X Λ) := sorry
instance (J : Type) : HasColimitsOfShape (Discrete J) (DSolid X Λ) := sorry
instance (J : Type) : HasLimitsOfShape (Discrete J) (DSolid X Λ) := sorry

/-- VS2 (stand-in): the solid tensor product `⊗^■_Λ`; its unit is the constant sheaf `Λ`. -/
instance : MonoidalCategory (DSolid X Λ) := sorry

instance : SymmetricCategory (DSolid X Λ) := sorry

/-- VS2 (stand-in): the internal Hom of solid sheaves. -/
instance : MonoidalClosed (DSolid X Λ) := sorry

end

/-- The solid dual `A^∨ = RHom_{D_■}(A, Λ)`. -/
abbrev DSolid.dual {X : VStack p} {Λ : Coeff F ℓ} (A : DSolid X Λ) : DSolid X Λ :=
  (ihom A).obj (𝟙_ _)

/-- VS2 (stand-in): the pullback `f^*`. -/
def DSolid.pullback {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : DSolid Y Λ ⥤ DSolid X Λ :=
  sorry

instance {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : (DSolid.pullback f Λ).Monoidal := sorry
instance {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : (DSolid.pullback f Λ).Additive := sorry

/-- VS2 (stand-in): `id^* ≅ id`. -/
def DSolid.pullbackId (X : VStack p) (Λ : Coeff F ℓ) : DSolid.pullback (𝟙 X) Λ ≅ 𝟭 _ := sorry

/-- VS2 (stand-in): `(g ∘ f)^* ≅ f^* ∘ g^*`. -/
def DSolid.pullbackComp {X Y Z : VStack p} (f : X ⟶ Y) (g : Y ⟶ Z) (Λ : Coeff F ℓ) :
    DSolid.pullback (f ≫ g) Λ ≅ DSolid.pullback g Λ ⋙ DSolid.pullback f Λ := sorry

/-- VS2 (stand-in): relative homology `f_♮`, the left adjoint of `f^*`, which exists for every map
of small v-stacks (Fargues–Scholze VII.3.1). The name is that of
`VStackSheavesAndLisseCategories.lean`. -/
def DSolid.sharp {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : DSolid X Λ ⥤ DSolid Y Λ := sorry

/-- VS2 (stand-in): `f_♮ ⊣ f^*`. -/
def DSolid.sharpAdj {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) :
    DSolid.sharp f Λ ⊣ DSolid.pullback f Λ := sorry

/-- VS2 (stand-in): the pushforward `Rf_*`, the right adjoint of `f^*`. -/
def DSolid.pushforward {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : DSolid X Λ ⥤ DSolid Y Λ :=
  sorry

/-- VS2 (stand-in): `f^* ⊣ Rf_*`. -/
def DSolid.pullbackAdj {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) :
    DSolid.pullback f Λ ⊣ DSolid.pushforward f Λ := sorry

/-- VS2 (stand-in): the half Tate twist `A ↦ A(n/2)`, defined with the chosen `√q`; `A(1)` is the
Tate twist. -/
def DSolid.halfTwist (X : VStack p) (Λ : Coeff F ℓ) (n : ℤ) : DSolid X Λ ≌ DSolid X Λ := sorry

/-- VS2 (stand-in): extension of scalars `A ↦ A ⊗^■_Λ Λ'`. -/
def DSolid.extendScalars (X : VStack p) {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') :
    DSolid X Λ ⥤ DSolid X Λ' := sorry

instance (X : VStack p) {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') :
    (DSolid.extendScalars X φ).Monoidal := sorry

/-- VS2 (stand-in): restriction of scalars. -/
def DSolid.restrictScalars (X : VStack p) {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') :
    DSolid X Λ' ⥤ DSolid X Λ := sorry

/-- VS2 (stand-in): extension of scalars is left adjoint to restriction of scalars. -/
def DSolid.scalarsAdj (X : VStack p) {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') :
    DSolid.extendScalars X φ ⊣ DSolid.restrictScalars X φ := sorry

/-- VStackSheavesAndLisseCategories VS3 (stand-in): the lisse objects of `D_■(X, Λ)`, the smallest
full subcategory stable under shifts, cones and direct sums that contains `f_♮Λ` for `f` separated,
representable in locally spatial diamonds and `ℓ`-cohomologically smooth (Fargues–Scholze
VII.6.1). -/
def DSolid.isLisse (X : VStack p) (Λ : Coeff F ℓ) : ObjectProperty (DSolid X Λ) := sorry

instance (X : VStack p) (Λ : Coeff F ℓ) : (DSolid.isLisse X Λ).IsTriangulated := sorry
instance (X : VStack p) (Λ : Coeff F ℓ) : (DSolid.isLisse X Λ).IsMonoidal := sorry

/-- VS3: `D_lis(X, Λ)`, the full subcategory of lisse objects, with the triangulated and monoidal
structures that Mathlib gives a full subcategory. The name is that of
`VStackSheavesAndLisseCategories.lean`. -/
abbrev Dlis (X : VStack p) (Λ : Coeff F ℓ) : Type 1 := (DSolid.isLisse X Λ).FullSubcategory

/-- The inclusion `D_lis(X, Λ) ⊂ D_■(X, Λ)`. -/
abbrev Dlis.toSolid (X : VStack p) (Λ : Coeff F ℓ) : Dlis X Λ ⥤ DSolid X Λ :=
  (DSolid.isLisse X Λ).ι

/-- VS3: `D_lis` is stable under direct sums. -/
instance (X : VStack p) (Λ : Coeff F ℓ) (J : Type) :
    HasColimitsOfShape (Discrete J) (Dlis X Λ) := sorry

/-- VS3: pullback preserves lisse objects (Fargues–Scholze VII.6.2). -/
def Dlis.pullback {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : Dlis Y Λ ⥤ Dlis X Λ :=
  ObjectProperty.lift _ (Dlis.toSolid Y Λ ⋙ DSolid.pullback f Λ) (fun _ => sorry)

/-- VStackSheavesAndLisseCategories VS4: the compact objects of `D_lis(X, Λ)`. -/
abbrev Dlis.isCompact (X : VStack p) (Λ : Coeff F ℓ) : ObjectProperty (Dlis X Λ) :=
  isCompactObject _

/-- VS3 (stand-in): the lisse dual `RHom_lis(A, Λ)`, the right adjoint of `D_lis ⊂ D_■` applied
to the solid dual. -/
def Dlis.dual (X : VStack p) (Λ : Coeff F ℓ) : (Dlis X Λ)ᵒᵖ ⥤ Dlis X Λ := sorry

/-- VS3 (stand-in): `D_lis(∗, Λ) ≃ D(Λ)` (Fargues–Scholze VII.6.5). -/
def Dlis.pointEquiv (Λ : Coeff F ℓ) : Dlis (⊤_ (VStack p)) Λ ≌ DMod Λ.carrier := sorry

/-- VS3 (stand-in): the complex `RHom(A, B) ∈ D(Λ)` of morphisms in the `Λ`-linear stable
∞-category `D_lis(X, Λ)`. -/
def Dlis.RHom {X : VStack p} {Λ : Coeff F ℓ} (A B : Dlis X Λ) : DMod Λ.carrier := sorry

/-- VStackSheavesAndLisseCategories VS5 (stand-in): `π_♮ : D_lis(X, Λ) → D_lis(∗, Λ) ≃ D(Λ)` for
the projection `π : X → ∗`; for `X = Bun_G` or one of its strata, where `π_♮` preserves lisse
objects (Fargues–Scholze VII.7). -/
def Dlis.homology (X : VStack p) (Λ : Coeff F ℓ) : Dlis X Λ ⥤ DMod Λ.carrier := sorry

/-- DiamondSixOperations with VS2 (stand-in): the objects of `D_■(X, Λ)` that come from
`D_ét(X, Λ)`, for `Λ` killed by a power of `ℓ` (Fargues–Scholze VII.1); for other `Λ` the
property is the owner's choice and no statement uses it. -/
def DSolid.isEtale (X : VStack p) (Λ : Coeff F ℓ) : ObjectProperty (DSolid X Λ) := sorry

instance (X : VStack p) (Λ : Coeff F ℓ) : (DSolid.isEtale X Λ).IsTriangulated := sorry
instance (X : VStack p) (Λ : Coeff F ℓ) : (DSolid.isEtale X Λ).IsMonoidal := sorry

/-- `D_ét(X, Λ)` as a full subcategory of `D_■(X, Λ)`, for torsion `Λ`. The name is that of
`VStackSheavesAndLisseCategories.lean`. -/
abbrev Det (X : VStack p) (Λ : Coeff F ℓ) : Type 1 := (DSolid.isEtale X Λ).FullSubcategory

/-- The inclusion `D_ét(X, Λ) ⊂ D_■(X, Λ)`. -/
abbrev Det.toSolid (X : VStack p) (Λ : Coeff F ℓ) : Det X Λ ⥤ DSolid X Λ :=
  (DSolid.isEtale X Λ).ι

/-- Pullback preserves étale objects. -/
def Det.pullback {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : Det Y Λ ⥤ Det X Λ :=
  ObjectProperty.lift _ (Det.toSolid Y Λ ⋙ DSolid.pullback f Λ) (fun _ => sorry)

/-- DiamondSixOperations S1 (stand-in): the étale pushforward `Rf_*` on `D_ét`. -/
def Det.pushforward {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : Det X Λ ⥤ Det Y Λ := sorry

/-- DiamondSixOperations S2 (stand-in): `Rf_!`, for `f` compactifiable, representable in locally
spatial diamonds and locally of finite `dim.trg`; for other `f` no statement uses it. -/
def Det.shriek {X Y : VStack p} (f : X ⟶ Y) (Λ : Coeff F ℓ) : Det X Λ ⥤ Det Y Λ := sorry

/-- DiamondSixOperations S3 (stand-in): the relative Verdier dual `D_{X/S}(A) = RHom(A, Rf^!Λ)`,
under the hypotheses of `Det.shriek`. -/
def Det.verdierDual {X S : VStack p} (f : X ⟶ S) (Λ : Coeff F ℓ) : (Det X Λ)ᵒᵖ ⥤ Det X Λ := sorry

/-- DiamondSixOperations S4 (stand-in): the objects that are universally locally acyclic over
`S`. -/
def Det.isULA {X S : VStack p} (f : X ⟶ S) (Λ : Coeff F ℓ) : ObjectProperty (Det X Λ) := sorry

end Sheaves

/-! ### Smooth representations -/

section SmoothRepresentations

variable {F : LocalField p}

/-- VStackSheavesAndLisseCategories VS4 (stand-in): `D(H, Λ)`, the derived category of smooth
representations of a locally profinite group `H` on `Λ`-modules. -/
def DSmooth (H : Type) [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (Λ : Coeff F ℓ) :
    Type 1 := sorry

variable (H : Type) [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (Λ : Coeff F ℓ)

instance : LargeCategory (DSmooth H Λ) := sorry
instance : Preadditive (DSmooth H Λ) := sorry
instance : Linear Λ.carrier (DSmooth H Λ) := sorry
instance : HasZeroObject (DSmooth H Λ) := sorry
instance : HasShift (DSmooth H Λ) ℤ := sorry
instance (n : ℤ) : (shiftFunctor (DSmooth H Λ) n).Additive := sorry
instance : Pretriangulated (DSmooth H Λ) := sorry
instance (J : Type) : HasColimitsOfShape (Discrete J) (DSmooth H Λ) := sorry

/-- VS4 (stand-in): the compact induction `c-Ind_K^H Λ` of the trivial representation of an open
subgroup `K`, in degree `0`. -/
def DSmooth.cInd (K : OpenSubgroup H) : DSmooth H Λ := sorry

/-- VS4 (stand-in): the derived `K`-invariants, for an open subgroup `K`; exact when `K` is
pro-`p`. -/
def DSmooth.invariants (K : OpenSubgroup H) : DSmooth H Λ ⥤ DMod Λ.carrier := sorry

/-- VS4 (stand-in): the underlying complex of `Λ`-modules. -/
def DSmooth.forget : DSmooth H Λ ⥤ DMod Λ.carrier := sorry

/-- VS4 (stand-in): restriction along a continuous homomorphism with open image and compact
kernel, in particular along the inclusion of an open subgroup. -/
def DSmooth.res {H' : Type} [Group H'] [TopologicalSpace H'] [IsTopologicalGroup H']
    (φ : H' →ₜ* H) : DSmooth H Λ ⥤ DSmooth H' Λ := sorry

/-- VS4 (stand-in): `D(H, Λ) ≃ D_lis([∗/underline H], Λ)`, for `H` with an open pro-`p` subgroup
(Fargues–Scholze V.1.1 and VII.7.1). -/
def DSmooth.equivClassifying : DSmooth H Λ ≌ Dlis (VStack.classifying p H) Λ := sorry

end SmoothRepresentations

/-! ### `Bun_G`, the local Hecke stack and the affine Grassmannian -/

section Stacks

variable {F : LocalField p}

/-- BunGAndNewtonStrata BG2 (stand-in): the small v-stack `Bun_G` of `G`-bundles on the relative
Fargues–Fontaine curve. The name is that of `BunGAndNewtonStrata.lean`. -/
def BunG (G : RedGrp F) : VStack p := sorry

/-- BG2 with RelativeFarguesFontaine RF4 (stand-in): the pushout of bundles `f_* : Bun_G → Bun_H`
along a homomorphism `f : G → H`. -/
def BunG.map {G H : RedGrp F} (f : G ⟶ H) : BunG G ⟶ BunG H := sorry

/-- BunGAndNewtonStrata BG3 (stand-in): the Newton stratum `Bun_G^b`. -/
def BunG.stratum (G : RedGrp F) (b : G.BofG) : VStack p := sorry

/-- BG3 (stand-in): the inclusion `i^b : Bun_G^b → Bun_G`. -/
def BunG.stratumIncl (G : RedGrp F) (b : G.BofG) : BunG.stratum G b ⟶ BunG G := sorry

/-- BG3: the inclusion of a stratum is a locally closed immersion. -/
theorem BunG.stratumIncl_locallyClosedImmersion (G : RedGrp F) (b : G.BofG) :
    VStack.locallyClosedImmersion p (BunG.stratumIncl G b) := sorry

/-- BG3: the inclusion of a basic stratum is an open immersion. -/
theorem BunG.stratumIncl_openImmersion (G : RedGrp F) (b : G.BofG) (hb : b ∈ G.basic) :
    VStack.openImmersion p (BunG.stratumIncl G b) := sorry

/-- BunGAndNewtonStrata BG2 (stand-in): the open and closed substack `Bun_G^{κ = c}`. -/
def BunG.component (G : RedGrp F) (c : G.pi1) : VStack p := sorry

/-- BG2 (stand-in): the inclusion of `Bun_G^{κ = c}`, an open and closed immersion. -/
def BunG.componentIncl (G : RedGrp F) (c : G.pi1) : BunG.component G c ⟶ BunG G := sorry

/-- BunGAndNewtonStrata BG0 (stand-in): the point `x_b : ∗ → Bun_G` given by the bundle `E_b`. -/
def BunG.point (G : RedGrp F) (b : G.ptsBreve) : ⊤_ (VStack p) ⟶ BunG G := sorry

/-- BG3 (stand-in): `[∗/underline{J_b(E)}] → Bun_G^b`, given by `E_b` with its action of `J_b(E)`;
an equivalence when `b` is basic. -/
def BunG.classifyingToStratum (G : RedGrp F) (b : G.ptsBreve) :
    VStack.classifying p (G.sigmaCentralizer b) ⟶ BunG.stratum G (RedGrp.BofG.mk b) := sorry

/-- BunGAndNewtonStrata BG2 (stand-in): over a geometric point, isomorphism classes of `G`-bundles
are classified by `B(G)` through `b ↦ E_b` (Fargues–Scholze III.2.3). -/
def BunG.geomPtsEquiv (G : RedGrp F) (s : Perfd.GeomPoint p) : (BunG G).geomPts s ≃ G.BofG := sorry

/-- BunGAndNewtonStrata BG0, pure-inner-twisting (stand-in): for `b` basic, the equivalence
`τ_b : Bun_G ≃ Bun_{G_b}`, `E ↦ Isom_G(E, E_b)` (Fargues–Scholze III.4.3). -/
def BunG.innerTwist (G : RedGrp F) (b : G.ptsBreve) (hb : RedGrp.BofG.mk b ∈ G.basic) :
    BunG G ≅ BunG (G.innerForm b) := sorry

/-- `X_I = Bun_G × (Div¹)^I`. -/
abbrev BunGLegs (G : RedGrp F) (I : Type) [Finite I] : VStack p := BunG G ⨯ Div1.stack F I

/-- `Bun_G × Spd C`. -/
abbrev BunGC (G : RedGrp F) : VStack p := BunG G ⨯ (VSheaf.toStack p).obj F.spdC

/-- `id × x : Bun_G × Spd C → Bun_G × (Div¹)^I` for the diagonal geometric point `x`. -/
def BunGC.toLegs (G : RedGrp F) (I : Type) [Finite I] : BunGC G ⟶ BunGLegs G I :=
  prod.map (𝟙 _) ((VSheaf.toStack p).map (Div1.geomPointPow F I))

/-- VStackSheavesAndLisseCategories VS4: pullback `D_lis(Bun_G, Λ) → D_lis(Bun_G × Spd C, Λ)` is
an equivalence (Fargues–Scholze VII.7.3). -/
theorem BunGC.isEquivalence_pullback (G : RedGrp F) (Λ : Coeff F ℓ) :
    (Dlis.pullback (prod.fst : BunGC G ⟶ BunG G) Λ).IsEquivalence := sorry

/-- VStackSheavesAndLisseCategories VS5 (stand-in): Bernstein–Zelevinsky duality `D_BZ`, defined
on the compact objects of `D_lis(Bun_G, Λ)` by `RHom(D_BZ(A), B) ≅ π_♮(A ⊗^■ B)` (Fargues–Scholze
VII.7.6); on non-compact objects no statement uses it. -/
def BunG.dBZ (G : RedGrp F) (Λ : Coeff F ℓ) : (Dlis (BunG G) Λ)ᵒᵖ ⥤ Dlis (BunG G) Λ := sorry

variable (G : RedGrp F) (I : Type) [Finite I]

/-- GeometricSatakeAndFusion GS0 (stand-in): the local Hecke stack
`𝓗ck^I_G = [L⁺G \ LG / L⁺G]` over `(Div¹)^I` (Fargues–Scholze VI.1.6 and VI.9), parametrising two
`G`-torsors over `B⁺` of the legs with an isomorphism over `B`. The name `localHecke` is that of
`GeometricSatakeAndFusion--GS0.lean`. -/
def HckLoc (G : RedGrp F) (I : Type) [Finite I] : VStack p := sorry

/-- GS0 (stand-in): the map to the legs. -/
def HckLoc.legs : HckLoc G I ⟶ Div1.stack F I := sorry

/-- GS0 (stand-in): `[(Div¹)^I / L⁺G]`, the stack of `G`-torsors over `B⁺` of the legs. -/
def HckLoc.base (G : RedGrp F) (I : Type) [Finite I] : VStack p := sorry

/-- GS0 (stand-in): `[(Div¹)^I / L⁺G] → (Div¹)^I`. -/
def HckLoc.baseLegs : HckLoc.base G I ⟶ Div1.stack F I := sorry

/-- GS0 (stand-in): the map remembering the first torsor. -/
def HckLoc.source : HckLoc G I ⟶ HckLoc.base G I := sorry

/-- GS0 (stand-in): the map `q_2` remembering the second torsor. -/
def HckLoc.target : HckLoc G I ⟶ HckLoc.base G I := sorry

/-- GS0 (stand-in): the unit section, the identity modification. -/
def HckLoc.unit : HckLoc.base G I ⟶ HckLoc G I := sorry

/-- GS0 (stand-in): the involution exchanging the two torsors and inverting the isomorphism. -/
def HckLoc.swap : HckLoc G I ≅ HckLoc G I := sorry

/-- GS0, schubert-bounds-and-properness (stand-in): the substack of the local Hecke stack bounded
by a tuple `W` of finite `Γ`-stable sets of dominant cocharacters, closed under the dominance
order (Fargues–Scholze VI.2.6 and VI.10); for other `W` no statement uses it. -/
def HckLoc.bounded (W : I → Set G.Cochar) : VStack p := sorry

/-- GS0 (stand-in): the inclusion of the bounded substack, a closed immersion. -/
def HckLoc.boundedIncl (W : I → Set G.Cochar) : HckLoc.bounded G I W ⟶ HckLoc G I := sorry

/-- RelativeFarguesFontaine RF4 (stand-in): `c : Bun_G × (Div¹)^I → [(Div¹)^I / L⁺G]`, the
completion of a bundle along the sum of the legs. -/
def BunG.completion : BunGLegs G I ⟶ HckLoc.base G I := sorry

/-- GeometricSatakeAndFusion GS0 (stand-in): the Beilinson–Drinfeld affine Grassmannian `Gr^I_G`
over `(Div¹)^I`, the fibre of `q_2` over the trivial torsor. The name `grassmannian` is that of
`GeometricSatakeAndFusion--GS0.lean`. -/
def GrG (G : RedGrp F) (I : Type) [Finite I] : VSheaf p := sorry

/-- GS0 (stand-in): `Gr^I_G → (Div¹)^I`. -/
def GrG.legs : GrG G I ⟶ Div1.pow F I := sorry

/-- GS0 (stand-in): `Gr^I_{G,W}`, the closed subsheaf bounded by `W` as in `HckLoc.bounded`. -/
def GrG.bounded (W : I → Set G.Cochar) : VSheaf p := sorry

/-- GS0 (stand-in): the inclusion of the bounded subsheaf. -/
def GrG.boundedIncl (W : I → Set G.Cochar) : GrG.bounded G I W ⟶ GrG G I := sorry

variable {I}

/-- GS0 (stand-in): the Beilinson–Drinfeld Schubert variety `Gr_{G,≤μ•}` over
`∏_i Spd Ĕ_{μ_i}`, where the position at a leg is bounded by the sum of the `μ_j` over the legs
equal to it (Scholze–Weinstein 20.4.4); for one leg, `Gr_{G,Spd Ĕ_μ,≤μ}`. -/
def GrG.schubert (μ : I → G.Cochar) : VSheaf p := sorry

/-- GS0 (stand-in): the map to the base of the legs. -/
def GrG.schubertLegs (μ : I → G.Cochar) : GrG.schubert G μ ⟶ G.legBase μ := sorry

/-- GS0 (stand-in): the open Schubert cell `Gr_{G,μ}` of one leg, the locus of position exactly
`μ`. -/
def GrG.cell (G : RedGrp F) (μ : G.Cochar) : VSheaf p := sorry

/-- GS0 (stand-in): the open immersion of the Schubert cell. -/
def GrG.cellIncl (μ : G.Cochar) : GrG.cell G μ ⟶ GrG.schubert G (fun _ : Unit => μ) := sorry

/-- GS0 (stand-in): the convolution Schubert variety over `∏_i Spd Ĕ_{μ_i}` of successive
modifications bounded by `μ_1, …, μ_m` (Scholze–Weinstein 20.4.2). -/
def GrG.convSchubert {m : ℕ} (μ : Fin m → G.Cochar) : VSheaf p := sorry

/-- GS0 (stand-in): the map to the base of the legs. -/
def GrG.convSchubertLegs {m : ℕ} (μ : Fin m → G.Cochar) : GrG.convSchubert G μ ⟶ G.legBase μ :=
  sorry

variable (I)

/-- GeometricSatakeAndFusion GS4, enhanced-perfect-satake-extension (stand-in): the local solid
Satake kernel `V ↦ S'_V ∈ D_■(𝓗ck^I_G, Λ)`. For `Λ = ℤ_ℓ[√q]` it is `D(S_V)^∨`, the solid dual of
the Verdier dual, relative to `q_2`, of the normalised Satake sheaf; for general `Λ` it is the
unique exact `Rep_Λ(Q^I)`-linear monoidal extension (Fargues–Scholze IX.2, p. 321). -/
def satakeKernelLoc (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    SatRep G Λ I ⥤ DSolid (HckLoc G I) Λ := sorry

instance (Λ : Coeff F ℓ) : (satakeKernelLoc G Λ I).Additive := sorry

/-- GS4 (stand-in): the normalised Satake sheaf `V ↦ S_V ∈ D_ét(𝓗ck^I_G, Λ)`, for `Λ` killed by
a power of `ℓ`. -/
def satakeSheafLoc (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    SatRep G Λ I ⥤ Det (HckLoc G I) Λ := sorry

/-- GS4 with ClassFieldTheory (stand-in): `U ↦ L_U`, the local system on `(Div¹)^I` attached to a
representation of `Q^I` through `(Div¹)^I → [∗/W_E^I] → [∗/Q^I]`. -/
def WeilQuotRep.localSystem (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    WeilQuotRep G Λ I ⥤ DSolid (Div1.stack F I) Λ := sorry

instance (Λ : Coeff F ℓ) : (WeilQuotRep.localSystem G Λ I).Monoidal := sorry

end Stacks

/-! ### Rigid spaces -/

section RigidSpaces

/-- AdicSpaces (stand-in): rigid-analytic spaces over `Ĕ`, as adic spaces locally of finite type
over `Spa Ĕ`. -/
def RigSp (F : LocalField p) : Type 1 := sorry

instance (F : LocalField p) : LargeCategory (RigSp F) := sorry

variable (F : LocalField p)

/-- DiamondsAndVStacks D3 (stand-in): the diamond `M ↦ M^♦` over `Spd Ĕ`. -/
def RigSp.diamond : RigSp F ⥤ Over F.spdBreve := sorry

/-- AdicSpaces (stand-in): the underlying topological space. -/
def RigSp.toTop : RigSp F ⥤ TopCat.{0} := sorry

/-- AdicSpaces (stand-in): étale morphisms of rigid spaces. -/
def RigSp.etale : MorphismProperty (RigSp F) := sorry

/-- AdicSpaces (stand-in): finite étale morphisms all of whose geometric fibres have `d` points. -/
def RigSp.finiteEtaleOfDegree (d : ℕ) : MorphismProperty (RigSp F) := sorry

/-- AdicSpaces (stand-in): open immersions of rigid spaces. -/
def RigSp.openImmersion : MorphismProperty (RigSp F) := sorry

/-- AdicSpaces (stand-in): rigid spaces smooth over `Ĕ` of pure dimension `d`. -/
def RigSp.smoothOfDim (d : ℕ) : ObjectProperty (RigSp F) := sorry

/-- AdicSpaces (stand-in): rigid spaces partially proper over `Ĕ`. -/
def RigSp.partiallyProper : ObjectProperty (RigSp F) := sorry

/-- AdicSpaces (stand-in): quasicompact rigid spaces. -/
def RigSp.quasicompact : ObjectProperty (RigSp F) := sorry

/-- Huber's étale cohomology of adic spaces (stand-in): `RΓ_c(M_C, ℤ/ℓ^m)`, the compactly
supported cohomology of the base change of `M` to `C`, for `M` separated and taut. -/
def RigSp.RΓc {F : LocalField p} (M : RigSp F) (ℓ m : ℕ) : DMod (ZMod (ℓ ^ m)) := sorry

/-- Huber (stand-in): extension by zero `RΓ_c(U_C, ℤ/ℓ^m) → RΓ_c(M_C, ℤ/ℓ^m)` for an open
immersion `U → M`. -/
def RigSp.RΓcMap {F : LocalField p} {U M : RigSp F} (j : U ⟶ M) (hj : RigSp.openImmersion F j)
    (ℓ m : ℕ) : U.RΓc ℓ m ⟶ M.RΓc ℓ m := sorry

/-- ReductiveGroups with AdicSpaces (stand-in): the flag variety `Fl_{G,μ} = G/P_μ` over
`Ĕ_μ`, as a rigid space. -/
def RigSp.flag {F : LocalField p} (G : RedGrp F) (μ : G.Cochar) : RigSp (G.reflexField μ) := sorry

end RigidSpaces

/-! ### Further interfaces: automorphism groups, the Galois action on cocharacters, loci of
divisors, torsors with a Frobenius, and facts about the standard groups -/

section InterfacesForHeckeStacks

variable {F : LocalField p}

/-- DiamondsAndVStacks D4 (stand-in): the homomorphism of automorphism groups induced by a map of
v-stacks; it is defined up to inner automorphisms of the target. -/
def VStack.autMap {X Y : VStack p} (f : X ⟶ Y) (S : Perfd p)
    (x : ((VStack.isoClasses p).obj X).obj (op S)) :
    X.autGroup S x →* Y.autGroup S (((VStack.isoClasses p).map f).app (op S) x) := sorry

/-- ReductiveGroups: for a split group the Galois action on dominant cocharacters is trivial. -/
theorem RedGrp.smul_cochar_of_isSplit {G : RedGrp F} (hG : RedGrp.isSplit F G) (w : F.WeilGroup)
    (μ : G.Cochar) : w • μ = μ := sorry

/-- ReductiveGroups: the Galois action preserves the dominance order. -/
theorem RedGrp.smul_cochar_mono {G : RedGrp F} (w : F.WeilGroup) {μ ν : G.Cochar} (h : μ ≤ ν) :
    w • μ ≤ w • ν := sorry

/-- ReductiveGroups: the Galois action is additive. -/
theorem RedGrp.smul_cochar_add {G : RedGrp F} (w : F.WeilGroup) (μ ν : G.Cochar) :
    w • (μ + ν) = w • μ + w • ν := sorry

/-- ReductiveGroups: there are finitely many dominant cocharacters below a given one. -/
theorem RedGrp.finite_Iic_cochar {G : RedGrp F} (μ : G.Cochar) : (Set.Iic μ).Finite := sorry

/-- RelativeFarguesFontaine RF2, addition-and-disjoint-divisor-loci (stand-in): for an ordered
partition `part : I → Fin m` of the set of legs, the open subsheaf `(Div¹)^{I;I_1,…,I_m}` of
`(Div¹)^I` where `D_i` and `D_{i'}` are disjoint whenever `i` and `i'` lie in different parts. -/
def Div1.disjointLocus (F : LocalField p) {I : Type} [Finite I] {m : ℕ} (part : I → Fin m) :
    VSheaf p := sorry

/-- RF2 (stand-in): the open immersion of the disjoint locus. -/
def Div1.disjointLocusIncl (F : LocalField p) {I : Type} [Finite I] {m : ℕ} (part : I → Fin m) :
    Div1.disjointLocus F part ⟶ Div1.pow F I := sorry

/-- GeometricSatakeAndFusion GS0 (stand-in): the trivial torsor
`(Div¹)^I → [(Div¹)^I / L⁺G]`, an `L⁺G`-torsor. A map `x : S → [(Div¹)^I / L⁺G]` factors through
it exactly when the torsor of `x` is trivial. -/
def HckLoc.baseTrivial (G : RedGrp F) (I : Type) [Finite I] :
    Div1.stack F I ⟶ HckLoc.base G I := sorry

/-- GS0 (stand-in): the convolution affine Grassmannian `LG ×^{L⁺G} Gr_G` over `Div¹`, for one
leg (Fargues–Scholze VI.8). -/
def GrG.convolution (G : RedGrp F) : VSheaf p := sorry

/-- GS0 (stand-in): the map to the leg. -/
def GrG.convolutionLegs (G : RedGrp F) : GrG.convolution G ⟶ Div1.pow F Unit := sorry

/-- GS0 (stand-in): the multiplication map `LG ×^{L⁺G} Gr_G → Gr_G`. -/
def GrG.convolutionMult (G : RedGrp F) : GrG.convolution G ⟶ GrG G Unit := sorry

/-- RelativeFarguesFontaine RF4 (stand-in): the v-stack over `∏_i Spd Ĕ_{μ_i}` of pairs
`(P, φ)`: a `G`-torsor `P` on `S ×̇ Spa E = Y_{(0,∞)}(S)` and an isomorphism
`φ : Frob_S^*P ≅ P` over the complement of the untilts `S♯_i`, meromorphic along them. No bound is
imposed; `μ` enters only through the fields of definition. -/
def FrobTorsorY (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) : VStack p := sorry

/-- RF4 (stand-in): the untilts of a pair `(P, φ)`. -/
def FrobTorsorY.legs (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    FrobTorsorY G μ ⟶ (VSheaf.toStack p).obj (G.legBase μ) := sorry

/-- RF4 with RF3 (stand-in): the `G`-bundle on `X_S` to which `(P|_{Y_{[r,∞)}(S)}, φ)` descends,
for `r` large. -/
def FrobTorsorY.nearInfinity (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    FrobTorsorY G μ ⟶ BunG G := sorry

/-- RF4 with RF3 (stand-in): the `G`-bundle on `X_S` to which `(P|_{Y_{(0,ε]}(S)}, φ)` descends,
for `ε` small. -/
def FrobTorsorY.nearZero (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    FrobTorsorY G μ ⟶ BunG G := sorry

/-- BunGAndNewtonStrata BG2: `Bun_1 = ∗` for the trivial group. -/
def BunG.trivialIso (F : LocalField p) : BunG (RedGrp.trivial F) ≅ ⊤_ (VStack p) := sorry

/-- BunGAndNewtonStrata BG3 (stand-in): the open immersion
`j : [∗/underline{G(E)}] = Bun_G^1 → Bun_G` of the stratum of the trivial bundle. -/
def BunG.trivialStratum (G : RedGrp F) : VStack.classifying p G.pts ⟶ BunG G := sorry

instance (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    (SatRep.forget G Λ I).Additive := sorry

/-- VStackSheavesAndLisseCategories VS5 (stand-in): the objects of `D_lis(Bun_G, Λ)` that are
universally locally acyclic with respect to `Bun_G → ∗` (Fargues–Scholze VII.7.8). -/
def BunG.isULA (G : RedGrp F) (Λ : Coeff F ℓ) : ObjectProperty (Dlis (BunG G) Λ) := sorry

end InterfacesForHeckeStacks

section InterfacesForExamples

variable {F : LocalField p}

/-- ReductiveGroups: `𝔾_m` is split. -/
theorem RedGrp.isSplit_Gm (F : LocalField p) : RedGrp.isSplit F (RedGrp.Gm F) := sorry

/-- ReductiveGroups: `GL_n` is split. -/
theorem RedGrp.isSplit_GLn (F : LocalField p) (n : ℕ) : RedGrp.isSplit F (RedGrp.GLn F n) := sorry

/-- ReductiveGroups: `PGL_n` is split. -/
theorem RedGrp.isSplit_PGLn (F : LocalField p) (n : ℕ) : RedGrp.isSplit F (RedGrp.PGLn F n) :=
  sorry

/-- ReductiveGroups: `𝔾_m` is a torus. -/
theorem RedGrp.isTorus_Gm (F : LocalField p) : RedGrp.isTorus F (RedGrp.Gm F) := sorry

/-- DiamondsAndVStacks D4 (stand-in): maps from a perfectoid space `S` to a v-stack `X`, up to
2-isomorphism, are the isomorphism classes of objects of `X(S)` (the Yoneda lemma). -/
def VStack.homEquiv (X : VStack p) (S : Perfd p) :
    ((VSheaf.toStack p).obj ((VSheaf.ofPerfd p).obj S) ⟶ X) ≃
      ((VStack.isoClasses p).obj X).obj (op S) := sorry

/-- A geometric point as a v-stack. -/
abbrev Perfd.GeomPoint.stack (s : Perfd.GeomPoint p) : VStack p :=
  (VSheaf.toStack p).obj ((VSheaf.ofPerfd p).obj s.toPerfd)

/-- The map on isomorphism classes of objects over a geometric point induced by a map of
v-stacks. -/
abbrev VStack.geomPtsMap {X Y : VStack p} (f : X ⟶ Y) (s : Perfd.GeomPoint p) :
    X.geomPts s → Y.geomPts s :=
  ((VStack.isoClasses p).map f).app (op s.toPerfd)

/-- The class of a dominant cocharacter modulo the Galois action. -/
abbrev RedGrp.Cochar.orbit {G : RedGrp F} (μ : G.Cochar) :
    MulAction.orbitRel.Quotient F.WeilGroup G.Cochar :=
  Quotient.mk'' μ

end InterfacesForExamples

section InterfacesForLaterStages

variable {F : LocalField p}

/-! ### Conventions for the interfaces that follow

Definitions with no placeholder, used by the interfaces below and by stages HS2 to HS4: points of
v-sheaves, emptiness, actions of v-sheaves of groups and torsors under them, base change to
`Spd C`, the leg bases, and levels of `𝔾_m`. They are built on the stand-ins above, which is why
they stand here and not under "Conventions". -/

/-- The v-sheaf represented by a perfectoid space. -/
abbrev Perfd.sheaf (S : Perfd p) : VSheaf p := (VSheaf.ofPerfd p).obj S

/-- A v-sheaf as a v-stack. -/
abbrev VSheaf.stack (X : VSheaf p) : VStack p := (VSheaf.toStack p).obj X

/-- A map of v-sheaves as a map of v-stacks. -/
abbrev VSheaf.stackMap {X Y : VSheaf p} (f : X ⟶ Y) : X.stack ⟶ Y.stack := (VSheaf.toStack p).map f

/-- The constant v-sheaf `underline T` of a topological space, `S ↦ C(|S|, T)`; it is
`underline T × Spd k` over the base `Spd k`. -/
abbrev VSheaf.const (p : ℕ) [Fact p.Prime] (T : Type) [TopologicalSpace T] : VSheaf p :=
  (VSheaf.ofTop p).obj (TopCat.of T)

/-- The `S`-points of a v-sheaf. -/
abbrev VSheaf.pts (X : VSheaf p) (S : Perfd p) : Type := X.obj.obj (op S)

/-- The map on `S`-points of a morphism of v-sheaves. -/
abbrev VSheaf.ptsMap {X Y : VSheaf p} (f : X ⟶ Y) (S : Perfd p) : X.pts S → Y.pts S :=
  fun x => f.hom.app (op S) x

/-- The points of a v-sheaf over a geometric point `Spa(C, C⁺)`. -/
abbrev VSheaf.geomPts (X : VSheaf p) (s : Perfd.GeomPoint p) : Type := X.pts s.toPerfd

/-- The fibre over `y` of a morphism of v-sheaves, on the points over a geometric point. -/
abbrev VSheaf.geomFibre {X Y : VSheaf p} (f : X ⟶ Y) (s : Perfd.GeomPoint p) (y : Y.geomPts s) :
    Type :=
  {x : X.geomPts s // VSheaf.ptsMap f s.toPerfd x = y}

/-- A v-sheaf is empty: it is isomorphic to `underline ∅`. (Not: `X(S)` is empty for all `S`,
which fails at the empty perfectoid space.) -/
def VSheaf.IsEmpty (X : VSheaf p) : Prop := Nonempty (X ≅ VSheaf.const p Empty)

/-- The underlying topological space `|X|` of a v-sheaf. -/
abbrev VSheaf.top (X : VSheaf p) : TopCat.{0} := (VStack.toTop p).obj X.stack

/-- The continuous map `|X| → |Y|` of a morphism of v-sheaves. -/
abbrev VSheaf.topMap {X Y : VSheaf p} (f : X ⟶ Y) : C(X.top, Y.top) :=
  ((VStack.toTop p).map (VSheaf.stackMap f)).hom

/-- The v-sheaf of groups `underline H` of a topological group, as a presheaf of groups:
`S ↦ C(|S|, H)`. -/
def VSheaf.constGrp (p : ℕ) [Fact p.Prime] (H : Type) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] : (Perfd p)ᵒᵖ ⥤ GrpCat.{0} where
  obj S := GrpCat.of C((Perfd.toTop p).obj S.unop, H)
  map f := GrpCat.ofHom (ContinuousMap.compMonoidHom' ((Perfd.toTop p).map f.unop).hom)
  map_id S := by ext g x; simp
  map_comp f g := by ext h x; simp

/-- `underline H → underline H'` for a continuous homomorphism `H → H'`. -/
def VSheaf.constGrpMap (p : ℕ) [Fact p.Prime] {H H' : Type} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [Group H'] [TopologicalSpace H'] [IsTopologicalGroup H']
    (φ : H →ₜ* H') : VSheaf.constGrp p H ⟶ VSheaf.constGrp p H' where
  app S := GrpCat.ofHom (MonoidHom.compLeftContinuous _ φ.toMonoidHom φ.continuous_toFun)

/-- The product of two presheaves of groups. -/
def VSheaf.grpProd (𝒢 𝒢' : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}) : (Perfd p)ᵒᵖ ⥤ GrpCat.{0} where
  obj S := GrpCat.of (𝒢.obj S × 𝒢'.obj S)
  map f := GrpCat.ofHom ((𝒢.map f).hom.prodMap (𝒢'.map f).hom)
  map_id S := by ext g <;> simp
  map_comp f g := by ext h <;> simp

/-- An action of a v-sheaf of groups `𝒢` on a v-sheaf `X`: an action of the group `𝒢(S)` on
`X(S)` for every `S`, compatible with pullback. For `𝒢 = underline H` this is a continuous action
of the topological group `H`. -/
structure VSheaf.Action (𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}) (X : VSheaf p) where
  /-- The action of `𝒢(S)` on `X(S)`. -/
  mulAction (S : Perfd p) : MulAction (𝒢.obj (op S)) (X.pts S)
  /-- Compatibility with pullback along `f : T → S`. -/
  map_smul {S T : Perfd p} (f : T ⟶ S) (g : 𝒢.obj (op S)) (x : X.pts S) :
    X.obj.map f.op ((mulAction S).smul g x) =
      (mulAction T).smul (𝒢.map f.op g) (X.obj.map f.op x)

namespace VSheaf.Action

variable {𝒢 𝒢' : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X Y B : VSheaf p}

/-- `g • x` for `g ∈ 𝒢(S)` and `x ∈ X(S)`. -/
def smul (a : VSheaf.Action 𝒢 X) (S : Perfd p) (g : 𝒢.obj (op S)) (x : X.pts S) : X.pts S :=
  (a.mulAction S).smul g x

/-- Restriction of an action along a homomorphism `𝒢' → 𝒢`. -/
def comap (a : VSheaf.Action 𝒢 X) (φ : 𝒢' ⟶ 𝒢) : VSheaf.Action 𝒢' X where
  mulAction S :=
    letI := a.mulAction S
    MulAction.compHom _ (φ.app (op S)).hom
  map_smul f g x := by
    have h := a.map_smul f ((φ.app (op _)).hom g) x
    have hn : 𝒢.map f.op ((φ.app (op _)).hom g) = (φ.app (op _)).hom (𝒢'.map f.op g) :=
      (ConcreteCategory.congr_hom (φ.naturality f.op) g).symm
    rw [hn] at h
    exact h

/-- A morphism of v-sheaves is equivariant along a homomorphism `φ : 𝒢 → 𝒢'`. -/
def EquivariantAlong (φ : 𝒢 ⟶ 𝒢') (a : VSheaf.Action 𝒢 X) (a' : VSheaf.Action 𝒢' Y)
    (f : X ⟶ Y) : Prop :=
  ∀ (S : Perfd p) (g : 𝒢.obj (op S)) (x : X.pts S),
    VSheaf.ptsMap f S (a.smul S g x) = a'.smul S ((φ.app (op S)).hom g) (VSheaf.ptsMap f S x)

/-- A morphism of v-sheaves is equivariant for two actions of `𝒢`. -/
def Equivariant (a : VSheaf.Action 𝒢 X) (a' : VSheaf.Action 𝒢 Y) (f : X ⟶ Y) : Prop :=
  ∀ (S : Perfd p) (g : 𝒢.obj (op S)) (x : X.pts S),
    VSheaf.ptsMap f S (a.smul S g x) = a'.smul S g (VSheaf.ptsMap f S x)

/-- A morphism of v-sheaves is invariant under an action on its source. -/
def Invariant (a : VSheaf.Action 𝒢 X) (f : X ⟶ B) : Prop :=
  ∀ (S : Perfd p) (g : 𝒢.obj (op S)) (x : X.pts S),
    VSheaf.ptsMap f S (a.smul S g x) = VSheaf.ptsMap f S x

/-- Two actions on the same v-sheaf commute. -/
def Commute (a : VSheaf.Action 𝒢 X) (a' : VSheaf.Action 𝒢' X) : Prop :=
  ∀ (S : Perfd p) (g : 𝒢.obj (op S)) (g' : 𝒢'.obj (op S)) (x : X.pts S),
    a.smul S g (a'.smul S g' x) = a'.smul S g' (a.smul S g x)

/-- The action of `𝒢 × 𝒢'` given by two commuting actions. -/
def prod (a : VSheaf.Action 𝒢 X) (a' : VSheaf.Action 𝒢' X) (h : a.Commute a') :
    VSheaf.Action (VSheaf.grpProd 𝒢 𝒢') X where
  mulAction S :=
    letI := a.mulAction S
    letI := a'.mulAction S
    letI : SMulCommClass (𝒢.obj (op S)) (𝒢'.obj (op S)) (X.pts S) := ⟨fun g g' x => h S g g' x⟩
    MulAction.prodOfSMulCommClass _ _ _
  map_smul f g x := by
    have h1 := a.map_smul f g.1 ((a'.mulAction _).smul g.2 x)
    have h2 := a'.map_smul f g.2 x
    rw [h2] at h1
    exact h1

/-- `π : X → B` is a torsor under `𝒢` for the v-topology: `π` is surjective as a map of
v-sheaves, and for every `S` the group `𝒢(S)` acts freely on `X(S)` with orbits the fibres of
`X(S) → B(S)`. For `𝒢 = underline H` with `H` locally profinite such a torsor is pro-étale locally
trivial (DiamondsAndVStacks D3, locally-profinite-torsors). -/
def IsTorsor (a : VSheaf.Action 𝒢 X) (π : X ⟶ B) : Prop :=
  Sheaf.IsLocallySurjective π ∧
    ∀ (S : Perfd p) (x : X.pts S),
      letI := a.mulAction S
      MulAction.orbit (𝒢.obj (op S)) x = VSheaf.ptsMap π S ⁻¹' {VSheaf.ptsMap π S x} ∧
        MulAction.stabilizer (𝒢.obj (op S)) x = ⊥

variable {H : Type} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]

/-- `h • x` for `h ∈ H` and an action of `underline H`: the action of the constant function. -/
def smulConst (a : VSheaf.Action (VSheaf.constGrp p H) X) (S : Perfd p) (h : H) (x : X.pts S) :
    X.pts S :=
  a.smul S (ContinuousMap.const _ h : C((Perfd.toTop p).obj S, H)) x

/-- Restriction of an action of `underline H` to a subgroup. -/
def restrict (a : VSheaf.Action (VSheaf.constGrp p H) X) (K : Subgroup H) :
    VSheaf.Action (VSheaf.constGrp p K) X :=
  a.comap (VSheaf.constGrpMap p ⟨K.subtype, continuous_subtype_val⟩)

/-- The endomorphism of the v-sheaf `X` given by `h ∈ H`, for an action of `underline H`. -/
def constHom (a : VSheaf.Action (VSheaf.constGrp p H) X) (h : H) : X ⟶ X :=
  ObjectProperty.homMk
    { app := fun S => ↾(a.smulConst S.unop h)
      naturality := fun S T f => by
        ext x
        exact (a.map_smul f.unop (ContinuousMap.const _ h) x).symm }

end VSheaf.Action

/-- The subgroup `𝒪_E^×` of `E^×`: the units of valuation one. -/
def LocalField.unitsInt (F : LocalField p) : Subgroup F.Eˣ :=
  (Units.map (ValuativeRel.valuation F.E).toMonoidHom).ker

/-- The subgroup `1 + 𝔪^n` of `E^×` for `n ≥ 1`, and `𝒪_E^×` for `n = 0`: the units of `𝒪_E` that
are congruent to `1` modulo `𝔪^n`. -/
def LocalField.unitsLevel (F : LocalField p) (n : ℕ) : Subgroup F.Eˣ :=
  ((Units.map (Ideal.Quotient.mk (𝓂[F.E] ^ n)).toMonoidHom).ker).map
    (Units.map (𝒪[F.E]).subtype.toMonoidHom)


namespace VSheaf.Action

variable {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X Y B : VSheaf p}

/-- An invariant map stays invariant after composition. -/
theorem Invariant.comp {a : VSheaf.Action 𝒢 X} {f : X ⟶ Y} (hf : a.Invariant f) (g : Y ⟶ B) :
    a.Invariant (f ≫ g) := fun S k x => congrArg (VSheaf.ptsMap g S) (hf S k x)

variable {H : Type} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]

/-- For an invariant map `f`, the endomorphism given by `h ∈ H` is a map over the target. -/
theorem constHom_comp {a : VSheaf.Action (VSheaf.constGrp p H) X} {f : X ⟶ B}
    (hf : a.Invariant f) (h : H) : a.constHom h ≫ f = f := by
  apply Sheaf.hom_ext
  ext S x
  exact hf S.unop _ x

end VSheaf.Action

/-- The base change `X ×_{Spd Ĕ} Spd C` of a v-sheaf over `Spd Ĕ` to the completed algebraic
closure. -/
abbrev VSheaf.overC {F : LocalField p} {X : VSheaf p} (f : X ⟶ F.spdBreve) : VSheaf p :=
  pullback f F.spdCToBreve

/-- The base change to `Spd C` of a map over `Spd Ĕ`. -/
def VSheaf.overCMap {F : LocalField p} {X Y : VSheaf p} (g : Y ⟶ X) (fY : Y ⟶ F.spdBreve)
    (fX : X ⟶ F.spdBreve) (h : g ≫ fX = fY) : VSheaf.overC fY ⟶ VSheaf.overC fX :=
  pullback.map fY F.spdCToBreve fX F.spdCToBreve g (𝟙 _) (𝟙 _) (by rw [h, Category.comp_id])
    (by rw [Category.comp_id, Category.id_comp])

/-- The Frobenius `φ` of `Spd Ĕ`, as an element of the group of automorphisms of `Spd Ĕ`. -/
def LocalField.spdBreveFrobAut (F : LocalField p) : Aut F.spdBreve := F.spdBreveFrob

/-- σ-conjugation by `1` is the identity. -/
theorem RedGrp.sigmaConj_one (G : RedGrp F) (b : G.ptsBreve) : G.sigmaConj 1 b = b := by
  simp [RedGrp.sigmaConj]

/-- The elements of `J_b(E)` fix `b` under σ-conjugation. -/
theorem RedGrp.sigmaConj_eq_of_mem {G : RedGrp F} {b y : G.ptsBreve}
    (h : y ∈ G.sigmaCentralizer b) : G.sigmaConj y b = b := by
  change y * b = b * G.frob y at h
  rw [RedGrp.sigmaConj, h, mul_inv_cancel_right]

/-- A single leg, as a family indexed by `Unit`. -/
abbrev RedGrp.oneLeg {G : RedGrp F} (μ : G.Cochar) : Unit → G.Cochar := fun _ => μ

/-- The empty family of legs. -/
abbrev RedGrp.noLegs (G : RedGrp F) : Empty → G.Cochar := fun i => i.elim

/-- For one leg, the projection of the leg base `∏_{Unit} Spd Ĕ_μ` to `Spd Ĕ_μ`. -/
def RedGrp.legOne (G : RedGrp F) (μ : G.Cochar) :
    G.legBase (RedGrp.oneLeg μ) ⟶ (G.reflexField μ).spdBreve :=
  Pi.π (fun _ : Unit => (G.reflexField μ).spdBreve) ()

/-- `D_I = ∏_{i ∈ I} Div¹_{E_i}`, for the fields of definition `E_i` of the `μ_i`: the product over
`Spd k` of the sheaves of degree-one divisors of the curves of the `E_i`. -/
abbrev RedGrp.divBase (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) : VSheaf p :=
  ∏ᶜ fun i : I => Div1 (G.reflexField (μ i))

/-- `D_I → (Div¹_E)^I`. -/
def RedGrp.divBaseToDiv1 (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    G.divBase μ ⟶ Div1.pow F I :=
  Pi.lift fun i => Pi.π _ i ≫ (G.reflexExt (μ i)).div1Map

/-- `∏_i Spd Ĕ_i → D_I`, the product of the quotient maps by the Frobenii. -/
def RedGrp.legBaseToDivBase (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    G.legBase μ ⟶ G.divBase μ :=
  Limits.Pi.map fun i => Div1.proj (G.reflexField (μ i))

/-- The partial diagonal `∏_{j ∈ J} Spd Ĕ_{ν_j} → ∏_{i ∈ I} Spd Ĕ_{μ_i}`, `(S_j♯) ↦ (S_{a(i)}♯)`,
for a map `a : I → J`, when every `Ĕ_{μ_i}` is `Ĕ` (the `μ_i` are defined over unramified
extensions of `E`). -/
def RedGrp.legDiag (G : RedGrp F) {I J : Type} [Finite I] [Finite J] (a : I → J)
    (μ : I → G.Cochar) (ν : J → G.Cochar) [∀ i, IsIso (G.reflexExt (μ i)).spdBreveMap] :
    G.legBase ν ⟶ G.legBase μ :=
  Pi.lift fun i => Pi.π _ (a i) ≫ (G.reflexExt (ν (a i))).spdBreveMap ≫
    inv (G.reflexExt (μ i)).spdBreveMap

/-- The `S`-points of a v-sheaf are the isomorphism classes of `S`-points of the v-stack that it
defines: the Yoneda lemma for sheaves, full faithfulness of `VSheaf.toStack` and
`VStack.homEquiv`. -/
def VSheaf.stackPts (X : VSheaf p) (S : Perfd p) :
    X.pts S ≃ ((VStack.isoClasses p).obj X.stack).obj (op S) :=
  (yonedaEquiv (F := X.obj) (X := S)).symm.trans
    ((Sheaf.homEquiv (X := S.sheaf) (Y := X)).symm.trans
      (((Functor.FullyFaithful.ofFullyFaithful (VSheaf.toStack p)).homEquiv).trans
        (VStack.homEquiv X.stack S)))

/-- The class in `B(G)` of a `G`-bundle `x : T → Bun_G` at a point `y` of `T` over a geometric
point. -/
def BunG.classAt {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) (s : Perfd.GeomPoint p)
    (y : T.geomPts s) : G.BofG :=
  BunG.geomPtsEquiv G s (VStack.geomPtsMap x s (T.stackPts s.toPerfd y))

/-- The map `[∗/underline K] → Bun_G` for a compact open subgroup `K ⊂ G(E)`: a `K`-torsor `ℙ`
goes to the `G`-bundle attached to the `G(E)`-torsor `ℙ ×^K G(E)`. -/
def BunG.ofLevel (G : RedGrp F) (K : G.Level) :
    VStack.classifying p K.1.toSubgroup ⟶ BunG G :=
  VStack.classifying.map p ⟨K.1.toSubgroup.subtype, continuous_subtype_val⟩ ≫
    BunG.trivialStratum G

/-- The one-leg Schubert variety `Gr_{G,Spd Ĕ_μ,≤μ}`. -/
abbrev GrG.oneLeg (G : RedGrp F) (μ : G.Cochar) : VSheaf p := GrG.schubert G (RedGrp.oneLeg μ)

/-- `Gr_{G,Spd Ĕ_μ,≤μ} → Spd Ĕ_μ`. -/
def GrG.oneLegBase (G : RedGrp F) (μ : G.Cochar) :
    GrG.oneLeg G μ ⟶ (G.reflexField μ).spdBreve :=
  GrG.schubertLegs G (RedGrp.oneLeg μ) ≫ G.legOne μ

/-- The open Schubert cell `Gr_{G,μ}` over `Spd Ĕ_μ`. -/
abbrev GrG.cellOver (G : RedGrp F) (μ : G.Cochar) : Over (G.reflexField μ).spdBreve :=
  Over.mk (GrG.cellIncl G μ ≫ GrG.oneLegBase G μ)

/-- The Schubert variety `Gr_{G,≤μ}` over `Spd Ĕ_μ`. -/
abbrev GrG.oneLegOver (G : RedGrp F) (μ : G.Cochar) : Over (G.reflexField μ).spdBreve :=
  Over.mk (GrG.oneLegBase G μ)

/-- The inclusion of the cell, over `Spd Ĕ_μ`. -/
abbrev GrG.cellInclOver (G : RedGrp F) (μ : G.Cochar) : GrG.cellOver G μ ⟶ GrG.oneLegOver G μ :=
  Over.homMk (GrG.cellIncl G μ)

/-! ### Further interfaces: quotient stacks, torsors of trivialisations, period maps, rigid spaces

Used from stage HS2 on. Each docstring names the owning roadmap and stage. -/

/-- DiamondsAndVStacks D1 with RelativeFarguesFontaine RF0 (stand-in): the pseudo-uniformizers
`ϖ` of an affinoid perfectoid space `S = Spa(R, R⁺)`; the type is empty when `S` is not affinoid.
A pseudo-uniformizer defines the loci `Y_[0,r](S) = {|p|^r ≤ |[ϖ]|}` and `Y_(0,r](S)` of
`S ×̇ Spa ℤ_p`. -/
def Perfd.PseudoUnif (S : Perfd p) : Type := sorry

/-- DiamondsAndVStacks D5 (stand-in): the locally spatial diamonds among the v-sheaves. -/
def VSheaf.isLocSpatialDiamond (p : ℕ) [Fact p.Prime] : ObjectProperty (VSheaf p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): the spatial diamonds among the v-sheaves. -/
def VSheaf.isSpatialDiamond (p : ℕ) [Fact p.Prime] : ObjectProperty (VSheaf p) := sorry

/-- DiamondsAndVStacks D5 (stand-in): quasi-pro-étale maps. -/
def VStack.quasiProEtale (p : ℕ) [Fact p.Prime] : MorphismProperty (VStack p) := sorry

/-- DiamondsAndVStacks D4 (stand-in): the quotient stack `[X/𝒢]` of a v-sheaf by an action of a
v-sheaf of groups; when the presheaf of groups `𝒢` is not a small v-sheaf no statement uses it. -/
def VStack.quotient {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X : VSheaf p} (a : VSheaf.Action 𝒢 X) :
    VStack p := sorry

/-- D4 (stand-in): the quotient map `X → [X/𝒢]`. -/
def VStack.quotient.proj {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X : VSheaf p} (a : VSheaf.Action 𝒢 X) :
    X.stack ⟶ VStack.quotient a := sorry

/-- D4 (stand-in): the map `[X/underline H] → [∗/underline H]` that classifies the
`underline H`-torsor `X → [X/underline H]`, for an action of a topological group `H`. -/
def VStack.quotient.toClassifying {H : Type} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    {X : VSheaf p} (a : VSheaf.Action (VSheaf.constGrp p H) X) :
    VStack.quotient a ⟶ VStack.classifying p H := sorry

/-- D4: `X = [X/underline H] ×_{[∗/underline H]} ∗`. -/
theorem VStack.quotient.isCartesian {H : Type} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] {X : VSheaf p} (a : VSheaf.Action (VSheaf.constGrp p H) X) :
    VStack.IsCartesian (VStack.quotient.proj a) (terminal.from _)
      (VStack.quotient.toClassifying a) (VStack.classifying.point p H) := sorry

/-- D4 (stand-in): an invariant map `X → B` to a v-sheaf factors through `[X/𝒢]`. -/
def VStack.quotient.desc {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X B : VSheaf p} (a : VSheaf.Action 𝒢 X)
    (f : X ⟶ B) (hf : a.Invariant f) : VStack.quotient a ⟶ B.stack := sorry

/-- D4: the factorisation of an invariant map through the quotient. -/
theorem VStack.quotient.proj_desc {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X B : VSheaf p}
    (a : VSheaf.Action 𝒢 X) (f : X ⟶ B) (hf : a.Invariant f) :
    VStack.quotient.proj a ≫ VStack.quotient.desc a f hf = VSheaf.stackMap f := sorry

/-- D4 (stand-in): an equivariant map `X → Y` induces `[X/𝒢] → [Y/𝒢]`. -/
def VStack.quotient.map {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X Y : VSheaf p} (a : VSheaf.Action 𝒢 X)
    (a' : VSheaf.Action 𝒢 Y) (f : X ⟶ Y) (hf : a.Equivariant a' f) :
    VStack.quotient a ⟶ VStack.quotient a' := sorry

/-- D4: the map of quotients is compatible with the quotient maps. -/
theorem VStack.quotient.proj_map {𝒢 : (Perfd p)ᵒᵖ ⥤ GrpCat.{0}} {X Y : VSheaf p}
    (a : VSheaf.Action 𝒢 X) (a' : VSheaf.Action 𝒢 Y) (f : X ⟶ Y) (hf : a.Equivariant a' f) :
    VStack.quotient.proj a ≫ VStack.quotient.map a a' f hf =
      VSheaf.stackMap f ≫ VStack.quotient.proj a' := sorry

/-- RelativeFarguesFontaine RF2 (stand-in): `Spd E` over `Spd k`. -/
def LocalField.spd (F : LocalField p) : VSheaf p := sorry

/-- RF2 (stand-in): `Spd Ĕ → Spd E`, the quotient by the profinite group `Gal(k|𝔽_q)`. -/
def LocalField.spdBreveToSpd (F : LocalField p) : F.spdBreve ⟶ F.spd := sorry

/-- RF2: `Spd Ĕ → Spd E` is invariant under the Frobenius of `Spd Ĕ`. -/
theorem LocalField.spdBreveFrob_toSpd (F : LocalField p) :
    F.spdBreveFrob.hom ≫ F.spdBreveToSpd = F.spdBreveToSpd := sorry

/-- RelativeFarguesFontaine RF2 with RF3 (stand-in): `BC(𝒪(1)) ∖ {0}`, the v-sheaf of non-zero
sections of `𝒪_{X_S}(1)` (Fargues–Scholze II.2.2–II.2.4). -/
def Div1.cover (F : LocalField p) : VSheaf p := sorry

/-- RF2 (stand-in): `BC(𝒪(1)) ∖ {0} → Div¹`, a section going to its vanishing divisor. -/
def Div1.coverProj (F : LocalField p) : Div1.cover F ⟶ Div1 F := sorry

/-- RF2 (stand-in): `E^× = 𝔾_m(E)` acts on `BC(𝒪(1)) ∖ {0}` by multiplication of sections. -/
def Div1.coverAction (F : LocalField p) :
    VSheaf.Action (VSheaf.constGrp p (RedGrp.Gm F).pts) (Div1.cover F) := sorry

/-- RF2: `BC(𝒪(1)) ∖ {0} → Div¹` is a torsor under `underline{E^×}` (Fargues–Scholze II.2.4). -/
theorem Div1.coverAction_isTorsor (F : LocalField p) :
    (Div1.coverAction F).IsTorsor (Div1.coverProj F) := sorry

/-- BunGAndNewtonStrata BG0 (stand-in): `J_1(E) = G(E)` as topological groups. -/
def RedGrp.centralizerOne (G : RedGrp F) : G.pts ≃ₜ* G.sigmaCentralizer 1 := sorry

/-- BG0: the identification `G(E) = J_1(E)` is the inclusion `G(E) → G(Ĕ)`. -/
theorem RedGrp.coe_centralizerOne (G : RedGrp F) (g : G.pts) :
    (G.centralizerOne g : G.ptsBreve) = G.incl g := sorry

/-- BunGAndNewtonStrata BG0 (stand-in): for `b` basic, `J_b ⊗ Ĕ = G ⊗ Ĕ`, hence
`J_b(Ĕ) = G(Ĕ)`. -/
def RedGrp.innerFormBreve (G : RedGrp F) (b : G.ptsBreve) (hb : RedGrp.BofG.mk b ∈ G.basic) :
    (G.innerForm b).ptsBreve ≃* G.ptsBreve := sorry

/-- BG0: under `J_b(Ĕ) = G(Ĕ)` the Frobenius of `J_b(Ĕ)` is `g ↦ b σ(g) b⁻¹`. -/
theorem RedGrp.innerFormBreve_frob (G : RedGrp F) (b : G.ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ G.basic) (g : (G.innerForm b).ptsBreve) :
    G.innerFormBreve b hb ((G.innerForm b).frob g) =
      b * G.frob (G.innerFormBreve b hb g) * b⁻¹ := sorry

/-- BG0 (stand-in): for `b` basic, the conjugacy classes of geometric cocharacters of `G` and of
its inner form `J_b` correspond, with the same fields of definition. -/
def RedGrp.innerFormCochar (G : RedGrp F) (b : G.ptsBreve) (hb : RedGrp.BofG.mk b ∈ G.basic) :
    G.Cochar ≃ (G.innerForm b).Cochar := sorry

/-- ReductiveGroups (stand-in): the ad-isomorphisms: the homomorphisms that map the centre into
the centre and induce an isomorphism of adjoint groups (Gleason–Lim–Xu, Definition 3.14). -/
def RedGrp.adIso (F : LocalField p) : MorphismProperty (RedGrp F) := sorry

/-- ReductiveGroups (stand-in): for `f : G → H` the field of definition of `f ∘ μ` is contained in
that of `μ`. -/
def RedGrp.reflexFieldMap {G H : RedGrp F} (f : G ⟶ H) (μ : G.Cochar) (μH : H.Cochar)
    (h : RedGrp.Cochar.map f μ = μH) : (H.reflexField μH).Ext (G.reflexField μ) := sorry

/-- ReductiveGroups (stand-in): the first projection of a product. -/
def RedGrp.prod.fst (G H : RedGrp F) : G.prod H ⟶ G := sorry

/-- ReductiveGroups (stand-in): the second projection of a product. -/
def RedGrp.prod.snd (G H : RedGrp F) : G.prod H ⟶ H := sorry

/-- ReductiveGroups (stand-in): the torus `G^ab = G/G^der`. -/
def RedGrp.ab (G : RedGrp F) : RedGrp F := sorry

/-- ReductiveGroups (stand-in): the quotient map `det : G → G^ab`. -/
def RedGrp.toAb (G : RedGrp F) : G ⟶ G.ab := sorry

/-- ReductiveGroups (stand-in): `Rep_E(G)`, the algebraic representations of `G` on
finite-dimensional `E`-vector spaces. -/
def RedGrp.Rep (G : RedGrp F) : Type 1 := sorry

instance (G : RedGrp F) : LargeCategory G.Rep := sorry
instance (G : RedGrp F) : MonoidalCategory G.Rep := sorry

/-- DiamondsAndVStacks D3 (stand-in): the pro-étale `E`-local systems on a v-sheaf, with their
tensor product. -/
def VSheaf.LocSys (F : LocalField p) (X : VSheaf p) : Type 1 := sorry

instance (X : VSheaf p) : LargeCategory (VSheaf.LocSys F X) := sorry
instance (X : VSheaf p) : MonoidalCategory (VSheaf.LocSys F X) := sorry

/-- BunGAndNewtonStrata BG3, full-automorphism-v-group (stand-in): the v-sheaf of groups
`G̃_b = Aut(E_b)`, `S ↦ Aut(E_b|_{X_S})` (Fargues–Scholze III.5.1). -/
def BunG.autGrp (G : RedGrp F) (b : G.ptsBreve) : (Perfd p)ᵒᵖ ⥤ GrpCat.{0} := sorry

/-- BG3 (stand-in): the inclusion `underline{J_b(E)} ⊂ G̃_b`. -/
def BunG.autGrpIncl (G : RedGrp F) (b : G.ptsBreve) :
    VSheaf.constGrp p (G.sigmaCentralizer b) ⟶ BunG.autGrp G b := sorry

/-- BG3 (stand-in): `G̃_b → H̃_{f(b)}` for a homomorphism `f : G → H`. -/
def BunG.autGrpMap {G H : RedGrp F} (f : G ⟶ H) (b : G.ptsBreve) :
    BunG.autGrp G b ⟶ BunG.autGrp H (RedGrp.ptsBreveMap f b) := sorry

/-- BunGAndNewtonStrata BG2, geometrically-trivial-locus (stand-in): for a `G`-bundle
`x : T → Bun_G` over a v-sheaf `T`, the subsheaf `T^a ⊂ T` over which the bundle is trivial at
every geometric point; `T^a = T ×_{Bun_G} Bun_G^1` (Fargues–Scholze III.2.4). -/
def BunG.trivLocus {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) : VSheaf p := sorry

/-- BG2 (stand-in): the inclusion `T^a → T`. -/
def BunG.trivLocus.incl {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    BunG.trivLocus x ⟶ T := sorry

/-- BG2: `T^a → T` is an open immersion. -/
theorem BunG.trivLocus.incl_openImmersion {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    VStack.openImmersion p (VSheaf.stackMap (BunG.trivLocus.incl x)) := sorry

/-- BG2: `T^a = T ×_{Bun_G} Bun_G^1`, for the open substack `Bun_G^1 = [∗/underline{G(E)}]`. -/
theorem BunG.trivLocus.isCartesian {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    ∃ t : (BunG.trivLocus x).stack ⟶ VStack.classifying p G.pts,
      VStack.IsCartesian (VSheaf.stackMap (BunG.trivLocus.incl x)) t x (BunG.trivialStratum G) :=
  sorry

/-- BG2: a geometric point of `T` lies in `T^a` exactly when the bundle is trivial there. -/
theorem BunG.trivLocus.mem_iff {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G)
    (s : Perfd.GeomPoint p) (y : T.geomPts s) :
    y ∈ Set.range (VSheaf.ptsMap (BunG.trivLocus.incl x) s.toPerfd) ↔
      BunG.classAt x s y = RedGrp.BofG.mk 1 := sorry

/-- BG2 (stand-in): the sheaf `Isom(E_1, E)` of trivialisations of the bundle `x` of `T`; it lies
over `T^a`, and `Isom(E_1, E) = T ×_{Bun_G} ∗` for the point `E_1` of `Bun_G`. -/
def BunG.trivTorsor {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) : VSheaf p := sorry

/-- BG2 (stand-in): `Isom(E_1, E) → T^a`. -/
def BunG.trivTorsor.proj {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    BunG.trivTorsor x ⟶ BunG.trivLocus x := sorry

/-- BG2: `Isom(E_1, E) = T ×_{Bun_G} ∗`. -/
theorem BunG.trivTorsor.isCartesian {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    VStack.IsCartesian
      (VSheaf.stackMap (BunG.trivTorsor.proj x ≫ BunG.trivLocus.incl x))
      (terminal.from (BunG.trivTorsor x).stack) x (BunG.point G 1) := sorry

/-- BG2 (stand-in): `G(E) = Aut(E_1)` acts on `Isom(E_1, E)` by `g · τ = τ ∘ g⁻¹`; this is the left
action attached to the right action `τ ↦ τ ∘ g` of the sources. -/
def BunG.trivTorsor.action {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    VSheaf.Action (VSheaf.constGrp p G.pts) (BunG.trivTorsor x) := sorry

/-- BG2: the action of `G(E)` preserves the projection to `T^a`. -/
theorem BunG.trivTorsor.action_invariant {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    (BunG.trivTorsor.action x).Invariant (BunG.trivTorsor.proj x) := sorry

/-- BG2: `Isom(E_1, E) → T^a` is a torsor under `underline{G(E)}` (Fargues–Scholze III.2.4;
Scholze–Weinstein 22.5.2 for `E = ℚ_p`). -/
theorem BunG.trivTorsor.isTorsor {G : RedGrp F} {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    (BunG.trivTorsor.action x).IsTorsor (BunG.trivTorsor.proj x) := sorry

/-- BG2 (stand-in): pushout of trivialisations along `f : G → H`,
`Isom(E_1, E) → Isom(E_1, f_* E)`. -/
def BunG.trivTorsor.push {G H : RedGrp F} (f : G ⟶ H) {T : VSheaf p} (x : T.stack ⟶ BunG G) :
    BunG.trivTorsor x ⟶ BunG.trivTorsor (x ≫ BunG.map f) := sorry

/-- BG2: the pushout of trivialisations is equivariant along `G(E) → H(E)`. -/
theorem BunG.trivTorsor.push_equivariant {G H : RedGrp F} (f : G ⟶ H) {T : VSheaf p}
    (x : T.stack ⟶ BunG G) :
    VSheaf.Action.EquivariantAlong (VSheaf.constGrpMap p (RedGrp.ptsMap f))
      (BunG.trivTorsor.action x) (BunG.trivTorsor.action (x ≫ BunG.map f))
      (BunG.trivTorsor.push f x) := sorry

/-- BunGAndNewtonStrata BG2, uniformization (stand-in): the Beauville–Laszlo map
`Gr_{G,Spd Ĕ_μ,≤μ} → Bun_G` of the element `b`, in the orientation of Scholze–Weinstein, Lecture
23: a point `x` goes to the bundle `E_x` on `X_S` with the modification `E_x ⇢ E_b` at the leg,
bounded by `μ`, that the lattice `x` defines. The normalization required from BG2 is
`κ(E_x) = κ(E_b) + μ♯`: its three conflicting signed exports are replaced in the packet
by a stage request and an open normalization gap. For `𝔾_m` and `μ(z) = z^d`, `E_x(dS♯) ≅ E_b`. -/
def BunG.beauvilleLaszlo (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) :
    (GrG.oneLeg G μ).stack ⟶ BunG G := sorry

/-- GeometricSatakeAndFusion GS0 (stand-in): the map of Schubert varieties
`Gr_{G,≤μ} → Gr_{H,≤μ_H}` of a homomorphism `f : G → H` with `f(μ) ≤ μ_H`. -/
def GrG.oneLegMap {G H : RedGrp F} (f : G ⟶ H) (μ : G.Cochar) (μH : H.Cochar)
    (h : RedGrp.Cochar.map f μ ≤ μH) : GrG.oneLeg G μ ⟶ GrG.oneLeg H μH := sorry

/-- BG2 with GS0: the Beauville–Laszlo maps commute with extension of the structure group. -/
theorem BunG.beauvilleLaszlo_map {G H : RedGrp F} (f : G ⟶ H) (b : G.ptsBreve) (μ : G.Cochar)
    (μH : H.Cochar) (h : RedGrp.Cochar.map f μ ≤ μH) :
    VSheaf.stackMap (GrG.oneLegMap f μ μH h) ≫
        BunG.beauvilleLaszlo H (RedGrp.ptsBreveMap f b) μH =
      BunG.beauvilleLaszlo G b μ ≫ BunG.map f := sorry

/-- GeometricSatakeAndFusion GS0, Schubert-smoothness (stand-in): the Białynicki-Birula map
`BB : Gr_{G,μ} → Fl_{G,μ}^♦` over `Spd Ĕ_μ` (Scholze–Weinstein 19.4.2). -/
def GrG.bialynickiBirula (G : RedGrp F) (μ : G.Cochar) :
    GrG.cellOver G μ ⟶ (RigSp.diamond (G.reflexField μ)).obj (RigSp.flag G μ) := sorry

/-- ReductiveGroups with AdicSpaces (stand-in): the action of `G(Ĕ) ⊂ G(Ĕ_μ)` on the flag variety
`Fl_{G,μ}` over `Ĕ_μ`. -/
def RigSp.flagAction (G : RedGrp F) (μ : G.Cochar) : G.ptsBreve →* Aut (RigSp.flag G μ) := sorry

/-- AdicSpaces (stand-in): the finite extensions `L` of `Ĕ` (inside a fixed algebraic closure). -/
def LocalField.BreveExt (F : LocalField p) : Type 1 := sorry

/-- AdicSpaces (stand-in): the degree `[L : Ĕ]`. -/
def LocalField.BreveExt.degree (L : F.BreveExt) : ℕ := sorry

/-- DiamondsAndVStacks D3 (stand-in): `Spd L` over `Spd Ĕ`. -/
def LocalField.BreveExt.spd (L : F.BreveExt) : Over F.spdBreve := sorry

/-- AdicSpaces (stand-in): `Spa L`, a rigid space over `Ĕ`. -/
def LocalField.BreveExt.spa (L : F.BreveExt) : RigSp F := sorry

/-- D3 (stand-in): `(Spa L)^♦ = Spd L`. -/
def LocalField.BreveExt.diamondSpa (L : F.BreveExt) : (RigSp.diamond F).obj L.spa ≅ L.spd :=
  sorry

/-- AdicSpaces (stand-in): the open unit ball of dimension `n` over `Ĕ`. -/
def RigSp.openBall (F : LocalField p) (n : ℕ) : RigSp F := sorry

/-- AdicSpaces (stand-in): disjoint unions of rigid spaces. -/
instance (F : LocalField p) : HasCoproducts.{0} (RigSp F) := sorry

/-- AdicSpaces (stand-in): `M ↦ τ^* M`, the base change of a rigid space over `Ĕ` along the
automorphism `τ = σ⁻¹` of `Ĕ` over `E`, the inverse of the lift `σ` of the `q`-Frobenius of `k`.
The Frobenius `φ` of `Spd Ĕ` (RF2) is the composite of `τ^♦` with the absolute `q`-Frobenius of
`Spd Ĕ`, so pullbacks along `φ` and along `τ^♦` are canonically identified. -/
def RigSp.frobTwist (F : LocalField p) : RigSp F ≌ RigSp F := sorry

/-- DiamondsAndVStacks D3 (stand-in): the diamond of `τ^* M` is the diamond of `M` with its
structure map to `Spd Ĕ` composed with `φ⁻¹`: the identification of the total spaces. -/
def RigSp.diamondFrobTwist (M : RigSp F) :
    ((RigSp.diamond F).obj ((RigSp.frobTwist F).functor.obj M)).left ≅
      ((RigSp.diamond F).obj M).left := sorry

/-- D3: the structure map of the diamond of `τ^* M`. -/
theorem RigSp.diamondFrobTwist_hom (M : RigSp F) :
    (RigSp.diamondFrobTwist M).hom ≫ ((RigSp.diamond F).obj M).hom ≫ F.spdBreveFrob.inv =
      ((RigSp.diamond F).obj ((RigSp.frobTwist F).functor.obj M)).hom := sorry

/-- PadicHodgeTheory R06.2 (stand-in): the weakly admissible points of the flag variety over a
finite extension `L` of `F̆`, for `E = ℚ_p`: the `y ∈ Fl_{G,μ}(L)` such that for every
`V ∈ Rep_{ℚ_p}(G)` the filtered isocrystal `(V ⊗ ℚ̆_p, bσ, Fil_y)` is weakly admissible, `Fil_y`
being the filtration of which the Białynicki-Birula map of Scholze–Weinstein 19.4.2 is the
lattice-to-filtration map. -/
def RigSp.flag.weaklyAdmissible (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (L : (G.reflexField μ).BreveExt) : Set (L.spa ⟶ RigSp.flag G μ) := sorry

/-- PadicHodgeTheory R06.2 (stand-in): for a weakly admissible point `y ∈ Fl_{G,μ}(L)`, the
pro-étale `G(ℚ_p)`-torsor over `Spd L` of the crystalline representation
`ρ_y : Gal(L̄|L) → G(ℚ_p)` with filtered isocrystal with `G`-structure `(bσ, Fil_y)`; for other
`y` no statement uses it. -/
def RigSp.flag.crystallineTorsor (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (L : (G.reflexField μ).BreveExt) (y : L.spa ⟶ RigSp.flag G μ) : Over L.spd.left := sorry

/-- R06.2 (stand-in): the action of `G(ℚ_p)` on the torsor of a crystalline representation. -/
def RigSp.flag.crystallineTorsor.action (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve)
    (μ : G.Cochar) (L : (G.reflexField μ).BreveExt) (y : L.spa ⟶ RigSp.flag G μ) :
    VSheaf.Action (VSheaf.constGrp p G.pts) (RigSp.flag.crystallineTorsor G b μ L y).left := sorry

end InterfacesForLaterStages

section InterfacesForCohomology

attribute [local instance] HasDerivedCategory.standard

variable {F : LocalField p}

/-! ### Further interfaces: derived categories of modules, smooth representations, dual groups,
strata of `Bun_G`

Used in stages HS1, HS3 and HS4. Each docstring names the owner. -/

/-- A module placed in degree `0`, as an object of `D(R)`. -/
abbrev DMod.ofModule (R : Type) [CommRing R] (M : Type) [AddCommGroup M] [Module R M] : DMod R :=
  (DerivedCategory.singleFunctor (ModuleCat.{0} R) 0).obj (ModuleCat.of R M)

/-- Mathlib gap (stand-in): the derived extension of scalars `- ⊗^L_R S : D(R) → D(S)`; the pinned
Mathlib has no left derived functors on `DerivedCategory`. -/
def DMod.extendScalars {R S : Type} [CommRing R] [CommRing S] (f : R →+* S) : DMod R ⥤ DMod S :=
  sorry

/-- A coefficient ring in which `ℓ` is `0` and which is not the zero ring; for instance a field
of characteristic `ℓ`. -/
def Coeff.IsModL (Λ : Coeff F ℓ) : Prop := (ℓ : Λ.carrier) = 0 ∧ Nontrivial Λ.carrier

section SmoothAdditions

variable (H : Type) [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (Λ : Coeff F ℓ)

/-- SmoothRepresentationsOfLocalGroups SR.1 (stand-in): `c-Ind_{K'} Λ → c-Ind_K Λ`,
`1_{gK'} ↦ 1_{gK}`, for open subgroups `K' ≤ K`. -/
def DSmooth.cIndMap {K' K : OpenSubgroup H} (h : K' ≤ K) :
    DSmooth.cInd H Λ K' ⟶ DSmooth.cInd H Λ K := sorry

/-- SR.1 (stand-in): `c-Ind_K Λ → c-Ind_{K'} Λ`, `1_{gK} ↦ Σ_{k ∈ K/K'} 1_{gkK'}`, for open
subgroups `K' ≤ K` with `K'` of finite index in `K`; for other pairs no statement uses it. -/
def DSmooth.cIndTransfer {K' K : OpenSubgroup H} (h : K' ≤ K) :
    DSmooth.cInd H Λ K ⟶ DSmooth.cInd H Λ K' := sorry

/-- SmoothRepresentationsOfLocalGroups SR.0 (stand-in): `RHom_H(A, B) ∈ D(Λ)`, the complex of
morphisms in the `Λ`-linear stable ∞-category `D(H, Λ)`. -/
def DSmooth.RHom : (DSmooth H Λ)ᵒᵖ ⥤ DSmooth H Λ ⥤ DMod Λ.carrier := sorry

/-- SR.2 (stand-in): Frobenius reciprocity, `RHom_H(c-Ind_K Λ, ρ) ≅ ρ^K` (derived invariants). -/
def DSmooth.RHomCInd (K : OpenSubgroup H) :
    (DSmooth.RHom H Λ).obj (op (DSmooth.cInd H Λ K)) ≅ DSmooth.invariants H Λ K := sorry

/-- SR.3 (stand-in): the derived smooth dual `ρ ↦ ρ^∨`. -/
def DSmooth.smoothDual : (DSmooth H Λ)ᵒᵖ ⥤ DSmooth H Λ := sorry

/-- SR.1 (stand-in): the regular representation `C_c^∞(H, Λ)` of locally constant compactly
supported functions, in degree `0`, with `H` acting by left translation. -/
def DSmooth.regular : DSmooth H Λ := sorry

/-- SR.1 (stand-in): the action of `H` on `C_c^∞(H, Λ)` by right translation, which commutes with
left translation. -/
def DSmooth.regularRight : H →* Aut (DSmooth.regular H Λ) := sorry

/-- SR.1 (stand-in): the inclusion `c-Ind_K Λ ⊂ C_c^∞(H, Λ)` of the right `K`-invariant
functions. -/
def DSmooth.cIndToRegular (K : OpenSubgroup H) : DSmooth.cInd H Λ K ⟶ DSmooth.regular H Λ := sorry

/-- SR.1 (stand-in): a character `χ : H → Λ^×` with open kernel, as a smooth representation on
`Λ` in degree `0`; for other `χ` no statement uses it. -/
def DSmooth.ofChar (χ : H →* Λ.carrierˣ) : DSmooth H Λ := sorry

variable {H Λ}

/-- `ρ` is admissible: `ρ^K` is a perfect complex of `Λ`-modules for every open pro-`p` subgroup
`K` (Fargues–Scholze IX.3, p. 325). -/
def DSmooth.IsAdmissible (ρ : DSmooth H Λ) : Prop :=
  ∀ K : OpenSubgroup H, IsOpenProP p K →
    DMod.isPerfect Λ.carrier ((DSmooth.invariants H Λ K).obj ρ)

end SmoothAdditions

/-- VStackSheavesAndLisseCategories VS3: extension of scalars preserves lisse objects. -/
def Dlis.extendScalars (X : VStack p) {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') : Dlis X Λ ⥤ Dlis X Λ' :=
  ObjectProperty.lift _ (Dlis.toSolid X Λ ⋙ DSolid.extendScalars X φ) (fun _ => sorry)

/-- `A ↦ A[n](n/2)`: the shift by `n` followed by the half Tate twist `(n/2)`; an
autoequivalence. -/
def DSolid.shiftTwist (X : VStack p) (Λ : Coeff F ℓ) (n : ℤ) : DSolid X Λ ⥤ DSolid X Λ :=
  shiftFunctor (DSolid X Λ) n ⋙ (DSolid.halfTwist X Λ n).functor

/-! #### Groups and levels -/

/-- The inclusion `G(E) → J_1(E)`: an element of `G(E)` is fixed by `σ`, so it σ-centralises
`1`. No placeholder. -/
def RedGrp.inclCentralizerOne (G : RedGrp F) : G.pts →* G.sigmaCentralizer 1 :=
  G.incl.codRestrict _ fun g => by
    have h := (G.mem_range_incl_iff (G.incl g)).mp ⟨g, rfl⟩
    change G.incl g * 1 = 1 * G.frob (G.incl g)
    rw [h, mul_one, one_mul]

/-- The continuous homomorphism `G(E) → J_1(E)` underlying the identification
`RedGrp.centralizerOne` of topological groups (BunGAndNewtonStrata BG0). -/
def RedGrp.ptsToCentralizerOne (G : RedGrp F) : G.pts →ₜ* G.sigmaCentralizer 1 :=
  ContinuousMonoidHom.toContinuousMonoidHom G.centralizerOne

/-- The image in `J_1(E)` of an open subgroup of `G(E)`; it is open because `G(E) → J_1(E)` is
an isomorphism of topological groups (BG0). -/
def RedGrp.centralizerOneLevel (G : RedGrp F) (K : OpenSubgroup G.pts) :
    OpenSubgroup (G.sigmaCentralizer 1) :=
  ⟨K.toSubgroup.map G.inclCentralizerOne, sorry⟩

/-- BunGAndNewtonStrata BG0 (stand-in): for a torus `T` and every `b`, `J_b(E) = T(E)`. -/
def RedGrp.torusCentralizer (G : RedGrp F) (hT : RedGrp.isTorus F G) (b : G.ptsBreve) :
    G.pts ≃ₜ* G.sigmaCentralizer b := sorry

/-- BG0: for a torus the identification `T(E) = J_b(E)` is the inclusion `T(E) ⊂ T(Ĕ)`, for every
representative `b` (`T(Ĕ)` is commutative, so `J_b(E)` is the group of `σ`-fixed points). -/
theorem RedGrp.coe_torusCentralizer (G : RedGrp F) (hT : RedGrp.isTorus F G) (b : G.ptsBreve)
    (g : G.pts) : (G.torusCentralizer hT b g : G.ptsBreve) = G.incl g := sorry

/-- For `b'` basic and `b ∈ G(Ĕ)`: the element `b'' = b b'⁻¹` of `G_{b'}(Ĕ) = G(Ĕ)`. The map
`x ↦ x b'` is a bijection `B(G_{b'}) → B(G)` carrying `1` to `b'`, and `b''` is the class of the
image of `E_b` under `Bun_G ≅ Bun_{G_{b'}}`. No placeholder. -/
def RedGrp.innerFormTwist (G : RedGrp F) (b' : G.ptsBreve) (hb' : RedGrp.BofG.mk b' ∈ G.basic)
    (b : G.ptsBreve) : (G.innerForm b').ptsBreve :=
  (G.innerFormBreve b' hb').symm (b * b'⁻¹)

/-- BunGAndNewtonStrata BG0 (stand-in): `(G_{b'})_{b''}(E) = G_b(E)` as topological groups, for
`b'' = b b'⁻¹`: under `G_{b'}(Ĕ) = G(Ĕ)`, with Frobenius `g ↦ b' σ(g) b'⁻¹`, the σ-centraliser of
`b''` in `G_{b'}` is that of `b` in `G`. -/
def RedGrp.innerFormCentralizer (G : RedGrp F) (b' : G.ptsBreve)
    (hb' : RedGrp.BofG.mk b' ∈ G.basic) (b : G.ptsBreve) :
    (G.innerForm b').sigmaCentralizer (G.innerFormTwist b' hb' b) ≃ₜ* G.sigmaCentralizer b := sorry

/-- BG0: the identification `(G_{b'})_{b''}(E) = G_b(E)` is the restriction of
`G_{b'}(Ĕ) = G(Ĕ)`. -/
theorem RedGrp.coe_innerFormCentralizer (G : RedGrp F) (b' : G.ptsBreve)
    (hb' : RedGrp.BofG.mk b' ∈ G.basic) (b : G.ptsBreve)
    (x : (G.innerForm b').sigmaCentralizer (G.innerFormTwist b' hb' b)) :
    (G.innerFormCentralizer b' hb' b x : G.ptsBreve) =
      G.innerFormBreve b' hb' (x : (G.innerForm b').ptsBreve) := sorry

/-- The open subgroup of `J_b(E) = T(E)` that corresponds to an open subgroup of `T(E)`. -/
def RedGrp.torusLevel (G : RedGrp F) (hT : RedGrp.isTorus F G) (b : G.ptsBreve)
    (K : OpenSubgroup G.pts) : OpenSubgroup (G.sigmaCentralizer b) :=
  K.comap (G.torusCentralizer hT b).symm.toMulEquiv.toMonoidHom
    (G.torusCentralizer hT b).symm.continuous

/-- The conjugate level `g K g⁻¹`. -/
def RedGrp.Level.conj {G : RedGrp F} (g : G.pts) (K : G.Level) : G.Level :=
  ⟨K.1.comap (MulAut.conj g⁻¹).toMonoidHom
      (show Continuous fun x : G.pts => g⁻¹ * x * g⁻¹⁻¹ from
        (continuous_const.mul continuous_id).mul continuous_const), by
    have h : ((K.1.comap (MulAut.conj g⁻¹).toMonoidHom
        (show Continuous fun x : G.pts => g⁻¹ * x * g⁻¹⁻¹ from
          (continuous_const.mul continuous_id).mul continuous_const) : OpenSubgroup G.pts) :
          Set G.pts) = (fun x => g * x * g⁻¹) '' (K.1 : Set G.pts) := by
      ext x
      constructor
      · intro hx
        exact ⟨g⁻¹ * x * g⁻¹⁻¹, hx, by group⟩
      · rintro ⟨y, hy, rfl⟩
        change g⁻¹ * (g * y * g⁻¹) * g⁻¹⁻¹ ∈ K.1
        have e : g⁻¹ * (g * y * g⁻¹) * g⁻¹⁻¹ = y := by group
        rw [e]
        exact hy
    rw [h]
    exact K.2.image ((continuous_const.mul continuous_id).mul continuous_const)⟩

/-- `K` is the maximal compact subgroup `𝒪_E^×` of `𝔾_m(E) = E^×` (`LocalField.unitsInt`). -/
def RedGrp.Gm.IsUnitsLevel (K : (RedGrp.Gm F).Level) : Prop :=
  K.1.toSubgroup.map (RedGrp.Gm.ptsEquiv F).toMonoidHom = F.unitsInt

/-- `K` is `GL_n(𝒪_E)`: the matrices with integral entries whose inverse has integral entries. -/
def RedGrp.GLn.IsIntegralLevel {n : ℕ} (K : (RedGrp.GLn F n).Level) : Prop :=
  ∀ g : (RedGrp.GLn F n).pts, g ∈ K.1 ↔ ∀ i j,
    ((RedGrp.GLn.ptsEquiv F n g : Matrix.GeneralLinearGroup (Fin n) F.E) :
        Matrix (Fin n) (Fin n) F.E) i j ∈ 𝒪[F.E] ∧
      (((RedGrp.GLn.ptsEquiv F n g)⁻¹ : Matrix.GeneralLinearGroup (Fin n) F.E) :
        Matrix (Fin n) (Fin n) F.E) i j ∈ 𝒪[F.E]

/-- `K` is the principal congruence subgroup `1 + p^m M_n(ℤ_p)` of `GL_n(ℚ_p)`, `m ≥ 1`. -/
def RedGrp.GLn.IsPrincipalLevel {n : ℕ} (m : ℕ) (K : (RedGrp.GLn (LocalField.Qp p) n).Level) :
    Prop :=
  ∀ g : (RedGrp.GLn (LocalField.Qp p) n).pts, g ∈ K.1 ↔ ∀ i j, ∃ c : ℤ_[p],
    (show Matrix (Fin n) (Fin n) ℚ_[p] from
        (RedGrp.GLn.ptsEquiv (LocalField.Qp p) n g).val) i j -
      (1 : Matrix (Fin n) (Fin n) ℚ_[p]) i j = (p : ℚ_[p]) ^ m * (c : ℚ_[p])

/-- The dominant cocharacter `(1^d, 0^{n-d})` of `GL_n`; minuscule. -/
def RedGrp.GLn.minuscule (F : LocalField p) (n d : ℕ) : (RedGrp.GLn F n).Cochar :=
  RedGrp.GLn.cochar F n ⟨fun i => if (i : ℕ) < d then 1 else 0, fun i j h => by
    have hij : (i : ℕ) ≤ (j : ℕ) := h
    simp only
    split_ifs <;> first | exact le_rfl | exact zero_le_one | (exfalso; omega)⟩

/-- ReductiveGroups with RelativeFarguesFontaine RF2 (stand-in): the geometric point
`Spd C → Spd Ĕ_μ` given by the embedding of the reflex field `E_μ` in the separable closure. -/
def RedGrp.reflexGeomPoint (G : RedGrp F) (μ : G.Cochar) : F.spdC ⟶ (G.reflexField μ).spdBreve :=
  sorry

/-- RF2: the geometric point of `Spd Ĕ_μ` lies over that of `Spd Ĕ`. -/
theorem RedGrp.reflexGeomPoint_comp (G : RedGrp F) (μ : G.Cochar) :
    G.reflexGeomPoint μ ≫ (G.reflexExt μ).spdBreveMap = F.spdCToBreve := sorry

/-- The diagonal geometric point `Spd C → ∏_i Spd Ĕ_{μ_i}`. -/
def RedGrp.legBaseGeomPoint (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    F.spdC ⟶ G.legBase μ :=
  Pi.lift fun i => G.reflexGeomPoint (μ i)

/-- The extension `E'/E` is separable: the minimal polynomial over `E` of every element of `E'`
is coprime to its derivative. -/
def LocalField.Ext.IsSeparable {F F' : LocalField p} (e : F.Ext F') : Prop :=
  letI := e.toRingHom.toAlgebra
  ∀ x : F'.E, IsCoprime (minpoly F.E x) (Polynomial.derivative (minpoly F.E x))

/-- The degree `[E' : E]` of a finite extension. -/
def LocalField.Ext.degree {F F' : LocalField p} (e : F.Ext F') : ℕ :=
  letI := e.toRingHom.toAlgebra
  Module.finrank F.E F'.E

/-- ReductiveGroups (stand-in): the Weil restriction `Res_{E'/E} G'` of a reductive group over a
finite separable extension `E'` of `E`; for inseparable extensions no statement uses it. -/
def RedGrp.weilRes {F' : LocalField p} (e : F.Ext F') (G' : RedGrp F') : RedGrp F := sorry

/-- ReductiveGroups (stand-in): the parabolic subgroups `P` of `G` with a chosen Levi
splitting. -/
def RedGrp.Parabolic (G : RedGrp F) : Type := sorry

/-- ReductiveGroups (stand-in): the Levi quotient `M` of a parabolic subgroup. -/
def RedGrp.Parabolic.levi {G : RedGrp F} (P : G.Parabolic) : RedGrp F := sorry

/-! #### The dual group side -/

section DualAdditions

variable (G : RedGrp F) (Λ : Coeff F ℓ)

/-- GeometricSatakeAndFusion GS4 (stand-in): restriction along the identity is the identity. -/
def SatRep.resId (I : Type) [Finite I] : SatRep.res G Λ (id : I → I) ≅ 𝟭 _ := sorry

/-- GS4 (stand-in): restriction along a composite, `(b ∘ a)_* ≅ b_* ∘ a_*`. -/
def SatRep.resComp {I J K : Type} [Finite I] [Finite J] [Finite K] (a : I → J) (b : J → K) :
    SatRep.res G Λ (b ∘ a) ≅ SatRep.res G Λ a ⋙ SatRep.res G Λ b := sorry

/-- Restriction of a representation of `(Ĝ ⋊ Q)^I` to the diagonal copy of `Ĝ`. -/
abbrev SatRep.diag (I : Type) [Finite I] : SatRep G Λ I ⥤ GeomSatRep G Λ Unit :=
  SatRep.toGeom G Λ I ⋙ GeomSatRep.res G Λ (fun _ : I => ())

variable {G Λ}

/-- GS4 (stand-in): the restriction of `V ⊠ W` to the diagonal copy of `Ĝ` is that of
`V ⊗ W`. -/
def SatRep.diagBoxtimes (V W : SatRep G Λ Unit) :
    (SatRep.diag G Λ (Fin 2)).obj (SatRep.boxtimes G Λ ![V, W]) ≅
      (SatRep.diag G Λ Unit).obj (V ⊗ W) := sorry

/-- The exterior tensor product `V ⊠ W` of representations of `(Ĝ ⋊ Q)^I` and `(Ĝ ⋊ Q)^J`: the
tensor product of their inflations to `(Ĝ ⋊ Q)^{I ⊔ J}`. -/
def SatRep.extProd {I J : Type} [Finite I] [Finite J] (V : SatRep G Λ I) (W : SatRep G Λ J) :
    SatRep G Λ (I ⊕ J) :=
  (SatRep.res G Λ Sum.inl).obj V ⊗ (SatRep.res G Λ Sum.inr).obj W

variable (Λ)

/-- GS4, adjoint-isomorphism-naturality (stand-in): for `η : G' → G` inducing an isomorphism of
adjoint groups, restriction of representations along the dual map `η̂ : Ĝ → Ĝ'`; for other `η` no
statement uses it. -/
def SatRep.dualRes {G' G : RedGrp F} (η : G' ⟶ G) (I : Type) [Finite I] :
    SatRep G' Λ I ⥤ SatRep G Λ I := sorry

/-- GS4, product-naturality (stand-in): for `G = G₁ × G₂`, the tensor product of the inflations
of `V₁` and `V₂` to `(Ĝ ⋊ Q)^I = (Ĝ₁ ⋊ Q)^I ×_{Q^I} (Ĝ₂ ⋊ Q)^I`. -/
def SatRep.prodBoxtimes {G₁ G₂ : RedGrp F} {I : Type} [Finite I] (V₁ : SatRep G₁ Λ I)
    (V₂ : SatRep G₂ Λ I) : SatRep (G₁.prod G₂) Λ I := sorry

/-- GS4 (stand-in): the dual groups of `G` and of its inner form `G_b` are identified, and with
them the Satake categories. -/
def SatRep.innerFormEquiv (b : G.ptsBreve) (I : Type) [Finite I] :
    SatRep (G.innerForm b) Λ I ≌ SatRep G Λ I := sorry

/-- GS4, levi-naturality (stand-in): for a parabolic `P` with Levi quotient `M`, restriction of
representations along `M̂ ⋊ Q → Ĝ ⋊ Q`, `(m, w) ↦ (m · (2ρ̂_G - 2ρ̂_M)(√q)^{-|w|}, w)`, where
`|·| : W_E → ℤ` sends a geometric Frobenius to `1` and `(2ρ̂_G - 2ρ̂_M)(√q)` is central in `M̂`.
This is the twist of the constant term along the parabolic opposite to `P`: it is the one that
occurs when types of modifications are normalised as in HS0/bounded-hecke-substacks, and it has
the sign opposite to that of Fargues–Scholze VI.7.13 and IX.7.2 (p. 337), where the Grassmannian
measures the second bundle relative to the first. -/
def SatRep.leviRes {G : RedGrp F} (P : G.Parabolic) (I : Type) [Finite I] :
    SatRep G Λ I ⥤ SatRep P.levi Λ I := sorry

end DualAdditions

/-- The coefficient ring `Λ` for a finite extension `E'` of `E`: the same ring, with `(√q)^f` as
square root of `q' = q^f`, `f` the residue degree. -/
def Coeff.restrictExt {F' : LocalField p} (e : F.Ext F') (Λ : Coeff F ℓ) : Coeff F' ℓ where
  ne := Λ.ne
  carrier := Λ.carrier
  sqrtq := Λ.sqrtq ^ Nat.log F.q F'.q
  sqrtq_sq := sorry

/-- VStackSheavesAndLisseCategories VS2 (stand-in): `D_■(X, Λ)` depends only on the ring `Λ`
and not on the field for which a square root of `q` is chosen. -/
def DSolid.changeField {F' : LocalField p} (e : F.Ext F') (X : VStack p) (Λ : Coeff F ℓ) :
    DSolid X (Λ.restrictExt e) ≌ DSolid X Λ := sorry

/-- GS4, weil-restriction-naturality (stand-in): for `G = Res_{E'/E} G'`, inflation of a
representation of `(Ĝ' ⋊ W_{E'})^I` to `(Ĝ ⋊ W_{E'})^I` followed by induction to
`(Ĝ ⋊ W_E)^I`. -/
def SatRep.induce {F' : LocalField p} (e : F.Ext F') (G' : RedGrp F') (Λ : Coeff F ℓ) (I : Type)
    [Finite I] : SatRep G' (Λ.restrictExt e) I ⥤ SatRep (RedGrp.weilRes e G') Λ I := sorry

/-! #### Stacks and sheaves -/

/-- BunGAndNewtonStrata BG3: `j : [∗/underline{G(E)}] ≅ Bun_G^1 → Bun_G` is an open immersion. -/
theorem BunG.trivialStratum_openImmersion (G : RedGrp F) :
    VStack.openImmersion p (BunG.trivialStratum G) := sorry

/-- `[∗/underline{J_b(E)}] → Bun_G^b → Bun_G`. -/
def BunG.stratumPoint (G : RedGrp F) (b : G.ptsBreve) :
    VStack.classifying p (G.sigmaCentralizer b) ⟶ BunG G :=
  BunG.classifyingToStratum G b ≫ BunG.stratumIncl G (RedGrp.BofG.mk b)

/-- The stalk `i^{b*} : D_lis(Bun_G, Λ) → D_lis(Bun_G^b, Λ) ≃ D(J_b(E), Λ)`, the second
equivalence by pullback along `[∗/J_b(E)] → Bun_G^b` (Fargues–Scholze VII.7.1). -/
def BunG.stalk (G : RedGrp F) (Λ : Coeff F ℓ) (b : G.ptsBreve) :
    Dlis (BunG G) Λ ⥤ DSmooth (G.sigmaCentralizer b) Λ :=
  Dlis.pullback (BunG.stratumPoint G b) Λ ⋙ (DSmooth.equivClassifying _ Λ).inverse

/-- VStackSheavesAndLisseCategories VS4 (stand-in): the left adjoint `π_{b♮} q_b^*` of `i^{b*}`,
for the chart `π_b : M_b → Bun_G` and `q_b : M_b → [∗/J_b(E)]` (Fargues–Scholze VII.7.2). For
basic `b` it is extension by zero `i^b_!`. -/
def BunG.stalkLeft (G : RedGrp F) (Λ : Coeff F ℓ) (b : G.ptsBreve) :
    DSmooth (G.sigmaCentralizer b) Λ ⥤ Dlis (BunG G) Λ := sorry

/-- VS4 (stand-in): `π_{b♮} q_b^* ⊣ i^{b*}`. -/
def BunG.stalkLeftAdj (G : RedGrp F) (Λ : Coeff F ℓ) (b : G.ptsBreve) :
    BunG.stalkLeft G Λ b ⊣ BunG.stalk G Λ b := sorry

/-- VS4 (stand-in): `Ri^b_*` on lisse sheaves, the right adjoint of `i^{b*}`. -/
def BunG.stalkRight (G : RedGrp F) (Λ : Coeff F ℓ) (b : G.ptsBreve) :
    DSmooth (G.sigmaCentralizer b) Λ ⥤ Dlis (BunG G) Λ := sorry

/-- VS4 (stand-in): `i^{b*} ⊣ Ri^b_*`. -/
def BunG.stalkRightAdj (G : RedGrp F) (Λ : Coeff F ℓ) (b : G.ptsBreve) :
    BunG.stalk G Λ b ⊣ BunG.stalkRight G Λ b := sorry

/-- The stalk at the trivial bundle, `i^{1*} = j^* : D_lis(Bun_G, Λ) → D(G(E), Λ)`. -/
def BunG.trivialStalk (G : RedGrp F) (Λ : Coeff F ℓ) : Dlis (BunG G) Λ ⥤ DSmooth G.pts Λ :=
  Dlis.pullback (BunG.trivialStratum G) Λ ⋙ (DSmooth.equivClassifying G.pts Λ).inverse

/-- Extension by zero `j_! = j_♮ : D(G(E), Λ) → D_lis(Bun_G, Λ)` along the open immersion `j`;
that `j_♮` preserves lisse objects is VStackSheavesAndLisseCategories VS3. -/
def BunG.trivialExtension (G : RedGrp F) (Λ : Coeff F ℓ) : DSmooth G.pts Λ ⥤ Dlis (BunG G) Λ :=
  ObjectProperty.lift _
    ((DSmooth.equivClassifying G.pts Λ).functor ⋙ Dlis.toSolid _ Λ ⋙
      DSolid.sharp (BunG.trivialStratum G) Λ)
    (fun _ => sorry)

/-- VS4 (stand-in): `j_! ⊣ j^*`. -/
def BunG.trivialAdj (G : RedGrp F) (Λ : Coeff F ℓ) :
    BunG.trivialExtension G Λ ⊣ BunG.trivialStalk G Λ := sorry

/-- RelativeFarguesFontaine RF2 with ClassFieldTheory (stand-in): for a family of local fields,
`∏_i Div¹_{F_i} → [∗/underline{∏_i W_{F_i}}]`, given by the torsors `Spd C → Div¹_{F_i}`. -/
def Div1.familyToClassifyingWeil {I : Type} [Finite I] (Fs : I → LocalField p) :
    (VSheaf.toStack p).obj (∏ᶜ fun i => Div1 (Fs i)) ⟶
      VStack.classifying p (∀ i, (Fs i).WeilGroup) := sorry

/-- GeometricSatakeAndFusion GS3 and GS4 (stand-in): the Satake sheaf of `⊠_i V_{μ_i}` on the
Beilinson–Drinfeld Schubert variety over `∏_i Spd Ĕ_{μ_i}`, for `Λ` killed by a power of `ℓ`. -/
def GrG.schubertSheaf (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) (Λ : Coeff F ℓ) :
    Det ((VSheaf.toStack p).obj (GrG.schubert G μ)) Λ := sorry

/-- GeometricSatakeAndFusion GS3 (stand-in): the twisted exterior product of the Satake sheaves
of the `V_{μ_i}` on the convolution Schubert variety, for `Λ` killed by a power of `ℓ`. -/
def GrG.convSchubertSheaf (G : RedGrp F) {m : ℕ} (μ : Fin m → G.Cochar) (Λ : Coeff F ℓ) :
    Det ((VSheaf.toStack p).obj (GrG.convSchubert G μ)) Λ := sorry

/-- GeometricSatakeAndFusion GS3, symmetric-constant-term (stand-in): the shift `A ↦ A[deg_P]`
by the locally constant function `deg_P` on `𝓗ck^I_M` that pairs `2ρ_G - 2ρ_M`, the sum of the
roots of `G` in the Lie algebra of the unipotent radical of `P`, with the sum of the types at the
legs; types are those of HS0/bounded-hecke-substacks, the position of the first torsor relative to
the second. -/
def HckLoc.degShift {G : RedGrp F} (P : G.Parabolic) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    Det (HckLoc P.levi I) Λ ≌ Det (HckLoc P.levi I) Λ := sorry

/-- Rapoport–Zink spaces (stand-in; EndoscopicTransferAndUnitaryTraceComparison ET.6a with
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2): for `b ∈ GL_n(ℚ̆_p)` with slopes in
`[-1, 0]`, let `𝕏_b` be the `p`-divisible group over `k` whose covariant rational Dieudonné
module, in the normalisation of the Berkeley lectures, is `(ℚ̆_p^n, bσ)`, and `d` its dimension.
This is the generic fibre at level `K` of the formal scheme of deformations of `𝕏_b` up to
quasi-isogeny, a rigid space over `ℚ̆_p` (the reflex field of a cocharacter of `GL_n` is
`ℚ_p`). For other `b` no statement uses it. -/
def RapoportZink.space (n d : ℕ) (b : (RedGrp.GLn (LocalField.Qp p) n).ptsBreve)
    (K : (RedGrp.GLn (LocalField.Qp p) n).Level) :
    RigSp ((RedGrp.GLn (LocalField.Qp p) n).reflexField
      (RedGrp.GLn.minuscule (LocalField.Qp p) n d)) := sorry

/-- Rapoport–Zink spaces (stand-in): the transition maps of the tower. -/
def RapoportZink.transition (n d : ℕ) (b : (RedGrp.GLn (LocalField.Qp p) n).ptsBreve)
    {K' K : (RedGrp.GLn (LocalField.Qp p) n).Level} (h : K' ≤ K) :
    RapoportZink.space n d b K' ⟶ RapoportZink.space n d b K := sorry

end InterfacesForCohomology

/-! ## HS0. Global Hecke stacks, chains of modifications and the twisted Grassmannian

Conventions of the stage. `G` is a reductive group over the local field `E` of `F`. A point of the
Hecke stack is `((D_i), E_1, E_2, α)` with `α` a modification from `E_1` to `E_2`; `p_1` remembers
`E_1` and `p_2` remembers `(E_2, (D_i))`. The relative position is that of `E_1` with respect to
`E_2`, in the normalisation in which `(𝒪, 𝒪(D))` has position `1` for `𝔾_m`. The interfaces have
no `G`-bundles on the curve `X_S`, so the groupoids of `S`-points are not spelled out: the stacks
of the packet are opaque declarations of type `VStack p` or `VSheaf p`, and the statements about
bundles, lattices and `B_dR` are omitted where marked. -/

section HS0

variable {F : LocalField p}

/-! ### HS0/global-hecke-correspondence -/

/-- HS0/global-hecke-correspondence. The global Hecke stack `Hck^I_G` over `(Div¹)^I`: for
`S ∈ Perf_k` the groupoid of `((D_i)_{i∈I}, E_1, E_2, α)` with `D_i` degree-one Cartier divisors
on `X_S`, `E_1`, `E_2` `G`-bundles on `X_S`, and `α : E_1 ≅ E_2` an isomorphism over
`X_S ∖ ⋃ D_i` that is meromorphic along `Σ D_i`; morphisms are the pairs `(f_1, f_2)` of
isomorphisms intertwining `α`. No bound on the poles of `α` is imposed. The packet's object: its
definition needs `G`-bundles on `X_S` (RelativeFarguesFontaine RF4), so the body is the
placeholder. -/
def HckI (G : RedGrp F) (I : Type) [Finite I] : VStack p := sorry

variable (G : RedGrp F) (I : Type) [Finite I]

/-- The source map `p_1 = h_1 : Hck^I_G → Bun_G`, `((D_i), E_1, E_2, α) ↦ E_1`. -/
def HckI.p1 : HckI G I ⟶ BunG G := sorry

/-- The target map `p_2 = h_2 : Hck^I_G → Bun_G × (Div¹)^I`,
`((D_i), E_1, E_2, α) ↦ (E_2, (D_i))`. -/
def HckI.p2 : HckI G I ⟶ BunGLegs G I := sorry

/-- The leg map `Hck^I_G → (Div¹)^I`, the second component of `p_2`. -/
def HckI.legs : HckI G I ⟶ Div1.stack F I := HckI.p2 G I ≫ prod.snd

/-- `(p_1, legs) : Hck^I_G → Bun_G × (Div¹)^I`, the map written `h_1` in HS1. -/
def HckI.h1 : HckI G I ⟶ BunGLegs G I := prod.lift (HckI.p1 G I) (HckI.legs G I)

/-- The unit `e : Bun_G × (Div¹)^I → Hck^I_G`, `(E, (D_i)) ↦ ((D_i), E, E, id)`. -/
def HckI.unit : BunGLegs G I ⟶ HckI G I := sorry

/-- `p_2 ∘ e = id`. -/
theorem HckI.unit_p2 : HckI.unit G I ≫ HckI.p2 G I = 𝟙 _ := sorry

/-- `p_1 ∘ e` is the first projection. -/
theorem HckI.unit_p1 : HckI.unit G I ≫ HckI.p1 G I = prod.fst := sorry

/-- The swap `sw(E_1, E_2, α) = (E_2, E_1, α⁻¹)`, an involution of `Hck^I_G` over `(Div¹)^I`. -/
def HckI.swap : HckI G I ≅ HckI G I := sorry

/-- `sw` is an involution. -/
theorem HckI.swap_swap : (HckI.swap G I).hom ≫ (HckI.swap G I).hom = 𝟙 _ := sorry

/-- `sw` is a map over `(Div¹)^I`. -/
theorem HckI.swap_legs : (HckI.swap G I).hom ≫ HckI.legs G I = HckI.legs G I := sorry

/-- `p_1 ∘ sw = pr_1 ∘ p_2`. -/
theorem HckI.swap_p1 : (HckI.swap G I).hom ≫ HckI.p1 G I = HckI.p2 G I ≫ prod.fst := sorry

/-- `sw ∘ e = e`. -/
theorem HckI.unit_swap : HckI.unit G I ≫ (HckI.swap G I).hom = HckI.unit G I := sorry

/-- HckI.ext. A morphism `(f_1, f_2)` of `Hck^I_G(S)` is determined by `f_2`: the automorphism
group of an object injects into that of its image under `p_2`. -/
theorem HckI.ext (S : Perfd p) (x : ((VStack.isoClasses p).obj (HckI G I)).obj (op S)) :
    Function.Injective (VStack.autMap (HckI.p2 G I) S x) := sorry
-- Omitted: the description of the isomorphisms of `Hck^I_G(S)` as the pairs `(f_1, f_2)` with
-- `α' f_1 = f_2 α` off the legs, and of the automorphism group as the `f_2 ∈ Aut(E_2)` for which
-- `α⁻¹ f_2 α` extends to `E_1`: the interfaces have no `G`-bundles on `X_S`.

variable {I}

/-- The source `Hck^I_G ×_{(Div¹)^I, Δ_a} (Div¹)^J` of the repetition map of `a : I → J`. -/
abbrev HckI.repeatSource {J : Type} [Finite J] (a : I → J) : VStack p :=
  VStack.fibre (HckI.legs G I) ((VSheaf.toStack p).map (Div1.diag F a))

/-- The projection of the source of the repetition map to `Hck^I_G`. -/
abbrev HckI.repeatFst {J : Type} [Finite J] (a : I → J) : HckI.repeatSource G a ⟶ HckI G I :=
  VStack.fibre.fst _ _

/-- The projection of the source of the repetition map to `(Div¹)^J`. -/
abbrev HckI.repeatSnd {J : Type} [Finite J] (a : I → J) :
    HckI.repeatSource G a ⟶ Div1.stack F J :=
  VStack.fibre.snd _ _

/-- The repetition map `ι_a : Hck^I_G ×_{(Div¹)^I, Δ_a} (Div¹)^J → Hck^J_G` of a map `a : I → J`
of finite sets, which restricts `α` to the complement of all legs indexed by `J`. -/
def HckI.repeat {J : Type} [Finite J] (a : I → J) : HckI.repeatSource G a ⟶ HckI G J := sorry

/-- `ι_a` is a map over `(Div¹)^J`. -/
theorem HckI.repeat_legs {J : Type} [Finite J] (a : I → J) :
    HckI.repeat G a ≫ HckI.legs G J = HckI.repeatSnd G a := sorry

/-- `ι_a` commutes with `p_1`. -/
theorem HckI.repeat_p1 {J : Type} [Finite J] (a : I → J) :
    HckI.repeat G a ≫ HckI.p1 G J = HckI.repeatFst G a ≫ HckI.p1 G I := sorry

/-- `ι_a` commutes with the bundle component of `p_2`. -/
theorem HckI.repeat_p2 {J : Type} [Finite J] (a : I → J) :
    HckI.repeat G a ≫ HckI.p2 G J ≫ prod.fst =
      HckI.repeatFst G a ≫ HckI.p2 G I ≫ prod.fst := sorry

/-- `ι_id = id`: the repetition map of the identity is the projection to `Hck^I_G`. -/
theorem HckI.repeat_id : HckI.repeat G (id : I → I) = HckI.repeatFst G id := sorry

/-- `ι_{b ∘ a} = ι_b ∘ (ι_a ×_{(Div¹)^J} (Div¹)^K)`: `u` is the projection
`(x, (D_k)) ↦ (x, Δ_b(D_k))` and `c` is the base change of `ι_a` along `Δ_b`. -/
theorem HckI.repeat_comp {J K : Type} [Finite J] [Finite K] (a : I → J) (b : J → K) :
    ∃ (u : HckI.repeatSource G (b ∘ a) ⟶ HckI.repeatSource G a)
      (c : HckI.repeatSource G (b ∘ a) ⟶ HckI.repeatSource G b),
      u ≫ HckI.repeatFst G a = HckI.repeatFst G (b ∘ a) ∧
      u ≫ HckI.repeatSnd G a =
        HckI.repeatSnd G (b ∘ a) ≫ (VSheaf.toStack p).map (Div1.diag F b) ∧
      c ≫ HckI.repeatFst G b = u ≫ HckI.repeat G a ∧
      c ≫ HckI.repeatSnd G b = HckI.repeatSnd G (b ∘ a) ∧
      c ≫ HckI.repeat G b = HckI.repeat G (b ∘ a) := sorry

/-- `ι_a` is fully faithful for every `a`. -/
theorem HckI.repeat_fullyFaithful {J : Type} [Finite J] (a : I → J) :
    VStack.fullyFaithful p (HckI.repeat G a) := sorry

/-- `ι_a` is an equivalence when `a` is surjective. -/
theorem HckI.repeat_isIso {J : Type} [Finite J] (a : I → J) (ha : Function.Surjective a) :
    IsIso (HckI.repeat G a) := sorry

/-- HckI.repeat_image, for `a : ∅ → J`: the source of `ι_a` is `Bun_G × (Div¹)^J` and `ι_a` is the
unit `e`, so its essential image is that of `e`. -/
theorem HckI.repeat_image (J : Type) [Finite J] :
    ∃ e : HckI.repeatSource G (fun i : Empty => (i.elim : J)) ≅ BunGLegs G J,
      e.hom ≫ HckI.unit G J = HckI.repeat G (fun i : Empty => (i.elim : J)) ∧
      e.hom ≫ prod.snd = HckI.repeatSnd G (fun i : Empty => (i.elim : J)) := sorry
-- Omitted: for general `a`, the essential image of `ι_a` consists of the objects whose `α`
-- extends to an isomorphism over `X_S ∖ ⋃_{j ∈ a(I)} D_j`; extension of `α` over a divisor is not
-- expressible with the interfaces.

variable (I)

/-- The localisation `loc : Hck^I_G → 𝓗ck^I_G` to the local Hecke stack, sending
`(E_1, E_2, α)` to the completions along `Σ D_i` with the induced isomorphism over `B_D(S)`. -/
def HckI.toLocal : HckI G I ⟶ HckLoc G I := sorry

/-- `loc` is a map over `(Div¹)^I`. -/
theorem HckI.toLocal_legs : HckI.toLocal G I ≫ HckLoc.legs G I = HckI.legs G I := sorry

/-- `loc` commutes with the swaps. -/
theorem HckI.toLocal_swap :
    (HckI.swap G I).hom ≫ HckI.toLocal G I = HckI.toLocal G I ≫ (HckLoc.swap G I).hom := sorry

/-- `loc` carries the unit `e` to the unit section of the local Hecke stack. -/
theorem HckI.toLocal_unit :
    HckI.unit G I ≫ HckI.toLocal G I = BunG.completion G I ≫ HckLoc.unit G I := sorry

/-- `loc` followed by the second torsor is the completion of `E_2`. -/
theorem HckI.toLocal_target :
    HckI.toLocal G I ≫ HckLoc.target G I = HckI.p2 G I ≫ BunG.completion G I := sorry

/-- HckI.empty. `Hck^∅_G ≃ Bun_G` through `p_1`, with inverse `e`. -/
theorem HckI.empty : IsIso (HckI.p1 G Empty) ∧ IsIso (HckI.unit G Empty) := sorry

/-- HckI.torus_point. For `G = 𝔾_m` and one leg over a geometric point, the isomorphism classes
of objects are classified by the leg and the pair `(deg L_1, deg L_2) ∈ ℤ²` (the degree is `-κ`),
all pairs occur, and every automorphism group is `E^×`. -/
theorem HckI.torus_point (F : LocalField p) (s : Perfd.GeomPoint p) :
    Function.Bijective (fun x : (HckI (RedGrp.Gm F) Unit).geomPts s =>
      ((-RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
          (VStack.geomPtsMap (HckI.p1 (RedGrp.Gm F) Unit) s x))) : ℤ),
       (-RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
          (VStack.geomPtsMap (HckI.p2 (RedGrp.Gm F) Unit ≫ prod.fst) s x))) : ℤ),
       VStack.geomPtsMap (HckI.legs (RedGrp.Gm F) Unit) s x)) ∧
    ∀ x : (HckI (RedGrp.Gm F) Unit).geomPts s,
      Nonempty ((HckI (RedGrp.Gm F) Unit).autGroup s.toPerfd x ≃* F.Eˣ) := sorry
-- Omitted: that the automorphism group is embedded diagonally in `Aut(L_1) × Aut(L_2)`.

-- HckI.empty_test
example : IsIso (HckI.p1 G Empty) := by sorry

-- (second clause of the test) For `𝔾_m` and a geometric point the classes are `ℤ`, through the
-- degree, and the automorphism groups are `E^×`.
example (F : LocalField p) (s : Perfd.GeomPoint p) :
    Function.Bijective (fun x : (HckI (RedGrp.Gm F) Empty).geomPts s =>
      (-RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
        (VStack.geomPtsMap (HckI.p1 (RedGrp.Gm F) Empty) s x))) : ℤ)) ∧
    ∀ x : (HckI (RedGrp.Gm F) Empty).geomPts s,
      Nonempty ((HckI (RedGrp.Gm F) Empty).autGroup s.toPerfd x ≃* F.Eˣ) := by sorry

-- HckI.torus_test
example (F : LocalField p) (s : Perfd.GeomPoint p) :
    Function.Bijective (fun x : (HckI (RedGrp.Gm F) Unit).geomPts s =>
      ((-RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
          (VStack.geomPtsMap (HckI.p1 (RedGrp.Gm F) Unit) s x))) : ℤ),
       (-RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
          (VStack.geomPtsMap (HckI.p2 (RedGrp.Gm F) Unit ≫ prod.fst) s x))) : ℤ),
       VStack.geomPtsMap (HckI.legs (RedGrp.Gm F) Unit) s x)) ∧
    ∀ x : (HckI (RedGrp.Gm F) Unit).geomPts s,
      Nonempty ((HckI (RedGrp.Gm F) Unit).autGroup s.toPerfd x ≃* F.Eˣ) := by sorry
-- Omitted: that the automorphism group is `E^×` embedded diagonally in
-- `Aut(L_1) × Aut(L_2) = E^× × E^×`; the maps of automorphism groups induced by `p_1` and `p_2`
-- are not in the interfaces.

-- HckI.repeat_test
example : IsIso (HckI.repeat G (fun _ : Fin 2 => ())) ∧
    (∃ e : HckI.repeatSource (RedGrp.Gm F) (fun i : Empty => (i.elim : Unit)) ≅
        BunGLegs (RedGrp.Gm F) Unit,
      e.hom ≫ HckI.unit (RedGrp.Gm F) Unit =
        HckI.repeat (RedGrp.Gm F) (fun i : Empty => (i.elim : Unit))) ∧
    ∀ (s : Perfd.GeomPoint p) (x : (HckI (RedGrp.Gm F) Unit).geomPts s),
      x ∈ Set.range (VStack.geomPtsMap (HckI.unit (RedGrp.Gm F) Unit) s) ↔
        (RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
            (VStack.geomPtsMap (HckI.p1 (RedGrp.Gm F) Unit) s x)) =
          (RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
            (VStack.geomPtsMap (HckI.p2 (RedGrp.Gm F) Unit ≫ prod.fst) s x)) := by sorry

-- HckI.trivial_group_test
example (F : LocalField p) :
    IsIso (HckI.legs (RedGrp.trivial F) I) ∧ IsIso (HckI.p2 (RedGrp.trivial F) I) := by sorry

/-! ### HS0/bounded-hecke-substacks -/

/-- HckI.relPos. The relative position `inv(E_1, E_2, α)` of a geometric point of the one-leg
Hecke stack: the dominant cocharacter `μ` with `α̂(e_1) ∈ e_2 · G(B⁺_dR) μ(ξ) G(B⁺_dR)` for
trivialisations `e_1`, `e_2` of the completions. It is an element of `X_*(T)⁺` once an embedding
over `E` of a splitting field `E'` into the untilt of the leg is chosen; another embedding
replaces it by a conjugate under `Gal(E'|E)`. So for a point of `Hck_G` it is defined up to the
Galois action, and the value is an orbit. -/
def HckI.relPos (s : Perfd.GeomPoint p) :
    (HckI G Unit).geomPts s → MulAction.orbitRel.Quotient F.WeilGroup G.Cochar := sorry

variable {G} in
/-- A bound for the legs indexed by `I`: finite Galois-stable sets `W_i` of dominant cocharacters,
each closed under the dominance order (Fargues–Scholze VI.10). -/
structure HckI.Bound (G : RedGrp F) (I : Type) where
  /-- The sets `W_i`. -/
  set : I → Set G.Cochar
  finite : ∀ i, (set i).Finite
  isLowerSet : ∀ i, IsLowerSet (set i)
  smul_mem : ∀ (w : F.WeilGroup) (i : I) (μ : G.Cochar), μ ∈ set i → w • μ ∈ set i

variable {G I}

/-- The bound `≤ μ•` of a tuple of Galois-invariant dominant cocharacters: `W_i = {ν | ν ≤ μ_i}`. -/
def HckI.Bound.Iic (μ : I → G.Cochar) (hμ : ∀ (w : F.WeilGroup) (i : I), w • μ i = μ i) :
    HckI.Bound G I where
  set i := Set.Iic (μ i)
  finite i := RedGrp.finite_Iic_cochar (μ i)
  isLowerSet i := isLowerSet_Iic (μ i)
  smul_mem w i ν hν := by
    have h := RedGrp.smul_cochar_mono w (Set.mem_Iic.mp hν)
    rw [hμ w i] at h
    exact h

/-- The bound `≤ μ•` for a split group. -/
def HckI.Bound.ofSplit (hG : RedGrp.isSplit F G) (μ : I → G.Cochar) : HckI.Bound G I :=
  HckI.Bound.Iic μ fun w i => RedGrp.smul_cochar_of_isSplit hG w (μ i)

variable (G I) in
/-- The bound `W_i = {0}` for all `i`. That `0` is minimal and Galois-invariant is the owner's
(ReductiveGroups). -/
def HckI.Bound.zero : HckI.Bound G I where
  set _ := {0}
  finite _ := Set.finite_singleton 0
  isLowerSet _ := sorry
  smul_mem := sorry

/-- The dual bound `W*_i = {-w₀μ | μ ∈ W_i}`. That `μ ↦ -w₀μ` preserves the dominance order and
commutes with the Galois action is the owner's (ReductiveGroups). -/
def HckI.Bound.dual (W : HckI.Bound G I) : HckI.Bound G I where
  set i := RedGrp.Cochar.dual '' W.set i
  finite i := (W.finite i).image _
  isLowerSet _ := sorry
  smul_mem := sorry

variable (G I)

/-- HS0/bounded-hecke-substacks. The bounded substack `Hck^I_{G,W}` of `Hck^I_G`: the `S`-points
such that at every geometric point and every divisor `x` among the legs the relative position at
`x`, computed with any embedding of a splitting field into the untilt of `x`, is at most
`Σ_{i : D_i = x} μ_i` for some `μ• ∈ ∏ W_i`; as the `W_i` are Galois-stable the condition does not
depend on the embedding. Here `D_i = x` is equality of divisors of `X_S`, that is of points of
`Div¹_E`. For `G` split and `W = HckI.Bound.ofSplit hG μ` it is `Hck^I_{G,≤μ•}`. The variant over
`∏_i Div¹_{E_i}` for a single tuple `μ•` is `HckI.BoundedLe`. -/
def HckI.Bounded (W : HckI.Bound G I) : VStack p := sorry

/-- The inclusion `Hck^I_{G,W} → Hck^I_G`. -/
def HckI.Bounded.incl (W : HckI.Bound G I) : HckI.Bounded G I W ⟶ HckI G I := sorry

/-- For one leg, the geometric points of `Hck_{G,W}` are those whose relative position lies in
`W`. -/
theorem HckI.Bounded.geomPts_iff (W : HckI.Bound G Unit) (s : Perfd.GeomPoint p)
    (x : (HckI G Unit).geomPts s) :
    x ∈ Set.range (VStack.geomPtsMap (HckI.Bounded.incl G Unit W) s) ↔
      ∃ μ ∈ W.set (), HckI.relPos G s x = μ.orbit := sorry
-- Omitted: the same description for several legs, where the bound at a divisor is the sum over
-- the legs equal to it.

/-- HS0/bounded-hecke-substacks, the variant over the fields of definition: `Hck^I_{G,≤μ•}`, the
bounded part of
`Hck^I_G ×_{(Div¹)^I} ∏_i Div¹_{E_i}`: at every geometric point the modification `α` is bounded at
`D_i` by `Σ_{j : D_j = D_i} μ_j` (for `𝔾_m` the inclusion `𝒪 ⊂ 𝒪(D)` is a modification from `𝒪` to
`𝒪(D)` of type `z ↦ z`). Coincidence of legs is taken in `Div¹_E`, and each `μ_j` is transported
by the `E_j`-structure of its leg. Over `(Div¹)^I` itself `HckI.Bounded` is defined for
Galois-stable bounds only. -/
def HckI.BoundedLe (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) : VStack p := sorry

/-- `Hck^I_{G,≤μ•} → Hck^I_G`. -/
def HckI.BoundedLe.toHck (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    HckI.BoundedLe G μ ⟶ HckI G I := sorry

/-- The legs `Hck^I_{G,≤μ•} → ∏_i Div¹_{E_i}`. -/
def HckI.BoundedLe.legs (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    HckI.BoundedLe G μ ⟶ (G.divBase μ).stack := sorry

/-- The legs of `Hck^I_{G,≤μ•}` lie over the legs of `Hck^I_G`. -/
theorem HckI.BoundedLe.toHck_legs (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    HckI.BoundedLe.toHck G μ ≫ HckI.legs G I =
      HckI.BoundedLe.legs G μ ≫ VSheaf.stackMap (G.divBaseToDiv1 μ) := sorry

/-- For `G` split the variant over the fields of definition is the bounded substack of the bound
`≤ μ•`: every `E_i` is `E`. -/
theorem HckI.BoundedLe.ofSplit (G : RedGrp F) {I : Type} [Finite I] (hG : RedGrp.isSplit F G)
    (μ : I → G.Cochar) :
    ∃ e : HckI.BoundedLe G μ ≅ HckI.Bounded G I (HckI.Bound.ofSplit hG μ),
      e.hom ≫ HckI.Bounded.incl G I _ = HckI.BoundedLe.toHck G μ := sorry

/-- HckI.Bounded.closed. `Hck^I_{G,W} → Hck^I_G` is a closed immersion, the preimage under `loc`
of the closed substack of the local Hecke stack defined by the same condition. -/
theorem HckI.Bounded.closed (W : HckI.Bound G I) :
    VStack.closedImmersion p (HckI.Bounded.incl G I W) ∧
    ∃ t : HckI.Bounded G I W ⟶ HckLoc.bounded G I W.set,
      VStack.IsCartesian (HckI.Bounded.incl G I W) t (HckI.toLocal G I)
        (HckLoc.boundedIncl G I W.set) := sorry
-- Omitted: stability under the action of `L⁺G` on the fibres of `p_2`.

/-- HckI.Bounded.mono. `W_i ⊂ W'_i` for all `i` implies `Hck^I_{G,W} ⊂ Hck^I_{G,W'}`; for `G`
split this contains the case `μ'_i ≤ μ_i`. -/
theorem HckI.Bounded.mono (W W' : HckI.Bound G I) (h : ∀ i, W.set i ⊆ W'.set i) :
    ∃ j : HckI.Bounded G I W ⟶ HckI.Bounded G I W',
      j ≫ HckI.Bounded.incl G I W' = HckI.Bounded.incl G I W ∧ VStack.closedImmersion p j := sorry

/-- HckI.Bounded.exhaust. Every map from a quasicompact perfectoid space to `Hck^I_G` factors
through `Hck^I_{G,W}` for some `W`. -/
theorem HckI.Bounded.exhaust (S : Perfd p) [CompactSpace ((Perfd.toTop p).obj S)]
    (x : (VSheaf.toStack p).obj ((VSheaf.ofPerfd p).obj S) ⟶ HckI G I) :
    ∃ (W : HckI.Bound G I) (y : (VSheaf.toStack p).obj ((VSheaf.ofPerfd p).obj S) ⟶
      HckI.Bounded G I W), y ≫ HckI.Bounded.incl G I W = x := sorry

/-- HckI.Bounded.unit. `e : Bun_G × (Div¹)^I → Hck^I_{G,(0)}` is an equivalence. -/
theorem HckI.Bounded.unit :
    ∃ e : BunGLegs G I ≅ HckI.Bounded G I (HckI.Bound.zero G I),
      e.hom ≫ HckI.Bounded.incl G I (HckI.Bound.zero G I) = HckI.unit G I := sorry

/-- HckI.Bounded.swap. `sw(Hck^I_{G,W}) = Hck^I_{G,W*}`, and
`inv(E_2, E_1, α⁻¹) = -w₀ · inv(E_1, E_2, α)`. -/
theorem HckI.Bounded.swap (W : HckI.Bound G I) :
    (∃ e : HckI.Bounded G I W ≅ HckI.Bounded G I W.dual,
      e.hom ≫ HckI.Bounded.incl G I W.dual =
        HckI.Bounded.incl G I W ≫ (HckI.swap G I).hom) ∧
    ∀ (s : Perfd.GeomPoint p) (x : (HckI G Unit).geomPts s) (μ : G.Cochar),
      HckI.relPos G s x = μ.orbit →
        HckI.relPos G s (VStack.geomPtsMap (HckI.swap G Unit).hom s x) = μ.dual.orbit := sorry

variable {I} in
/-- HckI.Bounded.collision. For `G` split and `a : I → J`, `ι_a` maps the pullback of
`Hck^I_{G,≤μ•}` along `Δ_a` into `Hck^J_{G,≤ν•}` with `ν_j = Σ_{a(i)=j} μ_i`; here `k` is the
base change of the inclusion of the bounded substack. When `a` is surjective, for instance for
`{1,2} → {∗}`, it is an equivalence onto `Hck^J_{G,≤ν•}`. -/
theorem HckI.Bounded.collision (hG : RedGrp.isSplit F G) {J : Type} [Finite J] (a : I → J)
    (μ : I → G.Cochar) :
    ∃ (k : VStack.fibre (HckI.Bounded.incl G I (HckI.Bound.ofSplit hG μ) ≫ HckI.legs G I)
          ((VSheaf.toStack p).map (Div1.diag F a)) ⟶ HckI.repeatSource G a)
      (j : VStack.fibre (HckI.Bounded.incl G I (HckI.Bound.ofSplit hG μ) ≫ HckI.legs G I)
          ((VSheaf.toStack p).map (Div1.diag F a)) ⟶
        HckI.Bounded G J (HckI.Bound.ofSplit hG fun j => ∑ᶠ i : {i // a i = j}, μ i.1)),
      k ≫ HckI.repeatFst G a =
        VStack.fibre.fst _ _ ≫ HckI.Bounded.incl G I (HckI.Bound.ofSplit hG μ) ∧
      k ≫ HckI.repeatSnd G a = VStack.fibre.snd _ _ ∧
      j ≫ HckI.Bounded.incl G J _ = k ≫ HckI.repeat G a ∧
      (Function.Surjective a → IsIso j) := sorry

/-- HckI.Bounded.cell. For `G` split and one leg, the open Schubert cell
`Hck_{G,μ} = Hck_{G,≤μ} ∖ ⋃_{μ' < μ} Hck_{G,≤μ'}`. -/
def HckI.Bounded.cell (hG : RedGrp.isSplit F G) (μ : G.Cochar) : VStack p := sorry

/-- The inclusion `Hck_{G,μ} → Hck_{G,≤μ}`. -/
def HckI.Bounded.cellIncl (hG : RedGrp.isSplit F G) (μ : G.Cochar) :
    HckI.Bounded.cell G hG μ ⟶ HckI.Bounded G Unit (HckI.Bound.ofSplit hG fun _ => μ) := sorry

/-- `Hck_{G,μ}` is open in `Hck_{G,≤μ}`. -/
theorem HckI.Bounded.cell_openImmersion (hG : RedGrp.isSplit F G) (μ : G.Cochar) :
    VStack.openImmersion p (HckI.Bounded.cellIncl G hG μ) := sorry

/-- The geometric points of `Hck_{G,μ}` are those of relative position exactly `μ`. -/
theorem HckI.Bounded.cell_geomPts (hG : RedGrp.isSplit F G) (μ : G.Cochar)
    (s : Perfd.GeomPoint p) (x : (HckI G Unit).geomPts s) :
    x ∈ Set.range (VStack.geomPtsMap
        (HckI.Bounded.cellIncl G hG μ ≫ HckI.Bounded.incl G Unit _) s) ↔
      HckI.relPos G s x = μ.orbit := sorry

variable {G} in
/-- HckI.Bounded.class. `μ' ≤ μ` implies `μ'♯ = μ♯` in `π₁(G)_Γ`; hence on `Hck_{G,≤μ}` the
class of the relative position is the constant `μ♯`. -/
theorem HckI.Bounded.«class» {μ' μ : G.Cochar} (h : μ' ≤ μ) :
    RedGrp.Cochar.sharp μ' = RedGrp.Cochar.sharp μ := sorry
-- Omitted: the equality in `π₁(G)` before taking Galois coinvariants; the interface has only
-- `π₁(G)_Γ`.

-- HckI.Bounded.zero_test
example : ∃ e : BunGLegs G I ≅ HckI.Bounded G I (HckI.Bound.zero G I),
    e.hom ≫ HckI.Bounded.incl G I (HckI.Bound.zero G I) = HckI.unit G I := by sorry
-- Omitted: for `GL_n` and one leg, an object with `α(Ê_1) ⊂ Ê_2` lies in `Hck_{G,(0)}` only if
-- `α(Ê_1) = Ê_2`; lattices over `B⁺_dR` are not in the interfaces.

-- HckI.Bounded.collision_test
example (F : LocalField p) (a c : ℤ) :
    IsIso (HckI.Bounded.incl (RedGrp.Gm F) (Fin 2)
        (HckI.Bound.ofSplit (RedGrp.isSplit_Gm F) ![RedGrp.Gm.cochar F a, RedGrp.Gm.cochar F c]) ≫
      HckI.p2 (RedGrp.Gm F) (Fin 2)) ∧
    ∀ (s : Perfd.GeomPoint p) (x : (HckI.Bounded (RedGrp.Gm F) (Fin 2)
        (HckI.Bound.ofSplit (RedGrp.isSplit_Gm F)
          ![RedGrp.Gm.cochar F a, RedGrp.Gm.cochar F c])).geomPts s),
      RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
          (VStack.geomPtsMap (HckI.Bounded.incl _ _ _ ≫ HckI.p1 (RedGrp.Gm F) (Fin 2)) s x))) =
        RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
          (VStack.geomPtsMap (HckI.Bounded.incl _ _ _ ≫ HckI.p2 (RedGrp.Gm F) (Fin 2) ≫ prod.fst)
            s x))) + a + c := by sorry
-- Omitted: the formula `(L_2, D_1, D_2) ↦ (L_2 ⊗ I_{D_1}^a ⊗ I_{D_2}^c, L_2, can)` for the
-- inverse, and that over the diagonal the relative position at `D` is `a + c`.

-- HckI.Bounded.GL2_test
example (F : LocalField p) :
    (∀ v w : {v : Fin 2 → ℤ // Antitone v},
      RedGrp.GLn.cochar F 2 v ≤ RedGrp.GLn.cochar F 2 w ↔
        v.1 0 + v.1 1 = w.1 0 + w.1 1 ∧ v.1 0 ≤ w.1 0) ∧
    ∀ (w : {v : Fin 2 → ℤ // Antitone v}) (s : Perfd.GeomPoint p)
      (x : (HckI (RedGrp.GLn F 2) Unit).geomPts s),
      x ∈ Set.range (VStack.geomPtsMap (HckI.Bounded.incl (RedGrp.GLn F 2) Unit
          (HckI.Bound.ofSplit (RedGrp.isSplit_GLn F 2) fun _ => RedGrp.GLn.cochar F 2 w)) s) ↔
        ∃ v : {v : Fin 2 → ℤ // Antitone v},
          HckI.relPos (RedGrp.GLn F 2) s x = (RedGrp.GLn.cochar F 2 v).orbit ∧
            v.1 0 + v.1 1 = w.1 0 + w.1 1 ∧ v.1 0 ≤ w.1 0 := by sorry
-- Omitted: the description of the fibres of `p_{2,≤(1,0)}` and `p_{2,≤(2,0)}` as sets of
-- `B⁺_dR`-lattices. With `w = (2,0)` the statement above gives the positions `(2,0)` and `(1,1)`
-- and excludes `(0,0)` and `(1,0)`.

-- HckI.Bounded.nonsplit_test
-- For `E'|E` separable quadratic and `G = Res_{E'|E} 𝔾_m` there is a cocharacter `μ` that is not
-- Galois-stable: the set `{μ}` is not a bound, and for its Galois orbit `W` the map
-- `p_{2,W} : Hck_{G,W} → Bun_G × Div¹_E` is finite étale of degree `2`.
example {F' : LocalField p} (e : F.Ext F') (he : e.IsSeparable) (h2 : e.degree = 2) :
    ∃ μ : (RedGrp.weilRes e (RedGrp.Gm F')).Cochar,
      (∃ w : F.WeilGroup, w • μ ≠ μ) ∧
      (¬ ∃ W : HckI.Bound (RedGrp.weilRes e (RedGrp.Gm F')) Unit, W.set () = {μ}) ∧
      ∀ W : HckI.Bound (RedGrp.weilRes e (RedGrp.Gm F')) Unit,
        W.set () = MulAction.orbit F.WeilGroup μ →
          VStack.finiteEtaleOfDegree p 2
            (HckI.Bounded.incl (RedGrp.weilRes e (RedGrp.Gm F')) Unit W ≫ HckI.p2 _ Unit) := by
  sorry
-- Omitted: `X_*(T) = ℤ²` with the swap and `μ = (1,0)` (the interfaces do not identify the
-- cocharacters of a Weil restriction), and that the fibre `Gr_{G,W} ≅ Spd E'` is connected. The
-- packet takes `E'|E` unramified; the statement holds for every separable quadratic extension.

-- HckI.Bounded.twisted_collision_test
-- For `E'|E` separable quadratic and the torus `G = Res_{E'|E} 𝔾_m`, with two legs:
-- `p_2 : Hck^{1,2}_{G,≤μ•} → Bun_G × ∏_i Div¹_{E_i}` is an isomorphism. In particular the fibre is
-- not empty at a point where the two legs differ by the nontrivial element `γ` of `Gal(E'|E)`.
example {F' : LocalField p} (e : F.Ext F') (he : e.IsSeparable) (h2 : e.degree = 2)
    (μ : Fin 2 → (RedGrp.weilRes e (RedGrp.Gm F')).Cochar) :
    IsIso (prod.lift
      (HckI.BoundedLe.toHck (RedGrp.weilRes e (RedGrp.Gm F')) μ ≫ HckI.p2 _ (Fin 2) ≫ prod.fst)
      (HckI.BoundedLe.legs (RedGrp.weilRes e (RedGrp.Gm F')) μ)) := by sorry
-- Omitted: `μ_1 = μ_2 = (1,0)` under `X_*(T) = ℤ²`, the formula
-- `(L_2, D'_1, D'_2) ↦ (L_2 ⊗ I_{D'_1} ⊗ I_{D'_2}, L_2, can)` for the inverse, and the positions at
-- the common image `x` of the legs: `(2,0) = μ_1 + μ_2` where `D'_2 = D'_1`, and
-- `(1,1) = μ_1 + γμ_2`, which is not `≤ (2,0)`, where `D'_2 = γ(D'_1)`. The interfaces have neither
-- the cocharacters of a Weil restriction nor the position of a point with several legs.

-- HckI.fibre_test
example (F : LocalField p) (n : ℕ) (hn : 0 < n) (s : Perfd.GeomPoint p)
    (x : s.stack ⟶ BunGLegs (RedGrp.GLn F n) Unit) :
    (∃ e : VStack.fibre (HckI.p2 (RedGrp.GLn F n) Unit) x ≅
        VStack.fibre ((VSheaf.toStack p).map (GrG.legs (RedGrp.GLn F n) Unit)) (x ≫ prod.snd),
      e.hom ≫ VStack.fibre.snd _ _ = VStack.fibre.snd _ _) ∧
    ∀ W : HckI.Bound (RedGrp.GLn F n) Unit,
      ¬ Function.Surjective (VStack.geomPtsMap (HckI.Bounded.incl (RedGrp.GLn F n) Unit W) s) :=
  by sorry
-- Omitted: the bijection of the fibre with the `B⁺_dR(C♯)`-lattices in `B_dR(C♯)ⁿ` through
-- `(E_1, α) ↦ α(Ê_1)`. The second clause is "all lattices occur": no bound exhausts the fibre.

/-! ### HS0/descent-and-bounded-fibres -/

/-- HS0/descent-and-bounded-fibres, (a) and (b). `Hck^I_G` is a small v-stack and its structure
maps are maps of v-stacks (this is in the types above); the square formed by `loc`, `p_2`, the
completion `c` and `q_2` is 2-cartesian. -/
theorem descentAndBoundedFibres :
    VStack.IsCartesian (HckI.toLocal G I) (HckI.p2 G I) (HckLoc.target G I)
      (BunG.completion G I) := sorry

/-- HS0/descent-and-bounded-fibres, (b), second form. For `x = (E_2, (D_i)) : S → Bun_G × (Div¹)^I`
such that the completion of `E_2` along the legs is trivial, the fibre of `p_2` over `x` is
`Gr^I_G ×_{(Div¹)^I} S`. -/
theorem descentAndBoundedFibres_grassmannian {S : VStack p} (x : S ⟶ BunGLegs G I)
    (hx : x ≫ BunG.completion G I = x ≫ prod.snd ≫ HckLoc.baseTrivial G I) :
    ∃ e : VStack.fibre (HckI.p2 G I) x ≅
        VStack.fibre ((VSheaf.toStack p).map (GrG.legs G I)) (x ≫ prod.snd),
      e.hom ≫ VStack.fibre.snd _ _ = VStack.fibre.snd _ _ := sorry
-- Omitted: naturality in `S`, the effect of a change of trivialisation by `g ∈ L⁺G(S)` (the left
-- action of `g` on `Gr^I_G`), and that trivialisations exist étale locally on `S`: the loop group
-- and étale covers of `S` are not in the interfaces.

/-- HS0/descent-and-bounded-fibres, (c). For every bound `W`, the restrictions of `p_2` and of
`(p_1, legs)` to `Hck^I_{G,W}` are representable in spatial diamonds, proper and of finite
`dim.trg`, and the restriction of `p_1` is representable in spatial diamonds and proper. -/
theorem descentAndBoundedFibres_bounded (W : HckI.Bound G I) :
    (VStack.reprSpatial p (HckI.Bounded.incl G I W ≫ HckI.p2 G I) ∧
      VStack.proper p (HckI.Bounded.incl G I W ≫ HckI.p2 G I) ∧
      VStack.finiteDimTrg p (HckI.Bounded.incl G I W ≫ HckI.p2 G I)) ∧
    (VStack.reprSpatial p (HckI.Bounded.incl G I W ≫ HckI.h1 G I) ∧
      VStack.proper p (HckI.Bounded.incl G I W ≫ HckI.h1 G I) ∧
      VStack.finiteDimTrg p (HckI.Bounded.incl G I W ≫ HckI.h1 G I)) ∧
    VStack.reprSpatial p (HckI.Bounded.incl G I W ≫ HckI.p1 G I) ∧
      VStack.proper p (HckI.Bounded.incl G I W ≫ HckI.p1 G I) := sorry

/-- HS0/descent-and-bounded-fibres, (d). For `G` split, one leg and `ℓ ≠ p`, `p_2` restricted to
the cell `Hck_{G,μ}` is cohomologically smooth of `ℓ`-dimension `⟨2ρ, μ⟩`; for `μ` minuscule,
`Hck_{G,≤μ} = Hck_{G,μ}`. -/
theorem descentAndBoundedFibres_cell (hG : RedGrp.isSplit F G) (μ : G.Cochar) (ℓ : ℕ)
    [Fact ℓ.Prime] (hℓ : ℓ ≠ p) :
    VStack.cohSmoothOfDim p ℓ ((RedGrp.Cochar.twoRho μ : ℕ) : ℤ)
        (HckI.Bounded.cellIncl G hG μ ≫ HckI.Bounded.incl G Unit _ ≫ HckI.p2 G Unit) ∧
      (μ.IsMinuscule → IsIso (HckI.Bounded.cellIncl G hG μ)) := sorry

/-- HS0/descent-and-bounded-fibres, (e). On the whole stack the statements of (c) fail: for
`G ≠ 1` and `I ≠ ∅` the maps `p_2` and `(p_1, legs) = p_2 ∘ sw` are not quasicompact (by (b),
`p_2` is étale locally on the target the projection from a product with `Gr^I_G`, an increasing
union of the closed subsheaves of (c)). -/
theorem descentAndBoundedFibres_whole [Nonempty I] (hG : ¬ Nonempty (G ≅ RedGrp.trivial F)) :
    ¬ VStack.quasicompact p (HckI.p2 G I) ∧ ¬ VStack.quasicompact p (HckI.h1 G I) := sorry

/-! ### HS0/structure-group-and-inner-form -/

variable {G} in
/-- HS0/structure-group-and-inner-form, (a). The pushout `f_* : Hck^I_G → Hck^I_H` of bundles and
modifications along a homomorphism `f : G → H`. -/
def HckI.map {H : RedGrp F} (f : G ⟶ H) : HckI G I ⟶ HckI H I := sorry

variable {G} in
/-- HS0/structure-group-and-inner-form, (a). `f_*` commutes with `p_1` and `p_2`, is functorial
in `f`, and carries a point of relative position `μ` to a point of relative position `f(μ)`. -/
theorem structureGroupAndInnerForm {H : RedGrp F} (f : G ⟶ H) :
    HckI.map I f ≫ HckI.p1 H I = HckI.p1 G I ≫ BunG.map f ∧
    HckI.map I f ≫ HckI.p2 H I = HckI.p2 G I ≫ prod.map (BunG.map f) (𝟙 _) ∧
    HckI.map I (𝟙 G) = 𝟙 _ ∧
    (∀ {K : RedGrp F} (g : H ⟶ K), HckI.map I (f ≫ g) = HckI.map I f ≫ HckI.map I g) ∧
    ∀ (s : Perfd.GeomPoint p) (x : (HckI G Unit).geomPts s) (μ : G.Cochar),
      HckI.relPos G s x = μ.orbit →
        HckI.relPos H s (VStack.geomPtsMap (HckI.map Unit f) s x) =
          (RedGrp.Cochar.map f μ).orbit := sorry
-- Omitted: compatibility of `f_*` with `e`, `sw`, `ι_a`, `loc` and the chain stacks; and (b),
-- central twisting `m_* : Hck^I_Z ×_{(Div¹)^I} Hck^I_G → Hck^I_G` for a central torus `Z ⊂ G`
-- (central tori and the multiplication `Z × G → G` are not in the interfaces).

variable {G} in
/-- HS0/structure-group-and-inner-form, (a), for split groups: `f_*` maps `Hck^I_{G,≤μ•}` into
`Hck^I_{H,≤f(μ•)}`. -/
theorem structureGroupAndInnerForm_bounded {H : RedGrp F} (f : G ⟶ H)
    (hG : RedGrp.isSplit F G) (hH : RedGrp.isSplit F H) (μ : I → G.Cochar) :
    ∃ j : HckI.Bounded G I (HckI.Bound.ofSplit hG μ) ⟶
        HckI.Bounded H I (HckI.Bound.ofSplit hH fun i => RedGrp.Cochar.map f (μ i)),
      j ≫ HckI.Bounded.incl H I _ = HckI.Bounded.incl G I _ ≫ HckI.map I f := sorry

/-- HS0/structure-group-and-inner-form, (c). For `b` basic the equivalence
`τ_b : Bun_G ≃ Bun_{G_b}` extends to an equivalence `Hck^I_G ≃ Hck^I_{G_b}` over `(Div¹)^I`,
commuting with `p_1` and `p_2`. -/
theorem structureGroupAndInnerForm_innerForm (b : G.ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ G.basic) :
    ∃ τ : HckI G I ≅ HckI (G.innerForm b) I,
      τ.hom ≫ HckI.p1 _ I = HckI.p1 G I ≫ (BunG.innerTwist G b hb).hom ∧
      τ.hom ≫ HckI.p2 _ I = HckI.p2 G I ≫ prod.map (BunG.innerTwist G b hb).hom (𝟙 _) := sorry

/-- HS0/structure-group-and-inner-form, (c), for one leg: the equivalence
`Hck_G ≃ Hck_{G_b}` preserves relative positions, under the identification
`RedGrp.innerFormCochar` of the conjugacy classes of cocharacters of `G` and of `G_b`. -/
theorem structureGroupAndInnerForm_innerForm_relPos (b : G.ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ G.basic) :
    ∃ τ : HckI G Unit ≅ HckI (G.innerForm b) Unit,
      τ.hom ≫ HckI.p1 _ Unit = HckI.p1 G Unit ≫ (BunG.innerTwist G b hb).hom ∧
      τ.hom ≫ HckI.p2 _ Unit =
        HckI.p2 G Unit ≫ prod.map (BunG.innerTwist G b hb).hom (𝟙 _) ∧
      ∀ (s : Perfd.GeomPoint p) (x : (HckI G Unit).geomPts s) (μ : G.Cochar),
        HckI.relPos G s x = μ.orbit →
          HckI.relPos (G.innerForm b) s (VStack.geomPtsMap τ.hom s x) =
            (G.innerFormCochar b hb μ).orbit := sorry
-- Omitted: the same for several legs (the position of a point with several legs is not in the
-- interfaces); that the equivalences `τ` of the last two statements are the same one, the map
-- `(E_1, E_2, α) ↦ (τ_b E_1, τ_b E_2, u ↦ u ∘ α⁻¹)`; its compatibility with `e`, `sw`, `ι_a`, the
-- chain stacks and their composition maps; and that it maps `Hck^I_{G,W}` onto `Hck^I_{G_b,W}`
-- (the transport of a bound from `G` to `G_b` is not in the interfaces).

/-- HS0/structure-group-and-inner-form, (d). At a geometric point of the one-leg Hecke stack with
`E_1` of position `μ` relative to `E_2`: `κ(E_1) = κ(E_2) + μ♯` in `π₁(G)_Γ`. -/
theorem structureGroupAndInnerForm_kottwitz (s : Perfd.GeomPoint p)
    (x : (HckI G Unit).geomPts s) (μ : G.Cochar) (hx : HckI.relPos G s x = μ.orbit) :
    G.kottwitz (BunG.geomPtsEquiv G s (VStack.geomPtsMap (HckI.p1 G Unit) s x)) =
      G.kottwitz (BunG.geomPtsEquiv G s (VStack.geomPtsMap (HckI.p2 G Unit ≫ prod.fst) s x)) +
        RedGrp.Cochar.sharp μ := sorry

/-- HS0/structure-group-and-inner-form, (d), several legs, `G` split: at a geometric point of
`Hck^I_{G,≤μ•}`, `κ(E_1) = κ(E_2) + Σ_i μ_i♯`; a cocharacter below `μ` has the class of `μ`. -/
theorem structureGroupAndInnerForm_kottwitz_bounded (hG : RedGrp.isSplit F G) (μ : I → G.Cochar)
    (s : Perfd.GeomPoint p) (x : (HckI.Bounded G I (HckI.Bound.ofSplit hG μ)).geomPts s) :
    G.kottwitz (BunG.geomPtsEquiv G s
        (VStack.geomPtsMap (HckI.Bounded.incl G I _ ≫ HckI.p1 G I) s x)) =
      G.kottwitz (BunG.geomPtsEquiv G s
        (VStack.geomPtsMap (HckI.Bounded.incl G I _ ≫ HckI.p2 G I ≫ prod.fst) s x)) +
        ∑ᶠ i, RedGrp.Cochar.sharp (μ i) := sorry
-- Omitted: that under `sw` the position becomes `-w₀μ`, of class `-μ♯`, and the consequence for
-- the Beauville–Laszlo map (the Schubert cell `Gr_{G,μ}` goes into the locus `κ = μ♯`); the
-- Beauville–Laszlo map to `Bun_G` is used in this file only through the twisted Grassmannian.

end HS0

section HS0Chains

variable {F : LocalField p}

/-! ### HS0/chains-and-composition

An ordered partition `I = I_1 ⊔ … ⊔ I_m` into possibly empty parts is a map `part : I → Fin m`,
with `I_j = {i // part i = j}`. The chain is `E_0 ⇢ E_1 ⇢ … ⇢ E_m`, with `α_j : E_{j-1} ⇢ E_j` a
modification along the legs of the `j`-th part; in Lean the parts and the modifications are
numbered from `0` and the bundles by `Fin (m + 1)`. -/

/-- HS0/chains-and-composition. The stack `Hck^{I;I_1,…,I_m}_G` of chains of modifications:
legs `(D_i)_{i∈I}`, `G`-bundles `E_0, …, E_m` on `X_S` and isomorphisms
`α_j : E_{j-1} ≅ E_j` off `D_{I_j}`, meromorphic along `D_{I_j}`; morphisms are compatible tuples
of isomorphisms of the `E_j`. -/
def ModificationChain (G : RedGrp F) {I : Type} [Finite I] {m : ℕ} (part : I → Fin m) :
    VStack p := sorry

variable (G : RedGrp F) {I : Type} [Finite I] {m : ℕ}

/-- ModificationChain.proj. `q_j : Hck^{I;I_1,…,I_m}_G → Hck^{I_j}_G`,
the chain `↦ ((D_i)_{i∈I_j}, E_{j-1}, E_j, α_j)`. -/
def ModificationChain.proj (part : I → Fin m) (j : Fin m) :
    ModificationChain G part ⟶ HckI G {i // part i = j} := sorry

/-- The maps to `Bun_G` remembering `E_j`, `0 ≤ j ≤ m`. -/
def ModificationChain.bundle (part : I → Fin m) (j : Fin (m + 1)) :
    ModificationChain G part ⟶ BunG G := sorry

/-- The source bundle of the `j`-th modification is `E_{j-1}`. -/
theorem ModificationChain.proj_p1 (part : I → Fin m) (j : Fin m) :
    ModificationChain.proj G part j ≫ HckI.p1 G _ = ModificationChain.bundle G part j.castSucc :=
  sorry

/-- The target bundle of the `j`-th modification is `E_j`. -/
theorem ModificationChain.proj_p2 (part : I → Fin m) (j : Fin m) :
    ModificationChain.proj G part j ≫ HckI.p2 G _ ≫ prod.fst =
      ModificationChain.bundle G part j.succ := sorry

/-- ModificationChain.compose. The composition `c : Hck^{I;I_1,…,I_m}_G → Hck^I_G`, the chain
`↦ ((D_i)_{i∈I}, E_0, E_m, α_m ∘ ⋯ ∘ α_1)`. -/
def ModificationChain.compose (part : I → Fin m) : ModificationChain G part ⟶ HckI G I := sorry

/-- `c` commutes with the map remembering `E_0`. -/
theorem ModificationChain.compose_p1 (part : I → Fin m) :
    ModificationChain.compose G part ≫ HckI.p1 G I = ModificationChain.bundle G part 0 := sorry

/-- `c` commutes with the map remembering `E_m`. -/
theorem ModificationChain.compose_p2 (part : I → Fin m) :
    ModificationChain.compose G part ≫ HckI.p2 G I ≫ prod.fst =
      ModificationChain.bundle G part (Fin.last m) := sorry

/-- `c` commutes with the leg maps. -/
theorem ModificationChain.compose_legs (part : I → Fin m) (j : Fin m) :
    ModificationChain.compose G part ≫ HckI.legs G I ≫
        (VSheaf.toStack p).map (Div1.diag F (Subtype.val : {i // part i = j} → I)) =
      ModificationChain.proj G part j ≫ HckI.legs G _ := sorry

/-- ModificationChain.fibreProduct. The chain stack is the iterated fibre product
`Hck^{I_1}_G ×_{Bun_G} ⋯ ×_{Bun_G} Hck^{I_m}_G`: forgetting the last modification is a map `t` to
the chain stack of the first `m` parts, and the chain stack of `m + 1` parts is the 2-fibre
product of that stack and `Hck^{I_{m+1}}_G` over `Bun_G`, formed with `E_m` on both sides. -/
theorem ModificationChain.fibreProduct (part : I → Fin (m + 1)) :
    ∃ t : ModificationChain G part ⟶
        ModificationChain G (fun i : {i // part i ≠ Fin.last m} => (part i.1).castPred i.2),
      (∀ k : Fin (m + 1), t ≫ ModificationChain.bundle G _ k =
        ModificationChain.bundle G part k.castSucc) ∧
      VStack.IsCartesian t (ModificationChain.proj G part (Fin.last m))
        (ModificationChain.bundle G _ (Fin.last m)) (HckI.p1 G _) := sorry
-- Omitted: that `t` forgets the last modification and nothing else, that is `t ≫ q_j = q_j` for
-- `j < m` and compatibility with the legs (the index sets of the parts of the two partitions are
-- different types, so the two sides have different targets); with these clauses the statement
-- says that `(q_1, …, q_m)` is the equivalence to the iterated fibre product.

/-- The chain stack of the partition with one part is `Hck^I_G`. -/
theorem ModificationChain.fibreProduct_one (part : I → Fin 1) :
    IsIso (ModificationChain.compose G part) ∧ IsIso (ModificationChain.proj G part 0) := sorry

/-- The chain stack of no parts (and no legs) is `Bun_G`. -/
theorem ModificationChain.fibreProduct_zero (part : I → Fin 0) :
    IsIso (ModificationChain.bundle G part 0) := sorry

/-- The merge map of a monotone map `f` of the sets of parts: consecutive modifications whose
parts have the same image under `f` are composed. For `f` collapsing `j` and `j + 1` it is the
map `c_j` of the packet. -/
def ModificationChain.merge {n : ℕ} (part : I → Fin m) (f : Fin m → Fin n) (hf : Monotone f) :
    ModificationChain G part ⟶ ModificationChain G (f ∘ part) := sorry

/-- ModificationChain.assoc. Merge maps compose, so they commute with one another, and every
composite of merges from the partition `(I_1, …, I_m)` to the one-part partition is `c`. -/
theorem ModificationChain.assoc {n k : ℕ} (part : I → Fin m) (f : Fin m → Fin n)
    (hf : Monotone f) (g : Fin n → Fin k) (hg : Monotone g) :
    ModificationChain.merge G part f hf ≫ ModificationChain.merge G (f ∘ part) g hg =
        ModificationChain.merge G part (g ∘ f) (hg.comp hf) ∧
      ModificationChain.merge G part f hf ≫ ModificationChain.compose G (f ∘ part) =
        ModificationChain.compose G part := sorry

/-- ModificationChain.unit. Inserting an empty part at the place `j` (with `E_j = E_{j-1}` and
`α_j = id`) is an equivalence of chain stacks, compatible with `c`. -/
theorem ModificationChain.unit (part : I → Fin m) (j : Fin (m + 1)) :
    ∃ e : ModificationChain G part ≅ ModificationChain G (j.succAbove ∘ part),
      e.hom ≫ ModificationChain.compose G (j.succAbove ∘ part) =
        ModificationChain.compose G part := sorry
-- Omitted: that the inverse of this equivalence is the map forgetting `(E_j, α_j)` after
-- composing; it is the merge map of a monotone retraction of `j.succAbove`.

/-- ModificationChain.compose_disjoint. Over the locus `(Div¹)^{I;I_1,…,I_m}` where legs in
different parts are disjoint, `c` is an equivalence. -/
theorem ModificationChain.compose_disjoint (part : I → Fin m) :
    ∃ e : VStack.fibre (ModificationChain.compose G part ≫ HckI.legs G I)
          ((VSheaf.toStack p).map (Div1.disjointLocusIncl F part)) ≅
        VStack.fibre (HckI.legs G I) ((VSheaf.toStack p).map (Div1.disjointLocusIncl F part)),
      e.hom ≫ VStack.fibre.fst _ _ = VStack.fibre.fst _ _ ≫ ModificationChain.compose G part ∧
      e.hom ≫ VStack.fibre.snd _ _ = VStack.fibre.snd _ _ := sorry
-- Omitted: the formula for the inverse (`E_j` is `E_m` modified at `D_{I_{j+1}}, …, D_{I_m}`
-- only).

/-- ModificationChain.convolution. For the parts `{1}`, `{2}` over the diagonal of `(Div¹)²`,
the fibre of the chain stack over `x = (E_2, D)`, with the completion of `E_2` trivial, is
`LG ×^{L⁺G} Gr_G` over `S`. -/
theorem ModificationChain.convolution {S : VStack p} (x : S ⟶ BunGLegs G Unit)
    (hx : x ≫ BunG.completion G Unit = x ≫ prod.snd ≫ HckLoc.baseTrivial G Unit) :
    ∃ e : VStack.fibre
          (ModificationChain.compose G (id : Fin 2 → Fin 2) ≫ HckI.p2 G (Fin 2))
          (x ≫ prod.map (𝟙 _) ((VSheaf.toStack p).map (Div1.diag F fun _ : Fin 2 => ()))) ≅
        VStack.fibre ((VSheaf.toStack p).map (GrG.convolutionLegs G)) (x ≫ prod.snd),
      e.hom ≫ VStack.fibre.snd _ _ = VStack.fibre.snd _ _ := sorry
-- Omitted: that under this identification and that of `descentAndBoundedFibres_grassmannian` the
-- map `c` is the multiplication `LG ×^{L⁺G} Gr_G → Gr_G`, and the identification for `m`
-- singleton parts with the convolution Grassmannian of Scholze–Weinstein 20.4.2, with
-- `P_r = E_{m-r}` and `S♯_r` the leg of the part `I_{m+1-r}`.

/-- The closed substack `Hck^{I;I_1,…,I_m}_{G,≤μ•}` of bounded chains, for `G` split: each `q_j`
lands in `Hck^{I_j}_{G,≤(μ_i)_{i∈I_j}}`. -/
def ModificationChain.Bounded (hG : RedGrp.isSplit F G) (part : I → Fin m) (μ : I → G.Cochar) :
    VStack p := sorry

/-- The inclusion of the bounded chains. -/
def ModificationChain.Bounded.incl (hG : RedGrp.isSplit F G) (part : I → Fin m)
    (μ : I → G.Cochar) : ModificationChain.Bounded G hG part μ ⟶ ModificationChain G part := sorry

/-- On bounded chains each `q_j` lands in the bounded Hecke stack of the `j`-th part, and the
inclusion of the bounded chains is a closed immersion. -/
theorem ModificationChain.Bounded.proj_factors (hG : RedGrp.isSplit F G) (part : I → Fin m)
    (μ : I → G.Cochar) (j : Fin m) :
    VStack.closedImmersion p (ModificationChain.Bounded.incl G hG part μ) ∧
    ∃ q : ModificationChain.Bounded G hG part μ ⟶
        HckI.Bounded G {i // part i = j} (HckI.Bound.ofSplit hG fun i => μ i.1),
      q ≫ HckI.Bounded.incl G _ _ =
        ModificationChain.Bounded.incl G hG part μ ≫ ModificationChain.proj G part j := sorry

/-- ModificationChain.bound_add. `c` maps bounded chains into `Hck^I_{G,≤μ•}` (positions at a
common leg add), and `c_{≤μ•}` is proper, representable in spatial diamonds and surjective. -/
theorem ModificationChain.bound_add (hG : RedGrp.isSplit F G) (part : I → Fin m)
    (μ : I → G.Cochar) :
    ∃ c : ModificationChain.Bounded G hG part μ ⟶ HckI.Bounded G I (HckI.Bound.ofSplit hG μ),
      c ≫ HckI.Bounded.incl G I _ =
        ModificationChain.Bounded.incl G hG part μ ≫ ModificationChain.compose G part ∧
      VStack.proper p c ∧ VStack.reprSpatial p c ∧ VStack.surjective p c := sorry

/-- ModificationChain.swap. Reversing a chain is an equivalence onto the chain stack of the
reversed partition, and `c` of the reversed chain is `sw` of `c` of the chain. -/
theorem ModificationChain.swap (part : I → Fin m) :
    ∃ e : ModificationChain G part ≅ ModificationChain G (Fin.rev ∘ part),
      e.hom ≫ ModificationChain.compose G (Fin.rev ∘ part) =
        ModificationChain.compose G part ≫ (HckI.swap G I).hom ∧
      ∀ k : Fin (m + 1), e.hom ≫ ModificationChain.bundle G (Fin.rev ∘ part) k =
        ModificationChain.bundle G part k.rev := sorry

/-- The degree (`-κ`) of the `j`-th line bundle of a chain for `𝔾_m` at a geometric point. -/
def ModificationChain.torusDegree (F : LocalField p) {I : Type} [Finite I] {m : ℕ}
    (part : I → Fin m) (s : Perfd.GeomPoint p) (j : Fin (m + 1))
    (x : (ModificationChain (RedGrp.Gm F) part).geomPts s) : ℤ :=
  -RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
    (VStack.geomPtsMap (ModificationChain.bundle (RedGrp.Gm F) part j) s x)))

/-- The two legs of a geometric point of `(Div¹)²` coincide. -/
def Div1.Collide (F : LocalField p) (s : Perfd.GeomPoint p)
    (l : (Div1.stack F (Fin 2)).geomPts s) : Prop :=
  VStack.geomPtsMap ((VSheaf.toStack p).map (Pi.π (fun _ : Fin 2 => Div1 F) 0)) s l =
    VStack.geomPtsMap ((VSheaf.toStack p).map (Pi.π (fun _ : Fin 2 => Div1 F) 1)) s l

-- ModificationChain.torus_collision_test
example (F : LocalField p) (s : Perfd.GeomPoint p) :
    Function.Bijective (fun x : (ModificationChain (RedGrp.Gm F) (id : Fin 2 → Fin 2)).geomPts s =>
      (ModificationChain.torusDegree F id s 0 x, ModificationChain.torusDegree F id s 1 x,
        ModificationChain.torusDegree F id s 2 x,
        VStack.geomPtsMap (ModificationChain.compose (RedGrp.Gm F) id ≫ HckI.legs _ _) s x)) ∧
    ∀ y : (HckI (RedGrp.Gm F) (Fin 2)).geomPts s,
      Div1.Collide F s (VStack.geomPtsMap (HckI.legs (RedGrp.Gm F) (Fin 2)) s y) →
        (VStack.geomPtsMap (ModificationChain.compose (RedGrp.Gm F) (id : Fin 2 → Fin 2)) s ⁻¹'
          {y}).Infinite := by sorry

-- ModificationChain.torus_disjoint_test
example (F : LocalField p) (s : Perfd.GeomPoint p)
    (y : (HckI (RedGrp.Gm F) (Fin 2)).geomPts s)
    (hy : ¬ Div1.Collide F s (VStack.geomPtsMap (HckI.legs (RedGrp.Gm F) (Fin 2)) s y)) :
    ∃! x, VStack.geomPtsMap (ModificationChain.compose (RedGrp.Gm F) (id : Fin 2 → Fin 2)) s x =
      y := by sorry
-- Omitted: the coordinates `(deg L_2, b, a)` on chains and `(deg L_2, a, b)` on objects of
-- `Hck^{1,2}_{𝔾_m}` over `(D_1, D_2)`, in which `c` is the identity; the multiplicity of a
-- modification at each of two distinct legs is not in the interfaces.

-- ModificationChain.GL2_test
example (F : LocalField p) (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 0 = 1 ∧ v.1 1 = 0)
    (s : Perfd.GeomPoint p) :
    ∃ c : ModificationChain.Bounded (RedGrp.GLn F 2) (RedGrp.isSplit_GLn F 2)
          (id : Fin 2 → Fin 2) (fun _ => RedGrp.GLn.cochar F 2 v) ⟶
        HckI.Bounded (RedGrp.GLn F 2) (Fin 2)
          (HckI.Bound.ofSplit (RedGrp.isSplit_GLn F 2) fun _ => RedGrp.GLn.cochar F 2 v),
      c ≫ HckI.Bounded.incl _ _ _ = ModificationChain.Bounded.incl _ _ _ _ ≫
        ModificationChain.compose (RedGrp.GLn F 2) (id : Fin 2 → Fin 2) ∧
      Function.Surjective (VStack.geomPtsMap c s) ∧
      ¬ Function.Injective (VStack.geomPtsMap c s) := by sorry
-- Omitted: the description by flags of lattices `Λ_0 ⊂ Λ_1 ⊂ Ê_2`, and that the fibre of `c` is
-- one point over a lattice of position `(2,0)` and `ℙ¹(C♯)` over `ξÊ_2`.

-- ModificationChain.empty_part_test
example : IsIso (ModificationChain.compose G (fun _ : I => (0 : Fin 2))) ∧
    IsIso (ModificationChain.compose G (fun _ : I => (0 : Fin 1))) := by sorry

end HS0Chains

section HS0Twisted

variable {F : LocalField p}

/-! ### HS0/twisted-period-grassmannian

The node is stated for `E = ℚ_p`. The object is declared for every local field, so that the tower
over a general local field (HS2/general-local-field) can refer to it; every statement of this
node is for `LocalField.Qp p`, except the two charts `TwistedPeriodData.toBD` and
`TwistedPeriodData.collision`: HS3/satake-coefficients-and-partial-frobenius uses them over a
general local field (Fargues–Scholze IX.3, p. 326), so they are declared for every local field. -/

/-- HS0/twisted-period-grassmannian. The twisted Beilinson–Drinfeld Grassmannian
`Gr^{tw,b}_{G,≤μ•}` over `∏_i Spd Ĕ_{μ_i}` (Scholze–Weinstein 23.5.1): for `S` with untilts
`S♯_i`, the triples `(P_η, φ, ι)` of a `G`-torsor on `S ×̇ Spa E`, an isomorphism
`φ : Frob_S^*P_η ≅ P_η` off the untilts and meromorphic along them, and a trivialisation `ι` of
`P_η` near infinity carrying `φ` to `b × Frob_S`, with the position of `P_η` relative to
`Frob_S^*P_η` at `S♯_i` bounded by `Σ_{j : S♯_j = S♯_i} μ_j`. -/
def TwistedPeriodData (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) :
    VSheaf p := sorry

/-- The map to the base of the legs. -/
def TwistedPeriodData.legs (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) : TwistedPeriodData G b μ ⟶ G.legBase μ := sorry

/-- TwistedPeriodData.frobenius. The projection `(P_η, φ, ι) ↦ (P_η, φ)`: the isomorphism `φ` on
the complement of the legs, meromorphic along the legs. -/
def TwistedPeriodData.frobenius (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) :
    (VSheaf.toStack p).obj (TwistedPeriodData G b μ) ⟶ FrobTorsorY G μ := sorry

/-- The legs of `(P_η, φ)` are those of the triple. -/
theorem TwistedPeriodData.frobenius_legs (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) :
    TwistedPeriodData.frobenius G b μ ≫ FrobTorsorY.legs G μ =
      (VSheaf.toStack p).map (TwistedPeriodData.legs G b μ) := sorry

/-- TwistedPeriodData.framing. The trivialisation `ι`: it identifies the bundle on `X_S` to which
`(P_η, φ)` descends near infinity with `E_b`, so the triple is a point of the 2-fibre product of
the stack of pairs `(P_η, φ)` with the point `x_b` of `Bun_G`. -/
def TwistedPeriodData.framing (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) :
    (VSheaf.toStack p).obj (TwistedPeriodData G b μ) ⟶
      VStack.fibre (FrobTorsorY.nearInfinity G μ) (BunG.point G b) := sorry

/-- Forgetting `ι` from the framed pair gives `(P_η, φ)`. -/
theorem TwistedPeriodData.framing_fst (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) :
    TwistedPeriodData.framing G b μ ≫ VStack.fibre.fst _ _ = TwistedPeriodData.frobenius G b μ :=
  sorry
-- Omitted: that `ι` extends uniquely to `S ×̇ Spa ℚ_p ∖ ⋃_{i,n≥0} φ⁻ⁿ(S♯_i)`, meromorphically
-- along these divisors, with `φ = b × Frob_S` in the extended trivialisation: the spaces
-- `Y_{[r,∞)}(S)` and torsors on them are not in the interfaces.

variable (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) {I : Type} [Finite I]

/-- TwistedPeriodData.ext. A triple is determined by `(P_η, φ)` and `ι`, and an isomorphism of
triples is unique: the map to the stack of framed pairs is fully faithful. -/
theorem TwistedPeriodData.ext (μ : I → G.Cochar) :
    VStack.fullyFaithful p (TwistedPeriodData.framing G b μ) := sorry
-- Omitted: that a triple is determined by the lattices of `P_η` relative to the extended `ι`
-- along the divisors `S♯_i`.

/-- TwistedPeriodData.one_leg. For one leg and every `b`, completion along `S♯_1` is an
isomorphism `Gr^{tw,b}_{G,≤μ} ≅ Gr_{G,Spd Ĕ_μ,≤μ}`. -/
def TwistedPeriodData.one_leg (μ : Unit → G.Cochar) :
    TwistedPeriodData G b μ ≅ GrG.schubert G μ := sorry

/-- The one-leg isomorphism is over `Spd Ĕ_μ`. -/
theorem TwistedPeriodData.one_leg_legs (μ : Unit → G.Cochar) :
    (TwistedPeriodData.one_leg G b μ).hom ≫ GrG.schubertLegs G μ = TwistedPeriodData.legs G b μ :=
  sorry

/-- The open locus of `∏_i Spd Ĕ_{μ_i}` where `S♯_i ≠ φⁿ(S♯_j)` for all `i ≠ j` and `n ≠ 0`. -/
def TwistedPeriodData.bdLocus {F : LocalField p} (G : RedGrp F) {I : Type} [Finite I]
    (μ : I → G.Cochar) : VSheaf p := sorry

/-- The inclusion of the locus off the Frobenius-twisted partial diagonals. -/
def TwistedPeriodData.bdLocusIncl {F : LocalField p} (G : RedGrp F) {I : Type} [Finite I]
    (μ : I → G.Cochar) : TwistedPeriodData.bdLocus G μ ⟶ G.legBase μ := sorry

/-- TwistedPeriodData.toBD. Off the Frobenius-twisted partial diagonals, completion along
`Σ_i S♯_i` is an isomorphism of `Gr^{tw,b}_{G,≤μ•}` onto the Beilinson–Drinfeld Schubert variety,
for every `b`. -/
def TwistedPeriodData.toBD {F : LocalField p} (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) :
    pullback (TwistedPeriodData.legs G b μ) (TwistedPeriodData.bdLocusIncl G μ) ≅
      pullback (GrG.schubertLegs G μ) (TwistedPeriodData.bdLocusIncl G μ) := sorry

/-- The comparison with the Beilinson–Drinfeld Schubert variety is over the base. -/
theorem TwistedPeriodData.toBD_snd {F : LocalField p} (G : RedGrp F) (b : G.ptsBreve) {I : Type}
    [Finite I] (μ : I → G.Cochar) :
    (TwistedPeriodData.toBD G b μ).hom ≫ pullback.snd _ _ = pullback.snd _ _ := sorry

open Classical in
/-- The partial Frobenius `φ_i` of `∏_i Spd Ĕ_{μ_i}`: the Frobenius of the `i`-th factor and the
identity of the others. No placeholder. (Its underlying map is `partialFrob` of HS3.) -/
def TwistedPeriodData.partialFrob {F : LocalField p} (G : RedGrp F) {I : Type} [Finite I]
    (μ : I → G.Cochar) (i : I) : Aut (G.legBase μ) :=
  Limits.Pi.mapIso fun j => if j = i then (G.reflexField (μ j)).spdBreveFrob else Iso.refl _

/-- For two legs, the open locus where `S♯_2 ≠ φ⁻ⁿ(S♯_1)` for all `n ≠ m`. -/
def TwistedPeriodData.collisionLocus {F : LocalField p} (G : RedGrp F) (μ : Fin 2 → G.Cochar)
    (m : ℕ) : VSheaf p := sorry

/-- The inclusion of the locus around the `m`-th Frobenius-twisted diagonal. -/
def TwistedPeriodData.collisionLocusIncl {F : LocalField p} (G : RedGrp F)
    (μ : Fin 2 → G.Cochar) (m : ℕ) : TwistedPeriodData.collisionLocus G μ m ⟶ G.legBase μ := sorry

/-- TwistedPeriodData.collision. For two legs and `m > 0`, over the open locus where
`S♯_2 ≠ φ⁻ⁿ(S♯_1)` for all `n ≠ m`, `Gr^{tw,b}` is the pullback under `(φ × 1)⁻ᵐ` of the
convolution Schubert variety: modify the trivial torsor at `S♯_1`, continue by `φ`, then modify
at `S♯_2`. -/
def TwistedPeriodData.collision {F : LocalField p} (G : RedGrp F) (b : G.ptsBreve)
    (μ : Fin 2 → G.Cochar) (m : ℕ) (hm : 0 < m) :
    pullback (TwistedPeriodData.legs G b μ) (TwistedPeriodData.collisionLocusIncl G μ m) ≅
      pullback (GrG.convSchubertLegs G μ ≫ (TwistedPeriodData.partialFrob G μ 0 ^ m).hom)
        (TwistedPeriodData.collisionLocusIncl G μ m) := sorry

/-- The convolution chart is over the base. -/
theorem TwistedPeriodData.collision_snd {F : LocalField p} (G : RedGrp F) (b : G.ptsBreve)
    (μ : Fin 2 → G.Cochar) (m : ℕ) (hm : 0 < m) :
    (TwistedPeriodData.collision G b μ m hm).hom ≫ pullback.snd _ _ = pullback.snd _ _ := sorry
-- Omitted: that on the common locus this chart and the Beilinson–Drinfeld chart differ by the
-- Frobenius identification composed with left translation by `b_m = b σ(b) ⋯ σ^{m-1}(b)` at the
-- first leg; the action of `G(Ĕ)` on Schubert varieties is not in the interfaces. The case
-- `m < 0` is the same statement with the two legs exchanged.

/-- σ-conjugation is an action: `(y' y) · b = y' · (y · b)`. -/
theorem RedGrp.sigmaConj_mul {F : LocalField p} (G : RedGrp F) (y' y b : G.ptsBreve) :
    G.sigmaConj (y' * y) b = G.sigmaConj y' (G.sigmaConj y b) := by
  simp [RedGrp.sigmaConj, mul_assoc]

/-- TwistedPeriodData.sigma_conj. For `y ∈ G(Ĕ)`, `(P_η, φ, ι) ↦ (P_η, φ, (y × id) ∘ ι)` is an
isomorphism `Gr^{tw,b} ≅ Gr^{tw, y b σ(y)⁻¹}`. -/
def TwistedPeriodData.sigma_conj (μ : I → G.Cochar) (y : G.ptsBreve) :
    TwistedPeriodData G b μ ≅ TwistedPeriodData G (G.sigmaConj y b) μ := sorry

/-- The change of framing is over the base of the legs. -/
theorem TwistedPeriodData.sigma_conj_legs (μ : I → G.Cochar) (y : G.ptsBreve) :
    (TwistedPeriodData.sigma_conj G b μ y).hom ≫ TwistedPeriodData.legs G _ μ =
      TwistedPeriodData.legs G b μ := sorry

/-- The changes of framing by `y` and then by `y'` compose to the change of framing by `y' y`. -/
theorem TwistedPeriodData.sigma_conj_mul (μ : I → G.Cochar) (y y' : G.ptsBreve) :
    (TwistedPeriodData.sigma_conj G b μ y).hom ≫
        (TwistedPeriodData.sigma_conj G (G.sigmaConj y b) μ y').hom =
      (TwistedPeriodData.sigma_conj G b μ (y' * y)).hom ≫
        eqToHom (by rw [RedGrp.sigmaConj_mul]) := sorry

/-- TwistedPeriodData.truncation. Over a quasicompact open `U` of the base (quasicompact as a
v-sheaf: its underlying space is compact; the map `U → Spd k` is not quasicompact) there is `n₀`
such that recording the modifications at `φ⁻ⁿ(S♯_i)`, `0 ≤ n < n₀`, embeds `Gr^{tw,b}_{≤μ•}|_U`
into the Schubert variety of the Beilinson–Drinfeld Grassmannian with legs indexed by
`I × Fin n₀` over their reflex bases, the leg `(i, n)` carrying the bound `μ_i`. -/
theorem TwistedPeriodData.truncation (μ : I → G.Cochar) (U : VSheaf p) (u : U ⟶ G.legBase μ)
    (hu : VStack.openImmersion p ((VSheaf.toStack p).map u)) [CompactSpace U.top] :
    ∃ (n₀ : ℕ)
      (j : pullback (TwistedPeriodData.legs G b μ) u ⟶
        GrG.schubert G (fun x : I × Fin n₀ => μ x.1)),
      VStack.locallyClosedImmersion p ((VSheaf.toStack p).map j) := sorry
-- Omitted: that the legs of the image are `(φ⁻ⁿ(S♯_i))`, and that the map is a closed embedding
-- into the part of the Schubert variety over `U × φ⁻¹(U) × ⋯ × φ^{-n₀+1}(U)`; the partial
-- Frobenii of a product of leg bases of different reflex fields are not in the interfaces.

/-- TwistedPeriodData.proper. `Gr^{tw,b}_{G,≤μ•} → ∏_i Spd Ĕ_{μ_i}` is proper and representable
in spatial diamonds (Scholze–Weinstein 23.5.2). -/
theorem TwistedPeriodData.proper (μ : I → G.Cochar) :
    VStack.proper p ((VSheaf.toStack p).map (TwistedPeriodData.legs G b μ)) ∧
      VStack.reprSpatial p ((VSheaf.toStack p).map (TwistedPeriodData.legs G b μ)) := sorry

/-- For two legs, the closed locus `S♯_2 = φ⁻ᵐ(S♯_1)` of the base. -/
def TwistedPeriodData.twistedDiagonal {F : LocalField p} (G : RedGrp F) (μ : Fin 2 → G.Cochar)
    (m : ℕ) : VSheaf p := sorry

/-- The inclusion of the `m`-th Frobenius-twisted diagonal. -/
def TwistedPeriodData.twistedDiagonalIncl {F : LocalField p} (G : RedGrp F)
    (μ : Fin 2 → G.Cochar) (m : ℕ) : TwistedPeriodData.twistedDiagonal G μ m ⟶ G.legBase μ :=
  sorry

/-- TwistedPeriodData.chain. For two legs with `S♯_2 = φ⁻ᵐ(S♯_1)`, `m > 0`, the points are the
bounded chains `E ⇢ E' ⇢ E_b` on `X_S` at the common image of the legs, with `E'` relative to
`E_b` bounded by `μ_1` and `E` relative to `E'` bounded by `μ_2`; the intermediate bundle `E'`
is part of the datum. Stated for `G` split, for which the bounded chain stack is declared. -/
theorem TwistedPeriodData.chain (hG : RedGrp.isSplit (LocalField.Qp p) G) (μ : Fin 2 → G.Cochar)
    (m : ℕ) (hm : 0 < m) :
    ∃ e : (VSheaf.toStack p).obj (pullback (TwistedPeriodData.legs G b μ)
          (TwistedPeriodData.twistedDiagonalIncl G μ m)) ≅
        VStack.fibre
          (ModificationChain.Bounded.incl G hG (Fin.rev : Fin 2 → Fin 2) μ ≫
            prod.lift (ModificationChain.bundle G Fin.rev (Fin.last 2))
              (ModificationChain.compose G Fin.rev ≫ HckI.legs G (Fin 2)))
          (prod.lift (terminal.from _ ≫ BunG.point G b)
            ((VSheaf.toStack p).map
              (TwistedPeriodData.twistedDiagonalIncl G μ m ≫ G.legBaseToDiv1 μ))),
      e.hom ≫ VStack.fibre.snd _ _ = (VSheaf.toStack p).map (pullback.snd _ _) := sorry
-- Omitted: the same description for `G` not split; the bounded chain stack is declared for
-- split groups only.

-- TwistedPeriodData.one_leg_test
example (n : ℤ) (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve) :
    IsIso (TwistedPeriodData.legs (RedGrp.Gm (LocalField.Qp p)) b
      (fun _ : Unit => RedGrp.Gm.cochar (LocalField.Qp p) n)) := by sorry
-- Omitted: that the unique point over `S` is the line bundle
-- `𝒪(-n · Σ_{j≥0} φ⁻ʲ(S♯_1))` with `ι` the inclusion and `φ` multiplication by `b`. The first
-- clause of the test, for every `G`, is the declaration `TwistedPeriodData.one_leg`.

-- TwistedPeriodData.no_leg_test
example (μ : Empty → G.Cochar) : Nonempty (IsTerminal (TwistedPeriodData G b μ)) := by sorry

-- TwistedPeriodData.torus_collision_test
example (a c : ℤ) :
    IsIso (TwistedPeriodData.legs (RedGrp.Gm (LocalField.Qp p)) 1
      ![RedGrp.Gm.cochar (LocalField.Qp p) a, RedGrp.Gm.cochar (LocalField.Qp p) c]) := by sorry
-- Omitted: the description of the unique point as
-- `𝒪(-a · Σ φ⁻ⁿ(S♯_1) - c · Σ φ⁻ⁿ(S♯_2))`, and the orders at a point with `S♯_2 = φ⁻¹(S♯_1)`
-- (order `a + c` along `S♯_2` relative to `ι`, position `c` relative to `Frob_S^*P_η`).

-- TwistedPeriodData.GL2_collision_test
-- For `GL_2`, `μ_1 = μ_2 = (1,0)`, `b = 1`: over the twisted diagonal `S♯_2 = φ⁻¹(S♯_1)` the points
-- of the twisted Grassmannian are chains `E ⇢ E' ⇢ E_1` (`TwistedPeriodData.chain`), and
-- forgetting the intermediate bundle `E'`, that is composing the two modifications, is not
-- injective on geometric points: the fibre of the twisted Grassmannian there does not map
-- isomorphically to the fibre of the Hecke stack at the common image of the legs in `X_S`.
example (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 0 = 1 ∧ v.1 1 = 0) :
    ∃ e : (VSheaf.toStack p).obj (pullback
          (TwistedPeriodData.legs (RedGrp.GLn (LocalField.Qp p) 2) 1
            (fun _ : Fin 2 => RedGrp.GLn.cochar (LocalField.Qp p) 2 v))
          (TwistedPeriodData.twistedDiagonalIncl (RedGrp.GLn (LocalField.Qp p) 2)
            (fun _ : Fin 2 => RedGrp.GLn.cochar (LocalField.Qp p) 2 v) 1)) ≅
        VStack.fibre
          (ModificationChain.Bounded.incl (RedGrp.GLn (LocalField.Qp p) 2)
              (RedGrp.isSplit_GLn (LocalField.Qp p) 2) (Fin.rev : Fin 2 → Fin 2)
              (fun _ : Fin 2 => RedGrp.GLn.cochar (LocalField.Qp p) 2 v) ≫
            prod.lift
              (ModificationChain.bundle (RedGrp.GLn (LocalField.Qp p) 2) Fin.rev (Fin.last 2))
              (ModificationChain.compose (RedGrp.GLn (LocalField.Qp p) 2) Fin.rev ≫
                HckI.legs (RedGrp.GLn (LocalField.Qp p) 2) (Fin 2)))
          (prod.lift (terminal.from _ ≫ BunG.point (RedGrp.GLn (LocalField.Qp p) 2) 1)
            ((VSheaf.toStack p).map
              (TwistedPeriodData.twistedDiagonalIncl (RedGrp.GLn (LocalField.Qp p) 2)
                  (fun _ : Fin 2 => RedGrp.GLn.cochar (LocalField.Qp p) 2 v) 1 ≫
                (RedGrp.GLn (LocalField.Qp p) 2).legBaseToDiv1
                  (fun _ : Fin 2 => RedGrp.GLn.cochar (LocalField.Qp p) 2 v)))),
      e.hom ≫ VStack.fibre.snd _ _ = (VSheaf.toStack p).map (pullback.snd _ _) ∧
      ∃ s : Perfd.GeomPoint p, ¬ Function.Injective (VStack.geomPtsMap
        (e.hom ≫ VStack.fibre.fst _ _ ≫
          ModificationChain.Bounded.incl (RedGrp.GLn (LocalField.Qp p) 2)
            (RedGrp.isSplit_GLn (LocalField.Qp p) 2) (Fin.rev : Fin 2 → Fin 2)
            (fun _ : Fin 2 => RedGrp.GLn.cochar (LocalField.Qp p) 2 v) ≫
          ModificationChain.compose (RedGrp.GLn (LocalField.Qp p) 2) Fin.rev) s) := by sorry
-- Omitted: the fibres as sets of `B⁺_dR`-lattices (over a point of the diagonal the Schubert
-- variety of `(2,0)`; over a point with `S♯_2 = φ⁻¹(S♯_1)` the flags `Λ_0 ⊂ Λ_1`, a `ℙ¹`-bundle
-- over `ℙ¹`, with fibre `ℙ¹` of `(Λ_0 ⊂ Λ_1) ↦ Λ_0` over `ξ·(B⁺_dR)²`, as in
-- `ModificationChain.GL2_test`), and the second half of the conclusion: over the diagonal the
-- fibre of the convolution Grassmannian does not map isomorphically to the fibre of the twisted
-- Grassmannian. The chart of the twisted Grassmannian around the twisted diagonal is
-- `TwistedPeriodData.collision`.

end HS0Twisted

/-! ## HS1. The Satake kernel, Hecke operators and their Weil equivariance

Conventions of the stage. `Λ : Coeff F ℓ` is a `ℤ_ℓ[√q]`-algebra with `ℓ ≠ p`. The kernel of
`V ∈ Rep_Λ((Ĝ ⋊ Q)^I)` is `S'_V = q_I^*(S'_V)^{loc}` and the Hecke operator is
`T_V(A) = p_{2♮}(p_1^*A ⊗^■ S'_V)`; both are defined below from the interfaces, with no
placeholder. The categories are the homotopy categories of the owner's stable ∞-categories, so
"exact" reads "carries cofibre sequences to distinguished triangles" and "commutes with colimits"
reads "commutes with coproducts". -/

section HS1

variable {F : LocalField p} (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I]

/-! ### HS1/satake-kernel-and-solid-monoidal-functor -/

/-- HS1/satake-kernel-and-solid-monoidal-functor. The global solid Satake kernel
`V ↦ S'_V = q_I^*(S'_V)^{loc} ∈ D_■(Hck^I_G, Λ)`: the pullback along `loc = q_I` of the local
kernel, which for `Λ = ℤ_ℓ[√q]` is `D(S_V)^∨` and for general `Λ` the unique exact
`Rep_Λ(Q^I)`-linear monoidal extension. -/
def globalKernel : SatRep G Λ I ⥤ DSolid (HckI G I) Λ :=
  satakeKernelLoc G Λ I ⋙ DSolid.pullback (HckI.toLocal G I) Λ

instance : (globalKernel G Λ I).Additive := by
  unfold globalKernel
  infer_instance

/-- globalKernel.map. `V ↦ S'_V` is a covariant additive functor (it is a functor by
construction), and it is exact: a short exact sequence `0 → V' → V → V'' → 0` of representations
gives a cofibre sequence `S'_{V'} → S'_V → S'_{V''}`. -/
theorem globalKernel.map (S : ShortComplex (SatRep G Λ I))
    (hS : (S.map (SatRep.forget G Λ I)).ShortExact) :
    ∃ δ : (globalKernel G Λ I).obj S.X₃ ⟶ ((globalKernel G Λ I).obj S.X₁)⟦(1 : ℤ)⟧,
      Pretriangulated.Triangle.mk ((globalKernel G Λ I).map S.f) ((globalKernel G Λ I).map S.g) δ ∈
        distTriang (DSolid (HckI G I) Λ) := sorry

/-- globalKernel.map, linearity: `V ↦ S'_V` is `Λ`-linear. -/
theorem globalKernel.map_linear : Functor.Linear Λ.carrier (globalKernel G Λ I) := sorry

/-- globalKernel.unit. `S'_1 ≅ δ_♮Λ` for the identity-modification section
`δ = e : Bun_G × (Div¹)^I → Hck^I_G`; equivalently `RHom_{D_■}(S'_1, Λ) ≅ δ_*Λ`. -/
theorem globalKernel.unit :
    Nonempty ((globalKernel G Λ I).obj (𝟙_ _) ≅ (DSolid.sharp (HckI.unit G I) Λ).obj (𝟙_ _)) ∧
    Nonempty (DSolid.dual ((globalKernel G Λ I).obj (𝟙_ _)) ≅
      (DSolid.pushforward (HckI.unit G I) Λ).obj (𝟙_ _)) := sorry

/-- The stack `Hck^I_G ×_{Bun_G × (Div¹)^I} Hck^I_G` of pairs of composable modifications with
the same legs, formed with `p_2` on the left and `(p_1, legs)` on the right. -/
abbrev HckI.conv : VStack p := VStack.fibre (HckI.p2 G I) (HckI.h1 G I)

/-- The composition of two modifications with the same legs,
`((E_0 ⇢ E_1), (E_1 ⇢ E_2)) ↦ (E_0 ⇢ E_2)`. Under `ι` of the fold map `I ⊔ I → I` it is the
restriction of the map `c` of the chain stack (HS0/chains-and-composition). -/
def HckI.convComp : HckI.conv G I ⟶ HckI G I := sorry
-- Omitted: the identification of `HckI.conv` with the part of the chain stack of `I ⊔ I` with
-- two parts over the fold map `(Div¹)^I → (Div¹)^{I ⊔ I}`, under which `HckI.convComp` is the
-- composition map `c`; below only its source and target bundles are stated.

/-- The composite has the source of the first modification. -/
theorem HckI.convComp_h1 :
    HckI.convComp G I ≫ HckI.h1 G I = VStack.fibre.fst _ _ ≫ HckI.h1 G I := sorry

/-- The composite has the target of the second modification. -/
theorem HckI.convComp_p2 :
    HckI.convComp G I ≫ HckI.p2 G I = VStack.fibre.snd _ _ ≫ HckI.p2 G I := sorry

variable {G Λ I} in
/-- The convolution `K ⋆ K' = c_♮(pr_1^*K ⊗^■ pr_2^*K')` of kernels on `Hck^I_G` over
`(Div¹)^I`. -/
def kernelConvolution (K K' : DSolid (HckI G I) Λ) : DSolid (HckI G I) Λ :=
  (DSolid.sharp (HckI.convComp G I) Λ).obj
    ((DSolid.pullback (VStack.fibre.fst (HckI.p2 G I) (HckI.h1 G I)) Λ).obj K ⊗
      (DSolid.pullback (VStack.fibre.snd (HckI.p2 G I) (HckI.h1 G I)) Λ).obj K')

/-- `D_■(Hck^I_G, Λ)` as the category of kernels: the same category, carrying the convolution
instead of the solid tensor product. -/
def HckI.Kernels : Type 1 := DSolid (HckI G I) Λ

instance : LargeCategory (HckI.Kernels G Λ I) :=
  inferInstanceAs (LargeCategory (DSolid (HckI G I) Λ))

/-- The convolution monoidal structure on `D_■(Hck^I_G, Λ)` over `(Div¹)^I`, with its
associativity and unit constraints (Fargues–Scholze VII.5 and IX.2). -/
instance : MonoidalCategory (HckI.Kernels G Λ I) := sorry

/-- An object of `D_■(Hck^I_G, Λ)` as a kernel. -/
def HckI.Kernels.of : DSolid (HckI G I) Λ ⥤ HckI.Kernels G Λ I := 𝟭 _

/-- The tensor product of kernels is the convolution, and its unit is `δ_♮Λ`. -/
theorem HckI.Kernels.tensor_iso (K K' : DSolid (HckI G I) Λ) :
    Nonempty ((HckI.Kernels.of G Λ I).obj K ⊗ (HckI.Kernels.of G Λ I).obj K' ≅
      (HckI.Kernels.of G Λ I).obj (kernelConvolution K K')) ∧
    Nonempty (𝟙_ (HckI.Kernels G Λ I) ≅
      (HckI.Kernels.of G Λ I).obj ((DSolid.sharp (HckI.unit G I) Λ).obj (𝟙_ _))) := sorry

/-- globalKernel.tensor. The monoidal structure of `V ↦ S'_V` for the convolution:
`S'_{V ⊗ W} ≅ S'_V ⋆ S'_W`, natural in `V` and `W`, with the associativity and unit
coherences. -/
instance globalKernel.tensor : (globalKernel G Λ I ⋙ HckI.Kernels.of G Λ I).Monoidal := sorry

/-- globalKernel.weilLinear. For `U ∈ Rep_Λ(Q^I)`: `S'_{U ⊗ V} ≅ p^*L_U ⊗^■ S'_V`, for the leg
map `p` and the local system `L_U` on `(Div¹)^I`. -/
theorem globalKernel.weilLinear (U : WeilQuotRep G Λ I) (V : SatRep G Λ I) :
    Nonempty ((globalKernel G Λ I).obj ((SatRep.inflate G Λ I).obj U ⊗ V) ≅
      (DSolid.pullback (HckI.legs G I) Λ).obj ((WeilQuotRep.localSystem G Λ I).obj U) ⊗
        (globalKernel G Λ I).obj V) := sorry
-- Omitted: compatibility of these isomorphisms with the monoidal constraints.

variable {I} in
/-- globalKernel.restrictLegs. For `ζ : I → J`: `S'_{ζ^*V} ≅ ι_{ζ♮} pr_ζ^* S'_V`. -/
theorem globalKernel.restrictLegs {J : Type} [Finite J] (ζ : I → J) (V : SatRep G Λ I) :
    Nonempty ((globalKernel G Λ J).obj ((SatRep.res G Λ ζ).obj V) ≅
      (DSolid.sharp (HckI.repeat G ζ) Λ).obj
        ((DSolid.pullback (HckI.repeatFst G ζ) Λ).obj ((globalKernel G Λ I).obj V))) := sorry
-- Omitted: compatibility with composition of maps of finite sets and with the monoidal
-- constraints; and that `ι_ζ` restricts to a closed immersion on every bounded part.

/-- globalKernel.dual. `S'_V` is dualizable for the convolution with dual `S'_{V^∨}`: an exact
pairing of `V` and `W` gives one of `S'_V` and `S'_W`. As `Rep_Λ((Ĝ ⋊ Q)^I)` is symmetric this
gives left and right duals. -/
theorem globalKernel.dual (V W : SatRep G Λ I) [ExactPairing V W] :
    Nonempty (ExactPairing ((globalKernel G Λ I ⋙ HckI.Kernels.of G Λ I).obj V)
      ((globalKernel G Λ I ⋙ HckI.Kernels.of G Λ I).obj W)) := sorry
-- Omitted: that the evaluation and the coevaluation of this pairing are the images of those of
-- `V` under the monoidal functor `V ↦ S'_V`; for one leg this is in
-- `globalKernel.covariance_test`.

/-- The fibre `Hck^I_G ×_{(Div¹)^I} Spd C` of the Hecke stack at the diagonal geometric point. -/
abbrev HckI.geomFibre : VStack p :=
  VStack.fibre (HckI.legs G I) ((VSheaf.toStack p).map (Div1.geomPointPow F I))

/-- globalKernel.geometricFibre. The kernel on `Hck^I_G ×_{(Div¹)^I} Spd C` attached to a
representation of `Ĝ^I`: the composite of `V ↦ S'_V` with restriction to the geometric fibre
factors through restriction to `Rep_Λ(Ĝ^I)` (see `globalKernel.geometricFibre_factors`). -/
def globalKernel.geometricFibre : GeomSatRep G Λ I ⥤ DSolid (HckI.geomFibre G I) Λ := sorry

/-- The factorisation through `Rep_Λ(Ĝ^I)` at the diagonal geometric point. -/
theorem globalKernel.geometricFibre_factors :
    Nonempty (globalKernel G Λ I ⋙ DSolid.pullback (VStack.fibre.fst _ _) Λ ≅
      SatRep.toGeom G Λ I ⋙ globalKernel.geometricFibre G Λ I) := sorry

/-- globalKernel.switch. After pullback to `Spd C` and for `V ∈ Rep_Λ(Ĝ^I)`:
`sw^*S'_V ≅ S'_{sw^*V}`, with `sw^*` on representations the Chevalley involution composed with
conjugation by `ρ̂(-1)`. -/
theorem globalKernel.switch (V : GeomSatRep G Λ I) :
    ∃ σ : HckI.geomFibre G I ≅ HckI.geomFibre G I,
      σ.hom ≫ VStack.fibre.fst _ _ = VStack.fibre.fst _ _ ≫ (HckI.swap G I).hom ∧
      σ.hom ≫ VStack.fibre.snd _ _ = VStack.fibre.snd _ _ ∧
      Nonempty ((DSolid.pullback σ.hom Λ).obj ((globalKernel.geometricFibre G Λ I).obj V) ≅
        (globalKernel.geometricFibre G Λ I).obj ((GeomSatRep.sw G Λ I).functor.obj V)) := sorry

/-- globalKernel.support. `S'_V` is supported on a closed bounded substack
`i : Hck^I_{G,W} → Hck^I_G`: `S'_V ≅ i_♮ i^* S'_V`. For one leg and `V` of highest weight `μ` the
bound is `≤ μ`. -/
theorem globalKernel.support :
    (∀ V : SatRep G Λ I, ∃ W : HckI.Bound G I,
      Nonempty ((globalKernel G Λ I).obj V ≅ (DSolid.sharp (HckI.Bounded.incl G I W) Λ).obj
        ((DSolid.pullback (HckI.Bounded.incl G I W) Λ).obj ((globalKernel G Λ I).obj V)))) ∧
    ∀ (μ : G.Cochar) (hμ : ∀ w : F.WeilGroup, w • μ = μ),
      Nonempty ((globalKernel G Λ Unit).obj (SatRep.highestWeight G Λ μ hμ) ≅
        (DSolid.sharp (HckI.Bounded.incl G Unit (HckI.Bound.Iic (fun _ => μ) fun w _ => hμ w))
            Λ).obj
          ((DSolid.pullback (HckI.Bounded.incl G Unit
              (HckI.Bound.Iic (fun _ => μ) fun w _ => hμ w)) Λ).obj
            ((globalKernel G Λ Unit).obj (SatRep.highestWeight G Λ μ hμ)))) := sorry
-- Omitted: the bound in terms of the weights of an arbitrary `V`; weights of representations
-- are not in the interfaces. The properties of `p_2` on the bounded substack are
-- `descentAndBoundedFibres_bounded`.

/-- The Satake sheaf `S_V ∈ D_ét(Hck^I_G, Λ)` pulled back from the local Hecke stack, for `Λ`
killed by a power of `ℓ`. -/
def satakeSheaf : SatRep G Λ I ⥤ Det (HckI G I) Λ :=
  satakeSheafLoc G Λ I ⋙ Det.pullback (HckI.toLocal G I) Λ

/-- globalKernel.torsion. For `Λ = ℤ/ℓⁿ[√q]`, on a bounded substack
`i : Hck^I_{G,W} → Hck^I_G` supporting `S'_V` (first clause):
`i^*S'_V = RHom_{D_■}(D(i^*S_V), Λ)` and
`D(i^*S_V) ≅ RHom_{D_■}(i^*S'_V, Λ)`, with `D` the Verdier dual relative to `p_2`. The packet
takes `D(S_V)` to be the pullback along `q_I` of the Verdier dual of the Satake sheaf on the local
Hecke stack relative to `𝓗ck^I_G → [(Div¹)^I/L⁺G]`; as the Satake sheaf is universally locally
acyclic, this is the Verdier dual relative to `p_2` of its pullback (base change in the cartesian
square of `descentAndBoundedFibres`), which is the form stated here, on a bounded substack. -/
theorem globalKernel.torsion (hΛ : Λ.IsBaseTorsion) (V : SatRep G Λ I) :
    ∃ W : HckI.Bound G I,
      Nonempty ((globalKernel G Λ I).obj V ≅ (DSolid.sharp (HckI.Bounded.incl G I W) Λ).obj
        ((DSolid.pullback (HckI.Bounded.incl G I W) Λ).obj ((globalKernel G Λ I).obj V))) ∧
      Nonempty ((DSolid.pullback (HckI.Bounded.incl G I W) Λ).obj ((globalKernel G Λ I).obj V) ≅
        DSolid.dual ((Det.toSolid _ Λ).obj
          ((Det.verdierDual (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
            (op ((Det.pullback (HckI.Bounded.incl G I W) Λ).obj ((satakeSheaf G Λ I).obj V)))))) ∧
      Nonempty ((Det.toSolid _ Λ).obj
          ((Det.verdierDual (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
            (op ((Det.pullback (HckI.Bounded.incl G I W) Λ).obj ((satakeSheaf G Λ I).obj V)))) ≅
        DSolid.dual ((DSolid.pullback (HckI.Bounded.incl G I W) Λ).obj
          ((globalKernel G Λ I).obj V))) := sorry

/-- globalKernel.minuscule. `G` split, one leg, `μ` minuscule, `d = ⟨2ρ, μ⟩`,
`i_μ : Hck_{G,μ} = Hck_{G,≤μ} → Hck_G` the closed stratum and `V` the representation of highest
weight `μ`, for which `S_V = i_{μ*}Λ[d](d/2)`: then `S'_V ≅ i_{μ♮}Λ[-d](-d/2)`. -/
theorem globalKernel.minuscule (hG : RedGrp.isSplit F G) (μ : G.Cochar) (hμ : μ.IsMinuscule) :
    Nonempty ((globalKernel G Λ Unit).obj
        (SatRep.highestWeight G Λ μ fun w => RedGrp.smul_cochar_of_isSplit hG w μ) ≅
      ((DSolid.halfTwist _ Λ (-(RedGrp.Cochar.twoRho μ : ℤ))).functor.obj
        ((DSolid.sharp (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => μ)) Λ).obj
          (𝟙_ _)))⟦(-(RedGrp.Cochar.twoRho μ : ℤ))⟧) := sorry

/-- globalKernel.torus. For `G = T` a split torus, one leg and `χ ∈ X_*(T)`: `S'_χ` is the
constant sheaf `Λ` in degree `0`, extended by zero, on the open and closed substack `Hck_{T,χ}`
of modifications of position `χ` (HS0/bounded-hecke-substacks), which `p_2` maps isomorphically
onto `Bun_T × Div¹`. -/
theorem globalKernel.torus (hG : RedGrp.isSplit F G) (hT : RedGrp.isTorus F G) (χ : G.Cochar) :
    Nonempty ((globalKernel G Λ Unit).obj
        (SatRep.highestWeight G Λ χ fun w => RedGrp.smul_cochar_of_isSplit hG w χ) ≅
      (DSolid.sharp (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => χ)) Λ).obj (𝟙_ _)) ∧
    VStack.openImmersion p (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => χ)) ∧
    IsIso (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => χ) ≫ HckI.p2 G Unit) := sorry

-- globalKernel.unit_test
example : Nonempty ((globalKernel G Λ I).obj (𝟙_ _) ≅
      (DSolid.sharp (HckI.unit G I) Λ).obj (𝟙_ _)) ∧
    Nonempty (DSolid.dual ((globalKernel G Λ I).obj (𝟙_ _)) ≅
      (DSolid.pushforward (HckI.unit G I) Λ).obj (𝟙_ _)) ∧
    Nonempty ((globalKernel G Λ Empty).obj (𝟙_ _) ≅ 𝟙_ (DSolid (HckI G Empty) Λ)) := by sorry

-- globalKernel.minuscule_test
example (F : LocalField p) (Λ : Coeff F ℓ) :
    Nonempty ((globalKernel (RedGrp.PGLn F 2) Λ Unit).obj (SatRep.std F Λ 2) ≅
      ((DSolid.halfTwist _ Λ (-1)).functor.obj
        ((DSolid.sharp (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
          (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ => RedGrp.PGLn.fundamental F 2))
            Λ).obj (𝟙_ _)))⟦(-1 : ℤ)⟧) ∧
    (Λ.IsTorsion →
      Nonempty ((Det.toSolid _ Λ).obj ((satakeSheaf (RedGrp.PGLn F 2) Λ Unit).obj
          (SatRep.std F Λ 2)) ≅
        ((DSolid.halfTwist _ Λ 1).functor.obj
          ((DSolid.pushforward (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
            (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ => RedGrp.PGLn.fundamental F 2))
              Λ).obj (𝟙_ _)))⟦(1 : ℤ)⟧)) := by sorry
-- Omitted: `D(S_V) ≅ S_V`, and that the minuscule stratum is a fibration in twisted forms of
-- `ℙ¹` over `Bun_G × Div¹`.

-- globalKernel.torus_test
-- `S'_{V_n}` is `Λ` in degree `0` on the substack of modifications of position `n`, on which
-- `deg L_2 - deg L_1 = n` (the degree is `-κ`), and `S'_{V_n} ⋆ S'_{V_m} ≅ S'_{V_{n+m}}`.
example (F : LocalField p) (Λ : Coeff F ℓ) :
    (∀ n : ℤ, Nonempty ((globalKernel (RedGrp.Gm F) Λ Unit).obj (SatRep.char F Λ n) ≅
        (DSolid.sharp (HckI.Bounded.incl (RedGrp.Gm F) Unit
          (HckI.Bound.ofSplit (RedGrp.isSplit_Gm F) fun _ => RedGrp.Gm.cochar F n)) Λ).obj
            (𝟙_ _))) ∧
      (∀ (n : ℤ) (s : Perfd.GeomPoint p) (x : (HckI.Bounded (RedGrp.Gm F) Unit
          (HckI.Bound.ofSplit (RedGrp.isSplit_Gm F) fun _ => RedGrp.Gm.cochar F n)).geomPts s),
        RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
            (VStack.geomPtsMap (HckI.Bounded.incl _ _ _ ≫ HckI.p1 (RedGrp.Gm F) Unit) s x))) =
          RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
            (VStack.geomPtsMap (HckI.Bounded.incl _ _ _ ≫ HckI.p2 (RedGrp.Gm F) Unit ≫ prod.fst)
              s x))) + n) ∧
      ∀ n m : ℤ, Nonempty (
        (globalKernel (RedGrp.Gm F) Λ Unit ⋙ HckI.Kernels.of _ Λ Unit).obj (SatRep.char F Λ n) ⊗
          (globalKernel (RedGrp.Gm F) Λ Unit ⋙ HckI.Kernels.of _ Λ Unit).obj (SatRep.char F Λ m) ≅
        (globalKernel (RedGrp.Gm F) Λ Unit ⋙ HckI.Kernels.of _ Λ Unit).obj
          (SatRep.char F Λ (n + m))) := by sorry

-- globalKernel.weil_character_test
example (U : WeilQuotRep G Λ I) :
    Nonempty ((globalKernel G Λ I).obj ((SatRep.inflate G Λ I).obj U) ≅
      (DSolid.sharp (HckI.unit G I) Λ).obj
        ((DSolid.pullback prod.snd Λ).obj ((WeilQuotRep.localSystem G Λ I).obj U))) := by sorry
-- Omitted: that the pullback to `Spd C` is `δ_♮` of a constant sheaf, while `L_U` is constant on
-- `(Div¹)^I` only if `Q^I` acts trivially on `U`; constant sheaves on a module and triviality of
-- an action of `Q^I` are not in the interfaces.

-- globalKernel.covariance_test
example (V : SatRep G Λ Unit) :
    ∃ P : ExactPairing ((globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit).obj V)
        ((globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit).obj Vᘁ),
      P.coevaluation' =
        Functor.LaxMonoidal.ε (globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit) ≫
          (globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit).map (η_ V Vᘁ) ≫
          Functor.OplaxMonoidal.δ (globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit) V Vᘁ ∧
      P.evaluation' =
        Functor.LaxMonoidal.μ (globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit) Vᘁ V ≫
          (globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit).map (ε_ V Vᘁ) ≫
          Functor.OplaxMonoidal.η (globalKernel G Λ Unit ⋙ HckI.Kernels.of G Λ Unit) := by sorry

/-! ### HS1/hecke-operator-via-relative-homology -/

/-- `V ↦ T_V` as a functor from `Rep_Λ((Ĝ ⋊ Q)^I)` to functors
`D_■(Bun_G, Λ) → D_■(Bun_G × (Div¹)^I, Λ)`: `T_V(A) = p_{2♮}(p_1^*A ⊗^■ S'_V)`. -/
def heckeFunctor : SatRep G Λ I ⥤ DSolid (BunG G) Λ ⥤ DSolid (BunGLegs G I) Λ :=
  globalKernel G Λ I ⋙ (curriedTensor (DSolid (HckI G I) Λ)).flip ⋙
    (Functor.whiskeringLeft _ _ _).obj (DSolid.pullback (HckI.p1 G I) Λ) ⋙
    (Functor.whiskeringRight _ _ _).obj (DSolid.sharp (HckI.p2 G I) Λ)

/-- HS1/hecke-operator-via-relative-homology. The Hecke operator
`T_V : D_■(Bun_G, Λ) → D_■(Bun_G × (Div¹)^I, Λ)`, `T_V(A) = p_{2♮}(p_1^*A ⊗^■_Λ S'_V)`, with
`p_{2♮}` the left adjoint of `p_2^*`. Its restriction to `D_lis(Bun_G, Λ)` is
`Dlis.toSolid _ Λ ⋙ heckeOperator G Λ I V`. -/
abbrev heckeOperator (V : SatRep G Λ I) : DSolid (BunG G) Λ ⥤ DSolid (BunGLegs G I) Λ :=
  (heckeFunctor G Λ I).obj V

/-- The action of a kernel `K` on `D_■(Bun_G × (Div¹)^I, Λ)`:
`Φ_K(B) = h_{2♮}(h_1^*B ⊗^■ K)`, with `h_1 = (p_1, legs)` and `h_2 = p_2`. -/
def kernelAction :
    DSolid (HckI G I) Λ ⥤ DSolid (BunGLegs G I) Λ ⥤ DSolid (BunGLegs G I) Λ :=
  (curriedTensor (DSolid (HckI G I) Λ)).flip ⋙
    (Functor.whiskeringLeft _ _ _).obj (DSolid.pullback (HckI.h1 G I) Λ) ⋙
    (Functor.whiskeringRight _ _ _).obj (DSolid.sharp (HckI.p2 G I) Λ)

/-- heckeOperator.endo. The endofunctor `T̃_V` of `D_■(Bun_G × (Div¹)^I, Λ)`,
`T̃_V(B) = p_{2♮}(h_1^*B ⊗^■_Λ S'_V)` with `h_1 = (p_1, legs)`. -/
def heckeOperator.endo (V : SatRep G Λ I) :
    DSolid (BunGLegs G I) Λ ⥤ DSolid (BunGLegs G I) Λ :=
  (kernelAction G Λ I).obj ((globalKernel G Λ I).obj V)

/-- `T_V(A) = T̃_V(pr^*A)` for the projection `pr : Bun_G × (Div¹)^I → Bun_G`. -/
theorem heckeOperator.endo_pullback (V : SatRep G Λ I) :
    Nonempty (heckeOperator G Λ I V ≅
      DSolid.pullback (prod.fst : BunGLegs G I ⟶ BunG G) Λ ⋙ heckeOperator.endo G Λ I V) := sorry

/-- heckeOperator.linear. `T_V` and `T̃_V` commute with direct sums, and `T̃_V` is
`D_■((Div¹)^I, Λ)`-linear: `T̃_V(B ⊗^■ pr_2^*M) ≅ T̃_V(B) ⊗^■ pr_2^*M`. -/
theorem heckeOperator.linear (V : SatRep G Λ I) :
    (∀ (B : DSolid (BunGLegs G I) Λ) (M : DSolid (Div1.stack F I) Λ),
      Nonempty ((heckeOperator.endo G Λ I V).obj (B ⊗ (DSolid.pullback prod.snd Λ).obj M) ≅
        (heckeOperator.endo G Λ I V).obj B ⊗ (DSolid.pullback prod.snd Λ).obj M)) ∧
    (∀ J : Type, PreservesColimitsOfShape (Discrete J) (heckeOperator G Λ I V)) ∧
    ∀ J : Type, PreservesColimitsOfShape (Discrete J) (heckeOperator.endo G Λ I V) := sorry
-- Omitted: that `T_V` and `T̃_V` are exact (triangulated) and `Λ`-linear as functors; the
-- commutation of the pullback and relative homology functors with shifts is not in the
-- interfaces. Exactness in `V` is `heckeOperator.map_distTriang`.

variable {G Λ I} in
/-- heckeOperator.map. `V ↦ T_V` is a functor: a map `f : V → W` of representations induces
`T_f : T_V → T_W`, with `T_id = id` and `T_{g ∘ f} = T_g ∘ T_f` (functoriality of
`heckeFunctor`). -/
def heckeOperator.map {V W : SatRep G Λ I} (f : V ⟶ W) :
    heckeOperator G Λ I V ⟶ heckeOperator G Λ I W :=
  (heckeFunctor G Λ I).map f

variable {G Λ I} in
/-- heckeOperator.map, linearity: `V ↦ T_V` is `Λ`-linear. -/
theorem heckeOperator.map_smul {V W : SatRep G Λ I} (r : Λ.carrier) (f : V ⟶ W)
    (A : DSolid (BunG G) Λ) :
    (heckeOperator.map (r • f)).app A = r • (heckeOperator.map f).app A := sorry

/-- A short exact sequence of representations gives a cofibre sequence of Hecke operators. -/
theorem heckeOperator.map_distTriang (S : ShortComplex (SatRep G Λ I))
    (hS : (S.map (SatRep.forget G Λ I)).ShortExact) (A : DSolid (BunG G) Λ) :
    ∃ δ : (heckeOperator G Λ I S.X₃).obj A ⟶ ((heckeOperator G Λ I S.X₁).obj A)⟦(1 : ℤ)⟧,
      Pretriangulated.Triangle.mk ((heckeOperator.map S.f).app A) ((heckeOperator.map S.g).app A)
        δ ∈ distTriang (DSolid (BunGLegs G I) Λ) := sorry

instance : HasBinaryBiproducts (SatRep G Λ I) := hasBinaryBiproducts_of_finite_biproducts _

/-- `T_{V ⊕ W} = T_V ⊕ T_W`. -/
theorem heckeOperator.map_biprod (V W : SatRep G Λ I) (A : DSolid (BunG G) Λ) :
    Nonempty ((heckeOperator G Λ I (V ⊞ W)).obj A ≅
      (heckeOperator G Λ I V).obj A ⨿ (heckeOperator G Λ I W).obj A) := sorry

/-- heckeOperator.unit. `T_1(A) ≅ pr^*A` for the trivial representation. -/
theorem heckeOperator.unit :
    Nonempty (heckeOperator G Λ I (𝟙_ _) ≅
      DSolid.pullback (prod.fst : BunGLegs G I ⟶ BunG G) Λ) := sorry

/-- heckeOperator.baseChange. For `g : S → (Div¹)^I`,
`(id × g)^*T_V(A) ≅ p_{2,S♮}(p_{1,S}^*A ⊗^■ S'_V|_S)` for the base change
`Hck^I_G ×_{(Div¹)^I} S` of the correspondence. -/
theorem heckeOperator.baseChange {S : VStack p} (g : S ⟶ Div1.stack F I) (V : SatRep G Λ I)
    (A : DSolid (BunG G) Λ) :
    Nonempty ((DSolid.pullback (prod.map (𝟙 (BunG G)) g) Λ).obj ((heckeOperator G Λ I V).obj A) ≅
      (DSolid.sharp (prod.lift (VStack.fibre.fst (HckI.legs G I) g ≫ HckI.p2 G I ≫ prod.fst)
          (VStack.fibre.snd (HckI.legs G I) g)) Λ).obj
        ((DSolid.pullback (VStack.fibre.fst (HckI.legs G I) g ≫ HckI.p1 G I) Λ).obj A ⊗
          (DSolid.pullback (VStack.fibre.fst (HckI.legs G I) g) Λ).obj
            ((globalKernel G Λ I).obj V))) := sorry
-- Omitted: the same statement for `T̃_V`.

/-- heckeOperator.geometricFibre. The Hecke operator `T_W` on `D_■(Bun_G × Spd C, Λ)` of a
representation `W ∈ Rep_Λ(Ĝ^I)`, at the diagonal geometric point `Spd C → (Div¹)^I`:
`B ↦ h_{2♮}(h_1^*B ⊗^■ S'_W)` for the base change of the Hecke correspondence, with `S'_W` the
kernel `globalKernel.geometricFibre` on the fibre of the Hecke stack and `h_1 = (p_1, pr)`,
`h_2 = (p_2, pr)` the two maps of that fibre to `Bun_G × Spd C`. It is the base change of `T̃_V`
for `W = V|_{Ĝ^I}` (see `heckeOperator.geometricFibre_baseChange`). -/
def heckeOperator.geometricFibre :
    GeomSatRep G Λ I ⥤ DSolid (BunGC G) Λ ⥤ DSolid (BunGC G) Λ :=
  globalKernel.geometricFibre G Λ I ⋙ (curriedTensor (DSolid (HckI.geomFibre G I) Λ)).flip ⋙
    (Functor.whiskeringLeft _ _ _).obj (DSolid.pullback
      (prod.lift (VStack.fibre.fst _ _ ≫ HckI.p1 G I) (VStack.fibre.snd _ _) :
        HckI.geomFibre G I ⟶ BunGC G) Λ) ⋙
    (Functor.whiskeringRight _ _ _).obj (DSolid.sharp
      (prod.lift (VStack.fibre.fst _ _ ≫ HckI.p2 G I ≫ prod.fst) (VStack.fibre.snd _ _) :
        HckI.geomFibre G I ⟶ BunGC G) Λ)

/-- The base change of `T̃_V` to `Bun_G × Spd C` depends only on `V|_{Ĝ^I}`. -/
theorem heckeOperator.geometricFibre_baseChange (V : SatRep G Λ I) :
    Nonempty (heckeOperator.endo G Λ I V ⋙ DSolid.pullback (BunGC.toLegs G I) Λ ≅
      DSolid.pullback (BunGC.toLegs G I) Λ ⋙
        (heckeOperator.geometricFibre G Λ I).obj ((SatRep.toGeom G Λ I).obj V)) := sorry

/-- heckeOperator.weilTwist. For `U ∈ Rep_Λ(Q^I)`:
`T_{U ⊗ V}(A) ≅ T_V(A) ⊗^■ pr_2^*L_U`; for `V = 1`, `T_U(A) ≅ pr_1^*A ⊗^■ pr_2^*L_U`. -/
theorem heckeOperator.weilTwist (U : WeilQuotRep G Λ I) (V : SatRep G Λ I)
    (A : DSolid (BunG G) Λ) :
    Nonempty ((heckeOperator G Λ I ((SatRep.inflate G Λ I).obj U ⊗ V)).obj A ≅
      (heckeOperator G Λ I V).obj A ⊗
        (DSolid.pullback prod.snd Λ).obj ((WeilQuotRep.localSystem G Λ I).obj U)) := sorry

/-- heckeOperator.torsion. For `Λ = ℤ/ℓⁿ[√q]` and `A ∈ D_ét(Bun_G, Λ)`:
`T_V(A) ≅ Rp_{2!}(p_1^*A ⊗^L S_V) = Rp_{2*}(p_1^*A ⊗^L S_V)` in `D_ét(Bun_G × (Div¹)^I, Λ)`
(Fargues–Scholze VII.5.2), computed on a bounded substack `i` supporting `S_V`, on which `p_2`
is proper. -/
theorem heckeOperator.torsion (hΛ : Λ.IsBaseTorsion) (V : SatRep G Λ I) :
    ∃ W : HckI.Bound G I, ∀ A : Det (BunG G) Λ,
      Nonempty ((heckeOperator G Λ I V).obj ((Det.toSolid _ Λ).obj A) ≅
        (Det.toSolid _ Λ).obj ((Det.shriek (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
          ((Det.pullback (HckI.Bounded.incl G I W ≫ HckI.p1 G I) Λ).obj A ⊗
            (Det.pullback (HckI.Bounded.incl G I W) Λ).obj ((satakeSheaf G Λ I).obj V)))) ∧
      Nonempty ((Det.shriek (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
          ((Det.pullback (HckI.Bounded.incl G I W ≫ HckI.p1 G I) Λ).obj A ⊗
            (Det.pullback (HckI.Bounded.incl G I W) Λ).obj ((satakeSheaf G Λ I).obj V)) ≅
        (Det.pushforward (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
          ((Det.pullback (HckI.Bounded.incl G I W ≫ HckI.p1 G I) Λ).obj A ⊗
            (Det.pullback (HckI.Bounded.incl G I W) Λ).obj ((satakeSheaf G Λ I).obj V))) := sorry

/-- heckeOperator.bounded. `T_V(A) ≅ p_{2,W♮}(p_{1,W}^*A ⊗^■ i^*S'_V)` for the restrictions of
`p_1`, `p_2` to a closed bounded substack `i : Hck^I_{G,W} → Hck^I_G` supporting `S'_V`. -/
theorem heckeOperator.bounded (V : SatRep G Λ I) :
    ∃ W : HckI.Bound G I, ∀ A : DSolid (BunG G) Λ,
      Nonempty ((heckeOperator G Λ I V).obj A ≅
        (DSolid.sharp (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
          ((DSolid.pullback (HckI.Bounded.incl G I W ≫ HckI.p1 G I) Λ).obj A ⊗
            (DSolid.pullback (HckI.Bounded.incl G I W) Λ).obj ((globalKernel G Λ I).obj V))) :=
  sorry
-- Omitted: that `W` can be taken to be the bound of the weights of `V|_{Ĝ^I}`.

/-- heckeOperator.minuscule. `G` split, one leg, `μ` minuscule, `d = ⟨2ρ, μ⟩`, `V` of highest
weight `μ`, `h = p_2 ∘ i_μ`, `g = p_1 ∘ i_μ`:
`T_V(A) ≅ h_♮g^*A[-d](-d/2) ≅ Rh_*g^*A[d](d/2)`. -/
theorem heckeOperator.minuscule (hG : RedGrp.isSplit F G) (μ : G.Cochar) (hμ : μ.IsMinuscule)
    (A : DSolid (BunG G) Λ) :
    Nonempty ((heckeOperator G Λ Unit
          (SatRep.highestWeight G Λ μ fun w => RedGrp.smul_cochar_of_isSplit hG w μ)).obj A ≅
        ((DSolid.halfTwist _ Λ (-(RedGrp.Cochar.twoRho μ : ℤ))).functor.obj
          ((DSolid.sharp (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => μ) ≫
              HckI.p2 G Unit) Λ).obj
            ((DSolid.pullback (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => μ) ≫
              HckI.p1 G Unit) Λ).obj A)))⟦(-(RedGrp.Cochar.twoRho μ : ℤ))⟧) ∧
    Nonempty ((heckeOperator G Λ Unit
          (SatRep.highestWeight G Λ μ fun w => RedGrp.smul_cochar_of_isSplit hG w μ)).obj A ≅
        ((DSolid.halfTwist _ Λ (RedGrp.Cochar.twoRho μ : ℤ)).functor.obj
          ((DSolid.pushforward (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => μ) ≫
              HckI.p2 G Unit) Λ).obj
            ((DSolid.pullback (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => μ) ≫
              HckI.p1 G Unit) Λ).obj A)))⟦((RedGrp.Cochar.twoRho μ : ℕ) : ℤ)⟧) := sorry

/-- heckeOperator.torus. For `G = T` a split torus, one leg and `χ ∈ X_*(T)`:
`T_χ(A) = c_χ^*A`, where `c_χ : Bun_T × Div¹ → Bun_T` sends `(E_2, D)` to the `T`-bundle `E_1`
whose modification of type `χ` at `D` is `E_2`. -/
theorem heckeOperator.torus (hG : RedGrp.isSplit F G) (hT : RedGrp.isTorus F G) (χ : G.Cochar) :
    ∃ c : BunGLegs G Unit ⟶ BunG G,
      (HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => χ) ≫ HckI.p2 G Unit) ≫ c =
        HckI.Bounded.incl G Unit (HckI.Bound.ofSplit hG fun _ => χ) ≫ HckI.p1 G Unit ∧
      Nonempty (heckeOperator G Λ Unit
          (SatRep.highestWeight G Λ χ fun w => RedGrp.smul_cochar_of_isSplit hG w χ) ≅
        DSolid.pullback c Λ) := sorry

-- heckeOperator.no_legs_test
example (n : ℕ) (A : DSolid (BunG G) Λ) :
    IsIso (HckI.p1 G Empty) ∧ IsIso (HckI.p2 G Empty) ∧
    (heckeOperator G Λ Empty (𝟙_ _)).IsEquivalence ∧
    Nonempty ((heckeOperator G Λ Empty (⨁ fun _ : Fin n => 𝟙_ (SatRep G Λ Empty))).obj A ≅
      ∐ fun _ : Fin n => (heckeOperator G Λ Empty (𝟙_ _)).obj A) := by sorry
-- Omitted: `T_M(A) = A ⊗_Λ M` for a general finite projective `Λ`-module `M`, the direct summand
-- of `A^{⊕n}` cut out by an idempotent of `Λⁿ` with image `M`; the identification of the
-- representations of the trivial group with the finite projective `Λ`-modules is not in the
-- interfaces. The statement above is the case `M = Λⁿ`, with `T_Λ` the pullback along the
-- equivalence `Bun_G × (Div¹)^∅ → Bun_G`.

-- heckeOperator.unit_test
example (A : DSolid (BunG G) Λ) :
    Nonempty ((heckeOperator G Λ I (𝟙_ _)).obj A ≅
      (DSolid.pullback (prod.fst : BunGLegs G I ⟶ BunG G) Λ).obj A) := by sorry

-- heckeOperator.minuscule_test
example (F : LocalField p) (Λ : Coeff F ℓ) (A : DSolid (BunG (RedGrp.PGLn F 2)) Λ) :
    Nonempty ((heckeOperator (RedGrp.PGLn F 2) Λ Unit (SatRep.std F Λ 2)).obj A ≅
        ((DSolid.halfTwist _ Λ (-1)).functor.obj
          ((DSolid.sharp (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
              (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ =>
                RedGrp.PGLn.fundamental F 2) ≫ HckI.p2 _ Unit) Λ).obj
            ((DSolid.pullback (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
              (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ =>
                RedGrp.PGLn.fundamental F 2) ≫ HckI.p1 _ Unit) Λ).obj A)))⟦(-1 : ℤ)⟧) ∧
    Nonempty ((heckeOperator (RedGrp.PGLn F 2) Λ Unit (SatRep.std F Λ 2)).obj A ≅
        ((DSolid.halfTwist _ Λ 1).functor.obj
          ((DSolid.pushforward (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
              (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ =>
                RedGrp.PGLn.fundamental F 2) ≫ HckI.p2 _ Unit) Λ).obj
            ((DSolid.pullback (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
              (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ =>
                RedGrp.PGLn.fundamental F 2) ≫ HckI.p1 _ Unit) Λ).obj A)))⟦(1 : ℤ)⟧) ∧
    VStack.proper p (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
      (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ => RedGrp.PGLn.fundamental F 2) ≫
        HckI.p2 _ Unit) ∧
    VStack.cohSmoothOfDim p ℓ 1 (HckI.Bounded.incl (RedGrp.PGLn F 2) Unit
      (HckI.Bound.ofSplit (RedGrp.isSplit_PGLn F 2) fun _ => RedGrp.PGLn.fundamental F 2) ≫
        HckI.p2 _ Unit) := by sorry
-- Omitted: that the fibres of `h` are twisted forms of `ℙ¹`, and `Rh^!Λ ≅ Λ[2](1)`.

-- heckeOperator.torus_test
-- `T_{V_n}(A) = c_n^* A` for `c_n(L, D) = L(-nD)`: the kernel is supported on the modifications
-- of position `n`, for which `L_1 = L_2(-nD)`. So `c_n` adds `n` to the Kottwitz invariant, and
-- `T_{V_n}` carries sheaves supported on Kottwitz invariant `a` (degree `d = -a`) to sheaves
-- supported on Kottwitz invariant `a - n` (degree `d + n`).
example (F : LocalField p) (Λ : Coeff F ℓ) :
    (∀ n : ℤ, ∃ c : BunGLegs (RedGrp.Gm F) Unit ⟶ BunG (RedGrp.Gm F),
        (HckI.Bounded.incl (RedGrp.Gm F) Unit (HckI.Bound.ofSplit (RedGrp.isSplit_Gm F)
            fun _ => RedGrp.Gm.cochar F n) ≫ HckI.p2 _ Unit) ≫ c =
          HckI.Bounded.incl (RedGrp.Gm F) Unit (HckI.Bound.ofSplit (RedGrp.isSplit_Gm F)
            fun _ => RedGrp.Gm.cochar F n) ≫ HckI.p1 _ Unit ∧
        (∀ (s : Perfd.GeomPoint p) (y : (BunGLegs (RedGrp.Gm F) Unit).geomPts s),
          RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
              (VStack.geomPtsMap c s y))) =
            RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (BunG.geomPtsEquiv _ s
              (VStack.geomPtsMap (prod.fst : BunGLegs (RedGrp.Gm F) Unit ⟶ _) s y))) + n) ∧
        Nonempty (heckeOperator (RedGrp.Gm F) Λ Unit (SatRep.char F Λ n) ≅ DSolid.pullback c Λ)) ∧
      (∀ n : ℤ, (heckeOperator.endo (RedGrp.Gm F) Λ Unit (SatRep.char F Λ n)).IsEquivalence) ∧
      ∀ n m : ℤ, Nonempty (heckeOperator.endo (RedGrp.Gm F) Λ Unit (SatRep.char F Λ m) ⋙
          heckeOperator.endo (RedGrp.Gm F) Λ Unit (SatRep.char F Λ n) ≅
        heckeOperator.endo (RedGrp.Gm F) Λ Unit (SatRep.char F Λ (n + m))) := by sorry
-- Omitted: the formula `c_n(L, D) = L(-nD)` on line bundles, which are not in the interfaces;
-- its effect on the Kottwitz invariant is stated. It is `structureGroupAndInnerForm_kottwitz` on
-- the substack of position `n`.

-- heckeOperator.weil_character_test
example (U : WeilQuotRep G Λ I) (A : DSolid (BunG G) Λ) :
    Nonempty ((heckeOperator G Λ I ((SatRep.inflate G Λ I).obj U)).obj A ≅
      (DSolid.pullback prod.fst Λ).obj A ⊗
        (DSolid.pullback prod.snd Λ).obj ((WeilQuotRep.localSystem G Λ I).obj U)) := by sorry

-- The second clause of the test: for a nontrivial character `U` of `Q` over a field and `A ≠ 0`,
-- `T_U(A)` and `T_1(A)` are not isomorphic, although their pullbacks to `Bun_G × Spd C` are.
example (hΛ : IsField Λ.carrier) (U : WeilQuotRep G Λ Unit)
    (hU : Module.finrank Λ.carrier ((WeilQuotRep.forget G Λ Unit).obj U) = 1)
    (hU' : ¬ Nonempty (U ≅ 𝟙_ _)) (A : DSolid (BunG G) Λ) (hA : ¬ IsZero A) :
    ¬ Nonempty ((heckeOperator G Λ Unit ((SatRep.inflate G Λ Unit).obj U)).obj A ≅
        (heckeOperator G Λ Unit (𝟙_ _)).obj A) ∧
    Nonempty ((DSolid.pullback (BunGC.toLegs G Unit) Λ).obj
        ((heckeOperator G Λ Unit ((SatRep.inflate G Λ Unit).obj U)).obj A) ≅
      (DSolid.pullback (BunGC.toLegs G Unit) Λ).obj
        ((heckeOperator G Λ Unit (𝟙_ _)).obj A)) := by sorry

-- heckeOperator.torsion_test
example (hΛ : Λ.IsBaseTorsion) (V : SatRep G Λ I) :
    ∃ W : HckI.Bound G I, ∀ A : Det (BunG G) Λ,
      Nonempty ((heckeOperator G Λ I V).obj ((Det.toSolid _ Λ).obj A) ≅
        (Det.toSolid _ Λ).obj ((Det.pushforward (HckI.Bounded.incl G I W ≫ HckI.p2 G I) Λ).obj
          ((Det.pullback (HckI.Bounded.incl G I W ≫ HckI.p1 G I) Λ).obj A ⊗
            (Det.pullback (HckI.Bounded.incl G I W) Λ).obj ((satakeSheaf G Λ I).obj V)))) :=
  by sorry

/-! ### HS1/monoidality-of-hecke-operators -/

attribute [local instance] CategoryTheory.endofunctorMonoidalCategory

/-- The action of kernels on `D_■(Bun_G × (Div¹)^I, Λ)` as a functor on the category of kernels
with its convolution. -/
def HckI.Kernels.action :
    HckI.Kernels G Λ I ⥤ DSolid (BunGLegs G I) Λ ⥤ DSolid (BunGLegs G I) Λ :=
  kernelAction G Λ I

/-- `V ↦ T̃_V`, with values in the monoidal opposite of the endofunctors: in Mathlib the tensor
product of endofunctors is `F ⊗ G = F ⋙ G` ("first `F`"), which is the product `F · F' = F' ∘ F`
of the packet; a monoidal functor to the opposite sends `V ⊗ W` to `T̃_W ⋙ T̃_V`, that is to
`T̃_V ∘ T̃_W`. -/
def heckeEndoAction :
    SatRep G Λ I ⥤ (DSolid (BunGLegs G I) Λ ⥤ DSolid (BunGLegs G I) Λ)ᴹᵒᵖ :=
  (globalKernel G Λ I ⋙ kernelAction G Λ I) ⋙ mopFunctor _

/-- HS1/monoidality-of-hecke-operators, (a). `K ↦ Φ_K` is a monoidal functor from kernels with
their convolution to endofunctors with the product `F · F' = F' ∘ F` (Mathlib's `F ⋙ F'`):
`Φ_{δ_♮Λ} ≅ id` and `Φ_{K ⋆ K'} ≅ Φ_{K'} ∘ Φ_K` (first `Φ_K`, for `K` on the first modification of
a chain `E_0 ⇢ E_1 ⇢ E_2`), with the associativity and unit coherences (the convention of
Fargues–Scholze VII.5). -/
theorem monoidalityOfHeckeOperators_kernels :
    Nonempty (HckI.Kernels.action G Λ I).Monoidal ∧
    Nonempty ((kernelAction G Λ I).obj ((DSolid.sharp (HckI.unit G I) Λ).obj (𝟙_ _)) ≅ 𝟭 _) ∧
    ∀ K K' : DSolid (HckI G I) Λ,
      Nonempty ((kernelAction G Λ I).obj (kernelConvolution K K') ≅
        (kernelAction G Λ I).obj K ⋙ (kernelAction G Λ I).obj K') := sorry
-- Omitted: that each `Φ_K` is `D_■((Div¹)^I, Λ)`-linear as a functor (for `K = S'_V` the
-- isomorphisms are `heckeOperator.linear`) and that `K ↦ Φ_K` is exact.

/-- HS1/monoidality-of-hecke-operators, (b). `V ↦ T̃_V` is a monoidal functor
`Rep_Λ((Ĝ ⋊ Q)^I) → End(D_■(Bun_G × (Div¹)^I, Λ))` for the product `F · F' = F' ∘ F`: `T̃_1 ≅ id`
and `T̃_{V ⊗ W} ≅ T̃_W ∘ T̃_V`; the commutativity isomorphism `V ⊗ W ≅ W ⊗ V` gives
`T̃_W ∘ T̃_V ≅ T̃_V ∘ T̃_W`, so `V ↦ T̃_V` is also monoidal for the opposite product;
`T̃_{U ⊗ V} ≅ pr_2^*L_U ⊗^■ T̃_V` for `U ∈ Rep_Λ(Q^I)`; and
`T_{V ⊗ W}(A) ≅ T̃_W(T_V(A)) ≅ T̃_V(T_W(A))`. -/
theorem monoidalityOfHeckeOperators :
    Nonempty ((globalKernel G Λ I ⋙ HckI.Kernels.of G Λ I) ⋙ HckI.Kernels.action G Λ I).Monoidal ∧
    Nonempty (heckeEndoAction G Λ I).Monoidal ∧
    Nonempty (heckeOperator.endo G Λ I (𝟙_ _) ≅ 𝟭 _) ∧
    (∀ V W : SatRep G Λ I,
      Nonempty (heckeOperator.endo G Λ I (V ⊗ W) ≅
        heckeOperator.endo G Λ I V ⋙ heckeOperator.endo G Λ I W) ∧
      Nonempty (heckeOperator.endo G Λ I (V ⊗ W) ≅
        heckeOperator.endo G Λ I W ⋙ heckeOperator.endo G Λ I V) ∧
      Nonempty (heckeOperator G Λ I (V ⊗ W) ≅
        heckeOperator G Λ I V ⋙ heckeOperator.endo G Λ I W) ∧
      Nonempty (heckeOperator G Λ I (V ⊗ W) ≅
        heckeOperator G Λ I W ⋙ heckeOperator.endo G Λ I V)) ∧
    ∀ (U : WeilQuotRep G Λ I) (V : SatRep G Λ I),
      Nonempty (heckeOperator.endo G Λ I ((SatRep.inflate G Λ I).obj U ⊗ V) ≅
        heckeOperator.endo G Λ I V ⋙ tensorLeft
          ((DSolid.pullback prod.snd Λ).obj ((WeilQuotRep.localSystem G Λ I).obj U))) := sorry

variable {I} in
/-- HS1/monoidality-of-hecke-operators, (c). For `ζ : I → J`:
`(id × Δ_ζ)^* ∘ T̃_V ≅ T̃_{ζ^*V} ∘ (id × Δ_ζ)^*`. -/
theorem monoidalityOfHeckeOperators_legs {J : Type} [Finite J] (ζ : I → J) (V : SatRep G Λ I) :
    Nonempty (heckeOperator.endo G Λ I V ⋙
        DSolid.pullback (prod.map (𝟙 (BunG G)) ((VSheaf.toStack p).map (Div1.diag F ζ))) Λ ≅
      DSolid.pullback (prod.map (𝟙 (BunG G)) ((VSheaf.toStack p).map (Div1.diag F ζ))) Λ ⋙
        heckeOperator.endo G Λ J ((SatRep.res G Λ ζ).obj V)) := sorry
-- Omitted: compatibility with composition of maps of finite sets and with the monoidal
-- structures of (b). The two special cases follow: `T̃_{⊠ V_i}` is the composite of the operators
-- along the single legs, and for `I → {∗}` its restriction to the diagonal is `T̃_{⊗ V_i}`.

/-- HS1/monoidality-of-hecke-operators, last assertion. At the diagonal geometric point,
`W ↦ T_W` is a monoidal functor from `Rep_Λ(Ĝ^I)` to the endofunctors of
`D_■(Bun_G × Spd C, Λ)`, with `T_{V ⊗ W} ≅ T_V ∘ T_W`. -/
theorem monoidalityOfHeckeOperators_geometricFibre :
    Nonempty (heckeOperator.geometricFibre G Λ I ⋙ mopFunctor _).Monoidal := sorry

/-! ### HS0/demazure-generators-of-ULA-kernels -/

/-- HS0/demazure-generators-of-ULA-kernels (Fargues–Scholze IX.2.1). For `V ∈ Rep_Λ(Ĝ^I)` the
endofunctor `T_V` of `D_■(Bun_G × Spd C, Λ)` maps `D_lis(Bun_G × Spd C, Λ)` into itself. -/
theorem demazureGeneratorsOfULAKernels (V : GeomSatRep G Λ I) (B : DSolid (BunGC G) Λ)
    (hB : DSolid.isLisse _ Λ B) :
    DSolid.isLisse _ Λ (((heckeOperator.geometricFibre G Λ I).obj V).obj B) := sorry

/-- The Hecke action on `D_lis(Bun_G, Λ)`: `V ↦ T_V` for `V ∈ Rep_Λ(Ĝ^I)`, the restriction of
`heckeOperator.geometricFibre` to lisse objects, transported along the equivalence
`D_lis(Bun_G, Λ) ≃ D_lis(Bun_G × Spd C, Λ)`. The target carries the monoidal opposite of
composition, so that `T_{V ⊗ W} ≅ T_V ∘ T_W` reads `T_W ⋙ T_V`. -/
def heckeAction : GeomSatRep G Λ I ⥤ (Dlis (BunG G) Λ ⥤ Dlis (BunG G) Λ)ᴹᵒᵖ := sorry

/-- The Hecke action on `D_lis(Bun_G, Λ)` is monoidal (HS1/monoidality-of-hecke-operators at the
diagonal geometric point, with Fargues–Scholze IX.2.1). -/
instance : (heckeAction G Λ I).Monoidal := sorry

/-- The endofunctor `T_V` of `D_lis(Bun_G, Λ)` of `V ∈ Rep_Λ(Ĝ^I)`. -/
abbrev lisseHecke (V : GeomSatRep G Λ I) : Dlis (BunG G) Λ ⥤ Dlis (BunG G) Λ :=
  ((heckeAction G Λ I).obj V).unmop

/-- HS0/demazure-generators-of-ULA-kernels, second assertion. `T_V` on `D_lis(Bun_G, Λ)` is the
restriction of `T_V` on `D_■(Bun_G × Spd C, Λ)` along the pullback equivalence. -/
theorem demazureGeneratorsOfULAKernels_restrict (V : GeomSatRep G Λ I) :
    Nonempty (lisseHecke G Λ I V ⋙ Dlis.pullback (prod.fst : BunGC G ⟶ BunG G) Λ ⋙
        Dlis.toSolid _ Λ ≅
      Dlis.pullback (prod.fst : BunGC G ⟶ BunG G) Λ ⋙ Dlis.toSolid _ Λ ⋙
        (heckeOperator.geometricFibre G Λ I).obj V) := sorry

/-- HS0/demazure-generators-of-ULA-kernels, third assertion. For `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)` and
`A ∈ D_lis(Bun_G, Λ)`, the pullback of `T_V(A)` to `Bun_G × Spd C` is `T_{V|Ĝ^I}(A)`. -/
theorem demazureGeneratorsOfULAKernels_pullback (V : SatRep G Λ I) :
    Nonempty (Dlis.toSolid _ Λ ⋙ heckeOperator G Λ I V ⋙
        DSolid.pullback (BunGC.toLegs G I) Λ ≅
      lisseHecke G Λ I ((SatRep.toGeom G Λ I).obj V) ⋙
        Dlis.pullback (prod.fst : BunGC G ⟶ BunG G) Λ ⋙ Dlis.toSolid _ Λ) := sorry

/-! ### HS1/properties-and-weil-equivariance -/

/-- HS1/properties-and-weil-equivariance (Fargues–Scholze IX.2.2). For an exact pairing of `V`
and `W` in `Rep_Λ(Ĝ^I)`, in particular for `W = V^∨`, `T_W` is left and right adjoint to `T_V`
on `D_lis(Bun_G, Λ)`: the units and counits are the images of the coevaluations and evaluations
under the monoidal functor `heckeAction`. -/
def propertiesAndWeilEquivariance (V W : GeomSatRep G Λ I) [ExactPairing V W] :
    (lisseHecke G Λ I W ⊣ lisseHecke G Λ I V) × (lisseHecke G Λ I V ⊣ lisseHecke G Λ I W) :=
  sorry
-- Omitted: the formulas for the units and counits in terms of the monoidal structure of
-- `heckeAction` (they are those of `createDualLegs` and `annihilateDualLegs` in HS4).

/-- HS1/properties-and-weil-equivariance, consequences. `T_V` commutes with products and
coproducts and preserves compact objects of `D_lis(Bun_G, Λ)`. -/
theorem propertiesAndWeilEquivariance_compact (V : GeomSatRep G Λ I) :
    (∀ A : Dlis (BunG G) Λ, Dlis.isCompact _ Λ A →
      Dlis.isCompact _ Λ ((lisseHecke G Λ I V).obj A)) ∧
    (∀ J : Type, PreservesColimitsOfShape (Discrete J) (lisseHecke G Λ I V)) ∧
    ∀ J : Type, PreservesLimitsOfShape (Discrete J) (lisseHecke G Λ I V) := sorry

/-! ### HS1/ula-preservation -/

/-- HS1/ula-preservation (Fargues–Scholze IX.2.2). If `A ∈ D_lis(Bun_G, Λ)` is universally
locally acyclic, so is `T_V(A)`. -/
theorem ulaPreservation (V : GeomSatRep G Λ I) (A : Dlis (BunG G) Λ) (hA : BunG.isULA G Λ A) :
    BunG.isULA G Λ ((lisseHecke G Λ I V).obj A) := sorry

/-- HS1/ula-preservation, the criterion used in the proof (Fargues–Scholze VII.7.9): `A` is
universally locally acyclic if and only if `RHom(B, A)` is a perfect complex for every compact
`B`. -/
theorem ulaPreservation_criterion (A : Dlis (BunG G) Λ) :
    BunG.isULA G Λ A ↔
      ∀ B : Dlis (BunG G) Λ, Dlis.isCompact _ Λ B → DMod.isPerfect Λ.carrier (Dlis.RHom B A) :=
  sorry

/-- HS1/ula-preservation, the stratumwise form of the criterion (Fargues–Scholze VII.7.9): `A` is
universally locally acyclic if and only if for every `b` the complex of smooth representations
`i^{b*}A` of `G_b(E)` is admissible, that is, its `K`-invariants are perfect for every open
pro-`p` subgroup `K ⊂ G_b(E)`. -/
theorem ulaPreservation_stratumwise (A : Dlis (BunG G) Λ) :
    BunG.isULA G Λ A ↔ ∀ b : G.ptsBreve, DSmooth.IsAdmissible ((BunG.stalk G Λ b).obj A) := sorry

/-! ### HS1/duality-exchange -/

/-- HS1/duality-exchange, (a). `π_♮(T_V(A) ⊗^■ B) ≅ π_♮(A ⊗^■ T_{sw^*V}(B))`. -/
theorem dualityExchange (V : GeomSatRep G Λ I) (A B : Dlis (BunG G) Λ) :
    Nonempty ((Dlis.homology (BunG G) Λ).obj ((lisseHecke G Λ I V).obj A ⊗ B) ≅
      (Dlis.homology (BunG G) Λ).obj
        (A ⊗ (lisseHecke G Λ I ((GeomSatRep.sw G Λ I).functor.obj V)).obj B)) := sorry

/-- HS1/duality-exchange, (b). For compact `A`:
`D_BZ(T_V(A)) ≅ T_{sw^*V^∨}(D_BZ(A))`. -/
theorem dualityExchange_bernsteinZelevinsky (V : GeomSatRep G Λ I) (A : Dlis (BunG G) Λ)
    (hA : Dlis.isCompact _ Λ A) :
    Nonempty ((BunG.dBZ G Λ).obj (op ((lisseHecke G Λ I V).obj A)) ≅
      (lisseHecke G Λ I ((GeomSatRep.sw G Λ I).functor.obj Vᘁ)).obj
        ((BunG.dBZ G Λ).obj (op A))) := sorry

/-- HS1/duality-exchange, (c). `RHom_lis(T_V(A), Λ) ≅ T_{sw^*V^∨}(RHom_lis(A, Λ))`. -/
theorem dualityExchange_lisseDual (V : GeomSatRep G Λ I) (A : Dlis (BunG G) Λ) :
    Nonempty ((Dlis.dual (BunG G) Λ).obj (op ((lisseHecke G Λ I V).obj A)) ≅
      (lisseHecke G Λ I ((GeomSatRep.sw G Λ I).functor.obj Vᘁ)).obj
        ((Dlis.dual (BunG G) Λ).obj (op A))) := sorry
-- Omitted: naturality of the three isomorphisms in `A` and in `V`.

end HS1

section HS1Condensed

variable {F : LocalField p} (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I]

/-! ### HS1/condensed-enrichment

The condensed ∞-category `S ↦ D_■(Bun_G × S, Λ)` is given here by its values, which are
categories of solid sheaves on the v-stacks `Bun_G × underline S`, and its pullback functors. Of
the enrichment in condensed anima only the homotopy groups are stated: the functor
`condensedStructure.hom` of `Λ`-modules on extremally disconnected sets, applied to shifts. -/

/-- `Bun_G × underline S` for a profinite set `S`. -/
abbrev BunG.times (S : Profinite.{0}) : VStack p :=
  BunG G ⨯ (VSheaf.toStack p).obj ((VSheaf.ofTop p).obj (Profinite.toTopCat.obj S))

/-- HS1/condensed-enrichment. The condensed structure on `D_■(Bun_G, Λ)`: a profinite set `S`
goes to `D_■(Bun_G × S, Λ)`. -/
abbrev condensedStructure (S : Profinite.{0}) : Type 1 := DSolid (BunG.times G S) Λ

/-- The full condensed subcategory `D_lis(Bun_G, Λ)`: an extremally disconnected profinite set
`S` goes to `D_lis(Bun_G × S, Λ)`. -/
abbrev condensedStructure.lisse (S : Stonean.{0}) : Type 1 :=
  Dlis (BunG.times G (Stonean.toProfinite.obj S)) Λ

/-- condensedStructure.pullback. For `g : S' → S` the pullback functor `(id × g)^*`. -/
def condensedStructure.pullback {S S' : Profinite.{0}} (g : S' ⟶ S) :
    condensedStructure G Λ S ⥤ condensedStructure G Λ S' :=
  DSolid.pullback (prod.map (𝟙 (BunG G))
    ((VSheaf.toStack p).map ((VSheaf.ofTop p).map (Profinite.toTopCat.map g)))) Λ

/-- `(id × id)^* ≅ id`, `(id × (g ∘ g'))^* ≅ (id × g')^* ∘ (id × g)^*`, and pullback preserves
lisse objects. -/
theorem condensedStructure.pullback_comp {S S' S'' : Profinite.{0}} (g' : S'' ⟶ S') (g : S' ⟶ S) :
    Nonempty (condensedStructure.pullback G Λ (𝟙 S) ≅ 𝟭 _) ∧
    Nonempty (condensedStructure.pullback G Λ (g' ≫ g) ≅
      condensedStructure.pullback G Λ g ⋙ condensedStructure.pullback G Λ g') ∧
    ∀ A : condensedStructure G Λ S, DSolid.isLisse _ Λ A →
      DSolid.isLisse _ Λ ((condensedStructure.pullback G Λ g).obj A) := sorry
-- Omitted: that `S ↦ D_■(Bun_G × S, Λ)` is a hypersheaf of ∞-categories on profinite sets.

/-- condensedStructure.point. The evaluation at `S = ∗` is `D_■(Bun_G, Λ)`, respectively
`D_lis(Bun_G, Λ)`: pullback along `Bun_G × ∗ → Bun_G` is an equivalence. -/
theorem condensedStructure.point :
    (DSolid.pullback (prod.fst : BunG.times G (Profinite.of PUnit) ⟶ BunG G) Λ).IsEquivalence ∧
    (Dlis.pullback (prod.fst : BunG.times G (Profinite.of PUnit) ⟶ BunG G) Λ).IsEquivalence :=
  sorry

variable {G Λ} in
/-- The restriction `A|_S` of an object of `D_■(Bun_G, Λ)` to `Bun_G × S`. -/
abbrev condensedStructure.restrict (S : Profinite.{0}) (A : DSolid (BunG G) Λ) :
    condensedStructure G Λ S :=
  (DSolid.pullback (prod.fst : BunG.times G S ⟶ BunG G) Λ).obj A

variable {G Λ} in
/-- condensedStructure.hom. The condensed `Λ`-module `Hom(A, B)`, given on extremally
disconnected sets: `S ↦ Hom_{D_■(Bun_G × S, Λ)}(A|_S, B|_S)`. It is `π_0` of the condensed
mapping anima; the higher homotopy groups are the values on the shifts `B⟦-n⟧`. -/
def condensedStructure.hom (A B : DSolid (BunG G) Λ) :
    Stonean.{0}ᵒᵖ ⥤ ModuleCat.{0} Λ.carrier := sorry

variable {G Λ} in
/-- The values of the condensed `Λ`-module `Hom(A, B)`. -/
def condensedStructure.homObj (A B : DSolid (BunG G) Λ) (S : Stonean.{0}) :
    (condensedStructure.hom A B).obj (op S) ≅
      ModuleCat.of Λ.carrier (condensedStructure.restrict (Stonean.toProfinite.obj S) A ⟶
        condensedStructure.restrict (Stonean.toProfinite.obj S) B) := sorry
-- Omitted: the composition `Hom(B, C) × Hom(A, B) → Hom(A, C)` of condensed objects, and the
-- structure of condensed animated `Λ`-module beyond its homotopy groups.

/-- condensedStructure.equivariant. The category `D_■(Bun_G, Λ)^{BW_E^I}` of objects `A` with a
map of condensed animated groups `W_E^I → Aut(A)`. -/
def condensedStructure.equivariant (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    Type 1 := sorry

instance : LargeCategory (condensedStructure.equivariant G Λ I) := sorry

/-- The forgetful functor `D_■(Bun_G, Λ)^{BW_E^I} → D_■(Bun_G, Λ)`. -/
def condensedStructure.equivariant.forget :
    condensedStructure.equivariant G Λ I ⥤ DSolid (BunG G) Λ := sorry

/-- The forgetful functor is conservative. -/
instance : (condensedStructure.equivariant.forget G Λ I).ReflectsIsomorphisms := sorry

variable {G Λ I} in
/-- The action of the abstract group `W_E^I` on the underlying object of an equivariant
object. -/
def condensedStructure.equivariant.action (A : condensedStructure.equivariant G Λ I) :
    (I → F.WeilGroup) →* Aut ((condensedStructure.equivariant.forget G Λ I).obj A) := sorry
-- Omitted: that the forgetful functor preserves limits and colimits of the ∞-categories, and
-- the continuity of the action as a map of condensed animated groups (for rank one objects over
-- the trivial group it is spelled out in `condensedStructure.representations`).

/-- condensedStructure.classifyingStack. `D_■(Bun_G × [∗/W_E^I], Λ) ≃ D_■(Bun_G, Λ)^{BW_E^I}`. -/
def condensedStructure.classifyingStack :
    DSolid (BunG G ⨯ VStack.classifying p (I → F.WeilGroup)) Λ ≌
      condensedStructure.equivariant G Λ I := sorry

/-- The equivalence is compatible with pullback along `Bun_G → Bun_G × [∗/W_E^I]` and the
forgetful functor. -/
theorem condensedStructure.classifyingStack_forget :
    Nonempty ((condensedStructure.classifyingStack G Λ I).functor ⋙
        condensedStructure.equivariant.forget G Λ I ≅
      DSolid.pullback (prod.lift (𝟙 (BunG G))
        (terminal.from _ ≫ VStack.classifying.point p (I → F.WeilGroup))) Λ) := sorry

/-- condensedStructure.trivialAction. Pullback along `Bun_G × [∗/W_E^I] → Bun_G`: the functor
equipping `A` with the trivial action. -/
def condensedStructure.trivialAction :
    DSolid (BunG G) Λ ⥤ condensedStructure.equivariant G Λ I :=
  DSolid.pullback (prod.fst : BunG G ⨯ VStack.classifying p (I → F.WeilGroup) ⟶ BunG G) Λ ⋙
    (condensedStructure.classifyingStack G Λ I).functor

/-- The composite of the trivial action with the forgetful functor is the identity, and the
action of `W_E^I` on its values is trivial. -/
theorem condensedStructure.trivialAction_forget :
    Nonempty (condensedStructure.trivialAction G Λ I ⋙
      condensedStructure.equivariant.forget G Λ I ≅ 𝟭 _) ∧
    ∀ (A : DSolid (BunG G) Λ) (w : I → F.WeilGroup),
      condensedStructure.equivariant.action
        ((condensedStructure.trivialAction G Λ I).obj A) w = 1 := sorry

/-- `D_lis(Bun_G, Λ)^{BW_E^I}`: by Fargues–Scholze IX.1.1 it is the full subcategory of the
equivariant objects of `D_■(Bun_G, Λ)` whose underlying object is lisse. -/
abbrev condensedStructure.lisseEquivariant : Type 1 :=
  ObjectProperty.FullSubcategory fun A : condensedStructure.equivariant G Λ I =>
    DSolid.isLisse _ Λ ((condensedStructure.equivariant.forget G Λ I).obj A)

/-- condensedStructure.lisse_equivariant (Fargues–Scholze IX.1.1, with VII.2.8). Pullback
`D_■(Bun_G × [∗/W_E^I], Λ) → D_■(Bun_G × (Div¹)^I, Λ)` is fully faithful; with the definition of
`condensedStructure.lisseEquivariant` this gives the fully faithful functors
`D_lis(Bun_G, Λ)^{BW_E^I} → D_■(Bun_G × [∗/W_E^I], Λ) → D_■(Bun_G × (Div¹)^I, Λ)` and the
description of the essential image of the first. -/
theorem condensedStructure.lisse_equivariant :
    (DSolid.pullback (prod.map (𝟙 (BunG G)) (Div1.toClassifyingWeil F I)) Λ).Full ∧
    (DSolid.pullback (prod.map (𝟙 (BunG G)) (Div1.toClassifyingWeil F I)) Λ).Faithful := sorry
-- Omitted: that the equivariant objects of the condensed category `D_lis`, defined through its
-- values on extremally disconnected sets, are the objects of `lisseEquivariant`; this is the
-- content of IX.1.1 that the definition above takes as its starting point.

/-- condensedStructure.hom_relativelyDiscrete (Fargues–Scholze IX.1.2). For `A` compact in
`D_lis(Bun_G, Λ)` and `B` lisse, the condensed animated `Λ`-module `Hom(A, B)` is relatively
discrete over `ℤ_ℓ`: in every degree its value on `S` is the value on a point tensored with
`C(S, ℤ_ℓ)`. -/
theorem condensedStructure.hom_relativelyDiscrete (A B : Dlis (BunG G) Λ)
    (hA : Dlis.isCompact _ Λ A) (S : Stonean.{0}) (n : ℤ) :
    Nonempty ((condensedStructure.hom A.obj (B.obj⟦n⟧)).obj (op S) ≅
      ModuleCat.of Λ.carrier (TensorProduct Λ.carrier (A.obj ⟶ B.obj⟦n⟧)
        (TensorProduct ℤ_[ℓ] Λ.carrier C(S, ℤ_[ℓ])))) := sorry
-- Omitted: naturality in `S` of these isomorphisms, which makes them an isomorphism of condensed
-- modules `Hom(A, B) ≅ Hom(A, B)(∗) ⊗_{ℤ_ℓ,disc} ℤ_ℓ`.

/-- condensedStructure.compact. For `A` compact, `B` lisse and `S` extremally disconnected:
`Hom(A, B)(S) ≅ Hom(A, B)(∗) ⊗_{ℤ_ℓ} C(S, ℤ_ℓ)`. So on `D_lis(Bun_G, Λ)^ω` the condensed
structure is determined by the `Λ`-linear category. -/
theorem condensedStructure.compact (A B : Dlis (BunG G) Λ) (hA : Dlis.isCompact _ Λ A)
    (S : Stonean.{0}) :
    Nonempty ((condensedStructure.hom A.obj B.obj).obj (op S) ≅
      ModuleCat.of Λ.carrier (TensorProduct Λ.carrier (A.obj ⟶ B.obj)
        (TensorProduct ℤ_[ℓ] Λ.carrier C(S, ℤ_[ℓ])))) := sorry

/-- condensedStructure.representations. For `G = 1`: `D_lis(∗, Λ) = D(Λ)`; and a
`W_E`-equivariant structure on the unit object `Λ`, of rank one, is a character `χ : W_E → Λ^×`
whose restriction to every compact subset factors continuously through a finitely generated
`ℤ_ℓ`-submodule of `Λ` with its `ℓ`-adic topology. -/
theorem condensedStructure.representations (F : LocalField p) (Λ : Coeff F ℓ) :
    Nonempty (Dlis (BunG (RedGrp.trivial F)) Λ ≌ DMod Λ.carrier) ∧
    ∀ χ : F.WeilGroup →* Λ.carrierˣ,
      (∃ (A : condensedStructure.equivariant (RedGrp.trivial F) Λ Unit)
          (e : (condensedStructure.equivariant.forget (RedGrp.trivial F) Λ Unit).obj A ≅ 𝟙_ _),
          ∀ w : Unit → F.WeilGroup, (condensedStructure.equivariant.action A w).hom =
            e.hom ≫ (((χ (w ()) : Λ.carrierˣ) : Λ.carrier) • 𝟙 (𝟙_ _)) ≫ e.inv) ↔
        ∀ C : Set F.WeilGroup, IsCompact C →
          ∃ N : Submodule ℤ_[ℓ] Λ.carrier, N.FG ∧
            (∀ w ∈ C, ((χ w : Λ.carrierˣ) : Λ.carrier) ∈ N) ∧
            ∀ n : ℕ, IsOpen {x : C × C | ∃ y ∈ N,
              ((χ x.1.1 : Λ.carrierˣ) : Λ.carrier) - ((χ x.2.1 : Λ.carrierˣ) : Λ.carrier) =
                ((ℓ : ℤ_[ℓ]) ^ n) • y} := sorry
-- Omitted: the same description for a finite projective `Λ`-module `M` of arbitrary rank, with
-- `End_Λ(M)` in place of `Λ`.

-- condensedStructure.point_test
example :
    (Dlis.pullback (prod.fst : BunG.times G (Profinite.of PUnit) ⟶ BunG G) Λ).IsEquivalence ∧
    Nonempty (Dlis (BunG.times G (Profinite.of (Fin 2))) Λ ≌
      Dlis (BunG G) Λ × Dlis (BunG G) Λ) ∧
    (condensedStructure.equivariant.forget G Λ Empty).IsEquivalence := by sorry

-- condensedStructure.continuous_functions_test
-- The first two conjuncts are stated for every coefficient ring `Λ`. The packet takes
-- `Λ = ℤ_ℓ[√q]`, a finite free `ℤ_ℓ`-module, for which `Λ ⊗_{ℤ_ℓ} C(S, ℤ_ℓ) = C(S, Λ)`. The third
-- conjunct is the fact of topology behind the packet's last clause: with the first conjunct it
-- shows, for `Λ = ℤ_ℓ[√q]`, that the Hom module is strictly larger than the locally constant
-- functions `S → Λ`. That clause is false for a torsion `Λ`, so it is not stated for every `Λ`.
example (F : LocalField p) (Λ : Coeff F ℓ) (S : Stonean.{0}) :
    Nonempty ((condensedStructure.hom (𝟙_ (DSolid (BunG (RedGrp.trivial F)) Λ)) (𝟙_ _)).obj
        (op S) ≅
      ModuleCat.of Λ.carrier (TensorProduct ℤ_[ℓ] Λ.carrier C(S, ℤ_[ℓ]))) ∧
    (∀ n : ℤ, n ≠ 0 → IsZero ((condensedStructure.hom
      (𝟙_ (DSolid (BunG (RedGrp.trivial F)) Λ)) ((𝟙_ _)⟦n⟧)).obj (op S))) ∧
    (Infinite S → ∃ f : C(S, ℤ_[ℓ]), ¬ IsLocallyConstant f) := by sorry

/-- The object `j_♮ c-Ind_K^{G(E)} Λ` of `D_■(Bun_G, Λ)`, for an open subgroup `K` of `G(E)` and
the open immersion `j : [∗/G(E)] → Bun_G`; it is the object underlying
`(BunG.trivialExtension G Λ).obj (DSmooth.cInd G.pts Λ K)`. -/
def BunG.cIndObj (K : OpenSubgroup G.pts) : DSolid (BunG G) Λ :=
  (DSolid.sharp (BunG.trivialStratum G) Λ).obj ((Dlis.toSolid _ Λ).obj
    ((DSmooth.equivClassifying G.pts Λ).functor.obj (DSmooth.cInd G.pts Λ K)))

-- condensedStructure.hecke_algebra_test
example (K : OpenSubgroup G.pts) (hK : IsOpenProP p K) (S : Stonean.{0}) :
    Nonempty ((condensedStructure.hom (BunG.cIndObj G Λ K) (BunG.cIndObj G Λ K)).obj (op S) ≅
      ModuleCat.of Λ.carrier (TensorProduct Λ.carrier
        (DoubleCoset.Quotient (K : Set G.pts) (K : Set G.pts) →₀ Λ.carrier)
        (TensorProduct ℤ_[ℓ] Λ.carrier C(S, ℤ_[ℓ])))) ∧
    ∀ n : ℤ, n ≠ 0 → IsZero ((condensedStructure.hom (BunG.cIndObj G Λ K)
      ((BunG.cIndObj G Λ K)⟦n⟧)).obj (op S)) := by sorry
-- Omitted: that for `Λ` killed by a power of `ℓ` this is the module of locally constant
-- functions `S → Λ[K\G(E)/K]`.

-- condensedStructure.continuous_representation_test
example (F : LocalField p) (h : ℓ ≠ p) (χ : F.WeilGroup →* (Coeff.base F ℓ h).carrierˣ) :
    (∃ (A : condensedStructure.equivariant (RedGrp.trivial F) (Coeff.base F ℓ h) Unit)
        (e : (condensedStructure.equivariant.forget (RedGrp.trivial F) (Coeff.base F ℓ h)
          Unit).obj A ≅ 𝟙_ _),
        ∀ w : Unit → F.WeilGroup, (condensedStructure.equivariant.action A w).hom =
          e.hom ≫ (((χ (w ()) : (Coeff.base F ℓ h).carrierˣ) : (Coeff.base F ℓ h).carrier) •
            𝟙 (𝟙_ _)) ≫ e.inv) ↔
      ∀ n : ℕ, IsOpen {w : F.WeilGroup | ∃ y : (Coeff.base F ℓ h).carrier,
        ((χ w : (Coeff.base F ℓ h).carrierˣ) : (Coeff.base F ℓ h).carrier) - 1 =
          (ℓ : (Coeff.base F ℓ h).carrier) ^ n * y} := by sorry
-- Omitted: the case of a finite free `Λ`-module of rank at least two, and with it the base
-- change to `Λ` of the Kummer extension of `ℤ_ℓ` by `ℤ_ℓ(1)` attached to a uniformizer, on which
-- inertia acts by unipotent matrices of infinite order. The statement above is the case of rank
-- one over `Λ = ℤ_ℓ[√q]`.

/-! ### HS1/continuous-weil-descent -/

/-- HS1/continuous-weil-descent (Fargues–Scholze IX.2.3). For `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)` and
`A ∈ D_lis(Bun_G, Λ)`, the object `T_V(A)` of `D_■(Bun_G × (Div¹)^I, Λ)` is the pullback of an
object of `D_■(Bun_G × [∗/W_E^I], Λ)`, whose pullback to `Bun_G` is lisse. -/
theorem continuousWeilDescent (V : SatRep G Λ I) (A : Dlis (BunG G) Λ) :
    ∃ B : DSolid (BunG G ⨯ VStack.classifying p (I → F.WeilGroup)) Λ,
      Nonempty ((DSolid.pullback (prod.map (𝟙 (BunG G)) (Div1.toClassifyingWeil F I)) Λ).obj B ≅
        (heckeOperator G Λ I V).obj A.obj) ∧
      DSolid.isLisse _ Λ ((DSolid.pullback (prod.lift (𝟙 (BunG G))
        (terminal.from _ ≫ VStack.classifying.point p (I → F.WeilGroup))) Λ).obj B) := sorry

/-- The `W_E^I`-equivariant Hecke operators
`T_V : D_lis(Bun_G, Λ) → D_lis(Bun_G, Λ)^{BW_E^I}` induced by `continuousWeilDescent`, as a functor
of `V`. -/
def heckeEquivariant :
    SatRep G Λ I ⥤ Dlis (BunG G) Λ ⥤ condensedStructure.lisseEquivariant G Λ I := sorry

/-- HS1/continuous-weil-descent, second assertion. The equivariant Hecke operator lifts `T_V`,
and its composite with the forgetful functor is the endofunctor `T_{V|Ĝ^I}` of
`D_lis(Bun_G, Λ)`. -/
theorem continuousWeilDescent_forget (V : SatRep G Λ I) :
    Nonempty ((heckeEquivariant G Λ I).obj V ⋙ ObjectProperty.ι _ ⋙
        (condensedStructure.classifyingStack G Λ I).inverse ⋙
        DSolid.pullback (prod.map (𝟙 (BunG G)) (Div1.toClassifyingWeil F I)) Λ ≅
      Dlis.toSolid _ Λ ⋙ heckeOperator G Λ I V) ∧
    Nonempty ((heckeEquivariant G Λ I).obj V ⋙ ObjectProperty.ι _ ⋙
        condensedStructure.equivariant.forget G Λ I ≅
      lisseHecke G Λ I ((SatRep.toGeom G Λ I).obj V) ⋙ Dlis.toSolid _ Λ) := sorry
-- That for compact `A` the action on `T_V(A)` is a map of condensed groups for the relatively
-- discrete structure of its endomorphisms is `continuousTensorGeneratorExport` (HS4), stated with
-- `IsRelDiscreteContinuous`. The scope of the input of Drinfeld type (full faithfulness, but not
-- essential surjectivity, of pullback to `X × (Div¹)^I`) is
-- `condensedStructure.lisse_equivariant`.

/-! ### HS1/coefficient-base-change -/

variable {Λ} in
/-- HS1/coefficient-base-change. For a homomorphism `φ : Λ → Λ'` of `ℤ_ℓ[√q]`-algebras and
`V' = V ⊗_Λ Λ'`: (a) `S'_{V'} ≅ S'_V ⊗^■_Λ Λ'`; (b) `T_{V'}(A_{Λ'}) ≅ T_V(A)_{Λ'}`, naturally in
`A`; (c) `r(T_{V'}(B)) ≅ T_V(r(B))` for the restriction of scalars `r`. -/
theorem coefficientBaseChange {Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') :
    Nonempty (SatRep.baseChange G I φ ⋙ globalKernel G Λ' I ≅
      globalKernel G Λ I ⋙ DSolid.extendScalars _ φ) ∧
    ∀ V : SatRep G Λ I,
      Nonempty (DSolid.extendScalars _ φ ⋙
          heckeOperator G Λ' I ((SatRep.baseChange G I φ).obj V) ≅
        heckeOperator G Λ I V ⋙ DSolid.extendScalars _ φ) ∧
      Nonempty (heckeOperator G Λ' I ((SatRep.baseChange G I φ).obj V) ⋙
          DSolid.restrictScalars _ φ ≅
        DSolid.restrictScalars _ φ ⋙ heckeOperator G Λ I V) := sorry
-- Omitted: compatibility of (a) with the monoidal constraints, the `Rep(Q^I)`-linearity and the
-- functoriality in `I`, and of (b) with the composition isomorphisms and the `W_E^I`-equivariant
-- structures.

end HS1Condensed

section HS1WeilAction

attribute [local instance] CategoryTheory.endofunctorMonoidalCategory

variable {F : LocalField p}

/-! ### HS1/continuous-weil-descent and HS1/coefficient-base-change: the form used by HS3 and HS4

Stages HS3 and HS4 use the operators `T_V` of `heckeEquivariant` as endofunctors of
`D_lis(Bun_G, Λ)` with an action of the abstract group `W_E^I` by natural automorphisms,
functorially in `V`. This form, `weilHeckeAction`, is defined here from `heckeEquivariant`; it is
not a second placeholder object. The abstract group forgets the continuity of the action, which
is stated separately with `IsRelDiscreteContinuous`. -/

/-- The endofunctors of `D_lis(Bun_G, Λ)`, with the tensor product `T ⊗ T' = T ∘ T'` (first
`T'`, then `T`): the monoidal opposite of Mathlib's composition product. It is the target of
`heckeAction`. -/
abbrev LisEnd (G : RedGrp F) (Λ : Coeff F ℓ) : Type 1 :=
  (Dlis (BunG G) Λ ⥤ Dlis (BunG G) Λ)ᴹᵒᵖ

/-- The endofunctors of `D_lis(Bun_G, Λ)` with an action of the group `W_E^I` by natural
automorphisms; morphisms are the equivariant natural transformations, and `W_E^I` acts on a
composite through both factors. This is the category underlying
`End_Λ(D_lis(Bun_G, Λ))^{BW_E^I}`; the continuity of the action is `IsRelDiscreteContinuous`. -/
abbrev WeilLisEnd (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) : Type 1 :=
  Action (LisEnd G Λ) (I → F.WeilGroup)

/-- The functor that forgets the condensed structure of the action: an object of
`D_lis(Bun_G, Λ)^{BW_E^I}` gives its underlying lisse object with the action of the abstract
group `W_E^I` (`condensedStructure.equivariant.forget` and `condensedStructure.equivariant.action`).
That morphisms of equivariant objects commute with the actions is a property of the category
`condensedStructure.equivariant`, recorded by the placeholder. -/
def condensedStructure.lisseEquivariant.toAction (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type)
    [Finite I] :
    condensedStructure.lisseEquivariant G Λ I ⥤ Action (Dlis (BunG G) Λ) (I → F.WeilGroup) where
  obj A :=
    { V := ⟨(condensedStructure.equivariant.forget G Λ I).obj A.obj, A.property⟩
      ρ :=
        { toFun := fun w =>
            ObjectProperty.homMk (condensedStructure.equivariant.action A.obj w).hom
          map_one' := by
            apply ObjectProperty.hom_ext
            simp [End.one_def]
            rfl
          map_mul' := fun w w' => by
            apply ObjectProperty.hom_ext
            simp [End.mul_def]
            rfl } }
  map f :=
    { hom := ObjectProperty.homMk ((condensedStructure.equivariant.forget G Λ I).map f.hom)
      comm := sorry }

/-- `V ↦ (A ↦ T_V(A) with its action of W_E^I)`, a functor to the objects of
`D_lis(Bun_G, Λ)` with an action of the abstract group `W_E^I`: `heckeEquivariant` followed by
the functor forgetting the condensed structure of the action. -/
def weilHeckeAction.equivariant (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    SatRep G Λ I ⥤ Dlis (BunG G) Λ ⥤ Action (Dlis (BunG G) Λ) (I → F.WeilGroup) :=
  heckeEquivariant G Λ I ⋙
    (Functor.whiskeringRight _ _ _).obj (condensedStructure.lisseEquivariant.toAction G Λ I)

/-- HS1/continuous-weil-descent in the form of HS4: `V ↦ T_V`, the Hecke operator as an
endofunctor of `D_lis(Bun_G, Λ)` with its action of `W_E^I` (Fargues–Scholze IX.2.3, IX.2.4). It
is `weilHeckeAction.equivariant` read through the equivalence between functors to objects with an
action and endofunctors with an action. -/
def weilHeckeAction (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    SatRep G Λ I ⥤ WeilLisEnd G Λ I :=
  weilHeckeAction.equivariant G Λ I ⋙
    (Functor.whiskeringRight _ _ _).obj (Action.functorCategoryEquivalence _ _).functor ⋙
    flipFunctor _ _ _ ⋙ (Action.functorCategoryEquivalence _ _).inverse ⋙
    (mopFunctor _).mapAction (I → F.WeilGroup)

/-- The underlying endofunctor `T_V` of `D_lis(Bun_G, Λ)`. -/
abbrev weilHeckeAction.functor (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I]
    (V : SatRep G Λ I) : Dlis (BunG G) Λ ⥤ Dlis (BunG G) Λ :=
  ((weilHeckeAction G Λ I).obj V).V.unmop

/-- HS1/continuous-weil-descent: over the diagonal geometric point of `(Div¹)^I` the solid Hecke
operator `heckeOperator` is the pullback of the lisse one. -/
def weilHeckeAction.comparison (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I]
    (V : SatRep G Λ I) (A : Dlis (BunG G) Λ) :
    (DSolid.pullback (BunGC.toLegs G I) Λ).obj ((heckeOperator G Λ I V).obj A.obj) ≅
      (DSolid.pullback (prod.fst : BunGC G ⟶ BunG G) Λ).obj
        ((weilHeckeAction.functor G Λ I V).obj A).obj := sorry

/-- `W ↦ T_W`, the action of `Rep_Λ(Ĝ)` on `D_lis(Bun_G, Λ)` by the Hecke operators at a
geometric point of `Div¹` (Fargues–Scholze IX.2.1): the one-leg case of `heckeAction`, whose
monoidal structure is that of `heckeAction`. -/
abbrev heckeGeom (G : RedGrp F) (Λ : Coeff F ℓ) : GeomSatRep G Λ Unit ⥤ LisEnd G Λ :=
  heckeAction G Λ Unit

/-- The endofunctor `T_W` of `D_lis(Bun_G, Λ)` for `W ∈ Rep_Λ(Ĝ)`: `lisseHecke` for one leg. -/
abbrev heckeGeom.functor (G : RedGrp F) (Λ : Coeff F ℓ) (W : GeomSatRep G Λ Unit) :
    Dlis (BunG G) Λ ⥤ Dlis (BunG G) Λ :=
  lisseHecke G Λ Unit W

/-- HS1/continuous-weil-descent, second assertion, naturally in `V`: the endofunctor underlying
`T_V`, for `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)`, is the Hecke operator of the restriction of `V` to the
diagonal copy of `Ĝ`. -/
def heckeGeom.comparison (G : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I] :
    SatRep.diag G Λ I ⋙ heckeGeom G Λ ≅
      weilHeckeAction G Λ I ⋙ Action.forget (LisEnd G Λ) (I → F.WeilGroup) := sorry

/-- HS1/coefficient-base-change on lisse sheaves: `T_V(A) ⊗_Λ Λ' ≅ T_{V ⊗_Λ Λ'}(A ⊗_Λ Λ')`. -/
def weilHeckeAction.extendScalars (G : RedGrp F) {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') (I : Type)
    [Finite I] (V : SatRep G Λ I) :
    weilHeckeAction.functor G Λ I V ⋙ Dlis.extendScalars (BunG G) φ ≅
      Dlis.extendScalars (BunG G) φ ⋙
        weilHeckeAction.functor G Λ' I ((SatRep.baseChange G I φ).obj V) := sorry

/-- HS1/condensed-enrichment: a homomorphism from a topological monoid `Γ` to the endomorphisms
of an object `A` of a `Λ`-linear category is continuous for the relatively discrete condensed
structure of `End(A)` over `ℤ_ℓ`: on every profinite set mapping continuously to `Γ` it is a
finite sum of endomorphisms with coefficients continuous functions to `ℤ_ℓ`. For `A` compact in
`D_lis(Bun_G, Λ)` this is a map of condensed monoids `Γ → End(A)` (Fargues–Scholze IX.1.2). No
placeholder. -/
def IsRelDiscreteContinuous {C : Type*} [Category C] [Preadditive C] (Λ : Coeff F ℓ)
    [Linear Λ.carrier C] {Γ : Type} [TopologicalSpace Γ] [Monoid Γ] {A : C} (ρ : Γ →* End A) :
    Prop :=
  ∀ (S : Profinite.{0}) (g : C(S, Γ)), ∃ (n : ℕ) (m : Fin n → (A ⟶ A)) (f : Fin n → C(S, ℤ_[ℓ])),
    ∀ s : S, (ρ (g s) : A ⟶ A) = ∑ i, algebraMap ℤ_[ℓ] Λ.carrier (f i s) • m i

end HS1WeilAction

/-! ## HS2: moduli spaces of local shtukas, period maps and level towers

Order of the stage. The nodes come in an order in which each declaration only uses earlier
ones: framed-bundle-fibres,
lattice-extension-functor, admissible-period-torsor, local-shtuka-moduli, levels-and-tower-limit,
hecke-fibre-description, one-leg-period-map, general-local-field,
multi-leg-period-and-representability, no-legs-and-basic-duality, structure-map-compactifiable,
minuscule-rigidification, classical-period-points, nonemptiness-and-period-connectedness,
component-transitivity-source-gate, adjoint-period-and-tower-comparison,
torus-products-and-determinant, weil-descent-datum.

Orientation. σ-conjugation is `b ↦ g b σ(g)⁻¹`. Period spaces are in the orientation of
Scholze–Weinstein: a point `x` of `Gr_{≤μ}` is a modification `E_x ⇢ E_b` bounded by `μ`, and the
admissible locus is non-empty exactly when `[b] ∈ B(G, μ⁻¹)`. All group actions are left actions:
`G(E) = Aut(E_1)` acts on trivialisations and on modifications from `E_1` by `τ ↦ τ ∘ g⁻¹`, and
`J_b(E) ⊂ Aut(E_b)` by `α ↦ j ∘ α`. -/

section HS2

variable {F : LocalField p}

/-! ### HS2/framed-bundle-fibres: modifications between `E_b` and `E_b'` -/

section FramedBundleFibres

/-- The two bundles of a bounded modification: `((D_i), E_1, E_2, α) ↦ (E_1, E_2)`. -/
def HckI.BoundedLe.ends (G : RedGrp F) {I : Type} [Finite I] (μ : I → G.Cochar) :
    HckI.BoundedLe G μ ⟶ BunG G ⨯ BunG G :=
  prod.lift (HckI.BoundedLe.toHck G μ ≫ HckI.p1 G I)
    (HckI.BoundedLe.toHck G μ ≫ HckI.p2 G I ≫ prod.fst)

/-- HS2/framed-bundle-fibres, `FramedModification` [data]. The v-sheaf `Mod^I_{b,b',≤μ•}` over
`D_I = ∏_i Div¹_{E_i}`. Its `S`-points are the pairs `((D_i), α)` of legs `D_i ∈ Div¹_{E_i}(S)` and
an isomorphism `α : E_b ≅ E_b'` of `G`-bundles over `X_S ∖ ⋃ D_i`, meromorphic along `⋃ D_i` and
bounded at `D_i` by `Σ_{j : D_j = D_i} μ_j` at all geometric points of `S`. Both bundles are fixed,
so points have no automorphisms. No level structure, no basicness and no minuscule hypothesis. -/
def FramedModification (G : RedGrp F) (b b' : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) : VSheaf p := sorry

namespace FramedModification

variable (G : RedGrp F) (b b' b'' : G.ptsBreve) {I I' : Type} [Finite I] [Finite I']
  (μ : I → G.Cochar)

/-- `FramedModification.legs` [projection]: `Mod^I_{b,b',≤μ•} → D_I`, `((D_i), α) ↦ (D_i)`. -/
def legs : FramedModification G b b' μ ⟶ G.divBase μ := sorry

/-- `FramedModification.ofHecke` [universal-property]: `Mod^I_{b,b',≤μ•}` is the 2-fibre product
`Spd k ×_{x_b, Bun_G, p_1} Hck^I_{G,≤μ•} ×_{p_2, Bun_G, x_b'} Spd k`: the fibre of
`(E_1, E_2) : Hck^I_{G,≤μ•} → Bun_G × Bun_G` over the point `(E_b, E_b')`, compatibly with the
legs. -/
theorem ofHecke :
    ∃ t : (FramedModification G b b' μ).stack ⟶ HckI.BoundedLe G μ,
      VStack.IsCartesian t (terminal.from _) (HckI.BoundedLe.ends G μ)
          (prod.lift (BunG.point G b) (BunG.point G b')) ∧
        t ≫ HckI.BoundedLe.legs G μ = VSheaf.stackMap (legs G b b' μ) := sorry

/-- `FramedModification.sourceAction` [structure]: `g ∈ G̃_b(S) = Aut(E_b|_{X_S})` acts by
`α ↦ α ∘ g⁻¹`, a left action of the whole of `G̃_b` (which for non-basic `b` is strictly larger
than `underline{J_b(E)}`). -/
def sourceAction : VSheaf.Action (BunG.autGrp G b) (FramedModification G b b' μ) := sorry

/-- `FramedModification.targetAction` [structure]: `g' ∈ G̃_b'(S)` acts by `α ↦ g' ∘ α`. -/
def targetAction : VSheaf.Action (BunG.autGrp G b') (FramedModification G b b' μ) := sorry

/-- The source action is an action over `D_I`. -/
theorem sourceAction_legs : (sourceAction G b b' μ).Invariant (legs G b b' μ) := sorry

/-- The target action is an action over `D_I`. -/
theorem targetAction_legs : (targetAction G b b' μ).Invariant (legs G b b' μ) := sorry

/-- The source action and the target action commute. -/
theorem sourceAction_commute :
    (sourceAction G b b' μ).Commute (targetAction G b b' μ) := sorry

/-- The actions of `J_b(E)` and of `G(E) = J_1(E)` on the source, through
`underline{J_b(E)} ⊂ G̃_b`. -/
def sourceActionJ :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b)) (FramedModification G b b' μ) :=
  (sourceAction G b b' μ).comap (BunG.autGrpIncl G b)

/-- The action of `J_b'(E)` on the target, through `underline{J_b'(E)} ⊂ G̃_b'`. -/
def targetActionJ :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b')) (FramedModification G b b' μ) :=
  (targetAction G b b' μ).comap (BunG.autGrpIncl G b')

/-- For `b = 1`: the action of `G(E) = Aut(E_1)` on modifications from the trivial bundle,
`g · α = α ∘ g⁻¹`. -/
def groupAction : VSheaf.Action (VSheaf.constGrp p G.pts) (FramedModification G 1 b μ) :=
  (sourceActionJ G 1 b μ).comap
    (VSheaf.constGrpMap p (ContinuousMonoidHom.toContinuousMonoidHom G.centralizerOne))

/-- `FramedModification.quotient` [characterisation]: `[Mod^I_{b,b',≤μ•}/(G̃_b × G̃_b')]` is
`Bun_G^b ×_{Bun_G, p_1} Hck^I_{G,≤μ•} ×_{p_2, Bun_G} Bun_G^{b'}`, the part of the Hecke
correspondence between the two strata. -/
theorem quotient :
    Nonempty
      (VStack.quotient
          ((sourceAction G b b' μ).prod (targetAction G b b' μ) (sourceAction_commute G b b' μ)) ≅
        VStack.fibre (HckI.BoundedLe.ends G μ)
          (prod.map (BunG.stratumIncl G (RedGrp.BofG.mk b))
            (BunG.stratumIncl G (RedGrp.BofG.mk b')))) := sorry

/-- `FramedModification.locallySpatial` [structure]: `Mod^I_{b,b',≤μ•} → D_I` is representable in
locally spatial diamonds, and its pullback along `∏_i Spd Ĕ_i → D_I` is a locally spatial
diamond. -/
theorem locallySpatial :
    VStack.reprLocSpatial p (VSheaf.stackMap (legs G b b' μ)) ∧
      VSheaf.isLocSpatialDiamond p (pullback (legs G b b' μ) (G.legBaseToDivBase μ)) := sorry

/-- `FramedModification.inverse` [equivalence]: `α ↦ α⁻¹` is an isomorphism
`Mod^I_{b,b',≤μ•} ≅ Mod^I_{b',b,≤μ•⁻¹}`, where `μ⁻¹` is the class of the inverse cocharacters (with
dominant representative `-w₀μ`). -/
def inverse (μ' : I → G.Cochar) (h : ∀ i, μ' i = (μ i).dual) :
    FramedModification G b b' μ ≅ FramedModification G b' b μ' := sorry

/-- Inversion is an involution. -/
theorem inverse_inverse (μ' : I → G.Cochar) (h : ∀ i, μ' i = (μ i).dual)
    (h' : ∀ i, μ i = (μ' i).dual) :
    inverse G b b' μ μ' h ≪≫ inverse G b' b μ' μ h' = Iso.refl _ := sorry

-- Omitted: inversion is a map over `D_I`. The interface does not identify the fields of
-- definition of `μ` and of `μ⁻¹`; the statement is made over `(Div¹_E)^I`.
/-- Inversion is compatible with the legs, as divisors of the curve of `E`. -/
theorem inverse_legs (μ' : I → G.Cochar) (h : ∀ i, μ' i = (μ i).dual) :
    (inverse G b b' μ μ' h).hom ≫ legs G b' b μ' ≫ G.divBaseToDiv1 μ' =
      legs G b b' μ ≫ G.divBaseToDiv1 μ := sorry

/-- Inversion intertwines the source action of `G̃_b` with its target action: it exchanges the
action of `(g, g')` with that of `(g', g)`. -/
theorem inverse_equivariant (μ' : I → G.Cochar) (h : ∀ i, μ' i = (μ i).dual) :
    (sourceAction G b b' μ).Equivariant (targetAction G b' b μ') (inverse G b b' μ μ' h).hom ∧
      (targetAction G b b' μ).Equivariant (sourceAction G b' b μ') (inverse G b b' μ μ' h).hom :=
  sorry

/-- Renaming the legs along a bijection of index sets. -/
def reindex {J : Type} [Finite J] (e : J ≃ I) (ν : J → G.Cochar) (h : ∀ j, ν j = μ (e j)) :
    FramedModification G b b' μ ≅ FramedModification G b b' ν := sorry

/-- The identity modification, the point `id ∈ Mod^∅_{b,b}`. -/
def idPoint : ⊤_ (VSheaf p) ⟶ FramedModification G b b G.noLegs := sorry

/-- `FramedModification.comp` [functoriality]: for disjoint index sets, composition of
modifications `(α, α') ↦ α' ∘ α`,
`Mod^I_{b,b',≤μ•} × Mod^{I'}_{b',b'',≤μ'•} → Mod^{I ⊔ I'}_{b,b'',≤(μ•,μ'•)}`. -/
def comp (μ' : I' → G.Cochar) :
    FramedModification G b b' μ ⨯ FramedModification G b' b'' μ' ⟶
      FramedModification G b b'' (Sum.elim μ μ') := sorry

/-- Composition of modifications is associative. -/
theorem comp_assoc {I'' : Type} [Finite I''] (b''' : G.ptsBreve) (μ' : I' → G.Cochar)
    (μ'' : I'' → G.Cochar) :
    prod.map (comp G b b' b'' μ μ') (𝟙 (FramedModification G b'' b''' μ'')) ≫
        comp G b b'' b''' (Sum.elim μ μ') μ'' ≫
        (reindex G b b''' (Sum.elim (Sum.elim μ μ') μ'') (Equiv.sumAssoc I I' I'').symm
          (Sum.elim μ (Sum.elim μ' μ'')) (by rintro (i | i | i) <;> rfl)).hom =
      (prod.associator _ _ _).hom ≫
        prod.map (𝟙 (FramedModification G b b' μ)) (comp G b' b'' b''' μ' μ'') ≫
        comp G b b' b''' μ (Sum.elim μ' μ'') := sorry

/-- Composition with the identity modification is the identity. -/
theorem comp_idPoint :
    prod.lift (𝟙 (FramedModification G b b' μ)) (terminal.from _ ≫ idPoint G b') ≫
        comp G b b' b' μ G.noLegs ≫
        (reindex G b b' (Sum.elim μ G.noLegs) (Equiv.sumEmpty I Empty).symm μ
          (fun _ => rfl)).hom =
      𝟙 _ := sorry

/-- Composition with the identity modification on the other side is the identity. -/
theorem idPoint_comp :
    prod.lift (terminal.from _ ≫ idPoint G b) (𝟙 (FramedModification G b b' μ)) ≫
        comp G b b b' G.noLegs μ ≫
        (reindex G b b' (Sum.elim G.noLegs μ) (Equiv.emptySum Empty I).symm μ
          (fun _ => rfl)).hom =
      𝟙 _ := sorry

/-- `FramedModification.changeGroup` [functoriality]: a homomorphism `f : G → H` with
`f(μ•) ≤ μ^H•` induces `Mod^I_{b,b',≤μ•} → Mod^I_{f(b),f(b'),≤μ^H•}`, `α ↦ f_* α`. -/
def changeGroup {H : RedGrp F} (f : G ⟶ H) (μH : I → H.Cochar)
    (h : ∀ i, RedGrp.Cochar.map f (μ i) ≤ μH i) :
    FramedModification G b b' μ ⟶
      FramedModification H (RedGrp.ptsBreveMap f b) (RedGrp.ptsBreveMap f b') μH := sorry

-- Omitted: `f_*` is a map over `∏_i Div¹_{E_i}`. The interface has no map between the curves of
-- the fields of definition of `μ` and `f ∘ μ`; the statement is made over `(Div¹_E)^I`.
/-- `f_*` is compatible with the legs and equivariant along `G̃_b → H̃_{f(b)}` and
`G̃_b' → H̃_{f(b')}`. -/
theorem changeGroup_spec {H : RedGrp F} (f : G ⟶ H) (μH : I → H.Cochar)
    (h : ∀ i, RedGrp.Cochar.map f (μ i) ≤ μH i) :
    changeGroup G b b' μ f μH h ≫ legs H _ _ μH ≫ H.divBaseToDiv1 μH =
        legs G b b' μ ≫ G.divBaseToDiv1 μ ∧
      VSheaf.Action.EquivariantAlong (BunG.autGrpMap f b) (sourceAction G b b' μ)
        (sourceAction H _ _ μH) (changeGroup G b b' μ f μH h) ∧
      VSheaf.Action.EquivariantAlong (BunG.autGrpMap f b') (targetAction G b b' μ)
        (targetAction H _ _ μH) (changeGroup G b b' μ f μH h) := sorry

/-- `FramedModification.noLegs` [example]: `Mod^∅_{b,b'} = ∅` when `b` and `b'` have different
classes in `B(G)`, and `Mod^∅_{b,b} = G̃_b` is a trivial bitorsor under `G̃_b`: a torsor over
`Spd k` for the source action and for the target action, with the point `id`. -/
theorem noLegs :
    (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk b' → (FramedModification G b b' G.noLegs).IsEmpty) ∧
      (sourceAction G b b G.noLegs).IsTorsor (terminal.from _) ∧
      (targetAction G b b G.noLegs).IsTorsor (terminal.from _) := sorry

end FramedModification

-- FramedModification.noLegs_test
-- With no legs `Mod^∅_{b,b} = G̃_b`, with `(g, g')` acting by `h ↦ g' h g⁻¹`, and `Mod^∅_{b,b'}` is
-- empty for `b ≠ b'` in `B(G)`; for `GL_2` and `b` not basic (`E_b = 𝒪 ⊕ 𝒪(1)`), `G̃_b` is strictly
-- larger than `underline{J_b(E)}`.
-- Omitted: the description of `G̃_b(S)` by triples `(a, d, u)` with `u ∈ H⁰(X_S, 𝒪(1))`; the
-- interface has no Banach–Colmez spaces.
example (G : RedGrp F) (b b' : G.ptsBreve) (c : (RedGrp.GLn F 2).ptsBreve)
    (hc : RedGrp.BofG.mk c ∉ (RedGrp.GLn F 2).basic) :
    (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk b' → (FramedModification G b b' G.noLegs).IsEmpty) ∧
      (∃ e : ∀ S : Perfd p,
          (FramedModification G b b G.noLegs).pts S ≃ (BunG.autGrp G b).obj (op S),
        (∀ (S T : Perfd p) (f : T ⟶ S) (x : (FramedModification G b b G.noLegs).pts S),
            e T ((FramedModification G b b G.noLegs).obj.map f.op x) =
              (BunG.autGrp G b).map f.op (e S x)) ∧
          ∀ (S : Perfd p) (g g' : (BunG.autGrp G b).obj (op S))
            (x : (FramedModification G b b G.noLegs).pts S),
            e S ((FramedModification.targetAction G b b G.noLegs).smul S g'
                ((FramedModification.sourceAction G b b G.noLegs).smul S g x)) =
              g' * e S x * g⁻¹) ∧
      ¬ IsIso (BunG.autGrpIncl (RedGrp.GLn F 2) c) := by
  sorry

-- FramedModification.gm_test
-- For `𝔾_m`, one leg and `μ(z) = z^d`: `Mod_{b,b',μ}` is empty unless `v(b) - v(b') = d`, and is
-- then a torsor over `Div¹` under `underline{E^×} = G̃_b` acting on the source and equally under
-- `underline{E^×} = G̃_b'` acting on the target; `c ∈ E^×` multiplies `α` by `c⁻¹` through the
-- first action and by `c` through the second. It is non-empty for `(v(b), v(b'), d) = (1, 0, 1)`
-- and empty for `(0, 1, 1)`.
example (b b' : (RedGrp.Gm F).ptsBreve) (d : ℤ)
    (v : (RedGrp.Gm F).ptsBreve → ℤ)
    (hv : ∀ c, v c = Multiplicative.toAdd (F.valBreve (RedGrp.Gm.ptsBreveEquiv F c))) :
    (v b - v b' ≠ d →
        (FramedModification (RedGrp.Gm F) b b' (RedGrp.oneLeg (RedGrp.Gm.cochar F d))).IsEmpty) ∧
      (v b - v b' = d →
        (FramedModification.sourceActionJ (RedGrp.Gm F) b b'
            (RedGrp.oneLeg (RedGrp.Gm.cochar F d))).IsTorsor
          (FramedModification.legs (RedGrp.Gm F) b b' (RedGrp.oneLeg (RedGrp.Gm.cochar F d))) ∧
        (FramedModification.targetActionJ (RedGrp.Gm F) b b'
            (RedGrp.oneLeg (RedGrp.Gm.cochar F d))).IsTorsor
          (FramedModification.legs (RedGrp.Gm F) b b' (RedGrp.oneLeg (RedGrp.Gm.cochar F d)))) ∧
      (∀ (S : Perfd p) (c : (RedGrp.Gm F).pts)
          (x : (FramedModification (RedGrp.Gm F) b b'
            (RedGrp.oneLeg (RedGrp.Gm.cochar F d))).pts S),
        (FramedModification.sourceActionJ (RedGrp.Gm F) b b'
            (RedGrp.oneLeg (RedGrp.Gm.cochar F d))).smulConst S
            ((RedGrp.Gm F).torusCentralizer (RedGrp.isTorus_Gm F) b c) x =
          (FramedModification.targetActionJ (RedGrp.Gm F) b b'
            (RedGrp.oneLeg (RedGrp.Gm.cochar F d))).smulConst S
            ((RedGrp.Gm F).torusCentralizer (RedGrp.isTorus_Gm F) b' c⁻¹) x) ∧
      (v b = 1 → v b' = 0 →
        ¬ (FramedModification (RedGrp.Gm F) b b' (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).IsEmpty) ∧
      (v b = 0 → v b' = 1 →
        (FramedModification (RedGrp.Gm F) b b'
          (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).IsEmpty) := by
  sorry

-- FramedModification.oneBundle_test
-- For `𝔾_m` and `μ(z) = z`: `Mod_{1,1,μ}` is empty, whereas the fibre of
-- `p_1 : Hck_{𝔾_m,μ} → Bun_{𝔾_m}` over `E_1` alone, the target bundle not being fixed, is `Div¹`.
example :
    (FramedModification (RedGrp.Gm F) 1 1 (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).IsEmpty ∧
      IsIso
        (VStack.fibre.fst
            (HckI.BoundedLe.toHck (RedGrp.Gm F) (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) ≫
              HckI.p1 (RedGrp.Gm F) Unit)
            (BunG.point (RedGrp.Gm F) 1) ≫
          HckI.BoundedLe.legs (RedGrp.Gm F) (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))) := by
  sorry

-- FramedModification.inverse_test
-- Inversion identifies `Mod_{b,1,≤μ}` with `Mod_{1,b,≤μ⁻¹}`; for `GL_2` and `μ = (1,0)` one has
-- `μ⁻¹ = (0,-1)`; for `𝔾_m`, `μ(z) = z` and `v(b) = 1`: `Mod_{b,1,μ}` and `Mod_{1,b,μ⁻¹}` are
-- non-empty, while `Mod_{1,b,μ}` is empty.
example (G : RedGrp F) (c : G.ptsBreve) (μ : G.Cochar)
    (v w : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![1, 0]) (hw : w.1 = ![0, -1])
    (b : (RedGrp.Gm F).ptsBreve)
    (hb : F.valBreve (RedGrp.Gm.ptsBreveEquiv F b) = Multiplicative.ofAdd 1) :
    Nonempty (FramedModification G c 1 (RedGrp.oneLeg μ) ≅
        FramedModification G 1 c (RedGrp.oneLeg μ.dual)) ∧
      (RedGrp.GLn.cochar F 2 v).dual = RedGrp.GLn.cochar F 2 w ∧
      (RedGrp.Gm.cochar F 1).dual = RedGrp.Gm.cochar F (-1) ∧
      ¬ (FramedModification (RedGrp.Gm F) b 1 (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).IsEmpty ∧
      ¬ (FramedModification (RedGrp.Gm F) 1 b (RedGrp.oneLeg (RedGrp.Gm.cochar F (-1)))).IsEmpty ∧
      (FramedModification (RedGrp.Gm F) 1 b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).IsEmpty := by
  sorry

end FramedBundleFibres

/-! ### HS2/lattice-extension-functor: extending `G`-torsors over `p = 0`

Here `E = ℚ_p`. A `φ⁻¹`-equivariant `G`-torsor `P_η` on `Y_(0,r](S)` is given by the `G`-bundle on
`X_S` to which it descends (Scholze–Weinstein 22.1.1), that is, by an `S`-point `x` of `Bun_G`. -/

section LatticeExtension

variable {G : RedGrp (LocalField.Qp p)}

/-- HS2/lattice-extension-functor, `LatticeSpace` [data]. For an affinoid perfectoid space `S`
with pseudo-uniformizer `ϖ`, a rational `r > 0` and a `φ⁻¹`-equivariant `G`-torsor `P_η` on
`Y_(0,r](S)` (the restriction of the pullback of the bundle `x`): the functor `Latt(P_η)` sending
`S' → S` to the set of isomorphism classes of pairs `(P', j)` of a `φ⁻¹`-equivariant `𝒢`-torsor
`P'` on `Y_[0,r](S')` and a `φ⁻¹`-equivariant isomorphism `j` of `P'|_{Y_(0,r](S')}` with the
pullback of `P_η`; such pairs have no non-trivial automorphisms. `𝒢` is a smooth affine model of
`G` over `ℤ_p` with connected fibres. -/
def LatticeSpace (𝒢 : G.Model) {S : Perfd p} (ϖ : S.PseudoUnif) (r : {r : ℚ // 0 < r})
    (x : S.sheaf.stack ⟶ BunG G) : VSheaf p := sorry

namespace LatticeSpace

variable (𝒢 : G.Model) {S : Perfd p} (ϖ : S.PseudoUnif) (r : {r : ℚ // 0 < r})
  (x : S.sheaf.stack ⟶ BunG G)

/-- `LatticeSpace.toBase` [projection]: the structure map `Latt(P_η) → S`. -/
def toBase : LatticeSpace 𝒢 ϖ r x ⟶ S.sheaf := sorry

/-- The structure map `Latt(P_η) → S` is étale, with image the admissible locus `S^a`
(Scholze–Weinstein, Theorem 22.6.2). -/
theorem toBase_etale :
    VStack.etale p (VSheaf.stackMap (toBase 𝒢 ϖ r x)) ∧
      ∃ t : LatticeSpace 𝒢 ϖ r x ⟶ BunG.trivLocus x,
        t ≫ BunG.trivLocus.incl x = toBase 𝒢 ϖ r x ∧ Sheaf.IsLocallySurjective t := sorry

/-- `LatticeSpace.admissibleLocus` [characterisation]: the admissible locus `S^a`, the locus where
the `G`-torsor on `X_S` attached to `P_η` is trivial at geometric points, is open in `S`, and it
is the locus where `ν_{P_η}` and `κ_{P_η}` both vanish. -/
theorem admissibleLocus :
    VStack.openImmersion p (VSheaf.stackMap (BunG.trivLocus.incl x)) ∧
      ∀ (s : Perfd.GeomPoint p) (y : S.sheaf.geomPts s),
        y ∈ Set.range (VSheaf.ptsMap (BunG.trivLocus.incl x) s.toPerfd) ↔
          G.newton (BunG.classAt x s y) = 0 ∧ G.kottwitz (BunG.classAt x s y) = 0 := sorry

-- Omitted: the category of `φ⁻¹`-equivariant `𝒢`-torsors on `Y_[0,r](S)` and the functor
-- `ℙ ↦ ℙ ×^{𝒢(ℤ_p)} (𝒢 × Y_[0,r](S))`; the interfaces have no torsors over `S ×̇ Spa ℤ_p`. Stated:
-- the consequence for `Latt`, in which an extension of `P_η` is a pro-étale `𝒢(ℤ_p)`-torsor.
/-- `LatticeSpace.integralTorsors` [equivalence] (Scholze–Weinstein, Proposition 22.6.1), through
its consequence for `Latt(P_η)`: an `S'`-point of `Latt(P_η)` is a pro-étale `𝒢(ℤ_p)`-torsor `ℙ`
on `S'` with an isomorphism between the bundle of `ℙ ×^{𝒢(ℤ_p)} G(ℚ_p)` and the pullback of the
bundle of `P_η`; that is, `Latt(P_η) = S ×_{Bun_G} [∗/underline{𝒢(ℤ_p)}]`. -/
theorem integralTorsors :
    ∃ t : (LatticeSpace 𝒢 ϖ r x).stack ⟶ VStack.classifying p 𝒢.level.1.toSubgroup,
      VStack.IsCartesian (VSheaf.stackMap (toBase 𝒢 ϖ r x)) t x (BunG.ofLevel G 𝒢.level) := sorry

/-- `LatticeSpace.genericTorsor` [constructor]: the pro-étale `G(ℚ_p)`-torsor `ℙ_η` over `S^a`,
the sheaf of trivialisations of the bundle of `P_η`. -/
abbrev genericTorsor : VSheaf p := BunG.trivTorsor x

/-- `ℙ_η → S^a` is a torsor under `underline{G(ℚ_p)}`. -/
theorem genericTorsor_isTorsor :
    (BunG.trivTorsor.action x).IsTorsor (BunG.trivTorsor.proj x) :=
  BunG.trivTorsor.isTorsor x

/-- The map `ℙ_η → Latt(P_η)`: a trivialisation `τ` of `ℙ_η` goes to the lattice `τ(𝒢(ℤ_p))`. -/
def ofTrivialisation : genericTorsor x ⟶ LatticeSpace 𝒢 ϖ r x := sorry

/-- `LatticeSpace.equivCosetBundle` [equivalence]: `Latt(P_η) ≅ ℙ_η/𝒢(ℤ_p)` over `S^a`: the map
`ℙ_η → Latt(P_η)` is a torsor under `underline{𝒢(ℤ_p)}`, over `S`. -/
theorem equivCosetBundle :
    ofTrivialisation 𝒢 ϖ r x ≫ toBase 𝒢 ϖ r x =
        BunG.trivTorsor.proj x ≫ BunG.trivLocus.incl x ∧
      ((BunG.trivTorsor.action x).restrict 𝒢.level.1.toSubgroup).IsTorsor
        (ofTrivialisation 𝒢 ϖ r x) := sorry

/-- `LatticeSpace.baseChange` [functoriality]: for `f : T → S`, the map
`Latt(P_η|_T) → Latt(P_η)`. -/
def baseChange {T : Perfd p} (f : T ⟶ S) (ϖ' : T.PseudoUnif) (x' : T.sheaf.stack ⟶ BunG G)
    (h : x' = VSheaf.stackMap ((VSheaf.ofPerfd p).map f) ≫ x) :
    LatticeSpace 𝒢 ϖ' r x' ⟶ LatticeSpace 𝒢 ϖ r x := sorry

/-- `Latt(P_η|_T) = Latt(P_η) ×_S T`, and `T^a` is the preimage of `S^a`. -/
theorem baseChange_isPullback {T : Perfd p} (f : T ⟶ S) (ϖ' : T.PseudoUnif)
    (x' : T.sheaf.stack ⟶ BunG G)
    (h : x' = VSheaf.stackMap ((VSheaf.ofPerfd p).map f) ≫ x) :
    IsPullback (baseChange 𝒢 ϖ r x f ϖ' x' h) (toBase 𝒢 ϖ' r x') (toBase 𝒢 ϖ r x)
        ((VSheaf.ofPerfd p).map f) ∧
      ∃ g : BunG.trivLocus x' ⟶ BunG.trivLocus x,
        IsPullback g (BunG.trivLocus.incl x') (BunG.trivLocus.incl x)
          ((VSheaf.ofPerfd p).map f) := sorry

/-- Base change is compatible with composition. -/
theorem baseChange_comp {T U : Perfd p} (f : T ⟶ S) (g : U ⟶ T) (ϖ' : T.PseudoUnif)
    (ϖ'' : U.PseudoUnif) (x' : T.sheaf.stack ⟶ BunG G) (x'' : U.sheaf.stack ⟶ BunG G)
    (h : x' = VSheaf.stackMap ((VSheaf.ofPerfd p).map f) ≫ x)
    (h' : x'' = VSheaf.stackMap ((VSheaf.ofPerfd p).map g) ≫ x')
    (h'' : x'' = VSheaf.stackMap ((VSheaf.ofPerfd p).map (g ≫ f)) ≫ x) :
    baseChange 𝒢 ϖ' r x' g ϖ'' x'' h' ≫ baseChange 𝒢 ϖ r x f ϖ' x' h =
      baseChange 𝒢 ϖ r x (g ≫ f) ϖ'' x'' h'' := sorry

-- The packet states `changeGroup` for a homomorphism of integral models `𝒢 → ℋ`. The interface
-- has no homomorphisms of models; the map exists, through the coset bundles, as soon as the
-- homomorphism of generic fibres maps `𝒢(ℤ_p)` into `ℋ(ℤ_p)`, and it is stated in that form.
/-- `LatticeSpace.changeGroup` [functoriality]: a homomorphism `f : G → H` with
`f(𝒢(ℤ_p)) ⊂ ℋ(ℤ_p)` induces `Latt_𝒢(P_η) → Latt_ℋ(f_* P_η)`, given on coset bundles by
`G(ℚ_p)/𝒢(ℤ_p) → H(ℚ_p)/ℋ(ℤ_p)`. -/
def changeGroup {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (ℋ : H.Model)
    (hf : ∀ g ∈ 𝒢.level.1, RedGrp.ptsMap f g ∈ ℋ.level.1) :
    LatticeSpace 𝒢 ϖ r x ⟶ LatticeSpace ℋ ϖ r (x ≫ BunG.map f) := sorry

/-- `changeGroup` is a map over `S`, induced on coset bundles by the pushout of
trivialisations. -/
theorem changeGroup_spec {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (ℋ : H.Model)
    (hf : ∀ g ∈ 𝒢.level.1, RedGrp.ptsMap f g ∈ ℋ.level.1) :
    changeGroup 𝒢 ϖ r x f ℋ hf ≫ toBase ℋ ϖ r (x ≫ BunG.map f) = toBase 𝒢 ϖ r x ∧
      ofTrivialisation 𝒢 ϖ r x ≫ changeGroup 𝒢 ϖ r x f ℋ hf =
        BunG.trivTorsor.push f x ≫ ofTrivialisation ℋ ϖ r (x ≫ BunG.map f) := sorry

/-- For two models `𝒢'`, `𝒢` of the same `G` with `𝒢'(ℤ_p) ⊂ 𝒢(ℤ_p)`: the projection
`ℙ_η/𝒢'(ℤ_p) → ℙ_η/𝒢(ℤ_p)`. -/
def changeModel (𝒢' : G.Model) (h : 𝒢'.level ≤ 𝒢.level) :
    LatticeSpace 𝒢' ϖ r x ⟶ LatticeSpace 𝒢 ϖ r x := sorry

/-- The change of model is the projection of coset bundles, over `S`. -/
theorem changeModel_spec (𝒢' : G.Model) (h : 𝒢'.level ≤ 𝒢.level) :
    changeModel 𝒢 ϖ r x 𝒢' h ≫ toBase 𝒢 ϖ r x = toBase 𝒢' ϖ r x ∧
      ofTrivialisation 𝒢' ϖ r x ≫ changeModel 𝒢 ϖ r x 𝒢' h = ofTrivialisation 𝒢 ϖ r x := sorry

-- Omitted: the description of `Latt(E_η)` by `ℤ_p`-lattices `𝕃 ⊂ 𝕃_η` in the `ℚ_p`-local system
-- of `E_η`; the interface does not attach a local system to a `GL_n`-bundle.
/-- `LatticeSpace.glN` [compatibility] (Scholze–Weinstein, Corollary 22.3.3): for `GL_n` the
admissible locus is the locus where the Newton polygon is identically `0`. -/
theorem glN (n : ℕ) (y : S.sheaf.stack ⟶ BunG (RedGrp.GLn (LocalField.Qp p) n))
    (s : Perfd.GeomPoint p) (z : S.sheaf.geomPts s) :
    z ∈ Set.range (VSheaf.ptsMap (BunG.trivLocus.incl y) s.toPerfd) ↔
      (RedGrp.GLn (LocalField.Qp p) n).newton (BunG.classAt y s z) = 0 := sorry

/-- `LatticeSpace.trivial` [example]: for the trivial torsor `P_η = G × Y_(0,r](S)` with its
standard `φ⁻¹`-structure: `S^a = S`, `ℙ_η = underline{G(ℚ_p)} × S` and
`Latt(P_η) = underline{G(ℚ_p)/𝒢(ℤ_p)} × S`. -/
theorem trivial :
    IsIso (BunG.trivLocus.incl (terminal.from S.sheaf.stack ≫ BunG.point G 1)) ∧
      (∃ e : BunG.trivTorsor (terminal.from S.sheaf.stack ≫ BunG.point G 1) ≅
          VSheaf.const p G.pts ⨯ S.sheaf,
        e.hom ≫ prod.snd = BunG.trivTorsor.proj _ ≫ BunG.trivLocus.incl _) ∧
      ∃ e : LatticeSpace 𝒢 ϖ r (terminal.from S.sheaf.stack ≫ BunG.point G 1) ≅
          (VSheaf.ofTop p).obj (G.cosets 𝒢.level) ⨯ S.sheaf,
        e.hom ≫ prod.snd = toBase 𝒢 ϖ r _ := sorry

/-- `LatticeSpace.independence` [other]: `Latt(P_η)` does not depend on `r` nor on the
pseudo-uniformizer `ϖ`. -/
theorem independence (ϖ' : S.PseudoUnif) (r' : {r : ℚ // 0 < r}) :
    ∃ e : LatticeSpace 𝒢 ϖ r x ≅ LatticeSpace 𝒢 ϖ' r' x,
      e.hom ≫ toBase 𝒢 ϖ' r' x = toBase 𝒢 ϖ r x ∧
        ofTrivialisation 𝒢 ϖ r x ≫ e.hom = ofTrivialisation 𝒢 ϖ' r' x := sorry

end LatticeSpace

-- LatticeSpace.trivial_test
-- For the trivial torsor, `Latt(P_η) ≅ underline{G(ℚ_p)/𝒢(ℤ_p)} × S`; for `𝒢 = 𝔾_m` (so
-- `𝒢(ℤ_p) = ℤ_p^×`) it is `⊔_{m ∈ ℤ} S`.
-- Omitted: the description of the points by the modules `g · 𝒪^n` and `p^m · 𝒪`.
example (𝒢 : G.Model) (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model)
    (h𝒯 : 𝒯.level.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsInt)
    {S : Perfd p} (ϖ : S.PseudoUnif) (r : {r : ℚ // 0 < r}) :
    (∃ e : LatticeSpace 𝒢 ϖ r (terminal.from S.sheaf.stack ≫ BunG.point G 1) ≅
          (VSheaf.ofTop p).obj (G.cosets 𝒢.level) ⨯ S.sheaf,
        e.hom ≫ prod.snd = LatticeSpace.toBase 𝒢 ϖ r _) ∧
      ∃ e : LatticeSpace 𝒯 ϖ r (terminal.from S.sheaf.stack ≫ BunG.point _ 1) ≅
          VSheaf.const p ℤ ⨯ S.sheaf,
        e.hom ≫ prod.snd = LatticeSpace.toBase 𝒯 ϖ r _ := by
  sorry

-- LatticeSpace.nonadmissible_test
-- For `𝔾_m` and `P_η` the line bundle of `𝒪(d)`, `d ≠ 0` (the pullback of `E_b` with
-- `v_p(b) = -d`): `Latt(P_η)` is empty.
example (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model) {S : Perfd p} (ϖ : S.PseudoUnif)
    (r : {r : ℚ // 0 < r}) (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve)
    (hb : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) ≠ 1) :
    (LatticeSpace 𝒯 ϖ r (terminal.from S.sheaf.stack ≫ BunG.point _ b)).IsEmpty := by
  sorry

-- LatticeSpace.kappa_test
-- If `ν_b = 0` and `κ(b) ≠ 0` (as for the non-trivial class of the norm-one torus of
-- `ℚ_{p²}|ℚ_p`), then for the pullback of `E_b` the locus `ν = 0` is all of `S`, but `S^a` and
-- `Latt(P_η)` are empty: the admissible locus needs `ν = 0` and `κ = 0`.
-- Omitted: the norm-one torus itself, which the interface does not have.
example (𝒢 : G.Model) {S : Perfd p} (ϖ : S.PseudoUnif) (r : {r : ℚ // 0 < r}) (b : G.ptsBreve)
    (hν : G.newton (RedGrp.BofG.mk b) = 0) (hκ : G.kottwitz (RedGrp.BofG.mk b) ≠ 0) :
    (∀ (s : Perfd.GeomPoint p) (y : S.sheaf.geomPts s),
        G.newton (BunG.classAt (terminal.from S.sheaf.stack ≫ BunG.point G b) s y) = 0) ∧
      (BunG.trivLocus (terminal.from S.sheaf.stack ≫ BunG.point G b)).IsEmpty ∧
      (LatticeSpace 𝒢 ϖ r (terminal.from S.sheaf.stack ≫ BunG.point G b)).IsEmpty := by
  sorry

-- LatticeSpace.gln_test
-- For `GL_n` with `𝒢(ℤ_p) = GL_n(ℤ_p)` and `E_η` of Newton polygon identically `0` (that is,
-- `E_η = 𝕃_η ⊗ 𝒪` for a `ℚ_p`-local system `𝕃_η`): `Latt(E_η) → S` is surjective and its fibre
-- over a geometric point is in bijection with the set of `ℤ_p`-lattices in `ℚ_p^n`.
-- Omitted: the local system `𝕃_η` and the identification of the fibre with the lattices in its
-- stalk.
example (n : ℕ) (𝒢 : (RedGrp.GLn (LocalField.Qp p) n).Model)
    (h𝒢 : 𝒢.level.1.toSubgroup.map (RedGrp.GLn.ptsEquiv (LocalField.Qp p) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p))).range)
    {S : Perfd p} (ϖ : S.PseudoUnif) (r : {r : ℚ // 0 < r})
    (x : S.sheaf.stack ⟶ BunG (RedGrp.GLn (LocalField.Qp p) n))
    (hx : ∀ (s : Perfd.GeomPoint p) (y : S.sheaf.geomPts s),
      (RedGrp.GLn (LocalField.Qp p) n).newton (BunG.classAt x s y) = 0) :
    Sheaf.IsLocallySurjective (LatticeSpace.toBase 𝒢 ϖ r x) ∧
      ∀ (s : Perfd.GeomPoint p) (y : S.sheaf.geomPts s),
        Nonempty (VSheaf.geomFibre (LatticeSpace.toBase 𝒢 ϖ r x) s y ≃
          {L : Submodule ℤ_[p] (Fin n → ℚ_[p]) //
            L.FG ∧ Submodule.span ℚ_[p] (L : Set (Fin n → ℚ_[p])) = ⊤}) := by
  sorry

-- LatticeSpace.twoModels_test
-- For `GL_2`, `𝒢` with `𝒢(ℤ_p) = GL_2(ℤ_p)`, `𝒢'` the Iwahori model, with `𝒢'(ℤ_p)` the matrices
-- that are upper triangular modulo `p`, and `P_η` trivial: `Latt_{𝒢'}(P_η) → Latt_𝒢(P_η)` is
-- finite étale of degree `p + 1`.
example (𝒢 𝒢' : (RedGrp.GLn (LocalField.Qp p) 2).Model)
    (h𝒢 : ∀ g, g ∈ 𝒢.level.1 ↔ ∃ m : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
        Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) m)
    (h𝒢' : ∀ g, g ∈ 𝒢'.level.1 ↔ ∃ m : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
          Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) m ∧
        (p : ℤ_[p]) ∣ m.1 1 0)
    (h : 𝒢'.level ≤ 𝒢.level)
    {S : Perfd p} (hS : Nonempty ((Perfd.toTop p).obj S)) (ϖ : S.PseudoUnif)
    (r : {r : ℚ // 0 < r}) :
    VStack.finiteEtaleOfDegree p (p + 1)
      (VSheaf.stackMap
        (LatticeSpace.changeModel 𝒢 ϖ r (terminal.from S.sheaf.stack ≫ BunG.point _ 1) 𝒢' h)) := by
  sorry

end LatticeExtension

/-! ### HS2/admissible-period-torsor: the universal torsor on the admissible period locus

Here `E = ℚ_p` and the orientation is that of Scholze–Weinstein: a point `x` of `Gr_{G,≤μ}` is a
modification `E_x ⇢ E_b` bounded by `μ`. The declarations on which the tower of
HS2/levels-and-tower-limit depends come first; the comparison with the tower and the unit tests of
this node follow that node. -/

section AdmissiblePeriodTorsor

/-- The admissible locus `Gr^a_{G,Spd Ĕ_μ,≤μ} ⊂ Gr_{G,Spd Ĕ_μ,≤μ}` of `b`: the open locus where
the modification `E_x` of `E_b` is trivial at every geometric point. It depends on `b`. -/
abbrev GrG.admissible (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) : VSheaf p :=
  BunG.trivLocus (BunG.beauvilleLaszlo G b μ)

/-- The open immersion `Gr^a_{≤μ} → Gr_{≤μ}`. -/
abbrev GrG.admissibleIncl (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) :
    GrG.admissible G b μ ⟶ GrG.oneLeg G μ :=
  BunG.trivLocus.incl (BunG.beauvilleLaszlo G b μ)

/-- The admissible locus `Gr^a_μ` of the open Schubert cell. -/
abbrev GrG.admissibleCell (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) : VSheaf p :=
  BunG.trivLocus (VSheaf.stackMap (GrG.cellIncl G μ) ≫ BunG.beauvilleLaszlo G b μ)

/-- `Gr^a_μ → Gr_{≤μ}`. -/
abbrev GrG.admissibleCellIncl (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) :
    GrG.admissibleCell G b μ ⟶ GrG.oneLeg G μ :=
  BunG.trivLocus.incl (VSheaf.stackMap (GrG.cellIncl G μ) ≫ BunG.beauvilleLaszlo G b μ) ≫
    GrG.cellIncl G μ

variable (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)

/-- HS2/admissible-period-torsor, `admissiblePeriodTorsor` [constructor]. The sheaf `𝕃_b` of
pairs `(x, τ)` of a point `x` of the admissible locus `Gr^a_{≤μ}` and a trivialisation
`τ : E_1 ≅ E_x` of the modified bundle. It is the torsor `ℙ_η` of HS2/one-leg-period-map. -/
def admissiblePeriodTorsor : VSheaf p := BunG.trivTorsor (BunG.beauvilleLaszlo G b μ)

namespace admissiblePeriodTorsor

/-- The projection `𝕃_b → Gr^a_{≤μ}`. -/
def proj : admissiblePeriodTorsor G b μ ⟶ GrG.admissible G b μ :=
  BunG.trivTorsor.proj (BunG.beauvilleLaszlo G b μ)

/-- `G(ℚ_p) = Aut(E_1)` acts on `𝕃_b` by `g · τ = τ ∘ g⁻¹`: the left action attached to the right
action `τ · g = τ ∘ g` for which `𝕃_b` is a torsor. It is the action of HS2/levels-and-tower-limit
(d) and induces `𝕃_b/K ≅ 𝕃_b/gKg⁻¹`; right translation by `g` induces `𝕃_b/K ≅ 𝕃_b/g⁻¹Kg`. -/
def groupAction :
    VSheaf.Action (VSheaf.constGrp p G.pts) (admissiblePeriodTorsor G b μ) :=
  BunG.trivTorsor.action (BunG.beauvilleLaszlo G b μ)

/-- `𝕃_b → Gr^a_{≤μ}` is a torsor under `underline{G(ℚ_p)}`, hence a pro-étale `G(ℚ_p)`-torsor. -/
theorem isTorsor : (groupAction G b μ).IsTorsor (proj G b μ) :=
  BunG.trivTorsor.isTorsor (BunG.beauvilleLaszlo G b μ)

/-- The structure map `𝕃_b → Gr^a_{≤μ} → Gr_{≤μ}`. -/
def toGr : admissiblePeriodTorsor G b μ ⟶ GrG.oneLeg G μ :=
  proj G b μ ≫ GrG.admissibleIncl G b μ

/-- The structure map `𝕃_b → Spd Ĕ_μ`. -/
def toBase : admissiblePeriodTorsor G b μ ⟶ (G.reflexField μ).spdBreve :=
  toGr G b μ ≫ GrG.oneLegBase G μ

/-- The action of `G(ℚ_p)` on `𝕃_b` is an action over `Gr_{≤μ}`. -/
theorem groupAction_toGr : (groupAction G b μ).Invariant (toGr G b μ) :=
  (BunG.trivTorsor.action_invariant (BunG.beauvilleLaszlo G b μ)).comp _

/-- The action of `G(ℚ_p)` on `𝕃_b` is an action over `Spd Ĕ_μ`. -/
theorem groupAction_toBase : (groupAction G b μ).Invariant (toBase G b μ) :=
  (groupAction_toGr G b μ).comp _

/-- `admissiblePeriodTorsor.lift` [universal-property]: for `x : S → Gr_{≤μ}` the sections of
`x^* 𝕃_b` over `S` are the isomorphisms `E_1 ≅ E_x` on `X_S`; that is,
`𝕃_b = Gr_{≤μ} ×_{Bun_G} ∗`, the 2-fibre product of the bundle `x ↦ E_x` and the point `E_1`. -/
theorem lift :
    VStack.IsCartesian (VSheaf.stackMap (toGr G b μ))
      (terminal.from (admissiblePeriodTorsor G b μ).stack) (BunG.beauvilleLaszlo G b μ)
      (BunG.point G 1) :=
  BunG.trivTorsor.isCartesian (BunG.beauvilleLaszlo G b μ)

/-- The action of `J_b(ℚ_p) ⊂ G(ℚ̆_p) ⊂ G(B⁺_dR)` on the Grassmannian, by left multiplication on
lattices. -/
def periodAction :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b)) (GrG.oneLeg G μ) := sorry

/-- `J_b(ℚ_p) ⊂ Aut(E_b)`, which is the whole of `Aut(E_b)` when `b` is basic, acts on `𝕃_b`,
through its action on the modifications of `E_b`. -/
def framingAction :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b)) (admissiblePeriodTorsor G b μ) :=
  sorry

/-- `admissiblePeriodTorsor.actions` [structure]: `G(ℚ_p)` acts on `𝕃_b` over `Gr^a_{≤μ}`;
`J_b(ℚ_p)` acts on `𝕃_b` covering its action on `Gr_{≤μ}`, which is an action over `Spd Ĕ_μ`; the
two actions commute. -/
theorem actions :
    (groupAction G b μ).Invariant (proj G b μ) ∧
      (framingAction G b μ).Commute (groupAction G b μ) ∧
      (framingAction G b μ).Equivariant (periodAction G b μ) (toGr G b μ) ∧
      (periodAction G b μ).Invariant (GrG.oneLegBase G μ) := sorry

-- Omitted: the value of the local system at a point `x`, the local system of global sections of
-- `E_x(V)`; the interface does not attach a local system to a vector bundle on the curve.
/-- `admissiblePeriodTorsor.localSystem` [functoriality]: `V ↦ 𝕃_b ×^{G(ℚ_p)} V`, from
`Rep_{ℚ_p}(G)` to pro-étale `ℚ_p`-local systems on `Gr^a_{≤μ}`. -/
def localSystem : G.Rep ⥤ VSheaf.LocSys (LocalField.Qp p) (GrG.admissible G b μ) := sorry

/-- `V ↦ 𝕃_b ×^{G(ℚ_p)} V` is a tensor functor. -/
instance : (localSystem G b μ).Monoidal := sorry

/-- `V ↦ 𝕃_b ×^{G(ℚ_p)} V` is exact. -/
instance : PreservesFiniteLimits (localSystem G b μ) := sorry

instance : PreservesFiniteColimits (localSystem G b μ) := sorry

/-- `admissiblePeriodTorsor.pushforward` [functoriality]: for `f : G → H`, extension of the
structure group `𝕃_b → 𝕃_{f(b)}`, `(x, τ) ↦ (f(x), f_* τ)`. -/
def pushforward {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (bH : H.ptsBreve) (μH : H.Cochar)
    (hb : bH = RedGrp.ptsBreveMap f b) (hμ : RedGrp.Cochar.map f μ ≤ μH) :
    admissiblePeriodTorsor G b μ ⟶ admissiblePeriodTorsor H bH μH := sorry

/-- The map `𝕃_b → 𝕃_{f(b)}` covers `Gr_{G,≤μ} → Gr_{H,≤μ_H}` and is equivariant along
`G(ℚ_p) → H(ℚ_p)`; so the `H(ℚ_p)`-torsor `𝕃_b ×^{G(ℚ_p)} H(ℚ_p)` is the pullback of
`𝕃_{f(b)}`. -/
theorem pushforward_spec {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (bH : H.ptsBreve)
    (μH : H.Cochar) (hb : bH = RedGrp.ptsBreveMap f b) (hμ : RedGrp.Cochar.map f μ ≤ μH) :
    pushforward G b μ f bH μH hb hμ ≫ toGr H bH μH = toGr G b μ ≫ GrG.oneLegMap f μ μH hμ ∧
      VSheaf.Action.EquivariantAlong (VSheaf.constGrpMap p (RedGrp.ptsMap f)) (groupAction G b μ)
        (groupAction H bH μH) (pushforward G b μ f bH μH hb hμ) := sorry

/-- Extension of the structure group is compatible with composition of homomorphisms. -/
theorem pushforward_comp {H K : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (g : H ⟶ K)
    (bH : H.ptsBreve) (μH : H.Cochar) (bK : K.ptsBreve) (μK : K.Cochar)
    (hb : bH = RedGrp.ptsBreveMap f b) (hμ : RedGrp.Cochar.map f μ ≤ μH)
    (hb' : bK = RedGrp.ptsBreveMap g bH) (hμ' : RedGrp.Cochar.map g μH ≤ μK)
    (hb'' : bK = RedGrp.ptsBreveMap (f ≫ g) b) (hμ'' : RedGrp.Cochar.map (f ≫ g) μ ≤ μK) :
    pushforward G b μ f bH μH hb hμ ≫ pushforward H bH μH g bK μK hb' hμ' =
      pushforward G b μ (f ≫ g) bK μK hb'' hμ'' := sorry

-- Omitted: the Galois group of `L` and the representation `ρ_x` as a homomorphism; the statement
-- is made for the torsor of `ρ_x`. Omitted: points outside the open cell, which have a type
-- `μ' ≠ μ`; the Białynicki-Birula map of the interface is that of the cell.
/-- `admissiblePeriodTorsor.classical_point` [characterisation]: for a finite extension `L` of
`Ĕ_μ` and an admissible point `x` of the cell over `Spd L`, with image `y = BB(x) ∈ Fl_{G,μ}(L)`:
`y` is weakly admissible, and `x^* 𝕃_b` is the torsor of the crystalline representation with
filtered isocrystal with `G`-structure `(bσ, Fil_y)`. -/
theorem classical_point (L : (G.reflexField μ).BreveExt)
    (x : L.spd.left ⟶ GrG.admissibleCell G b μ)
    (hx : x ≫ GrG.admissibleCellIncl G b μ ≫ GrG.oneLegBase G μ = L.spd.hom)
    (y : L.spa ⟶ RigSp.flag G μ)
    (hy : ((RigSp.diamond (G.reflexField μ)).map y).left =
      L.diamondSpa.hom.left ≫ x ≫ BunG.trivLocus.incl _ ≫ (GrG.bialynickiBirula G μ).left) :
    y ∈ RigSp.flag.weaklyAdmissible G b μ L ∧
      ∃ t : (RigSp.flag.crystallineTorsor G b μ L y).left ⟶ admissiblePeriodTorsor G b μ,
        IsPullback t (RigSp.flag.crystallineTorsor G b μ L y).hom (toGr G b μ)
            (x ≫ GrG.admissibleCellIncl G b μ) ∧
          (RigSp.flag.crystallineTorsor.action G b μ L y).Equivariant (groupAction G b μ) t :=
  sorry

/-- `admissiblePeriodTorsor.torus` [example]: for `𝔾_m`, `μ = id` and `v_p(b) = -1`: `𝕃_b` is
the torsor of bases of `ℚ_p(1)` over `Spd ℚ̆_p`, that is, of the non-zero sections of `𝒪(1)`
vanishing at the leg: `𝕃_b = (BC(𝒪(1)) ∖ {0}) ×_{Div¹} Spd ℚ̆_p`, a trivialisation `τ` going to the
section `τ(1)`. -/
theorem torus (c : (RedGrp.Gm (LocalField.Qp p)).ptsBreve)
    (hc : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ c) = Multiplicative.ofAdd (-1)) :
    ∃ t : admissiblePeriodTorsor (RedGrp.Gm (LocalField.Qp p)) c (RedGrp.Gm.cochar _ 1) ⟶
        Div1.cover (LocalField.Qp p),
      IsPullback t
          (toBase _ c (RedGrp.Gm.cochar _ 1) ≫
            (RedGrp.reflexExt _ (RedGrp.Gm.cochar _ 1)).spdBreveMap)
          (Div1.coverProj (LocalField.Qp p)) (Div1.proj (LocalField.Qp p)) ∧
        ∀ (S : Perfd p) (g : (VSheaf.constGrp p (RedGrp.Gm (LocalField.Qp p)).pts).obj (op S))
          (z : (admissiblePeriodTorsor _ c (RedGrp.Gm.cochar _ 1)).pts S),
          VSheaf.ptsMap t S ((groupAction _ c (RedGrp.Gm.cochar _ 1)).smul S g z) =
            (Div1.coverAction (LocalField.Qp p)).smul S g⁻¹ (VSheaf.ptsMap t S z) := sorry

end admissiblePeriodTorsor

end AdmissiblePeriodTorsor

/-! ### HS2/local-shtuka-moduli: the moduli space of mixed-characteristic local shtukas

Here `E = ℚ_p`. -/

section LocalShtukaModuli

/-- HS2/general-local-field (2), HS2/multi-leg-period-and-representability (b): the `G`-bundle `E`
on `X_S` of a point `(P_η, φ_P, ι_r)` of the twisted Grassmannian, the descent of `P_η` near
`π = 0`, where `P_η` is `φ⁻¹`-equivariant. -/
def GeneralShtukaTower.bundle (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) : (TwistedPeriodData G b μ).stack ⟶ BunG G :=
  TwistedPeriodData.frobenius G b μ ≫ FrobTorsorY.nearZero G μ

variable {G : RedGrp (LocalField.Qp p)}

/-- HS2/local-shtuka-moduli, `ShtukaDatum` [data]. The v-sheaf `Sht_{𝒢,b,μ•}` of the local shtuka
datum `(𝒢, b, μ•)`: `𝒢` a smooth affine model of `G` over `ℤ_p` with connected special fibre,
`b ∈ G(ℚ̆_p)` arbitrary, `μ•` arbitrary conjugacy classes of cocharacters. Over an affinoid `S` its
points are the isomorphism classes of quadruples `(P, (S_i♯), φ_P, ι)`: a `𝒢`-torsor `P` on
`S ×̇ Spa ℤ_p`; untilts `S_i♯` over the `F̆_i`; an isomorphism `φ_P : Frob_S^* P ≅ P` over the
complement of `⋃ S_i♯`, meromorphic along `⋃ S_i♯` and such that the position of `P` relative
to `Frob_S^* P` (the type of `φ_P⁻¹ : P ⇢ Frob_S^* P`, as in HS0/bounded-hecke-substacks) at `S_i♯`
is bounded by `Σ_{j : S_j♯ = S_i♯} μ_j` at all geometric rank-one points; and the germ at infinity
`ι` of isomorphisms `P|_{Y_[r,∞)(S)} ≅ G × Y_[r,∞)(S)` carrying `φ_P` to `b × Frob_S`. The framing
`ι` is part of the data: without it the functor is a stack and not a sheaf. The opposite order
in the bound would define `Sht_{𝒢,b,μ•⁻¹}`. -/
def ShtukaDatum (𝒢 : G.Model) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) :
    VSheaf p := sorry

namespace ShtukaDatum

variable (𝒢 : G.Model) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)

/-- `ShtukaDatum.legs` [projection]: the structure map
`Sht_{𝒢,b,μ•} → Spd F̆_1 ×_{Spd k} ⋯ ×_{Spd k} Spd F̆_m`, a datum going to its untilts. -/
def legs : ShtukaDatum 𝒢 b μ ⟶ G.legBase μ := sorry

/-- `ShtukaDatum.genericPart` [compatibility]: restriction to `S ×̇ Spa ℚ_p`,
`(P, (S_i♯), φ_P, ι) ↦ (P|_{S ×̇ Spa ℚ_p}, (S_i♯), φ_P, ι)`, the period map `π_GM` to the twisted
Grassmannian. -/
def genericPart : ShtukaDatum 𝒢 b μ ⟶ TwistedPeriodData G b μ := sorry

/-- The period map is a map over the leg base. -/
theorem genericPart_legs : genericPart 𝒢 b μ ≫ TwistedPeriodData.legs G b μ = legs 𝒢 b μ := sorry

-- Omitted: `φ_P` over the locus `p = 0`; and that for `𝒢 = GL_n`, `μ = (1^d, 0^{n-d})` with
-- `d ≥ 1`, `φ_P` has a simple pole along `S♯` while `φ_P⁻¹` extends to an injection
-- `P ↪ Frob_S^* P`. The interface has the pairs `(P, φ)` over `S ×̇ Spa ℚ_p` only, and no torsors
-- over `S ×̇ Spa ℤ_p`.
/-- `ShtukaDatum.frobenius` [projection]: the isomorphism `φ_P : Frob_S^* P ≅ P` over the
complement of the legs, on the generic part: the projection
`(P, (S_i♯), φ_P, ι) ↦ (P|_{S ×̇ Spa ℚ_p}, φ_P)` to the stack of `G`-torsors on `Y_S` with a
Frobenius that is meromorphic along the legs. -/
def frobenius : (ShtukaDatum 𝒢 b μ).stack ⟶ FrobTorsorY G μ :=
  VSheaf.stackMap (genericPart 𝒢 b μ) ≫ TwistedPeriodData.frobenius G b μ

/-- `φ_P` need not extend over the legs: at a geometric rank-one point it extends to an
isomorphism across `S_i♯` exactly when the position of `P` relative to `Frob_S^* P` there is
trivial. For the bound `0` at every leg it extends across the legs, and a shtuka is a shtuka with
no legs together with the untilts, `Sht_{𝒢,b,(0,…,0)} ≅ Sht_{𝒢,b,∅} × ∏_i Spd ℚ̆_p`. -/
theorem frobenius_zero :
    ∃ e : ShtukaDatum 𝒢 b (fun _ : I => (0 : G.Cochar)) ≅
        ShtukaDatum 𝒢 b G.noLegs ⨯ G.legBase (fun _ : I => (0 : G.Cochar)),
      e.hom ≫ prod.snd = legs 𝒢 b (fun _ : I => (0 : G.Cochar)) := sorry

-- Omitted: the criterion of the packet, by an isomorphism of `𝒢`-torsors compatible with `φ_P`
-- and with the framings (which is then unique); the interfaces have no torsors over
-- `S ×̇ Spa ℤ_p`. Stated: an extensionality principle in terms of the period map, which follows
-- from the period map being étale and separated.
/-- `ShtukaDatum.ext` [extensionality], in the form available with the interfaces: two `S`-points
with the same image under the period map (the same untilts and isomorphic generic parts) that
agree at every geometric point of `S` are equal. -/
theorem ext (S : Perfd p) (x y : (ShtukaDatum 𝒢 b μ).pts S)
    (h : VSheaf.ptsMap (genericPart 𝒢 b μ) S x = VSheaf.ptsMap (genericPart 𝒢 b μ) S y)
    (hg : ∀ (s : Perfd.GeomPoint p) (f : s.toPerfd ⟶ S),
      (ShtukaDatum 𝒢 b μ).obj.map f.op x = (ShtukaDatum 𝒢 b μ).obj.map f.op y) :
    x = y := sorry

/-- `ShtukaDatum.isVSheaf` [structure]: `Sht_{𝒢,b,μ•}` is a v-sheaf on `Perf_k`
(Scholze–Weinstein, after Theorem 23.1.4). The sheaf condition is part of the type `VSheaf p` of
the declaration `ShtukaDatum`, so this is its second component. That `Sht_{𝒢,b,μ•}` is a locally
spatial diamond is not part of the definition: it is proved through the period map, and is a
clause of `multiLegPeriodAndRepresentability`. -/
theorem isVSheaf : Presheaf.IsSheaf (Perfd.vTopology p) (ShtukaDatum 𝒢 b μ).obj :=
  (ShtukaDatum 𝒢 b μ).property

-- Omitted: the extension of `ι_r` to a `φ`-equivariant isomorphism `P ≅ G × Y` over
-- `Y_(0,∞)(S) ∖ ⋃_{i, n ≥ 0} φ^{-n}(S_i♯)`, meromorphic along these divisors; the interfaces have
-- no torsors over open subsets of `Y_(0,∞)(S)`. Stated: its two consequences for the bundles on
-- the curve.
/-- `ShtukaDatum.framing_extends` [characterisation], through the bundles on `X_S`: the framing
identifies the bundle to which `(P, φ_P)` descends near `[ϖ] = 0` with `E_b`; and with no legs the
framing extends to an isomorphism over all of `Y_(0,∞)(S)`, so that the bundle to which
`(P, φ_P)` descends near `p = 0` is the pullback of `E_b` as well. -/
theorem framing_extends :
    frobenius 𝒢 b μ ≫ FrobTorsorY.nearInfinity G μ = terminal.from _ ≫ BunG.point G b ∧
      VSheaf.stackMap (genericPart 𝒢 b G.noLegs) ≫ GeneralShtukaTower.bundle G b G.noLegs =
        terminal.from _ ≫ BunG.point G b := sorry

/-- `ShtukaDatum.changeFrame` [functoriality]: for `y ∈ G(ℚ̆_p)` and `b' = y b σ(y)⁻¹`, the
isomorphism `c_y : Sht_{𝒢,b,μ•} ≅ Sht_{𝒢,b',μ•}`,
`(P, (S_i♯), φ_P, ι) ↦ (P, (S_i♯), φ_P, (y × id) ∘ ι)`.
Hence the isomorphism class of `Sht_{𝒢,b,μ•}` depends only on the class of `b` in `B(G)`. -/
def changeFrame (y b' : G.ptsBreve) (h : G.sigmaConj y b = b') :
    ShtukaDatum 𝒢 b μ ≅ ShtukaDatum 𝒢 b' μ := sorry

/-- `c_1 = id`. -/
theorem changeFrame_one : changeFrame 𝒢 b μ 1 b (G.sigmaConj_one b) = Iso.refl _ := sorry

/-- `c_z ∘ c_y = c_{zy}`. -/
theorem changeFrame_mul (y z b' b'' : G.ptsBreve) (h : G.sigmaConj y b = b')
    (h' : G.sigmaConj z b' = b'') :
    changeFrame 𝒢 b μ y b' h ≪≫ changeFrame 𝒢 b' μ z b'' h' =
      changeFrame 𝒢 b μ (z * y) b'' (by rw [G.sigmaConj_mul, h, h']) := sorry

/-- `c_y` is an isomorphism over the leg base. -/
theorem changeFrame_legs (y b' : G.ptsBreve) (h : G.sigmaConj y b = b') :
    (changeFrame 𝒢 b μ y b' h).hom ≫ legs 𝒢 b' μ = legs 𝒢 b μ := sorry

/-- The period map commutes with `c_y`. -/
theorem changeFrame_genericPart (y : G.ptsBreve) :
    (changeFrame 𝒢 b μ y (G.sigmaConj y b) rfl).hom ≫ genericPart 𝒢 (G.sigmaConj y b) μ =
      genericPart 𝒢 b μ ≫ (TwistedPeriodData.sigma_conj G b μ y).hom := sorry

/-- `ShtukaDatum.sigmaCentralizerAction` [structure]: `J_b(ℚ_p) = {y : y b σ(y)⁻¹ = b}` acts on
`Sht_{𝒢,b,μ•}`, continuously. -/
def sigmaCentralizerAction :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b)) (ShtukaDatum 𝒢 b μ) := sorry

/-- The action of `J_b(ℚ_p)` is an action over the leg base, and `y` acts by `c_y`. -/
theorem sigmaCentralizerAction_spec :
    (sigmaCentralizerAction 𝒢 b μ).Invariant (legs 𝒢 b μ) ∧
      ∀ (S : Perfd p) (y : G.sigmaCentralizer b) (x : (ShtukaDatum 𝒢 b μ).pts S),
        (sigmaCentralizerAction 𝒢 b μ).smulConst S y x =
          VSheaf.ptsMap (changeFrame 𝒢 b μ y b (RedGrp.sigmaConj_eq_of_mem y.2)).hom S x := sorry

-- Omitted: the general case, in which the locus `S_i♯ = S_j♯` is `Spd(F̆_i ⊗_L F̆_j)`, a finite
-- disjoint union of spaces `Spd F'` with `F'` a composite of `F̆_i` and of a conjugate of `F̆_j`:
-- on the component of the composite inside the fixed algebraic closure the common leg is bounded
-- by `μ_i + μ_j`, and on the component of another conjugate `μ_j` is replaced by the corresponding
-- Galois conjugate class. The interface has no composites of reflex fields. Stated: the case
-- where every `F̆_i` is `ℚ̆_p`, in which the locus has one component.
/-- `ShtukaDatum.diagonal` [relation]: over the locus where the legs with the same image under
`a : I → J` coincide, a datum with legs indexed by `I` is a datum with legs indexed by `J`, the
leg `j` being bounded by the sum of the `μ_i` with `a(i) = j`. -/
theorem diagonal {J : Type} [Finite J] (a : I → J) (ha : Function.Surjective a)
    (ν : J → G.Cochar) (hν : ∀ j, ν j = ∑ᶠ i : {i : I // a i = j}, μ i.1)
    [∀ i, IsIso (G.reflexExt (μ i)).spdBreveMap] :
    ∃ t : ShtukaDatum 𝒢 b ν ⟶ ShtukaDatum 𝒢 b μ,
      IsPullback t (legs 𝒢 b ν) (legs 𝒢 b μ) (G.legDiag a μ ν) := sorry

/-- `ShtukaDatum.noLegs` [example] (Scholze–Weinstein, Proposition 23.2.1): with no legs,
`Sht_{𝒢,b,∅}` is empty unless `[b] = 1` in `B(G)`, and
`Sht_{𝒢,1,∅} ≅ underline{G(ℚ_p)/𝒢(ℤ_p)} × Spd k`. -/
theorem noLegs :
    (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk 1 → (ShtukaDatum 𝒢 b G.noLegs).IsEmpty) ∧
      Nonempty (ShtukaDatum 𝒢 1 G.noLegs ≅ (VSheaf.ofTop p).obj (G.cosets 𝒢.level)) := sorry

/-- HS2/one-leg-period-map (a): for one leg, the period map
`π_GM : Sht_{𝒢,b,μ} → Gr_{G,Spd F̆,≤μ}`, which sends `(S♯, E, α, ℙ)` to the lattice over
`B⁺_dR(R♯)` that `α` defines. -/
def period (μ : G.Cochar) : ShtukaDatum 𝒢 b (RedGrp.oneLeg μ) ⟶ GrG.oneLeg G μ := sorry

/-- For one leg the period map is a map over `Spd F̆`. -/
theorem period_legs (μ : G.Cochar) :
    period 𝒢 b μ ≫ GrG.schubertLegs G (RedGrp.oneLeg μ) = legs 𝒢 b (RedGrp.oneLeg μ) := sorry

end ShtukaDatum

-- ShtukaDatum.noLegs_trivial_test
-- With no legs and `b = 1`: `Sht_{𝒢,1,∅} ≅ underline{G(ℚ_p)/𝒢(ℤ_p)} × Spd k`, the constant sheaf on
-- a discrete set; for `𝒢 = 𝔾_m` it is `underline{ℚ_p^×/ℤ_p^×} = underline ℤ`.
-- Omitted: the identification of `GL_n(ℚ_p)/GL_n(ℤ_p)` with the set of lattices in `ℚ_p^n`, a
-- statement of group theory about no object of the packet.
example (𝒢 : G.Model) (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model)
    (h𝒯 : 𝒯.level.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsInt) :
    Nonempty (ShtukaDatum 𝒢 1 G.noLegs ≅ (VSheaf.ofTop p).obj (G.cosets 𝒢.level)) ∧
      Nonempty (ShtukaDatum 𝒯 1 (RedGrp.noLegs _) ≅ VSheaf.const p ℤ) := by
  sorry

-- ShtukaDatum.noLegs_nontrivial_test
-- With no legs, `𝒢 = 𝔾_m` and `b = p` (`v_p(b) = 1`): `Sht_{𝔾_m,p,∅} = ∅`.
example (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model) (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve)
    (hb : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd 1) :
    (ShtukaDatum 𝒯 b (RedGrp.noLegs _)).IsEmpty := by
  sorry

-- ShtukaDatum.gm_oneLeg_test
-- For `𝒢 = 𝔾_m` and one leg with `μ(z) = z^d`: `Gr_{𝔾_m,Spd ℚ̆_p,≤μ} = Spd ℚ̆_p`; `Sht_{𝔾_m,b,μ}`
-- is empty unless `v_p(b) = -d`; if `v_p(b) = -d` the period map is surjective and each of its
-- geometric fibres is `ℚ_p^×/ℤ_p^× ≅ ℤ`. For `d = 1`: non-empty for `v_p(b) = -1`, empty for
-- `v_p(b) = 1`.
example (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model)
    (h𝒯 : 𝒯.level.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsInt)
    (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve) (d : ℤ) :
    IsIso (GrG.oneLegBase _ (RedGrp.Gm.cochar (LocalField.Qp p) d)) ∧
      ((LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) ≠ Multiplicative.ofAdd (-d) →
        (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ d))).IsEmpty) ∧
      ((LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd (-d) →
        Sheaf.IsLocallySurjective (ShtukaDatum.period 𝒯 b (RedGrp.Gm.cochar _ d)) ∧
          ¬ (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ d))).IsEmpty ∧
          ∀ (s : Perfd.GeomPoint p)
            (y : (GrG.oneLeg _ (RedGrp.Gm.cochar (LocalField.Qp p) d)).geomPts s),
            Nonempty (VSheaf.geomFibre (ShtukaDatum.period 𝒯 b (RedGrp.Gm.cochar _ d)) s y ≃ ℤ)) ∧
      ((LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd 1 →
        (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ 1))).IsEmpty) := by
  sorry

-- ShtukaDatum.boundDirection_test
-- For `𝒢 = 𝔾_m`, one leg and `μ(z) = z`: `Sht_{𝔾_m,b,μ}` is not empty for `v_p(b) = -1`, the case
-- `b = p⁻¹`. The functor defined with the bound in the other direction is `Sht_{𝔾_m,b,μ⁻¹}`, which
-- is empty for `v_p(b) = -1` and not empty for `v_p(b) = 1`, the case `b = p`.
-- Omitted: for `b = p⁻¹` the framing identifies `P` over `Y_(0,∞)(S)` with the ideal sheaf of the
-- divisor `⋃_{n ≥ 0} φ^{-n}(S♯)`, with `φ_P` induced by `p⁻¹ · Frob_S`, so that `φ_P⁻¹` is an
-- inclusion `P ↪ Frob_S^* P` with cokernel `𝒪_{S♯}` and `φ_P` has a simple pole along `S♯`; the
-- interfaces have no line bundles on `Y_(0,∞)(S)`.
example (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model) (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve) :
    ((LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd (-1) →
        ¬ (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ 1))).IsEmpty ∧
          (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ (-1)))).IsEmpty) ∧
      ((LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd 1 →
        ¬ (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ (-1)))).IsEmpty ∧
          (ShtukaDatum 𝒯 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ 1))).IsEmpty) := by
  sorry

-- ShtukaDatum.lubinTate_test
-- For `𝒢 = GL_2` (`𝒢(ℤ_p) = GL_2(ℤ_p)`), `μ = (1,0)` and `b` basic with `κ(b) = -1`:
-- `Sht_{GL_2,b,μ}` is isomorphic over `Spd ℚ̆_p` to the diamond of a disjoint union indexed by `ℤ`
-- of open unit discs (the generic fibre of the Rapoport–Zink space of the formal group of height
-- 2);
-- its period map is surjective with geometric fibres `GL_2(ℚ_p)/GL_2(ℤ_p)`.
-- Omitted: the identification of the target `Gr_{GL_2,≤μ}` with `(ℙ¹)^♦`; the interface has no
-- projective space. The identification of the tower with a Rapoport–Zink tower is
-- `classicalComparison` (HS3).
example (𝒢 : (RedGrp.GLn (LocalField.Qp p) 2).Model)
    (h𝒢 : 𝒢.level.1.toSubgroup.map (RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p))).range)
    (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![1, 0])
    (b : (RedGrp.GLn (LocalField.Qp p) 2).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn (LocalField.Qp p) 2).basic)
    (hκ : RedGrp.BofG.mk b ∈
      (RedGrp.GLn (LocalField.Qp p) 2).BGmu (RedGrp.GLn.cochar _ 2 v).dual) :
    Nonempty
        (Over.mk (ShtukaDatum.legs 𝒢 b (RedGrp.oneLeg (RedGrp.GLn.cochar _ 2 v)) ≫
            RedGrp.legOne _ (RedGrp.GLn.cochar _ 2 v)) ≅
          (RigSp.diamond _).obj (∐ fun _ : ℤ => RigSp.openBall _ 1)) ∧
      Sheaf.IsLocallySurjective (ShtukaDatum.period 𝒢 b (RedGrp.GLn.cochar _ 2 v)) ∧
      ∀ (s : Perfd.GeomPoint p)
        (y : (GrG.oneLeg _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)).geomPts s),
        Nonempty (VSheaf.geomFibre (ShtukaDatum.period 𝒢 b (RedGrp.GLn.cochar _ 2 v)) s y ≃
          (RedGrp.GLn (LocalField.Qp p) 2).pts ⧸ 𝒢.level.1.toSubgroup) := by
  sorry

-- ShtukaDatum.coincident_legs_test
-- For `𝒢 = 𝔾_m`, two legs with `μ_1(z) = z`, `μ_2(z) = z⁻¹` and `b = 1`: the restriction of
-- `Sht_{𝔾_m,1,(μ_1,μ_2)}` to the diagonal `Spd ℚ̆_p → Spd ℚ̆_p ×_{Spd k} Spd ℚ̆_p` is
-- `underline{ℚ_p^×/ℤ_p^×} × Spd ℚ̆_p`: the bound at the coincident leg is `μ_1 + μ_2 = 0`.
example (𝒯 : (RedGrp.Gm (LocalField.Qp p)).Model)
    (h𝒯 : 𝒯.level.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsInt)
    (μ : Fin 2 → (RedGrp.Gm (LocalField.Qp p)).Cochar) (h0 : μ 0 = RedGrp.Gm.cochar _ 1)
    (h1 : μ 1 = RedGrp.Gm.cochar _ (-1))
    [∀ i, IsIso (RedGrp.reflexExt _ (μ i)).spdBreveMap] :
    ∃ e : pullback (ShtukaDatum.legs 𝒯 1 μ)
          (RedGrp.legDiag _ (fun _ : Fin 2 => ()) μ (RedGrp.oneLeg 0)) ≅
        VSheaf.const p ℤ ⨯
          RedGrp.legBase _ (RedGrp.oneLeg (0 : (RedGrp.Gm (LocalField.Qp p)).Cochar)),
      e.hom ≫ prod.snd = pullback.snd _ _ := by
  sorry

-- ShtukaDatum.nonminuscule_test
-- For `𝒢 = GL_2`, `μ = (2,0)` and `b = p⁻¹ · 1_2`: `Sht_{GL_2,b,μ}` is non-empty, and the fibre of
-- its period map over each geometric point of the closed stratum (the complement of the open cell
-- `Gr_{(2,0)}`, which is the point `Gr_{(1,1)}`) is `GL_2(ℚ_p)/GL_2(ℤ_p)`. The bound `(2,0)` is
-- allowed although it is not minuscule, and the open cell is not all of the target.
-- Omitted: that the target is the union of the 2-dimensional cell and the point `Gr_{(1,1)}`, and
-- that it is not the diamond of a flag variety of `GL_2`; dimensions of diamonds are not in the
-- interfaces.
example (𝒢 : (RedGrp.GLn (LocalField.Qp p) 2).Model)
    (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![2, 0])
    (b : (RedGrp.GLn (LocalField.Qp p) 2).ptsBreve) (u : (LocalField.Qp p).Breveˣ)
    (hu : (LocalField.Qp p).valBreve u = Multiplicative.ofAdd (-1))
    (hb : (RedGrp.GLn.ptsBreveEquiv (LocalField.Qp p) 2 b).1 =
      Matrix.scalar (Fin 2) (u : (LocalField.Qp p).Breve)) :
    ¬ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v).IsMinuscule ∧
      ¬ IsIso (GrG.cellIncl _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)) ∧
      ¬ (ShtukaDatum 𝒢 b (RedGrp.oneLeg (RedGrp.GLn.cochar _ 2 v))).IsEmpty ∧
      ∀ (s : Perfd.GeomPoint p)
        (y : (GrG.oneLeg _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)).geomPts s),
        y ∉ Set.range (VSheaf.ptsMap (GrG.cellIncl _ (RedGrp.GLn.cochar _ 2 v)) s.toPerfd) →
          Nonempty (VSheaf.geomFibre (ShtukaDatum.period 𝒢 b (RedGrp.GLn.cochar _ 2 v)) s y ≃
            (RedGrp.GLn (LocalField.Qp p) 2).pts ⧸ 𝒢.level.1.toSubgroup) := by
  sorry

end LocalShtukaModuli

/-! ### HS2/levels-and-tower-limit: the tower `(Sht_K)_K` and its limit `Sht_∞`

Here `E = ℚ_p` and there is one leg. The levels are the compact open subgroups of `G(ℚ_p)`. -/

section LevelTowerSection

variable (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)

namespace LevelTower

/-- HS2/levels-and-tower-limit, `LevelTower.level` [constructor]. For a compact open subgroup
`K ⊂ G(ℚ_p)`: `Sht_{G,b,μ,K} = ℙ_η/K`, the sheaf of `K`-lattices in the pro-étale `G(ℚ_p)`-torsor
`ℙ_η = 𝕃_b` over the admissible locus; an `S`-point is a pro-étale `K`-torsor `ℙ` with an
identification `ℙ ×^K G(ℚ_p) = ℙ_η|_S`. -/
def level (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar) (K : G.Level) :
    VSheaf p := sorry

/-- The quotient map `Sht_{G,b,μ,∞} = ℙ_η → ℙ_η/K = Sht_{G,b,μ,K}`. -/
def toLevel (K : G.Level) : admissiblePeriodTorsor G b μ ⟶ level G b μ K := sorry

/-- `Sht_{G,b,μ,∞} → Sht_{G,b,μ,K}` is a torsor under `underline K`, so
`Sht_{G,b,μ,K} = Sht_{G,b,μ,∞}/K`. -/
theorem toLevel_isTorsor (K : G.Level) :
    ((admissiblePeriodTorsor.groupAction G b μ).restrict K.1.toSubgroup).IsTorsor
      (toLevel G b μ K) := sorry

/-- `LevelTower.period` [projection]: the period map `π_K : Sht_{G,b,μ,K} → Gr_{G,Spd F̆,≤μ}`. -/
def period (K : G.Level) : level G b μ K ⟶ GrG.oneLeg G μ := sorry

/-- The period map of the level `K` is induced by the projection of `ℙ_η`. -/
theorem toLevel_period (K : G.Level) :
    toLevel G b μ K ≫ period G b μ K = admissiblePeriodTorsor.toGr G b μ := sorry

/-- The structure map `Sht_{G,b,μ,K} → Spd F̆`. -/
def toBase (K : G.Level) : level G b μ K ⟶ (G.reflexField μ).spdBreve :=
  period G b μ K ≫ GrG.oneLegBase G μ

/-- `Sht_{G,b,μ,∞} → Sht_{G,b,μ,K}` is a map over `Spd F̆`. -/
theorem toLevel_toBase (K : G.Level) :
    toLevel G b μ K ≫ toBase G b μ K = admissiblePeriodTorsor.toBase G b μ := by
  rw [toBase, ← Category.assoc, toLevel_period]
  rfl

/-- `π_K` is separated and étale, with image the admissible locus. -/
theorem period_etale (K : G.Level) :
    VStack.etale p (VSheaf.stackMap (period G b μ K)) ∧
      VStack.separated p (VSheaf.stackMap (period G b μ K)) ∧
      ∃ t : level G b μ K ⟶ GrG.admissible G b μ,
        t ≫ GrG.admissibleIncl G b μ = period G b μ K ∧ Sheaf.IsLocallySurjective t := sorry

/-- An `S`-point of `Sht_{G,b,μ,K}` over a point `x` of `Gr_{≤μ}` is a pro-étale `K`-torsor `ℙ`
with an isomorphism between the bundle of `ℙ ×^K G(ℚ_p)` and `E_x` (a `K`-lattice in
`ℙ_η|_S`): `Sht_{G,b,μ,K} = Gr_{≤μ} ×_{Bun_G} [∗/underline K]`. -/
theorem level_isCartesian (K : G.Level) :
    ∃ t : (level G b μ K).stack ⟶ VStack.classifying p K.1.toSubgroup,
      VStack.IsCartesian (VSheaf.stackMap (period G b μ K)) t (BunG.beauvilleLaszlo G b μ)
        (BunG.ofLevel G K) := sorry

/-- `LevelTower.integralLevel` [compatibility]: `Sht_{G,b,μ,𝒢(ℤ_p)} = Sht_{𝒢,b,μ}`, the moduli
space of HS2/local-shtuka-moduli. -/
def integralLevel (𝒢 : G.Model) : level G b μ 𝒢.level ≅ ShtukaDatum 𝒢 b (RedGrp.oneLeg μ) := sorry

/-- The identification at the level `𝒢(ℤ_p)` is compatible with the period maps. -/
theorem integralLevel_period (𝒢 : G.Model) :
    (integralLevel G b μ 𝒢).hom ≫ ShtukaDatum.period 𝒢 b μ = period G b μ 𝒢.level := sorry

/-- `LevelTower.transition` [functoriality]: for `K' ⊂ K` the map
`t_{K',K} : Sht_{G,b,μ,K'} → Sht_{G,b,μ,K}`, `ℙ ↦ ℙ ×^{K'} K`. -/
def transition {K' K : G.Level} (h : K' ≤ K) : level G b μ K' ⟶ level G b μ K := sorry

/-- `t_{K,K} = id`. -/
theorem transition_id (K : G.Level) : transition G b μ (le_refl K) = 𝟙 _ := sorry

/-- `t_{K',K} ∘ t_{K'',K'} = t_{K'',K}`. -/
theorem transition_comp {K'' K' K : G.Level} (h : K'' ≤ K') (h' : K' ≤ K) :
    transition G b μ h ≫ transition G b μ h' = transition G b μ (h.trans h') := sorry

/-- `π_K ∘ t_{K',K} = π_{K'}`. -/
theorem transition_period {K' K : G.Level} (h : K' ≤ K) :
    transition G b μ h ≫ period G b μ K = period G b μ K' := sorry

/-- The transition maps are compatible with the quotient maps of `ℙ_η`. -/
theorem toLevel_transition {K' K : G.Level} (h : K' ≤ K) :
    toLevel G b μ K' ≫ transition G b μ h = toLevel G b μ K := sorry

/-- `t_{K',K}` is finite étale and surjective, of degree `[K : K']`. -/
theorem transition_finiteEtale {K' K : G.Level} (h : K' ≤ K) :
    VStack.finiteEtaleOfDegree p (K'.1.toSubgroup.relIndex K.1.toSubgroup)
        (VSheaf.stackMap (transition G b μ h)) ∧
      Sheaf.IsLocallySurjective (transition G b μ h) := sorry

/-- `LevelTower.transition_torsor` [characterisation]: if `K'` is normal in `K`, then `K/K'` acts
on `Sht_{G,b,μ,K'}` over `Sht_{G,b,μ,K}`, compatibly with the action of `K` at infinite level, and
`t_{K',K}` is a `K/K'`-torsor. -/
theorem transition_torsor {K' K : G.Level} (h : K' ≤ K)
    [(K'.1.toSubgroup.subgroupOf K.1.toSubgroup).Normal] :
    ∃ a : VSheaf.Action
        (VSheaf.constGrp p (K.1.toSubgroup ⧸ K'.1.toSubgroup.subgroupOf K.1.toSubgroup))
        (level G b μ K'),
      a.IsTorsor (transition G b μ h) ∧
        VSheaf.Action.EquivariantAlong
          (VSheaf.constGrpMap p ⟨QuotientGroup.mk' _, QuotientGroup.continuous_mk⟩)
          ((admissiblePeriodTorsor.groupAction G b μ).restrict K.1.toSubgroup) a
          (toLevel G b μ K') := sorry

/-- The tower `K ↦ Sht_{G,b,μ,K}` as a functor on the compact open subgroups, ordered by
inclusion. -/
def functor : G.Level ⥤ VSheaf p where
  obj K := level G b μ K
  map f := transition G b μ (leOfHom f)
  map_id K := transition_id G b μ K
  map_comp f g := (transition_comp G b μ (leOfHom f) (leOfHom g)).symm

/-- The cone over the tower with vertex `ℙ_η`. -/
def cone : Cone (functor G b μ) where
  pt := admissiblePeriodTorsor G b μ
  π :=
    { app := fun K => toLevel G b μ K
      naturality := fun _ _ f =>
        (Category.id_comp _).trans (toLevel_transition G b μ (leOfHom f)).symm }

/-- `LevelTower.limit` [universal-property]: `Sht_{G,b,μ,∞} = ℙ_η`, with the maps
`Sht_{G,b,μ,∞} → Sht_{G,b,μ,K}`, is the limit of the tower in v-sheaves: a compatible family of
maps `T → Sht_{G,b,μ,K}` is a unique map `T → ℙ_η`. (Each `Sht_{G,b,μ,∞} → Sht_{G,b,μ,K}` is a
`K`-torsor: `toLevel_isTorsor`.) -/
def limit : IsLimit (cone G b μ) := sorry

/-- `Sht_{G,b,μ,∞} := lim_K Sht_{G,b,μ,K}`, the limit in v-sheaves over all compact open `K`. -/
def infinite : VSheaf p := Limits.limit (functor G b μ)

/-- The map `ℙ_η → Mod_{1,b,≤μ}`, `(x, τ) ↦ (the divisor of the leg, α_x ∘ τ)`, for the
modification `α_x : E_x ⇢ E_b` of the point `x`. -/
def toModification : admissiblePeriodTorsor G b μ ⟶ FramedModification G 1 b (RedGrp.oneLeg μ) :=
  sorry

/-- `LevelTower.limit_points` [characterisation]: `Sht_{G,b,μ,∞}(S)` is the set of pairs
`(S♯, α)` of an untilt `S♯` of `S` over `F̆` and a modification `α : E_1 ⇢ E_b` at `S♯` bounded by
`μ`: `Sht_{G,b,μ,∞} = Mod_{1,b,≤μ} ×_{Div¹_F} Spd F̆`. -/
theorem limit_points :
    IsPullback (toModification G b μ)
      (admissiblePeriodTorsor.toGr G b μ ≫ GrG.schubertLegs G (RedGrp.oneLeg μ))
      (FramedModification.legs G 1 b (RedGrp.oneLeg μ))
      (G.legBaseToDivBase (RedGrp.oneLeg μ)) := sorry

/-- `LevelTower.cofinal` [other]: if `𝒦` is a set of compact open subgroups forming a
neighbourhood basis of `1` in `G(ℚ_p)`, then `lim_{K ∈ 𝒦} Sht_{G,b,μ,K} = Sht_{G,b,μ,∞}`. -/
def cofinal (𝒦 : Set G.Level)
    (h𝒦 : ∀ U ∈ nhds (1 : G.pts), ∃ K ∈ 𝒦, (K.1 : Set G.pts) ⊆ U) :
    IsLimit ((cone G b μ).whisker
      (Monotone.functor (f := fun K : {K : G.Level // K ∈ 𝒦} => K.1) fun _ _ h => h)) := sorry

/-- The compact open pro-`p` subgroups form a neighbourhood basis of `1` in `G(ℚ_p)`. -/
theorem cofinal_proP :
    ∀ U ∈ nhds (1 : G.pts), ∃ K : G.Level, IsOpenProP p K.1 ∧ (K.1 : Set G.pts) ⊆ U := sorry

/-- `LevelTower.heckeAction` [structure]: `g ∈ G(ℚ_p)` induces an isomorphism
`Sht_{G,b,μ,K} ≅ Sht_{G,b,μ,gKg⁻¹}`. -/
def heckeAction (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    level G b μ K ≅ level G b μ K' := sorry

/-- The isomorphism of `g` is induced by the action of `g` on `ℙ_η`, `α ↦ α ∘ g⁻¹`: on the limit
it is the action of `underline{G(ℚ_p)}`. -/
theorem heckeAction_toLevel (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    toLevel G b μ K ≫ (heckeAction G b μ g K K' h).hom =
      (admissiblePeriodTorsor.groupAction G b μ).constHom g ≫ toLevel G b μ K' := sorry

/-- The isomorphisms of the elements of `G(ℚ_p)` are compatible with composition in `G(ℚ_p)`. -/
theorem heckeAction_mul (g g' : G.pts) (K K' K'' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom)
    (h' : K''.1.toSubgroup = K'.1.toSubgroup.map (MulAut.conj g').toMonoidHom)
    (h'' : K''.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj (g' * g)).toMonoidHom) :
    heckeAction G b μ g K K' h ≪≫ heckeAction G b μ g' K' K'' h' =
      heckeAction G b μ (g' * g) K K'' h'' := sorry

/-- The isomorphisms of the elements of `G(ℚ_p)` are compatible with the transition maps and
with the period maps. -/
theorem heckeAction_transition (g : G.pts) (K₁ K₁' K₂ K₂' : G.Level) (h : K₁ ≤ K₂) (h' : K₁' ≤ K₂')
    (h₁ : K₁'.1.toSubgroup = K₁.1.toSubgroup.map (MulAut.conj g).toMonoidHom)
    (h₂ : K₂'.1.toSubgroup = K₂.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    transition G b μ h ≫ (heckeAction G b μ g K₂ K₂' h₂).hom =
        (heckeAction G b μ g K₁ K₁' h₁).hom ≫ transition G b μ h' ∧
      (heckeAction G b μ g K₁ K₁' h₁).hom ≫ period G b μ K₁' = period G b μ K₁ := sorry

/-- `LevelTower.sigmaCentralizerAction` [structure]: `underline{J_b(ℚ_p)}` acts on every
`Sht_{G,b,μ,K}`, by `α ↦ j ∘ α`. -/
def sigmaCentralizerAction (K : G.Level) :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b)) (level G b μ K) := sorry

/-- The action of `J_b(ℚ_p)` on the levels is induced by its action on `Sht_{G,b,μ,∞}`, is
compatible with the transition maps and with the period maps, and commutes with the isomorphisms
of the elements of `G(ℚ_p)`. -/
theorem sigmaCentralizerAction_spec (K : G.Level) :
    (admissiblePeriodTorsor.framingAction G b μ).Equivariant (sigmaCentralizerAction G b μ K)
        (toLevel G b μ K) ∧
      (sigmaCentralizerAction G b μ K).Equivariant (admissiblePeriodTorsor.periodAction G b μ)
        (period G b μ K) ∧
      (∀ (K' : G.Level) (h : K' ≤ K),
        (sigmaCentralizerAction G b μ K').Equivariant (sigmaCentralizerAction G b μ K)
          (transition G b μ h)) ∧
      ∀ (g : G.pts) (K' : G.Level)
        (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom),
        (sigmaCentralizerAction G b μ K).Equivariant (sigmaCentralizerAction G b μ K')
          (heckeAction G b μ g K K' h).hom := sorry

/-- `LevelTower.map` [functoriality]: for `f : G → H` with `f(K) ⊂ K_H`, the map
`Sht_{G,b,μ,K} → Sht_{H,f(b),f∘μ,K_H}`. -/
def map {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (bH : H.ptsBreve) (μH : H.Cochar)
    (hb : bH = RedGrp.ptsBreveMap f b) (hμ : RedGrp.Cochar.map f μ ≤ μH) (K : G.Level)
    (KH : H.Level) (hK : ∀ g ∈ K.1, RedGrp.ptsMap f g ∈ KH.1) :
    level G b μ K ⟶ level H bH μH KH := sorry

/-- The map of the levels is induced by extension of the structure group at infinite level; it
is compatible with the period maps and with the transition maps on both sides. -/
theorem map_spec {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (bH : H.ptsBreve) (μH : H.Cochar)
    (hb : bH = RedGrp.ptsBreveMap f b) (hμ : RedGrp.Cochar.map f μ ≤ μH) (K : G.Level)
    (KH : H.Level) (hK : ∀ g ∈ K.1, RedGrp.ptsMap f g ∈ KH.1) :
    toLevel G b μ K ≫ map G b μ f bH μH hb hμ K KH hK =
        admissiblePeriodTorsor.pushforward G b μ f bH μH hb hμ ≫ toLevel H bH μH KH ∧
      map G b μ f bH μH hb hμ K KH hK ≫ period H bH μH KH =
        period G b μ K ≫ GrG.oneLegMap f μ μH hμ ∧
      ∀ (K' : G.Level) (KH' : H.Level) (h : K' ≤ K) (h' : KH' ≤ KH)
        (hK' : ∀ g ∈ K'.1, RedGrp.ptsMap f g ∈ KH'.1),
        transition G b μ h ≫ map G b μ f bH μH hb hμ K KH hK =
          map G b μ f bH μH hb hμ K' KH' hK' ≫ transition H bH μH h' := sorry

/-- The maps of the levels are compatible with composition of homomorphisms. -/
theorem map_comp {H H' : RedGrp (LocalField.Qp p)} (f : G ⟶ H) (g : H ⟶ H') (bH : H.ptsBreve)
    (μH : H.Cochar) (bH' : H'.ptsBreve) (μH' : H'.Cochar) (hb : bH = RedGrp.ptsBreveMap f b)
    (hμ : RedGrp.Cochar.map f μ ≤ μH) (hb' : bH' = RedGrp.ptsBreveMap g bH)
    (hμ' : RedGrp.Cochar.map g μH ≤ μH') (hb'' : bH' = RedGrp.ptsBreveMap (f ≫ g) b)
    (hμ'' : RedGrp.Cochar.map (f ≫ g) μ ≤ μH') (K : G.Level) (KH : H.Level) (KH' : H'.Level)
    (hK : ∀ k ∈ K.1, RedGrp.ptsMap f k ∈ KH.1) (hK' : ∀ k ∈ KH.1, RedGrp.ptsMap g k ∈ KH'.1)
    (hK'' : ∀ k ∈ K.1, RedGrp.ptsMap (f ≫ g) k ∈ KH'.1) :
    map G b μ f bH μH hb hμ K KH hK ≫ map H bH μH g bH' μH' hb' hμ' KH KH' hK' =
      map G b μ (f ≫ g) bH' μH' hb'' hμ'' K KH' hK'' := sorry

end LevelTower

/-- `FramedModification.infiniteLevel` [compatibility]: for `E = ℚ_p` and one leg with reflex
field `F`, `Mod_{1,b,≤μ} ×_{Div¹_F} Spd F̆` is the sheaf of pairs
`(S♯, α : E_1 ⇢ E_b bounded by μ)`,
which is `Sht_{G,b,μ,∞}`; the identification is equivariant for `G(ℚ_p) = Aut(E_1)` and for
`J_b(ℚ_p)` (Scholze–Weinstein, p. 219). -/
theorem FramedModification.infiniteLevel :
    IsPullback (LevelTower.toModification G b μ)
        (admissiblePeriodTorsor.toGr G b μ ≫ GrG.schubertLegs G (RedGrp.oneLeg μ))
        (FramedModification.legs G 1 b (RedGrp.oneLeg μ)) (G.legBaseToDivBase (RedGrp.oneLeg μ)) ∧
      (admissiblePeriodTorsor.groupAction G b μ).Equivariant
        (FramedModification.groupAction G b (RedGrp.oneLeg μ)) (LevelTower.toModification G b μ) ∧
      (admissiblePeriodTorsor.framingAction G b μ).Equivariant
        (FramedModification.targetActionJ G 1 b (RedGrp.oneLeg μ))
        (LevelTower.toModification G b μ) := sorry

namespace admissiblePeriodTorsor

/-- `admissiblePeriodTorsor.total_space` [equivalence]: `𝕃_b ≅ Sht_{G,b,μ,∞}`, the limit of the
tower. -/
def total_space : admissiblePeriodTorsor G b μ ≅ LevelTower.infinite G b μ :=
  (LevelTower.limit G b μ).conePointUniqueUpToIso (limit.isLimit _)

/-- Under `𝕃_b ≅ Sht_{G,b,μ,∞}` the projections of the limit are the quotient maps `𝕃_b → 𝕃_b/K`;
so the identification is one over `Gr^a_{≤μ}`, with projection `π_GM`, and is compatible with the
actions of `G(ℚ_p)` and `J_b(ℚ_p)` on the tower. -/
theorem total_space_π (K : G.Level) :
    (total_space G b μ).hom ≫ limit.π (LevelTower.functor G b μ) K = LevelTower.toLevel G b μ K :=
  sorry
-- Omitted: as separate statements, that the identification is one over `Gr^a_{≤μ}` and is
-- equivariant for `G(ℚ_p) × J_b(ℚ_p)`; no action on the limit `LevelTower.infinite` is declared
-- other than the one transported along this identification.

/-- `admissiblePeriodTorsor.level_quotient` [relation]: `𝕃_b/K ≅ Sht_{G,b,μ,K}` for `K ⊂ G(ℚ_p)`
compact open: `𝕃_b → Sht_{G,b,μ,K}` is a torsor under `underline K`, compatibly with the
transition maps. (And `𝕃_b = lim_K 𝕃_b/K`: `LevelTower.limit`.) -/
theorem level_quotient (K : G.Level) :
    ((groupAction G b μ).restrict K.1.toSubgroup).IsTorsor (LevelTower.toLevel G b μ K) ∧
      ∀ (K' : G.Level) (h : K' ≤ K),
        LevelTower.toLevel G b μ K' ≫ LevelTower.transition G b μ h =
          LevelTower.toLevel G b μ K :=
  ⟨LevelTower.toLevel_isTorsor G b μ K, fun _ h => LevelTower.toLevel_transition G b μ h⟩

end admissiblePeriodTorsor

end LevelTowerSection

/-! ### Unit tests of HS2/levels-and-tower-limit, HS2/admissible-period-torsor and
HS2/framed-bundle-fibres that use the one-leg tower -/

section LevelTowerTests

-- LevelTower.torus_test
-- For `𝔾_m`, `μ(z) = z^d`, `v_p(b) = -d`, `K_0 = ℤ_p^×` and `K_n = 1 + p^n ℤ_p` (`n ≥ 1`): each
-- geometric fibre of `Sht_{𝔾_m,b,μ,K_n}` over `Spd ℚ̆_p` is `ℚ_p^×/K_n ≅ ℤ × (ℤ/p^n)^×`, and
-- `Sht_{𝔾_m,b,μ,K_n} → Sht_{𝔾_m,b,μ,K_0}` has degree `(p - 1) p^{n-1}`.
-- Omitted: that this map is a torsor under `(ℤ/p^n)^×`; it is `LevelTower.transition_torsor` for
-- the normal subgroup `K_n` of `K_0`.
example (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve) (d : ℤ)
    (hb : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd (-d))
    (n : ℕ) (hn : 1 ≤ n) (K₀ Kₙ : (RedGrp.Gm (LocalField.Qp p)).Level)
    (h₀ : K₀.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsLevel 0)
    (hₙ : Kₙ.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsLevel n)
    (h : Kₙ ≤ K₀) :
    (∀ (s : Perfd.GeomPoint p)
        (y : ((RedGrp.Gm (LocalField.Qp p)).reflexField (RedGrp.Gm.cochar _ d)).spdBreve.geomPts s),
        Nonempty (VSheaf.geomFibre (LevelTower.toBase _ b (RedGrp.Gm.cochar _ d) Kₙ) s y ≃
          ℤ × (ZMod (p ^ n))ˣ)) ∧
      VStack.finiteEtaleOfDegree p ((p - 1) * p ^ (n - 1))
        (VSheaf.stackMap (LevelTower.transition _ b (RedGrp.Gm.cochar _ d) h)) := by
  sorry

-- LevelTower.iwahori_test
-- For `GL_2`, `K = GL_2(ℤ_p)` and `K'` the subgroup of matrices that are upper triangular modulo
-- `p`: `Sht_{K'} → Sht_K` is finite étale of degree `p + 1` and `K'` is not normal in `K`; for
-- `K'' = ker(GL_2(ℤ_p) → GL_2(𝔽_p))`, which is normal in `K`, the map `Sht_{K''} → Sht_K` has
-- degree `(p² - 1)(p² - p)`. The tower is taken non-empty: `[b] ∈ B(GL_2, μ⁻¹)`.
example (b : (RedGrp.GLn (LocalField.Qp p) 2).ptsBreve)
    (μ : (RedGrp.GLn (LocalField.Qp p) 2).Cochar)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn (LocalField.Qp p) 2).BGmu μ.dual)
    (K K' K'' : (RedGrp.GLn (LocalField.Qp p) 2).Level)
    (hK : ∀ g, g ∈ K.1 ↔ ∃ m : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
        Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) m)
    (hK' : ∀ g, g ∈ K'.1 ↔ ∃ m : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
          Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) m ∧
        (p : ℤ_[p]) ∣ m.1 1 0)
    (hK'' : ∀ g, g ∈ K''.1 ↔ ∃ m : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
          Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) m ∧
        ∀ i j, (p : ℤ_[p]) ∣ (m.1 - 1) i j)
    (h' : K' ≤ K) (h'' : K'' ≤ K) :
    VStack.finiteEtaleOfDegree p (p + 1) (VSheaf.stackMap (LevelTower.transition _ b μ h')) ∧
      ¬ (K'.1.toSubgroup.subgroupOf K.1.toSubgroup).Normal ∧
      (K''.1.toSubgroup.subgroupOf K.1.toSubgroup).Normal ∧
      VStack.finiteEtaleOfDegree p ((p ^ 2 - 1) * (p ^ 2 - p))
        (VSheaf.stackMap (LevelTower.transition _ b μ h'')) := by
  sorry

-- LevelTower.integralLevel_test
-- For `K = 𝒢(ℤ_p)`: `Sht_{G,b,μ,𝒢(ℤ_p)} = Sht_{𝒢,b,μ}`; if two models have the same `ℤ_p`-points,
-- their moduli spaces of shtukas are the same, compatibly with the period maps.
example (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar) (𝒢 𝒢' : G.Model)
    (h : 𝒢.level = 𝒢'.level) :
    Nonempty (LevelTower.level G b μ 𝒢.level ≅ ShtukaDatum 𝒢 b (RedGrp.oneLeg μ)) ∧
      ∃ e : ShtukaDatum 𝒢 b (RedGrp.oneLeg μ) ≅ ShtukaDatum 𝒢' b (RedGrp.oneLeg μ),
        e.hom ≫ ShtukaDatum.period 𝒢' b μ = ShtukaDatum.period 𝒢 b μ := by
  sorry

-- LevelTower.hecke_test
-- For `g ∈ K` the isomorphism `Sht_K ≅ Sht_{gKg⁻¹} = Sht_K` is the identity. On the tower of
-- `b = 1` and bound `0`, which is `underline{G(ℚ_p)/K} × Spd ℚ̆_p` with points `hK`, the
-- isomorphism
-- of `g` is `hK ↦ hg⁻¹ · (gKg⁻¹)` (for `g` normalising `K`: right translation by `g⁻¹`).
-- The packet states the formula on the tower with no legs and `b = 1` of part (f); the
-- declarations of this node are for one leg, and the bound `0` is used. On the towers of
-- HS2/general-local-field, with any number of legs, the isomorphisms of `g` are
-- `GeneralShtukaTower.actions`.
example (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar) (g : G.pts) (K : G.Level)
    (hg : g ∈ K.1) (h : K.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    LevelTower.heckeAction G b μ g K K h = Iso.refl _ ∧
      ∃ e : ∀ K : G.Level, LevelTower.level G 1 0 K ≅
          (VSheaf.ofTop p).obj (G.cosets K) ⨯ (G.reflexField 0).spdBreve,
        ∀ (g : G.pts) (K K' : G.Level)
          (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom)
          (m : G.cosets K ⟶ G.cosets K')
          (_ : ∀ x : G.pts, m (QuotientGroup.mk x : G.pts ⧸ K.1.toSubgroup) =
            (QuotientGroup.mk (x * g⁻¹) : G.pts ⧸ K'.1.toSubgroup)),
          (LevelTower.heckeAction G 1 0 g K K' h).hom ≫ (e K').hom =
            (e K).hom ≫ prod.map ((VSheaf.ofTop p).map m) (𝟙 _) := by
  sorry

-- admissiblePeriodTorsor.trivial_datum_test
-- For `μ = 0`: `Gr_{≤0} = Spd ℚ̆_p`; for `b = 1`, `𝕃_1 = G(ℚ_p) × Spd ℚ̆_p`, with `g ∈ G(ℚ_p)`
-- acting
-- by right translation (by `g⁻¹`, for the left action `τ ↦ τ ∘ g⁻¹`) and `J_1(ℚ_p) = G(ℚ_p)` by
-- left translation; for `[b] ≠ 1` the admissible locus and `𝕃_b` are empty.
example (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) :
    IsIso (GrG.oneLegBase G 0) ∧
      (∃ e : admissiblePeriodTorsor G 1 0 ≅ VSheaf.const p G.pts ⨯ (G.reflexField 0).spdBreve,
        e.hom ≫ prod.snd = admissiblePeriodTorsor.toBase G 1 0 ∧
          (∀ g : G.pts,
            (admissiblePeriodTorsor.groupAction G 1 0).constHom g ≫ e.hom =
              e.hom ≫ prod.map
                ((VSheaf.ofTop p).map
                  (TopCat.ofHom ⟨fun x : G.pts => x * g⁻¹, continuous_mul_const g⁻¹⟩)) (𝟙 _)) ∧
          ∀ j : G.sigmaCentralizer 1,
            (admissiblePeriodTorsor.framingAction G 1 0).constHom j ≫ e.hom =
              e.hom ≫ prod.map
                ((VSheaf.ofTop p).map
                  (TopCat.ofHom ⟨fun x : G.pts => G.centralizerOne.symm j * x,
                    continuous_const_mul _⟩)) (𝟙 _)) ∧
      (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk 1 →
        (GrG.admissible G b 0).IsEmpty ∧ (admissiblePeriodTorsor G b 0).IsEmpty) := by
  sorry

-- admissiblePeriodTorsor.cyclotomic_test
-- For `𝔾_m`, `μ = id` and `v_p(b) = -1`: `Gr^a_{≤μ} = Gr_{≤μ} = Spd ℚ̆_p`, and for `m ≥ 1`,
-- `𝕃_b/(1 + p^m ℤ_p) ≅ ℤ × Spd L` for an extension `L` of `ℚ̆_p` of degree `(p - 1) p^{m-1}` (the
-- field `ℚ̆_p(ζ_{p^m})`).
-- Omitted: `𝕃_b ×^{ℚ_p^×} ℚ_p ≅ ℚ_p(1)`, the cyclotomic character and `D_cris(ℚ_p(1))`; the
-- interface has no Galois representations and does not name the cyclotomic extensions.
example (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve)
    (hb : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd (-1))
    (m : ℕ) (hm : 1 ≤ m) (K : (RedGrp.Gm (LocalField.Qp p)).Level)
    (hK : K.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsLevel m) :
    IsIso (GrG.admissibleIncl _ b (RedGrp.Gm.cochar (LocalField.Qp p) 1)) ∧
      IsIso (GrG.oneLegBase _ (RedGrp.Gm.cochar (LocalField.Qp p) 1)) ∧
      ∃ L : ((RedGrp.Gm (LocalField.Qp p)).reflexField (RedGrp.Gm.cochar _ 1)).BreveExt,
        L.degree = (p - 1) * p ^ (m - 1) ∧
          ∃ e : LevelTower.level _ b (RedGrp.Gm.cochar _ 1) K ≅ VSheaf.const p ℤ ⨯ L.spd.left,
            e.hom ≫ prod.snd ≫ L.spd.hom = LevelTower.toBase _ b (RedGrp.Gm.cochar _ 1) K := by
  sorry

-- admissiblePeriodTorsor.tate_module_test
-- For `GL_n`, `μ = (1^d, 0^{n-d})`, `[b] ∈ B(GL_n, μ⁻¹)` (the classes of the Frobenius of the
-- covariant Dieudonné module of a `p`-divisible group of dimension `d` and height `n`, in the
-- normalisation of Scholze–Weinstein in which `μ_{p^∞}` has Frobenius `p⁻¹σ`) and
-- `K = GL_n(ℤ_p)`: a point of
-- `Sht_{GL_n,b,μ,K}` over a point `x` of `Gr_{≤μ}` is a pro-étale `GL_n(ℤ_p)`-torsor (a
-- `ℤ_p`-lattice) in the `GL_n(ℚ_p)`-torsor `x^* 𝕃_b`; that is, `Sht_K = Gr_{≤μ} ×_{Bun_G} [∗/K]`.
-- Omitted: the identification of the lattice with the Tate module of the universal
-- `p`-divisible group over the Rapoport–Zink space; the interfaces have neither `p`-divisible
-- groups nor Tate modules (the comparison of the towers is `classicalComparison`, HS3). No clause
-- of the packet test is therefore stated: what follows is `LevelTower.level_isCartesian` in the
-- case of the test, and it does not use the hypotheses that fix that case.
example (n d : ℕ) (hd : d ≤ n) (v : {v : Fin n → ℤ // Antitone v})
    (hv : v.1 = fun i => if i.1 < d then 1 else 0)
    (b : (RedGrp.GLn (LocalField.Qp p) n).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈
      (RedGrp.GLn (LocalField.Qp p) n).BGmu (RedGrp.GLn.cochar _ n v).dual)
    (K : (RedGrp.GLn (LocalField.Qp p) n).Level)
    (hK : K.1.toSubgroup.map (RedGrp.GLn.ptsEquiv (LocalField.Qp p) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p))).range) :
    ∃ t : (LevelTower.level _ b (RedGrp.GLn.cochar _ n v) K).stack ⟶
        VStack.classifying p K.1.toSubgroup,
      VStack.IsCartesian (VSheaf.stackMap (LevelTower.period _ b (RedGrp.GLn.cochar _ n v) K)) t
        (BunG.beauvilleLaszlo _ b (RedGrp.GLn.cochar _ n v)) (BunG.ofLevel _ K) := by
  sorry

-- admissiblePeriodTorsor.level_test
-- For `K ⊂ G(ℚ_p)` compact open the fibre of `𝕃_b/K = Sht_{G,b,μ,K}` over a geometric point of
-- `Gr^a_{≤μ}` is `G(ℚ_p)/K`, and over an `S`-point of `Gr^a_{≤μ}` along which `𝕃_b` is trivialised
-- the pullback of `𝕃_b/K` is `S × G(ℚ_p)/K`.
example (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar) (K : G.Level) :
    (∀ (s : Perfd.GeomPoint p) (y : (GrG.oneLeg G μ).geomPts s),
        BunG.classAt (BunG.beauvilleLaszlo G b μ) s y = RedGrp.BofG.mk 1 →
          Nonempty (VSheaf.geomFibre (LevelTower.period G b μ K) s y ≃
            G.pts ⧸ K.1.toSubgroup)) ∧
      ∀ (S : Perfd p) (z : S.sheaf ⟶ admissiblePeriodTorsor G b μ),
        ∃ e : pullback (LevelTower.period G b μ K) (z ≫ admissiblePeriodTorsor.toGr G b μ) ≅
            (VSheaf.ofTop p).obj (G.cosets K) ⨯ S.sheaf,
          e.hom ≫ prod.snd = pullback.snd _ _ := by
  sorry

-- admissiblePeriodTorsor.boundary_test
-- For `GL_2`, `μ = (2,0)` and `b = p⁻¹ · 1`: over every geometric point there is a point of the
-- closed stratum `Gr_{(1,1)}` (a point outside the open cell `Gr_{(2,0)}`), and every such point
-- is admissible.
-- Omitted: the restriction of `𝕃_b` to the closed stratum as the torsor of bases of `ℚ_p(1)²`, of
-- type `(1,1)`; the interface has no Galois representations.
example (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![2, 0])
    (b : (RedGrp.GLn (LocalField.Qp p) 2).ptsBreve) (u : (LocalField.Qp p).Breveˣ)
    (hu : (LocalField.Qp p).valBreve u = Multiplicative.ofAdd (-1))
    (hb : (RedGrp.GLn.ptsBreveEquiv (LocalField.Qp p) 2 b).1 =
      Matrix.scalar (Fin 2) (u : (LocalField.Qp p).Breve))
    (s : Perfd.GeomPoint p) :
    (∃ y : (GrG.oneLeg _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)).geomPts s,
        y ∉ Set.range (VSheaf.ptsMap (GrG.cellIncl _ (RedGrp.GLn.cochar _ 2 v)) s.toPerfd)) ∧
      ∀ y : (GrG.oneLeg _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)).geomPts s,
        y ∉ Set.range (VSheaf.ptsMap (GrG.cellIncl _ (RedGrp.GLn.cochar _ 2 v)) s.toPerfd) →
          BunG.classAt (BunG.beauvilleLaszlo _ b (RedGrp.GLn.cochar _ 2 v)) s y =
            RedGrp.BofG.mk 1 := by
  sorry

-- FramedModification.shtuka_test
-- For `E = ℚ_p`, `𝔾_m`, `μ(z) = z` and `v_p(b) = -1`: `Mod_{1,b,μ} ×_{Div¹} Spd ℚ̆_p` is
-- `Sht_{𝔾_m,b,μ,∞}`, a `ℚ_p^×`-torsor over `Spd ℚ̆_p`; its quotient by `ℤ_p^×` has geometric fibres
-- `ℚ_p^×/ℤ_p^× ≅ ℤ`.
example (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve)
    (hb : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd (-1))
    (K : (RedGrp.Gm (LocalField.Qp p)).Level)
    (hK : K.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsInt) :
    IsPullback (LevelTower.toModification _ b (RedGrp.Gm.cochar _ 1))
        (admissiblePeriodTorsor.toGr _ b (RedGrp.Gm.cochar _ 1) ≫
          GrG.schubertLegs _ (RedGrp.oneLeg (RedGrp.Gm.cochar _ 1)))
        (FramedModification.legs _ 1 b (RedGrp.oneLeg (RedGrp.Gm.cochar _ 1)))
        (RedGrp.legBaseToDivBase _ (RedGrp.oneLeg (RedGrp.Gm.cochar (LocalField.Qp p) 1))) ∧
      (admissiblePeriodTorsor.groupAction _ b (RedGrp.Gm.cochar _ 1)).IsTorsor
        (admissiblePeriodTorsor.toBase _ b (RedGrp.Gm.cochar _ 1)) ∧
      ∀ (s : Perfd.GeomPoint p)
        (y : ((RedGrp.Gm (LocalField.Qp p)).reflexField (RedGrp.Gm.cochar _ 1)).spdBreve.geomPts s),
        Nonempty (VSheaf.geomFibre (LevelTower.toBase _ b (RedGrp.Gm.cochar _ 1) K) s y ≃ ℤ) := by
  sorry

end LevelTowerTests

/-! ### HS2/hecke-fibre-description and HS2/one-leg-period-map -/

section OneLegPeriod

variable (G : RedGrp (LocalField.Qp p)) (𝒢 : G.Model) (b : G.ptsBreve) (μ : G.Cochar)

/-- HS2/hecke-fibre-description (Scholze–Weinstein, Proposition 23.3.1). For `E = ℚ_p` and one
leg:
(a) `Sht_{𝒢,b,μ}(S)` is the set of isomorphism classes of quadruples `(S♯, E, α, ℙ)`: an untilt
over `F̆`, a `G`-bundle `E` on `X_S`, a modification `α : E ⇢ E_b` at `S♯` bounded by `μ`, and a
`𝒢(ℤ_p)`-lattice `ℙ` in the torsor of trivialisations of `E`. That is, `Sht_{𝒢,b,μ}` is the
2-fibre product of the bounded Hecke stack over `Spd F̆`, through its two bundles `(E_1, E_2)`,
with `[∗/underline{𝒢(ℤ_p)}] × ∗ → Bun_G × Bun_G`, `(ℙ, ∗) ↦ (E_ℙ, E_b)`.
(b) `M_∞ = Mod_{1,b,≤μ} ×_{Div¹_F} Spd F̆` is `Sht_{G,b,μ,∞}`, and `M_∞ → Sht_{𝒢,b,μ}` is a
pro-étale `𝒢(ℤ_p)`-torsor; in particular `Sht_{𝒢,b,μ}` depends on `𝒢` only through `𝒢(ℤ_p)`.
The orientation: the modification goes from the geometrically trivial bundle to `E_b`, and a
local Shimura datum has `[b] ∈ B(G, μ⁻¹)`. By `FramedModification.inverse`, inversion identifies
`M_∞` with `Mod_{b,1,≤μ⁻¹} ×_{Div¹_F} Spd F̆`. Fargues–Scholze (p. 324) print `[b] ∈ B(G, μ)` and
modifications of type `μ` from `E_b` to `E_1`; with their Hecke operator `T_μ` (pp. 337–338) the
space that computes the stratum of `b` is `M_∞/K` as above, with `[b] ∈ B(G, μ⁻¹)`. -/
theorem heckeFibreDescription :
    (∃ (t : (ShtukaDatum 𝒢 b (RedGrp.oneLeg μ)).stack ⟶
          VStack.fibre (HckI.BoundedLe.legs G (RedGrp.oneLeg μ))
            (VSheaf.stackMap (G.legBaseToDivBase (RedGrp.oneLeg μ))))
        (u : (ShtukaDatum 𝒢 b (RedGrp.oneLeg μ)).stack ⟶ VStack.classifying p 𝒢.level.1.toSubgroup),
        VStack.IsCartesian t (prod.lift u (terminal.from _))
            (VStack.fibre.fst _ _ ≫ HckI.BoundedLe.ends G (RedGrp.oneLeg μ))
            (prod.map (BunG.ofLevel G 𝒢.level) (BunG.point G b)) ∧
          t ≫ VStack.fibre.snd _ _ = VSheaf.stackMap (ShtukaDatum.legs 𝒢 b (RedGrp.oneLeg μ))) ∧
      IsPullback (LevelTower.toModification G b μ)
        (admissiblePeriodTorsor.toGr G b μ ≫ GrG.schubertLegs G (RedGrp.oneLeg μ))
        (FramedModification.legs G 1 b (RedGrp.oneLeg μ)) (G.legBaseToDivBase (RedGrp.oneLeg μ)) ∧
      ∃ q : admissiblePeriodTorsor G b μ ⟶ ShtukaDatum 𝒢 b (RedGrp.oneLeg μ),
        q ≫ ShtukaDatum.period 𝒢 b μ = admissiblePeriodTorsor.toGr G b μ ∧
          ((admissiblePeriodTorsor.groupAction G b μ).restrict 𝒢.level.1.toSubgroup).IsTorsor q :=
  sorry

/-- HS2/one-leg-period-map (Scholze–Weinstein, Proposition 23.3.3 and Remark 23.3.4). For
`E = ℚ_p` and one leg: the period morphism `π_GM : Sht_{𝒢,b,μ} → Gr_{G,Spd F̆,≤μ}` is étale; the
admissible locus `Gr^a` is open and is the image of `π_GM`; over `Gr^a` the fibre of `π_GM` is the
sheaf of `𝒢(ℤ_p)`-lattices in the pro-étale `G(ℚ_p)`-torsor `ℙ_η`, so `Sht_{𝒢,b,μ} ≅ ℙ_η/𝒢(ℤ_p)`;
for every compact open `K` the sheaf `ℙ_η/K` is étale over `Gr_{G,Spd F̆,≤μ}`; `Gr_{G,Spd F̆,≤μ}` is
a spatial diamond, hence `Sht_{𝒢,b,μ}` and all `ℙ_η/K` are locally spatial diamonds; and
`ℙ_η → Gr^a` is quasi-pro-étale. -/
theorem oneLegPeriodMap :
    VStack.etale p (VSheaf.stackMap (ShtukaDatum.period 𝒢 b μ)) ∧
      VStack.openImmersion p (VSheaf.stackMap (GrG.admissibleIncl G b μ)) ∧
      (∃ t : ShtukaDatum 𝒢 b (RedGrp.oneLeg μ) ⟶ GrG.admissible G b μ,
        t ≫ GrG.admissibleIncl G b μ = ShtukaDatum.period 𝒢 b μ ∧ Sheaf.IsLocallySurjective t) ∧
      (∃ q : admissiblePeriodTorsor G b μ ⟶ ShtukaDatum 𝒢 b (RedGrp.oneLeg μ),
        q ≫ ShtukaDatum.period 𝒢 b μ = admissiblePeriodTorsor.toGr G b μ ∧
          ((admissiblePeriodTorsor.groupAction G b μ).restrict 𝒢.level.1.toSubgroup).IsTorsor q) ∧
      (∀ K : G.Level, VStack.etale p (VSheaf.stackMap (LevelTower.period G b μ K))) ∧
      VSheaf.isSpatialDiamond p (GrG.oneLeg G μ) ∧
      VSheaf.isLocSpatialDiamond p (ShtukaDatum 𝒢 b (RedGrp.oneLeg μ)) ∧
      (∀ K : G.Level, VSheaf.isLocSpatialDiamond p (LevelTower.level G b μ K)) ∧
      VStack.quasiProEtale p (VSheaf.stackMap (admissiblePeriodTorsor.proj G b μ)) := sorry
-- Omitted: in (e), that `ℙ_η → Gr^a` is not étale when the admissible locus is nonempty and `dim G > 0`; the dimension of a group is
-- not in the interfaces.

end OneLegPeriod

/-! ### HS2/general-local-field: the tower over a general local field -/

section GeneralLocalField

/-- HS2/general-local-field, `GeneralShtukaTower` [data]. For a nonarchimedean local field `E` of
either characteristic, `G` reductive over `E`, `b ∈ G(Ĕ)`, arbitrary conjugacy classes `μ_i` of
cocharacters and `K ⊂ G(E)` compact open: the v-sheaf `Sht_{(G,b,μ•),K}` whose `S`-points are the
tuples `((S_i♯), P_η, φ_P, ι_r, 𝒫)` of a point of the admissible locus of the twisted Grassmannian
and a `K`-lattice `𝒫 ⊂ 𝒫_η`, that is, a section of `𝒫_η/K`. -/
def GeneralShtukaTower (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)
    (K : G.Level) : VSheaf p := sorry

namespace GeneralShtukaTower

variable (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)

/-- The admissible locus `Gr^{tw,a} ⊂ Gr^tw_{≤μ•}`: the open subfunctor on which the bundle `E` is
trivial at every geometric point. -/
abbrev admissible : VSheaf p := BunG.trivLocus (bundle G b μ)

/-- `Sht_{(G,b,μ•),∞} = 𝒫_η = Isom(E_1, E)`, the pro-étale `G(E)`-torsor over `Gr^{tw,a}`. -/
def infinite : VSheaf p := BunG.trivTorsor (bundle G b μ)

/-- `G(E)` acts on `𝒫_η` by `g · τ = τ ∘ g⁻¹`. -/
def groupAction : VSheaf.Action (VSheaf.constGrp p G.pts) (infinite G b μ) :=
  BunG.trivTorsor.action (bundle G b μ)

/-- The period map at infinite level, `𝒫_η → Gr^{tw,a} → Gr^tw_{≤μ•}`. -/
def toGr : infinite G b μ ⟶ TwistedPeriodData G b μ :=
  BunG.trivTorsor.proj (bundle G b μ) ≫ BunG.trivLocus.incl (bundle G b μ)

/-- The action of `G(E)` on `𝒫_η` is an action over `Gr^tw_{≤μ•}`. -/
theorem groupAction_toGr : (groupAction G b μ).Invariant (toGr G b μ) :=
  (BunG.trivTorsor.action_invariant (bundle G b μ)).comp _

/-- The quotient map `Sht_{(G,b,μ•),∞} = 𝒫_η → 𝒫_η/K = Sht_{(G,b,μ•),K}`. -/
def toLevel (K : G.Level) : infinite G b μ ⟶ GeneralShtukaTower G b μ K := sorry

/-- `Sht_{(G,b,μ•),∞} → Sht_{(G,b,μ•),K}` is a torsor under `underline K`. -/
theorem toLevel_isTorsor (K : G.Level) :
    ((groupAction G b μ).restrict K.1.toSubgroup).IsTorsor (toLevel G b μ K) := sorry

/-- `GeneralShtukaTower.legs` [projection]: `f_K : Sht_{(G,b,μ•),K} → ∏_{i ∈ I} Spd Ĕ_i`. -/
def legs (K : G.Level) : GeneralShtukaTower G b μ K ⟶ G.legBase μ := sorry

/-- `GeneralShtukaTower.periodMap` [projection]: `π_K : Sht_{(G,b,μ•),K} → Gr^tw_{≤μ•}`, which
forgets the lattice. -/
def periodMap (K : G.Level) : GeneralShtukaTower G b μ K ⟶ TwistedPeriodData G b μ := sorry

/-- `π_K` is a map over the leg base, induced by the projection of `𝒫_η`; it is étale and
separated, with image the open admissible locus; and its fibre over `S → Gr^{tw,a}` is
`𝒫_η|_S/K`: a point of `Sht_{(G,b,μ•),K}` over a point of `Gr^tw` is a pro-étale `K`-torsor with
an isomorphism of its bundle with `E`, that is, `Sht_{(G,b,μ•),K} = Gr^tw ×_{Bun_G} [∗/K]`. -/
theorem periodMap_spec (K : G.Level) :
    periodMap G b μ K ≫ TwistedPeriodData.legs G b μ = legs G b μ K ∧
      toLevel G b μ K ≫ periodMap G b μ K = toGr G b μ ∧
      VStack.etale p (VSheaf.stackMap (periodMap G b μ K)) ∧
      VStack.separated p (VSheaf.stackMap (periodMap G b μ K)) ∧
      VStack.openImmersion p (VSheaf.stackMap (BunG.trivLocus.incl (bundle G b μ))) ∧
      (∃ t : GeneralShtukaTower G b μ K ⟶ admissible G b μ,
        t ≫ BunG.trivLocus.incl (bundle G b μ) = periodMap G b μ K ∧
          Sheaf.IsLocallySurjective t) ∧
      ∃ t : (GeneralShtukaTower G b μ K).stack ⟶ VStack.classifying p K.1.toSubgroup,
        VStack.IsCartesian (VSheaf.stackMap (periodMap G b μ K)) t (bundle G b μ)
          (BunG.ofLevel G K) := sorry

/-- `GeneralShtukaTower.ext` [extensionality]: two points of `𝒫_η` over `S` (two tuples
`((S_i♯), P_η, φ_P, ι_r)` with a trivialisation of `E`) define the same `S`-point of
`Sht_{(G,b,μ•),K}` if and only if they have the same image in `Gr^tw` (the same legs and
isomorphic `(P_η, φ_P)`, compatibly with the germs of `ι_r`) and the trivialisations differ by a
section of `underline K` (they define the same `K`-lattice). -/
theorem ext (K : G.Level) (S : Perfd p) (x y : (infinite G b μ).pts S) :
    VSheaf.ptsMap (toLevel G b μ K) S x = VSheaf.ptsMap (toLevel G b μ K) S y ↔
      ∃ k : (VSheaf.constGrp p K.1.toSubgroup).obj (op S),
        ((groupAction G b μ).restrict K.1.toSubgroup).smul S k x = y := sorry
-- Omitted: the packet's criterion for two arbitrary `S`-points of `Sht_{(G,b,μ•),K}` (the same
-- legs and an isomorphism of `(P_η, φ_P)`, compatible with `ι_r`, carrying one `K`-lattice to the
-- other). The statement above is the orbit clause of `toLevel_isTorsor`, for the points that lift
-- to infinite level over `S`.

/-- `Sht_{(G,b,μ•),K}` is a locally spatial diamond. -/
theorem isLocSpatialDiamond (K : G.Level) :
    VSheaf.isLocSpatialDiamond p (GeneralShtukaTower G b μ K) := sorry

/-- `GeneralShtukaTower.transition` [functoriality]: for `K' ⊂ K` the map
`Sht_{(G,b,μ•),K'} → Sht_{(G,b,μ•),K}`, `𝒫' ↦ 𝒫' · K`. -/
def transition {K' K : G.Level} (h : K' ≤ K) :
    GeneralShtukaTower G b μ K' ⟶ GeneralShtukaTower G b μ K := sorry

/-- The transition map is the identity for `K' = K`. -/
theorem transition_id (K : G.Level) : transition G b μ (le_refl K) = 𝟙 _ := sorry

/-- The transition maps are compatible with composition. -/
theorem transition_comp {K'' K' K : G.Level} (h : K'' ≤ K') (h' : K' ≤ K) :
    transition G b μ h ≫ transition G b μ h' = transition G b μ (h.trans h') := sorry

/-- The transition maps are compatible with the quotient maps of `𝒫_η`. -/
theorem toLevel_transition {K' K : G.Level} (h : K' ≤ K) :
    toLevel G b μ K' ≫ transition G b μ h = toLevel G b μ K := sorry

/-- The transition map is finite étale of degree `[K : K']`, and commutes with `π_K` and
`f_K`. -/
theorem transition_spec {K' K : G.Level} (h : K' ≤ K) :
    VStack.finiteEtaleOfDegree p (K'.1.toSubgroup.relIndex K.1.toSubgroup)
        (VSheaf.stackMap (transition G b μ h)) ∧
      transition G b μ h ≫ periodMap G b μ K = periodMap G b μ K' ∧
      transition G b μ h ≫ legs G b μ K = legs G b μ K' := sorry

/-- The transition map is a `K/K'`-torsor when `K'` is normal in `K`. -/
theorem transition_torsor {K' K : G.Level} (h : K' ≤ K)
    [(K'.1.toSubgroup.subgroupOf K.1.toSubgroup).Normal] :
    ∃ a : VSheaf.Action
        (VSheaf.constGrp p (K.1.toSubgroup ⧸ K'.1.toSubgroup.subgroupOf K.1.toSubgroup))
        (GeneralShtukaTower G b μ K'),
      a.IsTorsor (transition G b μ h) ∧
        VSheaf.Action.EquivariantAlong
          (VSheaf.constGrpMap p ⟨QuotientGroup.mk' _, QuotientGroup.continuous_mk⟩)
          ((groupAction G b μ).restrict K.1.toSubgroup) a (toLevel G b μ K') := sorry

/-- The tower `K ↦ Sht_{(G,b,μ•),K}` as a functor on the compact open subgroups of `G(E)`. -/
def functor : G.Level ⥤ VSheaf p where
  obj K := GeneralShtukaTower G b μ K
  map f := transition G b μ (leOfHom f)
  map_id K := transition_id G b μ K
  map_comp f g := (transition_comp G b μ (leOfHom f) (leOfHom g)).symm

/-- The cone over the tower with vertex `𝒫_η`. -/
def cone : Cone (functor G b μ) where
  pt := infinite G b μ
  π :=
    { app := fun K => toLevel G b μ K
      naturality := fun _ _ f =>
        (Category.id_comp _).trans (toLevel_transition G b μ (leOfHom f)).symm }

/-- `GeneralShtukaTower.limit` [characterisation]: `Sht_{(G,b,μ•),∞} = 𝒫_η` is the limit
`lim_K Sht_{(G,b,μ•),K}` of the tower in v-sheaves. -/
def limit : IsLimit (cone G b μ) := sorry

/-- `Sht_{(G,b,μ•),∞} = 𝒫_η` is a torsor under `underline{G(E)}` over `Gr^{tw,a}`; and over the
complement of the Frobenius-twisted partial diagonals, the loci `S_i♯ = φⁿ(S_j♯)` with `i ≠ j` and
`n ≠ 0` (legs may coincide), its `S`-points are the tuples `((S_i♯), α)` with `α : E_1 ≅ E_b` an
isomorphism away from the images `D_i` of the `S_i♯`, meromorphic and bounded by
`Σ_{j : S_j♯ = S_i♯} μ_j` at `D_i`: there
`Sht_{(G,b,μ•),∞} ≅ Mod^I_{1,b,≤μ•} ×_{∏ Div¹_{E_i}} ∏ Spd Ĕ_i`. The locus is
`TwistedPeriodData.bdLocus` of HS0. -/
theorem limit_spec :
    (groupAction G b μ).IsTorsor (BunG.trivTorsor.proj (bundle G b μ)) ∧
      ∃ c : pullback (toGr G b μ ≫ TwistedPeriodData.legs G b μ)
            (TwistedPeriodData.bdLocusIncl G μ) ≅
          pullback (pullback.snd (FramedModification.legs G 1 b μ) (G.legBaseToDivBase μ))
            (TwistedPeriodData.bdLocusIncl G μ),
        c.hom ≫ pullback.snd _ _ = pullback.snd _ _ := sorry

/-- The isomorphism `Sht_{(G,b,μ•),K} ≅ Sht_{(G,b,μ•),gKg⁻¹}` of `g ∈ G(E)`, `𝒫 ↦ 𝒫 · g⁻¹`. -/
def heckeIso (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    GeneralShtukaTower G b μ K ≅ GeneralShtukaTower G b μ K' := sorry

/-- `J_b(E)` acts on every level, by changing `ι_r`. -/
def framingAction (K : G.Level) :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b)) (GeneralShtukaTower G b μ K) := sorry

/-- `GeneralShtukaTower.actions` [structure]: `g ∈ G(E) = Aut(E_1)` acts on
`𝒫_η = Isom(E_1, E)` by `τ ↦ τ ∘ g⁻¹` and induces the isomorphisms
`Sht_{(G,b,μ•),K} ≅ Sht_{(G,b,μ•),gKg⁻¹}`, as in HS2/levels-and-tower-limit; they are compatible
with products in `G(E)` and with the transition maps; the action of `J_b(E)` commutes with them;
and both commute with `f_K`. -/
theorem actions (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    toLevel G b μ K ≫ (heckeIso G b μ g K K' h).hom =
        (groupAction G b μ).constHom g ≫ toLevel G b μ K' ∧
      (∀ (g' : G.pts) (K'' : G.Level)
          (h' : K''.1.toSubgroup = K'.1.toSubgroup.map (MulAut.conj g').toMonoidHom)
          (h'' : K''.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj (g' * g)).toMonoidHom),
          heckeIso G b μ g K K' h ≪≫ heckeIso G b μ g' K' K'' h' =
            heckeIso G b μ (g' * g) K K'' h'') ∧
      (∀ (K₁ K₁' : G.Level) (h₁ : K₁ ≤ K) (h₁' : K₁' ≤ K')
          (hc : K₁'.1.toSubgroup = K₁.1.toSubgroup.map (MulAut.conj g).toMonoidHom),
          transition G b μ h₁ ≫ (heckeIso G b μ g K K' h).hom =
            (heckeIso G b μ g K₁ K₁' hc).hom ≫ transition G b μ h₁') ∧
      (framingAction G b μ K).Equivariant (framingAction G b μ K') (heckeIso G b μ g K K' h).hom ∧
      (heckeIso G b μ g K K' h).hom ≫ legs G b μ K' = legs G b μ K ∧
      (framingAction G b μ K).Invariant (legs G b μ K) ∧
      ∀ (K₁ : G.Level) (h₁ : K₁ ≤ K),
        (framingAction G b μ K₁).Equivariant (framingAction G b μ K) (transition G b μ h₁) :=
  sorry

/-- `GeneralShtukaTower.oneLeg` [compatibility], first part: for one leg,
`Gr^tw_{G,Spd Ĕ_1,≤μ_1} = Gr_{G,Spd Ĕ_1,≤μ_1}`, compatibly with the bundles on the curve. -/
theorem oneLeg (ν : G.Cochar) :
    ∃ c : TwistedPeriodData G b (RedGrp.oneLeg ν) ≅ GrG.oneLeg G ν,
      c.hom ≫ GrG.schubertLegs G (RedGrp.oneLeg ν) = TwistedPeriodData.legs G b (RedGrp.oneLeg ν) ∧
        VSheaf.stackMap c.hom ≫ BunG.beauvilleLaszlo G b ν = bundle G b (RedGrp.oneLeg ν) := sorry

/-- `GeneralShtukaTower.noLegs` [example]: with no legs, `Sht_{(G,b,∅),K}` is empty if `[b] ≠ 1`
in `B(G)`, and `Sht_{(G,1,∅),K}` is the constant sheaf `G(E)/K`. -/
theorem noLegs (K : G.Level) :
    (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk 1 → (GeneralShtukaTower G b G.noLegs K).IsEmpty) ∧
      Nonempty (GeneralShtukaTower G 1 G.noLegs K ≅ (VSheaf.ofTop p).obj (G.cosets K)) := sorry

-- Omitted: `BC(𝒪(1)) ∖ {0} ≅ Spd Ĕ_∞` for the completion `Ĕ_∞` of the compositum of `Ĕ` and the
-- Lubin–Tate extension of `E`; the interface has no Lubin–Tate extension.
/-- `GeneralShtukaTower.lubinTate` [example]: for `𝔾_m`, one leg, `μ = id` and `v(b) = -1`, so
that `E_b = 𝒪(1)`: `Sht_{(𝔾_m,b,μ),∞}` is the sheaf of pairs `(S♯, s)` with `s` a section of
`𝒪_{X_S}(1)` whose divisor is the image of `S♯`, that is
`(BC(𝒪(1)) ∖ {0}) ×_{Div¹} Spd Ĕ ≅ ℤ × (BC(𝒪(1)) ∖ {0})` (Fargues–Scholze II.2.2–II.2.4). -/
theorem lubinTate (c : (RedGrp.Gm F).ptsBreve)
    (hc : F.valBreve (RedGrp.Gm.ptsBreveEquiv F c) = Multiplicative.ofAdd (-1)) :
    (∃ t : infinite (RedGrp.Gm F) c (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) ⟶ Div1.cover F,
        IsPullback t
          (toGr _ c (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) ≫ TwistedPeriodData.legs _ c _ ≫
            RedGrp.legOne _ (RedGrp.Gm.cochar F 1) ≫
            (RedGrp.reflexExt _ (RedGrp.Gm.cochar F 1)).spdBreveMap)
          (Div1.coverProj F) (Div1.proj F)) ∧
      Nonempty (infinite (RedGrp.Gm F) c (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) ≅
        VSheaf.const p ℤ ⨯ Div1.cover F) := sorry

end GeneralShtukaTower

/-- `GeneralShtukaTower.oneLeg` [compatibility], second part: for `E = ℚ_p` and one leg the
tower is the one-leg tower of HS2/levels-and-tower-limit, compatibly with the period maps. -/
theorem GeneralShtukaTower.oneLeg_tower (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve)
    (μ : G.Cochar) :
    ∃ c : TwistedPeriodData G b (RedGrp.oneLeg μ) ≅ GrG.oneLeg G μ,
      c.hom ≫ GrG.schubertLegs G (RedGrp.oneLeg μ) = TwistedPeriodData.legs G b (RedGrp.oneLeg μ) ∧
        ∃ e : ∀ K : G.Level, GeneralShtukaTower G b (RedGrp.oneLeg μ) K ≅ LevelTower.level G b μ K,
          (∀ K : G.Level, (e K).hom ≫ LevelTower.period G b μ K =
            GeneralShtukaTower.periodMap G b (RedGrp.oneLeg μ) K ≫ c.hom) ∧
          ∀ (K' K : G.Level) (h : K' ≤ K),
            GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h ≫ (e K).hom =
              (e K').hom ≫ LevelTower.transition G b μ h := sorry

/-- `GeneralShtukaTower.integralModel` [compatibility]: for `E = ℚ_p` and `K = 𝒢(ℤ_p)`, with `𝒢`
smooth over `ℤ_p` with generic fibre `G` and connected special fibre, `Sht_{(G,b,μ•),K}` is the
moduli space of framed `𝒢`-shtukas on `S ×̇ Spa ℤ_p` (Scholze–Weinstein 23.1.1 and 23.5.3). -/
def GeneralShtukaTower.integralModel {G : RedGrp (LocalField.Qp p)} (𝒢 : G.Model)
    (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) :
    GeneralShtukaTower G b μ 𝒢.level ≅ ShtukaDatum 𝒢 b μ := sorry

/-- The identification with the moduli space of framed `𝒢`-shtukas is compatible with the period
maps to the twisted Grassmannian. -/
theorem GeneralShtukaTower.integralModel_period {G : RedGrp (LocalField.Qp p)} (𝒢 : G.Model)
    (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) :
    (GeneralShtukaTower.integralModel 𝒢 b μ).hom ≫ ShtukaDatum.genericPart 𝒢 b μ =
      GeneralShtukaTower.periodMap G b μ 𝒢.level := sorry

-- GeneralShtukaTower.no_legs_test
-- With no legs and any `E`: `Sht_{(G,b,∅),K}` is empty when `[b] ≠ 1`; for `b = 1` it is the
-- constant sheaf `G(E)/K`, on which `J_1(E) = G(E)` acts by left translation.
example (G : RedGrp F) (b : G.ptsBreve) (K : G.Level) :
    (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk 1 → (GeneralShtukaTower G b G.noLegs K).IsEmpty) ∧
      ∃ e : GeneralShtukaTower G 1 G.noLegs K ≅ (VSheaf.ofTop p).obj (G.cosets K),
        ∀ (j : G.sigmaCentralizer 1) (m : G.cosets K ⟶ G.cosets K)
          (_ : ∀ x : G.pts, m (QuotientGroup.mk x : G.pts ⧸ K.1.toSubgroup) =
            (QuotientGroup.mk (G.centralizerOne.symm j * x) : G.pts ⧸ K.1.toSubgroup)),
          (GeneralShtukaTower.framingAction G 1 G.noLegs K).constHom j ≫ e.hom =
            e.hom ≫ (VSheaf.ofTop p).map m := by
  sorry

-- GeneralShtukaTower.qp_test
-- For `E = ℚ_p` and `K = 𝒢(ℤ_p)`, `Sht_{(G,b,μ•),K}` is the sheaf of quadruples of
-- Scholze–Weinstein, Definition 23.1.1; and for one leg and `K'` compact open it is their
-- `Sht_{G,b,μ,K'}`.
example (G : RedGrp (LocalField.Qp p)) (𝒢 : G.Model) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) (ν : G.Cochar) (K' : G.Level) :
    (∃ e : GeneralShtukaTower G b μ 𝒢.level ≅ ShtukaDatum 𝒢 b μ,
        e.hom ≫ ShtukaDatum.legs 𝒢 b μ = GeneralShtukaTower.legs G b μ 𝒢.level) ∧
      ∃ e : GeneralShtukaTower G b (RedGrp.oneLeg ν) K' ≅ LevelTower.level G b ν K',
        e.hom ≫ LevelTower.period G b ν K' ≫ GrG.schubertLegs G (RedGrp.oneLeg ν) =
          GeneralShtukaTower.legs G b (RedGrp.oneLeg ν) K' := by
  sorry

-- GeneralShtukaTower.lubin_tate_test
-- For `𝔾_m`, one leg and `μ = id`: for `v(b) = -1` one has
-- `Sht_{(𝔾_m,b,μ),∞} ≅ ℤ × (BC(𝒪(1)) ∖ {0})` (which is `ℤ × Spd Ĕ_∞`) and
-- `Sht_{(𝔾_m,b,μ),𝒪_E^×} ≅ ℤ × Spd Ĕ`, in mixed and in equal characteristic; for every `b` with
-- `v(b) ≠ -1` the tower is empty.
-- Omitted: `Sht_{(𝔾_m,b,μ),1+π^n𝒪_E} ≅ ℤ × Spd Ĕ_n` and the name `Spd Ĕ_∞`; the interface has no
-- Lubin–Tate extensions.
example (b : (RedGrp.Gm F).ptsBreve) (K₀ K : (RedGrp.Gm F).Level)
    (h₀ : K₀.1.toSubgroup.map (RedGrp.Gm.ptsEquiv F).toMonoidHom = F.unitsInt) :
    (F.valBreve (RedGrp.Gm.ptsBreveEquiv F b) = Multiplicative.ofAdd (-1) →
        Nonempty
            (GeneralShtukaTower.infinite (RedGrp.Gm F) b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) ≅
              VSheaf.const p ℤ ⨯ Div1.cover F) ∧
          ∃ e : GeneralShtukaTower (RedGrp.Gm F) b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) K₀ ≅
              VSheaf.const p ℤ ⨯ ((RedGrp.Gm F).reflexField (RedGrp.Gm.cochar F 1)).spdBreve,
            e.hom ≫ prod.snd =
              GeneralShtukaTower.legs _ b _ K₀ ≫ RedGrp.legOne _ (RedGrp.Gm.cochar F 1)) ∧
      (F.valBreve (RedGrp.Gm.ptsBreveEquiv F b) ≠ Multiplicative.ofAdd (-1) →
        (GeneralShtukaTower (RedGrp.Gm F) b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) K).IsEmpty ∧
          (GeneralShtukaTower.infinite (RedGrp.Gm F) b
            (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).IsEmpty) := by
  sorry

-- GeneralShtukaTower.one_leg_test
-- For one leg the map `Gr^tw_{G,Spd Ĕ_1,≤μ_1} → Gr_{G,Spd Ĕ_1,≤μ_1}`, sending
-- `(S♯, P_η, φ_P, ι_r)` to the modification of the trivial torsor at `S♯` defined by `ι_r`, is an
-- isomorphism over `Spd Ĕ_1`.
example (G : RedGrp F) (b : G.ptsBreve) (ν : G.Cochar) :
    ∃ c : TwistedPeriodData G b (RedGrp.oneLeg ν) ⟶ GrG.oneLeg G ν,
      IsIso c ∧
        c ≫ GrG.schubertLegs G (RedGrp.oneLeg ν) =
          TwistedPeriodData.legs G b (RedGrp.oneLeg ν) := by
  sorry

-- LevelTower.noLegs_test
-- With no legs and `b = 1`: `Sht_{G,1,∅,K} = underline{G(ℚ_p)/K} × Spd k`, the transition map for
-- `K' ⊂ K` is induced by `gK' ↦ gK`, and `lim_K Sht_{G,1,∅,K} = underline{G(ℚ_p)} × Spd k`, whose
-- `S`-points are the continuous maps `|S| → G(ℚ_p)`, not only the locally constant ones.
example (G : RedGrp (LocalField.Qp p)) :
    (∃ e : ∀ K : G.Level,
        GeneralShtukaTower G 1 G.noLegs K ≅ (VSheaf.ofTop p).obj (G.cosets K),
        ∀ (K' K : G.Level) (h : K' ≤ K),
          GeneralShtukaTower.transition G 1 G.noLegs h ≫ (e K).hom =
            (e K').hom ≫ (VSheaf.ofTop p).map (G.cosetsMap h)) ∧
      Nonempty (GeneralShtukaTower.infinite G 1 G.noLegs ≅ VSheaf.const p G.pts) := by
  sorry

end GeneralLocalField

/-! ### HS2/multi-leg-period-and-representability, HS2/no-legs-and-basic-duality and
HS2/structure-map-compactifiable -/

section MultiLeg

/-- HS2/multi-leg-period-and-representability (Scholze–Weinstein, Theorem 23.1.4, Proposition
23.5.2 and Corollary 23.5.3). For `E = ℚ_p` and a local shtuka datum `(𝒢, b, μ•)` with any number
of legs:
(a) the period map `π_GM : Sht_{𝒢,b,μ•} → Gr^tw_{G,B,≤μ•}` is étale;
(b) its image is the open admissible locus, over which there is the pro-étale `G(ℚ_p)`-torsor
`ℙ_η`, and `Sht_{𝒢,b,μ•}` is the sheaf of `𝒢(ℤ_p)`-lattices in `ℙ_η`;
(c) `Sht_{𝒢,b,μ•}` is a locally spatial diamond, and so is `Sht_{G,b,μ•,K}` for every compact open
`K`, which is étale over `Gr^tw_{G,B,≤μ•}`;
(d) `Gr^tw_{G,B,≤μ•} → B` is proper and representable in spatial diamonds;
(e) over the open locus `U` of `B` where no leg is a non-trivial Frobenius translate of another
(`S_i♯ ≠ φⁿ(S_j♯)` for `i ≠ j` and `n ≠ 0`; legs may coincide), `Sht_{G,b,μ•,∞}` is the pullback
`M_∞` of `Mod^I_{1,b,≤μ•}` along `B → ∏_i Div¹_{F_i}`. No identification with `M_∞` is asserted
on the Frobenius-twisted partial diagonals. -/
theorem multiLegPeriodAndRepresentability (G : RedGrp (LocalField.Qp p)) (𝒢 : G.Model)
    (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) :
    VStack.etale p (VSheaf.stackMap (ShtukaDatum.genericPart 𝒢 b μ)) ∧
      VStack.openImmersion p
        (VSheaf.stackMap (BunG.trivLocus.incl (GeneralShtukaTower.bundle G b μ))) ∧
      (∃ t : ShtukaDatum 𝒢 b μ ⟶ GeneralShtukaTower.admissible G b μ,
        t ≫ BunG.trivLocus.incl (GeneralShtukaTower.bundle G b μ) =
            ShtukaDatum.genericPart 𝒢 b μ ∧
          Sheaf.IsLocallySurjective t) ∧
      (∃ q : GeneralShtukaTower.infinite G b μ ⟶ ShtukaDatum 𝒢 b μ,
        q ≫ ShtukaDatum.genericPart 𝒢 b μ = GeneralShtukaTower.toGr G b μ ∧
          ((GeneralShtukaTower.groupAction G b μ).restrict 𝒢.level.1.toSubgroup).IsTorsor q) ∧
      VSheaf.isLocSpatialDiamond p (ShtukaDatum 𝒢 b μ) ∧
      (∀ K : G.Level,
        VSheaf.isLocSpatialDiamond p (GeneralShtukaTower G b μ K) ∧
          VStack.etale p (VSheaf.stackMap (GeneralShtukaTower.periodMap G b μ K))) ∧
      VStack.proper p (VSheaf.stackMap (TwistedPeriodData.legs G b μ)) ∧
      VStack.reprSpatial p (VSheaf.stackMap (TwistedPeriodData.legs G b μ)) ∧
      ∃ c : pullback (GeneralShtukaTower.toGr G b μ ≫ TwistedPeriodData.legs G b μ)
            (TwistedPeriodData.bdLocusIncl G μ) ≅
          pullback (pullback.snd (FramedModification.legs G 1 b μ) (G.legBaseToDivBase μ))
            (TwistedPeriodData.bdLocusIncl G μ),
        c.hom ≫ pullback.snd _ _ = pullback.snd _ _ :=
  sorry
-- Omitted: in (e), that the isomorphism `c` is the one given by the lattice description and is
-- equivariant for `G(ℚ_p) × J_b(ℚ_p)`; no action of `J_b(ℚ_p)` on `GeneralShtukaTower.infinite`
-- is declared. For one leg both equivariances are stated in `FramedModification.infiniteLevel`.

-- Omitted: the duality isomorphism is one over `Spd F̆`. The interface does not identify the
-- field of definition of `μ` for `G` with that of `μ̌` for `J_b`; the statement is made over
-- `Spd ℚ̆_p`. Omitted: applying the construction twice returns `(G, b, μ)` and the identity.
/-- HS2/no-legs-and-basic-duality. For `E = ℚ_p`:
(a) (Scholze–Weinstein, Proposition 23.2.1) with no legs, `Sht_{𝒢,b,∅}` is empty if `b` is not
in the trivial class of `B(G)`, and `Sht_{𝒢,1,∅} ≅ underline{G(ℚ_p)/𝒢(ℤ_p)} × Spd k`;
(b) (Corollary 23.3.2) for `b` basic and the dual datum `(Ǧ, b̌, μ̌) = (J_b, b⁻¹, μ⁻¹)`, with
`J_b(ℚ̆_p) = G(ℚ̆_p)`, there is an isomorphism `Sht_{G,b,μ,∞} ≅ Sht_{Ǧ,b̌,μ̌,∞}`, equivariant for
`G(ℚ_p) × J_b(ℚ_p)`: on the left `G(ℚ_p)` acts through `Aut(E_1)` and `J_b(ℚ_p)` through
`Aut(E_b)`; on the right `J_b(ℚ_p) = Ǧ(ℚ_p)` acts through the automorphisms of the trivial
`Ǧ`-torsor and `G(ℚ_p) = J_b̌(ℚ_p)` through those of `E_b̌`. For `b` not basic no dual datum is
defined. -/
theorem noLegsAndBasicDuality (G : RedGrp (LocalField.Qp p)) (𝒢 : G.Model) :
    (∀ c : G.ptsBreve, RedGrp.BofG.mk c ≠ RedGrp.BofG.mk 1 →
        (ShtukaDatum 𝒢 c G.noLegs).IsEmpty) ∧
      Nonempty (ShtukaDatum 𝒢 1 G.noLegs ≅ (VSheaf.ofTop p).obj (G.cosets 𝒢.level)) ∧
      ∀ (b : G.ptsBreve) (μ : G.Cochar) (hb : RedGrp.BofG.mk b ∈ G.basic)
        (b' : (G.innerForm b).ptsBreve) (_ : G.innerFormBreve b hb b' = b⁻¹)
        (μ' : (G.innerForm b).Cochar) (_ : μ' = G.innerFormCochar b hb μ.dual),
        ∃ e : admissiblePeriodTorsor G b μ ≅ admissiblePeriodTorsor (G.innerForm b) b' μ',
          e.hom ≫ admissiblePeriodTorsor.toBase (G.innerForm b) b' μ' ≫
                (RedGrp.reflexExt _ μ').spdBreveMap =
              admissiblePeriodTorsor.toBase G b μ ≫ (G.reflexExt μ).spdBreveMap ∧
            (∃ ι : G.pts ≃ₜ* (G.innerForm b).sigmaCentralizer b',
                (∀ g, G.innerFormBreve b hb (ι g : (G.innerForm b).ptsBreve) = G.incl g) ∧
                VSheaf.Action.EquivariantAlong
                  (VSheaf.constGrpMap p (ContinuousMonoidHom.toContinuousMonoidHom ι))
                  (admissiblePeriodTorsor.groupAction G b μ)
                  (admissiblePeriodTorsor.framingAction (G.innerForm b) b' μ') e.hom) ∧
            VSheaf.Action.EquivariantAlong
              (VSheaf.constGrpMap p
                (ContinuousMonoidHom.toContinuousMonoidHom (G.innerFormPts b).symm))
              (admissiblePeriodTorsor.framingAction G b μ)
              (admissiblePeriodTorsor.groupAction (G.innerForm b) b' μ') e.hom := sorry

/-- HS2/structure-map-compactifiable, (a)–(e). For a nonarchimedean local field `E` of either
characteristic (part (e); parts (a)–(d) are the case `E = ℚ_p`), a datum with any number of legs
and `K` compact open, the structure map `f_K : Sht_{(G,b,μ•),K} → B` factors as `g ∘ π_K` through
the twisted Grassmannian, where:
(a) `π_K` is étale and separated;
(b) `g` is proper, representable in spatial diamonds and locally of finite `dim.trg`;
(c) hence `f_K` is separated, representable in locally spatial diamonds, compactifiable and
locally of finite `dim.trg`: the standing hypotheses of Fargues–Scholze VII.5 for `Rf_{K!}` and
for the comparison of `f_{K♮}` with it;
(d) `f_K` is in general not quasicompact: for no legs and `b = 1` it is
`underline{G(E)/K} × Spd k → Spd k`. -/
theorem structureMapCompactifiable (G : RedGrp F) (b : G.ptsBreve) {I : Type}
    [Finite I] (μ : I → G.Cochar) (K : G.Level) :
    GeneralShtukaTower.periodMap G b μ K ≫ TwistedPeriodData.legs G b μ =
        GeneralShtukaTower.legs G b μ K ∧
      VStack.etale p (VSheaf.stackMap (GeneralShtukaTower.periodMap G b μ K)) ∧
      VStack.separated p (VSheaf.stackMap (GeneralShtukaTower.periodMap G b μ K)) ∧
      VStack.proper p (VSheaf.stackMap (TwistedPeriodData.legs G b μ)) ∧
      VStack.reprSpatial p (VSheaf.stackMap (TwistedPeriodData.legs G b μ)) ∧
      VStack.locFiniteDimTrg p (VSheaf.stackMap (TwistedPeriodData.legs G b μ)) ∧
      VStack.separated p (VSheaf.stackMap (GeneralShtukaTower.legs G b μ K)) ∧
      VStack.reprLocSpatial p (VSheaf.stackMap (GeneralShtukaTower.legs G b μ K)) ∧
      VStack.compactifiable p (VSheaf.stackMap (GeneralShtukaTower.legs G b μ K)) ∧
      VStack.locFiniteDimTrg p (VSheaf.stackMap (GeneralShtukaTower.legs G b μ K)) ∧
      (Infinite (G.pts ⧸ K.1.toSubgroup) →
        ¬ VStack.quasicompact p
          (VSheaf.stackMap (GeneralShtukaTower.legs G 1 G.noLegs K))) := sorry

/-- HS2/structure-map-compactifiable, (f). Two bundles. For `b`, `b'`, a tuple `μ•` and a compact
open subgroup `K ⊂ J_{b'}(E)`, the structure map `Mod^I_{b,b',≤μ•}/K → D_I` of the level quotient
of the space of HS2/framed-bundle-fibres is representable in locally spatial diamonds,
compactifiable and locally of finite `dim.trg`; by inversion of modifications the same holds for
the quotient by a compact open subgroup of `J_b(E)`. -/
theorem structureMapCompactifiable_twoBundles (G : RedGrp F) (b b' : G.ptsBreve) {I : Type}
    [Finite I] (μ : I → G.Cochar) :
    (∀ K : OpenSubgroup (G.sigmaCentralizer b'), IsCompact (K : Set (G.sigmaCentralizer b')) →
      VStack.reprLocSpatial p
          (VStack.quotient.desc ((FramedModification.targetActionJ G b b' μ).restrict K.toSubgroup)
            (FramedModification.legs G b b' μ)
            (fun S _ x => FramedModification.targetAction_legs G b b' μ S _ x)) ∧
        VStack.compactifiable p
          (VStack.quotient.desc ((FramedModification.targetActionJ G b b' μ).restrict K.toSubgroup)
            (FramedModification.legs G b b' μ)
            (fun S _ x => FramedModification.targetAction_legs G b b' μ S _ x)) ∧
        VStack.locFiniteDimTrg p
          (VStack.quotient.desc ((FramedModification.targetActionJ G b b' μ).restrict K.toSubgroup)
            (FramedModification.legs G b b' μ)
            (fun S _ x => FramedModification.targetAction_legs G b b' μ S _ x))) ∧
      ∀ K : OpenSubgroup (G.sigmaCentralizer b), IsCompact (K : Set (G.sigmaCentralizer b)) →
        VStack.reprLocSpatial p
            (VStack.quotient.desc
              ((FramedModification.sourceActionJ G b b' μ).restrict K.toSubgroup)
              (FramedModification.legs G b b' μ)
              (fun S _ x => FramedModification.sourceAction_legs G b b' μ S _ x)) ∧
          VStack.compactifiable p
            (VStack.quotient.desc
              ((FramedModification.sourceActionJ G b b' μ).restrict K.toSubgroup)
              (FramedModification.legs G b b' μ)
              (fun S _ x => FramedModification.sourceAction_legs G b b' μ S _ x)) ∧
          VStack.locFiniteDimTrg p
            (VStack.quotient.desc
              ((FramedModification.sourceActionJ G b b' μ).restrict K.toSubgroup)
              (FramedModification.legs G b b' μ)
              (fun S _ x => FramedModification.sourceAction_legs G b b' μ S _ x)) := sorry

/-- HS2/structure-map-compactifiable, (f), last assertion: the structure map of the level quotient
is in general not quasicompact. For no legs and `b = b' = 1` it is
`underline{G(E)/K} × Spd k → Spd k`. -/
theorem structureMapCompactifiable_twoBundles_notQuasicompact (G : RedGrp F)
    (K : OpenSubgroup (G.sigmaCentralizer 1)) (hK : IsCompact (K : Set (G.sigmaCentralizer 1)))
    (hinf : Infinite ((G.sigmaCentralizer 1) ⧸ K.toSubgroup)) :
    ¬ VStack.quasicompact p
      (VStack.quotient.desc
        ((FramedModification.targetActionJ G 1 1 G.noLegs).restrict K.toSubgroup)
        (FramedModification.legs G 1 1 G.noLegs)
        (fun S _ x => FramedModification.targetAction_legs G 1 1 G.noLegs S _ x)) := sorry

end MultiLeg

/-! ### HS2/minuscule-rigidification: local Shimura varieties -/

section MinusculeRigidification

namespace LevelTower

variable (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)

/-- The transition maps are maps over `Spd F̆`. -/
theorem transition_toBase {K' K : G.Level} (h : K' ≤ K) :
    transition G b μ h ≫ toBase G b μ K = toBase G b μ K' := by
  rw [toBase, ← Category.assoc, transition_period]
  rfl

/-- The isomorphisms of the elements of `G(ℚ_p)` are maps over `Spd F̆`. -/
theorem heckeAction_toBase (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    (heckeAction G b μ g K K' h).hom ≫ toBase G b μ K' = toBase G b μ K := by
  rw [toBase, ← Category.assoc, (heckeAction_transition G b μ g K K' K K' le_rfl le_rfl h h).2]
  rfl

/-- The action of `J_b(ℚ_p)` on the levels is an action over `Spd F̆`. -/
theorem sigmaCentralizerAction_toBase (K : G.Level) :
    (sigmaCentralizerAction G b μ K).Invariant (toBase G b μ K) := sorry

/-- `Sht_{G,b,μ,K}` over `Spd F̆`. -/
abbrev levelOver (K : G.Level) : Over (G.reflexField μ).spdBreve := Over.mk (toBase G b μ K)

/-- The period map `π_K`, over `Spd F̆`. -/
abbrev periodOver (K : G.Level) : levelOver G b μ K ⟶ GrG.oneLegOver G μ :=
  Over.homMk (period G b μ K) rfl

/-- The transition map, over `Spd F̆`. -/
abbrev transitionOver {K' K : G.Level} (h : K' ≤ K) : levelOver G b μ K' ⟶ levelOver G b μ K :=
  Over.homMk (transition G b μ h) (transition_toBase G b μ h)

/-- The isomorphism of `g ∈ G(ℚ_p)`, over `Spd F̆`. -/
abbrev heckeOver (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    levelOver G b μ K ⟶ levelOver G b μ K' :=
  Over.homMk (heckeAction G b μ g K K' h).hom (heckeAction_toBase G b μ g K K' h)

/-- The automorphism of `j ∈ J_b(ℚ_p)`, over `Spd F̆`. -/
abbrev framingOver (K : G.Level) (j : G.sigmaCentralizer b) :
    levelOver G b μ K ⟶ levelOver G b μ K :=
  Over.homMk ((sigmaCentralizerAction G b μ K).constHom j)
    (VSheaf.Action.constHom_comp (sigmaCentralizerAction_toBase G b μ K) j)

end LevelTower

/-- A rigidification of the level `K`: a rigid space `M` over `F̆`, an étale morphism
`π : M → Fl_{G,μ,F̆}` and an isomorphism `c : M^♦ ≅ Sht_{G,b,μ,K}` over `Spd F̆` with
`BB ∘ π_GM ∘ c = π^♦` (the period map of `Sht_{G,b,μ,K}` then lands in the Schubert cell, on which
the Białynicki-Birula map is defined). -/
structure RigidTriple (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (K : G.Level) where
  /-- The rigid space `M` over `F̆`. -/
  space : RigSp (G.reflexField μ)
  /-- The period morphism `π : M → Fl_{G,μ,F̆}`. -/
  periodMap : space ⟶ RigSp.flag G μ
  etale : RigSp.etale _ periodMap
  /-- The comparison isomorphism `c : M^♦ ≅ Sht_{G,b,μ,K}` over `Spd F̆`. -/
  comparison : (RigSp.diamond (G.reflexField μ)).obj space ≅ LevelTower.levelOver G b μ K
  comparison_period :
    ∃ t : (RigSp.diamond (G.reflexField μ)).obj space ⟶ GrG.cellOver G μ,
      t ≫ GrG.cellInclOver G μ = comparison.hom ≫ LevelTower.periodOver G b μ K ∧
        t ≫ GrG.bialynickiBirula G μ = (RigSp.diamond (G.reflexField μ)).map periodMap

/-- `Rigidification.space` [projection]: the rigid space `M_{G,b,μ,K}` over `F̆`, for `μ`
minuscule; for other `μ` no statement uses it. -/
def Rigidification.space (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (K : G.Level) : RigSp (G.reflexField μ) := sorry

-- Omitted: the image of `π_K` is the open subspace `Fl^a ⊂ Fl_{G,μ,F̆}` whose diamond is the
-- admissible locus (the interface has no open subspaces of rigid spaces); the geometric fibres
-- of `π_K` over it are those of the period map of `Sht_{G,b,μ,K}`, by `comparison`.
/-- `Rigidification.periodMap` [projection]: `π_K : M_{G,b,μ,K} → Fl_{G,μ,F̆}`, for `μ`
minuscule; for other `μ` no statement uses it. -/
def Rigidification.periodMap (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (K : G.Level) : Rigidification.space G b μ K ⟶ RigSp.flag G μ := sorry

variable (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar) (hμ : μ.IsMinuscule)

namespace Rigidification

include hμ in
/-- `π_K` is étale. -/
theorem periodMap_etale (K : G.Level) : RigSp.etale _ (periodMap G b μ K) := sorry

-- Omitted: the equivalence of étale sites induced by `c_K`; the interface has no étale sites.
/-- `Rigidification.comparison` [projection]: `c_K : M_{G,b,μ,K}^♦ ≅ Sht_{G,b,μ,K}` over
`Spd F̆`. -/
def comparison (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (hμ : μ.IsMinuscule) (K : G.Level) :
    (RigSp.diamond (G.reflexField μ)).obj (space G b μ K) ≅ LevelTower.levelOver G b μ K := sorry

/-- `BB ∘ π_GM ∘ c_K = π_K^♦`: under `c_K` the period map of `Sht_{G,b,μ,K}` lands in the Schubert
cell, and its composite with the Białynicki-Birula map is the diamond of `π_K`. -/
theorem comparison_period (K : G.Level) :
    ∃ t : (RigSp.diamond (G.reflexField μ)).obj (space G b μ K) ⟶ GrG.cellOver G μ,
      t ≫ GrG.cellInclOver G μ = (comparison G b μ hμ K).hom ≫ LevelTower.periodOver G b μ K ∧
        t ≫ GrG.bialynickiBirula G μ =
          (RigSp.diamond (G.reflexField μ)).map (periodMap G b μ K) := sorry

include hμ in
/-- `c_K` induces a homeomorphism `|M_{G,b,μ,K}| ≅ |Sht_{G,b,μ,K}|`. -/
theorem comparison_top (K : G.Level) :
    Nonempty ((RigSp.toTop _).obj (space G b μ K) ≅ (LevelTower.level G b μ K).top) := sorry

end Rigidification

/-- HS2/minuscule-rigidification, `Rigidification` [data]. For a minuscule datum `(G, b, μ)` over
`ℚ_p` and `K ⊂ G(ℚ_p)` compact open: the rigid space `M_{G,b,μ,K}` over `F̆`, the étale morphism
`π_K : M_{G,b,μ,K} → Fl_{G,μ,F̆}` and the isomorphism `c_K : M_{G,b,μ,K}^♦ ≅ Sht_{G,b,μ,K}` over
`Spd F̆` with `BB ∘ π_GM ∘ c_K = π_K^♦`. When `[b] ∈ B(G, μ⁻¹)` the tower `(M_{G,b,μ,K})_K` is the
local Shimura variety of `(G, b, μ)`. For `μ` not minuscule no rigid space is constructed. -/
def Rigidification (K : G.Level) : RigidTriple G b μ K where
  space := Rigidification.space G b μ K
  periodMap := Rigidification.periodMap G b μ K
  etale := Rigidification.periodMap_etale G b μ hμ K
  comparison := Rigidification.comparison G b μ hμ K
  comparison_period := Rigidification.comparison_period G b μ hμ K

namespace Rigidification

include hμ in
/-- `M_{G,b,μ,K}` is partially proper over `F̆`, and smooth of pure dimension
`⟨2ρ, μ⟩ = dim Fl_{G,μ}` when it is not empty. (It is in general not quasicompact.) -/
theorem space_spec (K : G.Level) :
    RigSp.partiallyProper _ (space G b μ K) ∧
      (RedGrp.BofG.mk b ∈ G.BGmu μ.dual →
        RigSp.smoothOfDim _ (RedGrp.Cochar.twoRho μ) (space G b μ K)) := sorry
-- Omitted: that the space is in general not quasicompact; for `𝔾_m` it is a disjoint union of
-- copies of a point indexed by `ℤ` (`Rigidification.torus_test`).

/-- `Rigidification.unique` [extensionality]: for a second triple `(M', π', c')` there is exactly
one isomorphism `M_{G,b,μ,K} ≅ M'` over `Fl_{G,μ,F̆}` carrying `c_K` to `c'`. -/
theorem unique (K : G.Level) (R : RigidTriple G b μ K) :
    ∃! e : space G b μ K ≅ R.space,
      e.hom ≫ R.periodMap = periodMap G b μ K ∧
        (RigSp.diamond (G.reflexField μ)).map e.hom ≫ R.comparison.hom =
          (comparison G b μ hμ K).hom := sorry

/-- `Rigidification.lift` [universal-property] (Scholze–Weinstein 10.4.2): for a rigid space `U`
étale over `Fl_{G,μ,F̆}`, `f ↦ f^♦` is a bijection from the morphisms `U → M_{G,b,μ,K}` over
`Fl_{G,μ,F̆}` to the morphisms `U^♦ → Sht_{G,b,μ,K}` over `Fl_{G,μ,F̆}^♦`. -/
theorem lift (K : G.Level) (U : RigSp (G.reflexField μ)) (u : U ⟶ RigSp.flag G μ)
    (hu : RigSp.etale _ u)
    (g : (RigSp.diamond (G.reflexField μ)).obj U ⟶ LevelTower.levelOver G b μ K)
    (hg : ∃ t : (RigSp.diamond (G.reflexField μ)).obj U ⟶ GrG.cellOver G μ,
      t ≫ GrG.cellInclOver G μ = g ≫ LevelTower.periodOver G b μ K ∧
        t ≫ GrG.bialynickiBirula G μ = (RigSp.diamond (G.reflexField μ)).map u) :
    ∃! f : U ⟶ space G b μ K,
      f ≫ periodMap G b μ K = u ∧
        (RigSp.diamond (G.reflexField μ)).map f ≫ (comparison G b μ hμ K).hom = g := sorry

/-- For every finite extension `L` of `F̆`: `M_{G,b,μ,K}(L) = Sht_{G,b,μ,K}(Spd L)`
(Scholze–Weinstein 10.2.3). -/
theorem lift_points (K : G.Level) (L : (G.reflexField μ).BreveExt) :
    Function.Bijective
      (fun y : L.spa ⟶ space G b μ K =>
        L.diamondSpa.inv ≫ (RigSp.diamond (G.reflexField μ)).map y ≫
          (comparison G b μ hμ K).hom) := sorry

end Rigidification

/-- `Rigidification.transition` [functoriality]: for `K' ⊂ K` the morphism
`M_{G,b,μ,K'} → M_{G,b,μ,K}`, for `μ` minuscule; for other `μ` no statement uses it. -/
def Rigidification.transition (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    {K' K : G.Level} (h : K' ≤ K) :
    Rigidification.space G b μ K' ⟶ Rigidification.space G b μ K := sorry

namespace Rigidification

/-- The transition morphism is a morphism over `Fl_{G,μ,F̆}`, finite étale of degree `[K : K']`,
and its diamond is the transition map of the tower of shtukas. -/
theorem transition_spec {K' K : G.Level} (h : K' ≤ K) :
    transition G b μ h ≫ periodMap G b μ K = periodMap G b μ K' ∧
      RigSp.finiteEtaleOfDegree _ (K'.1.toSubgroup.relIndex K.1.toSubgroup)
        (transition G b μ h) ∧
      (RigSp.diamond (G.reflexField μ)).map (transition G b μ h) ≫
          (comparison G b μ hμ K).hom =
        (comparison G b μ hμ K').hom ≫ LevelTower.transitionOver G b μ h := sorry

include hμ in
/-- The transition morphism is the identity for `K' = K`. -/
theorem transition_id (K : G.Level) : transition G b μ (le_refl K) = 𝟙 _ := sorry

include hμ in
/-- The transition morphisms are compatible with composition. -/
theorem transition_comp {K'' K' K : G.Level} (h : K'' ≤ K') (h' : K' ≤ K) :
    transition G b μ h ≫ transition G b μ h' = transition G b μ (h.trans h') := sorry

-- Omitted: for `K'` normal in `K` the transition morphism is Galois with group `K/K'`; this is
-- `LevelTower.transition_torsor` for the diamonds.
/-- `Rigidification.heckeAction` [functoriality]: for `g ∈ G(ℚ_p)` an isomorphism
`M_{G,b,μ,K} ≅ M_{G,b,μ,gKg⁻¹}`. -/
def heckeAction (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (hμ : μ.IsMinuscule) (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    space G b μ K ≅ space G b μ K' := sorry

/-- The isomorphism of `g` is an isomorphism over `Fl_{G,μ,F̆}`, compatible with the transition
morphisms and with products in `G(ℚ_p)`; its diamond is the isomorphism `α ↦ α ∘ g⁻¹` of the tower
of shtukas (`LevelTower.heckeAction`). -/
theorem heckeAction_spec (g : G.pts) (K K' : G.Level)
    (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    (heckeAction G b μ hμ g K K' h).hom ≫ periodMap G b μ K' = periodMap G b μ K ∧
      (RigSp.diamond (G.reflexField μ)).map (heckeAction G b μ hμ g K K' h).hom ≫
          (comparison G b μ hμ K').hom =
        (comparison G b μ hμ K).hom ≫ LevelTower.heckeOver G b μ g K K' h ∧
      (∀ (g' : G.pts) (K'' : G.Level)
          (h' : K''.1.toSubgroup = K'.1.toSubgroup.map (MulAut.conj g').toMonoidHom)
          (h'' : K''.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj (g' * g)).toMonoidHom),
          heckeAction G b μ hμ g K K' h ≪≫ heckeAction G b μ hμ g' K' K'' h' =
            heckeAction G b μ hμ (g' * g) K K'' h'') ∧
      ∀ (K₁ K₁' : G.Level) (h₁ : K₁ ≤ K) (h₁' : K₁' ≤ K')
        (hc : K₁'.1.toSubgroup = K₁.1.toSubgroup.map (MulAut.conj g).toMonoidHom),
        transition G b μ h₁ ≫ (heckeAction G b μ hμ g K K' h).hom =
          (heckeAction G b μ hμ g K₁ K₁' hc).hom ≫ transition G b μ h₁' := sorry

/-- `Rigidification.framingAction` [functoriality]: `J_b(ℚ_p)` acts on `M_{G,b,μ,K}`, for `μ`
minuscule; for other `μ` no statement uses it. -/
def framingAction (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar) (K : G.Level) :
    G.sigmaCentralizer b →* Aut (space G b μ K) := sorry

/-- The action of `J_b(ℚ_p)` commutes with the isomorphisms of the elements of `G(ℚ_p)` and with
the transition morphisms; `π_K` is equivariant for the action of `J_b(ℚ_p) ⊂ G(ℚ̆_p)` on
`Fl_{G,μ,F̆}`; and the diamond of the action is the action on `Sht_{G,b,μ,K}`. -/
theorem framingAction_spec (K : G.Level) (j : G.sigmaCentralizer b) :
    (framingAction G b μ K j).hom ≫ periodMap G b μ K =
        periodMap G b μ K ≫ (RigSp.flagAction G μ j.1).hom ∧
      (RigSp.diamond (G.reflexField μ)).map (framingAction G b μ K j).hom ≫
          (comparison G b μ hμ K).hom =
        (comparison G b μ hμ K).hom ≫ LevelTower.framingOver G b μ K j ∧
      (∀ (K' : G.Level) (h : K' ≤ K),
        (framingAction G b μ K' j).hom ≫ transition G b μ h =
          transition G b μ h ≫ (framingAction G b μ K j).hom) ∧
      ∀ (g : G.pts) (K' : G.Level)
        (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom),
        (framingAction G b μ K j).hom ≫ (heckeAction G b μ hμ g K K' h).hom =
          (heckeAction G b μ hμ g K K' h).hom ≫ (framingAction G b μ K' j).hom := sorry

include hμ in
/-- `Rigidification.nonempty_iff` [characterisation]: `M_{G,b,μ,K} ≠ ∅` if and only if
`[b] ∈ B(G, μ⁻¹)`, that is, `κ(b) = -μ♯` and `ν_b ≤ (μ⁻¹)^♦`. -/
theorem nonempty_iff (K : G.Level) :
    Nonempty ((RigSp.toTop _).obj (space G b μ K)) ↔ RedGrp.BofG.mk b ∈ G.BGmu μ.dual := sorry

end Rigidification

-- Omitted: `π` is the Gross–Hopkins period map onto `ℙ^{n-1}`; the interface has no projective
-- space, and surjectivity is stated instead.
/-- `Rigidification.lubinTate` [example]: for `GL_n` (`n ≥ 1`), `μ = (1, 0, …, 0)`, `b` basic
with `E_b ≅ 𝒪(1/n)` and `K = GL_n(ℤ_p)`: `M_{GL_n,b,μ,GL_n(ℤ_p)}` is `∐_{h ∈ ℤ}` of open unit balls
of dimension `n - 1`, the generic fibre of the Lubin–Tate deformation space with quasi-isogeny,
and the period map is surjective. -/
theorem Rigidification.lubinTate (n : ℕ) (hn : 1 ≤ n) (v : {v : Fin n → ℤ // Antitone v})
    (hv : v.1 = fun i => if i.1 = 0 then 1 else 0)
    (hmin : (RedGrp.GLn.cochar (LocalField.Qp p) n v).IsMinuscule)
    (c : (RedGrp.GLn (LocalField.Qp p) n).ptsBreve)
    (hc : RedGrp.BofG.mk c ∈ (RedGrp.GLn (LocalField.Qp p) n).basic)
    (hc' : RedGrp.BofG.mk c ∈
      (RedGrp.GLn (LocalField.Qp p) n).BGmu (RedGrp.GLn.cochar _ n v).dual)
    (K : (RedGrp.GLn (LocalField.Qp p) n).Level)
    (hK : K.1.toSubgroup.map (RedGrp.GLn.ptsEquiv (LocalField.Qp p) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p))).range) :
    Nonempty (Rigidification.space _ c (RedGrp.GLn.cochar _ n v) K ≅
        ∐ fun _ : ℤ => RigSp.openBall _ (n - 1)) ∧
      Function.Surjective
        ((RigSp.toTop _).map (Rigidification.periodMap _ c (RedGrp.GLn.cochar _ n v) K)) :=
  sorry

-- Rigidification.lubin_tate_test
-- For `GL_2`, `μ = (1,0)` and `b` basic with `κ(b) = -1` (`E_b ≅ 𝒪(1/2)`; `b` is the Frobenius of
-- the covariant Dieudonné module of the formal group of height 2 and dimension 1, in the
-- normalisation of Scholze–Weinstein in which `μ_{p^∞}` has Frobenius `p⁻¹σ`):
-- `M_{GL_2,b,μ,GL_2(ℤ_p)} ≅ ∐_{h ∈ ℤ} D̊`; the period map is surjective; and for `m ≥ 1` the map
-- `M_{GL_2,b,μ,1+p^mM_2(ℤ_p)} → M_{GL_2,b,μ,GL_2(ℤ_p)}` is finite étale of degree
-- `p^{4(m-1)}(p² - 1)(p² - p)`.
-- Omitted: the target `ℙ¹` of the period map, and the bijection of its geometric fibres with
-- `GL_2(ℚ_p)/GL_2(ℤ_p)` (which is `ShtukaDatum.lubinTate_test` for the diamonds).
example (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![1, 0])
    (hmin : (RedGrp.GLn.cochar (LocalField.Qp p) 2 v).IsMinuscule)
    (b : (RedGrp.GLn (LocalField.Qp p) 2).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn (LocalField.Qp p) 2).basic)
    (hb' : RedGrp.BofG.mk b ∈
      (RedGrp.GLn (LocalField.Qp p) 2).BGmu (RedGrp.GLn.cochar _ 2 v).dual)
    (m : ℕ) (hm : 1 ≤ m) (K Kₘ : (RedGrp.GLn (LocalField.Qp p) 2).Level)
    (hK : ∀ g, g ∈ K.1 ↔ ∃ a : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
        Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) a)
    (hKₘ : ∀ g, g ∈ Kₘ.1 ↔ ∃ a : Matrix.GeneralLinearGroup (Fin 2) ℤ_[p],
      RedGrp.GLn.ptsEquiv (LocalField.Qp p) 2 g =
          Matrix.GeneralLinearGroup.map (PadicInt.Coe.ringHom (p := p)) a ∧
        ∀ i j, (p : ℤ_[p]) ^ m ∣ (a.1 - 1) i j)
    (h : Kₘ ≤ K) :
    Nonempty (Rigidification.space _ b (RedGrp.GLn.cochar _ 2 v) K ≅
        ∐ fun _ : ℤ => RigSp.openBall _ 1) ∧
      Function.Surjective
        ((RigSp.toTop _).map (Rigidification.periodMap _ b (RedGrp.GLn.cochar _ 2 v) K)) ∧
      RigSp.finiteEtaleOfDegree _ (p ^ (4 * (m - 1)) * (p ^ 2 - 1) * (p ^ 2 - p))
        (Rigidification.transition _ b (RedGrp.GLn.cochar _ 2 v) h) := by
  sorry

-- Rigidification.orientation_test
-- For `GL_2`, the same `b` (basic, `κ(b) = -1`, so `[b] ∈ B(GL_2, μ⁻¹)` for `μ = (1,0)`) and the
-- cocharacter `μ⁻¹ = (0,-1)` in place of `μ`: the condition `[b] ∈ B(GL_2, μ)` fails and
-- `M_{GL_2,b,μ⁻¹,K}` is empty for every `K`.
example (v w : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![1, 0]) (hw : w.1 = ![0, -1])
    (hmin : (RedGrp.GLn.cochar (LocalField.Qp p) 2 w).IsMinuscule)
    (b : (RedGrp.GLn (LocalField.Qp p) 2).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn (LocalField.Qp p) 2).basic)
    (hb' : RedGrp.BofG.mk b ∈
      (RedGrp.GLn (LocalField.Qp p) 2).BGmu (RedGrp.GLn.cochar _ 2 v).dual)
    (K : (RedGrp.GLn (LocalField.Qp p) 2).Level) :
    RedGrp.BofG.mk b ∉ (RedGrp.GLn (LocalField.Qp p) 2).BGmu (RedGrp.GLn.cochar _ 2 w).dual ∧
      IsEmpty ((RigSp.toTop _).obj
        (Rigidification.space _ b (RedGrp.GLn.cochar _ 2 w) K)) := by
  sorry

-- Rigidification.torus_test
-- For `𝔾_m`, `μ = id` and `v_p(b) = -1`: `Fl_{𝔾_m,μ}` is a point,
-- `M_{𝔾_m,b,μ,ℤ_p^×} ≅ ∐_ℤ Spa ℚ̆_p`
-- and, for `m ≥ 1`, `M_{𝔾_m,b,μ,1+p^mℤ_p} ≅ ∐_ℤ Spa L` for an extension `L` of `ℚ̆_p` of degree
-- `(p - 1) p^{m-1}` (the field `ℚ̆_p(ζ_{p^m})`); when this degree is not `1` it is not the constant
-- space `(ℚ_p^×/(1 + p^mℤ_p)) × Spa ℚ̆_p`.
example (hmin : (RedGrp.Gm.cochar (LocalField.Qp p) 1).IsMinuscule)
    (b : (RedGrp.Gm (LocalField.Qp p)).ptsBreve)
    (hb : (LocalField.Qp p).valBreve (RedGrp.Gm.ptsBreveEquiv _ b) = Multiplicative.ofAdd (-1))
    (m : ℕ) (hm : 1 ≤ m) (K₀ Kₘ : (RedGrp.Gm (LocalField.Qp p)).Level)
    (h₀ : K₀.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsLevel 0)
    (hₘ : Kₘ.1.toSubgroup.map (RedGrp.Gm.ptsEquiv (LocalField.Qp p)).toMonoidHom =
      (LocalField.Qp p).unitsLevel m) :
    (∃ L : ((RedGrp.Gm (LocalField.Qp p)).reflexField (RedGrp.Gm.cochar _ 1)).BreveExt,
        L.degree = 1 ∧
          Nonempty (RigSp.flag _ (RedGrp.Gm.cochar (LocalField.Qp p) 1) ≅ L.spa)) ∧
      Nonempty (Rigidification.space _ b (RedGrp.Gm.cochar _ 1) K₀ ≅
        ∐ fun _ : ℤ => RigSp.flag _ (RedGrp.Gm.cochar (LocalField.Qp p) 1)) ∧
      (∃ L : ((RedGrp.Gm (LocalField.Qp p)).reflexField (RedGrp.Gm.cochar _ 1)).BreveExt,
        L.degree = (p - 1) * p ^ (m - 1) ∧
          Nonempty (Rigidification.space _ b (RedGrp.Gm.cochar _ 1) Kₘ ≅
            ∐ fun _ : ℤ => L.spa)) ∧
      ((p - 1) * p ^ (m - 1) ≠ 1 →
        ¬ Nonempty (Rigidification.space _ b (RedGrp.Gm.cochar _ 1) Kₘ ≅
          ∐ fun _ : (RedGrp.Gm (LocalField.Qp p)).pts ⧸ Kₘ.1.toSubgroup =>
            RigSp.flag _ (RedGrp.Gm.cochar (LocalField.Qp p) 1))) := by
  sorry

-- Rigidification.dimension_test
-- For `GL_n`, `μ = (1^d, 0^{n-d})` and `[b] ∈ B(GL_n, μ⁻¹)`: `M_{GL_n,b,μ,K}` is smooth of pure
-- dimension `d(n - d) = ⟨2ρ, μ⟩ = dim Gr(d, n)`.
example (n d : ℕ) (hd : d ≤ n) (v : {v : Fin n → ℤ // Antitone v})
    (hv : v.1 = fun i => if i.1 < d then 1 else 0)
    (hmin : (RedGrp.GLn.cochar (LocalField.Qp p) n v).IsMinuscule)
    (b : (RedGrp.GLn (LocalField.Qp p) n).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈
      (RedGrp.GLn (LocalField.Qp p) n).BGmu (RedGrp.GLn.cochar _ n v).dual)
    (K : (RedGrp.GLn (LocalField.Qp p) n).Level) :
    RedGrp.Cochar.twoRho (RedGrp.GLn.cochar (LocalField.Qp p) n v) = d * (n - d) ∧
      RigSp.smoothOfDim _ (d * (n - d))
        (Rigidification.space _ b (RedGrp.GLn.cochar _ n v) K) := by
  sorry

-- Rigidification.nonminuscule_test
-- For `GL_2` and `μ = (2,0)`: `μ` is not minuscule, `⟨2ρ, μ⟩ = 2` is the dimension of `Gr_{≤μ}`,
-- which exceeds `dim Fl_{GL_2,μ} = 1`, and the Białynicki-Birula map `Gr_μ → (ℙ¹)^♦` is not an
-- isomorphism; statement (1) of the node fails and the construction does not apply.
-- Omitted: the geometric fibres of the Białynicki-Birula map are `(𝔸¹)^♦`.
example (v : {v : Fin 2 → ℤ // Antitone v}) (hv : v.1 = ![2, 0]) :
    ¬ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v).IsMinuscule ∧
      RedGrp.Cochar.twoRho (RedGrp.GLn.cochar (LocalField.Qp p) 2 v) = 2 ∧
      RigSp.smoothOfDim _ 1 (RigSp.flag _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)) ∧
      ¬ IsIso (GrG.bialynickiBirula _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)) ∧
      ¬ IsIso (GrG.cellIncl _ (RedGrp.GLn.cochar (LocalField.Qp p) 2 v)) := by
  sorry

end MinusculeRigidification

/-! ### HS2/classical-period-points, HS2/nonemptiness-and-period-connectedness,
HS2/component-transitivity-source-gate, HS2/adjoint-period-and-tower-comparison and
HS2/torus-products-and-determinant

Here `E = ℚ_p`. The statements are in the orientation of Scholze–Weinstein, in which the
admissible locus of `Gr_{≤μ}` is non-empty exactly when `[b] ∈ B(G, μ⁻¹)`. The packet states the
three comparison nodes in the orientation of Gleason–Lim–Xu, with the dictionary: their
`Gr_{≤μ}`, its admissible locus, `Fl_μ` and the tower `Sht_{G,b,μ,K}` are the objects attached
here to the datum `(G, b, μ⁻¹)`, and their hypothesis `[b] ∈ B(G, μ)` is the condition of
Scholze–Weinstein 24.1.1 for that datum. So the declarations below, in which `μ` is the
cocharacter of the Scholze–Weinstein datum, carry the hypothesis `[b] ∈ B(G, μ⁻¹)`. -/

section PeriodComparisons

variable (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)

-- Omitted: (d), the failure of (c) for the norm-one torus of a quadratic extension, `μ = 0` and
-- the non-trivial class of `B(T)`; the interface does not have this torus.
/-- HS2/classical-period-points. For the Białynicki-Birula map `BB : Gr_μ → Fl_{G,μ}^♦` of the
Schubert cell:
(a) if `μ` is minuscule, `BB` is an isomorphism (and the cell is the Schubert variety);
(b) for every `μ` and every finite extension `L` of `F̆`, `BB` induces a bijection
`Gr_μ(Spd L) → Fl_{G,μ}(L)`;
(c) if `κ(b) = -μ♯`, then for every such `L`, `BB` restricts to a bijection from the
`b`-admissible points of `Gr_μ(Spd L)` onto the weakly admissible points of `Fl_{G,μ}(L)`.
For `μ` not minuscule `BB` is not an isomorphism; (b) and (c) concern classical points only. -/
theorem classicalPeriodPoints :
    (μ.IsMinuscule → IsIso (GrG.bialynickiBirula G μ) ∧ IsIso (GrG.cellIncl G μ)) ∧
      (¬ μ.IsMinuscule → ¬ IsIso (GrG.bialynickiBirula G μ)) ∧
      (∀ L : (G.reflexField μ).BreveExt,
        (∀ x : L.spd ⟶ GrG.cellOver G μ, ∃! y : L.spa ⟶ RigSp.flag G μ,
          (RigSp.diamond (G.reflexField μ)).map y =
            L.diamondSpa.hom ≫ x ≫ GrG.bialynickiBirula G μ) ∧
        ∀ y : L.spa ⟶ RigSp.flag G μ, ∃! x : L.spd ⟶ GrG.cellOver G μ,
          (RigSp.diamond (G.reflexField μ)).map y =
            L.diamondSpa.hom ≫ x ≫ GrG.bialynickiBirula G μ) ∧
      (G.kottwitz (RedGrp.BofG.mk b) = RedGrp.Cochar.sharp μ.dual →
        ∀ (L : (G.reflexField μ).BreveExt) (x : L.spd ⟶ GrG.cellOver G μ)
          (y : L.spa ⟶ RigSp.flag G μ),
          (RigSp.diamond (G.reflexField μ)).map y =
              L.diamondSpa.hom ≫ x ≫ GrG.bialynickiBirula G μ →
            ((∃ x' : L.spd.left ⟶ GrG.admissibleCell G b μ,
                x' ≫ BunG.trivLocus.incl _ = x.left) ↔
              y ∈ RigSp.flag.weaklyAdmissible G b μ L)) := sorry

-- Omitted: complete algebraically closed extensions `C` of `F̆` other than the completion of an
-- algebraic closure; the interface has the one `Spd C`.
/-- HS2/nonemptiness-and-period-connectedness. For `μ` arbitrary, the admissible loci
`Gr^a_μ ⊂ Gr^a_{≤μ}` of the Schubert cell and of the Schubert variety satisfy:
(a) `Gr^a_μ ≠ ∅ ⇔ Gr^a_{≤μ} ≠ ∅ ⇔ [b] ∈ B(G, μ⁻¹)`;
(b) if `[b] ∈ B(G, μ⁻¹)`, there are a finite extension `L` of `F̆` and a point `Spd L → Gr^a_μ`
over `Spd F̆`;
(c) if `[b] ∈ B(G, μ⁻¹)`, then `Gr^a_μ ×_{Spd F̆} Spd C` is connected, and
`Gr^a_{≤μ} ×_{Spd F̆} Spd C` is connected and dense in `Gr_{≤μ} ×_{Spd F̆} Spd C`
(Howe–Klevdal 7.3.3–7.3.4; Gleason–Lourenço, Theorems 3.1 and 3.2). -/
theorem nonemptinessAndPeriodConnectedness :
    (¬ (GrG.admissibleCell G b μ).IsEmpty ↔ RedGrp.BofG.mk b ∈ G.BGmu μ.dual) ∧
      (¬ (GrG.admissible G b μ).IsEmpty ↔ RedGrp.BofG.mk b ∈ G.BGmu μ.dual) ∧
      (RedGrp.BofG.mk b ∈ G.BGmu μ.dual →
        (∃ (L : (G.reflexField μ).BreveExt) (x : L.spd.left ⟶ GrG.admissibleCell G b μ),
          x ≫ GrG.admissibleCellIncl G b μ ≫ GrG.oneLegBase G μ = L.spd.hom) ∧
        ConnectedSpace (VSheaf.overC (GrG.admissibleCellIncl G b μ ≫ GrG.oneLegBase G μ)).top ∧
        ConnectedSpace (VSheaf.overC (GrG.admissibleIncl G b μ ≫ GrG.oneLegBase G μ)).top ∧
        DenseRange
          (VSheaf.topMap
            (VSheaf.overCMap (GrG.admissibleIncl G b μ)
              (GrG.admissibleIncl G b μ ≫ GrG.oneLegBase G μ) (GrG.oneLegBase G μ) rfl))) :=
  sorry

/-- HS2/component-transitivity-source-gate, (T): if a profinite group `K` acts continuously on a
topological space `A` and `A/K` is connected, then `K` acts transitively on `π₀(A)`. -/
theorem componentTransitivity_profinite (K : Type) [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K] [TotallyDisconnectedSpace K] (A : Type)
    [TopologicalSpace A] [MulAction K A] [ContinuousSMul K A]
    (h : ConnectedSpace (MulAction.orbitRel.Quotient K A)) (a a' : A) :
    ∃ k : K, connectedComponent (k • a) = connectedComponent a' := sorry

/-- (T), consequence: for every continuous action of a profinite group,
`π₀(A)/K → π₀(A/K)` is bijective. -/
theorem componentTransitivity_quotient (K : Type) [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] [CompactSpace K] [T2Space K] [TotallyDisconnectedSpace K] (A : Type)
    [TopologicalSpace A] [MulAction K A] [ContinuousSMul K A] (a a' : A) :
    connectedComponent (Quotient.mk'' a : MulAction.orbitRel.Quotient K A) =
        connectedComponent (Quotient.mk'' a' : MulAction.orbitRel.Quotient K A) ↔
      ∃ k : K, connectedComponent (k • a) = connectedComponent a' := sorry

/-- HS2/component-transitivity-source-gate, (N): let a locally profinite group `H` act
continuously on a topological space `A`, and let `K ⊂ H` be a compact open subgroup such that
every connected component of `A/K` is open. If `A/H` is connected, then `H` acts transitively on
`π₀(A)`. -/
theorem componentTransitivity_locallyProfinite (H : Type) [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [T2Space H] [TotallyDisconnectedSpace H] (K : OpenSubgroup H)
    (hK : IsCompact (K : Set H)) (A : Type) [TopologicalSpace A] [MulAction H A]
    [ContinuousSMul H A]
    (hopen : ∀ x : MulAction.orbitRel.Quotient K.toSubgroup A, IsOpen (connectedComponent x))
    (h : ConnectedSpace (MulAction.orbitRel.Quotient H A)) (a a' : A) :
    ∃ h : H, connectedComponent (h • a) = connectedComponent a' := sorry

/-- The conclusion of (N) fails without a hypothesis on the components: for `ℤ` acting by
translation on `ℤ_p`, the quotient is connected and `ℤ` is not transitive on `π₀(ℤ_p) = ℤ_p`. -/
theorem componentTransitivity_counterexample :
    letI : AddAction ℤ ℤ_[p] := AddAction.compHom ℤ_[p] (Int.castAddHom ℤ_[p])
    ConnectedSpace (AddAction.orbitRel.Quotient ℤ ℤ_[p]) ∧
      ¬ ∀ a a' : ℤ_[p], ∃ n : ℤ, connectedComponent (n +ᵥ a) = connectedComponent a' := sorry

/-- The self-map of `Sht_{G,b,μ,∞} ×_{Spd F̆} Spd C` induced by `g ∈ G(ℚ_p)`. -/
def admissiblePeriodTorsor.overCAct (g : G.pts) :
    VSheaf.overC (admissiblePeriodTorsor.toBase G b μ) ⟶
      VSheaf.overC (admissiblePeriodTorsor.toBase G b μ) :=
  VSheaf.overCMap ((admissiblePeriodTorsor.groupAction G b μ).constHom g) _ _
    (VSheaf.Action.constHom_comp (admissiblePeriodTorsor.groupAction_toBase G b μ) g)

/-- The map `Sht_{G,b,μ,∞} ×_{Spd F̆} Spd C → Sht_{G,b,μ,K} ×_{Spd F̆} Spd C`. -/
def LevelTower.toLevelOverC (K : G.Level) :
    VSheaf.overC (admissiblePeriodTorsor.toBase G b μ) ⟶
      VSheaf.overC (LevelTower.toBase G b μ K) :=
  VSheaf.overCMap (LevelTower.toLevel G b μ K) _ _ (LevelTower.toLevel_toBase G b μ K)

-- Omitted: complete algebraically closed extensions `C` of `F̆` other than the completion of an
-- algebraic closure; the interface has the one `Spd C`.
/-- HS2/component-transitivity-source-gate, (P1)–(P3) (Gleason–Lim–Xu, Proposition 3.12, which
states (P2) for all `μ`). Let `[b] ∈ B(G, μ⁻¹)` and write `π₀(X)` for the set of connected
components of `|X|`.
(P1) For every compact open `K` and every `μ`:
`π₀(Sht_{G,b,μ,K} × Spd C) = π₀(Sht_{G,b,μ,∞} × Spd C)/K`.
(P2) If `μ` is minuscule, `G(ℚ_p)` acts transitively on `π₀(Sht_{G,b,μ,∞} ×_{Spd F̆} Spd C)`.
(P3) For arbitrary `μ` the same holds provided that, for one compact open `K`, every connected
component of `|Sht_{G,b,μ,K} × Spd C|` is open; for `μ` not minuscule this openness is the
recorded gap. -/
theorem componentTransitivitySourceGate (hb : RedGrp.BofG.mk b ∈ G.BGmu μ.dual) :
    (∀ K : G.Level,
        Function.Surjective (VSheaf.topMap (LevelTower.toLevelOverC G b μ K)) ∧
          ∀ c c' : (VSheaf.overC (admissiblePeriodTorsor.toBase G b μ)).top,
            connectedComponent (VSheaf.topMap (LevelTower.toLevelOverC G b μ K) c) =
                connectedComponent (VSheaf.topMap (LevelTower.toLevelOverC G b μ K) c') ↔
              ∃ k : G.pts, k ∈ K.1 ∧
                connectedComponent
                    (VSheaf.topMap (admissiblePeriodTorsor.overCAct G b μ k) c) =
                  connectedComponent c') ∧
      (μ.IsMinuscule →
        ∀ c c' : (VSheaf.overC (admissiblePeriodTorsor.toBase G b μ)).top,
          ∃ g : G.pts,
            connectedComponent (VSheaf.topMap (admissiblePeriodTorsor.overCAct G b μ g) c) =
              connectedComponent c') ∧
      ((∃ K : G.Level, ∀ x : (VSheaf.overC (LevelTower.toBase G b μ K)).top,
          IsOpen (connectedComponent x)) →
        ∀ c c' : (VSheaf.overC (admissiblePeriodTorsor.toBase G b μ)).top,
          ∃ g : G.pts,
            connectedComponent (VSheaf.topMap (admissiblePeriodTorsor.overCAct G b μ g) c) =
              connectedComponent c') := sorry

-- Omitted: (3) in the form
-- `Sht_{G,b,μ,∞} ×^{G(ℚ_p)} H(ℚ_p) ≅ Sht_{H,b_H,μ_H,∞} ×_{Spd F̆_H} Spd F̆`;
-- the interface has no contracted products. It is recorded by the map
-- `admissiblePeriodTorsor.pushforward`, equivariant along `G(ℚ_p) → H(ℚ_p)`, together with (2):
-- an equivariant map of torsors over the same base exhibits the target as the contracted
-- product. Omitted: the failure of (2) and (3) for `T → 1` without the hypothesis on `b`.
/-- HS2/adjoint-period-and-tower-comparison (Gleason–Lim–Xu, Proposition 6.6(1)). Let
`f : G → H` be an ad-isomorphism, `b_H = f(b)`, `μ_H = f ∘ μ` with field of definition
`F_H ⊂ F`, and `[b] ∈ B(G, μ⁻¹)`. Then `[b_H] ∈ B(H, μ_H⁻¹)`, and:
(1) `Gr_{G,Spd F̆,≤μ} ≅ Gr_{H,Spd F̆_H,≤μ_H} ×_{Spd F̆_H} Spd F̆`;
(2) under (1) the `b`-admissible locus is the base change of the `b_H`-admissible locus;
(4) for `K_H ⊂ H(ℚ_p)` compact open, when `G(ℚ_p) → H(ℚ_p)` is surjective,
`Sht_{H,b_H,μ_H,K_H} ×_{Spd F̆_H} Spd F̆ = Sht_{G,b,μ,∞}/f⁻¹(K_H)`.
The base change to `Spd F̆` cannot be omitted when `F̆_H ≠ F̆`. -/
theorem adjointPeriodAndTowerComparison {H : RedGrp (LocalField.Qp p)} (f : G ⟶ H)
    (hf : RedGrp.adIso _ f) (hb : RedGrp.BofG.mk b ∈ G.BGmu μ.dual) :
    RedGrp.BofG.mk (RedGrp.ptsBreveMap f b) ∈ H.BGmu (RedGrp.Cochar.map f μ).dual ∧
      IsPullback (GrG.oneLegMap f μ (RedGrp.Cochar.map f μ) le_rfl) (GrG.oneLegBase G μ)
        (GrG.oneLegBase H (RedGrp.Cochar.map f μ))
        (RedGrp.reflexFieldMap f μ (RedGrp.Cochar.map f μ) rfl).spdBreveMap ∧
      (∃ g : GrG.admissible G b μ ⟶
          GrG.admissible H (RedGrp.ptsBreveMap f b) (RedGrp.Cochar.map f μ),
        IsPullback g (GrG.admissibleIncl G b μ) (GrG.admissibleIncl H _ _)
          (GrG.oneLegMap f μ (RedGrp.Cochar.map f μ) le_rfl)) ∧
      ∀ KH : H.Level, Function.Surjective (RedGrp.ptsMap f) →
        ∃ q : admissiblePeriodTorsor G b μ ⟶
            pullback (LevelTower.toBase H (RedGrp.ptsBreveMap f b) (RedGrp.Cochar.map f μ) KH)
              (RedGrp.reflexFieldMap f μ (RedGrp.Cochar.map f μ) rfl).spdBreveMap,
          q ≫ pullback.fst _ _ =
              admissiblePeriodTorsor.pushforward G b μ f _ _ rfl le_rfl ≫
                LevelTower.toLevel H _ _ KH ∧
            q ≫ pullback.snd _ _ = admissiblePeriodTorsor.toBase G b μ ∧
            ((admissiblePeriodTorsor.groupAction G b μ).restrict
              (KH.1.toSubgroup.comap (RedGrp.ptsMap f).toMonoidHom)).IsTorsor q := sorry

end PeriodComparisons

-- (3), functoriality in the group and the level, is `LevelTower.map` with `LevelTower.map_spec`
-- and `LevelTower.map_comp`.
-- Omitted: in (1), that the trivialisations over `Spd C` are equivariant for `T(ℚ_p)`; in (2),
-- compatibility of the decomposition with the period maps and the group actions, and that the two
-- maps to `Spd F̆` in the square are the structure maps of the two factors; in (4), that `K^ab`
-- can be strictly smaller than the maximal compact subgroup of `G^ab(ℚ_p)`.
/-- HS2/torus-products-and-determinant. All groups are reductive over `ℚ_p`.
(1) Tori: `Gr_{T,Spd F̆,≤μ} = Spd F̆`; if `κ_T(b) ≠ -μ♯`, `Sht_{T,b,μ,K}` is empty for all `K`; if
`κ_T(b) = -μ♯`, all of `Spd F̆` is admissible, `Sht_{T,b,μ,∞} → Spd F̆` is a pro-étale
`T(ℚ_p)`-torsor which is trivial over `Spd C`, and `Sht_{T,b,μ,K} × Spd C ≅ T(ℚ_p)/K × Spd C`.
(2) Products: for `G = G_1 × G_2` and `K = K_1 × K_2`,
`Sht_{G,b,μ,K}` is the fibre product over `Spd F̆` of `Sht_{G_1,b_1,μ_1,K_1} ×_{Spd F̆_1} Spd F̆`
and `Sht_{G_2,b_2,μ_2,K_2} ×_{Spd F̆_2} Spd F̆`.
(4) Determinant: for `det : G → G^ab`, the subgroup `K^ab = det(K)` of `G^ab(ℚ_p)` is compact
open, so that functoriality gives `det : Sht_{G,b,μ,K} → Sht_{G^ab,b^ab,μ^ab,K^ab}`. -/
theorem torusProductsAndDeterminant :
    (∀ (T : RedGrp (LocalField.Qp p)) (_ : RedGrp.isTorus _ T) (b : T.ptsBreve) (μ : T.Cochar),
        IsIso (GrG.oneLegBase T μ) ∧
          (T.kottwitz (RedGrp.BofG.mk b) ≠ RedGrp.Cochar.sharp μ.dual →
            ∀ K : T.Level, (LevelTower.level T b μ K).IsEmpty) ∧
          (T.kottwitz (RedGrp.BofG.mk b) = RedGrp.Cochar.sharp μ.dual →
            IsIso (GrG.admissibleIncl T b μ) ∧
              (admissiblePeriodTorsor.groupAction T b μ).IsTorsor
                (admissiblePeriodTorsor.toBase T b μ) ∧
              (∃ e : VSheaf.overC (admissiblePeriodTorsor.toBase T b μ) ≅
                  VSheaf.const p T.pts ⨯ (T.reflexField μ).spdC,
                e.hom ≫ prod.snd = pullback.snd _ _) ∧
              ∀ K : T.Level,
                ∃ e : VSheaf.overC (LevelTower.toBase T b μ K) ≅
                    (VSheaf.ofTop p).obj (T.cosets K) ⨯ (T.reflexField μ).spdC,
                  e.hom ≫ prod.snd = pullback.snd _ _)) ∧
      (∀ (G₁ G₂ : RedGrp (LocalField.Qp p)) (b : (G₁.prod G₂).ptsBreve) (μ : (G₁.prod G₂).Cochar)
          (K : (G₁.prod G₂).Level) (K₁ : G₁.Level) (K₂ : G₂.Level)
          (hK : ∀ g, g ∈ K.1 ↔
            RedGrp.ptsMap (RedGrp.prod.fst G₁ G₂) g ∈ K₁.1 ∧
              RedGrp.ptsMap (RedGrp.prod.snd G₁ G₂) g ∈ K₂.1),
          ∃ (u₁ : LevelTower.level (G₁.prod G₂) b μ K ⟶
                pullback (LevelTower.toBase G₁ _ _ K₁)
                  (RedGrp.reflexFieldMap (RedGrp.prod.fst G₁ G₂) μ _ rfl).spdBreveMap)
            (u₂ : LevelTower.level (G₁.prod G₂) b μ K ⟶
                pullback (LevelTower.toBase G₂ _ _ K₂)
                  (RedGrp.reflexFieldMap (RedGrp.prod.snd G₁ G₂) μ _ rfl).spdBreveMap),
            u₁ ≫ pullback.fst _ _ =
                LevelTower.map (G₁.prod G₂) b μ (RedGrp.prod.fst G₁ G₂) _ _ rfl le_rfl K K₁
                  (fun g hg => ((hK g).1 hg).1) ∧
              u₂ ≫ pullback.fst _ _ =
                LevelTower.map (G₁.prod G₂) b μ (RedGrp.prod.snd G₁ G₂) _ _ rfl le_rfl K K₂
                  (fun g hg => ((hK g).1 hg).2) ∧
              IsPullback u₁ u₂ (pullback.snd _ _) (pullback.snd _ _)) ∧
      ∀ (G : RedGrp (LocalField.Qp p)) (K : G.Level),
        ∃ Kab : G.ab.Level,
          Kab.1.toSubgroup = K.1.toSubgroup.map (RedGrp.ptsMap G.toAb).toMonoidHom := sorry

/-! ### HS2/weil-descent-datum: the Weil descent datum of the one-leg tower

`E` is a general local field, there is one leg, `F` denotes the field of definition of `μ` and
`φ_F` the Frobenius of `Spd F̆`; `Spd F̆/φ_F^ℤ = Div¹_F`. -/

section WeilDescentDatum

variable (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar)

/-- For one leg, the projection of `∏_{Unit} Div¹_F` to `Div¹_F`. -/
def RedGrp.divOne (G : RedGrp F) (μ : G.Cochar) :
    G.divBase (RedGrp.oneLeg μ) ⟶ Div1 (G.reflexField μ) :=
  Pi.π (fun _ : Unit => Div1 (G.reflexField μ)) ()

/-- The structure map `f_K : Sht_{(G,b,μ),K} → Spd F̆` of the one-leg tower. -/
def WeilDescent.toBase (K : G.Level) :
    GeneralShtukaTower G b (RedGrp.oneLeg μ) K ⟶ (G.reflexField μ).spdBreve :=
  GeneralShtukaTower.legs G b (RedGrp.oneLeg μ) K ≫ G.legOne μ

/-- The transition maps of the one-leg tower are maps over `Spd F̆`. -/
theorem WeilDescent.transition_toBase {K' K : G.Level} (h : K' ≤ K) :
    GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h ≫ WeilDescent.toBase G b μ K =
      WeilDescent.toBase G b μ K' := by
  rw [WeilDescent.toBase, ← Category.assoc,
    (GeneralShtukaTower.transition_spec G b (RedGrp.oneLeg μ) h).2.2]
  rfl

/-- The structure map `Sht_{(G,b,μ),∞} → Spd F̆`. -/
def WeilDescent.toBaseInfinite :
    GeneralShtukaTower.infinite G b (RedGrp.oneLeg μ) ⟶ (G.reflexField μ).spdBreve :=
  GeneralShtukaTower.toGr G b (RedGrp.oneLeg μ) ≫ TwistedPeriodData.legs G b (RedGrp.oneLeg μ) ≫
    G.legOne μ

/-- HS2/weil-descent-datum, `WeilDescent.modificationSpace` [data]. The v-sheaf
`M_{(G,b,μ),K} → Spd F̆/φ_F^ℤ` of triples `(D, α, 𝒫)`: a point `D` of `Spd F̆/φ_F^ℤ`, viewed as a
degree-one Cartier divisor of `X_S`; a modification `α : E ⇢ E_b` at `D` bounded by `μ` with `E`
trivial at geometric points; and a `K`-lattice `𝒫` in `Isom(E_1, E)`. It is the quotient by `K` of
the space `M_{(G,b,μ),∞} = Mod_{1,b,≤μ}` of framed modifications. -/
def WeilDescent.modificationSpace (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) (K : G.Level) :
    VSheaf p := sorry

/-- `M_{(G,b,μ),K} → Spd F̆/φ_F^ℤ = Div¹_F`. -/
def WeilDescent.modificationSpace.legs (K : G.Level) :
    WeilDescent.modificationSpace G b μ K ⟶ Div1 (G.reflexField μ) := sorry

/-- The quotient map `M_{(G,b,μ),∞} = Mod_{1,b,≤μ} → M_{(G,b,μ),K}`. -/
def WeilDescent.modificationSpace.ofInfinite (K : G.Level) :
    FramedModification G 1 b (RedGrp.oneLeg μ) ⟶ WeilDescent.modificationSpace G b μ K := sorry

/-- `M_{(G,b,μ),∞} → M_{(G,b,μ),K}` is a torsor under `underline K`, over `Div¹_F`. -/
theorem WeilDescent.modificationSpace.spec (K : G.Level) :
    ((FramedModification.groupAction G b (RedGrp.oneLeg μ)).restrict K.1.toSubgroup).IsTorsor
        (WeilDescent.modificationSpace.ofInfinite G b μ K) ∧
      WeilDescent.modificationSpace.ofInfinite G b μ K ≫
          WeilDescent.modificationSpace.legs G b μ K =
        FramedModification.legs G 1 b (RedGrp.oneLeg μ) ≫ G.divOne μ := sorry

/-- The transition maps `M_{(G,b,μ),K'} → M_{(G,b,μ),K}` for `K' ⊂ K`. -/
def WeilDescent.modificationSpace.transition {K' K : G.Level} (h : K' ≤ K) :
    WeilDescent.modificationSpace G b μ K' ⟶ WeilDescent.modificationSpace G b μ K := sorry

/-- The action of `J_b(E) ⊂ Aut(E_b)` on `M_{(G,b,μ),K}`, `α ↦ j ∘ α`. -/
def WeilDescent.modificationSpace.framingAction (K : G.Level) :
    VSheaf.Action (VSheaf.constGrp p (G.sigmaCentralizer b))
      (WeilDescent.modificationSpace G b μ K) := sorry

/-- `WeilDescent.pullback` [equivalence]: the projection
`Sht_{(G,b,μ),K} → M_{(G,b,μ),K}` of the isomorphism
`Sht_{(G,b,μ),K} ≅ M_{(G,b,μ),K} ×_{Spd F̆/φ_F^ℤ} Spd F̆`: the points of the one-leg tower depend on
the untilt `S♯` only through the Cartier divisor that it defines on `X_S`. -/
def WeilDescent.pullback (K : G.Level) :
    GeneralShtukaTower G b (RedGrp.oneLeg μ) K ⟶ WeilDescent.modificationSpace G b μ K := sorry

/-- `Sht_{(G,b,μ),K} = M_{(G,b,μ),K} ×_{Spd F̆/φ_F^ℤ} Spd F̆`, compatibly with the transition maps
and with the action of `J_b(E)`. -/
theorem WeilDescent.pullback_spec (K : G.Level) :
    IsPullback (WeilDescent.pullback G b μ K) (WeilDescent.toBase G b μ K)
        (WeilDescent.modificationSpace.legs G b μ K) (Div1.proj (G.reflexField μ)) ∧
      (∀ (K' : G.Level) (h : K' ≤ K),
        GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h ≫ WeilDescent.pullback G b μ K =
          WeilDescent.pullback G b μ K' ≫ WeilDescent.modificationSpace.transition G b μ h) ∧
      (GeneralShtukaTower.framingAction G b (RedGrp.oneLeg μ) K).Equivariant
        (WeilDescent.modificationSpace.framingAction G b μ K) (WeilDescent.pullback G b μ K) :=
  sorry

/-- The same at infinite level: `Sht_{(G,b,μ),∞} = Mod_{1,b,≤μ} ×_{Spd F̆/φ_F^ℤ} Spd F̆`, compatibly
with the quotient maps to the levels and with the action of `G(E)`. -/
theorem WeilDescent.pullback_infinite :
    ∃ t : GeneralShtukaTower.infinite G b (RedGrp.oneLeg μ) ⟶
        FramedModification G 1 b (RedGrp.oneLeg μ),
      IsPullback t (WeilDescent.toBaseInfinite G b μ)
          (FramedModification.legs G 1 b (RedGrp.oneLeg μ) ≫ G.divOne μ)
          (Div1.proj (G.reflexField μ)) ∧
        (GeneralShtukaTower.groupAction G b (RedGrp.oneLeg μ)).Equivariant
          (FramedModification.groupAction G b (RedGrp.oneLeg μ)) t ∧
        ∀ K : G.Level,
          t ≫ WeilDescent.modificationSpace.ofInfinite G b μ K =
            GeneralShtukaTower.toLevel G b (RedGrp.oneLeg μ) K ≫ WeilDescent.pullback G b μ K :=
  sorry

/-- `WeilDescent.datum` [constructor]: the Weil descent datum of `Sht_{(G,b,μ),K}` along
`Spd F̆ → Spd F̆/φ_F^ℤ`: the automorphism `ψ_K = id × φ_F` of
`Sht_{(G,b,μ),K} = M_{(G,b,μ),K} ×_{Spd F̆/φ_F^ℤ} Spd F̆`, covering `φ_F`, with its powers
`ψ_K^n = id × φ_F^n`, as an action of `ℤ`. Equivalently, the isomorphisms
`w_K^{(n)} : (φ_F^n)^* Sht_{(G,b,μ),K} ≅ Sht_{(G,b,μ),K}` over `Spd F̆` with inverse
`y ↦ (ψ_K^n(y), f_K(y))`; their cocycle condition `w_K^{(m+n)} = w_K^{(m)} ∘ (φ_F^m)^* w_K^{(n)}`
is the multiplicativity of `n ↦ ψ_K^n`, and on total spaces `w_K` is `ψ_K⁻¹`. -/
def WeilDescent.datum (K : G.Level) :
    Multiplicative ℤ →* Aut (GeneralShtukaTower G b (RedGrp.oneLeg μ) K) := sorry

/-- The automorphism of `n` covers `φ_F^n` on `Spd F̆` and is the identity on `M_{(G,b,μ),K}`;
these two properties determine it. -/
theorem WeilDescent.datum_spec (K : G.Level) (n : ℤ) :
    (WeilDescent.datum G b μ K (Multiplicative.ofAdd n)).hom ≫ WeilDescent.toBase G b μ K =
        WeilDescent.toBase G b μ K ≫
          ((G.reflexField μ).spdBreveFrobAut ^ n).hom ∧
      (WeilDescent.datum G b μ K (Multiplicative.ofAdd n)).hom ≫ WeilDescent.pullback G b μ K =
        WeilDescent.pullback G b μ K := sorry

/-- `WeilDescent.datum_natural` [functoriality]: the descent datum commutes with the transition
maps, with the isomorphisms induced by the elements of `G(E)`, and with the action of
`J_b(E)`. -/
theorem WeilDescent.datum_natural (K : G.Level) (n : Multiplicative ℤ) :
    (∀ (K' : G.Level) (h : K' ≤ K),
        (WeilDescent.datum G b μ K' n).hom ≫ GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h =
          GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h ≫
            (WeilDescent.datum G b μ K n).hom) ∧
      (∀ (g : G.pts) (K' : G.Level)
          (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom),
          (WeilDescent.datum G b μ K n).hom ≫
              (GeneralShtukaTower.heckeIso G b (RedGrp.oneLeg μ) g K K' h).hom =
            (GeneralShtukaTower.heckeIso G b (RedGrp.oneLeg μ) g K K' h).hom ≫
              (WeilDescent.datum G b μ K' n).hom) ∧
      (GeneralShtukaTower.framingAction G b (RedGrp.oneLeg μ) K).Equivariant
        (GeneralShtukaTower.framingAction G b (RedGrp.oneLeg μ) K)
        (WeilDescent.datum G b μ K n).hom := sorry

/-- The descent datum `w_Gr` of the Grassmannian `Gr_{G,Spd F̆,≤μ}` (here in its form `Gr^tw` for
one leg), induced by the Frobenius structure `b × Frob_S` of the pullback of `E_b` to `Y_S`, as
an action of `ℤ` on the total space. -/
def WeilDescent.grDatum :
    Multiplicative ℤ →* Aut (TwistedPeriodData G b (RedGrp.oneLeg μ)) := sorry

-- Omitted: `ψ_Gr` is the canonical automorphism `(x, Λ) ↦ (φ_F(x), Λ)` of
-- `Gr_{G,Spd F̆,≤μ} = Gr_{G,Spd F,≤μ} ×_{Spd κ_F} Spd k` followed by left multiplication by the
-- image in `G(B_dR⁺)` of `b_f = b σ(b) ⋯ σ^{f-1}(b)`, `f` the residue degree of `F` over `E`
-- (`b_f = b` for `F = E`; the canonical automorphism for `b = 1`). The interface has the Schubert
-- variety over `Spd F̆` only, and no action of `G(B_dR⁺)` on it.
/-- `WeilDescent.datum_period` [compatibility]: `π_K ∘ ψ_K = ψ_Gr ∘ π_K` (equivalently
`π_K ∘ w_K = w_Gr ∘ φ_F^* π_K`): the period map intertwines the automorphism `ψ_K` of the tower
with the automorphism `ψ_Gr` of the Grassmannian induced by the Frobenius structure of `E_b`
(here `WeilDescent.grDatum`, with its powers), which covers `φ_F` and
preserves the bundle `E` on the curve (it depends on the untilt only through its image in
`Spd F̆/φ_F^ℤ`, that is through the degree-one divisor that it defines on `X_S ×_E F`). -/
theorem WeilDescent.datum_period (K : G.Level) (n : ℤ) :
    (WeilDescent.datum G b μ K (Multiplicative.ofAdd n)).hom ≫
          GeneralShtukaTower.periodMap G b (RedGrp.oneLeg μ) K =
        GeneralShtukaTower.periodMap G b (RedGrp.oneLeg μ) K ≫
          (WeilDescent.grDatum G b μ (Multiplicative.ofAdd n)).hom ∧
      (WeilDescent.grDatum G b μ (Multiplicative.ofAdd n)).hom ≫
          TwistedPeriodData.legs G b (RedGrp.oneLeg μ) ≫ G.legOne μ =
        TwistedPeriodData.legs G b (RedGrp.oneLeg μ) ≫ G.legOne μ ≫
          ((G.reflexField μ).spdBreveFrobAut ^ n).hom ∧
      VSheaf.stackMap (WeilDescent.grDatum G b μ (Multiplicative.ofAdd n)).hom ≫
          GeneralShtukaTower.bundle G b (RedGrp.oneLeg μ) =
        GeneralShtukaTower.bundle G b (RedGrp.oneLeg μ) := sorry

/-- `WeilDescent.weilAction` [structure]: the action of the Weil group `W_F` on
`Sht_{(G,b,μ),K} ×_{Spd F̆} Spd C = M_{(G,b,μ),K} ×_{Spd F̆/φ_F^ℤ} Spd C`, through its action
`τ ↦ τ ∘ Frob^{-deg τ}` on the `W_F`-torsor `Spd C → Spd F̆/φ_F^ℤ`. -/
def WeilDescent.weilAction (K : G.Level) :
    (G.reflexField μ).WeilGroup →* Aut (VSheaf.overC (WeilDescent.toBase G b μ K)) := sorry

/-- The action of `W_F` covers its action on `Spd C` and is the identity on `M_{(G,b,μ),K}`; the
inertia subgroup acts through its action on `C`; and the action commutes with the transition
maps. -/
theorem WeilDescent.weilAction_spec (K : G.Level) (τ : (G.reflexField μ).WeilGroup) :
    (WeilDescent.weilAction G b μ K τ).hom ≫ pullback.snd _ _ =
        pullback.snd _ _ ≫ ((G.reflexField μ).weilActionSpdC τ).hom ∧
      (WeilDescent.weilAction G b μ K τ).hom ≫ pullback.fst _ _ ≫ WeilDescent.pullback G b μ K =
        pullback.fst _ _ ≫ WeilDescent.pullback G b μ K ∧
      (τ ∈ (G.reflexField μ).inertia →
        (WeilDescent.weilAction G b μ K τ).hom ≫ pullback.fst _ _ = pullback.fst _ _) ∧
      ∀ (K' : G.Level) (h : K' ≤ K),
        (WeilDescent.weilAction G b μ K' τ).hom ≫
            VSheaf.overCMap (GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h) _ _
              (WeilDescent.transition_toBase G b μ h) =
          VSheaf.overCMap (GeneralShtukaTower.transition G b (RedGrp.oneLeg μ) h) _ _
              (WeilDescent.transition_toBase G b μ h) ≫
            (WeilDescent.weilAction G b μ K τ).hom := sorry

-- Omitted: the action of `W_F` commutes with the isomorphisms of the elements of `G(E)` and with
-- the action of `J_b(E)`; it follows from `WeilDescent.weilAction_spec`, the action of `W_F` being
-- the identity on `M_{(G,b,μ),K}`, on which these groups act.
-- Omitted: for several legs, (4) of the node: the space of modifications over
-- `∏_i Spd Ĕ_i/φ_i^ℤ` compared with `Sht_{(G,b,μ•),K}` away from the Frobenius-twisted partial
-- diagonals; at infinite level this is `GeneralShtukaTower.limit_spec`.

/-- `WeilDescent.lubinTate` [example]: for `𝔾_m`, `μ = id` and `v(b) = -1`:
`M_{(𝔾_m,b,μ),∞} = BC(𝒪(1)) ∖ {0}` over `Div¹`, a modification `α : 𝒪 ⇢ 𝒪(1)` going to the section
`α(1)`; the action of `g ∈ E^×` by `α ↦ α ∘ g⁻¹` is multiplication of the section by `g⁻¹`
(Fargues–Scholze II.2.4). -/
theorem WeilDescent.lubinTate (c : (RedGrp.Gm F).ptsBreve)
    (hc : F.valBreve (RedGrp.Gm.ptsBreveEquiv F c) = Multiplicative.ofAdd (-1)) :
    ∃ e : FramedModification (RedGrp.Gm F) 1 c (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) ≅
        Div1.cover F,
      e.hom ≫ Div1.coverProj F =
          FramedModification.legs _ 1 c _ ≫ RedGrp.divOne _ (RedGrp.Gm.cochar F 1) ≫
            (RedGrp.reflexExt _ (RedGrp.Gm.cochar F 1)).div1Map ∧
        ∀ (S : Perfd p) (g : (VSheaf.constGrp p (RedGrp.Gm F).pts).obj (op S))
          (x : (FramedModification (RedGrp.Gm F) 1 c (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).pts S),
          VSheaf.ptsMap e.hom S
              ((FramedModification.groupAction (RedGrp.Gm F) c
                (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).smul S g x) =
            (Div1.coverAction F).smul S g⁻¹ (VSheaf.ptsMap e.hom S x) := sorry
-- Omitted: `BC(𝒪(1)) ∖ {0} ≅ Spd Ĕ_∞`, with `𝒪_E^×` acting through the Lubin–Tate action and `π`
-- as the Frobenius; the interface has no Lubin–Tate extension (as at
-- `GeneralShtukaTower.lubinTate`).

end WeilDescentDatum

/-- `WeilDescent.rigid` [compatibility]: for `E = ℚ_p` and `μ` minuscule, let `τ = σ_F⁻¹` be the
automorphism of `F̆` over `F` inverse to the lift of the `q_F`-Frobenius of `k`
(`RigSp.frobTwist`); `φ_F` is the composite of `τ^♦` with the absolute `q_F`-Frobenius of
`Spd F̆`, so pullbacks along `φ_F` and along `τ^♦` are canonically identified. The descent datum
`w_K` is the diamond of a unique isomorphism `τ^* M_{G,b,μ,K} ≅ M_{G,b,μ,K}` of rigid spaces over
`F̆`, under the identification of the one-leg towers; on total spaces it is `ψ_K⁻¹`. -/
theorem WeilDescent.rigid (G : RedGrp (LocalField.Qp p)) (b : G.ptsBreve) (μ : G.Cochar)
    (hμ : μ.IsMinuscule) :
    ∃ e : ∀ K : G.Level, GeneralShtukaTower G b (RedGrp.oneLeg μ) K ≅ LevelTower.level G b μ K,
      (∀ K : G.Level, (e K).hom ≫ LevelTower.toBase G b μ K = WeilDescent.toBase G b μ K) ∧
        ∀ K : G.Level,
          ∃! r : (RigSp.frobTwist (G.reflexField μ)).functor.obj (Rigidification.space G b μ K) ≅
              Rigidification.space G b μ K,
            ((RigSp.diamond (G.reflexField μ)).map r.hom).left =
              (RigSp.diamondFrobTwist (Rigidification.space G b μ K)).hom ≫
                (Rigidification.comparison G b μ hμ K).hom.left ≫ (e K).inv ≫
                (WeilDescent.datum G b μ K (Multiplicative.ofAdd (-1))).hom ≫ (e K).hom ≫
                (Rigidification.comparison G b μ hμ K).inv.left := sorry
-- Omitted: that the isomorphism of rigid spaces lies over the isomorphism `τ^* Fl ≅ Fl` which
-- corresponds to `w_Gr`, and that `e` is the identification `GeneralShtukaTower.oneLeg_tower` of
-- the two towers; here `e` is only asserted to exist over `Spd F̆`.

/-- The isomorphisms of the elements of `G(E)` are maps over `Spd F̆`. -/
theorem WeilDescent.heckeIso_toBase (G : RedGrp F) (b : G.ptsBreve) (μ : G.Cochar) (g : G.pts)
    (K K' : G.Level) (h : K'.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom) :
    (GeneralShtukaTower.heckeIso G b (RedGrp.oneLeg μ) g K K' h).hom ≫ WeilDescent.toBase G b μ K' =
      WeilDescent.toBase G b μ K := by
  rw [WeilDescent.toBase, ← Category.assoc,
    (GeneralShtukaTower.actions G b (RedGrp.oneLeg μ) g K K' h).2.2.2.2.1]
  rfl

-- WeilDescent.lubin_tate_test
-- For `𝔾_m`, `μ = id` and `v(b) = -1`: `M_{(𝔾_m,b,μ),∞} ≅ Spd Ĕ_∞` has a single point,
-- `Sht_{(𝔾_m,b,μ),𝒪_E^×} ≅ ℤ × Spd Ĕ`, and `ψ_K^n = id × φ^n` maps the component of index `m` onto
-- the component of index `m + n`; so the descent datum acts simply transitively on
-- `π₀(Sht_{(𝔾_m,b,μ),𝒪_E^×}) = ℤ`.
-- Omitted: that the component of index `m` consists of the pairs `(s, x)` of a point `s` of
-- `Spd Ĕ_∞` and a point `x` of `Spd Ĕ` with `x = φ^m(p(s))`; the interface has no Lubin–Tate
-- extension.
example (b : (RedGrp.Gm F).ptsBreve)
    (hb : F.valBreve (RedGrp.Gm.ptsBreveEquiv F b) = Multiplicative.ofAdd (-1))
    (K : (RedGrp.Gm F).Level)
    (hK : K.1.toSubgroup.map (RedGrp.Gm.ptsEquiv F).toMonoidHom = F.unitsInt) :
    Nonempty (Unique (FramedModification (RedGrp.Gm F) 1 b
        (RedGrp.oneLeg (RedGrp.Gm.cochar F 1))).top) ∧
      ∃ e : GeneralShtukaTower (RedGrp.Gm F) b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) K ≅
            VSheaf.const p ℤ ⨯ ((RedGrp.Gm F).reflexField (RedGrp.Gm.cochar F 1)).spdBreve,
          e.hom ≫ prod.snd = WeilDescent.toBase _ b (RedGrp.Gm.cochar F 1) K ∧
          ∀ n : ℤ,
            (WeilDescent.datum _ b (RedGrp.Gm.cochar F 1) K (Multiplicative.ofAdd n)).hom ≫
                e.hom ≫ prod.fst =
              e.hom ≫ prod.fst ≫
                (VSheaf.ofTop p).map
                  (TopCat.ofHom ⟨fun m : ℤ => m + n, continuous_of_discreteTopology⟩) := by
  sorry

-- WeilDescent.not_effective_test
-- In the same example there is no v-sheaf `Y` over `Spd E` with
-- `Y ×_{Spd E} Spd Ĕ ≅ Sht_{(𝔾_m,b,μ),𝒪_E^×}` compatibly with `w`: the descent datum is not
-- effective. The quotient of `Sht_{(𝔾_m,b,μ),𝒪_E^×}` by `π^ℤ`, for `π ∈ J_b(E) = E^×` of
-- valuation `1`, is `Spd Ĕ`.
-- Omitted: that on this quotient the datum is `φ`, which descends to `Spd E`; stated is that the
-- space is a torsor under `π^ℤ` over `Spd Ĕ`.
example (b : (RedGrp.Gm F).ptsBreve)
    (hb : F.valBreve (RedGrp.Gm.ptsBreveEquiv F b) = Multiplicative.ofAdd (-1))
    (K : (RedGrp.Gm F).Level)
    (hK : K.1.toSubgroup.map (RedGrp.Gm.ptsEquiv F).toMonoidHom = F.unitsInt) :
    (¬ ∃ (Y : VSheaf p) (g : Y ⟶ ((RedGrp.Gm F).reflexField (RedGrp.Gm.cochar F 1)).spd)
        (t : GeneralShtukaTower (RedGrp.Gm F) b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) K ⟶ Y),
        IsPullback t (WeilDescent.toBase _ b (RedGrp.Gm.cochar F 1) K) g
            ((RedGrp.Gm F).reflexField (RedGrp.Gm.cochar F 1)).spdBreveToSpd ∧
          ∀ n : Multiplicative ℤ,
            (WeilDescent.datum _ b (RedGrp.Gm.cochar F 1) K n).hom ≫ t = t) ∧
      ∀ j : (RedGrp.Gm F).sigmaCentralizer b,
        F.valBreve (RedGrp.Gm.ptsBreveEquiv F j.1) = Multiplicative.ofAdd 1 →
          ((GeneralShtukaTower.framingAction _ b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) K).restrict
            (Subgroup.zpowers j)).IsTorsor (WeilDescent.toBase _ b (RedGrp.Gm.cochar F 1) K) := by
  sorry

-- WeilDescent.trivial_datum_test
-- For `μ = 0` and `b = 1`: `M_{(G,1,0),K} = G(E)/K × Spd Ĕ/φ^ℤ`,
-- `Sht_{(G,1,0),K} = G(E)/K × Spd Ĕ`, and the descent datum is `id × φ`.
-- Omitted: that this datum is effective with descent `G(E)/K × Spd E`, and that `W_E` acts on
-- `Sht_{(G,1,0),K} × Spd C` through `Spd C` only (which is `WeilDescent.weilAction_spec` together
-- with the product decomposition).
example (G : RedGrp F) (K : G.Level) :
    (∃ e : WeilDescent.modificationSpace G 1 0 K ≅
          (VSheaf.ofTop p).obj (G.cosets K) ⨯ Div1 (G.reflexField 0),
        e.hom ≫ prod.snd = WeilDescent.modificationSpace.legs G 1 0 K) ∧
      ∃ e : GeneralShtukaTower G 1 (RedGrp.oneLeg 0) K ≅
          (VSheaf.ofTop p).obj (G.cosets K) ⨯ (G.reflexField 0).spdBreve,
        e.hom ≫ prod.snd = WeilDescent.toBase G 1 0 K ∧
          ∀ n : Multiplicative ℤ,
            (WeilDescent.datum G 1 0 K n).hom ≫ e.hom ≫ prod.fst = e.hom ≫ prod.fst := by
  sorry

-- WeilDescent.reciprocity_test
-- For `𝔾_m`, `μ = id` and `v(b) = -1`: `W_E` acts on `π₀(Sht_{(𝔾_m,b,μ),K} ×_{Spd Ĕ} Spd C)`, a
-- quotient of the `E^×`-torsor `π₀(Sht_{(𝔾_m,b,μ),∞} ×_{Spd Ĕ} Spd C)`, through the reciprocity
-- homomorphism `W_E → E^×` of local class field theory, up to the normalisation `τ ↦ τ^{±1}`: `τ`
-- acts on the components as the element `u ∈ E^× = 𝔾_m(E)` with `u = rec(τ)^{±1}`.
-- The packet states it at infinite level; it is stated at every finite level, where the Weil
-- action of this node is declared.
example (b : (RedGrp.Gm F).ptsBreve)
    (hb : F.valBreve (RedGrp.Gm.ptsBreveEquiv F b) = Multiplicative.ofAdd (-1)) :
    ∃ ε : ℤ, (ε = 1 ∨ ε = -1) ∧
      ∀ (K : (RedGrp.Gm F).Level) (τ : ((RedGrp.Gm F).reflexField (RedGrp.Gm.cochar F 1)).WeilGroup)
        (g : (RedGrp.Gm F).pts)
        (h : K.1.toSubgroup = K.1.toSubgroup.map (MulAut.conj g).toMonoidHom),
        Units.map ((RedGrp.reflexExt _ (RedGrp.Gm.cochar F 1)).toRingHom : F.E →* _)
              (RedGrp.Gm.ptsEquiv F g) =
            (((RedGrp.Gm F).reflexField (RedGrp.Gm.cochar F 1)).reciprocity τ) ^ ε →
          ∀ c : (VSheaf.overC (WeilDescent.toBase _ b (RedGrp.Gm.cochar F 1) K)).top,
            connectedComponent
                (VSheaf.topMap (WeilDescent.weilAction _ b (RedGrp.Gm.cochar F 1) K τ).hom c) =
              connectedComponent
                (VSheaf.topMap
                  (VSheaf.overCMap
                    (GeneralShtukaTower.heckeIso _ b (RedGrp.oneLeg (RedGrp.Gm.cochar F 1)) g K K
                      h).hom
                    _ _ (WeilDescent.heckeIso_toBase _ b (RedGrp.Gm.cochar F 1) g K K h))
                  c) := by
  sorry

end HS2

/-! ## Stages HS3 and HS4: common definitions -/

section HS3HS4

attribute [local instance] endofunctorMonoidalCategory
attribute [local instance] HasDerivedCategory.standard

variable {F : LocalField p}

/-! ### Objects of stages HS0 and HS2 in the form used by HS3 and HS4

Definitions built from the declarations of the earlier stages; no body is a placeholder, and the
two facts stated about the quotient stacks are proved by it. -/

/-- The part of `Gr^{tw,b}_{G,≤μ•}` over the locus of the base where `S_i♯ ≠ φⁿ(S_j♯)` for all
`i ≠ j` and `n ≠ 0`: the source of the chart `TwistedPeriodData.toBD` of HS0. -/
abbrev TwistedPeriodData.offDiagonal (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) : VSheaf p :=
  pullback (TwistedPeriodData.legs G b μ) (TwistedPeriodData.bdLocusIncl G μ)

/-- The open immersion of the locus off the twisted diagonals. -/
abbrev TwistedPeriodData.offDiagonalIncl (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) : TwistedPeriodData.offDiagonal G b μ ⟶ TwistedPeriodData G b μ :=
  pullback.fst _ _

/-- Off the twisted diagonals, the chart `TwistedPeriodData.toBD` followed by the projection to
the Beilinson–Drinfeld Schubert variety `Gr_{G,≤μ•}`. -/
def TwistedPeriodData.offDiagonalToBD (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) : TwistedPeriodData.offDiagonal G b μ ⟶ GrG.schubert G μ :=
  (TwistedPeriodData.toBD G b μ).hom ≫ pullback.fst _ _

/-- For two legs and `m > 0`, the part of `Gr^{tw,b}_{G,≤μ•}` over the locus where
`S_2♯ ≠ φ⁻ⁿ(S_1♯)` for all `n ≠ m`: the source of the chart `TwistedPeriodData.collision` of
HS0. -/
abbrev TwistedPeriodData.collisionChart (G : RedGrp F) (b : G.ptsBreve) (μ : Fin 2 → G.Cochar)
    (m : ℕ) : VSheaf p :=
  pullback (TwistedPeriodData.legs G b μ) (TwistedPeriodData.collisionLocusIncl G μ m)

/-- The open immersion of the chart. -/
abbrev TwistedPeriodData.collisionChartIncl (G : RedGrp F) (b : G.ptsBreve)
    (μ : Fin 2 → G.Cochar) (m : ℕ) :
    TwistedPeriodData.collisionChart G b μ m ⟶ TwistedPeriodData G b μ :=
  pullback.fst _ _

/-- On the chart, `TwistedPeriodData.collision` followed by the projection to the convolution
Schubert variety. -/
def TwistedPeriodData.collisionChartToConv (G : RedGrp F) (b : G.ptsBreve)
    (μ : Fin 2 → G.Cochar) (m : ℕ) (hm : 0 < m) :
    TwistedPeriodData.collisionChart G b μ m ⟶ GrG.convSchubert G μ :=
  (TwistedPeriodData.collision G b μ m hm).hom ≫ pullback.fst _ _

/-- The base `[∗/underline{J_b(E)}] × ∏_i Spd Ĕ_{μ_i}` of the equivariant shtuka spaces. -/
abbrev ShtBase (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) :
    VStack p :=
  VStack.classifying p (G.sigmaCentralizer b) ⨯ (VSheaf.toStack p).obj (G.legBase μ)

section
variable (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)

/-- The part of `GeneralShtukaTower.actions` about `J_b(E)` alone: its action on `Sht_K` is over
the base of the legs, and the transition maps are equivariant. -/
theorem GeneralShtukaTower.framingAction_spec (K : G.Level) :
    (GeneralShtukaTower.framingAction G b μ K).Invariant (GeneralShtukaTower.legs G b μ K) ∧
      ∀ (K₁ : G.Level) (h₁ : K₁ ≤ K),
        (GeneralShtukaTower.framingAction G b μ K₁).Equivariant
          (GeneralShtukaTower.framingAction G b μ K) (GeneralShtukaTower.transition G b μ h₁) :=
  (GeneralShtukaTower.actions G b μ 1 K K (by ext x; simp)).2.2.2.2.2

/-- The quotient stack `[Sht_{(G,b,μ•),K} / underline{J_b(E)}]` by the action of
`GeneralShtukaTower.actions`. -/
abbrev GeneralShtukaTower.stack (K : G.Level) : VStack p :=
  VStack.quotient (GeneralShtukaTower.framingAction G b μ K)

/-- The `J_b(E)`-torsor `Sht_K → [Sht_K / J_b(E)]`. -/
abbrev GeneralShtukaTower.toStack (K : G.Level) :
    (VSheaf.toStack p).obj (GeneralShtukaTower G b μ K) ⟶ GeneralShtukaTower.stack G b μ K :=
  VStack.quotient.proj _

/-- The structure map `f_K : [Sht_K / J_b(E)] → [∗/J_b(E)] × ∏_i Spd Ĕ_{μ_i}`, given by the
torsor and by the legs. -/
def GeneralShtukaTower.stackLegs (K : G.Level) :
    GeneralShtukaTower.stack G b μ K ⟶ ShtBase G b μ :=
  prod.lift (VStack.quotient.toClassifying _)
    (VStack.quotient.desc _ (GeneralShtukaTower.legs G b μ K)
      (GeneralShtukaTower.framingAction_spec G b μ K).1)

/-- `Sht_K` is the pullback of `[Sht_K / J_b(E)]` along the trivial torsor. -/
theorem GeneralShtukaTower.toStack_cartesian (K : G.Level) :
    VStack.IsCartesian (GeneralShtukaTower.toStack G b μ K)
      ((VSheaf.toStack p).map (GeneralShtukaTower.legs G b μ K))
      (GeneralShtukaTower.stackLegs G b μ K)
      (prod.lift (terminal.from _ ≫ VStack.classifying.point p _) (𝟙 _)) := sorry

/-- The level map `[Sht_{K'} / J_b(E)] → [Sht_K / J_b(E)]` for `K' ≤ K`. -/
def GeneralShtukaTower.stackTransition {K' K : G.Level} (h : K' ≤ K) :
    GeneralShtukaTower.stack G b μ K' ⟶ GeneralShtukaTower.stack G b μ K :=
  VStack.quotient.map _ _ (GeneralShtukaTower.transition G b μ h)
    ((GeneralShtukaTower.framingAction_spec G b μ K).2 K' h)

/-- The level maps are maps over `[∗/J_b(E)] × ∏_i Spd Ĕ_{μ_i}`. -/
theorem GeneralShtukaTower.stackTransition_legs {K' K : G.Level} (h : K' ≤ K) :
    GeneralShtukaTower.stackTransition G b μ h ≫ GeneralShtukaTower.stackLegs G b μ K =
      GeneralShtukaTower.stackLegs G b μ K' := sorry

end

/-! ### Conventions of stages HS3 and HS4

Definitions with no placeholder. -/

/-- `[∗/underline{J_b(E)}] × Spd C`, over which geometric fibres are taken. -/
abbrev GeomBase (G : RedGrp F) (b : G.ptsBreve) : VStack p :=
  VStack.classifying p (G.sigmaCentralizer b) ⨯ (VSheaf.toStack p).obj F.spdC

/-- The geometric fibre: pullback along `[∗/J_b(E)] × Spd C → [∗/J_b(E)] × ∏_i Spd Ĕ_{μ_i}`. -/
def ShtBase.geomFibre (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)
    (Λ : Coeff F ℓ) : DSolid (ShtBase G b μ) Λ ⥤ DSolid (GeomBase G b) Λ :=
  DSolid.pullback (prod.map (𝟙 _) ((VSheaf.toStack p).map (G.legBaseGeomPoint μ))) Λ

/-- A complex of smooth representations of `J_b(E)` as a sheaf on `[∗/J_b(E)] × Spd C`. -/
def GeomBase.ofSmooth (G : RedGrp F) (b : G.ptsBreve) (Λ : Coeff F ℓ) :
    DSmooth (G.sigmaCentralizer b) Λ ⥤ DSolid (GeomBase G b) Λ :=
  (DSmooth.equivClassifying _ Λ).functor ⋙ Dlis.toSolid _ Λ ⋙ DSolid.pullback prod.fst Λ

/-- The geometric fibre of `A ∈ D_■([∗/J_b(E)] × ∏_i Spd Ĕ_{μ_i}, Λ)` is the complex `ρ` of
smooth representations of `J_b(E)`. As the comparison is over `Spd C`, half Tate twists do not
change the property. -/
def HasGeomFibre {G : RedGrp F} {b : G.ptsBreve} {I : Type} [Finite I] {μ : I → G.Cochar}
    {Λ : Coeff F ℓ} (A : DSolid (ShtBase G b μ) Λ) (ρ : DSmooth (G.sigmaCentralizer b) Λ) :
    Prop :=
  Nonempty ((ShtBase.geomFibre G b μ Λ).obj A ≅ (GeomBase.ofSmooth G b Λ).obj ρ)

/-- `⊗_i V_{μ_i} ∈ Rep_Λ(Ĝ)`: the restriction to the diagonal copy of `Ĝ` of the exterior
tensor product `W = ⊠_i V_{μ_i}` of the highest weight representations. -/
def highestWeightTensor (G : RedGrp F) (Λ : Coeff F ℓ) {I : Type} [Finite I] (μ : I → G.Cochar) :
    GeomSatRep G Λ Unit :=
  (GeomSatRep.res G Λ (fun _ : I => ())).obj
    (GeomSatRep.boxtimes G Λ fun i => GeomSatRep.highestWeight G Λ (μ i))

/-- `M ↦ i^{b*} T_W(j_! M) : D(G(E), Λ) → D(J_b(E), Λ)` for `W = ⊠_i V_{μ_i}`. -/
def heckeStalk (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)
    (Λ : Coeff F ℓ) : DSmooth G.pts Λ ⥤ DSmooth (G.sigmaCentralizer b) Λ :=
  BunG.trivialExtension G Λ ⋙ heckeGeom.functor G Λ (highestWeightTensor G Λ μ) ⋙
    BunG.stalk G Λ b

/-- `ρ ↦ X(ρ) = i^{1*} T_{W^∨}(Ri^b_* ρ) : D(J_b(E), Λ) → D(G(E), Λ)` for `W = ⊠_i V_{μ_i}`. -/
def heckeCostalk (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar)
    (Λ : Coeff F ℓ) : DSmooth (G.sigmaCentralizer b) Λ ⥤ DSmooth G.pts Λ :=
  BunG.stalkRight G Λ b ⋙ heckeGeom.functor G Λ (highestWeightTensor G Λ μ)ᘁ ⋙
    BunG.trivialStalk G Λ

local notation "ℚₚ" => LocalField.Qp p

/-! ## HS3: cohomology of local shtuka spaces -/

/-! ### HS3/satake-coefficients-and-partial-frobenius

Twisted Satake coefficients on shtuka spaces and partial Frobenii. `D_ét` and relative Verdier
duality are available for coefficients killed by a power of `ℓ` only, so a statement about `S_W`
carries the hypothesis `Λ.IsTorsion`; the kernel `S'_W` is declared for every `Λ`. -/

section SatakeCoefficients

variable (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) (K : G.Level)
  (Λ : Coeff F ℓ)

/-- HS3/satake-coefficients-and-partial-frobenius: `S_W` on `Gr^{tw,b}_{G,≤μ•}`, for
`W = ⊠_i V_{μ_i}`: the flat perverse universally locally acyclic extension of the Satake sheaf of
`W` from the complement of the Frobenius-twisted partial diagonals, unique up to unique
isomorphism among the flat perverse universally locally acyclic sheaves with this restriction
(Fargues–Scholze IX.3, p. 326). For `Λ` killed by a power of `ℓ`. -/
def satakeCoefficient : Det ((VSheaf.toStack p).obj (TwistedPeriodData G b μ)) Λ := sorry
-- Omitted: `S_W` for `Λ` not killed by a power of `ℓ` (an `ℓ`-adic sheaf); the interfaces have
-- `D_ét` for torsion coefficients only.

/-- `S_W` is universally locally acyclic over `∏_i Spd Ĕ_{μ_i}`. -/
theorem satakeCoefficient.isULA (hΛ : Λ.IsTorsion) :
    Det.isULA ((VSheaf.toStack p).map (TwistedPeriodData.legs G b μ)) Λ
      (satakeCoefficient G b μ Λ) := sorry

/-- On the complement of the twisted diagonals `S_W` is the Beilinson–Drinfeld Satake sheaf of
`W`. -/
theorem satakeCoefficient.restrict_offDiagonal (hΛ : Λ.IsTorsion) :
    Nonempty
      ((Det.pullback ((VSheaf.toStack p).map (TwistedPeriodData.offDiagonalIncl G b μ)) Λ).obj
          (satakeCoefficient G b μ Λ) ≅
        (Det.pullback ((VSheaf.toStack p).map (TwistedPeriodData.offDiagonalToBD G b μ)) Λ).obj
          (GrG.schubertSheaf G μ Λ)) := sorry
-- Omitted: restriction to this locus is fully faithful on flat perverse universally locally
-- acyclic sheaves on `Gr^tw`, so that `S_W` is determined by its restriction (Fargues–Scholze
-- VI.9.3). The interfaces have no perverse t-structure, and for arbitrary universally locally
-- acyclic complexes restriction to the open locus is not faithful.

/-- On the chart around the diagonal twisted by `φ^m`, `m > 0`, `S_W` is the pullback of the
twisted exterior product of the `S_{V_{μ_i}}` on the convolution Schubert variety. The chart for
`m < 0` is the one for `-m` with the two legs exchanged. -/
theorem satakeCoefficient.convolutionChart (μ : Fin 2 → G.Cochar) (m : ℕ) (hm : 0 < m)
    (hΛ : Λ.IsTorsion) :
    Nonempty
      ((Det.pullback ((VSheaf.toStack p).map (TwistedPeriodData.collisionChartIncl G b μ m))
          Λ).obj (satakeCoefficient G b μ Λ) ≅
        (Det.pullback ((VSheaf.toStack p).map (TwistedPeriodData.collisionChartToConv G b μ m hm))
          Λ).obj (GrG.convSchubertSheaf G μ Λ)) := sorry

/-- For one leg, `Gr^tw = Gr_{G,Spd Ĕ_μ,≤μ}` and `S_W` is the Satake sheaf of `V_μ`. -/
theorem satakeCoefficient.oneLeg (ν : G.Cochar) (hΛ : Λ.IsTorsion) :
    ∃ e : TwistedPeriodData G b (fun _ : Unit => ν) ≅ GrG.schubert G (fun _ : Unit => ν),
      e.hom ≫ GrG.schubertLegs G (fun _ : Unit => ν) =
          TwistedPeriodData.legs G b (fun _ : Unit => ν) ∧
        Nonempty (satakeCoefficient G b (fun _ : Unit => ν) Λ ≅
          (Det.pullback ((VSheaf.toStack p).map e.hom) Λ).obj
            (GrG.schubertSheaf G (fun _ : Unit => ν) Λ)) := sorry

/-- For one minuscule leg, `S_W = Λ[d](d/2)` with `d = ⟨2ρ, μ⟩`. -/
theorem satakeCoefficient.oneLeg_minuscule (ν : G.Cochar) (hν : ν.IsMinuscule)
    (hΛ : Λ.IsTorsion) :
    Nonempty ((Det.toSolid _ Λ).obj (satakeCoefficient G b (fun _ : Unit => ν) Λ) ≅
      (DSolid.shiftTwist _ Λ ((RedGrp.Cochar.twoRho ν : ℕ) : ℤ)).obj (𝟙_ _)) := sorry

/-- For fixed `μ•`, an endomorphism of the representation `W = ⊠_i V_{μ_i}` induces an
endomorphism of `S_W` on `Gr^tw_{≤μ•}`, compatibly with identities and composition: it acts on the
Satake sheaf off the twisted diagonals and extends by the full faithfulness of the restriction.
Maps between representations with different bounds are not defined. -/
def satakeCoefficient.map :
    End (GeomSatRep.boxtimes G Λ fun i => GeomSatRep.highestWeight G Λ (μ i)) →*
      End (satakeCoefficient G b μ Λ) := sorry
-- `W` is taken with its action of `Ĝ^I`: the interfaces have no representations of
-- `∏_i (Ĝ ⋊ W_{F_i})`, and every endomorphism of `W` for `Ĝ^I` is one for that group.
-- Omitted: the property that characterises this homomorphism: off the twisted diagonals it is
-- the action of the endomorphism of `W` on the Satake sheaf, and it is the unique extension. The
-- Satake sheaf of the interfaces (`GrG.schubertSheaf`) is an object, not a functor of `W`.

/-- The pullback `π_K^* S_W` to the shtuka space, as a `J_b(E)`-equivariant sheaf: an object on
`[Sht_K / J_b(E)]`. -/
def satakeCoefficient.onShtuka : Det (GeneralShtukaTower.stack G b μ K) Λ := sorry

/-- The sheaf on `[Sht_K / J_b(E)]` restricts on `Sht_K` to the pullback of `S_W` along the
period map `π_K`. -/
def satakeCoefficient.onShtuka_pullback :
    (Det.pullback (GeneralShtukaTower.toStack G b μ K) Λ).obj
        (satakeCoefficient.onShtuka G b μ K Λ) ≅
      (Det.pullback ((VSheaf.toStack p).map (GeneralShtukaTower.periodMap G b μ K)) Λ).obj
        (satakeCoefficient G b μ Λ) := sorry

/-- HS3/satake-coefficients-and-partial-frobenius: the kernel `S'_W = D(π_K^* S_W)^∨` on the
shtuka space, `D` the Verdier dual relative to `∏_i Spd Ĕ_{μ_i}` and `^∨` the solid dual; it is
`J_b(E)`-equivariant, so it is an object on `[Sht_{(G,b,μ•),K} / J_b(E)]`. For `Λ` not killed by
a power of `ℓ` it is formed from the `ℓ`-adic sheaf over `ℤ_ℓ[√q]` and extended to `Λ`. -/
def shtukaKernel : DSolid (GeneralShtukaTower.stack G b μ K) Λ := sorry

/-- On `Sht_K` the kernel is the solid dual of the relative Verdier dual of `π_K^* S_W`. -/
def shtukaKernel.pullback_toStack (hΛ : Λ.IsTorsion) :
    (DSolid.pullback (GeneralShtukaTower.toStack G b μ K) Λ).obj (shtukaKernel G b μ K Λ) ≅
      DSolid.dual ((Det.toSolid _ Λ).obj
        ((Det.verdierDual ((VSheaf.toStack p).map (GeneralShtukaTower.legs G b μ K)) Λ).obj
          (op ((Det.pullback ((VSheaf.toStack p).map (GeneralShtukaTower.periodMap G b μ K))
            Λ).obj (satakeCoefficient G b μ Λ))))) := sorry
-- Omitted: the formula `S'_W = D(S_W)^∨` for `Λ` not killed by a power of `ℓ`; the interfaces
-- have no `ℓ`-adic étale sheaves and no Verdier duality for them.

/-- For `K' ≤ K` and the level map `π : Sht_{K'} → Sht_K`: `π^* S'_{W,K} = S'_{W,K'}`. As both
are objects on the quotients by `J_b(E)`, the isomorphism is `J_b(E)`-equivariant. -/
def shtukaKernel.level {K' K : G.Level} (h : K' ≤ K) :
    (DSolid.pullback (GeneralShtukaTower.stackTransition G b μ h) Λ).obj
        (shtukaKernel G b μ K Λ) ≅ shtukaKernel G b μ K' Λ := sorry
-- Omitted: compatibility of these isomorphisms with composition of level maps.

/-- For one minuscule leg, `S'_W = Λ[-d](-d/2)` with `d = ⟨2ρ, μ⟩`. -/
def shtukaKernel.minuscule (ν : G.Cochar) (hν : ν.IsMinuscule) :
    shtukaKernel G b (fun _ : Unit => ν) K Λ ≅
      (DSolid.shiftTwist _ Λ (-((RedGrp.Cochar.twoRho ν : ℕ) : ℤ))).obj (𝟙_ _) := sorry

/-- For `W` trivial (all `μ_i = 0`), `S'_W = Λ`. -/
def shtukaKernel.unit : shtukaKernel G b (fun _ : I => (0 : G.Cochar)) K Λ ≅ 𝟙_ _ := sorry

/-- For `W` trivial, `S_W = Λ`. -/
theorem satakeCoefficient.unit (hΛ : Λ.IsTorsion) :
    Nonempty ((Det.toSolid _ Λ).obj (satakeCoefficient G b (fun _ : I => (0 : G.Cochar)) Λ) ≅
      𝟙_ _) := sorry

/-- If `Λ` is killed by a power of `ℓ` then `f_{K♮}(S'_W ⊗ B) ≅ Rf_{K!}(S_W ⊗ B)` for a
`J_b(E)`-equivariant sheaf `B`, that is for `B ∈ D_ét([Sht_K/J_b(E)], Λ)`, and the structure map
of the quotient stack (Fargues–Scholze VII.5.2). The case of a sheaf on `Sht_K` with no
equivariance is `shtukaKernel.torsion_sheaf`. -/
def shtukaKernel.torsion (hΛ : Λ.IsTorsion) (B : Det (GeneralShtukaTower.stack G b μ K) Λ) :
    (DSolid.sharp (GeneralShtukaTower.stackLegs G b μ K) Λ).obj
        (shtukaKernel G b μ K Λ ⊗ (Det.toSolid _ Λ).obj B) ≅
      (Det.toSolid _ Λ).obj ((Det.shriek (GeneralShtukaTower.stackLegs G b μ K) Λ).obj
        (satakeCoefficient.onShtuka G b μ K Λ ⊗ B)) := sorry

/-- shtukaKernel.torsion for `B ∈ D_ét(Sht_K, Λ)` and `f_K : Sht_K → ∏_i Spd Ĕ_{μ_i}` itself:
`f_{K♮}(S'_W ⊗ B) ≅ Rf_{K!}(S_W ⊗ B)`. This is the form applied to `B = j_!Λ` for the inclusion
`j` of a quasicompact open subset, which is not stable under `J_b(E)`. -/
def shtukaKernel.torsion_sheaf (hΛ : Λ.IsTorsion)
    (B : Det ((VSheaf.toStack p).obj (GeneralShtukaTower G b μ K)) Λ) :
    (DSolid.sharp ((VSheaf.toStack p).map (GeneralShtukaTower.legs G b μ K)) Λ).obj
        ((DSolid.pullback (GeneralShtukaTower.toStack G b μ K) Λ).obj (shtukaKernel G b μ K Λ) ⊗
          (Det.toSolid _ Λ).obj B) ≅
      (Det.toSolid _ Λ).obj
        ((Det.shriek ((VSheaf.toStack p).map (GeneralShtukaTower.legs G b μ K)) Λ).obj
          ((Det.pullback ((VSheaf.toStack p).map (GeneralShtukaTower.periodMap G b μ K)) Λ).obj
            (satakeCoefficient G b μ Λ) ⊗ B)) := sorry

end SatakeCoefficients

section PartialFrobenii

variable {I : Type} [Finite I] (Fs : I → LocalField p) (X : VStack p) (Λ : Coeff F ℓ)

/-- `∏_i Spd F̆_i`, for a family of local fields `F_i`. -/
abbrev frobBase : VSheaf p := ∏ᶜ fun i => (Fs i).spdBreve

open Classical in
/-- The partial Frobenius `φ_i` of `∏_j Spd F̆_j`: the Frobenius of the `i`-th factor. -/
def partialFrob (i : I) : frobBase Fs ⟶ frobBase Fs :=
  Limits.Pi.map fun j => if j = i then (Fs j).spdBreveFrob.hom else 𝟙 _

/-- The partial Frobenii commute. -/
theorem partialFrob_comm (i j : I) :
    partialFrob Fs i ≫ partialFrob Fs j = partialFrob Fs j ≫ partialFrob Fs i := by
  classical
  apply Limits.Pi.hom_ext
  intro k
  simp only [partialFrob, Category.assoc, Limits.Pi.map_π, Limits.Pi.map_π_assoc]
  split_ifs <;> simp

/-- `id × φ_i` on `X × ∏_j Spd F̆_j`. -/
def frobOn (i : I) :
    X ⨯ (VSheaf.toStack p).obj (frobBase Fs) ⟶ X ⨯ (VSheaf.toStack p).obj (frobBase Fs) :=
  prod.map (𝟙 X) ((VSheaf.toStack p).map (partialFrob Fs i))

theorem frobOn_comm (i j : I) :
    frobOn Fs X i ≫ frobOn Fs X j = frobOn Fs X j ≫ frobOn Fs X i := by
  unfold frobOn
  rw [prod.map_map, prod.map_map, ← Functor.map_comp, ← Functor.map_comp,
    partialFrob_comm Fs i j]

/-- The canonical isomorphism `φ_i^* φ_j^* ≅ φ_j^* φ_i^*`, from `φ_i φ_j = φ_j φ_i`. -/
def frobSwap (i j : I) :
    DSolid.pullback (frobOn Fs X j) Λ ⋙ DSolid.pullback (frobOn Fs X i) Λ ≅
      DSolid.pullback (frobOn Fs X i) Λ ⋙ DSolid.pullback (frobOn Fs X j) Λ :=
  (DSolid.pullbackComp (frobOn Fs X i) (frobOn Fs X j) Λ).symm ≪≫
    eqToIso (congrArg (fun f => DSolid.pullback f Λ) (frobOn_comm Fs X i j)) ≪≫
    DSolid.pullbackComp (frobOn Fs X j) (frobOn Fs X i) Λ

/-- HS3/satake-coefficients-and-partial-frobenius: a system of partial Frobenii on
`A ∈ D_■(X × ∏_i Spd F̆_i, Λ)`: isomorphisms `F_i : φ_i^* A ≅ A` with
`F_i ∘ φ_i^*(F_j) = F_j ∘ φ_j^*(F_i)`. This is the part of an action of `∏_i φ_i^ℤ` on `A` that
a category (as opposed to an ∞-category) sees; the higher coherences are not recorded. -/
structure PartialFrobenius (A : DSolid (X ⨯ (VSheaf.toStack p).obj (frobBase Fs)) Λ) where
  /-- The partial Frobenius `F_i : φ_i^* A ≅ A`. -/
  frob : ∀ i, (DSolid.pullback (frobOn Fs X i) Λ).obj A ≅ A
  /-- `F_i ∘ φ_i^*(F_j) = F_j ∘ φ_j^*(F_i)`. -/
  comm : ∀ i j,
    (DSolid.pullback (frobOn Fs X i) Λ).map (frob j).hom ≫ (frob i).hom =
      (frobSwap Fs X Λ i j).hom.app A ≫
        (DSolid.pullback (frobOn Fs X j) Λ).map (frob i).hom ≫ (frob j).hom

/-- `X × ∏_i Spd F̆_i → X × ∏_i Spd F̆_i/φ_i^ℤ = X × ∏_i Div¹_{F_i}`. -/
def frobQuot :
    X ⨯ (VSheaf.toStack p).obj (frobBase Fs) ⟶
      X ⨯ (VSheaf.toStack p).obj (∏ᶜ fun i => Div1 (Fs i)) :=
  prod.map (𝟙 X) ((VSheaf.toStack p).map (Limits.Pi.map fun i => Div1.proj (Fs i)))

theorem frobOn_quot (i : I) : frobOn Fs X i ≫ frobQuot Fs X = frobQuot Fs X := by
  classical
  have h : partialFrob Fs i ≫ Limits.Pi.map (fun i => Div1.proj (Fs i)) =
      Limits.Pi.map fun i => Div1.proj (Fs i) := by
    apply Limits.Pi.hom_ext
    intro k
    simp only [partialFrob, Category.assoc, Limits.Pi.map_π, Limits.Pi.map_π_assoc]
    split_ifs <;> simp [Div1.frob_proj]
  unfold frobOn frobQuot
  rw [prod.map_map, ← Functor.map_comp, h, Category.comp_id]

/-- The pullback to `X × ∏_i Spd F̆_i` of an object on `X × ∏_i Div¹_{F_i}` carries partial
Frobenii: the descent datum. The commutation is the coherence of the pullback isomorphisms of
the owner of `D_■`. -/
def PartialFrobenius.descent
    (A₀ : DSolid (X ⨯ (VSheaf.toStack p).obj (∏ᶜ fun i => Div1 (Fs i))) Λ) :
    PartialFrobenius Fs X Λ ((DSolid.pullback (frobQuot Fs X) Λ).obj A₀) where
  frob i := (DSolid.pullbackComp (frobOn Fs X i) (frobQuot Fs X) Λ).symm.app A₀ ≪≫
    eqToIso (by rw [frobOn_quot])
  comm := sorry

/-- Descent along `Spd F̆ → Spd F̆/φ^ℤ`, for one leg: every object with a partial Frobenius is
the pullback of an object on `X × Div¹_F` with its descent datum. -/
theorem PartialFrobenius.descent_surjective [Unique I]
    (A : DSolid (X ⨯ (VSheaf.toStack p).obj (frobBase Fs)) Λ) (P : PartialFrobenius Fs X Λ A) :
    ∃ (A₀ : DSolid (X ⨯ (VSheaf.toStack p).obj (∏ᶜ fun i => Div1 (Fs i))) Λ)
      (e : (DSolid.pullback (frobQuot Fs X) Λ).obj A₀ ≅ A),
      ∀ i, (DSolid.pullback (frobOn Fs X i) Λ).map e.hom ≫ (P.frob i).hom =
        ((PartialFrobenius.descent Fs X Λ A₀).frob i).hom ≫ e.hom := sorry
-- Omitted: the equivalence of ∞-categories between objects with partial Frobenii (with all
-- coherences) and `D_■(X × ∏_i Spd F̆_i/φ_i^ℤ, Λ)`. On the categories declared here pullback is
-- not faithful (it forgets `H¹(φ^ℤ, Hom(A, B[-1]))`), and for several legs an object with
-- commuting partial Frobenii need not descend without the higher coherences.

/-- The objects of `D_■(X × ∏_i Div¹_{F_i}, Λ)` that lie in the full subcategory
`D_lis(X, Λ)^{B∏_i W_{F_i}}`: those that come from `X × [∗/∏_i W_{F_i}]` and are lisse on `X`
(Fargues–Scholze IX.1.1; HS1/continuous-weil-descent). No placeholder. -/
def PartialFrobenius.weil :
    ObjectProperty (DSolid (X ⨯ (VSheaf.toStack p).obj (∏ᶜ fun i => Div1 (Fs i))) Λ) := fun A =>
  ∃ A' : DSolid (X ⨯ VStack.classifying p (∀ i, (Fs i).WeilGroup)) Λ,
    Nonempty ((DSolid.pullback (prod.map (𝟙 X) (Div1.familyToClassifyingWeil Fs)) Λ).obj A' ≅
      A) ∧
    DSolid.isLisse X Λ ((DSolid.pullback
      (prod.lift (𝟙 X) (terminal.from X ≫ VStack.classifying.point p _)) Λ).obj A')
-- Omitted: the continuous action of `∏_i W_{F_i}` on the pullback to `X` of such an object.
-- Omitted: that the pullback from `X × [∗/∏_i W_{F_i}]` is fully faithful, so that these objects
-- form a full subcategory equivalent to the lisse objects upstairs; for `X = Bun_G` and the
-- fields `F_i = E` this is `condensedStructure.lisse_equivariant` (HS1/continuous-weil-descent).

end PartialFrobenii

-- shtukaKernel.minuscule_test
-- Omitted: that `Gr_{≤μ}` is the diamond of `ℙ^{n-1}` over `Spd ℚ̆_p`, and that the relative
-- Verdier dual of `S_W = Λ[n-1]((n-1)/2)` is again `Λ[n-1]((n-1)/2)`.
example (n : ℕ) (hn : 1 ≤ n) (b : (RedGrp.GLn ℚₚ n).ptsBreve) (K : (RedGrp.GLn ℚₚ n).Level)
    (Λ : Coeff ℚₚ ℓ) :
    RedGrp.Cochar.twoRho (RedGrp.GLn.minuscule ℚₚ n 1) = n - 1 ∧
      Nonempty
        (shtukaKernel (RedGrp.GLn ℚₚ n) b (fun _ : Unit => RedGrp.GLn.minuscule ℚₚ n 1) K Λ ≅
          (DSolid.shiftTwist _ Λ (1 - (n : ℤ))).obj (𝟙_ _)) ∧
      (Λ.IsTorsion →
        Nonempty ((Det.toSolid _ Λ).obj
            (satakeCoefficient (RedGrp.GLn ℚₚ n) b
              (fun _ : Unit => RedGrp.GLn.minuscule ℚₚ n 1) Λ) ≅
          (DSolid.shiftTwist _ Λ ((n : ℤ) - 1)).obj (𝟙_ _))) := by
  sorry

-- satakeCoefficient.torus_test
example (G : RedGrp F) (hT : RedGrp.isTorus F G) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) (K : G.Level) (Λ : Coeff F ℓ) :
    IsIso (TwistedPeriodData.legs G b μ) ∧
      Nonempty (shtukaKernel G b μ K Λ ≅ 𝟙_ _) ∧
      (Λ.IsTorsion → Nonempty ((Det.toSolid _ Λ).obj (satakeCoefficient G b μ Λ) ≅ 𝟙_ _)) := by
  sorry

-- satakeCoefficient.twisted_diagonal_test
-- The fibre of `Gr^tw` over a geometric point `x` of the base is the pullback of v-sheaves. For
-- `S_1♯ = φ^m(S_2♯)`, `m ≠ 0`, the restriction of `S_W` to it is `Λ[2](1)`; over the diagonal
-- (`m = 0`) it is not: the fibre is the singular Schubert variety of `(1, -1)`.
-- Omitted: the two fibres themselves (for `m ≠ 0` the convolution variety, a `ℙ¹`-bundle over
-- `ℙ¹`; over the diagonal `Gr_{≤(1,-1)}`), and that over the diagonal `S_W` restricts to
-- `Rm_*(Λ[2](1))` for the convolution map `m`, with stalk of total rank `2` at `Gr_{(0,0)}`.
example (b : (RedGrp.GLn ℚₚ 2).ptsBreve) (μ : Fin 2 → (RedGrp.GLn ℚₚ 2).Cochar)
    (hμ : μ = ![RedGrp.GLn.minuscule ℚₚ 2 1, (RedGrp.GLn.minuscule ℚₚ 2 1).dual])
    (Λ : Coeff ℚₚ ℓ) (hΛ : Λ.IsTorsion) [Nontrivial Λ.carrier]
    (x : (ℚₚ).spdC ⟶ (RedGrp.GLn ℚₚ 2).legBase μ) (m : ℤ)
    (hx : x ≫ Pi.π _ 0 ≫ ((RedGrp.GLn ℚₚ 2).reflexExt (μ 0)).spdBreveMap =
      x ≫ Pi.π _ 1 ≫ ((RedGrp.GLn ℚₚ 2).reflexExt (μ 1)).spdBreveMap ≫
        ((show Aut (ℚₚ).spdBreve from (ℚₚ).spdBreveFrob) ^ m).hom) :
    Nonempty ((Det.toSolid _ Λ).obj ((Det.pullback ((VSheaf.toStack p).map
        (pullback.fst (TwistedPeriodData.legs (RedGrp.GLn ℚₚ 2) b μ) x)) Λ).obj
          (satakeCoefficient (RedGrp.GLn ℚₚ 2) b μ Λ)) ≅
      (DSolid.shiftTwist _ Λ 2).obj (𝟙_ _)) ↔ m ≠ 0 := by
  sorry

-- satakeCoefficient.one_leg_test
example (G : RedGrp F) (b : G.ptsBreve) (ν : G.Cochar) (Λ : Coeff F ℓ) (hΛ : Λ.IsTorsion) :
    IsIso (TwistedPeriodData.offDiagonalIncl G b (fun _ : Unit => ν)) ∧
      ∃ e : TwistedPeriodData G b (fun _ : Unit => ν) ≅ GrG.schubert G (fun _ : Unit => ν),
        e.hom ≫ GrG.schubertLegs G (fun _ : Unit => ν) =
            TwistedPeriodData.legs G b (fun _ : Unit => ν) ∧
          Nonempty (satakeCoefficient G b (fun _ : Unit => ν) Λ ≅
            (Det.pullback ((VSheaf.toStack p).map e.hom) Λ).obj
              (GrG.schubertSheaf G (fun _ : Unit => ν) Λ)) := by
  sorry

-- PartialFrobenius.descent_test
-- For `X` a point and one leg: the partial Frobenius structures on the constant sheaf `Λ` are
-- the `u · can` with `u ∈ Λ^×`, and the descended object on `Div¹` is constant exactly for
-- `u = 1`.
example (F' : LocalField p) (Λ : Coeff F ℓ) :
    (∀ P : PartialFrobenius (fun _ : Unit => F') (⊤_ (VStack p)) Λ (𝟙_ _), ∃ u : Λ.carrierˣ,
        (P.frob ()).hom = (u : Λ.carrier) • (Functor.Monoidal.εIso
          (DSolid.pullback (frobOn (fun _ : Unit => F') (⊤_ (VStack p)) ()) Λ)).inv) ∧
      ∀ (u : Λ.carrierˣ)
        (L : DSolid ((⊤_ (VStack p)) ⨯ (VSheaf.toStack p).obj (∏ᶜ fun _ : Unit => Div1 F')) Λ)
        (e : (DSolid.pullback (frobQuot (fun _ : Unit => F') (⊤_ (VStack p))) Λ).obj L ≅ 𝟙_ _),
        (DSolid.pullback (frobOn (fun _ : Unit => F') (⊤_ (VStack p)) ()) Λ).map e.hom ≫
            ((u : Λ.carrier) • (Functor.Monoidal.εIso
              (DSolid.pullback (frobOn (fun _ : Unit => F') (⊤_ (VStack p)) ()) Λ)).inv) =
          ((PartialFrobenius.descent (fun _ : Unit => F') (⊤_ (VStack p)) Λ L).frob ()).hom ≫
            e.hom →
        (Nonempty (L ≅ 𝟙_ _) ↔ u = 1) := by
  sorry
-- Omitted: for two legs, a pair `(F_1, F_2)` that does not commute is not a system of partial
-- Frobenii; this is the field `comm` of the structure and is not a statement about the objects.

/-! ### HS3/compact-support-at-levels

Completed compact support and tower complexes. -/

/-- The conjugate of a smaller level is smaller. -/
theorem RedGrp.Level.conj_mono {G : RedGrp F} (g : G.pts) {K' K : G.Level} (h : K' ≤ K) :
    K'.conj g ≤ K.conj g := fun _ hx => h hx

/-- The image in `J_1(E)` of a smaller open subgroup is smaller. -/
theorem RedGrp.centralizerOneLevel_mono (G : RedGrp F) {K' K : OpenSubgroup G.pts} (h : K' ≤ K) :
    G.centralizerOneLevel K' ≤ G.centralizerOneLevel K :=
  Subgroup.map_mono (f := G.inclCentralizerOne) h

section CompactSupport

variable (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) (K : G.Level)
  (Λ : Coeff F ℓ)

/-- HS3/compact-support-at-levels: `C_K = f_{K♮} S'_W ∈ D_■([∗/J_b(E)] × ∏_i Spd Ĕ_{μ_i}, Λ)`, the
relative homology of `f_K : Sht_{(G,b,μ•),K} → ∏_i Spd Ĕ_{μ_i}` with coefficients the kernel
`S'_W = D(S_W)^∨` (Fargues–Scholze IX.3.2). No ℓ-adic limit is taken. -/
def compactSupportAtLevel : DSolid (ShtBase G b μ) Λ :=
  (DSolid.sharp (GeneralShtukaTower.stackLegs G b μ K) Λ).obj (shtukaKernel G b μ K Λ)

/-- If `Λ` is killed by a power of `ℓ`, then `C_K ≅ Rf_{K!} S_W`. The general form, with a
factor `B ∈ D_ét(Sht_K, Λ)`, is `shtukaKernel.torsion`. -/
def compactSupportAtLevel.torsion (hΛ : Λ.IsTorsion) :
    compactSupportAtLevel G b μ K Λ ≅
      (Det.toSolid _ Λ).obj ((Det.shriek (GeneralShtukaTower.stackLegs G b μ K) Λ).obj
        (satakeCoefficient.onShtuka G b μ K Λ)) := sorry

/-- For a homomorphism `Λ → Λ'` of `ℤ_ℓ[√q]`-algebras, `C_{K,Λ} ⊗^{L■}_Λ Λ' ≅ C_{K,Λ'}`. -/
def compactSupportAtLevel.baseChange {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') :
    (DSolid.extendScalars _ φ).obj (compactSupportAtLevel G b μ K Λ) ≅
      compactSupportAtLevel G b μ K Λ' := sorry

/-- HS3/compact-support-at-levels: Huber's compactly supported cohomology
`RΓ_c(M_C, ℤ_ℓ) = colim_U Rlim_m RΓ_c(U_C, ℤ/ℓ^m)` of a partially proper rigid space `M`, `U`
running over its quasicompact open subsets (Huber; Fargues–Scholze IX.3, p. 324). The limit over
`m` is formed at each `U`, before the colimit over `U`. A homotopy colimit and a homotopy limit
cannot be formed in `DerivedCategory`, so the body is the placeholder. -/
def huberCompactSupport {F : LocalField p} (M : RigSp F) (ℓ : ℕ) [Fact ℓ.Prime] : DMod ℤ_[ℓ] :=
  sorry

/-- `RΓ_c(M_C, Λ) = RΓ_c(M_C, ℤ_ℓ) ⊗^L_{ℤ_ℓ} Λ`: the coefficients are extended after the limit
over `m` and before nothing else. -/
def huberCompactSupport.coeff {F₁ : LocalField p} (M : RigSp F₁) (Λ : Coeff F ℓ) :
    DMod Λ.carrier :=
  (DMod.extendScalars (algebraMap ℤ_[ℓ] Λ.carrier)).obj (huberCompactSupport M ℓ)

/-- `RΓ_c(M_C, ℤ_ℓ) ⊗^L ℤ/ℓ^n` is the compactly supported cohomology of `M_C` with
`ℤ/ℓ^n`-coefficients. -/
def huberCompactSupport.torsion {F : LocalField p} (M : RigSp F)
    (hM : RigSp.partiallyProper F M) (ℓ : ℕ) [Fact ℓ.Prime] (n : ℕ) :
    (DMod.extendScalars (PadicInt.toZModPow n)).obj (huberCompactSupport M ℓ) ≅ M.RΓc ℓ n :=
  sorry

/-- For one minuscule leg, `C_K = f_{K♮} Λ[-d](-d/2)` with `d = ⟨2ρ, μ⟩`. -/
def compactSupportAtLevel.minuscule (ν : G.Cochar) (hν : ν.IsMinuscule) :
    compactSupportAtLevel G b (fun _ : Unit => ν) K Λ ≅
      (DSolid.shiftTwist _ Λ (-((RedGrp.Cochar.twoRho ν : ℕ) : ℤ))).obj
        ((DSolid.sharp (GeneralShtukaTower.stackLegs G b (fun _ : Unit => ν) K) Λ).obj (𝟙_ _)) :=
  sorry

/-- For one minuscule leg over `ℚ_p`, the geometric fibre of `C_K` is
`RΓ_c(M_{K,C}, Λ)[d](d/2)` (through HS3/huber-cohomology-comparison). -/
theorem compactSupportAtLevel.minuscule_fibre (G : RedGrp ℚₚ) (b : G.ptsBreve) (ν : G.Cochar)
    (hν : ν.IsMinuscule) (hb : RedGrp.BofG.mk b ∈ G.BGmu ν.dual) (K : G.Level)
    (Λ : Coeff ℚₚ ℓ) :
    ∃ ρ : DSmooth (G.sigmaCentralizer b) Λ,
      HasGeomFibre (compactSupportAtLevel G b (fun _ : Unit => ν) K Λ) ρ ∧
        Nonempty ((DSmooth.forget _ Λ).obj ρ ≅
          (shiftFunctor (DMod Λ.carrier) ((RedGrp.Cochar.twoRho ν : ℕ) : ℤ)).obj
            (huberCompactSupport.coeff (Rigidification.space G b ν K) Λ)) := sorry

/-- For `K' ≤ K`: the trace `tr : C_{K'} → C_K`, the counit of `π_♮ ⊣ π^*` for the finite étale
level map `π : Sht_{K'} → Sht_K`, applied to `S'_W` with `π^* S'_W = S'_W` and followed by
`f_{K♮}`. It is a map over `[∗/J_b(E)]`, hence `J_b(E)`-equivariant. -/
def compactSupportAtLevel.tr {K' K : G.Level} (h : K' ≤ K) :
    compactSupportAtLevel G b μ K' Λ ⟶ compactSupportAtLevel G b μ K Λ := sorry

theorem compactSupportAtLevel.tr_refl :
    compactSupportAtLevel.tr G b μ Λ (le_refl K) = 𝟙 _ := sorry

theorem compactSupportAtLevel.tr_comp {K'' K' K : G.Level} (h' : K'' ≤ K') (h : K' ≤ K) :
    compactSupportAtLevel.tr G b μ Λ h' ≫ compactSupportAtLevel.tr G b μ Λ h =
      compactSupportAtLevel.tr G b μ Λ (h'.trans h) := sorry

/-- For `K' ≤ K`: the pullback `pull : C_K → C_{K'}`, the unit of `π^* ⊣ π_*` with
`π_* = π_♮`. -/
def compactSupportAtLevel.pull {K' K : G.Level} (h : K' ≤ K) :
    compactSupportAtLevel G b μ K Λ ⟶ compactSupportAtLevel G b μ K' Λ := sorry

theorem compactSupportAtLevel.pull_refl :
    compactSupportAtLevel.pull G b μ Λ (le_refl K) = 𝟙 _ := sorry

theorem compactSupportAtLevel.pull_comp {K'' K' K : G.Level} (h' : K'' ≤ K') (h : K' ≤ K) :
    compactSupportAtLevel.pull G b μ Λ h ≫ compactSupportAtLevel.pull G b μ Λ h' =
      compactSupportAtLevel.pull G b μ Λ (h'.trans h) := sorry

/-- An element `g ∈ G(E)` induces `C_K ≅ C_{gKg⁻¹}`, through the isomorphism
`Sht_K ≅ Sht_{gKg⁻¹}` of the tower. The action of `J_b(E)` is the structure of `C_K` as an
object over `[∗/J_b(E)]`, and `tr` and `pull` are maps of such objects. -/
def compactSupportAtLevel.actions (g : G.pts) :
    compactSupportAtLevel G b μ K Λ ≅ compactSupportAtLevel G b μ (K.conj g) Λ := sorry

/-- The isomorphisms of `g ∈ G(E)` commute with `tr`. -/
theorem compactSupportAtLevel.actions_tr (g : G.pts) {K' K : G.Level} (h : K' ≤ K) :
    compactSupportAtLevel.tr G b μ Λ h ≫ (compactSupportAtLevel.actions G b μ K Λ g).hom =
      (compactSupportAtLevel.actions G b μ K' Λ g).hom ≫
        compactSupportAtLevel.tr G b μ Λ (RedGrp.Level.conj_mono g h) := sorry

/-- The isomorphisms of `g ∈ G(E)` commute with `pull`. -/
theorem compactSupportAtLevel.actions_pull (g : G.pts) {K' K : G.Level} (h : K' ≤ K) :
    compactSupportAtLevel.pull G b μ Λ h ≫ (compactSupportAtLevel.actions G b μ K' Λ g).hom =
      (compactSupportAtLevel.actions G b μ K Λ g).hom ≫
        compactSupportAtLevel.pull G b μ Λ (RedGrp.Level.conj_mono g h) := sorry
-- Omitted: the isomorphisms for `g` and `g'` compose to the one for `g g'` (the two targets are
-- equal levels and not the same term).

/-- HS3/compact-support-at-levels: the tower object `C_∞ = colim_K C_K` along `pull`, over all
compact open `K` or over the cofinal open pro-`p` ones. A homotopy colimit cannot be formed in
the triangulated category, so the body is the placeholder. It is not the inverse limit of the
`C_K` along `tr`. -/
def towerCompactSupport : DSolid (ShtBase G b μ) Λ := sorry

/-- The canonical map `C_K → C_∞`. -/
def towerCompactSupport.ι :
    compactSupportAtLevel G b μ K Λ ⟶ towerCompactSupport G b μ Λ := sorry

/-- The maps `C_K → C_∞` are compatible with `pull`. -/
theorem towerCompactSupport.pull_ι {K' K : G.Level} (h : K' ≤ K) :
    compactSupportAtLevel.pull G b μ Λ h ≫ towerCompactSupport.ι G b μ K' Λ =
      towerCompactSupport.ι G b μ K Λ := sorry

/-- The smooth action of `G(E)` on `C_∞`; it commutes with the action of `J_b(E)`, being an
action on an object over `[∗/J_b(E)]`. -/
def towerCompactSupport.action : G.pts →* Aut (towerCompactSupport G b μ Λ) := sorry

/-- The action of `g` on `C_∞` restricts to `C_K ≅ C_{gKg⁻¹}`. -/
theorem towerCompactSupport.ι_action (g : G.pts) :
    towerCompactSupport.ι G b μ K Λ ≫ (towerCompactSupport.action G b μ Λ g).hom =
      (compactSupportAtLevel.actions G b μ K Λ g).hom ≫
        towerCompactSupport.ι G b μ (K.conj g) Λ := sorry

/-- For `K` open pro-`p`: the idempotent `e_K` of `C_∞` that averages the smooth action over
`K`, with respect to the Haar measure of total mass `1` (defined as `p` is invertible in `Λ`). On
the image of `C_{K'}`, for `K'` open normal in `K`, it is the idempotent
`e_{K/K'} = [K : K']⁻¹ Σ_{γ ∈ K/K'} γ^*` (`towerCompactSupport.average_level`), so its image is
`(C_∞)^K`, the colimit over these `K'` of the summands `e_{K/K'} C_{K'}`. For other `K` no
statement uses it. -/
def towerCompactSupport.average (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) (K : G.Level) (Λ : Coeff F ℓ) :
    towerCompactSupport G b μ Λ ⟶ towerCompactSupport G b μ Λ := sorry

/-- Every compact open `K` acts trivially on the image of `C_K` in `C_∞`; no hypothesis on `K`
is needed for this. -/
theorem towerCompactSupport.ι_action_of_mem (k : G.pts) (hk : k ∈ K.1) :
    towerCompactSupport.ι G b μ K Λ ≫ (towerCompactSupport.action G b μ Λ k).hom =
      towerCompactSupport.ι G b μ K Λ := sorry

/-- For `K` open pro-`p` the canonical map `C_K → C_∞` identifies `C_K` with `(C_∞)^K`, the
colimit over the open normal subgroups `K'` of `K` of the summands `e_{K/K'} C_{K'}`: `K` acts
trivially on the image of `C_K`, and `C_K → C_∞` is a split monomorphism onto the image of the
averaging idempotent `e_K`. -/
theorem towerCompactSupport.invariants (hK : IsOpenProP p K.1) :
    (∀ k ∈ K.1, towerCompactSupport.ι G b μ K Λ ≫ (towerCompactSupport.action G b μ Λ k).hom =
        towerCompactSupport.ι G b μ K Λ) ∧
      ∃ r : towerCompactSupport G b μ Λ ⟶ compactSupportAtLevel G b μ K Λ,
        towerCompactSupport.ι G b μ K Λ ≫ r = 𝟙 _ ∧
          r ≫ towerCompactSupport.ι G b μ K Λ = towerCompactSupport.average G b μ K Λ := sorry
-- Omitted: the universal property of `C_∞` as a colimit, which is a statement about the stable
-- ∞-category and not about its homotopy category.

/-- After pullback to the geometric point, `C_K` is `i^{b*} T_W(j_! c-Ind_K^{G(E)} Λ)`
(HS3/hecke-cohomology-comparison). -/
theorem compactSupportAtLevel.hecke :
    HasGeomFibre (compactSupportAtLevel G b μ K Λ)
      ((heckeStalk G b μ Λ).obj (DSmooth.cInd G.pts Λ K.1)) := sorry

/-- For a torus `T` over `ℚ_p` and one leg `μ`: for `b` the class with `κ(b) = -μ♯`, that is
`[b] ∈ B(T, μ⁻¹)`, the geometric fibre of `C_K` is `c-Ind_K^{T(ℚ_p)} Λ` in degree `0`, with
`J_b(ℚ_p) = T(ℚ_p)` acting by translation; for every other class `b` the tower is empty and
`C_K = 0`. -/
theorem compactSupportAtLevel.torus (G : RedGrp ℚₚ) (hT : RedGrp.isTorus ℚₚ G) (b : G.ptsBreve)
    (ν : G.Cochar) (K : G.Level) (Λ : Coeff ℚₚ ℓ) :
    (G.kottwitz (RedGrp.BofG.mk b) = RedGrp.Cochar.sharp ν.dual →
        HasGeomFibre (compactSupportAtLevel G b (fun _ : Unit => ν) K Λ)
          (DSmooth.cInd _ Λ (G.torusLevel hT b K.1))) ∧
      (G.kottwitz (RedGrp.BofG.mk b) ≠ RedGrp.Cochar.sharp ν.dual →
        (GeneralShtukaTower G b (fun _ : Unit => ν) K).IsEmpty ∧
          IsZero (compactSupportAtLevel G b (fun _ : Unit => ν) K Λ)) := sorry

end CompactSupport

-- compactSupportAtLevel.torus_test
-- The underlying complex is the module `Λ[T(ℚ_p)/K]` of finitely supported functions on
-- `T(ℚ_p)/K`, in degree `0`; it is not the module of all functions.
-- Omitted: that the geometric fibre of `Sht_{T,b,μ,K}` is the discrete set `T(ℚ_p)/K` (it is in
-- `torusProductsAndDeterminant`), that `d = 0`, and that `S'_W = Λ`
-- (`satakeCoefficient.torus_test`).
example (G : RedGrp ℚₚ) (hT : RedGrp.isTorus ℚₚ G) (b : G.ptsBreve) (ν : G.Cochar)
    (hb : RedGrp.BofG.mk b ∈ G.BGmu ν.dual) (K : G.Level) (Λ : Coeff ℚₚ ℓ) :
    HasGeomFibre (compactSupportAtLevel G b (fun _ : Unit => ν) K Λ)
        (DSmooth.cInd _ Λ (G.torusLevel hT b K.1)) ∧
      Nonempty ((DSmooth.forget _ Λ).obj (DSmooth.cInd _ Λ (G.torusLevel hT b K.1)) ≅
        DMod.ofModule Λ.carrier ((G.pts ⧸ K.1.toSubgroup) →₀ Λ.carrier)) := by
  sorry

-- compactSupportAtLevel.trivial_leg_test
-- Omitted: `Sht_{G,1,0,K} = G(ℚ_p)/K × Spd ℚ̆_p`, and that `C_K` is constant along `Spd ℚ̆_p`.
example (G : RedGrp ℚₚ) (b : G.ptsBreve) (K : G.Level) (Λ : Coeff ℚₚ ℓ) :
    HasGeomFibre (compactSupportAtLevel G 1 (fun _ : Unit => (0 : G.Cochar)) K Λ)
        (DSmooth.cInd _ Λ (G.centralizerOneLevel K.1)) ∧
      (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk 1 →
        (GeneralShtukaTower G b (fun _ : Unit => (0 : G.Cochar)) K).IsEmpty ∧
          IsZero (compactSupportAtLevel G b (fun _ : Unit => (0 : G.Cochar)) K Λ)) := by
  sorry

-- compactSupportAtLevel.lubin_tate_test
-- `Kb` is the maximal compact subgroup `𝒪_D^×` of `J_b(ℚ_p) = D^×`.
-- Omitted: that `M_{K,C}` is a disjoint union, indexed by `ℤ`, of open unit discs, that `d = 1`,
-- and that `f_{K♮}ℤ_ℓ = ⊕_ℤ ℤ_ℓ` in degree `0`; the first conjunct is Huber's complex of that
-- union of discs.
example (b : (RedGrp.GLn ℚₚ 2).ptsBreve) (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn ℚₚ 2).basic)
    (hbμ : RedGrp.BofG.mk b ∈ (RedGrp.GLn ℚₚ 2).BGmu (RedGrp.GLn.minuscule ℚₚ 2 1).dual)
    (K : (RedGrp.GLn ℚₚ 2).Level) (hK : RedGrp.GLn.IsIntegralLevel K) (Λ : Coeff ℚₚ ℓ) :
    Nonempty (huberCompactSupport
        (Rigidification.space (RedGrp.GLn ℚₚ 2) b (RedGrp.GLn.minuscule ℚₚ 2 1) K) ℓ ≅
        (shiftFunctor (DMod ℤ_[ℓ]) (-2 : ℤ)).obj (DMod.ofModule ℤ_[ℓ] (ℤ →₀ ℤ_[ℓ]))) ∧
      ∃ Kb : OpenSubgroup ((RedGrp.GLn ℚₚ 2).sigmaCentralizer b),
        IsCompact (Kb : Set ((RedGrp.GLn ℚₚ 2).sigmaCentralizer b)) ∧
          (∀ U : OpenSubgroup ((RedGrp.GLn ℚₚ 2).sigmaCentralizer b),
            IsCompact (U : Set ((RedGrp.GLn ℚₚ 2).sigmaCentralizer b)) → U ≤ Kb) ∧
          HasGeomFibre
            (compactSupportAtLevel (RedGrp.GLn ℚₚ 2) b
              (fun _ : Unit => RedGrp.GLn.minuscule ℚₚ 2 1) K Λ)
            ((shiftFunctor (DSmooth ((RedGrp.GLn ℚₚ 2).sigmaCentralizer b) Λ) (-1 : ℤ)).obj
              (DSmooth.cInd _ Λ Kb)) := by
  sorry

-- compactSupportAtLevel.completion_order_test
-- For every coefficient ring, in particular one in which `ℓ` is invertible, the fibre is the
-- direct sum `⊕_ℤ Λ`; over `ℤ_ℓ[√q]` it is not the `ℓ`-adic completion of `⊕_ℤ Λ`.
example (b : (RedGrp.Gm ℚₚ).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.Gm ℚₚ).BGmu (RedGrp.Gm.cochar ℚₚ 1).dual)
    (K : (RedGrp.Gm ℚₚ).Level) (hK : RedGrp.Gm.IsUnitsLevel K) (Λ : Coeff ℚₚ ℓ) :
    (∃ ρ : DSmooth ((RedGrp.Gm ℚₚ).sigmaCentralizer b) Λ,
        HasGeomFibre
            (compactSupportAtLevel (RedGrp.Gm ℚₚ) b (fun _ : Unit => RedGrp.Gm.cochar ℚₚ 1) K Λ)
            ρ ∧
          Nonempty ((DSmooth.forget _ Λ).obj ρ ≅ DMod.ofModule Λ.carrier (ℤ →₀ Λ.carrier))) ∧
      ∀ ρ₀ : DSmooth ((RedGrp.Gm ℚₚ).sigmaCentralizer b) (Coeff.base ℚₚ ℓ Λ.ne),
        HasGeomFibre
            (compactSupportAtLevel (RedGrp.Gm ℚₚ) b (fun _ : Unit => RedGrp.Gm.cochar ℚₚ 1) K
              (Coeff.base ℚₚ ℓ Λ.ne)) ρ₀ →
          ¬ Nonempty ((DSmooth.forget _ (Coeff.base ℚₚ ℓ Λ.ne)).obj ρ₀ ≅
            DMod.ofModule (Coeff.base ℚₚ ℓ Λ.ne).carrier
              (AdicCompletion (Ideal.span {(ℓ : (Coeff.base ℚₚ ℓ Λ.ne).carrier)})
                (ℤ →₀ (Coeff.base ℚₚ ℓ Λ.ne).carrier))) := by
  sorry

-- compactSupportAtLevel.torsion_test
-- The shift is `[d]`, not `[3d]`, which is what `f_{K♮}` applied to `S_W` would give.
example (G : RedGrp ℚₚ) (b : G.ptsBreve) (ν : G.Cochar) (hν : ν.IsMinuscule)
    (hb : RedGrp.BofG.mk b ∈ G.BGmu ν.dual) (K : G.Level) (Λ : Coeff ℚₚ ℓ) (hΛ : Λ.IsTorsion) :
    Nonempty (compactSupportAtLevel G b (fun _ : Unit => ν) K Λ ≅
        (Det.toSolid _ Λ).obj
          ((Det.shriek (GeneralShtukaTower.stackLegs G b (fun _ : Unit => ν) K) Λ).obj
            (satakeCoefficient.onShtuka G b (fun _ : Unit => ν) K Λ))) ∧
      Nonempty ((Det.toSolid _ Λ).obj (satakeCoefficient.onShtuka G b (fun _ : Unit => ν) K Λ) ≅
        (DSolid.shiftTwist _ Λ ((RedGrp.Cochar.twoRho ν : ℕ) : ℤ)).obj (𝟙_ _)) ∧
      ∃ ρ : DSmooth (G.sigmaCentralizer b) Λ,
        HasGeomFibre (compactSupportAtLevel G b (fun _ : Unit => ν) K Λ) ρ ∧
          Nonempty ((DSmooth.forget _ Λ).obj ρ ≅
            (shiftFunctor (DMod Λ.carrier) ((RedGrp.Cochar.twoRho ν : ℕ) : ℤ)).obj
              (huberCompactSupport.coeff (Rigidification.space G b ν K) Λ)) := by
  sorry

-- towerCompactSupport.regular_test
-- `C_∞` is the regular representation `C_c^∞(G(ℚ_p), Λ)`, and under `C_K = Λ[G(ℚ_p)/K]` the maps
-- `pull` and `tr` are `1_{gK} ↦ Σ_{k ∈ K/K'} 1_{gkK'}` and `1_{gK'} ↦ 1_{gK}`.
-- Omitted: the second action of `G(ℚ_p)` on `C_∞`, by right translation, and `(C_∞)^K = C_K`
-- in this example; and the non-example, that the inverse limit of the `Λ[G(ℚ_p)/K]` along `tr`
-- is not a smooth representation (inverse limits of smooth representations are not in the
-- interfaces).
example (G : RedGrp ℚₚ) (Λ : Coeff ℚₚ ℓ) :
    HasGeomFibre (towerCompactSupport G 1 (fun _ : Unit => (0 : G.Cochar)) Λ)
        (DSmooth.regular _ Λ) ∧
      ∃ e : ∀ K : G.Level,
          (ShtBase.geomFibre G 1 (fun _ : Unit => (0 : G.Cochar)) Λ).obj
              (compactSupportAtLevel G 1 (fun _ : Unit => (0 : G.Cochar)) K Λ) ≅
            (GeomBase.ofSmooth G 1 Λ).obj (DSmooth.cInd _ Λ (G.centralizerOneLevel K.1)),
        ∀ (K' K : G.Level) (h : K' ≤ K),
          (ShtBase.geomFibre G 1 (fun _ : Unit => (0 : G.Cochar)) Λ).map
                (compactSupportAtLevel.pull G 1 (fun _ : Unit => (0 : G.Cochar)) Λ h) ≫
              (e K').hom =
            (e K).hom ≫ (GeomBase.ofSmooth G 1 Λ).map
              (DSmooth.cIndTransfer _ Λ (G.centralizerOneLevel_mono h)) ∧
          (ShtBase.geomFibre G 1 (fun _ : Unit => (0 : G.Cochar)) Λ).map
                (compactSupportAtLevel.tr G 1 (fun _ : Unit => (0 : G.Cochar)) Λ h) ≫
              (e K).hom =
            (e K').hom ≫ (GeomBase.ofSmooth G 1 Λ).map
              (DSmooth.cIndMap _ Λ (G.centralizerOneLevel_mono h)) := by
  sorry

/-! ### HS3/hecke-cohomology-comparison -/

/-- HS3/hecke-cohomology-comparison: Hecke action and shtuka cohomology. For every compact open
`K ⊂ G(E)` the geometric fibre of `C_K = f_{K♮} S'_W` is `i^{b*} T_W(j_! c-Ind_K^{G(E)} Λ)`, as
a complex of smooth representations of `J_b(E)`; for `K' ≤ K` the comparison carries `tr` and
`pull` to the maps induced by `c-Ind_{K'} Λ → c-Ind_K Λ`, `1_{gK'} ↦ 1_{gK}`, and
`c-Ind_K Λ → c-Ind_{K'} Λ`, `1_{gK} ↦ Σ_{k ∈ K/K'} 1_{gkK'}` (Fargues–Scholze IX.3.2, proof). -/
theorem heckeCohomologyComparison (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) (Λ : Coeff F ℓ) :
    ∃ e : ∀ K : G.Level,
        (ShtBase.geomFibre G b μ Λ).obj (compactSupportAtLevel G b μ K Λ) ≅
          (GeomBase.ofSmooth G b Λ).obj ((heckeStalk G b μ Λ).obj (DSmooth.cInd G.pts Λ K.1)),
      ∀ (K' K : G.Level) (h : K' ≤ K),
        (ShtBase.geomFibre G b μ Λ).map (compactSupportAtLevel.tr G b μ Λ h) ≫ (e K).hom =
            (e K').hom ≫ (GeomBase.ofSmooth G b Λ).map
              ((heckeStalk G b μ Λ).map (DSmooth.cIndMap G.pts Λ (K' := K'.1) (K := K.1) h)) ∧
          (ShtBase.geomFibre G b μ Λ).map (compactSupportAtLevel.pull G b μ Λ h) ≫ (e K').hom =
            (e K).hom ≫ (GeomBase.ofSmooth G b Λ).map
              ((heckeStalk G b μ Λ).map
                (DSmooth.cIndTransfer G.pts Λ (K' := K'.1) (K := K.1) h)) := sorry
-- Omitted: the comparison over `∏_i Spd Ĕ_{μ_i}` before passage to the geometric point, and its
-- compatibility with the partial Frobenii. It needs the Hecke operator of `W = ⊠_i V_{μ_i}` as
-- a representation of `∏_i (Ĝ ⋊ W_{F_i})` for the reflex fields `F_i`, with values on
-- `Bun_G × ∏_i Div¹_{F_i}`; the interfaces have the Hecke operators over `(Div¹_E)^I` only.
-- Omitted: part (3), the map `Sht_{(G,b,μ•),K} → ℳ_K` to the fibre of the Hecke correspondence
-- and its description over the twisted diagonals; no stage declares `ℳ_K`.
-- Omitted: in part (1), that the comparison commutes with the action of `G(E)` on the tower
-- (`compactSupportAtLevel.actions`); the interfaces have no isomorphism
-- `c-Ind_K Λ ≅ c-Ind_{gKg⁻¹} Λ` of smooth representations.

/-- HS3/hecke-cohomology-comparison, part (2): `C_K` descends to
`[∗/J_b(E)] × ∏_i Spd Ĕ_{μ_i}/φ_i^ℤ`, and the descended object lies in
`D(J_b(E), Λ)^{B∏_i W_{F_i}}`. -/
theorem heckeCohomologyComparison.weilDescent (G : RedGrp F) (b : G.ptsBreve) {I : Type}
    [Finite I] (μ : I → G.Cochar) (K : G.Level) (Λ : Coeff F ℓ) :
    ∃ A₀ : DSolid (VStack.classifying p (G.sigmaCentralizer b) ⨯
        (VSheaf.toStack p).obj (∏ᶜ fun i => Div1 (G.reflexField (μ i)))) Λ,
      PartialFrobenius.weil (fun i => G.reflexField (μ i))
          (VStack.classifying p (G.sigmaCentralizer b)) Λ A₀ ∧
        Nonempty ((DSolid.pullback (frobQuot (fun i => G.reflexField (μ i))
            (VStack.classifying p (G.sigmaCentralizer b))) Λ).obj A₀ ≅
          compactSupportAtLevel G b μ K Λ) := sorry

/-- HS3/hecke-cohomology-comparison, part (4): for one minuscule leg,
`i^{b*} T_{V_μ}(j_! c-Ind_K Λ) ≃ f_{K♮} Λ[-d](-d/2)` with `d = ⟨2ρ, μ⟩`. -/
theorem heckeCohomologyComparison.minuscule (G : RedGrp F) (b : G.ptsBreve) (ν : G.Cochar)
    (hν : ν.IsMinuscule) (K : G.Level) (Λ : Coeff F ℓ) :
    HasGeomFibre
      ((DSolid.shiftTwist _ Λ (-((RedGrp.Cochar.twoRho ν : ℕ) : ℤ))).obj
        ((DSolid.sharp (GeneralShtukaTower.stackLegs G b (fun _ : Unit => ν) K) Λ).obj (𝟙_ _)))
      ((heckeStalk G b (fun _ : Unit => ν) Λ).obj (DSmooth.cInd G.pts Λ K.1)) := sorry

/-! ### HS3/huber-cohomology-comparison -/

/-- HS3/huber-cohomology-comparison: classical compact-support comparison. For a local Shimura
datum `(G, b, μ)` over `ℚ_p` (`μ` minuscule, `b ∈ B(G, μ⁻¹)`) and `K` compact open, the
geometric fibre of `f_{K♮} Λ` is, as a complex of `Λ`-modules,
`RΓ_c(M_{K,C}, ℤ_ℓ) ⊗^L_{ℤ_ℓ} Λ [2d]`, for Huber's complex of the rigid space `M_K` and
`d = ⟨2ρ, μ⟩ = dim M_K` (Fargues–Scholze IX.3.1, proof). The Tate twist `(d)` is not visible on
the underlying complex. -/
theorem huberCohomologyComparison (G : RedGrp ℚₚ) (b : G.ptsBreve) (ν : G.Cochar)
    (hν : ν.IsMinuscule) (hb : RedGrp.BofG.mk b ∈ G.BGmu ν.dual) (K : G.Level)
    (Λ : Coeff ℚₚ ℓ) :
    ∃ ρ : DSmooth (G.sigmaCentralizer b) Λ,
      HasGeomFibre
          ((DSolid.sharp (GeneralShtukaTower.stackLegs G b (fun _ : Unit => ν) K) Λ).obj (𝟙_ _))
          ρ ∧
        Nonempty ((DSmooth.forget _ Λ).obj ρ ≅
          (shiftFunctor (DMod Λ.carrier) (2 * ((RedGrp.Cochar.twoRho ν : ℕ) : ℤ))).obj
            (huberCompactSupport.coeff (Rigidification.space G b ν K) Λ)) := sorry
-- Omitted: parts (1) and (2), the identification of Huber's `RΓ_c(U, ℤ/ℓ^m)` with
-- `Rf_{K!}(j_! ℤ/ℓ^m)` for the quasicompact opens `U` and `Rf_K^! ℤ/ℓ^m ≃ ℤ/ℓ^m[2d](d)`; the
-- interfaces have no `Rf^!`, and `ℤ/ℓ^m` is not a coefficient ring with a square root of `q`.
-- Omitted: part (4), equivariance for `J_b(ℚ_p)` and the Weil descent datum and compatibility
-- with the level maps; `huberCompactSupport` carries no action.
-- Omitted: in part (3), the statement for `ℤ_ℓ` itself and for `ℤ_ℓ`-algebras with no chosen
-- square root of `q`; `Coeff` is the type of `ℤ_ℓ[√q]`-algebras.

/-! ### HS3/compactness-of-shtuka-cohomology -/

/-- HS3/compactness-of-shtuka-cohomology: for a local Shimura datum `(G, b, μ)` over `ℚ_p` and
`K` open pro-`p`, Huber's complex `RΓ_c(M_{G,b,μ,K,C}, Λ)[2d]` is the complex underlying a
compact object of `D(J_b(ℚ_p), Λ)`, namely the geometric fibre of `f_{K♮} Λ`
(Fargues–Scholze IX.3.1). -/
theorem compactnessOfShtukaCohomology (G : RedGrp ℚₚ) (b : G.ptsBreve) (ν : G.Cochar)
    (hν : ν.IsMinuscule) (hb : RedGrp.BofG.mk b ∈ G.BGmu ν.dual) (K : G.Level)
    (hK : IsOpenProP p K.1) (Λ : Coeff ℚₚ ℓ) :
    ∃ ρ : DSmooth (G.sigmaCentralizer b) Λ,
      isCompactObject _ ρ ∧
        HasGeomFibre
          ((DSolid.sharp (GeneralShtukaTower.stackLegs G b (fun _ : Unit => ν) K) Λ).obj (𝟙_ _))
          ρ ∧
        Nonempty ((DSmooth.forget _ Λ).obj ρ ≅
          (shiftFunctor (DMod Λ.carrier) (2 * ((RedGrp.Cochar.twoRho ν : ℕ) : ℤ))).obj
            (huberCompactSupport.coeff (Rigidification.space G b ν K) Λ)) := sorry
-- Omitted: the statement over `ℤ_ℓ` itself (the interfaces define `D(J_b(ℚ_p), Λ)` for
-- `ℤ_ℓ[√q]`-algebras `Λ`; the descent from `ℤ_ℓ[√q]` to `ℤ_ℓ` is step 3 of the node); the
-- continuity of the action of `W_F` in part (1); part (4), finite generation of each `H^i_c` for
-- all compact open `K` (no abelian category of smooth representations in the interfaces).

/-- HS3/compactness-of-shtuka-cohomology, part (3): the pro-`p` hypothesis cannot be dropped.
For `G = 𝔾_m`, `μ(z) = z`, `K = ℤ_p^×`, `ℓ` dividing `p - 1` and `ℓ` not invertible in `Λ`, the
complex is `c-Ind_{ℤ_p^×}^{ℚ_p^×} Λ` in degree `0`, which is not compact. -/
theorem compactnessOfShtukaCohomology.not_pro_p (b : (RedGrp.Gm ℚₚ).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.Gm ℚₚ).BGmu (RedGrp.Gm.cochar ℚₚ 1).dual)
    (K : (RedGrp.Gm ℚₚ).Level) (hK : RedGrp.Gm.IsUnitsLevel K) (Λ : Coeff ℚₚ ℓ)
    (hΛ : ¬ IsUnit (ℓ : Λ.carrier)) (hℓ : ℓ ∣ p - 1)
    (ρ : DSmooth ((RedGrp.Gm ℚₚ).sigmaCentralizer b) Λ)
    (hρ : HasGeomFibre
      ((DSolid.sharp (GeneralShtukaTower.stackLegs (RedGrp.Gm ℚₚ) b
        (fun _ : Unit => RedGrp.Gm.cochar ℚₚ 1) K) Λ).obj (𝟙_ _)) ρ) :
    ¬ isCompactObject _ ρ := sorry

/-! ### HS3/general-bound-compactness -/

/-- HS3/general-bound-compactness: for any nonarchimedean local field, any tuple `μ•`, any `b` and
`K ⊂ G(E)` open pro-`p`, the complex of smooth representations of `J_b(E)` underlying
`C_K = f_{K♮} S'_W` is a compact object of `D(J_b(E), Λ)` (Fargues–Scholze IX.3.2, with the
pro-`p` hypothesis of IX.3.1). -/
theorem generalBoundCompactness (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I]
    (μ : I → G.Cochar) (K : G.Level) (hK : IsOpenProP p K.1) (Λ : Coeff F ℓ) :
    ∃ ρ : DSmooth (G.sigmaCentralizer b) Λ,
      isCompactObject _ ρ ∧ HasGeomFibre (compactSupportAtLevel G b μ K Λ) ρ := sorry

/-- HS3/general-bound-compactness: the pro-`p` hypothesis is needed. For `G = 𝔾_m`, one leg with
`μ = 0`, `b = 1`, `K = 𝒪_E^×` and `Λ` of characteristic `ℓ` with `ℓ` dividing `q - 1`,
`C_K = c-Ind_{𝒪_E^×}^{E^×} Λ` is not compact. -/
theorem generalBoundCompactness.not_pro_p (K : (RedGrp.Gm F).Level)
    (hK : RedGrp.Gm.IsUnitsLevel K) (Λ : Coeff F ℓ) (hΛ : Λ.IsModL) (hℓ : ℓ ∣ F.q - 1)
    (ρ : DSmooth ((RedGrp.Gm F).sigmaCentralizer 1) Λ)
    (hρ : HasGeomFibre (compactSupportAtLevel (RedGrp.Gm F) 1
      (fun _ : Unit => (0 : (RedGrp.Gm F).Cochar)) K Λ) ρ) :
    ¬ isCompactObject _ ρ := sorry

/-! ### HS3/admissibility-duality-and-adjunction -/

section Admissibility

variable (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) (K : G.Level)
  (Λ : Coeff F ℓ)

/-- HS3/admissibility-duality-and-adjunction, part (1): for `K ⊂ G(E)` open pro-`p` and every
`ρ ∈ D(J_b(E), Λ)`, `RHom_{J_b(E)}(C_K, ρ) ≃ X(ρ)^K` with
`X(ρ) = i^{1*} T_{W^∨}(Ri^b_* ρ)`, with no shift (Fargues–Scholze IX.3, p. 325). Here `σ` is
the complex of smooth representations of `J_b(E)` underlying `C_K`. -/
theorem admissibilityDualityAndAdjunction (hK : IsOpenProP p K.1)
    (ρ σ : DSmooth (G.sigmaCentralizer b) Λ)
    (hσ : HasGeomFibre (compactSupportAtLevel G b μ K Λ) σ) :
    Nonempty (((DSmooth.RHom _ Λ).obj (op σ)).obj ρ ≅
      (DSmooth.invariants G.pts Λ K.1).obj ((heckeCostalk G b μ Λ).obj ρ)) := sorry
-- Omitted: equivariance for `∏_i W_{F_i}`; that for `K' ≤ K` the map induced by `tr` is the
-- inclusion `X(ρ)^K → X(ρ)^{K'}` (it needs the comparison isomorphisms to be chosen compatibly),
-- and the resulting formula `colim_K RHom(C_K, ρ) ≃ X(ρ)` (a homotopy colimit).

/-- Part (2): if `ρ` is admissible and `K` is pro-`p`, then `RHom_{J_b(E)}(C_K, ρ)` is a perfect
complex of `Λ`-modules. -/
theorem admissibilityDualityAndAdjunction.perfect (hK : IsOpenProP p K.1)
    (ρ σ : DSmooth (G.sigmaCentralizer b) Λ) (hρ : DSmooth.IsAdmissible ρ)
    (hσ : HasGeomFibre (compactSupportAtLevel G b μ K Λ) σ) :
    DMod.isPerfect Λ.carrier (((DSmooth.RHom _ Λ).obj (op σ)).obj ρ) := sorry

/-- Part (2): if `ρ` is admissible, so is `X(ρ)`. -/
theorem admissibilityDualityAndAdjunction.admissible (ρ : DSmooth (G.sigmaCentralizer b) Λ)
    (hρ : DSmooth.IsAdmissible ρ) :
    DSmooth.IsAdmissible ((heckeCostalk G b μ Λ).obj ρ) := sorry

/-- Part (4), basic case: for `b` basic and `ρ` admissible with smooth dual `ρ^∨`,
`X(ρ) ≃ D(i^{1*} T_{sw^* W}(i^b_! ρ^∨))`, `D` the derived smooth dual. -/
theorem admissibilityDualityAndAdjunction.duality (hb : RedGrp.BofG.mk b ∈ G.basic)
    (ρ : DSmooth (G.sigmaCentralizer b) Λ) (hρ : DSmooth.IsAdmissible ρ) :
    Nonempty ((heckeCostalk G b μ Λ).obj ρ ≅
      (DSmooth.smoothDual G.pts Λ).obj (op ((BunG.trivialStalk G Λ).obj
        ((heckeGeom.functor G Λ
            ((GeomSatRep.sw G Λ Unit).functor.obj (highestWeightTensor G Λ μ))).obj
          ((BunG.stalkLeft G Λ b).obj ((DSmooth.smoothDual _ Λ).obj (op ρ))))))) := sorry
-- Omitted: part (4) for non-basic `b`, with the twist by the dualizing complex `i^{b!} Λ` of
-- `Bun_G^b` (no `i^{b!}` in the interfaces); part (3), which is part (1) with
-- `C_K ≃ RΓ_c(M_{K,C}, Λ)[d](d/2)`; part (5), finite length for `Λ = ℚ̄_ℓ` (no abelian category
-- of smooth representations, and `ℚ̄_ℓ`-coefficients need a choice of `√q`); part (6).

end Admissibility

/-- HS3/admissibility-duality-and-adjunction, part (2): for `K` not pro-`p` perfectness can
fail. For `G = 𝔾_m`, `μ = 0`, `b = 1`, `K = 𝒪_E^×`, `ρ` the trivial representation on `Λ` of
characteristic `ℓ` and `ℓ` dividing `q - 1`, the complex is `RΓ(𝒪_E^×, Λ)`. -/
theorem admissibilityDualityAndAdjunction.not_pro_p (K : (RedGrp.Gm F).Level)
    (hK : RedGrp.Gm.IsUnitsLevel K) (Λ : Coeff F ℓ) (hΛ : Λ.IsModL) (hℓ : ℓ ∣ F.q - 1)
    (σ : DSmooth ((RedGrp.Gm F).sigmaCentralizer 1) Λ)
    (hσ : HasGeomFibre (compactSupportAtLevel (RedGrp.Gm F) 1
      (fun _ : Unit => (0 : (RedGrp.Gm F).Cochar)) K Λ) σ) :
    ¬ DMod.isPerfect Λ.carrier
      (((DSmooth.RHom _ Λ).obj (op σ)).obj (DSmooth.ofChar _ Λ 1)) := sorry

/-! ### HS3/level-trace-and-pullback -/

section LevelTrace

variable (G : RedGrp F) (b : G.ptsBreve) {I : Type} [Finite I] (μ : I → G.Cochar) (Λ : Coeff F ℓ)

/-- HS3/level-trace-and-pullback, part (1): for compact open `K' ≤ K`, `tr ∘ pull = [K : K']`
on `C_K`; the level map is finite étale of degree `[K : K']`. -/
theorem levelTraceAndPullback {K' K : G.Level} (h : K' ≤ K) :
    compactSupportAtLevel.pull G b μ Λ h ≫ compactSupportAtLevel.tr G b μ Λ h =
      ((K'.1.toSubgroup.relIndex K.1.toSubgroup : ℕ) : Λ.carrier) • 𝟙 _ := sorry

/-- For `k ∈ G(E)` normalising `K`, the automorphism of `C_K` induced by `k`. -/
def compactSupportAtLevel.normalizerAction (K : G.Level) (k : G.pts) (hk : K.conj k = K) :
    compactSupportAtLevel G b μ K Λ ⟶ compactSupportAtLevel G b μ K Λ :=
  (compactSupportAtLevel.actions G b μ K Λ k).hom ≫ eqToHom (by rw [hk])

/-- HS3/level-trace-and-pullback, part (2): if `K'` is normal in `K`, then
`pull ∘ tr = Σ_{γ ∈ K/K'} γ^*` on `C_{K'}`. The sum does not depend on the representatives, as
`K'` acts trivially on `C_{K'}`. -/
theorem levelTraceAndPullback.pull_tr {K' K : G.Level} (h : K' ≤ K)
    (hn : ∀ k ∈ K.1.toSubgroup, K'.conj k = K') :
    compactSupportAtLevel.tr G b μ Λ h ≫ compactSupportAtLevel.pull G b μ Λ h =
      ∑ᶠ γ : K.1.toSubgroup ⧸ K'.1.toSubgroup.subgroupOf K.1.toSubgroup,
        compactSupportAtLevel.normalizerAction G b μ Λ K' (Quotient.out γ : K.1.toSubgroup)
          (hn _ (Quotient.out γ).2) := sorry

/-- HS3/compact-support-at-levels, `(C_∞)^K`: for `K` open pro-`p` and `K'` open normal in `K`,
the averaging idempotent `e_K` of `C_∞` restricts on `C_{K'}` to the idempotent
`e_{K/K'} = [K : K']⁻¹ Σ_{γ ∈ K/K'} γ^*` of the action of the finite group `K/K'`; here `u` is
the inverse of `[K : K']` in `Λ`. -/
theorem towerCompactSupport.average_level {K' K : G.Level} (h : K' ≤ K) (hK : IsOpenProP p K.1)
    (hn : ∀ k ∈ K.1.toSubgroup, K'.conj k = K') (u : Λ.carrier)
    (hu : u * ((K'.1.toSubgroup.relIndex K.1.toSubgroup : ℕ) : Λ.carrier) = 1) :
    towerCompactSupport.ι G b μ K' Λ ≫ towerCompactSupport.average G b μ K Λ =
      (u • ∑ᶠ γ : K.1.toSubgroup ⧸ K'.1.toSubgroup.subgroupOf K.1.toSubgroup,
        compactSupportAtLevel.normalizerAction G b μ Λ K' (Quotient.out γ : K.1.toSubgroup)
          (hn _ (Quotient.out γ).2)) ≫ towerCompactSupport.ι G b μ K' Λ := sorry

/-- HS3/level-trace-and-pullback, part (5): if `K` is pro-`p`, then `[K : K']` is a unit of
`Λ`, so that `[K : K']⁻¹ tr` is a retraction of `pull`. For general `K` it need not be
(`K = GL_2(ℤ_p)`, `K'` an Iwahori subgroup: index `p + 1`). -/
theorem levelTraceAndPullback.isUnit_index {K' K : G.Level} (h : K' ≤ K)
    (hK : IsOpenProP p K.1) (Λ : Coeff F ℓ) :
    IsUnit ((K'.1.toSubgroup.relIndex K.1.toSubgroup : ℕ) : Λ.carrier) := sorry
-- Parts (3) and (4) are `compactSupportAtLevel.tr_comp`, `compactSupportAtLevel.pull_comp`,
-- `compactSupportAtLevel.actions_tr`, `compactSupportAtLevel.actions_pull` and
-- `heckeCohomologyComparison`.
-- Omitted: in part (4), the maps induced on `Hom_{G(E)}(c-Ind_• Λ, π) = π^•` for a smooth
-- representation `π` (no abelian category of smooth representations in the interfaces).
-- Omitted: that `tr` and `pull` are compatible with the partial Frobenii; no partial Frobenius
-- structure on `C_K` is declared (`heckeCohomologyComparison.weilDescent` asserts that a descent
-- exists).

end LevelTrace

/-! ### HS3/classical-comparison -/

/-- HS3/classical-comparison, part (1): for `b ∈ B(GL_n, μ⁻¹)`, `μ = (1^d, 0^{n-d})`, the
Rapoport–Zink tower of the `p`-divisible group `𝕏_b` of height `n` and dimension `d` is
isomorphic to the local Shimura tower `(M_{GL_n,b,μ,K})_K`, over all compact open
`K ⊂ GL_n(ℚ_p)` (Scholze–Weinstein 24.2.5 and the remark after its proof). -/
theorem classicalComparison (n d : ℕ) (hd : d ≤ n) (b : (RedGrp.GLn ℚₚ n).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn ℚₚ n).BGmu (RedGrp.GLn.minuscule ℚₚ n d).dual) :
    ∃ e : ∀ K : (RedGrp.GLn ℚₚ n).Level,
        RapoportZink.space n d b K ≅
          Rigidification.space (RedGrp.GLn ℚₚ n) b (RedGrp.GLn.minuscule ℚₚ n d) K,
      ∀ (K' K : (RedGrp.GLn ℚₚ n).Level) (h : K' ≤ K),
        RapoportZink.transition n d b h ≫ (e K).hom =
          (e K').hom ≫
            Rigidification.transition (RedGrp.GLn ℚₚ n) b (RedGrp.GLn.minuscule ℚₚ n d) h :=
  sorry
-- Omitted: compatibility with the period maps to the Grassmannian and the description of the
-- isomorphism on points; parts (2) and (3), the EL and PEL cases (Scholze–Weinstein 24.3.5), the
-- Lubin–Tate and Drinfeld towers of a finite extension of `ℚ_p` (no stand-in for EL and PEL data
-- and their Rapoport–Zink spaces); part (4), which is HS3/huber-cohomology-comparison applied to
-- the identified towers.

/-! ### HS3/hecke-operators-between-strata -/

section HeckeBetweenStrata

variable (G : RedGrp F) (Λ : Coeff F ℓ) {I : Type} [Finite I] (b' b : G.ptsBreve)
  (V : SatRep G Λ I)

/-- HS3/hecke-operators-between-strata: `Φ^{b',b}_V = i^{b*} ∘ T_V ∘ π_{b'♮} q_{b'}^*`, a
functor `D(J_{b'}(E), Λ) → D(J_b(E), Λ)^{BW_E^I}`; its values are complexes of smooth
representations of `J_b(E)` with an action of `W_E^I`. No placeholder. -/
def heckeBetweenStrata :
    DSmooth (G.sigmaCentralizer b') Λ ⥤
      Action (DSmooth (G.sigmaCentralizer b) Λ) (I → F.WeilGroup) :=
  BunG.stalkLeft G Λ b' ⋙ (weilHeckeAction.equivariant G Λ I).obj V ⋙
    (BunG.stalk G Λ b).mapAction (I → F.WeilGroup)

/-- `C^{b',b}_{K'}(V) = Φ^{b',b}_V(c-Ind_{K'}^{J_{b'}(E)} Λ)`, for `K' ⊂ J_{b'}(E)` open
pro-`p`. -/
def heckeBetweenStrata.atLevel (K' : OpenSubgroup (G.sigmaCentralizer b')) :
    Action (DSmooth (G.sigmaCentralizer b) Λ) (I → F.WeilGroup) :=
  (heckeBetweenStrata G Λ b' b V).obj (DSmooth.cInd _ Λ K')

/-- A morphism `V → V'` of representations induces `Φ^{b',b}_V → Φ^{b',b}_{V'}`; it is obtained
from the functor `weilHeckeAction.equivariant` by whiskering, hence compatible with identities and
composition. -/
def heckeBetweenStrata.map {V V' : SatRep G Λ I} (g : V ⟶ V') :
    heckeBetweenStrata G Λ b' b V ⟶ heckeBetweenStrata G Λ b' b V' :=
  Functor.whiskerLeft _ (Functor.whiskerRight ((weilHeckeAction.equivariant G Λ I).map g) _)

/-- `Φ^{b',b}_V` commutes with direct sums. -/
theorem heckeBetweenStrata.preservesColimits (J : Type) :
    PreservesColimitsOfShape (Discrete J)
      (heckeBetweenStrata G Λ b' b V ⋙ Action.forget _ _) := sorry
-- Omitted: exactness (the interfaces give `D(J_b(E), Λ)` no triangulated structure).

/-- `Φ^{b',b}_V` sends compact objects to compact objects. -/
theorem heckeBetweenStrata.compact (M : DSmooth (G.sigmaCentralizer b') Λ)
    (hM : isCompactObject _ M) :
    isCompactObject _ ((heckeBetweenStrata G Λ b' b V).obj M).V := sorry

/-- `C^{b',b}_{K'}(V)` is compact in `D(J_b(E), Λ)` for `K'` open pro-`p`. -/
theorem heckeBetweenStrata.atLevel_compact (K' : OpenSubgroup (G.sigmaCentralizer b'))
    (hK' : IsOpenProP p K') :
    isCompactObject _ (heckeBetweenStrata.atLevel G Λ b' b V K').V := sorry

/-- For `V = 1`: `Φ^{b,b}_1 ≅ id`. -/
def heckeBetweenStrata.unit (I : Type) [Finite I] :
    heckeBetweenStrata G Λ b b (𝟙_ (SatRep G Λ I)) ⋙ Action.forget _ _ ≅ 𝟭 _ := sorry

/-- For `V = 1`: `Φ^{b',b}_1 = i^{b*} π_{b'♮} q_{b'}^*`. -/
def heckeBetweenStrata.unit_general (I : Type) [Finite I] :
    heckeBetweenStrata G Λ b' b (𝟙_ (SatRep G Λ I)) ⋙ Action.forget _ _ ≅
      BunG.stalkLeft G Λ b' ⋙ BunG.stalk G Λ b := sorry

/-- For `b' = 1`: `Φ^{1,b}_V(M) = i^{b*} T_V(j_! M)`, under `J_1(E) = G(E)`. -/
def heckeBetweenStrata.comp_trivial :
    DSmooth.res _ Λ G.ptsToCentralizerOne ⋙ BunG.trivialExtension G Λ ⋙
        weilHeckeAction.functor G Λ I V ⋙ BunG.stalk G Λ b ≅
      heckeBetweenStrata G Λ 1 b V ⋙ Action.forget _ _ := sorry

/-- For `b' = 1`: `C^{1,b}_K(V)` is the object `T_V(j_! c-Ind_K^{G(E)} Λ)|_{Bun_G^b}` of
HS3/hecke-cohomology-comparison. -/
def heckeBetweenStrata.atLevel_trivial (K : G.Level) :
    (heckeBetweenStrata.atLevel G Λ 1 b V (G.centralizerOneLevel K.1)).V ≅
      (BunG.stalk G Λ b).obj ((weilHeckeAction.functor G Λ I V).obj
        ((BunG.trivialExtension G Λ).obj (DSmooth.cInd G.pts Λ K.1))) := sorry

/-- For `b'` basic, the equivalence `Bun_G ≅ Bun_{G_{b'}}` of Fargues–Scholze III.4.3 commutes
with the Hecke operators, the dual groups of `G` and `G_{b'}` being identified. -/
def heckeBetweenStrata.basicTwist_hecke (hb' : RedGrp.BofG.mk b' ∈ G.basic)
    (V' : SatRep (G.innerForm b') Λ I) :
    Dlis.pullback (BunG.innerTwist G b' hb').hom Λ ⋙
        weilHeckeAction.functor G Λ I ((SatRep.innerFormEquiv Λ b' I).functor.obj V') ≅
      weilHeckeAction.functor (G.innerForm b') Λ I V' ⋙
        Dlis.pullback (BunG.innerTwist G b' hb').hom Λ := sorry

/-- For `b'` basic, under `Bun_G ≅ Bun_{G_{b'}}`: `Φ^{b',b}_V` for `G` is `Φ^{1,b''}_V` for the
inner form `G_{b'}`, with `b'' = b b'⁻¹ ∈ G_{b'}(Ĕ) = G(Ĕ)` (`RedGrp.innerFormTwist`). The source
groups are identified by `J_{b'}(E) = G_{b'}(E) = J_1(E)` for `G_{b'}`, the target groups by
`(G_{b'})_{b''}(E) = G_b(E)` (`RedGrp.innerFormCentralizer`), and the dual groups of `G` and
`G_{b'}` by `SatRep.innerFormEquiv`. -/
def heckeBetweenStrata.basicTwist (hb' : RedGrp.BofG.mk b' ∈ G.basic)
    (V' : SatRep (G.innerForm b') Λ I) :
    DSmooth.res _ Λ (ContinuousMonoidHom.toContinuousMonoidHom
          ((G.innerFormPts b').symm.trans (G.innerForm b').centralizerOne)) ⋙
        heckeBetweenStrata G Λ b' b ((SatRep.innerFormEquiv Λ b' I).functor.obj V') ⋙
        (DSmooth.res _ Λ (ContinuousMonoidHom.toContinuousMonoidHom
          (G.innerFormCentralizer b' hb' b))).mapAction (I → F.WeilGroup) ≅
      heckeBetweenStrata (G.innerForm b') Λ 1 (G.innerFormTwist b' hb' b) V' := sorry

/-- `RHom_{J_b(E)}(Φ^{b',b}_V(M), ρ) ≅ RHom_{J_{b'}(E)}(M, i^{b'*} T_{V^∨} Ri^b_* ρ)`. -/
def heckeBetweenStrata.homAdjunction (M : DSmooth (G.sigmaCentralizer b') Λ)
    (ρ : DSmooth (G.sigmaCentralizer b) Λ) :
    ((DSmooth.RHom _ Λ).obj (op ((heckeBetweenStrata G Λ b' b V).obj M).V)).obj ρ ≅
      ((DSmooth.RHom _ Λ).obj (op M)).obj
        ((BunG.stalk G Λ b').obj ((weilHeckeAction.functor G Λ I Vᘁ).obj
          ((BunG.stalkRight G Λ b).obj ρ))) := sorry
-- Omitted: naturality in `M` and `ρ`. For `M = c-Ind_{K'} Λ` the right side is the complex of
-- derived `K'`-invariants, by `DSmooth.RHomCInd`.

/-- The endomorphisms of `c-Ind_{K'}^{J_{b'}(E)} Λ`, the Hecke algebra `Λ[K'\J_{b'}(E)/K']`, act
on `C^{b',b}_{K'}(V)` by functoriality; the action commutes with `J_b(E)` and `W_E^I`, being by
endomorphisms in `D(J_b(E), Λ)` with `W_E^I`-action. -/
def heckeBetweenStrata.heckeAlgebraAction (K' : OpenSubgroup (G.sigmaCentralizer b')) :
    End (DSmooth.cInd (G.sigmaCentralizer b') Λ K') →*
      End (heckeBetweenStrata.atLevel G Λ b' b V K') :=
  (heckeBetweenStrata G Λ b' b V).mapEnd _
-- Omitted: the identification of `End(c-Ind_{K'} Λ)` with the Hecke algebra, which is
-- SmoothRepresentationsOfLocalGroups SR.1.

/-- `C^{b',b}_∞(V) = Φ^{b',b}_V(C_c^∞(J_{b'}(E), Λ))`. -/
def heckeBetweenStrata.tower : Action (DSmooth (G.sigmaCentralizer b) Λ) (I → F.WeilGroup) :=
  (heckeBetweenStrata G Λ b' b V).obj (DSmooth.regular _ Λ)

/-- The action of `J_{b'}(E)` on `C^{b',b}_∞(V)` through right translation; it commutes with
`J_b(E)` and `W_E^I`. -/
def heckeBetweenStrata.tower.action :
    G.sigmaCentralizer b' →* Aut (heckeBetweenStrata.tower G Λ b' b V) :=
  ((heckeBetweenStrata G Λ b' b V).mapAut _).comp (DSmooth.regularRight _ Λ)

/-- The map `C^{b',b}_{K'}(V) → C^{b',b}_∞(V)` induced by `c-Ind_{K'} Λ ⊂ C_c^∞`. -/
def heckeBetweenStrata.tower.ι (K' : OpenSubgroup (G.sigmaCentralizer b')) :
    heckeBetweenStrata.atLevel G Λ b' b V K' ⟶ heckeBetweenStrata.tower G Λ b' b V :=
  (heckeBetweenStrata G Λ b' b V).map (DSmooth.cIndToRegular _ Λ K')
-- Omitted: `C^{b',b}_∞(V)` is the colimit of the `C^{b',b}_{K'}(V)` over open pro-`p` `K'` (a
-- homotopy colimit).

end HeckeBetweenStrata

-- heckeBetweenStrata.torus_unit_test
-- `G_b(E) = E^× = G_{b'}(E)` for all representatives `b`, `b'` (`RedGrp.torusCentralizer`), and
-- the objects are compared as complexes of smooth representations of `E^×`.
example (Λ : Coeff F ℓ) (b' b : (RedGrp.Gm F).ptsBreve)
    (K' : OpenSubgroup ((RedGrp.Gm F).sigmaCentralizer b')) (hK' : IsOpenProP p K') :
    (RedGrp.BofG.mk b = RedGrp.BofG.mk b' →
        Nonempty
          ((DSmooth.res _ Λ (ContinuousMonoidHom.toContinuousMonoidHom
              ((RedGrp.Gm F).torusCentralizer (RedGrp.isTorus_Gm F) b))).obj
              (heckeBetweenStrata.atLevel (RedGrp.Gm F) Λ b' b
                (𝟙_ (SatRep (RedGrp.Gm F) Λ Empty)) K').V ≅
            (DSmooth.res _ Λ (ContinuousMonoidHom.toContinuousMonoidHom
              ((RedGrp.Gm F).torusCentralizer (RedGrp.isTorus_Gm F) b'))).obj
              (DSmooth.cInd _ Λ K'))) ∧
      (RedGrp.BofG.mk b ≠ RedGrp.BofG.mk b' →
        IsZero (heckeBetweenStrata.atLevel (RedGrp.Gm F) Λ b' b
          (𝟙_ (SatRep (RedGrp.Gm F) Λ Empty)) K').V) := by
  sorry

-- heckeBetweenStrata.torus_shift_test
example (Λ : Coeff F ℓ) [Nontrivial Λ.carrier] (n : ℤ) (b' b : (RedGrp.Gm F).ptsBreve)
    (K' : OpenSubgroup ((RedGrp.Gm F).sigmaCentralizer b')) (hK' : IsOpenProP p K') :
    (¬ IsZero (heckeBetweenStrata.atLevel (RedGrp.Gm F) Λ b' b (SatRep.char F Λ n) K').V ↔
        RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (RedGrp.BofG.mk b)) =
          RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (RedGrp.BofG.mk b')) - n) ∧
      (RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (RedGrp.BofG.mk b)) =
          RedGrp.Gm.pi1Equiv F ((RedGrp.Gm F).kottwitz (RedGrp.BofG.mk b')) - n →
        Nonempty
          ((DSmooth.res _ Λ (ContinuousMonoidHom.toContinuousMonoidHom
              ((RedGrp.Gm F).torusCentralizer (RedGrp.isTorus_Gm F) b))).obj
              (heckeBetweenStrata.atLevel (RedGrp.Gm F) Λ b' b (SatRep.char F Λ n) K').V ≅
            (DSmooth.res _ Λ (ContinuousMonoidHom.toContinuousMonoidHom
              ((RedGrp.Gm F).torusCentralizer (RedGrp.isTorus_Gm F) b'))).obj
              (DSmooth.cInd _ Λ K'))) := by
  sorry

-- heckeBetweenStrata.trivial_stratum_test
example (Λ : Coeff ℚₚ ℓ) (m : ℕ) (hm : 1 ≤ m) (K : (RedGrp.GLn ℚₚ 2).Level)
    (hK : RedGrp.GLn.IsPrincipalLevel m K) (b : (RedGrp.GLn ℚₚ 2).ptsBreve)
    (hb : RedGrp.BofG.mk b ∈ (RedGrp.GLn ℚₚ 2).basic)
    (hbμ : RedGrp.BofG.mk b ∈ (RedGrp.GLn ℚₚ 2).BGmu (RedGrp.GLn.minuscule ℚₚ 2 1).dual) :
    Nonempty ((DSmooth.forget _ Λ).obj
        (heckeBetweenStrata.atLevel (RedGrp.GLn ℚₚ 2) Λ 1 b (SatRep.stdGL ℚₚ Λ 2)
          ((RedGrp.GLn ℚₚ 2).centralizerOneLevel K.1)).V ≅
      (shiftFunctor (DMod Λ.carrier) (1 : ℤ)).obj
        (huberCompactSupport.coeff
          (Rigidification.space (RedGrp.GLn ℚₚ 2) b (RedGrp.GLn.minuscule ℚₚ 2 1) K) Λ)) := by
  sorry
-- Omitted: equivariance for `D^× = J_b(ℚ_p)` and for `W_{ℚ_p}`; `huberCompactSupport` carries no
-- action.

-- heckeBetweenStrata.not_pro_p_test
example (Λ : Coeff ℚₚ ℓ) (hΛ : Λ.IsModL) (hℓ : ℓ ∣ p - 1) (K : (RedGrp.Gm ℚₚ).Level)
    (hK : RedGrp.Gm.IsUnitsLevel K) :
    ¬ isCompactObject _
      (heckeBetweenStrata.atLevel (RedGrp.Gm ℚₚ) Λ 1 1 (𝟙_ (SatRep (RedGrp.Gm ℚₚ) Λ Empty))
        ((RedGrp.Gm ℚₚ).centralizerOneLevel K.1)).V := by
  sorry

/-! ## HS4: formal structure of the Hecke action -/

/-! ### HS4/monoidal-and-finite-set-functoriality -/

/-- `W_E^J → W_E^I`, `(w_j) ↦ (w_{a(i)})`, for a map `a : I → J`. -/
def weilPowMap (F : LocalField p) {I J : Type} (a : I → J) :
    (J → F.WeilGroup) →* (I → F.WeilGroup) where
  toFun w := w ∘ a
  map_one' := rfl
  map_mul' _ _ := rfl

section MonoidalFunctoriality

open Functor.LaxMonoidal Functor.OplaxMonoidal

variable (G : RedGrp F) (Λ : Coeff F ℓ)

/-- HS4/monoidal-and-finite-set-functoriality: coherent finite-set Hecke family. For every
finite set `I` the Hecke operators give a monoidal functor
`T^I : Rep_Λ((Ĝ ⋊ Q)^I) → End_Λ(D_lis(Bun_G, Λ))^{BW_E^I}`, `V ↦ T_V`: `T_1 ≅ id` and
`T_{V ⊗ V'} ≅ T_V ∘ T_{V'}`, with `W_E^I` acting on the composite through both factors
(Fargues–Scholze IX.2.4, IX.0.1(ii)). -/
instance monoidalAndFiniteSetFunctoriality (I : Type) [Finite I] :
    (weilHeckeAction G Λ I).Monoidal := sorry
-- Omitted: exactness and `Rep_Λ(Q^I)`-linearity of `T^I` (they need the action of
-- `Rep_Λ(Q^I)` on the target, with `W_E^I` acting through `Q^I`); the continuity of the
-- actions is `continuousTensorGeneratorExport`.

variable {I J K : Type} [Finite I] [Finite J] [Finite K]

/-- HS4/monoidal-and-finite-set-functoriality: functoriality in the finite set
(Fargues–Scholze IX.0.1(iii)). For a map `a : I → J`, `T^J ∘ a_* ≅ a_* ∘ T^I`, where `a_*` on
representations is restriction along `(Ĝ ⋊ Q)^J → (Ĝ ⋊ Q)^I` and on the targets is restriction
of the action along `W_E^J → W_E^I`. -/
def monoidalAndFiniteSetFunctoriality.restrictLegs (a : I → J) :
    SatRep.res G Λ a ⋙ weilHeckeAction G Λ J ≅
      weilHeckeAction G Λ I ⋙ Action.res (LisEnd G Λ) (weilPowMap F a) := sorry

/-- The comparison for `a : I → J` is monoidal: it carries the tensor constraint of
`T^J ∘ a_*` to that of `T^I`. -/
theorem monoidalAndFiniteSetFunctoriality.restrictLegs_tensor (a : I → J) (V W : SatRep G Λ I) :
    ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ a).hom.app (V ⊗ W)).hom =
      ((weilHeckeAction G Λ J).map (δ (SatRep.res G Λ a) V W)).hom ≫
        (δ (weilHeckeAction G Λ J) ((SatRep.res G Λ a).obj V) ((SatRep.res G Λ a).obj W)).hom ≫
        (((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ a).hom.app V).hom ⊗ₘ
          ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ a).hom.app W).hom) ≫
        (μ (weilHeckeAction G Λ I) V W).hom := sorry

/-- The comparison for the identity is induced by `id_* ≅ id`. -/
theorem monoidalAndFiniteSetFunctoriality.restrictLegs_id (V : SatRep G Λ I) :
    ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ (id : I → I)).hom.app V).hom =
      ((weilHeckeAction G Λ I).map ((SatRep.resId G Λ I).hom.app V)).hom := sorry

/-- The comparison for `c ∘ a` is the composite of the comparisons for `a` and for `c`. -/
theorem monoidalAndFiniteSetFunctoriality.restrictLegs_comp (a : I → J) (c : J → K)
    (V : SatRep G Λ I) :
    ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ (c ∘ a)).hom.app V).hom =
      ((weilHeckeAction G Λ K).map ((SatRep.resComp G Λ a c).hom.app V)).hom ≫
        ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ c).hom.app
          ((SatRep.res G Λ a).obj V)).hom ≫
        ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ a).hom.app V).hom := sorry
-- Omitted: the higher coherences (the lift of the `T^I` to a morphism of coCartesian fibrations
-- over finite sets), which are a statement about ∞-categories.

/-- Special case (2), fusion: for `{1,2} → {∗}` and `V₁, V₂ ∈ Rep_Λ(Ĝ ⋊ Q)`, `T_{V₁ ⊗ V₂}` is
`T_{V₁ ⊠ V₂}` with `W_E` acting through the diagonal of `W_E²`. -/
def monoidalAndFiniteSetFunctoriality.fusion (V₁ V₂ : SatRep G Λ Unit) :
    (weilHeckeAction G Λ Unit).obj (V₁ ⊗ V₂) ≅
      (Action.res (LisEnd G Λ) (weilPowMap F (fun _ : Fin 2 => ()))).obj
        ((weilHeckeAction G Λ (Fin 2)).obj (SatRep.boxtimes G Λ ![V₁, V₂])) := sorry

/-- Special case (3), unit insertion: the factors of `W_E^J` indexed by the complement of the
image of `a` act trivially on `T_{a_* V}`. -/
theorem monoidalAndFiniteSetFunctoriality.unitInsertion (a : I → J) (V : SatRep G Λ I)
    (w : J → F.WeilGroup) (hw : ∀ i, w (a i) = 1) :
    ((weilHeckeAction G Λ J).obj ((SatRep.res G Λ a).obj V)).ρ w = 𝟙 _ := sorry

/-- Special case (4), iterated modifications: `T_{V ⊠ W} ≅ T_V ∘ T_W`, equivariantly for
`W_E^{I ⊔ J}`, with `W_E^I` acting through `T_V` and `W_E^J` through `T_W`. It is built from the
monoidal structure for `I ⊔ J` and the comparisons for the two inclusions. -/
def monoidalAndFiniteSetFunctoriality.iterated (V : SatRep G Λ I) (W : SatRep G Λ J) :
    (weilHeckeAction G Λ (I ⊕ J)).obj (SatRep.extProd V W) ≅
      (Action.res (LisEnd G Λ) (weilPowMap F Sum.inl)).obj ((weilHeckeAction G Λ I).obj V) ⊗
        (Action.res (LisEnd G Λ) (weilPowMap F Sum.inr)).obj ((weilHeckeAction G Λ J).obj W) :=
  (Functor.Monoidal.μIso (weilHeckeAction G Λ (I ⊕ J)) _ _).symm ≪≫
    tensorIso ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ Sum.inl).app V)
      ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ Sum.inr).app W)

/-- Special case (4), the other order: `T_{V ⊠ W} ≅ T_W ∘ T_V`, from the symmetry of the
representation category. -/
def monoidalAndFiniteSetFunctoriality.iteratedSymm (V : SatRep G Λ I) (W : SatRep G Λ J) :
    (weilHeckeAction G Λ (I ⊕ J)).obj (SatRep.extProd V W) ≅
      (Action.res (LisEnd G Λ) (weilPowMap F Sum.inr)).obj ((weilHeckeAction G Λ J).obj W) ⊗
        (Action.res (LisEnd G Λ) (weilPowMap F Sum.inl)).obj ((weilHeckeAction G Λ I).obj V) :=
  (weilHeckeAction G Λ (I ⊕ J)).mapIso (β_ _ _) ≪≫
    (Functor.Monoidal.μIso (weilHeckeAction G Λ (I ⊕ J)) _ _).symm ≪≫
    tensorIso ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ Sum.inr).app W)
      ((monoidalAndFiniteSetFunctoriality.restrictLegs G Λ Sum.inl).app V)

end MonoidalFunctoriality

/-! ### HS4/creation-annihilation-and-triangles

The images of a coevaluation and an evaluation under a monoidal functor, and the two triangle
identities, hold for every monoidal functor and exact pairing; they are proved first in that
generality (Mathlib material) and then applied to the Hecke action. -/

section MonoidalPairing

open Functor.LaxMonoidal Functor.OplaxMonoidal

variable {C E : Type*} [Category C] [Category E] [MonoidalCategory C] [MonoidalCategory E]
  (T : C ⥤ E) [T.Monoidal] (V W : C) [ExactPairing V W]

/-- The image of the coevaluation `𝟙 → V ⊗ W` under a monoidal functor. -/
def monoidalCoev : 𝟙_ E ⟶ T.obj V ⊗ T.obj W := ε T ≫ T.map (η_ V W) ≫ δ T V W

/-- The image of the evaluation `W ⊗ V → 𝟙` under a monoidal functor. -/
def monoidalEval : T.obj W ⊗ T.obj V ⟶ 𝟙_ E := μ T W V ≫ T.map (ε_ V W) ≫ η T

theorem monoidalCoev_eval_left : monoidalCoev T V W ▷ T.obj V ≫
    (α_ (T.obj V) (T.obj W) (T.obj V)).hom ≫ T.obj V ◁ monoidalEval T V W =
    (λ_ (T.obj V)).hom ≫ (ρ_ (T.obj V)).inv := by
  have h := congrArg T.map (ExactPairing.evaluation_coevaluation V W)
  simp only [Functor.map_comp, Functor.Monoidal.map_whiskerRight, Functor.Monoidal.map_whiskerLeft,
    Functor.Monoidal.map_associator, Functor.Monoidal.map_leftUnitor,
    Functor.Monoidal.map_rightUnitor_inv, Category.assoc] at h
  simp only [monoidalCoev, monoidalEval, comp_whiskerRight,
    MonoidalCategory.whiskerLeft_comp, Category.assoc]
  have key : T.map (η_ V W) ▷ T.obj V ≫ δ T V W ▷ T.obj V ≫
      (α_ (T.obj V) (T.obj W) (T.obj V)).hom ≫ T.obj V ◁ μ T W V ≫ T.obj V ◁ T.map (ε_ V W) =
      η T ▷ T.obj V ≫ (λ_ (T.obj V)).hom ≫ (ρ_ (T.obj V)).inv ≫ T.obj V ◁ ε T := by
    rw [← cancel_epi (δ T (𝟙_ C) V), ← cancel_mono (μ T V (𝟙_ C))]
    simpa using h
  calc _ = ε T ▷ T.obj V ≫ (T.map (η_ V W) ▷ T.obj V ≫ δ T V W ▷ T.obj V ≫
      (α_ (T.obj V) (T.obj W) (T.obj V)).hom ≫ T.obj V ◁ μ T W V ≫ T.obj V ◁ T.map (ε_ V W)) ≫
      T.obj V ◁ η T := by simp only [Category.assoc]
    _ = _ := by rw [key]; simp

theorem monoidalCoev_eval_right : T.obj W ◁ monoidalCoev T V W ≫
    (α_ (T.obj W) (T.obj V) (T.obj W)).inv ≫ monoidalEval T V W ▷ T.obj W =
    (ρ_ (T.obj W)).hom ≫ (λ_ (T.obj W)).inv := by
  have h := congrArg T.map (ExactPairing.coevaluation_evaluation V W)
  simp only [Functor.map_comp, Functor.Monoidal.map_whiskerRight, Functor.Monoidal.map_whiskerLeft,
    Functor.Monoidal.map_associator_inv, Functor.Monoidal.map_rightUnitor,
    Functor.Monoidal.map_leftUnitor_inv, Category.assoc] at h
  simp only [monoidalCoev, monoidalEval, comp_whiskerRight,
    MonoidalCategory.whiskerLeft_comp, Category.assoc]
  have key : T.obj W ◁ T.map (η_ V W) ≫ T.obj W ◁ δ T V W ≫
      (α_ (T.obj W) (T.obj V) (T.obj W)).inv ≫ μ T W V ▷ T.obj W ≫ T.map (ε_ V W) ▷ T.obj W =
      T.obj W ◁ η T ≫ (ρ_ (T.obj W)).hom ≫ (λ_ (T.obj W)).inv ≫ ε T ▷ T.obj W := by
    rw [← cancel_epi (δ T W (𝟙_ C)), ← cancel_mono (μ T (𝟙_ C) W)]
    simpa using h
  calc _ = T.obj W ◁ ε T ≫ (T.obj W ◁ T.map (η_ V W) ≫ T.obj W ◁ δ T V W ≫
      (α_ (T.obj W) (T.obj V) (T.obj W)).inv ≫ μ T W V ▷ T.obj W ≫ T.map (ε_ V W) ▷ T.obj W) ≫
      η T ▷ T.obj W := by simp only [Category.assoc]
    _ = _ := by rw [key]; simp

/-- A monoidal functor carries an exact pairing to an exact pairing. The pinned Mathlib has only
the converse for faithful functors (`ExactPairing.ofFaithful`). -/
@[instance_reducible]
def exactPairingMap : ExactPairing (T.obj V) (T.obj W) where
  coevaluation' := monoidalCoev T V W
  evaluation' := monoidalEval T V W
  coevaluation_evaluation' := monoidalCoev_eval_right T V W
  evaluation_coevaluation' := monoidalCoev_eval_left T V W

theorem monoidalCoev_unit :
    monoidalCoev T (𝟙_ C) (𝟙_ C) = (ρ_ (𝟙_ E)).inv ≫ (ε T ⊗ₘ ε T) := by
  have h : η_ (𝟙_ C) (𝟙_ C) = (ρ_ (𝟙_ C)).inv := rfl
  simp only [monoidalCoev, h, Functor.Monoidal.map_rightUnitor_inv, Category.assoc,
    Functor.Monoidal.μ_δ, Category.comp_id]
  rw [tensorHom_def, ← rightUnitor_inv_naturality_assoc]

theorem monoidalEval_unit :
    monoidalEval T (𝟙_ C) (𝟙_ C) = (η T ⊗ₘ η T) ≫ (ρ_ (𝟙_ E)).hom := by
  have h : ε_ (𝟙_ C) (𝟙_ C) = (ρ_ (𝟙_ C)).hom := rfl
  have hD : (λ_ (𝟙_ E)).inv ≫ (ρ_ (𝟙_ E)).hom = 𝟙 _ := by rw [← unitors_equal]; simp
  simp [monoidalEval, h, tensorHom_def, unitors_equal, hD]

end MonoidalPairing

section DualLegs

open Functor.LaxMonoidal Functor.OplaxMonoidal

variable {G : RedGrp F} {Λ : Coeff F ℓ}

/-- HS4/creation-annihilation-and-triangles: `create_V = T_coev : id ≅ T_1 → T_{V ⊗ W} ≅
T_V ∘ T_W`, for `V ∈ Rep_Λ(Ĝ ⋊ Q)` with dual `W = V^∨`, the pairing being given by
`coev : 1 → V ⊗ W` and `ev : W ⊗ V → 1`. It is a morphism of endofunctors with `W_E`-action,
that is, a `W_E`-equivariant natural transformation. -/
def createDualLegs (V W : SatRep G Λ Unit) [ExactPairing V W] :
    𝟙_ (WeilLisEnd G Λ Unit) ⟶
      (weilHeckeAction G Λ Unit).obj V ⊗ (weilHeckeAction G Λ Unit).obj W :=
  monoidalCoev (weilHeckeAction G Λ Unit) V W

/-- HS4/creation-annihilation-and-triangles: `annihilate_V = T_ev : T_W ∘ T_V ≅ T_{W ⊗ V} →
T_1 ≅ id`, a `W_E`-equivariant natural transformation. -/
def annihilateDualLegs (V W : SatRep G Λ Unit) [ExactPairing V W] :
    (weilHeckeAction G Λ Unit).obj W ⊗ (weilHeckeAction G Λ Unit).obj V ⟶
      𝟙_ (WeilLisEnd G Λ Unit) :=
  monoidalEval (weilHeckeAction G Λ Unit) V W

/-- `annihilate'_V = T_{ev ∘ s} : T_V ∘ T_W → id`, for the symmetry `s : V ⊗ W ≅ W ⊗ V`; it is
the image of the map `β : V ⊗ V^∨ → 1`, `v ⊗ f ↦ f(v)`, of Fargues–Scholze IX.6.5. -/
def dualLegs.annihilateSwapped (V W : SatRep G Λ Unit) [ExactPairing V W] :
    (weilHeckeAction G Λ Unit).obj V ⊗ (weilHeckeAction G Λ Unit).obj W ⟶
      𝟙_ (WeilLisEnd G Λ Unit) :=
  μ (weilHeckeAction G Λ Unit) V W ≫ (weilHeckeAction G Λ Unit).map ((β_ V W).hom ≫ ε_ V W) ≫
    η (weilHeckeAction G Λ Unit)

/-- The composite `T_V ≅ id ∘ T_V → (T_V ∘ T_W) ∘ T_V ≅ T_V ∘ (T_W ∘ T_V) → T_V ∘ id ≅ T_V`,
given by `create_V` and then `annihilate_V`, is the identity. -/
theorem dualLegs.leftTriangle (V W : SatRep G Λ Unit) [ExactPairing V W] :
    createDualLegs V W ▷ (weilHeckeAction G Λ Unit).obj V ≫
        (α_ ((weilHeckeAction G Λ Unit).obj V) ((weilHeckeAction G Λ Unit).obj W)
          ((weilHeckeAction G Λ Unit).obj V)).hom ≫
        (weilHeckeAction G Λ Unit).obj V ◁ annihilateDualLegs V W =
      (λ_ ((weilHeckeAction G Λ Unit).obj V)).hom ≫ (ρ_ ((weilHeckeAction G Λ Unit).obj V)).inv :=
  monoidalCoev_eval_left (weilHeckeAction G Λ Unit) V W

/-- The composite `T_W ≅ T_W ∘ id → T_W ∘ (T_V ∘ T_W) ≅ (T_W ∘ T_V) ∘ T_W → id ∘ T_W ≅ T_W`,
given by `create_V` and then `annihilate_V`, is the identity. -/
theorem dualLegs.rightTriangle (V W : SatRep G Λ Unit) [ExactPairing V W] :
    (weilHeckeAction G Λ Unit).obj W ◁ createDualLegs V W ≫
        (α_ ((weilHeckeAction G Λ Unit).obj W) ((weilHeckeAction G Λ Unit).obj V)
          ((weilHeckeAction G Λ Unit).obj W)).inv ≫
        annihilateDualLegs V W ▷ (weilHeckeAction G Λ Unit).obj W =
      (ρ_ ((weilHeckeAction G Λ Unit).obj W)).hom ≫ (λ_ ((weilHeckeAction G Λ Unit).obj W)).inv :=
  monoidalCoev_eval_right (weilHeckeAction G Λ Unit) V W

/-- `create_V` and `annihilate_V` are the unit and the counit of an adjunction `T_W ⊣ T_V`,
`W = V^∨`. -/
def dualLegs.adjunction (V W : SatRep G Λ Unit) [ExactPairing V W] :
    weilHeckeAction.functor G Λ Unit W ⊣ weilHeckeAction.functor G Λ Unit V where
  unit := (createDualLegs V W).hom.unmop
  counit := (annihilateDualLegs V W).hom.unmop
  left_triangle_components X := by
    have h := congrArg (fun f => f.hom.unmop.app X) (dualLegs.rightTriangle V W)
    have e : ∀ Y : WeilLisEnd G Λ Unit,
        ((ρ_ Y).hom ≫ (λ_ Y).inv).hom.unmop.app X = 𝟙 (Y.V.unmop.obj X) := by
      intro Y
      simp
    refine Eq.trans ?_ (e ((weilHeckeAction G Λ Unit).obj W))
    simpa using h
  right_triangle_components X := by
    have h := congrArg (fun f => f.hom.unmop.app X) (dualLegs.leftTriangle V W)
    have e : ∀ Y : WeilLisEnd G Λ Unit,
        ((λ_ Y).hom ≫ (ρ_ Y).inv).hom.unmop.app X = 𝟙 (Y.V.unmop.obj X) := by
      intro Y
      simp
    refine Eq.trans ?_ (e ((weilHeckeAction G Λ Unit).obj V))
    simpa using h

/-- With `W` in place of `V` and the symmetry of the representation category: `T_V ⊣ T_W`. So
`T_{V^∨}` is both left and right adjoint to `T_V`. -/
def dualLegs.adjunctionSwap (V W : SatRep G Λ Unit) [ExactPairing V W] :
    weilHeckeAction.functor G Λ Unit V ⊣ weilHeckeAction.functor G Λ Unit W :=
  letI : ExactPairing W V := BraidedCategory.exactPairing_swap V W
  dualLegs.adjunction W V

/-- `T_{V ⊠ W}`, the endofunctor with its action of `W_E²`. -/
def dualLegs.twoLeg (V W : SatRep G Λ Unit) : WeilLisEnd G Λ (Fin 2) :=
  (weilHeckeAction G Λ (Fin 2)).obj (SatRep.boxtimes G Λ ![V, W])

/-- The two-leg form of `create_V`: the map `id → T_{V ⊠ W}` of underlying endofunctors, through
the fusion identification of `T_{V ⊗ W}` with `T_{V ⊠ W}`. -/
def dualLegs.createTwoLegs (V W : SatRep G Λ Unit) [ExactPairing V W] :
    𝟙_ (LisEnd G Λ) ⟶ (dualLegs.twoLeg V W).V :=
  (ε (weilHeckeAction G Λ Unit)).hom ≫ ((weilHeckeAction G Λ Unit).map (η_ V W)).hom ≫
    (monoidalAndFiniteSetFunctoriality.fusion G Λ V W).hom.hom

/-- The two-leg form of `annihilate'_V`: the map `T_{V ⊠ W} → id` of underlying endofunctors. -/
def dualLegs.annihilateTwoLegs (V W : SatRep G Λ Unit) [ExactPairing V W] :
    (dualLegs.twoLeg V W).V ⟶ 𝟙_ (LisEnd G Λ) :=
  (monoidalAndFiniteSetFunctoriality.fusion G Λ V W).inv.hom ≫
    ((weilHeckeAction G Λ Unit).map ((β_ V W).hom ≫ ε_ V W)).hom ≫
    (η (weilHeckeAction G Λ Unit)).hom

/-- `(γ, γ) ∘ create_V = create_V` and `annihilate'_V ∘ (γ, γ) = annihilate'_V` for every
`γ ∈ W_E`. -/
theorem dualLegs.diagonal_equivariant (V W : SatRep G Λ Unit) [ExactPairing V W]
    (γ : F.WeilGroup) :
    dualLegs.createTwoLegs V W ≫ (dualLegs.twoLeg V W).ρ (fun _ => γ) =
        dualLegs.createTwoLegs V W ∧
      (dualLegs.twoLeg V W).ρ (fun _ => γ) ≫ dualLegs.annihilateTwoLegs V W =
        dualLegs.annihilateTwoLegs V W := sorry

/-- `annihilate'_V ∘ create_V = rank_Λ(V) · id`, for `V` free of rank `r` over `Λ`. -/
theorem dualLegs.trace (V W : SatRep G Λ Unit) [ExactPairing V W] (r : ℕ)
    (hfree : Module.Free Λ.carrier ((SatRep.forget G Λ Unit).obj V))
    (hr : Module.finrank Λ.carrier ((SatRep.forget G Λ Unit).obj V) = r)
    (A : Dlis (BunG G) Λ) :
    (createDualLegs V W ≫ dualLegs.annihilateSwapped V W).hom.unmop.app A =
      (r : Λ.carrier) • 𝟙 A := sorry
-- Omitted: `V` projective and not free, where the scalar is the trace of the identity of `V`;
-- Mathlib's `LinearMap.trace` is `0` for a module that is not free.

/-- For `γ₁, γ₂ ∈ W_E`: `annihilate'_V ∘ (γ₁, γ₂) ∘ create_V =
annihilate'_V ∘ (γ₁ γ₂⁻¹, 1) ∘ create_V`. -/
theorem dualLegs.excursion_quotient (V W : SatRep G Λ Unit) [ExactPairing V W]
    (γ₁ γ₂ : F.WeilGroup) :
    dualLegs.createTwoLegs V W ≫ (dualLegs.twoLeg V W).ρ ![γ₁, γ₂] ≫
        dualLegs.annihilateTwoLegs V W =
      dualLegs.createTwoLegs V W ≫ (dualLegs.twoLeg V W).ρ ![γ₁ * γ₂⁻¹, 1] ≫
        dualLegs.annihilateTwoLegs V W := sorry

/-- For a finite set `I`, `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)` and `α : 1 → V|_Ĝ` equivariant for the diagonal
copy of `Ĝ`: the natural transformation `T_α : id → T_V` of underlying endofunctors
(Fargues–Scholze VIII.4.2, IX.4.1). It carries no Weil equivariance. -/
def dualLegs.createAlong (I : Type) [Finite I] (V : SatRep G Λ I)
    (α : 𝟙_ (GeomSatRep G Λ Unit) ⟶ (SatRep.diag G Λ I).obj V) :
    𝟙_ (LisEnd G Λ) ⟶ ((weilHeckeAction G Λ I).obj V).V :=
  ε (heckeGeom G Λ) ≫ (heckeGeom G Λ).map α ≫ (heckeGeom.comparison G Λ I).hom.app V

/-- For `β : V|_Ĝ → 1` equivariant for the diagonal copy of `Ĝ`: the natural transformation
`T_β : T_V → id` of underlying endofunctors. -/
def dualLegs.annihilateAlong (I : Type) [Finite I] (V : SatRep G Λ I)
    (β : (SatRep.diag G Λ I).obj V ⟶ 𝟙_ (GeomSatRep G Λ Unit)) :
    ((weilHeckeAction G Λ I).obj V).V ⟶ 𝟙_ (LisEnd G Λ) :=
  (heckeGeom.comparison G Λ I).inv.app V ≫ (heckeGeom G Λ).map β ≫ η (heckeGeom G Λ)

/-- For `g : V → V'` in `Rep_Λ((Ĝ ⋊ Q)^I)`: `T_g ∘ T_α = T_{g ∘ α}` and
`T_{β'} ∘ T_g = T_{β' ∘ g}`. That `T_g` commutes with the action of `W_E^I` is the property
`comm` of the morphism `(weilHeckeAction G Λ I).map g`. -/
theorem dualLegs.along_naturality (I : Type) [Finite I] {V V' : SatRep G Λ I} (g : V ⟶ V')
    (α : 𝟙_ (GeomSatRep G Λ Unit) ⟶ (SatRep.diag G Λ I).obj V)
    (β' : (SatRep.diag G Λ I).obj V' ⟶ 𝟙_ (GeomSatRep G Λ Unit)) :
    dualLegs.createAlong I V α ≫ ((weilHeckeAction G Λ I).map g).hom =
        dualLegs.createAlong I V' (α ≫ (SatRep.diag G Λ I).map g) ∧
      ((weilHeckeAction G Λ I).map g).hom ≫ dualLegs.annihilateAlong I V' β' =
        dualLegs.annihilateAlong I V ((SatRep.diag G Λ I).map g ≫ β') := sorry

/-- For `I = {1,2}`, the representation `V ⊠ W`, `α = coev` and `β = ev ∘ s`: `T_α = create_V`
and `T_β = annihilate'_V`. -/
theorem dualLegs.along_dual_pair (V W : SatRep G Λ Unit) [ExactPairing V W] :
    dualLegs.createAlong (Fin 2) (SatRep.boxtimes G Λ ![V, W])
          (ε (SatRep.diag G Λ Unit) ≫ (SatRep.diag G Λ Unit).map (η_ V W) ≫
            (SatRep.diagBoxtimes V W).inv) =
        dualLegs.createTwoLegs V W ∧
      dualLegs.annihilateAlong (Fin 2) (SatRep.boxtimes G Λ ![V, W])
          ((SatRep.diagBoxtimes V W).hom ≫
            (SatRep.diag G Λ Unit).map ((β_ V W).hom ≫ ε_ V W) ≫ η (SatRep.diag G Λ Unit)) =
        dualLegs.annihilateTwoLegs V W := sorry

/-- For `V = 1`, `create_1` and `annihilate_1` are the unit constraints `id ≅ id ∘ id` of the
monoidal functor `T`. -/
theorem dualLegs.unit :
    createDualLegs (𝟙_ (SatRep G Λ Unit)) (𝟙_ (SatRep G Λ Unit)) =
        (ρ_ (𝟙_ (WeilLisEnd G Λ Unit))).inv ≫
          (ε (weilHeckeAction G Λ Unit) ⊗ₘ ε (weilHeckeAction G Λ Unit)) ∧
      annihilateDualLegs (𝟙_ (SatRep G Λ Unit)) (𝟙_ (SatRep G Λ Unit)) =
        (η (weilHeckeAction G Λ Unit) ⊗ₘ η (weilHeckeAction G Λ Unit)) ≫
          (ρ_ (𝟙_ (WeilLisEnd G Λ Unit))).hom :=
  ⟨monoidalCoev_unit (weilHeckeAction G Λ Unit), monoidalEval_unit (weilHeckeAction G Λ Unit)⟩

end DualLegs

section DualLegsCoefficients

variable {G : RedGrp F}

/-- For a homomorphism `Λ → Λ'` of `ℤ_ℓ[√q]`-algebras, extension of scalars carries `create_V`
and `annihilate_V` to `create` and `annihilate` of `V ⊗_Λ Λ'`, under the isomorphisms
`T_V(A) ⊗_Λ Λ' ≅ T_{V ⊗_Λ Λ'}(A ⊗_Λ Λ')` of HS1/coefficient-base-change. The pairing of
`V ⊗_Λ Λ'` and `W ⊗_Λ Λ'` is the image of that of `V` and `W`. -/
theorem dualLegs.map_coefficients {Λ Λ' : Coeff F ℓ} (φ : Λ.Hom Λ') (V W : SatRep G Λ Unit)
    [ExactPairing V W] (A : Dlis (BunG G) Λ) :
    letI := exactPairingMap (SatRep.baseChange G Unit φ) V W
    (Dlis.extendScalars (BunG G) φ).map ((createDualLegs V W).hom.unmop.app A) ≫
          (weilHeckeAction.extendScalars G φ Unit V).hom.app
            ((weilHeckeAction.functor G Λ Unit W).obj A) ≫
          (weilHeckeAction.functor G Λ' Unit ((SatRep.baseChange G Unit φ).obj V)).map
            ((weilHeckeAction.extendScalars G φ Unit W).hom.app A) =
        (createDualLegs ((SatRep.baseChange G Unit φ).obj V)
          ((SatRep.baseChange G Unit φ).obj W)).hom.unmop.app
            ((Dlis.extendScalars (BunG G) φ).obj A) ∧
      (Dlis.extendScalars (BunG G) φ).map ((annihilateDualLegs V W).hom.unmop.app A) =
        (weilHeckeAction.extendScalars G φ Unit W).hom.app
            ((weilHeckeAction.functor G Λ Unit V).obj A) ≫
          (weilHeckeAction.functor G Λ' Unit ((SatRep.baseChange G Unit φ).obj W)).map
            ((weilHeckeAction.extendScalars G φ Unit V).hom.app A) ≫
          (annihilateDualLegs ((SatRep.baseChange G Unit φ).obj V)
            ((SatRep.baseChange G Unit φ).obj W)).hom.unmop.app
              ((Dlis.extendScalars (BunG G) φ).obj A) := sorry

end DualLegsCoefficients

-- dualLegs.rank_test
-- Both forms: the composite `id → T_V ∘ T_{V^∨} → id` and the two-leg composite
-- `id → T_{V ⊠ V^∨} → id` are multiplication by `n`, the rank of the standard representation.
example (n : ℕ) (Λ : Coeff F ℓ) (A : Dlis (BunG (RedGrp.GLn F n)) Λ) :
    (createDualLegs (SatRep.stdGL F Λ n) (SatRep.stdGL F Λ n)ᘁ ≫
          dualLegs.annihilateSwapped (SatRep.stdGL F Λ n) (SatRep.stdGL F Λ n)ᘁ).hom.unmop.app
          A =
        (n : Λ.carrier) • 𝟙 A ∧
      (dualLegs.createTwoLegs (SatRep.stdGL F Λ n) (SatRep.stdGL F Λ n)ᘁ ≫
          dualLegs.annihilateTwoLegs (SatRep.stdGL F Λ n) (SatRep.stdGL F Λ n)ᘁ).unmop.app A =
        (n : Λ.carrier) • 𝟙 A := by
  sorry

-- dualLegs.triangle_test
-- The pairing of `χ_1` with `χ_{-1}` is a hypothesis; for every such pairing `create` and
-- `annihilate` are isomorphisms, the characters being invertible.
example (Λ : Coeff F ℓ) [ExactPairing (SatRep.char F Λ 1) (SatRep.char F Λ (-1))] :
    IsIso (createDualLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1))) ∧
      IsIso (annihilateDualLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1))) ∧
      createDualLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1)) ▷
            (weilHeckeAction (RedGrp.Gm F) Λ Unit).obj (SatRep.char F Λ 1) ≫
          (α_ _ _ _).hom ≫
          (weilHeckeAction (RedGrp.Gm F) Λ Unit).obj (SatRep.char F Λ 1) ◁
            annihilateDualLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1)) =
        (λ_ _).hom ≫ (ρ_ _).inv := by
  sorry

-- dualLegs.diagonal_test
example (G : RedGrp F) (Λ : Coeff F ℓ) (V : SatRep G Λ Unit) (γ γ₁ γ₂ : F.WeilGroup) :
    dualLegs.createTwoLegs V Vᘁ ≫ (dualLegs.twoLeg V Vᘁ).ρ (fun _ => γ) =
        dualLegs.createTwoLegs V Vᘁ ∧
      dualLegs.createTwoLegs V Vᘁ ≫ (dualLegs.twoLeg V Vᘁ).ρ ![γ₁, γ₂] ≫
          dualLegs.annihilateTwoLegs V Vᘁ =
        dualLegs.createTwoLegs V Vᘁ ≫ (dualLegs.twoLeg V Vᘁ).ρ ![γ₁ * γ₂⁻¹, 1] ≫
          dualLegs.annihilateTwoLegs V Vᘁ := by
  sorry

/-- A character `χ` of `E^×` as a character of `J_b(E) = E^×`, for `G = 𝔾_m`. -/
def RedGrp.Gm.centralizerChar (hT : RedGrp.isTorus F (RedGrp.Gm F)) (b : (RedGrp.Gm F).ptsBreve)
    {M : Type} [Monoid M] (χ : F.Eˣ →* M) : (RedGrp.Gm F).sigmaCentralizer b →* M :=
  χ.comp ((RedGrp.Gm.ptsEquiv F).toMonoidHom.comp
    ((RedGrp.Gm F).torusCentralizer hT b).symm.toMulEquiv.toMonoidHom)

-- dualLegs.torus_excursion_test
-- `A` is the sheaf on `Bun_{𝔾_m}` supported on the stratum of `b` that corresponds to the smooth
-- character `χ` of `E^× = J_b(E)`; `rec` is the reciprocity map of Fargues–Scholze IX.6.4.
example (Λ : Coeff F ℓ) (hT : RedGrp.isTorus F (RedGrp.Gm F))
    [ExactPairing (SatRep.char F Λ 1) (SatRep.char F Λ (-1))] (γ₁ γ₂ : F.WeilGroup)
    (χ : F.Eˣ →* Λ.carrierˣ) (hχ : IsOpen (χ.ker : Set F.Eˣ)) (b : (RedGrp.Gm F).ptsBreve) :
    (dualLegs.createTwoLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1)) ≫
          (dualLegs.twoLeg (SatRep.char F Λ 1) (SatRep.char F Λ (-1))).ρ ![γ₁, γ₂] ≫
          dualLegs.annihilateTwoLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1))).unmop.app
        ((BunG.stalkLeft (RedGrp.Gm F) Λ b).obj
          (DSmooth.ofChar _ Λ (RedGrp.Gm.centralizerChar hT b χ))) =
      ((χ (F.reciprocity (γ₁ * γ₂⁻¹)) : Λ.carrierˣ) : Λ.carrier) • 𝟙 _ := by
  sorry

-- dualLegs.not_invariant_test
example (Λ : Coeff F ℓ) (hT : RedGrp.isTorus F (RedGrp.Gm F))
    [ExactPairing (SatRep.char F Λ 1) (SatRep.char F Λ (-1))] (γ₀ : F.WeilGroup)
    (χ : F.Eˣ →* Λ.carrierˣ) (hχ : IsOpen (χ.ker : Set F.Eˣ))
    (hγ : χ (F.reciprocity γ₀) ≠ 1) (b : (RedGrp.Gm F).ptsBreve) :
    (dualLegs.createTwoLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1)) ≫
          (dualLegs.twoLeg (SatRep.char F Λ 1) (SatRep.char F Λ (-1))).ρ ![γ₀, 1]).unmop.app
          ((BunG.stalkLeft (RedGrp.Gm F) Λ b).obj
            (DSmooth.ofChar _ Λ (RedGrp.Gm.centralizerChar hT b χ))) =
        ((χ (F.reciprocity γ₀) : Λ.carrierˣ) : Λ.carrier) •
          (dualLegs.createTwoLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1))).unmop.app
            ((BunG.stalkLeft (RedGrp.Gm F) Λ b).obj
              (DSmooth.ofChar _ Λ (RedGrp.Gm.centralizerChar hT b χ))) ∧
      (dualLegs.createTwoLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1)) ≫
          (dualLegs.twoLeg (SatRep.char F Λ 1) (SatRep.char F Λ (-1))).ρ ![γ₀, 1]).unmop.app
          ((BunG.stalkLeft (RedGrp.Gm F) Λ b).obj
            (DSmooth.ofChar _ Λ (RedGrp.Gm.centralizerChar hT b χ))) ≠
        (dualLegs.createTwoLegs (SatRep.char F Λ 1) (SatRep.char F Λ (-1))).unmop.app
          ((BunG.stalkLeft (RedGrp.Gm F) Λ b).obj
            (DSmooth.ofChar _ Λ (RedGrp.Gm.centralizerChar hT b χ))) := by
  sorry

-- dualLegs.unit_test
-- That `create_1` and `annihilate_1` are the unit constraints is `dualLegs.unit`, which holds
-- for every monoidal functor; the statement about the Hecke action is that `W_E²` acts
-- trivially on `T_{1 ⊠ 1}`.
example (G : RedGrp F) (Λ : Coeff F ℓ) (γ₁ γ₂ : F.WeilGroup) :
    dualLegs.createTwoLegs (𝟙_ (SatRep G Λ Unit)) (𝟙_ (SatRep G Λ Unit)) ≫
        (dualLegs.twoLeg (𝟙_ (SatRep G Λ Unit)) (𝟙_ (SatRep G Λ Unit))).ρ ![γ₁, γ₂] ≫
        dualLegs.annihilateTwoLegs (𝟙_ (SatRep G Λ Unit)) (𝟙_ (SatRep G Λ Unit)) =
      𝟙 (𝟙_ (LisEnd G Λ)) := by
  sorry

/-! ### HS4/isogeny-product-and-weil-restriction-diagrams -/

section AdIso

variable {G' G : RedGrp F} (η : G' ⟶ G) (Λ : Coeff F ℓ) (I : Type) [Finite I]

/-- HS4/isogeny-product-and-weil-restriction-diagrams, part (d): geometric Hecke comparison for a
homomorphism `η : G' → G` inducing an isomorphism of adjoint groups. With
`π : Bun_{G'} → Bun_G`, `T_{V'}(π^* A) ≅ π^* T_V(A)` for `V = V'|_{(Ĝ ⋊ Q)^I}` the restriction
along `η̂`: `π^*` intertwines the Hecke action of `G'` with that of `G`
(Fargues–Scholze IX.6.1, proof). -/
def isogenyProductAndWeilRestrictionDiagrams (hη : RedGrp.adIso F η) (V' : SatRep G' Λ I) :
    Dlis.pullback (BunG.map η) Λ ⋙ weilHeckeAction.functor G' Λ I V' ≅
      weilHeckeAction.functor G Λ I ((SatRep.dualRes Λ η I).obj V') ⋙
        Dlis.pullback (BunG.map η) Λ := sorry

/-- Part (d): the isomorphism is `W_E^I`-equivariant. -/
theorem isogenyProductAndWeilRestrictionDiagrams.equivariant (hη : RedGrp.adIso F η)
    (V' : SatRep G' Λ I) (γ : I → F.WeilGroup) :
    Functor.whiskerLeft (Dlis.pullback (BunG.map η) Λ)
          (Quiver.Hom.unmop (((weilHeckeAction G' Λ I).obj V').ρ γ)) ≫
        (isogenyProductAndWeilRestrictionDiagrams η Λ I hη V').hom =
      (isogenyProductAndWeilRestrictionDiagrams η Λ I hη V').hom ≫
        Functor.whiskerRight
          (Quiver.Hom.unmop (((weilHeckeAction G Λ I).obj ((SatRep.dualRes Λ η I).obj V')).ρ γ))
          (Dlis.pullback (BunG.map η) Λ) := sorry

/-- The diagram of Hecke correspondences commutes: extension of structure group commutes with
`p_1` and with `p_2` (HS0/structure-group-and-inner-form). -/
theorem isogenyProductAndWeilRestrictionDiagrams.diagram :
    HckI.map I η ≫ HckI.p1 G I = HckI.p1 G' I ≫ BunG.map η ∧
      HckI.map I η ≫ HckI.p2 G I = HckI.p2 G' I ≫ prod.map (BunG.map η) (𝟙 _) := sorry

/-- Part (b): `π_{H♮} S'_{V'} ≅ h_1^* π_♮ Λ ⊗^■ S'_V` in `D_■(Hck^I_G, Λ)`. -/
def isogenyProductAndWeilRestrictionDiagrams.kernel (hη : RedGrp.adIso F η)
    (V' : SatRep G' Λ I) :
    (DSolid.sharp (HckI.map I η) Λ).obj ((globalKernel G' Λ I).obj V') ≅
      (DSolid.pullback (HckI.p1 G I) Λ).obj ((DSolid.sharp (BunG.map η) Λ).obj (𝟙_ _)) ⊗
        (globalKernel G Λ I).obj ((SatRep.dualRes Λ η I).obj V') := sorry

/-- Part (c): `(π × id)_♮ T_{V'}(π^* A) ≅ T_V(A ⊗^■ π_♮ Λ)` in `D_■(Bun_G × (Div¹)^I, Λ)`, for
`A ∈ D_lis(Bun_G, Λ)`; all pushforwards are `♮`-pushforwards. -/
def isogenyProductAndWeilRestrictionDiagrams.sharp (hη : RedGrp.adIso F η) (V' : SatRep G' Λ I)
    (A : Dlis (BunG G) Λ) :
    (DSolid.sharp (prod.map (BunG.map η) (𝟙 (Div1.stack F I))) Λ).obj
        ((heckeOperator G' Λ I V').obj ((DSolid.pullback (BunG.map η) Λ).obj A.obj)) ≅
      (heckeOperator G Λ I ((SatRep.dualRes Λ η I).obj V')).obj
        (A.obj ⊗ (DSolid.sharp (BunG.map η) Λ).obj (𝟙_ _)) := sorry
-- Omitted: part (a), the factorisation of `π_H` through `Hck^I_G ×_{Bun_G} Bun_{G'}` and its
-- local description by `Gr^I_{G'} → Gr^I_G`; naturality of (b), (c), (d) in `V'`, and of (c)
-- in `A`; and compatibility with maps of finite sets.

end AdIso

/-! ### HS4/product-hecke-diagram -/

section Product

variable (G₁ G₂ : RedGrp F) (Λ : Coeff F ℓ) (I : Type) [Finite I]

/-- `Bun_{G₁ × G₂} = Bun_{G₁} × Bun_{G₂}`. -/
theorem productHeckeDiagram.bun :
    IsIso (prod.lift (BunG.map (RedGrp.prod.fst G₁ G₂)) (BunG.map (RedGrp.prod.snd G₁ G₂))) :=
  sorry

/-- HS4/product-hecke-diagram, part (b): products of global Hecke kernels. For `G = G₁ × G₂`
and `A_i ∈ D_lis(Bun_{G_i}, Λ)`,
`T_{V₁ ⊠ V₂}(A₁ ⊠ A₂) ≅ T_{V₁}(A₁) ⊠_{(Div¹)^I} T_{V₂}(A₂)` in
`D_■(Bun_G × (Div¹)^I, Λ)` (Fargues–Scholze IX.6.2, proof). -/
def productHeckeDiagram (V₁ : SatRep G₁ Λ I) (V₂ : SatRep G₂ Λ I) (A₁ : Dlis (BunG G₁) Λ)
    (A₂ : Dlis (BunG G₂) Λ) :
    (heckeOperator (G₁.prod G₂) Λ I (SatRep.prodBoxtimes Λ V₁ V₂)).obj
        ((DSolid.pullback (BunG.map (RedGrp.prod.fst G₁ G₂)) Λ).obj A₁.obj ⊗
          (DSolid.pullback (BunG.map (RedGrp.prod.snd G₁ G₂)) Λ).obj A₂.obj) ≅
      (DSolid.pullback (prod.map (BunG.map (RedGrp.prod.fst G₁ G₂)) (𝟙 (Div1.stack F I))) Λ).obj
          ((heckeOperator G₁ Λ I V₁).obj A₁.obj) ⊗
        (DSolid.pullback (prod.map (BunG.map (RedGrp.prod.snd G₁ G₂)) (𝟙 (Div1.stack F I)))
          Λ).obj ((heckeOperator G₂ Λ I V₂).obj A₂.obj) := sorry

/-- Part (a): `S'_{V₁ ⊠ V₂} ≅ pr_1^* S'_{V₁} ⊗^■ pr_2^* S'_{V₂}` in `D_■(Hck^I_G, Λ)`. -/
def productHeckeDiagram.kernel (V₁ : SatRep G₁ Λ I) (V₂ : SatRep G₂ Λ I) :
    (globalKernel (G₁.prod G₂) Λ I).obj (SatRep.prodBoxtimes Λ V₁ V₂) ≅
      (DSolid.pullback (HckI.map I (RedGrp.prod.fst G₁ G₂)) Λ).obj
          ((globalKernel G₁ Λ I).obj V₁) ⊗
        (DSolid.pullback (HckI.map I (RedGrp.prod.snd G₁ G₂)) Λ).obj
          ((globalKernel G₂ Λ I).obj V₂) := sorry

/-- Part (c): for compact `A_i ∈ D_lis(Bun_{G_i}, Λ)` the exterior product `A₁ ⊠ A₂` is a
compact object of `D_lis(Bun_G, Λ)` (Fargues–Scholze VII.7.10, with `D_lis`). -/
theorem productHeckeDiagram.compact (A₁ : Dlis (BunG G₁) Λ) (A₂ : Dlis (BunG G₂) Λ)
    (h₁ : Dlis.isCompact _ Λ A₁) (h₂ : Dlis.isCompact _ Λ A₂) :
    Dlis.isCompact _ Λ
      ((Dlis.pullback (BunG.map (RedGrp.prod.fst G₁ G₂)) Λ).obj A₁ ⊗
        (Dlis.pullback (BunG.map (RedGrp.prod.snd G₁ G₂)) Λ).obj A₂) := sorry
-- Omitted: `Hck^I_G = Hck^I_{G₁} ×_{(Div¹)^I} Hck^I_{G₂}`; in (c), that the exterior products
-- form a class of compact generators and the Künneth formula
-- `RHom(A₁, B₁) ⊗^L_Λ RHom(A₂, B₂) ≅ RHom(A₁ ⊠ A₂, B₁ ⊠ B₂)` (the pinned Mathlib has no derived
-- tensor product on `DerivedCategory`); naturality and compatibility with maps of finite sets.

end Product

/-! ### HS4/weil-restriction-hecke-diagram -/

section WeilRestriction

variable {F' : LocalField p} (e : F.Ext F') (G' : RedGrp F') (Λ : Coeff F ℓ) (I : Type) [Finite I]

/-- HS4/weil-restriction-hecke-diagram, part (a): `Bun_{G'} ≅ Bun_G` for `G = Res_{E'/E} G'`: a
`G`-bundle on `X_{S,E}` is a `G'`-bundle on `X_{S,E'} = X_{S,E} ×_E E'`. -/
def weilRestrictionHeckeDiagram.bun (he : e.IsSeparable) :
    BunG G' ≅ BunG (RedGrp.weilRes e G') := sorry

/-- The map `Bun_{G'} × (Div¹_{E'})^I → Bun_G × (Div¹_E)^I`: the isomorphism of (a) times the
finite étale map `ρ^I`. -/
def weilRestrictionHeckeDiagram.legs (he : e.IsSeparable) :
    BunGLegs G' I ⟶ BunGLegs (RedGrp.weilRes e G') I :=
  prod.map (weilRestrictionHeckeDiagram.bun e G' he).hom
    ((VSheaf.toStack p).map (Limits.Pi.map fun _ => e.div1Map))

/-- Part (b): the map `ψ : Hck^I_{G'} → Hck^I_G`, which regards a modification of `G'`-bundles
on `X_{S,E'}` at legs `D'_i` as a modification of `G`-bundles on `X_{S,E}` at their images. -/
def weilRestrictionHeckeDiagram.psi (he : e.IsSeparable) :
    HckI G' I ⟶ HckI (RedGrp.weilRes e G') I := sorry

/-- Part (b): the diagram of Hecke correspondences commutes. -/
theorem weilRestrictionHeckeDiagram.psi_comm (he : e.IsSeparable) :
    weilRestrictionHeckeDiagram.psi e G' I he ≫ HckI.p1 (RedGrp.weilRes e G') I =
        HckI.p1 G' I ≫ (weilRestrictionHeckeDiagram.bun e G' he).hom ∧
      weilRestrictionHeckeDiagram.psi e G' I he ≫ HckI.p2 (RedGrp.weilRes e G') I =
        HckI.p2 G' I ≫ weilRestrictionHeckeDiagram.legs e G' I he := sorry

/-- Part (c): `ψ_♮ S'_{V'} ≅ S'_V`, for `V` the induction to `(Ĝ ⋊ W_E)^I` of the inflation of
`V'`. -/
def weilRestrictionHeckeDiagram.kernel (he : e.IsSeparable)
    (V' : SatRep G' (Λ.restrictExt e) I) :
    (DSolid.sharp (weilRestrictionHeckeDiagram.psi e G' I he) Λ).obj
        ((DSolid.changeField e _ Λ).functor.obj ((globalKernel G' (Λ.restrictExt e) I).obj V')) ≅
      (globalKernel (RedGrp.weilRes e G') Λ I).obj ((SatRep.induce e G' Λ I).obj V') := sorry

/-- HS4/weil-restriction-hecke-diagram, part (d): Weil restriction of Hecke kernels. For
`A ∈ D_lis(Bun_G, Λ) = D_lis(Bun_{G'}, Λ)`, `T_V(A) ≅ (id × ρ^I)_♮ T_{V'}(A)` in
`D_■(Bun_G × (Div¹_E)^I, Λ)`: the `W_E^I`-equivariant object `T_V(A)` is induced from the
`W_{E'}^I`-equivariant object `T_{V'}(A)` (Fargues–Scholze IX.6.3, proof). -/
def weilRestrictionHeckeDiagram (he : e.IsSeparable) (V' : SatRep G' (Λ.restrictExt e) I) :
    Dlis.toSolid (BunG (RedGrp.weilRes e G')) Λ ⋙
        heckeOperator (RedGrp.weilRes e G') Λ I ((SatRep.induce e G' Λ I).obj V') ≅
      Dlis.toSolid (BunG (RedGrp.weilRes e G')) Λ ⋙
        DSolid.pullback (weilRestrictionHeckeDiagram.bun e G' he).hom Λ ⋙
        (DSolid.changeField e _ Λ).inverse ⋙ heckeOperator G' (Λ.restrictExt e) I V' ⋙
        (DSolid.changeField e _ Λ).functor ⋙
        DSolid.sharp (weilRestrictionHeckeDiagram.legs e G' I he) Λ := sorry
-- Omitted: in (b), that `Hck^I_{G'} → Hck^I_G ×_{(Div¹_E)^I} (Div¹_{E'})^I` is a closed
-- immersion; in (c), `rank_Λ V = [E' : E]^{|I|} · rank_Λ V'` and the form `ψ_* S_{V'} ≅ S_V` for
-- the Satake sheaves; compatibility with maps of finite sets and with towers `E''/E'/E`.

end WeilRestriction

/-! ### HS4/levi-compatibility -/

/-- HS4/levi-compatibility: `Hck^I_{M,P} = Hck^I_P ×_{h'_1, Bun_P, ψ} Bun_M`, the stack of
modifications from an `M`-bundle to a `P`-bundle (Fargues–Scholze IX.7.2, proof, p. 336). The
interfaces have neither `Bun_P` nor `Hck^I_P`, so the body is the placeholder. -/
def leviCompatibility.HckMP {G : RedGrp F} (P : G.Parabolic) (I : Type) [Finite I] : VStack p :=
  sorry

section Levi

variable {G : RedGrp F} (P : G.Parabolic) (Λ : Coeff F ℓ) (I : Type) [Finite I]

/-- `g = π_H ∘ ψ_H : Hck^I_{M,P} → Hck^I_M`, induced by `P → M`. -/
def leviCompatibility.g : leviCompatibility.HckMP P I ⟶ HckI P.levi I := sorry

/-- `Hck^I_{M,P} → Hck^I_P → Hck^I_G`, induced by `P ⊂ G`. -/
def leviCompatibility.toG : leviCompatibility.HckMP P I ⟶ HckI G I := sorry

/-- HS4/levi-compatibility, part (b): Levi constant-term compatibility of the kernels, in the
normalisation of HS0/bounded-hecke-substacks (the type of a modification is the position of the
first bundle relative to the second, and `S_V` is supported on types bounded by the weights of
`V`). For `Λ` killed by a power of `ℓ` and `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)`, `Rg_! S_V[-deg_P]` is the
pullback to `Hck^I_M` of the Satake sheaf for `M` of the restriction of `V` along
`(m, w) ↦ (m · (2ρ̂_G - 2ρ̂_M)(√q)^{-|w|}, w)`; equivalently `Rg_! S_V` is the pullback of that
Satake sheaf shifted by `[deg_P]` (Fargues–Scholze IX.7.2, proof, p. 337, with VI.7.13 and
VI.12.1). -/
def leviCompatibility (hΛ : Λ.IsTorsion) (V : SatRep G Λ I) :
    (Det.shriek (leviCompatibility.g P I) Λ).obj
        ((Det.pullback (leviCompatibility.toG P I) Λ).obj ((satakeSheaf G Λ I).obj V)) ≅
      (Det.pullback (HckI.toLocal P.levi I) Λ).obj
        ((HckLoc.degShift P Λ I).functor.obj
          ((satakeSheafLoc P.levi Λ I).obj ((SatRep.leviRes Λ P I).obj V))) := sorry
-- Omitted: the two steps of (b) in the normalisation of the source: `Rg_! S_V` is the pullback of
-- `Rp_! q^*(sw^* S_V)` for `Gr^I_G ← Gr^I_P → Gr^I_M`, and the constant term `CT_P = Rp_! q^*`,
-- shifted by `[deg_P]`, corresponds to restriction along
-- `(m, w) ↦ (m · (2ρ̂_G - 2ρ̂_M)(√q)^{|w|}, w)`. They are statements on the Grassmannians of the
-- second bundle relative to the first, which the interfaces do not have; their combination, with
-- `sw^*` the Chevalley involution up to an inner automorphism, is the statement above.
-- Omitted: part (a), that `g` is the pullback of `L⁺M\Gr^I_P → L⁺M\Gr^I_M`; part (c), the
-- action on one Harder–Narasimhan stratum, `Rπ_! Rh'_{2!}(h'_1^* A'_N ⊗ S_V) ≅
-- Rh_{2!}(h_1^* B_N ⊗ Rg_! S_V)` and `T_V(A_N)|_{Bun_G^{b_N}} =
-- Rh'_{2!}(h'_1^* A'_N ⊗ S_V)|_{Bun_P^{b_N}}`: the interfaces have no `Bun_P`, no
-- Harder–Narasimhan strata of it, and no `Rπ_!` for the map `π : Bun_P → Bun_M`, which is not
-- representable.

end Levi

/-! ### HS4/continuous-tensor-generator-export -/

section Export

variable (G : RedGrp F) (Λ : Coeff F ℓ) {I J : Type} [Finite I] [Finite J]

/-- HS4/continuous-tensor-generator-export: for `A ∈ D_lis(Bun_G, Λ)` compact, every finite set
`I` and `V ∈ Rep_Λ((Ĝ ⋊ Q)^I)`, the object `T_V(A)` is compact and the action of `W_E^I` on it
is continuous: a map of condensed groups to the automorphisms of `T_V(A)`, whose endomorphisms
are relatively discrete over `ℤ_ℓ` (Fargues–Scholze IX.2.4 with IX.1.2 and IX.2.2). -/
theorem continuousTensorGeneratorExport (V : SatRep G Λ I) (A : Dlis (BunG G) Λ)
    (hA : Dlis.isCompact _ Λ A) :
    Dlis.isCompact _ Λ ((weilHeckeAction.functor G Λ I V).obj A) ∧
      IsRelDiscreteContinuous Λ (((weilHeckeAction.equivariant G Λ I).obj V).obj A).ρ := sorry

/-- (E1) exterior products: `T_{V ⊠ W} ≅ T_V ∘ T_W`, equivariantly for `W_E^{I ⊔ J}`; the other
order is `monoidalAndFiniteSetFunctoriality.iteratedSymm`. -/
def continuousTensorGeneratorExport.exterior (V : SatRep G Λ I) (W : SatRep G Λ J) :
    (weilHeckeAction G Λ (I ⊕ J)).obj (SatRep.extProd V W) ≅
      (Action.res (LisEnd G Λ) (weilPowMap F Sum.inl)).obj ((weilHeckeAction G Λ I).obj V) ⊗
        (Action.res (LisEnd G Λ) (weilPowMap F Sum.inr)).obj ((weilHeckeAction G Λ J).obj W) :=
  monoidalAndFiniteSetFunctoriality.iterated G Λ V W

/-- (E2) tensor products: for `I = J`, `T_{V ⊗ W}` is `T_{V ⊠ W}` with `W_E^I` acting through the
diagonal `W_E^I → W_E^{I ⊔ I}`. -/
def continuousTensorGeneratorExport.tensor (V W : SatRep G Λ I) :
    (weilHeckeAction G Λ I).obj (V ⊗ W) ≅
      (Action.res (LisEnd G Λ) (weilPowMap F (Sum.elim id id))).obj
        ((weilHeckeAction G Λ (I ⊕ I)).obj (SatRep.extProd V W)) := sorry

/-- (E3): if `P^I` acts trivially on `T_V(A)` and `P^J` on `T_W(A)`, then `P^{I ⊔ J}` acts
trivially on `T_{V ⊠ W}(A)`. The packet takes `P` open in the wild inertia; the statement holds
for every subgroup `P` of `W_E`. -/
theorem continuousTensorGeneratorExport.trivial_exterior (P : Subgroup F.WeilGroup)
    (V : SatRep G Λ I) (W : SatRep G Λ J) (A : Dlis (BunG G) Λ)
    (hV : ∀ w : I → F.WeilGroup, (∀ i, w i ∈ P) →
      (((weilHeckeAction.equivariant G Λ I).obj V).obj A).ρ w = 𝟙 _)
    (hW : ∀ w : J → F.WeilGroup, (∀ j, w j ∈ P) →
      (((weilHeckeAction.equivariant G Λ J).obj W).obj A).ρ w = 𝟙 _)
    (w : I ⊕ J → F.WeilGroup) (hw : ∀ x, w x ∈ P) :
    (((weilHeckeAction.equivariant G Λ (I ⊕ J)).obj (SatRep.extProd V W)).obj A).ρ w = 𝟙 _ := sorry

/-- (E3): under the same hypotheses with `I = J`, `P^I` acts trivially on `T_{V ⊗ W}(A)`. -/
theorem continuousTensorGeneratorExport.trivial_tensor (P : Subgroup F.WeilGroup)
    (V W : SatRep G Λ I) (A : Dlis (BunG G) Λ)
    (hV : ∀ w : I → F.WeilGroup, (∀ i, w i ∈ P) →
      (((weilHeckeAction.equivariant G Λ I).obj V).obj A).ρ w = 𝟙 _)
    (hW : ∀ w : I → F.WeilGroup, (∀ i, w i ∈ P) →
      (((weilHeckeAction.equivariant G Λ I).obj W).obj A).ρ w = 𝟙 _)
    (w : I → F.WeilGroup) (hw : ∀ i, w i ∈ P) :
    (((weilHeckeAction.equivariant G Λ I).obj (V ⊗ W)).obj A).ρ w = 𝟙 _ := sorry
-- (E4) is the monoidal structure `monoidalAndFiniteSetFunctoriality` with
-- `monoidalAndFiniteSetFunctoriality.restrictLegs`; (E5) is `dualLegs.adjunction` and
-- `dualLegs.adjunctionSwap`.
-- Omitted: in (E4), exactness and `Rep_Λ(Q^I)`-linearity of `V ↦ T_V(A)`.

end Export

end HS3HS4

/-! ## Omissions

A comment that begins `-- Omitted:` marks a clause of the packet that the declaration next to it
does not state, because the imported interfaces of this file cannot express it (bundles and
lattices over `B_dR`, the loci `Y_I(S)`, ∞-categorical coherences, colimits in stable
∞-categories, objects of roadmaps that have no stand-in here). Such a clause is left out and is
not replaced by a weaker hypothesis or by an opaque proposition; the declaration states the rest.
The roadmap document and the packet give the full statement of every node, API item and unit
test, and they govern wherever this file states less. -/

end TauCeti.HeckeShtukas

end
