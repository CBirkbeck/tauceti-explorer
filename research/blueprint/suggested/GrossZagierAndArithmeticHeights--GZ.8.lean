/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Module.Submodule.Lattice
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.RingTheory.Trace.Defs
import Mathlib.RingTheory.TensorProduct.Maps
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.ModularForms.Petersson
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# Gross–Zagier formulas and arithmetic heights — suggested declarations (GZ.8 and GZ.9)

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/GrossZagierAndArithmeticHeights--GZ.8.md`) is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`; nothing here is implemented, and the packet's
`implementationStatus` stays `unchecked`. Pinned baseline: Mathlib 082e2d3, Tau Ceti f790474.

Independent review REV-GrossZagierAndArithmeticHeights--GZ.8: `needs_changes`.
This file is a partial collection of algebraic prototypes. Successful elaboration does not
verify the arithmetic assertions in the packet. Unsupported theorem signatures were removed;
their missing hypotheses cannot safely be left out of universally quantified claims.

The file imports only Mathlib: the Tau Ceti modules this plan cites (`CanonicalHeight`,
`Petersson.Basic`) are named in docstrings, and the Mathlib objects they are built from are used
directly (`QuadraticMap.polar` for the BSD pairing of a canonical height, the set integral of
`UpperHalfPlane.petersson` for Tau Ceti's `peterssonInner`).

Shimura curves, automorphic representations, toric functionals, L-functions of modular forms over
K, CM periods and p-adic avatars are not in the libraries. Where a declaration needs them, the
file prototypes the part that can be stated with existing carriers — the finite-group, linear and
power-series algebra. Arithmetic statements whose hypotheses cannot be expressed are recorded
as pending signatures in comments, rather than asserting their conclusions for arbitrary data.
The coefficient pairing below still models GZ.1's M-valued input; the L-base-change constructor
and the Tau Ceti compatibility imports are pending. No `Prop` is replaced by `sorry`.
-/

noncomputable section

open scoped BigOperators TensorProduct

namespace TauCeti.GrossZagier

/-! ## GZ.8 — the χ-isotypic space and the χ-Heegner point -/

section Isotypic

variable {G : Type*} [CommGroup G] {L : Type*} [Field L]
  {V : Type*} [AddCommGroup V] [Module L V] [DistribMulAction G V] [SMulCommClass G L V]

/-- GZ.8/chi-isotypic-mordell-weil-space: `A(χ) = {x | ∀ t, σ_t • x = χ(t)⁻¹ • x}`, the exponent
fixed so that the χ-Heegner point lies in it. In the application `V = A(K^ab)_ℚ ⊗_M L` and `G`
acts through the reciprocity map with the arithmetic Frobenius convention of GZ.0. -/
def chiIsotypic (χ : G →* Lˣ) : Submodule L V where
  carrier := {x | ∀ g : G, g • x = (((χ g)⁻¹ : Lˣ) : L) • x}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

omit [SMulCommClass G L V] in
theorem mem_chiIsotypic_iff (χ : G →* Lˣ) (x : V) :
    x ∈ chiIsotypic χ ↔ ∀ g : G, g • x = (((χ g)⁻¹ : Lˣ) : L) • x :=
  Iff.rfl

/-- The `L`-linear map `x ↦ g • x`. -/
def smulLinear (g : G) : V →ₗ[L] V where
  toFun x := g • x
  map_add' x y := smul_add g x y
  map_smul' c x := smul_comm g c x

/-- `e_χ = |G|⁻¹ Σ_σ χ(σ) • σ`, the projector onto `A(χ)`. -/
def chiProjector [Fintype G] (χ : G →* Lˣ) : V →ₗ[L] V :=
  ((Fintype.card G : L)⁻¹) • ∑ g : G, ((χ g : Lˣ) : L) • smulLinear (L := L) (V := V) g

theorem chiProjector_mem [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (χ : G →* Lˣ) (x : V) :
    chiProjector χ x ∈ chiIsotypic χ := by
  sorry

theorem chiProjector_of_mem [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (χ : G →* Lˣ) {x : V}
    (hx : x ∈ chiIsotypic χ) : chiProjector χ x = x := by
  sorry

/-- `A(1)` is the space of `K`-rational vectors. -/
theorem chiIsotypic_one (x : V) :
    x ∈ chiIsotypic (V := V) (1 : G →* Lˣ) ↔ ∀ g : G, g • x = x := by
  sorry

theorem chiIsotypic_disjoint {χ χ' : G →* Lˣ} (h : χ ≠ χ') :
    chiIsotypic (V := V) χ ⊓ chiIsotypic χ' = ⊥ := by
  sorry

/-- An equivariant linear map preserves the specified character eigenspace. -/
theorem chiIsotypic_map {W : Type*} [AddCommGroup W] [Module L W]
    [DistribMulAction G W] [SMulCommClass G L W] (φ : V →ₗ[L] W)
    (hφ : ∀ (g : G) (x : V), φ (g • x) = g • φ x)
    (χ : G →* Lˣ) {x : V} (hx : x ∈ chiIsotypic χ) :
    φ x ∈ chiIsotypic χ := by
  sorry

/-- `Σ_χ e_χ = 1` when `L` contains the values of all `|G|` characters. -/
theorem sum_chiProjector [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (S : Finset (G →* Lˣ))
    (hS : ∀ χ, χ ∈ S) (hcard : S.card = Fintype.card G) :
    ∑ χ ∈ S, chiProjector (V := V) χ = LinearMap.id := by
  sorry

/-- Unit test: for the trivial character the isotypic space is the fixed space. -/
theorem chiIsotypic_trivial_eq_fixed :
    ((chiIsotypic (V := V) (1 : G →* Lˣ) : Submodule L V) : Set V) = {x | ∀ g : G, g • x = x} := by
  sorry

/-- Unit test: the projectors are orthogonal idempotents. -/
theorem chiProjector_idem [Fintype G] (hG : (Fintype.card G : L) ≠ 0) (χ χ' : G →* Lˣ)
    (h : χ ≠ χ') :
    chiProjector (V := V) χ ∘ₗ chiProjector χ = chiProjector χ ∧
      chiProjector (V := V) χ ∘ₗ chiProjector χ' = 0 := by
  sorry

/-- Unit test (`G = ℤ/2`, `χ(σ) = −1`): a vector negated by `σ` lies in `A(χ)`. -/
theorem chiIsotypic_quadratic_sign (σ : G) (hG : ∀ g : G, g = 1 ∨ g = σ) (χ : G →* Lˣ)
    (hχ : ((χ σ : Lˣ) : L) = -1) (x : V) (hx : σ • x = -x) : x ∈ chiIsotypic χ := by
  sorry

/-- Unit test (non-example): a vector that `σ` neither fixes nor negates lies in neither
eigenspace, so `A(χ)` is not the whole space. -/
theorem chiIsotypic_ne_whole (σ : G) (χ : G →* Lˣ) (hχ : ((χ σ : Lˣ) : L) = -1) (x : V)
    (h1 : σ • x ≠ x) (h2 : σ • x ≠ -x) :
    x ∉ chiIsotypic χ ∧ x ∉ chiIsotypic (1 : G →* Lˣ) := by
  sorry

variable [Fintype G]

/-- GZ.8/chi-heegner-point, finite form: `P⁰_χ(x) = Σ_g χ(g) • (g • x)` (Cai–Shu–Tian §1.2). -/
def heegnerFinite (χ : G →* Lˣ) (x : V) : V :=
  ∑ g : G, ((χ g : Lˣ) : L) • (g • x)

theorem heegnerFinite_smul (χ : G →* Lˣ) (h : G) (x : V) :
    heegnerFinite χ (h • x) = (((χ h)⁻¹ : Lˣ) : L) • heegnerFinite χ x := by
  sorry

theorem heegnerFinite_mem_chiIsotypic (χ : G →* Lˣ) (x : V) :
    heegnerFinite χ x ∈ chiIsotypic χ := by
  sorry

theorem heegnerFinite_one (x : V) :
    heegnerFinite (1 : G →* Lˣ) x = ∑ g : G, g • x := by
  sorry

theorem heegnerFinite_add (χ : G →* Lˣ) (x y : V) :
    heegnerFinite χ (x + y) = heegnerFinite χ x + heegnerFinite χ y := by
  sorry

/-- Scalar linearity, distinct from the group-action formula `heegnerFinite_smul`. -/
theorem heegnerFinite_coeff_smul (χ : G →* Lˣ) (a : L) (x : V) :
    heegnerFinite χ (a • x) = a • heegnerFinite χ x := by
  sorry

theorem heegnerFinite_map {W : Type*} [AddCommGroup W] [Module L W] [DistribMulAction G W]
    [SMulCommClass G L W] (φ : V →ₗ[L] W) (hφ : ∀ (g : G) (x : V), φ (g • x) = g • φ x)
    (χ : G →* Lˣ) (x : V) : φ (heegnerFinite χ x) = heegnerFinite χ (φ x) := by
  sorry

/-- The toric integral of an integrand that factors through the finite quotient `G`, for the
measure of total volume `vol` (= `2 L(1, η)`, erratum-corrected). -/
def heegnerIntegral (vol : L) (χ : G →* Lˣ) (x : V) : V :=
  (vol / Fintype.card G) • heegnerFinite χ x

omit [SMulCommClass G L V] in
theorem heegnerIntegral_eq (vol : L) (χ : G →* Lˣ) (x : V) :
    heegnerIntegral vol χ x = (vol / Fintype.card G) • heegnerFinite χ x :=
  rfl

/-- Gross–Zagier's `c_χ = Σ_σ χ⁻¹(σ) c^σ` is `P⁰_{χ⁻¹}` in this notation. -/
theorem heegnerFinite_inv_eq_gz (χ : G →* Lˣ) (x : V) :
    ∑ g : G, (((χ g)⁻¹ : Lˣ) : L) • (g • x) = heegnerFinite χ⁻¹ x := by
  sorry

/-- Unit test: for the trivial group `P⁰_χ(x) = x`. -/
theorem heegnerFinite_trivial_group [Subsingleton G] (χ : G →* Lˣ) (x : V) :
    heegnerFinite χ x = x := by
  sorry

/-- Unit test: `G = {1, σ}`, `χ(σ) = −1` gives `P⁰_χ(x) = x − σ • x`. -/
theorem heegnerFinite_sign_char (σ : G) (hσ : σ ≠ 1) (hG : ∀ g : G, g = 1 ∨ g = σ)
    (χ : G →* Lˣ) (hχ : ((χ σ : Lˣ) : L) = -1) (x : V) :
    heegnerFinite χ x = x - σ • x := by
  sorry

/-- Unit test (non-example): a `K`-rational vector has no component for a nontrivial character. -/
theorem heegnerFinite_fixed_nontrivial (χ : G →* Lˣ) (hχ : χ ≠ 1) (x : V)
    (hx : ∀ g : G, g • x = x) : heegnerFinite χ x = 0 := by
  sorry

/-- Unit test: for the trivial character the Heegner point is the trace `y_K = Tr_{H/K} P`. -/
theorem heegnerFinite_one_eq_trace (x : V) :
    heegnerFinite (1 : G →* Lˣ) x = Finset.univ.sum fun g : G ↦ g • x := by
  sorry

end Isotypic

/-! ## GZ.8 — the coefficient (L-linear) Néron–Tate pairing -/

section CoeffPairing

variable {M : Type*} [Field M] [Algebra ℚ M]
  {V W : Type*} [AddCommGroup V] [Module M V] [AddCommGroup W] [Module M W]

/-- GZ.8/l-linear-neron-tate-pairing: the unique pairing with values in `ℝ ⊗[ℚ] M`, `M`-linear in
each variable (on `W` through the dual endomorphisms), whose trace is the rational Néron–Tate
pairing `B`. Constructing it needs the nondegeneracy of the trace form, so the body is `sorry`. -/
def coeffPairing (B : V →+ W →+ ℝ) : V →+ W →+ ℝ ⊗[ℚ] M :=
  sorry

theorem trace_coeffPairing [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (x : V) (y : W) :
    Algebra.trace ℝ (ℝ ⊗[ℚ] M) (coeffPairing B x y) = B x y := by
  sorry

theorem coeffPairing_smul_left [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (m : M) (x : V) (y : W) :
    coeffPairing B (m • x) y = ((1 : ℝ) ⊗ₜ[ℚ] m) * coeffPairing B x y := by
  sorry

/-- `W` carries the action of `M` by dual endomorphisms `m ↦ m^†`. -/
theorem coeffPairing_smul_right [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (m : M) (x : V) (y : W) :
    coeffPairing B x (m • y) = ((1 : ℝ) ⊗ₜ[ℚ] m) * coeffPairing B x y := by
  sorry

theorem coeffPairing_galois {Γ : Type*} [Group Γ] [DistribMulAction Γ V] [DistribMulAction Γ W]
    [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y))
    (hBΓ : ∀ (g : Γ) (x : V) (y : W), B (g • x) (g • y) = B x y)
    (hV : ∀ (g : Γ) (m : M) (x : V), g • m • x = m • g • x)
    (hW : ∀ (g : Γ) (m : M) (y : W), g • m • y = m • g • y) (g : Γ) (x : V) (y : W) :
    coeffPairing (M := M) B (g • x) (g • y) = coeffPairing (M := M) B x y := by
  sorry

theorem coeffPairing_chi_orthogonal {Γ : Type*} [Group Γ] [DistribMulAction Γ V]
    [DistribMulAction Γ W] [FiniteDimensional ℚ M] (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y))
    (hBΓ : ∀ (g : Γ) (x : V) (y : W), B (g • x) (g • y) = B x y)
    (hV : ∀ (g : Γ) (m : M) (x : V), g • m • x = m • g • x)
    (hW : ∀ (g : Γ) (m : M) (y : W), g • m • y = m • g • y)
    (g : Γ) (a b : M) (x : V) (y : W) (hx : g • x = a • x) (hy : g • y = b • y) (hab : a * b ≠ 1) :
    coeffPairing (M := M) B x y = 0 := by
  sorry

theorem coeffPairing_torsion_left (B : V →+ W →+ ℝ) {x : V} (hx : IsOfFinAddOrder x) (y : W) :
    coeffPairing (M := M) B x y = 0 := by
  sorry

/-- For an elliptic curve (`M = ℚ`) with its principal polarisation the coefficient pairing is
the BSD pairing, the polar form of the canonical height (Tau Ceti's `canonicalHeightQuadratic`;
GZ.0's `bsdHeightPairing`). -/
theorem coeffPairing_elliptic {E : Type*} [AddCommGroup E] [Module ℚ E]
    (Q : QuadraticMap ℤ E ℝ) (B : E →+ E →+ ℝ) (hB : ∀ x y, B x y = QuadraticMap.polar Q x y)
    (x y : E) :
    Algebra.TensorProduct.rid ℚ ℚ ℝ (coeffPairing (M := ℚ) B x y) = QuadraticMap.polar Q x y := by
  sorry

/-- Unit test: for `M = ℚ` the coefficient pairing is the rational pairing. -/
theorem coeffPairing_rat {E F : Type*} [AddCommGroup E] [Module ℚ E] [AddCommGroup F] [Module ℚ F]
    (B : E →+ F →+ ℝ) (x : E) (y : F) :
    coeffPairing (M := ℚ) B x y = B x y ⊗ₜ[ℚ] (1 : ℚ) := by
  sorry

/-- Unit test: in a quadratic field `ℚ(s)`, `s² = 5`, a coefficient pairing `a ⊗ 1 + b ⊗ s` has
trace `2a`, and `⟨s x, y⟩ = 10 b`. -/
theorem coeffPairing_trace_qsqrt5 [FiniteDimensional ℚ M] (hM : Module.finrank ℚ M = 2) (s : M)
    (hs : s ^ 2 = 5) (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (x : V) (y : W) (a b : ℝ)
    (hxy : coeffPairing B x y = a ⊗ₜ[ℚ] (1 : M) + b ⊗ₜ[ℚ] s) :
    B x y = 2 * a ∧ B (s • x) y = 10 * b := by
  sorry

/-- Unit test: on an elliptic curve the BSD pairing of a point with itself is twice the canonical
height, `⟨P, P⟩ = 2 ĥ(P)` (Tau Ceti's `canonicalHeight`, the `(O)`-normalised height). -/
theorem coeffPairing_eq_bsd {E : Type*} [AddCommGroup E] [Module ℚ E] (Q : QuadraticMap ℤ E ℝ)
    (B : E →+ E →+ ℝ) (hB : ∀ x y, B x y = QuadraticMap.polar Q x y) (x : E) :
    Algebra.TensorProduct.rid ℚ ℚ ℝ (coeffPairing (M := ℚ) B x x) = 2 * Q x := by
  sorry

/-- Unit test (non-example): the rational pairing is not `M`-bilinear: if the coefficient pairing
is `1`, then `⟨x, y⟩ = 2` but `⟨s x, y⟩ = 0`. -/
theorem coeffPairing_not_trace [FiniteDimensional ℚ M] (hM : Module.finrank ℚ M = 2) (s : M)
    (hs : s ^ 2 = 5) (B : V →+ W →+ ℝ)
    (hB : ∀ (m : M) (x : V) (y : W), B (m • x) y = B x (m • y)) (x : V) (y : W)
    (hxy : coeffPairing B x y = (1 : ℝ ⊗[ℚ] M)) :
    B x y = 2 ∧ B (s • x) y = 0 := by
  sorry

end CoeffPairing

/-! ## GZ.8 — the shape of the Yuan–Zhang–Zhang identity -/

section Identity

variable {L : Type*} [Field L] {P : Type*} [AddCommGroup P] [Module L P]
  {Fm : Type*} [AddCommGroup Fm] [Module L Fm]

/-- GZ.8/general-quaternionic-gross-zagier-identity, its linear-algebra core: in a space `S` of
invariant bilinear forms (inside a module `Fm` of forms) of dimension at most one, a nonzero `α` generates, so the height form is
a multiple of `α` and no form is divided by another. The arithmetic identification of the multiple
with `ζ_F(2) L'(1/2, π_A, χ)/(4 L(1, η)² L(1, π_A, ad))` needs L-functions over `K`; it is
omitted. -/
theorem invariant_form_eq_smul (S : Submodule L Fm)
    (hS : Module.finrank L S ≤ 1) [FiniteDimensional L S] (α β : S) (hα : α ≠ 0) :
    ∃ c : L, β = c • α := by
  sorry

/-- GZ.8/vacuous-case: if the space of invariant forms is zero, both sides vanish. -/
theorem invariant_form_eq_zero (S : Submodule L Fm) (hS : S = ⊥) (β : S) :
    β = 0 := by
  sorry

/-- GZ.8/essential-case-root-number: with `ε_v = χ_v(−1)` off `Σ` and `−χ_v(−1)` on `Σ`, and
`∏ χ_v(−1) = 1`, the global sign is `(−1)^{#Σ}`. -/
theorem prod_root_number {ι : Type*} [DecidableEq ι] (T : Finset ι) (Sg : Finset ι)
    (hS : Sg ⊆ T) (ε c : ι → ℤˣ) (hε : ∀ v ∈ T, ε v = if v ∈ Sg then -c v else c v)
    (hc : ∏ v ∈ T, c v = 1) :
    ∏ v ∈ T, ε v = (-1) ^ Sg.card := by
  sorry

/-- GZ.8/nonvanishing-criterion, its formal step: a bilinear form nonzero at `(x, y)` forces
`x ≠ 0`; the Heegner point is nonzero when the right side of the identity is. -/
theorem ne_zero_of_form_ne_zero (β : P →ₗ[L] P →ₗ[L] L) {x y : P} (h : β x y ≠ 0) : x ≠ 0 := by
  sorry

end Identity

/-! ## GZ.8 — admissible orders and test vectors (Cai–Shu–Tian) -/

section TestVector

variable {Bx : Type*} [Group Bx] {L : Type*} [Field L]
  {Vπ : Type*} [AddCommGroup Vπ] [Module L Vπ] [DistribMulAction Bx Vπ] [SMulCommClass Bx L Vπ]

/-- GZ.8/admissible-order-test-vector: admissibility of an order `R` with unit group `U` for
`(π, χ)`, prototyped by the condition `R̂^× ∩ K̂^× = Ô_{c₁}^×` on unit groups (`U ⊓ T = Uc`).
Omitted, because orders of `B_f` and their discriminants are not in the libraries: the
discriminant `N` and the local conditions at `v | (c₁, N)` of Cai–Shu–Tian Definition 1.3. -/
structure TorusUnitIntersection (U T Uc : Subgroup Bx) : Prop where
  inf_torus : U ⊓ T = Uc

/-- `V(π, χ)`: the vectors that are `ω`-eigen under `U` and `χ⁻¹`-eigen under `T₁`
(the product of the `K_v^×`, `v ∈ Σ₁`). -/
def testVectorLine (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ) :
    Submodule L Vπ where
  carrier := {f | (∀ u : U, (u : Bx) • f = ((ω u : Lˣ) : L) • f) ∧
    ∀ t : T₁, (t : Bx) • f = (((χ t)⁻¹ : Lˣ) : L) • f}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

/-- Membership API for the two eigenconditions; users need not unfold the submodule. -/
theorem mem_testVectorLine_iff (U : Subgroup Bx) (ω : U →* Lˣ)
    (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ) (f : Vπ) :
    f ∈ testVectorLine U ω T₁ χ ↔
      (∀ u : U, (u : Bx) • f = ((ω u : Lˣ) : L) • f) ∧
      ∀ t : T₁, (t : Bx) • f = (((χ t)⁻¹ : Lˣ) : L) • f := by
  sorry

/- Pending arithmetic API: `finrank_testVectorLine` and
`localToric_ne_zero_of_mem_testVectorLine` need an irreducible admissible local representation,
its conductor, a genuinely admissible order and the specified nonzero toric functional with its
root-number condition (CST Proposition 3.7). Arbitrary representations can have a zero or
larger invariant space; an arbitrary bilinear map can be zero. `TorusUnitIntersection` is only
one necessary condition on an admissible order, not that full predicate. -/

/-- The unit-intersection fragment follows from the stated equality. This does not establish
the discriminant and other local conditions for an admissible Eichler order. -/
theorem torusUnitIntersection_of_eq (U T Uc : Subgroup Bx) (h : U ⊓ T = Uc) :
    TorusUnitIntersection U T Uc :=
  ⟨h⟩

/-- Unit test: CST's embedding for `K = ℚ(√−7)`, `N = 11`, `c = 1` sends `(−7 + √−7)/2` to
`!![1, -1; 22, -8]`, which lies in the Eichler order of level 11 (`11 ∣ 22`) and satisfies the
minimal polynomial `X² + 7X + 14` of `(−7 + √−7)/2`. -/
theorem isAdmissibleOrder_eichler_X0 :
    (11 : ℤ) ∣ (!![1, -1; 22, -8] : Matrix (Fin 2) (Fin 2) ℤ) 1 0 ∧
      (!![1, -1; 22, -8] : Matrix (Fin 2) (Fin 2) ℤ) ^ 2 + 7 • !![1, -1; 22, -8] + 14 • 1 = 0 := by
  sorry

/-- Unit test: with trivial `ω` and no `Σ₁`-condition, `V(π, χ)` is the space of `U`-invariants. -/
theorem testVectorLine_unramified (U : Subgroup Bx) (χ : (⊥ : Subgroup Bx) →* Lˣ) (f : Vπ) :
    f ∈ testVectorLine U 1 ⊥ χ ↔ ∀ u : U, (u : Bx) • f = f := by
  sorry

/-- Unit test: a one-dimensional test-vector line makes any two test vectors proportional. -/
theorem testVectorLine_finrank_one (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx)
    (χ : T₁ →* Lˣ) (h : Module.finrank L (testVectorLine (Vπ := Vπ) U ω T₁ χ) = 1) {f g : Vπ}
    (hf : f ∈ testVectorLine U ω T₁ χ) (hg : g ∈ testVectorLine U ω T₁ χ) (h0 : f ≠ 0) :
    ∃ c : L, g = c • f := by
  sorry

/-- Unit test (non-example): a vector fixed by an element `t` of `T₁` with `χ(t) ≠ 1` is not a
test vector, as for the newline at `p | (N, D)` with `χ([𝔭]) = a_p`. -/
theorem newline_not_testVector (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ)
    (t : T₁) (hχ : χ t ≠ 1) {f : Vπ} (ht : (t : Bx) • f = f) (h0 : f ≠ 0) :
    f ∉ testVectorLine U ω T₁ χ := by
  sorry

end TestVector

/-! ## GZ.9 — the ratio of Petersson norms -/

section Petersson

open UpperHalfPlane MeasureTheory

/-- The weight-two Petersson norm `∫_D |g|² (Im τ)² dμ = ∫_D |g|² dx dy`; it is Tau Ceti's
`UpperHalfPlane.peterssonInner 2 D g g`. -/
def peterssonNorm (D : Set ℍ) (g : ℍ → ℂ) : ℂ :=
  ∫ τ in D, UpperHalfPlane.petersson 2 g g τ

/-- GZ.9/petersson-norm-ratio: `α(f, f_B) = ⟨f, f⟩_{Γ₀(N)} / ⟨f_B, f_B⟩_{Γ₀^B(N⁺)}`, with `D`, `D'`
fundamental domains of `Γ₀(N)` and of the norm-one units of the Eichler order. -/
def peterssonRatio (D D' : Set ℍ) (f fB : ℍ → ℂ) : ℂ :=
  peterssonNorm D f / peterssonNorm D' fB

theorem peterssonRatio_split (D : Set ℍ) (f : ℍ → ℂ) (h : peterssonNorm D f ≠ 0) :
    peterssonRatio D D f f = 1 := by
  sorry

theorem peterssonRatio_smul (D D' : Set ℍ) (f fB : ℍ → ℂ) (u : ℂ) :
    peterssonRatio D D' f (u • fB) = peterssonRatio D D' f fB / (Complex.normSq u : ℂ) := by
  sorry

theorem peterssonRatio_pos (D D' : Set ℍ) (f fB : ℍ → ℂ) (hf : 0 < (peterssonNorm D f).re)
    (hfB : 0 < (peterssonNorm D' fB).re) : 0 < (peterssonRatio D D' f fB).re := by
  sorry

/-- Unit test: `α(f, f) = 1` in the split case. -/
theorem peterssonRatio_self (D : Set ℍ) (f : ℍ → ℂ) (h : peterssonNorm D f ≠ 0) :
    peterssonRatio D D f f = 1 := by
  sorry

/-- Unit test: replacing `f_B` by `2 f_B` divides `α` by 4. -/
theorem peterssonRatio_scale_two (D D' : Set ℍ) (f fB : ℍ → ℂ) :
    peterssonRatio D D' f ((2 : ℂ) • fB) = peterssonRatio D D' f fB / 4 := by
  sorry

/-- Unit test: the numerator is the Petersson norm (Tau Ceti's `peterssonInner 2 D f f`). -/
theorem peterssonRatio_eq_peterssonInner (D D' : Set ℍ) (f fB : ℍ → ℂ)
    (h : peterssonNorm D' fB ≠ 0) :
    peterssonRatio D D' f fB * peterssonNorm D' fB = ∫ τ in D, UpperHalfPlane.petersson 2 f f τ := by
  sorry

/-- Unit test (non-example): for weight two, `|g|²` alone is not invariant — it picks up
`|cz + d|⁴` — so `∫ |g|² dx dy / y²` (JSW's printed normalisation, E3) is not the norm. -/
theorem peterssonRatio_not_dxdy_over_ysq (g : ℍ → ℂ) (τ τ' : ℍ) (c : ℂ) (hc : ‖c‖ ≠ 1)
    (hg : g τ' = c ^ 2 * g τ) (h0 : g τ ≠ 0) : ‖g τ'‖ ^ 2 ≠ ‖g τ‖ ^ 2 := by
  sorry

end Petersson

/-! ## GZ.9 — evaluation fragments; arithmetic BDP signatures pending -/

section BDP

open PowerSeries

variable (R : Type*) [CommRing R] [UniformSpace R]

/- Pending packet APIs: bdpLFunction, bdpLFunction_eval, bdpLFunction_interpolation,
bdpLFunction_eq_of_interpolation, bdpLFunction_eval_one, bdpLFunction_incomplete,
bdpLFunction_period_change and bdpLFunction_eq_sq. These need the specific coefficient DVR
with its complete separated adic topology, the constructed measure, the character branch,
periods and Hecke/newform data. `bdpInterpolatedValue` with body sorry was not a specification
of those values and has been removed. Likewise `hsiehSquareRoot` must be an imported L3h
object, not a private replacement. Density/Weierstrass uniqueness is not valid for an
arbitrary UniformSpace on an abstract DVR. The pending test `bdpLFunction_unique` must use
that actual adic topology and convergence hypotheses. -/

/-- Evaluation at the trivial character reduces to the constant coefficient. This is an
algebraic evaluation test, not a construction of the BDP measure. -/
theorem bdpLFunction_eval_zero [T2Space R] (F : PowerSeries R) :
    PowerSeries.eval₂ (RingHom.id R) 0 F = PowerSeries.constantCoeff F := by
  sorry

/-- Proposed arithmetic test values for 11a1: the independent point counts are still needed
when this is used as a test of a modular-form/elliptic-curve object. -/
theorem bdpLFunction_euler_11a1 :
    (1 + (5 : ℚ) - 1) / 5 = 1 ∧ (1 + (23 : ℚ) - (-1)) / 23 = 25 / 23 := by
  sorry

/-- Only the positive weight/congruence condition. The full interpolation set also needs the
anticyclotomic character, its avatar and the crystalline/conductor conditions. -/
def interpolationWeightCondition (p n : ℕ) : Prop :=
  0 < n ∧ (p - 1) ∣ n

/-- The trivial character has weight zero, so fails this necessary interpolation condition. -/
theorem bdpLFunction_trivial_not_interpolated (p : ℕ) :
    ¬ interpolationWeightCondition p 0 := by
  sorry

-- Example: the trivial-character evaluation of a constant series recovers its value.
example [T2Space R] (a : R) :
    PowerSeries.eval₂ (RingHom.id R) 0 (PowerSeries.C a) = a := by
  sorry

end BDP

/-! ## GZ.9 — Brooks's quaternionic construction -/

section Quaternionic

variable {R : Type*} [CommRing R] {C : Type*} [Fintype C]

/-- GZ.9/quaternionic-bdp-construction (Brooks Proposition 8.9): the value at `χ` is the square of
the `χ⁻¹`-weighted sum over `Cl(O_K)` of the CM values `θ^j f_B^♭(a ⋆ (A, t, ω̂))`. The CM values
come from Serre–Tate expansions on `X_{N⁺,N⁻}`, which the libraries lack; they enter as data. -/
def quaternionicBDP (χinv cmValue : C → R) : R :=
  (∑ a, χinv a * cmValue a) ^ 2

theorem quaternionicBDP_eq_sq_sum (χinv cmValue : C → R) :
    quaternionicBDP χinv cmValue = (∑ a, χinv a * cmValue a) ^ 2 :=
  rfl

/-- Extensionality for the finite-sum fragment, not for a geometric measure. -/
theorem quaternionicBDP_congr (χ₁ χ₂ c₁ c₂ : C → R)
    (hχ : ∀ a, χ₁ a = χ₂ a) (hc : ∀ a, c₁ a = c₂ a) :
    quaternionicBDP χ₁ c₁ = quaternionicBDP χ₂ c₂ := by
  sorry

/-- Brooks Proposition 8.10: congruent CM data give congruent values (continuity). -/
theorem quaternionicBDP_continuous (I : Ideal R) (M : ℕ) (χ₁ χ₂ c₁ c₂ : C → R)
    (hχ : ∀ a, χ₁ a - χ₂ a ∈ I ^ M) (hc : ∀ a, c₁ a - c₂ a ∈ I ^ M) :
    quaternionicBDP χ₁ c₁ - quaternionicBDP χ₂ c₂ ∈ I ^ M := by
  sorry

/-- Changing the Serre–Tate period by `a` multiplies the CM values of weight `w` by `a^w` and the
function by `a^{2w}`. -/
theorem quaternionicBDP_period (a : R) (w : ℕ) (χinv cmValue : C → R) :
    quaternionicBDP χinv (fun c ↦ a ^ w * cmValue c) = a ^ (2 * w) * quaternionicBDP χinv cmValue := by
  sorry

/- Pending `quaternionicBDP_measure`: the CM values must be the Serre–Tate values of
this specific form at the points attached to the evaluating character. With arbitrary CM data,
the omitted original equality would assert that a fixed measure value is both zero and one.
The squared finite sum below tests algebra only; it does not supply the geometric construction,
its continuity across different character weights or its boundedness as a measure. -/

/-- Unit test: class number one leaves one term. -/
theorem quaternionicBDP_sq_sum_one_class [Unique C] (χinv cmValue : C → R) :
    quaternionicBDP χinv cmValue = (χinv default * cmValue default) ^ 2 := by
  sorry

/-- Unit test: the zero form gives zero. -/
theorem quaternionicBDP_zero_form (χinv : C → R) : quaternionicBDP χinv (0 : C → R) = 0 := by
  sorry

/-- Unit test: scaling `f_B` by `c` scales the function by `c²`. -/
theorem quaternionicBDP_scale (c : R) (χinv cmValue : C → R) :
    quaternionicBDP χinv (c • cmValue) = c ^ 2 * quaternionicBDP χinv cmValue := by
  sorry

/-- Unit test (non-example): the value is a square; the unsquared sum is the square-root object. -/
theorem quaternionicBDP_is_square (χinv cmValue : C → R) :
    ∃ s : R, quaternionicBDP χinv cmValue = s ^ 2 :=
  ⟨_, rfl⟩

end Quaternionic

/-! ## GZ.9 — the weight-two formulas -/

section WeightTwo

/-- GZ.9/euler-factor-at-bdp-point: `1 + p − a_p ≠ 0` under the Ramanujan–Hasse bound. -/
theorem euler_factor_ne_zero (p : ℕ) (hp : 2 ≤ p) (a : ℝ) (ha : |a| ≤ 2 * Real.sqrt p) :
    1 + (p : ℝ) - a ≠ 0 := by
  sorry

/-- GZ.9/isogeny-and-differential-compatibility, part (a): a logarithm pulled back along a
homomorphism is the logarithm of the image. Here a logarithm is an additive map to the base and
`hlog` is the defining identity `log_{φ^*ω'} = log_{ω'} ∘ φ`. -/
theorem log_pullback {A A' F : Type*} [AddCommGroup A] [AddCommGroup A'] [AddCommGroup F]
    (φ : A →+ A') (logω' : A' →+ F) (logφω' : A →+ F) (hlog : ∀ x, logφω' x = logω' (φ x)) (x : A) :
    logφω' x = logω' (φ x) :=
  hlog x

/- Pending `bdp_weight_two_formula`: the measure, Euler factor, character values and
logarithms of the Heegner divisors must be attached to the same arithmetic data. Quantifying over
arbitrary E and logs while fixing the measure value would imply 0 = 1. GZ.9 imports GH.1's
Theorem 5.13 and specializes it; it does not reassert that theorem without its hypotheses. -/

/-- The endpoint omitted by the original p ≥ 5 valuation argument: a₅ = −4 gives E₅ = 2. -/
example : (1 + (5 : ℚ) - (-4)) / 5 = 2 := by
  sorry

-- A single CM class with character value 1 and CM value 3 gives the square 9, not 3.
example : quaternionicBDP (fun _ : Unit ↦ (1 : ℚ)) (fun _ ↦ (3 : ℚ)) = 9 := by
  sorry

-- Zero CM data give zero independently of the class-character coefficients.
example {C : Type*} [Fintype C] (χinv : C → ℚ) :
    quaternionicBDP χinv (fun _ ↦ (0 : ℚ)) = 0 := by
  sorry

end WeightTwo

end TauCeti.GrossZagier
