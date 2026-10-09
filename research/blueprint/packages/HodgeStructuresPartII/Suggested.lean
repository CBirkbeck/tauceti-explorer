/-
This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest Lean forms so contributors and reviewers converge on
names and signatures. Admitted bodies claim no implementation.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Fibre, affine and coordinate-chart declarations are distinguished from global
variations, moduli spaces and analytic correspondences. Where an imported
geometric interface cannot be expressed, its mathematical target remains in
README.md. An inventory comment is not a typed declaration or a test.
-/

import Mathlib.LinearAlgebra.Dual.BaseChange
import Mathlib.Algebra.Algebra.Bilinear
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.LinearAlgebra.Contraction
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
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.LinearAlgebra.TensorPower.Pairing
import Mathlib.LinearAlgebra.PiTensorProduct.Basis
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Data.Finset.Sort
import Mathlib.Data.Finset.Powerset
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Analysis.Complex.Basic
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.Geometry.Hodge.Polarization
import TauCeti.Geometry.Hodge.Mixed.Basic
import TauCeti.Geometry.Hodge.Mixed.Morphism
import TauCeti.Geometry.Hodge.Mixed.Strictness
import Mathlib.RepresentationTheory.Invariants
import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import TauCeti.Geometry.Hodge.PeriodDomain
import TauCeti.LinearAlgebra.BilinearForm.Isometry
import Mathlib.RingTheory.Grassmannian
import Mathlib.Algebra.Lie.OfAssociative
import Mathlib.Analysis.Normed.Algebra.Exponential
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.RepresentationTheory.Subrepresentation
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Length
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.Algebra.Lie.Classical
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.ZariskisMainTheorem
import Mathlib.Analysis.CStarAlgebra.Matrix
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Functoriality
import Mathlib.Topology.Instances.Matrix
import Mathlib.Analysis.Normed.Algebra.MatrixExponential
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Algebra.DirectSum.Basic
import Mathlib.RingTheory.Nilpotent.Exp
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.ModelTheory.Definability
import Mathlib.Topology.NoetherianSpace
import Mathlib.AlgebraicGeometry.Noetherian
import TauCeti.Geometry.Hodge.HodgeForm
import TauCeti.Geometry.Hodge.Structure
import TauCeti.Geometry.Hodge.Conjugation
import Mathlib.Algebra.Module.ZLattice.Basic
import Mathlib.Analysis.Calculus.Implicit
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.FDeriv
import Mathlib.Geometry.Convex.Cone.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.Analysis.Analytic.Uniqueness

/-! Shared native representation adapter used by H.1 and H.5. -/
namespace TauCeti.NonabelianHodge
variable {Γ : Type*} [Group Γ] {K : Type*} [Field K] {r : ℕ}
/-- Convert the native general-linear matrix homomorphism to its linear action. -/
def matrixRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (Fin r → K) :=
  (Units.coeHom _).comp
    ((Matrix.GeneralLinearGroup.toLin (n := Fin r) (R := K)).toMonoidHom.comp ρ)
end TauCeti.NonabelianHodge

/-! ## H.0 original design -/

section Layer0

-- The authenticated incoming imports supply the native category and tensor APIs.

-- Actual native monoidal composition and monoidal natural-transformation interfaces.

-- Identity and tower coherence reuse the inherited exact Mathlib imports.


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
theorem Frame.ext (F G : Frame k R d lam)
    (h : ∀ i, F.delta i = G.delta i) : F = G := sorry
-- test: Frame.test_variable_parameter
example : ¬ ∃ F : Frame ℚ (MvPolynomial (Fin 1) ℚ) 1 (MvPolynomial.X 0),
    F.delta 0 = MvPolynomial.pderiv 0 := sorry
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

-- Local definition under a fixed E; global finite local freeness is in the specification.
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
operator tests. Global sheaf signatures still need the CR.1/E1/DD.1
comparisons. Native SheafOfModules.tensorProduct, its unitors, symmetry,
associator and over-site restriction already exist in Tau Ceti. General
scheme bundle operations belong to AlgebraicVectorBundles L0A--L0C.
The remaining omissions concern the differential, finite-dual/exterior,
subquotient and filtered-coefficient interfaces and their operator comparisons.
Each name below is the specification name; the statement is its intended signature.
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
test omitted: LambdaBundle.test_affine_unit — For a field k, on A¹_k the ordinary differential (O,d) is a nonzero rank-one flat connection; at λ=0 the field θ=dx is an integrable rank-one Higgs object.
test omitted: LambdaBundle.test_parameter_unit — D=λd for constant λ is flat, with λ=1 giving d and λ=0 giving the zero Higgs field.
test omitted: LambdaBundle.test_noncommuting — On A²_Q, E12dx+E21dy does not define a LambdaBundle at λ=0.
test omitted: LambdaBundle.test_zero_module — The zero sheaf with its unique operator is admitted, with local rank zero.

Additional reserved-key sample criteria.
These reuse the named supplying nodes; the global carriers are still omitted.
API signature omitted: LambdaBundle.test_criterion_nilpotence — On A¹_Q the Higgs line θ=dx is integrable and satisfies θ^[N](1)=1⊗dx^⊗N≠0 for each N>0. Integrability is not ordered tensor nilpotence.
API signature omitted: LambdaBundle.rescale_equiv — For invertible λ with dλ=0, λ⁻¹D is an ordinary integrable connection. Scaling by λ and λ⁻¹ are inverse functors; supplied by H.0/intrinsic-rescale.
API signature omitted: LambdaBundle.tensor_leibniz — Same-λ tensor uses D_E⊗1+1⊗D_F and has scalar correction λ(e⊗f)⊗da, with one λ; supplied by H.0/intrinsic-tensor.
API signature omitted: LambdaBundle.dual_eval — (D∨φ)(e)=λd(φ(e))−φ(D(e)); for dλ=0 the dual is integrable, supplied by H.0/intrinsic-dual and H.0/dual-curvature.
API signature omitted: LambdaBundle.pullback_apply — For a differential-site morphism with compatible exterior map, D_Y(b⊗e)=λ_Y e⊗d_Yb+b df(D_Xe), and integrability is preserved; supplied by H.0/intrinsic-pullback.
API signature omitted: GriffithsFiltration.gradedHiggs_linear — For a flat ordinary bundle with the bounded Griffiths filtration of H.0/griffiths-filtration, θ_p([e])=[∇e] is O-linear and its exterior square is zero; supplied by H.0/graded-higgs and H.0/graded-higgs-integrable.
test omitted: LambdaBundle.test_integrable_not_nilpotent — On A¹_Q the Higgs line θ=dx is integrable, but θ^[N](1)=1⊗dx^⊗N≠0 for every N>0.
test omitted: LambdaBundle.test_rescale_two — On Q[x], λ=2 and D=2d give a flat bundle; λ⁻¹D=d and evaluates x to dx.
test omitted: LambdaBundle.test_same_parameter_tensor — On Q[x], tensoring the two unit λ=2 flat lines gives the unit λ=2 line, whose operator on x is 2dx, not 4dx.
test omitted: LambdaBundle.test_dual_pullback — The Higgs line dx over Q[x] has dual field −dx. Along x=y², the original pulls back to 2y dy and its dual pulls back to −2y dy; both are integrable Higgs lines.
test omitted: LambdaBundle.test_graded_higgs — On Q[x], ∇=d+E21dx on O² with F¹=Oe₁, F⁰=O² and zero F² gives θ([e₁])=[e₂]dx, θ([e₂])=0. The graded Higgs field is integrable and has ordered bound 2.
test omitted: LambdaBundle.test_locally_varying_rank — On the discrete space N with constant ring Q, zero differential calculus and λ=0, the sheaf with stalk Q^n at n and zero Higgs operator is finite locally free and integrable. It has no finite cover by free constant-rank charts because its ranks are unbounded.

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
theorem symmetricProjection_charTwo_tensor_counterexample :
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

/-- The quotient's monomial basis (1,x,y,xy), presented by native coordinates.
This is a concrete example fixture, not a new module or Higgs carrier. -/
def charTwoField :
    (Fin 2 × Fin 2 → ZMod 2) →ₗ[ZMod 2]
      (Fin 2 × Fin 2 → ZMod 2) ⊗[ZMod 2] (Fin 2 → ZMod 2) :=
  ((TensorProduct.mk (ZMod 2) _ _).flip (Pi.single 0 1)).comp
      (Matrix.toLin' charTwoShiftX) +
    ((TensorProduct.mk (ZMod 2) _ _).flip (Pi.single 1 1)).comp
      (Matrix.toLin' charTwoShiftY)

/-- The symmetric image of a two-slot coefficient tensor, using native multiplication.
Its image lies in degree two of the existing symmetric algebra. -/
def charTwoSymmetricPair :
    (Fin 2 → ZMod 2) ⊗[ZMod 2] (Fin 2 → ZMod 2) →ₗ[ZMod 2]
      SymmetricAlgebra (ZMod 2) (Fin 2 → ZMod 2) :=
  (LinearMap.mul' (ZMod 2) (SymmetricAlgebra (ZMod 2) (Fin 2 → ZMod 2))).comp
    (TensorProduct.map (SymmetricAlgebra.ι (ZMod 2) (Fin 2 → ZMod 2))
      (SymmetricAlgebra.ι (ZMod 2) (Fin 2 → ZMod 2)))

-- node: HodgeStructuresPartII:H.0/symmetric-projection-counterexample
theorem symmetricProjection_charTwo_counterexample :
    (∀ v w : Module.Dual (ZMod 2) (Fin 2 → ZMod 2),
      Commute (affineContractions charTwoField v) (affineContractions charTwoField w)) ∧
    affineOrderedSquare charTwoField (Pi.single (0, 0) 1) =
      (Pi.single (1, 1) 1) ⊗ₜ[ZMod 2]
        ((Pi.single 0 1) ⊗ₜ[ZMod 2] (Pi.single 1 1) +
          (Pi.single 1 1) ⊗ₜ[ZMod 2] (Pi.single 0 1)) ∧
    affineOrderedSquare charTwoField ≠ 0 ∧
    (TensorProduct.map
      (LinearMap.id : (Fin 2 × Fin 2 → ZMod 2) →ₗ[ZMod 2] (Fin 2 × Fin 2 → ZMod 2))
      charTwoSymmetricPair).comp (affineOrderedSquare charTwoField) = 0 ∧
    affineOrderedIterate charTwoField 2 ≠ 0 ∧
    affineOrderedIterate charTwoField 3 = 0 := sorry

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

-- test: TwistedHiggsBundle.affineOrderedIterate.test_scaled_chart
example (n : ℕ) :
    let θ := (TensorProduct.rid ℚ ℚ).symm.toLinearMap
    let ψ := (2 : ℚ) • θ
    let f := (3 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    let u := (2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    ψ.comp f = (TensorProduct.map f u).comp θ ∧
      ψ ≠ θ ∧ affineOrderedIterate θ n ≠ 0 ∧ affineOrderedIterate ψ n ≠ 0 := sorry

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

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 200000
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

lemma AffineCategory.pullbackParameterChangeIso_isMonoidal (h : lam = mu)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackParameterChangeIso h m).hom := by
  sorry

attribute [instance] AffineCategory.pullbackParameterChangeIso_isMonoidal

lemma AffineCategory.pullbackParameterChangeIso_inv_isMonoidal (h : lam = mu)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackParameterChangeIso h m).inv := by
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

@[instance_reducible]
def AffineCategory.pullbackTripleMonoidal (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (AffineCategory.pullbackTriple (lam := lam) p n m).Monoidal :=
  inferInstanceAs ((AffineCategory.pullback m ⋙ AffineCategory.pullback n ⋙
    AffineCategory.pullback p ⋙ AffineCategory.parameterChange
      ((congrArg (algebraMap T U) (IsScalarTower.algebraMap_apply R S T lam).symm).trans
        (IsScalarTower.algebraMap_apply R T U lam).symm)).Monoidal)

attribute [instance] AffineCategory.pullbackTripleMonoidal

omit [Algebra S U] [IsScalarTower S T U] [IsScalarTower R S U] in
lemma AffineCategory.pullbackTripleMonoidal_unit
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (Functor.LaxMonoidal.ε (AffineCategory.pullbackTriple (lam := lam) p n m)).1 =
      (((TensorProduct.AlgebraTensorModule.rid R S S).symm.toLinearMap.baseChange T).baseChange U).comp
        (((TensorProduct.AlgebraTensorModule.rid S T T).symm.toLinearMap.baseChange U).comp
          (TensorProduct.AlgebraTensorModule.rid T U U).symm.toLinearMap) := by
  sorry

omit [Algebra S U] [IsScalarTower S T U] [IsScalarTower R S U] in
lemma AffineCategory.pullbackTripleMonoidal_tensor
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    (Functor.LaxMonoidal.μ (AffineCategory.pullbackTriple p n m) X Y).1 =
      (((TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).symm.toLinearMap.baseChange T).baseChange U).comp
        (((TensorProduct.AlgebraTensorModule.distribBaseChange S T (S ⊗[R] X.1)
          (S ⊗[R] Y.1)).symm.toLinearMap.baseChange U).comp
          (TensorProduct.AlgebraTensorModule.distribBaseChange T U (T ⊗[S] (S ⊗[R] X.1))
            (T ⊗[S] (S ⊗[R] Y.1))).symm.toLinearMap) := by
  sorry

omit [Algebra S U] [IsScalarTower S T U] [IsScalarTower R S U] in
lemma AffineCategory.pullbackTripleMonoidal_cotensor
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    (Functor.OplaxMonoidal.δ (AffineCategory.pullbackTriple p n m) X Y).1 =
      (TensorProduct.AlgebraTensorModule.distribBaseChange T U (T ⊗[S] (S ⊗[R] X.1))
        (T ⊗[S] (S ⊗[R] Y.1))).toLinearMap.comp
        (((TensorProduct.AlgebraTensorModule.distribBaseChange S T (S ⊗[R] X.1)
          (S ⊗[R] Y.1)).toLinearMap.baseChange U).comp
          (((TensorProduct.AlgebraTensorModule.distribBaseChange R S X.1 Y.1).toLinearMap.baseChange T).baseChange U)) := by
  sorry

omit [Algebra S U] [IsScalarTower S T U] [IsScalarTower R S U] in
lemma AffineCategory.pullbackTripleMonoidal_counit
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    (Functor.OplaxMonoidal.η (AffineCategory.pullbackTriple (lam := lam) p n m)).1 =
      (TensorProduct.AlgebraTensorModule.rid T U U).toLinearMap.comp
        (((TensorProduct.AlgebraTensorModule.rid S T T).toLinearMap.baseChange U).comp
          (((TensorProduct.AlgebraTensorModule.rid R S S).toLinearMap.baseChange T).baseChange U)) := by
  sorry

lemma AffineCategory.pullbackTripleOuterIso_unit
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    Functor.LaxMonoidal.ε (AffineCategory.pullbackTriple (lam := lam) p n m) ≫
      (AffineCategory.pullbackTripleOuterIso p n m).hom.app (𝟙_ (AffineCategory Ω lam)) =
      Functor.LaxMonoidal.ε (AffineCategory.pullback ((p.towerComp n).towerComp m)) := by
  sorry

lemma AffineCategory.pullbackTripleOuterIso_tensor
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam) :
    Functor.LaxMonoidal.μ (AffineCategory.pullbackTriple p n m) X Y ≫
      (AffineCategory.pullbackTripleOuterIso p n m).hom.app (X ⊗ Y) =
      ((AffineCategory.pullbackTripleOuterIso p n m).hom.app X ⊗ₘ
        (AffineCategory.pullbackTripleOuterIso p n m).hom.app Y) ≫
        Functor.LaxMonoidal.μ (AffineCategory.pullback ((p.towerComp n).towerComp m)) X Y := by
  sorry

lemma AffineCategory.pullbackTripleOuterIso_isMonoidal
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).hom := by
  sorry

attribute [instance] AffineCategory.pullbackTripleOuterIso_isMonoidal

lemma AffineCategory.pullbackTripleOuterIso_inv_isMonoidal
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).inv := by
  sorry

lemma AffineCategory.pullbackTripleInnerIso_isMonoidal
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleInnerIso (lam := lam) p n m).hom := by
  sorry

attribute [instance] AffineCategory.pullbackTripleInnerIso_isMonoidal

lemma AffineCategory.pullbackTripleInnerIso_inv_isMonoidal
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleInnerIso (lam := lam) p n m).inv := by
  sorry

omit [Algebra S U] [IsScalarTower S T U] [IsScalarTower R S U] in
lemma AffineCategory.pullbackTripleMonoidal_tensor_tmul (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (u v : U) (t r : T) (s q : S) (x : X.1) (y : Y.1) :
    (Functor.LaxMonoidal.μ (AffineCategory.pullbackTriple p n m) X Y).1
      ((u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) ⊗ₜ[U]
        (v ⊗ₜ[T] (r ⊗ₜ[S] (q ⊗ₜ[R] y)))) =
      (u * v) ⊗ₜ[T] ((t * r) ⊗ₜ[S] ((s * q) ⊗ₜ[R] (x ⊗ₜ[R] y))) := by
  sorry

omit [Algebra S U] [IsScalarTower S T U] [IsScalarTower R S U] in
lemma AffineCategory.pullbackTripleMonoidal_cotensor_tmul (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (u : U) (t : T) (s : S) (x : X.1) (y : Y.1) :
    (Functor.OplaxMonoidal.δ (AffineCategory.pullbackTriple p n m) X Y).1
      (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] (x ⊗ₜ[R] y)))) =
      (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) ⊗ₜ[U]
        ((1 : U) ⊗ₜ[T] ((1 : T) ⊗ₜ[S] ((1 : S) ⊗ₜ[R] y))) := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option maxHeartbeats 200000
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

-- test: AffineTripleMonoidalTests.unit_value
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (u : U) :
    (Functor.LaxMonoidal.ε (AffineCategory.pullbackTriple (lam := lam) p n m)).1 u =
      u ⊗ₜ[T] ((1 : T) ⊗ₜ[S] ((1 : S) ⊗ₜ[R] (1 : R))) := by
  sorry

-- test: AffineTripleMonoidalTests.tensor_value
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (u v : U) (t r : T) (s q : S) (x : X.1) (y : Y.1) :
    (Functor.LaxMonoidal.μ (AffineCategory.pullbackTriple p n m) X Y).1
      ((u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) ⊗ₜ[U]
        (v ⊗ₜ[T] (r ⊗ₜ[S] (q ⊗ₜ[R] y)))) =
      (u * v) ⊗ₜ[T] ((t * r) ⊗ₜ[S] ((s * q) ⊗ₜ[R] (x ⊗ₜ[R] y))) := by
  sorry

-- test: AffineTripleMonoidalTests.cotensor_value
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (X Y : AffineCategory Ω lam)
    (u : U) (t : T) (s : S) (x : X.1) (y : Y.1) :
    (Functor.OplaxMonoidal.δ (AffineCategory.pullbackTriple p n m) X Y).1
      (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] (x ⊗ₜ[R] y)))) =
      (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] x))) ⊗ₜ[U]
        ((1 : U) ⊗ₜ[T] ((1 : T) ⊗ₜ[S] ((1 : S) ⊗ₜ[R] y))) := by
  sorry

-- test: AffineTripleMonoidalTests.comparisons
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) :
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).hom ∧
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleOuterIso (lam := lam) p n m).inv ∧
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleInnerIso (lam := lam) p n m).hom ∧
    NatTrans.IsMonoidal (AffineCategory.pullbackTripleInnerIso (lam := lam) p n m).inv := by
  sorry

-- test: AffineTripleMonoidalTests.nonconstant_parameter
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let m := TwoForms.Morphism.refl Ω
      (Functor.LaxMonoidal.ε (AffineCategory.pullbackTriple (lam := Polynomial.X) m m m)).1
        Polynomial.X = Polynomial.X ⊗ₜ[Polynomial ℤ]
          ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] (1 : Polynomial ℤ))) ∧
      NatTrans.IsMonoidal (AffineCategory.pullbackTripleOuterIso (lam := Polynomial.X) m m m).hom := by
  sorry

-- test: AffineTripleMonoidalTests.nonreduced_tensor
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      let m := TwoForms.Morphism.refl Ω
      let X := 𝟙_ (AffineCategory Ω (2 : ZMod 4))
      let a := (1 : ZMod 4) ⊗ₜ[ZMod 4] ((1 : ZMod 4) ⊗ₜ[ZMod 4]
        ((1 : ZMod 4) ⊗ₜ[ZMod 4] (2 : ZMod 4)))
      let b := (1 : ZMod 4) ⊗ₜ[ZMod 4] ((1 : ZMod 4) ⊗ₜ[ZMod 4]
        ((1 : ZMod 4) ⊗ₜ[ZMod 4] (1 : ZMod 4)))
      let value := TensorProduct.lid (ZMod 4) (ZMod 4)
        (TensorProduct.lid (ZMod 4) (ZMod 4 ⊗[ZMod 4] ZMod 4)
          (((AffineCategory.pullbackTripleOuterIso m m m).hom.app (X ⊗ X)).1
            ((Functor.LaxMonoidal.μ (AffineCategory.pullbackTriple m m m) X X).1 (a ⊗ₜ[ZMod 4] b))))
      value = 2 ∧ value ≠ 0 ∧ value * value = 0 := by
  sorry

-- test: AffineTripleMonoidalTests.zero_ring
example :
    ∃ Ω : TwoForms (ZMod 1) (ZMod 1) (ZMod 1) (Fin 0 → ZMod 1),
      let m := TwoForms.Morphism.refl Ω
      (Functor.LaxMonoidal.ε (AffineCategory.pullbackTriple (lam := (0 : ZMod 1)) m m m)).1 0 = 0 ∧
      (Functor.OplaxMonoidal.η (AffineCategory.pullbackTriple (lam := (0 : ZMod 1)) m m m)).1 0 = 0 := by
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
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {Ω : TwoForms k R W Z} {lam : R}

def Preconnection.dualPair (D : Preconnection Ω lam E) :
    Module.Dual R E →+ (E →ₗ[R] W) where
  toFun f :=
    { toFun := fun e => lam • Ω.d0 (f e) -
        TensorProduct.lid R W (TensorProduct.map f LinearMap.id (D.toAddHom e))
      map_add' := by intros; simp [smul_add]; abel
      map_smul' := by
        intro a e
        simp only [map_smul, smul_eq_mul, Derivation.leibniz, D.leibniz, map_add,
          TensorProduct.map_tmul, LinearMap.id_apply, TensorProduct.lid_tmul,
          smul_add, smul_sub, smul_smul]
        simp only [mul_comm lam a]
        abel }
  map_zero' := by ext e; simp
  map_add' := by
    intro f g
    ext e
    simp only [LinearMap.coe_mk, AddHom.coe_mk, LinearMap.add_apply, map_add, smul_add,
      TensorProduct.map_add_left]
    abel

lemma Preconnection.dualPair_apply (D : Preconnection Ω lam E) (f : Module.Dual R E) (e : E) :
    D.dualPair f e = lam • Ω.d0 (f e) -
      TensorProduct.lid R W (TensorProduct.map f LinearMap.id (D.toAddHom e)) := by
  sorry

lemma Preconnection.dualPair_smul (D : Preconnection Ω lam E) (a : R) (f : Module.Dual R E) :
    D.dualPair (a • f) = a • D.dualPair f + lam • f.smulRight (Ω.d0 a) := by
  sorry

lemma Preconnection.dualPair_zero_parameter (D : Preconnection Ω 0 E)
    (f : Module.Dual R E) (e : E) :
    D.dualPair f e = -TensorProduct.lid R W
      (TensorProduct.map f LinearMap.id (D.toAddHom e)) := by
  sorry

variable [Module.Finite R E] [Module.Projective R E]

def Preconnection.affineDual (D : Preconnection Ω lam E) :
    Preconnection Ω lam (Module.Dual R E) where
  toAddHom := (dualTensorHomEquiv R E W).symm.toLinearMap.toAddMonoidHom.comp D.dualPair
  leibniz a f := by
    apply (dualTensorHomEquiv R E W).injective
    change (dualTensorHomEquiv R E W)
      ((dualTensorHomEquiv R E W).symm (D.dualPair (a • f))) = _
    rw [LinearEquiv.apply_symm_apply, D.dualPair_smul]
    ext e
    simp

lemma Preconnection.affineDual_eval (D : Preconnection Ω lam E) (f : Module.Dual R E) (e : E) :
    dualTensorHom R E W (D.affineDual.toAddHom f) e = lam • Ω.d0 (f e) -
      TensorProduct.lid R W (TensorProduct.map f LinearMap.id (D.toAddHom e)) := by
  sorry

lemma Preconnection.affineDual_unique (D : Preconnection Ω lam E)
    (C : Preconnection Ω lam (Module.Dual R E))
    (h : ∀ (f : Module.Dual R E) (e : E),
      dualTensorHom R E W (C.toAddHom f) e = lam • Ω.d0 (f e) -
        TensorProduct.lid R W (TensorProduct.map f LinearMap.id (D.toAddHom e))) :
    C = D.affineDual := by
  sorry

lemma Preconnection.affineDual_evaluation [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (x : Module.Dual R E ⊗[R] E) :
    (Preconnection.unit Ω lam).toAddHom (contractLeft R E x) =
      TensorProduct.map (contractLeft R E) LinearMap.id
        ((D.affineDual.affineTensor D).toAddHom x) := by
  sorry

lemma Preconnection.affineDual_curvature_pair [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (f : Module.Dual R E) (e : E) :
    dualTensorHom R E Z (D.affineDual.curvature f) e +
      TensorProduct.lid R Z (TensorProduct.map f LinearMap.id (D.curvature e)) =
      lam • Ω.wedge (Ω.d0 lam) (Ω.d0 (f e)) := by
  sorry

lemma Preconnection.affineDual_curvature [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (hlam : Ω.d0 lam = 0)
    (f : Module.Dual R E) (e : E) :
    dualTensorHom R E Z (D.affineDual.curvature f) e =
      -TensorProduct.lid R Z (TensorProduct.map f LinearMap.id (D.curvature e)) := by
  sorry

lemma Preconnection.affineDual_flat [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (hlam : Ω.d0 lam = 0)
    (hD : ∀ e, D.curvature e = 0) (f : Module.Dual R E) : D.affineDual.curvature f = 0 := by
  sorry

lemma Preconnection.affineDual_horizontal {F : Type*} [AddCommGroup F] [Module R F]
    [Module.Finite R F] [Module.Projective R F]
    (D : Preconnection Ω lam E) (C : Preconnection Ω lam F) (f : E →ₗ[R] F)
    (hf : ∀ e, C.toAddHom (f e) = TensorProduct.map f LinearMap.id (D.toAddHom e))
    (g : Module.Dual R F) :
    D.affineDual.toAddHom (f.dualMap g) =
      TensorProduct.map f.dualMap LinearMap.id (C.affineDual.toAddHom g) := by
  sorry

lemma Preconnection.affineDual_bidual (D : Preconnection Ω lam E) (e : E) :
    D.affineDual.affineDual.toAddHom (Module.evalEquiv R E e) =
      TensorProduct.map (Module.evalEquiv R E).toLinearMap LinearMap.id (D.toAddHom e) := by
  sorry

lemma Preconnection.affineDual_bidual_inverse [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (e : Module.Dual R (Module.Dual R E)) :
    D.toAddHom ((Module.evalEquiv R E).symm e) =
      TensorProduct.map (Module.evalEquiv R E).symm.toLinearMap LinearMap.id
        (D.affineDual.affineDual.toAddHom e) := by
  sorry

lemma Preconnection.affineDual_flat_iff [IsScalarTower k R W]
    (D : Preconnection Ω lam E) (hlam : Ω.d0 lam = 0) :
    (∀ f, D.affineDual.curvature f = 0) ↔ (∀ e, D.curvature e = 0) := by
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
variable {E : Type v} [AddCommGroup E] [Module R E]
variable {Ω : TwoForms k R W Z} {lam : R}

-- test: AffineDualTests.linear_evaluation
example (D : Preconnection Ω lam E) (f : Module.Dual R E) (a : R) (e : E) :
    D.dualPair f (a • e) = a • D.dualPair f e := by
  sorry

-- test: AffineDualTests.add_functionals
example (D : Preconnection Ω lam E) (f g : Module.Dual R E) (e : E) :
    D.dualPair (f + g) e = D.dualPair f e + D.dualPair g e := by
  sorry

-- test: AffineDualTests.zero_parameter_linear
example (D : Preconnection Ω 0 E) (a : R) (f : Module.Dual R E) :
    D.dualPair (a • f) = a • D.dualPair f := by
  sorry

variable [Module.Finite R E] [Module.Projective R E]

-- test: AffineDualTests.leibniz
example (D : Preconnection Ω lam E) (a : R) (f : Module.Dual R E) :
    D.affineDual.toAddHom (a • f) = a • D.affineDual.toAddHom f +
      lam • (f ⊗ₜ[R] Ω.d0 a) := by
  sorry

-- test: AffineDualTests.higgs_sign
example (D : Preconnection Ω 0 E) (f : Module.Dual R E) (e : E) :
    dualTensorHom R E W (D.affineDual.toAddHom f) e =
      -TensorProduct.lid R W (TensorProduct.map f LinearMap.id (D.toAddHom e)) := by
  sorry

-- test: AffineDualTests.pairing
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (f : Module.Dual R E) (e : E) :
    TensorProduct.map (contractLeft R E) LinearMap.id
      ((D.affineDual.affineTensor D).toAddHom (f ⊗ₜ[R] e)) =
      lam • ((1 : R) ⊗ₜ[R] Ω.d0 (f e)) := by
  sorry

-- test: AffineDualTests.variable_curvature_correction
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (f : Module.Dual R E) (e : E)
    (h : lam • Ω.wedge (Ω.d0 lam) (Ω.d0 (f e)) ≠ 0) :
    dualTensorHom R E Z (D.affineDual.curvature f) e ≠
      -TensorProduct.lid R Z (TensorProduct.map f LinearMap.id (D.curvature e)) := by
  sorry

-- test: AffineDualTests.bidual_roundtrip
example [IsScalarTower k R W] (D : Preconnection Ω lam E) (e : E) :
    TensorProduct.map (Module.evalEquiv R E).symm.toLinearMap LinearMap.id
      (D.affineDual.affineDual.toAddHom (Module.evalEquiv R E e)) = D.toAddHom e := by
  sorry

-- test: AffineDualTests.flat_equivalence
example [IsScalarTower k R W] (D : Preconnection Ω 0 E) :
    (∀ f, D.affineDual.curvature f = 0) ↔ (∀ e, D.curvature e = 0) := by
  sorry

-- test: AffineDualTests.nonconstant_unit
example :
    ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
      Ω.d0 Polynomial.X = 1 ∧
      let D := Preconnection.unit Ω Polynomial.X
      let f : Module.Dual (Polynomial ℤ) (Polynomial ℤ) := (Polynomial.X : Polynomial ℤ) • LinearMap.id
      D.dualPair f 1 = Polynomial.X ∧
      dualTensorHom (Polynomial ℤ) (Polynomial ℤ) (Polynomial ℤ)
        (D.affineDual.toAddHom f) 1 = Polynomial.X := by
  sorry

-- test: AffineDualTests.nonreduced_sign
example :
    ∃ Ω : TwoForms (ZMod 4) (ZMod 4) (ZMod 4) (Fin 0 → ZMod 4),
      ∃ D : Preconnection Ω 0 (ZMod 4),
        let f : Module.Dual (ZMod 4) (ZMod 4) := LinearMap.id
        D.dualPair f 1 = 1 ∧
        dualTensorHom (ZMod 4) (ZMod 4) (ZMod 4) (D.affineDual.toAddHom f) 1 = 1 ∧
        (1 : ZMod 4) ≠ 3 ∧ (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) * 2 = 0 := by
  sorry

-- test: AffineDualTests.zero_module
example (D : Preconnection Ω lam (Fin 0 → R)) (f : Module.Dual R (Fin 0 → R)) :
    D.affineDual.toAddHom f = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable [Module.Finite R E] [Module.Projective R E]

/-- The native covector scalar extension, used as the affine dual comparison. -/
def affineDualPullbackEquiv : S ⊗[R] Module.Dual R E ≃ₗ[S] Module.Dual S (S ⊗[R] E) := by
  let h := (Module.Dual.baseChange (R := R) (V := E) S).liftBaseChange S
  apply LinearEquiv.ofBijective h
  have he : ∀ x, h x = (LinearMap.liftBaseChangeEquiv S)
      (dualTensorHomEquiv R E S (TensorProduct.comm R S (Module.Dual R E) x)) := by
    intro x
    induction x using TensorProduct.induction_on with
    | zero => simp [h]
    | add x y hx hy => simp [hx, hy]
    | tmul s f =>
      apply LinearMap.ext
      intro y
      induction y using TensorProduct.induction_on with
      | zero => simp
      | add x y hx hy => simp [hx, hy]
      | tmul t e =>
        change s * ((f e) • t) = t * ((f e) • s)
        simp only [Algebra.smul_def]
        ring
  have hb := (LinearMap.liftBaseChangeEquiv S (M := E) (N := S)).bijective.comp
    ((dualTensorHomEquiv R E S).bijective.comp
      (TensorProduct.comm R S (Module.Dual R E)).bijective)
  constructor
  · intro x y hxy
    apply hb.1
    exact (he x).symm.trans (hxy.trans (he y))
  · intro y
    obtain ⟨x, hx⟩ := hb.2 y
    exact ⟨x, (he x).trans hx⟩

lemma affineDualPullbackEquiv_tmul (s : S) (f : Module.Dual R E) (x : S ⊗[R] E) :
    affineDualPullbackEquiv (s ⊗ₜ[R] f) x = s * f.baseChange S x := by
  sorry

lemma affineDualPullbackEquiv_eval (s t : S) (f : Module.Dual R E) (e : E) :
    affineDualPullbackEquiv (s ⊗ₜ[R] f) (t ⊗ₜ[R] e) =
      s * t * algebraMap R S (f e) := by
  sorry

lemma affineDualPullbackEquiv_unit (f : Module.Dual R E) :
    affineDualPullbackEquiv (1 ⊗ₜ[R] f) = f.baseChange S := by
  sorry

lemma affineDualPullbackEquiv_evaluation (x : S ⊗[R] (Module.Dual R E ⊗[R] E)) :
    contractLeft S (S ⊗[R] E)
      (TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap
        LinearMap.id (TensorProduct.AlgebraTensorModule.distribBaseChange R S
          (Module.Dual R E) E x)) =
      TensorProduct.AlgebraTensorModule.rid R S S ((contractLeft R E).baseChange S x) := by
  sorry

lemma affineDualPullbackEquiv_bidual (x : S ⊗[R] E) :
    affineDualPullbackEquiv (R := R) (S := S) (E := Module.Dual R E)
      ((Module.evalEquiv R E).toLinearMap.baseChange S x) =
      (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap.dualMap
        (Module.evalEquiv S (S ⊗[R] E) x) := by
  sorry

lemma affineDualPullbackEquiv_bidual_inverse (x : S ⊗[R] E) :
    (affineDualPullbackEquiv (R := R) (S := S) (E := E)).symm.toLinearMap.dualMap
      (affineDualPullbackEquiv (R := R) (S := S) (E := Module.Dual R E)
        ((Module.evalEquiv R E).toLinearMap.baseChange S x)) =
      Module.evalEquiv S (S ⊗[R] E) x := by
  sorry

lemma affineDualPullbackEquiv_natural
    {F : Type v} [AddCommGroup F] [Module R F] [Module.Finite R F] [Module.Projective R F]
    (h : E →ₗ[R] F) (x : S ⊗[R] Module.Dual R F) :
    affineDualPullbackEquiv (h.dualMap.baseChange S x) =
      (h.baseChange S).dualMap (affineDualPullbackEquiv x) := by
  sorry

variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {lam : R}

lemma affineDualPullbackEquiv_tensor_eval
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (x : Module.Dual R E ⊗[R] W) (e : E) :
    dualTensorHom S (S ⊗[R] E) V
      (TensorProduct.map
        ((affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap.comp scalarUnit)
        m.one x) (scalarUnit e) = m.one (dualTensorHom R E W x e) := by
  sorry

omit [Module.Finite R E] [Module.Projective R E] in
lemma affineDualPullbackEquiv_contraction
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (f : Module.Dual R E) (x : E ⊗[R] W) :
    TensorProduct.lid S V
      (TensorProduct.map (f.baseChange S) LinearMap.id (TensorProduct.map scalarUnit m.one x)) =
      m.one (TensorProduct.lid R W (TensorProduct.map f LinearMap.id x)) := by
  sorry

lemma Preconnection.affineDualPullback_unit_horizontal
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (f : Module.Dual R E) :
    (D.affinePullback m).affineDual.toAddHom (f.baseChange S) =
      TensorProduct.map
        ((affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap.comp scalarUnit)
        m.one (D.affineDual.toAddHom f) := by
  sorry

lemma Preconnection.affineDualPullback_horizontal
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : S ⊗[R] Module.Dual R E) :
    (D.affinePullback m).affineDual.toAddHom (affineDualPullbackEquiv x) =
      TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap
        LinearMap.id ((D.affineDual.affinePullback m).toAddHom x) := by
  sorry

lemma Preconnection.affineDualPullback_horizontal_inverse
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (f : Module.Dual S (S ⊗[R] E)) :
    (D.affineDual.affinePullback m).toAddHom (affineDualPullbackEquiv.symm f) =
      TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).symm.toLinearMap
        LinearMap.id ((D.affinePullback m).affineDual.toAddHom f) := by
  sorry

variable [IsScalarTower k S V]

lemma Preconnection.affineDualPullback_eq
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affineDual.affinePullback m).transport affineDualPullbackEquiv =
      (D.affinePullback m).affineDual := by
  sorry

lemma Preconnection.affineDualPullback_extend
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : (S ⊗[R] Module.Dual R E) ⊗[S] V) :
    (D.affinePullback m).affineDual.extend
      (TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap
        LinearMap.id x) =
      TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap
        LinearMap.id ((D.affineDual.affinePullback m).extend x) := by
  sorry

lemma Preconnection.affineDualPullback_curvature
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : S ⊗[R] Module.Dual R E) :
    (D.affinePullback m).affineDual.curvature (affineDualPullbackEquiv x) =
      TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap
        LinearMap.id ((D.affineDual.affinePullback m).curvature x) := by
  sorry

lemma Preconnection.affineDualPullback_flat_iff
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (∀ x, (D.affineDual.affinePullback m).curvature x = 0) ↔
      ∀ f, (D.affinePullback m).affineDual.curvature f = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe u v w z p q
variable {k R S : Type u} [CommRing k] [CommRing R] [CommRing S]
  [Algebra k R] [Algebra k S] [Algebra R S]
variable {E : Type v} [AddCommGroup E] [Module R E]
variable [Module.Finite R E] [Module.Projective R E]

-- test: AffineDualPullbackTests.two_scalars
example (s t : S) (f : Module.Dual R E) (e : E) :
    affineDualPullbackEquiv (s ⊗ₜ[R] f) (t ⊗ₜ[R] e) =
      s * t * algebraMap R S (f e) := by
  sorry

-- test: AffineDualPullbackTests.native_covector
example (f : Module.Dual R E) :
    affineDualPullbackEquiv (1 ⊗ₜ[R] f) = f.baseChange S := by
  sorry

-- test: AffineDualPullbackTests.bidual_roundtrip
example (x : S ⊗[R] E) :
    (affineDualPullbackEquiv (R := R) (S := S) (E := E)).symm.toLinearMap.dualMap
      (affineDualPullbackEquiv (R := R) (S := S) (E := Module.Dual R E)
        ((Module.evalEquiv R E).toLinearMap.baseChange S x)) =
      Module.evalEquiv S (S ⊗[R] E) x := by
  sorry

-- test: AffineDualPullbackTests.nonflat_nonreduced_coefficients
example :
    affineDualPullbackEquiv (R := ℤ) (S := ZMod 4) (E := ℤ)
      ((2 : ZMod 4) ⊗ₜ[ℤ] LinearMap.id) ((1 : ZMod 4) ⊗ₜ[ℤ] (1 : ℤ)) = 2 ∧
      (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) * 2 = 0 := by
  sorry

-- test: AffineDualPullbackTests.zero_module
example (f : Module.Dual S (S ⊗[R] (Fin 0 → R))) :
    (affineDualPullbackEquiv (R := R) (S := S) (E := Fin 0 → R)).symm f = 0 := by
  sorry

variable {W : Type w} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type z} [AddCommGroup Z] [Module R Z]
variable {V : Type p} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type q} [AddCommGroup Y] [Module S Y]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {lam : R}

-- test: AffineDualPullbackTests.inverse_operator
example (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (f : Module.Dual S (S ⊗[R] E)) :
    (D.affineDual.affinePullback m).toAddHom (affineDualPullbackEquiv.symm f) =
      TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).symm.toLinearMap
        LinearMap.id ((D.affinePullback m).affineDual.toAddHom f) := by
  sorry

-- test: AffineDualPullbackTests.pairing_diagram
example (x : S ⊗[R] (Module.Dual R E ⊗[R] E)) :
    contractLeft S (S ⊗[R] E)
      (TensorProduct.map (affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap
        LinearMap.id (TensorProduct.AlgebraTensorModule.distribBaseChange R S
          (Module.Dual R E) E x)) =
      TensorProduct.AlgebraTensorModule.rid R S S ((contractLeft R E).baseChange S x) := by
  sorry

-- test: AffineDualPullbackTests.flat_target_equivalence
example [IsScalarTower k S V] (m : TwoForms.Morphism (algebraMap R S) Ω Γ)
    (D : Preconnection Ω 0 E) :
    (∀ x, (D.affineDual.affinePullback m).curvature x = 0) ↔
      ∀ f, (D.affinePullback m).affineDual.curvature f = 0 := by
  sorry

-- test: AffineDualPullbackTests.new_polynomial_scalar
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
    ∃ m : TwoForms.Morphism (algebraMap ℤ (Polynomial ℤ)) Ω Γ,
      let D := Preconnection.unit Ω 1
      let f := affineDualPullbackEquiv (R := ℤ) (S := Polynomial ℤ) (E := ℤ)
        (Polynomial.X ⊗ₜ[ℤ] (LinearMap.id : Module.Dual ℤ ℤ))
      (∀ n, D.toAddHom n = 0) ∧
      dualTensorHom (Polynomial ℤ) ((Polynomial ℤ) ⊗[ℤ] ℤ) (Polynomial ℤ)
        ((D.affinePullback m).affineDual.toAddHom f) (1 ⊗ₜ[ℤ] (1 : ℤ)) = 1 := by
  sorry

-- test: AffineDualPullbackTests.variable_parameter
example : ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
    Ω.d0 Polynomial.X = 1 ∧
      let D := Preconnection.unit Ω Polynomial.X
      let f := affineDualPullbackEquiv (R := Polynomial ℤ) (S := Polynomial ℤ) (E := Polynomial ℤ)
        (1 ⊗ₜ[Polynomial ℤ] ((Polynomial.X : Polynomial ℤ) • LinearMap.id))
      dualTensorHom (Polynomial ℤ) ((Polynomial ℤ) ⊗[Polynomial ℤ] (Polynomial ℤ)) (Polynomial ℤ)
        ((D.affinePullback (TwoForms.Morphism.refl Ω)).affineDual.toAddHom f)
        (1 ⊗ₜ[Polynomial ℤ] (1 : Polynomial ℤ)) = Polynomial.X := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe dualTowerRing dualTowerModule
variable {R S T : Type dualTowerRing} [CommRing R] [CommRing S] [CommRing T]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
variable {E : Type dualTowerModule} [AddCommGroup E] [Module R E]
  [Module.Finite R E] [Module.Projective R E]
set_option maxHeartbeats 800000

lemma affineDualPullbackEquiv_id :
    (affineDualPullbackEquiv (R := R) (S := R) (E := E)).trans
      (Module.Dual.congr (TensorProduct.lid R E)) =
    TensorProduct.lid R (Module.Dual R E) := by
  sorry

lemma affineDualPullbackEquiv_tower_unit (f : Module.Dual R E) :
    affineDualPullbackEquiv (R := S) (S := T)
      (1 ⊗ₜ[S] affineDualPullbackEquiv (R := R) (S := S) (1 ⊗ₜ[R] f)) =
    (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap.dualMap
      (affineDualPullbackEquiv (R := R) (S := T) (1 ⊗ₜ[R] f)) := by
  sorry

lemma affineDualPullbackEquiv_tower_apply (x : T ⊗[S] (S ⊗[R] Module.Dual R E)) :
    affineDualPullbackEquiv (R := S) (S := T)
      ((affineDualPullbackEquiv (R := R) (S := S) (E := E)).toLinearMap.baseChange T x) =
    (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E).toLinearMap.dualMap
      (affineDualPullbackEquiv (R := R) (S := T)
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E) x)) := by
  sorry

lemma affineDualPullbackEquiv_tower :
    (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
      (affineDualPullbackEquiv (R := R) (S := T) (E := E)) =
    (((affineDualPullbackEquiv (R := R) (S := S) (E := E)).baseChange S T).trans
      (affineDualPullbackEquiv (R := S) (S := T) (E := S ⊗[R] E))).trans
      (Module.Dual.congr (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E)) := by
  sorry

lemma affineDualPullbackEquiv_tower_eval (t u : T) (s : S)
    (f : Module.Dual R E) (e : E) :
    ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
      (affineDualPullbackEquiv (R := R) (S := T) (E := E)))
        (t ⊗ₜ[S] (s ⊗ₜ[R] f)) (u ⊗ₜ[R] e) =
      (t * algebraMap S T s) * u * algebraMap R T (f e) := by
  sorry

universe dualTowerOne dualTowerTwo dualTowerThree dualTowerFour dualTowerFive dualTowerSix
variable {k : Type dualTowerRing} [CommRing k]
  [Algebra k R] [Algebra k S] [Algebra k T]
variable {W : Type dualTowerOne} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type dualTowerTwo} [AddCommGroup Z] [Module R Z]
variable {V : Type dualTowerThree} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type dualTowerFour} [AddCommGroup Y] [Module S Y]
variable {P : Type dualTowerFive} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type dualTowerSix} [AddCommGroup Q] [Module T Q]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}
variable [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P]
variable {lam : R}

lemma Preconnection.affineDualPullback_id_horizontal (D : Preconnection Ω lam E)
    (x : R ⊗[R] Module.Dual R E) :
    D.affineDual.toAddHom
      (Module.Dual.congr (TensorProduct.lid R E)
        (affineDualPullbackEquiv (R := R) (S := R) x)) =
      TensorProduct.map (TensorProduct.lid R (Module.Dual R E)).toLinearMap
        LinearMap.id ((D.affineDual.affinePullback (TwoForms.Morphism.refl Ω)).toAddHom x) := by
  sorry

lemma Preconnection.affineDualPullback_tower_horizontal
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] Module.Dual R E)) :
    (D.affinePullback (n.towerComp m)).affineDual.toAddHom
      (((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
        (affineDualPullbackEquiv (R := R) (S := T) (E := E))) x) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
          (affineDualPullbackEquiv (R := R) (S := T) (E := E))).toLinearMap
        LinearMap.id ((D.affineDual.affinePullbackTower n m).toAddHom x) := by
  sorry

lemma Preconnection.affineDualPullback_tower_inverse
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (f : Module.Dual T (T ⊗[R] E)) :
    (D.affineDual.affinePullbackTower n m).toAddHom
      (((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
        (affineDualPullbackEquiv (R := R) (S := T) (E := E))).symm f) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
          (affineDualPullbackEquiv (R := R) (S := T) (E := E))).symm.toLinearMap
        LinearMap.id ((D.affinePullback (n.towerComp m)).affineDual.toAddHom f) := by
  sorry

lemma Preconnection.affineDualPullback_tower_eq
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affineDual.affinePullbackTower n m).transport
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
        (affineDualPullbackEquiv (R := R) (S := T) (E := E))) =
      (D.affinePullback (n.towerComp m)).affineDual := by
  sorry

lemma Preconnection.affineDualPullback_tower_extend
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : (T ⊗[S] (S ⊗[R] Module.Dual R E)) ⊗[T] P) :
    (D.affinePullback (n.towerComp m)).affineDual.extend
      (TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
          (affineDualPullbackEquiv (R := R) (S := T) (E := E))).toLinearMap
        LinearMap.id x) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
          (affineDualPullbackEquiv (R := R) (S := T) (E := E))).toLinearMap
        LinearMap.id ((D.affineDual.affinePullbackTower n m).extend x) := by
  sorry

lemma Preconnection.affineDualPullback_tower_curvature
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] Module.Dual R E)) :
    (D.affinePullback (n.towerComp m)).affineDual.curvature
      (((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
        (affineDualPullbackEquiv (R := R) (S := T) (E := E))) x) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
          (affineDualPullbackEquiv (R := R) (S := T) (E := E))).toLinearMap
        LinearMap.id ((D.affineDual.affinePullbackTower n m).curvature x) := by
  sorry

lemma Preconnection.affineDualPullback_tower_flat_iff
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (∀ x, (D.affineDual.affinePullbackTower n m).curvature x = 0) ↔
      ∀ f, (D.affinePullback (n.towerComp m)).affineDual.curvature f = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe dualTestRing dualTestModule dualTestOne dualTestTwo dualTestThree dualTestFour dualTestFive dualTestSix
variable {R S T : Type dualTestRing} [CommRing R] [CommRing S] [CommRing T]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
variable {E : Type dualTestModule} [AddCommGroup E] [Module R E]
  [Module.Finite R E] [Module.Projective R E]

-- test: AffineDualTowerTests.identity_covector
example (x : R ⊗[R] Module.Dual R E) (e : E) :
    affineDualPullbackEquiv (R := R) (S := R) x (1 ⊗ₜ[R] e) =
      TensorProduct.lid R (Module.Dual R E) x e := by
  sorry

-- test: AffineDualTowerTests.inverse_path_roundtrip
example (x : T ⊗[S] (S ⊗[R] Module.Dual R E)) :
    ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
      (affineDualPullbackEquiv (R := R) (S := T) (E := E))).symm
      (((((affineDualPullbackEquiv (R := R) (S := S) (E := E)).baseChange S T).trans
        (affineDualPullbackEquiv (R := S) (S := T) (E := S ⊗[R] E))).trans
        (Module.Dual.congr (TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T E))) x) = x := by
  sorry

-- test: AffineDualTowerTests.three_scalars
example (t u : T) (s : S) (f : Module.Dual R E) (e : E) :
    ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
      (affineDualPullbackEquiv (R := R) (S := T) (E := E)))
      (t ⊗ₜ[S] (s ⊗ₜ[R] f)) (u ⊗ₜ[R] e) =
      (t * algebraMap S T s) * u * algebraMap R T (f e) := by
  sorry

-- test: AffineDualTowerTests.nonflat_nonreduced_tower
example :
    ((TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ (ZMod 4) (ZMod 4) (ZMod 4)
        (Module.Dual ℤ ℤ)).trans (affineDualPullbackEquiv (R := ℤ) (S := ZMod 4) (E := ℤ)))
      ((1 : ZMod 4) ⊗ₜ[ZMod 4] ((2 : ZMod 4) ⊗ₜ[ℤ] LinearMap.id))
      ((1 : ZMod 4) ⊗ₜ[ℤ] (1 : ℤ)) = 2 ∧
      (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) * 2 = 0 := by
  sorry

-- test: AffineDualTowerTests.zero_module
example (f : Module.Dual T (T ⊗[R] (Fin 0 → R))) :
    ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R (Fin 0 → R))).trans
      (affineDualPullbackEquiv (R := R) (S := T) (E := Fin 0 → R))).symm f = 0 := by
  sorry

variable {k : Type dualTestRing} [CommRing k]
  [Algebra k R] [Algebra k S] [Algebra k T]
variable {W : Type dualTestOne} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type dualTestTwo} [AddCommGroup Z] [Module R Z]
variable {V : Type dualTestThree} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type dualTestFour} [AddCommGroup Y] [Module S Y]
variable {P : Type dualTestFive} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type dualTestSix} [AddCommGroup Q] [Module T Q]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q}
variable [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P]
variable {lam : R}

-- test: AffineDualTowerTests.full_transport
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affineDual.affinePullbackTower n m).transport
      ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
        (affineDualPullbackEquiv (R := R) (S := T) (E := E))) =
      (D.affinePullback (n.towerComp m)).affineDual := by
  sorry

-- test: AffineDualTowerTests.curvature_on_all_classes
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : T ⊗[S] (S ⊗[R] Module.Dual R E)) :
    (D.affinePullback (n.towerComp m)).affineDual.curvature
      (((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
        (affineDualPullbackEquiv (R := R) (S := T) (E := E))) x) =
      TensorProduct.map
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).trans
          (affineDualPullbackEquiv (R := R) (S := T) (E := E))).toLinearMap
        LinearMap.id ((D.affineDual.affinePullbackTower n m).curvature x) := by
  sorry

-- test: AffineDualTowerTests.flat_target_equivalence
example (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω 0 E) :
    (∀ x, (D.affineDual.affinePullbackTower n m).curvature x = 0) ↔
      ∀ f, (D.affinePullback (n.towerComp m)).affineDual.curvature f = 0 := by
  sorry

-- test: AffineDualTowerTests.new_polynomial_scalar
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
    ∃ m : TwoForms.Morphism (algebraMap ℤ (Polynomial ℤ)) Ω Γ,
      let D := Preconnection.unit Ω 1
      let f := ((TensorProduct.AlgebraTensorModule.cancelBaseChange ℤ (Polynomial ℤ)
        (Polynomial ℤ) (Polynomial ℤ) (Module.Dual ℤ ℤ)).trans
          (affineDualPullbackEquiv (R := ℤ) (S := Polynomial ℤ) (E := ℤ)))
        ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ]
          (Polynomial.X ⊗ₜ[ℤ] (LinearMap.id : Module.Dual ℤ ℤ)))
      (∀ a, D.toAddHom a = 0) ∧
      dualTensorHom (Polynomial ℤ) ((Polynomial ℤ) ⊗[ℤ] ℤ) (Polynomial ℤ)
        ((D.affinePullback ((TwoForms.Morphism.refl Γ).towerComp m)).affineDual.toAddHom f)
        (1 ⊗ₜ[ℤ] (1 : ℤ)) = 1 := by
  sorry

-- test: AffineDualTowerTests.variable_parameter
example : ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
    Ω.d0 Polynomial.X = 1 ∧
      let D := Preconnection.unit Ω Polynomial.X
      let f := ((TensorProduct.AlgebraTensorModule.cancelBaseChange (Polynomial ℤ) (Polynomial ℤ)
        (Polynomial ℤ) (Polynomial ℤ) (Module.Dual (Polynomial ℤ) (Polynomial ℤ))).trans
          (affineDualPullbackEquiv (R := Polynomial ℤ) (S := Polynomial ℤ) (E := Polynomial ℤ)))
        ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ]
          ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] ((Polynomial.X : Polynomial ℤ) • LinearMap.id)))
      dualTensorHom (Polynomial ℤ) ((Polynomial ℤ) ⊗[Polynomial ℤ] (Polynomial ℤ)) (Polynomial ℤ)
        ((D.affinePullback ((TwoForms.Morphism.refl Ω).towerComp (TwoForms.Morphism.refl Ω))).affineDual.toAddHom f)
        (1 ⊗ₜ[Polynomial ℤ] (1 : Polynomial ℤ)) = Polynomial.X := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe tripleRing tripleModule
variable {R S T U : Type tripleRing} [CommRing R] [CommRing S] [CommRing T] [CommRing U]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
  [Algebra T U] [Algebra S U] [Algebra R U]
  [IsScalarTower S T U] [IsScalarTower R S U] [IsScalarTower R T U]
variable {E : Type tripleModule} [AddCommGroup E] [Module R E]
  [Module.Finite R E] [Module.Projective R E]
set_option maxHeartbeats 800000

def affineDualPullbackTripleEquiv :
    U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E)) ≃ₗ[U] Module.Dual U (U ⊗[R] E) :=
  ((TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] Module.Dual R E)).trans
    (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U (Module.Dual R E))).trans
      (affineDualPullbackEquiv (R := R) (S := U) (E := E))

def affineDualPullbackIteratedEquiv :
    U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E)) ≃ₗ[U]
      Module.Dual U (U ⊗[T] (T ⊗[S] (S ⊗[R] E))) :=
  (((((affineDualPullbackEquiv (R := R) (S := S) (E := E)).baseChange S T).baseChange T U).trans
    ((affineDualPullbackEquiv (R := S) (S := T) (E := S ⊗[R] E)).baseChange T U)).trans
      (affineDualPullbackEquiv (R := T) (S := U) (E := T ⊗[S] (S ⊗[R] E))))

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma affineDualPullbackIteratedEquiv_eval (u v : U) (t a : T) (s b : S)
    (f : Module.Dual R E) (e : E) :
    affineDualPullbackIteratedEquiv (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] f)))
      (v ⊗ₜ[T] (a ⊗ₜ[S] (b ⊗ₜ[R] e))) =
      u * v * algebraMap T U (t * a) * algebraMap S U (s * b) * algebraMap R U (f e) := by
  sorry

lemma affineDualPullbackTripleEquiv_assoc :
    affineDualPullbackTripleEquiv (R := R) (S := S) (T := T) (U := U) (E := E) =
      (((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).baseChange T U).trans
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U (Module.Dual R E))).trans
          (affineDualPullbackEquiv (R := R) (S := U) (E := E)) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma affineDualPullbackTripleEquiv_eval (u v : U) (t : T) (s : S)
    (f : Module.Dual R E) (e : E) :
    affineDualPullbackTripleEquiv (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] f))) (v ⊗ₜ[R] e) =
      u * algebraMap T U t * algebraMap S U s * v * algebraMap R U (f e) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma affineDualPullbackTripleEquiv_coherence :
    affineDualPullbackTripleEquiv (R := R) (S := S) (T := T) (U := U) (E := E) =
      (affineDualPullbackIteratedEquiv (R := R) (S := S) (T := T) (U := U) (E := E)).trans
        (Module.Dual.congr
          ((TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E)).trans
            (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E))) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma affineDualPullbackTripleEquiv_inverse_coherence :
    (affineDualPullbackTripleEquiv (R := R) (S := S) (T := T) (U := U) (E := E)).symm =
      ((affineDualPullbackIteratedEquiv (R := R) (S := S) (T := T) (U := U) (E := E)).trans
        (Module.Dual.congr
          ((TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E)).trans
            (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E)))).symm := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma affineDualPullbackTripleEquiv_unit (f : Module.Dual R E) :
    affineDualPullbackTripleEquiv
      ((1 : U) ⊗ₜ[T] ((1 : T) ⊗ₜ[S] ((1 : S) ⊗ₜ[R] f))) = f.baseChange U := by
  sorry

universe tripleOne tripleTwo tripleThree tripleFour tripleFive tripleSix tripleSeven tripleEight
variable {k : Type tripleRing} [CommRing k]
  [Algebra k R] [Algebra k S] [Algebra k T] [Algebra k U]
variable {W : Type tripleOne} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type tripleTwo} [AddCommGroup Z] [Module R Z]
variable {V : Type tripleThree} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type tripleFour} [AddCommGroup Y] [Module S Y]
variable {P : Type tripleFive} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type tripleSix} [AddCommGroup Q] [Module T Q]
variable {L : Type tripleSeven} [AddCommGroup L] [Module U L] [Module k L]
variable {N : Type tripleEight} [AddCommGroup N] [Module U N]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y}
  {Δ : TwoForms k T P Q} {Ξ : TwoForms k U L N}
variable [IsScalarTower k R W] [IsScalarTower k S V]
  [IsScalarTower k T P] [IsScalarTower k U L]
variable {lam : R}

def Preconnection.affineDualPullbackTriple
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    Preconnection Ξ (algebraMap R U lam) (U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) where
  toAddHom := (((D.affineDual.affinePullback m).affinePullback n).affinePullback p).toAddHom
  leibniz := by
    intro u x
    rw [IsScalarTower.algebraMap_apply R S U, IsScalarTower.algebraMap_apply S T U]
    exact (((D.affineDual.affinePullback m).affinePullback n).affinePullback p).leibniz u x

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U]
  [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P] [IsScalarTower k U L] in
lemma Preconnection.affineDualPullbackTriple_apply
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affineDualPullbackTriple p n m).toAddHom x =
      (((D.affineDual.affinePullback m).affinePullback n).affinePullback p).toAddHom x := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affineDualPullback_triple_horizontal
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affinePullback ((p.towerComp n).towerComp m)).affineDual.toAddHom
      (affineDualPullbackTripleEquiv x) =
      TensorProduct.map (affineDualPullbackTripleEquiv (E := E)).toLinearMap
        LinearMap.id ((D.affineDualPullbackTriple p n m).toAddHom x) := by
  sorry

lemma Preconnection.affineDualPullback_triple_horizontal_assoc
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affinePullback (p.towerComp (n.towerComp m))).affineDual.toAddHom
      (affineDualPullbackEquiv
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U (Module.Dual R E)
          ((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).toLinearMap.baseChange U x))) =
      TensorProduct.map
        ((((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).baseChange T U).trans
          (TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U (Module.Dual R E))).trans
            (affineDualPullbackEquiv (R := R) (S := U) (E := E))).toLinearMap
        LinearMap.id ((D.affineDualPullbackTriple p n m).toAddHom x) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affineDualPullback_triple_inverse
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (f : Module.Dual U (U ⊗[R] E)) :
    (D.affineDualPullbackTriple p n m).toAddHom (affineDualPullbackTripleEquiv.symm f) =
      TensorProduct.map (affineDualPullbackTripleEquiv (R := R) (S := S) (T := T) (E := E)).symm.toLinearMap
        LinearMap.id ((D.affinePullback ((p.towerComp n).towerComp m)).affineDual.toAddHom f) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affineDualPullback_triple_eq
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affineDualPullbackTriple p n m).transport (affineDualPullbackTripleEquiv (E := E)) =
      (D.affinePullback ((p.towerComp n).towerComp m)).affineDual := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affineDualPullback_triple_extend
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : (U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) ⊗[U] L) :
    (D.affinePullback ((p.towerComp n).towerComp m)).affineDual.extend
      (TensorProduct.map (affineDualPullbackTripleEquiv (E := E)).toLinearMap LinearMap.id x) =
      TensorProduct.map (affineDualPullbackTripleEquiv (E := E)).toLinearMap LinearMap.id
        ((D.affineDualPullbackTriple p n m).extend x) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affineDualPullback_triple_curvature
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affinePullback ((p.towerComp n).towerComp m)).affineDual.curvature
      (affineDualPullbackTripleEquiv x) =
      TensorProduct.map (affineDualPullbackTripleEquiv (E := E)).toLinearMap LinearMap.id
        ((D.affineDualPullbackTriple p n m).curvature x) := by
  sorry

omit [Algebra R T] [IsScalarTower R S T] [IsScalarTower R T U] in
lemma Preconnection.affineDualPullback_triple_flat_iff
    (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (∀ x, (D.affineDualPullbackTriple p n m).curvature x = 0) ↔
      ∀ f, (D.affinePullback ((p.towerComp n).towerComp m)).affineDual.curvature f = 0 := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

namespace TauCeti.Hodge.ParameterConnection.Intrinsic
noncomputable section
open scoped TensorProduct
universe tripleTestRing tripleTestModule tripleTestOne tripleTestTwo tripleTestThree tripleTestFour
  tripleTestFive tripleTestSix tripleTestSeven tripleTestEight
variable {R S T U : Type tripleTestRing} [CommRing R] [CommRing S] [CommRing T] [CommRing U]
  [Algebra R S] [Algebra S T] [Algebra R T] [IsScalarTower R S T]
  [Algebra T U] [Algebra S U] [Algebra R U]
  [IsScalarTower S T U] [IsScalarTower R S U] [IsScalarTower R T U]
variable {E : Type tripleTestModule} [AddCommGroup E] [Module R E]
  [Module.Finite R E] [Module.Projective R E]

-- test: AffineDualTripleTests.four_scalars
example (u v : U) (t : T) (s : S) (f : Module.Dual R E) (e : E) :
    affineDualPullbackTripleEquiv (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] f))) (v ⊗ₜ[R] e) =
      u * algebraMap T U t * algebraMap S U s * v * algebraMap R U (f e) := by
  sorry

-- test: AffineDualTripleTests.six_scalars
example (u v : U) (t a : T) (s b : S) (f : Module.Dual R E) (e : E) :
    affineDualPullbackIteratedEquiv (u ⊗ₜ[T] (t ⊗ₜ[S] (s ⊗ₜ[R] f)))
      (v ⊗ₜ[T] (a ⊗ₜ[S] (b ⊗ₜ[R] e))) =
      u * v * algebraMap T U (t * a) * algebraMap S U (s * b) * algebraMap R U (f e) := by
  sorry

-- test: AffineDualTripleTests.iterated_forward_roundtrip
example (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (affineDualPullbackTripleEquiv (E := E)).symm
      ((affineDualPullbackIteratedEquiv (E := E)).trans
        (Module.Dual.congr
          ((TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E)).trans
            (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E))) x) = x := by
  sorry

-- test: AffineDualTripleTests.inverse_path_all_covectors
example (f : Module.Dual U (U ⊗[R] E)) :
    (affineDualPullbackIteratedEquiv (E := E))
      ((affineDualPullbackTripleEquiv (R := R) (S := S) (T := T) (E := E)).symm f) =
      (Module.Dual.congr
        ((TensorProduct.AlgebraTensorModule.cancelBaseChange S T U U (S ⊗[R] E)).trans
          (TensorProduct.AlgebraTensorModule.cancelBaseChange R S U U E))).symm f := by
  sorry

-- test: AffineDualTripleTests.nonflat_nonreduced
example : affineDualPullbackTripleEquiv (R := ℤ) (S := ZMod 4) (T := ZMod 4) (U := ZMod 4)
    ((1 : ZMod 4) ⊗ₜ[ZMod 4] ((1 : ZMod 4) ⊗ₜ[ZMod 4] ((2 : ZMod 4) ⊗ₜ[ℤ] LinearMap.id)))
    ((1 : ZMod 4) ⊗ₜ[ℤ] (1 : ℤ)) = 2 ∧ (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4)^2 = 0 := by
  sorry

-- test: AffineDualTripleTests.zero_module
example (f : Module.Dual U (U ⊗[R] (Fin 0 → R))) :
    (affineDualPullbackTripleEquiv (R := R) (S := S) (T := T) (E := Fin 0 → R)).symm f = 0 := by
  sorry

-- test: AffineDualTripleTests.associated_inverse_roundtrip
example (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (affineDualPullbackTripleEquiv (E := E)).symm
      (((((TensorProduct.AlgebraTensorModule.cancelBaseChange R S T T (Module.Dual R E)).baseChange T U).trans
        (TensorProduct.AlgebraTensorModule.cancelBaseChange R T U U (Module.Dual R E))).trans
          (affineDualPullbackEquiv (R := R) (S := U) (E := E))) x) = x := by
  sorry

variable {k : Type tripleTestRing} [CommRing k]
  [Algebra k R] [Algebra k S] [Algebra k T] [Algebra k U]
variable {W : Type tripleTestOne} [AddCommGroup W] [Module R W] [Module k W]
variable {Z : Type tripleTestTwo} [AddCommGroup Z] [Module R Z]
variable {V : Type tripleTestThree} [AddCommGroup V] [Module S V] [Module k V]
variable {Y : Type tripleTestFour} [AddCommGroup Y] [Module S Y]
variable {P : Type tripleTestFive} [AddCommGroup P] [Module T P] [Module k P]
variable {Q : Type tripleTestSix} [AddCommGroup Q] [Module T Q]
variable {L : Type tripleTestSeven} [AddCommGroup L] [Module U L] [Module k L]
variable {N : Type tripleTestEight} [AddCommGroup N] [Module U N]
variable {Ω : TwoForms k R W Z} {Γ : TwoForms k S V Y} {Δ : TwoForms k T P Q} {Ξ : TwoForms k U L N}
variable [IsScalarTower k R W] [IsScalarTower k S V] [IsScalarTower k T P] [IsScalarTower k U L]
variable {lam : R}

-- test: AffineDualTripleTests.actual_operator
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affineDualPullbackTriple p n m).toAddHom x =
      (((D.affineDual.affinePullback m).affinePullback n).affinePullback p).toAddHom x := by
  sorry

-- test: AffineDualTripleTests.single_parameter
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (u : U) (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affineDualPullbackTriple p n m).toAddHom (u • x) =
      u • (D.affineDualPullbackTriple p n m).toAddHom x + (algebraMap R U lam) • (x ⊗ₜ[U] Ξ.d0 u) := by
  sorry

-- test: AffineDualTripleTests.full_transport
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E) :
    (D.affineDualPullbackTriple p n m).transport (affineDualPullbackTripleEquiv (E := E)) =
      (D.affinePullback (p.towerComp (n.towerComp m))).affineDual := by
  sorry

-- test: AffineDualTripleTests.curvature_all_classes
example (p : TwoForms.Morphism (algebraMap T U) Δ Ξ)
    (n : TwoForms.Morphism (algebraMap S T) Γ Δ)
    (m : TwoForms.Morphism (algebraMap R S) Ω Γ) (D : Preconnection Ω lam E)
    (x : U ⊗[T] (T ⊗[S] (S ⊗[R] Module.Dual R E))) :
    (D.affinePullback ((p.towerComp n).towerComp m)).affineDual.curvature
      (affineDualPullbackTripleEquiv x) =
      TensorProduct.map (affineDualPullbackTripleEquiv (E := E)).toLinearMap LinearMap.id
        ((D.affineDualPullbackTriple p n m).curvature x) := by
  sorry

-- test: AffineDualTripleTests.new_polynomial_scalar
example : ∃ Ω : TwoForms ℤ ℤ ℤ (Fin 0 → ℤ),
    ∃ Γ : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
    ∃ m : TwoForms.Morphism (algebraMap ℤ (Polynomial ℤ)) Ω Γ,
      let D := Preconnection.unit Ω 1
      let f := affineDualPullbackTripleEquiv (R := ℤ) (S := Polynomial ℤ)
        (T := Polynomial ℤ) (U := Polynomial ℤ) (E := ℤ)
        ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ]
          (Polynomial.X ⊗ₜ[ℤ] (LinearMap.id : Module.Dual ℤ ℤ))))
      (∀ a, D.toAddHom a = 0) ∧
      dualTensorHom (Polynomial ℤ) ((Polynomial ℤ) ⊗[ℤ] ℤ) (Polynomial ℤ)
        ((D.affinePullback (((TwoForms.Morphism.refl Γ).towerComp
          (TwoForms.Morphism.refl Γ)).towerComp m)).affineDual.toAddHom f)
        (1 ⊗ₜ[ℤ] (1 : ℤ)) = 1 := by
  sorry

-- test: AffineDualTripleTests.variable_parameter
example : ∃ Ω : TwoForms ℤ (Polynomial ℤ) (Polynomial ℤ) (Fin 0 → Polynomial ℤ),
    Ω.d0 Polynomial.X = 1 ∧
      let D := Preconnection.unit Ω Polynomial.X
      let f := affineDualPullbackTripleEquiv (R := Polynomial ℤ) (S := Polynomial ℤ)
        (T := Polynomial ℤ) (U := Polynomial ℤ) (E := Polynomial ℤ)
        ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ] ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ]
          ((1 : Polynomial ℤ) ⊗ₜ[Polynomial ℤ]
            ((Polynomial.X : Polynomial ℤ) • (LinearMap.id : Module.Dual (Polynomial ℤ) (Polynomial ℤ))))))
      dualTensorHom (Polynomial ℤ) ((Polynomial ℤ) ⊗[Polynomial ℤ] (Polynomial ℤ)) (Polynomial ℤ)
        ((D.affinePullback (((TwoForms.Morphism.refl Ω).towerComp
          (TwoForms.Morphism.refl Ω)).towerComp (TwoForms.Morphism.refl Ω))).affineDual.toAddHom f)
        (1 ⊗ₜ[Polynomial ℤ] (1 : Polynomial ℤ)) = Polynomial.X := by
  sorry

end
end TauCeti.Hodge.ParameterConnection.Intrinsic

end
end
end Layer0

/-! ## H.0 -/

section Layer1

/-! ### H.0: signature boundary

All bodies are admitted planning sketches. Elaboration proves only that these
signatures are well typed. The accepted parent packet supplies the intrinsic
connection, sheaf, filtration and Rees targets; its 36 omitted global signatures
remain the explicit G1/G2/G3 supplier boundary in this layer's specification. No opaque
proposition stands in for any of those missing objects.

The short Imported section below restates EXACT parent planning interfaces so
this delta file can elaborate independently. Those declarations are not new
nodes, implementations or library baseline claims. The new namespace is H0.
-/

noncomputable section
open scoped TensorProduct
open Finset

namespace TauCeti.Hodge.ParameterConnection.H0

variable {R E F Q : Type*} [CommRing R]
variable [AddCommGroup E] [Module R E] [AddCommGroup F] [Module R F]
variable [AddCommGroup Q] [Module R Q]

namespace Imported

-- Parent: H.0/affine-ordered-iterate (zero and successor conventions in reader).
def iterate (θ : E →ₗ[R] E ⊗[R] Q) (n : ℕ) :
    E →ₗ[R] E ⊗[R] (⨂[R]^n Q) :=
  TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle.affineOrderedIterate θ n

-- Parent: H.0/affine-tensor-field; newest coefficient occupies the first slot.
def tensorField (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) :
    E ⊗[R] F →ₗ[R] (E ⊗[R] F) ⊗[R] Q :=
  TauCeti.Hodge.ParameterConnection.TwistedHiggsBundle.affineTensorField θ ψ

end Imported

-- New node H.0/h0-tensor-valued-shuffle. The three constructors form its API.
def shuffleSlots {n : ℕ} (s : Finset (Fin n)) :
    Fin s.card ⊕ Fin sᶜ.card ≃ Fin n := by sorry

lemma shuffleSlots_inl {n : ℕ} (s : Finset (Fin n)) (i : Fin s.card) :
    shuffleSlots s (Sum.inl i) = s.orderEmbOfFin rfl i := by sorry

lemma shuffleSlots_inr {n : ℕ} (s : Finset (Fin n)) (i : Fin sᶜ.card) :
    shuffleSlots s (Sum.inr i) = sᶜ.orderEmbOfFin rfl i := by sorry

def shuffleCoefficients (R Q : Type*) [CommRing R] [AddCommGroup Q] [Module R Q]
    {n : ℕ} (s : Finset (Fin n)) :
    (⨂[R]^s.card Q) ⊗[R] (⨂[R]^sᶜ.card Q) ≃ₗ[R] (⨂[R]^n Q) := by sorry

lemma shuffleCoefficients_def {n : ℕ} (s : Finset (Fin n)) :
    shuffleCoefficients R Q s =
      (PiTensorProduct.tmulEquiv R Q).trans
        (PiTensorProduct.reindex R (fun _ => Q) (shuffleSlots s)) := by sorry

lemma shuffleCoefficients_tprod {n : ℕ} (s : Finset (Fin n))
    (a : Fin s.card → Q) (b : Fin sᶜ.card → Q) :
    shuffleCoefficients R Q s
      (PiTensorProduct.tprod R a ⊗ₜ[R] PiTensorProduct.tprod R b) =
        PiTensorProduct.tprod R (fun i => Sum.elim a b ((shuffleSlots s).symm i)) :=
  by sorry

lemma shuffleCoefficients_natural {P : Type*} [AddCommGroup P] [Module R P]
    (u : Q →ₗ[R] P) {n : ℕ} (s : Finset (Fin n)) :
    (PiTensorProduct.map (fun _ : Fin n => u)).comp
      (shuffleCoefficients R Q s).toLinearMap =
        (shuffleCoefficients R P s).toLinearMap.comp
          (TensorProduct.map (PiTensorProduct.map (fun _ : Fin s.card => u))
            (PiTensorProduct.map (fun _ : Fin sᶜ.card => u))) := by sorry

def orderedShuffleTerm (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    {n : ℕ} (s : Finset (Fin n)) :
    E ⊗[R] F →ₗ[R] (E ⊗[R] F) ⊗[R] (⨂[R]^n Q) := by sorry

lemma orderedShuffleTerm_def (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] Q) {n : ℕ} (s : Finset (Fin n)) :
    orderedShuffleTerm θ ψ s =
      (TensorProduct.map (LinearMap.id : E ⊗[R] F →ₗ[R] E ⊗[R] F)
        (shuffleCoefficients R Q s).toLinearMap).comp
        ((TensorProduct.tensorTensorTensorComm R E (⨂[R]^s.card Q)
          F (⨂[R]^sᶜ.card Q)).toLinearMap.comp
            (TensorProduct.map (Imported.iterate θ s.card)
              (Imported.iterate ψ sᶜ.card))) := by sorry

lemma orderedShuffleTerm_horizontal {E' F' : Type*}
    [AddCommGroup E'] [Module R E'] [AddCommGroup F'] [Module R F']
    (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q)
    (θ' : E' →ₗ[R] E' ⊗[R] Q) (ψ' : F' →ₗ[R] F' ⊗[R] Q)
    (f : E →ₗ[R] E') (g : F →ₗ[R] F')
    (hf : θ'.comp f = (TensorProduct.map f (LinearMap.id : Q →ₗ[R] Q)).comp θ)
    (hg : ψ'.comp g = (TensorProduct.map g (LinearMap.id : Q →ₗ[R] Q)).comp ψ)
    {n : ℕ} (s : Finset (Fin n)) :
    (orderedShuffleTerm θ' ψ' s).comp (TensorProduct.map f g) =
      (TensorProduct.map (TensorProduct.map f g)
        (LinearMap.id : (⨂[R]^n Q) →ₗ[R] (⨂[R]^n Q))).comp
          (orderedShuffleTerm θ ψ s) := by sorry

-- New node H.0/h0-shuffle-term-vanishing: promoted because the bound uses it.
lemma orderedShuffleTerm_eq_zero (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] Q) {n N M : ℕ} (s : Finset (Fin n))
    (hθ : Imported.iterate θ N = 0) (hψ : Imported.iterate ψ M = 0)
    (hs : N ≤ s.card ∨ M ≤ sᶜ.card) : orderedShuffleTerm θ ψ s = 0 := by sorry

-- Tests belong to the shuffle construction, even when they exercise its consumers.
-- test: H0.shuffle.test_stable_left
example : shuffleSlots ({0, 2} : Finset (Fin 4)) (Sum.inl ⟨1, by decide⟩) = 2 :=
  by sorry
-- test: H0.shuffle.test_stable_right
example : shuffleSlots ({0, 2} : Finset (Fin 4)) (Sum.inr ⟨0, by decide⟩) = 1 :=
  by sorry
-- test: H0.shuffle.test_empty_tensor_unit
example : shuffleCoefficients R Q (∅ : Finset (Fin 0))
    ((TensorPower.algebraMap₀ (R := R) (M := Q) 2) ⊗ₜ[R]
      (TensorPower.algebraMap₀ (R := R) (M := Q) 3)) =
        TensorPower.algebraMap₀ (R := R) (M := Q) 6 := by sorry
-- test: H0.shuffle.test_mixed_order
example (q r : Q) : shuffleCoefficients R Q ({1} : Finset (Fin 2))
    (PiTensorProduct.tprod R (fun _ => q) ⊗ₜ[R]
      PiTensorProduct.tprod R (fun _ => r)) =
        PiTensorProduct.tprod R (fun i : Fin 2 => if i = 0 then r else q) := by sorry
-- test: H0.shuffle.test_zero_length
example (θ : E →ₗ[R] E ⊗[R] Q) (ψ : F →ₗ[R] F ⊗[R] Q) (e : E) (f : F) :
    orderedShuffleTerm θ ψ (∅ : Finset (Fin 0)) (e ⊗ₜ[R] f) =
      (e ⊗ₜ[R] f) ⊗ₜ[R] TensorPower.algebraMap₀ (R := R) (M := Q) 1 := by sorry
-- test: H0.shuffle.test_torsion_duals_miss_tensor
example : (∀ v : Module.Dual ℤ (ZMod 2), v = 0) ∧
    ((TensorProduct.mk ℤ ℤ (ZMod 2)).flip 1 : ℤ →ₗ[ℤ] ℤ ⊗[ℤ] ZMod 2) ≠ 0 :=
  by sorry

-- New node H.0/h0-ordered-shuffle-expansion: equality of actual tensor-valued maps.
theorem orderedShuffle_expansion (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] Q) (n : ℕ) :
    Imported.iterate (Imported.tensorField θ ψ) n =
      ∑ s : Finset (Fin n), orderedShuffleTerm θ ψ s := by sorry

-- New node H.0/h0-arbitrary-coefficient-tensor-bound.
theorem tensor_bound_arbitrary (θ : E →ₗ[R] E ⊗[R] Q)
    (ψ : F →ₗ[R] F ⊗[R] Q) {N M : ℕ} (hN : 0 < N) (hM : 0 < M)
    (hθ : Imported.iterate θ N = 0) (hψ : Imported.iterate ψ M = 0) :
    Imported.iterate (Imported.tensorField θ ψ) (N + M - 1) = 0 := by sorry

-- test: H0.shuffle.test_zero_factor_bound
example (ψ : F →ₗ[R] F ⊗[R] Q) {M : ℕ} (hM : 0 < M)
    (hψ : Imported.iterate ψ M = 0) :
    Imported.iterate (Imported.tensorField (0 : E →ₗ[R] E ⊗[R] Q) ψ) M = 0 :=
  by sorry
-- test: H0.shuffle.test_char_two_sharp
example :
    let V := Fin 2 → ZMod 2
    let X : Module.End (ZMod 2) V := Matrix.toLin' (Matrix.single (0 : Fin 2) 1 1)
    let θ : V →ₗ[ZMod 2] V ⊗[ZMod 2] V :=
      ((TensorProduct.mk (ZMod 2) V V).flip (Pi.single 0 1)).comp X
    let ψ : V →ₗ[ZMod 2] V ⊗[ZMod 2] V :=
      ((TensorProduct.mk (ZMod 2) V V).flip (Pi.single 1 1)).comp X
    Imported.iterate θ 2 = 0 ∧ Imported.iterate ψ 2 = 0 ∧
      Imported.iterate (Imported.tensorField θ ψ) 3 = 0 ∧
      Imported.iterate (Imported.tensorField θ ψ) 2 ≠ 0 := by sorry

-- New node H.0/h0-field-rank-bound. An existing ordered bound is stronger than
-- individual nilpotence of contractions; no commutation assumption is needed.
theorem field_rank_bound {K V P : Type*} [Field K]
    [AddCommGroup V] [Module K V] [Module.Finite K V]
    [AddCommGroup P] [Module K P] [Module.Finite K P]
    (θ : V →ₗ[K] V ⊗[K] P)
    (hnil : ∃ N, 0 < N ∧ Imported.iterate θ N = 0) :
    Imported.iterate θ (max 1 (Module.finrank K V)) = 0 := by sorry

-- New node H.0/h0-reduced-free-rank-bound. Neither field finrank nor a global
-- constant rank is imposed on the eventual locally free sheaf application.
theorem reduced_free_rank_bound [IsReduced R] {r d : ℕ}
    (b : Module.Basis (Fin r) R E) (c : Module.Basis (Fin d) R Q)
    (θ : E →ₗ[R] E ⊗[R] Q)
    (hnil : ∃ N, 0 < N ∧ Imported.iterate θ N = 0) :
    Imported.iterate θ (max 1 r) = 0 := by sorry

-- Named theorem acceptance instances; these are distinct from construction tests.
-- acceptance: H0.field_rank_bound.rank_one
example {K P : Type*} [Field K] [AddCommGroup P] [Module K P] [Module.Finite K P]
    (θ : K →ₗ[K] K ⊗[K] P) (hnil : ∃ N, 0 < N ∧ Imported.iterate θ N = 0) :
    θ = 0 := by sorry

-- acceptance: H0.field_rank_bound.sharp_rank_three
example :
    let V := Fin 3 → ℚ
    let X : Module.End ℚ V := Matrix.toLin'
      (Matrix.single (0 : Fin 3) 1 1 + Matrix.single (1 : Fin 3) 2 1)
    let θ : V →ₗ[ℚ] V ⊗[ℚ] ℚ := ((TensorProduct.mk ℚ V ℚ).flip 1).comp X
    Imported.iterate θ 3 = 0 ∧ Imported.iterate θ 2 ≠ 0 := by sorry

-- acceptance: H0.reduced_free_rank_bound.nonreduced_rank_one
example :
    let θ : ZMod 4 →ₗ[ZMod 4] ZMod 4 ⊗[ZMod 4] ZMod 4 :=
      (2 : ZMod 4) • (TensorProduct.rid (ZMod 4) (ZMod 4)).symm.toLinearMap
    Imported.iterate θ 2 = 0 ∧ Imported.iterate θ 1 ≠ 0 := by sorry

-- This abbreviation is exactly a native module quotient, not a new carrier node.
abbrev modParameter (R : Type*) [CommRing R] (t : R)
    (M : Type*) [AddCommGroup M] [Module R M] :=
    M ⧸ LinearMap.range (t • (LinearMap.id : M →ₗ[R] M))

-- New node H.0/h0-parameter-residue. The derivative term dies modulo t;
-- no flatness, regularity of t, finite filtration or global section tensor claim.
def parameterResidue (t : R) (d : R →+ Q) (D : E →+ E ⊗[R] Q)
    (hD : ∀ a e, D (a • e) = a • D e + t • (e ⊗ₜ[R] d a)) :
    modParameter R t E →ₗ[R] modParameter R t (E ⊗[R] Q) := by sorry

lemma parameterResidue_mk (t : R) (d : R →+ Q) (D : E →+ E ⊗[R] Q)
    (hD : ∀ a e, D (a • e) = a • D e + t • (e ⊗ₜ[R] d a)) (e : E) :
    parameterResidue t d D hD
      ((LinearMap.range (t • (LinearMap.id : E →ₗ[R] E))).mkQ e) =
        (LinearMap.range (t • (LinearMap.id : E ⊗[R] Q →ₗ[R] E ⊗[R] Q))).mkQ (D e) :=
  by sorry

lemma parameterResidue_unique (t : R) (d : R →+ Q) (D : E →+ E ⊗[R] Q)
    (hD : ∀ a e, D (a • e) = a • D e + t • (e ⊗ₜ[R] d a))
    (f : modParameter R t E →ₗ[R] modParameter R t (E ⊗[R] Q))
    (hf : ∀ e, f ((LinearMap.range (t • (LinearMap.id : E →ₗ[R] E))).mkQ e) =
      (LinearMap.range (t • (LinearMap.id : E ⊗[R] Q →ₗ[R] E ⊗[R] Q))).mkQ (D e)) :
    f = parameterResidue t d D hD := by sorry

lemma parameterResidue_eq_iff (t : R) (d : R →+ Q) (D D' : E →+ E ⊗[R] Q)
    (hD : ∀ a e, D (a • e) = a • D e + t • (e ⊗ₜ[R] d a))
    (hD' : ∀ a e, D' (a • e) = a • D' e + t • (e ⊗ₜ[R] d a)) :
    parameterResidue t d D hD = parameterResidue t d D' hD' ↔
      ∀ e, D e - D' e ∈
        LinearMap.range (t • (LinearMap.id : E ⊗[R] Q →ₗ[R] E ⊗[R] Q)) := by sorry

-- Native quotient maps compare residues before the separate geometric adapters.
lemma parameterResidue_natural {P : Type*} [AddCommGroup P] [Module R P]
    (t : R) (d : R →+ Q) (d' : R →+ P)
    (D : E →+ E ⊗[R] Q) (D' : F →+ F ⊗[R] P)
    (hD : ∀ a e, D (a • e) = a • D e + t • (e ⊗ₜ[R] d a))
    (hD' : ∀ a e, D' (a • e) = a • D' e + t • (e ⊗ₜ[R] d' a))
    (f : E →ₗ[R] F) (u : Q →ₗ[R] P)
    (hintertwine : ∀ e, D' (f e) = TensorProduct.map f u (D e))
    (hf : LinearMap.range (t • (LinearMap.id : E →ₗ[R] E)) ≤
      Submodule.comap f (LinearMap.range (t • (LinearMap.id : F →ₗ[R] F))))
    (hfu : LinearMap.range (t • (LinearMap.id : E ⊗[R] Q →ₗ[R] E ⊗[R] Q)) ≤
      Submodule.comap (TensorProduct.map f u)
        (LinearMap.range (t • (LinearMap.id : F ⊗[R] P →ₗ[R] F ⊗[R] P)))) :
    (parameterResidue t d' D' hD').comp
        (Submodule.mapQ _ _ f hf) =
      (Submodule.mapQ _ _ (TensorProduct.map f u) hfu).comp
        (parameterResidue t d D hD) := by sorry

-- test: H0.parameterResidue.test_zero_parameter
example (D : E →ₗ[R] E ⊗[R] Q)
    (hD : ∀ a e, D.toAddMonoidHom (a • e) =
      a • D.toAddMonoidHom e + (0 : R) • (e ⊗ₜ[R] (0 : R →+ Q) a)) (e : E) :
    parameterResidue (0 : R) (0 : R →+ Q) D.toAddMonoidHom hD
      ((LinearMap.range ((0 : R) • (LinearMap.id : E →ₗ[R] E))).mkQ e) =
        (LinearMap.range ((0 : R) •
          (LinearMap.id : E ⊗[R] Q →ₗ[R] E ⊗[R] Q))).mkQ (D e) := by sorry

-- test: H0.parameterResidue.test_unit_parameter
example (d : R →+ Q) (D : E →+ E ⊗[R] Q)
    (hD : ∀ a e, D (a • e) = a • D e + (1 : R) • (e ⊗ₜ[R] d a)) :
    parameterResidue (1 : R) d D hD = 0 := by sorry

-- test: H0.parameterResidue.test_nonzero_residue
example :
    let D := ((TensorProduct.mk ℤ ℤ ℤ).flip 1).toAddMonoidHom
    ∃ hD : ∀ a e, D (a • e) = a • D e + (2 : ℤ) • (e ⊗ₜ[ℤ] (0 : ℤ →+ ℤ) a),
      parameterResidue (2 : ℤ) (0 : ℤ →+ ℤ) D hD ≠ 0 := by sorry

end TauCeti.Hodge.ParameterConnection.H0

end
end Layer1

/-! ## H.1 -/

section Layer2

/-! ### H.1: signature boundary

The native portion uses the actual matrix group, Representation.IsIrreducible and
Representation.Equiv. Its quotient is a set of stable representation classes. It supplies
no scheme, analytic space, topology, family functor or nonreduced structure.
The omission inventory at the end records signatures whose actual supplier carriers
are not available. No geometric condition is replaced by an opaque proposition.
-/

noncomputable section

namespace TauCeti.NonabelianHodge

variable {Γ : Type*} [Group Γ]


/-- Fixed determinant is an equality of characters. Stability includes nonzero dimension. -/
structure BettiStableRepresentation (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) where
  hom : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ
  fixedDeterminant : Matrix.GeneralLinearGroup.det.comp hom = δ
  irreducible : Representation.IsIrreducible (matrixRepresentation (r := r) hom)

namespace BettiStableRepresentation

variable {r : ℕ} {δ : Γ →* ℂˣ}

def toRepresentation (ρ : BettiStableRepresentation Γ r δ) :
    Representation ℂ Γ (Fin r → ℂ) := matrixRepresentation (r := r) ρ.hom

theorem det_eq (ρ : BettiStableRepresentation Γ r δ) (γ : Γ) :
    Matrix.GeneralLinearGroup.det (ρ.hom γ) = δ γ := by
  sorry

theorem ext (ρ σ : BettiStableRepresentation Γ r δ) (h : ρ.hom = σ.hom) : ρ = σ := by
  sorry

def rankOne (δ : Γ →* ℂˣ) : BettiStableRepresentation Γ 1 δ := by
  sorry

theorem iso_iff_conjugate (ρ σ : BettiStableRepresentation Γ r δ) :
    Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) ↔
      ∃ g : Matrix.GeneralLinearGroup (Fin r) ℂ,
        ∀ γ : Γ, σ.hom γ = g * ρ.hom γ * g⁻¹ := by
  sorry

-- BettiStableRepresentation.rankOne_det
example (δ : Γ →* ℂˣ) (γ : Γ) :
    Matrix.GeneralLinearGroup.det ((rankOne δ).hom γ) = δ γ := by
  sorry

-- BettiStableRepresentation.rankZero_empty
example (δ : Γ →* ℂˣ) : IsEmpty (BettiStableRepresentation Γ 0 δ) := by
  sorry

-- BettiStableRepresentation.irreducible_native
example (ρ : BettiStableRepresentation Γ r δ) :
    Representation.IsIrreducible ρ.toRepresentation := by
  sorry

-- BettiStableRepresentation.trivial_rankTwo_excluded
example (δ : Γ →* ℂˣ) :
    ¬ ∃ ρ : BettiStableRepresentation Γ 2 δ, ρ.hom = 1 := by
  sorry

end BettiStableRepresentation

/-- Betti part of H.1/stable-automorphisms, for an arbitrary group and character.
The native Schur lemma applies to the associated irreducible representation.
The geometric stable-operator assertion remains in the omission inventory. -/
theorem stable_automorphisms_betti {r : ℕ} {δ : Γ →* ℂˣ}
    (ρ : BettiStableRepresentation Γ r δ) (g : Matrix.GeneralLinearGroup (Fin r) ℂ) :
    (∀ γ, g * ρ.hom γ = ρ.hom γ * g) ↔
      ∃! c : ℂˣ, g = Matrix.GeneralLinearGroup.scalar (Fin r) c := by
  sorry

/-- Requiring the automorphism to act identically on the determinant cuts
the scalar group to the r-th roots of unity; det ρ = δ alone does not do so. -/
theorem determinant_rigidified_automorphisms_betti {r : ℕ} {δ : Γ →* ℂˣ}
    (ρ : BettiStableRepresentation Γ r δ) (g : Matrix.GeneralLinearGroup (Fin r) ℂ) :
    ((∀ γ, g * ρ.hom γ = ρ.hom γ * g) ∧ Matrix.GeneralLinearGroup.det g = 1) ↔
      ∃! c : ℂˣ, g = Matrix.GeneralLinearGroup.scalar (Fin r) c ∧ c ^ r = 1 := by
  sorry

-- stable_automorphisms_betti_test_rank_one: rigidification removes the scalars.
example {δ : Γ →* ℂˣ} (ρ : BettiStableRepresentation Γ 1 δ)
    (g : Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (hg : ∀ γ, g * ρ.hom γ = ρ.hom γ * g)
    (hdet : Matrix.GeneralLinearGroup.det g = 1) : g = 1 := by
  sorry

-- stable_automorphisms_betti_test_unrigidified: fixing the character retains every scalar.
example {r : ℕ} {δ : Γ →* ℂˣ} (ρ : BettiStableRepresentation Γ r δ) (c : ℂˣ) :
    ∀ γ, Matrix.GeneralLinearGroup.scalar (Fin r) c * ρ.hom γ *
      (Matrix.GeneralLinearGroup.scalar (Fin r) c)⁻¹ = ρ.hom γ := by
  sorry

-- stable_automorphisms_betti_test_nontrivial_scalar: this automorphism fails rigidification.
example {δ : Γ →* ℂˣ} (ρ : BettiStableRepresentation Γ 1 δ)
    (c : ℂˣ) (hc : c ≠ 1) :
    (∀ γ, Matrix.GeneralLinearGroup.scalar (Fin 1) c * ρ.hom γ =
      ρ.hom γ * Matrix.GeneralLinearGroup.scalar (Fin 1) c) ∧
    Matrix.GeneralLinearGroup.det (Matrix.GeneralLinearGroup.scalar (Fin 1) c) ≠ 1 := by
  sorry

-- stable_automorphisms_betti_test_native_determinant: rank r gives c^r, not c.
example (r : ℕ) (c : ℂˣ) :
    Matrix.GeneralLinearGroup.det (Matrix.GeneralLinearGroup.scalar (Fin r) c) = c ^ r := by
  sorry

def bettiStableSetoid (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) :
    Setoid (BettiStableRepresentation Γ r δ) where
  r ρ σ := Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation)
  iseqv := by
    sorry

/-- This is the ordinary set quotient, not a stand-in for the coarse moduli scheme. -/
def BettiStableClasses (Γ : Type*) [Group Γ] (r : ℕ) (δ : Γ →* ℂˣ) :=
  Quotient (bettiStableSetoid Γ r δ)

namespace BettiStableClasses

variable {r : ℕ} {δ : Γ →* ℂˣ}

def mk (ρ : BettiStableRepresentation Γ r δ) : BettiStableClasses Γ r δ :=
  Quotient.mk (bettiStableSetoid Γ r δ) ρ

theorem mk_eq_mk (ρ σ : BettiStableRepresentation Γ r δ) :
    mk ρ = mk σ ↔ Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) := by
  sorry

def lift {T : Sort*} (f : BettiStableRepresentation Γ r δ → T)
    (hf : ∀ ρ σ, Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) → f ρ = f σ) :
    BettiStableClasses Γ r δ → T := by
  sorry

theorem lift_mk {T : Sort*} (f : BettiStableRepresentation Γ r δ → T)
    (hf : ∀ ρ σ, Nonempty (ρ.toRepresentation.Equiv σ.toRepresentation) → f ρ = f σ)
    (ρ : BettiStableRepresentation Γ r δ) : lift f hf (mk ρ) = f ρ := by
  sorry

theorem lift_unique {T : Sort*} (f g : BettiStableClasses Γ r δ → T)
    (h : ∀ ρ, f (mk ρ) = g (mk ρ)) : f = g := by
  sorry

def rankOne_equiv (δ : Γ →* ℂˣ) : BettiStableClasses Γ 1 δ ≃ PUnit := by
  sorry

-- BettiStableClasses.rankOne_subsingleton
example (δ : Γ →* ℂˣ) (a b : BettiStableClasses Γ 1 δ) : a = b := by
  sorry

-- BettiStableClasses.rankZero_empty
example (δ : Γ →* ℂˣ) : IsEmpty (BettiStableClasses Γ 0 δ) := by
  sorry

-- BettiStableClasses.native_iso_identification
example (ρ σ : BettiStableRepresentation Γ r δ)
    (e : ρ.toRepresentation.Equiv σ.toRepresentation) : mk ρ = mk σ := by
  sorry

-- BettiStableClasses.abelian_rankTwo_empty
example (Γ : Type*) [CommGroup Γ] (δ : Γ →* ℂˣ) :
    IsEmpty (BettiStableClasses Γ 2 δ) := by
  sorry

end BettiStableClasses

end TauCeti.NonabelianHodge

/-!
## Explicit signature omissions

G11 is an open prototype obligation. The names below have no Lean declarations or
examples in this file. Their mathematical statements, prerequisites, APIs and tests
are in the specification and definitive reader. The actual supplier carriers are missing;
these omissions are not replaced by opaque predicates, arbitrary result types,
or a set quotient pretending to be a geometric moduli space.

Carrier groups: G1 global relative coherent operators and bundles; G2 scheme/GIT and slices;
G3 relative coherent analytic families; G4 compact Kähler/Chern-Weil theory;
G5 determinant-rigidified dg Lie/gauge deformation and coarse-inertia comparison; G6 projective topology; G7 nonlinear metric flow;
G8 primary Corlette proof; G9 gauge and moment-map compactness.
G10 additionally records the regularity boundary of the coarse homeomorphism.

Omitted node: HodgeStructuresPartII:H.1/stable-automorphisms
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.stable_automorphisms
Typed component: stable_automorphisms_betti and determinant_rigidified_automorphisms_betti
state the representation assertions. The stable coherent-operator, stack-inertia
and absence-of-universal-bundle assertions have no geometric signatures here.

Omitted node: HodgeStructuresPartII:H.1/torsion-determinant-dictionary
Required inputs: G1; G11.
Declaration: TauCeti.NonabelianHodge.torsion_determinant_dictionary

Omitted node: HodgeStructuresPartII:H.1/stability
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.IsStableParameterConnection
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.invariant_iff
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.iso_iff
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.scale_unit_iff
API omission: TauCeti.NonabelianHodge.IsStableParameterConnection.rankOne
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.line_stable
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.zero_excluded
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.zero_higgs_iff
Example omission: TauCeti.NonabelianHodge.IsStableParameterConnection.trivial_rankTwo_excluded
Additional API/test obligations: TauCeti.NonabelianHodge.IsStableParameterConnection.equal_rank_ignored

Omitted node: HodgeStructuresPartII:H.1/parameter-families
Required inputs: G1; G11.
Declaration: TauCeti.NonabelianHodge.FixedDeterminantFamily
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.pullback
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.fibre
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.determinant
API omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.twist_from_base
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.rankOne_class
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.zero_fibre
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.one_fibre
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.absolute_derivative_excluded
Example omission: TauCeti.NonabelianHodge.FixedDeterminantFamily.geometric_determinant_nonexample
Additional API/test obligations: TauCeti.NonabelianHodge.FixedDeterminantFamily.mk, TauCeti.NonabelianHodge.FixedDeterminantFamily.iso_ext, TauCeti.NonabelianHodge.FixedDeterminantFamily.rigidification_inertia

Omitted node: HodgeStructuresPartII:H.1/betti-framed
Required inputs: G6; G11.
Declaration: TauCeti.NonabelianHodge.BettiRepresentationScheme
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.points
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.conjugation
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.presentation_independent
API omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.stable_open
Example omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.free_group
Example omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.trivial_group
Example omission: TauCeti.NonabelianHodge.BettiRepresentationScheme.native_points

Omitted node: HodgeStructuresPartII:H.1/betti-coarse
Required inputs: G2; G11.
Declaration: TauCeti.NonabelianHodge.BettiModuli
API omission: TauCeti.NonabelianHodge.BettiModuli.quotient
API omission: TauCeti.NonabelianHodge.BettiModuli.stable_points
API omission: TauCeti.NonabelianHodge.BettiModuli.closed_orbit_iff
API omission: TauCeti.NonabelianHodge.BettiModuli.basepoint_change
Example omission: TauCeti.NonabelianHodge.BettiModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.BettiModuli.trivial_group_stable_empty
Example omission: TauCeti.NonabelianHodge.BettiModuli.classes_compatibility
Example omission: TauCeti.NonabelianHodge.BettiModuli.semisimplification_nonexample

Omitted node: HodgeStructuresPartII:H.1/operator-boundedness
Required inputs: G1; G11.
Declaration: TauCeti.NonabelianHodge.parameter_connection_boundedness

Omitted node: HodgeStructuresPartII:H.1/chern-component
Required inputs: G4; G11.
Declaration: TauCeti.NonabelianHodge.chern_zero_component

Omitted node: HodgeStructuresPartII:H.1/higgs-restriction
Required inputs: G6; G11.
Declaration: TauCeti.NonabelianHodge.higgs_restriction_and_extensions

Omitted node: HodgeStructuresPartII:H.1/higgs-local-freeness
Required inputs: G4, G6; G11.
Declaration: TauCeti.NonabelianHodge.higgs_chern_zero_locally_free

Omitted node: HodgeStructuresPartII:H.1/dolbeault-coarse
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.DolbeaultModuli
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.classify
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.points
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.determinant_fibre
API omission: TauCeti.NonabelianHodge.DolbeaultModuli.stable_universal_etale
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.point_base
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.trace_determinant
Example omission: TauCeti.NonabelianHodge.DolbeaultModuli.strictly_semistable_excluded

Omitted node: HodgeStructuresPartII:H.1/derham-coarse
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.DeRhamModuli
API omission: TauCeti.NonabelianHodge.DeRhamModuli.classify
API omission: TauCeti.NonabelianHodge.DeRhamModuli.stable_iff_irreducible
API omission: TauCeti.NonabelianHodge.DeRhamModuli.determinant_fibre
API omission: TauCeti.NonabelianHodge.DeRhamModuli.stable_universal_etale
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.point_base
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.native_operator
Example omission: TauCeti.NonabelianHodge.DeRhamModuli.underlying_line_insufficient

Omitted node: HodgeStructuresPartII:H.1/hodge-coarse
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.HodgeModuli
API omission: TauCeti.NonabelianHodge.HodgeModuli.parameter
API omission: TauCeti.NonabelianHodge.HodgeModuli.zero_fibre
API omission: TauCeti.NonabelianHodge.HodgeModuli.one_fibre
API omission: TauCeti.NonabelianHodge.HodgeModuli.classify
Example omission: TauCeti.NonabelianHodge.HodgeModuli.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.HodgeModuli.zero_parameter
Example omission: TauCeti.NonabelianHodge.HodgeModuli.fibres_scheme
Example omission: TauCeti.NonabelianHodge.HodgeModuli.rankTwo_point_empty

Omitted node: HodgeStructuresPartII:H.1/horizontal-sections
Required inputs: G3; G11.
Declaration: TauCeti.NonabelianHodge.horizontal_sections_relative

Omitted node: HodgeStructuresPartII:H.1/riemann-hilbert-framed
Required inputs: G3, G6; G11.
Declaration: TauCeti.NonabelianHodge.riemann_hilbert_framed

Omitted node: HodgeStructuresPartII:H.1/riemann-hilbert-coarse
Required inputs: G2, G3, G9; G11.
Declaration: TauCeti.NonabelianHodge.riemann_hilbert_coarse

Omitted node: HodgeStructuresPartII:H.1/harmonic-bundle
Required inputs: G1, G7; G11.
Declaration: TauCeti.NonabelianHodge.HarmonicBundlePresentation
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.flat
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.higgs
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.tensor_dual
API omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.pullback
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.trivial_line
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.point
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.zero_higgs_unitary
Example omission: TauCeti.NonabelianHodge.HarmonicBundlePresentation.tensor_stability_nonexample
Additional API/test obligations: TauCeti.NonabelianHodge.HarmonicBundlePresentation.mk, TauCeti.NonabelianHodge.HarmonicBundlePresentation.hom_ext

Omitted node: HodgeStructuresPartII:H.1/kahler-identities
Required inputs: G4; G11.
Declaration: TauCeti.NonabelianHodge.harmonic_kahler_identities

Omitted node: HodgeStructuresPartII:H.1/donaldson-functional
Required inputs: G7; G11.
Declaration: TauCeti.NonabelianHodge.DonaldsonFunctional
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.refl
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.cocycle
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.first_variation
API omission: TauCeti.NonabelianHodge.DonaldsonFunctional.heat_derivative
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.equal_metrics
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.rankOne_fixed
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.diagonal_kernel
Example omission: TauCeti.NonabelianHodge.DonaldsonFunctional.missing_higgs_term
Additional API/test obligations: TauCeti.NonabelianHodge.DonaldsonFunctional.nonharmonic_background

Omitted node: HodgeStructuresPartII:H.1/higgs-metric-existence
Required inputs: G7; G11.
Declaration: TauCeti.NonabelianHodge.higgs_metric_existence

Omitted node: HodgeStructuresPartII:H.1/chern-weil-flatness
Required inputs: G4; G11.
Declaration: TauCeti.NonabelianHodge.chern_weil_flatness

Omitted node: HodgeStructuresPartII:H.1/flat-metric-existence
Required inputs: G8; G11.
Declaration: TauCeti.NonabelianHodge.flat_metric_existence

Omitted node: HodgeStructuresPartII:H.1/harmonic-correspondence
Required inputs: G8; G11.
Declaration: TauCeti.NonabelianHodge.harmonic_correspondence

Omitted node: HodgeStructuresPartII:H.1/hitchin-map
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.HitchinMap
API omission: TauCeti.NonabelianHodge.HitchinMap.coefficients
API omission: TauCeti.NonabelianHodge.HitchinMap.scale
API omission: TauCeti.NonabelianHodge.HitchinMap.jordan_invariant
API omission: TauCeti.NonabelianHodge.HitchinMap.nilpotent_iff
Example omission: TauCeti.NonabelianHodge.HitchinMap.rankTwo_sign
Example omission: TauCeti.NonabelianHodge.HitchinMap.rankOne_base
Example omission: TauCeti.NonabelianHodge.HitchinMap.trace_coordinate
Example omission: TauCeti.NonabelianHodge.HitchinMap.nonzero_nilpotent

Omitted node: HodgeStructuresPartII:H.1/hitchin-properness
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.hitchin_proper

Omitted node: HodgeStructuresPartII:H.1/harmonic-compactness
Required inputs: G9; G11.
Declaration: TauCeti.NonabelianHodge.harmonic_compactness

Omitted node: HodgeStructuresPartII:H.1/nonabelian-hodge-topology
Required inputs: G8, G9, G10; G11.
Declaration: TauCeti.NonabelianHodge.nonabelian_hodge_homeomorphism

Omitted node: HodgeStructuresPartII:H.1/hodge-scaling
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.HodgeScaling
API omission: TauCeti.NonabelianHodge.HodgeScaling.parameter
API omission: TauCeti.NonabelianHodge.HodgeScaling.action_laws
API omission: TauCeti.NonabelianHodge.HodgeScaling.nonzero_equiv
API omission: TauCeti.NonabelianHodge.HodgeScaling.determinant
Example omission: TauCeti.NonabelianHodge.HodgeScaling.rankOne
Example omission: TauCeti.NonabelianHodge.HodgeScaling.zero_higgs
Example omission: TauCeti.NonabelianHodge.HodgeScaling.unit_parameter
Example omission: TauCeti.NonabelianHodge.HodgeScaling.fixed_lambda_nonexample

Omitted node: HodgeStructuresPartII:H.1/two-types-formality
Required inputs: G4, G5; G11.
Declaration: TauCeti.NonabelianHodge.two_types_formality

Omitted node: HodgeStructuresPartII:H.1/hodge-formal-product
Required inputs: G5; G11.
Declaration: TauCeti.NonabelianHodge.hodge_formal_product

Omitted node: HodgeStructuresPartII:H.1/hodge-etale-product
Required inputs: G5; G11.
Declaration: TauCeti.NonabelianHodge.hodge_etale_local_product

Omitted node: HodgeStructuresPartII:H.1/hodge-flatness
Required inputs: Actual geometric carriers and the prerequisite supplier exports (G1-G9); G11.
Declaration: TauCeti.NonabelianHodge.hodge_parameter_flat

Omitted node: HodgeStructuresPartII:H.1/operator-git
Required inputs: G1, G2; G11.
Declaration: TauCeti.NonabelianHodge.parameter_connection_git

Omitted node: HodgeStructuresPartII:H.1/operator-framed
Required inputs: G1, G2, G3; G11.
Declaration: TauCeti.NonabelianHodge.FramedParameterModuli
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.represent
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.universal
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.frame_change
API omission: TauCeti.NonabelianHodge.FramedParameterModuli.quotient
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.rankOne
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.point_base
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.frame_kills_inertia
Example omission: TauCeti.NonabelianHodge.FramedParameterModuli.coarse_not_fine

-/

end
end Layer2

/-! ## H.2 -/

section Layer3

/-! ### H.2: signature boundary

Scope: HodgeStructuresPartII:H.2. This is a fibre and rank-one prototype.
`ComplexPVHS` below is the full finite-dimensional complex object OVER A POINT,
not a weakened global variation. `MixedVariation` is an alias of the existing
rational fibre object, also over a point. Constant-family constructions are
explicitly labelled. No global variation theorem is asserted for these objects.

The native library lacks the supplier analytic/global carriers, real mixed
objects and algebraic monodromy groups listed in packet gaps G1–G19. Their
signatures are omitted, with each planned name and exact reason recorded at the
end. No unknown condition is represented by an opaque proposition or fake field.
-/

open CategoryTheory
open scoped TensorProduct

noncomputable section
namespace TauCeti.Hodge.Variation

universe u v w

/-! Complex PVHS over a point. No real form or lattice is present. -/
section Complex
variable (V : Type u) [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]

structure ComplexPVHS (n : ℤ) where
  finiteRank : Module.Finite ℂ V
  piece : ℤ → Submodule ℂ V
  finitePieces : Set.Finite {p | piece p ≠ ⊥}
  decomposition : DirectSum.IsInternal piece
  hermitianForm : V →ₗ[ℂ] V →ₛₗ[starRingEnd ℂ] ℂ
  hermitian : ∀ x y, hermitianForm x y = star (hermitianForm y x)
  nondegenerate : ∀ x, (∀ y, hermitianForm x y = 0) → x = 0
  orthogonal : ∀ p q, p ≠ q → ∀ x ∈ piece p, ∀ y ∈ piece q,
    hermitianForm x y = 0
  positive : ∀ p, ∀ x ∈ piece p, x ≠ 0 →
    0 < ((p.negOnePow : ℂ) * hermitianForm x x).re

variable {V} {n : ℤ}

/-- Pointwise extensionality: the grading and Hermitian form are the object data. -/
theorem ComplexPVHS.ext (A B : ComplexPVHS V n)
    (hpiece : ∀ p, A.piece p = B.piece p)
    (hform : A.hermitianForm = B.hermitianForm) : A = B := by
  sorry

/-- Pointwise F, using the actual direct-sum grading. -/
def ComplexPVHS.hodgeFiltration (A : ComplexPVHS V n) (a : ℤ) : Submodule ℂ V :=
  ⨆ p, ⨆ (_ : a ≤ p), A.piece p

/-- Constant-family shadow of forgetting the variation. -/
def ComplexPVHS.localSystem (_A : ComplexPVHS V n) (X : TopCat) :
    TauCeti.LocalCoefficientSystem ℂ X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj (ModuleCat.of ℂ V)

/-- Pullback of a point's Hodge data is unchanged. Global holomorphic pullback is G1. -/
def ComplexPVHS.pullback (A : ComplexPVHS V n) {X Y : TopCat} (_ : C(X, Y)) :
    ComplexPVHS V n := A

/-- Pointwise constructor from an ACTUAL native real-conjugation fibre and Hermitian data.
The missing global and real-bilinear polarization signatures are G1/G2. -/
def ComplexPVHS.ofReal (ω : Conjugation V) (hs : HodgeStructureOn V ω n)
    (ψ : V →ₗ[ℂ] V →ₛₗ[starRingEnd ℂ] ℂ)
    (hherm : ∀ x y, ψ x y = star (ψ y x))
    (hnd : ∀ x, (∀ y, ψ x y = 0) → x = 0)
    (horth : ∀ p q, p ≠ q → ∀ x ∈ hs.piece p, ∀ y ∈ hs.piece q, ψ x y = 0)
    (hpos : ∀ p, ∀ x ∈ hs.piece p, x ≠ 0 →
      0 < ((p.negOnePow : ℂ) * ψ x x).re) : ComplexPVHS V n := by
  sorry

variable {V' : Type v} [AddCommGroup V'] [Module ℂ V'] [FiniteDimensional ℂ V']

def ComplexPVHS.hom (A : ComplexPVHS V n) (B : ComplexPVHS V' n) :=
  {f : V →ₗ[ℂ] V' // ∀ p, (A.piece p).map f ≤ B.piece p}

/-- The rank-one complex point object of type (p,n-p). -/
def complexLine (n p : ℤ) : ComplexPVHS ℂ n := by
  sorry

/-- ComplexPVHSTest.lineFiltration -/
example (n p a : ℤ) :
    (complexLine n p).hodgeFiltration a = if a ≤ p then ⊤ else ⊥ := by
  sorry

/-- ComplexPVHSTest.zeroRank -/
example (A : ComplexPVHS (Fin 0 → ℂ) n) (p : ℤ) : A.piece p = ⊥ := by
  sorry

/-- ComplexPVHSTest.noRealSymmetry: a real weight-zero one-dimensional fibre
cannot have only type (1,-1). The native opposedness supplies the obstruction. -/
example (ω : Conjugation ℂ) (hs : HodgeStructureOn ℂ ω 0)
    (hF : hs.F 1 = ⊤) : False := by
  sorry

/-- ComplexPVHSTest.nativeRealFiber: the constructor respects native F. -/
example (ω : Conjugation V) (hs : HodgeStructureOn V ω n)
    (ψ : V →ₗ[ℂ] V →ₛₗ[starRingEnd ℂ] ℂ)
    (hherm : ∀ x y, ψ x y = star (ψ y x))
    (hnd : ∀ x, (∀ y, ψ x y = 0) → x = 0)
    (horth : ∀ p q, p ≠ q → ∀ x ∈ hs.piece p, ∀ y ∈ hs.piece q, ψ x y = 0)
    (hpos : ∀ p, ∀ x ∈ hs.piece p, x ≠ 0 →
      0 < ((p.negOnePow : ℂ) * ψ x x).re) (a : ℤ) :
    (ComplexPVHS.ofReal ω hs ψ hherm hnd horth hpos).hodgeFiltration a = hs.F a := by
  sorry

/-! Realification uses native REAL complexification conjugation, not lattice conjugation. -/
variable [Module ℝ V] [IsScalarTower ℝ ℂ V]

def ComplexPVHS.realification (A : ComplexPVHS V n) :
    HodgeStructureOn (ℂ ⊗[ℝ] V) (complexificationConjugation V) n := by
  sorry

/-- Pointwise real-linear comparison; the second output has conjugate complex action.
Its complex-linear packaging awaits the coefficient interface in G2. -/
def ComplexPVHS.realificationComplexEquiv (A : ComplexPVHS V n) :
    (ℂ ⊗[ℝ] V) ≃ₗ[ℝ] (V × V) := by
  sorry

def ComplexPVHS.realificationInclusion (A : ComplexPVHS V n) :
    V →ₗ[ℂ] (ℂ ⊗[ℝ] V) := by
  sorry

variable [Module ℝ V'] [IsScalarTower ℝ ℂ V']

def ComplexPVHS.realificationMap {A : ComplexPVHS V n} {B : ComplexPVHS V' n}
    (f : A.hom B) :
    {g : (ℂ ⊗[ℝ] V) →ₗ[ℂ] (ℂ ⊗[ℝ] V') //
      ∀ p, ((A.realification).F p).map g ≤ (B.realification).F p} := by
  sorry

/-- RealificationTest.rankOne: inspect the actual realification constructor. -/
example : Module.finrank ℂ ((complexLine 0 1).realification.piece 1) = 1 ∧
    Module.finrank ℂ ((complexLine 0 1).realification.piece (-1)) = 1 ∧
    Module.finrank ℂ (ℂ ⊗[ℝ] ℂ) = 2 := by
  sorry

/-- RealificationTest.typeSwap -/
example : ((complexLine 0 1).realification).piece 1 ≠ ⊥ ∧
    ((complexLine 0 1).realification).piece (-1) ≠ ⊥ := by
  sorry

/-- RealificationTest.alreadyReal: constructor-sensitive type-(0,0) shadow.
The full comparison with two copies of an arbitrary real model is omitted (G2). -/
example : Module.finrank ℂ ((complexLine 0 0).realification.piece 0) = 2 ∧
    (complexLine 0 0).realification.F 0 = ⊤ ∧
    (complexLine 0 0).realification.F 1 = ⊥ := by
  sorry
end Complex

/-! Rational mixed variation over a point: reuse the existing carrier and maps. -/
section Mixed
variable {VZ : Type u} {VQ : Type v} {VC : Type w}
variable [AddCommGroup VZ] [AddCommGroup VQ] [Module ℚ VQ]
variable [AddCommGroup VC] [Module ℂ VC]
variable [FiniteDimensional ℚ VQ]
variable {iQ : VZ →ₗ[ℤ] VQ} {iC : VZ →ₗ[ℤ] VC}
variable (hQ : IsBaseChange ℚ iQ) (hC : IsBaseChange ℂ iC)

abbrev MixedVariation := MixedHodgeStructure hQ hC

variable {hQ hC}

def MixedVariation.localSystem (_A : MixedVariation hQ hC) (X : TopCat) :
    TauCeti.LocalCoefficientSystem ℚ X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj (ModuleCat.of ℚ VQ)

def MixedVariation.fiber (A : MixedVariation hQ hC) : MixedHodgeStructure hQ hC := A

abbrev MixedVariation.hom (A B : MixedVariation hQ hC) := MixedHodgeStructure.Hom A B

def MixedVariation.pullback (A : MixedVariation hQ hC) {X Y : TopCat} (_ : C(X,Y)) :
    MixedVariation hQ hC := A

def MixedVariation.ofPure {n : ℤ} (A : HodgeStructure hC n) : MixedVariation hQ hC :=
  MixedHodgeStructure.ofPure hQ hC A

/-- MixedVariationTest.pureWeight: the actual native concentrated W. -/
example {n k : ℤ} (A : HodgeStructure hC n) :
    (MixedVariation.ofPure (hQ := hQ) A).WQ k = if n ≤ k then ⊤ else ⊥ := by
  sorry

/-- MixedVariationTest.zero -/
example [Subsingleton VQ] (A : MixedVariation hQ hC) (k : ℤ) : A.WQ k = ⊥ := by
  sorry

/-- MixedVariationTest.nativeFiber: point morphisms are the SAME native Hom type. -/
example (A B : MixedVariation hQ hC) :
    MixedVariation.hom A B = MixedHodgeStructure.Hom A B := by
  sorry

def MixedVariation.graded (A : MixedVariation hQ hC) (k : ℤ) :
    HodgeStructure (TauCeti.isBaseChange_ratTensorMap ℂ (weightGradedRat A.WQ k)) k :=
  A.gradedHodgeStructure k

theorem MixedVariation.gradedFiber (A : MixedVariation hQ hC) (k : ℤ) :
    (A.graded k).F = gradedF hQ hC A.WQ A.WQ_monotone A.F k := by
  sorry

def MixedVariation.gradedMap {A B : MixedVariation hQ hC} (f : A.hom B) (k : ℤ) :
    HodgeStructure.Hom (A.graded k) (B.graded k) :=
  f.gradedHom k

/-- GradedVariationTest.pure -/
example {n : ℤ} (A : HodgeStructure hC n) :
    (MixedVariation.ofPure (hQ := hQ) A).WQ n = ⊤ ∧
    (MixedVariation.ofPure (hQ := hQ) A).WQ (n-1) = ⊥ := by
  sorry

/-- GradedVariationTest.otherWeight -/
example {n k : ℤ} (A : HodgeStructure hC n) (hk : k ≠ n) :
    Subsingleton (weightGradedRat (MixedVariation.ofPure (hQ := hQ) A).WQ k) := by
  sorry

/-- GradedVariationTest.native -/
example (A : MixedVariation hQ hC) (k : ℤ) : A.graded k = A.gradedHodgeStructure k := by
  sorry

/-- Rational graded polarization over a point. Actual rational forms and complex
base change are data; the fibre positivity condition is not an opaque predicate. -/
structure GradedPolarization (A : MixedVariation hQ hC) where
  rationalForm : ∀ k, LinearMap.BilinForm ℚ (weightGradedRat A.WQ k)
  complexForm : ∀ k, LinearMap.BilinForm ℂ (ℂ ⊗[ℚ] weightGradedRat A.WQ k)
  baseChange : ∀ k x y, complexForm k (1 ⊗ₜ[ℚ] x) (1 ⊗ₜ[ℚ] y) =
    (rationalForm k x y : ℂ)
  parity : ∀ k x y, rationalForm k y x = (k.negOnePow : ℚ) * rationalForm k x y
  nondegenerate : ∀ k, (rationalForm k).Nondegenerate
  orthogonal : ∀ k p, ∀ x ∈ (A.graded k).F p,
    ∀ y ∈ (A.graded k).F (k+1-p), complexForm k x y = 0
  positive : ∀ k p, ∀ x ∈ (A.graded k).piece p, x ≠ 0 →
    0 < (Complex.I ^ (2*p-k) * complexForm k x
      (latticeConj (TauCeti.isBaseChange_ratTensorMap ℂ (weightGradedRat A.WQ k)) x)).re

/-- Projection at a point; flatness of the family form is omitted (G1). -/
def GradedPolarization.gradedForm {A : MixedVariation hQ hC} (Q : GradedPolarization A)
    (k : ℤ) : LinearMap.BilinForm ℚ (weightGradedRat A.WQ k) := Q.rationalForm k

def GradedPolarization.pullback {A : MixedVariation hQ hC} (Q : GradedPolarization A)
    {X Y : TopCat} (_ : C(X,Y)) : GradedPolarization A := Q

/-- GradedPolarizationTest.tate: positivity on the actual (-1,-1) grade. -/
example {A : MixedVariation hQ hC} (Q : GradedPolarization A)
    (x : ℂ ⊗[ℚ] weightGradedRat A.WQ (-2))
    (hx : x ∈ (A.graded (-2)).piece (-1)) (hne : x ≠ 0) :
    0 < (Q.complexForm (-2) x
      (latticeConj (TauCeti.isBaseChange_ratTensorMap ℂ (weightGradedRat A.WQ (-2))) x)).re := by
  sorry

/-- GradedPolarizationTest.noWholeForm: two mixed weights cannot be a single
concentrated pure weight. This is the pointwise weight obstruction. -/
example {A : MixedVariation hQ hC} (_Q : GradedPolarization A)
    (hb : A.WQ (-2) ≠ ⊥) (ht : A.WQ (-2) ≠ ⊤) :
    ¬ ∃ n : ℤ, ∀ k, A.WQ k = if n ≤ k then ⊤ else ⊥ := by
  sorry

/-- GradedPolarizationTest.zeroGrade -/
example {A : MixedVariation hQ hC} (Q : GradedPolarization A) (k : ℤ)
    [Subsingleton (weightGradedRat A.WQ k)] : Q.gradedForm k = 0 := by
  sorry

/-- Native strictness regression: the fixed-part inclusion, when supplied as an
ACTUAL MHS morphism, is automatically strict. No existence theorem is faked. -/
example {A B : MixedVariation hQ hC} (f : A.hom B) (p : ℤ) :
    LinearMap.range f.toLinearMap ⊓ B.F p = (A.F p).map f.toLinearMap := by
  sorry
end Mixed

/-! Necessary algebraic residue/weight data; this is NOT the admissibility predicate.
The graded-centred quotient isomorphisms and holomorphic limiting flag are omitted
(G3–G5). A value of this structure therefore never licenses a global theorem. -/
section Disc
variable (V : Type u) [AddCommGroup V] [Module ℝ V]

structure AdmissibleDisc where
  N : Module.End ℝ V
  nilpotent : ∃ m : ℕ, N ^ m = 0
  W : ℤ → Submodule ℝ V
  W_monotone : Monotone W
  W_top : ∃ k, W k = ⊤
  W_bot : ∃ k, W k = ⊥
  M : ℤ → Submodule ℝ V
  M_monotone : Monotone M
  M_top : ∃ k, M k = ⊤
  M_bot : ∃ k, M k = ⊥
  preservesWeight : ∀ k, (W k).map N ≤ W k
  lowersRelative : ∀ k, (M k).map N ≤ M (k-2)
  F : ℤ → Submodule ℂ (ℂ ⊗[ℝ] V)
  F_antitone : Antitone F
  F_top : ∃ p, F p = ⊤
  F_bot : ∃ p, F p = ⊥

variable {V}

def AdmissibleDisc.limitFiltration (A : AdmissibleDisc V) := A.F

def AdmissibleDisc.relativeWeight (A : AdmissibleDisc V) := A.M

/-- Only the necessary algebraic data are ramified here. The admissibility
invariance theorem is omitted (G5), and not asserted for this partial carrier. -/
def AdmissibleDisc.finiteCover (A : AdmissibleDisc V) (e : ℕ) (_he : 0 < e) :
    AdmissibleDisc V := by
  sorry

/-- Necessary boundary data for the constant real weight-zero line. -/
def constantDiscLine : AdmissibleDisc ℝ := by
  sorry

/-- AdmissibleDiscTest.constant: explicit weight-zero boundary values. -/
example : constantDiscLine.N = 0 ∧ constantDiscLine.M 0 = ⊤ ∧
    constantDiscLine.M (-1) = ⊥ ∧ constantDiscLine.F 0 = ⊤ ∧
    constantDiscLine.F 1 = ⊥ := by
  sorry

/-- AdmissibleDiscTest.ramification: the explicitly retained algebraic part. -/
example (A : AdmissibleDisc V) (e : ℕ) (he : 0 < e) :
    (A.finiteCover e he).N = e • A.N := by
  sorry

/-- AdmissibleDiscTest.noRelative: exact linear obstruction, no variation assumed. -/
example (a e : V) (W M : ℤ → Submodule ℝ V) (N : Module.End ℝ V)
    (hM : M = W) (h0 : e ∈ W 0) (hbottom : W (-2) = ⊥)
    (hN : N e = a) (ha : a ≠ 0)
    (hlower : ∀ k, (M k).map N ≤ M (k-2)) : False := by
  sorry
end Disc

/-! Canonical extension rank-one local NORMAL-FORM data. Analytic O-bundles,
restriction and gluing are omitted (G1/G7), not asserted from a residue alone. -/
structure CanonicalExtension where
  residueValue : ℂ
  lower : 0 ≤ residueValue.re
  upper : residueValue.re < 1

def CanonicalExtension.residue (A : CanonicalExtension) : ℂ := A.residueValue

def lineMonodromy (a : ℂ) : ℂ := Complex.exp (-2 * Real.pi * Complex.I * a)

def CanonicalExtension.map (A B : CanonicalExtension) (c : ℂ)
    (_ : A.residue * c = c * B.residue) : ℂ →ₗ[ℂ] ℂ := by
  sorry

theorem CanonicalExtension.unique (A B : CanonicalExtension)
    (h : lineMonodromy A.residue = lineMonodromy B.residue) : A = B := by
  sorry

theorem CanonicalExtension.unipotentResidue (A : CanonicalExtension) :
    lineMonodromy A.residue = 1 ↔ A.residue = 0 := by
  sorry

/-- CanonicalExtensionTest.trivial -/
example : lineMonodromy 0 = 1 := by
  sorry

/-- CanonicalExtensionTest.minusOne -/
example : lineMonodromy (1/2) = -1 := by
  sorry

/-- CanonicalExtensionTest.integerShift -/
example : ¬ (0 ≤ (3/2 : ℂ).re ∧ (3/2 : ℂ).re < 1) := by
  sorry

/-- CanonicalExtensionTest.tensorCorrection -/
example : (3/4 : ℂ) + 3/4 - 1 = 1/2 ∧
    lineMonodromy ((3/4 : ℂ) + 3/4) = lineMonodromy (1/2) := by
  sorry

/-- Residue normalization on a ramified rank-one logarithmic chart. -/
theorem residue_monodromy_rankOne (a : ℂ) (e : ℕ) :
    lineMonodromy (e * a) = lineMonodromy a ^ e := by
  sorry

/-! Constant/product-family Gauss–Manin shadow. M is the supplied cohomology
module; this does not construct R^q f_* or pretend to prove de Rham comparison. -/
def GaussManin (R : Type u) [Ring R] (X : TopCat) (M : ModuleCat R) :
    TauCeti.LocalCoefficientSystem R X :=
  (TauCeti.LocalCoefficientSystem.constantFunctor X).obj M

namespace GaussManin
variable {R : Type u} [Ring R] {X Y : TopCat} (M : ModuleCat R)

/-- GaussManin.localSystem: constant-family specialization. -/
def localSystem (X : TopCat) : TauCeti.LocalCoefficientSystem R X := GaussManin R X M

/-- GaussManin.baseChange: native constant pullback comparison. -/
def baseChange (f : C(X,Y)) :
    (TauCeti.LocalCoefficientSystem.pullback f).obj (GaussManin R Y M) ≅
    GaussManin R X M := by
  sorry

/-- GaussManin.fiber: the supplied product-family cohomology fibre. -/
def fiber (x : X) : ((GaussManin R X M).obj (FundamentalGroupoid.mk x)) ≃ₗ[R] M := by
  sorry
end GaussManin

/-- GaussManinTest.product: constant cohomology data of a product family. -/
example {R : Type u} [Ring R] (X : TopCat) (M : ModuleCat R)
    (x : FundamentalGroupoid X) : (GaussManin R X M).obj x = M := by
  sorry

/-- GaussManinTest.degreeZero: the connected proper fibre's supplied H^0 is Q. -/
example (X : TopCat) (x : FundamentalGroupoid X) :
    (GaussManin ℚ X (ModuleCat.of ℚ ℚ)).obj x = ModuleCat.of ℚ ℚ := by
  sorry

/-- GaussManinTest.nativeTransport: native path transport is identity on the
constant family, not a second independently supplied transport action. -/
example {R : Type u} [Ring R] (X : TopCat) (M : ModuleCat R) (x : X)
    (γ : Path.Homotopic.Quotient x x) (v : M) :
    TauCeti.LocalCoefficientSystem.transport (GaussManin R X M) γ v = v := by
  sorry

/-! Fixed-part linear tests use native invariants. The full mixed-Hodge construction
and all of its signatures are omitted until global variation carriers exist. -/
section Invariants
variable {K G V : Type*} [Field K] [Group G] [AddCommGroup V] [Module K V]

/-- MixedFixedPartTest.constant: underlying linear assertion. -/
example : (Representation.trivial K G V).invariants = ⊤ := by
  sorry

/-- MixedFixedPartTest.nontrivialLine: no spurious fixed vector of a nontrivial character. -/
example (ρ : Representation K G K) (g : G) (h : ρ g 1 ≠ 1) : ρ.invariants = ⊥ := by
  sorry

/-- MixedFixedPartTest.nativeInvariant: exact native membership criterion. -/
example (ρ : Representation K G V) (v : V) :
    v ∈ ρ.invariants ↔ ∀ g, ρ g v = v := by
  sorry
end Invariants

end TauCeti.Hodge.Variation

/-! Planned signatures omitted until the indicated supplier/gap is supplied.
Each name appears here for review; these are mathematical specifications, NOT
opaque Lean declarations or predicates. The pointwise signatures above do not
assert the full global statements below.

MixedVariationTest.nonflatWeight (test; G1/G2)
On a disc the moving line span((1,z)) in the trivial rank-two flat bundle cannot serve as W_0, although it is a holomorphic line subbundle.

GradedPolarization.ofPure (api; G1/G2; L1/L2 requests)
On ofPure(V,n), a graded polarization is the pure polarization on V; zero other grades.

GradedPolarization.dual (api; G1/G2; L1/L2 requests)
The dual variation has weights −k, with the corresponding dual pure forms.

AdmissibleDisc.reparametrize (api; G1/G3/G4/G5)
Changing s by a holomorphic coordinate with nonzero derivative conjugates F_∞ by exp(cN) and leaves M unchanged.

AdmissibleDiscTest.essentialSingularity (test; G1/G3/G4/G5)
The Hodge–Tate extension with weights zero and two and period coordinate exp(1/s), T=1, has relative M=W but no limiting flag, hence is not admissible.

AdmissibleVariation (declaration; G1/G5/G6)
For a graded-polarizable real/rational VMHS on a smooth quasiprojective S with quasi-unipotent boundary monodromy, admissibility means that for every holomorphic disc map f:Δ→Sbar into a smooth SNC compactification with f(Δ*)⊂S, f*V satisfies the punctured-disc finite-cover criterion. Maps tangent to or meeting several boundary components are included. Kashiwara’s theorem makes this independent of the SNC compactification and stable under holomorphic pullback. This packet specifies the quasi-unipotent convention; its identification with the more general real mixed-Hodge-module convention used in LL24 for arbitrary unitary coefficients remains an explicit gap.

AdmissibleVariation.curveTest (api; G1/G5/G6)
Every permitted disc pullback is admissible.

AdmissibleVariation.pullback (api; G1/G5/G6)
Holomorphic pullback between smooth algebraic bases preserves admissibility, with all boundary arcs tested.

AdmissibleVariation.compactificationIndependent (api; G1/G5/G6)
The predicate is the same for any smooth SNC compactification.

AdmissibleVariation.constant (api; G1/G5/G6)
A constant graded-polarizable MHS gives an admissible variation.

AdmissibleVariationTest.point (test; G1/G5/G6)
Over a point a graded-polarizable MHS is admissible.

AdmissibleVariationTest.curve (test; G1/G5/G6)
On a smooth curve the definition is exactly admissibility at every puncture of its smooth completion.

AdmissibleVariationTest.productArc (test; G1/G5/G6)
For commuting unipotent boundary T_1,T_2, the arc (s^a,s^b) has N=aN_1+bN_2 and requires M(N,W), including a,b>0.

AdmissibleDisc.limitMixedHodgeStructure (declaration; G2/G3/G4)
For an admissible unipotent punctured-disc mixed variation, (V_R,M(N,W),F_∞) is a real MHS, N is a morphism to its Tate twist by −1 (equivalently type (−1,−1)), and the induced pure-graded limits agree with the imported monodromy filtrations centred at their original weights. This is a consequence of the two admissibility conditions, not a third independent axiom.

AdmissibleVariation.tensorHom (declaration; G1/G2/G3/G5; LPV.1 operations)
Admissible graded-polarizable real/rational variations are closed under tensor product, dual and internal Hom. Tensor W and F are convolution filtrations, N=N_V⊗1+1⊗N_U and relative M is the convolution of the relative filtrations; dual/Hom use the corresponding dual weight shifts and commutator N. The flat evaluation Hom(V,U)⊗V→U is a mixed-variation morphism. All statements are in the quasi-unipotent convention of this specification.

CanonicalExtension.restrict (api; G1/G7)
Restriction of (Ebar,∇bar) to U is the supplied flat bundle.

CanonicalExtension.exact (declaration; G1/G7)
For a fixed logarithm branch represented by 0≤Re(α)<1, canonical extension is exact on finite-rank complex local systems on a fixed SNC complement: a short exact sequence gives a short exact sequence of locally free logarithmic bundles with connection. The restriction identifications commute with all maps. Exactness does not imply compatibility with tensor products or ordinary dual bundles.

CanonicalExtension.residueMonodromy (declaration; G1/G7; rank-one scalar adapter is present)
In the commuting logarithmic frame ∇=d+Σ A_i dz_i/z_i of the canonical extension, positive local loops have T_i=exp(−2πi A_i). On a unipotent block N_i=log T_i=−2πi A_i. Under s=t^e, the pulled-back residue is eA; if its eigenvalues leave the strip, recanonicalization shifts them by integers. In the unipotent case no shift occurs and N becomes eN.

CanonicalExtension.unipotentTensor (declaration; G1; H.0 global tensor/dual suppliers)
For local systems with unipotent local monodromy on the same SNC complement, canonical extension commutes with tensor products, duals and internal Hom. Residues on the tensor are A⊗1+1⊗B, on the dual −A transpose, and on Hom B∘f−f∘A. They are nilpotent, so remain in the strip. These comparisons are coherent and restrict to the ordinary flat tensor/dual/Hom comparisons.

FilteredExtension (declaration; G1/G5/G8)
For an admissible unipotent mixed variation on Δ*, extend F by its untwisted limiting flag inside the canonical extension. The resulting Fbar^p are holomorphic subbundles, restrict to F^p, have locally free Gr^W Gr_F, and satisfy logarithmic transversality ∇bar Fbar^p⊂Fbar^(p−1)⊗Ω¹(log{0}). For quasi-unipotent monodromy use a finite cover and the corresponding canonical-eigenvalue normalization; the descended filtration is the intersection/saturated extension determined by the original F and Ebar, not an arbitrarily chosen limit flag. Global SNC gluing requires the multi-variable admissibility extension theorem, recorded separately as a gap.

FilteredExtension.restrict (api; G1/G5/G8)
Fbar^p restricts to F^p under the canonical extension identification.

FilteredExtension.limit (api; G1/G5/G8)
The fibre of Fbar at zero is the untwisted F_∞ in the unipotent frame.

FilteredExtension.graded (api; G1/G5/G8)
Weight-graded Fbar is the extended pure-graded filtration; intersections/quotients are locally free.

FilteredExtension.map (api; G1/G5/G8)
A mixed-variation map extends and preserves Fbar; identities/composites agree.

FilteredExtension.exact (api; G1/G5/G8)
Every Fbar^p sequence attached to a short exact sequence of admissible variations is exact.

FilteredExtensionTest.constant (test; G1/G5/G8)
For a constant type-(0,0) line, Fbar^0=O_Δ and Fbar^1=0.

FilteredExtensionTest.limit (test; G1/G5/G8)
For a unipotent nilpotent-orbit model F(z)=exp(zN)F_∞ satisfying admissibility, the untwisted Fbar is constant with fibre F_∞.

FilteredExtensionTest.noEssential (test; G1/G5/G8)
The period coordinate exp(1/s) Hodge–Tate example cannot be supplied as an admissible input.

canonicalLogComparison (declaration; G7; C5/E1 suppliers)
For U=X\D as above and its canonical analytic extension, the analytic logarithmic complex DR_log(Ebar)=[Ebar→Ebar⊗Ω¹_X(log D)→…] is quasi-isomorphic to Rj_*L. Thus H^q(X,DR_log(Ebar))≅H^q(U,L). The strip excludes positive integer residue eigenvalues, the hypothesis of the local comparison used in Del70 II.6.9–6.10. For an algebraic de Rham comparison one additionally supplies an algebraic regular-singular connection realizing L; II.6.2 does not cover an arbitrary irregular algebraic connection. The coefficient/log comparison engine belongs to ComplexComparisonPartII:C5; this node is its canonical-strip adapter.

GaussManin.deRhamEquiv (api; G1/G7; C5 relative-cohomology supplier)
Its associated holomorphic bundle is the relative analytic logarithmic de Rham hypercohomology bundle with the compared connection; algebraic analytification comparison additionally requires the specified regular-singular algebraic realization.

geometricPureVariation (declaration; G1/G9)
If f:X→S is smooth projective of relative dimension d over a smooth complex algebraic base with a relative ample class, the torsion-free degree-q integral cohomology local system with Hodge filtration induced from relative de Rham cohomology is a polarized integral VHS of weight q. Use the primitive Lefschetz decomposition and its signed cup-product forms to polarize the full cohomology. The fibre is the imported cohomological pure Hodge structure, the connection is Gauss–Manin, and Griffiths transversality holds. Projectivity/relative polarization is explicit; smooth proper complex fibres are not automatically treated as projective polarized ones.

unitaryCurveFiber (declaration; G2/G10/G11)
For a smooth projective complex curve C, reduced D, U=C\D, and finite-rank orthogonal real local system V_R with complexification V, H¹(U,V_R) has a functorial graded-polarizable real MHS with only weights 1 and 2. W_1 is the image of H¹(C,j_*V_R), W_2=H¹(U,V_R), and F¹ is the image of H⁰(C,Ebar⊗Ω¹_C(log D)) in logarithmic hypercohomology; F⁰=H_C, F²=0. Canonical extension uses [0,1). For arbitrary unitary complex V, apply realification V⊕V dual and project to V to obtain weight/Hodge/conjugate-Hodge filtrations, without asserting a real structure on H¹(U,V) itself.

unitaryCurveFamily (declaration; G1/G6/G15)
Let π:C→M be a smooth proper family of curves over a smooth quasiprojective base with disjoint sections D and U=C\D, and let V_R be a finite-rank orthogonal real local system on U. R¹π°_*V_R, its Gauss–Manin bundle and the fibrewise filtrations of the preceding node form a graded-polarizable real VMHS: W_1=R¹π_*j_*V_R included into R¹π°_*V_R, W_2 is the whole system, and F¹=im π_*(Ebar⊗Ω¹_(C/M)(log D)). Under quasi-unipotent boundary monodromy on M this is admissible in this specification’s finite-cover convention. LL24 asserts admissibility for arbitrary unitary real coefficients using real mixed Hodge modules; retaining that broader claim requires the recorded real-exponent convention gap and mixed-Hodge-module direct-image engine.

unitaryBigrading (declaration; G1/G2)
For the complex unitary curve cohomology system H_V of the preceding family, let conjugate F be induced using V dual ≅conjugate V. Define H^(1,0)=F¹∩W_1, H^(0,1)=conjugate F¹∩W_1 and H^(1,1)=F¹∩conjugate F¹. Then H_V is the direct sum of these three smooth subbundles; conjugation exchanges H_V^(p,q) with H_(V dual)^(q,p). In general these summands are not flat local subsystems.

curveCohomologyMHS (declaration; G1/G11)
For a smooth algebraic curve S with smooth projective completion Sbar and finite boundary, and an admissible graded-polarizable real/rational VMHS V, H^i(S,V) carries a natural functorial mixed Hodge structure. The evaluation H⁰(S,V)→V_s is a mixed Hodge morphism and its image is a mixed Hodge substructure independent of s under parallel transport. The comparison uses the logarithmic two-term complex of the canonical extension, with its Hodge filtration and the corrected boundary weight filtration; W is not simply the original coefficient W with no cohomological shift.

MixedFixedPart (declaration; G1/G2/G12)
For an admissible graded-polarizable real/rational VMHS V on a connected smooth quasiprojective S, the native monodromy invariant subspace I_s=(ρ_s).invariants≅H⁰(S,V) has the induced mixed Hodge structure W_k I=I∩W_k V_s, F^p I_C=I_C∩F^p V_s. These filtrations are independent of s under native path transport. The evaluation of the constant system I into V is a mixed-variation morphism; it identifies I with the largest constant sub-local system. Constancy of the underlying system alone does not supply the assertion without admissibility.

MixedFixedPart.structure (api; G1/G2/G12)
MHS on the native invariant module with induced W and F.

MixedFixedPart.evaluation (api; G1/G2/G12)
Strict injection of the constant invariant MHS system into V.

MixedFixedPart.transport (api; G1/G2/G12)
Native path transport identifies the MHS on I_s and I_t, independently of path on invariants.

MixedFixedPart.map (api; G1/G2/G12)
A mixed-variation morphism restricts to a mixed Hodge map of invariants; identity/composition laws.

MixedFixedPart.constantUniversal (api; G1/G2/G12)
Any mixed-variation map from a constant MHS factors uniquely through the evaluation map.

MixedFixedPartTest.twoWeights (test; G1/G2/G12)
For constant Q(0)⊕Q(1), the fixed MHS has weights zero and minus two; it is not a pure weight-zero Hodge structure.

complexFixedPart (declaration; G1/G13)
For a complex PVHS L on a connected smooth quasiprojective S, its invariant space H⁰(S,L) decomposes into constant Hodge types, and the flat inclusion of this constant complex polarized Hodge structure into L preserves the smooth decomposition. The induced Hermitian form is nondegenerate with the required type signs. This theorem does not assume a lattice or quasi-unipotent boundary monodromy.

complexSemisimple (declaration; G1/G14; RG1/RG6)
The underlying finite-rank complex local system of a complex PVHS on a smooth connected quasiprojective complex variety is semisimple. Consequently it is a finite direct sum of irreducible complex local systems, and its algebraic monodromy group is reductive. This is different from semisimplicity of the category of Hodge subobjects, and different from semisimplicity of the connected algebraic monodromy group.

isotypicHodge (declaration; G1/G14; RG1/RG4)
For a complex PVHS L on smooth connected quasiprojective S, write its semisimple local system as ⊕_i S_i⊗M_i with pairwise nonisomorphic irreducible S_i and M_i=Hom_loc(S_i,L). Each S_i supports a complex PVHS unique up to integral renumbering of the single Hodge index; choose its weight consistently with this renumbering. Each M_i then has a constant complex polarized Hodge structure and evaluation ⊕S_i⊗M_i→L is a Hodge isomorphism. For fixed total weight, shifts on S_i and M_i are opposite; a shift need not be an integral real Tate twist. The statement concerns complex type grading, without adding a real or integral structure.

IrreducibleRealForm (declaration; G1/G2; real-form/descent carrier)
Given an irreducible complex local system L occurring in the complexification of a graded-polarizable real VMHS, choose a pure weight-graded quotient in which L occurs and its complex PVHS from isotypic decomposition. If L admits an actual real form, choose that form and the compatible real Hodge grading (weight may be renumbered). Otherwise use the canonical real form of L⊕conjugate(L). Call the resulting real PVHS tilde L. A self-conjugate irreducible representation can be quaternionic; an isomorphism L≅conjugate L alone is not enough to choose the first branch. Choices are recorded and unique only up to the appropriate isomorphism/renumbering.

IrreducibleRealForm.variation (api; G1/G2; real-form/descent carrier)
Chosen real PVHS tilde L with the displayed branch.

IrreducibleRealForm.complexification (api; G1/G2; real-form/descent carrier)
Compare with L or L⊕conjugate L, respecting flat maps and Hodge type.

IrreducibleRealForm.choiceInvariant (api; G1/G2; real-form/descent carrier)
Changing real form or Hodge shift yields the corresponding isomorphism and compensating multiplicity Hodge shift, rather than literal equality.

IrreducibleRealFormTest.realLine (test; G1/G2; real-form/descent carrier)
A trivial complex line with chosen ordinary real form has real rank one in the first branch.

IrreducibleRealFormTest.nonrealCharacter (test; G1/G2; real-form/descent carrier)
A line character whose image is not contained in R* has no real form and yields a real rank-two doubled variation.

IrreducibleRealFormTest.quaternionic (test; G1/G2; real-form/descent carrier)
For an irreducible L with a conjugate-linear intertwiner J satisfying J²=−1 and no involutive one, self-conjugacy does not permit the real-form branch.

irreducibleEvaluation (declaration; G1/G2/G6)
Let V be an admissible graded-polarizable real VMHS on smooth connected quasiprojective S, and let irreducible complex L have Hom_loc(L,V_C)≠0. For the chosen tilde L, assuming its pure variation is admissible in the same convention, Q=H⁰(S,Hom(tilde L,V)) is a nonzero constant real MHS and the flat evaluation Q⊗tilde L→V is a nonzero mixed-variation morphism. Q is allowed to be mixed and the map is not asserted surjective. LL24 asserts the same conclusion in its general real-admissibility convention without the extra finite-cover hypothesis; matching those conventions is recorded as a gap.

AlgebraicMonodromy (declaration; G18; RG0/RG3)
For a finite-rank K-local system L, K=Q,R,C, on connected S with base point s, define G_mon(L,s) as the Zariski closure over K of the native representation π₁(S,s)→GL(L_s). Its geometric identity component G_mon° is used for connected-monodromy statements. The coefficient field, base point and fibre identification are retained; path transport identifies groups by conjugation. Passing to a finite connected topological cover replaces the image by a finite-index subgroup and leaves G_mon° unchanged. Generic closed subgroup schemes, geometric components and representation theory belong to ReductiveGroups.

AlgebraicMonodromy.group (api; G18; RG0/RG3)
The K-Zariski closure of native monodromy inside GL(L_s).

AlgebraicMonodromy.identityComponent (api; G18; RG0/RG3)
The geometric identity component with its K-form in characteristic zero.

AlgebraicMonodromy.transport (api; G18; RG0/RG3)
Path transport conjugates closures; composites give coherent conjugacies.

AlgebraicMonodromy.finiteCover (api promoted to /monodromy-finite-cover; G18; RG3/UniversalCovers Stage 2)
For a finite connected covering p:S′→S of connected locally path-connected spaces, finite-dimensional K-local-system pullback has the same geometric connected algebraic monodromy as L, after identifying the chosen fibres through p. K is Q,R or C. More generally any finite-index subgroup of the native monodromy group has Zariski closure with the same geometric identity component. No algebraic realization of an arbitrary cover is asserted.

AlgebraicMonodromy.invariants (api; G18; RG0/RG3)
A vector/tensor is fixed by the closure iff fixed by every native monodromy element.

AlgebraicMonodromyTest.trivial (test; G18; RG0/RG3)
A constant system has the trivial algebraic group.

AlgebraicMonodromyTest.finite (test; G18; RG0/RG3)
A line with image {1,−1} has finite closure μ₂ and trivial identity component.

AlgebraicMonodromyTest.unipotent (test; G18; RG0/RG3)
The Z representation m↦[[1,m],[0,1]] over Q has closure G_a, which is connected and unipotent.

AlgebraicMonodromyTest.unitaryInfinite (test; G18; RG0/RG3)
For the complex rank-one Z character m↦exp(2πiθm), θ irrational, the closure is G_m; unitarity does not force finite image or a semisimple connected algebraic group.

finiteDeterminant (declaration; G1/G16)
For a polarizable integral VHS on a smooth connected quasiprojective complex variety, every irreducible complex constituent of its underlying local system has finite-order determinant character. A merely complex or rational polarized variation without a preserved lattice does not satisfy this conclusion in general.

connectedMonodromySemisimple (declaration; G1/G14/G16/G18/G19)
For a polarizable integral VHS on a connected smooth quasiprojective complex variety, the geometric connected algebraic monodromy group G_mon° is semisimple. In particular this holds for the torsion-free cohomology local systems of smooth projective polarized families. Without a preserved lattice only reductivity follows from complex PVHS semisimplicity; an irrational unitary line has G_mon°=G_m.

mixedMonodromyRadical (declaration; G1/G17/G18)
For an admissible graded-polarizable integral VMHS on a connected smooth quasiprojective base, G_mon° has semisimple graded quotient and unipotent radical equal to the kernel of its action on ⊕_k Gr^W_k V. In particular its connected solvable radical is unipotent; the whole connected group need not be semisimple. Integral means a finite free Z-local system whose rational variation and W are as above; no integral splitting of W is assumed.
-/

end
end Layer3

/-! ## H.3 -/

section Layer4

-- Endomorphisms carry the commutator bracket in this layer.
attribute [local instance 100] LieRing.ofAssociativeRing

/-! ### H.3: signature boundary

Every proof below is a placeholder. The existing Hodge and period-point carriers
are imported. Generic manifold, variation and sheaf-cohomology interfaces are
supplier inputs, not new objects defined here. The omitted-signature ledger at
the end records precisely what cannot yet be typed against those interfaces.
-/

noncomputable section
open scoped BigOperators

namespace TauCeti.Hodge.PeriodGeometry

universe u v w
variable {W : Type u} [AddCommGroup W] [Module ℂ W]

/-- The rank of a filtration step, including negative indices. -/
def tailRank (h : HodgeType) (p : ℤ) : ℕ := ∑ᶠ r, if p ≤ r then h.h r else 0

/-- The first bilinear relation only; opposedness and positivity are not fields. -/
structure CompactDualFlag (h : HodgeType) (Q : LinearMap.BilinForm ℂ W) where
  finite_W : Module.Finite ℂ W
  F : ℤ → Submodule ℂ W
  antitone : Antitone F
  bounded_top : ∃ p, F p = ⊤
  bounded_bot : ∃ p, F p = ⊥
  rank_eq : ∀ p, Module.finrank ℂ (F p) = tailRank h p
  orthogonal : ∀ p, ∀ x ∈ F p, ∀ y ∈ F (h.weight + 1 - p), Q x y = 0

namespace CompactDualFlag
variable {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}

theorem ext {A B : CompactDualFlag h Q} (he : ∀ p, A.F p = B.F p) : A = B := by
  sorry

theorem rank (A : CompactDualFlag h Q) (p : ℤ) :
    Module.finrank ℂ (A.F p) = tailRank h p := by
  sorry

def transport (e : W ≃ₗ[ℂ] W) (he : ∀ x y, Q (e x) (e y) = Q x y)
    (A : CompactDualFlag h Q) : CompactDualFlag h Q := by
  sorry

theorem transport_F (e : W ≃ₗ[ℂ] W) (he : ∀ x y, Q (e x) (e y) = Q x y)
    (A : CompactDualFlag h Q) (p : ℤ) :
    (transport e he A).F p = (A.F p).map e.toLinearMap := by
  sorry

theorem transport_one (A : CompactDualFlag h Q) :
    transport (LinearEquiv.refl ℂ W) (by intros; rfl) A = A := by
  sorry

theorem transport_comp (e f : W ≃ₗ[ℂ] W)
    (he : ∀ x y, Q (e x) (e y) = Q x y) (hf : ∀ x y, Q (f x) (f y) = Q x y)
    (hef : ∀ x y, Q ((f.trans e) x) ((f.trans e) y) = Q x y)
    (A : CompactDualFlag h Q) :
    transport (f.trans e) hef A = transport e he (transport f hf A) := by
  sorry

def grassmannian [FiniteDimensional ℂ W] (A : CompactDualFlag h Q) (p : ℤ) :
    Module.Grassmannian ℂ W (Module.finrank ℂ W - tailRank h p) := by
  sorry

theorem grassmannian_submodule [FiniteDimensional ℂ W] (A : CompactDualFlag h Q) (p : ℤ) :
    (A.grassmannian p).toSubmodule = A.F p := by
  sorry
end CompactDualFlag

/- Concrete test fixtures. These specify actual filtrations and forms. -/
def zeroType : HodgeType where
  weight := 0
  h := fun _ => 0
  finite_support := by sorry
  symm := by sorry
def zeroFlag : CompactDualFlag zeroType (0 : LinearMap.BilinForm ℂ (Fin 0 → ℂ)) := by
  sorry
def tateFlag (m : ℤ) : CompactDualFlag (tateHodgeType m) (LinearMap.mul ℂ ℂ) := by
  sorry
def weightOneType : HodgeType where
  weight := 1
  h := fun p => if p = 0 ∨ p = 1 then 1 else 0
  finite_support := by sorry
  symm := by sorry
abbrev Plane := Fin 2 → ℂ
def e1 : Plane := ![1, 0]
def e2 : Plane := ![0, 1]
def alternatingForm : LinearMap.BilinForm ℂ Plane := by
  sorry
def realLineFlag : CompactDualFlag weightOneType alternatingForm := by
  sorry
theorem realLineFlag_F (p : ℤ) : realLineFlag.F p =
    if p ≤ 0 then ⊤ else if p = 1 then Submodule.span ℂ {e1} else ⊥ := by
  sorry
theorem alternatingForm_apply (x y : Plane) :
    alternatingForm x y = x 0 * y 1 - x 1 * y 0 := by
  sorry
theorem weightOneType_h (p : ℤ) : weightOneType.h p = if p = 0 ∨ p = 1 then 1 else 0 := by
  sorry
theorem weightOneType_weight : weightOneType.weight = 1 := by sorry
theorem zeroType_h (p : ℤ) : zeroType.h p = 0 := by sorry

-- compactDual_tate
example (m p : ℤ) : (tateFlag m).F p = if p ≤ -m then ⊤ else ⊥ := by sorry
-- compactDual_zero: no positivity or nonzero-dimension condition is imposed.
example (A : CompactDualFlag zeroType (0 : LinearMap.BilinForm ℂ (Fin 0 → ℂ))) :
    A = zeroFlag := by sorry
-- compactDual_realLine: the compact dual includes a non-opposed real line.
example : realLineFlag.F 1 = Submodule.span ℂ {e1} ∧
    ¬ IsCompl (realLineFlag.F 1)
      ((realLineFlag.F 1).map (by
        exact { toFun := fun x i => star (x i)
                map_add' := by intros; ext; simp
                map_smul' := by intros; ext; simp } : Plane →ₛₗ[starRingEnd ℂ] Plane)) := by
  sorry

section NativePoints
variable {V : Type v} [AddCommGroup V] [Module.Free ℤ V] [Module.Finite ℤ V]
variable {ι : V →ₗ[ℤ] W} (hC : IsBaseChange ℂ ι)
variable (n : ℤ) (Qint : LinearMap.BilinForm ℤ V) (h : HodgeType)

def toCompactDual (D : PeriodDomain.Point hC n Qint h) :
    CompactDualFlag h (integralFormBaseChange hC Qint) := by
  sorry

theorem toCompactDual_F (D : PeriodDomain.Point hC n Qint h) (p : ℤ) :
    (toCompactDual hC n Qint h D).F p = D.hs.F p := by sorry

theorem toCompactDual_injective : Function.Injective (toCompactDual hC n Qint h) := by
  sorry

def transportPoint (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) =
      integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) : PeriodDomain.Point hC n Qint h := by
  sorry

theorem transportPoint_F (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) =
      integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) (p : ℤ) :
    (transportPoint hC n Qint h e hc hq D).hs.F p = (D.hs.F p).map e.toLinearMap := by
  sorry

theorem transportPoint_one_comp
    (e f : W ≃ₗ[ℂ] W)
    (hc_e : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hc_f : ∀ x, f (latticeConj hC x) = latticeConj hC (f x))
    (hc_ef : ∀ x, (f.trans e) (latticeConj hC x) = latticeConj hC ((f.trans e) x))
    (hq_e : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (hq_f : ∀ x y, integralFormBaseChange hC Qint (f x) (f y) = integralFormBaseChange hC Qint x y)
    (hq_ef : ∀ x y, integralFormBaseChange hC Qint ((f.trans e) x) ((f.trans e) y) =
      integralFormBaseChange hC Qint x y) (D : PeriodDomain.Point hC n Qint h) :
    transportPoint hC n Qint h (LinearEquiv.refl ℂ W) (by intros; rfl) (by intros; rfl) D = D ∧
    transportPoint hC n Qint h (f.trans e) hc_ef hq_ef D =
      transportPoint hC n Qint h e hc_e hq_e (transportPoint hC n Qint h f hc_f hq_f D) := by
  sorry

theorem transportPoint_compactDual (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) :
    toCompactDual hC n Qint h (transportPoint hC n Qint h e hc hq D) =
      CompactDualFlag.transport e hq (toCompactDual hC n Qint h D) := by sorry

-- toCompactDual_fixedForm
example (D : PeriodDomain.Point hC n Qint h) (p : ℤ)
    (x y : W) (hx : x ∈ (toCompactDual hC n Qint h D).F p)
    (hy : y ∈ (toCompactDual hC n Qint h D).F (h.weight + 1 - p)) :
    integralFormBaseChange hC Qint x y = 0 := by sorry
-- toCompactDual_separates
example (A B : PeriodDomain.Point hC n Qint h) (p : ℤ) (hne : A.hs.F p ≠ B.hs.F p) :
    toCompactDual hC n Qint h A ≠ toCompactDual hC n Qint h B := by sorry
-- transportPoint_one
example (D : PeriodDomain.Point hC n Qint h) :
    transportPoint hC n Qint h (LinearEquiv.refl ℂ W) (by intros; rfl) (by intros; rfl) D = D := by
  sorry
-- transportPoint_inverse: inverse witnesses are supplied explicitly.
example (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hci : ∀ x, e.symm (latticeConj hC x) = latticeConj hC (e.symm x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (hqi : ∀ x y, integralFormBaseChange hC Qint (e.symm x) (e.symm y) = integralFormBaseChange hC Qint x y)
    (D : PeriodDomain.Point hC n Qint h) :
    transportPoint hC n Qint h e.symm hci hqi (transportPoint hC n Qint h e hc hq D) = D := by
  sorry

/-- Point assembly after an imported flat marking; no variation carrier is defined. -/
def markedPeriodMap {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) : B → PeriodDomain.Point hC n Qint h := by
  sorry

theorem markedPeriodMap_F {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) (b : B) (p : ℤ) :
    (markedPeriodMap hC n Qint h hs hw pol hn b).hs.F p = (hs b).F p := by sorry

theorem markedPeriodMap_compactDual {B : Type w} (hs : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p) (b : B) :
    (toCompactDual hC n Qint h (markedPeriodMap hC n Qint h hs hw pol hn b)).F = (hs b).F := by
  sorry
theorem markedPeriodMap_changeMarking {B : Type w}
    (hs hs' : B → HodgeStructure hC n) (hw : h.weight = n)
    (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (pol' : ∀ b, IsPolarization hC (hs' b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p)
    (hn' : ∀ b p, (hs' b).hodgeNumber p = h.h p)
    (e : W ≃ₗ[ℂ] W)
    (hc : ∀ x, e (latticeConj hC x) = latticeConj hC (e x))
    (hq : ∀ x y, integralFormBaseChange hC Qint (e x) (e y) = integralFormBaseChange hC Qint x y)
    (hF : ∀ b p, (hs' b).F p = ((hs b).F p).map e.toLinearMap) (b : B) :
    markedPeriodMap hC n Qint h hs' hw pol' hn' b =
      transportPoint hC n Qint h e hc hq (markedPeriodMap hC n Qint h hs hw pol hn b) := by
  sorry

-- markedPeriod_constant
example {B : Type w} (D : PeriodDomain.Point hC n Qint h) (b : B) :
    markedPeriodMap hC n Qint h (fun _ : B => D.hs) D.htype_weight
      (fun _ => D.pol) (fun _ => D.hodge_numbers) b = D := by sorry
-- markedPeriod_steps
example {B : Type w} (hs hs' : B → HodgeStructure hC n)
    (hw : h.weight = n) (pol : ∀ b, IsPolarization hC (hs b) Qint)
    (pol' : ∀ b, IsPolarization hC (hs' b) Qint)
    (hn : ∀ b p, (hs b).hodgeNumber p = h.h p)
    (hn' : ∀ b p, (hs' b).hodgeNumber p = h.h p) (b : B) (p : ℤ)
    (hne : (hs b).F p ≠ (hs' b).F p) :
    markedPeriodMap hC n Qint h hs hw pol hn b ≠
      markedPeriodMap hC n Qint h hs' hw pol' hn' b := by sorry
end NativePoints

def minusIdentity : ℂ ≃ₗ[ℂ] ℂ := by sorry
theorem minusIdentity_apply (x : ℂ) : minusIdentity x = -x := by sorry
-- transportPoint_tateMinus
example (m : ℤ)
    (hc : ∀ x, minusIdentity (latticeConj isBaseChange_tateLatticeMap x) =
      latticeConj isBaseChange_tateLatticeMap (minusIdentity x))
    (hq : ∀ x y, integralFormBaseChange isBaseChange_tateLatticeMap (LinearMap.mul ℤ ℤ)
      (minusIdentity x) (minusIdentity y) =
      integralFormBaseChange isBaseChange_tateLatticeMap (LinearMap.mul ℤ ℤ) x y) :
    transportPoint isBaseChange_tateLatticeMap (-2*m) (LinearMap.mul ℤ ℤ) (tateHodgeType m)
      minusIdentity hc hq (tatePoint m) = tatePoint m := by sorry

-- toCompactDual_tate
example (m p : ℤ) :
    (toCompactDual isBaseChange_tateLatticeMap (-2*m) (LinearMap.mul ℤ ℤ)
      (tateHodgeType m) (tatePoint m)).F p = if p ≤ -m then ⊤ else ⊥ := by sorry
-- markedPeriod_tate
example (m : ℤ) (b : Unit) :
    markedPeriodMap isBaseChange_tateLatticeMap (-2*m) (LinearMap.mul ℤ ℤ) (tateHodgeType m)
      (fun _ : Unit => tate m) (tateHodgeType_weight m) (fun _ => isPolarization_tate m)
      (by intros; sorry) b = tatePoint m := by sorry

/- Orbit carriers use supplied represented actions. The real carrier is on native
points; the complex carrier is on compact-dual flags. Algebraic groups, their
representations, normalization and connected components are not redefined here.
-/
section Orbits
variable {G : Type v} [Group G]

abbrev RealPeriodOrbit {V : Type u} {W : Type w} [AddCommGroup V]
    [Module.Free ℤ V] [Module.Finite ℤ V] [AddCommGroup W] [Module ℂ W]
    {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {n : ℤ}
    {Qint : LinearMap.BilinForm ℤ V} {h : HodgeType}
    [MulAction G (PeriodDomain.Point hC n Qint h)]
    (a : PeriodDomain.Point hC n Qint h) := ↥(MulAction.orbit G a)

abbrev ComplexPeriodOrbit {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    [MulAction G (CompactDualFlag h Q)] (a : CompactDualFlag h Q) := ↥(MulAction.orbit G a)

namespace RealPeriodOrbit
variable {V : Type u} {W : Type w} [AddCommGroup V]
    [Module.Free ℤ V] [Module.Finite ℤ V] [AddCommGroup W] [Module ℂ W]
    {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {n : ℤ}
    {Qint : LinearMap.BilinForm ℤ V} {h : HodgeType}
    [MulAction G (PeriodDomain.Point hC n Qint h)]
theorem mem_iff (a x : PeriodDomain.Point hC n Qint h) :
    x ∈ MulAction.orbit G a ↔ ∃ g : G, g • a = x := by sorry
def base (a : PeriodDomain.Point hC n Qint h) : RealPeriodOrbit (G := G) a := by sorry
def rebase (a : PeriodDomain.Point hC n Qint h) (g : G) :
    RealPeriodOrbit (G := G) (g • a) ≃ RealPeriodOrbit (G := G) a := by sorry
theorem rebase_val (a : PeriodDomain.Point hC n Qint h) (g : G)
    (x : RealPeriodOrbit (G := G) (g • a)) : (rebase a g x).val = x.val := by sorry
def inclusion (a : PeriodDomain.Point hC n Qint h) :
    RealPeriodOrbit (G := G) a ↪ PeriodDomain.Point hC n Qint h := by sorry
-- realOrbit_trivial
example [Subsingleton G] (a x : PeriodDomain.Point hC n Qint h) :
    x ∈ MulAction.orbit G a ↔ x = a := by sorry
-- realOrbit_baseChange
example (a : PeriodDomain.Point hC n Qint h) (g : G) :
    MulAction.orbit G (g • a) = MulAction.orbit G a := by sorry
end RealPeriodOrbit

namespace ComplexPeriodOrbit
variable {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    [MulAction G (CompactDualFlag h Q)]
theorem mem_iff (a x : CompactDualFlag h Q) :
    x ∈ MulAction.orbit G a ↔ ∃ g : G, g • a = x := by sorry
def rebase (a : CompactDualFlag h Q) (g : G) :
    ComplexPeriodOrbit (G := G) (g • a) ≃ ComplexPeriodOrbit (G := G) a := by sorry
theorem rebase_val (a : CompactDualFlag h Q) (g : G)
    (x : ComplexPeriodOrbit (G := G) (g • a)) : (rebase a g x).val = x.val := by sorry
def inclusion (a : CompactDualFlag h Q) : ComplexPeriodOrbit (G := G) a ↪ CompactDualFlag h Q := by
  sorry
-- complexOrbit_trivial
example [Subsingleton G] (a x : CompactDualFlag h Q) : x ∈ MulAction.orbit G a ↔ x = a := by sorry
-- complexOrbit_transitive
example (a : CompactDualFlag h Q) (ht : ∀ x : CompactDualFlag h Q, ∃ g : G, g • a = x) :
    Function.Surjective (inclusion (G := G) a) := by sorry
end ComplexPeriodOrbit
end Orbits

section ExponentialCoordinates
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
variable {G : Type v} [Group G] {h : HodgeType} {Q : LinearMap.BilinForm ℂ E}
    [MulAction G (CompactDualFlag h Q)]
/-- Supplied represented exponential, not an assumed local inverse. The complex
Lie supplier identifies expG with the matrix exponential in the representation;
the displayed equation is genuine matrix-exponential compatibility. -/
def negativeOrbitMap (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (_hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (F0 : CompactDualFlag h Q) : q → ComplexPeriodOrbit (G := G) F0 := by sorry

theorem negativeOrbitMap_zero (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (he0 : expG 0 = 1) (F0 : CompactDualFlag h Q) :
    (negativeOrbitMap q expG rho hexp F0 0).val = F0 := by sorry

theorem negativeOrbitMap_F (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (ha : ∀ g (F : CompactDualFlag h Q) p, (g • F).F p = (F.F p).map (rho g).toLinearMap)
    (F0 : CompactDualFlag h Q) (X : q) (p : ℤ) :
    (negativeOrbitMap q expG rho hexp F0 X).val.F p = (F0.F p).map (rho (expG X)).toLinearMap := by
  sorry
theorem negativeOrbitMap_rebase
    (q q' : Submodule ℂ (E →L[ℂ] E)) (A : q ≃ₗ[ℂ] q')
    (expG : q → G) (expG' : q' → G) (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (hexp' : ∀ X : q', ∀ w, rho (expG' X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (g : G) (hAd : ∀ X, expG' (A X) = g * expG X * g⁻¹)
    (F0 : CompactDualFlag h Q) (X : q) :
    g • (negativeOrbitMap q expG rho hexp F0 X).val =
      (negativeOrbitMap q' expG' rho hexp' (g • F0) (A X)).val := by sorry

-- negativeOrbit_zero
example (q : Submodule ℂ (E →L[ℂ] E)) (expG : q → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : q, ∀ w, rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (he0 : expG 0 = 1) (F0 : CompactDualFlag h Q) :
    (negativeOrbitMap q expG rho hexp F0 0).val = F0 := by sorry
-- negativeOrbit_scalar: the negative complement of a Tate structure is zero.
example (expG : (⊥ : Submodule ℂ (E →L[ℂ] E)) → G)
    (rho : G →* (E ≃ₗ[ℂ] E))
    (hexp : ∀ X : (⊥ : Submodule ℂ (E →L[ℂ] E)), ∀ w,
      rho (expG X) w = NormedSpace.exp (X : E →L[ℂ] E) w)
    (he0 : expG 0 = 1) (F0 : CompactDualFlag h Q)
    (X : (⊥ : Submodule ℂ (E →L[ℂ] E))) :
    (negativeOrbitMap ⊥ expG rho hexp F0 X).val = F0 := by sorry
end ExponentialCoordinates

/-- Continuous version of the explicit square-zero lowering operator. -/
def lowerContinuous : Plane →L[ℂ] Plane := by sorry
theorem lowerContinuous_apply (x : Plane) : lowerContinuous x = ![0, x 0] := by sorry

-- negativeOrbit_shear: the representation and its action are supplied literally.
example {G : Type v} [Group G] [MulAction G (CompactDualFlag weightOneType alternatingForm)]
    (q : Submodule ℂ (Plane →L[ℂ] Plane)) (hN : lowerContinuous ∈ q)
    (expG : q → G) (rho : G →* (Plane ≃ₗ[ℂ] Plane))
    (hexp : ∀ X : q, ∀ x, rho (expG X) x = NormedSpace.exp (X : Plane →L[ℂ] Plane) x)
    (ha : ∀ g (F : CompactDualFlag weightOneType alternatingForm) p,
      (g • F).F p = (F.F p).map (rho g).toLinearMap) (t : ℂ) :
    (negativeOrbitMap q expG rho hexp realLineFlag ⟨t • lowerContinuous, q.smul_mem t hN⟩).val.F 1 =
      Submodule.span ℂ {e1 + t • e2} ∧
    (t ≠ 0 →
      (negativeOrbitMap q expG rho hexp realLineFlag ⟨t • lowerContinuous, q.smul_mem t hN⟩).val.F 1 ≠
        realLineFlag.F 1) := by sorry

/-- Filtration on the represented Lie subalgebra, with all integer indices. -/
def lieFiltration {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) (a : ℤ) : Submodule ℂ g := by
  sorry

theorem mem_lieFiltration {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) (a : ℤ) (X : g) :
    X ∈ lieFiltration F g a ↔ ∀ p, ∀ x ∈ F.F p, (X : Module.End ℂ W) x ∈ F.F (p+a) := by
  sorry

theorem lieFiltration_antitone {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) :
    Antitone (lieFiltration F g) := by sorry

theorem lieFiltration_bracket {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) (a b : ℤ)
    (X Y : g) (hx : X ∈ lieFiltration F g a) (hy : Y ∈ lieFiltration F g b) :
    ⁅X,Y⁆ ∈ lieFiltration F g (a+b) := by sorry

def lower : Module.End ℂ Plane := by sorry
theorem lower_apply (x : Plane) : lower x = ![0, x 0] := by sorry
-- lieFiltration_lower
example : (⟨lower, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ Plane))) ∈
    lieFiltration realLineFlag ⊤ (-1) ∧
    (⟨lower, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ Plane))) ∉
    lieFiltration realLineFlag ⊤ 0 := by sorry
-- lieFiltration_zero
example {h : HodgeType} {Q : LinearMap.BilinForm ℂ W} (F : CompactDualFlag h Q) (a : ℤ) :
    lieFiltration F (⊥ : LieSubalgebra ℂ (Module.End ℂ W)) a = ⊥ := by sorry
-- lieFiltration_one
example (m : ℤ) :
    (⟨LinearMap.id, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ ℂ))) ∈
      lieFiltration (tateFlag m) ⊤ 0 ∧
    (⟨LinearMap.id, by simp⟩ : (⊤ : LieSubalgebra ℂ (Module.End ℂ ℂ))) ∉
      lieFiltration (tateFlag m) ⊤ 1 := by sorry

-- negativeOrbit_scalar (the actual Tate grading makes its negative complement zero)
example (m a : ℤ) : lieFiltration (tateFlag m) (⊤ : LieSubalgebra ℂ (Module.End ℂ ℂ)) a =
    if a ≤ 0 then ⊤ else ⊥ := by sorry

/-- Fibre of the horizontal tangent distribution. -/
def horizontalSubspace {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) :
    Submodule ℂ (g ⧸ lieFiltration F g 0) :=
  (lieFiltration F g (-1)).map (lieFiltration F g 0).mkQ

theorem horizontalSubspace_mem {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W))
    (x : g ⧸ lieFiltration F g 0) : x ∈ horizontalSubspace F g ↔
    ∃ X : g, (∀ p, ∀ v ∈ F.F p, (X : Module.End ℂ W) v ∈ F.F (p-1)) ∧
      (lieFiltration F g 0).mkQ X = x := by sorry

def horizontalSubspace_quotient {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W)) :
    ((lieFiltration F g (-1)) ⧸
      (lieFiltration F g 0).comap (lieFiltration F g (-1)).subtype) ≃ₗ[ℂ]
        horizontalSubspace F g := by sorry

theorem horizontalSubspace_quotient_apply {h : HodgeType} {Q : LinearMap.BilinForm ℂ W}
    (F : CompactDualFlag h Q) (g : LieSubalgebra ℂ (Module.End ℂ W))
    (X : lieFiltration F g (-1)) :
    (horizontalSubspace_quotient F g
      (((lieFiltration F g 0).comap (lieFiltration F g (-1)).subtype).mkQ X)).val =
      (lieFiltration F g 0).mkQ X.val := by sorry

theorem horizontalSubspace_transport {h h' : HodgeType}
    {Q Q' : LinearMap.BilinForm ℂ W} (F : CompactDualFlag h Q) (F' : CompactDualFlag h' Q')
    (g g' : LieSubalgebra ℂ (Module.End ℂ W)) (A : g ≃ₗ[ℂ] g')
    (h0 : (lieFiltration F g 0).map A.toLinearMap = lieFiltration F' g' 0)
    (hm : (lieFiltration F g (-1)).map A.toLinearMap = lieFiltration F' g' (-1)) :
    (horizontalSubspace F g).map
      (Submodule.Quotient.equiv (lieFiltration F g 0) (lieFiltration F' g' 0) A h0).toLinearMap =
      horizontalSubspace F' g' := by sorry

-- horizontal_tate
example (m : ℤ) : horizontalSubspace (tateFlag m) ⊤ = ⊥ := by sorry
-- horizontal_weightOne
example : horizontalSubspace realLineFlag ⊤ = ⊤ ∧
    Module.finrank ℂ ((⊤ : LieSubalgebra ℂ (Module.End ℂ Plane)) ⧸
      lieFiltration realLineFlag ⊤ 0) = 1 := by sorry

/- A five-dimensional symmetric-form fixture separates grade −2 from horizontal
grade −1. These are concrete linear-algebra data, with no manifold carrier. -/
abbrev FiveSpace := Fin 5 → ℂ
def fiveE1 : FiveSpace := ![1, 0, 0, 0, 0]
def fiveE2 : FiveSpace := ![0, 1, 0, 0, 0]
def fiveE3 : FiveSpace := ![0, 0, 1, 0, 0]
def twoStepType : HodgeType where
  weight := 2
  h := fun p => if p = 0 ∨ p = 2 then 2 else if p = 1 then 1 else 0
  finite_support := by sorry
  symm := by sorry
def twoStepForm : LinearMap.BilinForm ℂ FiveSpace := by sorry
theorem twoStepForm_apply (x y : FiveSpace) :
    twoStepForm x y = -(x 0 * y 3 + x 3 * y 0 + x 1 * y 4 + x 4 * y 1) + x 2 * y 2 := by sorry
def twoStepFlag : CompactDualFlag twoStepType twoStepForm := by sorry
theorem twoStepFlag_F (p : ℤ) : twoStepFlag.F p =
    if p ≤ 0 then ⊤ else if p = 1 then Submodule.span ℂ {fiveE1, fiveE2, fiveE3}
    else if p = 2 then Submodule.span ℂ {fiveE1, fiveE2} else ⊥ := by sorry
def twoStepLie : LieSubalgebra ℂ (Module.End ℂ FiveSpace) := by sorry
theorem twoStepLie_mem_iff (X : Module.End ℂ FiveSpace) :
    X ∈ twoStepLie ↔ ∀ x y, twoStepForm (X x) y + twoStepForm x (X y) = 0 := by sorry
def twoStepLowerEnd : Module.End ℂ FiveSpace := by sorry
theorem twoStepLowerEnd_apply (x : FiveSpace) :
    twoStepLowerEnd x = ![0, 0, 0, -x 1, x 0] := by sorry
def twoStepLower : twoStepLie := ⟨twoStepLowerEnd, by sorry⟩
-- horizontal_twoStep
example :
    let c := (lieFiltration twoStepFlag twoStepLie 0).mkQ twoStepLower;
    c ≠ 0 ∧ c ∉ horizontalSubspace twoStepFlag twoStepLie ∧
      twoStepLower ∈ lieFiltration twoStepFlag twoStepLie (-2) := by sorry

/-- Quotient of a supplied lift jet. Geometry identifies this with dP. -/
def periodSymbol {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) : T →ₗ[ℂ] (S →ₗ[ℂ] W ⧸ S) := by
  sorry
theorem periodSymbol_apply {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) (v : T) (s : S) :
    periodSymbol S J v s = S.mkQ (J v s) := by sorry
theorem periodSymbol_liftCorrection {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J K : T →ₗ[ℂ] (S →ₗ[ℂ] W))
    (hk : ∀ v s, K v s ∈ S) : periodSymbol S (J+K) = periodSymbol S J := by sorry

theorem periodSymbol_frame {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (e : W ≃ₗ[ℂ] W)
    (J : T →ₗ[ℂ] (S →ₗ[ℂ] W))
    (J' : T →ₗ[ℂ] ((S.map e.toLinearMap) →ₗ[ℂ] W))
    (hJ : ∀ v s, J' v (e.submoduleMap S s) = e (J v s)) (v : T) (x : S) :
    Submodule.Quotient.equiv S (S.map e.toLinearMap) e rfl (periodSymbol S J v x) =
      periodSymbol (S.map e.toLinearMap) J' v (e.submoduleMap S x) := by sorry

theorem periodSymbol_kernel {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W)) (v : T) :
    periodSymbol S J v = 0 ↔ ∀ s : S, J v s ∈ S := by sorry
-- periodSymbol_preserving
example {T : Type v} [AddCommGroup T] [Module ℂ T]
    (S : Submodule ℂ W) (J : T →ₗ[ℂ] (S →ₗ[ℂ] W))
    (hp : ∀ v s, J v s ∈ S) : periodSymbol S J = 0 := by sorry
-- periodSymbol_zeroStep
example {T : Type v} [AddCommGroup T] [Module ℂ T]
    (J : T →ₗ[ℂ] ((⊥ : Submodule ℂ W) →ₗ[ℂ] W)) : periodSymbol ⊥ J = 0 := by sorry
-- periodSymbol_zeroStep (the full-step case)
example {T : Type v} [AddCommGroup T] [Module ℂ T]
    (J : T →ₗ[ℂ] ((⊤ : Submodule ℂ W) →ₗ[ℂ] W)) : periodSymbol ⊤ J = 0 := by sorry
def shearJet : ℂ →ₗ[ℂ] ((Submodule.span ℂ {e1}) →ₗ[ℂ] Plane) := by sorry
theorem shearJet_apply (t : ℂ) (s : Submodule.span ℂ {e1}) :
    shearJet t s = t • lower s.val := by sorry
-- periodSymbol_shear
example (he : e1 ∈ Submodule.span ℂ {e1}) :
    periodSymbol (Submodule.span ℂ {e1}) shearJet 1 ⟨e1, he⟩ =
      (Submodule.span ℂ {e1}).mkQ e2 ∧ (Submodule.span ℂ {e1}).mkQ e2 ≠ 0 := by sorry

namespace AbelianPeriod
variable {g : ℕ}
def normalize (A B : Matrix (Fin g) (Fin g) ℂ) (_hA : IsUnit A.det) :
    Matrix (Fin g) (Fin g) ℂ := A⁻¹ * B
theorem normalize_one (B : Matrix (Fin g) (Fin g) ℂ) (hI : IsUnit (1 : Matrix (Fin g) (Fin g) ℂ).det) :
    normalize 1 B hI = B := by sorry
theorem frame (A B C : Matrix (Fin g) (Fin g) ℂ) (hA : IsUnit A.det) (hC : IsUnit C.det)
    (hCA : IsUnit (C*A).det) : normalize (C*A) (C*B) hCA = normalize A B hA := by sorry
private def rowPlane (A B : Matrix (Fin g) (Fin g) ℂ) :
    Submodule ℂ ((Fin g → ℂ) × (Fin g → ℂ)) :=
  Submodule.span ℂ (Set.range fun i => (A i, B i))
theorem graph (A B : Matrix (Fin g) (Fin g) ℂ) (hA : IsUnit A.det) :
    rowPlane A B = rowPlane 1 (normalize A B hA) ∧
    Module.finrank ℂ (rowPlane A B) = g ∧
    Module.finrank ℂ (((Fin g → ℂ) × (Fin g → ℂ)) ⧸ rowPlane A B) = g := by sorry
end AbelianPeriod
-- abelianPeriod_rankOne
example (hA : IsUnit (!![1] : Matrix (Fin 1) (Fin 1) ℂ).det) :
    AbelianPeriod.normalize !![1] !![Complex.I] hA = !![Complex.I] := by sorry
-- abelianPeriod_scaled
example (hA : IsUnit (!![2] : Matrix (Fin 1) (Fin 1) ℂ).det) :
    AbelianPeriod.normalize !![2] !![2*Complex.I] hA = !![Complex.I] := by sorry
-- abelianPeriod_zeroRank
example (A B : Matrix (Fin 0) (Fin 0) ℂ) (hA : IsUnit A.det) :
    AbelianPeriod.normalize A B hA = 0 := by sorry

end TauCeti.Hodge.PeriodGeometry

/-
Omitted-signature ledger (Protocol §13).

These entries are mathematical plans, not Lean declarations/examples. The
specification and README retain their exact hypotheses, source locators,
supplier prerequisites and proof routes. The unavailable types are represented
MT groups/components, analytic flag manifolds/universal subbundles, common
holomorphic variations, coherent C-linear logarithmic cohomology, holomorphic
global sections and trace-compatible Serre duality. No arbitrary Prop field or
local scalar product substitutes for those objects. Supplied native actions,
filtrations and matrix-exponential compatibility have their literal typed
meanings above; their global geometric provenance is conditional on suppliers.

test signature omitted: TauCeti.Hodge.PeriodGeometry.realOrbit_CM
  For a marked CM elliptic H¹ whose represented MT group centralizes its Hodge decomposition, the connected real period orbit is a singleton; the weight-one ambient component has all upper-half-plane period lines.

test signature omitted: TauCeti.Hodge.PeriodGeometry.complexOrbit_CM
  The complexified CM elliptic torus fixes the reference Hodge line; its orbit is a point inside the ambient P¹ compact dual.

construction signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS
  For a smooth proper connected complex curve family π:Cbar→B over a smooth analytic base, with disjoint marked sections D and b∈B, define logCurveKS_b:T_bB→H¹(C_b,T_Cb(−D_b)) as the connecting homomorphism of 0→T_Cb(−D_b)→T_Cbar(−log D)|Cb→O_Cb⊗T_bB→0 after the canonical H⁰ identification. Smoothness, connected proper fibres and disjoint sections are retained. It is the curve-family adapter of the supplied coherent connecting map, not a second general deformation theory.

API signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_boundary
  Its value is the connecting class of the constant tangent section.

API signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_lift
  A smooth tangent-to-D lift v gives logCurveKS(u)=[barpartial v].

API signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_baseChange
  For a holomorphic map between smooth analytic bases, pullback of a smooth pointed family gives κ_new=κ_old∘d(base map), under the canonical fibre cohomology identification.

test signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_split
  For a product pointed family the logarithmic tangent sequence splits and κ=0.

test signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_identityBase
  Pullback along the identity base map preserves κ and the marked divisor.

test signature omitted: TauCeti.Hodge.PeriodGeometry.logCurveKS_verticalLift
  If a base vector has a holomorphic tangent-to-D lift, its connecting class is zero; changing any smooth lift by a vertical field changes barpartial v by an exact class.

construction signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.multiply
  For any holomorphic finite-rank vector bundle E on a smooth proper connected complex curve C and reduced divisor D, define B_E:(E⊗ω_C(D))×(E∨⊗ω_C)→ω_C²(D) by evaluation E⊗E∨→O_C, with the two line factors multiplied. Its induced global-section map μ_E:H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D)) is trace after tensor product of sections. The sheaf pairing is perfect between these two mutually twisted dual bundles; neither nondegeneracy nor surjectivity of μ_E on global sections is asserted.

API signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.eval
  In dual frames μ_E(s,t)=Σ_i s_i t_i, as a section of ω²(D).

API signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.frame
  Under E-frame change A and inverse-dual frame change, trace multiplication is invariant; identity and compositions agree.

API signature omitted: TauCeti.Hodge.PeriodGeometry.PeriodTrace.rankOne
  For E=O_C the map is ordinary multiplication H⁰(ω(D))⊗H⁰(ω)→H⁰(ω²(D)).

test signature omitted: TauCeti.Hodge.PeriodGeometry.periodTrace_rankTwo
  In a rank-two frame s=(1,2),t=(3,4) with unit line factors, B_E(s,t)=11.

test signature omitted: TauCeti.Hodge.PeriodGeometry.periodTrace_zero
  For the rank-zero bundle μ_E is zero even when H⁰(ω²(D)) is nonzero.

test signature omitted: TauCeti.Hodge.PeriodGeometry.periodTrace_divisor
  With local coordinate z at a reduced marked point, s=e⊗dz/z and t=e∨⊗dz evaluate to dz²/z, not dz²/z².

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.ambientDomain_open
  For a nonempty native period carrier with fixed (V,Qint,h), its toCompactDual image is exactly the set of compact-dual flags that are n-opposed to lattice conjugation and satisfy the pinned strict Hodge–Riemann inequalities i^(2p−n)Q_C(x,conj x)>0 on each nonzero Hodge piece. This subset is open in the complex analytic topology and gives the entire native carrier a complex manifold structure, with possibly several connected components. The compact-dual carrier is smooth projective, and the full real Q-isometry group acts transitively on the full native domain; its identity component acts transitively on each chosen connected component. Stabilizers are compact; they need not be maximal compact.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.mtOrbit_open
  For the represented polarizable pure datum, RealPeriodOrbit is a connected complex manifold open in its own represented ComplexPeriodOrbit, and its inclusion into the full ambient domain is a holomorphic immersion and locally closed embedding. Its real homogeneous description is G(R)^+/Z_{G(R)^+}(h), with scalar centre acting trivially. This isotropy is compact only after quotienting the positive scalar centre, or on the normalized real isometry image. The full centralizer in MT(R) need not be compact. The complex-orbit tangent is g_C/F⁰g_C. These assertions are independent, by canonical isomorphism, of the faithful representation used to realize the same Hodge datum.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.orbit_hodgeTensors
  Import the Hodge tensor operations and a represented rational group G acting on them. If a rational tensor t in a finite tensor construction from V,V∨ and explicit Tate twists is fixed by G and is of type (0,0) at F0, then it is of type (0,0) at every flag in the chosen real G-orbit. The derivative along the orbit satisfies the linearized Hodge-tensor equations, so its component normal to the tensor-defined locus is zero. Conversely a tensor-defined locus is identified with the orbit only after supplying its group-stabilizer theorem and selecting the required homogeneous component; no equality with the entire ambient domain is claimed. An untwisted type (p,p) tensor for p≠0 is not a type-(0,0) Hodge tensor.

comparison signature omitted: TauCeti.Hodge.PeriodGeometry.fullIsometry_specialization
  When the represented normalized acting group is the full identity component of the real Q-isometry group and its complex group is the corresponding full isometry group with the components needed for the selected flag orbit, RealPeriodOrbit(F0) identifies with the ambient connected component through F0. The full ambient carrier is the union of these orbits over representatives of its connected components. For a general MT subgroup only the orbit inclusion is supplied; it is not asserted surjective or open in the full ambient domain.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.tangent_horizontal
  At F in a represented pure compact-dual orbit, T_F Dcheck≅g_C/F⁰g_C≅⊕_{r<0}g^{r,−r}. The horizontal holomorphic subbundle is F^(−1)g_C/F⁰g_C≅g^(−1,1); at every point it consists of the tangent classes represented by X with X(F^p)⊆F^{p−1} for all p. Under the full flag inclusion its derivative is the collection s↦X(s) mod F^p. Brackets have grade sum: [g^(−1,1),g^(−1,1)]⊆g^(−2,2), so horizontal integrability is not asserted in general.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.negativeChart_local
  For a specified complex linear complement q to F⁰g_C, negativeOrbitMap has derivative at zero the isomorphism q→g_C/F⁰g_C. There are open neighborhoods of zero and F0 on which it is a biholomorphism. Negative grading provides a canonical such complement at a pure reference point. Chart transitions between translates and complements are holomorphic; these charts are only local. No boundedness or global injectivity is asserted.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.tautological_transversality
  On a represented pure period orbit with constant underlying local system and its universal holomorphic filtration, Griffiths transversality holds in all tangent directions iff the adjoint Hodge grading has no grades r<−1, equivalently by reality no grades r>1. Thus the allowed adjoint types are {(-1,1),(0,0),(1,-1)}. In the general case the universal filtered bundle is not a VHS on the full domain; a map from a base is a VHS only when its derivative lies in the horizontal subbundle.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.periodMap_holomorphic
  For the imported polarized integral variation and a flat marking on a simply connected patch, markedPeriodMap is holomorphic into the full ambient period manifold and its derivative takes values in the horizontal subbundle. For an imported rational variation and a represented MT orbit, factorization into that orbit requires supplied flat Hodge tensors, constant generic datum and a chosen component; with this supplied factorization the induced orbit-valued map is holomorphic and horizontal. Local holomorphicity alone does not add an integral lattice.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.monodromy_descent
  For a connected base with universal cover and the imported polarized integral variation, the marked lift P satisfies P(γb)=ρ(γ)·P(b), with ρ valued in the existing integral Q-isometry group. It descends to B→Γ\D for any discrete subgroup Γ containing the monodromy image and preserving the chosen domain/component. With compact isotropy in the effective real isometry group, discrete Γ acts properly discontinuously. If its action is free (for instance effective torsion-free Γ), the quotient is a complex manifold and the descended map is holomorphic with horizontal local lifts. Without freeness retain an analytic orbifold/quotient space, not a manifold. The monodromy subgroup need not itself be a finite-index arithmetic lattice.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.derivative_connection
  For an imported variation and p∈Z, under the universal Grassmannian tangent identification, dP_b^p(v)(s)=∇_v(tilde s) mod F_b^p for any local holomorphic F^p-lift of s. The quotient of ∇ on F^p is O_B-linear because the Leibniz term s⊗df lies in F^p⊗Ω¹. For a Griffiths-transverse variation the value lies in F^{p−1}/F^p and depends only on s modulo F^{p+1}; this is precisely the existing H.0 graded-Higgs operator. The curried and uncurried derivative and its cotangent dual agree under the canonical Hom/tensor/dual identifications.

comparison signature omitted: TauCeti.Hodge.PeriodGeometry.curve_hodgeFiltration
  For π:Cbar→B smooth proper connected curves over a smooth contractible complex analytic base, disjoint marked sections D, and a finite-rank unitary complex local system V on C°=Cbar−D, import its Deligne canonical extension (E,∇), relative logarithmic de Rham comparison and unitary Hodge-to-de Rham degeneration. Then H=(R¹π°_*V)⊗O_B, F¹H=π_*(E⊗ω_Cbar/B(D)), and H/F¹H=R¹π_*E are the imported locally free two-step data. A flat marking defines a holomorphic Grassmannian period map of subspace rank s=rank F¹ and total rank r, which uses the pinned Module.Grassmannian with quotient rank r−s. This complex two-step period map is not assumed to be a pure integral polarized-domain map.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.gaussManin_contraction
  Under the curve-family hypotheses and supplied logarithmic smooth de Rham/Dolbeault resolutions, let σ be a smooth E-valued logarithmic one-form whose restriction to every fibre near b is closed. If u∈T_bB and v is a smooth lift along C_b tangent to D, then ∇GM([σ])_b(u) is the class of (ι_v d_tot σ)|Cb, where d_tot=∇+barpartial. Its class is independent of the lift and of exact changes of representative. Contraction occurs before restriction to the fibre.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.curve_kodairaSpencer_derivative
  Under the unitary logarithmic curve hypotheses, at b write C=C_b,D=D_b,E=E|C. For σ∈H⁰(C,Eω(D)) and u∈T_bB, the uncurried Grassmannian period derivative satisfies dP_b(u)(σ)=eval_*(κ_b(u) cup σ) in H¹(C,E), where κ_b is logCurveKS and eval contracts ω(D)⊗T_C(−D)→O_C. The sign is positive with κ=[barpartial v], d_tot=∇+barpartial and the source cup order specified; interchanging a degree-zero σ introduces no graded sign.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.serre_traceAdjoint
  For a smooth proper connected complex curve C, reduced D and holomorphic vector bundle E, the cup-contraction map H¹(T_C(−D))⊗H⁰(Eω(D))→H¹(E) is adjoint to μ_E:H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D)). Use Serre duality H¹(E)∨≅H⁰(E∨ω), H¹(T_C(−D))∨≅H⁰(ω²(D)) with the trace H¹(ω)→C and its cup/evaluation description. The statement is about vector bundles and proper curves, not arbitrary nonproper curves or only line-bundle duality.

theorem signature omitted: TauCeti.Hodge.PeriodGeometry.trace_periodDerivative
  For the unitary logarithmic family, the cotangent period derivative is dP_b∨=κ_b∨∘μ_E under the stated vector-bundle Serre dualities: H⁰(Eω(D))⊗H⁰(E∨ω)→H⁰(ω²(D))→T_bB∨. Here κ_b∨ denotes the Serre identification followed by the linear dual of logCurveKS. If 2g−2+n>0 and a supplied analytic classifying map c:B→M_g,n with the universal deformation/cotangent dictionary is chosen, κ_b∨ is exactly c_b*:H⁰(ω²(D))→Ω¹_B,b, giving the factorization of Landesman–Litt Theorem 5.1.6. The derivative is adjoint to the quotient Gauss–Manin map.

application signature omitted: TauCeti.Hodge.PeriodGeometry.trace_derivativeRank
  In the finite-dimensional fibre spaces of the trace formula, rank dP_b=rank dP_b∨=rank(κ_b∨∘μ_E)≤rank μ_E. If the classifying map is étale at b, κ_b∨ is an isomorphism and equality rank dP_b=rank μ_E holds. More generally equality requires injectivity of κ_b∨ on im μ_E. The statement supplies the interface for H.4; it does not prove that every family is versal or any Clifford/rank bound.

comparison signature omitted: TauCeti.Hodge.PeriodGeometry.abelianPeriod_holomorphic
  For the principally polarized abelian family and local symplectic marking, Ω and τ are holomorphic; τ is symmetric and Im τ positive definite, so the weight-one period map is the corresponding holomorphic map to Siegel upper half space. Its graph plane is the marked F¹ in the row-period convention. For a changed symplectic cycle marking M with blocks a,b,c,d acting on the right on [I τ], the new normalized matrix is (a+τc)^(−1)(b+τd). A left column-plane convention instead gives the familiar (aτ+b)(cτ+d)^(−1); these are not mixed. General polarization type retains its elementary-divisor matrix rather than being forced to this principal convention.

-/

end
end Layer4

/-! ## H.4 -/

section Layer5

/-! ### H.4: signature boundary

G4 is the precise global-signature boundary. WeightedFlag, evaluation and section maps
use native modules. CoparabolicZero uses the actual formal-disc lattice, in coordinates.
ParabolicBundle below retains only rank, determinant degree and marked fibre flags:
the underlying curve, locally free sheaf, fibre comparison and degree map are omitted.
SubbundleData/QuotientData are numerical and fibre data supplied by ordinary geometry;
a catalogue is supplied for saturated global subbundles. No assertion makes every such
numerical datum into a global subbundle. In particular arbitrary catalogues do not
certify global semistability. Normalized duals retain their numerical/fibre portion.

The named global theorems have their local, numerical or filtered-representation
portions here. Their omitted hypotheses/carriers are inventoried at the end and in G4.
The few specified API items and tests that cannot be typed without those carriers have no
declaration; the inventory names each of them.
No unavailable geometric hypothesis, VMHS, versality or unitarity is replaced by an
opaque proposition. Every other specified API/test name has a declaration or labelled example;
global comparisons in those tests need the explicit supplier completion in G4.
-/

noncomputable section
namespace TauCeti.ParabolicBounds
open scoped PowerSeries
open Module

variable {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]

structure WeightedFlag (V : Type*) [AddCommGroup V] [Module ℂ V] where
  length : ℕ
  flag : ℕ → Submodule ℂ V
  weight : ℕ → ℝ
  first : flag 0 = ⊤
  tail : ∀ i, length ≤ i → flag i = ⊥
  strict : ∀ i, i < length → flag (i + 1) < flag i
  nonneg : ∀ i, i < length → 0 ≤ weight i
  lt_one : ∀ i, i < length → weight i < 1
  increasing : ∀ i j, i < j → j < length → weight i < weight j
  weight_tail : ∀ i, length ≤ i → weight i = 0

namespace WeightedFlag

def trivial (V : Type*) [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (a : ℝ) (ha : 0 ≤ a ∧ a < 1) : WeightedFlag V where
  length := if finrank ℂ V = 0 then 0 else 1
  flag i := if i = 0 then ⊤ else ⊥
  weight i := if i = 0 ∧ finrank ℂ V ≠ 0 then a else 0
  first := by sorry
  tail := by sorry
  strict := by sorry
  nonneg := by sorry
  lt_one := by sorry
  increasing := by sorry
  weight_tail := by sorry

def gradedRank (F : WeightedFlag V) (i : ℕ) : ℕ :=
  finrank ℂ (F.flag i) - finrank ℂ (F.flag (i + 1))

def contribution (F : WeightedFlag V) : ℝ :=
  ∑ i ∈ Finset.range F.length, F.weight i * (F.gradedRank i : ℝ)

theorem gradedRank_sum (F : WeightedFlag V) :
    (∑ i ∈ Finset.range F.length, F.gradedRank i) = finrank ℂ V := by
  sorry

theorem ext (F G : WeightedFlag V) (hm : F.length = G.length)
    (hf : F.flag = G.flag) (hw : F.weight = G.weight) : F = G := by
  sorry

def transport {W : Type*} [AddCommGroup W] [Module ℂ W]
    (e : V ≃ₗ[ℂ] W) (F : WeightedFlag V) : WeightedFlag W := by
  sorry

-- Auxiliary coordinate models, not additional global roadmap objects.
def twoStep (a b : ℝ) (h : 0 ≤ a ∧ a < b ∧ b < 1) :
    WeightedFlag (Fin 2 → ℂ) where
  length := 2
  flag i := if i = 0 then ⊤ else if i = 1 then ℂ ∙ (Pi.single 1 1) else ⊥
  weight i := if i = 0 then a else if i = 1 then b else 0
  first := by sorry
  tail := by sorry
  strict := by sorry
  nonneg := by sorry
  lt_one := by sorry
  increasing := by sorry
  weight_tail := by sorry

def coordinateThreshold (n : ℕ) (eigen : Fin n → ℝ) (a : ℝ) :
    Submodule ℂ (Fin n → ℂ) where
  carrier := {v | ∀ i, eigen i < a → v i = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

def residueFlag (n : ℕ) (eigen : Fin n → ℝ) (heigen : ∀ i, 0 ≤ eigen i ∧ eigen i < 1) :
    WeightedFlag (Fin n → ℂ) := by
  sorry

-- TauCeti.ParabolicBounds.WeightedFlag.one_step_half
example : (trivial ℂ (1/2) (by norm_num)).gradedRank 0 = 1 ∧
    (trivial ℂ (1/2) (by norm_num)).contribution = 1/2 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.zero_empty
example (F : WeightedFlag (Fin 0 → ℂ)) :
    F.length = 0 ∧ (∑ i ∈ Finset.range F.length, F.gradedRank i) = 0 ∧
      (trivial (Fin 0 → ℂ) 0 (by norm_num)).contribution = 0 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.weight_one_excluded
example (F : WeightedFlag V) (h : 0 < F.length) : F.weight 0 ≠ 1 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.transport_native
example (F : WeightedFlag V) : transport (LinearEquiv.refl ℂ V) F = F := by
  sorry
end WeightedFlag

structure ParabolicBundle (J : Type*) where
  rank : ℕ
  ordinaryDegree : ℤ
  markedFlag : J → WeightedFlag (Fin rank → ℂ)

variable {J : Type*} [Fintype J]
namespace ParabolicBundle

def trivial (J : Type*) (r : ℕ) (d : ℤ) : ParabolicBundle J where
  rank := r
  ordinaryDegree := d
  markedFlag _ := WeightedFlag.trivial (Fin r → ℂ) 0 (by norm_num)

-- The rank projection is the structure projection ParabolicBundle.rank.

theorem residueWeights (n : ℕ) (eigen : Fin n → ℝ)
    (heigen : ∀ i, 0 ≤ eigen i ∧ eigen i < 1) (a : ℝ) (ha : 0 ≤ a ∧ a < 1) :
    (∃ k, (WeightedFlag.residueFlag n eigen heigen).flag k =
      WeightedFlag.coordinateThreshold n eigen a) ∧
    ∀ k < (WeightedFlag.residueFlag n eigen heigen).length,
      (∃ i, (WeightedFlag.residueFlag n eigen heigen).weight k = eigen i) ∧
      (WeightedFlag.residueFlag n eigen heigen).flag k =
        WeightedFlag.coordinateThreshold n eigen
          ((WeightedFlag.residueFlag n eigen heigen).weight k) := by
  sorry

theorem ext (P Q : ParabolicBundle J) (hr : P.rank = Q.rank)
    (hd : P.ordinaryDegree = Q.ordinaryDegree)
    (hf : HEq P.markedFlag Q.markedFlag) : P = Q := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.no_marks
example (r : ℕ) (d : ℤ) (P : ParabolicBundle Empty)
    (hr : P.rank = r) (hd : P.ordinaryDegree = d) : P = trivial Empty r d := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.trivial_weights
example (r : ℕ) (d : ℤ) (j : J) (i : ℕ) :
    ((trivial J r d).markedFlag j).weight i = 0 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.rank_two_weights
example (h : ∀ i, 0 ≤ (![0, 1/3] : Fin 2 → ℝ) i ∧ (![0, 1/3] : Fin 2 → ℝ) i < 1) :
    (WeightedFlag.residueFlag 2 ![0, 1/3] h).weight 0 = 0 ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).weight 1 = 1/3 ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).flag 1 = ℂ ∙ (Pi.single 1 1 : Fin 2 → ℂ) ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).gradedRank 0 = 1 ∧
      (WeightedFlag.residueFlag 2 ![0, 1/3] h).gradedRank 1 = 1 := by
  sorry
/-- Local monodromy of flat sections along a positively oriented loop, for residue `α`
(the sign of HodgeStructuresPartII:H.2/residue-monodromy). -/
def residueMonodromy (α : ℝ) : ℂ := Complex.exp (-2 * Real.pi * Complex.I * α)

-- TauCeti.ParabolicBounds.ParabolicBundle.residue_sign
example : residueMonodromy (1/3) ≠ Complex.exp (2 * Real.pi * Complex.I * (1/3 : ℂ)) := by
  sorry
end ParabolicBundle

-- The following are fibre/degree portions of supplied ordinary subbundles and quotients.
structure SubbundleData (P : ParabolicBundle J) where
  rank : ℕ
  ordinaryDegree : ℤ
  fibreMap : J → (Fin rank → ℂ) →ₗ[ℂ] (Fin P.rank → ℂ)
  injective : ∀ j, Function.Injective (fibreMap j)
  rank_le : rank ≤ P.rank

structure QuotientData (P : ParabolicBundle J) where
  rank : ℕ
  ordinaryDegree : ℤ
  fibreMap : J → (Fin P.rank → ℂ) →ₗ[ℂ] (Fin rank → ℂ)
  surjective : ∀ j, Function.Surjective (fibreMap j)
  rank_le : rank ≤ P.rank

def WeightedFlag.comapInjective {W : Type*} [AddCommGroup W] [Module ℂ W]
    (f : W →ₗ[ℂ] V) (hf : Function.Injective f) (F : WeightedFlag V) :
    WeightedFlag W := by
  sorry

def WeightedFlag.mapSurjective {W : Type*} [AddCommGroup W] [Module ℂ W]
    (f : V →ₗ[ℂ] W) (hf : Function.Surjective f) (F : WeightedFlag V) :
    WeightedFlag W := by
  sorry

def inducedSubbundle (P : ParabolicBundle J) (F : SubbundleData P) :
    ParabolicBundle J where
  rank := F.rank
  ordinaryDegree := F.ordinaryDegree
  markedFlag j := WeightedFlag.comapInjective (F.fibreMap j) (F.injective j) (P.markedFlag j)

def inducedQuotient (P : ParabolicBundle J) (Q : QuotientData P) :
    ParabolicBundle J where
  rank := Q.rank
  ordinaryDegree := Q.ordinaryDegree
  markedFlag j := WeightedFlag.mapSurjective (Q.fibreMap j) (Q.surjective j) (P.markedFlag j)

-- Helpers express composition of actual native fibre maps.
def SubbundleData.comp {P : ParabolicBundle J} (F : SubbundleData P)
    (G : SubbundleData (inducedSubbundle P F))
    (hr : (inducedSubbundle P F).rank = F.rank) : SubbundleData P := by
  sorry

def QuotientData.comp {P : ParabolicBundle J} (Q : QuotientData P)
    (R : QuotientData (inducedQuotient P Q))
    (hr : (inducedQuotient P Q).rank = Q.rank) : QuotientData P := by
  sorry

def parabolicDegree (P : ParabolicBundle J) : ℝ :=
  (P.ordinaryDegree : ℝ) + ∑ j, (P.markedFlag j).contribution

def parabolicSlope (P : ParabolicBundle J) : ℝ := parabolicDegree P / P.rank

def ParabolicBundle.twist (P : ParabolicBundle J) (d : ℤ) : ParabolicBundle J :=
  { P with ordinaryDegree := P.ordinaryDegree + (P.rank : ℤ) * d }

namespace inducedSubbundle

theorem flag_comap (P : ParabolicBundle J) (F : SubbundleData P)
    (hr : (inducedSubbundle P F).rank = F.rank) (j : J) (i : ℕ) :
    ∃ k, ((inducedSubbundle P F).markedFlag j).flag k =
      ((P.markedFlag j).flag i).comap (F.fibreMap j) := by
  sorry

theorem repeated_max (P : ParabolicBundle J) (F : SubbundleData P) (j : J)
    (i : ℕ) (hi : i < (P.markedFlag j).length)
    (hne : ((P.markedFlag j).flag i).comap (F.fibreMap j) ≠ ⊥)
    (hmax : ∀ k, k < (P.markedFlag j).length →
      ((P.markedFlag j).flag k).comap (F.fibreMap j) =
        ((P.markedFlag j).flag i).comap (F.fibreMap j) →
          (P.markedFlag j).weight k ≤ (P.markedFlag j).weight i) :
    ∃ k, k < ((inducedSubbundle P F).markedFlag j).length ∧
      ((inducedSubbundle P F).markedFlag j).flag k =
        ((P.markedFlag j).flag i).comap (F.fibreMap j) ∧
      ((inducedSubbundle P F).markedFlag j).weight k = (P.markedFlag j).weight i := by
  sorry

def identityData (P : ParabolicBundle J) : SubbundleData P where
  rank := P.rank
  ordinaryDegree := P.ordinaryDegree
  fibreMap _ := LinearMap.id
  injective _ := by sorry
  rank_le := by sorry

theorem self (P : ParabolicBundle J) : inducedSubbundle P (identityData P) = P := by
  sorry

theorem trans (P : ParabolicBundle J) (F : SubbundleData P)
    (G : SubbundleData (inducedSubbundle P F))
    (hr : (inducedSubbundle P F).rank = F.rank) :
    inducedSubbundle (inducedSubbundle P F) G =
      inducedSubbundle P (F.comp G hr) := by
  sorry

-- Coordinate line data for discriminating intersection tests.
def twoMarked (d : ℤ) : ParabolicBundle Unit where
  rank := 2
  ordinaryDegree := d
  markedFlag _ := WeightedFlag.twoStep 0 (3/4) (by norm_num)

def coordinateLine (d : ℤ) (k : Fin 2) : SubbundleData (twoMarked d) where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 1 → ℂ) (i : Fin 2) => if i = k then v 0 else 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.zero
example (P : ParabolicBundle J) (F : SubbundleData P) (hr : F.rank = 0)
    (hd : F.ordinaryDegree = 0) :
    (inducedSubbundle P F).rank = 0 ∧ parabolicDegree (inducedSubbundle P F) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.high_weight_line
example : ((inducedSubbundle _ (coordinateLine 0 1)).markedFlag ()).weight 0 = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.low_weight_line
example : ((inducedSubbundle _ (coordinateLine 0 0)).markedFlag ()).weight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedSubbundle.identity_native
example (P : ParabolicBundle J) (j : J) (i : ℕ) :
    ((inducedSubbundle P (identityData P)).markedFlag j).flag i =
      (P.markedFlag j).flag i := by
  sorry
end inducedSubbundle

namespace inducedQuotient

theorem flag_map (P : ParabolicBundle J) (Q : QuotientData P)
    (hr : (inducedQuotient P Q).rank = Q.rank) (j : J) (i : ℕ) :
    ∃ k, ((inducedQuotient P Q).markedFlag j).flag k =
      ((P.markedFlag j).flag i).map (Q.fibreMap j) := by
  sorry

theorem degree_add (P : ParabolicBundle J) (F : SubbundleData P) (Q : QuotientData P)
    (hdeg : P.ordinaryDegree = F.ordinaryDegree + Q.ordinaryDegree)
    (hex : ∀ j, LinearMap.range (F.fibreMap j) = LinearMap.ker (Q.fibreMap j)) :
    parabolicDegree P = parabolicDegree (inducedSubbundle P F) +
      parabolicDegree (inducedQuotient P Q) := by
  sorry

def identityData (P : ParabolicBundle J) : QuotientData P where
  rank := P.rank
  ordinaryDegree := P.ordinaryDegree
  fibreMap _ := LinearMap.id
  surjective _ := by sorry
  rank_le := by sorry

theorem identity (P : ParabolicBundle J) : inducedQuotient P (identityData P) = P := by
  sorry

theorem trans (P : ParabolicBundle J) (Q : QuotientData P)
    (R : QuotientData (inducedQuotient P Q))
    (hr : (inducedQuotient P Q).rank = Q.rank) :
    inducedQuotient (inducedQuotient P Q) R = inducedQuotient P (Q.comp R hr) := by
  sorry

def coordinateQuotient (killed : Fin 2) :
    QuotientData (inducedSubbundle.twoMarked 0) where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 2 → ℂ) (_ : Fin 1) => v (if killed = 0 then (1 : Fin 2) else 0)
    map_add' := by sorry
    map_smul' := by sorry }
  surjective _ := by sorry
  rank_le := by sorry
-- TauCeti.ParabolicBounds.inducedQuotient.zero
example (P : ParabolicBundle J) (Q : QuotientData P) (hr : Q.rank = 0)
    (hd : Q.ordinaryDegree = 0) :
    (inducedQuotient P Q).rank = 0 ∧ parabolicDegree (inducedQuotient P Q) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedQuotient.kill_high
example : ((inducedQuotient _ (coordinateQuotient 1)).markedFlag ()).weight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.inducedQuotient.kill_low
example : ((inducedQuotient _ (coordinateQuotient 0)).markedFlag ()).weight 0 = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.inducedQuotient.native_map
example :
    ((inducedQuotient _ (coordinateQuotient 0)).markedFlag ()).flag 0 =
        (((inducedSubbundle.twoMarked 0).markedFlag ()).flag 1).map
          ((coordinateQuotient 0).fibreMap ()) ∧
      ((inducedQuotient _ (coordinateQuotient 0)).markedFlag ()).flag 1 =
        (((inducedSubbundle.twoMarked 0).markedFlag ()).flag 2).map
          ((coordinateQuotient 0).fibreMap ()) := by
  sorry
end inducedQuotient

namespace parabolicDegree

theorem trivial (r : ℕ) (d : ℤ) :
    parabolicDegree (ParabolicBundle.trivial J r d) = d := by
  sorry

theorem bounds (P : ParabolicBundle J) (hr : 0 < P.rank) :
    (P.ordinaryDegree : ℝ) ≤ parabolicDegree P ∧
      (0 < Fintype.card J → parabolicDegree P <
        P.ordinaryDegree + (Fintype.card J : ℝ) * P.rank) ∧
      (Fintype.card J = 0 → parabolicDegree P = P.ordinaryDegree) := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) :
    parabolicDegree (ParabolicBundle.twist P d) = parabolicDegree P + P.rank * (d : ℝ) := by
  sorry

def line (d : ℤ) (a : ℝ) (ha : 0 ≤ a ∧ a < 1) : ParabolicBundle Unit :=
  {rank := 1, ordinaryDegree := d,
    markedFlag := fun _ => WeightedFlag.trivial (Fin 1 → ℂ) a ha}
-- TauCeti.ParabolicBounds.parabolicDegree.line_quarter
example : parabolicDegree (line (-1) (1/4) (by norm_num)) = -3/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.zero
example : parabolicDegree (ParabolicBundle.trivial J 0 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.unmarked
example (P : ParabolicBundle Empty) : parabolicDegree P = P.ordinaryDegree := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.real_weights
example (h : 0 ≤ Real.sqrt 2 / 2 ∧ Real.sqrt 2 / 2 < 1) :
    parabolicDegree (line 0 (Real.sqrt 2 / 2) h) = Real.sqrt 2 / 2 := by
  sorry
end parabolicDegree

namespace parabolicSlope

theorem mul_rank (P : ParabolicBundle J) (hr : 0 < P.rank) :
    parabolicSlope P * P.rank = parabolicDegree P := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) (hr : 0 < P.rank) :
    parabolicSlope (ParabolicBundle.twist P d) = parabolicSlope P + d := by
  sorry

theorem zero (P : ParabolicBundle J) (hr : P.rank = 0) : parabolicSlope P = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.rank_two
example : parabolicSlope
    ({rank := 2, ordinaryDegree := -1,
      markedFlag := fun (_ : Unit) => WeightedFlag.twoStep 0 (1/2) (by norm_num)} :
      ParabolicBundle Unit) = -1/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.rank_zero
example : parabolicSlope (ParabolicBundle.trivial J 0 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicSlope.trivial_native
example (r : ℕ) (d : ℤ) (hr : 0 < r) :
    parabolicSlope (ParabolicBundle.trivial J r d) = (d : ℝ) / r := by
  sorry
end parabolicSlope

/-- Semistability relative to the supplied catalogue `S`, which must be the set of all saturated
global subbundles (G4); for an arbitrary catalogue, e.g. `∅`, the predicate is not
semistability. -/
def IsParabolicallySemistable (P : ParabolicBundle J) (S : Set (SubbundleData P)) : Prop :=
  ∀ F ∈ S, 0 < F.rank → F.rank < P.rank →
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P

namespace IsParabolicallySemistable

theorem rank_one (P : ParabolicBundle J) (S : Set (SubbundleData P))
    (hr : P.rank = 1) : IsParabolicallySemistable P S := by
  sorry

theorem quotient_iff (P : ParabolicBundle J) (F : SubbundleData P) (Q : QuotientData P)
    (hdeg : P.ordinaryDegree = F.ordinaryDegree + Q.ordinaryDegree)
    (hex : ∀ j, LinearMap.range (F.fibreMap j) = LinearMap.ker (Q.fibreMap j))
    (hrank : P.rank = F.rank + Q.rank) (hF : 0 < F.rank) (hQ : 0 < Q.rank) :
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P ↔
      parabolicSlope P ≤ parabolicSlope (inducedQuotient P Q) := by
  sorry
-- Geometry supplies the correspondence between the catalogue and the quotients.

theorem trivial_iff (r : ℕ) (d : ℤ)
    (S : Set (SubbundleData (ParabolicBundle.trivial J r d)))
    (hweights : ∀ F ∈ S, ∀ j i, ((inducedSubbundle _ F).markedFlag j).weight i = 0)
    (hdegree : ∀ F ∈ S, (inducedSubbundle _ F).ordinaryDegree = F.ordinaryDegree)
    (hrank : ∀ F ∈ S, (inducedSubbundle _ F).rank = F.rank) :
    IsParabolicallySemistable (ParabolicBundle.trivial J r d) S ↔
      ∀ F ∈ S, 0 < F.rank → F.rank < r →
        (F.ordinaryDegree : ℝ) / F.rank ≤ (d : ℝ) / r := by
  sorry

theorem iso (P Q : ParabolicBundle J) (hr : P.rank = Q.rank)
    (hd : P.ordinaryDegree = Q.ordinaryDegree)
    (e : J → (Fin P.rank → ℂ) ≃ₗ[ℂ] (Fin Q.rank → ℂ))
    (he : ∀ j, Q.markedFlag j = (P.markedFlag j).transport (e j))
    (S : Set (SubbundleData P)) (T : Set (SubbundleData Q))
    (hST : ∀ G ∈ T, ∃ F ∈ S, F.rank = G.rank ∧ F.ordinaryDegree = G.ordinaryDegree ∧
      ∀ j, LinearMap.range ((e j).toLinearMap ∘ₗ F.fibreMap j) = LinearMap.range (G.fibreMap j)) :
    IsParabolicallySemistable P S → IsParabolicallySemistable Q T := by
  sorry
-- The fibre equivalences stand for a bundle isomorphism; the bundle itself is omitted (G4).

-- TauCeti.ParabolicBounds.IsParabolicallySemistable.zero
example (P : ParabolicBundle J) (S : Set (SubbundleData P)) (hr : P.rank = 0) :
    IsParabolicallySemistable P S := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.line
example (d : ℤ) (a : ℝ) (ha : 0 ≤ a ∧ a < 1)
    (S : Set (SubbundleData (parabolicDegree.line d a ha))) :
    IsParabolicallySemistable (parabolicDegree.line d a ha) S := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.split_unstable
example (F : SubbundleData (ParabolicBundle.trivial Empty 2 0)) (hr : F.rank = 1)
    (hd : F.ordinaryDegree = 1)
    (hir : (inducedSubbundle _ F).rank = 1)
    (hid : (inducedSubbundle _ F).ordinaryDegree = 1) :
    ¬ IsParabolicallySemistable (ParabolicBundle.trivial Empty 2 0) {F} := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.strict_not_needed
example (F : SubbundleData (ParabolicBundle.trivial Empty 2 0)) (hr : F.rank = 1)
    (hd : F.ordinaryDegree = 0)
    (hir : (inducedSubbundle _ F).rank = 1)
    (hid : (inducedSubbundle _ F).ordinaryDegree = 0) :
    IsParabolicallySemistable (ParabolicBundle.trivial Empty 2 0) {F} ∧
      ¬ (parabolicSlope (inducedSubbundle _ F) <
        parabolicSlope (ParabolicBundle.trivial Empty 2 0)) := by
  sorry
end IsParabolicallySemistable

abbrev Disc := PowerSeries ℂ

def zeroWeightStep (P : ParabolicBundle J) (j : J) :
    Submodule ℂ (Fin P.rank → ℂ) :=
  if (P.markedFlag j).weight 0 = 0 then (P.markedFlag j).flag 1 else ⊤

def constantVector {r : ℕ} (s : Fin r → Disc) : Fin r → ℂ :=
  fun i => PowerSeries.coeff 0 (s i)

-- Genuine local lattice. Geometric sheaf gluing and its determinant degree are omitted.
def coparabolicZero (P : ParabolicBundle J) (j : J) :
    Submodule Disc (Fin P.rank → Disc) where
  carrier := {s | constantVector s ∈ zeroWeightStep P j}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

-- Numerical length-degree portion of the supplied global elementary modification.
def coparabolicOrdinaryDegree (P : ParabolicBundle J) : ℤ :=
  P.ordinaryDegree - ∑ j,
    if (P.markedFlag j).weight 0 = 0
    then ((P.markedFlag j).gradedRank 0 : ℤ) else 0

-- TauCeti.ParabolicBounds.parabolicSlope.coparabolic_distinct
example : parabolicSlope (parabolicDegree.line 0 0 (by norm_num)) = 0 ∧
    coparabolicOrdinaryDegree (parabolicDegree.line 0 0 (by norm_num)) = -1 := by
  sorry

namespace coparabolicZero

theorem mem_local (P : ParabolicBundle J) (j : J) (s : Fin P.rank → Disc) :
    s ∈ coparabolicZero P j ↔ constantVector s ∈ zeroWeightStep P j := by
  sorry

theorem rank (P : ParabolicBundle J) (j : J) :
    finrank Disc (coparabolicZero P j) = P.rank := by
  sorry

theorem degree (P : ParabolicBundle J) :
    coparabolicOrdinaryDegree P = P.ordinaryDegree - ∑ j,
      ((Module.length Disc ((Fin P.rank → Disc) ⧸ coparabolicZero P j)).toNat : ℤ) := by
  sorry

theorem factor {T : Type*} [AddCommGroup T] [Module Disc T]
    (P : ParabolicBundle J) (j : J) (f : T →ₗ[Disc] (Fin P.rank → Disc)) :
    (∃! l : T →ₗ[Disc] coparabolicZero P j,
      (coparabolicZero P j).subtype.comp l = f) ↔
        ∀ t, constantVector (f t) ∈ zeroWeightStep P j := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.trivial
example (r : ℕ) (d : ℤ) (j : J) (s : Fin r → Disc) :
    s ∈ coparabolicZero (ParabolicBundle.trivial J r d) j ↔
      ∀ i, PowerSeries.coeff 0 (s i) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.positive
example (P : ParabolicBundle J) (j : J) (h : 0 < (P.markedFlag j).weight 0) :
    coparabolicZero P j = ⊤ := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.mixed
example (s : Fin 2 → Disc) :
    s ∈ coparabolicZero
      ({rank := 2, ordinaryDegree := 0,
        markedFlag := fun (_ : Unit) => WeightedFlag.twoStep 0 (1/2) (by norm_num)} :
        ParabolicBundle Unit) () ↔ PowerSeries.coeff 0 (s 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.not_fibre_injective
example :
    finrank Disc (coparabolicZero (ParabolicBundle.trivial Unit 1 0) ()) = 1 ∧
      (∀ s ∈ coparabolicZero (ParabolicBundle.trivial Unit 1 0) (), constantVector s = 0) ∧
      coparabolicZero (ParabolicBundle.trivial Unit 1 0) () ≠ ⊤ := by
  sorry
end coparabolicZero

def dualWeight (a : ℝ) : ℝ := if a = 0 then 0 else 1 - a

def WeightedFlag.dual {n : ℕ} (F : WeightedFlag (Fin n → ℂ)) :
    WeightedFlag (Fin n → ℂ) := by
  sorry

-- Coordinate dual flags and actual integer modification lengths. The sheaf is omitted.
def parabolicDual (P : ParabolicBundle J) : ParabolicBundle J where
  rank := P.rank
  ordinaryDegree := -P.ordinaryDegree - ∑ j,
    ∑ i ∈ Finset.range (P.markedFlag j).length,
      if (P.markedFlag j).weight i = 0 then 0 else ((P.markedFlag j).gradedRank i : ℤ)
  markedFlag j := (P.markedFlag j).dual

namespace parabolicDual

theorem rank (P : ParabolicBundle J) : (parabolicDual P).rank = P.rank := by
  sorry

theorem degree (P : ParabolicBundle J) :
    parabolicDegree (parabolicDual P) = -parabolicDegree P := by
  sorry

theorem involutive (P : ParabolicBundle J) : parabolicDual (parabolicDual P) = P := by
  sorry

theorem weight (P : ParabolicBundle J) (j : J) (i : ℕ)
    (hi : i < (P.markedFlag j).length) :
    ∃ k, k < ((parabolicDual P).markedFlag j).length ∧
      ((parabolicDual P).markedFlag j).weight k = dualWeight ((P.markedFlag j).weight i) ∧
      ((parabolicDual P).markedFlag j).gradedRank k = (P.markedFlag j).gradedRank i := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.zero_weight
example (d : ℤ) :
    (parabolicDual (parabolicDegree.line d 0 (by norm_num))).ordinaryDegree = -d ∧
      ((parabolicDual (parabolicDegree.line d 0 (by norm_num))).markedFlag ()).weight 0 = 0 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.positive_line
example (d : ℤ) :
    (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))).ordinaryDegree = -d-1 ∧
      ((parabolicDual (parabolicDegree.line d (1/4) (by norm_num))).markedFlag ()).weight 0
        = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.degree_test
example (d : ℤ) :
    parabolicDegree (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))) =
      -((d : ℝ) + 1/4) := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.no_weight_one
example (a : ℝ) (ha : 0 ≤ a ∧ a < 1) : 0 ≤ dualWeight a ∧ dualWeight a < 1 := by
  sorry
end parabolicDual

-- The trace pairing B_E is owned by HodgeStructuresPartII:H.3/trace-multiplication
-- (target name TauCeti.Hodge.PeriodGeometry.PeriodTrace.multiply; its signature is omitted in the
-- H.3 suggested file). Fibrewise it
-- is the evaluation pairing `LinearMap.applyₗ`, which the coordinate tests below use.

section Sections
variable {U W : Type*} [AddCommGroup U] [Module ℂ U] [AddCommGroup W] [Module ℂ W]
  [FiniteDimensional ℂ U] [FiniteDimensional ℂ W]

-- For the global declaration, V,U,W are the actual supplied section modules.
def traceSectionMap (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) : U →ₗ[ℂ] W := B v

namespace traceSectionMap

theorem apply (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) (u : U) :
    traceSectionMap B v u = B v u := by
  sorry

theorem linear (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v v' : V) (a : ℂ) :
    traceSectionMap B (v + a • v') = traceSectionMap B v + a • traceSectionMap B v' := by
  sorry

theorem kernel_sections (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) (u : U) :
    u ∈ LinearMap.ker (traceSectionMap B v) ↔ B v u = 0 := by
  sorry
-- The identification with H⁰ of the sheaf kernel is an omitted global comparison.
-- TauCeti.ParabolicBounds.traceSectionMap.zero
example (B : V →ₗ[ℂ] U →ₗ[ℂ] W) :
    finrank ℂ (LinearMap.range (traceSectionMap B 0)) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.scalar
example (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) (a : ℂ) (ha : a ≠ 0) :
    finrank ℂ (LinearMap.range (traceSectionMap B (a • v))) =
      finrank ℂ (LinearMap.range (traceSectionMap B v)) := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.rank_one_model
example : finrank ℂ (LinearMap.range
    (traceSectionMap (LinearMap.applyₗ : ℂ →ₗ[ℂ] (ℂ →ₗ[ℂ] ℂ) →ₗ[ℂ] ℂ) 1)) = 1 := by
  sorry
-- TauCeti.ParabolicBounds.traceSectionMap.kernel_model
example : finrank ℂ
    (LinearMap.ker (traceSectionMap
      (LinearMap.applyₗ : (Fin 2 → ℂ) →ₗ[ℂ] ((Fin 2 → ℂ) →ₗ[ℂ] ℂ) →ₗ[ℂ] ℂ)
      (Pi.single 0 1))) = 1 := by
  sorry
end traceSectionMap
end Sections


/-! ### Parabolic structure of a logarithmic connection (fibre portion)

The curve, the bundle and the connection are omitted (G4); only the residue endomorphism of
each marked fibre is recorded. The analytic Deligne extension is HodgeStructuresPartII:H.2. -/

/-- Residue data of a logarithmic connection at the marks, with the ordinary degree. -/
structure LogConnectionData (J : Type*) where
  rank : ℕ
  ordinaryDegree : ℤ
  residue : J → Module.End ℂ (Fin rank → ℂ)

/-- The normalized weight of a residue eigenvalue: the fractional part of its real part. -/
def residueWeight (η : ℂ) : ℝ := Int.fract η.re

/-- The flag step of weight `a`: the sum of the generalized eigenspaces whose eigenvalue has
normalized weight at least `a`. -/
def residueStep {W : Type*} [AddCommGroup W] [Module ℂ W] (A : Module.End ℂ W) (a : ℝ) :
    Submodule ℂ W :=
  ⨆ (η : ℂ) (_ : a ≤ residueWeight η), A.maxGenEigenspace η

/-- The weighted flag of a residue endomorphism: the distinct normalized weights of its
eigenvalues, increasing, with flag steps `residueStep`. -/
def WeightedFlag.ofResidue {r : ℕ} (A : Module.End ℂ (Fin r → ℂ)) :
    WeightedFlag (Fin r → ℂ) := by
  sorry

/-- `ParabolicBundle.ofLogConnection`: the residue flags on the marked fibres. -/
def ParabolicBundle.ofLogConnection (L : LogConnectionData J) : ParabolicBundle J where
  rank := L.rank
  ordinaryDegree := L.ordinaryDegree
  markedFlag j := WeightedFlag.ofResidue (L.residue j)

namespace ParabolicBundle.ofLogConnection

theorem weight_eq (L : LogConnectionData J) (j : J) (a : ℝ) :
    (∃ i, i < ((ofLogConnection L).markedFlag j).length ∧
        ((ofLogConnection L).markedFlag j).weight i = a) ↔
      ∃ η : ℂ, (L.residue j).HasEigenvalue η ∧ residueWeight η = a := by
  sorry

theorem flag_eq (L : LogConnectionData J) (j : J) (i : ℕ)
    (hi : i < ((ofLogConnection L).markedFlag j).length) :
    ((ofLogConnection L).markedFlag j).flag i =
      residueStep (L.residue j) (((ofLogConnection L).markedFlag j).weight i) := by
  sorry

theorem gradedRank_eq (L : LogConnectionData J) (j : J) (i : ℕ)
    (hi : i < ((ofLogConnection L).markedFlag j).length) :
    ((ofLogConnection L).markedFlag j).gradedRank i =
      finrank ℂ ↥(⨆ (η : ℂ) (_ : residueWeight η = ((ofLogConnection L).markedFlag j).weight i),
        (L.residue j).maxGenEigenspace η) := by
  sorry

theorem unitary_weights (L : LogConnectionData J) (j : J)
    (hcan : ∀ η : ℂ, (L.residue j).HasEigenvalue η → 0 ≤ η.re ∧ η.re < 1)
    (hunit : ∀ η : ℂ, (L.residue j).HasEigenvalue η →
      ‖Complex.exp (-2 * Real.pi * Complex.I * η)‖ = 1)
    (η : ℂ) (hη : (L.residue j).HasEigenvalue η) :
    η.im = 0 ∧ residueWeight η = η.re ∧
      Complex.exp (-2 * Real.pi * Complex.I * η) =
        ParabolicBundle.residueMonodromy (residueWeight η) := by
  sorry

theorem directSum {W₁ W₂ : Type*} [AddCommGroup W₁] [Module ℂ W₁] [AddCommGroup W₂]
    [Module ℂ W₂] (A : Module.End ℂ W₁) (B : Module.End ℂ W₂) (a : ℝ) :
    residueStep (A.prodMap B) a = (residueStep A a).prod (residueStep B a) := by
  sorry

theorem trivial (r : ℕ) (d : ℤ) :
    ofLogConnection (⟨r, d, fun _ => 0⟩ : LogConnectionData J) = ParabolicBundle.trivial J r d := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.trivial_connection
example (j : J) :
    ((ofLogConnection (⟨1, 0, fun _ => 0⟩ : LogConnectionData J)).markedFlag j).length = 1 ∧
      ((ofLogConnection (⟨1, 0, fun _ => 0⟩ : LogConnectionData J)).markedFlag j).weight 0 = 0 ∧
      ((ofLogConnection (⟨1, 0, fun _ => 0⟩ : LogConnectionData J)).markedFlag j).gradedRank 0
        = 1 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.two_eigenvalues
example :
    ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' (Matrix.diagonal ![(0 : ℂ), 1/3])⟩ :
        LogConnectionData Unit)).markedFlag ()).flag 1 = ℂ ∙ (Pi.single 1 1 : Fin 2 → ℂ) ∧
      ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' (Matrix.diagonal ![(0 : ℂ), 1/3])⟩ :
        LogConnectionData Unit)).markedFlag ()).weight 0 = 0 ∧
      ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' (Matrix.diagonal ![(0 : ℂ), 1/3])⟩ :
        LogConnectionData Unit)).markedFlag ()).weight 1 = 1/3 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.nilpotent_residue
example :
    ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' !![(0 : ℂ), 1; 0, 0]⟩ :
        LogConnectionData Unit)).markedFlag ()).length = 1 ∧
      ((ofLogConnection (⟨2, 0, fun _ => Matrix.toLin' !![(0 : ℂ), 1; 0, 0]⟩ :
        LogConnectionData Unit)).markedFlag ()).gradedRank 0 = 2 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.ofLogConnection.fractional_part
example :
    residueWeight (4/3 : ℂ) = 1/3 ∧
      ((ofLogConnection (⟨1, 0, fun _ => (4/3 : ℂ) • LinearMap.id⟩ :
        LogConnectionData Unit)).markedFlag ()).weight 0 = 1/3 := by
  sorry
end ParabolicBundle.ofLogConnection

/-- Degree portion of `unitaryParabolicSemistable`: with the residue theorem
`deg E = −Σ tr Res` as hypothesis, the canonical-extension parabolic degree vanishes.
Semistability needs the global saturated subbundles and the Mehta–Seshadri/Simpson
comparison (G4, G6) and is omitted. -/
theorem unitaryParabolicSemistable (L : LogConnectionData J)
    (hcan : ∀ j (η : ℂ), (L.residue j).HasEigenvalue η → 0 ≤ η.re ∧ η.re < 1)
    (hres : (L.ordinaryDegree : ℂ) =
      -∑ j, LinearMap.trace ℂ (Fin L.rank → ℂ) (L.residue j)) :
    parabolicDegree (ParabolicBundle.ofLogConnection L) = 0 := by
  sorry

/-! ### Twist by an ordinary line bundle (numerical and fibre portion)

`ParabolicBundle.twist P d` twists by a line bundle of degree `d` with the trivial parabolic
structure: flags and weights are kept (after trivializing the fibre of the line). -/

/-- The twist of a supplied subbundle datum. -/
def SubbundleData.twist {P : ParabolicBundle J} (F : SubbundleData P) (d : ℤ) :
    SubbundleData (P.twist d) where
  rank := F.rank
  ordinaryDegree := F.ordinaryDegree + (F.rank : ℤ) * d
  fibreMap := F.fibreMap
  injective := F.injective
  rank_le := F.rank_le

namespace ParabolicBundle

theorem twist_rank (P : ParabolicBundle J) (d : ℤ) :
    (P.twist d).rank = P.rank ∧ (P.twist d).markedFlag = P.markedFlag := by
  sorry

theorem twist_zero (P : ParabolicBundle J) : P.twist 0 = P := by
  sorry

theorem twist_twist (P : ParabolicBundle J) (d d' : ℤ) :
    (P.twist d).twist d' = P.twist (d + d') := by
  sorry

theorem coparabolicZero_twist (P : ParabolicBundle J) (d : ℤ) :
    coparabolicOrdinaryDegree (P.twist d) = coparabolicOrdinaryDegree P + (P.rank : ℤ) * d ∧
      ∀ j, coparabolicZero (P.twist d) j = coparabolicZero P j := by
  sorry

theorem twist_inducedSubbundle (P : ParabolicBundle J) (F : SubbundleData P) (d : ℤ) :
    inducedSubbundle (P.twist d) (F.twist d) = (inducedSubbundle P F).twist d ∧
      ∀ S : Set (SubbundleData P),
        IsParabolicallySemistable (P.twist d) ((fun G => G.twist d) '' S) ↔
          IsParabolicallySemistable P S := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.twist_line_quarter
example (d : ℤ) :
    ((parabolicDegree.line d (1/4) (by norm_num)).twist 1).ordinaryDegree = d + 1 ∧
      (((parabolicDegree.line d (1/4) (by norm_num)).twist 1).markedFlag ()).weight 0 = 1/4 ∧
      parabolicDegree ((parabolicDegree.line d (1/4) (by norm_num)).twist 1) = d + 5/4 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.twist_rank_two
example :
    parabolicDegree
      (ParabolicBundle.twist
        (⟨2, 0, fun (_ : Unit) => WeightedFlag.twoStep 0 (1/2) (by norm_num)⟩ :
          ParabolicBundle Unit) 3) = 13/2 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.twist_trivial_KD
example (g : ℕ) :
    coparabolicOrdinaryDegree
      ((ParabolicBundle.trivial J 1 0).twist (2 * (g : ℤ) - 2 + Fintype.card J)) =
        2 * (g : ℤ) - 2 := by
  sorry
-- TauCeti.ParabolicBounds.ParabolicBundle.twist_by_trivial
example (P : ParabolicBundle J) :
    (P.twist 0).ordinaryDegree = P.ordinaryDegree ∧ (P.twist 0).markedFlag = P.markedFlag := by
  sorry
end ParabolicBundle

/-! ### Thresholds, morphisms, sums, shifts, filtrations and further tests

Numerical, fibre and formal-disc portions only; the omitted global signatures are listed in the
inventory at the end of the file. -/

namespace WeightedFlag

/-- The part of weight at least `a`: the supremum of the flag steps whose weight is `≥ a`,
which is the step `F_β` with `β` least such that `α_β ≥ a`, or `⊥` if no weight is `≥ a`. -/
def threshold (F : WeightedFlag V) (a : ℝ) : Submodule ℂ V :=
  ⨆ (i : ℕ) (_ : i < F.length ∧ a ≤ F.weight i), F.flag i

theorem threshold_antitone (F : WeightedFlag V) :
    (∀ a b : ℝ, a ≤ b → F.threshold b ≤ F.threshold a) ∧ F.threshold 0 = ⊤ := by
  sorry

theorem contribution_le (F : WeightedFlag V) (a : ℝ)
    (ha : ∀ i, i < F.length → F.weight i ≤ a) :
    F.contribution ≤ a * finrank ℂ V ∧
      (0 < finrank ℂ V → F.contribution < finrank ℂ V) := by
  sorry

-- TauCeti.ParabolicBounds.WeightedFlag.two_step_contribution
example : (twoStep (1/4) (1/2) (by norm_num)).gradedRank 0 = 1 ∧
    (twoStep (1/4) (1/2) (by norm_num)).gradedRank 1 = 1 ∧
    (twoStep (1/4) (1/2) (by norm_num)).contribution = 3/4 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.multiplicity
example : (trivial (Fin 2 → ℂ) (1/3) (by norm_num)).gradedRank 0 = 2 ∧
    (trivial (Fin 2 → ℂ) (1/3) (by norm_num)).contribution = 2/3 := by
  sorry
-- TauCeti.ParabolicBounds.WeightedFlag.not_increasing
example : ¬ ∃ F : WeightedFlag (Fin 2 → ℂ), F.length = 2 ∧ F.weight 0 = 1/2 ∧ F.weight 1 = 0 := by
  sorry

-- Auxiliary three-step coordinate flag ℂ³ ⊋ ⟨e₂, e₃⟩ ⊋ ⟨e₃⟩ ⊋ 0.
def threeStep (a b c : ℝ) (h : 0 ≤ a ∧ a < b ∧ b < c ∧ c < 1) :
    WeightedFlag (Fin 3 → ℂ) where
  length := 3
  flag i := if i = 0 then ⊤
    else if i = 1 then Submodule.span ℂ {Pi.single 1 1, Pi.single 2 1}
    else if i = 2 then ℂ ∙ (Pi.single 2 1) else ⊥
  weight i := if i = 0 then a else if i = 1 then b else if i = 2 then c else 0
  first := by sorry
  tail := by sorry
  strict := by sorry
  nonneg := by sorry
  lt_one := by sorry
  increasing := by sorry
  weight_tail := by sorry

/-- Direct sum of coordinate flags: the weight-`λ` graded pieces add. -/
def sum {m n : ℕ} (F : WeightedFlag (Fin m → ℂ)) (G : WeightedFlag (Fin n → ℂ)) :
    WeightedFlag (Fin (m + n) → ℂ) := by
  sorry

/-- Fibre flag of the shift `E[ε]`: weights `≥ ε` drop by `ε`, weights `< ε` become `α + 1 − ε`
on the modified lattice. -/
def shift (F : WeightedFlag V) (ε : ℝ) : WeightedFlag V := by
  sorry
end WeightedFlag

namespace ParabolicBundle

/-- Fibre portion of a parabolic morphism: fibre maps preserving every threshold step. The
global bundle map is omitted (G4). -/
structure Hom (P Q : ParabolicBundle J) where
  fibreMap : J → (Fin P.rank → ℂ) →ₗ[ℂ] (Fin Q.rank → ℂ)
  preserves : ∀ j (a : ℝ), 0 ≤ a → a < 1 →
    (P.markedFlag j).threshold a ≤ ((Q.markedFlag j).threshold a).comap (fibreMap j)

def Hom.id (P : ParabolicBundle J) : P.Hom P where
  fibreMap _ := LinearMap.id
  preserves := by sorry

def Hom.comp {P Q R : ParabolicBundle J} (g : Q.Hom R) (f : P.Hom Q) : P.Hom R where
  fibreMap j := (g.fibreMap j).comp (f.fibreMap j)
  preserves := by sorry

theorem Hom.ofTrivial (r : ℕ) (d : ℤ) (Q : ParabolicBundle J)
    (f : J → (Fin r → ℂ) →ₗ[ℂ] (Fin Q.rank → ℂ)) :
    ∃ φ : (ParabolicBundle.trivial J r d).Hom Q, φ.fibreMap = f := by
  sorry

def directSum (P Q : ParabolicBundle J) : ParabolicBundle J where
  rank := P.rank + Q.rank
  ordinaryDegree := P.ordinaryDegree + Q.ordinaryDegree
  markedFlag j := (P.markedFlag j).sum (Q.markedFlag j)

/-- The shift `E[ε]`, `E[ε]_α = E_{α+ε}`: its underlying lattice `E_ε` loses the graded
pieces of weight `< ε`. -/
def shift (P : ParabolicBundle J) (ε : ℝ) : ParabolicBundle J where
  rank := P.rank
  ordinaryDegree := P.ordinaryDegree - ∑ j, ∑ i ∈ Finset.range (P.markedFlag j).length,
      if (P.markedFlag j).weight i < ε then ((P.markedFlag j).gradedRank i : ℤ) else 0
  markedFlag j := (P.markedFlag j).shift ε
end ParabolicBundle

namespace inducedSubbundle

theorem rank (P : ParabolicBundle J) (F : SubbundleData P) :
    (inducedSubbundle P F).rank = F.rank ∧
      ∃ φ : (inducedSubbundle P F).Hom P, φ.fibreMap = F.fibreMap := by
  sorry

def threeMarked : ParabolicBundle Unit :=
  ⟨3, 0, fun _ => WeightedFlag.threeStep 0 (1/3) (2/3) (by norm_num)⟩

/-- The plane `⟨e₁ + e₂, e₃⟩`. -/
def planeData : SubbundleData threeMarked where
  rank := 2
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 2 → ℂ) (i : Fin 3) => if i = 2 then v 1 else v 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.inducedSubbundle.induced_two_dim
example : ((inducedSubbundle threeMarked planeData).markedFlag ()).length = 2 ∧
    ((inducedSubbundle threeMarked planeData).markedFlag ()).weight 0 = 0 ∧
    ((inducedSubbundle threeMarked planeData).markedFlag ()).weight 1 = 2/3 := by
  sorry
end inducedSubbundle

namespace inducedQuotient

theorem rank_add [Nonempty J] (P : ParabolicBundle J) (F : SubbundleData P)
    (Q : QuotientData P)
    (hex : ∀ j, LinearMap.range (F.fibreMap j) = LinearMap.ker (Q.fibreMap j)) :
    P.rank = F.rank + Q.rank := by
  sorry

/-- The quotient by `⟨e₁ + e₂, e₃⟩`, `v ↦ v₀ − v₁`. -/
def planeQuotient : QuotientData inducedSubbundle.threeMarked where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 3 → ℂ) (_ : Fin 1) => v 0 - v 1
    map_add' := by sorry
    map_smul' := by sorry }
  surjective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.inducedQuotient.induced_two_dim
example : ((inducedQuotient _ planeQuotient).markedFlag ()).weight 0 = 1/3 ∧
    ((inducedSubbundle _ inducedSubbundle.planeData).markedFlag ()).contribution +
        ((inducedQuotient _ planeQuotient).markedFlag ()).contribution =
      (inducedSubbundle.threeMarked.markedFlag ()).contribution := by
  sorry
end inducedQuotient

namespace parabolicDegree

theorem eq_deg_add_contribution (P : ParabolicBundle J) :
    parabolicDegree P = P.ordinaryDegree + ∑ j, (P.markedFlag j).contribution := by
  sorry

theorem directSum (P Q : ParabolicBundle J) :
    parabolicDegree (P.directSum Q) = parabolicDegree P + parabolicDegree Q := by
  sorry

theorem shift (P : ParabolicBundle J) (ε : ℝ) (hε : 0 < ε ∧ ε < 1) :
    parabolicDegree (P.shift ε) = parabolicDegree P - ε * Fintype.card J * P.rank := by
  sorry

-- TauCeti.ParabolicBounds.parabolicDegree.rank_two_multiplicity
example : parabolicDegree
    (⟨2, 0, fun _ => WeightedFlag.trivial (Fin 2 → ℂ) (1/3) (by norm_num)⟩ :
      ParabolicBundle Unit) = 2/3 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDegree.two_weights
example : parabolicDegree
    (⟨2, 0, fun _ => WeightedFlag.twoStep (1/4) (1/2) (by norm_num)⟩ :
      ParabolicBundle Unit) = 3/4 := by
  sorry
end parabolicDegree

/-- The coparabolic degree: by definition the parabolic degree of the antecedent
(LL22 Definition 2.2.9), not the degree of `coparabolicZero`. -/
def coparabolicDegree (P : ParabolicBundle J) : ℝ := parabolicDegree P

-- TauCeti.ParabolicBounds.parabolicDegree.coparabolic_not_zero_lattice
example (r : ℕ) (d : ℤ) :
    coparabolicDegree (ParabolicBundle.trivial J r d) = d ∧
      coparabolicOrdinaryDegree (ParabolicBundle.trivial J r d) =
        d - (Fintype.card J : ℤ) * r := by
  sorry

namespace parabolicSlope

theorem dual (P : ParabolicBundle J) (hr : 0 < P.rank) :
    parabolicSlope (parabolicDual P) = -parabolicSlope P := by
  sorry

theorem shift (P : ParabolicBundle J) (ε : ℝ) (hε : 0 < ε ∧ ε < 1) (hr : 0 < P.rank) :
    parabolicSlope (P.shift ε) = parabolicSlope P - Fintype.card J * ε := by
  sorry

theorem sub_ordinary_lt (P : ParabolicBundle J) (hr : 0 < P.rank) :
    0 ≤ parabolicSlope P - P.ordinaryDegree / P.rank ∧
      (0 < Fintype.card J →
        parabolicSlope P - P.ordinaryDegree / P.rank < Fintype.card J) := by
  sorry

-- TauCeti.ParabolicBounds.parabolicSlope.dual_twist_canonical
example (g : ℕ) :
    parabolicSlope (⟨1, -1, fun _ => WeightedFlag.trivial (Fin 1 → ℂ) (1/2) (by norm_num)⟩ :
      ParabolicBundle (Fin 2)) = 0 ∧
    parabolicSlope ((parabolicDual
      (⟨1, -1, fun _ => WeightedFlag.trivial (Fin 1 → ℂ) (1/2) (by norm_num)⟩ :
        ParabolicBundle (Fin 2))).twist (2 * (g : ℤ))) = 2 * (g : ℝ) := by
  sorry
end parabolicSlope

namespace IsParabolicallySemistable

theorem slope_le {P : ParabolicBundle J} {S : Set (SubbundleData P)}
    (h : IsParabolicallySemistable P S) {F : SubbundleData P} (hF : F ∈ S)
    (h0 : 0 < F.rank) (h1 : F.rank < P.rank) :
    parabolicSlope (inducedSubbundle P F) ≤ parabolicSlope P := by
  sorry

def halfMarked : ParabolicBundle Unit :=
  ⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/2) (by norm_num)⟩

/-- The constant line `O · e₂` of `halfMarked`. -/
def halfLine : SubbundleData halfMarked where
  rank := 1
  ordinaryDegree := 0
  fibreMap _ := {
    toFun := fun (v : Fin 1 → ℂ) (i : Fin 2) => if i = 1 then v 0 else 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.IsParabolicallySemistable.weight_destabilises
example : parabolicSlope (inducedSubbundle halfMarked halfLine) = 1/2 ∧
    parabolicSlope halfMarked = 1/4 ∧ ¬ IsParabolicallySemistable halfMarked {halfLine} := by
  sorry

def thirdMarked : ParabolicBundle (Fin 3) :=
  ⟨2, -1, fun _ => WeightedFlag.twoStep 0 (1/3) (by norm_num)⟩

/-- `O ⊕ 0` and `0 ⊕ O(−1)` of `thirdMarked`; the deep flag step is the fibre of `O(−1)`. -/
def thirdLine (k : Fin 2) (d : ℤ) : SubbundleData thirdMarked where
  rank := 1
  ordinaryDegree := d
  fibreMap _ := {
    toFun := fun (v : Fin 1 → ℂ) (i : Fin 2) => if i = k then v 0 else 0
    map_add' := by sorry
    map_smul' := by sorry }
  injective _ := by sorry
  rank_le := by sorry

-- TauCeti.ParabolicBounds.IsParabolicallySemistable.weights_stabilise
example : parabolicSlope thirdMarked = 0 ∧
    parabolicSlope (inducedSubbundle thirdMarked (thirdLine 0 0)) = 0 ∧
    parabolicSlope (inducedSubbundle thirdMarked (thirdLine 1 (-1))) = 0 ∧
    IsParabolicallySemistable thirdMarked {thirdLine 0 0, thirdLine 1 (-1)} ∧
    (thirdMarked.ordinaryDegree : ℝ) / thirdMarked.rank <
      ((thirdLine 0 0).ordinaryDegree : ℝ) / (thirdLine 0 0).rank := by
  sorry
-- TauCeti.ParabolicBounds.IsParabolicallySemistable.small_sub_allowed
example (F : SubbundleData (ParabolicBundle.trivial Empty 2 0)) (hr : F.rank = 1)
    (hd : F.ordinaryDegree = -1) :
    IsParabolicallySemistable (ParabolicBundle.trivial Empty 2 0) {F} := by
  sorry
end IsParabolicallySemistable

/-- Coparabolic semistability is semistability of the antecedent parabolic bundle
(LL22 Definition 2.4.2). -/
def IsCoparabolicallySemistable (P : ParabolicBundle J) (S : Set (SubbundleData P)) : Prop :=
  IsParabolicallySemistable P S

/-- The formal-disc lattice of sections whose constant term lies in `W`. -/
def localLattice {r : ℕ} (W : Submodule ℂ (Fin r → ℂ)) : Submodule Disc (Fin r → Disc) where
  carrier := {s | constantVector s ∈ W}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Formal-disc model at the mark `j` of the filtration `E_α` for `α ≥ 0`:
`E_α = t^⌊α⌋ · {s : s(0) ∈ threshold (fract α)}`. Negative indices need the meromorphic
ambient and are omitted (G4). -/
def ParabolicBundle.filtration (P : ParabolicBundle J) (j : J) (α : ℝ) :
    Submodule Disc (Fin P.rank → Disc) :=
  (localLattice ((P.markedFlag j).threshold (Int.fract α))).map
    (((PowerSeries.X : Disc) ^ (⌊α⌋.toNat)) • LinearMap.id)

namespace ParabolicBundle

theorem filtration_zero (P : ParabolicBundle J) (j : J) : P.filtration j 0 = ⊤ := by
  sorry

theorem filtration_add_one (P : ParabolicBundle J) (j : J) (α : ℝ) (hα : 0 ≤ α) :
    P.filtration j (α + 1) =
      (P.filtration j α).map ((PowerSeries.X : Disc) • LinearMap.id) := by
  sorry

theorem filtration_antitone (P : ParabolicBundle J) (j : J) {α β : ℝ} (hα : 0 ≤ α)
    (hαβ : α ≤ β) : P.filtration j β ≤ P.filtration j α := by
  sorry

theorem filtration_mem (P : ParabolicBundle J) (j : J) (α : ℝ) (h0 : 0 ≤ α) (h1 : α ≤ 1)
    (s : Fin P.rank → Disc) :
    s ∈ P.filtration j α ↔ constantVector s ∈ (P.markedFlag j).threshold α := by
  sorry

theorem ext_filtration (P Q : ParabolicBundle J) (hr : P.rank = Q.rank)
    (hd : P.ordinaryDegree = Q.ordinaryDegree)
    (h : ∀ j (α : ℝ), 0 ≤ α → HEq (P.filtration j α) (Q.filtration j α)) : P = Q := by
  sorry

-- TauCeti.ParabolicBounds.ParabolicBundle.trivial_filtration
example (r : ℕ) (d : ℤ) (j : J) (α : ℝ) (hα : 0 ≤ α) :
    (ParabolicBundle.trivial J r d).filtration j α =
      (⊤ : Submodule Disc (Fin r → Disc)).map
        (((PowerSeries.X : Disc) ^ (⌈α⌉.toNat)) • LinearMap.id) := by
  sorry
end ParabolicBundle

namespace coparabolicZero

theorem eq_filtration (P : ParabolicBundle J) (j : J) :
    ∃ ε₀ : ℝ, 0 < ε₀ ∧ ∀ ε, 0 < ε → ε ≤ ε₀ → coparabolicZero P j = P.filtration j ε := by
  sorry

theorem bounds (P : ParabolicBundle J) (j : J) :
    (⊤ : Submodule Disc (Fin P.rank → Disc)).map ((PowerSeries.X : Disc) • LinearMap.id) ≤
        coparabolicZero P j ∧
      Module.length Disc ((Fin P.rank → Disc) ⧸ coparabolicZero P j) =
        if (P.markedFlag j).weight 0 = 0 then ((P.markedFlag j).gradedRank 0 : ℕ∞) else 0 := by
  sorry

-- TauCeti.ParabolicBounds.coparabolicZero.three_step
example : coparabolicOrdinaryDegree inducedSubbundle.threeMarked = -1 ∧
    ∀ s : Fin 3 → Disc,
      s ∈ coparabolicZero inducedSubbundle.threeMarked () ↔ PowerSeries.coeff 0 (s 0) = 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.eq_shift_example
example :
    (∀ ε : ℝ, 0 < ε → ε ≤ 1/4 →
      coparabolicZero (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
          ParabolicBundle Unit) () =
        (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
          ParabolicBundle Unit).filtration () ε) ∧
    coparabolicZero (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit) () ≠
      (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit).filtration () 0 := by
  sorry
-- TauCeti.ParabolicBounds.coparabolicZero.dual_twist_line
example (d : ℤ) (g : ℕ) :
    coparabolicOrdinaryDegree
      ((parabolicDual (parabolicDegree.line d 0 (by norm_num))).twist (2 * (g : ℤ) - 2 + 1)) =
        -d + 2 * (g : ℤ) - 2 := by
  sorry
end coparabolicZero

namespace parabolicDual

/-- The underlying bundle of the dual is `(Ê₀)∨(−D)`: degree `−deg Ê₀ − n · rank`. -/
theorem underlying (P : ParabolicBundle J) :
    (parabolicDual P).ordinaryDegree =
      -coparabolicOrdinaryDegree P - (P.rank : ℤ) * Fintype.card J := by
  sorry

theorem twist (P : ParabolicBundle J) (d : ℤ) :
    parabolicDual (P.twist d) = (parabolicDual P).twist (-d) := by
  sorry

theorem coparabolicZero (P : ParabolicBundle J) :
    coparabolicOrdinaryDegree (parabolicDual P) =
      -P.ordinaryDegree - (P.rank : ℤ) * Fintype.card J := by
  sorry

-- TauCeti.ParabolicBounds.parabolicDual.mixed_rank_two
example :
    (parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit)).ordinaryDegree = -1 ∧
      ((parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit)).markedFlag ()).weight 0 = 0 ∧
      ((parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4) (by norm_num)⟩ :
        ParabolicBundle Unit)).markedFlag ()).weight 1 = 3/4 ∧
      parabolicDegree (parabolicDual (⟨2, 0, fun _ => WeightedFlag.twoStep 0 (1/4)
        (by norm_num)⟩ : ParabolicBundle Unit)) = -1/4 := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.trivial
example (r : ℕ) (d : ℤ) :
    parabolicDual (ParabolicBundle.trivial J r d) = ParabolicBundle.trivial J r (-d) := by
  sorry
-- TauCeti.ParabolicBounds.parabolicDual.coparabolic_zero_line
example (d : ℤ) :
    coparabolicOrdinaryDegree (parabolicDual (parabolicDegree.line d (1/4) (by norm_num))) =
        -d - 1 ∧
      coparabolicOrdinaryDegree (parabolicDual (parabolicDegree.line d 0 (by norm_num))) =
        -d - 1 := by
  sorry
end parabolicDual

theorem traceSectionMap.rank_eq_deficit {U W : Type*} [AddCommGroup U] [Module ℂ U]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ U] [FiniteDimensional ℂ W]
    (B : V →ₗ[ℂ] U →ₗ[ℂ] W) (v : V) :
    finrank ℂ (LinearMap.range (traceSectionMap B v)) =
      finrank ℂ U - finrank ℂ (LinearMap.ker (traceSectionMap B v)) := by
  sorry

/-! Named theorem prototypes: explicit portions, not opaque substitutes for geometry. -/

-- The limiting real inequality in the coparabolic quotient proof.
theorem ordinaryQuotientSlope (P : ParabolicBundle J) (μquot : ℝ)
    (hshift : ∀ ε : ℝ, 0 < ε → parabolicSlope P - Fintype.card J - ε ≤ μquot) :
    parabolicSlope P - Fintype.card J ≤ μquot := by
  sorry

-- The numerical degree/slope portion; actual dual/twist semistability is omitted.
theorem dualTwistSemistable (P : ParabolicBundle J) (d : ℤ) (hr : 0 < P.rank) :
    parabolicSlope (ParabolicBundle.twist (parabolicDual P) d) = -parabolicSlope P + d := by
  sorry

-- Determinant-degree consequence of the global isomorphism. Signed integer genus arithmetic.
theorem coparabolicDualTwist (P : ParabolicBundle J) (g : ℕ) :
    coparabolicOrdinaryDegree
      (ParabolicBundle.twist (parabolicDual P) (2 * (g : ℤ) - 2 + Fintype.card J)) =
      -P.ordinaryDegree + (P.rank : ℤ) * (2 * (g : ℤ) - 2) := by
  sorry

-- Riemann–Roch and HN/Clifford numerical inputs: saturation/HN/cohomology omitted.
theorem parabolicCliffordRank (g r u hV hU : ℕ) (dV dU : ℝ)
    (hru : u ≤ r) (hsec : hU ≤ hV)
    (hrr : dV + (1 - (g : ℝ)) * r ≤ hV)
    (hcl : (2 : ℝ) * hU ≤ dU + 2 * u)
    (hu : dU ≤ (2 * (g : ℝ) - 2) * u)
    (hv : (2 * (g : ℝ) - 2) * r ≤ dV) :
    g * (r - u) ≤ r + (hV - hU) ∧
      ((2 * (g : ℝ) - 2) * r < dV → g * (r - u) < r + (hV - hU)) := by
  sorry

-- Corank one and section deficit identified by the supplied sheaf-kernel comparison.
theorem traceRankBound (g rE c δ rμ : ℕ) (hc : c = 1) (hδ : δ = rμ)
    (hcl : g * c ≤ rE + δ) : g ≤ rE + rμ := by
  sorry

-- Linear-factorization portion of the corrected fixed-part argument.
theorem fixedPartVector
    {F L H U Q T : Type*}
    [AddCommGroup F] [Module ℂ F] [FiniteDimensional ℂ F]
    [AddCommGroup L] [Module ℂ L] [FiniteDimensional ℂ L]
    [AddCommGroup H] [Module ℂ H]
    [AddCommGroup U] [Module ℂ U] [FiniteDimensional ℂ U]
    [AddCommGroup Q] [Module ℂ Q] [FiniteDimensional ℂ Q]
    [AddCommGroup T] [Module ℂ T] [FiniteDimensional ℂ T]
    (e : F →ₗ[ℂ] H) (he : Function.Injective e)
    (B : H →ₗ[ℂ] U →ₗ[ℂ] T) (d : F →ₗ[ℂ] U →ₗ[ℂ] Q) (out : Q →ₗ[ℂ] T)
    (hfactor : ∀ x, B (e x) = out.comp (d x))
    (hq : 2 * finrank ℂ Q ≤ finrank ℂ L) (x : F) (hx : x ≠ 0) :
    ∃ v : H, v ≠ 0 ∧ v ∈ LinearMap.range e ∧
      2 * finrank ℂ (LinearMap.range (B v)) ≤ finrank ℂ L := by
  sorry

-- Exact integer rearrangement after the geometric trace/derivative comparisons.
theorem sublocalSystemRank (g rV rL rμ : ℕ)
    (htrace : g ≤ rV + rμ) (hderivative : 2 * rμ ≤ rL) :
    2 * g ≤ rL + 2 * rV := by
  sorry

-- The positive-integer product obstruction used with nonzero U and W.
theorem tensorInvariantRank (g a b : ℕ) (hg : 2 ≤ g) (ha : 0 < a) (hb : 0 < b)
    (hrank : 2 * g ≤ b + 2 * a) : g ≤ a * b := by
  sorry

-- Native invariants along a finite stable filtration. Geometry supplies the m_A-adic
-- filtration and the vanishing of its graded representations via tensorInvariantRank.
theorem artinianVanishing {A Γ M : Type*} [CommRing A] [Group Γ]
    [AddCommGroup M] [Module A M] (ρ : Representation A Γ M)
    (F : ℕ → Subrepresentation ρ) (N : ℕ)
    (hfirst : F 0 = ⊤) (hlast : F N = ⊥)
    (hgraded : ∀ k, k < N → ∀ v, v ∈ F k →
      (∀ γ, ρ γ v - v ∈ F (k + 1)) → v ∈ F (k + 1)) :
    Representation.invariants ρ = ⊥ := by
  sorry

end TauCeti.ParabolicBounds

/-!
## Exact global-signature completion inventory (gap G4)

* WeightedFlag: native finite fibre flag; no omission in its stated algebraic portion.
* ParabolicBundle: attach the actual locally free sheaf E on C and identify coordinate
  flags with E(x). Supply determinant degree; residueWeights is the diagonal spectral
  portion, with canonical logarithmic extension/monodromy omitted (H.2).
* inducedSubbundle/inducedQuotient: identify supplied fibre maps with saturated sheaf
  maps; rank/degree exactness and composition must come from that geometry (SF.3).
* parabolicDegree/parabolicSlope: identify the stored integer with deg det E (SF.3).
* IsParabolicallySemistable: the supplied catalogue must contain exactly saturated
  global subbundles; quotient_iff is stated for one induced sequence, and the ℙ¹ tests
  (split_unstable, strict_not_needed, weight_destabilises, weights_stabilise,
  small_sub_allowed) check the named subbundles, not the completeness of the catalogue.
* coparabolicZero: actual formal-disc kernel; glue local lattices, compare to sheaf
  kernel, identify finite length with degree loss and compute fibres (SF.3).
* parabolicDual: filtered internal Hom, the fibre description at mixed marks and the
  line-modification comparison with the ordinary dual sheaf are omitted. Degree shifts,
  weights, the twist compatibility and the coparabolic degree of the dual are retained.
* ParabolicBundle.filtration, coparabolicZero.eq_filtration/bounds: formal-disc model at one
  mark for α ≥ 0; negative indices need the meromorphic ambient, and gluing is SF.3.
* ParabolicBundle.Hom: fibre maps preserving the threshold steps; the global bundle map is
  omitted. ParabolicBundle.directSum and ParabolicBundle.shift keep the numerical/fibre data.
* ParabolicBundle.ofLogConnection: residue endomorphisms of the marked fibres only; the
  logarithmic connection and the canonical extension are H.2.
* unitaryParabolicSemistable: the degree identity from the residue theorem only;
  semistability needs the global saturated subbundles and gap G6.
* ParabolicBundle.twist: twist by a line bundle of degree d with the fibre of the line
  trivialized; the global line bundle is omitted.
* Packet names without a declaration here (global carriers needed): ParabolicBundle.toBundle,
  ParabolicBundle.exists_adapted_frame, inducedSubbundle.filtration_eq_inf,
  inducedQuotient.filtration_eq_map, IsParabolicallySemistable.dual_iff,
  IsParabolicallySemistable.directSum, parabolicDual.filtration, parabolicDual.fibre,
  parabolicDual.map, parabolicDual.induced_exact, traceSectionMap.eq_traceMultiplication,
  traceSectionMap.sheafMap, traceSectionMap.sheafKernel_corank_one, and the global-section
  tests traceSectionMap.trivial_bundle_rank, traceSectionMap.split_kernel and
  traceSectionMap.rank_zero_possible.
* The trace pairing itself is HodgeStructuresPartII:H.3/trace-multiplication; this file uses
  only its fibrewise model `LinearMap.applyₗ`.
* traceSectionMap: actual bilinear section modules are parameters; identify them with
  coherent H⁰ and identify native kernel with H⁰ of the sheaf kernel (SF.3).
* ordinaryQuotientSlope: shift/limit inequality only; quotient semistability and the
  filtered coparabolic shift construction omitted.
* dualTwistSemistable: slope identity only; global induced subbundle/quotient duality
  and semistability preservation omitted.
* coparabolicDualTwist: determinant-degree identity only; canonical sheaf isomorphism
  and compatibility with its inclusion omitted.
* parabolicCliffordRank: RR/Clifford arithmetic only; saturation, HN existence,
  H¹ vanishing and the strict/equal parabolic slope comparisons omitted (G1, SF.3).
* traceRankBound: corank-one/deficit substitution only; nonzero global section,
  saturated sheaf kernel and degree-zero semistability comparisons omitted.
* fixedPartVector: actual linear image/factorization bound; real VMHS/fixed part,
  conjugation, Hodge-homogeneous evaluation and the original inclusion omitted (H.2).
* sublocalSystemRank: exact numeric consequence only; actual higher direct-image
  monodromy, irreducible subobject, versality, total unitarity and period derivative
  comparisons omitted (H.2/H.3, G3). No arbitrary representation satisfies this bound.
* tensorInvariantRank: positive-integer consequence only; invariant tensor-to-Hom,
  the image sub-local system and application of the rank theorem omitted.
* artinianVanishing: actual representation invariant filtration argument; identify
  the representation with R¹π°_*V, construct the Artinian maximal-ideal filtration,
  and prove graded invariant vanishing using isotypic decomposition (G2, H.2).

These are completion obligations, not weaker versions claimed as global theorems.
Every other packet declaration, API and test name occurs above; implementation remains
unchecked.
-/

end
end Layer5

/-! ## H.5 -/

section Layer6

/-! ### H.5: signature boundary

The native part uses Mathlib at the pinned commit. The Tau Ceti baseline supplies later
local-coefficient and compactness inputs; neither Tau Ceti module is needed to elaborate these
signatures:

* trace-free adjoint coefficients on `LieAlgebra.SpecialLinear.sl` and Mathlib's group cohomology
  (`groupCohomology`, `groupCohomology.map`, `groupCohomology.H1InfRes`);
* rigidity of a representation in Simpson's orbit form, for the topology of pointwise convergence
  on `Γ →* GL (Fin r) ℂ` (the analytic topology of the representation variety when `Γ` is finitely
  generated), and cohomological rigidity relative to boundary loops;
* unitary, integral and strongly integral representations, with Mathlib's
  `NumberField.Embeddings` finiteness and Kronecker theorems and Tau Ceti's compactness of the
  unitary group;
* the rigid locus of a morphism of schemes as Mathlib's quasi-finite locus, and the part of an
  arithmetic model that Mathlib's schemes can express;
* a module-level (coordinate chart) model of systems of Hodge bundles.

All names are in the namespace `TauCeti.NonabelianHodge`; a comment `-- Name` before an `example`
gives the specification name of that unit test. Statements that need the moduli spaces of layer H.1, flat
bundles on varieties, polarized complex variations (layer H.2), projective linear groups or
completions are listed in the omission inventory at the end, with their mathematical statements.
No missing geometric condition is replaced by an opaque proposition.
-/

noncomputable section

open CategoryTheory
open scoped TensorProduct

namespace TauCeti.NonabelianHodge

/-! ## Trace-free adjoint coefficients -/

section TraceFree

variable {Γ : Type} [Group Γ] {K : Type} [Field K] {r : ℕ}


/-- The conjugation representation of `Γ` on all of `M_r(K)` (the full adjoint, which is not the
coefficient system of rigidity). -/
def conjRep (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (Matrix (Fin r) (Fin r) K) where
  toFun γ :=
    { toFun := fun A => (ρ γ : Matrix (Fin r) (Fin r) K) * A *
        (((ρ γ)⁻¹ : Matrix.GeneralLinearGroup (Fin r) K) : Matrix (Fin r) (Fin r) K)
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- The trace-free adjoint representation `ad⁰ρ` on `sl_r(K)`. -/
def TraceFreeAdjoint.rep (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Representation K Γ (LieAlgebra.SpecialLinear.sl (Fin r) K) where
  toFun γ :=
    { toFun := fun A => ⟨conjRep ρ γ A, by sorry⟩
      map_add' := by sorry
      map_smul' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- Twisting a representation by a character `χ`. -/
def scalarTwist (χ : Γ →* Kˣ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Γ →* Matrix.GeneralLinearGroup (Fin r) K where
  toFun γ := Matrix.GeneralLinearGroup.scalar (Fin r) (χ γ) * ρ γ
  map_one' := by sorry
  map_mul' := by sorry

namespace TraceFreeAdjoint

variable (ρ σ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem rep_apply (γ : Γ) (A : LieAlgebra.SpecialLinear.sl (Fin r) K) :
    ((rep ρ γ A : LieAlgebra.SpecialLinear.sl (Fin r) K) : Matrix (Fin r) (Fin r) K) =
      (ρ γ : Matrix (Fin r) (Fin r) K) * A *
        (((ρ γ)⁻¹ : Matrix.GeneralLinearGroup (Fin r) K) : Matrix (Fin r) (Fin r) K) := by
  sorry

/-- If `r` is invertible in `K`, `M_r(K) = sl_r(K) ⊕ K·1` compatibly with conjugation. -/
theorem endSplitting (h : (r : K) ≠ 0) :
    ∃ e : Matrix (Fin r) (Fin r) K ≃ₗ[K] (LieAlgebra.SpecialLinear.sl (Fin r) K × K),
      ∀ γ A, e (conjRep ρ γ A) = (rep ρ γ (e A).1, (e A).2) := by
  sorry

theorem conjEquiv (P : Matrix.GeneralLinearGroup (Fin r) K)
    (hP : ∀ γ, σ γ = P * ρ γ * P⁻¹) : Nonempty ((rep ρ).Equiv (rep σ)) := by
  sorry

theorem twist (χ : Γ →* Kˣ) : rep (scalarTwist χ ρ) = rep ρ := by
  sorry

/-- `ad⁰ρ` only depends on `ρ` up to scalars, i.e. on its projectivization. -/
theorem projectivization (hscal : ∀ γ, ∃ c : Kˣ,
    σ γ = Matrix.GeneralLinearGroup.scalar (Fin r) c * ρ γ) : rep σ = rep ρ := by
  sorry

/-- Schur: for absolutely irreducible `ρ` and `r` invertible, `ad⁰ρ` has no invariants. -/
theorem invariants_eq_bot [IsAlgClosed K] (h : (r : K) ≠ 0)
    (hρ : (matrixRepresentation ρ).IsIrreducible) (A : LieAlgebra.SpecialLinear.sl (Fin r) K)
    (hA : ∀ γ, rep ρ γ A = A) : A = 0 := by
  sorry

/-- Base change of the coefficient field commutes with `ad⁰`. -/
theorem baseChange_apply {L : Type} [Field L] (f : K →+* L) (γ : Γ)
    (A : LieAlgebra.SpecialLinear.sl (Fin r) K)
    (hA : (A : Matrix (Fin r) (Fin r) K).map f ∈ LieAlgebra.SpecialLinear.sl (Fin r) L) :
    ((rep ((Matrix.GeneralLinearGroup.map f).comp ρ) γ ⟨_, hA⟩ :
      LieAlgebra.SpecialLinear.sl (Fin r) L) : Matrix (Fin r) (Fin r) L) =
      ((rep ρ γ A : LieAlgebra.SpecialLinear.sl (Fin r) K) : Matrix (Fin r) (Fin r) K).map f := by
  sorry

-- TraceFreeAdjoint.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) K)
    (A : LieAlgebra.SpecialLinear.sl (Fin 1) K) : A = 0 := by
  sorry

-- TraceFreeAdjoint.test_char_two_no_splitting
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)) ∈ LieAlgebra.SpecialLinear.sl (Fin 2) (ZMod 2) ∧
    ¬ IsCompl (LinearMap.ker (Matrix.traceLinearMap (Fin 2) (ZMod 2) (ZMod 2)))
      (Submodule.span (ZMod 2) {(1 : Matrix (Fin 2) (Fin 2) (ZMod 2))}) := by
  sorry

-- TraceFreeAdjoint.test_irreducible_no_invariants
example (ρ : Equiv.Perm (Fin 3) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible) (A : LieAlgebra.SpecialLinear.sl (Fin 2) ℂ)
    (hA : ∀ γ, rep ρ γ A = A) : A = 0 := by
  sorry

end TraceFreeAdjoint

/-- The trace-free adjoint representation as an object of `Rep K Γ`. -/
abbrev adRep (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) : Rep K Γ :=
  Rep.of (TraceFreeAdjoint.rep ρ)

/-- For finitely generated `Γ`, `H¹(Γ, ad⁰ρ)` commutes with extension of the coefficient field. -/
def TraceFreeAdjoint.baseChange_H1 [Group.FG Γ] {L : Type} [Field L] [Algebra K L]
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    (L ⊗[K] (groupCohomology (adRep ρ) 1)) ≃ₗ[L]
      (groupCohomology (adRep ((Matrix.GeneralLinearGroup.map (algebraMap K L)).comp ρ)) 1) := by
  sorry

-- TraceFreeAdjoint.test_trivial_free_abelian
example (r : ℕ) :
    Module.finrank ℂ (groupCohomology
      (adRep (1 : Multiplicative (ℤ × ℤ) →* Matrix.GeneralLinearGroup (Fin r) ℂ)) 1) =
      2 * (r ^ 2 - 1) := by
  sorry

-- TraceFreeAdjoint.test_full_adjoint_differs
example : Nontrivial (groupCohomology
      (Rep.of (conjRep (1 : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ))) 1) ∧
    Subsingleton (groupCohomology
      (adRep (1 : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)) 1) := by
  sorry

end TraceFree

/-! ## Boundary loops and quasi-unipotence -/

section Boundary

variable {Γ : Type} [Group Γ] {K : Type} [Field K] {r : ℕ}

/-- Quasi-unipotent local monodromy along given boundary loops `T i`. -/
def IsQuasiUnipotentAtInfinity {ι : Type} (T : ι → Γ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) : Prop :=
  ∀ i, ∃ m : ℕ, 0 < m ∧
    IsNilpotent (((ρ (T i) ^ m : Matrix.GeneralLinearGroup (Fin r) K) :
      Matrix (Fin r) (Fin r) K) - 1)

namespace IsQuasiUnipotentAtInfinity

variable {ι : Type} (T : ι → Γ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem iff_eigenvalues [IsAlgClosed K] : IsQuasiUnipotentAtInfinity T ρ ↔
    ∀ i, ∀ μ ∈ (((ρ (T i) : Matrix.GeneralLinearGroup (Fin r) K) :
      Matrix (Fin r) (Fin r) K).charpoly).roots, ∃ n : ℕ, 0 < n ∧ μ ^ n = 1 := by
  sorry

theorem conj_aut (f : K ≃+* K) :
    IsQuasiUnipotentAtInfinity T ((Matrix.GeneralLinearGroup.map (f : K →+* K)).comp ρ) ↔
      IsQuasiUnipotentAtInfinity T ρ := by
  sorry

-- BoundaryMonodromyData.test_projective_vacuous
example [IsEmpty ι] : IsQuasiUnipotentAtInfinity T ρ := by
  sorry

-- BoundaryMonodromyData.test_Gm_root_of_unity
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ) :
    IsQuasiUnipotentAtInfinity ![Multiplicative.ofAdd (1 : ℤ), Multiplicative.ofAdd (-1 : ℤ)] ρ ↔
      ∃ n : ℕ, 0 < n ∧
        ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0) ^ n = 1 := by
  sorry

-- BoundaryMonodromyData.test_Gm_not_quasiUnipotent
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0 = 2) :
    ¬ IsQuasiUnipotentAtInfinity ![Multiplicative.ofAdd (1 : ℤ), Multiplicative.ofAdd (-1 : ℤ)] ρ := by
  sorry

-- BoundaryMonodromyData.test_unipotent_infinite_order
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
      Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1; 0, 1]) :
    IsQuasiUnipotentAtInfinity ![Multiplicative.ofAdd (1 : ℤ), Multiplicative.ofAdd (-1 : ℤ)] ρ ∧
      ¬ IsOfFinOrder (ρ (Multiplicative.ofAdd 1)) := by
  sorry

end IsQuasiUnipotentAtInfinity

end Boundary

/-! ## Rigidity predicates -/

section Rigidity

variable {Γ : Type} [Group Γ] {K : Type} [Field K] {r : ℕ}

/-- Strong cohomological rigidity: `H¹(Γ, ad⁰ρ) = 0`. -/
def IsStronglyCohomologicallyRigid (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) : Prop :=
  Subsingleton (groupCohomology (adRep ρ) 1)

/-- Restriction of `H¹(Γ, ad⁰ρ)` to the cyclic subgroup generated by a loop `T`. -/
abbrev restrictToLoop (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) (T : Γ) :=
  groupCohomology.map (Subgroup.zpowers T).subtype (𝟙 _) 1 (A := adRep ρ)

/-- Cohomological rigidity relative to boundary loops `T i` (the local monodromy loops of a good
compactification): the restriction `H¹(Γ, ad⁰ρ) → ⊕ᵢ H¹(⟨Tᵢ⟩, ad⁰ρ)` is injective. This is the
group-theoretic form of `H¹(U, a_* End⁰ V) = 0`; with no loops it is strong cohomological
rigidity. -/
def IsCohomologicallyRigid {ι : Type} (T : ι → Γ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K) :
    Prop :=
  ∀ x : groupCohomology (adRep ρ) 1, (∀ i, (restrictToLoop ρ (T i)).hom x = 0) → x = 0

namespace IsStronglyCohomologicallyRigid

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem isCohomologicallyRigid {ι : Type} (T : ι → Γ) (h : IsStronglyCohomologicallyRigid ρ) :
    IsCohomologicallyRigid T ρ := by
  sorry

/-- Restriction to a finite-index subgroup (a finite étale cover) is injective on `H¹` in
characteristic zero. -/
theorem of_finiteCover [CharZero K] (H : Subgroup Γ) [H.FiniteIndex]
    (h : IsStronglyCohomologicallyRigid (ρ.comp H.subtype)) :
    IsStronglyCohomologicallyRigid ρ := by
  sorry

theorem conj_aut (f : K ≃+* K) :
    IsStronglyCohomologicallyRigid ((Matrix.GeneralLinearGroup.map (f : K →+* K)).comp ρ) ↔
      IsStronglyCohomologicallyRigid ρ := by
  sorry

theorem of_groupCohomology :
    IsStronglyCohomologicallyRigid ρ ↔ Subsingleton (groupCohomology (adRep ρ) 1) := by
  sorry

-- IsStronglyCohomologicallyRigid.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) K) : IsStronglyCohomologicallyRigid ρ := by
  sorry

-- IsStronglyCohomologicallyRigid.test_projective
example {ι : Type} [IsEmpty ι] (T : ι → Γ) :
    IsStronglyCohomologicallyRigid ρ ↔ IsCohomologicallyRigid T ρ := by
  sorry

-- IsStronglyCohomologicallyRigid.test_free_group
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible) :
    Module.finrank ℂ (groupCohomology (adRep ρ) 1) = 3 := by
  sorry

-- IsStronglyCohomologicallyRigid.test_hypergeometric
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible) : ¬ IsStronglyCohomologicallyRigid ρ := by
  sorry

end IsStronglyCohomologicallyRigid

/-- The three local monodromy loops of `ℙ¹ ∖ {0, 1, ∞}`, whose fundamental group is free on the
loops around `0` and `1`. -/
def hypergeometricLoops : Fin 3 → FreeGroup (Fin 2) :=
  ![FreeGroup.of 0, FreeGroup.of 1, (FreeGroup.of 0 * FreeGroup.of 1)⁻¹]

namespace IsCohomologicallyRigid

variable {ι : Type} (T : ι → Γ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) K)

theorem of_strong (h : IsStronglyCohomologicallyRigid ρ) : IsCohomologicallyRigid T ρ := by
  sorry

theorem projective_iff [IsEmpty ι] :
    IsCohomologicallyRigid T ρ ↔ IsStronglyCohomologicallyRigid ρ := by
  sorry

theorem conj_aut (f : K ≃+* K) :
    IsCohomologicallyRigid T ((Matrix.GeneralLinearGroup.map (f : K →+* K)).comp ρ) ↔
      IsCohomologicallyRigid T ρ := by
  sorry

-- IsCohomologicallyRigid.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) K) : IsCohomologicallyRigid T ρ := by
  sorry

-- IsCohomologicallyRigid.test_projective_groupCohomology
example [IsEmpty ι] :
    IsCohomologicallyRigid T ρ ↔ Subsingleton (groupCohomology (adRep ρ) 1) := by
  sorry

-- IsCohomologicallyRigid.test_hypergeometric
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hT : ∀ i, ∀ c : ℂˣ, ρ (hypergeometricLoops i) ≠ Matrix.GeneralLinearGroup.scalar (Fin 2) c) :
    IsCohomologicallyRigid hypergeometricLoops ρ := by
  sorry

-- IsCohomologicallyRigid.test_not_strong
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hT : ∀ i, ∀ c : ℂˣ, ρ (hypergeometricLoops i) ≠ Matrix.GeneralLinearGroup.scalar (Fin 2) c) :
    IsCohomologicallyRigid hypergeometricLoops ρ ∧ ¬ IsStronglyCohomologicallyRigid ρ := by
  sorry

end IsCohomologicallyRigid

/-- The topology of pointwise convergence on representations; for finitely generated `Γ` it is
the analytic topology of the representation variety. -/
abbrev repTopology (Γ : Type) [Group Γ] (r : ℕ) :
    TopologicalSpace (Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) :=
  TopologicalSpace.induced
    (fun ρ γ => ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ))
    inferInstance

/-- Rigidity includes irreducibility and fixed determinant `δ`: every nearby representation with
determinant `δ` is conjugate to `ρ`. For finitely generated `Γ` over `ℂ` it is
equivalent to isolation of `[ρ]` in `M_B^s(Γ, r, δ)` (layer H.1's coarse space). -/
def IsRigidRepresentation (δ : Γ →* ℂˣ) (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  (matrixRepresentation ρ).IsIrreducible ∧
    Matrix.GeneralLinearGroup.det.comp ρ = δ ∧
    ∀ᶠ σ in @nhds _ (repTopology Γ r) ρ, Matrix.GeneralLinearGroup.det.comp σ = δ →
      ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ, σ γ = P * ρ γ * P⁻¹

namespace IsRigidRepresentation

variable (δ : Γ →* ℂˣ) (ρ σ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem conj (P : Matrix.GeneralLinearGroup (Fin r) ℂ) (hP : ∀ γ, σ γ = P * ρ γ * P⁻¹) :
    IsRigidRepresentation δ σ ↔ IsRigidRepresentation δ ρ := by
  sorry

theorem twist (χ : Γ →* ℂˣ) :
    IsRigidRepresentation (χ ^ r * δ) (scalarTwist χ ρ) ↔ IsRigidRepresentation δ ρ := by
  sorry

theorem of_cohomologicallyRigid [Group.FG Γ] (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ)
    (h : IsStronglyCohomologicallyRigid ρ) : IsRigidRepresentation δ ρ := by
  sorry

theorem rankOne (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ) : IsRigidRepresentation δ ρ := by
  sorry

-- IsRigidRepresentation.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ) : IsRigidRepresentation δ ρ := by
  sorry

-- IsRigidRepresentation.test_finite_group
example [Finite Γ] (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = δ) : IsRigidRepresentation δ ρ := by
  sorry

-- IsRigidRepresentation.test_free_group
example (ρ : FreeGroup (Fin 2) →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hδ : Matrix.GeneralLinearGroup.det.comp ρ = 1) : ¬ IsRigidRepresentation 1 ρ := by
  sorry

-- IsRigidRepresentation.test_unfixed_determinant
example (ρ : Multiplicative (ℤ × ℤ) →* Matrix.GeneralLinearGroup (Fin 1) ℂ) :
    IsRigidRepresentation (Matrix.GeneralLinearGroup.det.comp ρ) ρ ∧
      ∃ᶠ σ in @nhds _ (repTopology (Multiplicative (ℤ × ℤ)) 1) ρ,
        ¬ ∃ P : Matrix.GeneralLinearGroup (Fin 1) ℂ, ∀ γ, σ γ = P * ρ γ * P⁻¹ := by
  sorry

-- IsRigidRepresentation.test_reducible_excluded
example : ¬ IsRigidRepresentation 1
    (1 : Unit →* Matrix.GeneralLinearGroup (Fin 2) ℂ) := by
  sorry

end IsRigidRepresentation

/-- Absolute irreducibility: irreducible after extension of scalars to an algebraic closure. -/
def IsAbsolutelyIrreducible {A : Type} [Field A] (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) A) :
    Prop :=
  (matrixRepresentation
    ((Matrix.GeneralLinearGroup.map (algebraMap A (AlgebraicClosure A))).comp ρ)).IsIrreducible

namespace IsAbsolutelyIrreducible

theorem iff_algebraicClosure {A Ω : Type} [Field A] [Field Ω] [IsAlgClosed Ω] [Algebra A Ω]
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) A) :
    IsAbsolutelyIrreducible ρ ↔
      (matrixRepresentation
        ((Matrix.GeneralLinearGroup.map (algebraMap A Ω)).comp ρ)).IsIrreducible := by
  sorry

end IsAbsolutelyIrreducible

-- ProjectiveRepresentation.test_rotation_not_absolutely_irreducible
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℝ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℝ) :
      Matrix (Fin 2) (Fin 2) ℝ) = !![0, -1; 1, 0]) :
    (matrixRepresentation ρ).IsIrreducible ∧ ¬ IsAbsolutelyIrreducible ρ := by
  sorry

/-- Rigidity, cohomological rigidity and quasi-unipotence are invariant under field automorphisms
of `ℂ` (which need not be continuous). -/
theorem rigidity_conj_aut [Group.FG Γ] (f : ℂ ≃+* ℂ) (δ : Γ →* ℂˣ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (hρ : (matrixRepresentation ρ).IsIrreducible) :
    IsRigidRepresentation ((Units.map (f : ℂ →* ℂ)).comp δ)
        ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp ρ) ↔
      IsRigidRepresentation δ ρ := by
  sorry

/-- Rigid representations with finite-order determinant are defined over a number field. -/
theorem exists_numberField_of_rigid [Group.FG Γ] (δ : Γ →* ℂˣ) (hδ : ∀ γ, IsOfFinOrder (δ γ))
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (hρ : (matrixRepresentation ρ).IsIrreducible)
    (hdet : Matrix.GeneralLinearGroup.det.comp ρ = δ) (h : IsRigidRepresentation δ ρ) :
    ∃ L : IntermediateField ℚ ℂ, FiniteDimensional ℚ L ∧
      ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j,
        ((P * ρ γ * P⁻¹ : Matrix.GeneralLinearGroup (Fin r) ℂ) :
          Matrix (Fin r) (Fin r) ℂ) i j ∈ L := by
  sorry

end Rigidity

/-! ## Unitary, integral and strongly integral representations -/

section Integral

open NumberField
open scoped ComplexOrder

variable {Γ : Type} [Group Γ] {r : ℕ}

/-- Conjugate of a representation by `P`, as a matrix-valued function. -/
abbrev conjMatrix (P : Matrix.GeneralLinearGroup (Fin r) ℂ)
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) (γ : Γ) : Matrix (Fin r) (Fin r) ℂ :=
  ((P * ρ γ * P⁻¹ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ)

/-- Unitary: the image has compact closure. -/
def IsUnitaryRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  IsCompact (closure (Set.range fun γ =>
    ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ)))

/-- Integral: conjugate into `GL_r(𝒪_K)` for a number field `K ⊂ ℂ` (entries in `K` and
integral over `ℤ`). The full ring of integers is required. -/
def IsIntegralRepresentation (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  ∃ K : IntermediateField ℚ ℂ, FiniteDimensional ℚ K ∧
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j,
      conjMatrix P ρ γ i j ∈ K ∧ IsIntegral ℤ (conjMatrix P ρ γ i j)

/-- An integral realization of `ρ`: a number field, an `𝒪_K`-valued representation, a complex
embedding and a conjugator. (For a group scheme fixed over ℤ, use its base change to `𝒪_K`.) -/
structure IntegralRealization (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) where
  /-- the number field -/
  K : Type
  [field : Field K]
  [numberField : NumberField K]
  /-- the integral representation -/
  ρK : Γ →* Matrix.GeneralLinearGroup (Fin r) (𝓞 K)
  /-- the complex embedding -/
  ι : K →+* ℂ
  /-- the conjugator -/
  P : Matrix.GeneralLinearGroup (Fin r) ℂ
  /-- compatibility -/
  conj : ∀ γ, P * ρ γ * P⁻¹ = Matrix.GeneralLinearGroup.map (ι.comp (algebraMap (𝓞 K) K)) (ρK γ)

/-- Strongly integral: conjugate into `GL_r(ℤ)`. -/
def IsStronglyIntegral (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) : Prop :=
  ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j, ∃ n : ℤ, conjMatrix P ρ γ i j = n

namespace IsUnitaryRepresentation

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem iff_conj_unitaryGroup : IsUnitaryRepresentation ρ ↔
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ,
      conjMatrix P ρ γ ∈ Matrix.unitaryGroup (Fin r) ℂ := by
  sorry

theorem iff_invariant_form : IsUnitaryRepresentation ρ ↔
    ∃ H : Matrix (Fin r) (Fin r) ℂ, Matrix.PosDef H ∧ ∀ γ,
      ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ).conjTranspose * H *
        ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ) = H := by
  sorry

theorem semisimple (h : IsUnitaryRepresentation ρ)
    (W : Submodule ℂ (Fin r → ℂ)) (hW : ∀ γ, W.map (matrixRepresentation ρ γ) ≤ W) :
    ∃ W' : Submodule ℂ (Fin r → ℂ), IsCompl W W' ∧
      ∀ γ, W'.map (matrixRepresentation ρ γ) ≤ W' := by
  sorry

theorem of_finite (h : (Set.range ρ).Finite) : IsUnitaryRepresentation ρ := by
  sorry

theorem comp {Γ' : Type} [Group Γ'] (f : Γ' →* Γ) (h : IsUnitaryRepresentation ρ) :
    IsUnitaryRepresentation (ρ.comp f) := by
  sorry

theorem not_aut_invariant : ∃ (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (f : ℂ ≃+* ℂ), IsUnitaryRepresentation ρ ∧
      ¬ IsUnitaryRepresentation ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp ρ) := by
  sorry

-- IsUnitaryRepresentation.test_rank_one
example (ρ : Γ →* Matrix.GeneralLinearGroup (Fin 1) ℂ) :
    IsUnitaryRepresentation ρ ↔ ∀ γ, ‖(ρ γ : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0‖ = 1 := by
  sorry

-- IsUnitaryRepresentation.test_unipotent
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
      Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1; 0, 1]) :
    ¬ IsUnitaryRepresentation ρ := by
  sorry

-- IsUnitaryRepresentation.test_finite_image
example [Finite Γ] : IsUnitaryRepresentation ρ := by
  sorry

-- IsUnitaryRepresentation.test_unitaryGroup_valued
example (h : ∀ γ, ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) : Matrix (Fin r) (Fin r) ℂ) ∈
    Matrix.unitaryGroup (Fin r) ℂ) : IsUnitaryRepresentation ρ := by
  sorry

-- IsUnitaryRepresentation.test_galois_nonexample
example (α : ℂˣ) (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0)
    (h₂ : ‖(α : ℂ)‖ = 1) :
    ∃ f : ℂ ≃+* ℂ, ‖f (α : ℂ)‖ ≠ 1 := by
  sorry

end IsUnitaryRepresentation

namespace IsIntegralRepresentation

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem iff_algebraicIntegers [Group.FG Γ] : IsIntegralRepresentation ρ ↔
    ∃ P : Matrix.GeneralLinearGroup (Fin r) ℂ, ∀ γ i j, IsIntegral ℤ (conjMatrix P ρ γ i j) := by
  sorry

theorem of_finite (h : (Set.range ρ).Finite) : IsIntegralRepresentation ρ := by
  sorry

theorem charpoly (h : IsIntegralRepresentation ρ) (γ : Γ) (k : ℕ) :
    IsIntegral ℤ ((((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) :
      Matrix (Fin r) (Fin r) ℂ).charpoly).coeff k) := by
  sorry

theorem conj_aut (f : ℂ ≃+* ℂ) :
    IsIntegralRepresentation ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp ρ) ↔
      IsIntegralRepresentation ρ := by
  sorry

theorem of_realization (R : IntegralRealization ρ) : IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_trivial
example : IsIntegralRepresentation (1 : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ) := by
  sorry

-- IsIntegralRepresentation.test_half_not_integral
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0 = 1 / 2) :
    ¬ IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_S_integral_not_integral
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ)
    (h : (ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 1) ℂ) 0 0 = 2) :
    ¬ IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_unipotent
example (ρ : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 2) ℂ)
    (h : ((ρ (Multiplicative.ofAdd 1) : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
      Matrix (Fin 2) (Fin 2) ℂ) = !![1, 1 / 3; 0, 1]) :
    IsIntegralRepresentation ρ := by
  sorry

-- IsIntegralRepresentation.test_compat_ringOfIntegers
example (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    (h : ∀ γ i j, (ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) i j ∈ K ∧
      IsIntegral ℤ ((ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) i j)) :
    IsIntegralRepresentation ρ := by
  sorry

end IsIntegralRepresentation

namespace IsStronglyIntegral

variable (ρ : Γ →* Matrix.GeneralLinearGroup (Fin r) ℂ)

theorem isIntegral (h : IsStronglyIntegral ρ) : IsIntegralRepresentation ρ := by
  sorry

theorem iff_lattice : IsStronglyIntegral ρ ↔
    ∃ Λ : Submodule ℤ (Fin r → ℂ), (∃ b : Module.Basis (Fin r) ℤ Λ,
      LinearIndependent ℂ (fun i => (b i : Fin r → ℂ))) ∧
      ∀ γ, Λ.map ((matrixRepresentation ρ γ).restrictScalars ℤ) ≤ Λ := by
  sorry

/-- Strong integrality and unitarity force finite image. -/
theorem unitary_finite (h₁ : IsStronglyIntegral ρ) (h₂ : IsUnitaryRepresentation ρ) :
    (Set.range ρ).Finite := by
  sorry

-- IsStronglyIntegral.test_gl_n_Z
example (h : ∀ γ i j, ∃ n : ℤ, (ρ γ : Matrix.GeneralLinearGroup (Fin r) ℂ) i j = n) :
    IsStronglyIntegral ρ := by
  sorry

-- IsStronglyIntegral.test_implies_integral
example (h : IsStronglyIntegral ρ) : IsIntegralRepresentation ρ := by
  sorry

end IsStronglyIntegral

/-- Integral representations unitary at every complex embedding have finite image
(Landesman–Litt 2022, Lemma 7.2.1). -/
theorem unitary_embeddings_finite {K : Type} [Field K] [NumberField K] {m : ℕ}
    (ρ : Γ →* Matrix.GeneralLinearGroup (Fin m) (𝓞 K))
    (h : ∀ ι : K →+* ℂ, IsUnitaryRepresentation
      ((Matrix.GeneralLinearGroup.map (ι.comp (algebraMap (𝓞 K) K))).comp ρ)) :
    (Set.range ρ).Finite := by
  sorry

/-- The rank-one character `n ↦ αⁿ` of `ℤ`; pulled back along `π₁(Σ) → ℤ` it is the character of
Esnault–Groechenig's Example 6.3. -/
def SalemCharacter (α : ℂˣ) : Multiplicative ℤ →* Matrix.GeneralLinearGroup (Fin 1) ℂ :=
  (Matrix.GeneralLinearGroup.scalar (Fin 1)).comp (zpowersHom ℂˣ α)

namespace SalemCharacter

variable (α : ℂˣ)

theorem isUnitary (h : ‖(α : ℂ)‖ = 1) : IsUnitaryRepresentation (SalemCharacter α) := by
  sorry

theorem isIntegral (h : IsIntegral ℤ (α : ℂ)) (h' : IsIntegral ℤ ((α⁻¹ : ℂˣ) : ℂ)) :
    IsIntegralRepresentation (SalemCharacter α) := by
  sorry

theorem infinite_range (h : ∀ n : ℕ, 0 < n → (α : ℂ) ^ n ≠ 1) :
    (Set.range (SalemCharacter α)).Infinite := by
  sorry

theorem not_strongly_integral (h : ∀ n : ℕ, 0 < n → (α : ℂ) ^ n ≠ 1) :
    ¬ IsStronglyIntegral (SalemCharacter α) := by
  sorry

theorem exists_nonunitary_conjugate (hint : IsIntegral ℤ (α : ℂ))
    (h : ∀ n : ℕ, 0 < n → (α : ℂ) ^ n ≠ 1) :
    ∃ f : ℂ ≃+* ℂ, ¬ IsUnitaryRepresentation
      ((Matrix.GeneralLinearGroup.map (f : ℂ →+* ℂ)).comp (SalemCharacter α)) := by
  sorry

-- SalemCharacter.test_unitary
example (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0) (h₂ : ‖(α : ℂ)‖ = 1) :
    IsUnitaryRepresentation (SalemCharacter α) ∧ IsIntegralRepresentation (SalemCharacter α) := by
  sorry

-- SalemCharacter.test_infinite_image
example (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0) (h₂ : ‖(α : ℂ)‖ = 1) :
    (Set.range (SalemCharacter α)).Infinite := by
  sorry

-- SalemCharacter.test_kronecker
example (K : Type) [Field K] [NumberField K] (x : K) (hx : IsIntegral ℤ x)
    (hroot : ∀ n : ℕ, 0 < n → x ^ n ≠ 1) : ∃ φ : K →+* ℂ, ‖φ x‖ ≠ 1 := by
  sorry

-- SalemCharacter.test_gaussian_not_integral
example : ‖((3 + 4 * Complex.I) / 5 : ℂ)‖ = 1 ∧ (∀ n : ℕ, 0 < n → ((3 + 4 * Complex.I) / 5 : ℂ) ^ n ≠ 1) ∧
    ¬ IsIntegral ℤ ((3 + 4 * Complex.I) / 5 : ℂ) := by
  sorry

-- IsStronglyIntegral.test_salem_not_strong
example (h₁ : (α : ℂ) ^ 4 - (α : ℂ) ^ 3 - (α : ℂ) ^ 2 - (α : ℂ) + 1 = 0) (h₂ : ‖(α : ℂ)‖ = 1) :
    IsIntegralRepresentation (SalemCharacter α) ∧ ¬ IsStronglyIntegral (SalemCharacter α) := by
  sorry

end SalemCharacter

end Integral

/-! ## Rigid loci of moduli schemes and arithmetic models -/

section RigidLocus

open AlgebraicGeometry

/-- The rigid locus of a morphism locally of finite type: Mathlib's quasi-finite locus
(Esnault–Groechenig, Definition 3.2). -/
abbrev RigidLocus {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f] : M.Opens :=
  f.quasiFiniteLocus

namespace RigidLocus

variable {M S : Scheme.{0}} (f : M ⟶ S) [LocallyOfFiniteType f]

theorem mem_iff_isolated (x : M) : x ∈ RigidLocus f ↔ IsOpen {f.asFiber x} := by
  sorry

instance locallyQuasiFinite : LocallyQuasiFinite ((RigidLocus f).ι ≫ f) := by
  sorry

theorem field_isClopen (K : Type) [Field K] (g : M ⟶ Spec (CommRingCat.of K))
    [LocallyOfFiniteType g] [QuasiCompact g] : IsClopen ((RigidLocus g : M.Opens) : Set M) := by
  sorry

theorem comp_openImmersion {M' : Scheme.{0}} (j : M' ⟶ M) [IsOpenImmersion j]
    [LocallyOfFiniteType (j ≫ f)] : RigidLocus (j ≫ f) = j ⁻¹ᵁ RigidLocus f := by
  sorry

theorem isFinite_of_isProper [IsSeparated f] [IsProper ((RigidLocus f).ι ≫ f)] :
    IsFinite ((RigidLocus f).ι ≫ f) := by
  sorry

theorem equivariant (a : M ≅ M) (b : S ≅ S) (h : a.hom ≫ f = f ≫ b.hom) :
    a.hom ⁻¹ᵁ RigidLocus f = RigidLocus f := by
  sorry

-- RigidLocus.test_fat_point (every finite morphism, e.g. `Spec ℂ[x]/(x²) → Spec ℂ`, is rigid)
example [IsFinite f] : RigidLocus f = ⊤ := by
  sorry

-- RigidLocus.test_affine_line
example [LocallyOfFiniteType (𝔸(Fin 1; Spec (CommRingCat.of ℂ)) ↘ Spec (CommRingCat.of ℂ))] :
    RigidLocus (𝔸(Fin 1; Spec (CommRingCat.of ℂ)) ↘ Spec (CommRingCat.of ℂ)) = ⊥ := by
  sorry

-- RigidLocus.test_compat_mathlib
example (x : M) : x ∈ RigidLocus f ↔ f.QuasiFiniteAt x := by
  sorry

end RigidLocus

/-- The part of an arithmetic model expressible with Mathlib's schemes: a finitely generated
subring `R ⊂ ℂ` smooth over `ℤ`, a smooth proper `X_S → Spec R` with geometrically connected fibres,
an identification over `Spec ℂ` of its base change along `Spec ℂ → Spec R` with `X`, and a spread
section compatible with the base point `x`. The torsion line bundle `L_S`, the isomorphism
`L_S^{⊗d} ≅ O`, invertibility of `d` and projectivity have no Mathlib carrier at the pinned commit
(omission inventory). -/
structure ArithmeticModel (X : Scheme.{0}) (f : X ⟶ Spec (CommRingCat.of ℂ))
    (x : Spec (CommRingCat.of ℂ) ⟶ X) where
  /-- the coefficient ring, a finitely generated subring of `ℂ` -/
  R : Subring ℂ
  fg : Algebra.FiniteType ℤ R
  smooth : Smooth (Spec.map (CommRingCat.ofHom (algebraMap ℤ R)))
  /-- the model -/
  XS : Scheme.{0}
  p : XS ⟶ Spec (CommRingCat.of R)
  smooth_p : Smooth p
  proper_p : IsProper p
  geomConnected_p : GeometricallyConnected p
  /-- the generic-fibre identification, over `Spec ℂ` -/
  genericFibreIso : Limits.pullback p (Spec.map (CommRingCat.ofHom R.subtype)) ≅ X
  genericFibreIso_over : genericFibreIso.hom ≫ f = Limits.pullback.snd _ _
  /-- the spread base point -/
  xS : Spec (CommRingCat.of R) ⟶ XS
  section_p : xS ≫ p = 𝟙 _
  basePoint : ∀ h : (Spec.map (CommRingCat.ofHom R.subtype) ≫ xS) ≫ p =
      𝟙 _ ≫ Spec.map (CommRingCat.ofHom R.subtype),
    Limits.pullback.lift _ _ h ≫ genericFibreIso.hom = x

namespace ArithmeticModel

variable {X : Scheme.{0}} {f : X ⟶ Spec (CommRingCat.of ℂ)} {x : Spec (CommRingCat.of ℂ) ⟶ X}

/-- Every smooth proper geometrically connected `X/ℂ` with a point has an arithmetic model. -/
theorem «exists» [Smooth f] [IsProper f] [GeometricallyConnected f] (hx : x ≫ f = 𝟙 _) :
    Nonempty (ArithmeticModel X f x) := by
  sorry

/-- Restriction of a model to `R[1/g]` for nonzero `g ∈ R` is again a model, with `X_S` replaced by
its base change. -/
theorem restrict (M : ArithmeticModel X f x) (g : M.R) (hg : g ≠ 0) :
    ∃ (M' : ArithmeticModel X f x) (h : M.R ≤ M'.R),
      (M'.R : Set ℂ) = Subring.closure (insert ((g : ℂ)⁻¹) (M.R : Set ℂ)) ∧
        Nonempty (M'.XS ≅ Limits.pullback M.p
          (Spec.map (CommRingCat.ofHom (Subring.inclusion h)))) := by
  sorry

-- ArithmeticModel.test_generic_fibre
example (M : ArithmeticModel X f x) :
    Smooth f ∧ IsProper f ∧ M.genericFibreIso.hom ≫ f = Limits.pullback.snd _ _ := by
  sorry

end ArithmeticModel

end RigidLocus

/-! ## Systems of Hodge bundles: coordinate model

A chart model: `E` an `R`-module with an internal `ℤ`-grading by submodules `Ep p` and
`θ : E → E ⊗ Ω` of degree `-1`, with `Ω` finite free as on a cotangent chart.
This hypothesis makes commuting contractions equivalent to exterior-square integrability.
For a torsion module `Ω` over `ℤ`, its dual can vanish and contractions cannot detect curvature.
The sheaf version on a complex manifold is in the omission inventory. -/

section HodgeBundles

open TensorProduct

/-- The component of a Higgs field `θ : E → E ⊗ Ω` along a covector `v` of `Ω`. -/
def higgsComponent {R : Type} [CommRing R] {Ω E : Type} [AddCommGroup Ω] [Module R Ω]
    [AddCommGroup E] [Module R E] (θ : E →ₗ[R] E ⊗[R] Ω) (v : Module.Dual R Ω) : E →ₗ[R] E :=
  (TensorProduct.rid R E).toLinearMap ∘ₗ TensorProduct.map LinearMap.id v ∘ₗ θ

/-- A system of Hodge bundles in a coordinate chart. -/
structure SystemOfHodgeBundles (R : Type) [CommRing R] (Ω E : Type) [AddCommGroup Ω] [Module R Ω]
    [Module.Free R Ω] [Module.Finite R Ω] [AddCommGroup E] [Module R E] where
  /-- the Hodge pieces -/
  Ep : ℤ → Submodule R E
  /-- the decomposition is internal -/
  isInternal : DirectSum.IsInternal Ep
  /-- finitely many nonzero pieces -/
  finite_support : {p : ℤ | Ep p ≠ ⊥}.Finite
  /-- the Higgs field -/
  θ : E →ₗ[R] E ⊗[R] Ω
  /-- degree `-1` -/
  lowers : ∀ p, ∀ e ∈ Ep p, θ e ∈ LinearMap.range (TensorProduct.map (Ep (p - 1)).subtype
    (LinearMap.id : Ω →ₗ[R] Ω))
  /-- integrability `θ ∧ θ = 0`, in the chart form: the components of `θ` commute -/
  integrable : ∀ v w : Module.Dual R Ω,
    higgsComponent θ v ∘ₗ higgsComponent θ w = higgsComponent θ w ∘ₗ higgsComponent θ v

namespace SystemOfHodgeBundles

variable {R : Type} [CommRing R] {Ω E : Type} [AddCommGroup Ω] [Module R Ω]
  [Module.Free R Ω] [Module.Finite R Ω] [AddCommGroup E] [Module R E]
  (H : SystemOfHodgeBundles R Ω E)

/-- The component of `θ` along a covector `v` of `Ω`. -/
def contract (v : Module.Dual R Ω) : E →ₗ[R] E :=
  higgsComponent H.θ v

/-- Multiplication by `t ^ p` on `Ep p` is an isomorphism from `(E, t θ)` to `(E, θ)`. -/
theorem scaleIso (t : Rˣ) : ∃ φ : E ≃ₗ[R] E, (∀ p, ∀ e ∈ H.Ep p, φ e = ((t ^ p : Rˣ) : R) • e) ∧
    ∀ e, TensorProduct.map φ.toLinearMap (LinearMap.id : Ω →ₗ[R] Ω) ((t : R) • H.θ e) =
      H.θ (φ e) := by
  sorry

/-- The shift of the grading. -/
def shift (k : ℤ) : SystemOfHodgeBundles R Ω E where
  Ep p := H.Ep (p + k)
  isInternal := by sorry
  finite_support := by sorry
  θ := H.θ
  lowers := by sorry
  integrable := H.integrable

/-- Joint nilpotence: any product of `N` components of `θ` vanishes once `N` exceeds the number of
nonzero degrees. -/
theorem nilpotent (N : ℕ) (hN : H.finite_support.toFinset.card ≤ N)
    (v : Fin N → Module.Dual R Ω) : (List.ofFn fun i => H.contract (v i)).prod = 0 := by
  sorry

theorem trace_eq_zero [Module.Free R E] [Module.Finite R E] (v : Module.Dual R Ω) :
    LinearMap.trace R E (H.contract v) = 0 := by
  sorry

-- SystemOfHodgeBundles.test_single_degree
example (h : ∀ p, p ≠ 0 → H.Ep p = ⊥) : H.θ = 0 := by
  sorry

-- SystemOfHodgeBundles.test_scale_iso
example (t : Rˣ) (h : ∀ p, p ≠ 0 → p ≠ 1 → H.Ep p = ⊥) :
    ∃ φ : E ≃ₗ[R] E, (∀ e ∈ H.Ep 1, φ e = (t : R) • e) ∧ (∀ e ∈ H.Ep 0, φ e = e) ∧
      ∀ e, TensorProduct.map φ.toLinearMap (LinearMap.id : Ω →ₗ[R] Ω) ((t : R) • H.θ e) =
        H.θ (φ e) := by
  sorry

-- SystemOfHodgeBundles.test_trace_zero
example [Module.Free R E] [Module.Finite R E] (v : Module.Dual R Ω) :
    LinearMap.trace R E (H.contract v) = 0 ∧
      (List.ofFn fun _ : Fin H.finite_support.toFinset.card => H.contract v).prod = 0 := by
  sorry

end SystemOfHodgeBundles

-- SystemOfHodgeBundles.test_nonnilpotent_not_hodge
example : ¬ ∃ H : SystemOfHodgeBundles ℚ ℚ (Fin 2 → ℚ),
    H.θ = (TensorProduct.rid ℚ (Fin 2 → ℚ)).symm.toLinearMap ∘ₗ
      Matrix.toLin' !![(1 : ℚ), 0; 0, -1] := by
  sorry

end HodgeBundles

/-! ## Fibrewise vanishing of `H¹` -/

section Fibrewise

variable {k G : Type} [CommRing k] [Group G]

/-- If `A^S = 0`, restriction `H¹(G, A) → H¹(S, A)` is injective (inflation–restriction). -/
theorem restriction_injective (A : Rep k G) (S : Subgroup G) [S.Normal]
    (hinv : ∀ a : A, (∀ s : S, A.ρ s a = a) → a = 0) :
    Function.Injective (groupCohomology.map S.subtype (𝟙 _) 1 (A := A)).hom := by
  sorry

/-- If `A^S = 0` and the `G/S`-invariant classes in `H¹(S, A)` vanish, then `H¹(G, A) = 0`.
A class of the cocycle `c` is `G`-invariant when, for every `g`, the conjugate cocycle
`s ↦ g⁻¹ · c(g s g⁻¹)` differs from `c` by a coboundary. -/
theorem fibrewise_h1_vanishing (A : Rep k G) (S : Subgroup G) [S.Normal]
    (hinv : ∀ a : A, (∀ s : S, A.ρ s a = a) → a = 0)
    (hinvH1 : ∀ c : S → A, c ∈ groupCohomology.cocycles₁ (Rep.res S.subtype A) →
      (∀ g : G, ((fun s : S => A.ρ g⁻¹ (c ⟨g * s * g⁻¹, ‹S.Normal›.conj_mem _ s.2 g⟩)) - c) ∈
        groupCohomology.coboundaries₁ (Rep.res S.subtype A)) →
      c ∈ groupCohomology.coboundaries₁ (Rep.res S.subtype A)) :
    Subsingleton (groupCohomology A 1) := by
  sorry

end Fibrewise

end TauCeti.NonabelianHodge

/-!
## Index of native names

Names below are relative to `TauCeti.NonabelianHodge`. A test name denotes the preceding
named comment on an `example`. Promoted API nodes reuse the existing signature; there is
one declaration, not a duplicate implementation. Partial carriers remain partial.

HodgeStructuresPartII:H.5/trace-free-adjoint:
  TraceFreeAdjoint.rep, TraceFreeAdjoint.rep_apply, TraceFreeAdjoint.endSplitting,
  TraceFreeAdjoint.conjEquiv, TraceFreeAdjoint.twist, TraceFreeAdjoint.projectivization,
  TraceFreeAdjoint.invariants_eq_bot, TraceFreeAdjoint.baseChange_apply,
  TraceFreeAdjoint.baseChange_H1, TraceFreeAdjoint.test_rank_one,
  TraceFreeAdjoint.test_trivial_free_abelian, TraceFreeAdjoint.test_full_adjoint_differs,
  TraceFreeAdjoint.test_char_two_no_splitting, TraceFreeAdjoint.test_irreducible_no_invariants.
HodgeStructuresPartII:H.5/rigid-representation:
  IsRigidRepresentation, IsRigidRepresentation.conj, IsRigidRepresentation.twist,
  IsRigidRepresentation.of_cohomologicallyRigid, IsRigidRepresentation.rankOne,
  IsRigidRepresentation.test_rank_one, IsRigidRepresentation.test_free_group,
  IsRigidRepresentation.test_unfixed_determinant, IsRigidRepresentation.test_finite_group,
  IsRigidRepresentation.test_reducible_excluded.
HodgeStructuresPartII:H.5/projective-rigidity:
  IsAbsolutelyIrreducible, IsAbsolutelyIrreducible.iff_algebraicClosure,
  ProjectiveRepresentation.test_rotation_not_absolutely_irreducible.
HodgeStructuresPartII:H.5/cohomological-rigidity:
  IsCohomologicallyRigid, IsCohomologicallyRigid.of_strong, IsCohomologicallyRigid.projective_iff,
  IsCohomologicallyRigid.conj_aut, IsCohomologicallyRigid.test_rank_one,
  IsCohomologicallyRigid.test_hypergeometric, IsCohomologicallyRigid.test_not_strong,
  IsCohomologicallyRigid.test_projective_groupCohomology.
HodgeStructuresPartII:H.5/strong-cohomological-rigidity:
  IsStronglyCohomologicallyRigid, IsStronglyCohomologicallyRigid.isCohomologicallyRigid,
  IsStronglyCohomologicallyRigid.of_finiteCover, IsStronglyCohomologicallyRigid.conj_aut,
  IsStronglyCohomologicallyRigid.of_groupCohomology, IsStronglyCohomologicallyRigid.test_projective,
  IsStronglyCohomologicallyRigid.test_rank_one, IsStronglyCohomologicallyRigid.test_hypergeometric,
  IsStronglyCohomologicallyRigid.test_free_group.
HodgeStructuresPartII:H.5/strong-implies-cohomological:
  IsStronglyCohomologicallyRigid.isCohomologicallyRigid.
HodgeStructuresPartII:H.5/rigid-locus:
  RigidLocus, RigidLocus.mem_iff_isolated, RigidLocus.locallyQuasiFinite, RigidLocus.field_isClopen,
  RigidLocus.comp_openImmersion, RigidLocus.isFinite_of_isProper, RigidLocus.equivariant,
  RigidLocus.test_fat_point, RigidLocus.test_affine_line, RigidLocus.test_compat_mathlib.
HodgeStructuresPartII:H.5/rigidity-conjugate:
  rigidity_conj_aut.
HodgeStructuresPartII:H.5/rigid-number-field:
  exists_numberField_of_rigid.
HodgeStructuresPartII:H.5/boundary-monodromy-data:
  IsQuasiUnipotentAtInfinity, IsQuasiUnipotentAtInfinity.iff_eigenvalues,
  IsQuasiUnipotentAtInfinity.conj_aut, BoundaryMonodromyData.test_projective_vacuous,
  BoundaryMonodromyData.test_Gm_root_of_unity, BoundaryMonodromyData.test_Gm_not_quasiUnipotent,
  BoundaryMonodromyData.test_unipotent_infinite_order.
HodgeStructuresPartII:H.5/system-of-hodge-bundles:
  SystemOfHodgeBundles, SystemOfHodgeBundles.contract, SystemOfHodgeBundles.scaleIso,
  SystemOfHodgeBundles.shift, SystemOfHodgeBundles.nilpotent, SystemOfHodgeBundles.trace_eq_zero,
  SystemOfHodgeBundles.test_single_degree, SystemOfHodgeBundles.test_trace_zero,
  SystemOfHodgeBundles.test_nonnilpotent_not_hodge, SystemOfHodgeBundles.test_scale_iso.
HodgeStructuresPartII:H.5/unitary-representation:
  IsUnitaryRepresentation, IsUnitaryRepresentation.iff_conj_unitaryGroup,
  IsUnitaryRepresentation.iff_invariant_form, IsUnitaryRepresentation.semisimple,
  IsUnitaryRepresentation.of_finite, IsUnitaryRepresentation.comp,
  IsUnitaryRepresentation.not_aut_invariant, IsUnitaryRepresentation.test_rank_one,
  IsUnitaryRepresentation.test_unipotent, IsUnitaryRepresentation.test_finite_image,
  IsUnitaryRepresentation.test_unitaryGroup_valued, IsUnitaryRepresentation.test_galois_nonexample.
HodgeStructuresPartII:H.5/smooth-arithmetic-model:
  ArithmeticModel, ArithmeticModel.exists, ArithmeticModel.restrict,
  ArithmeticModel.genericFibreIso, ArithmeticModel.test_generic_fibre.
HodgeStructuresPartII:H.5/integral-representation:
  IsIntegralRepresentation, IntegralRealization, IsIntegralRepresentation.iff_algebraicIntegers,
  IsIntegralRepresentation.of_finite, IsIntegralRepresentation.charpoly,
  IsIntegralRepresentation.conj_aut, IsIntegralRepresentation.of_realization,
  IsIntegralRepresentation.test_trivial, IsIntegralRepresentation.test_half_not_integral,
  IsIntegralRepresentation.test_S_integral_not_integral, IsIntegralRepresentation.test_unipotent,
  IsIntegralRepresentation.test_compat_ringOfIntegers.
HodgeStructuresPartII:H.5/strongly-integral:
  IsStronglyIntegral, IsStronglyIntegral.iff_lattice, IsStronglyIntegral.isIntegral,
  IsStronglyIntegral.unitary_finite, IsStronglyIntegral.test_gl_n_Z,
  IsStronglyIntegral.test_salem_not_strong, IsStronglyIntegral.test_implies_integral.
HodgeStructuresPartII:H.5/strong-integral-unitary-finite:
  IsStronglyIntegral.unitary_finite.
HodgeStructuresPartII:H.5/unitary-embeddings-finite:
  unitary_embeddings_finite.
HodgeStructuresPartII:H.5/infinite-image-unitary-example:
  SalemCharacter, SalemCharacter.isUnitary, SalemCharacter.isIntegral,
  SalemCharacter.infinite_range, SalemCharacter.not_strongly_integral,
  SalemCharacter.exists_nonunitary_conjugate, SalemCharacter.test_unitary,
  SalemCharacter.test_infinite_image, SalemCharacter.test_kronecker,
  SalemCharacter.test_gaussian_not_integral.
HodgeStructuresPartII:H.5/fibrewise-h1-vanishing:
  fibrewise_h1_vanishing.
HodgeStructuresPartII:H.5/trace-splitting:
  TraceFreeAdjoint.endSplitting.
HodgeStructuresPartII:H.5/adjoint-projectivization:
  TraceFreeAdjoint.projectivization.
HodgeStructuresPartII:H.5/adjoint-no-invariants:
  TraceFreeAdjoint.invariants_eq_bot.
HodgeStructuresPartII:H.5/adjoint-h1-base-change:
  TraceFreeAdjoint.baseChange_H1.
HodgeStructuresPartII:H.5/rigid-locus-field-clopen:
  RigidLocus.field_isClopen.
HodgeStructuresPartII:H.5/rigid-locus-equivariant:
  RigidLocus.equivariant.
HodgeStructuresPartII:H.5/hodge-system-scaling:
  SystemOfHodgeBundles.scaleIso.
HodgeStructuresPartII:H.5/hodge-system-nilpotent:
  SystemOfHodgeBundles.nilpotent.
HodgeStructuresPartII:H.5/unitary-conjugation:
  IsUnitaryRepresentation.iff_conj_unitaryGroup.
HodgeStructuresPartII:H.5/unitary-invariant-form:
  IsUnitaryRepresentation.iff_invariant_form.
HodgeStructuresPartII:H.5/unitary-semisimple:
  IsUnitaryRepresentation.semisimple.
-/

/-!
## Omission inventory

These are mathematical specifications without Lean signatures. Their geometric carriers
remain missing at the pinned baseline. Native special cases do not supply these omitted
parts. Every entry comes from the corrected packet, including the promoted API facts.

Node HodgeStructuresPartII:H.5/trace-free-adjoint
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  TraceFreeAdjoint.flatBundle: For a flat bundle (E,∇) on a connected complex manifold with
    monodromy ρ at x, the local system of horizontal sections of End⁰(E,∇) has monodromy
    representation rep ρ, under TauCeti.LocalCoefficientSystem.monodromyRepresentation.
  TraceFreeAdjoint.baseChange: For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L,
    compatibly with the matrix entries.

Node HodgeStructuresPartII:H.5/betti-tangent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  tangentSpace_eq_H1: Let K be a field of characteristic zero, Γ a finitely generated group, G a
    split connected reductive group over K with maximal abelian quotient A, θ: Γ → A(K) a
    homomorphism, γ_1,…,γ_N ∈ Γ and K_1,…,K_N ⊂ G locally closed conjugacy classes defined over K.
    Let M = M(Γ, θ, (γ_i, K_i)) be the finite-type stack of G-irreducible representations with
    abelianization θ and ρ(γ_i) ∈ K_i (HodgeStructuresPartII:H.5/prescribed-monodromy-moduli). For a
    G-irreducible ρ₀: Γ → G(K) in M(K), the Zariski tangent space of M at [ρ₀] is the kernel of the
    restriction map H¹(Γ, g^der) → ⊕_{i=1}^{N} H¹(γ_i^ℤ, g^der), with coefficients ad⁰ρ₀. In
    particular, for G = GL_r, θ = δ the determinant and N = 0: the representation scheme R_B(Γ, r,
    δ) has tangent space Z¹(Γ, ad⁰ρ) at ρ, and for absolutely irreducible ρ the stable fixed-
    determinant Betti moduli has Zariski tangent space H¹(Γ, ad⁰ρ) at [ρ]; for K = ℂ and Γ finitely
    presented this is the coarse space M_B^s(Γ, r, δ) of HodgeStructuresPartII:H.1/betti-coarse, and
    for other K (a number field in the integrality applications) the moduli is the K-form
    constructed in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli. Since the automorphism
    group of a stable fixed-determinant object is the finite étale group μ_r in characteristic zero,
    the stack and its coarse space have the same tangent spaces at stable points.

Node HodgeStructuresPartII:H.5/rigid-representation
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  IsRigidRepresentation.iff_orbit_open: IsRigidRepresentation ρ ↔ the conjugation orbit of ρ is open
    in R_B(Γ, r, δ)(ℂ) with the analytic topology.
  IsRigidRepresentation.finite: For fixed Γ, r and δ there are finitely many rigid classes (proved
    in node HodgeStructuresPartII:H.5/rigid-finite and re-exported here).

Node HodgeStructuresPartII:H.5/projective-rigidity
  Missing carrier: projective linear groups PGL_r and projective representations.
  ProjectiveRepresentation.IsAbsolutelyIrreducible: Predicate on ρ̄: Γ → PGL_r(A): no invariant
    proper nonzero subspace after every embedding into an algebraically closed field.
  ProjectiveBettiModuli: The affine finite-type ℤ-scheme M_B(Γ, PGL_r) = Hom(Γ, PGL_r) // PGL_r for
    finitely generated Γ.
  ProjectiveRepresentation.IsRigid: Isolation of the point of an absolutely irreducible ρ̄ in the
    geometric fibre of M_B(Γ, PGL_r).
  ProjectiveRepresentation.isRigid_iff_fixedDet: For irreducible ρ over an algebraically closed
    field of characteristic zero, ρ is rigid in M_B^s(Γ, r, det ρ) iff its projectivization is rigid
    (Esnault–Groechenig Lemma 5.5).
  ProjectiveRepresentation.liftObstruction: The central extension 1 → μ_r → SL_r → PGL_r → 1
    attaches to ρ̄: Γ → PGL_r(Ω) a class o(ρ̄) ∈ H²(Γ, μ_r(Ω)); ρ̄ lifts to SL_r(Ω) iff o(ρ̄) = 0,
    and then the lifts with determinant 1 form a torsor under Hom(Γ, μ_r). Projective
    representations need not lift: the Klein four-group image of diag(1,−1) and [[0,1],[1,0]] in
    PGL_2(ℂ) does not lift to a homomorphism (ℤ/2)² → GL_2(ℂ).
  ProjectiveRepresentation.test_rank_one: For r = 1, PGL_1 is trivial, so M_B(Γ, PGL_1) is one point
    and the unique projective representation is rigid.
  ProjectiveRepresentation.test_twist_same_class: For ρ: Γ → GL_r(ℂ) and any character χ, the
    projectivizations of ρ and χ·ρ define the same point of M_B(Γ, PGL_r).
  ProjectiveRepresentation.test_fixedDet_comparison: For an irreducible ρ: Γ → GL_r(ℂ),
    IsRigidRepresentation ρ (with δ = det ρ) holds iff the projectivization of ρ is rigid in M_B(Γ,
    PGL_r) (Esnault–Groechenig Lemma 5.5).
  ProjectiveRepresentation.test_nontrivial_self_twist: For Q₈, let A=diag(i,−i), B=[[0,1],[−1,0]] in
    SL₂(ℂ), and let χ(A)=1, χ(B)=−1. The irreducible representation generated by A and B is
    conjugate by A to χ·ρ, while χ is nontrivial and χ²=1. All traces agree, so trace equality
    cannot imply χ=1.

Node HodgeStructuresPartII:H.5/cohomological-rigidity
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsCohomologicallyRigid.iff_tangent_eq_bot: For irreducible ρ with det ρ = δ and ρ(T_i) ∈ K_i:
    IsCohomologicallyRigid ρ ↔ the Zariski tangent space of M(π₁, r, δ, (T_i, K_i)) at [ρ] is zero.
  IsCohomologicallyRigid.isRigid: For irreducible ρ: cohomologically rigid implies rigid, and the
    moduli point is reduced (proved in HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated and re-
    exported here).
  IsCohomologicallyRigid.deRham_iff: If X is projective and (E,∇) is the algebraic flat connection
    of ρ, the predicate is H¹_dR(X, End⁰(E,∇)) = 0 (HodgeStructuresPartII:H.5/derham-betti-tangent).
  IsCohomologicallyRigid.intermediateExtension_iff: The predicate is H¹(X̄, j_{!*} ad⁰ρ) = 0
    (HodgeStructuresPartII:H.5/intermediate-extension-h1).
  IsCohomologicallyRigid.test_compact_curve_genus_two: If X is a compact curve of genus g ≥ 2 and ρ
    is irreducible of rank r ≥ 2, then dim H¹(X, End⁰V) = (2g − 2)(r² − 1) > 0, so ρ is not
    cohomologically rigid.

Node HodgeStructuresPartII:H.5/coh-rigid-reduced-isolated
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  isCohomologicallyRigid_iff_reduced_isolated: In the setting of
    HodgeStructuresPartII:H.5/prescribed-monodromy-moduli with G = GL_r and fixed determinant (in
    particular for the fixed-determinant moduli of a smooth projective X), an irreducible ρ is
    cohomologically rigid if and only if its point is an isolated reduced point of the coarse
    moduli, i.e. the local ring of the coarse moduli at [ρ] is the residue field. For a general
    split reductive G and G-irreducible ρ, cohomological rigidity implies that [ρ] is a reduced
    isolated point of the coarse moduli; the converse is asserted only for the stack, since a
    nontrivial finite stabiliser Z_G(ρ)/Z(G) can make the coarse local ring reduced while H¹ ≠ 0. In
    particular cohomological rigidity implies rigidity. Rigidity alone allows a non-reduced isolated
    point.

Node HodgeStructuresPartII:H.5/rigid-connection
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidConnection: Predicate on a stable flat connection with determinant (L,∇_L): its point of
    M_dR^s(X, r, L) is isolated.
  IsRigidHiggs: Predicate on a stable trace-free Higgs bundle with determinant (L,0) on the
    vanishing-Chern-class component: its point of M_Dol^s(X, (L,0), r) is isolated.
  IsRigidConnection.iff_monodromy: (E,∇) is rigid iff its monodromy representation is rigid in
    M_B^s(π₁(X,x), r, δ_L) (Riemann–Hilbert, HodgeStructuresPartII:H.5/rigid-correspondence).
  IsRigidConnection.iff_higgs: (E,∇) is rigid iff the corresponding stable Higgs bundle is rigid
    (non-abelian Hodge, HodgeStructuresPartII:H.5/rigid-correspondence).
  IsRigidConnection.dual: The dual of a rigid connection with determinant L is rigid with
    determinant L⁻¹.
  IsRigidConnection.tensor_torsion: For a torsion line N with its canonical connection, (E,∇) ⊗
    (N,∇_N) is rigid with determinant L ⊗ N^r iff (E,∇) is rigid.
  IsRigidHiggs.scale: If (V,θ) is rigid then so is (V, tθ) for every t ∈ ℂ^×.
  IsCohomologicallyRigidConnection.iff_tangent: Cohomological rigidity of (E,∇) is H¹_dR(X,
    End⁰(E,∇)) = 0, and of (V,θ) the vanishing of the trace-free Dolbeault H¹.
  IsRigidConnection.test_rank_one: For r = 1 the fibre M_dR^s(X, 1, L) is the single reduced point
    (L,∇_L), which is rigid; likewise M_Dol^s(X, (L,0), 1) = {(L,0)}.
  IsRigidConnection.test_genus_two_curve: If X is a compact curve of genus g ≥ 2 and r ≥ 2, no
    stable flat connection of rank r with determinant (O_X, d) is rigid, since M_dR^s(X, r, O) is
    smooth of dimension 2(g − 1)(r² − 1).
  IsRigidConnection.test_flat_determinant_needed: On an elliptic curve X, the rank-one connections
    on the trivial bundle are d + a·dz with a ∈ ℂ; fixing only det E ≅ O leaves this one-parameter
    family, while fixing (O, d) leaves a point.
  IsRigidHiggs.test_trace_condition: For a nonzero holomorphic 1-form ω, the Higgs bundle (L, ω) has
    tr θ = ω ≠ 0 and is not a point of M_Dol(X, (L,0), 1).
  IsRigidHiggs.test_projective_space: For X = ℙⁿ (simply connected, H⁰(Sym^i Ω¹) = 0), M_dR^s(ℙⁿ, r,
    O) and M_Dol^s(ℙⁿ, (O,0), r) are empty for r ≥ 2 and a reduced point for r = 1.

Node HodgeStructuresPartII:H.5/derham-betti-tangent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  deRham_betti_tangent_iso: Let X be smooth connected projective over ℂ, (E,∇) a stable flat
    connection with determinant (L,∇_L), monodromy ρ at x, and (V,θ) the corresponding stable Higgs
    bundle under HodgeStructuresPartII:H.1/harmonic-correspondence. Then there are natural
    isomorphisms H¹_dR(X, End⁰(E,∇)) ≅ H¹(X^an, End⁰(E^∇)) ≅ H¹(π₁(X^an, x), ad⁰ρ) and an
    isomorphism of the latter with the first hypercohomology of the trace-free Higgs complex
    (End⁰(V), [θ,−]). These are the Zariski tangent spaces of M_dR^s(X,r,L), M_B^s(π₁, r, δ) and
    M_Dol^s(X,(L,0),r) at the corresponding points. More precisely (Simpson, Moduli II, Proposition
    10.5 and Theorem 10.6), the formal completions of the three moduli at points corresponding to
    the same harmonic bundle are canonically isomorphic, each being the completion at 0 of a
    quadratic cone in this H¹ (modulo the scalar stabilizer, which acts trivially at stable points);
    the analytic Riemann–Hilbert isomorphism of HodgeStructuresPartII:H.1/riemann-hilbert-coarse
    induces an isomorphism of the de Rham and Betti tangent spaces. In particular the three
    cohomological rigidity conditions coincide.

Node HodgeStructuresPartII:H.5/rigid-correspondence
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  rigid_correspondence: Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The
    Riemann–Hilbert analytic isomorphism M_dR^s(X,r,L)^an ≅ M_B^s(π₁(X,x), r, δ_L)^an
    (HodgeStructuresPartII:H.1/riemann-hilbert-coarse) and the non-abelian Hodge homeomorphism
    M_dR^s(X,r,L) ≅ M_Dol^s(X,(L,0),r) (HodgeStructuresPartII:H.1/nonabelian-hodge-topology)
    restrict to bijections M^rig_B(ℂ) ≅ M^rig_dR(ℂ) ≅ M^rig_Dol(ℂ) between the finite sets of rigid
    points (HodgeStructuresPartII:H.5/rigid-locus). The Riemann–Hilbert bijection preserves the
    local rings; by Simpson's isosingularity theorem the formal completions of M_dR^s and M_Dol^s at
    corresponding points are isomorphic, so the non-abelian Hodge bijection of rigid points also
    preserves the (Artinian) local rings, hence lengths and cohomological rigidity
    (HodgeStructuresPartII:H.5/derham-betti-tangent). Consequently the numbers of rigid connections,
    rigid representations and rigid stable Higgs bundles of rank r and determinant L are equal.

Node HodgeStructuresPartII:H.5/rigid-locus
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  RigidLocus.fibre: For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s
    → Spec κ(s), i.e. the isolated points of M_s.
  RigidLocus.test_line_and_point: For M = Spec ℂ[x,y]/(y(y − 1), xy) → Spec ℂ (the line y = 0 and
    the point (0,1)), the rigid locus is the point (0,1).
  RigidLocus.test_relative_open_not_closed: For f: Spec ℤ[x]/(px) → Spec ℤ, the rigid locus is the
    open subscheme Spec ℤ[1/p] (x = 0 away from p); it does not meet the fibre 𝔸¹_{𝔽_p}.

Node HodgeStructuresPartII:H.5/rigid-finite
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  rigidLocus_finite: Let X be smooth connected projective over ℂ, L torsion and r ≥ 1. The rigid
    loci M^rig_B(π₁(X), r, δ_L), M^rig_dR(X, r, L) and M^rig_Dol(X, (L,0), r) are finite ℂ-schemes;
    there are finitely many isomorphism classes of rigid flat connections, rigid representations and
    rigid stable Higgs bundles of rank ≤ r with determinant L. More generally, for a finitely
    generated Γ and prescribed data as in HodgeStructuresPartII:H.5/prescribed-monodromy-moduli, the
    moduli has finitely many isolated points, and for r, d, h fixed the set S(r, d, h) of
    irreducible cohomologically rigid local systems on a smooth quasi-projective X of rank r,
    determinant of order dividing d and quasi-unipotent local monodromies whose eigenvalues have
    order dividing h is finite.

Node HodgeStructuresPartII:H.5/boundary-monodromy-data
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  GoodCompactification: Data (X̄, j, D) with X̄ smooth projective, j an open immersion with image X,
    and D = X̄ ∖ X a strict normal crossings divisor with components D_i.
  GoodCompactification.localMonodromy: For each component D_i, the conjugacy class in π₁(X, x) of
    the loop T_i around D_i.
  GoodCompactification.localMonodromy_conj: Different choices of y_i, Δ_i, x_i and path give
    conjugate loops; the orientation convention removes the inversion ambiguity (Esnault–Groechenig
    2018 leave the sign open).
  IsQuasiUnipotentAtInfinity.of_geometricOrigin: Local systems of geometric origin have quasi-
    unipotent local monodromy (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).
  GoodCompactification.exists: Every smooth quasi-projective complex variety has a good
    compactification (AlgebraicModuliForArithmeticGeometry:R09.7d).

Node HodgeStructuresPartII:H.5/prescribed-monodromy-moduli
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  PrescribedMonodromyModuli: The algebraic stack of finite type over K attached to (Γ, r, χ_L, (γ_i,
    K_i)).
  PrescribedMonodromyModuli.coarse: Its μ_r-rigidification, an algebraic space of finite type over K
    that is a coarse moduli space.
  PrescribedMonodromyModuli.points: For an algebraically closed Ω ⊃ K, the Ω-points of the coarse
    space are the isomorphism classes of irreducible ρ: Γ → GL_r(Ω) with det ρ = χ_L and ρ(γ_i) ∈
    K_i(Ω).
  PrescribedMonodromyModuli.automorphisms: Every object has automorphism group μ_r.
  PrescribedMonodromyModuli.irreducible_open: The geometrically irreducible locus is open in the
    stack of all representations with determinant L.
  PrescribedMonodromyModuli.finite_isolated: The coarse space has finitely many isolated points (the
    rigid local systems with this data).
  PrescribedMonodromyModuli.baseChange: Formation commutes with field extension; σ ∈ Aut(ℂ/K) acts
    on its ℂ-points by ρ ↦ σ∘ρ.
  PrescribedMonodromyModuli.reductive: For split connected reductive G, the stack of G-irreducible
    representations with abelianization θ and ρ(γ_i) ∈ K_i is algebraic of finite type
    (Klevdal–Patrikis Proposition 4.4).
  PrescribedMonodromyModuli.test_no_boundary: With N = 0 and K = ℂ, the coarse space of M(Γ, r, L)
    is M_B^s(Γ, r, δ_L) of HodgeStructuresPartII:H.1/betti-coarse.
  PrescribedMonodromyModuli.test_rank_one: For r = 1, M(Γ, 1, L, ∅) is a single point with trivial
    automorphism group: the only object is the character χ_L itself.
  PrescribedMonodromyModuli.test_free_group_dimension: For Γ = F_2 free, r = 2, L trivial and N = 0,
    the coarse space is irreducible of dimension 3 and has no isolated point.
  PrescribedMonodromyModuli.test_locally_closed: Prescribing K_1 = the conjugacy class of
    [[1,1],[0,1]] at γ_1 gives a locally closed but not closed condition: its closure in GL_2
    contains the identity, which is not in K_1.

Node HodgeStructuresPartII:H.5/prescribed-monodromy-tangent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  PrescribedMonodromyModuli.tangent_eq: In the setting of HodgeStructuresPartII:H.5/prescribed-
    monodromy-moduli with Γ = π₁(X, x), X smooth connected quasi-projective with good
    compactification and γ_i = T_i, let V be a geometrically irreducible K-local system in M(K) with
    monodromy ρ. The Zariski tangent space of M at [V] is H¹(U, a_* End⁰(V)), where a: X → U = X̄ ∖
    D_sing; equivalently it is the kernel of the restriction map H¹(π₁(X, x), ad⁰ρ) → ⊕_{i=1}^{N}
    H¹(⟨T_i⟩, ad⁰ρ) (HodgeStructuresPartII:H.5/betti-tangent). In particular, if H¹(U, a_* End⁰(V))
    = 0, then [V] is a reduced isolated point. The same holds with g^der in place of End⁰ for split
    reductive G (Klevdal–Patrikis Proposition 4.7).

Node HodgeStructuresPartII:H.5/intermediate-extension-h1
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  h1_intermediateExtension_eq: Let X ⊂ X̄ be a good compactification with U = X̄ ∖ D_sing, X →a U →b
    X̄ and j = b∘a, and let F be a local system of finite-dimensional vector spaces on X over a
    field of characteristic zero. Then H¹(X̄, j_{!*}F) ≅ H¹(U, a_* F), where j_{!*} is the
    intermediate extension of F (placed in the appropriate perverse degree and shifted back): there
    is an exact triangle j_{!*}F → Rb_* a_* F → C with C supported on D_sing and concentrated in
    degrees ≥ 2. If the local monodromies of F are finite, j_{!*}F = j_*F; if X is a curve, j_{!*} =
    j_*. The same identity holds for lisse ℚ̄_ℓ-sheaves on X_s ⊂ X̄_s for a good compactification
    over a finite field with ℓ invertible (for instance the fibre of a model as in
    HodgeStructuresPartII:H.5/smooth-arithmetic-model; Esnault–Groechenig 2018 Lemma 3.4). Thus the
    j_{!*}-definitions of cohomological rigidity of Esnault–Groechenig, Klevdal–Patrikis and
    Landesman–Litt agree with the a_*-definition of HodgeStructuresPartII:H.5/cohomological-
    rigidity.

Node HodgeStructuresPartII:H.5/rigid-higgs-gm-fixed
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidHiggs.gm_fixed: Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs
    bundle with determinant (L,0) (HodgeStructuresPartII:H.5/rigid-connection). Then (V, tθ) ≅ (V,
    θ) for every t ∈ ℂ^×; equivalently [(V,θ)] is a fixed point of the 𝔾_m-action on M_Dol^s(X,
    (L,0), r).

Node HodgeStructuresPartII:H.5/rigid-higgs-nilpotent
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidHiggs.nilpotent: Let X be smooth connected projective over ℂ and (V,θ) a rigid stable Higgs
    bundle of rank r with determinant (L,0). Then the Hitchin image h(V,θ) ∈ A_r = ⊕_{i=2}^{r} H⁰(X,
    Sym^i Ω¹_X) is zero, the characteristic polynomial of θ is T^r, and θ is nilpotent: every
    composite θ_{v_1} ∘ ⋯ ∘ θ_{v_r} of r components of θ vanishes, i.e. the joint nilpotence bound r
    holds (HodgeStructuresPartII:H.0/joint-nilpotence).

Node HodgeStructuresPartII:H.5/system-of-hodge-bundles
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  SystemOfHodgeBundles.ofGriffiths: The associated graded Higgs bundle of a Griffiths-transverse
    filtration (HodgeStructuresPartII:H.0/graded-higgs) with E^p = Gr^p_F.
  SystemOfHodgeBundles.determinant: det E = ⊗_p det E^p, with determinant Higgs field 0.
  SystemOfHodgeBundles.hom_graded: Morphisms of systems of Hodge bundles are degree-preserving
    morphisms of Higgs bundles; for stable underlying Higgs bundles every Higgs isomorphism between
    systems is graded up to shift (HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles).
  SystemOfHodgeBundles.test_uniformizing: On a compact curve C of genus ≥ 2 with a theta
    characteristic K^{1/2}, E^1 = K^{1/2}, E^0 = K^{−1/2} and θ: E^1 → E^0 ⊗ K the identity of
    K^{1/2} form a system of Hodge bundles with θ ≠ 0 and θ² = 0.

Node HodgeStructuresPartII:H.5/gm-fixed-hodge-bundles
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  SystemOfHodgeBundles.of_scale_iso: Let X be a compact connected complex manifold and (E,θ) a Higgs
    bundle with (E,θ) ≅ (E,tθ) for some t ∈ ℂ^× that is not a root of unity. Then E has a structure
    of system of Hodge bundles; if (E,θ) is stable, this structure is unique up to shift of indices.

Node HodgeStructuresPartII:H.5/cvhs-hodge-bundles
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  cvhs_equiv_hodgeBundles: Let X be a compact Kähler manifold (in this layer, smooth connected
    projective over ℂ). (a) A polarized complex variation of Hodge structure (V = ⊕_{p+q=w} V^{p,q},
    flat D satisfying Griffiths transversality, flat Hermitian form ψ making the decomposition
    orthogonal, definite of sign (−1)^p on V^{p,q}) supplied by HodgeStructuresPartII:H.2
    determines, with the sign-alternated polarization K, a harmonic bundle
    (HodgeStructuresPartII:H.1/harmonic-bundle) with D = ∂ + ∂̄ + θ + θ̄, whose Higgs bundle is the
    system of Hodge bundles (⊕_p Gr^p_F, gr_F D) with Gr^p_F = V^{p,w−p}
    (HodgeStructuresPartII:H.0/graded-higgs). (b) Conversely, under the projective harmonic
    correspondence (HodgeStructuresPartII:H.1/harmonic-correspondence), the semisimple flat bundle
    corresponding to a polystable system of Hodge bundles with vanishing rational Chern classes
    carries a polarized complex variation of Hodge structure whose associated graded is the given
    system; the structures of polarized complex variation on a semisimple local system correspond
    bijectively to the structures of system of Hodge bundles on its Higgs bundle. (c) Consequently
    the semisimple representations of π₁(X) underlying complex variations of Hodge structure are
    exactly the semisimple ones fixed by the 𝔾_m-action (Simpson Corollary 4.2).

Node HodgeStructuresPartII:H.5/rigid-underlies-cvhs
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsRigidConnection.underlies_cvhs: Let X be smooth connected projective over ℂ and (E,∇) a rigid
    stable flat connection with torsion determinant (L,∇_L) (HodgeStructuresPartII:H.5/rigid-
    connection). Then (E,∇) underlies a polarized complex variation of Hodge structure: there is a
    Griffiths-transverse filtration F^• of E (∇F^i ⊂ F^{i−1} ⊗ Ω¹) with polarization, unique up to
    shift of indices, and the associated graded Higgs bundle (Gr_F E, gr_F ∇) is the rigid stable
    Higgs bundle corresponding to (E,∇) under HodgeStructuresPartII:H.5/rigid-correspondence. The
    complex variation need not have a real or integral structure. More generally (Simpson Lemma 4.5)
    every properly rigid reductive representation of π₁(X) into a reductive group comes from a
    complex variation of Hodge structure.

Node HodgeStructuresPartII:H.5/deformation-to-cvhs
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  deformation_to_cvhs: (a) Let X be smooth connected projective over ℂ and G a reductive complex
    group. Every representation ρ: π₁(X) → G(ℂ) can be deformed, inside Hom(π₁(X), G), to a
    representation underlying a complex variation of Hodge structure; for G = GL_r and ρ with finite
    determinant the deformation can be taken with constant determinant. (b) (Mochizuki, as stated by
    Landesman–Litt Theorem 4.3.1) Let X̄ be smooth projective, D ⊂ X̄ a strict normal crossings
    divisor and X = X̄ ∖ D. Every ρ: π₁(X) → GL_r(ℂ) with finite determinant admits a deformation
    with constant determinant to a representation underlying a polarizable complex variation of
    Hodge structure; the G-version for a reductive Zariski closure (Mochizuki Lemma 10.13) deforms
    within G.

Node HodgeStructuresPartII:H.5/coh-rigid-semisimple-cvhs
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  IsStronglyCohomologicallyRigid.underlies_pvhs: Let X̄ be smooth projective, D ⊂ X̄ a strict normal
    crossings divisor and X = X̄ ∖ D. Let ρ: π₁(X) → GL_r(ℂ) be semisimple with finite determinant
    and H¹(X, ad ρ) = 0 (strongly cohomologically rigid, HodgeStructuresPartII:H.5/strong-
    cohomological-rigidity). Then ρ underlies a polarizable complex variation of Hodge structure on
    X.

Node HodgeStructuresPartII:H.5/unitary-representation
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsUnitaryRepresentation.dual_iff_conj: For unitary ρ the dual representation is isomorphic to the
    complex conjugate ρ̄.

Node HodgeStructuresPartII:H.5/zero-higgs-unitary
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  gradedHiggs_eq_zero_iff_unitary: Let X be a compact connected Kähler manifold (smooth projective
    in this layer) and (V, F, ∇, ψ) a polarized complex variation of Hodge structure with associated
    graded Higgs field θ = gr_F ∇: Gr_F V → Gr_F V ⊗ Ω¹ (its Kodaira–Spencer class). Then θ = 0 if
    and only if the monodromy of ∇ is unitary. When the underlying local system is irreducible, θ =
    0 forces the Hodge filtration to have a single nonzero graded piece. No integral or real
    structure is assumed.

Node HodgeStructuresPartII:H.5/hodge-rigid-locus
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  HodgeRigidLocus: RigidLocus of q: M_Hod^s(X, r, L) → 𝔸¹.
  HodgeRigidLocus.zeroFibre: Its fibre over 0 is M^rig_Dol(X,(L,0),r).
  HodgeRigidLocus.oneFibre: Its fibre over 1 is M^rig_dR(X,r,L).
  HodgeRigidLocus.gmStable: The 𝔾_m-action of HodgeStructuresPartII:H.1/hodge-scaling restricts to
    M^rig_Hod, compatibly with weight one on 𝔸¹.
  HodgeRigidLocus.nonzeroTrivialization: M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦
    ((E, λ⁻¹D), λ).
  HodgeRigidLocus.mem_iff: A point over λ lies in M^rig_Hod iff it is isolated in q⁻¹(λ).
  HodgeRigidLocus.test_rank_one: For r = 1, M^rig_Hod(X, L, 1) → 𝔸¹ is an isomorphism.
  HodgeRigidLocus.test_genus_two_empty: For X a compact curve of genus g ≥ 2 and r = 2, M^rig_Hod(X,
    O, 2) is empty, although M_Hod^s(X, 2, O) is nonempty.
  HodgeRigidLocus.test_fibres: The fibre of M^rig_Hod over 0 is M^rig_Dol(X,(L,0),r) and over 1 is
    M^rig_dR(X,r,L), as subschemes of the fibres of M_Hod^s.
  HodgeRigidLocus.test_gm_stable: For t ∈ ℂ^× and a point m of M^rig_Hod over λ, t·m is a point of
    M^rig_Hod over tλ.

Node HodgeStructuresPartII:H.5/rigid-hodge-splitting
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  HodgeRigidLocus.splitting: Let X be smooth connected projective over ℂ, L torsion, r ≥ 1. Then:
    (i) for every rigid stable flat connection (E,∇) with determinant (L,∇_L), with Hodge filtration
    F of HodgeStructuresPartII:H.5/rigid-underlies-cvhs, the Rees λ-connection ξ(E, F) = Σ_p λ^{−p}
    F^p ⊗ ℂ[λ] (HodgeStructuresPartII:H.0/rees-parameter) defines a 𝔾_m-equivariant section σ_E: 𝔸¹
    → M^rig_Hod(X, L, r) with σ_E(1) = [(E,∇)] and σ_E(0) = [(Gr_F E, gr_F ∇)]; (ii) M^rig_Hod(X, L,
    r) → 𝔸¹ is finite and flat, and its reduced subscheme is the disjoint union of the images of the
    sections σ_E, so (M^rig_Hod)_red ≅ (M^rig_Dol)_red × 𝔸¹ 𝔾_m-equivariantly; (iii) each connected
    component is finite flat over 𝔸¹ with all fibres isomorphic to the local Artinian ring of
    M_Dol^s at the corresponding rigid Higgs point; (iv) (Esnault–Groechenig Lemma 4.9) M^rig_Hod(X,
    L, r) ≅ M^rig_Dol(X, (L,0), r) × 𝔸¹ 𝔾_m-equivariantly over 𝔸¹, the action on the right being
    scaling of θ times weight one on 𝔸¹, including non-reduced structure (proved here from (iii) by
    the classification of torsors on [𝔸¹/𝔾_m]); (v) every 𝔾_m-equivariant section of M^rig_Hod over
    𝔸¹ is a Rees section of a complex variation of Hodge structure as in (i) (Simpson's Lemma 7.2).

Node HodgeStructuresPartII:H.5/smooth-arithmetic-model
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Scope: Native arithmetic model has smooth proper geometric data only. Projectivity, the torsion determinant and its flat connection remain in the omission inventory; this row is partial.
  ArithmeticModel.dominate: Any two arithmetic models of (X, x, L, ι) become isomorphic after base
    change to a common finitely generated subring R̃₃ ⊂ ℂ containing both coefficient rings,
    followed by inverting finitely many nonzero elements.
  ArithmeticModel.spread_hom: Morphisms, sections and isomorphisms of finitely presented objects
    over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i),
    Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).
  ArithmeticModel.closedPoint_finite_residue: Closed points s ∈ S have finite residue fields κ(s) of
    characteristic p, and smoothness of S over ℤ lifts s to W₂(κ(s)).
  ArithmeticModel.flatDeterminant: The relative flat connection ∇_{L_S} on L_S determined by ι_S,
    restricting to ∇_L on X.
  ArithmeticModel.test_projective_space: For X = ℙⁿ_ℂ, x = [1:0:⋯:0], L = O and ι = id, (S = Spec ℤ,
    X_S = ℙⁿ_ℤ) is an arithmetic model.
  ArithmeticModel.test_legendre: For the elliptic curve y² = x(x − 1)(x − λ) with λ ∈ ℂ
    transcendental, R̃ = ℤ[λ, 1/(2λ(1 − λ))] gives an arithmetic model with X_S the Legendre family.
  ArithmeticModel.test_must_invert: For the curve y² = x³ − x over ℂ, the integral model Proj
    ℤ[x,y,z]/(y²z − x³ + xz²) is not smooth over Spec ℤ at the prime 2, so 2 must be inverted: the
    model over Spec ℤ itself is not an arithmetic model.
  ArithmeticModel.test_shrink: If (S, X_S, …) is an arithmetic model and 0 ≠ f ∈ R̃, then the
    restriction to Spec R̃[1/f] is an arithmetic model.

Node HodgeStructuresPartII:H.5/relative-moduli
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  RelativeModuli.deRham: The quasi-projective S-scheme M_dR(X_S/S, L_S, r) of finite type.
  RelativeModuli.dolbeault: The quasi-projective S-scheme M_Dol(X_S/S, L_S, r) of finite type.
  RelativeModuli.hodge: The quasi-projective S × 𝔸¹-scheme M_Hod(X_S/S, L_S, r): over S × 𝔾_m it is
    M_dR × 𝔾_m by rescaling, and the λ = 0 fibre maps to M_Dol(X_S/S, L_S, r) by a morphism that is
    bijective on geometric points (an isomorphism over ℚ, HodgeStructuresPartII:H.1/hodge-coarse).
  RelativeModuli.corepresents: Uniform corepresentation of the family functor; universal
    corepresentation on the stable open.
  RelativeModuli.baseChange: For locally Noetherian T → S the morphism φ_T: M(X_S/S) ×_S T →
    M(X_T/T), bijective on points for geometric T.
  RelativeModuli.stableGenericIso: The stable open base-changes to the stable moduli of
    HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse,
    HodgeStructuresPartII:H.1/hodge-coarse over ℂ.
  RelativeModuli.rigidLocus: M^rig(X_S/S, L_S, r) := RigidLocus of the structure morphism of the
    stable open M^s(X_S/S, L_S, r).
  RelativeModuli.leRank: M(X_S/S, L_S, ≤ r) := ⊔_{r′ ≤ r} M(X_S/S, L_S, r′).
  RelativeModuli.test_rank_one: For r = 1, M_dR(X_S/S, L_S, 1) → S and M_Dol(X_S/S, L_S, 1) → S are
    isomorphisms (the single object (L_S, ∇_{L_S}), respectively (L_S, 0)).
  RelativeModuli.test_geometric_points: For a geometric point s̄ of S, φ_{s̄} is a bijection between
    the s̄-points of M_dR(X_S/S, L_S, r) and the S-equivalence classes of semistable flat
    connections of rank r with determinant (L_s̄, ∇) on X_s̄.
  RelativeModuli.test_generic_stable: The base change of the stable open M^s_dR(X_S/S, L_S, r) along
    Spec ℂ → S is isomorphic to M^s_dR(X, r, L) of HodgeStructuresPartII:H.1/derham-coarse.
  RelativeModuli.test_unfixed_determinant: For an elliptic curve E_S → S and r = 1, fixing only the
    underlying line bundle O of the determinant gives the positive-dimensional family of relative
    connections d + a·ω (ω a relative invariant differential, a ∈ O_S), while the fixed-determinant
    moduli M_dR(E_S/S, O, 1) is S itself.

Node HodgeStructuresPartII:H.5/simultaneous-spreading
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_spreading: Let X be smooth connected projective over ℂ, L torsion and r ≥
    1. There is an affine arithmetic model (S, X_S, L_S) (HodgeStructuresPartII:H.5/smooth-
    arithmetic-model) such that (a) every rigid flat connection (E,∇) on X with determinant L and
    rank ≤ r spreads to a relative flat connection (E_S, ∇_S) on X_S/S with determinant (L_S,
    ∇_{L_S}) which is P-stable over every geometric point of S; (b) every rigid stable Higgs bundle
    (V,θ) on X with determinant (L,0) and rank ≤ r spreads to a relative Higgs bundle (V_S, θ_S) on
    X_S/S, P-stable over every geometric point.

Node HodgeStructuresPartII:H.5/nilpotent-rigid-models
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_nilpotent_rigid: In HodgeStructuresPartII:H.5/simultaneous-spreading, after
    shrinking S: (c) every spread Higgs field is nilpotent, θ_S^{r} = 0 (all products of r
    components of θ_S vanish); (d) the sections [E_S, ∇_S]: S → M_dR(X_S/S, L_S, ≤ r) and [V_S,
    θ_S]: S → M_Dol(X_S/S, L_S, ≤ r) factor through the relative rigid loci M^rig_dR(X_S/S, L_S, ≤
    r) and M^rig_Dol(X_S/S, L_S, ≤ r).

Node HodgeStructuresPartII:H.5/rigid-locus-exhaustion
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_exhaustion: In HodgeStructuresPartII:H.5/nilpotent-rigid-models, after
    further shrinking S: the finitely many sections s_1, …, s_N: S → M^rig_dR(X_S/S, L_S, ≤ r) of
    the spread rigid connections are pairwise disjoint and |M^rig_dR(X_S/S, L_S, ≤ r)| = ∪_i
    s_i(|S|); the same holds for M^rig_Dol(X_S/S, L_S, ≤ r). Thus every geometric fibre
    M^rig_dR(X_s̄/s̄, L_s̄, ≤ r) has exactly N points, one on each section, and over the generic
    point these are the N rigid connections over ℂ. Local multiplicities (lengths of local rings)
    are part of the rigid locus and are retained.

Node HodgeStructuresPartII:H.5/nice-hodge-models
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  ArithmeticModel.exists_nice_hodge: Let X be smooth connected projective over ℂ, L torsion of exact
    order d and r ≥ 1. There are an affine arithmetic model (S, X_S, L_S) and finitely many
    λ-connections (N_S^i, D_S^i), i = 1, …, M, on X_S × 𝔸¹_S relative to λ = pr₂, geometrically
    P-stable, with determinants (L_S^{a(i)}, λ∇) for some 0 ≤ a(i) < d, such that (a) all
    conclusions of HodgeStructuresPartII:H.5/simultaneous-spreading,
    HodgeStructuresPartII:H.5/nilpotent-rigid-models and HodgeStructuresPartII:H.5/rigid-locus-
    exhaustion hold for every determinant L^a, 0 ≤ a ≤ d − 1; (b) each (N_S^i, D_S^i) can moreover
    be chosen 𝔾_m-equivariant, the spread Rees λ-connection of a rigid variation, with fibre at λ =
    1 a spread rigid connection and at λ = 0 its associated graded rigid Higgs bundle
    (Esnault–Groechenig state (b) without the equivariance; this plan chooses the Rees families of
    HodgeStructuresPartII:H.5/rigid-hodge-splitting (i)); (c) the sections give a bijection
    ⊔_{i=1}^{M} [(N_S^i, D_S^i)](|S × 𝔸¹|) = ⊔_{a=0}^{d−1} |M^rig_Hod(X_S/S, L_S^a, ≤ r)|, the rigid
    Hodge loci being taken in the stable opens (HodgeStructuresPartII:H.5/relative-moduli). In
    particular the number n_L of rank-r rigid connections with determinant among L^0, …, L^{d−1}
    equals the number of rank-r rigid stable Higgs bundles with those determinants and indexes the
    sections at λ = 0 and λ = 1. (Indices as corrected in source issue E-H5-1.)

Node HodgeStructuresPartII:H.5/integral-representation
  Missing carrier: projective linear groups PGL_r and projective representations.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  Missing carrier: general split reductive group schemes over ℤ and their adjoint representations.
  IsIntegralRepresentation.iff_projectiveLattice: For G = GL_r, integral ↔ the local system comes by
    extension of scalars from a local system of finitely generated projective 𝒪_K-modules.
  IsIntegralRepresentation.of_projectivization: For G = GL_r and det ρ of finite order, ρ is
    integral iff its projectivization Γ → PGL_r(ℂ) is integral (Landesman–Litt Lemma 8.3.4: the
    obstruction is a torsor under the finite kernel of G → PGL_r, trivial over a finite extension).
  IsIntegralRepresentation.restrictScalars: If ρ is GL_r(𝒪_K)-valued then ⊕_{τ: K → ℂ} τ∘ρ is
    conjugate into GL_{r[K:ℚ]}(ℤ), hence strongly integral.

Node HodgeStructuresPartII:H.5/strongly-integral
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  IsStronglyIntegral.restrictScalars: For ρ with values in GL_r(𝒪_K), the representation ⊕_{τ} τ∘ρ
    is strongly integral.
  IsStronglyIntegral.sum: Direct sums, tensor products and duals of strongly integral
    representations are strongly integral.
  IsStronglyIntegral.test_restriction_of_scalars: For K = ℚ(i) and ρ: ℤ → GL_1(ℤ[i]), 1 ↦ i, the sum
    of the two embeddings is conjugate to 1 ↦ [[0,−1],[1,0]] ∈ GL_2(ℤ).

Node HodgeStructuresPartII:H.5/integrality-local-criterion
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  isIntegral_of_local: Let Γ be finitely generated, G a connected reductive group over ℤ (GL_r in
    Esnault–Groechenig), K a number field, Σ a finite set of finite places of K and ρ: Γ →
    G(𝒪_{K,Σ}). If for every λ ∈ Σ the completion ρ_λ: Γ → G(K_λ) is G(K̄_λ)-conjugate to a
    representation into G(𝒪_{K̄_λ}) (for G reductive: G(K_λ)-conjugate into G(𝒪_{K_λ}) after a
    finite extension), then there is a finite extension L/K such that ρ is G(L)-conjugate to a
    representation Γ → G(𝒪_L); in particular ρ is integral.

Node HodgeStructuresPartII:H.5/integrality-EG18
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  isIntegral_of_cohomologicallyRigid: Let X be a smooth connected quasi-projective complex variety
    with a good compactification. Every irreducible complex local system V on X that is
    cohomologically rigid (HodgeStructuresPartII:H.5/cohomological-rigidity), has finite-order
    determinant, and has quasi-unipotent local monodromy along every boundary component, is integral
    (HodgeStructuresPartII:H.5/integral-representation): its monodromy is conjugate into GL_r(𝒪_L)
    for a number field L. Integral is not strongly integral; the conclusion is over the full ring
    𝒪_L.

Node HodgeStructuresPartII:H.5/integrality-KP
  Missing carrier: good compactifications of quasi-projective varieties with boundary divisors and local monodromy loops.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  Missing carrier: general split reductive group schemes over ℤ and their adjoint representations.
  isIntegral_of_G_cohomologicallyRigid: Let X be a connected smooth quasi-projective complex variety
    with base point x, G a split connected reductive group over ℤ with maximal abelian quotient A,
    and ρ: π₁(X, x) → G(ℂ) G-irreducible (image in no proper parabolic subgroup) and
    G-cohomologically rigid (H¹(X̄, j_{!*} g^der) = 0 for a good compactification), with quasi-
    unipotent local monodromy and with π₁(X, x) → G(ℂ) → A(ℂ) of finite image. Then the identity
    component of the Zariski closure of ρ(π₁(X,x)) is semisimple, and ρ is G(ℂ)-conjugate to a
    homomorphism π₁(X, x) → G(𝒪_L) for a number field L. For G = PGL_r (A trivial) this applies to
    the projectivizations used by Landesman–Litt; with HodgeStructuresPartII:H.5/integral-
    representation API of_projectivization it gives integrality of GL_r-local systems with finite
    determinant.

Node HodgeStructuresPartII:H.5/geometric-origin
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsOfGeometricOrigin: ∃ U dense open, f: Y → U smooth projective, i, with V|_U a subquotient of R^i
    f_* ℂ.
  IsOfGeometricOrigin.iff_summand: Equivalent with 'direct summand' in place of 'subquotient'
    (semisimplicity).
  IsOfGeometricOrigin.restrict: Restriction to a dense open preserves geometric origin. For a
    morphism h: X′ → X, pullback preserves the given geometric-origin witness when h⁻¹(U) is dense
    in X′ (in particular for a dominant morphism between irreducible varieties): pull back its
    smooth projective family to h⁻¹(U).
  IsOfGeometricOrigin.sum_tensor_dual: Direct sums, tensor products, duals and subquotients of local
    systems of geometric origin are of geometric origin (fibre products and Künneth).
  IsOfGeometricOrigin.quasiUnipotent: Local systems of geometric origin have quasi-unipotent local
    monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).
  IsOfGeometricOrigin.integralPVHS: Geometric origin implies underlying an integral PVHS
    (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).
  IsOfGeometricOrigin.test_constant: The constant local system ℂ_X is of geometric origin (U = X, f
    = id_X, i = 0).
  IsOfGeometricOrigin.test_finite_monodromy: A local system V of rank r with finite monodromy is of
    geometric origin: if f₀: Y → X is the finite étale Galois cover trivializing it, V is a summand
    of f_* ℂ for f: ⊔^r Y → X the disjoint union of r copies (i = 0), since the regular
    representation contains each irreducible representation of the Galois group.
  IsOfGeometricOrigin.test_salem_not: The Salem-type character χ_α on a genus-one curve is not of
    geometric origin: geometric origin implies that every Galois conjugate underlies a polarizable
    variation (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs), and a rank-one polarizable
    variation is unitary, while some conjugate of χ_α is not unitary.
  IsOfGeometricOrigin.test_legendre: On X = ℙ¹ ∖ {0, 1, ∞}, R¹f_*ℂ for the Legendre family y² = x(x
    − 1)(x − λ) is of geometric origin (rank 2, infinite monodromy).

Node HodgeStructuresPartII:H.5/integral-pvhs
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  IsIntegralPVHS: ∃ K, W: 𝒪_K-local system, ι₀, V ≅ W ⊗_{ι₀} ℂ ∧ ∀ ι, W ⊗_ι ℂ underlies a
    polarizable complex variation.
  IsIntegralPVHS.isIntegral: Implies integrality of the monodromy.
  IsIntegralPVHS.conj_aut: Preserved by σ ∈ Aut(ℂ).
  IsIntegralPVHS.of_geometricOrigin: Geometric origin implies IsIntegralPVHS
    (HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs).
  IsIntegralPVHS.unitary_all_finite: If moreover every W ⊗_ι ℂ is unitary, the monodromy is finite
    (HodgeStructuresPartII:H.5/unitary-embeddings-finite).
  IsIntegralPVHS.test_finite_monodromy: A local system with finite monodromy underlies an integral
    PVHS: it is defined over 𝒪_K for K a splitting field of its finite monodromy group (e.g. ℚ(ζ_N),
    N the exponent, by Brauer; the character field need not suffice because of Schur indices, as for
    the quaternion group), and every conjugate is unitary, hence a variation of a single Hodge type.
  IsIntegralPVHS.test_salem_not: The Salem-type character χ_α is integral and unitary but does not
    underlie an integral PVHS: some conjugate σ∘χ_α is not unitary, and a rank-one polarizable
    complex variation is unitary (HodgeStructuresPartII:H.5/zero-higgs-unitary).
  IsIntegralPVHS.test_isIntegral: IsIntegralPVHS V → IsIntegralRepresentation of the monodromy of V.
  IsIntegralPVHS.test_unitary_everywhere_finite: If V underlies an integral PVHS through W and every
    W ⊗_ι ℂ is unitary, then the monodromy of V is finite (HodgeStructuresPartII:H.5/unitary-
    embeddings-finite).

Node HodgeStructuresPartII:H.5/geometric-origin-integral-pvhs
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  IsOfGeometricOrigin.integralPVHS: Let V be a complex local system of geometric origin on a smooth
    complex variety X (V|_U a subquotient of R^i f_* ℂ for a smooth projective f: Y → U over a dense
    open U ⊂ X). Then V is defined over 𝒪_L for a number field L and every Galois conjugate V
    ⊗_{𝒪_L, ι} ℂ underlies a polarizable complex variation of Hodge structure on X: V underlies an
    integral PVHS (HodgeStructuresPartII:H.5/integral-pvhs).

Node HodgeStructuresPartII:H.5/low-rank-pvhs-unitary
  Missing carrier: Teichmüller space, versal families of pointed curves and isomonodromic deformations.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  unitary_of_lowRank_pvhs: (Landesman–Litt 2022 Theorem 1.2.12, Theorem 1.2.13 in v3.) Let (C, x_1,
    …, x_n) be a hyperbolic n-pointed curve of genus g and (E,∇) a flat vector bundle on C with
    regular singularities at the x_i and rank E < 2√(g+1). If an isomonodromic deformation of (E,∇)
    to an analytically general nearby n-pointed curve underlies a polarizable complex variation of
    Hodge structure, then (E,∇) has unitary monodromy. In the form used by Landesman–Litt 2024: a
    local system of rank < 2√(g+1) on the total space of a punctured versal family of hyperbolic
    genus-g curves that underlies a complex PVHS restricts to a unitary local system on every fibre.

Node HodgeStructuresPartII:H.5/very-general-rank-bound
  Missing carrier: Teichmüller space, versal families of pointed curves and isomonodromic deformations.
  Missing carrier: polarized complex variations of Hodge structure (layer H.2) and their graded Higgs bundles.
  rank_bound_veryGeneral: (Landesman–Litt 2022 Theorem 1.2.5.) Let K be a number field, (C, x_1, …,
    x_n) an analytically very general hyperbolic n-pointed curve of genus g, and V an 𝒪_K-local
    system on C ∖ {x_1, …, x_n} with infinite monodromy such that V ⊗_{𝒪_K, ι} ℂ underlies a
    polarizable complex variation of Hodge structure for every embedding ι (V underlies an integral
    PVHS, HodgeStructuresPartII:H.5/integral-pvhs). Then rk_{𝒪_K} V ≥ 2√(g+1). Equivalently,
    integral PVHS of rank < 2√(g+1) on such curves have finite monodromy; in particular (Corollary
    1.2.7) local systems of geometric origin with infinite monodromy have rank ≥ 2√(g+1).

Node HodgeStructuresPartII:H.5/rigid-sl3-geometric
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  isOfGeometricOrigin_of_sl3: Let X be a smooth connected projective complex variety with base point
    x. (a) (Langer–Simpson Theorem 1.3) Every rigid, integral, irreducible representation ρ: π₁(X,
    x) → SL_3(ℂ) is of geometric origin. (b) (Esnault–Groechenig §8.1) Every cohomologically rigid
    irreducible flat connection of rank 3 with trivial determinant on X is of geometric origin.

Node HodgeStructuresPartII:H.5/no-symmetric-differentials
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  finite_of_no_symmetric_differentials: Let X be a compact Kähler manifold (smooth projective in the
    uses here) with H⁰(X, Sym^i Ω¹_X) = 0 for every i ≥ 1. Then: (a) (Arapura;
    Brunebarbe–Klingler–Totaro Theorem 4.1) every finite-dimensional complex representation of π₁(X)
    is rigid, in the sense that its point of M_B(X, GL(n)) is isolated (no determinant fixed); (b)
    (Brunebarbe–Klingler–Totaro Theorem 0.1) every finite-dimensional representation of π₁(X) over
    any field has finite image; (c) every Higgs bundle in M_Dol(X, (L,0), r) has nilpotent Higgs
    field, the Hitchin base A_r being a point.

Node HodgeStructuresPartII:H.5/versal-unitary-rigidity
  Missing carrier: Teichmüller space, versal families of pointed curves and isomonodromic deformations.
  versal_unitary_strongly_rigid: Let π°: 𝒞° → M be a punctured versal family of n-pointed genus-g
    curves (as in HodgeStructuresPartII:H.4 and Landesman–Litt Notation 1.10.1), m ∈ M and C° =
    𝒞°_m. Let V be a GL_r-local system (respectively a PGL_r-local system) on the total space 𝒞°
    with r < √(g+1), such that V|_{C°} is (respectively is the projectivization of) an irreducible
    unitary local system. Then H¹(𝒞°, ad V) = 0: V is strongly cohomologically rigid
    (HodgeStructuresPartII:H.5/strong-cohomological-rigidity), hence cohomologically rigid for every
    good compactification of 𝒞° (HodgeStructuresPartII:H.5/strong-implies-cohomological).

Node HodgeStructuresPartII:H.5/adjoint-projectivization
  Missing carrier: the full geometric or coefficient generality described in the scope note.
  Scope: Native projectivization states invariance under pointwise scalar twists. The full Lie(PGL_r) comparison in this specification has no native PGL carrier and remains omitted.

Node HodgeStructuresPartII:H.5/adjoint-no-invariants
  Missing carrier: the full geometric or coefficient generality described in the scope note.
  Scope: Native no-invariants has an algebraically closed coefficient field and irreducibility. The packet states the general absolutely irreducible version; that generality remains omitted.

Node HodgeStructuresPartII:H.5/adjoint-base-change
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  TraceFreeAdjoint.baseChange: For a field embedding σ: K → L, rep (σ ∘ ρ) ≅ (rep ρ) ⊗_{K,σ} L,
    compatibly with the matrix entries.

Node HodgeStructuresPartII:H.5/rigid-locus-fibre
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  RigidLocus.fibre: For s ∈ S, the fibre of RigidLocus f over s is the rigid locus of the fibre M_s
    → Spec κ(s), i.e. the isolated points of M_s.

Node HodgeStructuresPartII:H.5/hodge-system-scaling
  Missing carrier: the full geometric or coefficient generality described in the scope note.
  Scope: Native scaling is for the finite-free cotangent module chart. The sheaf-valued system and its Higgs isomorphism remain omitted.

Node HodgeStructuresPartII:H.5/hodge-system-nilpotent
  Missing carrier: the full geometric or coefficient generality described in the scope note.
  Scope: Native nilpotence is for contractions in the finite-free cotangent module chart. The full sheaf-valued joint-nilpotence statement remains omitted.

Node HodgeStructuresPartII:H.5/rigid-hodge-nonzero
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  HodgeRigidLocus.nonzeroTrivialization: M^rig_Hod ×_{𝔸¹} 𝔾_m ≅ M^rig_dR × 𝔾_m over 𝔾_m, (λ, E, D) ↦
    ((E, λ⁻¹D), λ).

Node HodgeStructuresPartII:H.5/arithmetic-spread-morphisms
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  ArithmeticModel.spread_hom: Morphisms, sections and isomorphisms of finitely presented objects
    over X extend over some restriction of S, uniquely after further shrinking (EGA IV 8.8.2(i),
    Mathlib Scheme.exists_hom_comp_eq_comp_of_locallyOfFiniteType).

Node HodgeStructuresPartII:H.5/relative-stable-complex-fibre
  Missing carrier: line bundles, projective morphisms, relative moduli over arithmetic bases and spreading of modules.
  Missing carrier: moduli spaces of H.1 (M_B, M_dR, M_Dol, M_Hod) as schemes with their points, tangent spaces and G_m-actions.
  RelativeModuli.stableGenericIso: The stable open base-changes to the stable moduli of
    HodgeStructuresPartII:H.1/derham-coarse, HodgeStructuresPartII:H.1/dolbeault-coarse,
    HodgeStructuresPartII:H.1/hodge-coarse over ℂ.

Node HodgeStructuresPartII:H.5/integral-projective-lattice
  Missing carrier: projective linear groups PGL_r and projective representations.
  Missing carrier: completions of number fields at finite places, lattices over rings of integers and companions.
  Missing carrier: general split reductive group schemes over ℤ and their adjoint representations.
  IsIntegralRepresentation.iff_projectiveLattice: For G = GL_r, integral ↔ the local system comes by
    extension of scalars from a local system of finitely generated projective 𝒪_K-modules.

Node HodgeStructuresPartII:H.5/geometric-origin-summand
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsOfGeometricOrigin.iff_summand: Equivalent with 'direct summand' in place of 'subquotient'
    (semisimplicity).

Node HodgeStructuresPartII:H.5/geometric-origin-boundary
  Missing carrier: algebraic flat bundles, Higgs bundles and local systems on smooth complex varieties, with de Rham and Betti cohomology.
  IsOfGeometricOrigin.quasiUnipotent: Local systems of geometric origin have quasi-unipotent local
    monodromy at infinity (local monodromy theorem, LefschetzPencilsAndVanishingCycles:LPV.1).

-/

end
end Layer6

/-! ## H.6 -/

section Layer7

/-! ### H.6: signature boundary

This section gives finite-dimensional linear algebra and calculus in a chosen
frame. Its `SemistableLogModel`, `NilpotentOrbit`, `untwistedPeriodMap` and
`negativeLieCorrection` are local coordinate forms, with the limitations stated
at their declarations. They do not define global semistable families,
polarized variations, period manifolds or limiting mixed Hodge structures.

The supplier inventory below names the geometric targets whose native inputs
cannot be stated here. Those targets have no typed theorem or executable test
in this section. README.md states their mathematics and prerequisites; a local
matrix test does not discharge a geometry-level comparison.
-/

noncomputable section
open scoped BigOperators Matrix Matrix.Norms.Operator
open Set Filter Topology
namespace TauCeti.Hodge.Degeneration

abbrev Vec (d : ℕ) := Fin d → ℂ
abbrev Mat (d : ℕ) := Matrix (Fin d) (Fin d) ℂ
/-- A decreasing filtration of `ℂ^d` in coordinates, indexed by all integers. -/
abbrev Flag (d : ℕ) := ℤ → Submodule ℂ (Vec d)

-- Private notation adapters, not proposed roadmap-owned definitions.
private def act {d : ℕ} (A : Mat d) (F : Flag d) : Flag d :=
  fun p => (F p).map (Matrix.toLin' A)
private def twist {n d : ℕ} (L : Fin n → Mat d) (z : Fin n → ℂ) : Mat d :=
  NormedSpace.exp (∑ i, z i • L i)
private def upper {n : ℕ} (Y : ℝ) : Set (Fin n → ℂ) :=
  {z | ∀ i, Y < (z i).im}
/-- The complex conjugate of a subspace of `ℂ^d` for the standard real structure. -/
private def conjSub {d : ℕ} (S : Submodule ℂ (Vec d)) : Submodule ℂ (Vec d) where
  carrier := {v | star v ∈ S}
  add_mem' := by
    intro a b ha hb
    simpa using S.add_mem ha hb
  zero_mem' := by simp
  smul_mem' := by
    intro c v hv
    simpa using S.smul_mem (star c) hv
private def jordan : Mat 2 := !![0,1;0,0]

/-! ## Native supplier and omitted-signature inventory

No arbitrary admitted carrier or function represents an imported interface.
The following names identify mathematical exports to state once their owners'
actual carriers and comparison maps are available. They are not declarations.

* `logCohomologyBaseChange`, `specialResidue`, `semistableBetti` and
  `equivariantLogComparison`: ComplexComparisonPartII C0/C3/C5 and the analytic
  log interface of CrystallineCohomology CR.5 supply a proper semistable analytic
  family, log de Rham complexes, cohomology with base change, the special
  boundary operator, a nearby-cycle comparison and a specified finite action
  on that family. No action is manufactured from a bare finite-group type.
  Tests must compare actual cohomology fibres and the residue through those
  maps, including the local model x₁x₂ = T and a specified character summand.

* `quasiUnipotentMonodromy`, `untwistedExtension`, `nilpotentOrbitTheorem` and
  `finiteMonodromyExtension`: H.2/H.3 and ShimuraData D3 supply an integral
  polarized variation, its marked horizontal holomorphic period lift, the
  represented compact dual and period domain, and the canonical extension.
  Required tests include a Tate variation, a nonzero elliptic degeneration,
  partial boundary strata, an inner analytic buffer and finite-quotient
  descent. The local untwisting identity does not state these theorems.

* `sl2OrbitTheorem`, `limitingMixedHodgeOneVariable`, `nilpotentConeWeights`,
  `limitingMixedHodge`, `logarithmsTypeMinusOne`, `hodgeWeightDistributive` and
  `simultaneousSplittings`: use a genuinely polarized real/rational nilpotent
  orbit with its native period-domain comparison. LPV.1 supplies centered
  monodromy filtrations and their relative/naturality/finite-splitting API.
  Native mixed Hodge structures and Deligne splittings come from Tau Ceti,
  with the mixed tensor/Hom/Tate comparisons requested from H.2. Test the
  zero-generator case, the upper-nilpotent/diagonal sign convention, actual
  weight k+r versus centered index r, nested faces and separate rational
  weight and complex Hodge splittings. A supplied subset of coordinate flags
  alone is insufficient for a polarized orbit theorem.

* `horizontalCorrection`, `flatNormEstimate`, `movingNormEstimate`,
  `exteriorPowerEstimates` and `perturbedNormComparison`: H.2/H.3 supply the
  limiting isometry Lie algebra, its native mixed-Hodge negative complement,
  analytic splitting subbundles, positive Hodge forms and exterior-power
  comparison. Separate the boundary factor from the centered correction and
  retain common-depth compact-family hypotheses. Tests must exercise the
  2πi factor, centered weights, nonconstant boundary factor, a nonzero
  homogeneous vector, Λ⁰, oversized vanishing wedges and Gram determinants.
  A freely supplied norm function cannot replace the positive Hodge metric.

* `oneVariableSL2` and `oneVariableSiegel`: the marked period lift, canonical
  compact and rational parabolic factors come from H.3 and AA.3. The fixed-K
  comparison of Schmid's rational torus with Cartan-stable Siegel data is an
  additional mathematical input. Test bounded-width strips, the zero-logarithm
  extension case and rational power-curve pullback after clearing denominators;
  general finite containment cannot be inferred from an arbitrary set family.

The omitted inputs formerly called `PolarizedDatum`, `IntegralVariation`,
`UnipotentVariation` and `SemistableFamily` are not defined here. Likewise,
`monodromyFiltration`, `limitingBigrading` and `exteriorCoordinates` require
native constructions and comparisons, rather than independent admitted values.
The associated global definition API and geometry-level tests remain targets
in README.md. This inventory neither supplies signatures nor certifies them.
-/

/-! ## Geometric logarithmic specialization -/

/-- The local normal form of a `SemistableLogModel`: the number `r ≥ 1` of
divisor coordinates among `d` coordinates and the radius of the base disc.
Left out: the global smooth total space, properness, the atlas and the log
structures; their native comparison is listed in the supplier inventory. -/
structure SemistableLogModel (d : ℕ) where
  divisorCoordinates : Fin (d + 1)
  nonempty : 0 < divisorCoordinates.val
  radius : ℝ
  radius_pos : 0 < radius

def SemistableLogModel.localMap {d : ℕ} (M : SemistableLogModel d)
    (x : Vec d) : ℂ :=
  ∏ i : Fin d with i.val < M.divisorCoordinates.val, x i

lemma SemistableLogModel.localMap_equation {d : ℕ} (M : SemistableLogModel d)
    (x : Vec d) : M.localMap x =
      ∏ i : Fin d with i.val < M.divisorCoordinates.val, x i := by
  sorry

lemma SemistableLogModel.ext {d : ℕ} (M M' : SemistableLogModel d)
    (hr : M.divisorCoordinates = M'.divisorCoordinates)
    (hρ : M.radius = M'.radius) : M = M' := by
  sorry

def SemistableLogModel.restrict {d : ℕ} (M : SemistableLogModel d)
    (ρ : ℝ) (hρ : 0 < ρ) (_hle : ρ ≤ M.radius) : SemistableLogModel d :=
  { M with radius := ρ, radius_pos := hρ }

lemma SemistableLogModel.restrict_comp {d : ℕ} (M : SemistableLogModel d)
    (ρ₁ ρ₂ : ℝ) (h₁ : 0 < ρ₁) (h₂ : 0 < ρ₂)
    (h₁M : ρ₁ ≤ M.radius) (h₂₁ : ρ₂ ≤ ρ₁) :
    (M.restrict ρ₁ h₁ h₁M).restrict ρ₂ h₂ h₂₁ =
      M.restrict ρ₂ h₂ (h₂₁.trans h₁M) := by
  sorry

/-- The class of `dlog T = Σ_{i ≤ r} dlog x_i` in the frame `dlog x_i (i ≤ r)`,
`dx_j (j > r)` of absolute log one-forms. -/
private def SemistableLogModel.dlogBase {d : ℕ} (M : SemistableLogModel d) : Vec d :=
  fun i => if i.val < M.divisorCoordinates.val then 1 else 0

private def smoothChart : SemistableLogModel 2 :=
  ⟨1, by decide, 1, by norm_num⟩
private def nodalChart : SemistableLogModel 2 :=
  ⟨2, by decide, 1, by norm_num⟩

-- SemistableLogModel_test_smooth
example (a b : ℂ) : smoothChart.localMap ![a,b] = a := by
  sorry
-- SemistableLogModel_test_node
example (a b : ℂ) : nodalChart.localMap ![a,b] = a * b := by
  sorry
-- SemistableLogModel_test_not_sum
example : nodalChart.localMap ![1,1] ≠ (2 : ℂ) := by
  sorry

/-- Chart form in degree one, at a point: relative log one-forms are the
quotient of the absolute ones by `dlog T`, of dimension `d − 1`. Left out:
analytic sheafification, exterior powers and the differential. -/
theorem relativeLogForms {d : ℕ} (M : SemistableLogModel d) :
    Module.finrank ℂ ((Vec d) ⧸ Submodule.span ℂ {M.dlogBase}) = d - 1 := by
  sorry

/-- Chart form in degree one, at a point, of the exact sequence
`0 → DR_rel[−1] → DR_abs → DR_rel → 0`: the kernel of the quotient map is the
image of the wedge with `dlog T`. Left out: the sequence of complexes, its
signs and the derived pushforward. -/
theorem wedgeDlogTriangle {d : ℕ} (M : SemistableLogModel d) :
    LinearMap.ker (Submodule.span ℂ {M.dlogBase}).mkQ =
      LinearMap.range (LinearMap.toSpanSingleton ℂ (Vec d) M.dlogBase) := by
  sorry

/-- The logarithmic Gauss–Manin connection in a logarithmic frame:
`∇v = dv + A(q) v dq/q`, evaluated on the vector field `d/dq`. -/
def logGaussManin {d : ℕ} (A : ℂ → Mat d) (q : ℂ) (v dv : Vec d) : Vec d :=
  dv + q⁻¹ • (A q).mulVec v

lemma logGaussManin.apply {d : ℕ} (A : ℂ → Mat d) (q : ℂ) (v dv : Vec d) :
    logGaussManin A q v dv = dv + q⁻¹ • (A q).mulVec v := by
  sorry
lemma logGaussManin.add {d : ℕ} (A : ℂ → Mat d) (q : ℂ)
    (u v du dv : Vec d) :
    logGaussManin A q (u + v) (du + dv) =
      logGaussManin A q u du + logGaussManin A q v dv := by
  sorry
lemma logGaussManin.leibniz {d : ℕ} (A : ℂ → Mat d) (q f df : ℂ)
    (v dv : Vec d) :
    logGaussManin A q (f • v) (df • v + f • dv) =
      df • v + f • logGaussManin A q v dv := by
  sorry
lemma logGaussManin.residue {d : ℕ} (A : ℂ → Mat d)
    (hA : ContinuousAt A 0) (v : Vec d) :
    Tendsto (fun q => q • logGaussManin A q v 0) (𝓝[≠] 0)
      (𝓝 ((A 0).mulVec v)) := by
  sorry
lemma logGaussManin.horizontalMap {d e : ℕ} (A : ℂ → Mat d) (B : ℂ → Mat e)
    (P : Matrix (Fin e) (Fin d) ℂ) (hP : ∀ q, P * A q = B q * P)
    (q : ℂ) (v dv : Vec d) :
    P.mulVec (logGaussManin A q v dv) =
      logGaussManin B q (P.mulVec v) (P.mulVec dv) := by
  sorry
lemma logGaussManin.ramified {d : ℕ} (A : ℂ → Mat d) (e : ℕ) (he : 0 < e)
    (t : ℂ) (ht : t ≠ 0) (v dv : Vec d) :
    logGaussManin (fun s => (e : ℂ) • A (s ^ e)) t v
      (((e : ℂ) * t ^ (e - 1)) • dv) =
      ((e : ℂ) * t ^ (e - 1)) • logGaussManin A (t ^ e) v dv := by
  sorry

-- logGaussManin_test_zero
example {d : ℕ} (q : ℂ) (v dv : Vec d) :
    logGaussManin (fun _ => 0) q v dv = dv := by
  sorry
-- logGaussManin_test_jordan
example : logGaussManin (fun _ => jordan) 2 ![0,1] 0 = ![1/2,0] := by
  sorry
-- logGaussManin_test_leibniz
example (q : ℂ) : logGaussManin (fun _ => (0 : Mat 1)) q ![q] ![1] = ![1] := by
  sorry

/-- The idempotent `e_χ = |H|⁻¹ Σ_h χ(h)⁻¹ ρ(h)` of a character of a finite group. -/
private def characterIdempotent {d : ℕ} {H : Type} [Group H] [Fintype H]
    (ρ : H →* (Mat d)ˣ) (χ : H →* ℂˣ) : Mat d :=
  ((Fintype.card H : ℂ)⁻¹) • ∑ h, ((χ h : ℂ)⁻¹) • (ρ h : Mat d)

/-- The linear algebra of a ramified pullback `T = t^e`: the logarithm is
multiplied by `e`, and the nilpotency index does not change. Left out: the
semistable modification and its comparison. -/
theorem ramifiedResidue {d : ℕ} (L : Mat d) (hL : IsNilpotent L)
    (e : ℕ) (he : 0 < e) :
    NormedSpace.exp ((e : ℂ) • L) = NormedSpace.exp L ^ e ∧
      (∀ r : ℕ, ((e : ℂ) • L) ^ r = 0 ↔ L ^ r = 0) := by
  sorry

/-! ## Normalized period degeneration -/

/-- The linear algebra of the coordinate power cover: commuting
quasi-unipotent matrices have powers with commuting nilpotent logarithms, and
if the matrices preserve a bilinear form `B` the logarithms are infinitesimal
isometries of it. Left out: rationality of the logarithms and the cover. -/
theorem unipotentNormalization {n d : ℕ} (T : Fin n → Mat d) (B : Mat d)
    (hT : ∀ i j, Commute (T i) (T j))
    (hB : ∀ i, (T i)ᵀ * B * T i = B)
    (hqu : ∀ i, ∃ e : ℕ, 0 < e ∧ IsNilpotent (T i ^ e - 1)) :
    ∃ (e : Fin n → ℕ) (L : Fin n → Mat d),
      (∀ i, 0 < e i ∧ IsNilpotent (L i) ∧ NormedSpace.exp (L i) = T i ^ e i ∧
        (L i)ᵀ * B + B * L i = 0) ∧
      ∀ i j, Commute (L i) (L j) := by
  sorry

/-- A nilpotent orbit in coordinates, entering a given set `D` of flags.
Left out: that the generators are real (or rational) infinitesimal isometries
of the polarization and that `D` is a period domain; statements that need
this need the native polarized-orbit interface in the supplier inventory. -/
structure NilpotentOrbit (n d : ℕ) (D : Set (Flag d)) where
  L : Fin n → Mat d
  F : Flag d
  antitone : Antitone F
  exhaustive : ∃ p, F p = ⊤
  separated : ∃ p, F p = ⊥
  nilpotent : ∀ i, IsNilpotent (L i)
  commute : ∀ i j, Commute (L i) (L j)
  lowering : ∀ i p, (F p).map (Matrix.toLin' (L i)) ≤ F (p - 1)
  eventual : ∃ Y : ℝ, 0 < Y ∧ ∀ z ∈ upper Y, act (twist L z) F ∈ D

def NilpotentOrbit.orbit {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (z : Fin n → ℂ) : Flag d :=
  act (twist O.L z) O.F
lemma NilpotentOrbit.orbit_zero {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) : O.orbit 0 = O.F := by
  sorry
lemma NilpotentOrbit.orbit_shift {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (z : Fin n → ℂ) (a : Fin n → ℤ) :
    O.orbit (fun i => z i + a i) = act (twist O.L (fun i => (a i : ℂ))) (O.orbit z) := by
  sorry
lemma NilpotentOrbit.horizontal {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (i : Fin n) (p : ℤ) :
    (O.F p).map (Matrix.toLin' (O.L i)) ≤ O.F (p - 1) := by
  sorry
lemma NilpotentOrbit.eventual_mem {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) :
    ∃ Y : ℝ, 0 < Y ∧ ∀ z, (∀ i, Y < (z i).im) → O.orbit z ∈ D := by
  sorry

def NilpotentOrbit.reindex {n d : ℕ} {D : Set (Flag d)}
    (O : NilpotentOrbit n d D) (σ : Equiv.Perm (Fin n)) : NilpotentOrbit n d D where
  L := O.L ∘ σ
  F := O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry
lemma NilpotentOrbit.ext {n d : ℕ} {D : Set (Flag d)} (O O' : NilpotentOrbit n d D)
    (hL : O.L = O'.L) (hF : O.F = O'.F) : O = O' := by
  sorry

/-- The one-variable orbit along the ray of a positive combination. -/
def NilpotentOrbit.ray {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (a : Fin n → ℝ) (_ha : ∀ i, 0 < a i) : NilpotentOrbit 1 d D where
  L := fun _ => ∑ i, (a i : ℂ) • O.L i
  F := O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry

/-- The orbit of a face: the generators indexed by `ι`, with the other
variables frozen at values `c` deep enough for the given depth `Y`. -/
def NilpotentOrbit.face {n k d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (ι : Fin k ↪ Fin n) (Y : ℝ) (_hY : 0 < Y)
    (_hO : ∀ z ∈ upper Y, act (twist O.L z) O.F ∈ D)
    (c : Fin n → ℂ) (_hc : c ∈ upper Y) : NilpotentOrbit k d D where
  L := O.L ∘ ι
  F := act (twist O.L (fun i => if i ∈ Set.range ι then 0 else c i)) O.F
  antitone := by sorry
  exhaustive := by sorry
  separated := by sorry
  nilpotent := by sorry
  commute := by sorry
  lowering := by sorry
  eventual := by sorry

-- NilpotentOrbit_test_zero
example {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (hL : ∀ i, O.L i = 0) (z : Fin n → ℂ) : O.orbit z = O.F := by
  sorry
-- NilpotentOrbit_test_elliptic
example (z : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (NormedSpace.exp (z • jordan))) =
      Submodule.span ℂ {(![z,1] : Vec 2)} := by
  sorry
-- NilpotentOrbit_test_no_positivity
example {n d : ℕ} {D : Set (Flag d)} (O : NilpotentOrbit n d D)
    (hL : ∀ i, O.L i = 0) : O.F ∈ D := by
  sorry

/-- The untwisted period map on the universal cover. -/
def untwistedPeriodMap {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) : Flag d :=
  act (twist L (fun i => -z i)) (Φ z)
lemma untwistedPeriodMap.apply {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap L Φ z = act (twist L (fun i => -z i)) (Φ z) := by
  sorry
lemma untwistedPeriodMap.undo {n d : ℕ} (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    act (twist L z) (untwistedPeriodMap L Φ z) = Φ z := by
  sorry
lemma untwistedPeriodMap.integer_shift {n d : ℕ} (L : Fin n → Mat d)
    (hL : ∀ i j, Commute (L i) (L j)) (Φ : (Fin n → ℂ) → Flag d)
    (hΦ : ∀ (z : Fin n → ℂ) (a : Fin n → ℤ),
      Φ (fun i => z i + a i) = act (twist L (fun i => (a i : ℂ))) (Φ z))
    (z : Fin n → ℂ) (a : Fin n → ℤ) :
    untwistedPeriodMap L Φ (fun i => z i + a i) = untwistedPeriodMap L Φ z := by
  sorry
lemma untwistedPeriodMap.zero {n d : ℕ} (Φ : (Fin n → ℂ) → Flag d) :
    untwistedPeriodMap (fun _ => (0 : Mat d)) Φ = Φ := by
  sorry
lemma untwistedPeriodMap.gauge {n d : ℕ} (P : (Mat d)ˣ) (L : Fin n → Mat d)
    (Φ : (Fin n → ℂ) → Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap (fun i => (↑P : Mat d) * L i * (↑P⁻¹ : Mat d))
      (fun z => act (↑P : Mat d) (Φ z)) z = act (↑P : Mat d) (untwistedPeriodMap L Φ z) := by
  sorry
/-- The residue convention `A_i = −L_i/(2πi)` of the canonical extension: its
monodromy `exp(−2πi A_i)` is `exp L_i`. Left out: the identification of the
frame with the canonical extension of H.2. -/
lemma untwistedPeriodMap.canonicalExtension {n d : ℕ} (L : Fin n → Mat d) (i : Fin n) :
    NormedSpace.exp ((-(2 * Real.pi : ℂ) * Complex.I) •
      ((-(2 * Real.pi : ℂ) * Complex.I)⁻¹ • L i)) = NormedSpace.exp (L i) := by
  sorry

-- untwistedPeriodMap_test_orbit
example {n d : ℕ} (L : Fin n → Mat d) (F : Flag d) (z : Fin n → ℂ) :
    untwistedPeriodMap L (fun z => act (twist L z) F) z = F := by
  sorry
-- untwistedPeriodMap_test_zero
example {d : ℕ} (Φ : (Fin 0 → ℂ) → Flag d) (z : Fin 0 → ℂ) :
    untwistedPeriodMap (fun i => Fin.elim0 i) Φ z = Φ z := by
  sorry
-- untwistedPeriodMap_test_sign
example : (Submodule.span ℂ {(![Complex.I,1] : Vec 2)}).map
    (Matrix.toLin' (NormedSpace.exp ((-Complex.I) • jordan))) =
      Submodule.span ℂ {(![0,1] : Vec 2)} := by
  sorry

/-! ## Local exponential correction -/

/-- The correction `exp(v(q))` of a coefficient `v` in the negative-Lie chart. -/
def negativeLieCorrection {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (q : Fin n → ℂ) : Mat d := NormedSpace.exp (v q)
lemma negativeLieCorrection.exp_zero {n d : ℕ} (q : Fin n → ℂ) :
    negativeLieCorrection (fun _ => (0 : Mat d)) q = 1 := by
  sorry
/-- A coefficient that lifts `Ψ` through the exponential chart at `F` lifts it
through `negativeLieCorrection`. -/
lemma negativeLieCorrection.lift {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (Ψ : (Fin n → ℂ) → Flag d) (F : Flag d)
    (hv : ∀ q, Ψ q = act (NormedSpace.exp (v q)) F) (q : Fin n → ℂ) :
    Ψ q = act (negativeLieCorrection v q) F := by
  sorry
lemma negativeLieCorrection.unique {d : ℕ} (F : Flag d) (B : Set (Mat d))
    (hchart : Set.InjOn (fun A => act (NormedSpace.exp A) F) B)
    (A A' : Mat d) (hA : A ∈ B) (hA' : A' ∈ B)
    (h : act (NormedSpace.exp A) F = act (NormedSpace.exp A') F) : A = A' := by
  sorry
lemma negativeLieCorrection.boundary {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (hv : v 0 = 0) : negativeLieCorrection v 0 = 1 := by
  sorry

def negativeLieCorrection.gamma {n d : ℕ} (L : Fin n → Mat d)
    (v : (Fin n → ℂ) → Mat d) (z : Fin n → ℂ) : Mat d :=
  twist L z * negativeLieCorrection v
    (fun i => Complex.exp ((2 * Real.pi : ℂ) * Complex.I * z i))
lemma negativeLieCorrection.buffer {n d : ℕ} (v : (Fin n → ℂ) → Mat d)
    (U K : Set (Fin n → ℂ)) (hv : AnalyticOnNhd ℂ v U)
    (hK : K ⊆ U) : AnalyticOnNhd ℂ v K := by
  sorry

-- negativeLieCorrection_test_zero
example {n d : ℕ} (q : Fin n → ℂ) :
    negativeLieCorrection (fun _ => (0 : Mat d)) q = 1 := by
  sorry
-- negativeLieCorrection_test_square_zero
example {d : ℕ} (A : Mat d) (hA : A ^ 2 = 0) :
    negativeLieCorrection (fun _ : Fin 1 → ℂ => A) 0 = 1 + A := by
  sorry
-- negativeLieCorrection_test_nonidentity
example : negativeLieCorrection (fun _ : Fin 1 → ℂ => jordan) 0 ≠ 1 := by
  sorry
-- negativeLieCorrection_test_elliptic_chart
example (a : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (negativeLieCorrection (fun _ : Fin 1 → ℂ => a • jordan) 0)) =
      Submodule.span ℂ {(![a,1] : Vec 2)} := by
  sorry
-- negativeLieCorrection_test_stabilizer
example (t : ℂ) :
    (Submodule.span ℂ {(![0,1] : Vec 2)}).map
      (Matrix.toLin' (NormedSpace.exp (t • (!![1,0;0,-1] : Mat 2)))) =
      Submodule.span ℂ {(![0,1] : Vec 2)} := by
  sorry

/-! ## Rational slope linear algebra -/

/-- Clearing the denominators of rational slopes: the combined logarithm of
the curve is a positive integer multiple of the combination with the slopes.
Left out: the pulled-back variation and its Siegel containment. -/
theorem powerCurveNormalization {n d : ℕ} (a : Fin n → ℚ)
    (ha : ∀ i, 0 ≤ a i) (L : Fin n → Mat d) :
    ∃ (e : ℕ) (b : Fin n → ℕ), 0 < e ∧
      (∀ i, (e : ℚ) * a i = b i) ∧
      (∑ i, ((b i : ℕ) : ℂ) • L i) =
        (e : ℂ) • (∑ i, (a i : ℂ) • L i) := by
  sorry

end TauCeti.Hodge.Degeneration

end
end Layer7

/-! ## H.7 -/

section Layer8

/-! ### H.7: signature boundary

The source-level hypotheses are specified in the specification and reader. Missing
supplier conditions are OMITTED, with a comment at each affected declaration,
not encoded as arbitrary Prop fields or as propositions defined using sorry.
Coordinate graphs below are local representatives in the requested finite
atlas, not definitions of an o-minimal structure or a Hodge manifold. Likewise
subrings and families of subsets are receiving data from LD.6 and AA.3, not new
local definitions of their theories. See gap G7 for the exact omissions.
-/

noncomputable section
open scoped BigOperators
open Set Module

namespace TauCeti.Hodge.Tame

universe u v w

/-- The closed bounded-width, positive-height sector. -/
def boundedSector (n : ℕ) (R η : ℝ) : Set (Fin n → ℂ) :=
  {z | ∀ i, |(z i).re| ≤ R ∧ η ≤ (z i).im}

lemma boundedSector.mem_iff {n : ℕ} {R η : ℝ} {z : Fin n → ℂ} :
    z ∈ boundedSector n R η ↔ ∀ i, |(z i).re| ≤ R ∧ η ≤ (z i).im := by
  sorry

lemma boundedSector.mono {n : ℕ} {R R' η η' : ℝ}
    (hR : R ≤ R') (hη : η' ≤ η) :
    boundedSector n R η ⊆ boundedSector n R' η' := by
  sorry

lemma boundedSector.reindex {n : ℕ} (σ : Equiv.Perm (Fin n))
    (R η : ℝ) (z : Fin n → ℂ) :
    (z ∘ σ) ∈ boundedSector n R η ↔ z ∈ boundedSector n R η := by
  sorry

-- boundedSector_test_point
example : (fun _ : Fin 1 => (2 : ℂ) * Complex.I) ∈ boundedSector 1 1 1 := by
  sorry

-- boundedSector_test_empty_coordinates
example (R η : ℝ) : boundedSector 0 R η = Set.univ := by
  sorry

-- boundedSector_test_width
example : (fun _ : Fin 1 => (2 : ℂ) + 2 * Complex.I) ∉ boundedSector 1 1 1 := by
  sorry

/-- The ordered sector; the height parameter is explicit. -/
def orderedSector (n : ℕ) (R Y : ℝ) : Set (Fin n → ℂ) :=
  {z | z ∈ boundedSector n R Y ∧ ∀ i j, i ≤ j → (z j).im ≤ (z i).im}

lemma orderedSector.mem_iff {n : ℕ} {R Y : ℝ} {z : Fin n → ℂ} :
    z ∈ orderedSector n R Y ↔
      z ∈ boundedSector n R Y ∧ ∀ i j, i ≤ j → (z j).im ≤ (z i).im := by
  sorry

lemma orderedSector.subset_boundedSector (n : ℕ) (R Y : ℝ) :
    orderedSector n R Y ⊆ boundedSector n R Y := by
  sorry

-- Standalone prerequisite: H.7/ordered-sector-permutation-cover.
lemma orderedSector.permutation_cover {n : ℕ} {R Y : ℝ} {z : Fin n → ℂ}
    (hz : z ∈ boundedSector n R Y) :
    ∃ σ : Equiv.Perm (Fin n), z ∘ σ ∈ orderedSector n R Y := by
  sorry

-- orderedSector_test_order
example : (![3 * Complex.I, 2 * Complex.I] : Fin 2 → ℂ) ∈ orderedSector 2 1 1 := by
  sorry

-- orderedSector_test_ties
example : (![2 * Complex.I, 2 * Complex.I] : Fin 2 → ℂ) ∈ orderedSector 2 1 1 := by
  sorry

-- orderedSector_test_reverse
example : (![2 * Complex.I, 3 * Complex.I] : Fin 2 → ℂ) ∉ orderedSector 2 1 1 := by
  sorry

/-- Coordinate exponential, using Mathlib's complex exponential. -/
def sectorUniformization {n : ℕ} (z : Fin n → ℂ) : Fin n → ℂ :=
  fun i => Complex.exp ((2 * Real.pi : ℂ) * Complex.I * z i)

lemma sectorUniformization.apply {n : ℕ} (z : Fin n → ℂ) (i : Fin n) :
    sectorUniformization z i = Complex.exp ((2 * Real.pi : ℂ) * Complex.I * z i) := by
  sorry

lemma sectorUniformization.norm {n : ℕ} (z : Fin n → ℂ) (i : Fin n) :
    ‖sectorUniformization z i‖ = Real.exp (-2 * Real.pi * (z i).im) := by
  sorry

lemma sectorUniformization.integer_shift {n : ℕ} (z : Fin n → ℂ) (a : Fin n → ℤ) :
    sectorUniformization (fun i => z i + (a i : ℂ)) = sectorUniformization z := by
  sorry

-- Standalone prerequisite: H.7/sector-uniformization-half-open-surjective.
lemma sectorUniformization.halfOpen_surjective {n : ℕ} {η : ℝ} (hη : 0 < η)
    (q : Fin n → ℂ)
    (hq : ∀ i, 0 < ‖q i‖ ∧ ‖q i‖ < Real.exp (-2 * Real.pi * η)) :
    ∃ z : Fin n → ℂ, (∀ i, 0 ≤ (z i).re ∧ (z i).re < 1 ∧ η < (z i).im) ∧
      sectorUniformization z = q := by
  sorry

-- sectorUniformization_test_height
example : sectorUniformization (fun _ : Fin 1 => Complex.I) 0 =
    (Real.exp (-2 * Real.pi) : ℂ) := by
  sorry

-- sectorUniformization_test_period
example (z : Fin 1 → ℂ) :
    sectorUniformization (fun i => z i + 1) = sectorUniformization z := by
  sorry

-- sectorUniformization_test_outer_radius
example (z : Fin 1 → ℂ) (hz : z ∈ boundedSector 1 1 1) :
    ‖sectorUniformization z 0‖ ≠ Real.exp (-Real.pi) := by
  sorry

section Forms
variable {S : Type u} {V : Type v} {W : Type w}
variable [AddCommGroup V] [AddCommGroup W] [Module ℂ W]
variable {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {k : ℤ}
variable {hs : S → HodgeStructure hC k}

/-- BKT convention, obtained from the native conjugate-first form. -/
def hodgeFormFunction (P : (s : S) → Polarization hC (hs s))
    (s : S) (u v : W) : ℂ := starRingEnd ℂ ((P s).hodgeForm u v)

lemma hodgeFormFunction.apply (P : (s : S) → Polarization hC (hs s))
    (s : S) (u v : W) :
    hodgeFormFunction P s u v = (P s).Q ((hs s).weilOperator u) (latticeConj hC v) := by
  sorry

lemma hodgeFormFunction.diagonal (P : (s : S) → Polarization hC (hs s))
    (s : S) (u : W) :
    hodgeFormFunction P s u u = (P s).hodgeForm u u := by
  sorry

lemma hodgeFormFunction.hermitian (P : (s : S) → Polarization hC (hs s))
    (s : S) (u v : W) :
    hodgeFormFunction P s u v = starRingEnd ℂ (hodgeFormFunction P s v u) := by
  sorry

lemma hodgeFormFunction.smul_left (P : (s : S) → Polarization hC (hs s))
    (s : S) (a : ℂ) (u v : W) :
    hodgeFormFunction P s (a • u) v = a * hodgeFormFunction P s u v := by
  sorry

lemma hodgeFormFunction.add_left (P : (s : S) → Polarization hC (hs s))
    (s : S) (u u' v : W) :
    hodgeFormFunction P s (u + u') v =
      hodgeFormFunction P s u v + hodgeFormFunction P s u' v := by
  sorry

lemma hodgeFormFunction.add_right (P : (s : S) → Polarization hC (hs s))
    (s : S) (u v v' : W) :
    hodgeFormFunction P s u (v + v') =
      hodgeFormFunction P s u v + hodgeFormFunction P s u v' := by
  sorry

lemma hodgeFormFunction.smul_right (P : (s : S) → Polarization hC (hs s))
    (s : S) (a : ℂ) (u v : W) :
    hodgeFormFunction P s u (a • v) =
      starRingEnd ℂ a * hodgeFormFunction P s u v := by
  sorry

-- hodgeFormFunction_test_tate
example : hodgeFormFunction (fun _ : Unit => tatePolarization 0) () Complex.I 1 =
    Complex.I := by
  sorry

-- hodgeFormFunction_test_zero
example (P : (s : S) → Polarization hC (hs s)) (s : S) (v : W) :
    hodgeFormFunction P s 0 v = 0 := by
  sorry

-- hodgeFormFunction_test_native_diagonal
example (P : (s : S) → Polarization hC (hs s)) (s : S) (u : W) :
    hodgeFormFunction P s u u = (P s).hodgeForm u u := by
  sorry
end Forms

section Flags
variable {W : Type u} [AddCommGroup W] [Module ℂ W]

/-- Initial spans of a chosen basis. Its Hodge adaptation comes from H.6. -/
def hodgeAdaptedFlag {m : ℕ} (b : Basis (Fin m) ℂ W) (j : Fin (m + 1)) :
    Submodule ℂ W := Submodule.span ℂ {v | ∃ i : Fin m, i.val < j.val ∧ b i = v}

lemma hodgeAdaptedFlag.zero {m : ℕ} (b : Basis (Fin m) ℂ W) :
    hodgeAdaptedFlag b 0 = ⊥ := by
  sorry

lemma hodgeAdaptedFlag.top {m : ℕ} (b : Basis (Fin m) ℂ W) :
    hodgeAdaptedFlag b (Fin.last m) = ⊤ := by
  sorry

lemma hodgeAdaptedFlag.finrank {m : ℕ} (b : Basis (Fin m) ℂ W) (j : Fin (m + 1)) :
    Module.finrank ℂ (hodgeAdaptedFlag b j) = j.val := by
  sorry

-- Native refinement condition is expressible. Missing H.6 simultaneous I-splitting
-- supplies this condition and the sorted labels p; it is not reconstructed here.
-- Standalone prerequisite: H.7/hodge-adapted-flag-refines-filtration.
lemma hodgeAdaptedFlag.filtration {m : ℕ} (b : Basis (Fin m) ℂ W)
    (F : ℤ → Submodule ℂ W) (p : Fin m → ℤ)
    (hF : ∀ a, F a = Submodule.span ℂ {v | ∃ i, a ≤ p i ∧ b i = v})
    (hp : Antitone p) (a : ℤ) (j : Fin (m + 1))
    (hj : j.val = Fintype.card {i : Fin m // a ≤ p i}) :
    hodgeAdaptedFlag b j = F a := by
  sorry

-- hodgeAdaptedFlag_test_line
example (b : Basis (Fin 1) ℂ W) : hodgeAdaptedFlag b 1 = ⊤ := by
  sorry

-- hodgeAdaptedFlag_test_rank_zero
example (b : Basis (Fin 0) ℂ W) (j : Fin 1) : hodgeAdaptedFlag b j = ⊥ := by
  sorry

-- hodgeAdaptedFlag_test_first_vector
example (b : Basis (Fin 2) ℂ W) :
    hodgeAdaptedFlag b 1 = Submodule.span ℂ ({b 0} : Set W) := by
  sorry
end Flags

/-- Underlying range operation; the H.3 rational Hodge-morphism carrier is omitted.
This is not a local definition of that missing carrier. -/
def specialHodgeImage {X : Type u} {Y : Type v} (f : X → Y) : Set Y := Set.range f

lemma specialHodgeImage.mem_iff {X : Type u} {Y : Type v} (f : X → Y) (y : Y) :
    y ∈ specialHodgeImage f ↔ ∃ x, f x = y := by
  sorry

lemma specialHodgeImage.id (Y : Type u) : specialHodgeImage (id : Y → Y) = Set.univ := by
  sorry

lemma specialHodgeImage.comp {X : Type u} {Y : Type v} {Z : Type w}
    (f : X → Y) (g : Y → Z) : specialHodgeImage (g ∘ f) = g '' specialHodgeImage f := by
  sorry

-- specialHodgeImage_test_identity
example (Y : Type u) : specialHodgeImage (id : Y → Y) = Set.univ := by
  sorry

-- specialHodgeImage_test_point: supplied point Hodge datum has underlying Unit.
example {Y : Type u} (y : Y) : specialHodgeImage (fun _ : Unit => y) = {y} := by
  sorry

-- specialHodgeImage_test_empty: only the underlying set operation is tested here.
example {Y : Type u} (f : Empty → Y) : specialHodgeImage f = ∅ := by
  sorry

section TensorLoci
variable {U : Type u} {T : Type v} {W : Type w}
variable [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {k : ℤ}

/-- A real rational tensor can be (0,0) only in weight zero, unless it is zero.
The rational embedding and tensor construction are supplied by H.3. -/
def tensorHodgeLocus (hs : U → HodgeStructureOn W ω k) (r : T → W) (t : T) : Set U :=
  {s | r t ∈ (if k = 0 then (hs s).piece 0 else (⊥ : Submodule ℂ W))}

lemma tensorHodgeLocus.mem_iff (hs : U → HodgeStructureOn W ω k) (r : T → W)
    (t : T) (s : U) :
    s ∈ tensorHodgeLocus hs r t ↔
      r t ∈ (if k = 0 then (hs s).piece 0 else (⊥ : Submodule ℂ W)) := by
  sorry

-- r is a supplied rational scalar-extension map. The native zero-preservation
-- condition is included; no lattice/local-system Prop placeholder is used.
lemma tensorHodgeLocus.zero [Zero T] (hs : U → HodgeStructureOn W ω k)
    (r : T → W) (hr : r 0 = 0) : tensorHodgeLocus hs r 0 = Set.univ := by
  sorry

open Classical in
lemma tensorHodgeLocus.constant (h : HodgeStructureOn W ω k) (r : T → W) (t : T) :
    tensorHodgeLocus (fun _ : U => h) r t =
      if r t ∈ (if k = 0 then h.piece 0 else (⊥ : Submodule ℂ W))
        then Set.univ else ∅ := by
  sorry

lemma tensorHodgeLocus.pullback {U' : Type*} (hs : U → HodgeStructureOn W ω k)
    (r : T → W) (t : T) (g : U' → U) :
    tensorHodgeLocus (hs ∘ g) r t = g ⁻¹' tensorHodgeLocus hs r t := by
  sorry

-- tensorHodgeLocus_test_tate_zero
example : tensorHodgeLocus (fun _ : Unit => tate 0) (fun t : ℚ => (t : ℂ)) 1 =
    Set.univ := by
  sorry

-- tensorHodgeLocus_test_zero
example (hs : U → HodgeStructureOn W ω k) :
    tensorHodgeLocus hs (fun t : W => t) (0 : W) = Set.univ := by
  sorry

-- tensorHodgeLocus_test_untwisted_tate
example : tensorHodgeLocus (fun _ : Unit => tate (-1)) (fun t : ℚ => (t : ℂ)) 1 =
    ∅ := by
  sorry
end TensorLoci

/-- The image of the nongeneric-tensor union. `locus` is the family above,
indexed by the H.3 disjoint union of rational tensor spaces; `generic` is the
actual generic MT-invariant subset. Their missing supplier conditions are
omitted, not replaced by a new generic-group or local-system definition. -/
def exceptionalHodgeLocus {U : Type u} {S : Type v} {T : Type w}
    (π : U → S) (locus : T → Set U) (generic : Set T) : Set S :=
  π '' {u | ∃ t, t ∉ generic ∧ u ∈ locus t}

lemma exceptionalHodgeLocus.mem_iff {U : Type u} {S : Type v} {T : Type w}
    (π : U → S) (locus : T → Set U) (generic : Set T) (s : S) :
    s ∈ exceptionalHodgeLocus π locus generic ↔
      ∃ u t, π u = s ∧ t ∉ generic ∧ u ∈ locus t := by
  sorry

lemma exceptionalHodgeLocus.generic_all {U : Type u} {S : Type v} {T : Type w}
    (π : U → S) (locus : T → Set U) :
    exceptionalHodgeLocus π locus Set.univ = ∅ := by
  sorry

lemma exceptionalHodgeLocus.preimage_eq {U : Type u} {S : Type v} {T : Type w}
    (π : U → S) (locus : T → Set U) (generic : Set T)
    (hsat : ∀ u v, π u = π v →
      ((∃ t, t ∉ generic ∧ u ∈ locus t) ↔ (∃ t, t ∉ generic ∧ v ∈ locus t))) :
    π ⁻¹' exceptionalHodgeLocus π locus generic = {u | ∃ t, t ∉ generic ∧ u ∈ locus t} := by
  sorry

lemma exceptionalHodgeLocus.empty_of_generic {U : Type u} {S : Type v} {T : Type w}
    (π : U → S) (locus : T → Set U) (generic : Set T)
    (h : ∀ t, (locus t).Nonempty → t ∈ generic) :
    exceptionalHodgeLocus π locus generic = ∅ := by
  sorry

-- exceptionalHodgeLocus_test_generic
example {U S T : Type*} (π : U → S) :
    exceptionalHodgeLocus π (fun _ : T => Set.univ) Set.univ = ∅ := by
  sorry

-- exceptionalHodgeLocus_test_constant: H.3 identifies generic invariants of an
-- actual constant Tate or CM variation with precisely the occurring tensors.
example {U S T : Type*} (π : U → S) (locus : T → Set U) (generic : Set T)
    (h : ∀ t, (locus t).Nonempty → t ∈ generic) :
    exceptionalHodgeLocus π locus generic = ∅ := by
  sorry

-- exceptionalHodgeLocus_test_single_gain
example : exceptionalHodgeLocus (id : Fin 2 → Fin 2)
    (fun t : Bool => if t = false then ({0} : Set (Fin 2)) else ∅)
    ({true} : Set Bool) = {0} := by
  sorry

/-! ## Named results, with explicit receiving-data boundaries -/

-- Local coordinate encoding only. LD.6 owns the general graph/atlas theory.
private def coordinateGraph {a b : ℕ} (A : Set (Fin a → ℝ))
    (f : (Fin a → ℝ) → Fin b → ℝ) : Set ((Fin a ⊕ Fin b) → ℝ) :=
  {x | (fun i => x (Sum.inl i)) ∈ A ∧
    ∀ j, x (Sum.inr j) = f (fun i => x (Sum.inl i)) j}

private def complexCoordinates {n : ℕ} (x : (Fin n ⊕ Fin n) → ℝ) : Fin n → ℂ :=
  fun i => ⟨x (Sum.inl i), x (Sum.inr i)⟩

-- H.3 period-domain real chart and H.6 polarized unipotent nilpotent-orbit,
-- polynomial exponential/action, compact analytic buffer and LD.6 R_an,exp
-- structure conditions are omitted. `L` is their receiving real language.
theorem sectorLift_definable {n d : ℕ} (L : FirstOrder.Language) [L.Structure ℝ]
    (R η : ℝ) (hR : 0 ≤ R) (hη : 0 < η)
    (Φ : (Fin n → ℂ) → Fin d → ℝ) :
    (Set.univ : Set ℝ).Definable L
      {x : ((Fin n ⊕ Fin n) ⊕ Fin d) → ℝ |
        complexCoordinates (fun i => x (Sum.inl i)) ∈ boundedSector n R η ∧
        ∀ j, x (Sum.inr j) = Φ (complexCoordinates (fun i => x (Sum.inl i))) j} := by
  sorry

private def initialCrossGram {W : Type*} {m : ℕ} (B : W → W → ℂ)
    (v w : Fin m → W) (j : Fin (m + 1)) : ℂ :=
  Matrix.det (fun a b : Fin j.val =>
    B (v ⟨a.val, lt_of_lt_of_le a.isLt (Nat.le_of_lt_succ j.isLt)⟩)
      (w ⟨b.val, lt_of_lt_of_le b.isLt (Nat.le_of_lt_succ j.isLt)⟩))

private def replaceVector {W : Type*} {m : ℕ} (v : Fin m → W)
    (j : Fin m) (u : W) : Fin m → W := fun i => if i = j then u else v i

section GramFormula
variable {V W : Type*} [AddCommGroup V] [AddCommGroup W] [Module ℂ W]
variable {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {k : ℤ}
-- b receives γ applied to the H.6 adapted basis; p receives its sorted Hodge
-- labels. Their adaptation to the pure filtration is OMITTED, not expressed
-- as an invented Prop carrier. Exterior pairings are represented by native
-- cross-Gram determinants, so both numerator factors have concrete types.
theorem gramDeterminant_formulas {m : ℕ} (hs : HodgeStructure hC k)
    (P : Polarization hC hs) (b : Basis (Fin m) ℂ W) (p : Fin m → ℤ) (u v : W) :
    let B : W → W → ℂ := fun x y => P.Q x (latticeConj hC y)
    (∀ j : Fin (m + 1), initialCrossGram B b b j ≠ 0) ∧
    hodgeFormFunction (fun _ : Unit => P) () u v =
      ∑ j : Fin m,
        Complex.I ^ (2 * p j - k) *
          initialCrossGram B (replaceVector b j u) b
            ⟨j.val + 1, Nat.succ_lt_succ j.isLt⟩ *
          initialCrossGram B b (replaceVector b j v)
            ⟨j.val + 1, Nat.succ_lt_succ j.isLt⟩ /
          (initialCrossGram B b b j.castSucc *
            initialCrossGram B b b ⟨j.val + 1, Nat.succ_lt_succ j.isLt⟩) := by
  sorry
end GramFormula

section RoughForms
variable {n : ℕ} {V W : Type*} [AddCommGroup V] [AddCommGroup W] [Module ℂ W]
variable {ι : V →ₗ[ℤ] W} {hC : IsBaseChange ℂ ι} {k : ℤ}
variable (hs : (Fin n → ℂ) → HodgeStructure hC k)
variable (P : (z : Fin n → ℂ) → Polarization hC (hs z))

-- H.6 nonzero homogeneous splitting and squared-norm asymptotic conditions,
-- and LD.6's precise fraction-algebra/rough-monomial identification, omitted.
-- roughMonomial is the supplied SET of actual real-valued functions; it is
-- not a new placeholder proposition or local definition of that theory.
theorem flatNorm_roughMonomial (roughMonomial : Set ((Fin n → ℂ) → ℝ))
    (u : W) (hu : u ≠ 0) :
    (fun z => (hodgeFormFunction P z u u).re) ∈ roughMonomial := by
  sorry

-- γ receives the H.6 negative-Lie correction. Homogeneity, compact-buffer
-- and uniform deep-height comparison conditions, and the LD.6 membership
-- identification, omitted. These conditions also apply to exterior powers.
theorem movingNorm_roughMonomial (roughMonomial : Set ((Fin n → ℂ) → ℝ))
    (γ : (Fin n → ℂ) → W →ₗ[ℂ] W) (u : W) (hu : u ≠ 0) :
    (fun z => (hodgeFormFunction P z (γ z u) (γ z u)).re) ∈ roughMonomial := by
  sorry

-- LD.6 supplies this SUBRING as its repaired localization g/d, where d is a
-- Laurent polynomial with monomial size; H.6 and H.3 hypotheses are omitted.
-- Arbitrary fraction-field denominators must not instantiate this supplier.
theorem hodgeEntry_roughPolynomial
    (roughPolynomial : Subring ((Fin n → ℂ) → ℂ)) (u v : W) :
    (fun z => hodgeFormFunction P z u v) ∈ roughPolynomial := by
  sorry
end RoughForms

-- b is the Gram matrix in the fixed rational weight-adapted basis. H.3
-- determinant-one faithful representation and H.6 centered-weight estimate
-- conditions are omitted. No integral or fixed-diagonal-order claim is made.
theorem determinantWeight_bound {n m : ℕ}
    (b : (Fin n → ℂ) → Matrix (Fin m) (Fin m) ℝ) (R : ℝ) (hR : 0 ≤ R) :
    ∃ C Y : ℝ, 1 < C ∧ 0 < Y ∧
      ∀ z ∈ orderedSector n R Y, (∏ i, b z i i) < C * Matrix.det (b z) := by
  sorry

-- τ receives a rational positive-slope test curve (after finite cover); b
-- receives the real Hodge matrix. These H.6/LD.6 source conditions, positive
-- definiteness and the fixed rational-basis determinant bound are omitted.
theorem curvewiseReducedness {n m : ℕ}
    (b : (Fin n → ℂ) → Matrix (Fin m) (Fin m) ℝ)
    (τ : ℂ → Fin n → ℂ) (A : Set ℂ) :
    ∃ C : ℝ, 0 < C ∧ ∀ s ∈ A, ∀ i j, |b (τ s) i j| ≤ C * b (τ s) i i := by
  sorry

-- H.6 adapted rational basis and LD.6 wider-strip repaired curve transfer,
-- positive definite real Hodge matrix and polynomial-ring conditions omitted.
-- The three AA.3 reducedness inequalities are displayed rather than replaced
-- by a locally invented Reduced predicate. The permutation is finite data.
theorem uniformReducedness {n m : ℕ}
    (b : (Fin n → ℂ) → Matrix (Fin m) (Fin m) ℝ) (R : ℝ) (hR : 0 ≤ R) :
    ∃ C Y : ℝ, 1 < C ∧ 0 < Y ∧ ∀ z ∈ orderedSector n R Y,
      ∃ σ : Equiv.Perm (Fin m),
        (∀ i j, |b z (σ i) (σ j)| < C * b z (σ i) (σ i)) ∧
        (∀ i j, i < j → b z (σ i) (σ i) < C * b z (σ j) (σ j)) ∧
        (∏ i, b z (σ i) (σ i)) < C * Matrix.det (b z) := by
  sorry

-- D receives the H.3 domain and siegel the AA.3 family for ONE canonical K_t.
-- Integral VHS, faithful derived representation, Cartan compatibility, rational
-- Siegel set and metric inverse-image conditions omitted. J is not finite.
theorem deepSiegelContainment {n : ℕ} {D J : Type*}
    (Φ : (Fin n → ℂ) → D) (siegel : J → Set D) (R : ℝ) (hR : 0 ≤ R) :
    ∃ Y : ℝ, 0 < Y ∧ ∃ F : Finset J, ∀ z ∈ orderedSector n R Y,
      Φ z ∈ ⋃ j ∈ F, siegel j := by
  sorry

-- Same fixed-K supplier as above, PLUS compact parameter and partial-boundary
-- chart transport hypotheses omitted. This is stronger than the deep result;
-- bounded lower heights cannot be handled by compactness in z coordinates.
theorem positiveHeightSiegelCover {n : ℕ} {D J : Type*}
    (Φ : (Fin n → ℂ) → D) (siegel : J → Set D) (R η : ℝ)
    (hR : 0 ≤ R) (hη : 0 < η) :
    ∃ F : Finset J, ∀ z ∈ boundedSector n R η, Φ z ∈ ⋃ j ∈ F, siegel j := by
  sorry

-- U receives one buffered mixed punctured/unpunctured SNC chart in real
-- coordinates. Integral polarized variation, fixed-K tame quotient, finite
-- cover, period map, R_an,exp and atlas conditions omitted (G1/G2/G3/G4).
theorem localPeriod_definable {a b : ℕ} (L : FirstOrder.Language) [L.Structure ℝ]
    (U : Set (Fin a → ℝ)) (Φ : (Fin a → ℝ) → Fin b → ℝ) :
    (Set.univ : Set ℝ).Definable L (coordinateGraph U Φ) := by
  sorry

-- S_i and Φ_i receive each source/target chart restriction of the global map.
-- Smooth quasi-projectivity, the SNC finite cover, polarized integral VHS and
-- canonical fixed-K target/finite-atlas identifications omitted. This local
-- graph signature is applied in EVERY pair of charts of that supplied atlas.
theorem globalPeriod_definable {a b : ℕ} (L : FirstOrder.Language) [L.Structure ℝ]
    (S_i : Set (Fin a → ℝ)) (Φ_i : (Fin a → ℝ) → Fin b → ℝ) :
    (Set.univ : Set ℝ).Definable L (coordinateGraph S_i Φ_i) := by
  sorry

-- f_i receives a compatible pure rational Hodge morphism in canonical real
-- charts; the language here is the requested R_alg language. Those conditions
-- and fixed-K Cartan-compatible quotient functoriality are omitted.
theorem specialImage_definable {a b : ℕ} (L : FirstOrder.Language) [L.Structure ℝ]
    (T_i : Set (Fin a → ℝ)) (f_i : (Fin a → ℝ) → Fin b → ℝ) :
    (Set.univ : Set ℝ).Definable L (f_i '' T_i) := by
  sorry

-- X/Y receive the pure Hodge manifold carriers, f a Hodge morphism. Kernel/
-- image factorization, proper arithmetic immersion and Remmert conditions
-- omitted. The baseline has no general analytic-subset carrier; only CLOSEDNESS
-- is typed here. Analyticity is a conclusion omission, expressly part of G7,
-- and must be added using C0/C4; closedness is not its replacement.
theorem specialImage_closedAnalytic {X Y : Type*} [TopologicalSpace Y] (f : X → Y) :
    IsClosed (specialHodgeImage f) := by
  sorry

-- U receives a complex chart and hs its holomorphic flat-trivialized tensor
-- filtration. Holomorphic bundle, rational embedding and flatness conditions
-- omitted. As above, ANALYTICITY cannot yet be typed and is listed in G7.
theorem localTensorLocus_analytic {U T W : Type*} [TopologicalSpace U]
    [AddCommGroup W] [Module ℂ W] {ω : Conjugation W} {k : ℤ}
    (hs : U → HodgeStructureOn W ω k) (r : T → W) (t : T) :
    IsClosed (tensorHodgeLocus hs r t) := by
  sorry

-- π, locus, generic receive the universal-cover tensor data above. Φ receives
-- the genuine period map, special the H.3 strict-subdatum family. Generic MT,
-- tensor/subdatum correspondence and lift/level hypotheses omitted. Identity
-- images are excluded by the SUPPLIER, not by an arbitrary Prop flag here.
theorem exceptionalSpecial_preimage {U S T D J : Type*}
    (π : U → S) (locus : T → Set U) (generic : Set T)
    (Φ : S → D) (special : J → Set D) :
    exceptionalHodgeLocus π locus generic = ⋃ j, Φ ⁻¹' special j := by
  sorry

-- family receives precisely the relevant rational strict special images.
-- Rational finite-dimensional tensor enumeration and subdatum/level hypotheses
-- omitted. The conclusion is countability of SUBSETS, not definable indexing.
theorem rationalSpecial_countability {D : Type*} (family : Set (Set D)) :
    family.Countable := by
  sorry

-- S receives the algebraic Zariski space underlying the smooth quasi-projective
-- complex variety, and W the complex-point subset of a special pullback. Its
-- native analytic/algebraic comparison carrier is missing. Period definability,
-- analyticity, LD.6 definable Chow and complex-point/Zariski comparison omitted.
-- Only ZARISKI CLOSEDNESS is typed; reduced algebraic structure/comparison and
-- analytic hypotheses must be added using the supplied carriers (gap G7).
theorem specialPullback_algebraic {S : Type*} [TopologicalSpace S] (W : Set S) :
    IsClosed W := by
  sorry

-- S receives the variety's Zariski space. Its complex-point/scheme comparison,
-- polarized integral variation, generic datum and strict-special indexing are
-- omitted. IsClosed BELOW MEANS ZARISKI CLOSED, never ordinary real closedness.
-- Reduced algebraic subvariety structures are a conclusion omission (G7).
-- Indexing by a COUNTABLE TYPE allows an empty family when the locus is empty.
theorem hodgeLocus_algebraicity {S : Type*} [TopologicalSpace S] (HL : Set S) :
    ∃ (I : Type) (_ : Countable I) (Z : I → Set S),
      (∀ i, IsClosed (Z i) ∧ IsIrreducible (Z i) ∧ Z i ≠ Set.univ) ∧ HL = ⋃ i, Z i := by
  sorry

-- Compact arithmetic target, neat congruence level, H.6 quasi-unipotence and
-- finite-monodromy extension, SNC compactification and canonical R_an atlas
-- conditions omitted. L receives R_an rather than R_an,exp. This applies to
-- every pair of charts of the global period map after finite-cover descent.
theorem compactTargetPeriod_definable {a b : ℕ} (L : FirstOrder.Language)
    [L.Structure ℝ] (S_i : Set (Fin a → ℝ))
    (Φ_i : (Fin a → ℝ) → Fin b → ℝ) :
    (Set.univ : Set ℝ).Definable L (coordinateGraph S_i Φ_i) := by
  sorry

end TauCeti.Hodge.Tame

end
end Layer8

/-! ## H.8 -/

section Layer9

/-! ### H.8: signature boundary

The fibre Hodge structures, conjugation, tensor product, kernels and lattice
rounding are the pinned library objects. RealActionOnChart adds real-action data
to the fibre outputs of an imported marked chart. It does not define a global
variation, connection, holomorphic bundle or geometric cohomology theory.

All proofs are placeholders. The final ledger identifies global signatures
which cannot be expressed before the common suppliers exist. The fibre Hodge
structures are arbitrary weight-two ones; the specification's variations are effective
(`HodgeStructureOn.IsEffective`), which no statement below needs. No unspecified
geometric hypothesis is encoded as a Prop-valued field. The algebraic and
analytic statements here are explicit local parts, not substitutes for the
omitted geometric theorems.
-/

noncomputable section
open scoped TensorProduct Topology Classical
open Module

namespace TauCeti.Hodge.RealNL

universe u v w z

section Chart
variable {B : Type u} {V : Type v} [AddCommGroup V] [Module ℝ V]

abbrev Complexification (V : Type v) [AddCommGroup V] [Module ℝ V] := ℂ ⊗[ℝ] V
abbrev coefficientConjugation := complexificationConjugation V

/-- The supplied flat chart's geometric real action. The Hodge structures and
the base involution are input, not a new variation carrier. -/
structure RealActionOnChart (c : B → B)
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    where
  sigma : V ≃ₗ[ℝ] V
  sigma_involutive : Function.Involutive sigma
  base_involutive : Function.Involutive c
  geometric_piece : ∀ b p,
    ((H b).piece p).map (sigma.toLinearMap.baseChange ℂ) = (H (c b)).piece (2 - p)

namespace RealActionOnChart
variable {c : B → B}
variable {H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2}

def geometric (A : RealActionOnChart c H) : Complexification V →ₗ[ℂ] Complexification V :=
  A.sigma.toLinearMap.baseChange ℂ

def combined (A : RealActionOnChart c H) :
    Complexification V →ₛₗ[starRingEnd ℂ] Complexification V :=
  A.geometric.comp (complexificationConjugation V).toEquiv.toLinearMap

theorem geometric_tmul (A : RealActionOnChart c H) (a : ℂ) (v : V) :
    A.geometric (a ⊗ₜ[ℝ] v) = a ⊗ₜ[ℝ] A.sigma v := by
  sorry

theorem combined_tmul (A : RealActionOnChart c H) (a : ℂ) (v : V) :
    A.combined (a ⊗ₜ[ℝ] v) = (starRingEnd ℂ) a ⊗ₜ[ℝ] A.sigma v := by
  sorry

theorem combined_involutive (A : RealActionOnChart c H) :
    Function.Involutive A.combined := by
  sorry

/-- H.8/combined-type; coefficient and geometric conjugations exchange twice. -/
theorem combined_mem_piece (A : RealActionOnChart c H) (b : B) (p : ℤ)
    (x : Complexification V) (hx : x ∈ (H b).piece p) :
    A.combined x ∈ (H (c b)).piece p := by
  sorry

theorem ext (A A' : RealActionOnChart c H) (h : A.sigma = A'.sigma) : A = A' := by
  sorry

-- real_action_geometric_tensor
example (A : RealActionOnChart c H) (v : V) :
    A.geometric (Complex.I ⊗ₜ[ℝ] v) = Complex.I ⊗ₜ[ℝ] A.sigma v := by
  sorry

-- real_action_combined_tensor
example (A : RealActionOnChart c H) (v : V) :
    A.combined (Complex.I ⊗ₜ[ℝ] v) = (-Complex.I) ⊗ₜ[ℝ] A.sigma v := by
  sorry

-- real_action_zero
example [Subsingleton V] (A : RealActionOnChart c H) (x : Complexification V) :
    A.geometric x = x ∧ A.combined x = x := by
  sorry

-- real_action_combined_square
example (A : RealActionOnChart c H) (x : Complexification V) :
    A.combined (A.combined x) = x := by
  sorry

-- real_action_identity_real_point: the identity is a real structure only in type (1,1)
example (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (A : RealActionOnChart (id : B → B) H) (h : A.sigma = LinearEquiv.refl ℝ V) (b : B) :
    (H b).piece 2 = ⊥ := by
  sorry
end RealActionOnChart

/-- Coordinates for the fixed part after tensoring with the real Tate sign. -/
def twistedInvariants (sigma : V →ₗ[ℝ] V) : Submodule ℝ V :=
  LinearMap.ker (sigma + LinearMap.id)

/-- H.8/twist-sign, also the characterisation API of twistedInvariants. -/
theorem mem_twistedInvariants (sigma : V →ₗ[ℝ] V) (v : V) :
    v ∈ twistedInvariants sigma ↔ sigma v = -v := by
  sorry

theorem twistedInvariants_id : twistedInvariants (LinearMap.id : V →ₗ[ℝ] V) = ⊥ := by
  sorry

theorem twistedInvariants_neg_id :
    twistedInvariants (-LinearMap.id : V →ₗ[ℝ] V) = ⊤ := by
  sorry

theorem twistedInvariants_map {V' : Type w} [AddCommGroup V'] [Module ℝ V']
    (sigma : V →ₗ[ℝ] V) (sigma' : V' →ₗ[ℝ] V') (f : V →ₗ[ℝ] V')
    (h : f.comp sigma = sigma'.comp f) :
    (twistedInvariants sigma).map f ≤ twistedInvariants sigma' := by
  sorry

def swapPlane : (Fin 2 → ℝ) →ₗ[ℝ] (Fin 2 → ℝ) where
  toFun x := ![x 1, x 0]
  map_add' := by sorry
  map_smul' := by sorry

theorem twistedInvariants_swap (x : Fin 2 → ℝ) :
    x ∈ twistedInvariants swapPlane ↔ x 1 = -x 0 := by
  sorry

-- twisted_identity_line
example : (1 : ℝ) ∉ twistedInvariants (LinearMap.id : ℝ →ₗ[ℝ] ℝ) := by
  sorry

-- twisted_negative_line
example (x : ℝ) : x ∈ twistedInvariants (-LinearMap.id : ℝ →ₗ[ℝ] ℝ) := by
  sorry

-- twisted_swap_plane
example (x : Fin 2 → ℝ) :
    x ∈ twistedInvariants swapPlane ↔ x 1 = -x 0 := by
  sorry

-- twisted_zero_space
example : twistedInvariants (LinearMap.id : (Fin 0 → ℝ) →ₗ[ℝ] (Fin 0 → ℝ)) = ⊤ := by
  sorry

/-- The class and fibre structures are outputs of one supplied flat marking. -/
def transportedHodgeLocus
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) : Set B := {b | (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).piece 1}

theorem mem_transportedHodgeLocus
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus H lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).piece 1 := by
  sorry

theorem transportedHodgeLocus_zero
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2) :
    transportedHodgeLocus H 0 = Set.univ := by
  sorry

theorem transportedHodgeLocus_constant
    (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) :
    transportedHodgeLocus (fun _ : B => H) lambda =
      if (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ H.piece 1 then Set.univ else ∅ := by
  sorry

theorem transportedHodgeLocus_changeMarking
    {V' : Type w} [AddCommGroup V'] [Module ℝ V']
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (H' : B → HodgeStructureOn (Complexification V') (complexificationConjugation V') 2)
    (e : V ≃ₗ[ℝ] V')
    (he : ∀ b, ((H b).piece 1).map (e.toLinearMap.baseChange ℂ) = (H' b).piece 1)
    (lambda : V) :
    transportedHodgeLocus H lambda = transportedHodgeLocus H' (e lambda) := by
  sorry

theorem transportedHodgeLocus_F_one
    (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus H lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ (H b).F 1 := by
  sorry

-- transported_zero
example (H : B → HodgeStructureOn (Complexification V) (complexificationConjugation V) 2) :
    transportedHodgeLocus H 0 = Set.univ := by
  sorry

-- transported_constant_inside
example (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (h : (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ H.piece 1) :
    transportedHodgeLocus (fun _ : B => H) lambda = Set.univ := by
  sorry

-- transported_constant_outside
example (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (h : (1 : ℂ) ⊗ₜ[ℝ] lambda ∉ H.piece 1) :
    transportedHodgeLocus (fun _ : B => H) lambda = ∅ := by
  sorry

-- transported_F_one: one arbitrary weight-two fibre, as a constant family
example (H : HodgeStructureOn (Complexification V) (complexificationConjugation V) 2)
    (lambda : V) (b : B) :
    b ∈ transportedHodgeLocus (fun _ : B => H) lambda ↔ (1 : ℂ) ⊗ₜ[ℝ] lambda ∈ H.F 1 := by
  sorry
end Chart

section Contraction
variable {T : Type u} {D : Type v} {J : Type w} {Q : Type z}
variable [AddCommGroup T] [Module ℂ T] [AddCommGroup D] [Module ℂ D]
variable [AddCommGroup J] [Module ℂ J] [AddCommGroup Q] [Module ℂ Q]

/-- The supplied geometric KS and coherent cup maps determine the contraction.
This construction alone does not identify an arbitrary input map with KS. -/
def contractedKS (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (lambda : J) : T →ₗ[ℂ] Q where
  toFun v := cup (KS v) lambda
  map_add' := by sorry
  map_smul' := by sorry

theorem contractedKS_apply (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (lambda : J) (v : T) : contractedKS KS cup lambda v = cup (KS v) lambda := by
  sorry

theorem contractedKS_zero_class (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q)) :
    contractedKS KS cup 0 = 0 := by
  sorry

theorem contractedKS_add_class (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (lambda mu : J) :
    contractedKS KS cup (lambda + mu) = contractedKS KS cup lambda + contractedKS KS cup mu := by
  sorry

theorem contractedKS_smul_class (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q))
    (a : ℂ) (lambda : J) :
    contractedKS KS cup (a • lambda) = a • contractedKS KS cup lambda := by
  sorry

theorem contractedKS_precomp {T' : Type*} [AddCommGroup T'] [Module ℂ T']
    (KS : T →ₗ[ℂ] D) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q)) (lambda : J) (f : T' →ₗ[ℂ] T) :
    contractedKS (KS.comp f) cup lambda = (contractedKS KS cup lambda).comp f := by
  sorry

-- contractedKS_scalar_fixture
example : contractedKS (LinearMap.id : ℂ →ₗ[ℂ] ℂ) (LinearMap.mul ℂ ℂ) 3 2 = 6 := by
  sorry

-- contractedKS_zero_fixture
example (lambda : J) (cup : D →ₗ[ℂ] (J →ₗ[ℂ] Q)) :
    contractedKS (0 : T →ₗ[ℂ] D) cup lambda = 0 := by
  sorry

-- contractedKS_precomp_fixture
example : contractedKS ((2 : ℂ) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ))
    (LinearMap.mul ℂ ℂ) 3 1 = 6 := by
  sorry

-- contractedKS_zero_class_fixture
example : ¬Function.Surjective
    (contractedKS (LinearMap.id : ℂ →ₗ[ℂ] ℂ) (LinearMap.mul ℂ ℂ) 0) := by
  sorry
end Contraction

section Cone
variable (V : Type u) [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- Positive scaling is required; convexity and exclusion of zero are not. -/
structure PositiveOpenCone where
  carrier : Set V
  isOpen : IsOpen carrier
  nonempty : carrier.Nonempty
  smul_mem : ∀ (a : ℝ), 0 < a → ∀ v ∈ carrier, a • v ∈ carrier

namespace PositiveOpenCone
variable {V}

theorem smul_iff (O : PositiveOpenCone V) (a : ℝ) (ha : 0 < a) (v : V) :
    a • v ∈ O.carrier ↔ v ∈ O.carrier := by
  sorry

def transport {W : Type v} [NormedAddCommGroup W] [NormedSpace ℝ W]
    (e : V ≃L[ℝ] W) (O : PositiveOpenCone V) : PositiveOpenCone W where
  carrier := e '' O.carrier
  isOpen := by sorry
  nonempty := by sorry
  smul_mem := by sorry

def positiveRay : PositiveOpenCone ℝ where
  carrier := Set.Ioi 0
  isOpen := by sorry
  nonempty := by sorry
  smul_mem := by sorry

def whole (V : Type u) [NormedAddCommGroup V] [NormedSpace ℝ V] : PositiveOpenCone V where
  carrier := Set.univ
  isOpen := by sorry
  nonempty := by sorry
  smul_mem := by sorry

/-- An open nonempty Mathlib convex cone is a positive open cone. The converse
fails: a positive open cone need not be closed under addition. -/
def ofConvexCone (C : ConvexCone ℝ V) (hopen : IsOpen (C : Set V))
    (hne : (C : Set V).Nonempty) : PositiveOpenCone V where
  carrier := C
  isOpen := hopen
  nonempty := hne
  smul_mem := by sorry

-- cone_positive_ray
example : (1 : ℝ) ∈ positiveRay.carrier ∧ (0 : ℝ) ∉ positiveRay.carrier := by
  sorry

-- cone_punctured_line: a positive open cone that is not closed under addition
example : ∃ O : PositiveOpenCone ℝ, O.carrier = {x : ℝ | x ≠ 0} ∧
    ¬ ∀ x ∈ O.carrier, ∀ y ∈ O.carrier, x + y ∈ O.carrier := by
  sorry

-- cone_zero_dimension
example : (0 : Fin 0 → ℝ) ∈ (whole (Fin 0 → ℝ)).carrier := by
  sorry

-- cone_annulus_failure
example : ¬(∀ a : ℝ, 0 < a → ∀ x ∈ Set.Ioo (1 : ℝ) 2, a • x ∈ Set.Ioo (1 : ℝ) 2) := by
  sorry

-- cone_scaling_inverse
example (O : PositiveOpenCone V) (a : ℝ) (ha : 0 < a) (v : V) :
    a • v ∈ O.carrier ↔ v ∈ O.carrier := by
  sorry
end PositiveOpenCone

/-- Basis form of the full-lattice-coset theorem, including dimension zero. -/
theorem fullLatticeCosetMeetsCone {ι : Type v} [Fintype ι] (b : Basis ι ℝ V)
    (O : PositiveOpenCone V) (n : ℕ) (hn : 0 < n) (a : V) :
    ∃ z : Submodule.span ℤ (Set.range b), a + (n : ℝ) • (z : V) ∈ O.carrier := by
  sorry

-- Rank-one acceptance: every congruence class has a positive representative.
example (n : ℕ) (hn : 0 < n) (a : ℝ) : ∃ z : ℤ, 0 < a + (n : ℝ) * z := by
  sorry
end Cone

section GoodLocus
variable {B : Type u} {V : Type v} {T : Type w} {Q : Type z}
variable [AddCommGroup V] [Module ℝ V] [AddCommGroup T] [Module ℂ T]
variable [AddCommGroup Q] [Module ℂ Q]

/-- J and A are the actual twisted real Hodge subspaces and period-symbol maps
exported by a chart. This definition adds no analytic or geometric assertion. -/
def goodRealLocus (J : B → Submodule ℝ V)
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) : Set B :=
  {b | ∃ lambda ∈ J b, Function.Surjective (A b lambda)}

theorem mem_goodRealLocus (J : B → Submodule ℝ V)
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) (b : B) :
    b ∈ goodRealLocus J A ↔ ∃ lambda ∈ J b, Function.Surjective (A b lambda) := by
  sorry

theorem goodRealLocus_zero_target [Subsingleton Q] (J : B → Submodule ℝ V)
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) : goodRealLocus J A = Set.univ := by
  sorry

theorem goodRealLocus_zero_symbol (J : B → Submodule ℝ V) :
    goodRealLocus J (fun _ => 0 : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) =
      if Subsingleton Q then Set.univ else ∅ := by
  sorry

theorem goodRealLocus_baseChange
    {V' T' Q' : Type*} [AddCommGroup V'] [Module ℝ V']
    [AddCommGroup T'] [Module ℂ T'] [AddCommGroup Q'] [Module ℂ Q']
    (J : B → Submodule ℝ V) (J' : B → Submodule ℝ V')
    (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) (A' : B → V' →ₗ[ℝ] (T' →ₗ[ℂ] Q'))
    (e : V ≃ₗ[ℝ] V') (f : T ≃ₗ[ℂ] T') (g : Q ≃ₗ[ℂ] Q')
    (hJ : ∀ b, (J b).map e.toLinearMap = J' b)
    (hA : ∀ b v t, A' b (e v) (f t) = g (A b v t)) :
    goodRealLocus J A = goodRealLocus J' A' := by
  sorry

def scalarSymbol : ℂ →ₗ[ℝ] (ℂ →ₗ[ℂ] ℂ) :=
  (LinearMap.mul ℂ ℂ).restrictScalars ℝ

-- good_scalar_symbol
example : (PUnit.unit : PUnit) ∈
    goodRealLocus (fun _ : PUnit => (⊤ : Submodule ℝ ℂ)) (fun _ => scalarSymbol) := by
  sorry

-- good_zero_target
example (J : B → Submodule ℝ V) (A : B → V →ₗ[ℝ] (T →ₗ[ℂ] (Fin 0 → ℂ))) :
    goodRealLocus J A = Set.univ := by
  sorry

-- good_zero_class_space
example : goodRealLocus (fun _ : PUnit => (⊥ : Submodule ℝ ℂ))
    (fun _ => scalarSymbol) = ∅ := by
  sorry

-- good_constant_zero_symbol
example [Nontrivial Q] (J : B → Submodule ℝ V) :
    goodRealLocus J (fun _ => 0 : B → V →ₗ[ℝ] (T →ₗ[ℂ] Q)) = ∅ := by
  sorry
end GoodLocus

section LocalTheorems
variable {E : Type u} {F : Type v} [AddCommGroup E] [Module ℝ E]
variable [AddCommGroup F] [Module ℝ F]

theorem fixedLinearSurjective (s : E →ₗ[ℝ] E) (t : F →ₗ[ℝ] F)
    (hs : Function.Involutive s) (ht : Function.Involutive t)
    (L : E →ₗ[ℝ] F) (he : L.comp s = t.comp L) (hL : Function.Surjective L) :
    ∀ y : F, t y = y → ∃ x : E, s x = x ∧ L x = y := by
  sorry

/-- Linear part of the normal-vanishing criterion. Its geometric identifications
and deduction of the three onto hypotheses from sheaf vanishings are in G2. -/
theorem normalComposite_surjective {K : Type w} {Q : Type z}
    [AddCommGroup K] [Module ℝ K] [AddCommGroup Q] [Module ℝ Q]
    (r : E →ₗ[ℝ] F) (delta : F →ₗ[ℝ] K) (boundary : K →ₗ[ℝ] Q)
    (hr : Function.Surjective r) (hd : Function.Surjective delta)
    (hb : Function.Surjective boundary) :
    Function.Surjective (boundary.comp (delta.comp r)) := by
  sorry

theorem vanishingRankCriterion {T C K : Type*}
    [AddCommGroup T] [Module ℂ T] [AddCommGroup C] [Module ℂ C]
    [AddCommGroup K] [Module ℂ K] [FiniteDimensional ℂ C] [FiniteDimensional ℂ K]
    (f : T →ₗ[ℂ] (C × K)) (hC : ∀ v, (f v).1 = 0)
    (hcodim : Module.finrank ℂ (C × K) - Module.finrank ℂ (LinearMap.range f) ≤
      Module.finrank ℂ C) : Function.Surjective (fun v => (f v).2) := by
  sorry

/-- Fibre form of H.8/orthogonal-constant-splitting: nondegeneracy on the
constant summand alone gives the complement; no positivity is used. This is
Mathlib's `LinearMap.BilinForm.isCompl_orthogonal_of_restrict_nondegenerate`,
recorded here for the rational fibre. Flatness and the Hodge property of the
complement are in G1. -/
theorem constantSummand_isCompl_orthogonal {W : Type*} [AddCommGroup W] [Module ℚ W]
    [FiniteDimensional ℚ W] (Q : LinearMap.BilinForm ℚ W) (hQ : Q.IsSymm)
    (C : Submodule ℚ W) (hC : (Q.restrict C).Nondegenerate) :
    IsCompl C (Q.orthogonal C) := by
  sorry

end LocalTheorems

section GraphDerivative
variable {E J Q : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
variable [NormedAddCommGroup J] [NormedSpace ℂ J]
variable [NormedAddCommGroup Q] [NormedSpace ℂ Q]

/-- In a graph frame the flat-class obstruction has the negative symbol sign. -/
theorem flatClassObstruction_derivative (A : E → (J →L[ℂ] Q))
    (DA : E →L[ℂ] (J →L[ℂ] Q)) (b : E) (lambda : J)
    (hA : HasFDerivAt A DA b) :
    HasFDerivAt (fun x => -(A x lambda))
      (-(ContinuousLinearMap.apply ℂ Q lambda).comp DA) b := by
  sorry
end GraphDerivative

section AnalyticParts
variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
variable [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]

/-- Concrete local analytic input to Green's evaluation theorem. It is Mathlib's
`HasStrictFDerivAt.map_nhds_eq_of_surj` unpacked on a metric ball; no
complemented kernel is needed. -/
theorem image_contains_ball_of_surjective_derivative
    (f : E → F) (L : E →L[ℝ] F) (a : E) (U : Set E)
    (hf : HasStrictFDerivAt f L a) (hL : L.range = ⊤) (hU : U ∈ nhds a) :
    ∃ epsilon : ℝ, 0 < epsilon ∧ Metric.ball (f a) epsilon ⊆ f '' U := by
  sorry

/-- Scaling saturation plus the local image neighbourhood gives an open cone;
the geometric real evaluation must supply these explicit analytic hypotheses. -/
theorem openCone_of_submersion
    (f : E → F) (L : E →L[ℝ] F) (a : E) (U : Set E)
    (hf : HasStrictFDerivAt f L a) (hL : L.range = ⊤) (hU : U ∈ nhds a)
    (hscale : ∀ r : ℝ, 0 < r → ∀ y ∈ f '' U, r • y ∈ f '' U) :
    ∃ O : PositiveOpenCone F, f a ∈ O.carrier ∧ O.carrier ⊆ f '' U := by
  sorry

/-- Finite analytic coefficient engine for the componentwise density proof.
This is not an identification of the coefficients of a geometric Hodge bundle. -/
theorem analyticCoefficientLocus_dense {ι : Type*} [Fintype ι]
    (U : Set E) (hU : IsOpen U) (hconn : IsPreconnected U)
    (coeff : ι → E → ℝ) (ha : ∀ i, AnalyticOnNhd ℝ (coeff i) U)
    (hgood : ∃ b ∈ U, ∃ i, coeff i b ≠ 0) :
    U ⊆ closure {b | b ∈ U ∧ ∃ i, coeff i b ≠ 0} := by
  sorry
end AnalyticParts

/- Global signature omission ledger. All corresponding mathematical targets
remain fully stated in the specification and reader. No global theorem is replaced by
an arbitrary family of vector spaces with an assumed conclusion.

G1: geometricRealVariation; griffithsDerivative; greenEvaluationSubmersion;
constantVanishingSplitting; constantSymbolZero; vanishingRealGreen;
voisinInfinitesimalKernel; voisinKernelCone; voisinProductSurface;
transportedDivisorExport. These need ShimuraData:D3/variation, the H.2 relative
geometric variation and Gauss--Manin, H.3 symbol, and relative geometric Hodge
comparison, with exact common-carrier signatures.

G2: normalBoundaryFactorization and normalVanishingSurjectivity, plus the
geometric KS/Griffiths and Voisin inputs. SF.2/SF.4/SF.5 must provide actual
coherent cohomology, normal/divisor/Atiyah extensions and their natural maps.
normalComposite_surjective states only their elementary linear composition.

G3: realGreenOpenCone and realGoodLocusDensity need smooth real fixed-locus
charts, their tangent identifications and real-analytic Hodge frames.
affineCWBound, affineIntegralVanishing, ordinaryIntegralWeakLefschetzH3 and
ordinaryIntegralWeakLefschetzH2 need the manifold-level form of Tau Ceti's Morse
declarations (`TauCeti.IsNondegenerateCriticalPoint`, `TauCeti.morseIndex`, in
TauCeti/Analysis/Calculus/Morse) from the upstream Heegaard Floer Morse lane, the
proper-Morse-function handle/CW theorem of the proposed Geometric topology
Part II, and upstream AlgebraicTopology cellular/duality/Gysin adapters.
image_contains_ball_of_surjective_derivative, openCone_of_submersion and
analyticCoefficientLocus_dense are their explicit local analytic inputs.

G4: the Voisin statements need the exact general nodal, Grassmannian/Bott,
uniform-position, Macaulay multiplication and Jacobian/residue suppliers; no
record containing a theorem-valued field is introduced to hide that gap.

G5: transportedDivisorExport needs the real Lefschetz (1,1) theorem
(Benoist--Wittenberg, Proposition 2.8) as an entry of the MC.7 register, and a
genuine consumer-supplied equivariant integral lift. Twisted
invariant ordinary cohomology alone does not type this missing hypothesis.
-/
end TauCeti.Hodge.RealNL

end
end Layer9
