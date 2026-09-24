/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/GeometricSatakeAndFusion--GS0.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-GeometricSatakeAndFusion--GS0: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

SCOPE. This is the first part of the roadmap: GS0 with its three substages, GS1,
and GS2 with its two substages. Fusion (GS3) and the dual group (GS4) belong to
the other part and are not stated here.

What is REUSED from the pinned libraries rather than restated:
`CategoryTheory.Triangulated.TStructure` with its `Heart` (so only the relative
perverse normalisation is defined below), `PerfectRing` and `Perfection`,
`AlgebraicGeometry.IsProper`, `ValuationRing`, `CoxeterSystem`, `RootPairing`,
`CategoryTheory.LeftRigidCategory`, `WittVector`, and Tau Ceti's
`AlgebraicGeometry.InvertibleSheaf` and `TitsSystem.bruhatCell`.

What is ABSENT at both pins, and so appears as opaque parameters: ampleness,
nefness and semiampleness of a line bundle, the exceptional locus of a nef
bundle, and Keel's criterion. The only `Ample` in Mathlib is `AmpleSet` in convex
analysis, which is a different notion. No roadmap of the atlas owns positivity
either; the packet records this as a gap and proposes an owner. Also absent: loop
groups, affine Grassmannians, perfectoid spaces and diamonds, which are requested
from `RelativeFarguesFontaine`, `BunGAndNewtonStrata`, `ReductiveGroupsPartII`,
`DiamondSixOperations`, `EtaleDualityAndPerverseSheaves`,
`VStackSheavesAndLisseCategories` and `EnhancedDerivedSheaves`.

Nothing below encodes a missing theorem as an assumed structure field.
-/
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.FieldTheory.Perfect
import Mathlib.RingTheory.Perfection
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.GroupTheory.Coxeter.Basic
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Triangulated.TStructure.Basic
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.RingTheory.Flat.Basic
import Mathlib.Algebra.Module.Projective

noncomputable section

open CategoryTheory

namespace TauCeti.GeometricSatake

/-! ## GS0:loop-geometry. Integral divisors and bounded modifications -/

/-- Small v-sheaves and v-stacks. Owned by `DiamondsAndVStacks`. -/
variable (VSheaf : Type) (Hom : VSheaf → VSheaf → Type)

/-- The INTEGRAL divisor space `Div^d_𝒴`. Owned by
`RelativeFarguesFontaine:RF0:integral-Y` and `RF2:integral-divisors`. The point of
using `𝒴` rather than `Y` is that the Cartier divisor `π = 0` is included, where
`B^+_dR(C^♯) = W_{O_E}(C)`. -/
variable (Div : ℕ → VSheaf)

/-- The rings `B^+` and `B` attached to `S → Div^d_𝒴`. Owned by
`RelativeFarguesFontaine:RF2:untilts`. -/
variable (Bplus B : VSheaf → Type)

/-- GS0:loop-geometry/loop-groups-and-local-hecke. The positive loop space of an
AFFINE scheme `Z` over `O_E`. Affineness is what makes this a v-sheaf; the source
does not pursue the general case. -/
def positiveLoopSpace (d : ℕ) (_Z : Type) : VSheaf := by sorry

/-- The loop space. -/
def loopSpace (d : ℕ) (_Z : Type) : VSheaf := by sorry

/-- Unit test. Affineness of `Z` is needed: the v-sheaf property is proved by
reduction to the structure sheaf, and the source declines the general case. -/
example (d : ℕ) (Z : Type) (Affine : Type → Prop) (IsVSheaf : VSheaf → Prop) :
    ¬ (∀ Z : Type, IsVSheaf (positiveLoopSpace VSheaf d Z)) := by
  sorry

/-- The local Hecke stack: pairs of `G`-bundles on `Spec B^+` with an isomorphism
over `Spec B`. A small v-stack. -/
def localHecke (d : ℕ) : VSheaf := by sorry

/-- The Beilinson–Drinfeld Grassmannian: a `G`-bundle on `Spec B^+` with a
trivialisation over `Spec B`. -/
def grassmannian (d : ℕ) : VSheaf := by sorry

/-- Proposition VI.1.7. As ÉTALE stacks over `Div^d`,
`Hck = L⁺G \ LG / L⁺G` and `Gr = LG/L⁺G`. The presentation is étale, obtained
after étale-local trivialisation of `G`-bundles over `B^+`; it is not a v-stack
presentation. -/
theorem localHecke_presentation (d : ℕ) (doubleQuotient : VSheaf)
    (EtaleIso : VSheaf → VSheaf → Prop) :
    EtaleIso (localHecke VSheaf d) doubleQuotient := by
  sorry

/-- Unit test. The presentation is for the étale topology; asserting it v-locally
is a strictly stronger and unproved statement. -/
example (d : ℕ) (doubleQuotient : VSheaf) (VIso : VSheaf → VSheaf → Prop) :
    ¬ VIso (localHecke VSheaf d) doubleQuotient := by
  sorry

/-- Unit test. Over `Div^d_X` the functor is defined only on the affinoid `S` with
`D_S` affinoid — a basis of the site, not all objects. -/
example (d : ℕ) (definedOnABasis definedOnAll : Prop) :
    definedOnABasis ∧ ¬ definedOnAll := by
  sorry

/-- The principal congruence subgroups
`(L⁺G)^{≥m} = ker(G(B^+) → G(B^+/I_S^m))`. -/
def congruenceSubgroup (d m : ℕ) : VSheaf := by sorry

/-- Proposition VI.1.11. For `m ≥ 1` the graded piece is
`Lie G ⊗_{O_E} I_S^m/I_S^{m+1}`, where `I_S^m/I_S^{m+1}` is a LINE BUNDLE on `D_S`
and need not be trivial; the identification uses the exponential, hence needs
`m ≥ 1`. It is representable in locally spatial diamonds, partially proper and
cohomologically smooth of `ℓ`-dimension `d · dim G`. -/
theorem congruence_gradedPiece (d m : ℕ) (hm : 1 ≤ m)
    (LieAlgTwist : VSheaf) (CohSmooth : VSheaf → Prop) (lDim : VSheaf → ℚ)
    (dimG : ℕ) :
    CohSmooth LieAlgTwist ∧ lDim LieAlgTwist = (d * dimG : ℚ) := by
  sorry

/-- Unit test. The exponential needs `m ≥ 1`; at `m = 0` the quotient is `G^◊`,
not a Lie-algebra piece. -/
example (d : ℕ) (Gdiamond LieAlgTwist : VSheaf) :
    Gdiamond ≠ LieAlgTwist := by
  sorry

/-- Unit test. The Breuil–Kisin twist is by a line bundle that need not be free,
so a definition that trivialises it is wrong on a general base. -/
example (twistIsFree : Prop) : ¬ twistIsFree := by
  sorry

/-- Proposition VI.2.2–VI.2.7. For `G` split, relative position at a geometric
point is a dominant cocharacter; the bounded loci are CLOSED subfunctors, `Hck` is
their colimit, and `Gr_{G,Div^d,≤μ∙} → Div^d_𝒴` is proper and representable in
spatial diamonds of finite `dim.trg`. -/
variable (Cochar : Type) (dominanceLE : Cochar → Cochar → Prop)

def boundedLocus (d : ℕ) (_μ : Cochar) : VSheaf := by sorry

theorem boundedLocus_closed (d : ℕ) (μ : Cochar)
    (ClosedSub : VSheaf → VSheaf → Prop) :
    ClosedSub (boundedLocus VSheaf Cochar d μ) (localHecke VSheaf d) := by
  sorry

theorem boundedLocus_proper (d : ℕ) (μ : Cochar)
    (Proper : ∀ {X Y : VSheaf}, Hom X Y → Prop) (f : Hom (boundedLocus VSheaf Cochar d μ) (Div d)) :
    Proper f := by
  sorry

/-- Unit test. The index category of the `μ` is a DISJOINT UNION over `π₁(G)` of
filtered posets, not a single filtered poset. -/
example (pi1 : Type) (singleFilteredPoset disjointUnionOfFiltered : Prop) :
    disjointUnionOfFiltered ∧ ¬ singleFilteredPoset := by
  sorry

/-- Unit test, Remark VI.2.1. The Cartier divisor `π = 0` is included, and there
`B^+_dR(C^♯) = W_{O_E}(C)`. Deleting it deletes the characteristic-`p` fibre the
whole comparison of GS1 rests on. -/
example (k : Type) [CommRing k] (includesPiZero : Prop) : includesPiZero := by
  sorry

/-! ## GS0:Schubert-smoothness. Early geometric return to Bun_G -/

/-- Proposition VI.2.4 (= Proposition IV.1.18). The open Schubert cell
`Gr_{G,Div¹,μ} = L⁺G/(L⁺G)_μ` is cohomologically smooth of `ℓ`-dimension
`⟨2ρ,μ⟩`. Fargues–Scholze state IV.1.18 in Chapter IV and defer the proof here,
so the `Bun_G` chart of `VStackSheavesAndLisseCategories` consumes this layer. -/
theorem openCell_cohomologicallySmooth (μ : Cochar) (openCell : VSheaf)
    (CohSmooth : VSheaf → Prop) (lDim : VSheaf → ℚ) (twoRhoPair : Cochar → ℚ) :
    CohSmooth openCell ∧ lDim openCell = twoRhoPair μ := by
  sorry

/-- The stabilizer's first congruence quotient is `(P_μ^-)^◊`, the parabolic with
Lie algebra the weight-`≤ 0` part; the higher ones are the weight-`≤ m` parts. -/
theorem stabilizer_congruence_quotients (μ : Cochar) (m : ℕ)
    (stabQuotient parabolicDiamond weightLE : VSheaf) :
    stabQuotient = parabolicDiamond := by
  sorry

/-- Unit test. For a minuscule `μ` of `GL₂`, `⟨2ρ,μ⟩ = 1`. -/
example (μ : Cochar) (twoRhoPair : Cochar → ℚ) (Minuscule : Cochar → Prop) :
    Minuscule μ → twoRhoPair μ = 1 := by
  sorry

/-- Unit test. The section `[μ]` is independent of the chosen local generator `ξ`
only UP TO the action of `L⁺G`. -/
example (μ : Cochar) (independentOfXi independentUpToLplusG : Prop) :
    independentUpToLplusG ∧ ¬ independentOfXi := by
  sorry

/-- Proposition VI.2.8, the truncation lemma. The action of `L⁺G` on
`Gr_{G,Div^d,≤μ∙}` factors through `(L⁺G)^{<m}`, where `m` bounds the weights of
`μ = Σ_j μ_j` on `Lie G`. The bound is by the weights on the Lie algebra, NOT by
`⟨2ρ,μ⟩`. This is what puts the bounded loci in the Artin-stack setting. -/
theorem loopAction_factors_through_truncation (d : ℕ) (μ : Cochar) (m : ℕ)
    (weightBound : Cochar → ℕ) (factorsThrough : ℕ → Prop) :
    m = weightBound μ → factorsThrough m := by
  sorry

/-- Unit test. The bound depends on `Σ_j μ_j`, not on the individual `μ_j`. -/
example (μ₁ μ₂ sum : Cochar) (weightBound : Cochar → ℕ) :
    weightBound sum = weightBound sum := by
  sorry

/-! ## GS0:Witt-geometry. Projectivity and the special-fibre comparison -/

/-- Bhatt–Scholze's category `Perf` of perfect qcqs `F_p`-schemes with the
v-topology. `PerfectRing` and `Perfection` are pinned; the category is not. -/
variable (Perf : Type) [Category Perf]

/-- GS0:Witt-geometry/witt-lattice-functor-and-representability, Theorem 8.3.
`Gr_{≤λ}` sends `X ∈ Perf` to the finite projective `W(O_X)`-submodules
`E ⊆ W(O_X)^n` whose defining inclusion is an isogeny with cokernel of type
`≤ λ`. It is representable by a PROPER PERFECTLY FINITELY PRESENTED `F_p`-scheme
with a natural AMPLE line bundle, hence is the perfection of a projective scheme.

`R` must be PERFECT: for a general `F_p`-algebra `W(R)` may have `p`-torsion and
`W(R)/p → R` may fail to be an isomorphism. -/
variable (Lambda : Type)
def GrWitt (_λ : Lambda) : AlgebraicGeometry.Scheme := by sorry

theorem grWitt_representable (lam : Lambda)
    (PerfectlyFinitelyPresented Ample : AlgebraicGeometry.Scheme → Prop)
    (isProper : Prop) :
    PerfectlyFinitelyPresented (GrWitt Lambda lam) ∧ isProper := by
  sorry

/-- Unit test. Perfectly finitely presented is NOT finite type; Bhatt–Scholze
record it as an open question whether a natural finite-type structure exists
beyond the minuscule cells. -/
example (lam : Lambda) (FiniteType PerfectlyFinitelyPresented : AlgebraicGeometry.Scheme → Prop) :
    ¬ (∀ lam : Lambda, PerfectlyFinitelyPresented (GrWitt Lambda lam) →
        FiniteType (GrWitt Lambda lam)) := by
  sorry

/-- Unit test. The minuscule cells ARE canonically perfections of classical
Grassmannians, which is the one case where the finite-type structure is known. -/
example (lam : Lambda) (Minuscule : Lambda → Prop)
    (isPerfectionOfClassicalGrassmannian : Lambda → Prop) :
    Minuscule lam → isPerfectionOfClassicalGrassmannian lam := by
  sorry

/-- Unit test. Theorem 8.3 (type `≤ λ` on `Perf`) and Theorem 1.1 (lattices
between `p^a W(R)^n` and `p^b W(R)^n` on perfect RINGS) are not literally the same
statement; the translation between them was not read. -/
example (theorem83 theorem11 : Prop) : ¬ (theorem83 ↔ theorem11) := by
  sorry

/-- Theorem 1.2. A vector bundle on a perfect `F_p`-scheme is an h-sheaf with
`H^i_h(X,E) = H^i(X,E)`, and effective descent holds along h-covers of PERFECT
schemes. The h-topology is subcanonical on perfect schemes and not in general. -/
theorem h_descent_for_vectorBundles (X : AlgebraicGeometry.Scheme)
    (IsPerfectScheme : AlgebraicGeometry.Scheme → Prop)
    (effectiveDescent : Prop) :
    IsPerfectScheme X → effectiveDescent := by
  sorry

/-- Theorem 6.8, the fibral criterion. For `f` proper perfectly finitely presented
with `Rf_*O_X = O_Y`, a bundle `E` descends to `Y` iff it is trivial on every
geometric fibre. Remark 1.4 records that the published Theorem 1.3 weakens the
hypothesis to connectedness of the geometric fibres. -/
theorem fibral_descent_criterion (X Y : AlgebraicGeometry.Scheme)
    (f : X ⟶ Y) (pushforwardTrivial : Prop) (E : Type)
    (DescendsTo TrivialOnEveryGeometricFibre : Prop) :
    pushforwardTrivial → (DescendsTo ↔ TrivialOnEveryGeometricFibre) := by
  sorry

/-- Unit test. The h-topology statement FAILS for non-perfect schemes. -/
example (X : AlgebraicGeometry.Scheme) (IsPerfectScheme : AlgebraicGeometry.Scheme → Prop)
    (hSheaf : Prop) :
    ¬ IsPerfectScheme X → ¬ hSheaf := by
  sorry

/-- Keel's Theorem 1.9. For a NEF line bundle on a scheme PROJECTIVE over a field
of POSITIVE CHARACTERISTIC, `L` is semi-ample iff `L|_{E(L)}` is. It is false in
characteristic zero, and it applies only to projective schemes, so Bhatt–Scholze
apply it to the Demazure resolution and not to `Gr_{≤λ}` directly.

None of `Nef`, `SemiAmple`, `Ample` or `exceptionalLocus` exists at either pin;
they are parameters here, and the packet proposes an owner for them. -/
theorem keel_semiampleness (X : AlgebraicGeometry.Scheme) (L : Type)
    (Nef SemiAmple : Type → Prop) (exceptionalLocus : Type → Type)
    (ProjectiveOverPositiveCharacteristicField : AlgebraicGeometry.Scheme → Prop) :
    ProjectiveOverPositiveCharacteristicField X → Nef L →
      (SemiAmple L ↔ SemiAmple (exceptionalLocus L)) := by
  sorry

/-- Unit test. Keel's criterion genuinely needs positive characteristic. -/
example (X : AlgebraicGeometry.Scheme) (L : Type) (Nef SemiAmple : Type → Prop)
    (charZero : Prop) :
    charZero → ¬ (Nef L → SemiAmple L) := by
  sorry

/-- Unit test. There is no direct section-theoretic route: Bhatt–Scholze say they
are not able to give a direct construction of enough sections of `L` giving a
projective embedding, so Keel's criterion is not optional. -/
example (directSectionConstruction : Prop) : ¬ directSectionConstruction := by
  sorry

/-- Propositions VI.3.7–VI.3.8. In the Witt vector affine Grassmannian, the
semi-infinite orbit meets a bounded locus in an AFFINE scheme, equidimensional of
dimension `⟨ρ, μ+λ⟩`. The affineness proof STARTS from the ample bundle, which is
why this layer owns the projectivity input. -/
theorem mv_cycles_affine_equidimensional (lam μ : Cochar)
    (S : AlgebraicGeometry.Scheme) (IsAffine : AlgebraicGeometry.Scheme → Prop)
    (dim : AlgebraicGeometry.Scheme → ℚ) (rhoPair : Cochar → Cochar → ℚ) :
    IsAffine S ∧ dim S = rhoPair μ lam := by
  sorry

/-! ## GS1. Semi-infinite geometry and constructibility -/

variable (Coeff : Type) [CommRing Coeff]
variable (Det : VSheaf → Type) [∀ X, Category (Det X)]

/-- Proposition VI.3.1. The semi-infinite orbits stratify `Gr`; the `G_m`-action
via `λ` extends to an `A¹`-action whose fixed points are `Gr_{M_λ}`. -/
theorem semiInfinite_stratification (d : ℕ) (lam : Cochar)
    (bijectiveOnGeometricPoints locallyClosed fixedPointsAreLevi : Prop) :
    bijectiveOnGeometricPoints ∧ locallyClosed ∧ fixedPointsAreLevi := by
  sorry

/-- The hyperbolic-localization constant term, defined on `G_m`-MONODROMIC bounded
complexes, where the two correspondences agree. -/
def constantTerm (d : ℕ) (X Y : VSheaf) : Det X ⥤ Det Y := by sorry

/-- Proposition VI.4.2. For `B` a Borel and `A` with support quasicompact over
`S`, `CT_B(A) = 0` forces `A = 0`. -/
theorem constantTerm_conservative (d : ℕ) (X Y : VSheaf) (A : Det X)
    (zeroX : Det X) (zeroY : Det Y) (Borel quasicompactSupport : Prop) :
    Borel → quasicompactSupport → (constantTerm VSheaf Det d X Y).obj A = zeroY → A = zeroX := by
  sorry

/-- Unit test. `G_m`-monodromicity is needed for the comparison map; without it
the two correspondences need not agree. -/
example (monodromic comparisonIso : Prop) : ¬ (comparisonIso → monodromic) → False := by
  sorry

/-- GS1/relative-perverse-t-structure. The unique t-structure on the bounded
category with `A ∈ ^pD^{≤0}` iff at every geometric point and every open Schubert
cell the pullback sits in degrees `≤ - Σ_{i=1}^r ⟨2ρ, μ_i⟩`, where `r` is the
number of DISTINCT untilts.

The abstract notion is pinned as `CategoryTheory.Triangulated.TStructure`; what is
planned here is this normalisation. -/
def relativePerverse (d : ℕ) (X : VSheaf) [CategoryTheory.Pretriangulated (Det X)]
    [CategoryTheory.HasShift (Det X) ℤ] [CategoryTheory.Preadditive (Det X)]
    [CategoryTheory.Limits.HasZeroObject (Det X)] :
    CategoryTheory.Triangulated.TStructure (Det X) := by
  sorry

/-- Unit test. The shift runs over the DISTINCT untilts `r`, not over the number
of legs `d`; at coincident legs the two differ. -/
example (d r : ℕ) (coincidentLegs : Prop) : coincidentLegs → r < d := by
  sorry

/-- Proposition VI.7.4. `CT_B[deg]` is t-exact from this t-structure to the
standard one on `Gr_T`, and conservative. `CT_B` alone is not t-exact. -/
theorem constantTerm_shifted_tExact (d : ℕ) (X Y : VSheaf)
    (shifted tExact : Prop) : shifted → tExact := by
  sorry

/-- Unit test. `CT_B` without the shift is not t-exact; dropping `deg` breaks the
characterisation of `^pD^{≥0}`. -/
example (unshiftedTExact : Prop) : ¬ unshiftedTExact := by
  sorry

/-- Proposition VI.6.5, the one-leg stalkwise criterion. For split `G` and `d = 1`
a bounded `A` is ULA over `S` iff its restriction along every section `[μ]` is
locally constant with perfect fibres. -/
theorem ula_stalkwise_criterion (X : VSheaf) (A : Det X) (IsULA : Det X → Prop)
    (restrictionLocallyConstantPerfect : Cochar → Prop) :
    IsULA A ↔ ∀ μ : Cochar, restrictionLocallyConstantPerfect μ := by
  sorry

/-- Corollary VI.6.7. Over a complete algebraically closed `C` with residue field
`k`, the restriction functors between the ULA categories over `Spd O_C`, `Spd C`
and `Spd k` are EQUIVALENCES. The middle term is over the INTEGRAL divisor space;
replacing `𝒴` by `Y` deletes the right-hand term. -/
theorem integral_family_comparison (HckOC HckC Hckk : VSheaf)
    (DULA : VSheaf → Type) [∀ X, Category (DULA X)] :
    Nonempty (DULA HckOC ≌ DULA HckC) ∧ Nonempty (DULA HckOC ≌ DULA Hckk) := by
  sorry

/-- Unit test. A formal analogy between the two Grassmannians does NOT give this
equivalence; it is a theorem about the integral family. -/
example (formalAnalogy theEquivalence : Prop) : ¬ (formalAnalogy → theEquivalence) := by
  sorry

/-! ## GS2:correspondences. Objects and convolution before t-exactness -/

/-- GS2:correspondences/satake-category-and-fibre-functor, Definition VI.7.8. The
full subcategory of objects that are universally locally acyclic AND FLAT
PERVERSE. Both conditions are part of the definition, and the combination is what
is invariant under `sw^*`. -/
def Sat (d : ℕ) (X : VSheaf) : Type := by sorry

instance (d : ℕ) (X : VSheaf) : Category (Sat VSheaf d X) := by sorry

/-- Unit test. Flatness over `Λ` is not automatic: over `Λ = ℤ/ℓ²` a perverse ULA
object need not be flat, and dropping flatness breaks `sw`-invariance. -/
example (d : ℕ) (X : VSheaf) (A : Det X) (IsULA FlatPerverse Perverse : Det X → Prop) :
    ¬ (∀ A, IsULA A → Perverse A → FlatPerverse A) := by
  sorry

/-- Definition/Proposition VI.7.10. The fibre functor
`F_{G,S} = ⊕_i H^i(Rπ_{G,S*})` is exact, faithful and conservative, and the `H^i`
are local systems of FINITE PROJECTIVE `Λ`-modules. -/
def fibreFunctor (d : ℕ) (X S : VSheaf) : Sat VSheaf d X ⥤ Det S := by sorry

theorem fibreFunctor_faithful (d : ℕ) (X S : VSheaf) :
    (fibreFunctor VSheaf Det d X S).Faithful := by
  sorry

/-- Unit test. `F_{G,S}` is faithful but NOT full; a Tannakian argument assuming
fullness is not the source's. -/
example (d : ℕ) (X S : VSheaf) :
    ¬ (fibreFunctor VSheaf Det d X S).Full := by
  sorry

/-- Unit test. The decomposition theorem — and with it the degeneration to the
Witt vector affine Grassmannian — enters ONLY in the `ℓ^{a(μ)}` bound on the
kernel and cokernel of the map from the standard to the costandard object. -/
example (usedOnlyForTheBound usedEarlier : Prop) :
    usedOnlyForTheBound ∧ ¬ usedEarlier := by
  sorry

/-- GS2:correspondences/convolution-diagram. Convolution by pull–push; formally
composition in the 2-category `C_T` of FS IV.2.3.3, EXTENDED to maps that are
ind-representable in locally spatial diamonds with closed immersions in the
ind-system, using bounded sheaves as morphisms. -/
def convolution (d : ℕ) (X : VSheaf) : Det X → Det X → Det X := by sorry

/-- Proposition VI.8.1 (i),(ii). Convolution preserves universal local acyclicity
and `^pD^{≤0}`. Before the closure theorem, nothing more is known. -/
theorem convolution_preserves_ula_and_rightExact (d : ℕ) (X : VSheaf)
    (A₁ A₂ : Det X) (IsULA RightExact : Det X → Prop) :
    (IsULA A₁ → IsULA A₂ → IsULA (convolution VSheaf Det d X A₁ A₂)) ∧
    (RightExact A₁ → RightExact A₂ → RightExact (convolution VSheaf Det d X A₁ A₂)) := by
  sorry

/-- Unit test. The 2-category has to be extended to ind-representable maps;
applying the representable formalism directly is the error the source corrects. -/
example (representableFormalismSuffices : Prop) : ¬ representableFormalismSuffices := by
  sorry

/-! ## GS2:Satake-closure. Closure after fusion

The atlas records `GS3:fusion → GS2:Satake-closure`. The source proves it the
other way: VI.8.1(iii) and VI.8.2 are in section VI.8, before VI.9 on fusion, and
it is VI.9 that consumes them. The packet proposes correcting the edge. -/

/-- Proposition VI.8.1 (iii). Convolution preserves the Satake category, deduced
from (i), (ii) and the commutation of convolution with Verdier duality. -/
theorem convolution_preserves_sat (d : ℕ) (X : VSheaf) (A₁ A₂ : Sat VSheaf d X) :
    Nonempty (Sat VSheaf d X) := by
  sorry

/-- Proposition VI.8.2. Every object of `Sat` is left and right dualizable, with
right dual `sw^* D(A)`. THIS is the single hypothesis from which every formal
property of the Hecke operators in `HeckeStacksAndLocalShtukas` follows. Fusion is
not used in its proof. -/
theorem sat_objects_dualizable (d : ℕ) (X : VSheaf)
    [MonoidalCategory (Sat VSheaf d X)] (A : Sat VSheaf d X)
    (Dualizable : Sat VSheaf d X → Prop) (swDual : Sat VSheaf d X → Sat VSheaf d X) :
    Dualizable A := by
  sorry

/-- Unit test. The right dual of `^p j_{μ!}Λ[d_μ]` is the expected object for the
dual cocharacter. -/
example (d : ℕ) (X : VSheaf) (μ μdual : Cochar)
    (standard : Cochar → Sat VSheaf d X) (swDual : Sat VSheaf d X → Sat VSheaf d X) :
    swDual (standard μ) = standard μdual := by
  sorry

/-- Unit test. This closure is used only AFTER the fusion construction by its
consumers, but its own proof does not use fusion — which is why the atlas edge
`GS3:fusion → GS2:Satake-closure` points the wrong way. -/
example (provedWithoutFusion consumedByFusion : Prop) :
    provedWithoutFusion ∧ consumedByFusion := by
  sorry

end TauCeti.GeometricSatake
