/-
This file is not the roadmap and is not exhaustive. The definitive document is
research/blueprint/readmes/HodgeStructuresPartII.md. These statements suggest Lean
forms so that contributors and reviewers converge on names and signatures.
Partial continuation for DESIGN-HodgeStructuresPartII, issue #3371.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
AUGMENTATION GENERATOR CONTINUATION: all suggested declaration, API and test
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
    Module.Dual R Q →ₗ[R] Module.End R E := {
  toFun v := (TensorProduct.rid R E).toLinearMap.comp
    ((TensorProduct.map (LinearMap.id : E →ₗ[R] E) v).comp θ)
  map_add' v w := by
    ext e
    simp [TensorProduct.map_add_right]
  map_smul' r v := by
    ext e
    simp [TensorProduct.map_smul_right]
}
theorem affineContractions_apply (θ : E →ₗ[R] E ⊗[R] Q)
    (v : Module.Dual R Q) (e : E) :
    affineContractions θ v e = TensorProduct.rid R E
      (TensorProduct.map (LinearMap.id : E →ₗ[R] E) v (θ e)) := by rfl
theorem affineContractions_zero :
    affineContractions (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by ext v e; simp [affineContractions]
theorem affineContractions_add (θ η : E →ₗ[R] E ⊗[R] Q) :
    affineContractions (θ + η) = affineContractions θ + affineContractions η := by ext v e; simp [affineContractions]
-- test: TwistedHiggsBundle.affineContractions.test_zero
example (v : Module.Dual R Q) (e : E) :
    affineContractions (0 : E →ₗ[R] E ⊗[R] Q) v e = 0 := by rw [affineContractions_zero]; rfl
-- test: TwistedHiggsBundle.affineContractions.test_line
example (e : R) :
    affineContractions ((TensorProduct.rid R R).symm.toLinearMap)
      (LinearMap.id : Module.Dual R R) e = e := by simp [affineContractions, TensorProduct.map_id]
-- test: TwistedHiggsBundle.affineContractions.test_zero_dual
example (θ : E →ₗ[R] E ⊗[R] Q) :
    affineContractions θ (0 : Module.Dual R Q) = 0 := by simp [affineContractions]
-- node: HodgeStructuresPartII:H.0/affine-contractions-reconstruction
theorem affineContractions_reconstruct {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) (e : E) :
    θ e = ∑ i, affineContractions θ (b.coord i) e ⊗ₜ[R] b i := by
  have h : ∀ t : E ⊗[R] Q, t = ∑ i,
      TensorProduct.rid R E
        (TensorProduct.map (LinearMap.id : E →ₗ[R] E) (b.coord i) t) ⊗ₜ[R] b i := by
    intro t
    induction t using TensorProduct.induction_on with
    | zero => simp
    | tmul x q =>
      simp only [TensorProduct.map_tmul, LinearMap.id_apply, TensorProduct.rid_tmul,
        Module.Basis.coord_apply]
      simp_rw [TensorProduct.smul_tmul]
      rw [← TensorProduct.tmul_sum, b.sum_repr]
    | add t u ht hu =>
      simp only [map_add, TensorProduct.add_tmul, Finset.sum_add_distrib]
      rw [← ht, ← hu]
  exact h (θ e)

-- node: HodgeStructuresPartII:H.0/affine-ordered-square
noncomputable def affineOrderedSquare (θ : E →ₗ[R] E ⊗[R] Q) :
    E →ₗ[R] E ⊗[R] (Q ⊗[R] Q) :=
  (TensorProduct.assoc R E Q Q).toLinearMap.comp
    ((TensorProduct.map θ (LinearMap.id : Q →ₗ[R] Q)).comp θ)

theorem affineOrderedSquare_apply (θ : E →ₗ[R] E ⊗[R] Q) (e : E) :
    affineOrderedSquare θ e = TensorProduct.assoc R E Q Q
      (TensorProduct.map θ (LinearMap.id : Q →ₗ[R] Q) (θ e)) := rfl

theorem affineOrderedSquare_zero :
    affineOrderedSquare (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by
  ext e
  simp [affineOrderedSquare]

-- node: HodgeStructuresPartII:H.0/affine-ordered-square-contraction
theorem affineOrderedSquare_contraction (θ : E →ₗ[R] E ⊗[R] Q)
    (v w : Module.Dual R Q) :
    affineContractions (affineOrderedSquare θ)
      ((TensorProduct.lid R R).toLinearMap.comp (TensorProduct.map v w)) =
    affineContractions θ v * affineContractions θ w := by
  ext e
  have h : ∀ t : E ⊗[R] Q,
      TensorProduct.rid R E
        (TensorProduct.map (LinearMap.id : E →ₗ[R] E)
          ((TensorProduct.lid R R).toLinearMap.comp (TensorProduct.map v w))
          (TensorProduct.assoc R E Q Q
            (TensorProduct.map θ (LinearMap.id : Q →ₗ[R] Q) t))) =
      affineContractions θ v (TensorProduct.rid R E
        (TensorProduct.map (LinearMap.id : E →ₗ[R] E) w t)) := by
    intro t
    induction t using TensorProduct.induction_on with
    | zero => simp
    | tmul x q =>
      have hs : ∀ s : E ⊗[R] Q,
          TensorProduct.rid R E
            (TensorProduct.map (LinearMap.id : E →ₗ[R] E)
              ((TensorProduct.lid R R).toLinearMap.comp (TensorProduct.map v w))
              (TensorProduct.assoc R E Q Q (s ⊗ₜ[R] q))) =
          w q • TensorProduct.rid R E
            (TensorProduct.map (LinearMap.id : E →ₗ[R] E) v s) := by
        intro s
        induction s using TensorProduct.induction_on with
        | zero => simp
        | tmul y p =>
          simp only [TensorProduct.assoc_tmul, TensorProduct.map_tmul, LinearMap.id_apply,
            LinearMap.comp_apply, LinearEquiv.coe_coe, TensorProduct.lid_tmul,
            TensorProduct.rid_tmul]
          rw [smul_eq_mul, mul_smul]
          exact smul_comm (v p) (w q) y
        | add s t hs ht => simp only [TensorProduct.add_tmul, map_add, smul_add]; rw [hs, ht]
      simp only [TensorProduct.map_tmul, LinearMap.id_apply, TensorProduct.rid_tmul]
      rw [hs]
      simp [affineContractions]
    | add t u ht hu => simp only [map_add]; rw [ht, hu]
  exact h (θ e)

-- node: HodgeStructuresPartII:H.0/affine-ordered-square-vanishing
theorem affineOrderedSquare_eq_zero_iff {I : Type*} [Fintype I]
    (b : Module.Basis I R Q) (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedSquare θ = 0 ↔
      ∀ i j, affineContractions θ (b.coord i) * affineContractions θ (b.coord j) = 0 := by
  constructor
  · intro h i j
    rw [← affineOrderedSquare_contraction, h, affineContractions_zero]
    rfl
  · intro h
    ext e
    rw [affineOrderedSquare_apply, affineContractions_reconstruct b θ e]
    simp only [map_sum, TensorProduct.map_tmul, LinearMap.id_apply]
    have hi : ∀ j,
        TensorProduct.assoc R E Q Q
          (θ (affineContractions θ (b.coord j) e) ⊗ₜ[R] b j) = 0 := by
      intro j
      rw [affineContractions_reconstruct b θ (affineContractions θ (b.coord j) e)]
      simp only [TensorProduct.sum_tmul, map_sum, TensorProduct.assoc_tmul]
      apply Finset.sum_eq_zero
      intro i _
      have hij := LinearMap.congr_fun (h i j) e
      change affineContractions θ (b.coord i) (affineContractions θ (b.coord j) e) = 0 at hij
      rw [hij, TensorProduct.zero_tmul]
    simpa using Finset.sum_eq_zero (fun j _ => hi j)

-- test: TwistedHiggsBundle.affineOrderedSquare.test_zero
example : affineOrderedSquare (0 : E →ₗ[R] E ⊗[R] Q) = 0 := by
  exact affineOrderedSquare_zero

-- test: TwistedHiggsBundle.affineOrderedSquare.test_line_nonzero
example [Nontrivial R] :
    affineOrderedSquare ((TensorProduct.rid R R).symm.toLinearMap) ≠ 0 := by
  intro h
  have hc := affineOrderedSquare_contraction
    ((TensorProduct.rid R R).symm.toLinearMap)
    (LinearMap.id : Module.Dual R R) (LinearMap.id : Module.Dual R R)
  rw [h, affineContractions_zero] at hc
  have he := LinearMap.congr_fun hc (1 : R)
  simp [affineContractions, TensorProduct.map_id] at he

-- test: TwistedHiggsBundle.affineOrderedSquare.test_empty_coefficients
example [Subsingleton Q] (θ : E →ₗ[R] E ⊗[R] Q) :
    affineOrderedSquare θ = 0 := by
  ext e
  exact Subsingleton.elim _ _

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
      affineContractions θ w * affineContractions θ v := by
  dsimp only
  rw [affineOrderedSquare_contraction]
  intro h
  have he := congrArg (fun f : Module.End ℚ (Fin 2 → ℚ) => f (Pi.single 0 1) 0) h
  norm_num [affineContractions, TensorProduct.mk, Matrix.toLin'_apply,
    Matrix.mulVec, dotProduct, Fin.sum_univ_two, Pi.single_apply] at he

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
