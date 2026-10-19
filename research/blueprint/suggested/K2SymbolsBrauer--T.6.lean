import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.TrivSqZeroExt.Ideal
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RingTheory.Kaehler.Basic
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Product

/-!
# Rings with symbols and the arithmetic comparison interfaces

The README specifies stable/relative Steinberg K₂, the guarded presentation,
the differential, cyclic algebras, Brauer and Chern adapters. These carriers
are absent at the pins. They remain README targets, rather than opaque data
definitions or arbitrary groups equipped with the desired conclusions.

The declarations below state only interfaces available over actual pinned
carriers: unit conditions, threefold stability, the Z/4 detector, square-zero
arithmetic, scalar coefficient changes and the native Kummer/cup pairing.
All new definitions have real bodies. The file is a statement skeleton.
-/

namespace K2SymbolsBrauerT6

/-- Three simultaneous unimodular pairs can be perturbed to units. -/
def IsThreefoldStable (A : Type*) [CommRing A] : Prop :=
  ∀ a b : Fin 3 → A,
    (∀ i, ∃ x y : A, a i * x + b i * y = 1) →
    ∃ t : A, ∀ i, IsUnit (a i + b i * t)

example : IsThreefoldStable (ZMod 5) := by
  sorry

example : ¬ IsThreefoldStable (ZMod 3) := by
  sorry

/-- The nonlocal product is allowed by the simultaneous-unit condition. -/
example : IsThreefoldStable (ZMod 5 × ZMod 5) := by
  sorry

/-- A local ring need not satisfy the threefold condition. -/
example : ¬ IsThreefoldStable (ZMod 4) := by
  sorry

/-- The four elementary factors in the modern word map to diag(u,u⁻¹).
The stable word then multiplies by h(u)⁻¹. -/
theorem modernWord_matrix {A : Type*} [CommRing A]
    (r s : A) (u : Aˣ) (hu : (u : A) = 1 - r * s) :
    (!![1, 0; -s * (↑u⁻¹ : A), 1] : Matrix (Fin 2) (Fin 2) A) *
      !![1, -r; 0, 1] * !![1, 0; s, 1] *
      !![1, r * (↑u⁻¹ : A); 0, 1] = !![(u : A), 0; 0, (↑u⁻¹ : A)] := by
  sorry

/-- The D2 right-hand pair is automatically admissible. -/
theorem dennisStein_second_relation_unit {A : Type*} [CommRing A]
    (r s t : A) (hs : IsUnit (1 - r * s)) (ht : IsUnit (1 - r * t)) :
    IsUnit (1 - r * (s + t - r * s * t)) := by
  sorry

/-- This table is a function on an existing finite ring, not a K₂ model. -/
def zmodFourSymbolParity (r s : ZMod 4) : ZMod 2 :=
  if (r = 2 ∧ (s = 2 ∨ s = 3)) ∨ (r = 3 ∧ s = 2) then 1 else 0

theorem zmodFourSymbolParity_relations :
    (∀ r s : ZMod 4, IsUnit (1 - r * s) →
      zmodFourSymbolParity r s = -zmodFourSymbolParity s r) ∧
    (∀ r s t : ZMod 4, IsUnit (1 - r * s) → IsUnit (1 - r * t) →
      zmodFourSymbolParity r s + zmodFourSymbolParity r t =
        zmodFourSymbolParity r (s + t - r * s * t)) ∧
    (∀ r s t : ZMod 4, IsUnit (1 - r * s * t) →
      zmodFourSymbolParity r (s * t) =
        zmodFourSymbolParity (r * s) t + zmodFourSymbolParity (r * t) s) := by
  sorry

example : zmodFourSymbolParity 2 2 = 1 := by decide
example : zmodFourSymbolParity 3 2 = 1 := by decide
example : zmodFourSymbolParity 1 2 = 0 := by decide
example : ¬ IsUnit (1 - (1 : ZMod 4) * 1) := by decide

/-- Nilpotent ideal elements make the Dennis–Stein unit condition automatic. -/
theorem squareZero_unit {A : Type*} [CommRing A]
    (x r : A) (hx : x * x = 0) :
    (1 - r * x) * (1 + r * x) = 1 := by
  sorry

example {R : Type*} [CommRing R] :
    (DualNumber.eps : DualNumber R) * DualNumber.eps = 0 := by
  sorry

/-- The input guard differs from mere eligibility of the three output pairs.
This is the native carrier F₃[x,y]/(x²,y²). The reader gives the differential
values detecting the forbidden relation; no relative K₂ carrier is invented. -/
theorem relative_guard_test :
    let A := DualNumber (DualNumber (ZMod 3))
    let x : A := TrivSqZeroExt.inl (DualNumber.eps : DualNumber (ZMod 3))
    let y : A := DualNumber.eps
    let I : Ideal A := Ideal.span {x * y}
    x ∉ I ∧ y ∉ I ∧ x + y ∉ I ∧
      y * (x + y) = x * y ∧ x * (x + y) = x * y ∧
      (x * y) * (x * y) = 0 := by
  sorry

/-- The differential defect is nonzero in the stated two-dimensional target. -/
example : ((-1, 0) : ZMod 3 × ZMod 3) - ((1, 1) + (0, 1)) = (1, 1) ∧
    ((1, 1) : ZMod 3 × ZMod 3) ≠ 0 := by decide

end K2SymbolsBrauerT6

namespace K2SymbolsBrauerT7

/-- The contraction in primitive-root exponent coordinates multiplies exponents.
Multiplication of root *values* would add them and would be wrong. -/
def rootCupCoordinate (m : ℕ) (i j : ZMod m) : ZMod m := i * j

example : rootCupCoordinate 5 2 3 = 1 := by decide
example : rootCupCoordinate 5 0 3 = 0 := by decide
example : rootCupCoordinate 5 1 1 = 1 := by decide

/-- Two input changes and one output change give u⁻¹, not u⁻². -/
theorem rootCupCoordinate_change (m : ℕ) (u : (ZMod m)ˣ) (i j : ZMod m) :
    (u : ZMod m) * rootCupCoordinate m ((↑u⁻¹ : ZMod m) * i)
        ((↑u⁻¹ : ZMod m) * j) =
      (↑u⁻¹ : ZMod m) * rootCupCoordinate m i j := by
  sorry

example : (2 : ZMod 5)⁻¹ = 3 ∧ ((2 : ZMod 5)⁻¹) ^ 2 = 4 := by
  sorry

/-- The cubic sign test separates the invariant coordinate from its negative. -/
example : -(1 : ZMod 3) = 2 ∧ -(1 : ZMod 3) ≠ 1 := by decide

/-!
The normalized invariant coordinate e_m takes [k/m] in (Q/Z)[m] to k in Z/m.
Multiplication by m *in Q/Z* is zero, not that coordinate. Current Tau Ceti's
h2MuEquivZMod implements the normalized coordinate beyond the pinned baseline.
No replacement local invariant is defined here.
-/

section NativeKummer

open TauCeti TauCeti.ContCohomology

variable (F : Type*) [Field F] (m : ℕ) (hm : IsUnit (m : F))

/-- The imported Kummer map kills powers in its actual pinned H¹ carrier. -/
example (a : Fˣ) :
    Multiplicative.toAdd (TauCeti.kummerMap F m hm (a ^ m)) = 0 := by
  sorry

variable {P : Type*} [AddCommGroup P] [TopologicalSpace P] [IsTopologicalAddGroup P]
  [DistribMulAction (AbsoluteGaloisGroup F) P]
  [ContinuousSMul (AbsoluteGaloisGroup F) P]
  (μ : TauCeti.KummerCoeff F m →+ TauCeti.KummerCoeff F m →+ P)
  (hμ : Continuous (fun z : TauCeti.KummerCoeff F m × TauCeti.KummerCoeff F m =>
    μ z.1 z.2))
  (heq : ∀ (g : AbsoluteGaloisGroup F) (x y : TauCeti.KummerCoeff F m),
    μ (g • x) (g • y) = g • μ x y)

/-- The actual native cup on Kummer classes kills powers in either input.
For the intrinsic tensor pairing, M.1 supplies P as the actual weight-two twist;
for a chosen primitive root, the coefficient map is its exponent contraction.
This quantified coefficient interface does not assert a substitute K₂ theorem. -/
theorem kummerCup_power (a b : Fˣ) :
    explicitCup11 (AbsoluteGaloisGroup F)
        (TauCeti.KummerCoeff F m) (TauCeti.KummerCoeff F m) P μ hμ heq
        (Multiplicative.toAdd (TauCeti.kummerMap F m hm (a ^ m)))
        (Multiplicative.toAdd (TauCeti.kummerMap F m hm b)) = 0 ∧
      explicitCup11 (AbsoluteGaloisGroup F)
        (TauCeti.KummerCoeff F m) (TauCeti.KummerCoeff F m) P μ hμ heq
        (Multiplicative.toAdd (TauCeti.kummerMap F m hm a))
        (Multiplicative.toAdd (TauCeti.kummerMap F m hm (b ^ m))) = 0 := by
  sorry

end NativeKummer

/-!
README-only end targets, because their carriers are absent at the pins:
* h_{F,m}{a,b} = kappa(a) cup kappa(b), importing M.3's map and M.1's twist;
* [A_zeta(a,b)] = beta_zeta{a,b}, including proper Kummer-field degree;
* H_m(a,b) = zeta^(-e_m(inv beta_zeta{a,b})), arithmetic Frobenius;
* the local, number-field and S-integer Tate maps supplied by M.3;
* c_22(red_m(theta_2-natural x)) = -h(x mod m), with the T.2 product sign.
The complete hypotheses, maps, proofs and examples are in the reader document.
-/

end K2SymbolsBrauerT7
