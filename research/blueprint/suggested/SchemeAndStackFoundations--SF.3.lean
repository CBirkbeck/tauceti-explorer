import Mathlib.AlgebraicGeometry.Sites.ElladicCohomology
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.FlatRank
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.FunctionField
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Norm.Defs
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.Algebra.BrauerGroup.Defs
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Hilbert90
import Mathlib.Topology.KrullDimension
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.TensorProduct
import TauCeti.AlgebraicGeometry.WeilDivisor.Principal.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.Algebra.BrauerGroup.BaseChange
import TauCeti.FieldTheory.FunctionField.Divisor.ProductFormula
import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus

/-!
# Scheme and stack foundations, layer SF.3: curves, divisors and Picard objects

This file is not the roadmap and is not exhaustive. The reviewed packet and review report record corrections that still need propagation to
`research/blueprint/readmes/SchemeAndStackFoundations--SF.3.md`. The statements
below suggest Lean forms so that contributors and reviewers converge on names and signatures.
Every proof is `sorry`, and no implementation is claimed.

Prototyping boundary. Normality of a curve is written as integrally closed stalks. The file imports only modules compiled in the atlas build at Tau Ceti
`f790474` and Mathlib `082e2d3`. Tau Ceti's coherent cohomology of sheaves of modules
(`AlgebraicGeometry.Scheme.Modules.Cohomology`, its base-field module structure and
`Scheme.Modules.eulerCharBelow`) supplies the cohomology and Euler-characteristic carriers below.
The fppf Picard sheaf, Picard schemes and Picard stacks of
JacobianChallenge Layer D are absent from both libraries; the objects this layer adds on top of
them are admitted data with their interface lemmas. Interfaces whose carriers cannot be expressed
(determinants and duals of sheaves of modules, torsion and Tate modules of abelian varieties,
`μ_n`-coefficients on the étale site) are recorded as comments naming their API items and tests.
These comments do not satisfy PROTOCOL section 13. The independent review records the missing
signatures and examples as a revision requirement; this file is an incomplete prototype.

Current-upstream boundary (independent review, 2026-10-11). The library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already contains `FiniteLocallyFreeSheaf`,
its `FixedRank` and rigid dual, `LineBundleClass` as a commutative group,
`InvertibleSheaf.eulerDegree`, `Scheme.genus`, relative Kähler differentials, and
line-bundle Serre duality with an explicit repartition/Weil-differential pairing.
The definitions and admitted instances below adapt the older compilation pin;
packaging must import those current carriers and AlgebraicVectorBundles L0A–L0C
instead. General determinants remain at L0C. The Abel–Jacobi gap is the comparison
of the existing pairing with Kähler residues and the first-order Abel derivative.
-/

noncomputable section

open _root_.CategoryTheory _root_.CategoryTheory.Limits _root_.AlgebraicGeometry
open scoped _root_.CategoryTheory.MonoidalCategory

universe u

namespace TauCeti.AlgebraicGeometry.Curve

variable (k : Type u) [Field k]

/-- Dimension of the pinned coherent-cohomology carrier. Geometric applications must establish
finite-dimensionality; `finrank` alone does not express it. -/
abbrev cohomologyDim (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) (i : ℕ) : ℕ :=
  Module.finrank k (Scheme.Modules.Cohomology M i)

/-- The structure sheaf as a sheaf of modules over itself. -/
abbrev structureModule (X : Scheme.{u}) : X.Modules := _root_.SheafOfModules.unit X.ringCatSheaf

/-- The Euler characteristic `χ(X, M) = dim H⁰ − dim H¹` used on schemes of dimension at most one. -/
abbrev eulerChar (X : Scheme.{u}) [X.Over (Spec (.of k))] (M : X.Modules) : ℤ :=
  _root_.AlgebraicGeometry.Scheme.Modules.eulerCharBelow k X M 2

/-- The genus `dim_k H¹(X, O_X)` of JacobianChallenge Layer B, as used by this layer. -/
def genus (X : Scheme.{u}) [X.Over (Spec (.of k))] : ℕ := cohomologyDim k X (structureModule X) 1

/-! ## SF.3/nonsingular-projective-model -/

section NonsingularModel

-- node: SchemeAndStackFoundations:SF.3/nonsingular-projective-model
/-- The regular projective model `X̄ = X_{k(X)}` of a normal curve (AlgebraicCurves Layer 12B). -/
def nonsingularModel (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X]
    [IsSeparated (X ↘ Spec (.of k))] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    [QuasiCompact (X ↘ Spec (.of k))]
    [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)] (hdim : topologicalKrullDim X = 1) :
    Scheme.{u} :=
  sorry

variable (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X] [IsSeparated (X ↘ Spec (.of k))]
  [LocallyOfFiniteType (X ↘ Spec (.of k))] [QuasiCompact (X ↘ Spec (.of k))]
  [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)]
  (hdim : topologicalKrullDim X = 1)

instance : (nonsingularModel k X hdim).Over (Spec (.of k)) := sorry

instance nonsingularModel_isProper : IsProper (nonsingularModel k X hdim ↘ Spec (.of k)) := sorry

/-- The open immersion `j_X : X → X̄` over `k` inducing the identity of `k(X)`. -/
def nonsingularModel.openImmersion : X ⟶ nonsingularModel k X hdim := sorry

lemma nonsingularModel.openImmersion_isOpenImmersion :
    IsOpenImmersion (nonsingularModel.openImmersion k X hdim) := by sorry

lemma nonsingularModel.openImmersion_isOver :
    nonsingularModel.openImmersion k X hdim ≫ nonsingularModel k X hdim ↘ Spec (.of k) =
      X ↘ Spec (.of k) := by sorry

/-- The boundary `∂X = X̄ ∖ j_X(X)`, a finite set of closed points. -/
def boundary : Set (nonsingularModel k X hdim) :=
  (Set.range (nonsingularModel.openImmersion k X hdim).base)ᶜ

lemma boundary_finite : (boundary k X hdim).Finite := by sorry

lemma boundary_eq_empty_iff : boundary k X hdim = ∅ ↔ IsProper (X ↘ Spec (.of k)) := by sorry

lemma nonsingularModel_smooth [PerfectField k] [Smooth (X ↘ Spec (.of k))] :
    Smooth (nonsingularModel k X hdim ↘ Spec (.of k)) := by sorry

lemma nonsingularModel.extend {Y : Scheme.{u}} [Y.Over (Spec (.of k))]
    [IsProper (Y ↘ Spec (.of k))] (f : X ⟶ Y) (hf : f ≫ Y ↘ Spec (.of k) = X ↘ Spec (.of k)) :
    ∃! g : nonsingularModel k X hdim ⟶ Y, nonsingularModel.openImmersion k X hdim ≫ g = f := by sorry

/- Remaining API of this node, stated in the roadmap document:
`nonsingularModel.functionField_iso` (identification of function fields with AlgebraicCurves'),
`nonsingularModel.unique` (uniqueness among open immersions into regular proper curves),
`nonsingularModel.map` (functoriality for dominant morphisms).
Tests: `nonsingularModel_affineLine` (model of A¹ is P¹ with one boundary point),
`nonsingularModel_gm` (two boundary points), `nonsingularModel_not_smooth` (y² = x^p − t over
F_p(t)); they need P¹ and explicit plane curves as schemes over k, which the pinned libraries do
not provide as named objects. -/

end NonsingularModel

-- test: TauCeti.AlgebraicGeometry.Curve.nonsingularModel_proper
example (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X] [IsProper (X ↘ Spec (.of k))]
    [∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)] (hdim : topologicalKrullDim X = 1) :
    boundary k X hdim = ∅ := by sorry

/-! ## SF.3/curve-affine-or-projective -/

-- node: SchemeAndStackFoundations:SF.3/curve-affine-or-projective
theorem isAffine_or_isProper (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsIntegral X]
    [IsSeparated (X ↘ Spec (.of k))] [LocallyOfFiniteType (X ↘ Spec (.of k))]
    [QuasiCompact (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) :
    (IsAffine X ∧ ¬ IsProper (X ↘ Spec (.of k))) ∨
      (¬ IsAffine X ∧ IsProper (X ↘ Spec (.of k))) := by sorry

/-! ## SF.3/genus-base-change -/

-- node: SchemeAndStackFoundations:SF.3/genus-base-change
/-- Base change of a `k`-scheme along `k → K`. -/
abbrev baseChange (X : Scheme.{u}) [X.Over (Spec (.of k))] (K : Type u) [Field K] [Algebra k K] :
    Scheme.{u} :=
  pullback (X ↘ Spec (.of k)) (Spec.map (CommRingCat.ofHom (algebraMap k K)))

instance (X : Scheme.{u}) [X.Over (Spec (.of k))] (K : Type u) [Field K] [Algebra k K] :
    (baseChange k X K).Over (Spec (.of K)) := ⟨pullback.snd _ _⟩

theorem genus_baseChange (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1)
    (K : Type u) [Field K] [Algebra k K] :
    cohomologyDim K (baseChange k X K) (structureModule _) 0 = 1 ∧
      genus K (baseChange k X K) = genus k X := by sorry

/-! ## SF.3/vector-bundle-degree -/

/-- Pin adapter for finite locally free constant rank: finite presentation and local bases
of cardinality `r`. Current upstream uses `FiniteLocallyFreeSheaf.FixedRank X r`. -/
def IsLocallyFreeOfRank {X : Scheme.{u}} (E : X.Modules) (r : ℕ) : Prop :=
  E.IsFinitePresentation ∧ ∃ q : _root_.SheafOfModules.LocalGeneratorsData.{u} E,
    q.IsLocallyFreeData ∧ ∀ i, Finite (q.generators i).I ∧ Nat.card (q.generators i).I = r

section Degree

variable (X : Scheme.{u}) [X.Over (Spec (.of k))]

-- node: SchemeAndStackFoundations:SF.3/vector-bundle-degree
/-- `deg E = χ(E) − r·χ(O_X)` for a locally free sheaf `E` of constant rank `r` on a proper
`k`-scheme of dimension at most one; the rank is the explicit argument `r`, and every lemma
assumes `IsLocallyFreeOfRank E r`. -/
def vectorBundleDegree (E : X.Modules) (r : ℕ) : ℤ :=
  eulerChar k X E - r * eulerChar k X (structureModule X)

lemma vectorBundleDegree_rankOne (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) :
    vectorBundleDegree k X L.obj 1 = eulerChar k X L.obj - eulerChar k X (structureModule X) := by
  sorry

lemma vectorBundleDegree_of_iso {E F : X.Modules} (e : E ≅ F) (r : ℕ) :
    vectorBundleDegree k X E r = vectorBundleDegree k X F r := by sorry

lemma vectorBundleDegree_add_of_shortExact [IsProper (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X ≤ 1) (S : ShortComplex X.Modules) (hS : S.ShortExact)
    (r₁ r₃ : ℕ) (h₁ : IsLocallyFreeOfRank S.X₁ r₁) (h₃ : IsLocallyFreeOfRank S.X₃ r₃) :
    vectorBundleDegree k X S.X₂ (r₁ + r₃) =
      vectorBundleDegree k X S.X₁ r₁ + vectorBundleDegree k X S.X₃ r₃ := by sorry

lemma vectorBundleDegree_tensor [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1)
    (E V : X.Modules) (r s : ℕ) (hE : IsLocallyFreeOfRank E r) (hV : IsLocallyFreeOfRank V s) :
    vectorBundleDegree k X (Scheme.Modules.tensorProduct X E V) (r * s) =
      r * vectorBundleDegree k X V s + s * vectorBundleDegree k X E r := by sorry

/- Remaining API of this node, stated in the roadmap document: `vectorBundleDegree_det`
(deg E = deg det E), `vectorBundleDegree_dual`, `vectorBundleDegree_twist` (twist by an effective
Cartier divisor), `vectorBundleDegree_elementaryModification`, `vectorBundleDegree_baseChange` and
`vectorBundleDegree_pullback`. Their carriers (exterior powers and duals of sheaves of modules,
lengths, base change of modules along field extensions) are not in the pinned libraries. -/

-- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_trivial
example [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X ≤ 1) :
    vectorBundleDegree k X (structureModule X) 1 = 0 := by sorry

/- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_projectiveLine — on P¹_k,
deg(O(a) ⊕ O(b)) = a + b (P¹ and its twisting sheaves are not named objects at the pin).
test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_filtration — degrees add along a
filtration with invertible quotients; O(1) ⊕ O(−1) on P¹ has degree 0 without being trivial. -/

-- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_divisor
example [IsIntegral X] [IsNoetherian X]
    [∀ y : TauCeti.AlgebraicGeometry.CodimensionOnePoint X,
      IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, Order.coheight y ≤ 1) [IsProper (X ↘ Spec (.of k))]
    (D : TauCeti.AlgebraicGeometry.SchemeWeilDivisor X) :
    vectorBundleDegree k X (TauCeti.AlgebraicGeometry.SchemeWeilDivisor.toInvertibleSheaf hX D).obj 1 =
      D.sum fun x n ↦ n * ((X ↘ Spec (.of k)).residueDegree (x : X) : ℤ) := by sorry

-- test: TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_ne_eulerChar
example [IsProper (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : genus k X = 2) :
    vectorBundleDegree k X (structureModule X) 1 ≠ eulerChar k X (structureModule X) := by sorry

end Degree

/-! ## SF.3/vector-bundle-riemann-roch -/

-- node: SchemeAndStackFoundations:SF.3/vector-bundle-riemann-roch
theorem eulerChar_eq_degree_add_rank_mul (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (E : X.Modules) (r : ℕ) (hE : IsLocallyFreeOfRank E r) :
    eulerChar k X E = vectorBundleDegree k X E r + r * (1 - (genus k X : ℤ)) := by sorry

/-! ## SF.3/curve-serre-duality

-- node: SchemeAndStackFoundations:SF.3/curve-serre-duality
The theorem (`Ext^{1+i}(F, ω_X) ≅ H^{−i}(X, F)^∨` for quasi-coherent `F` on a proper Cohen–Macaulay
curve, `Hⁱ(E^∨ ⊗ ω) ≅ H^{1−i}(E)^∨`, `Ext¹(U, V) ≅ Hom(V, U ⊗ ω)^∨`, and `ω ≅ Ω¹` in the smooth
case) needs Ext groups and duals of sheaves of modules, the dualizing module `H^{−1}(f^! k)` of
SF.2 and the sheaf of differentials; none is a carrier of the pinned libraries, so it is stated in
the roadmap document only. A dimension-only Lean form would be false without those carriers. -/

/-! ## SF.3/scheme-riemann-hurwitz -/

-- node: SchemeAndStackFoundations:SF.3/scheme-riemann-hurwitz
theorem genus_of_finite_etale {X Y : Scheme.{u}} [X.Over (Spec (.of k))] [Y.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [IsProper (Y ↘ Spec (.of k))] [Smooth (Y ↘ Spec (.of k))]
    (hXd : topologicalKrullDim X = 1) (hYd : topologicalKrullDim Y = 1)
    (hX : cohomologyDim k X (structureModule X) 0 = 1)
    (hY : cohomologyDim k Y (structureModule Y) 0 = 1) (f : X ⟶ Y) [IsFinite f] [Etale f] (hf : f ≫ Y ↘ Spec (.of k) = X ↘ Spec (.of k))
    (n : ℕ) (hn : ∀ y : Y, f.finrank y = n) :
    (genus k X : ℤ) - 1 = n * ((genus k Y : ℤ) - 1) := by sorry

/-! ## SF.3/projective-line-characterization, SF.3/genus-one-curves,
SF.3/line-bundle-degree-bounds -/

-- node: SchemeAndStackFoundations:SF.3/projective-line-characterization
theorem isTrivial_of_genus_zero_of_degree_zero (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [IsIntegral X] (hdim : topologicalKrullDim X = 1)
    (hH0 : cohomologyDim k X (structureModule X) 0 = 1) (hg : genus k X = 0)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X) (hL : vectorBundleDegree k X L.obj 1 = 0) :
    TauCeti.AlgebraicGeometry.LineBundleClass.mk L = 1 := by sorry

-- node: SchemeAndStackFoundations:SF.3/genus-one-curves
theorem exists_rationalPoint_of_degree_one (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (hg : genus k X = 1) (N : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hN : vectorBundleDegree k X N.obj 1 = 1) :
    ∃ x : Spec (.of k) ⟶ X, x ≫ X ↘ Spec (.of k) = 𝟙 _ := by sorry

-- node: SchemeAndStackFoundations:SF.3/line-bundle-degree-bounds
theorem cohomologyDim_one_eq_zero_of_degree_gt (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hL : 2 * (genus k X : ℤ) - 2 < vectorBundleDegree k X L.obj 1) :
    cohomologyDim k X L.obj 1 = 0 ∧
      (cohomologyDim k X L.obj 0 : ℤ) = vectorBundleDegree k X L.obj 1 + 1 - genus k X := by sorry

theorem cohomologyDim_zero_pos_of_genus_le_degree (X : Scheme.{u}) [X.Over (Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] [Smooth (X ↘ Spec (.of k))]
    [GeometricallyIntegral (X ↘ Spec (.of k))] (hdim : topologicalKrullDim X = 1)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf X)
    (hL : (genus k X : ℤ) ≤ vectorBundleDegree k X L.obj 1) :
    0 < cohomologyDim k X L.obj 0 := by sorry

end TauCeti.AlgebraicGeometry.Curve

/-! ## Picard objects -/

namespace TauCeti.AlgebraicGeometry.Picard

/-! ### SF.3/picard-groupoid -/

-- node: SchemeAndStackFoundations:SF.3/picard-groupoid
/-- A Picard groupoid: a symmetric monoidal category which is a groupoid and in which every object
has a tensor inverse up to isomorphism (Bhatt–Scholze, Definition 12.14). -/
class PicardGroupoid (C : Type*) [Category C] [MonoidalCategory C] [SymmetricCategory C] :
    Prop where
  isIso : ∀ {X Y : C} (f : X ⟶ Y), IsIso f
  exists_inverse : ∀ X : C, ∃ Y : C, Nonempty (X ⊗ Y ≅ 𝟙_ C)

namespace PicardGroupoid

variable (C : Type*) [Category C] [MonoidalCategory C] [SymmetricCategory C] [PicardGroupoid C]

/-- The abelian group of isomorphism classes. -/
def pi0 : Type _ := Skeleton C

instance : CommGroup (pi0 C) := sorry

/-- The abelian group of automorphisms of the unit. -/
def pi1 : Type _ := Aut (𝟙_ C)

instance : CommGroup (pi1 C) := sorry

end PicardGroupoid

variable (X : Scheme.{u})

/-- `𝒫ic(X)`: the core of the category of invertible sheaves. -/
abbrev picardGroupoid : Type _ := Core (TauCeti.AlgebraicGeometry.InvertibleSheaf X)

instance : MonoidalCategory (picardGroupoid X) := sorry

instance : SymmetricCategory (picardGroupoid X) := sorry

instance picardGroupoid.instPicardGroupoid : PicardGroupoid (picardGroupoid X) := sorry

lemma picardGroupoid.pi0_equiv :
    Nonempty (PicardGroupoid.pi0 (picardGroupoid X) ≃* TauCeti.AlgebraicGeometry.LineBundleClass X) := by
  sorry

lemma picardGroupoid.pi1_equiv :
    Nonempty (PicardGroupoid.pi1 (picardGroupoid X) ≃* (Γ(X, ⊤))ˣ) := by sorry

/-- Pullback of invertible sheaves as a functor of Picard groupoids. -/
def picardGroupoid.pullback {Y : Scheme.{u}} (f : Y ⟶ X) : picardGroupoid X ⥤ picardGroupoid Y :=
  sorry

/- Remaining API: `picardGroupoid.isStack` (fppf descent, SF.1) and `gradedPicardGroupoid`
(pairs (L, f) with the Koszul sign rule). -/

-- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_pi0
example : Nonempty (PicardGroupoid.pi0 (picardGroupoid X) ≃* TauCeti.AlgebraicGeometry.LineBundleClass X) := by
  sorry

-- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_field
example (K : Type u) [Field K] :
    Nonempty (PicardGroupoid.pi1 (picardGroupoid (Spec (.of K))) ≃* Kˣ) := by sorry

/- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_projectiveLine — π₀ = Z, π₁ = k^× for P¹. -/

-- test: TauCeti.AlgebraicGeometry.Picard.picardGroupoid_not_discrete
example [Nontrivial (Γ(X, ⊤))ˣ] :
    Nontrivial (PicardGroupoid.pi1 (picardGroupoid X)) := by sorry

/-! ### SF.3/picard-cohomological, SF.3/class-group-picard-locally-factorial,
SF.3/picard-excision-sequence

The étale and fppf cohomology of `G_m` on schemes and the Weil divisor class group in arbitrary
dimension are not carriers of the pinned libraries; these three nodes are stated in the roadmap
document. The affine case of the first is Mathlib's `CommRing.Pic`. -/

/- node: SchemeAndStackFoundations:SF.3/class-group-picard-locally-factorial
node: SchemeAndStackFoundations:SF.3/picard-excision-sequence -/

-- node: SchemeAndStackFoundations:SF.3/picard-cohomological
theorem lineBundleClass_spec_equiv_pic (R : Type u) [CommRing R] :
    Nonempty (TauCeti.AlgebraicGeometry.LineBundleClass (Spec (.of R)) ≃* CommRing.Pic R) := by sorry

/-! ### SF.3/line-bundle-norm -/

-- node: SchemeAndStackFoundations:SF.3/line-bundle-norm
/-- `Norm_π : Pic(X) → Pic(Y)` for a finite locally free morphism of constant degree `d`. -/
def lineBundleNorm {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] [LocallyOfFinitePresentation π]
    (d : ℕ) (hd : ∀ y : Y, π.finrank y = d) :
    TauCeti.AlgebraicGeometry.LineBundleClass X → TauCeti.AlgebraicGeometry.LineBundleClass Y :=
  sorry

lemma lineBundleNorm_tensor {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] [LocallyOfFinitePresentation π]
    (d : ℕ) (hd : ∀ y : Y, π.finrank y = d)
    (a b : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    lineBundleNorm π d hd (a * b) = lineBundleNorm π d hd a * lineBundleNorm π d hd b := by sorry

lemma lineBundleNorm_one {X Y : Scheme.{u}} (π : X ⟶ Y) [IsFinite π] [Flat π] [LocallyOfFinitePresentation π]
    (d : ℕ) (hd : ∀ y : Y, π.finrank y = d) :
    lineBundleNorm π d hd 1 = 1 := by sorry

/- Remaining API: `lineBundleNorm_pullback` (Norm(π*N) = N^d), `lineBundleNorm_comp`,
`lineBundleNorm_baseChange`, `lineBundleNorm_det`, `sectionNorm`, `lineBundleNorm_divisor`;
they need pullback and determinants of invertible sheaves, not available at the pin. -/

-- test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_id
example (X : Scheme.{u}) (a : TauCeti.AlgebraicGeometry.LineBundleClass X) :
    lineBundleNorm (𝟙 X) 1
      (fun y ↦ congrFun (Scheme.Hom.finrank_eq_one_of_isIso (𝟙 X)) y) a = a := by sorry

/- test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_field — over a field the norm on units
is Mathlib's `Algebra.norm` (needs `sectionNorm`).
test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_square (z ↦ z² on P¹) and
test: TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_ne_det (hyperelliptic double cover) need P¹
and explicit double covers as named schemes. -/

/-! ### SF.3/picard-scheme-without-point and SF.3/picard-brauer-sequence -/

section Torsors

variable (k : Type u) [Field k]

-- node: SchemeAndStackFoundations:SF.3/picard-scheme-without-point
/-- The degree-`d` component `Pic^d_{X/k}` of the Picard scheme of a smooth projective
geometrically connected curve, constructed without a rational point. -/
def picardComponent (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) (d : ℤ) :
    Over (Spec (.of k)) := sorry

/-- `Pic⁰_{X/k}` as an abelian variety (the Jacobian, with or without a rational point). -/
def jacobian (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) :
    TauCeti.AlgebraicGeometry.AbelianVariety k := sorry

/-- The `k`-points of the Picard sheaf, `Pic(X_{k^s})^{G_k}`, as an abstract group. -/
def picardSheafPoints (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))] : Type u := sorry

variable (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
  [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))]

theorem picardComponent_zero (hdim : topologicalKrullDim X = 1) : (jacobian k X hdim).toOver = picardComponent k X hdim 0 := by sorry

theorem jacobian_dim (hdim : topologicalKrullDim X = 1) :
    (jacobian k X hdim).dim = ((Curve.genus k X : ℕ∞) : WithBot ℕ∞) := by sorry

theorem picardComponent_isProper (hdim : topologicalKrullDim X = 1) (d : ℤ) : IsProper (picardComponent k X hdim d).hom := by sorry

/-- `Pic^d_{X/k}` has a `k`-point exactly when it is the trivial torsor; the canonical class gives a
point in degree `2g − 2`. -/
theorem picardComponent_canonical_point (hdim : topologicalKrullDim X = 1) :
    Nonempty ((Over.mk (𝟙 (Spec (.of k)))) ⟶
      picardComponent k X hdim (2 * (Curve.genus k X : ℤ) - 2)) := by sorry

-- node: SchemeAndStackFoundations:SF.3/picard-brauer-sequence
instance : AddCommGroup (picardSheafPoints k X) := sorry

/-- The map from actual line-bundle classes. -/
def ofLineBundleClass : Additive (TauCeti.AlgebraicGeometry.LineBundleClass X) → picardSheafPoints k X :=
  sorry

theorem ofLineBundleClass_injective : Function.Injective (ofLineBundleClass k X) := by sorry

/-- The Brauer obstruction `δ`, with values in central simple algebra classes through the
comparison of SF.2 between the Galois-cohomological and Azumaya Brauer groups of a field. -/
def brauerObstruction : picardSheafPoints k X → BrauerGroup.{u, u} k := sorry

theorem exact_ofLineBundleClass_brauerObstruction (c : picardSheafPoints k X) :
    brauerObstruction k X c = 1 ↔ c ∈ Set.range (ofLineBundleClass k X) := by sorry

theorem brauerObstruction_eq_one_of_point (x : Spec (.of k) ⟶ X)
    (hx : x ≫ X ↘ Spec (.of k) = 𝟙 _) (c : picardSheafPoints k X) :
    brauerObstruction k X c = 1 := by sorry

theorem baseChange_brauerObstruction (K : Type u) [Field K] [Algebra k K]
    (hK : ∃ x : Spec (.of K) ⟶ X, x ≫ X ↘ Spec (.of k) = Spec.map (CommRingCat.ofHom (algebraMap k K)))
    (c : picardSheafPoints k X) :
    TauCeti.BrauerGroup.baseChange k K (brauerObstruction k X c) = 1 := by sorry

end Torsors

/- node: SchemeAndStackFoundations:SF.3/rational-divisor-classes
node: SchemeAndStackFoundations:SF.3/degree-zero-class-comparison -/

/-! ### SF.3/rational-divisor-classes, SF.3/degree-zero-class-comparison

Stated in the roadmap document; they compose `brauerObstruction` with the Galois-cohomological
Brauer group of SF.2/brauer-field-comparison (arbitrary fields), with finite-index
restriction/corestriction imported from ProfiniteCohomology Layer 6 and with Tau Ceti's degree-zero class groups
(`TauCeti.Divisor.degreeClass`, `WeilDivisor.OrderSystem.picZero`). -/

/- node: SchemeAndStackFoundations:SF.3/picard-stack-curve
node: SchemeAndStackFoundations:SF.3/universal-section-stack -/

/-! ### SF.3/picard-stack-curve, SF.3/universal-section-stack

The pinned libraries have no algebraic stacks over `(Sch/k)_fppf`; the constructions and their
API (`picardStack`, `picardStack.degreeComponent`, `picardStack.aut_eq_units`,
`picardStack.toPicardSheaf`, `picardStack.isGerbe`, `picardStack.split_of_point`,
`picardStack.tensor`, `picardStack.baseChange`; `sectionStack`, `sectionStack.forget`,
`sectionStack.zeroSection`, `sectionStack.eq_of_neg`, `sectionStack.symmetricPowerEquiv`,
`sectionStack.isVectorBundle`, `sectionStack.add`, `sectionStack.add_symmetricPower`) and tests
(`picardStack_projectiveLine`, `picardStack_field`, `picardStack_aut`, `picardStack_not_scheme`;
`sectionStack_negative`, `sectionStack_projectiveLine`, `sectionStack_rank`,
`sectionStack_not_bundle`) are specified in the roadmap document. The groupoid of objects over a
scheme `T` is `picardGroupoid` of `X ×_k T`. -/

/-- The groupoid of objects of the Picard stack over a `k`-scheme `T` is the Picard groupoid of
`X ×_k T`; in particular it is a groupoid. -/
example (X : Scheme.{u}) : Groupoid (picardGroupoid X) := inferInstance

/-! ### SF.3/abel-maps-high-degree, SF.3/picard-norm-sequence, SF.3/invariant-differentials,
SF.3/abel-jacobi-differentials, SF.3/tate-module-etale-h1

The Abel maps need the symmetric powers of JacobianChallenge Layer C; the norm sequence needs the
Picard stacks above; the differential statements need the sheaf of differentials of a scheme
(StableReduction Layers 0–1); the Tate-module comparison needs the torsion and Tate modules of
abelian varieties (CohomologicalPointCounting/TraceFormula Layer 8) and `μ_n`-coefficients on the
étale site. Mathlib's pro-étale `EllAdicCohomology` is present at the compilation pin. Current Tau Ceti
also supplies relative differentials and the functional principal-parts pairing listed above.
The remaining Abel–Jacobi comparison must identify that pairing with regular Kähler residues
and the all-point infinitesimal divisor deformation. -/

-- node: SchemeAndStackFoundations:SF.3/tate-module-etale-h1
/-- Acceptance instance of the Tate-module comparison in genus zero: both sides vanish. The general
statement (`T_ℓ J ≅ H¹(X_{k^s}, Z_ℓ(1))`, `H¹(X_{k^s}, Z_ℓ) ≅ Hom(T_ℓ J, Z_ℓ)`) is stated in the
roadmap document; its Tate-module carrier is TraceFormula Layer 8's. -/
theorem subsingleton_ellAdicCohomology_one_of_genus_zero (k : Type u) [Field k] [IsSepClosed k]
    (X : Scheme.{u}) [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    [Smooth (X ↘ Spec (.of k))] [GeometricallyIntegral (X ↘ Spec (.of k))]
    (hdim : topologicalKrullDim X = 1) (hg : Curve.genus k X = 0)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : k) ≠ 0) :
    Subsingleton (X.EllAdicCohomology ℓ 1) := by sorry

/- node: SchemeAndStackFoundations:SF.3/invariant-differentials — Ω¹_{G/S} ≅ f*e*Ω¹ and
Γ(A, Ω¹) ≅ T₀(A)^∨ for an abelian variety; needs the sheaf of differentials of a scheme.
node: SchemeAndStackFoundations:SF.3/abel-jacobi-differentials — ι_O^* : Γ(J, Ω¹) ≅ Γ(X, Ω¹).
node: SchemeAndStackFoundations:SF.3/abel-maps-high-degree — fibres, surjectivity and the
projective-bundle structure of X^(d) → Pic^d; needs JacobianChallenge Layer C's symmetric powers.
node: SchemeAndStackFoundations:SF.3/picard-norm-sequence — Nm on Picard stacks and the
double-cover exact sequence. -/

end TauCeti.AlgebraicGeometry.Picard
