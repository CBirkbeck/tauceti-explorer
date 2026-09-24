/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/BunGAndNewtonStrata.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-BunGAndNewtonStrata: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

THIS IS A FIRST READING. The roadmap has no integrated decomposition, so every
statement below was written from Fargues–Scholze read directly in this session
(SHA-256 reproduces byte for byte): I.4, the whole of Chapter III, IV.1.13–23 and
V.3.2–V.3.7.

REUSED from the pinned libraries. The best find is Tau Ceti's DYNAMIC METHOD —
`Cocharacter.parabolic`, `Cocharacter.levi`, `Cocharacter.unipotent`,
`Cocharacter.leviGroupExtension` — which is exactly the algebraic content of
Proposition III.5.2, the heart of BG3. Also `WittVector.Isocrystal` (the `GL_n`
case of a `G`-isocrystal for `E = Q_p`), `RootPairing` for `ρ` and the dominance
order, `CoxeterSystem` and `TauCeti.TitsSystem.bruhatCell` for the Cartan
decomposition, `Specializes` and `SpectralSpace`, and
`TauCeti.ReductiveAffineGroupSchemeCat`.

ABSENT at both pins: perfectoid spaces, diamonds, v-stacks, Banach–Colmez spaces,
and `π_1(G)` in the Borovoi–Kottwitz sense. They appear as opaque parameters and
are requested from `RelativeFarguesFontaine`, `VectorBundlesAndIsocrystals`,
`DiamondsAndVStacks`, `DiamondSixOperations`, `ReductiveGroupsPartII`,
`GeometricSatakeAndFusion` and `VStackSheavesAndLisseCategories`.

SIGNS TO WATCH, all recorded in the packet's unit tests:
  · the functor `Isoc_E → Bun(X_S)` REVERSES slopes;
  · `G̃_b` has dimension `+⟨2ρ,ν_b⟩`, the stratum `Bun^b_G` has `ℓ`-dimension
    `−⟨2ρ,ν_b⟩`;
  · the filtration of `G̃_b` uses POSITIVE Banach–Colmez spaces, the chart `q_b`
    the OPPOSITE parabolic and NEGATIVE ones;
  · `|Gr_G| → |Bun_G| → π_1(G)` is the OPPOSITE of the natural map.
-/
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.LinearAlgebra.RootSystem.Defs
import Mathlib.GroupTheory.Coxeter.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Monoidal.Functor
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Defs.Filter
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.Algebra.Module.Projective

noncomputable section

open CategoryTheory

namespace TauCeti.BunG

/-! ## Carriers requested from other roadmaps -/

/-- The nonarchimedean local field `E` with residue field `F_q`, and the
completion `Ĕ = W_{O_E}(k)[1/π]` with its Frobenius `σ`. -/
variable (E Ebreve : Type) [Field E] [Field Ebreve] (σ : Ebreve ≃+* Ebreve)

/-- A connected reductive group over `E`. `TauCeti.ReductiveAffineGroupSchemeCat`
is the pinned carrier; ramified and nonsplit `G` are the cases the roadmap
requires. -/
variable (G : Type)

/-- Perfectoid spaces over `k`, the curve `X_S`, vector bundles on it, and
v-stacks. Owned by `DiamondsAndVStacks` and `RelativeFarguesFontaine`. -/
variable (Perf : Type) [Category Perf] (Curve : Perf → Type)
variable (Bun : ∀ S, Curve S → Type) (VStack : Type)

/-- The category of isocrystals over `Ĕ`. Owned by
`VectorBundlesAndIsocrystals:VB0`; Mathlib has its `E = Q_p` case as
`WittVector.Isocrystal`. -/
variable (Isoc : Type) [Category Isoc] [MonoidalCategory Isoc]

/-- `Rep_E G`, the source of every tensor-functor here. -/
variable (RepG : Type) [Category RepG] [MonoidalCategory RepG]

/-! ## BG0. Torsors and isocrystals with reductive structure -/

/-- FS III.1.1. On a sousperfectoid `X` over `E`, geometric, cohomological and
Tannakian `G`-torsors agree, and a `G`-BUNDLE IS an exact `⊗`-functor
`Rep_E G → Bun(X)`. In particular `G`-torsors up to isomorphism are classified by
`H^1_et(X,G)`. -/
theorem three_descriptions (X : Type) (Geom Coh Tann : Type)
    [Category Geom] [Category Coh] [Category Tann] (sousperfectoid : Prop) :
    sousperfectoid → Nonempty (Geom ≌ Coh) ∧ Nonempty (Coh ≌ Tann) := by
  sorry

/-- Unit test. For `G = GL_n` all three are rank-`n` vector bundles. -/
example (n : ℕ) (allThreeAreRankN : Prop) : allThreeAreRankN := by sorry

/-- Unit test. The classification is by the ÉTALE and not the v-topology. -/
example (etaleClassification vClassification : Prop) :
    etaleClassification ∧ ¬ (etaleClassification ↔ vClassification) := by
  sorry

/-- BG0/g-isocrystals-and-B-of-G, FS III.2.1. A `G`-isocrystal is an exact
`⊗`-functor `Rep_E G → Isoc_E`; `B(G)` is the set of isomorphism classes. By
STEINBERG's theorem the underlying fibre functor is standard, which identifies
`B(G)` with `G(Ĕ)` modulo `b ∼ g b σ(g)⁻¹`. -/
def GIsocrystal : Type := RepG ⥤ Isoc

def BofG : Type := by sorry

/-- The identification with σ-conjugacy classes. Without Steinberg's theorem the
two sets are different objects. -/
theorem BofG_eq_sigmaConjugacy (sigmaConjugacyClasses : Type) (steinberg : Prop) :
    steinberg → Nonempty (BofG Isoc RepG ≃ sigmaConjugacyClasses) := by
  sorry

/-- `E_b`, the `G`-bundle attached to `b`, by composing with the SLOPE-REVERSING
functor `Isoc_E → Bun(X_S)` of `RelativeFarguesFontaine:RF3`. -/
def bundleOf (S : Perf) (X : Curve S) (_b : BofG Isoc RepG) : Bun S X := by sorry

/-- Unit test. `B(G_m) = ℤ`, with `E_n = O(n)` up to the slope sign. -/
example (torusCase : Prop) : torusCase := by sorry

/-- Unit test. The relation is `b' = g b σ(g)⁻¹`; the opposite convention changes
`G_b` and every later formula. -/
example (b b' g : Type) (correctOrientation flippedOrientation : Prop) :
    correctOrientation ∧ ¬ (correctOrientation ↔ flippedOrientation) := by
  sorry

/-- BG0/sigma-centralizer-J-b. `G_b(R) = {g ∈ G(R ⊗_E Ĕ) : g b = b σ(g)}`, a
reductive group over `E`; an inner form of a Levi when `G` is quasisplit; and
`G_b ×_E Ĕ` is the centraliser of the slope homomorphism `ν_b : D → G_Ĕ` — an
ISOMORPHISM onto `G_Ĕ` exactly when `b` is basic. -/
def sigmaCentralizer (b : BofG Isoc RepG) : Type := by sorry

theorem sigmaCentralizer_isInnerLevi (b : BofG Isoc RepG) (quasisplit isInnerLevi : Prop) :
    quasisplit → isInnerLevi := by
  sorry

theorem sigmaCentralizer_basic_iso (b : BofG Isoc RepG) (IsBasic : BofG Isoc RepG → Prop)
    (isIsoOverEbreve : Prop) :
    IsBasic b → isIsoOverEbreve := by
  sorry

/-- Unit test. For `GL_n` and an isoclinic isocrystal, `G_b(E)` is the unit group
of the associated division algebra — the roadmap's basic-division-algebra test. -/
example (divisionAlgebraUnits : Prop) : divisionAlgebraUnits := by sorry

/-- Unit test. `b` is basic iff `ν_b` is central, and exactly then is `G_b` an
inner form of `G` itself rather than of a proper Levi. -/
example (b : BofG Isoc RepG) (IsBasic : BofG Isoc RepG → Prop)
    (newtonCentral innerFormOfG : Prop) :
    IsBasic b ↔ newtonCentral := by
  sorry

/-- FS III.4.1. In any topos, `Aut(T)` of an `H`-torsor is the pure inner twisting
of `H` by `T`, and `Isom(−,T) : [∗/H] → [∗/H_T]` is an EQUIVALENCE. Applied with
`T = E_b` for basic `b` it gives `Bun_G ≅ Bun_{G_b}` and `Bun^b_G ≅ Bun^1_{G_b}`. -/
theorem pure_inner_twisting (H T HT : Type) (isPureInnerTwisting : Prop)
    (BH BHT : Type) [Category BH] [Category BHT] :
    isPureInnerTwisting ∧ Nonempty (BH ≌ BHT) := by
  sorry

/-! ## BG1. Kottwitz and Newton invariants -/

/-- The universal Cartan and the dominant rational cocharacters. `RootPairing` is
the pinned carrier for `ρ`, the dominance order and the lattice. -/
variable (DominantRationalCochar Pi1G : Type)

/-- BG1/newton-and-kottwitz-maps. `ν : B(G) → (X_*(T)^+_Q)^Γ` from the slope
morphism; `κ : B(G) → π_1(G)_Γ`, defined INDIRECTLY through tori, simply connected
derived group and z-extensions. -/
def newton : BofG Isoc RepG → DominantRationalCochar := by sorry
def kottwitz : BofG Isoc RepG → Pi1G := by sorry

/-- Kottwitz: `(κ,ν)` is INJECTIVE. Quoted by Fargues–Scholze and proved nowhere
in anything read; the roadmap makes it a proof obligation of this layer. -/
theorem kottwitz_newton_injective :
    Function.Injective (fun b => (kottwitz Isoc RepG Pi1G b,
      newton Isoc RepG DominantRationalCochar b)) := by
  sorry

/-- `κ` restricts to a BIJECTION on basic classes. -/
theorem kottwitz_basic_bijection (IsBasic : BofG Isoc RepG → Prop)
    (Basic : Type) (restriction : Basic → Pi1G) :
    Function.Bijective restriction := by
  sorry

/-- Unit test. For a torus, `B(T) = X_*(T)_Γ` and `κ` is the identity; there are
no nontrivial order relations, which is the whole first proof of local constancy. -/
example (torusHasTrivialOrder : Prop) : torusHasTrivialOrder := by sorry

/-- Unit test. `κ` must not depend on the chosen z-extension. The roadmap makes
this explicit and Fargues–Scholze do not reprove it. -/
example (zExtensionIndependent : Prop) : zExtensionIndependent := by sorry

/-- BG1/partial-order-on-B-of-G. `b ≤ b'` iff `κ(b) = κ(b')` AND `ν(b) ≤ ν(b')`.
Equality of `κ`, not a relation: classes with different Kottwitz invariants are
incomparable. -/
def leB (b b' : BofG Isoc RepG) : Prop := by sorry

instance : PartialOrder (BofG Isoc RepG) := by sorry

/-- The order topology: the order on the Newton side, the DISCRETE topology on the
Kottwitz side. The ambient space is T0 and an increasing union of finite open
subspaces. -/
instance : TopologicalSpace (BofG Isoc RepG) := by sorry

/-- Unit test. Continuity of `|Bun_G| → B(G)` is what this roadmap owns. The
HOMEOMORPHISM is Conjecture III.2.15 in the source, proved later by Viehmann; a
formalisation asserting it goes beyond this roadmap. -/
example (continuous homeomorphism : Prop) : continuous ∧ ¬ homeomorphism := by
  sorry

/-- FS III.2.11. `B^ab(G) = π_1(G)_Γ`, identifying `κ` with the abelianisation
map — the form in which the SECOND, independent proof of local constancy runs. -/
theorem abelianization_identification (Bab : Type) :
    Nonempty (Bab ≃ Pi1G) := by
  sorry

/-! ## BG2:uniformization. The stack and its cover -/

/-- BG2:uniformization/bun-g-as-v-stack. `Bun_G : S ↦ {groupoid of G-bundles on
X_S}`, a v-stack by `VB1`'s v-descent, and SMALL. -/
def BunG : VStack := by sorry

theorem BunG_small (small : Prop) : small := by sorry

/-- Unit test. `Bun_{GL_1} = Pic` is the disjoint union over `ℤ` of `[∗/E^×]`; a
construction giving a connected object is wrong. -/
example (GL1case : Prop) : GL1case := by sorry

/-- FS III.2.2. Over a complete algebraically closed `C`, `b ↦ E_b` is a
BIJECTION `B(G) → Bun_G(C)/≅`. On isomorphism classes only. -/
theorem points_are_BofG (C : Type) (pointsModIso : Type) :
    Nonempty (BofG Isoc RepG ≃ pointsModIso) := by
  sorry

/-- FS III.2.4. The geometrically fibrewise trivial locus is OPEN and
`[∗/G(E)] → Bun^1_G` is an ISOMORPHISM, where `[∗/G(E)]` classifies PRO-ÉTALE
torsors. The source notes it cannot conclude from the pointwise bijection because
qcqs is unclear. -/
theorem trivial_locus (BunOne classifyingStack : VStack) (isOpen isIso : Prop) :
    isOpen ∧ isIso := by
  sorry

/-- FS III.2.6. On a strictly totally disconnected perfectoid space, every
pro-étale torsor under a FIRST-COUNTABLE locally profinite group is trivial. -/
theorem proetale_torsor_trivial (S : Perf) (H : Type)
    (stronglyDisconnected firstCountable trivial : Prop) :
    stronglyDisconnected → firstCountable → trivial := by
  sorry

/-- FS III.2.3 and III.2.7. `ν` is UPPER SEMICONTINUOUS (imported from
Scholze–Weinstein) and `κ` is LOCALLY CONSTANT — the hardest part of the chapter,
proved twice.

The two proofs are NOT independent: the first defers Lemma III.2.10 to the
Beauville–Laszlo section. The second, through `B^ab(G) = π_1(G)`, is. -/
theorem newton_upperSemicontinuous (upperSemicontinuous : Prop) :
    upperSemicontinuous := by
  sorry

theorem kottwitz_locallyConstant (locallyConstant : Prop) : locallyConstant := by
  sorry

/-- Unit test. In the torus case semicontinuity degenerates to local constancy —
which is the entire first proof. -/
example (torusCase : Prop) : torusCase := by sorry

/-- FS III.3.1. The Beauville–Laszlo morphism `Gr_G → Bun_G` is surjective as a
map of PRO-ÉTALE stacks — stronger than v-locally. -/
theorem beauville_laszlo_surjective (Gr : VStack) (proEtaleSurjective : Prop) :
    proEtaleSurjective := by
  sorry

/-- Unit test, FS III.3.6(ii). The composite `|Gr_G| → |Bun_G| → π_1(G)` is the
OPPOSITE of the natural decomposition map; the sign makes the component count come
out right. -/
example (isOpposite : Prop) : isOpposite := by sorry

/-! ## BG2:smooth-Artin. The whole stack, not only its strata -/

/-- FS IV.1.20. The sheaf of surjections, resp. isomorphisms, of two bundles is an
OPEN SUBDIAMOND of `BC(E_1^∨ ⊗ E_2)` — the whole proof being that the support of a
cokernel is closed. -/
theorem isom_sheaf_open_in_BC (S : Perf) (X : Curve S) (E₁ E₂ : Bun S X)
    (BCspace IsomSheaf : Type) (isOpenSubdiamond : Prop) :
    isOpenSubdiamond := by
  sorry

/-- FS IV.1.19 (= Theorem I.4.1 (vii)). `Bun_G` is a cohomologically smooth Artin
v-stack of `ℓ`-dimension 0, with the Beauville–Laszlo charts
`⊔_μ [G(E)\Gr_{G,≤μ}] → Bun_G ×_k Spd E` separated cohomologically smooth.

NOTE: the STATEMENT of IV.1.19 is damaged in the extraction used here; its PROOF
was read in full and the conclusion is quoted from Theorem I.4.1 (vii). -/
theorem BunG_isSmoothArtin (IsArtinVStack CohSmooth : VStack → Prop)
    (lDim : VStack → ℚ) :
    IsArtinVStack (BunG VStack) ∧ CohSmooth (BunG VStack) ∧ lDim (BunG VStack) = 0 := by
  sorry

/-- The diagonal, by Tannaka and CHEVALLEY: a faithful `ρ : G → GL_n`, a further
`ρ'`, and a line whose stabiliser is `G`, reducing to `GL_n` and then to
Lemma IV.1.20. -/
theorem BunG_diagonal_representable (representableInLocallySpatialDiamonds : Prop) :
    representableInLocallySpatialDiamonds := by
  sorry

/-- Unit test. Surjectivity of the chart is the uniformization theorem — an INPUT,
not a consequence of the smoothness argument. -/
example (surjectivityIsAnInput : Prop) : surjectivityIsAnInput := by sorry

/-- FS IV.1.23. `κ : π₀(Bun_G) → π_1(G)_Γ` is a BIJECTION, proved by showing every
nonempty open subsheaf contains a BASIC point. -/
theorem connected_components (pi0 : Type) :
    Nonempty (pi0 ≃ Pi1G) := by
  sorry

/-! ## BG3. Basic and nonbasic strata -/

/-- FS III.4.5. The semistable locus is OPEN — because centrality of the Newton
point is a MINIMALITY condition — and is `⊔_{b basic} [∗/G_b(E)]`. -/
theorem semistable_locus (BunSS : VStack) (isOpen decomposes : Prop) :
    isOpen ∧ decomposes := by
  sorry

/-- BG3/full-automorphism-v-group, FS III.5.1. `G̃_b = G̃^{>0}_b ⋊ G_b(E)`, with
`G̃^{≥λ}_b/G̃^{>λ}_b ≅ BC` of the slope-`λ` isoclinic part of
`(Lie G ⊗ Ĕ, Ad(b)σ)`: an extension of `G_b(E)` by a successive extension of
POSITIVE Banach–Colmez spaces, of dimension `⟨2ρ,ν_b⟩`. -/
def autVGroup (b : BofG Isoc RepG) : Type := by sorry

theorem autVGroup_semidirect (b : BofG Isoc RepG) (semidirect : Prop) :
    semidirect := by
  sorry

theorem autVGroup_dimension (b : BofG Isoc RepG) (dim : ℚ) (twoRhoNu : ℚ) :
    dim = twoRhoNu := by
  sorry

/-- FS III.5.2, the algebraic heart. A `Q`-filtration on the fibre functor gives
smooth `H^{≥λ}` with `H^{≥0}` a PARABOLIC, `H^{>0}` its unipotent radical and
vector-group graded pieces.

Tau Ceti already has the cocharacter version: `Cocharacter.parabolic`,
`Cocharacter.levi`, `Cocharacter.unipotent`, `Cocharacter.leviGroupExtension`. -/
theorem dynamic_filtration (isParabolic hasUnipotentRadical vectorGroupGradeds : Prop) :
    isParabolic ∧ hasUnipotentRadical ∧ vectorGroupGradeds := by
  sorry

/-- Unit test. The connected kernel is trivial EXACTLY for basic `b`. A
construction that always gives `[∗/G_b(E)]` has dropped it and is wrong for
nonbasic `b` — which the roadmap forbids. -/
example (b : BofG Isoc RepG) (IsBasic : BofG Isoc RepG → Prop)
    (kernelTrivial : Prop) :
    IsBasic b ↔ kernelTrivial := by
  sorry

/-- FS III.5.3. For ANY `b`, `x_b : ∗ → Bun^b_G` is surjective and
`Bun^b_G = [∗/G̃_b]`; the map to `[∗/G_b(E)]` admits a SPLITTING. -/
theorem stratum_is_classifying_stack (b : BofG Isoc RepG) (stratum : VStack)
    (isClassifyingStack hasSplitting : Prop) :
    isClassifyingStack ∧ hasSplitting := by
  sorry

/-- FS IV.1.22. `Bun^b_G` is a cohomologically smooth Artin v-stack of
`ℓ`-dimension `−⟨2ρ,ν_b⟩` — the NEGATIVE of the v-group's dimension. -/
theorem stratum_dimension (b : BofG Isoc RepG) (stratum : VStack)
    (lDim : VStack → ℚ) (twoRhoNu : ℚ) :
    lDim stratum = -twoRhoNu := by
  sorry

/-- Unit test. The two signs: `G̃_b` has dimension `+⟨2ρ,ν_b⟩`, the stratum
`ℓ`-dimension `−⟨2ρ,ν_b⟩`. Confusing them flips every later count. -/
example (twoRhoNu : ℚ) (h : twoRhoNu ≠ 0) : twoRhoNu ≠ -twoRhoNu := by sorry

/-! ## BG4. Local charts and specialization geometry -/

/-- BG4/filtered-bundle-chart, FS V.3.2. `M` is the moduli of `G`-bundles with an
INCREASING SEPARATED EXHAUSTIVE `Q`-filtration of the fibre functor whose graded
pieces are semistable of matching slope; it decomposes over ALL of `B(G)`. -/
def M : VStack := by sorry
def Mb (b : BofG Isoc RepG) : VStack := by sorry
def qb (b : BofG Isoc RepG) : Type := by sorry

/-- Unit test. `M` decomposes over ALL of `B(G)`, not only the basic classes. -/
example (allOfBofG onlyBasic : Prop) : allOfBofG ∧ ¬ (allOfBofG ↔ onlyBasic) := by
  sorry

/-- FS V.3.5. `q_b : M_b → [∗/G_b(E)]` is partially proper, representable in
locally spatial diamonds and cohomologically smooth of dimension `⟨2ρ,ν_b⟩`; after
pullback a successive torsor under NEGATIVE Banach–Colmez spaces, because the
parabolic is the OPPOSITE of the one in III.5.1. -/
theorem qb_cohSmooth (b : BofG Isoc RepG) (partiallyProper cohSmooth : Prop)
    (dim twoRhoNu : ℚ) :
    partiallyProper ∧ cohSmooth ∧ dim = twoRhoNu := by
  sorry

/-- Unit test. POSITIVE Banach–Colmez spaces filter `G̃_b`; NEGATIVE ones appear
here, and the source says the parabolics are opposite. -/
example (positiveInAutGroup negativeInChart : Prop) :
    positiveInAutGroup ∧ negativeInChart := by
  sorry

/-- FS V.3.6. `q_b` has a section, the CLOSED substack where `E` is everywhere
`E_b`; the punctured chart `M̃^∘_b` is a SPATIAL diamond and `M̃^∘_b/U^ℤ → ∗` is
proper. -/
theorem section_and_spatial (b : BofG Isoc RepG)
    (sectionIsClosed isSpatial quotientIsProper : Prop) :
    sectionIsClosed ∧ isSpatial ∧ quotientIsProper := by
  sorry

/-- FS V.3.7. `π_b : M_b → Bun_G` is partially proper, representable in locally
spatial diamonds and cohomologically smooth of `ℓ`-dimension `⟨2ρ,ν_b⟩`; its image
is OPEN and is exactly the set of points specialising to `b`.

Its proof applies the JACOBIAN CRITERION of
`VStackSheavesAndLisseCategories:VS1` — the single place this roadmap consumes
it. -/
theorem pib_cohSmooth_open_image (b : BofG Isoc RepG)
    (cohSmooth imageIsOpen imageIsSpecializationLocus : Prop) :
    cohSmooth ∧ imageIsOpen ∧ imageIsSpecializationLocus := by
  sorry

/-- Unit test. The Jacobian criterion is used here and ONLY here; `Bun_G`'s
definition and the `B(G)` classification do not depend on it. -/
example (usedOnlyHere usedEarlier : Prop) : usedOnlyHere ∧ ¬ usedEarlier := by
  sorry

end TauCeti.BunG
