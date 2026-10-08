/-
This file is not the roadmap and is not exhaustive. README.md is definitive.
The statements suggest Lean forms so contributors and reviewers converge on
names and signatures. All planned proofs use sorry.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Executable declarations use the existing Mathlib coordinate carriers. The
remaining mathematical interfaces appear in comments beside their full names:
their supplier types are unavailable, so there is no faithful Lean signature
yet. Some coordinate APIs below express only the algebraic part of the full
interface. Their geometric comparisons are specified in the corresponding
comments and README. No arbitrary proposition parameters, phantom types,
axioms or Prop-valued sorry definitions stand in for missing mathematics.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.FieldTheory.RatFunc.Degree
import Mathlib.Data.Fin.VecNotation

set_option autoImplicit false
-- Signature prototyping intentionally admits sorry.
set_option warningAsError false
noncomputable section
open scoped Polynomial
namespace TauCeti.ImaginaryQuadraticModularity

def b3J : RatFunc ℚ := RatFunc.mk (((Polynomial.X + 27) * (Polynomial.X + 3)^3) : Polynomial ℚ) (Polynomial.X : Polynomial ℚ)

theorem b3J_fraction : b3J = RatFunc.mk (((Polynomial.X + 27) * (Polynomial.X + 3)^3) : Polynomial ℚ) (Polynomial.X : Polynomial ℚ) := by sorry

theorem b3J_eval (K : Type) [Field K] [CharZero K] (x : K) (h : x ≠ 0) : RatFunc.eval (Rat.castHom K) x b3J = (x+27)*(x+3)^3/x := by sorry

theorem b3J_intDegree : RatFunc.intDegree b3J = 3 := by sorry

-- The full _intDegree API also identifies the proper j-map degree via small_curve_models.

-- b3J_test_one
example : RatFunc.eval (RingHom.id ℚ) 1 b3J = 1792 := by sorry

-- b3J_test_zero_j
example : RatFunc.eval (RingHom.id ℚ) (-3) b3J = 0 := by sorry

-- b3J_test_cusp
example : (RatFunc.denom b3J).eval 0 = 0 ∧ RatFunc.eval (RingHom.id ℚ) 0 b3J = 0 := by sorry

def b5J : RatFunc ℚ := RatFunc.mk ((Polynomial.X^2 + 250*Polynomial.X + 3125)^3 : Polynomial ℚ) (Polynomial.X^5 : Polynomial ℚ)

theorem b5J_fraction : b5J = RatFunc.mk ((Polynomial.X^2 + 250*Polynomial.X + 3125)^3 : Polynomial ℚ) (Polynomial.X^5 : Polynomial ℚ) := by sorry

theorem b5J_eval (K : Type) [Field K] [CharZero K] (x : K) (h : x^5 ≠ 0) : RatFunc.eval (Rat.castHom K) x b5J = (x^2+250*x+3125)^3/x^5 := by sorry

theorem b5J_intDegree : RatFunc.intDegree b5J = 1 := by sorry

-- The full _intDegree API also identifies the proper j-map degree via small_curve_models.

-- b5J_test_one
example : RatFunc.eval (RingHom.id ℚ) 1 b5J = 38477541376 := by sorry

-- b5J_test_minus_five
example : RatFunc.eval (RingHom.id ℚ) (-5) b5J = -2194880 := by sorry

-- b5J_test_cusp
example : (RatFunc.denom b5J).eval 0 = 0 := by sorry

def ns3J : RatFunc ℚ := RatFunc.mk (Polynomial.X^3 : Polynomial ℚ) (1 : Polynomial ℚ)

theorem ns3J_fraction : ns3J = RatFunc.mk (Polynomial.X^3 : Polynomial ℚ) (1 : Polynomial ℚ) := by sorry

theorem ns3J_eval (K : Type) [Field K] [CharZero K] (x : K) (h : 1 ≠ 0) : RatFunc.eval (Rat.castHom K) x ns3J = x^3 := by sorry

theorem ns3J_intDegree : RatFunc.intDegree ns3J = 3 := by sorry

-- The full _intDegree API also identifies the proper j-map degree via small_curve_models.

-- ns3J_test_zero
example : RatFunc.eval (RingHom.id ℚ) 0 ns3J = 0 := by sorry

-- ns3J_test_two
example : RatFunc.eval (RingHom.id ℚ) 2 ns3J = 8 := by sorry

-- ns3J_test_polynomial
example : RatFunc.denom ns3J = 1 ∧ RatFunc.intDegree ns3J = 3 := by sorry

def ns5J : RatFunc ℚ := RatFunc.mk (125*Polynomial.X*(2*Polynomial.X+1)^3*(2*Polynomial.X^2+7*Polynomial.X+8)^3 : Polynomial ℚ) ((Polynomial.X^2+Polynomial.X-1)^5 : Polynomial ℚ)

theorem ns5J_fraction : ns5J = RatFunc.mk (125*Polynomial.X*(2*Polynomial.X+1)^3*(2*Polynomial.X^2+7*Polynomial.X+8)^3 : Polynomial ℚ) ((Polynomial.X^2+Polynomial.X-1)^5 : Polynomial ℚ) := by sorry

theorem ns5J_eval (K : Type) [Field K] [CharZero K] (x : K) (h : (x^2+x-1)^5 ≠ 0) : RatFunc.eval (Rat.castHom K) x ns5J = 125*x*(2*x+1)^3*(2*x^2+7*x+8)^3/(x^2+x-1)^5 := by sorry

theorem ns5J_intDegree : RatFunc.intDegree ns5J = 0 := by sorry

-- The full _intDegree API also identifies the proper j-map degree via small_curve_models.

-- ns5J_test_zero
example : RatFunc.eval (RingHom.id ℚ) 0 ns5J = 0 ∧ (RatFunc.denom ns5J).eval 0 ≠ 0 := by sorry

-- ns5J_test_minus_half
example : RatFunc.eval (RingHom.id ℚ) (-1/2) ns5J = 0 := by sorry

-- ns5J_test_infinity
example : RatFunc.intDegree ns5J = 0 ∧ (RatFunc.num ns5J).leadingCoeff / (RatFunc.denom ns5J).leadingCoeff = 8000 := by sorry

def s3J : RatFunc ℚ := RatFunc.mk (27*(Polynomial.X+1)^3*(Polynomial.X-3)^3 : Polynomial ℚ) (Polynomial.X^3 : Polynomial ℚ)

theorem s3J_fraction : s3J = RatFunc.mk (27*(Polynomial.X+1)^3*(Polynomial.X-3)^3 : Polynomial ℚ) (Polynomial.X^3 : Polynomial ℚ) := by sorry

theorem s3J_eval (K : Type) [Field K] [CharZero K] (x : K) (h : x^3 ≠ 0) : RatFunc.eval (Rat.castHom K) x s3J = 27*(x+1)^3*(x-3)^3/x^3 := by sorry

theorem s3J_intDegree : RatFunc.intDegree s3J = 3 := by sorry

-- The full _intDegree API also identifies the proper j-map degree via small_curve_models.

-- s3J_test_one
example : RatFunc.eval (RingHom.id ℚ) 1 s3J = -1728 := by sorry

-- s3J_test_minus_one
example : RatFunc.eval (RingHom.id ℚ) (-1) s3J = 0 := by sorry

-- s3J_test_cusp
example : (RatFunc.denom s3J).eval 0 = 0 ∧ RatFunc.intDegree s3J = 3 := by sorry

def B : WeierstrassCurve ℚ := ⟨0, 0, -1, 0, 1⟩

def E15 : WeierstrassCurve ℚ := ⟨0, 41, 0, 400, 0⟩

def Es35 : WeierstrassCurve ℚ := ⟨0, 17, 0, 16, 0⟩

theorem B_coefficients : B.a₁ = 0 ∧ B.a₂ = 0 ∧ B.a₃ = -1 ∧ B.a₄ = 0 ∧ B.a₆ = 1 := by sorry

theorem B_discriminant : B.Δ = -675 ∧ IsUnit B.Δ := by sorry

theorem B_baseChange (K : Type*) [Field K] [CharZero K] : B.baseChange K = (⟨0, 0, -1, 0, 1⟩ : WeierstrassCurve K) := by sorry

instance B_elliptic : B.IsElliptic := by sorry

-- B_test_j
example : B.j = 0 := by sorry

-- B_test_point
example : B.toAffine.Equation 1 2 := by sorry

-- B_test_sign
example : B.a₃ = -1 ∧ ¬ (⟨0,0,1,0,1⟩ : WeierstrassCurve ℚ).toAffine.Equation 1 2 := by sorry

theorem E15_coefficients : E15.a₁ = 0 ∧ E15.a₂ = 41 ∧ E15.a₃ = 0 ∧ E15.a₄ = 400 ∧ E15.a₆ = 0 := by sorry

theorem E15_discriminant : E15.Δ = 207360000 ∧ IsUnit E15.Δ := by sorry

theorem E15_baseChange (K : Type*) [Field K] [CharZero K] : E15.baseChange K = (⟨0, 41, 0, 400, 0⟩ : WeierstrassCurve K) := by sorry

instance E15_elliptic : E15.IsElliptic := by sorry

-- E15_test_zero
example : ∃ h : E15.toAffine.Equation 0 0, WeierstrassCurve.Affine.Point.mk h ≠ 0 ∧ 2 • WeierstrassCurve.Affine.Point.mk h = 0 := by sorry

-- E15_test_roots
example : E15.toAffine.Equation (0) 0 ∧ E15.toAffine.Equation (-16) 0 ∧ E15.toAffine.Equation (-25) 0 := by sorry

-- E15_test_delta
example : E15.Δ = 207360000 ∧ E15 ≠ Es35 := by sorry

theorem Es35_coefficients : Es35.a₁ = 0 ∧ Es35.a₂ = 17 ∧ Es35.a₃ = 0 ∧ Es35.a₄ = 16 ∧ Es35.a₆ = 0 := by sorry

theorem Es35_discriminant : Es35.Δ = 921600 ∧ IsUnit Es35.Δ := by sorry

theorem Es35_baseChange (K : Type*) [Field K] [CharZero K] : Es35.baseChange K = (⟨0, 17, 0, 16, 0⟩ : WeierstrassCurve K) := by sorry

instance Es35_elliptic : Es35.IsElliptic := by sorry

-- Es35_test_zero
example : ∃ h : Es35.toAffine.Equation 0 0, WeierstrassCurve.Affine.Point.mk h ≠ 0 ∧ 2 • WeierstrassCurve.Affine.Point.mk h = 0 := by sorry

-- Es35_test_roots
example : Es35.toAffine.Equation (0) 0 ∧ Es35.toAffine.Equation (-1) 0 ∧ Es35.toAffine.Equation (-16) 0 := by sorry

-- Es35_test_delta
example : Es35.Δ = 921600 ∧ Es35 ≠ E15 := by sorry

def gaussianExceptional (K : Type*) [Field K] (i : K) : WeierstrassCurve K := ⟨i, 1, 1, 6+i, 10-15*i⟩

theorem gaussianExceptional_coefficients (K : Type*) [Field K] (i : K) : (gaussianExceptional K i).a₁ = i ∧ (gaussianExceptional K i).a₂ = 1 ∧ (gaussianExceptional K i).a₃ = 1 ∧ (gaussianExceptional K i).a₄ = 6+i ∧ (gaussianExceptional K i).a₆ = 10-15*i := by sorry

theorem gaussianExceptional_discriminant (K : Type*) [Field K] [CharZero K] (i : K) (h : i^2 = -1) : (gaussianExceptional K i).Δ = 58752+107136*i ∧ (gaussianExceptional K i).Δ ≠ 0 := by sorry

theorem gaussianExceptional_j (K : Type*) [Field K] [CharZero K] (i : K) (h : i^2 = -1) [(gaussianExceptional K i).IsElliptic] : (gaussianExceptional K i).j = (-47709+15363*i)/256 := by sorry

-- The j signature uses the ellipticity instance established from the preceding nonzero discriminant.

-- gaussianExceptional_test_a1
example (K : Type*) [Field K] (i : K) : (gaussianExceptional K i).a₁ = i := by sorry

-- gaussianExceptional_test_conjugate
example (K : Type*) [Field K] (i : K) (f : K →+* K) (h : f i = -i) : (gaussianExceptional K i).map f = gaussianExceptional K (-i) := by sorry

-- gaussianExceptional_test_j_nonrational
example (K : Type*) [Field K] [CharZero K] (i : K) (h : i^2 = -1) [(gaussianExceptional K i).IsElliptic] : ∀ q : ℚ, (gaussianExceptional K i).j ≠ (q : K) := by sorry

def elevenExceptional (K : Type*) [Field K] (a : K) : WeierstrassCurve K := ⟨a, 0, 1+a, -24-6*a, 56+13*a⟩

theorem elevenExceptional_coefficients (K : Type*) [Field K] (a : K) : (elevenExceptional K a).a₁ = a ∧ (elevenExceptional K a).a₂ = 0 ∧ (elevenExceptional K a).a₃ = 1+a ∧ (elevenExceptional K a).a₄ = -24-6*a ∧ (elevenExceptional K a).a₆ = 56+13*a := by sorry

theorem elevenExceptional_discriminant (K : Type*) [Field K] [CharZero K] (a : K) (h : a^2-a+3 = 0) : (elevenExceptional K a).Δ = 4512-736*a ∧ (elevenExceptional K a).Δ ≠ 0 := by sorry

theorem elevenExceptional_j (K : Type*) [Field K] [CharZero K] (a : K) (h : a^2-a+3 = 0) [(elevenExceptional K a).IsElliptic] : (elevenExceptional K a).j = (11155375*a+3126750)/32 := by sorry

-- The j signature uses the ellipticity instance established from the preceding nonzero discriminant.

-- elevenExceptional_test_a2
example (K : Type*) [Field K] (a : K) : (elevenExceptional K a).a₂ = 0 := by sorry

-- elevenExceptional_test_conjugate
example (K : Type*) [Field K] (a : K) (f : K →+* K) (h : f a = 1-a) : (elevenExceptional K a).map f = elevenExceptional K (1-a) := by sorry

-- elevenExceptional_test_j_nonrational
example (K : Type*) [Field K] [CharZero K] (a : K) (h : a^2-a+3 = 0) [(elevenExceptional K a).IsElliptic] : ∀ q : ℚ, (elevenExceptional K a).j ≠ (q : K) := by sorry

def ns3b5Quartic : Polynomial ℚ := -3*(Polynomial.X^4+2*Polynomial.X^3-Polynomial.X^2+10*Polynomial.X+25)

theorem ns3b5Quartic_formula : ns3b5Quartic = -3*(Polynomial.X^4+2*Polynomial.X^3-Polynomial.X^2+10*Polynomial.X+25) := by sorry

theorem ns3b5Quartic_degree : ns3b5Quartic.natDegree = 4 ∧ ns3b5Quartic.leadingCoeff = -3 := by sorry

theorem ns3b5Quartic_fricke (K : Type*) [Field K] [CharZero K] (x : K) (h : x ≠ 0) : x^4 * ns3b5Quartic.eval₂ (Rat.castHom K) (5/x) = 25 * ns3b5Quartic.eval₂ (Rat.castHom K) x := by sorry

-- ns3b5Quartic_test_zero
example : ns3b5Quartic.eval (0) = -75 := by sorry

-- ns3b5Quartic_test_minus_two
example : ns3b5Quartic.eval (-2) = -3 := by sorry

-- ns3b5Quartic_test_minus_five_half
example : ns3b5Quartic.eval (-5/2) = -75/16 := by sorry

def b3ns5Sextic : Polynomial ℚ := 9*Polynomial.X^6-6*Polynomial.X^5-35*Polynomial.X^4+40*Polynomial.X^2+12*Polynomial.X-8

theorem b3ns5Sextic_formula : b3ns5Sextic = 9*Polynomial.X^6-6*Polynomial.X^5-35*Polynomial.X^4+40*Polynomial.X^2+12*Polynomial.X-8 := by sorry

theorem b3ns5Sextic_degree : b3ns5Sextic.natDegree = 6 ∧ b3ns5Sextic.leadingCoeff = 9 := by sorry

theorem b3ns5Sextic_squarefree : Squarefree b3ns5Sextic := by sorry

-- b3ns5Sextic_test_zero
example : b3ns5Sextic.eval 0 = -8 := by sorry

-- b3ns5Sextic_test_roots
example : b3ns5Sextic.eval (-1) = 0 ∧ b3ns5Sextic.eval (1/3) = 0 ∧ b3ns5Sextic.eval 2 = 0 := by sorry

-- b3ns5Sextic_test_degree
example : b3ns5Sextic.natDegree = 6 ∧ b3ns5Sextic.leadingCoeff = 9 := by sorry

def genusOneSpecialPoints (K : Type*) [Field K] (s : K) : List (Fin 3 → K) := [![1,s,0], ![1,-s,0], ![0,5*s,1], ![-2,-s,1], ![-5/2,5*s/4,1]]

theorem genusOneSpecialPoints_coordinates (K : Type*) [Field K] (s : K) : genusOneSpecialPoints K s = [![1,s,0], ![1,-s,0], ![0,5*s,1], ![-2,-s,1], ![-5/2,5*s/4,1]] := by sorry

theorem genusOneSpecialPoints_conjugate (K L : Type*) [Field K] [Field L] (s : K) (f : K →+* L) : (genusOneSpecialPoints K s).map (fun v => f ∘ v) = genusOneSpecialPoints L (f s) := by sorry

-- genusOneSpecialPoints_test_infinity
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -3) : s ≠ 0 ∧ s ≠ -s ∧ (s^2 = -3*(1:K)^4) := by sorry

-- genusOneSpecialPoints_test_zero
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -3) : (5*s)^2 = -75 ∧ ns3b5Quartic.eval₂ (Rat.castHom K) 0 = -75 := by sorry

-- genusOneSpecialPoints_test_p2
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -3) : (5*s/4)^2 = -75/16 ∧ ns3b5Quartic.eval₂ (Rat.castHom K) (-5/2) = -75/16 := by sorry

def quartic1 : MvPolynomial (Fin 3) ℚ :=
  let X : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
  let Y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
  let Z : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
  (9*X^4+19*X^2*Y^2+Y^4+9*X^3*Z+19*X^2*Y*Z+22*X*Y^2*Z+2*Y^3*Z+10*X^2*Z^2+22*X*Y*Z^2+13*Y^2*Z^2+7*X*Z^3+12*Y*Z^3+11*Z^4)

theorem quartic1_formula : quartic1 = (
  let X : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
  let Y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
  let Z : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
  (9*X^4+19*X^2*Y^2+Y^4+9*X^3*Z+19*X^2*Y*Z+22*X*Y^2*Z+2*Y^3*Z+10*X^2*Z^2+22*X*Y*Z^2+13*Y^2*Z^2+7*X*Z^3+12*Y*Z^3+11*Z^4)) := by sorry

theorem quartic1_homogeneous (K : Type*) [CommRing K] [Algebra ℚ K] (v : Fin 3 → K) (c : K) : MvPolynomial.eval₂ (algebraMap ℚ K) (fun j => c*v j) quartic1 = c^4 * MvPolynomial.eval₂ (algebraMap ℚ K) v quartic1 := by sorry

theorem quartic1_affine (K : Type*) [CommRing K] [Algebra ℚ K] (x y : K) : MvPolynomial.eval₂ (algebraMap ℚ K) ![x,y,1] quartic1 = 9*x^4+19*x^2*y^2+y^4+9*x^3*(1:K)+19*x^2*y*(1:K)+22*x*y^2*(1:K)+2*y^3*(1:K)+10*x^2*(1:K)^2+22*x*y*(1:K)^2+13*y^2*(1:K)^2+7*x*(1:K)^3+12*y*(1:K)^3+11*(1:K)^4 := by sorry

-- quartic1_test_1
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,0,1] quartic1 = 11 := by sorry

-- quartic1_test_2
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![1,0,0] quartic1 = 9 := by sorry

-- quartic1_test_3
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,1,0] quartic1 = 1 := by sorry

def quartic1Coordinates {K : Type*} [CommRing K] (v : Fin 3 → K) : Fin 3 → K := ![v 0,-v 1-v 2,v 2]

theorem quartic1Coordinates_coordinates {K : Type*} [CommRing K] (v : Fin 3 → K) : quartic1Coordinates v = ![v 0,-v 1-v 2,v 2] := by sorry

theorem quartic1Coordinates_square {K : Type*} [CommRing K] (v : Fin 3 → K) : quartic1Coordinates (quartic1Coordinates v) = fun j => 1*v j := by sorry

theorem quartic1Coordinates_preserves (K : Type*) [CommRing K] [Algebra ℚ K] (v : Fin 3 → K) : MvPolynomial.eval₂ (algebraMap ℚ K) (quartic1Coordinates v) quartic1 = 1 * MvPolynomial.eval₂ (algebraMap ℚ K) v quartic1 := by sorry

-- quartic1Coordinates_test_basis0
example : quartic1Coordinates (![1,0,0] : Fin 3 → ℚ) = ![1,0,0] := by sorry

-- quartic1Coordinates_test_basis1
example : quartic1Coordinates (![0,1,0] : Fin 3 → ℚ) = ![0,-1,0] := by sorry

-- quartic1Coordinates_test_basis2
example : quartic1Coordinates (![0,0,1] : Fin 3 → ℚ) = ![0,-1,1] := by sorry

def quartic2 : MvPolynomial (Fin 3) ℚ :=
  let X : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
  let Y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
  let Z : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
  (-X^4+2*X^3*Y+X^2*Y^2+8*X^3*Z+2*X^2*Y*Z-2*X*Y^2*Z-Y^3*Z-3*X^2*Z^2-3*X*Y*Z^2+3*Y^2*Z^2+2*X*Z^3-3*Y*Z^3+Z^4)

theorem quartic2_formula : quartic2 = (
  let X : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 0
  let Y : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 1
  let Z : MvPolynomial (Fin 3) ℚ := MvPolynomial.X 2
  (-X^4+2*X^3*Y+X^2*Y^2+8*X^3*Z+2*X^2*Y*Z-2*X*Y^2*Z-Y^3*Z-3*X^2*Z^2-3*X*Y*Z^2+3*Y^2*Z^2+2*X*Z^3-3*Y*Z^3+Z^4)) := by sorry

theorem quartic2_homogeneous (K : Type*) [CommRing K] [Algebra ℚ K] (v : Fin 3 → K) (c : K) : MvPolynomial.eval₂ (algebraMap ℚ K) (fun j => c*v j) quartic2 = c^4 * MvPolynomial.eval₂ (algebraMap ℚ K) v quartic2 := by sorry

theorem quartic2_affine (K : Type*) [CommRing K] [Algebra ℚ K] (x y : K) : MvPolynomial.eval₂ (algebraMap ℚ K) ![x,y,1] quartic2 = -x^4+2*x^3*y+x^2*y^2+8*x^3*(1:K)+2*x^2*y*(1:K)-2*x*y^2*(1:K)-y^3*(1:K)-3*x^2*(1:K)^2-3*x*y*(1:K)^2+3*y^2*(1:K)^2+2*x*(1:K)^3-3*y*(1:K)^3+(1:K)^4 := by sorry

-- quartic2_test_1
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,0,1] quartic2 = 1 := by sorry

-- quartic2_test_2
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![0,1,1] quartic2 = 0 := by sorry

-- quartic2_test_3
example : MvPolynomial.eval₂ (RingHom.id ℚ) ![-3,7,1] quartic2 = 0 := by sorry

def quartic2Coordinates {K : Type*} [CommRing K] (v : Fin 3 → K) : Fin 3 → K := ![3*v 0+v 1+2*v 2,8*v 0+v 1-8*v 2,4*v 0-2*v 1+v 2]

theorem quartic2Coordinates_coordinates {K : Type*} [CommRing K] (v : Fin 3 → K) : quartic2Coordinates v = ![3*v 0+v 1+2*v 2,8*v 0+v 1-8*v 2,4*v 0-2*v 1+v 2] := by sorry

theorem quartic2Coordinates_square {K : Type*} [CommRing K] (v : Fin 3 → K) : quartic2Coordinates (quartic2Coordinates v) = fun j => 25*v j := by sorry

theorem quartic2Coordinates_preserves (K : Type*) [CommRing K] [Algebra ℚ K] (v : Fin 3 → K) : MvPolynomial.eval₂ (algebraMap ℚ K) (quartic2Coordinates v) quartic2 = 625 * MvPolynomial.eval₂ (algebraMap ℚ K) v quartic2 := by sorry

-- quartic2Coordinates_test_basis0
example : quartic2Coordinates (![1,0,0] : Fin 3 → ℚ) = ![3,8,4] := by sorry

-- quartic2Coordinates_test_basis1
example : quartic2Coordinates (![0,1,0] : Fin 3 → ℚ) = ![1,1,-2] := by sorry

-- quartic2Coordinates_test_basis2
example : quartic2Coordinates (![0,0,1] : Fin 3 → ℚ) = ![2,-8,1] := by sorry

def quarticImaginaryPoints (K : Type*) [Field K] (s : K) : (Fin 3 → K) × (Fin 3 → K) := (![(1+s)/28,(27-s)/56,1], ![(3-s)/4,(3+3*s)/4,1])

theorem quarticImaginaryPoints_coordinates (K : Type*) [Field K] (s : K) : quarticImaginaryPoints K s = (![(1+s)/28,(27-s)/56,1], ![(3-s)/4,(3+3*s)/4,1]) := by sorry

theorem quarticImaginaryPoints_on_curve (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).1 quartic2 = 0 ∧ MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).2 quartic2 = 0 := by sorry

-- quarticImaginaryPoints_test_first
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).1 quartic2 = 0 := by sorry

-- quarticImaginaryPoints_test_second
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : MvPolynomial.eval₂ (Rat.castHom K) (quarticImaginaryPoints K s).2 quartic2 = 0 := by sorry

-- quarticImaginaryPoints_test_field
example (K : Type*) [Field K] [CharZero K] (s : K) (h : s^2 = -55) : (quarticImaginaryPoints K s).1 ≠ (quarticImaginaryPoints K s).2 ∧ (quarticImaginaryPoints K s).1 2 = 1 ∧ (quarticImaginaryPoints K s).2 2 = 1 ∧ (∀ q : ℚ, (quarticImaginaryPoints K s).1 0 ≠ (q : K)) ∧ (∀ q : ℚ, (quarticImaginaryPoints K s).2 0 ≠ (q : K)) := by sorry


/-!
## Mathematical interfaces

The following comments specify all eight layers in order, including the full
contracts of the coordinate declarations above. A name in these comments is
an intended declaration, not an executable theorem. Definitions, API lemmas
and named examples must use the genuine supplier carriers when available.
Sources and prerequisites use the README's abbreviations.
-/

/-
## Shared interfaces in the lifting argument

The CM extension of `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`
has two independent inputs. For AKT Theorem 7.1 (§7, p.67), let K be CM and
ρ:GK→GL₂(ℚ̄₂) continuous. Its residual representation is decomposed generic,
dihedral with quadratic inducing field M/K, and extends to
GK⁺→GL₂(𝔽₂). Require ρ unramified away from finitely many places. At every
v|2, its ordinary weight-zero shape is upper triangular with diagonal
αv, ε₂⁻¹βv for unramified αv,βv, and its Weil–Deligne representation is
unipotently ramified. The field M is ramified at each such v; write
Mv=Kv(√u) with ordv(u) odd. Also Kv(√−1)/Kv is unramified.
The output is a cuspidal, weight-zero, ι-ordinary GL₂ representation with
attached representation isomorphic to ρ, for an isomorphism ι:ℚ̄₂≅ℂ.
The dyadic residual image here is dihedral; a theorem assuming a nonsolvable
residual image does not provide this interface.

For AKT Theorem 8.1 (§8, pp.71–72; restated as Theorem A.14, §A.4, p.94),
take odd p, CM K and continuous ρ:GK→GL₂(ℚ̄p), unramified away from a finite
set, with det ρ=εp⁻¹. Require its residual representation to be decomposed
generic and absolutely irreducible on GK(ζp). Require ordinarity of weight
λ∈(ℤ²₊,₀)^Hom(K,ℚ̄p). There is an isomorphism ι:ℚ̄p≅ℂ and an
ι-ordinary cohomological cuspidal representation π of PGL₂(𝔸K) whose residual
attached representation is isomorphic to that of ρ. If p=5 and the projective
residual image on GK(ζ5) is PSL₂(𝔽5), the field cut out by the full projective
residual representation must exclude ζ5. The conclusion is a cuspidal
PGL₂ representation Π of weight ιλ, ι-ordinary, with rΠ,ι≅ρ.
IQ.2 uses its weight-zero specialization together with the dyadic theorem;
neither of these general lifting theorems is constructed in this roadmap.

The discriminant adapter from `ModularCurvesPartII:R12.4` includes AKT
Corollary 9.4 (§9, p.73) and Lemma 9.6 (§9, pp.74–75). In the latter input,
elliptic curves A,E have equal discriminants modulo sixth powers and E[3] is
irreducible. The coupling curve parametrizes simultaneous symplectic mod-2
and mod-3 identifications with A[2] and E[3], preserving this discriminant
class. The CM descent in Corollary 9.4 controls the sixth-root extension and
complex conjugation. Its local nonemptiness application uses Lemma 9.7,
pp.75–76, with the valuation and square/cube conditions spelled out in
`seed_modular`; it includes their openness when prescribed reduction types
are added. The CM globalization extension accompanying weak approximation
and `IG.2` must realize these compatible local choices while preserving the
designated avoidance field and every place over the generic witness.

The precise `CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2` interface
is the qualified form of CN Theorem 5.2 (§5.2, pp.73–74). It takes odd p,
imaginary CM F and continuous ρ:GF→GL₂(ℚ̄p), unramified away from finitely
many places, with determinant εp⁻¹ and potentially semistable labeled weights
{0,1} at all v|p. The residual representation is decomposed generic and
absolutely irreducible on GF(ζp); it satisfies the same p=5 projective-field
condition as above. There is a residual-matching weight-zero cuspidal
PGL₂ representation π. Where ρ is potentially crystalline, the local
attached representation of π is potentially ordinary of weight zero exactly
when ρ is, and rec(πv) has N=0. Where ρ is not potentially crystalline,
π is ι-ordinary of weight zero and its attached representation is also
not potentially crystalline. Include the supplier's qualification
[F(ζp):F]≠3 or full projective residual image not A₄. The conclusion is
automorphy of ρ by a weight-zero cuspidal PGL₂ representation.
For IQ.3, the qualification follows from [F(ζp):F]|p−1 for p=3,5;
it is retained in the general supplier statement.

Finally `ArithmeticGaloisRepresentations:R01.4` supplies two distinct
genericity comparisons. CN Lemma 6.2.2 (§6.2, pp.90–91) takes a quadratic
F/ℚ and odd p: absolute irreducibility on GF(ζp) gives a single rational
decomposed-generic prime simultaneously at its conjugate places. For the
Galois-over-ℚ CM field in `density_one`, the large-image comparison used in
CN Corollary 6.1.2 (§6.1, pp.87–88) instead assumes that the mod-5 image
contains SL₂(𝔽5). It gives decomposed genericity with the required
cyclotomic restriction. The application also uses the separate
projective-field exclusion at p=5. These comparisons belong to the
residual-image theory, rather than to the coefficient counting argument.

-/

/-!
## IQ.1. Modular elliptic curves over number fields
-/

/-
Modularity and its CM branch

Keep the geometric CM branch in the predicate even when the Tate module splits over the base field. The non-CM branch uses the actual automorphic and Tate-module carriers from the suppliers. Its isogeny API is obtained from the transport theorem in this layer.


TauCeti.ImaginaryQuadraticModularity.Modular
For a number field F and a Weierstrass curve E/F with Δ(E) ≠ 0, Modular(E) means: either End(E over F̄) is larger than ℤ (geometric CM), or there exist a rational prime p, an isomorphism ι:Q̄p≅ℂ and a cuspidal regular algebraic automorphic representation π of GL₂(𝔸F), cohomological of weight 0, such that rπ,ι≅rE,p∨ as continuous representations of GF. Weight 0 and the Tate-normalized local Langlands convention are those of CN §2. The CM branch does not impose cuspidality.

Assumptions: F is a number field. E is elliptic.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.IsElliptic, R16.4, AG2.7, R01.6/elliptic-tate-module-comparison, R01.6/determinant-and-oddness, R16.3, R16.6

Source: CN, §6.1, definition before Theorem 6.1, p.87

TauCeti.ImaginaryQuadraticModularity.Modular.of_cm: Geometric CM implies Modular(E), including when the CM field is contained in F.

TauCeti.ImaginaryQuadraticModularity.Modular.non_cm_iff: For a non-CM E/F, Modular(E) iff the displayed existence of p, ι, π and the dual Tate-module isomorphism holds.

TauCeti.ImaginaryQuadraticModularity.Modular.isogeny_iff: If E and E′ are F-isogenous elliptic curves, Modular(E) iff Modular(E′).

TauCeti.ImaginaryQuadraticModularity.Modular.test_cm (computation example): The smooth curve y²=x³+1 over ℚ(√−3) is Modular through its geometric CM, even though its Tate module splits over the CM field.

TauCeti.ImaginaryQuadraticModularity.Modular.test_rational_base (compatibility example): Every elliptic curve E/ℚ satisfies Modular(E), by EllipticCurveModularity R29.6 with the same dual normalization.

TauCeti.ImaginaryQuadraticModularity.Modular.test_dual_determinant (non-example example): For p=5 over a number field, det(rE,p)=εp and det(rE,p∨)=εp⁻¹ are distinct characters; an isomorphism to rE,p cannot replace the isomorphism to its dual.

-/

/-
One representation, all primes and local monodromy

Compare good-place polynomials over common coefficient fields before applying semisimple Chebotarev recognition. Strong multiplicity one identifies the automorphic representation up to isomorphism. At bad places, use the purity upgrade of local–global compatibility; at v|p, an auxiliary ℓ≠p first identifies a Steinberg twist, and the ordinary criterion applies to that local factor. These are four distinct comparisons.


TauCeti.ImaginaryQuadraticModularity.automorphic_unique
If F is a CM field and E/F is a non-CM modular elliptic curve, there is a unique cuspidal regular algebraic π of GL₂(𝔸F) of weight 0 giving the modularity isomorphism. Its central character is trivial; π therefore descends to PGL₂. Uniqueness is up to isomorphism, not equality of a chosen model.

Assumptions: F is imaginary CM. E is modular and non-CM.

Requires: IQ.1 Modular, R16.4, R01.6/elliptic-tate-module-comparison, R01.6/determinant-and-oddness, R16.3

Source: CN, Lemma 6.1.3(1), p.88


TauCeti.ImaginaryQuadraticModularity.automorphic_all_primes
With E/F and π as in automorphic_unique, for every rational prime p and every ι:Q̄p≅ℂ, rπ,ι≅rE,p∨ as continuous GF-representations. A common coefficient field and semisimple comparison are supplied before concluding an isomorphism.

Assumptions: F is imaginary CM. E is modular and non-CM.

Requires: IQ.1 automorphic_unique, AG2.7, R01.6/elliptic-tate-module-comparison, R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent

Source: CN, Lemma 6.1.3(2), p.88


TauCeti.ImaginaryQuadraticModularity.automorphic_wd
For E/F and π as above, every p, every ι and every finite place v∤p satisfy WD(rE,p∨|GFv)F-ss≅recᵀFv(πv). Frobenius semisimplification retains the monodromy N. This is an isomorphism of Weil–Deligne representations, not just an equality of their semisimplified Weil representations.

Assumptions: F is imaginary CM. E is modular and non-CM. v∤p.

Requires: IQ.1 automorphic_all_primes, AG2.5, EC local reduction, EC finite fields, R16.3

Source: CN, Lemma 6.1.3(3) and proof, p.88

Special case: At a good place N=0; at a potentially multiplicative place the Steinberg monodromy is nonzero after the appropriate twist.

Special case: No inference from equality of semisimple Weil representations alone is accepted.


TauCeti.ImaginaryQuadraticModularity.automorphic_potentially_multiplicative_ordinary
If E/F is non-CM modular and v|p is a place of potentially multiplicative reduction, then π is ι-ordinary at v of weight 0. For another prime ℓ≠p, full local–global compatibility identifies πv with a quadratic twist of Steinberg; transfer this local type to p-adic ordinarity.

Assumptions: F is imaginary CM. E is modular and non-CM. v|p and E has potentially multiplicative reduction at v.

Requires: IQ.1 automorphic_wd, EC local reduction, R21.1

Source: CN, Lemma 6.1.3(4) and proof, p.88

-/

/-
Transport of modularity

Transport the geometric CM branch directly. In the cuspidal branch transfer the rational Tate-module isomorphism, twist the automorphic representation by the matching quadratic character, and check irreducibility before soluble descent. This is the interface used for the Gaussian orbit and the Fricke-related quadratic pairs.


TauCeti.ImaginaryQuadraticModularity.modularity_transport
For elliptic curves over any number field, modularity is invariant under isogeny and quadratic twist, and is preserved under conjugating the number field. If L/F is a finite Galois solvable CM extension and E/L is the base change of E/F, modularity of E/L implies modularity of E/F. In the non-CM branch use irreducibility of the Tate representation over GL; CM is handled separately. Base change along a finite solvable number-field extension preserves modularity, allowing the CM branch when cuspidality fails.

Assumptions: Number fields for isogeny, twist, conjugacy and solvable base change; CM fields for the stated solvable descent.

Requires: IQ.1 Modular, PA.5/soluble-base-change-and-descent, R17.4, EC isogenies, R01.6/elliptic-tate-module-comparison, R01.6/functoriality-products-and-isogenies

Source: CN, §6.1, proof of Theorem 6.1, p.90; §7, proofs of Corollaries 7.1.2, 7.2.5 and 7.3.4, pp.93,97–98

Special case: The 4050.1-c3 calculation can be transported by ℚ(i)-isogeny, field conjugation and quadratic twisting.

Special case: The local monodromy and determinant normalizations are preserved.

-/

/-!
## IQ.2. Prescribed-type mod-3 and mod-5 switching
-/

/-
The fixed-pairing parameter curve and local preparation

Geometric genus zero does not give a rational point. The number-field twist uses the upstream fixed-pairing moduli construction, including its actual rigidification at level 3. Local preparation supplies the points and prototypes that turn the completion into a projective line. Its globalization contract simultaneously controls the CM real subfield, the avoidance field and every place over the chosen generic q.


TauCeti.ImaginaryQuadraticModularity.symplecticTwist
For p∈{3,5}, a number field F and continuous ρ̄:GF→GL₂(𝔽p) with det ρ̄=ε̄p, construct the smooth affine twist Yρ̄/F of the fixed-pairing full-level curve. For every extension K/F its K-points classify pairs (A/K,α), up to isomorphism, where A is elliptic and α:𝔽p²≅A[p](K̄) is a GK-equivariant symplectic identification with the restriction of the given ρ̄, with the standard determinant pairing on ρ̄ matched to the Weil pairing. For p=3 the simultaneous sign automorphism and the actual rigidified moduli problem must be treated through the upstream level-structure construction; no coarse universal curve is assumed. Its smooth proper completion has geometric genus zero.

Assumptions: p=3 or p=5. F is a number field. ρ̄ is continuous with cyclotomic determinant.

Requires: Modular twists, R12.4, EC torsion, R01.6/elliptic-tate-module-comparison, R01.6/torsion-and-residual-representation

Source: CN, Proof of Proposition 6.1.5, p.89; AKT §9, twists in Lemmas 9.6–9.7, pp.74–76

TauCeti.ImaginaryQuadraticModularity.symplecticTwist.points: The stated K-point classification holds naturally in K/F, with symplectic isomorphisms and the correct isomorphism relation.

TauCeti.ImaginaryQuadraticModularity.symplecticTwist.baseChange: For an extension K/F the base change of Yρ̄ is canonically the twist associated to ρ̄|GK; these identifications satisfy identity and composition.

TauCeti.ImaginaryQuadraticModularity.symplecticTwist.rational: If the smooth completion has an F-point, its genus-zero curve is F-isomorphic to ℙ¹, and Yρ̄ is the corresponding complement of the cusps.

TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_tautological (compatibility example): For ρ̄=A[p] in a symplectic basis, (A,id) gives an F-point of Yρ̄.

TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_pairing (non-example example): At p=5, the change of level basis diag(2,1) multiplies the Weil pairing exponent by 2 and is not symplectic; it cannot act as a pairing-preserving identification.

TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_local_trivial (characterisation example): Over a local field K containing μp, the trivial ρ̄ and any A with all p-torsion K-rational yield a K-point after choosing a symplectic basis; geometric genus zero alone does not assert a K-point.


TauCeti.ImaginaryQuadraticModularity.solvable_preparation
Let F be imaginary CM, p∈{3,5}, ρ̄:GF→GL₂(𝔽p) continuous, cyclotomic determinant and decomposed generic, and Favoid/F finite Galois. There is a finite Galois solvable CM extension L/F disjoint from Favoid such that each w|2,3,p is split over L⁺ and ρ̄|GLw is trivial; for every w|p there are local elliptic curves with good ordinary and good supersingular reduction and rational p-torsion; Lw(√−1)/Lw is unramified at w|2; a rational prime q>5 witnessing decomposed genericity splits completely in L. Local degrees and the chosen witness are part of the output. Where ζ5 must be excluded, enlarge the avoidance field by F(ζ5) before constructing L.

Assumptions: F imaginary CM; p=3 or 5. ρ̄ has cyclotomic determinant and is decomposed generic. Favoid/F finite Galois.

Requires: Weak approximation, IG.2, R01.4, EC local reduction, AG2.7/infinitely-many-decomposed-generic-primes

Source: CN, Proof of Proposition 6.1.5, p.89; proof of Proposition 6.1.6, p.90, compared with AKT 9.13–9.15; AKT §9, Propositions 9.13 and 9.15, pp.79–81

Special case: The witness q is one rational prime and every place above it is retained, not only one selected place.

Special case: Disjointness from Favoid preserves residual image only if the required residual field was included in Favoid.

Special case: A retained q supplies genericity; full image preservation separately requires the residual field in the avoidance datum. No enormousness assumption is inserted at p=3.

-/

/-
The independent modularity seed and Hilbert selection

The general CM dihedral 2-adic and ordinary odd-prime lifting theorems are imported from the CM extension of R21.4. AKT discriminant descent and the mod-2/mod-3 coupling belong to R12.4. Here their hypotheses are assembled for the auxiliary curve, with locally open discriminant conditions and thin-set avoidance. The p-adic reduction partition is prescribed separately.


TauCeti.ImaginaryQuadraticModularity.seed_modular
Let K be imaginary CM and A/K elliptic with discriminant Δ from a chosen Weierstrass equation. Suppose: at each v|2, A is a Tate curve, Kv(√−1)/Kv is unramified, ordv Δ≡3 mod 6, and Δ/Δc is a square in Kv; at each v|3, A is a Tate curve, ordv Δ≡2 or 4 mod 6, and Δ/Δc is a cube in Kv; for M=K(ζ12,(Δ/Δc)^(1/6)), r̄A,3|GM is decomposed generic and its image on GM(ζ3) is conjugate to SL₂(𝔽3). Then A is modular. Here c is the CM involution; the choices of sixth root do not affect the field M.

Requires: IQ.1 Modular, IQ.1 modularity_transport, IQ.2 symplecticTwist, R01.4, EC local reduction, R12.4

Source: AKT, §9, Proposition 9.12, p.79; Lemma 9.11, pp.78–79, and Corollary 9.4, p.73

Special case: No condition at places above 5 occurs; changing the 5-adic reduction does not affect this seed.

Special case: The residue characteristic two hypothesis is dihedral, not nonsolvable; R22.6/R32.3 alone do not supply it.


TauCeti.ImaginaryQuadraticModularity.hilbert_local_selection
After solvable_preparation has made Yρ̄ an open subcurve of ℙ¹L, given nonempty open subsets Ωw⊂Yρ̄(Lw) at all the finitely many selected places and the finite covers encoding auxiliary large mod-3 or mod-5 image, there is an L-point in every Ωw outside the relevant thin exceptional sets. In the p=5 construction impose the AKT 9.7 discriminant-conjugacy, Tate valuation and large mod-3 conditions for seed_modular; independently choose at every w|5 ordinary, supersingular or split multiplicative local prototypes according to the prescribed partition. In the p=3 construction impose Tate reduction at every place above 5 for the ordinary mod-5 seed without constraining the prescribed 3-adic ordinary/supersingular/multiplicative choices.

Requires: IQ.2 symplecticTwist, IQ.2 solvable_preparation, Weak approximation, IG.2, EC local reduction

Source: CN, §6.1, proofs of Propositions 6.1.5–6.1.6, pp.89–90; AKT §9, Lemma 9.7, pp.75–76, Propositions 9.13 and 9.15 and Corollary 9.14, pp.79–81

Special case: Every place over the prescribed prime is constrained, not just the chosen lift of a place.

Special case: A point found by finite search is not a substitute for avoiding the thin set.

-/

/-
Switching outputs and their automorphic local types

The retained Tate places give the auxiliary curve a non-CM witness independently of its prescribed ordinary/supersingular partition. Use CM potentially good reduction everywhere and nonintegral j at a Tate place before choosing its cuspidal modular representation. The good-reduction comparison then gives an unramified local factor, while the multiplicative comparison gives ordinarity.


TauCeti.ImaginaryQuadraticModularity.switch_five
Let F be imaginary CM, ρ̄:GF→GL₂(𝔽5) continuous with det=ε̄5 and decomposed generic, and partition the places v|5 as S5st⊔S5ord⊔S5ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,5≅ρ̄|GL, and ρ̄|GL remains decomposed generic. ζ5∉F is not a hypothesis of this proposition. The construction also retains Tate reduction at every place above 2 and 3, independently of the prescribed 5-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere.

Assumptions: F imaginary CM. ρ̄ continuous, det=ε̄5, decomposed generic. The three sets partition every place above 5. Favoid/F finite Galois.

Requires: IQ.2 solvable_preparation, IQ.2 hilbert_local_selection, IQ.2 seed_modular, EC isogenies, EC local reduction

Source: CN, Proposition 6.1.5, pp.88–89

Special case: Taking S5ss to be all 5-adic places yields an auxiliary curve with good supersingular reduction everywhere above 5.

Special case: The modularity argument never invokes the target CN Theorem 6.1, avoiding a cycle.

Special case: The auxiliary curve is non-CM even when every prescribed 5-adic place is supersingular: retain its Tate places above 2 and 3.


TauCeti.ImaginaryQuadraticModularity.switch_three
Let F be imaginary CM with ζ5∉F, ρ̄:GF→GL₂(𝔽3) continuous with det=ε̄3 and decomposed generic, and partition all places v|3 as S3st⊔S3ord⊔S3ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,3≅ρ̄|GL, and ρ̄|GL remains decomposed generic. The construction also retains Tate reduction at every place above 5, independently of the prescribed 3-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere.

Assumptions: F imaginary CM and ζ5∉F. ρ̄ continuous, det=ε̄3, decomposed generic. The three sets partition every place above 3. Favoid/F finite Galois.

Requires: IQ.2 solvable_preparation, IQ.2 hilbert_local_selection, IQ.2 switch_five, IQ.2 seed_modular, R01.4, EC isogenies, EC local reduction

Source: CN, Proposition 6.1.6, pp.89–90; AKT §9, Corollary 9.14 and Proposition 9.15, pp.80–81

Special case: The ζ5 condition belongs here and is kept when invoking the ordinary mod-5 seed.

Special case: Supersingular at 3 is allowed; ordinary modularity lifting is used at 5, not incorrectly at 3.

Special case: The auxiliary curve is non-CM even when every prescribed 3-adic place is supersingular: retain its Tate places above 5.


TauCeti.ImaginaryQuadraticModularity.auxiliary_local_types
For A/L supplied by switch_five (p=5) or switch_three (p=3), A is non-CM by its retained Tate places; let π be its weight-zero cuspidal modular representation with rπ,ι≅rA,p∨. For every w|p above v of F, π is ι-ordinary if v∈Spst; πw is unramified if v∈Spord∪Spss. In the latter case the associated p-adic representation is crystalline with N=0 and is potentially ordinary precisely in the ordinary case. Use p=5 for switch_five and p=3 for switch_three when applying CN Lemma 6.1.7.

Requires: IQ.2 switch_five, IQ.2 switch_three, IQ.1 automorphic_wd, IQ.1 automorphic_potentially_multiplicative_ordinary, EC local reduction, EC isogenies

Source: CN, Lemma 6.1.7, p.90, and Theorem 6.1 proof

Special case: A Tate place excludes CM of A; no inference from CM of A to modularity of the target E is used.

-/

/-!
## IQ.3. CM modularity and equation density
-/

/-
Elliptic input to qualified CM lifting

The local representation comparison is unconditional for elliptic curves. Only the witness-preserving extension clause assumes residual decomposed genericity. Match its reduction partition with the switching output and invoke the imported qualified lifting theorem. At p=3,5 the cyclotomic extension degree divides p−1 and so is never 3; the separate p=5 projective-field condition still needs the residual-image lemma and full avoidance. Soluble descent returns to the original field.


TauCeti.ImaginaryQuadraticModularity.elliptic_lifting_data
For an elliptic curve E over an imaginary CM field F and p∈{3,5}, ρ=rE,p∨ is continuous, det ρ=εp⁻¹ and unramified at almost all finite places. At every v|p it is potentially semistable with the source-normalized labeled Hodge–Tate weights {0,1}. For the extension assertion additionally assume the selected residual representation is decomposed generic, fix a witnessing rational prime q>5, and fix a finite Galois avoidance field containing the residual and cyclotomic fields. Then after a finite Galois solvable CM extension disjoint from that avoidance field and splitting every place above q, the potentially good places are Barsotti–Tate (ordinary exactly at the potentially ordinary ones), while the potentially multiplicative places become split multiplicative and the dual local representation is a noncrystalline extension of εp⁻¹ by 1. Translate the imported convention HT(εp)=+1 to CN’s HT(εp)=−1 when using R06; do not swap the covariant Tate module with its dual.

Assumptions: The determinant, ramification and potentially semistable weight assertions require only E/F elliptic, F imaginary CM and p∈{3,5}. The witness-preserving extension assertion additionally requires residual decomposed genericity, a fixed witnessing rational q>5 and a specified finite Galois avoidance field.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.IsElliptic, EC local reduction, R06.5, R06.6, IQ.2 solvable_preparation, R01.6/elliptic-tate-module-comparison, R01.6/determinant-and-oddness, AG2.7/infinitely-many-decomposed-generic-primes

Source: CN, Proof of Theorem 6.1, p.90, with §5.2, Theorem 5.2, pp.73–74

Special case: For the source convention the dual, not the covariant Tate module, has weights {0,1}.

Special case: The potentially multiplicative case has N≠0 and cannot enter the crystalline set.

Special case: A curve with no supplied generic witness still has the unconditional local comparison; the witness-preserving extension clause cannot be invoked for it.


TauCeti.ImaginaryQuadraticModularity.cm_modularity
Let F be an imaginary CM number field with ζ5∉F and E/F elliptic. If for at least one p∈{3,5}, r̄E,p is decomposed generic and r̄E,p|GF(ζp) is absolutely irreducible, then E is modular. No Galois-over-ℚ hypothesis is imposed. Decomposed genericity has the existential rational-prime/all-places eigenvalue-nonratio meaning, not merely distinct eigenvalues.

Assumptions: F imaginary CM with ζ5∉F. E elliptic. There exists p=3 or p=5 with both stated residual hypotheses.

Requires: IQ.1 Modular, IQ.3 elliptic_lifting_data, IQ.2 switch_five, IQ.2 switch_three, IQ.2 auxiliary_local_types, IQ.1 modularity_transport, R01.4/restriction-to-the-cyclotomic-field, AG2.7/existential-decomposed-genericity, CL.9/thm-5-2

Source: CN, Theorem 6.1 and proof, pp.87,90

Special case: Theorem applies to non-Galois CM fields when the residual conditions are given.

Special case: The final statement is never extended to ζ5∈F by deleting that hypothesis.

Special case: The supplier’s extra condition d_cyc≠3 or projective image not A4 is discharged by d_cyc|p−1 for p=3,5; its general odd-prime theorem is not silently strengthened.


TauCeti.ImaginaryQuadraticModularity.quadratic_modularity
Let F be imaginary quadratic and E/F elliptic. If r̄E,3|GF(ζ3) or r̄E,5|GF(ζ5) is absolutely irreducible, E is modular. The quadratic-field Goursat/Chebotarev lemma supplies decomposed genericity; it is not an additional hypothesis on E. Since [ℚ(ζ5):ℚ]=4, an imaginary quadratic F does not contain ζ5.

Assumptions: F imaginary quadratic. E elliptic. The restriction for p=3 or 5 is absolutely irreducible.

Requires: IQ.3 cm_modularity, R01.4

Source: CN, Corollary 6.1.1, p.87, and Lemma 6.2.2, pp.90–91

Special case: Absolute irreducibility is on the cyclotomic restriction; irreducibility over 𝔽p alone is not substituted here.

-/

/-
Integral equations and quantitative density

Count coefficient pairs in the integral lattice, including distinct pairs defining isomorphic curves. The fixed norm is on the real tensor of the full coefficient lattice. The quantitative exceptional-image estimate, lattice denominator asymptotic and deletion of the singular locus come from ST.0–ST.2. Ordinary Hilbert irreducibility alone does not supply the counting bound.


TauCeti.ImaginaryQuadraticModularity.shortEquationFamily
For a number field F with ring of integers 𝒪F, the equation family is the set of pairs (a,b)∈𝒪F² with 4a³+27b²≠0, representing y²=x³+ax+b via the existing five-coefficient Weierstrass curve (0,0,0,a,b). Its ordering is H(a,b)=‖(a,b)‖ for a fixed norm on the finite-dimensional real vector space ℝ⊗ℤ𝒪F² as in Zywina §1.1. Distinct coefficient pairs are counted separately, without isomorphism quotient or stabilizer weights. At X count pairs with H≤X; take the ratio of modular pairs to all nonsingular pairs and its limit as X→∞.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.Δ, Mathlib WeierstrassCurve.IsElliptic, ST.0

Source: CN, Corollary 6.1.2 proof, pp.87–88; ZYW §1.1, pp.1–2, and §5, Proposition 5.2, p.6 (proof §5.4, p.9)

TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.mem: Membership is exactly a,b integral and 4a³+27b²≠0.

TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.discriminant: The associated Mathlib curve has Δ=−16(4a³+27b²), so the family condition is exactly ellipticity in characteristic zero.

TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.height_count: The family’s count at X equals the ST.0 unweighted count of its coefficient lattice points of norm ≤X; no curve-isomorphism quotient enters.

TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_zero (degenerate example): (0,0) is excluded because its discriminant is zero.

TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_one (computation example): (0,1) is included and its discriminant is −432.

TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_scaling (non-example example): The pairs (0,1) and (0,64) are distinct family elements, although their curves are F-isomorphic by scaling x by 4 and y by 8; a count of isomorphism classes would identify them.


TauCeti.ImaginaryQuadraticModularity.density_one
Fix an imaginary CM number field F, Galois over ℚ, with ζ5∉F, and any norm height of shortEquationFamily. As X→∞, the fraction of nonsingular integral short Weierstrass equations of height ≤X defining modular elliptic curves tends to 1. For d=[F:ℚ], the bad-image fraction is O((log X)^β/X^(d/2)) for a constant β and constants depending on F and the fixed norm, by Zywina Proposition 5.2. This quantitative bound is for failure of the mod-5 image to contain SL₂(𝔽5); modularity failure is a subset. This is not a statement about all imaginary fields, or about isomorphism classes.

Assumptions: F fixed imaginary CM, Galois over ℚ. ζ5∉F. Coefficient pairs are ordered by a fixed norm on ℝ⊗ℤ𝒪F².

Requires: IQ.3 shortEquationFamily, IQ.3 cm_modularity, R01.4, R01.4/restriction-to-the-cyclotomic-field, ST.2

Source: CN, Corollary 6.1.2, pp.87–88 (=Theorem 1.2); ZYW §5, Proposition 5.2, p.6 (proof §5.4, p.9)

Special case: The denominator is the number of nonsingular integral equations, not the number of isomorphism classes.

Special case: For F=ℚ(i), the statement yields the specified equation density, while the stronger unconditional curve theorem uses the separate X₀(15) route.

-/

/-!
## IQ.4. Cartan modular curves and explicit j-maps
-/

/-
Coarse compactification

Consume the generic Cartan/mixed compactification after R13.4a and own its source-specific adapter here. Construct the smooth proper curves and extended maps before comparing their coordinate models.


TauCeti.ImaginaryQuadraticModularity.cartanCurve
Over ℚ, for a prime p and H⊂GL₂(𝔽p) containing −I with surjective determinant, X(H) is the smooth proper compactification of the imported affine coarse curve YH; j:X(H)→X(1)=ℙ¹ extends its j-map. For distinct primes p₁,p₂ and such H₁,H₂, X(H₁,H₂) is the smooth projective normalization of X(H₁)×X(1)X(H₂). Cusps are exactly j⁻¹(∞). The application subgroups are Borel bp, split and nonsplit normalizers sp,nsp, and actual nonsplit Cartan ns3°. The same formula cannot identify ns3° with the normalizer ns3.

Assumptions: pᵢ prime, distinct in mixed level. −I∈Hᵢ and det Hᵢ=𝔽pᵢ×. Base ℚ, and number-field points in characteristic zero.

Requires: Coarse quotient, R13.4a, Mathlib AlgebraicGeometry.Scheme.Hom.normalization, R01.4/cartan-subgroups-and-normalisers

Source: CN, §7.1, pp.92–93, definition of X(H) and X(H₁,H₂)

TauCeti.ImaginaryQuadraticModularity.cartanCurve.j: There is a finite j-morphism to ℙ¹ℚ extending the affine coarse j-map; its inverse image of infinity is exactly the cusps.

TauCeti.ImaginaryQuadraticModularity.cartanCurve.mixed: The mixed curve, with both projections, is uniquely the smooth proper normal model of the coarse fiber product’s function field; on its dense open it is the original mixed level moduli curve.

TauCeti.ImaginaryQuadraticModularity.cartanCurve.points: An elliptic E/F with a simultaneous H₁×H₂ orbit of torsion bases fixed by GF gives a noncuspidal F-point with j=j(E). Conversely a geometric coarse point is such a geometric isomorphism class with a GF-fixed orbit; for non-CM j≠0,1728 one may choose an F-model and any two have the same quadratic-twist class. This is a coarse statement, not a fine universal elliptic curve over X(H₁,H₂).

TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_borel (compatibility example): X(b3,b5) is the compactified X₀(15), with cusps j=∞ and rational noncuspidal points representing rational cyclic 15-isogeny level.

TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_index_two (non-example example): The map X(ns3°)→X(ns3) has degree two; treating Cartan as its normalizer would give degree one and destroy the branched genus-one/quartic models.

TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_distinct_primes (characterisation example): A mixed point from E has ηᵢ⁻¹r̄E,pᵢ(GF)ηᵢ⊂Hᵢ separately for i=1,2; it does not use one residual prime in both conditions.

-/

/-
Five source-normalized j-functions

Keep these exact coordinates when forming mixed fiber products. Their projective map degrees are respectively 4,6,3,10,6, whereas their integer degrees are 3,1,3,0,3. Record zero and infinity cusp orders using reduced fractions. The Fricke action at b5 is 125/x; the 5/x action in the genus-one mixed quotient is a different coordinate formula.


TauCeti.ImaginaryQuadraticModularity.b3J
Define b3J∈RatFunc ℚ by the rational expression (x+27)(x+3)³/x, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b3) only through the identification in small_curve_models. Its morphism degree is 4; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.

Requires: Mathlib RatFunc.mk, Mathlib RatFunc.eval, Mathlib RatFunc.intDegree

Source: CN, Proposition 7.1.3(1), p.94

TauCeti.ImaginaryQuadraticModularity.b3J_fraction: b3J is exactly the displayed RatFunc.mk expression (x+27)(x+3)³/x.

TauCeti.ImaginaryQuadraticModularity.b3J_eval: For a characteristic-zero field K, x∈K and the denominator x nonzero, evaluating b3J along ℚ→K at x gives (x+27)(x+3)³/x.

TauCeti.ImaginaryQuadraticModularity.b3J_intDegree: RatFunc.intDegree(b3J)=3; the actual geometric j-morphism degree is 4, proved with small_curve_models.

TauCeti.ImaginaryQuadraticModularity.b3J_test_one (computation example): b3J evaluated at x=1 is 1792.

TauCeti.ImaginaryQuadraticModularity.b3J_test_zero_j (computation example): b3J evaluated at x=−3 is 0.

TauCeti.ImaginaryQuadraticModularity.b3J_test_cusp (non-example example): The reduced denominator of b3J vanishes at 0; totalized field evaluation there is 0 but the geometric j-map has a pole, not a j=0 point.


TauCeti.ImaginaryQuadraticModularity.b5J
Define b5J∈RatFunc ℚ by the rational expression (x²+250x+3125)³/x⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b5) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 1, a different invariant. Cusp evaluation is never read as a finite field quotient.

Requires: Mathlib RatFunc.mk, Mathlib RatFunc.eval, Mathlib RatFunc.intDegree

Source: CN, Proposition 7.1.3(2), p.94

TauCeti.ImaginaryQuadraticModularity.b5J_fraction: b5J is exactly the displayed RatFunc.mk expression (x²+250x+3125)³/x⁵.

TauCeti.ImaginaryQuadraticModularity.b5J_eval: For a characteristic-zero field K, x∈K and the denominator x⁵ nonzero, evaluating b5J along ℚ→K at x gives (x²+250x+3125)³/x⁵.

TauCeti.ImaginaryQuadraticModularity.b5J_intDegree: RatFunc.intDegree(b5J)=1; the actual geometric j-morphism degree is 6, proved with small_curve_models.

TauCeti.ImaginaryQuadraticModularity.b5J_test_one (computation example): b5J evaluated at x=1 is 38477541376.

TauCeti.ImaginaryQuadraticModularity.b5J_test_minus_five (computation example): b5J evaluated at x=−5 is -2194880.

TauCeti.ImaginaryQuadraticModularity.b5J_test_cusp (non-example example): The reduced denominator of b5J vanishes at 0, which is a cusp rather than a finite j-value.


TauCeti.ImaginaryQuadraticModularity.ns3J
Define ns3J∈RatFunc ℚ by the rational expression x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns3) only through the identification in small_curve_models. Its morphism degree is 3; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.

Requires: Mathlib RatFunc.mk, Mathlib RatFunc.eval, Mathlib RatFunc.intDegree

Source: CN, Proposition 7.1.3(3), p.94

TauCeti.ImaginaryQuadraticModularity.ns3J_fraction: ns3J is exactly the displayed RatFunc.mk expression x³.

TauCeti.ImaginaryQuadraticModularity.ns3J_eval: For a characteristic-zero field K, x∈K and the denominator 1 nonzero, evaluating ns3J along ℚ→K at x gives x³.

TauCeti.ImaginaryQuadraticModularity.ns3J_intDegree: RatFunc.intDegree(ns3J)=3; the actual geometric j-morphism degree is 3, proved with small_curve_models.

TauCeti.ImaginaryQuadraticModularity.ns3J_test_zero (computation example): ns3J evaluated at x=0 is 0.

TauCeti.ImaginaryQuadraticModularity.ns3J_test_two (computation example): ns3J evaluated at x=2 is 8.

TauCeti.ImaginaryQuadraticModularity.ns3J_test_polynomial (compatibility example): ns3J has reduced denominator 1 and intDegree=3; infinity is its unique pole.


TauCeti.ImaginaryQuadraticModularity.ns5J
Define ns5J∈RatFunc ℚ by the rational expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns5) only through the identification in small_curve_models. Its morphism degree is 10; its RatFunc.intDegree (numerator degree minus denominator degree) is 0, a different invariant. Cusp evaluation is never read as a finite field quotient.

Requires: Mathlib RatFunc.mk, Mathlib RatFunc.eval, Mathlib RatFunc.intDegree

Source: CN, Proposition 7.1.3(4), p.94

TauCeti.ImaginaryQuadraticModularity.ns5J_fraction: ns5J is exactly the displayed RatFunc.mk expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.

TauCeti.ImaginaryQuadraticModularity.ns5J_eval: For a characteristic-zero field K, x∈K and the denominator (x²+x−1)⁵ nonzero, evaluating ns5J along ℚ→K at x gives 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.

TauCeti.ImaginaryQuadraticModularity.ns5J_intDegree: RatFunc.intDegree(ns5J)=0; the actual geometric j-morphism degree is 10, proved with small_curve_models.

TauCeti.ImaginaryQuadraticModularity.ns5J_test_zero (computation example): ns5J evaluated at x=0 is 0 and this is not a cusp.

TauCeti.ImaginaryQuadraticModularity.ns5J_test_minus_half (computation example): ns5J evaluated at x=−1/2 is 0.

TauCeti.ImaginaryQuadraticModularity.ns5J_test_infinity (non-example example): ns5J has intDegree=0 and finite value 8000 at infinity; its poles are the two roots of x²+x−1, not infinity.


TauCeti.ImaginaryQuadraticModularity.s3J
Define s3J∈RatFunc ℚ by the rational expression 27(x+1)³(x−3)³/x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(s3) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.

Requires: Mathlib RatFunc.mk, Mathlib RatFunc.eval, Mathlib RatFunc.intDegree

Source: CN, Proposition 7.1.3(6), p.94

TauCeti.ImaginaryQuadraticModularity.s3J_fraction: s3J is exactly the displayed RatFunc.mk expression 27(x+1)³(x−3)³/x³.

TauCeti.ImaginaryQuadraticModularity.s3J_eval: For a characteristic-zero field K, x∈K and the denominator x³ nonzero, evaluating s3J along ℚ→K at x gives 27(x+1)³(x−3)³/x³.

TauCeti.ImaginaryQuadraticModularity.s3J_intDegree: RatFunc.intDegree(s3J)=3; the actual geometric j-morphism degree is 6, proved with small_curve_models.

TauCeti.ImaginaryQuadraticModularity.s3J_test_one (computation example): s3J evaluated at x=1 is −1728.

TauCeti.ImaginaryQuadraticModularity.s3J_test_minus_one (computation example): s3J evaluated at x=−1 is 0.

TauCeti.ImaginaryQuadraticModularity.s3J_test_cusp (non-example example): The reduced denominator of s3J vanishes at 0 and intDegree=3; 0 and infinity are poles.


TauCeti.ImaginaryQuadraticModularity.small_curve_models
There are ℚ-isomorphisms X(b3), X(b5), X(ns3), X(ns5), X(s3)≅ℙ¹ with j-functions b3J, b5J, ns3J, ns5J, s3J respectively. Under the b5 coordinate the Fricke involution w5 sends x to 125/x. The j-map degrees are respectively 4,6,3,10,6, with the pole multiplicities read from the displayed rational functions. These degrees include infinity and are not RatFunc.intDegree.

Requires: IQ.4 cartanCurve, IQ.4 b3J, IQ.4 b5J, IQ.4 ns3J, IQ.4 ns5J, IQ.4 s3J, R13.4a

Source: CN, Proposition 7.1.3(1)–(4),(6), p.94

Special case: The b5 coefficient is 250 in this coordinate, not the coefficient 10 of another standard X₀(5) coordinate.

Special case: The ns5 value at infinity is 8000, so infinity is noncuspidal.

-/

/-
The actual nonsplit Cartan conic

The nonsplit conic is a degree-two cover of the rational normalizer curve. Completing the square gives its rational-point obstruction and provides a direct test against conflating the two groups. Its coordinate projection uses the normalized ns3 model just constructed.


TauCeti.ImaginaryQuadraticModularity.nonsplit_cartan_conic
X(ns3°) is the smooth projective conic Y²+3X²+36XZ+432Z²=0 over ℚ. Its degree-two map to X(ns3) sends [X:Y:Z] to [X:Z], with j=(X/Z)³ on Z≠0 and cusp fiber at Z=0 defined over ℚ(√−3). It has no ℚ-point: its equation is Y²+3(X+6Z)²+324Z²=0. This source-specific comparison distinguishes the actual Cartan from its rational normalizer curve.

Requires: IQ.4 cartanCurve, IQ.4 small_curve_models, IQ.4 ns3J, R01.4/cartan-subgroups-and-normalisers

Source: CN, Proof of Proposition 7.2.1, p.95; Proposition 7.4.3 proof, p.100; ns3ons5.m opening

Special case: The cover has geometric genus zero but no rational point. It cannot be replaced by ℙ¹ℚ.

-/

/-
The common elliptic quotient and its rational group

The literal Weierstrass equation is the baseline algebraic object. Its modular identification must transport j and the normalization maps. A rank-one certificate includes saturation and trivial torsion, so the chosen point D is a generator rather than just a nontorsion point. This distinction enters the quartic index bounds.


TauCeti.ImaginaryQuadraticModularity.B
Let B/ℚ be the existing WeierstrassCurve with coefficients (0,0,−1,0,1), so its equation is y²−y=x³+1. Its discriminant is −675 and its j-invariant is 0. Its use as X(ns3,ns5), and its Mordell–Weil group, are comparison/arithmetic theorems rather than fields of this definition.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.Δ, Mathlib WeierstrassCurve.IsElliptic, Mathlib WeierstrassCurve.j, Mathlib WeierstrassCurve.baseChange, Mathlib WeierstrassCurve.Affine.Equation, Mathlib WeierstrassCurve.Affine.Point.mk

Source: CN, Proposition 7.1.3(5), p.94; ns3ns5-elliptic.m

TauCeti.ImaginaryQuadraticModularity.B_coefficients: B has a₁=a₂=a₄=0, a₃=−1 and a₆=1.

TauCeti.ImaginaryQuadraticModularity.B_discriminant: B.Δ=−675 and therefore B is elliptic over ℚ.

TauCeti.ImaginaryQuadraticModularity.B_baseChange: For a characteristic-zero field K with ℚ-algebra structure, B.baseChange K has the same coefficients and equation; identity and composite coefficient changes agree.

TauCeti.ImaginaryQuadraticModularity.B_test_j (computation example): The Mathlib j-invariant of B is 0.

TauCeti.ImaginaryQuadraticModularity.B_test_point (computation example): (x,y)=(1,2) satisfies the actual B Weierstrass equation: 2²−2=1³+1.

TauCeti.ImaginaryQuadraticModularity.B_test_sign (non-example example): B.a₃=−1, not +1; (1,2) would fail the unshifted equation y²+y=x³+1.


TauCeti.ImaginaryQuadraticModularity.mixed_elliptic_model
X(ns3,ns5) is ℚ-isomorphic to B. On a dense affine model x³=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵, put A(t)=t²+t−1 and D(t)=(2t+1)(2t²+7t+8). The source map is [U:V:W]=[−(x/5)A(t)²:D(t):tD(t)], on the standard homogeneous Weierstrass equation V²W−VW²=U³+W³ of B. On V≠0,A(t)≠0 its inverse is t=W/V, x=−5(U/V)D(t)/A(t)². These are inverse rational maps and extend uniquely between the smooth proper normalizations. The raw singular affine fiber product is not itself B.

Requires: IQ.4 cartanCurve, IQ.4 small_curve_models, IQ.4 B

Source: CN, Proposition 7.1.3(5) and proof, p.94; ns3ns5-elliptic.m


TauCeti.ImaginaryQuadraticModularity.B_mordell_weil
B(ℚ) is infinite cyclic, with rank 1 and trivial torsion. A saturated generator D is part of the output; pullback arguments must not silently use an unsaturated nontorsion point as a generator. The source labels B as Cremona 225A1.

Requires: IQ.4 B, EC Mordell–Weil, ED.3, ED.6

Source: CN, Proposition 7.1.3(5), p.94; Proposition 7.4.4, p.100

Special case: Rank 1 alone is not a certificate that a point generates the full group.

-/

/-!
## IQ.5. Genus-one curves and rational divisor classes
-/

/-
The two conductor-fifteen curves and torsion growth

Identify the models together with their j-maps and cusp divisors. The rational isogeny transfers finiteness over a number field. Quadratic torsion growth is a separate theorem from quadratic rank: only the rank-zero hypothesis allows replacing all field-valued points by the listed torsion points. The eight new Gaussian points require their own orbit table.


TauCeti.ImaginaryQuadraticModularity.E15
Define E15/ℚ as WeierstrassCurve with coefficients (0,41,0,400,0), whose equation is y²=x(x+16)(x+25). Its discriminant is 207360000≠0. Identification with the modular curve and the rational group are separate theorems.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.Δ, Mathlib WeierstrassCurve.IsElliptic, Mathlib WeierstrassCurve.baseChange, Mathlib WeierstrassCurve.Affine.Equation, Mathlib WeierstrassCurve.Affine.Point.mk

Source: CN, Proof of Corollary 7.1.2, p.93

TauCeti.ImaginaryQuadraticModularity.E15_coefficients: The five coefficients are (0,41,0,400,0).

TauCeti.ImaginaryQuadraticModularity.E15_discriminant: Δ(E15)=207360000 and E15 is elliptic.

TauCeti.ImaginaryQuadraticModularity.E15_baseChange: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+16)(x+25), compatibly with identity and composition.

TauCeti.ImaginaryQuadraticModularity.E15_test_zero (computation example): (0,0) satisfies the E15 equation and gives a nonidentity point of order two.

TauCeti.ImaginaryQuadraticModularity.E15_test_roots (computation example): The three distinct roots of the cubic are 0,−16,−25.

TauCeti.ImaginaryQuadraticModularity.E15_test_delta (non-example example): Its discriminant is 207360000, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.


TauCeti.ImaginaryQuadraticModularity.Es35
Define Es35/ℚ as WeierstrassCurve with coefficients (0,17,0,16,0), whose equation is y²=x(x+1)(x+16). Its discriminant is 921600≠0. Identification with the modular curve and the rational group are separate theorems.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.Δ, Mathlib WeierstrassCurve.IsElliptic, Mathlib WeierstrassCurve.baseChange, Mathlib WeierstrassCurve.Affine.Equation, Mathlib WeierstrassCurve.Affine.Point.mk

Source: CN, Proof of Corollary 7.1.2, p.93

TauCeti.ImaginaryQuadraticModularity.Es35_coefficients: The five coefficients are (0,17,0,16,0).

TauCeti.ImaginaryQuadraticModularity.Es35_discriminant: Δ(Es35)=921600 and Es35 is elliptic.

TauCeti.ImaginaryQuadraticModularity.Es35_baseChange: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+1)(x+16), compatibly with identity and composition.

TauCeti.ImaginaryQuadraticModularity.Es35_test_zero (computation example): (0,0) satisfies the Es35 equation and gives a nonidentity point of order two.

TauCeti.ImaginaryQuadraticModularity.Es35_test_roots (computation example): The three distinct roots of the cubic are 0,−1,−16.

TauCeti.ImaginaryQuadraticModularity.Es35_test_delta (non-example example): Its discriminant is 921600, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.


TauCeti.ImaginaryQuadraticModularity.level_fifteen_models
There are ℚ-isomorphisms X(b3,b5)=X₀(15)≅E15 and X(s3,b5)≅Es35, with Cremona labels 15A1 and 15A3 respectively. Both have ℚ-points ℤ/2⊕ℤ/4 and rank zero, and they are ℚ-isogenous. In particular X₀(15)(F) is finite iff X(s3,b5)(F) is finite for any number field F. The maps must carry j and the cusp divisors, not just identify the abstract elliptic curves.

Requires: IQ.4 cartanCurve, IQ.5 E15, IQ.5 Es35, EC isogenies, EC Mordell–Weil, ED.3

Source: CN, Corollary 7.1.2 proof, p.93; FLHS arXiv v4 Lemmas 15.3–15.4, p.29 (published locators cited by CN are Lemmas 5.6–5.7)

Special case: The j-map and cusp divisor are transported along the coordinate changes; the Legendre equation alone does not supply them.


TauCeti.ImaginaryQuadraticModularity.quadratic_level_fifteen_torsion
Among quadratic number fields F, E15(F)tors strictly contains E15(ℚ) precisely for F=ℚ(i) or ℚ(√5); Es35(F)tors strictly contains Es35(ℚ) precisely for F=ℚ(√5). For the imaginary exception E15(ℚ(i)) has eight new torsion points beyond its eight rational points. Thus, under the rank-zero input for an imaginary F, Es35(F)=Es35(ℚ) and E15(F)=E15(ℚ) unless F=ℚ(i). No assertion of rank zero over an arbitrary F is part of this theorem.

Requires: IQ.5 level_fifteen_models, EC torsion, ED.3, ED.6

Source: CN, Corollary 7.1.2 proof, p.93, citing Kwon Theorem 1

Special case: ℚ(√5) is real and therefore is excluded by the final imaginary-field hypothesis.

Special case: The Es35 imaginary exception is empty, not ℚ(i).

-/

/-
The Gaussian exceptional orbit

Compute the long Weierstrass invariants in the existing carrier, then use a Faltings–Serre certificate for modularity. The output also matches all eight new noncuspidal E15 torsion j-values to this curve by isogeny, conjugation and quadratic twisting. The database record provides the equation and matching data, while the comparison criterion and test-set completeness come from R01.5 and CN.5.


TauCeti.ImaginaryQuadraticModularity.gaussianExceptional
For a characteristic-zero field K and i∈K with i²=−1, define gaussianExceptional(K,i) as WeierstrassCurve with coefficients (i,1,1,6+i,10−15i). Over ℚ(i) this is the LMFDB curve 4050.1-c3. Its discriminant is 58752+107136i and its j-invariant is (−47709+15363i)/256. These coefficient identities do not certify modularity.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.Δ, Mathlib WeierstrassCurve.IsElliptic, Mathlib WeierstrassCurve.j, Mathlib WeierstrassCurve.baseChange

Source: LMF-GAUSS, LMFDB 4050.1-c3, curve data; CN Corollary 7.1.2 proof, p.93

TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_coefficients: The five coefficients are (i,1,1,6+i,10−15i).

TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_discriminant: If i²=−1 in characteristic zero, Δ=58752+107136i≠0.

TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_j: With the resulting IsElliptic instance, the Mathlib j-invariant equals (−47709+15363i)/256.

TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_a1 (computation example): Its a₁ coefficient is i, not zero; it is a long Weierstrass model.

TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_conjugate (compatibility example): Changing i to −i gives the coefficientwise conjugate curve, with conjugate discriminant and j.

TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_j_nonrational (non-example example): Over ℚ(i) the coefficient of i in j is 15363/256≠0; the curve is not covered by the rational-j argument.


TauCeti.ImaginaryQuadraticModularity.gaussian_exceptional_modular
The curve gaussianExceptional over ℚ(i) is modular. Every noncuspidal j-value at the eight new E15(ℚ(i))-torsion points is the j-value of an elliptic curve obtained from gaussianExceptional by an ℚ(i)-isogeny, coefficient-field conjugation or quadratic twisting, and consequently is modular. Provide the explicit orbit/matching table and a Faltings–Serre comparison certificate for the one exceptional curve.

Requires: IQ.5 gaussianExceptional, IQ.5 quadratic_level_fifteen_torsion, IQ.1 modularity_transport, ED.6, R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, R01.5, CN.5

Source: CN, Proof of Corollary 7.1.2, p.93, citing DGP10 and LMFDB 4050.1-c3

Special case: A database flag or conductor match is not a proof of modularity.

Special case: The mod-3 and mod-5 images are Borel in the database example, so quadratic_modularity cannot be invoked to bypass this certificate.

-/

/-
The weighted quartic, its quotient and special points

The scalar −3 is fixed by the cusp field and determines a genuine twist. Use weighted projective coordinates at both infinity points. The double-cover quotient has coordinate x and j=b5J(x³); the Fricke relation needed for modularity is on this quotient. No choice of a lift of the involution is silently imposed on the double cover.


TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic
Define ns3b5Quartic=−3(X⁴+2X³−X²+10X+25)∈ℚ[X]. Its geometric model is the weighted projective equation Y²=−3(X⁴+2X³Z−X²Z²+10XZ³+25Z⁴) in ℙ(1,2,1); Y has weight 2, so ordinary projective homogenization is incorrect. The scalar −3 is a genuine quadratic twist fixed by the cusp field, not a removable normalization.

Requires: Mathlib Polynomial.X, Mathlib Polynomial.eval

Source: CN, Proposition 7.2.1(1) and proof, pp.94–95

TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_formula: The polynomial is exactly −3(X⁴+2X³−X²+10X+25).

TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_degree: Its degree is 4 and its leading coefficient is −3; the two points over infinity require a square root of −3.

TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_fricke: For x≠0, x⁴·ns3b5Quartic(5/x)=25·ns3b5Quartic(x), giving the coordinate part of the Fricke involution.

TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_zero (computation example): ns3b5Quartic(0)=−75.

TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_minus_two (computation example): ns3b5Quartic(−2)=−3.

TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_minus_five_half (computation example): ns3b5Quartic(−5/2)=−75/16, agreeing with y=5√−3/4.


TauCeti.ImaginaryQuadraticModularity.genus_one_model
The smooth weighted quartic C with Y²=ns3b5Quartic(X,Z) is ℚ-isomorphic to X(ns3°,b5) and has genus 1. Its map to X(ns3,b5)≅ℙ¹ has degree 2 and coordinate x; the latter j-function is (x⁶+250x³+3125)³/x¹⁵. The Fricke w5 sends x to 5/x. The double cover is ramified at the four simple roots of X⁴+2X³−X²+10X+25, and its cusp field is ℚ(√−3), fixing the scalar −3.

Requires: IQ.4 cartanCurve, IQ.4 small_curve_models, IQ.5 ns3b5Quartic, R13.4a, R01.4, IQ.4 nonsplit_cartan_conic

Source: CN, Proposition 7.2.1(1)–(2) and proof, pp.94–95

Special case: The j-function is b5J(x³), not b5J(x); the denominator is x¹⁵.


TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints
For a characteristic-zero field K and s∈K with s²=−3, define the list of weighted homogeneous coordinates ∞+=(1:s:0), ∞−=(1:−s:0), 0+=(0:5s:1), P₁=(−2:−s:1), P₂=(−5/2:5s/4:1). The construction consists of literal triples together with their lifts to C(K) via genus_one_model. Over K=ℚ(√−3) they are the points used to describe rational Jacobian classes.

Requires: IQ.5 ns3b5Quartic, IQ.5 genus_one_model, Jacobian A

Source: CN, Points displayed before Proposition 7.2.2, p.95

TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_coordinates: The five triples have exactly the coordinates displayed in the definition, in that order.

TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_on_curve: All five triples satisfy the weighted quartic equation and define points on C under genus_one_model.

TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_conjugate: Changing s to −s exchanges ∞+ with ∞− and gives the coefficientwise conjugates of the three affine points; the construction commutes with field embeddings.

TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_infinity (non-example example): The first two triples have Z=0 and opposite nonzero Y=±s; the weighted equation is Y²=−3X⁴, not the ordinary cubic equation.

TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_zero (computation example): For 0+, (5s)²=−75=ns3b5Quartic(0).

TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_p2 (computation example): For P₂, (5s/4)²=−75/16=ns3b5Quartic(−5/2).

-/

/-
Jacobian points versus rational divisor classes

Construct the Jacobian using the relative Picard interface without a rational basepoint on C. Over ℚ(√−3), translate by ∞− to write the three rational two-torsion classes explicitly. The descent of complete linear systems determines which classes contain rational divisors: the two insoluble conics leave only the subgroup generated by D₀.


TauCeti.ImaginaryQuadraticModularity.genus_one_jacobian
For C as above, JacC is ℚ-isomorphic to the elliptic curve y²=x³+3x²−720x−8100 (45A2), and JacC(ℚ)≅ℤ/2⊕ℤ/2. C(ℚ3)=∅, hence C(ℚ)=∅. Under the ℚ(√−3) identification P↦[P]−[∞−], its three nonzero rational classes are D₀,D₁,D₂ from genusOneSpecialPoints, each of order 2 and D₀+D₁=D₂. This identifies the Jacobian over ℚ without identifying the pointless genus-one curve C with it over ℚ.

Requires: IQ.5 genus_one_model, IQ.5 genusOneSpecialPoints, Jacobian D, ED.3, ED.6

Source: CN, Proposition 7.2.1(3) and points discussion, p.95; ns3ob5.m

Special case: The Abel–Jacobi point ∞− is only defined over ℚ(√−3); JacC/ℚ still exists by the imported relative Picard construction.


TauCeti.ImaginaryQuadraticModularity.genus_one_rational_picard
Let Pic⁰(C) denote degree-zero ℚ-rational divisors modulo ℚ-rational linear equivalence, mapped injectively into JacC(ℚ). Its image is {0,D₀}≅ℤ/2, and D₁,D₂ are rational Jacobian points not represented by rational divisors. For Ei=Di+∞++∞−, ℚ(√−3) Riemann–Roch bases are {1,fi} with f₀=(y+s x²+5s)/x, f₁=(y+s x²−5s)/(x+2), f₂=(y+s x²−5s)/(x+5/2). These are additive numerators y+s x²±5s, as in the corresponding quadratic fiber equations. The associated rational descent conics for E₁,E₂ are u²+3v²+6v+15=0 and u²+3v²+6v+12=0, both empty over ℚ; E₀’s conic u²+3v²+6v−33=0 has the rational point (3,2).

Requires: IQ.5 genus_one_jacobian, Jacobian A, Jacobian B, Jacobian D, ED.6

Source: CN, Proposition 7.2.2 and Remark 7.2.3, pp.95–96; BF §2, author PDF pp.2–4; ns3ob5.m

Special case: The rational Picard image has order 2 while JacC(ℚ) has order 4.

Special case: The quotient by the base divisor gives degree-zero classes; no rational base point of C is assumed.

-/

/-
Quadratic points and modularity

The rational conjugate divisor has one of two rational Picard classes. Riemann–Roch gives rational x or norm-five x, treating the degenerate leading coefficient and the infinity points separately. Rational x gives rational j; norm-five x gives a Fricke relation between quotient images and a geometric degree-5 Q-curve. Import the Q-curve endpoint for imaginary fields and FLHS for real quadratic fields.


TauCeti.ImaginaryQuadraticModularity.genus_one_quadratic_points
For any quadratic number field F, P∈C(F) other than the two points at infinity satisfies x(P)∈ℚ or x(P)x(σP)=5, where σ is the nontrivial automorphism of F/ℚ. The proof uses that P+σP is a rational effective divisor of degree 2 and its difference from ∞++∞− is either 0 or D₀ in the rational Picard image. In the nontrivial case the fiber equation (6−2sα)x²+(α²−33)x+(30−10sα)=0 has product of roots 5, with the degenerate leading-coefficient case handled separately.

Requires: IQ.5 genus_one_rational_picard, IQ.5 genus_one_model, Jacobian B, Jacobian C

Source: CN, Proposition 7.2.4, p.96

Special case: P=(1+2i,3+6i) on C/ℚ(i) is the nonrational-x case with xσ(x)=5.


TauCeti.ImaginaryQuadraticModularity.genus_one_points_modular
For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(ns3°,b5) is modular. In the imaginary case rational x gives rational j through the degree-two quotient. For a nonrational affine x the classification gives x(P)x(σP)=5, so the images of P and σP in X(ns3,b5) are related by its specified Fricke w5. The quotient moduli dictionary gives a geometric degree-5 isogeny between E and its conjugate and hence a Q-curve; the Q-curve modularity supplier applies. This does not assert σP=w5P for a chosen lift on the genus-one double cover. Infinite-coordinate points use the quotient/cusp dictionary. For real quadratic F use the imported FLHS modularity theorem.

Requires: IQ.5 genus_one_quadratic_points, IQ.5 genus_one_model, IQ.4 cartanCurve, IQ.1 modularity_transport, R29.6/modularity-theorem

Source: CN, Corollary 7.2.5, p.97

Special case: On the quartic h(x)=−3(x⁴+2x³−x²+10x+25), both (x,y)↦(5/x,±5y/x²) induce the same quotient action. The norm-five equation alone does not choose a sign.

Special case: For P=(1+2i,3+6i), σP equals the plus lift and differs from the minus lift; this is a regression against an inference from x alone, not identification of the actual modular lift.

-/

/-!
## IQ.6. Genus-two curves and exceptional points
-/

/-
The sextic and the Fricke comparison

Use the smooth projective hyperelliptic normalization, not the raw affine fiber product. The leading square 9 gives two rational infinity points. The modular map j is transported by the birational comparison; it is not the hyperelliptic x-coordinate. The Fricke involution exchanges the two infinity points.


TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic
Define b3ns5Sextic=9X⁶−6X⁵−35X⁴+40X²+12X−8∈ℚ[X]. Let C₂gen denote its smooth projective hyperelliptic model y²=b3ns5Sextic(x), with Y of weight 3 and two rational points at infinity Y/X³=±3. Identification with X(b3,ns5) is separate; a singular raw fiber product is not this smooth model.

Requires: Mathlib Polynomial.X, Mathlib Polynomial.eval

Source: CN, Proposition 7.3.1(1), p.97; b3ns5.m

TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_formula: The polynomial equals the displayed degree-six expression, with zero coefficient of X³.

TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_degree: Its degree is 6 and leading coefficient is 9; the infinity points therefore have Y/X³=±3 over ℚ.

TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_squarefree: The sextic is squarefree over ℚ, so the smooth proper double cover has genus 2 and agrees with its imported hyperelliptic normalization.

TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_zero (computation example): b3ns5Sextic(0)=−8.

TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_roots (computation example): b3ns5Sextic(−1)=b3ns5Sextic(1/3)=b3ns5Sextic(2)=0, giving three distinct rational Weierstrass points.

TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_degree (non-example example): Its degree is 6 with nonzero leading coefficient 9, not degree 5; its smooth completion has two points at infinity.


TauCeti.ImaginaryQuadraticModularity.genus_two_model
The smooth hyperelliptic curve y²=b3ns5Sextic(x) is ℚ-isomorphic to X(b3,ns5). Under this isomorphism the Fricke involution w3 is exactly (x,y)↦(x,−y), exchanging the two rational infinity points. The j-map is transported from the explicit normalized fiber product of b3J and ns5J; it is not the x-coordinate.

Requires: IQ.4 cartanCurve, IQ.4 small_curve_models, IQ.6 b3ns5Sextic, R13.4a

Source: CN, Proposition 7.3.1(1)–(2) and proof, p.97; b3ns5.m

Special case: The transported Fricke action is certified, not inferred from the existence of some order-two automorphism.

-/

/-
Finite Jacobian and the quadratic divisor dichotomy

A rank-zero descent and exact twenty-class table replace any bounded search for quadratic points. The canonical degree-two class moves in the hyperelliptic pencil; a noncanonical effective degree-two class has one representative. Enumerate all nineteen nonzero rational classes, separating the real and imaginary supports.


TauCeti.ImaginaryQuadraticModularity.genus_two_jacobian
For the curve in genus_two_model, Jac(C₂gen)(ℚ)≅ℤ/2⊕ℤ/10. A full table of twenty rational divisor classes in a fixed Mumford/base-divisor convention, with group operations and principal-function witnesses, is part of the arithmetic output. The group has rank zero and four rational two-torsion elements.

Requires: IQ.6 genus_two_model, Jacobian D, ED.3, ED.6

Source: CN, Proposition 7.3.1(3) and proof, p.97; b3ns5.m

Special case: The sextic has three rational roots and one irreducible cubic factor; these account for exactly four rational two-torsion classes.

Special case: No rank conclusion is based solely on a point search.


TauCeti.ImaginaryQuadraticModularity.genus_two_divisor_dichotomy
Write D∞=∞++∞−, the canonical hyperelliptic degree-two divisor on C₂gen. For a quadratic point P with conjugate σP, if [P+σP]=[D∞], then x(P) lies in ℙ¹(ℚ): on the affine chart P=(x,±√b3ns5Sextic(x)) with x∈ℚ; infinity is treated as x=∞. If [P+σP−D∞]≠0, P+σP is the unique effective divisor in its degree-two class because its Riemann–Roch space has dimension 1. The conclusion includes the distinction between a rational divisor and a merely rational divisor class.

Requires: IQ.6 genus_two_model, Jacobian A, Jacobian B, Jacobian C

Source: CN, Lemma 7.3.2 and proof, p.98

Special case: The zero class has a moving one-dimensional projective linear system and must not be enumerated as one unique effective divisor.


TauCeti.ImaginaryQuadraticModularity.genus_two_quadratic_points
If F is imaginary quadratic and P∈C₂gen(F) is affine, then x(P)∈ℚ or F=ℚ(√−11) and, up to conjugation, P=((−5+s)/6,±(17−s)/6) with s²=−11. Among the nineteen nonzero rational Jacobian classes, the complete effective-divisor table has nine rational-x classes, two infinity-supported classes, two classes supported on the stated imaginary quadratic pairs and six classes supported on real quadratic points. This enumeration is not a classification of real-quadratic points by the imaginary exceptional set.

Assumptions: F imaginary quadratic. P affine on C₂gen.

Requires: IQ.6 genus_two_jacobian, IQ.6 genus_two_divisor_dichotomy, ED.6

Source: CN, Proposition 7.3.3 and proof, p.98; b3ns5.m

Special case: Substitution with s²=−11 verifies both signs of the stated y-coordinate; replacing it by another rational expression fails the sextic equation.

-/

/-
The √−11 exception and the modularity endpoint

First compute the exceptional long Weierstrass equation and its invariant polynomial reductions. Then certify the full mod-5 nonsplit-normalizer image and transport its mixed fiber-product point through the normalization. For rational points, including infinity, use rational j. Only a nonrational affine point of exact degree two with rational x satisfies σP=w₃P and yields the degree-3 Q-curve. Real quadratic fields use FLHS rather than the imaginary enumeration.


TauCeti.ImaginaryQuadraticModularity.elevenExceptional
For a characteristic-zero field K and a∈K satisfying a²−a+3=0, define elevenExceptional(K,a) with Weierstrass coefficients (a,0,1+a,−24−6a,56+13a). Its discriminant is 4512−736a≠0 and j=(11155375a+3126750)/32. Over ℚ(√−11), a=(1+√−11)/2. This is the script’s exceptional curve. Match the conjugate conductor labels 8100.2-a2 in the paper and 8100.3-a2 in the script through the explicit conjugation and model comparison.

Requires: Mathlib WeierstrassCurve, Mathlib WeierstrassCurve.Δ, Mathlib WeierstrassCurve.IsElliptic, Mathlib WeierstrassCurve.j, Mathlib WeierstrassCurve.baseChange

Source: MAGMA-b3ns5, b3ns5.m, final exceptional-curve block; Corollary 7.3.4 proof, p.98

TauCeti.ImaginaryQuadraticModularity.elevenExceptional_coefficients: The five coefficients are (a,0,1+a,−24−6a,56+13a).

TauCeti.ImaginaryQuadraticModularity.elevenExceptional_discriminant: If a²−a+3=0 in characteristic zero, Δ=4512−736a≠0.

TauCeti.ImaginaryQuadraticModularity.elevenExceptional_j: The resulting Mathlib j-invariant is (11155375a+3126750)/32.

TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_a2 (computation example): Its a₂ coefficient is 0, not 1; a is the generator satisfying a²−a+3=0.

TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_conjugate (compatibility example): Replacing a by 1−a gives the coefficientwise conjugate curve and the conjugate j-value.

TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_j_nonrational (non-example example): Over ℚ(√−11), the coefficient of a in j is 11155375/32≠0, so rational-j modularity does not apply.


TauCeti.ImaginaryQuadraticModularity.eleven_exceptional_modular
Over F=ℚ(√−11), elevenExceptional has full mod-5 image conjugate to the normalizer of a nonsplit Cartan. Thus its restriction to GF(ζ5) is absolutely irreducible, and quadratic_modularity proves it modular. The point of the affine singular fiber product with coordinates x=32a−96 and t=(−a−15)/9 has b3J(x)=ns5J(t)=j(elevenExceptional); after the certified normalization map it yields one of the two exceptional pairs in genus_two_quadratic_points. Both signs and field conjugates follow by w3 and modularity_transport.

Requires: IQ.6 elevenExceptional, IQ.6 genus_two_quadratic_points, IQ.6 genus_two_model, IQ.3 quadratic_modularity, IQ.1 modularity_transport, R01.4/cartan-subgroups-and-normalisers, ED.6

Source: CN, Corollary 7.3.4 proof, p.98; b3ns5.m final block

Special case: Containment in the nonsplit normalizer alone does not imply cyclotomic absolute irreducibility.

Special case: No Faltings–Serre calculation is necessary here once the full-image certificate is available.


TauCeti.ImaginaryQuadraticModularity.genus_two_points_modular
For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(b3,ns5) is modular. For imaginary F first handle rational P, including both infinity points, by the rational j-map and rational modularity, base change and twisting. A nonrational affine P of exact degree two with rational x satisfies σP=w3P and gives a geometric degree-3 Q-curve. The ℚ(√−11) exceptions are covered by eleven_exceptional_modular. The real-quadratic branch uses the imported FLHS endpoint, not Proposition 7.3.3 outside its imaginary hypothesis.

Requires: IQ.6 genus_two_quadratic_points, IQ.6 genus_two_model, IQ.6 eleven_exceptional_modular, IQ.4 cartanCurve, IQ.1 modularity_transport, R29.6/modularity-theorem

Source: CN, Corollary 7.3.4, p.98

Special case: At infinity t=1/x,v=y/x³ gives v=±3 at t=0. Each point is rational and Galois-fixed, while w3 exchanges them. The proof must use rational j there.

Special case: For nonrational affine P with x∈ℚ, σ sends y to −y; do not apply this assertion to an arbitrary rational P in C(F).

-/

/-!
## IQ.7. Bielliptic quartics and quadratic divisors
-/

/-
Homogeneous models and projective involutions

Use variables X,Y,Z with indices 0,1,2. Check homogeneous coordinate transformations before passing to projective automorphisms. The second transformation squares to 25 times the identity and scales its quartic by 625; its induced projective action nevertheless has order two in characteristic zero. Smoothness, the modular identifications, j-maps and both quotient morphisms to B are further geometric comparisons.


TauCeti.ImaginaryQuadraticModularity.quartic1
Define quartic1=9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C1 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.

Requires: Mathlib MvPolynomial.X, Mathlib MvPolynomial.eval₂

Source: CN, Proposition 7.4.3(1), p.100; ns3ons5.m

TauCeti.ImaginaryQuadraticModularity.quartic1_formula: The polynomial is precisely 9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴.

TauCeti.ImaginaryQuadraticModularity.quartic1_homogeneous: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.

TauCeti.ImaginaryQuadraticModularity.quartic1_affine: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.

TauCeti.ImaginaryQuadraticModularity.quartic1_test_1 (computation example): quartic1 evaluated at (0,0,1) is 11.

TauCeti.ImaginaryQuadraticModularity.quartic1_test_2 (computation example): quartic1 evaluated at (1,0,0) is 9.

TauCeti.ImaginaryQuadraticModularity.quartic1_test_3 (computation example): quartic1 evaluated at (0,1,0) is 1.


TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates
For a commutative ℚ-algebra K, define quartic1Coordinates: (Fin 3→K)→(Fin 3→K) by (X,−Y−Z,Z). Its square is 1 times the identity and quartic1(quartic1Coordinates(v))=quartic1(v). Thus it induces an order-two automorphism w1 of C1.

Requires: IQ.7 quartic1, Mathlib MvPolynomial.eval₂

Source: CN, Proposition 7.4.3(1), p.100

TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_coordinates: The three coordinates are (X,−Y−Z,Z).

TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_square: For every vector v, quartic1Coordinates(quartic1Coordinates(v))=1•v.

TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_preserves: For every vector v in a commutative ℚ-algebra, quartic1(quartic1Coordinates(v))=quartic1(v).

TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis0 (computation example): The image of the j=0 coordinate basis vector is (1,0,0).

TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis1 (computation example): The image of the j=1 coordinate basis vector is (0,−1,0).

TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis2 (computation example): The image of the j=2 coordinate basis vector is (0,−1,1).


TauCeti.ImaginaryQuadraticModularity.quartic2
Define quartic2=−X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C2 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.

Requires: Mathlib MvPolynomial.X, Mathlib MvPolynomial.eval₂

Source: CN, Proposition 7.4.3(2), p.100; s3ns5.m

TauCeti.ImaginaryQuadraticModularity.quartic2_formula: The polynomial is precisely −X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴.

TauCeti.ImaginaryQuadraticModularity.quartic2_homogeneous: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.

TauCeti.ImaginaryQuadraticModularity.quartic2_affine: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.

TauCeti.ImaginaryQuadraticModularity.quartic2_test_1 (computation example): quartic2 evaluated at (0,0,1) is 1.

TauCeti.ImaginaryQuadraticModularity.quartic2_test_2 (computation example): quartic2 evaluated at (0,1,1) is 0.

TauCeti.ImaginaryQuadraticModularity.quartic2_test_3 (computation example): quartic2 evaluated at (-3,7,1) is 0.


TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates
For a commutative ℚ-algebra K, define quartic2Coordinates: (Fin 3→K)→(Fin 3→K) by (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z). Its square is 25 times the identity and quartic2(quartic2Coordinates(v))=625quartic2(v). Thus it induces an order-two automorphism w2 of C2. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.

Requires: IQ.7 quartic2, Mathlib MvPolynomial.eval₂

Source: CN, Proposition 7.4.3(2), p.100

TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_coordinates: The three coordinates are (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z).

TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_square: For every vector v, quartic2Coordinates(quartic2Coordinates(v))=25•v.

TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_preserves: For every vector v in a commutative ℚ-algebra, quartic2(quartic2Coordinates(v))=625quartic2(v).

TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis0 (computation example): The image of the j=0 coordinate basis vector is (3,8,4).

TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis1 (computation example): The image of the j=1 coordinate basis vector is (1,1,−2).

TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis2 (computation example): The image of the j=2 coordinate basis vector is (2,−8,1).


TauCeti.ImaginaryQuadraticModularity.quartic_models
C1=V(quartic1) and C2=V(quartic2) are smooth nonhyperelliptic projective curves of genus 3 over ℚ, ℚ-isomorphic respectively to X(ns3°,ns5) and X(s3,ns5). Their displayed involutions are the unique nonidentity ℚ-automorphisms, and their degree-two quotient morphisms πi:Ci→B agree with the modular maps through X(ns3,ns5) under mixed_elliptic_model. All j-maps, normalization maps, quotient maps and rational base divisors are exported together.

Requires: IQ.4 cartanCurve, IQ.4 small_curve_models, IQ.4 mixed_elliptic_model, IQ.7 quartic1, IQ.7 quartic2, IQ.7 quartic1Coordinates, IQ.7 quartic2Coordinates, R13.4a, IQ.5 genus_one_model, IQ.4 nonsplit_cartan_conic

Source: CN, Proposition 7.4.3(1)–(2) and proof, p.100; ns3ons5.m and s3ns5.m

Special case: The fractional affine formula for w2 has poles; its homogeneous coordinate map extends there.

Special case: An automorphism with a genus-one quotient alone does not establish compatibility with the modular quotient.

-/

/-
Imaginary exceptional points

The coordinate construction gives two distinct nonrational points and their conjugates over ℚ(√−55). Polynomial substitution and the modular j-value are separate assertions. The j-value −32768 is rational CM, and these two orbits are the only nonpullback imaginary quadratic pairs in the second sieve.


TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints
For a characteristic-zero field K and s∈K with s²=−55, define quarticImaginaryPoints(K,s) as the ordered pair of projective coordinate triples P1=((1+s)/28,(27−s)/56,1), P2=((3−s)/4,(3+3s)/4,1). Both lie on C2. Under the certified modular j-map both have j=−32768. The polynomial substitution is separate from the modular-map comparison; changing s to −s gives the conjugate pair.

Requires: IQ.7 quartic2, IQ.7 quartic_models

Source: CN, Proposition 7.4.3(3), p.100; s3ns5.m exceptional-place block

TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_coordinates: The ordered coordinate triples are exactly the displayed P1,P2, both with Z=1.

TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_on_curve: If s²=−55 in characteristic zero, evaluating quartic2 at either triple is zero.

TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_j: Under quartic_models and its modular j-map, both points have j=−32768, the rational CM j-value of discriminant −11.

TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_first (computation example): Substituting P1 into quartic2 gives zero when s²=−55.

TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_second (computation example): Substituting P2 into quartic2 gives zero when s²=−55.

TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_field (non-example example): Over ℚ(√−55), both points are nonrational, distinct and have nonzero Z; conjugation sends s to −s, not s.

-/

/-
Rank, torsion and pullback indices

Import the general Chen/new-old and rank-equal bielliptic comparison after R14.2. The source-specific factor ranks are algebraic. Explicit rational divisor supports, principal-function witnesses and good reductions prove torsion; the first quartic only has a torsion inclusion. Apply π*π_*=1+w, then the torsion exponents, to obtain the two different integral index bounds.


TauCeti.ImaginaryQuadraticModularity.quartic_jacobian_ranks
For both i=1,2, rk Jac(Ci)(ℚ)=rk B(ℚ)=1. The source-specific Chen/de Smit–Edixhoven comparison gives Jac(C1) isogenous to the new part of Jac(X₀(225)/w25), with elliptic factors 225c,225a,225d of ranks 0,1,0. For C2 use the 5-new part of Jac(X₀(225)/⟨w9,w25⟩): the factors are 225a,75c,75a of ranks 1,0,0; w9 has characteristic polynomial T²−1 on each level-75 oldspace. These are isogeny/rank computations, not analytic-rank assertions.

Requires: IQ.7 quartic_models, IQ.4 B_mordell_weil, R14.2, ED.3, ED.6

Source: CN, Proposition 7.4.4(1) and proof, pp.100–101

Special case: The relevant space for C1 has dimension 3. The C2 level-75 contributions are retained.


TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses
In Jac(C2)(ℚ), define D10=[(0:1:1)]−[(-3:7:1)] and D2=5([(0:1:0)]+[(-1/2:-1/2:1)]+Pl2−2Pl1), where Pl1 is the degree-two place cut out in Z=1 by u²−5u+1=0,v+2u−1=0, and Pl2 by u²+u−1=0,v+3u−3=0. The degrees are 1+1+2−2·2=0. These rational divisor classes have exact orders 10 and 2 and D2∉⟨D10⟩. The places here are real quadratic and are distinct from quarticImaginaryPoints.

Requires: IQ.7 quartic_models, Jacobian A, Jacobian D, ED.6

Source: CN, Proposition 7.4.4(2) proof, p.101; s3ns5.m torsion block

TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_divisors: The two classes are the images of the displayed rational degree-zero divisors, in the named place convention.

TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_orders: D10 has exact order 10 and D2 has exact order 2.

TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_independent: The homomorphism ℤ/10⊕ℤ/2→Jac(C2)(ℚ) sending the generators to D10,D2 is injective.

TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_ten (computation example): 10D10=0, 5D10≠0 and 2D10≠0.

TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_two (computation example): 2D2=0 and D2≠0.

TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_independence (non-example example): D2−5D10≠0, so the subgroup has order 20 rather than 10.


TauCeti.ImaginaryQuadraticModularity.quartic_jacobian_torsion
Jac(C1)(ℚ)tors is isomorphic to a subgroup of ℤ/2⊕ℤ/2; no equality is asserted. Jac(C2)(ℚ)tors≅ℤ/2⊕ℤ/10, generated by quarticTorsionClasses. Good reductions at 7,11,13 give gcd of group orders 4 for C1 and 20 for C2; Jac(C1)(𝔽13)≅ℤ/2⊕ℤ/1710, which excludes order-4 cyclic rational torsion.

Requires: IQ.7 quartic_models, IQ.7 quarticTorsionClasses, ED.3, ED.6

Source: CN, Proposition 7.4.4(2) and proof, p.101


TauCeti.ImaginaryQuadraticModularity.quartic_pullback_indices
Choose a saturated generator D of B(ℚ)≅ℤ, viewed in Jac(B)(ℚ), and set Gi=⟨πi*D⟩⊂Jac(Ci)(ℚ). Then 2Jac(Ci)(ℚ)⊂⟨Gi,Jac(Ci)(ℚ)tors⟩ for i=1,2. Consequently 4Jac(C1)(ℚ)⊂2G1 and 10Jac(C2)(ℚ)⊂⟨5G2,Jac(C2)(ℚ)[2]⟩. The second inclusion uses the pullback group G2 in Jac(C2)(ℚ).

Requires: IQ.7 quartic_models, IQ.7 quartic_jacobian_ranks, IQ.7 quartic_jacobian_torsion, IQ.4 B_mordell_weil, R14.2

Source: CN, Proposition 7.4.4(3) and proof, pp.100–101; BOX §3.3, Proposition 3.1 and proof, pp.8–9, using only its 2J inclusion

-/

/-
Two complete symmetric-square sieves

Use the general relative symmetric Chabauty and sieve criteria from ED.4–ED.5. Export the exact subgroup, annihilating index, base divisor, primes, reduction groups, known divisors and local differential checks. The proof of completeness is emptiness of the lifted bad-coset intersection; enumerating points up to a height bound is not a substitute.


TauCeti.ImaginaryQuadraticModularity.first_quartic_quadratic_divisors
For C1 and its modular quotient π1:C1→B, Sym²(C1)(ℚ)=π1*B(ℚ). Apply the imported relative symmetric sieve with G=⟨2π1*D⟩, I=4, a rational degree-two base divisor pulled back from the origin of B, good prime 43, and L of eight pullback divisors. The reduced group red43(G) is cyclic of order 7, and iota43⁻¹(red43(G)) has exactly seven degree-two divisor classes. L covers all seven, each satisfying the relative Chabauty criterion; hence the bad set is empty.

Requires: IQ.7 quartic_models, IQ.7 quartic_pullback_indices, ED.4/relative-symmetric-chabauty, ED.5/relative-symmetric-sieve, ED.6

Source: CN, Proposition 7.4.5(1), p.101; ns3ons5.m sieve block


TauCeti.ImaginaryQuadraticModularity.second_quartic_quadratic_divisors
For C2 and π2:C2→B, Sym²(C2)(ℚ)=π2*B(ℚ)∪L16, with L16 sixteen rational effective degree-two divisors not pulled back. Eight are sums of rational points not interchanged by w2; eight are conjugate pairs of quadratic points. Precisely two quadratic pairs are imaginary, the pairs of quarticImaginaryPoints over ℚ(√−55); six are real. Use G=⟨5π2*D,D2,5D10⟩, I=10 and good primes 11,43. The intersection of the two lifted bad-coset sets is empty after the imported symmetric/relative local criteria. A search bound alone is not the completeness proof.

Requires: IQ.7 quartic_models, IQ.7 quarticImaginaryPoints, IQ.7 quarticTorsionClasses, IQ.7 quartic_pullback_indices, ED.4/symmetric-chabauty, ED.4/relative-symmetric-chabauty, ED.5/relative-symmetric-sieve, ED.6

Source: CN, Proposition 7.4.5(2), p.101; s3ns5.m sieve block

-/

/-
Modularity of the quartic points

A divisor pulled back from B(ℚ) has rational modular j. For j≠0,1728 an elliptic curve with rational j is a quadratic twist of a ℚ-model; for these special values use geometric CM. The second quartic has two additional imaginary orbits, both with rational CM j. Keep its endpoint restricted to imaginary quadratic fields.


TauCeti.ImaginaryQuadraticModularity.first_quartic_points_modular
For every quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(ns3°,ns5), E is modular. Its degree-two divisor is pulled back from B(ℚ) by first_quartic_quadratic_divisors, so its j-value is rational. A rational-j curve over a quadratic field is a quadratic twist of a ℚ-model unless j is 0 or 1728; those cases are geometrically CM. Apply rational modularity, base change and twist invariance, or the CM branch.

Requires: IQ.7 first_quartic_quadratic_divisors, IQ.7 quartic_models, IQ.1 Modular, IQ.1 modularity_transport, R29.6/modularity-theorem

Source: CN, Corollary 7.4.6(1), p.102


TauCeti.ImaginaryQuadraticModularity.second_quartic_points_modular
For every imaginary quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(s3,ns5), E is modular. All relevant irreducible quadratic pairs are pullbacks from B(ℚ), except quarticImaginaryPoints and their conjugates, which have rational CM j=−32768. Rational degree-two sums contribute only rational points and also have rational j. No conclusion for arbitrary real-quadratic exceptional pairs is inferred from this classification.

Assumptions: F imaginary quadratic.

Requires: IQ.7 second_quartic_quadratic_divisors, IQ.7 quarticImaginaryPoints, IQ.7 quartic_models, IQ.1 Modular, IQ.1 modularity_transport, R29.6/modularity-theorem

Source: CN, Corollary 7.4.6(2), p.102

-/

/-!
## IQ.8. Imaginary-quadratic modularity applications
-/

/-
The residual-image criterion

If the cyclotomic restriction is absolutely irreducible, apply IQ.3. Otherwise use the exact Cartan classification from R01.4 and route the combined 3/5 level to one of the four exceptional curves handled in IQ.5–IQ.7. Ordinary irreducibility over 𝔽p is weaker than absolute irreducibility; the mod-3 exclusion is equality with the full split normalizer, not containment.


TauCeti.ImaginaryQuadraticModularity.imaginary_quadratic_residual_modularity
Let F be an imaginary quadratic number field and E/F an elliptic curve. If GF acts irreducibly on E[5] over 𝔽5 (absolute irreducibility is not required), or GF acts irreducibly on E[3] over 𝔽3 and its image is not conjugate to the whole normalizer of a split Cartan, then E is modular. The mod-3 exclusion is equality up to conjugacy with the whole normalizer, not containment in some split normalizer.

Assumptions: F imaginary quadratic. Either of the two displayed residual-image conditions.

Requires: IQ.3 quadratic_modularity, IQ.4 cartanCurve, IQ.5 genus_one_points_modular, IQ.6 genus_two_points_modular, IQ.7 first_quartic_points_modular, IQ.7 second_quartic_points_modular, R01.4/restriction-to-the-cyclotomic-field

Source: CN, Theorem 7.1, p.91; Lemma 7.1.1, pp.92–93; conclusion p.102

Special case: Ordinary irreducibility over 𝔽p is distinguished from absolute irreducibility after coefficient extension and from absolute irreducibility of GF(ζp).

Special case: The p=3 image excluded by equality may have irreducible proper subgroups; these are not excluded by this theorem.

-/

/-
Finite level-fifteen points and small fields

The residual-image theorem leaves X(b3,b5) and X(s3,b5). Their rational isogeny transfers rank zero; quadratic torsion growth handles all noncuspidal points, including the eight Gaussian j-values. For each small field certify rank zero of the rational model and its indicated twist. The √−10 point verifies that the finite-point theorem is not a theorem for every imaginary quadratic field.


TauCeti.ImaginaryQuadraticModularity.finite_level_fifteen_modularity
For an imaginary quadratic number field F with finite X₀(15)(F), every elliptic curve E/F is modular. Finite here means the full set of F-rational points of the compactified curve; since it is an elliptic curve over ℚ with a rational origin, this is equivalent to Mordell–Weil rank zero over F. The statement imposes no restriction on the residual images of E. It is CN Theorem 1.1 and Corollary 7.1.2, not unconditional modularity over every imaginary quadratic field.

Assumptions: F imaginary quadratic. X₀(15)(F) finite.

Requires: IQ.8 imaginary_quadratic_residual_modularity, IQ.5 level_fifteen_models, IQ.5 quadratic_level_fifteen_torsion, IQ.5 gaussian_exceptional_modular, IQ.1 Modular, IQ.1 modularity_transport, EC Mordell–Weil

Source: CN, Theorem 1.1, p.2; Corollary 7.1.2 and proof, p.93

Special case: Cusps are discarded when associating an elliptic curve but remain in the finite point set.

Special case: The Gaussian exception is tied to the full eight-point orbit certificate and Faltings–Serre comparison, not an unsupported database label.


TauCeti.ImaginaryQuadraticModularity.small_imaginary_quadratic_modularity
For F=ℚ(√−d) with d∈{1,2,3,5}, X₀(15)(F) is finite and hence every elliptic curve over F is modular. Each application includes a certified rank-zero calculation for the rational elliptic model E15 and its quadratic twist by −d: rk E15(F)=rk E15(ℚ)+rk E15^(−d)(ℚ)=0. The Gaussian field retains its extra torsion without acquiring positive rank.

Requires: IQ.8 finite_level_fifteen_modularity, IQ.5 level_fifteen_models, IQ.5 quadratic_level_fifteen_torsion, ED.3, ED.6

Source: CN, §1 after Theorem 1.1, p.2

Special case: Rank computations use algebraic rank bounds; a finite search or numerical L-value is insufficient.


TauCeti.ImaginaryQuadraticModularity.sqrt_minus_ten_infinite_level_fifteen
Let F=ℚ(√−10) and s²=−10. The point (x,y)=(-1,6s) on E15:y²=x(x+16)(x+25) is nontorsion. It is not rational, and quadratic_torsion_growth shows that E15(F)tors=E15(ℚ) because F is neither ℚ(i) nor ℚ(√5). Hence X₀(15)(F) is infinite. This gives a concrete field to which finite_level_fifteen_modularity does not apply; it says nothing against modularity of particular curves over that field.

Requires: IQ.5 level_fifteen_models, IQ.5 quadratic_level_fifteen_torsion

Source: CN, Corollary 7.1.2 torsion-growth proof, p.93; explicit substitution in its E15 equation

Special case: Changing y to 6 or dropping the factor √−10 fails the curve equation.

Special case: The finite-point hypothesis is not asserted for all imaginary quadratic fields.

-/

end TauCeti.ImaginaryQuadraticModularity
end
