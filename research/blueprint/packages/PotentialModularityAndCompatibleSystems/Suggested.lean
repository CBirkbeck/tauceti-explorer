import Mathlib
import TauCeti.AlgebraicGeometry.LineBundle.Class

/-!
# PotentialModularityAndCompatibleSystems: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures statable
against the pinned APIs and is not exhaustive. Archimedean expressions distinguish
meromorphic cancellation from pointwise division in the total Gamma functions. Picard
classes below are objectwise rigidified classes; relative representability remains a
separate construction. Lift parameters below encode numerical character restrictions,
while arithmetic lift types also require representations and local deformation conditions.
-/

open CategoryTheory AlgebraicGeometry
open TauCeti.AlgebraicGeometry
set_option autoImplicit false

universe u
noncomputable section
namespace TauCetiRoadmap.PotentialModularityAndCompatibleSystems

/-! ## Layer 1: Compatible-family infrastructure -/

namespace Factors

/-- The normalized reciprocal polynomial, for a monic characteristic polynomial whose
constant coefficient is nonzero. In rank zero the polynomial is `1`. -/
def dualPolynomial {M : Type u} [Field M] (Q : Polynomial M) : Polynomial M :=
  Polynomial.C ((Q.coeff 0)⁻¹) * Q.reverse

/-- Reciprocal roots in rank one: the root `2` becomes `1/2`. -/
example : dualPolynomial (Polynomial.X - Polynomial.C (2 : ℚ)) =
    Polynomial.X - Polynomial.C (1 / 2 : ℚ) := by sorry

/-- The zero-dimensional characteristic polynomial is preserved. -/
example : dualPolynomial (1 : Polynomial ℚ) = 1 := by sorry

/-- A noninvertible operator is outside the domain of the characteristic-polynomial rule. -/
example : dualPolynomial (Polynomial.X : Polynomial ℚ) = 0 := by sorry

/-- Integer real-place multiplicities (BLGGT v4 §5.1, pp. 63–64); interpreting these as
nonnegative multiplicities requires determinant ±1 and, in odd rank, even weight.
Integer real-place multiplicities `d^±`: `n/2` for `n` even, `(n ± (−1)^{w/2} det ℛ(c_v))/2`
for `n` odd. -/
def archimedeanD (n : ℕ) (w detc : ℤ) : ℤ × ℤ :=
  if Even n then ((n : ℤ) / 2, (n : ℤ) / 2)
  else (((n : ℤ) + (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2,
    ((n : ℤ) - (if Even (w / 2) then (1 : ℤ) else -1) * detc) / 2)

/-- The pointwise archimedean quotient expression of BLGGT v4 §5.1, pp. 63–64.
It agrees with the meromorphic expression where `Gammaℂ (s - w/2)` is nonzero;
elsewhere removable singularities must be cancelled before evaluation. -/
def archimedeanGammaFactor (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ)
    (dplus dminus : ℕ) (s : ℂ) : ℂ := by
  classical
  let central := Complex.Gammaℂ (s - (w : ℂ) / 2)
  let shifts := fun (A : Multiset ℤ) =>
    ((A.filter (fun h => 2 * h < w)).map
      (fun (h : ℤ) => Complex.Gammaℂ (s - (h : ℂ)) / central)).prod
  exact if realPlace then
    Complex.Gammaℝ (s - (w : ℂ) / 2) ^ dplus *
      Complex.Gammaℝ (s + 1 - (w : ℂ) / 2) ^ dminus * shifts H
    else central ^ H.card * shifts H * shifts Hbar

/-- The archimedean root number `ε_v = i^{d^− + Σ |h − w/2|}` (real) or
`i^{Σ_{H_τ} |h − w/2| + Σ_{H_{τ'}} |h − w/2|}` (complex). -/
def archimedeanEpsilon (realPlace : Bool) (H Hbar : Multiset ℤ) (w : ℤ) (dminus : ℕ) : ℂ := by
  classical
  let magnitude := fun (A : Multiset ℤ) =>
    (A.map (fun (h : ℤ) => |(h : ℝ) - (w : ℝ) / 2|)).sum
  exact Complex.I ^ ((if realPlace then (dminus : ℝ) + magnitude H
    else magnitude H + magnitude Hbar) : ℂ)

/-- Rank zero, even rank, and the real odd sign distinguish the multiplicity rule. -/
example : archimedeanD 0 0 1 = (0, 0) ∧ archimedeanD 2 1 (-1) = (1, 1) ∧
    archimedeanD 1 0 (-1) = (0, 1) := by sorry

/-- The geometric cyclotomic character has weight `-2` and odd determinant. -/
example : archimedeanD 1 (-2) (-1) = (1, 0) := by sorry

/-- Even weight is necessary to interpret the odd-rank expression as Hodge multiplicities. -/
example : ¬ Even (1 : ℤ) := by sorry

/-- The trivial real character fixes the Gamma and epsilon normalizations. -/
example (s : ℂ) :
    archimedeanGammaFactor true {0} {0} 0 1 0 s = Complex.Gammaℝ s ∧
    archimedeanEpsilon true {0} {0} 0 0 = 1 := by sorry

/-- The sign character instead has real factor `Gammaℝ (s+1)` and epsilon `i`. -/
example (s : ℂ) :
    archimedeanGammaFactor true {0} {0} 0 0 1 s = Complex.Gammaℝ (s + 1) ∧
    archimedeanEpsilon true {0} {0} 0 1 = Complex.I := by sorry

/-- At a complex place the two embeddings give the single complex factor in rank one. -/
example (s : ℂ) :
    archimedeanGammaFactor false {0} {0} 0 0 0 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon false {0} {0} 0 0 = 1 := by sorry

/-- The empty product in rank zero is one, even at a pole of the auxiliary Gamma factor. -/
example (s : ℂ) :
    archimedeanGammaFactor false 0 0 0 0 0 s = 1 ∧
    archimedeanEpsilon false 0 0 0 0 = 1 := by sorry

/-- The geometric cyclotomic Hodge weight is `-1`. -/
example (s : ℂ) :
    archimedeanGammaFactor true {-1} {-1} (-2) 1 0 s = Complex.Gammaℝ (s + 1) ∧
    archimedeanEpsilon true {-1} {-1} (-2) 0 = 1 := by sorry

/-- Elliptic-curve cancellation is pointwise valid away from the denominator's poles. -/
example (s : ℂ) (hs : ∀ n : ℕ, s - 1 / 2 ≠ -(n : ℂ)) :
    archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 s = Complex.Gammaℂ s ∧
    archimedeanEpsilon true {0, 1} {0, 1} 1 1 = -1 := by sorry

/-- The raw quotient is zero at `s=1/2`, while its meromorphic continuation is nonzero. -/
example : archimedeanGammaFactor true {0, 1} {0, 1} 1 1 1 (1 / 2) = 0 ∧
    Complex.Gammaℂ (1 / 2) ≠ 0 := by sorry

end Factors

/-! ## Layer 2: Integral points and controlled fields -/

namespace Picard

/-- A line bundle on `X` with a trivialization of its restriction to the boundary `Z`
(Moret-Bailly II 3.4). -/
structure Rigidified (X Z : Scheme.{u}) (i : Z ⟶ X) where
  line : InvertibleSheaf X
  trivialization : (Scheme.Modules.pullback i).obj line.obj ≅ (InvertibleSheaf.trivial Z).obj

/-- Isomorphisms of line bundles must intertwine the boundary trivializations. -/
def rigidifiedSetoid (X Z : Scheme.{u}) (i : Z ⟶ X) : Setoid (Rigidified X Z i) where
  r A B := Nonempty {e : A.line.obj ≅ B.line.obj //
    (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom}
  iseqv := by sorry

/-- Objectwise rigidified isomorphism classes; relative fppf representability is separate. -/
def generalizedPicard (X Z : Scheme.{u}) (i : Z ⟶ X) : Type _ :=
  Quotient (rigidifiedSetoid X Z i)

/-- Equality of classes is witnessed by a boundary-compatible isomorphism. -/
theorem generalizedPicard_mk_eq_iff (X Z : Scheme.{u}) (i : Z ⟶ X)
    (A B : Rigidified X Z i) :
    (Quotient.mk _ A : generalizedPicard X Z i) = Quotient.mk _ B ↔
      Nonempty {e : A.line.obj ≅ B.line.obj //
        (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom} := by
  sorry

/-- Descend an invariant function through the rigidified quotient. -/
def generalizedPicard_lift (X Z : Scheme.{u}) (i : Z ⟶ X) (T : Type*)
    (f : Rigidified X Z i → T)
    (hf : ∀ A B, (rigidifiedSetoid X Z i).r A B → f A = f B) :
    generalizedPicard X Z i → T := Quotient.lift f hf

/-- Evaluation of the descended function on a representative. -/
theorem generalizedPicard_lift_mk (X Z : Scheme.{u}) (i : Z ⟶ X) (T : Type*)
    (f : Rigidified X Z i → T)
    (hf : ∀ A B, (rigidifiedSetoid X Z i).r A B → f A = f B)
    (A : Rigidified X Z i) :
    generalizedPicard_lift X Z i T f hf (Quotient.mk _ A) = f A := by
  sorry

/-- Forgetting is well-defined on rigidified isomorphism classes, into the pinned class type. -/
def generalizedPicard_forget (X Z : Scheme.{u}) (i : Z ⟶ X) :
    generalizedPicard X Z i → LineBundleClass X :=
  Quotient.lift (fun A ↦ LineBundleClass.mk A.line) (by sorry)

/-- The kernel of forgetting the rigidification on objectwise classes.
Relative fppf exactness is a separate statement. -/
theorem generalizedPicard_forget_kernel (X Z : Scheme.{u}) (i : Z ⟶ X)
    (P : generalizedPicard X Z i) :
    generalizedPicard_forget X Z i P = LineBundleClass.mk (InvertibleSheaf.trivial X) ↔
      ∃ α : (Scheme.Modules.pullback i).obj (InvertibleSheaf.trivial X).obj ≅
          (InvertibleSheaf.trivial Z).obj,
        P = Quotient.mk _ (Rigidified.mk (InvertibleSheaf.trivial X) α) := by
  sorry

/-- Rigidifying on the whole scheme leaves exactly one isomorphism class. -/
example (X : Scheme.{u}) (A B : Rigidified X X (𝟙 X)) :
    (Quotient.mk _ A : generalizedPicard X X (𝟙 X)) = Quotient.mk _ B := by sorry

/-- Forgetting a rigidification on the whole scheme gives the trivial class. -/
example (X : Scheme.{u}) (A : Rigidified X X (𝟙 X)) :
    generalizedPicard_forget X X (𝟙 X) (Quotient.mk _ A) =
      LineBundleClass.mk (InvertibleSheaf.trivial X) := by sorry

/-- A sheaf isomorphism identifies rigidified classes only when it respects the boundary. -/
example (X Z : Scheme.{u}) (i : Z ⟶ X) (A B : Rigidified X Z i)
    (h : ¬ Nonempty {e : A.line.obj ≅ B.line.obj //
      (Scheme.Modules.pullback i).map e.hom ≫ B.trivialization.hom = A.trivialization.hom}) :
    (Quotient.mk _ A : generalizedPicard X Z i) ≠ Quotient.mk _ B := by sorry

end Picard

/-! ## Layer 3: Auxiliary characters and moduli -/
/-! ## Layer 4: Residual potential modularity -/
/-! ## Layer 5: Potential modularity of a given lift -/
/-! ## Layer 6: Control of extensions -/
/-! ## Layer 7: Exports and their direction of use -/
/-! ## Layer 8: Finiteness of global rings -/
/-! ## Layer 9: Characteristic-zero points -/
/-! ## Layer 10: Prescribed lifts -/

namespace Presentations

/-- `R` has a presentation `𝒪⟦x₁, …, x_r⟧/(f₁, …, f_s)` as an `𝒪`-algebra. -/
def HasPresentation (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (r s : ℕ) : Prop :=
  ∃ f : Fin s → MvPowerSeries (Fin r) O,
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin r) O ⧸ Ideal.span (Set.range f)))

/-- `R` is flat over `𝒪` and a complete intersection of relative dimension `d`: a presentation
`𝒪⟦x₁, …, x_{s+d}⟧/(f₁, …, f_s)` by a regular sequence. -/
def IsFlatCompleteIntersection (O R : Type) [CommRing O] [CommRing R] [Algebra O R] (d : ℕ) :
    Prop :=
  Module.Flat O R ∧ ∃ (s : ℕ) (f : Fin s → MvPowerSeries (Fin (s + d)) O),
    RingTheory.Sequence.IsRegular (MvPowerSeries (Fin (s + d)) O) (List.ofFn f) ∧
    Nonempty (R ≃ₐ[O] (MvPowerSeries (Fin (s + d)) O ⧸ Ideal.span (Set.range f)))

/-- A nonzero finite algebra over a complete DVR with at most as many proper equations
as formal variables has equal counts and a regular sequence starting with a uniformizer
(Böckle’s appendix, Lemma 2, p. 5). The uniformizer is arbitrary, including for ramified DVRs. -/
theorem finite_presentation_complete_intersection
    {O R : Type} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CommRing R] [Nontrivial R] [Algebra O R] [Module.Finite O R]
    {n m : ℕ} (hmn : m ≤ n) (π : O)
    (hπ : Ideal.span ({π} : Set O) = IsLocalRing.maximalIdeal O)
    (f : Fin m → MvPowerSeries (Fin n) O)
    (hf : ∀ i, f i ∈ IsLocalRing.maximalIdeal (MvPowerSeries (Fin n) O))
    (e : R ≃ₐ[O] (MvPowerSeries (Fin n) O ⧸ Ideal.span (Set.range f))) :
    m = n ∧ Module.Flat O R ∧ RingTheory.Sequence.IsRegular (MvPowerSeries (Fin n) O)
      (algebraMap O (MvPowerSeries (Fin n) O) π :: List.ofFn f) := by
  sorry

/-- The zero-variable presentation recovers the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 0 0 := by sorry

/-- Quotienting one variable by that variable gives the coefficient ring. -/
example (O : Type) [CommRing O] : HasPresentation O O 1 1 := by sorry

/-- A unit equation is permitted as a presentation but gives the zero algebra. -/
example : HasPresentation ℚ
    (MvPowerSeries (Fin 1) ℚ ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) ℚ))) 1 1 := by sorry

/-- A nonzero coefficient ring is flat over itself with the empty regular sequence. -/
example (O : Type) [CommRing O] [Nontrivial O] : IsFlatCompleteIntersection O O 0 := by sorry

/-- Over a nonzero noetherian coefficient ring, formal power series are flat and
the one-variable ring has relative dimension one. -/
example (O : Type) [CommRing O] [Nontrivial O] [IsNoetherianRing O] :
    IsFlatCompleteIntersection O (MvPowerSeries (Fin 1) O) 1 := by sorry

/-- The zero algebra fails the nonzero-quotient condition for a regular sequence. -/
example : ¬ IsFlatCompleteIntersection ℚ
    (MvPowerSeries (Fin 1) ℚ ⧸ Ideal.span ({1} : Set (MvPowerSeries (Fin 1) ℚ))) 0 := by sorry

/-- Torsion over the coefficient ring is incompatible with flatness. -/
example : ¬ IsFlatCompleteIntersection ℤ (ZMod 2) 0 := by sorry

end Presentations

namespace LiftParameters

/-- Numerical part of the four KW lift prescriptions (KW I Theorem 5.1, pp. 9–10).
The arithmetic `RequiredLiftType` additionally records its representation, determinant,
residual local shape and deformation conditions; this parameter type does not replace it. -/
inductive RequiredLiftParameters (p k : ℕ) where
  | minimalCrystalline (dyadic : p = 2 → k = 2)
  | weightTwo
  | levelOne (q i : ℕ) (prime : q.Prime) (odd : q ≠ 2) (divides : p ∣ q - 1)
      (range : 0 < i ∧ i ≤ q - 2) (dyadic : p = 2 → Even i)
  | levelTwo (q i j : ℕ) (prime : q.Prime) (ne : q ≠ p) (divides : p ∣ q + 1)
      (range : j < i ∧ i ≤ q - 1)
      (order : ∃ r : ℕ, (q ^ 2 - 1) / Nat.gcd (q ^ 2 - 1) (i + q * j) = p ^ r)
      (dyadic : p = 2 → Even (i + j))

namespace RequiredLiftParameters
variable {p k : ℕ}

/-- The auxiliary prime is present only for the last two prescriptions. -/
def auxiliaryPrime : RequiredLiftParameters p k → Option ℕ
  | levelOne q .. => some q
  | levelTwo q .. => some q
  | _ => none

/-- In the weight-two prescription, `k=p+1` requires nonzero monodromy. -/
def requiresSteinberg : RequiredLiftParameters p k → Prop
  | minimalCrystalline _ => False
  | _ => k = p + 1

/-- The dyadic level-one character at `q=5` must have even exponent. -/
example (k : ℕ) : ¬ (2 = 2 → Even 1) ∧
    (RequiredLiftParameters.levelOne (p := 2) (k := k) 5 2 (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) (fun _ => even_two)).auxiliaryPrime = some 5 := by sorry

/-- At `q=7`, the exponent `6` gives order `8` and genuine level two. -/
example (k : ℕ) :
    (RequiredLiftParameters.levelTwo (p := 2) (k := k) 7 6 0 (by norm_num) (by norm_num)
      (by norm_num) (by norm_num) ⟨3, by norm_num⟩ (fun _ => by decide)).auxiliaryPrime = some 7 := by
  sorry

/-- At `q=5` no exponents satisfy all the dyadic level-two restrictions simultaneously. -/
example : ¬ ∃ (i j r : ℕ), j < i ∧ i ≤ 4 ∧ Even (i + j) ∧
    24 / Nat.gcd 24 (i + 5 * j) = 2 ^ r := by sorry

/-- The level-one prescription at `p=3,q=5` fails its divisibility condition. -/
example : ¬ 3 ∣ 5 - 1 := by sorry

/-- The weight-two prescription has no auxiliary prime. -/
example (p k : ℕ) :
    (RequiredLiftParameters.weightTwo (p := p) (k := k)).auxiliaryPrime = none := by sorry

/-- The exceptional weight requires Steinberg monodromy; weight two at `p=3` does not. -/
example : (RequiredLiftParameters.weightTwo (p := 3) (k := 4)).requiresSteinberg ∧
    ¬ (RequiredLiftParameters.weightTwo (p := 3) (k := 2)).requiresSteinberg := by sorry

end RequiredLiftParameters
end LiftParameters

/-! ## Layer 11: Rational-field modularity lifting -/
/-! ## Layer 12: Families through potentially modular lifts -/
/-! ## Layer 13: Residual members and linked systems -/

/- The following definitions require the arithmetic supplier APIs specified in README.md:
WeaklyCompatibleSystem, CompatibleSystem, ExtremelyWeaklyCompatibleSystem,
VeryWeaklyCompatibleSystem, WeaklyCompatibleSystem.IsRegular, IsExtremelyRegular,
IsStrictlyCompatible, IsPure, IsStrictlyPure, IsIrreducible, IsAutomorphic,
directSum, tensor, dual, symmetricPower, exteriorPower, twist, restrict, induce,
PolarizedSystem, PolarizedSystem.IsTotallyOdd, PolarizedSystem.tensor, PolarizedSystem.dual,
PolarizedSystem.twist, PolarizedSystem.power, characterSystem, artinSystem,
partialLFunction, lFunction, completedLFunction, RepRing, LarsenData, componentGroup,
SkolemDatum, SkolemDatum.IntegralPoint, SkolemDatum.IsComplete, SkolemDatum.FieldPoint,
SkolemDatum.enlargeSigma, generalizedPicard_exact, generalizedPicard_group, generalizedPicard_pullback, divisorClassMap, CurveCompactification,
splitField, DetectsSubextensions, TaylorAuxiliaryData, IsKWField, HasKWWitnesses,
IsLiftOfType, AuxiliaryField, OrdinaryGlobalRing, CGRing, LocalConditions,
RequiredLiftType, RequiredLiftType.localCondition, RequiredLiftType.ring,
RequiredLiftType.liftOfPoint, KWHypotheses, KWApplication, theorem_5_1_application_table,
LiftingProblem, brauerSystem, residualMember and linkedSystem.
Their existence, comparison, finiteness and density theorems are stated in README.md. -/

end TauCetiRoadmap.PotentialModularityAndCompatibleSystems
