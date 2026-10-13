import Mathlib

/-! # KatoEulerSystems: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Geometric existence,
arithmetic cohomology and comparison theorems require the suppliers specified
there. The light definitions specialize existing units, linear maps, matrices and
submodules. Their examples fix signs, twists and denominators. The arithmetic
endpoints whose geometric carriers are unavailable are stated in the README;
linear transport statements here require the constituent comparison squares.
-/

namespace TauCetiRoadmap.KatoEulerSystems

noncomputable section
open scoped BigOperators

/-! ## Layer 0: normalized theta and Siegel units -/

section Theta
variable {R D : Type*} [CommRing R] [AddCommGroup D]

/-- A unit has the prescribed divisor and is fixed by prime-to-c norms. -/
def thetaCondition (c : ℕ) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ)
    (wanted : D) (u : Rˣ) : Prop :=
  divisor u = wanted ∧ ∀ a : ℕ, Nat.Coprime a c → norm a u = u

/-- Select the normalized unit when its existence and uniqueness are supplied.
The elliptic-curve existence theorem is a separate geometric target. -/
def cTheta (c : ℕ) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ) (wanted : D)
    (h : ∃! u, thetaCondition c divisor norm wanted u) : Rˣ :=
  Classical.choose h.exists

/-- The c=5 divisor has coefficient 25 at the zero section before subtracting E[5]. -/
example (zero torsion : D) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ)
    (h : ∃! u, thetaCondition 5 divisor norm (25 • zero - torsion) u) :
    divisor (cTheta 5 divisor norm (25 • zero - torsion) h) =
      25 • zero - torsion := by sorry

/-- At a nonzero two-torsion point, the original and pulled-back divisor
coefficients are respectively zero and 24. -/
example : (0 : ℤ) ≠ 25 - 1 := by sorry

/-- Identity norms and the specified divisor admit the unit one. -/
example : thetaCondition 5 (fun u : ℚˣ => (u : ℚ)) (fun _ u => u) 1 1 := by sorry

/-- A wrong divisor is rejected even when every norm is identity. -/
example : ¬ thetaCondition 5 (fun u : ℚˣ => (u : ℚ))
    (fun _ u => u) 1 (-1) := by sorry

/-- The divisor alone is insufficient: a norm sending one to minus one fails. -/
example : ¬ thetaCondition 5 (fun u : ℚˣ => (u : ℚ))
    (fun _ _ => (-1 : ℚˣ)) 1 1 := by sorry

/-- Selection preserves a uniquely prescribed unit other than one. -/
example (h : ∃! u : ℚˣ, thetaCondition 5 (fun v => (v : ℚ))
    (fun _ v => v) (-1) u) :
    cTheta 5 (fun v : ℚˣ => (v : ℚ)) (fun _ v => v) (-1) h = -1 := by sorry

end Theta

section Siegel
variable {R S S' U : Type*} [CommRing R] [CommRing S] [CommRing S']
variable [AddCommGroup U] [Module ℚ U]

/-- Pull an already normalized unit along a torsion-section ring map. -/
def siegelUnit (pull : R →+* S) (theta : Rˣ) : Sˣ := Units.map pull theta

/-- Additive rational smoothing, with both original and multiplied torsion indices. -/
def rationalSmoothing (c : ℤ) (g gc : U) : U := (c : ℚ)^2 • g - gc

/-- A nontrivial smoothing at five has coefficient 24. -/
example (g : U) : rationalSmoothing 5 g g = (24 : ℚ) • g := by sorry

/-- Integral smoothings are not independent of the auxiliary integer. -/
example : rationalSmoothing 5 (1 : ℚ) 1 ≠ rationalSmoothing 7 (1 : ℚ) 1 := by sorry

/-- Identity pullback preserves a possibly nonconstant unit. -/
example (theta : Rˣ) : siegelUnit (RingHom.id R) theta = theta := by sorry

/-- Pullback respects inversion of the supplied unit. -/
example (pull : R →+* S) (theta : Rˣ) :
    siegelUnit pull theta⁻¹ = (siegelUnit pull theta)⁻¹ := by sorry

end Siegel

/-- Row-vector torsion indices for a column convention on the universal basis. -/
def torsionIndexAction (sigma : Matrix (Fin 2) (Fin 2) ℚ) (v : Fin 2 → ℚ) : Fin 2 → ℚ :=
  Matrix.vecMul v sigma

/-- The upper shear sends (alpha,0) to (alpha,alpha), fixing the side of the action. -/
example : torsionIndexAction !![1, 1; 0, 1] ![(1/5 : ℚ), 0] = ![1/5, 1/5] := by sorry

/-- A lower shear has a different effect; transposing the convention changes the answer. -/
example : torsionIndexAction !![1, 0; 1, 1] ![(1/5 : ℚ), 0] = ![1/5, 0] := by sorry

/-- Determinant two is the nontrivial exponent in the action on level roots. -/
example : Matrix.det !![(2 : ℚ), 0; 0, 1] = 2 := by sorry

/-- The rational q-exponent is half the second Bernoulli polynomial. -/
def siegelLeadingExponent (x : ℚ) : ℚ := (x^2 - x + 1/6) / 2

/-- The zero first index has exponent 1/12, although the pair must be nonzero. -/
example : siegelLeadingExponent 0 = 1/12 := by sorry

/-- A two-fifths index detects the squared term in the Bernoulli polynomial. -/
example : siegelLeadingExponent (2/5) = -11/300 ∧
    siegelLeadingExponent (2/5) ≠ (-23/300 : ℚ) := by sorry

/-- The rationalizing denominator is nonzero only under an auxiliary-size condition. -/
example (c : ℤ) (hc : 2 ≤ c) : (c : ℚ)^2 - 1 ≠ 0 := by sorry

/-! ## Layer 1: ordered symbols and Chern moments -/

section Symbols
variable {U K : Type*} [AddCommGroup U] [AddCommGroup K] [Module ℚ U] [Module ℚ K]

/-- Evaluate an ordered symbol on the two indexed units, written additively here. -/
def beilinsonElement (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K) (first second : U) : K :=
  symbol first second

/-- Smoothing each slot gives all four terms with the two negative cross terms. -/
theorem beilinsonElement_smoothing (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K)
    (c d : ℤ) (u uc v vd : U) :
    beilinsonElement symbol (rationalSmoothing c u uc) (rationalSmoothing d v vd) =
      ((c : ℚ)^2 * (d : ℚ)^2) • symbol u v -
      (c : ℚ)^2 • symbol u vd - (d : ℚ)^2 • symbol uc v + symbol uc vd := by sorry

/-- Ordered degree-one products are witnessed by the determinant bilinear form. -/
example : Matrix.det !![(1 : ℚ), 0; 0, 1] = 1 ∧
    Matrix.det !![(0 : ℚ), 1; 1, 0] = -1 := by sorry

/-- Scalar multiplication supplies a nonzero bilinear evaluation. -/
example : beilinsonElement (LinearMap.lsmul ℚ ℚ) 2 3 = 6 := by sorry

/-- A zero second entry gives zero under the same nonzero bilinear map. -/
example : beilinsonElement (LinearMap.lsmul ℚ ℚ) 2 0 = 0 := by sorry

end Symbols

section Moment
variable {F A B C D E : Type*} [Field F]
variable [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] [AddCommGroup D] [AddCommGroup E]
variable [Module F A] [Module F B] [Module F C] [Module F D] [Module F E]

/-- Chern character, moment insertion, trace, then the Hochschild--Serre edge. -/
def chernMoment (chern : A →ₗ[F] B) (moment : B →ₗ[F] C)
    (trace : C →ₗ[F] D) (edge : D →ₗ[F] E) : A →ₗ[F] E :=
  edge.comp (trace.comp (moment.comp chern))

/-- The weight-two r=1 target has twist one. -/
example : (2 : ℤ)-1+(2-2) = 1 := by sorry

/-- Weight four r=1 has twist three, not minus one. -/
example : (2 : ℤ)-1+(4-2) = 3 := by sorry

/-- A zero trace kills the constructed moment. -/
example : chernMoment (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    LinearMap.id (0 : ℚ →ₗ[ℚ] ℚ) LinearMap.id 1 = 0 := by sorry

/-- Four nontrivial constituent scalings contribute to the composite. -/
example : chernMoment ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))
    (3 • LinearMap.id) (5 • LinearMap.id) (7 • LinearMap.id) 1 = 210 := by sorry

end Moment

/-- Equality of combined level-prime sets does not preserve each index:
the change (2,3) to (6,9) requires the ramified new-prime norm relation. -/
example : (2 * 3 : ℕ).primeFactors = (6 * 9 : ℕ).primeFactors ∧
    (2 : ℕ).primeFactors ≠ (6 : ℕ).primeFactors ∧
    (3 : ℕ).primeFactors = (9 : ℕ).primeFactors := by sorry

/-! ## Layer 2: integral towers and full-level conductor relations -/

section Zeta
variable {F K H : Type*} [Field F] [AddCommGroup K] [AddCommGroup H]
variable [Module F K] [Module F H]

/-- Apply the Chern-moment morphism to an already coherent symbol tower. -/
def padicZeta (Ch : (ℕ → K) →ₗ[F] H) (symbols : ℕ → K) : H := Ch symbols

/-- A commuting transfer square carries a coherent tower to coherent cohomology. -/
theorem padicZeta_pDirection (ChHigh ChLow : (ℕ → K) →ₗ[F] H)
    (cor : H →ₗ[F] H) (transfer : (ℕ → K) →ₗ[F] (ℕ → K))
    (hcor : cor.comp ChHigh = ChLow.comp transfer) (high low : ℕ → K)
    (h : transfer high = low) :
    cor (padicZeta ChHigh high) = padicZeta ChLow low := by sorry

/-- A zero source tower has zero moment. -/
example : padicZeta (LinearMap.id : (ℕ → ℚ) →ₗ[ℚ] (ℕ → ℚ))
    (fun _ => 0) 0 = 0 := by sorry

/-- A nonidentity moment acts on the actual tower values. -/
example : padicZeta ((2 : ℚ) • (LinearMap.id : (ℕ → ℚ) →ₗ[ℚ] (ℕ → ℚ)))
    (fun _ => 3) 0 = 6 := by sorry

end Zeta

/-- The modular Euler factor after evaluation at ell-inverse times inverse Frobenius. -/
def katoEulerPolynomial (ell a epsilon : ℚ) (k r : ℤ) : Polynomial ℚ :=
  1 - Polynomial.C (a * ell^(-r)) * Polynomial.X +
    Polynomial.C (epsilon * ell^(k-1-2*r)) * Polynomial.X^2

/-- Weight two and r=1 give ell-inverse in both nonconstant coefficients. -/
example : katoEulerPolynomial 3 2 1 2 1 =
    1 - Polynomial.C (2/3 : ℚ) * Polynomial.X +
      Polynomial.C (1/3 : ℚ) * Polynomial.X^2 := by sorry

/-- The ramified two-term relation drops precisely the quadratic term. -/
example : katoEulerPolynomial 3 2 0 2 1 =
    1 - Polynomial.C (2/3 : ℚ) * Polynomial.X := by sorry

/-- A new-prime full-level operator before eigenform specialization. -/
def fullLevelEulerOperator {R H : Type*} [CommRing R] [AddCommGroup H] [Module R H]
    (ell : R) (Tprime Sprime u : H →ₗ[R] H) : H →ₗ[R] H :=
  LinearMap.id - Tprime.comp u + ell • (Sprime.comp (u.comp u))

/-- With identity actions and ell zero, the algebraic operator vanishes.
The geometric norm relation still requires ell to be a prime. -/
example : fullLevelEulerOperator (0 : ℚ) (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id LinearMap.id = 0 := by sorry

/-- Zero inverse-Frobenius action leaves the identity term of the algebraic operator. -/
example : fullLevelEulerOperator (3 : ℚ) (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id 0 = LinearMap.id := by sorry

section FullLevel
variable {R V K H : Type*} [CommRing R]
variable [AddCommGroup V] [AddCommGroup K] [AddCommGroup H]
variable [Module R V] [Module R K] [Module R H]

/-- A moment on the literal dual, followed by the cohomological Chern morphism. -/
def fullLevelZeta (moment : Module.Dual R V →ₗ[R] K) (Ch : K →ₗ[R] H) :
    Module.Dual R V →ₗ[R] H := Ch.comp moment

/-- A transfer square for the Chern maps and a source moment norm relation
transport the full-level Euler operator to the constructed cohomology classes. -/
theorem fullLevelZeta_transfer (momentHigh momentLow : Module.Dual R V →ₗ[R] K)
    (ChHigh ChLow : K →ₗ[R] H) (transfer : K →ₗ[R] K) (cor : H →ₗ[R] H)
    (sourceEuler : K →ₗ[R] K) (targetEuler : H →ₗ[R] H)
    (chernTransfer : cor.comp ChHigh = ChLow.comp transfer)
    (momentTransfer : transfer.comp momentHigh = sourceEuler.comp momentLow)
    (chernEuler : ChLow.comp sourceEuler = targetEuler.comp ChLow)
    (v : Module.Dual R V) :
    cor (fullLevelZeta momentHigh ChHigh v) =
      targetEuler (fullLevelZeta momentLow ChLow v) := by sorry

/-- Zero dual moment gives zero cohomology. -/
example (moment : Module.Dual R V →ₗ[R] K) (Ch : K →ₗ[R] H) :
    fullLevelZeta moment Ch 0 = 0 := by sorry

/-- The new-prime operator with all actions identity and ell=3 is multiplication by three. -/
example : fullLevelEulerOperator (3 : ℚ) LinearMap.id LinearMap.id LinearMap.id (1 : ℚ) = 3 := by sorry

/-- Evaluation at one and identity Chern map preserve a nonzero literal-dual moment. -/
example (ev : Module.Dual ℚ ℚ →ₗ[ℚ] ℚ) (hev : ∀ v, ev v = v 1) :
    fullLevelZeta ev LinearMap.id (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = 1 := by sorry
end FullLevel

/-- An integral symmetric pairing in degree two has a nonunit middle coefficient at p=2. -/
example : ¬ IsUnit (2 : ℤ) := by sorry

/-- The normalized degree-two pairing has determinant minus four,
so rational perfectness does not imply integral perfectness at two. -/
example : Matrix.det !![(0 : ℤ), 0, -2; 0, 1, 0; -2, 0, 0] = -4 := by sorry

/-! ## Layer 3: modular filtration and period reciprocity -/

section Filtration
variable {F D H : Type*} [Field F] [AddCommGroup D] [AddCommGroup H]
variable [Module F D] [Module F H]

/-- The modular filtration retains a whole modular-form step in every critical degree. -/
def modularFiltration (k : ℤ) (M : Submodule F D) (i : ℤ) : Submodule F D :=
  if i ≤ 0 then ⊤ else if i < k then M else ⊥

/-- Restrict the imported exponential to its proved modular-form range. -/
def modularDualExp (expStar : H →ₗ[F] D) (M : Submodule F D)
    (lands : ∀ x, expStar x ∈ M) : H →ₗ[F] M := expStar.codRestrict M lands

/-- Equal successive steps can be nonzero while their associated graded is zero. -/
example (M : Submodule F D) :
    modularFiltration 4 M 1 = M ∧ modularFiltration 4 M 2 = M ∧
    Subsingleton ((modularFiltration 4 M 1) ⧸
      ((modularFiltration 4 M 2).comap (modularFiltration 4 M 1).subtype)) := by sorry

/-- Degree four is the zero endpoint at weight four. -/
example (M : Submodule F D) : modularFiltration 4 M 4 = ⊥ := by sorry

/-- A zero exponential has zero value in the whole-space range. -/
example : (modularDualExp (0 : ℚ →ₗ[ℚ] ℚ) ⊤
    (fun _ => Submodule.mem_top) 1 : ℚ) = 0 := by sorry

/-- The range restriction retains a nonidentity exponential value. -/
example : (modularDualExp ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) ⊤
    (fun _ => Submodule.mem_top) 3 : ℚ) = 6 := by sorry

end Filtration

/-- Before the modular comparison, generalized reciprocity has sign
minus for Tate-module rank two and plus for rank one (height when Λ=ℤₚ).
At p=2,m=1,r=0 the
conductor and factorial factors give respectively minus one quarter and one half. -/
example : ((-1 : ℚ)^(2-1 : ℕ) * (2 : ℚ)^(-2 : ℤ) /
    (Nat.factorial 0 : ℚ) = -1/4) ∧
    ((-1 : ℚ)^(1-1 : ℕ) * (2 : ℚ)^(-1 : ℤ) /
    (Nat.factorial 0 : ℚ) = 1/2) := by sorry

/-- The critical period sign includes both weight parity and character parity. -/
def criticalSign (k r : ℤ) (characterParity : ℤ) : ℤ :=
  (-1)^(k-r-1).natAbs * characterParity

/-- At weight two and r=1 an even character chooses the plus period. -/
example : criticalSign 2 1 1 = 1 := by sorry

/-- At weight four and r=2 an even character chooses the minus period. -/
example : criticalSign 4 2 1 = -1 := by sorry

/-! ## Layer 4: image hypotheses and Iwasawa structure before the canonical map -/

/-- Upper unipotents act on column vectors; the parameter is not forced to be a unit. -/
def upperUnipotent {R : Type*} [CommRing R] (x : R) : (Fin 2 → R) →ₗ[R] (Fin 2 → R) :=
  Matrix.toLin' !![1, x; 0, 1]

/-- Over a field, a nonzero parameter makes the difference range the first coordinate line. -/
theorem nonCmRationalUnipotentRange {F : Type*} [Field F] (x : F) (hx : x ≠ 0) :
    LinearMap.range (upperUnipotent x - LinearMap.id) =
      Submodule.span F {(![1, 0] : Fin 2 → F)} := by sorry

/-- A unit parameter gives a free rank-one quotient over the integral coefficient ring. -/
theorem nonCmIntegralUnipotentQuotient {R : Type*} [CommRing R] (x : R)
    (hx : IsUnit x) :
    Nonempty (((Fin 2 → R) ⧸ LinearMap.range
      (upperUnipotent x - LinearMap.id)) ≃ₗ[R] R) := by sorry

/-- The upper unipotent with parameter two changes the second basis vector by twice the first. -/
example : upperUnipotent (2 : ℤ) ![0, 1] - ![0, 1] = ![2, 0] := by sorry

/-- A nonzero nonunit parameter does not integrally generate the first basis vector. -/
example : ¬ ∃ a : ℤ, 2*a = 1 := by sorry

/-- Parameter zero gives no rank-one difference range. -/
example : upperUnipotent (0 : ℚ) = LinearMap.id := by sorry

/-- Nonzero zero divisors in a free rank-one product-ring module reject
injectivity by every nonzero scalar, a stronger condition than Mathlib torsion-freeness. -/
example : ((1, 0) : ℚ × ℚ) ≠ 0 ∧ ((0, 1) : ℚ × ℚ) ≠ 0 ∧
    ((1, 0) : ℚ × ℚ) * ((0, 1) : ℚ × ℚ) = 0 := by sorry

/-- Mathlib torsion-freeness tests regular scalars, so the free rank-one
module over a product ring satisfies the predicate despite its zero divisors. -/
example : Module.IsTorsionFree (ℚ × ℚ) (ℚ × ℚ) := by sorry

/-! ## Layer 5: rational zeta morphisms and twist-one transport -/

section RationalMap
variable {I F Λ V H : Type*} [Field F] [CommRing Λ]
variable [AddCommGroup V] [AddCommGroup H] [Module F V] [Module F H] [Module Λ H]

/-- A linear realization of prescribed values on a basis. The geometric generator
relations and their rational membership must be established before choosing such a basis. -/
def katoZetaMap (basis : Module.Basis I F V) (values : I → H) : V →ₗ[F] H :=
  basis.constr F values

/-- The zeta span is taken over the Iwasawa algebra, not merely over the coefficient field. -/
def katoZetaSubmodule (z : V →ₗ[F] H) : Submodule Λ H :=
  Submodule.span Λ (Set.range z)

/-- A minus relation on a nonzero rational value differs from the plus relation. -/
example {I' V' H' : Type*} [AddCommGroup V'] [AddCommGroup H']
    [Module ℚ V'] [Module ℚ H'] (basis : Module.Basis I' ℚ V') (values : I' → H')
    (v : V') (hn : katoZetaMap basis values v ≠ 0) :
    katoZetaMap basis values (-v) ≠ katoZetaMap basis values v := by sorry

/-- Prescribing one as the value of a basis vector forces a nonzero morphism. -/
example (basis : Module.Basis Unit ℚ ℚ) :
    katoZetaMap basis (fun _ => (1 : ℚ)) (basis ()) = 1 := by sorry
end RationalMap

/-- A zero realization has zero Iwasawa span. -/
example : katoZetaSubmodule (Λ := ℚ) (0 : ℚ →ₗ[ℚ] ℚ) = ⊥ := by sorry

/-- The identity realization has the whole coefficient module as its span. -/
example : katoZetaSubmodule (Λ := ℚ) (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊤ := by sorry

section Twisted
variable {F A B C D : Type*} [Field F]
variable [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] [AddCommGroup D]
variable [Module F A] [Module F B] [Module F C] [Module F D]

/-- Input Poincare twist, the dual-form zeta map, then the output Tate twist. -/
def twistedKatoZeta (sourceTwist : A →ₗ[F] B) (z : B →ₗ[F] C)
    (outputTwist : C →ₗ[F] D) : A →ₗ[F] D := outputTwist.comp (z.comp sourceTwist)

/-- The two Tate degrees sum to one. -/
example (k : ℤ) : (1-k)+k = 1 := by sorry

/-- Two minus signs cancel in the actual three-map construction. -/
example {V H : Type*} [AddCommGroup V] [AddCommGroup H] [Module F V] [Module F H]
    (z : V →ₗ[F] H) (v : V) :
    twistedKatoZeta (-LinearMap.id) z (-LinearMap.id) v = z v := by sorry

/-- Three identity maps preserve one. -/
example : twistedKatoZeta (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id LinearMap.id 1 = 1 := by sorry
end Twisted

/-- Opposite bases of the dyadic Tate line differ modulo four, even though
reduction modulo two would hide the normalization error in localization. -/
example : (1 : ZMod 4) ≠ 3 := by sorry

/-- Semilinear twisting uses the inverse cyclotomic scalar, not the scalar. -/
example : (2 : ℚ)⁻¹ = 1/2 ∧ (2 : ℚ)⁻¹ ≠ 2 := by sorry

/-! ## Layer 6: scalar regulators and elliptic periods -/

section Scalar
variable {F H D Dist : Type*} [Field F]
variable [AddCommGroup H] [AddCommGroup D] [AddCommGroup Dist]
variable [Module F H] [Module F D] [Module F Dist]

/-- Project the vector regulator using the period-normalized eigenvector pairing. -/
def katoScalarRegulator (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist) :
    H →ₗ[F] Dist := projection.comp regulator

/-- Renormalizing a nonzero period and scaling the Betti vector changes the value by a-inverse b. -/
theorem katoScalarRegulator_scale (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist)
    (a b : F) (ha : a ≠ 0) (x : H) :
    katoScalarRegulator regulator (a⁻¹ • projection) (b • x) =
      (a⁻¹*b) • katoScalarRegulator regulator projection x := by sorry

/-- Zero cohomology gives zero distribution. -/
example (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist) :
    katoScalarRegulator regulator projection 0 = 0 := by sorry

/-- Doubling the period and tripling the class multiplies the scalar by three halves. -/
example : katoScalarRegulator (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    ((2 : ℚ)⁻¹ • LinearMap.id) (3 • (1 : ℚ)) = 3/2 := by sorry

end Scalar

/-- The ordinary trivial-character interpolation factor keeps both Euler operators. -/
def ordinaryEulerFactor (p alpha epsilon : ℚ) (k r : ℤ) : ℚ :=
  (1-p^(r-1)*alpha⁻¹) * (1-epsilon*p^(k-r-1)*alpha⁻¹)

/-- A split multiplicative unit root gives a zero factor, rather than an invertible correction. -/
example : ordinaryEulerFactor 3 1 0 2 1 = 0 := by sorry

/-- Good ordinary weight-two coefficients retain both factors. -/
example : ordinaryEulerFactor 3 2 1 2 1 = 1/4 := by sorry

/-! ## Layer 7: divisibility and elliptic applications -/

section Lengths

/-- With zero local correction the same global and zeta lengths violate the bound. -/
example : ¬ ((2 : ℕ) ≤ 1+0) := by sorry

/-- The localized exact sequence adds the local H2 correction to the strict length. -/
theorem lengthBoundWithLocalTerm (global strict localIndex zetaIndex : ℕ)
    (bound : strict ≤ zetaIndex) (exactSequence : global = strict+localIndex) :
    global ≤ zetaIndex+localIndex := by sorry

/-- A nonzero exceptional local term cannot be discarded from the bound. -/
example : ¬ ((3 : ℕ) ≤ 2) ∧ 3 ≤ 2+1 := by sorry

/-- Equal ordinary control factors cancel only after adding them on both sides. -/
theorem cancelOrdinaryControlLength (shaIndex eulerIndex LIndex : ℕ)
    (controlBound : shaIndex+eulerIndex ≤ LIndex+eulerIndex) : shaIndex ≤ LIndex := by sorry

/-- The inequality direction is an upper bound; it does not force equality. -/
example : (1 : ℕ) ≤ 2 ∧ (1 : ℕ) ≠ 2 := by sorry
end Lengths

section Span
variable {Λ H : Type*} [CommRing Λ] [AddCommGroup H] [Module Λ H]

/-- A nonzero class gives a nonzero span, without asserting that the arithmetic class is nonzero. -/
theorem nonzeroZetaSpan (z : H) (hz : z ≠ 0) : Submodule.span Λ {z} ≠ ⊥ := by sorry

/-- The zero class is a necessary negative control for height-zero detection. -/
example : Submodule.span Λ ({0} : Set H) = ⊥ := by sorry
end Span

/-
The following geometric and arithmetic targets require the README supplier APIs:
cTheta_existsOnEllipticCurve, cTheta_isogeny, cTheta_auxiliary, cTheta_baseChange;
siegelGaloisDistribution, siegelDegeneracyProduct, siegelAnalyticProduct,
siegelCuspOrder, siegelIntegralDescent; schemeBeilinsonElement,
beilinsonElement_pullback, k2NormProjection, k2AuxiliaryEulerFactor,
chernSymbolNormalization, chernMoment_coefficients, chernHeckeDiamond;
cyclotomicLimitIntegral, cyclotomicDualLimitVanishes, padicZeta_norm,
katoEulerAdapter, katoEulerAdapter_component, katoEulerAdapter_norm,
katoEulerAdapter_ext, fullLevelZeta_hecke, fullLevelZeta_corestriction,
heckeDualTwistDictionary; archimedeanEisensteinZeta, periodMap,
archimedeanCriticalValues, beilinsonArchimedeanRegulator,
generalizedExplicitReciprocity, parabolicFullLevelCharacterisation;
nonCmLargeImage, nonCmIntegralRankOne, analyticTwistNonvanishing,
modularEulerSystemBound, rationalIwasawaStructure, geometricKatoZetaMap,
integralZetaFiniteIndex, zetaCriticalInterpolation, katoTwistLocalization,
katoTwistSpecialization, twistedKatoZeta_conjugation,
twistedKatoZeta_norm; noncriticalAnalyticArithmeticComparison,
criticalBadReductionComparison, ellipticLocalLattice;
zetaSubmoduleNonvanishing, cohomologicalDivisibility, ordinarySelmerDivisibility,
ellipticCyclotomicFiniteGeneration, ellipticOrdinaryMultiplicativeDivisibility,
ellipticNoFiniteSubmodule, ellipticRankZeroPPartUpperBound.
-/

end
end TauCetiRoadmap.KatoEulerSystems
