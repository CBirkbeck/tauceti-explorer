/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/VectorBundlesAndIsocrystals--VB3.md is definitive.
These statements suggest Lean forms so contributors and reviewers can converge
on names and signatures. They claim no implementation.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. implementationStatus = unchecked.

The categorical parameters below are interfaces, not replacements for the
perfectoid site, FF curve, sympathetic algebras or period sheaves. In particular
RGamma is supplied as a derived-section functor, never raw sections. Missing
geometric conditions are described at their declarations and in the final
contract index. They are left out, not encoded by arbitrary Prop fields.
Numerical slope profiles and fibres are explicitly marked as such. Elaborating
these admitted signatures does not establish those geometric conditions.
-/
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.Algebra.Homology.Linear
import Mathlib.Algebra.Homology.ShortComplex.Linear
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Limits.Shapes.Biproducts
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Data.Rat.Lemmas
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Topology.Bornology.Basic
import Mathlib.Topology.Constructions
import Mathlib.CategoryTheory.Limits.FunctorCategory.Basic
import Mathlib.CategoryTheory.Limits.FunctorCategory.BinaryBiproducts
import Mathlib.Algebra.Module.Submodule.Map
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Homeomorph.Quotient
import Mathlib.Analysis.Normed.Module.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject
universe u v w
namespace TauCeti.BanachColmez

/-! Derived hypercohomology. Cohomology is computed *after* RGamma. -/
section Sections
variable {C : Type u} [Category.{v} C] [Abelian C]
variable (RGamma : C ⥤ CochainComplex C ℤ)

/-- Object-level positive section sheaf. The FF bundle embedding in C is omitted. -/
def BC (E : C) : C := ((RGamma.obj E).homology (0 : ℤ))
/-- Negative bundles only in the roadmap; the missing HN predicate is omitted. -/
def BCneg (E : C) : C := ((RGamma.obj E).homology (1 : ℤ))
/-- K is already the image of the two-term complex under derived sections.
The universal H⁰(E₁) condition is omitted until the relative curve exists. -/
def BCcomplex (K : CochainComplex C ℤ) : C := K.homology (0 : ℤ)
namespace BC
/-- The whole homology functor supplies both identity and composition. -/
def map : C ⥤ C := RGamma ⋙ HomologicalComplex.homologyFunctor C (.up ℤ) 0
/-- E-module structure: with the coefficient field acting linearly on the owner
category (E-module v-sheaves) and on derived sections, `map` is additive and
linear. The E-module v-sheaf structure itself is the owner category's. -/
theorem module (K : Type w) [Field K] [Linear K C] [RGamma.Additive]
    [RGamma.Linear K] : ∃ _ : (map RGamma).Additive, (map RGamma).Linear K := by sorry
/-- Exact sequence: `s` is the short exact sequence of derived-section complexes
of 0→E′→E→E″→0 (producing it from the bundle sequence is the omitted
derived-section interface). Degree-zero and degree-one cohomology then form
BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E), exact at the three middle places. -/
theorem exactSequence (s : ShortComplex (CochainComplex C ℤ)) (hs : s.ShortExact) :
    (ShortComplex.mk (HomologicalComplex.homologyMap s.f 0)
      (HomologicalComplex.homologyMap s.g 0) (by
        rw [← HomologicalComplex.homologyMap_comp, s.zero,
          HomologicalComplex.homologyMap_zero])).Exact ∧
    (ShortComplex.mk _ _ (hs.comp_δ 0 1 (by simp))).Exact ∧
    (ShortComplex.mk _ _ (hs.δ_comp 0 1 (by simp))).Exact :=
  ⟨hs.homology_exact₂ 0, hs.homology_exact₃ 0 1 (by simp), hs.homology_exact₁ 0 1 (by simp)⟩
/-- Restriction comparison as a *natural isomorphism*, not an untyped predicate.
Construction requires the missing relative derived-section base-change theorem. -/
def baseChange {D : Type u} [Category.{v} D] [Abelian D]
    (R : C ⥤ D) (pullback : C ⥤ D) (RGamma' : D ⥤ CochainComplex D ℤ) :
    map RGamma ⋙ R ≅ pullback ⋙ map RGamma' := by sorry
/-- Requires the omitted additive derived-section interface. -/
def directSum (K L : CochainComplex C ℤ) :
    BCcomplex (K ⊞ L) ≅ BCcomplex K ⊞ BCcomplex L := by sorry
end BC
namespace BCtest
/-- Zero *derived* complex. -/
example : BCcomplex (0 : CochainComplex C ℤ) ≅ (0 : C) := by sorry
-- Name: BCtest.zero.
/-- single: two supplied embeddings place E at degree 0 or −1 before RGamma.
Their cohomology/shift comparison is the omitted clause. -/
example (degreeZero negativeShift : C ⥤ C) (E : C) :
    Nonempty (BCcomplex (RGamma.obj (degreeZero.obj E)) ≅ BC RGamma E) ∧
    Nonempty (BCcomplex (RGamma.obj (negativeShift.obj E)) ≅ BCneg RGamma E) := by sorry
-- Name: BCtest.single.
/-- constantSections: sections on two connected components are a product.
The identification of components of Perf_S is omitted. -/
example (E : Type u) [Field E] :
    Module.finrank E (Fin 2 → E) = 2 := by sorry
-- Name: BCtest.constantSections.
/-- hypercohomology: the actual negative contribution is H¹, not a cokernel
of raw H⁰. Here K is its derived-section complex; shift identification omitted. -/
example (E : C) (K : CochainComplex C ℤ)
    (comparison : K.homology (0 : ℤ) ≅ (RGamma.obj E).homology (1 : ℤ))
    (h : ¬ IsZero ((RGamma.obj E).homology (1 : ℤ))) :
    ¬ IsZero (BCcomplex K) := by sorry
-- Name: BCtest.hypercohomology.
end BCtest
end Sections

/-! Classical presentations: genuine short exact complexes and finite modules. -/
section Presentations
variable {K : Type u} [Field K]
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- The sympathetic domain and the Q_p specialization are not yet instantiated. -/
abbrev SympatheticVS (Sympath : Type u) [Category.{v} Sympath] :=
    Sympath ⥤ ModuleCat K
namespace SympatheticVS
/-- A constant functor, with its maps; finite dimensionality is explicit. -/
def constant (S : Type u) [Category.{v} S] (V : ModuleCat K)
    [FiniteDimensional K V] : SympatheticVS (K := K) S := by sorry
/-- Coordinatewise additive functor of the algebra-value functor supplied by
PeriodRings. Sympathetic/connected/spectral/p-root conditions are omitted. -/
def additive (S : Type u) [Category.{v} S] (A : S ⥤ ModuleCat K)
    (d : ℕ) : SympatheticVS (K := K) S := by sorry
/-- Objectwise short exactness, using the pinned ShortExact. -/
def exact (S : Type u) [Category.{v} S]
    (s : ShortComplex (S ⥤ ModuleCat K)) : Prop :=
    ∀ a : S, (s.map ((evaluation S (ModuleCat K)).obj a)).ShortExact
/-- The BdR/B_m *functors*, not just their values at C, are supplier data. -/
def periodTargets (S : Type u) [Category.{v} S] :
    (S ⥤ ModuleCat K) × (S ⥤ ModuleCat K) × (ℕ → S ⥤ ModuleCat K) := by sorry
end SympatheticVS

/-- Both exact sequences retain their actual arrows, Y and their endpoints. -/
structure BCPresentation (constant : ModuleCat K ⥤ C) (V : ℕ → C) (W : C) where
  dim : ℕ
  V₁ : ModuleCat K
  V₂ : ModuleCat K
  finite₁ : FiniteDimensional K V₁
  finite₂ : FiniteDimensional K V₂
  Y : C
  first : ShortComplex C
  second : ShortComplex C
  firstLeft : first.X₁ ≅ constant.obj V₁
  firstMiddle : first.X₂ ≅ Y
  firstRight : first.X₃ ≅ V dim
  secondLeft : second.X₁ ≅ constant.obj V₂
  secondMiddle : second.X₂ ≅ Y
  secondRight : second.X₃ ≅ W
  firstExact : first.ShortExact
  secondExact : second.ShortExact
namespace BCPresentation
variable {constant : ModuleCat K ⥤ C} {V : ℕ → C} {W : C}
def height (P : BCPresentation constant V W) : ℤ :=
  (Module.finrank K P.V₁ : ℤ) - (Module.finrank K P.V₂ : ℤ)
/-- Independence requires the actual sympathetic category (G-LEBRAS).
The supplied constant/additive functors' geometric conditions are omitted. -/
theorem dimension (P Q : BCPresentation constant V W) :
    (P.dim, P.height) = (Q.dim, Q.height) := by sorry
/-- Construction retains both exact sequences, not just a changed integer. -/
def stabilize (P : BCPresentation constant V W) (T : ModuleCat K)
    [FiniteDimensional K T] :
    {Q : BCPresentation constant V W // Q.dim = P.dim ∧ Q.height = P.height ∧
      Module.finrank K Q.V₁ = Module.finrank K P.V₁ + Module.finrank K T ∧
      Module.finrank K Q.V₂ = Module.finrank K P.V₂ + Module.finrank K T} := by sorry
end BCPresentation
/-- Numerical core of a presentation, not the BC object or its realization. -/
def presentationDimension (d v₁ v₂ : ℕ) : ℕ × ℤ := (d, (v₁ : ℤ) - v₂)
namespace BCPresentationTest
-- The geometric identifications V_d, constant Q_p^h and V₁/Q_p are omitted.
example (d : ℕ) : presentationDimension d 0 0 = (d, 0) := by sorry -- additive
example (h : ℕ) : presentationDimension 0 h 0 = (0, (h : ℤ)) := by sorry -- constant
example : presentationDimension 1 0 1 = (1, -1) := by sorry -- quotient
example (d a b : ℕ) : presentationDimension d (a+1) (b+1) =
    presentationDimension d a b := by sorry -- stabilize
end BCPresentationTest
end Presentations

/-! Curvature is expressed by actual Hom spaces, monos and finite filtrations. -/
section Curvature
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Finite iterated extensions of the additive generator. -/
inductive AffineClosure (Ga : C) : C → Prop
  | zero : AffineClosure Ga 0
  | iso {X Y : C} : AffineClosure Ga X → (X ≅ Y) → AffineClosure Ga Y
  | step (s : ShortComplex C) : s.ShortExact → AffineClosure Ga s.X₁ →
      (s.X₃ ≅ Ga) → AffineClosure Ga s.X₂
namespace BCCurvature
def positive (Ga W : C) : Prop := ∀ f : W ⟶ Ga, f = 0
def nonnegative (BdRplus W : C) : Prop := ∀ f : W ⟶ BdRplus, f = 0
def affine (Ga W : C) : Prop := AffineClosure Ga W
/-- The supplier supplies the actual d-fold BdRplus powers. -/
def negative (powers : ℕ → C) (W : C) : Prop :=
  ∃ d, ∃ f : W ⟶ powers d, Mono f
/-- BdRplus-modules and their restriction-of-scalars functor are supplied. -/
def nonpositive {D : Type u} [Category.{v} D] (forget : D ⥤ C) (W : C) : Prop :=
  ∃ M : D, ∃ f : W ⟶ forget.obj M, Mono f
theorem iso (Ga BdRplus : C) (powers : ℕ → C)
    {D : Type u} [Category.{v} D] (forget : D ⥤ C) {X Y : C} (e : X ≅ Y) :
    (positive Ga X ↔ positive Ga Y) ∧
    (nonnegative BdRplus X ↔ nonnegative BdRplus Y) ∧
    (affine Ga X ↔ affine Ga Y) ∧
    (negative powers X ↔ negative powers Y) ∧
    (nonpositive forget X ↔ nonpositive forget Y) := by sorry
end BCCurvature
end Curvature

/-! Canonical filtration: intersection-of-kernel signatures at module values.
The corresponding subfunctors and BC universal properties need period VS. -/
section Filtration
variable {K : Type u} [Field K]
variable {S : Type u} [Category.{v} S]
variable (W : S ⥤ ModuleCat K) (B : ℕ → S ⥤ ModuleCat K)
variable (D : S ⥤ ModuleCat K) (a : S)
/-- Submodule-valued component of the actual subfunctors. -/
structure BCCanonicalFiltration where
  positivePart : Submodule K (W.obj a)
  nonnegativePart : Submodule K (W.obj a)
  nested : positivePart ≤ nonnegativePart
namespace BCCanonicalFiltration
/-- Intersect kernels of *natural VS maps*, not all linear maps at C. -/
def positive : Submodule K (W.obj a) :=
  ⨅ m, ⨅ f : W ⟶ B m, LinearMap.ker (f.app a).hom
def nonnegative : Submodule K (W.obj a) :=
  ⨅ f : W ⟶ D, LinearMap.ker (f.app a).hom
/-- Every natural map preserves the component submodules. -/
theorem map (W' : S ⥤ ModuleCat K) (f : W ⟶ W') :
    (positive W B a).map (f.app a).hom ≤ positive W' B a ∧
    (nonnegative W D a).map (f.app a).hom ≤ nonnegative W' D a := by sorry
/-- Component universal property. Identifying nonpositive VS targets with
those annihilated by the positive subfunctor is omitted. -/
theorem nonpositiveQuotient {Z : Type u} [AddCommGroup Z] [Module K Z]
    (f : (W.obj a) →ₗ[K] Z) (h : positive W B a ≤ LinearMap.ker f) :
    ∃! g : ((W.obj a) ⧸ positive W B a) →ₗ[K] Z,
      g.comp (positive W B a).mkQ = f := by sorry
/-- The actual affine graded component; geometric maximality is omitted. -/
def affinePart (F : BCCanonicalFiltration W a) :
    F.nonnegativePart ⧸ (F.positivePart.comap F.nonnegativePart.subtype) := by sorry
end BCCanonicalFiltration
end Filtration

/-! Numerical HN invariants, preserving the dimension/height convention. -/
structure BCHNInvariants where
  rank : ℕ
  degree : ℤ
  isZero : Bool
namespace BCHNInvariants
/-- Curve degrees and ranks enter with different signs. -/
def fromHeart (deg₀ degNeg : ℤ) (rank₀ rankNeg : ℕ) (h : 0 ≤ deg₀-degNeg) :
    BCHNInvariants := by sorry
/-- none belongs to the zero object; a nonzero dimension-zero object has −∞. -/
def slope (I : BCHNInvariants) : Option (WithBot ℚ) :=
  if I.isZero then none else if I.rank = 0 then some ⊥
  else some (((I.degree : ℚ) / I.rank : ℚ) : WithBot ℚ)
/-- U_{h,d}: curve slope d/h, BC slope −h/d. Nonzero d is essential. -/
theorem standard (h : ℕ) (d : ℤ) (hh : 0 < h) (hd : d ≠ 0) :
    ((- (h : ℚ)) / d) = -1 / ((d : ℚ) / h) := by sorry
/-- Rank and degree add; this does not assert slope additivity. -/
theorem additive {C : Type u} [Category.{v} C] [Abelian C]
    (invariants : C → BCHNInvariants) (s : ShortComplex C) (hs : s.ShortExact) :
    (invariants s.X₂).rank = (invariants s.X₁).rank + (invariants s.X₃).rank ∧
    (invariants s.X₂).degree = (invariants s.X₁).degree + (invariants s.X₃).degree := by sorry
end BCHNInvariants
namespace BCHNInvariantsTest
example : (BCHNInvariants.mk 0 0 true).slope = none := by sorry -- zero
example : (BCHNInvariants.mk 0 (-1) false).slope = some ⊥ := by sorry -- rational
example : (BCHNInvariants.mk 1 0 false).slope = some (0 : WithBot ℚ) := by sorry -- affine
example : (BCHNInvariants.mk 1 (-2) false).slope = some ((-2 : ℚ) : WithBot ℚ) := by sorry -- inversion
example : (BCHNInvariants.mk 1 1 false).slope = some (1 : WithBot ℚ) := by sorry -- negative
end BCHNInvariantsTest

/-! Pointwise and relative ampleness: positive slope profiles only. -/
def PointwiseAmple {X : Type u} (slopes : X → List ℚ) : Prop :=
  ∀ x, ∀ a ∈ slopes x, 0 < a
namespace PointwiseAmple
/-- Openness of the pointwise-ample locus (KL Theorem 7.4.5). `slopes` is the
fibre slope profile of a bundle; the semicontinuity input is omitted. -/
theorem isOpen {X : Type u} [TopologicalSpace X] (slopes : X → List ℚ) :
    IsOpen {x | ∀ a ∈ slopes x, 0 < a} := by sorry
theorem pullback {X Y : Type u} (slopes : X → List ℚ) (f : Y → X)
    (h : PointwiseAmple slopes) : PointwiseAmple (slopes ∘ f) := by sorry
/-- Tensor slopes are the pairwise sums, with multiplicities. -/
theorem tensor {X : Type u} (s t : X → List ℚ)
    (hs : PointwiseAmple s) (ht : PointwiseAmple t) :
    PointwiseAmple (fun x => (s x).flatMap (fun a => (t x).map (a + ·))) := by sorry
/-- Requires the missing Proj/Robba equivalence; equality of its matched
slope profiles is the supported comparison input. -/
theorem projComparison {X : Type u} (s t : X → List ℚ) (h : s = t) :
    PointwiseAmple s ↔ PointwiseAmple t := by sorry
end PointwiseAmple
namespace PointwiseAmpleTest
example : PointwiseAmple (fun _ : Unit => [1]) := by sorry -- positive
example : ¬ PointwiseAmple (fun _ : Unit => [0]) := by sorry -- unit
example : ¬ PointwiseAmple (fun _ : Unit => [2,-1]) := by sorry -- mixed
example : PointwiseAmple (fun _ : Unit => []) := by sorry -- zero
end PointwiseAmpleTest
/-- All supplied affinoid-chart profiles. Their Proj ampleness comparison is
omitted; the mathematical definition quantifies over all perfectoid pullbacks. -/
def RelativeAmple {I X : Type u} (charts : I → X → List ℚ) : Prop :=
  ∀ i, PointwiseAmple (charts i)
namespace RelativeAmple
theorem fibreCriterion {I X : Type u} [Nonempty I] (s : X → List ℚ) :
    RelativeAmple (fun _ : I => s) ↔ PointwiseAmple s := by sorry
theorem pullback {I X Y : Type u} (s : I → X → List ℚ) (f : Y → X)
    (h : RelativeAmple s) : RelativeAmple (fun i => s i ∘ f) := by sorry
theorem surjectiveDescent {I X Y : Type u} (s : I → X → List ℚ)
    (f : Y → X) (h : Function.Surjective f) :
    RelativeAmple s ↔ RelativeAmple (fun i => s i ∘ f) := by sorry
/-- The semicontinuity/openness conditions of the geometric slope function
are not yet expressible, so only its explicitly defined locus is supplied. -/
def openLocus {I X : Type u} (s : I → X → List ℚ) : Set X :=
    {x | ∀ i, ∀ a ∈ s i x, 0 < a}
end RelativeAmple
namespace RelativeAmpleTest
example (s : Unit → List ℚ) : RelativeAmple (fun _ : Unit => s) ↔
    PointwiseAmple s := by sorry -- affinoid
example (a : ℕ) (h : 0 < a) :
    RelativeAmple (fun _ _ : Unit => [(1 : ℚ)/a]) := by sorry -- untiltLine
example : ¬ RelativeAmple (fun _ _ : Unit => [0]) := by sorry -- unit
end RelativeAmpleTest

/-! Pure-model lattice interface. The boundedness is an actual bornological
condition; the period ring and its bornology and localization are suppliers.
The lattice is not assumed finitely generated. For perfect Frobenius coefficients
bijectivity below expresses the invertible linearization. -/
section PureModels
variable {R B M : Type u} [CommRing R] [Field B] [Algebra R B]
variable [AddCommGroup M] [Module B M] [Module R M] [IsScalarTower R B M]
variable [Bornology M]
structure PureModel (p : B) (F : M ≃+ M) (c : ℤ) (d : ℕ) where
  lattice : Submodule R M
  bounded : Bornology.IsBounded (lattice : Set M)
  generates : Submodule.span B (lattice : Set M) = ⊤
  coefficientFrobenius : B ≃+* B
  semilinear : ∀ b x, F (b • x) = coefficientFrobenius b • F x
  exponent : ℕ
  exponentPositive : 0 < exponent
  denominatorMultiple : exponent ∣ d
  denominatorPositive : 0 < d
  frobenius : Set.BijOn (fun x => p^c • (F^[d]) x)
    (lattice : Set M) (lattice : Set M)
namespace PureModel
/-- Localization includes its real scalar ring map and semilinear module map.
Boundedness of localization and compatibility with Frobenius are omitted. -/
def baseChange {R' B' M' : Type u} [CommRing R'] [Field B'] [Algebra R' B']
    [AddCommGroup M'] [Module B' M'] [Module R' M'] [IsScalarTower R' B' M']
    [Bornology M'] (p : B) (F : M ≃+ M) (c : ℤ) (d : ℕ)
    (P : PureModel (R := R) p F c d) (r : R →+* R')
    (f : M →ₛₗ[r] M') (p' : B') (F' : M' ≃+ M') :
    PureModel (R := R') p' F' c d := by sorry
/-- The supported criterion is normalized Frobenius bijectivity at c=0.
The comparison with the geometric étale module category is omitted. -/
theorem etale (p : B) (F : M ≃+ M) (d : ℕ)
    (P : PureModel (R := R) p F 0 d) :
    Set.BijOn (fun x => (F^[d]) x) (P.lattice : Set M) (P.lattice : Set M) := by sorry
/-- On a trivializing vector the normalization forces φ^d=p^{-c}.
The conclusion that every geometric Robba slope is c/d is omitted. -/
theorem fibreSlope (p : B) (hp : p ≠ 0) (F : M ≃+ M) (c : ℤ) (d : ℕ)
    (x : M) (hx : p^c • (F^[d]) x = x) :
    (F^[d]) x = p^(-c) • x := by sorry
end PureModel
namespace PureModelTest
-- Named tests state the normalization core; integral period lattices are omitted.
example (p : B) (d : ℕ) (hd : 0 < d) (N : Submodule R M)
    (bounded : Bornology.IsBounded (N : Set M)) (generates : Submodule.span B (N : Set M) = ⊤) :
    ∃ P : PureModel (R := R) p (AddEquiv.refl M) 0 d, P.lattice = N := by sorry -- unit
example [Subsingleton M] (p : B) (F : M ≃+ M) (c : ℤ) (d : ℕ) (hd : 0 < d) :
    Nonempty (PureModel (R := R) p F c d) := by sorry -- zero
example (p : B) (hp : p ≠ 0) (c : ℤ) (x : M) : p^c • (p^(-c) • x) = x := by sorry -- scaled
end PureModelTest
end PureModels

/-! Twisted-local-system fibres with *actual* coefficient semilinearity.
The site, sheaf local constancy and arithmetic Frobenius of Q_{p^d} are omitted. -/
section Twisted
variable {L V : Type u} [Field L] [AddCommGroup V] [Module L V]
structure TwistedLocalSystem (p : L) (σ : L ≃+* L) (c : ℤ) (d : ℕ) where
  finite : FiniteDimensional L V
  frobenius : V ≃+ V
  semilinear : ∀ a x, frobenius (a • x) = σ a • frobenius x
  coefficientPeriod : ∀ a, (σ^[d]) a = a
  fixedUniformizer : σ p = p
  denominatorPositive : 0 < d
  iterate : ∀ x, p^c • (frobenius^[d]) x = x
namespace TwistedLocalSystem
/-- Pullback fibre via a linear equivalence. Site pullback descent is omitted. -/
def pullback {V' : Type u} [AddCommGroup V'] [Module L V']
    (p : L) (σ : L ≃+* L) (c : ℤ) (d : ℕ)
    (T : TwistedLocalSystem (V := V) p σ c d) (e : V ≃ₗ[L] V') :
    TwistedLocalSystem (V := V') p σ c d := by sorry
/-- Numeric equal-slope core only; unramified coefficient extension and the
natural equivalence of étale sheaf categories are omitted. -/
theorem reindex (c e : ℤ) (d f : ℕ) (hd : d ≠ 0) (hf : f ≠ 0)
    (h : c * (f : ℤ) = e * (d : ℤ)) :
    (c : ℚ)/d = (e : ℚ)/f := by sorry
end TwistedLocalSystem
namespace TwistedLocalSystemTest
example (p : L) (T : TwistedLocalSystem (V := V) p (RingEquiv.refl L) 0 1)
    (x : V) : T.frobenius x = x := by sorry -- zeroSlope
/-- For c≠0 and p a uniformizer the p^c≠1 hypothesis is supplied by valuation. -/
example (p : L) (c : ℤ) (h : p^c ≠ 1) :
    ¬ ∀ x : L, p^c * x = x := by sorry -- nonzeroTwist
example : (1 : ℚ)/2 = (2 : ℚ)/4 := by sorry -- reindex
end TwistedLocalSystemTest
end Twisted

/-! Tilted coherent heart, using the pinned derived category. -/
section Heart
variable {C : Type u} [Category.{v} C] [Abelian C] [HasDerivedCategory.{w} C]
variable (slopes : C → List (WithTop ℚ))
/-- Coh_X is a supplier. The profile includes torsion slope +∞. -/
def TiltCondition (K : DerivedCategory C) : Prop :=
  (∀ i : ℤ, i ≠ -1 → i ≠ 0 → IsZero ((DerivedCategory.homologyFunctor C i).obj K)) ∧
  (∀ a ∈ slopes ((DerivedCategory.homologyFunctor C (-1)).obj K), a < 0) ∧
  (∀ a ∈ slopes ((DerivedCategory.homologyFunctor C 0).obj K), 0 ≤ a)
abbrev BCTiltedHeart := ObjectProperty.FullSubcategory (TiltCondition slopes)
namespace BCTiltedHeart
/-- Requires the omitted compatibility assigning the zero sheaf an empty profile. -/
def positive (E : C) (h : ∀ a ∈ slopes E, 0 ≤ a) : BCTiltedHeart slopes := by sorry
/-- Places a negative sheaf at degree −1, equivalently E[1]. -/
def negative (E : C) (h : ∀ a ∈ slopes E, a < 0) : BCTiltedHeart slopes := by sorry
/-- The curve's Ext² vanishing is omitted, not assumed as an arbitrary Prop. -/
theorem split (K : BCTiltedHeart slopes) :
    Nonempty (K.obj ≅
      (DerivedCategory.singleFunctor C 0).obj ((DerivedCategory.homologyFunctor C 0).obj K.obj) ⊞
      (DerivedCategory.singleFunctor C (-1)).obj ((DerivedCategory.homologyFunctor C (-1)).obj K.obj)) := by sorry
/-- Off-diagonal Hom is Ext¹(E₀,F₋₁); there is no opposite off-diagonal. -/
def homMatrix (E₀ E₁ F₀ F₁ : C) :
    (((DerivedCategory.singleFunctor C 0).obj E₀ ⊞ (DerivedCategory.singleFunctor C (-1)).obj E₁ ⟶
      (DerivedCategory.singleFunctor C 0).obj F₀ ⊞ (DerivedCategory.singleFunctor C (-1)).obj F₁) ≃
      (E₀ ⟶ F₀) × (E₁ ⟶ F₁) ×
      ((DerivedCategory.singleFunctor C 0).obj E₀ ⟶ (DerivedCategory.singleFunctor C (-1)).obj F₁)) := by sorry
end BCTiltedHeart
namespace BCTiltedHeartTest
-- Source-specific identifications O(1), O(−1), torsion and O are omitted.
-- The actual single-degree derived objects and their slope profiles remain.
example (E : C) (h : slopes E = [1]) :
    TiltCondition slopes ((DerivedCategory.singleFunctor C 0).obj E) := by sorry -- positive
example (E : C) (h : slopes E = [(-1 : ℚ)]) :
    TiltCondition slopes ((DerivedCategory.singleFunctor C (-1)).obj E) ∧
    ¬ TiltCondition slopes ((DerivedCategory.singleFunctor C 0).obj E) := by sorry -- negative
example (E : C) (h : slopes E = [⊤]) :
    TiltCondition slopes ((DerivedCategory.singleFunctor C 0).obj E) := by sorry -- torsion
example (E : C) (h : slopes E = [0]) :
    ¬ TiltCondition slopes ((DerivedCategory.singleFunctor C (-1)).obj E) := by sorry -- shift
end BCTiltedHeartTest
end Heart

/-! Generated abelian extension closure, without arbitrary ambient subobjects. -/
section Abstract
variable {C : Type u} [Category.{v} C] [Abelian C]
inductive AbstractBC (Qp Ga : C) : C → Prop
  | rational : AbstractBC Qp Ga Qp
  | additive : AbstractBC Qp Ga Ga
  | zero : AbstractBC Qp Ga 0
  | iso {X Y : C} : AbstractBC Qp Ga X → (X ≅ Y) → AbstractBC Qp Ga Y
  | kernel {X Y : C} (f : X ⟶ Y) : AbstractBC Qp Ga X → AbstractBC Qp Ga Y →
      AbstractBC Qp Ga (Limits.kernel f)
  | cokernel {X Y : C} (f : X ⟶ Y) : AbstractBC Qp Ga X → AbstractBC Qp Ga Y →
      AbstractBC Qp Ga (Limits.cokernel f)
  | extension (s : ShortComplex C) : s.ShortExact → AbstractBC Qp Ga s.X₁ →
      AbstractBC Qp Ga s.X₃ → AbstractBC Qp Ga s.X₂
namespace AbstractBC
theorem kernelCokernel (Qp Ga : C) {X Y : C} (f : X ⟶ Y)
    (hX : AbstractBC Qp Ga X) (hY : AbstractBC Qp Ga Y) :
    AbstractBC Qp Ga (Limits.kernel f) ∧ AbstractBC Qp Ga (Limits.cokernel f) := by sorry
/-- The actual RGamma functor, full faithfulness and exactness are omitted.
The proposed result has the *category equivalence* type. -/
def leBras {D : Type u} [Category.{v} D] [Abelian D] [HasDerivedCategory.{w} D]
    (Qp Ga : C) (slopes : D → List (WithTop ℚ)) :
    ObjectProperty.FullSubcategory (AbstractBC Qp Ga) ≌ BCTiltedHeart slopes := by sorry
end AbstractBC
namespace AbstractBCTest
example (Qp Ga : C) : AbstractBC Qp Ga Qp ∧ AbstractBC Qp Ga Ga := by sorry -- generators
example (Qp Ga : C) : AbstractBC Qp Ga 0 := by sorry -- zero
example (Qp Ga : C) (f : Qp ⟶ Ga) : AbstractBC Qp Ga (Limits.cokernel f) := by sorry -- quotient
/-- Evaluation forgets the category's Dimension invariant; the topological
isomorphism C≅C⊕Q_p requires the sympathetic evaluation supplier. -/
example : presentationDimension 1 0 0 ≠ presentationDimension 1 1 0 := by sorry -- points
end AbstractBCTest
end Abstract

/-! Scalar quotient at field-valued points. V-sheafification, torsors and
relative base change are omitted, not replaced by a set-theoretic quotient. -/
section Projectivization
variable {E V : Type u} [Field E] [AddCommGroup V] [Module E V]
def punctured := {v : V // v ≠ 0}
def scalarOrbit : Setoid (punctured (V := V)) where
  r x y := ∃ a : Eˣ, (a : E) • x.val = y.val
  iseqv := by sorry
/-- This is only the objectwise scalar-orbit carrier of BCProjectivization. -/
def BCProjectivization := Quotient (scalarOrbit (E := E) (V := V))
namespace BCProjectivization
/-- Pointwise freeness; the sheaf torsor statement is omitted. -/
theorem torsor (x : punctured (V := V)) (a : Eˣ) :
    (a : E) • x.val = x.val ↔ a = 1 := by sorry
/-- The universal property of invariant maps, using the pinned quotient. -/
def lift {Z : Type u} (f : punctured (V := V) → Z)
    (h : ∀ x y, (scalarOrbit (E := E)).r x y → f x = f y) :
    BCProjectivization (E := E) (V := V) → Z := by sorry
/-- Comparison along a supplied semilinear equivalence; v-base change omitted. -/
def baseChange {E' V' : Type u} [Field E'] [AddCommGroup V'] [Module E' V']
    (r : E ≃+* E') (e : V ≃+ V')
    (semilinear : ∀ a x, e (a • x) = r a • e x) :
    BCProjectivization (E := E) (V := V) ≃ BCProjectivization (E := E') (V := V') := by sorry
end BCProjectivization
namespace BCProjectivizationTest
example (h : Subsingleton V) : IsEmpty (BCProjectivization (E := E) (V := V)) := by sorry -- zero
example : Nonempty (BCProjectivization (E := E) (V := E) ≃ Unit) := by sorry -- line
/-- unitTwist: the scalar fibres give the divisor comparison. The untilt and
actual Div¹ realization are omitted; neither invariant maps nor point orbits
alone are substituted for the v-sheaf quotient. -/
example (Div : Type u) (divisor : punctured (V := V) → Div)
    (surjective : Function.Surjective divisor)
    (fibres : ∀ x y, divisor x = divisor y ↔ (scalarOrbit (E := E)).r x y) :
    Nonempty (BCProjectivization (E := E) (V := V) ≃ Div) := by sorry
end BCProjectivizationTest
end Projectivization

/-! Quantitative topology: this theorem needs no FF or diamond carrier. -/
section Contraction
variable {X : Type u} [TopologicalSpace X]
def fixedSet (γ : X ≃ₜ X) : Set X := {x | γ x = x}
abbrev movedSet (γ : X ≃ₜ X) := {x : X // x ∉ fixedSet γ}
def movedIterate (γ : X ≃ₜ X) (n : ℤ) (x : movedSet γ) : movedSet γ :=
  ⟨(γ^n) x.val, by sorry⟩
def contractingOrbit (γ : X ≃ₜ X) : Setoid (movedSet γ) where
  r x y := ∃ n : ℤ, movedIterate γ n x = y
  iseqv := by sorry
local instance : TopologicalSpace ℤ := ⊥
/-- FS II.2.17 with all its topological hypotheses. Generalization chains
use the pinned orientation y ⤳ x. Int has the discrete topology. -/
theorem ContractingActionLemma (γ : X ≃ₜ X)
    (locallySpectral : ∀ x : X, ∃ U : Set X,
      x ∈ U ∧ IsOpen U ∧ SpectralSpace U)
    (taut : ∀ U : Set X, IsOpen U → IsCompact U → IsCompact (closure U))
    (chains : ∀ x y z : X, Specializes y x → Specializes z x →
      Specializes y z ∨ Specializes z y)
    (fixedSpectral : SpectralSpace (fixedSet γ))
    (contracts : ∀ x : X, ∀ U : Set X, IsOpen U → fixedSet γ ⊆ U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^n) x ∈ U)
    (escapes : ∀ x : movedSet γ, ∀ U : Set X, IsOpen U → IsCompact U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^(-(n : ℤ))) x.val ∉ U) :
    IsClosed (fixedSet γ) ∧
    (∀ x : movedSet γ, ∀ n : ℤ, movedIterate γ n x = x → n = 0) ∧
    Topology.IsClosedEmbedding
      (fun z : movedSet γ × ℤ => (z.1, movedIterate γ z.2 z.1)) ∧
    SpectralSpace (Quotient (contractingOrbit γ)) := by sorry
end Contraction
namespace BCProjectivizationTest
/-- absolute: X is punctured BC(O(d)), γ is multiplication by π. Their
realization and d≥1 are omitted; the actual failure of quasiseparation is retained. -/
example {X : Type u} [TopologicalSpace X] (γ : X ≃ₜ X) :
    ¬ QuasiSeparatedSpace (Quotient (contractingOrbit γ)) := by sorry
end BCProjectivizationTest

/-! Additional discriminating components of the source's unit tests. -/
section VSExamples
variable {K : Type u} [Field K] {S : Type u} [Category.{v} S]
variable (A : S ⥤ ModuleCat K) (a : S)
namespace SympatheticVSTest
example : (SympatheticVS.constant S (ModuleCat.of K K)).obj a ≅ ModuleCat.of K K := by sorry -- constants
example : SympatheticVS.additive S A 0 ≅ (0 : S ⥤ ModuleCat K) := by sorry -- zero
example (d e : ℕ) : SympatheticVS.additive S A (d+e) ≅
    SympatheticVS.additive S A d ⊞ SympatheticVS.additive S A e := by sorry -- finiteSum
/-- evaluation: actual injectivity of the evaluation map on an algebra.
The analytic spectrum Spm Λ and the spherical closure are omitted. -/
example (Λ C : Type u) (spm : Type u) (evaluate : Λ → spm → C)
    (h : Function.Injective evaluate) (x y : Λ)
    (same : ∀ z, evaluate x z = evaluate y z) : x = y := by sorry
end SympatheticVSTest
end VSExamples

section CurvatureExamples
variable {C : Type u} [Category.{v} C] [Abelian C]
variable (Qp Ga BdRplus negativeBC otherPoint : C) (powers : ℕ → C)
variable (height : C → ℤ)
-- These are source-object placeholders with actual categorical types.
-- Their period/curve realization hypotheses, not arbitrary Prop fields, are omitted.
namespace BCCurvatureTest
example : BCCurvature.negative powers Qp ∧ height Qp = 1 := by sorry -- rational
example : BCCurvature.affine Ga Ga ∧ height Ga = 0 := by sorry -- affine
example : BCCurvature.positive Ga negativeBC ∧ height negativeBC = -1 := by sorry -- shifted
example : height otherPoint = 0 ∧ BCCurvature.positive Ga otherPoint ∧
    ¬ BCCurvature.affine Ga otherPoint := by sorry -- otherPoint
/-- All five geometric predicates hold at zero. Here the three Hom/filtration
predicates require no period-module realization. -/
example : BCCurvature.positive Ga (0 : C) ∧
    BCCurvature.nonnegative BdRplus (0 : C) ∧ BCCurvature.affine Ga (0 : C) := by sorry -- zero
end BCCurvatureTest
end CurvatureExamples

section FiltrationExamples
variable {K : Type u} [Field K] {S : Type u} [Category.{v} S]
variable (Qp Ga shifted otherPoint : S ⥤ ModuleCat K)
variable (B : ℕ → S ⥤ ModuleCat K) (D : S ⥤ ModuleCat K) (a : S)
-- Period realization and the named BC object's HN data are omitted.
namespace BCCanonicalFiltrationTest
example : BCCanonicalFiltration.positive Qp B a = ⊥ ∧
    BCCanonicalFiltration.nonnegative Qp D a = ⊥ := by sorry -- rational
example : BCCanonicalFiltration.positive Ga B a = ⊥ ∧
    BCCanonicalFiltration.nonnegative Ga D a = ⊤ := by sorry -- affine
example : BCCanonicalFiltration.positive shifted B a = ⊤ ∧
    BCCanonicalFiltration.nonnegative shifted D a = ⊤ := by sorry -- positive
example : BCCanonicalFiltration.positive otherPoint B a = ⊤ := by sorry -- otherPoint
end BCCanonicalFiltrationTest
end FiltrationExamples

section LatticeMonodromy
variable {R Kp V : Type u} [CommRing R] [NormedField Kp] [Algebra R Kp]
variable [NormedAddCommGroup V] [NormedSpace Kp V]
variable [Module R V] [IsScalarTower R Kp V] [Nontrivial V]
/-- PureModelTest.localNotGlobal: the actual bounded-lattice obstruction.
The perfected Tate curve supplies the omitted monodromy representation. -/
example (p : Kp) (hp : p ≠ 0) (hnorm : ‖p‖ ≠ 1) :
    ¬ ∃ N : Submodule R V, Bornology.IsBounded (N : Set V) ∧
      Submodule.span Kp (N : Set V) = ⊤ ∧
      Set.BijOn (fun x : V => p • x) (N : Set V) (N : Set V) := by sorry
end LatticeMonodromy

/-! Named theorem signatures. The full geometric contracts and omitted clauses
are recorded by declaration in the contract index following these signatures.
The category C in each section is the owner's category, not an arbitrary
asserted model of the curve. -/
section BasicTheorems
variable {K U V T : Type u} [Field K] [AddCommGroup U] [Module K U]
variable [AddCommGroup V] [Module K V] [AddCommGroup T] [Module K T]
/-- Lubin–Tate universal cover and eigensections have a linear comparison
compatible with evaluation/logarithm. Period expansion and v-naturality omitted. -/
theorem LubinTateUniversalCover (evaluation : V →ₗ[K] T) (logarithm : U →ₗ[K] T) :
    ∃ e : U ≃ₗ[K] V, evaluation.comp e.toLinearMap = logarithm := by sorry
end BasicTheorems
section CategoricalTheorems
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- The source identifies the three objects/arrows with O, O(1), O_untilt.
Those identifications and the E_infty untilt condition are omitted. -/
theorem FundamentalExactSequence (s : ShortComplex C) : s.ShortExact := by sorry
/-- Actual exact complex on BC objects. Negativity, relative base change and
the derived-boundary construction of f,g are omitted; geometry is in the index. -/
theorem FamiliesOfBanachColmezSpaces {A B D : C} (f : A ⟶ B) (g : B ⟶ D)
    (h : f ≫ g = 0) : (ShortComplex.mk f g h).ShortExact := by sorry
/-- The finite-dimensional-constant and slope-zero-bundle categories are supplier
categories. Tensor/exact structures and the implementing functor are omitted. -/
def SlopeZeroLocalSystems {D : Type u} [Category.{v} D] : C ≌ D := by sorry
/-- Le Bras's exact hypercohomology equivalence, with the tilted heart's type.
The supplied C category must be Coh_X and D the realized BC category. -/
def LeBrasEquivalence {D : Type u} [Category.{v} D]
    [HasDerivedCategory.{w} C] (slopes : C → List (WithTop ℚ)) :
    BCTiltedHeart slopes ≌ D := by sorry
/-- Generated kernel/cokernel/extension closure is abelian. The independent
Dimension formula belongs to BCPresentation.dimension and the contract index. -/
@[instance_reducible]
def DimensionAbelian (Qp Ga : C) :
    Abelian (ObjectProperty.FullSubcategory (AbstractBC Qp Ga)) := by sorry
/-- Faithfulness of evaluation on realized BC, with exactness on a supplied
short complex. Banach topology/strictness is omitted. -/
theorem ExactBanachPoints {D : Type u} [Category.{v} D] [Abelian D]
    (evaluate : C ⥤ D) [evaluate.PreservesZeroMorphisms]
    (s : ShortComplex C) (hs : s.ShortExact) :
    evaluate.Faithful ∧ (s.map evaluate).ShortExact := by sorry
/-- The actual Hom zero statement; source curvature, not height, is the input. -/
theorem CurvatureHomOrthogonality (Ga : C) (powers : ℕ → C) {X Y : C}
    (hx : BCCurvature.positive Ga X) (hy : BCCurvature.negative powers Y) :
    ∀ f : X ⟶ Y, f = 0 := by sorry
/-- Artinian means descending chains of BC subobjects stabilize. -/
theorem ArtinianBc (W : C) (chain : ℕ → Subobject W)
    (h : ∀ n, chain (n+1) ≤ chain n) :
    ∃ N, ∀ n, N ≤ n → chain n = chain N := by sorry
/-- Source heights on actual BC objects; period realization omitted. -/
theorem CurvatureHeightSigns (Ga : C) (powers : ℕ → C) (height : C → ℤ)
    (W : C) :
    (BCCurvature.affine Ga W → height W = 0) ∧
    (BCCurvature.negative powers W → ¬ IsZero W → 0 < height W) ∧
    (BCCurvature.positive Ga W → height W ≤ 0) := by sorry
/-- Height-zero subobjects of torsion objects are torsion; realization as
BdRplus-modules and its forgetful functor are omitted. -/
theorem TorsionSubobjectsHeight (height : C → ℤ) {U W : C}
    (f : U ⟶ W) [Mono f] : 0 ≤ height U := by sorry
/-- The source's generating-image and BdRplus-target hypotheses are omitted.
The nonzero cokernel condition remains expressible and indispensable. -/
theorem GeneratingImageCokernel (Ga : C) (height : C → ℤ)
    {W₁ W₂ : C} (f : W₁ ⟶ W₂) (h : ¬ IsZero (cokernel f)) :
    BCCurvature.positive Ga (cokernel f) ∧ height (cokernel f) < 0 := by sorry
/-- Monos preserve negative curvature; quotients preserve positive curvature. -/
theorem CurvatureSubquotients (Ga : C) (powers : ℕ → C) {U W Q : C}
    (i : U ⟶ W) [Mono i] (q : W ⟶ Q) [Epi q] :
    (BCCurvature.negative powers W → BCCurvature.negative powers U) ∧
    (BCCurvature.positive Ga W → BCCurvature.positive Ga Q) := by sorry
/-- Actual extension pattern of the source. Identifying V as finite constant
and M as a finite-length BdRplus-module is omitted. -/
theorem NonpositiveCurvatureExtensions {D : Type u} [Category.{v} D]
    (forget : D ⥤ C) (Ga W : C) :
    BCCurvature.nonpositive forget W ↔
    ∃ s : ShortComplex C, s.ShortExact ∧ Nonempty (s.X₂ ≅ W) ∧
      BCCurvature.affine Ga s.X₃ := by sorry
end CategoricalTheorems

section NumericalTheorems
/-- BC dimensions of B_m and of the standard positive/negative spaces.
Their geometric identities are omitted; the sign and integer formulas remain. -/
theorem StandardDimensionExamples (h m : ℕ) (d : ℤ) :
    presentationDimension m 0 0 = (m,0) ∧
    (if 0 ≤ d then (d,(h : ℤ)) else (-d,-(h : ℤ))) =
      (|d|, if 0 ≤ d then (h : ℤ) else -(h : ℤ)) := by sorry
/-- Typed Euler–Poincaré height comparison. The h₀,h₁ supplied are actual
cohomology heights; computing them from Coh_X is omitted. -/
theorem EulerPoincareHeight {C D : Type u} [Category.{v} C] [Category.{v} D]
    [Abelian C] [Abelian D] (RGamma : C ⥤ CochainComplex D ℤ)
    (height : D → ℤ) (rank : C → ℕ) (E : C) :
    height ((RGamma.obj E).homology (0 : ℤ)) -
      height ((RGamma.obj E).homology (1 : ℤ)) = (rank E : ℤ) := by sorry
/-- The embedding/no-V₁ condition is a categorical statement in the full
contract. Its numerical consequence excludes the zero object. -/
theorem EmbeddingHeightBound (dim : ℕ) (height : ℤ)
    (h : (dim : ℤ) < height) :
    (dim = 0 ∨ -(height : ℚ)/(dim : ℚ) < -1) := by sorry
/-- All geometric smoothness and degree-local-constancy clauses are omitted. -/
theorem PositiveRangeDimension (d₀ d₁ : ℤ) (r₀ r₁ : ℕ) (h : 0 ≤ d₀-d₁) :
    ((BCHNInvariants.fromHeart d₀ d₁ r₀ r₁ h).rank,
      (BCHNInvariants.fromHeart d₀ d₁ r₀ r₁ h).degree) =
        ((d₀-d₁).toNat, (r₁ : ℤ)-r₀) := by sorry
/-- Only the normalization core: the untilt line has slope 1/a, not 1. -/
theorem UntiltPositiveLine (a : ℕ) (ha : 0 < a) : 0 < (1 : ℚ)/a := by sorry
/-- Retains the finite coefficient extension in the BC dimension. -/
theorem SemistablePeriodExample (extensionDegree : ℕ) :
    presentationDimension extensionDegree 2 0 = (extensionDegree,2) := by sorry
/-- Equal rational slope, not identical coefficient fields or fibre ranks. -/
theorem PurityDenominatorIndependence (c e : ℤ) (d f : ℕ)
    (hd : d ≠ 0) (hf : f ≠ 0) :
    (c : ℚ)/d = (e : ℚ)/f ↔ c*(f : ℤ) = e*(d : ℤ) := by sorry
end NumericalTheorems

section RelativeSignatures
variable {X : Type u} [TopologicalSpace X]
/-- Upper semicontinuity of ordinates, with its precise strict-sublevel convention.
Actual FF polygons and rank/degree local constancy are omitted. -/
theorem SemicontinuityOfHnPolygon (polygon : X → ℚ → ℚ) (n : ℕ)
    (t : ℚ) (ht : 0 ≤ t ∧ t ≤ n) :
    ∀ a : ℚ, IsOpen {x | polygon x t < a} := by sorry
/-- KL lower semicontinuity uses strict *superlevel* sets. -/
theorem RobbaPolygonSemicontinuity (polygon : X → ℚ → ℚ) (n : ℕ)
    (t : ℚ) (ht : 0 ≤ t ∧ t ≤ n) :
    ∀ a : ℚ, IsOpen {x | a < polygon x t} := by sorry
/-- An open dense locus with locally constant polygon; coefficient/continuity
bounds needed for finiteness of profiles are in the full contract. -/
theorem BoundedPolygonsDenseLocus (polygon : X → ℚ → ℚ) :
    ∃ U : Set X, IsOpen U ∧ Dense U ∧
      ∀ x ∈ U, ∃ V : Set X, IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
        ∀ y ∈ V, polygon y = polygon x := by sorry
/-- Actual pointwise-pure locus defined by equality of fibre slopes.
The period-module and analytic-field hypotheses are omitted. -/
theorem PurityOpenness (slopes : X → List ℚ) :
    IsOpen {x | ∀ a ∈ slopes x, ∀ b ∈ slopes x, a=b} := by sorry
/-- Partial properness is a diamond/adic predicate missing at the pins. -/
theorem AdicPurityLoci (slopes : X → List ℚ) :
    IsOpen {x | ∀ a ∈ slopes x, a=0} ∧
    IsOpen {x | ∀ a ∈ slopes x, ∀ b ∈ slopes x, a=b} := by sorry
/-- Surjective descent of the every-fibre slope condition. -/
theorem SurjectivePurityDescent {Y : Type u} (f : Y → X)
    (hf : Function.Surjective f) (s : X → List ℚ) (a : ℚ) :
    (∀ x, ∀ b ∈ s x, b=a) ↔ (∀ y, ∀ b ∈ s (f y), b=a) := by sorry
end RelativeSignatures

section PureComparisons
variable {C D : Type u} [Category.{v} C] [Category.{v} D]
/-- Only full Robba coefficients have this equivalence; the full-faithful
bounded/integral cases and Tate-curve counterexample are in the contract index. -/
def RingSheafFrobeniusComparison : C ≌ D := by sorry
/-- C,D represent two of the six explicitly listed coefficient/site categories. -/
def PureModulesLocalSystems : C ≌ D := by sorry
/-- Integral étale local systems and integral Frobenius models, retaining
lattices. Rationalization/isogeny compatibility is in the contract index. -/
def IntegralFrobeniusLocalSystems : C ≌ D := by sorry
/-- C=finite free Z_p local systems, D=φ^{-1} modules on Y_[0,r].
The characteristic-p boundary is not discarded in this signature's contract. -/
def IntegralBoundaryRealization : C ≌ D := by sorry
/-- C=G(Z_p) torsors, D=φ^{-1}-G torsors on Y_[0,r].
Smoothness, affineness and connected integral fibres of G are omitted. -/
def IntegralGroupTorsors : C ≌ D := by sorry
/-- Torsion coherent sheaves supported at a specified untilt point vs finite
length completed-DVR modules. Constructing C,D and the point is omitted. -/
def TorsionPointRealization : C ≌ D := by sorry
/-- Only support at the distinguished point gives curvature zero. -/
def AffineFiniteLengthEquivalence : C ≌ D := by sorry
end PureComparisons

section RemainingGeometry
variable {X : Type u} [TopologicalSpace X]
/-- Supported underlying-space clause. The diamond and proper-morphism
clauses have no pinned carrier and are omitted. -/
theorem PropernessOfProjectivizedBc :
    ∀ x : X, ∃ U : Set X, x ∈ U ∧ IsOpen U ∧ SpectralSpace U := by sorry
/-- X is the *punctured* absolute space of a nonzero pure isocrystal.
Purity, sign reversal, smoothness and relative projectivization are omitted. -/
theorem AbsoluteBcSpatiality : SpectralSpace X := by sorry
/-- The failure of absolute quasiseparation is a real topology condition.
X is punctured BC(O(d)), γ is multiplication by π, d≥1; realization omitted. -/
theorem PuncturedAbsoluteQuotients (γ : X ≃ₜ X) :
    ¬ QuasiSeparatedSpace (Quotient (contractingOrbit γ)) := by sorry
/-- Div^d is supplied by RF2; scalar quotient comparison at points only.
Σ_d cover, v-sheafification, spatiality and smoothness are omitted. -/
def DivisorSectionComparison {E V Div : Type u} [Field E] [AddCommGroup V]
    [Module E V] : BCProjectivization (E := E) (V := V) ≃ Div := by sorry
/-- D is the quaternion division group, N its reduced norm, U punctured
positive BC. The determinant-one quotient is retained in the type. -/
def NegativeQuaternionExample {E G U W : Type u} [Field E] [Group G]
    (N : G →* Eˣ) [MulAction N.ker U] : W ≃ Quotient (MulAction.orbitRel N.ker U) := by sorry
/-- U is the independent-pair locus. The untilt and extension construction
are omitted, but the actual quotient group is SL₂, not GL₂. -/
def NegativeSl2Example {E U W : Type u} [Field E]
    [MulAction (Matrix.SpecialLinearGroup (Fin 2) E) U] :
    W ≃ Quotient (MulAction.orbitRel (Matrix.SpecialLinearGroup (Fin 2) E) U) := by sorry
end RemainingGeometry

section Resolutions
variable {C : Type u} [Category.{v} C] [Abelian C]
variable (slopes : C → List ℚ) (rank : C → ℕ) (degree : C → ℤ)
/-- Analytic locality and actual identifications with unit/twist bundles are
omitted. The rank and degree of the slope-1/r middle term remain. -/
theorem PositiveSlopeResolution (E : C) (r : ℕ) (hr : 0 < r)
    (h : ∀ a ∈ slopes E, (1 : ℚ)/r ≤ a) :
    ∃ s : ShortComplex C, s.ShortExact ∧ Nonempty (s.X₃ ≅ E) ∧
      (∀ a ∈ slopes s.X₂, a=(1 : ℚ)/r) ∧
      (rank s.X₂ : ℤ) = degree E * r ∧
      (rank s.X₁ : ℤ) = degree E * r - rank E := by sorry
/-- First of the three source presentations; E′ is explicitly retained in
variants two and three in the contract index. Étale locality is omitted. -/
theorem StrictPositiveEtalePresentations (E : C) (r : ℕ) (hr : 0 < r)
    (h : ∀ a ∈ slopes E, (1 : ℚ)/r < a) :
    ∃ s : ShortComplex C, s.ShortExact ∧ Nonempty (s.X₃ ≅ E) ∧
      (∀ a ∈ slopes s.X₁, a=0) ∧ (degree s.X₂ = degree E) := by sorry
/-- Only the universally negative H⁰ clause. The distinct pro-étale and
étale-local H¹ clauses are omitted until cover/base-change carriers exist. -/
theorem RelativeCohomologyVanishing (RGamma : C ⥤ CochainComplex C ℤ)
    (E : C) (h : ∀ a ∈ slopes E, a < 0) :
    IsZero ((RGamma.obj E).homology (0 : ℤ)) := by sorry
/-- The canonical nested subobjects; pro-étale splitting requires a cover
carrier and O(λ) identifications, which are omitted. -/
theorem RelativeHnFiltrationAndProetaleSplitting (E : C) :
    ∃ F : ℚ → Subobject E, (∀ a b, a ≤ b → F b ≤ F a) ∧
      (∃ a, F a = ⊤) ∧ (∃ b, F b = ⊥) := by sorry
/-- Actual étale-at-the-point slope condition for the middle object.
Perfectoid point and Proj/Robba comparison are omitted. -/
theorem EtaleAtPointResolution (E : C) (h : ∀ a ∈ slopes E, 0 ≤ a) :
    ∃ s : ShortComplex C, s.ShortExact ∧ Nonempty (s.X₃ ≅ E) ∧
      ∀ a ∈ slopes s.X₂, a=0 := by sorry
/-- Nonnegative middle term; O(−1) identification of the first object and
KL's hypothesis at a chosen point are omitted. -/
theorem NonnegativeExtension (E : C) (h : ∀ a ∈ slopes E, 0 ≤ a)
    (nonzeroSlope : ∃ a ∈ slopes E, a ≠ 0) :
    ∃ s : ShortComplex C, s.ShortExact ∧ Nonempty (s.X₃ ≅ E) ∧
      ∀ a ∈ slopes s.X₂, 0 ≤ a := by sorry
/-- Supplied profile agrees with every-chart profile; Proj ample criterion omitted. -/
theorem AmpleIffPointwise {I X : Type u} [Nonempty I] (s : X → List ℚ) :
    RelativeAmple (fun _ : I => s) ↔ PointwiseAmple s := by sorry
/-- On a geometric analytic-field fibre. H⁰ generation is a separate clause
of the full contract, requiring the missing evaluation sheaf map. -/
theorem GeometricPositiveGeneration (RGamma : C ⥤ CochainComplex C ℤ)
    (E : C) (h : ∀ a ∈ slopes E, 0 < a) :
    IsZero ((RGamma.obj E).homology (1 : ℤ)) := by sorry
end Resolutions

section LinearFrobenius
variable {R M : Type u} [Field R] [AddCommGroup M] [Module R M]
/-- Bases on annuli and Frobenius matrix bounds are omitted; the basis
extension target retains an actual linear equivalence. -/
def AnnularBasisApproximation (n : ℕ) : (Fin n → R) ≃ₗ[R] M := by sorry
/-- A normalized Frobenius has a fixed basis after the finite-étale extension
in the contract; that coefficient-extension/locality carrier is omitted. -/
theorem PureModelTrivialization (F : M ≃+ M) (p : R) (c : ℤ) (d n : ℕ) :
    ∃ e : (Fin n → R) ≃ₗ[R] M, ∀ v, p^c • (F^[d]) (e v) = e v := by sorry
/-- Actual gauge equation. The finite-étale extension, near-identity matrix
bounds, diagonal powers and mod-p assertion are omitted. -/
theorem DiagonalGaugeNormalForm {n : ℕ}
    (A D : Matrix (Fin n) (Fin n) R)
    (φ : Matrix (Fin n) (Fin n) R → Matrix (Fin n) (Fin n) R) :
    ∃ U : Matrix (Fin n) (Fin n) R, IsUnit U ∧ U⁻¹ * A * D * φ U = D := by sorry
/-- The unique proper nontrivial HN vertex, retaining its actual submodule.
Slope, rank and saturated quotient conditions are omitted. -/
theorem ConstantVertexSubmodule (m : ℕ) (F : M ≃+ M) :
    ∃ N : Submodule R M, Module.finrank R N = m ∧
      ∀ x ∈ N, F x ∈ N := by sorry
/-- Coefficient, constant-polygon, purity and uniqueness clauses are omitted;
this signature gives the actual nested exhaustive finite module filtration. -/
theorem RobbaConstantPolygonFiltration :
    ∃ n : ℕ, ∃ N : Fin (n+1) → Submodule R M,
      N 0 = ⊥ ∧ N (Fin.last n) = ⊤ ∧ Monotone N := by sorry
/-- H⁰_F is its actual fixed vectors; H¹ detection is an actual injectivity
statement for a supplied map to the fibre product. Negative slopes are omitted. -/
theorem NegativeFrobeniusCohomologyDetection (F : M ≃+ M)
    {I : Type u} (H1 : Type u) (fibres : I → Type u) (restrict : H1 → ∀ i, fibres i) :
    (∀ x : M, F x = x → x=0) ∧ Function.Injective restrict := by sorry
end LinearFrobenius

section RemainingProfiles
/-- Positive F eventually dominates fixed G: exact finite-profile slope sums.
Compact-base uniform boundedness is omitted; here both profiles are finite. -/
theorem PositiveTensorDomination (s t : List ℚ) (hs : ∀ a ∈ s, 0 < a) :
    ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      ∀ a ∈ s, ∀ b ∈ t, 0 < n*a+b := by sorry
/-- The actual two-out-of-three pure slope criterion on an exact sequence
with the HN multiset identity. The KL geometric model equivalence is omitted. -/
theorem PureTwoOutOfThree (s t u : List ℚ) (a : ℚ) (h : t.Perm (s++u)) :
    ((∀ b ∈ s, b=a) ∧ (∀ b ∈ u, b=a) → ∀ b ∈ t, b=a) ∧
    ((∀ b ∈ s, b=a) ∧ (∀ b ∈ t, b=a) → ∀ b ∈ u, b=a) ∧
    ((∀ b ∈ t, b=a) ∧ (∀ b ∈ u, b=a) → ∀ b ∈ s, b=a) := by sorry
/-- Only the every-fibre common-slope predicate; constructing local pure
models over each of the three coefficient rings is omitted. -/
theorem AllRingsPointwisePurity {X : Type u} (slopes : X → List ℚ)
    (a : ℚ) (h : ∀ x, ∀ b ∈ slopes x, b=a) :
    ∀ x, ∀ b ∈ slopes x, ∀ c ∈ slopes x, b=c := by sorry
/-- Concrete monodromy obstruction on a rational line; constructing its
Tate-curve sheaf and the ring-level/ sheaf-level distinction is omitted. -/
theorem LocalGlobalPurityCounterexamples (p : ℚ) (hp : p ≠ 0) (h : p ≠ 1) :
    Function.Bijective (fun x : ℚ => p*x) ∧ ¬ ∀ x : ℚ, p*x=x := by sorry
end RemainingProfiles

section RemainingBC
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Actual splitting type; geometric HN grades and the connected/étale
quotient distinction are omitted and retained in the full contract. -/
theorem BcHnDecomposition (W : C) :
    ∃ A B : C, Nonempty (W ≅ A ⊞ B) := by sorry
/-- The matrix Hom equivalence is already BCTiltedHeart.homMatrix.
This signature retains the End ring's carrier as an actual endomorphism set;
Brauer invariant and period-basis formula are omitted. -/
def BcMorphismCalculus (W : C) (D : Type u) : (W ⟶ W) ≃ D := by sorry
/-- The BdRplus-module realization and killed-by-t^r hypotheses are omitted.
Maps are arbitrary VS maps, not assumed BdR-linear. -/
theorem TorsionVsHomVanishing (W BdRplus BdR : C) :
    (∀ f : W ⟶ BdRplus, f=0) ∧ (∀ f : W ⟶ BdR, f=0) := by sorry
/-- Subobject curvature criterion using actual section functors. The
nonnegative coherent slope condition and torsion support at ∞ are omitted. -/
theorem CurvatureHnCharacterisation (powers : ℕ → C) (sections : C ⥤ C) (W : C) :
    BCCurvature.negative powers W ↔ ∃ E : C, Nonempty (W ≅ sections.obj E) := by sorry
end RemainingBC

end TauCeti.BanachColmez

/-! Full contract index

Each named signature above gives the supported component only. The precise
contract below is the roadmap statement. A missing Perf/FF/period/local-system
realization, cover, diamond properness or smoothness clause remains omitted from
the type, as required by PROTOCOL section 13. No arbitrary Prop field stands
in for it. Functors, category parameters, object names, slopes and height maps
are supplier interfaces: the prototype does not prove they form a geometric
model. In particular the pointwise scalar quotient is not a v-sheaf quotient,
the sympathetic domain is not arbitrary Banach algebras, and fibre semilinearity
is not the local-system sheaf condition.

Names after "Test" label the corresponding example in its namespace. Numerical
components do not verify geometric fixtures such as O(−1), the untilt point or
the Tate-curve local system. The contracting-action lemma has all its stated
topological hypotheses; most geometric target signatures are schematic. G-LEAN
records these limitations. Every proof remains admitted.

VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition
Declaration: BC
Contract: For a perfectoid S/F_q and a bundle E on X_S, BC(E)(T)=H⁰(X_T,E_T). If E has
only negative geometric slopes, BCneg(E)(T)=H¹(X_T,E_T). For a complex [E₁→E₀] in
COHOMOLOGICAL degrees −1,0 with H⁰(X_T,E₁,T)=0 for EVERY T/S, BCcomplex(T)=H⁰
RΓ(X_T,[E₁→E₀]_T), the degree-zero hypercohomology v-sheaf. No representability is
assumed. FS calls these homological degrees [0,1].
API BC: The v-sheaf T↦H⁰(X_T,E_T).
API BCneg: For universally negative slopes, T↦H¹(X_T,E_T).
API BCcomplex: Degree-zero hypercohomology of [E₁→E₀] in degrees −1,0, with universal
H⁰(E₁) vanishing.
API BC.module: BC(E), BCneg(E) and BCcomplex are sheaves of E-modules on Perf_S, E
acting through O_{X_T}, and BC.map is E-linear. This scalar action is the one
BCProjectivization divides out.
API BC.map: A bundle or complex map induces the corresponding E-linear map of v-sheaves;
identity and composition are preserved.
API BC.exactSequence: A short exact sequence 0→E′→E→E″→0 of bundles gives an exact
sequence of E-module v-sheaves 0→BC(E′)→BC(E)→BC(E″)→H¹(E′)→H¹(E)→H¹(E″)→0 (Prop. II.2.1
and the two-term complex); for [E₁→E₀] with E₁ universally negative it gives
0→BC(E₀)→BCcomplex→BCneg(E₁)→H¹(E₀).
API BC.baseChange: For U→S, restriction of BCcomplex on Perf_U is BCcomplex of the
pulled-back complex.
API BC.directSum: BCcomplex(K⊕L)≅BCcomplex(K)⊕BCcomplex(L) in the abelian category of
E-module v-sheaves.
Test BCtest.zero (degenerate): The zero complex has zero BC v-sheaf.
Test BCtest.single (compatibility): BCcomplex([0→E])=BC(E) and BCcomplex([E→0])=BCneg(E)
when E is negative.
Test BCtest.constantSections (computation): For S the disjoint union of two geometric
points, BC(O)(S)=E², not E; BC(O) is the constant SHEAF underline E.
Test BCtest.hypercohomology (non-example): For [O(−1)→0] over a geometric point,
BCcomplex=H¹(O(−1))≠0 although the cokernel of the map of H⁰ groups is zero.

VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover
Declaration: LubinTateUniversalCover
Contract: Let S = Spa(R,R^+) be affinoid perfectoid over F_q with untilt S^sharp over E,
and let O_{X_S}(1) correspond to the isocrystal (E, pi^{-1}). Then X -> sum over i in Z
of pi^i [X^{q^{-i}}] defines a natural isomorphism G-tilde(R^{sharp+}) = R^{circ circ}
-> H^0(X_S, O(1)) = H^0(Y_S, O_{Y_S})^{phi = pi}, and the evaluation map H^0(X_S,O(1))
-> R^sharp at S^sharp is the logarithm map log_G : G-tilde(R^{sharp+}) -> G(R^{sharp+})
-> R^sharp.

VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence
Declaration: FundamentalExactSequence
Contract: For any perfectoid S with untilt S^sharp over E_infty, the above construction
gives an exact sequence 0 -> O_{X_S} -> O_{X_S}(1) -> O_{S^sharp} -> 0 of
O_{X_S}-modules. Consequently there is a well-defined map BC(O(1)) minus {0} -> Div^1
sending a nonzero section f to V(f), and it descends to an isomorphism (BC(O(1)) minus
{0})/E^times = Div^1. The scalar E×-torsor is the Lubin–Tate Tate-module torsor; its
comparison with the divisor-to-Weil-group map imports VS1 and arithmetic local
reciprocity, rather than reproving class field theory.

VectorBundlesAndIsocrystals:VB3:projectivized-properness/properness-of-projectivized-BC
Declaration: PropernessOfProjectivizedBc
Contract: Let S be a perfectoid space over F_q and E a vector bundle on X_S. Then BC(E)
: T -> H^0(X_T, E|_{X_T}) is a locally spatial diamond, partially proper over S, and
(BC(E) minus {0})/E^times is a locally spatial diamond, proper over S. The proof uses
only ampleness (II.2.6) and the positive-twist statement II.2.5(iii); it does not use
the classification theorem.

VectorBundlesAndIsocrystals:VB3:projectivized-properness/contracting-action-lemma
Declaration: ContractingActionLemma
Contract: Let X be a taut locally spectral space such that for every x the set X_x of
generalizations of x is a totally ordered chain under specialization. Let gamma be an
automorphism of X whose fixed-point set X_0 is a spectral space, such that (i) for all
x, gamma^n(x) converges to X_0 as n -> +infinity, and (ii) for all x outside X_0,
gamma^n(x) leaves every quasicompact open as n -> -infinity. Then X_0 is closed, gamma
acts freely and totally discontinuously on X minus X_0, and (X minus X_0)/gamma^Z is a
spectral space.

VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution
Declaration: PositiveSlopeResolution
Contract: If all geometric slopes of a bundle E are ≥1/r, r≥1, then analytically locally
on S there is 0→O^m→F→E→0 with F fibrewise semistable of SLOPE 1/r. On a constant-rank
n, degree d component, rank(F)=dr and m=dr−n. This extends FS II.3.1’s geometric
construction via II.3.3(i). Rank-zero E is treated separately.

VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces
Declaration: FamiliesOfBanachColmezSpaces
Contract: For [E₁→E₀] in degrees −1,0, with E₁ negative at every geometric point of S,
BCcomplex is a locally spatial diamond partially proper over S; its punctured
E×-quotient is locally spatial and proper over S. If E₀ is everywhere strictly positive,
BCcomplex→S is cohomologically smooth. In this positive range,
0→BC(E₀)→BCcomplex→BCneg(E₁)→0 is exact as E-module v-sheaves. Neither unpunctured
absolute spatiality nor perfectoid representability is asserted.

VectorBundlesAndIsocrystals:VB3:general-BC/absolute-BC-spatiality
Declaration: AbsoluteBcSpatiality
Contract: Work on Perf_k, k = algebraic closure of F_q (the absolute base). Let D be a
nonzero isocrystal with only negative slopes (resp. only positive slopes); the bundle
functor reverses slopes, so E(D) has only positive (resp. only negative) HN slopes. (i)
The punctured Banach–Colmez space BC(D)∖{0} (resp. BC(D[1])∖{0}) is a spatial DIAMOND.
(ii) The quotient (BC(D)∖{0})/E^× → ∗ (resp. (BC(D[1])∖{0})/E^× → ∗) is proper,
representable in spatial diamonds and cohomologically smooth. The punctured spaces are
open in the cohomologically smooth BC(D) (resp. BC(D[1])) and so are cohomologically
smooth over ∗. Relative representability in spatial diamonds does not assert that every
total quotient over the non-spatial absolute base is spatial: (BC(O(d))∖{0})/π^Z is not
quasiseparated (FS Remark II.3.10).

VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon
Declaration: SemicontinuityOfHnPolygon
Contract: For a constant-rank n bundle E on X_S, the concave HN polygon, horizontal
coordinate rank and decreasing slopes repeated with their ranks, is upper semicontinuous
on |S|: for every x∈[0,n] its ordinate is upper semicontinuous. Rank and total degree
are locally constant. This is FS II.2.19(i), including equal-characteristic coefficient
fields. The polygon is the UPPER boundary of the convex hull of the exterior-power
section points; do not replace it by KL’s convex lower polygon.

VectorBundlesAndIsocrystals:VB4/relative-HN-filtration-and-proetale-splitting
Declaration: RelativeHnFiltrationAndProetaleSplitting
Contract: Assume the HN polygon of E is constant on S. Then there exists a global
separated exhaustive decreasing Harder-Narasimhan filtration E^{>= lambda} in E
specialising to the HN filtration at each point; and after replacing S by a PRO-ETALE
cover the filtration can be split, with isomorphisms E^lambda =
O_{X_S}(lambda)^{n_lambda} for integers n_lambda >= 0.

VectorBundlesAndIsocrystals:VB4/slope-zero-local-systems
Declaration: SlopeZeroLocalSystems
Contract: There is an exact tensor equivalence between finite-rank pro-étale E-local
systems on S and vector bundles on X_S whose EVERY geometric HN slope is zero, via
L↦L⊗_E O_X. The quasi-inverse is T↦H⁰(X_T,E_T); it commutes with perfectoid base change
and coefficient extension with its normalized Frobenius. Locally constant rank is
handled componentwise. Total degree zero alone does not suffice.

VectorBundlesAndIsocrystals:VB3:general-BC/strict-positive-etale-presentations
Declaration: StrictPositiveEtalePresentations
Contract: Let S∈Perf_Fq, E a bundle on X_S and r≥1. (a) If all HN slopes of E at all
geometric points are >1/r, then étale locally on S, for some m≥0, there is
0→G→O(1/r)^m→E→0 with G fibrewise SEMISTABLE of slope 0 (FS II.3.2, II.3.3(iii)). (b) If
all slopes are ≥1/r, then locally on S there is 0→O(1/(2r))^m→F→E′→0 with F fibrewise
semistable of slope 1/r and E a direct summand of E′ (II.3.3(ii)). (c) If all slopes are
>1/r, then étale locally on S there is 0→G→O(1/r)^m→E′→0 with G fibrewise semistable of
slope 1/(2r) and E a direct summand of E′ (II.3.3(iv)). Claims (b) and (c) retain E′. On
a component where E has constant degree d, the sequence in (a) forces m=d, since O(1/r)
has rank r and degree 1 (FS print m=dr, E29). Fibrewise semistability, not merely degree
zero, is what the subsequent separatedness and pro-étale trivialization arguments use.

VectorBundlesAndIsocrystals:VB4/relative-cohomology-vanishing
Declaration: RelativeCohomologyVanishing
Contract: For a bundle E on X_S: everywhere negative slopes imply H⁰(X_S,E)=0,
universally after perfectoid base change; everywhere nonnegative slopes imply
H¹(X_S,E)=0 after some pro-étale cover of S; everywhere positive slopes imply an étale
cover S′→S such that H¹(X_T,E_T)=0 for EVERY affinoid perfectoid T/S′. The second
assertion is local vanishing of cohomology, not vanishing on every original S.

VectorBundlesAndIsocrystals:VB3:general-BC/divisor-section-comparison
Declaration: DivisorSectionComparison
Contract: For d≥1, the already owned absolute divisor v-sheaf Div^d of degree-d relative
Cartier divisors is (BC(O(d))∖{0})/E^×. It is proper over ∗, representable in spatial
diamonds and cohomologically smooth. The sum map (Div¹)^d→Div^d is a quasi-pro-étale
cover identifying Div^d=(Div¹)^d/Σ_d as v-sheaves; in particular Div^d is a diamond (ECD
Propositions 11.4, 11.6).

VectorBundlesAndIsocrystals:VB3:general-BC/punctured-absolute-quotients
Declaration: PuncturedAbsoluteQuotients
Contract: Over Perf_k, for d≥1 the punctured absolute BC(O(d))∖{0} is a spatial diamond.
Its quotient (BC(O(d))∖{0})/π^Z is not quasiseparated and therefore not spatial; the
good object is the morphism (BC(O(d))∖{0})/π^Z → ∗, which is representable in spatial
diamonds, while (BC(O(d))∖{0})/E^× = Div^d → ∗ is proper and representable in spatial
diamonds. In equal characteristic the punctured positive absolute BC spaces (from pure
negative isocrystals) are perfectoid spaces, whereas the punctured negative ones (from
pure positive isocrystals) are only spatial diamonds. If E is p-adic, BC(O_{X_C}(−1)[1])
is not a perfectoid space (proof of FS Lemma II.2.15); in equal characteristic FS leave
this open (footnote 5).

VectorBundlesAndIsocrystals:VB3:general-BC/negative-quaternion-example
Declaration: NegativeQuaternionExample
Contract: Over Perf_k, the absolute punctured BC(O(−1)[1])∖{0} classifies extensions
0→O(−1)→E→O→0 that are non-split fiberwise; geometrically E≅O(−1/2). It identifies with
(BC(O(1/2))∖{0})/SL₁(D), where D is the quaternion division algebra over E (invariant
1/2) and SL₁(D) its reduced-norm-one group. After base change to Spa C with a chosen
untilt C♯/E, BC(O(−1)[1])×_k Spa C≅(A¹_{C♯})^♢/E and the punctured space becomes
(Ω_{C♯})^♢/E with Ω = A¹_E∖E = P¹_E∖P¹(E). The latter description uses the untilt and is
not an identification with a perfectoid quotient space.

VectorBundlesAndIsocrystals:VB3:general-BC/negative-sl2-example
Declaration: NegativeSl2Example
Contract: Over Perf_k, the absolute punctured BC(O(−2)[1])∖{0}≅U/SL₂(E), where
U⊂(BC(O(1))∖{0})² is the open locus of pairs of sections that are fiberwise nonzero and
E-linearly independent, U=(BC(O(1))∖{0})²∖(E^××1).Δ. The corresponding extension
0→O(−1)→O²→O(1)→0 is specified by a surjection and its determinant trivialization;
changing the determinant-preserving basis gives SL₂(E), not GL₂(E).

VectorBundlesAndIsocrystals:VB4/annular-basis-approximation
Declaration: AnnularBasisApproximation
Contract: Let M be a φ^a-module over ℛ̃_R with models M_r. (7.1.1) If v_1, …, v_n is a
basis of M_{[r/q,r]} on which φ^a acts via an invertible matrix over ℛ̃^{r/q}_R, then it
is a basis of M_r. (7.1.2) Let h ≥ 0, let D be diagonal with entries p^{d_1}, …, p^{d_n}
(d_i ∈ ℤ, no two differing by more than h), and let e_1, …, e_n be a basis of
M_{[r/q,r]} on which φ^a acts via F over ℛ̃^{[r/q,r/q]}_R with λ(α^{r/q})(FD − 1) <
p^{−h}. Then M_r has a basis v_j = Σ_i U_{ij} e_i on which φ^a acts via F′ with F′D − 1
having entries in pℛ̃^{int,r/q}_R, where λ(α^{r/q})(U − 1), λ(α^r)(D^{−1}UD − 1) <
p^{−h}.

VectorBundlesAndIsocrystals:VB4/pure-models
Declaration: PureModel
Contract: Let c, d ∈ ℤ with d a positive multiple of a. A (c,d)-pure model of a
φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) is a W(R)-submodule (resp. ℛ̃^int_R-
submodule) M_0 of M which is bounded (there is a finitely generated submodule N_0 over
the same subring with p^n M_0 ⊆ N_0 and p^n N_0 ⊆ M_0 for some n ≥ 0) such that the
natural map M_0 ⊗_{W(R)} ℰ̃_R → M (resp. M_0 ⊗_{ℛ̃^int_R} ℛ̃^bd_R → M, M_0 ⊗_{ℛ̃^int_R}
ℛ̃_R → M) is an isomorphism and the φ^a-action on M induces an isomorphism (p^cφ^d)^*M_0
≅ M_0 (only stability of M_0[p^{−1}] under φ^d, not φ^a, is assumed; Remark 7.3.2). Its
existence makes M pointwise pure of constant slope c/d; a (0,d)-pure model is an étale
model; a pure model is (locally) free if its underlying module is finite (locally) free,
and a finitely presented pure model is locally free. A (locally free, free) local
(c,d)-pure model at β ∈ ℳ(R) is a rational localization R → R′ encircling β together
with a (locally free, free) (c,d)-pure model of the base extension of M to R′. M has a
locally free local pure model at β iff it has a free one, and over ℛ̃^bd_R this can be
tested over ℰ̃_R (Lemma 7.3.3). M is pure of slope s at β if it has a locally free local
(c,d)-pure model at β with c/d = s (forcing s = μ(M, β) when rank(M, β) > 0; every slope
when the rank is 0), pure if it is pure at every β (finitely many local models then
cover ℳ(R)), étale = pure of slope 0, and globally pure if it has a locally free pure
model. For the conditions (a) globally pure, (b) admits a pure model, (c) pure, (d)
admits local pure models, (e) pointwise pure: over ℰ̃_R and ℛ̃^bd_R, (a) strictly
implies (b) and (b)–(e) are equivalent; over ℛ̃_R, (a) strictly implies (b), (b)
strictly implies (c), and (c)–(e) are equivalent (by Corollaries 7.3.9 and 8.5.14 and
Examples 8.5.17 (Tate curve) and 8.5.18 (banana)). Purity of a φ^a-module over ℛ̃^bd_R
cannot be read off from its base extension to ℛ̃_R.
API PureModel: A bounded integral submodule generating the ambient Frobenius module,
with p^cφ^d linearization invertible.
API PureModel.lattice: The integral lattice is a Submodule of the restricted-scalars
module, with its actual inclusion.
API PureModel.baseChange: Rational localization transports the pure model, its
boundedness and its Frobenius isomorphism.
API PureModel.etale: A (0,d)-pure model is an étale model; globally pure means a
globally finite locally free such model.
API PureModel.fibreSlope: On a nonzero fibre a (c,d)-pure model forces the Robba slope
c/d, with p^cφ^d=1 on a trivializing basis.
Test PureModelTest.unit (computation): The trivial φ-module with unit integral lattice
is (0,a)-pure.
Test PureModelTest.zero (degenerate): The zero module is pure of every slope; it has no
distinguished numeric slope.
Test PureModelTest.scaled (computation): A rank-one action φ^d=p^{−c} with standard
lattice is (c,d)-pure, detecting the sign of p^c.
Test PureModelTest.localNotGlobal (non-example): The perfected Tate-curve local system
with p monodromy is locally étale but has no global integral étale model.

VectorBundlesAndIsocrystals:VB4/pure-model-trivialization
Declaration: PureModelTrivialization
Contract: If a φ^a-module M over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R) has a free (c,d)-pure model
M_0, there is an R-algebra S, the completed direct limit of faithfully finite étale
R-subalgebras, such that M_0 ⊗ W(S) (resp. M_0 ⊗ ℛ̃^int_S) has a basis fixed by p^cφ^d.

VectorBundlesAndIsocrystals:VB4/purity-openness
Declaration: PurityOpenness
Contract: Let M be a φ^a-module over ℛ̃_R of nowhere zero rank, β a point of its pure
locus, and c, d ∈ ℤ with d a positive multiple of a and c/d = μ(M, β). Every (c,d)-pure
model of M ⊗ ℛ̃_{ℋ(β)} extends to a free local (c,d)-pure model of M at β (Theorem
7.3.7). Consequently, for any φ^a-module M over ℛ̃_R: the pure and étale loci are open;
M is étale (resp. pure) iff it is pointwise étale (resp. pointwise pure); and M is pure
at β iff it has a (not necessarily locally free) local pure model at β.

VectorBundlesAndIsocrystals:VB4/diagonal-gauge-normal-form
Declaration: DiagonalGaugeNormalForm
Contract: Let M be a φ^a-module over ℛ̃^bd_R with a basis on which φ^a acts via AD, D
diagonal with entries in p^ℤ and A − 1 with entries in pℛ̃^int_R. Then there are an
R-algebra S which is the union (not only the completed union) of faithfully finite étale
R-subalgebras and an invertible U over W(S), congruent to 1 modulo p, with
U^{−1}ADφ^a(U) = D. In particular, at every β ∈ ℳ(R) the generic slopes of M are the
negatives of the p-adic valuations of the diagonal entries of D, divided by a.

VectorBundlesAndIsocrystals:VB4/robba-polygon-semicontinuity
Declaration: RobbaPolygonSemicontinuity
Contract: For any φ^a-module M over ℛ̃_R, β ↦ the slope polygon of M ⊗ ℛ̃_{ℋ(β)} is
lower semicontinuous on ℳ(R): where the rank is constant, for each x ∈ [0, rank M] the
y-coordinate of the polygon at x is a lower semicontinuous function of β, and it is
locally constant at x = rank M.

VectorBundlesAndIsocrystals:VB4/bounded-polygons-dense-locus
Declaration: BoundedPolygonsDenseLocus
Contract: For any φ^a-module M over ℛ̃_R, the slope polygons of M at the points of ℳ(R)
are bounded above and below (all slopes are at least −N/a for N as in Proposition 6.2.4,
and the sum of the slopes is continuous). Hence the polygon takes finitely many values
locally, and there is an open dense U ⊆ ℳ(R) on which it is locally constant.

VectorBundlesAndIsocrystals:VB4/constant-vertex-submodule
Declaration: ConstantVertexSubmodule
Contract: (7.4.8) Let A be an n × n matrix over ℛ̃^int_R invertible over ℛ̃^bd_R, x_1,
…, x_n ∈ ℛ̃^bd_R, and y_1, …, y_n ∈ ℰ̃_R with y_i − x_i = Σ_j A_{ij}φ^a(y_j). Then all
y_i lie in ℛ̃^bd_R iff their images lie in ℛ̃^bd_{ℋ(β)} for every β ∈ ℳ(R). (7.4.9) Let
M over ℛ̃_R have constant rank n and slopes μ_1(M,β) ≥ ⋯ ≥ μ_n(M,β) at β. If for some m
∈ {1, …, n−1} and all β we have μ_m(M,β) > μ_{m+1}(M,β) and μ_1 + ⋯ + μ_m constant,
there is a unique φ^a-submodule N of rank m with M/N a φ^a-module such that at every β
the slopes of N are μ_1, …, μ_m and those of M/N are μ_{m+1}, …, μ_n.

VectorBundlesAndIsocrystals:VB4/robba-constant-polygon-filtration
Declaration: RobbaConstantPolygonFiltration
Contract: If the slope polygon of a φ^a-module M over ℛ̃_R is constant on ℳ(R), there is
a unique filtration 0 = M_0 ⊂ ⋯ ⊂ M_l = M by φ^a-submodules whose quotients are
φ^a-modules pure of constant slope with μ(M_1/M_0) > ⋯ > μ(M_l/M_{l−1}).

VectorBundlesAndIsocrystals:VB4/negative-frobenius-cohomology-detection
Declaration: NegativeFrobeniusCohomologyDetection
Contract: If M over ℛ̃_R has everywhere negative slopes, then H^0_{φ^a}(M) = 0,
H^0_{φ^a}(M ⊗ ℛ̃_{ℋ(β)}) = 0 for all β ∈ ℳ(R), and H^1_{φ^a}(M) → ∏_β H^1_{φ^a}(M ⊗
ℛ̃_{ℋ(β)}) is injective. For any M this applies to M(n) for n small enough (by
Proposition 7.4.6); the injectivity also holds for n large, since then H^1_{φ^a}(M(n)) =
0 by Proposition 6.2.2.

VectorBundlesAndIsocrystals:VB4/ring-sheaf-frobenius-comparison
Declaration: RingSheafFrobeniusComparison
Contract: Let (R, R⁺) be a perfect uniform adic Banach algebra over 𝔽_p and X = Spa(R,
R⁺). For ∗ ∈ {ℰ̃, ℛ̃^bd, ℛ̃}, the natural functor from φ^d-modules over ∗_R to
φ^d-modules over the sheaf ∗_X (called local φ^d-modules over ∗_R) is fully faithful
(Theorem 5.3.3). For ∗ = ℛ̃ it is an equivalence of categories (Corollary 6.3.13); for ∗
= ℰ̃ and ∗ = ℛ̃^bd it is not (Example 8.5.17). A φ^d-module over ∗_R is pure (resp.
étale) if and only if the corresponding φ^d-module over ∗_X is.

VectorBundlesAndIsocrystals:VB4/adic-purity-loci
Declaration: AdicPurityLoci
Contract: Let X be a perfect uniform adic space over 𝔽_{p^d} and M a φ^d-module over
ℛ̃_X. Then the pure locus and the étale locus of M [printed 'of ℛ̃_X'] are open and
partially proper (partial properness, Definition 8.2.11, presupposes X over an analytic
field). In particular, by Lemma 8.2.12, if X is taut then so are the pure locus and the
étale locus.

VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems
Declaration: PureModulesLocalSystems
Contract: Let X be a perfectoid adic space over ℚ_{p^d}, X′ the corresponding perfect
uniform adic space over 𝔽_{p^d}, and c ∈ ℤ. The following categories are equivalent: (a)
étale (c, d)-ℚ_p-local systems over X; (b) étale (c, d)-ℚ_p-local systems over X′; (c)
étale (c, d)-ℚ_p-local systems over X_0′ for any adic space X_0′ whose inverse
perfection is isomorphic to X′; (d) (c, d)-pure φ-modules over ℰ̃_{X′}; (e) (c, d)-pure
φ-modules over ℛ̃^bd_{X′}; (f) (c, d)-pure φ-modules over ℛ̃_{X′}.

VectorBundlesAndIsocrystals:VB4/purity-denominator-independence
Declaration: PurityDenominatorIndependence
Contract: Let X be a perfect uniform adic space over 𝔽_{p^d}. A φ^d-module over ℰ̃_X,
ℛ̃^bd_X or ℛ̃_X is pure of slope s at a point x ∈ X if and only if it is (c′, d′)-pure
at x for every (not just one) pair of integers (c′, d′) with d′ a positive multiple of d
and c′/d′ = s.

VectorBundlesAndIsocrystals:VB4/all-rings-pointwise-purity
Declaration: AllRingsPointwisePurity
Contract: Let (R, R⁺) be as in Hypothesis 5.0.1 (a perfect uniform adic Banach algebra
over 𝔽_p that is a Banach algebra over an analytic field) and M a φ^d-module over ℰ̃_R,
ℛ̃^bd_R or ℛ̃_R. If M is pointwise pure (M ⊗ ℋ(β) is pure for every β ∈ ℳ(R)), then M is
pure (it admits a locally free local pure model at every β ∈ ℳ(R)).

VectorBundlesAndIsocrystals:VB4/surjective-purity-descent
Declaration: SurjectivePurityDescent
Contract: Let (R, R⁺) → (S, S⁺) be a bounded homomorphism of perfect uniform adic Banach
algebras over 𝔽_{p^d} such that Spa(S, S⁺) → Spa(R, R⁺) is surjective, and let M be a
local φ^d-module over ℰ̃_R (resp. ℛ̃^bd_R, ℛ̃_R). Then M is pure if and only if M ⊗ ℰ̃_S
(resp. M ⊗ ℛ̃^bd_S, M ⊗ ℛ̃_S) is pure. Corollary 8.5.16 globalizes this equivalence to
any surjective morphism of perfectoid adic spaces for full Robba sheaves.

VectorBundlesAndIsocrystals:VB4/local-global-purity-counterexamples
Declaration: LocalGlobalPurityCounterexamples
Contract: Let K = 𝔽_p((q)) with |q| = ω < 1, B = K{ω²/T, T, U/ω^{−2}}/(U(T − q) − 1) (so
Spa(B, B°) is the annulus ω² ≤ |T| ≤ 1 minus the open disc |T − q| < ω²), and B_1 =
K{ω²/T, T/ω²}, B_2 = K{1/T, T} (its boundary circles |T| = ω² and |T| = 1). The
substitution T ↦ q²T is an isomorphism σ_q: B_1 → B_2 [printed as a map B_2 → B_1];
identifying the two circles through it gives a strictly affinoid subspace Spa(A, A°) of
the Tate curve over K with parameter q², the analytification of a smooth projective
genus-1 curve over K. Glueing the trivial ℚ_p-local system on Spa(B, B°) along this
identification by matching the generator 1 on one circle with p on the other gives an
étale ℚ_p-local system V on Spa(A, A°). Let R, S, S_1, S_2 be the completed perfections
of A, B, B_1, B_2 and X = Spa(R, R°). Then V corresponds to no étale φ-module over ℰ̃_R
or ℛ̃^bd_R (a nonzero v would give x ∈ ℰ̃_S with x_2 = pσ_q(x_1) ∈ ℰ̃_{S_2}, forcing x ∈
∩_m p^m W(S) = 0). By Theorem 8.5.12, V does correspond to an étale φ-module over ℛ̃_R
and to étale φ-modules over ℰ̃_X and ℛ̃^bd_X, which therefore do not descend to ℰ̃_R,
ℛ̃^bd_R (an obstruction to glueing finite projective modules over these rings, Remark
5.3.7); and the étale φ-module over ℛ̃_R admits no étale model, locally free or not. For
the nodal example, we also retain Example 8.5.18 as a sheaf-level locally étale but not
globally étale counterexample; the ring-level strengthening is G-PATCH.

VectorBundlesAndIsocrystals:VB4/pure-two-out-of-three
Declaration: PureTwoOutOfThree
Contract: Assume Hypothesis 8.6.1. Let 0 → M_1 → M → M_2 → 0 be a short exact sequence
of φ-modules over ℛ̃_R. If any two of M, M_1, M_2 are (c, d)-pure, then so is the third.

VectorBundlesAndIsocrystals:VB4/pointwise-ampleness
Declaration: PointwiseAmple
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a
vector bundle on Proj(P_R) and M the φ^a-module over ℛ̃_R corresponding to it (Theorem
6.3.12). The slope polygon of F is the function on ℳ(R) (and on Spa(R, R⁺) by
retraction) given by the fibrewise Harder–Narasimhan polygon; it agrees with the slope
polygon of M (Remark 4.2.18). F is pointwise ample at β ∈ ℳ(R) if all slopes of F at β
are positive; by Theorem 7.4.5 this is an open condition on ℳ(R). F is pointwise ample
if it is pointwise ample at every β.
API PointwiseAmple: At β the predicate that all slopes of the fibre polygon are strictly
positive.
API PointwiseAmple.isOpen: The set of β∈ℳ(R) at which F is pointwise ample is open (KL
Theorem 7.4.5), and so is its preimage in Spa(R,R⁺) under the retraction.
API PointwiseAmple.pullback: The predicate is preserved under residue-field extension
and perfectoid pullback.
API PointwiseAmple.tensor: Tensor products of positive fibres are positive, with slopes
added with their multiplicities.
API PointwiseAmple.projComparison: The predicate agrees for a Proj bundle and its full
Robba module under the companion equivalence.
Test PointwiseAmpleTest.positive (computation): O(1) is pointwise ample.
Test PointwiseAmpleTest.unit (non-example): O is not pointwise ample: its slope is zero.
Test PointwiseAmpleTest.mixed (non-example): O(2)⊕O(−1) has positive total degree but is
not pointwise ample.
Test PointwiseAmpleTest.zero (degenerate): The zero bundle satisfies the every-slope
predicate vacuously; it has no positive rank or numerical slope.

VectorBundlesAndIsocrystals:VB4/positive-tensor-domination
Declaration: PositiveTensorDomination
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), for any
pointwise ample vector bundle F on Proj(P_R) and any vector bundle G on Proj(P_R) there
exists n_0 ∈ ℤ such that F^{⊗n} ⊗ G is pointwise ample for all n ≥ n_0.

VectorBundlesAndIsocrystals:VB4/geometric-positive-generation
Declaration: GeometricPositiveGeneration
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with R = L an
analytic field, let F be an ample vector bundle on Proj(P_L). Then H^1(Proj(P_L), F) =
0. Under the same analytic-field hypothesis, F is generated by H⁰(Proj(P_L),F), Lemma
8.8.12(b).

VectorBundlesAndIsocrystals:VB4/nonnegative-extension
Declaration: NonnegativeExtension
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a
vector bundle on Proj(P_R) whose slopes at some β ∈ ℳ(R) are all nonnegative but not all
zero. Then there exists a short exact sequence 0 → O(−1) → G → F → 0 of vector bundles
on Proj(P_R) such that the slopes of G at β are also all nonnegative.

VectorBundlesAndIsocrystals:VB4/etale-at-point-resolution
Declaration: EtaleAtPointResolution
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), let F be a
vector bundle on Proj(P_R) whose slopes at some β ∈ ℳ(R) are all nonnegative. Then there
exists a short exact sequence 0 → H → G → F → 0 of vector bundles on Proj(P_R) such that
G is étale at β.

VectorBundlesAndIsocrystals:VB4/ample-iff-pointwise
Declaration: AmpleIffPointwise
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector
bundle F on Proj(P_R) is ample if and only if it is pointwise ample (all its slopes at
every β ∈ ℳ(R) are positive).

VectorBundlesAndIsocrystals:VB4/relative-ampleness
Declaration: RelativeAmple
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5), a vector
bundle F on FF_X is ample if for every choice of (A, A⁺), (R, R⁺) and every morphism f :
Spa(A, A⁺) → X, the bundle f^*F on FF_R corresponds via Theorem 8.7.7 to an ample vector
bundle on Proj(P_R). By Theorem 8.8.15 this holds if and only if the slopes of F, as
functions on X, are everywhere positive. Consequently: if X = Spa(A, A⁺), a vector
bundle on Proj(P_R) is ample if and only if the corresponding vector bundle on FF_X is
ample; if f : Y → X is a surjective morphism of perfectoid adic spaces and f^*F is ample
then F is ample, so ampleness is local on the base; and ampleness is open on the base,
even on its real quotient: if the restriction of F to FF_{H(x)} is ample for some x ∈ X,
there is a partially proper open neighbourhood U of x in X such that the restriction of
F to FF_U is ample (Theorem 7.4.5).
API RelativeAmple: A bundle on FF_X is ample if all perfectoid affinoid pullbacks are
ample in the already owned Proj sense.
API RelativeAmple.fibreCriterion: Relative ampleness is equivalent to every geometric
fibre slope being strictly positive.
API RelativeAmple.pullback: Perfectoid pullback preserves ampleness.
API RelativeAmple.surjectiveDescent: A bundle is ample iff its pullback along a
surjective perfectoid map is ample.
API RelativeAmple.openLocus: The ample locus is a partially proper open subset on a base
over an analytic field.
Test RelativeAmpleTest.affinoid (compatibility): On an affinoid perfectoid untilt,
relative ampleness agrees with the companion Proj ampleness.
Test RelativeAmpleTest.untiltLine (computation): The untilt divisor line L_X is
relatively ample; in KL normalization its slope is 1/a.
Test RelativeAmpleTest.unit (non-example): The unit bundle is not relatively ample on a
nonempty base.

VectorBundlesAndIsocrystals:VB4/untilt-positive-line
Declaration: UntiltPositiveLine
Contract: Under Hypothesis 8.7.1 (a ≥ 1 an integer, q = p^a; (A, A⁺) a perfectoid adic
Banach algebra over ℚ_p and (R, R⁺) the perfect uniform adic Banach algebra over 𝔽_p
corresponding to it by Theorem 3.6.5; X a perfectoid adic space over ℚ_p and X′ the
perfect uniform adic space over 𝔽_p corresponding to it by Theorem 8.3.5) with X =
Spa(A, A⁺), write z = [z̄] + p z_1. Let M be the φ^a-module over ℛ̃_R free on one
generator v with φ^a(v) = z_1^{−1} z v; it is globally étale. The convergent product u =
∏_{n≥0} φ^{an}(1 + p^{−1} z_1^{−1}[z̄]) ∈ ℛ̃⁺_R satisfies φ^a(u) = p z_1 z^{−1} u in
ℛ̃_R, so uv defines an inclusion ℛ̃_R → M(1) of φ^a-modules, and M(1) is the φ^a-module
corresponding to L_X. Hence the φ^a-module corresponding to L_X is globally pure of
slope 1/a, i.e. globally (1, a)-pure (printed 'slope 1'; see source issue).

VectorBundlesAndIsocrystals:VB4/twisted-local-systems
Declaration: TwistedLocalSystem
Contract: For c∈Z and d>0, a (c,d)-Q_p local system is an étale local system of finite-
dimensional Q_{p^d}-vector spaces equipped with a Frobenius-semilinear automorphism τ
such that p^c τ^d=1. Scheme-side isogeny (c,d)-Z_p local systems carry the same data on
an isogeny Z_{p^d} local system. The categories for proportional pairs (c,d) are
naturally equivalent, not literally equal.
API TwistedLocalSystem: Finite-rank Q_{p^d} étale local system with arithmetic-
Frobenius-semilinear τ and p^cτ^d=1.
API TwistedLocalSystem.frobenius: The specified semilinear automorphism τ, with its
coefficient Frobenius.
API TwistedLocalSystem.iterate: For every section v, p^c τ^d(v)=v.
API TwistedLocalSystem.pullback: Pullback transports τ and its equation; identities and
composition agree.
API TwistedLocalSystem.reindex: Pairs of positive denominator with the same c/d give
naturally equivalent categories by unramified scalar extension/descent.
Test TwistedLocalSystemTest.zeroSlope (compatibility): At (0,1), τ=1 and the object is
an ordinary Q_p local system.
Test TwistedLocalSystemTest.nonzeroTwist (non-example): For c≠0,d=1, τ=1 on a nonzero
Q_p line fails p^cτ=1.
Test TwistedLocalSystemTest.reindex (compatibility): The categories for (1,2) and (2,4)
are equivalent; the coefficient fields and underlying vector-space ranks are not
literally identical.

VectorBundlesAndIsocrystals:VB4/integral-frobenius-local-systems
Declaration: IntegralFrobeniusLocalSystems
Contract: For a perfect uniform adic Banach pair over F_{p^d}, étale Z_{p^d} local
systems on Spec(R), on its inverse-perfecting complete subring, and on the corresponding
untilt agree with φ^d-modules over W(R) and the integral relative Robba ring; the ring
functor is scalar extension. The equivalence globalizes to perfectoid X and its
tilt/inverse perfection. Over an algebraically closed complete C/Q_p, φ-modules over the
integral Robba ring and W(C♭) agree with finite free Z_p modules (SW12.3.4). Taking
isogenies yields globally pure models, not all rational étale local systems.

VectorBundlesAndIsocrystals:VB4/integral-boundary-realization
Declaration: IntegralBoundaryRealization
Contract: For S∈Perf, finite free Z_p local systems on S_proét are equivalent to
φ^{-1}-modules on Y_[0,r](S), including the characteristic-p boundary. Restriction to
Y_(0,r] realizes the rationalized local system L[1/p], which has all Newton slopes zero.
This distinguishes integral lattices at the boundary from a slope-zero bundle on the
open curve.

VectorBundlesAndIsocrystals:VB4/integral-group-torsors
Declaration: IntegralGroupTorsors
Contract: For a smooth affine group scheme G/Z_p with connected fibres, pro-étale
G(Z_p)-torsors on S are equivalent to φ^{-1}-G-torsors on Y_[0,r](S). For G=GL_n this is
the integral local-system equivalence. Connectedness of fibres and the integral boundary
are retained; extensions requiring a parahoric model are not inferred from this theorem.

VectorBundlesAndIsocrystals:VB3:general-BC/sympathetic-vector-spaces
Declaration: SympatheticVS
Contract: A Vector Space (VS) W is a functor Λ ↦ W(Λ) from sympathetic algebras to Q_p-
vector spaces, and a sequence 0 → W_1 → W → W_2 → 0 is exact precisely when it is exact
on W(Λ) for every Λ. Sympathetic algebras are, following Colmez, the spectral connected
C-Banach algebras Λ on which x ↦ x^p is surjective on {x : ‖x−1‖_Λ < 1}, with O_Λ the
unit ball; this paper imposes two further conditions, that Λ → C(Spm(Λ) → C) be
injective — a property taken for granted in the earlier arguments but failing for
instance for Λ = O_{C′} with C′ the spherical closure of C — and that Λ be separable,
i.e. have a dense C-subspace of countable dimension, so that Hahn–Banach is available
without assuming C spherically complete. Since O_C/p is countable, the sympathetic
closure of a separable such algebra is again separable.
API SympatheticVS: A covariant functor from the stated sympathetic C-Banach algebras to
ModuleCat Q_p.
API SympatheticVS.constant: The constant functor of a finite-dimensional Q_p vector
space.
API SympatheticVS.additive: V_d evaluates to Λ^d and maps by the C-algebra homomorphism
in every coordinate.
API SympatheticVS.exact: A short complex is short exact iff its evaluated ModuleCat
complex is short exact at every Λ.
API SympatheticVS.periodTargets: The source period Rings BdR⁺ and BdR and the quotients
B_m are VS targets via the R06.1 period-functor construction.
Test SympatheticVSTest.constants (computation): The constant Q_p functor evaluates to
Q_p at C, whereas V₁ evaluates to C.
Test SympatheticVSTest.zero (degenerate): V₀ is the zero functor.
Test SympatheticVSTest.finiteSum (compatibility): V_{d+e}≅V_d⊕V_e coordinatewise.
Test SympatheticVSTest.evaluation (non-example): The C-valued spectrum-injectivity
condition excludes the spherical-closure example singled out by footnote 6; p-root
surjectivity alone is insufficient.

VectorBundlesAndIsocrystals:VB3:general-BC/banach-colmez-presentations
Declaration: BCPresentation
Contract: Morally a BC is a finite dimensional C-vector space up to a finite dimensional
Q_p-vector space, with Dimension Dim W = (a,b) where a = dim W is the C-dimension and b
= ht W ∈ Z the Q_p-dimension. Precisely, a VS W is finite Dimensional — a BC — if it
equals V_d up to finite dimensional Q_p-vector spaces: there are finite dimensional Q_p-
vector spaces V_1, V_2 and exact sequences 0 → V_1 → Y → V_d → 0 and 0 → V_2 → Y → W →
0, so that W is obtained from V_d by adding V_1 and quotienting by V_2; then dim W = d
and ht W = dim_{Q_p}V_1 − dim_{Q_p}V_2. These are the objects often called Banach–Colmez
spaces.
API BCPresentation: Y and exact 0→V₁→Y→V_d→0, 0→V₂→Y→W→0 with finite Q_p spaces V₁,V₂.
API BCPresentation.dim: The natural number d.
API BCPresentation.height: The integer finrank_Qp(V₁)−finrank_Qp(V₂).
API BCPresentation.dimension: The pair (d,height) is independent of the presentation by
DimensionAbelian.
API BCPresentation.stabilize: Adding the same finite Q_p vector space to Y,V₁,V₂ gives
another presentation of W and the same Dimension.
Test BCPresentationTest.additive (computation): The tautological presentation of V_d has
Dimension (d,0).
Test BCPresentationTest.constant (computation): A finite Q_p vector space of dimension h
has Dimension (0,h).
Test BCPresentationTest.quotient (computation): The cokernel V₁/Q_p of a nonzero Q_p→V₁
map has Dimension (1,−1).
Test BCPresentationTest.stabilize (compatibility): Increasing both finite Q_p dimensions
by one leaves height unchanged.

VectorBundlesAndIsocrystals:VB3:general-BC/exact-banach-points
Declaration: ExactBanachPoints
Contract: (i) One is in general only interested in W = W(C), but without the extra
structure its Dimension could not be spoken of — for example C and C ⊕ Q_p are
isomorphic as topological Q_p-vector spaces. (ii) The functor W ↦ W(C) is faithful on
BC's; moreover W(Λ) is a Q_p-banach for every Λ, a morphism of BC's induces continuous
strict maps W_1(Λ) → W_2(Λ), and an exact sequence of BC's induces a strictly exact
sequence for every sympathetic Λ.

VectorBundlesAndIsocrystals:VB3:general-BC/dimension-abelian
Declaration: DimensionAbelian
Contract: (i) The Dimension of a BC is independent of the choices in its definition.
(ii) For f : W_1 → W_2 a morphism of BC's, ker f, coker f and im f are BC's, with Dim
W_1 = Dim ker f + Dim im f and Dim W_2 = Dim coker f + Dim im f. (iii) If dim W = 0 then
ht W ≥ 0. (iv) If W has an increasing filtration with successive quotients V_1, then
every sub-BC W′ has ht W′ ≥ 0. The category BC of BC's is abelian.

VectorBundlesAndIsocrystals:VB3:general-BC/standard-dimension-examples
Declaration: StandardDimensionExamples
Contract: The Spaces B_m and U_{h,d} are BC's, with Dim B_m = (m,0) and Dim U_{h,d} =
(d,h) if d ≥ 0, (−d,−h) if d < 0.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature
Declaration: BCCurvature.positive
Contract: For W ∈ BC one says W has curvature > 0 if Hom(W,V_1) = 0; curvature ≥ 0 if
Hom(W,B^+_dR) = 0; curvature = 0, or affine, if it is a successive extension of V_1's;
curvature < 0 if it injects into B_dR^d, equivalently into (B^+_dR)^d; curvature ≤ 0 if
it injects into a B^+_dR-Module, i.e. a VS with an action of B^+_dR.
API BCCurvature.positive: Hom_VS(W,V₁)=0.
API BCCurvature.nonnegative: Hom_VS(W,BdR⁺)=0.
API BCCurvature.affine: A finite filtration with V₁ quotients.
API BCCurvature.negative: An injection into (BdR⁺)^d for some finite d, equivalently
BdR^d.
API BCCurvature.nonpositive: An injection into a VS carrying a BdR⁺-Module structure.
API BCCurvature.iso: Every curvature predicate is invariant under BC isomorphism.
Test BCCurvatureTest.rational (computation): Q_p has strict negative curvature and
height one.
Test BCCurvatureTest.affine (computation): V₁ has curvature zero and height zero.
Test BCCurvatureTest.shifted (computation): H¹(O(−1)) has positive curvature and height
−1.
Test BCCurvatureTest.otherPoint (non-example): At x≠∞, U₁/Q_p t_x has height zero and
positive curvature but not curvature zero.
Test BCCurvatureTest.zero (degenerate): The zero object satisfies all five predicates;
strict height inequalities require nonzero objects.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hom-orthogonality
Declaration: CurvatureHomOrthogonality
Contract: (i) If W has curvature > 0 (resp. ≥ 0) and W′ has curvature ≤ 0 (resp. < 0),
then Hom_BC(W,W′) = 0. (ii) A sub-VS of one of curvature ≤ 0 (resp. < 0) has curvature ≤
0 (resp. < 0). (iii) A quotient of one of curvature ≥ 0 (resp. > 0) has curvature ≥ 0
(resp. > 0).

VectorBundlesAndIsocrystals:VB3:general-BC/canonical-curvature-filtration
Declaration: BCCanonicalFiltration
Contract: Every W ∈ BC has a unique filtration W_{>0} ⊂ W_{≥0} ⊂ W, the canonical
filtration, with W_{>0} of curvature > 0, W_{≥0}/W_{>0} of curvature 0 and W/W_{≥0} of
curvature < 0. One defines W_{>0} as the intersection of the kernels of all morphisms W
→ B_m, m ≥ 1, and W_{≥0} as the intersection of the kernels of all morphisms W → B_dR;
the outer two properties are then clear, while the curvature-0 property of the middle
piece comes from the description of the canonical filtration in terms of the
Harder–Narasimhan filtration in §3.2.8. One writes W_{≤0} := W/W_{>0}, the largest
quotient of curvature ≤ 0, and W_{=0} := W_{≥0}/W_{>0}, the largest affine sub-VS of
W_{≤0}. The filtration and a number of results about it are due to Plût; most of them
can be recovered from the relation of BC to vector bundles on the Fargues–Fontaine curve
and Le Bras's Harder–Narasimhan theory. For W a BC the relation between (3.14) and the
filtration of Proposition 3.7 is: W_{>0} ≅ (⊕_{λ_i>0}U_{−1/λ_i}) ⊕ (⊕_{x≠∞}H^0(X,F_x));
W_{≤0} ≅ (⊕_{λ_i<0}U_{−1/λ_i}) ⊕ H^0(X,F_∞) = H^0(X, F_∞ ⊕ (⊕_{λ_i<0}O(−1/λ_i))); W_{<0}
≅ ⊕_{λ_i<0}U_{−1/λ_i}; W_{=0} ≅ H^0(X,F_∞). In particular W is of curvature < 0 if and
only if its Harder–Narasimhan slopes are < 0, and if its slopes are > 0 then it is of
curvature > 0.
API BCCanonicalFiltration: Subobjects W_{>0}≤W_{≥0}≤W with positive, affine and negative
graded pieces.
API BCCanonicalFiltration.positive: W_{>0} is the intersection of kernels of all W→B_m.
API BCCanonicalFiltration.nonnegative: W_{≥0} is the intersection of kernels of all
W→BdR.
API BCCanonicalFiltration.map: Every BC map preserves these subobjects.
API BCCanonicalFiltration.nonpositiveQuotient: Every map from W to a nonpositive-
curvature BC factors uniquely through W/W_{>0}.
API BCCanonicalFiltration.affinePart: W_{≥0}/W_{>0} is the maximal affine subobject of
W/W_{>0}.
Test BCCanonicalFiltrationTest.rational (computation): For Q_p, W_{>0}=W_{≥0}=0.
Test BCCanonicalFiltrationTest.affine (computation): For V₁, W_{>0}=0 and W_{≥0}=W.
Test BCCanonicalFiltrationTest.positive (computation): For H¹(O(−1)), W_{>0}=W_{≥0}=W.
Test BCCanonicalFiltrationTest.otherPoint (non-example): For torsion at x≠∞, W_{>0}=W
despite BC HN slope zero; HN cut at zero alone is insufficient.

VectorBundlesAndIsocrystals:VB3:general-BC/euler-poincare-height
Declaration: EulerPoincareHeight
Contract: From the formulas (3.10), ht(H^0(X,O(λ))) − ht(H^1(X,O(λ))) = h for every λ;
by additivity this gives ht(H^0(X,E)) − ht(H^1(X,E)) = rk E for every vector bundle E on
X, and the formula extends to coherent sheaves.

VectorBundlesAndIsocrystals:VB3:general-BC/tilted-coherent-heart
Declaration: BCTiltedHeart
Contract: Coh⁻_X is the full subcategory of Dᵇ(Coh_X) with cohomology only in degrees −1
and 0, H^{−1} of negative slopes and H⁰ of nonnegative slopes INCLUDING torsion sheaves.
It is the torsion-pair tilt heart, hence abelian. Objects split noncanonically as
H⁰⊕H^{−1}[1] because the curve has cohomological dimension one. For such a zero-
differential representative BC(F)=H⁰(X,H⁰F)⊕H¹(X,H^{−1}F), noncanonically; general
morphisms include Ext¹(H⁰F,H^{−1}G).
API BCTiltedHeart: Objects K∈Dᵇ(Coh_X) with HⁱK=0 except i=−1,0, H^{-1} negative and H⁰
nonnegative including torsion.
API BCTiltedHeart.positive: A coherent sheaf of nonnegative slopes enters in degree
zero.
API BCTiltedHeart.negative: A negative bundle enters with shift [1].
API BCTiltedHeart.split: K is isomorphic to H⁰K⊕H^{-1}K[1], noncanonically, using Ext²=0
on the curve.
API BCTiltedHeart.homMatrix: Morphisms between these decompositions have diagonal Hom
and off-diagonal Ext¹(E₀,F₋₁).
Test BCTiltedHeartTest.positive (computation): O(1) in degree zero belongs to the heart.
Test BCTiltedHeartTest.negative (computation): O(−1)[1] belongs, while O(−1) in degree
zero does not.
Test BCTiltedHeartTest.torsion (compatibility): The torsion skyscraper at any untilt
point belongs in degree zero.
Test BCTiltedHeartTest.shift (non-example): O[1] is excluded, since its H^{-1} has slope
zero rather than negative.

VectorBundlesAndIsocrystals:VB3:general-BC/le-bras-equivalence
Declaration: LeBrasEquivalence
Contract: The functor BC realises an equivalence of categories Coh^-_X ≃ BC. In its pro-
étale sheaf realization every BC object is a diamond (SW Theorem 15.2.12); no perfectoid
representability is inferred.

VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-invariants
Declaration: BCHNInvariants
Contract: One endows Coh^-_X with rk^-(E_{−1} → E_0) = deg(E_0) − deg(E_{−1}) and
deg^-(E_{−1} → E_0) = rk(E_{−1}) − rk(E_0), making it a Harder–Narasimhan category, and
transports this to BC, where rk^- = dim and deg^- = −ht; a torsion F_x gives µ^-(BC(0 →
F_x)) = 0. One writes W_{≥λ}, W_{>λ} for the Harder–Narasimhan filtration and W_{>−∞} :=
∪_λ W_{≥λ}. For λ = d/h in lowest terms, U_λ := U_{h,d}, with U_{eh,ed} = U_λ^e for e ≥
1, and U_λ = H^0(X,O(λ)) = BC(0 → O(λ)) if λ ≥ 0, U_λ = H^1(X,O(λ)) = BC(O(λ) → 0) if λ
< 0; then rk^-(U_λ) = sign(λ)d, deg^-(U_λ) = −sign(λ)h and µ^-(U_λ) = −1/λ.
API BCHNInvariants: BC rank=dim, BC degree=−ht, with the zero object assigned no slope.
API BCHNInvariants.fromHeart: For E₋₁[1]⊕E₀, rank=deg E₀−deg E₋₁ and degree=rank
E₋₁−rank E₀.
API BCHNInvariants.slope: For positive dimension use −ht/dim; a nonzero dimension-zero
object has slope −∞.
API BCHNInvariants.standard: For a nonzero standard curve slope λ, BC slope of U_λ is
−1/λ.
API BCHNInvariants.additive: Rank and degree add in a BC short exact sequence; slope
does not simply add.
Test BCHNInvariantsTest.rational (computation): Q_p has rank zero, degree −1 and slope
−∞.
Test BCHNInvariantsTest.affine (computation): V₁ has rank one, degree zero and slope
zero.
Test BCHNInvariantsTest.inversion (computation): U_{2,1} has BC rank one, degree −2 and
slope −2, while O(1/2) has curve rank two and degree one.
Test BCHNInvariantsTest.negative (computation): U_{1,−1}=H¹(O(−1)) has BC rank one,
degree one and slope one.
Test BCHNInvariantsTest.zero (degenerate): The zero object has BC rank and degree zero
and no slope; it is not assigned the slope −∞ of a nonzero finite Q_p space.

VectorBundlesAndIsocrystals:VB3:general-BC/bc-hn-decomposition
Declaration: BcHnDecomposition
Contract: (i) Since Q_p = U_0, µ^-(Q_p) = −∞. (ii) BC's are naturally diamonds — among
the first non-trivial examples — and as such have connected components: W_{>−∞} is the
connected component of 0 and the quotient W_{−∞} is the largest étale quotient, a finite
dimensional Q_p-vector space. (iii) The Harder–Narasimhan filtration splits non-
canonically and every BC decomposes as (3.14) W = U_{−1/λ_1} ⊕ ⋯ ⊕ U_{−1/λ_r} ⊕ (⊕_x
H^0(X,F_x)), with λ_i nonzero in Q ∪ {−∞}, U_{−1/λ_i} of slope λ_i, and F_x torsion
supported at x and zero for almost all x with H^0(X,F_x) of slope 0; the λ_i are the
slopes of W, to which 0 is added if some F_x is nonzero. (iv) In the sequence of §3.2.4,
H^1(X,E_{−1}) is the subspace of slopes > 0 of BC(E_{−1} → E_0).

VectorBundlesAndIsocrystals:VB3:general-BC/artinian-bc
Declaration: ArtinianBc
Contract: (i) The exact sequence 0 → W_{>−∞} → W → W_{−∞} → 0 makes it possible to show
that a decreasing sequence (W_n) of BC's is stationary: dim(W_n) is decreasing and
bounded below, hence constant for n ≥ N; then W_N/W_n has dimension 0 and is a quotient
of W_N^{−∞}, and ht(W_N/W_n) is increasing and bounded by ht(W_N^{−∞}) < ∞, so W_N/W_n
and hence W_n are eventually constant. (ii) Alternatively one uses a presentation to
reduce to W = V_d and induces on d, using that a sub-BC of V_1 is either V_1 or a finite
dimensional Q_p-vector space; this proof applies verbatim to almost C-representations.

VectorBundlesAndIsocrystals:VB3:general-BC/embedding-height-bound
Declaration: EmbeddingHeightBound
Contract: For a NONZERO sub-BC W⊂V_N which contains no subobject isomorphic to V₁,
dim(W)<ht(W); all its BC HN slopes are <−1. The zero object has no slopes but does not
satisfy the strict numerical inequality. Include finite Q_p summands (slope −∞) in the
proof.

VectorBundlesAndIsocrystals:VB3:general-BC/bc-morphism-calculus
Declaration: BcMorphismCalculus
Contract: For zero-map tilted-heart representatives E₋₁[1]⊕E₀ and F₋₁[1]⊕F₀, BC
morphisms are triangular matrices with diagonal Hom(E₋₁,F₋₁), Hom(E₀,F₀) and off-
diagonal Ext¹(E₀,F₋₁). End_BC(U_λ)=End(O(λ))=D_λ. For λ=d/h≥0 in lowest terms
Hom_BC(U_λ,V₁) has C-dimension h with basis θ∘φ^i, 0≤i<h. All tensor multiplicities and
Brauer signs are imported from the companion, not the unqualified rank-one-looking
formula in the review paper.

VectorBundlesAndIsocrystals:VB3:general-BC/torsion-point-realization
Declaration: TorsionPointRealization
Contract: For x a closed point, F ↦ H^0(X,F) is an equivalence from torsion coherent
sheaves supported at x to finite length B^+_dR(C_x)-modules; such a module is a sum of
B_m(C_x) = B^+_dR(C_x)/t_x^m, and the sequence 0 → O --t_x^m--> O(m) → i_{x,*}B_m → 0
together with H^1(X,O) = 0 gives H^0(X,i_{x,*}B_m) = U_m/Q_p t_x^m. Hence End_BC(U_m/Q_p
t_x^m) ≅ B_m(C_x), so for m = 1 the endomorphisms are C_x; and for x ≠ ∞, Hom_BC(U_1/Q_p
t_x, V_1) = 0 because the two sheaves are supported at distinct points. In the case x =
∞, crucial for the paper's results, t_x = t and U_m/Q_p t^m = B_m, and the object of BC
attached to a finite length B^+_dR-module M is simply M ⊗_{B^+_dR} B^+_dR.

VectorBundlesAndIsocrystals:VB3:general-BC/affine-finite-length-equivalence
Declaration: AffineFiniteLengthEquivalence
Contract: The functor M ↦ M ⊗_{B^+_dR} B^+_dR is an equivalence between the category of
B^+_dR-modules of finite length and the subcategory of BC of objects of curvature 0.

VectorBundlesAndIsocrystals:VB3:general-BC/torsion-vs-hom-vanishing
Declaration: TorsionVsHomVanishing
Contract: (i) The kernel and cokernel of a morphism of objects of curvature 0 are of
curvature 0. (ii) If W is a torsion B^+_dR-Module, i.e. annihilated by t^r for some r ≥
1, then Hom_VS(W,B^+_dR) = 0 and Hom_VS(W,B_dR) = 0. For (ii) one writes W = W
⊗_{B^+_dR} B^+_dR by Proposition 3.17 and computes Hom_VS(W,B^+_dR) = lim_k
Hom_{B^+_dR}(W,B^+_dR/t^k) = Hom_{B^+_dR}(W,B^+_dR) = 0; for B_dR one uses that a BC of
dimension 1 is a quotient of Q_p^r ⊕ L_ℓ for L_ℓ the Graph of an additive element, hence
one of dimension d a quotient of Q_p^r ⊕ L_{ℓ_1} ⊕ ⋯ ⊕ L_{ℓ_d}, so that the image of any
α : W → B_dR factors through t^{−N}B^+_dR for some N.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-hn-characterisation
Declaration: CurvatureHnCharacterisation
Contract: (i) W is of curvature < 0 (resp. ≤ 0) if and only if W ≅ H^0(X,E) with E a
vector bundle of slopes ≥ 0 (resp. the sum of such a bundle and a torsion sheaf
supported at ∞). (ii) An extension of two BC's of curvature < 0 (resp. ≤ 0) is again of
curvature < 0 (resp. ≤ 0).

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-height-signs
Declaration: CurvatureHeightSigns
Contract: Curvature zero implies height zero; NONZERO strictly negative-curvature BC
objects have strictly positive height; positive-curvature objects have height ≤0. A
nonzero torsion object at x≠∞ has height zero and strictly positive curvature, so ≤
cannot be strengthened to <.

VectorBundlesAndIsocrystals:VB3:general-BC/curvature-subquotients
Declaration: CurvatureSubquotients
Contract: Negative/nonpositive curvature is preserved by sub-BCs; positive/nonnegative
curvature is preserved by quotients. A height-zero subobject of a nonpositive-curvature
object has curvature zero. The printed dual quotient assertion is false: a height-zero
quotient of a nonnegative-curvature BC has HN slope zero (torsion support), and has
curvature zero if and only if its support is at ∞.

VectorBundlesAndIsocrystals:VB3:general-BC/torsion-subobjects-height
Declaration: TorsionSubobjectsHeight
Contract: A sub-BC U of a torsion B^+_dR-Module W satisfies ht(U) ≥ 0, and is itself a
torsion B^+_dR-Module if and only if ht(U) = 0. This can also be proved without the
Harder–Narasimhan decomposition, by induction on the length of W, using that a sub-BC of
V_1 is either V_1 or a finite dimensional Q_p-vector space and that an extension of
B^+_dR-Modules is one; that proof extends verbatim to almost C-representations, thanks
to Proposition 2.5.

VectorBundlesAndIsocrystals:VB3:general-BC/generating-image-cokernel
Declaration: GeneratingImageCokernel
Contract: Let f : W_1 → W_2 be a morphism of BC's with W_2 a B^+_dR-Module whose image
generates it as a B^+_dR-Module. Then coker(f), if nonzero, is of curvature > 0 and
height < 0. One may assume f injective and not surjective; then W_1 = H^0(X,F_1), W_2 =
H^0(X,F_2) with F_1, F_2 of vanishing H^1 and F_2 supported at ∞, and f induced by f_X :
F_1 → F_2, which the generation hypothesis makes surjective and the injectivity makes
H^0(X,ker f_X) = 0; vanishing of H^1(X,F_1) gives coker(f) ≅ H^1(X,ker f_X). Since F_1
is not torsion — else it would be supported at ∞, making W_1 a B^+_dR-module and f
surjective — neither is ker f_X, and its H^0 being zero its slopes are < 0, whence the
conclusion.

VectorBundlesAndIsocrystals:VB3:general-BC/nonpositive-curvature-extensions
Declaration: NonpositiveCurvatureExtensions
Contract: For W ∈ BC the following are equivalent: (i) W is of curvature ≤ 0; (ii) there
is an exact sequence (3.25) 0 → V → W → M → 0 with M of curvature 0 and V finite
dimensional over Q_p. For (i)⇒(ii) one writes W = H^0(X,F_∞) ⊕
(⊕_{d_i/h_i≥0}U_{d_i/h_i}) and uses the sequences 0 → Q_p^{h_i} → U_{d_i/h_i} → B_{d_i}
→ 0, taking V = ⊕ Q_p^{h_i}; the converse is Corollary 3.19(ii).

VectorBundlesAndIsocrystals:VB3:general-BC/abstract-banach-colmez-category
Declaration: AbstractBC
Contract: For fixed C/Q_p algebraically closed and complete, BC is the smallest strictly
full abelian subcategory of sheaves of Q_p-modules on Perf_C,proét, stable under
extensions and containing underline Q_p and the additive untilt sheaf G_a. Equivalently
close these generators under finite biproducts, kernels and cokernels of morphisms
BETWEEN BC objects, extensions and isomorphisms. Do not require closure under every
ambient subobject.
API AbstractBC: The generated abelian extension-closed strictly full subcategory of Q_p-
module sheaves containing Q_p and G_a.
API AbstractBC.rational: The constant sheaf Q_p is a member.
API AbstractBC.additive: The untilt additive sheaf G_a is a member.
API AbstractBC.kernelCokernel: Kernels and cokernels of maps between member objects
remain members, computed in the ambient abelian sheaf category.
API AbstractBC.extension: A short exact extension of two members is a member.
API AbstractBC.leBras: Degree-zero hypercohomology induces the exact equivalence with
BCTiltedHeart; sympathetic values agree with the presentation realization.
Test AbstractBCTest.generators (computation): The two generators are Q_p and G_a, with
Dimensions (0,1) and (1,0).
Test AbstractBCTest.zero (degenerate): The zero sheaf is in AbstractBC.
Test AbstractBCTest.quotient (compatibility): The cokernel G_a/Q_p belongs and is
BC(O(−1)[1]) after choosing ∞.
Test AbstractBCTest.points (non-example): C and C⊕Q_p are isomorphic as topological Q_p-
vector spaces but their BC Dimensions (1,0) and (1,1) differ.

VectorBundlesAndIsocrystals:VB3:general-BC/semistable-period-example
Declaration: SemistablePeriodExample
Contract: For the supercuspidal rank-two slope-1/2 L-(φ,N,G_F)-module M of CDN §2.1.2,
X_st⁺(M)=(B_cris⁺⊗M)^{φ=p} is a positive Banach–Colmez space of L-Dimension ([L:Q_p],2).
The one-dimensional multiplicity conclusion of Lemma 2.7 also uses the
admissibility/p-adic Hodge representation input; it is not deduced from Dimension for an
arbitrary rank-two module.

VectorBundlesAndIsocrystals:VB3:projectivized-properness/scalar-projectivization
Declaration: BCProjectivization
Contract: For an E-module BC v-sheaf W over S, define W× as the complement of its zero
section and PBC(W)=W×/underline E×, the v-sheaf quotient of the scalar action. The
quotient map is an E×-torsor on this punctured locus. Representability and properness
are separate theorems. Apply to both section and two-term hypercohomology objects.
API BCProjectivization: The v-sheaf quotient of punctured W by scalar E×.
API BCProjectivization.torsor: W×→PBC(W) is an underline E× torsor.
API BCProjectivization.lift: An E×-invariant map W×→Z descends uniquely to PBC(W).
API BCProjectivization.baseChange: Perfectoid base change commutes with scalar
projectivization.
Test BCProjectivizationTest.zero (degenerate): PBC(0) is empty.
Test BCProjectivizationTest.line (computation): PBC(underline E)=S.
Test BCProjectivizationTest.unitTwist (compatibility): PBC(BC(O(1)))≅Div¹, with the
fundamental scalar torsor.
Test BCProjectivizationTest.absolute (non-example): Punctured BC(O(d)) is spatial while
its π^Z-quotient is not quasiseparated; ordinary properness does not imply total
absolute spatiality.

VectorBundlesAndIsocrystals:VB3:general-BC/positive-range-dimension
Declaration: PositiveRangeDimension
Contract: For bundles E₀,E₁ with E₀ everywhere positive and E₁ everywhere negative, the
cohomologically smooth relative BCcomplex([E₁→E₀]) has locally constant dimension
deg(E₀)−deg(E₁), componentwise. In particular a positive bundle E has BC dimension
deg(E); a negative bundle has shifted BC dimension −deg(E). Geometrically these are the
first entries of the BC Dimension; height is rank(E₀)−rank(E₁). Slope-zero section
sheaves are locally profinite of dimension zero via the E-local-system equivalence.

-/
