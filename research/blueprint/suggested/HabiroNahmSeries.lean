/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroNahmSeries.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-HabiroNahmSeries: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
No Lean toolchain at those commits was available in this session, so elaboration
has not been established and the file was not compiled.

The reviewed library audit AUDIT-14 records HB.5a as PARTLY BUILT and HB.3, HB.4,
HB.5, HB.8, HB.9 and HB.10 as NOT BUILT, and reading the pinned declaration index
confirms it: no finite q-Pochhammer symbols (an explicit TODO in Mathlib), no Nahm
sums, no Bloch group, no five-term relation, no K_3, no dilogarithm beyond Li_1 on
the unit disc, no cyclic quantum dilogarithm, no Euler-Maclaurin formula with
remainder, no Poisson summation, no multivariable formal logarithm, no plethystic
exponential, no Habiro ring or module, and no p-adic dilogarithm.

What the pinned libraries do have is imported and never redefined:

* Mathlib `eulerFunction` with its product and pentagonal expansions, and
  `Multipliable`/`tprod`: the infinite Pochhammer symbol at x = q.
* Mathlib `Polynomial.bernoulli` and `bernoulli`: the expansion of the logarithm of
  the Pochhammer symbol at a root of unity.
* Mathlib `StrictConvexOn`, `StrictConvexOn.eq_of_isMinOn`,
  `IsCompact.exists_isMinOn`, `Matrix.PosDef`, `Matrix.PosDef.det_pos`: the whole
  existence-and-uniqueness argument for the distinguished Nahm solution.
* Mathlib `integral_gaussian` and Tau Ceti `multivariateGaussianPDFReal`: the
  normalisation that formal Gaussian integration imitates.
* Mathlib `Subgroup.IsArithmetic`, `Subgroup.isArithmetic_iff_finiteIndex`,
  `IsCusp`, `isCusp_SL2Z_iff`, `OnePoint.exists_mem_SL2`, `CuspOrbits`,
  `Subgroup.strictWidthInfty`, `Function.Periodic.qParam`,
  `Function.Periodic.cuspFunction`, and Tau Ceti `cuspTranslationOrbitWidth`:
  almost all of HB.5a.
* Mathlib `Polynomial.cyclotomic`, `LaurentPolynomial`, `ArithmeticFunction.moebius`,
  `MvPowerSeries`, `PowerSeries.log`: the carriers of admissibility.

The Bloch group, the five-term relation, the CGZ convention, Suslin's sequence, the
classical polylogarithm, the Bloch-Wigner function and the weight-two regulator are
imported from K3BlochGroups and Polylogarithms by node identifier and are not
prototyped here; the cyclic quantum dilogarithm, the unit of a Bloch class, the
Habiro ring and its K_3-indexed modules are requested from HabiroNumberFields.
Where a statement quantifies over an object requested from another roadmap the
prototype uses `True` as a placeholder, in the style of the other suggested files
of this programme.
-/
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Analysis.Asymptotics.Defs
import Mathlib.Analysis.Complex.Periodic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.Meromorphic.Basic
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Combinatorics.Enumerative.Pentagonal.EulerFunction
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.MeasureTheory.Integral.IntervalIntegral.TrapezoidalRule
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.ModularForms.ArithmeticSubgroups
import Mathlib.NumberTheory.ModularForms.Cusps
import Mathlib.NumberTheory.ModularForms.SlashActions
import Mathlib.NumberTheory.ModularForms.SlashInvariantForms
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.Topology.Algebra.InfiniteSum.Defs
import Mathlib.Topology.Order.Compact
import TauCeti.NumberTheory.ModularForms.Norm.Cusps
import TauCeti.Probability.Distributions.Gaussian.Density

noncomputable section

namespace TauCeti.NahmSeries

universe u

/-! ## HB.3 Nahm equations and their Bloch classes -/

/-- nahm-data: Two separate bundled input records. An ANALYTIC Nahm datum is a
triple (A, B, C) with A a symmetric positive definite r x r matrix over the
rationals, B a rational column vector and C a rational number; a denominator
of the datum is a positive integer d with d Q(n) integral for all integer
vectors n, where Q(n) = (1/2) n^t A n + B n + C. A FORMAL Nahm datum is a
single symmetric matrix A with integer entries and no positivity assumption.
The analytic datum is the input of the convergent q-hypergeometric sum and
of the root-of-unity asymptotics; the formal datum is the input of the
multivariable admissible series of GSWZ. Neither record is a special case of
the other: positivity is never imposed on a formal identity, and integrality
is never imposed on a convergence theorem. -/
-- The analytic Nahm datum: A symmetric positive definite over the rationals, B a rational vector, C a rational number.
def NahmDatum : True := by sorry

-- The positive definiteness of A carried by an analytic datum.
theorem NahmDatum.posDef : True := by sorry

-- The formal Nahm datum: a symmetric integral matrix A.
def FormalNahmDatum : True := by sorry

-- The predicate that d is a denominator of the quadratic function of the datum.
def NahmDatum.IsDenominator : True := by sorry

-- The predicate that D is a strong denominator.
def NahmDatum.IsStrongDenominator : True := by sorry

-- Twice a denominator is a strong denominator.
theorem NahmDatum.isStrongDenominator_two_mul : True := by sorry

-- A positive definite formal datum gives an analytic datum with B = 0 and C = 0.
theorem FormalNahmDatum.toNahmDatum : True := by sorry

-- Two analytic data with the same A, B and C are equal.
theorem NahmDatum.ext : True := by sorry

example : True := by sorry -- unit test `rogers_ramanujan_is_analytic`: A = (2), B = 0, C = -1/60 satisfies the analytic predicate.
example : True := by sorry -- unit test `knot_matrix_not_posdef`: A = (1 1; 1 1) is symmetric and integral but not positive definite, so it is a formal and not an analytic datum.
example : True := by sorry -- unit test `half_integral_not_formal`: A = (3/2 1/2; 1/2 3/2) is an analytic datum whose entries are not integers.
example : True := by sorry -- unit test `strong_denominator_two`: For A = (2), B = 0, C = 0 the integer 1 is a denominator and 2 is a strong denominator.

/-- nahm-equations: For a symmetric matrix A = (a_ij) of size N, Nahm's
equations are the system 1 - X_i = product over j of X_j^{a_ij}, for i = 1,
..., N, in the unknowns X = (X_1, ..., X_N). The system is written
symbolically as 1 - X = X^A. Over the reals with X in (0,1)^N the powers are
the real powers of positive reals and the equations make sense for rational
A; over a field, and for integral A, they are a system of N polynomial
equations after clearing denominators, and define a zero-dimensional scheme
for generic A. The t-deformed system of GSWZ is a separate object and is
defined in HB.8. -/
-- The predicate that a point of the open cube satisfies Nahm's equations for A.
def NahmEq : True := by sorry

-- Every coordinate of a solution is strictly between zero and one, by definition of the carrier.
theorem NahmEq.pos : True := by sorry

-- The ideal cutting out Nahm's equations for an integral A over a commutative ring.
def NahmEqScheme : True := by sorry

-- For integral A a point of the open cube satisfies the real form exactly when it satisfies the scheme form.
theorem NahmEq.iff_scheme : True := by sorry

-- The predicate depends only on A and the point.
theorem NahmEq.congr : True := by sorry

-- A ring homomorphism carries a solution of the scheme form to a solution of the scheme form.
theorem NahmEq.map : True := by sorry

example : True := by sorry -- unit test `golden_ratio`: For A = (2) the point X = (sqrt 5 - 1)/2 satisfies the equations and lies in (0,1).
example : True := by sorry -- unit test `eight_five_five_four`: For A = (8 5; 5 4) the numerical point (0.88483..., 0.78939...) satisfies the equations to the stated precision.
example : True := by sorry -- unit test `boundary_rejected`: The point X = 1 does not satisfy the equations for any A, because 1 - X_i = 0 while the right-hand side is 1.
example : True := by sorry -- unit test `symmetry_not_needed`: The predicate is defined for an arbitrary square A, and symmetry is used only later; the equations for a non-symmetric A are still a legitimate system.

/-- distinguished-solution: Let A be a symmetric positive definite N x N matrix
with rational entries. Then Nahm's equations have exactly one solution X^A =
(X_1, ..., X_N) with 0 < X_i < 1 for every i. It is called the distinguished
solution and is the unique critical point on the open cube of the strictly
concave potential W(u) = -(1/2) u^t A u - sum_i Li_2(e^{u_i}) in the
coordinates u_i = log X_i. -/
theorem DistinguishedSolution : True := by sorry

/-- algebraicity-and-the-nahm-field: Let A be symmetric with rational entries
and let X be an isolated solution of Nahm's equations over the complex
numbers with all coordinates different from 0 and 1. Then every coordinate
of X is an algebraic number, and the field F = Q(X_1, ..., X_N) they
generate is a number field. The solution is called non-degenerate when the
Jacobian of the system at X is invertible, equivalently when the quantity
delta = product_j z_j^{-A_jj} det(diag(1 - z) A + diag(z)) is non-zero; the
distinguished solution of a positive definite A is always non-degenerate,
because that determinant is the determinant of the positive definite matrix
A + diag(z/(1-z)) times a non-zero monomial. -/
theorem AlgebraicityAndTheNahmField : True := by sorry

/-- bloch-class-of-a-solution: Let A be symmetric and let X be a solution of
Nahm's equations over a field F with all coordinates different from 0 and 1.
The element [X] = [X_1] + ... + [X_N] of the free abelian group on F lies in
the kernel of the boundary map d(x) = (x) wedge (1 - x), because d([X]) =
sum_i (X_i) wedge (1 - X_i) = sum_{i,j} a_ij (X_i) wedge (X_j) = 0 by the
symmetry of A. It therefore defines an element xi_A of the Bloch group of F.
When A is integral the computation is an identity in the antisymmetric
square as it stands; when A is only rational the identity holds after
tensoring with the rationals, and the integral class is obtained by clearing
denominators, that is by taking the class of the multiple by a common
denominator of A. -/
-- The element xi_A of the Bloch group of F attached to a solution X.
def nahmBlochClass : True := by sorry

-- The boundary of the underlying element of the free abelian group vanishes.
theorem nahmBlochClass_boundary : True := by sorry

-- The class is the sum over i of the classes of the coordinates.
theorem nahmBlochClass_eq_sum : True := by sorry

-- A field embedding carries the class of a solution to the class of its image.
theorem nahmBlochClass_map : True := by sorry

-- For rational A, the class of the denominator-cleared solution and its relation to the rational class.
theorem nahmBlochClass_clearDenominators : True := by sorry

-- Two solutions with the same coordinates give the same class.
theorem nahmBlochClass_congr : True := by sorry

example : True := by sorry -- unit test `boundary_vanishes`: For A = (2) and X the solution of 1 - X = X^2, the boundary of [X] vanishes in the antisymmetric quotient.
example : True := by sorry -- unit test `torsion_example`: For A = (8 5; 5 4) the class is annihilated by 60 in the Bloch group of the quartic field of discriminant -5^2 . 19.
example : True := by sorry -- unit test `nontorsion_example`: For the second Galois orbit of the same equations, over the quartic field defined by z_1^4 - z_1^3 + 3 z_1^2 - 3 z_1 + 1, the class is not torsion.
example : True := by sorry -- unit test `diagonal_two_torsion`: For a diagonal A with odd diagonal entry the diagonal contribution is a two-torsion element, which is zero in the exterior square and need not be zero in the antisymmetric quotient.

/-- general-nondegenerate-class: For a formal Nahm datum A and a non-degenerate
solution z of the (undeformed) equations 1 - z_j = (-1)^{A_jj} product_i
z_i^{A_ij}, set K = Q(z), R = O_K[1/Delta] with Delta divisible by 2, by 3
and by the discriminant of K, and let xi = sum_j [z_j] in B(K). Adjoin a
square root of the discriminant delta to form R[delta^{-1/2}], and record
the Galois involution sending the square root to its negative. This is the
data that indexes the Habiro module of HB.9; the sign (-1)^{A_jj} of the
GSWZ normalisation differs from the CGZ normalisation of the analytic Nahm
equations, and the two must not be conflated. -/
-- The ring R = O_K[1/Delta] attached to a non-degenerate solution.
def nahmRing : True := by sorry

-- The ring R[delta^{-1/2}] with a chosen square root of the discriminant inverted.
def nahmRing.deltaInv : True := by sorry

-- The involution of R[delta^{-1/2}] over R negating the square root.
def nahmRing.involution : True := by sorry

-- The involution is an involution.
theorem nahmRing.involution_sq : True := by sorry

-- The Bloch class xi attached to the solution.
def nahmRing.class : True := by sorry

-- The discriminant is a unit in R[delta^{-1/2}].
theorem nahmRing.delta_isUnit : True := by sorry

example : True := by sorry -- unit test `cubic_ring`: For A = (3) the ring is Z[z, 1/23] with z^3 - z + 1 = 0.
example : True := by sorry -- unit test `quartic_ring`: For A = (8 5; 5 4) the ring is O_F[1/(5 . 19)] for the quartic field F of discriminant -5^2 . 19.
example : True := by sorry -- unit test `involution_nontrivial`: The involution is not the identity when delta is not a square in R.
example : True := by sorry -- unit test `delta_unit`: The discriminant is invertible in R[delta^{-1/2}], and its square root squares to it.

/-- embeddings-and-regulator-evaluations: For the field F generated by a
solution, construct all complex embeddings and the evaluations D(sigma X) =
sum_i D(sigma X_i) of the Bloch-Wigner dilogarithm, and the real number
L(xi_A) = sum_i L(X_i) built from the Rogers dilogarithm in the CGZ
normalisation, where L(x) = pi^2/6 - Li_2(x) - (1/2) log(x) log(1 - x) for 0
< x < 1, extended to the projective line over the reals with values in the
reals modulo (pi^2/2) Z. The class xi_A is torsion exactly when D(sigma X)
vanishes for every embedding sigma, and in that case L(xi_A) is a rational
multiple of pi^2. -/
-- The Rogers dilogarithm in the CGZ normalisation, as a function on the projective line over the reals with values modulo (pi^2/2) Z.
def rogersDilog : True := by sorry

-- The Rogers dilogarithm kills the five-term relations, so it descends to the Bloch group of the reals.
theorem rogersDilog_five_term : True := by sorry

-- Its values at 0, 1 and infinity are pi^2/6, 0 and -pi^2/6.
theorem rogersDilog_zero_one_infty : True := by sorry

-- The tuple of Bloch-Wigner evaluations of the class at all complex embeddings.
def nahmRegulator : True := by sorry

-- The class is torsion exactly when every evaluation vanishes.
theorem nahmRegulator_eq_zero_iff_torsion : True := by sorry

-- If the class is torsion then L of the class is a rational multiple of pi squared.
theorem rogersDilog_rational_of_torsion : True := by sorry

example : True := by sorry -- unit test `rogers_at_golden`: For A = (2) the value of L at the distinguished solution is pi^2/10 modulo the lattice.
example : True := by sorry -- unit test `rogers_normalisation`: L(1) = 0 and L(0) = pi^2/6 in this normalisation, which differs from the standard one by pi^2/6.
example : True := by sorry -- unit test `regulator_vanishes_torsion`: For A = (8 5; 5 4) every Bloch-Wigner evaluation of the class vanishes.
example : True := by sorry -- unit test `regulator_nonzero_nontorsion`: For the second quartic orbit of the same matrix some evaluation is non-zero.

/-- torsion-in-the-algebraic-closure: The Bloch groups of the algebraic numbers
and of the complex numbers are uniquely divisible, hence torsion free.
Therefore the image of xi_A in the Bloch group of the algebraic numbers
vanishes exactly when xi_A is torsion in the Bloch group of the field F it
is defined over. The two formulations of Nahm's conjecture, vanishing in the
Bloch group of the algebraic numbers and torsion in the Bloch group of the
smallest field containing the coordinates, are equivalent for this reason
and for no other. -/
theorem TorsionInTheAlgebraicClosure : True := by sorry

/-! ## HB.4 Root-of-unity asymptotics -/

/-- q-pochhammer-symbols: Define the finite symbol (x;q)_n = product_{j=0}^{n-1}
(1 - q^j x) for a natural number n, the quantum factorial (q;q)_n =
(1-q)(1-q^2)...(1-q^n), and the infinite symbol (x;q)_infinity = product_{n
>= 0} (1 - q^n x), which is multipliable and holomorphic in x for |q| < 1.
Record the shift identity (x;q)_{n+1} = (1 - q^n x)(x;q)_n, the identity
(1-x)(qx;q)_infinity = (x;q)_infinity, the inversion (x;q^{-1})_infinity =
1/(qx;q)_infinity, the reflection (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2}
(q;q)_n, and the two logarithmic expansions log (x;q)_infinity = -sum_{l>=1}
x^l/(l(1-q^l)) and its Bernoulli form at q = 1 + x. -/
-- The finite symbol (x;q)_n.
def qPochhammer : True := by sorry

-- The shift identity (x;q)_{n+1} = (1 - q^n x) (x;q)_n.
theorem qPochhammer_succ : True := by sorry

-- The quantum factorial (q;q)_n.
def qFactorial : True := by sorry

-- The infinite symbol (x;q)_infinity for |q| < 1.
def qPochhammerInf : True := by sorry

-- The defining product is multipliable for |q| < 1.
theorem qPochhammerInf_multipliable : True := by sorry

-- The identity (1-x)(qx;q)_infinity = (x;q)_infinity.
theorem qPochhammerInf_shift : True := by sorry

-- The inversion identity relating q and q inverse.
theorem qPochhammerInf_inv : True := by sorry

-- The logarithmic expansion with the 1/(l(1-q^l)) coefficients.
theorem log_qPochhammerInf : True := by sorry

-- At x = q the infinite symbol is the pinned Euler function.
theorem qPochhammerInf_eq_eulerFunction : True := by sorry

example : True := by sorry -- unit test `pochhammer_zero`: (x;q)_0 = 1 and (q;q)_0 = 1.
example : True := by sorry -- unit test `pochhammer_one`: (x;q)_1 = 1 - x.
example : True := by sorry -- unit test `euler_function_agreement`: For |q| < 1 the value of (q;q)_infinity agrees with the pinned Euler function.
example : True := by sorry -- unit test `reflection`: (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2} (q;q)_n, which is the identity behind F_A(t,q) = F_{I-A}(t,q^{-1}).

/-- analytic-nahm-sum: For an analytic Nahm datum (A,B,C) put f_{A,B,C}(q) = q^C
sum over n in the non-negative integer vectors of q^{(1/2) n^t A n + B n}
divided by (q)_{n_1} ... (q)_{n_N}. This is a formal Puiseux series with
integer coefficients in q^{1/d} for any denominator d of the datum, and it
converges in the punctured unit disc, defining a holomorphic function of tau
in the upper half-plane through f(tau) = f_{A,B,C}(e^{2 pi i tau}) with the
convention (e^{2 pi i tau})^lambda = e^{2 pi i tau lambda}. The factor q^C
is part of the data and is never absorbed silently: it shifts the leading
exponent of every expansion and, in the modular cases, it is exactly what
makes the function modular. -/
-- The Puiseux series f_{A,B,C}(q).
def nahmSum : True := by sorry

-- The coefficient of a given rational power of q, a finite sum over the lattice points on a quadric.
theorem nahmSum_coeff : True := by sorry

-- Coefficientwise summability, from the positive definiteness of A.
theorem nahmSum_summable : True := by sorry

-- Absolute convergence and holomorphy on the punctured unit disc.
theorem nahmSum_analytic : True := by sorry

-- f_{A,B,C} = e(C tau) f_{A,B,0} in the upper half-plane form.
theorem nahmSum_shift_C : True := by sorry

-- The holomorphic function on the upper half-plane attached to the series.
theorem nahmSum_upperHalfPlane : True := by sorry

-- The series depends only on the datum.
theorem nahmSum_congr : True := by sorry

example : True := by sorry -- unit test `rogers_ramanujan_series`: For A = (2), B = 0, C = 0 the first coefficients of the sum are 1, 1, 1, 2, 2, 3, ... after the Rogers-Ramanujan product expansion.
example : True := by sorry -- unit test `empty_sum`: The coefficient of q^C is 1, coming from n = 0.
example : True := by sorry -- unit test `convergence_radius`: The series converges for every q with 0 < |q| < 1 and diverges at |q| = 1 when N is at least one.
example : True := by sorry -- unit test `C_shift`: Changing C by an integer multiplies the series by an integral power of q and changes no coefficient pattern.

/-- cyclic-dilogarithm-interface: The cyclic quantum dilogarithm D_zeta(x) =
product_{t=1}^{m-1} (1 - zeta^t x)^t, for zeta a primitive m-th root of
unity, and its m-th root taken with the principal branch of each factor, are
owned by HabiroNumberFields HB.2 and are imported here. This layer uses
exactly three of its properties: the quasi-periodicity D_zeta(zeta
x)/D_zeta(x) = (1-x)^m/(1-x^m); the evaluation D_zeta(zeta^k theta) =
(theta;zeta)_k^m D_zeta(theta)/(1-z)^k when theta^m = z, which uses Nahm's
equation to rewrite the denominator; and the value D_zeta(1) with
D_zeta(1)^{24m} = m^{12m}. Nothing about the cyclic dilogarithm is proved
here. -/
theorem CyclicDilogarithmInterface : True := by sorry

/-- pochhammer-radial-asymptotics: Let |w| < 1, let q = zeta e^{-epsilon/m} with
zeta a primitive m-th root of unity, let nu be a complex number with nu
epsilon tending to 0, and set z = w^m. Then log (q w e^{-nu epsilon/m};
q)_infinity equals minus Li_2(z)/(m epsilon) minus (nu/m - 1/2) log(1 - z)
minus (epsilon nu^2/(2m)) z/(1-z) minus (1/m) log D_zeta(w) minus log(1 - w)
plus a remainder psi_{w,zeta}(nu,epsilon) which has an explicit all-orders
asymptotic expansion in the Bernoulli polynomials and the polylogarithms of
non-positive index, namely minus the sum over r at least 2 and t from 1 to m
of (B_r(1 - (t+nu)/m) - delta_{r,2} nu^2/m^2) Li_{2-r}(zeta^t w)
epsilon^{r-1}/r!, in which the coefficient of nu^n is O(epsilon^{2n/3}). -/
theorem PochhammerRadialAsymptotics : True := by sorry

/-- summand-asymptotics: Fix a residue class k modulo m and write n_i =
epsilon^{-1} log(1/z_i) + epsilon^{-1/2} x_i, where z is the distinguished
solution and q = zeta e^{-epsilon/m}. Then the summand of the Nahm sum,
normalised by e^{-epsilon Q(n)/m}, equals (epsilon/(2 pi))^{N/2}
e^{Lambda/(m epsilon)} times an explicit product of algebraic prefactors in
theta_i = z_i^{1/m}, the cyclic dilogarithms D_zeta(theta_i)^{-1/m} and the
finite symbols (theta_i;zeta)_{k_i}, times the Gaussian factor e^{-x^t
A-tilde x/m} and the remainder terms psi. Here Lambda = -sum_j L(z_j) is
built from the Rogers dilogarithm and A-tilde = A + diag(z/(1-z)) is the
Hessian; A-tilde is positive definite, so the Gaussian factor is genuinely
peaked, and the peak is at the distinguished solution. -/
theorem SummandAsymptotics : True := by sorry

/-- formal-gaussian-integration: For a symmetric invertible matrix Lambda over a
Q-algebra, define the formal Gaussian integral of a function f(x,h) in the
completed ring of series in x with h-adic control by applying the
exponential of (h/2) times the inverse-Lambda Laplacian and evaluating at x
= 0. Equivalently, in one variable, the integral of sum_j c_j x^j is sum_l
(2l-1)!! c_{2l} Lambda^{-l}. This formally computes the ratio of the
Gaussian integral of f against the Gaussian weight to the Gaussian integral
of the weight, and is defined without any measure theory. The construction
is meaningful exactly when the valuations of the coefficients tend to
infinity, which is why the source's domain is the ring of series in w, w^3
h^{-1} and h. -/
-- The bracket attached to a symmetric invertible Lambda.
def formalGaussian : True := by sorry

-- The bracket of a constant is that constant.
theorem formalGaussian_const : True := by sorry

-- The bracket of an odd monomial vanishes.
theorem formalGaussian_odd : True := by sorry

-- The bracket of a quadratic monomial is the corresponding entry of h times the inverse of Lambda.
theorem formalGaussian_sq : True := by sorry

-- Linearity in the integrand.
theorem formalGaussian_linear : True := by sorry

-- Behaviour under an invertible linear change of the integration variable.
theorem formalGaussian_changeOfVariables : True := by sorry

-- The translation rule used for the periodicity of the congruence-class terms.
theorem formalGaussian_translate : True := by sorry

example : True := by sorry -- unit test `second_moment`: With Lambda = 1 in one variable the bracket of x^2 is h.
example : True := by sorry -- unit test `fourth_moment`: With Lambda = 1 the bracket of x^4 is 3 h^2.
example : True := by sorry -- unit test `odd_vanishes`: The bracket of x^3 is zero.
example : True := by sorry -- unit test `diagonal_factorises`: For a diagonal Lambda the bracket of a product of functions of separate variables is the product of the brackets.

/-- gauss-sum-and-congruence-splitting: Split the Nahm sum over the residue
classes of n modulo m and modulo a strong denominator D, and define the
quadratic Gauss sum G(Q,alpha) = D^{-N} sum over k in (Z/DZ)^N of e(alpha-
bar Q(k)), where alpha is a rational with denominator m prime to D and
alpha-bar is its reduction modulo D. The sum is independent of the choice of
strong denominator. The asymptotic expansion of the whole Nahm sum is the
Gauss sum times the sum over the m-classes of zeta^{Q(k)-bar} times the
class asymptotics, which is where the arithmetic of the exponent and the
analysis of the summand separate. -/
-- The normalised quadratic Gauss sum G(Q,alpha).
def gaussSum : True := by sorry

-- Independence of the choice of strong denominator.
theorem gaussSum_independent : True := by sorry

-- The value at an integral alpha is 1.
theorem gaussSum_int : True := by sorry

-- The behaviour under alpha to alpha + 1.
theorem gaussSum_add_one : True := by sorry

-- The decomposition of the Nahm sum into its congruence-class pieces.
theorem nahmSum_split : True := by sorry

-- The splitting is a finite sum of series.
theorem nahmSum_split_finite : True := by sorry

example : True := by sorry -- unit test `trivial_alpha`: G(Q,0) = 1.
example : True := by sorry -- unit test `rank_one_quadratic`: For A = (2), B = 0 and alpha = 1/5 the Gauss sum is the normalised quadratic Gauss sum modulo 5.
example : True := by sorry -- unit test `independence`: Computing G(Q,alpha) with D and with 2D gives the same value.
example : True := by sorry -- unit test `splitting_recovers`: Summing the congruence pieces over all classes recovers the original series coefficientwise.

/-- radial-asymptotic-expansion: Let Q(x) = (1/2) x^t A x + B x come from an
analytic Nahm datum, let alpha be a rational whose denominator m is odd and
prime to a denominator of Q, and let zeta = e(alpha). Then, as epsilon
decreases to 0, e^{-Lambda/(m epsilon)} f_Q(alpha + i epsilon/(2 pi m)) is
asymptotic to chi^N m^{-N/2} c(Q) G(Q,alpha) S_{Q,zeta}(epsilon), where chi
= e(binom(m-1,2) alpha/12) is a twelfth root of zeta, c(Q) =
det(A-tilde)^{-1/2} product_i theta_i^{B_i} (1-z_i)^{1/2 - 1/m}, G(Q,alpha)
is the Gauss sum, and S_{Q,zeta}(epsilon) is the explicit power series given
by the cyclic dilogarithms, the finite symbols and the formal Gaussian
integrals of the congruence classes. Moreover S_{Q,zeta}(epsilon)^m lies in
F_m[[epsilon]], where F is generated by the d-th roots of the coordinates of
the distinguished solution and F_m adjoins zeta. -/
theorem RadialAsymptoticExpansion : True := by sorry

/-- poisson-summation-and-remainders: Three estimates make the expansion an all-
orders asymptotic statement rather than a formal manipulation. First, for
lambda < -1/2 the lattice sum may be truncated to |x_i| < epsilon^{lambda +
1/2} with an error that is O(epsilon^K) for every K. Second, for lambda >
-2/3 and every K the integrand may be replaced by its expansion to order K
with an error o(epsilon^{K(3 lambda + 2)}). Third, for a polynomial P and
lambda < -1/2 the truncated lattice sum of P against the Gaussian is
asymptotic to (m epsilon)^{-N/2} times the corresponding Gaussian integral,
and in particular is independent of the shift of the lattice. The ranges of
lambda in the first two overlap, which is what makes the argument close. In
addition, the sum over the residue classes modulo a strong denominator D has
the same asymptotics for every class. -/
theorem PoissonSummationAndRemainders : True := by sorry

/-- simplified-form-and-the-unit: In the form CGZ use, for A and B as above and
n a positive integer coprime to the denominators of A and B, and for every
primitive n-th root of unity zeta, one has f_{A,B}(zeta e^{-h/n}) = mu omega
e^{L(xi_A)/(n h)} (Phi_zeta(h) + O(h^K)) for every K as h decreases to 0,
where omega^2 lies in F, mu = e(r(n-1)(n-2)/(24 n)), and Phi_zeta(h) =
Phi_{A,B,zeta}(h) is an explicit power series with Phi_zeta(h)^n in F_n[[h]]
and P_zeta(xi_A)^{1/n} D_zeta(1)^{r/n} Phi_zeta(h) in F_n[[h]]. If moreover
Phi_zeta(0)^n is non-zero, its image in F_n^* modulo n-th powers lies in the
chi^{-1}-eigenspace. -/
theorem SimplifiedFormAndTheUnit : True := by sorry

/-- unit-corollary-and-nonvanishing: If Phi_zeta(0) is non-zero, then the
product of the power series Phi_zeta(h) with the n-th root of any unit
representing R_zeta(xi_A) lies in F_n[[h]]. The proof is two lines from the
previous theorem: the constant term times the n-th root of the unit lies in
F_n, and the ratio Phi_zeta(h)/Phi_zeta(0) is a power series with constant
term 1 whose n-th power lies in F_n[[h]], hence lies in F_n[[h]] itself. The
corollary is vacuous when Phi vanishes identically, and any statement that
divides by Phi_zeta(0) carries the non-vanishing hypothesis explicitly. -/
theorem UnitCorollaryAndNonvanishing : True := by sorry

/-- acceptance-andrews-gordon: For odd n, let eta_zeta be the n-torsion element
of the Bloch group of the maximal real subfield of the n-th cyclotomic field
defined in CGZ Section 1.2, where zeta is a primitive n-th root of unity.
Then R_zeta(eta_zeta) = zeta^2. The proof is an application of the radial
asymptotics to a specific family: the Andrews-Gordon Nahm sums f_n =
f_{A_n,0} with A_n = (2 min(i,j)) of size (n-3)/2, which have a product
expansion and are therefore modular up to a power of q, so that their
asymptotics at a root of unity can be computed twice, once by modularity and
once by the expansion of this layer, and the comparison yields the value of
the unit. -/
theorem AcceptanceAndrewsGordon : True := by sorry

/-- coefficient-versus-radial-asymptotics: Let G(q) = sum_n c(n) q^n be analytic
in the open unit disc with a radial expansion at q = 1 of the form G(e^{-z})
asymptotic to e^{C^2/(4z)} sum over alpha of A_alpha z^alpha, where C is a
positive real and the exponents alpha tend to infinity, and assume the
technical decay hypothesis that for every N there is theta_N with theta_N =
o(N) such that the modulus of G(e^{-h + i theta}) is less than h^N
e^{C^2/(4h)} for small positive h and |theta| larger than theta_N. Then the
coefficients satisfy c(n) asymptotic to (1/2) sqrt(C/(2 pi)) n^{-3/4} e^{C
sqrt n} times an explicit double sum over l and alpha involving the double
factorials, binomial coefficients and the A_alpha. For a Nahm sum the
exponents alpha are natural numbers and the hypotheses hold. -/
theorem CoefficientVersusRadialAsymptotics : True := by sorry

/-! ## HB.5a Finite-index modular functions at cusps -/

/-- finite-index-subgroups: A modular group for this layer is a subgroup Gamma
of SL(2,Z) of finite index. It is NOT assumed to be a congruence subgroup,
and no algebraic model of a modular curve is used anywhere in the layer.
Record the pinned facts: Mathlib's arithmetic subgroups of GL(2,R) are those
commensurable with SL(2,Z), and for a subgroup of SL(2,Z) being arithmetic
is equivalent to having finite index, so the generality this layer needs is
already the pinned default; the congruence condition is a separate predicate
that no statement below uses. -/
-- A subgroup of SL(2,Z) of finite index.
def ModularSubgroup : True := by sorry

-- The finite-index hypothesis.
theorem ModularSubgroup.finiteIndex : True := by sorry

-- Agreement with Mathlib's arithmeticity predicate.
theorem ModularSubgroup.isArithmetic : True := by sorry

-- The intersection of two finite-index subgroups.
def ModularSubgroup.inter : True := by sorry

-- The intersection again has finite index.
theorem ModularSubgroup.inter_finiteIndex : True := by sorry

-- Whether minus the identity belongs to the subgroup.
def ModularSubgroup.negOne : True := by sorry

example : True := by sorry -- unit test `full_group`: SL(2,Z) itself is a legitimate input with index 1.
example : True := by sorry -- unit test `principal_congruence`: Gamma(M) is a legitimate input, and its index is the standard one.
example : True := by sorry -- unit test `intersection_index`: The intersection of Gamma with Gamma(M) has index at most the product of the two indices.
example : True := by sorry -- unit test `no_congruence_used`: No statement of this layer refers to a congruence predicate; the tests are stated for an arbitrary finite-index subgroup.

/-- cusps-and-scaling-matrices: The cusps of a finite-index subgroup Gamma are
the points of the projective line over the rationals inside the boundary of
the upper half-plane, and Gamma has finitely many orbits on them. For every
cusp c there is a scaling matrix, that is an element g of SL(2,Z) with g .
infinity = c; transport of a statement at c to a statement at infinity is
conjugation by g. Record from the pinned libraries: the cusps of an
arithmetic subgroup are exactly the rational points together with infinity,
every cusp is g . infinity for some g in SL(2,Z), and the orbit set is
finite. -/
-- The set of cusps of a finite-index subgroup, the rational projective line.
def cuspSet : True := by sorry

-- A choice of g in SL(2,Z) with g . infinity = c.
def scalingMatrix : True := by sorry

-- The defining property of a scaling matrix.
theorem scalingMatrix_spec : True := by sorry

-- Two scaling matrices for the same cusp differ by an element of the stabiliser of infinity.
theorem scalingMatrix_unique_up_to_stabiliser : True := by sorry

-- The set of Gamma-orbits of cusps is finite.
theorem cuspOrbits_finite : True := by sorry

-- Transport of an invariant function to the cusp infinity by the slash action of a scaling matrix.
theorem transport : True := by sorry

example : True := by sorry -- unit test `infinity_identity`: The identity is a scaling matrix for the cusp infinity.
example : True := by sorry -- unit test `zero_S`: S = (0 -1; 1 0) is a scaling matrix for the cusp 0.
example : True := by sorry -- unit test `rational_cusp`: For coprime b and d the matrix with first column (b,d) is a scaling matrix for b/d.
example : True := by sorry -- unit test `finitely_many_orbits`: For Gamma(2) the number of cusp orbits is three.

/-- cusp-width: The width of a cusp c of Gamma is the least positive integer w
such that the conjugate by a scaling matrix of the translation by w belongs
to Gamma, equivalently the size of the orbit of the coset of the scaling
matrix under the translation subgroup acting on the coset space. The width
is independent of the choice of scaling matrix. Two conventions must be kept
apart: when minus the identity belongs to Gamma the orbit width is the
classical width, and otherwise it is either the classical width or twice it;
the sum of the widths over the orbits is the index. Tau Ceti carries the
orbit-based width at every cusp and Mathlib carries the strict width at
infinity, and both are cited rather than rebuilt. -/
-- The width of a cusp of Gamma.
def cuspWidth : True := by sorry

-- The width is a positive integer.
theorem cuspWidth_pos : True := by sorry

-- The conjugated translation by the width belongs to Gamma, and no smaller positive integer works.
theorem cuspWidth_spec : True := by sorry

-- Independence of the choice of scaling matrix.
theorem cuspWidth_independent : True := by sorry

-- Agreement with Tau Ceti's orbit width.
theorem cuspWidth_eq_tauceti : True := by sorry

-- Agreement with Mathlib's strict width at infinity.
theorem cuspWidth_infty_eq_mathlib : True := by sorry

-- The widths sum to the index over a set of orbit representatives.
theorem sum_cuspWidth_eq_index : True := by sorry

example : True := by sorry -- unit test `full_group_width_one`: Every cusp of SL(2,Z) has width 1.
example : True := by sorry -- unit test `principal_width`: Every cusp of Gamma(M) has width M.
example : True := by sorry -- unit test `gamma0p`: For Gamma_0(p) the widths at infinity and at 0 are 1 and p.
example : True := by sorry -- unit test `widths_sum_to_index`: For Gamma_0(p) the widths sum to p + 1, the index.

/-- modular-function-of-finite-index: A modular function for Gamma is a
meromorphic function on the upper half-plane, invariant under the weight-
zero action of Gamma, which is meromorphic at every cusp: for each cusp with
its scaling matrix and width, the transported function has a Laurent
expansion in the local parameter with finite principal part. No holomorphy
is assumed on the upper half-plane or at the cusps, and no algebraic model
of the quotient is used. Mathlib has weight-zero slash-invariant forms with
no analytic condition and proves that weight-zero holomorphic modular forms
are constant; the meromorphic notion with Laurent expansions at cusps is
what this layer adds. -/
-- A weight-zero Gamma-invariant meromorphic function, meromorphic at every cusp.
def ModularFunction : True := by sorry

-- The invariance under the slash action.
theorem ModularFunction.invariant : True := by sorry

-- Meromorphy at each cusp, with finite principal part.
theorem ModularFunction.meromorphicAtCusp : True := by sorry

-- The constant functions are modular functions.
def ModularFunction.const : True := by sorry

-- The modular functions form a field.
theorem ModularFunction.field : True := by sorry

-- Meromorphy at a cusp does not depend on the scaling matrix chosen.
theorem ModularFunction.meromorphicAtCusp_independent : True := by sorry

-- Two modular functions agreeing as functions are equal.
theorem ModularFunction.ext : True := by sorry

example : True := by sorry -- unit test `constants`: Every constant is a modular function for every Gamma.
example : True := by sorry -- unit test `j_function`: The j-function is a modular function for SL(2,Z) with a pole of order one at the cusp in the local parameter.
example : True := by sorry -- unit test `weight_zero_holomorphic_constant`: A holomorphic modular function with no pole at any cusp is constant, which is the pinned weight-zero statement.
example : True := by sorry -- unit test `essential_singularity_excluded`: A function whose transported expansion has infinitely many negative powers is not a modular function.

/-- local-parameter-and-laurent-expansion: Let c be a cusp of Gamma of width w
with scaling matrix g. The local parameter is q_c(z) = exp(2 pi i z / w),
whose absolute value is exp(-2 pi Im(z)/w); the transported function f
slashed by g is invariant under translation by w, hence is a function of
q_c, and meromorphy at the cusp says exactly that this function extends
meromorphically to the punctured disc with a finite principal part.
Consequently f slashed by g has a Laurent expansion sum over n at least n_0
of a_n q_c^n with a_{n_0} non-zero, unless the transported function is
identically zero, which is a case that must be separated. -/
theorem LocalParameterAndLaurentExpansion : True := by sorry

/-- radial-growth-at-a-cusp: Let f be a modular function for Gamma, not
identically zero, and let c = b/d be a cusp with width w and leading Laurent
exponent n_0 at c. Then along the radial approach z = c + i y with y
decreasing to 0, the transported function satisfies f(z) = a_{n_0} exp(-2 pi
i n_0 c / w) exp(2 pi n_0 / (w y)) (1 + O(exp(-2 pi/(w y)))). In particular
the exponential rate is 2 pi n_0/w, a rational multiple of pi determined by
the integer leading exponent and the rational cusp data, and there is no
other possible rate: a modular function grows like exp(constant/y) with the
constant in (2 pi/w) Z, and never like exp(c/y) with an irrational multiple. -/
theorem RadialGrowthAtACusp : True := by sorry

/-- supplier-interface: The Nahm application uses exactly four facts from this
layer, and the layer exists to supply them. First, for an element gamma = (a
b; c d) of Gamma and the radial parameter epsilon = d h/(1 - i c h-bar), the
invariance gives f_{A,B,C}(e^{-epsilon}) = f_{A,B,C}(zeta e^{-h/d}) with
zeta = e(b/d), so a radial approach to 1 becomes a radial approach to a root
of unity of order dividing d. Second, the exponential rate of a modular
function along a radial approach is a rational multiple of pi squared, which
forces lambda = L(xi_A)/(4 pi^2) to be rational. Third, the error term in
the expansion at a cusp is exponentially small, not merely O(epsilon).
Fourth, Gamma may be shrunk by intersecting with Gamma(M), so that the
denominators d avoid any fixed finite set of primes. No other property of
modular functions is used, and in particular no congruence hypothesis, no
algebraic model and no Fourier coefficient arithmetic. -/
theorem SupplierInterface : True := by sorry

/-! ## HB.5 The proved implication in Nahm's conjecture -/

/-- nahm-conjecture-statement: For a symmetric positive definite rational matrix
A define three properties. (a) The class [X] vanishes in the Bloch group of
the complex numbers for EVERY solution X of Nahm's equations. (b) The
special class xi_A attached to the distinguished solution vanishes. (c) The
function f_{A,B,C} is modular for SOME rational vector B and rational number
C. Trivially (a) implies (b). Nahm's conjecture is the pair of implications
(a) implies (c) and (c) implies (b). Both stronger forms are false: (b)
alone does not imply (c), by Zagier's matrix (8 5; 5 4), and (c) does not
require (a), by the Vlasenko-Zwegers matrix (3/2 1/2; 1/2 3/2). Only (c)
implies (b) is a theorem, and it is the endpoint of this layer. -/
-- The property that every solution has vanishing class.
def NahmProperty.a : True := by sorry

-- The property that the distinguished solution has vanishing class.
def NahmProperty.b : True := by sorry

-- The property that some f_{A,B,C} is modular.
def NahmProperty.c : True := by sorry

-- Property (a) implies property (b).
theorem NahmProperty.a_imp_b : True := by sorry

-- The conjectural implication from (a) to (c), stated and not proved.
def NahmConjecture.aImpC : True := by sorry

-- The implication from (c) to (b), which is the theorem of this layer.
def NahmConjecture.cImpB : True := by sorry

-- Zagier's counterexample matrix, recorded as data.
theorem NahmProperty.b_not_imp_c : True := by sorry

-- The Vlasenko-Zwegers counterexample matrix, recorded as data.
theorem NahmProperty.c_not_imp_a : True := by sorry

example : True := by sorry -- unit test `rogers_ramanujan_all_three`: For A = (2) all three properties hold.
example : True := by sorry -- unit test `zagier_matrix_b_not_c`: For A = (8 5; 5 4) property (b) holds and property (c) fails.
example : True := by sorry -- unit test `vlasenko_zwegers_c_not_a`: For A = (3/2 1/2; 1/2 3/2) property (c) holds and property (a) fails.
example : True := by sorry -- unit test `a_implies_b`: Property (a) implies property (b) for every A, with no hypothesis beyond positive definiteness.

/-- expansion-at-one: Every Nahm sum has an expansion near q = 1 of the form
f_{A,B,C}(e^{-epsilon}) = e^{L(xi_A)/epsilon} (K + O(epsilon)) as epsilon
decreases to 0, where K is a non-zero algebraic number some power of which
lies in the field F generated by the distinguished solution. If moreover
f_{A,B,C} is modular, the error term O(epsilon) may be replaced by
O(e^{-c/epsilon}) for some positive c, and the number lambda = L(xi_A)/(4
pi^2) is rational. -/
theorem ExpansionAtOne : True := by sorry

/-- comparison-of-expansions: Assume f_{A,B,C} is modular for a finite-index
subgroup Gamma, and let gamma = (a b; c d) be an element of Gamma. Taking
epsilon = d h/(1 - i c h-bar) with h-bar = h/(2 pi), the invariance gives
f_{A,B,C}(e^{-epsilon}) = f_{A,B,C}(zeta e^{-h/d}) with zeta = e(b/d).
Comparing the expansion at 1 with the radial expansion at zeta, both of
which are available, yields mu e^{L(xi_A)/(h d)} Phi_zeta(h) = e^{L(xi_A)/(h
d)} (K e(lambda c/d) + O(h)), hence Phi_zeta(0) = mu^{-1} K e(lambda c/d).
In particular Phi_zeta(0) is non-zero, and a fixed power of it, with
exponent independent of d, lies in F_n for n = d. -/
theorem ComparisonOfExpansions : True := by sorry

/-- torsion-from-unbounded-orders: Let G be a finitely generated abelian group
and let x be an element of G such that x lies in nG for infinitely many
positive integers n. Then x is torsion. Equivalently, if the image of x in
G/nG vanishes for an unbounded set of n, then the free part of x vanishes.
The proof is the structure theorem: write G as the sum of a free part of
finite rank and a finite torsion part, and observe that a non-zero element
of the free part has a non-zero coordinate, which is divisible by only
finitely many n. -/
theorem TorsionFromUnboundedOrders : True := by sorry

/-- modularity-implies-torsion: Let A be a symmetric positive definite rational
matrix, B a rational vector and C a rational number, and let xi_A be the
Bloch class of the distinguished solution in the Bloch group of the field F
it generates. If f_{A,B,C} is a modular function, that is if its upper half-
plane form is invariant under a subgroup of finite index of SL(2,Z), then
xi_A is a torsion element of B(F). Equivalently, xi_A vanishes in the Bloch
group of the algebraic numbers. This is the implication (c) implies (b) of
Nahm's conjecture, and it is the only implication that is proved. -/
theorem ModularityImpliesTorsion : True := by sorry

/-- excluded-primes-and-hypotheses: Two finiteness statements make the argument
legitimate. First, the radial expansion of HB.4 requires the order n of the
root of unity to be odd and coprime to a denominator of the datum, so the
orders that may be used are exactly those prime to a fixed integer;
shrinking Gamma by intersecting with Gamma(M) for a suitable M arranges that
every denominator d arising from an element of Gamma satisfies this. Second,
the unit map and its injectivity statement exclude only the primes dividing
a fixed exceptional integer coming from the Chern class comparison, which is
a finite set. Hence the family of admissible orders is still unbounded,
which is what the torsion argument needs. -/
theorem ExcludedPrimesAndHypotheses : True := by sorry

/-- boundaries-of-the-implication: Four statements are explicitly not proved and
must not be inferred. First, the converse implication from the vanishing of
the Bloch class to modularity is not proved for general A, and CGZ record
that it does not even have a sufficiently precise formulation. Second, the
torsion of the class is not a modularity test: A = (8 5; 5 4) has a torsion
class and is not modular. Third, the theorem is for modular FUNCTIONS of
weight zero; the apparently more general modular-form statement reduces to
it, and the reduction, not an independent proof, is what covers it. Fourth,
the generality of a finite-index subgroup is part of the theorem, and
replacing it by a congruence subgroup would prove a weaker statement; the
expectation that a modular Nahm sum is automatically modular for a
congruence subgroup rests on an unbounded-denominator conjecture and is not
used anywhere. -/
theorem BoundariesOfTheImplication : True := by sorry

/-- valuation-bound-at-every-cusp: Suppose the Nahm sum f_Q is modular, and for
a rational point P of the projective line define its valuation v_P(f_Q) as
the smallest exponent of q in the Fourier expansion of f_Q transported to
infinity by an element of SL(2,Z) sending infinity to P; this is independent
of the choice. Put C_0(A) = -Lambda(xi_A)/(2 pi)^2 with the Garoufalidis-
Zagier normalisation of the Rogers dilogarithm. Then v_P(f_Q) is at least
C_0(A) for every rational P, with equality at P = 0. In particular, at P =
infinity the valuation is the minimum of Q over the non-negative integer
vectors, so that minimum is at least C_0(A); and when the quadratic part is
non-negative on that set, which holds for every modular triple of rank at
most three in the literature, the valuation at infinity is C itself, so C is
at least C_0(A). -/
theorem ValuationBoundAtEveryCusp : True := by sorry

/-! ## HB.8 Admissibility and integrality: GSWZ Theorem 6 -/

/-- admissible-series: For a positive integer N and variables t = (t_1,...,t_N),
an admissible series is a power series F(t,q) over the rational function
field in q with F(t,q) = 1 + O(t) whose logarithm has the form log F(t,q) =
minus the sum over non-zero n in the non-negative integer vectors and over l
at least 1 of L_n(q^l) t^{l n}/(l (1 - q^l)), where each L_n(q) is a LAURENT
POLYNOMIAL with integer coefficients. The integrality of the L_n is the
whole content: the displayed shape with L_n merely a rational function
imposes nothing. -/
-- The predicate that a power series is admissible.
def Admissible : True := by sorry

-- The Laurent polynomials L_n attached to an admissible series.
theorem Admissible.L : True := by sorry

-- The L_n are uniquely determined by the series.
theorem Admissible.L_unique : True := by sorry

-- The product of admissible series is admissible, with L adding.
def Admissible.mul : True := by sorry

-- The inverse of an admissible series is admissible.
def Admissible.inv : True := by sorry

-- Admissibility is preserved by inverting q.
theorem Admissible.qInv : True := by sorry

-- The infinite Pochhammer symbol is admissible.
theorem Admissible.pochhammer : True := by sorry

example : True := by sorry -- unit test `pochhammer_admissible`: The infinite Pochhammer symbol is admissible with L_1 = 1.
example : True := by sorry -- unit test `product_admissible`: The product of two admissible series is admissible.
example : True := by sorry -- unit test `qinv_admissible`: If F is admissible then so is F with q inverted.
example : True := by sorry -- unit test `rational_L_not_admissible`: A series with L_1(q) = 1/(1-q) satisfies the displayed shape but is not admissible.

/-- product-expansion-and-dt-exponents: Every power series F(t,q) over the
Laurent series field in q with F(0,q) = 1 has a unique expansion as a
product over non-zero n and over integers i of (q^i t^n;
q)_infinity^{c_{n,i}} with integer exponents c_{n,i}, where for each n the
exponents vanish for all sufficiently negative i. The series is admissible
exactly when, for each fixed n, only finitely many c_{n,i} are non-zero, and
in that case L_n(q) = sum_i c_{n,i} q^i. The exponents are the generalised
Donaldson-Thomas invariants. -/
theorem ProductExpansionAndDtExponents : True := by sorry

/-- expansion-at-roots-of-unity: For an admissible series F and each positive
integer m, set Phi_m(t,x) = F(t^{1/m}, zeta_m + x). Then Phi_m lies in
exp(V(t)/(m^2 log(1 + x/zeta_m))) times delta(t)^{-1/2} times U_m(t) times
(1 + x t^{1/m} times power series), where V(t) = sum_n L_n(1) Li_2(t^n) is
the potential, delta(t) is the exponential of an explicit combination of
L_n(1) and L_n'(1) against Li_1, and U_m(t) is the explicit constant
recorded in the source. The rescaling of t by an m-th root is forced: the
residue of the logarithm at zeta_m is V(t^m)/m^2, so without it the
expansion is not a power series in t. -/
-- The collection Phi_m of expansions of an admissible series at the roots of unity.
def admissibleExpansion : True := by sorry

-- The potential V(t) of an admissible series.
def potential : True := by sorry

-- The series delta(t).
def discriminantSeries : True := by sorry

-- The series U_m(t) for each m.
def constantSeries : True := by sorry

-- The displayed shape of the expansion.
theorem admissibleExpansion_shape : True := by sorry

-- V determines the values L_n(1) and conversely.
theorem potential_determines_values : True := by sorry

-- A single Phi_m determines F.
theorem expansion_determines_series : True := by sorry

example : True := by sorry -- unit test `pochhammer_potential`: For the infinite Pochhammer symbol the potential is Li_2(t).
example : True := by sorry -- unit test `constant_term_one`: Phi_m(0,x) = 1 for every m.
example : True := by sorry -- unit test `recognition`: Two admissible series with the same Phi_1 are equal.
example : True := by sorry -- unit test `rescaling_needed`: Without the rescaling of t the coefficient of x^{-1} is V(t^m)/m^2, which is not the potential of the series.

/-- dwork-quotient-admissible: If F is admissible then for every prime p and
every positive integer m not divisible by p, the difference log F(t^{p/m},
q^p) - p log F(t^{1/m}, q), expanded at q = zeta_m + x, lies in (p/x) times
the p-local power series ring in t^{1/m} and x over the m-th cyclotomic
integers. The proof is one line from the definition: the logarithm of
F(t^p,q^p)/F(t,q)^p is p times the sub-sum of the defining series over the l
prime to p, and every term of that sub-sum is p-integral after expansion at
a root of unity of order prime to p. -/
theorem DworkQuotientAdmissible : True := by sorry

/-- series-F-A: For a symmetric integral N by N matrix A define F_A(t,q) as the
sum over non-negative integer vectors n of (-1)^{diag(A).n} q^{(n^t A n +
diag(A).n)/2} t^n divided by the product of the (q;q)_{n_j}. It satisfies
the linear q-difference system F_A(t,q) - F_A(sigma_j t, q) = (-1)^{A_jj}
t_j q^{A_jj} F_A(prod_i sigma_i^{A_ij} t, q) for j = 1,...,N, where sigma_j
multiplies t_j by q, and this system together with F_A(0,q) = 1 determines
F_A uniquely. It also satisfies the reflection F_A(t,q) = F_{I-A}(t,q^{-1}). -/
-- The series F_A(t,q) attached to a formal Nahm datum.
def seriesFA : True := by sorry

-- F_A(0,q) = 1.
theorem seriesFA_zero : True := by sorry

-- The q-difference system.
theorem seriesFA_qdiff : True := by sorry

-- The system with the initial condition determines the series.
theorem seriesFA_unique : True := by sorry

-- The reflection F_A(t,q) = F_{I-A}(t,q^{-1}).
theorem seriesFA_reflect : True := by sorry

-- The ratios G_j(t,q) and the Riccati system they satisfy.
def seriesFA_ratio : True := by sorry

-- The ratios have Laurent polynomial coefficients.
theorem seriesFA_ratio_integral : True := by sorry

example : True := by sorry -- unit test `rank_one_three`: For A = (3) the series is the displayed sum and satisfies F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0.
example : True := by sorry -- unit test `zero_matrix`: For A = 0 the series is the reciprocal of the infinite Pochhammer symbol in t.
example : True := by sorry -- unit test `constant_term`: The coefficient of t^0 is 1.
example : True := by sorry -- unit test `reflection`: For A = (3) the reflection identity gives F_{(3)}(t,q) = F_{(-2)}(t,q^{-1}).

/-- t-deformed-nahm-equations: Setting q = 1 and replacing the shift operators
by unknowns z_j(t) turns the q-difference system into the t-deformed Nahm
equations 1 - z_j(t) = (-1)^{A_jj} t_j product_i z_i(t)^{A_ij} with z(0) =
1. They have a unique solution in formal power series with integer
coefficients, given by an explicit hypergeometric series; in rank one, with
1 - z = t(-z)^A, the solution is the sum over k of (-1)^{(A+1)k} binom(Ak,k)
t^k/((A-1)k+1). They define the ring S obtained from the Laurent polynomial
ring in t, z and the inverse square root of the discriminant delta(t) =
product_j z_j(t)^{-A_jj} det(diag(1-z(t)) A + diag(z(t))) by the equations,
which after inverting 2 is an etale algebra over the polynomial ring in t;
and its level m variants S^{(m)}, which adjoin a primitive m-th root of
unity and m-th roots of the t. -/
-- The unique power series solution z(t) with z(0) = 1.
def tNahmSolution : True := by sorry

-- Its coefficients are integers.
theorem tNahmSolution_integral : True := by sorry

-- It satisfies the t-deformed equations.
theorem tNahmSolution_spec : True := by sorry

-- The discriminant delta(t).
def discriminant : True := by sorry

-- delta(0) = 1.
theorem discriminant_zero : True := by sorry

-- The ring S and its level m variants.
def ringS : True := by sorry

-- After inverting 2 the ring S is etale over the polynomial ring in t.
theorem ringS_etale : True := by sorry

-- The Galois action multiplying the m-th roots of z by roots of unity.
def ringS_galois : True := by sorry

-- The specialisation t = 1 onto the ring of HB.3.
theorem ringS_specialise : True := by sorry

example : True := by sorry -- unit test `rank_one_three_solution`: For A = (3) the first coefficients of z(t) are 1, 1, 3, 12, 55, 273.
example : True := by sorry -- unit test `zero_matrix_solution`: For A = 0 the solution is z_j = 1 - t_j and delta = 1.
example : True := by sorry -- unit test `discriminant_series`: For A = (3) the first coefficients of delta(t) are 1, -5, -3, -10, -42.
example : True := by sorry -- unit test `specialisation_at_one`: Specialising t = 1 in the equations gives the Nahm equations in the GSWZ sign convention.

/-- potential-pole-lemma: For every symmetric integral A there is a power series
V_A(t) over the rationals such that for every positive integer m, log F_A(t,
zeta_m + x) equals zeta_m V_A(t^m)/(m^2 x) plus a term of order zero in x.
The same holds for the congruence variants F_{A,m,k} with the same V_A. The
proof is deferred to the identification theorem, from which both follow by
the explicit formula for the formal Gaussian integrals; alternatively it
follows from the q-difference equations by the WKB algorithm. -/
theorem PotentialPoleLemma : True := by sorry

/-- finite-support-theorem: For every symmetric integral matrix A, the unique
integers c_{n,i} in the product expansion of F_A have finite support: for
each fixed non-zero n, all but finitely many c_{n,i} vanish. Equivalently
F_A is admissible. This is GSWZ Theorem 6, which they attribute to
Kontsevich-Soibelman and Efimov and reprove elementarily; the proof given
here is the elementary one, through the Riccati system for the ratios and
the potential lemma, and does not import a general Donaldson-Thomas
integrality theorem. -/
theorem FiniteSupportTheorem : True := by sorry

/-- level-m-admissible-series: Fix a positive integer m. Every series F(t,q)
with F = 1 + O(t) over the Laurent series field in q with m inverted can be
written uniquely as the exponential of minus the sum over n at least 1 and
over l prime to m of L_n(q^l) t^{nl}/(l (1 - q^{m l})), with L_n a Laurent
series with m inverted. The series is level m admissible when each L_n lies
in the ring obtained from the Laurent polynomials with m inverted by
inverting the cyclotomic polynomials Phi_d with d not congruent to 0 modulo
m, and moreover L_n(zeta_m) is integral away from m. Level 1 admissible is
ordinary admissible. -/
-- The predicate of level m admissibility.
def LevelAdmissible : True := by sorry

-- The Laurent series L_n of a level m decomposition.
theorem LevelAdmissible.L : True := by sorry

-- Uniqueness of the decomposition.
theorem LevelAdmissible.L_unique : True := by sorry

-- Level 1 admissibility is ordinary admissibility.
theorem LevelAdmissible.one : True := by sorry

-- The building block as a Moebius-weighted product of Pochhammer symbols.
theorem LevelAdmissible.moebiusProduct : True := by sorry

-- The residue of the logarithm at a root of unity of order divisible by m.
theorem LevelAdmissible.residue : True := by sorry

example : True := by sorry -- unit test `level_one`: A level 1 admissible series is admissible.
example : True := by sorry -- unit test `moebius_m_two`: For m = 2 the building block is the ratio of two Pochhammer symbols with the Moebius weights 1 and -1/2.
example : True := by sorry -- unit test `pochhammer_level_m`: The Pochhammer symbol in t with q replaced by q^m is level m admissible.
example : True := by sorry -- unit test `value_condition_independent`: A series satisfying the membership condition and failing the value condition at zeta_m is not level m admissible.

/-- congruence-sums-are-level-m-admissible: Fix a symmetric integral A, a
positive integer m and a residue class k in {0,...,m-1}^N, and let
F_{A,m,k}(t,q) be the sum defining F_A restricted to the n congruent to k
modulo m, normalised as in GSWZ equation (FAmdef). Then F_{A,m,k}(t^{1/m},q)
is level m admissible. Moreover the Dwork-type quotient of a level m
admissible series is p-integral in the same strong sense as for admissible
series: for all primes p and positive m' with mm' prime to p, log
F(t^{p/m'},q^p) - p log F(t^{1/m'},q) lies in (p/x) times the p-local
coefficient ring at q = zeta_{mm'} + x. -/
theorem CongruenceSumsAreLevelMAdmissible : True := by sorry

/-- fgi-collection: For a symmetric integral A and each m, define
Phi^FGI_{A,m}(t,x) as the sum over the residue classes k modulo m of the
formal Gaussian integrals I_{A,m,k}(t^{1/m},x), where each I_{A,m,k} is the
explicit expression of GSWZ equation (Ikdef): a prefactor built from the
exponential of V(t^m)/(m^2 log(1+x/zeta_m)), the square root of m^N
det(-Lambda(t^m)) times the product of the 1 - z_j^{1/m}, and products of
the quantities (1 - zeta_m^{k+l} z^{1/m})/(1 - zeta_m^{l+k}) raised to
explicit rational powers, times the formal Gaussian integral, against the
matrix Lambda(t) = -A - diag(z(t)/(1 - z(t))), of the product of the
regularised Pochhammer factors psi. The integrals are m-periodic in k, so
the sum makes sense, and the exponential prefactor is independent of k, so
the Gaussians are equi-peaked. -/
-- The regularised Pochhammer factor psi.
def fgiFactor : True := by sorry

-- It lies in the domain of the formal Gaussian integration.
theorem fgiFactor_mem : True := by sorry

-- The integral I_{A,m,k}.
def fgiIntegral : True := by sorry

-- The m-periodicity in k.
theorem fgiIntegral_periodic : True := by sorry

-- The collection Phi^FGI_{A,m}.
def fgiCollection : True := by sorry

-- The exponential prefactor is independent of k.
theorem fgiCollection_prefactor : True := by sorry

-- The refined pieces CS_{A,m,k} and their relation to the collection.
def fgiRefined : True := by sorry

example : True := by sorry -- unit test `m_one`: For m = 1 the collection is a single formal Gaussian integral.
example : True := by sorry -- unit test `periodicity`: I_{A,m,k} and I_{A,m,k+m e_j} agree.
example : True := by sorry -- unit test `critical_point`: The critical point of the exponent is the t-deformed solution.
example : True := by sorry -- unit test `refined_relation`: CS_{A,1,0}(t, zeta_{m}+x) equals the collection evaluated at t^{m}.

/-- fgi-coefficients-in-S: For every positive integer m, the logarithm of
Phi^FGI_{A,m}(t,x) lies in V^FGI(t)/(m^2 log(1+x/zeta_m)) minus half the
logarithm of delta^FGI(t) plus the logarithm of U^FGI_m(t) plus x times the
rationalised ring S^{(m)}, and moreover delta^FGI lies in S and m^{Nm}
(U^FGI_m)^{2m} lies in S^{(m)}. The proof of the last inclusion uses the
identity D_{zeta_m}(1)^{24m} = m^{12m}, which GSWZ deduce from the
multiplier system of the Dedekind eta function and which is proved here
directly: D_{zeta_m}(1)^m is the product over l from 1 to m-1 of (1 -
zeta_m^l)^l, and pairing l with m - l together with the product formula for
the (1 - zeta_m^l) gives its square as m^m times a sixth root of unity,
whence the twenty-fourth power is m^{12m}. -/
theorem FgiCoefficientsInS : True := by sorry

/-- q-difference-for-the-gaussian-collection: For each m and each residue class
k, the normalised refined piece t^k CS_{A,m,k}(t,q) satisfies the same
order-m linear q-difference system, with q-binomial coefficients, that the
congruence sum t^k F_{A,m,k}(t,q) satisfies. The proof is a change of
variables in the Gaussian integration: the integrals I_{A,mm',l} satisfy the
same first-order relations in l that the series satisfy in the congruence
class, and the q-binomial identity then assembles them into the order-m
equation. -/
theorem QDifferenceForTheGaussianCollection : True := by sorry

/-- identification-theorem: For every symmetric integral A, every positive
integer m and every residue class k, the congruence sum F_{A,m,k}(t^{1/m},q)
equals the refined Gaussian piece CS_{A,m,k}(t,q) as elements of the Laurent
series ring in x with power series coefficients in t, for q = zeta_{mm'} + x
and any m'. Summing over the classes gives Phi_A(t,q) = Phi^FGI_A(t,q),
which is GSWZ Theorem 3. Consequently the potential, the discriminant and
the constants computed from the admissible side agree with those computed
from the Gaussian side, and the potential lemma and its level m version
follow. -/
theorem IdentificationTheorem : True := by sorry

/-- wkb-algebraicity: There is a second, independent route to the algebraicity
of the coefficients, which does not use formal Gaussian integration: the WKB
method applied to the linear q-difference system. In rank one, writing the
solution as the exponential of a sum of c_k(t) h^k and studying the ratio
G(t;h) = F(e^h t;h)/F(t;h) written as z(t) times the exponential of a sum of
b_k(t) h^k, one proves that b_1 = A(A-1)X^2/2 and that b_k lies in X Delta
Q[X] for k at least 2, where X = (t/z) dz/dt and Delta = X(AX+1)((A-1)X+1);
integrating then gives c_k in X Q[X] for k at least 1. Hence every
coefficient of the expansion is an algebraic function of t. -/
theorem WkbAlgebraicity : True := by sorry

/-- potential-determines-the-matrix: If F_A is the q-hypergeometric series of a
symmetric integral A and V = V_A is its potential, then V determines A and
hence F_A. The proof is two identities: t_j times the partial derivative of
V with respect to t_j is log z_j(t), so V determines the t-deformed
solution; and the Hessian of V is minus A minus the diagonal matrix of
z/(1-z), so V determines A. -/
theorem PotentialDeterminesTheMatrix : True := by sorry

/-- acceptance-rank-one: The rank one case A = (3) is the layer's acceptance
case, and every convention of the layer is checked against it. The series
F(t,q) = sum_k (-1)^k q^{3k(k+1)/2} t^k/(q;q)_k satisfies F(t,q) - F(qt,q) +
q^3 t F(q^3 t,q) = 0; its Donaldson-Thomas exponents are non-negative and
supported in 3n+1 at most i at most n^2+n+1, with the exception c_{1,3} = 1;
the deformed solution of 1 - z = -t z^3 is 1 + t + 3t^2 + 12t^3 + 55t^4 +
...; the discriminant is 1 - 5t - 3t^2 - 10t^3 - ...; the potential is t +
5t^2/4 + 28t^3/9 + 165t^4/16 + ...; and the ratio G satisfies the Riccati
equation 1 - G(t,q) + q^3 t G(t,q)G(qt,q)G(q^2t,q) = 0, with the coefficient
of x^k in G(t,1+x) lying in delta^{-3k} Z[t^{pm 1},z]. The product identity
z(t) = product over n of (1-t^n)^{-n sum_i c_{n,i}} holds and proves that
the exponent of 1 - t^n in that product is divisible by n. -/
theorem AcceptanceRankOne : True := by sorry

/-! ## HB.9 Frobenius congruences and module membership -/

/-- p-adic-polylogarithm-integrality: Write Li_n^{(p)}(t) = Li_n(t) - p^{-n}
Li_n(t^p), the sum of t^k/k^n over the k prime to p. Then Li_n^{(p)}(t) lies
in the p-adic completion of the ring obtained from the integers by adjoining
t and the inverse of 1 - t. Consequently, for every prime p, the difference
log (t^p;q^p)_infinity - p log (t;q)_infinity lies in p/x times that
completed ring with x adjoined, for q = 1 + x; and for a root of unity zeta
different from 1 whose order is not a power of p, the corresponding function
of x is meromorphic on the unit disc with a simple pole at 0 and residue p
Li_2^{(p)}(zeta). -/
theorem PAdicPolylogarithmIntegrality : True := by sorry

/-- dwork-difference-for-the-gaussian-data: For all primes p and positive
integers m prime to p, the difference log CS_{A,m,k}(t^p,q^p) - p log
CS_{A,m,k}(t,q) lies in x^{-1} times the p-completed ring S^{(m)} with 1/p
and the m-th roots of z adjoined. The proof reduces to two statements: that
V(t^p)/p - p V(t) lies in p times the p-completion of S, and that the
analogous difference for delta^{-1} U_{m,k}^2 lies in p times the
p-completion of S^{(m)} with the m-th roots of z adjoined. Both are proved
by writing the Frobenius of z as z^p times the exponential of p times an
element of the completed ring and expanding the polylogarithms, using the
integrality of the p-th version of the polylogarithm at 1 - z. -/
theorem DworkDifferenceForTheGaussianData : True := by sorry

/-- frobenius-congruence: Fix a symmetric integral A, a positive integer m and a
residue class k in {0,...,m-1}^N. Then for every prime p with m prime to p,
log F_{A,m,k}(t^{p/m}, q^p) - p log F_{A,m,k}(t^{1/m}, q) lies in (p/x)
times the p-completion of S^{(m)} with the m-th roots of z adjoined, in the
power series ring in x, where q = zeta_m + x. This is GSWZ Theorem 4. It
combines two facts that are separately weaker: the level m admissible Dwork
lemma, which gives p-integrality but in the wrong ring, and the Gaussian
Dwork lemma, which gives membership in the right ring but with 1/p adjoined;
the intersection of the two is the statement, and proving that the
intersection is the smaller ring is the last step. -/
theorem FrobeniusCongruence : True := by sorry

/-- habiro-module-interface: The Habiro ring H_R of a number field, the modules
H_{R,xi} indexed by an element xi of the third K-group, the unit
epsilon_m(xi) attached to a root of unity of order m, and the restriction of
a collection to the roots of unity of order prime to Delta are constructed
by HabiroNumberFields HB.6 and HB.7 and are imported here. This layer uses
exactly four properties: the defining gluing condition for a section of the
module, the multiplicativity of epsilon_m against the additivity of the
p-adic regulator, the statement that the module with xi zero is the ring,
and the fact that the constant term of a section at an m-th root of unity
lies in the ring with epsilon_m^{1/m} adjoined. -/
theorem HabiroModuleInterface : True := by sorry

/-- constant-term-is-the-unit: For m prime to Delta, the constant term of the
expansion Phi_{A,z,m}(x) at the m-th root of unity is epsilon_m(xi)^{1/m}
times an element of the field K with the m-th roots of unity adjoined, where
xi is the Bloch class of the non-degenerate solution z. This is the point at
which the analytic and the arithmetic halves of the whole roadmap meet, and
it is not proved here: it follows from CGZ Theorem 1.6 together with its
equation (14) and from Hutchinson's comparison between the finite Chern
class and the cyclic quantum dilogarithm, both of which are owned by
HabiroNumberFields HB.1 and HB.2. -/
theorem ConstantTermIsTheUnit : True := by sorry

/-- gluing-by-uniqueness-of-q-difference-solutions: The gluing condition for the
collection attached to A is proved by a uniqueness argument. For a positive
integer gamma, consider the products of gamma shifted copies of the series
at q^gamma with one copy at q^{-1}, indexed by an integer vector and an
integer; they satisfy a system of gamma plus two q-difference equations,
which has a unique power series solution of the form 1 + O(t). Since both
the collection and its Frobenius twist satisfy the same system, they agree;
re-expanding at a root of unity of order divisible by p and specialising t =
1 then gives the gluing condition. The argument is written out for a one by
one matrix and asserted to be analogous in general. -/
theorem GluingByUniquenessOfQDifferenceSolutions : True := by sorry

/-- module-membership: Fix a symmetric integral matrix A and a non-degenerate
solution z of the Nahm equations with associated Bloch class xi. Then the
collection Phi_{A,z}, obtained from the collection of A by specialising t =
1 and removing the principal part of the logarithm, lies in the module
H_{R[delta^{-1/2}],xi} restricted to the roots of unity of order prime to
Delta. This is GSWZ Theorem 5. All four hypotheses are load-bearing: non-
degeneracy, the adjunction of the inverse square root of the discriminant,
the restriction to orders prime to Delta, and the indexing of the module by
the Bloch class of the chosen solution. -/
theorem ModuleMembership : True := by sorry

/-- symmetrisation-and-torsion-corollaries: Three consequences. First, the
constant term of the expansion at an m-th root of unity of order prime to
Delta lies in R with the root of unity adjoined; for the matrix of the 4_1
knot this is the integrality of an explicit finite sum, which seems hard to
prove directly. Second, the product of the collection with its image under q
to q^{-1} lies in the Habiro ring, and if r xi vanishes in the third K-group
then the r-th power of the collection lies in the Habiro ring of the ring
with the inverse square root of the discriminant. Third, an orbit of the
Nahm equations is Bloch-torsion exactly when the 2r-th power of the
collection lies in the Habiro ring, where r is the order of the torsion
element; the forward direction is the second statement and the converse
follows from the fact that the vanishing of the Bloch-Wigner dilogarithms at
all complex embeddings forces torsion, or from the triviality of the unit
for all but finitely many m. -/
theorem SymmetrisationAndTorsionCorollaries : True := by sorry

/-- descendants-by-specialisation: Specialising t = q^nu, that is t_j = q^{nu_j}
for an integer vector nu, defines a collection Phi_{A,z,nu} which again lies
in the module over the ring with the inverse square root of the
discriminant, restricted to the orders prime to Delta. The proof is the same
as for the specialisation t = 1 and is omitted by the source. These are the
descendants, and they multiply the supply of explicit elements of the Habiro
modules: for a fixed A and z one obtains a family indexed by the integer
vectors nu, whose span is expected to be large inside the module. -/
-- The collection Phi_{A,z,nu} for an integer vector nu.
def descendant : True := by sorry

-- The descendant at nu = 0 is the original collection.
theorem descendant_zero : True := by sorry

-- Every descendant lies in the restricted module.
theorem descendant_mem : True := by sorry

-- The family of descendants indexed by the integer vectors.
def descendant_family : True := by sorry

-- The number of independent descendants is bounded by the holonomic rank of the q-holonomic module of the Nahm sum.
theorem descendant_holonomic_rank : True := by sorry

example : True := by sorry -- unit test `nu_zero`: The descendant at nu = 0 is the collection itself.
example : True := by sorry -- unit test `quartic_descendants`: For the 60-torsion example the descendants for eight values of nu exhibit the same Delta-integrality.
example : True := by sorry -- unit test `membership`: Every descendant lies in the restricted module over the ring with the inverse square root of the discriminant.
example : True := by sorry -- unit test `rank_bound`: For the 60-torsion example the holonomic rank is 8, so eight descendants suffice.

/-- p-adic-regulator-input: The arithmetic side of the layer rests on three
imported statements about the p-adic regulator, all proved in GSWZ Section
3.1 and owned jointly with PadicHodgeRegulators and HabiroNumberFields.
First, if z is a unit of the p-completed ring with |z - 1| at least 1 then
D_p(z) lies in p^2 times that ring, where D_p is Coleman's p-adic
dilogarithm corrected by half the product of the logarithms. Second, the
span over the p-adic integers of the values p^{-2} D_p(zeta) at the roots of
unity of the unramified extension of degree s is the whole ring of integers
of that extension; the proof is a counting argument with the finite
polylogarithm of Kontsevich. Third, for p > 3 the map D_p is an isomorphism
from the p-adic K-theory of the local field onto p^2 times its ring of
integers, and that K-group is generated by the classes of roots of unity. -/
theorem PAdicRegulatorInput : True := by sorry

/-- hypotheses-that-cannot-be-dropped: Four hypotheses of GSWZ Theorem 5 change
the statement if dropped, and each is recorded here with what goes wrong.
Non-degeneracy: without it the discriminant vanishes, the ring with its
inverse square root is the zero ring, and the Frobenius congruence has no
content. The square root of the discriminant: the source states the theorem
over R[delta^{-1/2}] and records that the element lies in the minus-one
eigenspace of the involution, so the extension is not cosmetic. The
restriction to orders prime to Delta: GSWZ say the unrestricted statement is
probably true and follows if the comparison theorem of CGZ holds for every
m, which is not known. The indexing by the Bloch class: the module depends
on xi, and the theorem is false with xi replaced by zero unless the class is
torsion, which is the content of the corollary. -/
theorem HypothesesThatCannotBeDropped : True := by sorry

/-- verifying-the-defining-conditions: The modules of HabiroNumberFields HB.7
are defined by two conditions on a collection of power series: an
integrality and gluing condition relating the Frobenius twist of the
collection to its p-th power, and a condition relating the constant terms to
the unit of the class. GSWZ Section 3.2 supplies the tools that verify them
and constructs explicit local sections. The tools are: a variant of Dwork's
lemma, saying that a series with constant term one and coefficients in the
field is integral exactly when the Frobenius-twisted ratio is congruent to
one modulo p times the variable; a corollary applying it to the exponential
of a collection satisfying the displayed congruence; a lemma producing, for
each m prime to p, a unique p-adic exponent correcting the collection so
that the sigma-gluing holds for every p-adic unit sigma; and the resulting
uniqueness of the lift of an invertible section to all roots of unity. The
explicit local sections are built from the infinite Pochhammer symbol alone,
with constant term the unit. -/
theorem VerifyingTheDefiningConditions : True := by sorry

/-! ## HB.10 Explicit examples and boundaries -/

/-- symmetrisation-and-residue-formula: For a symmetric integral matrix A
consider the auxiliary sum J_A(t,w,q) over the non-negative integer vectors
of (-q^{1/2})^{n^t A n} q^{diag(A).n/2} w^{An} t^n divided by (qw;q)_n.
Expanded at q = zeta_m + x it lies in an explicit localisation of the
Laurent polynomial ring in w over the m-th cyclotomic integers, with
denominators only the 1 - t_i^m P_i(w^m), where P_i(z) = (-1)^{A_ii} (1 -
z_i)^{-1} product_j z_j^{A_ij}. Define Psi_{A,m}(t,x) as the sum of the
residues of t^{-1/m} J_A(t^{1/m},w,zeta_m+x) dw/w over the w with w^m = z,
where z runs over the solutions of t_i P_i(z) = 1. Then Psi_A(t,q) equals
the symmetrisation Phi_A(t,q) Phi_A(t,q^{-1}), and in particular that
symmetrisation has integral coefficients in the m-th cyclotomic integers. -/
theorem SymmetrisationAndResidueFormula : True := by sorry

/-- descendant-elements-of-the-habiro-ring: Specialise t = 1 and assume that the
equations t_i P_i(z) = 1 define a reduced zero-dimensional scheme over the
rationals; fix one solution z, which generates a number field K, and write
Psi_{A,mu,nu,z} for the corresponding collection. Then Psi_{A,mu,nu,z} lies
in the Habiro ring H_R for all integer vectors mu and nu. This follows by
combining the identification theorem, the symmetrisation theorem and the
module membership: the symmetrisation is indexed by the zero class, so it
lands in the ring and not merely in a module. -/
theorem DescendantElementsOfTheHabiroRing : True := by sorry

/-- cubic-example: For the rank one matrix A = (3) the auxiliary sum is J(t,w,q)
= sum_k (-1)^k q^{3k(k+1)/2} w^{3k} t^k/(qw;q)_k. Expanding at q = 1 + x
gives an explicit rational function of w and t at each order, whose first
three terms the source displays, and the residue formula gives Psi_1(t,x)
with the displayed first coefficients. Specialising t = 1 produces the
element of the Habiro ring of R = Z[z,1/23], where z^3 - z + 1 = 0 generates
the cubic field of discriminant -23, with expansion (2z^2 + 3z - 9)/23 +
((-6477 z^2 - 5311 z + 4318)/23^4) x^2 + O(x^3), and the discriminant is
delta = -2t - t/(1-z) = -t z^2 - t z + (-3t+1). -/
theorem CubicExample : True := by sorry

/-- nonabelian-quartic-example: For A = (8 5; 5 4), symmetric positive definite,
the Nahm equations 1 - z_1 = z_1^8 z_2^5 and 1 - z_2 = z_1^5 z_2^4 have
eight solutions in two Galois orbits over two quartic fields, one given by
z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1 = 0 with z_2 = (-9 z_1^3 - 6 z_1^2 - 25
z_1 + 37)/5, the other by z_1^4 - z_1^3 + 3 z_1^2 - 3 z_1 + 1 = 0 with z_2 =
z_1^3 + 3 z_1. The distinguished solution is (0.88483..., 0.78939...) in the
real embedding of the first field, which has signature (2,1) and
discriminant -5^2 times 19; its Bloch class is 60-torsion, and the
corresponding series raised to the sixtieth power lies in the Habiro ring of
the ring of integers with 5 and 19 inverted, conjecturally, and provably
after inverting 6. The class attached to the second quartic field is not
torsion and its series exhibits no integrality. -/
theorem NonabelianQuarticExample : True := by sorry

/-- knot-matrices-and-the-topological-boundary: Three formal Nahm data reproduce
the perturbative series of the three simplest hyperbolic knots: A = (1 1; 1
1) for the figure-eight knot, A = (2 1 1; 1 1 0; 1 0 1) for the knot 5_2,
and A = (1 0 1; 0 1 2; 1 2 4) for the (-2,3,7) pretzel knot. More generally,
from a triangulation with Neumann-Zagier matrices (A|B) such that B inverse
times A is integral, one takes A_Nahm = I - B^{-1}A. What the theorems of
this roadmap give for these data is membership of an explicit series in an
explicit Habiro module. They do NOT give that the series is a topological
invariant of the knot, that it is independent of the triangulation, that it
computes a Chern-Simons quantity, or that the knot invariant is quantum
modular; each of those is a separate theorem with its own source, and none
is planned here. -/
theorem KnotMatricesAndTheTopologicalBoundary : True := by sorry

/-- p-adic-computations-example: The p-adic side of the examples is computed by
Hensel lifting: if xi generates K with minimal polynomial P and p is
unramified, then lifting the factorisation of P modulo p lifts the Frobenius
of the residue field to an automorphism of the p-completion of R, and the
lifting is constructive. The source uses this to compute the Frobenius
endomorphism explicitly and to check the gluing conditions numerically, and
gives a worked example illustrating the isomorphism between the p-adic
K-theory of a local field and p^2 times its ring of integers. -/
theorem PAdicComputationsExample : True := by sorry

/-- modularity-examples-and-their-lesson: Two examples show what modularity
contributes. The quadratic Gauss sum gives the collection F_m = (sum over k
modulo m of zeta_m^{k^2})(sum over k of zeta_m^{-k^2})/m, which equals 1 for
m congruent to 1 or 3 modulo 4, 0 for m congruent to 2 and 2 for m divisible
by 4, and is an almost trivial element of the Habiro ring with 2 inverted;
the variant with a fourth root of unity gives a slightly less trivial
element over the ring with i and 1/2. The Rogers-Ramanujan example is
genuinely arithmetic: the function J(z,q), a one-variable deformation, has
the property that its expansion at zeta_m lies in an explicit localisation,
and the residues over the m-th roots of the golden-ratio unit give constants
F_m(u) in the field generated by the square root of 5 and the m-th roots of
unity, whose first values the source lists. -/
theorem ModularityExamplesAndTheirLesson : True := by sorry

/-- export-interfaces-and-non-consequences: The objects this roadmap produces
and exports are: the coefficient rings S, S^{(m)} and their specialisations;
the collections attached to a formal Nahm datum and a non-degenerate
solution, with their descendants; the Frobenius congruence; the Bloch class
and its order; and the explicit identities checked in the examples. They are
consumed by HabiroRings HR.6, which is the coefficient and cohomology
interface, and by HabiroCohomologyFoundations HQ.5 to HQ.8. What does NOT
follow, and must be proved by its owner with its own foundations, is: the
q-Hodge complex, the crystalline, A-inf and prismatic comparisons, and any
Fargues-Fontaine geometry; and in particular membership of a series in a
K-three-indexed Habiro module does not by itself produce a cohomology class
on an arbitrary scheme. -/
theorem ExportInterfacesAndNonConsequences : True := by sorry

/-- knot-series-pair-example: The knots 5_2 and the (-2,3,7)-pretzel knot have
the same cubic trace field, generated by a root of alpha^3 - alpha^2 + 1 =
0, and are scissors congruent, so their Bloch classes agree modulo
6-torsion; nevertheless no relation between their series was found. Their
series can be computed in three ways: from the Kashaev invariant
numerically, from the associated q-series numerically, or exactly by formal
Gaussian integration, the last of which produces four hundred coefficients.
The product of the series of 5_2 with the series of the pretzel knot
evaluated at minus x/(1+x), that is with q inverted, has denominators only
at 2 and 23, the denominator of the coefficient of x^400 being 2^1997 times
23^581, and its constant term is the product of the inverse square roots of
the two delta invariants, namely 1 over the square root of 2 times (2
alpha^2 - 2 alpha + 3). The two series are nevertheless genuinely different:
the coefficients of the 5_2 series see only the cubic field, while those of
the pretzel knot see in addition the real cyclotomic field of discriminant
49, so even the ranks of the two etale algebras differ. -/
theorem KnotSeriesPairExample : True := by sorry

end TauCeti.NahmSeries
