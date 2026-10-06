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

The file imports only Mathlib: the Tau Ceti modules this plan cites (`CanonicalHeight`,
`Petersson.Basic`) are named in docstrings, and the Mathlib objects they are built from are used
directly (`QuadraticMap.polar` for the BSD pairing of a canonical height, the set integral of
`UpperHalfPlane.petersson` for Tau Ceti's `peterssonInner`).

Shimura curves, automorphic representations, toric functionals, L-functions of modular forms over
K, CM periods and p-adic avatars are not in the libraries. Where a declaration needs them, the
file prototypes the part that can be stated with existing carriers — the finite-group, linear and
power-series algebra — and records the remaining conditions in the docstring as omitted. Data
that the plan constructs but that cannot be built from existing carriers (the BDP power series,
the coefficient pairing, the interpolated value) are definitions with body `sorry`, each named
after its node; no `Prop` is ever replaced by `sorry`.
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
structure IsAdmissibleOrder (U T Uc : Subgroup Bx) : Prop where
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

/-- Cai–Shu–Tian Proposition 3.7: `dim V(π, χ) = 1`. Conditions omitted: `π` irreducible
admissible with conductor `N`, `R` admissible for `(π, χ)` and the local root-number condition;
as stated, for an arbitrary representation, the signature is not provable. -/
theorem finrank_testVectorLine (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx)
    (χ : T₁ →* Lˣ) : Module.finrank L (testVectorLine (Vπ := Vπ) U ω T₁ χ) = 1 := by
  sorry

/-- Test vectors: `α(f, f') ≠ 0` for nonzero `f ∈ V(π_A, χ)`, `f' ∈ V(π_{A^∨}, χ⁻¹)`.
Conditions omitted as for `finrank_testVectorLine`; `α` is the local toric form of GZ.4. -/
theorem localToric_ne_zero_of_mem_testVectorLine {Vπ' : Type*} [AddCommGroup Vπ'] [Module L Vπ']
    [DistribMulAction Bx Vπ'] [SMulCommClass Bx L Vπ'] (α : Vπ →ₗ[L] Vπ' →ₗ[L] L)
    (U : Subgroup Bx) (ω ω' : U →* Lˣ) (T₁ : Subgroup Bx) (χ χ' : T₁ →* Lˣ) {f : Vπ} {f' : Vπ'}
    (hf : f ∈ testVectorLine U ω T₁ χ) (hf' : f' ∈ testVectorLine U ω' T₁ χ')
    (h0 : f ≠ 0) (h0' : f' ≠ 0) : α f f' ≠ 0 := by
  sorry

/-- For `F = ℚ` and the Heegner conditions the Eichler order of level `N` is admissible; in the
prototype the content is the intersection with the torus. -/
theorem isAdmissibleOrder_eichler (U T Uc : Subgroup Bx) (h : U ⊓ T = Uc) :
    IsAdmissibleOrder U T Uc :=
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

/-! ## GZ.9 — the BDP anticyclotomic p-adic L-function -/

section BDP

open PowerSeries

variable (R : Type*) [CommRing R] [UniformSpace R]

/-- GZ.9/bdp-p-adic-l-function: `L_p(f) ∈ R⟦T⟧ ≅ R⟦Gal(K_∞/K)⟧` for the weight-two newform `f`,
the imaginary quadratic field `K` and the split prime `p` (`γ − 1 ↦ T`). The interpolation
property that characterises it needs L-functions of `f` over `K`, CM periods and p-adic avatars,
which the libraries lack; the body is `sorry` and the property is stated against the
placeholder `bdpInterpolatedValue`. -/
def bdpLFunction {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) : PowerSeries R :=
  sorry

/-- Placeholder for the right side of JSW (5.1.a) at a character of weight `(−n, n)` with value
`ψγ` at `γ` and p-adic period `Ωp`: `E_v̄² t_K C/(α W) · Ωp^{4n} · L(f, ψ^alg, 1)/Ω_∞^{4n}`. Named
after the plan; its carriers belong to AutomorphicLFunctionsAndLocalFactors AL.3 and
AutomorphicPadicLFunctions L0/L3. -/
def bdpInterpolatedValue {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) (Ωp : R) (n : ℕ) (ψγ : R) : R :=
  sorry

/-- Evaluation at a character `ψ`: `ψ(L_p(f)) = L_p(f)(ψ(γ) − 1)`. -/
def bdpLFunction_eval {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) (ψγ : R) : R :=
  PowerSeries.eval₂ (RingHom.id R) (ψγ - 1) (bdpLFunction R f K p)

/-- The interpolation property (JSW (5.1.a)) for `ψ ∈ Σ_cc`, `n > 0`, `n ≡ 0 mod (p − 1)`. -/
theorem bdpLFunction_interpolation {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) (Ωp : R) (n : ℕ) (hn : 0 < n) (hpn : (p - 1) ∣ n) (ψγ : R)
    (hψ : IsTopologicallyNilpotent (ψγ - 1)) :
    bdpLFunction_eval R f K p ψγ = bdpInterpolatedValue R f K p Ωp n ψγ := by
  sorry

/-- Uniqueness: power series over a complete discrete valuation ring (with its adic uniform
structure) that agree at infinitely many topologically nilpotent points are equal. -/
theorem bdpLFunction_eq_of_interpolation [IsDomain R] [IsDiscreteValuationRing R]
    (F G : PowerSeries R) (S : Set R) (hS : S.Infinite)
    (hnil : ∀ x ∈ S, IsTopologicallyNilpotent x)
    (h : ∀ x ∈ S, PowerSeries.eval₂ (RingHom.id R) x F = PowerSeries.eval₂ (RingHom.id R) x G) :
    F = G := by
  sorry

/-- The value at the trivial character (the BDP point) is the constant coefficient. -/
theorem bdpLFunction_eval_one [T2Space R] {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) :
    bdpLFunction_eval R f K p 1 = PowerSeries.constantCoeff (bdpLFunction R f K p) := by
  sorry

/-- The imprimitive function `L_p^Σ(f) = L_p(f) · ∏_{w ∈ Σ} P_w`. -/
def bdpLFunction_incomplete {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) {ι : Type*} (S : Finset ι) (Pw : ι → PowerSeries R) :
    PowerSeries R :=
  bdpLFunction R f K p * ∏ w ∈ S, Pw w

/-- Changing the p-adic period by `u` multiplies the interpolated value by `u^{4n}`. -/
theorem bdpLFunction_period_change {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) (u Ωp : R) (n : ℕ) (ψγ : R) :
    bdpInterpolatedValue R f K p (u * Ωp) n ψγ = u ^ (4 * n) * bdpInterpolatedValue R f K p Ωp n ψγ := by
  sorry

/-- Placeholder for AutomorphicPadicLFunctions L3h's square-root distribution, specialised to
`F = ℚ`, `n⁻ = 1` and transported to `Γ`. -/
def hsiehSquareRoot {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) : PowerSeries R :=
  sorry

/-- GZ.9/bdp-square-root-comparison: `L_p(f)` is a unit times the square of the square-root
distribution (`N⁻ = 1`). -/
theorem bdpLFunction_eq_sq {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ) : ∃ u : (PowerSeries R)ˣ,
    bdpLFunction R f K p = (u : PowerSeries R) * hsiehSquareRoot R f K p ^ 2 := by
  sorry

/-- Unit test: evaluation at `T = 0` is the constant coefficient. -/
theorem bdpLFunction_eval_zero [T2Space R] (F : PowerSeries R) :
    PowerSeries.eval₂ (RingHom.id R) 0 F = PowerSeries.constantCoeff F := by
  sorry

/-- Unit test: a power series vanishing at infinitely many topologically nilpotent points of a
complete discrete valuation ring is zero. -/
theorem bdpLFunction_unique [IsDomain R] [IsDiscreteValuationRing R] (F : PowerSeries R)
    (S : Set R) (hS : S.Infinite) (hnil : ∀ x ∈ S, IsTopologicallyNilpotent x)
    (h : ∀ x ∈ S, PowerSeries.eval₂ (RingHom.id R) x F = 0) : F = 0 := by
  sorry

/-- Unit test: for 11a1 at `p = 5` (split in `ℚ(√−19)`), `a₅ = 1` and the BDP-point Euler factor
`(1 + p − a_p)/p` is `1`; at `p = 23`, `a₂₃ = −1` and it is `25/23`. -/
theorem bdpLFunction_euler_11a1 :
    (1 + (5 : ℚ) - 1) / 5 = 1 ∧ (1 + (23 : ℚ) - (-1)) / 23 = 25 / 23 := by
  sorry

/-- The interpolation set `Σ_cc`: Hodge–Tate weight `n > 0` with `n ≡ 0 mod (p − 1)`. -/
def InSigmaCC (p n : ℕ) : Prop :=
  0 < n ∧ (p - 1) ∣ n

/-- Unit test (non-example): the trivial character, of weight `0`, is not in `Σ_cc`, so
`L_p(f, 1)` is not an interpolated value. -/
theorem bdpLFunction_trivial_not_interpolated (p : ℕ) : ¬ InSigmaCC p 0 := by
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

/-- The function is the evaluation of the BDP measure at `ψ`. Conditions omitted: `χinv` and
`cmValue` must be the character values and Serre–Tate CM values attached to `ψ`, which cannot be
expressed with library carriers. -/
theorem quaternionicBDP_measure [UniformSpace R] {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2)
    (K : Type*) [Field K] (p : ℕ) (ψγ : R) (χinv cmValue : C → R) :
    bdpLFunction_eval R f K p ψγ = quaternionicBDP χinv cmValue := by
  sorry

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

/-- GZ.9/bdp-weight-two-heegner-formula, its shape: the value at the BDP point is the squared
Euler factor times the square of the `χ⁻¹`-weighted sum of the logarithms of the Heegner points.
Conditions omitted: `E = 1 − χ⁻¹(p̄) a_p p⁻¹ + χ⁻²(p̄) p⁻¹` and `logs a = log_{ω_f}([P_a − ∞])`
must be the arithmetic data of `f`, `K` and `χ`, which cannot be expressed with library carriers. -/
theorem bdp_weight_two_formula (R : Type*) [CommRing R] [UniformSpace R]
    {Γ : Subgroup (GL (Fin 2) ℝ)} (f : CuspForm Γ 2) (K : Type*) [Field K] (p : ℕ)
    {C : Type*} [Fintype C] (E : R) (χinv logs : C → R) :
    bdpLFunction_eval R f K p 1 = E ^ 2 * (∑ a, χinv a * logs a) ^ 2 := by
  sorry

end WeightTwo

end TauCeti.GrossZagier
