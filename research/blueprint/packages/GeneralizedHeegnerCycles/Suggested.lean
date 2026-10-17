import Mathlib

/-!
# Generalized Heegner cycles: representative target signatures

The roadmap is README.md. This file records only light definitions and theorem
signatures statable against the pinned APIs; it is not exhaustive. It fixes
inverse unit-root normalization, the critical twist, first-conductor units,
uniform integral denominators, conductor-kernel cancellation, and regulator
descent. Algebraic transport statements do not construct geometric cycles,
continuous cohomology, local regulators, or arithmetic comparison maps.
-/

namespace TauCetiRoadmap.GeneralizedHeegnerCycles

noncomputable section
open scoped BigOperators

/-! ## Layer GH.0: CM geometry and coefficient realizations -/

section DifferentialNormalization
variable {F D : Type*} [Field F] [AddCommGroup D] [Module F D]

/-- Normalize a specified vector by its pairing with the holomorphic vector.
The geometric application separately supplies the conjugate CM eigenline. -/
def CMCurve.etaOfOmega (b : D →ₗ[F] D →ₗ[F] F) (ω η : D) : D :=
  (b ω η)⁻¹ • η

/-- Nonzero pairing gives the unique normalized vector on the specified line. -/
theorem CMCurve.etaOfOmega_spec (b : D →ₗ[F] D →ₗ[F] F) (ω η : D)
    (h : b ω η ≠ 0) :
    b ω (CMCurve.etaOfOmega b ω η) = 1 ∧
      ∀ a : F, b ω (a • η) = 1 → a • η = CMCurve.etaOfOmega b ω η := by
  sorry

example (b : D →ₗ[F] D →ₗ[F] F) (ω η : D) (h : b ω η = 1) :
    CMCurve.etaOfOmega b ω η = η := by
  sorry

example (b : D →ₗ[F] D →ₗ[F] F) (ω η : D) (h : b ω η = 0) :
    CMCurve.etaOfOmega b ω η = 0 := by
  sorry

-- A pairing value of 2 gives the inverse normalization, not multiplication by 2.
example (b : ℚ →ₗ[ℚ] ℚ →ₗ[ℚ] ℚ) (h : b 2 1 = 2) :
    CMCurve.etaOfOmega b 2 1 = 1 / 2 := by
  sorry
end DifferentialNormalization

/-! ## Layer GH.1: cycles and Abel–Jacobi classes -/

-- Weight-two divisors use point minus cusp, with no averaging factor.
example : (3 : ℚ) - 1 = 2 ∧ (1 : ℚ) - 3 ≠ 2 := by
  sorry

/-! ## Layer GH.2: norm relations and local conditions -/

-- Their geometric and continuous-cohomological carriers are specified in README.md.

/-! ## Layer GH.3: ordinary stabilization and norm-compatible systems -/

section OrdinaryNormalization
variable {F D : Type*} [Field F] [AddCommGroup D] [Module F D]

/-- Positive-conductor stabilization at weight 2r. Arithmetic use requires r≥1
and alpha an ordinary unit root, not merely an arbitrary nonzero scalar. -/
def stabilizedClass (p α : F) (r : ℕ) (z predecessor : D) : D :=
  z - (p ^ (2 * r - 2) / α) • predecessor

/-- Inverse powers turn an alpha-eigen trace relation into a norm relation. -/
def iwasawaClass (α : F) (z : ℕ → D) : ℕ → D :=
  fun n => (α⁻¹) ^ n • z n

/-- Algebraic normalization of an already established positive-level trace. -/
theorem iwasawaClass_trace (α : F) (hα : α ≠ 0)
    (z : ℕ → D) (cor : ℕ → Module.End F D)
    (htrace : ∀ n, cor n (z (n + 1)) = α • z n) (n : ℕ) :
    cor n (iwasawaClass α z (n + 1)) = iwasawaClass α z n := by
  sorry

example : stabilizedClass (5 : ℚ) 2 1 (3 : ℚ) 4 = 1 := by
  sorry

example (p α : F) (r : ℕ) (z : D) : stabilizedClass p α r z 0 = z := by
  sorry

example : iwasawaClass (2 : ℚ) (fun _ => (1 : ℚ)) 1 = 1 / 2 := by
  sorry

example (α : F) (z : ℕ → D) : iwasawaClass α z 0 = z 0 := by
  sorry
end OrdinaryNormalization

/-! ## Layer GH.4: explicit reciprocity -/

/-- Rescaling omega by a rescales omega^j eta^(m-j) by a^(2j-m).
Its squared evaluation therefore uses twice that exponent, including negative j. -/
theorem cm_differential_squared_scaling {F : Type*} [Field F]
    (a value : F) (ha : a ≠ 0) (m j : ℤ) :
    (a ^ (2 * j - m) * value) ^ 2 = a ^ (2 * (2 * j - m)) * value ^ 2 := by
  sorry

example : (2 : ℚ) ^ (2 * (0 : ℤ) - 2) = 1 / 4 ∧
    ((2 : ℚ) ^ (2 * (0 : ℤ) - 2)) ^ 2 = 1 / 16 := by
  sorry

/-! ## Layer GH.5: Kolyvagin descent -/

section Correction
variable {F D : Type*} [Field F] [AddCommGroup D] [Module F D]

/-- Undo the chosen nonzero correction scalar. Integral descent requires a unit
and a separately proved finite–singular compatibility, not just field inversion. -/
def correctedKolyvaginClass (u : F) (raw : D) : D := u⁻¹ • raw

/-- Simultaneously rescaling the correction and raw class preserves the result. -/
theorem correctedKolyvaginClass_rescale (u a : F) (hu : u ≠ 0) (ha : a ≠ 0)
    (raw : D) :
    correctedKolyvaginClass (a * u) (a • raw) = correctedKolyvaginClass u raw := by
  sorry

example : correctedKolyvaginClass (2 : ℚ) (6 : ℚ) = 3 := by
  sorry

example : correctedKolyvaginClass (-1 : ℚ) (3 : ℚ) = -3 := by
  sorry

-- Zero is outside the arithmetic correction domain and loses a nonzero raw class.
example : correctedKolyvaginClass (0 : ℚ) (3 : ℚ) = 0 ∧ (3 : ℚ) ≠ 0 := by
  sorry
end Correction

/-! ## Layer GH.6: Selmer consequences -/

-- Rank, torsion and characteristic-ideal conclusions use the arithmetic carriers
-- and source-qualified local conditions in README.md.

/-! ## Layer GH.7: ordinary families and regulator comparison -/

section CriticalTwist
variable {G A : Type*} [Monoid G] [CommGroup A]

/-- The critical twist retains both inverse characters. -/
def criticalTwist (Θ ξ : G →* A) : G →* A := Θ⁻¹ * ξ⁻¹

/-- Twisting changes the determinant by the square of the twisting character;
self-duality also requires the specified nebentypus/finite-character identity. -/
theorem criticalTwist_determinant (δ εf Θ εcyc ξ : G →* A)
    (hδ : δ = εf * Θ ^ 2 * εcyc) :
    δ * criticalTwist Θ ξ ^ 2 = εf * εcyc * (ξ⁻¹) ^ 2 := by
  sorry

example (Θ : G →* A) : criticalTwist Θ 1 = Θ⁻¹ := by
  sorry

example (Θ : G →* A) : criticalTwist Θ Θ⁻¹ = 1 := by
  sorry

-- The nebentypus factor remains even when the square of Theta cancels.
example : (-1 : ℚ) * 2 ^ 2 * (2⁻¹ : ℚ) ^ 2 = -1 := by
  sorry
end CriticalTwist

section HowardNormalization
variable {F D : Type*} [Field F] [AddCommGroup D] [Module F D]

/-- Howard's tower is normalized by U_p^(1-t), including t=0. -/
def howardTowerClass (Up : F) (X : ℕ → D) (t : ℕ) : D :=
  Up ^ (1 - (t : ℤ)) • X t

/-- Normalization of the already proved degeneracy trace. -/
theorem howardTowerClass_trace (Up : F) (hUp : Up ≠ 0)
    (X : ℕ → D) (cor : ℕ → Module.End F D)
    (htrace : ∀ t, cor t (X (t + 1)) = Up • X t) (t : ℕ) :
    cor t (howardTowerClass Up X (t + 1)) = howardTowerClass Up X t := by
  sorry

example (Up : F) (X : ℕ → D) : howardTowerClass Up X 0 = Up • X 0 := by
  sorry

example (X : ℕ → ℚ) : howardTowerClass (2 : ℚ) X 2 = (1 / 2 : ℚ) • X 2 := by
  sorry
end HowardNormalization

/-! ## Layer GH.8: weight-two and integral comparison -/

section InitialConductor
variable {F M₀ M₁ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]

/-- The normalized initial Euler factor forced by the raw trace and degree.
The letters p, u and d here are scalars. The arithmetic application must separately
identify u with its geometric multiplicity, and d with the actual first degree. -/
theorem initial_corestriction_comparison
    (res : M₀ →ₗ[F] M₁) (cor : M₁ →ₗ[F] M₀)
    (σ τ : Module.End F M₀) (x₀ : M₀) (x₁ : M₁)
    (α a p u d : F) (hα : α ≠ 0) (hu : u ≠ 0)
    (hroot : α ^ 2 - a * α + p = 0) (hdegree : u * d = p - 1)
    (htrace : u • cor x₁ = a • x₀ - σ x₀ - τ x₀)
    (hcorres : cor (res x₀) = d • x₀) (hinv : σ (τ x₀) = x₀) :
    cor (α⁻¹ • (x₁ - α⁻¹ • res x₀)) =
      u⁻¹ • ((x₀ - α⁻¹ • τ x₀) - α⁻¹ • σ (x₀ - α⁻¹ • τ x₀)) := by
  sorry

/-- Changing the bottom alone is not a global renormalization of a nonzero tower. -/
theorem initial_only_rescaling_obstruction
    (cor : M₁ →ₗ[F] M₀) (y₁ : M₁) (y₀ : M₀) (h : cor y₁ = y₀)
    (hy : y₀ ≠ 0) (t : F) (ht : t ≠ 1) : cor y₁ ≠ t • y₀ := by
  sorry

-- Exact scalar model, not an asserted elliptic-curve Fourier coefficient:
-- p=5, alpha=2, a=9/2, u=1, d=4, sigma=tau=id, x0=1, cor=id.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) =
    (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry

-- Replacing u=1 by the full unit count 2 changes only the predicted bottom.
example : (2 : ℚ)⁻¹ * ((5 / 2 : ℚ) - (2 : ℚ)⁻¹ * 4) ≠
    (2 : ℚ)⁻¹ * (1 - (2 : ℚ)⁻¹) ^ 2 := by
  sorry

-- In contrast, a uniform rescaling of the entire system is compatible.
example (cor : M₁ →ₗ[F] M₀) (y₁ : M₁) (y₀ : M₀) (h : cor y₁ = y₀) (t : F) :
    cor (t • y₁) = t • y₀ := by
  sorry
end InitialConductor

section UniformComparison
variable {R : Type*} [CommRing R]
variable {M N : ℕ → Type*}
  [∀ n, AddCommGroup (M n)] [∀ n, Module R (M n)]
  [∀ n, AddCommGroup (N n)] [∀ n, Module R (N n)]

/-- The kernel bound holds for every sequence, hence for compatible sequences.
There is one common scalar d. No inverse-limit exactness is used. -/
theorem uniform_coherent_kernel_bound
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hgf : ∀ n x, g n (f n x) = d • x)
    (x : ∀ n, M n) (hx : ∀ n, f n (x n) = 0) :
    ∀ n, d • x n = 0 := by
  sorry

/-- A compatible backward comparison lifts d times every compatible sequence.
The explicit witness is g_n(y_n); no new Iwasawa carrier is introduced. -/
theorem uniform_coherent_lift
    (μ : ∀ n, M (n + 1) →ₗ[R] M n)
    (ν : ∀ n, N (n + 1) →ₗ[R] N n)
    (f : ∀ n, M n →ₗ[R] N n) (g : ∀ n, N n →ₗ[R] M n) (d : R)
    (hfg : ∀ n y, f n (g n y) = d • y)
    (hg : ∀ n y, μ n (g (n + 1) y) = g n (ν n y))
    (y : ∀ n, N n) (hy : ∀ n, ν n (y (n + 1)) = y n) :
    ∃ x : ∀ n, M n,
      (∀ n, μ n (x (n + 1)) = x n) ∧ (∀ n, f n (x n) = d • y n) := by
  sorry

-- A nonunit uniform denominator need not give an integral isomorphism.
example : ¬ ∃ x : ℤ, 2 * x = 1 := by
  sorry

-- The multiple, rather than every element itself, is lifted integrally.
example (y : ℤ) : ∃ x : ℤ, 2 * x = 2 * y := by
  sorry
end UniformComparison

section UnboundedDenominators
/-- The integral inverse system Z <-[2]- Z <-[2]- ... has only the zero section. -/
theorem doubling_tower_zero (x : ℕ → ℤ) (h : ∀ n, x n = 2 * x (n + 1)) :
    ∀ n, x n = 0 := by
  sorry

-- The level maps f_n=2^n are natural from that tower to the constant tower.
example (n : ℕ) (x : ℤ) : (2 : ℤ) ^ n * (2 * x) = 2 ^ (n + 1) * x := by
  sorry

-- Every level map is surjective over Q (and is also injective).
example (n : ℕ) (y : ℚ) : ∃ x : ℚ, (2 : ℚ) ^ n * x = y := by
  sorry

-- Nevertheless the constant integral section 1 has no coherent preimage.
example : ¬ ∃ x : ℕ → ℤ,
    (∀ n, x n = 2 * x (n + 1)) ∧ (∀ n, (2 : ℤ) ^ n * x n = 1) := by
  sorry
end UnboundedDenominators


section RegulatorDescentChecks
variable {R M N : Type*} [CommRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

-- Existing quotient algebra: an exact preimage identity is sufficient.
-- In the arithmetic application, the source/target coefficient submodules
-- and this identity must be supplied by the actual regulator construction.
example (P : Submodule R M) (Q : Submodule R N) (f : M →ₗ[R] N)
    (h : P ≤ Q.comap f) (hpreimage : Q.comap f = P) :
    Function.Injective (P.mapQ Q f h) := by
  sorry

-- Multiplication by X is injective over Q[X], but its reduction at X=0
-- is zero on the nonzero quotient Q[X]/(X), identified by constant coefficient.
example : Function.Injective (fun f : Polynomial ℚ => Polynomial.X * f) ∧
    (∀ f : Polynomial ℚ, (Polynomial.X * f).coeff 0 = 0) ∧
    (1 : Polynomial ℚ).coeff 0 ≠ 0 := by
  sorry

-- A scalar projection can lose information on a two-dimensional space.
example : ¬ Function.Injective (LinearMap.fst ℚ ℚ ℚ) := by
  sorry

-- A specified identification with a line and a nonzero functional do suffice.
example {F V : Type*} [Field F] [AddCommGroup V] [Module F V]
    (e : V ≃ₗ[F] F) (ell : Module.Dual F V) (hell : ell ≠ 0) :
    Function.Injective ell := by
  sorry
end RegulatorDescentChecks



section PrimitiveCharacters
variable {G R M N : Type*} [CommGroup G] [Fintype G]
  [CommRing R] [IsDomain R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- The source-specific stabilization comparison is integral and requires
nontriviality on the last conductor kernel. The proof first uses the existing
scalar character-sum theorem on H, then sums over cosets. It never cancels a
nonzero scalar in M; M is allowed to have torsion.

For the arithmetic application c=alpha^(-n), beta=alpha^(-1), n>=1.
The actual cohomological specialization and conductor-kernel map are separate
GH.3 comparisons with the actual HE.0 conductor fields and actions. -/
theorem primitive_character_stabilization
    (H : Subgroup G) (chi : G →* R)
    (hchi : ∃ h : H, chi (h : G) ≠ 1)
    (q : M →ₗ[R] N) (a b : G → M) (beta c : R)
    (hb : ∀ (g : G) (h : H), b (g * (h : G)) = b g) :
    q (c • ∑ g : G, chi g • (a g - beta • b g)) =
      c • ∑ g : G, chi g • q (a g) := by
  sorry
end PrimitiveCharacters

section PrimitiveCharacterTests
-- C2, the sign character, and a constant lower-conductor value.
example (x : ℤ) : (∑ g : Fin 2, (-1 : ℤ) ^ g.val * x) = 0 := by
  sorry

-- Cancellation is already coefficientwise over Z; a torsion module is allowed.
example (x : ZMod 8) : (1 : ℤ) • x + (-1 : ℤ) • x = 0 := by
  sorry

-- C4, H={0,2}: chi(g)=(-1)^g is nontrivial on G, but trivial on H.
-- The H-invariant lower function b(g)=(-1)^g does not cancel.
example : (∑ g : Fin 4, (-1 : ℤ) ^ g.val * (-1 : ℤ) ^ g.val) = 4 := by
  sorry

-- The domain condition is not dispensable: 3 is a nontrivial order-2 unit
-- modulo 8, but its scalar character sum is 1+3=4, not zero.
example : (3 : ZMod 8) ^ 2 = 1 ∧ (3 : ZMod 8) ≠ 1 ∧
    (1 : ZMod 8) + 3 ≠ 0 := by
  sorry

-- An exact-conductor last-kernel model: C9, H={0,3,6}, coefficients F19.
example : (4 : ZMod 19) ^ 9 = 1 ∧ (4 : ZMod 19) ^ 3 ≠ 1 ∧
    (∑ h : Fin 3, (4 : ZMod 19) ^ (3 * h.val)) = 0 := by
  sorry

-- The alpha^(-n) normalization survives cancellation.
example (n : ℕ) :
    (2 : ℚ)⁻¹ ^ n * ((5 - (2 : ℚ)⁻¹ * 3) - (1 - (2 : ℚ)⁻¹ * 3)) =
      (2 : ℚ)⁻¹ ^ n * 4 := by
  sorry
end PrimitiveCharacterTests

section BottomFromTail
variable {R M₀ M₁ N₀ N₁ : Type*} [CommRing R]
  [AddCommGroup M₀] [Module R M₀] [AddCommGroup M₁] [Module R M₁]
  [AddCommGroup N₀] [Module R N₀] [AddCommGroup N₁] [Module R N₁]

-- The first-transition square determines the bottom from the positive tail.
-- Once the actual first-transition square exists, equality of positive tails
-- forces equality of their compatible bottoms, irrespective of injectivity.
example (mu : M₁ →ₗ[R] M₀) (nu : N₁ →ₗ[R] N₀)
    (q₀ : M₀ →ₗ[R] N₀) (q₁ : M₁ →ₗ[R] N₁)
    (hsquare : q₀.comp mu = nu.comp q₁)
    (x₀ : M₀) (x₁ : M₁) (y₀ : N₀) (y₁ : N₁)
    (hx : mu x₁ = x₀) (hy : nu y₁ = y₀) (hcomp : q₁ x₁ = y₁) :
    q₀ x₀ = y₀ := by
  sorry
end BottomFromTail


/-! Algebraic components of the retained arithmetic targets. -/
section PositiveTrace
variable {F M₀ M₁ M₂ : Type*} [Field F]
  [AddCommGroup M₀] [Module F M₀] [AddCommGroup M₁] [Module F M₁]
  [AddCommGroup M₂] [Module F M₂]

/-- Component of positive-tail-corestriction. The actual arithmetic application
must prove both trace inputs at repeated positive conductor, of degree p.
The exponent here represents the transition from levels n+2 to n+1. -/
theorem positive_trace_normalization
    (cor : M₂ →ₗ[F] M₁) (res₁ : M₀ →ₗ[F] M₁) (res₂ : M₁ →ₗ[F] M₂)
    (x₀ : M₀) (x₁ : M₁) (x₂ : M₂) (alpha a p : F) (n : ℕ)
    (halpha : alpha ≠ 0) (hroot : alpha ^ 2 - a * alpha + p = 0)
    (htrace : cor x₂ = a • x₁ - res₁ x₀)
    (hdegree : cor (res₂ x₁) = p • x₁) :
    cor ((alpha ^ (n + 2))⁻¹ • (x₂ - alpha⁻¹ • res₂ x₁)) =
      (alpha ^ (n + 1))⁻¹ • (x₁ - alpha⁻¹ • res₁ x₀) := by
  sorry
end PositiveTrace

section SquaredDifferential
variable {F : Type*} [Field F]

/-- Component of differential-evaluation: solving log = c * AJ before squaring
uses two inverse powers of c. This algebra does not prove local realization or
base change of the arithmetic logarithm at a ramified conductor field. -/
theorem differential_squared_transport (AJ log c : F) (hc : c ≠ 0)
    (h : log = c * AJ) : AJ ^ 2 = c⁻¹ ^ 2 * log ^ 2 := by
  sorry

-- The comparison scalar 3 contributes 1/9 to a squared logarithm formula.
example : (3 : ℚ)⁻¹ ^ 2 * 6 ^ 2 = 2 ^ 2 := by
  sorry

-- A single inverse power gives the wrong value.
example : (3 : ℚ)⁻¹ * 6 ^ 2 ≠ 2 ^ 2 := by
  sorry

-- Nonzero c is required: a zero logarithm loses the Abel--Jacobi value.
example : (1 : ℚ) ^ 2 ≠ (0 : ℚ)⁻¹ ^ 2 * 0 ^ 2 := by
  sorry
end SquaredDifferential

section ReciprocityTransport
variable {R S M N : Type*} [CommRing R] [CommRing S]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-- Algebraic component of weight-two-reciprocity. The arithmetic target must
construct q and the functional relation from the modular quotient, crystalline
duality and the CM/Tate-period maps; this component does not construct them. -/
theorem differential_reciprocity_transport
    (q : M →ₗ[R] N) (ellE : Module.Dual R N) (ellf : Module.Dual R M)
    (c L sigma : R) (x : M) (hdiff : q.dualMap ellE = c • ellf)
    (hrec : ellf x = -L * sigma) : ellE (q x) = -c * L * sigma := by
  sorry

/-- Component of both consumer exports: exact scalar identities transfer along
an existing coefficient homomorphism. No characteristic-ideal base change follows. -/
theorem coefficient_reciprocity_transport (rho : R →+* S)
    (A c L sigma : R) (hrec : A = -c * L * sigma) :
    rho A = -rho c * rho L * rho sigma := by
  sorry

/-- Diagnostic for automorphic-reciprocity-export: a homomorphism from a ring
where lambda has a specified inverse cannot send lambda to zero. -/
theorem specialization_of_inverse_ne_zero [Nontrivial S] (rho : R →+* S)
    (lambda invlambda : R) (hinv : lambda * invlambda = 1) : rho lambda ≠ 0 := by
  sorry

-- Dropping the group-like factor changes a character evaluation.
example (L : ℚ) (hL : L ≠ 0) : -L * (-1) ≠ -L * 1 := by
  sorry

-- Elliptic differential scaling must multiply the scalar reciprocity value.
example : -(3 : ℚ) * 5 * (-1) = 15 := by
  sorry

-- c0^{r-1} is one at weight two; the explicit minus sign remains.
example (c₀ : ℚ) : -(c₀ ^ (1 - 1 : ℕ)) = -1 := by
  sorry

-- A zero image of a nonunit coefficient loses all nonvanishing information.
example : ((-(2 : ℤ) * 3 * 1 : ℤ) : ZMod 2) = 0 := by
  sorry

-- A nonzero multiplier is insufficient for the integral leading-class comparison.
example : ¬ IsUnit (5 : ℤ) := by
  sorry
end ReciprocityTransport


/-
Further README definitions require geometric, analytic or arithmetic carriers:
GH.0: CMCurve, epsA, cmSymmetricEigenbasis, productKugaSato, epsX,
  coefficientProjector, integralNewformLattice, goodCMProductModel.
GH.1: CMPoints, cmOrder, IsogPair, idealAction, gHC, ajEt, ajP,
  characterHeegnerClass, parabolicResiduePairing, colemanPrimitive,
  depletedColemanComponent, syntomicAbelJacobi, weightTwoKummerComparison.
GH.3: tracePolynomial, universalNormClass, integralTowerComparison.
GH.4: ramifiedCharacterEvaluation, fixedWeightRegulator, reciprocityDistribution.
GH.5: admissibleTriple, howardHypotheses, localAssumptions, kolyvaginSystem.
GH.6: sourceQualifiedSelmerStructure, nekovarParityInput.
GH.7: ordinaryHidaRepresentation, yagerModule, relativeIntegralOmega,
  ochiaiIdealRegulator, twoVariableRegulator, quotientRegulator,
  initialFamilySpecialization, higherWeightFamilySpecialization.
GH.8: correctedCMDivisor, modularQuotientKummerMap, differentialComparison,
  primitiveCharacterComparison, automorphicReciprocityExport,
  auxiliaryRangeAdapter, bsdReciprocityExport.
-/

end
end TauCetiRoadmap.GeneralizedHeegnerCycles
