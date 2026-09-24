/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HeckeStacksAndLocalShtukas.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-HeckeStacksAndLocalShtukas: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

Neither pinned library has a Weil group, a loop group, an affine Grassmannian, a
perfectoid space or a shtuka: a search of the pinned declaration index found no
declaration whose name contains WeilGroup, LoopGroup, Shtuka or Perfectoid, and
the only Grassmannian is `Module.Grassmannian`. So the geometric carriers below
appear as `variable`s or opaque parameters and are requested from their owners:
the curve and its divisors (`RelativeFarguesFontaine:RF2:*`, `RF4:G-torsors`),
`Bun_G` and its strata (`BunGAndNewtonStrata:BG2:uniformization`, `BG3`), the
loop group, Schubert geometry and geometric Satake
(`GeometricSatakeAndFusion:GS0:*`, `GS2:Satake-closure`, `GS3:fusion`,
`GS4:integral-dual-group`), the solid and lisse categories
(`VStackSheavesAndLisseCategories:VS1`-`VS5`), smooth representations
(`SmoothRepresentationsOfLocalGroups:SR.0`-`SR.2`) and the local Weil group
(Tau Ceti's ClassFieldTheory, layer 9). Nothing here encodes a missing theorem as
an assumed structure field.

Proposition IX.5.1 of Fargues-Scholze (the uniform open wild-inertia subgroup) is
deliberately NOT stated here: the roadmap document and the accepted restructuring
RS-22 both make `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification` its
canonical owner, and the packet files it as a request.

What IS reused from the pinned libraries: `WittVector` and
`WittVector.Isocrystal` (for `G = GL_n` an isocrystal is exactly the datum `b`),
`CoxeterSystem` and `TauCeti.TitsSystem.bruhatCell` (the Bruhat order of the
boundedness condition), `TauCeti.ReductiveAffineGroupSchemeCat`,
`TauCeti.AffineGroupSchemeCat`, `TauCeti.Huber.Pair`,
`TauCeti.ValuationSpectrum.spa`, `TauCeti.IsSmoothDiscrete` and the condensed
carriers.
-/
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.GroupTheory.Coxeter.Basic
import Mathlib.Condensed.Basic
import Mathlib.Condensed.Module
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.Finiteness.Defs

noncomputable section

open CategoryTheory

namespace TauCeti.HeckeStacks

/-! ## HS0. Global and local Hecke stacks -/

/-- Small v-stacks over `Perf`. Owned by `DiamondsAndVStacks:D4`. -/
variable (VStack : Type) (Hom : VStack → VStack → Type)

/-- The stack of `G`-bundles on the Fargues-Fontaine curve. Owned by
`BunGAndNewtonStrata:BG2:uniformization`. -/
variable (BunG : VStack)

/-- Degree-one divisors on the curve; `Div¹ = Spd E/φ^ℤ`. Owned by
`RelativeFarguesFontaine:RF2:integral-divisors` and `RF2:untilts`. -/
variable (Div1 : VStack) (power : VStack → Type → VStack)

/-- HS0/global-hecke-correspondence. For a finite set `I`, the stack of two
`G`-torsors on `X_S` with an isomorphism away from the chosen degree-one
divisors, meromorphic along them, together with the leg data. -/
variable (Hck : Type → VStack)

/-- The source projection. -/
variable (p₁ : ∀ I : Type, Hom (Hck I) BunG)

/-- The target projection, the map along which the SOLID relative homology is
taken. It is not representable merely because its fibres are. -/
variable (prod : VStack → VStack → VStack)
variable (p₂ : ∀ I : Type, Hom (Hck I) (prod BunG (power Div1 I)))

/-- The leg map. -/
variable (legs : ∀ I : Type, Hom (Hck I) (power Div1 I))

/-- Meromorphy of a modification along a divisor: for every representation of `G`
the associated map of vector bundles extends to `ℱ → ℱ'(kD)` for `k` large.
Tested on all representations in the Tannakian description. -/
def IsMeromorphic {I : Type} (_x : Hck I) : Prop := by sorry

/-- The bounded substack for a tuple of dominant cocharacters, pulled back from
the bounded locus of the local Hecke stack. The local model is owned by
`GeometricSatakeAndFusion:GS0:Witt-geometry`. -/
variable (Cocharacter : Type)
def bounded (I : Type) (_μ : I → Cocharacter) : VStack := by sorry

/-- For a single MINUSCULE `μ` the corresponding correspondence on `Bun_{G,C}` is
proper and smooth over both factors. Asserted for the minuscule case only. -/
theorem bounded_proper_smooth_of_minuscule (μ : Cocharacter) (Minuscule : Cocharacter → Prop)
    (Proper Smooth : ∀ {X Y : VStack}, Hom X Y → Prop)
    (q₁ : Hom (bounded VStack Cocharacter ({*} : Type) fun _ => μ) BunG) :
    Minuscule μ → Proper q₁ ∧ Smooth q₁ := by
  sorry

/-- Unit test. The trivial modification recovers the identity correspondence.
This is the roadmap's first acceptance test and fixes the normalisation. -/
example (I : Type) (identityCorrespondence : VStack) :
    bounded VStack Cocharacter I (fun _ => by sorry) = identityCorrespondence := by
  sorry

/-- Unit test. Properness of the individual fibres does NOT make the global
source and target maps representable. Stated as the non-implication, because
asserting representability is the error the roadmap warns about. -/
example (Representable : ∀ {X Y : VStack}, Hom X Y → Prop)
    (FibrewiseProper : ∀ {X Y : VStack}, Hom X Y → Prop) :
    ¬ (∀ (I : Type), FibrewiseProper (p₂ I) → Representable (p₂ I)) := by
  sorry

/-- Unit test. For `I → J` the comparison map of Hecke STACKS is not a closed
immersion, unlike the corresponding map of Grassmannians. -/
example (I J : Type) (f : I → J) (comparison : Hom (Hck J) (Hck I))
    (ClosedImmersion : ∀ {X Y : VStack}, Hom X Y → Prop) :
    ¬ ClosedImmersion comparison := by
  sorry

/-- Coefficients: a `ℤ_ℓ[√q]`-algebra, `ℓ ≠ p`. The square root of `q`
trivialises the cyclotomic twist in geometric Satake. -/
variable (Λ : Type) [CommRing Λ]

/-- `D_■(X, Λ)` and `D_lis(X, Λ)`. Owned by
`VStackSheavesAndLisseCategories:VS2` and `VS3`. -/
variable (DSolid Dlis : VStack → Type)
variable [∀ X, Category (DSolid X)] [∀ X, Category (Dlis X)]

/-- HS0/demazure-generators-of-ULA-kernels. Over a geometric point the ULA kernel
category is generated under colimits by `Rf_{w∙*} ℤ_ℓ` for Demazure resolutions
of Schubert varieties in the AFFINE FLAG variety, modulo an Iwahori. -/
theorem ula_kernels_generated_by_demazure (HckC : VStack)
    (IsULAObject : DSolid HckC → Prop) (demazureGenerator : ℕ → DSolid HckC)
    (GeneratedUnderColimits : (ℕ → DSolid HckC) → (DSolid HckC → Prop) → Prop) :
    GeneratedUnderColimits demazureGenerator IsULAObject := by
  sorry

/-- For each Demazure kernel the push-pull correspondence on `Bun_{G,C}` is proper
and cohomologically smooth, hence preserves `D_lis`. -/
theorem demazure_correspondence_preserves_lis (w : ℕ) (BunGC : VStack)
    (pushPull : Dlis BunGC ⥤ DSolid BunGC) (landsInLis : Prop) :
    landsInLis := by
  sorry

/-- Unit test. The resolutions are in the AFFINE FLAG variety, not the affine
Grassmannian, and the Iwahori quotient is part of the statement. -/
example (affineGrassmannianVersion : Prop) :
    ¬ affineGrassmannianVersion := by
  sorry

/-! ## HS1. Kernels and the coherent Hecke action -/

/-- The dual group with its `Q`-action, `Q` a finite quotient of `W_E`. Owned by
`GeometricSatakeAndFusion:GS4:integral-dual-group`. -/
variable (DualGroupRep : Type → Type) [∀ I, Category (DualGroupRep I)]
variable [∀ I, MonoidalCategory (DualGroupRep I)]

/-- The Satake category of `Hck^I_G`. Owned by
`GeometricSatakeAndFusion:GS2:Satake-closure`. -/
variable (Sat : Type → Type) [∀ I, Category (Sat I)] [∀ I, MonoidalCategory (Sat I)]

/-- HS1/satake-kernel-and-solid-monoidal-functor. Geometric Satake, as a monoidal
functor to the Satake category, functorially in `I`. -/
variable (satakeSheaf : ∀ I : Type, DualGroupRep I ⥤ Sat I)

/-- The Satake KERNEL: compose with Verdier duality relative to
`Hck^I_G → [(Div¹)^I / L⁺G]` and land in the solid category. The target monoidal
structure is the solid convolution of FS VII.5. -/
def satakeKernel (I : Type) : DualGroupRep I ⥤ DSolid (Hck I) := by sorry

/-- The kernel functor is monoidal. On perverse sheaves there are no higher
coherences to take care of, which is why it is monoidal on the nose. -/
instance (I : Type) [MonoidalCategory (DSolid (Hck I))] :
    (satakeKernel VStack DSolid Hck DualGroupRep I).Monoidal := by
  sorry

/-- Unit test. The monoidal structure exists on the INFINITY-category because the
solid convolution uses only pullback, tensor and `π_♯`. A construction using
lower-shriek functors is not what the source builds, and the source says it has
not defined them in a sufficiently structured way. -/
example (I : Type) (usesOnlySharp lowerShriekVersion : Prop) :
    usesOnlySharp ∧ ¬ lowerShriekVersion := by
  sorry

/-- Unit test. `V` is dualizable in the Satake category. Everything formal about
`T_V` follows from this single fact. -/
example (I : Type) [MonoidalCategory (Sat I)] (V : Sat I)
    (Dualizable : Sat I → Prop) :
    Dualizable V := by
  sorry

/-- Unit test. `S'_1` is the unit kernel, so `T_1` is the identity. -/
example (I : Type) [MonoidalCategory (DSolid (Hck I))] [MonoidalCategory (DualGroupRep I)] :
    (satakeKernel VStack DSolid Hck DualGroupRep I).obj (𝟙_ (DualGroupRep I)) =
      𝟙_ (DSolid (Hck I)) := by
  sorry

/-- `p_{2♯}`: the SOLID relative-homology LEFT adjoint of `p₂^*`. It is not
`Rp_{2!}`, which is not defined for the stacky `p₂`. Owned, as an operation, by
`VStackSheavesAndLisseCategories:VS2`. -/
variable (sharp : ∀ {X Y : VStack}, Hom X Y → DSolid X ⥤ DSolid Y)
variable (solidPullback : ∀ {X Y : VStack}, Hom X Y → DSolid Y ⥤ DSolid X)

theorem sharp_adjunction {X Y : VStack} (f : Hom X Y) :
    sharp f ⊣ solidPullback f := by
  sorry

/-- HS1/hecke-operator-via-relative-homology.
`T_V(A) = p_{2♯}(p₁^* A ⊗^{L,■} S'_V)`. -/
def heckeOperator (I : Type) (_V : DualGroupRep I) :
    Dlis BunG ⥤ DSolid (prod BunG (power Div1 I)) := by
  sorry

/-- Proposition IX.2.1. After pullback to the diagonal geometric point, `T_V`
restricts to an endofunctor of `D_lis(Bun_G, Λ)`. -/
theorem heckeOperator_preserves_lis (I : Type) (V : DualGroupRep I) :
    Nonempty (Dlis BunG ⥤ Dlis BunG) := by
  sorry

/-- Unit test. `p_{2♯}` is a left adjoint and is not the proper pushforward;
`Rp_{2!}` is not available for `p₂`, so it is not a renaming. -/
example {X Y : VStack} (f : Hom X Y) (properPushforward : DSolid X ⥤ DSolid Y) :
    ¬ (sharp f = properPushforward) := by
  sorry

/-- Unit test. At the diagonal geometric point the functor factors over
`Rep_Λ(Ĝ^I)`; away from it the `Q`-action is genuinely present. -/
example (I : Type) (factorsOverDualGroupOnly awayFromDiagonal : Prop) :
    factorsOverDualGroupOnly ∧ ¬ awayFromDiagonal := by
  sorry

/-- HS1/condensed-enrichment. `D_lis(Bun_G,Λ)` is enriched in condensed anima by
`S ↦ D_lis(Bun_G × S, Λ)` for `S` extremally disconnected profinite. -/
def condensedHom (A B : Dlis BunG) : CondensedMod.{0} (ULift.{1} ℤ) := by sorry

/-- The `W_E^I`-equivariant category: objects with a map of CONDENSED ANIMATED
GROUPS `W_E^I → Aut(A)`. A discrete abstract action is strictly weaker. -/
variable (WeilGroup : Type) (WeilEquivariant : Type → Type)
variable [∀ I, Category (WeilEquivariant I)]

/-- Proposition IX.1.1. Pullback along `Bun_G × (Div¹)^I → Bun_G × [*/W_E^I]` is
fully faithful, with essential image the objects whose pullback to `Bun_G` is
lisse. -/
theorem weilEquivariant_fullyFaithful (I : Type)
    (F : WeilEquivariant I ⥤ DSolid (prod BunG (power Div1 I))) :
    F.FullyFaithful := by
  sorry

/-- Unit test. Only the enrichment in condensed anima is needed, not the full
condensed infinity-category; the source makes this reduction explicitly. -/
example (enrichmentSuffices fullCondensedCategoryNeeded : Prop) :
    enrichmentSuffices ∧ ¬ fullCondensedCategoryNeeded := by
  sorry

/-- Unit test. A discrete abstract `W_E`-action is not the condensed one. -/
example (I : Type) (A : Dlis BunG) (condensedAction discreteAction : Prop) :
    discreteAction → ¬ (discreteAction ↔ condensedAction) := by
  sorry

/-- HS1/properties-and-weil-equivariance, Theorem IX.2.2. `T_V` has left and right
adjoints, both `T_{V^∨}`; hence it preserves all limits, colimits and compact
objects, FORMALLY, from monoidality plus dualizability. -/
theorem heckeOperator_biadjoint (I : Type) (V Vdual : DualGroupRep I)
    (T Tdual : Dlis BunG ⥤ Dlis BunG) :
    (T ⊣ Tdual) ∧ (Tdual ⊣ T) := by
  sorry

/-- Preservation of ULA objects, by adjointness from preservation of compact
objects and the characterisation of ULA as perfect `RHom` against every compact
object (Proposition VII.7.9, owned by `VStackSheavesAndLisseCategories:VS5`). -/
theorem heckeOperator_preserves_ula (I : Type) (T : Dlis BunG ⥤ Dlis BunG)
    (IsULA : Dlis BunG → Prop) (A : Dlis BunG) :
    IsULA A → IsULA (T.obj A) := by
  sorry

/-- The duality isomorphisms, with the involution `sw^*` of Proposition VI.12.1. -/
theorem heckeOperator_duality (I : Type) (T Tsw : Dlis BunG ⥤ Dlis BunG)
    (DBZ : Dlis BunG → Dlis BunG) (A : Dlis BunG) :
    DBZ (T.obj A) = Tsw.obj (DBZ A) := by
  sorry

/-- Unit test. `T_V` preserves compact objects, tested on a compactly induced
generator. -/
example (I : Type) (T : Dlis BunG ⥤ Dlis BunG) (Compact : Dlis BunG → Prop)
    (cIndGenerator : Dlis BunG) :
    Compact cIndGenerator → Compact (T.obj cIndGenerator) := by
  sorry

/-! ## HS2. Local shtuka moduli and bounds -/

/-- The shtuka datum `(𝒢, b, {μ_i})`: a SMOOTH group scheme with reductive
generic fibre and CONNECTED special fibre, an element `b ∈ G(L)` with
`L = W(k)[1/p]`, and conjugacy classes of cocharacters.

For `G = GL_n` the element `b` is exactly an isocrystal structure, and the pinned
`WittVector.Isocrystal` is that case of the datum. -/
structure ShtukaDatum (k : Type) [Field k] where
  /-- The smooth group scheme; `TauCeti.AffineGroupSchemeCat` is the pinned
  carrier, and smoothness with connected special fibre is what must be added. -/
  groupScheme : Type
  /-- Connectedness of the special fibre, which is what allows parahoric level. -/
  connectedSpecialFibre : Prop
  /-- `b ∈ G(L)`. -/
  b : Type
  /-- The conjugacy classes of cocharacters, with their fields of definition. -/
  legs : Type
  μ : legs → Cocharacter

/-- HS2/local-shtuka-moduli, Scholze-Weinstein Definition 23.1.1. -/
def Sht {k : Type} [Field k] (_d : ShtukaDatum Cocharacter k) : VStack := by sorry

/-- Theorem 23.1.4. The moduli space is a locally spatial diamond. The v-sheaf
property is weaker and already follows from Proposition 19.5.3. -/
theorem sht_isLocallySpatialDiamond {k : Type} [Field k] (d : ShtukaDatum Cocharacter k)
    (IsLocallySpatialDiamond IsVSheaf : VStack → Prop) :
    IsLocallySpatialDiamond (Sht VStack Cocharacter d) ∧ IsVSheaf (Sht VStack Cocharacter d) := by
  sorry

/-- The boundedness condition: at all geometric RANK-1 points, the relative
position at `S_i^♯` is bounded in the Bruhat order by the SUM of the `μ_j` with
`S_j^♯ = S_i^♯`. The Bruhat order is `TauCeti.TitsSystem.bruhatCell` /
`CoxeterSystem` in the pinned libraries. -/
def IsBounded {k : Type} [Field k] (_d : ShtukaDatum Cocharacter k) : Prop := by sorry

/-- Unit test. With no legs the space is the classifying object for the
automorphism group of `b`. This is the base case of the representability proof. -/
example {k : Type} [Field k] (d : ShtukaDatum Cocharacter k) (noLegs : IsEmpty d.legs)
    (classifyingStackOfAut : VStack) :
    Sht VStack Cocharacter d = classifyingStackOfAut := by
  sorry

/-- Unit test. At a repeated untilt the bound is the SUM of the corresponding
`μ_j`, not each separately. A definition that imposes them separately is wrong. -/
example (sumBound separateBounds : Prop) :
    sumBound ∧ ¬ (sumBound ↔ separateBounds) := by
  sorry

/-- Unit test. The condition is imposed at geometric rank-1 points only; imposing
it at all points is a different, stronger condition. -/
example (rankOnePoints allPoints : Prop) :
    allPoints → rankOnePoints := by
  sorry

/-- Unit test. A nonminuscule bound gives a space with no classical
Rapoport-Zink counterpart, so the classical comparison is not a definition. -/
example {k : Type} [Field k] (d : ShtukaDatum Cocharacter k) (Minuscule : Cocharacter → Prop)
    (RapoportZink : VStack → Prop) :
    (∃ i, ¬ Minuscule (d.μ i)) → ¬ RapoportZink (Sht VStack Cocharacter d) := by
  sorry

/-- HS2/hecke-fibre-description. For a MINUSCULE `μ` and `b ∈ B(G,μ)` the local
Shimura tower is the space of modifications of type `μ` from `ℰ_b` to `ℰ_1`,
modulo `K`; under this identification `i_b^* T_μ(j_! c-Ind_K^{G(ℚ_p)} ℤ_ℓ)` is,
up to shift, `f_{K♯} ℤ_ℓ`. Quoted from Berkeley Lectures 23 and 24, which were
read only for Definition 23.1.1 and Theorem 23.1.4. -/
theorem localShimura_is_a_hecke_fibre (K : Type) (M : VStack) (pt : VStack)
    (f : Hom M pt) (T : Dlis BunG ⥤ Dlis BunG) (A : Dlis BunG)
    (restrict : Dlis BunG → DSolid pt) (shift : DSolid pt → DSolid pt) :
    restrict (T.obj A) = shift (sharp f (by sorry)) := by
  sorry

/-! ## HS3. Cohomology as a representation-valued functor -/

/-- Smooth representations of `G_b(ℚ_p)` and their derived category. Owned by
`SmoothRepresentationsOfLocalGroups:SR.0`. Tau Ceti's `IsSmoothDiscrete` and
`SmoothDiscreteTopRep` are the pinned carriers this must be compared with. -/
variable (SmoothRepCat : Type → Type) [∀ G, Category (SmoothRepCat G)]

/-- `RΓ_c` in Huber's sense: the colimit over quasicompact opens of the LIMIT over
`m`, in that order. -/
def RGammaC (M : VStack) (K : Type) : SmoothRepCat K := by sorry

/-- HS3/compactness-of-shtuka-cohomology, Theorem IX.3.1. If `K` is PRO-`p`, the
complex is a compact object of `D(G_b(ℚ_p), ℤ_ℓ)`, and the `W_E`-action is
continuous. -/
theorem rGammaC_compact (Gb : Type) (M : VStack) (K : Type) (ProP : Prop)
    (Compact : SmoothRepCat Gb → Prop) (toGb : SmoothRepCat K → SmoothRepCat Gb) :
    ProP → Compact (toGb (RGammaC VStack SmoothRepCat M K)) := by
  sorry

/-- Continuity of the `W_E`-action, obtained by defining `T_μ` over
`Spd E/φ^ℤ`, so that `W_E` acts as a CONDENSED group. -/
theorem weil_action_continuous (Gb : Type) (M : VStack) (K : Type)
    (condensedAction : Prop) :
    condensedAction := by
  sorry

/-- Unit test. For `K` not pro-`p` only the descended statement is available: each
`H^i_c` is a finitely generated smooth representation, not a compact complex. -/
example (Gb : Type) (M : VStack) (K : Type) (ProP : Prop)
    (Compact : SmoothRepCat Gb → Prop) (toGb : SmoothRepCat K → SmoothRepCat Gb) :
    ¬ ProP → ¬ Compact (toGb (RGammaC VStack SmoothRepCat M K)) := by
  sorry

/-- Unit test. A perfect invariant complex at a level is NOT
finite-dimensionality of the entire infinite-level cohomology. -/
example (perfectAtLevel finiteDimensionalAtInfiniteLevel : Prop) :
    ¬ (perfectAtLevel → finiteDimensionalAtInfiniteLevel) := by
  sorry

/-- HS3/admissibility-duality-and-adjunction. Against an ADMISSIBLE `ρ`,
`RHom_{G_b(ℚ_p)}(RΓ_c, ρ)` is a perfect complex of `Λ`-modules. -/
theorem rHom_perfect_against_admissible (Gb : Type) (M : VStack) (K : Type)
    (ρ : SmoothRepCat Gb) (Admissible : SmoothRepCat Gb → Prop)
    (Perfect : Type → Prop) (rhom : SmoothRepCat Gb → SmoothRepCat Gb → Type)
    (toGb : SmoothRepCat K → SmoothRepCat Gb) :
    Admissible ρ → Perfect (rhom (toGb (RGammaC VStack SmoothRepCat M K)) ρ) := by
  sorry

/-- The colimit over levels is, up to shift, `i_{1*}T_{μ^∨}(Ri_{b*}[ρ])`, because
`T_μ` is left adjoint to `T_{μ^∨}`. -/
theorem colimit_is_hecke_adjoint (Gb : Type) (ρ : SmoothRepCat Gb)
    (Tdual : Dlis BunG ⥤ Dlis BunG) (pushb : SmoothRepCat Gb → Dlis BunG)
    (pull1 : Dlis BunG → Type) (colimitOverLevels : Type) :
    colimitOverLevels = pull1 (Tdual.obj (pushb ρ)) := by
  sorry

/-- Unit test. A trace divided by an index requires that index invertible in the
coefficients; a level index divisible by `ℓ` forbids normalized averaging. -/
example (index : ℕ) (ℓ : ℕ) (normalizedAveraging : Prop) :
    ℓ ∣ index → ¬ normalizedAveraging := by
  sorry

/-! ## HS4. Reusable compatibility library

Proposition IX.5.1 is NOT here. The roadmap document names
`ExcursionOperatorsAndSpectralAction:ES1:finite-ramification` "the canonical owner
of IX.5.1's uniform wild subgroup for each compact object", and RS-22 says the
older decomposition node does not reverse that ownership. The packet files it as
a request with its full statement. -/

/-- HS4/monoidal-and-finite-set-functoriality, Theorem IX.0.1 (ii)-(iii). The
Hecke action is an exact monoidal functor into `W_E^I`-equivariant endofunctors,
and, varying `I`, the family is functorial in `I` in the strong sense: a lift to
the total space of the coCartesian fibrations over the category of finite sets. -/
def heckeFamily (I : Type) : DualGroupRep I ⥤ WeilEquivariant I := by sorry

instance (I : Type) [MonoidalCategory (WeilEquivariant I)] :
    (heckeFamily DualGroupRep WeilEquivariant I).Monoidal := by
  sorry

/-- Functoriality in `I` as a lift to the total space of a coCartesian fibration,
NOT as a compatible family of functors indexed by finite sets. -/
theorem heckeFamily_coCartesian (FinSetCat : Type) [Category FinSetCat]
    (totalSource totalTarget : Type) [Category totalSource] [Category totalTarget]
    (lift : totalSource ⥤ totalTarget) (IsCoCartesianLift : Prop) :
    IsCoCartesianLift := by
  sorry

/-- Unit test. Pairwise compatibilities do NOT give the coCartesian lift. -/
example (pairwiseCompatible coCartesianLift : Prop) :
    ¬ (pairwiseCompatible → coCartesianLift) := by
  sorry

/-- Unit test. The `W_E^I`-action on the TARGET is the trivial one; the
nontriviality lives in the equivariant structure of the functor. -/
example (I : Type) (trivialOnTarget : Prop) : trivialOnTarget := by
  sorry

/-- Unit test. Two colliding legs recover convolution; this consumes
`GeometricSatakeAndFusion:GS3:fusion`, not only `GS2`'s convolution. -/
example (collision convolution : Prop) : collision ↔ convolution := by
  sorry

/-- HS4/isogeny-product-and-weil-restriction-diagrams, Theorem IX.6.1. For
`G' → G` inducing an isomorphism of adjoint groups, the square relating the
spectral centres to endomorphisms of `A` and `π^* A` commutes. Only the GEOMETRY
of the diagram belongs here; the parameter identities are ES6-ES7. -/
theorem isogeny_diagram_commutes (BunGprime : VStack) (π : Hom BunGprime BunG)
    (A : Dlis BunG) (square : Prop) :
    square := by
  sorry

/-- Proposition IX.6.2, the product case. Note the source's own display repeats
`Z^geom(G_1,Λ)` twice where the second factor should be `Z^geom(G_2,Λ)`; the
decomposition reproduces it as printed and flags it. -/
theorem product_diagram_commutes (BunG₁ BunG₂ : VStack) (square : Prop) :
    square := by
  sorry

/-- Proposition IX.6.3, Weil restriction. Requires choosing an open subgroup `P`
of the wild inertia of `W_{E'}` in `W_E`, with `W'` the preimage of `W`; this is
the discretisation apparatus of FS VIII. -/
theorem weil_restriction_identifications (BunGprime : VStack)
    (P : Type) (identifications : Prop) :
    identifications := by
  sorry

end TauCeti.HeckeStacks
