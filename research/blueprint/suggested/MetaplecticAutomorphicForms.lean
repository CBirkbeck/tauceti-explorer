/-
# Metaplectic groups, Weil representations and automorphic theta kernels: suggested Lean

This file is not the roadmap and is not exhaustive. The roadmap document,
`research/blueprint/readmes/MetaplecticAutomorphicForms.md`, is definitive. The statements here
suggest Lean forms so that contributors and reviewers converge on names and signatures. Every
proof is `sorry`; nothing here is an implementation.

The file states and does not develop. It keeps light definitions with real bodies over carriers
that exist at the pins (Mathlib 082e2d3, Tau Ceti f790474), the milestones statable there, and a
few discriminating examples. The heavy objects of the roadmap (the scalar and double metaplectic
covers over local fields, local theta modules, the adelic cover and Weil representation,
automorphic forms on covers, Jacobi groups over local fields, Fourier–Jacobi periods, the BFH
genus-two Eisenstein series) are targets of the roadmap document. The closing comment lists the
packet names that are not typed here, grouped by the carrier they are waiting for. The typed
prototypes of the 261 targets of the two accepted parts are in
`MetaplecticAutomorphicForms--MP.0.lean` and `MetaplecticAutomorphicForms--MP.8.lean`.
-/
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.ModularForms.JacobiTheta.OneVariable
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.Data.ZMod.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic

set_option linter.unusedVariables false

open Complex Matrix

/-! ## MP.0: the Heisenberg group as a factor-set extension

Tau Ceti's `FactorSet` and its `Extension` are the carrier; the roadmap adds the bilinear
factor set and its laws. -/

namespace TauCeti.Metaplectic.Heisenberg

open LinearMap (BilinForm)
open Multiplicative
attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {R C W : Type*} [CommRing R] [AddCommGroup C] [Module R C] [AddCommGroup W] [Module R W]

/-- The factor set (x, y) ↦ B(x, y) of a bilinear map, with trivial coefficient action.
Its extension has the law (t, x)(s, y) = (t + s + B(x, y), x + y), in every characteristic. -/
def bilinearFactorSet (B : LinearMap.BilinMap R W C) :
    TauCeti.FactorSet (Multiplicative W) (Multiplicative C) where
  toFun p := ofAdd (B p.1.toAdd p.2.toAdd)
  isMulCocycle₂' := by sorry
  map_one_one' := by sorry

theorem bilinearFactorSet_commutator (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    p * q * p⁻¹ * q⁻¹ = (bilinearFactorSet B).inl
      (ofAdd (B p.right.toAdd q.right.toAdd - B q.right.toAdd p.right.toAdd)) := by sorry

/-- MP.0 milestone: for a nondegenerate alternating form and invertible 2, the centre of the
Heisenberg group E_{½ω} is exactly the central copy of R. -/
theorem halfForm_center (B : BilinForm R W) (hB : B.IsAlt) (hn : B.Nondegenerate)
    [Invertible (2 : R)] :
    Subgroup.center (bilinearFactorSet ((⅟ (2 : R)) • B)).Extension =
      ((bilinearFactorSet ((⅟ (2 : R)) • B)).inl).range := by sorry

-- Check: the zero form gives the untwisted addition law.
example (p q : (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension) :
    (p * q).left.toAdd = p.left.toAdd + q.left.toAdd := by sorry

end TauCeti.Metaplectic.Heisenberg

/-! ## Shared notation for the classical objects of MP.6–MP.8 -/

namespace TauCeti.Metaplectic

open scoped MatrixGroups

/-- `e(x) = exp(2πix)`. -/
noncomputable def eC (x : ℂ) : ℂ := Complex.exp (2 * Real.pi * I * x)

/-- The upper half plane as a subset of `ℂ`. -/
def upperHalfSet : Set ℂ := {z | 0 < z.im}

/-- The bottom-row factor `cz + d` of `A ∈ SL(2,ℤ)`. -/
def denom (A : SL(2, ℤ)) (z : ℂ) : ℂ := (A 1 0 : ℂ) * z + (A 1 1 : ℂ)

/-- The Möbius action `(az + b)/(cz + d)`. -/
noncomputable def mobius (A : SL(2, ℤ)) (z : ℂ) : ℂ := ((A 0 0 : ℂ) * z + (A 0 1 : ℂ)) / denom A z

/-! ## MP.6: the metaplectic modular group `Mp(2,ℤ)` (node `MP.6/metaplectic-modular-group`) -/

/-- `Mp(2,ℤ)`: pairs `(A, w)` with `w` holomorphic on the upper half plane and
`w(z)² = cz + d` there. -/
def Mp2Z : Type :=
  {p : SL(2, ℤ) × (ℂ → ℂ) //
    DifferentiableOn ℂ p.2 upperHalfSet ∧ ∀ z ∈ upperHalfSet, p.2 z ^ 2 = denom p.1 z}

namespace Mp2Z

/-- The composition `(A, w)(B, v) = (AB, z ↦ w(Bz) v(z))` on underlying pairs. -/
noncomputable def mulPair (p q : SL(2, ℤ) × (ℂ → ℂ)) : SL(2, ℤ) × (ℂ → ℂ) :=
  (p.1 * q.1, fun z => p.2 (mobius q.1 z) * q.2 z)

/-- The group law of `Mp(2,ℤ)`; the second component is the proof that the product is again
an admissible pair. -/
noncomputable def mul (p q : Mp2Z) : Mp2Z := ⟨mulPair p.1 q.1, by sorry⟩

theorem mul_def (p q : Mp2Z) : (mul p q).1 = (p.1.1 * q.1.1, fun z => p.1.2 (mobius q.1.1 z) * q.1.2 z) :=
  rfl

/-- The lift `S̃ = (S, √z)` with the principal square root. -/
noncomputable def genS : Mp2Z := ⟨(ModularGroup.S, fun z => z ^ (1 / 2 : ℂ)), by sorry⟩

/-- The lift `T̃ = (T, 1)`. -/
noncomputable def genT : Mp2Z := ⟨(ModularGroup.T, fun _ => 1), by sorry⟩

/-- The nontrivial central element `(1, −1)`. -/
noncomputable def centralSign : Mp2Z := ⟨(1, fun _ => -1), by sorry⟩

/-- Check `genS_sq`: `S̃² = (−1, i)` on the upper half plane. -/
theorem genS_sq : (mul genS genS).1.1 = -1 ∧ ∀ z ∈ upperHalfSet, (mul genS genS).1.2 z = I := by
  sorry

/-- `genS_genT`: `(S̃T̃)³ = S̃²` on the upper half plane, and `S̃⁴ = (1, −1)`. -/
theorem genS_genT :
    (mul (mul (mul genS genT) (mul genS genT)) (mul genS genT)).1.1 = (mul genS genS).1.1 ∧
      (∀ z ∈ upperHalfSet,
        (mul (mul (mul genS genT) (mul genS genT)) (mul genS genT)).1.2 z = (mul genS genS).1.2 z) ∧
      (mul (mul genS genS) (mul genS genS)).1.1 = 1 ∧
      ∀ z ∈ upperHalfSet, (mul (mul genS genS) (mul genS genS)).1.2 z = -1 := by
  sorry

/-- The weight-`k₂/2` slash operator `(f|α)(z) = w(z)^{−k₂} f(Az)`. -/
noncomputable def slash (k₂ : ℤ) (f : ℂ → ℂ) (α : Mp2Z) : ℂ → ℂ :=
  fun z => α.1.2 z ^ (-k₂) * f (mobius α.1.1 z)

theorem slash_mul (k₂ : ℤ) (f : ℂ → ℂ) (α β : Mp2Z) :
    ∀ z ∈ upperHalfSet, slash k₂ (slash k₂ f α) β z = slash k₂ f (mul α β) z := by sorry

/-- `(1, −1)` acts by `(−1)^{2k} = (−1)^{k₂}`. -/
theorem slash_centralSign (k₂ : ℤ) (f : ℂ → ℂ) :
    ∀ z ∈ upperHalfSet, slash k₂ f centralSign z = (-1) ^ k₂ * f z := by sorry

/-- The principal-branch factor `(cz + d)^{1/2}`. -/
noncomputable def principalFactor (A : SL(2, ℤ)) (z : ℂ) : ℂ := denom A z ^ (1 / 2 : ℂ)

/-- The cocycle of the principal-branch section `A ↦ (A, (cz + d)^{1/2})`. -/
noncomputable def principalCocycle (A B : SL(2, ℤ)) (z : ℂ) : ℂ :=
  principalFactor A (mobius B z) * principalFactor B z / principalFactor (A * B) z

/-- `principalSection_cocycle`: the cocycle takes the values `±1` and does not depend on `z`. -/
theorem principalSection_cocycle (A B : SL(2, ℤ)) :
    ∃ s : ℂ, (s = 1 ∨ s = -1) ∧ ∀ z ∈ upperHalfSet, principalCocycle A B z = s := by sorry

/-- Check `principalSection_minusOne`: the principal-branch section is not a homomorphism. -/
example : principalCocycle (-1) (-1) I = -1 := by sorry

end Mp2Z

/-! ## MP.6: Weil representations of finite quadratic modules on `ℂ[D]`

Skoruppa's normalization: `(T, 1) e_x = e(Q(x)) e_x` and
`(S, √z) e_x = σ |D|^{−1/2} Σ_y e(−B(y, x)) e_y`, with `σ = |D|^{−1/2} Σ_x e(−Q(x))`.
The quadratic form is given by rational representatives `Q : D → ℚ`, read modulo `ℤ`. -/

section WeilRep

variable {D : Type*} [AddCommGroup D] [Fintype D] [DecidableEq D]

/-- The Gauss-sum invariant `σ(D, Q)`. -/
noncomputable def weilSigma (Q : D → ℚ) : ℂ :=
  (Fintype.card D : ℂ) ^ (-(1 / 2 : ℂ)) * ∑ x, eC (-(Q x : ℂ))

/-- The action of `T̃` on functions `D → ℂ`. -/
noncomputable def weilT (Q : D → ℚ) (f : D → ℂ) : D → ℂ := fun x => eC (Q x) * f x

/-- The action of `S̃` on functions `D → ℂ`, with `B(x, y) = Q(x + y) − Q(x) − Q(y)`. -/
noncomputable def weilS (Q : D → ℚ) (f : D → ℂ) : D → ℂ :=
  fun y => weilSigma Q * (Fintype.card D : ℂ) ^ (-(1 / 2 : ℂ)) *
    ∑ x, eC (-((Q (x + y) - Q x - Q y : ℚ) : ℂ)) * f x

/-- The rank-one determinant module `D_m = (ℤ/2m, x ↦ x²/4m)`, the case `F = (m)`. -/
def rankOneForm (m : ℕ) [NeZero m] : ZMod (2 * m) → ℚ := fun x => ((x.val : ℚ) ^ 2) / (4 * m)

/-- Milgram's formula for `D_m`: `σ = e(−1/8)`, the signature of `2F = (2m)` being `1`. -/
theorem weilSigma_rankOne (m : ℕ) [NeZero m] : weilSigma (rankOneForm m) = eC (-1 / 8) := by
  sorry

/-- `S̃²` acts on `ℂ[D_m]` by `e_x ↦ σ² e_{−x}`. -/
theorem weilS_sq_rankOne (m : ℕ) [NeZero m] (f : ZMod (2 * m) → ℂ) :
    weilS (rankOneForm m) (weilS (rankOneForm m) f) =
      fun x => weilSigma (rankOneForm m) ^ 2 * f (-x) := by sorry

-- Check `theta_index_one`: for `F = (1)` the module is `ℤ/2` and `σ = e(−1/8)`.
example : weilSigma (rankOneForm 1) = eC (-1 / 8) := by sorry

end WeilRep

/-! ## MP.6: classical Jacobi forms of lattice index (node `MP.6/classical-jacobi-forms`)

The index is recorded by the even Gram matrix `F₂ = 2F` of the lattice `L_F = (ℤⁿ, 2F)`.
Then `F⁻¹[r]/4 = rᵗF₂⁻¹r/2`, `τF[λ] = τ λᵗF₂λ/2` and `2zᵗFλ = zᵗF₂λ`. -/

namespace JacobiZ

variable {n : ℕ}

/-- Integer vectors as complex vectors. -/
def toC (r : Fin n → ℤ) : Fin n → ℂ := fun i => (r i : ℂ)

/-- `thetaF`: `ϑ_{F,x}(τ, z) = Σ_{r ≡ x mod F₂ℤⁿ} e(τ rᵗF₂⁻¹r/2 + rᵗz)`. -/
noncomputable def thetaF (F₂ : Matrix (Fin n) (Fin n) ℤ) (x : Fin n → ℤ) (τ : ℂ)
    (z : Fin n → ℂ) : ℂ :=
  ∑' r : {r : Fin n → ℤ // ∃ y : Fin n → ℤ, r = x + F₂.mulVec y},
    eC (τ * (toC r.1 ⬝ᵥ ((F₂.map (fun a : ℤ => (a : ℂ)))⁻¹).mulVec (toC r.1)) / 2 +
      toC r.1 ⬝ᵥ z)

/-- The Heisenberg part of `|_{k,F}`: `φ|[λ, µ](τ, z) = e(τF[λ] + 2zᵗFλ) φ(τ, z + λτ + µ)`. -/
noncomputable def heisenbergSlash (F₂ : Matrix (Fin n) (Fin n) ℤ) (lam mu : Fin n → ℤ)
    (φ : ℂ → (Fin n → ℂ) → ℂ) : ℂ → (Fin n → ℂ) → ℂ :=
  fun τ z =>
    eC (τ * (toC lam ⬝ᵥ (F₂.map (fun a : ℤ => (a : ℂ))).mulVec (toC lam)) / 2 +
        z ⬝ᵥ (F₂.map (fun a : ℤ => (a : ℂ))).mulVec (toC lam)) *
      φ τ (z + τ • toC lam + toC mu)

/-- The theta functions of index `F` are invariant under the integral Heisenberg group
(elliptic invariance), for `F₂` symmetric positive definite with even diagonal. -/
theorem thetaF_heisenbergSlash (F₂ : Matrix (Fin n) (Fin n) ℤ) (hsymm : F₂.IsSymm)
    (hpos : (F₂.map (fun a : ℤ => (a : ℝ))).PosDef) (heven : ∀ i, Even (F₂ i i))
    (x lam mu : Fin n → ℤ) :
    ∀ τ ∈ upperHalfSet, ∀ z,
      heisenbergSlash F₂ lam mu (thetaF F₂ x) τ z = thetaF F₂ x τ z := by sorry

/-- The theta function depends only on `x` modulo `F₂ℤⁿ`. -/
theorem thetaF_congr (F₂ : Matrix (Fin n) (Fin n) ℤ) (x y : Fin n → ℤ) :
    thetaF F₂ (x + F₂.mulVec y) = thetaF F₂ x := by sorry

-- Check: for `F = (1)` (`F₂ = (2)`) the two theta functions are indexed by `ℤ/2`.
example : thetaF (!![2] : Matrix (Fin 1) (Fin 1) ℤ) ![2] = thetaF !![2] ![0] := by sorry

end JacobiZ

/-! ## MP.7: the theta function and the theta multiplier -/

/-- Node `MP.7/jacobi-theta-nonvanishing`: the product formula, with `w = exp(πiτ)`. -/
theorem jacobiTheta_eq_tprod {τ : ℂ} (hτ : 0 < τ.im) :
    jacobiTheta τ = ∏' n : ℕ, (1 - Complex.exp (Real.pi * I * τ) ^ (2 * (n + 1))) *
      (1 + Complex.exp (Real.pi * I * τ) ^ (2 * n + 1)) ^ 2 := by sorry

/-- Node `MP.7/jacobi-theta-nonvanishing`: `jacobiTheta` has no zero on the upper half plane. -/
theorem jacobiTheta_ne_zero {τ : ℂ} (hτ : 0 < τ.im) : jacobiTheta τ ≠ 0 := by sorry

/-- The unitary theta function `y^{1/4} θ(z)` with `θ(z) = Σ e(n²z) = jacobiTheta (2z)`. -/
noncomputable def unitaryThetaSeed (z : ℂ) : ℂ := ((z.im : ℝ) : ℂ) ^ (1 / 4 : ℂ) * jacobiTheta (2 * z)

/-- The unitary theta multiplier `J(γ, z) = θ̃(γz)/θ̃(z)` of `MP.7/theta-multiplier`. -/
noncomputable def thetaMultiplier (γ : SL(2, ℤ)) (z : ℂ) : ℂ := unitaryThetaSeed (mobius γ z) / unitaryThetaSeed z

/-- MP.7 milestone: on `Γ₀(4)` the multiplier is unitary. -/
theorem thetaMultiplier_unitary {γ : SL(2, ℤ)} (hγ : γ ∈ CongruenceSubgroup.Gamma0 4) {z : ℂ}
    (hz : z ∈ upperHalfSet) : ‖thetaMultiplier γ z‖ = 1 := by sorry

theorem unitaryThetaSeed_ne_zero {z : ℂ} (hz : z ∈ upperHalfSet) : unitaryThetaSeed z ≠ 0 := by sorry

-- Check: the multiplier of the identity is `1` (this uses `unitaryThetaSeed_ne_zero`).
example : thetaMultiplier 1 I = 1 := by sorry

end TauCeti.Metaplectic

/-! ## MP.8: genus-two theta series and the corrected Gaussian norm (restructure R6) -/

namespace TauCeti.Jacobi.GenusTwo

open TauCeti.Metaplectic
open scoped Classical

/-- `θᵃ_ν(Z, W) = Σ_{R ≡ ν mod 2a} e(Z[R]/(4a) + RᵀW)`. -/
noncomputable def genusTwoTheta (a : ℕ) (ν : Fin 2 → ℤ) (Z : Matrix (Fin 2) (Fin 2) ℂ)
    (W : Fin 2 → ℂ) : ℂ :=
  ∑' R : {R : Fin 2 → ℤ // ∃ k : Fin 2 → ℤ, R = ν + (2 * (a : ℤ)) • k},
    eC ((fun i => (R.1 i : ℂ)) ⬝ᵥ Z.mulVec (fun i => (R.1 i : ℂ)) / (4 * a) +
      (fun i => (R.1 i : ℂ)) ⬝ᵥ W)

/-- The point `W = Zλ + ρ` of `ℂ²` attached to real coordinates `(λ, ρ)`. -/
noncomputable def torusPoint (Z : Matrix (Fin 2) (Fin 2) ℂ) (p : (Fin 2 → ℝ) × (Fin 2 → ℝ)) :
    Fin 2 → ℂ :=
  Z.mulVec (fun i => (p.1 i : ℂ)) + fun i => (p.2 i : ℂ)

/-- Corrected Proposition 2.1 of Bump–Friedberg–Hoffstein: in the coordinates `W = Zλ + ρ`
(Lebesgue measure `det Y dλ dρ`), the squared norm of `θᵃ_ν` against `exp(−4πa Y⁻¹[Im W])`
is `√det Y/(4a)`, and distinct residues are orthogonal. The printed value is `√det Y/(2a)`. -/
theorem genusTwoTheta_pairing (a : ℕ) (ha : 0 < a) (μ ν : Fin 2 → ℤ)
    (X Y : Matrix (Fin 2) (Fin 2) ℝ) (hX : X.IsSymm) (hY : Y.PosDef) :
    ((Y.det : ℝ) : ℂ) * ∫ p in (Set.Icc (0 : Fin 2 → ℝ) 1) ×ˢ (Set.Icc (0 : Fin 2 → ℝ) 1),
        genusTwoTheta a μ (X.map (fun t : ℝ => (t : ℂ)) + I • Y.map (fun t : ℝ => (t : ℂ)))
            (torusPoint (X.map (fun t : ℝ => (t : ℂ)) + I • Y.map (fun t : ℝ => (t : ℂ))) p) *
          (starRingEnd ℂ) (genusTwoTheta a ν
            (X.map (fun t : ℝ => (t : ℂ)) + I • Y.map (fun t : ℝ => (t : ℂ)))
            (torusPoint (X.map (fun t : ℝ => (t : ℂ)) + I • Y.map (fun t : ℝ => (t : ℂ))) p)) *
          ((Real.exp (-4 * Real.pi * a * (p.1 ⬝ᵥ Y.mulVec p.1)) : ℝ) : ℂ) =
      if ∃ k : Fin 2 → ℤ, μ = ν + (2 * (a : ℤ)) • k then
        ((Real.sqrt Y.det / (4 * a) : ℝ) : ℂ) else 0 := by sorry

end TauCeti.Jacobi.GenusTwo

/-
## Packet names not typed here, by missing carrier

* The local Jacobi group over a local field and its Schrödinger–Weil representation
  (needs the oscillator representation of MP.0–MP.2 and the unitary splitting of MP.3):
  `TauCeti.Metaplectic.unitaryJacobiGroup_mul`, `unitaryJacobiGroup.toScalarJacobi`,
  `unitarySchroedingerWeil_apply`, `unitarySchroedingerWeil_heisenberg`,
  `unitarySchroedingerWeil_character_change`, `unitaryTheta_invariant`, and the checks
  `unitaryJacobiGroup_zero`, `unitaryJacobiGroup_restrict`, `unitaryJacobiGroup_line`,
  `unitaryJacobiGroup_not_product`, `unitaryJacobiGroup_not_doubleCover`
  (node `MP.6/unitary-jacobi-group`).
* Automorphic forms on classical groups and their covers, with Weil's theta realization
  (needs AF.2–AF.3 and MP.4–MP.5): `fourierJacobiCoeff_automorphic`,
  `fourierJacobiCoeff_equivariant`, `fourierJacobiPeriod_eq_integral`, `fourierJacobiCoeff_central`,
  `fourierJacobiCoeff_whittaker`, `fourierJacobiCoeff_equalRank`, and the checks
  `fourierJacobiCoeff_zero`, `fourierJacobiCoeff_sl2`, `fourierJacobiCoeff_equalRank_test`,
  `fourierJacobiCoeff_needs_theta` (node `MP.6/fourier-jacobi-period`).
* Vector-valued modular forms of half-integral weight with cusp conditions and induction, and
  the real double cover (MP.2): `Mp2Z.ker_proj`, `Mp2Z.modularForm_induce`,
  `Mp2Z.modularForm_integral`, `Mp2Z.toRealCover`, and the checks `Mp2Z.halfIntegral_trivialType`,
  `Mp2Z.integralWeight_compat` (node `MP.6/metaplectic-modular-group`).
* Jacobi forms with cusp conditions and the theta decomposition isomorphism (needs the
  vector-valued forms above and the finite Weil representation of MP.4): `JacobiZ.mul_def`,
  `JacobiZ.slash_mul` (the modular part), `JacobiZ.jacobiForm_mem`, `JacobiZ.thetaDecomposition`,
  `JacobiZ.weilRep_eq_lattice`, `JacobiZ.eq_zero_of_lt`, `JacobiZ.toJacobiSpace`, and the checks
  `JacobiZ.below_critical`, `JacobiZ.eichlerZagier`, `JacobiZ.halfIndex_excluded`
  (node `MP.6/classical-jacobi-forms`).
* The 261 targets of the accepted parts keep the names and the typed or omitted status recorded
  in `MetaplecticAutomorphicForms--MP.0.lean` and `MetaplecticAutomorphicForms--MP.8.lean`.
-/
