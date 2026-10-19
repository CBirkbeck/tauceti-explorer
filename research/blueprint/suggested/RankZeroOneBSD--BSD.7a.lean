/-
This file is not the roadmap and is not exhaustive. The roadmap document
RankZeroOneBSD--BSD.7a.md is definitive. These statements suggest Lean forms
so that contributors and reviewers converge on names and signatures.

BSD.7a: good Eisenstein primes, weight two.
Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

The compact Suggested shape in WORKERS.md governs this file. Compatible
arithmetic Selmer modules, actual Heegner/BF systems and integral Coleman
maps are not available at these pins. All arithmetic targets below therefore
remain README targets. No unspecified proposition stands in for a missing
carrier, and no data definition is admitted. The examples use actual Mathlib
power series; they assert no arithmetic main conjecture.
-/

import Mathlib.RingTheory.PowerSeries.Inverse

namespace RankZeroOneBSD.EisensteinBaseline

variable {R : Type*} [CommRing R]

-- Augmentation is the existing constant-coefficient ring homomorphism.
example (f : PowerSeries R) (h : IsUnit (PowerSeries.constantCoeff f)) :
    IsUnit f :=
  PowerSeries.isUnit_iff_constantCoeff.mpr h

-- The augmentation-prime factor is X after a topological generator is chosen.
example : PowerSeries.coeff 0 (PowerSeries.X : PowerSeries R) = 0 := by
  simp

example : PowerSeries.coeff 1 (PowerSeries.X : PowerSeries R) = 1 := by
  simp

-- Multiplication by an augmentation factor shifts coefficients.
example (f : PowerSeries R) (n : ℕ) :
    PowerSeries.coeff (n + 1) (f * PowerSeries.X) = PowerSeries.coeff n f :=
  PowerSeries.coeff_succ_mul_X n f

-- A normalized integral quotient with unit augmentation is a unit.
example : IsUnit (1 + PowerSeries.X : PowerSeries R) := by
  apply PowerSeries.isUnit_iff_constantCoeff.mpr
  simp

-- Nonzero augmentation and unit augmentation must not be confused.
example [Nontrivial R] : ¬ IsUnit (PowerSeries.X : PowerSeries R) := by
  rw [PowerSeries.isUnit_iff_constantCoeff]
  simp

-- Coefficient scalars are transported through the actual augmentation map.
example (r : R) (f : PowerSeries R) :
    PowerSeries.constantCoeff (PowerSeries.C r * f) =
      r * PowerSeries.constantCoeff f := by
  simp

end RankZeroOneBSD.EisensteinBaseline

/-
Named arithmetic omissions: full statements, hypotheses, exact prerequisite
contracts, source locators and Checks are in the corresponding README targets.
Every ID has prefix RankZeroOneBSD:BSD.7a/.

good-eisenstein-ordinarity: Ordinarity and local invariants at a good Eisenstein prime
selmer-convention-dictionary: Ordinary, Greenberg and unramified Eisenstein Selmer comparisons
cgs-primitive-euler-comparison: Primitive and imprimitive Euler factors
cgls-character-lambda-comparison: CGLS residual extension and algebraic Iwasawa invariants
eisenstein-cm-value-congruence: Kriz congruence and analytic Iwasawa invariants
cgls-algebraic-analytic-invariants: CGLS equality of anticyclotomic Iwasawa invariants
cgs-uniform-twist-specialization: Uniform near-trivial Kolyvagin bound
cgs-augmentation-divisibility: Heegner divisibility including augmentation
heegner-greenberg-ideal-equivalence: Heegner index and BDP ideal comparison
cgs-integral-greenberg-equality: CGS anticyclotomic Greenberg main conjecture
cgs-integral-heegner-equality-target: CGS Heegner index-square equality
ky-local-invariants-dictionary: Keller–Yin local character cohomology
ky-invariant-free-lattice: Keller–Yin nonsplit residual lattice
ky-exceptional-character-specialization: Keller–Yin trivial-character augmentation correction
ky-imprimitive-extension-sequence: Keller–Yin imprimitive residual Selmer comparison
ky-primitive-euler-comparison: Keller–Yin finite Euler comparison
ky-primitive-lambda-correction: Keller–Yin residual extension and corrected lambda formula
ky-algebraic-analytic-invariants: Keller–Yin equality of analytic and algebraic invariants
ky-coefficient-prime-divisibility-target: Keller–Yin integral Kolyvagin divisibility and lattice transfer
ky-integral-greenberg-equality: Keller–Yin anticyclotomic Greenberg main conjecture
ky-rational-heegner-equality: Keller–Yin Heegner index-square equality
wuthrich-integral-eisenstein-input: Distinguished Wüthrich lattice and integral Kato input adapter
cgs-integral-rankin-normalizations: Integral Rankin functions and specialization normalization
eisenstein-bf-specialization: Integral Eisenstein specialization of Beilinson–Flach classes
cgs-cyclotomic-duality-equivalence: Beilinson–Flach divisibility comparison
cgs-rational-bf-specialization: Nontrivial-twist rational Beilinson–Flach bound
cgs-finite-power-congruences: Congruent twists and integral characteristic series
cgs-twisted-augmentation-control: Twisted control and augmentation comparison
cgs-integral-twist-comparison: Integral twisted cyclotomic equality
cgs-mazur-equality: CGS integral cyclotomic main conjecture
ky-mazur-equality: Keller–Yin integral cyclotomic main conjecture
cgls-corank-one-prototype: CGLS anticyclotomic prototype
ky-integral-cyclotomic-adaptation: Keller–Yin cyclotomic input transfer
ky-uniform-twist-specialization: Keller–Yin uniform near-trivial bound
eisenstein-bf-pr-image: EisensteinBF.coleman_PR
eisenstein-bf-greenberg-image: EisensteinBF.coleman_Gr

Construction API omissions (the same six names as the packet):
EisensteinBF.class — The actual specialized motivic Beilinson–Flach cohomology class, not a chosen inverse image of an L-function.

EisensteinBF.ordinary_local — The class lies in the ordinary-relaxed Selmer group with the source strict/relaxed places.

EisensteinBF.coleman_PR — The rescaled Coleman map on p⁻loc_v̄ sends the actual class to the integrally normalized L_PR.

EisensteinBF.coleman_Gr — The rescaled Coleman map on loc_v sends the same actual class to L_Gr with its Katz congruence factor.

EisensteinBF.twist_congruence — After the specified twist automorphism, congruent characters produce congruent images modulo the same coefficient power.

EisensteinBF.coleman_cokernel_divisor — Localize the actual normalized Coleman map at every height-one prime and compute its cokernel length. Under the simultaneously printed raw f-map/degree conventions the (p) length is v_p(H_p(f)); a corrected convention must identify exactly where this factor moves.

Construction test omissions (arithmetic examples require those carriers):
EisensteinBF.test_PR_projection — Cyclotomic projection of the PR image agrees with the product of MSD functions of E_• and E_•^K in their Néron periods.

EisensteinBF.test_Gr_projection — Anticyclotomic projection of the Gr image agrees with the full central-value BDP normalization, including the nonunit Katz/congruence factor.

EisensteinBF.test_zero_image — If an injective Coleman projection has nonzero reciprocal L-image then the actual localized class is nonzero; the zero class cannot pass.

EisensteinBF.test_lattice_rescaling — Changing the distinguished quotient differential rescales class/map and period modules by the computed factors, preserving both laws together.

EisensteinBF.test_twist_congruence — For α≡β mod ϖ^m, the two normalized reciprocity images agree mod ϖ^m after the same twist automorphism; allowing different integral period scalings invalidates this test.

EisensteinBF.test_nonunit_normalization — For α_p²≡1 mod p, multiplication by H_p(f) on the raw f-target after degree identification has positive (p)-cokernel length. A claim of unchanged pseudo-null cokernel for this same lattice fails.


In particular, a Coleman image identity does not assert pseudo-null cokernel.
Source issue E13 requires computing the divisor after H_p(f) normalization.
The verified algebra examples above only distinguish augmentation factors and
units; they do not discharge that missing arithmetic calculation.
-/
