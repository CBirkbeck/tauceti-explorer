import Mathlib.Data.Nat.Totient
import Mathlib.Data.Finset.NatDivisors
import Mathlib.Data.Finset.Prod
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Prod
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.NormNum
import TauCeti.NumberTheory.HeckeRing.GL2.Basic
import TauCeti.RepresentationTheory.SymmetricPower
import TauCeti.LinearAlgebra.SymmetricPower.Basis

/-!
Modular curves, following Katz–Mazur, Part II: representative target signatures.

The roadmap is the reader document ModularCurvesPartII--R13.4b.md. That document
is definitive; this file suggests forms available at the pinned APIs and is not
exhaustive. It makes the subgroup counting, action direction, symmetric-power
weight, image, kernel and minus conventions explicit.

The finite data and linear maps below are actual existing carriers. Their modular
interpretations require the geometric targets in the reader: compactified curves,
universal isogenies, Jacobians, support and trace maps, component graphs and finite
covers. In particular, the counting data do not construct a modular correspondence,
and an arbitrary linear map does not construct geometric cohomology.
-/

namespace TauCetiRoadmap.ModularCurvesPartII

open scoped BigOperators Matrix TensorProduct

set_option maxRecDepth 4096

/-! ## Layer R13.4b: generic-fibre and correspondence compatibility

The component and cusp-field comparisons are geometric reader targets.
-/

/-! ## Layer R13.5: bad fibres and regular/semistable models -/

/-- Ramification in the stated prime-square nodal extension at level 13. -/
example : ((13 : ℕ) ^ 2 - 1) / 2 = 84 := by decide

/-- The K_(1,3) split-Cartan graph has no independent cycle. -/
example : 1 * 3 + 1 - (1 + 3) = (0 : ℕ) := by decide

/-- Its surviving central component has genus three. -/
example : ((1 : ℕ) - 1) * (3 * 1 - 2) / 2 + 3 * 1 = 3 := by decide

/-! ## Layer R13.6: boundary and degeneration outputs

Weighted graphs, nearby cycles and their integral character realization are
geometric reader targets. A graph rank does not determine its component group.
-/

/-! ## Layer R14.1: algebraic Hecke correspondences -/

/-- Rank of an order-p degeneracy leg, when p is prime. -/
def degeneracyDegree (N p : ℕ) : ℕ := if p ∣ N then p else p + 1

/-- Good-prime degree at level 11. -/
example : degeneracyDegree 11 2 = 3 := by decide

/-- The bad-prime degree is p. -/
example : degeneracyDegree 10 5 = 5 := by decide

/-- Product of the two coprime good-prime degrees. -/
example : degeneracyDegree 11 2 * degeneracyDegree 11 3 = 12 := by decide

/-- HNF data (a,d,b), with ad=m and 0≤b<d, for all order-m subgroups. -/
def allSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  ((Finset.range (m + 1)).product
    ((Finset.range (m + 1)).product (Finset.range (m + 1)))).filter
    (fun t => 0 < t.1 ∧ 0 < t.2.1 ∧ t.1 * t.2.1 = m ∧ t.2.2 < t.2.1)

/-- The cyclic filter excludes scalar subgroups E[r] with r>1. -/
def cyclicSubgroupBranches (m : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  (allSubgroupBranches m).filter (fun t => Nat.gcd (Nat.gcd t.1 t.2.1) t.2.2 = 1)

/-- The full-subgroup degree is σ₁(m). -/
theorem allSubgroupBranches_card (m : ℕ) (hm : 0 < m) :
    (allSubgroupBranches m).card = ∑ d ∈ m.divisors, d := by
  sorry

/-- The cyclic prime-square degree is ψ(p²)=p²+p. -/
theorem cyclicSubgroupBranches_primeSquare_card (p : ℕ) (hp : p.Prime) :
    (cyclicSubgroupBranches (p ^ 2)).card = p ^ 2 + p := by
  sorry

/-- The identity degree agrees in the two conventions. -/
example : (allSubgroupBranches 1).card = 1 ∧
    (cyclicSubgroupBranches 1).card = 1 := by decide

/-- The first repeated-prime test distinguishes the two correspondences. -/
example : (allSubgroupBranches 4).card = 7 ∧
    (cyclicSubgroupBranches 4).card = 6 := by decide

/-- This is exactly the extra scalar branch at m=4. -/
example : (2, 2, 0) ∈ allSubgroupBranches 4 ∧
    (2, 2, 0) ∉ cyclicSubgroupBranches 4 := by decide

/-- Squarefree degree six has twelve branches in both conventions. -/
example : (allSubgroupBranches 6).card = 12 ∧
    (cyclicSubgroupBranches 6).card = 12 := by decide

/-- Repeated prime three gives another discriminating degree test. -/
example : (allSubgroupBranches 9).card = 13 ∧
    (cyclicSubgroupBranches 9).card = 12 := by decide

/-- The abstract coprime relation is an existing Tau Ceti theorem. -/
example (m n : ℕ+) (hcop : Nat.Coprime (m : ℕ) (n : ℕ)) :
    HeckeRing.GL2.heckeT m * HeckeRing.GL2.heckeT n =
      HeckeRing.GL2.heckeT (m * n) :=
  HeckeRing.GL2.heckeT_mul_of_coprime m n hcop

/-- Analytic Fricke formula on a fixed complex component. -/
noncomputable def atkinLehnerAnalytic (N z : ℂ) : ℂ := -1 / (N * z)

/-- The nonzero hypotheses exclude the totalized division boundary. -/
theorem atkinLehnerAnalytic_involutive (N z : ℂ) (hN : N ≠ 0) (hz : z ≠ 0) :
    atkinLehnerAnalytic N (atkinLehnerAnalytic N z) = z := by
  sorry

/-- Pin the sign and reciprocal. -/
example : atkinLehnerAnalytic 1 (2 : ℂ) = -1 / 2 := by
  norm_num [atkinLehnerAnalytic]

/-- The totalized N=0 value lies outside the Fricke domain. -/
example (z : ℂ) : atkinLehnerAnalytic 0 z = 0 := by
  simp [atkinLehnerAnalytic]

/-- Exact divisors exclude 2 and 6 at level 12. -/
example : ((12 : ℕ).divisors.filter (fun d => Nat.Coprime d (12 / d))) =
    {1, 3, 4, 12} := by decide

/-! ## Layer R14.2: Jacobians and integral Hecke actions

The relative Jacobian, norm, polarization and actual Tate carrier are reader targets.
They precede the rational rank-two result of the next layer.
-/

/-! ## Layer R14.3: cohomological realizations and pairings -/

noncomputable section

/-- Existing symmetric-power action, with weight k≥2 and exponent k−2. -/
def weightCoefficients {R : Type} {G M : Type*} [CommRing R] [Group G]
    [AddCommGroup M] [Module R M] (ρ : Representation R G M) (k : ℕ) (_hk : 2 ≤ k) :
    Representation R G (Sym[R]^(k - 2) M) := ρ.symmetricPower (k - 2)

/-- Weight two has a constant one-dimensional coefficient fibre. -/
example : Module.finrank ℚ (Sym[ℚ]^0 (Fin 2 → ℚ)) = 1 := by sorry

/-- Weight three retains a two-dimensional elliptic coefficient fibre. -/
example : Module.finrank ℚ (Sym[ℚ]^1 (Fin 2 → ℚ)) = 2 := by sorry

/-- The action agrees with the supplied symmetric-power functor. -/
example {R : Type} {G M : Type*} [CommRing R] [Group G]
    [AddCommGroup M] [Module R M] (ρ : Representation R G M) (k : ℕ) (hk : 2 ≤ k) :
    weightCoefficients ρ k hk = ρ.symmetricPower (k - 2) := rfl

/-- Image of an actual support-forgetting linear map. -/
def parabolicH1 {R C H : Type*} [CommRing R]
    [AddCommGroup C] [Module R C] [AddCommGroup H] [Module R H]
    (u : C →ₗ[R] H) : Submodule R H := LinearMap.range u

/-- Membership records a genuine preimage under support forgetting. -/
theorem mem_parabolicH1 {R C H : Type*} [CommRing R]
    [AddCommGroup C] [Module R C] [AddCommGroup H] [Module R H]
    (u : C →ₗ[R] H) (x : H) : x ∈ parabolicH1 u ↔ ∃ y, u y = x := by sorry

/-- Identity support map gives the whole module. -/
example : parabolicH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) = ⊤ := by sorry

/-- Zero support map has zero image. -/
example : parabolicH1 (0 : ℤ →ₗ[ℤ] ℤ) = ⊥ := by sorry

/-- Multiplication by two has proper image over ℤ, detecting saturation errors. -/
example : (2 : ℤ) ∈ parabolicH1 (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) ∧
    (1 : ℤ) ∉ parabolicH1 (2 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) := by sorry

/-! ## Layer R14.4: Ihara and level-change statements -/

/-- The sum of two actual degeneracy pullbacks. -/
def degeneracyH1 {R H H' : Type*} [CommRing R]
    [AddCommGroup H] [Module R H] [AddCommGroup H'] [Module R H']
    (a b : H →ₗ[R] H') : H × H →ₗ[R] H' := a.coprod b

/-- Preserve the ordered two-leg sum. -/
example : degeneracyH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) 0 (3, 5) = 3 := by sorry

/-- Reversing the zero and identity legs changes the value. -/
example : degeneracyH1 (0 : ℤ →ₗ[ℤ] ℤ) LinearMap.id (3, 5) = 5 := by sorry

/-- The signed diagonal is in the kernel when both legs agree. -/
example : degeneracyH1 (LinearMap.id : ℤ →ₗ[ℤ] ℤ) LinearMap.id (1, -1) = 0 := by sorry

/-- Correct sign of the norm matrix determinant in selected-root control. -/
theorem degeneracyNormMatrix_det (a b : ℚ) :
    Matrix.det !![a, b; b, a] = a ^ 2 - b ^ 2 := by sorry

/-! ## Layer R14.5: modular quotients -/

/-- Kernel of the supplied newform eigencharacter on the actual Hecke image. -/
def heckePrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) : Ideal T :=
  RingHom.ker χ

/-- The character kernel is prime; minimality uses the rational Artinian argument. -/
theorem heckePrime_isPrime {T K : Type*} [CommRing T] [Field K] (χ : T →+* K) :
    (heckePrime χ).IsPrime := by sorry

/-- The rational integer character is injective. -/
example : heckePrime (Int.castRingHom ℚ) = ⊥ := by sorry

/-- Projection kills precisely the second factor. -/
example (x y : ℚ) : (x, y) ∈ heckePrime (RingHom.fst ℚ ℚ) ↔ x = 0 := by sorry

/-- Field embeddings preserve the character kernel. -/
example {T K L : Type*} [CommRing T] [Field K] [Field L]
    (χ : T →+* K) (σ : K →+* L) : heckePrime (σ.comp χ) = heckePrime χ := by sorry

/-! ## Layer R14.6: bad-prime and finite cover interfaces -/

/-- Degree-zero divisors on the supplied supersingular intersection set. -/
def supersingularDegreeZero (S : Type*) : Submodule ℤ (S →₀ ℤ) :=
  LinearMap.ker (Finsupp.linearCombination ℤ (fun _ : S => (1 : ℤ)))

/-- A singleton contributes no degree-zero character. -/
example : supersingularDegreeZero Unit = ⊥ := by sorry

/-- A difference of two points is a degree-zero divisor. -/
example : Finsupp.single (0 : Fin 2) (1 : ℤ) - Finsupp.single 1 1 ∈
    supersingularDegreeZero (Fin 2) := by sorry

/-- A single point is not degree zero. -/
example : Finsupp.single (0 : Fin 2) (1 : ℤ) ∉
    supersingularDegreeZero (Fin 2) := by sorry

/-- Minus submodule for the actual involution on cover cohomology. -/
def taylorWilesMinus {O M : Type*} [CommRing O] [AddCommGroup M] [Module O M]
    (ξ : M →ₗ[O] M) : Submodule O M := LinearMap.ker (ξ + LinearMap.id)

/-- Negation acts as minus on the entire module. -/
example : taylorWilesMinus (-LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊤ := by sorry

/-- Identity has no minus classes when two is invertible. -/
example : taylorWilesMinus (LinearMap.id : ℚ →ₗ[ℚ] ℚ) = ⊥ := by sorry

/-- Characteristic two shows why plus/minus projection needs odd coefficients. -/
example : taylorWilesMinus (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) = ⊤ := by sorry

end
end TauCetiRoadmap.ModularCurvesPartII
