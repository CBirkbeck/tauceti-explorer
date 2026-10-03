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

/- BEGIN CODEX 5EBB6F HODGE COORDINATE CURVATURE ARCHIVE
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
END CODEX 5EBB6F HODGE COORDINATE CURVATURE ARCHIVE -/
