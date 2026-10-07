/-
This file is not the roadmap and is not exhaustive. The definitive roadmap is
research/blueprint/readmes/EllipticCurveModularityImaginaryQuadratic.md.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. All planned proofs use sorry and all packet nodes remain
unchecked. Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti source baseline: f790474821cf4256814db967cb154e7af3d0c369.

Only Mathlib modules are imported: the available shared build matches that
Mathlib pin, but its Tau Ceti checkout does not match the source pin. No claim
of a joint pinned Tau Ceti build is made. The genuine Weierstrass, polynomial
and rational-function carriers below already exist at the Mathlib pin.

The named ledger records each full mathematical contract. Where a geometric or
automorphic condition has no faithful baseline signature, it is left out of
executable Lean and is explicitly recorded as a gap. No private stand-in type,
arbitrary Prop field, axiom or Prop-valued sorry is used to hide that condition.
Coordinate-only constructions have executable signatures; their missing lifts
to the smooth proper curves and modular j-maps remain explicit in the ledger.
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
## Complete named mathematical ledger

Each name below is the packet name, even when no faithful baseline Lean type
can yet express its full contract. Executable signatures above cover only the
baseline algebraic part. The ledger preserves every geometric lift, cusp,
proper-map degree, invariant and point-group assertion required by the packet.
Missing carriers and certificates are specified by the gap IDs and suppliers.
The statements are requirements, not axioms or hidden Prop-valued parameters.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/modular
TauCeti.ImaginaryQuadraticModularity.Modular: signature withheld pending its genuine supplier carrier; full contract:
For a number field F and a Weierstrass curve E/F with Δ(E) ≠ 0, Modular(E) means: either End(E over F̄) is larger than ℤ (geometric CM), or there exist a rational prime p, an isomorphism ι:Q̄p≅ℂ and a cuspidal regular algebraic automorphic representation π of GL₂(𝔸F), cohomological of weight 0, such that rπ,ι≅rE,p∨ as continuous representations of GF. Weight 0 and the Tate-normalized local Langlands convention are those of CN §2. The CM branch does not impose cuspidality.
Hypotheses: F is a number field.; E is elliptic.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.IsElliptic, GL2AutomorphicRepresentationsAndTransfer:R16.4, AutomorphicGaloisRepresentationsPartII:AG2.7, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, GL2AutomorphicRepresentationsAndTransfer:R16.3, GL2AutomorphicRepresentationsAndTransfer:R16.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G1
TauCeti.ImaginaryQuadraticModularity.Modular.of_cm [requires genuine supplier interface]: Geometric CM implies Modular(E), including when the CM field is contained in F.
TauCeti.ImaginaryQuadraticModularity.Modular.non_cm_iff [requires genuine supplier interface]: For a non-CM E/F, Modular(E) iff the displayed existence of p, ι, π and the dual Tate-module isomorphism holds.
TauCeti.ImaginaryQuadraticModularity.Modular.isogeny_iff [requires genuine supplier interface]: If E and E′ are F-isogenous elliptic curves, Modular(E) iff Modular(E′).
TauCeti.ImaginaryQuadraticModularity.Modular.test_cm [requires genuine supplier interface]: The smooth curve y²=x³+1 over ℚ(√−3) is Modular through its geometric CM, even though its Tate module splits over the CM field.
TauCeti.ImaginaryQuadraticModularity.Modular.test_rational_base [requires genuine supplier interface]: Every elliptic curve E/ℚ satisfies Modular(E), by EllipticCurveModularity R29.6 with the same dual normalization.
TauCeti.ImaginaryQuadraticModularity.Modular.test_dual_determinant [requires genuine supplier interface]: For p=5 over a number field, det(rE,p)=εp and det(rE,p∨)=εp⁻¹ are distinct characters; an isomorphism to rE,p cannot replace the isomorphism to its dual.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness
TauCeti.ImaginaryQuadraticModularity.automorphic_unique: signature withheld pending its genuine supplier carrier; full contract:
If F is a CM field and E/F is a non-CM modular elliptic curve, there is a unique cuspidal regular algebraic π of GL₂(𝔸F) of weight 0 giving the modularity isomorphism. Its central character is trivial; π therefore descends to PGL₂. Uniqueness is up to isomorphism, not equality of a chosen model.
Hypotheses: F is imaginary CM.; E is modular and non-CM.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, GL2AutomorphicRepresentationsAndTransfer:R16.4, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, GL2AutomorphicRepresentationsAndTransfer:R16.3
Gaps: EllipticCurveModularityImaginaryQuadratic/G1
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes
TauCeti.ImaginaryQuadraticModularity.automorphic_all_primes: signature withheld pending its genuine supplier carrier; full contract:
With E/F and π as in automorphic_unique, for every rational prime p and every ι:Q̄p≅ℂ, rπ,ι≅rE,p∨ as continuous GF-representations. A common coefficient field and semisimple comparison are supplied before concluding an isomorphism.
Hypotheses: F is imaginary CM.; E is modular and non-CM.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.7, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent
Gaps: EllipticCurveModularityImaginaryQuadratic/G1
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne
TauCeti.ImaginaryQuadraticModularity.automorphic_wd: signature withheld pending its genuine supplier carrier; full contract:
For E/F and π as above, every p, every ι and every finite place v∤p satisfy WD(rE,p∨|GFv)F-ss≅recᵀFv(πv). Frobenius semisimplification retains the monodromy N. This is an isomorphism of Weil–Deligne representations, not just an equality of their semisimplified Weil representations.
Hypotheses: F is imaginary CM.; E is modular and non-CM.; v∤p.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes, AutomorphicGaloisRepresentationsPartII:AG2.5, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, GL2AutomorphicRepresentationsAndTransfer:R16.3
Gaps: EllipticCurveModularityImaginaryQuadratic/G2
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary
TauCeti.ImaginaryQuadraticModularity.automorphic_potentially_multiplicative_ordinary: signature withheld pending its genuine supplier carrier; full contract:
If E/F is non-CM modular and v|p is a place of potentially multiplicative reduction, then π is ι-ordinary at v of weight 0. For another prime ℓ≠p, full local–global compatibility identifies πv with a quadratic twist of Steinberg; transfer this local type to p-adic ordinarity.
Hypotheses: F is imaginary CM.; E is modular and non-CM.; v|p and E has potentially multiplicative reduction at v.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, OrdinaryAutomorphicFormsAndModularityLifting:R21.1
Gaps: EllipticCurveModularityImaginaryQuadratic/G2
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance
TauCeti.ImaginaryQuadraticModularity.modularity_transport: signature withheld pending its genuine supplier carrier; full contract:
For elliptic curves over any number field, modularity is invariant under isogeny and quadratic twist, and is preserved under conjugating the number field. If L/F is a finite Galois solvable CM extension and E/L is the base change of E/F, modularity of E/L implies modularity of E/F. In the non-CM branch use irreducibility of the Tate representation over GL; CM is handled separately. Base change along a finite solvable number-field extension preserves modularity, allowing the CM branch when cuspidality fails.
Hypotheses: Number fields for isogeny, twist, conjugacy and solvable base change; CM fields for the stated solvable descent.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent, GL2AutomorphicRepresentationsAndTransfer:R17.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist
TauCeti.ImaginaryQuadraticModularity.symplecticTwist: signature withheld pending its genuine supplier carrier; full contract:
For p∈{3,5}, a number field F and continuous ρ̄:GF→GL₂(𝔽p) with det ρ̄=ε̄p, construct the smooth affine twist Yρ̄/F of the fixed-pairing full-level curve. For every extension K/F its K-points classify pairs (A/K,α), up to isomorphism, where A is elliptic and α:𝔽p²≅A[p](K̄) is a GK-equivariant symplectic identification with the restriction of the given ρ̄, with the standard determinant pairing on ρ̄ matched to the Weil pairing. For p=3 the simultaneous sign automorphism and the actual rigidified moduli problem must be treated through the upstream level-structure construction; no coarse universal curve is assumed. Its smooth proper completion has geometric genus zero.
Hypotheses: p=3 or p=5.; F is a number field.; ρ̄ is continuous with cyclotomic determinant.
Prerequisites: tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ, ModularCurvesPartII:R12.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.points [requires genuine supplier interface]: The stated K-point classification holds naturally in K/F, with symplectic isomorphisms and the correct isomorphism relation.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.baseChange [requires genuine supplier interface]: For an extension K/F the base change of Yρ̄ is canonically the twist associated to ρ̄|GK; these identifications satisfy identity and composition.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.rational [requires genuine supplier interface]: If the smooth completion has an F-point, its genus-zero curve is F-isomorphic to ℙ¹, and Yρ̄ is the corresponding complement of the cusps.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_tautological [requires genuine supplier interface]: For ρ̄=A[p] in a symplectic basis, (A,id) gives an F-point of Yρ̄.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_pairing [requires genuine supplier interface]: At p=5, the change of level basis diag(2,1) multiplies the Weil pairing exponent by 2 and is not symplectic; it cannot act as a pairing-preserving identification.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_local_trivial [requires genuine supplier interface]: Over a local field K containing μp, the trivial ρ̄ and any A with all p-torsion K-rational yield a K-point after choosing a symplectic basis; geometric genus zero alone does not assert a K-point.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation
TauCeti.ImaginaryQuadraticModularity.solvable_preparation: signature withheld pending its genuine supplier carrier; full contract:
Let F be imaginary CM, p∈{3,5}, ρ̄:GF→GL₂(𝔽p) continuous, cyclotomic determinant and decomposed generic, and Favoid/F finite Galois. There is a finite Galois solvable CM extension L/F disjoint from Favoid such that each w|2,3,p is split over L⁺ and ρ̄|GLw is trivial; for every w|p there are local elliptic curves with good ordinary and good supersingular reduction and rational p-torsion; Lw(√−1)/Lw is unramified at w|2; a rational prime q>5 witnessing decomposed genericity splits completely in L. Local degrees and the chosen witness are part of the output. Where ζ5 must be excluded, enlarge the avoidance field by F(ζ5) before constructing L.
Hypotheses: F imaginary CM; p=3 or 5.; ρ̄ has cyclotomic determinant and is decomposed generic.; Favoid/F finite Galois.
Prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences, InverseGaloisAndArithmeticFundamentalGroups:IG.2, ArithmeticGaloisRepresentations:R01.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, PotentialAutomorphyInfrastructure:PA.5/split-test-prime-image-preservation
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity
TauCeti.ImaginaryQuadraticModularity.seed_modular: signature withheld pending its genuine supplier carrier; full contract:
Let K be imaginary CM and A/K elliptic with discriminant Δ from a chosen Weierstrass equation. Suppose: at each v|2, A is a Tate curve, Kv(√−1)/Kv is unramified, ordv Δ≡3 mod 6, and Δ/Δc is a square in Kv; at each v|3, A is a Tate curve, ordv Δ≡2 or 4 mod 6, and Δ/Δc is a cube in Kv; for M=K(ζ12,(Δ/Δc)^(1/6)), r̄A,3|GM is decomposed generic and its image on GM(ζ3) is conjugate to SL₂(𝔽3). Then A is modular. Here c is the CM involution; the choices of sixth root do not affect the field M.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist, ArithmeticGaloisRepresentations:R01.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, ModularCurvesPartII:R12.4
Gaps: EllipticCurveModularityImaginaryQuadratic/G4
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection
TauCeti.ImaginaryQuadraticModularity.hilbert_local_selection: signature withheld pending its genuine supplier carrier; full contract:
After solvable_preparation has made Yρ̄ an open subcurve of ℙ¹L, given nonempty open subsets Ωw⊂Yρ̄(Lw) at all the finitely many selected places and the finite covers encoding auxiliary large mod-3 or mod-5 image, there is an L-point in every Ωw outside the relevant thin exceptional sets. In the p=5 construction impose the AKT 9.7 discriminant-conjugacy, Tate valuation and large mod-3 conditions for seed_modular; independently choose at every w|5 ordinary, supersingular or split multiplicative local prototypes according to the prescribed partition. In the p=3 construction impose ordinary mod-5 seed conditions without constraining the prescribed 3-adic ordinary/supersingular/multiplicative choices.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist, EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences, InverseGaloisAndArithmeticFundamentalGroups:IG.2, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five
TauCeti.ImaginaryQuadraticModularity.switch_five: signature withheld pending its genuine supplier carrier; full contract:
Let F be imaginary CM, ρ̄:GF→GL₂(𝔽5) continuous with det=ε̄5 and decomposed generic, and partition the places v|5 as S5st⊔S5ord⊔S5ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,5≅ρ̄|GL, and ρ̄|GL remains decomposed generic. ζ5∉F is not a hypothesis of this proposition.
Hypotheses: F imaginary CM.; ρ̄ continuous, det=ε̄5, decomposed generic.; The three sets partition every place above 5.; Favoid/F finite Galois.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection, EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three
TauCeti.ImaginaryQuadraticModularity.switch_three: signature withheld pending its genuine supplier carrier; full contract:
Let F be imaginary CM with ζ5∉F, ρ̄:GF→GL₂(𝔽3) continuous with det=ε̄3 and decomposed generic, and partition all places v|3 as S3st⊔S3ord⊔S3ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,3≅ρ̄|GL, and ρ̄|GL remains decomposed generic.
Hypotheses: F imaginary CM and ζ5∉F.; ρ̄ continuous, det=ε̄3, decomposed generic.; The three sets partition every place above 3.; Favoid/F finite Galois.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five, EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity, ArithmeticGaloisRepresentations:R01.4
Gaps: EllipticCurveModularityImaginaryQuadratic/G3, EllipticCurveModularityImaginaryQuadratic/G4
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types
TauCeti.ImaginaryQuadraticModularity.auxiliary_local_types: signature withheld pending its genuine supplier carrier; full contract:
For A/L supplied by switch_five (p=5) or switch_three (p=3), let π be its non-CM weight-zero modular representation with rπ,ι≅rA,p∨. For every w|p above v of F, π is ι-ordinary if v∈Spst; πw is unramified if v∈Spord∪Spss. In the latter case the associated p-adic representation is crystalline with N=0 and is potentially ordinary precisely in the ordinary case. The prime order printed in CN Lemma 6.1.7 is reversed and corrected here.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three, EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne, EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data
TauCeti.ImaginaryQuadraticModularity.elliptic_lifting_data: signature withheld pending its genuine supplier carrier; full contract:
For an elliptic curve E over an imaginary CM field F and p∈{3,5}, ρ=rE,p∨ is continuous, det ρ=εp⁻¹ and unramified at almost all finite places. At every v|p it is potentially semistable with the source-normalized labeled Hodge–Tate weights {0,1}; after a finite solvable CM extension chosen with the avoidance field and generic witness, the potentially good places are Barsotti–Tate (ordinary exactly at the potentially ordinary ones), while the potentially multiplicative places become split multiplicative and the dual local representation is a noncrystalline extension of εp⁻¹ by 1. Translate the imported convention HT(εp)=+1 to CN’s HT(εp)=−1 when using R06; do not swap the covariant Tate module with its dual.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.IsElliptic, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, PadicHodgeTheory:R06.5, PadicHodgeTheory:R06.6, EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity
TauCeti.ImaginaryQuadraticModularity.cm_modularity: signature withheld pending its genuine supplier carrier; full contract:
Let F be an imaginary CM number field with ζ5∉F and E/F elliptic. If for at least one p∈{3,5}, r̄E,p is decomposed generic and r̄E,p|GF(ζp) is absolutely irreducible, then E is modular. No Galois-over-ℚ hypothesis is imposed. Decomposed genericity has the existential rational-prime/all-places eigenvalue-nonratio meaning, not merely distinct eigenvalues.
Hypotheses: F imaginary CM with ζ5∉F.; E elliptic.; There exists p=3 or p=5 with both stated residual hypotheses.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three, EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field, AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity
Gaps: EllipticCurveModularityImaginaryQuadratic/G5
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity
TauCeti.ImaginaryQuadraticModularity.quadratic_modularity: signature withheld pending its genuine supplier carrier; full contract:
Let F be imaginary quadratic and E/F elliptic. If r̄E,3|GF(ζ3) or r̄E,5|GF(ζ5) is absolutely irreducible, E is modular. The quadratic-field Goursat/Chebotarev lemma supplies decomposed genericity; it is not an additional hypothesis on E. Since [ℚ(ζ5):ℚ]=4, an imaginary quadratic F does not contain ζ5.
Hypotheses: F imaginary quadratic.; E elliptic.; The restriction for p=3 or 5 is absolutely irreducible.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity, ArithmeticGaloisRepresentations:R01.4
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/short-weierstrass-family
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily: signature withheld pending its genuine supplier carrier; full contract:
For a number field F with ring of integers 𝒪F, the equation family is the set of pairs (a,b)∈𝒪F² with 4a³+27b²≠0, representing y²=x³+ax+b via the existing five-coefficient Weierstrass curve (0,0,0,a,b). Its ordering is H(a,b)=‖(a,b)‖ for a fixed norm on the finite-dimensional real vector space ℝ⊗ℤ𝒪F² as in Zywina §1.1. Distinct coefficient pairs are counted separately, without isomorphism quotient or stabilizer weights. At X count pairs with H≤X; take the ratio of modular pairs to all nonsingular pairs and its limit as X→∞.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, ArithmeticStatistics:ST.0
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.mem [requires genuine supplier interface]: Membership is exactly a,b integral and 4a³+27b²≠0.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.discriminant [requires genuine supplier interface]: The associated Mathlib curve has Δ=−16(4a³+27b²), so the family condition is exactly ellipticity in characteristic zero.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.height_count [requires genuine supplier interface]: The family’s count at X equals the ST.0 unweighted count of its coefficient lattice points of norm ≤X; no curve-isomorphism quotient enters.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_zero [requires genuine supplier interface]: (0,0) is excluded because its discriminant is zero.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_one [requires genuine supplier interface]: (0,1) is included and its discriminant is −432.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_scaling [requires genuine supplier interface]: The pairs (0,1) and (0,64) are distinct family elements, although their curves are F-isomorphic by scaling x by 4 and y by 8; a count of isomorphism classes would identify them.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/density-one
TauCeti.ImaginaryQuadraticModularity.density_one: signature withheld pending its genuine supplier carrier; full contract:
Fix an imaginary CM number field F, Galois over ℚ, with ζ5∉F, and any norm height of shortEquationFamily. As X→∞, the fraction of nonsingular integral short Weierstrass equations of height ≤X defining modular elliptic curves tends to 1. For d=[F:ℚ], the bad-image fraction is O((log X)^β/X^(d/2)) for a constant β and constants depending on F and the fixed norm, by Zywina Proposition 5.2. This quantitative bound is for failure of the mod-5 image to contain SL₂(𝔽5); modularity failure is a subset. This is not a statement about all imaginary fields, or about isomorphism classes.
Hypotheses: F fixed imaginary CM, Galois over ℚ.; ζ5∉F.; Coefficient pairs are ordered by a fixed norm on ℝ⊗ℤ𝒪F².
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.3/short-weierstrass-family, EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity, ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field, ArithmeticStatistics:ST.2
Gaps: EllipticCurveModularityImaginaryQuadratic/G6
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves
TauCeti.ImaginaryQuadraticModularity.cartanCurve: signature withheld pending its genuine supplier carrier; full contract:
Over ℚ, for a prime p and H⊂GL₂(𝔽p) containing −I with surjective determinant, X(H) is the smooth proper compactification of the imported affine coarse curve YH; j:X(H)→X(1)=ℙ¹ extends its j-map. For distinct primes p₁,p₂ and such H₁,H₂, X(H₁,H₂) is the smooth projective normalization of X(H₁)×X(1)X(H₂). Cusps are exactly j⁻¹(∞). The application subgroups are Borel bp, split and nonsplit normalizers sp,nsp, and actual nonsplit Cartan ns3°. The same formula cannot identify ns3° with the normalizer ns3.
Hypotheses: pᵢ prime, distinct in mixed level.; −I∈Hᵢ and det Hᵢ=𝔽pᵢ×.; Base ℚ, and number-field points in characteristic zero.
Prerequisites: tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli, ModularCurvesPartII:R13.4a, mathlib:AlgebraicGeometry.Scheme.Hom.normalization, ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers
Gaps: EllipticCurveModularityImaginaryQuadratic/G7
TauCeti.ImaginaryQuadraticModularity.cartanCurve.j [requires genuine supplier interface]: There is a finite j-morphism to ℙ¹ℚ extending the affine coarse j-map; its inverse image of infinity is exactly the cusps.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.mixed [requires genuine supplier interface]: The mixed curve, with both projections, is uniquely the smooth proper normal model of the coarse fiber product’s function field; on its dense open it is the original mixed level moduli curve.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.points [requires genuine supplier interface]: An elliptic E/F with a simultaneous H₁×H₂ orbit of torsion bases fixed by GF gives a noncuspidal F-point with j=j(E). Conversely a geometric coarse point is such a geometric isomorphism class with a GF-fixed orbit; for non-CM j≠0,1728 one may choose an F-model and any two have the same quadratic-twist class. This is a coarse statement, not a fine universal elliptic curve over X(H₁,H₂).
TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_borel [requires genuine supplier interface]: X(b3,b5) is the compactified X₀(15), with cusps j=∞ and rational noncuspidal points representing rational cyclic 15-isogeny level.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_index_two [requires genuine supplier interface]: The map X(ns3°)→X(ns3) has degree two; treating Cartan as its normalizer would give degree one and destroy the branched genus-one/quartic models.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_distinct_primes [requires genuine supplier interface]: A mixed point from E has ηᵢ⁻¹r̄E,pᵢ(GF)ηᵢ⊂Hᵢ separately for i=1,2; it does not use one residual prime in both conditions.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/b3-j
TauCeti.ImaginaryQuadraticModularity.b3J: executable algebraic signature above; full contract:
Define b3J∈RatFunc ℚ by the rational expression (x+27)(x+3)³/x, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b3) only through the identification in small_curve_models. Its morphism degree is 4; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
TauCeti.ImaginaryQuadraticModularity.b3J_fraction [signature/example above]: b3J is exactly the displayed RatFunc.mk expression (x+27)(x+3)³/x.
TauCeti.ImaginaryQuadraticModularity.b3J_eval [signature/example above]: For a characteristic-zero field K, x∈K and the denominator x nonzero, evaluating b3J along ℚ→K at x gives (x+27)(x+3)³/x.
TauCeti.ImaginaryQuadraticModularity.b3J_intDegree [signature/example above]: RatFunc.intDegree(b3J)=3; the actual geometric j-morphism degree is 4, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.b3J_test_one [signature/example above]: b3J evaluated at x=1 is 1792.
TauCeti.ImaginaryQuadraticModularity.b3J_test_zero_j [signature/example above]: b3J evaluated at x=−3 is 0.
TauCeti.ImaginaryQuadraticModularity.b3J_test_cusp [signature/example above]: The reduced denominator of b3J vanishes at 0; totalized field evaluation there is 0 but the geometric j-map has a pole, not a j=0 point.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/b5-j
TauCeti.ImaginaryQuadraticModularity.b5J: executable algebraic signature above; full contract:
Define b5J∈RatFunc ℚ by the rational expression (x²+250x+3125)³/x⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b5) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 1, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
TauCeti.ImaginaryQuadraticModularity.b5J_fraction [signature/example above]: b5J is exactly the displayed RatFunc.mk expression (x²+250x+3125)³/x⁵.
TauCeti.ImaginaryQuadraticModularity.b5J_eval [signature/example above]: For a characteristic-zero field K, x∈K and the denominator x⁵ nonzero, evaluating b5J along ℚ→K at x gives (x²+250x+3125)³/x⁵.
TauCeti.ImaginaryQuadraticModularity.b5J_intDegree [signature/example above]: RatFunc.intDegree(b5J)=1; the actual geometric j-morphism degree is 6, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.b5J_test_one [signature/example above]: b5J evaluated at x=1 is 38477541376.
TauCeti.ImaginaryQuadraticModularity.b5J_test_minus_five [signature/example above]: b5J evaluated at x=−5 is -2194880.
TauCeti.ImaginaryQuadraticModularity.b5J_test_cusp [signature/example above]: The reduced denominator of b5J vanishes at 0, which is a cusp rather than a finite j-value.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j
TauCeti.ImaginaryQuadraticModularity.ns3J: executable algebraic signature above; full contract:
Define ns3J∈RatFunc ℚ by the rational expression x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns3) only through the identification in small_curve_models. Its morphism degree is 3; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
TauCeti.ImaginaryQuadraticModularity.ns3J_fraction [signature/example above]: ns3J is exactly the displayed RatFunc.mk expression x³.
TauCeti.ImaginaryQuadraticModularity.ns3J_eval [signature/example above]: For a characteristic-zero field K, x∈K and the denominator 1 nonzero, evaluating ns3J along ℚ→K at x gives x³.
TauCeti.ImaginaryQuadraticModularity.ns3J_intDegree [signature/example above]: RatFunc.intDegree(ns3J)=3; the actual geometric j-morphism degree is 3, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.ns3J_test_zero [signature/example above]: ns3J evaluated at x=0 is 0.
TauCeti.ImaginaryQuadraticModularity.ns3J_test_two [signature/example above]: ns3J evaluated at x=2 is 8.
TauCeti.ImaginaryQuadraticModularity.ns3J_test_polynomial [signature/example above]: ns3J has reduced denominator 1 and intDegree=3; infinity is its unique pole.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/ns5-j
TauCeti.ImaginaryQuadraticModularity.ns5J: executable algebraic signature above; full contract:
Define ns5J∈RatFunc ℚ by the rational expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns5) only through the identification in small_curve_models. Its morphism degree is 10; its RatFunc.intDegree (numerator degree minus denominator degree) is 0, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
TauCeti.ImaginaryQuadraticModularity.ns5J_fraction [signature/example above]: ns5J is exactly the displayed RatFunc.mk expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
TauCeti.ImaginaryQuadraticModularity.ns5J_eval [signature/example above]: For a characteristic-zero field K, x∈K and the denominator (x²+x−1)⁵ nonzero, evaluating ns5J along ℚ→K at x gives 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
TauCeti.ImaginaryQuadraticModularity.ns5J_intDegree [signature/example above]: RatFunc.intDegree(ns5J)=0; the actual geometric j-morphism degree is 10, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.ns5J_test_zero [signature/example above]: ns5J evaluated at x=0 is 0 and this is not a cusp.
TauCeti.ImaginaryQuadraticModularity.ns5J_test_minus_half [signature/example above]: ns5J evaluated at x=−1/2 is 0.
TauCeti.ImaginaryQuadraticModularity.ns5J_test_infinity [signature/example above]: ns5J has intDegree=0 and finite value 8000 at infinity; its poles are the two roots of x²+x−1, not infinity.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/s3-j
TauCeti.ImaginaryQuadraticModularity.s3J: executable algebraic signature above; full contract:
Define s3J∈RatFunc ℚ by the rational expression 27(x+1)³(x−3)³/x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(s3) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
TauCeti.ImaginaryQuadraticModularity.s3J_fraction [signature/example above]: s3J is exactly the displayed RatFunc.mk expression 27(x+1)³(x−3)³/x³.
TauCeti.ImaginaryQuadraticModularity.s3J_eval [signature/example above]: For a characteristic-zero field K, x∈K and the denominator x³ nonzero, evaluating s3J along ℚ→K at x gives 27(x+1)³(x−3)³/x³.
TauCeti.ImaginaryQuadraticModularity.s3J_intDegree [signature/example above]: RatFunc.intDegree(s3J)=3; the actual geometric j-morphism degree is 6, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.s3J_test_one [signature/example above]: s3J evaluated at x=1 is −1728.
TauCeti.ImaginaryQuadraticModularity.s3J_test_minus_one [signature/example above]: s3J evaluated at x=−1 is 0.
TauCeti.ImaginaryQuadraticModularity.s3J_test_cusp [signature/example above]: The reduced denominator of s3J vanishes at 0 and intDegree=3; 0 and infinity are poles.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient
TauCeti.ImaginaryQuadraticModularity.B: executable algebraic signature above; full contract:
Let B/ℚ be the existing WeierstrassCurve with coefficients (0,0,−1,0,1), so its equation is y²−y=x³+1. Its discriminant is −675 and its j-invariant is 0. Its use as X(ns3,ns5), and its Mordell–Weil group, are comparison/arithmetic theorems rather than fields of this definition.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.baseChange, mathlib:WeierstrassCurve.Affine.Equation, mathlib:WeierstrassCurve.Affine.Point.mk
TauCeti.ImaginaryQuadraticModularity.B_coefficients [signature/example above]: B has a₁=a₂=a₄=0, a₃=−1 and a₆=1.
TauCeti.ImaginaryQuadraticModularity.B_discriminant [signature/example above]: B.Δ=−675 and therefore B is elliptic over ℚ.
TauCeti.ImaginaryQuadraticModularity.B_baseChange [signature/example above]: For a characteristic-zero field K with ℚ-algebra structure, B.baseChange K has the same coefficients and equation; identity and composite coefficient changes agree.
TauCeti.ImaginaryQuadraticModularity.B_test_j [signature/example above]: The Mathlib j-invariant of B is 0.
TauCeti.ImaginaryQuadraticModularity.B_test_point [signature/example above]: (x,y)=(1,2) satisfies the actual B Weierstrass equation: 2²−2=1³+1.
TauCeti.ImaginaryQuadraticModularity.B_test_sign [signature/example above]: B.a₃=−1, not +1; (1,2) would fail the unshifted equation y²+y=x³+1.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models
TauCeti.ImaginaryQuadraticModularity.small_curve_models: signature withheld pending its genuine supplier carrier; full contract:
There are ℚ-isomorphisms X(b3), X(b5), X(ns3), X(ns5), X(s3)≅ℙ¹ with j-functions b3J, b5J, ns3J, ns5J, s3J respectively. Under the b5 coordinate the Fricke involution w5 sends x to 125/x. The j-map degrees are respectively 4,6,3,10,6, with the pole multiplicities read from the displayed rational functions. These degrees include infinity and are not RatFunc.intDegree.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/b3-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/b5-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/ns5-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/s3-j, ModularCurvesPartII:R13.4a
Gaps: EllipticCurveModularityImaginaryQuadratic/G7
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model
TauCeti.ImaginaryQuadraticModularity.mixed_elliptic_model: signature withheld pending its genuine supplier carrier; full contract:
X(ns3,ns5) is ℚ-isomorphic to B. On a dense affine model x³=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵, put A(t)=t²+t−1 and D(t)=(2t+1)(2t²+7t+8). The source map is [U:V:W]=[−(x/5)A(t)²:D(t):tD(t)], on the standard homogeneous Weierstrass equation V²W−VW²=U³+W³ of B. On V≠0,A(t)≠0 its inverse is t=W/V, x=−5(U/V)D(t)/A(t)². These are inverse rational maps and extend uniquely between the smooth proper normalizations. The raw singular affine fiber product is not itself B.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient
Gaps: EllipticCurveModularityImaginaryQuadratic/G8
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil
TauCeti.ImaginaryQuadraticModularity.B_mordell_weil: signature withheld pending its genuine supplier carrier; full contract:
B(ℚ) is infinite cyclic, with rank 1 and trivial torsion. A saturated generator D is part of the output; pullback arguments must not silently use an unsaturated nontorsion point as a generator. The source labels B as Cremona 225A1.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G8
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/e15-model
TauCeti.ImaginaryQuadraticModularity.E15: executable algebraic signature above; full contract:
Define E15/ℚ as WeierstrassCurve with coefficients (0,41,0,400,0), whose equation is y²=x(x+16)(x+25). Its discriminant is 207360000≠0. Identification with the modular curve and the rational group are separate theorems.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.baseChange, mathlib:WeierstrassCurve.Affine.Equation, mathlib:WeierstrassCurve.Affine.Point.mk
TauCeti.ImaginaryQuadraticModularity.E15_coefficients [signature/example above]: The five coefficients are (0,41,0,400,0).
TauCeti.ImaginaryQuadraticModularity.E15_discriminant [signature/example above]: Δ(E15)=207360000 and E15 is elliptic.
TauCeti.ImaginaryQuadraticModularity.E15_baseChange [signature/example above]: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+16)(x+25), compatibly with identity and composition.
TauCeti.ImaginaryQuadraticModularity.E15_test_zero [signature/example above]: (0,0) satisfies the E15 equation and gives a nonidentity point of order two.
TauCeti.ImaginaryQuadraticModularity.E15_test_roots [signature/example above]: The three distinct roots of the cubic are 0,−16,−25.
TauCeti.ImaginaryQuadraticModularity.E15_test_delta [signature/example above]: Its discriminant is 207360000, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/es35-model
TauCeti.ImaginaryQuadraticModularity.Es35: executable algebraic signature above; full contract:
Define Es35/ℚ as WeierstrassCurve with coefficients (0,17,0,16,0), whose equation is y²=x(x+1)(x+16). Its discriminant is 921600≠0. Identification with the modular curve and the rational group are separate theorems.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.baseChange, mathlib:WeierstrassCurve.Affine.Equation, mathlib:WeierstrassCurve.Affine.Point.mk
TauCeti.ImaginaryQuadraticModularity.Es35_coefficients [signature/example above]: The five coefficients are (0,17,0,16,0).
TauCeti.ImaginaryQuadraticModularity.Es35_discriminant [signature/example above]: Δ(Es35)=921600 and Es35 is elliptic.
TauCeti.ImaginaryQuadraticModularity.Es35_baseChange [signature/example above]: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+1)(x+16), compatibly with identity and composition.
TauCeti.ImaginaryQuadraticModularity.Es35_test_zero [signature/example above]: (0,0) satisfies the Es35 equation and gives a nonidentity point of order two.
TauCeti.ImaginaryQuadraticModularity.Es35_test_roots [signature/example above]: The three distinct roots of the cubic are 0,−1,−16.
TauCeti.ImaginaryQuadraticModularity.Es35_test_delta [signature/example above]: Its discriminant is 921600, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification
TauCeti.ImaginaryQuadraticModularity.level_fifteen_models: signature withheld pending its genuine supplier carrier; full contract:
There are ℚ-isomorphisms X(b3,b5)=X₀(15)≅E15 and X(s3,b5)≅Es35, with Cremona labels 15A1 and 15A3 respectively. Both have ℚ-points ℤ/2⊕ℤ/4 and rank zero, and they are ℚ-isogenous. In particular X₀(15)(F) is finite iff X(s3,b5)(F) is finite for any number field F. The maps must carry j and the cusp divisors, not just identify the abstract elliptic curves.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.5/e15-model, EllipticCurveModularityImaginaryQuadratic:IQ.5/es35-model, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, EffectiveDiophantineMethods:ED.3
Gaps: EllipticCurveModularityImaginaryQuadratic/G9
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth
TauCeti.ImaginaryQuadraticModularity.quadratic_level_fifteen_torsion: signature withheld pending its genuine supplier carrier; full contract:
Among quadratic number fields F, E15(F)tors strictly contains E15(ℚ) precisely for F=ℚ(i) or ℚ(√5); Es35(F)tors strictly contains Es35(ℚ) precisely for F=ℚ(√5). For the imaginary exception E15(ℚ(i)) has eight new torsion points beyond its eight rational points. Thus, under the rank-zero input for an imaginary F, Es35(F)=Es35(ℚ) and E15(F)=E15(ℚ) unless F=ℚ(i). No assertion of rank zero over an arbitrary F is part of this theorem.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G9
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-exceptional-model
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional: executable algebraic signature above; full contract:
For a characteristic-zero field K and i∈K with i²=−1, define gaussianExceptional(K,i) as WeierstrassCurve with coefficients (i,1,1,6+i,10−15i). Over ℚ(i) this is the LMFDB curve 4050.1-c3. Its discriminant is 58752+107136i and its j-invariant is (−47709+15363i)/256. These coefficient identities do not certify modularity.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.baseChange
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_coefficients [signature/example above]: The five coefficients are (i,1,1,6+i,10−15i).
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_discriminant [signature/example above]: If i²=−1 in characteristic zero, Δ=58752+107136i≠0.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_j [signature/example above]: With the resulting IsElliptic instance, the Mathlib j-invariant equals (−47709+15363i)/256.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_a1 [signature/example above]: Its a₁ coefficient is i, not zero; it is a long Weierstrass model.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_conjugate [signature/example above]: Changing i to −i gives the coefficientwise conjugate curve, with conjugate discriminant and j.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_j_nonrational [signature/example above]: Over ℚ(i) the coefficient of i in j is 15363/256≠0; the curve is not covered by the rational-j argument.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity
TauCeti.ImaginaryQuadraticModularity.gaussian_exceptional_modular: signature withheld pending its genuine supplier carrier; full contract:
The curve gaussianExceptional over ℚ(i) is modular. Every noncuspidal j-value at the eight new E15(ℚ(i))-torsion points is the j-value of an elliptic curve obtained from gaussianExceptional by an ℚ(i)-isogeny, coefficient-field conjugation or quadratic twisting, and consequently is modular. Provide the explicit orbit/matching table and a Faltings–Serre comparison certificate for the one exceptional curve.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-exceptional-model, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EffectiveDiophantineMethods:ED.6, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, ArithmeticGaloisRepresentations:R01.5, ComputationalNumberTheory:CN.5
Gaps: EllipticCurveModularityImaginaryQuadratic/G9
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic: executable algebraic signature above; full contract:
Define ns3b5Quartic=−3(X⁴+2X³−X²+10X+25)∈ℚ[X]. Its geometric model is the weighted projective equation Y²=−3(X⁴+2X³Z−X²Z²+10XZ³+25Z⁴) in ℙ(1,2,1); Y has weight 2, so ordinary projective homogenization is incorrect. The scalar −3 is a genuine quadratic twist fixed by the cusp field, not a removable normalization.
Prerequisites: mathlib:Polynomial.X, mathlib:Polynomial.eval
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_formula [signature/example above]: The polynomial is exactly −3(X⁴+2X³−X²+10X+25).
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_degree [signature/example above]: Its degree is 4 and its leading coefficient is −3; the two points over infinity require a square root of −3.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_fricke [signature/example above]: For x≠0, x⁴·ns3b5Quartic(5/x)=25·ns3b5Quartic(x), giving the coordinate part of the Fricke involution.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_zero [signature/example above]: ns3b5Quartic(0)=−75.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_minus_two [signature/example above]: ns3b5Quartic(−2)=−3.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_minus_five_half [signature/example above]: ns3b5Quartic(−5/2)=−75/16, agreeing with y=5√−3/4.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification
TauCeti.ImaginaryQuadraticModularity.genus_one_model: signature withheld pending its genuine supplier carrier; full contract:
The smooth weighted quartic C with Y²=ns3b5Quartic(X,Z) is ℚ-isomorphic to X(ns3°,b5) and has genus 1. Its map to X(ns3,b5)≅ℙ¹ has degree 2 and coordinate x; the latter j-function is (x⁶+250x³+3125)³/x¹⁵. The Fricke w5 sends x to 5/x. The double cover is ramified at the four simple roots of X⁴+2X³−X²+10X+25, and its cusp field is ℚ(√−3), fixing the scalar −3.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic, ModularCurvesPartII:R13.4a, ArithmeticGaloisRepresentations:R01.4, EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-special-points
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints: executable algebraic signature above; full contract:
For a characteristic-zero field K and s∈K with s²=−3, define the list of weighted homogeneous coordinates ∞+=(1:s:0), ∞−=(1:−s:0), 0+=(0:5s:1), P₁=(−2:−s:1), P₂=(−5/2:5s/4:1). The construction consists of literal triples together with their lifts to C(K) via genus_one_model. Over K=ℚ(√−3) they are the points used to describe rational Jacobian classes.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_coordinates [signature/example above]: The five triples have exactly the coordinates displayed in the definition, in that order.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_on_curve [requires genuine supplier interface]: All five triples satisfy the weighted quartic equation and define points on C under genus_one_model.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_conjugate [signature/example above]: Changing s to −s exchanges ∞+ with ∞− and gives the coefficientwise conjugates of the three affine points; the construction commutes with field embeddings.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_infinity [signature/example above]: The first two triples have Z=0 and opposite nonzero Y=±s; the weighted equation is Y²=−3X⁴, not the ordinary cubic equation.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_zero [signature/example above]: For 0+, (5s)²=−75=ns3b5Quartic(0).
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_p2 [signature/example above]: For P₂, (5s/4)²=−75/16=ns3b5Quartic(−5/2).
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian
TauCeti.ImaginaryQuadraticModularity.genus_one_jacobian: signature withheld pending its genuine supplier carrier; full contract:
For C as above, JacC is ℚ-isomorphic to the elliptic curve y²=x³+3x²−720x−8100 (45A2), and JacC(ℚ)≅ℤ/2⊕ℤ/2. C(ℚ3)=∅, hence C(ℚ)=∅. Under the ℚ(√−3) identification P↦[P]−[∞−], its three nonzero rational classes are D₀,D₁,D₂ from genusOneSpecialPoints, each of order 2 and D₀+D₁=D₂. This identifies the Jacobian over ℚ without identifying the pointless genus-one curve C with it over ℚ.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-special-points, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G11
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes
TauCeti.ImaginaryQuadraticModularity.genus_one_rational_picard: signature withheld pending its genuine supplier carrier; full contract:
Let Pic⁰(C) denote degree-zero ℚ-rational divisors modulo ℚ-rational linear equivalence, mapped injectively into JacC(ℚ). Its image is {0,D₀}≅ℤ/2, and D₁,D₂ are rational Jacobian points not represented by rational divisors. For Ei=Di+∞++∞−, corrected ℚ(√−3) Riemann–Roch bases are {1,fi} with f₀=(y+s x²+5s)/x, f₁=(y+s x²−5s)/(x+2), f₂=(y+s x²−5s)/(x+5/2). The source prints an extra factor y in these numerators; the following fiber equations and the Magma calculation require its removal. The associated rational descent conics for E₁,E₂ are u²+3v²+6v+15=0 and u²+3v²+6v+12=0, both empty over ℚ; E₀’s conic u²+3v²+6v−33=0 has the rational point (3,2).
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G11
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points
TauCeti.ImaginaryQuadraticModularity.genus_one_quadratic_points: signature withheld pending its genuine supplier carrier; full contract:
For any quadratic number field F, P∈C(F) other than the two points at infinity satisfies x(P)∈ℚ or x(P)x(σP)=5, where σ is the nontrivial automorphism of F/ℚ. The proof uses that P+σP is a rational effective divisor of degree 2 and its difference from ∞++∞− is either 0 or D₀ in the rational Picard image. In the nontrivial case the fiber equation (6−2sα)x²+(α²−33)x+(30−10sα)=0 has product of roots 5, with the degenerate leading-coefficient case handled separately.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change
Gaps: EllipticCurveModularityImaginaryQuadratic/G11
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity
TauCeti.ImaginaryQuadraticModularity.genus_one_points_modular: signature withheld pending its genuine supplier carrier; full contract:
For every quadratic number field F, every elliptic E/F giving a noncuspidal point of X(ns3°,b5) is modular. In the imaginary case: rational x gives rational j through the degree-two quotient; otherwise σP=w5P, so E is a degree-5 Q-curve (up to the fixed coarse orbit) and the Q-curve modularity supplier applies. Infinite-coordinate points are treated by the same quotient/cusp dictionary. The real-quadratic branch uses the already established FLHS modularity theorem from the general totally-real modularity owner, rather than assuming an imaginary-CM theorem over a real field.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
Gaps: EllipticCurveModularityImaginaryQuadratic/G10
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-sextic
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic: executable algebraic signature above; full contract:
Define b3ns5Sextic=9X⁶−6X⁵−35X⁴+40X²+12X−8∈ℚ[X]. Let C₂gen denote its smooth projective hyperelliptic model y²=b3ns5Sextic(x), with Y of weight 3 and two rational points at infinity Y/X³=±3. Identification with X(b3,ns5) is separate; a singular raw fiber product is not this smooth model.
Prerequisites: mathlib:Polynomial.X, mathlib:Polynomial.eval
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_formula [signature/example above]: The polynomial equals the displayed degree-six expression, with zero coefficient of X³.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_degree [signature/example above]: Its degree is 6 and leading coefficient is 9; the infinity points therefore have Y/X³=±3 over ℚ.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_squarefree [signature/example above]: The sextic is squarefree over ℚ, so the smooth proper double cover has genus 2 and agrees with its imported hyperelliptic normalization.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_zero [signature/example above]: b3ns5Sextic(0)=−8.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_roots [signature/example above]: b3ns5Sextic(−1)=b3ns5Sextic(1/3)=b3ns5Sextic(2)=0, giving three distinct rational Weierstrass points.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_degree [signature/example above]: Its degree is 6 with nonzero leading coefficient 9, not degree 5; its smooth completion has two points at infinity.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model
TauCeti.ImaginaryQuadraticModularity.genus_two_model: signature withheld pending its genuine supplier carrier; full contract:
The smooth hyperelliptic curve y²=b3ns5Sextic(x) is ℚ-isomorphic to X(b3,ns5). Under this isomorphism the Fricke involution w3 is exactly (x,y)↦(x,−y), exchanging the two rational infinity points. The j-map is transported from the explicit normalized fiber product of b3J and ns5J; it is not the x-coordinate.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-sextic, ModularCurvesPartII:R13.4a
Gaps: EllipticCurveModularityImaginaryQuadratic/G12
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil
TauCeti.ImaginaryQuadraticModularity.genus_two_jacobian: signature withheld pending its genuine supplier carrier; full contract:
For the curve in genus_two_model, Jac(C₂gen)(ℚ)≅ℤ/2⊕ℤ/10. A full table of twenty rational divisor classes in a fixed Mumford/base-divisor convention, with group operations and principal-function witnesses, is part of the arithmetic output. The group has rank zero and four rational two-torsion elements.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G12
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy
TauCeti.ImaginaryQuadraticModularity.genus_two_divisor_dichotomy: signature withheld pending its genuine supplier carrier; full contract:
Write D∞=∞++∞−, the canonical hyperelliptic degree-two divisor on C₂gen. For a quadratic point P with conjugate σP, if [P+σP]=[D∞], then x(P) lies in ℙ¹(ℚ): on the affine chart P=(x,±√b3ns5Sextic(x)) with x∈ℚ; infinity is treated as x=∞. If [P+σP−D∞]≠0, P+σP is the unique effective divisor in its degree-two class because its Riemann–Roch space has dimension 1. The conclusion includes the distinction between a rational divisor and a merely rational divisor class.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points
TauCeti.ImaginaryQuadraticModularity.genus_two_quadratic_points: signature withheld pending its genuine supplier carrier; full contract:
If F is imaginary quadratic and P∈C₂gen(F) is affine, then x(P)∈ℚ or F=ℚ(√−11) and, up to conjugation, P=((−5+s)/6,±(17−s)/6) with s²=−11. Among the nineteen nonzero rational Jacobian classes, the complete effective-divisor table has nine rational-x classes, two infinity-supported classes, two classes supported on the stated imaginary quadratic pairs and six classes supported on real quadratic points. This enumeration is not a classification of real-quadratic points by the imaginary exceptional set.
Hypotheses: F imaginary quadratic.; P affine on C₂gen.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G12
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-model
TauCeti.ImaginaryQuadraticModularity.elevenExceptional: executable algebraic signature above; full contract:
For a characteristic-zero field K and a∈K satisfying a²−a+3=0, define elevenExceptional(K,a) with Weierstrass coefficients (a,0,1+a,−24−6a,56+13a). Its discriminant is 4512−736a≠0 and j=(11155375a+3126750)/32. Over ℚ(√−11), a=(1+√−11)/2. This is the script’s exceptional curve. The paper labels its conjugacy orbit 8100.2-a2, while the script comment uses 8100.3-a2; the exact conjugate-conductor label comparison is an explicit certificate gap, not an asserted source error.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.baseChange
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_coefficients [signature/example above]: The five coefficients are (a,0,1+a,−24−6a,56+13a).
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_discriminant [signature/example above]: If a²−a+3=0 in characteristic zero, Δ=4512−736a≠0.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_j [signature/example above]: The resulting Mathlib j-invariant is (11155375a+3126750)/32.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_a2 [signature/example above]: Its a₂ coefficient is 0, not 1; a is the generator satisfying a²−a+3=0.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_conjugate [signature/example above]: Replacing a by 1−a gives the coefficientwise conjugate curve and the conjugate j-value.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_j_nonrational [signature/example above]: Over ℚ(√−11), the coefficient of a in j is 11155375/32≠0, so rational-j modularity does not apply.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison
TauCeti.ImaginaryQuadraticModularity.eleven_exceptional_modular: signature withheld pending its genuine supplier carrier; full contract:
Over F=ℚ(√−11), elevenExceptional has full mod-5 image conjugate to the normalizer of a nonsplit Cartan. Thus its restriction to GF(ζ5) is absolutely irreducible, and quadratic_modularity proves it modular. The point of the affine singular fiber product with coordinates x=32a−96 and t=(−a−15)/9 has b3J(x)=ns5J(t)=j(elevenExceptional); after the certified normalization map it yields one of the two exceptional pairs in genus_two_quadratic_points. Both signs and field conjugates follow by w3 and modularity_transport.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-model, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G13
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity
TauCeti.ImaginaryQuadraticModularity.genus_two_points_modular: signature withheld pending its genuine supplier carrier; full contract:
For every quadratic number field F, every elliptic E/F giving a noncuspidal point of X(b3,ns5) is modular. For imaginary F, the rational-x and infinity cases have σP=w3P and are degree-3 Q-curves, while the ℚ(√−11) exceptions are covered by eleven_exceptional_modular. The real-quadratic branch uses the imported FLHS endpoint and is not deduced from Proposition 7.3.3, whose hypothesis is imaginary.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison, EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance
Gaps: EllipticCurveModularityImaginaryQuadratic/G10
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1
TauCeti.ImaginaryQuadraticModularity.quartic1: executable algebraic signature above; full contract:
Define quartic1=9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C1 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.
Prerequisites: mathlib:MvPolynomial.X, mathlib:MvPolynomial.eval₂
TauCeti.ImaginaryQuadraticModularity.quartic1_formula [signature/example above]: The polynomial is precisely 9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴.
TauCeti.ImaginaryQuadraticModularity.quartic1_homogeneous [signature/example above]: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
TauCeti.ImaginaryQuadraticModularity.quartic1_affine [signature/example above]: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.
TauCeti.ImaginaryQuadraticModularity.quartic1_test_1 [signature/example above]: quartic1 evaluated at (0,0,1) is 11.
TauCeti.ImaginaryQuadraticModularity.quartic1_test_2 [signature/example above]: quartic1 evaluated at (1,0,0) is 9.
TauCeti.ImaginaryQuadraticModularity.quartic1_test_3 [signature/example above]: quartic1 evaluated at (0,1,0) is 1.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1-involution
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates: executable algebraic signature above; full contract:
For a commutative ℚ-algebra K, define quartic1Coordinates: (Fin 3→K)→(Fin 3→K) by (X,−Y−Z,Z). Its square is 1 times the identity and quartic1(quartic1Coordinates(v))=1quartic1(v). Thus it induces an order-two automorphism w1 of C1. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1, mathlib:MvPolynomial.eval₂
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_coordinates [signature/example above]: The three coordinates are (X,−Y−Z,Z).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_square [signature/example above]: For every vector v, quartic1Coordinates(quartic1Coordinates(v))=1•v.
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_preserves [signature/example above]: For every vector v in a commutative ℚ-algebra, quartic1(quartic1Coordinates(v))=1quartic1(v).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis0 [signature/example above]: The image of the j=0 coordinate basis vector is (1,0,0).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis1 [signature/example above]: The image of the j=1 coordinate basis vector is (0,−1,0).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis2 [signature/example above]: The image of the j=2 coordinate basis vector is (0,−1,1).
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2
TauCeti.ImaginaryQuadraticModularity.quartic2: executable algebraic signature above; full contract:
Define quartic2=−X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C2 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.
Prerequisites: mathlib:MvPolynomial.X, mathlib:MvPolynomial.eval₂
TauCeti.ImaginaryQuadraticModularity.quartic2_formula [signature/example above]: The polynomial is precisely −X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴.
TauCeti.ImaginaryQuadraticModularity.quartic2_homogeneous [signature/example above]: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
TauCeti.ImaginaryQuadraticModularity.quartic2_affine [signature/example above]: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.
TauCeti.ImaginaryQuadraticModularity.quartic2_test_1 [signature/example above]: quartic2 evaluated at (0,0,1) is 1.
TauCeti.ImaginaryQuadraticModularity.quartic2_test_2 [signature/example above]: quartic2 evaluated at (0,1,1) is 0.
TauCeti.ImaginaryQuadraticModularity.quartic2_test_3 [signature/example above]: quartic2 evaluated at (-3,7,1) is 0.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2-involution
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates: executable algebraic signature above; full contract:
For a commutative ℚ-algebra K, define quartic2Coordinates: (Fin 3→K)→(Fin 3→K) by (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z). Its square is 25 times the identity and quartic2(quartic2Coordinates(v))=625quartic2(v). Thus it induces an order-two automorphism w2 of C2. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2, mathlib:MvPolynomial.eval₂
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_coordinates [signature/example above]: The three coordinates are (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_square [signature/example above]: For every vector v, quartic2Coordinates(quartic2Coordinates(v))=25•v.
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_preserves [signature/example above]: For every vector v in a commutative ℚ-algebra, quartic2(quartic2Coordinates(v))=625quartic2(v).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis0 [signature/example above]: The image of the j=0 coordinate basis vector is (3,8,4).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis1 [signature/example above]: The image of the j=1 coordinate basis vector is (1,1,−2).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis2 [signature/example above]: The image of the j=2 coordinate basis vector is (2,−8,1).
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models
TauCeti.ImaginaryQuadraticModularity.quartic_models: signature withheld pending its genuine supplier carrier; full contract:
C1=V(quartic1) and C2=V(quartic2) are smooth nonhyperelliptic projective curves of genus 3 over ℚ, ℚ-isomorphic respectively to X(ns3°,ns5) and X(s3,ns5). Their displayed involutions are the unique nonidentity ℚ-automorphisms, and their degree-two quotient morphisms πi:Ci→B agree with the modular maps through X(ns3,ns5) under mixed_elliptic_model. All j-maps, normalization maps, quotient maps and rational base divisors are exported together.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1-involution, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2-involution, ModularCurvesPartII:R13.4a, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic
Gaps: EllipticCurveModularityImaginaryQuadratic/G14
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints: executable algebraic signature above; full contract:
For a characteristic-zero field K and s∈K with s²=−55, define quarticImaginaryPoints(K,s) as the ordered pair of projective coordinate triples P1=((1+s)/28,(27−s)/56,1), P2=((3−s)/4,(3+3s)/4,1). Both lie on C2. Under the certified modular j-map both have j=−32768. The polynomial substitution is separate from the modular-map comparison; changing s to −s gives the conjugate pair.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models
Gaps: EllipticCurveModularityImaginaryQuadratic/G14
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_coordinates [signature/example above]: The ordered coordinate triples are exactly the displayed P1,P2, both with Z=1.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_on_curve [signature/example above]: If s²=−55 in characteristic zero, evaluating quartic2 at either triple is zero.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_j [requires genuine supplier interface]: Under quartic_models and its modular j-map, both points have j=−32768, the rational CM j-value of discriminant −11.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_first [signature/example above]: Substituting P1 into quartic2 gives zero when s²=−55.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_second [signature/example above]: Substituting P2 into quartic2 gives zero when s²=−55.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_field [signature/example above]: Over ℚ(√−55), both points are nonrational, distinct and have nonzero Z; conjugation sends s to −s, not s.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks
TauCeti.ImaginaryQuadraticModularity.quartic_jacobian_ranks: signature withheld pending its genuine supplier carrier; full contract:
For both i=1,2, rk Jac(Ci)(ℚ)=rk B(ℚ)=1. The source-specific Chen/de Smit–Edixhoven comparison gives Jac(C1) isogenous to the new part of Jac(X₀(225)/w25), with elliptic factors 225c,225a,225d of ranks 0,1,0. For C2 use the 5-new part of Jac(X₀(225)/⟨w9,w25⟩): the factors are 225a,75c,75a of ranks 1,0,0; w9 has characteristic polynomial T²−1 on each level-75 oldspace. These are isogeny/rank computations, not analytic-rank assertions.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil, ModularCurvesPartII:R14.2, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G14
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses: signature withheld pending its genuine supplier carrier; full contract:
In Jac(C2)(ℚ), define D10=[(0:1:1)]−[(-3:7:1)] and D2=5([(0:1:0)]+[(-1/2:-1/2:1)]+Pl2−2Pl1), where Pl1 is the degree-two place cut out in Z=1 by u²−5u+1=0,v+2u−1=0, and Pl2 by u²+u−1=0,v+3u−3=0. The degrees are 1+1+2−2·2=0. These rational divisor classes have exact orders 10 and 2 and D2∉⟨D10⟩. The places here are real quadratic and are distinct from quarticImaginaryPoints.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_divisors [requires genuine supplier interface]: The two classes are the images of the displayed rational degree-zero divisors, in the named place convention.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_orders [requires genuine supplier interface]: D10 has exact order 10 and D2 has exact order 2.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_independent [requires genuine supplier interface]: The homomorphism ℤ/10⊕ℤ/2→Jac(C2)(ℚ) sending the generators to D10,D2 is injective.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_ten [requires genuine supplier interface]: 10D10=0, 5D10≠0 and 2D10≠0.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_two [requires genuine supplier interface]: 2D2=0 and D2≠0.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_independence [requires genuine supplier interface]: D2−5D10≠0, so the subgroup has order 20 rather than 10.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion
TauCeti.ImaginaryQuadraticModularity.quartic_jacobian_torsion: signature withheld pending its genuine supplier carrier; full contract:
Jac(C1)(ℚ)tors is isomorphic to a subgroup of ℤ/2⊕ℤ/2; no equality is asserted. Jac(C2)(ℚ)tors≅ℤ/2⊕ℤ/10, generated by quarticTorsionClasses. Good reductions at 7,11,13 give gcd of group orders 4 for C1 and 20 for C2; Jac(C1)(𝔽13)≅ℤ/2⊕ℤ/1710, which excludes order-4 cyclic rational torsion.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds
TauCeti.ImaginaryQuadraticModularity.quartic_pullback_indices: signature withheld pending its genuine supplier carrier; full contract:
Choose a saturated generator D of B(ℚ)≅ℤ, viewed in Jac(B)(ℚ), and set Gi=⟨πi*D⟩⊂Jac(Ci)(ℚ). Then 2Jac(Ci)(ℚ)⊂⟨Gi,Jac(Ci)(ℚ)tors⟩ for i=1,2. Consequently 4Jac(C1)(ℚ)⊂2G1 and 10Jac(C2)(ℚ)⊂⟨5G2,Jac(C2)(ℚ)[2]⟩. The source prints G1 in the second inclusion; the correct group is G2.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion, EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil, ModularCurvesPartII:R14.2
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve
TauCeti.ImaginaryQuadraticModularity.first_quartic_quadratic_divisors: signature withheld pending its genuine supplier carrier; full contract:
For C1 and its modular quotient π1:C1→B, Sym²(C1)(ℚ)=π1*B(ℚ). Apply the imported relative symmetric sieve with G=⟨2π1*D⟩, I=4, a rational degree-two base divisor pulled back from the origin of B, good prime 43, and L of eight pullback divisors. The reduced group red43(G) is cyclic of order 7, and iota43⁻¹(red43(G)) has exactly seven degree-two divisor classes. L covers all seven, each satisfying the relative Chabauty criterion; hence the bad set is empty.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds, EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty, EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve
TauCeti.ImaginaryQuadraticModularity.second_quartic_quadratic_divisors: signature withheld pending its genuine supplier carrier; full contract:
For C2 and π2:C2→B, Sym²(C2)(ℚ)=π2*B(ℚ)∪L16, with L16 sixteen rational effective degree-two divisors not pulled back. Eight are sums of rational points not interchanged by w2; eight are conjugate pairs of quadratic points. Precisely two quadratic pairs are imaginary, the pairs of quarticImaginaryPoints over ℚ(√−55); six are real. Use G=⟨5π2*D,D2,5D10⟩, I=10 and good primes 11,43. The intersection of the two lifted bad-coset sets is empty after the imported symmetric/relative local criteria. A search bound alone is not the completeness proof.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds, EffectiveDiophantineMethods:ED.4/symmetric-chabauty, EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty, EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-modularity
TauCeti.ImaginaryQuadraticModularity.first_quartic_points_modular: signature withheld pending its genuine supplier carrier; full contract:
For every quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(ns3°,ns5), E is modular. Its degree-two divisor is pulled back from B(ℚ) by first_quartic_quadratic_divisors, so its j-value is rational. A rational-j curve over a quadratic field is a quadratic twist of a ℚ-model unless j is 0 or 1728; those cases are geometrically CM. Apply rational modularity, base change and twist invariance, or the CM branch.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-modularity
TauCeti.ImaginaryQuadraticModularity.second_quartic_points_modular: signature withheld pending its genuine supplier carrier; full contract:
For every imaginary quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(s3,ns5), E is modular. All relevant irreducible quadratic pairs are pullbacks from B(ℚ), except quarticImaginaryPoints and their conjugates, which have rational CM j=−32768. Rational degree-two sums contribute only rational points and also have rational j. No conclusion for arbitrary real-quadratic exceptional pairs is inferred from this classification.
Hypotheses: F imaginary quadratic.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/residual-image-modularity
TauCeti.ImaginaryQuadraticModularity.imaginary_quadratic_residual_modularity: signature withheld pending its genuine supplier carrier; full contract:
Let F be an imaginary quadratic number field and E/F an elliptic curve. If GF acts irreducibly on E[5] over 𝔽5 (absolute irreducibility is not required), or GF acts irreducibly on E[3] over 𝔽3 and its image is not conjugate to the whole normalizer of a split Cartan, then E is modular. The mod-3 exclusion is equality up to conjugacy with the whole normalizer, not containment in some split normalizer.
Hypotheses: F imaginary quadratic.; Either of the two displayed residual-image conditions.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-modularity, ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-modularity
TauCeti.ImaginaryQuadraticModularity.finite_level_fifteen_modularity: signature withheld pending its genuine supplier carrier; full contract:
For an imaginary quadratic number field F with finite X₀(15)(F), every elliptic curve E/F is modular. Finite here means the full set of F-rational points of the compactified curve; since it is an elliptic curve over ℚ with a rational origin, this is equivalent to Mordell–Weil rank zero over F. The statement imposes no restriction on the residual images of E. It is CN Theorem 1.1 and Corollary 7.1.2, not unconditional modularity over every imaginary quadratic field.
Hypotheses: F imaginary quadratic.; X₀(15)(F) finite.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.8/residual-image-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth, EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples
TauCeti.ImaginaryQuadraticModularity.small_imaginary_quadratic_modularity: signature withheld pending its genuine supplier carrier; full contract:
For F=ℚ(√−d) with d∈{1,2,3,5}, X₀(15)(F) is finite and hence every elliptic curve over F is modular. Each application includes a certified rank-zero calculation for the rational elliptic model E15 and its quadratic twist by −d: rk E15(F)=rk E15(ℚ)+rk E15^(−d)(ℚ)=0. The Gaussian field retains its extra torsion without acquiring positive rank.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G16
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/nonfinite-level-fifteen-example
TauCeti.ImaginaryQuadraticModularity.sqrt_minus_ten_infinite_level_fifteen: signature withheld pending its genuine supplier carrier; full contract:
Let F=ℚ(√−10) and s²=−10. The point (x,y)=(-1,6s) on E15:y²=x(x+16)(x+25) is nontorsion. It is not rational, and quadratic_torsion_growth shows that E15(F)tors=E15(ℚ) because F is neither ℚ(i) nor ℚ(√5). Hence X₀(15)(F) is infinite. This gives a concrete field to which finite_level_fifteen_modularity does not apply; it says nothing against modularity of particular curves over that field.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic
TauCeti.ImaginaryQuadraticModularity.nonsplit_cartan_conic: signature withheld pending its genuine supplier carrier; full contract:
X(ns3°) is the smooth projective conic Y²+3X²+36XZ+432Z²=0 over ℚ. Its degree-two map to X(ns3) sends [X:Y:Z] to [X:Z], with j=(X/Z)³ on Z≠0 and cusp fiber at Z=0 defined over ℚ(√−3). It has no ℚ-point: its equation is Y²+3(X+6Z)²+324Z²=0. This source-specific comparison distinguishes the actual Cartan from its rational normalizer curve.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j, ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers
Gaps: EllipticCurveModularityImaginaryQuadratic/G7
-/

end TauCeti.ImaginaryQuadraticModularity
end
