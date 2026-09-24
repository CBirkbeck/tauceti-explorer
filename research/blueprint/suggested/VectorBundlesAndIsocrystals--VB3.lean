/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/VectorBundlesAndIsocrystals--VB3.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can
converge on names and signatures. They claim no implementation.

BP-VectorBundlesAndIsocrystals--VB3: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

SCOPE. Second part of the roadmap: VB3 with its three substages, and VB4. VB0,
VB1 and VB2 belong to the other part (issue #1002).

The Banach–Colmez space itself had NO node in the reviewed decomposition,
although every theorem here is about it and the stage text asks for it. One was
added, from Fargues–Scholze Definition I.3.5 (printed p. 19) and the two-term
definition after Proposition II.2.1 (printed p. 58), both read directly in this
session from a file whose SHA-256 reproduces byte for byte. Note what the source
says immediately after Definition I.3.5: "Implicit here is that this functor
actually defines a locally spatial diamond." REPRESENTABILITY IS A THEOREM OF
THIS LAYER, NOT PART OF THE DEFINITION — so `BC` below is a v-sheaf and local
spatiality is a separate statement.

REUSED from the pinned libraries. The contracting-action lemma is the one node
with a substantial carrier: it is pure general topology, and Mathlib has
`SpectralSpace`, `PrespectralSpace`, `QuasiSober`, `Specializes`, `CompactSpace`
and `TotallyDisconnectedSpace`, while Tau Ceti has
`ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`. Also `WittVector` and
`WittVector.Isocrystal`.

ABSENT at both pins: Harder–Narasimhan filtrations, semistability, slopes,
ampleness, and every diamond, perfectoid space and v-sheaf. Those are requested
from `RelativeFarguesFontaine`, `DiamondsAndVStacks`, `DiamondSixOperations` and
`PerfectoidSpaces`, and the slope formalism from the other part of this roadmap.
-/
import Mathlib.Topology.Spectral.Basic
import Mathlib.Topology.Spectral.Prespectral
import Mathlib.Topology.Sober
import Mathlib.Topology.Defs.Filter
import Mathlib.Topology.Connected.TotallyDisconnected
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Abelian.Basic
import Mathlib.CategoryTheory.Equivalence
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.Module.Projective

noncomputable section

open CategoryTheory

namespace TauCeti.BanachColmez

/-! ## Carriers requested from other roadmaps and from the other part -/

/-- Perfectoid spaces over `F_q`, and the v-site `Perf_S`. Owned by
`DiamondsAndVStacks` and `PerfectoidSpaces`. -/
variable (Perf : Type) [Category Perf]

/-- The Fargues–Fontaine curve `X_S` and its bundles. Owned by
`RelativeFarguesFontaine`; the slope formalism is in the other part of this
roadmap. -/
variable (Curve : Perf → Type) (Bundle : ∀ S, Curve S → Type)

/-- v-sheaves on `Perf_S`. -/
variable (VSheaf : Perf → Type)

/-! ## VB3:positive-basic-examples. The independent local calculation -/

/-- FS Definition I.3.5, printed p. 19. The Banach–Colmez space of a vector
bundle: the v-sheaf on `Perf_S` with `BC(ℰ)(T) = H⁰(X_T, ℰ|_{X_T})`.

NOT a diamond by definition — the source says "Implicit here is that this functor
actually defines a locally spatial diamond", and then computes examples. -/
def BC (S : Perf) (X : Curve S) (_E : Bundle S X) : VSheaf S := by sorry

/-- The NEGATIVE Banach–Colmez space, `BC(ℰ[1])(T) = H¹(X_T, ℰ|_{X_T})`. Defined
only when `ℰ` is everywhere of only negative Harder–Narasimhan slopes. -/
def BCneg (S : Perf) (X : Curve S) (_E : Bundle S X) (_negativeSlopes : Prop) :
    VSheaf S := by
  sorry

/-- The two-term form, from after Proposition II.2.1, printed p. 58. For a
complex `[ℰ_1 → ℰ_0]` in homological degrees `[0,1]` with
`H⁰(X_T, ℰ_1|_{X_T}) = 0` for ALL `T ∈ Perf_S`,
`BC([ℰ_1 → ℰ_0])(T) = H⁰(X_T, [ℰ_1 → ℰ_0]|_{X_T})`. -/
def BCcomplex (S : Perf) (X : Curve S) (_E₁ _E₀ : Bundle S X)
    (_vanishesForAllT : Prop) : VSheaf S := by
  sorry

/-- The projectivized Banach–Colmez space `(BC(ℰ) ∖ {0})/E^×`. -/
def BCproj (S : Perf) (X : Curve S) (E : Bundle S X) : VSheaf S := by sorry

/-- Unit test. `BC(O_{X_S})` is the constant sheaf `E` — part (ii) of the
cohomology-of-twists theorem. A definition giving anything else is wrong at the
simplest point. -/
example (S : Perf) (X : Curve S) (structureSheaf : Bundle S X) (constantE : VSheaf S) :
    BC Perf Curve Bundle VSheaf S X structureSheaf = constantE := by
  sorry

/-- Unit test. With `ℰ_1 = 0` the two-term definition recovers `BC(ℰ_0)`. -/
example (S : Perf) (X : Curve S) (zero E₀ : Bundle S X) (h : Prop) :
    BCcomplex Perf Curve Bundle VSheaf S X zero E₀ h =
      BC Perf Curve Bundle VSheaf S X E₀ := by
  sorry

/-- Unit test. The vanishing hypothesis is for ALL `T ∈ Perf_S`; imposing it only
at `T = S` leaves an `H^{-1}` and the functor is not the one defined. -/
example (forAllT atSOnly : Prop) : forAllT → atSOnly := by
  sorry

/-- Unit test. Representability is NOT assumed. A signature that builds a diamond
into the definition cannot state this layer's theorems. -/
example (isVSheafByDefinition isDiamondByTheorem : Prop) :
    isVSheafByDefinition ∧ isDiamondByTheorem := by
  sorry

/-- Unit test. `BC(O_{X_C}(-1)[1])` is NOT representable by a perfectoid space,
and Fargues–Scholze's proof of the classification theorem relies on that negative
fact. A construction that always produces one contradicts it. -/
example (representableByPerfectoid : Prop) : ¬ representableByPerfectoid := by
  sorry

/-- FS II.2.2. `X ↦ Σ_{i ∈ ℤ} π^i [X^{q^{-i}}]` is a natural isomorphism
`G̃(R^{♯+}) = R^{∘∘} → H⁰(X_S, O(1)) = H⁰(Y_S, O_{Y_S})^{φ=π}`, and evaluation at
the untilt is the logarithm `log_G`. -/
theorem lubinTate_universal_cover (S : Perf) (X : Curve S)
    (universalCover sections : Type) (iso : Prop) (evaluationIsLog : Prop) :
    iso ∧ evaluationIsLog := by
  sorry

/-- FS II.2.3–II.2.4. The fundamental exact sequence
`0 → O_{X_S} → O_{X_S}(1) → O_{S^♯} → 0`, and the induced isomorphism
`(BC(O(1)) ∖ {0})/E^× = Div¹`. -/
theorem fundamental_exact_sequence (S : Perf) (X : Curve S) (exact : Prop) :
    exact := by
  sorry

theorem projectivized_BC_one_is_Div1 (S : Perf) (X : Curve S) (Div1 : VSheaf S)
    (O1 : Bundle S X) :
    BCproj Perf Curve Bundle VSheaf S X O1 = Div1 := by
  sorry

/-! ## VB3:projectivized-properness. The input to families -/

/-- FS II.2.16. `BC(ℰ)` is a locally spatial diamond, partially proper over `S`,
and its projectivization is proper.

The proof uses ONLY ampleness (II.2.6) and the positive-twist statement
II.2.5(iii) — NOT the classification theorem. The stage text asks for those two
branches to stay distinct in the stage graph. -/
theorem BC_isLocallySpatial_and_proj_isProper (S : Perf) (X : Curve S) (E : Bundle S X)
    (IsLocallySpatialDiamond PartiallyProper Proper : VSheaf S → Prop) :
    IsLocallySpatialDiamond (BC Perf Curve Bundle VSheaf S X E) ∧
      PartiallyProper (BC Perf Curve Bundle VSheaf S X E) ∧
      Proper (BCproj Perf Curve Bundle VSheaf S X E) := by
  sorry

/-- Unit test. The properness proof does NOT use the classification theorem;
routing it through the classification would make the roadmap circular. -/
example (usesAmpleness usesClassification : Prop) :
    usesAmpleness ∧ ¬ usesClassification := by
  sorry

/-- FS II.2.17, the contracting-action lemma. Pure general topology: let `X` be a
taut locally spectral space in which the generalizations of every point form a
TOTALLY ORDERED CHAIN under specialization, and `γ` an automorphism whose
fixed-point set `X₀` is spectral, with `γ^n(x) → X₀` as `n → +∞` and, for `x`
outside `X₀`, `γ^n(x)` leaving every quasicompact open as `n → -∞`. Then `X₀` is
closed, `γ` acts freely and totally discontinuously on `X ∖ X₀`, and
`(X ∖ X₀)/γ^ℤ` is a spectral space.

Mathlib has `SpectralSpace`, `PrespectralSpace`, `QuasiSober` and `Specializes`;
what is missing is tautness, the chain condition, and the statement itself. -/
theorem contracting_action (X : Type) [TopologicalSpace X]
    (Taut LocallySpectral : Type → Prop)
    (chainCondition : ∀ x : X, Prop)
    (γ : X ≃ₜ X) (X₀ : Set X) (fixedPointsSpectral contracting escaping : Prop)
    (quotientIsSpectral fixedLocusClosed actsFreely : Prop) :
    Taut X → LocallySpectral X → (∀ x, chainCondition x) →
      fixedPointsSpectral → contracting → escaping →
      fixedLocusClosed ∧ actsFreely ∧ quotientIsSpectral := by
  sorry

/-- Unit test. The chain condition on generalizations is essential: on a space
where the generalizations of a point are not totally ordered the conclusion
fails. -/
example (chainCondition conclusion : Prop) :
    ¬ chainCondition → ¬ conclusion := by
  sorry

/-- Unit test. Both directions of the dynamics are needed — contraction towards
`X₀` as `n → +∞` AND escape from every quasicompact open as `n → -∞`. -/
example (contracting escaping conclusion : Prop) :
    contracting → ¬ escaping → ¬ conclusion := by
  sorry

/-! ## VB3:general-BC. General bundles after classification -/

/-- FS II.3.1 and Corollary II.3.3. A bundle whose HN slopes are all `≥ 1/r` at
all geometric points admits, locally in the analytic topology,
`0 → O_{X_S}^m → ℱ → ℰ → 0` with `ℱ` fibrewise semistable of degree `1/r`; and
when all slopes are positive, an étale-local `0 → 𝒢 → O(1/r)^m → ℰ → 0`. -/
theorem positive_slope_resolution (S : Perf) (X : Curve S) (E : Bundle S X) (r : ℕ)
    (slopesAtLeastOneOverR : Prop) (resolutionExists : Prop) :
    slopesAtLeastOneOverR → resolutionExists := by
  sorry

/-- FS II.3.5. For `[ℰ_1 → ℰ_0]` with `ℰ_1` of only NEGATIVE slopes at all
geometric points, `BC([ℰ_1 → ℰ_0])` is a locally spatial diamond partially proper
over `S` and its projectivization is proper; and if moreover `ℰ_0` has only
POSITIVE slopes, the map to `S` is cohomologically smooth.

Negative for representability, positive for smoothness: the two hypotheses do
different work and neither can be dropped. -/
theorem families_of_BC (S : Perf) (X : Curve S) (E₁ E₀ : Bundle S X)
    (negativeSlopes positiveSlopes vanishes : Prop)
    (IsLocallySpatialDiamond Proper CohSmooth : VSheaf S → Prop) :
    negativeSlopes →
      IsLocallySpatialDiamond (BCcomplex Perf Curve Bundle VSheaf S X E₁ E₀ vanishes) ∧
      (positiveSlopes → CohSmooth (BCcomplex Perf Curve Bundle VSheaf S X E₁ E₀ vanishes)) := by
  sorry

/-- Unit test. Without the negative-slope hypothesis on `ℰ_1` the representability
conclusion fails. -/
example (S : Perf) (X : Curve S) (E₁ E₀ : Bundle S X) (vanishes : Prop)
    (negativeSlopes : Prop) (IsLocallySpatialDiamond : VSheaf S → Prop) :
    ¬ negativeSlopes →
      ¬ IsLocallySpatialDiamond (BCcomplex Perf Curve Bundle VSheaf S X E₁ E₀ vanishes) := by
  sorry

/-- FS II.3.6–II.3.7. `(Div¹)^d → Div^d` is a quasi-pro-étale cover identifying
`Div^d = (Div¹)^d/Σ_d`, so `Div^d` is a diamond. For an isocrystal of PURE SIGN,
the punctured absolute Banach–Colmez space is a SPATIAL diamond and its quotient
by `E^×` is proper, representable in spatial diamonds and cohomologically
smooth. -/
theorem Div_d_isDiamond (d : ℕ) (IsDiamond : Type → Prop) (Divd : Type) :
    IsDiamond Divd := by
  sorry

theorem absolute_BC_spatiality (D : Type) (pureSign : Prop)
    (IsSpatialDiamond : Type → Prop) (puncturedBC : Type) :
    pureSign → IsSpatialDiamond puncturedBC := by
  sorry

/-- Unit test. The isocrystal must be of PURE sign; a mixed-slope isocrystal does
not give a spatial diamond by this argument. -/
example (mixedSign spatial : Prop) : mixedSign → ¬ spatial := by
  sorry

/-! ## VB4. Families and HN strata -/

/-- FS II.2.19(i). The Harder–Narasimhan polygon is UPPER SEMICONTINUOUS on a
family of constant rank, and its endpoint is locally constant. -/
theorem hn_polygon_upperSemicontinuous (S : Perf) (X : Curve S) (E : Bundle S X)
    (n : ℕ) (polygon : Type) (UpperSemicontinuous : Prop) (endpointLocallyConstant : Prop) :
    UpperSemicontinuous ∧ endpointLocallyConstant := by
  sorry

/-- FS II.2.19(ii). On a constant-polygon locus there is a global separated
exhaustive decreasing HN filtration specialising to the pointwise one; and after
a PRO-ÉTALE cover it splits, with `ℰ^λ ≅ O_{X_S}(λ)^{n_λ}`.

Pro-étale, not étale. The stage text requires the distinction. -/
theorem relative_hn_filtration (S : Perf) (X : Curve S) (E : Bundle S X)
    (constantPolygon : Prop) (globalFiltrationExists : Prop)
    (splitsAfterProEtaleCover : Prop) :
    constantPolygon → globalFiltrationExists ∧ splitsAfterProEtaleCover := by
  sorry

/-- Unit test. The splitting is after a PRO-ÉTALE cover; an étale cover does not
suffice, and a formalisation that says étale overstates the theorem. -/
example (proEtaleSplits etaleSplits : Prop) :
    proEtaleSplits ∧ ¬ etaleSplits := by
  sorry

/-- FS II.2.20. Pro-étale `E`-local systems are equivalent to bundles of constant
HN polygon `0`, via `L ↦ L ⊗_E O_{X_S}`. -/
theorem slope_zero_is_local_systems (S : Perf) (X : Curve S)
    (LocSys SlopeZeroBundles : Type) [Category LocSys] [Category SlopeZeroBundles] :
    Nonempty (LocSys ≌ SlopeZeroBundles) := by
  sorry

/-- Unit test. The equivalence is with bundles whose polygon is constant ZERO,
not merely semistable of slope zero at each point separately; constancy in the
family is part of the statement. -/
example (constantZeroPolygon pointwiseSemistableSlopeZero : Prop) :
    constantZeroPolygon → pointwiseSemistableSlopeZero := by
  sorry

/-- Unit test, the carried gap. The dominance convention for the polygon is fixed
in Fargues–Scholze only through the convex-hull description, and the comparison
with Fargues–Fontaine's concave convention was not made. A polygon read the other
way makes semicontinuity point the wrong way. -/
example (convexHullConvention concaveConvention : Prop) :
    ¬ (convexHullConvention ↔ concaveConvention) → True := by
  sorry

end TauCeti.BanachColmez
