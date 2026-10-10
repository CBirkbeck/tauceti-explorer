import Mathlib

/-! # KatoEulerSystems: representative target signatures

The roadmap is README.md. This file records definitions and theorem signatures
statable against the pinned APIs and is not exhaustive. Geometric existence,
arithmetic cohomology and comparison theorems require the suppliers specified
there. The algebraic constructions below make their inputs explicit: normalized
units, ordered bilinear symbols, literal duals, linear composites and basis
realizations. Their elementary instances fix signs, twists and denominators.
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

/-- The selected unit has the required divisor. -/
theorem cTheta_divisor (c : ℕ) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ)
    (wanted : D) (h : ∃! u, thetaCondition c divisor norm wanted u) :
    divisor (cTheta c divisor norm wanted h) = wanted := by sorry

/-- Prime-to-c norms fix the normalized unit. -/
theorem cTheta_norm (c : ℕ) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ)
    (wanted : D) (h : ∃! u, thetaCondition c divisor norm wanted u)
    (a : ℕ) (ha : Nat.Coprime a c) :
    norm a (cTheta c divisor norm wanted h) = cTheta c divisor norm wanted h := by sorry

/-- The normalization characterizes the unit uniquely. -/
theorem cTheta_unique (c : ℕ) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ)
    (wanted : D) (h : ∃! u, thetaCondition c divisor norm wanted u)
    (u : Rˣ) (hu : thetaCondition c divisor norm wanted u) :
    u = cTheta c divisor norm wanted h := by sorry

/-- The c=5 divisor has coefficient 25 at the zero section before subtracting E[5]. -/
example (zero torsion : D) (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ)
    (h : ∃! u, thetaCondition 5 divisor norm (25 • zero - torsion) u) :
    divisor (cTheta 5 divisor norm (25 • zero - torsion) h) =
      25 • zero - torsion := by sorry

/-- Multiplication by two is prime to five. -/
example (divisor : Rˣ → D) (norm : ℕ → Rˣ → Rˣ) (wanted : D)
    (h : ∃! u, thetaCondition 5 divisor norm wanted u) :
    norm 2 (cTheta 5 divisor norm wanted h) = cTheta 5 divisor norm wanted h := by sorry

/-- At a nonzero two-torsion point, the original and pulled-back divisor
coefficients are respectively zero and 24. -/
example : (0 : ℤ) ≠ 25 - 1 := by sorry
end Theta

section Siegel
variable {R S S' U : Type*} [CommRing R] [CommRing S] [CommRing S']
variable [AddCommGroup U] [Module ℚ U]

/-- Pull an already normalized unit along a torsion-section ring map. -/
def siegelUnit (pull : R →+* S) (theta : Rˣ) : Sˣ := Units.map pull theta

/-- Evaluation along the torsion section is the unit functor on its ring map. -/
theorem siegelUnit_pullback (pull : R →+* S) (theta : Rˣ) :
    siegelUnit pull theta = Units.map pull theta := by sorry

/-- Additive rational smoothing, with both original and multiplied torsion indices. -/
def rationalSmoothing (c : ℤ) (g gc : U) : U := (c : ℚ)^2 • g - gc

/-- The smoothing has the c-squared coefficient and a negative translated term. -/
theorem siegelUnit_smoothing (c : ℤ) (g gc : U) :
    rationalSmoothing c g gc = (c : ℚ)^2 • g - gc := by sorry

/-- Fixed-index smoothings for two auxiliary integers give the same rational unit. -/
theorem siegelUnit_auxiliary (c d : ℤ) (g : U) :
    ((d : ℚ)^2 - 1) • rationalSmoothing c g g =
      ((c : ℚ)^2 - 1) • rationalSmoothing d g g := by sorry

/-- Level pullback composes with torsion-section evaluation. -/
theorem siegelUnit_level (pull : R →+* S) (level : S →+* S') (theta : Rˣ) :
    Units.map level (siegelUnit pull theta) = siegelUnit (level.comp pull) theta := by sorry

/-- A nontrivial smoothing at five has coefficient 24. -/
example (g : U) : rationalSmoothing 5 g g = (24 : ℚ) • g := by sorry

/-- Auxiliary seven gives coefficient 48; cross-multiplication compares rational units. -/
example (g : U) : (48 : ℚ) • rationalSmoothing 5 g g =
    (24 : ℚ) • rationalSmoothing 7 g g := by sorry

/-- Integral smoothings are not independent of the auxiliary integer. -/
example : rationalSmoothing 5 (1 : ℚ) 1 ≠ rationalSmoothing 7 (1 : ℚ) 1 := by sorry

/-- Identity pullback preserves a possibly nonconstant unit. -/
example (theta : Rˣ) : siegelUnit (RingHom.id R) theta = theta := by sorry
end Siegel

/-- Row-vector torsion indices for a column convention on the universal basis. -/
def torsionIndexAction (sigma : Matrix (Fin 2) (Fin 2) ℚ) (v : Fin 2 → ℚ) : Fin 2 → ℚ :=
  Matrix.vecMul v sigma

/-- The upper shear sends (alpha,0) to (alpha,alpha), fixing the side of the action. -/
example : torsionIndexAction !![1, 1; 0, 1] ![(1/5 : ℚ), 0] = ![1/5, 1/5] := by sorry

/-- A lower shear has a different effect; transposing the convention changes the answer. -/
example : torsionIndexAction !![1, 0; 1, 1] ![(1/5 : ℚ), 0] = ![1/5, 0] := by sorry

/-- Identity basis action fixes a nonzero torsion-index representative. -/
example : torsionIndexAction (1 : Matrix (Fin 2) (Fin 2) ℚ)
    ![(1/5 : ℚ), (2/5 : ℚ)] = ![1/5, 2/5] := by sorry

/-- Determinant two is the nontrivial exponent in the action on level roots. -/
example : Matrix.det !![(2 : ℚ), 0; 0, 1] = 2 := by sorry

/-- The rational q-exponent is half the second Bernoulli polynomial. -/
def siegelLeadingExponent (x : ℚ) : ℚ := (x^2 - x + 1/6) / 2

/-- The zero first index has exponent 1/12, although the pair must be nonzero. -/
example : siegelLeadingExponent 0 = 1/12 := by sorry

/-- A half-index has exponent -1/24, distinguishing the missing-square error. -/
example : siegelLeadingExponent (1/2) = -1/24 := by sorry

/-- A two-fifths index detects the squared term in the Bernoulli polynomial. -/
example : siegelLeadingExponent (2/5) = -11/300 ∧
    siegelLeadingExponent (2/5) ≠ (-23/300 : ℚ) := by sorry

/-- Reflection of the first index leaves the Bernoulli exponent unchanged. -/
example (x : ℚ) : siegelLeadingExponent (1-x) = siegelLeadingExponent x := by sorry

/-- The rationalizing denominator is nonzero only under an auxiliary-size condition. -/
example (c : ℤ) (hc : 2 ≤ c) : (c : ℚ)^2 - 1 ≠ 0 := by sorry

/-! ## Layer 1: ordered symbols and Chern moments -/

section Symbols
variable {U K : Type*} [AddCommGroup U] [AddCommGroup K] [Module ℚ U] [Module ℚ K]

/-- Evaluate an ordered symbol on the two indexed units, written additively here. -/
def beilinsonElement (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K) (first second : U) : K :=
  symbol first second

/-- The first slot precedes the second slot. -/
theorem beilinsonElement_symbol (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K) (u v : U) :
    beilinsonElement symbol u v = symbol u v := by sorry

/-- Bilinearity expands two products of units into four ordered terms. -/
theorem beilinsonElement_bilinear (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K) (u u' v v' : U) :
    beilinsonElement symbol (u+u') (v+v') =
      symbol u v + symbol u v' + symbol u' v + symbol u' v' := by sorry

/-- Smoothing each slot gives all four terms with the two negative cross terms. -/
theorem beilinsonElement_smoothing (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K)
    (c d : ℤ) (u uc v vd : U) :
    beilinsonElement symbol (rationalSmoothing c u uc) (rationalSmoothing d v vd) =
      ((c : ℚ)^2 * (d : ℚ)^2) • symbol u v -
      (c : ℚ)^2 • symbol u vd - (d : ℚ)^2 • symbol uc v + symbol uc vd := by sorry

/-- Ordered degree-one products are witnessed by the determinant bilinear form. -/
example : Matrix.det !![(1 : ℚ), 0; 0, 1] = 1 ∧
    Matrix.det !![(0 : ℚ), 1; 1, 0] = -1 := by sorry

/-- The identity unit becomes zero in additive rationalized units. -/
example (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K) (v : U) :
    beilinsonElement symbol 0 v = 0 ∧ beilinsonElement symbol v 0 = 0 := by sorry

/-- Changing the first slot additively splits the symbol. -/
example (symbol : U →ₗ[ℚ] U →ₗ[ℚ] K) (u u' v : U) :
    beilinsonElement symbol (u+u') v =
      beilinsonElement symbol u v + beilinsonElement symbol u' v := by sorry
end Symbols

section Moment
variable {F A B C D E : Type*} [Field F]
variable [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] [AddCommGroup D] [AddCommGroup E]
variable [Module F A] [Module F B] [Module F C] [Module F D] [Module F E]

/-- Chern character, moment insertion, trace, then the Hochschild--Serre edge. -/
def chernMoment (chern : A →ₗ[F] B) (moment : B →ₗ[F] C)
    (trace : C →ₗ[F] D) (edge : D →ₗ[F] E) : A →ₗ[F] E :=
  edge.comp (trace.comp (moment.comp chern))

/-- The composite fixes the order of the four constituent operations. -/
theorem chernMoment_factorization (chern : A →ₗ[F] B) (moment : B →ₗ[F] C)
    (trace : C →ₗ[F] D) (edge : D →ₗ[F] E) :
    chernMoment chern moment trace edge = edge.comp (trace.comp (moment.comp chern)) := by sorry

/-- Tate twists from K2, roots and the symmetric power sum to k-r. -/
theorem chernMoment_twist (k r : ℤ) : 2-r+(k-2) = k-r := by sorry

/-- Equality of all values identifies the moment morphism. -/
theorem chernMoment_ext (f g : A →ₗ[F] E) (h : ∀ x, f x = g x) : f = g := by sorry

/-- The weight-two r=1 target has twist one. -/
example : (2 : ℤ)-1+(2-2) = 1 := by sorry

/-- Weight four r=1 has twist three, not minus one. -/
example : (2 : ℤ)-1+(4-2) = 3 := by sorry

/-- Both moment exponents are nonnegative in the critical range. -/
example (k j : ℤ) (hlo : 1 ≤ j) (hhi : j ≤ k-1) :
    0 ≤ j-1 ∧ 0 ≤ k-j-1 ∧ (j-1)+(k-j-1) = k-2 := by sorry

/-- Identity constituent maps give the identity composite on a nonzero vector. -/
example : chernMoment (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    LinearMap.id LinearMap.id LinearMap.id 1 = 1 := by sorry
end Moment

/-! ## Layer 2: integral towers and full-level conductor relations -/

section Zeta
variable {F K H : Type*} [Field F] [AddCommGroup K] [AddCommGroup H]
variable [Module F K] [Module F H]

/-- Apply the Chern-moment morphism to an already coherent symbol tower. -/
def padicZeta (Ch : (ℕ → K) →ₗ[F] H) (symbols : ℕ → K) : H := Ch symbols

/-- The zeta value is the moment of the symbol tower. -/
theorem padicZeta_def (Ch : (ℕ → K) →ₗ[F] H) (symbols : ℕ → K) :
    padicZeta Ch symbols = Ch symbols := by sorry

/-- A commuting transfer square carries a coherent tower to coherent cohomology. -/
theorem padicZeta_pDirection (ChHigh ChLow : (ℕ → K) →ₗ[F] H)
    (cor : H →ₗ[F] H) (transfer : (ℕ → K) →ₗ[F] (ℕ → K))
    (hcor : cor.comp ChHigh = ChLow.comp transfer) (high low : ℕ → K)
    (h : transfer high = low) :
    cor (padicZeta ChHigh high) = padicZeta ChLow low := by sorry

/-- Scalar change in the tower commutes with its moment. -/
theorem padicZeta_coefficients (Ch : (ℕ → K) →ₗ[F] H) (a : F) (symbols : ℕ → K) :
    padicZeta Ch (a • symbols) = a • padicZeta Ch symbols := by sorry

/-- A repeated-prime identity is transported through the constituent maps. -/
example (ChHigh ChLow : (ℕ → K) →ₗ[F] H)
    (cor : H →ₗ[F] H) (transfer : (ℕ → K) →ₗ[F] (ℕ → K))
    (hcor : cor.comp ChHigh = ChLow.comp transfer) (high low : ℕ → K)
    (h : transfer high = low) :
    cor (padicZeta ChHigh high) = padicZeta ChLow low := by sorry

/-- An identity moment applied to a nonzero tower remains nonzero. -/
example : padicZeta (LinearMap.id : (ℕ → ℚ) →ₗ[ℚ] (ℕ → ℚ))
    (fun _ => 1) 0 = 1 := by sorry
end Zeta

/-- The modular Euler factor after evaluation at ell-inverse times inverse Frobenius. -/
def katoEulerPolynomial (ell a epsilon : ℚ) (k r : ℤ) : Polynomial ℚ :=
  1 - Polynomial.C (a * ell^(-r)) * Polynomial.X +
    Polynomial.C (epsilon * ell^(k-1-2*r)) * Polynomial.X^2

/-- The evaluated coefficients contain the two distinct Tate powers. -/
theorem katoEulerPolynomial_def (ell a epsilon : ℚ) (k r : ℤ) :
    katoEulerPolynomial ell a epsilon k r =
      1 - Polynomial.C (a * ell^(-r)) * Polynomial.X +
        Polynomial.C (epsilon * ell^(k-1-2*r)) * Polynomial.X^2 := by sorry

/-- Weight two and r=1 give ell-inverse in both nonconstant coefficients. -/
example : katoEulerPolynomial 3 2 1 2 1 =
    1 - Polynomial.C (2/3 : ℚ) * Polynomial.X +
      Polynomial.C (1/3 : ℚ) * Polynomial.X^2 := by sorry

/-- The ramified two-term relation drops precisely the quadratic term. -/
example : katoEulerPolynomial 3 2 0 2 1 =
    1 - Polynomial.C (2/3 : ℚ) * Polynomial.X := by sorry

/-- Constant coefficient one excludes a zero Euler factor. -/
example (ell a epsilon : ℚ) (k r : ℤ) :
    (katoEulerPolynomial ell a epsilon k r).eval 0 = 1 := by sorry

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

/-- Evaluation first forms the dual moment, then its Chern image. -/
theorem fullLevelZeta_moment (moment : Module.Dual R V →ₗ[R] K)
    (Ch : K →ₗ[R] H) (v : Module.Dual R V) :
    fullLevelZeta moment Ch v = Ch (moment v) := by sorry

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

/-- Linear morphisms are determined by their values on every dual moment. -/
theorem fullLevelZeta_ext (f g : Module.Dual R V →ₗ[R] H)
    (h : ∀ v, f v = g v) : f = g := by sorry

/-- Zero dual moment gives zero cohomology. -/
example (moment : Module.Dual R V →ₗ[R] K) (Ch : K →ₗ[R] H) :
    fullLevelZeta moment Ch 0 = 0 := by sorry

/-- Additivity is required on the integral dual. -/
example (moment : Module.Dual R V →ₗ[R] K) (Ch : K →ₗ[R] H)
    (v w : Module.Dual R V) :
    fullLevelZeta moment Ch (v+w) = fullLevelZeta moment Ch v + fullLevelZeta moment Ch w := by sorry

/-- The new-prime operator with all actions identity and ell=3 is multiplication by three. -/
example : fullLevelEulerOperator (3 : ℚ) LinearMap.id LinearMap.id LinearMap.id (1 : ℚ) = 3 := by sorry

/-- The new-prime factor is tested on both constructed moments through
separate Chern and source norm squares, rather than on an unconnected scalar. -/
example (momentHigh momentLow : Module.Dual R V →ₗ[R] K)
    (ChHigh ChLow : K →ₗ[R] H) (transfer : K →ₗ[R] K) (cor : H →ₗ[R] H)
    (sourceEuler : K →ₗ[R] K) (ell : R) (Tprime Sprime u : H →ₗ[R] H)
    (chernTransfer : cor.comp ChHigh = ChLow.comp transfer)
    (momentTransfer : transfer.comp momentHigh = sourceEuler.comp momentLow)
    (chernEuler : ChLow.comp sourceEuler =
      (fullLevelEulerOperator ell Tprime Sprime u).comp ChLow)
    (v : Module.Dual R V) :
    cor (fullLevelZeta momentHigh ChHigh v) =
      fullLevelEulerOperator ell Tprime Sprime u (fullLevelZeta momentLow ChLow v) := by sorry

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

/-- Nonpositive degrees give the whole de Rham realization. -/
theorem modularFiltration_nonpositive (k : ℤ) (M : Submodule F D) (i : ℤ)
    (hi : i ≤ 0) : modularFiltration k M i = ⊤ := by sorry

/-- Every critical degree has the modular-form step. -/
theorem modularFiltration_critical (k : ℤ) (M : Submodule F D) (i : ℤ)
    (hlo : 1 ≤ i) (hhi : i < k) : modularFiltration k M i = M := by sorry

/-- The upper endpoint is zero for the stated weight range. -/
theorem modularFiltration_endpoint (k : ℤ) (M : Submodule F D) (i : ℤ)
    (hk : 2 ≤ k) (hi : k ≤ i) : modularFiltration k M i = ⊥ := by sorry

/-- Restrict the imported exponential to its proved modular-form range. -/
def modularDualExp (expStar : H →ₗ[F] D) (M : Submodule F D)
    (lands : ∀ x, expStar x ∈ M) : H →ₗ[F] M := expStar.codRestrict M lands

/-- Forgetting the range restriction recovers the imported exponential. -/
theorem modularDualExp_coe (expStar : H →ₗ[F] D) (M : Submodule F D)
    (lands : ∀ x, expStar x ∈ M) (x : H) :
    (modularDualExp expStar M lands x : D) = expStar x := by sorry

/-- Equal successive steps can be nonzero while their associated graded is zero. -/
example (M : Submodule F D) :
    modularFiltration 4 M 1 = M ∧ modularFiltration 4 M 2 = M ∧
    Subsingleton ((modularFiltration 4 M 1) ⧸
      ((modularFiltration 4 M 2).comap (modularFiltration 4 M 1).subtype)) := by sorry

/-- Degree four is the zero endpoint at weight four. -/
example (M : Submodule F D) : modularFiltration 4 M 4 = ⊥ := by sorry

/-- Weight two still has its modular-form step at degree one. -/
example (M : Submodule F D) : modularFiltration 2 M 1 = M := by sorry

/-- The range restriction does not change a possibly nonzero exponential value. -/
example (expStar : H →ₗ[F] D) (M : Submodule F D)
    (lands : ∀ x, expStar x ∈ M) (x : H) :
    (modularDualExp expStar M lands x : D) = expStar x := by sorry
end Filtration

/-- The critical period sign includes both weight parity and character parity. -/
def criticalSign (k r : ℤ) (characterParity : ℤ) : ℤ :=
  (-1)^(k-r-1).natAbs * characterParity

/-- At weight two and r=1 an even character chooses the plus period. -/
example : criticalSign 2 1 1 = 1 := by sorry

/-- The same critical value with an odd character chooses the minus period. -/
example : criticalSign 2 1 (-1) = -1 := by sorry

/-- At weight four and r=2 an even character chooses the minus period. -/
example : criticalSign 4 2 1 = -1 := by sorry

/-! ## Layer 4: image hypotheses and Iwasawa structure before the canonical map -/

/-- Upper unipotents act on column vectors; the parameter is not forced to be a unit. -/
def upperUnipotent {R : Type*} [CommRing R] (x : R) : (Fin 2 → R) →ₗ[R] (Fin 2 → R) where
  toFun v := ![v 0 + x*v 1, v 1]
  map_add' := by sorry
  map_smul' := by sorry

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

/-- A free rank-one module over a product ring has nonzero zero divisors.
Full Iwasawa torsion-freeness tests regular scalars, not all nonzero scalars. -/
example : ((1, 0) : ℚ × ℚ) ≠ 0 ∧ ((0, 1) : ℚ × ℚ) ≠ 0 ∧
    ((1, 0) : ℚ × ℚ) * ((0, 1) : ℚ × ℚ) = 0 := by sorry

/-! ## Layer 5: rational zeta morphisms and twist-one transport -/

section RationalMap
variable {I F Λ V H : Type*} [Field F] [CommRing Λ]
variable [AddCommGroup V] [AddCommGroup H] [Module F V] [Module F H] [Module Λ H]

/-- A linear realization of prescribed values on a basis. The geometric generator
relations and their rational membership must be established before choosing such a basis. -/
def katoZetaMap (basis : Module.Basis I F V) (values : I → H) : V →ₗ[F] H :=
  basis.constr F values

/-- Each basis generator receives its prescribed value. -/
theorem katoZetaMap_generator (basis : Module.Basis I F V) (values : I → H) (i : I) :
    katoZetaMap basis values (basis i) = values i := by sorry

/-- Basis values characterize the linear realization. -/
theorem katoZetaMap_unique (basis : Module.Basis I F V) (values : I → H)
    (other : V →ₗ[F] H) (h : ∀ i, other (basis i) = values i) :
    other = katoZetaMap basis values := by sorry

/-- A conjugation relation on basis generators extends to the whole source. -/
theorem katoZetaMap_conjugation (basis : Module.Basis I F V) (values : I → H)
    (involution : V →ₗ[F] V) (sigma : H →ₗ[F] H)
    (h : ∀ i, katoZetaMap basis values (involution (basis i)) = -sigma (values i))
    (v : V) : katoZetaMap basis values (involution v) =
      -sigma (katoZetaMap basis values v) := by sorry

/-- The zeta span is taken over the Iwasawa algebra, not merely over the coefficient field. -/
def katoZetaSubmodule (z : V →ₗ[F] H) : Submodule Λ H :=
  Submodule.span Λ (Set.range z)

/-- Every zeta value belongs to its Iwasawa span. -/
theorem katoZetaSubmodule_mem (z : V →ₗ[F] H) (v : V) :
    z v ∈ katoZetaSubmodule (Λ := Λ) z := by sorry

/-- The span construction specifies its generator set exactly. -/
theorem katoZetaSubmodule_eq_span (z : V →ₗ[F] H) :
    katoZetaSubmodule (Λ := Λ) z = Submodule.span Λ (Set.range z) := by sorry

/-- Zero Betti vector gives zero zeta value. -/
example (basis : Module.Basis I F V) (values : I → H) : katoZetaMap basis values 0 = 0 := by sorry

/-- Additivity holds in the Betti input. -/
example (basis : Module.Basis I F V) (values : I → H) (v w : V) :
    katoZetaMap basis values (v+w) = katoZetaMap basis values v + katoZetaMap basis values w := by sorry

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

/-- The span contains a nonzero value of the identity realization. -/
example : (1 : ℚ) ∈ katoZetaSubmodule (Λ := ℚ) (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry

section Twisted
variable {F A B C D : Type*} [Field F]
variable [AddCommGroup A] [AddCommGroup B] [AddCommGroup C] [AddCommGroup D]
variable [Module F A] [Module F B] [Module F C] [Module F D]

/-- Input Poincare twist, the dual-form zeta map, then the output Tate twist. -/
def twistedKatoZeta (sourceTwist : A →ₗ[F] B) (z : B →ₗ[F] C)
    (outputTwist : C →ₗ[F] D) : A →ₗ[F] D := outputTwist.comp (z.comp sourceTwist)

/-- Evaluation follows the three maps in their mathematical order. -/
theorem twistedKatoZeta_def (sourceTwist : A →ₗ[F] B) (z : B →ₗ[F] C)
    (outputTwist : C →ₗ[F] D) (x : A) :
    twistedKatoZeta sourceTwist z outputTwist x = outputTwist (z (sourceTwist x)) := by sorry

/-- Equality on inputs identifies the twist-one morphisms. -/
theorem twistedKatoZeta_ext (f g : A →ₗ[F] D) (h : ∀ x, f x = g x) : f = g := by sorry

/-- The two Tate degrees sum to one. -/
example (k : ℤ) : (1-k)+k = 1 := by sorry

/-- The transported morphism remains linear and sends zero to zero. -/
example (sourceTwist : A →ₗ[F] B) (z : B →ₗ[F] C) (outputTwist : C →ₗ[F] D) :
    twistedKatoZeta sourceTwist z outputTwist 0 = 0 := by sorry

/-- Two minus signs cancel in the actual three-map construction. -/
example {V H : Type*} [AddCommGroup V] [AddCommGroup H] [Module F V] [Module F H]
    (z : V →ₗ[F] H) (v : V) :
    twistedKatoZeta (-LinearMap.id) z (-LinearMap.id) v = z v := by sorry

/-- Three identity maps preserve one. -/
example : twistedKatoZeta (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id LinearMap.id 1 = 1 := by sorry
end Twisted

/-! ## Layer 6: scalar regulators and elliptic periods -/

section Scalar
variable {F H D Dist : Type*} [Field F]
variable [AddCommGroup H] [AddCommGroup D] [AddCommGroup Dist]
variable [Module F H] [Module F D] [Module F Dist]

/-- Project the vector regulator using the period-normalized eigenvector pairing. -/
def katoScalarRegulator (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist) :
    H →ₗ[F] Dist := projection.comp regulator

/-- The scalar value is the projection of the vector value. -/
theorem katoScalarRegulator_def (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist) (x : H) :
    katoScalarRegulator regulator projection x = projection (regulator x) := by sorry

/-- The scalar construction is linear in its cohomology input. -/
theorem katoScalarRegulator_linear (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist)
    (a : F) (x y : H) :
    katoScalarRegulator regulator projection (a • x+y) =
      a • katoScalarRegulator regulator projection x + katoScalarRegulator regulator projection y := by sorry

/-- Renormalizing a nonzero period and scaling the Betti vector changes the value by a-inverse b. -/
theorem katoScalarRegulator_scale (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist)
    (a b : F) (ha : a ≠ 0) (x : H) :
    katoScalarRegulator regulator (a⁻¹ • projection) (b • x) =
      (a⁻¹*b) • katoScalarRegulator regulator projection x := by sorry

/-- Projection is additive in the chosen eigenvector pairing. -/
theorem katoScalarRegulator_projection_add (regulator : H →ₗ[F] D)
    (p q : D →ₗ[F] Dist) (x : H) :
    katoScalarRegulator regulator (p+q) x =
      katoScalarRegulator regulator p x + katoScalarRegulator regulator q x := by sorry

/-- Zero cohomology gives zero distribution. -/
example (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist) :
    katoScalarRegulator regulator projection 0 = 0 := by sorry

/-- Additivity excludes an affine shift in the scalar normalization. -/
example (regulator : H →ₗ[F] D) (projection : D →ₗ[F] Dist) (x y : H) :
    katoScalarRegulator regulator projection (x+y) =
      katoScalarRegulator regulator projection x + katoScalarRegulator regulator projection y := by sorry

/-- Doubling the period and tripling the class multiplies the scalar by three halves. -/
example : katoScalarRegulator (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    ((2 : ℚ)⁻¹ • LinearMap.id) (3 • (1 : ℚ)) = 3/2 := by sorry

/-- Identity projection and regulator preserve a nonzero class. -/
example : katoScalarRegulator (LinearMap.id : ℚ →ₗ[ℚ] ℚ) LinearMap.id 1 = 1 := by sorry
end Scalar

/-- The ordinary trivial-character interpolation factor keeps both Euler operators. -/
def ordinaryEulerFactor (p alpha epsilon : ℚ) (k r : ℤ) : ℚ :=
  (1-p^(r-1)*alpha⁻¹) * (1-epsilon*p^(k-r-1)*alpha⁻¹)

/-- A split multiplicative unit root gives a zero factor, rather than an invertible correction. -/
example : ordinaryEulerFactor 3 1 0 2 1 = 0 := by sorry

/-- A nonsplit multiplicative unit root gives the first factor two. -/
example : ordinaryEulerFactor 3 (-1) 0 2 1 = 2 := by sorry

/-- Good ordinary weight-two coefficients retain both factors. -/
example : ordinaryEulerFactor 3 2 1 2 1 = 1/4 := by sorry

/-! ## Layer 7: divisibility and elliptic applications -/

section Lengths

/-- A length-one local correction repairs this particular inequality. -/
example : (2 : ℕ) ≤ 1+1 := by sorry

/-- With zero local correction the same global and zeta lengths violate the bound. -/
example : ¬ ((2 : ℕ) ≤ 1+0) := by sorry

/-- Zero modules satisfy the numerical bound without proving arithmetic nonvanishing. -/
example : (0 : ℕ) ≤ 0+0 := by sorry

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
integralZetaFiniteIndex, zetaCriticalInterpolation, twistedKatoZeta_conjugation,
twistedKatoZeta_norm; noncriticalAnalyticArithmeticComparison,
criticalBadReductionComparison, ellipticLocalLattice;
zetaSubmoduleNonvanishing, cohomologicalDivisibility, ordinarySelmerDivisibility,
ellipticCyclotomicFiniteGeneration, ellipticOrdinaryMultiplicativeDivisibility,
ellipticNoFiniteSubmodule, ellipticRankZeroPPartUpperBound.
-/

end
end TauCetiRoadmap.KatoEulerSystems
