import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

/-!
# ClassicalAdicEtaleCohomology: representative target signatures

The roadmap is README.md. This file records lightweight definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. It uses the actual prime spectrum,
endomorphism ring and Tau Ceti valuation spectrum. The radial loci retain the plus ring and
valuative comparisons; open regions use supplied exhaustions. Sites, support functors and
analytic cohomology objects are targets in the README.
-/

namespace TauCetiRoadmap.ClassicalAdicEtaleCohomology

/-! ## Layer 1: Sheaves, supports and strict-local cohomology -/

/-! ## Layer 2: Henselian comparison and perfectoid approximation -/

/-! ## Layer 3: Preadic local systems and analytic covering spaces -/

/-! ## Layer 4: Formal specialization and semistable nearby cycles -/

namespace Semistable

/-- The first integer at or beyond the ramification threshold `pe/(p-1)`.
In the nearby-cycle application `p` is prime and `e` is the absolute ramification index. -/
def filtrationCutoff (p e : ℕ) : ℕ :=
  ⌈((p : ℚ) * e) / (p - 1)⌉₊

/-- The cutoff is `2e` in residue characteristic two, including ramified bases. -/
theorem filtrationCutoff_two (e : ℕ) : filtrationCutoff 2 e = 2 * e := by
  sorry

/-- Vanishing begins at the ceiling, not the floor, when the threshold is nonintegral. -/
example : filtrationCutoff 3 1 = 2 := by
  sorry

/-- At `p=2, e=3` the threshold is six, rather than two. -/
example : filtrationCutoff 2 3 = 6 := by
  sorry

end Semistable



/-! ## Layer 5: Nearby cycles over valuation rings -/

namespace Trait

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- The endomorphism underlying the variation of a left monodromy action. -/
def variation (u : Module.End R M) : Module.End R M := u - 1

/-- The noncommutative cocycle formula uses the order of the left action. -/
theorem variation_mul (u v : Module.End R M) :
    variation (u * v) = variation u + variation v + variation u * variation v := by
  sorry

/-- Trivial monodromy has zero variation. -/
example : variation (1 : Module.End R M) = 0 := by
  sorry

/-- The zero endomorphism has variation minus the identity. -/
example : variation (0 : Module.End R M) = -1 := by
  sorry

end Trait

/-! ## Layer 6: Valuation invariance, finiteness and supported exports -/

namespace ValuationBase

variable {A B : Type*} [CommRing A] [CommRing B]

/-- Surjectivity of the contravariant prime-spectrum map. The valuation-ring hypotheses
enter the equivalence below, not this predicate. -/
def IsSurjectiveValuationMap (φ : A →+* B) : Prop :=
  Function.Surjective (PrimeSpectrum.comap φ)

/-- For valuation domains, the spectrum condition is precisely injectivity and locality.
Fields are included as rank-zero valuation rings. -/
theorem isSurjectiveValuationMap_iff_injective_and_isLocalHom
    [IsDomain A] [ValuationRing A] [IsDomain B] [ValuationRing B] (φ : A →+* B) :
    IsSurjectiveValuationMap φ ↔ Function.Injective φ ∧ IsLocalHom φ := by
  sorry

/-- The identity is surjective on the full prime spectrum. -/
example : IsSurjectiveValuationMap (RingHom.id A) := by
  sorry

/-- Passing from the integers to their fraction field loses closed primes. -/
example : ¬ IsSurjectiveValuationMap (Int.castRingHom ℚ) := by
  sorry

end ValuationBase

/-! ## Layer 7: Geometric field extensions and connectedness -/

/-! ## Layer 8: Proper supports and the all-torsion calculus -/

/-! ## Layer 9: Berkovich comparison, traces and duality -/

/-! ## Layer 10: Radial cohomology and smooth families -/

open TauCeti ValuationSpectrum
open scoped ValuationSpectrum

namespace Radial

variable {A : Type*} [CommRing A] [TopologicalSpace A]

/-- The weak outer-radius condition in the actual adic spectrum. -/
def closedDisc (Aplus : Subring A) (T b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | v.toValuativeRel.vle T b}

/-- Removing the support of the coordinate gives a punctured closed-disc locus. -/
def puncturedDisc (Aplus : Subring A) (T b : A) : Set (Spv A) :=
  closedDisc Aplus T b ∩ {v | ¬ v.toValuativeRel.vle T 0}

/-- Both radius bounds are weak. In particular an equal-radius annulus is allowed. -/
def closedAnnulus (Aplus : Subring A) (T a b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | v.toValuativeRel.vle a T ∧ v.toValuativeRel.vle T b ∧
    ¬ v.toValuativeRel.vle T 0}

/-- Strict inequalities are the negations of reverse weak comparisons at every rank. -/
def strictAnnulus (Aplus : Subring A) (T a b : A) : Set (Spv A) :=
  spa Aplus ∩ {v | ¬ v.toValuativeRel.vle T a ∧ ¬ v.toValuativeRel.vle b T ∧
    ¬ v.toValuativeRel.vle T 0}

/-- An open annulus from a supplied cofinal exhaustion of closed annuli.
The set is defined for arbitrary sequences; analytic exhaustion hypotheses live in the README. -/
def openAnnulus (Aplus : Subring A) (T : A) (a b : ℕ → A) : Set (Spv A) :=
  ⋃ j, closedAnnulus Aplus T (a j) (b j)

/-- An open disc from a supplied cofinal exhaustion of closed discs. -/
def openDisc (Aplus : Subring A) (T : A) (b : ℕ → A) : Set (Spv A) :=
  ⋃ j, closedDisc Aplus T (b j)

/-- The zero coordinate satisfies the unit outer bound everywhere. -/
example (Aplus : Subring A) : closedDisc Aplus 0 1 = spa Aplus := by
  sorry

/-- A unit coordinate cannot satisfy the zero outer bound. -/
example (Aplus : Subring A) : closedDisc Aplus 1 0 = ∅ := by
  sorry

/-- Puncturing a zero coordinate removes every point. -/
example (Aplus : Subring A) (b : A) : puncturedDisc Aplus 0 b = ∅ := by
  sorry

/-- Puncturing the constant unit coordinate removes no point of its unit disc. -/
example (Aplus : Subring A) : puncturedDisc Aplus 1 1 = spa Aplus := by
  sorry

/-- Equal inner and outer unit radii include a unit-valued coordinate. -/
example (Aplus : Subring A) : closedAnnulus Aplus 1 1 1 = spa Aplus := by
  sorry

/-- The puncture is essential even with a zero inner radius. -/
example (Aplus : Subring A) : closedAnnulus Aplus 0 0 1 = ∅ := by
  sorry

/-- Equal strict inner and outer radii leave no point. -/
example (Aplus : Subring A) (T a : A) : strictAnnulus Aplus T a a = ∅ := by
  sorry

/-- A coordinate at the outer boundary is excluded from the strict locus. -/
example (Aplus : Subring A) : strictAnnulus Aplus 1 0 1 = ∅ := by
  sorry

/-- Constant exhaustion data gives the corresponding closed annulus, not a strict one. -/
example (Aplus : Subring A) (T a b : A) :
    openAnnulus Aplus T (fun _ => a) (fun _ => b) = closedAnnulus Aplus T a b := by
  sorry

/-- An exhaustion whose coordinate is identically zero remains punctured and empty. -/
example (Aplus : Subring A) (a b : ℕ → A) : openAnnulus Aplus 0 a b = ∅ := by
  sorry

/-- Constant disc exhaustion data retains the closed boundary. -/
example (Aplus : Subring A) (T b : A) :
    openDisc Aplus T (fun _ => b) = closedDisc Aplus T b := by
  sorry

/-- No stage with a zero outer bound contains the constant unit coordinate. -/
example (Aplus : Subring A) : openDisc Aplus 1 (fun _ => 0) = ∅ := by
  sorry

end Radial

/-! ## Layer 11: Analytification, compactification and boundary duality -/

/-
Further definitions specified in README.md:
Layer 1: EtaleSheaf, ProEtaleSheaf, EtaleDerived, derivedDirectImage, PseudoAdic,
Support, PseudoAdicSupportSpace, locallyClosedExtensionByZero, IsTorsionLocalSystem, IsClassicallyConstructible,
tateTwist, SupportedTildeLimit, EtaleDPlus, PseudoAdicSite, completedZp, LisseSheaf, IsLocallyConstant, IsConstructible.
Layer 2: IsHenselianFadic, FadicHenselization, AffinoidHenselization, RationalHenselization,
SpecialSubset, ProSpecialSubset, HenselizationAlongSupport, PseudoAdic.schemeFibreProduct,
henselianComparison, PerfectoidNoetherianModel, Huber.Triple, PerfectoidHuberApproximation.
Layer 3: PreadicIntegralLocalSystem, PreadicIsogenyLocalSystem, PreadicRationalLocalSystem,
BoundedLattice, AnalyticEtaleCover, AnalyticCoveringFiber, AnalyticEtaleFundamentalGroup,
AnalyticRationalLatticeCover, StrictAnalyticSpace, AnalyticTateQuotient, tautAdicBerkovichComparison, theta, IsTaut, IsOverconvergent.
Layer 4: FormalEtale, FormalEtaleSite, lambda, FormalPair, PairEtaleSite,
pairSpecialization, FormalStrictLocalization, CompletionComparisonData,
completionComparisonMap, MicrobialClosedFibreSupport, SemistableFormalScheme,
SemistableFormalNearbyCycles, FormalKummerSymbol, FormalBKHFiltration,
FormalBKHZeroSymbol, FormalBKHPositiveSymbol, FormalNearbySymbol, FormalBKHZeroSymbolMaps,
FormalBKHPositiveSymbolMaps, FormalScheme.StrictLocalisationSystem, FormalScheme.CompletionData,
FormalScheme.MicrobialBase.
Layer 5: ValuationQuadruple, ValuationQuadrupleHom, ValuationNearbyCycles,
NearbyCyclesGaloisAction, nearbyCyclesBaseChangeMap, GaussExtension,
AICGenericExtension, OrientedEtaleProduct, PlurinodalPresentation.
Layer 6: ValuationInvarianceComparison.
Layer 7: GeometricFieldPairExtension, PerfectoidFiniteTypeApproximation.
Layer 8: IsCompactifiable, UniversalCompactification, SCompactifiableFormalCurve,
LocallySCompactifiableFormalCurve, SemistableFormalCurveModel, RelativelyCompactRigidOpen,
PartiallyProperLowerShriek, ProperSupportDirectImage, FlatQuasiFiniteTrace.
Layer 9: SmoothAdicCurve, CurveTrace, BoundaryPretrace,
BoundaryResidueTrace, AnalyticLCICycleClass, AffineSpaceTrace, AnalyticFirstChernClass,
SmoothRelativeTrace, GeneralAnalyticSmoothTrace, GeneralSmoothTrace, IntegralSmoothProperTrace.
Layer 10: AnnulusKummerGenerator.
Layer 11: BallExhaustion, radiusBall.
-/

end TauCetiRoadmap.ClassicalAdicEtaleCohomology
