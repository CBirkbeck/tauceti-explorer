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

/- BEGIN ARCHIVED PARAMETER COHERENCE PAYLOAD
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
L6hDgM/D1AWlZ5JyxiSKrboujiJH3aXCK2LUXfeou+VGRfKx41tt+rqAE8kQVhfsuwXFTDLeKQNcqpiJg/RLn3JUy2ZXjR2AwGuw
NU4M9aRWuVEh0LfUEAZqyuzyzPjDKMZSl+vTb5yY4Nmd61OjwfV+NRw4wpoT6CAFOqP7RGlEDWdE1HBGRA3PG1F5WCoqL2Qiit+b
PrmVJW5vmYLg1jzELZXAvmX8eqvU+UbKcJ767/82zaey74a3pt7S7FHmu7GZPAIWOkXWoh6nMHX63O64U4Apkgs78WS/DLSVg71Z
pXfQQ2HWh23XrSYdxZVmza+Xp64tm8KScnD0sLvXcOiVqbVLQiTtMkitOZHpVQrrJcbNwX8ZqOZDXtIvZgXOV3KPGUMmmlyVdP9N
4THL8JnNcf6r6fmvFs4/rzNPYVrKH9vZt8olP78LYTaXyU1qtK+QyU1J3+1cL7kQOaNJ//ISW99cKzDnp+3+4pGbP9t+b/X+z7bX
F1Z/2+oP5L3J02v844ORH8dGqVn/GJaOgHWD0BudwDnANS2NoyVHfdrmh6HX7Y78Q3bgBSPJazhpqDQ2bf63i8sikaXKOw+DwTin
BBqqLvRhaJf9FAcndfEJd0eKlpNTxZMuFn0f+uMopDqOok8AViaI8Y8U1wGwW5yrn8ugokZ1RkuD/clQDBjiOCDFa/v8j2TtbKkw
m3si3CfJIhrWtsGvRh0PPM/lSgBSE7wA7iGYocUemmM2mGbUuE88Bk9+ywvh9yIqqSn80+YvhA75imNraVHivcKN6CCK+WDcJGSA
fPb53zET17uw0E7fHzSsb6kCUgem7NBfGRMjBfNHaZYR9kp2lmke+wflrnnrrsOUU7I5s5d4qvJvJy4NRLYVtuZYl7JmOHvtOmGC
10r5+KQDLzekicNgO9Ge1nO9P/l+GpOoS9zVtuB/ky7Ap/V6FVx4fW4FIHFfbXPkpl4Shmw3ci65vsfZysOYU/ebYChVv8qaKumQ
fuCDjL4HyFf3AXMMeQRMDSjf3VzhtCQAEMSZ8B9nlSVKAF9LUqL+ACOZXNc0hSYcyFVLs5Y8cwRqZ+gPxnMwkHzMX9VfuPzsNpFk
2gxqhU72jy0ElXTPWySwkcG+mD20zlbL3OGP3f76SptAgM5hFySRHvGHyrCL7F2oGqxwVK+7fUkGshKs8ahsdIRVMtcxt5ujHZU7
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
KXH8MUI5LYDlIT5jlLkYyMWathDNAS6B54wbIJzyAEEnvTGCMA2iBpSQhoMQ3wkzeiMYc/ivI7NAW3vGs1qn4cjdY7pA60HIYUAV
9gBbHSxsiMAhEWz8NbKrUA9LvhShaPyl4gbUYPVeGq+VRxpCTZjjkgKhvQpzl1gGcpE9Y9ZNGLXgZ5Ykn0lY4J4mfl9/fwraeWgn
LY2P2D910jIbdqdw+ZOqH+Fnu0lyqU+y6/65b/MZr9/qpXoSIpR1dP/HWp+fRk+51Xr5PrY12k0tG52AVW0mldjL09VdtisET8wM
ftPWXSg9bs+/qyjBKtc2RoRR3qkpidhUBxeku85wrPL5I2EYxY5vVBjoRckGPmmSdutONydhpw9R3lXdynn8AFcNSVsv87rTgzw8
9YVLzXmDN7de3d1sml7ImQNNRVBPqk6mL8DiBVy8wK322C9QKj66vC8/O/vLs+dvg78dUzntMvXXKA20n8ye4QT0NCefw87Jp7t9
jlMCeJgfZr28qYov66LG/u6YYQL8fBIF3asCJ5+VA3LI3W+NqlK0y1VuZzVaoSiCYXVFXRXnLm/vv06yA+2E9jwd5q1GwqUeKYXE
d7cJH6wbk+fk3PCPug35WqWqwNvgazcJqOH1Luqk3hKGRwtYPfHHgiXWRnH2IYm2bFIKfhTbi29+2W6+PouFf3eqUUdQRR8hkzwq
N22uanmKNsSUaVpnI+cZmqOKw2nM81nqKR0rCJKcRmW05qms71NE31rdB0sB1TI3jo6TKXyAhb+7NhHITp9p3pl5TV1Cg8y2CZ0I
zSXY5boIVNxdV/2Lb+JD25PYSX5p3OJtZGxK3/YnreK8pplweMqUDTKNlo5VNYVcnxi+xyv8NZuzPP6tspdJW85Vrn2pRNOHlcdO
Aw3amhjByw8ukIcOcCI4EhAiHZxuxz31THusg4NPsRSWIYSpFeFBPFcMA6AskuB3wXYj/PceizUbTbsGrtoMs2pPtiVtZaGesvRs
DrutAD83LpayT45bTRtXsgTwhATOYAqrb/jjV3+ef4vm3+I68axF+64bSkxFTDbVyW5SD/mTXEB7s1leTnR8Y17c1HyAKaj4lDzX
KYwK/hJ0902VN8rRlFXY9NtMuSEY4OPWYCyzzqXzVZfenGHVrorN6zHh8Lm69AsstPdrdfPhuIWWi5TPcnXy/ZtaZBXJSQuve7nz
Qfqmo7k7OelSu5Kcf21LnqJJdnqLhfuXSZN9ixCcdJFjmclwhSglNgUj+Zzo2vCDfx2luJI30qlLJ3t7x7p5X8bFS7lDsaA636Uq
0o5B9OgrTfXTGin7d62EjXftFjCQwpGXTP7au0+THbauVj8VI0/OM+hd23eW4fMJEBXrvIVYeQAF1xBLBCiimjhkjJGUB6/aIW48
gRYyZ6P7LCDwaPyXLfKI63eXq/edJ9Es3NA7IwyEzuHgwUNKvPfKEqc4hUgRBbGwAmKthSQWO28VJ8AbIXVUoPtcCy9vnxMTCLZ3
dggxF+PX3Hr5y7vawxiNtaPJKVpVLQxlk3IvYkJBie6F+NyuBT72LRll8NjXlIT+jqibsK9eJ4zoXRNDvAt+4F0xIV9sJtnlVU5h
mVbOGRHjlJDyTueeVSHMmuL73F9dRV0rE2x68ILdu5t3uS5qsgdSPVZ9vRKTTauf+3JzvvM95GN8D/rf8Xt8zrXZBkxaAVqLLKhS
ppbWqcuTmwhI170za65gZlbrENDdrJJMmptWFRafJqLsnR2ZWm+YgJoG94BoDjhkTAmFiKWWEqEs9wwrhaOIt/JEequ9gQIJATAj
xn6+HfnYfM8q6HtXSVytJ6oP2q1SeT7Wn5tctJ8onnclmHt3OTEQy1cp0dwRV0lczTur3k/aVLppt3Q8Ve6OCNqPKnn+dcJot8OJ
xxix0WXKrfHq767+uxmu3EDnnbq272ow5N32mjtuukEEj5huEpLf8/jtHzQOJ0Xk3Wh4mgDko3WAeQzstgHs3mUbloKBZrZNAO+q
MH/HNo+eqN/l/b8uB/9Taqh7Pwmhn1Ti98Z8cFeu3PZVIlrjZ//6zSmdWMq255W+/tMp+xJVaY88CuzRR4FPGIXPnazzJ/Tm/kqv
LjffrNVddpW+zPQ7Wy9vP4QAoRmgl6do4pBvvcTXb+MU/v0NNf7mcmU+5Hyc33ag8deFDpw23O0X+fqv8bP9Tld3/7uXpvc5ApuY
Sfj3Pw70/5dvLR7prb+AgflC+EQR015en1y5qzBIsxIxlk7ci0YVZVZF1EVNN9dFRTX54GOl3MK2pHW4xDzl7M1i1euluq/kMENY
bLI2cpMjFbzl5VVsqJvlcnN6YKKT00m5d/mHJIie2oPfRNXZtYvaksuPUSEzCby3K4jzybUCe2z+d5lSAHcO2uTMlUg3jpdl7AVX
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
87wqNMOrcSflxwtZZ6MtCuSbI8oBc2UuytTmAXT1yPThkS9bUQVHczNrEj0MulS1IbfKdhyg1woJp8FGNa1SUnbnavgNI9DqTJ4q
kewEUmNqHas5F0kYP/poY7vyoVGgT5PzE9GAH33EwfrGwlKnparEjC1uNamzVkpK10eqVRJHtUxa3ZxutQiLReLCuLGrVoeWNeBo
1nie7TWqtQKVi5ivo5fnjPdOaf3nHe/Nvedr+fzOWjob7NhKapDsob5ReJxYdrvq01id5CfyuidkhLAgQbHfCTn/f8IfC1/7OceU
ukByLCGRSi6tfTPJypoyTLN8yA+9oWbYWa/P3eU7Gnv/J/wZhY5hU4VU+ANknUy7DEfgTKwg53E7jJt1WrTVPzikVN4NXNEpfXau
KHKaqqjpq/kjSBEH7Tth+u4LU8d7zcum60giTyxdjly9vrU8qeh1uROm75IwPS6tBgAqn4jFdAsdjeWVbpSXTM66/dhbmcCkLg6p
C2snbd811dX8bE7R2DGSG7TYevW3pWbmVO/qVsFUxTd6NfP6pjSsluMFs6TKWNlavfgW8k058J1o/0mJ9h0L/VLHVfuDu09U4ZmG
iTv2XrAq/iahyIFm0fnl1XviFkKtCziHGMXupNuKQ6WxQYJLbHDYq/fvH/M3dRsXnKYHTXu+qetBb562LocNraTyCtLKsa3lQUsb
9z5sbnlgUpLZ5s6AL0wPjvgXdlMArwMmxtpaA1TuS3HN79JW39q0lftpGHySs1VGPO0P1my5VA0T+MhfvP+7/5efWD+AAM/wt+DF
2KXSdqm0nSXapdJ2qbSdMO1SaTth2qXSdtK2S6XtUmk70d6l0naptF0qbZdKu6Zs2skauhPHQyiND6yW8ZbphJaJSxlbK1UXM85e
8eCF2o1L+UHUsXp2ja668YNb+SXz3N8FZflybemw++9STXfgjnh5l9VCST1hSf7OrBkamHe/u//1l7CtLBdIcHEcfR7cwvdeW0M7
gfCdFzx3wr1lduguK6nU6IkZpvhOLag2E8qGto54E1SbFSuK/NoD2rdcX+lGt6JGXN7P0fS8/80/sXlfn0YAV2Jdg0vvv+ghxiVY
m1AFNU/T1DgRs2lk7C7vw9HBd2zjtRrMV9ZIXzUjx3BDLCflH1qajjU9vKQ1sA04uVS4rqpkZPvbd9rGyr89ocoNydjMng/3ZD78
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
YAiUu/MZNdQEVE44WwyPnV00yj1q5ni1dBbKOnyA5smNXpd2Za8NLxlmYzzdIBZ3RVglkvAIhrjHNNiKOOvHity20BUcGVNBGhRl
pjejZI+dYRnpXsCeGjYlYyeSCTu1FFgUpEsrH4E5UlMwHqadzqN+lZZs4ERaT6YCUYQr25jADezgY1TiveYyJTIKFAKeAbAQ8RgX
n2vFJpyeV9LIyFZ0WY3evf5HmlgEP6QoZ88Zp6nFA4aBma3aMaHCi2Rqx+aELAb0tfgeDsXIsueoShk6KmNhO+ZxOqhyZDe1A6om
8ahoCO1jcc4V87q5vGdsAjQ61WB+04K5LYm34eLZucnWEJfsU6TNEQTNNejh9N4v0RKjP+MSBOZ/z59UJtXn5GIO+eazC56lBw9L
NJi9NBnC5VHGBl+RhHhVYInlYQbJ1aA3A4NKS8t5NvXdY5pbws+YzTpdXBRjwEELySxdG2Dx6EITg+JCynDXmEeq+oMa+FAreeM5
eF5SkFZxvt78CN5zCJehUoCjHjAyWTmJ0/iyuodI6kvoXAFBNf+QmO4cwhQ1wkU+08kAHu1JN5flGtGAeWAauodAKMTwawyGvGeg
mJ6ypyb84ZZFknVPzegmTSadlkEoxDo9NovP8qzbmj3gprtTegTUy07bC7EJHRDBItmNZNUAzwP+O77hUj40hflPU8l0uWuaQ5ca
ywL/jjtTmQubHzZHEKFdknEa7me82lfWy8wEDd+xNQJdhhwm11SlnRcKOZFou29+vqMEAiQgEIoy/Gx94e/CgGqH9BRuLEO0aOaa
ZBhVnKgiZ9Gv+DmvQrDw18NCmq//Oey1W1TePgrW9G0pYnd4/ALj7fGbLx56tvFb2l5zZ44djONr3g69H8wOgr1k5r/Oqluk8ip3
Y7PIO4CJm1+jk5vyQn9MBbgcvspe2K5Yvy5P0hxrymRu9zhGRuUXUD4jh0Or65UfbgzP9tSrJmJNMv9QigRcqg46w4PXjAswR0uc
O0o/oETOb+Cn7ELMkjlVTcgTpKV2gszq1PMolAzTHTjP2TzTm2/ry90vZ0Ry7d76tDpPwSxnHIUXMu9qmDN3iZn4Zb4bPZs2hHU5
/vfiE02FLZAn8qfIUTiCk1xwU2al4a4qtebOSfXd1/8FBFpCXp4dmWiAKg74M4JidH1W7KIt+XzORWrPRnCoy2jglS8FNAiilbQH
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
END ARCHIVED PARAMETER COHERENCE PAYLOAD -/
