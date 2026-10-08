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
import Mathlib.LinearAlgebra.TensorProduct.Associator
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Topology.ContinuousMap.Algebra
import Mathlib.Analysis.Normed.Operator.ContinuousLinearMap
import Mathlib.RingTheory.PowerSeries.Evaluation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.NumberTheory.ModularForms.Basic
import Mathlib.NumberTheory.ModularForms.Petersson
import Mathlib.Analysis.Complex.UpperHalfPlane.Measure
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.LinearAlgebra.Matrix.Notation
import TauCeti.NumberTheory.ModularForms.Petersson.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight

/-!
# Gross–Zagier formulas and arithmetic heights — suggested declarations (GZ.8 and GZ.9)

This file is not the roadmap and is not exhaustive. The roadmap document
(`research/blueprint/readmes/GrossZagierAndArithmeticHeights--GZ.8.md`) is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. Every proof is `sorry`; nothing here is implemented, and the packet's
`implementationStatus` stays `unchecked`. Pinned baseline: Mathlib 082e2d3, Tau Ceti f790474.

This revision keeps the algebraic prototypes separate from arithmetic signatures still needing
supplier types. In particular, a parameter carrying an arbitrary proposition is never used as a
substitute for a modularity, admissibility or geometric-measure hypothesis. The remaining missing
signatures are inventoried in the packet and handoff.

`coeffPairing` extends an already supplied M-bilinear height to L. `heegnerAverage` is the
L-valued probability average; the volume-scaled `heegnerIntegral` lives in a complex scalar
extension. The quaternionic constructor takes integral Amice transforms and sums their translated
measures BEFORE any interpolation theorem is used. Geometry connecting those transforms to
Serre–Tate expansions remains an explicit supplier interface.

The Petersson and elliptic-height compatibility blocks import the pinned library objects directly.
Their compiled modules are absent from the shared build: the Mathlib algebraic portion can be
checked independently, but that does not certify the full file or its arithmetic gaps.
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

/-- The YZZ point: the probability average, defined over L. CST §2.3 p.18 and
Skinner §2.5 distinguish this from the toric measure of total volume 2 L(1,η). -/
def heegnerAverage (χ : G →* Lˣ) (x : V) : V :=
  (Fintype.card G : L)⁻¹ • heegnerFinite χ x

theorem heegnerAverage_eq_projector (χ : G →* Lˣ) (x : V) :
    heegnerAverage χ x = chiProjector χ x := by
  sorry

/-- The analytic, volume-scaled toric integral. No assumption places its real volume in L. -/
def heegnerIntegral [Algebra L ℂ] (vol : ℂ) (χ : G →* Lˣ) (x : V) : ℂ ⊗[L] V :=
  vol • ((1 : ℂ) ⊗ₜ[L] heegnerAverage χ x)

theorem heegnerIntegral_eq [Algebra L ℂ] (vol : ℂ) (χ : G →* Lˣ) (x : V) :
    heegnerIntegral vol χ x =
      (vol / algebraMap L ℂ (Fintype.card G : L)) • ((1 : ℂ) ⊗ₜ[L] heegnerFinite χ x) := by
  sorry

/-- Rational trace versus probability-average height: the cardinality is squared. -/
theorem heegnerAverage_pairing {W S : Type*} [AddCommGroup W] [Module L W]
    [DistribMulAction G W] [SMulCommClass G L W] [AddCommGroup S] [Module L S]
    (B : V →ₗ[L] W →ₗ[L] S) (χ : G →* Lˣ) (x : V) (y : W) :
    B (heegnerAverage χ x) (heegnerAverage χ⁻¹ y) =
      ((Fintype.card G : L)⁻¹)^2 • B (heegnerFinite χ x) (heegnerFinite χ⁻¹ y) := by
  sorry

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

/-! Concrete examples for the four isotypic and four finite-point tests.
The action and character below are actual two-element data, not assumed eigenspace results. -/
namespace SwapTests

private abbrev C2 := Multiplicative (ZMod 2)

private instance : DistribMulAction C2 (ℚ × ℚ) where
  smul g x := if g = 1 then x else (x.2, x.1)
  one_smul := by sorry
  mul_smul := by sorry
  smul_zero := by sorry
  smul_add := by sorry

private instance : SMulCommClass C2 ℚ (ℚ × ℚ) where
  smul_comm := by sorry

private def signCharacter : C2 →* ℚˣ where
  toFun g := if g = 1 then 1 else -1
  map_one' := by sorry
  map_mul' := by sorry

-- chiIsotypic_trivial_eq_fixed: the diagonal, not the whole module.
example (a b : ℚ) : (a,b) ∈ chiIsotypic (1 : C2 →* ℚˣ) ↔ a = b := by sorry

-- chiProjector_idem: computed projector, including its 1/2 normalization.
example (a b : ℚ) : chiProjector signCharacter (a,b) = ((a-b)/2,(b-a)/2) := by sorry

-- chiIsotypic_quadratic_sign.
example (a b : ℚ) : (a,b) ∈ chiIsotypic signCharacter ↔ b = -a := by sorry

-- chiIsotypic_ne_whole.
example : ((1,0) : ℚ × ℚ) ∉ chiIsotypic signCharacter ∧
    ((1,0) : ℚ × ℚ) ∉ chiIsotypic (1 : C2 →* ℚˣ) := by sorry

-- heegnerFinite_trivial_group.
example (x : ℚ) : heegnerFinite (1 : Unit →* ℚˣ) x = x := by sorry

-- heegnerFinite_sign_char.
example : heegnerFinite signCharacter ((1,0) : ℚ × ℚ) = (1,-1) := by sorry

-- heegnerFinite_fixed_nontrivial.
example : heegnerFinite signCharacter ((1,1) : ℚ × ℚ) = 0 := by sorry

-- heegnerFinite_one_eq_trace.
example : heegnerFinite (1 : C2 →* ℚˣ) ((1,0) : ℚ × ℚ) = (1,1) := by sorry

-- Probability averaging and complex integration have different scalars and carriers.
example : heegnerAverage signCharacter ((1,0) : ℚ × ℚ) = ((1/2, -1/2) : ℚ × ℚ) := by sorry

example : heegnerIntegral (3 : ℂ) signCharacter ((1,0) : ℚ × ℚ) =
    (3 : ℂ) • ((1 : ℂ) ⊗ₜ[ℚ] ((1/2, -1/2) : ℚ × ℚ)) := by sorry

end SwapTests

/-! ## GZ.8 — the coefficient (L-linear) Néron–Tate pairing -/

section CoeffPairing

variable {M L : Type*} [Field M] [Field L] [Algebra M L]
  {V W S : Type*} [AddCommGroup V] [Module M V] [AddCommGroup W] [Module M W]
  [AddCommGroup S] [Module M S]

/-- GZ.8 extends GZ.1's supplied M-valued height. For S = M ⊗[ℚ] ℝ, the target
L ⊗[M] S identifies with L ⊗[ℚ] ℝ by the scalar-tower associator. No M-height is rebuilt. -/
def coeffPairing (B : V →ₗ[M] W →ₗ[M] S) :
    (L ⊗[M] V) →ₗ[L] (L ⊗[M] W) →ₗ[L] (L ⊗[M] S) := by
  sorry

theorem coeffPairing_tmul (B : V →ₗ[M] W →ₗ[M] S) (a b : L) (x : V) (y : W) :
    coeffPairing B (a ⊗ₜ[M] x) (b ⊗ₜ[M] y) = (a*b) ⊗ₜ[M] B x y := by
  sorry

theorem coeffPairing_smul_left (B : V →ₗ[M] W →ₗ[M] S) (a : L)
    (x : L ⊗[M] V) (y : L ⊗[M] W) :
    coeffPairing B (a • x) y = a • coeffPairing B x y := by
  sorry

theorem coeffPairing_smul_right (B : V →ₗ[M] W →ₗ[M] S) (a : L)
    (x : L ⊗[M] V) (y : L ⊗[M] W) :
    coeffPairing B x (a • y) = a • coeffPairing B x y := by
  sorry

/-- The trace on scalar extension includes the degree [L:M], even on base points. -/
theorem trace_coeffPairing [FiniteDimensional M L] (B : V →ₗ[M] W →ₗ[M] M) (x : V) (y : W) :
    Algebra.trace M L ((TensorProduct.rid M L)
      (coeffPairing (L := L) B ((1 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y))) =
      (Module.finrank M L : M) * B x y := by
  sorry

/-- Equivariant changes of variables preserve the scalar-extended pairing. -/
theorem coeffPairing_galois (B : V →ₗ[M] W →ₗ[M] S)
    (f : V →ₗ[M] V) (g : W →ₗ[M] W) (h : ∀ x y, B (f x) (g y) = B x y)
    (x : V) (y : W) (a b : L) :
    coeffPairing B (a ⊗ₜ[M] f x) (b ⊗ₜ[M] g y) =
      coeffPairing B (a ⊗ₜ[M] x) (b ⊗ₜ[M] y) := by
  sorry

/-- Orthogonality of distinct reciprocal characters, for the actual extended height.
The required invariance is supplied by GZ.1, not inferred from an arbitrary bilinear form. -/
theorem coeffPairing_chi_orthogonal (B : V →ₗ[M] W →ₗ[M] S)
    (x : L ⊗[M] V) (y : L ⊗[M] W) (a b : L) (hab : a*b ≠ 1)
    (hinv : coeffPairing B (a • x) (b • y) = coeffPairing B x y) :
    coeffPairing B x y = 0 := by
  sorry

theorem coeffPairing_torsion_left (B : V →ₗ[M] W →ₗ[M] S) {x : V}
    (hx : IsOfFinAddOrder x) (y : W) :
    coeffPairing (L := L) B ((1 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y) = 0 := by
  sorry

/-- Identity scalar extension returns the supplied height; it is not a trace construction. -/
theorem coeffPairing_rat (B : V →ₗ[M] W →ₗ[M] S) (x : V) (y : W) :
    (TensorProduct.lid M S)
      (coeffPairing (L := M) B ((1 : M) ⊗ₜ[M] x) ((1 : M) ⊗ₜ[M] y)) = B x y := by
  sorry

/-- Degree-two extension: tracing a base value doubles it. This catches the missing-degree error. -/
theorem coeffPairing_trace_qsqrt5 [FiniteDimensional M L]
    (hL : Module.finrank M L = 2) (B : V →ₗ[M] W →ₗ[M] M) (x : V) (y : W) :
    Algebra.trace M L ((TensorProduct.rid M L)
      (coeffPairing (L := L) B ((1 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y))) = 2 * B x y := by
  sorry

/-- A base value 1 does not retain trace 1 in a degree-two extension. -/
theorem coeffPairing_not_trace [CharZero M] [FiniteDimensional M L]
    (hL : Module.finrank M L = 2) (B : V →ₗ[M] W →ₗ[M] M) (x : V) (y : W) (hxy : B x y = 1) :
    Algebra.trace M L ((TensorProduct.rid M L)
      (coeffPairing (L := L) B ((1 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y))) ≠ 1 := by
  sorry

-- Named unit tests above have executable example declarations as well.
example (B : V →ₗ[M] W →ₗ[M] S) (x : V) (y : W) :
    (TensorProduct.lid M S)
      (coeffPairing (L := M) B ((1 : M) ⊗ₜ[M] x) ((1 : M) ⊗ₜ[M] y)) = B x y := by sorry

example (B : V →ₗ[M] W →ₗ[M] S) (x : V) (y : W) :
    coeffPairing (L := L) B ((2 : L) ⊗ₜ[M] x) ((3 : L) ⊗ₜ[M] y) =
      (6 : L) ⊗ₜ[M] B x y := by sorry

example (B : V →ₗ[M] W →ₗ[M] S) (x : V) (y : W) :
    coeffPairing (L := L) B ((0 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y) = 0 := by sorry

-- coeffPairing_trace_qsqrt5: base values gain the quadratic extension degree.
example [FiniteDimensional M L] (h : Module.finrank M L = 2)
    (B : V →ₗ[M] W →ₗ[M] M) (x : V) (y : W) :
    Algebra.trace M L ((TensorProduct.rid M L)
      (coeffPairing (L := L) B ((1 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y))) = 2 * B x y := by sorry

-- coeffPairing_not_trace: the old trace law is false after extension.
example [CharZero M] [FiniteDimensional M L] (h : Module.finrank M L = 2)
    (B : V →ₗ[M] W →ₗ[M] M) (x : V) (y : W) (hxy : B x y = 1) :
    Algebra.trace M L ((TensorProduct.rid M L)
      (coeffPairing (L := L) B ((1 : L) ⊗ₜ[M] x) ((1 : L) ⊗ₜ[M] y))) ≠ 1 := by sorry

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

-- A coefficient tensor product need not be a domain: disjoint nonzero components multiply to zero.
example : ((1,0) : ℂ × ℂ) ≠ 0 ∧ ((0,1) : ℂ × ℂ) ≠ 0 ∧
    ((1,0) : ℂ × ℂ) * ((0,1) : ℂ × ℂ) = 0 := by sorry

end Identity

/-! ## GZ.8 — admissible orders and test vectors (Cai–Shu–Tian) -/

section TestVector

variable {Bx : Type*} [Group Bx] {L : Type*} [Field L]
  {Vπ : Type*} [AddCommGroup Vπ] [Module L Vπ] [DistribMulAction Bx Vπ] [SMulCommClass Bx L Vπ]

/-- A necessary unit-intersection fragment, not the admissibility predicate.
CST Definition 1.3 also needs the discriminant, two maximal orders, their optimal
intersections, and a conductor-selected split orientation. Those carrier types are missing. -/
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

-- Actual example for isAdmissibleOrder_eichler_X0: the integral matrix intersection.
-- This checks the optimal-embedding fragment, not the missing discriminant/orientation predicate.
example (a b : ℤ) :
    11 ∣ ((a • (1 : Matrix (Fin 2) (Fin 2) ℤ) + b • !![1,-1;22,-8]) : Matrix (Fin 2) (Fin 2) ℤ) 1 0 := by sorry

-- testVectorLine_unramified: for trivial torus the condition is exactly U-invariance.
example (U : Subgroup Bx) (f : Vπ) :
    f ∈ testVectorLine U (1 : U →* Lˣ) (⊥ : Subgroup Bx) 1 ↔
      ∀ u : U, (u : Bx) • f = f := by sorry

-- testVectorLine_finrank_one: one-dimensionality is a supplied representation theorem.
example (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ)
    (h : Module.finrank L (testVectorLine (Vπ := Vπ) U ω T₁ χ) = 1)
    (f g : testVectorLine (Vπ := Vπ) U ω T₁ χ) (hf : f ≠ 0) :
    ∃ c : L, g = c • f := by sorry

-- newline_not_testVector: a fixed vector cannot be an incompatible torus eigenvector.
example (U : Subgroup Bx) (ω : U →* Lˣ) (T₁ : Subgroup Bx) (χ : T₁ →* Lˣ)
    (t : T₁) (hχ : χ t ≠ 1) (f : Vπ) (hf : f ≠ 0) (ht : (t : Bx) • f = f) :
    f ∉ testVectorLine U ω T₁ χ := by sorry

end TestVector

/-! ## GZ.9 — the ratio of Petersson norms -/

section Petersson

open UpperHalfPlane MeasureTheory

/-- The weight-two Petersson norm `∫_D |g|² (Im τ)² dμ = ∫_D |g|² dx dy`; it is Tau Ceti's
`UpperHalfPlane.peterssonInner 2 D g g`. -/
def peterssonNorm (D : Set ℍ) (g : ℍ → ℂ) : ℂ :=
  UpperHalfPlane.peterssonInner 2 D g g

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
    peterssonRatio D D' f fB * peterssonNorm D' fB = UpperHalfPlane.peterssonInner 2 D f f := by
  sorry

/-- Unit test (non-example): for weight two, `|g|²` alone is not invariant — it picks up
`|cz + d|⁴` — so `∫ |g|² dx dy / y²` (JSW's printed normalisation, E3) is not the norm. -/
theorem peterssonRatio_not_dxdy_over_ysq (g : ℍ → ℂ) (τ τ' : ℍ) (c : ℂ) (hc : ‖c‖ ≠ 1)
    (hg : g τ' = c ^ 2 * g τ) (h0 : g τ ≠ 0) : ‖g τ'‖ ^ 2 ≠ ‖g τ‖ ^ 2 := by
  sorry

-- peterssonRatio_self.
example (D : Set ℍ) (f : ℍ → ℂ) (h : peterssonNorm D f ≠ 0) :
    peterssonRatio D D f f = 1 := by sorry

-- peterssonRatio_scale_two.
example (D D' : Set ℍ) (f fB : ℍ → ℂ) :
    peterssonRatio D D' f ((2 : ℂ) • fB) = peterssonRatio D D' f fB / 4 := by sorry

-- peterssonRatio_eq_peterssonInner: agreement with the actual imported pairing.
example (D : Set ℍ) (f : ℍ → ℂ) :
    peterssonNorm D f = UpperHalfPlane.peterssonInner 2 D f f := by sorry

-- peterssonRatio_not_dxdy_over_ysq: weight-two transformation changes raw |g|².
example (g : ℍ → ℂ) (τ τ' : ℍ) (hg : g τ' = 4 * g τ) (h0 : g τ ≠ 0) :
    ‖g τ'‖ ^ 2 ≠ ‖g τ‖ ^ 2 := by sorry

end Petersson

/-! ## GZ.9 — evaluation fragments; arithmetic BDP signatures pending -/

section BDP

variable {R : Type*} [CommRing R]

/-- GZ.9's normalization adapter. `root` is the ALREADY CONSTRUCTED measure from L3h
in the split case or `quaternionicRoot` in the quaternionic case. The unit includes a
group-like character factor; it need not be the image of a scalar of R. -/
def bdpLFunction (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) : PowerSeries R :=
  (normalization : PowerSeries R) * root^2

theorem bdpLFunction_eval {A : Type*} [CommRing A] (ev : PowerSeries R →+* A)
    (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) :
    ev (bdpLFunction root normalization) = ev normalization * ev root ^ 2 := by sorry

theorem bdpLFunction_eval_one (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) :
    PowerSeries.constantCoeff (bdpLFunction root normalization) =
      PowerSeries.constantCoeff (normalization : PowerSeries R) *
        PowerSeries.constantCoeff root ^ 2 := by sorry

/-- For fixed periods, adding an imprimitive Euler factor is multiplication in the same
completed group algebra. The arithmetic polynomial/Frobenius values come from AL.3. -/
def bdpIncomplete {S : Type*} (places : Finset S) (Euler : S → PowerSeries R)
    (F : PowerSeries R) : PowerSeries R := F * ∏ w ∈ places, Euler w

theorem bdpLFunction_incomplete {S A : Type*} [CommRing A]
    (ev : PowerSeries R →+* A) (places : Finset S) (Euler : S → PowerSeries R)
    (F : PowerSeries R) :
    ev (bdpIncomplete places Euler F) = ev F * ∏ w ∈ places, ev (Euler w) := by sorry

/-- The measure comparison is stated after construction; it cannot prove the existence
of the root measure to which the same comparison refers. -/
theorem bdpLFunction_eq_sq (root : PowerSeries R) (normalization : (PowerSeries R)ˣ) :
    bdpLFunction root normalization = (normalization : PowerSeries R) * root^2 := by sorry

/-- Moment scaling is the formal step in period transport; the geometric statement that
changing the CM differential gives these moments is requested from L3. -/
theorem bdpLFunction_period_change {A : Type*} [CommRing A] (ev : PowerSeries R →+* A)
    (root root' : PowerSeries R) (normalization : (PowerSeries R)ˣ) (u : A) (n : ℕ)
    (h : ev root' = u^(2*n) * ev root) :
    ev (bdpLFunction root' normalization) = u^(4*n) * ev (bdpLFunction root normalization) := by sorry

/- Pending arithmetic `bdpLFunction_interpolation`: JSW (5.1.a) must use the same
newform, integral Jacquet–Langlands transfer, ordinary CM expansions, periods, central-critical
avatar and tame branch as the constructor. This is not supplied by an arbitrary function of
characters. The exact supplier types and normalization-unit computation remain in the gap list. -/

/-- Uniqueness is tied to the genuine p-adic topology and to integral coefficients.
A nonzero bounded integral series has finitely many zeros in the open unit disk; L4 owns
Weierstrass preparation. No claim is made for an arbitrary topology on a DVR. -/
theorem bdpLFunction_eq_of_interpolation (p : ℕ) [Fact p.Prime]
    (F G : PowerSeries (PadicInt p)) (S : Set (Padic p)) (hS : S.Infinite)
    (hsmall : ∀ x ∈ S, ‖x‖ < 1)
    (h : ∀ x ∈ S, PowerSeries.eval₂ (PadicInt.Coe.ringHom) x F =
      PowerSeries.eval₂ (PadicInt.Coe.ringHom) x G) : F = G := by sorry

theorem bdpLFunction_unique (p : ℕ) [Fact p.Prime]
    (F : PowerSeries (PadicInt p)) (S : Set (Padic p)) (hS : S.Infinite)
    (hsmall : ∀ x ∈ S, ‖x‖ < 1)
    (h : ∀ x ∈ S, PowerSeries.eval₂ (PadicInt.Coe.ringHom) x F = 0) : F = 0 := by sorry

/-- Evaluation at the trivial character is algebraically the constant coefficient. -/
theorem bdpLFunction_eval_zero [UniformSpace R] [T2Space R] (F : PowerSeries R) :
    PowerSeries.eval₂ (RingHom.id R) 0 F = PowerSeries.constantCoeff F := by sorry

/-- 11a1 coefficients a_5=1 and a_23=-1 are independently certified by the point-count
examples below, using its minimal equation y²+y=x³−x²−10x−20. -/
theorem bdpLFunction_euler_11a1 :
    (1 + (5 : ℚ) - 1) / 5 = 1 ∧ (1 + (23 : ℚ) - (-1)) / 23 = 25 / 23 := by sorry

/-- A necessary positive-weight condition, not the full character domain. -/
def interpolationWeightCondition (p n : ℕ) : Prop := 0 < n ∧ (p-1) ∣ n

theorem bdpLFunction_trivial_not_interpolated (p : ℕ) :
    ¬ interpolationWeightCondition p 0 := by sorry

example : bdpLFunction (1 + PowerSeries.X : PowerSeries ℚ) 1 =
    1 + PowerSeries.C (2 : ℚ) * PowerSeries.X + PowerSeries.X^2 := by sorry

example : bdpLFunction (0 : PowerSeries ℚ) 1 = 0 := by sorry

example [UniformSpace R] [T2Space R] (root : PowerSeries R)
    (normalization : (PowerSeries R)ˣ) :
    PowerSeries.eval₂ (RingHom.id R) 0 (bdpLFunction root normalization) =
      PowerSeries.constantCoeff (normalization : PowerSeries R) *
        PowerSeries.constantCoeff root ^ 2 := by sorry

example (p : ℕ) : ¬ interpolationWeightCondition p 0 := by sorry

-- bdpLFunction_unique: actual convergent ℤ_p evaluation, not a formal interpolated placeholder.
example (p : ℕ) [Fact p.Prime] (F : PowerSeries (PadicInt p)) (S : Set (Padic p))
    (hS : S.Infinite) (hx : ∀ x ∈ S, ‖x‖ < 1)
    (hF : ∀ x ∈ S, PowerSeries.eval₂ (PadicInt.Coe.ringHom) x F = 0) :
    F = 0 := by sorry

-- The point counts include the point at infinity; omission changes the Hecke coefficient.
example : 1 + Fintype.card {xy : ZMod 5 × ZMod 5 //
    xy.2^2 + xy.2 = xy.1^3 - xy.1^2 - 10*xy.1 - 20} = 5 := by sorry

example : 1 + Fintype.card {xy : ZMod 23 × ZMod 23 //
    xy.2^2 + xy.2 = xy.1^3 - xy.1^2 - 10*xy.1 - 20} = 25 := by sorry

end BDP

/-! ## GZ.9 — Brooks's quaternionic construction -/

section Quaternionic

variable {R : Type*} [CommRing R] {C : Type*} [Fintype C]

/-- CM expansions are integral Amice transforms, and `translate` is the group-like
R-linear translation operator (multiplication by a group-like series) supplied by the chosen reciprocity chart. Burungale Lemma 5.5 and
(5.8), pp.28–29, give the geometric inputs; the general Amice isomorphism belongs to
PadicMeasuresIwasawaAlgebras L1. This constructor does not use interpolation. -/
def quaternionicRoot (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) : PowerSeries R :=
  ∑ a, PowerSeries.C (weight a) * translate a (cm a)

/-- The bounded quaternionic BDP measure is the convolution square of this root measure.
The corresponding power-series product is used after a generator of Γ is fixed. -/
def quaternionicBDP (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) : PowerSeries R :=
  quaternionicRoot weight cm translate ^ 2

/-- Character evaluation is a ring map supplied by the complete-adic measure interface.
Evaluated translated CM transforms are the specific Katz moments, not arbitrary CM values. -/
theorem quaternionicBDP_eq_sq_sum {A : Type*} [CommRing A]
    (ev : PowerSeries R →+* A) (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    ev (quaternionicBDP weight cm translate) =
      (∑ a, ev (PowerSeries.C (weight a)) * ev (translate a (cm a)))^2 := by
  sorry

theorem quaternionicBDP_congr (weight : C → R) (cm cm' : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) (h : ∀ a, cm a = cm' a) :
    quaternionicBDP weight cm translate = quaternionicBDP weight cm' translate := by
  sorry

/-- Continuity of evaluation is a consequence of a bounded measure, not its construction. -/
theorem quaternionicBDP_continuous {X A : Type*} [TopologicalSpace X] [CommRing A]
    [TopologicalSpace A] (ev : X → PowerSeries R →+* A)
    (hev : ∀ F, Continuous fun x ↦ ev x F) (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    Continuous fun x ↦ ev x (quaternionicBDP weight cm translate) := by
  sorry

/-- A period change scales the evaluated CM moment at weight w by a^w, hence its square
by a^(2w). The series itself changes through the associated character automorphism. -/
theorem quaternionicBDP_period {A : Type*} [CommRing A] (ev : PowerSeries R →+* A)
    (a : A) (w : ℕ) (weight : C → R) (cm cm' : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R)
    (h : ∀ c, ev (translate c (cm' c)) = a^w * ev (translate c (cm c))) :
    ev (quaternionicBDP weight cm' translate) =
      a^(2*w) * ev (quaternionicBDP weight cm translate) := by
  sorry

/- Pending arithmetic `quaternionicBDP_measure`: specialize the imported Amice
isomorphism for the complete DVR R, identify each `cm a` with the integral Serre–Tate
expansion of f_B^(p), restrict its Z_p-measure to the reciprocity open subgroup, then
translate and push forward. The algebraic series constructor alone does not establish
these geometric identifications; the packet requests them from R18.2 and L1. -/

/-- One CM class still retains its entire moment series, not just one special value. -/
theorem quaternionicBDP_sq_sum_one_class [Unique C] (cm : C → PowerSeries R) :
    quaternionicBDP (fun _ ↦ (1 : R)) cm (fun _ ↦ LinearMap.id) =
      cm default ^ 2 := by
  sorry

theorem quaternionicBDP_zero_form (weight : C → R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    quaternionicBDP weight (fun _ ↦ 0) translate = 0 := by
  sorry

theorem quaternionicBDP_scale (c : R) (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    quaternionicBDP weight (fun a ↦ PowerSeries.C c * cm a) translate =
      PowerSeries.C (c^2) * quaternionicBDP weight cm translate := by
  sorry

theorem quaternionicBDP_is_square (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    ∃ F : PowerSeries R, quaternionicBDP weight cm translate = F^2 := by
  sorry

-- quaternionicBDP_scale: scaling the full moment data gives quadratic scaling.
example (c : R) (weight : C → R) (cm : C → PowerSeries R)
    (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    quaternionicBDP weight (fun a ↦ PowerSeries.C c * cm a) translate =
      PowerSeries.C (c^2) * quaternionicBDP weight cm translate := by sorry

-- The coefficient of T tests moments that constant-character examples cannot see.
example : PowerSeries.coeff 1
    (quaternionicBDP (fun _ : Unit ↦ (1 : ℚ)) (fun _ ↦ 1 + PowerSeries.X)
      (fun _ ↦ LinearMap.id)) = 2 := by sorry

example : quaternionicBDP (fun _ : Unit ↦ (1 : ℚ))
    (fun _ ↦ PowerSeries.C (3 : ℚ)) (fun _ ↦ LinearMap.id) =
      PowerSeries.C (9 : ℚ) := by sorry

example (weight : C → R) (translate : C → PowerSeries R →ₗ[R] PowerSeries R) :
    quaternionicBDP weight (fun _ ↦ 0) translate = 0 := by sorry

example : quaternionicBDP (fun _ : Unit ↦ (1 : ℚ))
    (fun _ ↦ 1 + PowerSeries.X) (fun _ ↦ LinearMap.id) ≠
      quaternionicRoot (fun _ : Unit ↦ (1 : ℚ))
        (fun _ ↦ 1 + PowerSeries.X) (fun _ ↦ LinearMap.id) := by sorry

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
example : (1 + (5 : ℚ) - (-4)) / 5 = 2 := by sorry

-- The p=5 unit-factor counterexample is an actual curve count, not only arithmetic.
example : 1 + Fintype.card {xy : ZMod 5 × ZMod 5 //
    xy.2 ^ 2 = xy.1 ^ 3 + 3 * xy.1} = 10 := by sorry

end WeightTwo

/-! ## Compatibility with the pinned elliptic height
GZ.0/GZ.1 supply the rational extension B of the full polar height.
Its comparison hypothesis below names the actual Tau Ceti pairing; it is never
asserted that an arbitrary rational bilinear map is the height. -/
section EllipticCompatibility

variable {F : Type*} [Field F] [Height.AdmissibleAbsValues F] [DecidableEq F]
  {W : WeierstrassCurve.Affine F} [W.toAffine.IsElliptic]

variable (B : (ℚ ⊗[ℤ] W.Point) →ₗ[ℚ] (ℚ ⊗[ℤ] W.Point) →ₗ[ℚ] ℝ)

theorem coeffPairing_elliptic
    (hB : ∀ P Q : W.Point, B ((1 : ℚ) ⊗ₜ[ℤ] P) ((1 : ℚ) ⊗ₜ[ℤ] Q) =
      2 * WeierstrassCurve.Affine.neronTatePairing W P Q) (P Q : W.Point) :
    TensorProduct.lid ℚ ℝ
      (coeffPairing (L := ℚ) B
        ((1 : ℚ) ⊗ₜ[ℚ] ((1 : ℚ) ⊗ₜ[ℤ] P))
        ((1 : ℚ) ⊗ₜ[ℚ] ((1 : ℚ) ⊗ₜ[ℤ] Q))) =
      2 * WeierstrassCurve.Affine.neronTatePairing W P Q := by sorry

theorem coeffPairing_eq_bsd
    (hB : ∀ P Q : W.Point, B ((1 : ℚ) ⊗ₜ[ℤ] P) ((1 : ℚ) ⊗ₜ[ℤ] Q) =
      2 * WeierstrassCurve.Affine.neronTatePairing W P Q) (P : W.Point) :
    TensorProduct.lid ℚ ℝ
      (coeffPairing (L := ℚ) B
        ((1 : ℚ) ⊗ₜ[ℚ] ((1 : ℚ) ⊗ₜ[ℤ] P))
        ((1 : ℚ) ⊗ₜ[ℚ] ((1 : ℚ) ⊗ₜ[ℤ] P))) = 2 * P.canonicalHeight := by sorry

-- coeffPairing_eq_bsd: compare the supplied full polar form to canonicalHeight.
example
    (hB : ∀ P Q : W.Point, B ((1 : ℚ) ⊗ₜ[ℤ] P) ((1 : ℚ) ⊗ₜ[ℤ] Q) =
      2 * WeierstrassCurve.Affine.neronTatePairing W P Q) (P : W.Point) :
    B ((1 : ℚ) ⊗ₜ[ℤ] P) ((1 : ℚ) ⊗ₜ[ℤ] P) = 2 * P.canonicalHeight := by sorry

-- Zero-point test uses the pinned point-group and height definitions.
example : WeierstrassCurve.Affine.neronTatePairing W (0 : W.Point) 0 = 0 := by sorry

end EllipticCompatibility

/-! ## Arithmetic signatures awaiting their supplier carriers

The following six packet API names have no declaration here:
* `IsAdmissibleOrder`, `finrank_testVectorLine`,
  `localToric_ne_zero_of_mem_testVectorLine`, `isAdmissibleOrder_eichler`:
  GZ.4/R17.3 must export actual orders, conductors and irreducible local representations.
* `bdpLFunction_interpolation`: L0/L3/L3h must attach avatars, periods and central L-values
  to the constructed measure on the same character branch.
* `quaternionicBDP_measure`: R18.2/L1 must attach the integral CM expansions and their
  actual Amice measures; having an integral power series alone does not identify its geometry.

Headline conclusions not represented by arithmetic theorem declarations:
GZ.8's general, classical, elliptic and explicit Gross–Zagier identities, variation,
Shimura/trace-point non-torsion, coefficient identity and derivative corollaries;
GZ.9's CM Waldspurger/interpolation, Abel–Jacobi/logarithm, modular/quaternionic and
p-optimal formulas, global logarithm detection, Bloch–Kato/Kummer, Fricke/isogeny,
p-new multiplicative formula, imprimitive dictionary and eigenlogarithm nonvanishing.
Their required carriers and hypotheses are stated in the packet's six gaps and 22 requests.
The invariant-form, finite-matrix, power-series and additive-map declarations above are
only their identified algebraic fragments. They do not certify these arithmetic theorems.
The named admissible-order and unramified tests likewise test fragments; the actual CM curve,
local admissible representation and geometric-measure examples require those suppliers.
-/

end TauCeti.GrossZagier
