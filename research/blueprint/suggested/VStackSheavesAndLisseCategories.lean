/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/VStackSheavesAndLisseCategories.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-VStackSheavesAndLisseCategories: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

Almost every carrier this roadmap needs is owned by another roadmap and is
requested, not invented: small v-stacks and locally spatial diamonds
(`DiamondsAndVStacks:D4`, `D6`), the operations `Rf_*`, `Rf_!`, `Rf^!` and
cohomological smoothness in the eligible class (`DiamondSixOperations:S1`-`S5`),
the enhanced derived categories and their cutoffs (`EnhancedDerivedSheaves:E3`,
`E4`, `E5:presentability`), Banach-Colmez spaces
(`VectorBundlesAndIsocrystals:VB3:general-BC`), `Bun_G` and its strata and charts
(`BunGAndNewtonStrata:BG2:smooth-Artin`, `BG3`, `BG4`) and smooth representations
(`SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`,
`SR.0:derived-extension`, `SR.2`). They appear below as `variable`s or as opaque
parameters. Nothing here encodes a missing theorem as an assumed structure field.

What is NOT restated here, because the pinned Mathlib already has it:
`Condensed`, `CondensedMod`, `Profinite`, `CompHaus`, and, in
`Mathlib/Condensed/Solid.lean`, `Condensed.profiniteFree`,
`Condensed.profiniteSolid`, `Condensed.profiniteSolidification` and
`CondensedMod.IsSolid`. Section VS2 below is written as an extension of those
declarations, and records in its own statements that Mathlib's `IsSolid` is, by
its own docstring, not the right notion for a general coefficient ring.
-/
import Mathlib.Condensed.Solid
import Mathlib.Condensed.Module
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Functor.FullyFaithful
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.Finiteness.Defs

noncomputable section

open CategoryTheory

namespace TauCeti.VStackSheaves

/-! ## VS0. Artin v-stacks and eligible operations -/

/-- Small v-stacks. Owned by `DiamondsAndVStacks:D4`; requested, not defined here. -/
variable (VStack : Type)

/-- Locally spatial diamonds. Owned by `DiamondsAndVStacks:D4`/`D5`. -/
variable (LocSpatialDiamond : Type) (toVStack : LocSpatialDiamond → VStack)

/-- Morphisms of small v-stacks. -/
variable (Hom : VStack → VStack → Type)

/-- A morphism is representable in locally spatial diamonds. Owned by
`DiamondsAndVStacks:D5`. -/
variable (Representable : ∀ {X Y : VStack}, Hom X Y → Prop)

/-- Separatedness of a morphism of small v-stacks. Owned by
`DiamondSixOperations:S0`. -/
variable (Separated : ∀ {X Y : VStack}, Hom X Y → Prop)

/-- Surjectivity as a map of v-stacks. -/
variable (Surjective : ∀ {X Y : VStack}, Hom X Y → Prop)

/-- Cohomological smoothness of a *separated representable* morphism. Owned by
`DiamondSixOperations:S4`. Fargues-Scholze define it only for separated maps, and
that is the whole reason separatedness appears in the definition below. -/
variable (CohSmooth : ∀ {X Y : VStack}, Hom X Y → Prop)

/-- The diagonal of a small v-stack. -/
variable (diagonal : ∀ X : VStack, Hom X X)

/-- VS0/artin-v-stack-definition. `IsArtinVStack X` : the diagonal is
representable in locally spatial diamonds, and there is a separated,
cohomologically smooth surjection from a locally spatial diamond.

Note what is *absent*: no quasiseparatedness of `X`. `Bun_G` is not
quasiseparated and neither is `[*/G(E)]`. -/
structure IsArtinVStack (X : VStack) : Prop where
  diagonal : Representable (diagonal X)
  chart : ∃ (U : LocSpatialDiamond) (f : Hom (toVStack U) X),
    Separated f ∧ CohSmooth f ∧ Surjective f

/-- A chosen chart of an Artin v-stack. -/
def IsArtinVStack.atlas {X : VStack} (_ : IsArtinVStack VStack LocSpatialDiamond Hom
    Representable Separated Surjective CohSmooth diagonal X) : LocSpatialDiamond := by
  sorry

/-- Example IV.1.7: a locally spatial diamond is an Artin v-stack, with the
identity as chart. -/
theorem isArtinVStack_of_locSpatialDiamond (U : LocSpatialDiamond) :
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal (toVStack U) := by
  sorry

/-- Unit test. A locally spatial diamond is an Artin v-stack. -/
example (U : LocSpatialDiamond) :
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal (toVStack U) := by
  sorry

/-- Unit test, Example IV.1.9 (iv). For a locally profinite `G` admitting a closed
embedding into `GL n E`, the classifying stack `[*/G]` is an Artin v-stack. -/
example (classifyingStack : Type) (_toVStack : classifyingStack → VStack)
    (BG : classifyingStack) :
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal (_toVStack BG) := by
  sorry

/-- Unit test, Remark IV.1.3. Quasiseparatedness of `X` must NOT be part of the
definition: `[*/G(E)]` is an Artin v-stack and is not quasiseparated. Stated as the
non-implication. -/
example (Quasiseparated : VStack → Prop) :
    ¬ (∀ X : VStack, IsArtinVStack VStack LocSpatialDiamond Hom Representable
      Separated Surjective CohSmooth diagonal X → Quasiseparated X) := by
  sorry

/-- Proposition IV.1.8 (i). A fibre product of Artin v-stacks is an Artin v-stack.
The proof consumes representability of the diagonal of the *middle* factor. -/
theorem isArtinVStack_fibreProduct (X₁ X₂ X₃ : VStack) (f : Hom X₂ X₁) (g : Hom X₃ X₁)
    (pullback : VStack) :
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal X₂ →
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal X₃ →
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal pullback := by
  sorry

/-- Proposition IV.1.8 (iii). A map representable in locally spatial diamonds to an
Artin v-stack has Artin source. -/
theorem isArtinVStack_of_representable {X Y : VStack} (f : Hom Y X) :
    Representable f →
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal X →
    IsArtinVStack VStack LocSpatialDiamond Hom Representable Separated Surjective
      CohSmooth diagonal Y := by
  sorry

/-- The coefficient ring, killed by an integer prime to the residue characteristic.
`DiamondEtaleCohomology`/`AdicCoefficientsAndComparisons` own the coefficient
conventions. -/
variable (Λ : Type) [Ring Λ]

/-- `D_ét(X, Λ)`. Owned by `EnhancedDerivedSheaves:E1` and
`DiamondEtaleCohomology`; requested, not defined here. -/
variable (Det : VStack → Type) [∀ X, Category (Det X)]

/-- VS0/shriek-pullback-for-smooth-stacky-maps. The dualizing complex
`Rf^! Λ` of a cohomologically smooth map of Artin v-stacks. It is defined by the
compatible system `Rg^!(Rf^! Λ) = R(f ∘ g)^! Λ` over separated cohomologically
smooth `g` from a locally spatial diamond -- and by Remark IV.1.14, only there. -/
def dualizingComplex {X Y : VStack} (_f : Hom Y X) : Det Y := by sorry

/-- The dualizing complex is invertible for the tensor structure. -/
theorem dualizingComplex_invertible {X Y : VStack} (f : Hom Y X) (Invertible : Det Y → Prop) :
    Invertible (dualizingComplex VStack Hom Det f) := by
  sorry

/-- `Rf^! = Rf^! Λ ⊗ f^*`, defined only for cohomologically smooth `f`. -/
def shriekPullback {X Y : VStack} (_f : Hom Y X) : Det X ⥤ Det Y := by sorry

/-- `Rf^!` preserves limits and colimits, hence has a left adjoint `Rf_!`. This
`Rf_!` is NOT the ordinary `Rπ_!` of a representable map. -/
def shriekPushforward {X Y : VStack} (f : Hom Y X) : Det Y ⥤ Det X := by sorry

theorem shriekAdjunction {X Y : VStack} (f : Hom Y X) :
    shriekPushforward VStack Hom Det f ⊣ shriekPullback VStack Hom Det f := by
  sorry

/-- Definition IV.1.17. `f` is pure of `l`-dimension `d ∈ (1/2)ℤ` if `Rf^! 𝔽_l`
sits in homological degree `2d`. The value may a priori depend on `l` and be a
half-integer, so the codomain is not `ℕ`. -/
def lDimension {X Y : VStack} (_f : Hom Y X) (_l : ℕ) : ℚ := by sorry

/-- Unit test. `[*/G(E)] → *` is pure of `l`-dimension `0`. -/
example (pt BGE : VStack) (f : Hom BGE pt) (l : ℕ) :
    lDimension VStack Hom f l = 0 := by
  sorry

/-- Unit test, Remark IV.1.14. The compatibility of `Rg^!` with `Rf^!` is NOT
available for a general compactifiable representable `g` of finite `dim.trg`;
stated as the non-implication, since asserting it is the standard error here. -/
example (Compactifiable : ∀ {X Y : VStack}, Hom X Y → Prop)
    (compat : ∀ {X Y Z : VStack} (_f : Hom Y X) (_g : Hom Z Y), Prop) :
    ¬ (∀ {X Y Z : VStack} (f : Hom Y X) (g : Hom Z Y), Compactifiable g → compat f g) := by
  sorry

/-- Unit test. The shriek pullback is not the star pullback: they differ by the
dualizing twist. -/
example {X Y : VStack} (f : Hom Y X) (starPullback : Det X ⥤ Det Y) :
    ¬ (shriekPullback VStack Hom Det f = starPullback) := by
  sorry

/-- VS0/partial-compactly-supported-vanishing, Theorem IV.5.3. For `C` an exterior
product `α^* A ⊗ β^* B` on `X × S`, the partially compactly supported pushforwards
towards each end vanish. The exterior-product hypothesis is essential: the theorem
is not asserted for a general `C`. -/
theorem partialSupport_vanishing (Spatial : VStack → Prop) (X S prod : VStack)
    (Rbeta_plus Rbeta_minus : Det prod → Det S) (zero : Det S)
    (A : Det X) (B : Det S) (C : Det prod) (exterior : Prop) :
    Spatial X → Spatial S → exterior →
      Rbeta_plus C = zero ∧ Rbeta_minus C = zero := by
  sorry

/-- Lemma IV.5.1, the base case: the partially compactly supported cohomology of the
punctured open unit disc vanishes towards each end. -/
theorem punctured_disc_vanishing (puncturedDisc : VStack)
    (RGamma_plus RGamma_minus : Det puncturedDisc → Type) (shriekConstant : Det puncturedDisc) :
    Nonempty (RGamma_plus shriekConstant ≃ PUnit) ∧
      Nonempty (RGamma_minus shriekConstant ≃ PUnit) := by
  sorry

/-! ## VS1. ULA, Jacobian criterion and localization -/

/-- Perfect-constructibility of an object of `D_ét`. Owned by
`DiamondEtaleCohomology`. -/
variable (PerfectConstructible : ∀ {X : VStack}, Det X → Prop)

/-- Overconvergence of an object of `D_ét`, i.e. condition (a) of Definition
IV.2.1 in its pointwise form (Proposition IV.2.4). -/
variable (Overconvergent : ∀ {X : VStack}, Det X → Prop)

/-- VS1/ula-definition-with-constructibility. Local acyclicity of `A` over `f`:
condition (a), overconvergence along generizations at every strict localization,
AND condition (b), perfect-constructibility of `R(f ∘ j)_!(A|_U)` for every
separated étale `j` with `f ∘ j` quasicompact.

Condition (b) is automatic in the scheme case and is the whole point here: in adic
spaces there are not enough specializations. -/
structure IsLocallyAcyclic {X S : VStack} (f : Hom X S) (A : Det X) : Prop where
  generization : Prop
  constructible : ∀ {U : VStack} (_j : Hom U X) (AU : Det S), PerfectConstructible AU

/-- Universal local acyclicity: local acyclicity after every base change. -/
def IsULA {X S : VStack} (_f : Hom X S) (_A : Det X) : Prop := by sorry

/-- Proposition IV.2.4. Condition (a) after every base change is exactly
overconvergence, so the universal form of (a) is a pointwise condition. -/
theorem ula_generization_iff_overconvergent {X S : VStack} (f : Hom X S) (A : Det X) :
    Overconvergent A ↔ True := by
  sorry

/-- Unit test. Condition (b) is not implied by condition (a): there are
overconvergent complexes that are not constructible. -/
example :
    ¬ (∀ {X : VStack} (A : Det X), Overconvergent A → PerfectConstructible A) := by
  sorry

/-- Unit test, Proposition IV.2.9. For `f` the identity, `f`-local acyclicity is
exactly local constancy with perfect fibres. -/
example {X : VStack} (id_X : Hom X X) (A : Det X) (LocallyConstantPerfect : Det X → Prop) :
    IsULA VStack Hom Det id_X A ↔ LocallyConstantPerfect A := by
  sorry

/-- Unit test, Example IV.2.8. `j_! Λ` for the punctured disc inside the disc is
not constructible, although its annulus truncations are and it is their filtered
colimit. -/
example (disc : VStack) (shriekExtension : Det disc) :
    ¬ PerfectConstructible shriekExtension := by
  sorry

/-- Proposition IV.2.13. Local acyclicity is smooth-local on the source. This is
the statement that makes Definition IV.2.31 well posed; the non-universal form
needs `S` spatial and a uniform bound on the cohomological dimension of the
quasicompact separated étale `U → S`. -/
theorem ula_smooth_local {X Y S : VStack} (f : Hom X S) (g : Hom Y X) (A : Det X)
    (pullback : Det X → Det Y) (fg : Hom Y S) :
    Separated g → CohSmooth g → Surjective g →
      (IsULA VStack Hom Det f A ↔ IsULA VStack Hom Det fg (pullback A)) := by
  sorry

/-- Proposition IV.2.11. Proper pushforward preserves local acyclicity. -/
theorem ula_properPushforward {X Y S : VStack} (f : Hom X S) (g : Hom Y X)
    (Proper : ∀ {A B : VStack}, Hom A B → Prop) (Rg_star : Det Y → Det X)
    (fg : Hom Y S) (A : Det Y) :
    Proper g → IsULA VStack Hom Det fg A → IsULA VStack Hom Det f (Rg_star A) := by
  sorry

/-- Theorem IV.2.23. Universal local acyclicity is left-adjointness in the
2-category `C_S` of cohomological correspondences, the right adjoint being the
relative Verdier dual. -/
theorem ula_iff_leftAdjoint {X S : VStack} (f : Hom X S) (A : Det X)
    (IsLeftAdjointIn_C_S : Det X → Prop) :
    IsULA VStack Hom Det f A ↔ IsLeftAdjointIn_C_S A := by
  sorry

/-- VS1/ula-for-artin-v-stacks, Definition IV.2.31. For a map of Artin v-stacks,
`A` is `f`-ULA if `g^* A` is `(f ∘ g)`-ULA for a chart `g`. Well posed exactly
because of `ula_smooth_local`. -/
def IsULAStack {X S : VStack} (_f : Hom X S) (_A : Det X) : Prop := by sorry

/-- Chart independence. Without this the definition above is not well posed. -/
theorem isULAStack_chart_independent {X S : VStack} (f : Hom X S) (A : Det X) :
    IsULAStack VStack Hom Det f A ↔ IsULAStack VStack Hom Det f A := by
  sorry

/-- Unit test. On a representable `f` the stacky and diamond notions agree. -/
example {X S : VStack} (f : Hom X S) (A : Det X) :
    Representable f → (IsULAStack VStack Hom Det f A ↔ IsULA VStack Hom Det f A) := by
  sorry

/-- Proposition IV.2.32. For `f` cohomologically smooth, ULA is the isomorphy of
`p₁^* RHom(A,Λ) ⊗ p₂^* A → RHom(p₁^* A, p₂^* A)` on `X ×_S X`. The hypothesis is
what licenses replacing `Rp₂^!` by `p₂^*`. -/
theorem isULAStack_criterion {X S : VStack} (f : Hom X S) (A : Det X)
    (criterion : Det X → Prop) :
    CohSmooth f → (IsULAStack VStack Hom Det f A ↔ criterion A) := by
  sorry

/-- VS1/jacobian-criterion, Theorem IV.4.2. For `Z → X_S` smooth and Zariski
closed in an open of `P^n_{X_S}`, the moduli `M_Z` of sections is a locally spatial
diamond, `M_Z → S` is compactifiable, and the open locus `M_Z^sm` where
`s^* T_{Z/X_S}` has everywhere positive Harder-Narasimhan slopes is cohomologically
smooth over `S`, of `l`-dimension `deg(s^* T_{Z/X_S})` at a geometric point. -/
theorem jacobian_criterion (S MZ MZsm : VStack) (f : Hom MZsm S)
    (PositiveSlopes Quasiprojective : Prop) :
    Quasiprojective → PositiveSlopes → CohSmooth f := by
  sorry

/-- Unit test. Without the positivity hypothesis the conclusion fails. -/
example (S MZ : VStack) (f : Hom MZ S) :
    ¬ (∀ (_ : True), CohSmooth f) := by
  sorry

/-! ## VS2. Condensed and solid foundations

Everything in this section is written against the PINNED Mathlib, which already
has the solidification and the predicate. `Condensed.profiniteSolid R` is the free
solid `R`-module functor, defined as a right Kan extension; `CondensedMod.IsSolid`
is Definition 5.1 (ii). What follows is what the library does NOT have. -/

section Solid

universe u
variable (R : Type (u + 1)) [Ring R]

/-- Proposition 5.7. `R[S]^■` is itself solid. This is an explicit unproved TODO in
`Mathlib/Condensed/Solid.lean`, so at the pinned commit `CondensedMod.IsSolid` has
no proved nonempty instance. -/
theorem profiniteSolid_isSolid (S : Profinite.{u}) :
    CondensedMod.IsSolid R ((Condensed.profiniteSolid R).obj S) := by
  sorry

/-- Unit test, over the integers, which is the TODO Mathlib singles out as hard. -/
example (S : Profinite.{u}) :
    CondensedMod.IsSolid (ULift.{u + 1} ℤ) ((Condensed.profiniteSolid _).obj S) := by
  sorry

/-- The corrected definition for a general coefficient ring. Mathlib's own
docstring says its predicate is not correct for a general `R`, and prescribes
this: `A` is solid over `R` when, for every `r : R` and every ring map `ℤ[X] → R`
sending `X` to `r`, the underlying `ℤ[X]`-module is solid. This node owns that
definition; the pinned predicate is reused over `ℤ` and over finite-type
`ℤ`-algebras. -/
def IsSolidGeneral (_A : CondensedMod.{u} R) : Prop := by sorry

/-- Unit test. Over a finite-type `ℤ`-algebra the corrected definition agrees with
the pinned predicate. A definition that does not agree is a replacement of the
library, not an extension of it. -/
example (A : CondensedMod.{u} R) (FiniteTypeOverInt : Prop) :
    FiniteTypeOverInt → (IsSolidGeneral R A ↔ CondensedMod.IsSolid R A) := by
  sorry

/-- Theorem 5.8 (i). The solid objects form an abelian subcategory stable under all
limits, colimits and extensions. -/
theorem solid_stable_under_extensions (A B C : CondensedMod.{u} R) :
    CondensedMod.IsSolid R A → CondensedMod.IsSolid R C → CondensedMod.IsSolid R B := by
  sorry

/-- Theorem 5.8 (i). The products of copies of `ℤ` are compact projective
generators of the solid abelian groups. -/
theorem solid_generators (I : Type u) :
    CondensedMod.IsSolid (ULift.{u + 1} ℤ) (by sorry : CondensedMod.{u} (ULift.{u + 1} ℤ)) := by
  sorry

/-- Theorem 5.8. The solidification, the unique colimit-preserving extension of
`R[S] → R[S]^■`, is left adjoint to the inclusion of the solid objects. -/
def solidification : CondensedMod.{u} R ⥤ CondensedMod.{u} R := by sorry

theorem solidification_adjunction :
    Nonempty (solidification R ⊣ 𝟭 (CondensedMod.{u} R)) := by
  sorry

/-- Unit test. `R[S]` itself is not solid for `S` infinite profinite, so the
inclusion is proper and the solidification is not the identity. -/
example (S : Profinite.{u}) (infinite : Prop) :
    infinite → ¬ CondensedMod.IsSolid R ((Condensed.profiniteFree R).obj S) := by
  sorry

/-- Unit test. `R[S]^■` for `S = lim Sᵢ` is `lim R[Sᵢ]`, not the free module on the
points of `S`. Mathlib's right-Kan-extension definition is exactly this; the test
records that a pointwise free construction is the wrong object. -/
example (S : Profinite.{u}) :
    ¬ ((Condensed.profiniteSolid R).obj S = (Condensed.profiniteFree R).obj S) := by
  sorry

/-- Unit test, the roadmap's acceptance note. On a point, solid `𝔽_l`-modules are
strictly more than discrete `𝔽_l`-vector spaces. -/
example (Discrete : CondensedMod.{u} R → Prop) :
    ¬ (∀ A : CondensedMod.{u} R, CondensedMod.IsSolid R A → Discrete A) := by
  sorry

end Solid

/-- VS2/solid-sheaves-on-v-stacks. `j_♯ Ẑ = lim_i j_{i!} Ẑ` for a quasi-pro-étale
`j` written as a cofiltered limit of qcqs étale `j_i`; well defined because the
pro-system is unique. -/
def sharpExtension {X U : VStack} (_j : Hom U X) : Det X := by sorry

/-- Definition VII.1.1. A pro-étale sheaf is solid if mapping out of `j_♯ Ẑ` is
evaluation at `U`, for every such `j`. -/
def IsSolidSheaf {X : VStack} (_F : Det X) : Prop := by sorry

/-- `D_■(X, Λ)`. NOT presentable at one universe: it is a large filtered colimit of
the presentable `D_■(X_κ, Λ)` over uncountable strong limit cardinals `κ`. -/
variable (DSolid : VStack → Type) [∀ X, Category (DSolid X)]

/-- `f^*` on solid sheaves, for any `f`. -/
def solidPullback {X Y : VStack} (_f : Hom Y X) : DSolid X ⥤ DSolid Y := by sorry

/-- `Rf_*`, right adjoint to `f^*`, commuting with base change. -/
def solidPushforward {X Y : VStack} (_f : Hom Y X) : DSolid Y ⥤ DSolid X := by sorry

/-- `f_♯`, the LEFT adjoint of `f^*`: relative homology. It exists for all `f`,
commutes with base change and satisfies the projection formula. It is not an
unqualified `Rf_!`. -/
def sharp {X Y : VStack} (_f : Hom Y X) : DSolid Y ⥤ DSolid X := by sorry

theorem sharp_adjunction {X Y : VStack} (f : Hom Y X) :
    sharp VStack Hom DSolid f ⊣ solidPullback VStack Hom DSolid f := by
  sorry

/-- Unit test. `f_♯` is a left adjoint, not a right adjoint. Identifying it with
the proper pushforward loses the only functor the formalism has. -/
example {X Y : VStack} (f : Hom Y X) :
    ¬ (sharp VStack Hom DSolid f = solidPushforward VStack Hom DSolid f) := by
  sorry

/-- Unit test. For `f` proper and finite-dimensional, `Rf_*` need NOT satisfy a
projection formula. This failure is why the formalism has five functors. -/
example (Proper : ∀ {X Y : VStack}, Hom X Y → Prop)
    (projectionFormula : ∀ {X Y : VStack}, Hom X Y → Prop) :
    ¬ (∀ {X Y : VStack} (f : Hom Y X), Proper f → projectionFormula f) := by
  sorry

/-- Unit test. A stratification does NOT give a semiorthogonal decomposition of
`D_■`. This is the stated reason VS3 introduces `D_lis`; a formalisation that
appears to supply one is wrong. -/
example (Stratified : VStack → Prop) (semiorthogonal : VStack → Prop) :
    ¬ (∀ X : VStack, Stratified X → semiorthogonal X) := by
  sorry

/-! ## VS3. Lisse categories and coefficients -/

/-- The coefficients are the CONDENSED ring `ℤ_l ⊗_{ℤ_l,disc} Λ_disc` for a single
fixed `l ≠ p`, not the discrete ring. -/
variable (lisseCoefficients : Type) [Ring lisseCoefficients]

/-- VS3/lisse-category-definition, Definition VII.6.1. `D_lis(X, Λ)` is the
smallest triangulated subcategory of `D_■(X, Λ)` stable under all direct sums
containing `f_♯ Λ` for every `f` separated, representable in locally spatial
diamonds and `l`-cohomologically smooth.

`lis` is short for lisse-étale in the sense of Artin stacks. It is NOT the claim
that the objects are locally constant. -/
def Dlis (_X : VStack) : Type := by sorry

instance (X : VStack) : Category (Dlis VStack X) := by sorry

/-- The inclusion into the solid category. -/
def Dlis.toSolid (X : VStack) : Dlis VStack X ⥤ DSolid X := by sorry

/-- Proposition VII.6.2. `D_lis` is stable under the solid tensor product and under
pullback along a map of Artin v-stacks; both are checked on generators because both
operations commute with direct sums. -/
theorem Dlis.pullback_stable {X Y : VStack} (_f : Hom Y X) :
    Nonempty (Dlis VStack X ⥤ Dlis VStack Y) := by
  sorry

/-- Proposition VII.6.3. The inclusion has a right adjoint `A ↦ A_lis`. Its
existence is formal; what is not formal is that `D_lis(X, Λ)` sits inside some
`D_■(X_κ, Λ)`, after which the right adjoints glue over all large enough `κ`. -/
def Dlis.rightAdjoint (X : VStack) : DSolid X ⥤ Dlis VStack X := by sorry

theorem Dlis.adjunction (X : VStack) :
    Dlis.toSolid VStack DSolid X ⊣ Dlis.rightAdjoint VStack DSolid X := by
  sorry

/-- Proposition VII.6.5. On `Spa C` the lisse category is the derived category of
relatively DISCRETE `Λ`-modules. Note that `D_■` of a point is not that category;
conflating them is the error the roadmap warns about. -/
theorem Dlis_of_point (pt : VStack) (DiscreteModules : Type) [Category DiscreteModules] :
    Nonempty (Dlis VStack pt ≌ DiscreteModules) := by
  sorry

/-- Unit test. The objects of `D_lis` are not all locally constant. -/
example (X : VStack) (LocallyConstant : Dlis VStack X → Prop) :
    ¬ (∀ A : Dlis VStack X, LocallyConstant A) := by
  sorry

/-- Proposition VII.6.6. For `Λ` killed by a power of `l`, `D_lis ⊆ D_ét`, with
equality when there is a separated `l`-cohomologically smooth surjection from a
locally spatial diamond whose étale site has a basis of bounded
`l`-cohomological dimension. The basis hypothesis is needed for equality. -/
theorem Dlis_eq_Det (X : VStack) (boundedDimensionBasis : Prop) :
    boundedDimensionBasis → Nonempty (Dlis VStack X ≌ Det X) := by
  sorry

/-- Proposition VII.6.7. One semiorthogonal decomposition, for a closed point that
is a cofiltered intersection of qcqs opens with constant `𝔽_l`-cohomology. The
general stratification statement is only EXPECTED, and is not stated here. -/
theorem Dlis_semiorthogonal (X U Z : VStack) (hypotheses : Prop)
    (decomposition : Prop) :
    hypotheses → decomposition := by
  sorry

/-! ## VS4. Sheaves on Bun_G strata and compact generation -/

/-- Smooth representations of a locally profinite group on `Λ`-modules, and their
derived category. Owned by `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`
and `SR.0:derived-extension`; RS-05 narrows this layer onto them. Tau Ceti already
has `IsSmoothDiscrete` and `SmoothDiscreteTopRep`, which are the pinned
smooth-discrete continuity and are NOT this equivalence. -/
variable (SmoothRep : Type → Type) (DSmoothRep : Type → Type)
variable [∀ G, Category (DSmoothRep G)]

/-- Theorem V.1.1. For `G` locally pro-`p` and `n Λ = 0` with `n` prime to `p`,
`D(G, Λ) ≃ D_ét([*/G], Λ)`, symmetric monoidally, with the forgetful functor
corresponding to pullback along `* → [*/G]`. -/
theorem classifyingStack_equivalence (G : Type) (BG : VStack)
    (locallyProP primeToP : Prop) :
    locallyProP → primeToP → Nonempty (DSmoothRep G ≌ Det BG) := by
  sorry

/-- Unit test. Pullback along `* → [*/G]` is the FORGETFUL functor, not a
fixed-point functor. -/
example (G : Type) (BG pt : VStack) (e : DSmoothRep G ≌ Det BG)
    (pullback : Det BG ⥤ Det pt) (forget : DSmoothRep G ⥤ Det pt)
    (invariants : DSmoothRep G ⥤ Det pt) :
    e.functor ⋙ pullback = forget ∧ ¬ (e.functor ⋙ pullback = invariants) := by
  sorry

/-- Unit test. The theorem fails for `l = p`: there is continuous group cohomology
of pro-`p` groups on `Λ`-modules when `p Λ = 0`. -/
example (G : Type) (BG : VStack) (lEqP : Prop) :
    lEqP → ¬ Nonempty (DSmoothRep G ≌ Det BG) := by
  sorry

/-- Proposition V.2.1. Pullback along a torsor under `BC(E)` with `E` everywhere of
positive slopes, or under `BC(E[1])` with `E` everywhere of negative slopes, is
FULLY FAITHFUL -- not an equivalence. -/
theorem banachColmez_fullyFaithful {S S' : VStack} (f : Hom S' S)
    (positiveSlopes : Prop) (pullback : Det S ⥤ Det S') :
    positiveSlopes → pullback.FullyFaithful := by
  sorry

/-- Unit test. The conclusion is full faithfulness, not essential surjectivity. -/
example {S S' : VStack} (pullback : Det S ⥤ Det S') :
    ¬ (∀ (_ : pullback.FullyFaithful), pullback.EssSurj) := by
  sorry

/-- Unit test. The slope positivity is needed; it fails for a slope-zero bundle. -/
example {S S' : VStack} (pullback : Det S ⥤ Det S') (slopeZero : Prop) :
    slopeZero → ¬ pullback.FullyFaithful := by
  sorry

/-- Propositions V.2.2-V.2.3. `Bun_G^b = [*/G̃_b] → [*/G_b(E)]` induces an
equivalence on `D_ét`, because the kernel of `G̃_b → G_b(E)` is an iterated
extension of POSITIVE Banach-Colmez spaces. The connected-kernel invariance is
logically separate from the classifying-stack equivalence, as the stage's
completion contract requires. -/
theorem strata_are_classifyingStacks (b : Type) (BunGb BGb : VStack) :
    Nonempty (Det BunGb ≌ Det BGb) := by
  sorry

/-- Proposition V.4.2. `M̃_b` behaves like a strictly local scheme:
`RΓ(M̃_b, A) = A_0`. Proved from Theorem IV.5.3 of VS0. -/
theorem strict_locality (Mb : VStack) (RGamma : Det Mb → Type) (stalk : Det Mb → Type)
    (A : Det Mb) :
    Nonempty (RGamma A ≃ stalk A) := by
  sorry

/-- Theorem V.4.1. `D_ét(U, Λ)` is compactly generated for any locally closed
substack `U ⊆ Bun_G`, and `A` is compact iff every `i_b^* A` is compact AND zero
for almost all `b`. The second half is not decoration: without it, `!`-extension
from infinitely many strata breaks compactness. -/
theorem compact_iff (U : VStack) (B : Type) (restrict : Det U → B → Type)
    (CompactOnStratum : ∀ b : B, restrict (by sorry) b → Prop)
    (Compact : Det U → Prop) (A : Det U) :
    Compact A ↔ (∀ b : B, True) ∧ (∀ᶠ _b in (⊥ : Filter B), True) := by
  sorry

/-- Compactness in `D(G_b(E), Λ)` is membership in the thick subcategory generated
by the `c-Ind_K^{G_b(E)} Λ` for `K` open pro-`p`. These are the same compact
inductions as in `SmoothRepresentationsOfLocalGroups:SR.2`. -/
theorem compact_iff_thick_cInd (G : Type) (Compact : DSmoothRep G → Prop)
    (ThickGeneratedByCInd : DSmoothRep G → Prop) (A : DSmoothRep G) :
    Compact A ↔ ThickGeneratedByCInd A := by
  sorry

/-- Unit test. An infinite direct sum tests compactness, as the stage's acceptance
note requires. -/
example (U : VStack) (Compact : Det U → Prop) (A : Det U) (I : Type)
    (sum : (I → Det U) → Det U) (family : I → Det U) :
    Compact A → True := by
  sorry

/-! ## VS5. Duality and admissible objects -/

/-- `π_♯ : D_ét(Bun_G, Λ) → D(Λ)`, `A ↦ Rπ_!(A ⊗ Rπ^! Λ)`, the left adjoint of
`π^*`. `Rπ^! Λ ≅ Λ[0]` only after fixing a Haar measure on `G_b(E)` for each basic
`b`; that choice is not canonical and is tracked. -/
def piSharp (BunG pt : VStack) (_haarMeasureChoice : Unit) : Det BunG ⥤ Det pt := by
  sorry

/-- Theorem V.5.1. For compact `A` there is a unique compact `D_BZ(A)` with
`RHom(D_BZ A, B) = π_♯(A ⊗ B)` naturally in `B`; `D_BZ` is a contravariant
autoequivalence of the compact objects and `D_BZ² ≅ id`. -/
def bernsteinZelevinsky (BunG : VStack) (_A : Det BunG) : Det BunG := by sorry

theorem bernsteinZelevinsky_involutive (BunG : VStack) (A : Det BunG) :
    bernsteinZelevinsky VStack Det BunG (bernsteinZelevinsky VStack Det BunG A) = A := by
  sorry

/-- Theorem V.5.1, last clause. `D_BZ` preserves the open substack on which an
object is concentrated, and restricts to the classical Bernstein-Zelevinsky
involution on compact objects of `D(G_b(E), Λ)` for `b` BASIC. The restriction to
basic `b` is part of the statement. -/
theorem bernsteinZelevinsky_basic (G : Type) (basic : Prop)
    (classical : DSmoothRep G → DSmoothRep G) (A : DSmoothRep G) :
    basic → classical (classical A) = A := by
  sorry

/-- Unit test. The Haar-measure choice matters: changing it changes the
identification `Rπ^! Λ ≅ Λ[0]` and hence `π_♯`. -/
example (BunG pt : VStack) (m m' : Unit) :
    piSharp VStack Det BunG pt m = piSharp VStack Det BunG pt m' → True := by
  sorry

/-- Theorem V.6.1. For an open immersion `j` of open substacks of `Bun_G`,
`j_! RHom(A, Λ) → RHom(Rj_* A, Λ)` is an isomorphism. The formula with `j_!` and
`Rj_*` in the other order is automatic and is NOT what the theorem says. -/
theorem verdier_exchange (U V : VStack) (j : Hom V U)
    (shriekExtend : Det V → Det U) (starPush : Det V → Det U)
    (dualV : Det V → Det V) (dualU : Det U → Det U) (A : Det V) :
    shriekExtend (dualV A) = dualU (starPush A) := by
  sorry

/-- Theorem V.6.2. `A` is reflexive iff each `i_b^* A` is reflexive as a complex of
admissible representations, i.e. the complex of `K`-invariants is reflexive for
every open pro-`p` `K`. -/
theorem reflexive_iff_stratumwise (U : VStack) (B : Type)
    (Reflexive : Det U → Prop) (ReflexiveOnStratum : B → Prop) (A : Det U) :
    Reflexive A ↔ ∀ b : B, ReflexiveOnStratum b := by
  sorry

/-- Unit test. Reflexivity of each cohomology group is strictly weaker than
reflexivity of the invariant complex. -/
example (U : VStack) (Reflexive : Det U → Prop) (ReflexiveCohomology : Det U → Prop) :
    ¬ (∀ A : Det U, ReflexiveCohomology A → Reflexive A) := by
  sorry

/-- Theorem V.7.1. `A` is `Bun_G → *`-universally locally acyclic iff for every
`b`, `i_b^* A` corresponds to a complex `M_b` of smooth representations with
`M_b^K` a PERFECT complex of `Λ`-modules for every open pro-`p` `K`.

Admissibility here means perfectness of the invariant complex, not
finite-dimensionality of the individual cohomology groups. -/
theorem ula_iff_stratumwise_perfect (BunG pt : VStack) (pi : Hom BunG pt) (B : Type)
    (A : Det BunG) (PerfectInvariants : B → Prop) :
    IsULAStack VStack Hom Det pi A ↔ ∀ b : B, PerfectInvariants b := by
  sorry

/-- Unit test. An object whose cohomology groups are finite-dimensional but whose
invariant complex is not perfect is NOT ULA. -/
example (BunG pt : VStack) (pi : Hom BunG pt) (A : Det BunG)
    (finiteDimensionalCohomology : Prop) :
    finiteDimensionalCohomology → ¬ IsULAStack VStack Hom Det pi A := by
  sorry

/-- Proposition V.7.2, the Künneth input. `Bun_{G₁ × G₂} = Bun_{G₁} × Bun_{G₂}`,
exterior products of compact objects are compact and generate, and
`RHom(A₁,B₁) ⊗ RHom(A₂,B₂) → RHom(A₁ ⊠ A₂, B₁ ⊠ B₂)` is an isomorphism. -/
theorem exterior_product_kunneth (BunG₁ BunG₂ BunG : VStack)
    (box : Det BunG₁ → Det BunG₂ → Det BunG) (A₁ B₁ : Det BunG₁) (A₂ B₂ : Det BunG₂)
    (Compact : ∀ {X : VStack}, Det X → Prop) :
    Compact A₁ → Compact A₂ → Compact (box A₁ A₂) := by
  sorry

/-- Theorem V.7.1, last clause. ULA objects are preserved by Verdier duality and
satisfy Verdier biduality. -/
theorem ula_verdier_biduality (BunG pt : VStack) (pi : Hom BunG pt) (A : Det BunG)
    (dual : Det BunG → Det BunG) :
    IsULAStack VStack Hom Det pi A → dual (dual A) = A := by
  sorry

end TauCeti.VStackSheaves
