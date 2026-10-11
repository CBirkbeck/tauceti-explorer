import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.CategoryTheory.Yoneda
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.GroupTheory.GroupAction.Quotient
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
import TauCeti.RepresentationTheory.Homological.ContCohomology.ExplicitFunctoriality
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation
import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.Colimit

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Every proposed result is an unproved prototype at the recorded baseline.

SupplierInterface repeats only the types needed from the accepted parent packet; these
are imports in the roadmap dependency graph, not newly planned declarations. The geometric
representability theorems whose filtered Hopf/period-ring inputs cannot yet be stated are
listed individually at the end. No arbitrary proposition stands in for those inputs.
-/
noncomputable section
open CategoryTheory
namespace TauCeti.NonabelianCohomology.NC3
universe u

namespace SupplierInterface
variable (G U : Type u) [Group G] [TopologicalSpace G]
  [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
abbrev Z1 := {c : G → U // Continuous c ∧ ∀ g h, c (g * h) = c g * g • c h}
instance : One (Z1 G U) := ⟨⟨fun _ => 1, continuous_const, by sorry⟩⟩
instance : MulAction U (Z1 G U) where
  smul x c := ⟨fun g => x * c.val g * (g • x)⁻¹, by sorry, by sorry⟩
  one_smul := by sorry
  mul_smul := by sorry
abbrev H1 := MulAction.orbitRel.Quotient U (Z1 G U)
def classOf (c : Z1 G U) : H1 G U := Quotient.mk'' c
instance : One (H1 G U) := ⟨classOf G U 1⟩
def map {G U V : Type u} [Group G] [TopologicalSpace G]
    [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction G U] [ContinuousSMul G U]
    [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
    [MulDistribMulAction G V] [ContinuousSMul G V]
    (f : U →ₜ* V) (hf : ∀ (g : G) x, f (g • x) = g • f x) : H1 G U → H1 G V := sorry
end SupplierInterface
open SupplierInterface

section Abelian
variable {G H M N : Type u} [Group G] [TopologicalSpace G]
  [Group H] [TopologicalSpace H]
  [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]
  [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
  [DistribMulAction H N] [ContinuousSMul H N]
-- The accepted parent supplies these type-synonym action instances and comparison.
namespace SupplierInterface
instance multiplicativeAction : MulDistribMulAction G (Multiplicative M) := sorry
instance multiplicativeContinuousAction : ContinuousSMul G (Multiplicative M) := sorry
def abelianEquiv : H1 G (Multiplicative M) ≃ TauCeti.ContCohomology.H1 G M := sorry
def pullH1 (φ : H →ₜ* G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) m, f (φ h • m) = h • f m) :
    H1 G (Multiplicative M) → H1 H (Multiplicative N) := sorry
lemma abelianEquiv_class (c : Z1 G (Multiplicative M)) :
    abelianEquiv (classOf G (Multiplicative M) c) =
      TauCeti.ContCohomology.H1pi G M
        ⟨fun g => Multiplicative.toAdd (c.val g), by sorry⟩ := by sorry
lemma pullH1_class (φ : H →ₜ* G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) m, f (φ h • m) = h • f m)
    (c : Z1 G (Multiplicative M)) :
    pullH1 φ f hf hequiv (classOf G (Multiplicative M) c) =
      classOf H (Multiplicative N)
        ⟨fun h => Multiplicative.ofAdd (f (Multiplicative.toAdd (c.val (φ h)))),
          by sorry, by sorry⟩ := by sorry
end SupplierInterface
/-- NC.3/canonical-comparison-naturality: the actual compatible-pair square. -/
theorem comparison_naturality (φ : H →ₜ* G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) m, f (φ h • m) = h • f m)
    (x : H1 G (Multiplicative M)) :
    SupplierInterface.abelianEquiv (SupplierInterface.pullH1 φ f hf hequiv x) =
      TauCeti.ContCohomology.explicitMap1 G M H N φ f hf hequiv
        (SupplierInterface.abelianEquiv x) := by sorry
end Abelian

section Inflation
variable (G M : Type u) [Group G] [TopologicalSpace G]
  [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]
  (N : Subgroup G) [N.Normal]
  [ContinuousSMul (G ⧸ N) (FixedPoints.addSubgroup N M)]
namespace SupplierInterface
/-- Parent inflation, after the canonical invariant-coefficient identification. -/
def inflateH1 : H1 (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M)) →
    H1 G (Multiplicative M) := sorry
lemma inflateH1_class (c : Z1 (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M))) :
    inflateH1 G M N (classOf (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M)) c) =
      classOf G (Multiplicative M)
        ⟨fun g => Multiplicative.ofAdd
          ((Multiplicative.toAdd (c.val (QuotientGroup.mk g))).val), by sorry, by sorry⟩ := by sorry
end SupplierInterface
/-- The inflation square is computed on the canonical invariant coefficients. -/
theorem comparison_inflation
    (x : H1 (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M))) :
    SupplierInterface.abelianEquiv (SupplierInterface.inflateH1 G M N x) =
      TauCeti.ContCohomology.explicitInfl1 G M N
        (SupplierInterface.abelianEquiv x) := by sorry
end Inflation

section Defect
variable {G B : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [Group B] [TopologicalSpace B] [IsTopologicalGroup B]
  [MulDistribMulAction G B] [ContinuousSMul G B]
/-- NC.3/positive-defect: the positive, left-ordered multiplicative defect. -/
def positiveDefect (b : G → B) (g h : G) : B := b g * (g • b h) * (b (g * h))⁻¹
lemma positiveDefect_apply (b : G → B) (g h : G) :
    positiveDefect b g h = b g * (g • b h) * (b (g * h))⁻¹ := by sorry
lemma positiveDefect_continuous (b : G → B) (hb : Continuous b) :
    Continuous (fun p : G × G => positiveDefect b p.1 p.2) := by sorry
lemma positiveDefect_eq_one_iff (b : G → B) :
    (∀ g h, positiveDefect b g h = 1) ↔ ∀ g h, b (g * h) = b g * (g • b h) := by sorry
lemma positiveDefect_kernel {C : Type u} [Group C] [MulDistribMulAction G C]
    (q : B →* C) (hq : ∀ (g : G) x, q (g • x) = g • q x)
    (b : G → B) (hc : ∀ g h, q (b (g * h)) = q (b g) * (g • q (b h))) (g h : G) :
    q (positiveDefect b g h) = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_cocycle — a genuine cocycle has zero defect.
example (c : Z1 G B) (g h : G) : positiveDefect c.val g h = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_identity — a non-normalized lift retains its value at the identity.
example (b : G → B) : positiveDefect b 1 1 = b 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_inverse — the sign is the positive defect, not Kim's inverse convention.
example (b : G → B) (g h : G) :
    (positiveDefect b g h)⁻¹ = b (g * h) * (g • b h)⁻¹ * (b g)⁻¹ := by sorry

variable {M : Type u} [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]
/-- NC.3/continuous-central-obstruction: descend the actual central defect into Z2. -/
theorem centralDefect_mem_Z2
    (i : Multiplicative M →* B) (hi : Function.Injective i)
    (hcentral : ∀ m b, i m * b = b * i m)
    (hequiv : ∀ (g : G) m, i (Multiplicative.ofAdd (g • Multiplicative.toAdd m)) = g • i m)
    (b : G → B) (f : G × G → M) (hf : Continuous f)
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f (g,h))) = positiveDefect b g h) :
    f ∈ TauCeti.ContCohomology.Z2 G M := by sorry
/-- Changing a central lift adds exactly d1 of a continuous one-cochain. -/
theorem centralDefect_change_lift
    (i : Multiplicative M →* B) (hcentral : ∀ m b, i m * b = b * i m)
    (hequiv : ∀ (g : G) m, i (Multiplicative.ofAdd (g • Multiplicative.toAdd m)) = g • i m)
    (b : G → B) (a : G → M) (g h : G) :
    positiveDefect (fun k => i (Multiplicative.ofAdd (a k)) * b k) g h =
      i (Multiplicative.ofAdd (TauCeti.ContCohomology.d1 G M a (g,h))) *
        positiveDefect b g h := by sorry
/-- Vanishing in continuous H2 supplies a continuous correction, not an arbitrary cochain. -/
theorem centralDefect_lift_exact
    (i : Multiplicative M →* B) (hi : Function.Injective i)
    (hcentral : ∀ m b, i m * b = b * i m)
    (hequiv : ∀ (g : G) m, i (Multiplicative.ofAdd (g • Multiplicative.toAdd m)) = g • i m)
    (b : G → B) (f : TauCeti.ContCohomology.Z2 G M)
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f.val (g,h))) = positiveDefect b g h) :
    TauCeti.ContCohomology.H2pi G M f = 0 ↔
      ∃ a : G → M, Continuous a ∧
        ∀ g h, positiveDefect (fun k => i (Multiplicative.ofAdd (a k)) * b k) g h = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_additive
example (a : G → M) (g h : G) :
    Multiplicative.toAdd (positiveDefect (fun k => Multiplicative.ofAdd (a k)) g h) =
      TauCeti.ContCohomology.d1 G M a (g,h) := by sorry
end Defect

section CoefficientFamily
variable (K G : Type u) [CommRing K] [Group G] [TopologicalSpace G]
/-- NC.3/galois-coefficient-family: continuous semilinear points varying with a K-algebra. -/
structure GaloisCoefficientFamily where
  obj : CommAlgCat.{u} K → Type u
  group : ∀ R, Group (obj R)
  topology : ∀ R, TopologicalSpace (obj R)
  topGroup : ∀ R, @IsTopologicalGroup (obj R) (topology R) (group R)
  action : ∀ R, letI := group R; MulDistribMulAction G (obj R)
  continuousAction : ∀ R, letI := group R; letI := topology R;
    letI := action R; ContinuousSMul G (obj R)
  map : ∀ {R S}, (R ⟶ S) → @ContinuousMonoidHom (obj R) (obj S)
    (group R).toMonoid (group S).toMonoid (topology R) (topology S)
  map_smul : ∀ {R S} (f : R ⟶ S) g x, map f ((action R).toSMul.smul g x) =
    (action S).toSMul.smul g (map f x)
  map_id : ∀ R x, map (𝟙 R) x = x
  map_comp : ∀ {R S T} (f : R ⟶ S) (g : S ⟶ T) x, map (f ≫ g) x = map g (map f x)
attribute [instance] GaloisCoefficientFamily.group GaloisCoefficientFamily.topology
  GaloisCoefficientFamily.topGroup GaloisCoefficientFamily.action
  GaloisCoefficientFamily.continuousAction
variable {K G}
namespace GaloisCoefficientFamily
lemma equivariance (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (g : G) x :
    P.map f (g • x) = g • P.map f x := by sorry
lemma identity (P : GaloisCoefficientFamily K G) (R) (x : P.obj R) : P.map (𝟙 R) x = x := by sorry
lemma composition (P : GaloisCoefficientFamily K G) {R S T}
    (f : R ⟶ S) (g : S ⟶ T) (x : P.obj R) : P.map (f ≫ g) x = P.map g (P.map f x) := by sorry
lemma continuous (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) : Continuous (P.map f) := by sorry
-- Tests distinguish semilinear maps, actual group maps, and continuity.
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.map_mul_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (x y : P.obj R) :
    P.map f (x * y) = P.map f x * P.map f y := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.map_one_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) : P.map f 1 = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.semilinear_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (g : G) x :
    P.map f (g • x) = g • P.map f x := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.identity_test
example (P : GaloisCoefficientFamily K G) (R) (x : P.obj R) :
    P.map (𝟙 R) x = x := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.composition_test
example (P : GaloisCoefficientFamily K G) {R S T}
    (f : R ⟶ S) (g : S ⟶ T) (x : P.obj R) :
    P.map (f ≫ g) x = P.map g (P.map f x) := by sorry
end GaloisCoefficientFamily

/-- NC.3/cohomology-functor: the actual gauge-orbit functor on coefficient algebras. -/
def cohomologyFunctor (P : GaloisCoefficientFamily K G) : CommAlgCat.{u} K ⥤ Type u where
  obj R := H1 G (P.obj R)
  map f := TypeCat.ofHom (SupplierInterface.map (P.map f) (P.map_smul f))
  map_id := by sorry
  map_comp := by sorry
lemma cohomologyFunctor_obj (P : GaloisCoefficientFamily K G) (R) :
    (cohomologyFunctor P).obj R = H1 G (P.obj R) := by sorry
lemma cohomologyFunctor_map_class (P : GaloisCoefficientFamily K G) {R S}
    (f : R ⟶ S) (c : Z1 G (P.obj R)) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) c) =
      classOf G (P.obj S) ⟨fun g => P.map f (c.val g), by sorry, by sorry⟩ := by sorry
lemma cohomologyFunctor_map_one (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) :
    (cohomologyFunctor P).map f (1 : H1 G (P.obj R)) = (1 : H1 G (P.obj S)) := by sorry
lemma cohomologyFunctor_map_id (P : GaloisCoefficientFamily K G) (R)
    (x : (cohomologyFunctor P).obj R) : (cohomologyFunctor P).map (𝟙 R) x = x := by sorry
lemma cohomologyFunctor_map_comp (P : GaloisCoefficientFamily K G) {R S T}
    (f : R ⟶ S) (g : S ⟶ T) (x : (cohomologyFunctor P).obj R) :
    (cohomologyFunctor P).map (f ≫ g) x = (cohomologyFunctor P).map g ((cohomologyFunctor P).map f x) := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_neutral_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) 1) = (1 : H1 G (P.obj S)) := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_identity_test
example (P : GaloisCoefficientFamily K G) (R) (x : H1 G (P.obj R)) :
    (cohomologyFunctor P).map (𝟙 R) x = x := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_gauge_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (x : P.obj R)
    (c : Z1 G (P.obj R)) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) (x • c)) =
      (cohomologyFunctor P).map f (classOf G (P.obj R) c) := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_representative_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S)
    (c : Z1 G (P.obj R)) (d : Z1 G (P.obj S))
    (hd : ∀ g, d.val g = P.map f (c.val g)) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) c) =
      classOf G (P.obj S) d := by sorry
end CoefficientFamily

section Loci
variable {K : Type u} [CommRing K]
variable (F T : CommAlgCat.{u} K ⥤ Type u) (f : F ⟶ T)
  (e : ∀ R, T.obj R) (he : ∀ {R S} (a : R ⟶ S), T.map a (e R) = e S)
/-- NC.3/local-neutral-locus: exact neutralization, with arbitrary algebra points. -/
def neutralLocus (he : ∀ {R S} (a : R ⟶ S), T.map a (e R) = e S) : CommAlgCat.{u} K ⥤ Type u where
  obj R := {x : F.obj R // f.app R x = e R}
  map a := TypeCat.ofHom (fun x => ⟨F.map a x.val, by sorry⟩)
  map_id := by sorry
  map_comp := by sorry
lemma neutralLocus_mem (R) (x : F.obj R) :
    (∃ y : (neutralLocus F T f e he).obj R, y.val = x) ↔ f.app R x = e R := by sorry
lemma neutralLocus_ext (R) (x y : (neutralLocus F T f e he).obj R) :
    x = y ↔ x.val = y.val := by sorry
lemma neutralLocus_map_val {R S} (a : R ⟶ S) (x : (neutralLocus F T f e he).obj R) :
    ((neutralLocus F T f e he).map a x).val = F.map a x.val := by sorry
def neutralLocus_inclusion : neutralLocus F T f e he ⟶ F := sorry
def neutralLocus_lift {E : CommAlgCat.{u} K ⥤ Type u} (a : E ⟶ F)
    (ha : ∀ R x, f.app R (a.app R x) = e R) : E ⟶ neutralLocus F T f e he := sorry
lemma neutralLocus_inclusion_val (R) (x : (neutralLocus F T f e he).obj R) :
    (neutralLocus_inclusion F T f e he).app R x = x.val := by sorry
lemma neutralLocus_inclusion_injective (R) :
    Function.Injective ((neutralLocus_inclusion F T f e he).app R) := by sorry
lemma neutralLocus_lift_comp {E : CommAlgCat.{u} K ⥤ Type u} (a : E ⟶ F)
    (ha : ∀ R x, f.app R (a.app R x) = e R) :
    neutralLocus_lift F T f e he a ha ≫ neutralLocus_inclusion F T f e he = a := by sorry
lemma neutralLocus_lift_unique {E : CommAlgCat.{u} K ⥤ Type u} (a : E ⟶ F)
    (ha : ∀ R x, f.app R (a.app R x) = e R) (b : E ⟶ neutralLocus F T f e he)
    (hb : b ≫ neutralLocus_inclusion F T f e he = a) :
    b = neutralLocus_lift F T f e he a ha := by sorry
-- TauCeti.NonabelianCohomology.NC3.neutralLocus_reject_test
example (R) (x : F.obj R) (hx : f.app R x ≠ e R) :
    ¬ ∃ y : (neutralLocus F T f e he).obj R, y.val = x := by sorry
-- TauCeti.NonabelianCohomology.NC3.neutralLocus_neutral_test
example (R) (x : (neutralLocus F T f e he).obj R) : f.app R x.val = e R := by sorry
-- TauCeti.NonabelianCohomology.NC3.neutralLocus_basechange_test
example {R S} (a : R ⟶ S) (x : (neutralLocus F T f e he).obj R) :
    ((neutralLocus F T f e he).map a x).val = F.map a x.val := by sorry
end Loci

section Selmer
variable {K : Type u} [CommRing K] {ι : Type u}
variable (F : CommAlgCat.{u} K ⥤ Type u) (L : ι → CommAlgCat.{u} K ⥤ Type u)
  (r : ∀ v, F ⟶ L v) (C : ∀ v R, Set ((L v).obj R))
  (hC : ∀ v {R S} (a : R ⟶ S) x, x ∈ C v R → (L v).map a x ∈ C v S)
/-- NC.3/selmer-functor: impose every specified local condition. -/
def selmerFunctor (hC : ∀ v {R S} (a : R ⟶ S) x, x ∈ C v R → (L v).map a x ∈ C v S) : CommAlgCat.{u} K ⥤ Type u where
  obj R := {x : F.obj R // ∀ v, (r v).app R x ∈ C v R}
  map a := TypeCat.ofHom (fun x => ⟨F.map a x.val, by sorry⟩)
  map_id := by sorry
  map_comp := by sorry
lemma selmerFunctor_mem (R) (x : F.obj R) :
    (∃ y : (selmerFunctor F L r C hC).obj R, y.val = x) ↔ ∀ v, (r v).app R x ∈ C v R := by sorry
lemma selmerFunctor_ext (R) (x y : (selmerFunctor F L r C hC).obj R)
    (h : x.val = y.val) : x = y := by sorry
def selmerFunctor_inclusion : selmerFunctor F L r C hC ⟶ F := sorry
def selmerFunctor_localization (v : ι) : selmerFunctor F L r C hC ⟶ L v := sorry
lemma selmerFunctor_map_val {R S} (a : R ⟶ S) (x : (selmerFunctor F L r C hC).obj R) :
    ((selmerFunctor F L r C hC).map a x).val = F.map a x.val := by sorry
lemma selmerFunctor_inclusion_val (R) (x : (selmerFunctor F L r C hC).obj R) :
    (selmerFunctor_inclusion F L r C hC).app R x = x.val := by sorry
lemma selmerFunctor_inclusion_injective (R) :
    Function.Injective ((selmerFunctor_inclusion F L r C hC).app R) := by sorry
lemma selmerFunctor_localization_val (v : ι) (R)
    (x : (selmerFunctor F L r C hC).obj R) :
    (selmerFunctor_localization F L r C hC v).app R x = (r v).app R x.val := by sorry
-- Empty collection: the functor is the whole global cohomology functor.
-- TauCeti.NonabelianCohomology.NC3.selmerFunctor_empty_test
example (hι : IsEmpty ι) (R) :
    ∃ e : (selmerFunctor F L r C hC).obj R ≃ F.obj R, ∀ x, e x = x.val := by sorry
-- A rejected class at any one bad place must be rejected globally.
-- TauCeti.NonabelianCohomology.NC3.selmerFunctor_bad_place_test
example (R) (x : F.obj R) (v : ι) (hx : (r v).app R x ∉ C v R) :
    ¬ ∃ y : (selmerFunctor F L r C hC).obj R, y.val = x := by sorry
-- Universal local conditions impose no constraint.
-- TauCeti.NonabelianCohomology.NC3.selmerFunctor_universal_test
example (h : ∀ v R, C v R = Set.univ) (R) :
    ∃ e : (selmerFunctor F L r C hC).obj R ≃ F.obj R, ∀ x, e x = x.val := by sorry
end Selmer

/-!
Precisely omitted signatures (G4 in the packet):
* finite-quotient-comparison: its inflation square is present; the parent reverse-inclusion
  diagram, descent and induced colimit comparison signatures must be assembled;
* central-obstruction-descent: central kernel homeomorphism and lift choices as a functor;
* invariant-orbit-transport: parent native twisted invariant action supplier interface;
* unipotent-point-topology: native filtered Hopf tensor-point topology;
* cochain-scalar-extension: finite-subspace and quotient topological coefficient tensor base change;
* filtered-affine-torsor-comparison: native strictly filtered equivariant fppf torsors;
* finite-level-representability and invariant-coset-representability: these native inputs;
* local-condition-geometry: B_cris coefficient points and effective invariant-coset quotient;
* selmer-representability, selmer-localization-naturality, central-selmer-dimension:
  scheme representations of the displayed functors, their morphisms and fibre actions;
* depth-one-selmer-comparison: native geometric realization/local-condition equivalence;
* depth-two-cup-obstruction: native continuous Qp cup products with Tate twists.
Each target has an exact mathematical statement and prerequisites in the packet and reader.
The file does not substitute a theorem about arbitrary supplied maps for these targets.
Independent review REV-AnabelianGeometryAndNonabelianChabauty--NC.3 corrected the
packet's source locators and all-algebra hypotheses. The packet is authoritative for
these corrections until assembly synchronizes the reader. Its finite-quotient target
uses the apex of explicitFiniteQuotientCocone1; explicitFiniteQuotientColimit1 is IsColimit.
-/
end TauCeti.NonabelianCohomology.NC3
