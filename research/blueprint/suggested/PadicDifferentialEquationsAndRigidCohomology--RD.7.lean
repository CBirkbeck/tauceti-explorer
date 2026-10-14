import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Polynomial.GaussLemma
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.Minpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Data.Nat.Log
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.Tactic.NormNum.Prime
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

/-!
# P-adic differential equations and rigid cohomology, RD.7 (follow-up part): suggested Lean

**This file is not the roadmap, and it is not exhaustive.** The roadmap document
`research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.7.md` is
definitive. The statements below suggest Lean forms, so that contributors and reviewers
converge on names and signatures. Every proof is `sorry`; nothing here is an implementation.

The file states only what the pinned Mathlib and Tau Ceti can express:

* the descent of rationality, Fatou's lemma, and the weight-separation theorem, which concern
  power series, polynomials and algebraic numbers;
* the elliptic Weil factor, built from Tau Ceti's `WeierstrassCurve.frobeniusTrace`;
* the numerical exponents of the point-counting certificates, and a polynomial check of the
  corrected reduction bound.

Rigid cohomology, crystalline cohomology, tubes, divided power envelopes, dagger algebras,
period rings and étale cohomology are not available at the pins. The statements that need
them — the comparison morphism and its quasi-isomorphism property, Ogus's comparison, the
abelian-variety statement, Tuitman's algorithm, Mieda's map and the Kloosterman applications —
are README targets. Their API and test names are listed in the section "Unstated interfaces" at
the end, with the reason each one cannot be stated yet.
-/

open Polynomial

namespace TauCeti.RigidCohomology

/-! ## Weight separation (README §2) -/

section WeightSeparation

/-- **Descent of rationality** (`RD.7/rational-zeta-descent-and-fatou` (a)): a power series
over `k` that is rational over an extension field `L` is rational over `k`
(Hankel determinants; Deligne, Weil I, p. 276; Milne, Lemma 27.9). -/
theorem rationalSeries_descent {k L : Type*} [Field k] [Field L] [Algebra k L]
    (f : PowerSeries k) (A B : L[X]) (hB : B.coeff 0 ≠ 0)
    (h : (B : PowerSeries L) * PowerSeries.map (algebraMap k L) f = (A : PowerSeries L)) :
    ∃ A' B' : k[X], B'.coeff 0 ≠ 0 ∧ (B' : PowerSeries k) * f = (A' : PowerSeries k) := by
  sorry

/-- **Local Fatou lemma** (`RD.7/rational-zeta-descent-and-fatou` (b)): the coprime
normalised numerator and denominator of an `ℓ`-adically integral rational series are
`ℓ`-adically integral (Milne, Lemma 27.10, with `≤ 1` at the boundary). -/
theorem fatou_local (ℓ : ℕ) [Fact ℓ.Prime] (f : PowerSeries ℤ_[ℓ])
    (hf : PowerSeries.constantCoeff f = 1) (G H : ℚ_[ℓ][X]) (hcop : IsCoprime G H)
    (hG : G.coeff 0 = 1) (hH : H.coeff 0 = 1)
    (h : (H : PowerSeries ℚ_[ℓ]) * PowerSeries.map (algebraMap ℤ_[ℓ] ℚ_[ℓ]) f =
      (G : PowerSeries ℚ_[ℓ])) :
    (∀ n, ‖G.coeff n‖ ≤ 1) ∧ ∀ n, ‖H.coeff n‖ ≤ 1 := by
  sorry

/-- **Fatou's lemma** (`RD.7/rational-zeta-descent-and-fatou` (c)): an integral power series
with constant term `1` that is rational over `ℚ` is `A/B` with `A, B ∈ 1 + tℤ[t]` coprime. -/
theorem fatou (f : PowerSeries ℤ) (hf : PowerSeries.constantCoeff f = 1) (A B : ℚ[X])
    (hB : B.coeff 0 ≠ 0)
    (h : (B : PowerSeries ℚ) * PowerSeries.map (Int.castRingHom ℚ) f = (A : PowerSeries ℚ)) :
    ∃ A' B' : ℤ[X], A'.coeff 0 = 1 ∧ B'.coeff 0 = 1 ∧
      IsCoprime (A'.map (Int.castRingHom ℚ)) (B'.map (Int.castRingHom ℚ)) ∧
      ((B'.map (Int.castRingHom ℚ) : ℚ[X]) : PowerSeries ℚ) *
          PowerSeries.map (Int.castRingHom ℚ) f =
        ((A'.map (Int.castRingHom ℚ) : ℚ[X]) : PowerSeries ℚ) := by
  sorry

/-- Unit test `fatou` (non-example: integrality cannot be dropped). The rational series
`1/(1 − t/2)` has the coprime normalised presentation `1/(1 − t/2)`, whose denominator is not
integral; its expansion `Σ t^n/2^n` is not in `ℤ⟦t⟧`. -/
example : ((1 - C (1 / 2 : ℚ) * X : ℚ[X]) : PowerSeries ℚ) *
    PowerSeries.mk (fun n => (1 / 2 : ℚ) ^ n) = 1 := by
  sorry

/-- **Weight separation** (`RD.7/weight-separated-factor-extraction`), with the family realised
in `ℂ`: if `∏ P_i^{(−1)^{i+1}} = A/B` with `A, B ∈ 1 + tℤ[t]` coprime, and every reciprocal
root of `P_i` (a root of its reverse) is a Weil `q`-number of weight `i` (all conjugates of
absolute value `q^{i/2}`; the inline condition stands for
`DeligneWeightsAndPurity:DWP.0/weil-q-number`), then every `P_i` comes from a unique
polynomial in `1 + tℤ[t]`. -/
theorem weightSeparated_factor_extraction (q : ℕ) (hq : 1 < q) (N : ℕ)
    (A B : ℤ[X]) (hA : A.coeff 0 = 1) (hB : B.coeff 0 = 1)
    (hcop : IsCoprime (A.map (Int.castRingHom ℚ)) (B.map (Int.castRingHom ℚ)))
    (P : Fin (N + 1) → ℂ[X]) (hP0 : ∀ i, (P i).coeff 0 = 1)
    (hprod : (∏ i ∈ Finset.univ.filter (fun i : Fin (N + 1) => Odd (i : ℕ)), P i) *
        B.map (Int.castRingHom ℂ) =
      (∏ i ∈ Finset.univ.filter (fun i : Fin (N + 1) => Even (i : ℕ)), P i) *
        A.map (Int.castRingHom ℂ))
    (hpure : ∀ i, ∀ α ∈ (P i).reverse.roots, IsAlgebraic ℚ α ∧
      ∀ β ∈ (minpoly ℚ α).aroots ℂ, ‖β‖ = (q : ℝ) ^ (((i : ℕ) : ℝ) / 2)) :
    ∃ Fac : Fin (N + 1) → ℤ[X], ∀ i, (Fac i).coeff 0 = 1 ∧
      (Fac i).map (Int.castRingHom ℂ) = P i := by
  sorry

/-- Unit test of weight separation on `ℙ¹` over `𝔽_q`: the factors `1 − t`, `1`, `1 − qt`
satisfy the product relation with `A = 1`, `B = (1 − t)(1 − qt)`. -/
example (q : ℕ) :
    ((1 : ℂ[X]) : ℂ[X]) * ((1 - X) * (1 - C (q : ℂ) * X)) =
      ((1 - X) * (1 - C (q : ℂ) * X)) * 1 := by
  ring

end WeightSeparation

/-! ## Elliptic curves (README §3) -/

section Elliptic

/-- `𝔽₇ = ZMod 7` is a field. -/
local instance : Fact (Nat.Prime 7) := ⟨by norm_num⟩

variable {F : Type*} [Field F] [Finite F]

/-- The Weil factor `1 − a t + q t²` of a Weierstrass model over a finite field with `q`
elements, with `a = q + 1 − #W(F)` Tau Ceti's `frobeniusTrace`. For an elliptic model it is
`P_1(E, t)` of `RD.7/abelian-variety-crystalline-frobenius-polynomial` (3). -/
noncomputable def ellipticWeilFactor (W : WeierstrassCurve F) : ℤ[X] :=
  1 - C W.frobeniusTrace * X + C (Nat.card F : ℤ) * X ^ 2

theorem ellipticWeilFactor_coeff_zero (W : WeierstrassCurve F) :
    (ellipticWeilFactor W).coeff 0 = 1 := by
  sorry

theorem ellipticWeilFactor_natDegree (W : WeierstrassCurve F) :
    (ellipticWeilFactor W).natDegree = 2 := by
  sorry

/-- Unit test (computation): `y² = x³ + x + 1` over `𝔽₇` has `5` points, `a = 3`, and Weil
factor `1 − 3t + 7t²`. -/
example : ellipticWeilFactor (⟨0, 0, 0, 1, 1⟩ : WeierstrassCurve (ZMod 7)) =
    1 - 3 * X + 7 * X ^ 2 := by
  sorry

/-- Unit test (supersingular): `y² = x³ + x` over `𝔽₇` has `8` points, `a = 0`, and Weil
factor `1 + 7t²`. -/
example : ellipticWeilFactor (⟨0, 0, 0, 1, 0⟩ : WeierstrassCurve (ZMod 7)) = 1 + 7 * X ^ 2 := by
  sorry

end Elliptic

/-! ## Point-counting certificates (README §4) -/

section PointCounting

/-- The exponent `⌊log_p(2m + 1)⌋` of Kedlaya's Lemma 2 (`RD.7/kedlaya-reduction-denominators` (a)). -/
def kedlayaNegativeExponent (p m : ℕ) : ℕ := Nat.log p (2 * m + 1)

/-- The exponent `⌊log_p((2g + 1)(2m + 3) − 2)⌋` of the corrected Lemma 3
(`RD.7/kedlaya-reduction-denominators` (b); Edixhoven, Lemma 4.3.5). -/
def kedlayaPositiveExponent (p g m : ℕ) : ℕ := Nat.log p ((2 * g + 1) * (2 * m + 3) - 2)

/-- The exponent `c = ⌊log_p(2g − 1)⌋` bounding the index of the crystalline lattice
(`RD.7/hyperelliptic-integral-frobenius-lattice` (2); Edixhoven, Proposition 5.3.1). -/
def latticeDefectExponent (p g : ℕ) : ℕ := Nat.log p (2 * g - 1)

/-- Tuitman's reconstruction precision `max_{1 ≤ i ≤ g} (⌊log_p binom(4g, i) + ni/2⌋ + 1)`
(`RD.7/tuitman-precision-certification` (1); Tuitman, Proposition 4.2). -/
noncomputable def tuitmanReconstructionPrecision (p g n : ℕ) : ℕ :=
  (Finset.Icc 1 g).sup fun i =>
    (⌊Real.logb p ((4 * g).choose i) + ((n * i : ℕ) : ℝ) / 2⌋).toNat + 1

/-- Unit test: for `Q = x³ + x + 1` and `p = 5`, `m = 0`, the corrected exponent is `1`. -/
example : kedlayaPositiveExponent 5 1 0 = 1 := by
  sorry

/-- Unit test (non-example for the printed Lemma 3 and the literal errata formula):
both give the exponent `⌊log_5 1⌋ = 0` here. -/
example : Nat.log 5 (2 * 0 + 1) = 0 ∧ Nat.log 5 ((2 * 1 + 1) * (0 + 1) - 2) = 0 := by
  sorry

/-- Unit test: the reduction of `y dx = Q dx/y` for `Q = x³ + x + 1` uses
`d((2/5)xy) = (2/5)(Q + xQ'/2) dx/y` and leaves `(2/5)x + 3/5`, whose denominators are `5`. -/
example :
    let Q : ℚ[X] := X ^ 3 + X + 1
    Q - C (2 / 5) * (Q + C (1 / 2) * (X * derivative Q)) = C (2 / 5) * X + C (3 / 5) := by
  sorry

/-- Unit test: genus two over `𝔽_3` has lattice defect exponent `1`; genus one has `0`. -/
example : latticeDefectExponent 3 2 = 1 ∧ latticeDefectExponent 3 1 = 0 := by
  sorry

/-- Unit test: genus two over `𝔽_7` (`n = 1`) needs precision `3`. -/
example : tuitmanReconstructionPrecision 7 2 1 = 3 := by
  sorry

/-- Unit test: the Weil factor of `y² = x⁵ + x + 3` over `𝔽₇` is the reverse characteristic
polynomial convention of Mathlib (`Matrix.charpolyRev`): its reverse is the monic
`T⁴ + 3T³ + 7T² + 21T + 49`. -/
example : (1 + 3 * X + 7 * X ^ 2 + 21 * X ^ 3 + 49 * X ^ 4 : ℤ[X]).reverse =
    X ^ 4 + 3 * X ^ 3 + 7 * X ^ 2 + 21 * X + 49 := by
  sorry

end PointCounting

/-! ## Unstated interfaces

The following packet names need carriers that the pinned libraries do not have (rigid and
crystalline cohomology, tubes, divided power envelopes of formal schemes, convergent
isocrystals, dagger algebras of curves, Tate realisations of abelian varieties, period rings).
They are README targets, not Lean declarations:

* `RD.7/tube-to-envelope-comparison-map`: `RigidCohomology.tubeToEnvelope`,
  `tubeToEnvelope_affine`, `tubeToEnvelope_unique`, `tubeToEnvelope_comm_deriv`,
  `tubeToEnvelope_naturality`, `tubeToEnvelope_lift`, `tubeToEnvelope_coeff`,
  `tubeToEnvelope_cohomology`; tests `tubeToEnvelope_point_in_disc`,
  `tubeToEnvelope_lift_eq_id`, `tubeToEnvelope_not_surjective`,
  `tubeToEnvelope_compat_crystalline` (need tubes, `sp_*` and completed PD envelopes).
* `RD.7/comparison-map-quasi-isomorphism` and
  `RD.7/crystalline-rigid-comparison-with-coefficients` (need rigid and crystalline cohomology).
* `RD.7/abelian-variety-crystalline-frobenius-polynomial` (needs crystalline `H¹` and the
  étale Tate realisation; its elliptic case (3) is `ellipticWeilFactor` above).
* `RD.7/kedlaya-reduction-denominators` and `RD.7/hyperelliptic-integral-frobenius-lattice`
  (need the dagger algebra `A†` and its Monsky–Washnitzer cohomology; their exponents are
  `kedlayaNegativeExponent`, `kedlayaPositiveExponent` and `latticeDefectExponent` above).
* `RD.7/tuitman-frobenius-structure-algorithm`: `RigidCohomology.Tuitman.Assumption1`,
  `goodCompactification`, `frobeniusLift`, `reduce`, `reduce_unique`, `frobeniusMatrix`,
  `frobeniusMatrix_eq_rigid`, `charpolyRev_eq_weilFactor`, `hyperelliptic`; tests
  `hyperelliptic_genus_two`, `genus_zero`, `assumption_printed_too_strong`, `lift_independent`
  (need weakly complete algebras and their de Rham cohomology); and
  `RD.7/tuitman-precision-certification`, whose numerical part is
  `tuitmanReconstructionPrecision` above.
* `RD.7/mieda-p-adic-picard-lefschetz`, `RD.7/kloosterman-semistable-realization` and
  `RD.7/kloosterman-newton-above-hodge` (need rigid and log-crystalline cohomology, the
  Kloosterman F-isocrystal and the period rings `B_st`, `B_cris`).
-/

end TauCeti.RigidCohomology
