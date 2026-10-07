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
TauCeti.ImaginaryQuadraticModularity.Modular: full contract; executable signatures above cover only the baseline algebraic part.
For a number field F and a Weierstrass curve E/F with Δ(E) ≠ 0, Modular(E) means: either End(E over F̄) is larger than ℤ (geometric CM), or there exist a rational prime p, an isomorphism ι:Q̄p≅ℂ and a cuspidal regular algebraic automorphic representation π of GL₂(𝔸F), cohomological of weight 0, such that rπ,ι≅rE,p∨ as continuous representations of GF. Weight 0 and the Tate-normalized local Langlands convention are those of CN §2. The CM branch does not impose cuspidality.
Hypotheses: F is a number field.; E is elliptic.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.IsElliptic, GL2AutomorphicRepresentationsAndTransfer:R16.4, AutomorphicGaloisRepresentationsPartII:AG2.7, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, GL2AutomorphicRepresentationsAndTransfer:R16.3, GL2AutomorphicRepresentationsAndTransfer:R16.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G1
Construction or proof:
1. Use the imported geometric endomorphism algebra and GF-action on the rational Tate module of E.
2. Use the GL₂ automorphic carrier and the attached representation from R17 and AG2; make the disjunction explicit.
Source: CN, §6.1, definition before Theorem 6.1, p.87
TauCeti.ImaginaryQuadraticModularity.Modular.of_cm [requires the stated supplier interface]: Geometric CM implies Modular(E), including when the CM field is contained in F.
TauCeti.ImaginaryQuadraticModularity.Modular.non_cm_iff [requires the stated supplier interface]: For a non-CM E/F, Modular(E) iff the displayed existence of p, ι, π and the dual Tate-module isomorphism holds.
TauCeti.ImaginaryQuadraticModularity.Modular.isogeny_iff [requires the stated supplier interface]: If E and E′ are F-isogenous elliptic curves, Modular(E) iff Modular(E′).
TauCeti.ImaginaryQuadraticModularity.Modular.test_cm [requires the stated supplier interface]: The smooth curve y²=x³+1 over ℚ(√−3) is Modular through its geometric CM, even though its Tate module splits over the CM field.
TauCeti.ImaginaryQuadraticModularity.Modular.test_rational_base [requires the stated supplier interface]: Every elliptic curve E/ℚ satisfies Modular(E), by EllipticCurveModularity R29.6 with the same dual normalization.
TauCeti.ImaginaryQuadraticModularity.Modular.test_dual_determinant [requires the stated supplier interface]: For p=5 over a number field, det(rE,p)=εp and det(rE,p∨)=εp⁻¹ are distinct characters; an isomorphism to rE,p cannot replace the isomorphism to its dual.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness
TauCeti.ImaginaryQuadraticModularity.automorphic_unique: full contract; executable signatures above cover only the baseline algebraic part.
If F is a CM field and E/F is a non-CM modular elliptic curve, there is a unique cuspidal regular algebraic π of GL₂(𝔸F) of weight 0 giving the modularity isomorphism. Its central character is trivial; π therefore descends to PGL₂. Uniqueness is up to isomorphism, not equality of a chosen model.
Hypotheses: F is imaginary CM.; E is modular and non-CM.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, GL2AutomorphicRepresentationsAndTransfer:R16.4, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, GL2AutomorphicRepresentationsAndTransfer:R16.3
Gaps: EllipticCurveModularityImaginaryQuadratic/G1
Construction or proof:
1. Compare characteristic polynomials at almost all good places using the Tate determinant convention.
2. Apply strong multiplicity one; use the determinant-central-character dictionary to obtain trivial central character.
Source: CN, Lemma 6.1.3(1), p.88
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes
TauCeti.ImaginaryQuadraticModularity.automorphic_all_primes: full contract; executable signatures above cover only the baseline algebraic part.
With E/F and π as in automorphic_unique, for every rational prime p and every ι:Q̄p≅ℂ, rπ,ι≅rE,p∨ as continuous GF-representations. A common coefficient field and semisimple comparison are supplied before concluding an isomorphism.
Hypotheses: F is imaginary CM.; E is modular and non-CM.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.7, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent
Gaps: EllipticCurveModularityImaginaryQuadratic/G1
Construction or proof:
1. Match the good-place polynomials of the compatible automorphic system with those of E.
2. Apply semisimple Chebotarev comparison and non-CM irreducibility of the Tate module; do not infer the comparison merely from the existential definition.
Source: CN, Lemma 6.1.3(2), p.88
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne
TauCeti.ImaginaryQuadraticModularity.automorphic_wd: full contract; executable signatures above cover only the baseline algebraic part.
For E/F and π as above, every p, every ι and every finite place v∤p satisfy WD(rE,p∨|GFv)F-ss≅recᵀFv(πv). Frobenius semisimplification retains the monodromy N. This is an isomorphism of Weil–Deligne representations, not just an equality of their semisimplified Weil representations.
Hypotheses: F is imaginary CM.; E is modular and non-CM.; v∤p.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes, AutomorphicGaloisRepresentationsPartII:AG2.5, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, GL2AutomorphicRepresentationsAndTransfer:R16.3
Gaps: EllipticCurveModularityImaginaryQuadratic/G2
Construction or proof:
1. Start from Varma’s semisimplified local–global comparison.
2. Use purity of the elliptic-curve local WD representation to upgrade and recover N, following the cited Taylor–Yoshida argument.
Source: CN, Lemma 6.1.3(3) and proof, p.88
Acceptance conditions:
At a good place N=0; at a potentially multiplicative place the Steinberg monodromy is nonzero after the appropriate twist.
No inference from equality of semisimple Weil representations alone is accepted.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary
TauCeti.ImaginaryQuadraticModularity.automorphic_potentially_multiplicative_ordinary: full contract; executable signatures above cover only the baseline algebraic part.
If E/F is non-CM modular and v|p is a place of potentially multiplicative reduction, then π is ι-ordinary at v of weight 0. For another prime ℓ≠p, full local–global compatibility identifies πv with a quadratic twist of Steinberg; transfer this local type to p-adic ordinarity.
Hypotheses: F is imaginary CM.; E is modular and non-CM.; v|p and E has potentially multiplicative reduction at v.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, OrdinaryAutomorphicFormsAndModularityLifting:R21.1
Gaps: EllipticCurveModularityImaginaryQuadratic/G2
Construction or proof:
1. Use Tate uniformization after a quadratic extension and the ℓ-adic WD representation.
2. Apply the imported Steinberg-twist ordinarity criterion (Geraghty Lemma 5.6 as cited in CN).
Source: CN, Lemma 6.1.3(4) and proof, p.88
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance
TauCeti.ImaginaryQuadraticModularity.modularity_transport: full contract; executable signatures above cover only the baseline algebraic part.
For elliptic curves over any number field, modularity is invariant under isogeny and quadratic twist, and is preserved under conjugating the number field. If L/F is a finite Galois solvable CM extension and E/L is the base change of E/F, modularity of E/L implies modularity of E/F. In the non-CM branch use irreducibility of the Tate representation over GL; CM is handled separately. Base change along a finite solvable number-field extension preserves modularity, allowing the CM branch when cuspidality fails.
Hypotheses: Number fields for isogeny, twist, conjugacy and solvable base change; CM fields for the stated solvable descent.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent, GL2AutomorphicRepresentationsAndTransfer:R17.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies
Construction or proof:
1. Transfer isogenies and quadratic twists on the Tate module; tensor the automorphic representation by the same quadratic idele-class character.
2. Use the imported soluble automorphic base-change/descent theorem only in its irreducible case; treat geometric CM directly.
3. Transport the whole datum along a field isomorphism.
Source: CN, Proofs of Theorem 6.1, Corollaries 7.1.2, 7.2.5 and 7.3.4
Acceptance conditions:
The 4050.1-c3 calculation can be transported by ℚ(i)-isogeny, field conjugation and quadratic twisting.
The local monodromy and determinant normalizations are preserved.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist
TauCeti.ImaginaryQuadraticModularity.symplecticTwist: full contract; executable signatures above cover only the baseline algebraic part.
For p∈{3,5}, a number field F and continuous ρ̄:GF→GL₂(𝔽p) with det ρ̄=ε̄p, construct the smooth affine twist Yρ̄/F of the fixed-pairing full-level curve. For every extension K/F its K-points classify pairs (A/K,α), up to isomorphism, where A is elliptic and α:𝔽p²≅A[p](K̄) is a GK-equivariant symplectic identification with the restriction of the given ρ̄, with the standard determinant pairing on ρ̄ matched to the Weil pairing. For p=3 the simultaneous sign automorphism and the actual rigidified moduli problem must be treated through the upstream level-structure construction; no coarse universal curve is assumed. Its smooth proper completion has geometric genus zero.
Hypotheses: p=3 or p=5.; F is a number field.; ρ̄ is continuous with cyclotomic determinant.
Prerequisites: tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ, ModularCurvesPartII:R12.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation
Construction or proof:
1. Extend the upstream fixed-pairing descent from ℚ to F without changing its moduli functor.
2. Use determinant=cyclotomic to descend the pairing and twist; identify its base change with the full-level curve.
3. Use genus zero at levels 3 and 5, keeping existence of an F-point separate from geometric rationality.
Source: CN, Proof of Proposition 6.1.5, p.89; AKT §9, twists in Lemmas 9.6–9.7
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.points [requires the stated supplier interface]: The stated K-point classification holds naturally in K/F, with symplectic isomorphisms and the correct isomorphism relation.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.baseChange [requires the stated supplier interface]: For an extension K/F the base change of Yρ̄ is canonically the twist associated to ρ̄|GK; these identifications satisfy identity and composition.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.rational [requires the stated supplier interface]: If the smooth completion has an F-point, its genus-zero curve is F-isomorphic to ℙ¹, and Yρ̄ is the corresponding complement of the cusps.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_tautological [requires the stated supplier interface]: For ρ̄=A[p] in a symplectic basis, (A,id) gives an F-point of Yρ̄.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_pairing [requires the stated supplier interface]: At p=5, the change of level basis diag(2,1) multiplies the Weil pairing exponent by 2 and is not symplectic; it cannot act as a pairing-preserving identification.
TauCeti.ImaginaryQuadraticModularity.symplecticTwist.test_local_trivial [requires the stated supplier interface]: Over a local field K containing μp, the trivial ρ̄ and any A with all p-torsion K-rational yield a K-point after choosing a symplectic basis; geometric genus zero alone does not assert a K-point.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation
TauCeti.ImaginaryQuadraticModularity.solvable_preparation: full contract; executable signatures above cover only the baseline algebraic part.
Let F be imaginary CM, p∈{3,5}, ρ̄:GF→GL₂(𝔽p) continuous, cyclotomic determinant and decomposed generic, and Favoid/F finite Galois. There is a finite Galois solvable CM extension L/F disjoint from Favoid such that each w|2,3,p is split over L⁺ and ρ̄|GLw is trivial; for every w|p there are local elliptic curves with good ordinary and good supersingular reduction and rational p-torsion; Lw(√−1)/Lw is unramified at w|2; a rational prime q>5 witnessing decomposed genericity splits completely in L. Local degrees and the chosen witness are part of the output. Where ζ5 must be excluded, enlarge the avoidance field by F(ζ5) before constructing L.
Hypotheses: F imaginary CM; p=3 or 5.; ρ̄ has cyclotomic determinant and is decomposed generic.; Favoid/F finite Galois.
Prerequisites: tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences, InverseGaloisAndArithmeticFundamentalGroups:IG.2, ArithmeticGaloisRepresentations:R01.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
Construction or proof:
1. Choose one decomposed-generic rational q and require all q-adic places to split, so the same local Frobenius eigenvalue ratios survive.
2. Construct solvable local extensions trivializing the finite residual images and p-torsion of ordinary/supersingular local curves; make the required places split over the real subfield.
3. Globalize the finite local conditions with disjointness from Favoid and the indicated cyclotomic field; the exact CM globalization theorem is G3.
4. Preserve the finite residual/cyclotomic image by disjointness from its field in Favoid. Do not invoke PA.5/split-test-prime-image-preservation: its enormousness and scalar hypotheses are stronger than the switching hypotheses, particularly at p=3.
Source: CN, Proof of Proposition 6.1.5, p.89; proof of Proposition 6.1.6, p.90, compared with AKT 9.13–9.15
Acceptance conditions:
The witness q is one rational prime and every place above it is retained, not only one selected place.
Disjointness from Favoid preserves residual image only if the required residual field was included in Favoid.
A retained q supplies genericity; full image preservation separately requires the residual field in the avoidance datum. No enormousness assumption is inserted at p=3.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity
TauCeti.ImaginaryQuadraticModularity.seed_modular: full contract; executable signatures above cover only the baseline algebraic part.
Let K be imaginary CM and A/K elliptic with discriminant Δ from a chosen Weierstrass equation. Suppose: at each v|2, A is a Tate curve, Kv(√−1)/Kv is unramified, ordv Δ≡3 mod 6, and Δ/Δc is a square in Kv; at each v|3, A is a Tate curve, ordv Δ≡2 or 4 mod 6, and Δ/Δc is a cube in Kv; for M=K(ζ12,(Δ/Δc)^(1/6)), r̄A,3|GM is decomposed generic and its image on GM(ζ3) is conjugate to SL₂(𝔽3). Then A is modular. Here c is the CM involution; the choices of sixth root do not affect the field M.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist, ArithmeticGaloisRepresentations:R01.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, ModularCurvesPartII:R12.4
Gaps: EllipticCurveModularityImaginaryQuadratic/G4
Construction or proof:
1. Use AKT 9.4 to make the discriminant a real element times a sixth power after the stated solvable extension.
2. Use the 2–3 discriminant-preserving coupling of AKT 9.6: the mod-2 seed is induced/dihedral, extends over K⁺, and satisfies the precise ramified quadratic local conditions of AKT Theorem 7.1.
3. Apply the imported AKT CM 2-adic lifting theorem to the seed and AKT ordinary odd-prime Theorem 8.1 to the mod-3 transfer, then descend. These are open extension contracts G4, not classical nonsolvable dyadic lifting.
Source: AKT, AKT Proposition 9.12, using Lemmas 9.4 and 9.11
Acceptance conditions:
No condition at places above 5 occurs; changing the 5-adic reduction does not affect this seed.
The residue characteristic two hypothesis is dihedral, not nonsolvable; R22.6/R32.3 alone do not supply it.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection
TauCeti.ImaginaryQuadraticModularity.hilbert_local_selection: full contract; executable signatures above cover only the baseline algebraic part.
After solvable_preparation has made Yρ̄ an open subcurve of ℙ¹L, given nonempty open subsets Ωw⊂Yρ̄(Lw) at all the finitely many selected places and the finite covers encoding auxiliary large mod-3 or mod-5 image, there is an L-point in every Ωw outside the relevant thin exceptional sets. In the p=5 construction impose the AKT 9.7 discriminant-conjugacy, Tate valuation and large mod-3 conditions for seed_modular; independently choose at every w|5 ordinary, supersingular or split multiplicative local prototypes according to the prescribed partition. In the p=3 construction impose Tate reduction at every place above 5 for the ordinary mod-5 seed without constraining the prescribed 3-adic ordinary/supersingular/multiplicative choices.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist, EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences, InverseGaloisAndArithmeticFundamentalGroups:IG.2, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
Construction or proof:
1. Show each reduction condition is locally open on the affine parameter curve and nonempty using the selected prototypes.
2. Use AKT 9.7 to retain the Tate/discriminant conditions at 2 and 3 for p=5; for p=3 choose Tate prototypes at every place above 5. Hilbert specialization avoids auxiliary residual image drops without changing the prescribed p-adic partition.
3. Apply the number-field Hilbert irreducibility theorem with weak approximation; preserve the fixed q witness and the avoidance field.
Source: CN, Proofs of Propositions 6.1.5–6.1.6; AKT Lemma 9.7 and Propositions 9.13–9.15
Acceptance conditions:
Every place over the prescribed prime is constrained, not just the chosen lift of a place.
A point found by finite search is not a substitute for avoiding the thin set.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five
TauCeti.ImaginaryQuadraticModularity.switch_five: full contract; executable signatures above cover only the baseline algebraic part.
Let F be imaginary CM, ρ̄:GF→GL₂(𝔽5) continuous with det=ε̄5 and decomposed generic, and partition the places v|5 as S5st⊔S5ord⊔S5ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,5≅ρ̄|GL, and ρ̄|GL remains decomposed generic. ζ5∉F is not a hypothesis of this proposition. The construction also retains Tate reduction at every place above 2 and 3, independently of the prescribed 5-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere.
Hypotheses: F imaginary CM.; ρ̄ continuous, det=ε̄5, decomposed generic.; The three sets partition every place above 5.; Favoid/F finite Galois.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection, EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
Construction or proof:
1. Perform solvable preparation and simultaneous selection on Yρ̄ with the specified 5-adic prototypes.
2. Obtain modularity from the independent 2–3 seed; match residual mod-5 representation via the symplectic level identification.
3. Retain the q witness and disjointness; read A over Lw, correcting the printed Fw.
4. Retain the seed’s Tate places above 2 and 3 and deduce non-CM from the CM potentially-good-reduction theorem; the congruence alone does not imply non-CM.
Source: CN, Proposition 6.1.5, pp.88–89
Acceptance conditions:
Taking S5ss to be all 5-adic places yields an auxiliary curve with good supersingular reduction everywhere above 5.
The modularity argument never invokes the target CN Theorem 6.1, avoiding a cycle.
The auxiliary curve is non-CM even when every prescribed 5-adic place is supersingular: retain its Tate places above 2 and 3.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three
TauCeti.ImaginaryQuadraticModularity.switch_three: full contract; executable signatures above cover only the baseline algebraic part.
Let F be imaginary CM with ζ5∉F, ρ̄:GF→GL₂(𝔽3) continuous with det=ε̄3 and decomposed generic, and partition all places v|3 as S3st⊔S3ord⊔S3ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,3≅ρ̄|GL, and ρ̄|GL remains decomposed generic. The construction also retains Tate reduction at every place above 5, independently of the prescribed 3-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere.
Hypotheses: F imaginary CM and ζ5∉F.; ρ̄ continuous, det=ε̄3, decomposed generic.; The three sets partition every place above 3.; Favoid/F finite Galois.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five, EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity, ArithmeticGaloisRepresentations:R01.4, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv
Gaps: EllipticCurveModularityImaginaryQuadratic/G3, EllipticCurveModularityImaginaryQuadratic/G4
Construction or proof:
1. Add F(ζ5) and the relevant residual fields to avoidance.
2. Construct an auxiliary curve on Yρ̄ with the prescribed 3-adic local prototypes, Tate reduction at every 5-adic place and large mod-5 image.
3. Use the independent ordinary mod-5 AKT 9.14 seed (Theorem 8.1) to prove the auxiliary curve modular, retaining disjointness and the 3-adic generic witness.
4. The retained Tate places above 5 force A to be non-CM; export this witness before choosing its cuspidal representation.
Source: CN, Proposition 6.1.6, pp.89–90; AKT 9.14–9.15
Acceptance conditions:
The ζ5 condition belongs here and is kept when invoking the ordinary mod-5 seed.
Supersingular at 3 is allowed; ordinary modularity lifting is used at 5, not incorrectly at 3.
The auxiliary curve is non-CM even when every prescribed 3-adic place is supersingular: retain its Tate places above 5.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types
TauCeti.ImaginaryQuadraticModularity.auxiliary_local_types: full contract; executable signatures above cover only the baseline algebraic part.
For A/L supplied by switch_five (p=5) or switch_three (p=3), A is non-CM by its retained Tate places; let π be its weight-zero cuspidal modular representation with rπ,ι≅rA,p∨. For every w|p above v of F, π is ι-ordinary if v∈Spst; πw is unramified if v∈Spord∪Spss. In the latter case the associated p-adic representation is crystalline with N=0 and is potentially ordinary precisely in the ordinary case. The prime order printed in CN Lemma 6.1.7 is reversed and corrected here.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three, EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne, EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv
Gaps: EllipticCurveModularityImaginaryQuadratic/G3
Construction or proof:
1. Use the retained Tate places in the switching output. CM implies potentially good reduction everywhere, whereas Tate reduction has nonintegral j; hence A is non-CM and has the required cuspidal π.
2. Apply full WD compatibility at an auxiliary ℓ≠p to identify good reduction with the unramified local factor and split multiplicative with Steinberg.
3. Use local p-adic Hodge theory of elliptic curves to distinguish good ordinary from good supersingular reduction.
4. Apply potentially-multiplicative ordinarity to this non-CM A. CM of an auxiliary curve would not establish modularity of the unrelated target E.
Source: CN, Lemma 6.1.7, p.90, and Theorem 6.1 proof
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
A Tate place excludes CM of A; no inference from CM of A to modularity of the target E is used.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data
TauCeti.ImaginaryQuadraticModularity.elliptic_lifting_data: full contract; executable signatures above cover only the baseline algebraic part.
For an elliptic curve E over an imaginary CM field F and p∈{3,5}, ρ=rE,p∨ is continuous, det ρ=εp⁻¹ and unramified at almost all finite places. At every v|p it is potentially semistable with the source-normalized labeled Hodge–Tate weights {0,1}. For the extension assertion additionally assume the selected residual representation is decomposed generic, fix a witnessing rational prime q>5, and fix a finite Galois avoidance field containing the residual and cyclotomic fields. Then after a finite Galois solvable CM extension disjoint from that avoidance field and splitting every place above q, the potentially good places are Barsotti–Tate (ordinary exactly at the potentially ordinary ones), while the potentially multiplicative places become split multiplicative and the dual local representation is a noncrystalline extension of εp⁻¹ by 1. Translate the imported convention HT(εp)=+1 to CN’s HT(εp)=−1 when using R06; do not swap the covariant Tate module with its dual.
Hypotheses: The determinant, ramification and potentially semistable weight assertions require only E/F elliptic, F imaginary CM and p∈{3,5}.; The witness-preserving extension assertion additionally requires residual decomposed genericity, a fixed witnessing rational q>5 and a specified finite Galois avoidance field.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.IsElliptic, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv, PadicHodgeTheory:R06.5, PadicHodgeTheory:R06.6, EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation, ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison, ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness, AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes
Construction or proof:
1. Use the Weil pairing for det rE,p and dualize; apply geometric p-adic comparison to E.
2. Classify local reduction into potentially ordinary good, supersingular good and multiplicative.
3. For the conditional extension assertion, choose a generic q>5 using infinitely-many-decomposed-generic-primes, then apply solvable_preparation with that witness and the specified residual/cyclotomic avoidance field. The local comparison assertions themselves remain unconditional.
Source: CN, Proof of Theorem 6.1, p.90, with Theorem 5.2, p.74
Acceptance conditions:
For the source convention the dual, not the covariant Tate module, has weights {0,1}.
The potentially multiplicative case has N≠0 and cannot enter the crystalline set.
A curve with no supplied generic witness still has the unconditional local comparison; the witness-preserving extension clause cannot be invoked for it.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity
TauCeti.ImaginaryQuadraticModularity.cm_modularity: full contract; executable signatures above cover only the baseline algebraic part.
Let F be an imaginary CM number field with ζ5∉F and E/F elliptic. If for at least one p∈{3,5}, r̄E,p is decomposed generic and r̄E,p|GF(ζp) is absolutely irreducible, then E is modular. No Galois-over-ℚ hypothesis is imposed. Decomposed genericity has the existential rational-prime/all-places eigenvalue-nonratio meaning, not merely distinct eigenvalues.
Hypotheses: F imaginary CM with ζ5∉F.; E elliptic.; There exists p=3 or p=5 with both stated residual hypotheses.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five, EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three, EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field, AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity, CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2
Gaps: EllipticCurveModularityImaginaryQuadratic/G5
Construction or proof:
1. Handle geometric CM directly. For a non-CM E choose a p satisfying both residual conditions and include the residual field and F(ζ5) in avoidance.
2. Produce a modular auxiliary A/L with matching residual representation and reduction partition; auxiliary_local_types supplies the unramified/ordinary local π conditions.
3. Apply CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2 (potentially_barsotti_tate_lifting_qualified) to rE,p∨|GL. Its E12 qualification is automatic here: [L(ζp):L] divides p−1, hence cannot equal 3 for p=3 or 5. Use R01.4 Lemma 6.1.4 for the exceptional p=5 projective-field condition, preserving the full residual/cyclotomic avoidance datum.
4. Descend modularity through the finite solvable CM extension using modularity_transport.
Source: CN, Theorem 6.1 and proof, pp.87,90
Acceptance conditions:
Theorem applies to non-Galois CM fields when the residual conditions are given.
The final statement is never extended to ζ5∈F by deleting that hypothesis.
The supplier’s extra condition d_cyc≠3 or projective image not A4 is discharged by d_cyc|p−1 for p=3,5; its general odd-prime theorem is not silently strengthened.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity
TauCeti.ImaginaryQuadraticModularity.quadratic_modularity: full contract; executable signatures above cover only the baseline algebraic part.
Let F be imaginary quadratic and E/F elliptic. If r̄E,3|GF(ζ3) or r̄E,5|GF(ζ5) is absolutely irreducible, E is modular. The quadratic-field Goursat/Chebotarev lemma supplies decomposed genericity; it is not an additional hypothesis on E. Since [ℚ(ζ5):ℚ]=4, an imaginary quadratic F does not contain ζ5.
Hypotheses: F imaginary quadratic.; E elliptic.; The restriction for p=3 or 5 is absolutely irreducible.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity, ArithmeticGaloisRepresentations:R01.4
Construction or proof:
1. Import the quadratic-field genericity lemma from the residual-image owner, with p odd and absolute irreducibility over F(ζp).
2. Use the field-degree exclusion of ζ5 and apply cm_modularity.
Source: CN, Corollary 6.1.1, p.87, and Lemma 6.2.2, pp.90–91
Acceptance conditions:
Absolute irreducibility is on the cyclotomic restriction; irreducibility over 𝔽p alone is not substituted here.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/short-weierstrass-family
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily: full contract; executable signatures above cover only the baseline algebraic part.
For a number field F with ring of integers 𝒪F, the equation family is the set of pairs (a,b)∈𝒪F² with 4a³+27b²≠0, representing y²=x³+ax+b via the existing five-coefficient Weierstrass curve (0,0,0,a,b). Its ordering is H(a,b)=‖(a,b)‖ for a fixed norm on the finite-dimensional real vector space ℝ⊗ℤ𝒪F² as in Zywina §1.1. Distinct coefficient pairs are counted separately, without isomorphism quotient or stabilizer weights. At X count pairs with H≤X; take the ratio of modular pairs to all nonsingular pairs and its limit as X→∞.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, ArithmeticStatistics:ST.0
Construction or proof:
1. Import the lattice, norm height, bounded-height finite counting and density framework from ST.0.
2. Map the nonsingular pair into Mathlib WeierstrassCurve; prove its discriminant is −16(4a³+27b²).
3. Use counts of equations, not ℚ-minimal models or elliptic-curve isomorphism classes.
Source: CN, Corollary 6.1.2 proof, pp.87–88; Zywina §1.1 and Proposition 5.2
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.mem [requires the stated supplier interface]: Membership is exactly a,b integral and 4a³+27b²≠0.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.discriminant [requires the stated supplier interface]: The associated Mathlib curve has Δ=−16(4a³+27b²), so the family condition is exactly ellipticity in characteristic zero.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.height_count [requires the stated supplier interface]: The family’s count at X equals the ST.0 unweighted count of its coefficient lattice points of norm ≤X; no curve-isomorphism quotient enters.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_zero [requires the stated supplier interface]: (0,0) is excluded because its discriminant is zero.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_one [requires the stated supplier interface]: (0,1) is included and its discriminant is −432.
TauCeti.ImaginaryQuadraticModularity.shortEquationFamily.test_scaling [requires the stated supplier interface]: The pairs (0,1) and (0,64) are distinct family elements, although their curves are F-isomorphic by scaling x by 4 and y by 8; a count of isomorphism classes would identify them.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.3/density-one
TauCeti.ImaginaryQuadraticModularity.density_one: full contract; executable signatures above cover only the baseline algebraic part.
Fix an imaginary CM number field F, Galois over ℚ, with ζ5∉F, and any norm height of shortEquationFamily. As X→∞, the fraction of nonsingular integral short Weierstrass equations of height ≤X defining modular elliptic curves tends to 1. For d=[F:ℚ], the bad-image fraction is O((log X)^β/X^(d/2)) for a constant β and constants depending on F and the fixed norm, by Zywina Proposition 5.2. This quantitative bound is for failure of the mod-5 image to contain SL₂(𝔽5); modularity failure is a subset. This is not a statement about all imaginary fields, or about isomorphism classes.
Hypotheses: F fixed imaginary CM, Galois over ℚ.; ζ5∉F.; Coefficient pairs are ordered by a fixed norm on ℝ⊗ℤ𝒪F².
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.3/short-weierstrass-family, EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity, ArithmeticGaloisRepresentations:R01.4, ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field, ArithmeticStatistics:ST.2
Gaps: EllipticCurveModularityImaginaryQuadratic/G6
Construction or proof:
1. Import the quantitative lattice Hilbert/large-sieve estimate for mod-5 image from ST.2, on the exact integral short-equation family.
2. Import Allen–Newton Lemma 2.3: for F/ℚ Galois, SL₂(𝔽5) in the image implies decomposed genericity; its stronger source definition implies the CN one.
3. Use perfectness of SL₂(𝔽5) and the cyclotomic determinant to retain SL₂ after restriction to F(ζ5), giving absolute irreducibility. Apply cm_modularity and squeeze the counting ratio.
Source: CN, Corollary 6.1.2, pp.87–88 (=Theorem 1.2); Zywina Proposition 5.2
Acceptance conditions:
The denominator is the number of nonsingular integral equations, not the number of isomorphism classes.
For F=ℚ(i), the statement yields the specified equation density, while the stronger unconditional curve theorem uses the separate X₀(15) route.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves
TauCeti.ImaginaryQuadraticModularity.cartanCurve: full contract; executable signatures above cover only the baseline algebraic part.
Over ℚ, for a prime p and H⊂GL₂(𝔽p) containing −I with surjective determinant, X(H) is the smooth proper compactification of the imported affine coarse curve YH; j:X(H)→X(1)=ℙ¹ extends its j-map. For distinct primes p₁,p₂ and such H₁,H₂, X(H₁,H₂) is the smooth projective normalization of X(H₁)×X(1)X(H₂). Cusps are exactly j⁻¹(∞). The application subgroups are Borel bp, split and nonsplit normalizers sp,nsp, and actual nonsplit Cartan ns3°. The same formula cannot identify ns3° with the normalizer ns3.
Hypotheses: pᵢ prime, distinct in mixed level.; −I∈Hᵢ and det Hᵢ=𝔽pᵢ×.; Base ℚ, and number-field points in characteristic zero.
Prerequisites: tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli, ModularCurvesPartII:R13.4a, mathlib:AlgebraicGeometry.Scheme.Hom.normalization, ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers
Gaps: EllipticCurveModularityImaginaryQuadratic/G7
Construction or proof:
1. Import YH and the genuine finite group/subgroup carriers. Extend the full-level compactification/finite quotient method to Cartan H, rather than rebuilding quotient or normalization theory.
2. Use the existing relative normalization of the finite map to the j-line and the characteristic-zero regular proper curve dictionary to get the smooth compactification.
3. For mixed coprime level take the normalization of the coarse fiber product and extend all projections and j. The generic extension is proposed once in ModularCurvesPartII; this node specifies the source-specific adapter required by the accepted brief.
Source: CN, §7.1, pp.92–93, definition of X(H) and X(H₁,H₂)
TauCeti.ImaginaryQuadraticModularity.cartanCurve.j [requires the stated supplier interface]: There is a finite j-morphism to ℙ¹ℚ extending the affine coarse j-map; its inverse image of infinity is exactly the cusps.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.mixed [requires the stated supplier interface]: The mixed curve, with both projections, is uniquely the smooth proper normal model of the coarse fiber product’s function field; on its dense open it is the original mixed level moduli curve.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.points [requires the stated supplier interface]: An elliptic E/F with a simultaneous H₁×H₂ orbit of torsion bases fixed by GF gives a noncuspidal F-point with j=j(E). Conversely a geometric coarse point is such a geometric isomorphism class with a GF-fixed orbit; for non-CM j≠0,1728 one may choose an F-model and any two have the same quadratic-twist class. This is a coarse statement, not a fine universal elliptic curve over X(H₁,H₂).
TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_borel [requires the stated supplier interface]: X(b3,b5) is the compactified X₀(15), with cusps j=∞ and rational noncuspidal points representing rational cyclic 15-isogeny level.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_index_two [requires the stated supplier interface]: The map X(ns3°)→X(ns3) has degree two; treating Cartan as its normalizer would give degree one and destroy the branched genus-one/quartic models.
TauCeti.ImaginaryQuadraticModularity.cartanCurve.test_distinct_primes [requires the stated supplier interface]: A mixed point from E has ηᵢ⁻¹r̄E,pᵢ(GF)ηᵢ⊂Hᵢ separately for i=1,2; it does not use one residual prime in both conditions.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/b3-j
TauCeti.ImaginaryQuadraticModularity.b3J: full contract; executable signatures above cover only the baseline algebraic part.
Define b3J∈RatFunc ℚ by the rational expression (x+27)(x+3)³/x, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b3) only through the identification in small_curve_models. Its morphism degree is 4; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.
Source: CN, Proposition 7.1.3(1), p.94
TauCeti.ImaginaryQuadraticModularity.b3J_fraction [requires the stated supplier interface]: b3J is exactly the displayed RatFunc.mk expression (x+27)(x+3)³/x.
TauCeti.ImaginaryQuadraticModularity.b3J_eval [requires the stated supplier interface]: For a characteristic-zero field K, x∈K and the denominator x nonzero, evaluating b3J along ℚ→K at x gives (x+27)(x+3)³/x.
TauCeti.ImaginaryQuadraticModularity.b3J_intDegree [requires the stated supplier interface]: RatFunc.intDegree(b3J)=3; the actual geometric j-morphism degree is 4, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.b3J_test_one [requires the stated supplier interface]: b3J evaluated at x=1 is 1792.
TauCeti.ImaginaryQuadraticModularity.b3J_test_zero_j [requires the stated supplier interface]: b3J evaluated at x=−3 is 0.
TauCeti.ImaginaryQuadraticModularity.b3J_test_cusp [requires the stated supplier interface]: The reduced denominator of b3J vanishes at 0; totalized field evaluation there is 0 but the geometric j-map has a pole, not a j=0 point.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/b5-j
TauCeti.ImaginaryQuadraticModularity.b5J: full contract; executable signatures above cover only the baseline algebraic part.
Define b5J∈RatFunc ℚ by the rational expression (x²+250x+3125)³/x⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b5) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 1, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.
Source: CN, Proposition 7.1.3(2), p.94
TauCeti.ImaginaryQuadraticModularity.b5J_fraction [requires the stated supplier interface]: b5J is exactly the displayed RatFunc.mk expression (x²+250x+3125)³/x⁵.
TauCeti.ImaginaryQuadraticModularity.b5J_eval [requires the stated supplier interface]: For a characteristic-zero field K, x∈K and the denominator x⁵ nonzero, evaluating b5J along ℚ→K at x gives (x²+250x+3125)³/x⁵.
TauCeti.ImaginaryQuadraticModularity.b5J_intDegree [requires the stated supplier interface]: RatFunc.intDegree(b5J)=1; the actual geometric j-morphism degree is 6, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.b5J_test_one [requires the stated supplier interface]: b5J evaluated at x=1 is 38477541376.
TauCeti.ImaginaryQuadraticModularity.b5J_test_minus_five [requires the stated supplier interface]: b5J evaluated at x=−5 is -2194880.
TauCeti.ImaginaryQuadraticModularity.b5J_test_cusp [requires the stated supplier interface]: The reduced denominator of b5J vanishes at 0, which is a cusp rather than a finite j-value.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j
TauCeti.ImaginaryQuadraticModularity.ns3J: full contract; executable signatures above cover only the baseline algebraic part.
Define ns3J∈RatFunc ℚ by the rational expression x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns3) only through the identification in small_curve_models. Its morphism degree is 3; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.
Source: CN, Proposition 7.1.3(3), p.94
TauCeti.ImaginaryQuadraticModularity.ns3J_fraction [requires the stated supplier interface]: ns3J is exactly the displayed RatFunc.mk expression x³.
TauCeti.ImaginaryQuadraticModularity.ns3J_eval [requires the stated supplier interface]: For a characteristic-zero field K, x∈K and the denominator 1 nonzero, evaluating ns3J along ℚ→K at x gives x³.
TauCeti.ImaginaryQuadraticModularity.ns3J_intDegree [requires the stated supplier interface]: RatFunc.intDegree(ns3J)=3; the actual geometric j-morphism degree is 3, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.ns3J_test_zero [requires the stated supplier interface]: ns3J evaluated at x=0 is 0.
TauCeti.ImaginaryQuadraticModularity.ns3J_test_two [requires the stated supplier interface]: ns3J evaluated at x=2 is 8.
TauCeti.ImaginaryQuadraticModularity.ns3J_test_polynomial [requires the stated supplier interface]: ns3J has reduced denominator 1 and intDegree=3; infinity is its unique pole.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/ns5-j
TauCeti.ImaginaryQuadraticModularity.ns5J: full contract; executable signatures above cover only the baseline algebraic part.
Define ns5J∈RatFunc ℚ by the rational expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns5) only through the identification in small_curve_models. Its morphism degree is 10; its RatFunc.intDegree (numerator degree minus denominator degree) is 0, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.
Source: CN, Proposition 7.1.3(4), p.94
TauCeti.ImaginaryQuadraticModularity.ns5J_fraction [requires the stated supplier interface]: ns5J is exactly the displayed RatFunc.mk expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
TauCeti.ImaginaryQuadraticModularity.ns5J_eval [requires the stated supplier interface]: For a characteristic-zero field K, x∈K and the denominator (x²+x−1)⁵ nonzero, evaluating ns5J along ℚ→K at x gives 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
TauCeti.ImaginaryQuadraticModularity.ns5J_intDegree [requires the stated supplier interface]: RatFunc.intDegree(ns5J)=0; the actual geometric j-morphism degree is 10, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.ns5J_test_zero [requires the stated supplier interface]: ns5J evaluated at x=0 is 0 and this is not a cusp.
TauCeti.ImaginaryQuadraticModularity.ns5J_test_minus_half [requires the stated supplier interface]: ns5J evaluated at x=−1/2 is 0.
TauCeti.ImaginaryQuadraticModularity.ns5J_test_infinity [requires the stated supplier interface]: ns5J has intDegree=0 and finite value 8000 at infinity; its poles are the two roots of x²+x−1, not infinity.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/s3-j
TauCeti.ImaginaryQuadraticModularity.s3J: full contract; executable signatures above cover only the baseline algebraic part.
Define s3J∈RatFunc ℚ by the rational expression 27(x+1)³(x−3)³/x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(s3) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.
Prerequisites: mathlib:RatFunc.mk, mathlib:RatFunc.eval, mathlib:RatFunc.intDegree
Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.
Source: CN, Proposition 7.1.3(6), p.94
TauCeti.ImaginaryQuadraticModularity.s3J_fraction [requires the stated supplier interface]: s3J is exactly the displayed RatFunc.mk expression 27(x+1)³(x−3)³/x³.
TauCeti.ImaginaryQuadraticModularity.s3J_eval [requires the stated supplier interface]: For a characteristic-zero field K, x∈K and the denominator x³ nonzero, evaluating s3J along ℚ→K at x gives 27(x+1)³(x−3)³/x³.
TauCeti.ImaginaryQuadraticModularity.s3J_intDegree [requires the stated supplier interface]: RatFunc.intDegree(s3J)=3; the actual geometric j-morphism degree is 6, proved with small_curve_models.
TauCeti.ImaginaryQuadraticModularity.s3J_test_one [requires the stated supplier interface]: s3J evaluated at x=1 is −1728.
TauCeti.ImaginaryQuadraticModularity.s3J_test_minus_one [requires the stated supplier interface]: s3J evaluated at x=−1 is 0.
TauCeti.ImaginaryQuadraticModularity.s3J_test_cusp [requires the stated supplier interface]: The reduced denominator of s3J vanishes at 0 and intDegree=3; 0 and infinity are poles.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient
TauCeti.ImaginaryQuadraticModularity.B: full contract; executable signatures above cover only the baseline algebraic part.
Let B/ℚ be the existing WeierstrassCurve with coefficients (0,0,−1,0,1), so its equation is y²−y=x³+1. Its discriminant is −675 and its j-invariant is 0. Its use as X(ns3,ns5), and its Mordell–Weil group, are comparison/arithmetic theorems rather than fields of this definition.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.baseChange, mathlib:WeierstrassCurve.Affine.Equation, mathlib:WeierstrassCurve.Affine.Point.mk
Construction or proof:
1. Specify the five coefficients in the baseline carrier.
2. Compute b-invariants, Δ and j; Δ≠0 gives the IsElliptic instance.
Source: CN, Proposition 7.1.3(5), p.94; ns3ns5-elliptic.m
TauCeti.ImaginaryQuadraticModularity.B_coefficients [requires the stated supplier interface]: B has a₁=a₂=a₄=0, a₃=−1 and a₆=1.
TauCeti.ImaginaryQuadraticModularity.B_discriminant [requires the stated supplier interface]: B.Δ=−675 and therefore B is elliptic over ℚ.
TauCeti.ImaginaryQuadraticModularity.B_baseChange [requires the stated supplier interface]: For a characteristic-zero field K with ℚ-algebra structure, B.baseChange K has the same coefficients and equation; identity and composite coefficient changes agree.
TauCeti.ImaginaryQuadraticModularity.B_test_j [requires the stated supplier interface]: The Mathlib j-invariant of B is 0.
TauCeti.ImaginaryQuadraticModularity.B_test_point [requires the stated supplier interface]: (x,y)=(1,2) satisfies the actual B Weierstrass equation: 2²−2=1³+1.
TauCeti.ImaginaryQuadraticModularity.B_test_sign [requires the stated supplier interface]: B.a₃=−1, not +1; (1,2) would fail the unshifted equation y²+y=x³+1.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models
TauCeti.ImaginaryQuadraticModularity.small_curve_models: full contract; executable signatures above cover only the baseline algebraic part.
There are ℚ-isomorphisms X(b3), X(b5), X(ns3), X(ns5), X(s3)≅ℙ¹ with j-functions b3J, b5J, ns3J, ns5J, s3J respectively. Under the b5 coordinate the Fricke involution w5 sends x to 125/x. The j-map degrees are respectively 4,6,3,10,6, with the pole multiplicities read from the displayed rational functions. These degrees include infinity and are not RatFunc.intDegree.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/b3-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/b5-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/ns5-j, EllipticCurveModularityImaginaryQuadratic:IQ.4/s3-j, ModularCurvesPartII:R13.4a
Gaps: EllipticCurveModularityImaginaryQuadratic/G7
Construction or proof:
1. Import the genus-zero models of the relevant Borel/Cartan quotient owner and compare the coordinate with CN’s cited tables (Sutherland–Zywina, McMurdy, Chen).
2. Normalize the j coordinate by matching the source rational function and cusp divisor.
3. For b5 derive the Fricke formula and verify that it is an involution; it is an isogeny correspondence on elliptic classes, not invariance of j.
Source: CN, Proposition 7.1.3(1)–(4),(6), p.94
Acceptance conditions:
The b5 coefficient is 250 in this coordinate, not the coefficient 10 of another standard X₀(5) coordinate.
The ns5 value at infinity is 8000, so infinity is noncuspidal.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model
TauCeti.ImaginaryQuadraticModularity.mixed_elliptic_model: full contract; executable signatures above cover only the baseline algebraic part.
X(ns3,ns5) is ℚ-isomorphic to B. On a dense affine model x³=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵, put A(t)=t²+t−1 and D(t)=(2t+1)(2t²+7t+8). The source map is [U:V:W]=[−(x/5)A(t)²:D(t):tD(t)], on the standard homogeneous Weierstrass equation V²W−VW²=U³+W³ of B. On V≠0,A(t)≠0 its inverse is t=W/V, x=−5(U/V)D(t)/A(t)². These are inverse rational maps and extend uniquely between the smooth proper normalizations. The raw singular affine fiber product is not itself B.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient
Gaps: EllipticCurveModularityImaginaryQuadratic/G8
Construction or proof:
1. Check the cubic identity after clearing denominators on the stated dense open.
2. Verify the displayed rational inverse on the dense open, then identify the homogeneous cubic directly with B’s projective Weierstrass equation.
3. Extend the birational equivalence uniquely over smooth proper curves; export all maps used by the quartic quotients.
Source: CN, Proposition 7.1.3(5) and proof, p.94; ns3ns5-elliptic.m
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil
TauCeti.ImaginaryQuadraticModularity.B_mordell_weil: full contract; executable signatures above cover only the baseline algebraic part.
B(ℚ) is infinite cyclic, with rank 1 and trivial torsion. A saturated generator D is part of the output; pullback arguments must not silently use an unsaturated nontorsion point as a generator. The source labels B as Cremona 225A1.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G8
Construction or proof:
1. Certify a nonzero rational point and a rank upper bound by descent.
2. Determine torsion by good reduction and division polynomials; certify generator saturation.
3. Export the actual generator and its basepoint-compatible divisor class for the quartic pullbacks.
Source: CN, Proposition 7.1.3(5), p.94; Proposition 7.4.4, p.100
Acceptance conditions:
Rank 1 alone is not a certificate that a point generates the full group.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/e15-model
TauCeti.ImaginaryQuadraticModularity.E15: full contract; executable signatures above cover only the baseline algebraic part.
Define E15/ℚ as WeierstrassCurve with coefficients (0,41,0,400,0), whose equation is y²=x(x+16)(x+25). Its discriminant is 207360000≠0. Identification with the modular curve and the rational group are separate theorems.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.baseChange, mathlib:WeierstrassCurve.Affine.Equation, mathlib:WeierstrassCurve.Affine.Point.mk
Construction or proof:
1. Use the existing Weierstrass carrier with exactly the displayed five coefficients.
2. Compute its discriminant; keep the identification with the modular curve separate.
Source: CN, Proof of Corollary 7.1.2, p.93
TauCeti.ImaginaryQuadraticModularity.E15_coefficients [requires the stated supplier interface]: The five coefficients are (0,41,0,400,0).
TauCeti.ImaginaryQuadraticModularity.E15_discriminant [requires the stated supplier interface]: Δ(E15)=207360000 and E15 is elliptic.
TauCeti.ImaginaryQuadraticModularity.E15_baseChange [requires the stated supplier interface]: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+16)(x+25), compatibly with identity and composition.
TauCeti.ImaginaryQuadraticModularity.E15_test_zero [requires the stated supplier interface]: (0,0) satisfies the E15 equation and gives a nonidentity point of order two.
TauCeti.ImaginaryQuadraticModularity.E15_test_roots [requires the stated supplier interface]: The three distinct roots of the cubic are 0,−16,−25.
TauCeti.ImaginaryQuadraticModularity.E15_test_delta [requires the stated supplier interface]: Its discriminant is 207360000, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/es35-model
TauCeti.ImaginaryQuadraticModularity.Es35: full contract; executable signatures above cover only the baseline algebraic part.
Define Es35/ℚ as WeierstrassCurve with coefficients (0,17,0,16,0), whose equation is y²=x(x+1)(x+16). Its discriminant is 921600≠0. Identification with the modular curve and the rational group are separate theorems.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.baseChange, mathlib:WeierstrassCurve.Affine.Equation, mathlib:WeierstrassCurve.Affine.Point.mk
Construction or proof:
1. Use the existing Weierstrass carrier with exactly the displayed five coefficients.
2. Compute its discriminant; keep the identification with the modular curve separate.
Source: CN, Proof of Corollary 7.1.2, p.93
TauCeti.ImaginaryQuadraticModularity.Es35_coefficients [requires the stated supplier interface]: The five coefficients are (0,17,0,16,0).
TauCeti.ImaginaryQuadraticModularity.Es35_discriminant [requires the stated supplier interface]: Δ(Es35)=921600 and Es35 is elliptic.
TauCeti.ImaginaryQuadraticModularity.Es35_baseChange [requires the stated supplier interface]: The coefficientwise base change to any characteristic-zero field has equation y²=x(x+1)(x+16), compatibly with identity and composition.
TauCeti.ImaginaryQuadraticModularity.Es35_test_zero [requires the stated supplier interface]: (0,0) satisfies the Es35 equation and gives a nonidentity point of order two.
TauCeti.ImaginaryQuadraticModularity.Es35_test_roots [requires the stated supplier interface]: The three distinct roots of the cubic are 0,−1,−16.
TauCeti.ImaginaryQuadraticModularity.Es35_test_delta [requires the stated supplier interface]: Its discriminant is 921600, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification
TauCeti.ImaginaryQuadraticModularity.level_fifteen_models: full contract; executable signatures above cover only the baseline algebraic part.
There are ℚ-isomorphisms X(b3,b5)=X₀(15)≅E15 and X(s3,b5)≅Es35, with Cremona labels 15A1 and 15A3 respectively. Both have ℚ-points ℤ/2⊕ℤ/4 and rank zero, and they are ℚ-isogenous. In particular X₀(15)(F) is finite iff X(s3,b5)(F) is finite for any number field F. The maps must carry j and the cusp divisors, not just identify the abstract elliptic curves.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.5/e15-model, EllipticCurveModularityImaginaryQuadratic:IQ.5/es35-model, tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii, EffectiveDiophantineMethods:ED.3
Gaps: EllipticCurveModularityImaginaryQuadratic/G9
Construction or proof:
1. Import the original modular-curve Weierstrass models and their j-maps, then verify the transformations to the CN Legendre coordinates.
2. Certify rational torsion and rank zero, and the isogeny between them.
3. Use the isogeny to preserve rank over F and finite generation to equate rank zero with finiteness.
Source: CN, Corollary 7.1.2 proof, p.93; FLHS arXiv v4 Lemmas 15.3–15.4, p.29 (published locators cited by CN are Lemmas 5.6–5.7)
Acceptance conditions:
The j-map and cusp divisor are transported along the coordinate changes; the Legendre equation alone does not supply them.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth
TauCeti.ImaginaryQuadraticModularity.quadratic_level_fifteen_torsion: full contract; executable signatures above cover only the baseline algebraic part.
Among quadratic number fields F, E15(F)tors strictly contains E15(ℚ) precisely for F=ℚ(i) or ℚ(√5); Es35(F)tors strictly contains Es35(ℚ) precisely for F=ℚ(√5). For the imaginary exception E15(ℚ(i)) has eight new torsion points beyond its eight rational points. Thus, under the rank-zero input for an imaginary F, Es35(F)=Es35(ℚ) and E15(F)=E15(ℚ) unless F=ℚ(i). No assertion of rank zero over an arbitrary F is part of this theorem.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G9
Construction or proof:
1. Use the exact quadratic torsion-growth theorem or certify the needed special cases directly by division polynomials and halving the rational two-torsion points.
2. List the eight new Gaussian torsion points and their j-values through the actual modular j-map.
3. Use finite generation only after the separately given rank-zero assumption; correct the printed X₀(15) in the Es35 paragraph.
Source: CN, Corollary 7.1.2 proof, p.93, citing Kwon Theorem 1
Acceptance conditions:
ℚ(√5) is real and therefore is excluded by the final imaginary-field hypothesis.
The Es35 imaginary exception is empty, not ℚ(i).
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-exceptional-model
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional: full contract; executable signatures above cover only the baseline algebraic part.
For a characteristic-zero field K and i∈K with i²=−1, define gaussianExceptional(K,i) as WeierstrassCurve with coefficients (i,1,1,6+i,10−15i). Over ℚ(i) this is the LMFDB curve 4050.1-c3. Its discriminant is 58752+107136i and its j-invariant is (−47709+15363i)/256. These coefficient identities do not certify modularity.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.baseChange
Construction or proof:
1. Map the displayed long Weierstrass equation into the Mathlib carrier.
2. Compute Δ and c₄³/Δ using i²=−1 and characteristic zero; retain the chosen embedding of ℚ(i).
Source: LMF-GAUSS, LMFDB 4050.1-c3, curve data; CN Corollary 7.1.2 proof, p.93
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_coefficients [requires the stated supplier interface]: The five coefficients are (i,1,1,6+i,10−15i).
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_discriminant [requires the stated supplier interface]: If i²=−1 in characteristic zero, Δ=58752+107136i≠0.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_j [requires the stated supplier interface]: With the resulting IsElliptic instance, the Mathlib j-invariant equals (−47709+15363i)/256.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_a1 [requires the stated supplier interface]: Its a₁ coefficient is i, not zero; it is a long Weierstrass model.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_conjugate [requires the stated supplier interface]: Changing i to −i gives the coefficientwise conjugate curve, with conjugate discriminant and j.
TauCeti.ImaginaryQuadraticModularity.gaussianExceptional_test_j_nonrational [requires the stated supplier interface]: Over ℚ(i) the coefficient of i in j is 15363/256≠0; the curve is not covered by the rational-j argument.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity
TauCeti.ImaginaryQuadraticModularity.gaussian_exceptional_modular: full contract; executable signatures above cover only the baseline algebraic part.
The curve gaussianExceptional over ℚ(i) is modular. Every noncuspidal j-value at the eight new E15(ℚ(i))-torsion points is the j-value of an elliptic curve obtained from gaussianExceptional by an ℚ(i)-isogeny, coefficient-field conjugation or quadratic twisting, and consequently is modular. Provide the explicit orbit/matching table and a Faltings–Serre comparison certificate for the one exceptional curve.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-exceptional-model, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EffectiveDiophantineMethods:ED.6, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, ArithmeticGaloisRepresentations:R01.5, ComputationalNumberTheory:CN.5
Gaps: EllipticCurveModularityImaginaryQuadratic/G9
Construction or proof:
1. Produce the eight j-values from the certified torsion points and modular j-map.
2. Match them to the isogeny/conjugacy/twist orbit of the displayed curve.
3. Supply a finite Faltings–Serre representation-comparison certificate, including the automorphic eigenform and the exhaustive test-prime argument; transport modularity by modularity_transport.
Source: CN, Proof of Corollary 7.1.2, p.93, citing DGP10 and LMFDB 4050.1-c3
Acceptance conditions:
A database flag or conductor match is not a proof of modularity.
The mod-3 and mod-5 images are Borel in the database example, so quadratic_modularity cannot be invoked to bypass this certificate.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic: full contract; executable signatures above cover only the baseline algebraic part.
Define ns3b5Quartic=−3(X⁴+2X³−X²+10X+25)∈ℚ[X]. Its geometric model is the weighted projective equation Y²=−3(X⁴+2X³Z−X²Z²+10XZ³+25Z⁴) in ℙ(1,2,1); Y has weight 2, so ordinary projective homogenization is incorrect. The scalar −3 is a genuine quadratic twist fixed by the cusp field, not a removable normalization.
Prerequisites: mathlib:Polynomial.X, mathlib:Polynomial.eval
Construction or proof:
1. Specify the quartic polynomial over ℚ.
2. Use the weights (1,2,1) for its smooth projective double-cover model; the identification theorem supplies the modular interpretation.
Source: CN, Proposition 7.2.1(1) and proof, pp.94–95
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_formula [requires the stated supplier interface]: The polynomial is exactly −3(X⁴+2X³−X²+10X+25).
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_degree [requires the stated supplier interface]: Its degree is 4 and its leading coefficient is −3; the two points over infinity require a square root of −3.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_fricke [requires the stated supplier interface]: For x≠0, x⁴·ns3b5Quartic(5/x)=25·ns3b5Quartic(x), giving the coordinate part of the Fricke involution.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_zero [requires the stated supplier interface]: ns3b5Quartic(0)=−75.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_minus_two [requires the stated supplier interface]: ns3b5Quartic(−2)=−3.
TauCeti.ImaginaryQuadraticModularity.ns3b5Quartic_test_minus_five_half [requires the stated supplier interface]: ns3b5Quartic(−5/2)=−75/16, agreeing with y=5√−3/4.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification
TauCeti.ImaginaryQuadraticModularity.genus_one_model: full contract; executable signatures above cover only the baseline algebraic part.
The smooth weighted quartic C with Y²=ns3b5Quartic(X,Z) is ℚ-isomorphic to X(ns3°,b5) and has genus 1. Its map to X(ns3,b5)≅ℙ¹ has degree 2 and coordinate x; the latter j-function is (x⁶+250x³+3125)³/x¹⁵. The Fricke w5 sends x to 5/x. The double cover is ramified at the four simple roots of X⁴+2X³−X²+10X+25, and its cusp field is ℚ(√−3), fixing the scalar −3.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic, ModularCurvesPartII:R13.4a, ArithmeticGaloisRepresentations:R01.4, EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic
Construction or proof:
1. Factor the fiber of the j-map at 1728 exactly as in CN and distinguish its possible ramification divisors using the nonsplit Cartan image.
2. Identify the twist scalar from the cusp field or the j=1728 fiber on X(ns3°).
3. Check smoothness and the degree-two cover; extend w5 across the weighted charts.
Source: CN, Proposition 7.2.1(1)–(2) and proof, pp.94–95
Acceptance conditions:
The j-function is b5J(x³), not b5J(x); the denominator is x¹⁵.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-special-points
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints: full contract; executable signatures above cover only the baseline algebraic part.
For a characteristic-zero field K and s∈K with s²=−3, define the list of weighted homogeneous coordinates ∞+=(1:s:0), ∞−=(1:−s:0), 0+=(0:5s:1), P₁=(−2:−s:1), P₂=(−5/2:5s/4:1). The construction consists of literal triples together with their lifts to C(K) via genus_one_model. Over K=ℚ(√−3) they are the points used to describe rational Jacobian classes.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree
Construction or proof:
1. Construct the nonzero triples and check the weighted quartic equation using s²=−3.
2. Use the weighted model’s point dictionary to lift them, fixing the sign convention for ∞−.
Source: CN, Points displayed before Proposition 7.2.2, p.95
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_coordinates [requires the stated supplier interface]: The five triples have exactly the coordinates displayed in the definition, in that order.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_on_curve [requires the stated supplier interface]: All five triples satisfy the weighted quartic equation and define points on C under genus_one_model.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_conjugate [requires the stated supplier interface]: Changing s to −s exchanges ∞+ with ∞− and gives the coefficientwise conjugates of the three affine points; the construction commutes with field embeddings.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_infinity [requires the stated supplier interface]: The first two triples have Z=0 and opposite nonzero Y=±s; the weighted equation is Y²=−3X⁴, not the ordinary cubic equation.
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_zero [requires the stated supplier interface]: For 0+, (5s)²=−75=ns3b5Quartic(0).
TauCeti.ImaginaryQuadraticModularity.genusOneSpecialPoints_test_p2 [requires the stated supplier interface]: For P₂, (5s/4)²=−75/16=ns3b5Quartic(−5/2).
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian
TauCeti.ImaginaryQuadraticModularity.genus_one_jacobian: full contract; executable signatures above cover only the baseline algebraic part.
For C as above, JacC is ℚ-isomorphic to the elliptic curve y²=x³+3x²−720x−8100 (45A2), and JacC(ℚ)≅ℤ/2⊕ℤ/2. C(ℚ3)=∅, hence C(ℚ)=∅. Under the ℚ(√−3) identification P↦[P]−[∞−], its three nonzero rational classes are D₀,D₁,D₂ from genusOneSpecialPoints, each of order 2 and D₀+D₁=D₂. This identifies the Jacobian over ℚ without identifying the pointless genus-one curve C with it over ℚ.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-special-points, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G11
Construction or proof:
1. Use the binary-quartic invariant formula to construct the Jacobian model and its ℚ-isomorphism.
2. Certify rank zero by two-descent and torsion by reduction; verify the three classes and addition relation.
3. Prove the local obstruction on both weighted charts at 3, including infinity.
Source: CN, Proposition 7.2.1(3) and points discussion, p.95; ns3ob5.m
Acceptance conditions:
The Abel–Jacobi point ∞− is only defined over ℚ(√−3); JacC/ℚ still exists by the imported relative Picard construction.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes
TauCeti.ImaginaryQuadraticModularity.genus_one_rational_picard: full contract; executable signatures above cover only the baseline algebraic part.
Let Pic⁰(C) denote degree-zero ℚ-rational divisors modulo ℚ-rational linear equivalence, mapped injectively into JacC(ℚ). Its image is {0,D₀}≅ℤ/2, and D₁,D₂ are rational Jacobian points not represented by rational divisors. For Ei=Di+∞++∞−, corrected ℚ(√−3) Riemann–Roch bases are {1,fi} with f₀=(y+s x²+5s)/x, f₁=(y+s x²−5s)/(x+2), f₂=(y+s x²−5s)/(x+5/2). The source prints an extra factor y in these numerators; the following fiber equations and the Magma calculation require its removal. The associated rational descent conics for E₁,E₂ are u²+3v²+6v+15=0 and u²+3v²+6v+12=0, both empty over ℚ; E₀’s conic u²+3v²+6v−33=0 has the rational point (3,2).
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G11
Construction or proof:
1. Use the imported rational-divisor-to-Jacobian map and the Brauer–Severi descent of a complete linear system, not an equality Pic⁰(C)=JacC(ℚ).
2. Verify the corrected Riemann–Roch bases, poles and fiber equations (7.2.1)–(7.2.3) by substitution into the quartic.
3. Descent yields the stated conics. Complete the square: the last two have respectively u²+3(v+1)²+12 and u²+3(v+1)²+9, so have no rational point. E₀ has (3,2).
Source: CN, Proposition 7.2.2 and Remark 7.2.3, pp.95–96; Bruin–Flynn §2; ns3ob5.m
Acceptance conditions:
The rational Picard image has order 2 while JacC(ℚ) has order 4.
The quotient by the base divisor gives degree-zero classes; no rational base point of C is assumed.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points
TauCeti.ImaginaryQuadraticModularity.genus_one_quadratic_points: full contract; executable signatures above cover only the baseline algebraic part.
For any quadratic number field F, P∈C(F) other than the two points at infinity satisfies x(P)∈ℚ or x(P)x(σP)=5, where σ is the nontrivial automorphism of F/ℚ. The proof uses that P+σP is a rational effective divisor of degree 2 and its difference from ∞++∞− is either 0 or D₀ in the rational Picard image. In the nontrivial case the fiber equation (6−2sα)x²+(α²−33)x+(30−10sα)=0 has product of roots 5, with the degenerate leading-coefficient case handled separately.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change
Gaps: EllipticCurveModularityImaginaryQuadratic/G11
Construction or proof:
1. Classify the rational degree-two divisor using genus_one_rational_picard.
2. In the zero class use the hyperelliptic linear system, yielding rational x.
3. In the D₀ class use the corrected f₀ fiber and constant/leading ratio 5. Handle poles, degree loss, ramification and the excluded infinity points separately.
Source: CN, Proposition 7.2.4, p.96
Acceptance conditions:
P=(1+2i,3+6i) on C/ℚ(i) is the nonrational-x case with xσ(x)=5.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity
TauCeti.ImaginaryQuadraticModularity.genus_one_points_modular: full contract; executable signatures above cover only the baseline algebraic part.
For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(ns3°,b5) is modular. In the imaginary case rational x gives rational j through the degree-two quotient. For a nonrational affine x the classification gives x(P)x(σP)=5, so the images of P and σP in X(ns3,b5) are related by its specified Fricke w5. The quotient moduli dictionary gives a geometric degree-5 isogeny between E and its conjugate and hence a Q-curve; the Q-curve modularity supplier applies. This does not assert σP=w5P for a chosen lift on the genus-one double cover. Infinite-coordinate points use the quotient/cusp dictionary. For real quadratic F use the imported FLHS modularity theorem.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
Gaps: EllipticCurveModularityImaginaryQuadratic/G10
Construction or proof:
1. Separate cusps and the infinity charts using the j-map.
2. For rational j use a ℚ-curve with that j, base change and quadratic twisting (the CM cases j=0,1728 use Modular.of_cm).
3. For nonrational affine x, use the norm-five equation only on the quotient X(ns3,b5), where Fricke is x↦5/x. The modular interpretation gives the geometric 5-isogeny and Q-curve endpoint without selecting either sign of a Fricke lift to the quartic.
4. For real quadratic F invoke the imported FLHS theorem; G10 records the exact owner extension needed.
Source: CN, Corollary 7.2.5, p.97
Acceptance conditions:
On the quartic h(x)=−3(x⁴+2x³−x²+10x+25), both (x,y)↦(5/x,±5y/x²) induce the same quotient action. The norm-five equation alone does not choose a sign.
For P=(1+2i,3+6i), σP equals the plus lift and differs from the minus lift; this is a regression against an inference from x alone, not identification of the actual modular lift.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-sextic
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic: full contract; executable signatures above cover only the baseline algebraic part.
Define b3ns5Sextic=9X⁶−6X⁵−35X⁴+40X²+12X−8∈ℚ[X]. Let C₂gen denote its smooth projective hyperelliptic model y²=b3ns5Sextic(x), with Y of weight 3 and two rational points at infinity Y/X³=±3. Identification with X(b3,ns5) is separate; a singular raw fiber product is not this smooth model.
Prerequisites: mathlib:Polynomial.X, mathlib:Polynomial.eval
Construction or proof:
1. Use the literal sextic in the baseline polynomial ring.
2. Use the imported smooth hyperelliptic curve construction and its affine/infinity point dictionary; prove squarefreeness.
Source: CN, Proposition 7.3.1(1), p.97; b3ns5.m
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_formula [requires the stated supplier interface]: The polynomial equals the displayed degree-six expression, with zero coefficient of X³.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_degree [requires the stated supplier interface]: Its degree is 6 and leading coefficient is 9; the infinity points therefore have Y/X³=±3 over ℚ.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_squarefree [requires the stated supplier interface]: The sextic is squarefree over ℚ, so the smooth proper double cover has genus 2 and agrees with its imported hyperelliptic normalization.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_zero [requires the stated supplier interface]: b3ns5Sextic(0)=−8.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_roots [requires the stated supplier interface]: b3ns5Sextic(−1)=b3ns5Sextic(1/3)=b3ns5Sextic(2)=0, giving three distinct rational Weierstrass points.
TauCeti.ImaginaryQuadraticModularity.b3ns5Sextic_test_degree [requires the stated supplier interface]: Its degree is 6 with nonzero leading coefficient 9, not degree 5; its smooth completion has two points at infinity.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model
TauCeti.ImaginaryQuadraticModularity.genus_two_model: full contract; executable signatures above cover only the baseline algebraic part.
The smooth hyperelliptic curve y²=b3ns5Sextic(x) is ℚ-isomorphic to X(b3,ns5). Under this isomorphism the Fricke involution w3 is exactly (x,y)↦(x,−y), exchanging the two rational infinity points. The j-map is transported from the explicit normalized fiber product of b3J and ns5J; it is not the x-coordinate.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-sextic, ModularCurvesPartII:R13.4a
Gaps: EllipticCurveModularityImaginaryQuadratic/G12
Construction or proof:
1. Construct the mixed-level affine fiber product from the two j-functions and its normalization.
2. Export the birational maps used by IsHyperelliptic/SimplifiedModel and extend them over the smooth projective models.
3. Prove w3 has six fixed points by the level interpretation, or certify the order-two automorphism group and show w3 is nontrivial.
Source: CN, Proposition 7.3.1(1)–(2) and proof, p.97; b3ns5.m
Acceptance conditions:
The transported Fricke action is certified, not inferred from the existence of some order-two automorphism.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil
TauCeti.ImaginaryQuadraticModularity.genus_two_jacobian: full contract; executable signatures above cover only the baseline algebraic part.
For the curve in genus_two_model, Jac(C₂gen)(ℚ)≅ℤ/2⊕ℤ/10. A full table of twenty rational divisor classes in a fixed Mumford/base-divisor convention, with group operations and principal-function witnesses, is part of the arithmetic output. The group has rank zero and four rational two-torsion elements.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G12
Construction or proof:
1. Certify the two-Selmer upper bound matching rational two-torsion, so the rank is zero.
2. Produce independent order-2 and order-10 classes; use good reductions at 7 and 13 to bound torsion (the scripts give ℤ/2⊕ℤ/20 and ℤ/2⊕ℤ/90 respectively).
3. Use the certified hyperelliptic group law to enumerate exactly twenty classes and verify completeness.
Source: CN, Proposition 7.3.1(3) and proof, p.97; b3ns5.m
Acceptance conditions:
The sextic has three rational roots and one irreducible cubic factor; these account for exactly four rational two-torsion classes.
No rank conclusion is based solely on a point search.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy
TauCeti.ImaginaryQuadraticModularity.genus_two_divisor_dichotomy: full contract; executable signatures above cover only the baseline algebraic part.
Write D∞=∞++∞−, the canonical hyperelliptic degree-two divisor on C₂gen. For a quadratic point P with conjugate σP, if [P+σP]=[D∞], then x(P) lies in ℙ¹(ℚ): on the affine chart P=(x,±√b3ns5Sextic(x)) with x∈ℚ; infinity is treated as x=∞. If [P+σP−D∞]≠0, P+σP is the unique effective divisor in its degree-two class because its Riemann–Roch space has dimension 1. The conclusion includes the distinction between a rational divisor and a merely rational divisor class.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change
Construction or proof:
1. The canonical class is D∞ and L(D∞)=⟨1,x⟩, giving a rational fiber in its linear system.
2. For a noncanonical degree-two class use genus-two Riemann–Roch to obtain dimension 1 and uniqueness of the effective divisor.
Source: CN, Lemma 7.3.2 and proof, p.98
Acceptance conditions:
The zero class has a moving one-dimensional projective linear system and must not be enumerated as one unique effective divisor.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points
TauCeti.ImaginaryQuadraticModularity.genus_two_quadratic_points: full contract; executable signatures above cover only the baseline algebraic part.
If F is imaginary quadratic and P∈C₂gen(F) is affine, then x(P)∈ℚ or F=ℚ(√−11) and, up to conjugation, P=((−5+s)/6,±(17−s)/6) with s²=−11. Among the nineteen nonzero rational Jacobian classes, the complete effective-divisor table has nine rational-x classes, two infinity-supported classes, two classes supported on the stated imaginary quadratic pairs and six classes supported on real quadratic points. This enumeration is not a classification of real-quadratic points by the imaginary exceptional set.
Hypotheses: F imaginary quadratic.; P affine on C₂gen.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G12
Construction or proof:
1. Enumerate all nineteen nonzero classes using the certified finite Jacobian group.
2. Use uniqueness from genus_two_divisor_dichotomy and the Mumford polynomial to determine degree and discriminant of each support field.
3. Verify the two exceptional ideals (6X+5Z)²+11Z²=0 and Y=±(X−2Z)Z²; recover the stated coordinates and the complete class counts.
Source: CN, Proposition 7.3.3 and proof, p.98; b3ns5.m
Acceptance conditions:
Substitution with s²=−11 verifies both signs of the stated y-coordinate; replacing it by another rational expression fails the sextic equation.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-model
TauCeti.ImaginaryQuadraticModularity.elevenExceptional: full contract; executable signatures above cover only the baseline algebraic part.
For a characteristic-zero field K and a∈K satisfying a²−a+3=0, define elevenExceptional(K,a) with Weierstrass coefficients (a,0,1+a,−24−6a,56+13a). Its discriminant is 4512−736a≠0 and j=(11155375a+3126750)/32. Over ℚ(√−11), a=(1+√−11)/2. This is the script’s exceptional curve. The paper labels its conjugacy orbit 8100.2-a2, while the script comment uses 8100.3-a2; the exact conjugate-conductor label comparison is an explicit certificate gap, not an asserted source error.
Prerequisites: mathlib:WeierstrassCurve, mathlib:WeierstrassCurve.Δ, mathlib:WeierstrassCurve.IsElliptic, mathlib:WeierstrassCurve.j, mathlib:WeierstrassCurve.baseChange
Construction or proof:
1. Specify the source equation in the Weierstrass carrier, with the integral generator a satisfying its minimal polynomial.
2. Reduce the invariant formulas using a²=a−3 to compute Δ and j; prove Δ≠0 in characteristic zero.
Source: MAGMA-b3ns5, b3ns5.m, final exceptional-curve block; Corollary 7.3.4 proof, p.98
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_coefficients [requires the stated supplier interface]: The five coefficients are (a,0,1+a,−24−6a,56+13a).
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_discriminant [requires the stated supplier interface]: If a²−a+3=0 in characteristic zero, Δ=4512−736a≠0.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_j [requires the stated supplier interface]: The resulting Mathlib j-invariant is (11155375a+3126750)/32.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_a2 [requires the stated supplier interface]: Its a₂ coefficient is 0, not 1; a is the generator satisfying a²−a+3=0.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_conjugate [requires the stated supplier interface]: Replacing a by 1−a gives the coefficientwise conjugate curve and the conjugate j-value.
TauCeti.ImaginaryQuadraticModularity.elevenExceptional_test_j_nonrational [requires the stated supplier interface]: Over ℚ(√−11), the coefficient of a in j is 11155375/32≠0, so rational-j modularity does not apply.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison
TauCeti.ImaginaryQuadraticModularity.eleven_exceptional_modular: full contract; executable signatures above cover only the baseline algebraic part.
Over F=ℚ(√−11), elevenExceptional has full mod-5 image conjugate to the normalizer of a nonsplit Cartan. Thus its restriction to GF(ζ5) is absolutely irreducible, and quadratic_modularity proves it modular. The point of the affine singular fiber product with coordinates x=32a−96 and t=(−a−15)/9 has b3J(x)=ns5J(t)=j(elevenExceptional); after the certified normalization map it yields one of the two exceptional pairs in genus_two_quadratic_points. Both signs and field conjugates follow by w3 and modularity_transport.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-model, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G13
Construction or proof:
1. Certify the full nonsplit normalizer image using a finite residual-image certificate, not just containment.
2. Compute its determinant-one subgroup and prove absolute irreducibility of the cyclotomic restriction.
3. Verify both j identities and export the normalization map on the exceptional point; compare the paper’s and script’s conjugate labels.
Source: CN, Corollary 7.3.4 proof, p.98; b3ns5.m final block
Acceptance conditions:
Containment in the nonsplit normalizer alone does not imply cyclotomic absolute irreducibility.
No Faltings–Serre calculation is necessary here once the full-image certificate is available.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity
TauCeti.ImaginaryQuadraticModularity.genus_two_points_modular: full contract; executable signatures above cover only the baseline algebraic part.
For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(b3,ns5) is modular. For imaginary F first handle rational P, including both infinity points, by the rational j-map and rational modularity, base change and twisting. A nonrational affine P of exact degree two with rational x satisfies σP=w3P and gives a geometric degree-3 Q-curve. The ℚ(√−11) exceptions are covered by eleven_exceptional_modular. The real-quadratic branch uses the imported FLHS endpoint, not Proposition 7.3.3 outside its imaginary hypothesis.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model, EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison, EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
Gaps: EllipticCurveModularityImaginaryQuadratic/G10
Construction or proof:
1. If P is rational, including either infinity point, its noncuspidal j-value is rational; use the parent rational modularity theorem and twisting/base change, handling j=0,1728 through CM. If P is nonrational affine with rational x, exact degree two gives y(σP)=−y(P), so the certified Fricke dictionary gives the geometric 3-isogeny and Q-curve modularity.
2. Handle the imaginary exceptional orbit by eleven_exceptional_modular and isogeny/conjugacy/twist invariance.
3. For real F invoke the external FLHS modularity theorem through G10.
Source: CN, Corollary 7.3.4, p.98
Acceptance conditions:
At infinity t=1/x,v=y/x³ gives v=±3 at t=0. Each point is rational and Galois-fixed, while w3 exchanges them. The proof must use rational j there.
For nonrational affine P with x∈ℚ, σ sends y to −y; do not apply this assertion to an arbitrary rational P in C(F).
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1
TauCeti.ImaginaryQuadraticModularity.quartic1: full contract; executable signatures above cover only the baseline algebraic part.
Define quartic1=9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C1 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.
Prerequisites: mathlib:MvPolynomial.X, mathlib:MvPolynomial.eval₂
Construction or proof:
1. Use the literal homogeneous polynomial in the baseline multivariable polynomial ring.
2. Take the projective zero locus through the imported proper-curve construction; its smoothness and genus are certified by quartic_models.
Source: CN, Proposition 7.4.3(1), p.100; ns3ons5.m
TauCeti.ImaginaryQuadraticModularity.quartic1_formula [requires the stated supplier interface]: The polynomial is precisely 9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴.
TauCeti.ImaginaryQuadraticModularity.quartic1_homogeneous [requires the stated supplier interface]: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
TauCeti.ImaginaryQuadraticModularity.quartic1_affine [requires the stated supplier interface]: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.
TauCeti.ImaginaryQuadraticModularity.quartic1_test_1 [requires the stated supplier interface]: quartic1 evaluated at (0,0,1) is 11.
TauCeti.ImaginaryQuadraticModularity.quartic1_test_2 [requires the stated supplier interface]: quartic1 evaluated at (1,0,0) is 9.
TauCeti.ImaginaryQuadraticModularity.quartic1_test_3 [requires the stated supplier interface]: quartic1 evaluated at (0,1,0) is 1.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1-involution
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates: full contract; executable signatures above cover only the baseline algebraic part.
For a commutative ℚ-algebra K, define quartic1Coordinates: (Fin 3→K)→(Fin 3→K) by (X,−Y−Z,Z). Its square is 1 times the identity and quartic1(quartic1Coordinates(v))=quartic1(v). Thus it induces an order-two automorphism w1 of C1. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1, mathlib:MvPolynomial.eval₂
Construction or proof:
1. Check the coordinate substitution and square as polynomial identities.
2. Use the nonzero square scalar to descend to a projective automorphism preserving the quartic.
3. Match this involution to the modular degree-two quotient in quartic_models.
Source: CN, Proposition 7.4.3(1), p.100
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_coordinates [requires the stated supplier interface]: The three coordinates are (X,−Y−Z,Z).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_square [requires the stated supplier interface]: For every vector v, quartic1Coordinates(quartic1Coordinates(v))=1•v.
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_preserves [requires the stated supplier interface]: For every vector v in a commutative ℚ-algebra, quartic1(quartic1Coordinates(v))=1quartic1(v).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis0 [requires the stated supplier interface]: The image of the j=0 coordinate basis vector is (1,0,0).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis1 [requires the stated supplier interface]: The image of the j=1 coordinate basis vector is (0,−1,0).
TauCeti.ImaginaryQuadraticModularity.quartic1Coordinates_test_basis2 [requires the stated supplier interface]: The image of the j=2 coordinate basis vector is (0,−1,1).
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2
TauCeti.ImaginaryQuadraticModularity.quartic2: full contract; executable signatures above cover only the baseline algebraic part.
Define quartic2=−X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C2 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.
Prerequisites: mathlib:MvPolynomial.X, mathlib:MvPolynomial.eval₂
Construction or proof:
1. Use the literal homogeneous polynomial in the baseline multivariable polynomial ring.
2. Take the projective zero locus through the imported proper-curve construction; its smoothness and genus are certified by quartic_models.
Source: CN, Proposition 7.4.3(2), p.100; s3ns5.m
TauCeti.ImaginaryQuadraticModularity.quartic2_formula [requires the stated supplier interface]: The polynomial is precisely −X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴.
TauCeti.ImaginaryQuadraticModularity.quartic2_homogeneous [requires the stated supplier interface]: Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
TauCeti.ImaginaryQuadraticModularity.quartic2_affine [requires the stated supplier interface]: On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.
TauCeti.ImaginaryQuadraticModularity.quartic2_test_1 [requires the stated supplier interface]: quartic2 evaluated at (0,0,1) is 1.
TauCeti.ImaginaryQuadraticModularity.quartic2_test_2 [requires the stated supplier interface]: quartic2 evaluated at (0,1,1) is 0.
TauCeti.ImaginaryQuadraticModularity.quartic2_test_3 [requires the stated supplier interface]: quartic2 evaluated at (-3,7,1) is 0.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2-involution
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates: full contract; executable signatures above cover only the baseline algebraic part.
For a commutative ℚ-algebra K, define quartic2Coordinates: (Fin 3→K)→(Fin 3→K) by (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z). Its square is 25 times the identity and quartic2(quartic2Coordinates(v))=625quartic2(v). Thus it induces an order-two automorphism w2 of C2. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2, mathlib:MvPolynomial.eval₂
Construction or proof:
1. Check the coordinate substitution and square as polynomial identities.
2. Use the nonzero square scalar to descend to a projective automorphism preserving the quartic.
3. Match this involution to the modular degree-two quotient in quartic_models.
Source: CN, Proposition 7.4.3(2), p.100
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_coordinates [requires the stated supplier interface]: The three coordinates are (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_square [requires the stated supplier interface]: For every vector v, quartic2Coordinates(quartic2Coordinates(v))=25•v.
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_preserves [requires the stated supplier interface]: For every vector v in a commutative ℚ-algebra, quartic2(quartic2Coordinates(v))=625quartic2(v).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis0 [requires the stated supplier interface]: The image of the j=0 coordinate basis vector is (3,8,4).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis1 [requires the stated supplier interface]: The image of the j=1 coordinate basis vector is (1,1,−2).
TauCeti.ImaginaryQuadraticModularity.quartic2Coordinates_test_basis2 [requires the stated supplier interface]: The image of the j=2 coordinate basis vector is (2,−8,1).
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models
TauCeti.ImaginaryQuadraticModularity.quartic_models: full contract; executable signatures above cover only the baseline algebraic part.
C1=V(quartic1) and C2=V(quartic2) are smooth nonhyperelliptic projective curves of genus 3 over ℚ, ℚ-isomorphic respectively to X(ns3°,ns5) and X(s3,ns5). Their displayed involutions are the unique nonidentity ℚ-automorphisms, and their degree-two quotient morphisms πi:Ci→B agree with the modular maps through X(ns3,ns5) under mixed_elliptic_model. All j-maps, normalization maps, quotient maps and rational base divisors are exported together.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1-involution, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2-involution, ModularCurvesPartII:R13.4a, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification, EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic
Gaps: EllipticCurveModularityImaginaryQuadratic/G14
Construction or proof:
1. Normalize the singular mixed-level fiber products, using nonsplit_cartan_conic and the s3J/ns5J functions.
2. Certify canonical maps and inverse isomorphisms to the smooth plane quartics, including j compatibility.
3. Certify the order-two ℚ-automorphism group and that the displayed action is nontrivial. Construct the quotient map and its isomorphism to B on all charts.
Source: CN, Proposition 7.4.3(1)–(2) and proof, p.100; ns3ons5.m and s3ns5.m
Acceptance conditions:
The fractional affine formula for w2 has poles; its homogeneous coordinate map extends there.
An automorphism with a genus-one quotient alone does not establish compatibility with the modular quotient.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints: full contract; executable signatures above cover only the baseline algebraic part.
For a characteristic-zero field K and s∈K with s²=−55, define quarticImaginaryPoints(K,s) as the ordered pair of projective coordinate triples P1=((1+s)/28,(27−s)/56,1), P2=((3−s)/4,(3+3s)/4,1). Both lie on C2. Under the certified modular j-map both have j=−32768. The polynomial substitution is separate from the modular-map comparison; changing s to −s gives the conjugate pair.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models
Gaps: EllipticCurveModularityImaginaryQuadratic/G14
Construction or proof:
1. Define the two literal coordinate triples and check the quartic identity modulo s²+55.
2. Use the source places on the singular model and the certified canonical normalization map to compare j-values.
Source: CN, Proposition 7.4.3(3), p.100; s3ns5.m exceptional-place block
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_coordinates [requires the stated supplier interface]: The ordered coordinate triples are exactly the displayed P1,P2, both with Z=1.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_on_curve [requires the stated supplier interface]: If s²=−55 in characteristic zero, evaluating quartic2 at either triple is zero.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_j [requires the stated supplier interface]: Under quartic_models and its modular j-map, both points have j=−32768, the rational CM j-value of discriminant −11.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_first [requires the stated supplier interface]: Substituting P1 into quartic2 gives zero when s²=−55.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_second [requires the stated supplier interface]: Substituting P2 into quartic2 gives zero when s²=−55.
TauCeti.ImaginaryQuadraticModularity.quarticImaginaryPoints_test_field [requires the stated supplier interface]: Over ℚ(√−55), both points are nonrational, distinct and have nonzero Z; conjugation sends s to −s, not s.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks
TauCeti.ImaginaryQuadraticModularity.quartic_jacobian_ranks: full contract; executable signatures above cover only the baseline algebraic part.
For both i=1,2, rk Jac(Ci)(ℚ)=rk B(ℚ)=1. The source-specific Chen/de Smit–Edixhoven comparison gives Jac(C1) isogenous to the new part of Jac(X₀(225)/w25), with elliptic factors 225c,225a,225d of ranks 0,1,0. For C2 use the 5-new part of Jac(X₀(225)/⟨w9,w25⟩): the factors are 225a,75c,75a of ranks 1,0,0; w9 has characteristic polynomial T²−1 on each level-75 oldspace. These are isogeny/rank computations, not analytic-rank assertions.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil, ModularCurvesPartII:R14.2, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G14
Construction or proof:
1. Import the general Cartan Jacobian isogeny and Hecke/new-old decomposition, then specialize it to the two mixed-level curves.
2. Certify the dimensions, rational eigenform decomposition and associated elliptic isogeny classes in the source normalizations.
3. Certify algebraic ranks of the five rational elliptic factors by descent, and transport rank through the explicit isogenies.
Source: CN, Proposition 7.4.4(1) and proof, pp.100–101
Acceptance conditions:
The relevant space for C1 has dimension 3. The C2 level-75 contributions are retained.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses: full contract; executable signatures above cover only the baseline algebraic part.
In Jac(C2)(ℚ), define D10=[(0:1:1)]−[(-3:7:1)] and D2=5([(0:1:0)]+[(-1/2:-1/2:1)]+Pl2−2Pl1), where Pl1 is the degree-two place cut out in Z=1 by u²−5u+1=0,v+2u−1=0, and Pl2 by u²+u−1=0,v+3u−3=0. The degrees are 1+1+2−2·2=0. These rational divisor classes have exact orders 10 and 2 and D2∉⟨D10⟩. The places here are real quadratic and are distinct from quarticImaginaryPoints.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree, tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
Construction or proof:
1. Use genuine divisors and the degree-zero Picard/Jacobian comparison; check each support lies on C2 and each place has the claimed degree.
2. Provide principal-function witnesses for 10D10 and 2D2 and nonprincipality witnesses for 5D10,2D10,D2,D2−5D10.
Source: CN, Proposition 7.4.4(2) proof, p.101; s3ns5.m torsion block
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_divisors [requires the stated supplier interface]: The two classes are the images of the displayed rational degree-zero divisors, in the named place convention.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_orders [requires the stated supplier interface]: D10 has exact order 10 and D2 has exact order 2.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_independent [requires the stated supplier interface]: The homomorphism ℤ/10⊕ℤ/2→Jac(C2)(ℚ) sending the generators to D10,D2 is injective.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_ten [requires the stated supplier interface]: 10D10=0, 5D10≠0 and 2D10≠0.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_two [requires the stated supplier interface]: 2D2=0 and D2≠0.
TauCeti.ImaginaryQuadraticModularity.quarticTorsionClasses_test_independence [requires the stated supplier interface]: D2−5D10≠0, so the subgroup has order 20 rather than 10.
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion
TauCeti.ImaginaryQuadraticModularity.quartic_jacobian_torsion: full contract; executable signatures above cover only the baseline algebraic part.
Jac(C1)(ℚ)tors is isomorphic to a subgroup of ℤ/2⊕ℤ/2; no equality is asserted. Jac(C2)(ℚ)tors≅ℤ/2⊕ℤ/10, generated by quarticTorsionClasses. Good reductions at 7,11,13 give gcd of group orders 4 for C1 and 20 for C2; Jac(C1)(𝔽13)≅ℤ/2⊕ℤ/1710, which excludes order-4 cyclic rational torsion.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
Construction or proof:
1. Certify smooth good reductions and finite Jacobian group orders at the three primes.
2. Use prime-to-p torsion injectivity at multiple primes to get the full rational torsion bound.
3. Use the 2-primary comparison at the good prime 13 for C1 and the independent twenty-element subgroup for C2.
Source: CN, Proposition 7.4.4(2) and proof, p.101
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds
TauCeti.ImaginaryQuadraticModularity.quartic_pullback_indices: full contract; executable signatures above cover only the baseline algebraic part.
Choose a saturated generator D of B(ℚ)≅ℤ, viewed in Jac(B)(ℚ), and set Gi=⟨πi*D⟩⊂Jac(Ci)(ℚ). Then 2Jac(Ci)(ℚ)⊂⟨Gi,Jac(Ci)(ℚ)tors⟩ for i=1,2. Consequently 4Jac(C1)(ℚ)⊂2G1 and 10Jac(C2)(ℚ)⊂⟨5G2,Jac(C2)(ℚ)[2]⟩. The source prints G1 in the second inclusion; the correct group is G2.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion, EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil, ModularCurvesPartII:R14.2
Construction or proof:
1. Import only the general weak inclusion required from the rank-equal degree-two pullback/norm theorem. On the free quotient the involution acts as +1 and π^*π_*=1+w, so twice a class is a pullback modulo torsion.
2. Use the torsion exponents 2 and 10 to obtain the two displayed inclusions.
3. Keep each generator inside its own Jacobian; do not identify G1 and G2.
Source: CN, Proposition 7.4.4(3) and proof, pp.100–101; Box Proposition 3.1
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve
TauCeti.ImaginaryQuadraticModularity.first_quartic_quadratic_divisors: full contract; executable signatures above cover only the baseline algebraic part.
For C1 and its modular quotient π1:C1→B, Sym²(C1)(ℚ)=π1*B(ℚ). Apply the imported relative symmetric sieve with G=⟨2π1*D⟩, I=4, a rational degree-two base divisor pulled back from the origin of B, good prime 43, and L of eight pullback divisors. The reduced group red43(G) is cyclic of order 7, and iota43⁻¹(red43(G)) has exactly seven degree-two divisor classes. L covers all seven, each satisfying the relative Chabauty criterion; hence the bad set is empty.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds, EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty, EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
Construction or proof:
1. Export the quotient/base divisor and certified I·Jac(C1)(ℚ)⊂G from quartic_pullback_indices.
2. Give all eight rational pullback divisors, the seven finite-field possibilities and exact reduction group certificates.
3. For each class certify the trace-zero vanishing differential nonzero first coefficient condition of the imported relative criterion. Then the single-prime sieve has no bad coset.
Source: CN, Proposition 7.4.5(1), p.101; ns3ons5.m sieve block
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve
TauCeti.ImaginaryQuadraticModularity.second_quartic_quadratic_divisors: full contract; executable signatures above cover only the baseline algebraic part.
For C2 and π2:C2→B, Sym²(C2)(ℚ)=π2*B(ℚ)∪L16, with L16 sixteen rational effective degree-two divisors not pulled back. Eight are sums of rational points not interchanged by w2; eight are conjugate pairs of quadratic points. Precisely two quadratic pairs are imaginary, the pairs of quarticImaginaryPoints over ℚ(√−55); six are real. Use G=⟨5π2*D,D2,5D10⟩, I=10 and good primes 11,43. The intersection of the two lifted bad-coset sets is empty after the imported symmetric/relative local criteria. A search bound alone is not the completeness proof.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds, EffectiveDiophantineMethods:ED.4/symmetric-chabauty, EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty, EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G15
Construction or proof:
1. Export all sixteen degree-two divisors with support fields and distinguish rational sums from irreducible quadratic places.
2. Use the exact finite-index group and base divisor from the script; correct G1 to G2 in the source narrative.
3. Certify reduction maps, trace-zero annihilator differentials and local rank criteria, and enumerate the empty intersection in a finite quotient by the intersection of reduction kernels.
Source: CN, Proposition 7.4.5(2), p.101; s3ns5.m sieve block
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-modularity
TauCeti.ImaginaryQuadraticModularity.first_quartic_points_modular: full contract; executable signatures above cover only the baseline algebraic part.
For every quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(ns3°,ns5), E is modular. Its degree-two divisor is pulled back from B(ℚ) by first_quartic_quadratic_divisors, so its j-value is rational. A rational-j curve over a quadratic field is a quadratic twist of a ℚ-model unless j is 0 or 1728; those cases are geometrically CM. Apply rational modularity, base change and twist invariance, or the CM branch.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
Construction or proof:
1. Use the divisor classification and the fact that the j-map factors through π1.
2. Handle rational j with the existing ℚ modularity theorem and soluble base change/twisting; use geometric CM for the special j-values.
Source: CN, Corollary 7.4.6(1), p.102
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-modularity
TauCeti.ImaginaryQuadraticModularity.second_quartic_points_modular: full contract; executable signatures above cover only the baseline algebraic part.
For every imaginary quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(s3,ns5), E is modular. All relevant irreducible quadratic pairs are pullbacks from B(ℚ), except quarticImaginaryPoints and their conjugates, which have rational CM j=−32768. Rational degree-two sums contribute only rational points and also have rational j. No conclusion for arbitrary real-quadratic exceptional pairs is inferred from this classification.
Hypotheses: F imaginary quadratic.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points, EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models, EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, EllipticCurveModularity:R29.6/modularity-theorem
Construction or proof:
1. Use imaginary F to discard the six real quadratic exceptional pairs.
2. Apply rational-j modularity to pullbacks and rational points; apply the geometric CM definition at the two exceptional pairs.
Source: CN, Corollary 7.4.6(2), p.102
Acceptance conditions:
Verify every quantified hypothesis and the stated comparison against the cited passage.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/residual-image-modularity
TauCeti.ImaginaryQuadraticModularity.imaginary_quadratic_residual_modularity: full contract; executable signatures above cover only the baseline algebraic part.
Let F be an imaginary quadratic number field and E/F an elliptic curve. If GF acts irreducibly on E[5] over 𝔽5 (absolute irreducibility is not required), or GF acts irreducibly on E[3] over 𝔽3 and its image is not conjugate to the whole normalizer of a split Cartan, then E is modular. The mod-3 exclusion is equality up to conjugacy with the whole normalizer, not containment in some split normalizer.
Hypotheses: F imaginary quadratic.; Either of the two displayed residual-image conditions.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-modularity, ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field
Construction or proof:
1. If the p=3 or 5 cyclotomic restriction is absolutely irreducible, apply quadratic_modularity.
2. Otherwise import the precise Cartan classification: for p=3, the image is the whole split normalizer or a subgroup of the actual nonsplit Cartan; for p=5 and [F(ζ5):F]=4, it is contained in a nonsplit normalizer. Every imaginary quadratic field has this degree-4 p=5 extension.
3. If the other residual representation is reducible use its Borel level; otherwise use its applicable Cartan normalizer. The four remaining branches are X(ns3°,b5), X(b3,ns5), X(ns3°,ns5), X(s3,ns5), whose modularity the preceding layers prove.
Source: CN, Theorem 7.1, p.91; Lemma 7.1.1, pp.92–93; conclusion p.102
Acceptance conditions:
Ordinary irreducibility over 𝔽p is distinguished from absolute irreducibility after coefficient extension and from absolute irreducibility of GF(ζp).
The p=3 image excluded by equality may have irreducible proper subgroups; these are not excluded by this theorem.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-modularity
TauCeti.ImaginaryQuadraticModularity.finite_level_fifteen_modularity: full contract; executable signatures above cover only the baseline algebraic part.
For an imaginary quadratic number field F with finite X₀(15)(F), every elliptic curve E/F is modular. Finite here means the full set of F-rational points of the compactified curve; since it is an elliptic curve over ℚ with a rational origin, this is equivalent to Mordell–Weil rank zero over F. The statement imposes no restriction on the residual images of E. It is CN Theorem 1.1 and Corollary 7.1.2, not unconditional modularity over every imaginary quadratic field.
Hypotheses: F imaginary quadratic.; X₀(15)(F) finite.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.8/residual-image-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth, EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.1/modular, EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance, tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii
Construction or proof:
1. By imaginary_quadratic_residual_modularity only X(b3,b5)=X₀(15) and X(s3,b5) remain.
2. Use the rational isogeny between their elliptic models to transfer rank zero and finiteness. Every F-point is torsion.
3. Use quadratic_torsion_growth: imaginary torsion growth for X₀(15) occurs only at ℚ(i), while X(s3,b5) has no imaginary growth. Rational points give rational j; the eight new Gaussian points are handled by gaussian_exceptional_modular.
4. Handle geometric CM separately and transport each non-CM geometric coarse class by its quadratic twist.
Source: CN, Theorem 1.1, p.2; Corollary 7.1.2 and proof, p.93
Acceptance conditions:
Cusps are discarded when associating an elliptic curve but remain in the finite point set.
The Gaussian exception is tied to the full eight-point orbit certificate and Faltings–Serre comparison, not an unsupported database label.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples
TauCeti.ImaginaryQuadraticModularity.small_imaginary_quadratic_modularity: full contract; executable signatures above cover only the baseline algebraic part.
For F=ℚ(√−d) with d∈{1,2,3,5}, X₀(15)(F) is finite and hence every elliptic curve over F is modular. Each application includes a certified rank-zero calculation for the rational elliptic model E15 and its quadratic twist by −d: rk E15(F)=rk E15(ℚ)+rk E15^(−d)(ℚ)=0. The Gaussian field retains its extra torsion without acquiring positive rank.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-modularity, EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth, EffectiveDiophantineMethods:ED.3, EffectiveDiophantineMethods:ED.6
Gaps: EllipticCurveModularityImaginaryQuadratic/G16
Construction or proof:
1. Use the quadratic-extension rank decomposition for the elliptic curve E15.
2. Certify rank zero of each of the four twists with descent/Selmer upper bounds.
3. Apply finite_level_fifteen_modularity separately for each field.
Source: CN, §1 after Theorem 1.1, p.2
Acceptance conditions:
Rank computations use algebraic rank bounds; a finite search or numerical L-value is insufficient.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.8/nonfinite-level-fifteen-example
TauCeti.ImaginaryQuadraticModularity.sqrt_minus_ten_infinite_level_fifteen: full contract; executable signatures above cover only the baseline algebraic part.
Let F=ℚ(√−10) and s²=−10. The point (x,y)=(-1,6s) on E15:y²=x(x+16)(x+25) is nontorsion. It is not rational, and quadratic_torsion_growth shows that E15(F)tors=E15(ℚ) because F is neither ℚ(i) nor ℚ(√5). Hence X₀(15)(F) is infinite. This gives a concrete field to which finite_level_fifteen_modularity does not apply; it says nothing against modularity of particular curves over that field.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification, EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth
Construction or proof:
1. Verify (6s)²=−360=(-1)·15·24 and s∉ℚ.
2. Use the exact torsion-growth theorem to show this nonrational point cannot be torsion.
3. Use the E15/X₀(15) isomorphism to infer an infinite rational point group over F.
Source: CN, Corollary 7.1.2 torsion-growth proof, p.93; explicit substitution in its E15 equation
Acceptance conditions:
Changing y to 6 or dropping the factor √−10 fails the curve equation.
The finite-point hypothesis is not asserted for all imaginary quadratic fields.
-/

/-
EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic
TauCeti.ImaginaryQuadraticModularity.nonsplit_cartan_conic: full contract; executable signatures above cover only the baseline algebraic part.
X(ns3°) is the smooth projective conic Y²+3X²+36XZ+432Z²=0 over ℚ. Its degree-two map to X(ns3) sends [X:Y:Z] to [X:Z], with j=(X/Z)³ on Z≠0 and cusp fiber at Z=0 defined over ℚ(√−3). It has no ℚ-point: its equation is Y²+3(X+6Z)²+324Z²=0. This source-specific comparison distinguishes the actual Cartan from its rational normalizer curve.
Prerequisites: EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves, EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models, EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j, ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers
Gaps: EllipticCurveModularityImaginaryQuadratic/G7
Construction or proof:
1. Use the j=1728 branch divisor to write the double cover as y²=d(x²+12x+144).
2. At x=12 the CM j=1728 fiber has field ℚ(√−1), giving squareclass d=−3.
3. Homogenize and check smoothness and the infinity fiber; positivity of the completed-square expression excludes rational points.
Source: CN, Proof of Proposition 7.2.1, p.95; Proposition 7.4.3 proof, p.100; ns3ons5.m opening
Acceptance conditions:
The cover has geometric genus zero but no rational point. It cannot be replaced by ℙ¹ℚ.
-/

end TauCeti.ImaginaryQuadraticModularity
end
