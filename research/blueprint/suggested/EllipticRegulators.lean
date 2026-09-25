/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/EllipticRegulators.md` is definitive. These statements
suggest Lean forms so that contributors and reviewers can converge on names and
signatures. They claim no implementation.

BP-EllipticRegulators, revised by the independent review REV-EllipticRegulators:
partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Synced with the reviewed packet (75 nodes) and elaborated with the Lean toolchain of
Mathlib 082e2d3 against its prebuilt library: `sorry` is the only warning. The file
imports only Mathlib; the Tau Ceti declarations the packet cites are named in comments.

Objects that another roadmap owns are not re-planned: the complex uniformisation is
ModularCurvesPartII R12.1's (RS-06), so ER.1 is prototyped on the normalised lattice
`ℤ + τℤ`; η(f, g) is Polylogarithms P.5's and the real Deligne complex MotivicEtaleKTheory
M.8's, so ER.2 is prototyped in coordinates on `ℂ/(ℤ + τℤ)` at `ω = dz`; the Bloch-Wigner
function `D` is Polylogarithms P.1's and is not in a pinned library, so it is a variable,
and statements about it are forms, true once `D` is instantiated by P.1's function; the
modular curve `X₁(N)` is ModularCurvesPartII R12.3's and is absent at the pins, so the
modular units are left out. Nothing below encodes a missing theorem as an assumed
structure field or as a placeholder `Prop`, and no statement is `True`. `sorry` occurs
only as the body of a declaration or as a proof obligation inside one.

Unit tests are `example`s whose docstring begins "Test `<name>`" with the name the packet
gives, or comments `-- Test <name>: not stated; needs …`. An API item or node that cannot
be stated honestly yet is a comment `-- <name>: not stated; needs <missing object>`.
-/
import Mathlib.Analysis.SpecialFunctions.Elliptic.Weierstrass
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.Analysis.Complex.Periodic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.NumberTheory.BernoulliPolynomials
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Analysis.Meromorphic.Divisor
import Mathlib.Analysis.Calculus.LogDeriv
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.NumberTheory.GaussSum
import Mathlib.NumberTheory.Harmonic.EulerMascheroni
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar

noncomputable section

open Complex
open scoped UpperHalfPlane MatrixGroups Real

namespace TauCeti.EllipticRegulator


/-! ## ER.1 — lattice choice and the parameter `q` -/

/-- `ℤ + τℤ` as a Mathlib period pair. Mathlib's `PeriodPair` is not oriented; `τ ∈ ℍ` is. -/
def normalisedPeriodPair (τ : ℍ) : PeriodPair where
  ω₁ := 1
  ω₂ := τ
  indep := sorry

/-- `q = exp(2πiτ)`: Mathlib's `qParam` with period one. -/
abbrev qParameter (τ : ℍ) : ℂ := Function.Periodic.qParam 1 τ

theorem qParameter_norm_lt_one (τ : ℍ) : ‖qParameter τ‖ < 1 := sorry

theorem qParameter_ne_zero (τ : ℍ) : qParameter τ ≠ 0 := sorry

@[simp] theorem qParameter_add_one (τ : ℍ) :
    qParameter (ModularGroup.T • τ) = qParameter τ := sorry

theorem qParameter_real_iff (τ : ℍ) :
    (qParameter τ).im = 0 ↔ ∃ m : ℤ, 2 * (τ : ℂ).re = m := sorry

/-- `ℂ/(ℤ + τℤ) ≃ ℂˣ/q^ℤ`, induced by `z ↦ exp(2πiz)`. -/
def multiplicativePresentation (τ : ℍ) :
    (ℂ ⧸ (normalisedPeriodPair τ).lattice.toAddSubgroup) ≃+
      Additive (ℂˣ ⧸ Subgroup.zpowers (Units.mk0 (qParameter τ) (qParameter_ne_zero τ))) :=
  sorry

/-- Test `q_at_i` (computation). -/
example : qParameter UpperHalfPlane.I = Real.exp (-2 * Real.pi) := sorry

/-- Test `q_eq_qParam` (compatibility). -/
example (τ : ℍ) : qParameter τ = Function.Periodic.qParam 1 τ := rfl

/-- Test `nonreal_q` (non-example): the basis `(γ₁ + 2γ₂, γ₂)` of `y² = x³ - x` gives
`τ' = (2 + i)/5`, whose `q` is not real. -/
example : (cexp (2 * π * I * ((2 + I) / 5))).im ≠ 0 := sorry

/-! ## ER.3 — `D` is Polylogarithms P.1's Bloch–Wigner function. It is not in a pinned
library, so it is an explicit argument and each lemma assumes only what it uses. -/

section ER3

variable (D : ℂ → ℝ)

/-- `D_q(x) = ∑_{n ∈ ℤ} D(x qⁿ)` (Bloch Lemma 8.1.1, Brunault (1.38)). -/
def ellipticDilog (q x : ℂ) : ℝ := ∑' n : ℤ, D (x * q ^ n)

/-- Bloch's `J(x) = log|x| log|1 - x|`. -/
def blochJ₀ (x : ℂ) : ℝ := Real.log ‖x‖ * Real.log ‖1 - x‖

/-- Bloch's companion (8.1.4). NOT a function on `E`: see `blochJ_mul_q`. -/
def blochJ (q x : ℂ) : ℝ :=
  (∑' n : ℕ, blochJ₀ (x * q ^ n)) - ∑' n : ℕ, blochJ₀ (x⁻¹ * q ^ (n + 1))

/-- The `q`-invariant regularisation (Zagier 1990, p. 616; Bloch Lemma 10.2.2). -/
def ellipticJ (q x : ℂ) : ℝ :=
  blochJ q x + Real.log ‖q‖ ^ 2 / 3 *
    Polynomial.aeval (Real.log ‖x‖ / Real.log ‖q‖) (Polynomial.bernoulli 3)

/-- Bloch's convention `R_q = J + i D_q` (8.1.2). Brunault's `2 R_ω(P, 0)` is `-conj (R_q x)`. -/
def ellipticR (q x : ℂ) : ℂ := (ellipticJ q x : ℂ) + (ellipticDilog D q x : ℂ) * I

theorem ellipticDilog_mul_q (hD : Continuous D) {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1)
    (hx : x ≠ 0) : ellipticDilog D q (q * x) = ellipticDilog D q x := sorry

theorem ellipticDilog_inv (hD : ∀ z, D z⁻¹ = -D z) {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) :
    ellipticDilog D q x⁻¹ = -ellipticDilog D q x := sorry

theorem blochJ_mul_q {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hx : x ≠ 0) :
    blochJ q (q * x) - blochJ q x = -Real.log ‖x‖ ^ 2 := sorry

theorem ellipticJ_mul_q {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hx : x ≠ 0) :
    ellipticJ q (q * x) = ellipticJ q x := sorry

theorem ellipticR_im (q x : ℂ) : (ellipticR D q x).im = ellipticDilog D q x := sorry

/-- ER.3/lattice-basis-change: `R_{γτ}(e^{2πi z/(cτ+d)}) = R_τ(e^{2πi z}) / (c τ̄ + d)`. -/
theorem ellipticR_smul (hD : ∀ z, D z⁻¹ = -D z) (γ : SL(2, ℤ)) (τ : ℍ) (z : ℂ) :
    ellipticR D (qParameter (γ • τ)) (cexp (2 * π * I * z / ((γ 1 0 : ℂ) * τ + γ 1 1))) =
      ellipticR D (qParameter τ) (cexp (2 * π * I * z)) /
        ((γ 1 0 : ℂ) * (starRingEnd ℂ) (τ : ℂ) + γ 1 1) := sorry

/-- Test `blochJ_not_invariant` (non-example): `J_q(qx) - J_q(x) = -(log|x|)² ≠ 0` for `|x| ≠ 1`. -/
example {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hx : ‖x‖ ≠ 1) (hx₀ : x ≠ 0) :
    blochJ q (q * x) ≠ blochJ q x := sorry

/-- Test `real_locus` (degenerate): for real `q` and `|x| = 1`, `J(q; x) = 0`. -/
example {q x : ℂ} (hq₀ : q ≠ 0) (hq : ‖q‖ < 1) (hqr : q.im = 0) (hx : ‖x‖ = 1) :
    ellipticJ q x = 0 := sorry

end ER3

/-! ## ER.2 in coordinates on `ℂ/Λ` (ω = dz). -/

/-- `∂̄u = ((∂ₓ + i ∂ᵧ) u) / 2` for a real function on `ℂ`. -/
def dbar (u : ℂ → ℝ) (z : ℂ) : ℂ :=
  ((fderiv ℝ u z 1 : ℂ) + I * (fderiv ℝ u z I : ℂ)) / 2

/-- Brunault (1.27) at `ω = dz`: `∫ log|f| dz ∧ ∂̄ log|g| = -2i ∫ log|f| ∂_{z̄} log|g| dx dy`
over a fundamental domain of `Λ` (`Ω^{1,0}` of `ℂ/Λ` is spanned by `dz`). -/
def symbolRegulator (L : PeriodPair) (f g : ℂ → ℂ) : ℂ :=
  -2 * I * ∫ z in ZSpan.fundamentalDomain L.basis,
    (Real.log ‖f z‖ : ℂ) * dbar (fun w => Real.log ‖g w‖) z

/-- Test `const_entry` (degenerate). -/
example (L : PeriodPair) (c : ℂ) (g : ℂ → ℂ) (hg : Meromorphic g)
    (hper : ∀ l ∈ L.lattice, ∀ z, g (z + l) = g z) :
    symbolRegulator L (fun _ => c) g = 0 := sorry

/- test `theta_quotient_value` (computation): for τ = 0.2 + 1.1i and the theta quotients of the
packet test, `‖symbolRegulator (normalisedPeriodPair τ) f g - (-0.1656624 + 0.0350051 * I)‖ < 1e-6`;
θ₁ is expressible through Mathlib's `jacobiTheta₂`. -/


/-! ## ER.4-ER.6 -/

section Diamond

variable {A : Type*} [AddCommGroup A]
open AddMonoidAlgebra

/-- ER.4/the-diamond-convolution: `(Σ mᵢ[Pᵢ]) ⋄ (Σ nⱼ[Qⱼ]) = Σ mᵢnⱼ[Qⱼ - Pᵢ]`, i.e. the product in
`ℤ[A]` of the reflection of `D` with `D'` (Bloch's `F⁻ * G`, Lemma 8.1.4). -/
noncomputable def diamond (D D' : AddMonoidAlgebra ℤ A) : AddMonoidAlgebra ℤ A :=
  AddMonoidAlgebra.mapDomain (fun a : A => -a) D * D'

/-- The degree (augmentation) of a divisor. -/
noncomputable def divDeg (D : AddMonoidAlgebra ℤ A) : ℤ := D.coeff.sum fun _ n => n

@[simp] theorem diamond_single_single (P Q : A) (m n : ℤ) :
    diamond (single P m) (single Q n) = single (Q - P) (m * n) := by sorry
@[simp] theorem diamond_add_left (D₁ D₂ D' : AddMonoidAlgebra ℤ A) :
    diamond (D₁ + D₂) D' = diamond D₁ D' + diamond D₂ D' := by sorry
@[simp] theorem diamond_add_right (D D'₁ D'₂ : AddMonoidAlgebra ℤ A) :
    diamond D (D'₁ + D'₂) = diamond D D'₁ + diamond D D'₂ := by sorry
theorem divDeg_diamond (D D' : AddMonoidAlgebra ℤ A) :
    divDeg (diamond D D') = divDeg D * divDeg D' := by sorry
theorem diamond_single_left (P : A) (D' : AddMonoidAlgebra ℤ A) :
    diamond (single P 1) D' = AddMonoidAlgebra.mapDomain (fun a => a - P) D' := by sorry
/-- The opposite convention is the reflection of `D ⋄ D'`, not its negation. -/
theorem diamond_comm (D D' : AddMonoidAlgebra ℤ A) :
    diamond D' D = AddMonoidAlgebra.mapDomain (fun a : A => -a) (diamond D D') := by sorry
theorem diamond_map {B : Type*} [AddCommGroup B] (φ : A →+ B) (D D' : AddMonoidAlgebra ℤ A) :
    AddMonoidAlgebra.mapDomain φ (diamond D D') =
      diamond (AddMonoidAlgebra.mapDomain φ D) (AddMonoidAlgebra.mapDomain φ D') := by sorry

/-- Test `diamond_two_points` (computation): `[1] ⋄ [3] = [2]` in `ℤ[ℤ/5]`. -/
example : diamond (single (1 : ZMod 5) 1) (single 3 1) = single 2 1 := by sorry
/-- Test `diamond_degree_zero` (degenerate). -/
example (D' : AddMonoidAlgebra ℤ A) : diamond 0 D' = 0 := by sorry
/-- Test `diamond_opposite_is_reflection` (non-example): the opposite convention is not the negation. -/
example : AddMonoidAlgebra.mapDomain (fun a : ZMod 5 => -a) (diamond (single 1 1) (single 3 1)) ≠
    -diamond (single (1 : ZMod 5) 1) (single 3 1) := by sorry
/-- Test `diamond_eq_convolution` (characterisation): the coefficients of `D ⋄ D'`. -/
example [DecidableEq A] (D D' : AddMonoidAlgebra ℤ A) (c : A) :
    (diamond D D').coeff c = D.coeff.sum fun a m => D'.coeff.sum fun b n => if b - a = c then m * n else 0 := by
  sorry
/-- Test `diamond_odd_sign` (characterisation): an odd function changes sign under the opposite convention. -/
example (F : A → ℂ) (hF : ∀ a, F (-a) = -F a) (D D' : AddMonoidAlgebra ℤ A) :
    (diamond D' D).coeff.sum (fun a n => (n : ℂ) * F a) =
      -(diamond D D').coeff.sum (fun a n => (n : ℂ) * F a) := by sorry

end Diamond

section ER4

variable (D : ℂ → ℝ)

/-- ER.3's `R_q = J(q; ·) + i D_q` in the coordinate `z` of `ℂ/(ℤ + ℤτ)`: `x = exp(2πiz)`. -/
def ellipticRτ (τ : ℍ) (z : ℂ) : ℂ := ellipticR D (qParameter τ) (cexp (2 * π * I * z))

/-- Evaluation of `ellipticR` on a divisor of `ℂ` (points of `E_τ` given by lifts). -/
noncomputable def ellipticRDiv (τ : UpperHalfPlane) (Δ : AddMonoidAlgebra ℤ ℂ) : ℂ :=
  Δ.coeff.sum fun z n => (n : ℂ) * ellipticRτ D τ z

/-- The divisor of a `(ℤ + ℤτ)`-periodic meromorphic function on the half-open fundamental
parallelogram, as a finite divisor (from `MeromorphicOn.divisor`). -/
noncomputable def fundDivisor (τ : UpperHalfPlane) (f : ℂ → ℂ) : AddMonoidAlgebra ℤ ℂ := sorry

/-- ER.2's regulator at `ω = dz`: `∫_{E_τ} log|f| dz ∧ ∂̄ log|g| = -i ∫∫ log|f| · conj(g'/g) dx dy`. -/
noncomputable def regulatorAtDz (τ : UpperHalfPlane) (f g : ℂ → ℂ) : ℂ :=
  -Complex.I * ((τ : ℂ).im : ℂ) * ∫ s in (0 : ℝ)..1, ∫ t in (0 : ℝ)..1,
    (Real.log ‖f (s + t * τ)‖ : ℂ) * (starRingEnd ℂ) (logDeriv g (s + t * τ))

/-- ER.4/the-divisor-formula: `r({f,g})(dz) = ½ · conj (R_q((f) ⋄ (g)))`, no tame-symbol hypothesis. -/
theorem divisor_formula (τ : UpperHalfPlane) (f g : ℂ → ℂ)
    (hf : MeromorphicOn f Set.univ) (hg : MeromorphicOn g Set.univ)
    (hf₁ : ∀ z, f (z + 1) = f z) (hfτ : ∀ z, f (z + τ) = f z)
    (hg₁ : ∀ z, g (z + 1) = g z) (hgτ : ∀ z, g (z + τ) = g z)
    (hf₀ : ∃ z, f z ≠ 0) (hg₀ : ∃ z, g z ≠ 0) :
    regulatorAtDz τ f g =
      (1 / 2 : ℂ) * (starRingEnd ℂ) (ellipticRDiv D τ (diamond (fundDivisor τ f) (fundDivisor τ g))) := by
  sorry

/- ER.4/bloch-lift-formula is a statement about lifts to `ℂˣ`; its signature needs Bloch's
unregularised `J_q`, owned by ER.3. Left out here rather than stated as `True`. -/

/-- `(ρ) = (C² - 1)[0] - Σ_{b ∈ E[C] ∖ 0} [b]`, torsion points lifted to `(k + ℓτ)/C`. -/
noncomputable def blochRhoDiv (τ : UpperHalfPlane) (C : ℕ) : AddMonoidAlgebra ℤ ℂ :=
  AddMonoidAlgebra.single 0 ((C : ℤ) ^ 2 - 1) -
    ∑ k ∈ Finset.range C, ∑ l ∈ Finset.range C,
      if (k, l) = (0, 0) then 0 else AddMonoidAlgebra.single (((k : ℂ) + l * τ) / C) 1

/-- `(f_a) = C[a] - C[0]`. -/
noncomputable def torsionFunctionDiv (C : ℕ) (a : ℂ) : AddMonoidAlgebra ℤ ℂ :=
  AddMonoidAlgebra.single a (C : ℤ) - AddMonoidAlgebra.single 0 (C : ℤ)

/-- ER.4/the-regulator-of-the-corrected-classes (Bloch Lemma 10.2.2): `R_q(S_a) = C³ R_q(a)`. -/
theorem ellipticRDiv_blochClass (τ : UpperHalfPlane) (C : ℕ) (hC : 0 < C) (k l : ℕ)
    (hk : k < C) (hl : l < C) (hkl : (k, l) ≠ (0, 0)) :
    ellipticRDiv D τ (diamond (blochRhoDiv τ C) (torsionFunctionDiv C (((k : ℂ) + l * τ) / C))) =
      (C : ℂ) ^ 3 * ellipticRτ D τ (((k : ℂ) + l * τ) / C) := by sorry

/-- ER.4/finite-fourier-transform: Bloch (10.2.1), normalised by `1/C²`. -/
noncomputable def finiteFourier10 (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ)
    (kl : ZMod C × ZMod C) : ℂ :=
  ((C : ℂ) ^ 2)⁻¹ * ∑ ab : ZMod C × ZMod C, f ab *
    Complex.exp (2 * Real.pi * Complex.I *
      ((-((ab.1.val * kl.1.val : ℕ) : ℤ) + ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C)

/-- ER.4/bloch-theorem-10-2-1, in analytic form (`R_q(S_{x/C}) = C³ R_q(x/C)`). -/
theorem bloch_theorem_10_2_1 (τ : UpperHalfPlane) (C : ℕ) [NeZero C]
    (f : ZMod C × ZMod C → ℂ) (hodd : ∀ x, f (-x) = -f x) :
    ∑ kl : ZMod C × ZMod C, finiteFourier10 C f kl *
        ((C : ℂ) ^ 3 * ellipticRτ D τ (((kl.1.val : ℂ) + kl.2.val * τ) / C)) =
      Complex.I * ((τ : ℂ).im : ℂ) ^ 2 * (C : ℂ) ^ 3 / Real.pi *
        ∑' mn : {p : ℤ × ℤ // p ≠ 0}, f ((mn.1.1 : ZMod C), (mn.1.2 : ZMod C)) /
          (((mn.1.1 : ℂ) * τ + mn.1.2) ^ 2 * ((mn.1.1 : ℂ) * (starRingEnd ℂ) τ + mn.1.2)) := by
  sorry

/-- API `finiteFourier10_inversion`. -/
theorem finiteFourier10_inversion (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) (ab : ZMod C × ZMod C) :
    f ab = ∑ kl : ZMod C × ZMod C, finiteFourier10 C f kl *
      Complex.exp (2 * Real.pi * Complex.I *
        ((((ab.1.val * kl.1.val : ℕ) : ℤ) - ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C) := by
  sorry

/-- API `finiteFourier10_odd`: `f` is odd iff its transform is. -/
theorem finiteFourier10_odd (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) :
    (∀ x, f (-x) = -f x) ↔ ∀ x, finiteFourier10 C f (-x) = -finiteFourier10 C f x := by
  sorry

/-- API `finiteFourier10_single`: the transform of a point mass. -/
theorem finiteFourier10_single (C : ℕ) [NeZero C] (ab kl : ZMod C × ZMod C) :
    finiteFourier10 C (fun x => if x = ab then 1 else 0) kl =
      ((C : ℂ) ^ 2)⁻¹ * Complex.exp (2 * Real.pi * Complex.I *
        ((-((ab.1.val * kl.1.val : ℕ) : ℤ) + ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C) := by
  sorry

/-- Test `finiteFourier10_C3` (computation): `C = 3`, `f = δ_(1,0) − δ_(2,0)`. -/
example : finiteFourier10 3 (fun x => if x = (1, 0) then 1 else if x = (2, 0) then -1 else 0) (1, 0) =
    -(Complex.I * (Real.sqrt 3 : ℂ)) / 9 := by
  sorry

/-- Test `finiteFourier10_zero` (degenerate). -/
example (C : ℕ) [NeZero C] : finiteFourier10 C 0 = 0 := by
  sorry

/-- Test `finiteFourier10_inv` (characterisation): inversion recovers `f`. -/
example (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ) :
    (fun ab : ZMod C × ZMod C => ∑ kl : ZMod C × ZMod C, finiteFourier10 C f kl *
      Complex.exp (2 * Real.pi * Complex.I *
        ((((ab.1.val * kl.1.val : ℕ) : ℤ) - ((ab.2.val * kl.2.val : ℕ) : ℤ) : ℤ) : ℂ) / C)) = f := by
  sorry

-- Test finiteFourier10_not_one_over_C: not stated; it compares Bloch's printed normalisation with this one
-- and is recorded in the packet as a non-example of Theorem 10.2.1's constant.

/- ER.4/transfer-and-the-trace-formula needs Milnor K₂ of function fields with the transfer
(K2SymbolsBrauer T.4); its signature belongs next to those declarations and is left out here. -/

/-! ## ER.5 — the CM example (analytic core; the K-theory classes come from EllipticKTheory E.7) -/

/-- The pairing `⟨a + bτ, k + ℓτ⟩ = e^{2πi(-aℓ + bk)/C}` on `O/CO`, in coordinates `(a, b)`. -/
noncomputable def pairingO (C : ℕ) [NeZero C] (x y : ZMod C × ZMod C) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I *
    ((-((x.1.val * y.2.val : ℕ) : ℤ) + ((x.2.val * y.1.val : ℕ) : ℤ) : ℤ) : ℂ) / C)

/-- ER.5/fourier-transform-on-O-mod-C: `F̂(x) = C⁻¹ Σ_y F(y) ⟨x, y⟩` (the kernel of the proof of
Lemma 11.1.7; the kernel printed in (11.1.1) is `⟨y, x⟩`, source issue E1). -/
noncomputable def fourierO (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (x : ZMod C × ZMod C) : ℂ :=
  (C : ℂ)⁻¹ * ∑ y, F y * pairingO C x y

/-- API `pairingO_swap`: `⟨x, y⟩ · ⟨y, x⟩ = 1`. -/
theorem pairingO_swap (C : ℕ) [NeZero C] (x y : ZMod C × ZMod C) : pairingO C x y * pairingO C y x = 1 := by
  sorry

/-- API `fourierO_inversion`. -/
theorem fourierO_inversion (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (y : ZMod C × ZMod C) :
    F y = (C : ℂ)⁻¹ * ∑ x, fourierO C F x * (pairingO C x y)⁻¹ := by
  sorry

/-- API `fourierO_eq_finiteFourier10`: in the coordinates `(m, n) ↦ n + mτ`. -/
theorem fourierO_eq_finiteFourier10 (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (kl : ZMod C × ZMod C) :
    finiteFourier10 C (fun mn => F (mn.2, mn.1)) kl = (C : ℂ)⁻¹ * fourierO C F (kl.2, kl.1) := by
  sorry

/-- Test `fourierO_normalisation` (compatibility): `fourierO` is `C` times Lecture 10's transform with the
arguments swapped, not the `1/C²` average. -/
example (C : ℕ) [NeZero C] (F : ZMod C × ZMod C → ℂ) (x : ZMod C × ZMod C) :
    fourierO C F x = (C : ℂ) * finiteFourier10 C (fun mn => F (mn.2, mn.1)) (x.2, x.1) := by
  sorry

-- pairingO_mul_left: not stated (Lemma 11.1.4); needs the multiplication of O/CO in the coordinates
-- `a + bτ`, i.e. the minimal polynomial of τ, which the CM setup of ER.5 fixes (CM.4, not pinned).
-- Test pairingO_lemma_11_1_4: not stated; needs pairingO_mul_left for O = ℤ[i], C = 4.
-- Test fourierO_chi_Qi: not stated; needs the character χ of ER.5 for ℚ(i), C = 4 (CM.4).
-- Test fourierO_printed_kernel: not stated; it is `lattice_sum_form` with the printed kernel and the opposite
-- sign (source issue EllipticRegulators/E7).

/-- ER.5/lattice-sum-form-of-theorem-10-2-1 ((11.1.2) with the corrected kernel). Here `τ` is a
root of `X² + A X + B` and `F` is a function on `O/CO` in the coordinates `(a, b) ↦ a + bτ`. -/
theorem lattice_sum_form (τ : UpperHalfPlane) (C : ℕ) [NeZero C]
    (F : ZMod C × ZMod C → ℂ) (hodd : ∀ x, F (-x) = -F x) :
    ∑ x : ZMod C × ZMod C, fourierO C F x *
        ((C : ℂ) ^ 3 * ellipticRτ D τ (((x.1.val : ℂ) + x.2.val * τ) / C)) =
      Complex.I * ((τ : ℂ).im : ℂ) ^ 2 * (C : ℂ) ^ 4 / Real.pi *
        ∑' mn : {p : ℤ × ℤ // p ≠ 0}, F ((mn.1.1 : ZMod C), (mn.1.2 : ZMod C)) /
          (((mn.1.1 : ℂ) + mn.1.2 * τ) ^ 2 * ((mn.1.1 : ℂ) + mn.1.2 * (starRingEnd ℂ) τ)) := by
  sorry

/-- ER.5/the-L-value-theorem, worked instance for 32a2 (τ = i, C = 4, index points 1/4 and
(3+2i)/4): `L(E,2) = (π/2)(D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4}))`, i.e. in terms of `ellipticR`. -/
theorem bloch_L_value_32a2 :
    (WeierstrassCurve.mk 0 0 0 (-1) 0 : WeierstrassCurve ℚ).LSeries 2 =
      (Real.pi / 2 : ℂ) * ((ellipticRτ D UpperHalfPlane.I (1 / 4) +
        ellipticRτ D UpperHalfPlane.I ((3 + 2 * Complex.I) / 4)).im : ℂ) := by sorry

/- The general ER.5 theorem needs the Grössencharakter of a CM curve (CM.4) and the class `U`
(EllipticKTheory E.7); it is left out here rather than stated with placeholder hypotheses. -/

/-! ## ER.6 — integral parts and the Beilinson statement
The integral part is EllipticKTheory E.6's `integralPart`; the Deligne target is ER.2's. The
regulator on the integral part, `BeilinsonConjecture` and `beilinson_forms_equivalent` are stated
against those declarations and are left out of this file until they exist; in particular no
`True`-valued placeholder is used for them. -/

end ER4

/-! ## ER.7-ER.8 -/

section ER7

open Filter Topology

/-! ## ER.7 — Eisenstein series, the Rankin–Selberg integral, the explicit Beilinson theorem -/

variable {N : ℕ} [NeZero N]

/-- Brunault (3.4): `E_x(z, s) = Σ' Im(z)^s / |m z + n|^(2s)` over `(m, n) ≡ x (mod N)`, `Re s > 1`. -/
noncomputable def eisensteinE (x : ZMod N × ZMod N) (z : ℍ) (s : ℂ) : ℂ :=
  ∑' p : {mn : ℤ × ℤ // mn ≠ 0 ∧ ((mn.1 : ZMod N), (mn.2 : ZMod N)) = x},
    ((z.im : ℝ) : ℂ) ^ s / ((‖(p.1.1 : ℂ) * z + p.1.2‖ : ℝ) : ℂ) ^ (2 * s)

/-- Brunault (3.9). -/
noncomputable def eisensteinStar (x : ZMod N × ZMod N) (z : ℍ) : ℝ := sorry

theorem tendsto_eisensteinE_sub_pole (x : ZMod N × ZMod N) (z : ℍ) :
    Tendsto (fun σ : ℝ => eisensteinE x z σ - (Real.pi : ℂ) / ((N : ℂ) ^ 2 * ((σ : ℂ) - 1)))
      (𝓝[>] 1) (𝓝 (eisensteinStar x z : ℂ)) := sorry

/-- (3.15), `x` a row vector. -/
theorem eisensteinStar_smul (x : ZMod N × ZMod N) (g : SL(2, ℤ)) (z : ℍ) :
    eisensteinStar x (g • z) =
      eisensteinStar (x.1 * (g 0 0 : ZMod N) + x.2 * (g 1 0 : ZMod N),
                      x.1 * (g 0 1 : ZMod N) + x.2 * (g 1 1 : ZMod N)) z := sorry

/-- Définition 70. -/
noncomputable def eisensteinStarOf (f : ZMod N → ℂ) (z : ℍ) : ℂ :=
  ∑ v, f v * eisensteinStar ((0 : ZMod N), v) z

theorem eisensteinStarOf_odd (f : ZMod N → ℂ) (hf : ∀ v, f (-v) = -f v) (z : ℍ) :
    eisensteinStarOf f z = 0 := sorry

/-- Test `eisensteinStarOf_odd` (degenerate): an odd `f`, e.g. an odd Dirichlet character, gives `0`. -/
example (χ : DirichletCharacter ℂ N) (hχ : χ.Odd) (z : ℍ) : eisensteinStarOf (fun v => χ v) z = 0 := by
  sorry

/-- API `eisensteinStar_conj`: `E*_(u,v)(−z̄) = E*_(−u,v)(z)`. -/
theorem eisensteinStar_conj (x : ZMod N × ZMod N) (z : ℍ) :
    eisensteinStar x ⟨-(starRingEnd ℂ) (z : ℂ), by sorry⟩ = eisensteinStar (-x.1, x.2) z := by
  sorry

/-- Test `eisensteinStar_T` (non-example of the column convention): `E*_(u,v)(z + 1) = E*_(u,u+v)(z)`. -/
example (x : ZMod N × ZMod N) (z : ℍ) :
    eisensteinStar x (ModularGroup.T • z) = eisensteinStar (x.1, x.1 + x.2) z := by
  sorry

-- eisensteinStarOf_fourier: not stated; needs the Fourier expansion (3.27) of E*_f in the cusp
-- parameter, whose K-Bessel-free form requires the Kronecker limit formulas (gap).
-- Test pole_normalisation: not stated; a statement that a limit does not exist needs the residue
-- π/N² of E_x at s = 1, which is ER.7/real-analytic-eisenstein-series's `tendsto_eisensteinE_sub_pole`.


/-- Test `eisensteinStar_levelOne_i` (Kronecker's first limit formula at `z = i`). -/
example : (eisensteinStar (N := 1) (0, 0) UpperHalfPlane.I : ℝ) =
    2 * Real.pi * (Real.eulerMascheroniConstant - Real.log 2
      - 2 * Real.log ‖ModularForm.eta Complex.I‖) := sorry

/-- Test `fourier_convention`: Brunault's `f̂` is `ZMod.dft`; for primitive even `χ`, `χ̂ = τ(χ) χ̄`. -/
example (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) (he : χ.Even) (b : ZMod N) :
    ZMod.dft (fun v => χ v) b = gaussSum χ ZMod.stdAddChar * χ⁻¹ b := sorry

/-- Test `modularUnit_divisor_level5` at the level of L-values: `L(2, (·/5)) = 4π²/(25√5)`. -/
example (χ : DirichletCharacter ℂ 5) (hχ : χ.Even) (h1 : χ ≠ 1) :
    DirichletCharacter.LFunction χ 2 = 4 * (Real.pi : ℂ) ^ 2 / (25 * ((Real.sqrt 5 : ℝ) : ℂ)) := sorry

/-- ER.3 (to be supplied there with a real signature): the elliptic dilogarithm of a real
elliptic curve at a rational point, in the orientation making `∫_{E(ℝ)} ω > 0`. -/
noncomputable def ellipticDilogOfCurve (W : WeierstrassCurve ℚ) (P : ℚ × ℚ) : ℝ := sorry

/-- ER.7/the-X1-11-example (Corollaire 101) for `y² + y = x³ − x²`, `P = (0,0)`. -/
theorem LSeries_X1_11_two (W : WeierstrassCurve ℚ) (hW : W = ⟨0, -1, 1, 0, 0⟩) :
    W.LSeries 2 = (10 / 11 : ℂ) * Real.pi * ellipticDilogOfCurve W (0, 0) := sorry

theorem ellipticDilog_X1_11_exotic (W : WeierstrassCurve ℚ) (hW : W = ⟨0, -1, 1, 0, 0⟩) :
    ellipticDilogOfCurve W (1, -1) = 3 / 2 * ellipticDilogOfCurve W (0, 0) := sorry

/-! ## ER.8 — worked examples
The regulator values of ER.8/the-integrality-worked-example
(`r_E({x, y} + {-1, x})(ω) = -(5 i / 4) D_E(P) = -(π i / 2) L'(E, 0)`) and the P¹ identity
(`∫_γ η(z, 1 - z) = D(e^{iπ/3})`) are stated once ER.2's `symbolRegulator` and Polylogarithms'
Bloch–Wigner function have real signatures; until then they are left out, not replaced by `True`. -/

end ER7

/-! ## Items not yet stated
Each needs an object that no pinned library has, named on its line. -/

/-! ### ER.1 -/

-- ER.1/complex-uniformisation: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedTau: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_pullback_dz: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_indep: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_changeOfBasis: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- normalisedUniformisation_conj: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test tau_of_y2_eq_x3_sub_x: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test tau_negative_discriminant: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test shift_gamma2: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test basis_change_S: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).
-- Test real_needs_H1plus: not stated; needs ModularCurvesPartII R12.1's uniformisation of the Weierstrass scheme over ℂ and the homology basis of E(ℂ), neither pinned; the file works on the normalised lattice ℤ + τℤ (`normalisedPeriodPair`).

-- ER.1/the-q-parameter-and-the-multiplicative-presentation: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- multiplicativePresentation_conj: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- multiplicativePresentation_orientation: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- Test q_add_one: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- Test real_points_on_circles: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.
-- Test negative_q: not stated; needs the real structure of E (ER.1/all-embeddings-and-the-conjugation-action) or a computation of periods; the q-parameter itself is `qParameter`.

-- ER.1/periods-and-the-comparison-isomorphism: not stated; needs the de Rham-Betti comparison (ComplexComparisonPartII C5) and singular H₁ of E(ℂ) with the Hurewicz comparison (gap).

-- ER.1/all-embeddings-and-the-conjugation-action: not stated; needs an elliptic curve over a number field with its complex points at every embedding, which needs R12.1 at each embedding.

/-! ### ER.2 -/

-- ER.2/the-deligne-cohomology-target: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_equivHom: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_finrank: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_toReal: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- ellipticDeligneTarget_toReal_orientation: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test finrank_over_Q: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test finrank_over_Qi: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test not_the_product: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test real_symbols_land_in_minus: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.
-- Test orientation_sign: not stated; needs the real Deligne complex of MotivicEtaleKTheory M.8 and H¹(E(ℂ), ℝ(1)), neither pinned; the target is used here through `symbolRegulator` at ω = dz.

-- ER.2/the-eta-form-and-its-differential-identity: not stated; needs Polylogarithms P.5's η(f, g) as a pinned differential form.

-- ER.2/the-regulator-on-symbols: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_symbol: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_steinberg: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_const: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_antisymm: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_eq_half_eta: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_periods: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- symbolRegulator_real: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test steinberg: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test theta_quotient_value: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test not_dc: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.
-- Test real_values: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2) as the domain; the file states the integral formula `symbolRegulator` on pairs of periodic meromorphic functions.

-- ER.2/the-normalisation-factor: not stated; needs Beilinson's regulator from M.8 and Polylogarithms P.5/regulator-induces-beilinson.

-- ER.2/torsion-ambiguity-has-zero-regulator: not stated; needs K₂ of a number-field curve and its torsion (EllipticKTheory E.3), not pinned.

/-! ### ER.3 -/

-- ER.3/the-elliptic-dilogarithm: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_converges: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_continuous: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_conj: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_distribution: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_real: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- ellipticDilog_orientation_sign: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test value_at_i: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test vanishing: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test distribution_two: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test one_sided_not_invariant: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).
-- Test brunault_fourier: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration (it is the variable `D` here, so value tests cannot be stated).

-- ER.3/the-companion-and-Bloch-convention: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- blochJ_divisor: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticJ_eq_blochJ_of_permitted: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticJ_inv: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticR_re: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- ellipticJ_eq_zero_of_real: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test two_sided_diverges: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test ellipticJ_invariant: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test value: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.
-- Test permitted_lift: not stated; needs Polylogarithms P.1's Bloch-Wigner function and divisors with permitted lifts; the functions themselves are `blochJ`, `ellipticJ`, `ellipticR`.

-- ER.3/the-steinberg-relation-by-truncation: not stated; needs K₂ of the function field of E (K2SymbolsBrauer T.2/matsumoto) and Bloch's truncation estimates (the lemma nodes of ER.3).

-- ER.3/fourier-and-kronecker-eisenstein: not stated; needs Fourier series on the torus ℂ/Λ with conditional convergence, and the Bloch-Wigner function as a pinned declaration.

-- ER.3/bloch-wigner-bounds-at-zero: not stated; needs Polylogarithms P.1's Bloch-Wigner function as a pinned declaration.

-- ER.3/green-function-of-the-curve: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_fourier: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_translate: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_closedForm: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_logAbs: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- greenFunction_eq_arakelov: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test integral_zero: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test closed_form_value: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test laplacian: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test not_absolutely_convergent: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.
-- Test arakelov: not stated; needs the Arakelov Green kernel of GrossZagierAndArithmeticHeights GZ.2 and distributions on ℂ/Λ, neither pinned.

-- ER.3/goncharov-function-and-the-regulator: not stated; needs the Green function of ER.3/green-function-of-the-curve.

-- ER.3/steinberg-relation-on-the-projective-line: not stated; needs Polylogarithms P.1's Bloch-Wigner function and P.5's projective-line identities.

-- ER.3/truncated-theta-products: not stated; needs the truncated theta products of Bloch's Lecture 8 with their zero counts (Tau Ceti's Rouché and argument principle, not imported).

-- ER.3/zeros-of-truncated-products: not stated; needs Tau Ceti's `TauCeti.rouche_windingNumber_comp` and `TauCeti.argumentPrinciple_windingNumber` (not imported).

-- ER.3/companion-truncation-estimates: not stated; needs the truncated theta products of Bloch's Lecture 8.

-- ER.3/steinberg-for-the-companion: not stated; needs K₂ of the function field of E and the truncation estimates.

-- ER.3/steinberg-for-the-dilogarithm: not stated; needs K₂ of the function field of E and the truncation estimates.

/-! ### ER.4 -/

-- finiteFourier10_eq_fourierO: stated above as `fourierO_eq_finiteFourier10` (the same relation, read from ER.5).

/-! ### ER.5 -/

-- ER.5/the-CM-setup-and-the-hecke-character: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cmHeckeCharacter: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cmHeckeCharacter_conductor: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cmFiniteCharacter_conj: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- deuringComparison: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- deuringComparison_badPrimes: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- cm_maximal_order: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test deuring_32a2: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test deuring_bad_prime_32a2: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test not_from_endomorphisms: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.
-- Test cm_fields_over_Q: not stated; needs the Grössencharakter of a CM elliptic curve (ComplexMultiplicationAndExplicitReciprocity CM.4) and Hecke characters on ideals (Tau Ceti GlobalNumberFields layer 9), neither pinned.

-- ER.5/the-class-U: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- cmCharExtend: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_summand_orbit: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_galois_invariant: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_descends: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- blochClassU_rational: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_Qi_C4: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_zero_point: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_descends_test: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).
-- Test blochClassU_index_set: not stated; needs K₂ of E over a number field with the classes S_a of EllipticKTheory E.7/bloch-classes and the Galois action (CM.2).

-- ER.5/nonvanishing-and-what-is-not-claimed: not stated; needs the Euler product of a Hecke L-series over ideals (Tau Ceti ArithmeticDirichletSeries layer 0).


-- ER.5/cm-twisting-and-distribution: not stated; needs the CM action of O on E[C] (CM.2).

-- ER.5/fourier-transform-of-the-character: not stated; needs the finite character of the Grössencharakter (CM.4).

/-! ### ER.6 -/

-- ER.6/the-regulator-on-the-integral-part: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorOnIntegralPart: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorOnIntegralPart_apply: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorOnIntegralPart_realify: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- regulatorTarget_finrank: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_compat: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorTarget_Qi: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_bloch: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_not_defined_off_integral: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.
-- Test regulatorOnIntegralPart_constants: not stated; needs EllipticKTheory E.6's integral part and M.8's Deligne target, neither in a pinned library.

-- ER.6/the-beilinson-statement: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjecture: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjectureAtTwo: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjecture.finrank: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- BeilinsonConjecture.isIso: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_rank_over_Q: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_rank_over_Qi: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_whole_K2_false: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).
-- Test beilinson_at_two_needs_no_continuation: not stated; needs the integral part (EllipticKTheory E.6) and the regulator on it (ER.6/the-regulator-on-the-integral-part).

-- ER.6/three-conclusions-that-are-not-the-same: not stated; needs the statements it compares (ER.5, ER.7, ER.6/the-beilinson-statement).

-- ER.6/the-vertical-step-that-is-required: not stated; needs EllipticKTheory E.6/vertical-residues.

-- ER.6/potentially-good-reduction-integrality: not stated; needs regular models and vertical residues (EllipticKTheory E.6, StableReduction layer 5).

-- ER.6/beilinson-forms-equivalent: not stated; needs the functional equation of L(E, s) (EllipticCurveModularity R29.6), not pinned.

/-! ### ER.7 -/

-- ER.7/modular-units-and-their-divisors: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_logabs: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_leadingCoeff: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_unique: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_divisor: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_add: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- modularUnit_eq_siegel: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test modularUnit_odd: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test modularUnit_trivial_character: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test divisor_on_cusps: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.
-- Test modularUnit_primitive_fourier: not stated; needs the modular curve X₁(N)(ℂ) with its cusps (ModularCurvesPartII R12.3), absent at the pins; the Eisenstein series it is built from are stated above.

-- ER.7/the-regulator-integral-and-its-evaluation: not stated; needs X₁(N), newforms with character and K₂ of X₁(N) (ModularCurvesPartII R12.3, ModularForms layers 0 and 7).

-- ER.7/the-explicit-theorem-for-an-elliptic-curve: not stated; needs the newform of E (EllipticCurveModularity R29.6) and twisted L-values; its N = 11 instance is `LSeries_X1_11_two`.

-- ER.7/the-pushforward-and-its-hypotheses: not stated; needs a modular parametrisation X₀(N) → E (EllipticCurveModularity R29.5).

-- ER.7/kronecker-limit-formulas: not stated; needs the Dedekind eta function's transformation law and Siegel's continuation of E_x (gap); `ModularForm.eta` is pinned but the limit formula is not.

-- ER.7/dirichlet-series-convolution: not stated; needs L(f, s) of a newform with character (ModularForms layer 7).

-- ER.7/rankin-selberg-integral: not stated; needs the Petersson product on X₁(N) (ModularCurvesPartII R12.5, ModularForms layer 7).

-- ER.7/manin-drinfeld: not stated; needs the Jacobian of X₁(N) with its cuspidal subgroup (JacobianChallenge layer F, ModularCurvesPartII R12.3).

-- ER.7/harmonicity-of-eisenstein-series: not stated; needs X₁(N)(ℂ) as a Riemann surface (ModularCurvesPartII R12.3).

-- ER.7/divisors-of-character-units: not stated; needs the modular units u_χ on X₁(N).

-- ER.7/rationality-of-modular-units: not stated; needs the model of X₁(N) over ℚ (ModularCurvesPartII R12.6).

-- ER.7/symbols-of-modular-units-in-K2: not stated; needs K₂ of X₁(N) (EllipticKTheory-style K-theory of the modular curve), not pinned.

-- ER.7/explicit-beilinson-theorem-degeneracy: not stated; needs degeneracy maps of modular curves (ModularCurvesPartII R14.1).

-- ER.7/real-structure-of-the-regulator: not stated; needs the real structure of X₁(N) (ModularCurvesPartII R12.6).

-- ER.7/spanning-for-prime-level: not stated; needs K₂ of X₁(p) and its regulator.

-- ER.7/eta-form-of-divisors: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv_antisymm: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv_bilinear: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- d_etaDiv: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- etaDiv_eq_units: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- integral_eisenstein_eq_etaDiv: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_closed_degree_zero: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_not_closed: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_self: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.
-- Test etaDiv_units_compat: not stated; needs one-forms on ℍ with Eisenstein coefficients, which need the modular units and a differential-forms API on ℍ.

-- ER.7/manin-cycle-and-its-boundary: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- maninCycle: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- maninCycle_boundary: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- maninCycle_bilinear: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- Test maninCycle_closed_primitive: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- Test maninCycle_zero: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).
-- Test maninCycle_odd: not stated; needs relative homology of X₁(N) with Manin's presentation (ModularForms layer 8).

-- ER.7/unfolding-over-the-fundamental-domain: not stated; needs integration over a fundamental domain of Γ₁(N) (Mathlib's automorphize lemma exists, but the Eisenstein integrand needs X₁(N)).

-- ER.7/cycle-formula: not stated; needs relative cycles on X₁(N).

-- ER.7/nonvanishing-of-a-twisted-value: not stated; needs twisted L-values of a newform (ModularForms layer 7) and Merel's appendix (gap).

-- ER.7/rational-combination-for-L-E-2: not stated; needs the Néron period of E (NeronModelsAndSemistableAbelianVarieties R11.6) and the newform of E.

-- ER.7/prime-level-L-value-formula: not stated; needs the Rankin-Selberg residue (AutomorphicLFunctionsAndLocalFactors AL.3).

-- ER.7/regulator-under-finite-pushforward: not stated; needs pushforward of K₂ along finite maps of curves (gap).

/-! ### ER.8 -/

-- ER.8/the-syntomic-comparison: not stated; needs the syntomic regulator (PadicHodgeRegulators D.5) and Coleman integration (ColemanIntegration L1).

-- ER.8/the-normalisation-example: not stated; needs Polylogarithms P.5's η(f, g) as a pinned form and P.1's Bloch-Wigner function.

-- ER.8/the-CM-worked-example: not stated; needs Bloch's class U (ER.5) and EllipticKTheory E.8's certificates.

-- ER.8/the-nonrational-torsion-example: not stated; needs points over ℚ(√−3) and the transfer of K₂ (EllipticKTheory E.7/transfer-of-certified-classes).

-- ER.8/the-conductor-14-example: not stated; needs the regulator of Siegel-unit classes of Brunault 2016, which needs X₁(14).

end TauCeti.EllipticRegulator
