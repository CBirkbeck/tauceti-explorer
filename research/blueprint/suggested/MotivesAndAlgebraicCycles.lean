/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivesAndAlgebraicCycles.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-MotivesAndAlgebraicCycles: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Rewritten in the independent review REV-MotivesAndAlgebraicCycles and elaborated against
Mathlib 082e2d3 with `lake env lean`: the only messages are `declaration uses 'sorry'`
warnings. Tau Ceti was not built in that session, so the file imports individual Mathlib
modules only. Where the roadmap builds on a pinned Tau Ceti declaration
(`TauCeti.FGComoduleCat`, `TauCeti.koszulSymmetricCategory`, `TauCeti.Tannaka.*`,
`TopPair.singularHomology`), the docstring names it, the declaration here has a real signature
and a `sorry` body, and the statements about it are made through Mathlib notions.

Objects another roadmap owns appear as parameters of a structure or as `variable`s,
never as invented definitions; each carries a docstring naming its owner:

* SchemeAndStackFoundations SF.5: integral Chow groups of smooth proper schemes with pushforward,
  Gysin pullback, the intersection product, the projection formula, flat base change, the degree
  and the exterior product, one field per Stacks tag (`ChowTheory`); Chern classes, locally free
  modules, projective bundles and the tangent sheaf (`ChernTheory`); change of base field
  (`ChowBaseChange`);
* SchemeAndStackFoundations SF.2 with EtaleDualityAndPerverseSheaves EDC.2 and EDC.3: `ℓ`-adic
  cohomology with its trace and cycle class map (`EtaleCohomologyData`); relative singular
  homology of complex points and relative de Rham cohomology of pairs over `ℚ`
  (`PairDiagram.PairHomology`, `PeriodData`); Betti, de Rham and `ℓ`-adic data with Galois
  actions for the conjectures of MC.7;
* SchemeAndStackFoundations SF.6 and ComplexComparisonPartII C4, C5: the comparison
  isomorphisms, the Hodge filtration and Chow's theorem (MC.6, MC.7);
* MotivicEtaleKTheory M.5a: the category `DM^{eff,-}_Nis(k, R)`, finite correspondences, the
  motive functors, the Tate object, the internal Hom and the cancellation theorem (`DMeffData`
  and the variables of MC.4); M.4: higher Chow groups (`HigherChowData`);
* SchemeAndStackFoundations SF.3 and SF.4, DeligneWeightsAndPurity DWP.9 and
  FaltingsFinitenessAndIsogenyTheorems R28.4: as parameters of the statements that use them.
  Resolution of singularities (SF.4) cannot be stated against Mathlib (it refers to blow-ups
  with smooth centres), so the statements of MC.4 made over a perfect field with resolution are
  made here over a field of characteristic zero, Hironaka's proved setting.

Written out here: correspondences of smooth proper schemes with their action, composition,
transpose and tensor product; adequate relations and numerical equivalence; the category of
pairs `(X, m)` and the Chow motives as its Karoubi envelope, with twists, duals (Mathlib's
`ExactPairing`, right rigid), Chow groups and the projective bundle formula; motives modulo an
adequate relation; graded vector spaces with the Koszul sign; Weil cohomology theories on
varieties, on schemes and by base change, with their axioms one `Prop` each, pushforward,
Künneth components and the realisation equivalence; semisimple and Tannakian categories,
categorical rank and Jannsen's theorem; geometric motives, the Tate stabilisation, Gysin,
blow-up and localisation triangles, motives with compact support and duality; Nori's diagrams
(with `ℤ/2`-graded multiplicative representations), diagram categories and Nori motives;
heaps (Mathlib's `Torsor` is a torsor under a given group) and affine heaps, comparison
algebras, formal periods and the period torsor; Conjectures C and D and the Hodge, Tate and
Lefschetz standard conjectures as predicates.
-/
import Mathlib.Algebra.Algebra.Hom.Rat
import Mathlib.Algebra.Category.AlgCat.Basic
import Mathlib.Algebra.Category.FGModuleCat.Abelian
import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.Algebra.Category.Grp.Basic
import Mathlib.Algebra.Category.ModuleCat.Adjunctions
import Mathlib.Algebra.Category.ModuleCat.Colimits
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Adjunction
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Basic
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.Colimit.Module
import Mathlib.Algebra.DirectSum.Decomposition
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.HomologicalComplex
import Mathlib.Algebra.Homology.HomotopyCategory.Pretriangulated
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.Algebra.Order.Group.Int
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Torsor.Defs
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.Geometrically.Irreducible
import Mathlib.AlgebraicGeometry.Group.Abelian
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.OpenImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Proper
import Mathlib.AlgebraicGeometry.ResidueField
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.CategoryTheory.EssentialImage
import Mathlib.CategoryTheory.Functor.OfSequence
import Mathlib.CategoryTheory.GradedObject.Monoidal
import Mathlib.CategoryTheory.GradedObject.Single
import Mathlib.CategoryTheory.Idempotents.Biproducts
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Limits.Shapes.Kernels
import Mathlib.CategoryTheory.Limits.Types.Colimits
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.CategoryTheory.Linear.LinearFunctor
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Discrete
import Mathlib.CategoryTheory.Monoidal.Linear
import Mathlib.CategoryTheory.Monoidal.NaturalTransformation
import Mathlib.CategoryTheory.Monoidal.Preadditive
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Braided
import Mathlib.CategoryTheory.Monoidal.Subcategory
import Mathlib.CategoryTheory.MorphismProperty.Composition
import Mathlib.CategoryTheory.Preadditive.Biproducts
import Mathlib.CategoryTheory.Preadditive.Mat
import Mathlib.CategoryTheory.Preadditive.Yoneda.Basic
import Mathlib.CategoryTheory.Retract
import Mathlib.CategoryTheory.Simple
import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.Sites.InducedTopology
import Mathlib.CategoryTheory.Sites.Over
import Mathlib.CategoryTheory.Subobject.ArtinianObject
import Mathlib.CategoryTheory.Subobject.NoetherianObject
import Mathlib.CategoryTheory.Triangulated.Functor
import Mathlib.CategoryTheory.Triangulated.Generators
import Mathlib.CategoryTheory.Triangulated.Opposite.Pretriangulated
import Mathlib.CategoryTheory.Triangulated.Subcategory
import Mathlib.Combinatorics.Quiver.Path
import Mathlib.Data.Int.Interval
import Mathlib.Data.List.TFAE
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.ZMod.Defs
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.PerfectPairing.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Order.Interval.Finset.Defs
import Mathlib.RepresentationTheory.FDRep
import Mathlib.RingTheory.Bialgebra.Basic
import Mathlib.RingTheory.Coalgebra.Basic
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.GradedAlgebra.Basic
import Mathlib.RingTheory.HopfAlgebra.Basic
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.Topology.Algebra.Module.ModuleTopology
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.Sets.Closeds

noncomputable section

namespace TauCeti.Motives

universe u v w

section MC0

open CategoryTheory AlgebraicGeometry Limits TensorProduct MonoidalCategory

/-! ## MC.0 Cycle correspondences and equivalence relations

### The index category

MC.0/correspondence-group, hypotheses: the pinned libraries have properness but no projective
morphisms, so the theory is indexed by the smooth proper schemes over `k`, which contain the smooth
projective ones; every statement of MC.0 and MC.1 holds for them unchanged. -/

variable (k : Type u) [Field k]

/-- The smooth proper schemes over `k` (the smooth projective schemes of the source, see the
hypotheses of MC.0/correspondence-group), as a full subcategory of the schemes over `Spec k`.
Neither equidimensionality nor connectedness is assumed. -/
abbrev SmProj : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun X : Over (Spec (CommRingCat.of k)) =>
    Smooth X.hom ∧ IsProper X.hom

namespace SmProj

variable {k}

/-- The underlying scheme of a smooth proper `k`-scheme. -/
abbrev toScheme (X : SmProj k) : Scheme.{u} := X.obj.left

variable (k) in
/-- `Spec k`, the unit of the tensor structures of MC.0 and MC.1. -/
def point : SmProj k := ⟨Over.mk (𝟙 _), sorry⟩

/-- The structure morphism `X ⟶ Spec k`. -/
def toPoint (X : SmProj k) : X ⟶ point k :=
  ObjectProperty.homMk (Over.homMk X.obj.hom)

/-- The product `X ×_k Y`. -/
def prod (X Y : SmProj k) : SmProj k :=
  ⟨Over.mk (pullback.fst X.obj.hom Y.obj.hom ≫ X.obj.hom), sorry⟩

/-- The first projection `X ×_k Y ⟶ X`. -/
def fst (X Y : SmProj k) : X.prod Y ⟶ X :=
  ObjectProperty.homMk (Over.homMk (pullback.fst X.obj.hom Y.obj.hom))

/-- The second projection `X ×_k Y ⟶ Y`. -/
def snd (X Y : SmProj k) : X.prod Y ⟶ Y :=
  ObjectProperty.homMk (Over.homMk (pullback.snd X.obj.hom Y.obj.hom) pullback.condition.symm)

/-- The morphism into a product with components `f` and `g`. -/
def lift {W X Y : SmProj k} (f : W ⟶ X) (g : W ⟶ Y) : W ⟶ X.prod Y :=
  ObjectProperty.homMk (Over.homMk (pullback.lift f.hom.left g.hom.left
    ((Over.w f.hom).trans (Over.w g.hom).symm))
    ((pullback.lift_fst_assoc _ _ _ _).trans (Over.w f.hom)))

/-- The product of two morphisms. -/
def prodMap {X Y X' Y' : SmProj k} (f : X ⟶ Y) (g : X' ⟶ Y') : X.prod X' ⟶ Y.prod Y' :=
  lift (fst X X' ≫ f) (snd X X' ≫ g)

/-- The diagonal `X ⟶ X ×_k X`. -/
def diag (X : SmProj k) : X ⟶ X.prod X := lift (𝟙 X) (𝟙 X)

/-- The switch of factors `X ×_k Y ⟶ Y ×_k X`. -/
def swap (X Y : SmProj k) : X.prod Y ⟶ Y.prod X := lift (snd X Y) (fst X Y)

/-- The graph morphism `(f, id) : Y ⟶ X ×_k Y` of `f : Y ⟶ X`. -/
def graph {X Y : SmProj k} (f : Y ⟶ X) : Y ⟶ X.prod Y := lift f (𝟙 Y)

/-- The disjoint union `X ⊔ Y`. -/
def coprod (X Y : SmProj k) : SmProj k :=
  ⟨Over.mk (Limits.coprod.desc X.obj.hom Y.obj.hom), sorry⟩

/-- The inclusion `X ⟶ X ⊔ Y`. -/
def inl (X Y : SmProj k) : X ⟶ X.coprod Y :=
  ObjectProperty.homMk (Over.homMk Limits.coprod.inl (Limits.coprod.inl_desc _ _))

/-- The inclusion `Y ⟶ X ⊔ Y`. -/
def inr (X Y : SmProj k) : Y ⟶ X.coprod Y :=
  ObjectProperty.homMk (Over.homMk Limits.coprod.inr (Limits.coprod.inr_desc _ _))

variable (k) in
/-- The empty scheme. -/
def empty : SmProj k := ⟨Over.mk (initial.to _), sorry⟩

/-- `X` is equidimensional of dimension `d`: its structure morphism is smooth of relative
dimension `d`. -/
abbrev IsEquidim (X : SmProj k) (d : ℕ) : Prop := SmoothOfRelativeDimension d X.obj.hom

/-- `X` is a variety in the sense of MC.2: geometrically irreducible over `k`. -/
abbrev IsVariety (X : SmProj k) : Prop := GeometricallyIrreducible X.obj.hom

/-- `X` is a curve: a geometrically irreducible smooth proper scheme of dimension one. -/
abbrev IsCurve (X : SmProj k) : Prop := X.IsVariety ∧ X.IsEquidim 1

/-- A `k`-rational point of `X`. -/
abbrev RatPoint (X : SmProj k) : Type u := point k ⟶ X

attribute [local instance] MvPolynomial.gradedAlgebra in
variable (k) in
/-- Projective space `ℙⁿ_k = Proj k[x₀, …, xₙ]`. -/
def projectiveSpace (n : ℕ) : SmProj k :=
  ⟨Over.mk (Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (n + 1)) k) ≫
    Spec.map (CommRingCat.ofHom (algebraMap k _))), sorry⟩

variable (k) in
/-- The projective line `ℙ¹_k`. -/
abbrev projectiveLine : SmProj k := projectiveSpace k 1

end SmProj

/-! ### Imported: what SchemeAndStackFoundations SF.5 owes this roadmap

Nothing in `ChowTheory` is planned by this roadmap: the reviewed audit of SF.5 records rational
equivalence, the intersection product, the projection formula and the degree of a zero cycle as
absent from both pinned libraries. Each field is one imported operation with its actual type, or
one imported identity with its actual statement, named by its Stacks tag. The Chow groups are the
integral ones; `ChowTheory.CHF` tensors them with a coefficient field here. -/

/-- SF.5: integral Chow groups of smooth proper `k`-schemes with their operations. -/
structure ChowTheory where
  /-- `CH(X)`: the group of cycles on `X` modulo rational equivalence (Stacks 02QR), made a
  commutative ring by the intersection product of the smooth scheme `X`, with unit the
  fundamental class `[X]`. The ring axioms are the associativity (Stacks 0FC1) and the
  commutativity of the intersection product. -/
  CH : SmProj k → Type u
  [commRing : ∀ X, CommRing (CH X)]
  /-- The grading by codimension, `CH^i(X)`, taken on each connected component; the
  intersection product is graded (Stacks 0FC1). -/
  codim : ∀ X, ℤ → AddSubgroup (CH X)
  [gradedRing : ∀ X, GradedRing (codim X)]
  /-- The grading by dimension, `CH_j(X)` (Stacks 02QR). -/
  dim : ∀ X, ℤ → AddSubgroup (CH X)
  [dimDecomposition : ∀ X, DirectSum.Decomposition (dim X)]
  /-- On an equidimensional `X` of dimension `d`, `CH_{d - i}(X) = CH^i(X)`. -/
  dim_eq_codim : ∀ (X : SmProj k) (d : ℕ), X.IsEquidim d → ∀ i : ℤ, dim X (d - i) = codim X i
  /-- The class of an algebraic cycle; every class is one (Stacks 02QR). -/
  cycleClass : ∀ X : SmProj k, AlgebraicCycle X.toScheme ℤ →+ CH X
  cycleClass_surjective : ∀ X, Function.Surjective (cycleClass X)
  /-- Proper pushforward, preserving dimension (Stacks 02R5). -/
  pushforward : ∀ {X Y : SmProj k}, (X ⟶ Y) → CH X →+ CH Y
  pushforward_dim : ∀ {X Y : SmProj k} (f : X ⟶ Y) (j : ℤ), (dim X j).map (pushforward f) ≤ dim Y j
  /-- Functoriality of proper pushforward (Stacks 02R5). -/
  pushforward_id : ∀ X, pushforward (𝟙 X) = AddMonoidHom.id _
  pushforward_comp : ∀ {X Y Z : SmProj k} (f : X ⟶ Y) (g : Y ⟶ Z),
    pushforward (f ≫ g) = (pushforward g).comp (pushforward f)
  /-- The Gysin pullback `f^!` along a morphism of smooth schemes, which is lci; for flat `f`
  it is flat pullback (Stacks 0FF4). It is a ring homomorphism, being compatible with the
  intersection product (Stacks 0FFB), and preserves codimension. -/
  pullback : ∀ {X Y : SmProj k}, (X ⟶ Y) → CH Y →+* CH X
  pullback_codim : ∀ {X Y : SmProj k} (f : X ⟶ Y) (i : ℤ),
    (codim Y i).map (pullback f).toAddMonoidHom ≤ codim X i
  /-- Functoriality of flat pullback and composition of Gysin maps (Stacks 02RG, 0FF5). -/
  pullback_id : ∀ X, pullback (𝟙 X) = RingHom.id _
  pullback_comp : ∀ {X Y Z : SmProj k} (f : X ⟶ Y) (g : Y ⟶ Z),
    pullback (f ≫ g) = (pullback f).comp (pullback g)
  /-- Flat pullback against proper pushforward in a fibre square (Stacks 02RG). -/
  flat_base_change : ∀ {X Y X' Y' : SmProj k} (f : X ⟶ Y) (g : Y' ⟶ Y) (f' : X' ⟶ Y')
    (g' : X' ⟶ X), IsPullback g'.hom.left f'.hom.left f.hom.left g.hom.left →
    Flat g.hom.left → ∀ a, pullback g (pushforward f a) = pushforward f' (pullback g' a)
  /-- The Gysin map of a transversal fibre square, the easy case (Stacks 0FF7): a cartesian
  square of equidimensional smooth schemes whose dimensions add up. -/
  transversal_base_change : ∀ {X Y X' Y' : SmProj k} (f : X ⟶ Y) (g : Y' ⟶ Y) (f' : X' ⟶ Y')
    (g' : X' ⟶ X) (dX dY dX' dY' : ℕ), X.IsEquidim dX → Y.IsEquidim dY → X'.IsEquidim dX' →
    Y'.IsEquidim dY' → dX' + dY = dX + dY' →
    IsPullback g'.hom.left f'.hom.left f.hom.left g.hom.left →
    ∀ a, pullback g (pushforward f a) = pushforward f' (pullback g' a)
  /-- The projection formula (Stacks 0FFC). -/
  projection_formula : ∀ {X Y : SmProj k} (f : X ⟶ Y) (a : CH X) (b : CH Y),
    pushforward f (pullback f b * a) = b * pushforward f a
  /-- The exterior product `α × β = pr₁^*α · pr₂^*β` is compatible with proper pushforward
  (Stacks 0FGU and the exterior products of SF.5). -/
  exterior_pushforward : ∀ {X Y X' Y' : SmProj k} (f : X ⟶ Y) (g : X' ⟶ Y') (a : CH X)
    (b : CH X'), pushforward (SmProj.prodMap f g)
      (pullback (SmProj.fst X X') a * pullback (SmProj.snd X X') b) =
      pullback (SmProj.fst Y Y') (pushforward f a) * pullback (SmProj.snd Y Y') (pushforward g b)
  /-- The degree of zero cycles on a proper scheme, extended by zero from `CH_0`. -/
  deg : ∀ X : SmProj k, CH X →+ ℤ
  deg_dim : ∀ (X : SmProj k) (j : ℤ), j ≠ 0 → ∀ a ∈ dim X j, deg X a = 0
  /-- The degree is compatible with proper pushforward. -/
  deg_pushforward : ∀ {X Y : SmProj k} (f : X ⟶ Y) (a : CH X), deg Y (pushforward f a) = deg X a
  /-- `CH(Spec k) = ℤ`, generated by `[Spec k]` of degree one. -/
  deg_point_bijective : Function.Bijective (deg (SmProj.point k))
  deg_point_one : deg (SmProj.point k) 1 = 1
  /-- The Chow group of a disjoint union is the direct sum (restriction to the two parts). -/
  coprod_bijective : ∀ X Y : SmProj k, Function.Bijective fun a : CH (X.coprod Y) =>
    (pullback (SmProj.inl X Y) a, pullback (SmProj.inr X Y) a)

attribute [instance] ChowTheory.commRing ChowTheory.gradedRing ChowTheory.dimDecomposition

namespace ChowTheory

variable {k} (C : ChowTheory k) (F : Type*) [Field F]

/-- `CH(X) ⊗ F`, the `F`-linear cycles modulo rational equivalence, a commutative
`F`-algebra. -/
abbrev CHF (X : SmProj k) : Type _ := F ⊗[ℤ] C.CH X

/-- `CH^i(X) ⊗ F`. -/
def codimF (X : SmProj k) (i : ℤ) : Submodule F (C.CHF F X) :=
  LinearMap.range ((AddSubgroup.toIntSubmodule (C.codim X i)).subtype.baseChange F)

/-- `CH_j(X) ⊗ F`. -/
def dimF (X : SmProj k) (j : ℤ) : Submodule F (C.CHF F X) :=
  LinearMap.range ((AddSubgroup.toIntSubmodule (C.dim X j)).subtype.baseChange F)

/-- Proper pushforward on `F`-linear classes. -/
def pushforwardF {X Y : SmProj k} (f : X ⟶ Y) : C.CHF F X →ₗ[F] C.CHF F Y :=
  (C.pushforward f).toIntLinearMap.baseChange F

/-- Gysin pullback on `F`-linear classes. -/
def pullbackF {X Y : SmProj k} (f : X ⟶ Y) : C.CHF F Y →ₐ[F] C.CHF F X :=
  Algebra.TensorProduct.map (AlgHom.id F F) (C.pullback f).toIntAlgHom

/-- The degree of `F`-linear zero cycles. -/
def degF (X : SmProj k) : C.CHF F X →ₗ[F] F :=
  (AlgebraTensorModule.rid ℤ F F).toLinearMap ∘ₗ (C.deg X).toIntLinearMap.baseChange F

/-- The class of a cycle in `CH(X) ⊗ F`. -/
def ofCH {X : SmProj k} (a : C.CH X) : C.CHF F X := 1 ⊗ₜ a

/-- The exterior product `α × β = pr₁^*α · pr₂^*β` on `X ×_k Y`. -/
def exterior {X Y : SmProj k} (a : C.CHF F X) (b : C.CHF F Y) : C.CHF F (X.prod Y) :=
  C.pullbackF F (SmProj.fst X Y) a * C.pullbackF F (SmProj.snd X Y) b

/-- The class `[Z]` of a morphism `g : Z ⟶ W`, that is `g_*[Z]`; for a closed immersion it is the
class of the image. -/
def classOf {Z W : SmProj k} (g : Z ⟶ W) : C.CHF F W := C.pushforwardF F g 1

end ChowTheory


namespace SmProj

variable {k}

/-- The projection `(X ×_k Y) ×_k Z ⟶ X ×_k Y`. -/
abbrev pr12 (X Y Z : SmProj k) : (X.prod Y).prod Z ⟶ X.prod Y := fst _ _

/-- The projection `(X ×_k Y) ×_k Z ⟶ Y ×_k Z`. -/
def pr23 (X Y Z : SmProj k) : (X.prod Y).prod Z ⟶ Y.prod Z :=
  lift (fst _ _ ≫ snd X Y) (snd _ _)

/-- The projection `(X ×_k Y) ×_k Z ⟶ X ×_k Z`. -/
def pr13 (X Y Z : SmProj k) : (X.prod Y).prod Z ⟶ X.prod Z :=
  lift (fst _ _ ≫ fst X Y) (snd _ _)

/-- The projection `(X ×_k X') ×_k (Y ×_k Y') ⟶ X ×_k Y`. -/
def prLeft (X X' Y Y' : SmProj k) : (X.prod X').prod (Y.prod Y') ⟶ X.prod Y :=
  lift (fst _ _ ≫ fst X X') (snd _ _ ≫ fst Y Y')

/-- The projection `(X ×_k X') ×_k (Y ×_k Y') ⟶ X' ×_k Y'`. -/
def prRight (X X' Y Y' : SmProj k) : (X.prod X').prod (Y.prod Y') ⟶ X'.prod Y' :=
  lift (fst _ _ ≫ snd X X') (snd _ _ ≫ snd Y Y')

end SmProj

namespace ChowTheory

variable {k} (C : ChowTheory k) (F : Type*) [Field F]

/-- The composite `c' ∘ c = pr₁₃,*(pr₁₂^*c · pr₂₃^*c')` of `F`-linear correspondences
(MC.0/correspondence-composition, before any grading). -/
def compF {X Y Z : SmProj k} (c' : C.CHF F (Y.prod Z)) (c : C.CHF F (X.prod Y)) :
    C.CHF F (X.prod Z) :=
  C.pushforwardF F (SmProj.pr13 X Y Z)
    (C.pullbackF F (SmProj.pr12 X Y Z) c * C.pullbackF F (SmProj.pr23 X Y Z) c')

/-- The action `c_*(α) = pr₂,*(c · pr₁^*α)` of an `F`-linear correspondence on cycles. -/
def pushforwardBy {X Y : SmProj k} (c : C.CHF F (X.prod Y)) : C.CHF F X →ₗ[F] C.CHF F Y :=
  C.pushforwardF F (SmProj.snd X Y) ∘ₗ LinearMap.mulLeft F c ∘ₗ
    (C.pullbackF F (SmProj.fst X Y)).toLinearMap

/-- The action `c^*(β) = pr₁,*(c · pr₂^*β)` of an `F`-linear correspondence on cycles. -/
def pullbackBy {X Y : SmProj k} (c : C.CHF F (X.prod Y)) : C.CHF F Y →ₗ[F] C.CHF F X :=
  C.pushforwardF F (SmProj.fst X Y) ∘ₗ LinearMap.mulLeft F c ∘ₗ
    (C.pullbackF F (SmProj.snd X Y)).toLinearMap

/-- The tensor product `pr_{XY}^*c · pr_{X'Y'}^*c'` of two `F`-linear correspondences. -/
def tensorF {X X' Y Y' : SmProj k} (c : C.CHF F (X.prod Y)) (c' : C.CHF F (X'.prod Y')) :
    C.CHF F ((X.prod X').prod (Y.prod Y')) :=
  C.pullbackF F (SmProj.prLeft X X' Y Y') c * C.pullbackF F (SmProj.prRight X X' Y Y') c'

/-- The fundamental class `[X_d]` of the union of the components of dimension `d`: the
dimension-`d` component of `[X] = 1`. -/
def fundamentalPart (X : SmProj k) (d : ℤ) : C.CH X :=
  (DirectSum.decompose (C.dim X) (1 : C.CH X) d : C.CH X)

end ChowTheory

variable {k} (C : ChowTheory k)

/-! ### Correspondences -/

/-- MC.0/correspondence-group with coefficients in a field `F`:
`⨁_d CH^{d+r}(X_d × Y) ⊗ F` inside `CH^*(X × Y) ⊗ F`, written as
`⨆_d pr₁^*[X_d] · (CH^{d+r}(X × Y) ⊗ F)`: restricting a class of codimension `d + r` to
`X_d × Y` is multiplying it by `pr₁^*[X_d]`. -/
def corrSubmoduleF (F : Type*) [Field F] (X Y : SmProj k) (r : ℤ) :
    Submodule F (C.CHF F (X.prod Y)) :=
  ⨆ d : ℕ, (C.codimF F (X.prod Y) (d + r)).map
    (LinearMap.mulLeft F (C.pullbackF F (SmProj.fst X Y) (C.ofCH F (C.fundamentalPart X d))))

/-- MC.0/correspondence-group: `Corr^r(X, Y) = ⨁_d CH^{d+r}(X_d × Y) ⊗ ℚ` inside
`CH^*(X × Y) ⊗ ℚ`. -/
abbrev corrSubmodule (X Y : SmProj k) (r : ℤ) : Submodule ℚ (C.CHF ℚ (X.prod Y)) :=
  corrSubmoduleF C ℚ X Y r

/-- MC.0/correspondence-group: the `ℚ`-vector space of correspondences of degree `r` from `X`
to `Y`. The shift by `d` makes the degree of a graph zero whatever the dimension of `X`. -/
def Corr (X Y : SmProj k) (r : ℤ) : Type u := corrSubmodule C X Y r

namespace Corr

variable {C}

/-- `Corr^r(X, Y)` is a `ℚ`-vector space, inherited from the Chow groups. -/
instance addCommGroup (X Y : SmProj k) (r : ℤ) : AddCommGroup (Corr C X Y r) :=
  inferInstanceAs (AddCommGroup (corrSubmodule C X Y r))

instance module (X Y : SmProj k) (r : ℤ) : Module ℚ (Corr C X Y r) :=
  inferInstanceAs (Module ℚ (corrSubmodule C X Y r))

variable (C) in
/-- The inclusion of `Corr^r(X, Y)` into `CH^*(X × Y) ⊗ ℚ`. -/
def toChow (X Y : SmProj k) (r : ℤ) : Corr C X Y r →ₗ[ℚ] C.CHF ℚ (X.prod Y) :=
  (corrSubmodule C X Y r).subtype

variable (C) in
/-- The correspondence given by a class known to have degree `r`. -/
def mk {X Y : SmProj k} {r : ℤ} (a : C.CHF ℚ (X.prod Y)) (h : a ∈ corrSubmodule C X Y r) :
    Corr C X Y r :=
  ⟨a, h⟩

variable (C) in
/-- Transport along an equality of degrees. -/
def cast {X Y : SmProj k} {r s : ℤ} (h : r = s) : Corr C X Y r ≃ₗ[ℚ] Corr C X Y s :=
  LinearEquiv.ofEq _ _ (h ▸ rfl)

variable (C) in
/-- `Corr.of_equidimensional`: for `X` equidimensional of dimension `d`,
`Corr^r(X, Y) = CH^{d+r}(X × Y) ⊗ ℚ`. -/
theorem of_equidimensional {X : SmProj k} (Y : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (r : ℤ) :
    corrSubmodule C X Y r = C.codimF ℚ (X.prod Y) (d + r) := by
  sorry

variable (C) in
/-- The identification `Corr^r(Spec k, Y) = CH^r(Y) ⊗ ℚ`, induced by `Spec k × Y = Y`. -/
def fromPointEquiv (Y : SmProj k) (r : ℤ) : Corr C (SmProj.point k) Y r ≃ₗ[ℚ] C.codimF ℚ Y r :=
  sorry

variable (C) in
/-- The identification `Corr^r(X, Spec k) = CH_{-r}(X) ⊗ ℚ`, induced by `X × Spec k = X`. -/
def toPointEquiv (X : SmProj k) (r : ℤ) : Corr C X (SmProj.point k) r ≃ₗ[ℚ] C.dimF ℚ X (-r) :=
  sorry

variable (C) in
/-- `Corr.of_point`: the two identifications with Chow groups are pushforward along the
projections `Spec k × Y ⟶ Y` and `X × Spec k ⟶ X`. -/
theorem of_point (X Y : SmProj k) (r : ℤ) :
    (∀ c : Corr C (SmProj.point k) Y r,
      (fromPointEquiv C Y r c : C.CHF ℚ Y) = C.pushforwardF ℚ (SmProj.snd _ Y) (toChow C _ _ _ c)) ∧
    ∀ c : Corr C X (SmProj.point k) r,
      (toPointEquiv C X r c : C.CHF ℚ X) = C.pushforwardF ℚ (SmProj.fst X _) (toChow C _ _ _ c) := by
  sorry

variable (C) in
/-- `Corr^r(X ⊔ X', Y) = Corr^r(X, Y) × Corr^r(X', Y)`, by restriction to the two parts. -/
def disjointUnion (X X' Y : SmProj k) (r : ℤ) :
    Corr C (X.coprod X') Y r ≃ₗ[ℚ] Corr C X Y r × Corr C X' Y r :=
  sorry

/-! ### MC.0/correspondence-action-on-cycles -/

/-- `c^*(β) = pr₁,*(c · pr₂^*β)`, from `CH_j(Y) ⊗ ℚ` to `CH_{j-r}(X) ⊗ ℚ`. -/
def pullback {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) : C.CHF ℚ Y →ₗ[ℚ] C.CHF ℚ X :=
  C.pullbackBy ℚ (toChow C X Y r c)

/-- `c_*(α) = pr₂,*(c · pr₁^*α)`, from `CH^i(X) ⊗ ℚ` to `CH^{i+r}(Y) ⊗ ℚ`. -/
def pushforward {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) : C.CHF ℚ X →ₗ[ℚ] C.CHF ℚ Y :=
  C.pushforwardBy ℚ (toChow C X Y r c)

/-- Both actions are additive in the correspondence (they are `ℚ`-linear in the cycle by
construction). -/
theorem pullback_linear {X Y : SmProj k} {r : ℤ} (c c' : Corr C X Y r) (q : ℚ) :
    (c + c').pullback = c.pullback + c'.pullback ∧ (q • c).pullback = q • c.pullback ∧
      (c + c').pushforward = c.pushforward + c'.pushforward ∧
      (q • c).pushforward = q • c.pushforward := by
  sorry

/-- The degree bookkeeping: `c_*` raises codimension by `r` and `c^*` lowers dimension by `r`. -/
theorem pushforward_degree {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) (i j : ℤ) :
    (C.codimF ℚ X i).map c.pushforward ≤ C.codimF ℚ Y (i + r) ∧
      (C.dimF ℚ Y j).map c.pullback ≤ C.dimF ℚ X (j - r) := by
  sorry

/-! ### MC.0/graph-correspondence -/

variable (C) in
/-- The class of the graph of `f : Y ⟶ X` has degree zero from `X` to `Y`. -/
theorem graph_degree {X Y : SmProj k} (f : Y ⟶ X) :
    C.classOf ℚ (SmProj.graph f) ∈ corrSubmodule C X Y 0 := by
  sorry

variable (C) in
/-- The correspondence of degree zero from `X` to `Y` attached to `f : Y ⟶ X`: the class of the
graph `(f, id) : Y ⟶ X × Y`. -/
def graph {X Y : SmProj k} (f : Y ⟶ X) : Corr C X Y 0 := mk C _ (graph_degree C f)

variable (C) in
/-- The class of the diagonal of `X`, of degree zero. -/
def diagonal (X : SmProj k) : Corr C X X 0 := mk C (C.classOf ℚ (SmProj.diag X)) sorry

/-- The graph of the identity is the diagonal. -/
theorem graph_id (X : SmProj k) : graph C (𝟙 X) = diagonal C X := by
  sorry

/-- `Corr.pullback_diagonal`: pullback and pushforward by the diagonal are the identity. -/
@[simp] theorem pullback_diagonal (X : SmProj k) :
    (diagonal C X).pullback = LinearMap.id ∧ (diagonal C X).pushforward = LinearMap.id := by
  sorry

/-! ### MC.0/correspondence-composition -/

variable (C) in
/-- The composite formula lands in degree `r + s`. -/
theorem comp_degree {X Y Z : SmProj k} {r s : ℤ} (c' : Corr C Y Z s) (c : Corr C X Y r) :
    C.compF ℚ (toChow C Y Z s c') (toChow C X Y r c) ∈ corrSubmodule C X Z (r + s) := by
  sorry

variable (C) in
/-- The composite `c' ∘ c = pr₁₃,*(pr₁₂^*c · pr₂₃^*c')` of `c ∈ Corr^r(X, Y)` and
`c' ∈ Corr^s(Y, Z)`, of degree `r + s`. -/
def comp {X Y Z : SmProj k} {r s : ℤ} (c' : Corr C Y Z s) (c : Corr C X Y r) :
    Corr C X Z (r + s) :=
  mk C _ (comp_degree C c' c)

/-- Composition is `ℚ`-bilinear. -/
theorem comp_bilinear {X Y Z : SmProj k} {r s : ℤ} (c'₁ c'₂ : Corr C Y Z s)
    (c₁ c₂ : Corr C X Y r) (q : ℚ) :
    comp C (c'₁ + c'₂) c₁ = comp C c'₁ c₁ + comp C c'₂ c₁ ∧
      comp C c'₁ (c₁ + c₂) = comp C c'₁ c₁ + comp C c'₁ c₂ ∧
      comp C (q • c'₁) c₁ = q • comp C c'₁ c₁ ∧ comp C c'₁ (q • c₁) = q • comp C c'₁ c₁ := by
  sorry

/-- The composite of the graphs of `f : Y ⟶ X` and `g : Z ⟶ Y` is the graph of `g ≫ f`: the
order is reversed. -/
theorem comp_graph {X Y Z : SmProj k} (f : Y ⟶ X) (g : Z ⟶ Y) :
    comp C (graph C g) (graph C f) = cast C (add_zero 0).symm (graph C (g ≫ f)) := by
  sorry

/-- MC.0/correspondence-functor, on morphisms: `Γ_{g ≫ f} = Γ_g ∘ Γ_f`. -/
theorem graph_comp {X Y Z : SmProj k} (f : Y ⟶ X) (g : Z ⟶ Y) :
    graph C (g ≫ f) = cast C (add_zero 0) (comp C (graph C g) (graph C f)) := by
  sorry

/-- MC.0/composition-associative: `c'' ∘ (c' ∘ c) = (c'' ∘ c') ∘ c` in
`Corr^{r+s+t}(X, W)`, the degrees identified by associativity of addition. -/
theorem comp_assoc {X Y Z W : SmProj k} {r s t : ℤ} (c : Corr C X Y r) (c' : Corr C Y Z s)
    (c'' : Corr C Z W t) :
    comp C c'' (comp C c' c) = cast C (add_assoc r s t).symm (comp C (comp C c'' c') c) := by
  sorry

/-- The diagonal is a unit for composition. -/
theorem diagonal_comp {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) :
    comp C (diagonal C Y) c = cast C (add_zero r).symm c ∧
      comp C c (diagonal C X) = cast C (zero_add r).symm c := by
  sorry

/-- MC.0/composition-compatible-with-action: `(c' ∘ c)^* = c^* ∘ c'^*` and
`(c' ∘ c)_* = c'_* ∘ c_*`. -/
theorem comp_action {X Y Z : SmProj k} {r s : ℤ} (c : Corr C X Y r) (c' : Corr C Y Z s) :
    (comp C c' c).pullback = c.pullback ∘ₗ c'.pullback ∧
      (comp C c' c).pushforward = c'.pushforward ∘ₗ c.pushforward := by
  sorry

/-- MC.0/correspondences-with-the-point: under `Corr^r(X, Spec k) = CH_{-r}(X) ⊗ ℚ`, pullback of
cycles by `c ∈ Corr^s(W, X)` is composition with `c`; under `Corr^r(Spec k, X) = CH^r(X) ⊗ ℚ`,
pushforward by `c ∈ Corr^s(X, W)` is composition with `c`. -/
theorem chow_iso_point {W X : SmProj k} {r s : ℤ} :
    (∀ (β : Corr C X (SmProj.point k) r) (c : Corr C W X s),
      (toPointEquiv C W (s + r) (comp C β c) : C.CHF ℚ W) =
        c.pullback (toPointEquiv C X r β)) ∧
    ∀ (α : Corr C (SmProj.point k) X r) (c : Corr C X W s),
      (fromPointEquiv C W (r + s) (comp C c α) : C.CHF ℚ W) =
        c.pushforward (fromPointEquiv C X r α) := by
  sorry

/-! ### MC.0/transpose-correspondence -/

variable (C) in
/-- The transpose `Corr^r(X, Y) ≃ Corr^{d-e+r}(Y, X)` for `X`, `Y` equidimensional of
dimensions `d` and `e`, induced by the switch `Y × X ≅ X × Y`. -/
def transpose {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d) (hY : Y.IsEquidim e) (r : ℤ) :
    Corr C X Y r ≃ₗ[ℚ] Corr C Y X (d - e + r) :=
  sorry

/-- The transpose is pullback along the switch of factors. -/
theorem transpose_apply {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d) (hY : Y.IsEquidim e)
    {r : ℤ} (c : Corr C X Y r) :
    toChow C _ _ _ (transpose C hX hY r c) = C.pullbackF ℚ (SmProj.swap Y X) (toChow C _ _ _ c) := by
  sorry

/-- The transpose of the graph of `f : Y ⟶ X` is the transposed graph, the class of
`(id, f) : Y ⟶ Y × X`. -/
@[simp] theorem transpose_graph {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d)
    (hY : Y.IsEquidim e) (f : Y ⟶ X) :
    toChow C _ _ _ (transpose C hX hY 0 (graph C f)) =
      C.classOf ℚ (SmProj.lift (𝟙 Y) f) := by
  sorry

/-- Transposing twice is the identity, the two degree shifts cancelling. -/
theorem transpose_transpose {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d)
    (hY : Y.IsEquidim e) {r : ℤ} (c : Corr C X Y r) :
    transpose C hY hX _ (transpose C hX hY r c) = cast C (by ring) c := by
  sorry

/-- The transpose of a composite is the composite of the transposes in the opposite order. -/
theorem transpose_comp {X Y Z : SmProj k} {dX dY dZ : ℕ} (hX : X.IsEquidim dX)
    (hY : Y.IsEquidim dY) (hZ : Z.IsEquidim dZ) {r s : ℤ} (c : Corr C X Y r)
    (c' : Corr C Y Z s) :
    transpose C hX hZ (r + s) (comp C c' c) =
      cast C (by ring) (comp C (transpose C hX hY r c) (transpose C hY hZ s c')) := by
  sorry

/-- MC.0/graph-acts-as-gysin-and-pushforward: pushforward by `Γ_f` is the Gysin map `f^*`,
pullback by `Γ_f` is proper pushforward `f_*`; for equidimensional `X`, `Y` the transposed graph
exchanges them. -/
theorem graph_action {X Y : SmProj k} (f : Y ⟶ X) :
    (graph C f).pushforward = (C.pullbackF ℚ f).toLinearMap ∧
      (graph C f).pullback = C.pushforwardF ℚ f ∧
      ∀ {d e : ℕ} (hX : X.IsEquidim d) (hY : Y.IsEquidim e),
        (transpose C hX hY 0 (graph C f)).pushforward = C.pushforwardF ℚ f ∧
          (transpose C hX hY 0 (graph C f)).pullback = (C.pullbackF ℚ f).toLinearMap := by
  sorry

/-! ### MC.0/tensor-of-correspondences -/

/-- The tensor product of objects, the product of schemes over `k`. -/
abbrev tensorObj (X X' : SmProj k) : SmProj k := X.prod X'

variable (C) in
/-- The tensor product of two correspondences lands in degree `r + r'`. -/
theorem tensor_degree {X X' Y Y' : SmProj k} {r r' : ℤ} (c : Corr C X Y r) (c' : Corr C X' Y' r') :
    C.tensorF ℚ (toChow C _ _ _ c) (toChow C _ _ _ c') ∈
      corrSubmodule C (tensorObj X X') (tensorObj Y Y') (r + r') := by
  sorry

variable (C) in
/-- The tensor product `pr_{XY}^*c · pr_{X'Y'}^*c'` of correspondences, of degree `r + r'`. -/
def tensorHom {X X' Y Y' : SmProj k} {r r' : ℤ} (c : Corr C X Y r) (c' : Corr C X' Y' r') :
    Corr C (tensorObj X X') (tensorObj Y Y') (r + r') :=
  mk C _ (tensor_degree C c c')

/-- The tensor product of two graphs is the graph of the product morphism. -/
theorem tensor_graph {X X' Y Y' : SmProj k} (f : Y ⟶ X) (f' : Y' ⟶ X') :
    tensorHom C (graph C f) (graph C f') = cast C (add_zero 0).symm (graph C (SmProj.prodMap f f')) := by
  sorry

/-- MC.0/tensor-interchange: `(d ⊗ d') ∘ (c ⊗ c') = (d ∘ c) ⊗ (d' ∘ c')`. -/
theorem tensor_comp {X Y Z X' Y' Z' : SmProj k} {r s r' s' : ℤ} (c : Corr C X Y r)
    (d : Corr C Y Z s) (c' : Corr C X' Y' r') (d' : Corr C Y' Z' s') :
    comp C (tensorHom C d d') (tensorHom C c c') =
      cast C (by ring) (tensorHom C (comp C d c) (comp C d' c')) := by
  sorry

/-- MC.0/tensor-interchange: the tensor product of the diagonals is the diagonal of the
product, and that of two transposed graphs is the transposed graph of the product. -/
theorem tensor_diagonal (X X' : SmProj k) :
    tensorHom C (diagonal C X) (diagonal C X') = cast C (add_zero 0).symm (diagonal C (X.prod X')) := by
  sorry

/-! ### MC.0/graph-against-diagonals -/

variable (C) in
/-- The fundamental class `[X] ∈ Corr^{-d}(X, Spec k) = CH_d(X) ⊗ ℚ` of an equidimensional `X`. -/
def fundamental {X : SmProj k} {d : ℕ} (_hX : X.IsEquidim d) : Corr C X (SmProj.point k) (-d) :=
  mk C 1 sorry

/-- MC.0/graph-against-diagonals: `[Y] ∘ η_Y ∘ (a ⊗ id_Y) = [X] ∘ η_X ∘ (id_X ⊗ aᵗ)`, both equal
to the class of `Γ_f` in `CH^d(X × Y) ⊗ ℚ = Corr^{-e}(X × Y, Spec k)`; here `a = [Γ_f]`, `η` is
the graph of the diagonal morphism and `[X]`, `[Y]` are the fundamental classes. -/
theorem graph_against_diagonals {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d)
    (hY : Y.IsEquidim e) (f : Y ⟶ X) :
    toChow C _ _ _ (comp C (comp C (fundamental C hY) (graph C (SmProj.diag Y)))
        (tensorHom C (graph C f) (diagonal C Y))) =
      toChow C _ _ _ (comp C (comp C (fundamental C hX) (graph C (SmProj.diag X)))
        (tensorHom C (diagonal C X) (transpose C hX hY 0 (graph C f)))) ∧
    toChow C _ _ _ (comp C (comp C (fundamental C hY) (graph C (SmProj.diag Y)))
        (tensorHom C (graph C f) (diagonal C Y))) =
      C.pullbackF ℚ (SmProj.fst _ _) (C.classOf ℚ (SmProj.graph f)) := by
  sorry

end Corr

/-! ### Unit tests of MC.0/correspondence-group, action, composition and graphs -/

section Tests

variable {C}

/-- Unit test `point_to_point`: `Corr^0(Spec k, Spec k) = ℚ` and `Corr^r(Spec k, Spec k) = 0` for
`r ≠ 0`. -/
example : Nonempty (Corr C (SmProj.point k) (SmProj.point k) 0 ≃ₗ[ℚ] ℚ) ∧
    ∀ r : ℤ, r ≠ 0 → Subsingleton (Corr C (SmProj.point k) (SmProj.point k) r) := by
  sorry

/-- Unit test `graph_has_degree_zero`: for `f : Y ⟶ X` with `X` equidimensional of dimension
`d`, the graph has codimension `d`, hence degree zero, whatever `d` is. -/
example {X Y : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (f : Y ⟶ X) :
    C.classOf ℚ (SmProj.graph f) ∈ C.codimF ℚ (X.prod Y) d ∧
      C.classOf ℚ (SmProj.graph f) ∈ corrSubmodule C X Y 0 := by
  sorry

/-- Unit test `projective_line_degree_zero`: `Corr^0(ℙ¹, ℙ¹) = CH^1(ℙ¹ × ℙ¹) ⊗ ℚ`, of dimension
two. -/
example : corrSubmodule C (SmProj.projectiveLine k) (SmProj.projectiveLine k) 0 =
      C.codimF ℚ ((SmProj.projectiveLine k).prod (SmProj.projectiveLine k)) 1 ∧
    Module.finrank ℚ (Corr C (SmProj.projectiveLine k) (SmProj.projectiveLine k) 0) = 2 := by
  sorry

/-- Unit test `point_of_a_surface`: for a surface `X` and a rational point `x`, the graph of
`x : Spec k ⟶ X` lies in `Corr^0(X, Spec k) = CH^2(X) ⊗ ℚ` and not in codimension zero. -/
example {X : SmProj k} (hX : X.IsEquidim 2) (x : X.RatPoint) :
    Corr.toChow C _ _ _ (Corr.graph C x) ∈ C.codimF ℚ (X.prod (SmProj.point k)) 2 ∧
      Corr.toChow C _ _ _ (Corr.graph C x) ∉ C.codimF ℚ (X.prod (SmProj.point k)) 0 := by
  sorry

/-- Unit test `diagonal_acts_trivially`: pullback and pushforward by `[Δ_X]` are the identity. -/
example (X : SmProj k) :
    (Corr.diagonal C X).pullback = LinearMap.id ∧ (Corr.diagonal C X).pushforward = LinearMap.id :=
  Corr.pullback_diagonal X

/-- The correspondence `[x × X] ∈ Corr^0(X, X)` for a rational point `x`. -/
def Corr.pointTimes {X : SmProj k} (x : X.RatPoint) : Corr C X X 0 :=
  Corr.mk C (C.classOf ℚ (SmProj.lift (X.toPoint ≫ x) (𝟙 X))) sorry

/-- The correspondence `[X × x] ∈ Corr^0(X, X)` for a rational point `x`. -/
def Corr.timesPoint {X : SmProj k} (x : X.RatPoint) : Corr C X X 0 :=
  Corr.mk C (C.classOf ℚ (SmProj.lift (𝟙 X) (X.toPoint ≫ x))) sorry

/-- Unit test `point_times_line_on_P1`: for `c = [x × ℙ¹]`, `c_*` fixes `[ℙ¹]` and kills the
class of a point, `c^*` kills `[ℙ¹]` and fixes the class of a point. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    (Corr.pointTimes (C := C) x).pushforward 1 = 1 ∧
      (Corr.pointTimes (C := C) x).pushforward (C.classOf ℚ x) = 0 ∧
      (Corr.pointTimes (C := C) x).pullback 1 = 0 ∧
      (Corr.pointTimes (C := C) x).pullback (C.classOf ℚ x) = C.classOf ℚ x := by
  sorry

/-- Unit test `zero_and_diagonal`: the zero correspondence acts by zero; the diagonal of a
nonempty `X` is nonzero and acts by the identity. -/
example (X : SmProj k) [Nonempty X.toScheme] :
    (0 : Corr C X X 0).pullback = 0 ∧ (0 : Corr C X X 0).pushforward = 0 ∧
      Corr.diagonal C X ≠ 0 ∧ (Corr.diagonal C X).pullback = LinearMap.id ∧
      (Corr.diagonal C X).pushforward = LinearMap.id := by
  sorry

/-- Unit test `degree_adds`: a correspondence of degree one composed with one of degree minus
one has degree zero. -/
example {X Y Z : SmProj k} (c : Corr C X Y 1) (c' : Corr C Y Z (-1)) :
    Corr.toChow C _ _ _ (Corr.comp C c' c) ∈ corrSubmodule C X Z 0 := by
  sorry

/-- Unit test `projective_line_projectors`: on `ℙ¹` the classes `[x × ℙ¹]` and `[ℙ¹ × x]`
compose to zero in the mixed orders and to themselves in the pure ones. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    Corr.comp C (Corr.pointTimes (C := C) x) (Corr.timesPoint x) = 0 ∧
      Corr.comp C (Corr.timesPoint (C := C) x) (Corr.pointTimes x) = 0 ∧
      Corr.comp C (Corr.pointTimes (C := C) x) (Corr.pointTimes x) =
        Corr.cast C (add_zero 0).symm (Corr.pointTimes x) ∧
      Corr.comp C (Corr.timesPoint (C := C) x) (Corr.timesPoint x) =
        Corr.cast C (add_zero 0).symm (Corr.timesPoint x) := by
  sorry

/-- Unit test `diagonal_is_a_unit`: composing with `[Δ]` on either side is the identity. -/
example {X Y : SmProj k} {r : ℤ} (c : Corr C X Y r) :
    Corr.comp C (Corr.diagonal C Y) c = Corr.cast C (add_zero r).symm c ∧
      Corr.comp C c (Corr.diagonal C X) = Corr.cast C (zero_add r).symm c :=
  Corr.diagonal_comp c

/-- Unit test `graph_of_identity`: the graph of the identity is the diagonal, the unit for
composition. -/
example {X Y : SmProj k} (c : Corr C X Y 0) :
    Corr.graph C (𝟙 X) = Corr.diagonal C X ∧
      Corr.comp C c (Corr.graph C (𝟙 X)) = Corr.cast C (zero_add 0).symm c := by
  sorry

/-- Unit test `graph_of_a_rational_point`: for `x : Spec k ⟶ X` on `X` of dimension `d`, the
graph of `x` is `[x] ∈ Corr^0(X, Spec k) = CH_0(X) ⊗ ℚ`, of codimension `d`; composed with the
graph of `X ⟶ Spec k` (which is `[X]`) it gives `[x × X]`, and in the other order the identity
of `Spec k`. -/
example {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (x : X.RatPoint) :
    Corr.toChow C _ _ _ (Corr.graph C x) ∈ C.codimF ℚ (X.prod (SmProj.point k)) d ∧
      Corr.comp C (Corr.graph C X.toPoint) (Corr.graph C x) =
        Corr.cast C (add_zero 0).symm (Corr.pointTimes x) ∧
      Corr.comp C (Corr.graph C x) (Corr.graph C X.toPoint) =
        Corr.cast C (add_zero 0).symm (Corr.diagonal C (SmProj.point k)) := by
  sorry

/-- Unit test `contravariance`: `Γ_{g ≫ f} = Γ_g ∘ Γ_f`, the order reversed; a covariant
convention fails this. -/
example {X Y Z : SmProj k} (f : Y ⟶ X) (g : Z ⟶ Y) :
    Corr.graph C (g ≫ f) = Corr.cast C (add_zero 0) (Corr.comp C (Corr.graph C g) (Corr.graph C f)) :=
  Corr.graph_comp f g

end Tests

/-! ### MC.0/category-of-correspondences -/

/-- The graded category of correspondences, with its grading forgotten: the objects are the
smooth proper `k`-schemes, the morphisms `X ⟶ Y` all of `CH^*(X × Y) ⊗ ℚ = ⨁_r Corr^r(X, Y)`
(`CorrCat.hom_isInternal`), composition `pr₁₃,*(pr₁₂^* · pr₂₃^*)` and identities the diagonals.
The morphisms of degree `r` are `Corr^r`. -/
structure CorrCat (C : ChowTheory k) where
  /-- The underlying smooth proper scheme. -/
  obj : SmProj k

namespace CorrCat

instance category : Category (CorrCat C) where
  Hom X Y := C.CHF ℚ (X.obj.prod Y.obj)
  id X := C.classOf ℚ (SmProj.diag X.obj)
  comp f g := C.compF ℚ g f
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The identity of `X` is the class of the diagonal. -/
theorem id_eq_diagonal (X : CorrCat C) :
    (𝟙 X : C.CHF ℚ (X.obj.prod X.obj)) = C.classOf ℚ (SmProj.diag X.obj) :=
  rfl

/-- The morphism spaces are the direct sums of the correspondence groups: the grading. -/
theorem hom_isInternal (X Y : CorrCat C) :
    DirectSum.IsInternal fun r : ℤ => corrSubmodule C X.obj Y.obj r := by
  sorry

instance preadditive : Preadditive (CorrCat C) where
  homGroup X Y := inferInstanceAs (AddCommGroup (C.CHF ℚ (X.obj.prod Y.obj)))
  add_comp := sorry
  comp_add := sorry

/-- Each morphism space is a `ℚ`-vector space and composition is `ℚ`-bilinear. -/
instance linear : Linear ℚ (CorrCat C) where
  homModule X Y := inferInstanceAs (Module ℚ (C.CHF ℚ (X.obj.prod Y.obj)))
  smul_comp := sorry
  comp_smul := sorry

/-- The morphisms of degree zero: a wide subcategory, the degree zero category of
correspondences. -/
def degree_zero_subcategory (C : ChowTheory k) : MorphismProperty (CorrCat C) :=
  fun X Y f => f ∈ corrSubmodule C X.obj Y.obj 0

instance : (degree_zero_subcategory C).IsMultiplicative := sorry

end CorrCat

/-- The degree zero category of correspondences as an ordinary `ℚ`-linear category: the same
objects, `Hom(X, Y) = Corr^0(X, Y)`. The motive functor of MC.1 factors through it. -/
structure CorrZero (C : ChowTheory k) where
  /-- The underlying smooth proper scheme. -/
  obj : SmProj k

namespace CorrZero

instance category : Category (CorrZero C) where
  Hom X Y := Corr C X.obj Y.obj 0
  id X := Corr.diagonal C X.obj
  comp f g := Corr.cast C (add_zero 0) (Corr.comp C g f)
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

instance preadditive : Preadditive (CorrZero C) where
  homGroup X Y := inferInstanceAs (AddCommGroup (Corr C X.obj Y.obj 0))
  add_comp := sorry
  comp_add := sorry

instance linear : Linear ℚ (CorrZero C) where
  homModule X Y := inferInstanceAs (Module ℚ (Corr C X.obj Y.obj 0))
  smul_comp := sorry
  comp_smul := sorry

/-- The inclusion of the degree zero category into the graded category, faithful and with
image the wide subcategory `CorrCat.degree_zero_subcategory`. -/
def toCorrCat (C : ChowTheory k) : CorrZero C ⥤ CorrCat C where
  obj X := ⟨X.obj⟩
  map f := Corr.toChow C _ _ _ f
  map_id := sorry
  map_comp := sorry

instance : (toCorrCat C).Faithful := sorry

/-- MC.0/correspondence-functor: the contravariant functor from smooth proper schemes, the
identity on objects and `f ↦ Γ_f` on morphisms. -/
def ofScheme (C : ChowTheory k) : (SmProj k)ᵒᵖ ⥤ CorrZero C where
  obj X := ⟨X.unop⟩
  map f := Corr.graph C f.unop
  map_id := sorry
  map_comp := sorry

/-- MC.0/correspondence-functor: `ofScheme` sends `f : Y ⟶ X` to the class of its graph. -/
theorem ofScheme_map {X Y : SmProj k} (f : Y ⟶ X) :
    (ofScheme C).map f.op = Corr.graph C f :=
  rfl

/-- The tensor structure of MC.0/tensor-of-correspondences on the degree zero category, with
the product of schemes, unit `Spec k`, and constraints the graphs of the canonical isomorphisms
of products. -/
instance monoidalCategory : MonoidalCategory (CorrZero C) where
  tensorObj X Y := ⟨Corr.tensorObj X.obj Y.obj⟩
  whiskerLeft X _ _ f := Corr.cast C (zero_add 0) (Corr.tensorHom C (Corr.diagonal C X.obj) f)
  whiskerRight f Y := Corr.cast C (add_zero 0) (Corr.tensorHom C f (Corr.diagonal C Y.obj))
  tensorHom f g := Corr.cast C (add_zero 0) (Corr.tensorHom C f g)
  tensorUnit := ⟨SmProj.point k⟩
  associator X Y Z := sorry
  leftUnitor X := sorry
  rightUnitor X := sorry
  tensorHom_def := sorry
  id_tensorHom_id := sorry
  tensorHom_comp_tensorHom := sorry
  id_whiskerRight := sorry
  whiskerLeft_id := sorry
  associator_naturality := sorry
  leftUnitor_naturality := sorry
  rightUnitor_naturality := sorry
  pentagon := sorry
  triangle := sorry

end CorrZero

namespace Corr

/-- `Corr.tensorUnit`: the unit object is `Spec k`. -/
theorem tensorUnit : (𝟙_ (CorrZero C)).obj = SmProj.point k :=
  rfl

/-- `Corr.symmetric`: the graph of the switch of factors is a symmetry. -/
instance symmetric : SymmetricCategory (CorrZero C) := sorry

/-- The braiding is the graph of the switch of factors. -/
theorem braiding_eq (X Y : CorrZero C) :
    (β_ X Y).hom = Corr.graph C (SmProj.swap Y.obj X.obj) := by
  sorry

instance monoidalPreadditive : MonoidalPreadditive (CorrZero C) := sorry

/-- `Corr.tensor_bilinear`: the tensor product of correspondences is `ℚ`-bilinear. -/
instance tensor_bilinear : MonoidalLinear ℚ (CorrZero C) := sorry

end Corr

/-! ### MC.0/correspondences-of-disjoint-union -/

namespace Corr

/-- The bicone exhibiting `X' ⊔ X''` as a biproduct in the degree zero category: projections the
graphs of the inclusions, injections the diagonals of `X'` and `X''` viewed in `X' × X`,
`X'' × X`. -/
def disjointUnionBicone (X' X'' : SmProj k) :
    Limits.BinaryBicone (C := CorrZero C) ⟨X'⟩ ⟨X''⟩ where
  pt := ⟨X'.coprod X''⟩
  fst := graph C (SmProj.inl X' X'')
  snd := graph C (SmProj.inr X' X'')
  inl := mk C (C.classOf ℚ (SmProj.lift (𝟙 X') (SmProj.inl X' X''))) sorry
  inr := mk C (C.classOf ℚ (SmProj.lift (𝟙 X'') (SmProj.inr X' X''))) sorry
  inl_fst := sorry
  inl_snd := sorry
  inr_fst := sorry
  inr_snd := sorry

/-- MC.0/correspondences-of-disjoint-union: restriction identifies `Corr^r(X' ⊔ X'', Y' ⊔ Y'')`
with the four blocks, composition becoming matrix multiplication; `X' ⊔ X''` is a biproduct in
the degree zero category and the empty scheme is a zero object. -/
theorem biprod_disjointUnion (X' X'' : SmProj k) :
    Nonempty (disjointUnionBicone C X' X'').IsBilimit ∧
      Limits.IsZero (⟨SmProj.empty k⟩ : CorrZero C) := by
  sorry

/-- `CorrCat.biproduct`: the degree zero category is additive. -/
instance _root_.TauCeti.Motives.CorrCat.biproduct : Limits.HasFiniteBiproducts (CorrZero C) :=
  sorry

end Corr

/-! ### MC.0/projective-line-idempotents and MC.0/pointed-curve-idempotents -/

/-- MC.0/projective-line-idempotents: for a rational point `x` of `ℙ¹`, `c₀ = [x × ℙ¹]` and
`c₂ = [ℙ¹ × x]` are orthogonal idempotents of `End(ℙ¹)` in the degree zero category with
`[Δ] = c₀ + c₂`, and `End(ℙ¹) ≅ ℚ × ℚ` with `c₀ ↦ (1, 0)`, `c₂ ↦ (0, 1)`. -/
theorem Corr.projectiveLine_idempotents (x : (SmProj.projectiveLine k).RatPoint) :
    let c₀ : (⟨SmProj.projectiveLine k⟩ : CorrZero C) ⟶ ⟨SmProj.projectiveLine k⟩ :=
      Corr.pointTimes x
    let c₂ : (⟨SmProj.projectiveLine k⟩ : CorrZero C) ⟶ ⟨SmProj.projectiveLine k⟩ :=
      Corr.timesPoint x
    𝟙 _ = c₀ + c₂ ∧ c₀ ≫ c₀ = c₀ ∧ c₂ ≫ c₂ = c₂ ∧ c₀ ≫ c₂ = 0 ∧ c₂ ≫ c₀ = 0 ∧
      ∃ e : End (⟨SmProj.projectiveLine k⟩ : CorrZero C) ≃ₐ[ℚ] ℚ × ℚ,
        e c₀ = (1, 0) ∧ e c₂ = (0, 1) := by
  sorry

/-- MC.0/pointed-curve-idempotents: on a geometrically irreducible curve with a rational point
`e`, `p₀ = [e × X]`, `p₂ = [X × e]` and `p₁ = [Δ] - p₀ - p₂` are orthogonal idempotents summing
to `[Δ]`. -/
theorem Corr.pointedCurve_idempotents {X : SmProj k} (hX : X.IsCurve) (e : X.RatPoint) :
    let p₀ : (⟨X⟩ : CorrZero C) ⟶ ⟨X⟩ := Corr.pointTimes e
    let p₂ : (⟨X⟩ : CorrZero C) ⟶ ⟨X⟩ := Corr.timesPoint e
    let p₁ : (⟨X⟩ : CorrZero C) ⟶ ⟨X⟩ := 𝟙 _ - p₀ - p₂
    p₀ ≫ p₀ = p₀ ∧ p₁ ≫ p₁ = p₁ ∧ p₂ ≫ p₂ = p₂ ∧ p₀ ≫ p₁ = 0 ∧ p₁ ≫ p₀ = 0 ∧
      p₀ ≫ p₂ = 0 ∧ p₂ ≫ p₀ = 0 ∧ p₁ ≫ p₂ = 0 ∧ p₂ ≫ p₁ = 0 ∧ p₀ + p₁ + p₂ = 𝟙 _ := by
  sorry

/-! ### Unit tests of MC.0/category-of-correspondences, transpose and tensor product -/

section Tests

variable {C}

/-- Unit test `diagonal_is_identity`: the diagonal composed with any correspondence on either
side returns it. -/
example {X Y : CorrCat C} (f : X ⟶ Y) :
    (C.classOf ℚ (SmProj.diag X.obj) : X ⟶ X) ≫ f = f ∧
      f ≫ (C.classOf ℚ (SmProj.diag Y.obj) : Y ⟶ Y) = f := by
  sorry

/-- Unit test `endomorphisms_of_the_point`: the degree zero endomorphisms of `Spec k` form `ℚ`. -/
example : Nonempty (End (⟨SmProj.point k⟩ : CorrZero C) ≃ₐ[ℚ] ℚ) := by
  sorry

/-- Unit test `endomorphisms_of_the_line`: the degree zero endomorphisms of `ℙ¹` form `ℚ × ℚ`, the
two orthogonal projectors being the idempotents `(1, 0)` and `(0, 1)`. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    ∃ e : End (⟨SmProj.projectiveLine k⟩ : CorrZero C) ≃ₐ[ℚ] ℚ × ℚ,
      e (Corr.pointTimes x) = (1, 0) ∧ e (Corr.timesPoint x) = (0, 1) := by
  sorry

/-- Unit test `transpose_of_the_diagonal`: the transpose of `[Δ_X]` is `[Δ_X]`. -/
example {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) :
    Corr.transpose C hX hX 0 (Corr.diagonal C X) = Corr.cast C (by ring) (Corr.diagonal C X) := by
  sorry

/-- Unit test `degree_shift_is_real`: for a surface `X` and a curve `Y`, the transpose of a
degree zero correspondence has degree one. -/
example {X Y : SmProj k} (hX : X.IsEquidim 2) (hY : Y.IsEquidim 1) (c : Corr C X Y 0) :
    Corr.toChow C _ _ _ (Corr.transpose C hX hY 0 c) ∈ corrSubmodule C Y X 1 := by
  sorry

/-- Unit test `transpose_involution`: transposing twice returns the correspondence. -/
example {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d) (hY : Y.IsEquidim e) {r : ℤ}
    (c : Corr C X Y r) :
    Corr.transpose C hY hX _ (Corr.transpose C hX hY r c) = Corr.cast C (by ring) c :=
  Corr.transpose_transpose hX hY c

/-- Unit test `unit_law`: tensoring with `Spec k` is isomorphic to the identity functor. -/
example : Nonempty (tensorLeft (𝟙_ (CorrZero C)) ≅ 𝟭 (CorrZero C)) := by
  sorry

/-- Unit test `tensor_of_graphs`: `Γ_f ⊗ Γ_g = Γ_{f × g}`. -/
example {X X' Y Y' : SmProj k} (f : Y ⟶ X) (g : Y' ⟶ X') :
    Corr.tensorHom C (Corr.graph C f) (Corr.graph C g) =
      Corr.cast C (add_zero 0).symm (Corr.graph C (SmProj.prodMap f g)) :=
  Corr.tensor_graph f g

/-- Unit test `degree_adds_under_tensor`: a correspondence of degree one tensored with one of
degree zero has degree one. -/
example {X X' Y Y' : SmProj k} (c : Corr C X Y 1) (c' : Corr C X' Y' 0) :
    Corr.toChow C _ _ _ (Corr.tensorHom C c c') ∈ corrSubmodule C (X.prod X') (Y.prod Y') 1 := by
  sorry

end Tests

/-! ### MC.0/adequate-equivalence-relation -/

variable (F : Type*) [Field F] [CharZero F]

/-- MC.0/adequate-equivalence-relation: an adequate family `I`, recorded by the classes it
identifies with zero: graded `F`-subspaces `I(X) ⊆ CH^*(X) ⊗ F`, stable under pullback (a),
pushforward (b) and products with arbitrary classes (c). -/
structure Adequate (C : ChowTheory k) (F : Type*) [Field F] [CharZero F] where
  /-- The classes identified with zero. -/
  I : ∀ X : SmProj k, Submodule F (C.CHF F X)
  /-- `I(X)` is graded: spanned by its classes of pure codimension. -/
  graded : ∀ X, I X = ⨆ i, I X ⊓ C.codimF F X i
  /-- (a) `f^*(I(X)) ⊆ I(Y)` for `f : Y ⟶ X`. -/
  pullback_le : ∀ {X Y : SmProj k} (f : Y ⟶ X), (I X).map (C.pullbackF F f).toLinearMap ≤ I Y
  /-- (b) `f_*(I(Y)) ⊆ I(X)` for `f : Y ⟶ X`. -/
  pushforward_le : ∀ {X Y : SmProj k} (f : Y ⟶ X), (I Y).map (C.pushforwardF F f) ≤ I X
  /-- (c) `α · β ∈ I(X)` for `α ∈ I(X)` and any `β`. -/
  mul_mem : ∀ (X : SmProj k) (a b : C.CHF F X), a ∈ I X → a * b ∈ I X

namespace Adequate

variable {C F}

/-- `I(X)` as an ideal of the `F`-linear Chow ring. -/
def toIdeal (A : Adequate C F) (X : SmProj k) : Ideal (C.CHF F X) where
  carrier := A.I X
  add_mem' := (A.I X).add_mem
  zero_mem' := (A.I X).zero_mem
  smul_mem' b a ha := by rw [smul_eq_mul, mul_comm]; exact A.mul_mem X a b ha

/-- `A^j(X, F) = (CH^j(X) ⊗ F) / I^j(X)`, an `F`-vector space. -/
abbrev quotient (A : Adequate C F) (X : SmProj k) (j : ℤ) : Type _ :=
  C.codimF F X j ⧸ (A.I X).comap (C.codimF F X j).subtype

/-- An adequate family is stable under exterior products and under the action `c_*` of any
correspondence. -/
theorem mem_exterior (A : Adequate C F) {X Y : SmProj k} (a : C.CHF F X) (ha : a ∈ A.I X) :
    (∀ b : C.CHF F Y, C.exterior F a b ∈ A.I (X.prod Y)) ∧
      ∀ c : C.CHF F (X.prod Y), C.pushforwardBy F c a ∈ A.I Y := by
  sorry

/-- Composition and tensor product of correspondences descend modulo `I`: composing with a
correspondence in `I` on either side, or tensoring with one, gives a correspondence in `I`. -/
theorem comp (A : Adequate C F) {X Y Z X' Y' : SmProj k} :
    (∀ (c : C.CHF F (X.prod Y)) (c' : C.CHF F (Y.prod Z)),
      c ∈ A.I (X.prod Y) ∨ c' ∈ A.I (Y.prod Z) → C.compF F c' c ∈ A.I (X.prod Z)) ∧
    ∀ (c : C.CHF F (X.prod Y)) (c' : C.CHF F (X'.prod Y')),
      c ∈ A.I (X.prod Y) → C.tensorF F c c' ∈ A.I ((X.prod X').prod (Y.prod Y')) := by
  sorry

variable (C F) in
/-- Rational equivalence, `I = 0`, the least adequate family. -/
def rat : Adequate C F where
  I _ := ⊥
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

variable (C F) in
/-- The trivial relation, `I = everything`, the greatest adequate family. -/
def trivial : Adequate C F where
  I _ := ⊤
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

/-- `A` is finer than `B`: `A(X) ⊆ B(X)` for every `X`. -/
def le (A B : Adequate C F) : Prop := ∀ X, A.I X ≤ B.I X

instance : LE (Adequate C F) := ⟨le⟩

/-- The sum of two adequate families. -/
def sup (A B : Adequate C F) : Adequate C F where
  I X := A.I X ⊔ B.I X
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

/-- The intersection of two adequate families. -/
def inf (A B : Adequate C F) : Adequate C F where
  I X := A.I X ⊓ B.I X
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

/-- Rational equivalence is the finest adequate relation and the trivial one the coarsest. -/
theorem rat_le_le_trivial (A : Adequate C F) : rat C F ≤ A ∧ A ≤ trivial C F := by
  sorry

end Adequate

/-! ### MC.0/numerical-equivalence -/

variable {C F} in
/-- The degree pairing `CH^j(X) ⊗ F × CH_j(X) ⊗ F → F`, `(α, β) ↦ deg(α · β)`. -/
def NumEquiv.pairing (X : SmProj k) (j : ℤ) : C.codimF F X j →ₗ[F] C.dimF F X j →ₗ[F] F :=
  LinearMap.mk₂ F (fun a b => C.degF F X ((a : C.CHF F X) * b)) sorry sorry sorry sorry

/-- MC.0/numerical-equivalence: the numerically trivial classes, spanned by the classes `α` of
codimension `j` with `deg(α · β) = 0` for every `β` of dimension `j`. -/
def NumEquiv (X : SmProj k) : Submodule F (C.CHF F X) :=
  ⨆ j : ℤ, (LinearMap.ker (NumEquiv.pairing X j)).map (C.codimF F X j).subtype

namespace NumEquiv

/-- The numerically trivial classes form an adequate family: they are stable under pullback,
pushforward and products. -/
def adequate : Adequate C F where
  I := NumEquiv C F
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

/-- The numerical Chow ring `A_num^*(X) = (CH^*(X) ⊗ F) / NumEquiv`, a quotient of the Chow ring. -/
abbrev ring (X : SmProj k) : Type _ := C.CHF F X ⧸ (adequate C F).toIdeal X

variable {C F}

/-- An adequate family with `I(Spec k) = 0` consists of numerically trivial classes. -/
theorem le_of_point (A : Adequate C F) (h : A.I (SmProj.point k) = ⊥) : A ≤ adequate C F := by
  sorry

/-- An adequate family with `I(Spec k) ≠ 0` is the trivial relation. -/
theorem eq_trivial_of_point (A : Adequate C F) (h : A.I (SmProj.point k) ≠ ⊥) :
    A = Adequate.trivial C F := by
  sorry

variable (C F) in
/-- The class of `Spec k` is not numerically trivial, so `NumEquiv` is not the trivial
relation. -/
theorem point_class : C.ofCH F (1 : C.CH (SmProj.point k)) ∉ NumEquiv C F (SmProj.point k) := by
  sorry

end NumEquiv

/-! ### Unit tests of MC.0/adequate-equivalence-relation and MC.0/numerical-equivalence -/

section Tests

variable {C F}

/-- Unit test `rational_is_adequate`: `I = 0` is adequate, with quotients `CH^j(X) ⊗ F`. -/
example (X : SmProj k) (j : ℤ) :
    Nonempty ((Adequate.rat C F).quotient X j ≃ₗ[F] C.codimF F X j) := by
  sorry

/-- Unit test `trivial_is_adequate`: `I = everything` is adequate and every `A^j(X, F)` vanishes,
including `A^0(Spec k, F)`. -/
example (X : SmProj k) (j : ℤ) : Subsingleton ((Adequate.trivial C F).quotient X j) ∧
    Subsingleton ((Adequate.trivial C F).quotient (SmProj.point k) 0) := by
  sorry

/-- Unit test `positive_codimension_not_adequate`: the family `I^j = CH^j ⊗ F` for `j ≥ 1`,
`I^0 = 0`, is stable under pullback and products but not under pushforward (the pushforward of a
rational point of `ℙ¹` to `Spec k` is `[Spec k]`), so it is not adequate. -/
example :
    let I : ∀ X : SmProj k, Submodule F (C.CHF F X) := fun X => ⨆ (j : ℤ) (_ : 1 ≤ j), C.codimF F X j
    (∀ {X Y : SmProj k} (f : Y ⟶ X), (I X).map (C.pullbackF F f).toLinearMap ≤ I Y) ∧
      (∀ X (a b : C.CHF F X), a ∈ I X → a * b ∈ I X) ∧
      ∃ x : (SmProj.projectiveLine k).RatPoint,
        C.pushforwardF F (SmProj.projectiveLine k).toPoint (C.classOf F x) ∉ I (SmProj.point k) ∧
          ¬ ∃ A : Adequate C F, ∀ X, A.I X = I X := by
  sorry

/-- Unit test `sum_is_adequate`: the sum and the intersection of two adequate families are
adequate. -/
example (A B : Adequate C F) (X : SmProj k) :
    (A.sup B).I X = A.I X ⊔ B.I X ∧ (A.inf B).I X = A.I X ⊓ B.I X :=
  ⟨rfl, rfl⟩

/-- Unit test `curve_zero_cycles`: on a connected curve two zero cycles are numerically
equivalent exactly when they have the same degree. -/
example {X : SmProj k} (hX : X.IsEquidim 1) [ConnectedSpace X.toScheme] (a b : C.CHF F X)
    (ha : a ∈ C.dimF F X 0) (hb : b ∈ C.dimF F X 0) :
    a - b ∈ NumEquiv C F X ↔ C.degF F X a = C.degF F X b := by
  sorry

/-- Unit test `all_complements`: on `ℙ¹ × ℙ¹`, `α = [x × ℙ¹] - [ℙ¹ × x]` has
`deg(α · [Δ]) = 0` but `deg(α · [x × ℙ¹]) = -1`, so it is not numerically trivial. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    let P := SmProj.projectiveLine k
    let α : C.CHF F (P.prod P) := C.classOf F (SmProj.lift (P.toPoint ≫ x) (𝟙 P)) -
      C.classOf F (SmProj.lift (𝟙 P) (P.toPoint ≫ x))
    C.degF F _ (α * C.classOf F (SmProj.diag P)) = 0 ∧
      C.degF F _ (α * C.classOf F (SmProj.lift (P.toPoint ≫ x) (𝟙 P))) = -1 ∧
      α ∉ NumEquiv C F (P.prod P) := by
  sorry

/-- Unit test `not_rational_equivalence`: on a curve `E` over `ℚ` with rational points `P`, `O`
such that `[P] - [O]` has infinite order in `CH_0(E)` (as for Cremona 37a1 with `P = (0, 0)`),
`[P] - [O]` is numerically trivial but nonzero in `CH_0(E) ⊗ ℚ`. The curve 37a1 itself is not
named: Mathlib has Weierstrass equations but not the projective curve as a scheme. -/
example (C : ChowTheory ℚ) {E : SmProj ℚ} (hE : E.IsCurve) (P O : E.RatPoint)
    (h : ¬ IsOfFinAddOrder (C.pushforward P 1 - C.pushforward O 1)) :
    C.ofCH ℚ (C.pushforward P 1 - C.pushforward O 1) ∈ NumEquiv C ℚ E ∧
      C.ofCH ℚ (C.pushforward P 1 - C.pushforward O 1) ≠ 0 := by
  sorry

/-- Unit test `ring_structure`: the product of a numerically trivial class with any class is
numerically trivial. -/
example (X : SmProj k) (a b : C.CHF F X) (ha : a ∈ NumEquiv C F X) : a * b ∈ NumEquiv C F X :=
  (NumEquiv.adequate C F).mul_mem X a b ha

/-- Unit test `trivial_relation_is_coarser`: the trivial relation kills `[Spec k]`, which is not
numerically trivial, so it is not finer than numerical equivalence. -/
example : C.ofCH F (1 : C.CH (SmProj.point k)) ∈ (Adequate.trivial C F).I (SmProj.point k) ∧
    C.ofCH F (1 : C.CH (SmProj.point k)) ∉ NumEquiv C F (SmProj.point k) ∧
    ¬ (Adequate.trivial C F ≤ NumEquiv.adequate C F) := by
  sorry

end Tests

end MC0

section MC1

open CategoryTheory AlgebraicGeometry Limits TensorProduct MonoidalCategory

/-! ## MC.1 Pure motives and Tate objects

Convention (MC.1/chow-motive): motives are contravariant, `h(f)` is the class of the graph, and
the category of Chow motives is Mathlib's Karoubi envelope of the category `CorrTw` of pairs
`(X, m)`; the Karoubi object `((X, m), p)` is the motive `(X, p, m)`. Duals follow Mathlib's
convention: `ExactPairing X Y` has `η : 𝟙 ⟶ X ⊗ Y` and `ε : Y ⊗ X ⟶ 𝟙`, so the Stacks Project's
left dual of `X` is Mathlib's right dual, and the category is `RightRigidCategory`. -/

/-- `Idempotents.Karoubi.linear`: the Karoubi envelope of an `R`-linear category is `R`-linear,
scalar multiplication computed on the underlying morphisms. The pinned Mathlib has the
preadditive structure on the Karoubi envelope but not the linear one. -/
instance _root_.CategoryTheory.Idempotents.Karoubi.linear {R : Type*} [Semiring R]
    {D : Type*} [Category D] [Preadditive D] [Linear R D] :
    Linear R (Idempotents.Karoubi D) where
  homModule P Q :=
    { smul := fun r f => ⟨r • f.f, by rw [Linear.smul_comp, Linear.comp_smul, f.comm]⟩
      one_smul := sorry
      mul_smul := sorry
      smul_zero := sorry
      smul_add := sorry
      add_smul := sorry
      zero_smul := sorry }
  smul_comp := sorry
  comp_smul := sorry

variable {k : Type u} [Field k] (C : ChowTheory k)

/-! ### MC.1/twisted-correspondence-category -/

/-- MC.1/twisted-correspondence-category: the `ℚ`-linear category `C_k` of pairs `(X, m)` of a
smooth proper scheme and an integer, with `Hom((X, m), (Y, n)) = Corr^{n-m}(X, Y)`. -/
structure CorrTw (C : ChowTheory k) where
  /-- The underlying smooth proper scheme. -/
  obj : SmProj k
  /-- The twist `m`. -/
  twist : ℤ

namespace CorrTw

variable {C}

instance category : Category (CorrTw C) where
  Hom X Y := Corr C X.obj Y.obj (Y.twist - X.twist)
  id X := Corr.cast C (sub_self X.twist).symm (Corr.diagonal C X.obj)
  comp {X Y Z} f g := Corr.cast C (by ring) (Corr.comp C g f)
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The morphisms `(X, m) ⟶ (Y, n)` are exactly `Corr^{n-m}(X, Y)`, composed as
correspondences. -/
theorem hom_eq (X Y : CorrTw C) :
    (X ⟶ Y) = Corr C X.obj Y.obj (Y.twist - X.twist) ∧
      ∀ {Z : CorrTw C} (f : X ⟶ Y) (g : Y ⟶ Z),
        f ≫ g = Corr.cast C (by ring) (Corr.comp C g f) :=
  ⟨rfl, fun _ _ => rfl⟩

instance preadditive : Preadditive (CorrTw C) where
  homGroup X Y := inferInstanceAs (AddCommGroup (Corr C X.obj Y.obj (Y.twist - X.twist)))
  add_comp := sorry
  comp_add := sorry

/-- `C_k` is preadditive and `ℚ`-linear. -/
instance linear : Linear ℚ (CorrTw C) where
  homModule X Y := inferInstanceAs (Module ℚ (Corr C X.obj Y.obj (Y.twist - X.twist)))
  smul_comp := sorry
  comp_smul := sorry

variable (C) in
/-- The automorphism `(X, m) ↦ (X, m + 1)`, the identity on correspondences. -/
def shift : CorrTw C ⥤ CorrTw C where
  obj X := ⟨X.obj, X.twist + 1⟩
  map f := Corr.cast C (by ring) f
  map_id := sorry
  map_comp := sorry

variable (C) in
/-- The fully faithful functor `X ↦ (X, 0)` from the degree zero category of correspondences. -/
def ofDegreeZero : CorrZero C ⥤ CorrTw C where
  obj X := ⟨X.obj, 0⟩
  map f := Corr.cast C (by ring) f
  map_id := sorry
  map_comp := sorry

instance : (ofDegreeZero C).Full := sorry

instance : (ofDegreeZero C).Faithful := sorry

/-- The tensor structure `(X, m) ⊗ (Y, n) = (X × Y, m + n)`, with the tensor product of
correspondences on morphisms. -/
instance monoidalCategory : MonoidalCategory (CorrTw C) where
  tensorObj X Y := ⟨X.obj.prod Y.obj, X.twist + Y.twist⟩
  whiskerLeft X _ _ f :=
    Corr.cast C (by ring) (Corr.tensorHom C (Corr.diagonal C X.obj) f)
  whiskerRight f Y := Corr.cast C (by ring) (Corr.tensorHom C f (Corr.diagonal C Y.obj))
  tensorHom f g := Corr.cast C (by ring) (Corr.tensorHom C f g)
  tensorUnit := ⟨SmProj.point k, 0⟩
  associator X Y Z := sorry
  leftUnitor X := sorry
  rightUnitor X := sorry
  tensorHom_def := sorry
  id_tensorHom_id := sorry
  tensorHom_comp_tensorHom := sorry
  id_whiskerRight := sorry
  whiskerLeft_id := sorry
  associator_naturality := sorry
  leftUnitor_naturality := sorry
  rightUnitor_naturality := sorry
  pentagon := sorry
  triangle := sorry

/-- The symmetry, the graph of the switch of factors. -/
instance symmetricCategory : SymmetricCategory (CorrTw C) := sorry

end CorrTw

/-! ### Unit tests of MC.1/twisted-correspondence-category -/

section Tests

variable {C}

/-- Unit test `hom_between_twists`: `Hom((Spec k, 0), (ℙ¹, 1)) = Corr^1(Spec k, ℙ¹) = CH^1(ℙ¹) ⊗ ℚ`
is one-dimensional (with the degree `m - n` it would be `Corr^{-1} = 0`). -/
example : Module.finrank ℚ ((⟨SmProj.point k, 0⟩ : CorrTw C) ⟶ ⟨SmProj.projectiveLine k, 1⟩) = 1 ∧
    Subsingleton (Corr C (SmProj.point k) (SmProj.projectiveLine k) (-1)) := by
  sorry

/-- Unit test `shift_invariance`: `Hom((X, m + 1), (Y, n + 1)) = Hom((X, m), (Y, n))`. -/
example (X Y : SmProj k) (m n : ℤ) :
    Nonempty (((⟨X, m + 1⟩ : CorrTw C) ⟶ ⟨Y, n + 1⟩) ≃ₗ[ℚ] ((⟨X, m⟩ : CorrTw C) ⟶ ⟨Y, n⟩)) :=
  ⟨Corr.cast C (by ring)⟩

/-- Unit test `point_twists`: `End((Spec k, m)) = ℚ` and `Hom((Spec k, m), (Spec k, n)) = 0` for
`m ≠ n`. -/
example (m n : ℤ) (h : m ≠ n) :
    Nonempty (End (⟨SmProj.point k, m⟩ : CorrTw C) ≃ₐ[ℚ] ℚ) ∧
      Subsingleton ((⟨SmProj.point k, m⟩ : CorrTw C) ⟶ ⟨SmProj.point k, n⟩) := by
  sorry

/-- Unit test `degree_zero_part`: the full subcategory on the objects `(X, 0)` is the degree
zero category of correspondences. -/
example : (CorrTw.ofDegreeZero C).Full ∧ (CorrTw.ofDegreeZero C).Faithful :=
  ⟨inferInstance, inferInstance⟩

end Tests

/-! ### MC.1/chow-motive and MC.1/motives-category -/

/-- MC.1/chow-motive: the Chow motives over `k`, Mathlib's Karoubi envelope of `C_k`. An object is
a triple `(X, p, m)`: a pair `(X, m)` and an idempotent `p ∈ Corr^0(X, X)`. -/
abbrev Motive (C : ChowTheory k) : Type (u + 1) := Idempotents.Karoubi (CorrTw C)

/-- MC.1/motives-category: the `ℚ`-linear category `M_k` of motives. -/
abbrev MotiveCat (C : ChowTheory k) : Type (u + 1) := Motive C

namespace Motive

variable {C}

/-- The motive `(X, p, m)` given by an idempotent correspondence of degree zero. -/
def mk (X : SmProj k) (p : Corr C X X 0)
    (_hp : Corr.comp C p p = Corr.cast C (add_zero 0).symm p) (m : ℤ) : Motive C where
  X := ⟨X, m⟩
  p := Corr.cast C (sub_self m).symm p
  idem := sorry

variable (C) in
/-- The morphism group `q ∘ Corr^{n-m}(X, Y) ∘ p` from `(X, p, m)` to `(Y, q, n)`, the two-sided
cut. -/
def Hom (M N : Motive C) : Submodule ℚ (Corr C M.X.obj N.X.obj (N.X.twist - M.X.twist)) where
  carrier := {f | M.p ≫ f ≫ N.p = f}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- A correspondence of degree `n - m` is a morphism exactly when `q ∘ f ∘ p = f`. -/
theorem mem_hom_iff (M N : Motive C) (f : Corr C M.X.obj N.X.obj (N.X.twist - M.X.twist)) :
    f ∈ Hom C M N ↔ M.p ≫ f ≫ N.p = f :=
  Iff.rfl

/-- Morphisms of motives are the elements of the two-sided cut. -/
def homEquiv (M N : Motive C) : (M ⟶ N) ≃ₗ[ℚ] Hom C M N :=
  sorry

/-- The identity of `(X, p, m)` is `p`. -/
theorem id (M : Motive C) : (𝟙 M : M ⟶ M).f = M.p :=
  rfl

/-- Composition of morphisms of motives is composition of correspondences. -/
theorem comp {M N L : Motive C} (f : M ⟶ N) (g : N ⟶ L) : (f ≫ g).f = f.f ≫ g.f :=
  rfl

/-- Two morphisms of motives are equal when they are equal as correspondences. -/
theorem ext {M N : Motive C} (f g : M ⟶ N) (h : f.f = g.f) : f = g :=
  Idempotents.Karoubi.hom_ext f g h

variable (C) in
/-- The category of Chow motives is, by definition, Mathlib's Karoubi envelope of `C_k`. -/
def equivKaroubi : Motive C ≌ Idempotents.Karoubi (CorrTw C) :=
  CategoryTheory.Equivalence.refl

end Motive

namespace MotiveCat

variable {C}

/-- Each morphism group of motives is a `ℚ`-vector space. -/
instance hom_vectorSpace (M N : MotiveCat C) : Module ℚ (M ⟶ N) := inferInstance

/-- Composition of motives is `ℚ`-bilinear. -/
theorem comp_bilinear {M N L : MotiveCat C} (f f' : M ⟶ N) (g g' : N ⟶ L) (q : ℚ) :
    (f + f') ≫ g = f ≫ g + f' ≫ g ∧ f ≫ (g + g') = f ≫ g + f ≫ g' ∧
      (q • f) ≫ g = q • (f ≫ g) ∧ f ≫ (q • g) = q • (f ≫ g) := by
  sorry

/-- The identity of `(X, p, m)` is `p`. -/
theorem id_eq_projector (M : MotiveCat C) : (𝟙 M : M ⟶ M).f = M.p :=
  rfl

end MotiveCat

/-! ### MC.1/motive-functor-h -/

/-- The motive `h(X) = (X, [Δ_X], 0)` of a smooth proper scheme. -/
def motive (X : SmProj k) : Motive C := (Idempotents.toKaroubi (CorrTw C)).obj ⟨X, 0⟩

/-- `h(f)`: the class of the graph of `f : Y ⟶ X`, a morphism `h(X) ⟶ h(Y)`. -/
def motive.map {X Y : SmProj k} (f : Y ⟶ X) : motive C X ⟶ motive C Y :=
  (Idempotents.toKaroubi (CorrTw C)).map (Corr.cast C (by ring) (Corr.graph C f))

/-- `h` is contravariant: `h(g ≫ f) = h(f) ≫ h(g)`. -/
theorem motive.map_comp {X Y Z : SmProj k} (f : Y ⟶ X) (g : Z ⟶ Y) :
    motive.map C (g ≫ f) = motive.map C f ≫ motive.map C g := by
  sorry

/-- `h` as a functor on the opposite category. -/
def motive.functor : (SmProj k)ᵒᵖ ⥤ Motive C where
  obj X := motive C X.unop
  map f := motive.map C f.unop
  map_id := sorry
  map_comp := sorry

/-- The functor `CorrZero C ⥤ Motive C`, `X ↦ h(X)`, through which `h` factors. -/
def Motive.ofCorrZero : CorrZero C ⥤ Motive C :=
  CorrTw.ofDegreeZero C ⋙ Idempotents.toKaroubi (CorrTw C)

/-! ### MC.1/motives-monoidal and MC.1/tate-twist -/

namespace Motive

variable {C}

/-- The tensor product `(X, p, m) ⊗ (Y, q, n) = (X × Y, p ⊗ q, m + n)`. -/
def tensorObj (M N : Motive C) : Motive C where
  X := M.X ⊗ N.X
  p := M.p ⊗ₘ N.p
  idem := sorry

/-- The tensor product of two morphisms of motives, the tensor product of correspondences. -/
def tensorHom {M N M' N' : Motive C} (f : M ⟶ N) (g : M' ⟶ N') :
    tensorObj M M' ⟶ tensorObj N N' :=
  ⟨f.f ⊗ₘ g.f, sorry⟩

/-- The symmetric monoidal structure on motives, with the constraints induced from products of
schemes. -/
instance monoidalCategory : MonoidalCategory (Motive C) where
  tensorObj := tensorObj
  whiskerLeft M _ _ f := tensorHom (𝟙 M) f
  whiskerRight f M := tensorHom f (𝟙 M)
  tensorHom := tensorHom
  tensorUnit := motive C (SmProj.point k)
  associator M N L := sorry
  leftUnitor M := sorry
  rightUnitor M := sorry
  tensorHom_def := sorry
  id_tensorHom_id := sorry
  tensorHom_comp_tensorHom := sorry
  id_whiskerRight := sorry
  whiskerLeft_id := sorry
  associator_naturality := sorry
  leftUnitor_naturality := sorry
  rightUnitor_naturality := sorry
  pentagon := sorry
  triangle := sorry

variable (C) in
/-- The unit motive is `h(Spec k) = (Spec k, id, 0)`. -/
theorem tensorUnit : 𝟙_ (Motive C) = motive C (SmProj.point k) :=
  rfl

/-- `Motive.symmetry`: the switch of factors is a symmetry. -/
instance symmetry : SymmetricCategory (Motive C) := sorry

/-- The commutativity constraint on `h(X) ⊗ h(Y)` is `h` of the switch of factors. -/
theorem braiding_motive (X Y : SmProj k) :
    Corr.toChow C _ _ _ (β_ (motive C X) (motive C Y)).hom.f =
      C.classOf ℚ (SmProj.graph (SmProj.swap Y X)) := by
  sorry

/-- Twists add under the tensor product. -/
@[simp] theorem tensor_twist (M N : Motive C) : (M ⊗ N).X.twist = M.X.twist + N.X.twist :=
  rfl

instance monoidalPreadditive : MonoidalPreadditive (Motive C) := sorry

/-- `Motive.monoidalLinear`: the tensor product of morphisms of motives is `ℚ`-bilinear. -/
instance monoidalLinear : MonoidalLinear ℚ (Motive C) := sorry

variable (C) in
/-- MC.1/tate-twist: the twisted unit `𝟙(n) = (Spec k, id, n)`. -/
def tate (n : ℤ) : Motive C := (Idempotents.toKaroubi (CorrTw C)).obj ⟨SmProj.point k, n⟩

/-- The twist `M(n)`: if `M = (X, p, m)` then `M(n) = (X, p, m + n)`. -/
def twist (M : Motive C) (n : ℤ) : Motive C where
  X := ⟨M.X.obj, M.X.twist + n⟩
  p := Corr.cast C (by ring) M.p
  idem := sorry

/-- The twist of `(X, p, m)` by `n` is `(X, p, m + n)`. -/
@[simp] theorem twist_triple (M : Motive C) (n : ℤ) :
    (M.twist n).X = ⟨M.X.obj, M.X.twist + n⟩ :=
  rfl

/-- `M(n) ≅ M ⊗ 𝟙(n)`. -/
theorem twist_iso_tensor (M : Motive C) (n : ℤ) : Nonempty (M.twist n ≅ M ⊗ tate C n) := by
  sorry

/-- `𝟙(n + m) ≅ 𝟙(n) ⊗ 𝟙(m)` and `M(n)(m) = M(n + m)`. -/
theorem twist_add (M : Motive C) (n m : ℤ) :
    Nonempty (tate C (n + m) ≅ tate C n ⊗ tate C m) ∧ (M.twist n).twist m = M.twist (n + m) := by
  sorry

variable (C) in
/-- The twist as a functor. -/
def twistFunctor (n : ℤ) : Motive C ⥤ Motive C where
  obj M := M.twist n
  map f := ⟨Corr.cast C (by simp only [twist_triple]; ring) f.f, sorry⟩
  map_id := sorry
  map_comp := sorry

variable (C) in
/-- Tensoring with `𝟙(1)` is an autoequivalence, with inverse tensoring with `𝟙(-1)`. -/
def twist_equiv : Motive C ≌ Motive C where
  functor := twistFunctor C 1
  inverse := twistFunctor C (-1)
  unitIso := sorry
  counitIso := sorry
  functor_unitIso_comp := sorry

end Motive

/-- `h` of a product is the tensor product of the motives. -/
theorem motive.tensor (X Y : SmProj k) : motive C (X.prod Y) = motive C X ⊗ motive C Y := by
  sorry

/-- MC.1/motives-additive: the category of motives is additive. -/
instance Motive.hasFiniteBiproducts : HasFiniteBiproducts (Motive C) := sorry

instance Motive.hasBinaryBiproducts : HasBinaryBiproducts (Motive C) :=
  hasBinaryBiproducts_of_finite_biproducts _

/-- MC.1/motives-additive: `(Y ⊔ Z, p + q, m)` is a biproduct of `(Y, p, m)` and `(Z, q, m)`,
and `(∅, 0, 0)` is a zero object; in particular `h(X ⊔ Y) = h(X) ⊞ h(Y)`. -/
theorem Motive.additive (X Y : SmProj k) :
    Nonempty (motive C (X.coprod Y) ≅ motive C X ⊞ motive C Y) ∧
      IsZero (motive C (SmProj.empty k)) := by
  sorry

/-- `h` of a disjoint union is the direct sum of the motives. -/
theorem motive.coprod (X Y : SmProj k) :
    Nonempty (motive C (X.coprod Y) ≅ motive C X ⊞ motive C Y) :=
  (Motive.additive C X Y).1

/-! ### MC.1/motives-karoubian -/

/-- The motive `(X, a, m)` cut out by an idempotent endomorphism `a` of `(X, p, m)`. -/
def Motive.image {M : Motive C} (a : M ⟶ M) (_ha : a ≫ a = a) : Motive C where
  X := M.X
  p := a.f
  idem := sorry

/-- `a` as a morphism `(X, a, m) ⟶ (X, p, m)`. -/
def Motive.imageι {M : Motive C} (a : M ⟶ M) (ha : a ≫ a = a) : Motive.image C a ha ⟶ M :=
  ⟨a.f, sorry⟩

/-- MC.1/motives-karoubian: every idempotent of a motive splits; concretely `a : (X, a, m) ⟶ M`
is a kernel of `𝟙 - a`. -/
theorem Motive.karoubian {M : Motive C} (a : M ⟶ M) (ha : a ≫ a = a) :
    IsIdempotentComplete (Motive C) ∧
      ∃ w : Motive.imageι C a ha ≫ (𝟙 M - a) = 0,
        Nonempty (IsLimit (KernelFork.ofι (Motive.imageι C a ha) w)) := by
  sorry

/-! ### MC.1/lefschetz-motive and MC.1/h-projective-line -/

/-- `c₀ = [x × ℙ¹]` is idempotent. -/
theorem Corr.pointTimes_idem {X : SmProj k} (x : X.RatPoint) :
    Corr.comp C (Corr.pointTimes x) (Corr.pointTimes x) =
      Corr.cast C (add_zero 0).symm (Corr.pointTimes x) := by
  sorry

/-- `c₂ = [ℙ¹ × x]` is idempotent. -/
theorem Corr.timesPoint_idem {X : SmProj k} (x : X.RatPoint) :
    Corr.comp C (Corr.timesPoint x) (Corr.timesPoint x) =
      Corr.cast C (add_zero 0).symm (Corr.timesPoint x) := by
  sorry

/-- MC.1/lefschetz-motive: `(ℙ¹, c₀, 0) ≅ 𝟙` and `(ℙ¹, c₂, 0) ≅ 𝟙(-1)`, the Lefschetz motive,
which is invertible with inverse the Tate motive `𝟙(1)`. -/
theorem Motive.lefschetz_iso (x : (SmProj.projectiveLine k).RatPoint) :
    Nonempty (Motive.mk _ (Corr.pointTimes x) (Corr.pointTimes_idem C x) 0 ≅ 𝟙_ (Motive C)) ∧
      Nonempty (Motive.mk _ (Corr.timesPoint x) (Corr.timesPoint_idem C x) 0 ≅ Motive.tate C (-1)) ∧
      Nonempty (Motive.tate C (-1) ⊗ Motive.tate C 1 ≅ 𝟙_ (Motive C)) := by
  sorry

/-- MC.1/h-projective-line: `h(ℙ¹) ≅ 𝟙 ⊕ 𝟙(-1)`. -/
theorem Motive.h_projectiveLine :
    Nonempty (motive C (SmProj.projectiveLine k) ≅ 𝟙_ (Motive C) ⊞ Motive.tate C (-1)) := by
  sorry

variable {C} in
/-- The `n`-th tensor power of a motive. -/
def Motive.tensorPow (M : Motive C) : ℕ → Motive C
  | 0 => 𝟙_ (Motive C)
  | n + 1 => Motive.tensorPow M n ⊗ M

/-- MC.1/lower-twist-by-lefschetz: for `m ≥ n`,
`(Z, q, n) ≅ (Z, q, m) ⊗ (ℙ¹, c₂, 0)^{⊗(m - n)}`, the latter being
`(Z × (ℙ¹)^{m-n}, q ⊗ c₂ ⊗ ⋯ ⊗ c₂, m)`. -/
theorem Motive.raiseTwist (M : Motive C) (m : ℕ) (n : ℤ) (hn : M.X.twist = n)
    (x : (SmProj.projectiveLine k).RatPoint) :
    Nonempty (M ≅ M.twist (m : ℤ) ⊗
      (Motive.mk _ (Corr.timesPoint x) (Corr.timesPoint_idem C x) 0).tensorPow m) := by
  sorry

/-! ### Unit tests of MC.1/chow-motive, motives-category, motive-functor-h, motives-monoidal and
tate-twist -/

section Tests

variable {C}

/-- Unit test `unit_motive`: `(Spec k, id, 0)` is the unit and its endomorphism ring is `ℚ`. -/
example : 𝟙_ (Motive C) = motive C (SmProj.point k) ∧
    Nonempty (End (𝟙_ (Motive C)) ≃ₐ[ℚ] ℚ) := by
  sorry

/-- Unit test `twist_changes_degree`: a morphism `(X, p, 0) ⟶ (X, p, 1)` is a correspondence of
degree one. -/
example (M : Motive C) (hM : M.X.twist = 0) (f : M ⟶ M.twist 1) :
    Corr.toChow C _ _ _ f.f ∈ corrSubmodule C M.X.obj M.X.obj 1 := by
  sorry

/-- Unit test `two_sided_cut`: on `ℙ¹`, `Hom((ℙ¹, c₀, 0), (ℙ¹, c₂, 0)) = 0` although the ambient
`Corr^0(ℙ¹, ℙ¹)` is two-dimensional. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    Subsingleton (Motive.mk _ (Corr.pointTimes (C := C) x) (Corr.pointTimes_idem C x) 0 ⟶
      Motive.mk _ (Corr.timesPoint x) (Corr.timesPoint_idem C x) 0) ∧
    Module.finrank ℚ (Corr C (SmProj.projectiveLine k) (SmProj.projectiveLine k) 0) = 2 := by
  sorry

/-- Unit test `identity_is_the_projector`: the identity of `(X, p, m)` is `p`, which differs from
the diagonal unless `p` is the diagonal. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    let M := Motive.mk _ (Corr.pointTimes (C := C) x) (Corr.pointTimes_idem C x) 0
    (𝟙 M : M ⟶ M).f = M.p ∧ (𝟙 M : M ⟶ M).f ≠ 𝟙 M.X := by
  sorry

/-- Unit test `endomorphisms_of_h_P1`: `End(h(ℙ¹)) ≅ ℚ × ℚ` as a `ℚ`-algebra, with the projectors
`c₀`, `c₂`, and `End((ℙ¹, c₀, 0)) = ℚ`. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    Nonempty (End (motive C (SmProj.projectiveLine k)) ≃ₐ[ℚ] ℚ × ℚ) ∧
      Nonempty (End (Motive.mk _ (Corr.pointTimes (C := C) x) (Corr.pointTimes_idem C x) 0) ≃ₐ[ℚ]
        ℚ) := by
  sorry

/-- Unit test `homs_between_unit_twists`: `Hom(𝟙(m), 𝟙(n))` is `ℚ` for `m = n` and zero otherwise. -/
example (m n : ℤ) :
    (m = n → Module.finrank ℚ (Motive.tate C m ⟶ Motive.tate C n) = 1) ∧
      (m ≠ n → Subsingleton (Motive.tate C m ⟶ Motive.tate C n)) := by
  sorry

/-- Unit test `h_of_a_point`: `h(Spec k)` is the unit motive, with endomorphism ring `ℚ`. -/
example : motive C (SmProj.point k) = 𝟙_ (Motive C) ∧
    Nonempty (End (motive C (SmProj.point k)) ≃ₐ[ℚ] ℚ) := by
  sorry

/-- Unit test `h_of_the_line`: `h(ℙ¹)` is the unit plus a twist of the unit. -/
example : Nonempty (motive C (SmProj.projectiveLine k) ≅ 𝟙_ (Motive C) ⊞ Motive.tate C (-1)) :=
  Motive.h_projectiveLine C

/-- Unit test `contravariance`: `h(g ≫ f) = h(f) ≫ h(g)`. -/
example {X Y Z : SmProj k} (f : Y ⟶ X) (g : Z ⟶ Y) :
    motive.map C (g ≫ f) = motive.map C f ≫ motive.map C g :=
  motive.map_comp C f g

/-- Unit test `unit_law`: tensoring with the unit motive is isomorphic to the identity. -/
example : Nonempty (tensorLeft (𝟙_ (Motive C)) ≅ 𝟭 (Motive C)) := by
  sorry

/-- Unit test `twists_add`: `𝟙(m) ⊗ 𝟙(n) ≅ 𝟙(m + n)`. -/
example (m n : ℤ) : Nonempty (Motive.tate C m ⊗ Motive.tate C n ≅ Motive.tate C (m + n)) := by
  sorry

/-- Unit test `symmetry_is_the_switch`: the commutativity constraint on `h(X) ⊗ h(Y)` is induced
by the switch of factors. -/
example (X Y : SmProj k) :
    Corr.toChow C _ _ _ (β_ (motive C X) (motive C Y)).hom.f =
      C.classOf ℚ (SmProj.graph (SmProj.swap Y X)) :=
  Motive.braiding_motive X Y

/-- Unit test `twist_zero`: `𝟙(0)` is the unit motive. -/
example : Motive.tate C 0 = 𝟙_ (Motive C) :=
  rfl

/-- Unit test `twist_is_invertible`: `𝟙(1) ⊗ 𝟙(-1)` is the unit. -/
example : Nonempty (Motive.tate C 1 ⊗ Motive.tate C (-1) ≅ 𝟙_ (Motive C)) := by
  sorry

/-- Unit test `twist_of_h`: `h(X)(n) = (X, [Δ], n)`: twisting does not change the underlying
scheme. -/
example (X : SmProj k) (n : ℤ) : ((motive C X).twist n).X = ⟨X, 0 + n⟩ :=
  rfl

end Tests

/-! ### MC.1/motive-dual and MC.1/motives-rigid -/

/-- MC.1/motive-dual: for `X` equidimensional of dimension `d`, `(h(X), h(X)(d))` is an exact
pairing in Mathlib's convention (`h(X)(d)` is the Stacks Project's left dual, Mathlib's right
dual), with coevaluation the diagonal in `Corr^d(Spec k, X × X) = CH^d(X × X) ⊗ ℚ` and evaluation
the diagonal in `Corr^{-d}(X × X, Spec k) = CH_d(X × X) ⊗ ℚ`. -/
abbrev motive_dual {X : SmProj k} {d : ℕ} (_hX : X.IsEquidim d) :
    ExactPairing (motive C X) ((motive C X).twist d) where
  coevaluation' :=
    ⟨Corr.mk C (C.pullbackF ℚ (SmProj.snd _ _) (C.classOf ℚ (SmProj.diag X))) sorry, sorry⟩
  evaluation' :=
    ⟨Corr.mk C (C.pullbackF ℚ (SmProj.fst _ _) (C.classOf ℚ (SmProj.diag X))) sorry, sorry⟩
  coevaluation_evaluation' := sorry
  evaluation_coevaluation' := sorry

/-- MC.1/motives-rigid: every motive has a dual, `(M, M')` an exact pairing in Mathlib's sense;
so the category of motives is right rigid, and, being symmetric, rigid. -/
instance Motive.rightRigid : RightRigidCategory (Motive C) := sorry

instance Motive.rigid : RigidCategory (Motive C) :=
  BraidedCategory.rigidCategoryOfRightRigidCategory

/-- MC.1/motives-rigid: every motive has a dual. -/
theorem Motive.exists_dual (M : Motive C) : ∃ M' : Motive C, Nonempty (ExactPairing M M') :=
  ⟨Mᘁ, ⟨inferInstance⟩⟩

/-- MC.1/dual-of-biproduct: in a preadditive monoidal category with additive tensor product, a
biproduct of objects with duals has a dual, with coevaluation `Σ (ιᵢ ⊗ ιᵢ) ∘ ηᵢ` and evaluation
`Σ εᵢ ∘ (πᵢ ⊗ πᵢ)`. -/
abbrev exactPairingBiprod {A : Type*} [Category A] [Preadditive A] [MonoidalCategory A]
    [MonoidalPreadditive A] {X₁ X₂ Y₁ Y₂ : A} [HasBinaryBiproduct X₁ X₂]
    [HasBinaryBiproduct Y₁ Y₂] [ExactPairing X₁ Y₁] [ExactPairing X₂ Y₂] :
    ExactPairing (X₁ ⊞ X₂) (Y₁ ⊞ Y₂) where
  coevaluation' := η_ X₁ Y₁ ≫ (biprod.inl ⊗ₘ biprod.inl) + η_ X₂ Y₂ ≫ (biprod.inr ⊗ₘ biprod.inr)
  evaluation' := (biprod.fst ⊗ₘ biprod.fst) ≫ ε_ X₁ Y₁ + (biprod.snd ⊗ₘ biprod.snd) ≫ ε_ X₂ Y₂
  coevaluation_evaluation' := sorry
  evaluation_coevaluation' := sorry

/-- MC.1/dual-of-summand: in an idempotent complete preadditive monoidal category, a retract `X'`
of an object `X` with an exact pairing `(X, Y)` has a right dual `Y'`, the image of the adjoint
mate of the idempotent `r ≫ i` on `Y`. -/
def exactPairingOfRetract {A : Type*} [Category A] [Preadditive A] [MonoidalCategory A]
    [MonoidalPreadditive A] [IsIdempotentComplete A] {X X' Y : A} [ExactPairing X Y]
    (i : X' ⟶ X) (r : X ⟶ X') (_h : i ≫ r = 𝟙 X') : Σ Y' : A, ExactPairing X' Y' :=
  sorry

/-- The adjoint mate of the idempotent `r ≫ i` is idempotent, and `Y'` is a retract of `Y` through
which it factors. -/
theorem exactPairingOfRetract_spec {A : Type*} [Category A] [Preadditive A] [MonoidalCategory A]
    [MonoidalPreadditive A] [IsIdempotentComplete A] {X X' Y : A} [ExactPairing X Y]
    (i : X' ⟶ X) (r : X ⟶ X') (h : i ≫ r = 𝟙 X') :
    letI : HasRightDual X := ⟨Y⟩
    rightAdjointMate (r ≫ i) ≫ rightAdjointMate (r ≫ i) = rightAdjointMate (r ≫ i) ∧
      ∃ (i' : (exactPairingOfRetract (Y := Y) i r h).1 ⟶ Y)
        (r' : Y ⟶ (exactPairingOfRetract (Y := Y) i r h).1),
        i' ≫ r' = 𝟙 _ ∧ r' ≫ i' = rightAdjointMate (r ≫ i) := by
  sorry

/-! ### MC.1/chow-group-of-motive -/

namespace Motive

variable {C}

/-- The projector of `M = (X, p, m)` as a correspondence of degree zero. -/
def proj (M : Motive C) : Corr C M.X.obj M.X.obj 0 := Corr.cast C (sub_self _) M.p

/-- The `i`-th Chow group of `(X, p, m)`: the image of `p_*` on `CH^{i+m}(X) ⊗ ℚ`. -/
def chow (M : Motive C) (i : ℤ) : Submodule ℚ (C.CHF ℚ M.X.obj) :=
  (C.codimF ℚ M.X.obj (i + M.X.twist)).map M.proj.pushforward

/-- On `h(X)` it is `CH^i(X) ⊗ ℚ`. -/
theorem chow_h (X : SmProj k) (i : ℤ) : (motive C X).chow i = C.codimF ℚ X i := by
  sorry

/-- A morphism of motives acts on Chow groups by pushforward of cycles. -/
def chow_map {M N : Motive C} (f : M ⟶ N) (i : ℤ) : M.chow i →ₗ[ℚ] N.chow i :=
  (Corr.pushforward f.f).restrict sorry

/-- `CH^i(M(n)) = CH^{i+n}(M)`. -/
@[simp] theorem chow_twist (M : Motive C) (n i : ℤ) : (M.twist n).chow i = M.chow (i + n) := by
  sorry

/-- The Chow groups take direct sums of motives to direct sums. -/
theorem chow_additive (M N : Motive C) (i : ℤ) :
    Nonempty ((M ⊞ N).chow i ≃ₗ[ℚ] M.chow i × N.chow i) := by
  sorry

/-- MC.1/chow-groups-representable: `Hom(𝟙(-i), M) ≃ CH^i(M)`. -/
def chowEquiv (M : Motive C) (i : ℤ) : (tate C (-i) ⟶ M) ≃ₗ[ℚ] M.chow i :=
  sorry

/-- MC.1/chow-groups-representable: the isomorphism `Hom(𝟙(-i), M) ≃ CH^i(M)` is natural in `M`. -/
theorem chow_representable {M N : Motive C} (f : M ⟶ N) (i : ℤ) (g : tate C (-i) ⟶ M) :
    chowEquiv N i (g ≫ f) = chow_map f i (chowEquiv M i g) := by
  sorry

/-- MC.1/manin-identity-principle: if `c ⊗ 𝟙_{h(X)}` is bijective on all Chow groups for every
smooth proper `X`, then `c` is an isomorphism. -/
theorem manin {M N : Motive C} (c : M ⟶ N)
    (hc : ∀ (X : SmProj k) (i : ℤ), Function.Bijective (chow_map (c ▷ motive C X) i)) :
    IsIso c := by
  sorry

end Motive

/-! ### Unit tests of MC.1/chow-group-of-motive -/

section Tests

variable {C}

/-- Unit test `chow_of_the_unit`: `CH^0(𝟙) = ℚ` and `CH^i(𝟙) = 0` for `i ≠ 0`. -/
example : Module.finrank ℚ ((𝟙_ (Motive C)).chow 0) = 1 ∧
    ∀ i : ℤ, i ≠ 0 → (𝟙_ (Motive C)).chow i = ⊥ := by
  sorry

/-- Unit test `twist_shifts`: `CH^j(𝟙(-i)) = CH^{j-i}(Spec k) ⊗ ℚ` is `ℚ` for `j = i` and zero
otherwise. -/
example (i j : ℤ) :
    (j = i → Module.finrank ℚ ((Motive.tate C (-i)).chow j) = 1) ∧
      (j ≠ i → (Motive.tate C (-i)).chow j = ⊥) := by
  sorry

/-- Unit test `projector_matters`: `CH^*(ℙ¹, c₀, 0)` is `ℚ` in degree `0` and zero in degree `1`,
and `CH^*(ℙ¹, c₂, 0)` the other way round. -/
example (x : (SmProj.projectiveLine k).RatPoint) :
    let M₀ := Motive.mk _ (Corr.pointTimes (C := C) x) (Corr.pointTimes_idem C x) 0
    let M₂ := Motive.mk _ (Corr.timesPoint (C := C) x) (Corr.timesPoint_idem C x) 0
    Module.finrank ℚ (M₀.chow 0) = 1 ∧ M₀.chow 1 = ⊥ ∧
      M₂.chow 0 = ⊥ ∧ Module.finrank ℚ (M₂.chow 1) = 1 := by
  sorry

end Tests

/-! ### MC.1/motives-universal-property -/

/-- MC.1/motives-universal-property: a `ℚ`-linear symmetric monoidal functor `F` from the degree
zero correspondences to a `ℚ`-linear Karoubian symmetric monoidal category, in which the image of
`F(c₂)` on `F(ℙ¹)` is invertible, extends along `X ↦ h(X)` to a `ℚ`-linear symmetric monoidal
functor on motives, uniquely up to a unique monoidal isomorphism compatible with the given ones. -/
theorem Motive.universal {D : Type*} [Category D] [Preadditive D] [Linear ℚ D]
    [MonoidalCategory D] [SymmetricCategory D] [IsIdempotentComplete D]
    [(Motive.ofCorrZero C).Braided] (F : CorrZero C ⥤ D) [F.Braided] [F.Linear ℚ]
    (x : (SmProj.projectiveLine k).RatPoint)
    (hU : ∃ (U : D) (ι : U ⟶ F.obj ⟨SmProj.projectiveLine k⟩) (π : F.obj ⟨_⟩ ⟶ U),
      ι ≫ π = 𝟙 U ∧ π ≫ ι = F.map (Corr.timesPoint x) ∧ ∃ V : D, Nonempty (U ⊗ V ≅ 𝟙_ D)) :
    ∃ (G : Motive C ⥤ D) (_ : G.Braided) (_ : G.Linear ℚ) (e : Motive.ofCorrZero C ⋙ G ≅ F),
      NatTrans.IsMonoidal e.hom ∧
      ∀ (G' : Motive C ⥤ D) (_ : G'.Braided) (e' : Motive.ofCorrZero C ⋙ G' ≅ F),
        NatTrans.IsMonoidal e'.hom →
        ∃! θ : G ≅ G', NatTrans.IsMonoidal θ.hom ∧
          Functor.whiskerLeft (Motive.ofCorrZero C) θ.hom ≫ e'.hom = e.hom := by
  sorry

/-! ### MC.1/projective-bundle-formula, diagonal-of-projective-bundle, diagonal-as-zero-scheme,
projective-space-projectors -/

/-- The fibre product `X ×_Z Y` of smooth proper `k`-schemes along a smooth `f`, again smooth and
proper over `k`. -/
def SmProj.fibreProd {X Y Z : SmProj k} (f : X ⟶ Z) (g : Y ⟶ Z) (_hf : Smooth f.hom.left) :
    SmProj k :=
  ⟨Over.mk (pullback.fst f.hom.left g.hom.left ≫ X.obj.hom), sorry⟩

/-- SF.5 (Chern classes, Stacks 02U9, 02UD, Whitney) with the scheme theory beneath it
(locally free modules, projective bundles `P(E) = Proj Sym E`, the tangent sheaf): the imported
inputs of the projective bundle formula of MC.1 and of MC.2/euler-characteristic-self-intersection.
Nothing here is planned by this roadmap. -/
structure ChernTheory (C : ChowTheory k) where
  /-- Locally free `𝒪_X`-modules of finite rank. -/
  VB : SmProj k → Type u
  /-- The rank. -/
  rank : ∀ {X : SmProj k}, VB X → ℕ
  /-- Pullback of locally free modules. -/
  pullbackVB : ∀ {X Y : SmProj k}, (Y ⟶ X) → VB X → VB Y
  rank_pullback : ∀ {X Y : SmProj k} (f : Y ⟶ X) (E : VB X), rank (pullbackVB f E) = rank E
  /-- The dual `E^∨`. -/
  dual : ∀ {X : SmProj k}, VB X → VB X
  /-- The tensor product. -/
  tensor : ∀ {X : SmProj k}, VB X → VB X → VB X
  /-- The Chern classes `c_i(E) ∈ CH^i(X)`. -/
  chern : ∀ {X : SmProj k}, VB X → ℕ → C.CH X
  chern_mem : ∀ {X : SmProj k} (E : VB X) (i : ℕ), chern E i ∈ C.codim X i
  chern_zero : ∀ {X : SmProj k} (E : VB X), chern E 0 = 1
  chern_eq_zero : ∀ {X : SmProj k} (E : VB X) (i : ℕ), rank E < i → chern E i = 0
  /-- Chern classes commute with pullback, so capping commutes with proper pushforward by the
  projection formula (Stacks 02U9). -/
  chern_pullback : ∀ {X Y : SmProj k} (f : Y ⟶ X) (E : VB X) (i : ℕ),
    chern (pullbackVB f E) i = C.pullback f (chern E i)
  /-- The Chern classes of a twist by an invertible module (Stacks 02UD). -/
  chern_tensor_line : ∀ {X : SmProj k} (E L : VB X), rank L = 1 → ∀ j : ℕ,
    chern (tensor E L) j = ∑ i ∈ Finset.range (j + 1),
      ((rank E - i).choose (j - i) : C.CH X) * chern E i * chern L 1 ^ (j - i)
  /-- The tangent sheaf of `X`. -/
  tangent : ∀ X : SmProj k, VB X
  rank_tangent : ∀ (X : SmProj k) (d : ℕ), X.IsEquidim d → rank (tangent X) = d
  /-- The projective bundle `P(E) = Proj(Sym E)` with `p_* 𝒪(1) = E`. -/
  projBundle : ∀ {X : SmProj k}, VB X → SmProj k
  projBundleMap : ∀ {X : SmProj k} (E : VB X), projBundle E ⟶ X
  projBundleMap_smooth : ∀ {X : SmProj k} (E : VB X), Smooth (projBundleMap E).hom.left
  /-- The twisting sheaf `𝒪_P(1)`. -/
  O1 : ∀ {X : SmProj k} (E : VB X), VB (projBundle E)
  rank_O1 : ∀ {X : SmProj k} (E : VB X), rank (O1 E) = 1
  /-- The kernel `S` of the canonical surjection `p^*E ⟶ 𝒪_P(1)`, locally free of rank `r - 1`. -/
  tautSub : ∀ {X : SmProj k} (E : VB X), VB (projBundle E)
  rank_tautSub : ∀ {X : SmProj k} (E : VB X), rank (tautSub E) = rank E - 1
  /-- The projective bundle formula for Chow groups (Stacks 02TX). -/
  projBundle_formula : ∀ {X : SmProj k} (E : VB X), Function.Bijective
    fun a : Fin (rank E) → C.CH X =>
      ∑ i : Fin (rank E), chern (O1 E) 1 ^ (i : ℕ) * C.pullback (projBundleMap E) (a i)

variable {C}

/-- The correspondence `c_i = [Γ_p] · pr₂^* c₁(𝒪_P(1))^i ∈ Corr^i(X, P)`, a morphism
`h(X)(-i) ⟶ h(P)`, for the projective bundle `p : P = P(E) ⟶ X`. -/
def Motive.projBundleComponent (K : ChernTheory C) {X : SmProj k} (E : K.VB X) (i : ℕ) :
    (motive C X).twist (-(i : ℤ)) ⟶ motive C (K.projBundle E) :=
  ⟨Corr.mk C (C.classOf ℚ (SmProj.graph (K.projBundleMap E)) *
    C.pullbackF ℚ (SmProj.snd _ _) (C.ofCH ℚ (K.chern (K.O1 E) 1 ^ i))) sorry, sorry⟩

/-- MC.1/projective-bundle-formula: with `p : P = P(E) ⟶ X` for `E` of rank `r`, normalised by
`p_* 𝒪_P(1) = E`, the sum `⨁_{i<r} h(X)(-i) ⟶ h(P)` of the `c_i` is an isomorphism. -/
theorem Motive.projectiveBundle_formula (K : ChernTheory C) {X : SmProj k} (E : K.VB X) :
    IsIso (biproduct.desc fun i : Fin (K.rank E) => Motive.projBundleComponent K E i) := by
  sorry

/-- MC.1/diagonal-of-projective-bundle: `[Δ_P] = (Σ_{i<r} c_{r-1-i}(pr₁^*S^∨) · c₁(pr₂^*𝒪_P(1))^i)
· (p × p)^*[Δ_X]` in `CH^*(P × P)`; every coefficient is `1` (the printed binomial coefficients
are wrong for `r ≥ 3`, sourceIssues E9). -/
theorem Motive.diagonal_projectiveBundle (K : ChernTheory C) {X : SmProj k} (E : K.VB X) :
    let P := K.projBundle E
    let p := K.projBundleMap E
    C.pushforward (SmProj.diag P) 1 =
      (∑ i ∈ Finset.range (K.rank E),
        K.chern (K.pullbackVB (SmProj.fst P P) (K.dual (K.tautSub E))) (K.rank E - 1 - i) *
          K.chern (K.pullbackVB (SmProj.snd P P) (K.O1 E)) 1 ^ i) *
        C.pullback (SmProj.prodMap p p) (C.pushforward (SmProj.diag X) 1) := by
  sorry

/-- MC.1/diagonal-as-zero-scheme, on classes: in `CH_*(P ×_X P)`,
`[Δ_P] = c_{r-1}(q₁^*S^∨ ⊗ q₂^*𝒪_P(1)) ∩ [P ×_X P]`. The zero-scheme statement itself (the section
`s` of `V` vanishes exactly on `Δ_P`, a regular immersion of codimension `r - 1`) needs sections
and zero schemes of locally free modules, which neither Mathlib nor `ChernTheory` provides; only
its consequence for classes is stated. -/
theorem Motive.diagonal_zeroScheme (K : ChernTheory C) {X : SmProj k} (E : K.VB X) :
    let P := K.projBundle E
    let hp := K.projBundleMap_smooth E
    let Q := SmProj.fibreProd (K.projBundleMap E) (K.projBundleMap E) hp
    let q₁ : Q ⟶ P := ObjectProperty.homMk (Over.homMk (pullback.fst _ _))
    let q₂ : Q ⟶ P := ObjectProperty.homMk (Over.homMk (pullback.snd _ _) sorry)
    let δ : P ⟶ Q := ObjectProperty.homMk (Over.homMk (pullback.lift (𝟙 _) (𝟙 _) rfl) sorry)
    C.pushforward δ 1 =
      K.chern (K.tensor (K.pullbackVB q₁ (K.dual (K.tautSub E))) (K.pullbackVB q₂ (K.O1 E)))
        (K.rank E - 1) := by
  sorry

/-- The projector `π_i = pr₁^*h^{n-i} · pr₂^*h^i ∈ Corr^0(ℙⁿ, ℙⁿ)` for a class `h ∈ CH^1(ℙⁿ)`. -/
def Corr.projectiveSpaceProjector (n : ℕ) (h : C.CH (SmProj.projectiveSpace k n)) (i : ℕ) :
    Corr C (SmProj.projectiveSpace k n) (SmProj.projectiveSpace k n) 0 :=
  Corr.mk C (C.exterior ℚ (C.ofCH ℚ (h ^ (n - i))) (C.ofCH ℚ (h ^ i))) sorry

/-- For the hyperplane class `h`, `π_i` is idempotent. -/
theorem Corr.projectiveSpaceProjector_idem (n : ℕ) (h : C.CH (SmProj.projectiveSpace k n))
    (hh : h ∈ C.codim _ 1) (hdeg : C.deg _ (h ^ n) = 1) (i : ℕ) :
    Corr.comp C (Corr.projectiveSpaceProjector n h i) (Corr.projectiveSpaceProjector n h i) =
      Corr.cast C (add_zero 0).symm (Corr.projectiveSpaceProjector n h i) := by
  sorry

/-- MC.1/projective-space-projectors: for the hyperplane class `h ∈ CH^1(ℙⁿ)` (the class with
`deg hⁿ = 1`), the `π_i` are orthogonal idempotents summing to `[Δ]`, `(ℙⁿ, π_i, 0) ≅ 𝟙(-i)` and
`h(ℙⁿ) ≅ ⨁_{i ≤ n} 𝟙(-i)`. -/
theorem Motive.projectiveSpace_projectors (n : ℕ) (h : C.CH (SmProj.projectiveSpace k n))
    (hh : h ∈ C.codim _ 1) (hdeg : C.deg _ (h ^ n) = 1) :
    (∀ i j : Fin (n + 1), i ≠ j →
      Corr.comp C (Corr.projectiveSpaceProjector n h i) (Corr.projectiveSpaceProjector n h j) = 0) ∧
    ∑ i : Fin (n + 1), Corr.projectiveSpaceProjector n h i =
      Corr.diagonal C (SmProj.projectiveSpace k n) ∧
    (∀ i : Fin (n + 1), Nonempty (Motive.mk _ (Corr.projectiveSpaceProjector n h i)
      (Corr.projectiveSpaceProjector_idem n h hh hdeg i) 0 ≅ Motive.tate C (-(i : ℤ)))) ∧
    Nonempty (motive C (SmProj.projectiveSpace k n) ≅ ⨁ fun i : Fin (n + 1) => Motive.tate C (-(i : ℤ))) := by
  sorry

/-! ### MC.1/motives-mod-adequate-relation -/

section MotiveMod

variable (F : Type*) [Field F] [CharZero F] (A : Adequate C F)

/-- `Corr_I^r(X, Y) = ⨁_d A^{d+r}(X_d × Y, F)`: `F`-linear correspondences modulo `I`. -/
abbrev CorrMod (X Y : SmProj k) (r : ℤ) : Type _ :=
  corrSubmoduleF C F X Y r ⧸ (A.I (X.prod Y)).comap (corrSubmoduleF C F X Y r).subtype

/-- Reduction modulo a coarser adequate family `A'`. -/
def CorrMod.reduce {A' : Adequate C F} (_h : A ≤ A') {X Y : SmProj k} {r : ℤ} :
    CorrMod F A X Y r →ₗ[F] CorrMod F A' X Y r :=
  Submodule.mapQ _ _ LinearMap.id sorry

/-- Composition of correspondences modulo `I`, induced from that of Chow correspondences
(well defined by `Adequate.comp`). -/
def CorrMod.comp {X Y Z : SmProj k} {r s : ℤ} :
    CorrMod F A Y Z s →ₗ[F] CorrMod F A X Y r →ₗ[F] CorrMod F A X Z (r + s) :=
  sorry

/-- The category of pairs `(X, m)` with `Hom = Corr_I^{n-m}(X, Y)`. -/
structure CorrTwMod (A : Adequate C F) where
  /-- The underlying smooth proper scheme. -/
  obj : SmProj k
  /-- The twist. -/
  twist : ℤ

instance CorrTwMod.category : Category (CorrTwMod F A) where
  Hom X Y := CorrMod F A X.obj Y.obj (Y.twist - X.twist)
  id X := sorry
  comp f g := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

instance CorrTwMod.preadditive : Preadditive (CorrTwMod F A) where
  homGroup X Y := inferInstanceAs (AddCommGroup (CorrMod F A X.obj Y.obj (Y.twist - X.twist)))
  add_comp := sorry
  comp_add := sorry

instance CorrTwMod.linear : Linear F (CorrTwMod F A) where
  homModule X Y := inferInstanceAs (Module F (CorrMod F A X.obj Y.obj (Y.twist - X.twist)))
  smul_comp := sorry
  comp_smul := sorry

/-- The tensor structure `(X, m) ⊗ (Y, n) = (X × Y, m + n)` modulo `I`. -/
instance CorrTwMod.monoidalCategory : MonoidalCategory (CorrTwMod F A) := sorry

/-- MC.1/motives-mod-adequate-relation: the category `M_k(I)` of motives modulo `I` with
coefficients in `F`, the Karoubi envelope of `CorrTwMod`. -/
abbrev MotiveMod : Type _ := Idempotents.Karoubi (CorrTwMod F A)

/-- `M_k(I)` is the Karoubi envelope of the quotient of `C_k ⊗ F` by the ideal of
correspondences with classes in `I`; with this file's definition this is an identity. -/
def MotiveMod.quotientKaroubi : MotiveMod F A ≌ Idempotents.Karoubi (CorrTwMod F A) :=
  CategoryTheory.Equivalence.refl

/-- Idempotents split in `M_k(I)`. -/
instance MotiveMod.pseudoAbelian : IsIdempotentComplete (MotiveMod F A) := inferInstance

/-- The tensor structure `(X, p, m) ⊗ (Y, q, n) = (X × Y, p ⊗ q, m + n)` on `M_k(I)`, symmetric,
with unit `(Spec k, id, 0)`. -/
instance MotiveMod.tensor : MonoidalCategory (MotiveMod F A) := sorry

instance MotiveMod.symmetricCategory : SymmetricCategory (MotiveMod F A) := sorry

/-- The object `(X, [Δ], m)` of `M_k(I)`. -/
def MotiveMod.ofPair (X : SmProj k) (m : ℤ) : MotiveMod F A :=
  (Idempotents.toKaroubi _).obj ⟨X, m⟩

/-- Transport of correspondences modulo `I` along an equality of degrees. -/
def CorrMod.cast {X Y : SmProj k} {r s : ℤ} (h : r = s) :
    CorrMod F A X Y r ≃ₗ[F] CorrMod F A X Y s :=
  h ▸ LinearEquiv.refl F _

/-- The transpose modulo `I`, induced from `Corr.transpose`, for `X`, `Y` equidimensional of
dimensions `d` and `e`. -/
def CorrMod.transpose {X Y : SmProj k} {d e : ℕ} (_hX : X.IsEquidim d) (_hY : Y.IsEquidim e)
    (r : ℤ) : CorrMod F A X Y r →ₗ[F] CorrMod F A Y X (d - e + r) :=
  sorry

/-- The tensor product of correspondences modulo `I`, induced from `Corr.tensorHom`. -/
def CorrMod.tensor {X X' Y Y' : SmProj k} {r r' : ℤ} :
    CorrMod F A X Y r →ₗ[F] CorrMod F A X' Y' r' →ₗ[F] CorrMod F A (X.prod X') (Y.prod Y') (r + r') :=
  sorry

/-- The internal Hom object `(X × Y, pᵗ ⊗ q, d - m + n)` from `M = (X, p, m)` to `N = (Y, q, n)`,
for `X` equidimensional of dimension `d`. -/
def MotiveMod.internalHomObj (M N : MotiveMod F A) {d : ℕ} (hX : M.X.obj.IsEquidim d) :
    MotiveMod F A where
  X := ⟨M.X.obj.prod N.X.obj, d - M.X.twist + N.X.twist⟩
  p := CorrMod.cast F A (by ring)
    (CorrMod.tensor F A (CorrMod.transpose F A hX hX _ M.p) N.p)
  idem := sorry

/-- MC.1/motives-mod-adequate-relation, rigidity: for `M = (X, p, m)` with `X` irreducible of
dimension `d` and `N = (Y, q, n)`, the internal Hom from `M` to `N` is
`(X × Y, pᵗ ⊗ q, d - m + n)`: morphisms `L ⊗ M ⟶ N` are morphisms `L ⟶ (X × Y, pᵗ ⊗ q, d - m + n)`,
naturally in `L`. -/
theorem MotiveMod.internalHom (M N : MotiveMod F A) {d : ℕ} (hX : M.X.obj.IsEquidim d)
    (hirr : IrreducibleSpace M.X.obj.toScheme) :
    ∃ e : ∀ L : MotiveMod F A, (L ⊗ M ⟶ N) ≃ (L ⟶ MotiveMod.internalHomObj F A M N hX),
      ∀ {L L' : MotiveMod F A} (g : L' ⟶ L) (f : L ⊗ M ⟶ N), e L' ((g ▷ M) ≫ f) = g ≫ e L f := by
  sorry

/-- `M_k(I)` is right rigid (every object has a dual in Mathlib's convention, a left dual in the
Stacks Project's), for every adequate relation. -/
instance MotiveMod.rightRigid : RightRigidCategory (MotiveMod F A) := sorry

/-- Being symmetric and right rigid, `M_k(I)` is rigid. -/
instance MotiveMod.rigid : RigidCategory (MotiveMod F A) :=
  BraidedCategory.rigidCategoryOfRightRigidCategory

/-- For rational equivalence and `F = ℚ`, `M_k(I)` is the category of Chow motives, with the same
tensor structure. -/
def MotiveMod.of_rat : MotiveMod ℚ (Adequate.rat C ℚ) ≌ Motive C :=
  sorry

/-- For `I ≤ I'`, reduction modulo `I'` is a full `F`-linear symmetric monoidal functor
`M_k(I) ⥤ M_k(I')`, `(X, p, m) ↦ (X, p mod I', m)`; it need not be essentially surjective. -/
def MotiveMod.map_le {A A' : Adequate C F} (h : A ≤ A') : MotiveMod F A ⥤ MotiveMod F A' where
  obj M := ⟨⟨M.X.obj, M.X.twist⟩, CorrMod.reduce F A h M.p, sorry⟩
  map f := ⟨CorrMod.reduce F A h f.f, sorry⟩
  map_id := sorry
  map_comp := sorry

instance {A A' : Adequate C F} (h : A ≤ A') : (MotiveMod.map_le F h).Full := sorry

instance {A A' : Adequate C F} (h : A ≤ A') : (MotiveMod.map_le F h).Braided := sorry

end MotiveMod

/-! ### Unit tests of MC.1/motives-mod-adequate-relation -/

section Tests

variable (F : Type*) [Field F] [CharZero F]

/-- Unit test `rational_case`: for `I = 0` and `F = ℚ`, `M_k(I)` is the category of Chow motives. -/
example : Nonempty (MotiveMod ℚ (Adequate.rat C ℚ) ≌ Motive C) :=
  ⟨MotiveMod.of_rat⟩

/-- Unit test `rigid_for_every_relation`: the internal Hom formula makes `M_k(I)` rigid for every
adequate relation. -/
example (A : Adequate C F) : Nonempty (RigidCategory (MotiveMod F A)) :=
  ⟨inferInstance⟩

/-- Unit test `trivial_relation_zero_category`: for the trivial relation every morphism group of
`M_k(I)` is zero. -/
example (M N : MotiveMod F (Adequate.trivial C F)) : Subsingleton (M ⟶ N) := by
  sorry

/-- Unit test `endomorphisms_of_the_unit`: `End(𝟙) = F` for every adequate relation other than the
trivial one, and `0` for the trivial one. -/
example (A : Adequate C F) :
    (A ≠ Adequate.trivial C F → Nonempty (End (𝟙_ (MotiveMod F A)) ≃ₐ[F] F)) ∧
      Subsingleton (End (𝟙_ (MotiveMod F (Adequate.trivial C F)))) := by
  sorry

end Tests

end MC1

section MC2

open CategoryTheory AlgebraicGeometry Limits TensorProduct MonoidalCategory Opposite

/-! ## MC.2 Realizations and cycle-class compatibility

### MC.2/graded-vector-spaces-koszul

`GradedVect F` is a type synonym for Mathlib's `GradedObject ℤ (ModuleCat F)`, so that it can
carry its own symmetric structure with the Koszul sign; Mathlib's `GradedObject.symmetricCategory`
is the unsigned one and is not used. `F[n]` sits in degree `-n`. -/

section GradedVect

variable (F : Type v) [Field F]

/-- The hypotheses of Mathlib's monoidal structure on graded objects hold for modules over a
field: the relevant coproducts exist and the tensor product commutes with them. -/
instance GradedVect.hasTensor (X₁ X₂ : GradedObject ℤ (ModuleCat.{v} F)) :
    GradedObject.HasTensor X₁ X₂ := sorry

instance GradedVect.hasGoodTensor₁₂Tensor (X₁ X₂ X₃ : GradedObject ℤ (ModuleCat.{v} F)) :
    GradedObject.HasGoodTensor₁₂Tensor X₁ X₂ X₃ := sorry

instance GradedVect.hasGoodTensorTensor₂₃ (X₁ X₂ X₃ : GradedObject ℤ (ModuleCat.{v} F)) :
    GradedObject.HasGoodTensorTensor₂₃ X₁ X₂ X₃ := sorry

instance GradedVect.hasTensor₄ObjExt (X₁ X₂ X₃ X₄ : GradedObject ℤ (ModuleCat.{v} F)) :
    GradedObject.HasTensor₄ObjExt X₁ X₂ X₃ X₄ := sorry

/-- MC.2/graded-vector-spaces-koszul: `ℤ`-graded `F`-vector spaces, with Mathlib's tensor product
of graded objects and the Koszul commutativity constraint. -/
def GradedVect : Type (v + 1) := GradedObject ℤ (ModuleCat.{v} F)

namespace GradedVect

variable {F}

/-- The underlying graded object. -/
abbrev toGradedObject (V : GradedVect F) : GradedObject ℤ (ModuleCat.{v} F) := V

variable (F)

instance category : Category (GradedVect F) :=
  inferInstanceAs (Category (GradedObject ℤ (ModuleCat.{v} F)))

instance preadditive : Preadditive (GradedVect F) where
  homGroup V W := inferInstanceAs (AddCommGroup (∀ i, V.toGradedObject i ⟶ W.toGradedObject i))
  add_comp := sorry
  comp_add := sorry

/-- The `F`-linear structure, with composition bilinear. -/
instance linear : Linear F (GradedVect F) where
  homModule V W := inferInstanceAs (Module F (∀ i, V.toGradedObject i ⟶ W.toGradedObject i))
  smul_comp := sorry
  comp_smul := sorry

/-- The `ℚ`-linear structure, by restriction of scalars when `F` has characteristic zero. -/
instance linearRat [CharZero F] : Linear ℚ (GradedVect F) where
  homModule V W := Module.compHom _ (algebraMap ℚ F)
  smul_comp := sorry
  comp_smul := sorry

instance monoidalCategory : MonoidalCategory (GradedVect F) :=
  inferInstanceAs (MonoidalCategory (GradedObject ℤ (ModuleCat.{v} F)))

/-- The Koszul commutativity constraint `v ⊗ w ↦ (-1)^{pq} w ⊗ v`, which makes `GradedVect F` a
symmetric monoidal category (a different one from Mathlib's unsigned `GradedObject`
braiding). -/
instance symmetricCategory : SymmetricCategory (GradedVect F) := sorry

instance monoidalPreadditive : MonoidalPreadditive (GradedVect F) := sorry

instance monoidalLinear : MonoidalLinear F (GradedVect F) := sorry

variable {F}

/-- The inclusion `V_p ⊗ W_q ⟶ (V ⊗ W)_n` for `p + q = n`. -/
def ιTensor (V W : GradedVect F) (p q n : ℤ) (h : p + q = n) :
    V.toGradedObject p ⊗ W.toGradedObject q ⟶ (V ⊗ W).toGradedObject n :=
  GradedObject.Monoidal.ιTensorObj V.toGradedObject W.toGradedObject p q n h

/-- The constraint sends `v ⊗ w` with `v` of degree `p` and `w` of degree `q` to
`(-1)^{pq} w ⊗ v`. -/
@[simp] theorem braiding_apply (V W : GradedVect F) (p q n : ℤ) (h : p + q = n) :
    ιTensor V W p q n h ≫ (β_ V W).hom n =
      (((-1 : ℤˣ) ^ (p * q) : ℤˣ) : ℤ) •
        ((β_ (V.toGradedObject p) (W.toGradedObject q)).hom ≫ ιTensor W V q p n (by omega)) := by
  sorry

variable (F) in
/-- `F[n]`: the graded vector space with `F` in degree `-n` and zero elsewhere. -/
def shift (n : ℤ) : GradedVect F := (GradedObject.single (-n)).obj (ModuleCat.of F F)

/-- `F[n] ⊗ F[m] ≅ F[n + m]`, compatibly with the associativity isomorphisms. -/
def shift_tensor (n m : ℤ) : shift F n ⊗ shift F m ≅ shift F (n + m) :=
  sorry

/-- `V` has a (Mathlib right, Stacks left) dual iff its total dimension is finite; the pairing is
then perfect in each degree. -/
theorem exactPairing_iff (V : GradedVect F) :
    (∃ W : GradedVect F, Nonempty (ExactPairing V W)) ↔
      (∀ i, FiniteDimensional F (V.toGradedObject i)) ∧
        Set.Finite {i | Nontrivial (V.toGradedObject i)} := by
  sorry

/-- `V` is invertible iff `V ≅ F[n]` for some `n`. -/
theorem invertible_iff (V : GradedVect F) :
    (∃ W : GradedVect F, Nonempty (V ⊗ W ≅ 𝟙_ (GradedVect F))) ↔
      ∃ n : ℤ, Nonempty (V ≅ shift F n) := by
  sorry

variable (F) in
/-- The fully faithful functor to cochain complexes of `F`-modules, onto the complexes with zero
differential. Its compatibility with the Koszul-braided structure on cochain complexes
(Tau Ceti's `TauCeti.koszulSymmetricCategory`) is not stated: Tau Ceti is not imported here. -/
def toCochainComplex : GradedVect F ⥤ CochainComplex (ModuleCat.{v} F) ℤ :=
  sorry

instance : (toCochainComplex F).Full := sorry

instance : (toCochainComplex F).Faithful := sorry

/-- The essential image of `toCochainComplex` is the complexes with zero differential. -/
theorem toCochainComplex_essImage (K : CochainComplex (ModuleCat.{v} F) ℤ) :
    (toCochainComplex F).essImage K ↔ ∀ i j, K.d i j = 0 := by
  sorry

end GradedVect

/-! ### Unit tests of MC.2/graded-vector-spaces-koszul -/

section Tests

variable {F}

/-- Unit test `GradedVect.braiding_odd`: on `F[-1] ⊗ F[-1]` the constraint is `-1` (Mathlib's
unsigned braiding of graded objects would be the identity there). -/
example : (β_ (GradedVect.shift F (-1)) (GradedVect.shift F (-1))).hom = -𝟙 _ := by
  sorry

/-- Unit test `GradedVect.shift_degree`: `F[2]` is nonzero exactly in degree `-2`, and
`F[2] ⊗ F[-2] ≅ 𝟙`. -/
example : (∀ i : ℤ, i ≠ -2 → Subsingleton ((GradedVect.shift F 2).toGradedObject i)) ∧
    Nontrivial ((GradedVect.shift F 2).toGradedObject (-2)) ∧
    Nonempty (GradedVect.shift F 2 ⊗ GradedVect.shift F (-2) ≅ 𝟙_ (GradedVect F)) := by
  sorry

/-- Unit test `GradedVect.no_dual_infinite`: the graded vector space with `F` in every
nonnegative degree has no dual. -/
example : ¬ ∃ W : GradedVect F, Nonempty (ExactPairing
    (show GradedVect F from fun i => if 0 ≤ i then ModuleCat.of F F else ModuleCat.of F PUnit) W) := by
  sorry

/-- Unit test `GradedVect.unit_end`: the unit is `F[0]` and its endomorphism algebra is `F`. -/
example : Nonempty (𝟙_ (GradedVect F) ≅ GradedVect.shift F 0) ∧
    Nonempty (End (𝟙_ (GradedVect F)) ≃ₐ[F] F) := by
  sorry

end Tests

end GradedVect

/-! ### Smooth projective varieties -/

variable (k : Type u) [Field k]

/-- A smooth proper variety over `k` (MC.2/weil-cohomology-data: a variety is irreducible, here
geometrically, of a well defined dimension). -/
structure SmVar where
  /-- The underlying smooth proper scheme. -/
  obj : SmProj k
  /-- Its dimension. -/
  dim : ℕ
  isVariety : obj.IsVariety
  equidim : obj.IsEquidim dim

namespace SmVar

variable {k}

instance category : Category (SmVar k) :=
  inferInstanceAs (Category (InducedCategory (SmProj k) SmVar.obj))

/-- A morphism of the underlying schemes is a morphism of varieties. -/
def homMk {X Y : SmVar k} (f : X.obj ⟶ Y.obj) : X ⟶ Y := InducedCategory.homMk f

variable (k) in
/-- `Spec k`, of dimension zero. -/
def point : SmVar k := ⟨SmProj.point k, 0, sorry, sorry⟩

/-- The product of two varieties. -/
def prod (X Y : SmVar k) : SmVar k := ⟨X.obj.prod Y.obj, X.dim + Y.dim, sorry, sorry⟩

/-- The first projection. -/
def fst (X Y : SmVar k) : X.prod Y ⟶ X := homMk (SmProj.fst X.obj Y.obj)

/-- The second projection. -/
def snd (X Y : SmVar k) : X.prod Y ⟶ Y := homMk (SmProj.snd X.obj Y.obj)

/-- The diagonal. -/
def diag (X : SmVar k) : X ⟶ X.prod X := homMk (SmProj.diag X.obj)

/-- The structure morphism. -/
def toPoint (X : SmVar k) : X ⟶ point k := homMk X.obj.toPoint

variable (k) in
/-- The projective line. -/
def projectiveLine : SmVar k := ⟨SmProj.projectiveLine k, 1, sorry, sorry⟩

end SmVar

/-! ### MC.2/weil-cohomology-data -/

variable {k} (C : ChowTheory k) (F : Type v) [Field F]

/-- MC.2/weil-cohomology-data: the data (D1), (D2), (D3) of a Weil cohomology theory over the
algebraically closed field `k` with coefficients in the field `F` of characteristic zero. (D1) is
a contravariant functor `X ↦ H^*(X)` to `F`-algebras, graded by `ℤ` and graded commutative with the
Koszul sign; (D2) is the cycle class map on the integral Chow groups of SF.5, doubling the degree;
(D3) is the `F`-linear trace, here extended by zero from `H^{2 dim X}(X)` to `H^*(X)`. -/
structure WeilData [IsAlgClosed k] [CharZero F] where
  /-- (D1) `X ↦ H^*(X)`, contravariant, with pullback `f^*` an `F`-algebra homomorphism. -/
  H : (SmVar k)ᵒᵖ ⥤ AlgCat.{v} F
  /-- (D1) The grading `H^*(X) = ⨁ H^i(X)`. -/
  grading : ∀ X : SmVar k, ℤ → Submodule F (H.obj (op X))
  [gradedAlgebra : ∀ X, GradedAlgebra (grading X)]
  /-- (D1) Pullback preserves degrees. -/
  pullback_grading : ∀ {X Y : SmVar k} (f : X ⟶ Y) (i : ℤ),
    (grading Y i).map (H.map f.op).hom.toLinearMap ≤ grading X i
  /-- (D1) Graded commutativity: `a ∪ b = (-1)^{ij} b ∪ a` for `a ∈ H^i`, `b ∈ H^j`. -/
  gradedComm : ∀ (X : SmVar k) (i j : ℤ) (a b : H.obj (op X)), a ∈ grading X i →
    b ∈ grading X j → a * b = (((-1 : ℤˣ) ^ (i * j) : ℤˣ) : ℤ) • (b * a)
  /-- (D2) The cycle class map on all of `CH(X)`. -/
  cycleMap : ∀ X : SmVar k, C.CH X.obj →+ H.obj (op X)
  /-- (D2) It sends `CH^i(X)` into `H^{2i}(X)`. -/
  cycleMap_grading : ∀ (X : SmVar k) (i : ℤ), ∀ a ∈ C.codim X.obj i, cycleMap X a ∈ grading X (2 * i)
  /-- (D3) The trace, extended by zero outside degree `2 dim X`. -/
  traceMap : ∀ X : SmVar k, H.obj (op X) →ₗ[F] F
  traceMap_grading : ∀ (X : SmVar k) (i : ℤ), i ≠ 2 * X.dim → ∀ a ∈ grading X i, traceMap X a = 0

attribute [instance] WeilData.gradedAlgebra

namespace WeilData

variable {C F} [IsAlgClosed k] [CharZero F] (W : WeilData C F)

/-- The pullback `f^* : H^*(Y) → H^*(X)` along `f : X ⟶ Y`, a homomorphism of graded
`F`-algebras. -/
def pullback {X Y : SmVar k} (f : X ⟶ Y) : W.H.obj (op Y) →ₐ[F] W.H.obj (op X) :=
  (W.H.map f.op).hom

theorem pullback_id (X : SmVar k) : W.pullback (𝟙 X) = AlgHom.id F _ := by
  sorry

/-- `(g ∘ f)^* = f^* ∘ g^*`. -/
theorem pullback_comp {X Y Z : SmVar k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    W.pullback (f ≫ g) = (W.pullback f).comp (W.pullback g) := by
  sorry

/-- The cup product, the multiplication of `H^*(X)`, with unit `1 ∈ H^0(X)`. -/
def cup (X : SmVar k) : W.H.obj (op X) →ₗ[F] W.H.obj (op X) →ₗ[F] W.H.obj (op X) :=
  LinearMap.mul F _

/-- `a ∪ b = (-1)^{ij} b ∪ a` for `a ∈ H^i(X)`, `b ∈ H^j(X)`. -/
theorem cup_comm (X : SmVar k) {i j : ℤ} {a b : W.H.obj (op X)} (ha : a ∈ W.grading X i)
    (hb : b ∈ W.grading X j) :
    W.cup X a b = (((-1 : ℤˣ) ^ (i * j) : ℤˣ) : ℤ) • W.cup X b a :=
  W.gradedComm X i j a b ha hb

/-- `f^*(a ∪ b) = f^*a ∪ f^*b` and `f^*1 = 1`. -/
@[simp] theorem pullback_cup {X Y : SmVar k} (f : X ⟶ Y) (a b : W.H.obj (op Y)) :
    W.pullback f (W.cup Y a b) = W.cup X (W.pullback f a) (W.pullback f b) ∧ W.pullback f 1 = 1 :=
  ⟨map_mul _ a b, map_one _⟩

/-- The cycle class map `γ : CH^i(X) → H^{2i}(X)`. -/
def cycleClass (X : SmVar k) (i : ℤ) : C.codim X.obj i →+ W.grading X (2 * i) where
  toFun a := ⟨W.cycleMap X a, W.cycleMap_grading X i a a.2⟩
  map_zero' := sorry
  map_add' := sorry

/-- `γ(α + β) = γ(α) + γ(β)` and `γ(0) = 0`. -/
@[simp] theorem cycleClass_add (X : SmVar k) (i : ℤ) (a b : C.codim X.obj i) :
    W.cycleClass X i (a + b) = W.cycleClass X i a + W.cycleClass X i b ∧ W.cycleClass X i 0 = 0 :=
  ⟨map_add _ a b, map_zero _⟩

/-- The trace `∫_X : H^{2d}(X) → F` for `X` of dimension `d`. -/
def trace (X : SmVar k) : W.grading X (2 * X.dim) →ₗ[F] F :=
  W.traceMap X ∘ₗ (W.grading X _).subtype

/-- The projection of `H^*(X)` onto `H^i(X)`. -/
def gradeProj (X : SmVar k) (i : ℤ) : W.H.obj (op X) →ₗ[F] W.grading X i :=
  (DirectSum.component F ℤ (fun j => W.grading X j) i) ∘ₗ
    (DirectSum.decomposeLinearEquiv (W.grading X)).toLinearMap

/-- `Tr_i(φ)`: the trace of the degree `i` part of an endomorphism `φ` of `H^*(X)`. -/
def degreeTrace (X : SmVar k) (i : ℤ) (φ : W.H.obj (op X) →ₗ[F] W.H.obj (op X)) : F :=
  LinearMap.trace F _ (W.gradeProj X i ∘ₗ φ ∘ₗ (W.grading X i).subtype)

/-- The Poincaré pairing `H^i(X) × H^{2d-i}(X) → F`, `(a, b) ↦ ∫_X a ∪ b`. -/
def poincarePairing (X : SmVar k) (i : ℤ) :
    W.grading X i →ₗ[F] W.grading X (2 * X.dim - i) →ₗ[F] F :=
  LinearMap.mk₂ F (fun a b => W.traceMap X ((a : W.H.obj (op X)) * b)) sorry sorry sorry sorry

/-- The Künneth map `H^*(X) ⊗ H^*(Y) → H^*(X × Y)`, `a ⊗ b ↦ pr₁^*a ∪ pr₂^*b`. -/
def kunnethMap (X Y : SmVar k) :
    W.H.obj (op X) ⊗[F] W.H.obj (op Y) →ₗ[F] W.H.obj (op (X.prod Y)) :=
  TensorProduct.lift ((LinearMap.mul F _).compl₁₂ (W.pullback (SmVar.fst X Y)).toLinearMap
    (W.pullback (SmVar.snd X Y)).toLinearMap)

/-! #### The axioms of MC.2/classical-weil-cohomology, one `Prop` each -/

/-- (A)(a): each `H^i(X)` is finite-dimensional. -/
def AxFinite : Prop := ∀ (X : SmVar k) (i : ℤ), FiniteDimensional F (W.grading X i)

/-- (A)(b): cup product followed by `∫_X` is a perfect pairing `H^i(X) × H^{2d-i}(X) → F`. -/
def AxPoincare : Prop := ∀ (X : SmVar k) (i : ℤ), (W.poincarePairing X i).IsPerfPair

/-- (A)(c): `H^i(X) = 0` unless `0 ≤ i ≤ 2d`. -/
def AxVanishing : Prop :=
  ∀ (X : SmVar k) (i : ℤ), i < 0 ∨ 2 * (X.dim : ℤ) < i → W.grading X i = ⊥

/-- (A)(d): `∫_X : H^{2d}(X) → F` is bijective. -/
def AxTraceBijective : Prop := ∀ X : SmVar k, Function.Bijective (W.trace X)

/-- (B): the Künneth map is an isomorphism. -/
def AxKunneth : Prop := ∀ X Y : SmVar k, Function.Bijective (W.kunnethMap X Y)

/-- (C)(a): `γ(f^!β) = f^*γ(β)`. -/
def AxGysin : Prop := ∀ {X Y : SmVar k} (f : X ⟶ Y) (β : C.CH Y.obj),
  W.cycleMap X (C.pullback f.hom β) = W.pullback f (W.cycleMap Y β)

/-- (C)(b): `γ(f_*α) = f_*γ(α)`, stated through the pairing that defines the cohomological
pushforward: `∫_Y b ∪ γ(f_*α) = ∫_X f^*b ∪ γ(α)` for every `b`. -/
def AxPushforward : Prop := ∀ {X Y : SmVar k} (f : X ⟶ Y) (α : C.CH X.obj) (b : W.H.obj (op Y)),
  W.traceMap Y (b * W.cycleMap Y (C.pushforward f.hom α)) =
    W.traceMap X (W.pullback f b * W.cycleMap X α)

/-- (C)(c): `γ(α · β) = γ(α) ∪ γ(β)`. -/
def AxMul : Prop := ∀ (X : SmVar k) (a b : C.CH X.obj),
  W.cycleMap X (a * b) = W.cycleMap X a * W.cycleMap X b

/-- (C)(d): `∫_{Spec k} γ([Spec k]) = 1`. -/
def AxNormalisation : Prop := W.traceMap (SmVar.point k) (W.cycleMap _ 1) = 1

/-- The axioms (A), (B), (C) of a classical Weil cohomology theory. -/
structure IsWeil : Prop where
  finiteDimensional : W.AxFinite
  poincare_perfect : W.AxPoincare
  vanishing : W.AxVanishing
  trace_bijective : W.AxTraceBijective
  kunneth : W.AxKunneth
  cycleClass_gysin : W.AxGysin
  cycleClass_pushforward : W.AxPushforward
  cycleClass_mul : W.AxMul
  trace_point : W.AxNormalisation

/-- The data with every trace multiplied by `c`. -/
def scaleTrace (c : F) : WeilData C F :=
  { W with traceMap := fun X => c • W.traceMap X
           traceMap_grading := sorry }

/-- An isomorphism of Weil data: a natural isomorphism of the cohomology functors respecting the
gradings, the cycle classes and the traces. -/
structure Iso (W' : WeilData C F) where
  /-- The natural isomorphism. -/
  e : W.H ≅ W'.H
  grading : ∀ X i, (W.grading X i).map (e.hom.app (op X)).hom.toLinearMap = W'.grading X i
  cycleMap : ∀ X a, (e.hom.app (op X)).hom (W.cycleMap X a) = W'.cycleMap X a
  traceMap : ∀ X a, W'.traceMap X ((e.hom.app (op X)).hom a) = W.traceMap X a

end WeilData

/-! ### Unit tests of MC.2/weil-cohomology-data -/

section Tests

variable {C F} [IsAlgClosed k] [CharZero F] (W : WeilData C F)

/-- Unit test `WeilData.cup_comm_odd`: for `a ∈ H^1(X)`, `a ∪ a = -(a ∪ a)`, so `a ∪ a = 0` in
characteristic zero. -/
example (X : SmVar k) (a : W.H.obj (op X)) (ha : a ∈ W.grading X 1) :
    W.cup X a a = -W.cup X a a ∧ W.cup X a a = 0 := by
  sorry

/-- Unit test `WeilData.pullback_functor`: `id^* = id` and `(g ∘ f)^* = f^* ∘ g^*`. -/
example {X Y Z : SmVar k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    W.pullback (𝟙 X) = AlgHom.id F _ ∧ W.pullback (f ≫ g) = (W.pullback f).comp (W.pullback g) :=
  ⟨W.pullback_id X, W.pullback_comp f g⟩

/-- Unit test `WeilData.cycleClass_hom`: `γ(0) = 0` and `γ(α + β) = γ(α) + γ(β)`. -/
example (X : SmVar k) (i : ℤ) (a b : C.codim X.obj i) :
    W.cycleClass X i 0 = 0 ∧ W.cycleClass X i (a + b) = W.cycleClass X i a + W.cycleClass X i b :=
  ⟨map_zero _, map_add _ a b⟩

/-- Unit test `WeilData.cycleClass_point_degree`: for a closed (hence rational) point `x` of a
curve, `γ([x]) ∈ H^2` and not in `H^1` unless it vanishes. -/
example (X : SmVar k) (hX : X.dim = 1) (x : X.obj.RatPoint) :
    W.cycleMap X (C.pushforward x 1) ∈ W.grading X 2 ∧
      (W.cycleMap X (C.pushforward x 1) ∈ W.grading X 1 → W.cycleMap X (C.pushforward x 1) = 0) := by
  sorry

/-- Unit test `WeilData.trace_point`: for `Spec k`, of dimension zero, the trace only sees
`H^0`. -/
example : (SmVar.point k).dim = 0 ∧
    ∀ i : ℤ, i ≠ 0 → ∀ a ∈ W.grading (SmVar.point k) i, W.traceMap _ a = 0 := by
  sorry

end Tests

/-! ### MC.2/classical-weil-cohomology -/

/-- MC.2/classical-weil-cohomology: Weil data satisfying (A), (B) and (C), bundled. -/
def WeilCohomology [IsAlgClosed k] [CharZero F] : Type _ := {W : WeilData C F // W.IsWeil}

namespace WeilCohomology

variable {C F} [IsAlgClosed k] [CharZero F] (H : WeilCohomology C F)

/-- The underlying data. -/
def toWeilData : WeilData C F := H.1

/-- (A)(a): each `H^i(X)` is finite-dimensional. -/
theorem finiteDimensional : H.toWeilData.AxFinite := H.2.finiteDimensional

/-- (A)(b): the Poincaré pairing is perfect. -/
theorem poincare_perfect : H.toWeilData.AxPoincare := H.2.poincare_perfect

/-- (A)(c): `H^i(X) = 0` unless `0 ≤ i ≤ 2d`. -/
theorem vanishing : H.toWeilData.AxVanishing := H.2.vanishing

/-- (A)(d): the trace is bijective. -/
theorem trace_bijective : H.toWeilData.AxTraceBijective := H.2.trace_bijective

/-- (B): the Künneth map is an isomorphism. -/
theorem kunneth : H.toWeilData.AxKunneth := H.2.kunneth

/-- (C)(a): `γ(f^!β) = f^*γ(β)`. -/
theorem cycleClass_gysin : H.toWeilData.AxGysin := H.2.cycleClass_gysin

/-- (C)(b): `γ(f_*α) = f_*γ(α)`. -/
theorem cycleClass_pushforward : H.toWeilData.AxPushforward := H.2.cycleClass_pushforward

/-- (C)(c): `γ(α · β) = γ(α) ∪ γ(β)`. -/
theorem cycleClass_mul : H.toWeilData.AxMul := H.2.cycleClass_mul

/-- (C)(d): `∫_{Spec k} γ([Spec k]) = 1`. -/
@[simp] theorem trace_point : H.toWeilData.AxNormalisation := H.2.trace_point

/-- Remark 0FGU: `γ(α × β) = pr₁^*γ(α) ∪ pr₂^*γ(β)`. -/
theorem cycleClass_exterior (X Y : SmVar k) (a : C.CH X.obj) (b : C.CH Y.obj) :
    H.toWeilData.cycleMap (X.prod Y)
        (C.pullback (SmProj.fst X.obj Y.obj) a * C.pullback (SmProj.snd X.obj Y.obj) b) =
      H.toWeilData.pullback (SmVar.fst X Y) (H.toWeilData.cycleMap X a) *
        H.toWeilData.pullback (SmVar.snd X Y) (H.toWeilData.cycleMap Y b) := by
  sorry

/-- `H^0(X)` is one-dimensional, by (A)(b) and (A)(d). -/
@[simp] theorem finrank_H0 (X : SmVar k) : Module.finrank F (H.toWeilData.grading X 0) = 1 := by
  sorry

/-! ### MC.2/weil-pushforward -/

/-- The cohomological pushforward `f_* : H^{2d-i}(X) → H^{2e-i}(Y)` along `f : X ⟶ Y`, the
contragredient of `f^*` under the Poincaré pairings (only axiom (A) is used). -/
def pushforward {X Y : SmVar k} (f : X ⟶ Y) :
    H.toWeilData.H.obj (op X) →ₗ[F] H.toWeilData.H.obj (op Y) :=
  sorry

/-- `∫_X f^*b ∪ a = ∫_Y b ∪ f_*a`. -/
theorem pushforward_spec {X Y : SmVar k} (f : X ⟶ Y) (a : H.toWeilData.H.obj (op X))
    (b : H.toWeilData.H.obj (op Y)) :
    H.toWeilData.traceMap X (H.toWeilData.pullback f b * a) =
      H.toWeilData.traceMap Y (b * H.pushforward f a) := by
  sorry

/-- `f_*` is `F`-linear, and maps `H^{2d-i}(X)` to `H^{2e-i}(Y)`. -/
theorem pushforward_linear {X Y : SmVar k} (f : X ⟶ Y) (c : F) (a a' : H.toWeilData.H.obj (op X))
    (i : ℤ) :
    H.pushforward f (c • a + a') = c • H.pushforward f a + H.pushforward f a' ∧
      (H.toWeilData.grading X (2 * X.dim - i)).map (H.pushforward f) ≤
        H.toWeilData.grading Y (2 * Y.dim - i) := by
  sorry

/-- The projection formula `f_*(f^*b ∪ a) = b ∪ f_*a`. -/
theorem projection_formula {X Y : SmVar k} (f : X ⟶ Y) (a : H.toWeilData.H.obj (op X))
    (b : H.toWeilData.H.obj (op Y)) :
    H.pushforward f (H.toWeilData.pullback f b * a) = b * H.pushforward f a := by
  sorry

@[simp] theorem pushforward_id (X : SmVar k) : H.pushforward (𝟙 X) = LinearMap.id := by
  sorry

/-- `g_* ∘ f_* = (g ∘ f)_*`. -/
theorem pushforward_comp {X Y Z : SmVar k} (f : X ⟶ Y) (g : Y ⟶ Z) :
    H.pushforward g ∘ₗ H.pushforward f = H.pushforward (f ≫ g) := by
  sorry

/-- For `p : X ⟶ Spec k`, `∫_{Spec k} p_*a = ∫_X a`. -/
theorem pushforward_toPoint (X : SmVar k) (a : H.toWeilData.H.obj (op X)) :
    H.toWeilData.traceMap _ (H.pushforward X.toPoint a) = H.toWeilData.traceMap X a := by
  sorry

end WeilCohomology

/-! ### Unit tests of MC.2/classical-weil-cohomology and MC.2/weil-pushforward -/

section Tests

variable {C F} [IsAlgClosed k] [CharZero F] (H : WeilCohomology C F)

/-- Unit test `WeilCohomology.normalisation`: `∫_{Spec k} γ([Spec k]) = 1`; the system with every
trace doubled is not a Weil cohomology theory, although it satisfies the other axioms. -/
example : H.toWeilData.traceMap (SmVar.point k) (H.toWeilData.cycleMap _ 1) = 1 ∧
    ¬ (H.toWeilData.scaleTrace 2).IsWeil ∧ (H.toWeilData.scaleTrace 2).AxFinite ∧
    (H.toWeilData.scaleTrace 2).AxPoincare ∧ (H.toWeilData.scaleTrace 2).AxVanishing ∧
    (H.toWeilData.scaleTrace 2).AxTraceBijective ∧ (H.toWeilData.scaleTrace 2).AxKunneth ∧
    (H.toWeilData.scaleTrace 2).AxGysin ∧ (H.toWeilData.scaleTrace 2).AxPushforward ∧
    (H.toWeilData.scaleTrace 2).AxMul := by
  sorry

/-- Unit test `WeilCohomology.not_weird`: data with `H^{-1}(E) ≠ 0` for some curve `E` (as for
the Hodge cohomology of Stacks Example 0FHZ regraded by `n = 3p - q`, whose construction needs
Hodge cohomology over `ℂ` and is not made here) violate (A)(c), whatever they do otherwise. -/
example (W : WeilData C F) (E : SmVar k) (hE : E.dim = 1) (h : W.grading E (-1) ≠ ⊥) :
    ¬ W.IsWeil := by
  sorry

/-- Unit test `WeilCohomology.kunneth_dim`: `dim H^n(X × Y) = Σ_{p+q=n} dim H^p(X) dim H^q(Y)`;
for `X = Y = ℙ¹` this is `1, 0, 2, 0, 1` in degrees `0` to `4`. -/
example (X Y : SmVar k) (n : ℕ) :
    Module.finrank F (H.toWeilData.grading (X.prod Y) n) =
      ∑ p ∈ Finset.range (n + 1), Module.finrank F (H.toWeilData.grading X p) *
        Module.finrank F (H.toWeilData.grading Y (n - p : ℕ)) ∧
    (List.range 5).map (fun n : ℕ => Module.finrank F (H.toWeilData.grading
      ((SmVar.projectiveLine k).prod (SmVar.projectiveLine k)) n)) = [1, 0, 2, 0, 1] := by
  sorry

/-- Unit test `WeilCohomology.H0_point`: `H^*(Spec k) = H^0(Spec k)` is one-dimensional and
`∫_{Spec k}` is an isomorphism onto `F`. -/
example : Module.finrank F (H.toWeilData.grading (SmVar.point k) 0) = 1 ∧
    (∀ i : ℤ, i ≠ 0 → H.toWeilData.grading (SmVar.point k) i = ⊥) ∧
    Function.Bijective (H.toWeilData.trace (SmVar.point k)) := by
  sorry

/-- Unit test `WeilCohomology.pushforward_id_apply`: `(id_X)_*` is the identity. -/
example (X : SmVar k) (a : H.toWeilData.H.obj (op X)) : H.pushforward (𝟙 X) a = a := by
  sorry

/-- Unit test `WeilCohomology.pushforward_toPoint_curve`: for a curve `X`, `p_* : H^2(X) → H^0`
followed by `∫_{Spec k}` is `∫_X`. -/
example (X : SmVar k) (hX : X.dim = 1) (a : H.toWeilData.H.obj (op X)) (ha : a ∈ H.toWeilData.grading X 2) :
    H.pushforward X.toPoint a ∈ H.toWeilData.grading (SmVar.point k) 0 ∧
      H.toWeilData.traceMap _ (H.pushforward X.toPoint a) = H.toWeilData.traceMap X a := by
  sorry

/-- Unit test `WeilCohomology.projection_formula_holds`: `f_*(f^*b ∪ a) = b ∪ f_*a`, and a
pushforward multiplied by a scalar `c ≠ 1` violates the characterising identity. -/
example {X Y : SmVar k} (f : X ⟶ Y) (c : F) (hc : c ≠ 1) :
    (∀ a b, H.pushforward f (H.toWeilData.pullback f b * a) = b * H.pushforward f a) ∧
      ¬ ∀ a b, H.toWeilData.traceMap X (H.toWeilData.pullback f b * a) =
        H.toWeilData.traceMap Y (b * (c • H.pushforward f a)) := by
  sorry

end Tests

/-! ### The theorems of MC.2 on a classical Weil cohomology theory -/

namespace WeilCohomology

variable {C F} [IsAlgClosed k] [CharZero F] (H : WeilCohomology C F)

/-- MC.2/cycle-class-degree: `∫_X γ(α) = deg(α)` for a zero cycle `α ∈ CH^d(X) = CH_0(X)`. -/
theorem trace_cycleClass (X : SmVar k) (a : C.CH X.obj) (ha : a ∈ C.codim X.obj X.dim) :
    H.toWeilData.traceMap X (H.toWeilData.cycleMap X a) = (C.deg X.obj a : F) := by
  sorry

/-- MC.2/trace-of-a-product: `∫_{X × Y} pr₁^*a ∪ pr₂^*b = (∫_X a)(∫_Y b)`. -/
theorem trace_prod (X Y : SmVar k) (a : H.toWeilData.H.obj (op X)) (b : H.toWeilData.H.obj (op Y)) :
    H.toWeilData.traceMap (X.prod Y)
        (H.toWeilData.pullback (SmVar.fst X Y) a * H.toWeilData.pullback (SmVar.snd X Y) b) =
      H.toWeilData.traceMap X a * H.toWeilData.traceMap Y b := by
  sorry

/-- MC.2/pushforward-along-projection: `pr₂,*(pr₁^*a ∪ pr₂^*b) = (∫_X a) b`, the trace being
extended by zero outside the top degree. -/
theorem pr2_pushforward (X Y : SmVar k) (a : H.toWeilData.H.obj (op X))
    (b : H.toWeilData.H.obj (op Y)) :
    H.pushforward (SmVar.snd X Y)
        (H.toWeilData.pullback (SmVar.fst X Y) a * H.toWeilData.pullback (SmVar.snd X Y) b) =
      H.toWeilData.traceMap X a • b := by
  sorry

/-- MC.2/cycle-class-of-fundamental-class: `H^0(X)` is one-dimensional and `γ([X]) = 1`; hence
`γ(g_*[Z]) = g_*1`, in particular `γ([Δ]) = Δ_*1`. -/
theorem cycleClass_fundamental (X : SmVar k) :
    Module.finrank F (H.toWeilData.grading X 0) = 1 ∧ H.toWeilData.cycleMap X 1 = 1 ∧
      ∀ {Z W : SmVar k} (g : Z ⟶ W),
        H.toWeilData.cycleMap W (C.pushforward g.hom 1) = H.pushforward g 1 := by
  sorry

/-- MC.2/class-of-the-diagonal: if `γ([Δ]) = Σ_{i,j} pr₁^*e_{i,j} ∪ pr₂^*e'_{i,j}` with
`(e_{i,j})_j` a basis of `H^i(X)` and `e'_{i,j} ∈ H^{2d-i}(X)`, then
`∫_X e_{i,j} ∪ e'_{i,j'} = (-1)^i δ_{jj'}`. -/
theorem diagonal_kunneth (X : SmVar k) {ι : ℤ → Type} [∀ i, Fintype (ι i)] [∀ i, DecidableEq (ι i)]
    (e : ∀ i, Module.Basis (ι i) F (H.toWeilData.grading X i))
    (e' : ∀ i, ι i → H.toWeilData.H.obj (op X))
    (he' : ∀ i j, e' i j ∈ H.toWeilData.grading X (2 * X.dim - i))
    (hΔ : H.toWeilData.cycleMap (X.prod X) (C.pushforward (SmProj.diag X.obj) 1) =
      ∑ i ∈ Finset.Icc (0 : ℤ) (2 * X.dim), ∑ j : ι i,
        H.toWeilData.pullback (SmVar.fst X X) (e i j : H.toWeilData.H.obj (op X)) *
          H.toWeilData.pullback (SmVar.snd X X) (e' i j)) (i : ℤ) (j j' : ι i) :
    H.toWeilData.traceMap X ((e i j : H.toWeilData.H.obj (op X)) * e' i j') =
      (-1 : F) ^ i.natAbs * if j = j' then 1 else 0 := by
  sorry

/-- MC.2/euler-characteristic-self-intersection:
`Σ_i (-1)^i dim H^i(X) = deg([Δ] · [Δ]) = deg(c_d(T_X) ∩ [X])`. -/
theorem euler_eq_selfIntersection (K : ChernTheory C) (X : SmVar k) :
    (∑ i ∈ Finset.range (2 * X.dim + 1), (-1 : ℤ) ^ i *
        Module.finrank F (H.toWeilData.grading X i) : ℤ) =
      C.deg _ (C.pushforward (SmProj.diag X.obj) 1 * C.pushforward (SmProj.diag X.obj) 1) ∧
    (∑ i ∈ Finset.range (2 * X.dim + 1), (-1 : ℤ) ^ i *
        Module.finrank F (H.toWeilData.grading X i) : ℤ) =
      C.deg _ (K.chern (K.tangent X.obj) X.dim) := by
  sorry

/-- The endomorphism `φ_u : a ↦ pr₂,*(u ∪ pr₁^*a)` of `H^*(X)` attached to `u ∈ H^*(X × X)`. -/
def corrOp (X : SmVar k) (u : H.toWeilData.H.obj (op (X.prod X))) :
    H.toWeilData.H.obj (op X) →ₗ[F] H.toWeilData.H.obj (op X) :=
  H.pushforward (SmVar.snd X X) ∘ₗ LinearMap.mulLeft F u ∘ₗ
    (H.toWeilData.pullback (SmVar.fst X X)).toLinearMap

/-- MC.2/lefschetz-trace-formula: for `u ∈ H^{2d}(X × X)`,
`∫_{X×X} u ∪ γ([Δ]) = Σ_{i=0}^{2d} (-1)^i Tr(φ_u | H^i(X))`; in particular for a cycle `c` of
codimension `d` on `X × X`, `deg(c · [Δ]) = Σ_i (-1)^i Tr(φ_{γ(c)} | H^i(X))`. -/
theorem lefschetz_trace (X : SmVar k) :
    (∀ u ∈ H.toWeilData.grading (X.prod X) (2 * X.dim),
      H.toWeilData.traceMap (X.prod X)
          (u * H.toWeilData.cycleMap (X.prod X) (C.pushforward (SmProj.diag X.obj) 1)) =
        ∑ i ∈ Finset.range (2 * X.dim + 1), (-1 : F) ^ i * H.toWeilData.degreeTrace X i (H.corrOp X u)) ∧
    ∀ c ∈ C.codim (X.prod X).obj X.dim,
      (C.deg _ (c * show C.CH (X.prod X).obj from C.pushforward (SmProj.diag X.obj) 1) : F) =
        ∑ i ∈ Finset.range (2 * X.dim + 1),
          (-1 : F) ^ i * H.toWeilData.degreeTrace X i (H.corrOp X (H.toWeilData.cycleMap _ c)) := by
  sorry

end WeilCohomology

/-- MC.2/graph-duality-compatibility (Stacks 0FG8): for `f : Y ⟶ X` of equidimensional
schemes, `[Y] ∘ η_Y ∘ (a ⊗ id_Y) = [X] ∘ η_X ∘ (id_X ⊗ aᵗ)` as correspondences
`X ⊗ Y ⟶ Spec k`, with `a = [Γ_f]`. -/
theorem graph_duality {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d) (hY : Y.IsEquidim e)
    (f : Y ⟶ X) :
    Corr.toChow C _ _ _ (Corr.comp C (Corr.comp C (Corr.fundamental C hY) (Corr.graph C (SmProj.diag Y)))
        (Corr.tensorHom C (Corr.graph C f) (Corr.diagonal C Y))) =
      Corr.toChow C _ _ _ (Corr.comp C (Corr.comp C (Corr.fundamental C hX) (Corr.graph C (SmProj.diag X)))
        (Corr.tensorHom C (Corr.diagonal C X) (Corr.transpose C hX hY 0 (Corr.graph C f)))) :=
  (Corr.graph_against_diagonals hX hY f).1

/-! ### MC.2/weil-from-monoidal-functor, weil-to-monoidal-functor, realization-equivalence,
realization-round-trip -/

section Realization

variable {C F} [IsAlgClosed k] [CharZero F]

/-- The graded vector space `H^*(X)` of Weil data. -/
def WeilData.gradedObject (W : WeilData C F) (X : SmVar k) : GradedVect F :=
  fun i => ModuleCat.of F (W.grading X i)

/-- A motive morphism from a correspondence of degree zero. -/
def motive.ofCorr {X Y : SmProj k} (c : Corr C X Y 0) : motive C X ⟶ motive C Y :=
  (Idempotents.toKaroubi (CorrTw C)).map (Corr.cast C (by ring) c)

/-- The action `a ↦ pr₂,*(γ(c) ∪ pr₁^*a)` of a rational correspondence on cohomology, degreewise. -/
def WeilCohomology.corrAction (H : WeilCohomology C F) {X Y : SmVar k} (c : Corr C X.obj Y.obj 0) :
    H.toWeilData.gradedObject X ⟶ H.toWeilData.gradedObject Y :=
  sorry

variable (C F) in
/-- The data on the functor side of MC.2/realization-equivalence: a `ℚ`-linear symmetric monoidal
functor `G` from Chow motives to graded vector spaces with the Koszul constraint, an isomorphism
`F[2] ≅ G(𝟙(1))` (`F[2]` in degree `-2`), such that `G(h(X))` lives in nonnegative degrees and has
one-dimensional degree zero part for every variety `X`. -/
structure RealizationData where
  /-- The realisation functor. -/
  G : Motive C ⥤ GradedVect F
  [braided : G.Braided]
  [linear : G.Linear ℚ]
  /-- The normalisation `F[2] ≅ G(𝟙(1))`. -/
  ι : GradedVect.shift F 2 ≅ G.obj (Motive.tate C 1)
  nonneg : ∀ (X : SmVar k) (i : ℤ), i < 0 → IsZero ((G.obj (motive C X.obj)).toGradedObject i)
  dim_zero : ∀ X : SmVar k, Module.finrank F ((G.obj (motive C X.obj)).toGradedObject 0) = 1

attribute [instance] RealizationData.braided RealizationData.linear

/-- An isomorphism of realisation data: a monoidal natural isomorphism compatible with the
normalisations. -/
structure RealizationData.Iso (R R' : RealizationData C F) where
  /-- The natural isomorphism. -/
  e : R.G ≅ R'.G
  monoidal : NatTrans.IsMonoidal e.hom
  compat : R.ι.hom ≫ e.hom.app _ = R'.ι.hom

/-- MC.2/weil-from-monoidal-functor: a `ℚ`-linear symmetric monoidal `G` with `G(𝟙(1))`
concentrated in degree `-2` has `G(𝟙(1))` one-dimensional; after choosing `ι : F[2] ≅ G(𝟙(1))`,
the data `H^*(X) = G(h(X))` (cup product induced by the diagonal, cycle classes through
`CH^r(X) ⊗ ℚ = Hom(𝟙(-r), h(X))`, trace induced by `[X] : h(X)(d) ⟶ 𝟙`) satisfy all of (A), (B)
and (C) except possibly (A)(c) and (A)(d). -/
theorem weil_of_functor (G : Motive C ⥤ GradedVect F) [G.Braided] [G.Linear ℚ]
    (hG : ∀ i : ℤ, i ≠ -2 → IsZero ((G.obj (Motive.tate C 1)).toGradedObject i))
    (ι : GradedVect.shift F 2 ≅ G.obj (Motive.tate C 1)) :
    Module.finrank F ((G.obj (Motive.tate C 1)).toGradedObject (-2)) = 1 ∧
      ∃ W : WeilData C F,
        (∀ (X : SmVar k) (i : ℤ),
          Nonempty (W.grading X i ≃ₗ[F] (G.obj (motive C X.obj)).toGradedObject i)) ∧
        W.AxFinite ∧ W.AxPoincare ∧ W.AxKunneth ∧ W.AxGysin ∧ W.AxPushforward ∧ W.AxMul ∧
        W.AxNormalisation := by
  sorry

/-- MC.2/weil-to-monoidal-functor: the realisation `G_H : Motive C ⥤ GradedVect F` of a classical
Weil cohomology theory. -/
def functor_of_weil (H : WeilCohomology C F) : Motive C ⥤ GradedVect F :=
  sorry

instance (H : WeilCohomology C F) : (functor_of_weil H).Braided := sorry

instance (H : WeilCohomology C F) : (functor_of_weil H).Linear ℚ := sorry

/-- MC.2/weil-to-monoidal-functor: `G_H(h(X)) = H^*(X)` naturally, and on a correspondence `c` of
degree zero `G_H(c)` is `a ↦ pr₂,*(γ(c) ∪ pr₁^*a)`. -/
theorem functor_of_weil_spec (H : WeilCohomology C F) :
    ∃ e : ∀ X : SmVar k, (functor_of_weil H).obj (motive C X.obj) ≅ H.toWeilData.gradedObject X,
      ∀ {X Y : SmVar k} (c : Corr C X.obj Y.obj 0),
        (functor_of_weil H).map (motive.ofCorr c) ≫ (e Y).hom = (e X).hom ≫ H.corrAction c := by
  sorry

/-- The realisation data of a classical Weil cohomology theory, normalised by `∫_{ℙ¹}`. -/
def WeilCohomology.toRealization (H : WeilCohomology C F) : RealizationData C F :=
  sorry

/-- The classical Weil cohomology theory determined by realisation data. -/
def RealizationData.toWeil (R : RealizationData C F) : WeilCohomology C F :=
  sorry

/-- MC.2/realization-round-trip: (a) the theory recovered from `(G_H, ∫_{ℙ¹})` is `H` (pullbacks,
cup products, cycle classes and traces); (b) `G_H ≅ G` monoidally, compatibly with the
normalisations, for the theory `H` determined by `(G, ι)`. -/
theorem realization_round_trip :
    (∀ H : WeilCohomology C F,
      Nonempty (WeilData.Iso H.toRealization.toWeil.toWeilData H.toWeilData)) ∧
    ∀ R : RealizationData C F, Nonempty (RealizationData.Iso R.toWeil.toRealization R) := by
  sorry

variable (C F) in
/-- Isomorphism of classical Weil cohomology theories. -/
def WeilCohomology.isoSetoid : Setoid (WeilCohomology C F) where
  r H H' := Nonempty (WeilData.Iso H.toWeilData H'.toWeilData)
  iseqv := sorry

variable (C F) in
/-- Isomorphism of realisation data. -/
def RealizationData.isoSetoid : Setoid (RealizationData C F) where
  r R R' := Nonempty (RealizationData.Iso R R')
  iseqv := sorry

/-- MC.2/realization-equivalence: classical Weil cohomology theories are, up to isomorphism,
the same as `ℚ`-linear symmetric monoidal functors `G : Motive C ⥤ GradedVect F` with
`F[2] ≅ G(𝟙(1))`, `G(h(X))` in nonnegative degrees and `dim G(h(X))⁰ = 1`, by the constructions
of MC.2/weil-to-monoidal-functor and MC.2/weil-from-monoidal-functor. (The two sides are
identified up to isomorphism: an `Equiv` of the unquotiented types would ask the round trip to
return the same functor, not an isomorphic one.) -/
def realization_equivalence :
    Quotient (WeilCohomology.isoSetoid C F) ≃ Quotient (RealizationData.isoSetoid C F) :=
  sorry

/-- The equivalence is induced by `H ↦ (G_H, ∫_{ℙ¹})`. -/
theorem realization_equivalence_mk (H : WeilCohomology C F) :
    realization_equivalence (Quotient.mk _ H) = Quotient.mk _ H.toRealization := by
  sorry

/-- For Weil data coming from a realisation functor, which satisfy everything but (A)(c) and
(A)(d), the two extra conditions of MC.2/realization-equivalence are exactly (A)(c) and (A)(d). -/
theorem realization_conditions (G : Motive C ⥤ GradedVect F) [G.Braided] [G.Linear ℚ]
    (W : WeilData C F)
    (e : ∀ (X : SmVar k) (i : ℤ), W.grading X i ≃ₗ[F] (G.obj (motive C X.obj)).toGradedObject i)
    (hW : W.AxFinite ∧ W.AxPoincare ∧ W.AxKunneth ∧ W.AxGysin ∧ W.AxPushforward ∧ W.AxMul ∧
      W.AxNormalisation) :
    ((∀ (X : SmVar k) (i : ℤ), i < 0 → IsZero ((G.obj (motive C X.obj)).toGradedObject i)) ∧
      ∀ X : SmVar k, Module.finrank F ((G.obj (motive C X.obj)).toGradedObject 0) = 1) ↔
    W.AxVanishing ∧ W.AxTraceBijective := by
  sorry

end Realization

/-! ### Weil-type data on all smooth proper schemes

`SchemeCohomology C A` is the shape shared by MC.2/weil-cohomology-of-schemes (a classical theory
extended to disconnected schemes, `k` algebraically closed) and MC.2/weil-cohomology-by-base-change
(`k` arbitrary, `H_k(X) = H^*(X_{k̄})`): a graded `A`-algebra `H^*(X)` for every smooth proper
`X`, with pullback, pushforward, cycle classes and a trace (meaningful for equidimensional `X`). -/

/-- Cohomology-type data on smooth proper `k`-schemes with coefficients in the field `A`. -/
structure SchemeCohomology (C : ChowTheory k) (A : Type v) [Field A] where
  /-- `X ↦ H^*(X)`, contravariant. -/
  H : (SmProj k)ᵒᵖ ⥤ AlgCat.{v} A
  /-- The grading. -/
  grading : ∀ X : SmProj k, ℤ → Submodule A (H.obj (op X))
  [gradedAlgebra : ∀ X, GradedAlgebra (grading X)]
  /-- The cohomological pushforward. -/
  pushforwardMap : ∀ {X Y : SmProj k}, (X ⟶ Y) → H.obj (op X) →ₗ[A] H.obj (op Y)
  /-- The cycle class map. -/
  cycleMap : ∀ X : SmProj k, C.CH X →+ H.obj (op X)
  /-- The trace (the sum of the traces of the components, for `X` equidimensional). -/
  traceMap : ∀ X : SmProj k, H.obj (op X) →ₗ[A] A

attribute [instance] SchemeCohomology.gradedAlgebra

namespace SchemeCohomology

variable {C} {A : Type v} [Field A] (S : SchemeCohomology C A)

/-- Pullback along `f : X ⟶ Y`. -/
def pullback {X Y : SmProj k} (f : X ⟶ Y) : S.H.obj (op Y) →ₐ[A] S.H.obj (op X) :=
  (S.H.map f.op).hom

/-- The cycle class of an `F`-linear cycle, for a subfield `F` of `A`. -/
def cycleMapF (F : Type*) [Field F] [Algebra F A] (X : SmProj k) : C.CHF F X →+ S.H.obj (op X) :=
  (TensorProduct.lift (LinearMap.mk₂ ℤ (fun (c : F) (a : C.CH X) =>
    (algebraMap F A c) • S.cycleMap X a) sorry sorry sorry sorry)).toAddMonoidHom

/-- The `F`-linear cycles with cycle class zero. -/
def homTrivial (F : Type*) [Field F] [Algebra F A] (X : SmProj k) : Submodule F (C.CHF F X) where
  carrier := {a | S.cycleMapF F X a = 0}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- The Künneth map `a ⊗ b ↦ pr₁^*a ∪ pr₂^*b`. -/
def kunnethMap (X Y : SmProj k) : S.H.obj (op X) ⊗[A] S.H.obj (op Y) →ₗ[A] S.H.obj (op (X.prod Y)) :=
  TensorProduct.lift ((LinearMap.mul A _).compl₁₂ (S.pullback (SmProj.fst X Y)).toLinearMap
    (S.pullback (SmProj.snd X Y)).toLinearMap)

/-- The operator `a ↦ pr₂,*(u ∪ pr₁^*a)` of a class `u` on `X × Y`. -/
def corrOp {X Y : SmProj k} (u : S.H.obj (op (X.prod Y))) : S.H.obj (op X) →ₗ[A] S.H.obj (op Y) :=
  S.pushforwardMap (SmProj.snd X Y) ∘ₗ LinearMap.mulLeft A u ∘ₗ
    (S.pullback (SmProj.fst X Y)).toLinearMap

/-- The projection of `H^*(X)` onto `H^i(X)`, as an endomorphism. -/
def gradeProj (X : SmProj k) (i : ℤ) : S.H.obj (op X) →ₗ[A] S.H.obj (op X) :=
  (S.grading X i).subtype ∘ₗ (DirectSum.component A ℤ (fun j => S.grading X j) i) ∘ₗ
    (DirectSum.decomposeLinearEquiv (S.grading X)).toLinearMap

/-- `Tr_i(φ)`, the trace of `φ` on `H^i(X)`. -/
def degreeTrace (X : SmProj k) (i : ℤ) (φ : S.H.obj (op X) →ₗ[A] S.H.obj (op X)) : A :=
  LinearMap.trace A _ ((DirectSum.component A ℤ (fun j => S.grading X j) i) ∘ₗ
    (DirectSum.decomposeLinearEquiv (S.grading X)).toLinearMap ∘ₗ φ ∘ₗ (S.grading X i).subtype)

/-- The pairing `H^i(X) × H^{2d-i}(X) → A`, `(a, b) ↦ ∫_X a ∪ b`. -/
def poincarePairing (X : SmProj k) (d : ℕ) (i : ℤ) :
    S.grading X i →ₗ[A] S.grading X (2 * d - i) →ₗ[A] A :=
  LinearMap.mk₂ A (fun a b => S.traceMap X ((a : S.H.obj (op X)) * b)) sorry sorry sorry sorry

end SchemeCohomology

/-! ### MC.2/weil-cohomology-of-schemes -/

section OnSchemes

variable {C F} [IsAlgClosed k] [CharZero F]

/-- MC.2/weil-cohomology-of-schemes: `H^*(X) = ∏_i H^*(X_i)` over the connected components
`X_i` of `X`, each a smooth projective variety, with pullback and cycle classes computed
componentwise and `∫_X = Σ_i ∫_{X_i}` for equidimensional `X`. -/
def WeilCohomology.onSchemes (H : WeilCohomology C F) : SchemeCohomology C F :=
  sorry

namespace WeilCohomology

variable (H : WeilCohomology C F)

/-- On a variety the extension is `H`, with its grading, cycle classes and trace. -/
theorem onSchemes_variety (X : SmVar k) :
    ∃ e : H.onSchemes.H.obj (op X.obj) ≃ₐ[F] H.toWeilData.H.obj (op X),
      (∀ i, (H.onSchemes.grading X.obj i).map e.toLinearMap = H.toWeilData.grading X i) ∧
      (∀ a, e (H.onSchemes.cycleMap X.obj a) = H.toWeilData.cycleMap X a) ∧
      ∀ a, H.toWeilData.traceMap X (e a) = H.onSchemes.traceMap X.obj a := by
  sorry

/-- `H^*(X ⊔ Y) = H^*(X) × H^*(Y)`, by restriction to the two parts, compatibly with cycle
classes. -/
@[simp] theorem onSchemes_coprod (X Y : SmProj k) :
    Function.Bijective (fun a : H.onSchemes.H.obj (op (X.coprod Y)) =>
      (H.onSchemes.pullback (SmProj.inl X Y) a, H.onSchemes.pullback (SmProj.inr X Y) a)) ∧
    ∀ c : C.CH (X.coprod Y), H.onSchemes.pullback (SmProj.inl X Y) (H.onSchemes.cycleMap _ c) =
      H.onSchemes.cycleMap X (C.pullback (SmProj.inl X Y) c) := by
  sorry

/-- The Künneth map for smooth proper schemes is an isomorphism. -/
theorem onSchemes_kunneth (X Y : SmProj k) : Function.Bijective (H.onSchemes.kunnethMap X Y) := by
  sorry

/-- Poincaré duality for equidimensional `X`, with `∫_X = Σ_i ∫_{X_i}`. -/
theorem onSchemes_poincare {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (i : ℤ) :
    (H.onSchemes.poincarePairing X d i).IsPerfPair := by
  sorry

/-- The degree formula `∫_X γ(α) = deg α` for zero cycles on equidimensional `X`. -/
theorem onSchemes_trace_cycleClass {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (a : C.CH X)
    (ha : a ∈ C.codim X d) : H.onSchemes.traceMap X (H.onSchemes.cycleMap X a) = (C.deg X a : F) := by
  sorry

/-- `H^0(X) = F^n` for `X` with `n` connected components. -/
@[simp] theorem onSchemes_H0 (X : SmProj k) :
    Module.finrank F (H.onSchemes.grading X 0) = Nat.card (ConnectedComponents X.toScheme) := by
  sorry

end WeilCohomology

/-! #### Unit tests of MC.2/weil-cohomology-of-schemes -/

section Tests

variable (H : WeilCohomology C F)

/-- Unit test `WeilCohomology.onSchemes_empty`: the empty scheme has `H^* = 0`. -/
example : Subsingleton (H.onSchemes.H.obj (op (SmProj.empty k))) := by
  sorry

/-- Unit test `WeilCohomology.onSchemes_two_points`: for `X = Spec k ⊔ Spec k`,
`H^*(X) = F × F` in degree zero and `∫_X` is the sum of the two traces. -/
example : let X := (SmProj.point k).coprod (SmProj.point k)
    Module.finrank F (H.onSchemes.grading X 0) = 2 ∧ (∀ i : ℤ, i ≠ 0 → H.onSchemes.grading X i = ⊥) ∧
      ∀ a, H.onSchemes.traceMap X a =
        H.onSchemes.traceMap _ (H.onSchemes.pullback (SmProj.inl _ _) a) +
          H.onSchemes.traceMap _ (H.onSchemes.pullback (SmProj.inr _ _) a) := by
  sorry

/-- Unit test `WeilCohomology.onSchemes_mixed_dim`: `X = Spec k ⊔ ℙ¹` is not equidimensional,
`H^0(X)` is two-dimensional and `H^2(X)` one-dimensional, so no pairing between them is
perfect and no trace is defined. -/
example : let X := (SmProj.point k).coprod (SmProj.projectiveLine k)
    (¬ ∃ d, X.IsEquidim d) ∧ Module.finrank F (H.onSchemes.grading X 0) = 2 ∧
      Module.finrank F (H.onSchemes.grading X 2) = 1 := by
  sorry

end Tests

end OnSchemes

/-! ### MC.2/homological-equivalence -/

section HomEquiv

variable {C} {Λ : Type v} [Field Λ] [IsAlgClosed k] [CharZero Λ]

/-- MC.2/homological-equivalence: the `F`-linear classes on `X` whose cycle class for the
classical theory `H` (with coefficients `Λ`, an `F`-algebra) vanishes on every connected
component. -/
def HomEquiv (H : WeilCohomology C Λ) (F : Type*) [Field F] [CharZero F] [Algebra F Λ]
    (X : SmProj k) : Submodule F (C.CHF F X) :=
  H.onSchemes.homTrivial F X

namespace HomEquiv

variable (H : WeilCohomology C Λ) (F : Type*) [Field F] [CharZero F] [Algebra F Λ]

/-- The homologically trivial classes form an adequate family `~_H`, by axiom (C). -/
def adequate : Adequate C F where
  I := HomEquiv H F
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

/-- Homologically trivial classes are numerically trivial. -/
theorem le_num : adequate H F ≤ NumEquiv.adequate C F := by
  sorry

/-- `[Spec k]` is not homologically trivial, by (C)(d). -/
theorem point_class : C.ofCH F (1 : C.CH (SmProj.point k)) ∉ HomEquiv H F (SmProj.point k) := by
  sorry

end HomEquiv

section Tests

variable (H : WeilCohomology C Λ) (F : Type*) [Field F] [CharZero F] [Algebra F Λ]

/-- Unit test `implies_numerical`: a homologically trivial class is numerically trivial. -/
example (X : SmProj k) (a : C.CHF F X) (ha : a ∈ HomEquiv H F X) : a ∈ NumEquiv C F X :=
  HomEquiv.le_num H F X ha

/-- Unit test `point_class_nontrivial`: `[Spec k]` is not homologically trivial (its trace is
`1`); the zero cycle class map, which drops (C)(d), would make the relation trivial. -/
example : C.ofCH F (1 : C.CH (SmProj.point k)) ∉ HomEquiv H F (SmProj.point k) :=
  HomEquiv.point_class H F

/-- Unit test `divisors_on_a_curve`: on a smooth projective curve, a divisor of degree zero is
homologically trivial for every classical theory. -/
example {X : SmProj k} (hX : X.IsCurve) (D : C.CHF F X) (hD : D ∈ C.codimF F X 1)
    (hdeg : C.degF F X D = 0) : D ∈ HomEquiv H F X := by
  sorry

end Tests

end HomEquiv

/-! ### MC.2/weil-cohomology-by-base-change -/

section BaseChange

variable (k) in
/-- The base change functor `X ↦ X_K = X ×_k K` from smooth proper `k`-schemes to smooth proper
`K`-schemes. -/
def SmProj.baseChangeFunctor (K : Type u) [Field K] [Algebra k K] : SmProj k ⥤ SmProj K where
  obj X := ⟨Over.mk (pullback.snd X.obj.hom (Spec.map (CommRingCat.ofHom (algebraMap k K)))), sorry⟩
  map f := ObjectProperty.homMk (Over.homMk (pullback.map _ _ _ _ f.hom.left (𝟙 _) (𝟙 _)
    (by simp) (by simp)) sorry)
  map_id := sorry
  map_comp := sorry

variable (k) in
/-- `Spec L` for a finite separable extension `L/k`, a smooth proper `k`-scheme. -/
def SmProj.ofField (L : Type u) [Field L] [Algebra k L] [FiniteDimensional k L]
    [Algebra.IsSeparable k L] : SmProj k :=
  ⟨Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k L))), sorry⟩

/-- SF.5, change of base field (Stacks 0FVJ, 0FVK, 0FVL, 0FVP, and the invariance of the degree of
a zero cycle): flat pullback `CH(X) → CH(X_K)` along `X_K ⟶ X`, compatible with Gysin pullback,
proper pushforward, intersection products and degrees. -/
structure ChowBaseChange (K : Type u) [Field K] [Algebra k K] (C : ChowTheory k)
    (C' : ChowTheory K) where
  /-- Flat pullback along `X_K ⟶ X`, a ring homomorphism (compatibility with intersection
  products). -/
  toK : ∀ X : SmProj k, C.CH X →+* C'.CH ((SmProj.baseChangeFunctor k K).obj X)
  toK_codim : ∀ (X : SmProj k) (i : ℤ), ∀ a ∈ C.codim X i, toK X a ∈ C'.codim _ i
  toK_pullback : ∀ {X Y : SmProj k} (f : X ⟶ Y) (a : C.CH Y),
    toK X (C.pullback f a) = C'.pullback ((SmProj.baseChangeFunctor k K).map f) (toK Y a)
  toK_pushforward : ∀ {X Y : SmProj k} (f : X ⟶ Y) (a : C.CH X),
    toK Y (C.pushforward f a) = C'.pushforward ((SmProj.baseChangeFunctor k K).map f) (toK X a)
  deg_toK : ∀ (X : SmProj k) (a : C.CH X), C'.deg _ (toK X a) = C.deg X a

variable {C} {C' : ChowTheory (AlgebraicClosure k)} (B : ChowBaseChange (AlgebraicClosure k) C C')
variable {A : Type v} [Field A] [CharZero A]

/-- MC.2/weil-cohomology-by-base-change: `H_k(X) = H^*(X_{k̄})` for a classical theory `H` over an
algebraic closure `k̄` of `k`, with `f^* = (f_{k̄})^*`, `γ_k = γ ∘ (flat pullback)` and
`∫_X = ∫_{X_{k̄}}`. -/
def WeilCohomology.baseChange (H : WeilCohomology C' A) : SchemeCohomology C A where
  H := (SmProj.baseChangeFunctor k (AlgebraicClosure k)).op ⋙ H.onSchemes.H
  grading X := H.onSchemes.grading ((SmProj.baseChangeFunctor k (AlgebraicClosure k)).obj X)
  gradedAlgebra X := H.onSchemes.gradedAlgebra ((SmProj.baseChangeFunctor k (AlgebraicClosure k)).obj X)
  pushforwardMap f := H.onSchemes.pushforwardMap ((SmProj.baseChangeFunctor k _).map f)
  cycleMap X := (H.onSchemes.cycleMap _).comp (B.toK X).toAddMonoidHom
  traceMap X := H.onSchemes.traceMap ((SmProj.baseChangeFunctor k (AlgebraicClosure k)).obj X)

namespace WeilCohomology

variable (H : WeilCohomology C' A)

/-- `γ_k` is `γ` composed with flat pullback to `X_{k̄}`. -/
@[simp] theorem baseChange_cycleClass (X : SmProj k) (a : C.CH X) :
    (H.baseChange B).cycleMap X a = H.onSchemes.cycleMap _ (B.toK X a) :=
  rfl

/-- `deg_k(α) = ∫ γ_k(α)` for zero cycles on equidimensional `X`. -/
theorem baseChange_trace_cycleClass {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (a : C.CH X)
    (ha : a ∈ C.codim X d) : (H.baseChange B).traceMap X ((H.baseChange B).cycleMap X a) = (C.deg X a : A) := by
  sorry

/-- The action of correspondences of degree zero over `k` on `H_k`, by the realisation of their
base change, compatible with composition and identities. -/
theorem baseChange_act :
    (∀ X : SmProj k, (H.baseChange B).corrOp
      ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ (Corr.diagonal C X))) = LinearMap.id) ∧
    ∀ {X Y Z : SmProj k} (c : Corr C X Y 0) (c' : Corr C Y Z 0),
      (H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ (Corr.comp C c' c))) =
        (H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ c')) ∘ₗ
          (H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ c)) := by
  sorry

/-- Homological equivalence over `k` relative to `H`: the kernel of `γ_k` on `F`-linear cycles,
for a subfield `F` of `A`. -/
def baseChange_homEquiv (F : Type*) [Field F] [CharZero F] [Algebra F A] : Adequate C F where
  I := (H.baseChange B).homTrivial F
  graded := sorry
  pullback_le := sorry
  pushforward_le := sorry
  mul_mem := sorry

/-- The symmetric monoidal realisation of Chow motives over `k` with values in graded
`A`-vector spaces, `G(h(X)) = H_k(X)`. -/
theorem baseChange_realization :
    ∃ (G : Motive C ⥤ GradedVect A) (_ : G.Braided) (_ : G.Linear ℚ),
      ∀ (X : SmProj k) (i : ℤ),
        Nonempty ((G.obj (motive C X)).toGradedObject i ≅ ModuleCat.of A ((H.baseChange B).grading X i)) := by
  sorry

/-- For `k` algebraically closed, base change to `k̄` is an equivalence and `H_k` is the
extension of `H` to smooth proper schemes. -/
theorem baseChange_of_isAlgClosed [IsAlgClosed k] :
    (SmProj.baseChangeFunctor k (AlgebraicClosure k)).IsEquivalence ∧
      (H.baseChange B).H = (SmProj.baseChangeFunctor k (AlgebraicClosure k)).op ⋙ H.onSchemes.H := by
  sorry

end WeilCohomology

section Tests

variable (H : WeilCohomology C' A)

/-- Unit test `WeilCohomology.baseChange_algClosed`: for `k` algebraically closed, `H_k` agrees
with the extension of `H` to smooth proper schemes. -/
example [IsAlgClosed k] :
    (SmProj.baseChangeFunctor k (AlgebraicClosure k)).IsEquivalence ∧
      (H.baseChange B).H = (SmProj.baseChangeFunctor k (AlgebraicClosure k)).op ⋙ H.onSchemes.H :=
  H.baseChange_of_isAlgClosed B

/-- Unit test `WeilCohomology.baseChange_finite_extension`: for `X = Spec k'` with `k'/k` finite
separable of degree `n`, `H_k(X) = A^n` in degree zero and `γ_k([X]) = (1, …, 1) = 1`. -/
example (L : Type u) [Field L] [Algebra k L] [FiniteDimensional k L] [Algebra.IsSeparable k L] :
    Module.finrank A ((H.baseChange B).grading (SmProj.ofField k L) 0) = Module.finrank k L ∧
      (∀ i : ℤ, i ≠ 0 → (H.baseChange B).grading (SmProj.ofField k L) i = ⊥) ∧
      (H.baseChange B).cycleMap (SmProj.ofField k L) 1 = 1 := by
  sorry

/-- Unit test `WeilCohomology.baseChange_rational_injective`: `CH^r(X) ⊗ ℚ → CH^r(X_{k̄}) ⊗ ℚ` is
injective, so a `ℚ`-linear cycle over `k` is homologically trivial over `k` exactly when its
base change is. -/
example (X : SmProj k) :
    Function.Injective ((B.toK X).toAddMonoidHom.toIntLinearMap.baseChange ℚ) ∧
      ∀ a : C.CHF ℚ X, a ∈ (H.baseChange_homEquiv B ℚ).I X ↔
        (B.toK X).toAddMonoidHom.toIntLinearMap.baseChange ℚ a ∈ H.onSchemes.homTrivial ℚ _ := by
  sorry

/-- Unit test `WeilCohomology.baseChange_point_degree`: for a closed point `x` of degree `n` on a
curve over `k` (with separable residue field `L`), `∫ γ_k([x]) = n`, not `1`. -/
example {X : SmProj k} (hX : X.IsCurve) (L : Type u) [Field L] [Algebra k L]
    [FiniteDimensional k L] [Algebra.IsSeparable k L] (x : SmProj.ofField k L ⟶ X)
    (hx : IsClosedImmersion x.hom.left) :
    (H.baseChange B).traceMap X ((H.baseChange B).cycleMap X (C.pushforward x 1)) =
      (Module.finrank k L : A) := by
  sorry

end Tests

/-! ### MC.2/kunneth-components -/

variable (H : WeilCohomology C' A)

/-- MC.2/kunneth-components: the Künneth component `π^j ∈ H^{2d}(X × X)` of `γ_k([Δ])`, its
component in `H^{2d-j}(X) ⊗ H^j(X)` under the Künneth decomposition. -/
def KunnethComponent (X : SmProj k) {d : ℕ} (_hX : X.IsEquidim d) (j : ℤ) :
    (H.baseChange B).H.obj (op (X.prod X)) :=
  sorry

namespace KunnethComponent

/-- `π^j` lies in the image of `H^{2d-j}(X) ⊗ H^j(X)`. -/
theorem mem_kunneth (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (j : ℤ) :
    KunnethComponent B H X hX j ∈ Submodule.map ((H.baseChange B).kunnethMap X X)
      (Submodule.map₂ (TensorProduct.mk A _ _) ((H.baseChange B).grading X (2 * d - j))
        ((H.baseChange B).grading X j)) := by
  sorry

/-- `Σ_j π^j = γ_k([Δ])`. -/
@[simp] theorem sum (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) :
    ∑ j ∈ Finset.range (2 * d + 1), KunnethComponent B H X hX j =
      (H.baseChange B).cycleMap _ (C.pushforward (SmProj.diag X) 1) := by
  sorry

/-- The operator of `π^j` is the projection of `H^*(X)` onto `H^j(X)`. -/
theorem act (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (j : ℤ) :
    (H.baseChange B).corrOp (KunnethComponent B H X hX j) = (H.baseChange B).gradeProj X j := by
  sorry

/-- `Tr_i(f ∘ π^j) = δ_{ij} Tr_j(f)` for every correspondence `f` of degree zero. -/
theorem trace_comp (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (f : Corr C X X 0) (i j : ℤ) :
    (H.baseChange B).degreeTrace X i
        ((H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ f)) ∘ₗ
          (H.baseChange B).corrOp (KunnethComponent B H X hX j)) =
      if i = j then (H.baseChange B).degreeTrace X j
        ((H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ f))) else 0 := by
  sorry

/-- As operators the `π^j` are orthogonal idempotents commuting with the operators of all
correspondences of degree zero. -/
theorem orthogonal (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (i j : ℤ) (f : Corr C X X 0) :
    (H.baseChange B).corrOp (KunnethComponent B H X hX i) ∘ₗ
        (H.baseChange B).corrOp (KunnethComponent B H X hX j) =
      (if i = j then (H.baseChange B).corrOp (KunnethComponent B H X hX i) else 0) ∧
    (H.baseChange B).corrOp (KunnethComponent B H X hX i) ∘ₗ
        (H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ f)) =
      (H.baseChange B).corrOp ((H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ f)) ∘ₗ
        (H.baseChange B).corrOp (KunnethComponent B H X hX i) := by
  sorry

end KunnethComponent

/-- The Künneth components of `X` are algebraic (relative to `H`): every `π^j` is `γ_k` of a
`ℚ`-linear cycle of dimension `d` on `X × X`. -/
def IsAlgebraicKunneth (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) : Prop :=
  ∀ j : ℤ, ∃ z ∈ C.codimF ℚ (X.prod X) d, (H.baseChange B).cycleMapF ℚ _ z = KunnethComponent B H X hX j

namespace IsAlgebraicKunneth

/-- Algebraicity for `X` and `Y` gives it for `X × Y`. -/
theorem prod {X Y : SmProj k} {d e : ℕ} (hX : X.IsEquidim d) (hY : Y.IsEquidim e)
    (hXY : (X.prod Y).IsEquidim (d + e)) :
    IsAlgebraicKunneth B H X hX → IsAlgebraicKunneth B H Y hY → IsAlgebraicKunneth B H _ hXY := by
  sorry

/-- If the Künneth components are algebraic, the numerical classes of cycles representing them are
central orthogonal idempotents summing to `1` in the algebra `End((X, [Δ], 0))` of numerical
correspondences of degree zero. -/
theorem num_central (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (h : IsAlgebraicKunneth B H X hX) :
    ∃ z : ℤ → corrSubmoduleF C ℚ X X (0 - 0),
      (∀ j, (H.baseChange B).cycleMapF ℚ _ (z j) = KunnethComponent B H X hX j) ∧
      let p : ℤ → End (MotiveMod.ofPair ℚ (NumEquiv.adequate C ℚ) X 0) := fun j =>
        (Idempotents.toKaroubi _).map (Submodule.Quotient.mk (z j) :
          CorrMod ℚ (NumEquiv.adequate C ℚ) X X (0 - 0))
      (∀ i j, p i * p j = if i = j then p i else 0) ∧ (∀ j g, p j * g = g * p j) ∧
        ∑ j ∈ Finset.range (2 * d + 1), p j = 1 := by
  sorry

end IsAlgebraicKunneth

section Tests

/-- Unit test `KunnethComponent.point`: for `X = Spec k`, `π^0 = 1`, which is algebraic. -/
example (h0 : (SmProj.point k).IsEquidim 0) :
    KunnethComponent B H (SmProj.point k) h0 0 = 1 ∧ IsAlgebraicKunneth B H (SmProj.point k) h0 := by
  sorry

/-- Unit test `KunnethComponent.projective_line`: for `ℙ¹` with a rational point `x`,
`π^0 = γ([x × ℙ¹])` and `π^2 = γ([ℙ¹ × x])`, the classes of the projectors `c₀` and `c₂`; the
Künneth components of `ℙ¹` are algebraic. -/
example (h1 : (SmProj.projectiveLine k).IsEquidim 1) (x : (SmProj.projectiveLine k).RatPoint) :
    KunnethComponent B H _ h1 0 =
        (H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ (Corr.pointTimes (C := C) x)) ∧
      KunnethComponent B H _ h1 2 =
        (H.baseChange B).cycleMapF ℚ _ (Corr.toChow C _ _ _ (Corr.timesPoint (C := C) x)) ∧
      IsAlgebraicKunneth B H _ h1 := by
  sorry

/-- Unit test `KunnethComponent.index_convention`: the component of `γ([Δ])` in
`H^j(X) ⊗ H^{2d-j}(X)`, which is the transpose of `π^j`, acts as the projection onto
`H^{2d-j}(X)`, not onto `H^j(X)`. -/
example (X : SmProj k) {d : ℕ} (hX : X.IsEquidim d) (j : ℤ) :
    (H.baseChange B).corrOp ((H.baseChange B).pullback (SmProj.swap X X) (KunnethComponent B H X hX j)) =
      (H.baseChange B).gradeProj X (2 * d - j) := by
  sorry

/-- Unit test `KunnethComponent.curve`: for a curve with a closed point `x` of degree `n`,
`π^0 = (1/n) γ_k([x × C])`, `π^2 = (1/n) γ_k([C × x])`, `π^1 = γ_k([Δ]) - π^0 - π^2`, so the
Künneth components of a curve are algebraic. -/
example {X : SmProj k} (hX : X.IsCurve) (L : Type u) [Field L] [Algebra k L]
    [FiniteDimensional k L] [Algebra.IsSeparable k L] (x : SmProj.ofField k L ⟶ X)
    (hx : IsClosedImmersion x.hom.left) :
    let n : A := Module.finrank k L
    KunnethComponent B H X hX.2 0 = n⁻¹ • (H.baseChange B).cycleMap _
        (C.pullback (SmProj.fst X X) (C.pushforward x 1)) ∧
      KunnethComponent B H X hX.2 2 = n⁻¹ • (H.baseChange B).cycleMap _
        (C.pullback (SmProj.snd X X) (C.pushforward x 1)) ∧
      KunnethComponent B H X hX.2 1 = (H.baseChange B).cycleMap _ (C.pushforward (SmProj.diag X) 1) -
        KunnethComponent B H X hX.2 0 - KunnethComponent B H X hX.2 2 ∧
      IsAlgebraicKunneth B H X hX.2 := by
  sorry

end Tests

/-! ### MC.2/homological-correspondences-embed -/

/-- MC.2/homological-correspondences-embed: the action `c ↦ (a ↦ pr₂,*(γ_k(c) ∪ pr₁^*a))` of
`F`-linear correspondences of degree `r` vanishes exactly on the homologically trivial ones, maps
`H^i(X)` to `H^{i+2r}(Y)` and is compatible with composition; for `X = Y` and `r = 0` it gives an
injective ring homomorphism from `B = A_hom^d(X × X, F)` to `∏_i End_A(H^i(X))`. -/
theorem homCorr_embed (F : Type*) [Field F] [CharZero F] [Algebra F A] {X Y Z : SmProj k}
    {d : ℕ} (hX : X.IsEquidim d) (r : ℤ) :
    (∀ c ∈ corrSubmoduleF C F X Y r,
      (H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ c) = 0 ↔
        c ∈ (H.baseChange B).homTrivial F (X.prod Y)) ∧
    (∀ c ∈ corrSubmoduleF C F X Y r, ∀ i : ℤ, ∀ a ∈ (H.baseChange B).grading X i,
      (H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ c) a ∈
        (H.baseChange B).grading Y (i + 2 * r)) ∧
    (∀ (c : C.CHF F (X.prod Y)) (c' : C.CHF F (Y.prod Z)),
      (H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ (C.compF F c' c)) =
        (H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ c') ∘ₗ
          (H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ c)) ∧
    ∃ φ : End (MotiveMod.ofPair F (H.baseChange_homEquiv B F) X 0) →+*
        (∀ i : ℤ, Module.End A ((H.baseChange B).grading X i)), Function.Injective φ := by
  sorry

end BaseChange

/-! ### MC.2/etale-cohomology-is-weil -/

/-- SchemeAndStackFoundations SF.2 with EtaleDualityAndPerverseSheaves EDC.2 and EDC.3: `ℓ`-adic
cohomology `X ↦ H^*(X, ℚ_ℓ)` of smooth projective varieties over the algebraically closed `k`,
with cup product, the `ℓ`-adic cycle class map and the trace, the twists `ℚ_ℓ(r)` identified with
`ℚ_ℓ` by a chosen generator of `ℤ_ℓ(1)`. Nothing here constructs étale cohomology. -/
structure EtaleCohomologyData (C : ChowTheory k) (ℓ : ℕ) [Fact ℓ.Prime] [IsAlgClosed k] where
  /-- The data (D1)-(D3). -/
  toWeilData : WeilData C ℚ_[ℓ]
  /-- SF.2: finite dimensionality, vanishing outside `[0, 2 dim X]`, Künneth. -/
  sf2 : toWeilData.AxFinite ∧ toWeilData.AxVanishing ∧ toWeilData.AxKunneth
  /-- EDC.2: the trace is an isomorphism for connected `X` and the cup product pairing is
  perfect. -/
  edc2 : toWeilData.AxTraceBijective ∧ toWeilData.AxPoincare
  /-- EDC.3: the cycle class map is compatible with Gysin pullback, proper pushforward and
  products, and the class of a point has trace one. -/
  edc3 : toWeilData.AxGysin ∧ toWeilData.AxPushforward ∧ toWeilData.AxMul ∧
    toWeilData.AxNormalisation

/-- MC.2/etale-cohomology-is-weil: for `ℓ` invertible in the algebraically closed `k`, `ℓ`-adic
cohomology with its cup product, cycle class map and trace is a classical Weil cohomology theory
with coefficients in `ℚ_ℓ`. -/
theorem etale_isWeil [IsAlgClosed k] (ℓ : ℕ) [Fact ℓ.Prime] (_hℓ : (ℓ : k) ≠ 0)
    (E : EtaleCohomologyData C ℓ) : E.toWeilData.IsWeil := by
  sorry

/-! ### MC.2/chow-kernel-torsion, chow-groups-under-field-extension and
zero-cycles-separable-points

MC.2/chow-groups-under-field-extension (`CH_i(X_K) = colim CH_i(X_{k'})` over finite
subextensions) is not stated: it needs Chow theories over every intermediate field with
compatible base-change isomorphisms `(X_{k'})_K ≅ X_K`, which `ChowBaseChange` does not supply.
Both remaining lemmas are stated for smooth proper `X`, the schemes `ChowTheory` covers; the
source states them for schemes of finite type. -/

/-- MC.2/chow-kernel-torsion: for an algebraic extension `K/k`, the kernel of flat pullback
`CH(X) → CH(X_K)` is torsion; hence `CH(X) ⊗ ℚ → CH(X_K) ⊗ ℚ` is injective. -/
theorem chow_kernel_torsion (K : Type u) [Field K] [Algebra k K] [Algebra.IsAlgebraic k K]
    {C' : ChowTheory K} (B : ChowBaseChange K C C') (X : SmProj k) :
    (∀ a : C.CH X, B.toK X a = 0 → IsOfFinAddOrder a) ∧
      Function.Injective ((B.toK X).toAddMonoidHom.toIntLinearMap.baseChange ℚ) := by
  sorry

/-- MC.2/zero-cycles-separable-points: `CH_0(X)` is generated by the classes of closed points
with separable residue fields, that is by the pushforwards of `[Spec L]` along closed immersions
`Spec L ⟶ X` with `L/k` finite separable. -/
theorem zeroCycles_separable (X : SmProj k) :
    (C.dim X 0 : Set (C.CH X)) ⊆ AddSubgroup.closure {a | ∃ (L : Type u) (_ : Field L)
      (_ : Algebra k L) (_ : FiniteDimensional k L) (_ : Algebra.IsSeparable k L)
      (x : SmProj.ofField k L ⟶ X), IsClosedImmersion x.hom.left ∧ a = C.pushforward x 1} := by
  sorry

end MC2

section MC3

open CategoryTheory AlgebraicGeometry Limits TensorProduct MonoidalCategory Opposite

/-! ## MC.3 Numerical motives and semisimplicity

### MC.3/semisimple-abelian-category -/

section Semisimple

attribute [local instance] Abelian.hasFiniteBiproducts

variable (D : Type*) [Category D] [Abelian D]

/-- MC.3/semisimple-abelian-category: every object of the abelian category `D` is a finite
direct sum (biproduct) of simple objects; the empty sum is the zero object. -/
def SemisimpleAbelian : Prop :=
  ∀ X : D, ∃ (n : ℕ) (S : Fin n → D), (∀ i, Simple (S i)) ∧ Nonempty (X ≅ ⨁ S)

namespace SemisimpleAbelian

variable {D}

/-- Every object is isomorphic to a finite biproduct of simple objects. -/
theorem exists_decomposition (h : SemisimpleAbelian D) (X : D) :
    ∃ (n : ℕ) (S : Fin n → D), (∀ i, Simple (S i)) ∧ Nonempty (X ≅ ⨁ S) :=
  h X

/-- Semisimple iff every object has finite length and every short exact sequence splits. -/
theorem iff_split :
    SemisimpleAbelian D ↔ (∀ X : D, IsArtinianObject X ∧ IsNoetherianObject X) ∧
      ∀ S : ShortComplex D, S.ShortExact → Nonempty S.Splitting := by
  sorry

/-- Every monomorphism and every epimorphism splits. -/
theorem mono_split (h : SemisimpleAbelian D) {X Y : D} (f : X ⟶ Y) :
    (Mono f → IsSplitMono f) ∧ (Epi f → IsSplitEpi f) := by
  sorry

/-- The endomorphism ring of a simple object is a division ring: every nonzero endomorphism is
invertible. -/
theorem endSimple_divisionRing (S : D) [Simple S] (f : S ⟶ S) (hf : f ≠ 0) : IsIso f := by
  sorry

/-- The predicate is invariant under equivalence of abelian categories. -/
theorem of_equivalence {D' : Type*} [Category D'] [Abelian D'] (e : D ≌ D')
    (h : SemisimpleAbelian D) : SemisimpleAbelian D' := by
  sorry

/-- Finite-dimensional vector spaces over a field form a semisimple abelian category. -/
theorem vect (K : Type w) [Field K] : SemisimpleAbelian (FGModuleCat.{w} K) := by
  sorry

end SemisimpleAbelian

end Semisimple

/-- `ℚ[ε]` is noetherian (it is finite over `ℚ`). -/
instance DualNumber.isNoetherianRing_rat : IsNoetherianRing (DualNumber ℚ) := sorry

section Tests

/-- Unit test `SemisimpleAbelian.vect_field`: finite-dimensional `K`-vector spaces form a
semisimple category whose only simple object up to isomorphism is `K`. -/
example (K : Type) [Field K] :
    SemisimpleAbelian (FGModuleCat.{0} K) ∧
      ∀ S : FGModuleCat.{0} K, Simple S → Nonempty (S ≅ FGModuleCat.of K K) := by
  sorry

/-- Unit test `SemisimpleAbelian.not_dualNumbers`: finitely generated `ℚ[ε]`-modules form an
abelian category which is not semisimple: `0 → εℚ[ε] → ℚ[ε] → ℚ → 0` does not split, the
quotient map `ℚ[ε] → ℚ[ε]/(ε)` having no `ℚ[ε]`-linear section. -/
example : ¬ SemisimpleAbelian (FGModuleCat.{0} (DualNumber ℚ)) ∧
    ¬ ∃ s : (DualNumber ℚ ⧸ Ideal.span {(DualNumber.eps : DualNumber ℚ)}) →ₗ[DualNumber ℚ]
        DualNumber ℚ, (Submodule.mkQ _) ∘ₗ s = LinearMap.id := by
  sorry

/-- Unit test `SemisimpleAbelian.zero`: an abelian category in which every object is zero is
semisimple. -/
example (D : Type*) [Category D] [Abelian D] (h : ∀ X : D, IsZero X) : SemisimpleAbelian D := by
  sorry

/-- Unit test `SemisimpleAbelian.rep_finite_group`: finite-dimensional representations of a
finite group over a field of characteristic zero form a semisimple abelian category (Maschke).
Mathlib has no abelian instance on `FDRep`; one is taken as a hypothesis. -/
example (K : Type) [Field K] [CharZero K] (G : Type) [Group G] [Finite G] [Abelian (FDRep K G)] :
    SemisimpleAbelian (FDRep K G) := by
  sorry

end Tests

/-! ### MC.3/categorical-rank -/

namespace Monoidal

variable {T : Type*} [Category T] [MonoidalCategory T] [SymmetricCategory T]

/-- The trace `Tr(u) = ε ∘ β_{M, M'} ∘ (u ⊗ id) ∘ η ∈ End(𝟙)` of an endomorphism of an object `M`
with an exact pairing `(M, M')` (Mathlib's convention: `η : 𝟙 ⟶ M ⊗ M'`, `ε : M' ⊗ M ⟶ 𝟙`). It
depends on the commutativity constraint. -/
def trace {M M' : T} [ExactPairing M M'] (u : M ⟶ M) : End (𝟙_ T) :=
  η_ M M' ≫ (u ▷ M') ≫ (β_ M M').hom ≫ ε_ M M'

/-- The rank `rk(M) = Tr(id_M)`. -/
def rank (M M' : T) [ExactPairing M M'] : End (𝟙_ T) := trace (M' := M') (𝟙 M)

/-- `Tr(u ∘ v) = Tr(v ∘ u)`; the trace does not depend on the chosen dual. -/
theorem trace_comp {M M' M'' : T} [ExactPairing M M'] (u v : M ⟶ M) :
    trace (M' := M') (u ≫ v) = trace (M' := M') (v ≫ u) ∧
      ∀ _ : ExactPairing M M'', trace (M' := M'') u = trace (M' := M') u := by
  sorry

/-- A symmetric monoidal functor preserves traces, hence ranks. -/
theorem trace_map {T' : Type*} [Category T'] [MonoidalCategory T'] [SymmetricCategory T']
    (G : T ⥤ T') [G.Braided] {M M' : T} [ExactPairing M M'] [ExactPairing (G.obj M) (G.obj M')]
    (u : M ⟶ M) :
    Functor.LaxMonoidal.ε G ≫ G.map (trace (M' := M') u) =
      trace (M' := G.obj M') (G.map u) ≫ Functor.LaxMonoidal.ε G := by
  sorry

/-- `rk(M ⊗ N) = rk(M) rk(N)` and `rk(𝟙) = 1`. -/
@[simp] theorem rank_tensor (M M' N N' : T) [ExactPairing M M'] [ExactPairing N N']
    [ExactPairing (M ⊗ N) (N' ⊗ M')] :
    rank (M ⊗ N) (N' ⊗ M') = rank M M' * rank N N' ∧ rank (𝟙_ T) (𝟙_ T) = 1 := by
  sorry

/-- `rk(M ⊕ N) = rk(M) + rk(N)` in an additive setting. -/
@[simp] theorem rank_biprod [Preadditive T] [MonoidalPreadditive T] (M M' N N' : T)
    [HasBinaryBiproduct M N] [HasBinaryBiproduct M' N'] [ExactPairing M M'] [ExactPairing N N']
    [ExactPairing (M ⊞ N) (M' ⊞ N')] :
    rank (M ⊞ N) (M' ⊞ N') = rank M M' + rank N N' := by
  sorry

/-- In finite-dimensional vector spaces the rank is the dimension. -/
theorem rank_vect (K : Type) [Field K] (V V' : FGModuleCat.{0} K) [ExactPairing V V'] :
    rank V V' = (Module.finrank K V : K) • 𝟙 _ := by
  sorry

/-- In graded vector spaces with the Koszul constraint, `rk(V) = Σ_n (-1)^n dim V^n`. -/
theorem rank_gradedVect (F : Type) [Field F] (V V' : GradedVect F) [ExactPairing V V']
    (s : Finset ℤ) (hs : ∀ n ∉ s, Subsingleton (V.toGradedObject n)) :
    rank V V' = ((∑ n ∈ s, (-1 : ℤ) ^ n.natAbs * Module.finrank F (V.toGradedObject n) : ℤ) : F) •
      𝟙 _ := by
  sorry

end Monoidal

section Tests

/-- Unit test `Monoidal.rank_unit`: the rank of the unit object is `1`. -/
example {T : Type*} [Category T] [MonoidalCategory T] [SymmetricCategory T] :
    Monoidal.rank (𝟙_ T) (𝟙_ T) = 1 :=
  (Monoidal.rank_tensor (𝟙_ T) (𝟙_ T) (𝟙_ T) (𝟙_ T)).2

/-- Unit test `Monoidal.rank_vect_eq_finrank`: in finite-dimensional `K`-vector spaces,
`rk(V) = dim_K V`. -/
example (K : Type) [Field K] (V : FGModuleCat.{0} K) :
    Monoidal.rank V Vᘁ = (Module.finrank K V : K) • 𝟙 _ :=
  Monoidal.rank_vect K V Vᘁ

/-- Unit test `Monoidal.rank_odd_line`: in graded vector spaces with the Koszul constraint,
`rk(F[-1]) = -1` (with the unsigned constraint it would be `1`). -/
example (F : Type) [Field F] [ExactPairing (GradedVect.shift F (-1)) (GradedVect.shift F 1)] :
    Monoidal.rank (GradedVect.shift F (-1)) (GradedVect.shift F 1) = -1 := by
  sorry

end Tests

/-! ### MC.3/tannakian-category -/

section Tannakian

/-- The preadditive category `T` is abelian: it has finite products, kernels and cokernels, and
every coimage-image comparison is an isomorphism (the hypotheses of Mathlib's
`Abelian.ofCoimageImageComparisonIsIso`). A `Prop`, so that it can be asked of a category whose
preadditive and linear structures are already fixed. -/
def IsAbelianCat (T : Type*) [Category T] [Preadditive T] : Prop :=
  HasFiniteProducts T ∧ ∃ (_ : HasKernels T) (_ : HasCokernels T),
    ∀ {X Y : T} (f : X ⟶ Y), IsIso (Abelian.coimageImageComparison f)

variable (F : Type v) [Field F] (T : Type*) [Category T] [Preadditive T] [Linear F T]
  [MonoidalCategory T] [SymmetricCategory T]

/-- A fibre functor on `T` with values in an extension field `F'` of `F`: an exact, faithful,
`F`-linear symmetric monoidal functor to finite-dimensional `F'`-vector spaces. -/
structure FibreFunctor where
  /-- The extension field. -/
  F' : Type v
  [field : Field F']
  [algebra : Algebra F F']
  /-- The functor. -/
  ω : T ⥤ FGModuleCat.{v} F'
  [braided : ω.Braided]
  faithful : ω.Faithful
  exact : PreservesFiniteLimits ω ∧ PreservesFiniteColimits ω
  linear : ∀ {X Y : T} (c : F) (f : X ⟶ Y), ω.map (c • f) = algebraMap F F' c • ω.map f

attribute [instance] FibreFunctor.field FibreFunctor.algebra FibreFunctor.braided

/-- MC.3/tannakian-category: the `F`-linear symmetric monoidal category `T` is Tannakian over `F`:
it is abelian and rigid, `End(𝟙) = F`, and there is a fibre functor with values in some extension
field of `F`. The commutativity constraint is part of the data. -/
def IsTannakian : Prop :=
  (IsAbelianCat T ∧ Nonempty (RightRigidCategory T)) ∧ Nonempty (End (𝟙_ T) ≃ₐ[F] F) ∧
    Nonempty (FibreFunctor F T)

/-- `T` is neutral Tannakian: `End(𝟙) = F` and there is a fibre functor with values in `F`. -/
def IsNeutralTannakian : Prop :=
  (IsAbelianCat T ∧ Nonempty (RightRigidCategory T)) ∧ Nonempty (End (𝟙_ T) ≃ₐ[F] F) ∧
    ∃ φ : FibreFunctor F T, Nonempty (φ.F' ≃ₐ[F] F)

variable {F T}

/-- A chosen fibre functor of a Tannakian category, with its extension field. -/
noncomputable def IsTannakian.fibreFunctor (h : IsTannakian F T) : FibreFunctor F T :=
  Classical.choice h.2.2

/-- In a Tannakian category every object has rank a nonnegative integer. -/
theorem IsTannakian.rank_nonneg [RightRigidCategory T] (h : IsTannakian F T) (M : T) :
    ∃ n : ℕ, Monoidal.rank M Mᘁ = (n : F) • 𝟙 _ := by
  sorry

/-- Neutral implies Tannakian. -/
theorem IsNeutralTannakian.isTannakian (h : IsNeutralTannakian F T) : IsTannakian F T :=
  ⟨h.1, h.2.1, h.2.2.elim fun φ _ => ⟨φ⟩⟩

/-- The predicate is invariant under `F`-linear symmetric monoidal equivalence. -/
theorem IsTannakian.of_equivalence {T' : Type*} [Category T'] [Preadditive T'] [Linear F T']
    [MonoidalCategory T'] [SymmetricCategory T'] (e : T ≌ T')
    [e.functor.Braided] [e.functor.Linear F] (h : IsTannakian F T) : IsTannakian F T' := by
  sorry

/-- Finite-dimensional comodules over a commutative Hopf algebra, with the forgetful functor, form
a neutral Tannakian category. Stated for the finite-dimensional representations `FDRep K G` of a
finite group, the comodules over the Hopf algebra of functions on `G`; the general comodule
form is about Tau Ceti's `TauCeti.FGComoduleCat`, which is not imported here. -/
theorem IsNeutralTannakian.comodules (K : Type) [Field K] (G : Type) [Group G] [Finite G] :
    IsNeutralTannakian K (FDRep K G) := by
  sorry

end Tannakian

section Tests

/-- Unit test `IsNeutralTannakian.vect`: finite-dimensional `F`-vector spaces with the identity
functor form a neutral Tannakian category. -/
example (F : Type) [Field F] : IsNeutralTannakian F (FGModuleCat.{0} F) := by
  sorry

/-- Unit test `IsNeutralTannakian.comodules`: finite-dimensional comodules over a commutative
Hopf algebra (here: representations of a finite group, see `IsNeutralTannakian.comodules`) with
the forgetful functor form a neutral Tannakian category. -/
example (K : Type) [Field K] (G : Type) [Group G] [Finite G] :
    IsNeutralTannakian K (FDRep K G) :=
  IsNeutralTannakian.comodules K G

/-- Unit test `IsTannakian.not_superVect`: a rigid abelian symmetric monoidal category of graded
vector spaces with the Koszul constraint (embedded fully faithfully and symmetric monoidally in
`GradedVect F`) that contains `F[-1]` is not Tannakian, since `rk(F[-1]) = -1`. -/
example (F : Type) [Field F] [CharZero F] (T : Type*) [Category T] [Preadditive T] [Linear F T]
    [MonoidalCategory T] [SymmetricCategory T] [RightRigidCategory T] (hT : IsAbelianCat T)
    (hEnd : Nonempty (End (𝟙_ T) ≃ₐ[F] F)) (ι : T ⥤ GradedVect F) [ι.Braided] [ι.Full]
    [ι.Faithful] (X : T) (hX : Nonempty (ι.obj X ≅ GradedVect.shift F (-1))) :
    ¬ IsTannakian F T := by
  sorry

end Tests

/-! ### MC.3/pseudo-abelian-semisimplicity and MC.3/dual-numbers-non-example -/

section PseudoAbelian

variable (F : Type) [Field F] (D : Type*) [Category D] [Preadditive D] [Linear F D]
  [HasFiniteBiproducts D] [IsIdempotentComplete D]

/-- The abelian structure on an `F`-linear pseudo-abelian category whose endomorphism algebras are
finite-dimensional and semisimple (MC.3/pseudo-abelian-semisimplicity). -/
abbrev Abelian.ofSemisimpleEnd
    (_h : ∀ M : D, FiniteDimensional F (End M) ∧ IsSemisimpleRing (End M)) : Abelian D :=
  sorry

/-- MC.3/pseudo-abelian-semisimplicity: an `F`-linear pseudo-abelian category in which every
`End(M)` is a finite-dimensional semisimple `F`-algebra is a semisimple abelian category, for the
abelian structure extending its preadditive one. -/
theorem semisimple_of_end
    (h : ∀ M : D, FiniteDimensional F (End M) ∧ IsSemisimpleRing (End M)) :
    (Abelian.ofSemisimpleEnd F D h).toPreadditive = (inferInstance : Preadditive D) ∧
      letI := Abelian.ofSemisimpleEnd F D h
      SemisimpleAbelian D := by
  sorry

end PseudoAbelian

/-- The category of finitely generated free modules over `R`. -/
abbrev FreeFGModCat (R : Type) [CommRing R] : Type 1 :=
  ObjectProperty.FullSubcategory fun M : ModuleCat.{0} R => Module.Free R M ∧ Module.Finite R M

/-- Finite direct sums of finitely generated free modules are finitely generated and free. -/
instance (R : Type) [CommRing R] : HasBinaryBiproducts (FreeFGModCat R) := sorry

/-- MC.3/dual-numbers-non-example: finitely generated free `ℚ[ε]`-modules form a pseudo-abelian
category with a faithful additive functor to `ℚ`-vector spaces, in which every indecomposable
object is simple, and which is not abelian: multiplication by `ε` on `ℚ[ε]` has no kernel. -/
theorem dualNumbers_not_abelian :
    IsIdempotentComplete (FreeFGModCat (DualNumber ℚ)) ∧
      (∃ G : FreeFGModCat (DualNumber ℚ) ⥤ ModuleCat.{0} ℚ, G.Faithful ∧ G.Additive) ∧
      (∀ X : FreeFGModCat (DualNumber ℚ), Indecomposable X → Simple X) ∧
      Simple (⟨ModuleCat.of (DualNumber ℚ) (DualNumber ℚ), inferInstance, inferInstance⟩ :
        FreeFGModCat (DualNumber ℚ)) ∧
      ¬ HasKernel ((DualNumber.eps : DualNumber ℚ) • 𝟙 (⟨ModuleCat.of (DualNumber ℚ) (DualNumber ℚ),
        inferInstance, inferInstance⟩ : FreeFGModCat (DualNumber ℚ))) ∧
      ¬ Nonempty (Abelian (FreeFGModCat (DualNumber ℚ))) := by
  sorry

/-! ### Numerical motives -/

variable {k : Type u} [Field k] (C : ChowTheory k) (F : Type v) [Field F] [CharZero F]

/-- Rational equivalence is finer than numerical equivalence. -/
theorem Adequate.rat_le_num : Adequate.rat C F ≤ NumEquiv.adequate C F :=
  (Adequate.rat_le_le_trivial _).1

/-- MC.3/numerical-quotient-functor: the functor from motives for rational equivalence to motives
for numerical equivalence (both with `F`-linear cycles), `(X, p, m) ↦ (X, p̄, m)`. -/
abbrev numQuotient : MotiveMod F (Adequate.rat C F) ⥤ MotiveMod F (NumEquiv.adequate C F) :=
  MotiveMod.map_le F (Adequate.rat_le_num C F)

/-- `(X, p, m)` is sent to `(X, p̄, m)`. -/
@[simp] theorem numQuotient_obj (M : MotiveMod F (Adequate.rat C F)) :
    ((numQuotient C F).obj M).X = ⟨M.X.obj, M.X.twist⟩ ∧
      ((numQuotient C F).obj M).p = CorrMod.reduce F _ (Adequate.rat_le_num C F) M.p :=
  ⟨rfl, rfl⟩

/-- The functor is full. -/
instance numQuotient_full : (numQuotient C F).Full := inferInstance

/-- The functor is `F`-linear and symmetric monoidal. -/
instance numQuotient_braided : (numQuotient C F).Braided := inferInstance

instance numQuotient_linear : (numQuotient C F).Linear F := sorry

/-- A morphism is sent to zero iff it is numerically trivial. -/
theorem numQuotient_map_eq_zero_iff {M N : MotiveMod F (Adequate.rat C F)} (f : M ⟶ N) :
    (numQuotient C F).map f = 0 ↔
      ∃ c : corrSubmoduleF C F M.X.obj N.X.obj (N.X.twist - M.X.twist),
        Submodule.Quotient.mk c = f.f ∧ (c : C.CHF F (M.X.obj.prod N.X.obj)) ∈ NumEquiv C F _ := by
  sorry

/-- `h(X)` is sent to the numerical motive of `X`, and `𝟙(n)` to `𝟙(n)`. -/
theorem numQuotient_h (X : SmProj k) (n : ℤ) :
    (numQuotient C F).obj (MotiveMod.ofPair F _ X 0) = MotiveMod.ofPair F _ X 0 ∧
      (numQuotient C F).obj (MotiveMod.ofPair F _ (SmProj.point k) n) =
        MotiveMod.ofPair F _ (SmProj.point k) n := by
  sorry

/-- Every numerical motive is a direct summand of the image of a Chow motive. -/
theorem numQuotient_summand (N : MotiveMod F (NumEquiv.adequate C F)) :
    ∃ M : MotiveMod F (Adequate.rat C F), Nonempty (Retract N ((numQuotient C F).obj M)) := by
  sorry

section Tests

/-- Unit test `numQuotient_unit`: the unit is sent to the unit, and both endomorphism algebras
are `F`. -/
example : Nonempty ((numQuotient C F).obj (𝟙_ _) ≅ 𝟙_ _) ∧
    Nonempty (End (𝟙_ (MotiveMod F (Adequate.rat C F))) ≃ₐ[F] F) ∧
    Nonempty (End (𝟙_ (MotiveMod F (NumEquiv.adequate C F))) ≃ₐ[F] F) := by
  sorry

/-- Unit test `numQuotient_not_faithful`: for a curve `E` with points `p`, `0` such that
`[p] - [0]` is nonzero in `CH_0(E) ⊗ F` (on an elliptic curve over an algebraically closed field,
exactly when `p` is not a torsion point, which needs a field such as `ℂ`; elliptic curves themselves
are not named here), the correspondence
`([p] - [0]) × E` is a nonzero morphism of Chow motives sent to zero. -/
example {E : SmProj k} (hE : E.IsCurve) (p o : E.RatPoint)
    (h : C.ofCH F (C.pushforward p 1 - C.pushforward o 1) ≠ 0) :
    ∃ f : MotiveMod.ofPair F (Adequate.rat C F) E 0 ⟶ MotiveMod.ofPair F _ E 0,
      f ≠ 0 ∧ (numQuotient C F).map f = 0 := by
  sorry

/-- Unit test `numQuotient_projectiveLine`: on `h(ℙ¹)` the functor is bijective on
endomorphisms, both algebras being `F × F`. -/
example : Function.Bijective (fun f : End (MotiveMod.ofPair F (Adequate.rat C F) (SmProj.projectiveLine k) 0) =>
      (numQuotient C F).map f) ∧
    Nonempty (End (MotiveMod.ofPair F (NumEquiv.adequate C F) (SmProj.projectiveLine k) 0) ≃ₐ[F] F × F) := by
  sorry

end Tests

/-! ### MC.3/jannsen-semisimplicity and its three steps -/

/-- MC.3/semisimple-category-implies-numerical: if the motives modulo an adequate relation form a
semisimple abelian category, the relation is numerical equivalence. -/
theorem semisimple_implies_numerical (A : Adequate C F)
    (h : ∃ _ : Abelian (MotiveMod F A), SemisimpleAbelian (MotiveMod F A)) :
    A = NumEquiv.adequate C F := by
  sorry

/-- MC.3/numerical-implies-semisimple-algebras: given a classical Weil cohomology theory over an
algebraic closure of `k`, `A_num^{dim X}(X × X, F)` is a finite-dimensional semisimple `F`-algebra
for every `X`. -/
theorem numerical_semisimple_algebras {C' : ChowTheory (AlgebraicClosure k)}
    (_B : ChowBaseChange (AlgebraicClosure k) C C') {Λ : Type v} [Field Λ] [CharZero Λ]
    (_H : WeilCohomology C' Λ) (X : SmProj k) :
    FiniteDimensional F (End (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)) ∧
      IsSemisimpleRing (End (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)) := by
  sorry

/-- MC.3/semisimple-algebras-imply-semisimple-category: if every `A^{dim X}(X × X)` is a
finite-dimensional semisimple `F`-algebra, the motives modulo `∼` form a semisimple abelian
category. -/
theorem semisimple_category_of_algebras (A : Adequate C F)
    (h : ∀ X : SmProj k, FiniteDimensional F (End (MotiveMod.ofPair F A X 0)) ∧
      IsSemisimpleRing (End (MotiveMod.ofPair F A X 0))) :
    ∃ _ : Abelian (MotiveMod F A), SemisimpleAbelian (MotiveMod F A) := by
  sorry

/-- MC.3/jannsen-semisimplicity (unconditional): for an adequate relation `∼` on `F`-linear
cycles, the following are equivalent: (a) the motives modulo `∼` form a semisimple abelian
category; (b) every `A^{dim X}(X × X)` is a finite-dimensional semisimple `F`-algebra; (c) `∼` is
numerical equivalence. -/
theorem jannsen (A : Adequate C F) :
    List.TFAE [∃ _ : Abelian (MotiveMod F A), SemisimpleAbelian (MotiveMod F A),
      ∀ X : SmProj k, FiniteDimensional F (End (MotiveMod.ofPair F A X 0)) ∧
        IsSemisimpleRing (End (MotiveMod.ofPair F A X 0)),
      A = NumEquiv.adequate C F] := by
  sorry

/-! ### MC.3/numerical-cycles-finite-dimensional, radical-base-change,
nilpotent-of-vanishing-power-traces -/

/-- MC.3/numerical-cycles-finite-dimensional: given a classical Weil cohomology theory over an
algebraic closure of `k`, `A^j_num(X, ℚ)` is finite-dimensional, `A^j_num(X, ℚ) ⊗ F ≅ A^j_num(X, F)`,
and the numerical correspondence spaces are finite-dimensional. -/
theorem numerical_finiteDimensional {C' : ChowTheory (AlgebraicClosure k)}
    (_B : ChowBaseChange (AlgebraicClosure k) C C') {Λ : Type v} [Field Λ] [CharZero Λ]
    (_H : WeilCohomology C' Λ) (X Y : SmProj k) (j r : ℤ) :
    FiniteDimensional ℚ ((NumEquiv.adequate C ℚ).quotient X j) ∧
      Nonempty (F ⊗[ℚ] (NumEquiv.adequate C ℚ).quotient X j ≃ₗ[F]
        (NumEquiv.adequate C F).quotient X j) ∧
      FiniteDimensional F (CorrMod F (NumEquiv.adequate C F) X Y r) := by
  sorry

/-- MC.3/radical-base-change: for a finite-dimensional algebra `A` over a field `E` of
characteristic zero and an extension `K/E`, `J(K ⊗_E A) = K ⊗_E J(A)`; in particular `K ⊗_E A` is
semisimple iff `A` is. -/
theorem jacobson_baseChange (E : Type*) [Field E] [CharZero E] (K : Type*) [Field K] [Algebra E K]
    (A : Type*) [Ring A] [Algebra E A] [FiniteDimensional E A] :
    (((⊥ : Ideal (K ⊗[E] A)).jacobson : Set (K ⊗[E] A)) =
      LinearMap.range ((((⊥ : Ideal A).jacobson.restrictScalars E).subtype).lTensor K)) ∧
      (IsSemisimpleRing (K ⊗[E] A) ↔ IsSemisimpleRing A) := by
  sorry

/-- MC.3/nilpotent-of-vanishing-power-traces: over a field of characteristic zero, an
endomorphism of a finite-dimensional space with `Tr(φ^n) = 0` for all `n ≥ 1` is nilpotent. -/
theorem isNilpotent_of_trace_pow_eq_zero {A V : Type*} [Field A] [CharZero A] [AddCommGroup V]
    [Module A V] [FiniteDimensional A V] (φ : Module.End A V)
    (h : ∀ n : ℕ, 1 ≤ n → LinearMap.trace A V (φ ^ n) = 0) : IsNilpotent φ := by
  sorry

/-! ### Homological and numerical correspondences -/

section Homological

variable {C} {C' : ChowTheory (AlgebraicClosure k)} (B : ChowBaseChange (AlgebraicClosure k) C C')
  {A : Type v} [Field A] [CharZero A] (H : WeilCohomology C' A) [Algebra F A]

/-- Homologically trivial classes over `k` are numerically trivial. -/
theorem baseChange_homEquiv_le_num : H.baseChange_homEquiv B F ≤ NumEquiv.adequate C F := by
  sorry

/-- Reduction modulo a coarser relation sends `(X, [Δ], m)` to `(X, [Δ], m)`. -/
theorem MotiveMod.map_le_ofPair {A₁ A₂ : Adequate C F} (h : A₁ ≤ A₂) (X : SmProj k) (m : ℤ) :
    (MotiveMod.map_le F h).obj (MotiveMod.ofPair F A₁ X m) = MotiveMod.ofPair F A₂ X m := by
  sorry

/-- The surjection `S : A_hom^d(X × X, F) → A_num^d(X × X, F)` of MC.3. -/
def homToNum (X : SmProj k) :
    End (MotiveMod.ofPair F (H.baseChange_homEquiv B F) X 0) →+*
      End (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0) where
  toFun f := eqToHom (MotiveMod.map_le_ofPair F (baseChange_homEquiv_le_num F B H) X 0).symm ≫
    (MotiveMod.map_le F (baseChange_homEquiv_le_num F B H)).map f ≫
      eqToHom (MotiveMod.map_le_ofPair F (baseChange_homEquiv_le_num F B H) X 0)
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- MC.3/trace-formula-for-correspondences: for `F`-linear correspondences `f`, `g` of degree zero
on a variety `X` of dimension `d`, `⟨f · ᵗg⟩ = Σ_{i=0}^{2d} (-1)^i Tr_i(f ∘ g)`, with Jannsen's
composition `f ∘ g = p₁₃,*(p₁₂^*g · p₂₃^*f)`, the intersection number taken on `X × X`. -/
theorem trace_formula {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (hXv : X.IsVariety)
    (f g : C.CHF F (X.prod X)) (hf : f ∈ corrSubmoduleF C F X X 0) (hg : g ∈ corrSubmoduleF C F X X 0) :
    algebraMap F A (C.degF F _ (f * C.pullbackF F (SmProj.swap X X) g)) =
      ∑ i ∈ Finset.range (2 * d + 1), (-1 : A) ^ i *
        (H.baseChange B).degreeTrace X i
          ((H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ (C.compF F f g))) := by
  sorry

/-- MC.3/radical-of-homological-correspondences: if the Künneth components of `X` are algebraic,
every numerically trivial `f` has `Tr_i(f) = 0` for all `i` and acts nilpotently, and the kernel of
`S : B → A_num` is the Jacobson radical of `B = A_hom^{dim X}(X × X, F)`, a nilpotent ideal. -/
theorem radical_eq_kernel {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) (hXv : X.IsVariety)
    (hK : IsAlgebraicKunneth B H X hX) :
    (∀ c ∈ corrSubmoduleF C F X X 0, c ∈ NumEquiv C F (X.prod X) →
      (∀ i : ℤ, (H.baseChange B).degreeTrace X i
        ((H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ c)) = 0) ∧
      IsNilpotent ((H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ c))) ∧
    Function.Surjective (homToNum F B H X) ∧
    RingHom.ker (homToNum F B H X) = (⊥ : Ideal _).jacobson ∧
    ∃ n : ℕ, ∀ f : Fin n → End (MotiveMod.ofPair F (H.baseChange_homEquiv B F) X 0),
      (∀ i, f i ∈ RingHom.ker (homToNum F B H X)) → (List.ofFn f).prod = 0 := by
  sorry

/-- MC.3/cohomology-of-numerical-motives: for `X` with algebraic Künneth components and an
idempotent `p` of `A_num^d(X × X)`, `p` lifts to an idempotent `p'` of `A_hom^d(X × X)`, any two
idempotent lifts are conjugate by a unit, and for a representative `c` of a lift,
`Tr_{i+2m}(p') = dim_A p'H^{i+2m}(X) = dim_A H^i(X, p, m)`. -/
theorem cohomology_numericalMotive {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d)
    (hXv : X.IsVariety) (hK : IsAlgebraicKunneth B H X hX)
    (p : End (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)) (hp : p * p = p) (i m : ℤ) :
    (∃ p' : End (MotiveMod.ofPair F (H.baseChange_homEquiv B F) X 0),
      p' * p' = p' ∧ homToNum F B H X p' = p) ∧
    (∀ p' p'' : End (MotiveMod.ofPair F (H.baseChange_homEquiv B F) X 0),
      p' * p' = p' → p'' * p'' = p'' → homToNum F B H X p' = p → homToNum F B H X p'' = p →
      ∃ w : (End (MotiveMod.ofPair F (H.baseChange_homEquiv B F) X 0))ˣ, p'' = w * p' * ↑w⁻¹) ∧
    ∀ c : corrSubmoduleF C F X X (0 - 0),
      homToNum F B H X ((Idempotents.toKaroubi _).map
        (Submodule.Quotient.mk c : CorrMod F (H.baseChange_homEquiv B F) X X (0 - 0))) = p →
      (H.baseChange B).degreeTrace X (i + 2 * m)
          ((H.baseChange B).corrOp ((H.baseChange B).cycleMapF F _ (c : C.CHF F (X.prod X)))) =
        (Module.finrank A (LinearMap.range ((H.baseChange B).corrOp
          ((H.baseChange B).cycleMapF F _ (c : C.CHF F (X.prod X))) ∘ₗ
          (H.baseChange B).gradeProj X (i + 2 * m))) : A) := by
  sorry

/-- The sign-modified commutativity constraint on numerical motives: on `M^r ⊗ N^s` the constraint
induced by the switch of factors is multiplied by `(-1)^{rs}`, the grading coming from the
numerical Künneth projectors (defined when every variety has algebraic Künneth components). -/
abbrev numMotiveSignedSymmetric
    (_hK : ∀ (X : SmProj k) (d : ℕ) (hX : X.IsEquidim d), IsAlgebraicKunneth B H X hX) :
    SymmetricCategory (MotiveMod F (NumEquiv.adequate C F)) :=
  sorry

/-- MC.3/numerical-motives-tannakian: if the Künneth components of every variety over `k` are
algebraic, their numerical images are central orthogonal idempotents, and with the
sign-modified constraint the numerical motives form a semisimple `F`-linear Tannakian category
in which `rk(X, p, m) = Σ_i dim_A pH^i(X) ≥ 0`. The conclusion is Tannakian, not neutral. -/
theorem numerical_tannakian
    (hK : ∀ (X : SmProj k) (d : ℕ) (hX : X.IsEquidim d), IsAlgebraicKunneth B H X hX) :
    (∃ _ : Abelian (MotiveMod F (NumEquiv.adequate C F)),
      SemisimpleAbelian (MotiveMod F (NumEquiv.adequate C F))) ∧
    letI := numMotiveSignedSymmetric F B H hK
    IsTannakian F (MotiveMod F (NumEquiv.adequate C F)) ∧
      ∀ M : MotiveMod F (NumEquiv.adequate C F), ∃ n : ℕ, Monoidal.rank M Mᘁ = (n : F) • 𝟙 _ := by
  sorry

end Homological

/-- MC.3/rank-of-a-motive: with the unmodified constraint, the rank of the numerical motive
`h(X)` of an equidimensional `X` is `⟨Δ · Δ⟩`; for a curve with `deg c₁(T_X) = 2 - 2g` it is
`2 - 2g`; so, if `k` has such a curve with `g ≥ 2`, the numerical motives with this constraint are
not Tannakian. -/
theorem rank_eq_selfIntersection (K : ChernTheory C) {X : SmProj k} {d : ℕ} (hX : X.IsEquidim d) :
    Monoidal.rank (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)
        (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)ᘁ =
      (C.degF F _ (C.classOf F (SmProj.diag X) * C.classOf F (SmProj.diag X))) • 𝟙 _ ∧
    ∀ g : ℕ, X.IsCurve → C.deg X (K.chern (K.tangent X) 1) = 2 - 2 * (g : ℤ) →
      Monoidal.rank (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)
          (MotiveMod.ofPair F (NumEquiv.adequate C F) X 0)ᘁ = ((2 - 2 * g : ℤ) : F) • 𝟙 _ ∧
      (2 ≤ g → ¬ IsTannakian F (MotiveMod F (NumEquiv.adequate C F))) := by
  sorry

end MC3

section MC4

open CategoryTheory Limits AlgebraicGeometry MonoidalCategory Pretriangulated Opposite

/-! ## MC.4 Geometric mixed motives and motivic cohomology

Everything RS-08 assigns to `MotivicEtaleKTheory:M.4` and `M.5a` is a parameter here, never a
definition:

* M.5a supplies the ambient triangulated category `DM` of effective motives
  `DM^{eff,-}_Nis(k, R)` as a variable with its instances (preadditive, shifted, pretriangulated,
  triangulated, symmetric monoidal, the tensor product additive in each variable), the category
  `Cor` of finite correspondences as a variable, and, in the structure `DMeffData`, the graph
  functor, the presheaves with transfers `ℤ_tr(Y)`, the functor `F ↦ C_*(F ⊗ R)` into `DM`, the
  Tate object `R(1)`, the tensor and unit isomorphisms and the internal Hom `RHom(M(X), -)`;
* Voevodsky's cancellation theorem enters as an explicit hypothesis of the statements that use
  it, as the bijectivity of `f ↦ f ▷ R(1)` on every Hom group;
* M.4 supplies Bloch's higher Chow groups and the hypercohomology of the cycle complexes, in the
  structure `HigherChowData`;
* SF.4 supplies resolution of singularities, which cannot be stated against Mathlib (it refers
  to blow-ups with smooth centres). The statements the source makes over a perfect field with
  resolution of singularities are made here over a field of characteristic zero, Hironaka's
  proved setting, which also makes `k` perfect.

The sheaf-level inputs of M.5a (MVW 6.12, 11.2, 12.20, 13.8, 13.14, 13.25) cannot be stated before
M.5a defines Nisnevich sheaves with transfers; they are what makes the theorems below hold for
the instance of `DMeffData` that M.5a constructs, and an arbitrary instance of the structure need
not satisfy them. -/

/-! ### Schemes of finite type and smooth schemes -/

variable (k : Type u) [Field k]

/-- `Sch/k`: separated schemes of finite type over `k`. -/
abbrev SchFT : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun X : Over (Spec (CommRingCat.of k)) =>
    LocallyOfFiniteType X.hom ∧ QuasiCompact X.hom ∧ IsSeparated X.hom

/-- `Sm/k`: smooth separated schemes of finite type over `k`. -/
abbrev SmSch : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun X : Over (Spec (CommRingCat.of k)) =>
    Smooth X.hom ∧ QuasiCompact X.hom ∧ IsSeparated X.hom

/-- A morphism of schemes `f` is equidimensional of relative dimension `d`: every irreducible
component of every fibre has dimension `d`. -/
def IsEquidimOfRelDim {X Y : Scheme.{u}} (f : X ⟶ Y) (d : ℕ) : Prop :=
  ∀ y : Y, ∀ W ∈ irreducibleComponents ↥(f.base ⁻¹' {y}), topologicalKrullDim ↥W = d

variable {k}

namespace SchFT

variable (k) in
/-- `Spec k` as a scheme of finite type. -/
def point : SchFT k := ⟨Over.mk (𝟙 _), sorry⟩

/-- The product `X ×_k Y`. -/
def prod (X Y : SchFT k) : SchFT k :=
  ⟨Over.mk (pullback.fst X.obj.hom Y.obj.hom ≫ X.obj.hom), sorry⟩

/-- The first projection `X ×_k Y ⟶ X`. -/
def fst (X Y : SchFT k) : X.prod Y ⟶ X :=
  ObjectProperty.homMk (Over.homMk (pullback.fst X.obj.hom Y.obj.hom))

/-- An open subscheme. -/
def ofOpen (X : SchFT k) (U : X.obj.left.Opens) : SchFT k := ⟨Over.mk (U.ι ≫ X.obj.hom), sorry⟩

/-- The inclusion of an open subscheme. -/
def ofOpenι (X : SchFT k) (U : X.obj.left.Opens) : ofOpen X U ⟶ X :=
  ObjectProperty.homMk (Over.homMk U.ι)

instance (X : SchFT k) (U : X.obj.left.Opens) : Etale (ofOpenι X U).hom.left := sorry

/-- The open complement `X - Z` of a closed subscheme `i : Z ⟶ X`. -/
def complement {X Z : SchFT k} (i : Z ⟶ X) : X.obj.left.Opens :=
  ⟨(Set.range i.hom.left.base)ᶜ, sorry⟩

end SchFT

namespace SmSch

/-- A smooth scheme as a scheme of finite type. -/
def toSchFT : SmSch k ⥤ SchFT k := ObjectProperty.ιOfLE fun _ h => ⟨sorry, h.2.1, h.2.2⟩

/-- A smooth proper scheme as a smooth scheme. -/
def ofSmProj : SmProj k ⥤ SmSch k := ObjectProperty.ιOfLE fun _ h => ⟨h.1, sorry, sorry⟩

variable (k) in
/-- `Spec k`. -/
def point : SmSch k := ⟨Over.mk (𝟙 _), sorry⟩

/-- The product `X ×_k Y`. -/
def prod (X Y : SmSch k) : SmSch k :=
  ⟨Over.mk (pullback.fst X.obj.hom Y.obj.hom ≫ X.obj.hom), sorry⟩

/-- The first projection `X ×_k Y ⟶ X`. -/
def fst (X Y : SmSch k) : X.prod Y ⟶ X :=
  ObjectProperty.homMk (Over.homMk (pullback.fst X.obj.hom Y.obj.hom))

/-- An open subscheme of a smooth scheme. -/
def ofOpen (X : SmSch k) (U : X.obj.left.Opens) : SmSch k := ⟨Over.mk (U.ι ≫ X.obj.hom), sorry⟩

/-- The inclusion of an open subscheme. -/
def ofOpenι (X : SmSch k) (U : X.obj.left.Opens) : ofOpen X U ⟶ X :=
  ObjectProperty.homMk (Over.homMk U.ι)

/-- The open complement `X - Z` of a closed subscheme `i : Z ⟶ X`. -/
def complement {X Z : SmSch k} (i : Z ⟶ X) : X.obj.left.Opens :=
  ⟨(Set.range i.hom.left.base)ᶜ, sorry⟩

variable (k) in
/-- Affine space `𝔸ⁿ_k`. -/
def affineSpace (n : ℕ) : SmSch k :=
  ⟨Over.mk (𝔸(ULift.{u} (Fin n); Spec (CommRingCat.of k)) ↘ Spec (CommRingCat.of k)), sorry⟩

variable (k) in
/-- The affine line `𝔸¹_k`. -/
abbrev affineLine : SmSch k := affineSpace k 1

variable (k) in
/-- The origin of `𝔸¹_k`. -/
def origin : point k ⟶ affineLine k :=
  ObjectProperty.homMk (Over.homMk (AffineSpace.homOfVector (𝟙 _) fun _ => 0) sorry)

variable (k) in
/-- The multiplicative group `𝔾_m = Spec k[t, t⁻¹]`. -/
def multiplicativeGroup : SmSch k :=
  ⟨Over.mk (Spec.map (CommRingCat.ofHom (algebraMap k (LaurentPolynomial k)))), sorry⟩

variable (k) in
/-- The rational point `1` of `𝔾_m`. -/
def multiplicativeGroupOne : point k ⟶ multiplicativeGroup k :=
  ObjectProperty.homMk (Over.homMk
    (Spec.map (CommRingCat.ofHom (LaurentPolynomial.eval₂ (RingHom.id k) 1))) sorry)

variable (k) in
/-- Projective space `ℙⁿ_k`, from `SmProj.projectiveSpace`. -/
abbrev projectiveSpace (n : ℕ) : SmSch k := ofSmProj.obj (SmProj.projectiveSpace k n)

variable (k) in
/-- The linear embedding `ℙⁱ ⊆ ℙⁿ` for `i ≤ n`, onto the vanishing locus of the last
`n - i` coordinates; the embeddings for `i ≤ j ≤ n` are compatible. -/
def linearEmbedding {i n : ℕ} (_h : i ≤ n) : projectiveSpace k i ⟶ projectiveSpace k n := sorry

/-- The spectrum of the residue field `k(x)` of a closed point of a smooth scheme over a perfect
field, which is finite separable over `k`. -/
def ofClosedPoint [PerfectField k] (X : SmSch k) (x : X.obj.left) (_hx : IsClosed {x}) :
    SmSch k :=
  ⟨Over.mk (X.obj.left.fromSpecResidueField x ≫ X.obj.hom), sorry⟩

/-- The inclusion `Spec k(x) ⟶ X` of a closed point. -/
def ofClosedPointι [PerfectField k] (X : SmSch k) (x : X.obj.left) (hx : IsClosed {x}) :
    ofClosedPoint X x hx ⟶ X :=
  ObjectProperty.homMk (Over.homMk (X.obj.left.fromSpecResidueField x))

/-- `p : E ⟶ X` is Zariski locally trivial with fibre `𝔸ⁿ` (the total space of a vector bundle of
rank `n`, trivial on the members of a finite Zariski cover). -/
def IsAffineBundle {E X : SmSch k} (p : E ⟶ X) (n : ℕ) : Prop :=
  ∃ (ι : Type u) (_ : Finite ι) (U : ι → X.obj.left.Opens), iSup U = ⊤ ∧
    ∀ i, ∃ e : (p.hom.left ⁻¹ᵁ U i).toScheme ≅ 𝔸(ULift.{u} (Fin n); (U i).toScheme),
      e.hom ≫ (𝔸(ULift.{u} (Fin n); (U i).toScheme) ↘ (U i).toScheme) = p.hom.left ∣_ U i

/-- `p : P ⟶ X` is Zariski locally trivial with fibre `ℙⁿ` (a projective bundle `ℙ(E)` of a
vector bundle `E` of rank `n + 1`, trivial on the members of a finite Zariski cover). -/
def IsProjectiveBundle {P X : SmSch k} (p : P ⟶ X) (n : ℕ) : Prop :=
  ∃ (ι : Type u) (_ : Finite ι) (U : ι → X.obj.left.Opens), iSup U = ⊤ ∧
    ∀ i, ∃ e : (p.hom.left ⁻¹ᵁ U i).toScheme ≅
        pullback ((U i).ι ≫ X.obj.hom) (projectiveSpace k n).obj.hom,
      e.hom ≫ pullback.fst _ _ = p.hom.left ∣_ U i

variable (k) in
/-- The étale topology on `Sm/k`, induced from the big étale site of `Spec k`. -/
def etaleTopology : GrothendieckTopology (SmSch k) :=
  (ObjectProperty.ι _).inducedTopology (Scheme.etaleTopology.over (Spec (CommRingCat.of k)))

end SmSch

/-! ### The inputs of M.5a and M.4 -/

/-- MotivicEtaleKTheory:M.5a. The data of the effective motivic category `DM` =
`DM^{eff,-}_Nis(k, R)` that MC.4 is stated against (MVW Lectures 1, 2, 3, 14). `Cor` is the
category of finite correspondences between smooth schemes (MVW Lecture 1); a presheaf with
transfers is a functor `Corᵒᵖ ⥤ AddCommGrpCat`. -/
structure DMeffData (k : Type u) [Field k] (R : Type*) [CommRing R] (Cor : Type (u + 1))
    [Category.{u} Cor] (DM : Type w) [Category.{v} DM] [MonoidalCategory DM] where
  /-- The graph functor `Sm/k ⥤ Cor`, the identity on objects, sending a morphism to its graph
  as a finite correspondence (MVW Lecture 1). -/
  gr : SmSch k ⥤ Cor
  /-- The presheaf with transfers `ℤ_tr(Y)` of a separated scheme of finite type (MVW Lectures 2
  and 16); for `Y` smooth it is represented by `Y`. -/
  Ztr : SchFT k ⥤ (Corᵒᵖ ⥤ AddCommGrpCat.{u})
  /-- The functor `F ↦ C_*(F ⊗ R)`, the class in `DM` of the Suslin complex of the associated
  Nisnevich sheaf with transfers with `R`-coefficients (MVW Lecture 14). -/
  ofPST : (Corᵒᵖ ⥤ AddCommGrpCat.{u}) ⥤ DM
  /-- The Tate object `R(1) = C_* R_tr(𝔾_m^{∧1})[-1]` (MVW Definition 3.1). -/
  tate : DM
  /-- `M(X × Y) ≅ M(X) ⊗ M(Y)` (MVW 14.2, 8.10). -/
  tensorIso : ∀ X Y : SmSch k, ofPST.obj (Ztr.obj (SmSch.toSchFT.obj (X.prod Y))) ≅
    ofPST.obj (Ztr.obj (SmSch.toSchFT.obj X)) ⊗ ofPST.obj (Ztr.obj (SmSch.toSchFT.obj Y))
  /-- `M(Spec k) = R`, the unit object. -/
  unitIso : ofPST.obj (Ztr.obj (SmSch.toSchFT.obj (SmSch.point k))) ≅ 𝟙_ DM
  /-- The internal Hom `RHom(A, -)` (MVW Remark 14.12). -/
  rhom : DM → DM ⥤ DM
  /-- `RHom(A, -)` is right adjoint to `A ⊗ -` for `A` a direct summand of the motive of a smooth
  scheme (MVW 14.12). -/
  rhomAdj : ∀ (A : DM) (X : SmSch k),
    Retract A (ofPST.obj (Ztr.obj (SmSch.toSchFT.obj X))) → (tensorLeft A ⊣ rhom A)

/-- MotivicEtaleKTheory:M.4. Bloch's higher Chow groups `CH^i(X, m)` (MVW 17.1) with their
vanishing in negative degrees, and the Zariski hypercohomology `H^n(X, z^i(- × 𝔸^i, *))` of the
cycle complexes (MVW 19.8). -/
structure HigherChowData (k : Type u) [Field k] where
  /-- `CH^i(X, m)`. -/
  higherChow : SmSch k → ℕ → ℤ → Type u
  [addCommGroup : ∀ X i m, AddCommGroup (higherChow X i m)]
  /-- The Bloch–Levine pullbacks (MVW 19.13–19.16). -/
  pullback : ∀ {X Y : SmSch k} (_ : X ⟶ Y) (i : ℕ) (m : ℤ), higherChow Y i m →+ higherChow X i m
  /-- `CH^i(X, m) = 0` for `m < 0`. -/
  vanishing : ∀ X i m, m < 0 → Subsingleton (higherChow X i m)
  /-- `H^n_Zar(X, z^i(- × 𝔸^i, *))`. -/
  cycleComplexCohomology : SmSch k → ℕ → ℤ → Type u
  [addCommGroup' : ∀ X i n, AddCommGroup (cycleComplexCohomology X i n)]

attribute [instance] HigherChowData.addCommGroup HigherChowData.addCommGroup'

/-! ### Inverting an object of a monoidal category (MC.4/inverting-a-tensor-object) -/

section InvertObjectSection

/-- MC.4/inverting-a-tensor-object: the category `C[T⁻¹]`, with objects the pairs `(X, m)`
standing for `X ⊗ T^{⊗ m}`, and `Hom((X, m), (Y, n))` the colimit over `i` of
`Hom(X ⊗ T^{⊗ (m + i)}, Y ⊗ T^{⊗ (n + i)})` (MVW 8A.7). -/
@[nolint unusedArguments]
structure InvertObject (C : Type w) [Category.{v} C] [MonoidalCategory C] (_T : C) where
  ofPair ::
  /-- The object `X`. -/
  obj : C
  /-- The exponent `m`. -/
  exp : ℤ

variable (C : Type w) [Category.{v} C] [MonoidalCategory C] (T : C)

namespace InvertObject

variable {C}

/-- The tensor powers, `T^{⊗ (n + 1)} = T^{⊗ n} ⊗ T`. -/
def pow : ℕ → C
  | 0 => 𝟙_ C
  | n + 1 => pow n ⊗ T

/-- The directed system `i ↦ Hom(X ⊗ T^{⊗ (a + i)}, Y ⊗ T^{⊗ (b + i)})`, the transition maps
tensoring with `T`. -/
def homSystem (X Y : C) (a b : ℕ) : ℕ ⥤ Type v :=
  Functor.ofSequence (X := fun i => (X ⊗ pow T (a + i) ⟶ Y ⊗ pow T (b + i)))
    fun i => TypeCat.ofHom fun f =>
      (α_ X (pow T (a + i)) T).inv ≫ (f ▷ T) ≫ (α_ Y (pow T (b + i)) T).hom

instance instCategory : Category (InvertObject C T) where
  Hom A B := colimit (homSystem T A.obj B.obj (A.exp + (A.exp.natAbs + B.exp.natAbs)).toNat
    (B.exp + (A.exp.natAbs + B.exp.natAbs)).toNat)
  id := sorry
  comp := sorry
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The object `(X, m)`. -/
def mk (X : C) (m : ℤ) : InvertObject C T := ⟨X, m⟩

/-- The functor `C ⥤ C[T⁻¹]`, `X ↦ (X, 0)`. -/
def of : C ⥤ InvertObject C T where
  obj X := mk T X 0
  map f := sorry
  map_id := sorry
  map_comp := sorry

/-- `Hom((X, m), (Y, n))` is the colimit of the `Hom(X ⊗ T^{⊗ (m + i)}, Y ⊗ T^{⊗ (n + i)})`,
computed from any pair `a, b` with `a - m = b - n`. -/
def homEquiv {X Y : C} {m n : ℤ} {a b : ℕ} (_h : (a : ℤ) - m = b - n) :
    (mk T X m ⟶ mk T Y n) ≃ colimit (homSystem T X Y a b) := sorry

/-- The morphism `(X, m) ⟶ (Y, n)` represented by `f : X ⊗ T^{⊗ a} ⟶ Y ⊗ T^{⊗ b}`. -/
def ofRep {X Y : C} {m n : ℤ} (a b : ℕ) (h : (a : ℤ) - m = b - n)
    (f : X ⊗ pow T a ⟶ Y ⊗ pow T b) : mk T X m ⟶ mk T Y n :=
  (homEquiv T h).symm (colimit.ι (homSystem T X Y a b) 0 f)

/-- Two morphisms are equal when their representatives agree after tensoring with a common
power of `T`. -/
theorem hom_ext {X Y : C} {m n : ℤ} (a b : ℕ) (h : (a : ℤ) - m = b - n)
    (f g : X ⊗ pow T a ⟶ Y ⊗ pow T b) :
    ofRep T a b h f = ofRep T a b h g ↔ ∃ j : ℕ,
      (homSystem T X Y a b).map (homOfLE (Nat.zero_le j)) f =
        (homSystem T X Y a b).map (homOfLE (Nat.zero_le j)) g := sorry

/-- `(X, m) ≅ (X ⊗ T^{⊗ m}, 0)` for `m ≥ 0`. -/
def mkIsoTensor (X : C) (m : ℕ) : mk T X m ≅ (of T).obj (X ⊗ pow T m) := sorry

/-- The autoequivalence `(X, m) ↦ (X, m + 1)`, the identity on representatives. -/
def twistEquiv : InvertObject C T ≌ InvertObject C T := sorry

theorem twistEquiv_obj (X : C) (m : ℤ) : (twistEquiv T).functor.obj (mk T X m) = mk T X (m + 1) :=
  sorry

/-- The monoidal structure `(X, m) ⊗ (Y, n) = (X ⊗ Y, m + n)`, under the hypothesis that the
cyclic permutation of `T ⊗ T ⊗ T` is the identity (MVW 8A.8); without it `C[T⁻¹]` need not be
monoidal in this way (MVW Exercise 8A.9). -/
@[instance_reducible]
def monoidal [BraidedCategory C] (_h : (β_ (T ⊗ T) T).hom ≫ (α_ T T T).inv = 𝟙 _) :
    MonoidalCategory (InvertObject C T) := sorry

theorem mk_tensor_tate [BraidedCategory C] (h : (β_ (T ⊗ T) T).hom ≫ (α_ T T T).inv = 𝟙 _)
    (X : C) (m : ℤ) :
    letI := monoidal T h
    Nonempty (mk T X m ⊗ mk T T 0 ≅ mk T X (m + 1)) := sorry

/-- `(T, 0)` is invertible with inverse `(𝟙, -1)`. -/
theorem invertible [BraidedCategory C] (h : (β_ (T ⊗ T) T).hom ≫ (α_ T T T).inv = 𝟙 _) :
    letI := monoidal T h
    Nonempty (mk T T 0 ⊗ mk T (𝟙_ C) (-1) ≅ 𝟙_ (InvertObject C T)) := sorry

/-- The symmetric monoidal structure, under the cyclic permutation hypothesis. -/
@[instance_reducible]
def instSymmetricCategory [SymmetricCategory C]
    (h : (β_ (T ⊗ T) T).hom ≫ (α_ T T T).inv = 𝟙 _) :
    letI := monoidal T h
    SymmetricCategory (InvertObject C T) := sorry

instance instPreadditive [Preadditive C] [MonoidalPreadditive C] :
    Preadditive (InvertObject C T) := sorry

instance instHasZeroObject [Preadditive C] [HasZeroObject C] :
    HasZeroObject (InvertObject C T) := sorry

instance instHasShift [HasShift C ℤ] : HasShift (InvertObject C T) ℤ := sorry

instance instShiftAdditive [Preadditive C] [MonoidalPreadditive C] [HasShift C ℤ] (n : ℤ) :
    (shiftFunctor (InvertObject C T) n).Additive := sorry

/-- The triangulated structure when `C` is tensor triangulated, the distinguished triangles
being those isomorphic to images of distinguished triangles of `C` (MVW 8A.7). -/
instance instPretriangulated [Preadditive C] [MonoidalPreadditive C] [HasZeroObject C]
    [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C]
    [(tensorRight T).CommShift ℤ] [(tensorRight T).IsTriangulated] :
    Pretriangulated (InvertObject C T) := sorry

/-- If tensoring with `T` is fully faithful on `C`, then `C ⥤ C[T⁻¹]` is fully faithful. -/
theorem of_fullyFaithful [(tensorRight T).Full] [(tensorRight T).Faithful] :
    (of T).Full ∧ (of T).Faithful := sorry

/-- The universal property: a monoidal functor `F : C ⥤ D` with `F(T)` invertible factors through
`C ⥤ C[T⁻¹]`, uniquely up to isomorphism, under the cyclic permutation hypothesis. -/
theorem lift [BraidedCategory C] (h : (β_ (T ⊗ T) T).hom ≫ (α_ T T T).inv = 𝟙 _)
    {D : Type*} [Category D] [MonoidalCategory D] (F : C ⥤ D) [F.Monoidal] (U : D)
    (_hU : F.obj T ⊗ U ≅ 𝟙_ D) :
    letI := monoidal T h
    ∃ (G : InvertObject C T ⥤ D) (_ : G.Monoidal), Nonempty (of T ⋙ G ≅ F) ∧
      ∀ (G' : InvertObject C T ⥤ D), Nonempty (of T ⋙ G' ≅ F) → Nonempty (G ≅ G') := sorry

end InvertObject

/-- Unit test `invert_unit`: for `T` the unit object, `C ⥤ C[T⁻¹]` is an equivalence. -/
example : (InvertObject.of (𝟙_ C)).IsEquivalence := sorry

/-- Unit test `invert_discrete_nat`: for the discrete monoidal category of the natural numbers
under addition and `T = 1`, `C[T⁻¹]` is equivalent to the discrete category of the integers. -/
example : Nonempty (InvertObject (Discrete (Multiplicative ℕ))
    (Discrete.mk (Multiplicative.ofAdd 1)) ≌ Discrete ℤ) := sorry

/-- Unit test `invert_kills_torsion`: for abelian groups and `T = ℚ`, the object `(ℤ/p, 0)` is a
zero object of `C[T⁻¹]`, because `ℤ/p ⊗ ℚ = 0`. -/
example (p : ℕ) [Fact p.Prime] :
    IsZero (InvertObject.mk (ModuleCat.of ℤ ℚ) (ModuleCat.of ℤ (ZMod p)) 0) := sorry

/-- Unit test `twist_equivalence`: tensoring with `(T, 0)` is an autoequivalence of `C[T⁻¹]`
with inverse tensoring with `(𝟙, -1)`. -/
example [BraidedCategory C] (h : (β_ (T ⊗ T) T).hom ≫ (α_ T T T).inv = 𝟙 _) :
    letI := InvertObject.monoidal T h
    Nonempty (tensorLeft (InvertObject.mk T T 0) ⋙ tensorLeft (InvertObject.mk T (𝟙_ C) (-1)) ≅
        𝟭 _) ∧
      Nonempty (tensorLeft (InvertObject.mk T (𝟙_ C) (-1)) ⋙ tensorLeft (InvertObject.mk T T 0) ≅
        𝟭 _) := sorry

end InvertObjectSection

/-! ### The motive functors and the effective geometric motives -/

section Effective

variable {R : Type*} [CommRing R] {Cor : Type (u + 1)} [Category.{u} Cor]
  {DM : Type w} [Category.{v} DM] [Preadditive DM] [HasZeroObject DM] [HasShift DM ℤ]
  [∀ n : ℤ, (shiftFunctor DM n).Additive] [Pretriangulated DM] [IsTriangulated DM]
  [MonoidalCategory DM] [SymmetricCategory DM] [MonoidalPreadditive DM]

namespace DMeffData

variable (D : DMeffData k R Cor DM)

/-- The motive `M(Y)`, the class of `R_tr(Y)`, of a separated scheme of finite type. -/
def Mft : SchFT k ⥤ DM := D.Ztr ⋙ D.ofPST

/-- The motive `M(X) = C_* R_tr(X)` of a smooth scheme (MVW Definition 14.1). -/
def M : SmSch k ⥤ DM := SmSch.toSchFT ⋙ D.Mft

/-- The motivic complex `R(i) = R(1)^{⊗ i}` (MVW Definition 3.1, M.5a). -/
def twist (i : ℕ) : DM := InvertObject.pow D.tate i

/-- Motivic cohomology `H^{n,i}(X, R) = Hom(M(X), R(i)[n])` (representability, MVW 14.16,
imported from M.5a). -/
abbrev motivicCohomology (X : SmSch k) (n : ℤ) (i : ℕ) : Type v :=
  D.M.obj X ⟶ (D.twist i)⟦n⟧

end DMeffData

variable (D : DMeffData k R Cor DM)

/-- The generators of `DM^eff_gm`: the objects isomorphic to `M(X)` for some smooth `X`. -/
def DMeffGm.generators : ObjectProperty DM := fun A => ∃ X : SmSch k, Nonempty (A ≅ D.M.obj X)

/-- The object property of effective geometric motives: the triangulated envelope, closed under
retracts, of the motives of smooth schemes. -/
def DMeffGm.prop : ObjectProperty DM := (DMeffGm.generators D).triangEnvelope

/-- MC.4/effective-geometric-motives: `DM^eff_gm(k, R)`, the thick subcategory of
`DM^{eff,-}_Nis(k, R)` generated by the motives of smooth schemes, as the full subcategory on
`(DMeffGm.generators D).triangEnvelope` (Mathlib's `ObjectProperty.triangEnvelope`). -/
abbrev DMeffGm : Type w := (DMeffGm.prop D).FullSubcategory

/-- `M(X)` is an effective geometric motive for `X` smooth. -/
theorem DMeffGm.of_smooth (X : SmSch k) : DMeffGm.prop D (D.M.obj X) := sorry

/-- The defining object property is triangulated: it contains `0` and is stable under shifts and
cones. -/
instance DMeffGm.isTriangulated : (DMeffGm.prop D).IsTriangulated := sorry

/-- A direct summand of an effective geometric motive is one. -/
instance DMeffGm.isStableUnderRetracts : (DMeffGm.prop D).IsStableUnderRetracts :=
  inferInstanceAs (DMeffGm.generators D).triangEnvelope.IsStableUnderRetracts

/-- The fully faithful triangulated inclusion `DM^eff_gm ⥤ DM^{eff,-}_Nis`. -/
abbrev DMeffGm.incl : DMeffGm D ⥤ DM := (DMeffGm.prop D).ι

instance : (DMeffGm.incl D).IsTriangulated := inferInstance

/-- The induction principle: `DM^eff_gm` is contained in a triangulated subcategory closed under
retracts exactly when that subcategory contains every `M(X)` (via
`ObjectProperty.triangEnvelope_le_iff`). -/
theorem DMeffGm.le_iff (Q : ObjectProperty DM) [Q.IsStableUnderRetracts] [Q.IsTriangulated]
    [Q.IsClosedUnderIsomorphisms] : DMeffGm.prop D ≤ Q ↔ ∀ X : SmSch k, Q (D.M.obj X) := sorry

/-- The tensor product of effective geometric motives is one, and `M(X) ⊗ M(Y) ≅ M(X × Y)`. -/
theorem DMeffGm.tensor (A B : DM) (hA : DMeffGm.prop D A) (hB : DMeffGm.prop D B) :
    DMeffGm.prop D (A ⊗ B) ∧
      ∀ X Y : SmSch k, Nonempty (D.M.obj X ⊗ D.M.obj Y ≅ D.M.obj (X.prod Y)) := sorry

instance DMeffGm.isMonoidal : (DMeffGm.prop D).IsMonoidal := sorry

/-- `R(1)` is an effective geometric motive, `R(1)[1]` being a direct summand of `M(𝔾_m)`;
hence `DM^eff_gm` is stable under the Tate twist. -/
theorem DMeffGm.tate :
    DMeffGm.prop D D.tate ∧
      Nonempty (Retract (D.tate⟦(1 : ℤ)⟧) (D.M.obj (SmSch.multiplicativeGroup k))) :=
  sorry

/-- Every effective geometric motive is compact: `Hom(A, -)` commutes with direct sums. -/
theorem DMeffGm.isCompact (A : DM) (hA : DMeffGm.prop D A) (ι : Type v) :
    PreservesColimitsOfShape (Discrete ι) (preadditiveCoyoneda.obj (op A)) := sorry

/-- Unit test `motive_of_a_point`: `M(Spec k)` is the unit `R` and is an effective geometric
motive. -/
example : Nonempty (D.M.obj (SmSch.point k) ≅ 𝟙_ DM) ∧ DMeffGm.prop D (𝟙_ DM) := sorry

/-- Unit test `tate_object_geometric`: `R(1)[2]` is an effective geometric motive: it is the
cone of `M(Spec k) ⟶ M(ℙ¹)` induced by a rational point, and a direct summand of `M(ℙ¹)`. -/
example (x : SmSch.point k ⟶ SmSch.projectiveSpace k 1) :
    (∃ (g : D.M.obj (SmSch.projectiveSpace k 1) ⟶ (D.twist 1)⟦(2 : ℤ)⟧)
        (δ : (D.twist 1)⟦(2 : ℤ)⟧ ⟶ (D.M.obj (SmSch.point k))⟦(1 : ℤ)⟧),
        Triangle.mk (D.M.map x) g δ ∈ distTriang DM) ∧
      Nonempty (Retract ((D.twist 1)⟦(2 : ℤ)⟧) (D.M.obj (SmSch.projectiveSpace k 1))) ∧
      DMeffGm.prop D ((D.twist 1)⟦(2 : ℤ)⟧) := sorry

/-- Unit test `summand_of_smooth_motive`: a direct summand of `M(X)` is an effective geometric
motive; this is where thickness, and not only triangulatedness, is used. -/
example (A : DM) (X : SmSch k) (_r : Retract A (D.M.obj X)) : DMeffGm.prop D A := sorry

/-- Unit test `infinite_sum_not_geometric`: the countable direct sum of copies of the unit is not
an effective geometric motive, since effective geometric motives are compact and
`Hom(R, R) = R` is nonzero. -/
example [Nontrivial R] [HasCoproduct fun _ : ULift.{v} ℕ => 𝟙_ DM]
    (_hR : Nonempty ((𝟙_ DM ⟶ 𝟙_ DM) ≃+ R)) :
    ¬ DMeffGm.prop D (∐ fun _ : ULift.{v} ℕ => 𝟙_ DM) := sorry

/-! ### Geometric motives (MC.4/tate-stabilised-motives) -/

/-- The Tate object `R(1)` as an effective geometric motive. -/
def DMgm.tateObj : DMeffGm D := ⟨D.tate, (DMeffGm.tate D).1⟩

/-- MC.4/tate-stabilised-motives: `DM_gm(k, R) = DM^eff_gm(k, R)[R(1)⁻¹]`. -/
abbrev DMgm : Type w := InvertObject (DMeffGm D) (DMgm.tateObj D)

/-- The triangulated structure of `DM_gm`, that of `InvertObject.instPretriangulated` for the
tensor triangulated structure of `DM^eff_gm` (M.5a); `DMgm.ofEffective` is triangulated. -/
instance DMgm.instPretriangulated : Pretriangulated (DMgm D) := sorry

/-- The monoidal structure `(M, m) ⊗ (N, n) = (M ⊗ N, m + n)` of `InvertObject.monoidal`, which
applies because the cyclic permutation of `R(1)^{⊗ 3}` is the identity over a perfect field
(`symmetricGroup_acts_trivially_tate`). -/
instance DMgm.instMonoidal [PerfectField k] : MonoidalCategory (DMgm D) :=
  InvertObject.monoidal _ sorry

/-- The symmetric monoidal structure of `DM_gm`, with `DMgm.ofEffective` symmetric monoidal. -/
instance DMgm.instSymmetricCategory [PerfectField k] : SymmetricCategory (DMgm D) :=
  InvertObject.instSymmetricCategory _ sorry

/-- The functor `M ↦ (M, 0)` from effective geometric motives. -/
def DMgm.ofEffective : DMeffGm D ⥤ DMgm D := InvertObject.of _

/-- The object `(M, m)`, isomorphic to `M(m)` for `m ≥ 0`. -/
def DMgm.mk (M : DMeffGm D) (m : ℤ) : DMgm D := InvertObject.mk _ M m

/-- By the cancellation theorem (Voevodsky, over a perfect field; imported from M.5a as the
hypothesis `hcancel`) `DM^eff_gm ⥤ DM_gm` is fully faithful. -/
theorem DMgm.effective_fullyFaithful
    (_hcancel : ∀ K L : DM, Function.Bijective fun f : K ⟶ L => f ▷ D.tate) :
    (DMgm.ofEffective D).Full ∧ (DMgm.ofEffective D).Faithful := sorry

/-- Tensoring with `R(1)` is an autoequivalence `(M, m) ↦ (M, m + 1)`, with inverse
`(M, m) ↦ (M, m - 1)`. -/
def DMgm.twistEquiv : DMgm D ≌ DMgm D := InvertObject.twistEquiv _

theorem DMgm.twistEquiv_iso_tensor [PerfectField k] :
    Nonempty ((DMgm.twistEquiv D).functor ≅ tensorRight (DMgm.mk D (DMgm.tateObj D) 0)) := sorry

/-- Every geometric motive is isomorphic to `M(-n)` with `n ≥ 0` and `M` effective. -/
theorem DMgm.exists_effective_twist (A : DMgm D) :
    ∃ (M : DMeffGm D) (n : ℕ), Nonempty (A ≅ DMgm.mk D M (-n)) := sorry

/-- `Hom((M, m), (N, n)) = Hom(M(m + i), N(n + i))` whenever `m + i` and `n + i` are nonnegative;
in particular `Hom((M, 0), (N, 0)) = Hom(M, N)`. Uses cancellation. -/
def DMgm.hom_mk (_hcancel : ∀ K L : DM, Function.Bijective fun f : K ⟶ L => f ▷ D.tate)
    (M N : DMeffGm D) (m n : ℤ) (a b : ℕ) (_h : (a : ℤ) - m = b - n) :
    (DMgm.mk D M m ⟶ DMgm.mk D N n) ≃
      (M ⊗ InvertObject.pow (DMgm.tateObj D) a ⟶ N ⊗ InvertObject.pow (DMgm.tateObj D) b) :=
  sorry

/-- `DM^-(k, R) = DM^{eff,-}_Nis(k, R)[R(1)⁻¹]`, the same construction on the whole effective
category. -/
abbrev DMminus : Type w := InvertObject DM D.tate

/-- The tensor triangulated functor `DM_gm(k, R) ⥤ DM^-(k, R)` induced by the inclusion of
`DM^eff_gm` into `DM^{eff,-}_Nis`. -/
def DMgm.toDMminus : DMgm D ⥤ DMminus D := sorry

theorem DMgm.toDMminus_obj (M : DMeffGm D) (m : ℤ) :
    (DMgm.toDMminus D).obj (DMgm.mk D M m) = InvertObject.mk _ M.obj m := sorry

/-- `DMgm.toDMminus` is fully faithful (cancellation). -/
theorem DMgm.toDMminus_fullyFaithful
    (_hcancel : ∀ K L : DM, Function.Bijective fun f : K ⟶ L => f ▷ D.tate) :
    (DMgm.toDMminus D).Full ∧ (DMgm.toDMminus D).Faithful := sorry

/-- The effective geometric motive `M(X)` of a smooth scheme. -/
def DMeffGm.motive (X : SmSch k) : DMeffGm D := ⟨D.M.obj X, DMeffGm.of_smooth D X⟩

/-- The unit `R` as an effective geometric motive. -/
def DMeffGm.unit : DMeffGm D := 𝟙_ (DMeffGm D)

/-- Unit test `twist_invertible`: `R(1) ⊗ R(-1) ≅ R` in `DM_gm`, where `R(-1) = (R, -1)`. -/
example [PerfectField k] :
    Nonempty (DMgm.mk D (DMeffGm.unit D) 1 ⊗ DMgm.mk D (DMeffGm.unit D) (-1) ≅ 𝟙_ (DMgm D)) :=
  sorry

/-- Unit test `effective_embeds`: for effective geometric motives the map
`Hom_{DM^eff_gm}(M, N) ⟶ Hom_{DM_gm}(M, N)` is bijective; in particular
`Hom(M(X), R(i)[n]) = H^{n,i}(X, R)` is unchanged by stabilisation. -/
example (hcancel : ∀ K L : DM, Function.Bijective fun f : K ⟶ L => f ▷ D.tate)
    (M N : DMeffGm D) :
    Function.Bijective fun f : M ⟶ N => (DMgm.ofEffective D).map f := sorry

/-- Unit test `motive_of_the_line`: `M(ℙ¹) ≅ R ⊕ R(1)[2]` in `DM_gm`, and `R(1)[2]` is invertible
there with inverse `R(-1)[-2]`. -/
example [PerfectField k] :
    Nonempty (DMgm.mk D (DMeffGm.motive D (SmSch.projectiveSpace k 1)) 0 ≅
      𝟙_ (DMgm D) ⊞ (DMgm.mk D (DMeffGm.unit D) 1)⟦(2 : ℤ)⟧) ∧
    Nonempty ((DMgm.mk D (DMeffGm.unit D) 1)⟦(2 : ℤ)⟧ ⊗
      (DMgm.mk D (DMeffGm.unit D) (-1))⟦(-2 : ℤ)⟧ ≅ 𝟙_ (DMgm D)) := sorry

/-- Unit test `hom_twist_unit`: `Hom_{DM_gm}(R(1), R(1)) = Hom(R, R) = R`; a stabilisation that is
not fully faithful could enlarge this group. -/
example (hcancel : ∀ K L : DM, Function.Bijective fun f : K ⟶ L => f ▷ D.tate)
    (hR : Nonempty ((𝟙_ DM ⟶ 𝟙_ DM) ≃+ R)) :
    Nonempty ((DMgm.mk D (DMeffGm.unit D) 1 ⟶ DMgm.mk D (DMeffGm.unit D) 1) ≃
      (𝟙_ DM ⟶ 𝟙_ DM)) := sorry

/-! ### Motives of smooth schemes -/

/-- MC.4/homotopy-invariance-and-mayer-vietoris (1): the projection `X × 𝔸¹ ⟶ X` induces an
isomorphism `M(X × 𝔸¹) ≅ M(X)`, over any field. -/
theorem homotopy_invariance (X : SmSch k) :
    IsIso (D.M.map (SmSch.fst X (SmSch.affineLine k))) := sorry

/-- MC.4/homotopy-invariance-and-mayer-vietoris (2): for a Zariski cover `X = U ∪ V` there is a
distinguished Mayer–Vietoris triangle
`M(U ∩ V) ⟶ M(U) ⊕ M(V) ⟶ M(X) ⟶ M(U ∩ V)[1]`. -/
theorem mayer_vietoris (X : SmSch k) (U V : X.obj.left.Opens) (_hUV : U ⊔ V = ⊤)
    (iU : SmSch.ofOpen X (U ⊓ V) ⟶ SmSch.ofOpen X U)
    (iV : SmSch.ofOpen X (U ⊓ V) ⟶ SmSch.ofOpen X V)
    (_hU : iU ≫ SmSch.ofOpenι X U = SmSch.ofOpenι X (U ⊓ V))
    (_hV : iV ≫ SmSch.ofOpenι X V = SmSch.ofOpenι X (U ⊓ V)) :
    ∃ δ : D.M.obj X ⟶ (D.M.obj (SmSch.ofOpen X (U ⊓ V)))⟦(1 : ℤ)⟧,
      Triangle.mk (biprod.lift (D.M.map iU) (-D.M.map iV))
        (biprod.desc (D.M.map (SmSch.ofOpenι X U)) (D.M.map (SmSch.ofOpenι X V))) δ ∈
        distTriang DM := sorry

/-- MC.4/vector-bundle-invariance: for a vector bundle `p : E ⟶ X` (Zariski locally trivial with
fibre `𝔸ⁿ`) the projection induces `M(E) ≅ M(X)`, over any field. -/
theorem motive_vectorBundle {E X : SmSch k} (p : E ⟶ X) (n : ℕ) (_hp : SmSch.IsAffineBundle p n) :
    IsIso (D.M.map p) := sorry

/-- MC.4/motive-of-projective-space, the part valid over any field:
`M(𝔸¹) ≅ R`, `M(𝔾_m) ≅ R ⊕ R(1)[1]` and `M(ℙ¹) ≅ R ⊕ R(1)[2]`. -/
theorem motive_affineLine_gm_projectiveLine :
    Nonempty (D.M.obj (SmSch.affineLine k) ≅ 𝟙_ DM) ∧
    Nonempty (D.M.obj (SmSch.multiplicativeGroup k) ≅ 𝟙_ DM ⊞ (D.twist 1)⟦(1 : ℤ)⟧) ∧
    Nonempty (D.M.obj (SmSch.projectiveSpace k 1) ≅ 𝟙_ DM ⊞ (D.twist 1)⟦(2 : ℤ)⟧) := sorry

/-- MC.4/motive-of-projective-space: over a perfect field
`M(ℙⁿ) ≅ R ⊕ R(1)[2] ⊕ ⋯ ⊕ R(n)[2n]`. -/
theorem motive_projectiveSpace [PerfectField k] (n : ℕ) :
    Nonempty (D.M.obj (SmSch.projectiveSpace k n) ≅
      ⨁ fun i : Fin (n + 1) => (D.twist i)⟦(2 * i : ℤ)⟧) := sorry

/-- The map `M(ℙⁱ) ⟶ R(i)[2i]` of MC.4/projective-space-quotient (the quotient by `M(ℙ^{i-1})`;
for `i = 0` it is `M(Spec k) ≅ R`). -/
def projectiveSpaceQuotientMap [PerfectField k] (i : ℕ) :
    D.M.obj (SmSch.projectiveSpace k i) ⟶ (D.twist i)⟦(2 * i : ℤ)⟧ := sorry

/-- MC.4/projective-space-quotient: over a perfect field there is a distinguished triangle
`M(ℙⁿ) ⟶ M(ℙⁿ⁺¹) ⟶ R(n+1)[2n+2] ⟶ M(ℙⁿ)[1]`, the first map induced by a linear embedding and
the second the quotient map (MVW Theorem 15.2). -/
theorem projectiveSpace_quotient_triangle [PerfectField k] (n : ℕ) :
    ∃ δ : (D.twist (n + 1))⟦(2 * (n + 1 : ℕ) : ℤ)⟧ ⟶
        (D.M.obj (SmSch.projectiveSpace k n))⟦(1 : ℤ)⟧,
      Triangle.mk (D.M.map (SmSch.linearEmbedding k (Nat.le_succ n)))
        (projectiveSpaceQuotientMap D (n + 1)) δ ∈ distTriang DM := sorry

/-- MC.4/projective-space-inclusion-split (MVW Exercise 15.4): for `i < n` the map
`M(ℙⁱ) ⟶ R(i)[2i]` factors through `M(ℙⁱ) ⟶ M(ℙⁿ)`. -/
theorem projectiveSpace_map_extends [PerfectField k] {i n : ℕ} (h : i ≤ n) :
    ∃ f : D.M.obj (SmSch.projectiveSpace k n) ⟶ (D.twist i)⟦(2 * i : ℤ)⟧,
      D.M.map (SmSch.linearEmbedding k h) ≫ f = projectiveSpaceQuotientMap D i := sorry

/-- MC.4/projective-bundle-theorem: for a projective bundle `p : ℙ(E) ⟶ X` of a vector bundle of
rank `n + 1` over a perfect field there is an isomorphism
`M(ℙ(E)) ⟶ ⊕_{i=0}^{n} M(X)(i)[2i]` (in this direction, MVW Construction 15.10). -/
theorem projectiveBundle_iso [PerfectField k] {P X : SmSch k} (p : P ⟶ X) (n : ℕ)
    (_hp : SmSch.IsProjectiveBundle p n) :
    ∃ σ : D.M.obj P ⟶ ⨁ fun i : Fin (n + 1) => (D.M.obj X ⊗ D.twist i)⟦(2 * i : ℤ)⟧, IsIso σ :=
  sorry

/-- MC.4/symmetric-group-acts-trivially-on-tate-twists: over a perfect field the cyclic permutation
of `R(1)^{⊗ 3}` is the identity in `DM^{eff,-}_Nis(k, R)`. The statement that all of `Σ_n` acts
trivially on `R(n)` through the coordinates of `𝔾_m^{∧ n}` needs the presheaf `ℤ_tr(𝔾_m^{∧ n})`
of M.5a and is not stated here. -/
theorem symmetricGroup_acts_trivially_tate [PerfectField k] :
    (β_ (D.tate ⊗ D.tate) D.tate).hom ≫ (α_ D.tate D.tate D.tate).inv = 𝟙 _ := sorry

/-- The Gysin map `M(X) ⟶ M(Z)(c)[2c]` of a smooth closed subscheme `Z` of pure codimension `c`
of a smooth `X` (MVW Corollary 15.13). -/
def gysinMap [CharZero k] {X Z : SmSch k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left] (c : ℕ) :
    D.M.obj X ⟶ (D.M.obj Z ⊗ D.twist c)⟦(2 * c : ℤ)⟧ := sorry

/-- MC.4/blow-up-smooth-centre-and-gysin-map, second part: the Gysin map vanishes on
`M(X - Z)`. The first part, `M(Bl_Z X) ≅ M(X) ⊕ ⊕_{i=1}^{c-1} M(Z)(i)[2i]`, is not stated: the
blow-up of a scheme along a closed subscheme is not in the pinned Mathlib and no request supplies
it with a statable characterisation. -/
theorem gysinMap_restrict [CharZero k] {X Z : SmSch k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (dX dZ : ℕ) (_hX : SmoothOfRelativeDimension dX X.obj.hom)
    (_hZ : SmoothOfRelativeDimension dZ Z.obj.hom) :
    D.M.map (SmSch.ofOpenι X (SmSch.complement i)) ≫ gysinMap D i (dX - dZ) = 0 := sorry

/-- MC.4/gysin-triangle: for `Z ⊆ X` smooth closed of pure codimension `c = dim X - dim Z` there
is a distinguished triangle `M(X - Z) ⟶ M(X) ⟶ M(Z)(c)[2c] ⟶ M(X - Z)[1]`. The source proves
it over a perfect field with resolution of singularities; it is stated in characteristic zero. -/
theorem gysin_triangle [CharZero k] {X Z : SmSch k} (i : Z ⟶ X) [IsClosedImmersion i.hom.left]
    (dX dZ : ℕ) (_hX : SmoothOfRelativeDimension dX X.obj.hom)
    (_hZ : SmoothOfRelativeDimension dZ Z.obj.hom) :
    ∃ δ : (D.M.obj Z ⊗ D.twist (dX - dZ))⟦(2 * (dX - dZ : ℕ) : ℤ)⟧ ⟶
        (D.M.obj (SmSch.ofOpen X (SmSch.complement i)))⟦(1 : ℤ)⟧,
      Triangle.mk (D.M.map (SmSch.ofOpenι X (SmSch.complement i))) (gysinMap D i (dX - dZ)) δ ∈
        distTriang DM := sorry

/-- MC.4/gysin-triangle, the closed point of a curve: for `x` a closed point of a smooth curve
`X`, the triangle reads `M(X - x) ⟶ M(X) ⟶ M(Spec k(x))(1)[2] ⟶ M(X - x)[1]`. -/
theorem gysin_triangle_closedPoint [CharZero k] (X : SmSch k)
    (_hX : SmoothOfRelativeDimension 1 X.obj.hom) (x : X.obj.left) (hx : IsClosed {x})
    [IsClosedImmersion (SmSch.ofClosedPointι X x hx).hom.left] :
    ∃ δ : (D.M.obj (SmSch.ofClosedPoint X x hx) ⊗ D.twist 1)⟦(2 * (1 : ℕ) : ℤ)⟧ ⟶
        (D.M.obj (SmSch.ofOpen X (SmSch.complement (SmSch.ofClosedPointι X x hx))))⟦(1 : ℤ)⟧,
      Triangle.mk (D.M.map (SmSch.ofOpenι X (SmSch.complement (SmSch.ofClosedPointι X x hx))))
        (gysinMap D (SmSch.ofClosedPointι X x hx) 1) δ ∈ distTriang DM := sorry

/-- MC.4/gysin-triangle, the localisation sequence: applying `Hom(-, R(i)[n])` and cancellation
gives an exact sequence
`H^{n-2,i-1}(k(x)) ⟶ H^{n,i}(X) ⟶ H^{n,i}(X - x) ⟶ H^{n-1,i-1}(k(x))`, the middle map being
restriction. -/
theorem gysin_localisation_sequence [CharZero k]
    (_hcancel : ∀ K L : DM, Function.Bijective fun f : K ⟶ L => f ▷ D.tate)
    (X : SmSch k) (_hX : SmoothOfRelativeDimension 1 X.obj.hom) (x : X.obj.left)
    (hx : IsClosed {x}) (n : ℤ) (i : ℕ) :
    ∃ (a : D.motivicCohomology (SmSch.ofClosedPoint X x hx) (n - 2) i →+
          D.motivicCohomology X n (i + 1))
      (b : D.motivicCohomology (SmSch.ofOpen X (SmSch.complement (SmSch.ofClosedPointι X x hx)))
          n (i + 1) →+ D.motivicCohomology (SmSch.ofClosedPoint X x hx) (n - 1) i),
      Function.Exact a (Preadditive.leftComp _
          (D.M.map (SmSch.ofOpenι X (SmSch.complement (SmSch.ofClosedPointι X x hx))))) ∧
        Function.Exact (Preadditive.leftComp _
          (D.M.map (SmSch.ofOpenι X (SmSch.complement (SmSch.ofClosedPointι X x hx))))) b := sorry

/-! ### Comparisons -/

/-- MC.4/chow-motives-into-geometric-motives: over a perfect field with resolution (here: of
characteristic zero), for smooth proper `X` and `Y` with `d = dim Y` (the authors' errata;
MVW print `dim X`), there is an isomorphism `CH^d(X × Y) ≅ Hom(M(X), M(Y))` in
`DM^eff_gm(k, ℤ)` sending the class of the graph of `f : X ⟶ Y` to `M(f)`. The functor
`(Chow^eff)ᵒᵖ ⥤ DM^eff_gm` of MVW Remark 20.2 is asserted there without proof and is not
stated. -/
theorem chow_into_DMgm [CharZero k] (C : ChowTheory k) (D : DMeffData k ℤ Cor DM)
    (X Y : SmProj k) (d : ℕ) (_hY : Y.IsEquidim d) :
    ∃ e : C.codim (X.prod Y) d ≃+
        (D.M.obj (SmSch.ofSmProj.obj X) ⟶ D.M.obj (SmSch.ofSmProj.obj Y)),
      ∀ (f : X ⟶ Y) (h : C.pushforward (SmProj.lift (𝟙 X) f) 1 ∈ C.codim (X.prod Y) d),
        e ⟨_, h⟩ = D.M.map (SmSch.ofSmProj.map f) := sorry

/-- MC.4/motivic-cohomology-higher-chow: for `X` smooth over a perfect field,
`H^{n,i}(X, ℤ) ≅ CH^i(X, 2i - n)` with M.4's higher Chow groups; in particular
`H^{n,i}(X, ℤ) = 0` for `n > 2i`. Naturality for the Bloch–Levine pullbacks is part of the
statement in the source and is not typed here. -/
theorem motivic_eq_higherChow [PerfectField k] (D : DMeffData k ℤ Cor DM) (H : HigherChowData k)
    (X : SmSch k) (n : ℤ) (i : ℕ) :
    Nonempty (D.motivicCohomology X n i ≃+ H.higherChow X i (2 * i - n)) ∧
      (2 * (i : ℤ) < n → Subsingleton (D.motivicCohomology X n i)) := sorry

/-- MC.4/blow-up-triangle-and-formula (MVW 13.26): for an abstract blow-up `p : X' ⟶ X` with centre
`Z` (proper, an isomorphism over `X - Z`) and `Z' = Z ×_X X'`, there is a distinguished triangle
`M(Z') ⟶ M(Z) ⊕ M(X') ⟶ M(X) ⟶ M(Z')[1]` in `DM^{eff,-}_Nis(k, R)`. Stated in characteristic
zero in place of "perfect with resolution of singularities"; the version for the complexes
`C_* R_tr` in `D^-(Sh_Nis(Cor_k, R))` needs M.5a's derived category of sheaves and is not
stated. -/
theorem blowup_triangle [CharZero k] {X X' Z Z' : SchFT k} (p : X' ⟶ X) [IsProper p.hom.left]
    (i : Z ⟶ X) [IsClosedImmersion i.hom.left] (p' : Z' ⟶ Z) (i' : Z' ⟶ X')
    (_hsq : IsPullback i'.hom.left p'.hom.left p.hom.left i.hom.left)
    (_hiso : IsIso (p.hom.left ∣_ SchFT.complement i)) :
    ∃ δ : D.Mft.obj X ⟶ (D.Mft.obj Z')⟦(1 : ℤ)⟧,
      Triangle.mk (biprod.lift (D.Mft.map p') (-D.Mft.map i'))
        (biprod.desc (D.Mft.map i) (D.Mft.map p)) δ ∈ distTriang DM := sorry

/-- MC.4/geometric-motives-generated-by-smooth-projective (1): `M(Y) ∈ DM^eff_gm` for every
separated scheme `Y` of finite type (characteristic zero in place of perfect with resolution). -/
theorem DMeffGm_contains_all [CharZero k] (Y : SchFT k) : DMeffGm.prop D (D.Mft.obj Y) := sorry

/-- MC.4/geometric-motives-generated-by-smooth-projective (2): `DM^eff_gm` is the thick
subcategory generated by the motives of smooth proper schemes. -/
theorem DMeffGm_generated_by_smoothProjective [CharZero k] :
    DMeffGm.prop D = ObjectProperty.triangEnvelope
      (fun A => ∃ X : SmProj k, Nonempty (A ≅ D.M.obj (SmSch.ofSmProj.obj X))) := sorry

end Effective
/-! ### Equidimensional cycles and motives with compact support -/

section CompactSupport

variable {R : Type*} [CommRing R] {Cor : Type (u + 1)} [Category.{u} Cor]
  {DM : Type w} [Category.{v} DM] [Preadditive DM] [HasZeroObject DM] [HasShift DM ℤ]
  [∀ n : ℤ, (shiftFunctor DM n).Additive] [Pretriangulated DM] [IsTriangulated DM]
  [MonoidalCategory DM] [SymmetricCategory DM] [MonoidalPreadditive DM]
  (D : DMeffData k R Cor DM)

/-- The condition of MVW Definition 16.1 on a point `z` of `S × T`: the closed irreducible
subvariety `Z = closure {z}` is dominant over an irreducible component of `S` and equidimensional
of relative dimension `r` over `S` (every irreducible component of every fibre has dimension
`r`). -/
def zEqui.IsAdmissible (T : SchFT k) (r : ℕ) (S : SmSch k)
    (z : ↥(pullback S.obj.hom T.obj.hom)) : Prop :=
  closure {(pullback.fst S.obj.hom T.obj.hom).base z} ∈ irreducibleComponents S.obj.left ∧
    ∀ s : S.obj.left, ∀ W ∈ irreducibleComponents
      ↥(closure {z} ∩ (pullback.fst S.obj.hom T.obj.hom).base ⁻¹' {s}), topologicalKrullDim ↥W = r

/-- `z_equi(T, r)(S)`: the cycles on `S × T` all of whose components satisfy
`zEqui.IsAdmissible` (MVW Definition 16.1). -/
def zEqui.sections (T : SchFT k) (r : ℕ) (S : SmSch k) :
    AddSubgroup (AlgebraicCycle (pullback S.obj.hom T.obj.hom) ℤ) where
  carrier := {c | ∀ z, c z ≠ 0 → zEqui.IsAdmissible T r S z}
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry

/-- MC.4/equidimensional-cycle-sheaves: the presheaf with transfers `z_equi(T, r)` on `Sm/k`
(MVW Definition 16.1); `Cor` is M.5a's category of finite correspondences. -/
def zEqui (D : DMeffData k R Cor DM) (T : SchFT k) (r : ℕ) : Corᵒᵖ ⥤ AddCommGrpCat.{u} := sorry

/-- A cycle on `S × T` lies in `z_equi(T, r)(S)` exactly when each component is dominant and
equidimensional of relative dimension `r` over a component of `S`. -/
theorem zEqui.mem_iff (T : SchFT k) (r : ℕ) (S : SmSch k)
    (c : AlgebraicCycle (pullback S.obj.hom T.obj.hom) ℤ) :
    c ∈ zEqui.sections T r S ↔ ∀ z, c z ≠ 0 → zEqui.IsAdmissible T r S z := Iff.rfl

/-- The values of `z_equi(T, r)` are the groups of relative cycles, the transfers `φ_V` being the
pushforward along `V × T ⟶ X × T` of the pullback of a relative cycle (MVW 16.1, Exercise 16.3). -/
def zEqui.transfer (T : SchFT k) (r : ℕ) (S : SmSch k) :
    (zEqui D T r).obj (op (D.gr.obj S)) ≅ AddCommGrpCat.of (zEqui.sections T r S) := sorry

/-- `z_equi(T, r)` is an étale sheaf on `Sm/k`, hence a Nisnevich sheaf with transfers. -/
theorem zEqui.isSheaf (T : SchFT k) (r : ℕ) :
    Presheaf.IsSheaf (SmSch.etaleTopology k) (D.gr.op ⋙ zEqui D T r) := sorry

/-- `ℤ_tr(T) ⊆ z_equi(T, 0)`. -/
def zEqui.ofTr (T : SchFT k) : D.Ztr.obj T ⟶ zEqui D T 0 := sorry

/-- `ℤ_tr(T)` is a sub-presheaf with transfers of `z_equi(T, 0)`, equal to it when `T` is
proper. -/
theorem zEqui.ofTr_mono_isIso (T : SchFT k) :
    Mono (zEqui.ofTr D T) ∧ (IsProper T.obj.hom → IsIso (zEqui.ofTr D T)) := sorry

/-- Flat pullback `z_equi(T, r) ⟶ z_equi(T', r + d)` along a flat `T' ⟶ T` of relative
dimension `d` (Suslin–Voevodsky 3.6.2). -/
def zEqui.flatPullback {T T' : SchFT k} (f : T' ⟶ T) [Flat f.hom.left] (d : ℕ)
    (_hf : IsEquidimOfRelDim f.hom.left d) (r : ℕ) : zEqui D T r ⟶ zEqui D T' (r + d) := sorry

theorem zEqui.flatPullback_comp {T T' T'' : SchFT k} (f : T' ⟶ T) (g : T'' ⟶ T')
    [Flat f.hom.left] [Flat g.hom.left] [Flat (g ≫ f).hom.left] (d e : ℕ)
    (hf : IsEquidimOfRelDim f.hom.left d) (hg : IsEquidimOfRelDim g.hom.left e)
    (hgf : IsEquidimOfRelDim (g ≫ f).hom.left (d + e)) (r : ℕ) :
    zEqui.flatPullback D f d hf r ≫ zEqui.flatPullback D g e hg (r + d) ≫
      eqToHom (by rw [Nat.add_assoc]) = zEqui.flatPullback D (g ≫ f) (d + e) hgf r := sorry

/-- Proper pushforward `z_equi(T, r) ⟶ z_equi(T'', r)` along a proper `T ⟶ T''`
(Suslin–Voevodsky 3.6.4). -/
def zEqui.properPushforward {T T'' : SchFT k} (f : T ⟶ T'') [IsProper f.hom.left] (r : ℕ) :
    zEqui D T r ⟶ zEqui D T'' r := sorry

theorem zEqui.properPushforward_id (T : SchFT k) [IsProper (𝟙 T : T ⟶ T).hom.left] (r : ℕ) :
    zEqui.properPushforward D (𝟙 T) r = 𝟙 _ := sorry

theorem zEqui.properPushforward_comp {T T' T'' : SchFT k} (f : T ⟶ T') (g : T' ⟶ T'')
    [IsProper f.hom.left] [IsProper g.hom.left] [IsProper (f ≫ g).hom.left] (r : ℕ) :
    zEqui.properPushforward D (f ≫ g) r =
      zEqui.properPushforward D f r ≫ zEqui.properPushforward D g r := sorry

/-- For `T' ⊆ T` closed, `z_equi(T', r) ⊆ z_equi(T, r)` is the pushforward along the closed
immersion. -/
theorem zEqui.closedEmbedding {T T' : SchFT k} (i : T' ⟶ T) [IsClosedImmersion i.hom.left]
    [IsProper i.hom.left] (r : ℕ) : Mono (zEqui.properPushforward D i r) := sorry

/-- Unit test `zEqui_proper`: `z_equi(ℙ¹, 0) = ℤ_tr(ℙ¹)`. -/
example : IsIso (zEqui.ofTr D (SmSch.toSchFT.obj (SmSch.projectiveSpace k 1))) := sorry

/-- Unit test `zEqui_hyperbola`: the hyperbola `st = 1` in `𝔸¹_s × 𝔸¹_t` is quasi-finite and
dominant over `𝔸¹_s`, so it lies in `z_equi(𝔸¹, 0)(𝔸¹)`, but it is not finite over `𝔸¹_s`, so it
is not in `ℤ_tr(𝔸¹)(𝔸¹)`: the inclusion `ℤ_tr(𝔸¹)(𝔸¹) ⊆ z_equi(𝔸¹, 0)(𝔸¹)` is strict. -/
example : ¬ IsIso ((zEqui.ofTr D (SmSch.toSchFT.obj (SmSch.affineLine k))).app
    (op (D.gr.obj (SmSch.affineLine k)))) := sorry

/-- Unit test `zEqui_point`: `z_equi(Spec k, 0)(S)` is free on the components of `S`, and
`z_equi(Spec k, r) = 0` for `r > 0`. -/
example (S : SmSch k) :
    Nonempty ((zEqui D (SchFT.point k) 0).obj (op (D.gr.obj S)) ≅
        AddCommGrpCat.of (irreducibleComponents S.obj.left →₀ ℤ)) ∧
      ∀ r > 0, IsZero ((zEqui D (SchFT.point k) r).obj (op (D.gr.obj S))) := sorry

/-- Unit test `zEqui_flat_shift`: the projection `T × 𝔸¹ ⟶ T` is flat of relative dimension one,
so pullback sends `z_equi(T, r)` into `z_equi(T × 𝔸¹, r + 1)`. -/
example (T : SchFT k) :
    Flat (SchFT.fst T (SmSch.toSchFT.obj (SmSch.affineLine k))).hom.left ∧
      IsEquidimOfRelDim (SchFT.fst T (SmSch.toSchFT.obj (SmSch.affineLine k))).hom.left 1 := sorry

/-- MC.4/motives-with-compact-support: `M^c(X) = z_equi(X, 0)` in `DM^{eff,-}_Nis(k)`
(MVW Definition 16.13). -/
def motiveCompactSupport (X : SchFT k) : DM := D.ofPST.obj (zEqui D X 0)

/-- The canonical map `M(X) ⟶ M^c(X)` induced by `ℤ_tr(X) ⊆ z_equi(X, 0)`. -/
def motiveCompactSupport.fromMotive (X : SchFT k) : D.Mft.obj X ⟶ motiveCompactSupport D X :=
  D.ofPST.map (zEqui.ofTr D X)

/-- For `X` proper the canonical map is an isomorphism. -/
theorem motiveCompactSupport.fromMotive_isIso_of_proper (X : SchFT k) (_hX : IsProper X.obj.hom) :
    IsIso (motiveCompactSupport.fromMotive D X) := sorry

/-- Contravariance for étale maps. -/
def motiveCompactSupport.mapEtale {X Y : SchFT k} (f : X ⟶ Y) [Etale f.hom.left] :
    motiveCompactSupport D Y ⟶ motiveCompactSupport D X := sorry

theorem motiveCompactSupport.mapEtale_comp {X Y Z : SchFT k} (f : X ⟶ Y) (g : Y ⟶ Z)
    [Etale f.hom.left] [Etale g.hom.left] [Etale (f ≫ g).hom.left] :
    motiveCompactSupport.mapEtale D (f ≫ g) =
      motiveCompactSupport.mapEtale D g ≫ motiveCompactSupport.mapEtale D f := sorry

/-- Covariance for proper maps. -/
def motiveCompactSupport.mapProper {X Y : SchFT k} (f : X ⟶ Y) [IsProper f.hom.left] :
    motiveCompactSupport D X ⟶ motiveCompactSupport D Y :=
  D.ofPST.map (zEqui.properPushforward D f 0)

theorem motiveCompactSupport.mapProper_comp {X Y Z : SchFT k} (f : X ⟶ Y) (g : Y ⟶ Z)
    [IsProper f.hom.left] [IsProper g.hom.left] [IsProper (f ≫ g).hom.left] :
    motiveCompactSupport.mapProper D (f ≫ g) =
      motiveCompactSupport.mapProper D f ≫ motiveCompactSupport.mapProper D g := sorry

/-- The canonical map commutes with pushforward along proper maps. -/
theorem motiveCompactSupport.fromMotive_natural {X Y : SchFT k} (f : X ⟶ Y)
    [IsProper f.hom.left] :
    D.Mft.map f ≫ motiveCompactSupport.fromMotive D Y =
      motiveCompactSupport.fromMotive D X ≫ motiveCompactSupport.mapProper D f := sorry

/-- Over a perfect field `M^c(𝔸ⁱ) ≅ R(i)[2i]`. -/
theorem motiveCompactSupport_affineSpace [PerfectField k] (i : ℕ) :
    Nonempty (motiveCompactSupport D (SmSch.toSchFT.obj (SmSch.affineSpace k i)) ≅
      (D.twist i)⟦(2 * i : ℤ)⟧) := sorry

/-- MC.4/compact-support-localisation-triangle: for `Z ⊆ X` closed with complement `U` there is
a distinguished triangle `M^c(Z) ⟶ M^c(X) ⟶ M^c(U) ⟶ M^c(Z)[1]`, the maps `i_*` and `j^*`
(characteristic zero in place of perfect with resolution of singularities). -/
theorem motiveCompactSupport_localisation [CharZero k] {X Z : SchFT k} (i : Z ⟶ X)
    [IsClosedImmersion i.hom.left] [IsProper i.hom.left] :
    ∃ δ : motiveCompactSupport D (SchFT.ofOpen X (SchFT.complement i)) ⟶
        (motiveCompactSupport D Z)⟦(1 : ℤ)⟧,
      Triangle.mk (motiveCompactSupport.mapProper D i)
        (motiveCompactSupport.mapEtale D (SchFT.ofOpenι X (SchFT.complement i))) δ ∈
        distTriang DM := sorry

/-- MC.4/compact-support-kunneth: `M^c(X × Y) ≅ M^c(X) ⊗ M^c(Y)`; in particular
`M^c(X × 𝔸ⁱ) ≅ M^c(X)(i)[2i]` (characteristic zero in place of perfect with resolution). -/
theorem motiveCompactSupport_tensor [CharZero k] (X Y : SchFT k) :
    Nonempty (motiveCompactSupport D (X.prod Y) ≅
      motiveCompactSupport D X ⊗ motiveCompactSupport D Y) ∧
    ∀ i : ℕ, Nonempty (motiveCompactSupport D (X.prod (SmSch.toSchFT.obj (SmSch.affineSpace k i))) ≅
      (motiveCompactSupport D X ⊗ D.twist i)⟦(2 * i : ℤ)⟧) := sorry

/-- MC.4/compact-support-geometric: `M^c(X)` is an effective geometric motive for every separated
scheme of finite type (characteristic zero in place of perfect with resolution). -/
theorem motiveCompactSupport_geometric [CharZero k] (X : SchFT k) :
    DMeffGm.prop D (motiveCompactSupport D X) := sorry

/-- Unit test `proper_case`: `M(ℙ¹) ⟶ M^c(ℙ¹)` is an isomorphism, being an equality of
sheaves. -/
example :
    IsIso (motiveCompactSupport.fromMotive D (SmSch.toSchFT.obj (SmSch.projectiveSpace k 1))) :=
  sorry

/-- Unit test `affine_line`: over a perfect field `M^c(𝔸¹) ≅ R(1)[2]`. -/
example [PerfectField k] :
    Nonempty (motiveCompactSupport D (SmSch.toSchFT.obj (SmSch.affineLine k)) ≅
      (D.twist 1)⟦(2 : ℤ)⟧) := sorry

/-- Unit test `point`: `M^c(Spec k) = M(Spec k) = R`. -/
example : IsIso (motiveCompactSupport.fromMotive D (SchFT.point k)) ∧
    Nonempty (motiveCompactSupport D (SchFT.point k) ≅ 𝟙_ DM) := sorry

/-- Unit test `not_the_motive`: `M^c(𝔸¹)` is not isomorphic to `M^c(Spec k)`: `Hom(R, R) = R`
while `Hom(R, R(1)[2]) = H^{2,1}(Spec k, R) = Pic(Spec k) ⊗ R = 0`; the non-proper projection
`𝔸¹ ⟶ Spec k` induces no map of motives with compact support. -/
example [PerfectField k] [Nontrivial R] (_hR : Nonempty ((𝟙_ DM ⟶ 𝟙_ DM) ≃+ R)) :
    ¬ Nonempty (motiveCompactSupport D (SmSch.toSchFT.obj (SmSch.affineLine k)) ≅
      motiveCompactSupport D (SchFT.point k)) := sorry

/-! ### Motivic cohomology with compact supports and Borel–Moore motivic homology -/

/-- MC.4/borel-moore-motivic-homology: `H^{n,i}_c(X, R) = Hom(M^c(X), R(i)[n])`. -/
abbrev motivicCohomologyCompactSupport (X : SchFT k) (n : ℤ) (i : ℕ) : Type v :=
  motiveCompactSupport D X ⟶ (D.twist i)⟦n⟧

/-- `H^BM_{n,i}(X, R) = Hom(R(i)[n], M^c(X))`. -/
abbrev borelMooreMotivicHomology (X : SchFT k) (n : ℤ) (i : ℕ) : Type v :=
  (D.twist i)⟦n⟧ ⟶ motiveCompactSupport D X

/-- Contravariance of `H_c` for proper maps. -/
def motivicCohomologyCompactSupport.mapProper {X Y : SchFT k} (f : X ⟶ Y) [IsProper f.hom.left]
    (n : ℤ) (i : ℕ) :
    motivicCohomologyCompactSupport D Y n i →+ motivicCohomologyCompactSupport D X n i :=
  Preadditive.leftComp _ (motiveCompactSupport.mapProper D f)

/-- Covariance of `H_c` for étale maps. -/
def motivicCohomologyCompactSupport.mapEtale {X Y : SchFT k} (f : X ⟶ Y) [Etale f.hom.left]
    (n : ℤ) (i : ℕ) :
    motivicCohomologyCompactSupport D X n i →+ motivicCohomologyCompactSupport D Y n i :=
  Preadditive.leftComp _ (motiveCompactSupport.mapEtale D f)

/-- Covariance of `H^BM` for proper maps. -/
def borelMooreMotivicHomology.mapProper {X Y : SchFT k} (f : X ⟶ Y) [IsProper f.hom.left]
    (n : ℤ) (i : ℕ) :
    borelMooreMotivicHomology D X n i →+ borelMooreMotivicHomology D Y n i :=
  Preadditive.rightComp _ (motiveCompactSupport.mapProper D f)

/-- Contravariance of `H^BM` for étale maps. -/
def borelMooreMotivicHomology.mapEtale {X Y : SchFT k} (f : X ⟶ Y) [Etale f.hom.left]
    (n : ℤ) (i : ℕ) :
    borelMooreMotivicHomology D Y n i →+ borelMooreMotivicHomology D X n i :=
  Preadditive.rightComp _ (motiveCompactSupport.mapEtale D f)

/-- The long exact localisation sequence
`H^BM_{n,i}(Z) ⟶ H^BM_{n,i}(X) ⟶ H^BM_{n,i}(U) ⟶ H^BM_{n-1,i}(Z)` (characteristic zero in place
of perfect with resolution). -/
theorem borelMoore_localisation [CharZero k] {X Z : SchFT k} (i : Z ⟶ X)
    [IsClosedImmersion i.hom.left] [IsProper i.hom.left] (n : ℤ) (w : ℕ) :
    ∃ bd : borelMooreMotivicHomology D (SchFT.ofOpen X (SchFT.complement i)) n w →+
        borelMooreMotivicHomology D Z (n - 1) w,
      Function.Exact (borelMooreMotivicHomology.mapProper D i n w)
          (borelMooreMotivicHomology.mapEtale D (SchFT.ofOpenι X (SchFT.complement i)) n w) ∧
        Function.Exact
          (borelMooreMotivicHomology.mapEtale D (SchFT.ofOpenι X (SchFT.complement i)) n w) bd ∧
        Function.Exact bd (borelMooreMotivicHomology.mapProper D i (n - 1) w) := sorry

/-- The long exact localisation sequence
`H^{n,i}_c(U) ⟶ H^{n,i}_c(X) ⟶ H^{n,i}_c(Z) ⟶ H^{n+1,i}_c(U)`. -/
theorem motivicCohomologyCompactSupport_localisation [CharZero k] {X Z : SchFT k} (i : Z ⟶ X)
    [IsClosedImmersion i.hom.left] [IsProper i.hom.left] (n : ℤ) (w : ℕ) :
    ∃ bd : motivicCohomologyCompactSupport D Z n w →+
        motivicCohomologyCompactSupport D (SchFT.ofOpen X (SchFT.complement i)) (n + 1) w,
      Function.Exact
          (motivicCohomologyCompactSupport.mapEtale D (SchFT.ofOpenι X (SchFT.complement i)) n w)
          (motivicCohomologyCompactSupport.mapProper D i n w) ∧
        Function.Exact (motivicCohomologyCompactSupport.mapProper D i n w) bd ∧
        Function.Exact bd
          (motivicCohomologyCompactSupport.mapEtale D (SchFT.ofOpenι X (SchFT.complement i))
            (n + 1) w) := sorry

/-- For `X` proper, `H^{n,i}_c(X, R)` is the motivic cohomology `Hom(M(X), R(i)[n])` of MVW
Definition 14.17. -/
theorem motivicCohomologyCompactSupport_of_proper (X : SchFT k) (_hX : IsProper X.obj.hom)
    (n : ℤ) (i : ℕ) :
    Function.Bijective (Preadditive.leftComp ((D.twist i)⟦n⟧)
      (motiveCompactSupport.fromMotive D X)) := sorry

/-- Unit test `proper_case`: for `X` proper, `H^{n,i}_c(X, R) = H^{n,i}(X, R)`. -/
example (X : SchFT k) (hX : IsProper X.obj.hom) (n : ℤ) (i : ℕ) :
    Nonempty (motivicCohomologyCompactSupport D X n i ≃+ (D.Mft.obj X ⟶ (D.twist i)⟦n⟧)) := sorry

/-- Unit test `bm_affine_line`: over a perfect field `H^BM_{2,1}(𝔸¹, ℤ) = ℤ`. -/
example [PerfectField k] (D : DMeffData k ℤ Cor DM) :
    Nonempty (borelMooreMotivicHomology D (SmSch.toSchFT.obj (SmSch.affineLine k)) 2 1 ≃+ ℤ) :=
  sorry

/-- Unit test `bm_point_weight_zero`: `H^BM_{n,0}(Spec k, ℤ) = Hom(ℤ[n], ℤ)` is `ℤ` for `n = 0` and
`0` otherwise. -/
example (D : DMeffData k ℤ Cor DM) (n : ℤ) :
    (n = 0 → Nonempty (borelMooreMotivicHomology D (SchFT.point k) n 0 ≃+ ℤ)) ∧
      (n ≠ 0 → Subsingleton (borelMooreMotivicHomology D (SchFT.point k) n 0)) := sorry

/-- Unit test `localisation_exact`: for the origin of `𝔸¹` the sequence
`H^BM_{n,i}(0) ⟶ H^BM_{n,i}(𝔸¹) ⟶ H^BM_{n,i}(𝔾_m) ⟶ H^BM_{n-1,i}(0)` is exact. -/
example [CharZero k]
    [IsClosedImmersion (SmSch.toSchFT.map (SmSch.origin k)).hom.left]
    [IsProper (SmSch.toSchFT.map (SmSch.origin k)).hom.left] (n : ℤ) (w : ℕ) :
    ∃ bd : borelMooreMotivicHomology D (SchFT.ofOpen (SmSch.toSchFT.obj (SmSch.affineLine k))
          (SchFT.complement (SmSch.toSchFT.map (SmSch.origin k)))) n w →+
        borelMooreMotivicHomology D (SmSch.toSchFT.obj (SmSch.point k)) (n - 1) w,
      Function.Exact
          (borelMooreMotivicHomology.mapProper D (SmSch.toSchFT.map (SmSch.origin k)) n w)
          (borelMooreMotivicHomology.mapEtale D (SchFT.ofOpenι _
            (SchFT.complement (SmSch.toSchFT.map (SmSch.origin k)))) n w) ∧
        Function.Exact (borelMooreMotivicHomology.mapEtale D (SchFT.ofOpenι _
            (SchFT.complement (SmSch.toSchFT.map (SmSch.origin k)))) n w) bd := sorry

/-! ### Comparison with cycle complexes -/

/-- MC.4/suslin-friedlander-comparison: over a perfect field the Suslin–Friedlander complex
`ℤ_SF(i) = C_* z_equi(𝔸ⁱ, 0)[-2i]` is isomorphic to the motivic complex `ℤ(i)` (MVW
Theorem 16.8), stated in `DM^{eff,-}_Nis`; the quasi-isomorphism of complexes of Zariski sheaves,
and with it `H^{n,i}(X, ℤ) ≅ H^n(X, ℤ_SF(i))`, needs M.5a's complexes of sheaves and is not
stated. -/
theorem suslinFriedlander_quasiIso [PerfectField k] (i : ℕ) :
    Nonempty
      ((D.ofPST.obj (zEqui D (SmSch.toSchFT.obj (SmSch.affineSpace k i)) 0))⟦(-(2 * i) : ℤ)⟧ ≅
        D.twist i) := sorry

/-- MC.4/suslin-friedlander-into-cycle-complex: over a perfect field and for `X` smooth,
`H^{n,i}(X, ℤ) ≅ H^{n-2i}(X, z^i(- × 𝔸ⁱ, *))` (MVW Corollary 19.9), the hypercohomology of the
cycle complexes being M.4's. -/
theorem suslinFriedlander_into_cycleComplex [PerfectField k] (D : DMeffData k ℤ Cor DM)
    (H : HigherChowData k) (X : SmSch k) (n : ℤ) (i : ℕ) :
    Nonempty (D.motivicCohomology X n i ≃+ H.cycleComplexCohomology X i (n - 2 * i)) := sorry

/-- The bivariant cycle cohomology `A_{r,n}(Y, X) = Hom(M(Y)[n], C_* z_equi(X, r))`
(MVW Lecture 16). -/
abbrev bivariantCycleCohomology (Y X : SchFT k) (r : ℕ) (n : ℤ) : Type v :=
  (D.Mft.obj Y)⟦n⟧ ⟶ D.ofPST.obj (zEqui D X r)

/-- MC.4/bivariant-shifting-theorem: for `r ≥ 0` and `A` in `DM^{eff,-}_Nis`,
`Hom(A(1)[2], C_* z_equi(X, r)) ≅ Hom(A, C_* z_equi(X, r + 1))` and
`Hom(A(r)[2r], M^c(X)) ≅ Hom(A, C_* z_equi(X, r))` (characteristic zero in place of perfect with
resolution). -/
theorem bivariant_shift [CharZero k] (X : SchFT k) (r : ℕ) (A : DM) :
    Nonempty (((A ⊗ D.twist 1)⟦(2 : ℤ)⟧ ⟶ D.ofPST.obj (zEqui D X r)) ≃+
        (A ⟶ D.ofPST.obj (zEqui D X (r + 1)))) ∧
      Nonempty (((A ⊗ D.twist r)⟦(2 * r : ℤ)⟧ ⟶ motiveCompactSupport D X) ≃+
        (A ⟶ D.ofPST.obj (zEqui D X r))) := sorry

/-- MC.4/bivariant-shifting-theorem, last part: for a flat `X ⟶ Y` of relative dimension `r`
there is a morphism `M^c(Y)(r)[2r] ⟶ M^c(X)`. -/
def compactSupport_flatPullback [CharZero k] {X Y : SchFT k} (f : X ⟶ Y) [Flat f.hom.left]
    (r : ℕ) (_hf : IsEquidimOfRelDim f.hom.left r) :
    (motiveCompactSupport D Y ⊗ D.twist r)⟦(2 * r : ℤ)⟧ ⟶ motiveCompactSupport D X := sorry

/-- MC.4/friedlander-voevodsky-duality: for `T` smooth of dimension `d` and `X`, `Y` of finite
type, `Hom(M(X × T)[n], M^c(Y)) ≅ Hom(M(X)(d)[2d + n], M^c(T × Y))` (characteristic zero in place
of perfect with resolution; the source cites Friedlander–Voevodsky 8.2 without proof). -/
theorem motives_duality [CharZero k] (T : SmSch k) (d : ℕ)
    (_hT : SmoothOfRelativeDimension d T.obj.hom) (X Y : SchFT k) (n : ℤ) :
    Nonempty (((D.Mft.obj (X.prod (SmSch.toSchFT.obj T)))⟦n⟧ ⟶ motiveCompactSupport D Y) ≃+
      ((D.Mft.obj X ⊗ D.twist d)⟦(2 * d + n : ℤ)⟧ ⟶
        motiveCompactSupport D ((SmSch.toSchFT.obj T).prod Y))) := sorry

/-- MC.4/dual-of-motive-of-smooth-scheme: for `X` smooth of dimension `d`,
`M^c(X)(r)[-2d] ≅ RHom(M(X), ℤ(d + r))` for `r ≥ 0`; hence `M^c(X) ≅ RHom(M(X), ℤ(d))[2d]` and
`RHom(M(X), ℤ(i))` is an effective geometric motive for `i ≥ d` (characteristic zero in place of
perfect with resolution). -/
theorem motive_dual_smooth [CharZero k] (D : DMeffData k ℤ Cor DM) (X : SmSch k) (d : ℕ)
    (_hX : SmoothOfRelativeDimension d X.obj.hom) :
    (∀ r : ℕ, Nonempty ((motiveCompactSupport D (SmSch.toSchFT.obj X) ⊗ D.twist r)⟦(-(2 * d) : ℤ)⟧ ≅
      (D.rhom (D.M.obj X)).obj (D.twist (d + r)))) ∧
    ∀ i ≥ d, DMeffGm.prop D ((D.rhom (D.M.obj X)).obj (D.twist i)) := sorry

/-! ### Duality for geometric motives -/

/-- MC.4/geometric-motive-dual: the dual `M^* = RHom(M(r), ℤ(i))(r - i)` of a geometric motive,
for `r` with `M(r)` effective and `i` large; independent of the choices. -/
def DMgm.dual (A : DMgm D) : DMgm D := sorry

/-- `M ↦ M^*` as a contravariant triangulated functor `DM_gmᵒᵖ ⥤ DM_gm`. -/
def DMgm.dualFunctor : (DMgm D)ᵒᵖ ⥤ DMgm D := sorry

theorem DMgm.dualFunctor_obj (A : DMgm D) : (DMgm.dualFunctor D).obj (op A) = DMgm.dual D A :=
  sorry

/-- For `X` smooth of dimension `d`, `M(X)^* ≅ M^c(X)(-d)[-2d]` (characteristic zero in place of
perfect with resolution). -/
theorem DMgm.dual_obj_smooth [CharZero k] (X : SmSch k) (d : ℕ)
    (_hX : SmoothOfRelativeDimension d X.obj.hom) :
    Nonempty (DMgm.dual D (DMgm.mk D (DMeffGm.motive D X) 0) ≅
      (DMgm.mk D ⟨motiveCompactSupport D (SmSch.toSchFT.obj X),
        motiveCompactSupport_geometric D _⟩ (-d))⟦(-(2 * d) : ℤ)⟧) := sorry

/-- `M(r)^* ≅ M^*(-r)`. -/
theorem DMgm.dual_twist (A : DMgm D) (r : ℤ) :
    Nonempty (DMgm.dual D (InvertObject.mk _ A.obj (A.exp + r)) ≅
      InvertObject.mk _ (DMgm.dual D A).obj ((DMgm.dual D A).exp - r)) := sorry

/-- `M^*` represents `A ↦ Hom_gm(A ⊗ M, ℤ)`. -/
def DMgm.homEquivDual [PerfectField k] (A M : DMgm D) :
    (A ⟶ DMgm.dual D M) ≃ (A ⊗ M ⟶ 𝟙_ (DMgm D)) := sorry

/-- The evaluation `ε_M : M^* ⊗ M ⟶ ℤ`, adjoint to the identity of `M^*`. -/
def DMgm.evaluation [PerfectField k] (M : DMgm D) : DMgm.dual D M ⊗ M ⟶ 𝟙_ (DMgm D) :=
  DMgm.homEquivDual D (DMgm.dual D M) M (𝟙 _)

/-- The dual of `ℤ` is `ℤ`. -/
theorem DMgm.dual_unit [PerfectField k] : Nonempty (DMgm.dual D (𝟙_ (DMgm D)) ≅ 𝟙_ (DMgm D)) :=
  sorry

/-- Unit test `dual_unit`: the dual of `ℤ` is isomorphic to `ℤ`. -/
example [PerfectField k] : Nonempty (DMgm.dual D (𝟙_ (DMgm D)) ≅ 𝟙_ (DMgm D)) := sorry

/-- Unit test `dual_tate`: `ℤ(1)^* ≅ ℤ(-1)`. -/
example : Nonempty (DMgm.dual D (DMgm.mk D (DMeffGm.unit D) 1) ≅ DMgm.mk D (DMeffGm.unit D) (-1)) :=
  sorry

/-- Unit test `dual_projective_line`: `M(ℙ¹)^* ≅ ℤ ⊕ ℤ(-1)[-2]`. -/
example [CharZero k] :
    Nonempty (DMgm.dual D (DMgm.mk D (DMeffGm.motive D (SmSch.projectiveSpace k 1)) 0) ≅
      DMgm.mk D (DMeffGm.unit D) 0 ⊞ (DMgm.mk D (DMeffGm.unit D) (-1))⟦(-2 : ℤ)⟧) := sorry

/-- Unit test `dual_not_rhom`: for the Lefschetz motive `L = M(ℙ¹)/M(Spec k) = ℤ(1)[2]`,
`L^* ≅ ℤ(-1)[-2]` while `RHom(L, ℤ) = 0` (MVW Remark 20.10). -/
example [CharZero k] (D : DMeffData k ℤ Cor DM) :
    Nonempty (DMgm.dual D ((DMgm.mk D (DMeffGm.unit D) 1)⟦(2 : ℤ)⟧) ≅
      (DMgm.mk D (DMeffGm.unit D) (-1))⟦(-2 : ℤ)⟧) ∧
    IsZero ((D.rhom ((D.twist 1)⟦(2 : ℤ)⟧)).obj (𝟙_ DM)) := sorry

/-- MC.4/double-dual-isomorphism: the map `ι_M : M ⟶ M^{**}` adjoint to `ε_M` (composed with the
symmetry) is an isomorphism (characteristic zero in place of perfect with resolution). -/
theorem DMgm.doubleDual_iso [CharZero k] (D : DMeffData k ℤ Cor DM) (M : DMgm D) :
    IsIso ((DMgm.homEquivDual D M (DMgm.dual D M)).symm
      ((β_ M (DMgm.dual D M)).hom ≫ DMgm.evaluation D M)) := sorry

/-- MC.4/dual-of-tensor-product: the map `M^* ⊗ N^* ⟶ (M ⊗ N)^*` induced by `ε_M ⊗ ε_N` is an
isomorphism (characteristic zero in place of perfect with resolution). -/
theorem DMgm.dual_tensor_iso [CharZero k] (D : DMeffData k ℤ Cor DM) (M N : DMgm D) :
    IsIso ((DMgm.homEquivDual D (DMgm.dual D M ⊗ DMgm.dual D N) (M ⊗ N)).symm
      (tensorμ (DMgm.dual D M) (DMgm.dual D N) M N ≫
        (DMgm.evaluation D M ⊗ₘ DMgm.evaluation D N) ≫ (λ_ _).hom)) := sorry

/-- MC.4/geometric-motives-rigid: `Hom_gm(L ⊗ M, N) ≅ Hom_gm(L, M^* ⊗ N)` naturally, so the
internal Hom of `M` and `N` is `M^* ⊗ N` (characteristic zero in place of perfect with
resolution; integral coefficients as in MVW Theorem 20.17). -/
def DMgm.internalHomEquiv [CharZero k] (D : DMeffData k ℤ Cor DM) (L M N : DMgm D) :
    (L ⊗ M ⟶ N) ≃ (L ⟶ DMgm.dual D M ⊗ N) := sorry

/-- MC.4/geometric-motives-rigid: `DM_gm(k, ℤ)` is a rigid symmetric monoidal category, the dual
of `M` being `M^*` with evaluation `ε_M` (characteristic zero in place of perfect with
resolution). -/
instance DMgm.instRigidCategory [CharZero k] (D : DMeffData k ℤ Cor DM) :
    RigidCategory (DMgm D) := sorry

end CompactSupport

end MC4
section MC5

open CategoryTheory Limits MonoidalCategory TensorProduct

/-! ## MC.5 Nori motives and diagram categories

Diagrams and their representations follow HMS Appendix B. A diagram is Mathlib's quiver with a
chosen loop at each vertex; a representation is a prefunctor sending the chosen loops to
identities, with no condition on composites. The diagram category is defined in the roadmap as
Tau Ceti's `TauCeti.FGComoduleCat R T.coalgebra`; Tau Ceti is not importable in this session, so
`Diagram.category` below has a real signature and a `sorry` body, and everything about it is
stated through its fibre functor. -/

/-- MC.5/diagram: a small diagram, a quiver on a type of vertices with a distinguished edge
`id v : v ⟶ v` at every vertex (HMS Remark B.2). There is no composition. -/
structure Diagram where
  /-- The vertices. -/
  V : Type v
  /-- The edges. -/
  [quiver : Quiver.{v} V]
  /-- The distinguished identity edge at each vertex. -/
  id : ∀ x : V, x ⟶ x

attribute [instance] Diagram.quiver

namespace Diagram

variable (D : Diagram.{v})

/-- A morphism of diagrams: a prefunctor sending identity edges to identity edges. -/
structure Hom (D' : Diagram.{v}) where
  /-- The map on vertices. -/
  obj : D.V → D'.V
  /-- The map on edges. -/
  map : ∀ {x y : D.V}, (x ⟶ y) → (obj x ⟶ obj y)
  map_id : ∀ x, map (D.id x) = D'.id (obj x)

/-- The identity morphism of a diagram. -/
def Hom.idHom : D.Hom D := ⟨_root_.id, fun e => e, fun _ => rfl⟩

/-- Composition of morphisms of diagrams. -/
def Hom.comp {D D' D'' : Diagram.{v}} (φ : D.Hom D') (ψ : D'.Hom D'') : D.Hom D'' :=
  ⟨ψ.obj ∘ φ.obj, fun e => ψ.map (φ.map e), fun x => by simp [φ.map_id, ψ.map_id]⟩

/-- The full subdiagram on the vertices satisfying `P`. -/
def fullSubdiagram (P : D.V → Prop) : Diagram.{v} where
  V := {x // P x}
  quiver := ⟨fun a b => a.1 ⟶ b.1⟩
  id a := D.id a.1

/-- The inclusion of a full subdiagram. -/
def fullSubdiagram.incl (P : D.V → Prop) : (D.fullSubdiagram P).Hom D :=
  ⟨Subtype.val, fun e => e, fun _ => rfl⟩

/-- The finite subdiagram on a finite set of vertices, with all edges of `D` between them. -/
def finiteSubdiagram (S : Finset D.V) : Diagram.{v} := D.fullSubdiagram (· ∈ S)

/-- The inclusion of finite subdiagrams for `S ⊆ S'`. -/
def finiteSubdiagram.inclOfLE {S S' : Finset D.V} (h : S ⊆ S') :
    (D.finiteSubdiagram S).Hom (D.finiteSubdiagram S') :=
  ⟨fun x => ⟨x.1, h x.2⟩, fun e => e, fun _ => rfl⟩

/-- The finite subdiagrams, ordered by inclusion, form a directed system: any two are contained
in a third. -/
theorem finiteSubdiagram_directed : IsDirected (Finset D.V) (· ⊆ ·) := sorry

/-- The diagram underlying a category: its objects, its morphisms, and the identities. -/
def ofCategory (J : Type v) [Category.{v} J] : Diagram.{v} where
  V := J
  quiver := inferInstance
  id x := 𝟙 x

/-- The diagram on a type of vertices with only the identity edges. -/
def discrete (ι : Type v) : Diagram.{v} where
  V := ι
  quiver := ⟨fun x y => ULift.{v} (PLift (x = y))⟩
  id _ := ⟨⟨rfl⟩⟩

instance (ι : Type v) [Fintype ι] : Fintype (discrete ι).V := inferInstanceAs (Fintype ι)

/-- The diagram with one vertex and only its identity edge. -/
abbrev single : Diagram.{v} := discrete PUnit

/-- The diagram `p ⟶ q`: two vertices, their identity edges and one edge `m : p ⟶ q`. -/
def arrow : Diagram.{v} where
  V := ULift.{v} Bool
  quiver := ⟨fun x y => ULift.{v} (PLift (x.down ≤ y.down))⟩
  id _ := ⟨⟨le_rfl⟩⟩

/-- A representation of a diagram `D` in a category `C` (HMS Definition B.4): a map of directed
graphs to the underlying quiver of `C` sending every identity edge to an identity morphism.
Nothing is required of composites. -/
structure Rep (C : Type*) [Category C] where
  /-- The object attached to a vertex. -/
  obj : D.V → C
  /-- The morphism attached to an edge. -/
  map : ∀ {x y : D.V}, (x ⟶ y) → (obj x ⟶ obj y)
  map_loop : ∀ x, map (D.id x) = 𝟙 (obj x)

namespace Rep

variable {D} {C : Type*} [Category C] (T : D.Rep C)

/-- `T(id_v)` is the identity of `T(v)`. -/
@[simp] theorem map_id (x : D.V) : T.map (D.id x) = 𝟙 (T.obj x) := T.map_loop x

/-- The underlying Mathlib prefunctor of a representation. -/
def toPrefunctor : D.V ⥤q C := ⟨T.obj, T.map⟩

/-- A morphism of representations: maps `T(v) ⟶ T'(v)` commuting with every `T(e)`. -/
@[ext]
structure Hom (T' : D.Rep C) where
  /-- The component at a vertex. -/
  app : ∀ x, T.obj x ⟶ T'.obj x
  naturality : ∀ {x y : D.V} (e : x ⟶ y), T.map e ≫ app y = app x ≫ T'.map e

instance : Category (D.Rep C) where
  Hom := Hom
  id T := ⟨fun x => 𝟙 _, fun e => by simp⟩
  comp f g := ⟨fun x => f.app x ≫ g.app x, fun e => by
    rw [← Category.assoc, f.naturality, Category.assoc, g.naturality, Category.assoc]⟩
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The representation attached to a functor on a category. -/
def ofFunctor {J : Type v} [Category.{v} J] (F : J ⥤ C) : (Diagram.ofCategory J).Rep C :=
  ⟨F.obj, fun e => F.map e, fun x => F.map_id x⟩

/-- Restriction of a representation along a morphism of diagrams, for instance to a
subdiagram. -/
def restrict {D' : Diagram.{v}} (T : D'.Rep C) (φ : D.Hom D') : D.Rep C :=
  ⟨T.obj ∘ φ.obj, fun e => T.map (φ.map e), fun x => by simp [φ.map_id]⟩

/-- Restriction is compatible with composition of morphisms of diagrams. -/
theorem restrict_comp {D' D'' : Diagram.{v}} (T : D''.Rep C) (φ : D.Hom D') (ψ : D'.Hom D'') :
    T.restrict (φ.comp ψ) = (T.restrict ψ).restrict φ := rfl

/-- The composite of a representation with a functor. -/
def comp {C' : Type*} [Category C'] (F : C ⥤ C') : D.Rep C' :=
  ⟨fun x => F.obj (T.obj x), fun e => F.map (T.map e), fun x => by simp⟩

/-- The morphism attached to a path of edges, the composite of the edge morphisms. -/
def mapPath : ∀ {x y : D.V}, Quiver.Path x y → (T.obj x ⟶ T.obj y)
  | _, _, .nil => 𝟙 _
  | _, _, .cons p e => mapPath p ≫ T.map e

/-- The representation of the one-vertex diagram with value `X`. -/
def single (X : C) : Diagram.single.{v}.Rep C := ⟨fun _ => X, fun _ => 𝟙 X, fun _ => rfl⟩

/-- The representation of a discrete diagram given by a family of objects. -/
def discrete {ι : Type v} (F : ι → C) : (Diagram.discrete ι).Rep C :=
  ⟨F, fun e => eqToHom (congrArg F e.down.down), fun _ => rfl⟩

/-- The representation of the diagram `p ⟶ q` given by a morphism `f : X ⟶ Y`. -/
def arrow {X Y : C} (f : X ⟶ Y) : Diagram.arrow.{v}.Rep C where
  obj b := cond b.down Y X
  map {a b} e :=
    match a, b, e with
    | ⟨false⟩, ⟨false⟩, _ => 𝟙 X
    | ⟨true⟩, ⟨true⟩, _ => 𝟙 Y
    | ⟨false⟩, ⟨true⟩, _ => f
    | ⟨true⟩, ⟨false⟩, e => absurd e.down.down (by decide : ¬ (true ≤ false))
  map_loop x := by rcases x with ⟨_ | _⟩ <;> rfl

end Rep

end Diagram

/-- Unit test `identity_edges`: for the diagram of a one-object category with monoid `M`, any
map `φ : M → End(V)` with `φ 1 = id`, multiplicative or not, is the edge map of a representation
in `R`-modules with value `V`. -/
example (R : Type) [CommRing R] (M : Type) [Monoid M] (V : Type) [AddCommGroup V] [Module R V]
    (φ : M → Module.End R V) (h1 : φ 1 = 1) :
    ∃ T : (Diagram.ofCategory (SingleObj M)).Rep (ModuleCat.{0} R),
      ∃ h : T.obj (SingleObj.star M) = ModuleCat.of R V,
        ∀ m : M, eqToHom h.symm ≫ T.map (show SingleObj.star M ⟶ SingleObj.star M from m) ≫
          eqToHom h = ModuleCat.ofHom (φ m) := sorry

/-- Unit test `representation_is_not_a_functor`: on the diagram of the monoid `ℕ`, sending
`0` to the identity and every `n ≥ 1` to multiplication by `2` on `ℚ` is a representation, but
not a functor: the value on `1 + 1` is not the square of the value on `1`. -/
example :
    let T : (Diagram.ofCategory (SingleObj (Multiplicative ℕ))).Rep (ModuleCat.{0} ℚ) :=
      { obj := fun _ => ModuleCat.of ℚ ℚ
        map := fun {_ _} n =>
          if (show Multiplicative ℕ from n) = 1 then 𝟙 _ else (2 : ℚ) • 𝟙 _
        map_loop := fun _ => by simp [Diagram.ofCategory, SingleObj.id_as_one] }
    T.map (show SingleObj.star _ ⟶ SingleObj.star _ from
        Multiplicative.ofAdd 1 * Multiplicative.ofAdd 1) ≠
      T.map (show SingleObj.star _ ⟶ SingleObj.star _ from Multiplicative.ofAdd 1) ≫
        T.map (show SingleObj.star _ ⟶ SingleObj.star _ from Multiplicative.ofAdd 1) := sorry

/-- Unit test `identity_preserved`: a representation never sends an identity edge at a
vertex with nonzero value to `0`; the zero map of directed graphs is not a representation. -/
example (R : Type) [CommRing R] (D : Diagram.{0}) (T : D.Rep (ModuleCat.{0} R)) (x : D.V)
    [Nontrivial (T.obj x)] : T.map (D.id x) ≠ 0 := sorry

/-- Unit test `finite_subdiagrams_are_filtered`: two finite subdiagrams are contained in the
one on the union of their vertex sets. -/
example (D : Diagram.{0}) [DecidableEq D.V] (S S' : Finset D.V) :
    ∃ U : Finset D.V, S ⊆ U ∧ S' ⊆ U ∧ U = S ∪ S' :=
  ⟨S ∪ S', Finset.subset_union_left, Finset.subset_union_right, rfl⟩

/-! ### The endomorphism coalgebra (MC.5/endomorphism-coalgebra) -/

namespace Diagram.Rep

variable {R : Type u} [CommRing R] {D : Diagram.{v}} (T : D.Rep (FGModuleCat.{u} R))

/-- The linear map `T(e)`. -/
abbrev linMap {x y : D.V} (e : x ⟶ y) : T.obj x →ₗ[R] T.obj y := (T.map e).hom.hom

/-- `End(T|F)` for the finite subdiagram on `S`: the families of endomorphisms of the `T(x)`,
`x ∈ S`, commuting with the maps attached to the edges of the subdiagram. -/
def endRing (S : Finset D.V) : Subalgebra R ((x : S) → Module.End R (T.obj x.1)) where
  carrier := {φ | ∀ (x y : S) (e : x.1 ⟶ y.1), φ y ∘ₗ T.linMap e = T.linMap e ∘ₗ φ x}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

/-- A family lies in `End(T|F)` exactly when it commutes with every edge map of `F`. -/
theorem endRing_mem_iff (S : Finset D.V) (φ : (x : S) → Module.End R (T.obj x.1)) :
    φ ∈ T.endRing S ↔ ∀ (x y : S) (e : x.1 ⟶ y.1), φ y ∘ₗ T.linMap e = T.linMap e ∘ₗ φ x :=
  Iff.rfl

/-- Restriction `End(T|F') → End(T|F)` for `F ⊆ F'`. -/
def endRestrict {S S' : Finset D.V} (h : S ⊆ S') : T.endRing S' →ₐ[R] T.endRing S := sorry

open scoped Classical in
/-- MC.5/endomorphism-coalgebra: `A(T) = colim_F End(T|F)^∨`, the filtered colimit over the
finite subdiagrams of the `R`-duals of the endomorphism rings. -/
def coalgebra : Type (max u v) :=
  Module.DirectLimit (fun S : Finset D.V => Module.Dual R (T.endRing S))
    (fun _ _ h => (T.endRestrict h).toLinearMap.dualMap)

instance : AddCommGroup T.coalgebra := by unfold coalgebra; infer_instance

instance : Module R T.coalgebra := by unfold coalgebra; infer_instance

/-- The coalgebra structure dual to the multiplication of the `End(T|F)` (HMS Proposition
B.7; for `R` a field, or a Dedekind domain with `T` in `R`-Proj). -/
instance coalgebraCoalgebra : Coalgebra R T.coalgebra := sorry

open scoped Classical in
/-- The canonical maps of the filtered colimit, `End(T|F)^∨ → A(T)`. -/
def colimit (S : Finset D.V) : Module.Dual R (T.endRing S) →ₗ[R] T.coalgebra :=
  Module.DirectLimit.of R (Finset D.V) (fun S : Finset D.V => Module.Dual R (T.endRing S))
    (fun _ _ h => (T.endRestrict h).toLinearMap.dualMap) S

/-- The canonical maps are compatible with the transition maps. -/
theorem colimit_comp {S S' : Finset D.V} (h : S ⊆ S') :
    T.colimit S' ∘ₗ (T.endRestrict h).toLinearMap.dualMap = T.colimit S := sorry

/-- Each `T(x)` is a right comodule over `A(T)`: its coaction. -/
def comodule (x : D.V) : T.obj x →ₗ[R] T.obj x ⊗[R] T.coalgebra := sorry

/-- The coaction is coassociative. -/
theorem comodule_coassoc (x : D.V) :
    (Coalgebra.comul (R := R) (A := T.coalgebra)).lTensor _ ∘ₗ T.comodule x =
      (TensorProduct.assoc R _ _ _).toLinearMap ∘ₗ (T.comodule x).rTensor _ ∘ₗ T.comodule x :=
  sorry

/-- The coaction is counital. -/
theorem comodule_counit (x : D.V) :
    (Coalgebra.counit (R := R) (A := T.coalgebra)).lTensor _ ∘ₗ T.comodule x =
      (TensorProduct.rid R _).symm.toLinearMap := sorry

/-- Every `T(e)` is a map of comodules. -/
theorem comodule_map {x y : D.V} (e : x ⟶ y) :
    T.comodule y ∘ₗ T.linMap e = (T.linMap e).rTensor _ ∘ₗ T.comodule x := sorry

end Diagram.Rep

/-- Unit test `one_vertex`: for the diagram with one vertex, only its identity edge and value
`V`, the coalgebra is the dual of `End(V)`. -/
example (R : Type) [Field R] (V : FGModuleCat.{0} R) :
    Nonempty ((Diagram.Rep.single.{0} V).coalgebra ≃ₗ[R] Module.Dual R (Module.End R V)) := sorry

/-- Unit test `edges_cut_it_down`: for `p ⟶ q` with `T(p) = T(q) = ℚ` and the edge sent to the
identity the coalgebra has dimension `1`; for the two vertices without the edge it has
dimension `2`. -/
example :
    Module.finrank ℚ (Diagram.Rep.arrow.{0} (𝟙 (FGModuleCat.of ℚ ℚ))).coalgebra = 1 ∧
      Module.finrank ℚ
        (Diagram.Rep.discrete.{0} fun _ : ULift Bool => FGModuleCat.of ℚ ℚ).coalgebra = 2 :=
  sorry

/-- Unit test `colimit_is_filtered`: for infinitely many isolated vertices with value `ℚ`,
`A(T) = colim_F (ℚ^F)^∨` is the direct sum of copies of `ℚ`, not the product. -/
example (ι : Type) [Infinite ι] :
    Nonempty ((Diagram.Rep.discrete.{0} fun _ : ι => FGModuleCat.of ℚ ℚ).coalgebra ≃ₗ[ℚ]
      (ι →₀ ℚ)) := sorry

/-! ### The diagram category (MC.5/diagram-category) -/

namespace Diagram

variable {R : Type u} [Field R] {D : Diagram.{v}} (T : D.Rep (FGModuleCat.{u} R))

/-- MC.5/diagram-category: the diagram category `C(D, T)`, the right `A(T)`-comodules finitely
generated over `R`. In the roadmap this is `TauCeti.FGComoduleCat R T.coalgebra`; Tau Ceti is not
importable here, so the body is left as `sorry`. -/
def category (T : D.Rep (FGModuleCat.{u} R)) : Type (max (u + 1) (v + 1)) := sorry

instance : Category.{max u v} (category T) := sorry

namespace category

/-- The fibre functor `f_T : C(D, T) ⥤ R-Mod`, forgetting the coaction. -/
def fibre : category T ⥤ FGModuleCat.{u} R := sorry

/-- The representation `T~ : D ⟶ C(D, T)`: each `T(v)` with its coaction. -/
def ofRep : D.Rep (category T) := sorry

/-- `f_T ∘ T~ = T`. -/
@[simp] theorem fibre_ofRep : (ofRep T).comp (fibre T) = T := sorry

/- MC.5/finite-comodules-abelian (for any coalgebra `C` over a field `K`, Tau Ceti's
`FGComoduleCat K C` is `K`-linear abelian, with exact faithful conservative forgetful functor) is
left out: its subject, `TauCeti.FGComoduleCat`, cannot be named without importing Tau Ceti, and
Mathlib has no comodule category. Its consequences for diagram categories are the instances
`Diagram.category.instAbelian`, `instLinear`, `fibre_faithful` and the theorem `fibre_exact`. -/

/-- `C(D, T)` is abelian (MC.5/finite-comodules-abelian for `A(T)`). -/
instance instAbelian : Abelian (category T) := sorry

/-- `C(D, T)` is `R`-linear. -/
instance instLinear : Linear R (category T) := sorry

/-- `f_T` is faithful. -/
instance fibre_faithful : (fibre T).Faithful := sorry

instance fibre_additive : (fibre T).Additive := sorry

instance fibre_linear : (fibre T).Linear R := sorry

/-- `f_T` is exact. -/
theorem fibre_exact : PreservesFiniteLimits (fibre T) ∧ PreservesFiniteColimits (fibre T) :=
  sorry

/-- The comodule structure of an object of `C(D, T)`: the coaction on its underlying module. -/
def coaction (X : category T) : (fibre T).obj X →ₗ[R] (fibre T).obj X ⊗[R] T.coalgebra := sorry

/-- For a finite diagram `C(D, T)` is the category of finitely generated `End(T)`-modules; for a
general diagram it is the colimit over finite subdiagrams of these categories (HMS B.6-B.7),
which Mathlib cannot yet state (no colimits of categories), so only the finite case is stated. -/
def equivModules [Fintype D.V] :
    category T ≌ FGModuleCat.{max u v} (T.endRing Finset.univ) := sorry

/-- A morphism of diagrams induces a functor of diagram categories. -/
def map {D' : Diagram.{v}} (φ : D.Hom D') (T' : D'.Rep (FGModuleCat.{u} R)) :
    category (T'.restrict φ) ⥤ category T' := sorry

/-- The induced functor is compatible with the fibre functors. -/
theorem map_fibre {D' : Diagram.{v}} (φ : D.Hom D') (T' : D'.Rep (FGModuleCat.{u} R)) :
    Nonempty (map φ T' ⋙ fibre T' ≅ fibre (T'.restrict φ)) := sorry

/-- The induced functors are compatible with composition. -/
theorem map_comp {D' D'' : Diagram.{v}} (φ : D.Hom D') (ψ : D'.Hom D'')
    (T'' : D''.Rep (FGModuleCat.{u} R)) :
    Nonempty (map (φ.comp ψ) T'' ≅ map φ (T''.restrict ψ) ⋙ map ψ T'') := sorry

/-- MC.5/diagram-category-universal-property (HMS Proposition B.8): for an `R`-linear abelian
`A` with a faithful exact `R`-linear `f_A : A ⥤ R-Mod` and a representation `F : D ⟶ A` with
`f_A ∘ F = T`, there is a faithful exact `R`-linear `L : C(D, T) ⥤ A` with `L ∘ T~ ≅ F` and
`f_A ∘ L ≅ f_T`, unique up to isomorphism. The source refers the proof elsewhere (gap). -/
theorem universal {A : Type*} [Category A] [Abelian A] [Linear R A]
    (fA : A ⥤ FGModuleCat.{u} R) [fA.Faithful] [fA.Additive] [fA.Linear R]
    [PreservesFiniteLimits fA] [PreservesFiniteColimits fA]
    (F : D.Rep A) (hF : F.comp fA = T) :
    ∃ L : category T ⥤ A, L.Faithful ∧ L.Linear R ∧ PreservesFiniteLimits L ∧
      PreservesFiniteColimits L ∧ Nonempty ((ofRep T).comp L ≅ F) ∧
      Nonempty (L ⋙ fA ≅ fibre T) ∧
      ∀ L' : category T ⥤ A, Nonempty ((ofRep T).comp L' ≅ F) →
        Nonempty (L' ⋙ fA ≅ fibre T) → Nonempty (L ≅ L') := sorry

/-- MC.5/diagram-category-generation: (1) `C(D, T)` is its own smallest full subcategory
containing the `T~(v)` and closed under finite biproducts, subobjects and quotients; (2) every
object is a subquotient of a finite direct sum of objects `T~(v)`; (3) if `T(a)` is an
isomorphism then so is `T~(a)`. -/
theorem generation :
    (∀ P : ObjectProperty (category T), (∀ x, P ((ofRep T).obj x)) →
      (∀ X Y, P X → P Y → P (X ⊞ Y)) →
      (∀ X Y (f : X ⟶ Y), Mono f → P Y → P X) → (∀ X Y (f : X ⟶ Y), Epi f → P X → P Y) →
      ∀ X, P X) ∧
    (∀ X : category T, ∃ (n : ℕ) (x : Fin n → D.V) (Y : category T)
      (i : Y ⟶ ∐ fun j => (ofRep T).obj (x j)) (p : Y ⟶ X), Mono i ∧ Epi p) ∧
    (∀ {x y : D.V} (a : x ⟶ y), IsIso (T.map a) → IsIso ((ofRep T).map a)) := sorry

end category

end Diagram

/-- Unit test `comodule_description`: `C(D, T)` is `FGComoduleCat` over `A(T)`, so `f_T` is
faithful and exact. Tau Ceti's `FGComoduleCat` cannot be named here; the test checks the
consequences through the fibre functor. -/
example (R : Type) [Field R] (D : Diagram.{0}) (T : D.Rep (FGModuleCat.{0} R)) :
    (Diagram.category.fibre T).Faithful ∧ PreservesFiniteLimits (Diagram.category.fibre T) ∧
      PreservesFiniteColimits (Diagram.category.fibre T) := sorry

/-- Unit test `one_vertex`: for one vertex with `T(v) = ℚ²` the diagram category is equivalent
to finite-dimensional `ℚ`-vector spaces (`ℚ²` as a module over `M₂(ℚ)`, by Morita). -/
example : Nonempty (Diagram.category (Diagram.Rep.single.{0} (FGModuleCat.of ℚ (Fin 2 → ℚ))) ≌
    FGModuleCat.{0} ℚ) := sorry

/-- Unit test `empty_diagram`: for the empty diagram `A(T) = 0` and every object of `C(D, T)`
is zero. -/
example (R : Type) [Field R] (T : (Diagram.discrete PEmpty.{1}).Rep (FGModuleCat.{0} R)) :
    Subsingleton T.coalgebra ∧ ∀ X : Diagram.category T, IsZero X := sorry

/-- Unit test `fibre_faithful`: two comodule maps with the same underlying linear map are
equal. -/
example (R : Type) [Field R] (D : Diagram.{0}) (T : D.Rep (FGModuleCat.{0} R))
    {X Y : Diagram.category T} (f g : X ⟶ Y)
    (h : (Diagram.category.fibre T).map f = (Diagram.category.fibre T).map g) : f = g := sorry

/-! ### Graded multiplicative diagrams (MC.5/graded-multiplicative-diagram) -/

namespace Diagram

/-- The sign `(-1)^a` of a parity `a : ZMod 2`. -/
def sign (R : Type*) [Ring R] (a : ZMod 2) : R := (-1) ^ a.val

/-- A grading of the vertices by `ℤ/2` (HMS Definition B.14); only parities enter the signs. -/
structure Graded (D : Diagram.{v}) where
  /-- The parity `|f|` of a vertex. -/
  deg : D.V → ZMod 2

/-- The parity `|g| = |e| - |e'|` of an edge `g : e ⟶ e'`. -/
def Graded.edgeDeg {D : Diagram.{v}} (G : D.Graded) {x y : D.V} (_ : x ⟶ y) : ZMod 2 :=
  G.deg x - G.deg y

/-- A commutative product structure with unit on a graded diagram, in the weak form of HMS
Remark B.17: a product of vertices, the edges `(a, id)` and `(id, b)` sent to paths, the edges
`a_{f,g}`, `b_{f,g,h}`, `b'_{f,g,h}`, and a unit vertex of degree `0` with edges `u_f`. -/
structure ProductStructure (D : Diagram.{v}) (G : D.Graded) where
  /-- The product `f × g` of vertices. -/
  mul : D.V → D.V → D.V
  deg_mul : ∀ f g, G.deg (mul f g) = G.deg f + G.deg g
  /-- The image of the edge `(a, id_g)` of `D × D`. -/
  mulLeft : ∀ {f f' : D.V} (_ : f ⟶ f') (g : D.V), Quiver.Path (mul f g) (mul f' g)
  /-- The image of the edge `(id_f, b)` of `D × D`. -/
  mulRight : ∀ (f : D.V) {g g' : D.V} (_ : g ⟶ g'), Quiver.Path (mul f g) (mul f g')
  /-- `a_{f,g} : f × g ⟶ g × f`. -/
  swap : ∀ f g, mul f g ⟶ mul g f
  /-- `b_{f,g,h} : f × (g × h) ⟶ (f × g) × h`. -/
  assoc : ∀ f g h, mul f (mul g h) ⟶ mul (mul f g) h
  /-- `b'_{f,g,h} : (f × g) × h ⟶ f × (g × h)`. -/
  assoc' : ∀ f g h, mul (mul f g) h ⟶ mul f (mul g h)
  /-- The unit vertex. -/
  unit : D.V
  deg_unit : G.deg unit = 0
  /-- `u_f : f ⟶ 1 × f`. -/
  unitEdge : ∀ f, f ⟶ mul unit f

variable {R : Type u} [Field R] {D : Diagram.{v}}

/-- A graded multiplicative representation in `R`-modules (HMS Definition B.14): isomorphisms
`τ_{f,g} : T(f × g) ≅ T(f) ⊗ T(g)` with (1) the swap sign `(-1)^{|f||g|}`, (2) the sign
`(-1)^{|g||h|}` for an edge in the first variable, (3) no sign in the second variable,
(4) compatibility with `b` and the associator, (5) `T(b)` and `T(b')` inverse. -/
structure Rep.GradedMultiplicative (T : D.Rep (FGModuleCat.{u} R)) (G : D.Graded)
    (P : D.ProductStructure G) where
  /-- `τ_{f,g}`. -/
  τ : ∀ f g : D.V, T.obj (P.mul f g) ≅ T.obj f ⊗ T.obj g
  swap_eq : ∀ f g, (τ f g).inv ≫ T.map (P.swap f g) ≫ (τ g f).hom =
    sign R (G.deg f * G.deg g) • (β_ (T.obj f) (T.obj g)).hom
  mulLeft_eq : ∀ {f f' : D.V} (a : f ⟶ f') (h : D.V),
    T.mapPath (P.mulLeft a h) ≫ (τ f' h).hom =
      sign R (G.edgeDeg a * G.deg h) • ((τ f h).hom ≫ (T.map a ▷ T.obj h))
  mulRight_eq : ∀ (h : D.V) {g g' : D.V} (b : g ⟶ g'),
    T.mapPath (P.mulRight h b) ≫ (τ h g').hom = (τ h g).hom ≫ (T.obj h ◁ T.map b)
  assoc_eq : ∀ f g h, T.map (P.assoc f g h) ≫ (τ (P.mul f g) h).hom ≫ ((τ f g).hom ▷ T.obj h) =
    (τ f (P.mul g h)).hom ≫ (T.obj f ◁ (τ g h).hom) ≫ (α_ _ _ _).inv
  assoc_inv : ∀ f g h, T.map (P.assoc f g h) ≫ T.map (P.assoc' f g h) = 𝟙 _ ∧
    T.map (P.assoc' f g h) ≫ T.map (P.assoc f g h) = 𝟙 _

variable {T : D.Rep (FGModuleCat.{u} R)} {G : D.Graded} {P : D.ProductStructure G}

/-- Unitality: every `T(u_f)` is an isomorphism. -/
def Rep.GradedMultiplicative.Unital (_ : T.GradedMultiplicative G P) : Prop :=
  ∀ f, IsIso (T.map (P.unitEdge f))

/-- The tensor structure on `C(D, T)` induced by a graded multiplicative representation. -/
abbrev category.monoidal (M : T.GradedMultiplicative G P) : MonoidalCategory (category T) := sorry

/-- The symmetry of that tensor structure. -/
abbrev category.symmetric (M : T.GradedMultiplicative G P) :
    letI := category.monoidal M; SymmetricCategory (category T) := sorry

/-- `f_T` is a symmetric monoidal functor. -/
abbrev category.fibre_monoidal (M : T.GradedMultiplicative G P) :
    letI := category.monoidal M; letI := category.symmetric M; (category.fibre T).Braided :=
  sorry

/-- The commutative ring structure on `A(T)` dual to the tensor structure (HMS Proposition
B.16). -/
abbrev Rep.coalgebraCommRing (M : T.GradedMultiplicative G P) : CommRing T.coalgebra := sorry

/-- The multiplication of `A(T)` as a bilinear map. -/
def Rep.coalgebraMul (_ : T.GradedMultiplicative G P) :
    T.coalgebra →ₗ[R] T.coalgebra →ₗ[R] T.coalgebra := sorry

/-- The ring structure of `A(T)` has multiplication `coalgebraMul`. -/
theorem Rep.coalgebraCommRing_mul (M : T.GradedMultiplicative G P) (a b : T.coalgebra) :
    letI := T.coalgebraCommRing M; a * b = T.coalgebraMul M a b := sorry

/-- For a unital graded multiplicative `T` over a field, `A(T)` is a commutative bialgebra
(HMS Proposition B.16). -/
abbrev Rep.bialgebra (M : T.GradedMultiplicative G P) (_ : M.Unital) :
    letI := T.coalgebraCommRing M; Bialgebra R T.coalgebra := sorry

/-- The tensor structure of `C(D, T)` is that of comodules over the bialgebra `A(T)`: the
coaction of `X ⊗ Y` is the product of the coactions, through the multiplication of `A(T)`
(Tau Ceti's monoidal structure on `FGComoduleCat`, which cannot be named here). -/
theorem category.monoidal_eq_comodules (M : T.GradedMultiplicative G P)
    (X Y : letI := category.monoidal M; category T) :
    letI := category.monoidal M; letI := category.symmetric M
    letI := category.fibre_monoidal M
    ∀ (x : (category.fibre T).obj X) (y : (category.fibre T).obj Y),
      category.coaction T (X ⊗ Y)
          ((Functor.LaxMonoidal.μ (category.fibre T) X Y).hom.hom (x ⊗ₜ y)) =
        TensorProduct.map (Functor.LaxMonoidal.μ (category.fibre T) X Y).hom.hom
            (TensorProduct.lift (T.coalgebraMul M))
          (TensorProduct.tensorTensorTensorComm R _ _ _ _
            (category.coaction T X x ⊗ₜ category.coaction T Y y)) := sorry

end Diagram

/-- Unit test `unit_object`: `T(1)` is free of rank one and `T~(1)` is the unit object of
`C(D, T)` (HMS Remark B.15). -/
example (R : Type) [Field R] (D : Diagram.{0}) (T : D.Rep (FGModuleCat.{0} R)) (G : D.Graded)
    (P : D.ProductStructure G) (M : T.GradedMultiplicative G P) (hM : M.Unital) :
    letI := Diagram.category.monoidal M
    Module.finrank R (T.obj P.unit) = 1 ∧
      Nonempty ((Diagram.category.ofRep T).obj P.unit ≅ 𝟙_ (Diagram.category T)) := sorry

/-- Unit test `swap_sign_odd`: for a vertex `f` of odd degree `T(a_{f,f})` acts on
`T(f) ⊗ T(f)` as minus the swap, and is `-1` when `T(f)` has rank one (HMS Remark B.15). -/
example (R : Type) [Field R] (D : Diagram.{0}) (T : D.Rep (FGModuleCat.{0} R)) (G : D.Graded)
    (P : D.ProductStructure G) (M : T.GradedMultiplicative G P) (f : D.V) (hf : G.deg f = 1) :
    (M.τ f f).inv ≫ T.map (P.swap f f) ≫ (M.τ f f).hom = -(β_ (T.obj f) (T.obj f)).hom ∧
      (Module.finrank R (T.obj f) = 1 → T.map (P.swap f f) = -𝟙 _) := sorry

/-- Unit test `sign_in_first_variable`: the sign must sit in `τ` and in the first variable.
If `τ` satisfies condition (3), the unsigned isomorphisms `τ'_{f,g} = (-1)^{|f||g|} τ_{f,g}`
(for relative singular cohomology, `τ'^{-1}(a ⊗ b) = a × b`) violate (3) for an odd vertex `h`
and an odd edge `b` with `T(h) ◁ T(b) ≠ 0`. -/
example (R : Type) [Field R] [CharZero R] (D : Diagram.{0}) (T : D.Rep (FGModuleCat.{0} R))
    (G : D.Graded) (P : D.ProductStructure G) (M : T.GradedMultiplicative G P) (h : D.V)
    {g g' : D.V} (b : g ⟶ g') (hh : G.deg h = 1) (hb : G.edgeDeg b = 1)
    (hne : T.obj h ◁ T.map b ≠ 0) :
    T.mapPath (P.mulRight h b) ≫ (Diagram.sign R (G.deg h * G.deg g') • (M.τ h g').hom) ≠
      (Diagram.sign R (G.deg h * G.deg g) • (M.τ h g).hom) ≫ (T.obj h ◁ T.map b) := sorry

/-- Unit test `fibre_is_tensor`: `f_T(X ⊗ Y) = f_T(X) ⊗_R f_T(Y)`. -/
example (R : Type) [Field R] (D : Diagram.{0}) (T : D.Rep (FGModuleCat.{0} R)) (G : D.Graded)
    (P : D.ProductStructure G) (M : T.GradedMultiplicative G P) :
    letI := Diagram.category.monoidal M
    ∀ X Y : Diagram.category T, Nonempty ((Diagram.category.fibre T).obj (X ⊗ Y) ≅
      (Diagram.category.fibre T).obj X ⊗ (Diagram.category.fibre T).obj Y) := sorry

/-! ### Localisation at a vertex (MC.5/diagram-localisation) -/

namespace Diagram

variable (D : Diagram.{v}) (mul : D.V → D.V → D.V) (f₀ : D.V)

/-- The edges of the localised diagram: `a(n) : f(n) ⟶ g(n)` for an edge `a : f ⟶ g`, and
`c_{f,n} : (f × f₀)(n) ⟶ f(n + 1)` (HMS Definition B.18). -/
inductive LocEdge : D.V × ℤ → D.V × ℤ → Type v
  | lift {f g : D.V} (a : f ⟶ g) (n : ℤ) : LocEdge (f, n) (g, n)
  | twist (f : D.V) (n : ℤ) : LocEdge (mul f f₀, n) (f, n + 1)

/-- MC.5/diagram-localisation: the localisation of `D` at `f₀`, with vertices `f(n) = (f, n)`.
Only the product of vertices enters the definition. -/
def localise : Diagram.{v} where
  V := D.V × ℤ
  quiver := ⟨LocEdge D mul f₀⟩
  id x := LocEdge.lift (D.id x.1) x.2

/-- The inclusion `D^eff ⟶ D`, `f ↦ f(0)`. -/
def localise.incl : D.Hom (D.localise mul f₀) :=
  ⟨fun f => (f, 0), fun a => LocEdge.lift a 0, fun _ => rfl⟩

/-- The grading of the localised diagram, `|f(n)| = |f|`. -/
def localise.graded (G : D.Graded) : (D.localise mul f₀).Graded := ⟨fun x => G.deg x.1⟩

/-- The tensor powers `X^{⊗ n}` of an object of a monoidal category. -/
def tensorNatPow {C : Type*} [Category C] [MonoidalCategory C] (X : C) : ℕ → C
  | 0 => 𝟙_ C
  | n + 1 => tensorNatPow X n ⊗ X

variable {R : Type u} [Field R]

/-- The integer tensor powers `L^{⊗ n}` of an object of `R`-modules, negative powers being
powers of the dual. -/
def tensorZPow (L : FGModuleCat.{u} R) : ℤ → FGModuleCat.{u} R
  | (n : ℕ) => tensorNatPow L n
  | .negSucc n => tensorNatPow (HasRightDual.rightDual L) (n + 1)

variable {D mul f₀}

/-- Lemma B.21: the extension of `T` to the localised diagram, with `T(f(n)) = T(f) ⊗ T(f₀)^{⊗n}`
and `T(a(n)) = T(a) ⊗ id`, `T(c_{f,n})` given by `τ_{f,f₀}`. It needs `T(f₀)` of rank one. -/
def Rep.extend (T : D.Rep (FGModuleCat.{u} R)) (τ : ∀ f, T.obj (mul f f₀) ≅ T.obj f ⊗ T.obj f₀)
    (_ : Module.finrank R (T.obj f₀) = 1) : (D.localise mul f₀).Rep (FGModuleCat.{u} R) :=
  sorry

variable (T : D.Rep (FGModuleCat.{u} R)) (τ : ∀ f, T.obj (mul f f₀) ≅ T.obj f ⊗ T.obj f₀)
  (hτ : Module.finrank R (T.obj f₀) = 1)

/-- `T(f(n)) = T(f) ⊗ T(f₀)^{⊗n}`. -/
theorem Rep.extend_obj (f : D.V) (n : ℤ) :
    Nonempty ((T.extend τ hτ).obj (f, n) ≅ T.obj f ⊗ tensorZPow (T.obj f₀) n) := sorry

/-- Uniqueness in Lemma B.21: a representation of the localised diagram whose values are
identified with `T(f) ⊗ T(f₀)^{⊗n}` compatibly with the edges `a(n)` (as `T(a) ⊗ id`) and
`c_{f,n}` (through `τ`) is isomorphic to the extension. -/
theorem Rep.extend_unique (T' : (D.localise mul f₀).Rep (FGModuleCat.{u} R))
    (σ : ∀ f n, T'.obj (f, n) ≅ T.obj f ⊗ tensorZPow (T.obj f₀) n)
    (hlift : ∀ {f g : D.V} (a : f ⟶ g) (n : ℤ),
      T'.map (LocEdge.lift a n) ≫ (σ g n).hom = (σ f n).hom ≫ (T.map a ▷ _))
    (succ : ∀ n, tensorZPow (T.obj f₀) n ⊗ T.obj f₀ ≅ tensorZPow (T.obj f₀) (n + 1))
    (htwist : ∀ (f : D.V) (n : ℤ), T'.map (LocEdge.twist f n) ≫ (σ f (n + 1)).hom =
      (σ (mul f f₀) n).hom ≫ ((τ f).hom ▷ _) ≫ (α_ _ _ _).hom ≫ (_ ◁ (β_ _ _).hom) ≫
        (_ ◁ (succ n).hom)) :
    Nonempty (T' ≅ T.extend τ hτ) := sorry

/-- The comparison functor `C(D^eff, T) ⥤ C(D, T)`, the inclusion of the first copy in the
colimit. -/
def localise.categoryIncl : category T ⥤ category (T.extend τ hτ) := sorry

/-- The element `χ ∈ A(T)`, the image of the element of `A({f₀}, T) = End(T(f₀))^∨` dual to the
identity. -/
def Rep.chi (x : D.V) : T.coalgebra := sorry

/-- The localised category: the comparison functor is fully faithful and exact, compatible with
the fibre functors, and every object of `C(D, T)` becomes an object of `C(D^eff, T)` after
tensoring with a power of `T~(f₀)`; this is the colimit of copies of `C(D^eff, T)` along
tensoring with `T~(f₀)`, which Mathlib cannot state as a colimit of categories. -/
theorem localise.category {G : D.Graded} {P : D.ProductStructure G}
    (P' : (D.localise mul f₀).ProductStructure (localise.graded D mul f₀ G))
    (M' : (T.extend τ hτ).GradedMultiplicative _ P') :
    letI := Diagram.category.monoidal M'
    (localise.categoryIncl T τ hτ).Full ∧ (localise.categoryIncl T τ hτ).Faithful ∧
      Nonempty (localise.categoryIncl T τ hτ ⋙ category.fibre _ ≅ category.fibre T) ∧
      ∀ X : Diagram.category (T.extend τ hτ), ∃ (n : ℕ) (Y : Diagram.category T),
        Nonempty (X ⊗ tensorNatPow ((category.ofRep (T.extend τ hτ)).obj (f₀, 0)) n ≅
          (localise.categoryIncl T τ hτ).obj Y) := sorry

/-- `A(D, T)` is the localisation `A^eff_χ` of `A^eff = A(D^eff, T)` at `χ` (HMS Proposition
B.22). -/
theorem localise.coalgebra {G : D.Graded} {P : D.ProductStructure G}
    (M : T.GradedMultiplicative G P)
    (P' : (D.localise mul f₀).ProductStructure (localise.graded D mul f₀ G))
    (M' : (T.extend τ hτ).GradedMultiplicative _ P')
    (φ : letI := T.coalgebraCommRing M; letI := (T.extend τ hτ).coalgebraCommRing M'
      T.coalgebra →+* (T.extend τ hτ).coalgebra) :
    letI := T.coalgebraCommRing M; letI := (T.extend τ hτ).coalgebraCommRing M'
    letI := φ.toAlgebra
    IsLocalization.Away (T.chi f₀) (T.extend τ hτ).coalgebra := sorry

end Diagram

/-- Unit test `rank_one_needed`: if `T(f₀) = R²` there is no `R`-module `L` with
`T(f₀) ⊗ L ≅ R`, so `T(f(-1))` cannot be defined multiplicatively. -/
example (R : Type) [Field R] (L : FGModuleCat.{0} R) :
    IsEmpty (FGModuleCat.of R (Fin 2 → R) ⊗ L ≅ 𝟙_ (FGModuleCat.{0} R)) := sorry

/-- Unit test `uniqueness`: two graded multiplicative extensions of `T` to the localised diagram
that agree on `D^eff` (both identified with `T(f) ⊗ T(f₀)^{⊗ n}` compatibly with the edges) agree
on every `f(n)`. -/
example (R : Type) [Field R] (D : Diagram.{0}) (mul : D.V → D.V → D.V) (f₀ : D.V)
    (T : D.Rep (FGModuleCat.{0} R)) (τ : ∀ f, T.obj (mul f f₀) ≅ T.obj f ⊗ T.obj f₀)
    (hτ : Module.finrank R (T.obj f₀) = 1) (T₁ T₂ : (D.localise mul f₀).Rep (FGModuleCat.{0} R))
    (σ₁ : ∀ f n, T₁.obj (f, n) ≅ T.obj f ⊗ Diagram.tensorZPow (T.obj f₀) n)
    (σ₂ : ∀ f n, T₂.obj (f, n) ≅ T.obj f ⊗ Diagram.tensorZPow (T.obj f₀) n)
    (h₁ : ∀ {f g : D.V} (a : f ⟶ g) (n : ℤ),
      T₁.map (Diagram.LocEdge.lift a n) ≫ (σ₁ g n).hom = (σ₁ f n).hom ≫ (T.map a ▷ _))
    (h₂ : ∀ {f g : D.V} (a : f ⟶ g) (n : ℤ),
      T₂.map (Diagram.LocEdge.lift a n) ≫ (σ₂ g n).hom = (σ₂ f n).hom ≫ (T.map a ▷ _))
    (hc : ∀ (f : D.V) (n : ℤ), T₁.map (Diagram.LocEdge.twist f n) ≫ (σ₁ f (n + 1)).hom =
      (σ₁ (mul f f₀) n).hom ≫ (σ₂ (mul f f₀) n).inv ≫ T₂.map (Diagram.LocEdge.twist f n) ≫
        (σ₂ f (n + 1)).hom) :
    Nonempty (T₁ ≅ T₂) := sorry

/-- Unit test `localisation_of_the_category`: every object of `C(D, T)` is isomorphic to
`X ⊗ T~(f₀)^{⊗ -n}` with `n ≥ 0` and `X` in `C(D^eff, T)`, that is, `X ≅ Y ⊗ T~(f₀(-n))`
with `T~(f₀(-n))` the vertex `(1, -n)`. -/
example (R : Type) [Field R] (D : Diagram.{0}) (mul : D.V → D.V → D.V) (f₀ : D.V)
    (T : D.Rep (FGModuleCat.{0} R)) (τ : ∀ f, T.obj (mul f f₀) ≅ T.obj f ⊗ T.obj f₀)
    (hτ : Module.finrank R (T.obj f₀) = 1) (G : D.Graded) (P : D.ProductStructure G)
    (P' : (D.localise mul f₀).ProductStructure (Diagram.localise.graded D mul f₀ G))
    (M' : (T.extend τ hτ).GradedMultiplicative _ P') :
    letI := Diagram.category.monoidal M'
    ∀ X : Diagram.category (T.extend τ hτ), ∃ (n : ℕ) (Y : Diagram.category T),
      Nonempty (X ≅ (Diagram.localise.categoryIncl T τ hτ).obj Y ⊗
        (Diagram.category.ofRep (T.extend τ hτ)).obj (P.unit, -(n : ℤ))) := sorry

/-- Unit test `unit_vertex_localisation`: for `f₀` the unit vertex, `T(f₀) = R`, `χ = 1` and
`A = A^eff`. -/
example (R : Type) [Field R] (D : Diagram.{0}) (G : D.Graded) (P : D.ProductStructure G)
    (T : D.Rep (FGModuleCat.{0} R)) (M : T.GradedMultiplicative G P) (hM : M.Unital)
    (τ : ∀ f, T.obj (P.mul f P.unit) ≅ T.obj f ⊗ T.obj P.unit)
    (hτ : Module.finrank R (T.obj P.unit) = 1) :
    Module.finrank R (T.obj P.unit) = 1 ∧ (letI := T.coalgebraCommRing M; T.chi P.unit = 1) ∧
      Nonempty ((T.extend τ hτ).coalgebra ≃ₗ[R] T.coalgebra) := sorry

/-! ### Pairs of varieties over `ℚ` (MC.5/effective-pairs-diagram) -/

namespace PairDiagram

open AlgebraicGeometry TopologicalSpace

/-- Varieties over `ℚ`: reduced separated schemes of finite type over `Spec ℚ`. -/
abbrev Var : Type 1 :=
  ObjectProperty.FullSubcategory fun X : Over (Spec (CommRingCat.of ℚ)) =>
    IsReduced X.left ∧ IsSeparated X.hom ∧ LocallyOfFiniteType X.hom ∧ QuasiCompact X.hom

/-- `Spec ℚ`. -/
def Var.pt : Var := ⟨Over.mk (𝟙 _), sorry⟩

/-- The product `X × X'` over `ℚ`. -/
def Var.prod (X X' : Var) : Var :=
  ⟨Over.mk (pullback.fst X.obj.hom X'.obj.hom ≫ X.obj.hom), sorry⟩

/-- The multiplicative group `𝔾_m = Spec ℚ[t, t⁻¹]`. -/
def Var.gm : Var := ⟨Over.mk (Spec.map (CommRingCat.ofHom (algebraMap ℚ (LaurentPolynomial ℚ)))),
  sorry⟩

/-- The closed point `{1}` of `𝔾_m`, the zero locus of `t - 1`. -/
def Var.gmOne : Closeds Var.gm.obj.left :=
  ⟨PrimeSpectrum.zeroLocus {LaurentPolynomial.T 1 - 1}, PrimeSpectrum.isClosed_zeroLocus _⟩

/-- The affine line `𝔸¹ = Spec ℚ[x]`. -/
def Var.affineLine : Var :=
  ⟨Over.mk (Spec.map (CommRingCat.ofHom (algebraMap ℚ (Polynomial ℚ)))), sorry⟩

/-- The closed subset `{0, 1}` of `𝔸¹`, the zero locus of `x(x - 1)`. -/
def Var.affineLineZeroOne : Closeds Var.affineLine.obj.left :=
  ⟨PrimeSpectrum.zeroLocus {Polynomial.X * (Polynomial.X - 1)}, PrimeSpectrum.isClosed_zeroLocus _⟩

attribute [local instance] MvPolynomial.gradedAlgebra in
/-- Projective space `ℙᴺ_ℚ`. -/
def Var.projectiveSpace (N : ℕ) : Var :=
  ⟨Over.mk (Proj.toSpecZero (MvPolynomial.homogeneousSubmodule (Fin (N + 1)) ℚ) ≫
    Spec.map (CommRingCat.ofHom (algebraMap ℚ _))), sorry⟩

/-- The image of a closed subset under a closed immersion. -/
def closedImage {V X : Var} (ι : V ⟶ X) (Z : Closeds V.obj.left) : Closeds X.obj.left :=
  ⟨ι.hom.left '' Z, sorry⟩

/-- A vertex `(X, Y, i)` of the diagram of effective pairs: a variety, a closed subvariety
(a closed subset, the subvariety carrying its reduced structure) and an integer. -/
structure Vertex where
  /-- The variety. -/
  X : Var
  /-- The closed subvariety. -/
  Y : Closeds X.obj.left
  /-- The degree. -/
  i : ℤ

/-- The edges of `D^eff`: for `f : X ⟶ X'` with `f(Y) ⊆ Y'` a functoriality edge
`(X', Y', i) ⟶ (X, Y, i)`, and for `X ⊇ Y ⊇ Z` (with `Y` the image of a closed immersion
`ι : V ⟶ X` and `Z` closed in `V`) a coboundary edge `(Y, Z, i) ⟶ (X, Y, i + 1)`. -/
inductive Edge : Vertex → Vertex → Type 1
  | pullback {X X' : Var} {Y : Closeds X.obj.left} {Y' : Closeds X'.obj.left} (f : X ⟶ X')
      (hf : Set.MapsTo f.hom.left Y Y') (i : ℤ) : Edge ⟨X', Y', i⟩ ⟨X, Y, i⟩
  | coboundary {X V : Var} (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left)
      (Z : Closeds V.obj.left) (i : ℤ) : Edge ⟨V, Z, i⟩ ⟨X, closedImage ι ⊤, i + 1⟩

instance : Quiver Vertex := ⟨Edge⟩

/-- MC.5/effective-pairs-diagram: the diagram `D^eff` of effective pairs. -/
def eff : Diagram.{1} where
  V := Vertex
  quiver := inferInstance
  id v := @Edge.pullback v.X v.X v.Y v.Y (𝟙 v.X) sorry v.i

/-- The grading of `D^eff` by the parity of `i`. -/
def grading : eff.Graded := ⟨fun v : Vertex => (v.i : ZMod 2)⟩

/-- The product of vertices `(X, Y, i) × (X', Y', i') = (X × X', X × Y' ∪ Y × X', i + i')`. -/
def vertexProduct (a b : Vertex) : Vertex :=
  ⟨a.X.prod b.X, ⟨(pullback.snd a.X.obj.hom b.X.obj.hom ⁻¹' b.Y) ∪
    (pullback.fst a.X.obj.hom b.X.obj.hom ⁻¹' a.Y), sorry⟩, a.i + b.i⟩

/-- The vertex `(𝔾_m, {1}, 1)`. -/
def gmVertex : Vertex := ⟨Var.gm, Var.gmOne, 1⟩

/-- The vertex `(Spec ℚ, ∅, 0)`, the unit. -/
def ptVertex : Vertex := ⟨Var.pt, ⊥, 0⟩

/-- The diagram `D` of pairs, the localisation of `D^eff` at `(𝔾_m, {1}, 1)`. -/
def pairs : Diagram.{1} := eff.localise vertexProduct gmVertex

/-- The localisation at `(𝔾_m, {1}, 1)` of a full subdiagram of `D^eff` stable under the product
of vertices and containing `(𝔾_m, {1}, 1)` (applied to good and very good pairs). -/
def localised (P : Vertex → Prop) (hP : ∀ a b, P a → P b → P (vertexProduct a b))
    (h0 : P gmVertex) : Diagram.{1} :=
  (eff.fullSubdiagram P).localise (fun a b => ⟨vertexProduct a.1 b.1, hP _ _ a.2 b.2⟩)
    ⟨gmVertex, h0⟩

/-- SchemeAndStackFoundations SF.2 with the pinned Tau Ceti library: relative singular homology
`H_j(X(ℂ), Y(ℂ); ℚ)` of the complex points of a pair (Tau Ceti's `TopPair.singularHomology`
and `TauCeti.TopTriple.singularHomologyδ` applied to SF.2's functor `X ↦ X(ℂ)`, not importable
here), with its finite-dimensionality and the relative Künneth isomorphism requested from
SF.2. -/
structure PairHomology where
  /-- `H_j(X(ℂ), Y(ℂ); ℚ)`. -/
  H : ∀ (X : Var) (_ : Closeds X.obj.left), ℤ → Type
  [addCommGroup : ∀ X Y j, AddCommGroup (H X Y j)]
  [module : ∀ X Y j, Module ℚ (H X Y j)]
  /-- Finite-dimensionality (SF.2). -/
  [finiteDimensional : ∀ X Y j, FiniteDimensional ℚ (H X Y j)]
  /-- Pushforward along a map of pairs. -/
  pushforward : ∀ {X X' : Var} {Y : Closeds X.obj.left} {Y' : Closeds X'.obj.left} (f : X ⟶ X'),
    Set.MapsTo f.hom.left Y Y' → ∀ j, H X Y j →ₗ[ℚ] H X' Y' j
  pushforward_id : ∀ (X : Var) (Y : Closeds X.obj.left) (h : Set.MapsTo (𝟙 X : X ⟶ X).hom.left Y Y)
    (j : ℤ), pushforward (𝟙 X) h j = LinearMap.id
  pushforward_comp : ∀ {X X' X'' : Var} {Y : Closeds X.obj.left} {Y' : Closeds X'.obj.left}
    {Y'' : Closeds X''.obj.left} (f : X ⟶ X') (g : X' ⟶ X'') (hf : Set.MapsTo f.hom.left Y Y')
    (hg : Set.MapsTo g.hom.left Y' Y'') (hfg : Set.MapsTo (f ≫ g).hom.left Y Y'') (j : ℤ),
    pushforward (f ≫ g) hfg j = pushforward g hg j ∘ₗ pushforward f hf j
  /-- The boundary `∂ : H_{j+1}(X, Y) ⟶ H_j(Y, Z)` of the triple `X ⊇ Y ⊇ Z`. -/
  boundary : ∀ {X V : Var} (ι : V ⟶ X), IsClosedImmersion ι.hom.left →
    ∀ (Z : Closeds V.obj.left) (j : ℤ), H X (closedImage ι ⊤) (j + 1) →ₗ[ℚ] H V Z j
  /-- The long exact sequence of a triple (Tau Ceti, for homology). -/
  exact_triple : ∀ {X V : Var} (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left)
    (Z : Closeds V.obj.left) (j : ℤ) (h₁ : Set.MapsTo ι.hom.left Z (closedImage ι Z))
    (h₂ : Set.MapsTo (𝟙 X : X ⟶ X).hom.left (closedImage ι Z) (closedImage ι ⊤)),
    Function.Exact (pushforward ι h₁ (j + 1)) (pushforward (𝟙 X) h₂ (j + 1)) ∧
      Function.Exact (pushforward (𝟙 X) h₂ (j + 1)) (boundary ι hι Z j) ∧
      Function.Exact (boundary ι hι Z j) (pushforward ι h₁ j)
  /-- Naturality of the boundary for maps of triples (Tau Ceti). -/
  boundary_natural : ∀ {X V X' V' : Var} (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left)
    (ι' : V' ⟶ X') (hι' : IsClosedImmersion ι'.hom.left) (f : X ⟶ X') (g : V ⟶ V')
    (_ : g ≫ ι' = ι ≫ f) (Z : Closeds V.obj.left) (Z' : Closeds V'.obj.left)
    (hf : Set.MapsTo f.hom.left (closedImage ι ⊤) (closedImage ι' ⊤))
    (hg : Set.MapsTo g.hom.left Z Z') (j : ℤ),
    boundary ι' hι' Z' j ∘ₗ pushforward f hf (j + 1) = pushforward g hg j ∘ₗ boundary ι hι Z j
  /-- The relative Künneth isomorphism when the second pair is good (SF.2). -/
  kunneth : ∀ a b : Vertex, (∀ j ≠ b.i, Subsingleton (H b.X b.Y j)) →
    (H (vertexProduct a b).X (vertexProduct a b).Y (a.i + b.i) ≃ₗ[ℚ]
      H a.X a.Y a.i ⊗[ℚ] H b.X b.Y b.i)

attribute [instance] PairHomology.addCommGroup PairHomology.module PairHomology.finiteDimensional

end PairDiagram

/-! ### Relative singular cohomology (MC.5/singular-cohomology-representation) -/

open AlgebraicGeometry TopologicalSpace PairDiagram in
/-- The edge maps of `H^*`: transposed pushforward and transposed boundary. -/
def singularRepMap (Hs : PairHomology) : ∀ {x y : Vertex}, Edge x y →
    (FGModuleCat.of ℚ (Module.Dual ℚ (Hs.H x.X x.Y x.i)) ⟶
      FGModuleCat.of ℚ (Module.Dual ℚ (Hs.H y.X y.Y y.i)))
  | _, _, .pullback f hf i => FGModuleCat.ofHom (Hs.pushforward f hf i).dualMap
  | _, _, .coboundary ι hι Z i => FGModuleCat.ofHom (Hs.boundary ι hι Z i).dualMap

open AlgebraicGeometry TopologicalSpace PairDiagram in
/-- MC.5/singular-cohomology-representation: `H^*` on `D^eff`, with
`H^*(X, Y, i) = H^i(X(ℂ), Y(ℂ); ℚ)`, the `ℚ`-dual of relative singular homology; functoriality
edges go to the transposed pushforward and coboundary edges to the transposed boundary. -/
def singularRep (Hs : PairHomology) : eff.Rep (FGModuleCat.{0} ℚ) where
  obj v := FGModuleCat.of ℚ (Module.Dual ℚ (Hs.H v.X v.Y v.i))
  map e := singularRepMap Hs e
  map_loop := sorry

section SingularRepAPI

open AlgebraicGeometry TopologicalSpace PairDiagram

variable (Hs : PairHomology)

/-- `H^*(X, Y, i) = H^i(X(ℂ), Y(ℂ); ℚ)`. -/
theorem singularRep_obj (X : Var) (Y : Closeds X.obj.left) (i : ℤ) :
    (singularRep Hs).obj ⟨X, Y, i⟩ = FGModuleCat.of ℚ (Module.Dual ℚ (Hs.H X Y i)) := rfl

/-- A functoriality edge goes to the pullback along the map of pairs. -/
theorem singularRep_functoriality {X X' : Var} {Y : Closeds X.obj.left}
    {Y' : Closeds X'.obj.left} (f : X ⟶ X') (hf : Set.MapsTo f.hom.left Y Y') (i : ℤ) :
    (singularRep Hs).map (show (⟨X', Y', i⟩ : eff.V) ⟶ ⟨X, Y, i⟩ from Edge.pullback f hf i) =
      FGModuleCat.ofHom (Hs.pushforward f hf i).dualMap := rfl

/-- A coboundary edge goes to the connecting map of the triple. -/
theorem singularRep_coboundary {X V : Var} (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left)
    (Z : Closeds V.obj.left) (i : ℤ) :
    (singularRep Hs).map (show (⟨V, Z, i⟩ : eff.V) ⟶ ⟨X, closedImage ι ⊤, i + 1⟩ from
      Edge.coboundary ι hι Z i) = FGModuleCat.ofHom (Hs.boundary ι hι Z i).dualMap := rfl

/-- The long exact cohomology sequence of a triple `X ⊇ Y ⊇ Z` is exact:
`H^i(X, Y) ⟶ H^i(X, Z) ⟶ H^i(Y, Z) ⟶ H^{i+1}(X, Y)`. -/
theorem singularRep_exact_triple {X V : Var} (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left)
    (Z : Closeds V.obj.left) (i : ℤ) (h₁ : Set.MapsTo ι.hom.left Z (closedImage ι Z))
    (h₂ : Set.MapsTo (𝟙 X : X ⟶ X).hom.left (closedImage ι Z) (closedImage ι ⊤)) :
    Function.Exact ((singularRep Hs).linMap
        (show (⟨X, closedImage ι ⊤, i⟩ : eff.V) ⟶ ⟨X, closedImage ι Z, i⟩ from
          Edge.pullback (𝟙 X) h₂ i))
      ((singularRep Hs).linMap
        (show (⟨X, closedImage ι Z, i⟩ : eff.V) ⟶ ⟨V, Z, i⟩ from Edge.pullback ι h₁ i)) ∧
    Function.Exact ((singularRep Hs).linMap
        (show (⟨X, closedImage ι Z, i⟩ : eff.V) ⟶ ⟨V, Z, i⟩ from Edge.pullback ι h₁ i))
      ((singularRep Hs).linMap
        (show (⟨V, Z, i⟩ : eff.V) ⟶ ⟨X, closedImage ι ⊤, i + 1⟩ from Edge.coboundary ι hι Z i)) :=
  sorry

/-- The connecting map is natural for morphisms of triples. -/
theorem singularRep_coboundary_natural {X V X' V' : Var} (ι : V ⟶ X)
    (hι : IsClosedImmersion ι.hom.left) (ι' : V' ⟶ X') (hι' : IsClosedImmersion ι'.hom.left)
    (f : X ⟶ X') (g : V ⟶ V') (hfg : g ≫ ι' = ι ≫ f) (Z : Closeds V.obj.left)
    (Z' : Closeds V'.obj.left) (hf : Set.MapsTo f.hom.left (closedImage ι ⊤) (closedImage ι' ⊤))
    (hg : Set.MapsTo g.hom.left Z Z') (i : ℤ) :
    (singularRep Hs).map (show (⟨V', Z', i⟩ : eff.V) ⟶ ⟨V, Z, i⟩ from Edge.pullback g hg i) ≫
        (singularRep Hs).map (show (⟨V, Z, i⟩ : eff.V) ⟶ ⟨X, closedImage ι ⊤, i + 1⟩ from
          Edge.coboundary ι hι Z i) =
      (singularRep Hs).map (show (⟨V', Z', i⟩ : eff.V) ⟶ ⟨X', closedImage ι' ⊤, i + 1⟩ from
          Edge.coboundary ι' hι' Z' i) ≫
        (singularRep Hs).map (show (⟨X', closedImage ι' ⊤, i + 1⟩ : eff.V) ⟶
          ⟨X, closedImage ι ⊤, i + 1⟩ from Edge.pullback f hf (i + 1)) := sorry

/-- `H^*(𝔾_m, {1}, 1) = ℚ`. -/
theorem singularRep_gm : Module.finrank ℚ ((singularRep Hs).obj gmVertex) = 1 := sorry

/-- `H^i(X(ℂ), Y(ℂ); ℚ)` is the dual of relative singular homology of the pair. -/
def singularRep_eq_dual_homology (v : Vertex) :
    (singularRep Hs).obj v ≃ₗ[ℚ] Module.Dual ℚ (Hs.H v.X v.Y v.i) := LinearEquiv.refl ℚ _

end SingularRepAPI

namespace PairDiagram

open AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology)

/-- A good pair: `H^j(X(ℂ), Y(ℂ); ℚ) = 0` for `j ≠ i`. -/
def IsGood (v : Vertex) : Prop := ∀ j ≠ v.i, IsZero ((singularRep Hs).obj ⟨v.X, v.Y, j⟩)

/-- `(X, Y, i)` is good exactly when `H^j(X(ℂ), Y(ℂ); ℚ)` vanishes for `j ≠ i`. -/
theorem good_iff (v : Vertex) :
    IsGood Hs v ↔ ∀ j ≠ v.i, Subsingleton (Module.Dual ℚ (Hs.H v.X v.Y j)) := sorry

/-- The full subdiagram `D^eff_Nori` of effective good pairs. -/
def good : Diagram.{1} := eff.fullSubdiagram (IsGood Hs)

/-- A very good pair: good, `X` affine, `X - Y` smooth, and either `dim X = i` and
`dim Y = i - 1`, or `X = Y` of dimension less than `i`. -/
def IsVeryGood (v : Vertex) : Prop :=
  IsGood Hs v ∧ IsAffine v.X.obj.left ∧
    Smooth (Scheme.Opens.ι (X := v.X.obj.left) v.Y.compl ≫ v.X.obj.hom) ∧
    ((∃ n : ℕ, v.i = n + 1 ∧ topologicalKrullDim v.X.obj.left = ((n + 1 : ℕ) : WithBot ℕ∞) ∧
        topologicalKrullDim (v.Y : Set v.X.obj.left) = ((n : ℕ) : WithBot ℕ∞)) ∨
      (v.Y = ⊤ ∧ ∃ n : ℕ, v.i = n ∧ topologicalKrullDim v.X.obj.left < ((n : ℕ) : WithBot ℕ∞)))

/-- The full subdiagram of effective very good pairs. -/
def veryGood : Diagram.{1} := eff.fullSubdiagram (IsVeryGood Hs)

/-- The inclusion of very good pairs into good pairs. -/
def veryGoodToGood : (veryGood Hs).Hom (good Hs) :=
  ⟨fun v => ⟨v.1, v.2.1⟩, fun e => e, fun _ => rfl⟩

/-- The product of good pairs is good, and of very good pairs very good. -/
theorem vertexProduct_good (a b : Vertex) :
    (IsGood Hs a → IsGood Hs b → IsGood Hs (vertexProduct a b)) ∧
      (IsVeryGood Hs a → IsVeryGood Hs b → IsVeryGood Hs (vertexProduct a b)) := sorry

/-- `(𝔾_m, {1}, 1)` is good. -/
theorem gmVertex_good : IsGood Hs gmVertex := sorry

/-- `(Spec ℚ, ∅, 0)` is good. -/
theorem ptVertex_good : IsGood Hs ptVertex := sorry

end PairDiagram

/-- Unit test `gm_is_good`: `(𝔾_m, {1}, 1)` is good: `H^j(ℂ^*, {1}; ℚ)` is `ℚ` for `j = 1` and
`0` otherwise. -/
example (Hs : PairDiagram.PairHomology) :
    PairDiagram.IsGood Hs PairDiagram.gmVertex ∧
      Module.finrank ℚ ((singularRep Hs).obj PairDiagram.gmVertex) = 1 := sorry

/-- Unit test `degree_matters`: `(𝔾_m, {1}, 0)` is not a good pair, since
`H^1(ℂ^*, {1}; ℚ) ≠ 0`. -/
example (Hs : PairDiagram.PairHomology) :
    ¬ PairDiagram.IsGood Hs ⟨PairDiagram.Var.gm, PairDiagram.Var.gmOne, 0⟩ := sorry

/-- Unit test `coboundary_raises_degree`: a coboundary edge goes from degree `i` to degree
`i + 1` and has odd parity. -/
example {X V : PairDiagram.Var} (ι : V ⟶ X) (hι : AlgebraicGeometry.IsClosedImmersion ι.hom.left)
    (Z : TopologicalSpace.Closeds V.obj.left) (i : ℤ) :
    PairDiagram.grading.edgeDeg (show (⟨V, Z, i⟩ : PairDiagram.eff.V) ⟶
      ⟨X, PairDiagram.closedImage ι ⊤, i + 1⟩ from PairDiagram.Edge.coboundary ι hι Z i) = 1 :=
  sorry

/-- Unit test `very_good_example`: `(𝔸¹, {0, 1}, 1)` is very good. -/
example (Hs : PairDiagram.PairHomology) :
    PairDiagram.IsVeryGood Hs ⟨PairDiagram.Var.affineLine, PairDiagram.Var.affineLineZeroOne, 1⟩ :=
  sorry

/-- Unit test `gm_pair`: `H^*(ℂ^*, {1}; ℚ)` is `ℚ` in degree `1` and `0` otherwise, so
`(𝔾_m, {1}, 1)` goes to `ℚ`. -/
example (Hs : PairDiagram.PairHomology) :
    Module.finrank ℚ ((singularRep Hs).obj ⟨PairDiagram.Var.gm, PairDiagram.Var.gmOne, 1⟩) = 1 ∧
      ∀ j ≠ 1, IsZero ((singularRep Hs).obj ⟨PairDiagram.Var.gm, PairDiagram.Var.gmOne, j⟩) :=
  sorry

/-- Unit test `trivial_pairs`: `(Spec ℚ, ∅, 0)` goes to `ℚ` and `(X, X, i)` goes to `0`. -/
example (Hs : PairDiagram.PairHomology) :
    Module.finrank ℚ ((singularRep Hs).obj PairDiagram.ptVertex) = 1 ∧
      ∀ (X : PairDiagram.Var) (i : ℤ), IsZero ((singularRep Hs).obj ⟨X, ⊤, i⟩) := sorry

/-- Unit test `triple_exactness`: in the sequence of a triple `X ⊇ Y ⊇ Z` with
`H^0(X, Z) = H^1(X, Z) = 0` (as for `ℙ¹ ⊇ {0, ∞} ⊇ {0}`), the coboundary edge
`H^0(Y, Z) ⟶ H^1(X, Y)` goes to an isomorphism. The projective line and its two points are not
constructed here, so the test is stated for any triple with these vanishings. -/
example (Hs : PairDiagram.PairHomology) {X V : PairDiagram.Var} (ι : V ⟶ X)
    (hι : AlgebraicGeometry.IsClosedImmersion ι.hom.left)
    (Z : TopologicalSpace.Closeds V.obj.left)
    (h0 : IsZero ((singularRep Hs).obj ⟨X, PairDiagram.closedImage ι Z, 0⟩))
    (h1 : IsZero ((singularRep Hs).obj ⟨X, PairDiagram.closedImage ι Z, 1⟩)) :
    IsIso ((singularRep Hs).map (show (⟨V, Z, 0⟩ : PairDiagram.eff.V) ⟶
      ⟨X, PairDiagram.closedImage ι ⊤, 0 + 1⟩ from PairDiagram.Edge.coboundary ι hι Z 0)) :=
  sorry

/-- Unit test `coboundary_not_zero`: when `H^0(Y, Z) ≠ 0` and `H^0(X, Z) = 0` (as for
`ℙ¹ ⊇ {0, ∞} ⊇ {0}`), the coboundary edge does not go to `0`: a representation sending every
coboundary edge to `0` would break exactness at `H^0(Y, Z)`. -/
example (Hs : PairDiagram.PairHomology) {X V : PairDiagram.Var} (ι : V ⟶ X)
    (hι : AlgebraicGeometry.IsClosedImmersion ι.hom.left)
    (Z : TopologicalSpace.Closeds V.obj.left)
    (hY : ¬ IsZero ((singularRep Hs).obj ⟨V, Z, 0⟩))
    (h0 : IsZero ((singularRep Hs).obj ⟨X, PairDiagram.closedImage ι Z, 0⟩)) :
    (singularRep Hs).map (show (⟨V, Z, 0⟩ : PairDiagram.eff.V) ⟶
      ⟨X, PairDiagram.closedImage ι ⊤, 0 + 1⟩ from PairDiagram.Edge.coboundary ι hι Z 0) ≠ 0 :=
  sorry

/-! ### The realisation functor (MC.5/cellular-realisation-functor) -/

namespace PairDiagram

open AlgebraicGeometry TopologicalSpace Pretriangulated.Opposite

/-- Varieties with formal `ℤ`-linear combinations of morphisms, made additive: `ℤ[Var]`. -/
abbrev ZVar : Type 1 := Mat_ (Free ℤ Var)

instance : HasBinaryBiproducts ZVar := hasBinaryBiproducts_of_finite_biproducts _

/-- `X ↦ [X]`. -/
def toZVar : Var ⥤ ZVar := Free.embedding ℤ Var ⋙ Mat_.embedding (Free ℤ Var)

/-- The complex `[X]` concentrated in degree `0`. -/
def cplx (X : Var) : HomotopyCategory ZVar (ComplexShape.up ℤ) :=
  (HomotopyCategory.quotient _ _).obj
    ((HomologicalComplex.single ZVar (ComplexShape.up ℤ) 0).obj (toZVar.obj X))

/-- The cone of `[f] : [V] ⟶ [X]`, for instance `Cone(Y ⟶ X)`. -/
def coneOf {V X : Var} (f : V ⟶ X) : HomotopyCategory ZVar (ComplexShape.up ℤ) :=
  (HomotopyCategory.quotient _ _).obj (CochainComplex.mappingCone
    ((HomologicalComplex.single ZVar (ComplexShape.up ℤ) 0).map (toZVar.map f)))

/-- The Čech complex of a finite affine open cover (HMS D.10), with its augmentation from
`[X]`; the rigidification of HMS D.5-D.9 is not modelled. -/
def cechComplex {X : Var} (𝒰 : X.obj.left.OpenCover) [Finite 𝒰.I₀] :
    HomotopyCategory ZVar (ComplexShape.up ℤ) := sorry

/-- The augmentation `[X] ⟶ Č(𝒰)`. -/
def cechAugmentation {X : Var} (𝒰 : X.obj.left.OpenCover) [Finite 𝒰.I₀] :
    cplx X ⟶ cechComplex 𝒰 := sorry

end PairDiagram

section CellularRealisation

open AlgebraicGeometry TopologicalSpace PairDiagram Pretriangulated.Opposite

variable (Hs : PairHomology) {A : Type*} [Category A] [Abelian A] [Linear ℚ A]
  [HasDerivedCategory A] (fA : A ⥤ FGModuleCat.{0} ℚ) [fA.Additive] [fA.Faithful]
  [PreservesFiniteLimits fA] [PreservesFiniteColimits fA] (T : (veryGood Hs).Rep A)

/-- MC.5/cellular-realisation-functor: the contravariant triangulated functor
`R : C^b(ℤ[Var]) ⟶ D^b(A)` of HMS Proposition D.3, here on the homotopy category of all
cochain complexes over `ℤ[Var]` with values in `D(A)` (boundedness not recorded). -/
def cellularRealisation (Hs : PairHomology) {A : Type*} [Category A] [Abelian A] [Linear ℚ A]
    [HasDerivedCategory A] (fA : A ⥤ FGModuleCat.{0} ℚ) [fA.Additive] [fA.Faithful]
    [PreservesFiniteLimits fA] [PreservesFiniteColimits fA] (T : (veryGood Hs).Rep A) :
    (HomotopyCategory ZVar (ComplexShape.up ℤ))ᵒᵖ ⥤ DerivedCategory A :=
  sorry

instance : (cellularRealisation Hs fA T).CommShift ℤ := sorry

/-- `R` is a triangulated functor, `C^b(ℤ[Var])ᵒᵖ` carrying the opposite triangulation. -/
instance cellularRealisation_triangulated : (cellularRealisation Hs fA T).IsTriangulated :=
  sorry

/-- For a good pair `(X, Y, i)` with `Y` the image of a closed immersion `ι : V ⟶ X`,
`H^j(R(Cone(V ⟶ X)))` vanishes for `j ≠ i`, and equals `T(X, Y, i)` for a very good pair. -/
theorem cellularRealisation_cone_good {X V : Var} (ι : V ⟶ X) (i : ℤ)
    (hgood : IsGood Hs ⟨X, closedImage ι ⊤, i⟩) :
    (∀ j ≠ i, IsZero ((DerivedCategory.homologyFunctor A j).obj
      ((cellularRealisation Hs fA T).obj (Opposite.op (coneOf ι))))) ∧
    ∀ hvg : IsVeryGood Hs ⟨X, closedImage ι ⊤, i⟩,
      Nonempty ((DerivedCategory.homologyFunctor A i).obj
        ((cellularRealisation Hs fA T).obj (Opposite.op (coneOf ι))) ≅ T.obj ⟨_, hvg⟩) := sorry

/-- Čech descent (HMS Corollary D.19): `R(X) ⟶ R(Č(𝒰))` is an isomorphism. -/
theorem cellularRealisation_cech {X : Var} (𝒰 : X.obj.left.OpenCover) [Finite 𝒰.I₀]
    (h𝒰 : ∀ i, IsAffine (𝒰.X i)) :
    IsIso ((cellularRealisation Hs fA T).map (cechAugmentation 𝒰).op) := sorry

/-- The composite with `D(A) ⥤ D(ℚ-Mod)` computes singular cohomology of `X(ℂ)`. -/
theorem cellularRealisation_forget [HasDerivedCategory (FGModuleCat.{0} ℚ)] (X : Var) (j : ℤ) :
    Nonempty ((DerivedCategory.homologyFunctor (FGModuleCat.{0} ℚ) j).obj
      (fA.mapDerivedCategory.obj ((cellularRealisation Hs fA T).obj (Opposite.op (cplx X)))) ≅
      (singularRep Hs).obj ⟨X, ⊥, j⟩) := sorry

/-- The morphism `R(f) : R([X']) ⟶ R([X])` attached to a morphism of varieties `f : X ⟶ X'`. -/
def cellularRealisation_map {X X' : Var} (f : X ⟶ X') :
    (cellularRealisation Hs fA T).obj (Opposite.op (cplx X')) ⟶
      (cellularRealisation Hs fA T).obj (Opposite.op (cplx X)) :=
  (cellularRealisation Hs fA T).map
    ((HomotopyCategory.quotient _ _).map
      ((HomologicalComplex.single ZVar (ComplexShape.up ℤ) 0).map (toZVar.map f))).op

/-- `R` on morphisms of varieties preserves identities and composites (contravariantly). -/
theorem cellularRealisation_map_comp {X X' X'' : Var} (f : X ⟶ X') (g : X' ⟶ X'') :
    cellularRealisation_map Hs fA T (f ≫ g) =
      cellularRealisation_map Hs fA T g ≫ cellularRealisation_map Hs fA T f ∧
    cellularRealisation_map Hs fA T (𝟙 X) = 𝟙 _ := sorry

end CellularRealisation

/-- Unit test `point`: `R(Spec ℚ)` is `T(Spec ℚ, ∅, 0)` placed in degree `0`. -/
example (Hs : PairDiagram.PairHomology) {A : Type*} [Category A] [Abelian A] [Linear ℚ A]
    [HasDerivedCategory A] (fA : A ⥤ FGModuleCat.{0} ℚ) [fA.Additive] [fA.Faithful]
    [PreservesFiniteLimits fA] [PreservesFiniteColimits fA]
    (T : (PairDiagram.veryGood Hs).Rep A)
    (h : PairDiagram.IsVeryGood Hs PairDiagram.ptVertex) :
    Nonempty ((cellularRealisation Hs fA T).obj
      (Opposite.op (PairDiagram.cplx PairDiagram.Var.pt)) ≅
        (DerivedCategory.singleFunctor A 0).obj (T.obj ⟨_, h⟩)) := sorry

/-- Unit test `affine_line`: with the very good filtration `∅ ⊆ {0} ⊆ 𝔸¹`, `R(𝔸¹)` is
`ℚ ⟶ 0`: `H^0` has fibre `ℚ` and `H^j = 0` otherwise, as for singular cohomology of `ℂ`. -/
example (Hs : PairDiagram.PairHomology) {A : Type*} [Category A] [Abelian A] [Linear ℚ A]
    [HasDerivedCategory A] (fA : A ⥤ FGModuleCat.{0} ℚ) [fA.Additive] [fA.Faithful]
    [PreservesFiniteLimits fA] [PreservesFiniteColimits fA]
    (T : (PairDiagram.veryGood Hs).Rep A) :
    Module.finrank ℚ (fA.obj ((DerivedCategory.homologyFunctor A 0).obj
        ((cellularRealisation Hs fA T).obj
          (Opposite.op (PairDiagram.cplx PairDiagram.Var.affineLine))))) = 1 ∧
      ∀ j ≠ (0 : ℤ), IsZero ((DerivedCategory.homologyFunctor A j).obj
        ((cellularRealisation Hs fA T).obj
          (Opposite.op (PairDiagram.cplx PairDiagram.Var.affineLine)))) := sorry

/-- Unit test `projective_line_cech`: by Corollary D.19 for the standard cover of `ℙ¹`,
`H^2(R(ℙ¹)) ≅ H^1(R(𝔾_m))`. -/
example (Hs : PairDiagram.PairHomology) {A : Type*} [Category A] [Abelian A] [Linear ℚ A]
    [HasDerivedCategory A] (fA : A ⥤ FGModuleCat.{0} ℚ) [fA.Additive] [fA.Faithful]
    [PreservesFiniteLimits fA] [PreservesFiniteColimits fA]
    (T : (PairDiagram.veryGood Hs).Rep A) :
    Nonempty ((DerivedCategory.homologyFunctor A 2).obj
        ((cellularRealisation Hs fA T).obj
          (Opposite.op (PairDiagram.cplx (PairDiagram.Var.projectiveSpace 1)))) ≅
      (DerivedCategory.homologyFunctor A 1).obj
        ((cellularRealisation Hs fA T).obj
          (Opposite.op (PairDiagram.cplx PairDiagram.Var.gm)))) := sorry

/-- Unit test `cone_good_pair`: for the good pair `(𝔾_m, {1}, 1)`, with `e : Spec ℚ ⟶ 𝔾_m` the
point `1`, `H^j(R(Cone({1} ⟶ 𝔾_m)))` vanishes for `j ≠ 1` and has fibre `ℚ` for `j = 1`. -/
example (Hs : PairDiagram.PairHomology) {A : Type*} [Category A] [Abelian A] [Linear ℚ A]
    [HasDerivedCategory A] (fA : A ⥤ FGModuleCat.{0} ℚ) [fA.Additive] [fA.Faithful]
    [PreservesFiniteLimits fA] [PreservesFiniteColimits fA]
    (T : (PairDiagram.veryGood Hs).Rep A) (e : PairDiagram.Var.pt ⟶ PairDiagram.Var.gm)
    (he : PairDiagram.closedImage e ⊤ = PairDiagram.Var.gmOne) :
    (∀ j ≠ (1 : ℤ), IsZero ((DerivedCategory.homologyFunctor A j).obj
      ((cellularRealisation Hs fA T).obj (Opposite.op (PairDiagram.coneOf e))))) ∧
    Module.finrank ℚ (fA.obj ((DerivedCategory.homologyFunctor A 1).obj
      ((cellularRealisation Hs fA T).obj (Opposite.op (PairDiagram.coneOf e))))) = 1 :=
  sorry

/-! ### Nori motives (MC.5/nori-motives) -/

namespace PairDiagram

open AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology)

/-- `H^*` restricted to the effective good pairs. -/
def goodRep : (good Hs).Rep (FGModuleCat.{0} ℚ) :=
  (singularRep Hs).restrict (Diagram.fullSubdiagram.incl eff (IsGood Hs))

/-- The product of good pairs, as a product on the vertices of `D^eff_Nori`. -/
def goodMul (a b : (good Hs).V) : (good Hs).V :=
  ⟨vertexProduct a.1 b.1, ((vertexProduct_good Hs a.1 b.1).1 a.2 b.2)⟩

/-- The vertex `(𝔾_m, {1}, 1)` of `D^eff_Nori`. -/
def goodGm : (good Hs).V := ⟨gmVertex, gmVertex_good Hs⟩

/-- The relative Künneth isomorphism `H^*(f × (𝔾_m, {1}, 1)) ≅ H^*(f) ⊗ H^*(𝔾_m, {1}, 1)`, the
dual of `PairHomology.kunneth`. -/
def goodKunneth (f : (good Hs).V) :
    (goodRep Hs).obj (goodMul Hs f (goodGm Hs)) ≅ (goodRep Hs).obj f ⊗ (goodRep Hs).obj (goodGm Hs) :=
  sorry

/-- `H^*` extended to the localised diagram `D_Nori` by Lemma B.21, using
`H^1(𝔾_m(ℂ), {1}; ℚ) = ℚ`. -/
def noriRep : ((good Hs).localise (goodMul Hs) (goodGm Hs)).Rep (FGModuleCat.{0} ℚ) :=
  Diagram.Rep.extend (goodRep Hs) (goodKunneth Hs) (singularRep_gm Hs)

end PairDiagram

open PairDiagram in
/-- MC.5/nori-motives: the category `MM_Nori` of mixed Nori motives, the diagram category of the
localised diagram of good pairs with respect to `H^*`. -/
abbrev NoriMotives (Hs : PairHomology) : Type 2 := Diagram.category (noriRep Hs)

namespace NoriMotives

open PairDiagram AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology)

/-- The category `MM^eff_Nori` of effective mixed Nori motives, `C(D^eff_Nori, H^*)`. -/
abbrev eff : Type 2 := Diagram.category (goodRep Hs)

/-- `H^i_Nori(X, Y)` for a good pair `(X, Y, i)`. -/
def ofGoodPair (v : Vertex) (hv : IsGood Hs v) : NoriMotives Hs :=
  (Diagram.category.ofRep (noriRep Hs)).obj (⟨v, hv⟩, 0)

/-- The twisted unit `1(-1) = H^1_Nori(𝔾_m, {1})`. -/
def twist : NoriMotives Hs := ofGoodPair Hs gmVertex (gmVertex_good Hs)

/-- The tensor structure of `MM_Nori` (MC.5/nori-tensor-category; the product of a coboundary
edge with a pair is a gap of the source, MotivesAndAlgebraicCycles/E30). -/
instance instMonoidal : MonoidalCategory (NoriMotives Hs) := sorry

/-- Its symmetry. -/
instance instSymmetric : SymmetricCategory (NoriMotives Hs) := sorry

/-- The tensor powers `1(-n)` of the twisted unit. -/
def twistPow (n : ℕ) : NoriMotives Hs := Diagram.tensorNatPow (twist Hs) n

/-- The unit twisted by `n : ℤ`, `1(n)`, the vertex `(Spec ℚ, ∅, 0)(-n)` of `D_Nori`. -/
def unitTwist (n : ℤ) : NoriMotives Hs :=
  (Diagram.category.ofRep (noriRep Hs)).obj (⟨ptVertex, ptVertex_good Hs⟩, -n)

/-- The fibre functor of `MM_Nori`, singular cohomology. -/
def fibre : NoriMotives Hs ⥤ FGModuleCat.{0} ℚ := Diagram.category.fibre (noriRep Hs)

/-- The fibre functor of `MM^eff_Nori`. -/
def fibreEff : eff Hs ⥤ FGModuleCat.{0} ℚ := Diagram.category.fibre (goodRep Hs)

/-- The fibre functor is symmetric monoidal. -/
instance fibreBraided : (fibre Hs).Braided := sorry

/-- The fibre functor sends `H^i_Nori(X, Y)` to `H^i(X(ℂ), Y(ℂ); ℚ)`. -/
theorem fibre_ofGoodPair (v : Vertex) (hv : IsGood Hs v) :
    Nonempty ((fibre Hs).obj (ofGoodPair Hs v hv) ≅ (singularRep Hs).obj v) := sorry

/-- The exact faithful functor `MM^eff_Nori ⥤ MM_Nori`. -/
def effToNori : eff Hs ⥤ NoriMotives Hs :=
  Diagram.localise.categoryIncl (goodRep Hs) (goodKunneth Hs) (singularRep_gm Hs)

/-- The representation of the very good pairs in `MM_Nori` by the objects `H^i_Nori(X, Y)`. -/
def veryGoodRep : (veryGood Hs).Rep (NoriMotives Hs) :=
  (Diagram.category.ofRep (noriRep Hs)).restrict
    ((veryGoodToGood Hs).comp (Diagram.localise.incl _ (goodMul Hs) (goodGm Hs)))

instance fibre_additive : (fibre Hs).Additive := by unfold fibre; infer_instance

instance fibre_faithful : (fibre Hs).Faithful := by unfold fibre; infer_instance

instance : PreservesFiniteLimits (fibre Hs) := sorry

instance : PreservesFiniteColimits (fibre Hs) := sorry

/-- `H^i_Nori(X) = H^i(R(X))`, with `R` the realisation of MC.5/cellular-realisation-functor with
values in `MM_Nori`. -/
def absolute [HasDerivedCategory (NoriMotives Hs)] (X : Var) (i : ℤ) : NoriMotives Hs :=
  (DerivedCategory.homologyFunctor _ i).obj
    ((cellularRealisation Hs (fibre Hs) (veryGoodRep Hs)).obj (Opposite.op (cplx X)))

/-- Cohomology with supports `H^i_Z(X) = H^i(R(Cone(U ⟶ X)))` for `U = X - Z`. -/
def supports [HasDerivedCategory (NoriMotives Hs)] {U X : Var} (j : U ⟶ X) (i : ℤ) :
    NoriMotives Hs :=
  (DerivedCategory.homologyFunctor _ i).obj
    ((cellularRealisation Hs (fibre Hs) (veryGoodRep Hs)).obj (Opposite.op (coneOf j)))

/-- `H^1_Nori(𝔾_m, {1}) ≅ H^1_Nori(𝔾_m)` (HMS Definition 1.11; MotivesAndAlgebraicCycles/E35). -/
theorem twist_iso_absolute [HasDerivedCategory (NoriMotives Hs)] :
    Nonempty (twist Hs ≅ absolute Hs Var.gm 1) := sorry

end NoriMotives

/-- Unit test `twist_is_the_multiplicative_group`: the fibre functor sends
`1(-1) = H^1_Nori(𝔾_m, {1})` to `H^1(ℂ^*, {1}; ℚ) = ℚ`. -/
example (Hs : PairDiagram.PairHomology) :
    Module.finrank ℚ ((NoriMotives.fibre Hs).obj (NoriMotives.twist Hs)) = 1 := sorry

/-- Unit test `eff_to_nori_faithful`: `MM^eff_Nori ⥤ MM_Nori` is faithful and exact, compatibly
with the fibre functors. -/
example (Hs : PairDiagram.PairHomology) :
    (NoriMotives.effToNori Hs).Faithful ∧ PreservesFiniteLimits (NoriMotives.effToNori Hs) ∧
      PreservesFiniteColimits (NoriMotives.effToNori Hs) ∧
      Nonempty (NoriMotives.effToNori Hs ⋙ NoriMotives.fibre Hs ≅ NoriMotives.fibreEff Hs) :=
  sorry

/-- Unit test `fibre_functor_is_faithful`: singular cohomology is a faithful exact functor on
`MM_Nori`. -/
example (Hs : PairDiagram.PairHomology) :
    (NoriMotives.fibre Hs).Faithful ∧ PreservesFiniteLimits (NoriMotives.fibre Hs) ∧
      PreservesFiniteColimits (NoriMotives.fibre Hs) := sorry

/-- Unit test `point_is_unit`: `H^0_Nori(Spec ℚ, ∅)` is the unit object, with fibre `ℚ`. -/
example (Hs : PairDiagram.PairHomology) :
    Nonempty (NoriMotives.ofGoodPair Hs PairDiagram.ptVertex (PairDiagram.ptVertex_good Hs) ≅
      𝟙_ (NoriMotives Hs)) ∧
    Module.finrank ℚ ((NoriMotives.fibre Hs).obj
      (NoriMotives.ofGoodPair Hs PairDiagram.ptVertex (PairDiagram.ptVertex_good Hs))) = 1 :=
  sorry

/-! ### Theorems on Nori motives -/

section NoriTheorems

open PairDiagram AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology)

/-- MC.5/nori-tensor-category: `MM_Nori` is a commutative tensor category with faithful exact
tensor fibre functor `H^*`, with unit `(Spec ℚ, ∅, 0)` and `1(-1)` invertible, and it is the
localisation of `MM^eff_Nori` at `1(-1)`: every object is `effToNori(X) ⊗ 1(n)` for some `n ≥ 0`.
The product of coboundary edges with pairs is a gap of the source (E30). -/
theorem nori_tensor :
    Nonempty (NoriMotives.ofGoodPair Hs ptVertex (ptVertex_good Hs) ≅ 𝟙_ (NoriMotives Hs)) ∧
    Nonempty (NoriMotives.twist Hs ⊗ NoriMotives.unitTwist Hs 1 ≅ 𝟙_ (NoriMotives Hs)) ∧
    (NoriMotives.effToNori Hs).Full ∧ (NoriMotives.effToNori Hs).Faithful ∧
    ∀ X : NoriMotives Hs, ∃ (n : ℕ) (Y : NoriMotives.eff Hs),
      Nonempty (X ≅ (NoriMotives.effToNori Hs).obj Y ⊗ NoriMotives.unitTwist Hs n) := sorry

/-- MC.5/diagram-comparison: the diagram categories of all effective pairs and of effective very
good pairs, with respect to `H^*`, are equivalent to `MM^eff_Nori`, compatibly with the fibre
functors. The source's proof uses MC.5/cellular-realisation-functor and the universal property. -/
theorem nori_diagram_comparison :
    (∃ e : Diagram.category (singularRep Hs) ≌ NoriMotives.eff Hs,
      Nonempty (e.functor ⋙ NoriMotives.fibreEff Hs ≅ Diagram.category.fibre (singularRep Hs))) ∧
    (∃ e : Diagram.category ((singularRep Hs).restrict
        (Diagram.fullSubdiagram.incl eff (IsVeryGood Hs))) ≌ NoriMotives.eff Hs,
      Nonempty (e.functor ⋙ NoriMotives.fibreEff Hs ≅ Diagram.category.fibre _)) := sorry

/-- MC.5/nori-generators: every object of `MM^eff_Nori` is a subquotient of a finite direct sum
of objects `H^i_Nori(X, Y)` for good pairs with `X = W - W_∞` and `Y = W₀ - (W₀ ∩ W_∞)`,
`W` smooth projective and `W₀ ∪ W_∞` a normal crossings divisor. Normal crossings divisors
(SchemeAndStackFoundations SF.3) cannot be stated against Mathlib, which has no regular systems of
parameters; the statement below drops that condition on `W₀ ∪ W_∞`, which makes it weaker. -/
theorem nori_generators (X : NoriMotives.eff Hs) :
    ∃ (n : ℕ) (x : Fin n → (good Hs).V),
      (∀ k, ∃ (W : Var) (W₀ Winf : Closeds W.obj.left) (j : (x k).1.X ⟶ W),
        Smooth W.obj.hom ∧ IsProper W.obj.hom ∧
        IsOpenImmersion j.hom.left ∧ Set.range j.hom.left = (Winf : Set W.obj.left)ᶜ ∧
        j.hom.left '' (x k).1.Y = (W₀ : Set W.obj.left) \ Winf) ∧
      ∃ (Y : NoriMotives.eff Hs) (i : Y ⟶ ∐ fun k => (Diagram.category.ofRep (goodRep Hs)).obj (x k))
        (p : Y ⟶ X), Mono i ∧ Epi p := sorry

/-- MC.5/cohomology-with-supports: for `Z` closed in `X` with complement `j : U ⟶ X`, there is a
long exact sequence `… ⟶ H^i_Z(X) ⟶ H^i_Nori(X) ⟶ H^i_Nori(U) ⟶ H^{i+1}_Z(X) ⟶ …` in `MM_Nori`,
the middle map being `R(j)`. The identification of the fibre of `H^i_Z(X)` with singular
cohomology with supports is not stated: the pair homology interface only has closed pairs. -/
theorem nori_supports_les [HasDerivedCategory (NoriMotives Hs)] {U X : Var} (j : U ⟶ X)
    (hj : IsOpenImmersion j.hom.left) :
    ∃ (a : ∀ i, NoriMotives.supports Hs j i ⟶ NoriMotives.absolute Hs X i)
      (c : ∀ i, NoriMotives.absolute Hs U i ⟶ NoriMotives.supports Hs j (i + 1)),
      let b : ∀ i, NoriMotives.absolute Hs X i ⟶ NoriMotives.absolute Hs U i := fun i =>
        (DerivedCategory.homologyFunctor _ i).map
          (cellularRealisation_map Hs (NoriMotives.fibre Hs) (NoriMotives.veryGoodRep Hs) j)
      ∀ i, a i ≫ b i = 0 ∧ b i ≫ c i = 0 ∧ c i ≫ a (i + 1) = 0 ∧
        (∀ w, (ShortComplex.mk (a i) (b i) w).Exact) ∧
        (∀ w, (ShortComplex.mk (b i) (c i) w).Exact) ∧
        (∀ w, (ShortComplex.mk (c i) (a (i + 1)) w).Exact) := sorry

/-- MC.5/nori-top-cohomology: (1) `H^{2n}_Nori(ℙᴺ) ≅ 1(-n)` for `N ≥ n`; (2) for `Z` projective,
geometrically irreducible of dimension `n`, `H^{2n}_Nori(Z) ≅ 1(-n)`. HMS Lemma 1.12(2) omits
geometric irreducibility and is false without it (E28). -/
theorem nori_top_cohomology [HasDerivedCategory (NoriMotives Hs)] :
    (∀ N n : ℕ, n ≤ N → Nonempty (NoriMotives.absolute Hs (Var.projectiveSpace N) (2 * n) ≅
      NoriMotives.twistPow Hs n)) ∧
    ∀ (Z : Var) (n : ℕ), IsProper Z.obj.hom → GeometricallyIrreducible Z.obj.hom →
      topologicalKrullDim Z.obj.left = ((n : ℕ) : WithBot ℕ∞) →
      Nonempty (NoriMotives.absolute Hs Z (2 * n) ≅ NoriMotives.twistPow Hs n) := sorry

/-- MC.5/nori-gysin-isomorphism: for `X` smooth and `Z = ι(V)` smooth closed of pure codimension
`n`, geometrically connected, with complement `j : U ⟶ X`, `H^{2n}_Z(X) ≅ 1(-n)` (E28: the
source's irreducibility is not enough). -/
theorem nori_gysin_iso [HasDerivedCategory (NoriMotives Hs)] {U V X : Var} (ι : V ⟶ X)
    (j : U ⟶ X) (hι : IsClosedImmersion ι.hom.left) (hj : IsOpenImmersion j.hom.left)
    (hUV : Set.range j.hom.left = (Set.range ι.hom.left)ᶜ) (hX : Smooth X.obj.hom)
    (hV : Smooth V.obj.hom) (hVc : GeometricallyConnected V.obj.hom) (n : ℕ)
    (hcodim : topologicalKrullDim X.obj.left = topologicalKrullDim V.obj.left + (n : ℕ)) :
    Nonempty (NoriMotives.supports Hs j (2 * n) ≅ NoriMotives.twistPow Hs n) := sorry

/-- MC.5/basic-lemma (Nori), over `ℚ` with rational coefficients: for `X` affine of dimension `n`
and `Z` closed of dimension at most `n - 1`, there is a closed `Y ⊇ Z` of dimension at most
`n - 1` with `(X, Y, n)` good and `X - Y` smooth. The source gives no proof (gap). -/
theorem basicLemma (X : Var) (hX : IsAffine X.obj.left) (n : ℕ)
    (hn : topologicalKrullDim X.obj.left = ((n + 1 : ℕ) : WithBot ℕ∞)) (Z : Closeds X.obj.left)
    (hZ : topologicalKrullDim (Z : Set X.obj.left) ≤ ((n : ℕ) : WithBot ℕ∞)) :
    ∃ Y : Closeds X.obj.left, Z ≤ Y ∧
      topologicalKrullDim (Y : Set X.obj.left) ≤ ((n : ℕ) : WithBot ℕ∞) ∧
      IsGood Hs ⟨X, Y, (n + 1 : ℕ)⟩ ∧
      Smooth (Scheme.Opens.ι (X := X.obj.left) Y.compl ≫ X.obj.hom) := sorry

/-! MC.5/nori-duality-morphism is not stated: its hypothesis that `W₀ ∪ W_∞` is a normal crossings
divisor (SchemeAndStackFoundations SF.3) cannot be expressed against Mathlib, and dropping it would
make the statement false. -/

/-- MC.5/rigidity-criterion (HMS Proposition C.4 and Remark C.5), over a field and for pairings
`q_i : V_i ⊗ W_i ⟶ 1`: if `C` is an `R`-linear abelian symmetric monoidal category with a faithful
tensor functor `T` to `R`-modules, generated as an abelian tensor category by objects `V_i`
carrying pairings whose image under `T` is perfect, then `C` is rigid. -/
theorem rigidity_criterion (R : Type) [Field R] {C : Type*} [Category C] [Abelian C] [Linear R C]
    [MonoidalCategory C] [SymmetricCategory C] (T : C ⥤ FGModuleCat.{0} R) [T.Faithful]
    [T.Monoidal] {ι : Type*} (V W : ι → C) (q : ∀ k, V k ⊗ W k ⟶ 𝟙_ C)
    (hq : ∀ k, (TensorProduct.curry ((Functor.OplaxMonoidal.η T).hom.hom ∘ₗ
      (T.map (q k)).hom.hom ∘ₗ (Functor.LaxMonoidal.μ T (V k) (W k)).hom.hom)).IsPerfPair)
    (hgen : ∀ P : ObjectProperty C, (∀ k, P (V k)) → P (𝟙_ C) →
      (∀ X Y, P X → P Y → P (X ⊗ Y)) → (∀ X Y, P X → P Y → P (X ⊞ Y)) →
      (∀ X Y (f : X ⟶ Y), Mono f → P Y → P X) → (∀ X Y (f : X ⟶ Y), Epi f → P X → P Y) →
      ∀ X, P X) :
    Nonempty (RigidCategory C) := sorry

/-- MC.5/nori-rigidity (HMS Theorem 1.14): `MM_Nori` is rigid. -/
instance nori_rigidity : RigidCategory (NoriMotives Hs) := sorry

end NoriTheorems

end MC5
section MC6

open CategoryTheory Limits MonoidalCategory TensorProduct

/-! ## MC.6 Motivic Galois groups and periods

Heaps (Baer and Kontsevich's torsors without a chosen group) are called `Heap` here: Mathlib's
root `Torsor G P` is a torsor under a given group `G`. The tensor automorphism group of a diagram
category is recorded through its Hopf algebra `A(T)`; the pinned Tau Ceti Tannakian API
(`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, `TauCeti.Tannaka.fgPointTensorIsoEquiv`,
`TauCeti.fgPointRepresentationCategoryEquivalence`) is not importable in this session, so the
statements are made with Mathlib's monoidal natural transformations. -/

/-- MC.6/torsor: a heap, a type with a ternary operation `(x, y, z)` such that
`(x, y, y) = x = (y, y, x)` and `((x, y, z), u, v) = (x, (u, z, y), v) = (x, y, (z, u, v))`
(Definition A.1). The type may be empty and no point is chosen. -/
class Heap (X : Type u) where
  /-- The ternary operation. -/
  op : X → X → X → X
  op_self_right' : ∀ x y, op x y y = x
  op_self_left' : ∀ x y, op y y x = x
  op_assoc_left' : ∀ x y z u v, op (op x y z) u v = op x y (op z u v)
  op_assoc_middle' : ∀ x y z u v, op x (op u z y) v = op x y (op z u v)

namespace Heap

variable {X : Type u} [inst : Heap X]

/-- `(x, y, y) = x`. -/
@[simp] theorem op_self_right (x y : X) : op x y y = x := op_self_right' x y

/-- `(y, y, x) = x`. -/
@[simp] theorem op_self_left (x y : X) : op y y x = x := op_self_left' x y

/-- `((x, y, z), u, v) = (x, y, (z, u, v))`. -/
theorem op_assoc_left (x y z u v : X) : op (op x y z) u v = op x y (op z u v) :=
  op_assoc_left' x y z u v

/-- `(x, (u, z, y), v) = (x, y, (z, u, v))`: the middle term reverses `u, z, y`. -/
theorem op_assoc_middle (x y z u v : X) : op x (op u z y) v = op x y (op z u v) :=
  op_assoc_middle' x y z u v

/-- A morphism of heaps: a map commuting with the ternary operations. -/
structure Hom (X Y : Type u) [Heap X] [Heap Y] where
  /-- The underlying map. -/
  toFun : X → Y
  map_op : ∀ x y z, toFun (op x y z) = op (toFun x) (toFun y) (toFun z)

/-- The identity morphism of a heap. -/
def Hom.id (X : Type u) [Heap X] : Hom X X := ⟨fun x => x, fun _ _ _ => rfl⟩

/-- Composition of morphisms of heaps. -/
def Hom.comp {X Y Z : Type u} [Heap X] [Heap Y] [Heap Z] (f : Hom X Y) (g : Hom Y Z) :
    Hom X Z :=
  ⟨g.toFun ∘ f.toFun, fun x y z => by simp [f.map_op, g.map_op]⟩

/-- The heap of a group, `(g, h, k) = g h⁻¹ k` (Lemma A.2). -/
instance ofGroup (G : Type u) [Group G] : Heap G where
  op g h k := g * h⁻¹ * k
  op_self_right' := sorry
  op_self_left' := sorry
  op_assoc_left' := sorry
  op_assoc_middle' := sorry

/-- For a heap `X` and `e : X`, the group `G_e` with `g · h = (g, e, h)`, unit `e` and
`g⁻¹ = (e, g, e)` (Lemma A.3). It depends on `e`; no inverse to `ofGroup` is claimed. -/
abbrev toGroup (e : X) : Group X where
  mul g h := op g e h
  one := e
  inv g := op e g e
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  inv_mul_cancel := sorry

/-- In the group `toGroup e`, the heap operation is `(g, h, k) = g h⁻¹ k`. -/
theorem toGroup_op (e g h k : X) :
    @Heap.op X inst g h k =
      @HMul.hMul X X X (@instHMul X (@toGroup X inst e).toMulOneClass.toMul)
        (@HMul.hMul X X X (@instHMul X (@toGroup X inst e).toMulOneClass.toMul) g
          ((@toGroup X inst e).inv h)) k := sorry

/-- Pointing the heap of a group `G` at `1` gives back the multiplication of `G`. -/
theorem ofGroup_toGroup_one (G : Type u) [Group G] (g h : G) :
    @HMul.hMul G G G (@instHMul G (toGroup (1 : G)).toMulOneClass.toMul) g h = g * h := sorry

/-- A Mathlib torsor `P` under a group `G` is a heap with `(p, q, r) = (p /ₛ q) • r`. -/
abbrev ofTorsor (G P : Type u) [Group G] [Torsor G P] : Heap P where
  op p q r := (p /ₛ q) • r
  op_self_right' := sorry
  op_self_left' := sorry
  op_assoc_left' := sorry
  op_assoc_middle' := sorry

/-- For `G` acting on itself, `ofTorsor` is `ofGroup`. -/
theorem ofTorsor_self (G : Type u) [Group G] (g h k : G) :
    (ofTorsor G G).op g h k = (ofGroup G).op g h k := sorry

/-- A group homomorphism is a morphism of the associated heaps. -/
def Hom.ofGroupHom {G H : Type u} [Group G] [Group H] (f : G →* H) : Hom G H :=
  ⟨f, fun x y z => by simp [op, map_mul, map_inv]⟩

/-- `Hom.ofGroupHom` is compatible with composition. -/
theorem Hom.ofGroupHom_comp {G H K : Type u} [Group G] [Group H] [Group K] (f : G →* H)
    (g : H →* K) : Hom.ofGroupHom (g.comp f) = (Hom.ofGroupHom f).comp (Hom.ofGroupHom g) := rfl

end Heap

/-- Unit test `Heap.ofGroup_int_op`: in the heap of the additive group `ℤ`,
`(5, 2, 3) = 5 - 2 + 3 = 6`. -/
example : Heap.op (Multiplicative.ofAdd (5 : ℤ)) (Multiplicative.ofAdd 2)
    (Multiplicative.ofAdd 3) = Multiplicative.ofAdd 6 := sorry

/-- Unit test `Heap.empty`: the empty type is a heap and carries no group structure, so a heap
is not a pointed group. -/
example : Nonempty (Heap PEmpty.{u + 1}) ∧ IsEmpty (Group PEmpty.{u + 1}) := sorry

/-- Unit test `Heap.toGroup_ofGroup_one`: for a group `G`, the multiplication of
`Heap.toGroup 1` on the heap of `G` is the multiplication of `G`. -/
example (G : Type u) [Group G] (g h : G) :
    @HMul.hMul G G G (@instHMul G (Heap.toGroup (1 : G)).toMulOneClass.toMul) g h = g * h :=
  sorry

/-- Unit test `Heap.not_mul_mul`: on `ℤ/3`, `(x, y, z) ↦ x + y + z` is not a heap operation:
`(0, 1, 1) = 2 ≠ 0`. -/
example : ¬ ∃ h : Heap (ZMod 3), ∀ x y z, h.op x y z = x + y + z := sorry

/-- Unit test `Heap.middle_reversed`: in the heap of `ℤ/3`, `(x, (z, u, y), v) = (x, y, (z, u, v))`
fails for `x = y = v = 0`, `z = 1`, `u = 0`: the left side is `2`, the right side `1`. -/
example :
    let a : Multiplicative (ZMod 3) := Multiplicative.ofAdd 0
    let b : Multiplicative (ZMod 3) := Multiplicative.ofAdd 1
    Heap.op a (Heap.op b a a) a ≠ Heap.op a a (Heap.op b a a) := sorry

/-! ### The left and right groups of a heap (MC.6/torsor-groups) -/

namespace Heap

variable (X : Type u) [inst : Heap X]

/-- The relation `(a, b) ∼_l (c, d)` iff `(a, b, d) = c`, that is `(c, d) = μ_l((a, b), (d, d))`. -/
def leftRel : Setoid (X × X) := ⟨fun p q => op p.1 p.2 q.2 = q.1, sorry⟩

/-- The left group `G_l = (X × X)/∼_l` of a heap (Proposition A.4); a group when `X` is
nonempty (for the empty heap it is empty, finding E42). -/
def leftGroup : Type u := Quotient (leftRel X)

/-- The class `[(a, b)]`. -/
def leftGroup.mk (a b : X) : leftGroup X := Quotient.mk _ (a, b)

instance [Nonempty X] : Group (leftGroup X) where
  mul := Quotient.map₂ (fun p q => (op p.1 p.2 q.1, q.2)) sorry
  one := leftGroup.mk X (Classical.arbitrary X) (Classical.arbitrary X)
  inv := Quotient.map (fun p => (p.2, p.1)) sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  inv_mul_cancel := sorry

/-- The left action `[(a, b)] · x = (a, b, x)`. -/
instance [Nonempty X] : MulAction (leftGroup X) X where
  smul := Quotient.lift (fun p x => op p.1 p.2 x) sorry
  one_smul := sorry
  mul_smul := sorry

variable {X} [Nonempty X]

/-- `[(a, b)] · [(c, d)] = [((a, b, c), d)]`. -/
theorem leftGroup.mul_mk (a b c d : X) :
    leftGroup.mk X a b * leftGroup.mk X c d = leftGroup.mk X (op a b c) d := sorry

/-- `[(a, b)]⁻¹ = [(b, a)]`. -/
theorem leftGroup.inv_mk (a b : X) : (leftGroup.mk X a b)⁻¹ = leftGroup.mk X b a := sorry

/-- `[(a, b)] · x = (a, b, x)`. -/
theorem leftGroup.smul_mk (a b x : X) : leftGroup.mk X a b • x = op a b x := sorry

variable (X) in
/-- A nonempty heap is a Mathlib torsor under its left group, with `x /ₛ y = [(x, y)]`. -/
instance leftTorsor : Torsor (leftGroup X) X where
  sdiv x y := leftGroup.mk X x y
  sdiv_smul' := sorry
  smul_sdiv' := sorry

/-- For `e : X`, the isomorphism `x ↦ [(x, e)]` from the group `toGroup e` to the left group. -/
def leftGroupEquiv (e : X) :
    letI : Group X := toGroup e; X ≃* @leftGroup X inst :=
  letI : Group X := toGroup e
  { toFun := fun x => leftGroup.mk X x e
    invFun := Quotient.lift (fun p => op p.1 p.2 e) sorry
    left_inv := sorry
    right_inv := sorry
    map_mul' := sorry }

variable (X) in
/-- The right group `G_r`, from `μ_r((a, b), (c, d)) = (a, (b, c, d))`: the classes of `X × X` for
`(a, b) ∼_r (c, d)` iff `d = (c, a, b)`, acting simply transitively on the right. -/
def rightGroup : Type u := Quotient (⟨fun p q : X × X => q.2 = op q.1 p.1 p.2, sorry⟩ : Setoid (X × X))

instance : Group (rightGroup X) where
  mul := Quotient.map₂ (fun p q => (p.1, op p.2 q.1 q.2)) sorry
  one := Quotient.mk _ (Classical.arbitrary X, Classical.arbitrary X)
  inv := Quotient.map (fun p => (p.2, p.1)) sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  inv_mul_cancel := sorry

/-- The right action `x · [(a, b)] = (x, a, b)`. -/
instance : MulAction (rightGroup X)ᵐᵒᵖ X where
  smul g x := Quotient.lift (fun p => op x p.1 p.2) sorry g.unop
  one_smul := sorry
  mul_smul := sorry

/-- A morphism of nonempty heaps induces a homomorphism of left groups. -/
def leftGroup.map {Y : Type u} [Heap Y] [Nonempty Y] (f : Hom X Y) : leftGroup X →* leftGroup Y where
  toFun := Quotient.map (fun p => (f.toFun p.1, f.toFun p.2)) sorry
  map_one' := sorry
  map_mul' := sorry

/-- `leftGroup.map` is compatible with identities and composition. -/
theorem leftGroup.map_comp {Y Z : Type u} [Heap Y] [Nonempty Y] [Heap Z] [Nonempty Z]
    (f : Hom X Y) (g : Hom Y Z) :
    leftGroup.map (f.comp g) = (leftGroup.map g).comp (leftGroup.map f) ∧
      leftGroup.map (Hom.id X) = MonoidHom.id _ := sorry

end Heap

/-- Unit test `Heap.leftGroup_ofGroup`: for a group `G`, `[(a, b)] ↦ a b⁻¹` is an isomorphism
from the left group of the heap of `G` to `G`, under which the action is left multiplication. -/
example (G : Type u) [Group G] :
    ∃ e : Heap.leftGroup G ≃* G, (∀ a b : G, e (Heap.leftGroup.mk G a b) = a * b⁻¹) ∧
      ∀ (g : Heap.leftGroup G) (x : G), g • x = e g * x := sorry

/-- Unit test `Heap.leftGroup_int_mk`: in the heap of `ℤ`, `[(5, 2)] = [(3, 0)]`, both acting by
adding `3`. -/
example :
    Heap.leftGroup.mk (Multiplicative ℤ) (.ofAdd 5) (.ofAdd 2) =
        Heap.leftGroup.mk (Multiplicative ℤ) (.ofAdd 3) (.ofAdd 0) ∧
      ∀ x : Multiplicative ℤ, Heap.leftGroup.mk (Multiplicative ℤ) (.ofAdd 5) (.ofAdd 2) • x =
        Multiplicative.ofAdd 3 * x := sorry

/-- Unit test `Heap.leftGroup_unique`: the left group of a one-element heap is trivial. -/
example (X : Type u) [Heap X] [Unique X] : Subsingleton (Heap.leftGroup X) := sorry

/-- Unit test `Heap.leftGroup_mk_not_injective`: for a heap with two elements or more,
`X × X ⟶ G_l` is not injective: `(a, b)` and `((a, b, x), x)` have the same class. -/
example (X : Type u) [Heap X] [Nontrivial X] :
    ¬ Function.Injective fun p : X × X => Heap.leftGroup.mk X p.1 p.2 := sorry

/-! ### Affine heaps (MC.6/affine-torsor) -/

/-- The operation induced on `S`-points by `A → A ⊗ A ⊗ A`. -/
def AffineHeap.pointsOp {R : Type u} {A : Type v} [CommRing R] [CommRing A] [Algebra R A]
    (op : A →ₐ[R] A ⊗[R] A ⊗[R] A) {S : Type w} [CommRing S] [Algebra R S]
    (x y z : A →ₐ[R] S) : A →ₐ[R] S :=
  (Algebra.TensorProduct.productMap (Algebra.TensorProduct.productMap x y) z).comp op

/-- MC.6/affine-torsor: an affine heap over `R` (Definition A.5), dually an `R`-algebra map
`A → A ⊗ A ⊗ A` whose operation on `S`-points is a heap for every commutative `R`-algebra `S`.
No point is assumed. -/
structure AffineHeap (R : Type u) (A : Type v) [CommRing R] [CommRing A] [Algebra R A] where
  /-- The comorphism of `X × X × X ⟶ X`. -/
  op : A →ₐ[R] A ⊗[R] A ⊗[R] A
  isHeap : ∀ (S : Type v) [CommRing S] [Algebra R S] (x y z u v : A →ₐ[R] S),
    AffineHeap.pointsOp op x y y = x ∧ AffineHeap.pointsOp op y y x = x ∧
    AffineHeap.pointsOp op (AffineHeap.pointsOp op x y z) u v =
      AffineHeap.pointsOp op x y (AffineHeap.pointsOp op z u v) ∧
    AffineHeap.pointsOp op x (AffineHeap.pointsOp op u z y) v =
      AffineHeap.pointsOp op x y (AffineHeap.pointsOp op z u v)

namespace AffineHeap

variable {R : Type u} {A : Type v} [CommRing R] [CommRing A] [Algebra R A] (H : AffineHeap R A)

/-- The heap of `S`-valued points `Hom(A, S)`. -/
abbrev points (S : Type v) [CommRing S] [Algebra R S] : Heap (A →ₐ[R] S) where
  op := pointsOp H.op
  op_self_right' x y := (H.isHeap S x y x x x).1
  op_self_left' x y := (H.isHeap S x y x x x).2.1
  op_assoc_left' x y z u v := (H.isHeap S x y z u v).2.2.1
  op_assoc_middle' x y z u v := (H.isHeap S x y z u v).2.2.2

/-- An `R`-algebra map `S ⟶ S'` induces a morphism of the heaps of points. -/
def points_map {S S' : Type v} [CommRing S] [Algebra R S] [CommRing S'] [Algebra R S']
    (φ : S →ₐ[R] S') :
    letI := H.points S; letI := H.points S'; Heap.Hom (A →ₐ[R] S) (A →ₐ[R] S') :=
  letI := H.points S; letI := H.points S'
  ⟨fun x => φ.comp x, sorry⟩

/-- `points_map` is compatible with identities and composition. -/
theorem points_map_comp {S S' S'' : Type v} [CommRing S] [Algebra R S] [CommRing S']
    [Algebra R S'] [CommRing S''] [Algebra R S''] (φ : S →ₐ[R] S') (ψ : S' →ₐ[R] S'')
    (x : A →ₐ[R] S) :
    letI := H.points S; letI := H.points S'; letI := H.points S''
    (H.points_map (ψ.comp φ)).toFun x = (H.points_map ψ).toFun ((H.points_map φ).toFun x) ∧
      (H.points_map (AlgHom.id R S)).toFun x = x := sorry

/-- Two affine heap structures on `A` are equal when their operations on points agree. -/
theorem ext {H₁ H₂ : AffineHeap R A}
    (h : ∀ (S : Type v) [CommRing S] [Algebra R S] (x y z : A →ₐ[R] S),
      pointsOp H₁.op x y z = pointsOp H₂.op x y z) : H₁ = H₂ := sorry

/-- A morphism of affine heaps `Spec A ⟶ Spec B`: an algebra map `B ⟶ A` compatible with the
ternary maps. -/
structure Hom {B : Type v} [CommRing B] [Algebra R B] (H' : AffineHeap R B) where
  /-- The comorphism. -/
  toAlgHom : B →ₐ[R] A
  comm : H.op.comp toAlgHom =
    (Algebra.TensorProduct.map (Algebra.TensorProduct.map toAlgHom toAlgHom) toAlgHom).comp H'.op

/-- The identity morphism of an affine heap. -/
def Hom.id : H.Hom H := ⟨AlgHom.id R A, sorry⟩

/-- Composition of morphisms of affine heaps. -/
def Hom.comp {B C : Type v} [CommRing B] [Algebra R B] [CommRing C] [Algebra R C]
    {H' : AffineHeap R B} {H'' : AffineHeap R C} (f : H.Hom H') (g : H'.Hom H'') :
    H.Hom H'' := ⟨f.toAlgHom.comp g.toAlgHom, sorry⟩

end AffineHeap

/-- The affine heap of a commutative Hopf algebra, with operation `g h⁻¹ k` on points: the
comorphism is `(id ⊗ S ⊗ id) ∘ (Δ ⊗ id) ∘ Δ`. -/
def AffineHeap.ofHopf {R : Type u} {A : Type v} [CommRing R] [CommRing A] [HopfAlgebra R A] :
    AffineHeap R A := sorry

/-- Unit test `AffineHeap.ofHopf_points`: for a commutative Hopf algebra, the operation of
`AffineHeap.ofHopf` on `S`-points is `(g, h, k) ↦ g * (h ∘ S) * k` for the convolution product. -/
example (R A S : Type u) [CommRing R] [CommRing A] [HopfAlgebra R A] [CommRing S] [Algebra R S]
    (g h k : A →ₐ[R] S) :
    (AffineHeap.pointsOp (AffineHeap.ofHopf (R := R) (A := A)).op g h k).toLinearMap =
      LinearMap.mul' R S ∘ₗ TensorProduct.map (LinearMap.mul' R S ∘ₗ
        TensorProduct.map g.toLinearMap (h.toLinearMap ∘ₗ HopfAlgebra.antipode R))
        k.toLinearMap ∘ₗ (Coalgebra.comul (R := R) (A := A)).rTensor A ∘ₗ
          Coalgebra.comul (R := R) (A := A) := sorry

/-- Unit test `AffineHeap.zero`: the zero algebra, the empty scheme, is an affine heap with no
point over any nonzero `S`. -/
example (R : Type u) [CommRing R] :
    Nonempty (AffineHeap R PUnit.{u + 1}) ∧
      ∀ (S : Type u) [CommRing S] [Algebra R S] [Nontrivial S], IsEmpty (PUnit.{u + 1} →ₐ[R] S) :=
  sorry

/-- Unit test `AffineHeap.additive`: on `Spec R[t]`, `t ↦ t ⊗ 1 ⊗ 1 - 1 ⊗ t ⊗ 1 + 1 ⊗ 1 ⊗ t` is an
affine heap structure, the heap of the additive group. -/
example (R : Type u) [CommRing R] :
    ∃ H : AffineHeap R (Polynomial R), H.op Polynomial.X =
      Polynomial.X ⊗ₜ 1 ⊗ₜ 1 - 1 ⊗ₜ Polynomial.X ⊗ₜ 1 + 1 ⊗ₜ 1 ⊗ₜ Polynomial.X := sorry

/-- Unit test `AffineHeap.not_mul`: on `Spec R[t, t⁻¹]`, `t ↦ t ⊗ t ⊗ t` is not an affine heap
structure: on points it is `(x, y, z) ↦ x y z`, which fails `(x, y, y) = x`. -/
example (R : Type u) [CommRing R] [Nontrivial R] :
    ¬ ∃ H : AffineHeap R (LaurentPolynomial R), H.op (LaurentPolynomial.T 1) =
      LaurentPolynomial.T 1 ⊗ₜ LaurentPolynomial.T 1 ⊗ₜ LaurentPolynomial.T 1 := sorry

/-- MC.6/affine-torsor-groups: a nonempty affine heap `Spec A` over a field `k` carries affine
group schemes `G_l = Spec H_l` and `G_r = Spec H_r` acting on the left and on the right, making it
a torsor under each: `A ⊗ A ≅ H_l ⊗ A` through the left coaction, and likewise on the right. The
quotient of `X × X` is taken from SGA 3, Exposé VII, Theorem 1.4 (gap). -/
theorem affine_torsor_groups (k A : Type u) [Field k] [CommRing A] [Algebra k A] [Nontrivial A]
    (H : AffineHeap k A) :
    (∃ (Hl : Type u) (_ : CommRing Hl) (_ : HopfAlgebra k Hl) (ρ : A →ₐ[k] Hl ⊗[k] A),
      (Algebra.TensorProduct.map (Bialgebra.comulAlgHom k Hl) (AlgHom.id k A)).comp ρ =
        (Algebra.TensorProduct.assoc k k k Hl Hl A).symm.toAlgHom.comp
          ((Algebra.TensorProduct.map (AlgHom.id k Hl) ρ).comp ρ) ∧
      Function.Bijective (Algebra.TensorProduct.productMap ρ
        (Algebra.TensorProduct.includeRight : A →ₐ[k] Hl ⊗[k] A))) ∧
    (∃ (Hr : Type u) (_ : CommRing Hr) (_ : HopfAlgebra k Hr) (ρ : A →ₐ[k] A ⊗[k] Hr),
      (Algebra.TensorProduct.map (AlgHom.id k A) (Bialgebra.comulAlgHom k Hr)).comp ρ =
        (Algebra.TensorProduct.assoc k k k A Hr Hr).toAlgHom.comp
          ((Algebra.TensorProduct.map ρ (AlgHom.id k Hr)).comp ρ) ∧
      Function.Bijective (Algebra.TensorProduct.productMap ρ
        (Algebra.TensorProduct.includeLeft : A →ₐ[k] A ⊗[k] Hr))) := sorry
/-! ### The tensor automorphism group (MC.6/tensor-automorphism-group) -/

/-- The map `A(T'|_D) ⟶ A(T')` induced by a morphism of diagrams. -/
def Diagram.Rep.coalgebraMapOf {k : Type u} [Field k] {D D' : Diagram.{v}} (φ : D.Hom D')
    (T' : D'.Rep (FGModuleCat.{u} k)) : (T'.restrict φ).coalgebra →ₗ[k] T'.coalgebra := sorry

namespace DiagramCategory

variable {k : Type u} [Field k] {D : Diagram.{v}} {T : D.Rep (FGModuleCat.{u} k)} {G : D.Graded}
  {P : D.ProductStructure G}

/-- The tensor automorphisms of a monoidal functor: its monoidal natural automorphisms. -/
def TensorAut {C E : Type*} [Category C] [Category E] [MonoidalCategory C] [MonoidalCategory E]
    (F : C ⥤ E) [F.LaxMonoidal] : Type _ :=
  {η : F ≅ F // NatTrans.IsMonoidal η.hom}

/-- The fibre functor extended to a commutative `k`-algebra `R`, `f_T ⊗ R`. -/
def fibreBaseChange (T : D.Rep (FGModuleCat.{u} k)) (R : Type u) [CommRing R] [Algebra k R] :
    Diagram.category T ⥤ ModuleCat.{u} R :=
  Diagram.category.fibre T ⋙ forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙
    ModuleCat.extendScalars (algebraMap k R)

/-- `f_T ⊗ R` is monoidal for the tensor structure of a graded multiplicative `T`. -/
abbrev fibreBaseChange.monoidal (M : T.GradedMultiplicative G P) (R : Type u) [CommRing R]
    [Algebra k R] : letI := Diagram.category.monoidal M; (fibreBaseChange T R).Monoidal :=
  letI := Diagram.category.monoidal M; letI := Diagram.category.fibre_monoidal M
  inferInstanceAs (Diagram.category.fibre T ⋙ forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙
    ModuleCat.extendScalars (algebraMap k R)).Monoidal

/-- MC.6/tensor-automorphism-group: for a unital graded multiplicative `T` over a field with
`C(T)` rigid, `A(T)` is a commutative Hopf algebra, the ring of functions of the affine group
scheme `G(T) = Spec A(T)`. -/
abbrev tensorAutGroup (M : T.GradedMultiplicative G P) (_ : M.Unital)
    (_ : letI := Diagram.category.monoidal M; Nonempty (RigidCategory (Diagram.category T))) :
    letI := T.coalgebraCommRing M; HopfAlgebra k T.coalgebra := sorry

variable (M : T.GradedMultiplicative G P) (hU : M.Unital)
  (hrig : letI := Diagram.category.monoidal M; Nonempty (RigidCategory (Diagram.category T)))

/-- The functor of points of `G(T)` is the tensor automorphism group functor of `f_T`:
`G(T)(R) = Aut⊗(f_T ⊗ R)` (through `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` in the
roadmap). -/
def tensorAutGroup_represents (R : Type u) [CommRing R] [Algebra k R] :
    letI := T.coalgebraCommRing M; letI := tensorAutGroup M hU hrig
    letI := Diagram.category.monoidal M; letI := fibreBaseChange.monoidal M R
    (T.coalgebra →ₐ[k] R) ≃ TensorAut (fibreBaseChange T R) := sorry

/-- Every tensor automorphism of `f_T ⊗ R` is the action of a unique `R`-point. -/
theorem tensorAutGroup_point (R : Type u) [CommRing R] [Algebra k R] :
    letI := T.coalgebraCommRing M; letI := tensorAutGroup M hU hrig
    letI := Diagram.category.monoidal M; letI := fibreBaseChange.monoidal M R
    ∀ η : TensorAut (fibreBaseChange T R),
      ∃! g : T.coalgebra →ₐ[k] R, tensorAutGroup_represents M hU hrig R g = η := sorry

/-- `C(T)` is the category of finite-dimensional representations of `G(T)`, compatibly with `f_T`:
a `k`-linear map between fibres comes from `C(T)` exactly when it commutes with the action of
every tensor automorphism of `f_T ⊗ R`, for every `R`. Essential surjectivity onto all
representations is not stated: representations of affine group schemes are not in Mathlib
(`TauCeti.fgPointRepresentationCategoryEquivalence` in the roadmap). -/
theorem equivRep (X Y : Diagram.category T)
    (φ : (Diagram.category.fibre T).obj X ⟶ (Diagram.category.fibre T).obj Y) :
    letI := Diagram.category.monoidal M
    (∃ f : X ⟶ Y, (Diagram.category.fibre T).map f = φ) ↔
      ∀ (R : Type u) [CommRing R] [Algebra k R],
        letI := fibreBaseChange.monoidal M R
        ∀ η : TensorAut (fibreBaseChange T R),
          ((forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙
              ModuleCat.extendScalars (algebraMap k R)).map φ) ≫ η.1.hom.app Y =
            η.1.hom.app X ≫ ((forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙
              ModuleCat.extendScalars (algebraMap k R)).map φ) := sorry

/-- A morphism of diagrams compatible with the products induces a homomorphism of groups
`G(T') ⟶ G(T'|_D)` in the opposite direction, dually a ring map of the Hopf algebras. -/
def tensorAutGroup.map {D' : Diagram.{v}} {G' : D'.Graded} {P' : D'.ProductStructure G'}
    (φ : D.Hom D') (T' : D'.Rep (FGModuleCat.{u} k)) (M₀ : (T'.restrict φ).GradedMultiplicative G P)
    (M' : T'.GradedMultiplicative G' P') (_ : ∀ f g, φ.obj (P.mul f g) = P'.mul (φ.obj f) (φ.obj g)) :
    letI := (T'.restrict φ).coalgebraCommRing M₀; letI := T'.coalgebraCommRing M'
    (T'.restrict φ).coalgebra →+* T'.coalgebra := sorry

/-- The induced maps are compatible with the colimit maps, hence with composition. -/
theorem tensorAutGroup.map_colimit {D' : Diagram.{v}} {G' : D'.Graded}
    {P' : D'.ProductStructure G'} (φ : D.Hom D') (T' : D'.Rep (FGModuleCat.{u} k))
    (M₀ : (T'.restrict φ).GradedMultiplicative G P) (M' : T'.GradedMultiplicative G' P')
    (hφ : ∀ f g, φ.obj (P.mul f g) = P'.mul (φ.obj f) (φ.obj g)) (a : (T'.restrict φ).coalgebra) :
    letI := (T'.restrict φ).coalgebraCommRing M₀; letI := T'.coalgebraCommRing M'
    tensorAutGroup.map φ T' M₀ M' hφ a = T'.coalgebraMapOf φ a := sorry

end DiagramCategory

/-- MC.6/rigid-bialgebra-is-hopf, for the bialgebras `A(T)` of diagram categories (the general
statement is for Tau Ceti's `FGComoduleCat`, not importable here): if `C(T)` is rigid, `A(T)` has a
unique antipode. -/
theorem rigidBialgebraHopf {k : Type u} [Field k] {D : Diagram.{v}}
    {T : D.Rep (FGModuleCat.{u} k)} {G : D.Graded} {P : D.ProductStructure G}
    (M : T.GradedMultiplicative G P) (hU : M.Unital)
    (hrig : letI := Diagram.category.monoidal M; Nonempty (RigidCategory (Diagram.category T))) :
    letI := T.coalgebraCommRing M; letI := T.bialgebra M hU
    ∃! S : T.coalgebra →ₗ[k] T.coalgebra,
      LinearMap.mul' k T.coalgebra ∘ₗ S.rTensor T.coalgebra ∘ₗ Coalgebra.comul =
          Algebra.linearMap k T.coalgebra ∘ₗ Coalgebra.counit ∧
        LinearMap.mul' k T.coalgebra ∘ₗ S.lTensor T.coalgebra ∘ₗ Coalgebra.comul =
          Algebra.linearMap k T.coalgebra ∘ₗ Coalgebra.counit := sorry

/-- MC.6/tensor-automorphism-group for Nori motives: `G_mot = Spec A(D_Nori, H^*)`, the ring
structure on `A(D_Nori, H^*)`. -/
abbrev MotivicGalois.commRing (Hs : PairDiagram.PairHomology) :
    CommRing (PairDiagram.noriRep Hs).coalgebra := sorry

/-- The motivic Galois group `G_mot = Spec A(D_Nori, H^*)`, the tensor automorphism group of
singular cohomology on Nori motives, given by its Hopf algebra. -/
abbrev MotivicGalois (Hs : PairDiagram.PairHomology) :
    letI := MotivicGalois.commRing Hs; HopfAlgebra ℚ (PairDiagram.noriRep Hs).coalgebra := sorry

/-- The character of `G_mot` given by `1(-1)`: a grouplike element of `A(D_Nori, H^*)`. -/
def MotivicGalois.twistCharacter (Hs : PairDiagram.PairHomology) :
    (PairDiagram.noriRep Hs).coalgebra := sorry

/-- `1(-1)` is a character: its coaction is `v ↦ v ⊗ χ`, with `χ` grouplike. -/
theorem MotivicGalois.twistCharacter_spec (Hs : PairDiagram.PairHomology) :
    Coalgebra.comul (R := ℚ) (MotivicGalois.twistCharacter Hs) =
        MotivicGalois.twistCharacter Hs ⊗ₜ MotivicGalois.twistCharacter Hs ∧
      Coalgebra.counit (R := ℚ) (MotivicGalois.twistCharacter Hs) = 1 ∧
      ∀ v, Diagram.category.coaction (PairDiagram.noriRep Hs) (NoriMotives.twist Hs) v =
        v ⊗ₜ MotivicGalois.twistCharacter Hs := sorry

/-- Unit test `tensorAutGroup_point_rat`: a tensor automorphism of `f_T` over `k` is a
`k`-rational point of `G(T)`. -/
example {k : Type u} [Field k] {D : Diagram.{v}} {T : D.Rep (FGModuleCat.{u} k)} {G : D.Graded}
    {P : D.ProductStructure G} (M : T.GradedMultiplicative G P) (hU : M.Unital)
    (hrig : letI := Diagram.category.monoidal M; Nonempty (RigidCategory (Diagram.category T))) :
    letI := T.coalgebraCommRing M; letI := DiagramCategory.tensorAutGroup M hU hrig
    letI := Diagram.category.monoidal M; letI := DiagramCategory.fibreBaseChange.monoidal M k
    Nonempty ((T.coalgebra →ₐ[k] k) ≃ DiagramCategory.TensorAut
      (DiagramCategory.fibreBaseChange T k)) := sorry

/-- Unit test `tensorAutGroup_unit`: for the unit vertex alone with `T(1) = k`, `A(T) = k`, so
`G(T)` is the trivial group. -/
example (k : Type) [Field k] :
    Module.finrank k (Diagram.Rep.single.{0} (FGModuleCat.of k k)).coalgebra = 1 := sorry

/-- Unit test `motivicGalois_twist_character`: under the equivalence with representations,
`1(-1)` is a one-dimensional representation of `G_mot`, a character. -/
example (Hs : PairDiagram.PairHomology) :
    Module.finrank ℚ ((NoriMotives.fibre Hs).obj (NoriMotives.twist Hs)) = 1 ∧
      ∀ v, Diagram.category.coaction (PairDiagram.noriRep Hs) (NoriMotives.twist Hs) v =
        v ⊗ₜ MotivicGalois.twistCharacter Hs := sorry

/-- Unit test `tensorAutGroup_two_fibre_functors`: the group depends on the fibre functor and is
not identified across fibre functors by the construction: on the one-vertex diagram the
representations `ℚ` and `ℚ²` give coalgebras of dimensions `1` and `4`. -/
example :
    Module.finrank ℚ (Diagram.Rep.single.{0} (FGModuleCat.of ℚ ℚ)).coalgebra ≠
      Module.finrank ℚ (Diagram.Rep.single.{0} (FGModuleCat.of ℚ (Fin 2 → ℚ))).coalgebra := sorry

/-! ### The comparison algebra (MC.6/comparison-algebra) -/

namespace Diagram.Rep

variable {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k))

/-- `Hom(T₁|F, T₂|F)`: families of linear maps `T₁(p) ⟶ T₂(p)`, `p ∈ F`, commuting with the edges
of `F`. -/
def homSpace (S : Finset D.V) : Submodule k ((x : S) → (T₁.obj x.1 →ₗ[k] T₂.obj x.1)) where
  carrier := {φ | ∀ (x y : S) (e : x.1 ⟶ y.1), φ y ∘ₗ T₁.linMap e = T₂.linMap e ∘ₗ φ x}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

/-- Restriction `Hom(T₁|F', T₂|F') ⟶ Hom(T₁|F, T₂|F)`. -/
def homRestrict {S S' : Finset D.V} (_ : S ⊆ S') :
    T₁.homSpace T₂ S' →ₗ[k] T₁.homSpace T₂ S := sorry

/-- A tensor isomorphism of graded multiplicative representations: an isomorphism of
representations compatible with the `τ`. -/
def TensorIso {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P) : Type _ :=
  {e : T₁ ≅ T₂ // ∀ f g, (M₁.τ f g).hom ≫ (e.hom.app f ⊗ₘ e.hom.app g) =
    e.hom.app (P.mul f g) ≫ (M₂.τ f g).hom}

/-- The representation extended to a commutative `k`-algebra `R`. -/
def baseChange (T : D.Rep (FGModuleCat.{u} k)) (R : Type u) [CommRing R] [Algebra k R] :
    D.Rep (ModuleCat.{u} R) :=
  T.comp (forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙ ModuleCat.extendScalars (algebraMap k R))

/-- A tensor isomorphism `T₁ ⊗ R ≅ T₂ ⊗ R`. -/
def TensorIsoOver {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P) (R : Type u) [CommRing R] [Algebra k R] : Type _ :=
  {e : T₁.baseChange R ≅ T₂.baseChange R // ∀ f g,
    (forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙ ModuleCat.extendScalars (algebraMap k R)).map
        (M₁.τ f g).hom ≫
      (Functor.Monoidal.μIso (forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙
        ModuleCat.extendScalars (algebraMap k R)) _ _).inv ≫ (e.hom.app f ⊗ₘ e.hom.app g) =
    e.hom.app (P.mul f g) ≫
      (forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙ ModuleCat.extendScalars (algebraMap k R)).map
        (M₂.τ f g).hom ≫
      (Functor.Monoidal.μIso (forget₂ (FGModuleCat.{u} k) (ModuleCat.{u} k) ⋙
        ModuleCat.extendScalars (algebraMap k R)) _ _).inv}

end Diagram.Rep

open scoped Classical in
/-- MC.6/comparison-algebra: `A_{1,2} = colim_F Hom(T₁|F, T₂|F)^∨`. -/
def ComparisonAlgebra {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k)) :
    Type (max u v) :=
  Module.DirectLimit (fun S : Finset D.V => Module.Dual k (T₁.homSpace T₂ S))
    (fun _ _ h => (T₁.homRestrict T₂ h).dualMap)

namespace ComparisonAlgebra

variable {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k))

instance : AddCommGroup (ComparisonAlgebra T₁ T₂) := by unfold ComparisonAlgebra; infer_instance

instance : Module k (ComparisonAlgebra T₁ T₂) := by unfold ComparisonAlgebra; infer_instance

open scoped Classical in
/-- The canonical map `Hom(T₁|F, T₂|F)^∨ ⟶ A_{1,2}`. -/
def ofFinite (S : Finset D.V) : Module.Dual k (T₁.homSpace T₂ S) →ₗ[k] ComparisonAlgebra T₁ T₂ :=
  Module.DirectLimit.of k (Finset D.V) (fun S : Finset D.V => Module.Dual k (T₁.homSpace T₂ S))
    (fun _ _ h => (T₁.homRestrict T₂ h).dualMap) S

/-- Every element comes from a finite subdiagram, compatibly with inclusions. -/
theorem exists_finite :
    (∀ a : ComparisonAlgebra T₁ T₂, ∃ (S : Finset D.V) (b : Module.Dual k (T₁.homSpace T₂ S)),
      ofFinite T₁ T₂ S b = a) ∧
    ∀ {S S' : Finset D.V} (h : S ⊆ S'),
      ofFinite T₁ T₂ S' ∘ₗ (T₁.homRestrict T₂ h).dualMap = ofFinite T₁ T₂ S := sorry

variable {T₁ T₂} {G : D.Graded} {P : D.ProductStructure G}

/-- The commutative multiplication of `A_{1,2}` induced by the tensor structures; it needs the
graded multiplicative structures of both representations (finding E36). -/
abbrev mul (_ : T₁.GradedMultiplicative G P) (_ : T₂.GradedMultiplicative G P) :
    CommRing (ComparisonAlgebra T₁ T₂) := sorry

/-- The `k`-algebra structure. -/
abbrev algebra (M₁ : T₁.GradedMultiplicative G P) (M₂ : T₂.GradedMultiplicative G P) :
    letI := mul M₁ M₂; Algebra k (ComparisonAlgebra T₁ T₂) := sorry

variable (T₁ T₂) in
/-- The coaction `A_{1,2} ⟶ A_1 ⊗ A_{1,2}` from composition with `End(T₁|F)`. -/
def comul : ComparisonAlgebra T₁ T₂ →ₗ[k] T₁.coalgebra ⊗[k] ComparisonAlgebra T₁ T₂ := sorry

variable (T₁ T₂) in
/-- The coaction `A_{1,2} ⟶ A_{1,2} ⊗ A_2` from composition with `End(T₂|F)`. -/
def rightCoaction : ComparisonAlgebra T₁ T₂ →ₗ[k] ComparisonAlgebra T₁ T₂ ⊗[k] T₂.coalgebra := sorry

/-- For `T₁ = T₂ = T`, `A_{1,2} = A(D, T)`. -/
def diagonal (T : D.Rep (FGModuleCat.{u} k)) : ComparisonAlgebra T T ≃ₗ[k] T.coalgebra := sorry

/-- The affine heap structure on `X_{1,2} = Spec A_{1,2}`, `(f, g, h) ↦ f ∘ g⁻¹ ∘ h`
(MC.6/iso-torsor). -/
def heap (M₁ : T₁.GradedMultiplicative G P) (M₂ : T₂.GradedMultiplicative G P) :
    letI := mul M₁ M₂; letI := algebra M₁ M₂; AffineHeap k (ComparisonAlgebra T₁ T₂) := sorry

end ComparisonAlgebra

/-- Unit test `ComparisonAlgebra.self`: for `T₁ = T₂ = T`, `A_{1,2}` is `A(D, T)`. -/
example {k : Type u} [Field k] {D : Diagram.{v}} (T : D.Rep (FGModuleCat.{u} k)) :
    Nonempty (ComparisonAlgebra T T ≃ₗ[k] T.coalgebra) := sorry

/-- Unit test `ComparisonAlgebra.finite_single`: for one vertex `p` with only its identity edge,
`Hom(T₁|F, T₂|F)^∨ = T₁(p) ⊗ T₂(p)^∨` has dimension `dim T₁(p) · dim T₂(p)`. -/
example (k : Type) [Field k] (V₁ V₂ : FGModuleCat.{0} k) :
    Module.finrank k (Module.Dual k ((Diagram.Rep.single.{0} V₁).homSpace
      (Diagram.Rep.single.{0} V₂) Finset.univ)) = Module.finrank k V₁ * Module.finrank k V₂ :=
  sorry

/-- Unit test `ComparisonAlgebra.unit_diagram`: for the unit vertex alone with
`T₁(1) = T₂(1) = ℚ`, `A_{1,2} = ℚ`. -/
example : Module.finrank ℚ (ComparisonAlgebra (Diagram.Rep.single.{0} (FGModuleCat.of ℚ ℚ))
    (Diagram.Rep.single.{0} (FGModuleCat.of ℚ ℚ))) = 1 := sorry

/-- Unit test `ComparisonAlgebra.exists_finite_test`: every element of `A_{1,2}` is the image of
an element of `Hom(T₁|F, T₂|F)^∨` for some finite subdiagram `F`. -/
example {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k))
    (a : ComparisonAlgebra T₁ T₂) :
    ∃ (S : Finset D.V) (b : Module.Dual k (T₁.homSpace T₂ S)),
      ComparisonAlgebra.ofFinite T₁ T₂ S b = a := sorry

/-- Unit test `ComparisonAlgebra.points_are_isos`: an algebra map `A_{1,2} ⟶ k` is exactly a
tensor isomorphism `T₁ ⟶ T₂` over `k`; `A_{1,2}` has no such point, hence no counit, unless one
is given. -/
example {k : Type u} [Field k] {D : Diagram.{v}} {T₁ T₂ : D.Rep (FGModuleCat.{u} k)}
    {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    Nonempty ((ComparisonAlgebra T₁ T₂ →ₐ[k] k) ≃ Diagram.Rep.TensorIso T₁ T₂ M₁ M₂) := sorry

/-! ### The space of periods of a diagram (MC.6/period-space-of-a-diagram) -/

open scoped Classical in
/-- MC.6/period-space-of-a-diagram: the space generated by the symbols `(p, ω, γ)`,
`ω ∈ T₁(p)`, `γ ∈ T₂(p)^∨`, linear in `ω` and `γ` (the tensor product), modulo the change of
variables `(p', T₁(f)ω, γ) = (p, ω, T₂(f)^∨ γ)` for every edge `f : p ⟶ p'`. -/
def PeriodSpace {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k)) :
    Type (max u v) :=
  (DirectSum D.V fun p => T₁.obj p ⊗[k] Module.Dual k (T₂.obj p)) ⧸
    Submodule.span k {r | ∃ (p p' : D.V) (f : p ⟶ p') (ω : T₁.obj p)
      (γ : Module.Dual k (T₂.obj p')),
      r = DirectSum.lof k D.V (fun p => T₁.obj p ⊗[k] Module.Dual k (T₂.obj p)) p'
          (T₁.linMap f ω ⊗ₜ γ) -
        DirectSum.lof k D.V (fun p => T₁.obj p ⊗[k] Module.Dual k (T₂.obj p)) p
          (ω ⊗ₜ (T₂.linMap f).dualMap γ)}

namespace PeriodSpace

variable {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k))

instance : AddCommGroup (PeriodSpace T₁ T₂) := by unfold PeriodSpace; infer_instance

instance : Module k (PeriodSpace T₁ T₂) := by unfold PeriodSpace; infer_instance

open scoped Classical in
/-- The generator `(p, ω, γ)`. -/
def gen (p : D.V) (ω : T₁.obj p) (γ : Module.Dual k (T₂.obj p)) : PeriodSpace T₁ T₂ :=
  Submodule.Quotient.mk (DirectSum.lof k D.V (fun p => T₁.obj p ⊗[k] Module.Dual k (T₂.obj p)) p
    (ω ⊗ₜ γ))

/-- The two families of relations: linearity in each entry and change of variables. -/
theorem relations :
    (∀ (p : D.V) (ω ω' : T₁.obj p) (γ : Module.Dual k (T₂.obj p)),
      gen T₁ T₂ p (ω + ω') γ = gen T₁ T₂ p ω γ + gen T₁ T₂ p ω' γ) ∧
    (∀ (p : D.V) (ω : T₁.obj p) (γ γ' : Module.Dual k (T₂.obj p)),
      gen T₁ T₂ p ω (γ + γ') = gen T₁ T₂ p ω γ + gen T₁ T₂ p ω γ') ∧
    ∀ {p p' : D.V} (f : p ⟶ p') (ω : T₁.obj p) (γ : Module.Dual k (T₂.obj p')),
      gen T₁ T₂ p' (T₁.linMap f ω) γ = gen T₁ T₂ p ω ((T₂.linMap f).dualMap γ) := sorry

variable {T₁ T₂} {G : D.Graded} {P : D.ProductStructure G}

/-- The commutative multiplication on generators, by the product of vertices and the tensor
products of the entries (for unital graded multiplicative representations, finding E36). -/
abbrev mul (_ : T₁.GradedMultiplicative G P) (_ : T₂.GradedMultiplicative G P) :
    CommRing (PeriodSpace T₁ T₂) := sorry

/-- The `k`-algebra structure. -/
abbrev algebra (M₁ : T₁.GradedMultiplicative G P) (M₂ : T₂.GradedMultiplicative G P) :
    letI := mul M₁ M₂; Algebra k (PeriodSpace T₁ T₂) := sorry

/-- The natural algebra map `Ψ` to the comparison algebra, `(p, ω, γ) ↦ (φ ↦ γ(φ(p)(ω)))`. -/
def toComparison (M₁ : T₁.GradedMultiplicative G P) (M₂ : T₂.GradedMultiplicative G P) :
    letI := mul M₁ M₂; letI := algebra M₁ M₂
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    PeriodSpace T₁ T₂ →ₐ[k] ComparisonAlgebra T₁ T₂ := sorry

end PeriodSpace

/-- Unit test `PeriodSpace.linearity`: the generator is linear in each of its two entries. -/
example {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k)) (p : D.V)
    (a : k) (ω ω' : T₁.obj p) (γ γ' : Module.Dual k (T₂.obj p)) :
    PeriodSpace.gen T₁ T₂ p (a • ω + ω') γ =
        a • PeriodSpace.gen T₁ T₂ p ω γ + PeriodSpace.gen T₁ T₂ p ω' γ ∧
      PeriodSpace.gen T₁ T₂ p ω (a • γ + γ') =
        a • PeriodSpace.gen T₁ T₂ p ω γ + PeriodSpace.gen T₁ T₂ p ω γ' := sorry

/-- Unit test `PeriodSpace.change_of_variables`: for an edge `f : p ⟶ p'`,
`(p', T₁(f)ω, γ) = (p, ω, T₂(f)^∨ γ)`. -/
example {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k)) {p p' : D.V}
    (f : p ⟶ p') (ω : T₁.obj p) (γ : Module.Dual k (T₂.obj p')) :
    PeriodSpace.gen T₁ T₂ p' (T₁.linMap f ω) γ =
      PeriodSpace.gen T₁ T₂ p ω ((T₂.linMap f).dualMap γ) := sorry

/-- Unit test `PeriodSpace.multiplication_on_generators`: the product of two generators is the
generator at the product vertex with the tensor products of the entries (through `τ`). -/
example {k : Type u} [Field k] {D : Diagram.{v}} {T₁ T₂ : D.Rep (FGModuleCat.{u} k)}
    {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P) (p q : D.V) (ω : T₁.obj p) (ω' : T₁.obj q)
    (γ : Module.Dual k (T₂.obj p)) (γ' : Module.Dual k (T₂.obj q)) :
    letI := PeriodSpace.mul M₁ M₂
    PeriodSpace.gen T₁ T₂ p ω γ * PeriodSpace.gen T₁ T₂ q ω' γ' =
      PeriodSpace.gen T₁ T₂ (P.mul p q) ((M₁.τ p q).inv.hom.hom (ω ⊗ₜ ω'))
        ((TensorProduct.lid k k).toLinearMap ∘ₗ TensorProduct.map γ γ' ∘ₗ
          (M₂.τ p q).hom.hom.hom) := sorry

/-- Unit test `PeriodSpace.single_vertex`: for one vertex `p` with its identity edge the space of
periods is `T₁(p) ⊗ T₂(p)^∨`. -/
example (k : Type) [Field k] (V₁ V₂ : FGModuleCat.{0} k) :
    Nonempty (PeriodSpace (Diagram.Rep.single.{0} V₁) (Diagram.Rep.single.{0} V₂) ≃ₗ[k]
      V₁ ⊗[k] Module.Dual k V₂) := sorry

/-- MC.6/periods-equal-comparison-algebra: the natural map from the space of periods to the
comparison algebra is an isomorphism of algebras (stated over a field; the Dedekind case with
projective modules is not stated). -/
theorem period_eq_comparison {k : Type u} [Field k] {D : Diagram.{v}}
    {T₁ T₂ : D.Rep (FGModuleCat.{u} k)} {G : D.Graded} {P : D.ProductStructure G}
    (M₁ : T₁.GradedMultiplicative G P) (M₂ : T₂.GradedMultiplicative G P) :
    letI := PeriodSpace.mul M₁ M₂; letI := PeriodSpace.algebra M₁ M₂
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    ∃ e : PeriodSpace T₁ T₂ ≃ₐ[k] ComparisonAlgebra T₁ T₂,
      e.toAlgHom = PeriodSpace.toComparison M₁ M₂ := sorry

/-! ### Fibre functors and tensor isomorphisms -/

/-- MC.6/fibre-functor-extension: if `T₁ ⊗ K ≅ T₂ ⊗ K` as representations for a field `K ⊇ k`,
then `T₂` extends to a fibre functor (faithful, exact, `k`-linear) on `C(T₁)`; if the isomorphism
is a tensor isomorphism, given as a `K`-point of `A_{1,2}` for unital graded multiplicative
`T₁`, `T₂` (finding E36), the extension is a tensor functor. The universal property of
`C(T₁)` is used as stated in HMS Proposition B.8 (gap). -/
theorem fibre_extension {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k))
    (K : Type u) [Field K] [Algebra k K] (φ : T₁.baseChange K ≅ T₂.baseChange K) :
    (∃ F : Diagram.category T₁ ⥤ FGModuleCat.{u} k, F.Faithful ∧ F.Additive ∧ F.Linear k ∧
      PreservesFiniteLimits F ∧ PreservesFiniteColimits F ∧
      Nonempty ((Diagram.category.ofRep T₁).comp F ≅ T₂)) ∧
    ∀ {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
      (M₂ : T₂.GradedMultiplicative G P),
      letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
      ∀ _ : ComparisonAlgebra T₁ T₂ →ₐ[k] K,
        letI := Diagram.category.monoidal M₁
        ∃ F : Diagram.category T₁ ⥤ FGModuleCat.{u} k, F.Faithful ∧
          Nonempty ((Diagram.category.ofRep T₁).comp F ≅ T₂) ∧ Nonempty F.Monoidal := sorry

/-- MC.6/tensor-iso-scheme: the affine scheme `X_{1,2} = Spec A_{1,2}` of tensor isomorphisms from
`T₁` to `T₂`, given by its ring of functions. -/
abbrev TensorIsoScheme {k : Type u} [Field k] {D : Diagram.{v}} (T₁ T₂ : D.Rep (FGModuleCat.{u} k)) :
    Type (max u v) := ComparisonAlgebra T₁ T₂

namespace TensorIsoScheme

variable {k : Type u} [Field k] {D : Diagram.{v}} {T₁ T₂ : D.Rep (FGModuleCat.{u} k)}
  {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
  (M₂ : T₂.GradedMultiplicative G P)

/-- The `R`-points of `X_{1,2}` are the tensor isomorphisms `T₁ ⊗ R ≅ T₂ ⊗ R`. -/
def represents (R : Type u) [CommRing R] [Algebra k R] :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    (TensorIsoScheme T₁ T₂ →ₐ[k] R) ≃ Diagram.Rep.TensorIsoOver T₁ T₂ M₁ M₂ R := sorry

/-- `G₁ × X_{1,2} ⟶ X_{1,2}`, composition, dually a coaction of `A₁`. -/
def compLeft (hU₁ : M₁.Unital) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    letI := T₁.coalgebraCommRing M₁; letI := T₁.bialgebra M₁ hU₁
    TensorIsoScheme T₁ T₂ →ₐ[k] T₁.coalgebra ⊗[k] TensorIsoScheme T₁ T₂ := sorry

/-- `X_{1,2} × G₂ ⟶ X_{1,2}`, composition, dually a coaction of `A₂`. -/
def compRight (hU₂ : M₂.Unital) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    letI := T₂.coalgebraCommRing M₂; letI := T₂.bialgebra M₂ hU₂
    TensorIsoScheme T₁ T₂ →ₐ[k] TensorIsoScheme T₁ T₂ ⊗[k] T₂.coalgebra := sorry

/-- `X_{1,2} × X_{2,1} ⟶ G₁`, composition. -/
def toAut (hU₁ : M₁.Unital) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    letI := ComparisonAlgebra.mul M₂ M₁; letI := ComparisonAlgebra.algebra M₂ M₁
    letI := T₁.coalgebraCommRing M₁; letI := T₁.bialgebra M₁ hU₁
    T₁.coalgebra →ₐ[k] TensorIsoScheme T₁ T₂ ⊗[k] TensorIsoScheme T₂ T₁ := sorry

/-- For `T₁ = T₂ = T`, `X_{1,1}` is the group scheme `G(T)`. -/
def self (M : T₁.GradedMultiplicative G P) (hU : M.Unital) :
    letI := ComparisonAlgebra.mul M M; letI := ComparisonAlgebra.algebra M M
    letI := T₁.coalgebraCommRing M; letI := T₁.bialgebra M hU
    TensorIsoScheme T₁ T₁ ≃ₐ[k] T₁.coalgebra := sorry

/-- Base change along `R ⟶ R'` on points. -/
def map {R R' : Type u} [CommRing R] [Algebra k R] [CommRing R'] [Algebra k R']
    (e : R →ₐ[k] R') :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    (TensorIsoScheme T₁ T₂ →ₐ[k] R) → (TensorIsoScheme T₁ T₂ →ₐ[k] R') :=
  letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
  fun x => e.comp x

/-- Base change on points is compatible with composition. -/
theorem map_comp {R R' R'' : Type u} [CommRing R] [Algebra k R] [CommRing R'] [Algebra k R']
    [CommRing R''] [Algebra k R''] (e : R →ₐ[k] R') (e' : R' →ₐ[k] R'') :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    ∀ x : TensorIsoScheme T₁ T₂ →ₐ[k] R, map M₁ M₂ (e'.comp e) x = map M₁ M₂ e' (map M₁ M₂ e x) :=
  sorry

end TensorIsoScheme

/-- Unit test `TensorIsoScheme.self_test`: for `T₁ = T₂ = T`, `X_{1,1} = G(T) = Spec A(D, T)`. -/
example {k : Type u} [Field k] {D : Diagram.{v}} {T : D.Rep (FGModuleCat.{u} k)} {G : D.Graded}
    {P : D.ProductStructure G} (M : T.GradedMultiplicative G P) (hU : M.Unital) :
    letI := ComparisonAlgebra.mul M M; letI := ComparisonAlgebra.algebra M M
    letI := T.coalgebraCommRing M; letI := T.bialgebra M hU
    Nonempty (TensorIsoScheme T T ≃ₐ[k] T.coalgebra) := sorry

/-- Unit test `TensorIsoScheme.points_Q`: a `ℚ`-point of `X_{1,2}` is a tensor isomorphism
`T₁ ⟶ T₂` over `ℚ`, and the scheme has one exactly when such an isomorphism exists. -/
example {D : Diagram.{0}} {T₁ T₂ : D.Rep (FGModuleCat.{0} ℚ)} {G : D.Graded}
    {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    Nonempty ((TensorIsoScheme T₁ T₂ →ₐ[ℚ] ℚ) ≃ Diagram.Rep.TensorIso T₁ T₂ M₁ M₂) ∧
      (Nonempty (TensorIsoScheme T₁ T₂ →ₐ[ℚ] ℚ) ↔ Nonempty (Diagram.Rep.TensorIso T₁ T₂ M₁ M₂)) :=
  sorry

/-- Unit test `TensorIsoScheme.compose_inverse`: for a point `f` of `X_{1,2}`, composing with the
point `f⁻¹` of `X_{2,1}` gives the unit point of `G₁`. -/
example {D : Diagram.{0}} {T₁ T₂ : D.Rep (FGModuleCat.{0} ℚ)} {G : D.Graded}
    {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P) (hU₁ : M₁.Unital) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    letI := ComparisonAlgebra.mul M₂ M₁; letI := ComparisonAlgebra.algebra M₂ M₁
    letI := T₁.coalgebraCommRing M₁; letI := T₁.bialgebra M₁ hU₁
    ∀ f : TensorIsoScheme T₁ T₂ →ₐ[ℚ] ℚ, ∃ g : TensorIsoScheme T₂ T₁ →ₐ[ℚ] ℚ,
      (Algebra.TensorProduct.productMap f g).comp (TensorIsoScheme.toAut M₁ M₂ hU₁) =
        Bialgebra.counitAlgHom ℚ T₁.coalgebra := sorry

/-- Unit test `TensorIsoScheme.not_group`: `X_{1,2}` carries no group structure of its own; for
the one-vertex representations `ℚ` and `ℚ²`, which are not isomorphic, it has no rational point,
so no unit. -/
example (G : Diagram.single.{0}.Graded) (P : Diagram.single.{0}.ProductStructure G)
    (M₁ : (Diagram.Rep.single.{0} (FGModuleCat.of ℚ ℚ)).GradedMultiplicative G P)
    (M₂ : (Diagram.Rep.single.{0} (FGModuleCat.of ℚ (Fin 2 → ℚ))).GradedMultiplicative G P) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    IsEmpty (TensorIsoScheme (Diagram.Rep.single.{0} (FGModuleCat.of ℚ ℚ))
      (Diagram.Rep.single.{0} (FGModuleCat.of ℚ (Fin 2 → ℚ))) →ₐ[ℚ] ℚ) := sorry

/-- MC.6/iso-torsor: inversion is an isomorphism `X_{1,2} ≅ X_{2,1}`, and `(f, g, h) ↦ f ∘ g⁻¹ ∘ h`
makes `X_{1,2}` an affine heap (`ComparisonAlgebra.heap`): on `R`-points it is the composite of
the tensor isomorphisms. `C(T₁)` is assumed rigid. -/
theorem iso_torsor {k : Type u} [Field k] {D : Diagram.{u}} {T₁ T₂ : D.Rep (FGModuleCat.{u} k)}
    {G : D.Graded} {P : D.ProductStructure G} (M₁ : T₁.GradedMultiplicative G P)
    (M₂ : T₂.GradedMultiplicative G P)
    (hrig : letI := Diagram.category.monoidal M₁; Nonempty (RigidCategory (Diagram.category T₁))) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    letI := ComparisonAlgebra.mul M₂ M₁; letI := ComparisonAlgebra.algebra M₂ M₁
    Nonempty (ComparisonAlgebra T₁ T₂ ≃ₐ[k] ComparisonAlgebra T₂ T₁) ∧
    ∀ (R : Type u) [CommRing R] [Algebra k R] (x y z : ComparisonAlgebra T₁ T₂ →ₐ[k] R),
      (TensorIsoScheme.represents M₁ M₂ R
          (AffineHeap.pointsOp (ComparisonAlgebra.heap M₁ M₂).op x y z)).1 =
        (TensorIsoScheme.represents M₁ M₂ R z).1 ≪≫ (TensorIsoScheme.represents M₁ M₂ R y).1.symm ≪≫
          (TensorIsoScheme.represents M₁ M₂ R x).1 := sorry

/-- MC.6/tensor-iso-torsor, for `C = C(T)` with `A(T)` Hopf (which covers the neutral Tannakian
categories of this packet): for a fibre functor `η` on `C(T)` with values in finitely generated
projective `R`-modules, every tensor morphism `f_T ⊗ R ⟶ η` is an isomorphism, and the functor
`Hom⊗(f_T, η)` on `R`-algebras is represented by a faithfully flat `R`-algebra. The torsor
structure under `G(T)` is not stated. -/
theorem tensor_iso_torsor {k : Type u} [Field k] {D : Diagram.{v}} {T : D.Rep (FGModuleCat.{u} k)}
    {G : D.Graded} {P : D.ProductStructure G} (M : T.GradedMultiplicative G P) (hU : M.Unital)
    (hrig : letI := Diagram.category.monoidal M; Nonempty (RigidCategory (Diagram.category T)))
    (R : Type u) [CommRing R] [Algebra k R] (η : Diagram.category T ⥤ ModuleCat.{u} R)
    [η.Faithful] [PreservesFiniteLimits η] [PreservesFiniteColimits η]
    (hη : ∀ X, Module.Projective R (η.obj X) ∧ Module.Finite R (η.obj X)) :
    letI := Diagram.category.monoidal M; letI := DiagramCategory.fibreBaseChange.monoidal M R
    ∀ [η.Monoidal],
      (∀ τ : DiagramCategory.fibreBaseChange T R ⟶ η, NatTrans.IsMonoidal τ → IsIso τ) ∧
      ∃ (B : Type u) (_ : CommRing B) (_ : Algebra R B), Module.FaithfullyFlat R B ∧
        ∀ (S : Type u) [CommRing S] [Algebra R S],
          letI : Algebra k S := ((algebraMap R S).comp (algebraMap k R)).toAlgebra
          letI := DiagramCategory.fibreBaseChange.monoidal M S
          Nonempty ((B →ₐ[R] S) ≃
            {τ : DiagramCategory.fibreBaseChange T S ⟶ η ⋙ ModuleCat.extendScalars (algebraMap R S) //
              NatTrans.IsMonoidal τ}) := sorry

/-- MC.6/pro-algebraic-approximation: `A(T)` is the directed union of the finitely generated Hopf
subalgebras `A_F = O(G_F)` over the finite subdiagrams `F`, with faithfully flat transitions
`G_{F'} ⟶ G_F`. -/
theorem pro_algebraic_approximation {k : Type u} [Field k] {D : Diagram.{v}}
    {T : D.Rep (FGModuleCat.{u} k)} {G : D.Graded} {P : D.ProductStructure G}
    (M : T.GradedMultiplicative G P) (hU : M.Unital)
    (hrig : letI := Diagram.category.monoidal M; Nonempty (RigidCategory (Diagram.category T))) :
    letI := T.coalgebraCommRing M; letI := DiagramCategory.tensorAutGroup M hU hrig
    ∃ AF : Finset D.V → Subalgebra k T.coalgebra, Monotone AF ∧ (∀ F, Algebra.FiniteType k (AF F)) ∧
      (⨆ F, AF F) = ⊤ ∧
      (∀ F, ∀ a ∈ AF F, Coalgebra.comul (R := k) a ∈
        LinearMap.range (TensorProduct.map (AF F).val.toLinearMap (AF F).val.toLinearMap)) ∧
      ∀ {F F' : Finset D.V} (h : AF F ≤ AF F'),
        letI := (Subalgebra.inclusion h).toRingHom.toAlgebra
        Module.FaithfullyFlat (AF F) (AF F') := sorry

/-! ### Formal periods (MC.6/formal-periods) -/

namespace PairDiagram

open AlgebraicGeometry TopologicalSpace

/-- SchemeAndStackFoundations SF.2 and SF.6 (and ComplexComparisonPartII:C5): relative algebraic
de Rham cohomology `H^d_dR(X, Y)` of pairs of varieties over `ℚ`, with pullback, the connecting
maps of triples and the exterior product; the cross product in singular homology; the classes
`1`, `[pt]`, `dX/X` and `[S¹]`; and the comparison isomorphism
`H^d_dR(X, Y) ⊗ ℂ ≅ H^d(X(ℂ), Y(ℂ); ℚ) ⊗ ℂ`, natural for maps of pairs and compatible with the
connecting maps. -/
structure PeriodData (Hs : PairHomology) where
  /-- `H^d_dR(X, Y)`. -/
  HdR : ∀ (X : Var) (_ : Closeds X.obj.left), ℤ → Type
  [addCommGroup : ∀ X Y d, AddCommGroup (HdR X Y d)]
  [module : ∀ X Y d, Module ℚ (HdR X Y d)]
  [finiteDimensional : ∀ X Y d, FiniteDimensional ℚ (HdR X Y d)]
  /-- Pullback along a map of pairs. -/
  pullback : ∀ {X X' : Var} {Y : Closeds X.obj.left} {Y' : Closeds X'.obj.left} (f : X ⟶ X'),
    Set.MapsTo f.hom.left Y Y' → ∀ d, HdR X' Y' d →ₗ[ℚ] HdR X Y d
  /-- The connecting map `δ : H^d_dR(Y, Z) ⟶ H^{d+1}_dR(X, Y)` of a triple. -/
  delta : ∀ {X V : Var} (ι : V ⟶ X), IsClosedImmersion ι.hom.left →
    ∀ (Z : Closeds V.obj.left) (d : ℤ), HdR V Z d →ₗ[ℚ] HdR X (closedImage ι ⊤) (d + 1)
  /-- The exterior product `ω ∧ ω'` on the product pair. -/
  wedge : ∀ a b : Vertex, HdR a.X a.Y a.i →ₗ[ℚ] HdR b.X b.Y b.i →ₗ[ℚ]
    HdR (vertexProduct a b).X (vertexProduct a b).Y (a.i + b.i)
  /-- The cross product `γ × γ'` in relative singular homology. -/
  cross : ∀ a b : Vertex, Hs.H a.X a.Y a.i →ₗ[ℚ] Hs.H b.X b.Y b.i →ₗ[ℚ]
    Hs.H (vertexProduct a b).X (vertexProduct a b).Y (a.i + b.i)
  /-- `1 ∈ H^0_dR(Spec ℚ, ∅)`. -/
  one : HdR Var.pt ⊥ 0
  /-- The class of the point in `H_0(pt, ∅)`. -/
  pointClass : Hs.H Var.pt ⊥ 0
  /-- `dX/X ∈ H^1_dR(𝔾_m, {1})`. -/
  dlog : HdR Var.gm Var.gmOne 1
  /-- The class of the unit circle in `H_1(ℂ^*, {1}; ℚ)`. -/
  circle : Hs.H Var.gm Var.gmOne 1
  /-- The comparison isomorphism (SF.6). -/
  comparison : ∀ v : Vertex,
    ℂ ⊗[ℚ] HdR v.X v.Y v.i ≃ₗ[ℂ] ℂ ⊗[ℚ] Module.Dual ℚ (Hs.H v.X v.Y v.i)
  comparison_natural : ∀ {X X' : Var} {Y : Closeds X.obj.left} {Y' : Closeds X'.obj.left}
    (f : X ⟶ X') (hf : Set.MapsTo f.hom.left Y Y') (i : ℤ) (ω : HdR X' Y' i),
    comparison ⟨X, Y, i⟩ (1 ⊗ₜ pullback f hf i ω) =
      LinearMap.baseChange ℂ (Hs.pushforward f hf i).dualMap (comparison ⟨X', Y', i⟩ (1 ⊗ₜ ω))

attribute [instance] PeriodData.addCommGroup PeriodData.module PeriodData.finiteDimensional

variable {Hs : PairHomology} (dR : PeriodData Hs)

/-- The edge maps of de Rham cohomology of pairs. -/
def deRhamRepMap : ∀ {x y : Vertex}, Edge x y →
    (FGModuleCat.of ℚ (dR.HdR x.X x.Y x.i) ⟶ FGModuleCat.of ℚ (dR.HdR y.X y.Y y.i))
  | _, _, .pullback f hf i => FGModuleCat.ofHom (dR.pullback f hf i)
  | _, _, .coboundary ι hι Z i => FGModuleCat.ofHom (dR.delta ι hι Z i)

/-- Algebraic de Rham cohomology `H^*_dR` as a representation of `D^eff`. -/
def deRhamRep : eff.Rep (FGModuleCat.{0} ℚ) where
  obj v := FGModuleCat.of ℚ (dR.HdR v.X v.Y v.i)
  map e := deRhamRepMap dR e
  map_loop := sorry

end PairDiagram

namespace FormalPeriods

open PairDiagram AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology) (dR : PeriodData Hs)

open scoped Classical in
/-- MC.6/formal-periods: the effective formal periods `P⁺`, generated by `(X, D, ω, γ)` with
`ω ∈ H^d_dR(X, D)` and `γ ∈ H_d(X(ℂ), D(ℂ), ℚ)`, linear in `ω` and `γ` (the tensor product),
modulo (2) `(X, D, f^*ω', γ) = (X', D', ω', f_*γ)` for maps of pairs and (3)
`(Y, Z, ω, ∂γ) = (X, Y, δω, γ)` for triples. -/
def eff : Type 1 :=
  (DirectSum Vertex fun v => dR.HdR v.X v.Y v.i ⊗[ℚ] Hs.H v.X v.Y v.i) ⧸
    Submodule.span ℚ ({r | ∃ (X X' : Var) (Y : Closeds X.obj.left) (Y' : Closeds X'.obj.left)
      (f : X ⟶ X') (hf : Set.MapsTo f.hom.left Y Y') (d : ℤ) (ω' : dR.HdR X' Y' d)
      (γ : Hs.H X Y d),
      r = DirectSum.lof ℚ Vertex (fun v => dR.HdR v.X v.Y v.i ⊗[ℚ] Hs.H v.X v.Y v.i) ⟨X, Y, d⟩
          (dR.pullback f hf d ω' ⊗ₜ γ) -
        DirectSum.lof ℚ Vertex (fun v => dR.HdR v.X v.Y v.i ⊗[ℚ] Hs.H v.X v.Y v.i) ⟨X', Y', d⟩
          (ω' ⊗ₜ Hs.pushforward f hf d γ)} ∪
    {r | ∃ (X V : Var) (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left) (Z : Closeds V.obj.left)
      (d : ℤ) (ω : dR.HdR V Z d) (γ : Hs.H X (closedImage ι ⊤) (d + 1)),
      r = DirectSum.lof ℚ Vertex (fun v => dR.HdR v.X v.Y v.i ⊗[ℚ] Hs.H v.X v.Y v.i) ⟨V, Z, d⟩
          (ω ⊗ₜ Hs.boundary ι hι Z d γ) -
        DirectSum.lof ℚ Vertex (fun v => dR.HdR v.X v.Y v.i ⊗[ℚ] Hs.H v.X v.Y v.i)
          ⟨X, closedImage ι ⊤, d + 1⟩ (dR.delta ι hι Z d ω ⊗ₜ γ)})

/-- The commutative ring structure of `P⁺`, by the product of pairs with the exterior products
of the entries. -/
instance eff.instCommRing : CommRing (eff Hs dR) := sorry

instance eff.instAlgebra : Algebra ℚ (eff Hs dR) := sorry

open scoped Classical in
/-- The generator `(X, D, ω, γ)` of `P⁺`. -/
def gen (v : Vertex) (ω : dR.HdR v.X v.Y v.i) (γ : Hs.H v.X v.Y v.i) : eff Hs dR :=
  Submodule.Quotient.mk (DirectSum.lof ℚ Vertex
    (fun v => dR.HdR v.X v.Y v.i ⊗[ℚ] Hs.H v.X v.Y v.i) v (ω ⊗ₜ γ))

/-- The formal period `2πi = (𝔾_m, {1}, dX/X, S¹)`. -/
def twoPiI : eff Hs dR := gen Hs dR gmVertex dR.dlog dR.circle

end FormalPeriods

open FormalPeriods in
/-- The algebra `P` of formal periods, the localisation of `P⁺` at `2πi`. -/
abbrev FormalPeriods (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs) : Type 1 :=
  Localization.Away (twoPiI Hs dR)

namespace FormalPeriods

open PairDiagram AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology) (dR : PeriodData Hs)

/-- The localisation map `P⁺ ⟶ P`. -/
def ofEff : eff Hs dR →+* FormalPeriods Hs dR := algebraMap _ _

/-- The generator is linear in `ω` and in `γ`. -/
theorem gen_add_left (v : Vertex) (ω ω' : dR.HdR v.X v.Y v.i) (γ γ' : Hs.H v.X v.Y v.i) :
    gen Hs dR v (ω + ω') γ = gen Hs dR v ω γ + gen Hs dR v ω' γ ∧
      gen Hs dR v ω (γ + γ') = gen Hs dR v ω γ + gen Hs dR v ω γ' := sorry

/-- Relation (2): `gen(X, D, f^*ω', γ) = gen(X', D', ω', f_*γ)` for `f : X ⟶ X'` with
`f(D) ⊆ D'`. -/
theorem gen_pullback {X X' : Var} {Y : Closeds X.obj.left} {Y' : Closeds X'.obj.left}
    (f : X ⟶ X') (hf : Set.MapsTo f.hom.left Y Y') (d : ℤ) (ω' : dR.HdR X' Y' d)
    (γ : Hs.H X Y d) :
    gen Hs dR ⟨X, Y, d⟩ (dR.pullback f hf d ω') γ =
      gen Hs dR ⟨X', Y', d⟩ ω' (Hs.pushforward f hf d γ) := sorry

/-- Relation (3): `gen(Y, Z, ω, ∂γ) = gen(X, Y, δω, γ)` for `Z ⊆ Y ⊆ X`. -/
theorem gen_boundary {X V : Var} (ι : V ⟶ X) (hι : IsClosedImmersion ι.hom.left)
    (Z : Closeds V.obj.left) (d : ℤ) (ω : dR.HdR V Z d) (γ : Hs.H X (closedImage ι ⊤) (d + 1)) :
    gen Hs dR ⟨V, Z, d⟩ ω (Hs.boundary ι hι Z d γ) =
      gen Hs dR ⟨X, closedImage ι ⊤, d + 1⟩ (dR.delta ι hι Z d ω) γ := sorry

/-- `gen(X, D, ω, γ) · gen(X', D', ω', γ') = gen(X × X', D × X' ∪ X × D', ω ∧ ω', γ × γ')`. -/
theorem mul_gen (a b : Vertex) (ω : dR.HdR a.X a.Y a.i) (γ : Hs.H a.X a.Y a.i)
    (ω' : dR.HdR b.X b.Y b.i) (γ' : Hs.H b.X b.Y b.i) :
    gen Hs dR a ω γ * gen Hs dR b ω' γ' =
      gen Hs dR (vertexProduct a b) (dR.wedge a b ω ω') (dR.cross a b γ γ') := sorry

end FormalPeriods

/-- Unit test `FormalPeriods.twoPiI_isUnit`: the formal period of `(𝔾_m, {1}, dX/X, S¹)` is a
unit in `P`. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs) :
    IsUnit (FormalPeriods.ofEff Hs dR (FormalPeriods.twoPiI Hs dR)) := sorry

/-- Unit test `FormalPeriods.gen_pullback_test`: for a morphism of pairs `f`,
`gen(X, D, f^*ω', γ) = gen(X', D', ω', f_*γ)`. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs)
    {X X' : PairDiagram.Var} {Y : TopologicalSpace.Closeds X.obj.left}
    {Y' : TopologicalSpace.Closeds X'.obj.left} (f : X ⟶ X')
    (hf : Set.MapsTo f.hom.left Y Y') (d : ℤ) (ω' : dR.HdR X' Y' d) (γ : Hs.H X Y d) :
    FormalPeriods.gen Hs dR ⟨X, Y, d⟩ (dR.pullback f hf d ω') γ =
      FormalPeriods.gen Hs dR ⟨X', Y', d⟩ ω' (Hs.pushforward f hf d γ) := sorry

/-- Unit test `FormalPeriods.unit`: `gen(Spec ℚ, ∅, 1, [pt])` is the unit of `P⁺`, the pair
`(Spec ℚ, ∅)` in degree `0` being the unit vertex. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs) :
    FormalPeriods.gen Hs dR PairDiagram.ptVertex dR.one dR.pointClass = 1 := sorry

/-- Unit test `FormalPeriods.mul_gen_test`: the product of two generators is the generator of the
product pair, with subvariety `D × X' ∪ X × D'`, form `ω ∧ ω'` and chain `γ × γ'`. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs) (a b : PairDiagram.Vertex)
    (ω : dR.HdR a.X a.Y a.i) (γ : Hs.H a.X a.Y a.i) (ω' : dR.HdR b.X b.Y b.i)
    (γ' : Hs.H b.X b.Y b.i) :
    FormalPeriods.gen Hs dR a ω γ * FormalPeriods.gen Hs dR b ω' γ' =
      FormalPeriods.gen Hs dR (PairDiagram.vertexProduct a b) (dR.wedge a b ω ω')
        (dR.cross a b γ γ') := sorry

/-! ### Formal periods as a comparison algebra, and the period torsor -/

section PeriodTheorems

open PairDiagram AlgebraicGeometry TopologicalSpace

variable (Hs : PairHomology) (dR : PeriodData Hs)

/-- The grading of the good pairs by the parity of the degree. -/
def PairDiagram.goodGrading : (good Hs).Graded := ⟨fun v => (v.1.i : ZMod 2)⟩

/-- De Rham cohomology restricted to the good pairs. -/
def PairDiagram.deRhamGood : (good Hs).Rep (FGModuleCat.{0} ℚ) :=
  (deRhamRep dR).restrict (Diagram.fullSubdiagram.incl eff (IsGood Hs))

/-- MC.6/formal-periods-equal-comparison-algebra: `P⁺` is the space of periods of `H^*_dR` and
`H^*` on `D^eff` (as vector spaces) and, through the good pairs whose graded multiplicative
structures give the ring structures (finding E37), the comparison algebra as `ℚ`-algebras; the
comparison isomorphism plays no part. Stated for effective periods; `P` is the localisation of both
sides at `2πi`. -/
theorem formalPeriods_eq_comparison (P : (good Hs).ProductStructure (goodGrading Hs))
    (M₁ : (deRhamGood Hs dR).GradedMultiplicative (goodGrading Hs) P)
    (M₂ : (goodRep Hs).GradedMultiplicative (goodGrading Hs) P) :
    Nonempty (FormalPeriods.eff Hs dR ≃ₗ[ℚ] PeriodSpace (deRhamRep dR) (singularRep Hs)) ∧
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    Nonempty (FormalPeriods.eff Hs dR ≃ₐ[ℚ] ComparisonAlgebra (deRhamGood Hs dR) (goodRep Hs)) :=
  sorry

/-- MC.6/very-good-pairs-generate-periods: the formal periods are unchanged when generators and
relations are restricted to the diagram of very good pairs. -/
theorem formalPeriods_veryGood :
    Nonempty (PeriodSpace ((deRhamRep dR).restrict (Diagram.fullSubdiagram.incl eff (IsVeryGood Hs)))
      ((singularRep Hs).restrict (Diagram.fullSubdiagram.incl eff (IsVeryGood Hs))) ≃ₗ[ℚ]
      FormalPeriods.eff Hs dR) := sorry

/-- MC.6/period-torsor: `Spec P` is an affine heap (through `P = A_{1,2}`, the heap
`X_{1,2} = Iso⊗(H^*_dR, H^*)` of MC.6/iso-torsor) and a torsor under the motivic Galois group,
acting through a coassociative coaction `P ⟶ A(D_Nori, H^*) ⊗ P` with `P ⊗ P ≅ A ⊗ P`; and `P` is
faithfully flat over `ℚ`. The compatibility of the action with the heap map is not stated. -/
theorem period_torsor :
    letI := MotivicGalois.commRing Hs; letI := MotivicGalois Hs
    Nonempty (AffineHeap ℚ (FormalPeriods Hs dR)) ∧
    ∃ ρ : FormalPeriods Hs dR →ₐ[ℚ] (noriRep Hs).coalgebra ⊗[ℚ] FormalPeriods Hs dR,
      (Algebra.TensorProduct.map (Bialgebra.comulAlgHom ℚ (noriRep Hs).coalgebra)
          (AlgHom.id ℚ (FormalPeriods Hs dR))).comp ρ =
        (Algebra.TensorProduct.assoc ℚ ℚ ℚ (noriRep Hs).coalgebra (noriRep Hs).coalgebra
          (FormalPeriods Hs dR)).symm.toAlgHom.comp
          ((Algebra.TensorProduct.map (AlgHom.id ℚ (noriRep Hs).coalgebra) ρ).comp ρ) ∧
      Function.Bijective (Algebra.TensorProduct.productMap ρ
        (Algebra.TensorProduct.includeRight :
          FormalPeriods Hs dR →ₐ[ℚ] (noriRep Hs).coalgebra ⊗[ℚ] FormalPeriods Hs dR)) ∧
      Module.FaithfullyFlat ℚ (FormalPeriods Hs dR) := sorry

end PeriodTheorems

/-! ### The period point (MC.6/period-point) -/

section PeriodPoint

open PairDiagram

variable (Hs : PairHomology) (dR : PeriodData Hs) (P : (good Hs).ProductStructure (goodGrading Hs))
  (M₁ : (deRhamGood Hs dR).GradedMultiplicative (goodGrading Hs) P)
  (M₂ : (goodRep Hs).GradedMultiplicative (goodGrading Hs) P)

/-- MC.6/period-point: the comparison isomorphism `φ : H^*_dR ⊗ ℂ ≅ H^* ⊗ ℂ` (SF.6) as a complex
point of `X_{1,2} = Iso⊗(H^*_dR, H^*)`, the `ℚ`-algebra map `per : A_{1,2} ⟶ ℂ`,
`(p, ω, γ) ↦ γ(φ_p(ω))`. No rational point of `X_{1,2}` is asserted. -/
def periodPoint :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    ComparisonAlgebra (deRhamGood Hs dR) (goodRep Hs) →ₐ[ℚ] ℂ := sorry

/-- On the class of `(p, ω, γ)` the period point is `γ(φ_p(ω))`. -/
theorem periodPoint_gen (v : (good Hs).V) (ω : (deRhamGood Hs dR).obj v)
    (γ : Module.Dual ℚ ((goodRep Hs).obj v)) :
    letI := PeriodSpace.mul M₁ M₂; letI := PeriodSpace.algebra M₁ M₂
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    periodPoint Hs dR P M₁ M₂ (PeriodSpace.toComparison M₁ M₂ (PeriodSpace.gen _ _ v ω γ)) =
      TensorProduct.AlgebraTensorModule.rid ℚ ℂ ℂ
        (LinearMap.baseChange ℂ γ (dR.comparison v.1 (1 ⊗ₜ ω))) := sorry

/-- The period point is a point of the heap: `per ∘ (heap map)` taken with `per` three times is
`per`. -/
theorem periodPoint_heap :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    AffineHeap.pointsOp (ComparisonAlgebra.heap M₁ M₂).op (periodPoint Hs dR P M₁ M₂)
      (periodPoint Hs dR P M₁ M₂) (periodPoint Hs dR P M₁ M₂) = periodPoint Hs dR P M₁ M₂ := sorry

/-- The composite of the period point with `P = A_{1,2}`: a ring homomorphism `P ⟶ ℂ`, which
PeriodsAndSpecialValues:PS.2 identifies with integration. -/
def periodPoint.formal : FormalPeriods Hs dR →+* ℂ := sorry

/-- On generators, `periodPoint.formal (X, D, ω, γ) = γ(φ(ω))`. -/
theorem periodPoint.formal_gen (v : Vertex) (ω : dR.HdR v.X v.Y v.i) (γ : Hs.H v.X v.Y v.i) :
    periodPoint.formal Hs dR (FormalPeriods.ofEff Hs dR (FormalPeriods.gen Hs dR v ω γ)) =
      TensorProduct.AlgebraTensorModule.rid ℚ ℂ ℂ
        (LinearMap.baseChange ℂ (Module.Dual.eval ℚ _ γ) (dR.comparison v (1 ⊗ₜ ω))) := sorry

/-- Every complex point of `X_{1,2}` is `per` composed with a unique complex point of `G₁`, the
tensor automorphism group of de Rham cohomology. -/
theorem periodPoint_action (hU₁ : M₁.Unital) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    letI := (deRhamGood Hs dR).coalgebraCommRing M₁; letI := (deRhamGood Hs dR).bialgebra M₁ hU₁
    ∀ x : ComparisonAlgebra (deRhamGood Hs dR) (goodRep Hs) →ₐ[ℚ] ℂ,
      ∃! g : (deRhamGood Hs dR).coalgebra →ₐ[ℚ] ℂ,
        x = (Algebra.TensorProduct.productMap g (periodPoint Hs dR P M₁ M₂)).comp
          (TensorIsoScheme.compLeft M₁ M₂ hU₁) := sorry

end PeriodPoint

/-- Unit test `periodPoint_unit`: on the class of the unit vertex `(Spec ℚ, ∅)` in degree `0`
with `ω = 1` and `γ` the class of the point, the value is `1`. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs) :
    periodPoint.formal Hs dR (FormalPeriods.ofEff Hs dR
      (FormalPeriods.gen Hs dR PairDiagram.ptVertex dR.one dR.pointClass)) = 1 := sorry

/-- Unit test `periodPoint_mul`: `per` is multiplicative, the value on a product of two
generators being the product of the values. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs)
    (P : (PairDiagram.good Hs).ProductStructure (PairDiagram.goodGrading Hs))
    (M₁ : (PairDiagram.deRhamGood Hs dR).GradedMultiplicative (PairDiagram.goodGrading Hs) P)
    (M₂ : (PairDiagram.goodRep Hs).GradedMultiplicative (PairDiagram.goodGrading Hs) P) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    ∀ a b : ComparisonAlgebra (PairDiagram.deRhamGood Hs dR) (PairDiagram.goodRep Hs),
      periodPoint Hs dR P M₁ M₂ (a * b) =
        periodPoint Hs dR P M₁ M₂ a * periodPoint Hs dR P M₁ M₂ b := sorry

/-- Unit test `periodPoint_twist_not_rational`: when the comparison is the integration pairing,
the value on `(𝔾_m, {1}, dX/X, S¹)` is `2πi`, which is not real; so the period point does not come
from a rational point. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs)
    (hint : periodPoint.formal Hs dR (FormalPeriods.ofEff Hs dR (FormalPeriods.twoPiI Hs dR)) =
      2 * Real.pi * Complex.I) :
    (periodPoint.formal Hs dR (FormalPeriods.ofEff Hs dR (FormalPeriods.twoPiI Hs dR))).im ≠ 0 ∧
      ¬ ∃ r : ℚ, periodPoint.formal Hs dR
        (FormalPeriods.ofEff Hs dR (FormalPeriods.twoPiI Hs dR)) = r := sorry

/-- Unit test `periodPoint_heap_test`: the heap operation applied to `(φ, φ, φ)` returns `φ`. -/
example (Hs : PairDiagram.PairHomology) (dR : PairDiagram.PeriodData Hs)
    (P : (PairDiagram.good Hs).ProductStructure (PairDiagram.goodGrading Hs))
    (M₁ : (PairDiagram.deRhamGood Hs dR).GradedMultiplicative (PairDiagram.goodGrading Hs) P)
    (M₂ : (PairDiagram.goodRep Hs).GradedMultiplicative (PairDiagram.goodGrading Hs) P) :
    letI := ComparisonAlgebra.mul M₁ M₂; letI := ComparisonAlgebra.algebra M₁ M₂
    AffineHeap.pointsOp (ComparisonAlgebra.heap M₁ M₂).op (periodPoint Hs dR P M₁ M₂)
      (periodPoint Hs dR P M₁ M₂) (periodPoint Hs dR P M₁ M₂) = periodPoint Hs dR P M₁ M₂ := sorry

end MC6
section MC7

open CategoryTheory AlgebraicGeometry Limits TensorProduct MonoidalCategory Opposite

/-! ## MC.7 Standard conjectures, Hodge and Tate conjectures

The conjectures are `Prop`-valued definitions with real bodies; the known cases are recorded
as statements whose proofs are `sorry` (the stage forbids proving a register entry before its
primary proof is acquired). Nothing here assumes a conjecture.

MC.7/motivic-t-structure records that no source read defines a category of mixed motives or a
motivic t-structure; the layer states nothing about one, and no declaration is made for it.
MC.7/bloch-beilinson-filtration-and-murre: only the precise part, Murre's decomposition, is typed
(`MurreDecomposition`); the Bloch–Beilinson filtration and its equivalence with Murre's
conjecture are stated in no source read and are not typed. -/

/-! ### Cycle classes of `F'`-linear cycles -/

section Helpers

variable {k : Type u} [Field k] {C : ChowTheory k} [IsAlgClosed k] {F : Type v} [Field F]
  [CharZero F]

/-- The cycle class of an `F'`-linear cycle on a variety, for a subfield `F'` of the coefficient
field `F` of the Weil data. -/
def WeilData.linCycleMap (W : WeilData C F) (F' : Type*) [Field F'] [Algebra F' F]
    (X : SmVar k) : C.CHF F' X.obj →+ W.H.obj (op X) :=
  (TensorProduct.lift (LinearMap.mk₂ ℤ (fun (c : F') (a : C.CH X.obj) =>
    (algebraMap F' F c) • W.cycleMap X a) sorry sorry sorry sorry)).toAddMonoidHom

/-- Pullback restricted to the degree `n` part. -/
def WeilData.pullbackDeg (W : WeilData C F) {X Y : SmVar k} (f : X ⟶ Y) (n : ℤ) :
    W.grading Y n →ₗ[F] W.grading X n :=
  (W.pullback f).toLinearMap.restrict fun _ hx => W.pullback_grading f n (Submodule.mem_map_of_mem hx)

end Helpers

/-! ### MC.7/kunneth-conjecture-C -/

section ConjectureC

variable {k : Type u} [Field k] {C : ChowTheory k} [IsAlgClosed k] {F : Type v} [Field F]
  [CharZero F] (H : WeilCohomology C F)

/-- The Künneth component `π^j_X ∈ H^{2d}(X × X)`: the component of `γ([Δ_X])` in
`H^{2d-j}(X) ⊗ H^j(X)` under the Künneth isomorphism (B), the convention of
MC.2/kunneth-components. -/
def ConjectureC.kunnethComponent (X : SmVar k) (j : ℤ) : H.toWeilData.H.obj (op (X.prod X)) :=
  H.toWeilData.kunnethMap X X
    (TensorProduct.map
      ((H.toWeilData.grading X (2 * X.dim - j)).subtype ∘ₗ H.toWeilData.gradeProj X (2 * X.dim - j))
      ((H.toWeilData.grading X j).subtype ∘ₗ H.toWeilData.gradeProj X j)
      ((LinearEquiv.ofBijective (H.toWeilData.kunnethMap X X) (H.kunneth X X)).symm
        (H.toWeilData.cycleMap (X.prod X) (C.pushforward (SmProj.diag X.obj) 1))))

/-- MC.7/kunneth-conjecture-C: Conjecture C for the variety `X` relative to the classical Weil
cohomology theory `H`: every Künneth component `π^j_X` is the cycle class of an `F`-linear cycle
of codimension `dim X` on `X × X`. -/
def ConjectureC (X : SmVar k) : Prop :=
  ∀ j : ℤ, ∃ z ∈ C.codimF F (X.prod X).obj X.dim,
    H.toWeilData.linCycleMap F (X.prod X) z = ConjectureC.kunnethComponent H X j

namespace ConjectureC

/-- The Künneth components sum to the class of the diagonal. -/
@[simp] theorem sum_kunnethComponent (X : SmVar k) :
    ∑ j ∈ Finset.range (2 * X.dim + 1), kunnethComponent H X j =
      H.toWeilData.cycleMap (X.prod X) (C.pushforward (SmProj.diag X.obj) 1) := by
  sorry

/-- The numerical class of an `F`-linear cycle of codimension `dim X` on `X × X`, as an
endomorphism of `(X, [Δ], 0)` in the category of numerical motives. -/
def numClass (X : SmVar k) (z : C.CHF F (X.prod X).obj) (_hz : z ∈ C.codimF F (X.prod X).obj X.dim) :
    End (MotiveMod.ofPair F (NumEquiv.adequate C F) X.obj 0) :=
  (Idempotents.toKaroubi _).map
    (Submodule.Quotient.mk ⟨z, sorry⟩ : CorrMod F (NumEquiv.adequate C F) X.obj X.obj (0 - 0))

/-- Under Conjecture C, the numerical class of a cycle representing `π^j_X`. -/
def numProjector {X : SmVar k} (hC : ConjectureC H X) (j : ℤ) :
    End (MotiveMod.ofPair F (NumEquiv.adequate C F) X.obj 0) :=
  numClass X (hC j).choose (hC j).choose_spec.1

/-- The numerical projector does not depend on the cycle chosen to represent `π^j_X`. -/
theorem numProjector_spec {X : SmVar k} (hC : ConjectureC H X) (j : ℤ)
    (z : C.CHF F (X.prod X).obj) (hz : z ∈ C.codimF F (X.prod X).obj X.dim)
    (hγ : H.toWeilData.linCycleMap F (X.prod X) z = kunnethComponent H X j) :
    numClass X z hz = numProjector H hC j := by
  sorry

/-- `π_i π_j = δ_{ij} π_i`, and the `π_j` sum to the diagonal. -/
theorem numProjector_mul {X : SmVar k} (hC : ConjectureC H X) :
    (∀ i j : ℤ, numProjector H hC i * numProjector H hC j =
      if i = j then numProjector H hC i else 0) ∧
    ∑ j ∈ Finset.range (2 * X.dim + 1), numProjector H hC j = 1 := by
  sorry

/-- Each `π_j` is central in the numerical correspondences of degree zero. -/
theorem numProjector_central {X : SmVar k} (hC : ConjectureC H X) (j : ℤ)
    (g : End (MotiveMod.ofPair F (NumEquiv.adequate C F) X.obj 0)) :
    numProjector H hC j * g = g * numProjector H hC j := by
  sorry

end ConjectureC

/-- The general Conjecture C: the assertion for every variety over `k`. -/
def ConjectureC.forall : Prop := ∀ X : SmVar k, ConjectureC H X

/-! #### Unit tests of MC.7/kunneth-conjecture-C -/

section Tests

/-- Unit test `ConjectureC.point`: for `X = Spec k`, `π^0` is the class of the diagonal, which is
algebraic, so the predicate holds. -/
example : ConjectureC.kunnethComponent H (SmVar.point k) 0 =
      H.toWeilData.cycleMap _ (C.pushforward (SmProj.diag (SmProj.point k)) 1) ∧
    ConjectureC H (SmVar.point k) := by
  sorry

/-- Unit test `ConjectureC.projectiveLine`: for `ℙ¹` with a rational point `x`,
`π^0 = γ([x × ℙ¹])` and `π^2 = γ([ℙ¹ × x])` (compare MC.0/projective-line-idempotents), so the
predicate holds. -/
example (x : (SmVar.projectiveLine k).obj.RatPoint) :
    let P := SmVar.projectiveLine k
    ConjectureC.kunnethComponent H P 0 =
        H.toWeilData.cycleMap (P.prod P) (C.pushforward (SmProj.lift (P.obj.toPoint ≫ x) (𝟙 P.obj)) 1) ∧
      ConjectureC.kunnethComponent H P 2 =
        H.toWeilData.cycleMap (P.prod P) (C.pushforward (SmProj.lift (𝟙 P.obj) (P.obj.toPoint ≫ x)) 1) ∧
      ConjectureC H P := by
  sorry

/-- Unit test `ConjectureC.pointedCurve`: for a curve with a rational point `e`, the classes of
`p₀ = [e × X]`, `p₂ = [X × e]` and `p₁ = [Δ] - p₀ - p₂` are the three Künneth components, so the
predicate holds. -/
example (X : SmVar k) (hX : X.dim = 1) (e : X.obj.RatPoint) :
    let p₀ := C.pushforward (SmProj.lift (X.obj.toPoint ≫ e) (𝟙 X.obj)) 1
    let p₂ := C.pushforward (SmProj.lift (𝟙 X.obj) (X.obj.toPoint ≫ e)) 1
    ConjectureC.kunnethComponent H X 0 = H.toWeilData.cycleMap (X.prod X) p₀ ∧
      ConjectureC.kunnethComponent H X 2 = H.toWeilData.cycleMap (X.prod X) p₂ ∧
      ConjectureC.kunnethComponent H X 1 =
        H.toWeilData.cycleMap (X.prod X) (C.pushforward (SmProj.diag X.obj) 1 - p₀ - p₂) ∧
      ConjectureC H X := by
  sorry

/-- Unit test `ConjectureC.theory_is_an_argument`: the predicate is a function of the Weil
cohomology theory `H`; for two theories it is two statements. -/
example : WeilCohomology C F → SmVar k → Prop := fun H X => ConjectureC H X

/-- Unit test `ConjectureC.orthogonal`: under the predicate the numerical projectors satisfy
`π_i π_j = δ_{ij} π_i` and sum to the diagonal. -/
example {X : SmVar k} (hC : ConjectureC H X) :
    (∀ i j : ℤ, ConjectureC.numProjector H hC i * ConjectureC.numProjector H hC j =
      if i = j then ConjectureC.numProjector H hC i else 0) ∧
    ∑ j ∈ Finset.range (2 * X.dim + 1), ConjectureC.numProjector H hC j = 1 :=
  ConjectureC.numProjector_mul H hC

end Tests

/-! ### MC.7/conjecture-D -/

/-- MC.7/conjecture-D: an `F`-linear cycle numerically equivalent to zero has cycle class zero,
for every variety and every codimension. -/
def ConjectureD : Prop :=
  ∀ (X : SmVar k) (i : ℤ), ∀ α ∈ C.codimF F X.obj i, α ∈ NumEquiv C F X.obj →
    H.toWeilData.linCycleMap F X α = 0

namespace ConjectureD

/-- The form given by Poincaré duality: if some cohomology class pairs nontrivially with the class
of `α`, some algebraic cycle has nonzero intersection number with `α`. -/
theorem equiv_dual :
    ConjectureD H ↔ ∀ (X : SmVar k) (i : ℤ), ∀ α ∈ C.codimF F X.obj i,
      (∃ c ∈ H.toWeilData.grading X (2 * X.dim - 2 * i),
        H.toWeilData.traceMap X (H.toWeilData.linCycleMap F X α * c) ≠ 0) →
      ∃ β ∈ C.codimF F X.obj (X.dim - i), C.degF F X.obj (α * β) ≠ 0 := by
  sorry

/-- The unconditional direction: homologically trivial classes are numerically trivial. -/
theorem of_hom_le_num (X : SmVar k) (α : C.CHF F X.obj)
    (hα : H.toWeilData.linCycleMap F X α = 0) : α ∈ NumEquiv C F X.obj := by
  sorry

/-- Under Conjecture D the realisation factors through the numerical motives: a symmetric
monoidal functor on `M_k(num)` with `G((X, [Δ], 0)) ≅ H^*(X)`. -/
theorem factorisation (hD : ConjectureD H) :
    ∃ (G : MotiveMod F (NumEquiv.adequate C F) ⥤ GradedVect F) (_ : G.Braided),
      ∀ X : SmVar k, Nonempty (G.obj (MotiveMod.ofPair F (NumEquiv.adequate C F) X.obj 0) ≅
        H.toWeilData.gradedObject X) := by
  sorry

end ConjectureD

/-! #### Unit tests of MC.7/conjecture-D -/

section Tests

/-- Unit test `ConjectureD.of_hom`: homological triviality implies numerical triviality
unconditionally; only the converse is conjectural. -/
example (X : SmVar k) (α : C.CHF F X.obj) (hα : H.toWeilData.linCycleMap F X α = 0) :
    α ∈ NumEquiv C F X.obj :=
  ConjectureD.of_hom_le_num H X α hα

/-- Unit test `ConjectureD.zeroCycles`: for zero cycles on a variety, numerical triviality,
degree zero and vanishing of the cycle class coincide (MC.2/cycle-class-degree). -/
example (X : SmVar k) (α : C.CHF F X.obj) (hα : α ∈ C.codimF F X.obj X.dim) :
    (α ∈ NumEquiv C F X.obj ↔ C.degF F X.obj α = 0) ∧
      (H.toWeilData.linCycleMap F X α = 0 ↔ C.degF F X.obj α = 0) := by
  sorry

/-- Unit test `ConjectureD.codimZero`: in codimension zero the two relations agree. -/
example (X : SmVar k) (α : C.CHF F X.obj) (hα : α ∈ C.codimF F X.obj 0) :
    α ∈ NumEquiv C F X.obj ↔ H.toWeilData.linCycleMap F X α = 0 := by
  sorry

/-- Unit test `ConjectureD.iff_kernel_S`: Conjecture D for `H` holds iff for every `X` the
surjection `S` from degree zero correspondences modulo homological equivalence to those modulo
numerical equivalence (MC.3) is injective. -/
example : ConjectureD H ↔ ∀ X : SmVar k, Function.Injective
    (fun f : End (MotiveMod.ofPair F (HomEquiv.adequate H F) X.obj 0) =>
      (MotiveMod.map_le F (HomEquiv.le_num H F)).map f) := by
  sorry

end Tests

/-! ### MC.7/known-cases-of-conjecture-C

The register of Jannsen's known cases. Cases (i)–(iii) are recorded from the source, whose primary
references (Murre; Lieberman as reported by Kleiman; Katz–Messing) were not obtained; case (iii) is
recorded for `ℓ`-adic cohomology only, the theory Katz and Messing treat, since the continuation
that obtains their paper must check which theories it covers. Case (iv) is proved in the source.
Jannsen's Remark 2 (the unconditional Tannakian conclusion over the algebraic closure of a finite
field) is the combination of case (iii) with MC.3/numerical-motives-tannakian. -/

/-- MC.7/known-cases-of-conjecture-C (iv): Conjecture C for `X` and `Y` gives it for `X × Y`, since
`π^j_{X×Y} = Σ_{r+s=j} π^r_X × π^s_Y` by the Künneth formula. -/
theorem conjectureC_product (X Y : SmVar k) (hX : ConjectureC H X) (hY : ConjectureC H Y) :
    ConjectureC H (X.prod Y) := by
  sorry

/-- MC.7/known-cases-of-conjecture-C (i), recorded (attributed to Murre): Conjecture C holds for
every variety of dimension at most two. -/
theorem conjectureC_of_dim_le_two (X : SmVar k) (hX : X.dim ≤ 2) : ConjectureC H X := by
  sorry

/-- MC.7/known-cases-of-conjecture-C (ii), recorded (attributed to Lieberman, as reported by
Kleiman): Conjecture C holds for every abelian variety, a variety with a group scheme structure
over `k` (Mathlib's `GrpObj` in schemes over `Spec k`). -/
theorem conjectureC_of_abelianVariety (X : SmVar k) (hA : Nonempty (GrpObj X.obj.obj)) :
    ConjectureC H X := by
  sorry

/-- The classical Weil cohomology theory of `ℓ`-adic cohomology (MC.2/etale-cohomology-is-weil). -/
def EtaleCohomologyData.toWeil {ℓ : ℕ} [Fact ℓ.Prime] (E : EtaleCohomologyData C ℓ)
    (hℓ : (ℓ : k) ≠ 0) : WeilCohomology C ℚ_[ℓ] :=
  Subtype.mk E.toWeilData (etale_isWeil C ℓ hℓ E)

/-- MC.7/known-cases-of-conjecture-C (iii), recorded (attributed to Katz and Messing): when `k`
is an algebraic closure of a finite field (every nonzero element has finite order), Conjecture C
holds for every variety, for `ℓ`-adic cohomology. -/
theorem conjectureC_of_finiteField {ℓ : ℕ} [Fact ℓ.Prime] (E : EtaleCohomologyData C ℓ)
    (hℓ : (ℓ : k) ≠ 0) (hk : ∀ x : k, x ≠ 0 → IsOfFinOrder x) (X : SmVar k) :
    ConjectureC (E.toWeil hℓ) X := by
  sorry

/-! ### MC.7/bloch-beilinson-filtration-and-murre -/

/-- The numerical class, with `F` coefficients, of a rational correspondence of degree zero. -/
def Corr.numClassF (X : SmVar k) (c : Corr C X.obj X.obj 0) :
    End (MotiveMod.ofPair F (NumEquiv.adequate C F) X.obj 0) :=
  (Idempotents.toKaroubi _).map (Submodule.Quotient.mk
    ⟨TensorProduct.map (algebraMap ℚ F).toIntAlgHom.toLinearMap LinearMap.id
      (Corr.toChow C _ _ _ c), sorry⟩ :
    CorrMod F (NumEquiv.adequate C F) X.obj X.obj (0 - 0))

/-- MC.7/bloch-beilinson-filtration-and-murre, the precise part of Murre's conjecture: the
decomposition of the diagonal into orthogonal idempotents exists modulo rational equivalence,
in `CH^{dim X}(X × X) ⊗ ℚ`, lifting the numerical Künneth projectors of Conjecture C. Murre's
further conditions and the Bloch–Beilinson filtration are stated in no source read. -/
def MurreDecomposition (X : SmVar k) (hC : ConjectureC H X) : Prop :=
  ∃ p : ℤ → Corr C X.obj X.obj 0,
    (∀ i j : ℤ, Corr.comp C (p i) (p j) =
      if i = j then Corr.cast C (add_zero 0).symm (p i) else 0) ∧
    ∑ j ∈ Finset.range (2 * X.dim + 1), p j = Corr.diagonal C X.obj ∧
    ∀ j : ℤ, Corr.numClassF (F := F) X (p j) = ConjectureC.numProjector H hC j

end ConjectureC

/-! ### MC.7/smash-nilpotence -/

section Smash

variable {k : Type u} [Field k]

/-- The `n`-fold product `Xⁿ = (⋯((Spec k × X) × X) ⋯) × X`. -/
def SmProj.power (X : SmProj k) : ℕ → SmProj k
  | 0 => SmProj.point k
  | n + 1 => (SmProj.power X n).prod X

/-- The `n`-fold exterior product `a × ⋯ × a` on `Xⁿ`. -/
def ChowTheory.exteriorPower (C : ChowTheory k) (X : SmProj k) (a : C.CH X) :
    ∀ n : ℕ, C.CH (X.power n)
  | 0 => 1
  | n + 1 => C.pullback (SmProj.fst _ _) (C.exteriorPower X a n) * C.pullback (SmProj.snd _ X) a

/-- MC.7/smash-nilpotence: for `X` geometrically irreducible smooth projective and `x`, `x'`
rational points, the `n`-fold exterior product of `[x] - [x']` is torsion in `CH_0(Xⁿ)` for all
large `n`. -/
theorem smash_nilpotence (C : ChowTheory k) (X : SmProj k) (hX : X.IsVariety)
    (x x' : X.RatPoint) :
    ∃ N : ℕ, ∀ n ≥ N, IsOfFinAddOrder (C.exteriorPower X (C.pushforward x 1 - C.pushforward x' 1) n) := by
  sorry

end Smash

/-! ### MC.7/hodge-class, cycle-classes-are-hodge, hodge-conjecture -/

section Hodge

variable {C : ChowTheory ℂ}

/-- SchemeAndStackFoundations SF.2 with ComplexComparisonPartII:C5: Betti cohomology
`H^*(X(ℂ), ℚ)` of smooth projective complex varieties, with cup product, pullback and cycle class
map, as a classical Weil cohomology theory with coefficients `ℚ` (SF.2); algebraic de Rham
cohomology `H^n_dR(X)`, the hypercohomology `H^n(X, Ω^{≥p})` of the truncated de Rham complex with
its map to `H^n_dR(X)`, and the comparison `H^n_dR(X) ≅ H^n(X(ℂ), ℚ) ⊗ ℂ`, compatible with pullback
and cup product (C5). Nothing here is planned by this roadmap. -/
structure BettiHodgeData (C : ChowTheory ℂ) where
  /-- SF.2: Betti cohomology as a classical Weil cohomology theory. -/
  betti : WeilCohomology C ℚ
  /-- C5: algebraic de Rham cohomology. -/
  deRham : SmVar ℂ → ℤ → Type
  [addCommGroupDR : ∀ X n, AddCommGroup (deRham X n)]
  [moduleDR : ∀ X n, Module ℂ (deRham X n)]
  /-- C5: `H^n(X, Ω^{≥p})`. -/
  truncated : SmVar ℂ → ℕ → ℤ → Type
  [addCommGroupTr : ∀ X p n, AddCommGroup (truncated X p n)]
  [moduleTr : ∀ X p n, Module ℂ (truncated X p n)]
  /-- C5: the map `H^n(X, Ω^{≥p}) ⟶ H^n_dR(X)` induced by `Ω^{≥p} ⊆ Ω^•`. -/
  truncMap : ∀ X p n, truncated X p n →ₗ[ℂ] deRham X n
  /-- C5: the comparison `H^n_dR(X) ≅ H^n(X(ℂ), ℚ) ⊗ ℂ`. -/
  comparison : ∀ X n, deRham X n ≃ₗ[ℂ] ℂ ⊗[ℚ] betti.toWeilData.grading X n
  /-- C5: `Ω^{≥0} = Ω^•`. -/
  truncMap_zero_surjective : ∀ X n, Function.Surjective (truncMap X 0 n)
  /-- C5: compatibility of the comparison and the truncations with pullback. -/
  truncMap_pullback : ∀ {X Y : SmVar ℂ} (f : X ⟶ Y) (p : ℕ) (n : ℤ) (y : truncated Y p n),
    ∃ x : truncated X p n, comparison X n (truncMap X p n x) =
      (betti.toWeilData.pullbackDeg f n).baseChange ℂ (comparison Y n (truncMap Y p n y))
  /-- C5: compatibility with cup products, `Ω^{≥p} ⊗ Ω^{≥q} ⟶ Ω^{≥p+q}`, in
  `ℂ ⊗ H^*(X(ℂ), ℚ)`. -/
  truncMap_mul : ∀ (X : SmVar ℂ) (p q : ℕ) (m n : ℤ) (a : truncated X p m) (b : truncated X q n),
    ∃ c : truncated X (p + q) (m + n),
      (betti.toWeilData.grading X (m + n)).subtype.baseChange ℂ (comparison X _ (truncMap X _ _ c)) =
        (betti.toWeilData.grading X m).subtype.baseChange ℂ (comparison X m (truncMap X p m a)) *
          (betti.toWeilData.grading X n).subtype.baseChange ℂ (comparison X n (truncMap X q n b))

attribute [instance] BettiHodgeData.addCommGroupDR BettiHodgeData.moduleDR
  BettiHodgeData.addCommGroupTr BettiHodgeData.moduleTr

variable (B : BettiHodgeData C)

/-- MC.7/hodge-class: the Hodge filtration `F^p H^n(X, ℂ)`, the image of the hypercohomology of
`Ω^{≥p}` under the de Rham comparison. -/
def HodgeFiltration (X : SmVar ℂ) (p : ℕ) (n : ℤ) :
    Submodule ℂ (ℂ ⊗[ℚ] B.betti.toWeilData.grading X n) :=
  (LinearMap.range (B.truncMap X p n)).map (B.comparison X n).toLinearMap

/-- MC.7/hodge-class: the Hodge classes of degree `2p`, the rational classes whose image in
`H^{2p}(X, ℂ)` lies in `F^p`. -/
def HodgeClass (X : SmVar ℂ) (p : ℕ) : Submodule ℚ (B.betti.toWeilData.grading X (2 * p)) :=
  ((HodgeFiltration B X p (2 * p)).restrictScalars ℚ).comap (TensorProduct.mk ℚ ℂ _ 1)

namespace HodgeClass

/-- A rational class is a Hodge class exactly when its complexification lies in `F^p`. -/
theorem mem_iff (X : SmVar ℂ) (p : ℕ) (v : B.betti.toWeilData.grading X (2 * p)) :
    v ∈ HodgeClass B X p ↔ (1 : ℂ) ⊗ₜ v ∈ HodgeFiltration B X p (2 * p) :=
  Iff.rfl

/-- Pullback maps Hodge classes to Hodge classes, compatibly with composition. -/
theorem pullback {X Y : SmVar ℂ} (f : X ⟶ Y) (p : ℕ) :
    (HodgeClass B Y p).map (B.betti.toWeilData.pullbackDeg f (2 * p)) ≤ HodgeClass B X p := by
  sorry

/-- Cup product maps Hodge classes of degrees `2p` and `2q` to a Hodge class of degree
`2(p + q)`. -/
theorem mul (X : SmVar ℂ) (p q : ℕ) (v : B.betti.toWeilData.grading X (2 * p))
    (w : B.betti.toWeilData.grading X (2 * q)) (hv : v ∈ HodgeClass B X p)
    (hw : w ∈ HodgeClass B X q) :
    ∃ u ∈ HodgeClass B X (p + q), (u : B.betti.toWeilData.H.obj (op X)) = v * w := by
  sorry

/-- Under a Hodge decomposition `H^n(X, ℂ) = ⨁_a H^{a, n-a}` with `F^p = ⨁_{a ≥ p} H^{a, n-a}` and
`\overline{H^{a,b}} = H^{b,a}` (which no layer of the atlas plans), the Hodge classes are
`H^{2p}(X, ℚ) ∩ H^{p,p}`. -/
theorem eq_inf_pp (X : SmVar ℂ) (p : ℕ)
    (Hpq : ℕ → ℕ → Submodule ℂ (ℂ ⊗[ℚ] B.betti.toWeilData.grading X (2 * p)))
    (hdec : DirectSum.IsInternal fun a : Fin (2 * p + 1) => Hpq a (2 * p - a))
    (hF : ∀ r : ℕ, HodgeFiltration B X r (2 * p) = ⨆ (a : ℕ) (_ : r ≤ a) (_ : a ≤ 2 * p), Hpq a (2 * p - a))
    (hconj : ∀ a b x, x ∈ Hpq a b ↔
      TensorProduct.map (starRingEnd ℂ).toRatAlgHom.toLinearMap LinearMap.id x ∈ Hpq b a) :
    HodgeClass B X p = ((Hpq p p).restrictScalars ℚ).comap (TensorProduct.mk ℚ ℂ _ 1) := by
  sorry

end HodgeClass

/-- MC.7/cycle-classes-are-hodge: the class of an algebraic cycle is a Hodge class; hence every
rational combination of cycle classes is one. -/
theorem cycleClass_isHodge (X : SmVar ℂ) (p : ℕ) :
    (∀ z : C.codim X.obj p, B.betti.toWeilData.cycleClass X p z ∈ HodgeClass B X p) ∧
      Submodule.span ℚ (Set.range (B.betti.toWeilData.cycleClass X p)) ≤ HodgeClass B X p := by
  sorry

/-- MC.7/hodge-conjecture: the Hodge conjecture for `X` in degree `2p`: every Hodge class is a
rational combination of classes of algebraic cycles of codimension `p`. -/
def HodgeConjecture (X : SmVar ℂ) (p : ℕ) : Prop :=
  HodgeClass B X p ≤ Submodule.span ℚ (Set.range (B.betti.toWeilData.cycleClass X p))

namespace HodgeConjecture

/-- The Hodge conjecture for `X`: the predicate for every `p`. -/
def all (X : SmVar ℂ) : Prop := ∀ p : ℕ, HodgeConjecture B X p

/-- The predicate holds iff the `ℚ`-span of the cycle classes is the space of Hodge classes. -/
theorem iff_span_eq (X : SmVar ℂ) (p : ℕ) :
    HodgeConjecture B X p ↔
      Submodule.span ℚ (Set.range (B.betti.toWeilData.cycleClass X p)) = HodgeClass B X p := by
  sorry

/-- The predicate holds for `p = 0` (varieties are connected). -/
theorem degree_zero (X : SmVar ℂ) : HodgeConjecture B X 0 := by
  sorry

/-- The predicate holds for `p = dim X`. -/
theorem top_degree (X : SmVar ℂ) : HodgeConjecture B X X.dim := by
  sorry

/-- The predicate for `X × X` in degree `2 dim X` implies Conjecture C for `X` for Betti
cohomology, the Künneth components being Hodge classes (Deligne, Example 1). -/
theorem implies_kunneth (X : SmVar ℂ) (h : HodgeConjecture B (X.prod X) X.dim) :
    ConjectureC B.betti X := by
  sorry

end HodgeConjecture

/-! #### Unit tests of MC.7/hodge-class and MC.7/hodge-conjecture -/

section Tests

/-- Unit test `HodgeClass.degree_zero`: for `p = 0` every class of `H^0(X, ℚ)` is a Hodge class,
`F^0` being everything. -/
example (X : SmVar ℂ) : HodgeClass B X 0 = ⊤ := by
  sorry

/-- Unit test `HodgeClass.not_complex`: a class of `F^1 H^2(X, ℂ)` that is not the image of a
rational class (as `dz₁ ∧ dz₂` on `E × E` for an elliptic curve `E`, which cannot be named here)
is not a Hodge class: taking `F^p` itself in place of rational classes is wrong. -/
example (X : SmVar ℂ) (ω : ℂ ⊗[ℚ] B.betti.toWeilData.grading X (2 * (1 : ℕ)))
    (hω : ω ∈ HodgeFiltration B X 1 (2 * (1 : ℕ)))
    (hrat : ω ∉ Set.range (TensorProduct.mk ℚ ℂ (B.betti.toWeilData.grading X (2 * (1 : ℕ))) 1)) :
    ¬ ∃ v ∈ HodgeClass B X 1, (1 : ℂ) ⊗ₜ v = ω := by
  sorry

/-- Unit test `HodgeClass.cycle`: the class of a codimension-`p` subvariety is a Hodge class; with
`F^{p+1}` in place of `F^p` this fails for `p = 1` and a hyperplane class `h` (`deg hᵈ ≠ 0`). -/
example (X : SmVar ℂ) (p : ℕ) (h : C.codim X.obj (1 : ℕ)) (hX : 0 < X.dim)
    (hdeg : C.deg X.obj ((h : C.CH X.obj) ^ X.dim) ≠ 0) :
    (∀ z : C.codim X.obj p, B.betti.toWeilData.cycleClass X p z ∈ HodgeClass B X p) ∧
      (1 : ℂ) ⊗ₜ (B.betti.toWeilData.cycleClass X (1 : ℕ) h) ∉ HodgeFiltration B X 2 (2 * (1 : ℕ)) := by
  sorry

/-- Unit test `HodgeClass.submodule`: the Hodge classes form a `ℚ`-subspace. -/
example (X : SmVar ℂ) (p : ℕ) (v w : B.betti.toWeilData.grading X (2 * p)) (q : ℚ)
    (hv : v ∈ HodgeClass B X p) (hw : w ∈ HodgeClass B X p) :
    v + w ∈ HodgeClass B X p ∧ q • v ∈ HodgeClass B X p :=
  ⟨(HodgeClass B X p).add_mem hv hw, (HodgeClass B X p).smul_mem q hv⟩

/-- Unit test `HodgeConjecture.degree_zero_test`: for `p = 0` the Hodge classes are
`H^0(X, ℚ) = ℚ`, spanned by the class of `X`, and the predicate holds. -/
example (X : SmVar ℂ) : ∃ h1 : (1 : C.CH X.obj) ∈ C.codim X.obj ((0 : ℕ) : ℤ),
    HodgeClass B X 0 = Submodule.span ℚ {B.betti.toWeilData.cycleClass X (0 : ℕ) ⟨1, h1⟩} ∧
      HodgeConjecture B X 0 := by
  sorry

/-- Unit test `HodgeConjecture.top_degree_test`: for `p = dim X` the space `H^{2N}(X, ℚ) = ℚ` is
spanned by the class of a point, and the predicate holds. -/
example (X : SmVar ℂ) (x : X.obj.RatPoint) :
    ∃ hx : C.pushforward x 1 ∈ C.codim X.obj (X.dim : ℤ),
      HodgeClass B X X.dim = Submodule.span ℚ {B.betti.toWeilData.cycleClass X X.dim ⟨_, hx⟩} ∧
        HodgeConjecture B X X.dim := by
  sorry

/-- Unit test `HodgeConjecture.rational_span`: the predicate uses the `ℚ`-span of cycle classes;
the integral statement (with the subgroup generated by cycle classes), which the source records
as false in general, implies it. -/
example (X : SmVar ℂ) (p : ℕ) :
    (HodgeConjecture B X p ↔ ∀ v ∈ HodgeClass B X p,
        v ∈ Submodule.span ℚ (Set.range (B.betti.toWeilData.cycleClass X p))) ∧
      ((∀ v ∈ HodgeClass B X p,
        v ∈ AddSubgroup.closure (Set.range (B.betti.toWeilData.cycleClass X p))) →
        HodgeConjecture B X p) := by
  sorry

/-- Unit test `HodgeConjecture.surjectivity`: the predicate is the surjectivity of the rational
cycle class map `CH^p(X) ⊗ ℚ ⟶ H^{2p}(X, ℚ)` onto the Hodge classes. -/
example (X : SmVar ℂ) (p : ℕ) :
    HodgeConjecture B X p ↔ LinearMap.range
      ((B.betti.toWeilData.cycleClass X p).toIntLinearMap.liftBaseChange ℚ) = HodgeClass B X p := by
  sorry

end Tests

end Hodge

/-! ### MC.7/lefschetz-and-hodge-standard-conjectures

The Lefschetz standard conjecture is typed for a Weil cohomology theory together with hard
Lefschetz for the hyperplane class `η`, the input that DeligneWeightsAndPurity:DWP.9 supplies for
`ℓ`-adic cohomology and Hodge for Betti cohomology; it is not typed for a theory without it. The
Hodge standard conjecture is stated in no source read, and no predicate is typed for it. -/

section Lefschetz

variable {k : Type u} [Field k] {C : ChowTheory k} [IsAlgClosed k] {F : Type v} [Field F]
  [CharZero F] (H : WeilCohomology C F)

/-- The Lefschetz operator `γ(η)^p ∪ - : H^{N-p}(X) ⟶ H^{N+p}(X)`, `N = dim X`. -/
def lefschetzOp (X : SmVar k) (η : C.CH X.obj) (p : ℕ) :
    H.toWeilData.grading X (X.dim - p) →ₗ[F] H.toWeilData.grading X (X.dim + p) :=
  (LinearMap.mulLeft F (H.toWeilData.cycleMap X η ^ p)).restrict sorry

/-- Hard Lefschetz for `η` (the conclusion of DWP.9 for `ℓ`-adic cohomology and of Hodge for Betti
cohomology, taken as a hypothesis): every `γ(η)^p : H^{N-p}(X) ⟶ H^{N+p}(X)`, `p ≤ N`, is bijective. -/
def IsHardLefschetzClass (X : SmVar k) (η : C.CH X.obj) : Prop :=
  η ∈ C.codim X.obj 1 ∧ ∀ p ≤ X.dim, Function.Bijective (lefschetzOp H X η p)

/-- The class `z_p ∈ H^{N-p}(X) ⊗ H^{N-p}(X) ⊆ H^{2N-2p}(X × X)` such that
`c ↦ pr₁,*(z_p ∪ pr₂^*c)` is the inverse of `γ(η)^p`. -/
def lefschetzInverseClass (X : SmVar k) (η : C.CH X.obj) (_hL : IsHardLefschetzClass H X η)
    (p : ℕ) : H.toWeilData.H.obj (op (X.prod X)) :=
  sorry

/-- `z_p ∈ H^{N-p}(X) ⊗ H^{N-p}(X)` and `pr₁,*(z_p ∪ pr₂^*(η^p c)) = c` for `c ∈ H^{N-p}(X)`. -/
theorem lefschetzInverseClass_spec (X : SmVar k) (η : C.CH X.obj) (hL : IsHardLefschetzClass H X η)
    (p : ℕ) (hp : p ≤ X.dim) :
    lefschetzInverseClass H X η hL p ∈ Submodule.map (H.toWeilData.kunnethMap X X)
      (Submodule.map₂ (TensorProduct.mk F _ _) (H.toWeilData.grading X (X.dim - p))
        (H.toWeilData.grading X (X.dim - p))) ∧
    ∀ c ∈ H.toWeilData.grading X (X.dim - p),
      H.pushforward (SmVar.fst X X) (lefschetzInverseClass H X η hL p *
        H.toWeilData.pullback (SmVar.snd X X) (H.toWeilData.cycleMap X η ^ p * c)) = c := by
  sorry

/-- MC.7/lefschetz-and-hodge-standard-conjectures: the Lefschetz standard conjecture for `X`,
`H` and `η`: every `z_p` is the class of a `ℚ`-linear cycle of codimension `N - p` on `X × X`. -/
def LefschetzStandardConjecture (X : SmVar k) (η : C.CH X.obj) (hL : IsHardLefschetzClass H X η) :
    Prop :=
  ∀ p ≤ X.dim, ∃ z ∈ C.codimF ℚ (X.prod X).obj ((X.dim : ℤ) - p),
    H.toWeilData.linCycleMap ℚ (X.prod X) z = lefschetzInverseClass H X η hL p

/-- `z_0` is the Künneth component of the diagonal in `H^N(X) ⊗ H^N(X)`, up to the sign of the
Künneth convention. -/
theorem lefschetzInverseClass_zero (X : SmVar k) (η : C.CH X.obj) (hL : IsHardLefschetzClass H X η) :
    ∃ s : ℤˣ, lefschetzInverseClass H X η hL 0 =
      (s : ℤ) • ConjectureC.kunnethComponent H X X.dim := by
  sorry

/-- Over `ℂ`, the Hodge conjecture for `X × X` implies the predicate for Betti cohomology, each
`z_p` being a Hodge class (Deligne, Section 4, Example 2). -/
theorem LefschetzStandardConjecture.of_hodge {C : ChowTheory ℂ} (B : BettiHodgeData C)
    (X : SmVar ℂ) (η : C.CH X.obj) (hL : IsHardLefschetzClass B.betti X η)
    (h : ∀ p ≤ X.dim, HodgeConjecture B (X.prod X) (X.dim - p)) :
    LefschetzStandardConjecture B.betti X η hL := by
  sorry

/-! #### Unit tests -/

section Tests

/-- Unit test `LefschetzStandard.curve`: for a curve (`N = 1`) with a hyperplane class of degree
`e`, `z_1 = (1/e) [X × X]`, which is algebraic, and `z_0` is the middle Künneth component,
algebraic when `X` has a rational point (MC.0/pointed-curve-idempotents); so the predicate holds. -/
example (X : SmVar k) (hX : X.dim = 1) (η : C.CH X.obj) (hL : IsHardLefschetzClass H X η)
    (e : ℤ) (he : e ≠ 0) (hdeg : C.deg X.obj η = e) (x : X.obj.RatPoint) :
    lefschetzInverseClass H X η hL 1 = ((e : F)⁻¹) • 1 ∧ LefschetzStandardConjecture H X η hL := by
  sorry

/-- Unit test `LefschetzStandard.point`: for `N = 0` the predicate holds, `z_0` being the class of
the diagonal of a point. -/
example (η : C.CH (SmVar.point k).obj) (hL : IsHardLefschetzClass H (SmVar.point k) η) :
    lefschetzInverseClass H _ η hL 0 = H.toWeilData.cycleMap _ (C.pushforward (SmProj.diag (SmProj.point k)) 1) ∧
      LefschetzStandardConjecture H _ η hL := by
  sorry

/-- Unit test `LefschetzStandard.relative_to_theory`: the predicate takes the cohomology theory and
the hyperplane class (with hard Lefschetz for it) as arguments. -/
example : ∀ (H : WeilCohomology C F) (X : SmVar k) (η : C.CH X.obj),
    IsHardLefschetzClass H X η → Prop :=
  fun H X η hL => LefschetzStandardConjecture H X η hL

/-- Unit test `LefschetzStandard.of_hodge_test`: over `ℂ`, if every Hodge class on `X × X` is
algebraic then the predicate holds for `X`. -/
example {C : ChowTheory ℂ} (B : BettiHodgeData C) (X : SmVar ℂ) (η : C.CH X.obj)
    (hL : IsHardLefschetzClass B.betti X η) (h : HodgeConjecture.all B (X.prod X)) :
    LefschetzStandardConjecture B.betti X η hL :=
  LefschetzStandardConjecture.of_hodge B X η hL fun p _ => h (X.dim - p)

end Tests

end Lefschetz

/-! ### MC.7/tate-conjecture, strong-tate-conjecture, tate-beilinson-conjecture -/

section Tate

variable {k : Type u} [Field k] (C : ChowTheory k)

variable (k) in
/-- `k` is finitely generated over its prime field. -/
def IsFinitelyGeneratedField : Prop :=
  ∃ s : Finset k, Subfield.closure (s : Set k) = ⊤

/-- `φ` is the arithmetic Frobenius `x ↦ x^q` of `k̄`. -/
def IsArithmeticFrobenius (q : ℕ) (φ : Field.absoluteGaloisGroup k) : Prop :=
  ∀ x : AlgebraicClosure k, (show AlgebraicClosure k ≃ₐ[k] AlgebraicClosure k from φ) x = x ^ q

/-- SchemeAndStackFoundations SF.2: geometric `ℓ`-adic cohomology `H^i(X_{k_s}, ℚ_ℓ(a))` of smooth
projective `k`-schemes, for `ℓ` invertible in `k`, with its continuous Galois action, the Tate
twists and the cyclotomic character, and the Galois-equivariant cycle class map. -/
structure LAdicCohomology (ℓ : ℕ) [Fact ℓ.Prime] where
  ell_ne_zero : (ℓ : k) ≠ 0
  /-- `H^i(X_{k_s}, ℚ_ℓ(a))`. -/
  H : SmProj k → ℕ → ℤ → Type v
  [addCommGroup : ∀ X i a, AddCommGroup (H X i a)]
  [module : ∀ X i a, Module ℚ_[ℓ] (H X i a)]
  [finiteDimensional : ∀ X i a, FiniteDimensional ℚ_[ℓ] (H X i a)]
  [topology : ∀ X i a, TopologicalSpace (H X i a)]
  isModuleTopology : ∀ X i a, IsModuleTopology ℚ_[ℓ] (H X i a)
  /-- The action of the absolute Galois group. -/
  galAction : ∀ X i a, Field.absoluteGaloisGroup k →* (H X i a ≃ₗ[ℚ_[ℓ]] H X i a)
  galAction_continuous : ∀ X i a (v : H X i a), Continuous fun σ => galAction X i a σ v
  /-- The `ℓ`-adic cyclotomic character. -/
  cyclotomic : Field.absoluteGaloisGroup k →* ℚ_[ℓ]ˣ
  /-- On a finite field of order `q` the arithmetic Frobenius `x ↦ x^q` has `χ = q`. -/
  cyclotomic_frobenius : ∀ (q : ℕ) (φ : Field.absoluteGaloisGroup k), Nat.card k = q →
    IsArithmeticFrobenius q φ → (cyclotomic φ : ℚ_[ℓ]) = q
  /-- The twist `H^i(X, ℚ_ℓ(a)) ≅ H^i(X, ℚ_ℓ(b))`. -/
  twist : ∀ X i a b, H X i a ≃ₗ[ℚ_[ℓ]] H X i b
  /-- Twisting multiplies the Galois action by `χ^{b-a}`. -/
  twist_galAction : ∀ X i a b σ (v : H X i a),
    galAction X i b σ (twist X i a b v) = ((cyclotomic σ : ℚ_[ℓ]) ^ (b - a)) • twist X i a b (galAction X i a σ v)
  /-- The cycle class map `CH^a(X) ⟶ H^{2a}(X_{k_s}, ℚ_ℓ(a))`. -/
  cycleClass : ∀ X (a : ℕ), C.codim X a →+ H X (2 * a) a

attribute [instance] LAdicCohomology.addCommGroup LAdicCohomology.module
  LAdicCohomology.finiteDimensional LAdicCohomology.topology

variable {C} {ℓ : ℕ} [Fact ℓ.Prime] (L : LAdicCohomology C ℓ)

/-- MC.7/tate-conjecture: the Tate classes, the Galois-invariant elements of
`H^{2a}(X_{k_s}, ℚ_ℓ(a))`. -/
def TateClass (X : SmProj k) (a : ℕ) : Submodule ℚ_[ℓ] (L.H X (2 * a) a) :=
  ⨅ σ : Field.absoluteGaloisGroup k,
    LinearMap.ker ((L.galAction X (2 * a) a σ).toLinearMap - LinearMap.id)

/-- The class of a cycle defined over `k` is a Tate class. -/
theorem cycleClass_isTate (X : SmProj k) (a : ℕ) (z : C.codim X a) :
    L.cycleClass X a z ∈ TateClass L X a := by
  sorry

/-- MC.7/tate-conjecture: for `k` finitely generated over its prime field (part of the predicate),
the Galois-invariant subspace of `H^{2a}(X_{k_s}, ℚ_ℓ(a))` is spanned over `ℚ_ℓ` by the classes of
codimension `a` cycles. -/
def TateConjecture (X : SmProj k) (a : ℕ) : Prop :=
  IsFinitelyGeneratedField k ∧
    TateClass L X a = Submodule.span ℚ_[ℓ] (Set.range (L.cycleClass X a))

/-- The Tate conjecture for divisors. -/
def TateConjecture.divisors (X : SmProj k) : Prop := TateConjecture L X 1

/-- The hypothesis on the base field is part of the predicate. -/
theorem TateConjecture.needs_finitely_generated {X : SmProj k} {a : ℕ}
    (h : TateConjecture L X a) : IsFinitelyGeneratedField k :=
  h.1

/-- SF.2, for a finite extension `k'/k`: the geometric cohomology of `X_{k'}` is that of `X`, with
the Galois action restricted along `G_{k'} ⟶ G_k`, compatibly with cycle classes. -/
structure LAdicBaseChange {k' : Type u} [Field k'] [Algebra k k'] {C' : ChowTheory k'}
    (B : ChowBaseChange k' C C') (L' : LAdicCohomology C' ℓ) where
  /-- The identification of the cohomologies. -/
  e : ∀ X i a, L.H X i a ≃ₗ[ℚ_[ℓ]] L'.H ((SmProj.baseChangeFunctor k k').obj X) i a
  e_galAction : ∀ X i a (σ : Field.absoluteGaloisGroup k') v,
    e X i a (L.galAction X i a (Field.absoluteGaloisGroup.map (algebraMap k k') σ) v) =
      L'.galAction _ i a σ (e X i a v)
  e_cycleClass : ∀ X (a : ℕ) (z : C.codim X a),
    e X (2 * a) a (L.cycleClass X a z) = L'.cycleClass _ a ⟨B.toK X z, B.toK_codim X a z z.2⟩

/-- The conjecture over a finite Galois extension `k'` implies it over `k`. -/
theorem TateConjecture.of_finite_extension {k' : Type u} [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [IsGalois k k'] {C' : ChowTheory k'} {B : ChowBaseChange k' C C'}
    {L' : LAdicCohomology C' ℓ} (_D : LAdicBaseChange L B L') (X : SmProj k) (a : ℕ)
    (h : TateConjecture L' ((SmProj.baseChangeFunctor k k').obj X) a) : TateConjecture L X a := by
  sorry

/-! #### Unit tests of MC.7/tate-conjecture -/

section Tests

/-- Unit test `TateConjecture.codim_zero`: for `X` geometrically connected and `a = 0`,
`H^0 = ℚ_ℓ` is Galois-fixed and spanned by `[X]`, so the predicate holds. -/
example (hk : IsFinitelyGeneratedField k) (X : SmProj k) (hX : GeometricallyConnected X.obj.hom) :
    TateConjecture L X 0 := by
  sorry

/-- Unit test `TateConjecture.top_codim`: for `X` geometrically connected of dimension `d` and
`a = d`, `H^{2d}(X_{k_s}, ℚ_ℓ(d)) = ℚ_ℓ` with trivial action is spanned by the class of a closed
point, so the predicate holds. -/
example (hk : IsFinitelyGeneratedField k) (X : SmProj k) (d : ℕ) (hd : X.IsEquidim d)
    (hX : GeometricallyConnected X.obj.hom) : TateConjecture L X d := by
  sorry

/-- Unit test `TateConjecture.algClosed_fails`: over an algebraically closed field every class is
Galois-fixed and the predicate, which requires `k` finitely generated over its prime field, fails. -/
example [IsAlgClosed k] (X : SmProj k) (a : ℕ) : TateClass L X a = ⊤ ∧ ¬ TateConjecture L X a := by
  sorry

/-- Unit test `TateConjecture.twist_matters`: over `𝔽_q`, a class `v` of `H^{2a}(X_{k_s}, ℚ_ℓ)`
gives a Tate class after the twist exactly when the geometric Frobenius `φ⁻¹` multiplies it by
`q^a` (without the twist the condition would be eigenvalue one). -/
example [Finite k] (q : ℕ) (hq : Nat.card k = q) (φ : Field.absoluteGaloisGroup k)
    (hφ : IsArithmeticFrobenius q φ) (X : SmProj k) (a : ℕ) (v : L.H X (2 * a) 0) :
    L.twist X (2 * a) 0 a v ∈ TateClass L X a ↔
      L.galAction X (2 * a) 0 φ⁻¹ v = ((q : ℚ_[ℓ]) ^ a) • v := by
  sorry

/-- Unit test `TateConjecture.l_invertible`: the prime `ℓ` is invertible in `k`; the predicate
concerns `ℓ`-adic cohomology only. -/
example : (ℓ : k) ≠ 0 := L.ell_ne_zero

end Tests

/-! ### MC.7/strong-tate-conjecture -/

/-- The summand condition: the Galois invariants have a Galois-stable complement in
`H^{2a}(X_{k_s}, ℚ_ℓ(a))`. -/
def GaloisInvariantsSummand (X : SmProj k) (a : ℕ) : Prop :=
  ∃ W : Submodule ℚ_[ℓ] (L.H X (2 * a) a), IsCompl (TateClass L X a) W ∧
    ∀ σ, ∀ w ∈ W, L.galAction X (2 * a) a σ w ∈ W

/-- MC.7/strong-tate-conjecture: the Tate conjecture together with the summand condition. -/
def StrongTateConjecture (X : SmProj k) (a : ℕ) : Prop :=
  TateConjecture L X a ∧ GaloisInvariantsSummand L X a

/-- The strong predicate implies the Tate predicate. -/
theorem StrongTateConjecture.toTate {X : SmProj k} {a : ℕ} (h : StrongTateConjecture L X a) :
    TateConjecture L X a :=
  h.1

/-- Over a finite field, the summand condition holds exactly when the generalised eigenspace of the
Frobenius for the eigenvalue one equals the eigenspace. -/
theorem GaloisInvariantsSummand.finiteField_iff [Finite k] (q : ℕ) (hq : Nat.card k = q)
    (φ : Field.absoluteGaloisGroup k) (hφ : IsArithmeticFrobenius q φ) (X : SmProj k)
    (a : ℕ) :
    GaloisInvariantsSummand L X a ↔
      Module.End.maxGenEigenspace (L.galAction X (2 * a) a φ).toLinearMap 1 =
        Module.End.eigenspace (L.galAction X (2 * a) a φ).toLinearMap 1 := by
  sorry

section Tests

/-- Unit test `StrongTate.codim_zero`: for `X` geometrically connected and `a = 0` the strong
predicate holds, the invariants being all of `H^0 = ℚ_ℓ`. -/
example (hk : IsFinitelyGeneratedField k) (X : SmProj k) (hX : GeometricallyConnected X.obj.hom) :
    StrongTateConjecture L X 0 := by
  sorry

/-- Unit test `StrongTate.finiteField_semisimple`: over `𝔽_q`, a nontrivial Jordan block of the
Frobenius for the eigenvalue one breaks the summand condition. -/
example [Finite k] (q : ℕ) (hq : Nat.card k = q) (φ : Field.absoluteGaloisGroup k)
    (hφ : IsArithmeticFrobenius q φ) (X : SmProj k) (a : ℕ)
    (hJ : Module.End.maxGenEigenspace (L.galAction X (2 * a) a φ).toLinearMap 1 ≠
      Module.End.eigenspace (L.galAction X (2 * a) a φ).toLinearMap 1) :
    ¬ GaloisInvariantsSummand L X a := by
  sorry

/-- Unit test `StrongTate.summand_alone`: the summand condition alone is not the Tate conjecture:
over a finite field it holds whenever the Frobenius has no eigenvalue one, and then there are no
Tate classes at all. -/
example [Finite k] (q : ℕ) (hq : Nat.card k = q) (φ : Field.absoluteGaloisGroup k)
    (hφ : IsArithmeticFrobenius q φ) (X : SmProj k) (a : ℕ)
    (h1 : Module.End.eigenspace (L.galAction X (2 * a) a φ).toLinearMap 1 = ⊥) :
    GaloisInvariantsSummand L X a ∧ TateClass L X a = ⊥ := by
  sorry

end Tests

/-! ### MC.7/tate-beilinson-conjecture -/

/-- The cycle map `CH^a(X) ⊗ ℚ ⟶ H^{2a}(X_{k_s}, ℚ_ℓ(a))`. -/
def LAdicCohomology.cycleMapQ (X : SmProj k) (a : ℕ) : ℚ ⊗[ℤ] C.codim X a →+ L.H X (2 * a) a :=
  (TensorProduct.lift (LinearMap.mk₂ ℤ (fun (c : ℚ) (z : C.codim X a) =>
    (algebraMap ℚ ℚ_[ℓ] c) • L.cycleClass X a z) sorry sorry sorry sorry)).toAddMonoidHom

/-- MC.7/tate-beilinson-conjecture: Beilinson's injectivity for `X` over a finite field (part of
the predicate): `CH^a(X) ⊗ ℚ ⟶ H^{2a}(X_{k_s}, ℚ_ℓ(a))` is injective. -/
def BeilinsonInjectivity (X : SmProj k) (a : ℕ) : Prop :=
  Finite k ∧ Function.Injective (L.cycleMapQ X a)

/-- The Tate–Beilinson conjecture: the Tate conjecture together with Beilinson's injectivity. -/
def TateBeilinsonConjecture (X : SmProj k) (a : ℕ) : Prop :=
  TateConjecture L X a ∧ BeilinsonInjectivity L X a

/-- The Tate–Beilinson predicate implies the Tate predicate (MC.7/tate-conjecture-variants). -/
theorem TateBeilinsonConjecture.toTate {X : SmProj k} {a : ℕ}
    (h : TateBeilinsonConjecture L X a) : TateConjecture L X a :=
  h.1

/-- Injectivity for `a = 1` over a finite field, recorded from the source (finiteness of the
rational points of abelian varieties over finite fields). -/
theorem BeilinsonInjectivity.codim_one [Finite k] (X : SmProj k) : BeilinsonInjectivity L X 1 := by
  sorry

section Tests

/-- Unit test `BeilinsonInjectivity.codim_zero`: for `X` geometrically connected and `a = 0`,
`CH^0(X) ⊗ ℚ = ℚ` maps isomorphically to `H^0 = ℚ_ℓ`'s rational line. -/
example [Finite k] (X : SmProj k) (hX : GeometricallyConnected X.obj.hom) :
    BeilinsonInjectivity L X 0 := by
  sorry

/-- Unit test `BeilinsonInjectivity.curve`: for a geometrically connected curve over a finite
field and `a = 1`, `CH^1 ⊗ ℚ = ℚ` (the degree zero part being finite) maps injectively to
`H^2 = ℚ_ℓ`. -/
example [Finite k] (X : SmProj k) (hX : X.IsEquidim 1) (hc : GeometricallyConnected X.obj.hom) :
    BeilinsonInjectivity L X 1 := by
  sorry

/-- Unit test `BeilinsonInjectivity.fails_over_C`: over `ℂ` the predicate fails (it is restricted to
finite fields), and the analogous map is not injective for a curve with rational points `P`, `O`
such that `[P] - [O]` has infinite order (as on an elliptic curve). -/
example {C : ChowTheory ℂ} (L : LAdicCohomology C ℓ) (X : SmProj ℂ) (hX : X.IsCurve)
    (P O : X.RatPoint) (hmem : C.pushforward P 1 - C.pushforward O 1 ∈ C.codim X ((1 : ℕ) : ℤ))
    (hinf : ¬ IsOfFinAddOrder (C.pushforward P 1 - C.pushforward O 1)) :
    ¬ BeilinsonInjectivity L X 1 ∧ ¬ Function.Injective (L.cycleMapQ X 1) := by
  sorry

end Tests

/-! ### MC.7/tate-conjecture-variants

Recorded: the Tate–Beilinson conjecture implies the Tate conjecture
(`TateBeilinsonConjecture.toTate`), the strong form implies the usual one
(`StrongTateConjecture.toTate`), and the conjecture for divisors is the case `a = 1`
(`TateConjecture.divisors`). The Borel–Moore variant (for arbitrary varieties), the variant over the
separable closure, the integral variants, the implications to the standard conjectures and the
equivalences with the finiteness of Brauer and Tate–Shafarevich groups and with Birch and
Swinnerton-Dyer rest on sources not obtained and on objects (Borel–Moore homology, Brauer groups,
Jacobians) that no interface here supplies; none is typed. -/

/-! ### MC.7/tate-and-hodge-known-cases

The entries typed are those whose objects can be named: an abelian variety is a smooth proper
geometrically irreducible `k`-scheme with a group scheme structure (Mathlib's `GrpObj` over
`Spec k`). Entry (T1)'s equivalent form `Hom_k(A, B) ⊗ ℤ_ℓ ≅ Hom_Gal(T_ℓ A, T_ℓ B)` needs Tate modules,
which no interface supplies. Entries (T4)–(T8) need Hodge numbers `h^{2,0}`, K3 surfaces,
hyperkähler varieties or variations of Hodge structure, none of which Mathlib or an interface here
supplies; they are not typed. (TB1) is `BeilinsonInjectivity.codim_one`. (H1), the Lefschetz
`(1,1)` theorem, rests on the Hodge decomposition, a gap; following the review it is not typed.
All typed entries are recorded, not proved. -/

/-- (T1), recorded (Tate): the Tate conjecture for divisors on abelian varieties over a finite
field, in its strong form. -/
theorem tate_abelianVariety_finiteField [Finite k] (A : SmProj k) (hA : A.IsVariety)
    (hG : Nonempty (GrpObj A.obj)) : StrongTateConjecture L A 1 := by
  sorry

/-- (T2), recorded (Faltings, through FaltingsFinitenessAndIsogenyTheorems:R28.4): the Tate
conjecture for divisors on abelian varieties over a number field. -/
theorem tate_abelianVariety_numberField [NumberField k] (A : SmProj k) (hA : A.IsVariety)
    (hG : Nonempty (GrpObj A.obj)) : TateConjecture L A 1 := by
  sorry

/-- (T3), recorded (Zarhin, from Tate and Faltings): the Tate conjecture for divisors on abelian
varieties over any field finitely generated over its prime field. -/
theorem tate_abelianVariety_finitelyGenerated (hk : IsFinitelyGeneratedField k) (A : SmProj k)
    (hA : A.IsVariety) (hG : Nonempty (GrpObj A.obj)) : TateConjecture L A 1 := by
  sorry

end Tate

end MC7

end TauCeti.Motives
