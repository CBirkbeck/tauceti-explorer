/-
This suggested file is not the roadmap and is not exhaustive. The roadmap
reader document is definitive. The statements suggest Lean forms so that
contributors and reviewers converge on names and signatures. Target and test
proofs are placeholders; no implementation is claimed.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.
The shared build has pinned Mathlib; the cited Tau Ceti modules lack object files.
Their exact suggested forms are comments below, with the pinned declarations
read directly in source. No Tau Ceti library build is started.

The eight accepted parent declarations are imported by identifier in the packet,
not re-created here. In particular the CM, conductor, torsion-class and K₂
carriers are unavailable. Their signatures are omitted below where they cannot
honestly be stated. There are no substitute Prop-valued fields or fake axioms.
-/
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Cotangent

noncomputable section
open scoped BigOperators ComplexConjugate
open NumberField
namespace BP_ER5

-- Concrete coordinate adapters for the IMPORTED parent Fourier API.
abbrev T (C : ℕ) := ZMod C × ZMod C
abbrev pairingO (C : ℕ) [NeZero C] (x y : T C) : ℂ :=
  ZMod.stdAddChar (-x.1 * y.2 + x.2 * y.1)
abbrev fourierO (C : ℕ) [NeZero C] (F : T C → ℂ) (x : T C) : ℂ :=
  (∑ y : T C, F y * pairingO C x y) / (C : ℂ)
abbrev oppositeFourier (C : ℕ) [NeZero C] (F : T C → ℂ) (x : T C) : ℂ :=
  (∑ y : T C, F y * pairingO C y x) / (C : ℂ)
abbrev finiteFourier10 (C : ℕ) [NeZero C] (f : T C → ℂ) (u : T C) : ℂ :=
  (∑ v : T C, f v * star (ZMod.stdAddChar (v.1 * u.1 - v.2 * u.2))) /
    (C : ℂ)^2

-- dual-first-fourier-comparison: the expressible coordinate statement.
theorem dualFirstFourierComparison (C : ℕ) [NeZero C] (F : T C → ℂ) (u : T C) :
    fourierO C F u = (C : ℂ) * finiteFourier10 C (fun v => F (v.2,v.1)) u := by
  sorry

-- cm-gauss-coefficient. gC is the residue of conjugate g in the CM application;
-- the raw finite-weight definition itself needs no unavailable CM carrier.
def cmGaussCoefficient (C : ℕ) [NeZero C] (F : T C → ℂ) (g : ℂ) (gC : T C) : ℂ :=
  g * fourierO C F gC
lemma cmGaussCoefficient_apply (C : ℕ) [NeZero C] (F : T C → ℂ)
    (g : ℂ) (gC : T C) :
    cmGaussCoefficient C F g gC =
      g * ((∑ x : T C, F x * pairingO C gC x) / (C : ℂ)) := by
  sorry
lemma cmGaussCoefficient_zero (C : ℕ) [NeZero C] (g : ℂ) (gC : T C) :
    cmGaussCoefficient C (fun _ => 0) g gC = 0 := by
  sorry
lemma cmGaussCoefficient_add (C : ℕ) [NeZero C] (F G : T C → ℂ)
    (g : ℂ) (gC : T C) :
    cmGaussCoefficient C (fun x => F x + G x) g gC =
      cmGaussCoefficient C F g gC + cmGaussCoefficient C G g gC := by
  sorry
lemma cmGaussCoefficient_smul (C : ℕ) [NeZero C] (F : T C → ℂ)
    (c g : ℂ) (gC : T C) :
    cmGaussCoefficient C (fun x => c * F x) g gC = c * cmGaussCoefficient C F g gC := by
  sorry
lemma cmGaussCoefficient_oppositeKernel (C : ℕ) [NeZero C] (F : T C → ℂ)
    (hodd : ∀ x, F (-x) = -F x) (g : ℂ) (gC : T C) :
    g * oppositeFourier C F gC = -cmGaussCoefficient C F g gC := by
  sorry

/- These API statements require the imported, presently unavailable CM datum:
cmGaussCoefficient_changeGenerator:
  f' = ζ f, g' = ζ⁻¹g, C fixed, ζ∈μ => Γ_C(χ,g') = Γ_C(χ,g).
cmGaussCoefficient_real:
  primitive χ, χ(x̄)=χ̄(x), (f̄)=(f), χ|μ=embedding => conjugate Γ = Γ.
cmGaussCoefficient_norm:
  under those same CM hypotheses, ‖Γ‖ = N(g) = C²/N(f) > 0.
primitiveGaussNormalization (primitive-gauss-normalization):
  support Hχ = ḡ·(O/f̄)×; |Hχ(ḡ)|²=N(g); Γ real and nonzero.
These are full conditional statements in the reader; they are not weakened to
unconditional claims about arbitrary finite weights. Their eventual signatures
must use CM.4's character/conductor API, not an arbitrary predicate called CM.

conductorFiberRegulatorEvaluation (conductor-fiber-regulator-evaluation):
  sum_w Hχ(w) R_C(w) = Γ_C(χ,g) sum_x∈W χ(x) R_C(x).
unitOrbitRegulatorCount (unit-orbit-regulator-count):
  μ acts freely on W; x↦xχ̄(x) identifies W/μ with its image;
  sum_x∈W χ(x) R_C(x) = |μ| R_q(U).
  Rational descent of U and its pure-imaginary regulator require the selected
  uniformization to transport conjugation to z↦z̄; CM.1/2 certify this input.
principalGeneratorLSeriesComparison (principal-generator-L-series-comparison):
  sum_a≠0 χ(a)/(a²ā) = |μ| LSeries(normCoeff κ ψ.toIdealArithmeticFunction,2).
These require E.7's S and K₂ carriers and CM.4's principal-ideal law. They are
omitted, rather than turned into statements about a fabricated K₂ type.
-/

/- The Tau Ceti modules below exist at the pin but lack prebuilt object files.
Their forms are therefore recorded, without a shadow implementation:
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Convergence
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Analytic
open TauCeti

-- cm-ideal-series-at-two: expressible norm-growth specialization. The owner
-- CM.4 supplies the particular ψ and hnorm; the bound itself is concrete.
theorem cmIdealSeriesConverges {K : Type*} [Field K] [NumberField K]
    (ψ : MultiplicativeIdealWeight K)
    (hnorm : ∀ J : (Ideal (𝓞 K))⁰,
      ‖ψ (J : Ideal (𝓞 K))‖ ≤ (Ideal.absNorm (J : Ideal (𝓞 K)) : ℝ)^((1:ℝ)/2))
    {s : ℂ} (hs : (3:ℝ)/2 < s.re) :
    Summable (idealTerm K ψ.toIdealArithmeticFunction s) := by
  sorry
-- This is the exact existing baseline implication, not new ideal Euler theory.
example {K : Type*} [Field K] [NumberField K] (ψ : MultiplicativeIdealWeight K)
    (hs : Summable (idealTerm K ψ.toIdealArithmeticFunction (2:ℂ))) :
    LSeries (normCoeff K ψ.toIdealArithmeticFunction) (2:ℂ) ≠ 0 := by
  sorry
-- cm-ideal-series-at-two combines the incoming bound with that implication.
theorem cmIdealSeriesAtTwo {K : Type*} [Field K] [NumberField K]
    (ψ : MultiplicativeIdealWeight K)
    (hnorm : ∀ J : (Ideal (𝓞 K))⁰,
      ‖ψ (J : Ideal (𝓞 K))‖ ≤ (Ideal.absNorm (J : Ideal (𝓞 K)) : ℝ)^((1:ℝ)/2)) :
    Summable (idealTerm K ψ.toIdealArithmeticFunction (2:ℂ)) ∧
      LSeries (normCoeff K ψ.toIdealArithmeticFunction) (2:ℂ) ≠ 0 := by
  sorry

-/

-- unit-factor-cancellation-certificate: actual complex scalar algebra. Its two
-- hypotheses are the separately planned equalities for A_C, not K₂ substitutes.
theorem unitFactorCancellationCertificate (C w : ℕ) (y : ℝ) (Γ A R L : ℂ)
    (hC : 0 < C) (hw : 0 < w) (hy : 0 < y)
    (hreg : A = (w:ℂ) * Γ * R)
    (hseries : A = (Complex.I * (y:ℂ)^2 * (C:ℂ)^4 / (Real.pi:ℂ)) * (w:ℂ) * L) :
    L = ((Real.pi:ℂ) * Γ / (Complex.I * (y:ℂ)^2 * (C:ℂ)^4)) * R := by
  sorry

-- Finite tables for tests; these are coordinate models of imported χ, not a
-- second conductor or CM character construction.
abbrev chi4 (x : T 4) : ℂ :=
  if x.1.val % 2 = x.2.val % 2 then 0
  else if x.1.val % 2 = 1 then
    if (x.1.val + x.2.val) % 4 = 1 then 1 else -1
  else if (x.1.val + x.2.val) % 4 = 1 then Complex.I else -Complex.I
abbrev tau3 : ℂ := (1 + (Real.sqrt 3:ℂ) * Complex.I) / 2
abbrev chi6 (x : T 6) : ℂ :=
  let r : T 6 := (x.1 + 2*x.2, 2*x.1 + x.2)
  if r = (1,2) then 1 else if r = (5,4) then -1
  else if r = (2,1) then tau3 else if r = (4,5) then -tau3
  else if r = (1,5) then tau3 - 1 else if r = (5,1) then 1 - tau3 else 0
abbrev chi7 (x : T 7) : ℂ :=
  let r := (x.1 + 4*x.2).val
  if r = 0 then 0 else if r = 1 ∨ r = 2 ∨ r = 4 then 1 else -1
abbrev chi14 (x : T 14) : ℂ :=
  chi7 ((x.1.val : ZMod 7),(x.2.val : ZMod 7))
abbrev indicator4 (x : T 4) : ℂ :=
  if x.1.val % 2 = x.2.val % 2 then 0 else 1

-- All six tests attached to the new definition, under their packet names.
-- cmGaussCoefficient_Qi_C4
example : fourierO 4 chi4 (1,1) = 1 + Complex.I ∧
    cmGaussCoefficient 4 chi4 (1-Complex.I) (1,1) = 2 := by
  sorry
-- cmGaussCoefficient_Eisenstein_C6
example : fourierO 6 chi6 (5,2) = (Real.sqrt 3:ℂ)*Complex.I ∧
    cmGaussCoefficient 6 chi6 (-(Real.sqrt 3:ℂ)*Complex.I) (5,2) = 3 := by
  sorry
-- cmGaussCoefficient_Qsqrt7_C7
example : fourierO 7 chi7 (6,2) = (Real.sqrt 7:ℂ)*Complex.I ∧
    cmGaussCoefficient 7 chi7 (-(Real.sqrt 7:ℂ)*Complex.I) (6,2) = 7 := by
  sorry
-- cmGaussCoefficient_zero_weight
example : cmGaussCoefficient 4 (fun _ => 0) (1-Complex.I) (1,1) = 0 := by
  sorry
-- cmGaussCoefficient_wrong_kernel
example : (1-Complex.I) * oppositeFourier 4 chi4 (1,1) = -2 := by
  sorry
-- cmGaussCoefficient_imprimitive
example : fourierO 4 indicator4 (1,1) = 0 ∧
    cmGaussCoefficient 4 indicator4 (1-Complex.I) (1,1) = 0 := by
  sorry

-- Imported parent definition tests relevant to the new comparison.
-- fourierO_output_index: same output, no swap.
example : fourierO 3 (fun x => if x = (1,0) then 1 else 0) (0,1) =
    Complex.exp (2*(Real.pi:ℂ)*Complex.I/3)/3 := by
  sorry
example : fourierO 3 (fun x => if x = (1,0) then 1 else 0) (1,0) = 1/3 := by
  sorry
-- Gaussian χ is odd, agrees with the embedding on μ, and kills nonunits.
example : chi4 (1,0) = 1 ∧ chi4 (0,1) = Complex.I ∧ chi4 (1,1) = 0 := by
  sorry
example : ∀ x : T 4, chi4 (-x) = -chi4 x := by
  sorry

-- three-CM-normalization-examples: exact finite orbit certificate; actual K₂
-- equalities U=S_1/4+S_(3+2i)/4 and the three Eisenstein classes require E.7.
abbrev gaussianIndex (x : T 4) : T 4 :=
  if chi4 x = 1 then x else if chi4 x = -1 then -x
  else if chi4 x = Complex.I then (x.2,-x.1) else (-x.2,x.1)
example : {x : T 4 | chi4 x ≠ 0}.ncard = 8 := by
  sorry
example : (gaussianIndex '' {x : T 4 | chi4 x ≠ 0}) = {(1,0),(3,2)} := by
  sorry

-- extra-prime-level-counterexample: exact finite cardinalities, numerical
-- factor-two diagnostic is recorded in the reader, not asserted here as proof.
example : {x : T 14 | chi14 x ≠ 0}.ncard = 168 := by
  sorry
example : cmGaussCoefficient 14 chi14 (-2*(Real.sqrt 7:ℂ)*Complex.I) (12,4) = 28 := by
  sorry

/- Imported parent construction signatures, API and tests remain definitive in
EllipticRegulators.json, EllipticKTheory E.7 and the CM owner files:
cmHeckeCharacter, cmHeckeCharacter_conductor ((f̄)=(f)), cmFiniteCharacter_conj,
deuringComparison, deuringComparison_badPrimes, cm_maximal_order;
deuring_32a2, deuring_bad_prime_32a2, not_from_endomorphisms, cm_fields_over_Q.
cmCharExtend, blochClassU, blochClassU_summand_orbit,
blochClassU_galois_invariant, blochClassU_descends, blochClassU_rational;
blochClassU_Qi_C4, blochClassU_zero_point, blochClassU_descends_test,
blochClassU_index_set. No new definition in this part replaces those imports.
The general parent pairing/Fourier API (inversion, multiplication, Parseval)
remains in AC.0; only its coordinate comparison is prototyped here.
-/
end BP_ER5
