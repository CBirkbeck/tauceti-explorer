

-- The authenticated incoming imports supply the native category and tensor APIs.

import Mathlib.CategoryTheory.Monoidal.NaturalTransformation

import Mathlib.Algebra.Category.ModuleCat.Monoidal.Adjunction

import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric

import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings


import Mathlib.Data.ZMod.Basic
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

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q t
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable {E : Type v} [AddCommGroup E] [Module R E]

/-- The actual scalar-extension unit, with its coefficient-ring semilinearity. -/
def scalarUnit : E →ₛₗ[algebraMap R S] S ⊗[R] E where
  toFun e := 1 ⊗ₜ[R] e
  map_add' := by intro x y; exact TensorProduct.tmul_add 1 x y
  map_smul' := by
    intro a e
    simp only [TensorProduct.tmul_smul, TensorProduct.smul_tmul']
    rw [Algebra.smul_def, mul_one]
    simp only [smul_eq_mul, mul_one]

lemma scalarUnit_apply (e : E) : scalarUnit (S := S) e = 1 ⊗ₜ[R] e := by
  sorry

variable {lam : R}

def Preconnection.pullbackPair (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) : S →+ E →+ (S ⊗[R] E) ⊗[S] V where
  toFun s :=
    { toFun := fun e => s • TensorProduct.map scalarUnit m.one (D.toAddHom e) +
        algebraMap R S lam • (scalarUnit e ⊗ₜ[S] Γ.d0 s)
      map_zero' := by simp
      map_add' := by intros; simp only [map_add, smul_add, TensorProduct.add_tmul]; abel }
  map_zero' := by ext; simp
  map_add' := by
    intros; ext
    simp only [AddMonoidHom.coe_mk, ZeroHom.coe_mk, map_add, add_smul,
      TensorProduct.tmul_add, smul_add, AddMonoidHom.add_apply]
    abel

lemma Preconnection.pullbackPair_apply (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (s : S) (e : E) :
    D.pullbackPair m s e = s • TensorProduct.map scalarUnit m.one (D.toAddHom e) +
      algebraMap R S lam • (scalarUnit e ⊗ₜ[S] Γ.d0 s) := by
  sorry

lemma Preconnection.pullback_balanced (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (a : R) (s : S) (e : E) :
    D.pullbackPair m (a • s) e = D.pullbackPair m s (a • e) := by
  sorry

def Preconnection.affinePullback (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) : Preconnection Γ (algebraMap R S lam) (S ⊗[R] E) where
  toAddHom := TensorProduct.liftAddHom (D.pullbackPair m) (D.pullback_balanced m)
  leibniz := by
    intro a x
    induction x using TensorProduct.induction_on with
    | zero => simp
    | add x y hx hy =>
      simp only [smul_add, map_add, hx, hy, TensorProduct.add_tmul]
      abel
    | tmul s e =>
      simp only [TensorProduct.smul_tmul', smul_eq_mul,
        TensorProduct.liftAddHom_tmul, Preconnection.pullbackPair_apply,
        Derivation.leibniz, TensorProduct.tmul_add, TensorProduct.tmul_smul,
        smul_add, smul_smul]
      rw [mul_comm (algebraMap R S lam) a, mul_comm (algebraMap R S lam) s]
      simp only [scalarUnit_apply, TensorProduct.smul_tmul', smul_eq_mul, mul_one]
      abel

lemma Preconnection.affinePullback_tmul (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (s : S) (e : E) :
    (D.affinePullback m).toAddHom (s ⊗ₜ[R] e) =
      s • TensorProduct.map scalarUnit m.one (D.toAddHom e) +
        algebraMap R S lam • (scalarUnit e ⊗ₜ[S] Γ.d0 s) := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V]

lemma Preconnection.affinePullback_unit (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) :
    Preconnection.SemilinearHorizontal m D (D.affinePullback m) scalarUnit := by
  sorry

lemma Preconnection.affinePullback_curvature_unit
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) (e : E) :
    (D.affinePullback m).curvature (scalarUnit e) =
      TensorProduct.map scalarUnit m.two (D.curvature e) := by
  sorry

lemma Preconnection.affinePullback_curvature_tmul
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0) (s : S) (e : E) :
    (D.affinePullback m).curvature (s ⊗ₜ[R] e) =
      s • TensorProduct.map scalarUnit m.two (D.curvature e) := by
  sorry

lemma Preconnection.affinePullback_flat
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0) (hD : ∀ e, D.curvature e = 0) (x : S ⊗[R] E) :
    (D.affinePullback m).curvature x = 0 := by
  sorry

lemma Preconnection.affinePullback_unique
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (C : Preconnection Γ (algebraMap R S lam) (S ⊗[R] E))
    (h : Preconnection.SemilinearHorizontal m D C scalarUnit) : C = D.affinePullback m := by
  sorry

lemma Preconnection.affinePullback_flat_iff
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (hlam : Ω.d0 lam = 0)
    (hi : Function.Injective (TensorProduct.map (scalarUnit (E := E)) m.two)) :
    (∀ x, (D.affinePullback m).curvature x = 0) ↔ ∀ e, D.curvature e = 0 := by
  sorry

variable {F : Type t} [AddCommGroup F] [Module R F]

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma scalarUnit_baseChange (h : E →ₗ[R] F) (e : E) :
    h.baseChange S (scalarUnit e) = scalarUnit (h e) := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma scalarUnit_tensor_natural (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (h : E →ₗ[R] F) (x : E ⊗[R] W) :
    TensorProduct.map (h.baseChange S) LinearMap.id (TensorProduct.map scalarUnit m.one x) =
      TensorProduct.map scalarUnit m.one (TensorProduct.map h LinearMap.id x) := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma Preconnection.affinePullback_horizontal
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (h : E →ₗ[R] F)
    (hh : ∀ e, C.toAddHom (h e) = TensorProduct.map h LinearMap.id (D.toAddHom e))
    (x : S ⊗[R] E) :
    (C.affinePullback m).toAddHom (h.baseChange S x) =
      TensorProduct.map (h.baseChange S) LinearMap.id ((D.affinePullback m).toAddHom x) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic


namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable {E : Type v} [AddCommGroup E] [Module R E] {lam : R}

-- test: scalarUnit.test_semilinear
example (a : R) (e : E) : scalarUnit (S := S) (a • e) =
    algebraMap R S a • scalarUnit (R := R) (S := S) e := by
  sorry

-- test: Preconnection.pullbackPair.test_balance
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (a : R) (s : S) (e : E) : D.pullbackPair m (a • s) e =
      D.pullbackPair m s (a • e) := by
  sorry

-- test: Preconnection.affinePullback.test_leibniz
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (s : S) (x : S ⊗[R] E) :
    (D.affinePullback m).toAddHom (s • x) = s • (D.affinePullback m).toAddHom x +
      algebraMap R S lam • (x ⊗ₜ[S] Γ.d0 s) := by
  sorry

-- test: Preconnection.affinePullback.test_zero_higgs
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω 0 E)
    (s : S) (e : E) : (D.affinePullback m).toAddHom (s ⊗ₜ[R] e) =
      s • TensorProduct.map scalarUnit m.one (D.toAddHom e) := by
  sorry

-- test: Preconnection.pullbackPair.test_add_left
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (s t : S) (e : E) : D.pullbackPair m (s + t) e =
      D.pullbackPair m s e + D.pullbackPair m t e := by
  sorry

-- test: Preconnection.pullbackPair.test_add_right
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (s : S) (e f : E) : D.pullbackPair m s (e + f) =
      D.pullbackPair m s e + D.pullbackPair m s f := by
  sorry

-- test: scalarUnit.test_baseChange
example {F : Type*} [AddCommGroup F] [Module R F] (h : E →ₗ[R] F) (e : E) :
    h.baseChange S (scalarUnit e) = scalarUnit (h e) := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V]

-- test: Preconnection.affinePullback.test_unit_horizontal
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    Preconnection.SemilinearHorizontal m D (D.affinePullback m) scalarUnit := by
  sorry

-- test: Preconnection.affinePullback.test_flat_arbitrary_sum
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (h : Ω.d0 lam = 0) (hD : ∀ e, D.curvature e = 0) (s t : S) (e f : E) :
    (D.affinePullback m).curvature ((s ⊗ₜ[R] e) + (t ⊗ₜ[R] f)) = 0 := by
  sorry

-- test: Preconnection.affinePullback.test_uniqueness
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (C : Preconnection Γ (algebraMap R S lam) (S ⊗[R] E))
    (h : Preconnection.SemilinearHorizontal m D C scalarUnit) :
    C = D.affinePullback m := by
  sorry

-- test: Preconnection.affinePullback.test_reflection
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (h : Ω.d0 lam = 0)
    (hi : Function.Injective (TensorProduct.map (scalarUnit (E := E)) m.two)) :
    (∀ x, (D.affinePullback m).curvature x = 0) ↔ ∀ e, D.curvature e = 0 := by
  sorry

-- test: Preconnection.affinePullback.test_horizontal_map
example {F : Type*} [AddCommGroup F] [Module R F]
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam F) (h : E →ₗ[R] F)
    (hh : ∀ e, C.toAddHom (h e) = TensorProduct.map h LinearMap.id (D.toAddHom e))
    (x : S ⊗[R] E) : (C.affinePullback m).toAddHom (h.baseChange S x) =
      TensorProduct.map (h.baseChange S) LinearMap.id ((D.affinePullback m).toAddHom x) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
local notation "A" => Polynomial ℤ

-- test: Preconnection.affinePullback.test_new_polynomial_direction
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ A A (Fin 0 → A),
    ∃ m : TwoForms.Morphism (algebraMap ℤ A) Ω Γ,
    ∃ D : Preconnection Ω 2 ℤ,
      (∀ n, D.toAddHom n = 0) ∧
      (∀ x, (D.affinePullback m).curvature x = 0) ∧
      (D.affinePullback m).toAddHom (Polynomial.X ⊗ₜ[ℤ] (1 : ℤ)) =
        (2 : A) • ((1 ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[A] (1 : A)) ∧
      (D.affinePullback m).toAddHom (Polynomial.X ⊗ₜ[ℤ] (1 : ℤ)) ≠ 0 := by
  sorry

-- test: scalarUnit.test_not_surjective
example : ¬ Function.Surjective (scalarUnit (R := ℤ) (S := A) (E := ℤ)) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q a b
variable {k R S T : Type u} [CommRing k] [CommRing R] [CommRing S] [CommRing T]
  [Algebra k R] [Algebra k S] [Algebra k T]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}

local instance : RingHomCompTriple (algebraMap R S) (algebraMap S T) (algebraMap R T) :=
  ⟨(IsScalarTower.algebraMap_eq R S T).symm⟩

/-- The existing calculus-map composition at the actual tower algebra map. -/
def TwoForms.Morphism.towerComp (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    TwoForms.Morphism (algebraMap R T) Ω Δ where
  one := n.one.comp m.one
  two := n.two.comp m.two
  d0_map := by
    intro r
    rw [IsScalarTower.algebraMap_apply R S T, n.d0_map, m.d0_map]
    rfl
  d1_map := by
    intro ω
    exact (n.d1_map (m.one ω)).trans (congrArg n.two (m.d1_map ω))
  wedge_map := by
    intro ω α
    exact (n.wedge_map (m.one ω) (m.one α)).trans (congrArg n.two (m.wedge_map ω α))

lemma TwoForms.Morphism.towerComp_one (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (ω : W) :
    (n.towerComp m).one ω = n.one (m.one ω) := by
  sorry

lemma TwoForms.Morphism.towerComp_two (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (η : Z) :
    (n.towerComp m).two η = n.two (m.two η) := by
  sorry

lemma TwoForms.Morphism.towerComp_d0 (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (r : R) :
    Δ.d0 (algebraMap R T r) = n.one (m.one (Ω.d0 r)) := by
  sorry

variable {E : Type v} [AddCommGroup E] [Module R E]
variable {lam : R}

/-- The actual twice-pulled-back additive operator; only its parameter is rewritten
by the algebra tower equation. No connection is chosen from an existential. -/
def Preconnection.affinePullbackTower (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    Preconnection Δ (algebraMap R T lam) (T ⊗[S] (S ⊗[R] E)) where
  toAddHom := ((D.affinePullback m).affinePullback n).toAddHom
  leibniz := by
    intro t x
    rw [IsScalarTower.algebraMap_apply R S T]
    exact ((D.affinePullback m).affinePullback n).leibniz t x

lemma Preconnection.affinePullbackTower_apply
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] E)) :
    (D.affinePullbackTower n m).toAddHom x =
      ((D.affinePullback m).affinePullback n).toAddHom x := by
  sorry

lemma scalarUnit_cancelBaseChange (e : E) :
    TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E
      (scalarUnit (S := T) (scalarUnit (S := S) e)) =
        scalarUnit (S := T) e := by
  sorry

lemma scalarUnit_tower_tensor
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (x : E ⊗[R] W) :
    TensorProduct.map
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
      LinearMap.id
      (TensorProduct.map (scalarUnit (S := T)) n.one
        (TensorProduct.map (scalarUnit (S := S)) m.one x)) =
      TensorProduct.map (scalarUnit (S := T)) (n.towerComp m).one x := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P]

lemma Preconnection.affinePullback_tower_eq
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affinePullbackTower n m).transport
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E) =
        D.affinePullback (n.towerComp m) := by
  sorry

lemma Preconnection.affinePullback_tower_horizontal
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] E)) :
    (D.affinePullback (n.towerComp m)).toAddHom
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id ((D.affinePullbackTower n m).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_tower_horizontal_symm
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[R] E) :
    (D.affinePullbackTower n m).toAddHom
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).symm x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).symm.toLinearMap
        LinearMap.id ((D.affinePullback (n.towerComp m)).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_tower_extend
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : (T ⊗[S] (S ⊗[R] E)) ⊗[T] P) :
    (D.affinePullback (n.towerComp m)).extend
      (TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id ((D.affinePullbackTower n m).extend x) := by
  sorry

lemma Preconnection.affinePullback_tower_curvature
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] E)) :
    (D.affinePullback (n.towerComp m)).curvature
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id ((D.affinePullbackTower n m).curvature x) := by
  sorry

lemma Preconnection.affinePullback_tower_flat_iff
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (∀ x, (D.affinePullback (n.towerComp m)).curvature x = 0) ↔
      ∀ x, (D.affinePullbackTower n m).curvature x = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic


namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q a b
variable {k R S T : Type u} [CommRing k] [CommRing R] [CommRing S] [CommRing T]
  [Algebra k R] [Algebra k S] [Algebra k T]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}
variable {E : Type v} [AddCommGroup E] [Module R E] {lam : R}

-- test: TwoForms.Morphism.towerComp.test_one
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (ω : W) :
    (n.towerComp m).one ω = n.one (m.one ω) := by
  sorry

-- test: TwoForms.Morphism.towerComp.test_two
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (η : Z) :
    (n.towerComp m).two η = n.two (m.two η) := by
  sorry

-- test: TwoForms.Morphism.towerComp.test_differential
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (r : R) :
    Δ.d0 (algebraMap R T r) = n.one (m.one (Ω.d0 r)) := by
  sorry

-- test: Preconnection.affinePullbackTower.test_actual_operator
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] E)) :
    (D.affinePullbackTower n m).toAddHom x =
      ((D.affinePullback m).affinePullback n).toAddHom x := by
  sorry

-- test: Preconnection.affinePullbackTower.test_single_parameter
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (t : T) (x : T ⊗[S] (S ⊗[R] E)) :
    (D.affinePullbackTower n m).toAddHom (t • x) =
      t • (D.affinePullbackTower n m).toAddHom x +
        algebraMap R T lam • (x ⊗ₜ[T] Δ.d0 t) := by
  sorry

-- test: scalarUnit_cancelBaseChange.test_unit
example (e : E) :
    TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E
      (scalarUnit (S := T) (scalarUnit (S := S) e)) =
        scalarUnit (S := T) e := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P]

-- test: Preconnection.affinePullbackTower.test_structure_equality
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affinePullbackTower n m).transport
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E) =
        D.affinePullback (n.towerComp m) := by
  sorry

-- test: Preconnection.affinePullbackTower.test_inverse
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (t : T) (e : E) :
    (D.affinePullbackTower n m).toAddHom (t ⊗ₜ[S] ((1 : S) ⊗ₜ[R] e)) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).symm.toLinearMap
        LinearMap.id ((D.affinePullback (n.towerComp m)).toAddHom (t ⊗ₜ[R] e)) := by
  sorry

-- test: Preconnection.affinePullbackTower.test_extension
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : (T ⊗[S] (S ⊗[R] E)) ⊗[T] P) :
    (D.affinePullback (n.towerComp m)).extend
      (TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id ((D.affinePullbackTower n m).extend x) := by
  sorry

-- test: Preconnection.affinePullbackTower.test_curvature
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] E)) :
    (D.affinePullback (n.towerComp m)).curvature
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap
        LinearMap.id ((D.affinePullbackTower n m).curvature x) := by
  sorry

-- test: Preconnection.affinePullbackTower.test_flatness_equivalence
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (∀ x, (D.affinePullback (n.towerComp m)).curvature x = 0) ↔
      ∀ x, (D.affinePullbackTower n m).curvature x = 0 := by
  sorry

-- test: Preconnection.affinePullbackTower.test_zero_higgs
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω 0 E)
    (t : T) (e : E) :
    (D.affinePullback (n.towerComp m)).toAddHom (t ⊗ₜ[R] e) =
      t • TensorProduct.map scalarUnit (n.towerComp m).one (D.toAddHom e) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
local notation "A" => Polynomial ℤ

-- test: Preconnection.affinePullbackTower.test_polynomial_derivative_survives
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ A A (Fin 0 → A),
    ∃ m : TwoForms.Morphism (algebraMap ℤ A) Ω Γ,
    ∃ n : TwoForms.Morphism (algebraMap A A) Γ Γ,
    ∃ D : Preconnection Ω 2 ℤ,
      (∀ z, D.toAddHom z = 0) ∧
      (D.affinePullback (n.towerComp m)).toAddHom
        (TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ A A A ℤ
          ((1 : A) ⊗ₜ[A] (Polynomial.X ⊗ₜ[ℤ] (1 : ℤ)))) =
          (2 : A) • ((1 ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[A] (1 : A)) ∧
      (D.affinePullbackTower n m).toAddHom
        ((1 : A) ⊗ₜ[A] (Polynomial.X ⊗ₜ[ℤ] (1 : ℤ))) ≠ 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q t a b
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {E' : Type a} [AddCommGroup E'] [Module S E']
variable {F' : Type b} [AddCommGroup F'] [Module S F']
variable {f : R →+* S} {lam : R}

lemma TwoForms.Morphism.tensor_rightComm (m : TwoForms.Morphism f Ω Γ)
    (h : E →ₛₗ[f] E') (j : F →ₛₗ[f] F') (x : E ⊗[R] W) (y : F) :
    TensorProduct.rightComm S E' V F' (TensorProduct.map h m.one x ⊗ₜ[S] j y) =
      TensorProduct.map (TensorProduct.map h j) m.one
        (TensorProduct.rightComm R E W F (x ⊗ₜ[R] y)) := by
  sorry

lemma TwoForms.Morphism.tensor_assoc_symm (m : TwoForms.Morphism f Ω Γ)
    (h : E →ₛₗ[f] E') (j : F →ₛₗ[f] F') (x : E) (y : F ⊗[R] W) :
    (TensorProduct.assoc S E' F' V).symm (h x ⊗ₜ[S] TensorProduct.map j m.one y) =
      TensorProduct.map (TensorProduct.map h j) m.one
        ((TensorProduct.assoc R E F W).symm (x ⊗ₜ[R] y)) := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V]

lemma Preconnection.semilinearHorizontal_affineTensor (m : TwoForms.Morphism f Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (D' : Preconnection Γ (f lam) E') (C' : Preconnection Γ (f lam) F')
    (h : E →ₛₗ[f] E') (j : F →ₛₗ[f] F')
    (hh : Preconnection.SemilinearHorizontal m D D' h)
    (hj : Preconnection.SemilinearHorizontal m C C' j) :
    Preconnection.SemilinearHorizontal m (D.affineTensor C) (D'.affineTensor C')
      (TensorProduct.map h j) := by
  sorry

variable [Algebra R S]

lemma scalarUnit_distribBaseChange (x : E ⊗[R] F) :
    TensorProduct.AlgebraTensorModule.distribBaseChange R S E F (scalarUnit x) =
      TensorProduct.map (scalarUnit (S := S)) (scalarUnit (S := S)) x := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma scalarUnit_distribBaseChange_tensor
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (x : (E ⊗[R] F) ⊗[R] W) :
    TensorProduct.map
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm.toLinearMap
      LinearMap.id
      (TensorProduct.map (TensorProduct.map (scalarUnit (S := S)) (scalarUnit (S := S)))
        m.one x) =
      TensorProduct.map (scalarUnit (S := S)) m.one x := by
  sorry

lemma Preconnection.affinePullback_tensor_eq
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).transport
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm =
        (D.affineTensor C).affinePullback m := by
  sorry

lemma Preconnection.affinePullback_tensor_horizontal_inv
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (x : (S ⊗[R] E) ⊗[S] (S ⊗[R] F)) :
    ((D.affineTensor C).affinePullback m).toAddHom
      ((TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm.toLinearMap
        LinearMap.id (((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_tensor_horizontal
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (x : S ⊗[R] (E ⊗[R] F)) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
        LinearMap.id (((D.affineTensor C).affinePullback m).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_tensor_extend
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (x : (S ⊗[R] (E ⊗[R] F)) ⊗[S] V) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).extend
      (TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
        LinearMap.id x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
        LinearMap.id (((D.affineTensor C).affinePullback m).extend x) := by
  sorry

lemma Preconnection.affinePullback_tensor_curvature
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (x : S ⊗[R] (E ⊗[R] F)) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).curvature
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
        LinearMap.id (((D.affineTensor C).affinePullback m).curvature x) := by
  sorry

lemma Preconnection.affinePullback_tensor_flat_iff
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) :
    (∀ x, ((D.affineTensor C).affinePullback m).curvature x = 0) ↔
      ∀ x, ((D.affinePullback m).affineTensor (C.affinePullback m)).curvature x = 0 := by
  sorry

lemma Preconnection.affinePullback_unitConnection_eq
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (Preconnection.unit Γ (algebraMap R S lam)).transport
      (TensorProduct.AlgebraTensorModule.rid R S S).symm =
        (Preconnection.unit Ω lam).affinePullback m := by
  sorry

lemma Preconnection.affinePullback_unitConnection_horizontal_inv
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (s : S) :
    ((Preconnection.unit Ω lam).affinePullback m).toAddHom
      ((TensorProduct.AlgebraTensorModule.rid R S S).symm s) =
      TensorProduct.map (TensorProduct.AlgebraTensorModule.rid R S S).symm.toLinearMap
        LinearMap.id ((Preconnection.unit Γ (algebraMap R S lam)).toAddHom s) := by
  sorry

lemma Preconnection.affinePullback_unitConnection_horizontal
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (x : S ⊗[R] R) :
    (Preconnection.unit Γ (algebraMap R S lam)).toAddHom
      (TensorProduct.AlgebraTensorModule.rid R S S x) =
      TensorProduct.map (TensorProduct.AlgebraTensorModule.rid R S S).toLinearMap
        LinearMap.id (((Preconnection.unit Ω lam).affinePullback m).toAddHom x) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q t
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable [IsScalarTower k R W] [IsScalarTower k S V] {lam : R}

-- test: MonoidalPullbackTests.same_parameter
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (s : S) (x : (S ⊗[R] E) ⊗[S] (S ⊗[R] F)) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom (s • x) =
      s • ((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom x +
        algebraMap R S lam • (x ⊗ₜ[S] Γ.d0 s) := by
  sorry

-- test: MonoidalPullbackTests.higgs_specialization
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω 0 E) (C : Preconnection Ω 0 F)
    (x : S ⊗[R] (E ⊗[R] F)) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F x) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).toLinearMap
        LinearMap.id (((D.affineTensor C).affinePullback m).toAddHom x) := by
  sorry

-- test: MonoidalPullbackTests.inverse_actual_scalars
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (s t : S) (e : E) (f : F) :
    ((D.affineTensor C).affinePullback m).toAddHom ((s * t) ⊗ₜ[R] (e ⊗ₜ[R] f)) =
      TensorProduct.map
        (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F).symm.toLinearMap
        LinearMap.id
        (((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom
          ((s ⊗ₜ[R] e) ⊗ₜ[S] (t ⊗ₜ[R] f))) := by
  sorry

-- test: MonoidalPullbackTests.constant_flat_factors
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F)
    (hlam : Ω.d0 lam = 0) (hD : ∀ e, D.curvature e = 0) (hC : ∀ f, C.curvature f = 0)
    (x : (S ⊗[R] E) ⊗[S] (S ⊗[R] F)) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).curvature x = 0 := by
  sorry

-- test: MonoidalPullbackTests.zero_section
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) :
    ((D.affinePullback m).affineTensor (C.affinePullback m)).toAddHom
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S E F 0) = 0 := by
  sorry

-- test: MonoidalPullbackTests.unit_new_derivative
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (s : S) :
    TensorProduct.map (TensorProduct.AlgebraTensorModule.rid R S S).toLinearMap LinearMap.id
      (((Preconnection.unit Ω lam).affinePullback m).toAddHom (s ⊗ₜ[R] (1 : R))) =
        algebraMap R S lam • ((1 : S) ⊗ₜ[S] Γ.d0 s) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
local notation "A" => Polynomial ℤ

-- test: MonoidalPullbackTests.polynomial_one_parameter
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ A A (Fin 0 → A),
    ∃ m : TwoForms.Morphism (algebraMap ℤ A) Ω Γ,
    ∃ D : Preconnection Ω 2 ℤ,
    ∃ μ : (A ⊗[ℤ] ℤ) ⊗[A] (A ⊗[ℤ] ℤ) →ₗ[A] A,
      (∀ n, D.toAddHom n = 0) ∧
      TensorProduct.lid A A
        (TensorProduct.map μ LinearMap.id
          (((D.affinePullback m).affineTensor (D.affinePullback m)).toAddHom
            ((Polynomial.X ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[A] ((1 : A) ⊗ₜ[ℤ] (1 : ℤ))))) = 2 ∧
      (2 : A) ≠ 4 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
local notation "A" => ZMod 2

-- test: MonoidalPullbackTests.nonflat_operator_erasure
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ A A (Fin 0 → A),
    ∃ m : TwoForms.Morphism (algebraMap ℤ A) Ω Γ,
    ∃ D : Preconnection Ω 0 ℤ,
    ∃ μ : (A ⊗[ℤ] ℤ) ⊗[A] (A ⊗[ℤ] ℤ) →ₗ[A] A,
      TensorProduct.lid ℤ ℤ
        (TensorProduct.map (TensorProduct.lid ℤ ℤ).toLinearMap LinearMap.id
          ((D.affineTensor D).toAddHom ((1 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)))) = 2 ∧
      TensorProduct.lid A A
        (TensorProduct.map μ LinearMap.id
          (((D.affinePullback m).affineTensor (D.affinePullback m)).toAddHom
            (((1 : A) ⊗ₜ[ℤ] (1 : ℤ)) ⊗ₜ[A] ((1 : A) ⊗ₜ[ℤ] (1 : ℤ))))) = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {Ω : TwoForms k R W Z} [IsScalarTower k R W]
variable {E : Type v} [AddCommGroup E] [Module R E] {lam : R}

lemma Preconnection.affinePullback_refl_eq (D : Preconnection Ω lam E) :
    D.transport (TensorProduct.lid R E).symm =
      D.affinePullback (TwoForms.Morphism.refl Ω) := by
  sorry

lemma Preconnection.affinePullback_refl_horizontal_inv (D : Preconnection Ω lam E)
    (e : E) :
    (D.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom
      ((TensorProduct.lid R E).symm e) =
        TensorProduct.map (TensorProduct.lid R E).symm.toLinearMap LinearMap.id
          (D.toAddHom e) := by
  sorry

lemma Preconnection.affinePullback_refl_horizontal (D : Preconnection Ω lam E)
    (x : R ⊗[R] E) :
    D.toAddHom (TensorProduct.lid R E x) =
      TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id
        ((D.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_refl_extend (D : Preconnection Ω lam E)
    (x : (R ⊗[R] E) ⊗[R] W) :
    D.extend (TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id x) =
      TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id
        ((D.affinePullback (TwoForms.Morphism.refl Ω)).extend x) := by
  sorry

lemma Preconnection.affinePullback_refl_curvature (D : Preconnection Ω lam E)
    (x : R ⊗[R] E) :
    D.curvature (TensorProduct.lid R E x) =
      TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id
        ((D.affinePullback (TwoForms.Morphism.refl Ω)).curvature x) := by
  sorry

lemma Preconnection.affinePullback_refl_flat_iff (D : Preconnection Ω lam E) :
    (∀ x, (D.affinePullback (TwoForms.Morphism.refl Ω)).curvature x = 0) ↔
      ∀ e, D.curvature e = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q a b c d
variable {k R S T U : Type u}
  [CommRing k] [CommRing R] [CommRing S] [CommRing T] [CommRing U]
  [Algebra k R] [Algebra k S] [Algebra k T] [Algebra k U]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
  [Algebra T U] [Algebra S U] [Algebra R U]
  [IsScalarTower S T U] [IsScalarTower R S U] [IsScalarTower R T U]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {L : Type c} [AddCommGroup L] [Module U L] [Module k L]
variable {N : Type d} [AddCommGroup N] [Module U N]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
  {Δ : TwoForms k T P Q} {Ξ : TwoForms k U L N}

lemma TwoForms.Morphism.towerComp_assoc
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (p.towerComp n).towerComp m = p.towerComp (n.towerComp m) := by
  sorry

variable {E : Type v} [AddCommGroup E] [Module R E]

lemma affinePullback_cancel_assoc :
    (TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U E).toLinearMap.comp
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap.baseChange U) =
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E).toLinearMap.comp
        (TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E)).toLinearMap := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V]
  [IsScalarTower k T P] [IsScalarTower k U L]
variable {lam : R}

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affinePullback_triple_horizontal
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (x : U ⊗[T] (T ⊗[S] (S ⊗[R] E))) :
    (D.affinePullback ((p.towerComp n).towerComp m)).toAddHom
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E
        (TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E) x)) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E).toLinearMap.comp
          (TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E)).toLinearMap)
        LinearMap.id ((((D.affinePullback m).affinePullback n).affinePullback p).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_triple_horizontal_assoc
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (x : U ⊗[T] (T ⊗[S] (S ⊗[R] E))) :
    (D.affinePullback (p.towerComp (n.towerComp m))).toAddHom
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U E
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap.baseChange U x)) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U E).toLinearMap.comp
          ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap.baseChange U))
        LinearMap.id ((((D.affinePullback m).affinePullback n).affinePullback p).toAddHom x) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {Ω : TwoForms k R W Z} [IsScalarTower k R W]
variable {E : Type v} [AddCommGroup E] [Module R E] {lam : R}

-- test: PullbackCoherenceTests.identity_inverse
example (D : Preconnection Ω lam E) (e : E) :
    (D.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom (1 ⊗ₜ[R] e) =
      TensorProduct.map (TensorProduct.lid R E).symm.toLinearMap LinearMap.id
        (D.toAddHom e) := by
  sorry

-- test: PullbackCoherenceTests.identity_zero_section
example (D : Preconnection Ω lam E) :
    TensorProduct.map (TensorProduct.lid R E).toLinearMap LinearMap.id
      ((D.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom 0) = 0 := by
  sorry

-- test: PullbackCoherenceTests.nonconstant_polynomial_parameter
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X ≠ 0 ∧
      let D := Preconnection.unit Ω Polynomial.X
      TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (TensorProduct.map (TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)).toLinearMap
          LinearMap.id ((D.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom
            ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] Polynomial.X))) = Polynomial.X := by
  sorry

-- test: PullbackCoherenceTests.nonreduced_identity_higgs
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let D := Preconnection.ofLinear (Ω := Ω) (TensorProduct.lid (ZMod 4) (ZMod 4)).symm.toLinearMap
      let y := TensorProduct.lid (ZMod 4) (ZMod 4)
        (TensorProduct.map (TensorProduct.lid (ZMod 4) (ZMod 4)).toLinearMap LinearMap.id
          ((D.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom
            ((2 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4))))
      y = 2 ∧ y ≠ 0 ∧ y ^ 2 = 0 := by
  sorry

-- test: PullbackCoherenceTests.triple_actual_scalar_factors
example :
    (TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℤ ℤ ℤ ℤ
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℤ ℤ ℤ ℤ).toLinearMap.baseChange ℤ
        ((3 : ℤ) ⊗ₜ[ℤ] ((2 : ℤ) ⊗ₜ[ℤ] ((5 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)))))) =
      (30 : ℤ) ⊗ₜ[ℤ] (1 : ℤ) ∧
    (TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℤ ℤ ℤ ℤ
      (TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℤ ℤ ℤ (ℤ ⊗[ℤ] ℤ)
        ((3 : ℤ) ⊗ₜ[ℤ] ((2 : ℤ) ⊗ₜ[ℤ] ((5 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)))))) =
      (30 : ℤ) ⊗ₜ[ℤ] (1 : ℤ) := by
  sorry

-- test: PullbackCoherenceTests.triple_nonzero_operator
example :
    ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
      let D := Preconnection.ofLinear (Ω := Ω) (TensorProduct.lid ℤ ℤ).symm.toLinearMap
      let m := TwoForms.Morphism.refl Ω
      let c := (TensorProduct.lid ℤ ℤ).toLinearMap.comp
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℤ ℤ ℤ ℤ).toLinearMap.comp
          (TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ ℤ ℤ ℤ (ℤ ⊗[ℤ] ℤ)).toLinearMap)
      TensorProduct.lid ℤ ℤ (TensorProduct.map c LinearMap.id
        ((((D.affinePullback m).affinePullback m).affinePullback m).toAddHom
          ((3 : ℤ) ⊗ₜ[ℤ] ((2 : ℤ) ⊗ₜ[ℤ] ((5 : ℤ) ⊗ₜ[ℤ] (1 : ℤ)))))) = 30 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q t a
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F]
variable {G : Type a} [AddCommGroup G] [Module R G] {lam : R}

lemma Preconnection.eq_of_toAddHom_eq (D C : Preconnection Ω lam E)
    (h : D.toAddHom = C.toAddHom) : D = C := by
  sorry

variable [IsScalarTower k R W] [IsScalarTower k S V]

lemma Preconnection.affinePullback_transport_eq
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) :
    (D.transport u).affinePullback m =
      (D.affinePullback m).transport (u.baseChange R S) := by
  sorry

lemma Preconnection.affinePullback_transport_horizontal
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (x : S ⊗[R] E) :
    ((D.transport u).affinePullback m).toAddHom ((u.baseChange R S) x) =
      TensorProduct.map (u.baseChange R S).toLinearMap LinearMap.id
        ((D.affinePullback m).toAddHom x) := by
  sorry

lemma Preconnection.affinePullback_transport_horizontal_symm
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (y : S ⊗[R] F) :
    (D.affinePullback m).toAddHom ((u.baseChange R S).symm y) =
      TensorProduct.map (u.baseChange R S).symm.toLinearMap LinearMap.id
        (((D.transport u).affinePullback m).toAddHom y) := by
  sorry

lemma Preconnection.affinePullback_transport_extend
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (x : (S ⊗[R] E) ⊗[S] V) :
    ((D.transport u).affinePullback m).extend
        (TensorProduct.map (u.baseChange R S).toLinearMap LinearMap.id x) =
      TensorProduct.map (u.baseChange R S).toLinearMap LinearMap.id
        ((D.affinePullback m).extend x) := by
  sorry

lemma Preconnection.affinePullback_transport_curvature
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (x : S ⊗[R] E) :
    ((D.transport u).affinePullback m).curvature ((u.baseChange R S) x) =
      TensorProduct.map (u.baseChange R S).toLinearMap LinearMap.id
        ((D.affinePullback m).curvature x) := by
  sorry

lemma Preconnection.affinePullback_transport_flat_iff
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) :
    (∀ y, ((D.transport u).affinePullback m).curvature y = 0) ↔
      ∀ x, (D.affinePullback m).curvature x = 0 := by
  sorry

lemma Preconnection.affinePullback_triangle_source_eq
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) :
    (D.affinePullback (TwoForms.Morphism.refl Ω)).affinePullback m =
      (D.affinePullback m).transport ((TensorProduct.lid R E).symm.baseChange R S) := by
  sorry

lemma Preconnection.affinePullback_transport_comp_eq
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) (v : F ≃ₗ[R] G) :
    ((D.transport u).transport v).affinePullback m =
      (D.affinePullback m).transport ((u.baseChange R S).trans (v.baseChange R S)) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q t
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
variable [IsScalarTower k R W] [IsScalarTower k S V]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {F : Type t} [AddCommGroup F] [Module R F] {lam : R}

-- test: TransportPullbackTests.zero_section
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω lam E) (u : E ≃ₗ[R] F) :
    ((D.transport u).affinePullback m).toAddHom ((u.baseChange R S) 0) = 0 := by
  sorry

-- test: TransportPullbackTests.nonconstant_source_triangle
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let D := Preconnection.unit Ω Polynomial.X
      let m := TwoForms.Morphism.refl Ω
      let c := (TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)).toLinearMap.comp
        (TensorProduct.lid (Polynomial ℤ) ((Polynomial ℤ) ⊗[Polynomial ℤ] (Polynomial ℤ))).toLinearMap
      let y := TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (TensorProduct.map c LinearMap.id
          (((D.affinePullback m).affinePullback m).toAddHom
            ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ]
              ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] Polynomial.X))))
      y = Polynomial.X ∧ y ≠ 0 := by
  sorry

-- test: TransportPullbackTests.nonreduced_source_triangle
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let D := Preconnection.ofLinear (Ω := Ω) (TensorProduct.lid (ZMod 4) (ZMod 4)).symm.toLinearMap
      let m := TwoForms.Morphism.refl Ω
      let c := (TensorProduct.lid (ZMod 4) (ZMod 4)).toLinearMap.comp
        (TensorProduct.lid (ZMod 4) ((ZMod 4) ⊗[ZMod 4] (ZMod 4))).toLinearMap
      let y := TensorProduct.lid (ZMod 4) (ZMod 4)
        (TensorProduct.map c LinearMap.id
          (((D.affinePullback m).affinePullback m).toAddHom
            ((2 : ZMod 4) ⊗ₜ[ZMod 4] ((1 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4)))))
      y = 2 ∧ y ≠ 0 ∧ y ^ 2 = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u w z p q
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]

@[reducible]
def AffineCategory (Ω : TwoForms k R W Z) (lam : R) :=
  Σ M : ModuleCat.{u} R, Preconnection Ω lam M

variable {Ω : TwoForms k R W Z} {lam : R}

@[instance_reducible]
def AffineCategory.category : Category (AffineCategory Ω lam) where
  Hom X Y := {h : X.1 →ₗ[R] Y.1 //
    ∀ x, Y.2.toAddHom (h x) = TensorProduct.map h LinearMap.id (X.2.toAddHom x)}
  id X := ⟨LinearMap.id, by intro x; simp⟩
  comp h j := ⟨j.1.comp h.1, by
    intro x
    rw [LinearMap.comp_apply, j.2, h.2, TensorProduct.map_map]
    rfl⟩
  id_comp _ := by apply Subtype.ext; rfl
  comp_id _ := by apply Subtype.ext; rfl
  assoc _ _ _ := by apply Subtype.ext; rfl

attribute [instance] AffineCategory.category

omit [IsScalarTower k R W] in
lemma AffineCategory.hom_ext {X Y : AffineCategory Ω lam} (h j : X ⟶ Y)
    (he : h.1 = j.1) : h = j := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.id_linear (X : AffineCategory Ω lam) :
    (𝟙 X : X ⟶ X).1 = LinearMap.id := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.comp_linear {X Y Z : AffineCategory Ω lam} (h : X ⟶ Y) (j : Y ⟶ Z) :
    (h ≫ j).1 = j.1.comp h.1 := by
  sorry

def AffineCategory.forget : AffineCategory Ω lam ⥤ ModuleCat.{u} R where
  obj X := X.1
  map h := ModuleCat.ofHom h.1

omit [IsScalarTower k R W] in
lemma AffineCategory.forget_obj (X : AffineCategory Ω lam) :
    (AffineCategory.forget (Ω := Ω) (lam := lam)).obj X = X.1 := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.forget_map {X Y : AffineCategory Ω lam} (h : X ⟶ Y) :
    ((AffineCategory.forget (Ω := Ω) (lam := lam)).map h).hom = h.1 := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.forget_faithful :
    (AffineCategory.forget (Ω := Ω) (lam := lam)).Faithful := by
  sorry

lemma AffineCategory.hom_extend {X Y : AffineCategory Ω lam} (h : X ⟶ Y)
    (x : X.1 ⊗[R] W) :
    Y.2.extend (TensorProduct.map h.1 LinearMap.id x) =
      TensorProduct.map h.1 LinearMap.id (X.2.extend x) := by
  sorry

lemma AffineCategory.hom_curvature {X Y : AffineCategory Ω lam} (h : X ⟶ Y)
    (x : X.1) :
    Y.2.curvature (h.1 x) = TensorProduct.map h.1 LinearMap.id (X.2.curvature x) := by
  sorry

def AffineCategory.isoMk {X Y : AffineCategory Ω lam} (e : X.1 ≃ₗ[R] Y.1)
    (he : ∀ x, Y.2.toAddHom (e x) =
      TensorProduct.map e.toLinearMap LinearMap.id (X.2.toAddHom x)) : X ≅ Y where
  hom := ⟨e.toLinearMap, he⟩
  inv := ⟨e.symm.toLinearMap, X.2.horizontal_symm Y.2 e he⟩
  hom_inv_id := by
    apply Subtype.ext
    ext x
    exact e.symm_apply_apply x
  inv_hom_id := by
    apply Subtype.ext
    ext x
    exact e.apply_symm_apply x

omit [IsScalarTower k R W] in
lemma AffineCategory.isoMk_hom {X Y : AffineCategory Ω lam} (e : X.1 ≃ₗ[R] Y.1)
    (he : ∀ x, Y.2.toAddHom (e x) =
      TensorProduct.map e.toLinearMap LinearMap.id (X.2.toAddHom x)) :
    (AffineCategory.isoMk e he).hom.1 = e.toLinearMap := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.isoMk_inv {X Y : AffineCategory Ω lam} (e : X.1 ≃ₗ[R] Y.1)
    (he : ∀ x, Y.2.toAddHom (e x) =
      TensorProduct.map e.toLinearMap LinearMap.id (X.2.toAddHom x)) :
    (AffineCategory.isoMk e he).inv.1 = e.symm.toLinearMap := by
  sorry

lemma AffineCategory.isoMk_flat_iff {X Y : AffineCategory Ω lam} (e : X.1 ≃ₗ[R] Y.1)
    (he : ∀ x, Y.2.toAddHom (e x) =
      TensorProduct.map e.toLinearMap LinearMap.id (X.2.toAddHom x)) :
    (∀ y, Y.2.curvature y = 0) ↔ ∀ x, X.2.curvature x = 0 := by
  sorry

variable {S : Type u} [CommRing S] [Algebra k S] [Algebra R S]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y] [IsScalarTower k S V]
variable {Γ : TwoForms k S V Y}

def AffineCategory.pullback (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory Ω lam ⥤ AffineCategory Γ (algebraMap R S lam) where
  obj X := ⟨ModuleCat.of S (S ⊗[R] X.1), X.2.affinePullback m⟩
  map {X X'} h := ⟨h.1.baseChange S, X.2.affinePullback_horizontal m X'.2 h.1 h.2⟩
  map_id X := by
    apply Subtype.ext
    exact LinearMap.baseChange_id
  map_comp h j := by
    apply Subtype.ext
    exact LinearMap.baseChange_comp _ _

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma AffineCategory.pullback_obj_connection (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X : AffineCategory Ω lam) :
    ((AffineCategory.pullback m).obj X).2 = X.2.affinePullback m := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma AffineCategory.pullback_map_linear (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    {X X' : AffineCategory Ω lam} (h : X ⟶ X') :
    ((AffineCategory.pullback m).map h).1 = h.1.baseChange S := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma AffineCategory.pullback_map_tmul (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    {X X' : AffineCategory Ω lam} (h : X ⟶ X') (s : S) (x : X.1) :
    ((AffineCategory.pullback m).map h).1 (s ⊗ₜ[R] x) = s ⊗ₜ[R] h.1 x := by
  sorry

def AffineCategory.pullbackIdentityIso :
    AffineCategory.pullback (lam := lam) (TwoForms.Morphism.refl Ω) ≅
      𝟭 (AffineCategory Ω lam) :=
  NatIso.ofComponents (fun X => AffineCategory.isoMk (TensorProduct.lid R X.1)
    X.2.affinePullback_refl_horizontal) (by
    intro X X' h
    apply Subtype.ext
    apply TensorProduct.ext'
    intro r x
    change r • h.1 x = h.1 (r • x)
    exact (h.1.map_smul r x).symm)

lemma AffineCategory.pullbackIdentityIso_hom (X : AffineCategory Ω lam) :
    ((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app X).1 =
      (TensorProduct.lid R X.1).toLinearMap := by
  sorry

lemma AffineCategory.pullbackIdentityIso_inv (X : AffineCategory Ω lam) :
    ((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).inv.app X).1 =
      (TensorProduct.lid R X.1).symm.toLinearMap := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.pullbackIdentityIso_naturality {X X' : AffineCategory Ω lam}
    (h : X ⟶ X') :
    (TensorProduct.lid R X'.1).toLinearMap.comp (h.1.baseChange R) =
      h.1.comp (TensorProduct.lid R X.1).toLinearMap := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u w z p q
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {Ω : TwoForms k R W Z} {lam : R}
variable {S : Type u} [CommRing S] [Algebra k S] [Algebra R S]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y] [IsScalarTower k S V]
variable {Γ : TwoForms k S V Y}

-- test: AffineCategoryTests.zero_morphism
omit [IsScalarTower k R W] [IsScalarTower k S V] in
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X X' : AffineCategory Ω lam) :
    ∃ h : X ⟶ X', (AffineCategory.forget.map h).hom = 0 ∧
      ((AffineCategory.pullback m).map h).1 = 0 := by
  sorry

-- test: AffineCategoryTests.composite_forget
omit [IsScalarTower k R W] in
example {X X' X'' : AffineCategory Ω lam} (h : X ⟶ X') (j : X' ⟶ X'') (x : X.1) :
    (AffineCategory.forget.map (𝟙 X ≫ h ≫ j)).hom x = j.1 (h.1 x) := by
  sorry

-- test: AffineCategoryTests.forget_detects_maps
omit [IsScalarTower k R W] in
example {X X' : AffineCategory Ω lam} (h j : X ⟶ X')
    (he : ∀ x, (AffineCategory.forget.map h).hom x = (AffineCategory.forget.map j).hom x) :
    h = j := by
  sorry

-- test: AffineCategoryTests.transport_roundtrip
example (M N : ModuleCat.{u} R) (D : Preconnection Ω lam M) (e : M ≃ₗ[R] N) (x : M) :
    let X : AffineCategory Ω lam := ⟨M, D⟩
    let X' : AffineCategory Ω lam := ⟨N, D.transport e⟩
    let i : X ≅ X' := AffineCategory.isoMk e (D.transport_horizontal e)
    i.inv.1 (i.hom.1 x) = x := by
  sorry

-- test: AffineCategoryTests.iso_reflects_actual_flatness
example {X X' : AffineCategory Ω lam} (e : X.1 ≃ₗ[R] X'.1)
    (he : ∀ x, X'.2.toAddHom (e x) =
      TensorProduct.map e.toLinearMap LinearMap.id (X.2.toAddHom x))
    (hz : ∀ y, X'.2.curvature y = 0) : ∀ x, X.2.curvature x = 0 := by
  sorry

-- test: AffineCategoryTests.identity_naturality_on_tensor
example {X X' : AffineCategory Ω lam} (h : X ⟶ X') (r : R) (x : X.1) :
    ((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app X').1
      (((AffineCategory.pullback (TwoForms.Morphism.refl Ω)).map h).1 (r ⊗ₜ[R] x)) =
    h.1 (((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app X).1
      (r ⊗ₜ[R] x)) := by
  sorry

-- test: AffineCategoryTests.reject_nonhorizontal_polynomial_map
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      let X : AffineCategory Ω (1 : Polynomial ℤ) :=
        ⟨ModuleCat.of (Polynomial ℤ) (Polynomial ℤ), Preconnection.unit Ω 1⟩
      ¬ ∃ h : X ⟶ X, ∀ x : Polynomial ℤ,
        (show Polynomial ℤ from (AffineCategory.forget.map h).hom x) = Polynomial.X * x := by
  sorry

-- test: AffineCategoryTests.nonconstant_identity_operator
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let X : AffineCategory Ω Polynomial.X :=
        ⟨ModuleCat.of (Polynomial ℤ) (Polynomial ℤ), Preconnection.unit Ω Polynomial.X⟩
      let F := AffineCategory.pullback (TwoForms.Morphism.refl Ω)
      let i := (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := Polynomial.X)).hom.app X
      TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (TensorProduct.map i.1 LinearMap.id
          ((F.obj X).2.toAddHom ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] Polynomial.X))) =
        Polynomial.X := by
  sorry

-- test: AffineCategoryTests.nonreduced_identity_iso
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let X : AffineCategory Ω (0 : ZMod 4) :=
        ⟨ModuleCat.of (ZMod 4) (ZMod 4),
          Preconnection.ofLinear (TensorProduct.lid (ZMod 4) (ZMod 4)).symm.toLinearMap⟩
      let F := AffineCategory.pullback (TwoForms.Morphism.refl Ω)
      let i := (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := (0 : ZMod 4))).app X
      let y := TensorProduct.lid (ZMod 4) (ZMod 4)
        (TensorProduct.map i.hom.1 LinearMap.id
          ((F.obj X).2.toAddHom ((2 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4))))
      y = 2 ∧ y ≠ 0 ∧ y ^ 2 = 0 ∧ i.hom.1 (i.inv.1 (2 : ZMod 4)) = (2 : ZMod 4) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {Ω : TwoForms k R W Z} {lam : R}

def AffineCategory.tensorObj (X Y : AffineCategory Ω lam) : AffineCategory Ω lam :=
  ⟨ModuleCat.of R (X.1 ⊗[R] Y.1), X.2.affineTensor Y.2⟩

def AffineCategory.tensorMap {X X' Y Y' : AffineCategory Ω lam}
    (h : X ⟶ X') (j : Y ⟶ Y') :
    AffineCategory.tensorObj X Y ⟶ AffineCategory.tensorObj X' Y' :=
  ⟨TensorProduct.map h.1 j.1, X.2.affineTensor_horizontal Y.2 X'.2 Y'.2 h.1 j.1 h.2 j.2⟩

def AffineCategory.tensorUnit : AffineCategory Ω lam :=
  ⟨ModuleCat.of R R, Preconnection.unit Ω lam⟩

def AffineCategory.associator (X Y T : AffineCategory Ω lam) :
    AffineCategory.tensorObj (AffineCategory.tensorObj X Y) T ≅
      AffineCategory.tensorObj X (AffineCategory.tensorObj Y T) :=
  AffineCategory.isoMk (TensorProduct.assoc R X.1 Y.1 T.1) (X.2.affineTensor_assoc Y.2 T.2)

def AffineCategory.leftUnitor (X : AffineCategory Ω lam) :
    AffineCategory.tensorObj AffineCategory.tensorUnit X ≅ X :=
  AffineCategory.isoMk (TensorProduct.lid R X.1) X.2.affineTensor_lid

def AffineCategory.rightUnitor (X : AffineCategory Ω lam) :
    AffineCategory.tensorObj X AffineCategory.tensorUnit ≅ X :=
  AffineCategory.isoMk (TensorProduct.rid R X.1) X.2.affineTensor_rid

@[instance_reducible]
def AffineCategory.monoidalStruct : MonoidalCategoryStruct (AffineCategory Ω lam) where
  tensorObj := AffineCategory.tensorObj
  tensorHom := AffineCategory.tensorMap
  whiskerLeft X _ _ h := AffineCategory.tensorMap (𝟙 X) h
  whiskerRight h X := AffineCategory.tensorMap h (𝟙 X)
  tensorUnit := AffineCategory.tensorUnit
  associator := AffineCategory.associator
  leftUnitor := AffineCategory.leftUnitor
  rightUnitor := AffineCategory.rightUnitor

attribute [instance] AffineCategory.monoidalStruct
attribute [local instance] AffineCategory.forget_faithful

def AffineCategory.inducingData : Monoidal.InducingFunctorData
    (AffineCategory.forget (Ω := Ω) (lam := lam)) where
  μIso _ _ := Iso.refl _
  εIso := Iso.refl _
  whiskerLeft_eq := by intros; simp; rfl
  whiskerRight_eq := by intros; simp; rfl
  tensorHom_eq := by intros; simp; rfl
  associator_eq := by
    intros
    apply ModuleCat.hom_ext
    apply TensorProduct.ext_threefold
    intro x y z
    rfl
  leftUnitor_eq := by
    intros
    apply ModuleCat.hom_ext
    apply TensorProduct.ext'
    intro x y
    rfl
  rightUnitor_eq := by
    intros
    apply ModuleCat.hom_ext
    apply TensorProduct.ext'
    intro x y
    rfl

@[instance_reducible]
def AffineCategory.monoidal : MonoidalCategory (AffineCategory Ω lam) :=
  Monoidal.induced AffineCategory.forget AffineCategory.inducingData

attribute [instance] AffineCategory.monoidal

def AffineCategory.forgetCoreMonoidal :
    (AffineCategory.forget (Ω := Ω) (lam := lam)).CoreMonoidal :=
  Monoidal.fromInducedCoreMonoidal AffineCategory.forget AffineCategory.inducingData

@[instance_reducible]
def AffineCategory.forgetMonoidal :
    (AffineCategory.forget (Ω := Ω) (lam := lam)).Monoidal :=
  AffineCategory.forgetCoreMonoidal.toMonoidal

attribute [instance] AffineCategory.forgetMonoidal

def AffineCategory.braiding (X Y : AffineCategory Ω lam) : X ⊗ Y ≅ Y ⊗ X :=
  AffineCategory.isoMk (TensorProduct.comm R X.1 Y.1) (X.2.affineTensor_comm Y.2)

@[instance_reducible]
def AffineCategory.braided : BraidedCategory (AffineCategory Ω lam) :=
  BraidedCategory.ofFaithful AffineCategory.forget AffineCategory.braiding
    (fun _ _ => by
      apply ModuleCat.hom_ext
      apply TensorProduct.ext'
      intro x y
      rfl)

attribute [instance] AffineCategory.braided

@[instance_reducible]
def AffineCategory.forgetBraided :
    (AffineCategory.forget (Ω := Ω) (lam := lam)).Braided where
  braided X Y := by
    apply ModuleCat.hom_ext
    apply TensorProduct.ext'
    intro x y
    rfl

attribute [instance] AffineCategory.forgetBraided

@[instance_reducible]
def AffineCategory.symmetric : SymmetricCategory (AffineCategory Ω lam) :=
  SymmetricCategory.ofFaithful AffineCategory.forget

attribute [instance] AffineCategory.symmetric

lemma AffineCategory.tensor_connection (X Y : AffineCategory Ω lam) :
    (X ⊗ Y).2 = X.2.affineTensor Y.2 := by
  sorry

lemma AffineCategory.tensorMap_tmul {X X' Y Y' : AffineCategory Ω lam}
    (h : X ⟶ X') (j : Y ⟶ Y') (x : X.1) (y : Y.1) :
    (h ⊗ₘ j).1 (x ⊗ₜ[R] y) = h.1 x ⊗ₜ[R] j.1 y := by
  sorry

lemma AffineCategory.unit_connection :
    (𝟙_ (AffineCategory Ω lam)).2 = Preconnection.unit Ω lam := by
  sorry

lemma AffineCategory.associator_linear (X Y T : AffineCategory Ω lam) :
    (α_ X Y T).hom.1 = (TensorProduct.assoc R X.1 Y.1 T.1).toLinearMap := by
  sorry

lemma AffineCategory.leftUnitor_linear (X : AffineCategory Ω lam) :
    (λ_ X).hom.1 = (TensorProduct.lid R X.1).toLinearMap := by
  sorry

lemma AffineCategory.rightUnitor_linear (X : AffineCategory Ω lam) :
    (ρ_ X).hom.1 = (TensorProduct.rid R X.1).toLinearMap := by
  sorry

lemma AffineCategory.braiding_linear (X Y : AffineCategory Ω lam) :
    (β_ X Y).hom.1 = (TensorProduct.comm R X.1 Y.1).toLinearMap := by
  sorry

lemma AffineCategory.forget_tensor_map {X X' Y Y' : AffineCategory Ω lam}
    (h : X ⟶ X') (j : Y ⟶ Y') :
    AffineCategory.forget.map (h ⊗ₘ j) =
      AffineCategory.forget.map h ⊗ₘ AffineCategory.forget.map j := by
  sorry

lemma AffineCategory.forget_tensor_comparison (X Y : AffineCategory Ω lam) :
    Functor.LaxMonoidal.μ AffineCategory.forget X Y = 𝟙 _ := by
  sorry

lemma AffineCategory.forget_unit_comparison :
    Functor.LaxMonoidal.ε (AffineCategory.forget (Ω := Ω) (lam := lam)) = 𝟙 _ := by
  sorry

lemma AffineCategory.tensor_id (X Y : AffineCategory Ω lam) :
    (𝟙 X) ⊗ₘ (𝟙 Y) = 𝟙 (X ⊗ Y) := by
  sorry

lemma AffineCategory.tensor_comp {X X' X'' Y Y' Y'' : AffineCategory Ω lam}
    (h : X ⟶ X') (h' : X' ⟶ X'') (j : Y ⟶ Y') (j' : Y' ⟶ Y'') :
    (h ⊗ₘ j) ≫ (h' ⊗ₘ j') = (h ≫ h') ⊗ₘ (j ≫ j') := by
  sorry

lemma AffineCategory.pentagon (A B C D : AffineCategory Ω lam) :
    (α_ A B C).hom ▷ D ≫ (α_ A (B ⊗ C) D).hom ≫ A ◁ (α_ B C D).hom =
      (α_ (A ⊗ B) C D).hom ≫ (α_ A B (C ⊗ D)).hom := by
  sorry

lemma AffineCategory.triangle (X Y : AffineCategory Ω lam) :
    (α_ X (𝟙_ (AffineCategory Ω lam)) Y).hom ≫ X ◁ (λ_ Y).hom = (ρ_ X).hom ▷ Y := by
  sorry

lemma AffineCategory.symmetry (X Y : AffineCategory Ω lam) :
    (β_ X Y).hom ≫ (β_ Y X).hom = 𝟙 (X ⊗ Y) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {Ω : TwoForms k R W Z} {lam : R}

-- test: AffineMonoidalTests.tensor_zero_map
example {X X' Y Y' : AffineCategory Ω lam} (j : Y ⟶ Y') :
    ∃ h : X ⟶ X', ∀ x : X.1, ∀ y : Y.1, (h ⊗ₘ j).1 (x ⊗ₜ[R] y) = 0 := by
  sorry

-- test: AffineMonoidalTests.coherence_generators
example (A B C D : AffineCategory Ω lam) (a : A.1) (b : B.1) (c : C.1) (d : D.1) :
    ((α_ A B C).hom ▷ D ≫ (α_ A (B ⊗ C) D).hom ≫ A ◁ (α_ B C D).hom).1
      (((a ⊗ₜ[R] b) ⊗ₜ[R] c) ⊗ₜ[R] d) = a ⊗ₜ[R] (b ⊗ₜ[R] (c ⊗ₜ[R] d)) ∧
    ((α_ (A ⊗ B) C D).hom ≫ (α_ A B (C ⊗ D)).hom).1
      (((a ⊗ₜ[R] b) ⊗ₜ[R] c) ⊗ₜ[R] d) = a ⊗ₜ[R] (b ⊗ₜ[R] (c ⊗ₜ[R] d)) := by
  sorry

-- test: AffineMonoidalTests.unit_derivative
example (X : AffineCategory Ω lam) (r : R) (x : X.1) :
    TensorProduct.map (λ_ X).hom.1 LinearMap.id
      (((𝟙_ (AffineCategory Ω lam)) ⊗ X).2.toAddHom (r ⊗ₜ[R] x)) =
      r • X.2.toAddHom x + lam • (x ⊗ₜ[R] Ω.d0 r) ∧
    TensorProduct.map (ρ_ X).hom.1 LinearMap.id
      ((X ⊗ (𝟙_ (AffineCategory Ω lam))).2.toAddHom (x ⊗ₜ[R] r)) =
      r • X.2.toAddHom x + lam • (x ⊗ₜ[R] Ω.d0 r) := by
  sorry

-- test: AffineMonoidalTests.braiding_generator
example (X Y : AffineCategory Ω lam) (x : X.1) (y : Y.1) :
    (β_ X Y).hom.1 (x ⊗ₜ[R] y) = y ⊗ₜ[R] x ∧
      (β_ Y X).hom.1 ((β_ X Y).hom.1 (x ⊗ₜ[R] y)) = x ⊗ₜ[R] y := by
  sorry

-- test: AffineMonoidalTests.forget_native_data
example (X Y T : AffineCategory Ω lam) :
    AffineCategory.forget.map (α_ X Y T).hom = (α_ X.1 Y.1 T.1).hom ∧
    AffineCategory.forget.map (λ_ X).hom = (λ_ X.1).hom ∧
    AffineCategory.forget.map (ρ_ X).hom = (ρ_ X.1).hom ∧
    AffineCategory.forget.map (β_ X Y).hom = (β_ X.1 Y.1).hom := by
  sorry

-- test: AffineMonoidalTests.nonconstant_parameter_unit
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let U := 𝟙_ (AffineCategory Ω Polynomial.X)
      TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (TensorProduct.map (λ_ U).hom.1 LinearMap.id
          ((U ⊗ U).2.toAddHom (Polynomial.X ⊗ₜ[Polynomial ℤ] (1 : Polynomial ℤ)))) =
        Polynomial.X := by
  sorry

-- test: AffineMonoidalTests.parameter_not_doubled
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      let U := 𝟙_ (AffineCategory Ω (2 : Polynomial ℤ))
      let value := TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (TensorProduct.map (λ_ U).hom.1 LinearMap.id
          ((U ⊗ U).2.toAddHom (Polynomial.X ⊗ₜ[Polynomial ℤ] (1 : Polynomial ℤ))))
      value = 2 ∧ value ≠ 4 := by
  sorry

-- test: AffineMonoidalTests.nonreduced_braiding
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let X : AffineCategory Ω (0 : ZMod 4) :=
        ⟨ModuleCat.of (ZMod 4) (ZMod 4),
          Preconnection.ofLinear (TensorProduct.lid (ZMod 4) (ZMod 4)).symm.toLinearMap⟩
      let t := (2 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4)
      let value := TensorProduct.lid (ZMod 4) (ZMod 4)
        ((β_ X X).hom.1 t)
      value = 2 ∧ value ≠ 0 ∧ value ^ 2 = 0 ∧
        (β_ X X).hom.1 ((β_ X X).hom.1 t) = t := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u w z p q a b
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {Ω : TwoForms k R W Z} {lam mu nu : R}

def AffineCategory.parameterChange (h : lam = mu) :
    AffineCategory Ω lam ⥤ AffineCategory Ω mu where
  obj X := ⟨X.1, {
    toAddHom := X.2.toAddHom
    leibniz := by intro r x; rw [← h]; exact X.2.leibniz r x }⟩
  map f := ⟨f.1, f.2⟩
  map_id _ := rfl
  map_comp _ _ := rfl

omit [IsScalarTower k R W] in
lemma AffineCategory.parameterChange_operator (h : lam = mu) (X : AffineCategory Ω lam) :
    ((AffineCategory.parameterChange h).obj X).2.toAddHom = X.2.toAddHom := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.parameterChange_map (h : lam = mu) {X Y : AffineCategory Ω lam}
    (f : X ⟶ Y) : ((AffineCategory.parameterChange h).map f).1 = f.1 := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.parameterChange_refl :
    AffineCategory.parameterChange (Ω := Ω) (rfl : lam = lam) = 𝟭 _ := by
  sorry

omit [IsScalarTower k R W] in
lemma AffineCategory.parameterChange_trans (h : lam = mu) (j : mu = nu) :
    AffineCategory.parameterChange (Ω := Ω) h ⋙ AffineCategory.parameterChange j =
      AffineCategory.parameterChange (h.trans j) := by
  sorry

variable {S T : Type u} [CommRing S] [CommRing T]
  [Algebra k S] [Algebra k T] [Algebra R S] [Algebra S T] [Algebra R T]
  [IsScalarTower R S T]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V] [IsScalarTower k S V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P] [IsScalarTower k T P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}

def AffineCategory.pullbackTower (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory Ω lam ⥤ AffineCategory Δ (algebraMap R T lam) :=
  AffineCategory.pullback m ⋙ AffineCategory.pullback n ⋙
    AffineCategory.parameterChange (IsScalarTower.algebraMap_apply R S T lam).symm

omit [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P] in
lemma AffineCategory.pullbackTower_operator (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    ((AffineCategory.pullbackTower n m).obj X).2.toAddHom =
      ((X.2.affinePullback m).affinePullback n).toAddHom := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P] in
lemma AffineCategory.pullbackTower_map (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') : ((AffineCategory.pullbackTower n m).map f).1 =
      (f.1.baseChange S).baseChange T := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P] in
lemma AffineCategory.pullbackTower_map_tmul (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') (t : T) (s : S) (x : X.1) :
    ((AffineCategory.pullbackTower n m).map f).1 (t ⊗ₜ[S] (s ⊗ₜ[R] x)) =
      t ⊗ₜ[S] (s ⊗ₜ[R] f.1 x) := by
  sorry

def AffineCategory.pullbackTowerIso (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory.pullbackTower (lam := lam) n m ≅ AffineCategory.pullback (n.towerComp m) :=
  NatIso.ofComponents (fun X => AffineCategory.isoMk
    (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X.1)
    (X.2.affinePullback_tower_horizontal n m)) (by
    intro X X' f
    apply Subtype.ext
    change (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X'.1).toLinearMap.comp
        ((f.1.baseChange S).baseChange T) =
      (f.1.baseChange T).comp
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X.1).toLinearMap
    rw [LinearMap.baseChange_baseChange]
    ext x
    simp)

lemma AffineCategory.pullbackTowerIso_hom (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    ((AffineCategory.pullbackTowerIso n m).hom.app X).1 =
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X.1).toLinearMap := by
  sorry

lemma AffineCategory.pullbackTowerIso_inv (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    ((AffineCategory.pullbackTowerIso n m).inv.app X).1 =
      (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X.1).symm.toLinearMap := by
  sorry

lemma AffineCategory.pullbackTowerIso_naturality
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') :
    (AffineCategory.pullbackTower n m).map f ≫ (AffineCategory.pullbackTowerIso n m).hom.app X' =
      (AffineCategory.pullbackTowerIso n m).hom.app X ≫
        (AffineCategory.pullback (n.towerComp m)).map f := by
  sorry

lemma AffineCategory.pullbackTowerIso_flat_iff
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    (∀ x, ((AffineCategory.pullback (n.towerComp m)).obj X).2.curvature x = 0) ↔
      ∀ x, ((AffineCategory.pullbackTower n m).obj X).2.curvature x = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory
open scoped TensorProduct
universe u w z p q a b
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W] [IsScalarTower k R W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {Ω : TwoForms k R W Z} {lam mu : R}

-- test: AffineTowerTests.parameter_roundtrip
example (h : lam = mu) (X : AffineCategory Ω lam) (x : X.1) :
    ((AffineCategory.parameterChange h ⋙ AffineCategory.parameterChange h.symm).obj X).2.toAddHom x =
      X.2.toAddHom x ∧
    AffineCategory.parameterChange (Ω := Ω) h ⋙ AffineCategory.parameterChange h.symm = 𝟭 _ := by
  sorry

-- test: AffineTowerTests.parameter_nonconstant
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let X : AffineCategory Ω (Polynomial.X + 0) :=
        ⟨ModuleCat.of (Polynomial ℤ) (Polynomial ℤ), Preconnection.unit Ω (Polynomial.X + 0)⟩
      TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (((AffineCategory.parameterChange (add_zero Polynomial.X)).obj X).2.toAddHom Polynomial.X) =
          Polynomial.X := by
  sorry

variable {S T : Type u} [CommRing S] [CommRing T]
  [Algebra k S] [Algebra k T] [Algebra R S] [Algebra S T] [Algebra R T]
  [IsScalarTower R S T]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V] [IsScalarTower k S V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P] [IsScalarTower k T P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}

-- test: AffineTowerTests.naturality_generator
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') (t : T) (s : S) (x : X.1) :
    (((AffineCategory.pullbackTower n m).map f ≫
      (AffineCategory.pullbackTowerIso n m).hom.app X').1) (t ⊗ₜ[S] (s ⊗ₜ[R] x)) =
        (s • t) ⊗ₜ[R] f.1 x ∧
    (((AffineCategory.pullbackTowerIso n m).hom.app X ≫
      (AffineCategory.pullback (n.towerComp m)).map f).1) (t ⊗ₜ[S] (s ⊗ₜ[R] x)) =
        (s • t) ⊗ₜ[R] f.1 x := by
  sorry

-- test: AffineTowerTests.inverse_generator
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (t : T) (x : X.1) :
    ((AffineCategory.pullbackTowerIso n m).inv.app X).1 (t ⊗ₜ[R] x) =
      t ⊗ₜ[S] ((1 : S) ⊗ₜ[R] x) ∧
    ((AffineCategory.pullbackTowerIso n m).hom.app X).1
      (((AffineCategory.pullbackTowerIso n m).inv.app X).1 (t ⊗ₜ[R] x)) = t ⊗ₜ[R] x := by
  sorry

-- test: AffineTowerTests.zero_arrow
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X X' : AffineCategory Ω lam) :
    ∃ f : X ⟶ X', ((AffineCategory.pullbackTower n m).map f).1 = 0 ∧
      (((AffineCategory.pullbackTower n m).map f ≫
        (AffineCategory.pullbackTowerIso n m).hom.app X').1) = 0 := by
  sorry

-- test: AffineTowerTests.nonreduced_operator
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let X : AffineCategory Ω (0 : ZMod 4) :=
        ⟨ModuleCat.of (ZMod 4) (ZMod 4),
          Preconnection.ofLinear (TensorProduct.lid (ZMod 4) (ZMod 4)).symm.toLinearMap⟩
      let m := TwoForms.Morphism.refl Ω
      let v := ((AffineCategory.pullbackTowerIso m m).hom.app X).1
        ((1 : ZMod 4) ⊗ₜ[ZMod 4] ((1 : ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)))
      TensorProduct.lid (ZMod 4) (ZMod 4) v = 2 ∧
      TensorProduct.lid (ZMod 4) (ZMod 4) v ≠ 0 ∧
      (TensorProduct.lid (ZMod 4) (ZMod 4) v)^2 = 0 ∧
      X.2.toAddHom 2 ≠ 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
variable [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Q : Type q} [AddCommGroup Q] [Module S Q] [IsScalarTower k S V]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Q} {lam : R}

def AffineCategory.pullbackTensorIso (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X Y : AffineCategory Ω lam) :
    (AffineCategory.pullback m).obj X ⊗ (AffineCategory.pullback m).obj Y ≅
      (AffineCategory.pullback m).obj (X ⊗ Y) :=
  AffineCategory.isoMk (TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).symm
    (X.2.affinePullback_tensor_horizontal_inv m Y.2)

def AffineCategory.pullbackUnitIso (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    𝟙_ (AffineCategory Γ (algebraMap R S lam)) ≅
      (AffineCategory.pullback (lam := lam) m).obj (𝟙_ (AffineCategory Ω lam)) :=
  AffineCategory.isoMk (TensorProduct.AlgebraTensorModule.rid R S S).symm
    (Preconnection.affinePullback_unitConnection_horizontal_inv m)

def AffineCategory.pullbackCoreMonoidal (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullback (lam := lam) m).CoreMonoidal :=
  Functor.CoreMonoidal.mk'
    (AffineCategory.pullbackUnitIso m) (AffineCategory.pullbackTensorIso m)
    (μIso_inv_natural_left := fun {X Y} f X' => by
      let : Module R ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj X').1 := Module.compHom ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj X').1 (algebraMap R S)
      let : IsScalarTower R S ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj X').1 := IsScalarTower.of_compHom R S ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj X').1
      apply Subtype.ext
      apply TensorProduct.AlgebraTensorModule.curry_injective
      apply LinearMap.ext
      intro s
      apply TensorProduct.ext'
      intro x y
      rfl)
    (μIso_inv_natural_right := fun {X Y} X' f => by
      let : Module R ((AffineCategory.pullback m).obj X' ⊗ (AffineCategory.pullback m).obj Y).1 := Module.compHom ((AffineCategory.pullback m).obj X' ⊗ (AffineCategory.pullback m).obj Y).1 (algebraMap R S)
      let : IsScalarTower R S ((AffineCategory.pullback m).obj X' ⊗ (AffineCategory.pullback m).obj Y).1 := IsScalarTower.of_compHom R S ((AffineCategory.pullback m).obj X' ⊗ (AffineCategory.pullback m).obj Y).1
      apply Subtype.ext
      apply TensorProduct.AlgebraTensorModule.curry_injective
      apply LinearMap.ext
      intro s
      apply TensorProduct.ext'
      intro x y
      rfl)
    (oplax_associativity := fun X Y Z => by
      let : Module R ((AffineCategory.pullback m).obj X ⊗ ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj Z)).1 := Module.compHom ((AffineCategory.pullback m).obj X ⊗ ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj Z)).1 (algebraMap R S)
      let : IsScalarTower R S ((AffineCategory.pullback m).obj X ⊗ ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj Z)).1 := IsScalarTower.of_compHom R S ((AffineCategory.pullback m).obj X ⊗ ((AffineCategory.pullback m).obj Y ⊗ (AffineCategory.pullback m).obj Z)).1
      apply Subtype.ext
      apply TensorProduct.AlgebraTensorModule.curry_injective
      apply LinearMap.ext
      intro s
      apply TensorProduct.ext_threefold
      intro x y z
      rfl)
    (oplax_left_unitality := fun X => by
      let : Module R (𝟙_ (AffineCategory Γ (algebraMap R S lam)) ⊗ (AffineCategory.pullback m).obj X).1 := Module.compHom (𝟙_ (AffineCategory Γ (algebraMap R S lam)) ⊗ (AffineCategory.pullback m).obj X).1 (algebraMap R S)
      let : IsScalarTower R S (𝟙_ (AffineCategory Γ (algebraMap R S lam)) ⊗ (AffineCategory.pullback m).obj X).1 := IsScalarTower.of_compHom R S (𝟙_ (AffineCategory Γ (algebraMap R S lam)) ⊗ (AffineCategory.pullback m).obj X).1
      apply Subtype.ext
      apply TensorProduct.AlgebraTensorModule.ext
      intro s x
      change (1 : S) ⊗ₜ[S] (s ⊗ₜ[R] x) =
        TensorProduct.map (TensorProduct.AlgebraTensorModule.rid R S S).toLinearMap
          LinearMap.id (TensorProduct.AlgebraTensorModule.distribBaseChange R S R X.1
            (s ⊗ₜ[R] ((1 : R) ⊗ₜ[R] x)))
      rw [TensorProduct.AlgebraTensorModule.distribBaseChange_tmul, TensorProduct.map_tmul]
      simp only [LinearEquiv.coe_toLinearMap, TensorProduct.AlgebraTensorModule.rid_tmul,
        one_smul, LinearMap.id_apply]
      change (1 : S) ⊗ₜ[S] (s ⊗ₜ[R] x) = s ⊗ₜ[S] ((1 : S) ⊗ₜ[R] x)
      simpa only [TensorProduct.smul_tmul', smul_eq_mul, mul_one] using
        (TensorProduct.tmul_smul (R := S) s (1 : S) ((1 : S) ⊗ₜ[R] x)))
    (oplax_right_unitality := fun X => by
      let : Module R ((AffineCategory.pullback m).obj X ⊗ 𝟙_ (AffineCategory Γ (algebraMap R S lam))).1 := Module.compHom ((AffineCategory.pullback m).obj X ⊗ 𝟙_ (AffineCategory Γ (algebraMap R S lam))).1 (algebraMap R S)
      let : IsScalarTower R S ((AffineCategory.pullback m).obj X ⊗ 𝟙_ (AffineCategory Γ (algebraMap R S lam))).1 := IsScalarTower.of_compHom R S ((AffineCategory.pullback m).obj X ⊗ 𝟙_ (AffineCategory Γ (algebraMap R S lam))).1
      apply Subtype.ext
      apply TensorProduct.AlgebraTensorModule.ext
      intro s x
      change (s ⊗ₜ[R] x) ⊗ₜ[S] (1 : S) =
        TensorProduct.map LinearMap.id (TensorProduct.AlgebraTensorModule.rid R S S).toLinearMap
          (TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 R
            (s ⊗ₜ[R] (x ⊗ₜ[R] (1 : R))))
      rw [TensorProduct.AlgebraTensorModule.distribBaseChange_tmul, TensorProduct.map_tmul]
      simp only [LinearEquiv.coe_toLinearMap, TensorProduct.AlgebraTensorModule.rid_tmul,
        one_smul, LinearMap.id_apply])

@[instance_reducible]
def AffineCategory.pullbackMonoidal (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullback (lam := lam) m).Monoidal :=
  (AffineCategory.pullbackCoreMonoidal m).toMonoidal

attribute [instance] AffineCategory.pullbackMonoidal

lemma AffineCategory.pullbackTensorIso_hom (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X Y : AffineCategory Ω lam) :
    (AffineCategory.pullbackTensorIso m X Y).hom.1 =
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).symm.toLinearMap := by
  sorry

lemma AffineCategory.pullbackTensorIso_inv (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X Y : AffineCategory Ω lam) :
    (AffineCategory.pullbackTensorIso m X Y).inv.1 =
      (TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).toLinearMap := by
  sorry

lemma AffineCategory.pullbackTensorIso_naturality
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    {X X' Y Y' : AffineCategory Ω lam} (f : X ⟶ X') (g : Y ⟶ Y') :
    ((AffineCategory.pullback m).map f ⊗ₘ (AffineCategory.pullback m).map g) ≫
      (AffineCategory.pullbackTensorIso m X' Y').hom =
    (AffineCategory.pullbackTensorIso m X Y).hom ≫ (AffineCategory.pullback m).map (f ⊗ₘ g) := by
  sorry

lemma AffineCategory.pullbackTensorIso_flat_iff
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    (∀ x, ((AffineCategory.pullback m).obj (X ⊗ Y)).2.curvature x = 0) ↔
      ∀ x, (((AffineCategory.pullback m).obj X) ⊗ ((AffineCategory.pullback m).obj Y)).2.curvature x = 0 := by
  sorry

lemma AffineCategory.pullbackUnitIso_hom (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackUnitIso (lam := lam) m).hom.1 =
      (TensorProduct.AlgebraTensorModule.rid R S S).symm.toLinearMap := by
  sorry

lemma AffineCategory.pullbackUnitIso_inv (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackUnitIso (lam := lam) m).inv.1 =
      (TensorProduct.AlgebraTensorModule.rid R S S).toLinearMap := by
  sorry

lemma AffineCategory.pullbackUnitIso_curvature
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (s : S) :
    ((AffineCategory.pullback (lam := lam) m).obj (𝟙_ (AffineCategory Ω lam))).2.curvature
      ((AffineCategory.pullbackUnitIso m).hom.1 s) =
    TensorProduct.map (AffineCategory.pullbackUnitIso m).hom.1 LinearMap.id
      ((𝟙_ (AffineCategory Γ (algebraMap R S lam))).2.curvature s) := by
  sorry

lemma AffineCategory.pullbackCoreMonoidal_tensor
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    (AffineCategory.pullbackCoreMonoidal m).μIso X Y = AffineCategory.pullbackTensorIso m X Y := by
  sorry

lemma AffineCategory.pullbackCoreMonoidal_unit
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackCoreMonoidal (lam := lam) m).εIso = AffineCategory.pullbackUnitIso m := by
  sorry

lemma AffineCategory.pullbackCoreMonoidal_associativity
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y Z : AffineCategory Ω lam) :
    (AffineCategory.pullbackTensorIso m X Y).hom ▷ (AffineCategory.pullback m).obj Z ≫
      (AffineCategory.pullbackTensorIso m (X ⊗ Y) Z).hom ≫
        (AffineCategory.pullback m).map (α_ X Y Z).hom =
    (α_ ((AffineCategory.pullback m).obj X) ((AffineCategory.pullback m).obj Y)
      ((AffineCategory.pullback m).obj Z)).hom ≫
        (AffineCategory.pullback m).obj X ◁ (AffineCategory.pullbackTensorIso m Y Z).hom ≫
          (AffineCategory.pullbackTensorIso m X (Y ⊗ Z)).hom := by
  sorry

lemma AffineCategory.pullbackCoreMonoidal_left_unitality
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    (λ_ ((AffineCategory.pullback m).obj X)).hom =
      (AffineCategory.pullbackUnitIso m).hom ▷ (AffineCategory.pullback m).obj X ≫
        (AffineCategory.pullbackTensorIso m (𝟙_ (AffineCategory Ω lam)) X).hom ≫
          (AffineCategory.pullback m).map (λ_ X).hom := by
  sorry

lemma AffineCategory.pullbackCoreMonoidal_right_unitality
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    (ρ_ ((AffineCategory.pullback m).obj X)).hom =
      (AffineCategory.pullback m).obj X ◁ (AffineCategory.pullbackUnitIso m).hom ≫
        (AffineCategory.pullbackTensorIso m X (𝟙_ (AffineCategory Ω lam))).hom ≫
          (AffineCategory.pullback m).map (ρ_ X).hom := by
  sorry

lemma AffineCategory.pullbackMonoidal_μ
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    Functor.LaxMonoidal.μ (AffineCategory.pullback m) X Y =
      (AffineCategory.pullbackTensorIso m X Y).hom := by
  sorry

lemma AffineCategory.pullbackMonoidal_δ
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    Functor.OplaxMonoidal.δ (AffineCategory.pullback m) X Y =
      (AffineCategory.pullbackTensorIso m X Y).inv := by
  sorry

lemma AffineCategory.pullbackMonoidal_ε
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    Functor.LaxMonoidal.ε (AffineCategory.pullback (lam := lam) m) =
      (AffineCategory.pullbackUnitIso m).hom := by
  sorry

lemma AffineCategory.pullbackMonoidal_η
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    Functor.OplaxMonoidal.η (AffineCategory.pullback (lam := lam) m) =
      (AffineCategory.pullbackUnitIso m).inv := by
  sorry

end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
variable [Algebra k R] [Algebra k S] [Algebra R S]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Q : Type q} [AddCommGroup Q] [Module S Q] [IsScalarTower k S V]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Q} {lam : R}

-- test: StrongMonoidalPullbackTests.tensor_generators
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (s t : S) (x : X.1) (y : Y.1) :
    (AffineCategory.pullbackTensorIso m X Y).hom.1 ((s ⊗ₜ[R] x) ⊗ₜ[S] (t ⊗ₜ[R] y)) =
      (s * t) ⊗ₜ[R] (x ⊗ₜ[R] y) ∧
    (AffineCategory.pullbackTensorIso m X Y).inv.1 (s ⊗ₜ[R] (x ⊗ₜ[R] y)) =
      (s ⊗ₜ[R] x) ⊗ₜ[S] ((1 : S) ⊗ₜ[R] y) := by
  sorry

-- test: StrongMonoidalPullbackTests.tensor_naturality
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    {X X' Y Y' : AffineCategory Ω lam} (f : X ⟶ X') (g : Y ⟶ Y')
    (s t : S) (x : X.1) (y : Y.1) :
    (((AffineCategory.pullback m).map f ⊗ₘ (AffineCategory.pullback m).map g) ≫
      (AffineCategory.pullbackTensorIso m X' Y').hom).1
        ((s ⊗ₜ[R] x) ⊗ₜ[S] (t ⊗ₜ[R] y)) =
    ((AffineCategory.pullbackTensorIso m X Y).hom ≫
      (AffineCategory.pullback m).map (f ⊗ₘ g)).1
        ((s ⊗ₜ[R] x) ⊗ₜ[S] (t ⊗ₜ[R] y)) := by
  sorry

-- test: StrongMonoidalPullbackTests.coherence
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y Z : AffineCategory Ω lam) :
    (AffineCategory.pullbackCoreMonoidal m).μIso X Y = AffineCategory.pullbackTensorIso m X Y ∧
    (AffineCategory.pullbackCoreMonoidal (lam := lam) m).εIso =
      AffineCategory.pullbackUnitIso (lam := lam) m ∧
    (λ_ ((AffineCategory.pullback m).obj X)).hom =
      Functor.LaxMonoidal.ε (AffineCategory.pullback m) ▷ (AffineCategory.pullback m).obj X ≫
        Functor.LaxMonoidal.μ (AffineCategory.pullback m) (𝟙_ (AffineCategory Ω lam)) X ≫
          (AffineCategory.pullback m).map (λ_ X).hom ∧
    (ρ_ ((AffineCategory.pullback m).obj X)).hom =
      (AffineCategory.pullback m).obj X ◁ Functor.LaxMonoidal.ε (AffineCategory.pullback m) ≫
        Functor.LaxMonoidal.μ (AffineCategory.pullback m) X (𝟙_ (AffineCategory Ω lam)) ≫
          (AffineCategory.pullback m).map (ρ_ X).hom ∧
    (AffineCategory.pullbackTensorIso m X Y).hom ▷ (AffineCategory.pullback m).obj Z ≫
      (AffineCategory.pullbackTensorIso m (X ⊗ Y) Z).hom ≫
        (AffineCategory.pullback m).map (α_ X Y Z).hom =
    (α_ ((AffineCategory.pullback m).obj X) ((AffineCategory.pullback m).obj Y)
      ((AffineCategory.pullback m).obj Z)).hom ≫
        (AffineCategory.pullback m).obj X ◁ (AffineCategory.pullbackTensorIso m Y Z).hom ≫
          (AffineCategory.pullbackTensorIso m X (Y ⊗ Z)).hom := by
  sorry

-- test: StrongMonoidalPullbackTests.unit_generators
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (s : S) :
    (AffineCategory.pullbackUnitIso (lam := lam) m).hom.1 s = s ⊗ₜ[R] (1 : R) ∧
    (AffineCategory.pullbackUnitIso (lam := lam) m).inv.1 (s ⊗ₜ[R] (1 : R)) = s ∧
    (AffineCategory.pullbackUnitIso (lam := lam) m).inv.1
      ((AffineCategory.pullbackUnitIso (lam := lam) m).hom.1 s) = s := by
  sorry

-- test: StrongMonoidalPullbackTests.nonconstant_parameter
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let m := TwoForms.Morphism.refl Ω
      let U := 𝟙_ (AffineCategory Ω Polynomial.X)
      let i := AffineCategory.pullbackUnitIso (lam := Polynomial.X) m
      TensorProduct.lid (Polynomial ℤ) (Polynomial ℤ)
        (TensorProduct.map i.inv.1 LinearMap.id
          (((AffineCategory.pullback m).obj U).2.toAddHom (i.hom.1 Polynomial.X))) =
        Polynomial.X := by
  sorry

-- test: StrongMonoidalPullbackTests.nonreduced_tensor
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let U := 𝟙_ (AffineCategory Ω (0 : ZMod 4))
      let m := TwoForms.Morphism.refl Ω
      let i := AffineCategory.pullbackTensorIso m U U
      let e := (TensorProduct.AlgebraTensorModule.rid (ZMod 4) (ZMod 4) (ZMod 4)).toLinearMap.comp
        ((TensorProduct.lid (ZMod 4) (ZMod 4)).toLinearMap.baseChange (ZMod 4))
      let value := e (i.hom.1 (((2 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4)) ⊗ₜ[ZMod 4]
        ((1 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4))))
      value = 2 ∧ value ≠ 0 ∧ value * value = 0 ∧
      (AffineCategory.pullbackUnitIso (lam := (0 : ZMod 4)) m).inv.1
        ((AffineCategory.pullbackUnitIso m).hom.1 (2 : ZMod 4)) = (2 : ZMod 4) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z p q a b
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {Ω : TwoForms k R W Z} {lam mu : R}

@[instance_reducible]
def AffineCategory.parameterChangeMonoidal (h : lam = mu) :
    (AffineCategory.parameterChange (Ω := Ω) h).Monoidal := by
  subst mu
  exact inferInstanceAs ((𝟭 (AffineCategory Ω lam)).Monoidal)

attribute [instance] AffineCategory.parameterChangeMonoidal

lemma AffineCategory.parameterChangeMonoidal_tensor (h : lam = mu)
    (X Y : AffineCategory Ω lam) :
    (Functor.LaxMonoidal.μ (AffineCategory.parameterChange h) X Y).1 =
      LinearMap.id := by
  sorry

lemma AffineCategory.parameterChangeMonoidal_unit (h : lam = mu) :
    (Functor.LaxMonoidal.ε (AffineCategory.parameterChange (Ω := Ω) h)).1 =
      LinearMap.id := by
  sorry

lemma AffineCategory.parameterChangeMonoidal_cotensor (h : lam = mu)
    (X Y : AffineCategory Ω lam) :
    (Functor.OplaxMonoidal.δ (AffineCategory.parameterChange h) X Y).1 =
      LinearMap.id := by
  sorry

lemma AffineCategory.parameterChangeMonoidal_counit (h : lam = mu) :
    (Functor.OplaxMonoidal.η (AffineCategory.parameterChange (Ω := Ω) h)).1 =
      LinearMap.id := by
  sorry

lemma AffineCategory.pullbackIdentityIso_unit :
    Functor.LaxMonoidal.ε (AffineCategory.pullback (lam := lam) (TwoForms.Morphism.refl Ω)) ≫
      (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app
        (𝟙_ (AffineCategory Ω lam)) =
      Functor.LaxMonoidal.ε (𝟭 (AffineCategory Ω lam)) := by
  sorry

lemma AffineCategory.pullbackIdentityIso_tensor (X Y : AffineCategory Ω lam) :
    Functor.LaxMonoidal.μ (AffineCategory.pullback (TwoForms.Morphism.refl Ω)) X Y ≫
      (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app (X ⊗ Y) =
    ((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app X ⊗ₘ
      (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app Y) ≫
      Functor.LaxMonoidal.μ (𝟭 (AffineCategory Ω lam)) X Y := by
  sorry

lemma AffineCategory.pullbackIdentityIso_isMonoidal :
    NatTrans.IsMonoidal (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom := by
  sorry

attribute [instance] AffineCategory.pullbackIdentityIso_isMonoidal

lemma AffineCategory.pullbackIdentityIso_inv_isMonoidal :
    NatTrans.IsMonoidal (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).inv := by
  sorry

variable {S : Type u} [CommRing S] [Algebra k S] [Algebra R S]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V] [IsScalarTower k S V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Γ : TwoForms k S V Y}

lemma AffineCategory.pullback_braiding (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X Y : AffineCategory Ω lam) :
    (AffineCategory.pullbackTensorIso m X Y).hom ≫
      (AffineCategory.pullback m).map (β_ X Y).hom =
    (β_ ((AffineCategory.pullback m).obj X) ((AffineCategory.pullback m).obj Y)).hom ≫
      (AffineCategory.pullbackTensorIso m Y X).hom := by
  sorry

@[instance_reducible]
def AffineCategory.pullbackBraided (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullback (lam := lam) m).Braided where
  __ := AffineCategory.pullbackMonoidal m
  braided := AffineCategory.pullback_braiding m

attribute [instance] AffineCategory.pullbackBraided

variable {T : Type u} [CommRing T] [Algebra k T] [Algebra S T] [Algebra R T]
  [IsScalarTower R S T]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P] [IsScalarTower k T P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {Δ : TwoForms k T P Q}

@[instance_reducible]
def AffineCategory.pullbackTowerMonoidal (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackTower (lam := lam) n m).Monoidal :=
  inferInstanceAs ((AffineCategory.pullback m ⋙ AffineCategory.pullback n ⋙
    AffineCategory.parameterChange (IsScalarTower.algebraMap_apply R S T lam).symm).Monoidal)

attribute [instance] AffineCategory.pullbackTowerMonoidal

lemma AffineCategory.pullbackTowerMonoidal_unit
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (Functor.LaxMonoidal.ε (AffineCategory.pullbackTower (lam := lam) n m)).1 =
      ((TensorProduct.AlgebraTensorModule.rid R S S).symm.toLinearMap.baseChange T).comp
        (TensorProduct.AlgebraTensorModule.rid S T T).symm.toLinearMap := by
  sorry

lemma AffineCategory.pullbackTowerMonoidal_tensor
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    (Functor.LaxMonoidal.μ (AffineCategory.pullbackTower n m) X Y).1 =
      ((TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).symm.toLinearMap.baseChange T).comp
        (TensorProduct.AlgebraTensorModule.distribBaseChange S T (S ⊗[R] X.1)
          (S ⊗[R] Y.1)).symm.toLinearMap := by
  sorry

lemma AffineCategory.pullbackTowerMonoidal_cotensor
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    (Functor.OplaxMonoidal.δ (AffineCategory.pullbackTower n m) X Y).1 =
      (TensorProduct.AlgebraTensorModule.distribBaseChange S T (S ⊗[R] X.1)
        (S ⊗[R] Y.1)).toLinearMap.comp
        ((TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).toLinearMap.baseChange T) := by
  sorry

lemma AffineCategory.pullbackTowerIso_unit
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    Functor.LaxMonoidal.ε (AffineCategory.pullbackTower (lam := lam) n m) ≫
      (AffineCategory.pullbackTowerIso n m).hom.app (𝟙_ (AffineCategory Ω lam)) =
      Functor.LaxMonoidal.ε (AffineCategory.pullback (lam := lam) (n.towerComp m)) := by
  sorry

lemma AffineCategory.pullbackTowerIso_tensor
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    Functor.LaxMonoidal.μ (AffineCategory.pullbackTower n m) X Y ≫
      (AffineCategory.pullbackTowerIso n m).hom.app (X ⊗ Y) =
    ((AffineCategory.pullbackTowerIso n m).hom.app X ⊗ₘ
      (AffineCategory.pullbackTowerIso n m).hom.app Y) ≫
      Functor.LaxMonoidal.μ (AffineCategory.pullback (n.towerComp m)) X Y := by
  sorry

lemma AffineCategory.pullbackTowerIso_isMonoidal
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTowerIso (lam := lam) n m).hom := by
  sorry

attribute [instance] AffineCategory.pullbackTowerIso_isMonoidal

lemma AffineCategory.pullbackTowerIso_inv_isMonoidal
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTowerIso (lam := lam) n m).inv := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
set_option maxHeartbeats 800000
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z p q a b
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z] [IsScalarTower k R W]
variable {Ω : TwoForms k R W Z} {lam mu : R}

-- test: AffineMonoidalComparisonTests.parameter_values
example (h : lam = mu) (X Y : AffineCategory Ω lam) (x : X.1) (y : Y.1) (r : R) :
    (Functor.LaxMonoidal.μ (AffineCategory.parameterChange h) X Y).1 (x ⊗ₜ[R] y) =
      x ⊗ₜ[R] y ∧
    (Functor.LaxMonoidal.ε (AffineCategory.parameterChange (Ω := Ω) h)).1 r = r ∧
    (Functor.OplaxMonoidal.δ (AffineCategory.parameterChange h) X Y).1 (x ⊗ₜ[R] y) =
      x ⊗ₜ[R] y ∧
    (Functor.OplaxMonoidal.η (AffineCategory.parameterChange (Ω := Ω) h)).1 r = r := by
  sorry

-- test: AffineMonoidalComparisonTests.parameter_roundtrip
example (h : lam = mu) (X Y : AffineCategory Ω lam) (a : X.1 ⊗[R] Y.1) :
    (Functor.LaxMonoidal.μ (AffineCategory.parameterChange h.symm)
      ((AffineCategory.parameterChange h).obj X) ((AffineCategory.parameterChange h).obj Y)).1
      ((Functor.LaxMonoidal.μ (AffineCategory.parameterChange h) X Y).1 a) = a := by
  sorry

-- test: AffineMonoidalComparisonTests.identity_unit
example (r : R) :
    ((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app
      (𝟙_ (AffineCategory Ω lam))).1
      ((AffineCategory.pullbackUnitIso (lam := lam) (TwoForms.Morphism.refl Ω)).hom.1 r) = r := by
  sorry

-- test: AffineMonoidalComparisonTests.identity_tensor
example (X Y : AffineCategory Ω lam) (r s : R) (x : X.1) (y : Y.1) :
    ((AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := lam)).hom.app (X ⊗ Y)).1
      ((AffineCategory.pullbackTensorIso (TwoForms.Morphism.refl Ω) X Y).hom.1
        ((r ⊗ₜ[R] x) ⊗ₜ[R] (s ⊗ₜ[R] y))) = (r • x) ⊗ₜ[R] (s • y) := by
  sorry

variable {S T : Type u} [CommRing S] [CommRing T]
  [Algebra k S] [Algebra k T] [Algebra R S] [Algebra S T] [Algebra R T]
  [IsScalarTower R S T]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V] [IsScalarTower k S V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P] [IsScalarTower k T P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}

-- test: AffineMonoidalComparisonTests.braiding_generators
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (s t : S) (x : X.1) (y : Y.1) :
    ((AffineCategory.pullback m).map (β_ X Y).hom).1
      ((Functor.LaxMonoidal.μ (AffineCategory.pullback m) X Y).1
        ((s ⊗ₜ[R] x) ⊗ₜ[S] (t ⊗ₜ[R] y))) =
      (s * t) ⊗ₜ[R] (y ⊗ₜ[R] x) := by
  sorry

-- test: AffineMonoidalComparisonTests.tower_unit
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (t : T) :
    ((AffineCategory.pullbackTowerIso n m).hom.app (𝟙_ (AffineCategory Ω lam))).1
      ((Functor.LaxMonoidal.ε (AffineCategory.pullbackTower (lam := lam) n m)).1 t) =
        t ⊗ₜ[R] (1 : R) := by
  sorry

-- test: AffineMonoidalComparisonTests.tower_tensor
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (t u : T) (s v : S) (x : X.1) (y : Y.1) :
    ((AffineCategory.pullbackTowerIso n m).hom.app (X ⊗ Y)).1
      ((Functor.LaxMonoidal.μ (AffineCategory.pullbackTower n m) X Y).1
        ((t ⊗ₜ[S] (s ⊗ₜ[R] x)) ⊗ₜ[T] (u ⊗ₜ[S] (v ⊗ₜ[R] y)))) =
      ((s * v) • (t * u)) ⊗ₜ[R] (x ⊗ₜ[R] y) := by
  sorry

-- test: AffineMonoidalComparisonTests.inverse_monoidal
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    Functor.LaxMonoidal.μ (AffineCategory.pullback (n.towerComp m)) X Y ≫
      (AffineCategory.pullbackTowerIso n m).inv.app (X ⊗ Y) =
    ((AffineCategory.pullbackTowerIso n m).inv.app X ⊗ₘ
      (AffineCategory.pullbackTowerIso n m).inv.app Y) ≫
      Functor.LaxMonoidal.μ (AffineCategory.pullbackTower n m) X Y := by
  sorry

-- test: AffineMonoidalComparisonTests.nonconstant_parameter
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let h := (rfl : Polynomial.X = Polynomial.X)
      (Functor.LaxMonoidal.ε (AffineCategory.parameterChange (Ω := Ω) h)).1 Polynomial.X =
        Polynomial.X ∧
      NatTrans.IsMonoidal (AffineCategory.pullbackIdentityIso (Ω := Ω) (lam := Polynomial.X)).hom := by
  sorry

-- test: AffineMonoidalComparisonTests.nonreduced_tower
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let m := TwoForms.Morphism.refl Ω
      let U := 𝟙_ (AffineCategory Ω (0 : ZMod 4))
      let value := TensorProduct.lid (ZMod 4) (ZMod 4)
        (((AffineCategory.pullbackTowerIso m m).hom.app U).1
          ((Functor.LaxMonoidal.ε (AffineCategory.pullbackTower (lam := (0 : ZMod 4)) m m)).1 (2 : ZMod 4)))
      value = 2 ∧ value ≠ 0 ∧ value * value = 0 ∧
        Nonempty (AffineCategory.pullback (lam := (0 : ZMod 4)) m).Braided := by
  sorry

-- test: AffineMonoidalComparisonTests.zero_ring
example :
    ∃ Ω : TwoForms (ZMod 1) (ZMod 1) (ZMod 1) (Fin 0 → ZMod 1),
      let m := TwoForms.Morphism.refl Ω
      let U := 𝟙_ (AffineCategory Ω (0 : ZMod 1))
      Nonempty (AffineCategory.pullback (lam := (0 : ZMod 1)) m).Braided ∧
      ((Functor.LaxMonoidal.μ (AffineCategory.pullback m) U U).1
        (((0 : ZMod 1) ⊗ₜ[ZMod 1] (0 : ZMod 1)) ⊗ₜ[ZMod 1]
          ((0 : ZMod 1) ⊗ₜ[ZMod 1] (0 : ZMod 1)))) = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 200000
open CategoryTheory
open scoped TensorProduct
universe u w z p q a b c d
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W] [IsScalarTower k R W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {Ω : TwoForms k R W Z} {lam mu : R}
variable {S : Type u} [CommRing S] [Algebra k S] [Algebra R S]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V] [IsScalarTower k S V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Γ : TwoForms k S V Y}

def AffineCategory.pullbackParameterChangeIso (h : lam = mu)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory.parameterChange h ⋙ AffineCategory.pullback m ≅
      AffineCategory.pullback m ⋙
        AffineCategory.parameterChange (congrArg (algebraMap R S) h) :=
  NatIso.ofComponents (fun X => AffineCategory.isoMk (LinearEquiv.refl S (S ⊗[R] X.1))
    (by
      intro x
      subst mu
      change ((AffineCategory.pullback m).obj X).2.toAddHom x =
        TensorProduct.map LinearMap.id LinearMap.id (((AffineCategory.pullback m).obj X).2.toAddHom x)
      simp)) (by intro X X' f; apply Subtype.ext; rfl)

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma AffineCategory.pullbackParameterChangeIso_hom (h : lam = mu)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : S ⊗[R] X.1) :
    ((AffineCategory.pullbackParameterChangeIso h m).hom.app X).1 x = x := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma AffineCategory.pullbackParameterChangeIso_inv (h : lam = mu)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : S ⊗[R] X.1) :
    ((AffineCategory.pullbackParameterChangeIso h m).inv.app X).1 x = x := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] in
lemma AffineCategory.pullbackParameterChangeIso_naturality (h : lam = mu)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') :
    (AffineCategory.parameterChange h ⋙ AffineCategory.pullback m).map f ≫
        (AffineCategory.pullbackParameterChangeIso h m).hom.app X' =
      (AffineCategory.pullbackParameterChangeIso h m).hom.app X ≫
        (AffineCategory.pullback m ⋙
          AffineCategory.parameterChange (congrArg (algebraMap R S) h)).map f := by
  sorry

variable {T U : Type u} [CommRing T] [CommRing U]
  [Algebra k T] [Algebra k U] [Algebra S T] [Algebra R T]
  [Algebra T U] [Algebra S U] [Algebra R U]
  [IsScalarTower R S T] [IsScalarTower S T U]
  [IsScalarTower R S U] [IsScalarTower R T U]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P] [IsScalarTower k T P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {L : Type c} [AddCommGroup L] [Module U L] [Module k L] [IsScalarTower k U L]
variable {N : Type d} [AddCommGroup N] [Module U N]
variable {Δ : TwoForms k T P Q} {Ξ : TwoForms k U L N}

def AffineCategory.pullbackTriple (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory Ω lam ⥤ AffineCategory Ξ (algebraMap R U lam) :=
  AffineCategory.pullback m ⋙ AffineCategory.pullback n ⋙ AffineCategory.pullback p ⋙
    AffineCategory.parameterChange
      ((congrArg (algebraMap T U) (IsScalarTower.algebraMap_apply R S T lam).symm).trans
        (IsScalarTower.algebraMap_apply R T U lam).symm)

omit [IsScalarTower k R W] [IsScalarTower k S V] [Algebra S U]
  [IsScalarTower S T U] [IsScalarTower R S U] [IsScalarTower k T P] [IsScalarTower k U L] in
lemma AffineCategory.pullbackTriple_operator (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam) :
    ((AffineCategory.pullbackTriple p n m).obj X).2.toAddHom =
      (((X.2.affinePullback m).affinePullback n).affinePullback p).toAddHom := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] [Algebra S U]
  [IsScalarTower S T U] [IsScalarTower R S U] [IsScalarTower k T P] [IsScalarTower k U L] in
lemma AffineCategory.pullbackTriple_map (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') : ((AffineCategory.pullbackTriple p n m).map f).1 =
      ((f.1.baseChange S).baseChange T).baseChange U := by
  sorry

omit [IsScalarTower k R W] [IsScalarTower k S V] [Algebra S U]
  [IsScalarTower S T U] [IsScalarTower R S U] [IsScalarTower k T P] [IsScalarTower k U L] in
lemma AffineCategory.pullbackTriple_map_tmul (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') (u : U) (t : T) (s : S) (x : X.1) :
    ((AffineCategory.pullbackTriple p n m).map f).1
        (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) =
      u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] f.1 x)) := by
  sorry

def AffineCategory.pullbackTripleOuterIso (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory.pullbackTriple (lam := lam) p n m ≅
      AffineCategory.pullback ((p.towerComp n).towerComp m) :=
  NatIso.ofComponents (fun X =>
    (AffineCategory.parameterChange (IsScalarTower.algebraMap_apply R S U lam).symm).mapIso
        ((AffineCategory.pullbackTowerIso p n).app ((AffineCategory.pullback m).obj X)) ≪≫
      (AffineCategory.pullbackTowerIso (p.towerComp n) m).app X) (by
    intro X X' f
    apply Subtype.ext
    change
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U X'.1).toLinearMap.comp
        (TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] X'.1)).toLinearMap).comp
        (((f.1.baseChange S).baseChange T).baseChange U) =
      (f.1.baseChange U).comp
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U X.1).toLinearMap.comp
          (TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] X.1)).toLinearMap)
    rw [← LinearMap.comp_assoc, LinearMap.baseChange_baseChange]
    ext x
    simp [LinearMap.comp_assoc, LinearMap.baseChange_baseChange])

def AffineCategory.pullbackTripleInnerIso (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory.pullbackTriple (lam := lam) p n m ≅
      AffineCategory.pullback (p.towerComp (n.towerComp m)) :=
  NatIso.ofComponents (fun X =>
    (AffineCategory.parameterChange (IsScalarTower.algebraMap_apply R T U lam).symm).mapIso
        ((AffineCategory.pullbackParameterChangeIso
          (IsScalarTower.algebraMap_apply R S T lam).symm p).app
          ((AffineCategory.pullback m ⋙ AffineCategory.pullback n).obj X)).symm ≪≫
    (AffineCategory.parameterChange (IsScalarTower.algebraMap_apply R T U lam).symm).mapIso
        ((AffineCategory.pullback p).mapIso ((AffineCategory.pullbackTowerIso n m).app X)) ≪≫
    (AffineCategory.pullbackTowerIso p (n.towerComp m)).app X) (by
    intro X X' f
    apply Subtype.ext
    change
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U X'.1).toLinearMap.comp
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X'.1).toLinearMap.baseChange U)).comp
        (((f.1.baseChange S).baseChange T).baseChange U) =
      (f.1.baseChange U).comp
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U X.1).toLinearMap.comp
          ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X.1).toLinearMap.baseChange U))
    rw [affinePullback_cancel_assoc, affinePullback_cancel_assoc]
    rw [← LinearMap.comp_assoc, LinearMap.baseChange_baseChange]
    ext x
    simp [LinearMap.comp_assoc, LinearMap.baseChange_baseChange])

lemma AffineCategory.pullbackTripleOuterIso_hom
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] X.1))) :
    ((AffineCategory.pullbackTripleOuterIso p n m).hom.app X).1 x =
      TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U X.1
        (TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] X.1) x) := by
  sorry

lemma AffineCategory.pullbackTripleOuterIso_naturality
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') :
    (AffineCategory.pullbackTriple p n m).map f ≫
        (AffineCategory.pullbackTripleOuterIso p n m).hom.app X' =
      (AffineCategory.pullbackTripleOuterIso p n m).hom.app X ≫
        (AffineCategory.pullback ((p.towerComp n).towerComp m)).map f := by
  sorry

lemma AffineCategory.pullbackTripleOuterIso_tmul
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (u : U) (t : T) (s : S) (x : X.1) :
    ((AffineCategory.pullbackTripleOuterIso p n m).hom.app X).1
        (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) =
      (s • (t • u)) ⊗ₜ[R] x := by
  sorry

lemma AffineCategory.pullbackTripleInnerIso_hom
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] X.1))) :
    ((AffineCategory.pullbackTripleInnerIso p n m).hom.app X).1 x =
      TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U X.1
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T X.1).toLinearMap.baseChange U x) := by
  sorry

lemma AffineCategory.pullbackTripleInnerIso_naturality
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') :
    (AffineCategory.pullbackTriple p n m).map f ≫
        (AffineCategory.pullbackTripleInnerIso p n m).hom.app X' =
      (AffineCategory.pullbackTripleInnerIso p n m).hom.app X ≫
        (AffineCategory.pullback (p.towerComp (n.towerComp m))).map f := by
  sorry

lemma AffineCategory.pullbackTripleInnerIso_tmul
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (u : U) (t : T) (s : S) (x : X.1) :
    ((AffineCategory.pullbackTripleInnerIso p n m).hom.app X).1
        (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) =
      ((s • t) • u) ⊗ₜ[R] x := by
  sorry

lemma AffineCategory.pullbackTriple_coherence_hom
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).hom =
      (AffineCategory.pullbackTripleInnerIso (lam := lam) p n m).hom := by
  sorry

lemma AffineCategory.pullbackTriple_coherence_inv
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).inv =
      (AffineCategory.pullbackTripleInnerIso (lam := lam) p n m).inv := by
  sorry

lemma AffineCategory.pullbackTriple_coherence
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    AffineCategory.pullbackTripleOuterIso (lam := lam) p n m =
      AffineCategory.pullbackTripleInnerIso (lam := lam) p n m := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
open CategoryTheory MonoidalCategory
open scoped TensorProduct
universe u w z p q a b c d
variable {k R : Type u} [CommRing k] [CommRing R] [Algebra k R]
variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W] [IsScalarTower k R W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {Ω : TwoForms k R W Z} {lam mu : R}
variable {S : Type u} [CommRing S] [Algebra k S] [Algebra R S]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V] [IsScalarTower k S V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Γ : TwoForms k S V Y}

-- test: AffineTripleTests.parameter_values
example (h : lam = mu) (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X : AffineCategory Ω lam) (x : S ⊗[R] X.1) :
    ((AffineCategory.pullbackParameterChangeIso h m).hom.app X).1 x = x ∧
      ((AffineCategory.pullbackParameterChangeIso h m).inv.app X).1 x = x := by
  sorry

-- test: AffineTripleTests.parameter_roundtrip
example (h : lam = mu) (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (X : AffineCategory Ω lam) (x : S ⊗[R] X.1) :
    ((AffineCategory.pullbackParameterChangeIso h m).inv.app X).1
      (((AffineCategory.pullbackParameterChangeIso h m).hom.app X).1 x) = x := by
  sorry

-- test: AffineTripleTests.parameter_nonconstant
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let X := 𝟙_ (AffineCategory Ω (Polynomial.X + 0))
      ((AffineCategory.pullbackParameterChangeIso (add_zero Polynomial.X)
        (TwoForms.Morphism.refl Ω)).hom.app X).1
        ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] Polynomial.X) =
          (1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] Polynomial.X := by
  sorry

variable {T U : Type u} [CommRing T] [CommRing U]
  [Algebra k T] [Algebra k U] [Algebra S T] [Algebra R T]
  [Algebra T U] [Algebra S U] [Algebra R U]
  [IsScalarTower R S T] [IsScalarTower S T U]
  [IsScalarTower R S U] [IsScalarTower R T U]
variable {P : Type a} [AddCommGroup P] [Module T P] [Module k P] [IsScalarTower k T P]
variable {Q : Type b} [AddCommGroup Q] [Module T Q]
variable {L : Type c} [AddCommGroup L] [Module U L] [Module k L] [IsScalarTower k U L]
variable {N : Type d} [AddCommGroup N] [Module U N]
variable {Δ : TwoForms k T P Q} {Ξ : TwoForms k U L N}

-- test: AffineTripleTests.triple_generators
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (u : U) (t : T) (s : S) (x : X.1) :
    ((AffineCategory.pullbackTripleOuterIso p n m).hom.app X).1
        (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) = (s • (t • u)) ⊗ₜ[R] x ∧
    ((AffineCategory.pullbackTripleInnerIso p n m).hom.app X).1
        (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) = ((s • t) • u) ⊗ₜ[R] x ∧
    (s • (t • u)) ⊗ₜ[R] x = ((s • t) • u) ⊗ₜ[R] x := by
  sorry

-- test: AffineTripleTests.triple_operator
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] X.1))) :
    ((AffineCategory.pullbackTriple p n m).obj X).2.toAddHom x =
      (((X.2.affinePullback m).affinePullback n).affinePullback p).toAddHom x := by
  sorry

-- test: AffineTripleTests.triple_arrows
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') (u : U) (t : T) (s : S) (x : X.1) :
    ((AffineCategory.pullbackTriple p n m).map f).1
        (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) =
      u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] f.1 x)) := by
  sorry

-- test: AffineTripleTests.outer_inverse
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] X.1))) :
    ((AffineCategory.pullbackTripleOuterIso p n m).inv.app X).1
      (((AffineCategory.pullbackTripleOuterIso p n m).hom.app X).1 x) = x := by
  sorry

-- test: AffineTripleTests.inner_inverse
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X : AffineCategory Ω lam)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] X.1))) :
    ((AffineCategory.pullbackTripleInnerIso p n m).inv.app X).1
      (((AffineCategory.pullbackTripleInnerIso p n m).hom.app X).1 x) = x := by
  sorry

-- test: AffineTripleTests.naturality
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) {X X' : AffineCategory Ω lam}
    (f : X ⟶ X') :
    (AffineCategory.pullbackTriple p n m).map f ≫
        (AffineCategory.pullbackTripleOuterIso p n m).hom.app X' =
      (AffineCategory.pullbackTripleOuterIso p n m).hom.app X ≫
        (AffineCategory.pullback ((p.towerComp n).towerComp m)).map f ∧
    (AffineCategory.pullbackTriple p n m).map f ≫
        (AffineCategory.pullbackTripleInnerIso p n m).hom.app X' =
      (AffineCategory.pullbackTripleInnerIso p n m).hom.app X ≫
        (AffineCategory.pullback (p.towerComp (n.towerComp m))).map f := by
  sorry

-- test: AffineTripleTests.coherence
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).hom =
      (AffineCategory.pullbackTripleInnerIso p n m).hom ∧
    (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).inv =
      (AffineCategory.pullbackTripleInnerIso p n m).inv ∧
    AffineCategory.pullbackTripleOuterIso (lam := lam) p n m =
      AffineCategory.pullbackTripleInnerIso p n m := by
  sorry

-- test: AffineTripleTests.nonreduced
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let m := TwoForms.Morphism.refl Ω
      let X := 𝟙_ (AffineCategory Ω (0 : ZMod 4))
      let x := (1 : ZMod 4) ⊗ₜ[ZMod 4] ((1 : ZMod 4) ⊗ₜ[ZMod 4]
        ((1 : ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)))
      let v := TensorProduct.lid (ZMod 4) (ZMod 4)
        (((AffineCategory.pullbackTripleOuterIso m m m).hom.app X).1 x)
      let w := TensorProduct.lid (ZMod 4) (ZMod 4)
        (((AffineCategory.pullbackTripleInnerIso m m m).hom.app X).1 x)
      v = 2 ∧ v ≠ 0 ∧ v * v = 0 ∧ v = w := by
  sorry

-- test: AffineTripleTests.zero_ring
example :
    ∃ Ω : TwoForms (ZMod 1) (ZMod 1) (ZMod 1) (Fin 0 → ZMod 1),
      let m := TwoForms.Morphism.refl Ω
      let X := 𝟙_ (AffineCategory Ω (0 : ZMod 1))
      ((AffineCategory.pullbackTripleOuterIso m m m).hom.app X).1
        ((0 : ZMod 1) ⊗ₜ[ZMod 1] ((0 : ZMod 1) ⊗ₜ[ZMod 1]
          ((0 : ZMod 1) ⊗ₜ[ZMod 1] (0 : ZMod 1)))) = 0 ∧
      AffineCategory.pullbackTripleOuterIso (lam := (0 : ZMod 1)) m m m =
        AffineCategory.pullbackTripleInnerIso m m m := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic
