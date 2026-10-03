import Mathlib.Algebra.Polynomial.Derivation
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Data.List.OfFn
import Mathlib.RingTheory.Nilpotent.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Pairing
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.RingTheory.Localization.BaseChange
import Mathlib.RingTheory.LocalProperties.Submodule
/-
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HodgeStructuresPartII.md. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures.
Partial continuation for DESIGN-HodgeStructuresPartII, issue #3371.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
ORDERED TENSOR-POWER CONTINUATION: all suggested declaration, API and test
bodies are admitted planning sketches under PROTOCOL section 13. Historical
actual affine proofs are retained at commit
9a36f4d1d6743c0202f12020c0df603400149faa, with their own immutable receipts.
The current exact-file check and separate conditional proof experiment are
recorded in the packet and handoff; the global sheaf omission ledger remains open.
Earlier compilation claims apply only to their recorded exact-file hashes.
Remaining admitted signatures and the omitted global sheaf ledger are not proved.
The preceding version's historical receipt applies only to SHA-256
 df692430d323e907f4a419970dbde6f4a72a6d354f5759a96a1c5a42c7c154e7.
All imports are Mathlib modules.
No project/cache setup, library build or Lean language server was started.
The affine test prefix is retained. The intrinsic local core uses actual additive
maps, tensor products and defining equations; its truncated TwoForms input is
not the general ringed-site object or a higher-degree exterior calculus.
The reserved global definition is supplied as a mathematical packet plan. Missing
sheaf monoidal/dual/pullback/filtered interfaces prevent honest native global
signatures. The exhaustive omission ledger below names every new planned item,
API and test, rather than replacing any of them by a fictitious Prop field.
-/
import Mathlib.RingTheory.Flat.Basic
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.Algebra.Category.ModuleCat.Sheaf
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Category.ModuleCat.Presheaf.Monoidal
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.Data.Matrix.Basis
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.Kronecker

import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic

import Mathlib.LinearAlgebra.TensorProduct.Associator

import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Basis.Defs

import Mathlib.RingTheory.Congruence.Hom

import Mathlib.RingTheory.Ideal.Quotient.Operations

import Mathlib.RingTheory.Ideal.Operations

import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.LinearAlgebra.TensorPower.Pairing
import Mathlib.LinearAlgebra.PiTensorProduct.Basis

noncomputable section
open scoped Matrix
/- Retained affine node-to-signature map (coordinate models only):
HodgeStructuresPartII:H.0/coordinate-frame → Frame
HodgeStructuresPartII:H.0/preconnection → Connection
HodgeStructuresPartII:H.0/operator → Connection.operator
HodgeStructuresPartII:H.0/curvature → Connection.curvature
HodgeStructuresPartII:H.0/operator-commutator → Connection.operator_commutator
HodgeStructuresPartII:H.0/flatness → Connection.IsFlat
HodgeStructuresPartII:H.0/gauge → Connection.gauge
HodgeStructuresPartII:H.0/tensor → Connection.tensor
HodgeStructuresPartII:H.0/dual → Connection.dual
HodgeStructuresPartII:H.0/invertible-rescale → Connection.rescale
HodgeStructuresPartII:H.0/zero-parameter-curvature → Connection.zero_parameter_curvature
HodgeStructuresPartII:H.0/joint-nilpotence → Connection.JointNilpotent
-/

namespace TauCeti.Hodge.ParameterConnection.Affine

universe u v w
variable (k R : Type u) [CommRing k] [CommRing R] [Algebra k R]

/-- Commuting coordinate directions and a relatively constant parameter.
This is input for a local model, not a definition of a general differential site. -/
structure Frame (d : ℕ) (lam : R) where
  delta : Fin d → Derivation k R R
  commute : ∀ i j a, delta i (delta j a) = delta j (delta i a)
  constant : ∀ i, delta i lam = 0

variable {k R} {d : ℕ} {lam : R}

def Frame.zero (d : ℕ) (lam : R) : Frame k R d lam := sorry
def Frame.polynomial (d : ℕ) (c : k) :
    Frame k (MvPolynomial (Fin d) k) d (MvPolynomial.C c) := sorry
def Frame.one (F : Frame k R d lam) : Frame k R d 1 := sorry
theorem Frame.zero_delta (d : ℕ) (lam : R) (i : Fin d) (a : R) :
    (Frame.zero (k := k) (R := R) d lam).delta i a = 0 := sorry
theorem Frame.polynomial_delta (d : ℕ) (c : k) (i : Fin d) :
    (Frame.polynomial (k := k) d c).delta i = MvPolynomial.pderiv i := sorry
theorem Frame.one_delta (F : Frame k R d lam) (i : Fin d) :
    F.one.delta i = F.delta i := sorry
-- Frame tests: zero directions, actual polynomial differentiation, reject identity.
-- test: Frame.test_zero
example (a : R) : (Frame.zero (k := k) (R := R) 1 lam).delta 0 a = 0 := sorry
-- test: Frame.test_polynomial_X
example : (Frame.polynomial (k := ℚ) 1 1).delta 0 (MvPolynomial.X 0) = 1 := sorry
-- test: Frame.test_identity_not_derivation
example : (1 : ℚ) ≠ 1 * 1 + 1 * 1 := sorry

variable (F : Frame k R d lam) (V : Type v) [Fintype V] [DecidableEq V]
/-- A coordinate lam-connection before imposing flatness, on the free module R^V. -/
structure Connection (F : Frame k R d lam) (V : Type v) where
  matrix : Fin d → Matrix V V R

variable {F V}
def Connection.zero : Connection F V := ⟨fun _ => 0⟩
theorem Connection.zero_matrix (i : Fin d) :
    (Connection.zero (F := F) (V := V)).matrix i = 0 := sorry
theorem Connection.matrix_ext (c b : Connection F V)
    (h : ∀ i, c.matrix i = b.matrix i) : c = b := sorry
theorem Connection.mk_matrix (A : Fin d → Matrix V V R) (i : Fin d) :
    (Connection.mk A : Connection F V).matrix i = A i := sorry
-- test: Connection.test_zero_matrix
example (i : Fin d) : (Connection.zero (F := F) (V := V)).matrix i = 0 := sorry
-- test: Connection.test_constructor_projection
example (A : Fin d → Matrix V V R) (i : Fin d) :
    (Connection.mk A : Connection F V).matrix i = A i := sorry
-- test: Connection.test_rank_one
example (A : Fin 1 → Matrix (Fin 1) (Fin 1) ℚ) :
    (Connection.mk A : Connection (Frame.zero (k := ℚ) (R := ℚ) 1 0) (Fin 1)).matrix 0 = A 0 := sorry

/-- D_i(s)=lam δ_i(s)+A_i s; base-linear, not generally R-linear. -/
def Connection.operator (c : Connection F V) (i : Fin d) : (V → R) →ₗ[k] (V → R) := sorry
theorem Connection.operator_apply (c : Connection F V) (i : Fin d) (s : V → R) :
    c.operator i s = (fun v => lam * F.delta i (s v)) + c.matrix i *ᵥ s := sorry
theorem Connection.operator_leibniz (c : Connection F V) (i : Fin d) (a : R) (s : V → R) :
    c.operator i (a • s) = a • c.operator i s + (lam * F.delta i a) • s := sorry
theorem Connection.operator_zero (i : Fin d) (s : V → R) :
    (Connection.zero (F := F) (V := V)).operator i s = fun v => lam * F.delta i (s v) := sorry
-- test: Connection.test_operator_zero_section
example (c : Connection F V) (i : Fin d) : c.operator i 0 = 0 := sorry
-- test: Connection.test_operator_unit
example (i : Fin d) (s : V → R) :
    (Connection.zero (F := F) (V := V)).operator i s = fun v => lam * F.delta i (s v) := sorry
-- test: Connection.test_operator_polynomial_leibniz
example (s : Fin 1 → MvPolynomial (Fin 1) ℚ) :
    (Connection.zero (F := Frame.polynomial (k := ℚ) 1 1) (V := Fin 1)).operator 0
      ((MvPolynomial.X (0 : Fin 1) : MvPolynomial (Fin 1) ℚ) • s) =
    (MvPolynomial.X (0 : Fin 1) : MvPolynomial (Fin 1) ℚ) •
      (Connection.zero (F := Frame.polynomial (k := ℚ) 1 1) (V := Fin 1)).operator 0 s + s := sorry
-- test: Connection.test_operator_parameter_two
example :
    let F := Frame.polynomial (k := ℚ) 1 2
    let c := Connection.zero (F := F) (V := Fin 1)
    c.operator 0 (fun _ => MvPolynomial.X 0) = fun _ => MvPolynomial.C 2 := sorry

/-- Matrix of the commutator: lamδ_i A_j-lamδ_j A_i+[A_i,A_j]. -/
def Connection.curvature (c : Connection F V) (i j : Fin d) : Matrix V V R :=
  lam • (c.matrix j).map (F.delta i) - lam • (c.matrix i).map (F.delta j) +
    c.matrix i * c.matrix j - c.matrix j * c.matrix i
theorem Connection.curvature_self (c : Connection F V) (i : Fin d) :
    c.curvature i i = 0 := sorry
theorem Connection.curvature_swap (c : Connection F V) (i j : Fin d) :
    c.curvature j i = -c.curvature i j := sorry
theorem Connection.curvature_zero (i j : Fin d) :
    (Connection.zero (F := F) (V := V)).curvature i j = 0 := sorry
-- test: Connection.test_curvature_self
example (c : Connection F V) (i : Fin d) : c.curvature i i = 0 := sorry
-- test: Connection.test_curvature_zero
example (i j : Fin d) : (Connection.zero (F := F) (V := V)).curvature i j = 0 := sorry
-- test: Connection.test_curvature_noncommuting
example :
    let F := Frame.zero (k := ℚ) (R := ℚ) 2 0
    let A : Fin 2 → Matrix (Fin 2) (Fin 2) ℚ := ![Matrix.single 0 1 1, Matrix.single 1 0 1]
    (Connection.mk A : Connection F (Fin 2)).curvature 0 1 =
      Matrix.diagonal ![(1 : ℚ), -1] := sorry

theorem Connection.operator_commutator (c : Connection F V) (i j : Fin d) (s : V → R) :
    c.operator i (c.operator j s) - c.operator j (c.operator i s) =
      c.curvature i j *ᵥ s := sorry

/-- Flatness is vanishing of all curvature matrices; no nilpotence is implied. -/
def Connection.IsFlat (c : Connection F V) : Prop := ∀ i j, c.curvature i j = 0
def Connection.flatZero : {c : Connection F V // c.IsFlat} := sorry
theorem Connection.isFlat_iff (c : Connection F V) :
    c.IsFlat ↔ ∀ i j s, c.operator i (c.operator j s) = c.operator j (c.operator i s) := sorry
theorem Connection.isFlat_zero : (Connection.zero (F := F) (V := V)).IsFlat := sorry
theorem Connection.isFlat_one_direction (F : Frame k R 1 lam) (c : Connection F V) :
    c.IsFlat := sorry
-- test: Connection.test_flat_zero
example : (Connection.zero (F := F) (V := V)).IsFlat := sorry
-- test: Connection.test_flat_line
example (F : Frame k R 1 lam) (c : Connection F V) : c.IsFlat := sorry
-- test: Connection.test_flat_noncommuting
example :
    let F := Frame.zero (k := ℚ) (R := ℚ) 2 0
    let A : Fin 2 → Matrix (Fin 2) (Fin 2) ℚ := ![Matrix.single 0 1 1, Matrix.single 1 0 1]
    ¬(Connection.mk A : Connection F (Fin 2)).IsFlat := sorry

/-- Components transform by s'=G s, hence A'=G A G⁻¹-lamδ(G)G⁻¹. -/
def Connection.gauge (c : Connection F V) (G : (Matrix V V R)ˣ) : Connection F V := sorry
theorem Connection.gauge_matrix (c : Connection F V) (G : (Matrix V V R)ˣ) (i : Fin d) :
    (c.gauge G).matrix i = (G : Matrix V V R) * c.matrix i * ((↑(G⁻¹)) : Matrix V V R) -
      lam • ((G : Matrix V V R).map (F.delta i) * ((↑(G⁻¹)) : Matrix V V R)) := sorry
-- node: HodgeStructuresPartII:H.0/gauge-curvature (promoted existing API)
theorem Connection.gauge_curvature (c : Connection F V) (G : (Matrix V V R)ˣ) (i j : Fin d) :
    (c.gauge G).curvature i j = (G : Matrix V V R) * c.curvature i j * ((↑(G⁻¹)) : Matrix V V R) := sorry
theorem Connection.gauge_flat (c : Connection F V) (G : (Matrix V V R)ˣ) :
    (c.gauge G).IsFlat ↔ c.IsFlat := sorry
-- test: Connection.test_gauge_identity
example (c : Connection F V) : c.gauge 1 = c := sorry
-- test: Connection.test_gauge_flat
example (c : Connection F V) (G : (Matrix V V R)ˣ) :
    (c.gauge G).IsFlat ↔ c.IsFlat := sorry
-- test: Connection.test_gauge_zero_correction
example (G : (Matrix V V R)ˣ) (i : Fin d) :
    ((Connection.zero (F := F) (V := V)).gauge G).matrix i =
      -lam • ((G : Matrix V V R).map (F.delta i) * ((↑(G⁻¹)) : Matrix V V R)) := sorry

variable {W : Type w} [Fintype W] [DecidableEq W]
/-- Same lam on both factors: Kronecker sum, not a 2lam-connection. -/
def Connection.tensor (c : Connection F V) (b : Connection F W) : Connection F (V × W) := sorry
theorem Connection.tensor_matrix (c : Connection F V) (b : Connection F W) (i : Fin d) :
    (c.tensor b).matrix i = Matrix.kronecker (c.matrix i) (1 : Matrix W W R) +
      Matrix.kronecker (1 : Matrix V V R) (b.matrix i) := sorry
theorem Connection.tensor_curvature (c : Connection F V) (b : Connection F W) (i j : Fin d) :
    (c.tensor b).curvature i j = Matrix.kronecker (c.curvature i j) (1 : Matrix W W R) +
      Matrix.kronecker (1 : Matrix V V R) (b.curvature i j) := sorry
theorem Connection.tensor_flat (c : Connection F V) (b : Connection F W)
    (hc : c.IsFlat) (hb : b.IsFlat) : (c.tensor b).IsFlat := sorry
-- test: Connection.test_tensor_zero
example : (Connection.zero (F := F) (V := V)).tensor
    (Connection.zero (F := F) (V := W)) = Connection.zero (F := F) (V := V × W) := sorry
-- test: Connection.test_tensor_flat
example (c : Connection F V) (b : Connection F W) (hc : c.IsFlat) (hb : b.IsFlat) :
    (c.tensor b).IsFlat := sorry
-- test: Connection.test_tensor_parameter
example (c : Connection F V) (b : Connection F W) (i : Fin d) (a : R) (s : V × W → R) :
    (c.tensor b).operator i (a • s) =
      a • (c.tensor b).operator i s + (lam * F.delta i a) • s := sorry

/-- Dual matrix is minus transpose, using the same parameter and directions. -/
def Connection.dual (c : Connection F V) : Connection F V := sorry
theorem Connection.dual_matrix (c : Connection F V) (i : Fin d) :
    c.dual.matrix i = -(c.matrix i).transpose := sorry
theorem Connection.dual_curvature (c : Connection F V) (i j : Fin d) :
    c.dual.curvature i j = -(c.curvature i j).transpose := sorry
theorem Connection.dual_flat (c : Connection F V) (hc : c.IsFlat) : c.dual.IsFlat := sorry
-- test: Connection.test_dual_zero
example : (Connection.zero (F := F) (V := V)).dual = Connection.zero (F := F) (V := V) := sorry
-- test: Connection.test_dual_involution
example (c : Connection F V) : c.dual.dual = c := sorry
-- test: Connection.test_dual_entry
example (c : Connection F V) (i : Fin d) (v w : V) :
    c.dual.matrix i v w = -c.matrix i w v := sorry

/-- Division by an invertible relatively constant lam also rescales A, not just its type. -/
def Connection.rescale {u : Rˣ} {F : Frame k R d (u : R)} (c : Connection F V) :
    Connection F.one V := sorry
theorem Connection.rescale_matrix {u : Rˣ} {F : Frame k R d (u : R)}
    (c : Connection F V) (i : Fin d) :
    c.rescale.matrix i = (↑u⁻¹ : R) • c.matrix i := sorry
theorem Connection.rescale_operator {u : Rˣ} {F : Frame k R d (u : R)}
    (c : Connection F V) (i : Fin d) (s : V → R) :
    c.rescale.operator i s = (↑u⁻¹ : R) • c.operator i s := sorry
theorem Connection.rescale_curvature {u : Rˣ} {F : Frame k R d (u : R)}
    (c : Connection F V) (i j : Fin d) :
    c.rescale.curvature i j = ((↑u⁻¹ : R) * ↑u⁻¹) • c.curvature i j := sorry
-- test: Connection.test_rescale_flat
example {u : Rˣ} {F : Frame k R d (u : R)} (c : Connection F V) (hc : c.IsFlat) :
    c.rescale.IsFlat := sorry
-- test: Connection.test_rescale_zero
example {u : Rˣ} {F : Frame k R d (u : R)} (i : Fin d) :
    (Connection.zero (F := F) (V := V)).rescale.matrix i = 0 := sorry
-- test: Connection.test_rescale_leibniz
example {u : Rˣ} {F : Frame k R d (u : R)} (c : Connection F V)
    (i : Fin d) (a : R) (s : V → R) :
    c.rescale.operator i (a • s) = a • c.rescale.operator i s + F.delta i a • s := sorry

theorem Connection.zero_parameter_curvature {F : Frame k R d 0} (c : Connection F V) (i j : Fin d) :
    c.curvature i j = c.matrix i * c.matrix j - c.matrix j * c.matrix i := sorry

/-- Joint word nilpotence, not vanishing of exterior curvature. Bound is positive. -/
def Connection.JointNilpotent {F : Frame k R d 0} (c : Connection F V) (N : ℕ) : Prop :=
  0 < N ∧ ∀ word : Fin N → Fin d, ((List.ofFn word).map c.matrix).prod = 0
theorem Connection.jointNilpotent_zero {F : Frame k R d 0} :
    (Connection.zero (F := F) (V := V)).JointNilpotent 1 := sorry
theorem Connection.jointNilpotent_dual {F : Frame k R d 0} (c : Connection F V) (N : ℕ)
    (h : c.JointNilpotent N) : c.dual.JointNilpotent N := sorry
theorem Connection.jointNilpotent_one_iff {F : Frame k R d 0} (c : Connection F V) :
    c.JointNilpotent 1 ↔ ∀ i, c.matrix i = 0 := sorry
-- test: Connection.test_nilpotent_nonzero
example :
    let F := Frame.zero (k := ℚ) (R := ℚ) 1 0
    let c : Connection F (Fin 2) := ⟨fun _ => Matrix.single 0 1 1⟩
    c.JointNilpotent 2 ∧ c.matrix 0 ≠ 0 := sorry
-- test: Connection.test_integrable_not_nilpotent
example :
    let F := Frame.zero (k := ℚ) (R := ℚ) 1 0
    let c : Connection F (Fin 1) := ⟨fun _ => 1⟩
    c.IsFlat ∧ ∀ N, ¬c.JointNilpotent N := sorry
-- test: Connection.test_nonreduced_rank_one
example (ε : R) (hε : ε * ε = 0) (hne : ε ≠ 0) :
    let F := Frame.zero (k := k) (R := R) 1 0
    let c : Connection F (Fin 1) := ⟨fun _ => Matrix.diagonal (fun _ => ε)⟩
    c.JointNilpotent 2 ∧ c.matrix 0 ≠ 0 := sorry

/-! Coordinate determinant adapter only; global exterior-power/descent remains a gap. -/
-- node: HodgeStructuresPartII:H.0/determinant-coordinate
def Connection.determinant (c : Connection F V) : Connection F (Fin 1) := sorry

-- node: HodgeStructuresPartII:H.0/determinant-matrix
theorem Connection.determinant_matrix (c : Connection F V) (i : Fin d) :
    c.determinant.matrix i 0 0 = Matrix.trace (c.matrix i) := sorry

theorem Connection.determinant_operator (c : Connection F V) (i : Fin d) (s : Fin 1 → R) :
    c.determinant.operator i s 0 =
      lam * F.delta i (s 0) + Matrix.trace (c.matrix i) * s 0 := sorry

-- node: HodgeStructuresPartII:H.0/determinant-curvature
theorem Connection.determinant_curvature (c : Connection F V) (i j : Fin d) :
    c.determinant.curvature i j 0 0 = Matrix.trace (c.curvature i j) := sorry

-- node: HodgeStructuresPartII:H.0/determinant-flat
theorem Connection.determinant_flat (c : Connection F V) (hc : c.IsFlat) :
    c.determinant.IsFlat := sorry

-- node: HodgeStructuresPartII:H.0/determinant-dual
theorem Connection.determinant_dual (c : Connection F V) :
    c.dual.determinant = c.determinant.dual := sorry

-- node: HodgeStructuresPartII:H.0/determinant-tensor
theorem Connection.determinant_tensor_matrix (c : Connection F V) (b : Connection F W)
    (i : Fin d) :
    (c.tensor b).determinant.matrix i 0 0 =
      (Fintype.card W : R) * Matrix.trace (c.matrix i) +
      (Fintype.card V : R) * Matrix.trace (b.matrix i) := sorry

-- node: HodgeStructuresPartII:H.0/determinant-gauge-curvature
theorem Connection.determinant_gauge_curvature (c : Connection F V)
    (G : (Matrix V V R)ˣ) (i j : Fin d) :
    (c.gauge G).determinant.curvature i j 0 0 = c.determinant.curvature i j 0 0 := sorry

-- test: Connection.test_determinant_rank_zero
example (c : Connection F (Fin 0)) :
    c.determinant = Connection.zero (F := F) (V := Fin 1) := sorry

-- test: Connection.test_determinant_rank_one
example (c : Connection F (Fin 1)) : c.determinant = c := sorry

-- test: Connection.test_determinant_scalar_rank_two
example (a : Fin d → R) (i : Fin d) :
    (Connection.mk (fun j => a j • (1 : Matrix (Fin 2) (Fin 2) R)) :
      Connection F (Fin 2)).determinant.matrix i 0 0 = 2 * a i := sorry

-- test: Connection.test_determinant_flat_no_converse
example :
    let F := Frame.zero (k := ℚ) (R := ℚ) 2 0
    let A : Fin 2 → Matrix (Fin 2) (Fin 2) ℚ := ![Matrix.single 0 1 1, Matrix.single 1 0 1]
    let c : Connection F (Fin 2) := Connection.mk A
    c.determinant.IsFlat ∧ ¬c.IsFlat := sorry


/- Determinant derivative and local frame bridge: five unchecked declaration plans.
Native signatures elaborate against the existing pinned build with sorry bodies.
Only native matrices/units are used. Global wedge/sheaf descent remains omitted.
-/
-- node: HodgeStructuresPartII:H.0/determinant-derivation-rows
theorem det_derivation_rows (δ : Derivation k R R) (S : Matrix V V R) :
    δ S.det = ∑ r, (S.updateRow r (fun j => δ (S r j))).det := sorry

-- node: HodgeStructuresPartII:H.0/determinant-row-action
theorem sum_det_updateRow_left_mul (A S : Matrix V V R) :
    (∑ r, (S.updateRow r ((A * S) r)).det) = Matrix.trace A * S.det := sorry

-- Generic Jacobi input: import the existing plan
-- ColemanPowerSeries:L1/derivation-determinant-unit; no duplicate declaration.
-- node: HodgeStructuresPartII:H.0/determinant-gauge-matrix
theorem Connection.determinant_gauge_matrix (c : Connection F V)
    (G : (Matrix V V R)ˣ) (i : Fin d) :
    (c.gauge G).determinant.matrix i 0 0 = Matrix.trace (c.matrix i) -
      lam * (G⁻¹).val.det * F.delta i (G.val.det) := sorry

-- node: HodgeStructuresPartII:H.0/determinant-gauge
-- Native Units.map, detMonoidHom and scalar; no fresh line carrier or choice.
theorem Connection.determinant_gauge (c : Connection F V) (G : (Matrix V V R)ˣ) :
    (c.gauge G).determinant = c.determinant.gauge
      (Units.map (Matrix.scalar (Fin 1)).toMonoidHom
        (Units.map (Matrix.detMonoidHom : Matrix V V R →* R) G)) := sorry

-- node: HodgeStructuresPartII:H.0/determinant-alternating-operator
-- The r-th section is a column vector stored as row r of S. Its action family
-- is S * (c.matrix i)ᵀ, not (c.matrix i) * S; see the reader's transpose proof.
theorem Connection.determinant_alternating_operator (c : Connection F V)
    (i : Fin d) (S : Matrix V V R) :
    (∑ r, (S.updateRow r (c.operator i (S r))).det) =
      c.determinant.operator i (fun _ => S.det) 0 := sorry

end TauCeti.Hodge.ParameterConnection.Affine

namespace TauCeti.Hodge.ParameterConnection.Intrinsic

universe u v w z
open scoped TensorProduct
variable (k R : Type u) [CommRing k] [CommRing R] [Algebra k R]
variable (W : Type w) (Z : Type z) [AddCommGroup W] [AddCommGroup Z]
  [Module R W] [Module R Z] [Module k W] [IsScalarTower k R W]

/-- Input degree-zero/one/two exterior calculus, with actual defining equations.
It is not a construction of universal forms or a substitute for a ringed site. -/
structure TwoForms where
  d0 : Derivation k R W
  d1 : W →+ Z
  wedge : W →ₗ[R] W →ₗ[R] Z
  wedge_self : ∀ ω, wedge ω ω = 0
  d1_leibniz : ∀ a ω, d1 (a • ω) = wedge (d0 a) ω + a • d1 ω
  d1_d0 : ∀ a, d1 (d0 a) = 0

variable {k R W Z}
variable (Ω : TwoForms k R W Z) (lam : R)
variable (E : Type v) [AddCommGroup E] [Module R E]

/-- Ring-level preconnection, additive rather than incorrectly R-linear. -/
structure Preconnection where
  toAddHom : E →+ (E ⊗[R] W)
  leibniz : ∀ a e, toAddHom (a • e) = a • toAddHom e + lam • (e ⊗ₜ[R] Ω.d0 a)

variable {lam E}

-- Auxiliary tensor map from the existing bilinear wedge; no new forms carrier.
def TwoForms.wedgeRight (Ω : TwoForms k R W Z) (ω : W) :
    (E ⊗[R] W) →ₗ[R] (E ⊗[R] Z) := sorry

theorem TwoForms.wedgeRight_tmul (ω α : W) (e : E) :
    Ω.wedgeRight (E := E) ω (e ⊗ₜ[R] α) = e ⊗ₜ[R] Ω.wedge α ω := sorry

variable {Ω}

def Preconnection.extensionPair (D : Preconnection Ω lam E) :
    E →+ W →+ (E ⊗[R] Z) := sorry

theorem Preconnection.extensionPair_apply (D : Preconnection Ω lam E) (e : E) (ω : W) :
    D.extensionPair e ω = Ω.wedgeRight (E := E) ω (D.toAddHom e) +
      lam • (e ⊗ₜ[R] Ω.d1 ω) := sorry

-- node: HodgeStructuresPartII:H.0/extension-balancing
theorem Preconnection.extension_balanced (D : Preconnection Ω lam E) (a : R) (e : E) (ω : W) :
    D.extensionPair (a • e) ω = D.extensionPair e (a • ω) := sorry

-- Native use of the baseline's balanced additive lift, not LinearMap tensor lift.
def Preconnection.extend (D : Preconnection Ω lam E) : (E ⊗[R] W) →+ (E ⊗[R] Z) :=
  TensorProduct.liftAddHom D.extensionPair D.extension_balanced

theorem Preconnection.extend_tmul (D : Preconnection Ω lam E) (e : E) (ω : W) :
    D.extend (e ⊗ₜ[R] ω) = Ω.wedgeRight (E := E) ω (D.toAddHom e) +
      lam • (e ⊗ₜ[R] Ω.d1 ω) := sorry

-- node: HodgeStructuresPartII:H.0/intrinsic-curvature
def Preconnection.curvature (D : Preconnection Ω lam E) : E →+ (E ⊗[R] Z) :=
  D.extend.comp D.toAddHom

def Preconnection.IsIntegrable (D : Preconnection Ω lam E) : Prop := D.curvature = 0

theorem Preconnection.curvature_apply (D : Preconnection Ω lam E) (e : E) :
    D.curvature e = D.extend (D.toAddHom e) := sorry

theorem Preconnection.integrable_iff (D : Preconnection Ω lam E) :
    D.IsIntegrable ↔ ∀ e, D.curvature e = 0 := sorry

-- node: HodgeStructuresPartII:H.0/curvature-linearity
theorem Preconnection.curvature_linear (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0) (a : R) (e : E) :
    D.curvature (a • e) = a • D.curvature e := sorry

-- Local definition under a fixed E; global finite local freeness is in the packet.
-- node: HodgeStructuresPartII:key/higgs-parameter-connections (local core only)
structure FlatPreconnection where
  preconnection : Preconnection Ω lam E
  integrable : preconnection.IsIntegrable

-- Native degree-zero Higgs specialization.
def Preconnection.ofLinear (θ : E →ₗ[R] (E ⊗[R] W)) : Preconnection Ω 0 E := sorry

theorem Preconnection.ofLinear_apply (θ : E →ₗ[R] (E ⊗[R] W)) (e : E) :
    (Preconnection.ofLinear (Ω := Ω) θ).toAddHom e = θ e := sorry

def Preconnection.toLinear (D : Preconnection Ω 0 E) : E →ₗ[R] (E ⊗[R] W) := sorry

theorem Preconnection.toLinear_apply (D : Preconnection Ω 0 E) (e : E) :
    D.toLinear e = D.toAddHom e := sorry

def Preconnection.zeroHiggs : Preconnection Ω 0 E := sorry

theorem Preconnection.zeroHiggs_apply (e : E) :
    (Preconnection.zeroHiggs (Ω := Ω) (E := E)).toAddHom e = 0 := sorry

-- Ring-level unit connection; its parameter is explicit and relatively constant.
def Preconnection.unit (Ω : TwoForms k R W Z) (lam : R) : Preconnection Ω lam R := sorry

theorem Preconnection.unit_apply (a : R) :
    (Preconnection.unit Ω lam).toAddHom a = lam • ((1 : R) ⊗ₜ[R] Ω.d0 a) := sorry

theorem Preconnection.unit_flat (hlam : Ω.d0 lam = 0) :
    (Preconnection.unit Ω lam).IsIntegrable := sorry

-- Inverting the parameter changes the section map as well as its type.
def Preconnection.rescale {u : Rˣ} (D : Preconnection Ω (u : R) E) :
    Preconnection Ω 1 E := sorry

theorem Preconnection.rescale_apply {u : Rˣ} (D : Preconnection Ω (u : R) E) (e : E) :
    D.rescale.toAddHom e = (↑u⁻¹ : R) • D.toAddHom e := sorry

theorem Preconnection.rescale_curvature {u : Rˣ}
    (D : Preconnection Ω (u : R) E) (hlam : Ω.d0 (u : R) = 0) (e : E) :
    D.rescale.curvature e = ((↑u⁻¹ : R) * ↑u⁻¹) • D.curvature e := sorry

-- Typed local tests exercise actual tensors and operators, without geometric stand-ins.
-- local test: Intrinsic.test_leibniz
example (D : Preconnection Ω lam E) (a : R) (e : E) :
    D.toAddHom (a • e) = a • D.toAddHom e + lam • (e ⊗ₜ[R] Ω.d0 a) := sorry
-- local test: Intrinsic.test_additive_zero
example (D : Preconnection Ω lam E) : D.toAddHom 0 = 0 := sorry
-- local test: Intrinsic.test_higgs_linear
example (D : Preconnection Ω 0 E) (a : R) (e : E) :
    D.toAddHom (a • e) = a • D.toAddHom e := sorry
-- local test: Intrinsic.test_linear_roundtrip
example (θ : E →ₗ[R] (E ⊗[R] W)) :
    (Preconnection.ofLinear (Ω := Ω) θ).toLinear = θ := sorry
-- local test: Intrinsic.test_extend_balanced
example (D : Preconnection Ω lam E) (a : R) (e : E) (ω : W) :
    D.extend ((a • e) ⊗ₜ[R] ω) = D.extend (e ⊗ₜ[R] (a • ω)) := sorry
-- local test: Intrinsic.test_extend_zero
example (x : E ⊗[R] W) :
    (Preconnection.zeroHiggs (Ω := Ω) (E := E)).extend x = 0 := sorry
-- local test: Intrinsic.test_curvature_scalar
example (D : Preconnection Ω lam E) (hlam : Ω.d0 lam = 0) (a : R) (e : E) :
    D.curvature (a • e) = a • D.curvature e := sorry
-- local test: Intrinsic.test_zero_flat
example : (Preconnection.zeroHiggs (Ω := Ω) (E := E)).IsIntegrable := sorry
-- local test: Intrinsic.test_unit_flat
example (hlam : Ω.d0 lam = 0) : (Preconnection.unit Ω lam).IsIntegrable := sorry
-- local test: Intrinsic.test_unit_zero_parameter
example (a : R) : (Preconnection.unit Ω 0).toAddHom a = 0 := sorry
-- local test: Intrinsic.test_unit_nonzero
example (a : R) (hne : (1 : R) ⊗ₜ[R] Ω.d0 a ≠ 0) :
    (Preconnection.unit Ω 1).toAddHom a ≠ 0 := sorry
-- local test: Intrinsic.test_rescale_flat
example {u : Rˣ} (D : Preconnection Ω (u : R) E)
    (hlam : Ω.d0 (u : R) = 0) (hD : D.IsIntegrable) : D.rescale.IsIntegrable := sorry
-- local test: Intrinsic.test_rescale_rule
example {u : Rˣ} (D : Preconnection Ω (u : R) E) (a : R) (e : E) :
    D.rescale.toAddHom (a • e) = a • D.rescale.toAddHom e + e ⊗ₜ[R] Ω.d0 a := sorry

end TauCeti.Hodge.ParameterConnection.Intrinsic

/-
GLOBAL SIGNATURE OMISSION LEDGER — all 35 added nodes.
The native local core above covers only degree-zero/one/two additive-balanced
operator tests. Global sheaf signatures are omitted until the exact CR.1/E1/DD.1
requests resolve. Missing tensor/dual/coherence, higher forms, subquotients and
filtered-coefficient carriers are real omissions, not assumed axioms.
Each name below is the packet name; the statement is its intended signature.
Unit tests below remain mathematical acceptance tests and are not Lean examples
for invented stand-in carriers. Their absence prevents any completeness claim.

node: HodgeStructuresPartII:H.0/intrinsic-preconnection
signature omitted: Preconnection
A Preconnection(E,λ) is an additive map of sheaves D:E→E⊗_OΩ¹ satisfying D(ae)=aD(e)+λ(e⊗da) on every object after local restriction. It is not O-linear unless its Leibniz correction vanishes. Integrability is a separate predicate; neither a lattice nor trace-zero nor nilpotence is part of this carrier.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1, CrystallineCohomology:CR.1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: Preconnection.mk — An additive sheaf map and its λ-Leibniz proof give a preconnection.
API signature omitted: Preconnection.leibniz — D(ae)=aD(e)+λ(e⊗da).
API signature omitted: Preconnection.ext — Equal section maps on all site objects imply equality.
API signature omitted: Preconnection.base_linear — D(be)=bD(e) whenever db=0.
test omitted: Preconnection.test_affine_line — On A¹_k, λd on O sends x to λdx.
test omitted: Preconnection.test_zero_parameter — At λ=0 the correction is zero and D is O-linear.
test omitted: Preconnection.test_not_O_linear — Over Q[x], d(x·1)=dx while x d(1)=0, so the unit ordinary connection is not O-linear.

node: HodgeStructuresPartII:H.0/extension-balancing
signature omitted: Preconnection.extension_balanced
For n≥0, B_n(e,ω)=D(e)∧ω+λe⊗dω is biadditive and O-balanced: B_n(ae,ω)=B_n(e,aω). In degree zero use E⊗O≅E. No O-linearity of B_n in an individual argument is assumed.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/exterior-extension
signature omitted: Preconnection.extend
Construct additive sheaf maps D_n:E⊗Ωⁿ→E⊗Ωⁿ⁺¹ by D_n(e⊗ω)=D(e)∧ω+λe⊗dω. D_0 is D via E⊗O≅E; uniqueness follows from local elementary tensors. For u of degree n, D(u∧ω)=D(u)∧ω+(−1)^n λu∧dω.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: Preconnection.extend_tmul — D_n(e⊗ω)=D(e)∧ω+λe⊗dω.
API signature omitted: Preconnection.extend_zero — D_0 identifies with D.
API signature omitted: Preconnection.extend_unique — The elementary tensor formula uniquely specifies the additive extension.
API signature omitted: Preconnection.extend_wedge — The right graded Leibniz rule has sign (−1)^n on λu∧dω.
test omitted: Preconnection.test_extend_line — For D=d on Q[x,y], D_1(1⊗xdy)=1⊗dx∧dy.
test omitted: Preconnection.test_extend_zero — A zero-parameter zero field extends by zero in every degree.
test omitted: Preconnection.test_extend_sign — For unit λd on Q[x,y,z], D(dx∧y dz)=−λdx∧dy∧dz. The opposite odd-degree sign gives a wrong nonzero answer.
test omitted: Preconnection.test_extend_balancing — D_n(ae⊗ω)=D_n(e⊗aω); using an R-linear tensor lift separately on D would fail when λda≠0.

node: HodgeStructuresPartII:H.0/intrinsic-curvature
signature omitted: Preconnection.curvature
Curvature is the additive sheaf map κ_D=D_1∘D:E→E⊗Ω². IsIntegrable(D) means κ_D=0. D² here means this extended composite, not an ill-typed composition of E→E⊗Ω¹ with itself.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: ; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: Preconnection.curvature_apply — κ_D(e)=D_1(D(e)).
API signature omitted: Preconnection.integrable_iff — Integrability iff κ_D(e)=0 on all local sections.
API signature omitted: Preconnection.curvature_restrict — Restriction commutes with κ_D.
test omitted: Preconnection.test_curvature_unit — On O, D=λd has κ=λ²d²=0 when dλ=0.
test omitted: Preconnection.test_curvature_zero — The zero Higgs field has zero curvature.
test omitted: Preconnection.test_curvature_A2 — On A²_Q, θ=E12dx+E21dy has κ=diag(1,−1)dx∧dy≠0.

node: HodgeStructuresPartII:H.0/curvature-linearity
signature omitted: Preconnection.curvature_linear
For relatively constant λ, κ_D(ae)=aκ_D(e). If dλ is not assumed zero the extra term is e⊗λdλ∧da. Thus κ_D is canonically an O-linear sheaf morphism under the standing hypotheses.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: ; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/flat-extension-square
signature omitted: Preconnection.extend_sq
For dλ=0, D_{n+1}D_n(e⊗ω)=κ_D(e)∧ω for every n. Hence κ_D=0 iff all adjacent extended differentials compose to zero.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: ; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:key/higgs-parameter-connections
signature omitted: LambdaBundle
LambdaBundle(Ω,λ) consists of a finite locally free O-module sheaf E and a Preconnection(E,λ) with κ_D=0. The parameter is a central relatively constant global section. This is the reserved general ringed-site definition: at λ=0 it gives integrable Higgs bundles and at λ=1 the imported ordinary connection carrier. Tensor, dual, pullback, coefficient twists and Griffiths grading are provided by the declaration nodes below; they are not axioms stored as arbitrary properties of an object.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1, CrystallineCohomology:CR.1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.mk — Bundle E,D, finite local freeness, and the actual curvature-zero equality.
API signature omitted: LambdaBundle.connection — Recover D with its λ-Leibniz rule.
API signature omitted: LambdaBundle.integrable — The defined exterior curvature is zero.
API signature omitted: LambdaBundle.ext — For the same underlying E, equal additive D gives equal bundle structures.
API signature omitted: LambdaBundle.restrict — Restriction to a slice/open subsite retains the same parameter and integrability.
test omitted: LambdaBundle.test_affine_unit — On A¹_k, (O,d) is a nonzero rank-one flat connection; at λ=0 θ=dx gives an integrable rank-one Higgs object.
test omitted: LambdaBundle.test_parameter_unit — D=λd for constant λ is flat, with λ=1 giving d and λ=0 giving the zero Higgs field.
test omitted: LambdaBundle.test_noncommuting — On A²_Q, E12dx+E21dy does not define a LambdaBundle at λ=0.
test omitted: LambdaBundle.test_zero_module — The zero sheaf with its unique operator is admitted, with local rank zero.

node: HodgeStructuresPartII:H.0/connection-morphism
signature omitted: LambdaBundle.Hom
A morphism between LambdaBundles with the same Ω,λ is an O-linear sheaf map f:E→F satisfying D_F f=(f⊗id)D_E. Identity and composition obey the equality; no determinant or polarization preservation is required.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.Hom.id — Identity is horizontal.
API signature omitted: LambdaBundle.Hom.comp — Horizontal morphisms compose.
API signature omitted: LambdaBundle.Hom.add — Sum of two horizontal O-linear morphisms is horizontal.
API signature omitted: LambdaBundle.Hom.ext — Equality of the underlying O-linear sheaf maps gives equality of morphisms.
test omitted: LambdaBundle.Hom.test_identity — Identity on the affine unit is horizontal.
test omitted: LambdaBundle.Hom.test_zero — The zero O-linear map is horizontal.
test omitted: LambdaBundle.Hom.test_nonconstant — Multiplication by x on (O,d) over Q[x] is not horizontal: d(x)≠0.

node: HodgeStructuresPartII:H.0/unit-connection
signature omitted: LambdaBundle.unit
On O construct D(a)=λda, using O⊗Ω¹≅Ω¹. It is integrable for dλ=0 and is the tensor unit of the fixed-parameter category.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.unit_apply — The unit operator on a is λda.
API signature omitted: LambdaBundle.unit_flat — Its defined curvature is zero.
API signature omitted: LambdaBundle.unit_zero_parameter — The zero fiber is the zero Higgs field.
test omitted: LambdaBundle.unit.test_x — On Q[x], with λ=2, D(x)=2dx.
test omitted: LambdaBundle.unit.test_zero — For λ=0 all sections have zero operator.
test omitted: LambdaBundle.unit.test_not_zero — At λ=1 the unit operator is not zero because D(x)=dx≠0.

node: HodgeStructuresPartII:H.0/zero-fiber
signature omitted: LambdaBundle.zeroEquivHiggs
At λ=0, preconnections are exactly O-linear fields θ:E→E⊗Ω¹, and κ_D=(id⊗wedge)(θ⊗id)θ. Thus LambdaBundle(Ω,0) is equivalent to the integrable Higgs category, including its horizontal morphisms, without any nilpotence or trace-zero condition.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: ; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/ordinary-fiber
signature omitted: LambdaBundle.oneEquivConnection
The λ=1 category identifies with CR.1 ordinary integrable relative connections on the same ringed differential site, by preserving E,D,restriction and the exterior curvature convention. This does not identify it with crystals; their quasi-nilpotence and lift hypotheses remain separate.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: CrystallineCohomology:CR.1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/tensor-balancing
signature omitted: LambdaBundle.tensor_balanced
For two λ-preconnections on E,F, B(e,f)=D_E(e)⊗f+e⊗D_F(f), with forms moved to the last factor, satisfies B(ae,f)=B(e,af). Its scalar rule is B(ae,f)=aB(e,f)+λ(e⊗f)⊗da. A differing pair of parameters need not descend.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/intrinsic-tensor
signature omitted: LambdaBundle.tensor
Construct the connection D_{E⊗F}(e⊗f)=D_E(e)⊗f+e⊗D_F(f) on the sheaf tensor for the same λ. It satisfies the λ-Leibniz rule with one coefficient λ. Tensor associators, symmetry and unitors are horizontal.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.tensor_tmul — D(e⊗f)=D_E(e)⊗f+e⊗D_F(f).
API signature omitted: LambdaBundle.tensor_leibniz — D(a(e⊗f))=aD(e⊗f)+λ(e⊗f)⊗da.
API signature omitted: LambdaBundle.tensor_assoc — The native sheaf-tensor associator is horizontal.
API signature omitted: LambdaBundle.tensor_comm — The native symmetry is horizontal.
API signature omitted: LambdaBundle.tensor_unit — Tensoring with unit(λ) is horizontally isomorphic to the input.
test omitted: LambdaBundle.tensor.test_unit — unit(λ)⊗unit(λ) identifies with unit(λ).
test omitted: LambdaBundle.tensor.test_zero — Tensor with the zero module is zero.
test omitted: LambdaBundle.tensor.test_one_lambda — Over Q[x], tensoring two λ=2 unit lines sends x under the unit identification to 2dx, not 4dx.

node: HodgeStructuresPartII:H.0/tensor-curvature
signature omitted: Preconnection.tensor_curvature
For the balanced tensor preconnection, κ_{E⊗F}(e⊗f)=κ_E(e)⊗f+e⊗κ_F(f), with Ω² moved to the last factor. In particular flat inputs yield flat output; no converse is claimed.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/intrinsic-dual
signature omitted: LambdaBundle.dual
On E∨=Hom_O(E,O), define D∨φ by (D∨φ)(e)=λd(φ(e))−(φ⊗id)D(e). Finite local freeness identifies E∨⊗Ω¹ with Hom(E,Ω¹). Evaluation is horizontal; the construction has the same λ and is intrinsic.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.dual_eval — (D∨φ)(e)=λd(φ(e))−φ(D(e)).
API signature omitted: LambdaBundle.eval_horizontal — Evaluation E∨⊗E→unit(λ) is horizontal.
API signature omitted: LambdaBundle.biddual — The canonical E→E∨∨ is horizontal and an isomorphism.
test omitted: LambdaBundle.dual.test_unit — The dual of unit(λ) is unit(λ).
test omitted: LambdaBundle.dual.test_zero — The dual zero module is zero.
test omitted: LambdaBundle.dual.test_sign — For θ=a dx on a Higgs line its dual is −a dx; using +a violates the evaluation equation.

node: HodgeStructuresPartII:H.0/dual-curvature
signature omitted: Preconnection.dual_curvature
The dual preconnection defined by the evaluation formula satisfies (κ_{E∨}φ)(e)=−φ(κ_E(e)). Hence flatness is preserved and reflected through finite locally free biduality.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/intrinsic-pullback
signature omitted: LambdaBundle.pullback
For a morphism of ringed differential sites f:Y→X with a morphism of exterior calculi f*Ω_X→Ω_Y commuting with wedge and d, set λ_Y=f#λ and construct D_Y(b⊗e)=λ_Y e⊗d_Yb+b·df(D_Xe) on f*E. It is integrable, functorial in f, and compatible with tensor and dual. No flatness of f is required for finite locally free E.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.pullback_apply — D_Y(b⊗e)=λ_Y e⊗d_Yb+b df(D_Xe).
API signature omitted: LambdaBundle.pullback_id — Identity pullback gives the original object.
API signature omitted: LambdaBundle.pullback_comp — Composed pullbacks agree via the canonical sheaf-pullback isomorphism.
API signature omitted: LambdaBundle.pullback_tensor — Pullback commutes horizontally with same-parameter tensor.
test omitted: LambdaBundle.pullback.test_identity — Pullback along id leaves (O,d) unchanged.
test omitted: LambdaBundle.pullback.test_constant — Along x↦0, the Higgs line dx pulls back to zero.
test omitted: LambdaBundle.pullback.test_ramified — Along x=y² over Q, a Higgs field dx pulls back to 2y dy; replacing df by an identity would fail.

node: HodgeStructuresPartII:H.0/local-descent
signature omitted: LambdaBundle.descent
For a site covering family, finite locally free E_i, horizontal isomorphisms g_ij and their actual cocycle, the imported module-sheaf descent produces E. The D_i glue uniquely to a λ-preconnection on E, and it is integrable iff all its local curvatures vanish. The equations are on the common restricted parameter and differential calculus.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/coordinate-comparison
signature omitted: LambdaBundle.affineCoordinateEquiv
On a chart where Ω¹ has the genuine basis dx_i with commuting dual derivations δ_i, Ω² has its exterior basis, and E≅O^V, write D=λd+A. Its curvature coefficients are λδ_iA_j−λδ_jA_i+[A_i,A_j]. The same-parameter tensor, dual and s′=Gs gauge formulas agree with the twelve retained affine nodes. An arbitrary zero-direction Frame is not enough for this equivalence.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/intrinsic-rescale
signature omitted: LambdaBundle.rescale
If λ is an invertible relatively constant section, rescale by λ⁻¹D to obtain an ordinary integrable connection. Its curvature is λ⁻²κ_D. This gives an equivalence of fixed-λ and ordinary connection categories with inverse ∇↦λ∇, including tensor, dual and horizontal morphisms.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: ; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: LambdaBundle.rescale_apply — The new operator is λ⁻¹D.
API signature omitted: LambdaBundle.rescale_curvature — κ_rescale=λ⁻²κ_D.
API signature omitted: LambdaBundle.rescale_equiv — Scaling by λ and λ⁻¹ are inverse functors.
test omitted: LambdaBundle.rescale.test_two — On Q[x], 2d rescales to d.
test omitted: LambdaBundle.rescale.test_one — λ=1 leaves the operator unchanged.
test omitted: LambdaBundle.rescale.test_t — For relative forms over k[t], t has dt=0; after localizing at t, t∇ rescales to ∇. Absolute forms with dt≠0 do not satisfy the input convention.

node: HodgeStructuresPartII:H.0/twisted-higgs
signature omitted: TwistedHiggsBundle
For an invertible coefficient sheaf T, put Q=Ω¹⊗T. A TwistedHiggsBundle is finite locally free E with O-linear θ:E→E⊗Q whose exterior composite in E⊗Ω²⊗T² vanishes. The twist is in the coefficient of the field, not absorbed into E. No connection on T or differential on T is required for this zero-parameter definition.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: TwistedHiggsBundle.zero — Every finite locally free E has the zero Q-valued field.
API signature omitted: TwistedHiggsBundle.coefficient — The coefficient is Ω¹⊗T and its curvature coefficient is Ω²⊗T².
API signature omitted: TwistedHiggsBundle.trivialTwistEquiv — T=O gives the ordinary integrable Higgs category via its tensor unitors.
API signature omitted: TwistedHiggsBundle.changeTwist — An isomorphism T≅T′ transports fields and curvature.
API signature omitted: TwistedHiggsBundle.tensor — Same-twist fields tensor by θ_E⊗1+1⊗θ_F, with one Q coefficient.
API signature omitted: TwistedHiggsBundle.dual — The dual field is characterized by zero-field evaluation and equals minus transpose locally.
test omitted: TwistedHiggsBundle.test_trivial — T=O, θ=E12dx on O² is the usual nonzero square-zero Higgs field.
test omitted: TwistedHiggsBundle.test_zero — θ=0 is integrable for every invertible T.
test omitted: TwistedHiggsBundle.test_Tate — For the rigid p-adic instance, Ω¹(−1) and its Galois action must appear in θ; an untwisted target has the wrong character.
test omitted: TwistedHiggsBundle.test_tensor_twist — Tensor of two T-valued Higgs objects remains T-valued; T² occurs in curvature, not in the degree-one tensor field.

node: HodgeStructuresPartII:H.0/higgs-commuting
signature omitted: TwistedHiggsBundle.coordinate_integrability
If Q is locally free with finite basis q_i, write θ=ΣA_i⊗q_i. Then θ∧θ=0 iff [A_i,A_j]=0 for all i,j, in arbitrary characteristic. This uses the exterior basis q_i∧q_j for i<j, not division by 2. An arbitrary collection of directions without a basis cannot give the converse.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor. Ω¹ has finite locally free local charts; T is invertible.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/symmetric-action
signature omitted: TwistedHiggsBundle.symmetricAction
For Q finite locally free, construct the O-algebra map Sym_O(Q∨)→End_O(E) sending v to the contraction (id⊗v)θ. Integrability is equivalent to existence of this extension with the stated degree-one restriction. End(E) can be noncommutative; the images of Q∨ must commute.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: TwistedHiggsBundle.symmetricAction_generator — The image of v∈Q∨ is contraction of θ by v.
API signature omitted: TwistedHiggsBundle.symmetricAction_unique — The degree-one contractions uniquely determine the algebra map.
API signature omitted: TwistedHiggsBundle.symmetricAction_iff — The given contractions extend iff θ is integrable under Q finite local freeness.
test omitted: TwistedHiggsBundle.symmetricAction.test_scalar — On A¹_Q, θ=dx gives the action Q[x][u]→End(O) with u↦1.
test omitted: TwistedHiggsBundle.symmetricAction.test_zero — Zero field factors through the augmentation Sym(Q∨)→O.
test omitted: TwistedHiggsBundle.symmetricAction.test_noncommuting — u↦E12 and v↦E21 cannot define a map from Q[u,v] to Mat₂(Q).

node: HodgeStructuresPartII:H.0/ordered-iterate
signature omitted: TwistedHiggsBundle.iterate
Define θ^[0]=id_E and θ^[n+1]=(θ⊗id_{Q^⊗n})θ^[n], with coherent reassociation to E⊗Q^⊗(n+1). This uses ordinary ordered tensor powers, never exterior powers. IterateNul(θ,N) means N>0 and θ^[N]=0.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: TwistedHiggsBundle.iterate_zero — The zeroth iterate is identity.
API signature omitted: TwistedHiggsBundle.iterate_succ — The successor is θ⊗id after the preceding iterate, with the prescribed reassociation.
-- node: HodgeStructuresPartII:H.0/ordered-coordinate-vanishing (promoted API, same omission)
API signature omitted: TwistedHiggsBundle.iterate_coordinates — In a finite local basis, θ^[N]=0 iff every word of N coefficients vanishes. The promoted ordered-coordinate-vanishing node includes N=0 (id_E) and requires no integrability. Ordered coefficient tuples are distinct; the most recent contraction is the leftmost coefficient. Finite tensor-basis and sheaf restriction/gluing interfaces remain missing.
API signature omitted: TwistedHiggsBundle.iterate_zero_field — The zero field has bound 1.
test omitted: TwistedHiggsBundle.iterate.test_E12 — For E12dx on O², θ^[2]=0 but θ≠0.
test omitted: TwistedHiggsBundle.iterate.test_zero — Zero field has bound 1, including the zero module.
test omitted: TwistedHiggsBundle.iterate.test_scalar — The scalar dx over Q[x] has θ^[N](1)=1⊗dx^⊗N≠0 for every positive N, although it is integrable.

node: HodgeStructuresPartII:H.0/nilpotence-filtration
signature omitted: TwistedHiggsBundle.NilpotenceFiltration
A length-N nilpotence filtration has N>0 and subsheaves 0=K_0⊆K_1⊆⋯⊆K_N=E with θ(K_j) lies in the image of K_{j−1}⊗Q→E⊗Q. When Q is flat this image is the indicated tensor subsheaf. Quotients and steps need not be locally free. Vanishing graded Higgs fields means this lowering equality; it is distinct from the subbundle filtration used for Griffiths associated graded.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: TwistedHiggsBundle.NilpotenceFiltration.lower — θ(K_j) lies in K_{j−1}⊗Q.
API signature omitted: TwistedHiggsBundle.NilpotenceFiltration.zero — A zero field has K_0=0,K_1=E.
API signature omitted: TwistedHiggsBundle.NilpotenceFiltration.transport — A Higgs isomorphism transports the filtration and length.
test omitted: TwistedHiggsBundle.NilpotenceFiltration.test_E12 — For E12dx, K_1 is the line spanned by e₁ and K_2=O².
test omitted: TwistedHiggsBundle.NilpotenceFiltration.test_zero — A zero field gives a length-one filtration.
test omitted: TwistedHiggsBundle.NilpotenceFiltration.test_nonreduced — Over Q[ε]/ε², θ=εdx on a line has K_1=(ε), K_2=O. K_1 is not a line subbundle; a compulsory locally free-quotient definition rejects this valid nilpotent field.

node: HodgeStructuresPartII:H.0/nilpotence-equivalence
signature omitted: TwistedHiggsBundle.nilpotence_iff_filtration
When Q is finite locally free, θ^[N]=0 for N>0 iff a length-N nilpotence filtration exists. No integrability is needed for this equivalence of ordered iterates and lowering filtrations. For a general coherent Q without flatness, this equivalence is not asserted.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor. Q=Ω¹⊗T is finite locally free; E finite locally free, and the tensor-exactness/kernel identification for Q is imported from E1.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/tensor-nilpotence
signature omitted: TwistedHiggsBundle.tensor_nilpotence_bound
If two same-Q fields have positive ordered bounds N and M, their tensor field has bound N+M−1. The proof is valid in arbitrary characteristic and over nonreduced rings, without dividing by binomial coefficients.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/dual-nilpotence
signature omitted: TwistedHiggsBundle.dual_nilpotence_bound
For finite locally free E,Q, a twisted Higgs field with ordered bound N has a dual field with the same bound N. In a finite local basis, its word equals (−1)^N times the transpose of the reversed original word.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/pullback-nilpotence
signature omitted: TwistedHiggsBundle.pullback_nilpotence_bound
Pullback of a twisted field through a coefficient map f*Q→Q_Y preserves the ordered bound N. It also preserves integrability when that map induces the required exterior map. No flatness is required to preserve a zero composite; reflection or identification of pulled-back kernels is not asserted.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/reduced-line-nilpotence
signature omitted: TwistedHiggsBundle.nilpotent_line_eq_zero
If O is locally reduced, E is invertible and Q is finite locally free, a positive ordered nilpotence bound forces θ=0. Reducedness is necessary: on O=Q[ε]/ε², θ=εdx is nonzero with bound 2.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/griffiths-filtration
signature omitted: GriffithsFiltration
For an ordinary integrable connection (E,∇), a GriffithsFiltration is a bounded decreasing Z-indexed filtration F^pE by subbundles, exhaustive for p≤a and zero for p>b, with finite locally free successive quotients and ∇F^p⊆F^{p−1}⊗Ω¹. Only this filtration-to-graded algebra is defined here; a VHS additionally has the local-system/fibrewise Hodge data supplied by D3.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor. Ω¹ is finite locally free, the parameter is 1, and F has finite locally free subquotients and local split inclusions.
Missing inputs: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: GriffithsFiltration.transverse — ∇F^p⊆F^{p−1}⊗Ω¹ for every integer p.
API signature omitted: GriffithsFiltration.shift — F⟨m⟩^p=F^{p+m} is again transverse with shifted bounds.
API signature omitted: GriffithsFiltration.trivial — F^p=E for p≤0 and zero for p>0 is transverse.
API signature omitted: GriffithsFiltration.isVHS_input — A variation from D3 forgets to this datum; this datum alone does not imply opposedness or a rational local system.
test omitted: GriffithsFiltration.test_trivial — The one-step filtration of a flat line is transverse and has zero graded Higgs field.
test omitted: GriffithsFiltration.test_nonzero_symbol — On Q[x], take ∇=d+E21dx and F¹=Oe₁⊂F⁰=O². The filtration is transverse and its graded symbol sends [e₁] to [e₂]dx.
test omitted: GriffithsFiltration.test_skip_two — Take F²=F¹=Oe₁ and F⁰=O² with ∇=d+E21dx. ∇F² is not in F¹⊗Ω¹, so this filtration is rejected.

node: HodgeStructuresPartII:H.0/graded-higgs
signature omitted: GriffithsFiltration.gradedHiggs
For G^p=F^p/F^{p+1}, define θ_p([e])=[∇e] in G^{p−1}⊗Ω¹. The direct sum G=⊕_pG^p is finite locally free and θ has degree −1. Changing a representative by F^{p+1} changes ∇e by F^p⊗Ω¹; the scalar derivative term e⊗da also lies there, so θ_p is O-linear.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: GriffithsFiltration.gradedHiggs_apply — θ_p([e])=[∇e] in G^{p−1}⊗Ω¹.
API signature omitted: GriffithsFiltration.gradedHiggs_linear — Each degree-lowering symbol is O-linear.
API signature omitted: GriffithsFiltration.gradedHiggs_shift — Shifting F only reindexes degrees; it does not change the underlying Higgs object.
API signature omitted: GriffithsFiltration.gradedHiggs_nilpotent — For F exhaustive at a and zero above b, θ^[b−a+1]=0 when a≤b.
test omitted: GriffithsFiltration.gradedHiggs.test_line — The trivial filtration on (O,d) gives zero graded Higgs field.
test omitted: GriffithsFiltration.gradedHiggs.test_E21 — For the two-step Q[x] filtration, θ([e₁])=[e₂]dx≠0 and θ² as an ordered iterate is zero.
test omitted: GriffithsFiltration.gradedHiggs.test_scalar — The class of ∇(ae) equals a[∇e]; retaining the e da term would incorrectly produce a connection instead of a Higgs field.

node: HodgeStructuresPartII:H.0/graded-higgs-integrable
signature omitted: GriffithsFiltration.gradedHiggs_integrable
The degree −1 associated-graded symbol of a flat Griffiths-transverse connection has θ∧θ=0. Flatness ∇²=0 is essential. This is an exterior-square assertion; finite ordered nilpotence instead follows from filtration bounds.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

node: HodgeStructuresPartII:H.0/rees-parameter
signature omitted: GriffithsFiltration.reesConnection
On Rees_F(E)=Σ_p F^pE·t^(−p)⊂E[t,t⁻¹], use the generic DD.1 Rees carrier and construct D_Rees=t∇, relative to the parameter base so dt=0. Transversality sends e t^(−p) to ∇e t^(1−p), which belongs to Rees_F(E)⊗Ω¹. Its parameter is t, and its curvature vanishes.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.
API signature omitted: GriffithsFiltration.reesConnection_apply — D(e t^(−p))=∇e t^(1−p).
API signature omitted: GriffithsFiltration.reesConnection_parameter — The parameter is t and the differential is relative, with dt=0.
API signature omitted: GriffithsFiltration.reesConnection_flat — Its curvature is zero when ∇ is flat.
test omitted: GriffithsFiltration.reesConnection.test_one — At t=1 its operator identifies with ∇.
test omitted: GriffithsFiltration.reesConnection.test_zero — At t=0 its operator identifies with the graded Higgs symbol.
test omitted: GriffithsFiltration.reesConnection.test_relative — Using absolute forms with dt≠0 violates the constant-parameter convention; there is no claim that t∇ extends as this absolute t-connection.

node: HodgeStructuresPartII:H.0/rees-specialization
signature omitted: GriffithsFiltration.reesSpecialization
Under the generic finite split Rees identifications, (Rees_F(E),t∇)/(t) identifies as a Higgs object with (gr_F E,gr_F∇), and its /(t−1) fiber identifies as an ordinary connection with (E,∇). After t inversion, t⁻¹D_Rees identifies with ∇ on E[t,t⁻¹]. These are operator-compatible sheaf isomorphisms, not just rank or point equalities.
Hypotheses: A commutative ringed Grothendieck site (C,J,O) with a specified relative exterior differential calculus Ω⁰=O, Ωⁿ=∧ⁿ_O Ω¹, restriction-compatible wedge and additive relative differentials d; d²=0 and the graded Leibniz identity hold. No smoothness, field, characteristic-zero or reducedness premise is built into the connection definition. λ is a global central O-section with dλ=0. E is a finite locally free O-module sheaf; rank is only locally constant, and a local trivialization is never part of the object. Tensor products here are sheaf tensor products; elementary-section formulas are verified locally and glued. Tensor of global section modules is not identified with global sections of the sheaf tensor.
Missing inputs: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1; intrinsic global exterior/sheaf carriers and named preceding global declarations.

End omission ledger. All named global obligations remain unchecked.
-/

noncomputable section
open scoped TensorProduct
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
universe u v w z
variable {R : Type u} [CommRing R]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {Q : Type w} [AddCommGroup Q] [Module R Q]
variable {F : Type z} [AddCommGroup F] [Module R F]

-- node: HodgeStructuresPartII:H.0/affine-contractions
def affineContractions (θ : E →ₗ[R] E ⊗[R] Q) :
    Module.Dual R Q →ₗ[R] Module.End R E := sorry
theorem affineContractions_apply (θ : E →ₗ[R] E ⊗[R] Q)
    (v : Module.Dual R Q) (e : E) :
    affineContractions θ v e = TensorProduct.rid R E
      (TensorProduct.map (LinearMap.id : E →ₗ[R] E) v (θ e)) := sorry
theorem affineContractions_zero :
    affineContractions (0 : E →ₗ[R] E ⊗[R] Q) = 0 := sorry
theorem affineContractions_add (θ η : E →ₗ[R] E ⊗[R] Q) :
    affineContractions (θ + η) = affineContractions θ + affineContractions η := sorry
-- test: TwistedHiggsBundle.affineContractions.test_zero
example (v : Module.Dual R Q) (e : E) :
    affineContractions (0 : E →ₗ[R] E ⊗[R] Q) v e = 0 := sorry
-- test: TwistedHiggsBundle.affineContractions.test_line
example (e : R) :
    affineContractions ((TensorProduct.rid R R).symm.toLinearMap)
      (LinearMap.id : Module.Dual R R) e = e := sorry
-- test: TwistedHiggsBundle.affineContractions.test_zero_dual
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineContractions θ (0 : Module.Dual R Q) = 0 := sorry
-- node: HodgeStructuresPartII:H.0/affine-contractions-reconstruction
theorem affineContractions_reconstruct {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) (e : E) :
    θ e = ∑ i, affineContractions θ (b.coord i) e ⊗ₜ[R] b i := by sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-square
noncomputable def affineOrderedSquare (θ : E →ₗ[R] E ⊗[R] Q) :
    E →ₗ[R] E ⊗[R] (Q ⊗[R] Q) := by sorry
theorem affineOrderedSquare_apply (θ : E →ₗ[R] E ⊗[R] Q) (e : E) :
    affineOrderedSquare θ e = TensorProduct.assoc R E Q Q
      (TensorProduct.map θ (LinearMap.id : Q →ₗ[R] Q) (θ e)) := by sorry
theorem affineOrderedSquare_zero :
    affineOrderedSquare (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-square-contraction
theorem affineOrderedSquare_contraction (θ : E →ₗ[R] E ⊗[R] Q)
    (v w : Module.Dual R Q) :
    affineContractions (affineOrderedSquare θ)
      ((TensorProduct.lid R R).toLinearMap.comp (TensorProduct.map v w)) =
    affineContractions θ v * affineContractions θ w := by sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-square-vanishing
theorem affineOrderedSquare_eq_zero_iff {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedSquare θ = 0 ↔
      ∀ i j, affineContractions θ (b.coord i) * affineContractions θ (b.coord j) = 0 := by sorry

-- test: TwistedHiggsBundle.affineOrderedSquare.test_zero
example : affineOrderedSquare (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by sorry

-- test: TwistedHiggsBundle.affineOrderedSquare.test_line_nonzero
example [Nontrivial R] :
    affineOrderedSquare ((TensorProduct.rid R R).symm.toLinearMap) ≠ 0 := by sorry

-- test: TwistedHiggsBundle.affineOrderedSquare.test_empty_coefficients
example [Subsingleton Q] (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedSquare θ = 0 := by sorry

-- test: TwistedHiggsBundle.affineOrderedSquare.test_order
example :
    let X : Module.End ℚ (Fin 2 → ℚ) :=
      Matrix.toLin' (Matrix.single (0 : Fin 2) 1 (1 : ℚ))
    let Y : Module.End ℚ (Fin 2 → ℚ) :=
      Matrix.toLin' (Matrix.single (1 : Fin 2) 0 (1 : ℚ))
    let θ : (Fin 2 → ℚ) →ₗ[ℚ] (Fin 2 → ℚ) ⊗[ℚ] (Fin 2 → ℚ) :=
      ((TensorProduct.mk ℚ _ _).flip (Pi.single 0 1)).comp X +
      ((TensorProduct.mk ℚ _ _).flip (Pi.single 1 1)).comp Y
    let v : Module.Dual ℚ (Fin 2 → ℚ) := LinearMap.proj 0
    let w : Module.Dual ℚ (Fin 2 → ℚ) := LinearMap.proj 1
    affineContractions (affineOrderedSquare θ)
        ((TensorProduct.lid ℚ ℚ).toLinearMap.comp (TensorProduct.map v w)) ≠
      affineContractions θ w * affineContractions θ v := by sorry

/- Native all-order affine continuation. General sheaf comparison remains open. -/
noncomputable def affineOrderedStep (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    (E ⊗[R] (⨂[R]^n Q)) →ₗ[R] E ⊗[R] (⨂[R]^(n+1) Q) := sorry

noncomputable def affineOrderedIterate (θ : E →ₗ[R] E ⊗[R] Q) :
    (n : ℕ) → E →ₗ[R] E ⊗[R] (⨂[R]^n Q) := sorry

theorem affineOrderedIterate_zero (θ : E →ₗ[R] E ⊗[R] Q) (e : E) :
    affineOrderedIterate θ 0 e = e ⊗ₜ[R]
      (TensorPower.algebraMap₀ (R := R) (M := Q) 1) := sorry

theorem affineOrderedIterate_succ (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate θ (n+1) = (affineOrderedStep θ n).comp
      (affineOrderedIterate θ n) := sorry

theorem affineOrderedStep_contraction (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ)
    (η : E →ₗ[R] E ⊗[R] (⨂[R]^n Q)) (v : Module.Dual R Q)
    (vs : Fin n → Module.Dual R Q) :
    affineContractions ((affineOrderedStep θ n).comp η)
      (TensorPower.multilinearMapToDual R Q (n+1) (Fin.cons v vs)) =
      affineContractions θ v *
        affineContractions η (TensorPower.multilinearMapToDual R Q n vs) := sorry

theorem affineOrderedIterate_contraction (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ)
    (vs : Fin n → Module.Dual R Q) :
    affineContractions (affineOrderedIterate θ n)
      (TensorPower.multilinearMapToDual R Q n vs) =
      (List.ofFn (fun i => affineContractions θ (vs i))).prod := sorry

theorem affineTensorPower_coordinate {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (n : ℕ) (p : Fin n → I) :
    (Basis.piTensorProduct (fun _ : Fin n => b)).coord p =
      TensorPower.multilinearMapToDual R Q n (fun i => b.coord (p i)) := sorry

theorem affineOrderedIterate_eq_zero_iff {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate θ n = 0 ↔ ∀ p : Fin n → I,
      (List.ofFn (fun i => affineContractions θ (b.coord (p i)))).prod = 0 := sorry

theorem affineOrderedStep_zero (n : ℕ) :
    affineOrderedStep (0 : E →ₗ[R] E ⊗[R] Q) n = 0 := sorry

theorem affineOrderedStep_add (θ η : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedStep (θ+η) n = affineOrderedStep θ n + affineOrderedStep η n := sorry

theorem affineOrderedIterate_zero_field (n : ℕ) :
    affineOrderedIterate (0 : E →ₗ[R] E ⊗[R] Q) (n+1) = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_unit_boundary
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineContractions (affineOrderedIterate θ 0)
      (TensorPower.multilinearMapToDual R Q 0 Fin.elim0) = LinearMap.id := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_zero
example (n : ℕ) : affineOrderedIterate (0 : E →ₗ[R] E ⊗[R] Q) (n+1) = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_scalar_nonzero
example [Nontrivial R] (n : ℕ) :
    affineOrderedIterate ((TensorProduct.rid R R).symm.toLinearMap) n ≠ 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_nonreduced_nilpotent
example :
    let θ : (ZMod 4) →ₗ[ZMod 4] (ZMod 4) ⊗[ZMod 4] (ZMod 4) :=
      (2 : ZMod 4) • (TensorProduct.rid (ZMod 4) (ZMod 4)).symm.toLinearMap
    affineOrderedIterate θ 2 = 0 ∧ θ ≠ 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedStep.test_zero
example (n : ℕ) : affineOrderedStep (0 : E →ₗ[R] E ⊗[R] Q) n = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedStep.test_empty_coefficients
example [Subsingleton Q] (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedStep θ n = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedStep.test_scalar_nonzero
example [Nontrivial R] (n : ℕ) :
    affineOrderedStep ((TensorProduct.rid R R).symm.toLinearMap) n ≠ 0 := sorry

/-- Affine adapter for the existing symmetric algebra, into actual endomorphisms.
Global sheaf algebra/endomorphism and restriction coherence are supplied by E1.
The affine lift uses existing native TensorAlgebra and RingCon objects. -/
-- node: HodgeStructuresPartII:H.0/affine-symmetric-action
def affineSymmetricAction (a : Module.Dual R Q →ₗ[R] Module.End R E)
    (h : ∀ v w, Commute (a v) (a w)) :
    SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E := sorry
theorem affineSymmetricAction_generator
    (a : Module.Dual R Q →ₗ[R] Module.End R E)
    (h : ∀ v w, Commute (a v) (a w)) (v : Module.Dual R Q) :
    affineSymmetricAction a h (SymmetricAlgebra.ι R _ v) = a v := sorry
theorem affineSymmetricAction_unique
    (a : Module.Dual R Q →ₗ[R] Module.End R E)
    (h : ∀ v w, Commute (a v) (a w))
    (β : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (hβ : ∀ v, β (SymmetricAlgebra.ι R _ v) = a v) :
    β = affineSymmetricAction a h := sorry
theorem affineSymmetricAction_zero
    (h : ∀ v w : Module.Dual R Q, Commute
      ((0 : Module.Dual R Q →ₗ[R] Module.End R E) v) ((0 : Module.Dual R Q →ₗ[R] Module.End R E) w))
    (s : SymmetricAlgebra R (Module.Dual R Q)) :
    affineSymmetricAction 0 h s =
      algebraMap R (Module.End R E) (SymmetricAlgebra.algebraMapInv s) := sorry
-- test: TwistedHiggsBundle.affineSymmetricAction.test_zero
example (h : ∀ v w : Module.Dual R Q, Commute
    ((0 : Module.Dual R Q →ₗ[R] Module.End R E) v) ((0 : Module.Dual R Q →ₗ[R] Module.End R E) w))
    (v : Module.Dual R Q) :
    affineSymmetricAction 0 h (SymmetricAlgebra.ι R _ v) = 0 := sorry
-- test: TwistedHiggsBundle.affineSymmetricAction.test_scalar
example (a : Module.Dual R R →ₗ[R] Module.End R R)
    (h : ∀ v w, Commute (a v) (a w))
    (ha : a (LinearMap.id : Module.Dual R R) = 1) :
    affineSymmetricAction a h
      (SymmetricAlgebra.ι R _ (LinearMap.id : Module.Dual R R)) = 1 := sorry
-- test: TwistedHiggsBundle.affineSymmetricAction.test_rank_zero
example (a : Module.Dual R Q →ₗ[R] Module.End R (Fin 0 → R))
    (h : ∀ v w, Commute (a v) (a w))
    (s : SymmetricAlgebra R (Module.Dual R Q)) :
    affineSymmetricAction a h s = 0 := sorry
-- test: TwistedHiggsBundle.affineSymmetricAction.test_noncommuting
example :
    let X : Module.End ℚ (Fin 2 → ℚ) :=
      { toFun := fun e i => if i = 0 then e 1 else 0
        map_add' := by intro e f; ext i; by_cases h : i = 0 <;> simp [h]
        map_smul' := by intro r e; ext i; by_cases h : i = 0 <;> simp [h] }
    let Y : Module.End ℚ (Fin 2 → ℚ) :=
      { toFun := fun e i => if i = 1 then e 0 else 0
        map_add' := by intro e f; ext i; by_cases h : i = 1 <;> simp [h]
        map_smul' := by intro r e; ext i; by_cases h : i = 1 <;> simp [h] }
    ∀ (α : SymmetricAlgebra ℚ (Module.Dual ℚ (Fin 2 → ℚ)) →ₐ[ℚ]
        Module.End ℚ (Fin 2 → ℚ)) (v w : Module.Dual ℚ (Fin 2 → ℚ)),
      α (SymmetricAlgebra.ι ℚ _ v) = X →
      α (SymmetricAlgebra.ι ℚ _ w) = Y → False := sorry
-- test: TwistedHiggsBundle.affineSymmetricAction.test_ambient_ideal
example :
    let X : Module.End ℚ (Fin 2 → ℚ) :=
      Matrix.toLin' (Matrix.single (0 : Fin 2) 1 (1 : ℚ))
    let Y : Module.End ℚ (Fin 2 → ℚ) :=
      Matrix.toLin' (Matrix.single (1 : Fin 2) 0 (1 : ℚ))
    ∃ α : SymmetricAlgebra ℚ (Module.Dual ℚ ℚ) →ₐ[ℚ]
        Module.End ℚ (Fin 2 → ℚ),
      α (SymmetricAlgebra.ι ℚ _ (LinearMap.id : Module.Dual ℚ ℚ)) = X ∧
      (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := ℚ)
        (M := Module.Dual ℚ ℚ)).toRingHom) ^ 2 ≤ RingHom.ker α.toRingHom ∧
      Y * X ∈ Ideal.span ({X} : Set (Module.End ℚ (Fin 2 → ℚ))) ∧
      Y * X ≠ 0 ∧ (Y * X) * (Y * X) = Y * X := sorry

-- node: HodgeStructuresPartII:H.0/affine-symmetric-commuting
theorem affineSymmetricAction_iff_commute
    (a : Module.Dual R Q →ₗ[R] Module.End R E) :
    (∃ α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E,
      ∀ v, α (SymmetricAlgebra.ι R _ v) = a v) ↔
    ∀ v w, Commute (a v) (a w) := sorry
-- node: HodgeStructuresPartII:H.0/symmetric-action-word
theorem symmetricAction_word
    (a : Module.Dual R Q →ₗ[R] Module.End R E)
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (hα : ∀ v, α (SymmetricAlgebra.ι R _ v) = a v)
    (word : List (Module.Dual R Q)) :
    α ((word.map (SymmetricAlgebra.ι R _)).prod) = (word.map a).prod := sorry
-- node: HodgeStructuresPartII:H.0/symmetric-action-morphism
theorem symmetricAction_morphism
    (a : Module.Dual R Q →ₗ[R] Module.End R E)
    (b : Module.Dual R Q →ₗ[R] Module.End R F)
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (β : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R F)
    (hα : ∀ v, α (SymmetricAlgebra.ι R _ v) = a v)
    (hβ : ∀ v, β (SymmetricAlgebra.ι R _ v) = b v)
    (f : E →ₗ[R] F) :
    (∀ v, f.comp (a v) = (b v).comp f) ↔
    (∀ s, f.comp (α s) = (β s).comp f) := sorry
-- node: HodgeStructuresPartII:H.0/augmentation-power-generators
theorem augmentation_pow_generators (N : ℕ) :
    (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N =
    Ideal.span (Set.range fun word : Fin N → Module.Dual R Q =>
      ((List.ofFn word).map (SymmetricAlgebra.ι R _)).prod) := sorry
-- test: TwistedHiggsBundle.augmentation_pow_generators.test_zero
example :
    Ideal.span (Set.range fun word : Fin 0 → Module.Dual R Q =>
      ((List.ofFn word).map (SymmetricAlgebra.ι R _)).prod) = ⊤ := sorry
-- test: TwistedHiggsBundle.augmentation_pow_generators.test_one
example :
    RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom =
    Ideal.span (Set.range fun word : Fin 1 → Module.Dual R Q =>
      ((List.ofFn word).map (SymmetricAlgebra.ι R _)).prod) := sorry

-- node: HodgeStructuresPartII:H.0/augmentation-power-words
theorem augmentation_pow_iff_words
    (a : Module.Dual R Q →ₗ[R] Module.End R E)
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (hα : ∀ v, α (SymmetricAlgebra.ι R _ v) = a v) (N : ℕ) :
    (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom ↔
    ∀ word : Fin N → Module.Dual R Q, ((List.ofFn word).map a).prod = 0 := sorry

-- node: HodgeStructuresPartII:H.0/truncated-symmetric-action
def truncatedSymmetricAction
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (N : ℕ)
    (h : (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom) :
    (SymmetricAlgebra R (Module.Dual R Q) ⧸
      (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
        (M := Module.Dual R Q)).toRingHom) ^ N) →ₐ[R] Module.End R E := sorry
theorem truncatedSymmetricAction_mk
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (N : ℕ) (h : (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom)
    (s : SymmetricAlgebra R (Module.Dual R Q)) :
    truncatedSymmetricAction α N h (Ideal.Quotient.mk _ s) = α s := sorry
theorem truncatedSymmetricAction_unique
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (N : ℕ) (h : (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom)
    (β : (SymmetricAlgebra R (Module.Dual R Q) ⧸
      (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
        (M := Module.Dual R Q)).toRingHom) ^ N) →ₐ[R] Module.End R E)
    (hβ : ∀ s, β (Ideal.Quotient.mk _ s) = α s) :
    β = truncatedSymmetricAction α N h := sorry
theorem truncatedSymmetricAction_exists_iff
    (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E) (N : ℕ) :
    (∃ β : (SymmetricAlgebra R (Module.Dual R Q) ⧸
      (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
        (M := Module.Dual R Q)).toRingHom) ^ N) →ₐ[R] Module.End R E,
      ∀ s, β (Ideal.Quotient.mk _ s) = α s) ↔
    (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom := sorry
-- test: TwistedHiggsBundle.truncatedSymmetricAction.test_generator
example (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R] Module.End R E)
    (h : (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ 1 ≤ RingHom.ker α.toRingHom)
    (v : Module.Dual R Q) :
    truncatedSymmetricAction α 1 h (Ideal.Quotient.mk _
      (SymmetricAlgebra.ι R _ v)) = 0 := sorry
-- test: TwistedHiggsBundle.truncatedSymmetricAction.test_scalar_rejected
example (α : SymmetricAlgebra ℚ (Module.Dual ℚ ℚ) →ₐ[ℚ] Module.End ℚ ℚ)
    (ha : α (SymmetricAlgebra.ι ℚ _ (LinearMap.id : Module.Dual ℚ ℚ)) = 1)
    (N : ℕ) (_hN : 0 < N) :
    ¬ (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := ℚ)
      (M := Module.Dual ℚ ℚ)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom := sorry
-- test: TwistedHiggsBundle.truncatedSymmetricAction.test_rank_zero
example (α : SymmetricAlgebra R (Module.Dual R Q) →ₐ[R]
    Module.End R (Fin 0 → R)) (N : ℕ) :
    (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := R)
      (M := Module.Dual R Q)).toRingHom) ^ N ≤ RingHom.ker α.toRingHom := sorry
/-- In F₂, xy+yx survives in the tensor algebra but dies in the symmetric algebra. -/
-- node: HodgeStructuresPartII:H.0/symmetric-projection-counterexample
theorem symmetricProjection_charTwo_counterexample :
    let q₀ : Fin 2 → ZMod 2 := Pi.single 0 1
    let q₁ : Fin 2 → ZMod 2 := Pi.single 1 1
    let t := TensorAlgebra.ι (ZMod 2) q₀ * TensorAlgebra.ι (ZMod 2) q₁ +
      TensorAlgebra.ι (ZMod 2) q₁ * TensorAlgebra.ι (ZMod 2) q₀
    t ≠ 0 ∧ SymmetricAlgebra.algHom (ZMod 2) (Fin 2 → ZMod 2) t = 0 := sorry

-- test: TwistedHiggsBundle.truncatedSymmetricAction.test_square_zero
example {V : Type*} [AddCommGroup V] [Module ℚ V]
    (X : Module.End ℚ V) (hX : X * X = 0) (hne : X ≠ 0)
    (α : SymmetricAlgebra ℚ (Module.Dual ℚ ℚ) →ₐ[ℚ] Module.End ℚ V)
    (hα : ∀ v, α (SymmetricAlgebra.ι ℚ _ v) = v 1 • X) :
    (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := ℚ)
      (M := Module.Dual ℚ ℚ)).toRingHom) ^ 2 ≤ RingHom.ker α.toRingHom ∧
    ¬ (RingHom.ker (SymmetricAlgebra.algebraMapInv (R := ℚ)
      (M := Module.Dual ℚ ℚ)).toRingHom) ≤ RingHom.ker α.toRingHom := sorry

/-- Concrete four-basis module witnesses for the preceding counterexample;
these are example fixtures, not a new planned carrier. -/
def charTwoShiftX : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) (ZMod 2) :=
  fun i j => if i.1 = 1 ∧ j.1 = 0 ∧ i.2 = j.2 then 1 else 0
def charTwoShiftY : Matrix (Fin 2 × Fin 2) (Fin 2 × Fin 2) (ZMod 2) :=
  fun i j => if i.2 = 1 ∧ j.2 = 0 ∧ i.1 = j.1 then 1 else 0
theorem symmetricProjection_charTwo_action_counterexample :
    charTwoShiftX * charTwoShiftX = 0 ∧ charTwoShiftY * charTwoShiftY = 0 ∧
    charTwoShiftX * charTwoShiftY = charTwoShiftY * charTwoShiftX ∧
    charTwoShiftX * charTwoShiftY ≠ 0 ∧
    charTwoShiftX * charTwoShiftY + charTwoShiftY * charTwoShiftX = 0 ∧
    ∀ word : Fin 3 → Fin 2,
      ((List.ofFn word).map (fun i => if i = 0 then charTwoShiftX else charTwoShiftY)).prod = 0 := sorry

end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/-
node: HodgeStructuresPartII:H.0/ordered-augmentation-nilpotence
signature omitted: TwistedHiggsBundle.nilpotence_iff_augmentation_power
For an integrable twisted Higgs field with Q finite locally free and its actual sheaf algebra action α:Sym_O(Q∨)→End_O(E), and a specified positive N, θ^[N]=0 iff (ker ε)^N acts by zero on E. The same N occurs on both sides in every characteristic and over nonreduced bases. This also identifies a specified ordered nilpotence bound with factorization of α through Sym_O(Q∨)/(ker ε)^N.
Hypotheses: A commutative ringed Grothendieck site (C,J,O). E is finite locally free and Q is finite locally free, possibly Ω¹⊗T with T invertible. All maps, tensor powers and algebra objects are sheaves, with restriction-compatible local formulas. θ:E→E⊗Q is O-linear. Integrability is required only for the symmetric-action comparison, not for the ordered-coordinate lemma. No characteristic, reducedness, basis or nilpotence condition is built into θ. Local finite bases are used on trivializing covers; no tensor of global sections is identified with sections of a sheaf tensor. θ∧θ=0 and N>0. ε is the actual degree-zero augmentation of the symmetric sheaf algebra; annihilation is an equality of action maps, not an arbitrary stored predicate.
Missing inputs: EnhancedDerivedSheaves:E1 actual sheaf symmetric/endomorphism/augmentation quotient, ordered tensor powers and restriction/descent coherence. No arbitrary Proposition carrier stands in for these maps.
-/

/- Native module/coefficient naturality continuation: seven promoted lemmas and seven acceptance examples. All submitted bodies are planning admissions. -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E F Q P : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]

-- node: HodgeStructuresPartII:H.0/affine-ordered-step-natural
lemma affineOrderedStep_natural (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) (n : ℕ) :
    (affineOrderedStep ψ n).comp (TensorProduct.map f (PiTensorProduct.map (fun _ : Fin n => u))) =
      (TensorProduct.map f (PiTensorProduct.map (fun _ : Fin (n+1) => u))).comp
        (affineOrderedStep θ n) := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-natural
lemma affineOrderedIterate_natural (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) (n : ℕ) :
    (affineOrderedIterate ψ n).comp f =
      (TensorProduct.map f (PiTensorProduct.map (fun _ : Fin n => u))).comp
        (affineOrderedIterate θ n) := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-mono
lemma affineOrderedIterate_mono (θ : E →ₗ[R] E ⊗[R] Q) {n m : ℕ}
    (hnm : n ≤ m) (hzero : affineOrderedIterate θ n = 0) :
    affineOrderedIterate θ m = 0 := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-surjective
lemma affineOrderedIterate_zero_of_surjective (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) (hf : Function.Surjective f)
    (n : ℕ) (hz : affineOrderedIterate θ n = 0) : affineOrderedIterate ψ n = 0 := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-equiv
lemma affineOrderedIterate_equiv_zero_iff (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E ≃ₗ[R] F) (u : Q ≃ₗ[R] P)
    (h : ψ.comp f.toLinearMap = (TensorProduct.map f.toLinearMap u.toLinearMap).comp θ)
    (n : ℕ) : affineOrderedIterate ψ n = 0 ↔ affineOrderedIterate θ n = 0 := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-one
lemma affineOrderedIterate_one (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedIterate θ 1 =
      (TensorProduct.map (LinearMap.id : E →ₗ[R] E)
        (PiTensorProduct.subsingletonEquiv (R := R) (s := fun _ : Fin 1 => Q) 0).symm.toLinearMap).comp θ := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-two
lemma affineOrderedIterate_two (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedIterate θ 2 =
      (TensorProduct.map (LinearMap.id : E →ₗ[R] E)
        ((TensorProduct.congr
          (PiTensorProduct.subsingletonEquiv (R := R) (s := fun _ : Fin 1 => Q) 0).symm
          (PiTensorProduct.subsingletonEquiv (R := R) (s := fun _ : Fin 1 => Q) 0).symm).trans
            (TensorPower.mulEquiv (n := 1) (m := 1))).toLinearMap).comp
              (affineOrderedSquare θ) := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_natural_unit
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] P)
    (f : E →ₗ[R] F) (u : Q →ₗ[R] P) :
    (affineOrderedIterate ψ 0).comp f =
      (TensorProduct.map f (PiTensorProduct.map (fun _ : Fin 0 => u))).comp
        (affineOrderedIterate θ 0) := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_coefficient_quotient
example (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) (n : ℕ)
    (hz : affineOrderedIterate θ n = 0) :
    affineOrderedIterate ((TensorProduct.map (LinearMap.id : E →ₗ[R] E) u).comp θ) n = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_chart_identity
example (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate θ n = 0 ↔ affineOrderedIterate θ n = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_bound_two_to_five
example (θ : E →ₗ[R] E ⊗[R] Q) (hz : affineOrderedIterate θ 2 = 0) :
    affineOrderedIterate θ 5 = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_one_zero_iff
example (θ : E →ₗ[R] E ⊗[R] Q) : affineOrderedIterate θ 1 = 0 ↔ θ = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_two_zero_iff
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedIterate θ 2 = 0 ↔ affineOrderedSquare θ = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_characteristic_two_nonreflection
example :
    let θ := (TensorProduct.rid (ZMod 2) (ZMod 2)).symm.toLinearMap
    let ψ : ZMod 2 →ₗ[ZMod 2] ZMod 2 ⊗[ZMod 2] ZMod 2 := 0
    let u : ZMod 2 →ₗ[ZMod 2] ZMod 2 := 0
    ψ.comp (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) =
        (TensorProduct.map (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2) u).comp θ ∧
      affineOrderedIterate ψ 1 = 0 ∧ affineOrderedIterate θ 1 ≠ 0 := sorry

end

section ScalarExtension
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]

noncomputable def affineBaseChange (θ : E →ₗ[R] E ⊗[R] Q) :
    S ⊗[R] E →ₗ[S] (S ⊗[R] E) ⊗[S] (S ⊗[R] Q) := sorry

theorem affineBaseChange_tmul (θ : E →ₗ[R] E ⊗[R] Q) (a : S) (e : E) :
    affineBaseChange S θ (a ⊗ₜ[R] e) =
      TensorProduct.AlgebraTensorModule.distribBaseChange R S E Q (a ⊗ₜ[R] θ e) := sorry

theorem affineBaseChange_zero :
    affineBaseChange S (0 : E →ₗ[R] E ⊗[R] Q) = 0 := sorry

theorem affineBaseChange_contraction {I : Type*}
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) (i : I) :
    affineContractions (affineBaseChange S θ) ((b.baseChange S).coord i) =
      (affineContractions θ (b.coord i)).baseChange S := sorry

theorem affineBaseChange_word {I : Type*}
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) (p : Fin n → I) :
    (List.ofFn (fun i => affineContractions (affineBaseChange S θ)
      ((b.baseChange S).coord (p i)))).prod =
    ((List.ofFn (fun i => affineContractions θ (b.coord (p i)))).prod).baseChange S := sorry

theorem affineOrderedIterate_baseChange_zero {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ)
    (h : affineOrderedIterate θ n = 0) :
    affineOrderedIterate (affineBaseChange S θ) n = 0 := sorry

theorem affineOrderedIterate_baseChange_zero_iff [Module.FaithfullyFlat R S]
    {I : Type*} [Fintype I] (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineBaseChange S θ) n = 0 ↔ affineOrderedIterate θ n = 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_zero
example (n : ℕ) :
    affineOrderedIterate (affineBaseChange S (0 : E →ₗ[R] E ⊗[R] Q)) (n+1) = 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_line
example (a : S) (e : R) :
    affineBaseChange S ((TensorProduct.rid R R).symm.toLinearMap) (a ⊗ₜ[R] e) =
      (a ⊗ₜ[R] e) ⊗ₜ[S] ((1 : S) ⊗ₜ[R] (1 : R)) := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_unit_all_orders
example [Nontrivial S] (n : ℕ) :
    affineOrderedIterate
      (affineBaseChange S ((TensorProduct.rid R R).symm.toLinearMap)) n ≠ 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_nonfaithful
example :
    let θ : ℤ →ₗ[ℤ] ℤ ⊗[ℤ] ℤ :=
      (2 : ℤ) • (TensorProduct.rid ℤ ℤ).symm.toLinearMap
    θ ≠ 0 ∧ affineBaseChange (ZMod 2) θ = 0 := sorry

end ScalarExtension


end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/- BEGIN HIGGS COEFFICIENT MAP -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E Q P T : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E]
variable [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]
variable [AddCommGroup T] [Module R T]

def affineCoefficientMap (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) :
    E →ₗ[R] E ⊗[R] P := by sorry

lemma affineCoefficientMap_apply (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) (e : E) :
    affineCoefficientMap θ u e = TensorProduct.map (LinearMap.id : E →ₗ[R] E) u (θ e) := by sorry

lemma affineCoefficientMap_id (θ : E →ₗ[R] E ⊗[R] Q) :
    affineCoefficientMap θ (LinearMap.id : Q →ₗ[R] Q) = θ := by sorry

lemma affineCoefficientMap_zero (θ : E →ₗ[R] E ⊗[R] Q) :
    affineCoefficientMap θ (0 : Q →ₗ[R] P) = 0 := by sorry

lemma affineCoefficientMap_comp (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q →ₗ[R] P) (v : P →ₗ[R] T) :
    affineCoefficientMap (affineCoefficientMap θ u) v = affineCoefficientMap θ (v.comp u) := by sorry

lemma affineOrderedIterate_coefficientMap (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q →ₗ[R] P) (n : ℕ) :
    affineOrderedIterate (affineCoefficientMap θ u) n =
      (TensorProduct.map (LinearMap.id : E →ₗ[R] E)
        (PiTensorProduct.map (fun _ : Fin n => u))).comp (affineOrderedIterate θ n) := by sorry

lemma affineOrderedIterate_coefficientMap_zero (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q →ₗ[R] P) (n : ℕ) (hz : affineOrderedIterate θ n = 0) :
    affineOrderedIterate (affineCoefficientMap θ u) n = 0 := by sorry

lemma affineOrderedIterate_coefficientMap_zero_iff (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q →ₗ[R] P) (v : P →ₗ[R] Q) (hvu : v.comp u = LinearMap.id) (n : ℕ) :
    affineOrderedIterate (affineCoefficientMap θ u) n = 0 ↔ affineOrderedIterate θ n = 0 := by sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_identity
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineCoefficientMap θ (LinearMap.id : Q →ₗ[R] Q) = θ := by sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_split_all_orders
example (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineCoefficientMap θ (LinearMap.inl R Q P)) n = 0 ↔
      affineOrderedIterate θ n = 0 := by sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_zero_erases
example :
    (TensorProduct.rid ℚ ℚ).symm.toLinearMap ≠ 0 ∧
      affineCoefficientMap (TensorProduct.rid ℚ ℚ).symm.toLinearMap (0 : ℚ →ₗ[ℚ] ℚ) = 0 := by sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_injective_not_tensor_injective
example :
    Function.Injective ((2 : ℤ) • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) ∧
    (TensorProduct.rid ℤ (ZMod 2)).symm.toLinearMap ≠ 0 ∧
    affineCoefficientMap (TensorProduct.rid ℤ (ZMod 2)).symm.toLinearMap
      ((2 : ℤ) • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) = 0 := by sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_zero_degree
example (θ : ℚ →ₗ[ℚ] ℚ ⊗[ℚ] ℚ) (u : ℚ →ₗ[ℚ] ℚ) :
    affineOrderedIterate (affineCoefficientMap θ u) 0 ≠ 0 := by sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
/- END HIGGS COEFFICIENT MAP -/


/- Flat coefficient injections and horizontal subobjects: same base ring and exact exponent.
No basis, integrability or global sheaf-gluing assertion is introduced. -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E Q P : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E]
variable [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]

lemma affineOrderedIterate_natural_zero_iff_of_flat
    {F : Type*} [AddCommGroup F] [Module R F]
    [Module.Flat R F] [Module.Flat R Q] [Module.Flat R P]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] P)
    (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ)
    (hf : Function.Injective f) (hu : Function.Injective u) (n : ℕ) :
    (affineOrderedIterate ψ n).comp f = 0 ↔ affineOrderedIterate θ n = 0 := by
  sorry

lemma affineOrderedIterate_coefficientMap_zero_iff_of_flat
    [Module.Flat R E] [Module.Flat R Q] [Module.Flat R P]
    (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) (hu : Function.Injective u) (n : ℕ) :
    affineOrderedIterate (affineCoefficientMap θ u) n = 0 ↔ affineOrderedIterate θ n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_flat_nonsplit
example (θ : ℤ →ₗ[ℤ] ℤ ⊗[ℤ] ℤ) (n : ℕ) :
    (affineOrderedIterate (affineCoefficientMap θ ((2 : ℤ) • LinearMap.id)) n = 0 ↔
      affineOrderedIterate θ n = 0) ∧
    ¬ ∃ v : ℤ →ₗ[ℤ] ℤ, v.comp ((2 : ℤ) • LinearMap.id) = LinearMap.id := by
  sorry

-- test: TwistedHiggsBundle.affineCoefficientMap.test_projective_no_basis
example {R E Q P : Type*} [CommRing R] [AddCommGroup E] [Module R E]
    [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]
    [Module.Projective R E] [Module.Projective R Q] [Module.Projective R P]
    (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) (hu : Function.Injective u) (n : ℕ) :
    affineOrderedIterate (affineCoefficientMap θ u) n = 0 ↔ affineOrderedIterate θ n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_flat_subobject
example {R E F Q P : Type*} [CommRing R]
    [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
    [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]
    [Module.Flat R F] [Module.Flat R Q] [Module.Flat R P]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] P)
    (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ)
    (hf : Function.Injective f) (hu : Function.Injective u) (n : ℕ)
    (hz : affineOrderedIterate ψ n = 0) : affineOrderedIterate θ n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_restriction_not_ambient
example :
    let f := LinearMap.inl ℤ ℤ ℤ
    let B : (ℤ × ℤ) →ₗ[ℤ] (ℤ × ℤ) := (LinearMap.inr ℤ ℤ ℤ).comp (LinearMap.snd ℤ ℤ ℤ)
    let ψ := (TensorProduct.rid ℤ (ℤ × ℤ)).symm.toLinearMap.comp B
    ψ.comp f = 0 ∧ ψ ≠ 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E F Q P : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]
variable (S : Type*) [CommRing S] [Algebra R S]

-- node: HodgeStructuresPartII:H.0/affine-base-change-natural
lemma affineBaseChange_natural (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) :
    (affineBaseChange S ψ).comp (f.baseChange S) =
      (TensorProduct.map (f.baseChange S) (u.baseChange S)).comp (affineBaseChange S θ) := sorry

-- node: HodgeStructuresPartII:H.0/affine-base-change-coefficient-map
lemma affineBaseChange_coefficientMap (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) :
    affineBaseChange S (affineCoefficientMap θ u) =
      affineCoefficientMap (affineBaseChange S θ) (u.baseChange S) := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-natural
lemma affineOrderedIterate_baseChange_natural (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) (n : ℕ) :
    (affineOrderedIterate (affineBaseChange S ψ) n).comp (f.baseChange S) =
      (TensorProduct.map (f.baseChange S)
        (PiTensorProduct.map (fun _ : Fin n => u.baseChange S))).comp
          (affineOrderedIterate (affineBaseChange S θ) n) := sorry

-- node: HodgeStructuresPartII:H.0/affine-base-change-zero-iff
lemma affineBaseChange_zero_iff [Module.FaithfullyFlat R S]
    (θ : E →ₗ[R] E ⊗[R] Q) : affineBaseChange S θ = 0 ↔ θ = 0 := sorry

-- node: HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-one-zero-iff
lemma affineOrderedIterate_baseChange_one_zero_iff [Module.FaithfullyFlat R S]
    (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedIterate (affineBaseChange S θ) 1 = 0 ↔ affineOrderedIterate θ 1 = 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_coefficient_quotient
example (θ : ℤ →ₗ[ℤ] ℤ ⊗[ℤ] ZMod 2) :
    affineBaseChange (ZMod 2) (affineCoefficientMap θ (0 : ZMod 2 →ₗ[ℤ] ZMod 3)) =
      affineCoefficientMap (affineBaseChange (ZMod 2) θ)
        ((0 : ZMod 2 →ₗ[ℤ] ZMod 3).baseChange (ZMod 2)) := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_torsion_coefficients
example (θ : ℤ →ₗ[ℤ] ℤ ⊗[ℤ] ZMod 2) :
    affineBaseChange ℤ θ = 0 ↔ θ = 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_torsion_source
example : affineBaseChange ℤ
    (TensorProduct.rid ℤ (ZMod 2)).symm.toLinearMap ≠ 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_degree_one_no_basis
example (θ : ZMod 2 →ₗ[ℤ] ZMod 2 ⊗[ℤ] ZMod 2) :
    affineOrderedIterate (affineBaseChange ℤ θ) 1 = 0 ↔
      affineOrderedIterate θ 1 = 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_horizontal_restriction
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] P)
    (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) (n : ℕ)
    (hz : affineOrderedIterate (affineBaseChange S θ) n = 0) :
    (affineOrderedIterate (affineBaseChange S ψ) n).comp (f.baseChange S) = 0 := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_receiving_unit
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] P)
    (f : E →ₗ[R] F) (u : Q →ₗ[R] P) :
    (affineOrderedIterate (affineBaseChange S ψ) 0).comp (f.baseChange S) =
      (TensorProduct.map (f.baseChange S)
        (PiTensorProduct.map (fun _ : Fin 0 => u.baseChange S))).comp
          (affineOrderedIterate (affineBaseChange S θ) 0) := sorry

-- test: TwistedHiggsBundle.affineBaseChange.test_nonfaithful_erasure
example :
    let θ := ((TensorProduct.rid ℤ ℤ).symm.toLinearMap).comp
      ((2 : ℤ) • (LinearMap.id : ℤ →ₗ[ℤ] ℤ))
    θ ≠ 0 ∧ affineBaseChange (ZMod 2) θ = 0 := sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

-- Arbitrary-coefficient cross-ring ordered coherence (affine only).

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]

private def prependEquiv (R Q : Type*) [CommRing R] [AddCommGroup Q] [Module R Q]
    (n : ℕ) : Q ⊗[R] (⨂[R]^n Q) ≃ₗ[R] (⨂[R]^(n+1) Q) := sorry

/-- Native cross-ring distributor for the left-prepended ordered tensor convention. -/
def affineTensorPowerBaseChange : (n : ℕ) →
    S ⊗[R] TensorPower R n Q ≃ₗ[S] TensorPower S n (S ⊗[R] Q) := sorry

lemma affineTensorPowerBaseChange_symm_apply (n : ℕ) (x : S ⊗[R] TensorPower R n Q) :
    (affineTensorPowerBaseChange S n).symm (affineTensorPowerBaseChange S n x) = x := sorry

lemma affineTensorPowerBaseChange_unit (a : S) :
    affineTensorPowerBaseChange (Q := Q) S 0
      (a ⊗ₜ[R] TensorPower.algebraMap₀ (R := R) (M := Q) 1) =
      TensorPower.algebraMap₀ (R := S) (M := S ⊗[R] Q) a := sorry

lemma affineTensorPowerBaseChange_prepend (n : ℕ) (a : S) (q : Q)
    (t : TensorPower R n Q) :
    affineTensorPowerBaseChange S (n + 1) (a ⊗ₜ[R] prependEquiv R Q n (q ⊗ₜ[R] t)) =
      prependEquiv S (S ⊗[R] Q) n
        ((a ⊗ₜ[R] q) ⊗ₜ[S] affineTensorPowerBaseChange S n (1 ⊗ₜ[R] t)) := sorry

def affineOrderedBaseChange (n : ℕ) :
    S ⊗[R] (E ⊗[R] TensorPower R n Q) ≃ₗ[S]
      (S ⊗[R] E) ⊗[S] TensorPower S n (S ⊗[R] Q) := sorry

lemma affineOrderedBaseChange_tmul (n : ℕ) (a : S) (e : E) (t : TensorPower R n Q) :
    affineOrderedBaseChange S n (a ⊗ₜ[R] (e ⊗ₜ[R] t)) =
      (a ⊗ₜ[R] e) ⊗ₜ[S] affineTensorPowerBaseChange S n (1 ⊗ₜ[R] t) := sorry

lemma affineOrderedBaseChange_step (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    (affineOrderedBaseChange S (n + 1)).toLinearMap.comp
      ((affineOrderedStep θ n).baseChange S) =
    (affineOrderedStep (affineBaseChange S θ) n).comp
      (affineOrderedBaseChange S n).toLinearMap := sorry

lemma affineOrderedIterate_baseChange_comparison (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    (affineOrderedBaseChange S n).toLinearMap.comp ((affineOrderedIterate θ n).baseChange S) =
      affineOrderedIterate (affineBaseChange S θ) n := sorry

lemma affineOrderedIterate_baseChange_zero_of_arbitrary_coefficients
    (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) (h : affineOrderedIterate θ n = 0) :
    affineOrderedIterate (affineBaseChange S θ) n = 0 := sorry

lemma affineOrderedIterate_baseChange_zero_iff_of_arbitrary_coefficients
    [Module.FaithfullyFlat R S] (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineBaseChange S θ) n = 0 ↔ affineOrderedIterate θ n = 0 := sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]

-- test: TwistedHiggsBundle.affineTensorPowerBaseChange.test_torsion_unit
example (a : ZMod 4) :
    affineTensorPowerBaseChange (R := ℤ) (Q := ZMod 2) (ZMod 4) 0
      (a ⊗ₜ[ℤ] TensorPower.algebraMap₀ (R := ℤ) (M := ZMod 2) 1) =
      TensorPower.algebraMap₀ (R := ZMod 4) (M := (ZMod 4) ⊗[ℤ] (ZMod 2)) a := sorry

-- test: TwistedHiggsBundle.affineTensorPowerBaseChange.test_torsion_prepend
example (q : ZMod 2) (t : TensorPower ℤ 1 (ZMod 2)) :
    affineTensorPowerBaseChange ℤ 2
      ((1 : ℤ) ⊗ₜ[ℤ] prependEquiv ℤ (ZMod 2) 1 (q ⊗ₜ[ℤ] t)) =
      prependEquiv ℤ (ℤ ⊗[ℤ] (ZMod 2)) 1
        (((1 : ℤ) ⊗ₜ[ℤ] q) ⊗ₜ[ℤ] affineTensorPowerBaseChange ℤ 1 (1 ⊗ₜ[ℤ] t)) := sorry

-- test: TwistedHiggsBundle.affineTensorPowerBaseChange.test_nonflat_distributor
example (n : ℕ) (x : (ZMod 2) ⊗[ℤ] TensorPower ℤ n (ZMod 2)) :
    (affineTensorPowerBaseChange (ZMod 2) n).symm
      (affineTensorPowerBaseChange (ZMod 2) n x) = x := sorry

-- test: TwistedHiggsBundle.affineOrderedBaseChange.test_unit
example (a : S) (e : E) :
    affineOrderedBaseChange (Q := Q) S 0
      (a ⊗ₜ[R] (e ⊗ₜ[R] TensorPower.algebraMap₀ (R := R) (M := Q) 1)) =
      (a ⊗ₜ[R] e) ⊗ₜ[S] TensorPower.algebraMap₀ (R := S) (M := S ⊗[R] Q) 1 := sorry

-- test: TwistedHiggsBundle.affineOrderedBaseChange.test_torsion_degree_two
example (θ : ZMod 2 →ₗ[ℤ] (ZMod 2) ⊗[ℤ] (ZMod 2)) :
    (affineOrderedBaseChange ℤ 2).toLinearMap.comp
      ((affineOrderedIterate θ 2).baseChange ℤ) =
      affineOrderedIterate (affineBaseChange ℤ θ) 2 := sorry

-- test: TwistedHiggsBundle.affineOrderedBaseChange.test_zero_module
example (n : ℕ) (x : S ⊗[R] ((Fin 0 → R) ⊗[R] TensorPower R n Q)) :
    affineOrderedBaseChange S n x = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_preservation
example (θ : ZMod 4 →ₗ[ℤ] (ZMod 4) ⊗[ℤ] (ZMod 2)) (n : ℕ)
    (h : affineOrderedIterate θ n = 0) :
    affineOrderedIterate (affineBaseChange (ZMod 2) θ) n = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_reflection
example (θ : ZMod 4 →ₗ[ℤ] (ZMod 4) ⊗[ℤ] (ZMod 2)) (n : ℕ) :
    affineOrderedIterate (affineBaseChange ℤ θ) n = 0 ↔ affineOrderedIterate θ n = 0 := sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_arbitrary_coefficient_degree_zero
example [Nontrivial R] [Module.FaithfullyFlat R S] (θ : R →ₗ[R] R ⊗[R] Q) :
    affineOrderedIterate (affineBaseChange S θ) 0 ≠ 0 := sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/- Affine-local planning continuation: actual native proof archived separately. -/

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]
variable {F P : Type*} [AddCommGroup F] [Module S F]
variable [AddCommGroup P] [Module S P]

/-- The actual restricted field in specified module charts. -/
def affineChartField (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F) (q : S ⊗[R] Q ≃ₗ[S] P) : F →ₗ[S] F ⊗[S] P := by
  sorry

lemma affineChartField_horizontal (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F) (q : S ⊗[R] Q ≃ₗ[S] P) :
    (affineChartField S θ e q).comp e.toLinearMap =
      (TensorProduct.map e.toLinearMap q.toLinearMap).comp (affineBaseChange S θ) := by
  sorry

lemma affineChartField_zero (e : S ⊗[R] E ≃ₗ[S] F)
    (q : S ⊗[R] Q ≃ₗ[S] P) : affineChartField S (0 : E →ₗ[R] E ⊗[R] Q) e q = 0 := by
  sorry

lemma affineChartField_refl (θ : E →ₗ[R] E ⊗[R] Q) :
    affineChartField S θ (LinearEquiv.refl S _) (LinearEquiv.refl S _) =
      affineBaseChange S θ := by
  sorry

lemma affineOrderedIterate_chart_comparison (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F) (q : S ⊗[R] Q ≃ₗ[S] P) (n : ℕ) :
    (affineOrderedIterate (affineChartField S θ e q) n).comp e.toLinearMap =
      (TensorProduct.map e.toLinearMap
        (PiTensorProduct.map (fun _ : Fin n => q.toLinearMap))).comp
          ((affineOrderedBaseChange S n).toLinearMap.comp
            ((affineOrderedIterate θ n).baseChange S)) := by
  sorry

lemma affineOrderedIterate_chart_zero_iff (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F) (q : S ⊗[R] Q ≃ₗ[S] P) (n : ℕ) :
    affineOrderedIterate (affineChartField S θ e q) n = 0 ↔
      affineOrderedIterate (affineBaseChange S θ) n = 0 := by
  sorry

lemma affineOrderedIterate_chart_zero_of (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F) (q : S ⊗[R] Q ≃ₗ[S] P) (n : ℕ)
    (h : affineOrderedIterate θ n = 0) :
    affineOrderedIterate (affineChartField S θ e q) n = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (s : Set R) (hs : Ideal.span s = ⊤)
include hs
variable (A : s → Type*) [∀ r, CommRing (A r)] [∀ r, Algebra R (A r)]
variable [∀ r : s, IsLocalization.Away r.val (A r)]

lemma affineOrderedIterate_away_cover_zero_iff (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    (∀ r : s, affineOrderedIterate (affineBaseChange (A r) θ) n = 0) ↔
      affineOrderedIterate θ n = 0 := by
  sorry

variable (F P : s → Type*) [∀ r, AddCommGroup (F r)] [∀ r, Module (A r) (F r)]
variable [∀ r, AddCommGroup (P r)] [∀ r, Module (A r) (P r)]
variable (e : ∀ r, (A r) ⊗[R] E ≃ₗ[A r] F r)
variable (q : ∀ r, (A r) ⊗[R] Q ≃ₗ[A r] P r)

lemma affineOrderedIterate_chart_cover_zero_iff (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    (∀ r : s, affineOrderedIterate (affineChartField (A r) θ (e r) (q r)) n = 0) ↔
      affineOrderedIterate θ n = 0 := by
  sorry

lemma affineOrderedIterate_finite_chart_bound [Fintype s]
    (θ : E →ₗ[R] E ⊗[R] Q) (N : s → ℕ)
    (h : ∀ r : s, affineOrderedIterate (affineChartField (A r) θ (e r) (q r)) (N r) = 0) :
    affineOrderedIterate θ (1 + Finset.univ.sup N) = 0 := by
  sorry

lemma affineOrderedIterate_chart_local_nilpotent_iff (θ : E →ₗ[R] E ⊗[R] Q) :
    (∀ r : s, ∃ n : ℕ, 0 < n ∧
      affineOrderedIterate (affineChartField (A r) θ (e r) (q r)) n = 0) ↔
      ∃ n : ℕ, 0 < n ∧ affineOrderedIterate θ n = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]

-- test: TwistedHiggsBundle.affineChartField.test_refl
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineChartField S θ (LinearEquiv.refl S _) (LinearEquiv.refl S _) =
      affineBaseChange S θ := by
  sorry

-- test: TwistedHiggsBundle.affineChartField.test_zero
example {F P : Type*} [AddCommGroup F] [Module S F] [AddCommGroup P] [Module S P]
    (e : S ⊗[R] E ≃ₗ[S] F) (q : S ⊗[R] Q ≃ₗ[S] P) :
    affineChartField S (0 : E →ₗ[R] E ⊗[R] Q) e q = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineChartField.test_coeff_sign
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineChartField S θ (LinearEquiv.refl S _)
      (LinearEquiv.neg S : S ⊗[R] Q ≃ₗ[S] S ⊗[R] Q) =
      (-1 : S) • affineBaseChange S θ := by
  sorry

-- test: TwistedHiggsBundle.affineChartField.test_projective_unbased
example [Module.Projective R E] [Module.Projective R Q] (θ : E →ₗ[R] E ⊗[R] Q)
    (n : ℕ) (h : affineOrderedIterate θ n = 0) :
    affineOrderedIterate (affineChartField S θ
      (LinearEquiv.refl S _) (LinearEquiv.refl S _)) n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineChartField.test_noncover_erasure
local instance : Module ℤ (Localization.Away (2 : ℤ)) := Algebra.toModule

example :
    let A := Localization.Away (2 : ℤ)
    let θ := (TensorProduct.rid ℤ (ZMod 2)).symm.toLinearMap
    θ ≠ 0 ∧ affineBaseChange A θ = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct

-- test: TwistedHiggsBundle.affineChartField.test_two_principal_opens
example (θ : ZMod 4 →ₗ[ℤ] (ZMod 4) ⊗[ℤ] (ZMod 2)) (n : ℕ) :
    (∀ r : ({2, 3} : Set ℤ), affineOrderedIterate
      (affineBaseChange (Localization.Away r.val) θ) n = 0) ↔
      affineOrderedIterate θ n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineChartField.test_degree_zero_cover
example {R Q : Type*} [CommRing R] [Nontrivial R] [AddCommGroup Q] [Module R Q]
    (s : Set R) (hs : Ideal.span s = ⊤) (A : s → Type*)
    [∀ r, CommRing (A r)] [∀ r, Algebra R (A r)]
    [∀ r : s, IsLocalization.Away r.val (A r)] (θ : R →ₗ[R] R ⊗[R] Q) :
    ¬ ∀ r : s, affineOrderedIterate (affineBaseChange (A r) θ) 0 = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]
variable {F₁ F₂ P₁ P₂ : Type*}
variable [AddCommGroup F₁] [Module S F₁] [AddCommGroup F₂] [Module S F₂]
variable [AddCommGroup P₁] [Module S P₁] [AddCommGroup P₂] [Module S P₂]


lemma affineChartField_eq_iff_horizontal (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F₁) (q : S ⊗[R] Q ≃ₗ[S] P₁)
    (ψ : F₁ →ₗ[S] F₁ ⊗[S] P₁) :
    ψ = affineChartField S θ e q ↔
      ψ.comp e.toLinearMap =
        (TensorProduct.map e.toLinearMap q.toLinearMap).comp (affineBaseChange S θ) := by sorry

lemma affineChartField_transition (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) :
    (affineChartField S θ e₂ q₂).comp (e₁.symm.trans e₂).toLinearMap =
      (TensorProduct.map (e₁.symm.trans e₂).toLinearMap
        (q₁.symm.trans q₂).toLinearMap).comp (affineChartField S θ e₁ q₁) := by sorry

lemma affineOrderedIterate_chart_transition (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) (n : ℕ) :
    (affineOrderedIterate (affineChartField S θ e₂ q₂) n).comp
        (e₁.symm.trans e₂).toLinearMap =
      (TensorProduct.map (e₁.symm.trans e₂).toLinearMap
        (PiTensorProduct.map (fun _ : Fin n => (q₁.symm.trans q₂).toLinearMap))).comp
          (affineOrderedIterate (affineChartField S θ e₁ q₁) n) := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_horizontal_unique
example (θ : E →ₗ[R] E ⊗[R] Q)
    (e : S ⊗[R] E ≃ₗ[S] F₁) (q : S ⊗[R] Q ≃ₗ[S] P₁)
    (ψ χ : F₁ →ₗ[S] F₁ ⊗[S] P₁)
    (hψ : ψ.comp e.toLinearMap =
      (TensorProduct.map e.toLinearMap q.toLinearMap).comp (affineBaseChange S θ))
    (hχ : χ.comp e.toLinearMap =
      (TensorProduct.map e.toLinearMap q.toLinearMap).comp (affineBaseChange S θ)) :
    ψ = χ := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_chart_roundtrip
example (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) (n : ℕ) :
    (affineOrderedIterate (affineChartField S θ e₁ q₁) n).comp
        (e₂.symm.trans e₁).toLinearMap =
      (TensorProduct.map (e₂.symm.trans e₁).toLinearMap
        (PiTensorProduct.map (fun _ : Fin n => (q₂.symm.trans q₁).toLinearMap))).comp
          (affineOrderedIterate (affineChartField S θ e₂ q₂) n) := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_empty_word_transition
example (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (_q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) (x : F₁) :
    affineOrderedIterate (affineChartField S θ e₂ q₂) 0 ((e₁.symm.trans e₂) x) =
      ((e₁.symm.trans e₂) x) ⊗ₜ[S]
        (TensorPower.algebraMap₀ (R := S) (M := P₂) 1) := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_sign_overlap
example (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineChartField S θ (LinearEquiv.refl S _)
      (LinearEquiv.neg S)) n =
      (TensorProduct.map (LinearMap.id : S ⊗[R] E →ₗ[S] S ⊗[R] E)
        (PiTensorProduct.map (fun _ : Fin n => (LinearEquiv.neg S).toLinearMap))).comp
          (affineOrderedIterate (affineBaseChange S θ) n) := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_missing_coefficient_transition
example :
    (TensorProduct.map (LinearMap.id : ℤ →ₗ[ℤ] ℤ) (LinearEquiv.neg ℤ).toLinearMap)
      ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) ≠ (1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ) := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_triple_overlap
example {F₃ P₃ : Type*} [AddCommGroup F₃] [Module S F₃]
    [AddCommGroup P₃] [Module S P₃]
    (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂)
    (e₃ : S ⊗[R] E ≃ₗ[S] F₃) (q₃ : S ⊗[R] Q ≃ₗ[S] P₃) (n : ℕ) :
    (affineOrderedIterate (affineChartField S θ e₃ q₃) n).comp
        (((e₁.symm.trans e₂).trans (e₂.symm.trans e₃)).toLinearMap) =
      (TensorProduct.map ((e₁.symm.trans e₂).trans (e₂.symm.trans e₃)).toLinearMap
        (PiTensorProduct.map (fun _ : Fin n =>
          ((q₁.symm.trans q₂).trans (q₂.symm.trans q₃)).toLinearMap))).comp
          (affineOrderedIterate (affineChartField S θ e₁ q₁) n) := by sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/-! Affine exterior-square and commutator continuation. Global sheaf and cross-ring exterior comparison remain explicit supplier obligations. -/

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q P : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]

/-- The actual degree-two exterior projection of the ordered Higgs iterate. -/
def affineExteriorSquare (θ : E →ₗ[R] E ⊗[R] Q) : E →ₗ[R] E ⊗[R] (⋀[R]^2 Q) := by sorry

lemma affineExteriorSquare_zero :
    affineExteriorSquare (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by sorry

lemma affineExteriorSquare_natural (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (h : ψ.comp f = (TensorProduct.map f u).comp θ) :
    (affineExteriorSquare ψ).comp f =
      (TensorProduct.map f (exteriorPower.map 2 u)).comp (affineExteriorSquare θ) := by sorry

lemma affineExteriorSquare_equiv_zero_iff (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] P) (f : E ≃ₗ[R] F) (u : Q ≃ₗ[R] P)
    (h : ψ.comp f.toLinearMap = (TensorProduct.map f.toLinearMap u.toLinearMap).comp θ) :
    affineExteriorSquare ψ = 0 ↔ affineExteriorSquare θ = 0 := by sorry

lemma affineExteriorSquare_coefficientMap (θ : E →ₗ[R] E ⊗[R] Q) (u : Q →ₗ[R] P) :
    affineExteriorSquare (affineCoefficientMap θ u) =
      (TensorProduct.map (LinearMap.id : E →ₗ[R] E) (exteriorPower.map 2 u)).comp
        (affineExteriorSquare θ) := by sorry

lemma affineExteriorSquare_coefficientMap_zero (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q →ₗ[R] P) (h : affineExteriorSquare θ = 0) :
    affineExteriorSquare (affineCoefficientMap θ u) = 0 := by sorry

lemma affineExteriorSquare_coefficientEquiv_zero_iff (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q ≃ₗ[R] P) :
    affineExteriorSquare (affineCoefficientMap θ u.toLinearMap) = 0 ↔
      affineExteriorSquare θ = 0 := by sorry

/-- A field with two specified coefficient directions, with no basis assumption. -/
def affineTwoDirectionField (A B : E →ₗ[R] E) (q r : Q) : E →ₗ[R] E ⊗[R] Q := by sorry

lemma affineTwoDirectionField_apply (A B : E →ₗ[R] E) (q r : Q) (e : E) :
    affineTwoDirectionField A B q r e = A e ⊗ₜ[R] q + B e ⊗ₜ[R] r := by sorry

lemma affineExteriorSquare_twoDirection (A B : E →ₗ[R] E) (q r : Q) (e : E) :
    affineExteriorSquare (affineTwoDirectionField A B q r) e =
      (A (B e) - B (A e)) ⊗ₜ[R] exteriorPower.ιMulti R 2 ![q,r] := by sorry

lemma affineExteriorSquare_twoDirection_zero_of_commute (A B : E →ₗ[R] E)
    (q r : Q) (h : A.comp B = B.comp A) :
    affineExteriorSquare (affineTwoDirectionField A B q r) = 0 := by sorry

lemma affineExteriorSquare_twoDirection_zero_iff (A B : E →ₗ[R] E) (q r : Q)
    (l : Module.Dual R (⋀[R]^2 Q)) (hl : l (exteriorPower.ιMulti R 2 ![q,r]) = 1) :
    affineExteriorSquare (affineTwoDirectionField A B q r) = 0 ↔ A.comp B = B.comp A := by sorry

lemma affineExteriorSquare_twoCoordinates_zero_iff (A B : E →ₗ[R] E) :
    affineExteriorSquare (affineTwoDirectionField A B ((1,0) : R × R) (0,1)) = 0 ↔
      A.comp B = B.comp A := by sorry

variable (S : Type*) [CommRing S] [Algebra R S]
variable {F₁ F₂ P₁ P₂ : Type*}
variable [AddCommGroup F₁] [Module S F₁] [AddCommGroup F₂] [Module S F₂]
variable [AddCommGroup P₁] [Module S P₁] [AddCommGroup P₂] [Module S P₂]

lemma affineExteriorSquare_chart_transition (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) :
    (affineExteriorSquare (affineChartField S θ e₂ q₂)).comp (e₁.symm.trans e₂).toLinearMap =
      (TensorProduct.map (e₁.symm.trans e₂).toLinearMap
        (exteriorPower.map 2 (q₁.symm.trans q₂).toLinearMap)).comp
          (affineExteriorSquare (affineChartField S θ e₁ q₁)) := by sorry

lemma affineExteriorSquare_chart_zero_iff (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) :
    affineExteriorSquare (affineChartField S θ e₂ q₂) = 0 ↔
      affineExteriorSquare (affineChartField S θ e₁ q₁) = 0 := by sorry

lemma affineOrderedIterate_unitField (n : ℕ) (e : R) :
    affineOrderedIterate (TensorProduct.rid R R).symm.toLinearMap n e =
      e ⊗ₜ[R] PiTensorProduct.tprod R (fun _ : Fin n => (1 : R)) := by sorry

lemma affineOrderedIterate_unitField_ne_zero [Nontrivial R] (n : ℕ) :
    affineOrderedIterate (TensorProduct.rid R R).symm.toLinearMap n ≠ 0 := by sorry

set_option backward.isDefEq.respectTransparency.types false

-- test: TwistedHiggsBundle.affineExteriorSquare.test_zero
example :
    affineExteriorSquare (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_torsion_coefficients
example
    (θ : ℤ →ₗ[ℤ] ℤ ⊗[ℤ] (ZMod 2)) :
    affineExteriorSquare (affineCoefficientMap θ (0 : ZMod 2 →ₗ[ℤ] ZMod 3)) = 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_scalar_line
example :
    let θ := (TensorProduct.rid ℤ ℤ).symm.toLinearMap
    affineExteriorSquare θ = 0 ∧ affineOrderedSquare θ ≠ 0 := by sorry

-- test: TwistedHiggsBundle.affineTwoDirectionField.test_apply
example (A B : E →ₗ[R] E) (q r : Q) (e : E) :
    affineTwoDirectionField A B q r e = A e ⊗ₜ[R] q + B e ⊗ₜ[R] r := by sorry

-- test: TwistedHiggsBundle.affineTwoDirectionField.test_zero
example (q r : Q) :
    affineTwoDirectionField (0 : E →ₗ[R] E) 0 q r = 0 := by sorry

-- test: TwistedHiggsBundle.affineTwoDirectionField.test_dependent_directions
example (A B : E →ₗ[R] E) (q : Q) :
    affineExteriorSquare (affineTwoDirectionField A B q q) = 0 := by sorry

-- test: TwistedHiggsBundle.affineTwoDirectionField.test_commutator_detection
example (A B : E →ₗ[R] E) :
    affineExteriorSquare (affineTwoDirectionField A B ((1,0) : R × R) (0,1)) = 0 ↔
      A.comp B = B.comp A := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_noncommuting_integer
example :
    let A := (LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.snd ℤ ℤ ℤ)
    let B := (LinearMap.inr ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)
    affineExteriorSquare (affineTwoDirectionField A B ((1,0) : ℤ × ℤ) (0,1)) ≠ 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_noncommuting_char_two
example :
    let A := (LinearMap.inl (ZMod 2) (ZMod 2) (ZMod 2)).comp (LinearMap.snd (ZMod 2) (ZMod 2) (ZMod 2))
    let B := (LinearMap.inr (ZMod 2) (ZMod 2) (ZMod 2)).comp (LinearMap.fst (ZMod 2) (ZMod 2) (ZMod 2))
    affineExteriorSquare (affineTwoDirectionField A B ((1,0) : ZMod 2 × ZMod 2) (0,1)) ≠ 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_coefficient_erasure
example :
    let A := (LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.snd ℤ ℤ ℤ)
    let B := (LinearMap.inr ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)
    let θ := affineTwoDirectionField A B ((1,0) : ℤ × ℤ) (0,1)
    affineExteriorSquare θ ≠ 0 ∧
      affineExteriorSquare (affineCoefficientMap θ (0 : (ℤ × ℤ) →ₗ[ℤ] ℤ)) = 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_coefficient_equiv
example (θ : E →ₗ[R] E ⊗[R] Q) (u : Q ≃ₗ[R] P) :
    affineExteriorSquare (affineCoefficientMap θ u.toLinearMap) = 0 ↔
      affineExteriorSquare θ = 0 := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_exterior_transition
example (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) :
    (affineExteriorSquare (affineChartField S θ e₂ q₂)).comp (e₁.symm.trans e₂).toLinearMap =
      (TensorProduct.map (e₁.symm.trans e₂).toLinearMap
        (exteriorPower.map 2 (q₁.symm.trans q₂).toLinearMap)).comp
          (affineExteriorSquare (affineChartField S θ e₁ q₁)) := by sorry

-- test: TwistedHiggsBundle.affineChartField.test_exterior_zero_iff
example (θ : E →ₗ[R] E ⊗[R] Q)
    (e₁ : S ⊗[R] E ≃ₗ[S] F₁) (q₁ : S ⊗[R] Q ≃ₗ[S] P₁)
    (e₂ : S ⊗[R] E ≃ₗ[S] F₂) (q₂ : S ⊗[R] Q ≃ₗ[S] P₂) :
    affineExteriorSquare (affineChartField S θ e₂ q₂) = 0 ↔
      affineExteriorSquare (affineChartField S θ e₁ q₁) = 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_degree_two_not_nilpotence
example :
    let θ := (TensorProduct.rid ℤ ℤ).symm.toLinearMap
    affineExteriorSquare θ = 0 ∧ affineOrderedIterate θ 2 ≠ 0 := by sorry

-- test: TwistedHiggsBundle.affineExteriorSquare.test_integrable_not_nilpotent
example :
    let θ := (TensorProduct.rid ℤ ℤ).symm.toLinearMap
    affineExteriorSquare θ = 0 ∧ ∀ n : ℕ, affineOrderedIterate θ n ≠ 0 := by sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/- Finite-coordinate exterior integrability; affine native signatures only. -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup Q] [Module R Q]
variable {I : Type*} [Fintype I]

def affineFiniteDirectionField (A : I → Module.End R E) (q : I → Q) :
    E →ₗ[R] E ⊗[R] Q := sorry

lemma affineFiniteDirectionField_apply (A : I → Module.End R E) (q : I → Q) (e : E) :
    affineFiniteDirectionField A q e = ∑ i, A i e ⊗ₜ[R] q i := sorry

lemma affineFiniteDirectionField_reconstruct (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) :
    affineFiniteDirectionField (fun i => affineContractions θ (b.coord i)) b = θ := sorry

lemma affineExteriorSquare_finiteDirection (A : I → Module.End R E) (q : I → Q) (e : E) :
    affineExteriorSquare (affineFiniteDirectionField A q) e =
      ∑ j, ∑ i, A i (A j e) ⊗ₜ[R] exteriorPower.ιMulti R 2 ![q i,q j] := sorry

lemma affineExteriorSquare_finiteDirection_zero_of_commute
    (A : I → Module.End R E) (q : I → Q) (h : ∀ i j, A i * A j = A j * A i) :
    affineExteriorSquare (affineFiniteDirectionField A q) = 0 := sorry

lemma affineExteriorSquare_contraction (θ : E →ₗ[R] E ⊗[R] Q)
    (v w : Module.Dual R Q) :
    affineContractions (affineExteriorSquare θ)
      (exteriorPower.alternatingMapToDual R Q 2 ![v,w]) =
    affineContractions θ v * affineContractions θ w -
      affineContractions θ w * affineContractions θ v := sorry

lemma affineFiniteDirectionField_contraction (A : I → Module.End R E) (q : I → Q)
    (v : Module.Dual R Q) :
    affineContractions (affineFiniteDirectionField A q) v = ∑ i, v (q i) • A i := sorry

lemma affineFiniteDirectionField_coordinate (b : Module.Basis I R Q)
    (A : I → Module.End R E) (i : I) :
    affineContractions (affineFiniteDirectionField A b) (b.coord i) = A i := sorry

lemma affineExteriorSquare_zero_commute (θ : E →ₗ[R] E ⊗[R] Q)
    (h : affineExteriorSquare θ = 0) (v w : Module.Dual R Q) :
    affineContractions θ v * affineContractions θ w =
      affineContractions θ w * affineContractions θ v := sorry

lemma affineExteriorSquare_finiteBasis_zero_iff (b : Module.Basis I R Q)
    (A : I → Module.End R E) :
    affineExteriorSquare (affineFiniteDirectionField A b) = 0 ↔
      ∀ i j, A i * A j = A j * A i := sorry

lemma affineExteriorSquare_coordinate_zero_iff (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) :
    affineExteriorSquare θ = 0 ↔ ∀ i j,
      affineContractions θ (b.coord i) * affineContractions θ (b.coord j) =
      affineContractions θ (b.coord j) * affineContractions θ (b.coord i) := sorry

lemma affineExteriorSquare_dual_zero_iff (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) :
    affineExteriorSquare θ = 0 ↔ ∀ v w : Module.Dual R Q,
      affineContractions θ v * affineContractions θ w =
      affineContractions θ w * affineContractions θ v := sorry

lemma affineExteriorSquare_coordinates_basis_independent
    {J : Type*} [Fintype J] (b : Module.Basis I R Q) (c : Module.Basis J R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) :
    (∀ i j, affineContractions θ (b.coord i) * affineContractions θ (b.coord j) =
      affineContractions θ (b.coord j) * affineContractions θ (b.coord i)) ↔
    (∀ i j, affineContractions θ (c.coord i) * affineContractions θ (c.coord j) =
      affineContractions θ (c.coord j) * affineContractions θ (c.coord i)) := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_apply
example (A : I → Module.End R E) (q : I → Q) (e : E) :
    affineFiniteDirectionField A q e = ∑ i, A i e ⊗ₜ[R] q i := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_empty
example (A : Fin 0 → Module.End R E) (q : Fin 0 → Q) :
    affineFiniteDirectionField A q = 0 := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_zero
example (q : I → Q) :
    affineFiniteDirectionField (fun _ => (0 : Module.End R E)) q = 0 := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_reconstruct
example (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) :
    affineFiniteDirectionField (fun i => affineContractions θ (b.coord i)) b = θ := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_coordinate
example (b : Module.Basis I R Q)
    (A : I → Module.End R E) (i : I) :
    affineContractions (affineFiniteDirectionField A b) (b.coord i) = A i := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_dependent
example (A : I → Module.End R E) (q : Q) :
    affineExteriorSquare (affineFiniteDirectionField A (fun _ => q)) = 0 := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_one_direction
example (A : Module.End R E) (q : Q) :
    affineExteriorSquare (affineFiniteDirectionField (fun _ : Fin 1 => A)
      (fun _ => q)) = 0 := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_torsion_module
example :
    affineExteriorSquare (affineFiniteDirectionField
      (fun _ : Fin 1 => (LinearMap.id : ZMod 2 →ₗ[ℤ] ZMod 2))
      (fun _ => (1 : ℤ))) = 0 := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_char_two_three_coordinates
example :
    let b := Pi.basisFun (ZMod 2) (Fin 3)
    let A := (LinearMap.inl (ZMod 2) (ZMod 2) (ZMod 2)).comp
      (LinearMap.snd (ZMod 2) (ZMod 2) (ZMod 2))
    let B := (LinearMap.inr (ZMod 2) (ZMod 2) (ZMod 2)).comp
      (LinearMap.fst (ZMod 2) (ZMod 2) (ZMod 2))
    affineExteriorSquare (affineFiniteDirectionField ![A,B,0] b) ≠ 0 := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_all_duals
example (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) :
    affineExteriorSquare θ = 0 ↔ ∀ v w : Module.Dual R Q,
      affineContractions θ v * affineContractions θ w =
      affineContractions θ w * affineContractions θ v := sorry

-- test: TwistedHiggsBundle.affineFiniteDirectionField.test_basis_independent
example {J : Type*} [Fintype J]
    (b : Module.Basis I R Q) (c : Module.Basis J R Q) (θ : E →ₗ[R] E ⊗[R] Q) :
    (∀ i j, affineContractions θ (b.coord i) * affineContractions θ (b.coord j) =
      affineContractions θ (b.coord j) * affineContractions θ (b.coord i)) ↔
    (∀ i j, affineContractions θ (c.coord i) * affineContractions θ (c.coord j) =
      affineContractions θ (c.coord j) * affineContractions θ (c.coord i)) := sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/- BEGIN AFFINE HIGGS TENSOR FIELD -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q]

def affineTensorField (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    E ⊗[R] F →ₗ[R] (E ⊗[R] F) ⊗[R] Q := by sorry

lemma affineTensorField_tmul (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (e : E) (f : F) :
    affineTensorField θ ψ (e ⊗ₜ[R] f) =
      TensorProduct.rightComm R E Q F (θ e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F Q).symm (e ⊗ₜ[R] ψ f) := by sorry

lemma affineTensorField_zero :
    affineTensorField (0 : E →ₗ[R] E ⊗[R] Q) (0 : F →ₗ[R] F ⊗[R] Q) = 0 := by sorry

lemma affineTensorField_contractions (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (v : Module.Dual R Q) :
    affineContractions (affineTensorField θ ψ) v =
      TensorProduct.map (affineContractions θ v) (LinearMap.id : F →ₗ[R] F) +
        TensorProduct.map (LinearMap.id : E →ₗ[R] E) (affineContractions ψ v) := by sorry

lemma affineTensorField_contractions_commute
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (v w : Module.Dual R Q)
    (hθ : affineContractions θ v * affineContractions θ w =
      affineContractions θ w * affineContractions θ v)
    (hψ : affineContractions ψ v * affineContractions ψ w =
      affineContractions ψ w * affineContractions ψ v) :
    affineContractions (affineTensorField θ ψ) v * affineContractions (affineTensorField θ ψ) w =
      affineContractions (affineTensorField θ ψ) w * affineContractions (affineTensorField θ ψ) v := by sorry

lemma affineTensorField_integrable {I : Type*} [Fintype I] (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : affineExteriorSquare θ = 0) (hψ : affineExteriorSquare ψ = 0) :
    affineExteriorSquare (affineTensorField θ ψ) = 0 := by sorry

lemma affineTensorField_coefficientMap {P : Type*} [AddCommGroup P] [Module R P]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (u : Q →ₗ[R] P) :
    affineCoefficientMap (affineTensorField θ ψ) u =
      affineTensorField (affineCoefficientMap θ u) (affineCoefficientMap ψ u) := by sorry

lemma affineTensorField_horizontal {E' F' : Type*}
    [AddCommGroup E'] [Module R E'] [AddCommGroup F'] [Module R F']
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (θ' : E' →ₗ[R] E' ⊗[R] Q) (ψ' : F' →ₗ[R] F' ⊗[R] Q)
    (f : E →ₗ[R] E') (g : F →ₗ[R] F')
    (hf : θ'.comp f = (TensorProduct.map f (LinearMap.id : Q →ₗ[R] Q)).comp θ)
    (hg : ψ'.comp g = (TensorProduct.map g (LinearMap.id : Q →ₗ[R] Q)).comp ψ) :
    (affineTensorField θ' ψ').comp (TensorProduct.map f g) =
      (TensorProduct.map (TensorProduct.map f g) (LinearMap.id : Q →ₗ[R] Q)).comp
        (affineTensorField θ ψ) := by sorry

lemma affineTensorField_comm (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    (affineTensorField ψ θ).comp (TensorProduct.comm R E F).toLinearMap =
      (TensorProduct.map (TensorProduct.comm R E F).toLinearMap
        (LinearMap.id : Q →ₗ[R] Q)).comp (affineTensorField θ ψ) := by sorry

lemma affineTensorField_rid (θ : E →ₗ[R] E ⊗[R] Q) :
    θ.comp (TensorProduct.rid R E).toLinearMap =
      (TensorProduct.map (TensorProduct.rid R E).toLinearMap
        (LinearMap.id : Q →ₗ[R] Q)).comp
          (affineTensorField θ (0 : R →ₗ[R] R ⊗[R] Q)) := by sorry

lemma affineTensorField_lid (θ : E →ₗ[R] E ⊗[R] Q) :
    θ.comp (TensorProduct.lid R E).toLinearMap =
      (TensorProduct.map (TensorProduct.lid R E).toLinearMap
        (LinearMap.id : Q →ₗ[R] Q)).comp
          (affineTensorField (0 : R →ₗ[R] R ⊗[R] Q) θ) := by sorry

lemma affineTensorField_assoc {G : Type*} [AddCommGroup G] [Module R G]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (χ : G →ₗ[R] G ⊗[R] Q) :
    (affineTensorField θ (affineTensorField ψ χ)).comp
        (TensorProduct.assoc R E F G).toLinearMap =
      (TensorProduct.map (TensorProduct.assoc R E F G).toLinearMap
        (LinearMap.id : Q →ₗ[R] Q)).comp
          (affineTensorField (affineTensorField θ ψ) χ) := by sorry

-- test: TwistedHiggsBundle.affineTensorField.test_zero
example :
    affineTensorField (0 : E →ₗ[R] E ⊗[R] Q) (0 : F →ₗ[R] F ⊗[R] Q) = 0 := by sorry

-- test: TwistedHiggsBundle.affineTensorField.test_integer_sum
example :
    affineTensorField (TensorProduct.rid ℤ ℤ).symm.toLinearMap
      (TensorProduct.rid ℤ ℤ).symm.toLinearMap (1 ⊗ₜ[ℤ] 1) =
        ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[ℤ] (2 : ℤ) := by sorry

-- test: TwistedHiggsBundle.affineTensorField.test_char_two_cancellation
example :
    (TensorProduct.rid (ZMod 2) (ZMod 2)).symm.toLinearMap ≠ 0 ∧
    affineTensorField (TensorProduct.rid (ZMod 2) (ZMod 2)).symm.toLinearMap
      (TensorProduct.rid (ZMod 2) (ZMod 2)).symm.toLinearMap = 0 := by sorry

-- test: TwistedHiggsBundle.affineTensorField.test_torsion_integrability
example :
    affineExteriorSquare (affineTensorField
      (affineFiniteDirectionField (fun _ : Fin 1 => (LinearMap.id : ZMod 2 →ₗ[ℤ] ZMod 2))
        (fun _ => (1 : ℤ)))
      (affineFiniteDirectionField (fun _ : Fin 1 => (LinearMap.id : ZMod 4 →ₗ[ℤ] ZMod 4))
        (fun _ => (1 : ℤ)))) = 0 := by sorry

-- test: TwistedHiggsBundle.affineTensorField.test_zero_direction_map
example {P : Type*} [AddCommGroup P] [Module R P]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    affineTensorField (affineCoefficientMap θ (0 : Q →ₗ[R] P))
      (affineCoefficientMap ψ (0 : Q →ₗ[R] P)) = 0 := by sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
/- END AFFINE HIGGS TENSOR FIELD -/

/- BEGIN AFFINE TENSOR CURVATURE -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q]

-- Native expression of the existing binary tensor-to-exterior projection.
abbrev pairExterior : Q ⊗[R] Q →ₗ[R] (⋀[R]^2 Q) :=
  (PiTensorProduct.lift (exteriorPower.ιMulti R 2).toMultilinearMap).comp
    ((TensorProduct.congr
      (PiTensorProduct.subsingletonEquiv (R := R) (s := fun _ : Fin 1 => Q) 0).symm
      (PiTensorProduct.subsingletonEquiv (R := R) (s := fun _ : Fin 1 => Q) 0).symm).trans
        (TensorPower.mulEquiv (n := 1) (m := 1))).toLinearMap

lemma pairExterior_tmul (q r : Q) :
    pairExterior (q ⊗ₜ[R] r) = exteriorPower.ιMulti R 2 ![q,r] := by
  simp only [pairExterior, LinearMap.comp_apply, LinearEquiv.coe_coe,
    LinearEquiv.trans_apply, TensorProduct.congr_tmul,
    PiTensorProduct.subsingletonEquiv_symm_apply']
  simp only [← TensorPower.gMul_def, TensorPower.tprod_mul_tprod,
    PiTensorProduct.lift.tprod]
  rfl

def affineExteriorStep (θ : E →ₗ[R] E ⊗[R] Q) :
    E ⊗[R] Q →ₗ[R] E ⊗[R] (⋀[R]^2 Q) := by
  sorry

lemma affineExteriorSquare_eq_step (θ : E →ₗ[R] E ⊗[R] Q) :
    affineExteriorSquare θ = (affineExteriorStep θ).comp θ := by
  sorry

lemma affineExteriorStep_tmul (θ : E →ₗ[R] E ⊗[R] Q) (e : E) (q : Q) :
    affineExteriorStep θ (e ⊗ₜ[R] q) =
      TensorProduct.map (LinearMap.id : E →ₗ[R] E) pairExterior
        (TensorProduct.assoc R E Q Q (θ e ⊗ₜ[R] q)) := by
  sorry

lemma affineExteriorStep_add (θ ψ : E →ₗ[R] E ⊗[R] Q) :
    affineExteriorStep (θ + ψ) = affineExteriorStep θ + affineExteriorStep ψ := by
  sorry

lemma affineExteriorStep_zero :
    affineExteriorStep (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by
  sorry

def affineTensorWedgePair :
    (E ⊗[R] Q) ⊗[R] (F ⊗[R] Q) →ₗ[R] (E ⊗[R] F) ⊗[R] (⋀[R]^2 Q) := by
  sorry

lemma affineTensorWedgePair_tmul (e : E) (f : F) (q r : Q) :
    affineTensorWedgePair ((e ⊗ₜ[R] q) ⊗ₜ[R] (f ⊗ₜ[R] r)) =
      (e ⊗ₜ[R] f) ⊗ₜ[R] exteriorPower.ιMulti R 2 ![q,r] := by
  sorry

lemma affineExteriorStep_tensor_left
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (z : E ⊗[R] Q) (f : F) :
    affineExteriorStep (affineTensorField θ ψ) (TensorProduct.rightComm R E Q F (z ⊗ₜ[R] f)) =
      TensorProduct.rightComm R E (⋀[R]^2 Q) F (affineExteriorStep θ z ⊗ₜ[R] f) -
        affineTensorWedgePair (z ⊗ₜ[R] ψ f) := by
  sorry

lemma affineExteriorStep_tensor_right
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (e : E) (w : F ⊗[R] Q) :
    affineExteriorStep (affineTensorField θ ψ) ((TensorProduct.assoc R E F Q).symm (e ⊗ₜ[R] w)) =
      affineTensorWedgePair (θ e ⊗ₜ[R] w) +
        (TensorProduct.assoc R E F (⋀[R]^2 Q)).symm (e ⊗ₜ[R] affineExteriorStep ψ w) := by
  sorry

lemma affineTensorField_curvature_tmul
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (e : E) (f : F) :
    affineExteriorSquare (affineTensorField θ ψ) (e ⊗ₜ[R] f) =
      TensorProduct.rightComm R E (⋀[R]^2 Q) F (affineExteriorSquare θ e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F (⋀[R]^2 Q)).symm (e ⊗ₜ[R] affineExteriorSquare ψ f) := by
  sorry

lemma affineTensorField_integrable_of_arbitrary_coefficients
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : affineExteriorSquare θ = 0) (hψ : affineExteriorSquare ψ = 0) :
    affineExteriorSquare (affineTensorField θ ψ) = 0 := by
  sorry

lemma affineTensorField_curvature
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    affineExteriorSquare (affineTensorField θ ψ) =
      (TensorProduct.rightComm R E (⋀[R]^2 Q) F).toLinearMap.comp
        (TensorProduct.map (affineExteriorSquare θ) (LinearMap.id : F →ₗ[R] F)) +
      (TensorProduct.assoc R E F (⋀[R]^2 Q)).symm.toLinearMap.comp
        (TensorProduct.map (LinearMap.id : E →ₗ[R] E) (affineExteriorSquare ψ)) := by
  sorry

lemma affineTensorWedgePair_same_direction (e : E) (f : F) (q : Q) :
    affineTensorWedgePair ((e ⊗ₜ[R] q) ⊗ₜ[R] (f ⊗ₜ[R] q)) = 0 := by
  sorry

lemma affineTensorWedgePair_swap (z : E ⊗[R] Q) (w : F ⊗[R] Q) :
    affineTensorWedgePair (w ⊗ₜ[R] z) =
      - TensorProduct.map (TensorProduct.comm R E F).toLinearMap
          (LinearMap.id : (⋀[R]^2 Q) →ₗ[R] (⋀[R]^2 Q))
            (affineTensorWedgePair (z ⊗ₜ[R] w)) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q]

-- test: TwistedHiggsBundle.affineExteriorStep.test_zero
example : affineExteriorStep (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineExteriorStep.test_integer_value
example :
    affineExteriorStep ((TensorProduct.mk ℤ ℤ (ℤ × ℤ)).flip (1,0))
      ((1 : ℤ) ⊗ₜ[ℤ] ((0,1) : ℤ × ℤ)) =
        (1 : ℤ) ⊗ₜ[ℤ] exteriorPower.ιMulti ℤ 2 (M := ℤ × ℤ) ![(1,0),(0,1)] := by
  sorry

-- test: TwistedHiggsBundle.affineExteriorStep.test_square_comparison
example (θ : E →ₗ[R] E ⊗[R] Q) :
    (affineExteriorStep θ).comp θ = affineExteriorSquare θ := by
  sorry

-- test: TwistedHiggsBundle.affineTensorWedgePair.test_repeated_coefficient
example (e : E) (f : F) (q : Q) :
    affineTensorWedgePair ((e ⊗ₜ[R] q) ⊗ₜ[R] (f ⊗ₜ[R] q)) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorWedgePair.test_integer_sign
example :
    affineTensorWedgePair (R := ℤ) (E := ℤ) (F := ℤ) (Q := ℤ × ℤ) (((1 : ℤ) ⊗ₜ[ℤ] ((0,1) : ℤ × ℤ)) ⊗ₜ[ℤ]
      ((1 : ℤ) ⊗ₜ[ℤ] ((1,0) : ℤ × ℤ))) =
      - (((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[ℤ]
        exteriorPower.ιMulti ℤ 2 (M := ℤ × ℤ) ![(1,0),(0,1)]) := by
  sorry

-- test: TwistedHiggsBundle.affineTensorWedgePair.test_characteristic_two_nonzero
example :
    affineTensorWedgePair (R := ZMod 2) (E := ZMod 2) (F := ZMod 2)
      (Q := ZMod 2 × ZMod 2) ≠ 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_torsion_coefficient_integrability
example :
    affineExteriorSquare (affineTensorField
      (affineTwoDirectionField (LinearMap.id : ℤ →ₗ[ℤ] ℤ) 0
        ((1,0) : ZMod 2 × ZMod 2) (0,1))
      (affineTwoDirectionField (LinearMap.id : ℤ →ₗ[ℤ] ℤ) 0
        ((0,1) : ZMod 2 × ZMod 2) (1,0))) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_curvature_value
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (e : E) (f : F) :
    affineExteriorSquare (affineTensorField θ ψ) (e ⊗ₜ[R] f) =
      TensorProduct.rightComm R E (⋀[R]^2 Q) F (affineExteriorSquare θ e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F (⋀[R]^2 Q)).symm (e ⊗ₜ[R] affineExteriorSquare ψ f) := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_no_reflection_through_zero_module
example :
    let A := (LinearMap.inl ℤ ℤ ℤ).comp (LinearMap.snd ℤ ℤ ℤ)
    let B := (LinearMap.inr ℤ ℤ ℤ).comp (LinearMap.fst ℤ ℤ ℤ)
    let θ := affineTwoDirectionField A B ((1,0) : ℤ × ℤ) (0,1)
    affineExteriorSquare θ ≠ 0 ∧
      affineExteriorSquare (affineTensorField θ
        (0 : (Fin 0 → ℤ) →ₗ[ℤ] (Fin 0 → ℤ) ⊗[ℤ] (ℤ × ℤ))) = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
/- END AFFINE TENSOR CURVATURE -/

/- BEGIN AFFINE TENSOR BASE CHANGE -/

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q]
variable (S : Type*) [CommRing S] [Algebra R S]

lemma affineTensorBaseChange_left (a : S) (z : E ⊗[R] Q) (f : F) :
    TensorProduct.rightComm S (S ⊗[R] E) (S ⊗[R] Q) (S ⊗[R] F)
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E Q (a ⊗ₜ[R] z) ⊗ₜ[S]
        ((1 : S) ⊗ₜ[R] f)) =
    TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
      (LinearMap.id : S ⊗[R] Q →ₗ[S] S ⊗[R] Q)
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S (E ⊗[R] F) Q
        (a ⊗ₜ[R] TensorProduct.rightComm R E Q F (z ⊗ₜ[R] f))) := by
  sorry

lemma affineTensorBaseChange_right (a : S) (e : E) (w : F ⊗[R] Q) :
    (TensorProduct.assoc S (S ⊗[R] E) (S ⊗[R] F) (S ⊗[R] Q)).symm
      ((a ⊗ₜ[R] e) ⊗ₜ[S]
        TensorProduct.AlgebraTensorModule.distribBaseChange R S F Q ((1 : S) ⊗ₜ[R] w)) =
    TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
      (LinearMap.id : S ⊗[R] Q →ₗ[S] S ⊗[R] Q)
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S (E ⊗[R] F) Q
        (a ⊗ₜ[R] (TensorProduct.assoc R E F Q).symm (e ⊗ₜ[R] w))) := by
  sorry

lemma affineTensorField_baseChange (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)).comp
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap =
    (TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
      (LinearMap.id : S ⊗[R] Q →ₗ[S] S ⊗[R] Q)).comp
      (affineBaseChange S (affineTensorField θ ψ)) := by
  sorry

lemma affineTensorField_baseChange_inverse
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    (affineBaseChange S (affineTensorField θ ψ)).comp
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm.toLinearMap =
    (TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm.toLinearMap
      (LinearMap.id : S ⊗[R] Q →ₗ[S] S ⊗[R] Q)).comp
      (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) := by
  sorry

lemma affineTensorField_baseChange_ordered
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (n : ℕ) :
    (affineOrderedIterate (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) n).comp
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap =
    (TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
      (LinearMap.id : (⨂[S]^n (S ⊗[R] Q)) →ₗ[S] (⨂[S]^n (S ⊗[R] Q)))).comp
      (affineOrderedIterate (affineBaseChange S (affineTensorField θ ψ)) n) := by
  sorry

lemma affineTensorField_baseChange_ordered_zero_iff
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) n = 0 ↔
    affineOrderedIterate (affineBaseChange S (affineTensorField θ ψ)) n = 0 := by
  sorry

lemma affineTensorField_baseChange_nilpotence
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (n : ℕ)
    (h : affineOrderedIterate (affineTensorField θ ψ) n = 0) :
    affineOrderedIterate (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) n = 0 := by
  sorry

lemma affineTensorField_baseChange_nilpotence_iff [Module.FaithfullyFlat R S]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) n = 0 ↔
    affineOrderedIterate (affineTensorField θ ψ) n = 0 := by
  sorry

lemma affineTensorField_baseChange_exterior
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    (affineExteriorSquare (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ))).comp
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap =
    (TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
      (LinearMap.id : (⋀[S]^2 (S ⊗[R] Q)) →ₗ[S] (⋀[S]^2 (S ⊗[R] Q)))).comp
      (affineExteriorSquare (affineBaseChange S (affineTensorField θ ψ))) := by
  sorry

lemma affineTensorField_baseChange_exterior_zero_iff
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    affineExteriorSquare (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) = 0 ↔
    affineExteriorSquare (affineBaseChange S (affineTensorField θ ψ)) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_zero
example :
    affineTensorField (affineBaseChange S (0 : E →ₗ[R] E ⊗[R] Q))
      (affineBaseChange S (0 : F →ₗ[R] F ⊗[R] Q)) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_integer_value
example :
    affineBaseChange ℚ (affineTensorField (TensorProduct.rid ℤ ℤ).symm.toLinearMap
      (TensorProduct.rid ℤ ℤ).symm.toLinearMap)
      ((2 : ℚ) ⊗ₜ[ℤ] ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ))) =
    ((2 : ℚ) ⊗ₜ[ℤ] ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ))) ⊗ₜ[ℚ]
      ((1 : ℚ) ⊗ₜ[ℤ] (2 : ℤ)) := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_nonflat_tensor
example :
    (affineTensorField (affineBaseChange (ZMod 2) (TensorProduct.rid ℤ ℤ).symm.toLinearMap)
      (affineBaseChange (ZMod 2) (TensorProduct.rid ℤ ℤ).symm.toLinearMap)).comp
        (TensorProduct.AlgebraTensorModule.distribBaseChange ℤ (ZMod 2) ℤ ℤ).toLinearMap =
    (TensorProduct.map (TensorProduct.AlgebraTensorModule.distribBaseChange ℤ (ZMod 2) ℤ ℤ).toLinearMap
      (LinearMap.id : ZMod 2 ⊗[ℤ] ℤ →ₗ[ZMod 2] ZMod 2 ⊗[ℤ] ℤ)).comp
        (affineBaseChange (ZMod 2) (affineTensorField
          (TensorProduct.rid ℤ ℤ).symm.toLinearMap (TensorProduct.rid ℤ ℤ).symm.toLinearMap)) := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_torsion_coefficients
example (θ : ZMod 2 →ₗ[ℤ] ZMod 2 ⊗[ℤ] (ZMod 2 × ZMod 2))
    (ψ : ZMod 4 →ₗ[ℤ] ZMod 4 ⊗[ℤ] (ZMod 2 × ZMod 2)) (n : ℕ) :
    affineOrderedIterate (affineTensorField (affineBaseChange (ZMod 2) θ)
      (affineBaseChange (ZMod 2) ψ)) n = 0 ↔
    affineOrderedIterate (affineBaseChange (ZMod 2) (affineTensorField θ ψ)) n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_degree_zero
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    affineOrderedIterate (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) 0 = 0 ↔
    affineOrderedIterate (affineBaseChange S (affineTensorField θ ψ)) 0 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_faithful
example [Module.FaithfullyFlat R S] (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (n : ℕ) :
    affineOrderedIterate (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) n = 0 ↔
    affineOrderedIterate (affineTensorField θ ψ) n = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_exterior_scope
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    affineExteriorSquare (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) = 0 ↔
    affineExteriorSquare (affineBaseChange S (affineTensorField θ ψ)) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_baseChange_nonfaithful_erasure
example :
    let θ := (TensorProduct.rid ℤ ℤ).symm.toLinearMap
    affineTensorField θ θ ≠ 0 ∧
      affineTensorField (affineBaseChange (ZMod 2) θ) (affineBaseChange (ZMod 2) θ) = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
/- END AFFINE TENSOR BASE CHANGE -/

/- BEGIN AFFINE TENSOR CONTRACTION NILPOTENCE -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q : Type*} [CommRing R]
  [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
  [AddCommGroup Q] [Module R Q]

lemma affineTensorField_contractions_separate_commute
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (v : Module.Dual R Q) :
    Commute ((affineContractions θ v).rTensor F) ((affineContractions ψ v).lTensor E) := by
  sorry

lemma affineTensorField_contractions_pow
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (v : Module.Dual R Q) (k : ℕ) :
    affineContractions (affineTensorField θ ψ) v ^ k =
      ∑ i ∈ Finset.range (k+1),
        (k.choose i) •
          TensorProduct.map (affineContractions θ v ^ i)
            (affineContractions ψ v ^ (k-i)) := by
  sorry

lemma affineTensorField_contractions_bound
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (v : Module.Dual R Q)
    (N M : ℕ) (hθ : affineContractions θ v ^ N = 0)
    (hψ : affineContractions ψ v ^ M = 0) :
    affineContractions (affineTensorField θ ψ) v ^ (N+M-1) = 0 := by
  sorry

lemma affineTensorField_contractions_bound_of_le
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (v : Module.Dual R Q)
    (N M k : ℕ) (hθ : affineContractions θ v ^ N = 0)
    (hψ : affineContractions ψ v ^ M = 0) (hk : N+M ≤ k+1) :
    affineContractions (affineTensorField θ ψ) v ^ k = 0 := by
  sorry

lemma affineTensorField_contractions_isNilpotent
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (v : Module.Dual R Q)
    (hθ : IsNilpotent (affineContractions θ v))
    (hψ : IsNilpotent (affineContractions ψ v)) :
    IsNilpotent (affineContractions (affineTensorField θ ψ) v) := by
  sorry

lemma affineTensorField_contractions_uniform_bound
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (N M : ℕ)
    (hθ : ∀ v : Module.Dual R Q, affineContractions θ v ^ N = 0)
    (hψ : ∀ v : Module.Dual R Q, affineContractions ψ v ^ M = 0) :
    ∀ v : Module.Dual R Q,
      affineContractions (affineTensorField θ ψ) v ^ (N+M-1) = 0 := by
  sorry

lemma affineOrderedIterate_contraction_constant (θ : E →ₗ[R] E ⊗[R] Q)
    (n : ℕ) (v : Module.Dual R Q) :
    affineContractions (affineOrderedIterate θ n)
      (TensorPower.multilinearMapToDual R Q n (fun _ => v)) =
        affineContractions θ v ^ n := by
  sorry

lemma affineOrderedIterate_contractions_bound (θ : E →ₗ[R] E ⊗[R] Q)
    (N : ℕ) (hθ : affineOrderedIterate θ N = 0) (v : Module.Dual R Q) :
    affineContractions θ v ^ N = 0 := by
  sorry

lemma affineTensorField_contractions_bound_of_ordered
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (N M : ℕ)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0)
    (v : Module.Dual R Q) :
    affineContractions (affineTensorField θ ψ) v ^ (N+M-1) = 0 := by
  sorry

lemma affineTwoDirectionField_contractions (A B : Module.End R E) (q r : Q)
    (v : Module.Dual R Q) :
    affineContractions (affineTwoDirectionField A B q r) v = v q • A + v r • B := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_contracted_binomial
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (v : Module.Dual R Q) (k : ℕ) :
    affineContractions (affineTensorField θ ψ) v ^ k =
      ∑ i ∈ Finset.range (k+1), (k.choose i) •
        TensorProduct.map (affineContractions θ v ^ i)
          (affineContractions ψ v ^ (k-i)) := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_ordered_to_contracted
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0)
    (v : Module.Dual R Q) :
    affineContractions (affineTensorField θ ψ) v ^ (N+M-1) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_bound_one
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (v : Module.Dual R Q) (hθ : affineContractions θ v = 0)
    (hψ : affineContractions ψ v = 0) :
    affineContractions (affineTensorField θ ψ) v = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_larger_bound
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (v : Module.Dual R Q) (hθ : affineContractions θ v ^ 2 = 0)
    (hψ : affineContractions ψ v ^ 2 = 0) :
    affineContractions (affineTensorField θ ψ) v ^ 5 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_contraction_degree_zero
example (θ : E →ₗ[R] E ⊗[R] Q) (v : Module.Dual R Q) :
    affineContractions (affineOrderedIterate θ 0)
      (TensorPower.multilinearMapToDual R Q 0 (fun _ => v)) = 1 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_integer_sharp_bound
example :
    let J : Module.End ℤ (ℤ × ℤ) := (LinearMap.snd ℤ ℤ ℤ).prod 0
    let θ := affineTwoDirectionField J 0 (1 : ℤ) 0
    let v : Module.Dual ℤ ℤ := LinearMap.id
    affineContractions (affineTensorField θ θ) v ^ 3 = 0 ∧
      affineContractions (affineTensorField θ θ) v ^ 2 ≠ 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_char_two_square_cancellation
example :
    let J : Module.End (ZMod 2) (ZMod 2 × ZMod 2) :=
      (LinearMap.snd (ZMod 2) (ZMod 2) (ZMod 2)).prod 0
    let θ := affineTwoDirectionField J 0 (1 : ZMod 2) 0
    affineContractions (affineTensorField θ θ) (LinearMap.id : Module.Dual (ZMod 2) (ZMod 2)) ^ 2 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTwoDirectionField.test_contracted_formula
example (A B : Module.End R E) (q r : Q) (v : Module.Dual R Q) :
    affineContractions (affineTwoDirectionField A B q r) v = v q • A + v r • B := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_self_powers_do_not_detect_ordered
example :
    let K := ZMod 2
    let V := K × K
    let J : Module.End K V := (LinearMap.snd K K K).prod 0
    let θ := affineTwoDirectionField (J.rTensor V) (J.lTensor V)
      ((1,0) : K × K) (0,1)
    (∀ v : Module.Dual K (K × K), affineContractions θ v ^ 2 = 0) ∧
      affineOrderedIterate θ 2 ≠ 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
/- END AFFINE TENSOR CONTRACTION NILPOTENCE -/

/- BEGIN AFFINE MIXED TENSOR WORDS -/
namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct BigOperators
variable {R E F Q : Type*} [CommRing R]
  [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
  [AddCommGroup Q] [Module R Q]

lemma affineTensorField_contractions_cross_commute
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (v w : Module.Dual R Q) :
    Commute ((affineContractions θ v).rTensor F)
      ((affineContractions ψ w).lTensor E) := by
  sorry

lemma affineTensorField_contractions_selected_word
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (n : ℕ) (vs : Fin n → Module.Dual R Q) (c : Fin n → Bool) :
    (List.ofFn (fun i =>
      if c i then (affineContractions θ (vs i)).rTensor F
      else (affineContractions ψ (vs i)).lTensor E)).prod =
    TensorProduct.map
      ((List.ofFn (fun i => if c i then affineContractions θ (vs i) else 1)).prod)
      ((List.ofFn (fun i => if c i then 1 else affineContractions ψ (vs i))).prod) := by
  sorry

lemma affineTensorField_contractions_word_expansion
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (n : ℕ) (vs : Fin n → Module.Dual R Q) :
    (List.ofFn (fun i => affineContractions (affineTensorField θ ψ) (vs i))).prod =
    ∑ c : Fin n → Bool, TensorProduct.map
      ((List.ofFn (fun i => if c i then affineContractions θ (vs i) else 1)).prod)
      ((List.ofFn (fun i => if c i then 1 else affineContractions ψ (vs i))).prod) := by
  sorry

lemma affineOrderedIterate_selected_word_zero
    (θ : E →ₗ[R] E ⊗[R] Q) (N n : ℕ)
    (hθ : affineOrderedIterate θ N = 0)
    (vs : Fin n → Module.Dual R Q) (c : Fin n → Bool)
    (hcount : N ≤ ((List.finRange n).filter (fun i => c i)).length) :
    (List.ofFn (fun i => if c i then affineContractions θ (vs i) else 1)).prod = 0 := by
  sorry

lemma affineTensorField_contractions_word_summand_zero
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M n : ℕ) (hN : 0 < N) (hM : 0 < M) (hn : N + M ≤ n + 1)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0)
    (vs : Fin n → Module.Dual R Q) (c : Fin n → Bool) :
    TensorProduct.map
      ((List.ofFn (fun i => if c i then affineContractions θ (vs i) else 1)).prod)
      ((List.ofFn (fun i => if c i then 1 else affineContractions ψ (vs i))).prod) = 0 := by
  sorry

lemma affineTensorField_contractions_word_zero
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M n : ℕ) (hN : 0 < N) (hM : 0 < M) (hn : N + M ≤ n + 1)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0)
    (vs : Fin n → Module.Dual R Q) :
    (List.ofFn (fun i => affineContractions (affineTensorField θ ψ) (vs i))).prod = 0 := by
  sorry

lemma affineTensorField_ordered_bound_of_basis {I : Type*} [Fintype I]
    (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineTensorField θ ψ) (N + M - 1) = 0 := by
  sorry

lemma affineTensorField_ordered_bound_of_basis_of_le {I : Type*} [Fintype I]
    (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M k : ℕ) (hN : 0 < N) (hM : 0 < M) (hk : N + M ≤ k + 1)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineTensorField θ ψ) k = 0 := by
  sorry

variable (S : Type*) [CommRing S] [Algebra R S]

lemma affineTensorField_ordered_bound_of_basis_baseChange {I : Type*} [Fintype I]
    (b : Module.Basis I R Q)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate
      (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) (N + M - 1) = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_word_empty
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    (List.ofFn (fun i : Fin 0 =>
      affineContractions (affineTensorField θ ψ) (Fin.elim0 i))).prod =
      (1 : Module.End R (E ⊗[R] F)) := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_word_two
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (v w : Module.Dual R Q) :
    affineContractions (affineTensorField θ ψ) v *
      affineContractions (affineTensorField θ ψ) w =
    TensorProduct.map (affineContractions θ v * affineContractions θ w) (1 : Module.End R F) +
      TensorProduct.map (affineContractions θ v) (affineContractions ψ w) +
      TensorProduct.map (affineContractions θ w) (affineContractions ψ v) +
      TensorProduct.map (1 : Module.End R E)
        (affineContractions ψ v * affineContractions ψ w) := by
  sorry

-- test: TwistedHiggsBundle.affineOrderedIterate.test_selected_repeated_direction
example (θ : E →ₗ[R] E ⊗[R] Q) (hθ : affineOrderedIterate θ 2 = 0)
    (v : Module.Dual R Q) :
    (List.ofFn (fun _ : Fin 2 => affineContractions θ v)).prod = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_bound_zero_factor
example {I : Type*} [Fintype I] (b : Module.Basis I R Q)
    (ψ : F →ₗ[R] F ⊗[R] Q) (M : ℕ) (hM : 0 < M)
    (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineTensorField (0 : E →ₗ[R] E ⊗[R] Q) ψ) M = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_empty_coefficients
example [Subsingleton Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    affineOrderedIterate (affineTensorField θ ψ) 1 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_char_two_bound
example :
    let K := ZMod 2
    let V := K × K
    let J : Module.End K V := (LinearMap.snd K K K).prod 0
    let θ := affineTwoDirectionField J 0 ((1,0) : K × K) 0
    let ψ := affineTwoDirectionField J 0 ((0,1) : K × K) 0
    affineOrderedIterate θ 2 = 0 ∧ affineOrderedIterate ψ 2 = 0 ∧
      affineOrderedIterate (affineTensorField θ ψ) 3 = 0 ∧
      affineOrderedIterate (affineTensorField θ ψ) 2 ≠ 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_integer_bound
example :
    let J : Module.End ℤ (ℤ × ℤ) := (LinearMap.snd ℤ ℤ ℤ).prod 0
    let θ := affineTwoDirectionField J 0 (1 : ℤ) 0
    affineOrderedIterate θ 2 = 0 ∧
      affineOrderedIterate (affineTensorField θ θ) 3 = 0 ∧
      affineOrderedIterate (affineTensorField θ θ) 2 ≠ 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_mixed_nonflat_baseChange
example {E₀ F₀ Q₀ I : Type*} [AddCommGroup E₀] [AddCommGroup F₀]
    [AddCommGroup Q₀] [Fintype I] (b : Module.Basis I ℤ Q₀)
    (θ : E₀ →ₗ[ℤ] E₀ ⊗[ℤ] Q₀) (ψ : F₀ →ₗ[ℤ] F₀ ⊗[ℤ] Q₀)
    (hθ : affineOrderedIterate (R := ℤ) θ 2 = 0)
    (hψ : affineOrderedIterate (R := ℤ) ψ 2 = 0) :
    affineOrderedIterate (affineTensorField
      (affineBaseChange (R := ℤ) (ZMod 2) θ)
      (affineBaseChange (R := ℤ) (ZMod 2) ψ)) 3 = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
/- END AFFINE MIXED TENSOR WORDS -/

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q P : Type*} [CommRing R]
  [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
  [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]

lemma affineCoefficientMap_retract (θ : E →ₗ[R] E ⊗[R] Q)
    (u : Q →ₗ[R] P) (v : P →ₗ[R] Q) (hvu : v.comp u = LinearMap.id) :
    affineCoefficientMap (affineCoefficientMap θ u) v = θ := by
  sorry

lemma affineTensorField_ordered_bound_of_split_basis {I : Type*} [Fintype I]
    (b : Module.Basis I R P) (u : Q →ₗ[R] P) (v : P →ₗ[R] Q)
    (hvu : v.comp u = LinearMap.id)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineTensorField θ ψ) (N + M - 1) = 0 := by
  sorry

lemma affineTensorField_ordered_bound_of_projective [Module.Finite R Q] [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineTensorField θ ψ) (N + M - 1) = 0 := by
  sorry

lemma affineTensorField_ordered_larger_bound_of_projective [Module.Finite R Q]
    [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M k : ℕ) (hN : 0 < N) (hM : 0 < M) (hk : N + M ≤ k + 1)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineTensorField θ ψ) k = 0 := by
  sorry

lemma affineTensorField_ordered_nilpotent_of_projective [Module.Finite R Q]
    [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : ∃ N, 0 < N ∧ affineOrderedIterate θ N = 0)
    (hψ : ∃ M, 0 < M ∧ affineOrderedIterate ψ M = 0) :
    ∃ K, 0 < K ∧ affineOrderedIterate (affineTensorField θ ψ) K = 0 := by
  sorry

variable (S : Type*) [CommRing S] [Algebra R S]

lemma affineTensorField_ordered_baseChange_of_projective [Module.Finite R Q]
    [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate
      (affineTensorField (affineBaseChange S θ) (affineBaseChange S ψ)) (N + M - 1) = 0 := by
  sorry

lemma affineTensorField_ordered_chart_of_projective [Module.Finite R Q]
    [Module.Projective R Q] {G T : Type*} [AddCommGroup G] [Module S G]
    [AddCommGroup T] [Module S T]
    (e : S ⊗[R] (E ⊗[R] F) ≃ₗ[S] G) (q : S ⊗[R] Q ≃ₗ[S] T)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : affineOrderedIterate θ N = 0) (hψ : affineOrderedIterate ψ M = 0) :
    affineOrderedIterate (affineChartField S (affineTensorField θ ψ) e q) (N + M - 1) = 0 := by
  sorry

lemma affineTensorField_ordered_principalCover_of_projective
    (s : Set R) (hs : Ideal.span s = ⊤)
    (A : s → Type*) [∀ r, CommRing (A r)] [∀ r, Algebra R (A r)]
    [∀ r : s, IsLocalization.Away r.val (A r)]
    [∀ r : s, Module.Finite (A r) ((A r) ⊗[R] Q)]
    [∀ r : s, Module.Projective (A r) ((A r) ⊗[R] Q)]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (N M : ℕ) (hN : 0 < N) (hM : 0 < M)
    (hθ : ∀ r : s, affineOrderedIterate (affineBaseChange (A r) θ) N = 0)
    (hψ : ∀ r : s, affineOrderedIterate (affineBaseChange (A r) ψ) M = 0) :
    affineOrderedIterate (affineTensorField θ ψ) (N + M - 1) = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
variable {R E F Q P : Type*} [CommRing R]
  [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
  [AddCommGroup Q] [Module R Q] [AddCommGroup P] [Module R P]

-- test: TwistedHiggsBundle.affineCoefficientMap.test_split_projective_retract
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineCoefficientMap (affineCoefficientMap θ (LinearMap.inl R Q P))
      (LinearMap.fst R Q P) = θ := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_split_basis_bound
example {I : Type*} [Fintype I] (b : Module.Basis I R P)
    (u : Q →ₗ[R] P) (v : P →ₗ[R] Q) (hvu : v.comp u = LinearMap.id)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : affineOrderedIterate θ 2 = 0) (hψ : affineOrderedIterate ψ 2 = 0) :
    affineOrderedIterate (affineTensorField θ ψ) 3 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_projective_bound
example [Module.Finite R Q] [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : affineOrderedIterate θ 2 = 0) (hψ : affineOrderedIterate ψ 2 = 0) :
    affineOrderedIterate (affineTensorField θ ψ) 3 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_projective_zero_fields
example [Module.Finite R Q] [Module.Projective R Q] :
    affineOrderedIterate (affineTensorField (0 : E →ₗ[R] E ⊗[R] Q)
      (0 : F →ₗ[R] F ⊗[R] Q)) 1 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_projective_larger_bound
example [Module.Finite R Q] [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : affineOrderedIterate θ 2 = 0) (hψ : affineOrderedIterate ψ 2 = 0) :
    affineOrderedIterate (affineTensorField θ ψ) 5 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_projective_positive_nilpotence
example [Module.Finite R Q] [Module.Projective R Q]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : ∃ N, 0 < N ∧ affineOrderedIterate θ N = 0)
    (hψ : ∃ M, 0 < M ∧ affineOrderedIterate ψ M = 0) :
    ∃ K, 0 < K ∧ affineOrderedIterate (affineTensorField θ ψ) K = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_projective_nonflat_baseChange
example {E₀ F₀ Q₀ : Type*} [AddCommGroup E₀] [AddCommGroup F₀]
    [AddCommGroup Q₀] [Module.Finite ℤ Q₀] [Module.Projective ℤ Q₀]
    (θ : E₀ →ₗ[ℤ] E₀ ⊗[ℤ] Q₀) (ψ : F₀ →ₗ[ℤ] F₀ ⊗[ℤ] Q₀)
    (hθ : affineOrderedIterate (R := ℤ) θ 2 = 0)
    (hψ : affineOrderedIterate (R := ℤ) ψ 2 = 0) :
    affineOrderedIterate (affineTensorField
      (affineBaseChange (R := ℤ) (ZMod 2) θ)
      (affineBaseChange (R := ℤ) (ZMod 2) ψ)) 3 = 0 := by
  sorry

variable (S : Type*) [CommRing S] [Algebra R S]
-- test: TwistedHiggsBundle.affineTensorField.test_projective_chart_bound
example [Module.Finite R Q] [Module.Projective R Q] {G T : Type*}
    [AddCommGroup G] [Module S G] [AddCommGroup T] [Module S T]
    (e : S ⊗[R] (E ⊗[R] F) ≃ₗ[S] G) (q : S ⊗[R] Q ≃ₗ[S] T)
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : affineOrderedIterate θ 2 = 0) (hψ : affineOrderedIterate ψ 2 = 0) :
    affineOrderedIterate (affineChartField S (affineTensorField θ ψ) e q) 3 = 0 := by
  sorry

-- test: TwistedHiggsBundle.affineTensorField.test_projective_principal_cover
example (s : Set R) (hs : Ideal.span s = ⊤)
    (A : s → Type*) [∀ r, CommRing (A r)] [∀ r, Algebra R (A r)]
    [∀ r : s, IsLocalization.Away r.val (A r)]
    [∀ r : s, Module.Finite (A r) ((A r) ⊗[R] Q)]
    [∀ r : s, Module.Projective (A r) ((A r) ⊗[R] Q)]
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (hθ : ∀ r : s, affineOrderedIterate (affineBaseChange (A r) θ) 2 = 0)
    (hψ : ∀ r : s, affineOrderedIterate (affineBaseChange (A r) ψ) 2 = 0) :
    affineOrderedIterate (affineTensorField θ ψ) 3 = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

namespace TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle
noncomputable section
open scoped TensorProduct
-- test: TwistedHiggsBundle.affineTensorField.test_projective_nonfree_corner
example :
    let R₀ := ℚ × ℚ
    letI : Algebra R₀ ℚ := (RingHom.fst ℚ ℚ).toAlgebra
    Module.Projective R₀ ℚ ∧ Module.Finite R₀ ℚ ∧
      ((0,1) : R₀) • (1 : ℚ) = 0 ∧ ((0,1) : R₀) ≠ 0 ∧
      ∀ θ ψ : ℚ →ₗ[R₀] ℚ ⊗[R₀] ℚ,
        affineOrderedIterate θ 2 = 0 → affineOrderedIterate ψ 2 = 0 →
        affineOrderedIterate (affineTensorField θ ψ) 3 = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle

/- BEGIN SAME PARAMETER ADDITIVE TENSOR -/
namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t
variable {k R : Type u} {E : Type v} {F : Type t} {W : Type w} {Z : Type z} [CommRing k] [CommRing R] [Algebra k R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup W] [Module R W] [Module k W]
variable [AddCommGroup Z] [Module R Z]
variable {Ω : TwoForms k R W Z} {lam : R}

/-- The sum is biadditive. Its separate summands are not assumed R-linear. -/
def Preconnection.affineTensorPair (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) : E →+ F →+ (E ⊗[R] F) ⊗[R] W := by sorry

lemma Preconnection.affineTensorPair_apply (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (e : E) (f : F) :
    D.affineTensorPair C e f =
      TensorProduct.rightComm R E W F (D.toAddHom e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F W).symm (e ⊗ₜ[R] C.toAddHom f) := by sorry

lemma Preconnection.affineTensorPair_leibniz (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (a : R) (e : E) (f : F) :
    D.affineTensorPair C (a • e) f =
      a • D.affineTensorPair C e f + lam • ((e ⊗ₜ[R] f) ⊗ₜ[R] Ω.d0 a) := by sorry

lemma Preconnection.affineTensorPair_balanced (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (a : R) (e : E) (f : F) :
    D.affineTensorPair C (a • e) f = D.affineTensorPair C e (a • f) := by sorry

/-- The actual tensor preconnection keeps one copy of the common parameter. -/
def Preconnection.affineTensor (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) : Preconnection Ω lam (E ⊗[R] F) := by sorry

lemma Preconnection.affineTensor_toAddHom (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) :
    (D.affineTensor C).toAddHom =
      TensorProduct.liftAddHom (D.affineTensorPair C) (D.affineTensorPair_balanced C) := by sorry

lemma Preconnection.affineTensor_tmul (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (e : E) (f : F) :
    (D.affineTensor C).toAddHom (e ⊗ₜ[R] f) =
      TensorProduct.rightComm R E W F (D.toAddHom e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F W).symm (e ⊗ₜ[R] C.toAddHom f) := by sorry

lemma Preconnection.affineTensor_leibniz (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (a : R) (x : E ⊗[R] F) :
    (D.affineTensor C).toAddHom (a • x) =
      a • (D.affineTensor C).toAddHom x + lam • (x ⊗ₜ[R] Ω.d0 a) := by sorry

variable [IsScalarTower k R W]

lemma Preconnection.affineTensor_ofLinear (θ : E →ₗ[R] E ⊗[R] W)
    (ψ : F →ₗ[R] F ⊗[R] W) :
    ((Preconnection.ofLinear (Ω := Ω) θ).affineTensor
      (Preconnection.ofLinear (Ω := Ω) ψ)).toLinear =
        TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle.affineTensorField θ ψ := by sorry

omit [IsScalarTower k R W] in
lemma Preconnection.affineTensor_horizontal {E' F' : Type*}
    [AddCommGroup E'] [Module R E'] [AddCommGroup F'] [Module R F']
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (D' : Preconnection Ω lam E') (C' : Preconnection Ω lam F')
    (u : E →ₗ[R] E') (v : F →ₗ[R] F')
    (hu : ∀ e, D'.toAddHom (u e) = TensorProduct.map u LinearMap.id (D.toAddHom e))
    (hv : ∀ f, C'.toAddHom (v f) = TensorProduct.map v LinearMap.id (C.toAddHom f))
    (x : E ⊗[R] F) :
    (D'.affineTensor C').toAddHom (TensorProduct.map u v x) =
      TensorProduct.map (TensorProduct.map u v) LinearMap.id ((D.affineTensor C).toAddHom x) := by sorry

omit [IsScalarTower k R W] in
lemma Preconnection.affineTensor_comm (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (x : E ⊗[R] F) :
    (C.affineTensor D).toAddHom (TensorProduct.comm R E F x) =
      TensorProduct.map (TensorProduct.comm R E F).toLinearMap LinearMap.id
        ((D.affineTensor C).toAddHom x) := by sorry

-- test: Preconnection.affineTensorPair.test_zero_left
example (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) (f : F) :
    D.affineTensorPair C 0 f = 0 := by sorry

-- test: Preconnection.affineTensorPair.test_balanced_same_parameter
example (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) (a : R) (e : E) (f : F) :
    D.affineTensorPair C (a • e) f = D.affineTensorPair C e (a • f) := by sorry

-- test: Preconnection.affineTensorPair.test_parameter_two
example (D : Preconnection Ω (2 : R) E) (C : Preconnection Ω (2 : R) F)
    (a : R) (e : E) (f : F) :
    D.affineTensorPair C (a • e) f =
      a • D.affineTensorPair C e f + (2 : R) • ((e ⊗ₜ[R] f) ⊗ₜ[R] Ω.d0 a) := by sorry

-- test: Preconnection.affineTensor.test_higgs_compatibility
example (θ : E →ₗ[R] E ⊗[R] W) (ψ : F →ₗ[R] F ⊗[R] W) :
    ((Preconnection.ofLinear (Ω := Ω) θ).affineTensor
      (Preconnection.ofLinear (Ω := Ω) ψ)).toLinear =
        TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle.affineTensorField θ ψ := by sorry

-- test: Preconnection.affineTensor.test_additive_zero
example (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) :
    (D.affineTensor C).toAddHom 0 = 0 := by sorry

-- test: Preconnection.affineTensor.test_parameter_one
example (D : Preconnection Ω (1 : R) E) (C : Preconnection Ω (1 : R) F)
    (a : R) (x : E ⊗[R] F) :
    (D.affineTensor C).toAddHom (a • x) =
      a • (D.affineTensor C).toAddHom x + x ⊗ₜ[R] Ω.d0 a := by sorry

-- test: Preconnection.affineTensorPair.test_distinct_parameters_nonexample
example (a : R) (ha : Ω.d0 a ≠ 0) :
    (TensorProduct.lid R W)
      (TensorProduct.map (TensorProduct.lid R R).toLinearMap LinearMap.id
        (TensorProduct.rightComm R R W R
          ((Preconnection.unit Ω 1).toAddHom a ⊗ₜ[R] (1 : R)) +
          (TensorProduct.assoc R R R W).symm
            (a ⊗ₜ[R] (Preconnection.unit Ω 0).toAddHom 1))) ≠
    (TensorProduct.lid R W)
      (TensorProduct.map (TensorProduct.lid R R).toLinearMap LinearMap.id
        (TensorProduct.rightComm R R W R
          ((Preconnection.unit Ω 1).toAddHom 1 ⊗ₜ[R] a) +
          (TensorProduct.assoc R R R W).symm
            ((1 : R) ⊗ₜ[R] (Preconnection.unit Ω 0).toAddHom a))) := by sorry

-- test: Preconnection.affineTensor.test_unit_parameter_two
example (a : R) :
    (TensorProduct.lid R W)
      (TensorProduct.map (TensorProduct.lid R R).toLinearMap LinearMap.id
        (((Preconnection.unit Ω (2 : R)).affineTensor
          (Preconnection.unit Ω (2 : R))).toAddHom (a ⊗ₜ[R] (1 : R)))) =
      (2 : R) • Ω.d0 a := by sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic
/- END SAME PARAMETER ADDITIVE TENSOR -/

/- Common-parameter affine tensor coherence. -/
namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t s
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {E : Type v} {F : Type t} {G : Type s}
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup G] [Module R G]
variable {W : Type w} {Z : Type z} [AddCommGroup W] [Module R W] [Module k W]
variable [AddCommGroup Z] [Module R Z] {Ω : TwoForms k R W Z} {lam : R}

lemma Preconnection.affineTensor_assoc (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (B : Preconnection Ω lam G)
    (x : (E ⊗[R] F) ⊗[R] G) :
    (D.affineTensor (C.affineTensor B)).toAddHom (TensorProduct.assoc R E F G x) =
      TensorProduct.map (TensorProduct.assoc R E F G).toLinearMap LinearMap.id
        (((D.affineTensor C).affineTensor B).toAddHom x) := by sorry

lemma Preconnection.horizontal_symm (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (u : E ≃ₗ[R] F)
    (h : ∀ e, C.toAddHom (u e) = TensorProduct.map u.toLinearMap LinearMap.id (D.toAddHom e))
    (f : F) :
    D.toAddHom (u.symm f) =
      TensorProduct.map u.symm.toLinearMap LinearMap.id (C.toAddHom f) := by sorry

lemma Preconnection.affineTensor_assoc_symm (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (B : Preconnection Ω lam G)
    (x : E ⊗[R] (F ⊗[R] G)) :
    ((D.affineTensor C).affineTensor B).toAddHom ((TensorProduct.assoc R E F G).symm x) =
      TensorProduct.map (TensorProduct.assoc R E F G).symm.toLinearMap LinearMap.id
        ((D.affineTensor (C.affineTensor B)).toAddHom x) := by sorry

variable [IsScalarTower k R W]

lemma Preconnection.affineTensor_lid (D : Preconnection Ω lam E) (x : R ⊗[R] E) :
    D.toAddHom (TensorProduct.lid R E x) =
      TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id
        (((Preconnection.unit Ω lam).affineTensor D).toAddHom x) := by sorry

lemma Preconnection.affineTensor_rid (D : Preconnection Ω lam E) (x : E ⊗[R] R) :
    D.toAddHom (TensorProduct.rid R E x) =
      TensorProduct.map (TensorProduct.rid R E).toLinearMap LinearMap.id
        ((D.affineTensor (Preconnection.unit Ω lam)).toAddHom x) := by sorry

lemma Preconnection.affineTensor_lid_symm (D : Preconnection Ω lam E) (e : E) :
    ((Preconnection.unit Ω lam).affineTensor D).toAddHom ((TensorProduct.lid R E).symm e) =
      TensorProduct.map (TensorProduct.lid R E).symm.toLinearMap LinearMap.id (D.toAddHom e) := by sorry

lemma Preconnection.affineTensor_rid_symm (D : Preconnection Ω lam E) (e : E) :
    (D.affineTensor (Preconnection.unit Ω lam)).toAddHom ((TensorProduct.rid R E).symm e) =
      TensorProduct.map (TensorProduct.rid R E).symm.toLinearMap LinearMap.id (D.toAddHom e) := by sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t s
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {E : Type v} {F : Type t} {G : Type s}
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup G] [Module R G]
variable {W : Type w} {Z : Type z} [AddCommGroup W] [Module R W] [Module k W]
variable [AddCommGroup Z] [Module R Z] {Ω : TwoForms k R W Z} {lam : R}

-- test: Preconnection.affineTensor.test_three_factor_reassociation
example (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (B : Preconnection Ω lam G) (e : E) (f : F) (g : G) :
    (D.affineTensor (C.affineTensor B)).toAddHom (e ⊗ₜ[R] (f ⊗ₜ[R] g)) =
      TensorProduct.map (TensorProduct.assoc R E F G).toLinearMap LinearMap.id
        (((D.affineTensor C).affineTensor B).toAddHom ((e ⊗ₜ[R] f) ⊗ₜ[R] g)) := by sorry

variable [IsScalarTower k R W]

-- test: Preconnection.affineTensor.test_left_unit_derivative
example (D : Preconnection Ω lam E) (a : R) (e : E) :
    TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id
      (((Preconnection.unit Ω lam).affineTensor D).toAddHom (a ⊗ₜ[R] e)) =
      a • D.toAddHom e + lam • (e ⊗ₜ[R] Ω.d0 a) := by sorry

-- test: Preconnection.affineTensor.test_left_unit_insertion
example (D : Preconnection Ω lam E) (e : E) :
    ((Preconnection.unit Ω lam).affineTensor D).toAddHom ((1 : R) ⊗ₜ[R] e) =
      TensorProduct.map (TensorProduct.lid R E).symm.toLinearMap LinearMap.id (D.toAddHom e) := by sorry

-- test: Preconnection.affineTensor.test_right_unit_insertion
example (D : Preconnection Ω lam E) (e : E) :
    (D.affineTensor (Preconnection.unit Ω lam)).toAddHom (e ⊗ₜ[R] (1 : R)) =
      TensorProduct.map (TensorProduct.rid R E).symm.toLinearMap LinearMap.id (D.toAddHom e) := by sorry

local notation "A" => MvPolynomial (Fin 1) ℤ

-- test: Preconnection.affineTensor.test_polynomial_parameter_not_doubled
example : ∃ Ω : TwoForms ℤ A A (Fin 0 → A),
    Ω.d0 = MvPolynomial.pderiv (0 : Fin 1) ∧
    (TensorProduct.lid A A)
      (TensorProduct.map (TensorProduct.lid A A).toLinearMap LinearMap.id
        (((Preconnection.unit Ω (2 : A)).affineTensor (Preconnection.unit Ω (2 : A))).toAddHom
          ((MvPolynomial.X (0 : Fin 1) : A) ⊗ₜ[A] (1 : A)))) = (2 : A) ∧
    (TensorProduct.lid A A)
      (TensorProduct.map (TensorProduct.lid A A).toLinearMap LinearMap.id
        (((Preconnection.unit Ω (2 : A)).affineTensor (Preconnection.unit Ω (2 : A))).toAddHom
          ((MvPolynomial.X (0 : Fin 1) : A) ⊗ₜ[A] (1 : A)))) ≠ (4 : A) := by sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

/- Common-parameter affine exterior extension and tensor curvature. -/
namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {Ω : TwoForms k R W Z} {lam : R}

lemma TwoForms.wedge_swap (ω α : W) :
    Ω.wedge ω α + Ω.wedge α ω = 0 := by sorry
lemma TwoForms.wedgeRight_add (ω α : W) (x : E ⊗[R] W) :
    Ω.wedgeRight (ω + α) x = Ω.wedgeRight ω x + Ω.wedgeRight α x := by sorry
lemma TwoForms.wedgeRight_smul (a : R) (ω : W) (x : E ⊗[R] W) :
    Ω.wedgeRight (a • ω) x = a • Ω.wedgeRight ω x := by sorry
lemma Preconnection.extend_smul [IsScalarTower k R W] (D : Preconnection Ω lam E) (a : R) (x : E ⊗[R] W) :
    D.extend (a • x) = a • D.extend x +
      lam • TensorProduct.map LinearMap.id (Ω.wedge (Ω.d0 a)) x := by sorry
lemma TwoForms.wedgeRight_add_left (ω : W) (x : E ⊗[R] W) :
    Ω.wedgeRight ω x + TensorProduct.map LinearMap.id (Ω.wedge ω) x = 0 := by sorry
lemma Preconnection.curvature_scalar_defect [IsScalarTower k R W] (D : Preconnection Ω lam E) (a : R) (e : E) :
    D.curvature (a • e) = a • D.curvature e +
      lam • (e ⊗ₜ[R] Ω.wedge (Ω.d0 lam) (Ω.d0 a)) := by sorry
lemma Preconnection.unit_curvature [IsScalarTower k R W] (a : R) :
    (Preconnection.unit Ω lam).curvature a =
      lam • ((1 : R) ⊗ₜ[R] Ω.wedge (Ω.d0 lam) (Ω.d0 a)) := by sorry
end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {Ω : TwoForms k R W Z} {lam : R}

def TwoForms.tensorWedge (Ω : TwoForms k R W Z) :
    (E ⊗[R] W) ⊗[R] (F ⊗[R] W) →ₗ[R] (E ⊗[R] F) ⊗[R] Z := by sorry
lemma TwoForms.tensorWedge_tmul (e : E) (f : F) (ω α : W) :
    Ω.tensorWedge ((e ⊗ₜ[R] ω) ⊗ₜ[R] (f ⊗ₜ[R] α)) =
      (e ⊗ₜ[R] f) ⊗ₜ[R] Ω.wedge ω α := by sorry
lemma TwoForms.wedgeRight_rightComm (ω : W) (x : E ⊗[R] W) (f : F) :
    Ω.wedgeRight ω (TensorProduct.rightComm R E W F (x ⊗ₜ[R] f)) =
      TensorProduct.rightComm R E Z F (Ω.wedgeRight ω x ⊗ₜ[R] f) := by sorry
lemma TwoForms.wedgeRight_assoc_mixed (ω : W) (e : E) (y : F ⊗[R] W) :
    Ω.wedgeRight ω ((TensorProduct.assoc R E F W).symm (e ⊗ₜ[R] y)) =
      -Ω.tensorWedge ((e ⊗ₜ[R] ω) ⊗ₜ[R] y) := by sorry
lemma TwoForms.wedgeRight_assoc (ω : W) (e : E) (y : F ⊗[R] W) :
    Ω.wedgeRight ω ((TensorProduct.assoc R E F W).symm (e ⊗ₜ[R] y)) =
      (TensorProduct.assoc R E F Z).symm (e ⊗ₜ[R] Ω.wedgeRight ω y) := by sorry
lemma TwoForms.wedgeRight_rightComm_mixed (ω : W) (x : E ⊗[R] W) (f : F) :
    Ω.wedgeRight ω (TensorProduct.rightComm R E W F (x ⊗ₜ[R] f)) =
      Ω.tensorWedge (x ⊗ₜ[R] (f ⊗ₜ[R] ω)) := by sorry
lemma Preconnection.affineTensor_extend_left [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (x : E ⊗[R] W) (f : F) :
    (D.affineTensor C).extend (TensorProduct.rightComm R E W F (x ⊗ₜ[R] f)) =
      TensorProduct.rightComm R E Z F (D.extend x ⊗ₜ[R] f) -
        Ω.tensorWedge (x ⊗ₜ[R] C.toAddHom f) := by sorry
lemma Preconnection.affineTensor_extend_right [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (e : E) (y : F ⊗[R] W) :
    (D.affineTensor C).extend ((TensorProduct.assoc R E F W).symm (e ⊗ₜ[R] y)) =
      (TensorProduct.assoc R E F Z).symm (e ⊗ₜ[R] C.extend y) +
        Ω.tensorWedge (D.toAddHom e ⊗ₜ[R] y) := by sorry
lemma Preconnection.affineTensor_curvature_tmul [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (e : E) (f : F) :
    (D.affineTensor C).curvature (e ⊗ₜ[R] f) =
      TensorProduct.rightComm R E Z F (D.curvature e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F Z).symm (e ⊗ₜ[R] C.curvature f) := by sorry
lemma Preconnection.affineTensor_flat [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F)
    (hD : ∀ e, D.curvature e = 0) (hC : ∀ f, C.curvature f = 0)
    (x : E ⊗[R] F) : (D.affineTensor C).curvature x = 0 := by sorry
end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {Ω : TwoForms k R W Z} {lam : R}
lemma Preconnection.extensionPair_add (D : Preconnection Ω lam E) (e f : E) (ω : W) :
    D.extensionPair (e + f) ω = D.extensionPair e ω + D.extensionPair f ω := by sorry
lemma TwoForms.tensorWedge_zero :
    Ω.tensorWedge (E := E) (F := F) 0 = 0 := by sorry
lemma TwoForms.tensorWedge_add (x y : (E ⊗[R] W) ⊗[R] (F ⊗[R] W)) :
    Ω.tensorWedge (x + y) = Ω.tensorWedge x + Ω.tensorWedge y := by sorry
end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {Ω : TwoForms k R W Z} {lam : R}

-- test: TwoForms.wedgeRight.test_order
example (e : E) (ω α : W) :
    Ω.wedgeRight ω (e ⊗ₜ[R] α) = e ⊗ₜ[R] Ω.wedge α ω := by sorry
-- test: TwoForms.wedgeRight.test_zero_form
example (x : E ⊗[R] W) : Ω.wedgeRight (0 : W) x = 0 := by sorry
-- test: TwoForms.wedgeRight.test_scalar
example (a : R) (ω : W) (x : E ⊗[R] W) :
    Ω.wedgeRight (a • ω) x = a • Ω.wedgeRight ω x := by sorry
-- test: Preconnection.extensionPair.test_formula
example (D : Preconnection Ω lam E) (e : E) (ω : W) :
    D.extensionPair e ω = Ω.wedgeRight ω (D.toAddHom e) +
      lam • (e ⊗ₜ[R] Ω.d1 ω) := by sorry
-- test: Preconnection.extensionPair.test_zero_section
example (D : Preconnection Ω lam E) (ω : W) :
    D.extensionPair (0 : E) ω = 0 := by sorry
-- test: Preconnection.extensionPair.test_balanced
example (D : Preconnection Ω lam E) (a : R) (e : E) (ω : W) :
    D.extensionPair (a • e) ω = D.extensionPair e (a • ω) := by sorry
-- test: TwoForms.tensorWedge.test_pure
example (e : E) (f : F) (ω α : W) :
    Ω.tensorWedge ((e ⊗ₜ[R] ω) ⊗ₜ[R] (f ⊗ₜ[R] α)) =
      (e ⊗ₜ[R] f) ⊗ₜ[R] Ω.wedge ω α := by sorry
-- test: TwoForms.tensorWedge.test_zero
example (y : F ⊗[R] W) :
    Ω.tensorWedge ((0 : E ⊗[R] W) ⊗ₜ[R] y) = 0 := by sorry
-- test: Preconnection.extend.test_scalar_correction
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (a : R) (e : E) (ω : W) :
    D.extend (a • (e ⊗ₜ[R] ω)) = a • D.extend (e ⊗ₜ[R] ω) +
      lam • (e ⊗ₜ[R] Ω.wedge (Ω.d0 a) ω) := by sorry
-- test: Preconnection.curvature.test_raw_parameter_defect
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (a : R) (e : E) :
    D.curvature (a • e) = a • D.curvature e +
      lam • (e ⊗ₜ[R] Ω.wedge (Ω.d0 lam) (Ω.d0 a)) := by sorry
-- test: Preconnection.affineTensor.test_curvature_sum
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) (e : E) (f : F) :
    (D.affineTensor C).curvature (e ⊗ₜ[R] f) =
      TensorProduct.rightComm R E Z F (D.curvature e ⊗ₜ[R] f) +
        (TensorProduct.assoc R E F Z).symm (e ⊗ₜ[R] C.curvature f) := by sorry
-- test: Preconnection.affineTensor.test_flat_all_tensors
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (hD : ∀ e, D.curvature e = 0) (hC : ∀ f, C.curvature f = 0)
    (x : E ⊗[R] F) : (D.affineTensor C).curvature x = 0 := by sorry
-- test: Preconnection.unit.test_constant_flat
example [IsScalarTower k R W] (hlam : Ω.d0 lam = 0) (a : R) :
    (Preconnection.unit Ω lam).curvature a = 0 := by sorry
-- test: Preconnection.curvature.test_higgs_linear
example [IsScalarTower k R W] (D : Preconnection Ω 0 E) (a : R) (e : E) :
    D.curvature (a • e) = a • D.curvature e := by sorry
-- test: TwoForms.tensorWedge.test_integral_orientation
example : ∃ Ω : TwoForms ℤ ℤ (ℤ × ℤ) ℤ,
    (TensorProduct.lid ℤ ℤ)
      (TensorProduct.map (TensorProduct.lid ℤ ℤ).toLinearMap LinearMap.id
        (Ω.tensorWedge
          (((1 : ℤ) ⊗ₜ[ℤ] ((1, 0) : ℤ × ℤ)) ⊗ₜ[ℤ]
            ((1 : ℤ) ⊗ₜ[ℤ] ((0, 1) : ℤ × ℤ))))) = 1 ∧
    (TensorProduct.lid ℤ ℤ)
      (TensorProduct.map (TensorProduct.lid ℤ ℤ).toLinearMap LinearMap.id
        (Ω.tensorWedge
          (((1 : ℤ) ⊗ₜ[ℤ] ((0, 1) : ℤ × ℤ)) ⊗ₜ[ℤ]
            ((1 : ℤ) ⊗ₜ[ℤ] ((1, 0) : ℤ × ℤ))))) = -1 := by sorry
end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t s
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {G : Type s} [AddCommGroup G] [Module R G]
variable {Ω : TwoForms k R W Z} {lam : R}

lemma TwoForms.wedgeRight_map [IsScalarTower k R W] (u : E →ₗ[R] F) (ω : W) (x : E ⊗[R] W) :
    Ω.wedgeRight ω (TensorProduct.map u LinearMap.id x) =
      TensorProduct.map u LinearMap.id (Ω.wedgeRight ω x) := by sorry

lemma Preconnection.extend_horizontal [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (u : E →ₗ[R] F)
    (hu : ∀ e, C.toAddHom (u e) = TensorProduct.map u LinearMap.id (D.toAddHom e))
    (x : E ⊗[R] W) :
    C.extend (TensorProduct.map u LinearMap.id x) =
      TensorProduct.map u LinearMap.id (D.extend x) := by sorry

lemma Preconnection.curvature_horizontal [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (u : E →ₗ[R] F)
    (hu : ∀ e, C.toAddHom (u e) = TensorProduct.map u LinearMap.id (D.toAddHom e))
    (e : E) :
    C.curvature (u e) = TensorProduct.map u LinearMap.id (D.curvature e) := by sorry

/-- Transport along an actual module equivalence; the parameter and forms stay fixed. -/
def Preconnection.transport [IsScalarTower k R W] (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) :
    Preconnection Ω lam F := by sorry

lemma Preconnection.transport_apply [IsScalarTower k R W] (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (f : F) :
    (D.transport u).toAddHom f =
      TensorProduct.map u.toLinearMap LinearMap.id (D.toAddHom (u.symm f)) := by sorry

lemma Preconnection.transport_horizontal [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (u : E ≃ₗ[R] F) (e : E) :
    (D.transport u).toAddHom (u e) =
      TensorProduct.map u.toLinearMap LinearMap.id (D.toAddHom e) := by sorry

lemma Preconnection.transport_refl [IsScalarTower k R W] (D : Preconnection Ω lam E) (e : E) :
    (D.transport (LinearEquiv.refl R E)).toAddHom e = D.toAddHom e := by sorry

lemma Preconnection.transport_trans [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (u : E ≃ₗ[R] F) (v : F ≃ₗ[R] G) (g : G) :
    ((D.transport u).transport v).toAddHom g = (D.transport (u.trans v)).toAddHom g := by sorry

lemma Preconnection.transport_symm [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (u : E ≃ₗ[R] F) (e : E) :
    ((D.transport u).transport u.symm).toAddHom e = D.toAddHom e := by sorry

lemma Preconnection.transport_extend [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (u : E ≃ₗ[R] F) (x : E ⊗[R] W) :
    (D.transport u).extend (TensorProduct.map u.toLinearMap LinearMap.id x) =
      TensorProduct.map u.toLinearMap LinearMap.id (D.extend x) := by sorry

lemma Preconnection.transport_curvature [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (u : E ≃ₗ[R] F) (e : E) :
    (D.transport u).curvature (u e) =
      TensorProduct.map u.toLinearMap LinearMap.id (D.curvature e) := by sorry

lemma Preconnection.transport_flat_iff [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (u : E ≃ₗ[R] F) :
    (∀ f, (D.transport u).curvature f = 0) ↔ (∀ e, D.curvature e = 0) := by sorry

/-- Curvature is a native linear map when the parameter has zero derivative. -/
def Preconnection.curvatureLinear [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (hlam : Ω.d0 lam = 0) : E →ₗ[R] E ⊗[R] Z := by sorry

lemma Preconnection.curvatureLinear_apply [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0) (e : E) : D.curvatureLinear hlam e = D.curvature e := by sorry

lemma Preconnection.curvatureLinear_horizontal [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (hlam : Ω.d0 lam = 0) (u : E →ₗ[R] F)
    (hu : ∀ e, C.toAddHom (u e) = TensorProduct.map u LinearMap.id (D.toAddHom e)) :
    (C.curvatureLinear hlam).comp u =
      (TensorProduct.map u LinearMap.id).comp (D.curvatureLinear hlam) := by sorry

lemma Preconnection.curvatureLinear_transport [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0) (u : E ≃ₗ[R] F) :
    ((D.transport u).curvatureLinear hlam).comp u.toLinearMap =
      (TensorProduct.map u.toLinearMap LinearMap.id).comp (D.curvatureLinear hlam) := by sorry

lemma Preconnection.curvatureLinear_eq_zero_iff [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0) :
    D.curvatureLinear hlam = 0 ↔ ∀ e, D.curvature e = 0 := by sorry

lemma Preconnection.affineTensor_curvatureLinear [IsScalarTower k R W] (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (hlam : Ω.d0 lam = 0) :
    (D.affineTensor C).curvatureLinear hlam =
      (TensorProduct.rightComm R E Z F).toLinearMap.comp
        (TensorProduct.map (D.curvatureLinear hlam) LinearMap.id) +
      (TensorProduct.assoc R E F Z).symm.toLinearMap.comp
        (TensorProduct.map LinearMap.id (C.curvatureLinear hlam)) := by sorry

lemma Preconnection.unit_curvatureLinear_eq_zero [IsScalarTower k R W] (hlam : Ω.d0 lam = 0) :
    (Preconnection.unit Ω lam).curvatureLinear hlam = 0 := by sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W] [IsScalarTower k R W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {Ω : TwoForms k R W Z} {lam : R}

-- test: Preconnection.transport.test_identity
example (D : Preconnection Ω lam E) (e : E) :
    (D.transport (LinearEquiv.refl R E)).toAddHom e = D.toAddHom e := by sorry

-- test: Preconnection.transport.test_inverse_change
example (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (e : E) :
    ((D.transport u).transport u.symm).toAddHom e = D.toAddHom e := by sorry

-- test: Preconnection.curvatureLinear.test_zero_parameter
example : (Preconnection.ofLinear (Ω := Ω) (0 : E →ₗ[R] E ⊗[R] W)).curvatureLinear
    (by simp) = 0 := by sorry

-- test: Preconnection.curvatureLinear.test_ordinary_unit
example : (Preconnection.unit Ω 1).curvatureLinear (by simp) = 0 := by sorry

-- test: Preconnection.curvatureLinear.test_tensor_flat
example (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (hlam : Ω.d0 lam = 0) (hD : D.curvatureLinear hlam = 0)
    (hC : C.curvatureLinear hlam = 0) : (D.affineTensor C).curvatureLinear hlam = 0 := by sorry

-- test: Preconnection.transport.test_curvature_flatness
example (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (hD : ∀ e, D.curvature e = 0)
    (f : F) : (D.transport u).curvature f = 0 := by sorry

local notation "A" => MvPolynomial (Fin 1) ℤ
local notation "P" => A × A

-- test: Preconnection.transport.test_variable_frame_derivative
example : ∃ Ω : TwoForms ℤ A A (Fin 0 → A), ∃ D : Preconnection Ω (2 : A) P,
    ∃ u : P ≃ₗ[A] P,
    u (0, 1) = (MvPolynomial.X (0 : Fin 1), 1) ∧
    (TensorProduct.rid A P) ((D.transport u).toAddHom (0, 1)) = (-2, 0) ∧
    (TensorProduct.rid A P) ((D.transport u).toAddHom (0, 1)) ≠ 0 := by sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic


namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable {f : R →+* S}

/-- A map of the supplied degree-zero/one/two calculi across actual coefficient rings.
It does not construct universal exterior forms or sheaf pullback. -/
structure TwoForms.Morphism (f : R →+* S) (Ω : TwoForms k R W Z)
    (Γ : TwoForms k S V Y) where
  one : W →ₛₗ[f] V
  two : Z →ₛₗ[f] Y
  d0_map : ∀ a, Γ.d0 (f a) = one (Ω.d0 a)
  d1_map : ∀ ω, Γ.d1 (one ω) = two (Ω.d1 ω)
  wedge_map : ∀ ω α, Γ.wedge (one ω) (one α) = two (Ω.wedge ω α)

def TwoForms.Morphism.refl (Ω : TwoForms k R W Z) :
    TwoForms.Morphism (RingHom.id R) Ω Ω where
  one := LinearMap.id
  two := LinearMap.id
  d0_map := by sorry
  d1_map := by sorry
  wedge_map := by sorry

lemma TwoForms.Morphism.refl_one (ω : W) : (TwoForms.Morphism.refl Ω).one ω = ω := by sorry

lemma TwoForms.Morphism.refl_two (η : Z) : (TwoForms.Morphism.refl Ω).two η = η := by sorry

lemma TwoForms.Morphism.constant_parameter (m : TwoForms.Morphism f Ω Γ)
    {lam : R} (h : Ω.d0 lam = 0) : Γ.d0 (f lam) = 0 := by sorry

section Composition
variable {T : Type u} [CommRing T] [Algebra k T]
variable {P : Type v} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type t} [AddCommGroup Q] [Module T Q]
variable {Δ : TwoForms k T P Q} {g : S →+* T}
local instance : RingHomCompTriple f g (g.comp f) := ⟨rfl⟩

def TwoForms.Morphism.comp (n : TwoForms.Morphism g Γ Δ) (m : TwoForms.Morphism f Ω Γ) :
    TwoForms.Morphism (g.comp f) Ω Δ where
  one := n.one.comp m.one
  two := n.two.comp m.two
  d0_map := by sorry
  d1_map := by sorry
  wedge_map := by sorry

lemma TwoForms.Morphism.comp_one (n : TwoForms.Morphism g Γ Δ)
    (m : TwoForms.Morphism f Ω Γ) (ω : W) : (n.comp m).one ω = n.one (m.one ω) := by sorry

lemma TwoForms.Morphism.comp_two (n : TwoForms.Morphism g Γ Δ)
    (m : TwoForms.Morphism f Ω Γ) (η : Z) : (n.comp m).two η = n.two (m.two η) := by sorry

end Composition

variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module S F]
variable {lam : R}

def Preconnection.SemilinearHorizontal [IsScalarTower k R W] [IsScalarTower k S V]
    (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) : Prop :=
  ∀ e, C.toAddHom (h e) = TensorProduct.map h m.one (D.toAddHom e)

variable [IsScalarTower k R W] [IsScalarTower k S V]

lemma Preconnection.semilinearHorizontal_refl (D : Preconnection Ω lam E) :
    Preconnection.SemilinearHorizontal (TwoForms.Morphism.refl Ω) D D LinearMap.id := by sorry

lemma Preconnection.semilinearHorizontal_unit (m : TwoForms.Morphism f Ω Γ) :
    Preconnection.SemilinearHorizontal m (Preconnection.unit Ω lam)
      (Preconnection.unit Γ (f lam)) f.toSemilinearMap := by sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma TwoForms.Morphism.wedgeRight_natural (m : TwoForms.Morphism f Ω Γ)
    (h : E →ₛₗ[f] F) (ω : W) (x : E ⊗[R] W) :
    Γ.wedgeRight (m.one ω) (TensorProduct.map h m.one x) =
      TensorProduct.map h m.two (Ω.wedgeRight ω x) := by sorry

lemma Preconnection.extend_semilinear (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h)
    (x : E ⊗[R] W) :
    C.extend (TensorProduct.map h m.one x) = TensorProduct.map h m.two (D.extend x) := by sorry

lemma Preconnection.curvature_semilinear (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h) (e : E) :
    C.curvature (h e) = TensorProduct.map h m.two (D.curvature e) := by sorry

lemma Preconnection.flat_on_image (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h)
    (hD : ∀ e, D.curvature e = 0) (e : E) : C.curvature (h e) = 0 := by sorry

lemma Preconnection.flat_of_surjective (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h)
    (hs : Function.Surjective h) (hD : ∀ e, D.curvature e = 0) (x : F) :
    C.curvature x = 0 := by sorry

lemma Preconnection.flat_reflect (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h)
    (hi : Function.Injective (TensorProduct.map h m.two))
    (hC : ∀ x, C.curvature x = 0) (e : E) : D.curvature e = 0 := by sorry

lemma Preconnection.flat_semilinear_iff (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h)
    (hs : Function.Surjective h) (hi : Function.Injective (TensorProduct.map h m.two)) :
    (∀ x, C.curvature x = 0) ↔ ∀ e, D.curvature e = 0 := by sorry

lemma Preconnection.curvatureLinear_semilinear (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Γ (f lam) F)
    (h : E →ₛₗ[f] F) (hh : Preconnection.SemilinearHorizontal m D C h)
    (hlam : Ω.d0 lam = 0) (e : E) :
    C.curvatureLinear (m.constant_parameter hlam) (h e) =
      TensorProduct.map h m.two (D.curvatureLinear hlam e) := by sorry

section Composition
variable {T : Type u} [CommRing T] [Algebra k T]
variable {P : Type w} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type z} [AddCommGroup Q] [Module T Q]
variable {G : Type v} [AddCommGroup G] [Module T G]
variable [IsScalarTower k T P]
variable {Δ : TwoForms k T P Q} {g : S →+* T}
local instance : RingHomCompTriple f g (g.comp f) := ⟨rfl⟩

omit [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P] in
lemma TwoForms.Morphism.tensorMap_comp (n : TwoForms.Morphism g Γ Δ)
    (m : TwoForms.Morphism f Ω Γ) (h : E →ₛₗ[f] F) (i : F →ₛₗ[g] G)
    (x : E ⊗[R] W) :
    TensorProduct.map (i.comp h) (n.comp m).one x =
      TensorProduct.map i n.one (TensorProduct.map h m.one x) := by sorry

lemma Preconnection.semilinearHorizontal_comp (n : TwoForms.Morphism g Γ Δ)
    (m : TwoForms.Morphism f Ω Γ) (D : Preconnection Ω lam E)
    (C : Preconnection Γ (f lam) F) (B : Preconnection Δ ((g.comp f) lam) G)
    (h : E →ₛₗ[f] F) (i : F →ₛₗ[g] G)
    (hh : Preconnection.SemilinearHorizontal m D C h)
    (hi : Preconnection.SemilinearHorizontal n C B i) :
    Preconnection.SemilinearHorizontal (n.comp m) D B (i.comp h) := by sorry

end Composition

end
end TauCeti.Hodge.ParameterConnection.Intrinsic


namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z t p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {f : R →+* S}
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module S F] {lam : R}

-- test: TwoForms.Morphism.test_balanced
example (m : TwoForms.Morphism f Ω Γ) (a : R) (ω : W) :
    m.one (a • ω) = f a • m.one ω := by sorry

-- test: TwoForms.Morphism.test_wedge
example (m : TwoForms.Morphism f Ω Γ) (ω α : W) :
    Γ.wedge (m.one ω) (m.one α) = m.two (Ω.wedge ω α) := by sorry

-- test: TwoForms.Morphism.refl.test_degree_one
example (ω : W) : (TwoForms.Morphism.refl Ω).one ω = ω := by sorry

-- test: TwoForms.Morphism.refl.test_degree_two
example (η : Z) : (TwoForms.Morphism.refl Ω).two η = η := by sorry

-- test: TwoForms.Morphism.refl.test_differential
example (a : R) : Ω.d0 ((RingHom.id R) a) =
    (TwoForms.Morphism.refl Ω).one (Ω.d0 a) := by sorry

-- test: Preconnection.SemilinearHorizontal.test_identity
example [IsScalarTower k R W] (D : Preconnection Ω lam E) :
    Preconnection.SemilinearHorizontal (TwoForms.Morphism.refl Ω) D D LinearMap.id := by sorry

-- test: Preconnection.SemilinearHorizontal.test_unit
example [IsScalarTower k R W] [IsScalarTower k S V] (m : TwoForms.Morphism f Ω Γ) :
    Preconnection.SemilinearHorizontal m (Preconnection.unit Ω lam)
      (Preconnection.unit Γ (f lam)) f.toSemilinearMap := by sorry

-- test: Preconnection.SemilinearHorizontal.test_zero_map
example [IsScalarTower k R W] [IsScalarTower k S V]
    (m : TwoForms.Morphism f Ω Γ) (D : Preconnection Ω lam E)
    (C : Preconnection Γ (f lam) F) :
    Preconnection.SemilinearHorizontal m D C (0 : E →ₛₗ[f] F) := by sorry

-- test: Preconnection.curvature_semilinear.test_identity
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (e : E) :
    D.curvature e = TensorProduct.map LinearMap.id (TwoForms.Morphism.refl Ω).two
      (D.curvature e) := by sorry

-- test: Preconnection.flat_reflect.test_identity
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (hD : ∀ e, D.curvature e = 0) (e : E) :
    D.curvature e = 0 := by sorry

local notation "A" => Polynomial ℤ

-- test: TwoForms.Morphism.comp.test_left_identity
example (m : TwoForms.Morphism f Ω Γ) (ω : W) :
    ((TwoForms.Morphism.refl Γ).comp m).one ω = m.one ω := by sorry

-- test: TwoForms.Morphism.comp.test_right_identity
example (m : TwoForms.Morphism f Ω Γ) (η : Z) :
    (m.comp (TwoForms.Morphism.refl Ω)).two η = m.two η := by sorry

-- test: TwoForms.Morphism.comp.test_differential
example (m : TwoForms.Morphism f Ω Γ) (a : R) :
    Γ.d0 (((RingHom.id S).comp f) a) =
      ((TwoForms.Morphism.refl Γ).comp m).one (Ω.d0 a) := by sorry

-- test: TwoForms.Morphism.test_ramified_chain_rule
example : ∃ Ω : TwoForms ℤ A A (Fin 0 → A),
    ∃ m : TwoForms.Morphism (Polynomial.compRingHom (Polynomial.X ^ 2)) Ω Ω,
      m.one 1 = 2 * Polynomial.X ∧
      m.one 1 ≠ 1 ∧
      (∀ a : A, Ω.d0 ((Polynomial.compRingHom (Polynomial.X ^ 2)) a) = m.one (Ω.d0 a)) ∧
      Preconnection.SemilinearHorizontal m (Preconnection.unit Ω (2 : A))
        (Preconnection.unit Ω ((Polynomial.compRingHom (Polynomial.X ^ 2)) 2))
        (Polynomial.compRingHom (Polynomial.X ^ 2)).toSemilinearMap := by sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

/- BEGIN CODEX RTOQ9T HODGE COEFFICIENT RING ARCHIVE
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
mkGGfT9RSnLiUf62N221rXEiI+UlAnKlozT71OMsHlAG3Gn4egvJWkZyRj2Np2fmSAWo1xwlb6W45XXrcNEoRTWg74JwkNuLwdA6
srMbgN2iYcUwRWPVeWTcu3+jwXK0etMTwJgpzq1UYsY99vhPv31s/1lnXtqz/Gg83sN+NAZigiMySx6NTT3sklaJuccutm/0GGvb
TssYuZJh1kqJ533t+ChqW9o1KdTdKXKNvBzn0gxDddI8P+TTT/fsU2+oXiW9VpelOZwbZWp64w+6+n2zdFoPvK5qr+35uefnnp/f
8Yq/Kq65Pue0joVdRbnfdej5d9O131NfT3099b2H1BeVIaRuv9OkP3e5sFAylZ9qj1nnAxy364WpooMd0MJRjVPYDGCa4rWpmiu7
QsXMx+i0NwMaeTMq8N2OZvEw28NsD7PvPMwuaWS7Pij7aW6qkW4rzE78NB7wUANd9Fsv3i6V3Ycw+skDdQ/UPVC/P0B9W7e8wBKr
mLOiLNMktcJ0BxVWxbY/xni1+sEXAC//Ty/5wl4TSqBUB1WzSa5deZPovWoMokHgzxnIkmvh57hJUtv6jvvzuN3jdo/b72j6GqIi
N5iwzsVMe45CYQZ5JoMdil3F60lhqxg+urYDRT1Q90DdA/X7CNTzWRq2K7YGVehRJICywTrll3M/Ph0D9splgOSGbJnsqSt64uHn
FEY1d8BlO2FwTGX01LEak9KUltIwRZRhw6U2V2Z+Xz+Qz4PBrk8O1mpWtecDng94PnC3exuQF+7oOWQfABnQz0IG0JmNx3pYZ2sD
ivWUzQCv6JVd1qrUNLTplwz1XljjuBHsK5W3hmq7SF0nc1rvUUB9I9gOTsBJwleB5UxpmCpc38yqhWWcoWZbpZIy1Dub98Gbz+Yz
GexNA6npsQRoW/NVPdfwXMNzjfvDNT6JAS7BEl48sVpiF/y2Ao+261d+FTiHiWnTrpHfVFl3+Wkt5Z9gqwEwln11LDE5c0fIyZFE
XmcO5lLlMoDbVpylsOZY4d6x6v3VDZOi5vs/f2ImBYoHIuxzhkPWWUk6kxGWNwTk3yrmNjZBaZaJBgb15QUENbVdulGX8Pvpcz0J
8yTMk7A731NAqeUHTMEqprfW1VlAXXxpFma3GS0ZGqFnzecHRajQW85ZuDPm3ROo/JAIcWTU7QibJWHV2hgL7o6pORTdDLIdDLOR
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
QgSDmFhIEYIkku1ZcPCxS5fadj52chfIIB75ZMOr29j/EUV6QOGs4lLQ4Ddb4ACNNJreMcMJIVIx74yHMPZpNAcfmEXVi1Tt3lmq
XHpeWM5L7Xmbons8+uuPt3+6uX0zHumwQ3Kw3yxm4Rd/fv3m7e3N0x/efffnF89vIpX9x6n7lEjSc0vSFrv96iH8kQnum6MSn1UK
8CPlVmJ3b9jiayrhSJqcaPZH60W7Ijz97Hr0onrth3ubGjLHsQpn+SKGjlb/8e//3+iVWy7mkzeJy+DW2dJGvUNGHl8umA4PLjcq
2FtwvjMRtHtb94j27wqbEEW0tCgsNRDOWR/+tEZTaCikRgCglQFCW+McoQBjqrhHlFskFUEIG7Z3SxwImSABjaNeC+iM5TY4695L
Yohk4cxRCJWzYcfHEIrhxksOAPUxVKbDngdEHXpmEy7hnO+9ameohNL9X9Irsr+jIeb+VzkeKTgtsH1qUHuLLBDBQxmBsLuc+qWd
DoBiv2LbbjSHDrzHrzkEDfrs9TqSfDROuDOtZSCUzAiilHeUcQiMhBoHERzEomBOqCAgsQEWMK6totZF7JSOLbcxkEIN2ezSO+05
8lHqGoctTbtZGKYU4EhBK2Vsu+iCrqFOaSkdwlQrAghgklB42mbf29BvgzOTg4vtRALg8b341xNv2NiUEF5DcPKmxEAgLHpsSn7Z
TZn6NKgcRyp5721yyU4+u+aJ/DQNCi/WhJZ5mjSneJIX5Ekry50Sxw1dT8mfdwYLk7yPQig1mtnFZVnYVOoWA6Ude918ICWtC6VS
nbaOUSYfo3OtzHUuYjVquYykMJscl9uTt2tCd01n7jWZvn43YWcLSVDjCDoT7n6Nbc4j/+Yo+AIupeTredPOqPC5wRxwbnT1PnxG
zPiFw/If//5/oRyFXTOqt1CwUdxs8SktSjFbEl1QuGcWuwClOuD7ZVD60a2IrUMyZc7H3GA3TKma51VHIAyPYBw+rfFjRCMslvFz
1EhP52F91Owq+ieRqafcn6mixqPUvMCsE71QaX+SmuOkhyVEwnQ5arV6HdlF/ua0Hqljyqp7U1rH1L0+ljDn5jmlD1GYwNj3KV02
KRxRVaP5cdmapan8bBKLn8MPwmzHB1+tPy1iq5/l9Nfwee8LliJvuRKCnmTAx1WOLU9qOqirwskUHpZZwPLKVVxUNuMu8tOjtr+q
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
UViv/rVH910bxPcxxrx/P5L4cnT/4idfvPxDWDZ4qil8fz3sQZSoulcidM1ymoJUkScE8ZHDNLrPt9t/wL4l8nvKSLJgfnQ4/4sh
FEXB+esE2vif/Nt1/gHRmRhx1+vOJKz4E6lTd/aFSX6cjhb4NVkGUnQPpigxPmNTaG+/jypSvqDhePMMFUPfpWjM62Ffwq7F8ZaY
hx+b28156gfPhTNJ5KkfAS+kT6WsprdzSJlKkU/u+KX5aOy9GSZQuMR95e/QpnQzUA8k4/4av+pB76nLQsBKvPER1sLCLz9eV1nS
MTa8p2BgWHAdvpLy0LlhLSjCBIEW19Z2JIrXDIlev3nJa7W7bj3rY5bNK/RaSXWZ7UOpdrzejnO9Yu/kWMp5zKuPX3BGXfHZUOZ1
5ZjeDzq6Kp17fxW4H1/YzUK6LhK+sS60JmqVXixpOwvKnOJbhE7bqvolVtdwVtc9726y8Nn2Wzj7rY+NzmQaHg4V8tQOqw+NMwhq
I8k2BvYgQDQU0MSqpqdcWel9e9XCGBelz2oxvmvNnM5s/a9I3f11U7ibWe4BPYA0zWEs7EorKrg8+CXeH9tAUjmEErMHFSX9Wp7v
iIPH+Uzmydl+Aa3lx6d3a/y9ZDDrZ/Z2avcuC+IyPPMjU1dUq7kwDDaL5chZwcdnOWWMNhTwlgSTVGlDv+Ywb0FxrQDCXmy+0XiY
RkKnZ9Hpsk+jFPkjopS63doptpsXLR3s3MlicZrvNhpnZ2f1SVYfLWv9dA46CuxDA7TMPG+kPD6ood/KGyfgHU3TRqu92YM/9o7n
s/rpcIRdiFi//5xntrab7c1aq1lrttleHr11UGtvbEbN/ihpNvtbw36SbiUbO4PWTmfY2Wh3mu3t4Wi7vbnVbY1aG8NOur096G80
N9qbo+3Njc1ka9TfTjsb0kq4JAJtJJ64ew9vvJwj2nvryZP3om6zs2IYJmU0ynwR0jteOXuzWE7eYJJkM2FZ53FS66FODWUWm4cz
P68rlZTGYDaWFjucSg87ls5hf5fEsUPNkoYDoHzOi8xp0nej3e8J1ufvCh9ESDMVVvgrZ6nho86QKpKqmQ5bMkYtbKVLkHpkmgS9
ErFUqXvdZaHnlLsLamcyE4uAmS9tF62Bqoi8Hl6gcXImJJPVusnpfak116py4w4a/esiBbA8S9dbREQAvu/SNUG6lkpeHzTD8xrz
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
rIZCWWZ5c1PYowWYQEpSgZSY05A0/iqhG3tCl927lX1Ze3gyu1sW7T3n7Cg5a5su5znChEsWuTY8p8amOGQylRHM9rbLryt1T1wB
k5VTbwGKZdQpoKSVhdckTPRqEQEBE7VyR00Ji6ND7NPRHRdEXRElhIOUYVFvRO8LcckI0+gHg/ZwYJPVfL9OQZ8LSapm9lADLHZu
MtRg+1n6nfPK70loJ5dfiG9zUnXpCLk1zJfxyVuznpZ7tZb8ytO+8rSvPO1/+p52WykMa3i2ZcBSOadkaxpdORmp6sJuIbpZqd9O
TXhcVQjI4lPVjkkc6edG7QFV+ywZdQrtFNdtVWMONv9xHWEvUdIVONPLw9LH06aV4AW9zncvan3Pr7MQYs+8wqOCiqOl5aX1FS8l
L83dbvjIV+ZcXsnTlTxdydM/fXnqksPU2eYL5Aa4Gi7nGguHF1E4xWNHcDAVfiD/DNBZRCoqNeIVdkvNP7vnUtt23OufKxPSxbPj
AJ/YJSM3JGNCpqsTsjNvEzDVBNlrAi4tf+/3VhKY2nd49bjOwZZQ5aL2Tlyd+K2x6/AyMthFW+YWxl9/jHQlxFdCfCXEv5tC3Bwd
27qjHlqk0kIYLxhZAS2noGzizJfUxvMW25AbQWFg8KaoHPhrlL20ke+gXLURnXzdNbcTkJBudnX1UjqdZinhqh4QiNVvegrOSrSu
ROtKtH43MruDk7WM3evf5Zk1uRoqr+9Q0MjGD50LVzORevfMg1rOLroiMeubSfFiGd01Ei5qTNF3TvLuaoOtIGqte/pcgaitUcrf
JcWts2S/2qzPldhcic2V2PwTFZvEJ8gvpVZAbQKJJ8Q6Uc4m+kRSortrec8usp593+WlRfItCqPyoRUIRRW1DdEqbN2WE9Nq3aWT
/CKvpa7bhyJc5FAsUTCPKt5Fin/wTRTWNZtM+J2T2rfckOnufNmhS8tuV7WwlNS2t8sgn29fncNK6q+k/krqfzf90GTE+n1kdTDZ
CyIf1ApbS3pB4aCr6bGbAlAYUf4KHdHhCOuCILDfMf67GgIOWoW6wK/NvLq6CLA9lEuEgPMVd6WS+BtYZLcSvivhuxK+303ha6Hh
RYGDALBttE+JWioObGEbF8pWfamLDX8zgsKhLP4OBoVpisSeaTAv5ICzfPmlVsQOxsgWEfdMl36HP17LGbAMacZOgSko3D6bHGfO
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
vmN70+P+bDC42ME2tozuUh0TM3hiISNixuaXh5N3XbaQHEyTUggy54qTSGPxCqXh1Ybahql85iCJz+QosBjLj8I/8A/IRKkayGFV
+Z2+OahW59wv1ca1BwPW/sM315g8zFiONUTNCwKoaKnW8NZA1OnzyxhfnfXyn34TtPz4zRP2+VvlQ6gQK3wVW4WV3oXfY0RyWVk1
kDlVqUtIsQbNAwOhIpLm/BFS1p3t+w92rfcf3L9/aN19tL2z8+Dug+3dx9bDrb3X561GX/Xj+eTksvzRMaM8Vp97TGK02pRT2nvQ
Cp/fwJPU0W0v3JRENfDqM2fr42YyMJm7NWq7gkFnhvZuWWxHvHNbjo14Tr7S3OGVpnSS2+TadcbVZGg5kraeRhTohqZNCWvgRTLS
fVGm48Vkpj3lu8fJC67EIgB25tyM3+UpU75niUcdaVGR/fIkbDGPTGHc2PBqfEUpPvg013shIGZA2CyQnN/OnAzuZPxP32Fm92yW
K0HW2FN8UiBxqBx/STiWVdrO18tNn43JPnkN6+WT1GLr9seDGHm0REUoeX9DVnNkr6ocWaItsdyTI+SGgX3Xj0itRpmTN0kLy5zh
BIE4cp9nSOJk9LPSJI8ylcpD3CGPJAHxfdph4aPBlxGIyBCUB0MZOxOS00OoaxD41SJ+MWJ9vLk9DOfsUP5NqhHfKraZcnGRBS6H
L6IBC4L2iIQSRHmNyFKUgjbM7TnJJF9cEwI9aHv3XoIWxJUlMueoscQcK9G2hnHCx5iHADqzTTHBPE7/PZYvgQYjSi6gJwGSvSn8
dzwaYob4p8PdEQt5r8kMERaDP5rIyHSMwV46GsxoDN/HnAEWDk7FaCl2vv56dbZrobFliQaV8gIG2fXhFLk9bicu9zMS7YyPS/se
s+oFz4hv9iPf7D3JZMMrLbaiYDSfeE0L6QvoaR+Fo5n5t1nBUNbsghCOOYeIqB956Hy2yztDk5SZB2hXK01qQCzGChCIaFEjAS3K
DJKNaJmxJF5A0/mgJpvnldOqWqox1qM5Ne+hJtSBpNkNjbtKAbioRUCSUIfYg5K3nkiE00gvXYV5qK56l/bkOvUbpX2/H/P9D/F2
mYJE6HZJqSF0zonpPNGzzJnJUyoyLJhjDCamBu+J+OtqmtWlNJxTEvFI1+Jl9Y2ukr7e7ht1ZO7swP8PnruDRZzw2//zK04uFYqq
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
nT32HqBZg82+gl+hav0YLyx9t0pjc6sJfrOKn0EtdFFavRdI5exxtkDNHsM3Il6hBa80xL6tyhQFfwb5Ki1stcmhdeQGu2PPdgcz
xsvpySZtAc049IleE9SGRpLj+A+Gh4g9+O1G8O1dVBsc/LLBhkLU4uulJ+5t3ecfT5Ej9NhugGfTNglT8Yv11dU2QZPhLH4F5+PS
mIC5CpTMA/Jzl+NxEJiGY5cgZl3tRlMbZ2NlpRU30ARtYkg/ImfI0IAYAAh34Z8/+fSdu3CzQRTbQ2PBoYuC6HsfNm8JK8loSKxo
AjoX2iTJG/bOExVrPnTtU7bA5saGODQQaRxM3ud4xL72xUWSvzQYisJPo8EpO7tPnnA4Hz7zQINxPvSGz3zthz2m1oR/QEEB3/Ef
opVEQEeixzaC8R8EdVJ/Jtq2w0jbAbv96Q8eEsoZH5O0/A5AiBEIEKY2XJCZ+n3b7jfXXLttt1u223R67kqzu9GyV9aX2w3bYRRE
DnAAYv0e0HuGlstt44+H5EVg8/Qa6/ZKa215zVnvd90eyHVrGyttpwUY3Wi21nqrjd7yxlqzt9rsN9rLzZWV5kZjrdft93trvZUm
buMLcq//7d9aB4xiXgi5Cr/+x3/8RyKUwxfoSAFMBMbNCSxzDnz66azVaC5rDgLYE3uatD+G2WtN8d1csOKrYBr+XbI/sDHs5eZG
q9VYd1r9htts26utbnfdhnF766DZLgO87G6j66yGx0B4CobB5MBbkkjdkjaUGB6C9hM5oNS19eOZz88jR2cWB3Vo0P+6zeXGWrPb
Xes2293Wcs9urm+AJO827Mbqane1B0L96kZ3ddVpbGw0myDtN9rtnt1ttVbbGyokmJnkfRtkIU7uyWv26TuKra/USXFs3QxVKrhw
eGE2imzBBey3V1fclV4PdLnljV6rtWLbrZ7TbTTWV9d7/XV7zV1pu0671W67jQ2YuNvqNbvLTbtpu+2WYQ7TVtw1UKPa6xvLvTbo
jCuNlus02ojfy41mz+n1VzZWmnZ3Y6O/vAGSPuwVLujyhrsOeGo34XYq0+y6Z3uoxPnK8Aiobntto7cOY7gABNvtttY2GvCpDQQA
rmR/teW2ms0+nBDM1+y24UJtrHWd7ur6irOuD0/ygjJ6s+32+sttWEgDTrK/3l1bs9vNdn/ZbjZ6fafZXWsury1vtGH41W6/4XRd
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
LYlvbiJMbd3vuMn62oiA0j2nZNBNk3IjOoOV0JGp8KxomWMqBQTlWh3xC2MnBM+W4Y0916bB1OJ8G6lc9QgNRMZcaEcXM6NfHwJt
64qNoiCyZyJz0M8U/KzO7t7bb1e/6da84/2T/e8Ozw5PLHXb8f6f37zbP8hR1r0kG2npVHu3tXR87pKLpp/plkk56f9y5R1LPFop
J+WVbmM4WVkq/cxhPVdNlzm9u9o3PV16Pr6UJHZqzFSjB87SGar2uRXtXF1myVC4CjP/5+cjjvZxPvr0F/Jihl9+yCuLFCEB37eI
o3YByyPRfbq8WUxI+8nbCd3BI8tLSuQatEnWqKspQOZPZOH/SQz/P4kfMRDQqPCHnlcYnJ/flYZ7QfAHP8TiuVq6AZokq81VVOkD
x4neLhcEzkFTai6fqGJm2IUgxJ2Omsj5vXGET4PZUN0njTGnXxg8+j0qfA+3SvgEUqH6GAyf5GNRPsInbklU4RtZKNPeI/xe5Iez
oIfNnPVHMPAfMZ+MOQZQmbG7sOrDPB4l84ibzhNfI35uv6ni/aKMlTrVy+Pv/L10sy7g1n7vtEN/Z753TycTnCgOXa+kDKxdH2rw
c0iveHThcUCPw8j3hK3SIDojjX2FfZJOZVS43PxRfmD5V5GiGOF2No91N4j+eCvxM6wx6C822eQWu87uPcn9itxGo8evvlpchfDP
5knxHf0tGl9JbL3oceGcRkQgyghscADt9oa6HM4ZpcmmsLiCOsmSMnvYd00ss32y5D9KBCymbaSKe6gZ6pDG0KxSqieuVJYcCqGw
4nT0pEJpL/gnP/zMGPFqU2rbvH7ad6vZwZktciQNvmxlaZnE4V0JhXcoBi137fFq5oeDYbAnz9RVeqMYNnNfGZLdTRAm/flWaJ33
RpRjKpF9hbODg5aBh10tr5NPm+vVp/fo0BuUP2EoAn/P75XLzNKCUO7PdxQy8M7PN8O9f7IZoGRBXSKdLLMEtcvqdQdp5RyBrBJw
J9E1WRda8+VleBcvNmFyH3J4C9EdujKUZRjrh5Ww3gxbbVQKZna+0HetXP2w2WiHtToGOyEywzbjjgbVutLhOhmb9rGO3DbpGA+A
9c026KqBPWEuTa914IlvZ1/7w3+OapXds9BjZ0OY0PPzwuAvwfCr83PYlXoyh+cmtEXkLDl5yytOEtsrWuWCRY1jqU+Md5GjdmDf
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
zCW853i35+k7t9BMvFCaiTmQSOgsXgoUumzKi3LUTSW2pYrWIpVF7znKZHpS2yovY2I1J6jKNZY6vdCVYryjzL+RHI5qXXYVKTvX
KZ3LUk9aC5S7i4CPP/SnJ7f55ETiTvSwdanQKFWwYsbFn0sSj6cPtIFE8psHu2aNGQbZuIn1lvOAAnC5zWktQN2YkELZKyWLJhtc
rdo825jK4JpvZKvuwbqYVRB8UfVw9s1/dvwG/PQjOgi/2EThB0jrVMHWqXWVWe4OWbIf4C7UCxeTtW8D6kp91JEKHiuAi5NpC4ih
7DbpRDg+3HddWCI7/nm08QNzvDnhbr8IknbDMCLjrnza0DcHpvKplko9y5QMnz1xPt0tufCoOZlvXG5oiHxQPi4CZ/+qg9Nfof/i
3/6coEorwBJzLJHokYtDOXSOYkblWOYVHeUSHXok12julDuEX0iJgz24aXZGYgzauMPG0a70QrLj9yFA0P7myFmKFhOONng1sdNC
p90Aak60kPAtA91kVDhUROwQB/RZiprVogRMu0Uz6FfKen18VX453bpOvei8+HnxnGep4O4fORA90/Gr+FHIwM6V6rHTSsdozzSj
atntLE+iujHZIJ0c5idmAklzLy//bZvA6H79Wzn59P3TUffVrDaf1rPQQW/6ao4hc4KwD3h84cCznqQMcD7fk9TTXJDIGxFELmmf
YaM//aWFk/7lbiJMnVov+uKXRYFdk+foMuKglp8oc6K9HBPt5Z9oL8dEe9pEixXMsJG5JOPoc5ZU5lkMxRdHFqNK2VgXpF5v5l1M
8XolyTOO2XPjYmiWKNUhd5OWOppigfWK56qJiNqUL7WsOM9yFQXNvdrnyFnOs1LtXshLBzbn4a4U2j6p1ytF0VHgKd+DyGqqXofh
89XG1awqkfHcVigck6K1vEquIjJhbTHRaJkkPyRp/tVXrWKyq129sKZ3pvuoKdeYHKviuEuZDfwmMUDrs0AzXeM6r9fnM8VHUgyc
u0XeMt7chnkrav/dR6uNO43WLpKdeLWqudiN4ZA4+PAcbpAXkoWfB5gWvl4mI7Dz9hymRRn8BW//3Hj7KuxMd9buP9hwVtfXH2ys
OW89uH9/29lZ29h+Z8tZf7D2q3uXwny0XrEBqWSsumlGYjPOUUctLfzXMCh9J97JdjX1tJ4vqk9NqjM9mA3nmZmWsm2NRymvW4sg
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
END CODEX RTOQ9T HODGE COEFFICIENT RING ARCHIVE -/
