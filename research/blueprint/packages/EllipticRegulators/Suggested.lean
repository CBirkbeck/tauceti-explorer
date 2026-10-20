import Mathlib

/-!
# EllipticRegulators: representative target signatures

The roadmap is `README.md`; this file is not exhaustive. It records the light definitions and the
milestone statements of the roadmap that can be written against the pinned Mathlib and Tau Ceti, so
that contributors and reviewers converge on names, signatures and conventions. Everything that needs
carriers absent at the pins (`K₂` of curves, Deligne cohomology, the Bloch–Wigner function, modular
units, syntomic regulators) is specified in the README only; the closing comment lists those targets.

Design choices made explicit here:

* periods are Mathlib `PeriodPair`s with an additional positive-orientation field, and
  `q = Function.Periodic.qParam 1 τ`;
* Bloch's function `R_q = J(q; ·) + i D_q` is given by its absolutely convergent weight-two
  Kronecker–Eisenstein series in the oriented basis `(1, τ)`, with the character
  `exp(2πi(mb − na))` at the point `a + bτ`;
* the regulator of a symbol on the torus `ℂ/(ℤ + ℤτ)` is Brunault's integral with `∂̄`, evaluated at
  `dz`, so `dz ∧ ∂̄ log|g| = −i·conj(g′/g) dx dy`;
* the diamond convolution takes the second point minus the first;
* the finite Fourier transform `torsionFourier` of `(ℤ/C)²` is normalised by `C⁻²`, the
  normalisation in which Bloch's finite Fourier identity carries the factor `C³`;
* determinant witnesses are formed in a fixed rational Betti basis, never in a real one.
-/

namespace TauCetiRoadmap.EllipticRegulators

open Complex Real

/-! ## Carriers of the headline statements -/

/-- The weight-two Kronecker–Eisenstein summand at the point `a + bτ` and the lattice index
`v = (m, n)`: zero at `v = 0`, and `exp(2πi(mb − na)) / ((m + nτ)² (m + n τ̄))` otherwise
(Layer 3, §3.4). -/
noncomputable def kroneckerTerm (τ : ℂ) (a b : ℝ) (v : ℤ × ℤ) : ℂ :=
  if v = 0 then 0 else
    cexp (2 * π * I * ((v.1 : ℂ) * b - (v.2 : ℂ) * a)) /
      (((v.1 : ℂ) + v.2 * τ) ^ 2 * ((v.1 : ℂ) + v.2 * (starRingEnd ℂ τ)))

/-- Bloch's function `R_q(x) = J(q; x) + i D_q(x)` at `x = exp(2πi(a + bτ))`, `q = exp(2πiτ)`,
through its Kronecker–Eisenstein series `R_q = −i (Im τ)²/π · Σ_v K_τ(a, b; v)` (Layer 3, §3.6).
Its imaginary part is the elliptic dilogarithm `D_q` and its real part the regularised companion. -/
noncomputable def ellipticR (τ : ℂ) (a b : ℝ) : ℂ :=
  -I * ((τ.im ^ 2 / π : ℝ) : ℂ) * ∑' v : ℤ × ℤ, kroneckerTerm τ a b v

/-- Real coordinates `(a, b)` of `w = a + bτ` in the oriented basis `(1, τ)`. -/
noncomputable def torusCoord (τ w : ℂ) : ℝ × ℝ :=
  (w.re - w.im / τ.im * τ.re, w.im / τ.im)

example : torusCoord I (1 + 2 * I) = (1, 2) := by
  norm_num [torusCoord]

example : torusCoord 1 I = (0, 0) := by
  norm_num [torusCoord]

/-- A doubly periodic meromorphic function for the lattice `ℤ + ℤτ` that does not vanish
identically near any point. -/
def IsEllipticFunction (τ : ℂ) (f : ℂ → ℂ) : Prop :=
  MeromorphicOn f Set.univ ∧ Function.Periodic f 1 ∧ Function.Periodic f τ ∧
    ∀ z, meromorphicOrderAt f z ≠ ⊤

example (τ : ℂ) : IsEllipticFunction τ (fun _ => 1) := by
  refine ⟨MeromorphicOn.const 1, ?_, ?_, ?_⟩
  · intro z
    simp
  · intro z
    simp
  · intro z
    simp [meromorphicOrderAt_const]

example (τ : ℂ) : ¬ IsEllipticFunction τ (fun _ => 0) := by
  intro h
  simpa [meromorphicOrderAt_const] using h.2.2.2 0

open Classical in
/-- The orders of `f` are the multiplicities `m i` at the pairwise incongruent points `P i`,
counted modulo `ℤ + ℤτ`, and zero elsewhere. -/
def HasTorusDivisor (τ : ℂ) (f : ℂ → ℂ) {n : ℕ} (P : Fin n → ℂ) (m : Fin n → ℤ) : Prop :=
  (∀ i j, i ≠ j → ∀ k l : ℤ, P i - P j ≠ k + l * τ) ∧
    ∀ z : ℂ, meromorphicOrderAt f z =
      ((∑ i, if ∃ k l : ℤ, z - P i = k + l * τ then m i else 0 : ℤ) : WithTop ℤ)

example (τ : ℂ) : HasTorusDivisor τ (fun _ => 1) (Fin.elim0 : Fin 0 → ℂ) Fin.elim0 := by
  simp [HasTorusDivisor, meromorphicOrderAt_const]

example (τ : ℂ) : ¬ HasTorusDivisor τ (fun _ => 1) (fun _ : Fin 2 => 0) (fun _ => 0) := by
  intro h
  exact h.1 0 1 (by decide) 0 0 (by simp)

/-- Brunault's regulator `∫ log|f| · dz ∧ ∂̄ log|g|` of the symbol `{f, g}` on `ℂ/(ℤ + ℤτ)`,
written over the parallelogram `z = s + tτ`, `0 ≤ s, t ≤ 1` (Layer 2, §2.5). -/
noncomputable def torusRegulator (τ : ℂ) (f g : ℂ → ℂ) : ℂ :=
  -I * (τ.im : ℂ) * ∫ s in (0 : ℝ)..1, ∫ t in (0 : ℝ)..1,
    (Real.log ‖f (s + t * τ)‖ : ℂ) *
      starRingEnd ℂ (deriv g (s + t * τ) / g (s + t * τ))

/-- The Weierstrass curve `y² = x³ − x` over `ℚ` (Cremona 32a2), with complex multiplication by
`ℤ[i]`. -/
def curve32a2 : WeierstrassCurve ℚ := ⟨0, 0, 0, -1, 0⟩

example : curve32a2.Δ = 64 := by
  norm_num [curve32a2, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-! ## Headline theorems -/

/-- **Bloch's divisor formula** (§4.2). For elliptic functions `f`, `g` on `ℂ/(ℤ + ℤτ)` with
divisors `Σ mᵢ[Pᵢ]` and `Σ kⱼ[Qⱼ]`, the regulator of `{f, g}` at `dz` is half the conjugate of
Bloch's function on the diamond convolution `Σ mᵢ kⱼ [Qⱼ − Pᵢ]`. No condition on tame symbols. -/
theorem torusRegulator_eq_half_conj_diamond (τ : ℂ) (hτ : 0 < τ.im) {f g : ℂ → ℂ}
    (hf : IsEllipticFunction τ f) (hg : IsEllipticFunction τ g)
    {n n' : ℕ} (P : Fin n → ℂ) (m : Fin n → ℤ) (Q : Fin n' → ℂ) (k : Fin n' → ℤ)
    (hfP : HasTorusDivisor τ f P m) (hgQ : HasTorusDivisor τ g Q k) :
    torusRegulator τ f g = (1 / 2 : ℂ) * starRingEnd ℂ (∑ i, ∑ j, ((m i * k j : ℤ) : ℂ) *
      ellipticR τ (torusCoord τ (Q j - P i)).1 (torusCoord τ (Q j - P i)).2) := by
  sorry

/-- **Bloch's CM theorem** for `y² = x³ − x` (§5.15, Gaussian case, with the scalar of §5.14):
`L(E, 2) = (π/2)·(D_q(e^{πi/2}) + D_q(e^{2πi(3+2i)/4}))` with `q = e^{−2π}`. -/
theorem curve32a2_LSeries_two :
    curve32a2.LSeries 2 = ((π / 2 : ℝ) : ℂ) *
      (((ellipticR I (1 / 4) 0).im + (ellipticR I (3 / 4) (1 / 2)).im : ℝ) : ℂ) := by
  sorry

/-- **The Steinberg relation** for the torus regulator (§2.5). -/
theorem torusRegulator_one_sub (τ : ℂ) (hτ : 0 < τ.im) {f : ℂ → ℂ}
    (hf : IsEllipticFunction τ f) (hf' : IsEllipticFunction τ (fun z => 1 - f z)) :
    torusRegulator τ f (fun z => 1 - f z) = 0 := by
  sorry

/-! ## Layer 1: The analytic elliptic curve and its periods -/

/-- Oriented period data: a Mathlib `PeriodPair` whose ratio lies in the upper half-plane
(§1.1). Mathlib's `PeriodPair` asks only for real linear independence. -/
structure RegulatorPeriods extends PeriodPair where
  im_pos : 0 < (ω₂ / ω₁).im

namespace RegulatorPeriods

variable (D : RegulatorPeriods)

/-- The point `τ = ω₂/ω₁` of the upper half-plane. -/
noncomputable def tau : UpperHalfPlane := ⟨D.ω₂ / D.ω₁, D.im_pos⟩

/-- The parameter `q = exp(2πiτ)`, Mathlib's `qParam` with period one. -/
noncomputable def q : ℂ := Function.Periodic.qParam 1 (D.tau : ℂ)

/-- The normalised coordinate `z/ω₁`. -/
noncomputable def normalise (z : ℂ) : ℂ := z / D.ω₁

/-- `|q| = exp(−2π Im τ) < 1` (§1.2). -/
theorem norm_q_lt_one : ‖D.q‖ < 1 := by
  sorry

/-- `q ≠ 0` (§1.2). -/
theorem q_ne_zero : D.q ≠ 0 := by
  sorry

/-- Change of oriented basis by `M = (a b; c d) ∈ SL₂(ℤ)` (§1.4): the new periods
`(dω₁ + cω₂, bω₁ + aω₂)` have ratio `M • τ`. -/
theorem rebase_ratio (M : Matrix.SpecialLinearGroup (Fin 2) ℤ) :
    ((M 0 1 : ℂ) * D.ω₁ + (M 0 0 : ℂ) * D.ω₂) / ((M 1 1 : ℂ) * D.ω₁ + (M 1 0 : ℂ) * D.ω₂) =
      ((M • D.tau : UpperHalfPlane) : ℂ) := by
  sorry

/-- Conjugate periods `(ω̄₁, −ω̄₂)` have ratio `−conj τ` (§1.5). -/
theorem conjugate_ratio :
    (-(starRingEnd ℂ D.ω₂)) / (starRingEnd ℂ D.ω₁) = -(starRingEnd ℂ (D.tau : ℂ)) := by
  sorry

/-- Real-adapted periods: if `ω̄₁ = ω₁` and `ω̄₂ = −ω₂ + m ω₁` then `2 Re τ = m` (§1.7). -/
theorem two_re_tau_of_real (m : ℤ) (h₁ : starRingEnd ℂ D.ω₁ = D.ω₁)
    (h₂ : starRingEnd ℂ D.ω₂ = -D.ω₂ + m * D.ω₁) : 2 * (D.tau : ℂ).re = m := by
  sorry

/-- In the half-integral real shape `q` is a negative real number (§1.7). -/
theorem q_neg_of_re_half (h : (D.tau : ℂ).re = 1 / 2) : D.q.im = 0 ∧ D.q.re < 0 := by
  sorry

example (h₁ : D.ω₁ = 1) (h₂ : D.ω₂ = I) : (D.tau : ℂ) = I := by
  simp [tau, h₁, h₂]

example : ¬ ∃ D : RegulatorPeriods, D.ω₁ = 1 ∧ D.ω₂ = -I := by
  rintro ⟨D, h₁, h₂⟩
  have h := D.im_pos
  rw [h₁, h₂] at h
  norm_num at h

end RegulatorPeriods

/-! ## Layer 2: Deligne cohomology and the symbol regulator -/

/-- Antisymmetry of the torus regulator (§2.5, by integration by parts). -/
theorem torusRegulator_swap (τ : ℂ) (hτ : 0 < τ.im) {f g : ℂ → ℂ}
    (hf : IsEllipticFunction τ f) (hg : IsEllipticFunction τ g) :
    torusRegulator τ g f = -torusRegulator τ f g := by
  sorry

/-- A constant first entry has zero regulator (§2.5). -/
theorem torusRegulator_const_left (τ : ℂ) (hτ : 0 < τ.im) (c : ℂ) {g : ℂ → ℂ}
    (hg : IsEllipticFunction τ g) :
    torusRegulator τ (fun _ => c) g = 0 := by
  sorry

example (τ : ℂ) (f : ℂ → ℂ) (c : ℂ) : torusRegulator τ f (fun _ => c) = 0 := by
  simp [torusRegulator]

/-! ## Layer 3: The elliptic dilogarithm and its companion -/

example (τ : ℂ) (a b : ℝ) : kroneckerTerm τ a b 0 = 0 := by
  simp [kroneckerTerm]

example : kroneckerTerm I 0 0 (0, 1) = -I := by
  simp [kroneckerTerm, Complex.conj_I]

/-- Absolute convergence of the Kronecker–Eisenstein series (§3.6). -/
theorem summable_kroneckerTerm (τ : ℂ) (hτ : 0 < τ.im) (a b : ℝ) :
    Summable fun v : ℤ × ℤ => ‖kroneckerTerm τ a b v‖ := by
  sorry

/-- `R_q` is odd (§3.2–3.3). -/
theorem ellipticR_neg (τ : ℂ) (hτ : 0 < τ.im) (a b : ℝ) :
    ellipticR τ (-a) (-b) = -ellipticR τ a b := by
  sorry

/-- `R_q` is a function on the torus: invariance under `x ↦ qx` (§3.3). -/
theorem ellipticR_add_one_right (τ : ℂ) (a b : ℝ) :
    ellipticR τ a (b + 1) = ellipticR τ a b := by
  sorry

/-- The value at the test point `τ = i`, `x = i` (§3.2):
`D_{e^{−2π}}(i) = 0.94326230871390659…`. -/
theorem ellipticR_I_quarter_im :
    |(ellipticR I (1 / 4) 0).im - 0.9432623087139066| < 1e-12 := by
  sorry

/-- Change of the lattice basis by `S` (§3.7): `R_{q(−1/τ)}(x′) = R_q(x)/τ̄`, with `x′` the image of
`x = exp(2πi(a + bτ))` under `z ↦ z/τ`, of coordinates `(b, −a)` in the basis `(1, −1/τ)`. -/
theorem ellipticR_S (τ : ℂ) (hτ : 0 < τ.im) (a b : ℝ) :
    ellipticR (-τ⁻¹) b (-a) = ellipticR τ a b / starRingEnd ℂ τ := by
  sorry

/-- **The Steinberg relation for `R_q`** (§3.16): for an elliptic function `f` and a constant `K`
with `K − f` not identically zero, `R_q` vanishes on the diamond convolution of the divisors of `f`
and `K − f`. -/
theorem ellipticR_diamond_steinberg (τ : ℂ) (hτ : 0 < τ.im) {f : ℂ → ℂ} (K : ℂ)
    (hf : IsEllipticFunction τ f) (hfK : IsEllipticFunction τ (fun z => K - f z))
    {n n' : ℕ} (P : Fin n → ℂ) (m : Fin n → ℤ) (Q : Fin n' → ℂ) (k : Fin n' → ℤ)
    (hfP : HasTorusDivisor τ f P m) (hgQ : HasTorusDivisor τ (fun z => K - f z) Q k) :
    ∑ i, ∑ j, ((m i * k j : ℤ) : ℂ) *
      ellipticR τ (torusCoord τ (Q j - P i)).1 (torusCoord τ (Q j - P i)).2 = 0 := by
  sorry

/-! ## Layer 4: The divisor formula and Bloch's classes -/

/-- The diamond convolution `D ⋄ D′ = Σ mᵢ nⱼ [Qⱼ − Pᵢ]` of two divisors (§4.1). -/
noncomputable def diamond {A : Type*} [AddCommGroup A] (D D' : AddMonoidAlgebra ℤ A) :
    AddMonoidAlgebra ℤ A :=
  AddMonoidAlgebra.mapDomain (fun a => -a) D * D'

example : diamond (AddMonoidAlgebra.single (1 : ZMod 5) (1 : ℤ))
    (AddMonoidAlgebra.single (3 : ZMod 5) 1) = AddMonoidAlgebra.single (2 : ZMod 5) 1 := by
  simp [diamond, AddMonoidAlgebra.mapDomain_single, AddMonoidAlgebra.single_mul_single]
  congr 1

/-- The opposite convention is the reflection, not the negation (§4.1). -/
theorem diamond_comm {A : Type*} [AddCommGroup A] (D D' : AddMonoidAlgebra ℤ A) :
    diamond D' D = AddMonoidAlgebra.mapDomain (fun a => -a) (diamond D D') := by
  sorry

/-- The finite Fourier transform of `(ℤ/C)²`, normalised by `C⁻²` (§4.4). -/
noncomputable def torsionFourier (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ)
    (kl : ZMod C × ZMod C) : ℂ :=
  ((C : ℂ) ^ 2)⁻¹ * ∑ ab : ZMod C × ZMod C,
    f ab * ZMod.stdAddChar (-(ab.1 * kl.1) + ab.2 * kl.2)

example (f : ZMod 1 × ZMod 1 → ℂ) : torsionFourier 1 f 0 = f 0 := by
  have h : ∀ b : ZMod 1 × ZMod 1, b = 0 := by decide
  simp [torsionFourier]
  rw [Finset.sum_eq_single 0 (fun b _ hb => absurd (h b) hb) (by simp)]

example : torsionFourier 3 (fun ab => if ab = (1, 0) then 1 else 0) (1, 0) =
    (1 / 9 : ℂ) * ZMod.stdAddChar (-1 : ZMod 3) := by
  classical
  simp [torsionFourier]
  norm_num

/-- Inversion for `torsionFourier` (§4.4). -/
theorem torsionFourier_inversion (C : ℕ) [NeZero C] (f : ZMod C × ZMod C → ℂ)
    (ab : ZMod C × ZMod C) :
    f ab = ∑ kl : ZMod C × ZMod C,
      torsionFourier C f kl * ZMod.stdAddChar (ab.1 * kl.1 - ab.2 * kl.2) := by
  sorry

/-- **The regularised torsion Fourier identity** (§4.16): for odd `f`,
`Σᵤ f̂(u) R_q(x_u) = (i y²/π) Σ' f(m, n)/((mτ + n)² (mτ̄ + n))`, with `x_u` the torsion point
`(k + ℓτ)/C` on canonical representatives. -/
theorem sum_torsionFourier_mul_ellipticR (C : ℕ) [NeZero C] (τ : ℂ) (hτ : 0 < τ.im)
    (f : ZMod C × ZMod C → ℂ) (hf : ∀ u, f (-u) = -f u) :
    ∑ u : ZMod C × ZMod C, torsionFourier C f u *
        ellipticR τ ((u.1.val : ℝ) / C) ((u.2.val : ℝ) / C) =
      I * ((τ.im ^ 2 / π : ℝ) : ℂ) * ∑' mn : ℤ × ℤ,
        if mn = 0 then 0 else f ((mn.1 : ZMod C), (mn.2 : ZMod C)) /
          (((mn.1 : ℂ) * τ + mn.2) ^ 2 * ((mn.1 : ℂ) * starRingEnd ℂ τ + mn.2)) := by
  sorry

/-! ## Layer 6: Integral parts and the Beilinson statement -/

section Determinant

variable {I B : Type*} [AddCommGroup I] [Module ℚ I] [AddCommGroup B] [Module ℚ B]

/-- `Δ_b(r; x)`: the signed determinant of the regulator images of the tuple `x`, in coordinates
of the real extension of the rational Betti basis `b` (§6.10). -/
noncomputable def regulatorDet {d : ℕ} (b : Module.Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) (x : Fin d → I) : ℝ :=
  Matrix.det (Matrix.of fun i j => (b.baseChange ℝ).repr (r (x j)) i)

/-- The weak Beilinson statement on a constructed subspace: a nonzero value `ℓ` and a tuple whose
regulator determinant is a nonzero rational multiple of `ℓ` (§6.10). -/
def HasDeterminantWitness {d : ℕ} (b : Module.Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) (ℓ : ℝ) : Prop :=
  ℓ ≠ 0 ∧ ∃ (x : Fin d → I) (q : ℚ), q ≠ 0 ∧ regulatorDet b r x = q * ℓ

example (b : Module.Basis (Fin 0) ℚ B) (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) (x : Fin 0 → I) :
    regulatorDet b r x = 1 := by
  simp [regulatorDet]

example {d : ℕ} (b : Module.Basis (Fin d) ℚ B) (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) :
    ¬ HasDeterminantWitness b r 0 :=
  fun h => h.1 rfl

example (b : Module.Basis (Fin 0) ℚ B) (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) :
    HasDeterminantWitness b r 1 := by
  refine ⟨one_ne_zero, Fin.elim0, 1, one_ne_zero, ?_⟩
  simp [regulatorDet]

/-- A change of frame by a rational matrix multiplies the determinant by its determinant. -/
theorem regulatorDet_changeFrame {d : ℕ} (b : Module.Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) (x : Fin d → I) (A : Matrix (Fin d) (Fin d) ℚ) :
    regulatorDet b r (fun j => ∑ i, A i j • x i) = regulatorDet b r x * (A.det : ℝ) := by
  sorry

/-- Rational rescaling of the value does not change the existence of a witness. -/
theorem hasDeterminantWitness_rescale {d : ℕ} (b : Module.Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) (ℓ : ℝ) {a : ℚ} (ha : a ≠ 0) :
    HasDeterminantWitness b r (a * ℓ) ↔ HasDeterminantWitness b r ℓ := by
  sorry

/-- A witness makes the regulator images span the real target. -/
theorem HasDeterminantWitness.span_eq_top {d : ℕ} {b : Module.Basis (Fin d) ℚ B}
    {r : I →ₗ[ℚ] TensorProduct ℚ ℝ B} {ℓ : ℝ} (h : HasDeterminantWitness b r ℓ) :
    Submodule.span ℝ (Set.range r) = ⊤ := by
  sorry

/-- The leading-term and value-at-two witnesses are equivalent, given
`L*(E, 0) = w N (2π)^{−2d} L(E, 2)` (§6.12). -/
theorem hasDeterminantWitness_atTwo_iff {d : ℕ} (b : Module.Basis (Fin d) ℚ B)
    (r : I →ₗ[ℚ] TensorProduct ℚ ℝ B) {w : ℤ} (hw : w = 1 ∨ w = -1) {N : ℕ} (hN : 0 < N)
    (L₂ : ℝ) :
    HasDeterminantWitness b r ((w : ℝ) * N * (2 * π) ^ (-(2 * d : ℤ)) * L₂) ↔
      HasDeterminantWitness b r (π ^ (-(2 * d : ℤ)) * L₂) := by
  sorry

end Determinant

/-! ## Layer 7: Modular curves and modular elliptic curves -/

section Subspaces

variable {A B : Type*} [AddCommGroup A] [Module ℚ A] [AddCommGroup B] [Module ℚ B]

/-- `Q_K = j⁻¹(span S)`: the classes whose restriction lies in the span of the unit symbols
(§7.27). -/
def fixedLevelBeilinson (j : A →ₗ[ℚ] B) (S : Set B) : Submodule ℚ A :=
  (Submodule.span ℚ S).comap j

/-- `P_K`: the supremum of the transfers of the finer-level subspaces (§7.28). -/
def beilinsonSubspace {ι : Type*} (Q : ι → Submodule ℚ B) (t : ι → B →ₗ[ℚ] A) :
    Submodule ℚ A :=
  ⨆ i, (Q i).map (t i)

example (P : Submodule ℚ A) :
    beilinsonSubspace (fun _ : Unit => P) (fun _ => LinearMap.id) = P := by
  simp [beilinsonSubspace]

example : (1 : ℚ) ∈ fixedLevelBeilinson (LinearMap.inl ℚ ℚ ℚ) {((1 : ℚ), (1 : ℚ)), (0, 1)} := by
  have h : ((1 : ℚ), (0 : ℚ)) = ((1 : ℚ), (1 : ℚ)) - (0, 1) := by ext <;> simp
  show LinearMap.inl ℚ ℚ ℚ 1 ∈ Submodule.span ℚ _
  rw [LinearMap.inl_apply, h]
  exact Submodule.sub_mem _ (Submodule.subset_span (by simp)) (Submodule.subset_span (by simp))

example : (1 : ℚ) ∉ fixedLevelBeilinson (LinearMap.inl ℚ ℚ ℚ) {((0 : ℚ), (1 : ℚ))} := by
  intro h
  change LinearMap.inl ℚ ℚ ℚ 1 ∈ Submodule.span ℚ {((0 : ℚ), (1 : ℚ))} at h
  rw [Submodule.mem_span_singleton] at h
  obtain ⟨a, ha⟩ := h
  have := congrArg Prod.fst ha
  simp at this

/-- Every element of `P_K` has a single finite-level witness when the images are directed. -/
theorem mem_beilinsonSubspace_iff {ι : Type*} [Nonempty ι] (Q : ι → Submodule ℚ B)
    (t : ι → B →ₗ[ℚ] A) (hdir : Directed (· ≤ ·) fun i => (Q i).map (t i)) (x : A) :
    x ∈ beilinsonSubspace Q t ↔ ∃ i, ∃ y ∈ Q i, t i y = x := by
  sorry

end Subspaces

/-- The normalised reduction `ac(u)^{v(p)}/ac(p)^{v(u)}` of a unit at a component with valuation
`v` and angular component `ac` (§7.35). -/
def normalizedUnitReduction {F κ : Type*} [CommGroup F] [CommGroup κ]
    (v : F →* Multiplicative ℤ) (ac : F →* κ) (p u : F) : κ :=
  ac u ^ Multiplicative.toAdd (v p) / ac p ^ Multiplicative.toAdd (v u)

example {F κ : Type*} [CommGroup F] [CommGroup κ] (v : F →* Multiplicative ℤ) (ac : F →* κ)
    (p : F) : normalizedUnitReduction v ac p p = 1 := by
  simp [normalizedUnitReduction]

example {F κ : Type*} [CommGroup F] [CommGroup κ] (v : F →* Multiplicative ℤ) (ac : F →* κ)
    (p u : F) (hp : v p = Multiplicative.ofAdd 2) (hu : v u = 1) :
    normalizedUnitReduction v ac p u = ac u ^ 2 := by
  simp [normalizedUnitReduction, hp, hu]

/-- Multiplying a unit by a power of `p` does not change its normalised reduction (§7.35). -/
theorem normalizedUnitReduction_mul_zpow {F κ : Type*} [CommGroup F] [CommGroup κ]
    (v : F →* Multiplicative ℤ) (ac : F →* κ) (p u : F) (a : ℤ) :
    normalizedUnitReduction v ac p (u * p ^ a) = normalizedUnitReduction v ac p u := by
  sorry

/-! ## Layer 8: Worked examples and the p-adic comparison -/

/-- The Frobenius-normalised regulator scalar `(1 − p/γ) · B(r, v)/B(ω, v)` (§8.14). -/
noncomputable def frobeniusRegulatorScalar {K H : Type*} [Field K] [AddCommGroup H] [Module K H]
    (p γ : K) (B : LinearMap.BilinForm K H) (ω v r : H) : K :=
  (1 - p / γ) * (B r v / B ω v)

example {K H : Type*} [Field K] [AddCommGroup H] [Module K H] (p γ : K)
    (B : LinearMap.BilinForm K H) (ω v : H) : frobeniusRegulatorScalar p γ B ω v 0 = 0 := by
  simp [frobeniusRegulatorScalar]

example :
    let B : LinearMap.BilinForm ℚ (ℚ × ℚ) := LinearMap.mk₂ ℚ
      (fun x y => x.1 * y.2 - x.2 * y.1)
      (by intros; simp [add_mul]; ring)
      (by intros; simp [smul_eq_mul]; ring)
      (by intros; simp [mul_add]; ring)
      (by intros; simp [smul_eq_mul]; ring)
    frobeniusRegulatorScalar 5 2 B (1, 0) (0, 1) (3, 0) = -9 / 2 := by
  norm_num [frobeniusRegulatorScalar, LinearMap.mk₂_apply]

/-- Rescaling the eigenvector does not change the scalar (§8.14). -/
theorem frobeniusRegulatorScalar_smul_eigenvector {K H : Type*} [Field K] [AddCommGroup H]
    [Module K H] (p γ : K) (B : LinearMap.BilinForm K H) (ω v r : H) {c : K} (hc : c ≠ 0)
    (hB : B ω v ≠ 0) :
    frobeniusRegulatorScalar p γ B ω (c • v) r = frobeniusRegulatorScalar p γ B ω v r := by
  sorry

/-- The common rational-scalar relation between a real and a `p`-adic regulator (§8.17). -/
def WeightTwoBeilinsonRelation {M K : Type*} [AddCommGroup M] [Module ℚ M] [Field K] [CharZero K]
    (rInf : M →ₗ[ℚ] ℝ) (rp : M →+ K) (A : ℝ) (B : K) : Prop :=
  ∃ (ξ : M) (q : ℚ) (ε : ℤ), (ε = 1 ∨ ε = -1) ∧ ξ ≠ 0 ∧ q ≠ 0 ∧ rInf ξ ≠ 0 ∧ rp ξ ≠ 0 ∧
    A = q * rInf ξ ∧ B = (ε : K) * q * rp ξ

example {M K : Type*} [AddCommGroup M] [Module ℚ M] [Field K] [CharZero K] (rInf : M →ₗ[ℚ] ℝ)
    (A : ℝ) (B : K) : ¬ WeightTwoBeilinsonRelation rInf (0 : M →+ K) A B := by
  rintro ⟨ξ, q, ε, -, -, -, -, h, -⟩
  exact h rfl

example : WeightTwoBeilinsonRelation (Algebra.linearMap ℚ ℝ)
    (2 • AddMonoidHom.id ℚ) 3 6 := by
  refine ⟨1, 3, 1, Or.inl rfl, by norm_num, by norm_num, ?_, ?_, ?_, ?_⟩ <;> norm_num

/-
Targets of the README that are not stated above because their carriers are absent at the pins:
the normalised uniformisation and the de Rham–Betti period comparison (§§1.2–1.3, 1.6, 1.10);
the Deligne target, its orbit coordinates and the factor `r_Beil = 2 r_E` (§§2.1–2.3, 2.6–2.9);
the Bloch–Wigner orbit sum, Bloch's companion, the Green function, Goncharov's function and the
truncation proof of the Steinberg relations (§§3.1–3.3, 3.5, 3.8–3.15); Bloch's classes `S_a` and their regulators, the lift
formula, the weighted terms `L`, `M`, `B` and the trace formula (§§4.3, 4.5–4.15, 4.17–4.18);
the Hecke character, the transforms on `O/CO`, the class `U`, the Gauss coefficient and the general
CM L-value theorem, CMRealStructure and cmRealStructureTransport (§§5.1–5.18); the integral part, the regulator on it, Beilinson's conjecture and
potentially good integrality, curveK2_adamsWeightTwo and localCurveIntegralImage
(§§6.1–6.9, 6.11, 6.13); real-analytic Eisenstein series, Kronecker's
limit formulas, Manin–Drinfeld, modular units, the Rankin–Selberg integral, Brunault's explicit
theorems, Schappacher–Scholl's theorems and Beilinson's theorem for modular elliptic curves
(§§7.1–7.26, 7.29–7.34, 7.36–7.41); the six-torsion and quadratic certificates, the syntomic
pairing, the Néron period dictionary and the weight-two p-adic Beilinson conjecture
(§§8.1–8.13, 8.15–8.16, 8.18).
-/

end TauCetiRoadmap.EllipticRegulators
