/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/HabiroNahmSeries--HB.8.md is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and signatures.
They claim no implementation; every packet node remains unchecked.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The Imported namespace is a signature adapter for nodes of the accepted parent packet,
not another plan for those objects. There is no built module for that packet. In particular,
expandAt and nahmUnit are data-valued prototypes, with their mathematical definitions
fixed by the cited parent nodes. Gaussian objects whose coefficient completion is unresolved
are named explicitly in comments; no proposition-valued placeholder hides their conditions.
-/

import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Data.Finsupp.Weight
import Mathlib.FieldTheory.RatFunc.AsPolynomial
import Mathlib.LinearAlgebra.Matrix.Symmetric
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.MvPowerSeries.Expand
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots

noncomputable section
open scoped LaurentPolynomial RatFunc
open Finset

namespace HabiroNahmSeries.HB8Refinement

abbrev Qq := RatFunc ℚ
abbrev Idx (N : ℕ) := Fin N →₀ ℕ
abbrev Series (N : ℕ) (R : Type*) := MvPowerSeries (Fin N) R
variable {N : ℕ}

namespace Imported

def q : Qq := RatFunc.X
theorem q_ne_zero : q ≠ 0 := sorry

def evalLaurent (P : ℤ[T;T⁻¹]) : Qq :=
  LaurentPolynomial.eval₂ (Int.castRingHom Qq) (Units.mk0 q q_ne_zero) P

def mvLog {R : Type*} [CommRing R] [Algebra ℚ R] (F : Series N R) : Series N R :=
  PowerSeries.subst (F - 1) (PowerSeries.log ℚ)

def shiftBy (a : Fin N → ℤ) : Series N Qq →+* Series N Qq :=
  MvPowerSeries.rescale (fun i => q ^ a i)

def shift (j : Fin N) : Series N Qq →+* Series N Qq :=
  MvPowerSeries.rescale (Function.update 1 j q)

def diagDot (A : Matrix (Fin N) (Fin N) ℤ) (n : Idx N) : ℤ := ∑ j, A j j * n j
def quad (A : Matrix (Fin N) (Fin N) ℤ) (n : Idx N) : ℤ :=
  ∑ i, ∑ j, (n i : ℤ) * A i j * n j

/-- Adapter for HB.8/series-F-A, with signed integer q-exponent. -/
def seriesFA (A : Matrix (Fin N) (Fin N) ℤ) : Series N Qq := fun n =>
  (-1) ^ (diagDot A n).natAbs * q ^ ((quad A n + diagDot A n) / 2) /
    ∏ j, ∏ r ∈ range (n j), (1 - q ^ (r + 1))

def ratio (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) : Series N Qq :=
  shift j (seriesFA A) * (seriesFA A)⁻¹

def signedRatio (A : Matrix (Fin N) (Fin N) ℤ) (a : Fin N → ℤ) : Series N Qq :=
  shiftBy a (seriesFA A) * (seriesFA A)⁻¹

/-- Adapter for HB.8/t-deformed-nahm-equations, after scalar extension to ℚ. -/
def nahmUnit (A : Matrix (Fin N) (Fin N) ℤ) : Fin N → (Series N ℚ)ˣ := sorry

/-- Adapter for HB.8/laurent-expansion-at-a-root-of-unity: q ↦ ζ+x. -/
def expandAt {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) :
    Qq →+* LaurentSeries K := sorry

/-- Polylogarithms:P.1/classical-polylogarithm, API polylogSeries, weight two. -/
def li2 : PowerSeries ℚ := PowerSeries.mk fun n => if n = 0 then 0 else 1 / (n : ℚ)^2

/-- q ↦ q^ℓ for ℓ positive, used by the parent plethystic coefficient API. -/
def adams (ℓ : ℕ) (hℓ : ℓ ≠ 0) : Qq →+* Qq := sorry

def divIndex (n : Idx N) (ℓ : ℕ) : Idx N := n.mapRange (· / ℓ) (Nat.zero_div ℓ)

/-- Adapter for HB.8/congruence-sum-series; e is the exponent after removing t^k. -/
def congruenceSum (A : Matrix (Fin N) (Fin N) ℤ) (m : ℕ) (k : Idx N) : Series N Qq :=
  fun e => if ∀ j, m ∣ e j then
    (-1) ^ (diagDot A e).natAbs * q ^ ((quad A (e+k) - quad A k + diagDot A e) / 2) /
      ∏ j, ∏ r ∈ range (e j), (1 - q ^ (k j + 1 + r))
  else 0

end Imported
open Imported

def euler {R : Type*} [Semiring R] (j : Fin N) (F : Series N R) : Series N R :=
  fun n => (n j : R) * MvPowerSeries.coeff n F

def evalSeries {K : Type} [Field K] [Algebra ℚ K] (ζ : K) (F : Series N Qq) :
    Series N K := fun n => RatFunc.eval (K := ℚ) (algebraMap ℚ K) ζ
      (MvPowerSeries.coeff n F)

def powSubst {R : Type*} [CommRing R] (m : ℕ) (hm : m ≠ 0) (F : Series N R) :
    Series N R := MvPowerSeries.expand m hm F

def residueAt {K : Type*} [Field K] [Algebra ℚ K] (ζ : K) (F : Series N Qq) :
    Series N K := fun n => (expandAt ζ (MvPowerSeries.coeff n F)).coeff (-1)

/- refinement-signed-shifts. The cocycle and Riccati identities are the imported
ratio API; this theorem supplies the missing simultaneous signed induction. -/
theorem signedShift_integral (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (a : Fin N → ℤ) (n : Idx N) :
    ∃ P : ℤ[T;T⁻¹], MvPowerSeries.coeff n (signedRatio A a) = evalLaurent P := sorry

/- refinement-orbit-ratio: construction, five API items and four unit tests. -/
def orbitRatio (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m : ℕ) : Series N Qq :=
  ∏ s ∈ range m, MvPowerSeries.rescale (Function.update 1 j (q ^ s)) (ratio A j)

theorem orbitRatio_quotient (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m : ℕ) :
    orbitRatio A j m =
      MvPowerSeries.rescale (Function.update 1 j (q ^ m)) (seriesFA A) * (seriesFA A)⁻¹ :=
  sorry

theorem orbitRatio_add (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m n : ℕ) :
    orbitRatio A j (m+n) = orbitRatio A j m *
      MvPowerSeries.rescale (Function.update 1 j (q ^ m)) (orbitRatio A j n) := sorry

theorem orbitRatio_integral (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (j : Fin N) (m : ℕ) (n : Idx N) :
    ∃ P : ℤ[T;T⁻¹], MvPowerSeries.coeff n (orbitRatio A j m) = evalLaurent P := sorry

theorem orbitRatio_one (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) :
    orbitRatio A j 1 = ratio A j := sorry

-- orbitRatio_zero (degenerate)
example (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) : orbitRatio A j 0 = 1 := sorry

-- orbitRatio_zeroMatrix (computation)
example (j : Fin N) : orbitRatio 0 j 2 =
    (1 - MvPowerSeries.X j) * (1 - MvPowerSeries.C q * MvPowerSeries.X j) := sorry

-- orbitRatio_root_zeroMatrix (computation)
example {K : Type} [Field K] [Algebra ℚ K] (m : ℕ) (hm : m ≠ 0)
    (ζ : K) (hζ : IsPrimitiveRoot ζ m) (j : Fin N) :
    evalSeries ζ (orbitRatio 0 j m) = 1 - MvPowerSeries.X j ^ m := sorry

-- orbitRatio_rescale (compatibility with Mathlib rescale)
example (A : Matrix (Fin N) (Fin N) ℤ) (j : Fin N) (m : ℕ) :
    MvPowerSeries.rescale (Function.update 1 j (q ^ m)) (seriesFA A) =
      orbitRatio A j m * seriesFA A := sorry

/- refinement-orbit-nahm -/
theorem orbitRatio_at_root {K : Type} [Field K] [Algebra ℚ K]
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (m : ℕ) (hm : m ≠ 0)
    (ζ : K) (hζ : IsPrimitiveRoot ζ m) (j : Fin N) :
    evalSeries ζ (orbitRatio A j m) = powSubst m hm
      (MvPowerSeries.map (algebraMap ℚ K) (nahmUnit A j : Series N ℚ)) := sorry

/- refinement-residue-potential: construction, five API items and four tests. -/
def residuePotential (A : Matrix (Fin N) (Fin N) ℤ) : Series N ℚ :=
  residueAt (1 : ℚ) (mvLog (seriesFA A))

theorem residuePotential_constantCoeff (A : Matrix (Fin N) (Fin N) ℤ) :
    MvPowerSeries.constantCoeff (residuePotential A) = 0 := sorry

theorem residuePotential_euler (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (j : Fin N) : euler j (residuePotential A) = mvLog (nahmUnit A j : Series N ℚ) := sorry

theorem residuePotential_unique (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (W : Series N ℚ) (h0 : MvPowerSeries.constantCoeff W = 0)
    (hW : ∀ j, euler j W = mvLog (nahmUnit A j : Series N ℚ)) :
    W = residuePotential A := sorry

theorem residuePotential_coeff (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (n : Idx N) (j : Fin N) (hn : n j ≠ 0) :
    MvPowerSeries.coeff n (residuePotential A) =
      MvPowerSeries.coeff n (mvLog (nahmUnit A j : Series N ℚ)) / (n j : ℚ) := sorry

-- residuePotential_rankZero (degenerate)
example (A : Matrix (Fin 0) (Fin 0) ℤ) : residuePotential A = 0 := sorry

-- residuePotential_zeroMatrix (computation)
example : residuePotential (0 : Matrix (Fin N) (Fin N) ℤ) =
    -∑ j, PowerSeries.subst (MvPowerSeries.X j : Series N ℚ) li2 := sorry

-- residuePotential_three (computation)
example : ∀ k < 5, MvPowerSeries.coeff (Finsupp.single 0 k)
    (residuePotential (N := 1) !![3]) = [0, 1, 5/4, 28/9, 165/16].getD k 0 := sorry

-- residuePotential_logCompatibility (compatibility)
example (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (j : Fin N) :
    MvPowerSeries.coeff (Finsupp.single j 1) (residuePotential A) =
      -((-1 : ℚ) ^ (A j j).natAbs) := sorry

/- refinement-all-root-residue: residue equality and the entire pole bound. -/
theorem allRoot_residue {K : Type*} [Field K] [Algebra ℚ K]
    (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) (m : ℕ) (hm : m ≠ 0)
    (ζ : K) (hζ : IsPrimitiveRoot ζ m) :
    residueAt ζ (mvLog (seriesFA A)) = MvPowerSeries.C (ζ / (m : K)^2) *
      powSubst m hm (MvPowerSeries.map (algebraMap ℚ K) (residuePotential A)) ∧
    ∀ n : Idx N, ∀ k : ℤ, k < -1 →
      (expandAt ζ (MvPowerSeries.coeff n (mvLog (seriesFA A)))).coeff k = 0 := sorry

/- refinement-critical-value -/
theorem residuePotential_criticalValue (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    residuePotential A =
      -∑ j, PowerSeries.subst (1 - (nahmUnit A j : Series N ℚ)) li2 -
      (1/2 : ℚ) • ∑ i, ∑ j, (A i j : ℚ) •
        (mvLog (nahmUnit A i : Series N ℚ) * mvLog (nahmUnit A j : Series N ℚ)) := sorry

/- refinement-restricted-adams: the rational-function signature. The completed
Z[1/m]((q)) version additionally uses the imported parent product topology. -/
def restrictedLog (m : ℕ) (L : Idx N → Qq) : Series N Qq := fun n =>
  -∑ ℓ ∈ (Icc 1 (Finsupp.degree n)).filter
      (fun ℓ => (∀ i, ℓ ∣ n i) ∧ Nat.Coprime ℓ m),
    if hℓ : ℓ ≠ 0 then
      adams ℓ hℓ (L (divIndex n ℓ)) / ((ℓ : Qq) * (1 - q ^ (m * ℓ)))
    else 0

def restrictedCoeffs (m : ℕ) (F : Series N Qq) : Idx N → Qq := sorry

theorem restrictedCoeffs_log (m : ℕ) (hm : m ≠ 0) (F : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) :
    restrictedCoeffs m F 0 = 0 ∧ mvLog F = restrictedLog m (restrictedCoeffs m F) := sorry

theorem restrictedCoeffs_unique (m : ℕ) (hm : m ≠ 0) (F : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) (L : Idx N → Qq)
    (h0 : L 0 = 0) (hL : mvLog F = restrictedLog m L) :
    L = restrictedCoeffs m F := sorry

theorem restrictedCoeffs_recursion (m : ℕ) (hm : m ≠ 0) (F : Series N Qq)
    (hF : MvPowerSeries.constantCoeff F = 1) (n : Idx N) (hn : n ≠ 0) :
    restrictedCoeffs m F n = -(1-q^m) * (MvPowerSeries.coeff n (mvLog F) +
      ∑ ℓ ∈ (Icc 2 (Finsupp.degree n)).filter
          (fun ℓ => (∀ i, ℓ ∣ n i) ∧ Nat.Coprime ℓ m),
        if hℓ : ℓ ≠ 0 then
          adams ℓ hℓ (restrictedCoeffs m F (divIndex n ℓ)) /
            ((ℓ : Qq) * (1-q^(m*ℓ))) else 0) := sorry

-- The parent ordinary coefficient family is specified by restrictedLog 1.
-- restrictedCoeffs_one (compatibility with HB.8/admissible-series)
theorem restrictedCoeffs_one (F : Series N Qq) (hF : MvPowerSeries.constantCoeff F = 1)
    (L : Idx N → Qq) (h0 : L 0 = 0) (hL : mvLog F = restrictedLog 1 L) :
    restrictedCoeffs 1 F = L := sorry

-- restrictedCoeffs_unit (degenerate)
example (m : ℕ) (hm : m ≠ 0) : restrictedCoeffs (N := N) m 1 = 0 := sorry

-- restrictedCoeffs_linear (mixed monomial computation)
example (m : ℕ) (hm : m ≠ 0) :
    restrictedCoeffs m (1 + MvPowerSeries.X 0 * MvPowerSeries.X 1 : Series 2 Qq)
      (Finsupp.single 0 1 + Finsupp.single 1 1) = -(1-q^m) := sorry

-- restrictedCoeffs_two (computation)
example : restrictedCoeffs 2 (1 + MvPowerSeries.X 0 * MvPowerSeries.X 1 : Series 2 Qq)
    (Finsupp.single 0 2 + Finsupp.single 1 2) = (1-q^2)/2 := sorry

-- restrictedCoeffs_mOne (compatibility)
example : restrictedCoeffs 1 (1 + MvPowerSeries.X 0 * MvPowerSeries.X 1 : Series 2 Qq)
    (Finsupp.single 0 2 + Finsupp.single 1 2) = 1-q := sorry

/- refinement-finite-support. Finiteness in i is encoded by the LaurentPolynomial
carrier; it is not replaced by integrality of unrestricted exponents. -/
theorem seriesFA_finiteSupport (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm) :
    ∃ L : Idx N → ℤ[T;T⁻¹], L 0 = 0 ∧
      mvLog (seriesFA A) = restrictedLog 1 (fun n => evalLaurent (L n)) := sorry

/- refinement-congruence-uniqueness -/
def higherDifference (j : Fin N) : ℕ → Series N Qq → Series N Qq
  | 0 => id
  | m+1 => fun F => higherDifference j m F -
      MvPowerSeries.C (q ^ (-(m : ℤ))) * shift j (higherDifference j m F)

theorem congruenceSolution_unique (A : Matrix (Fin N) (Fin N) ℤ) (hA : A.IsSymm)
    (m : ℕ) (hm : m ≠ 0) (k : Idx N) (hk : ∀ j, k j < m)
    (H : Series N Qq) (h0 : MvPowerSeries.coeff k H = 1)
    (hsupp : ∀ n, ¬ (∀ j, ∃ b : ℕ, n j = k j + m*b) → MvPowerSeries.coeff n H = 0)
    (hrec : ∀ j, higherDifference j m H =
      MvPowerSeries.C ((-1) ^ ((A j j).natAbs*m) *
        q ^ (A j j * ((m*(m+1)/2 : ℕ) : ℤ))) * MvPowerSeries.X j ^ m *
        shiftBy (fun i => (m : ℤ)*A i j) H) :
    H = MvPowerSeries.monomial k 1 * congruenceSum A m k := sorry

/- Gaussian signatures cannot yet be stated in the required coefficient completion.
Each omitted name is an explicit packet theorem, not a Prop-valued stub:

HabiroNahmSeries.HB8Refinement.gaussianLocal_normalization
  needs the h,w augmentation completion and the Bernoulli expansion of a Pochhammer
  factor; its exact four coefficients and counterchecks are in the packet/reader.
HabiroNahmSeries.HB8Refinement.gaussianAffine_system
  needs HB.4/formal-gaussian-integration over the formal rational-function coefficient
  ring and the corrected global prefactors (G1); it is not an analytic Gaussian.
HabiroNahmSeries.HB8Refinement.gaussianCS_regular
  needs the corrected CS in its x-first completion and the change to K((x))[[t]] (G2).
HabiroNahmSeries.HB8Refinement.gaussianIdentification
  needs both previous completions and the corrected refined normalization (G1,G2).
HabiroNahmSeries.HB8Refinement.congruenceRoot_residue
  needs that identification for c=m*a, gcd(a,m)=1 (G1,G2).
HabiroNahmSeries.HB8Refinement.congruenceSum_correctedLevel
  needs the parent R_m localization and its evaluation API, and the complete corrected
  pole/value argument (G3). This is not the false printed Definition 2.8.

The completed-coefficient integrality assertion for restrictedCoeffs needs the parent
Z[1/m]((q)) inclusion/product module. The rational-function construction, its API and all
twelve tests have signatures above. No assertion that these omitted objects already
exist is made by elaboration of this file.
-/

end HabiroNahmSeries.HB8Refinement
