/-
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/VStackSheavesAndLisseCategories.md. These statements
suggest Lean forms so contributors and reviewers can converge on names and
signatures. No mathematical implementation is claimed.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
All nontrivial new proofs are placeholders. Existing predicates and carriers are
used directly. The omitted-signature ledger below identifies every unavailable
carrier and the exact packet gap; it introduces no opaque propositions or
assumed theorem fields. Only the actual condensed categorical interfaces below
are elaborated. Compilation establishes their typing, not their proofs.
-/
import Mathlib.Condensed.Solid
import Mathlib.Condensed.TopCatAdjunction
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Limits.Creates
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.HasPullback
import Mathlib.Algebra.Homology.ShortComplex.ShortExact
import Mathlib.RingTheory.FiniteType
import Mathlib.RingTheory.Polynomial.Basic

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject
universe u
namespace TauCeti.Blueprint.VStack

/- VS2/solid-abelian-groups: reuse the pinned integer-solid predicate. -/
abbrev solidProperty : ObjectProperty CondensedAb.{u} := fun A => A.IsSolid
abbrev SolidAb := solidProperty.{u}.FullSubcategory
abbrev solidInclusion : SolidAb.{u} ⥤ CondensedAb.{u} := solidProperty.ι

namespace SolidAb

def mk (A : CondensedAb.{u}) [A.IsSolid] : SolidAb.{u} := ⟨A, inferInstance⟩
abbrev underlying (A : SolidAb.{u}) : CondensedAb.{u} := A.obj

theorem hom_ext {A B : SolidAb.{u}} {f g : A ⟶ B}
    (h : solidInclusion.map f = solidInclusion.map g) : f = g := by
  sorry

def inclusionFullyFaithful : solidInclusion.{u}.FullyFaithful := by
  sorry

instance abelian : Abelian SolidAb.{u} := by
  sorry

theorem limits : HasLimitsOfSize.{u, u} SolidAb.{u} ∧
    HasColimitsOfSize.{u, u} SolidAb.{u} := by
  sorry

-- Auxiliary names refine the all-limits/all-colimits API into two typed data items.
@[instance_reducible] def createsLimits : CreatesLimitsOfSize.{u, u} solidInclusion.{u} := by
  sorry

@[instance_reducible] def createsColimits : CreatesColimitsOfSize.{u, u} solidInclusion.{u} := by
  sorry

theorem extensions (S : ShortComplex CondensedAb.{u})
    (hS : S.ShortExact) (h₁ : S.X₁.IsSolid) (h₃ : S.X₃.IsSolid) : S.X₂.IsSolid := by
  sorry

-- Test TauCeti.Blueprint.VStack.SolidAb.zero (degenerate).
example : (0 : CondensedAb.{u}).IsSolid := by
  sorry

-- Test TauCeti.Blueprint.VStack.SolidAb.freeProfinite (baseline compatibility).
-- Solidity is the planned theorem: the pinned construction alone does not prove it.
example (S : Profinite.{u}) :
    ((Condensed.profiniteSolid (ULift.{u + 1} ℤ)).obj S).IsSolid := by
  sorry

-- Test TauCeti.Blueprint.VStack.SolidAb.finiteSet (computation).
example (S : FintypeCat.{u}) :
    IsIso ((Condensed.profiniteSolidification (ULift.{u + 1} ℤ)).app
      (FintypeCat.toProfinite.obj S)) := by
  sorry
end SolidAb

/- VS2/solidification: an ordinary reflection on actual condensed groups. -/
def solidification : CondensedAb.{u} ⥤ SolidAb.{u} := by
  sorry

def solidificationAdjunction : solidification.{u} ⊣ solidInclusion.{u} := by
  sorry

abbrev solidification_unit (A : CondensedAb.{u}) :
    A ⟶ solidInclusion.obj (solidification.obj A) :=
  solidificationAdjunction.unit.app A

def solidification_homEquiv (A : CondensedAb.{u}) (B : SolidAb.{u}) :
    (solidification.obj A ⟶ B) ≃ (A ⟶ solidInclusion.obj B) := by
  sorry

theorem solidification_counit (B : SolidAb.{u}) :
    IsIso (solidificationAdjunction.counit.app B) := by
  sorry

-- Auxiliary data identifies the reflection with the already constructed free solid object.
def solidification_freeIso (S : Profinite.{u}) :
    solidInclusion.obj (solidification.obj
      ((Condensed.profiniteFree (ULift.{u + 1} ℤ)).obj S)) ≅
      (Condensed.profiniteSolid (ULift.{u + 1} ℤ)).obj S := by
  sorry

theorem solidification_free (S : Profinite.{u}) :
    solidification_unit ((Condensed.profiniteFree (ULift.{u + 1} ℤ)).obj S) ≫
      (solidification_freeIso S).hom =
        (Condensed.profiniteSolidification (ULift.{u + 1} ℤ)).app S := by
  sorry

-- Test TauCeti.Blueprint.VStack.solidification_zero (degenerate).
example : IsZero (solidification.obj (0 : CondensedAb.{u})) := by
  sorry

-- Test TauCeti.Blueprint.VStack.solidification_solid (characterisation).
example (A : CondensedAb.{u}) [A.IsSolid] : IsIso (solidification_unit A) := by
  sorry

-- Test TauCeti.Blueprint.VStack.solidification_finite (computation).
example (S : FintypeCat.{u}) : IsIso
    (solidification_unit ((Condensed.profiniteFree (ULift.{u + 1} ℤ)).obj
      (FintypeCat.toProfinite.obj S))) := by
  sorry

/- VS2/general-ring-solidity: implement the actual polynomial restriction test.
The universal quantifier is the prescribed criterion, not an assumed proposition.
-/
def condensedRestrict {R S : Type (u + 1)} [Ring R] [Ring S]
    (f : R →+* S) : CondensedMod.{u} S ⥤ CondensedMod.{u} R :=
  sheafCompose _ (ModuleCat.restrictScalars f)

def IsSolidGeneral {R : Type (u + 1)} [Ring R] (A : CondensedMod.{u} R) : Prop :=
  ∀ f : Polynomial (ULift.{u + 1} ℤ) →+* R, ((condensedRestrict f).obj A).IsSolid

namespace IsSolidGeneral

theorem iff {R : Type (u + 1)} [Ring R] (A : CondensedMod.{u} R) :
    IsSolidGeneral A ↔ ∀ f : Polynomial (ULift.{u + 1} ℤ) →+* R,
      ((condensedRestrict f).obj A).IsSolid := by
  sorry

theorem restrict {R S : Type (u + 1)} [Ring R] [Ring S] (f : R →+* S)
    (A : CondensedMod.{u} S) (h : IsSolidGeneral A) :
    IsSolidGeneral ((condensedRestrict f).obj A) := by
  sorry

theorem iso {R : Type (u + 1)} [Ring R] {A B : CondensedMod.{u} R}
    (e : A ≅ B) : IsSolidGeneral A ↔ IsSolidGeneral B := by
  sorry

theorem finiteType {R : Type (u + 1)} [Ring R] [Algebra ℤ R]
    [Algebra.FiniteType ℤ R] (A : CondensedMod.{u} R) :
    IsSolidGeneral A ↔ A.IsSolid := by
  sorry

-- Test TauCeti.Blueprint.VStack.IsSolidGeneral.integer (baseline compatibility).
example (A : CondensedAb.{u}) : IsSolidGeneral A ↔ A.IsSolid := by
  sorry

-- Test TauCeti.Blueprint.VStack.IsSolidGeneral.zero (degenerate).
example {R : Type (u + 1)} [Ring R] :
    IsSolidGeneral (0 : CondensedMod.{u} R) := by
  sorry

-- Test TauCeti.Blueprint.VStack.IsSolidGeneral.polynomial (characterisation).
example (A : CondensedMod.{u} (Polynomial (ULift.{u + 1} ℤ)))
    (h : IsSolidGeneral A) : A.IsSolid := by
  sorry
end IsSolidGeneral

/- VS2/qcqs-condensed-sets: categorical cover and pullback predicates. -/
namespace CondensedQCQS

def IsQuasicompact (X : CondensedSet.{u}) : Prop :=
  ∃ (S : Profinite.{u}) (f : S.toCondensed ⟶ X), Epi f

def IsQuasicompactMap {X Y : CondensedSet.{u}} (f : X ⟶ Y) : Prop :=
  ∀ (S : Profinite.{u}) (g : S.toCondensed ⟶ Y), IsQuasicompact (pullback f g)

def IsQuasiseparated (X : CondensedSet.{u}) : Prop :=
  ∀ (S T : Profinite.{u}) (f : S.toCondensed ⟶ X) (g : T.toCondensed ⟶ X),
    IsQuasicompact (pullback f g)
end CondensedQCQS

def CondensedQCQS (X : CondensedSet.{u}) : Prop :=
  CondensedQCQS.IsQuasicompact X ∧ CondensedQCQS.IsQuasiseparated X

namespace CondensedQCQS

theorem quasicompact (X : CondensedSet.{u}) : IsQuasicompact X ↔
    ∃ (S : Profinite.{u}) (f : S.toCondensed ⟶ X), Epi f := by
  sorry

theorem quasiseparated (X : CondensedSet.{u}) : IsQuasiseparated X ↔
    ∀ (S T : Profinite.{u}) (f : S.toCondensed ⟶ X) (g : T.toCondensed ⟶ X),
      IsQuasicompact (pullback f g) := by
  sorry

theorem baseChange {X Y Z : CondensedSet.{u}} (f : X ⟶ Y) (g : Z ⟶ Y)
    (h : IsQuasicompactMap f) : IsQuasicompactMap (pullback.snd f g) := by
  sorry

theorem subobject {X Y : CondensedSet.{u}} (f : X ⟶ Y) [Mono f]
    (h : IsQuasiseparated Y) : IsQuasiseparated X := by
  sorry

theorem profinite (S : Profinite.{u}) : CondensedQCQS S.toCondensed := by
  sorry

-- Test TauCeti.Blueprint.VStack.CondensedQCQS.empty (degenerate).
example : CondensedQCQS (Profinite.of PEmpty.{u + 1}).toCondensed := by
  sorry

-- Test TauCeti.Blueprint.VStack.CondensedQCQS.profinite_test (compatibility).
example (S : Profinite.{u}) : CondensedQCQS S.toCondensed := by
  sorry

-- Test TauCeti.Blueprint.VStack.CondensedQCQS.infiniteDiscrete (non-example).
example : IsQuasiseparated (TopCat.of (ULift.{u + 1} ℕ)).toCondensedSet ∧
    ¬ IsQuasicompact (TopCat.of (ULift.{u + 1} ℕ)).toCondensedSet := by
  sorry
end CondensedQCQS
end TauCeti.Blueprint.VStack

/-!
## Omitted signature ledger

This ledger records mathematical contracts, not Lean declarations. Each omitted
signature needs the named geometric or enhanced carrier; the exact gap is part
of the packet. The file deliberately assumes no opaque proposition and no
record of theorem fields. Replace an entry only after that carrier and its
comparison with the imported owners can actually be stated.

The four condensed nodes above are typed in their ordinary categorical range.
Their cutoff-dependent generators and enhanced derived reflection are still
omitted. The complete source statements below document those boundaries.
-/

/- VS0: Artin v-stacks and eligible operations -/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition
OMITTED signature: TauCeti.Blueprint.VStack.ArtinVStack
Contract: A small v-stack X is Artin when its diagonal X→X×X is representable in locally spatial diamonds and it admits a surjective separated cohomologically smooth atlas U→X with U a locally spatial diamond. Cohomological smoothness is tested after geometric base change using the diamond supplier. The diagonal is quasiseparated; X itself need not be quasiseparated. The property is invariant under equivalence of small v-stacks.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks; DiamondsAndVStacks:D5/relative-representability; DiamondSixOperations:S4/cohomologically-smooth
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.ofAtlas (constructor)
A representable diagonal and a specified surjective separated smooth atlas give the Artin property.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.atlas (data)
Choose U→X with all four atlas conditions; every base change retains them.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.diagonal (projection)
The diagonal is representable in locally spatial diamonds and quasiseparated.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.equiv (compatibility)
Equivalent small v-stacks have equivalent Artin properties.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.chartRefinement (functoriality)
Two smooth atlases have common refinement U×X V, smooth over each chart.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.coefficients (compatibility)
The coefficient category is the existing small-v-stack D_et, computed by smooth atlas descent.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.diamond (compatibility)
Every locally spatial diamond is Artin via the identity atlas.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.empty (degenerate)
The empty locally spatial diamond is Artin, with empty atlas and diagonal.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.classifying_nonquasiseparated (non-example)
For H=E×, closed in GL_1(E), [*/H] is Artin while its noncompact diagonal fibre H is not quasicompact. Requiring X itself to be quasiseparated would exclude this example.
Source: FS-geometrization, Definition IV.1.1; Remarks IV.1.2–IV.1.6, pp.107–109; Example IV.1.9(iv), p.110
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/enhanced-smooth-descent
OMITTED signature: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent
Contract: For an Artin v-stack X and separated smooth atlas U→X, the enhanced D_et(X,Λ), for prime-to-p torsion Λ, is equivalent to the limit of D_et(U_n,Λ) on its Čech nerve using ordinary pullbacks. It agrees with the pre-existing small-v-stack ECD category and is independent of atlas through refinement. Exceptional transition functors give the corresponding normalized smooth-lisse presentation; the enhancement and coherent limits are imported from EDS.
Gaps: VStackSheavesAndLisseCategories/G-neeman; VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition; EnhancedDerivedSheaves:E1/enhanced-derived-category; EnhancedDerivedSheaves:E2/unbounded-hypercover-descent; EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi; DiamondSixOperations:S2/lower-shriek; DiamondSixOperations:S2/lower-shriek-base-change; DiamondSixOperations:S2/projection-formula
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.toCharts (projection)
An object gives pullbacks to U_n with coherent descent data.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.glue (constructor)
Compatible objects on the Čech nerve glue uniquely up to coherent equivalence.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.equivalence (equivalence)
Restriction and gluing give the stated equivalence with the existing ECD category.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.refine (functoriality)
Refinement commutes with restriction, and identity/composition refinements have coherent unit/composition equivalences.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.normalized (compatibility)
Ordinary and exceptional smooth transition presentations correspond after tensoring with the smooth dualizing objects.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.identity (compatibility)
The identity atlas recovers the original coefficient category and identity restriction.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.empty (degenerate)
The category for the empty stack is the zero stable category.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.smoothDescent.torsor (computation)
For finite H, the smooth atlas *→[*/H] gives continuous H-torsor descent data. For H=Z_p this point map is not smooth and cannot be used as a smooth atlas. Infinite discrete H instead gives an étale point map.
Source: FS-geometrization, Convention IV.1.12; Definitions IV.1.13–IV.1.15, pp.110–111
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/partial-compact-support
OMITTED signature: TauCeti.Blueprint.VStack.PartialSupport
Contract: Over an algebraically closed field k of characteristic p, let X be a spatial diamond partially proper over Spd k of finite transcendence dimension, and S a spatial diamond over k. Put α:X×k S→X and β:X×k S→S. Quasi-pro-étale universally open affinoid covers and two pseudouniformizers define the annular systems U_{a,b}, U_a and U_b. Define Rβ_!+=colim_a Rβ_*j_{a!}(−|U_a) and Rβ_!-=colim_b Rβ_*j_{b!}(−|U_b), with transitions given by extension-by-zero counits. Common cofinal refinements give independence of covers and pseudouniformizers. These are partially supported functors, not an unrestricted stacky Rβ_!. No general adjunction is inferred merely from the colimit.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: DiamondSixOperations:S1/lower-shriek-quasicompact; DiamondSixOperations:S1/qcqs-diamond-continuity; DiamondSixOperations:S2/lower-shriek; DiamondSixOperations:S2/lower-shriek-base-change; DiamondSixOperations:S2/projection-formula; DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons
OMITTED API: TauCeti.Blueprint.VStack.PartialSupport.plus (constructor)
Rβ_!+ is the plus-end colimit of Rβ_*j_! in the IV.5 exhaustion.
OMITTED API: TauCeti.Blueprint.VStack.PartialSupport.minus (constructor)
Rβ_!- is the minus-end colimit with the specified source transitions.
OMITTED API: TauCeti.Blueprint.VStack.PartialSupport.transition (data)
Containment of the prescribed annuli gives the transition natural transformations.
OMITTED API: TauCeti.Blueprint.VStack.PartialSupport.cofinal (universal-property)
A cofinal replacement induces a canonical equivalence of the colimit functors.
OMITTED API: TauCeti.Blueprint.VStack.PartialSupport.parameterChange (compatibility)
Two pseudouniformizers/exhaustions yield equivalent functors through a common cofinal system.
OMITTED API: TauCeti.Blueprint.VStack.PartialSupport.baseChange (compatibility)
In the IV.5 partially proper finite-dimensional setup the source’s supported pushforward comparisons commute with the permitted base changes.
OMITTED example: TauCeti.Blueprint.VStack.PartialSupport.empty (degenerate)
If X is empty, both functors take every object to zero.
OMITTED example: TauCeti.Blueprint.VStack.PartialSupport.zero (computation)
Both functors send the zero complex to zero.
OMITTED example: TauCeti.Blueprint.VStack.PartialSupport.cofinalAnnuli (characterisation)
Replacing an annular system by a cofinal subsequence gives the same functor; reversing the support direction is not that replacement.
Source: FS-geometrization, IV.5, construction after Lemma IV.5.1, pp.151–153
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing
OMITTED signature: TauCeti.Blueprint.VStack.PartialSupport.vanish
Contract: For X and S in the preceding IV.5 partially proper finite-dimensional setup, A∈D_et(X,Λ) and B∈D_et(S,Λ), with Λ prime-to-p torsion, both Rβ_!+(α*A⊗β*B) and Rβ_!-(α*A⊗β*B) vanish. The theorem concerns exterior pullbacks of this form; it is not vanishing for every sheaf on X×U.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: VStackSheavesAndLisseCategories:VS0/partial-compact-support; DiamondSixOperations:S1/lower-shriek-quasicompact; DiamondSixOperations:S1/qcqs-diamond-continuity; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange; EnhancedDerivedSheaves:E2/unbounded-hypercover-descent
Source: FS-geometrization, Theorem IV.5.3, pp.153–155
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/point-to-classifying-stack-not-smooth
OMITTED signature: TauCeti.Blueprint.VStack.ArtinVStack.pointAtlasSmooth
Contract: Let H be a locally profinite group admitting a closed embedding into GL_n(E), with ell≠p. If H contains an infinite compact open subgroup K, the point map *→[*/H] is not ell-cohomologically smooth: on K its exceptional dualizing sheaf is the noninvertible sheaf of F_ell-valued distributions. If H is discrete, the point map is separated étale and cohomologically smooth, including infinite discrete H. The printed finite-only exception is corrected in sourceIssues E4.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition; DiamondSixOperations:S5/profinite-quotient-upper-shriek; DiamondSixOperations:S4/etale-maps-smooth
Source: FS-geometrization, Remark IV.1.10, p.110
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps
OMITTED signature: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback
Contract: For a cohomologically smooth morphism f:X→Y of Artin v-stacks, define f! by descent on charts g:U→X for which g and f∘g are separated: its restriction is (f∘g)! followed by inverse smooth normalization for g. The result is f!A=ω_f⊗f*A with ω_f invertible, satisfies base change and composition on this chartwise smooth class, and agrees with the supplier on separated representable eligible maps. The stacky left adjoint exists here. This does not construct exceptional operations for all locally finite-dimensional Artin maps; Remark IV.1.14 leaves that extension unestablished.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: VStackSheavesAndLisseCategories:VS0/enhanced-smooth-descent; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.chart (characterisation)
On a permitted chart, g!f! is canonically (f∘g)!.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.dualizing (data)
ω_f=f!Λ is invertible and f!A=ω_f⊗f*A.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.adjoint (universal-property)
The smooth stacky left adjoint f_! satisfies Map(f_!B,A)=Map(B,f!A).
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.id (simp)
Identity exceptional pullback and its dualizing object are normalized to id and Λ.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.comp (functoriality)
For composable maps in this smooth chartwise class, (f∘g)!≃g!f! coherently.
OMITTED API: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.baseChange (compatibility)
Pullback of ω_f and the smooth f! formula agrees after any permitted Cartesian base change.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.identity (degenerate)
The identity has ω=Λ and identity left/right adjoints.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.etale (computation)
A separated étale map has ω=Λ and f!=f*.
OMITTED example: TauCeti.Blueprint.VStack.ArtinVStack.smoothExceptionalPullback.smoothDiamond (compatibility)
A smooth diamond map of pure dimension d with oriented dualizing object has ω=Λ(d)[2d], not Λ[-2d].
Source: FS-geometrization, Definition IV.1.13; Remark IV.1.14; Definition IV.1.15, pp.110–111
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS0/stability-under-fibre-products-and-representable-maps
OMITTED signature: TauCeti.Blueprint.VStack.ArtinVStack.fibreProduct
Contract: If X,Y,Z are Artin v-stacks then X×Z Y is Artin. If f:X→Y is representable in locally spatial diamonds and Y is Artin, then X is Artin: pull back an atlas of Y and use the representable diagonal. Cohomological smoothness of separated maps of Artin v-stacks is smooth-local on source and target, with the separation and eligibility conditions retained.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS0
Direct inputs: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
Source: FS-geometrization, Proposition IV.1.8; Definition IV.1.11, pp.109–110
-/

/- VS1: ULA, Jacobian criterion and localization -/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/braden-theorem
OMITTED signature: TauCeti.Blueprint.VStack.HyperbolicLocalization.braden
Contract: In the preceding proper finite-dimensional setup, the canonical map L−A→L+A is an equivalence for every monodromic A. For the more general compactifiable local setup of IV.6.9 the source requires bounded-below A, unless finite relative dimension is imposed. The global finite-dimensional theorem has no additional bounded-below restriction.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/hyperbolic-localization; VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange
Source: FS-geometrization, Theorem IV.6.5; Propositions IV.6.6–IV.6.9, pp.156–162
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/divisor-weil-map
OMITTED signature: TauCeti.Blueprint.VStack.DivisorWeilMap
Contract: For a nonarchimedean local field E with residue F_q, work over k=algebraic closure of F_q. With C a completed algebraic closure of E, Div¹≃Spd Ĕ/φ^Z≃[Spd C/W_E], where τ acts on Spd C as τ∘Frob^(−deg τ). Define ψ:Div¹→[*/W_E] by this torsor quotient, and ψ_X^I:X×(Div¹)^I→X×[*/W_E^I]. The Weil group, its degree and Weil topology are imported from ClassFieldTheory layer 9; the divisor space is imported from RelativeFarguesFontaine.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: RelativeFarguesFontaine:RF2:untilts; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks
OMITTED API: TauCeti.Blueprint.VStack.DivisorWeilMap.action (data)
The action is τ∘Frob^(−deg τ); it is a map over Spd k.
OMITTED API: TauCeti.Blueprint.VStack.DivisorWeilMap.torsor (characterisation)
Spd C→Div¹ has relation W_E×Spd C and realizes the displayed quotient.
OMITTED API: TauCeti.Blueprint.VStack.DivisorWeilMap.classify (constructor)
The quotient torsor gives ψ to the existing Weil classifying stack.
OMITTED API: TauCeti.Blueprint.VStack.DivisorWeilMap.product (functoriality)
Finite-set products and maps of indices induce ψ_X^I, compatibly with composition.
OMITTED API: TauCeti.Blueprint.VStack.DivisorWeilMap.inertia (simp)
For τ in inertia the twisting Frobenius factor is the identity.
OMITTED example: TauCeti.Blueprint.VStack.DivisorWeilMap.degree_zero (computation)
A degree-zero inertia element acts on Spd C by its usual action.
OMITTED example: TauCeti.Blueprint.VStack.DivisorWeilMap.empty_indices (degenerate)
For I empty, ψ_X^I is the identity of X.
OMITTED example: TauCeti.Blueprint.VStack.DivisorWeilMap.frobenius_sign (non-example)
For degree-one τ the correction is Frob^−1, so its action is over Spd k; omitting it does not cancel the induced Frobenius on k.
Source: FS-geometrization, IV.7, construction before Proposition IV.7.1, p.164
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/drinfeld-local-systems
OMITTED signature: TauCeti.Blueprint.VStack.PerfectLocalSystem.drinfeld
Contract: For every finite I, small v-stack X, and prime-to-p torsion Λ, ψ_X^I* gives D_lc(X×[*/W_E^I],Λ)≃D_lc(X×(Div¹)^I,Λ). This is the locally constant perfect formulation, not an unrestricted assertion π1((Div¹)^I)=W_E^I for a conventional profinite fundamental group.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/perfect-local-systems; VStackSheavesAndLisseCategories:VS1/drinfeld-pullback; VStackSheavesAndLisseCategories:VS1/geometric-divisor-finite-etale; RelativeFarguesFontaine:RF2:untilts
Source: FS-geometrization, Proposition IV.7.3, pp.165–166
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/drinfeld-pullback
OMITTED signature: TauCeti.Blueprint.VStack.DivisorWeilMap.fullyFaithful
Contract: For every small v-stack X and prime-to-p torsion Λ, ψ_X* is fully faithful on D_et. It is an equivalence if D_et(X,Λ)→D_et(X×Spd C,Λ) is an equivalence. For every finite I, ψ_X^I* remains fully faithful. Essential surjectivity of the full category is conditional; this is not a general product formula for fundamental groups.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/divisor-weil-map; DiamondSixOperations:S2/lower-shriek; DiamondSixOperations:S2/lower-shriek-base-change; DiamondSixOperations:S2/projection-formula; EnhancedDerivedSheaves:E2/unbounded-hypercover-descent
Source: FS-geometrization, Proposition IV.7.1; Corollary IV.7.2, pp.164–165
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/formal-smoothness
OMITTED signature: TauCeti.Blueprint.VStack.IsFormallySmooth
Contract: A map X→Y is formally smooth in the IV.3 sense if for every characteristic-p affinoid perfectoid S, closed perfectoid subspace S0⊂S, map S→Y and compatible S0→X, the lift S→X exists after replacing S by an étale neighbourhood whose pullback over S0 contains the prescribed lift. This is lifting along closed perfectoid subspaces, not along nilpotent thickenings of schemes.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks; DiamondsAndVStacks:D1/strictly-totally-disconnected; DiamondsAndVStacks:D1/universally-open-std-cover; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
OMITTED API: TauCeti.Blueprint.VStack.IsFormallySmooth.lift (universal-property)
Every prescribed closed-perfectoid lifting square has an étale-local solution agreeing over S0.
OMITTED API: TauCeti.Blueprint.VStack.IsFormallySmooth.baseChange (functoriality)
Base change preserves the lifting property.
OMITTED API: TauCeti.Blueprint.VStack.IsFormallySmooth.comp (functoriality)
Composites of formally smooth maps are formally smooth.
OMITTED API: TauCeti.Blueprint.VStack.IsFormallySmooth.etale (compatibility)
Étale maps of perfectoid spaces are formally smooth.
OMITTED API: TauCeti.Blueprint.VStack.IsFormallySmooth.local (characterisation)
The property is étale-local on source and target.
OMITTED API: TauCeti.Blueprint.VStack.IsFormallySmooth.open (other)
A formally smooth map is universally open; a formally smooth v-surjection has sections étale-locally.
OMITTED example: TauCeti.Blueprint.VStack.IsFormallySmooth.identity (degenerate)
The identity morphism is formally smooth using the specified map S→X.
OMITTED example: TauCeti.Blueprint.VStack.IsFormallySmooth.etale_test (compatibility)
An étale map satisfies this definition with étale neighbourhood lifting.
OMITTED example: TauCeti.Blueprint.VStack.IsFormallySmooth.closed_origin (non-example)
The origin inclusion into the perfectoid affine line is not formally smooth: a coordinate on a characteristic-p perfectoid disc vanishes on its closed origin but cannot vanish on an étale neighbourhood of that origin.
Source: FS-geometrization, Definition IV.3.1, p.130
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/formal-smoothness-calculus
OMITTED signature: TauCeti.Blueprint.VStack.IsFormallySmooth.calculus
Contract: Formal smoothness is stable under composition and base change, is étale-local on both sides, gives universal openness, and a formally smooth v-surjection admits étale-local sections. The source descent proposition IV.3.7 applies with its formally smooth surjection; it is not descent through an arbitrary map.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/formal-smoothness; DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks
Source: FS-geometrization, Propositions IV.3.2–IV.3.7, pp.130–133
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/geometric-divisor-finite-etale
OMITTED signature: TauCeti.Blueprint.VStack.DivisorWeilMap.finiteEtale
Contract: For E a nonarchimedean local field and C0 an algebraically closed characteristic-p perfectoid field over k, finite étale covers of Spa C0×Div¹ come by pullback from Div¹. The geometric curve input is the exact supplier theorem that every finite étale O_X-algebra on the absolute Fargues–Fontaine curve over an algebraically closed point equals O_X⊗E A with A finite étale over E. In SW20 the displayed field is Q_p; the proof works in this E-generality using the supplied E-bundle classification and finite étale adic/diamond comparison.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras; DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons; DiamondsAndVStacks:D6/etale-site-comparison; RelativeFarguesFontaine:RF2:untilts; VStackSheavesAndLisseCategories:VS1/divisor-weil-map
Source: SW20, SW20 Lemma 16.3.2; Propositions 16.3.3,16.3.6, pp.144–148; FS IV.7.3, pp.165–166
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula
OMITTED signature: TauCeti.Blueprint.VStack.HyperbolicLocalization.compatibilities
Contract: For the proper finite-dimensional hyperbolic setup and monodromic objects, L commutes with base pullback and ordinary base pushforward. It commutes with supported pushforward and exceptional base pullback when the base map is compactifiable representable locally spatial of finite relative dimension. Relative Verdier duality exchanges L for an action with L for the inverse action. If A is f-ULA, LA is f0-ULA.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/braden-theorem; VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion; VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality
Source: FS-geometrization, Propositions IV.6.12–IV.6.14, pp.163–164
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/hyperbolic-localization
OMITTED signature: TauCeti.Blueprint.VStack.HyperbolicLocalization
Contract: Let f:X→S be proper representable in spatial diamonds of finite relative transcendence dimension, with a G_m-action satisfying Hypothesis IV.6.1: finitely many open-and-closed fixed pieces X_i^0 and locally closed attracting/repelling X_i^± covering X, with action extensions to (A¹)^±. Set X^±=disjoint union X_i^±, q±:X±→X and p±:X±→X0. Equivariant maps (A¹)^±→X intrinsically represent these spaces, independent of the decomposition. Define L+=Rp+!q+* and L−=Rp−*q−!, with the natural comparison L−→L+. The monodromic subcategory is generated under finite colimits and retracts by pullbacks from D_et(X/G_m,Λ).
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition; VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.attractor (data)
X+ represents G_m-equivariant maps from (A¹)+ to X, with q+=evaluation at 1 and p+=evaluation at 0.
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.repeller (data)
The same characterization with inverse action gives X−.
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.plus (constructor)
L+=Rp+!q+* with the specified supported operation.
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.minus (constructor)
L−=Rp−*q−! with the specified exceptional operation.
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.comparison (data)
The Cartesian fixed square and adjunctions define a canonical map L−→L+.
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.monodromic (characterisation)
Monodromic objects are the finite-colimit/retract closure of the equivariant image.
OMITTED API: TauCeti.Blueprint.VStack.HyperbolicLocalization.refinement (compatibility)
Changing the fixed-piece decomposition leaves the intrinsic correspondences and functors equivalent.
OMITTED example: TauCeti.Blueprint.VStack.HyperbolicLocalization.trivial_action (computation)
For the trivial action, X0=X+=X−=X and both localization functors and the comparison are identities.
OMITTED example: TauCeti.Blueprint.VStack.HyperbolicLocalization.empty (degenerate)
For X empty all three spaces and both output categories are empty/zero.
OMITTED example: TauCeti.Blueprint.VStack.HyperbolicLocalization.projective_line (computation)
For P¹ over a geometric base with scaling action, the 0-attractor is A¹ and the opposite 0-repeller is the point; the two correspondences are not identical before taking the Braden comparison.
Source: FS-geometrization, Hypothesis IV.6.1; Proposition IV.6.2; Definition IV.6.11, pp.155–156,162
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/jacobian-criterion
OMITTED signature: TauCeti.Blueprint.VStack.SectionSpace.jacobian
Contract: Under the preceding smooth/quasiprojective section hypotheses, M_Z is a locally spatial diamond, compactifiable over S, and M_Z^sm is an open subfunctor cohomologically smooth over S. At a geometric section its ell-dimension is deg(s*T_Z/X_S), locally finite. No global dimension bound is assumed. Strictly positive slopes are essential to this criterion.
Gaps: VStackSheavesAndLisseCategories/G-jacobian; VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/section-functor-and-positive-tangent; VStackSheavesAndLisseCategories:VS1/formal-smoothness-calculus; VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion; VStackSheavesAndLisseCategories:VS1/smooth-ula-criterion; VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces; VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution; AdicSpacesPartII:R5
Source: FS-geometrization, Theorem IV.4.2; proof IV.4.22–IV.4.30, pp.134–151
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category
OMITTED signature: TauCeti.Blueprint.VStack.KernelCategory
Contract: For a small v-stack S, C_S has objects compactifiable representable locally spatial X→S of locally finite transcendence dimension, Hom(X,Y)=D_et(X×S Y,Λ), composition A⋆B=Rπ13!(π12*A⊗π23*B), and identity Δ!Λ. The eligible operations give the associator and units in this 2-category. Relative Verdier duality is D_X/S(A)=RHom(A,Rf!Λ). This is the kernel 2-category used for ULA adjoints, not ordinary rigidity of a monoidal category.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS0/enhanced-smooth-descent; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange; EnhancedDerivedSheaves:E3/mates-and-beck-chevalley
OMITTED API: TauCeti.Blueprint.VStack.KernelCategory.hom (data)
Hom(X,Y) is exactly D_et(X×S Y,Λ).
OMITTED API: TauCeti.Blueprint.VStack.KernelCategory.comp (constructor)
Composition is the displayed eligible supported convolution.
OMITTED API: TauCeti.Blueprint.VStack.KernelCategory.id (constructor)
The identity kernel is the diagonal supported tensor unit.
OMITTED API: TauCeti.Blueprint.VStack.KernelCategory.assoc (structure)
Convolution satisfies a coherent associator and both unit laws.
OMITTED API: TauCeti.Blueprint.VStack.KernelCategory.baseChange (functoriality)
Pullback along S′→S is a 2-functor respecting convolution and adjunction data.
OMITTED API: TauCeti.Blueprint.VStack.KernelCategory.dual (data)
The proposed right-adjoint kernel is the relative Verdier dual.
OMITTED example: TauCeti.Blueprint.VStack.KernelCategory.point (computation)
For X=Y=S, kernels compose by tensor over Λ and the identity is Λ.
OMITTED example: TauCeti.Blueprint.VStack.KernelCategory.identity_action (characterisation)
Convolution with Δ!Λ acts as the identity on every kernel.
OMITTED example: TauCeti.Blueprint.VStack.KernelCategory.empty (degenerate)
Every Hom category involving the empty diamond is the zero category.
Source: FS-geometrization, IV.2.3.3, pp.123–125
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/perfect-local-systems
OMITTED signature: TauCeti.Blueprint.VStack.PerfectLocalSystem
Contract: D_lc(Y,Λ) is the full subcategory of D_et(Y,Λ) whose objects are v-locally constant with perfect derived Λ-fibres. These are exactly tensor-dualizable objects; on spatial diamonds they are étale-locally constant. The word perfect describes the full complex, including bounded Tor amplitude, and is stronger than finite-dimensional cohomology in each degree.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E1/presentability-and-derived-tensor; VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality
OMITTED API: TauCeti.Blueprint.VStack.PerfectLocalSystem.constant (constructor)
A perfect Λ-complex gives a constant object of D_lc.
OMITTED API: TauCeti.Blueprint.VStack.PerfectLocalSystem.fibre (projection)
Every geometric fibre is perfect.
OMITTED API: TauCeti.Blueprint.VStack.PerfectLocalSystem.dualizable (characterisation)
D_lc membership is equivalent to tensor dualizability.
OMITTED API: TauCeti.Blueprint.VStack.PerfectLocalSystem.pullback (functoriality)
All stack pullbacks preserve these complexes and their duals.
OMITTED API: TauCeti.Blueprint.VStack.PerfectLocalSystem.etale (compatibility)
On a spatial diamond the local trivializations may be taken étale.
OMITTED API: TauCeti.Blueprint.VStack.PerfectLocalSystem.point (equivalence)
On an algebraically closed rank-one point D_lc identifies with Perf(Λ).
OMITTED example: TauCeti.Blueprint.VStack.PerfectLocalSystem.unit (computation)
The constant tensor unit is a perfect local system.
OMITTED example: TauCeti.Blueprint.VStack.PerfectLocalSystem.zero (degenerate)
The zero complex is a perfect local system.
OMITTED example: TauCeti.Blueprint.VStack.PerfectLocalSystem.unbounded (non-example)
Over a field, a complex with one nonzero copy of the field in every nonnegative degree is not perfect although each cohomology group is finite-dimensional.
Source: FS-geometrization, IV.7 before Proposition IV.7.3, p.165
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/perfect-rhom-and-la-characterisation
OMITTED signature: TauCeti.Blueprint.VStack.IsULA.perfectRHom
Contract: For a spatial diamond X, perfect-constructible A and any small-v-stack map g:Y→X, g*RHom(A,B)→RHom(g*A,g*B) is an isomorphism for all B, and RHom(A,Λ) is overconvergent. For an eligible f:X→S, local acyclicity implies D_X/S(A)⊗f*B≃RHom(A,f!B). Conversely this formula, together with overconvergence, characterizes LA under the local uniform bound on the cohomological dimension of separated qc étale neighborhoods of X. Universally on S it characterizes ULA with overconvergence retained. Affinoid perfectoid maps to spatial S admit the cofinal relative-ball neighborhoods of IV.2.16 used to prove the formula.
Gaps: VStackSheavesAndLisseCategories/G-neeman; VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/ula-definition-with-constructibility; DiamondSixOperations:S2/lower-shriek; DiamondSixOperations:S2/lower-shriek-base-change; DiamondSixOperations:S2/projection-formula; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange; EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations; DiamondsAndVStacks:D5/limits-and-finite-stage-comparisons
Source: FS-geometrization, Lemmas IV.2.16–IV.2.18; Proposition IV.2.19; Remark IV.2.21, pp.119–123
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/section-functor-and-positive-tangent
OMITTED signature: TauCeti.Blueprint.VStack.SectionSpace
Contract: For a perfectoid S/F_q and smooth Z→X_S over the relative Fargues–Fontaine curve, locally a locally closed subspace of a projective space over X_S, M_Z(T)=sections X_T→Z_T. Its subfunctor M_Z^sm consists of sections s for which s*T_Z/X_S has only strictly positive slopes at every geometric point. The infinitesimal deformation complex is RΓ(X_T,s*T_Z/X_S); positive slopes kill H¹ and its H⁰ is the supplied positive Banach–Colmez tangent space. Smoothness and differentials over sousperfectoid charts are imported from AdicSpacesPartII.
Gaps: VStackSheavesAndLisseCategories/G-jacobian; VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: RelativeFarguesFontaine:RF2:untilts; RelativeFarguesFontaine:RF3; VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles; VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology; VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology; VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism; VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration; VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces; VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution; AdicSpacesPartII:R5/sousperfectoid-adic-space; VStackSheavesAndLisseCategories:VS1/formal-smoothness
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.section (constructor)
A section of Z_T→X_T defines a T-point of M_Z.
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.ext (extensionality)
Two T-points agree iff their sections agree as maps over X_T.
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.baseChange (functoriality)
Pullback along T′→T pulls back sections, and obeys identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.positive (characterisation)
Membership in M_Z^sm is precisely strict positivity of every geometric pulled-back tangent bundle.
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.tangent (data)
The deformation complex at s is RΓ(X_T,s*T_Z/X_S), including both H⁰ and H¹.
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.vectorBundle (compatibility)
Sections of a vector bundle V give the existing BC(V), not a new bundle-cohomology construction.
OMITTED API: TauCeti.Blueprint.VStack.SectionSpace.quotient (example)
For the Quot example a surjection E→F is in the smooth locus when max slope(ker)<min slope(F), because its tangent is Hom(ker,F).
OMITTED example: TauCeti.Blueprint.VStack.SectionSpace.identity (degenerate)
Z=X_S gives M_Z=M_Z^sm=S and zero tangent.
OMITTED example: TauCeti.Blueprint.VStack.SectionSpace.positive_bundle (compatibility)
For V=O(1), M_V=BC(O(1)), H¹=0 and the smooth locus is all of M_V.
OMITTED example: TauCeti.Blueprint.VStack.SectionSpace.zero_slope (non-example)
For V=O, M_V=E as a locally profinite sheaf, but M_V^sm is empty: slope zero is not strictly positive. The criterion is sufficient and does not detect every cohomologically smooth section space.
Source: FS-geometrization, Definition IV.4.1; Theorem IV.4.2; Example IV.4.7, pp.134–136
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/smooth-spd-oe
OMITTED signature: TauCeti.Blueprint.VStack.SpdOE.cohomologicallySmooth
Contract: For a nonarchimedean local field E with residue F_q and ell≠p, Spd O_E→Spd F_q is ell-cohomologically smooth, and its dualizing object is F_ell(1)[2]. The integral special fibre is included; smoothness of the generic fibre alone does not establish this.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/smooth-ula-criterion; DiamondSixOperations:S5/spd-qp-smooth; DiamondSixOperations:S5/nonfree-quotient-smooth; RelativeFarguesFontaine:RF2:integral-divisors; ClassicalAdicEtaleCohomology:H4/annulus-cohomology
Source: FS-geometrization, Corollary IV.2.34, p.130
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/smooth-ula-criterion
OMITTED signature: TauCeti.Blueprint.VStack.IsArtinULA.smoothCriterion
Contract: For smooth f:X→S of Artin v-stacks, A is ULA iff p1*RHom(A,Λ)⊗p2*A→RHom(p1*A,p2*A) is an equivalence. For a compactifiable representable diamond map of locally finite dimension, f is ell-cohomologically smooth iff F_ell is f-ULA and Rf!F_ell is invertible.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks; VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion; VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
Source: FS-geometrization, Propositions IV.2.32–IV.2.33, pp.129–130
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/ula-analytification
OMITTED signature: TauCeti.Blueprint.VStack.IsULA.analytification
Contract: For a complete nonarchimedean field K of residue characteristic p, separated locally finite-type K-scheme map f:X→S and A∈D_c^b(X,Λ), algebraic f-ULA is equivalent to diamond ULA of the analytification A_ad for f_ad,diamond. The bounded constructible range and all prime-to-p coefficient assumptions are retained.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1; VStackSheavesAndLisseCategories/G-algebraic-ula
Direct inputs: VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion; ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1; DiamondsAndVStacks:D6/etale-site-comparison; EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual
Source: FS-geometrization, Proposition IV.2.30 and footnote 2, p.128
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/ula-definition-with-constructibility
OMITTED signature: TauCeti.Blueprint.VStack.IsULA
Contract: For a compactifiable f:X→S of locally spatial diamonds with locally finite transcendence dimension and nΛ=0, (n,p)=1, A∈D_et(X,Λ) is locally acyclic if (a) for every geometric x over s and generization t of s, RΓ(X_x,A)→RΓ(X_x×S_s S_t,A) is an equivalence, and (b) for every separated étale j:U→X with f∘j quasicompact, R(f∘j)_!(A|U) is perfect-constructible. It is ULA if both conditions hold after every locally spatial base change S′→S. Strict localizations and perfect-constructibility are the supplied geometric notions.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: DiamondSixOperations:S0/eligible-morphism; DiamondSixOperations:S1/lower-shriek-quasicompact; DiamondSixOperations:S1/qcqs-diamond-continuity; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange; DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks; EnhancedDerivedSheaves:E1/enhanced-derived-category
OMITTED API: TauCeti.Blueprint.VStack.IsULA.generization (projection)
ULA implies the stated strict-local generization map is an equivalence after any base change.
OMITTED API: TauCeti.Blueprint.VStack.IsULA.compactDirectImage (projection)
Every separated étale j with f∘j quasicompact has perfect-constructible supported direct image.
OMITTED API: TauCeti.Blueprint.VStack.IsULA.iff (characterisation)
ULA is precisely the conjunction of these two clauses after every locally spatial base change.
OMITTED API: TauCeti.Blueprint.VStack.IsULA.baseChange (functoriality)
Pullback of a ULA object is ULA for the pulled-back map.
OMITTED API: TauCeti.Blueprint.VStack.IsULA.iso (compatibility)
Isomorphic complexes have the same ULA property.
OMITTED API: TauCeti.Blueprint.VStack.IsULA.schemes (compatibility)
For separated finite-type K-schemes and bounded constructible torsion complexes, ULA agrees with scheme ULA after analytification, using IV.2.30 and the supplied comparison operations.
OMITTED example: TauCeti.Blueprint.VStack.IsULA.zero (degenerate)
The zero complex is ULA for every eligible f.
OMITTED example: TauCeti.Blueprint.VStack.IsULA.point_perfect (computation)
On Spa C→Spa C with C algebraically closed, a bounded finite-dimensional F_ell complex is ULA.
OMITTED example: TauCeti.Blueprint.VStack.IsULA.point_infinite (non-example)
An infinite-dimensional F_ell vector space in degree zero over Spa C satisfies the generization clause but is not ULA, because clause (b) for j=id demands perfection.
Source: FS-geometrization, Definition IV.2.1; Remarks IV.2.2–IV.2.3, pp.114–116
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality
OMITTED signature: TauCeti.Blueprint.VStack.IsULA.descent
Contract: ULA descends under a v-cover of the base and is local under separated cohomologically smooth surjections of the source. For a proper representable map g:Y→X of locally finite relative dimension, g_* preserves ULA relative to S. Tensor composition g*A⊗B is ULA for f∘g if A is f-ULA and B is g-ULA with eligible maps; the relative-dual formula is IV.2.26. Non-universal local acyclicity uses the source’s local uniform bound on étale cohomological dimension; the ULA statements require no extra uniform bound on the base.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/ula-definition-with-constructibility; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection; DiamondSixOperations:S1/lower-shriek-quasicompact; DiamondSixOperations:S1/qcqs-diamond-continuity
Source: FS-geometrization, Propositions IV.2.4–IV.2.6, IV.2.11–IV.2.13; IV.2.26, pp.116–127
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion
OMITTED signature: TauCeti.Blueprint.VStack.IsULA.iffKernelAdjoint
Contract: For X→S in C_S and A∈D_et(X,Λ), A is ULA iff p1*D_X/S(A)⊗p2*A→RHom(p1*A,p2!A) is an equivalence, iff A∈Hom_C_S(X,S) has a right adjoint. That adjoint is D_X/S(A). ULA relative duals are ULA and the bidual map is an equivalence; exterior products of ULA objects obey relative duality and ULA with the eligible hypotheses.
Gaps: VStackSheavesAndLisseCategories/G-neeman; VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category; VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange
Source: FS-geometrization, Theorem IV.2.23; Corollaries IV.2.24–IV.2.25, pp.124–126
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks
OMITTED signature: TauCeti.Blueprint.VStack.IsArtinULA
Contract: For f:X→S of Artin v-stacks, assume there exists a surjective separated representable smooth chart g:U→X with U locally spatial and f∘g compactifiable of locally finite transcendence dimension. A∈D_et(X,Λ) is f-ULA iff g*A is (f∘g)-ULA. This is independent of g by common refinements and smooth source/base descent. Operations and relative-dual statements extend only when the operations in question have been constructed.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition; VStackSheavesAndLisseCategories:VS0/enhanced-smooth-descent; VStackSheavesAndLisseCategories:VS1/ula-descent-and-smooth-locality
OMITTED API: TauCeti.Blueprint.VStack.IsArtinULA.ofChart (constructor)
ULA on a permitted chart constructs the Artin ULA property.
OMITTED API: TauCeti.Blueprint.VStack.IsArtinULA.chart (characterisation)
Every permitted chart detects the same property.
OMITTED API: TauCeti.Blueprint.VStack.IsArtinULA.baseChange (functoriality)
Permitted Artin base change preserves ULA and the composite-chart hypothesis.
OMITTED API: TauCeti.Blueprint.VStack.IsArtinULA.iso (compatibility)
The property depends only on the isomorphism class of the complex.
OMITTED API: TauCeti.Blueprint.VStack.IsArtinULA.diamond (equivalence)
On diamond maps this is exactly IsULA, by identity charts.
OMITTED example: TauCeti.Blueprint.VStack.IsArtinULA.diamond_test (compatibility)
Identity charts recover the two diamond ULA clauses.
OMITTED example: TauCeti.Blueprint.VStack.IsArtinULA.zero (degenerate)
The zero complex is ULA whenever a permitted chart exists.
OMITTED example: TauCeti.Blueprint.VStack.IsArtinULA.classifying_perfect (computation)
For a finite p-group H and F_ell with ell≠p, a finite-dimensional representation on [*/H] is ULA over the point.
Source: FS-geometrization, Definition IV.2.31, p.129
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus
OMITTED signature: TauCeti.Blueprint.VStack.IsULA.calculus
Contract: In C_S, a p₂-ULA kernel A:X→Y is a left adjoint when Y→S is proper; its right adjoint is the switched relative dual. ULA is preserved by relative duality with biduality, exterior products and eligible composition g*A⊗B, with the corresponding dual formulas. If f is a retract over S of eligible g and Λ is g-ULA, then Λ is f-ULA. For proper quasi-pro-étale g:Y→X and eligible f:X→S, A is (fg)-ULA iff Rg*A is f-ULA. ULA base change gives f*Rg*A⊗B≃Rĝ*(f′*A⊗ĝ*B) for f-ULA B and arbitrary base map g.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS1
Direct inputs: VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion; VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category; VStackSheavesAndLisseCategories:VS1/perfect-rhom-and-la-characterisation; DiamondSixOperations:S3/upper-shriek; DiamondSixOperations:S3/adjunction-calculus; DiamondSixOperations:S3/upper-shriek-pushforward-exchange
Source: FS-geometrization, Proposition IV.2.24; Corollary IV.2.25; Proposition IV.2.26; Corollary IV.2.27; Proposition IV.2.28; Corollary IV.2.29, pp.125–128
-/

/- VS2: Condensed and solid foundations -/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/affine-condensed-points
OMITTED signature: TauCeti.Blueprint.VStack.AffineCondensedPoints
Contract: For a base ring R, affine R-scheme Spec B and condensed commutative R-algebra A, define its condensed points by sheafifying the functor S↦Hom_Ralg(B,A(S)); in fact it is already a sheaf because Hom preserves limits. This uses the pinned sheaf site and genuine representability; an arbitrary accessible functor on R-algebras need not preserve products or sheaf descent (the inherited source error E10). For finite presentation, polynomial points and equations give the product/equalizer presentation and filtered-colimit accessibility.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: mathlib:CondensedSet; mathlib:Condensed; VStackSheavesAndLisseCategories:VS2/condensed-epis-and-colimits; VStackSheavesAndLisseCategories:VS2/qcqs-condensed-sets
OMITTED API: TauCeti.Blueprint.VStack.AffineCondensedPoints.evaluate (constructor)
Sections are Hom_Ralg(B,A(S)) with their restriction maps.
OMITTED API: TauCeti.Blueprint.VStack.AffineCondensedPoints.sheaf (structure)
The represented functor preserves the products and equalizers required by sheaf descent.
OMITTED API: TauCeti.Blueprint.VStack.AffineCondensedPoints.map (functoriality)
Ring maps in B act contravariantly and maps in A covariantly, respecting identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.AffineCondensedPoints.product (compatibility)
Products of affine schemes give products of condensed points.
OMITTED API: TauCeti.Blueprint.VStack.AffineCondensedPoints.equations (characterisation)
A polynomial presentation gives the equalizer defined by its equations.
OMITTED API: TauCeti.Blueprint.VStack.AffineCondensedPoints.accessible (compatibility)
For finitely presented B the points functor commutes with filtered colimits of coefficient algebras.
OMITTED example: TauCeti.Blueprint.VStack.AffineCondensedPoints.affineZero (degenerate)
Affine zero-space is the terminal condensed set.
OMITTED example: TauCeti.Blueprint.VStack.AffineCondensedPoints.affineLine (computation)
Affine one-space has condensed points the underlying condensed set of A.
OMITTED example: TauCeti.Blueprint.VStack.AffineCondensedPoints.polynomial (compatibility)
For R[x₁,…,x_n] the points are A^n, preserving sheaf products; the constant two-element accessible functor fails even the empty-cover sheaf condition.
Source: PQ26, Appendix A, affine construction; Lemma A.8, pp.88,90–91 (corrected by inherited E10)
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/breen-deligne-resolution
OMITTED signature: TauCeti.Blueprint.VStack.BreenDeligne.resolution
Contract: There is a functorial resolution of every abelian group A by terms finite direct sums of Z[A^r], with augmentation Z[A]→A. Its differentials are universal finite integral combinations of maps induced by integer matrices, so it applies after sheafification in any topos. The natural scalar n action and the action induced by A→A, a↦na, are chain homotopic. Applied to condensed groups it gives the finite-power RHom spectral sequence used for solidification and sheaf solidity.
Gaps: VStackSheavesAndLisseCategories/G-breen; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements; EnhancedDerivedSheaves:E0/dold-kan-simplicial-enrichment; mathlib:CondensedAb
Source: Scholze-condensed, Theorems 4.5,4.10; Proposition 4.17; Appendix IV, pp.25,29–32
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/closed-affine-points-quasicompact
OMITTED signature: TauCeti.Blueprint.VStack.AffineCondensedPoints.closedQC
Contract: For a quasiseparated condensed commutative ring A and a closed immersion X→A_R^n, X(A)→A^n is a quasicompact monomorphism, hence X(A) is quasiseparated. With finitely many equations this is a pullback of a point along A^n→A^r. For arbitrarily many equations, on every profinite source the simultaneous zero set is an intersection of closed compact subsets, hence remains compact and represents the fibre. The finiteness of n is retained.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/affine-condensed-points; VStackSheavesAndLisseCategories:VS2/qcqs-condensed-sets; VStackSheavesAndLisseCategories:VS2/condensed-epis-and-colimits; mathlib:CompHaus
Source: PQ26, Appendix A, Lemma A.8, pp.90–91
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality
OMITTED signature: TauCeti.Blueprint.VStack.SolidSheaf.ulaDuality
Contract: For Λ=lim_n Z/n over a specified system of integers prime to p and eligible f:X→S, D_ULA(X/S,Λ) consists of derived-complete compatible torsion reductions that are f-ULA. Write A∨=RHom_solid(A,Λ). For A of bounded Tor amplitude, B∈D_et(X,Z/n), Proposition VII.5.2 gives f♯(D_X/S(A)∨⊗solid B)≃Rf_!(A_n⊗ᴸ B). If f is proper, representable in spatial diamonds and of finite transcendence dimension, then for every solid B, f♯(D_X/S(A)∨⊗solid B)≃Rf*RHom_solid(A∨,B). On proper spatial finite-dimensional finite-Tor kernels, A↦A∨ reverses 2-morphisms and transports !-convolution to ♯-convolution. In particular A∨ is right adjoint to D_X/S(A)∨ in the solid kernel category. Both solid duals and the properness hypothesis in the second formula are essential.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion; VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category; AdicCoefficientsAndComparisons:L0/adic-coefficient-limit
Source: FS-geometrization, VII.5, Propositions VII.5.2–VII.5.3; Corollary VII.5.4, pp.264–268
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/condensed-cohomology
OMITTED signature: TauCeti.Blueprint.VStack.CondensedCohomology.compact
Contract: For compact Hausdorff S, condensed cohomology with discrete integer coefficients agrees with ordinary sheaf/Čech cohomology. Profinite S has H^i(S,Z)=0 for i>0. For the topological condensed reals, H^i(S,R)=0 for i>0 and H⁰=C(S,R). A profinite hypercover computes the latter by the complex C(S_•,R); every cocycle admits a primitive of norm at most (1+ε) times its norm for each ε>0.
Gaps: VStackSheavesAndLisseCategories/G-topology; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: mathlib:Condensed; mathlib:CompHaus; mathlib:CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet; EnhancedDerivedSheaves:E1/enhanced-derived-category; EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent
Source: Scholze-condensed, Theorems 3.2–3.3, pp.20–23
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/condensed-epis-and-colimits
OMITTED signature: TauCeti.Blueprint.VStack.CondensedQCQS.colimits
Contract: For a profinite condensed set S, evaluation at S commutes with filtered colimits because compact Hom and finite sheaf limits do. A condensed-set morphism surjective as a sheaf is an effective epimorphism. Filtered colimits of qcqs condensed sets along injections with quasicompact transition maps are quasiseparated. For quasiseparated X and profinite S, a morphism S→X is determined by its values on points; quasiseparated subobjects retain this point-detection property.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/qcqs-condensed-sets; mathlib:CondensedSet; mathlib:CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet
Source: PQ26, Appendix A, Lemmas A.1–A.2,A.5–A.7, pp.88–90
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/condensed-lca-rhom
OMITTED signature: TauCeti.Blueprint.VStack.CondensedLCA.rhom
Contract: For any compact Hausdorff abelian group A, RHom(A,R)=0 in condensed groups. For a discrete abelian group M and a set I, RHom(product_I(R/Z),M)≃directSum_I M[-1]. In particular RHom(R,Z)=0 and RHom(product_I Z,Z)≃directSum_I Z, via 0→product Z→product R→product(R/Z)→0. These are condensed derived Hom statements, not ordinary abstract-group Hom computations.
Gaps: VStackSheavesAndLisseCategories/G-topology; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/breen-deligne-resolution; VStackSheavesAndLisseCategories:VS2/condensed-cohomology; EnhancedDerivedSheaves:E1/enhanced-derived-category
Source: Scholze-condensed, Theorem 4.3; Corollary 4.8; Proposition 5.7 proof, pp.24–28,35
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/constructible-and-geometric-langlands-embedding
OMITTED signature: TauCeti.Blueprint.VStack.SolidSheaf.constructibleEmbedding
Contract: For the analytification diamond X of a separated finite-type C-scheme over an algebraically closed nonarchimedean C and ell≠p, algebraic Verdier duality followed by solid duality yields a fully faithful covariant embedding D_c^b(X_alg,Z_ell)→D_ULA(X/Spa C,Z_ell)→D_solid(X,Z_ell). Its image consists of compact bounded objects with finitely presented solid cohomology, so it extends to Ind D_c^b(X_alg,Z_ell). The map sends i_*Z_ell at a C-point to i♯Z_ell and intertwines algebraic exceptional pullback with solid ordinary pullback. Thus the inverse limit of these scheme categories over finite-type charts X_alg→Y, with exceptional transition maps, embeds into D_solid(Y◇,Z_ell) as in Example VII.5.1(b), using separated charts and descent. Torsion analogues require finite Tor amplitude over Z/ell^m for the compact-image/Ind assertion; arbitrary bounded constructible torsion complexes are not asserted compact.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons; VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality; EnhancedDerivedSheaves:E5:presentability/ind-completion; VStackSheavesAndLisseCategories:VS1/ula-analytification; EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality; EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms
Source: FS-geometrization, Example VII.5.1(a)–(b), pp.264–265
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/derived-solid-tensor
OMITTED signature: TauCeti.Blueprint.VStack.SolidTensor
Contract: There is a unique closed symmetric monoidal tensor on SolidAb making L symmetric monoidal, and a compatible colimit-preserving derived solid tensor on D(SolidAb). The internal derived Hom is characterized by the tensor-Hom adjunction and maps into the ambient condensed derived Hom. Integer products satisfy (product_I Z)⊗solid(product_J Z)≃product_(I×J) Z, including the derived comparison. The unit is discrete Z; derived solidification is monoidal.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solidification; EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category; EnhancedDerivedSheaves:E1/presentability-and-derived-tensor
OMITTED API: TauCeti.Blueprint.VStack.SolidTensor.tensor (constructor)
Solid tensor is the solidification of ambient condensed tensor; the derived tensor uses its left derived form.
OMITTED API: TauCeti.Blueprint.VStack.SolidTensor.unit (data)
The integer-solid Z is the tensor unit.
OMITTED API: TauCeti.Blueprint.VStack.SolidTensor.product (simp)
Tensor of integer products is the product on the Cartesian index set.
OMITTED API: TauCeti.Blueprint.VStack.SolidTensor.hom (universal-property)
Map(A⊗solid B,C)≃Map(A,RHomsolid(B,C)).
OMITTED API: TauCeti.Blueprint.VStack.SolidTensor.changeCoefficients (functoriality)
Solid algebra scalar extension is derived solid tensor, with coherent identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.SolidTensor.inclusionHom (compatibility)
The derived internal Hom into a solid target agrees with the ambient condensed Hom in the source’s solid setting.
OMITTED example: TauCeti.Blueprint.VStack.SolidTensor.zero (degenerate)
Zero tensored with any solid complex is zero.
OMITTED example: TauCeti.Blueprint.VStack.SolidTensor.unit_test (computation)
Z⊗solid A≃A with the unit constraints.
OMITTED example: TauCeti.Blueprint.VStack.SolidTensor.different_primes (non-example)
For p≠ell, Z_p⊗solid Z_ell=0, distinguishing solid tensor from a naive algebraic tensor.
Source: Scholze-condensed, Theorem 6.2; Proposition 6.3; Examples 6.4, pp.43–44
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/general-ring-solidity
Typed ordinary signature: TauCeti.Blueprint.VStack.IsSolidGeneral
Contract: For an ordinary ring R and condensed R-module M, define corrected solidity by requiring that for every ring map Z[X]→R, restriction of M to Z[X] satisfies the pinned finite-type integer-algebra Hom-inversion predicate. Equivalently test every r∈R with X sent to r. For R finitely generated over Z it agrees with the finite-type predicate. It is not the naive all-R profiniteSolid Hom-inversion predicate, and it is not a definition of an analytic structure for arbitrary condensed rings.
Gaps: VStackSheavesAndLisseCategories/G-cutoffs
Direct inputs: mathlib:CondensedMod; mathlib:CondensedMod.IsSolid; mathlib:ModuleCat.restrictScalars; mathlib:CategoryTheory.sheafCompose; SolidAnalyticRings:SA.2; SolidAnalyticRings:SA.3
Typed API: TauCeti.Blueprint.VStack.condensedRestrict (constructor)
Restriction along R→S acts sectionwise and gives CondensedMod S→CondensedMod R.
Typed API: TauCeti.Blueprint.VStack.IsSolidGeneral.iff (characterisation)
Corrected solidity is exactly the stated universal polynomial restriction criterion.
Typed API: TauCeti.Blueprint.VStack.IsSolidGeneral.restrict (functoriality)
Restriction along a ring homomorphism preserves corrected solidity, by composing polynomial test maps.
Typed API: TauCeti.Blueprint.VStack.IsSolidGeneral.iso (compatibility)
An isomorphism of condensed R-modules preserves the criterion.
Typed API: TauCeti.Blueprint.VStack.IsSolidGeneral.finiteType (compatibility)
For finite-type Z-algebra R the corrected predicate agrees with the pinned finite-type predicate.
Typed example: TauCeti.Blueprint.VStack.IsSolidGeneral.integer (compatibility)
For the universe-lifted integers the corrected predicate is equivalent to pinned integer solidity.
Typed example: TauCeti.Blueprint.VStack.IsSolidGeneral.zero (degenerate)
The zero condensed module satisfies every polynomial restriction test.
Typed example: TauCeti.Blueprint.VStack.IsSolidGeneral.polynomial (characterisation)
For R=Z[X], the identity ring map is one of the tests, so corrected solidity implies its pinned polynomial solidity.
Source: Scholze-condensed, Lecture VII, Definition 7.1 footnote 14; Mathlib Condensed/Solid TODO, pp.45–47
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/nonarchimedean-solid-coefficients
OMITTED signature: TauCeti.Blueprint.VStack.SolidECoefficients
Contract: For a nonarchimedean local field E over Q_p with its p-adic condensed topology, use its standard analytic solid structure E_solid[S]=E⊗solid_Z Z[S]_solid. Mod_E^solid is the analytic complete category; it is abelian with closed solid tensor, internal derived Hom and scalar extension. This is the common coefficient foundation, distinct from taking the same E as a discrete ring with underlying-Z solidity. The comparison with classical locally convex spaces is supplied by its functional-analysis consumer.
Gaps: VStackSheavesAndLisseCategories/G-cutoffs; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: SolidAnalyticRings:SA.2; VStackSheavesAndLisseCategories:VS2/derived-solid-tensor; SolidAnalyticRings:SA.4
OMITTED API: TauCeti.Blueprint.VStack.SolidECoefficients.category (constructor)
The category is the analytic complete modules for topological E.
OMITTED API: TauCeti.Blueprint.VStack.SolidECoefficients.free (data)
Its free solid object on S is E⊗solid_Z Z[S]_solid.
OMITTED API: TauCeti.Blueprint.VStack.SolidECoefficients.tensorHom (universal-property)
Derived tensor and internal Hom satisfy the closed adjunction.
OMITTED API: TauCeti.Blueprint.VStack.SolidECoefficients.scalarExtension (functoriality)
Analytic coefficient extension along a continuous field embedding uses derived complete tensor with coherent identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.SolidECoefficients.topological (compatibility)
The underlying coefficient object is the condensed module for the p-adic topology of E; its inclusion respects the imported analytic measures. The classical locally convex comparison is an outgoing application.
OMITTED example: TauCeti.Blueprint.VStack.SolidECoefficients.zero (degenerate)
The zero topological vector space realizes the zero solid E-module.
OMITTED example: TauCeti.Blueprint.VStack.SolidECoefficients.finite (computation)
For finite S, the free object is E^S.
OMITTED example: TauCeti.Blueprint.VStack.SolidECoefficients.smith (non-example)
For an infinite product, (product_I O_E)[1/p] consists of uniformly bounded denominators and differs from arbitrary product_I E; omitting analytic measures gives the wrong Smith generator.
Source: BCGP25, §2.2.1, pp.18–20, solid E-vector spaces
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/principal-localization-and-formal-complement
OMITTED signature: TauCeti.Blueprint.VStack.ZSolidAnalytification.formalComplement
Contract: For a discrete commutative A and f∈A, AnSpec(A[1/f],Mod_Zsolid(A[1/f]))→AnSpec(A,Mod_Zsolid(A)) is proper and behaves as a closed immersion in the analytic-stack formalism. Its open complement has module category the derived f-complete subcategory, characterized by lim_(multiplication by f) M=0. The latter limit is derived. For SL₂ over discrete E, the closed-cell analytic coefficient ring is E[[T⁻¹]] with derived T⁻¹-complete modules, whereas the big cell uses E[T] with underlying-Z solid modules.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/z-solid-analytification; EnhancedDerivedSheaves:E4/derived-complete-sheaves; AnalyticStacks:AS.2; AnalyticStacks:AS.3
Source: BCGP25, Remark 2.4.1; Examples 2.4.2–2.4.3, p.31
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/proper-smooth-solid-poincare
OMITTED signature: TauCeti.Blueprint.VStack.SolidHomology.poincare
Contract: For f:Y→X proper, representable in spatial diamonds, finite transcendence dimension and cohomologically smooth, Rf* has finite cohomological dimension, commutes with sums and satisfies the solid projection formula. It commutes with arbitrary base-change homology as in VII.3.4. If Δ is the relative diagonal and π₁ the first projection, Rπ₁*Δ♯Λ is invertible with inverse f!Λ=lim_n f!Z/n⊗solid_Zhat^p Λ. Consequently f♯A≃Rf*(A⊗solid f!Λ). All these conclusions retain both properness and smoothness.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/relative-solid-homology; VStackSheavesAndLisseCategories:VS2/solid-sheaf-structure-and-completion; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
Source: FS-geometrization, Propositions VII.3.2–VII.3.5, pp.258–261
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/qcqs-condensed-sets
Typed ordinary signature: TauCeti.Blueprint.VStack.CondensedQCQS
Contract: A condensed set X is quasicompact when it admits an epimorphism from a profinite condensed set. It is quasiseparated when its diagonal is quasicompact: for maps S,T→X from profinite sets, S×X T is quasicompact. A map is quasicompact when every pullback to a profinite set is quasicompact. These are site-theoretic definitions on the pinned CondensedSet, not replacements by properties of the abstract set X(point).
Gaps: VStackSheavesAndLisseCategories/G-cutoffs
Direct inputs: mathlib:CondensedSet; mathlib:Profinite; mathlib:CondensedSet.fullyFaithfulCompactlyGeneratedToCondensedSet; mathlib:profiniteToCondensed; mathlib:TopCat.toCondensedSet
Typed API: TauCeti.Blueprint.VStack.CondensedQCQS.quasicompact (characterisation)
Quasicompactness is existence of a profinite epimorphic cover.
Typed API: TauCeti.Blueprint.VStack.CondensedQCQS.quasiseparated (characterisation)
The diagonal condition is equivalent to quasicompact profinite-source fibre products.
Typed API: TauCeti.Blueprint.VStack.CondensedQCQS.baseChange (functoriality)
Quasicompact maps are preserved by base change.
Typed API: TauCeti.Blueprint.VStack.CondensedQCQS.subobject (compatibility)
A condensed subobject of a quasiseparated condensed set is quasiseparated.
Typed API: TauCeti.Blueprint.VStack.CondensedQCQS.profinite (compatibility)
The pinned profinite realization satisfies both properties.
Typed example: TauCeti.Blueprint.VStack.CondensedQCQS.empty (degenerate)
The empty condensed set is qcqs.
Typed example: TauCeti.Blueprint.VStack.CondensedQCQS.profinite_test (compatibility)
Every profinite set has the identity profinite cover and qc diagonal.
Typed example: TauCeti.Blueprint.VStack.CondensedQCQS.infiniteDiscrete (non-example)
An infinite discrete set is quasiseparated but is not quasicompact, since a continuous image of a compact set in a discrete set is finite.
Source: PQ26, Appendix A, definitions preceding Lemmas A.3–A.4, pp.89–90
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/relative-solid-homology
OMITTED signature: TauCeti.Blueprint.VStack.SolidHomology
Contract: For every map f:Y→X of small v-stacks, solid pullback has a left adjoint f♯. It satisfies arbitrary Cartesian base change, coherent composition and the projection formula f♯(A⊗solid f*B)≃f♯A⊗solid B. Restriction and extension of algebra coefficients have the corresponding adjoint-compatible comparisons. This homology exists for all small-v-stack maps; it is a different construction from the original eligible torsion exceptional pushforward.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-four-operations; EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.functor (constructor)
Construct f♯ for every map of small v-stacks.
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.adjunction (universal-property)
Map(f♯A,B)≃Map(A,f*B).
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.id (simp)
Identity homology is identity.
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.comp (functoriality)
(fg)♯≃f♯g♯ with coherent associativity.
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.baseChange (compatibility)
Cartesian base change gives g*f♯≃f′♯g′*.
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.projection (compatibility)
f♯(A⊗solid f*B)≃f♯A⊗solid B.
OMITTED API: TauCeti.Blueprint.VStack.SolidHomology.coefficients (compatibility)
Derived solid coefficient extension intertwines f♯, with restriction comparisons given by adjunction.
OMITTED example: TauCeti.Blueprint.VStack.SolidHomology.empty (degenerate)
Homology from the empty stack is the zero functor.
OMITTED example: TauCeti.Blueprint.VStack.SolidHomology.identity (computation)
Identity homology and its adjunction recover identity.
OMITTED example: TauCeti.Blueprint.VStack.SolidHomology.etale (compatibility)
For separated étale maps the torsion comparison gives the existing extension-by-zero functor.
Source: FS-geometrization, Proposition VII.3.1, pp.257–258
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-abelian-groups
Typed ordinary signature: TauCeti.Blueprint.VStack.SolidAb
Contract: SolidAb is the full subcategory of the pinned CondensedAb on the existing integer predicate CondensedMod.IsSolid. Its inclusion is fully faithful and creates kernels, cokernels, all small limits and colimits; the subcategory is closed under extensions and is abelian. Products of copies of the discrete integers form compact projective generators of this category. This adds the category and structure theorem, not a second integer solidity predicate.
Gaps: VStackSheavesAndLisseCategories/G-cutoffs; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: mathlib:CondensedAb; mathlib:CondensedMod.IsSolid; mathlib:CategoryTheory.ObjectProperty.FullSubcategory; mathlib:CategoryTheory.ObjectProperty.ι; VStackSheavesAndLisseCategories:VS2/solid-free-structure; VStackSheavesAndLisseCategories:VS2/condensed-lca-rhom
Typed API: TauCeti.Blueprint.VStack.SolidAb.mk (constructor)
An existing integer-solid condensed abelian group defines an object of SolidAb.
Typed API: TauCeti.Blueprint.VStack.SolidAb.underlying (projection)
An object has its actual condensed group and proof of integer solidity.
Typed API: TauCeti.Blueprint.VStack.SolidAb.hom_ext (extensionality)
Maps agree iff their underlying condensed-group maps agree.
Typed API: TauCeti.Blueprint.VStack.SolidAb.inclusionFullyFaithful (compatibility)
The inclusion is fully faithful on the induced Hom groups.
Typed API: TauCeti.Blueprint.VStack.SolidAb.abelian (instance)
SolidAb is abelian, and its inclusion creates kernels and cokernels.
Typed API: TauCeti.Blueprint.VStack.SolidAb.limits (structure)
All small limits and colimits exist and are created by the inclusion.
Typed API: TauCeti.Blueprint.VStack.SolidAb.extensions (other)
In a short exact sequence in CondensedAb with solid end terms, the middle term is solid.
OMITTED API: TauCeti.Blueprint.VStack.SolidAb.generators (characterisation)
The integer products form compact projective generators in SolidAb.
Typed example: TauCeti.Blueprint.VStack.SolidAb.zero (degenerate)
The zero condensed group is integer-solid and gives the zero object of SolidAb.
Typed example: TauCeti.Blueprint.VStack.SolidAb.freeProfinite (compatibility)
The pinned integer profiniteSolid object is solid for every profinite set and lies in this category.
Typed example: TauCeti.Blueprint.VStack.SolidAb.finiteSet (computation)
For a finite profinite set S, the pinned solidification map Z[S]→Z[S]_solid is an isomorphism, hence the two free objects agree.
Source: Scholze-condensed, Theorem 5.8(i); proof in Lecture VI, pp.35–41
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-four-operations
OMITTED signature: TauCeti.Blueprint.VStack.SolidOperations
Contract: For every map f:Y→X of small v-stacks and solid Zhat^p-algebra Λ, f*, Rf*, closed derived solid tensor and internal RHom preserve the respective solid categories. Solid tensor is the solidification of ambient derived tensor. Internal Hom is already solid; pullback preserves it and tensor, and commutes with Rf* in arbitrary Cartesian base change in the solid formalism. The formalism is constructed at adequate compatible cutoffs. Properness alone does not give the pushforward projection formula.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-sheaf-structure-and-completion; VStackSheavesAndLisseCategories:VS2/derived-solid-tensor; EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations; EnhancedDerivedSheaves:E3/mates-and-beck-chevalley
OMITTED API: TauCeti.Blueprint.VStack.SolidOperations.pullback (functoriality)
All small-v-stack maps have coherent solid pullbacks, respecting identity and composition.
OMITTED API: TauCeti.Blueprint.VStack.SolidOperations.pushforward (universal-property)
Rf* is right adjoint to f*.
OMITTED API: TauCeti.Blueprint.VStack.SolidOperations.tensor (structure)
Relative derived solid tensor is closed symmetric monoidal.
OMITTED API: TauCeti.Blueprint.VStack.SolidOperations.hom (universal-property)
Map(A⊗solid B,C)≃Map(A,RHom(B,C)).
OMITTED API: TauCeti.Blueprint.VStack.SolidOperations.baseChange (compatibility)
For every Cartesian square g*Rf*≃Rf′*g′* in the solid formalism.
OMITTED API: TauCeti.Blueprint.VStack.SolidOperations.homPullback (compatibility)
g*RHom(A,B)≃RHom(g*A,g*B).
OMITTED example: TauCeti.Blueprint.VStack.SolidOperations.identity (degenerate)
Identity pullback and pushforward are identity.
OMITTED example: TauCeti.Blueprint.VStack.SolidOperations.point (compatibility)
On a point solid tensor agrees with the condensed solid tensor.
OMITTED example: TauCeti.Blueprint.VStack.SolidOperations.properProjectionFailure (non-example)
For the closed point in the open unit ball, the proper pushforward is not generally a module-linear projection-formula functor; VII.2.5 gives Zhat^p[-2] in the calculation.
Source: FS-geometrization, Propositions VII.2.1–VII.2.4; Warning VII.2.5, pp.252–254
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-free-structure
OMITTED signature: TauCeti.Blueprint.VStack.SolidAb.freeStructure
Contract: For profinite S, the pinned Z[S]_solid is Hom(C(S,Z),Z), hence a product of copies of Z by Nöbeling’s theorem already in Mathlib. It is solid as a condensed group and as a complex. A profinite hypercover gives an exact augmented complex of these free solid objects. The pinned solidification map is an isomorphism for finite S.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: mathlib:Condensed.profiniteSolid; mathlib:Condensed.profiniteSolidification; mathlib:LocallyConstant.freeOfProfinite; VStackSheavesAndLisseCategories:VS2/condensed-cohomology; VStackSheavesAndLisseCategories:VS2/condensed-lca-rhom
Source: Scholze-condensed, Corollary 5.5; Propositions 5.6–5.7, pp.34–35
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change-and-drinfeld
OMITTED signature: TauCeti.Blueprint.VStack.SolidSheaf.drinfeld
Contract: Solid pullback is fully faithful after extension of algebraically closed discrete characteristic-p fields; after base change from such k to Spa(C,C⁺); and after surjective algebraically closed valued-field extension with compatible open bounded valuation rings. Hence ψ_X* from X×[*/W_E] to X×Div¹ is fully faithful for every small v-stack X, and is an equivalence if D_solid(X)→D_solid(X×Spd Ebar) is an equivalence. For finite I the product ψ_X^I* is fully faithful.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-four-operations; VStackSheavesAndLisseCategories:VS2/solid-sheaf-structure-and-completion; VStackSheavesAndLisseCategories:VS1/divisor-weil-map; VStackSheavesAndLisseCategories:VS1/drinfeld-pullback; VStackSheavesAndLisseCategories:VS1/geometric-divisor-finite-etale
Source: FS-geometrization, Proposition VII.2.6; Corollaries VII.2.7–VII.2.8, pp.255–256
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-partial-support
OMITTED signature: TauCeti.Blueprint.VStack.SolidPartialSupport
Contract: In the VII.2.9 setup, X is spatial proper over Spd k for algebraically closed characteristic-p k and has finite transcendence dimension; S is spatial. The IV.5 annular systems define Rβ_!+=colim_a Rβ_*j_a! and Rβ_!−=colim_b Rβ_*j_b!, now in solid coefficients, with j_! the left adjoint to open pullback. These are independent of cofinal annular presentations with their two specified ends.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS0/partial-compact-support; VStackSheavesAndLisseCategories:VS2/solid-four-operations; VStackSheavesAndLisseCategories:VS2/relative-solid-homology
OMITTED API: TauCeti.Blueprint.VStack.SolidPartialSupport.plus (constructor)
The plus end is the a-indexed supported pushforward colimit.
OMITTED API: TauCeti.Blueprint.VStack.SolidPartialSupport.minus (constructor)
The minus end is the b-indexed supported pushforward colimit.
OMITTED API: TauCeti.Blueprint.VStack.SolidPartialSupport.transition (data)
Annular inclusions give the specified extension-by-zero counit transitions.
OMITTED API: TauCeti.Blueprint.VStack.SolidPartialSupport.cofinal (compatibility)
Cofinal replacements induce canonical equivalences.
OMITTED API: TauCeti.Blueprint.VStack.SolidPartialSupport.baseChange (functoriality)
The solid supported colimits commute with the permitted base changes of this setup.
OMITTED example: TauCeti.Blueprint.VStack.SolidPartialSupport.zero (degenerate)
Both end functors send zero to zero.
OMITTED example: TauCeti.Blueprint.VStack.SolidPartialSupport.empty (computation)
If X is empty both functors are zero.
OMITTED example: TauCeti.Blueprint.VStack.SolidPartialSupport.torsion (compatibility)
On torsion pullback coefficients the resulting vanishing agrees with IV.5 after the solid comparison.
Source: FS-geometrization, Definition VII.2.9, p.256
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-partial-supported-vanishing
OMITTED signature: TauCeti.Blueprint.VStack.SolidPartialSupport.vanish
Contract: Under the proper finite-dimensional spatial X and spatial S hypotheses of VII.2.9, let α:X×k S→X and C=α*A. If A is bounded below, or X→Spd k is cohomologically smooth, then Rβ_!+C=0=Rβ_!−C in solid coefficients. This is the restricted solid theorem: it does not claim IV.5.3’s arbitrary exterior-product input for all solid complexes.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-partial-support; VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing; VStackSheavesAndLisseCategories:VS2/solid-sheaf-structure-and-completion; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
Source: FS-geometrization, Theorem VII.2.10, pp.256–257
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-sheaf-structure-and-completion
OMITTED signature: TauCeti.Blueprint.VStack.SolidSheaf.structure
Contract: On spatial X solid Zhat-sheaves form an abelian full subcategory closed under all limits, colimits and extensions. Its finitely presented objects are exactly cofiltered limits of constructible torsion étale sheaves, forming their Pro-category; all solid sheaves form its Ind-category. Higher inverse limits of those torsion constructible systems vanish. Derived solidity is the derived Hom extension criterion; the derived inclusion is fully faithful and admits solidification with tensor-ideal kernel. Cutoffs supply the compatible presentable categories, without global presentability of the unrestricted site.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks; VStackSheavesAndLisseCategories:VS2/breen-deligne-resolution; VStackSheavesAndLisseCategories:VS2/solidification; EnhancedDerivedSheaves:E5:presentability/ind-completion; EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations; DiamondsAndVStacks:D6/etale-site-comparison
Source: FS-geometrization, Theorem VII.1.3; Proposition VII.1.6; Propositions VII.1.12–VII.1.15, pp.245–252
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solid-sheaves-on-v-stacks
OMITTED signature: TauCeti.Blueprint.VStack.SolidSheaf
Contract: On spatial X and j:U→X a cofiltered limit of qcqs étale j_i, put j♯ Zhat=lim_i j_i! Zhat, with its tautological section on U. A pro-étale Zhat-sheaf F is solid when Hom(j♯ Zhat,F)→F(U) is an isomorphism for every such j. On a small v-stack solidity is this property after every spatial v-chart. D_solid(X,Zhat^p) is the full enhanced derived subcategory with solid cohomology; for an algebra object Λ it is the module category with solid underlying Zhat^p-complex. It is not the naive analytic Λ-solid category for arbitrary Λ.
Gaps: VStackSheavesAndLisseCategories/G-cutoffs; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-abelian-groups; VStackSheavesAndLisseCategories:VS2/breen-deligne-resolution; DiamondsAndVStacks:D6/etale-site-comparison; EnhancedDerivedSheaves:E1/enhanced-derived-category; EnhancedDerivedSheaves:E5:abstract/module-objects
OMITTED API: TauCeti.Blueprint.VStack.SolidSheaf.free (constructor)
A qcqs pro-étale chart gives j♯ Zhat and a tautological section.
OMITTED API: TauCeti.Blueprint.VStack.SolidSheaf.criterion (characterisation)
Sections extend uniquely to Hom from every free solid chart object.
OMITTED API: TauCeti.Blueprint.VStack.SolidSheaf.vLocal (compatibility)
Solidity can be checked on a spatial v-cover.
OMITTED API: TauCeti.Blueprint.VStack.SolidSheaf.derived (structure)
Derived solidity is equivalent to solidity of all cohomology sheaves.
OMITTED API: TauCeti.Blueprint.VStack.SolidSheaf.modules (constructor)
For Λ an algebra object, coefficients are Λ-module objects with solid underlying Zhat^p-complex.
OMITTED API: TauCeti.Blueprint.VStack.SolidSheaf.point (compatibility)
On a geometric point the construction agrees with condensed solid modules in this coefficient convention.
OMITTED example: TauCeti.Blueprint.VStack.SolidSheaf.zero (degenerate)
The zero sheaf meets every extension test.
OMITTED example: TauCeti.Blueprint.VStack.SolidSheaf.torsion (compatibility)
Every étale Z/n-sheaf with n prime to p gives a solid sheaf.
OMITTED example: TauCeti.Blueprint.VStack.SolidSheaf.etaleChart (computation)
For a single qcqs étale j the free object is j! Zhat and the extension criterion reduces to the usual section adjunction.
Source: FS-geometrization, Definitions VII.1.1,VII.1.9–VII.1.10,VII.1.17; Remark VII.1.18, pp.245,249–252
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/solidification
Typed ordinary signature: TauCeti.Blueprint.VStack.solidification
Contract: The inclusion SolidAb→CondensedAb has a left adjoint L, the unique colimit-preserving extension of the pinned Z[S]→Z[S]_solid on the profinite compact-projective generators. The unit induces Hom(LA,B)≃Hom(A,iB) for every solid B; its counit is an isomorphism. The derived inclusion D(SolidAb)→D(CondensedAb) is fully faithful, with image the complexes having solid cohomology, and its left adjoint is the left derived solidification L^L. Derived solidification need not be concentrated in degree zero.
Gaps: VStackSheavesAndLisseCategories/G-cutoffs; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-abelian-groups; VStackSheavesAndLisseCategories:VS2/solid-free-structure; mathlib:CategoryTheory.Adjunction; mathlib:DerivedCategory; EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations
Typed API: TauCeti.Blueprint.VStack.solidification (constructor)
The reflection functor L:CondensedAb→SolidAb.
Typed API: TauCeti.Blueprint.VStack.solidificationAdjunction (universal-property)
L is left adjoint to the actual full-subcategory inclusion.
Typed API: TauCeti.Blueprint.VStack.solidification_unit (data)
The unit A→iLA is universal for maps to solid objects.
Typed API: TauCeti.Blueprint.VStack.solidification_homEquiv (characterisation)
Composition with the unit bijects Hom(LA,B) and Hom(A,iB).
Typed API: TauCeti.Blueprint.VStack.solidification_counit (compatibility)
The counit LiB→B is an isomorphism for solid B.
Typed API: TauCeti.Blueprint.VStack.solidification_free (simp)
On a profinite free group, iLZ[S] is canonically Z[S]_solid and its unit is the pinned solidification map.
OMITTED API: TauCeti.Blueprint.VStack.solidification_derived (compatibility)
The derived reflection has image characterized by solid cohomology and agrees with left derived L.
Typed example: TauCeti.Blueprint.VStack.solidification_zero (degenerate)
Solidification sends the zero condensed group to a zero solid group.
Typed example: TauCeti.Blueprint.VStack.solidification_solid (characterisation)
The unit of an integer-solid group is an isomorphism.
Typed example: TauCeti.Blueprint.VStack.solidification_finite (computation)
The unit of the free condensed group on a finite profinite set is an isomorphism.
Source: Scholze-condensed, Theorem 5.8; Lemmas 5.9–5.10; Theorem 6.2, pp.35–38,43
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons
OMITTED signature: TauCeti.Blueprint.VStack.SolidSheaf.torsionComparison
Contract: For Λ=Z/n with n prime to p, the naive D_et(X,Λ)→D_solid(X,Λ) is fully faithful, monoidal and pullback-compatible, with right adjoint R_Xet. It matches Rf* for qcqs f on bounded-below objects, or qcqs f of finite cohomological dimension. On overconvergent objects the solid dual A∨=RHom_solid(A,Λ) gives a fully faithful t-exact contravariant embedding with solid biduality and pullback compatibility. Its tensor comparison is an equivalence when one input has finite Tor amplitude. For proper spatial finite-dimensional f, (Rf*A)∨≃f♯A∨ on the overconvergent range.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-four-operations; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; VStackSheavesAndLisseCategories:VS2/breen-deligne-resolution; VStackSheavesAndLisseCategories:VS1/perfect-rhom-and-la-characterisation; DiamondSixOperations:S2/lower-shriek; DiamondSixOperations:S2/lower-shriek-base-change; DiamondSixOperations:S2/projection-formula
Source: FS-geometrization, VII.4.1; Propositions VII.4.1–VII.4.3, pp.261–264
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS2/z-solid-analytification
OMITTED signature: TauCeti.Blueprint.VStack.ZSolidAnalytification
Contract: For a discrete commutative ring A, let Mod_Zsolid(A) be condensed A-modules whose underlying condensed integer group is solid. The affine analytic stack is AnSpec(A,Mod_Zsolid(A)); affine Zariski gluing defines X↦X_tilde for schemes. The associated module category is enhanced D(Mod_Zsolid(A)). The AnSpec and !-topology/gluing constructions are imported from AnalyticStacks AS.2–AS.3. This node specializes them to the Z-solid analytic structure; the comparison of regular-cutoff and light analytic coefficient models is an explicit interface gap.
Gaps: VStackSheavesAndLisseCategories/G-cutoffs; VStackSheavesAndLisseCategories/G-prototype-VS2
Direct inputs: VStackSheavesAndLisseCategories:VS2/solid-abelian-groups; VStackSheavesAndLisseCategories:VS2/derived-solid-tensor; EnhancedDerivedSheaves:E5:abstract/module-objects; EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi; SolidAnalyticRings:SA.2; AnalyticStacks:AS.2; AnalyticStacks:AS.3
OMITTED API: TauCeti.Blueprint.VStack.ZSolidAnalytification.modules (constructor)
Construct the actual full subcategory of condensed A-modules with underlying integer solidity.
OMITTED API: TauCeti.Blueprint.VStack.ZSolidAnalytification.affine (constructor)
AnSpec uses the pair (A,Mod_Zsolid(A)), including its analytic module data.
OMITTED API: TauCeti.Blueprint.VStack.ZSolidAnalytification.glue (functoriality)
Affine Zariski gluing yields the scheme functor and coherent morphism composition.
OMITTED API: TauCeti.Blueprint.VStack.ZSolidAnalytification.pullback (compatibility)
Module pullback is the derived Z-solid scalar extension.
OMITTED API: TauCeti.Blueprint.VStack.ZSolidAnalytification.affineCategory (equivalence)
Quasi-coherent coefficients on the affine analytic stack are enhanced D(Mod_Zsolid(A)).
OMITTED example: TauCeti.Blueprint.VStack.ZSolidAnalytification.integer (compatibility)
For A=Z the coefficient category is SolidAb with its actual inclusion.
OMITTED example: TauCeti.Blueprint.VStack.ZSolidAnalytification.zero (degenerate)
The zero ring has zero module category and empty analytic spectrum.
OMITTED example: TauCeti.Blueprint.VStack.ZSolidAnalytification.discreteField (non-example)
For A=E taken discretely the definition tests underlying Z-solidity; replacing A by its p-adic condensed topology changes the construction.
Source: BCGP25, Remark 2.4.1, pp.30–31
-/

/- VS3: Lisse categories and coefficients -/

/-
Packet node: VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations
OMITTED signature: TauCeti.Blueprint.VStack.LisseOperations
Contract: The full inclusion D_lis(X,Λ)→D_solid(X,Λ) has right adjoint A↦A_lis, formed by gluing the adequate cutoff adjoints. Its kernel consists of objects with zero sections on every separated representable ell-smooth chart. For lisse A,B define RHom_lis(A,B)=(RHom_solid(A,B))_lis and Rf_lis*B=(Rf*B)_lis; these are right adjoints to restricted tensor and pullback. No global presentability of D_solid is used.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS3
Direct inputs: VStackSheavesAndLisseCategories:VS3/lisse-category-definition; VStackSheavesAndLisseCategories:VS2/solid-four-operations; EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations
OMITTED API: TauCeti.Blueprint.VStack.LisseOperations.projector (constructor)
Construct the right adjoint (−)_lis of the inclusion.
OMITTED API: TauCeti.Blueprint.VStack.LisseOperations.adjunction (universal-property)
Map(iA,B)≃Map(A,B_lis).
OMITTED API: TauCeti.Blueprint.VStack.LisseOperations.counit (compatibility)
The counit iA_lis→A is an isomorphism when A is lisse.
OMITTED API: TauCeti.Blueprint.VStack.LisseOperations.kernel (characterisation)
The chart-section vanishing criterion describes the kernel.
OMITTED API: TauCeti.Blueprint.VStack.LisseOperations.internalHom (universal-property)
RHom_lis is right adjoint to the lisse tensor.
OMITTED API: TauCeti.Blueprint.VStack.LisseOperations.pushforward (universal-property)
Rf_lis* is right adjoint to lisse pullback, with coherent composition.
OMITTED example: TauCeti.Blueprint.VStack.LisseOperations.zero (degenerate)
Projection, internal Hom into zero and pushforward of zero give zero.
OMITTED example: TauCeti.Blueprint.VStack.LisseOperations.point (computation)
The point projector recovers the relatively discrete component and fixes D(Λ_disc).
OMITTED example: TauCeti.Blueprint.VStack.LisseOperations.identity (compatibility)
Identity lisse pushforward is identity with the original unit/counit.
Source: FS-geometrization, Proposition VII.6.3 and subsequent constructions, p.269
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS3/lisse-category-definition
OMITTED signature: TauCeti.Blueprint.VStack.LisseCategory
Contract: Fix ell≠p and a discrete Z_ell-algebra Λ_disc, interpreted as the condensed ring Λ=Z_ell⊗_(Z_ell,disc)Λ_disc. For an Artin v-stack X, D_lis(X,Λ) is the smallest stable full subcategory of D_solid(X,Λ) closed under all sums and containing f♯Λ for every separated representable locally spatial ell-cohomologically smooth map f:Y→X. The source Y is an Artin v-stack with the indicated representable map, not restricted by an extra absolute-diamond requirement. Lisse means this generating class, not locally constant perfect objects.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS3
Direct inputs: VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; VStackSheavesAndLisseCategories:VS2/solid-four-operations; EnhancedDerivedSheaves:E5:abstract/stable-infinity-category; AdicCoefficientsAndComparisons:L0/adic-coefficient-limit
OMITTED API: TauCeti.Blueprint.VStack.LisseCategory.generator (constructor)
Each permitted f gives the object f♯Λ of D_lis.
OMITTED API: TauCeti.Blueprint.VStack.LisseCategory.inclusion (coercion)
There is the actual full stable inclusion into D_solid.
OMITTED API: TauCeti.Blueprint.VStack.LisseCategory.localizing (characterisation)
Objects form the smallest stable sum-closed full subcategory containing these generators.
OMITTED API: TauCeti.Blueprint.VStack.LisseCategory.tensor (structure)
Solid tensor restricts to D_lis.
OMITTED API: TauCeti.Blueprint.VStack.LisseCategory.pullback (functoriality)
Every Artin-v-stack pullback preserves D_lis, coherently for identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.LisseCategory.point (compatibility)
The geometric-point category identifies with D(Λ_disc) via relative-discrete realization.
OMITTED example: TauCeti.Blueprint.VStack.LisseCategory.empty (degenerate)
The empty stack has zero lisse category.
OMITTED example: TauCeti.Blueprint.VStack.LisseCategory.point_test (compatibility)
A geometric point yields the full derived category of relatively discrete coefficients.
OMITTED example: TauCeti.Blueprint.VStack.LisseCategory.infiniteSum (non-example)
On a point an infinite direct sum of Λ is lisse and need not be perfect; replacing D_lis by D_lc would fail this test.
Source: FS-geometrization, Definition VII.6.1; Proposition VII.6.2, pp.268–269
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS3/lisse-coefficient-change
OMITTED signature: TauCeti.Blueprint.VStack.LisseCategory.coefficientChange
Contract: For a map of discrete Z_ell-algebras Λ_disc→Λ′_disc, derived solid scalar extension carries each lisse generator f♯Λ to f♯Λ′ and hence preserves D_lis, with coherent identity/composition and compatibility with pullback and homology. Reduction and rational localization use this construction. Detection by all ell-power reductions is restricted to derived ell-complete objects and uses the owner’s completion criterion; no detection is claimed for arbitrary rational objects.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS3
Direct inputs: VStackSheavesAndLisseCategories:VS3/lisse-category-definition; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; AdicCoefficientsAndComparisons:L0/reduction-detects-equivalences; AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits
Source: FS-geometrization, VII.6 coefficient convention; VII.3.1(v), pp.258,268
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS3/lisse-comparisons
OMITTED signature: TauCeti.Blueprint.VStack.LisseCategory.comparisons
Contract: For any condensed ring A with underlying A(point), derived relative-discrete extension D(A(point))→D(A) is fully faithful. For a geometric point C, D_lis(Spa C,Λ)≃D(Λ_disc). If Λ is killed by a power of ell, D_lis(X,Λ) is contained in the naive image of D_et(X,Λ). Equality requires a separated ell-smooth atlas U→X whose étale site has a basis of bounded ell-cohomological dimension. Completed torsion/adically complete comparisons use compatible reductions; rational lisse coefficients are the constructed Λ_disc[1/ell] coefficient category.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS3
Direct inputs: VStackSheavesAndLisseCategories:VS3/lisse-category-definition; VStackSheavesAndLisseCategories:VS2/torsion-solid-comparisons; VStackSheavesAndLisseCategories:VS2/completed-ula-solid-duality; VStackSheavesAndLisseCategories:VS2/proper-smooth-solid-poincare; AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category; AdicCoefficientsAndComparisons:L0/adic-coefficient-limit
Source: FS-geometrization, Propositions VII.6.4–VII.6.6, pp.269–270
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS3/lisse-point-semiorthogonal-decomposition
OMITTED signature: TauCeti.Blueprint.VStack.LisseCategory.pointDecomposition
Contract: Let X be locally spatial and Z=Spa C a representable closed geometric-point subdiamond, with C algebraically closed nonarchimedean. Assume Z is a cofiltered intersection of qcqs open neighborhoods V with RΓ(V,F_ell)≃F_ell. For j:X\Z→X, D_lis(X,Λ) has the semiorthogonal decomposition into j♯D_lis(X\Z,Λ) and D_lis(Z,Λ)≃D(Λ_disc), with the source’s localization triangle. Arbitrary solid stratifications are not asserted to have this decomposition.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS3
Direct inputs: VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations; VStackSheavesAndLisseCategories:VS3/lisse-comparisons; VStackSheavesAndLisseCategories:VS2/relative-solid-homology
Source: FS-geometrization, Proposition VII.6.7, pp.270–271
-/

/- VS4: Sheaves on Bun_G strata and compact generation -/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/classifying-stack-equivalence
OMITTED signature: TauCeti.Blueprint.VStack.ClassifyingSheaves.equivalence
Contract: For H locally pro-p and a ring Λ killed by an integer prime to p, there is a symmetric monoidal equivalence D_sm(H,Λ)≃D_et([*/H],Λ). Pullback along *→[*/H] is forgetting the action; structural pushforward is derived continuous invariants and internal RHom(−,Λ) is the imported derived smooth dual. The same category is obtained on [Spa C/H] for complete algebraically closed C/k. In particular D_et(*,Λ)=D(Λ). Smooth representation categories and their enhancement are imported from SR.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: SmoothRepresentationsOfLocalGroups:SR.0:abelian-category; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; tauceti:TauCeti.SmoothDiscreteTopRep; tauceti:TauCeti.IsSmoothDiscrete; DiamondsAndVStacks:D6/etale-site-comparison; EnhancedDerivedSheaves:E2/unbounded-hypercover-descent; DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks
Source: FS-geometrization, Theorem V.1.1; Lemmas V.1.2–V.1.3; Corollary V.1.4, pp.168–171
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects
OMITTED signature: TauCeti.Blueprint.VStack.BunCoefficients.compactGeneration
Contract: Torsion D_et(U,Λ), for locally closed U⊂Bun_G, and lisse D_lis(Bun_G,Λ) are compactly generated. An object is compact iff only finitely many HN restrictions are nonzero and every restriction is compact in D_sm(J_b(E),Λ), equivalently in the thick subcategory generated by the imported c-Ind_K Λ for open pro-p K. Torsion generators are Rf_K!f_K!Λ, and lisse generators are f_K♯Λ. The compactness proof includes finite cohomological dimension and sum preservation of the punctured chart’s solid sections.
Gaps: VStackSheavesAndLisseCategories/G-smooth-duality; VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: VStackSheavesAndLisseCategories:VS4/strict-locality-of-the-chart; VStackSheavesAndLisseCategories:VS4/hn-localization-and-geometric-invariance; VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint; VStackSheavesAndLisseCategories:VS2/solid-partial-supported-vanishing; VStackSheavesAndLisseCategories:VS2/solid-sheaf-structure-and-completion; BunGAndNewtonStrata:BG4/section-and-spatial-complement; SmoothRepresentationsOfLocalGroups:SR.2; EnhancedDerivedSheaves:E5:presentability/compact-objects; EnhancedDerivedSheaves:E5:abstract/idempotent-completion
Source: FS-geometrization, Theorem V.4.1; Proposition VII.7.4; Lemma VII.7.5, pp.177–179,273–274
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/contractibility-of-connected-banach-colmez-torsors
OMITTED signature: TauCeti.Blueprint.VStack.ClassifyingSheaves.bcInvariance
Contract: For a torsor f:S′→S under BC(E) with E everywhere strictly positive, or under BC(E[1]) with E everywhere strictly negative, torsion étale pullback f* is fully faithful. This is invariance of Hom, not essential surjectivity for every torsor. The solid/lisse homology of the connected-kernel fibres used in VII.7.1 is the tensor unit.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: VectorBundlesAndIsocrystals:VB3:general-BC/families-of-banach-colmez-spaces; VectorBundlesAndIsocrystals:VB3:general-BC/positive-slope-resolution; VStackSheavesAndLisseCategories:VS2/proper-smooth-solid-poincare; DiamondSixOperations:S4/cohomologically-smooth; DiamondSixOperations:S4/smooth-composition; DiamondSixOperations:S4/smooth-stable-under-base-change; DiamondSixOperations:S4/smooth-descent-along-smooth-surjection
Source: FS-geometrization, Proposition V.2.1; Proposition VII.7.1 proof, pp.171–172,271
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/hn-localization-and-geometric-invariance
OMITTED signature: TauCeti.Blueprint.VStack.BunCoefficients.localization
Contract: For qc open U⊂Bun_G the finite HN stratification gives a semiorthogonal decomposition of its lisse category into D_sm(J_b(E),Λ); each stratum piece uses L_b and its restriction adjunction. For arbitrary open U the Spa C-base-change functor is an equivalence, by a justified qc open exhaustion. In torsion coefficients the equivalence holds for any locally closed U as in V.2.3. The infinite stratification is expressed by these compatible exhaustions, not an unspecified infinite direct product.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint; VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks; VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change-and-drinfeld; VStackSheavesAndLisseCategories:VS3/lisse-point-semiorthogonal-decomposition; BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin; BunGAndNewtonStrata:BG4/chart-to-bun-g; DiamondSixOperations:S2/lower-shriek; DiamondSixOperations:S2/lower-shriek-base-change; DiamondSixOperations:S2/projection-formula
Source: FS-geometrization, Corollary V.2.3; Proposition VII.7.3, pp.172,273
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint
OMITTED signature: TauCeti.Blueprint.VStack.LisseStratumExtension
Contract: For i_b:Bun_G^b→Bun_G, lisse restriction has fully faithful left adjoint L_b=π_b♯q_b*, using the BG4 chart and the stratum equivalence. Its unit id→i_b*L_b is an isomorphism. The construction is the source of lisse compact generators and the lisse Bernstein–Zelevinsky pairing; it is not an unqualified ordinary torsion i_b! on all solid objects.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks; VStackSheavesAndLisseCategories:VS2/solid-partial-supported-vanishing; VStackSheavesAndLisseCategories:VS3/lisse-point-semiorthogonal-decomposition; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; BunGAndNewtonStrata:BG4/filtered-bundle-chart; BunGAndNewtonStrata:BG4/chart-to-bun-g; SmoothRepresentationsOfLocalGroups:SR.2
OMITTED API: TauCeti.Blueprint.VStack.LisseStratumExtension.functor (constructor)
Define L_b by the composite π_b♯q_b*.
OMITTED API: TauCeti.Blueprint.VStack.LisseStratumExtension.adjunction (universal-property)
Map(L_bM,A)≃Map(M,i_b*A).
OMITTED API: TauCeti.Blueprint.VStack.LisseStratumExtension.unit (simp)
i_b*L_bM≃M with the adjunction unit.
OMITTED API: TauCeti.Blueprint.VStack.LisseStratumExtension.counit (data)
L_bi_b*A→A gives the chart-based localization transformation.
OMITTED API: TauCeti.Blueprint.VStack.LisseStratumExtension.compact (compatibility)
L_b carries compact smooth representations to compact lisse objects.
OMITTED API: TauCeti.Blueprint.VStack.LisseStratumExtension.coefficients (functoriality)
Derived scalar extension commutes with L_b through homology and chart pullback.
OMITTED example: TauCeti.Blueprint.VStack.LisseStratumExtension.zero (degenerate)
L_b sends zero to zero.
OMITTED example: TauCeti.Blueprint.VStack.LisseStratumExtension.induction (computation)
For c-Ind_K Λ its image is the generator f_K♯Λ.
OMITTED example: TauCeti.Blueprint.VStack.LisseStratumExtension.basic (compatibility)
On an open basic stratum L_b agrees with lisse open extension by homology.
Source: FS-geometrization, Proposition VII.7.2, pp.272–273
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks
OMITTED signature: TauCeti.Blueprint.VStack.BunStratum.coefficients
Contract: Import Bun_G^b≃[*/tildeJ_b] and its split projection to [*/J_b(E)] with positive Banach–Colmez kernel from BG3. Pullback gives D_et(Bun_G^b,Λ)≃D_sm(J_b(E),Λ) for prime-to-p torsion coefficients. For the relative-discrete Z_ell-algebra convention of VS3 the corresponding D_lis equivalences hold, also after base change to Spa C. The connected kernel is retained in the geometry; its sheaf invariance is proved here rather than replacing the nonbasic stack by a locally profinite classifying stack.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: VStackSheavesAndLisseCategories:VS4/classifying-stack-equivalence; VStackSheavesAndLisseCategories:VS4/contractibility-of-connected-banach-colmez-torsors; VStackSheavesAndLisseCategories:VS3/lisse-comparisons; VStackSheavesAndLisseCategories:VS2/solid-geometric-base-change-and-drinfeld; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; BunGAndNewtonStrata:BG3/stratum-is-classifying-stack; BunGAndNewtonStrata:BG3/full-automorphism-v-group; BunGAndNewtonStrata:BG3/positive-automorphism-kernel; SmoothRepresentationsOfLocalGroups:SR.2
Source: FS-geometrization, Proposition V.2.2; Proposition VII.7.1, pp.172,271–272
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS4/strict-locality-of-the-chart
OMITTED signature: TauCeti.Blueprint.VStack.BunChart.strictLocality
Contract: For the framed chart tildeM_b imported from BG4 and torsion A, RΓ(tildeM_b,A)→A_origin is an isomorphism, and sections commute with all sums. For open pro-p K⊂J_b(E), RΓ(tildeM_b/K,A)≃RΓ([*/K],A_origin), hence exact K-invariants. The punctured absolute chart is spatial finite-dimensional, while its Spa C-base-change need not be quasicompact. The localization/gluing formula identifies the boundary stalk of Rj*A with sections on the punctured chart. The formal-scheme instance of V.4.3 uses its I-adic special-fibre setup.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS4
Direct inputs: VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing; BunGAndNewtonStrata:BG4/section-and-spatial-complement; BunGAndNewtonStrata:BG4/contracting-chart-action; BunGAndNewtonStrata:BG4/chart-over-classifying-stack; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension; ClassicalAdicEtaleCohomology:H1:formal-adic-comparison
Source: FS-geometrization, Proposition V.4.2; Remarks V.4.3,V.4.5; Corollary V.4.4, pp.178–180
-/

/- VS5: Duality and admissible objects -/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/bernstein-zelevinsky-duality
OMITTED signature: TauCeti.Blueprint.VStack.TorsionBZ
Contract: For prime-to-p torsion Λ and compact A∈D_et(Bun_G,Λ), the functor B↦π♯(A⊗B) is represented by a unique compact D_BZ A through RHom(D_BZ A,B)≃π♯(A⊗B). This gives a contravariant autoequivalence on compact objects with D_BZ²≃id, preserves open support and agrees on open basic strata with the derived smooth Bernstein–Zelevinsky involution imported from SR.
Gaps: VStackSheavesAndLisseCategories/G-smooth-duality; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS5/torsion-bun-homology-and-haar-dualizing; VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects; VStackSheavesAndLisseCategories:VS4/strict-locality-of-the-chart; VStackSheavesAndLisseCategories:VS0/partial-compactly-supported-vanishing; SmoothRepresentationsOfLocalGroups:SR.2
OMITTED API: TauCeti.Blueprint.VStack.TorsionBZ.object (constructor)
Assign the compact representative D_BZ A.
OMITTED API: TauCeti.Blueprint.VStack.TorsionBZ.pairing (universal-property)
RHom(D_BZ A,B)≃π♯(A⊗B), naturally in B.
OMITTED API: TauCeti.Blueprint.VStack.TorsionBZ.map (functoriality)
A morphism A→A′ induces D_BZ A′→D_BZ A with contravariant identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.TorsionBZ.bidual (relation)
The canonical D_BZ²A→A is an equivalence.
OMITTED API: TauCeti.Blueprint.VStack.TorsionBZ.openSupport (compatibility)
Open support is preserved.
OMITTED API: TauCeti.Blueprint.VStack.TorsionBZ.basic (compatibility)
On a basic stratum this is the imported derived smooth Bernstein–Zelevinsky involution.
OMITTED example: TauCeti.Blueprint.VStack.TorsionBZ.zero (degenerate)
D_BZ of zero is zero.
OMITTED example: TauCeti.Blueprint.VStack.TorsionBZ.trivialGroup (computation)
For G=1 and perfect coefficients the representative is the ordinary derived coefficient dual.
OMITTED example: TauCeti.Blueprint.VStack.TorsionBZ.induction (compatibility)
A normalized stratum compact induction dualizes to its chart generator, as in V.5.1.
Source: FS-geometrization, Theorem V.5.1, pp.180–181
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/duality-and-admissibility-coefficient-change
OMITTED signature: TauCeti.Blueprint.VStack.BunCoefficients.dualityScalarChange
Contract: Derived scalar extension along Λ_disc→Λ′_disc commutes with compact lisse BZ duality and preserves lisse ULA/admissibility. For ULA objects the lisse internal dual comparison is an equivalence under this extension. Nonflat maps use derived tensor; faithful flat detection of perfection is asserted only in its standard derived finite/perfect descent range, with that exact supplier input requested. Hecke duality and coefficient-change formulas are exported to the already owned HS1 nodes, not reconstructed as new Hecke geometry.
Gaps: VStackSheavesAndLisseCategories/G-perfect-descent; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS3/lisse-coefficient-change; VStackSheavesAndLisseCategories:VS5/lisse-ula-equals-admissibility; VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality; SmoothRepresentationsOfLocalGroups:SR.2; EnhancedDerivedSheaves:E4/perfect-coefficient-change
Source: FS-geometrization, V.7 and VII.7 proofs on compact generators; VII.3.1(v); IX.2.2, pp.258,274–276,321–323
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality
OMITTED signature: TauCeti.Blueprint.VStack.LisseBZ
Contract: For the VS3 relative-discrete Z_ell-algebra convention and compact A∈D_lis(Bun_G,Λ), there is a unique compact D_BZ,lis A with RHom(D_BZ,lis A,B)≃π♯(A⊗solid B) for every lisse B. It is a contravariant involution on compacts, preserves open support and agrees with the imported smooth BZ duality on basic strata. This includes integral and rational coefficients.
Gaps: VStackSheavesAndLisseCategories/G-smooth-duality; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint; VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects; VStackSheavesAndLisseCategories:VS2/solid-partial-supported-vanishing; VStackSheavesAndLisseCategories:VS2/relative-solid-homology; VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations; SmoothRepresentationsOfLocalGroups:SR.2
OMITTED API: TauCeti.Blueprint.VStack.LisseBZ.object (constructor)
Assign the unique compact representative D_BZ,lis A.
OMITTED API: TauCeti.Blueprint.VStack.LisseBZ.pairing (universal-property)
RHom(D_BZ,lis A,B)≃π♯(A⊗solid B).
OMITTED API: TauCeti.Blueprint.VStack.LisseBZ.map (functoriality)
The representative is contravariantly functorial with coherent identity/composition.
OMITTED API: TauCeti.Blueprint.VStack.LisseBZ.bidual (relation)
D_BZ,lis²≃id on compact lisse objects.
OMITTED API: TauCeti.Blueprint.VStack.LisseBZ.openSupport (compatibility)
The functor preserves open support.
OMITTED API: TauCeti.Blueprint.VStack.LisseBZ.basic (compatibility)
The basic-stratum comparison is the imported smooth BZ involution.
OMITTED example: TauCeti.Blueprint.VStack.LisseBZ.zero (degenerate)
The zero compact object is fixed.
OMITTED example: TauCeti.Blueprint.VStack.LisseBZ.rationalPoint (computation)
For G=1 and Λ=Q_ell, compact objects are perfect coefficient complexes and the representative is their derived dual.
OMITTED example: TauCeti.Blueprint.VStack.LisseBZ.induction (compatibility)
The chart generator f_K♯Λ dualizes to the appropriately normalized stratum compact induction.
Source: FS-geometrization, Proposition VII.7.6, pp.274–275
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/lisse-kunneth
OMITTED signature: TauCeti.Blueprint.VStack.BunCoefficients.lisseKunneth
Contract: For reductive G₁,G₂ over E, the lisse exterior product for Bun_(G₁×G₂) carries compact pairs to compact objects that generate the lisse category. For compact A_i and arbitrary lisse B_i, RHom(A₁,B₁)⊗ᴸ_Λ RHom(A₂,B₂)≃RHom(A₁⊠A₂,B₁⊠B₂). The target is D_lis for the integral and rational range; the isolated D_et in the printed compactness sentence is a notation slip, recorded in sourceIssues.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects; VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint; VStackSheavesAndLisseCategories:VS5/torsion-kunneth; VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations; SmoothRepresentationsOfLocalGroups:SR.2
Source: FS-geometrization, Proposition VII.7.10, p.276
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/lisse-ula-definition
OMITTED signature: TauCeti.Blueprint.VStack.IsLisseBunULA
Contract: For A∈D_lis(Bun_G,Λ), define lisse ULA for Bun_G→* by invertibility of p₁*RHom_lis(A,Λ)⊗solid p₂*A→RHom_lis(p₁*A,p₂*A) on Bun_G×Bun_G. This is the explicit VII.7.8 definition in this setting; it does not presuppose a general lisse ULA notion for all Artin morphisms.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS3/lisse-category-definition; VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations; VStackSheavesAndLisseCategories:VS1/smooth-ula-criterion
OMITTED API: TauCeti.Blueprint.VStack.IsLisseBunULA.map (data)
There is the canonical dualizability comparison on the product stack.
OMITTED API: TauCeti.Blueprint.VStack.IsLisseBunULA.iff (characterisation)
The predicate means that this map is invertible.
OMITTED API: TauCeti.Blueprint.VStack.IsLisseBunULA.iso (compatibility)
The predicate is invariant under isomorphism in D_lis.
OMITTED API: TauCeti.Blueprint.VStack.IsLisseBunULA.torsion (compatibility)
In the torsion comparison range it agrees with the smooth Artin ULA tensor-Hom criterion.
OMITTED API: TauCeti.Blueprint.VStack.IsLisseBunULA.perfectConstant (constructor)
Constant sheaves of perfect Λ-complexes satisfy the criterion.
OMITTED example: TauCeti.Blueprint.VStack.IsLisseBunULA.zero (degenerate)
The zero sheaf is ULA.
OMITTED example: TauCeti.Blueprint.VStack.IsLisseBunULA.trivialGroup (computation)
For G=1, lisse ULA is perfection of a derived Λ-complex.
OMITTED example: TauCeti.Blueprint.VStack.IsLisseBunULA.infiniteVectorSpace (non-example)
For G=1 over Q_ell, an infinite direct sum of the field is lisse but not ULA.
Source: FS-geometrization, Definition VII.7.8, p.275
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/lisse-ula-equals-admissibility
OMITTED signature: TauCeti.Blueprint.VStack.BunULA.lisseAdmissibility
Contract: For A∈D_lis(Bun_G,Λ), the VII.7.8 comparison is invertible iff, on every HN stratum b, the corresponding smooth representation complex M_b has perfect derived K-invariants over Λ_disc for every open pro-p K⊂J_b(E). This applies to discrete Z_ell-algebras and their rational localizations interpreted relatively discretely.
Gaps: VStackSheavesAndLisseCategories/G-smooth-duality; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS5/lisse-ula-definition; VStackSheavesAndLisseCategories:VS5/lisse-kunneth; VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality; VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks; VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint; SmoothRepresentationsOfLocalGroups:SR.2
Source: FS-geometrization, Proposition VII.7.9, pp.275–276
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/lisse-verdier-exchange
OMITTED signature: TauCeti.Blueprint.VStack.BunVerdier.lisseExchange
Contract: For open j:V→U of open Bun_G substacks and all A∈D_lis(V,Λ), j♯RHom_lis(A,Λ)≃RHom_lis(Rj_lis*A,Λ). The ordinary opposite exchange follows from adjunction. The proof also gives the lisse reflexivity criterion: biduality is detected by the full K-invariants complexes on every HN stratum, using VII.7.7’s explicitly stated continuation of V.6.2.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS5/lisse-bernstein-zelevinsky-duality; VStackSheavesAndLisseCategories:VS3/lisse-adjoints-and-operations; VStackSheavesAndLisseCategories:VS4/hn-localization-and-geometric-invariance; VStackSheavesAndLisseCategories:VS4/lisse-stratum-left-adjoint; VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks
Source: FS-geometrization, Proposition VII.7.7 and following paragraph, p.275; V.6.2–V.6.3 proof
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/torsion-bun-homology-and-haar-dualizing
OMITTED signature: TauCeti.Blueprint.VStack.BunTorsionHomology
Contract: For π:Bun_G→*, the torsion smooth-stack operation defines π♯A=Rπ_!(A⊗π!Λ), left adjoint to π*. The dualizing object π!Λ is locally Λ[0]. Choosing Haar measures on J_b(E) for the basic strata trivializes it globally, giving π!Λ≃Λ and π♯≃Rπ_!. The homology adjunction is canonical; the displayed trivialization depends on these choices and is not an arbitrary extension of eligible ECD Rπ_!.
Gaps: VStackSheavesAndLisseCategories/G-haar; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS0/shriek-pullback-for-smooth-stacky-maps; VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects; BunGAndNewtonStrata:BG2:smooth-Artin/bun-g-is-smooth-artin; SmoothRepresentationsOfLocalGroups:SR.2
OMITTED API: TauCeti.Blueprint.VStack.BunTorsionHomology.functor (constructor)
The normalized smooth-stack homology is left adjoint to π*.
OMITTED API: TauCeti.Blueprint.VStack.BunTorsionHomology.adjunction (universal-property)
Map(π♯A,M)≃Map(A,π*M).
OMITTED API: TauCeti.Blueprint.VStack.BunTorsionHomology.dualizing (data)
π!Λ is the degree-zero invertible local system.
OMITTED API: TauCeti.Blueprint.VStack.BunTorsionHomology.haar (compatibility)
Chosen Haar measures induce the global trivialization and the comparison with Rπ_!.
OMITTED API: TauCeti.Blueprint.VStack.BunTorsionHomology.projection (compatibility)
π♯(A⊗π*M)≃π♯A⊗M in the allowed smooth-stack class.
OMITTED example: TauCeti.Blueprint.VStack.BunTorsionHomology.zero (degenerate)
Zero has zero homology.
OMITTED example: TauCeti.Blueprint.VStack.BunTorsionHomology.trivialGroup (computation)
For G=1 the Bun_G homology is identity on D(Λ).
OMITTED example: TauCeti.Blueprint.VStack.BunTorsionHomology.measureChange (characterisation)
Scaling a selected Haar measure by a unit scales the chosen trivialization; the underlying adjunction is unchanged.
Source: FS-geometrization, V.5 preceding Theorem V.5.1; footnote 3 and proof, pp.180–181
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/torsion-kunneth
OMITTED signature: TauCeti.Blueprint.VStack.BunCoefficients.torsionKunneth
Contract: For reductive G₁,G₂ over E, Bun_(G₁×G₂)=Bun_G₁×Bun_G₂. Exterior products of compact torsion objects are compact generators, and for compact A_i and arbitrary B_i, RHom(A₁,B₁)⊗ᴸ_Λ RHom(A₂,B₂)≃RHom(A₁⊠A₂,B₁⊠B₂). Consequently the Λ-linear presentable stable categorical tensor product of the two categories is D_et(Bun_(G₁×G₂),Λ), with the categorical tensor input imported from EDS.
Gaps: VStackSheavesAndLisseCategories/G-smooth-duality; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS4/compact-generation-and-compact-objects; VStackSheavesAndLisseCategories:VS4/strict-locality-of-the-chart; EnhancedDerivedSheaves:E5:presentability; BunGAndNewtonStrata:BG4/filtered-bundle-chart; SmoothRepresentationsOfLocalGroups:SR.2
Source: FS-geometrization, Proposition V.7.2; Remark V.7.3, pp.183–185
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/ula-equals-admissibility
OMITTED signature: TauCeti.Blueprint.VStack.BunULA.torsionAdmissibility
Contract: For A∈D_et(Bun_G,Λ) with prime-to-p torsion coefficients, A is ULA for Bun_G→* iff every restriction M_b has perfect derived K-invariants over Λ for every open pro-p K⊂J_b(E). This characterizes admissibility of complexes by perfection, including bounded Tor amplitude.
Gaps: VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS1/smooth-ula-criterion; VStackSheavesAndLisseCategories:VS5/torsion-kunneth; VStackSheavesAndLisseCategories:VS5/bernstein-zelevinsky-duality; VStackSheavesAndLisseCategories:VS4/strata-are-classifying-stacks; SmoothRepresentationsOfLocalGroups:SR.2
Source: FS-geometrization, Theorem V.7.1, pp.183–186
-/

/-
Packet node: VStackSheavesAndLisseCategories:VS5/verdier-biduality-and-reflexivity
OMITTED signature: TauCeti.Blueprint.VStack.BunVerdier.reflexivity
Contract: For open j:V→U between open Bun_G substacks and every torsion A∈D_et(V,Λ), j!RHom(A,Λ)≃RHom(Rj*A,Λ). With D_U=π_U!Λ, an object is Verdier-reflexive iff for every stratum b in U and every open pro-p K⊂J_b(E), the full derived K-invariants complex is reflexive in D(Λ). The biduality map is the canonical evaluation; the condition is not separate finite-dimensionality in each degree.
Gaps: VStackSheavesAndLisseCategories/G-smooth-duality; VStackSheavesAndLisseCategories/G-prototype-VS5
Direct inputs: VStackSheavesAndLisseCategories:VS5/bernstein-zelevinsky-duality; VStackSheavesAndLisseCategories:VS5/torsion-bun-homology-and-haar-dualizing; VStackSheavesAndLisseCategories:VS4/hn-localization-and-geometric-invariance; VStackSheavesAndLisseCategories:VS4/classifying-stack-equivalence; SmoothRepresentationsOfLocalGroups:SR.0:derived-extension
Source: FS-geometrization, Theorems V.6.1–V.6.2; Lemma V.6.3, pp.182–183
-/
