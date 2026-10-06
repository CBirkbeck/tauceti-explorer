import Mathlib.Algebra.Star.Basic
import Mathlib.Algebra.Group.End
import Mathlib.LinearAlgebra.Trace
import Mathlib.Algebra.Module.LinearMap.Polynomial
import Mathlib.LinearAlgebra.BilinearForm.DualLattice
import Mathlib.LinearAlgebra.BilinearForm.TensorProduct
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.LinearAlgebra.SymplecticGroup
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.LinearAlgebra.Charpoly.BaseChange
import Mathlib.RingTheory.SimpleModule.WedderburnArtin
import Mathlib.RingTheory.Discriminant
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.EllipticCurve.ModelsWithJ
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.CategoryTheory.FiberedCategory.Fibered
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.NonabelianCohomology.H1
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.CategoryTheory.SingleObj
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.Algebra.Polynomial.Derivative

/-!
# Siegel and PEL moduli problems: suggested Lean signatures

Job BP-PELModuli; Claude, claude-Q3pbuh.
Mathlib baseline: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti baseline: f790474821cf4256814db967cb154e7af3d0c369 (no Tau Ceti module is imported).
Elaborated with `lake env lean` at the pinned Mathlib; `sorry` is the only warning.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PELModuli.md` is definitive. The statements suggest Lean forms so
that contributors and reviewers converge on names and signatures. They are unproved interfaces,
not implementation claims.

Conventions: `ℤ(1)` is identified with `ℤ` by a choice of `√−1`; `V₀ = V^{−1,0}` is the
subspace where `h(z)` acts by `z`; level structures carry their multiplier; Hecke translations
act on the right. Carriers that the pinned libraries lack (abelian schemes over a base, their
duals and polarizations, Tate modules, algebraic spaces and stacks) are represented by explicit
data structures (`AbelianScheme`, `AbelianSchemeSupplier`, `TorsionSupplier`, and `sorry`-valued
data such as `PELModuli.representingChart`); conditions they cannot yet express are left out and
named in their docstrings, never replaced by arbitrary proposition fields. Only Mathlib modules
are imported: the Tau Ceti declarations the packet cites (`TauCeti.SymplecticForm.Compatible`,
`TauCeti.Hodge.IsPolarization`, `TauCeti.ConstantForm.groupScheme`, `TauCeti.Symplectic.groupScheme`,
`TauCeti.AlgebraicGeometry.AbelianVariety`, `WeierstrassCurve.j_quadraticTwist`, …) are named in
docstrings where they are the intended carriers.
-/

noncomputable section
open scoped TensorProduct Matrix
open CategoryTheory AlgebraicGeometry

namespace TauCeti.PEL

/-! ## M0. Linear algebra and reflex field -/

section M0
open scoped TensorProduct

/-- The trace of left multiplication on a ℚ-algebra. -/
noncomputable def lmulTrace (B : Type*) [Ring B] [Algebra ℚ B] (x : B) : ℚ :=
  LinearMap.trace ℚ B (LinearMap.mulLeft ℚ x)

/-- The reduced trace `Trd_{B/ℚ}`: the sum over simple factors of the field trace of the reduced
trace, constructed from Wedderburn–Artin. -/
noncomputable def reducedTrace (B : Type*) [Ring B] [Algebra ℚ B] : B →ₗ[ℚ] ℚ := sorry

/-- A positive involution: `Trd(x x*) > 0` for `x ≠ 0` (Lan §1.2.1). -/
structure PositiveInvolution (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] [StarModule ℚ B] :
    Prop where
  trd_pos : ∀ x : B, x ≠ 0 → 0 < reducedTrace B (x * star x)

namespace PositiveInvolution
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] [StarModule ℚ B]

theorem trd_mul_star_pos (h : PositiveInvolution B) {x : B} (hx : x ≠ 0) :
    0 < reducedTrace B (x * star x) := h.trd_pos x hx

theorem iff_trace_pos [FiniteDimensional ℚ B] :
    PositiveInvolution B ↔ ∀ x : B, x ≠ 0 → 0 < lmulTrace B (x * star x) := sorry

theorem iff_real [FiniteDimensional ℚ B] :
    PositiveInvolution B ↔ ∀ x : ℝ ⊗[ℚ] B, x ≠ 0 →
      0 < LinearMap.trace ℝ (ℝ ⊗[ℚ] B) (LinearMap.mulLeft ℝ (x * star x)) := sorry

theorem center_stable (_h : PositiveInvolution B) {z : B} (hz : z ∈ Subring.center B) :
    star z ∈ Subring.center B := sorry

theorem ofStarRing (_h : PositiveInvolution B) (q : ℚ) (x : B) : star (q • x) = q • star x :=
  star_smul q x

end PositiveInvolution

/-- A `*`-stable ℤ-order in `B`. -/
structure StarOrder (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] where
  carrier : Subring B
  fg : (Submodule.span ℤ (carrier : Set B)).FG
  spans : Submodule.span ℚ (carrier : Set B) = ⊤
  star_mem : ∀ x ∈ carrier, star x ∈ carrier

-- TauCeti.PEL.tests.positiveInvolution_rat
example : PositiveInvolution ℚ := sorry
-- TauCeti.PEL.tests.positiveInvolution_transpose
example (n : ℕ) : PositiveInvolution (Matrix (Fin n) (Fin n) ℚ) := sorry
-- TauCeti.PEL.tests.not_positiveInvolution_adjugate
example : ¬ ∀ x : Matrix (Fin 2) (Fin 2) ℚ, x ≠ 0 →
    0 < lmulTrace (Matrix (Fin 2) (Fin 2) ℚ) (x * x.adjugate) := sorry
-- TauCeti.PEL.tests.not_positiveInvolution_id_imaginary
example : ¬ ∀ x : AdjoinRoot (Polynomial.X ^ 2 + 1 : Polynomial ℚ), x ≠ 0 →
    0 < lmulTrace (AdjoinRoot (Polynomial.X ^ 2 + 1 : Polynomial ℚ)) (x * x) := sorry

/-- Albert types of simple factors with positive involution (`M0/albert-types`). -/
inductive AlbertType | A | C | D
  deriving DecidableEq

/-- `I_bad = 2` iff a type D factor occurs (Lan Definition 1.2.1.17). -/
def iBad (types : Finset AlbertType) : ℕ := if AlbertType.D ∈ types then 2 else 1

/-- Every simple factor of a semisimple algebra with positive involution has exactly one type. -/
theorem albertTypes (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] [StarModule ℚ B]
    [FiniteDimensional ℚ B] [IsSemisimpleRing B] (_h : PositiveInvolution B) :
    ∃ (n : ℕ) (type : Fin n → AlbertType) (D : Fin n → Type) (d : Fin n → ℕ)
      (_ : ∀ i, DivisionRing (D i)) (_ : ∀ i, Algebra ℚ (D i)),
      Nonempty (B ≃ₐ[ℚ] Π i, Matrix (Fin (d i)) (Fin (d i)) (D i)) := sorry

/-! ### Orders and discriminants -/

/-- The discriminant of a ℤ-order with a basis, computed with the reduced trace form. -/
noncomputable def Order.disc {B : Type*} [Ring B] [Algebra ℚ B] {ι : Type*} [Fintype ι]
    [DecidableEq ι] (b : ι → B) : ℚ :=
  (Matrix.of fun i j => reducedTrace B (b i * b j)).det

namespace Order
variable {B : Type*} [Ring B] [Algebra ℚ B] {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem disc_eq_det_basis (b : ι → B) :
    disc b = (Matrix.of fun i j => reducedTrace B (b i * b j)).det := rfl

theorem disc_eq_index_diffInv (b : ι → B) (_hb : LinearIndependent ℚ b) :
    ∃ m : ℕ, |disc b| = m := sorry

/-- If `p ∤ Disc(O)`, every order `O' ⊇ O` has index prime to `p` in it (`O ⊗ ℤ_(p)` is maximal). -/
theorem isMaximalAt_of_not_dvd_disc (O O' : Subring B) (b : ι → B) (_hb : ∀ i, b i ∈ O)
    (p : ℕ) [Fact p.Prime] (_hp : (disc b).num.natAbs % p ≠ 0) (_hle : O ≤ O') :
    O.toAddSubgroup.relIndex O'.toAddSubgroup % p ≠ 0 := sorry

/-- If `p ∤ Disc(O)`, then `ℚ_p ⊗ B` is a product of matrix algebras over fields (unramified
extensions of `ℚ_p`; unramifiedness is part of the packet statement). -/
theorem matrixAlgebra_of_not_dvd_disc (b : ι → B) (p : ℕ) [Fact p.Prime]
    (_hp : (disc b).num.natAbs % p ≠ 0) :
    ∃ (n : ℕ) (d : Fin n → ℕ) (K : Fin n → Type) (_ : ∀ i, Field (K i))
      (_ : ∀ i, Algebra ℚ_[p] (K i)),
      Nonempty ((ℚ_[p] ⊗[ℚ] B) ≃ₐ[ℚ_[p]] Π i, Matrix (Fin (d i)) (Fin (d i)) (K i)) := sorry

theorem disc_numberField (K : Type*) [Field K] [NumberField K] :
    (NumberField.discr K : ℚ) = Algebra.discr ℚ (fun i => (NumberField.RingOfIntegers.basis K i : K)) :=
  sorry

/-- `*` preserves a `*`-stable order and induces an involution of it. -/
theorem map_star [StarRing B] (O : StarOrder B) (x : B) (hx : x ∈ O.carrier) :
    star x ∈ O.carrier ∧ star (star x) = x := ⟨O.star_mem x hx, star_star x⟩

end Order

-- TauCeti.PEL.tests.Order.disc_numberField_quadratic
example : Order.disc ![(1 : AdjoinRoot (Polynomial.X ^ 2 + 1 : Polynomial ℚ)), AdjoinRoot.root _] =
    -4 := sorry
-- TauCeti.PEL.tests.Order.disc_matrix
example : |Order.disc (fun ij : Fin 2 × Fin 2 => Matrix.single ij.1 ij.2 (1 : ℚ))| = 1 := sorry
-- TauCeti.PEL.tests.Order.disc_nonmaximal
example : Order.disc ![(1 : AdjoinRoot (Polynomial.X ^ 2 + 1 : Polynomial ℚ)),
    2 * AdjoinRoot.root _] = -16 := sorry

/-! ### Symplectic O-lattices and PEL data -/

/-- A symplectic `O`-lattice: an `O`-module `L` with a nondegenerate alternating ℤ-valued form
(`ℤ(1)` identified with `ℤ` by a choice of `√−1`) for which `b` and `b*` are adjoint. -/
structure SymplecticOLattice (O : Type*) [Ring O] [StarRing O] (L : Type*) [AddCommGroup L]
    [Module O L] where
  form : LinearMap.BilinForm ℤ L
  isAlt : form.IsAlt
  nondeg : form.Nondegenerate
  adjoint : ∀ (b : O) (x y : L), form (b • x) y = form x (star b • y)

namespace SymplecticOLattice
variable {O : Type*} [Ring O] [StarRing O] {L : Type*} [AddCommGroup L] [Module O L]
  (Λ : SymplecticOLattice O L)

/-- The dual of a ℤ-submodule of `ℚ ⊗ L` for the ℚ-linear extension of the form. -/
noncomputable def dualOf (_Λ : SymplecticOLattice O L) (_N : Submodule ℤ (ℚ ⊗[ℤ] L)) :
    Submodule ℤ (ℚ ⊗[ℤ] L) := sorry

/-- The image of `L` in `ℚ ⊗ L`. -/
noncomputable def lattice (_Λ : SymplecticOLattice O L) : Submodule ℤ (ℚ ⊗[ℤ] L) :=
  LinearMap.range (TensorProduct.mk ℤ ℚ L 1)

/-- The dual lattice `L^#`. -/
noncomputable def dual : Submodule ℤ (ℚ ⊗[ℤ] L) := Λ.dualOf Λ.lattice

theorem le_dual : Λ.lattice ≤ Λ.dual := sorry

theorem dual_dual : Λ.dualOf Λ.dual = Λ.lattice := sorry

/-- The index `[L^# : L]`. -/
noncomputable def dualIndex : ℕ := Λ.lattice.toAddSubgroup.relIndex Λ.dual.toAddSubgroup

/-- `L` is self-dual at `p` iff `p ∤ [L^# : L]`. -/
def IsSelfDualAt (p : ℕ) : Prop := ¬ p ∣ Λ.dualIndex

/-- The multiplicity of a simple module `W` in `ℚ ⊗ L` (one coordinate of the multi-rank). -/
noncomputable def multiRank (_Λ : SymplecticOLattice O L) (W : Type*) [AddCommGroup W]
    [Module O W] : ℕ := sorry

/-- For `O = ℤ` with a basis, the elementary divisors of the Gram matrix (polarization type). -/
theorem polarizationType {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℤ L) :
    ∃ d : ι → ℤ, (∀ i, 0 < d i) ∧
      Λ.dualIndex = ((LinearMap.BilinForm.toMatrix b Λ.form).det.natAbs) := sorry

/-- Extension of scalars of the form. -/
noncomputable def baseChange (R : Type*) [CommRing R] : LinearMap.BilinForm R (R ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange R Λ.form

end SymplecticOLattice

-- TauCeti.PEL.tests.SymplecticOLattice.dual_standard
example (Λ : SymplecticOLattice ℤ (Fin 2 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 2)) Λ.form = !![0, 1; -1, 0]) :
    Λ.dualIndex = 1 := sorry
-- TauCeti.PEL.tests.SymplecticOLattice.index_type
example (d : ℤ) (Λ : SymplecticOLattice ℤ (Fin 4 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 4)) Λ.form =
      !![0, 1, 0, 0; -1, 0, 0, 0; 0, 0, 0, d; 0, 0, -d, 0]) :
    (Λ.dualIndex : ℤ) = d ^ 2 := sorry
-- TauCeti.PEL.tests.SymplecticOLattice.zero
example (Λ : SymplecticOLattice ℤ (Fin 0 → ℤ)) : Λ.dualIndex = 1 := sorry
-- TauCeti.PEL.tests.SymplecticOLattice.not_symmetric
example (Λ : SymplecticOLattice ℤ ℤ) : Λ.form ≠ LinearMap.mul ℤ ℤ := by
  intro h; have := Λ.isAlt 1; rw [h] at this; simp at this

/-- An integral PEL datum: a symplectic `O`-lattice with a complex structure `J = h(√−1)` on
`ℝ ⊗ L` commuting with `O` and making `(x, y) ↦ ⟨x, J y⟩` positive definite (Lan Condition
1.2.1.2; `ℤ(1)` identified with `ℤ` by `√−1`). -/
structure IntegralPELDatum (O : Type*) [Ring O] [StarRing O] (L : Type*) [AddCommGroup L]
    [Module O L] extends SymplecticOLattice O L where
  J : (ℝ ⊗[ℤ] L) →ₗ[ℝ] (ℝ ⊗[ℤ] L)
  J_sq : J ∘ₗ J = -LinearMap.id
  J_comm : ∀ b : O, J ∘ₗ (DistribSMul.toLinearMap ℤ L b).baseChange ℝ =
    (DistribSMul.toLinearMap ℤ L b).baseChange ℝ ∘ₗ J
  h_adjoint : ∀ x y, toSymplecticOLattice.baseChange ℝ (J x) (J y) =
    toSymplecticOLattice.baseChange ℝ x y
  pos : ∀ x : ℝ ⊗[ℤ] L, x ≠ 0 → 0 < toSymplecticOLattice.baseChange ℝ x (J x)

namespace IntegralPELDatum
variable {O : Type*} [Ring O] [StarRing O] {L : Type*} [AddCommGroup L] [Module O L]
  (D : IntegralPELDatum O L)

theorem compatible : ∀ x y, D.baseChange ℝ x (D.J y) = D.baseChange ℝ y (D.J x) := sorry

theorem nondegenerate_real : (D.baseChange ℝ).Nondegenerate := sorry

/-- Restriction to a `*`-stable suborder `φ : O' → O` keeps the adjointness. -/
theorem ofSubOrder {O' : Type*} [Ring O'] [StarRing O'] (φ : O' →+* O)
    (hφ : ∀ b, φ (star b) = star (φ b)) (b : O') (x y : L) :
    D.form (φ b • x) y = D.form x (φ (star b) • y) := by
  rw [hφ]; exact D.adjoint (φ b) x y

end IntegralPELDatum

-- TauCeti.PEL.tests.IntegralPELDatum.siegel
example (g : ℕ) : ∃ D : IntegralPELDatum ℤ (Fin g ⊕ Fin g → ℤ),
    LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin g ⊕ Fin g)) D.form = -Matrix.J (Fin g) ℤ ∧
      D.dualIndex = 1 := sorry
-- TauCeti.PEL.tests.IntegralPELDatum.zero
example (D : IntegralPELDatum ℤ (Fin 0 → ℤ)) : D.dualIndex = 1 := sorry
-- TauCeti.PEL.tests.IntegralPELDatum.wrong_sign
example {L : Type*} [AddCommGroup L] (D : IntegralPELDatum ℤ L) (x : ℝ ⊗[ℤ] L) (hx : x ≠ 0) :
    D.baseChange ℝ x ((-D.J) x) < 0 := by
  have := D.pos x hx; rw [LinearMap.neg_apply, map_neg]; linarith
-- TauCeti.PEL.tests.IntegralPELDatum.compatible_iff
example {L : Type*} [AddCommGroup L] (D : IntegralPELDatum ℤ L) (x : ℝ ⊗[ℤ] L) (hx : x ≠ 0) :
    0 < D.baseChange ℝ x (D.J x) := D.pos x hx

/-! ### Rational and p-integral data, the similitude group, good primes -/

/-- The action of `b ∈ B` on `V` as a ℚ-linear map. -/
abbrev bAct {B : Type*} [Ring B] [Algebra ℚ B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (b : B) : V →ₗ[ℚ] V := DistribSMul.toLinearMap ℚ V b

/-- A rational PEL datum `(B, *, V, ⟨·,·⟩, h)` with `J = h(√−1)` on `ℝ ⊗ V`. -/
structure RationalPELDatum (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] (V : Type*)
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] where
  form : LinearMap.BilinForm ℚ V
  isAlt : form.IsAlt
  nondeg : form.Nondegenerate
  faithful : FaithfulSMul B V
  adjoint : ∀ (b : B) (x y : V), form (b • x) y = form x (star b • y)
  J : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)
  J_sq : J ∘ₗ J = -LinearMap.id
  J_comm : ∀ b : B, J ∘ₗ (bAct (V := V) b).baseChange ℝ = (bAct (V := V) b).baseChange ℝ ∘ₗ J
  pos : ∀ x : ℝ ⊗[ℚ] V, x ≠ 0 → 0 < LinearMap.BilinForm.baseChange ℝ form x (J x)

/-- A `p`-integral PEL datum: a rational datum with a `*`-stable order maximal at `p` and a
self-dual lattice in `ℚ_p ⊗ V` (maximality and unramifiedness are stated in the packet). -/
structure PIntegralPELDatum (p : ℕ) [Fact p.Prime] (B : Type*) [Ring B] [Algebra ℚ B]
    [StarRing B] (V : Type*) [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    extends RationalPELDatum B V where
  order : Subring B
  order_star : ∀ x ∈ order, star x ∈ order
  selfDual : Submodule ℤ_[p] (ℚ_[p] ⊗[ℚ] V)
  selfDual_eq : ∀ x : ℚ_[p] ⊗[ℚ] V, x ∈ selfDual ↔
    ∀ y ∈ selfDual, LinearMap.BilinForm.baseChange ℚ_[p] form x y ∈ (algebraMap ℤ_[p] ℚ_[p]).range

namespace IntegralPELDatum
variable {O : Type*} [Ring O] [StarRing O] {L : Type*} [AddCommGroup L] [Module O L]

/-- Rationalization: the ℚ-bilinear extension of the form to `ℚ ⊗ L`. -/
def toRational (D : IntegralPELDatum O L) : LinearMap.BilinForm ℚ (ℚ ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℚ D.form

/-- The rational PEL datum `(B, *, L ⊗ ℚ, ⟨·,·⟩, h)`, for `B = O ⊗ ℚ` given with its action on
`L ⊗ ℚ` extending that of `O`. -/
def rationalize (_D : IntegralPELDatum O L) (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B]
    [Module B (ℚ ⊗[ℤ] L)] [IsScalarTower ℚ B (ℚ ⊗[ℤ] L)] (ι : O →+* B)
    (_hι : ∀ (b : O) (x : L), ι b • ((1 : ℚ) ⊗ₜ[ℤ] x) = (1 : ℚ) ⊗ₜ[ℤ] (b • x)) :
    RationalPELDatum B (ℚ ⊗[ℤ] L) := sorry

/-- Restriction to `ℤ_p` at a good prime. -/
def toPIntegral (D : IntegralPELDatum O L) (p : ℕ) [Fact p.Prime] :
    LinearMap.BilinForm ℤ_[p] (ℤ_[p] ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℤ_[p] D.form

end IntegralPELDatum

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- The image of an integral lattice in `𝔸_f ⊗ L` (its `Ẑ`-span is `L ⊗ Ẑ`). -/
def adelicLattice (L : Type*) [AddCommGroup L] :
    Submodule ℤ (IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℤ] L) :=
  LinearMap.range (TensorProduct.mk ℤ (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) L 1)

/-- `C = End_B(V)` inside `End_ℚ(V)`. -/
def centralizer (_D : RationalPELDatum B V) : Subalgebra ℚ (Module.End ℚ V) :=
  Subalgebra.centralizer ℚ (Set.range fun b : B => bAct (V := V) b)

end RationalPELDatum

-- TauCeti.PEL.tests.RationalPELDatum.siegel_pIntegral
example (p : ℕ) [Fact p.Prime] (D : IntegralPELDatum ℤ (Fin 2 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 2)) D.form = !![0, 1; -1, 0]) :
    D.toSymplecticOLattice.IsSelfDualAt p := sorry
-- TauCeti.PEL.tests.IntegralPELDatum.toPIntegral_type
example (p : ℕ) [Fact p.Prime] (D : IntegralPELDatum ℤ (Fin 4 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 4)) D.form =
      !![0, 1, 0, 0; -1, 0, 0, 0; 0, 0, 0, (p : ℤ); 0, 0, -(p : ℤ), 0]) :
    ¬ D.toSymplecticOLattice.IsSelfDualAt p := sorry
-- TauCeti.PEL.tests.RationalPELDatum.zero
example {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] [Nontrivial B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] [Subsingleton V]
    (D : RationalPELDatum B V) : False := sorry
-- TauCeti.PEL.tests.IntegralPELDatum.toRational_injective_fails
example : ∃ D₁ D₂ : IntegralPELDatum ℤ (Fin 2 → ℤ), D₁.dualIndex = 1 ∧ D₂.dualIndex = 4 ∧
    ∃ e : ℚ ⊗[ℤ] (Fin 2 → ℤ) ≃ₗ[ℚ] ℚ ⊗[ℤ] (Fin 2 → ℤ),
      ∀ x y, D₁.toRational (e x) (e y) = D₂.toRational x y := sorry

namespace PELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- The similitude group `G(R)` of `B ⊗ R`-linear symplectic similitudes of `R ⊗ V`. -/
def similitudeGroup (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] : Subgroup (((R ⊗[ℚ] V) ≃ₗ[R] (R ⊗[ℚ] V)) × Rˣ) := sorry

/-- The similitude character `ν`. -/
def multiplier (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] : similitudeGroup D R →* Rˣ :=
  (MonoidHom.snd _ _).comp (similitudeGroup D R).subtype

/-- `G₁ = ker ν`. -/
def isometryGroup (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] : Subgroup (similitudeGroup D R) := (multiplier D R).ker

theorem similitudeGroup.points_iff (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] (g : (R ⊗[ℚ] V) ≃ₗ[R] (R ⊗[ℚ] V)) (r : Rˣ) :
    (g, r) ∈ similitudeGroup D R ↔
      (∀ b : B, (g : (R ⊗[ℚ] V) →ₗ[R] (R ⊗[ℚ] V)) ∘ₗ (bAct (V := V) b).baseChange R =
        (bAct (V := V) b).baseChange R ∘ₗ g) ∧
      ∀ x y, LinearMap.BilinForm.baseChange R D.form (g x) (g y) =
        (r : R) * LinearMap.BilinForm.baseChange R D.form x y := sorry

theorem similitudeGroup.multiplier_unique (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] [Nontrivial V] (g : (R ⊗[ℚ] V) ≃ₗ[R] (R ⊗[ℚ] V))
    (r r' : Rˣ) (h : (g, r) ∈ similitudeGroup D R) (h' : (g, r') ∈ similitudeGroup D R) :
    r = r' := sorry

/-- The Siegel embedding `G ↪ GSp(V)`, forgetting `B`. -/
def similitudeGroup.siegelEmbedding (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] : similitudeGroup D R →* ((R ⊗[ℚ] V) ≃ₗ[R] (R ⊗[ℚ] V)) :=
  (MonoidHom.fst _ _).comp (similitudeGroup D R).subtype

/-- The principal congruence subgroup `U(n)` of the automorphisms of a lattice. -/
def similitudeGroup.principalCongruence (L : Type*) [AddCommGroup L] (n : ℕ) :
    Subgroup (L ≃ₗ[ℤ] L) := sorry

theorem similitudeGroup.isometry_siegel (g : ℕ)
    (A : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ) :
    A ∈ Matrix.symplecticGroup (Fin g) ℚ ↔ A.transpose * Matrix.J (Fin g) ℚ * A = Matrix.J (Fin g) ℚ :=
  sorry

theorem similitudeGroup.ofZero (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] [Subsingleton V] (r : Rˣ) :
    (LinearEquiv.refl R (R ⊗[ℚ] V), r) ∈ similitudeGroup D R := sorry

end PELDatum

-- TauCeti.PEL.tests.similitudeGroup_siegel_one
example (A : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ) :
    A.transpose * Matrix.J (Fin 1) ℤ * A = A.det • Matrix.J (Fin 1) ℤ := sorry
-- TauCeti.PEL.tests.similitudeGroup_zero
example {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] [Subsingleton V] (D : RationalPELDatum B V)
    (r : ℚˣ) : (LinearEquiv.refl ℚ (ℚ ⊗[ℚ] V), r) ∈ PELDatum.similitudeGroup D ℚ :=
  PELDatum.similitudeGroup.ofZero D ℚ r
-- TauCeti.PEL.tests.isometryGroup_siegel
example (A : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℚ) (hA : A ∈ Matrix.symplecticGroup (Fin 1) ℚ) :
    A.det = 1 := sorry
-- TauCeti.PEL.tests.similitudeGroup_not_isometry
example : (Matrix.diagonal (fun i : Fin 1 ⊕ Fin 1 => Sum.elim (fun _ => (2 : ℚ)) (fun _ => 1) i)) ∉
    Matrix.symplecticGroup (Fin 1) ℚ := sorry

/-- Kottwitz Lemma 7.1 (the conjugacy part of `M0/similitude-group-structure`): over an
algebraically closed field of characteristic zero, two elements of `G` are conjugate iff they have
the same multiplier and are conjugate by a `B`-linear automorphism. Connectedness in Cases A, C and
the `2^{[F₀:ℚ]}` components in Case D are stated in the packet (no algebraic-group carrier here). -/
theorem similitudeGroupStructure {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (K : Type*) [Field K] [Algebra ℚ K] [IsAlgClosed K] (x y : PELDatum.similitudeGroup D K) :
    IsConj x y ↔ PELDatum.multiplier D K x = PELDatum.multiplier D K y ∧
      ∃ c : (K ⊗[ℚ] V) ≃ₗ[K] (K ⊗[ℚ] V),
        (∀ b : B, (c : (K ⊗[ℚ] V) →ₗ[K] (K ⊗[ℚ] V)) ∘ₗ (bAct (V := V) b).baseChange K =
          (bAct (V := V) b).baseChange K ∘ₗ c) ∧
        c * ((x : PELDatum.similitudeGroup D K) : ((K ⊗[ℚ] V) ≃ₗ[K] (K ⊗[ℚ] V)) × Kˣ).1 * c⁻¹ =
          ((y : PELDatum.similitudeGroup D K) : ((K ⊗[ℚ] V) ≃ₗ[K] (K ⊗[ℚ] V)) × Kˣ).1 := sorry

namespace PELDatum

/-- `N_bad(n) = n · I_bad · Disc · [L^# : L]`. -/
def badPrimeInteger (n iBad disc dualIndex : ℕ) : ℕ := n * iBad * disc * dualIndex

/-- `p` is good iff it does not divide `N_bad(n)`. -/
def IsGoodPrime (n iBad disc dualIndex p : ℕ) : Prop := ¬ p ∣ badPrimeInteger n iBad disc dualIndex

/-- A set of good primes. -/
def IsGoodSet (n iBad disc dualIndex : ℕ) (box : Set ℕ) : Prop :=
  ∀ p ∈ box, IsGoodPrime n iBad disc dualIndex p

/-- The good-prime base `S₀ = Spec O_{F₀,(□)}` for a localization `R` of the ring of integers. -/
def goodBase (R : Type) [CommRing R] : Scheme := Spec (CommRingCat.of R)

theorem IsGoodPrime.toPIntegral {n iBad disc dualIndex p : ℕ}
    (h : IsGoodPrime n iBad disc dualIndex p) : ¬ p ∣ dualIndex := fun hp =>
  h (Dvd.dvd.mul_left hp _)

theorem IsGoodPrime.not_two_of_typeD {n disc dualIndex : ℕ} (types : Finset AlbertType)
    (hD : AlbertType.D ∈ types) : ¬ IsGoodPrime n (iBad types) disc dualIndex 2 := by
  intro h; apply h; simp only [badPrimeInteger, iBad, hD, ite_true]
  exact Dvd.dvd.mul_right (Dvd.dvd.mul_right (dvd_mul_left 2 n) _) _

theorem IsGoodPrime.unramified_reflex {n iBad disc dualIndex p : ℕ}
    (h : IsGoodPrime n iBad disc dualIndex p) : ¬ p ∣ disc := fun hp =>
  h (Dvd.dvd.mul_right (Dvd.dvd.mul_left hp _) _)

end PELDatum

-- TauCeti.PEL.tests.goodPrime_siegel
example (p : ℕ) (hp : p.Prime) : PELDatum.IsGoodPrime 3 1 1 1 p ↔ p ≠ 3 := sorry
-- TauCeti.PEL.tests.goodPrime_type
example : ¬ PELDatum.IsGoodPrime 1 1 1 36 2 ∧ ¬ PELDatum.IsGoodPrime 1 1 1 36 3 ∧
    PELDatum.IsGoodPrime 1 1 1 36 5 := by
  simp only [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]; decide
-- TauCeti.PEL.tests.goodPrime_typeD_two
example : ¬ PELDatum.IsGoodPrime 1 2 9 1 2 := by
  simp only [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]; decide
-- TauCeti.PEL.tests.goodBase_empty
example (F : Type) [Field F] : PELDatum.goodBase F = Spec (CommRingCat.of F) := rfl

/-! ### The Hodge structure, the Shimura datum, signatures -/

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- `V₀ = V^{−1,0}`: the `√−1`-eigenspace of `J = h(√−1)` on `ℂ ⊗ V`. -/
def V₀ (D : RationalPELDatum B V) : Submodule ℂ (ℂ ⊗[ℝ] (ℝ ⊗[ℚ] V)) :=
  LinearMap.ker (D.J.baseChange ℂ - Complex.I • LinearMap.id)

/-- `X`: the `G(ℝ)`-conjugacy class of `J = h(√−1)`. -/
def domain (D : RationalPELDatum B V) : Set ((ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)) :=
  {J' | ∃ g : PELDatum.similitudeGroup D ℝ, ∃ e : (ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V),
    e = (g : ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) × ℝˣ).1 ∧
    J' = (e : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)) ∘ₗ D.J ∘ₗ (e.symm : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V))}

theorem domain_indep (D : RationalPELDatum B V) (J' : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V))
    (hsq : J' ∘ₗ J' = -LinearMap.id)
    (hcomm : ∀ b : B, J' ∘ₗ (bAct (V := V) b).baseChange ℝ = (bAct (V := V) b).baseChange ℝ ∘ₗ J')
    (hpos : ∀ x, x ≠ 0 → 0 < LinearMap.BilinForm.baseChange ℝ D.form x (J' x)) :
    J' ∈ D.domain := sorry

/-- Kottwitz Lemma 4.1 in the form used here: `(x, y) ↦ ⟨x, J y⟩` is symmetric. -/
theorem kottwitz_axioms (D : RationalPELDatum B V) (x y : ℝ ⊗[ℚ] V) :
    LinearMap.BilinForm.baseChange ℝ D.form x (D.J y) =
      LinearMap.BilinForm.baseChange ℝ D.form y (D.J x) := sorry

/-- The domain of the Shimura datum `(G, X)` of ShimuraData D4 (the SV axioms hold when `G` is
connected and `h` is nontrivial on every ℚ-simple adjoint factor; stated in the packet). -/
def toShimuraDatum (D : RationalPELDatum B V) : Set ((ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)) := D.domain

/-- The Siegel morphism `G → GSp(V)` on real points. -/
def siegelMorphism (D : RationalPELDatum B V) :
    PELDatum.similitudeGroup D ℝ →* ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) :=
  PELDatum.similitudeGroup.siegelEmbedding D ℝ

/-- Kottwitz's `(G, h⁻¹)` and Deligne's `(G, h)`: replacing `J` by `−J` exchanges `V₀` and `V₀ᶜ`. -/
theorem signConvention (D : RationalPELDatum B V) (J' : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V))
    (hJ' : J' ∈ D.domain) : (-J') ∘ₗ (-J') = -LinearMap.id := sorry

/-- The signature `(p_τ, q_τ)` at an embedding `τ` of a central subfield `F`: multiplicities of
the simple `B ⊗_{F,τ} ℂ`-module in `V₀` and in its complement. -/
def signature (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B] (_τ : F →+* ℂ) :
    ℕ × ℕ := sorry

/-- The multi-rank `m_[τ]` of `V`. -/
def multiRankAt (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B] (_τ : F →+* ℂ) :
    ℕ := sorry

theorem signature_add (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (τ : F →+* ℂ) : (D.signature F τ).1 + (D.signature F τ).2 = D.multiRankAt F τ := sorry

theorem signature_conj (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (τ : F →+* ℂ) :
    D.signature F (NumberField.ComplexEmbedding.conjugate τ) = (D.signature F τ).swap := sorry

/-- For `B = K` a CM field, the signature type `Σ p_τ τ` as a finitely supported function. -/
def signatureType (D : RationalPELDatum B V) (K : Type*) [Field K] [Algebra K B] : (K →+* ℂ) →₀ ℕ :=
  sorry

theorem signature_unitary (D : RationalPELDatum B V) (K : Type*) [Field K] [Algebra K B]
    (τ : K →+* ℂ) : D.signatureType K τ = (D.signature K τ).1 := sorry

end RationalPELDatum

/-- Positivity of a PEL datum is the polarization of its weight `−1` Hodge structure
(`M0/hodge-structure-of-datum`; Tau Ceti `TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos`
is the intended carrier); here: `V ⊗ ℂ = V₀ ⊕ V₀ᶜ` with `V₀` isotropic. -/
theorem hodgeStructureOfDatum {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) :
    ∀ x ∈ D.V₀, ∀ y ∈ D.V₀,
      LinearMap.BilinForm.baseChange ℂ (LinearMap.BilinForm.baseChange ℝ D.form) x y = 0 := sorry

-- TauCeti.PEL.tests.pelShimuraDatum_siegel
example (g : ℕ) (A : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℝ)
    (hA : A ∈ Matrix.symplecticGroup (Fin g) ℝ) :
    A * Matrix.J (Fin g) ℝ * A⁻¹ * (A * Matrix.J (Fin g) ℝ * A⁻¹) = -1 := sorry
-- TauCeti.PEL.tests.pelShimuraDatum_definite
example {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (hcentral : ∀ g : PELDatum.similitudeGroup D ℝ,
      ((g : ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) × ℝˣ).1 : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)) ∘ₗ D.J =
        D.J ∘ₗ ((g : ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) × ℝˣ).1 : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V))) :
    D.domain = {D.J} := sorry
-- TauCeti.PEL.tests.pelShimuraDatum_typeD
example : ¬ _root_.IsConnected ({x : ℝ | x ^ 2 = 1}) := sorry
-- TauCeti.PEL.tests.pelShimuraDatum_gl2
example (A : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℝ) :
    A ∈ Matrix.symplecticGroup (Fin 1) ℝ ↔ A.det = 1 := sorry

-- TauCeti.PEL.tests.signature_siegel
example {V : Type*} [AddCommGroup V] [Module ℚ V] (D : RationalPELDatum ℚ V) (g : ℕ)
    (hV : Module.finrank ℚ V = 2 * g) : D.signature ℚ (algebraMap ℚ ℂ) = (g, g) := sorry
-- TauCeti.PEL.tests.signature_picard
example {V : Type*} [AddCommGroup V] [Module ℚ V] (K : Type*) [Field K] [NumberField K]
    [StarRing K] [Module K V] [IsScalarTower ℚ K V] (D : RationalPELDatum K V) (τ : K →+* ℂ)
    (h : D.signature K τ = (2, 1)) :
    D.signature K (NumberField.ComplexEmbedding.conjugate τ) = (1, 2) := by
  rw [D.signature_conj, h]; rfl
-- TauCeti.PEL.tests.signature_zero
example {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] [Subsingleton V] (D : RationalPELDatum B V)
    (F : Type*) [Field F] [Algebra F B] (τ : F →+* ℂ) : D.signature F τ = (0, 0) := sorry
-- TauCeti.PEL.tests.signature_not_free
example {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) (F : Type*)
    [Field F] [Algebra F B] (τ : F →+* ℂ) (h : D.signature F τ = (2, 0)) :
    D.signature F (NumberField.ComplexEmbedding.conjugate τ) ≠ (2, 0) := by
  rw [D.signature_conj, h]; decide

/-! ### The determinant polynomial -/

section DetPoly
variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M]
  [Module.Finite R M] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- `Det_{O|M}(X) = det(Σ_i X_i α_i | M)` for the endomorphisms `a i` of a basis `α_i` of `O`. -/
def detPoly (_a : ι → Module.End R M) : MvPolynomial ι R := sorry

theorem detPoly_basis_indep (a : ι → Module.End R M) (P : Matrix ι ι R) :
    detPoly (fun j => ∑ i, P i j • a i) =
      MvPolynomial.aeval (fun i => ∑ j, MvPolynomial.C (P i j) * MvPolynomial.X j) (detPoly a) :=
  sorry

theorem detPoly_eval (a : ι → Module.End R M) (x : ι → R) :
    MvPolynomial.eval x (detPoly a) = LinearMap.det (∑ i, x i • a i) := sorry

theorem detPoly_baseChange (a : ι → Module.End R M) (A : Type*) [CommRing A] [Algebra R A] :
    MvPolynomial.map (algebraMap R A) (detPoly a) = detPoly (fun i => (a i).baseChange A) := sorry

theorem detPoly_exact {M' : Type*} [AddCommGroup M'] [Module R M'] [Module.Free R M']
    [Module.Finite R M'] (a : ι → Module.End R M) (a' : ι → Module.End R M') :
    detPoly (fun i => (a i).prodMap (a' i)) = detPoly a * detPoly a' := sorry

theorem detPoly_homogeneous (a : ι → Module.End R M) :
    (detPoly a).IsHomogeneous (Module.finrank R M) := sorry

theorem detPoly_eq_polyCharpoly (a : ι → Module.End R M)
    (φ : (ι → R) →ₗ[R] Module.End R M) (hφ : ∀ i, φ (Pi.single i 1) = a i) :
    MvPolynomial.map (RingHom.id R) (detPoly a) =
      (-1) ^ Module.finrank R M * (LinearMap.polyCharpoly φ (Pi.basisFun R ι)).coeff 0 := sorry

end DetPoly

-- TauCeti.PEL.tests.detPoly_int
example (r : ℕ) : detPoly (R := ℤ) (M := Fin r → ℤ) (ι := Unit) (fun _ => LinearMap.id) =
    MvPolynomial.X () ^ r := sorry
-- TauCeti.PEL.tests.detPoly_gaussian
example : detPoly (R := ℂ) (M := ℂ) (ι := Fin 2) ![LinearMap.id, Complex.I • LinearMap.id] =
    MvPolynomial.X 0 + MvPolynomial.C Complex.I * MvPolynomial.X 1 := sorry
-- TauCeti.PEL.tests.detPoly_eval_charpoly
example (f : Module.End ℚ (Fin 2 → ℚ)) :
    MvPolynomial.eval ![(1 : ℚ)] (detPoly (ι := Fin 1) ![f]) = LinearMap.det f := sorry
-- TauCeti.PEL.tests.detPoly_not_trace
example : ∃ t : Fin 3 → Fin 2 → ZMod 3, (∑ k, t k 1) = 0 ∧
    detPoly (R := ZMod 3) (M := Fin 3 → ZMod 3) (ι := Fin 2)
      (fun i => LinearMap.pi fun k => t k i • LinearMap.proj k) ≠
    detPoly (R := ZMod 3) (M := Fin 3 → ZMod 3) (ι := Fin 2)
      (fun i => LinearMap.pi fun k => t 0 i • LinearMap.proj k) := sorry

/-- Over a field, the determinant polynomial classifies modules over a semisimple algebra
(`M0/determinant-classifies`; separability of the centre is a packet hypothesis). -/
theorem determinantClassifies {K : Type*} [Field K] {C : Type*} [Ring C] [Algebra K C]
    [IsSemisimpleRing C] {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → C)
    {M₁ M₂ : Type*} [AddCommGroup M₁] [Module K M₁] [FiniteDimensional K M₁]
    [AddCommGroup M₂] [Module K M₂] [FiniteDimensional K M₂]
    (ρ₁ : C →ₐ[K] Module.End K M₁) (ρ₂ : C →ₐ[K] Module.End K M₂) :
    (∃ e : M₁ ≃ₗ[K] M₂, ∀ c, (e : M₁ →ₗ[K] M₂) ∘ₗ ρ₁ c = ρ₂ c ∘ₗ e) ↔
      detPoly (fun i => ρ₁ (α i)) = detPoly (fun i => ρ₂ (α i)) := sorry

/-! ### The reflex field and the determinant condition -/

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- `Tr(b | V₀)`. -/
def traceV₀ (D : RationalPELDatum B V) (_b : B) : ℂ := sorry

/-- The reflex field `F₀ ⊂ ℂ`: the field of definition of the class of `V₀`. -/
def reflexField (D : RationalPELDatum B V) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range D.traceV₀)

theorem reflexField_eq_traces (D : RationalPELDatum B V) :
    D.reflexField = IntermediateField.adjoin ℚ (Set.range D.traceV₀) := rfl

theorem reflexField_le_galoisClosure (D : RationalPELDatum B V) (σ : ℂ ≃ₐ[ℚ] ℂ)
    (hσ : ∀ b : B, ∀ z ∈ Set.range (fun c : B => D.traceV₀ c), σ z = z) :
    ∀ x ∈ D.reflexField, σ x = x := sorry

theorem reflexField_finite (D : RationalPELDatum B V) [FiniteDimensional ℚ B] :
    FiniteDimensional ℚ D.reflexField := sorry

/-- `p` unramified in the centre `F` (here: `p ∤ disc F`) is unramified in `F₀`. -/
theorem unramified_reflex (D : RationalPELDatum B V) (F : Type*) [Field F] [NumberField F]
    [Algebra F B] [NumberField D.reflexField] (p : ℕ) (hp : ¬ (p : ℤ) ∣ NumberField.discr F) :
    ¬ (p : ℤ) ∣ NumberField.discr D.reflexField := sorry

/-- `Det_{O|V₀}` has integral coefficients: traces of elements of an order are integral. -/
theorem detPoly_integral (D : RationalPELDatum B V) (O : Subring B)
    (hO : (Submodule.span ℤ (O : Set B)).FG) (b : B) (hb : b ∈ O) :
    IsIntegral ℤ (D.traceV₀ b) := sorry

theorem reflexField_siegel (D : RationalPELDatum ℚ V) : D.reflexField = ⊥ := sorry

end RationalPELDatum

-- TauCeti.PEL.tests.reflexField_siegel
example {V : Type*} [AddCommGroup V] [Module ℚ V] (D : RationalPELDatum ℚ V) : D.reflexField = ⊥ :=
  D.reflexField_siegel
-- TauCeti.PEL.tests.reflexField_picard
example {V : Type*} [AddCommGroup V] [Module ℚ V] (K : Type*) [Field K] [NumberField K] [StarRing K]
    [Module K V] [IsScalarTower ℚ K V] (D : RationalPELDatum K V) (τ : K →+* ℂ)
    (hV₀ : ∀ b : K, D.traceV₀ b = 2 * τ b + starRingEnd ℂ (τ b)) (a : K)
    (ha : τ a ≠ starRingEnd ℂ (τ a)) : D.reflexField ≠ ⊥ := sorry
-- TauCeti.PEL.tests.reflexField_U11
example {V : Type*} [AddCommGroup V] [Module ℚ V] (K : Type*) [Field K] [NumberField K] [StarRing K]
    [Module K V] [IsScalarTower ℚ K V] (D : RationalPELDatum K V) (τ : K →+* ℂ)
    (hV₀ : ∀ b : K, D.traceV₀ b = τ b + starRingEnd ℂ (τ b)) : D.reflexField = ⊥ := sorry
-- TauCeti.PEL.tests.reflexField_not_center
example {V : Type*} [AddCommGroup V] [Module ℚ V] (F : Type*) [Field F] [NumberField F] [StarRing F]
    [Module F V] [IsScalarTower ℚ F V] (D : RationalPELDatum F V)
    (hV₀ : ∀ b : F, D.traceV₀ b = algebraMap ℚ ℂ (Algebra.trace ℚ F b))
    (hF : 1 < Module.finrank ℚ F) : D.reflexField = ⊥ := sorry

/-- `E(G, X) = F₀` (`M0/reflex-field-comparison`): the field of definition of the conjugacy class
of `μ_h` equals that of `V₀`, stated as equality of stabilizers in `Aut(ℂ/ℚ)`. -/
theorem reflexFieldComparison {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (stabMu : Subgroup (ℂ ≃ₐ[ℚ] ℂ))
    (hMu : ∀ σ, σ ∈ stabMu ↔ ∀ b : B, σ (D.traceV₀ b) = D.traceV₀ b) :
    ∀ x ∈ D.reflexField, ∀ σ ∈ stabMu, σ x = x := sorry

/-- The Kottwitz determinant condition on an `R`-module `M` with `O`-action over an
`O_{F₀,(□)}`-algebra `R`: `Det_{O|M}` equals the image of `Det_{O|V₀}`. -/
def SatisfiesDetCondition {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]
    [Module.Free R M] [Module.Finite R M] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (a : ι → Module.End R M) (detV₀ : MvPolynomial ι R) : Prop :=
  detPoly a = detV₀

namespace SatisfiesDetCondition
variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M]
  [Module.Finite R M] {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem baseChange {a : ι → Module.End R M} {f : MvPolynomial ι R}
    (h : SatisfiesDetCondition a f) (A : Type*) [CommRing A] [Algebra R A] :
    SatisfiesDetCondition (fun i => (a i).baseChange A) (MvPolynomial.map (algebraMap R A) f) := by
  unfold SatisfiesDetCondition at *; rw [← h, detPoly_baseChange]

theorem descent {a : ι → Module.End R M} {f : MvPolynomial ι R} (A : Type*) [CommRing A]
    [Algebra R A] [Module.FaithfullyFlat R A] :
    SatisfiesDetCondition a f ↔
      SatisfiesDetCondition (fun i => (a i).baseChange A) (MvPolynomial.map (algebraMap R A) f) :=
  sorry

theorem rank {a : ι → Module.End R M} {f : MvPolynomial ι R} [Nontrivial R]
    (h : SatisfiesDetCondition a f) (d : ℕ) (hf : f.IsHomogeneous d) (hf0 : f ≠ 0) :
    Module.finrank R M = d := sorry

theorem iff_eval {a : ι → Module.End R M} {f : MvPolynomial ι R} :
    SatisfiesDetCondition a f ↔ ∀ (A : Type*) [CommRing A] [Algebra R A] (x : ι → A),
      MvPolynomial.aeval x f = LinearMap.det (∑ i, x i • (a i).baseChange A) := sorry

/-- Unitary case: on a sum of `τ`-lines (`O_F` acting on the `k`-th coordinate through `t k`),
`Det` is the product of the linear forms `Σ_i t_k(α_i) X_i`; so the condition fixes the multiset
of `τ`'s, i.e. `rank Lie_τ = r_τ`. -/
theorem unitary {κ : Type*} [Fintype κ] [DecidableEq κ] (t : κ → ι → R) (f : MvPolynomial ι R) :
    SatisfiesDetCondition (M := κ → R)
      (fun i => LinearMap.pi fun k => t k i • LinearMap.proj k) f ↔
      f = ∏ k, ∑ i, MvPolynomial.C (t k i) * MvPolynomial.X i := sorry

end SatisfiesDetCondition

-- TauCeti.PEL.tests.detCondition_siegel
example (g : ℕ) (M : Type) [AddCommGroup M] [Module ℤ M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    SatisfiesDetCondition (ι := Unit) (fun _ => (LinearMap.id : Module.End ℤ M))
      (MvPolynomial.X () ^ g) ↔ Module.finrank ℤ M = g := sorry
-- TauCeti.PEL.tests.detCondition_char3_signature
example (t t' : Fin 3 → Fin 2 → ZMod 3) (ht : ∀ k, t k = ![1, 1]) (ht' : ∀ k, t' k = ![1, -1])
    (htr : (∑ k, t k 1) = ∑ k, t' k 1) :
    ¬ SatisfiesDetCondition (M := Fin 3 → ZMod 3)
      (fun i => LinearMap.pi fun k => t k i • LinearMap.proj k)
      (∏ k, ∑ i, MvPolynomial.C (t' k i) * MvPolynomial.X i) := sorry
-- TauCeti.PEL.tests.detCondition_zero
example (M : Type) [AddCommGroup M] [Module ℤ M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    SatisfiesDetCondition (ι := Unit) (fun _ => (LinearMap.id : Module.End ℤ M)) 1 ↔
      Module.finrank ℤ M = 0 := sorry
-- TauCeti.PEL.tests.detCondition_baseChange_C
example {ι : Type} [Fintype ι] [DecidableEq ι] (M₁ M₂ : Type) [AddCommGroup M₁] [Module ℂ M₁]
    [FiniteDimensional ℂ M₁] [AddCommGroup M₂] [Module ℂ M₂] [FiniteDimensional ℂ M₂]
    (C : Type) [Ring C] [Algebra ℂ C] [IsSemisimpleRing C] (α : ι → C)
    (ρ₁ : C →ₐ[ℂ] Module.End ℂ M₁) (ρ₂ : C →ₐ[ℂ] Module.End ℂ M₂) :
    SatisfiesDetCondition (fun i => ρ₁ (α i)) (detPoly fun i => ρ₂ (α i)) ↔
      ∃ e : M₁ ≃ₗ[ℂ] M₂, ∀ c, (e : M₁ →ₗ[ℂ] M₂) ∘ₗ ρ₁ c = ρ₂ c ∘ₗ e :=
  (determinantClassifies α ρ₁ ρ₂).symm

/-- Over an algebraically closed field of characteristic prime to `Disc`, the determinant
condition says `M ≅ L₀ ⊗ k` (`M0/determinant-condition-splitting`). -/
theorem determinantConditionSplitting {k : Type*} [Field k] [IsAlgClosed k] {C : Type*} [Ring C]
    [Algebra k C] [IsSemisimpleRing C] {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → C)
    {M L₀ : Type*} [AddCommGroup M] [Module k M] [FiniteDimensional k M] [AddCommGroup L₀]
    [Module k L₀] [FiniteDimensional k L₀] (ρ : C →ₐ[k] Module.End k M)
    (ρ₀ : C →ₐ[k] Module.End k L₀) :
    SatisfiesDetCondition (fun i => ρ (α i)) (detPoly fun i => ρ₀ (α i)) ↔
      ∃ e : M ≃ₗ[k] L₀, ∀ c, (e : M →ₗ[k] L₀) ∘ₗ ρ c = ρ₀ c ∘ₗ e := sorry

/-- Kottwitz Lemma 7.2 / Corollary 7.3 (`M0/self-dual-lattice-classification`): two self-dual
`ℤ_p`-lattices for nondegenerate alternating forms of the same rank are isometric. -/
theorem selfDualLatticeClassification (p : ℕ) [Fact p.Prime] {n : ℕ}
    (C₁ C₂ : Matrix (Fin n) (Fin n) ℤ_[p]) (h₁ : C₁.transpose = -C₁) (h₂ : C₂.transpose = -C₂)
    (u₁ : IsUnit C₁.det) (u₂ : IsUnit C₂.det) :
    ∃ g : GL (Fin n) ℤ_[p], (g : Matrix (Fin n) (Fin n) ℤ_[p]).transpose * C₁ * g = C₂ := sorry

/-- Bijakowski–Pilloni–Stroh Lemme 1.1.4: with `ℂ ≅ ℂ_p` fixed and `p` totally split in the
reflex field, signatures at two embeddings inducing the same `p`-adic place agree (the remaining
hypotheses (i)–(iv) of their 1.1.1 are packet hypotheses). -/
theorem bpsSignatureConstancy {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (F : Type*) [Field F] [Algebra F B] (p : ℕ) [Fact p.Prime] (ιp : ℂ ≃+* AlgebraicClosure ℚ_[p])
    (hsplit : ∀ σ : AlgebraicClosure ℚ_[p] ≃ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p],
      ∀ x ∈ D.reflexField, σ (ιp x) = ιp x)
    (τ τ' : F →+* ℂ) (hsame : ∃ σ : AlgebraicClosure ℚ_[p] ≃ₐ[ℚ_[p]] AlgebraicClosure ℚ_[p],
      ∀ a, σ (ιp (τ a)) = ιp (τ' a)) :
    D.signature F τ = D.signature F τ' := sorry

/-! ### Hermitian, skew-hermitian and CM data -/

/-- A hermitian space over a commutative ring `A` with involution (`O_F ⊗ R`): a
`c`-sesquilinear hermitian perfect pairing. -/
structure HermitianSpace (A : Type*) [CommRing A] [StarRing A] (V : Type*) [AddCommGroup V]
    [Module A V] where
  pairing : V →ₗ[A] V →ₗ⋆[A] A
  hermitian : ∀ x y, pairing x y = star (pairing y x)
  perfect : Function.Bijective (fun x => (pairing x : V →ₗ⋆[A] A))

namespace HermitianSpace
variable {A : Type*} [CommRing A] [StarRing A] {V : Type*} [AddCommGroup V] [Module A V]

/-- `U(V)`: isometries. -/
def unitaryGroup (H : HermitianSpace A V) : Subgroup (V ≃ₗ[A] V) where
  carrier := {g | ∀ x y, H.pairing (g x) (g y) = H.pairing x y}
  one_mem' := by simp
  mul_mem' := by
    intro a b ha hb x y
    simp only [Set.mem_ofPred_eq] at ha hb
    show H.pairing (a (b x)) (a (b y)) = H.pairing x y
    rw [ha, hb]
  inv_mem' := by
    intro a ha x y
    have := ha (a⁻¹ x) (a⁻¹ y)
    simpa using this.symm

/-- `V_♯ = V ⊕ A·1` with `(1, 1) = 1`. -/
def sharp (H : HermitianSpace A V) : HermitianSpace A (V × A) := sorry

/-- `f ↦ f_♯ = f ⊕ id`. -/
def Isometry.sharp (f : V ≃ₗ[A] V) : (V × A) ≃ₗ[A] (V × A) := f.prodCongr (LinearEquiv.refl A A)

theorem unitaryGroup_le_sharp (H : HermitianSpace A V) (g : V ≃ₗ[A] V)
    (hg : g ∈ H.unitaryGroup) : Isometry.sharp g ∈ H.sharp.unitaryGroup := sorry

/-- For `δ` with `star δ = -δ`, `⟨x, y⟩ = Tr(δ (x, y))` is a skew-hermitian form. -/
def toSkewHermitian (H : HermitianSpace A V) (δ : A) (tr : A →ₗ[ℤ] ℤ) : V → V → ℤ :=
  fun x y => tr (δ * H.pairing x y)

theorem unitaryGroup_matrix (n : Type*) [Fintype n] [DecidableEq n] (U : Matrix n n A) :
    U ∈ Matrix.unitaryGroup n A ↔ star U * U = 1 := Matrix.mem_unitaryGroup_iff'

end HermitianSpace

-- TauCeti.PEL.tests.hermitianSpace_sharp_rank
example {A : Type*} [CommRing A] [StarRing A] {V : Type*} [AddCommGroup V] [Module A V]
    (H : HermitianSpace A V) (x : V) (a : A) :
    H.sharp.pairing (x, a) (0, 1) = a ∧ H.sharp.pairing (x, 0) (x, 0) = H.pairing x x := sorry
-- TauCeti.PEL.tests.hermitianSpace_unitary_matrix
example (n : ℕ) (U : Matrix (Fin n) (Fin n) ℂ) :
    U ∈ Matrix.unitaryGroup (Fin n) ℂ ↔ star U * U = 1 := Matrix.mem_unitaryGroup_iff'
-- TauCeti.PEL.tests.hermitianSpace_not_symmetric
example (H : HermitianSpace ℂ ℂ) (a x y : ℂ) : H.pairing x (a • y) = star a * H.pairing x y := sorry
-- TauCeti.PEL.tests.hermitianSpace_trace_dictionary
example (H : HermitianSpace ℂ ℂ) (tr : ℂ →ₗ[ℤ] ℤ) (htr : ∀ z, tr (star z) = tr z) (x y : ℂ) :
    H.toSkewHermitian Complex.I tr x y = -H.toSkewHermitian Complex.I tr y x := sorry

/-- A rational skew-hermitian space over `O_F ⊗ R`: an `R`-bilinear skew-symmetric perfect pairing
with `⟨ax, y⟩ = ⟨x, a^c y⟩`. -/
structure SkewHermitianSpace (R : Type*) [CommRing R] (A : Type*) [CommRing A] [StarRing A]
    [Algebra R A] (W : Type*) [AddCommGroup W] [Module A W] [Module R W] [IsScalarTower R A W] where
  pairing : LinearMap.BilinForm R W
  skew : ∀ x y, pairing x y = -pairing y x
  perfect : pairing.Nondegenerate
  adjoint : ∀ (a : A) (x y : W), pairing (a • x) y = pairing x (star a • y)

namespace SkewHermitianSpace
variable {R : Type*} [CommRing R] {A : Type*} [CommRing A] [StarRing A] [Algebra R A]
  {W : Type*} [AddCommGroup W] [Module A W] [Module R W] [IsScalarTower R A W]

/-- Similitudes `f` with `⟨f x, f y⟩ = c(f)⟨x, y⟩`. -/
structure Similitude {W' : Type*} [AddCommGroup W'] [Module A W'] [Module R W']
    [IsScalarTower R A W'] (S : SkewHermitianSpace R A W) (S' : SkewHermitianSpace R A W') where
  toEquiv : W ≃ₗ[A] W'
  c : Rˣ
  scale : ∀ x y, S'.pairing (toEquiv x) (toEquiv y) = (c : R) * S.pairing x y

/-- Similarity. -/
def Similar {W' : Type*} [AddCommGroup W'] [Module A W'] [Module R W'] [IsScalarTower R A W']
    (S : SkewHermitianSpace R A W) (S' : SkewHermitianSpace R A W') : Prop :=
  Nonempty (S.Similitude S')

/-- `GU(W)`: self-similitudes, as a subgroup of `(W ≃ W) × Rˣ`. -/
def GU (S : SkewHermitianSpace R A W) : Subgroup ((W ≃ₗ[A] W) × Rˣ) := sorry

theorem gu_rankOne (S : SkewHermitianSpace R A A) (a : Aˣ) (c : Rˣ)
    (hc : algebraMap R A c = (a : A) * star (a : A)) :
    (LinearEquiv.smulOfUnit a, c) ∈ S.GU := sorry

/-- Type `Φ` for rank one: `⟨a x, x⟩ ≥ 0` for totally imaginary `a` positive on `Φ`. -/
def HasType [Algebra ℚ A] [Module ℚ W] [IsScalarTower ℚ A W] (S : SkewHermitianSpace ℚ A W)
    (posImag : Set A) : Prop :=
  ∀ a ∈ posImag, ∀ x, 0 ≤ S.pairing (a • x) x

/-- The integral PEL datum underlying a skew-hermitian space (forgetting to `ℤ`-lattices). -/
def toPELDatum (S : SkewHermitianSpace R A W) : LinearMap.BilinForm R W := S.pairing

end SkewHermitianSpace

/-- The torus `T₀(R) = {a ∈ O_F ⊗ R : N_{F/F⁺}(a) ∈ R^×}`, as a subgroup of `(O_F ⊗ R)ˣ`. -/
def cmTorus (R : Type*) [CommRing R] (A : Type*) [CommRing A] [StarRing A] [Algebra R A] :
    Subgroup Aˣ where
  carrier := {a | ∃ r : Rˣ, algebraMap R A r = (a : A) * star (a : A)}
  one_mem' := ⟨1, by simp⟩
  mul_mem' := by
    rintro a b ⟨r, hr⟩ ⟨s, hs⟩
    exact ⟨r * s, by simp [hr, hs, star_mul]; ring⟩
  inv_mem' := by
    rintro a ⟨r, hr⟩
    refine ⟨r⁻¹, ?_⟩
    sorry

-- TauCeti.PEL.tests.cmTorus_points_imagQuad
example (a : ℂˣ) : a ∈ cmTorus ℝ ℂ := sorry
-- TauCeti.PEL.tests.gu_rankOne_multiplier
example (S : SkewHermitianSpace ℝ ℂ ℂ) (a : ℂˣ) (c : ℝˣ)
    (hc : algebraMap ℝ ℂ c = (a : ℂ) * star (a : ℂ)) :
    (LinearEquiv.smulOfUnit a, c) ∈ S.GU := S.gu_rankOne a c hc
-- TauCeti.PEL.tests.skewHermitian_type_flip
example (S : SkewHermitianSpace ℚ ℚ ℚ) (posImag : Set ℚ) (_hS : S.HasType posImag)
    (a : ℚ) (ha : a ∈ posImag) (x : ℚ) (hx : 0 < S.pairing (a • x) x) :
    ¬ (∀ a ∈ posImag, ∀ x, 0 ≤ -S.pairing (a • x) x) := fun h => by
  have := h a ha x; linarith
-- TauCeti.PEL.tests.skewHermitian_zero
example (S : SkewHermitianSpace ℚ ℚ (Fin 0 → ℚ)) (c : ℚˣ) :
    (LinearEquiv.refl ℚ (Fin 0 → ℚ), c) ∈ S.GU := sorry

/-- Similarity classes of rank-one skew-hermitian spaces everywhere locally similar to `S` (data). -/
def rankOneLocalClasses {A : Type*} [CommRing A] [StarRing A] [Algebra ℚ A]
    (_S : SkewHermitianSpace ℚ A A) : Type := sorry

/-- `ker¹(T₀) = ker(H¹(ℚ, T₀) → ∏_v H¹(ℚ_v, T₀))` (data; the Galois-cohomology carrier is the
recorded gap). -/
def cmTorusKer1 (A : Type*) [CommRing A] [StarRing A] : Type := sorry

/-- LTXZZ Remark 3.5.2: everywhere-locally-similar rank-one spaces are classified by the finite
group `ker¹(T₀)` (the Galois-cohomology carrier is the recorded gap). -/
theorem rankOneSkewHermitianClassification {A : Type*} [CommRing A] [StarRing A] [Algebra ℚ A]
    (S : SkewHermitianSpace ℚ A A) :
    Nonempty (rankOneLocalClasses S ≃ cmTorusKer1 A) ∧ Finite (cmTorusKer1 A) := sorry

/-- A generalized CM type of rank `N`: `Ψ : Σ_∞ →₀ ℕ` with `Ψ τ + Ψ (c ∘ τ) = N`. -/
structure GeneralizedCMType (F : Type*) [Field F] (N : ℕ) where
  coeff : (F →+* ℂ) →₀ ℕ
  sum_conj : ∀ τ, coeff τ + coeff (NumberField.ComplexEmbedding.conjugate τ) = N

namespace GeneralizedCMType
variable {F : Type*} [Field F] {N : ℕ}

/-- The Galois action `σ · Ψ = Σ r_τ (σ ∘ τ)`. -/
def galois_smul (σ : ℂ ≃+* ℂ) (Ψ : GeneralizedCMType F N) : GeneralizedCMType F N := sorry

/-- The reflex field `F_Ψ`: the fixed field of the stabilizer of `Ψ`. -/
def reflexField (Ψ : GeneralizedCMType F N) : Subfield ℂ :=
  { carrier := {z | ∀ σ : ℂ ≃+* ℂ, galois_smul σ Ψ = Ψ → σ z = z}
    mul_mem' := by intro a b ha hb σ hσ; simp [ha σ hσ, hb σ hσ]
    one_mem' := by intro σ _; simp
    add_mem' := by intro a b ha hb σ hσ; simp [ha σ hσ, hb σ hσ]
    zero_mem' := by intro σ _; simp
    neg_mem' := by intro a ha σ hσ; simp [ha σ hσ]
    inv_mem' := by intro a ha σ hσ; simp [ha σ hσ] }

/-- A CM type is a generalized CM type of rank 1. -/
def IsCMType (_Ψ : GeneralizedCMType F N) : Prop := N = 1

theorem reflexField_eq_pel (Ψ : GeneralizedCMType F N) (σ : ℂ ≃+* ℂ) (hσ : galois_smul σ Ψ = Ψ)
    (z : ℂ) (hz : z ∈ Ψ.reflexField) : σ z = z := hz σ hσ

/-- `Ψ = NΦ − τ_∞ + τ_∞^c` (LTXZZ Lemma 4.2.1 signature). -/
def nPhi_sub (_Φ : GeneralizedCMType F 1) (_τ : F →+* ℂ) (N : ℕ) : GeneralizedCMType F N := sorry

end GeneralizedCMType

-- TauCeti.PEL.tests.gcmType_reflex_imagQuad
example {F : Type*} [Field F] (Ψ : GeneralizedCMType F 3) (τ : F →+* ℂ) (h : Ψ.coeff τ = 2) :
    Ψ.coeff (NumberField.ComplexEmbedding.conjugate τ) = 1 := by
  have := Ψ.sum_conj τ; omega
-- TauCeti.PEL.tests.gcmType_cm_rank1
example {F : Type*} [Field F] (Ψ : GeneralizedCMType F 1) (τ : F →+* ℂ) :
    Ψ.IsCMType ∧ (Ψ.coeff τ = 0 ∨ Ψ.coeff τ = 1) := by
  refine ⟨rfl, ?_⟩; have := Ψ.sum_conj τ; omega
-- TauCeti.PEL.tests.gcmType_not
example {F : Type*} [Field F] (N : ℕ) (c : (F →+* ℂ) →₀ ℕ) (τ₁ : F →+* ℂ)
    (h₁ : c τ₁ + c (NumberField.ComplexEmbedding.conjugate τ₁) = 2) (h₂ : N = 3) :
    ¬ ∃ Ψ : GeneralizedCMType F N, Ψ.coeff = c := by
  rintro ⟨Ψ, rfl⟩; have := Ψ.sum_conj τ₁; omega

/-- The reflexive closure `F_rflx = F · ⋂_Φ F_Φ` (published definition). -/
def CMField.reflexiveClosure (F : Subfield ℂ) (reflexOfCMTypes : Set (Subfield ℂ)) : Subfield ℂ :=
  F ⊔ sInf reflexOfCMTypes

namespace CMField

theorem reflexiveClosure_isCM (F : Subfield ℂ) (S : Set (Subfield ℂ)) :
    F ≤ reflexiveClosure F S := le_sup_left

theorem reflexiveClosure_galois (F : Subfield ℂ) (S : Set (Subfield ℂ)) :
    sInf S ≤ reflexiveClosure F S := le_sup_right

theorem reflexiveClosure_eq_of_galois (F : Subfield ℂ) (S : Set (Subfield ℂ))
    (h : ∀ K ∈ S, K ≤ F) (hS : S.Nonempty) : reflexiveClosure F S = F := by
  apply le_antisymm (sup_le le_rfl ?_) le_sup_left
  obtain ⟨K, hK⟩ := hS
  exact (sInf_le hK).trans (h K hK)

theorem reflexiveClosure_eq_of_imagQuad (F K : Subfield ℂ) (S : Set (Subfield ℂ)) (hK : K ∈ S)
    (hKF : K ≤ F) : reflexiveClosure F S = F :=
  le_antisymm (sup_le le_rfl ((sInf_le hK).trans hKF)) le_sup_left

theorem reflexiveClosure_le_galoisClosure (F G : Subfield ℂ) (S : Set (Subfield ℂ))
    (hF : F ≤ G) (hS : ∃ K ∈ S, K ≤ G) : reflexiveClosure F S ≤ G := by
  obtain ⟨K, hK, hKG⟩ := hS
  exact sup_le hF ((sInf_le hK).trans hKG)

end CMField

-- TauCeti.PEL.tests.reflexiveClosure_imagQuad
example (F : Subfield ℂ) : CMField.reflexiveClosure F {F} = F :=
  CMField.reflexiveClosure_eq_of_imagQuad F F {F} rfl le_rfl
-- TauCeti.PEL.tests.reflexiveClosure_galois
example (F : Subfield ℂ) (S : Set (Subfield ℂ)) (h : ∀ K ∈ S, K ≤ F) (hS : S.Nonempty) :
    CMField.reflexiveClosure F S = F := CMField.reflexiveClosure_eq_of_galois F S h hS
-- TauCeti.PEL.tests.reflexiveClosure_not_intersection_alone
example (F K₁ K₂ : Subfield ℂ) (h : K₁ ⊓ K₂ = ⊥) (hK : K₁ ≤ F) :
    CMField.reflexiveClosure F {K₁, K₂} = F ∧ sInf ({K₁, K₂} : Set (Subfield ℂ)) = ⊥ := by
  refine ⟨CMField.reflexiveClosure_eq_of_imagQuad F K₁ _ (by simp) hK, by rw [sInf_pair, h]⟩

/-- `ℚ_p^τ`: the subfield of `ℚ̄_p` generated over `ℚ_p` by `τ(F)`, for a `p`-adic embedding
`τ : F → ℚ̄_p` (via the fixed `ι_p : ℂ ≅ ℚ̄_p`). -/
def tauField (p : ℕ) [Fact p.Prime] {F : Type*} [Field F] (τ : F →+* AlgebraicClosure ℚ_[p]) :
    IntermediateField ℚ_[p] (AlgebraicClosure ℚ_[p]) :=
  IntermediateField.adjoin ℚ_[p] (Set.range τ)

/-- `ℚ_p^◇`, the composite of all `ℚ_p^τ`. -/
def diamondField (p : ℕ) [Fact p.Prime] (F : Type*) [Field F] :
    IntermediateField ℚ_[p] (AlgebraicClosure ℚ_[p]) :=
  ⨆ τ : F →+* AlgebraicClosure ℚ_[p], tauField p τ

/-- `ℚ_p^Ψ = ℚ_p · F · F_Ψ`, given the `p`-adic image of the reflex field. -/
def psiField (p : ℕ) [Fact p.Prime] {F : Type*} [Field F] (τ : F →+* AlgebraicClosure ℚ_[p])
    (reflex : IntermediateField ℚ_[p] (AlgebraicClosure ℚ_[p])) :
    IntermediateField ℚ_[p] (AlgebraicClosure ℚ_[p]) :=
  tauField p τ ⊔ reflex

/-- The `τ`-part `ℱ_τ` of a module with an `O_F`-action through `τ : O_F → R`. -/
def tauPart {R : Type*} [CommRing R] {OF : Type*} [CommRing OF] {M : Type*} [AddCommGroup M]
    [Module R M] [Module OF M] (τ : OF →+* R) : AddSubgroup M where
  carrier := {m | ∀ a : OF, a • m = τ a • m}
  add_mem' := by intro x y hx hy a; simp [smul_add, hx a, hy a]
  zero_mem' := by intro a; simp
  neg_mem' := by intro x hx a; simp [smul_neg, hx a]

theorem tauPart_decomp {R : Type*} [CommRing R] {OF : Type*} [CommRing OF] {M : Type*}
    [AddCommGroup M] [Module R M] [Module OF M] {ι : Type*} [Fintype ι] (τ : ι → (OF →+* R))
    (hdec : ∀ m : M, ∃ v : ι → M, (∀ i, v i ∈ tauPart (M := M) (τ i)) ∧ m = ∑ i, v i) :
    ⨆ i, tauPart (M := M) (τ i) = ⊤ := sorry

/-- The `p`-Frobenius on embeddings `Σ_∞ = Hom(O_F, 𝔽_p^◇)`. -/
def frobeniusOnEmbeddings (p : ℕ) [Fact p.Prime] {OF k : Type*} [CommRing OF] [Field k]
    [CharP k p] (τ : OF →+* k) : OF →+* k := (frobenius k p).comp τ

theorem tauPart_frobeniusTwist {OF k : Type*} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] (τ : OF →+* k) (a : OF) :
    frobeniusOnEmbeddings p τ a = τ a ^ p := rfl

-- TauCeti.PEL.tests.tauField_split
example (p : ℕ) [Fact p.Prime] {F : Type*} [Field F] (τ : F →+* AlgebraicClosure ℚ_[p])
    (h : ∀ a, τ a ∈ Set.range (algebraMap ℚ_[p] (AlgebraicClosure ℚ_[p]))) :
    tauField p τ = ⊥ := sorry
-- TauCeti.PEL.tests.tauField_inert
example (p : ℕ) [Fact p.Prime] {F : Type*} [Field F] (τ : F →+* AlgebraicClosure ℚ_[p])
    (x : F) (hx : x ^ 2 = -1) (hp : ¬ ∃ y : ℚ_[p], y ^ 2 = -1) :
    Module.finrank ℚ_[p] (tauField p τ) = 2 := sorry
-- TauCeti.PEL.tests.tauPart_ramified
example {R OF : Type*} [CommRing R] [CommRing OF] {M : Type*} [AddCommGroup M] [Module R M]
    [Module OF M] (τ : OF →+* R) (π : OF) (m : M) (hπ : τ π = 0) (hm : π • m ≠ 0) :
    m ∉ tauPart (R := R) (M := M) τ := fun h => hm (by rw [h π, hπ, zero_smul])
-- TauCeti.PEL.tests.tauPart_zero
example {R OF : Type*} [CommRing R] [CommRing OF] (τ : OF →+* R) :
    tauPart (R := R) (M := PUnit) τ = ⊤ := by ext; simp [tauPart]

end M0

/-! ## Carriers for M1–M6

Abelian schemes over a base, their duals, torsion, Lie algebras and Tate modules belong to
AbelianSchemesAndArithmeticModuli A1–A4 and are not in the pinned libraries (Tau Ceti has abelian
varieties over a field, `TauCeti.AlgebraicGeometry.AbelianVariety`). They enter here through the
data-only carrier `AbelianScheme` and the supplier structure `AbelianSchemeSupplier`, over an
affine base `Spec R`. Group axioms, geometric connectedness, positivity of polarizations and the
Weil pairing's properties are omitted from the carriers; the packet states them. -/

universe u

/-- Abelian schemes over `S` (data-only carrier of AbelianSchemesAndArithmeticModuli A1). -/
structure AbelianScheme (S : Scheme.{u}) where
  X : Scheme.{u}
  π : X ⟶ S
  zero : S ⟶ X
  zero_π : zero ≫ π = 𝟙 S
  proper : IsProper π
  smooth : Smooth π

/-- Morphisms of abelian schemes over `S` (scheme maps over `S`). -/
@[ext] structure AbelianScheme.Hom {S : Scheme.{u}} (A B : AbelianScheme S) where
  f : A.X ⟶ B.X
  comm : f ≫ B.π = A.π

/-- Supplier data over `Spec R` (AbelianSchemesAndArithmeticModuli A2–A4): duals, composition,
multiplication by integers, Lie algebras with endomorphism action, and `n`-torsion with the
Weil-pairing target `μ_n`. -/
structure AbelianSchemeSupplier (R : CommRingCat.{u}) where
  dual : AbelianScheme (Spec R) → AbelianScheme (Spec R)
  dualHom : ∀ {A B : AbelianScheme (Spec R)}, A.Hom B → (dual B).Hom (dual A)
  comp : ∀ {A B C : AbelianScheme (Spec R)}, A.Hom B → B.Hom C → A.Hom C
  mulBy : ∀ A : AbelianScheme (Spec R), ℤ → A.Hom A
  lie : AbelianScheme (Spec R) → ModuleCat.{u} R
  lieAct : ∀ {A : AbelianScheme (Spec R)}, A.Hom A → Module.End R (lie A)
  torsion : AbelianScheme (Spec R) → ℕ → Type u
  torsionGroup : ∀ A n, AddCommGroup (torsion A n)

attribute [instance] AbelianSchemeSupplier.torsionGroup

/-! ## M1. The moduli functors and descent -/

section M1
variable {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)

/-- A quasi-isogeny `A ⇢ B`: a homomorphism `f` with a denominator `n` (`f/n`). -/
structure QuasiIsogeny (A B : AbelianScheme (Spec R)) where
  num : A.Hom B
  den : ℕ
  den_pos : 0 < den

namespace QuasiIsogeny
variable {A B C : AbelianScheme (Spec R)}

/-- Prime to a set of primes: the denominator is prime to `□` (kernel ranks are an A3 notion). -/
def IsPrimeTo (box : Set ℕ) (f : QuasiIsogeny A B) : Prop := ∀ p ∈ box, ¬ p ∣ f.den

/-- The dual quasi-isogeny. -/
def dual (f : QuasiIsogeny A B) : QuasiIsogeny (𝒜.dual B) (𝒜.dual A) :=
  ⟨𝒜.dualHom f.num, f.den, f.den_pos⟩

/-- Composition. -/
def comp (f : QuasiIsogeny A B) (g : QuasiIsogeny B C) : QuasiIsogeny A C :=
  ⟨𝒜.comp f.num g.num, f.den * g.den, Nat.mul_pos f.den_pos g.den_pos⟩

/-- LTXZZ: `cφ` is a homomorphism for some `c ∈ ℤ_(p)^×`. -/
def IsQuasiP (p : ℕ) (f : QuasiIsogeny A B) : Prop := ¬ p ∣ f.den

/-- Every homomorphism (in particular an isogeny) is a quasi-isogeny. -/
def ofIsogeny (f : A.Hom B) : QuasiIsogeny A B := ⟨f, 1, Nat.one_pos⟩

end QuasiIsogeny

/-- A `ℤ_(□)^×`-polarization `λ : A ⇢ A^∨` (positivity is the A2 notion, omitted). -/
structure BoxPolarization (box : Set ℕ) (A : AbelianScheme (Spec R)) where
  toQuasiIsogeny : QuasiIsogeny A (𝒜.dual A)
  primeTo : toQuasiIsogeny.IsPrimeTo box

namespace BoxPolarization
variable {𝒜} {box : Set ℕ} {A B : AbelianScheme (Spec R)}

/-- `f^∨ ∘ λ ∘ f`. -/
def pullback (pol' : BoxPolarization 𝒜 box B) (f : QuasiIsogeny A B) (hf : f.IsPrimeTo box) :
    BoxPolarization 𝒜 box A :=
  ⟨(f.comp 𝒜 pol'.toQuasiIsogeny).comp 𝒜 (f.dual 𝒜), sorry⟩

theorem inv_pos (pol' : BoxPolarization 𝒜 box A) : 0 < pol'.toQuasiIsogeny.den := pol'.toQuasiIsogeny.den_pos

end BoxPolarization

-- TauCeti.PEL.tests.quasiIsogeny_mulBy
example (A : AbelianScheme (Spec R)) (n : ℕ) (box : Set ℕ) (hn : ∀ p ∈ box, ¬ p ∣ n)
    (hn0 : 0 < n) : (⟨𝒜.mulBy A n, n, hn0⟩ : QuasiIsogeny A A).IsPrimeTo box := hn
-- TauCeti.PEL.tests.quasiIsogeny_id
example (A : AbelianScheme (Spec R)) (f : A.Hom A) (box : Set ℕ) :
    (QuasiIsogeny.ofIsogeny f).IsPrimeTo box := sorry
-- TauCeti.PEL.tests.quasiIsogeny_frobenius_not_primeTo
example (A B : AbelianScheme (Spec R)) (f : A.Hom B) (p : ℕ) (hp : p.Prime) :
    ¬ (⟨f, p, hp.pos⟩ : QuasiIsogeny A B).IsPrimeTo {p} := fun h => h p rfl dvd_rfl
-- TauCeti.PEL.tests.boxPolarization_neg
example (A : AbelianScheme (Spec R)) (box : Set ℕ) (pol' : BoxPolarization 𝒜 box A) :
    0 < pol'.toQuasiIsogeny.den := pol'.inv_pos

/-- A PEL triple `(A, λ, i)` over `Spec R`: `i : O → End(A)` with the Rosati condition
`i(b)^∨ ∘ λ = λ ∘ i(b*)` and the Kottwitz condition on `Lie_{A/R}` (a basis `α` of `O` and the
reflex polynomial `detV₀` are fixed). Positivity of `λ` is the A2 notion, omitted. -/
structure PELTriple (O : Type*) [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι]
    [DecidableEq ι] (α : ι → O) (detV₀ : MvPolynomial ι R) where
  A : AbelianScheme (Spec R)
  pol : BoxPolarization 𝒜 box A
  i : O → A.Hom A
  rosati : ∀ b : O, 𝒜.comp pol.toQuasiIsogeny.num (𝒜.dualHom (i b)) =
    𝒜.comp (i (star b)) pol.toQuasiIsogeny.num
  lieFree : Module.Free R (𝒜.lie A)
  lieFinite : Module.Finite R (𝒜.lie A)

namespace PELTriple
variable {𝒜} {O : Type*} [Ring O] [StarRing O] {box : Set ℕ} {ι : Type*} [Fintype ι]
  [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι R}

/-- The determinant condition on `Lie_{A/R}`. -/
def detCondition (T : PELTriple 𝒜 O box α detV₀) : Prop :=
  letI := T.lieFree; letI := T.lieFinite
  SatisfiesDetCondition (fun j => 𝒜.lieAct (T.i (α j))) detV₀

/-- Isomorphisms of PEL triples. -/
structure Hom (T T' : PELTriple 𝒜 O box α detV₀) where
  f : T.A.Hom T'.A
  g : T'.A.Hom T.A
  pol : 𝒜.comp f (𝒜.comp T'.pol.toQuasiIsogeny.num (𝒜.dualHom f)) = T.pol.toQuasiIsogeny.num
  equivariant : ∀ b, 𝒜.comp (T.i b) f = 𝒜.comp f (T'.i b)

/-- Base change (supplied by A1 base change of abelian schemes). -/
def pullback {R' : CommRingCat.{u}} (𝒜' : AbelianSchemeSupplier R') (_φ : R ⟶ R')
    (_T : PELTriple 𝒜 O box α detV₀) (detV₀' : MvPolynomial ι R') :
    PELTriple 𝒜' O box α detV₀' := sorry

theorem relDim (T : PELTriple 𝒜 O box α detV₀) (d : ℕ) (hd : detV₀.IsHomogeneous d)
    (h0 : detV₀ ≠ 0) [Nontrivial R] (h : T.detCondition) : Module.finrank R (𝒜.lie T.A) = d := by
  let _ := T.lieFree; let _ := T.lieFinite; exact SatisfiesDetCondition.rank h d hd h0

theorem siegel (T : PELTriple 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 2)) :
    T.detCondition ↔ (letI := T.lieFree; letI := T.lieFinite; Module.finrank R (𝒜.lie T.A) = 2) :=
  sorry

/-- Over a field the abelian scheme is an abelian variety (Tau Ceti
`TauCeti.AlgebraicGeometry.AbelianVariety`); here: the structure map is proper. -/
theorem toAbelianVariety (T : PELTriple 𝒜 O box α detV₀) : IsProper T.A.π := T.A.proper

end PELTriple

-- TauCeti.PEL.tests.pelTriple_siegel
example (T : PELTriple 𝒜 ℤ ∅ (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 2)) :
    T.detCondition ↔ (letI := T.lieFree; letI := T.lieFinite; Module.finrank R (𝒜.lie T.A) = 2) :=
  T.siegel
-- TauCeti.PEL.tests.pelTriple_rosati_fails
example (box : Set ℕ) (α : Fin 2 → GaussianInt) (detV₀ : MvPolynomial (Fin 2) R)
    (T : PELTriple 𝒜 GaussianInt box α detV₀) :
    𝒜.comp T.pol.toQuasiIsogeny.num (𝒜.dualHom (T.i ⟨0, 1⟩)) =
      𝒜.comp (T.i ⟨0, -1⟩) T.pol.toQuasiIsogeny.num := T.rosati ⟨0, 1⟩
-- TauCeti.PEL.tests.pelTriple_zero
example (T : PELTriple 𝒜 ℤ ∅ (fun _ : Unit => (1 : ℤ)) 1) [Nontrivial R] (h : T.detCondition) :
    (letI := T.lieFree; letI := T.lieFinite; Module.finrank R (𝒜.lie T.A)) = 0 := by
  let _ := T.lieFree; let _ := T.lieFinite
  exact SatisfiesDetCondition.rank h 0 (MvPolynomial.isHomogeneous_one _ _) one_ne_zero
-- TauCeti.PEL.tests.pelTriple_det_picard
example {O : Type*} [Ring O] [StarRing O] {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι]
    {α : ι → O} {detV₀ : MvPolynomial ι R} (T : PELTriple 𝒜 O box α detV₀) [Nontrivial R]
    (hd : detV₀.IsHomogeneous 3) (h0 : detV₀ ≠ 0) (h : T.detCondition) :
    Module.finrank R (𝒜.lie T.A) = 3 := T.relDim 3 hd h0 h

/-- `O_F`-abelian schemes `(A, i)`. -/
structure OFAbelianScheme (R : CommRingCat.{u}) (OF : Type*) [CommRing OF] where
  A : AbelianScheme (Spec R)
  i : OF → A.Hom A

/-- Unitary `O_F`-abelian schemes `(A, i, λ)` with `i(a^c)^∨ ∘ λ = λ ∘ i(a)`. -/
structure UnitaryOFAbelianScheme (OF : Type*) [CommRing OF] [StarRing OF] extends
    OFAbelianScheme R OF where
  pol : QuasiIsogeny A (𝒜.dual A)
  compat : ∀ a : OF, 𝒜.comp pol.num (𝒜.dualHom (i (star a))) = 𝒜.comp (i a) pol.num

namespace OFAbelianScheme
variable {OF : Type*} [CommRing OF]

/-- Signature type `Ψ`: `charpoly(i(a) | Lie) = ∏_τ (T − τ(a))^{r_τ}`. -/
def HasSignatureType (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ) :
    Prop :=
  ∀ a : OF, LinearMap.charpoly (𝒜.lieAct (X.i a)) = ∏ s, (Polynomial.X - Polynomial.C (τ s a)) ^ r s

end OFAbelianScheme

namespace HasSignatureType
variable {OF : Type*} [CommRing OF]

theorem iff_detCondition (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → OF) :
    OFAbelianScheme.HasSignatureType 𝒜 X τ r ↔ SatisfiesDetCondition (fun j => 𝒜.lieAct (X.i (α j)))
      (∏ s, (∑ j, MvPolynomial.C (τ s (α j)) * MvPolynomial.X j) ^ r s) := sorry

theorem dim (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)] [Module.Finite R (𝒜.lie X.A)]
    {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ) [Nontrivial R]
    (h : OFAbelianScheme.HasSignatureType 𝒜 X τ r) : Module.finrank R (𝒜.lie X.A) = ∑ s, r s := sorry

theorem hodge_tau (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ)
    (h : OFAbelianScheme.HasSignatureType 𝒜 X τ r) (s : κ) :
    r s ≤ Module.finrank R (𝒜.lie X.A) := sorry

end HasSignatureType

namespace UnitaryOFAbelianScheme
variable {𝒜} {OF : Type*} [CommRing OF] [StarRing OF]

/-- The pairing `⟨·,·⟩_{λ,τ}` on de Rham homology (A4 data, here on the Lie module). -/
def pairingTau (_X : UnitaryOFAbelianScheme 𝒜 OF) : LinearMap.BilinForm R (𝒜.lie _X.A) := sorry

theorem pairingTau_perfect (X : UnitaryOFAbelianScheme 𝒜 OF) (hp : X.pol.den = 1) :
    X.pairingTau.Nondegenerate := sorry

/-- A unitary `O_F`-abelian scheme as a PEL triple (with `* = c`). -/
def toPELTriple (X : UnitaryOFAbelianScheme 𝒜 OF) (box : Set ℕ) (hbox : X.pol.IsPrimeTo box)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → OF) (detV₀ : MvPolynomial ι R)
    [Module.Free R (𝒜.lie X.A)] [Module.Finite R (𝒜.lie X.A)] :
    PELTriple 𝒜 OF box α detV₀ :=
  { A := X.A, pol := ⟨X.pol, hbox⟩, i := X.i, rosati := sorry, lieFree := inferInstance,
    lieFinite := inferInstance }

end UnitaryOFAbelianScheme

-- TauCeti.PEL.tests.signatureType_cm_elliptic
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] (τ : OF →+* R) :
    OFAbelianScheme.HasSignatureType 𝒜 X (fun _ : Fin 1 => τ) (fun _ => 1) ↔
      ∀ a, LinearMap.charpoly (𝒜.lieAct (X.i a)) = Polynomial.X - Polynomial.C (τ a) := by
  simp [OFAbelianScheme.HasSignatureType]
-- TauCeti.PEL.tests.signatureType_conj
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] [Nontrivial R] (τ τ' : OF →+* R)
    (h : OFAbelianScheme.HasSignatureType 𝒜 X (fun _ : Fin 1 => τ) (fun _ => 1))
    (h' : OFAbelianScheme.HasSignatureType 𝒜 X (fun _ : Fin 1 => τ') (fun _ => 1)) : τ = τ' := sorry
-- TauCeti.PEL.tests.signatureType_iff_det
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] (τ : Fin 2 → OF →+* R) (r : Fin 2 → ℕ) (α : Fin 2 → OF) :
    OFAbelianScheme.HasSignatureType 𝒜 X τ r ↔ SatisfiesDetCondition (fun j => 𝒜.lieAct (X.i (α j)))
      (∏ s, (∑ j, MvPolynomial.C (τ s (α j)) * MvPolynomial.X j) ^ r s) :=
  HasSignatureType.iff_detCondition 𝒜 X τ r α
-- TauCeti.PEL.tests.unitary_zero
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] [Nontrivial R] (τ : Fin 2 → OF →+* R)
    (h : OFAbelianScheme.HasSignatureType 𝒜 X τ 0) : Module.finrank R (𝒜.lie X.A) = 0 := by
  rw [HasSignatureType.dim 𝒜 X τ 0 h]; simp

/-! ### Tate-module trivializations and level structures (finite level `n`) -/

/-- Supplier data for torsion and Weil pairings (AbelianSchemesAndArithmeticModuli A3):
`A[n]` at a geometric point as an abelian group, the `λ`-Weil pairing with values in `ZMod n`
(after trivializing `μ_n`), and the reduction maps `A[nm] → A[n]`. -/
structure TorsionSupplier where
  torsion : ℕ → Type u
  group : ∀ n, AddCommGroup (torsion n)
  weil : ∀ n, torsion n → torsion n → ZMod n
  reduce : ∀ {m n : ℕ}, m ∣ n → torsion n → torsion m

attribute [instance] TorsionSupplier.group

section SymplecticIsomSheaf
variable (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L]
  (form : LinearMap.BilinForm ℤ L)

/-- The level-`n` symplectic similitudes `L/nL ≅ A[n]` with multiplier (the stalk of the étale
sheaf of symplectic trivializations at a geometric point, at level `n`). -/
def symplecticIsomSheaf (n : ℕ) : Set (((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) :=
  {p | ∀ x y, 𝒯.weil n (p.1 x) (p.1 y) = (p.2 : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) form x y}

/-- Right action of similitudes `(g, r)` of `L/nL`. -/
def symplecticIsomSheaf.act {n : ℕ} (g : (ZMod n ⊗[ℤ] L) ≃+ (ZMod n ⊗[ℤ] L)) (r : (ZMod n)ˣ)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) :
    ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ :=
  (g.trans p.1, p.2 * r)

theorem symplecticIsomSheaf.torsor (n : ℕ) (p q : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ)
    (_hp : p ∈ symplecticIsomSheaf 𝒯 form n) (_hq : q ∈ symplecticIsomSheaf 𝒯 form n) :
    ∃ g r, q = symplecticIsomSheaf.act 𝒯 g r p := by
  refine ⟨q.1.trans p.1.symm, p.2⁻¹ * q.2, ?_⟩
  ext x <;> simp [symplecticIsomSheaf.act]

/-- A Galois (or `π₁`) automorphism of `A[n]` scaling the Weil pairing acts on trivializations. -/
theorem symplecticIsomSheaf.galois (n : ℕ) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n) (c : (ZMod n)ˣ)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = (c : ZMod n) * 𝒯.weil n x y)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomSheaf 𝒯 form n) :
    (p.1.trans σ, c * p.2) ∈ symplecticIsomSheaf 𝒯 form n := by
  intro x y; simp only [AddEquiv.trans_apply, Units.val_mul]; rw [hσ, hp x y]; ring

/-- Reduction from level `n` to level `m ∣ n`, compatible with the supplier's `A[n] → A[m]`. -/
theorem symplecticIsomSheaf.reduce {m n : ℕ} (hmn : m ∣ n)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomSheaf 𝒯 form n) :
    ∃ q ∈ symplecticIsomSheaf 𝒯 form m, ∀ x : L, q.1 (1 ⊗ₜ x) = 𝒯.reduce hmn (p.1 (1 ⊗ₜ x)) :=
  sorry

/-- The rational variant: `ℚ`-linear similitudes `V ≅ V(A)` with multiplier in `ℚˣ`. -/
def symplecticIsomSheaf.rational (V T : Type*) [AddCommGroup V] [Module ℚ V] [AddCommGroup T]
    [Module ℚ T] (formV : LinearMap.BilinForm ℚ V) (formT : LinearMap.BilinForm ℚ T) :
    Set ((V ≃ₗ[ℚ] T) × ℚˣ) :=
  {p | ∀ x y, formT (p.1 x) (p.1 y) = (p.2 : ℚ) * formV x y}

/-- Transport along an isomorphism of torsion groups preserving the pairing (base change). -/
theorem symplecticIsomSheaf.baseChange (n : ℕ) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = 𝒯.weil n x y)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomSheaf 𝒯 form n) :
    (p.1.trans σ, p.2) ∈ symplecticIsomSheaf 𝒯 form n := by
  intro x y; simp only [AddEquiv.trans_apply]; rw [hσ, hp x y]

end SymplecticIsomSheaf

-- TauCeti.PEL.tests.symplecticIsom_siegel_points
example (𝒯 : TorsionSupplier.{u}) (n : ℕ) [NeZero n]
    (p : ((ZMod n ⊗[ℤ] (Fin 2 ⊕ Fin 2 → ℤ)) ≃+ 𝒯.torsion n) × (ZMod n)ˣ)
    (hp : p ∈ symplecticIsomSheaf 𝒯 (Matrix.toBilin' (Matrix.J (Fin 2) ℤ)) n) :
    Nat.card (symplecticIsomSheaf 𝒯 (Matrix.toBilin' (Matrix.J (Fin 2) ℤ)) n) =
      Nat.card {gr : ((ZMod n ⊗[ℤ] (Fin 2 ⊕ Fin 2 → ℤ)) ≃+ (ZMod n ⊗[ℤ] (Fin 2 ⊕ Fin 2 → ℤ))) × (ZMod n)ˣ //
        ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) (Matrix.toBilin' (Matrix.J (Fin 2) ℤ))
          (gr.1 x) (gr.1 y) = (gr.2 : ZMod n) *
            LinearMap.BilinForm.baseChange (ZMod n) (Matrix.toBilin' (Matrix.J (Fin 2) ℤ)) x y} :=
  sorry
-- TauCeti.PEL.tests.symplecticIsom_multiplier
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] (form : LinearMap.BilinForm ℤ L)
    (n : ℕ) (g : (ZMod n ⊗[ℤ] L) ≃+ (ZMod n ⊗[ℤ] L)) (r : (ZMod n)ˣ)
    (hg : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form (g x) (g y) =
      (r : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) form x y)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomSheaf 𝒯 form n) :
    symplecticIsomSheaf.act 𝒯 g r p ∈ symplecticIsomSheaf 𝒯 form n ∧
      (symplecticIsomSheaf.act 𝒯 g r p).2 = p.2 * r := by
  refine ⟨fun x y => ?_, rfl⟩
  simp only [symplecticIsomSheaf.act, AddEquiv.trans_apply, Units.val_mul]
  rw [hp (g x) (g y), hg]; ring
-- TauCeti.PEL.tests.symplecticIsom_empty
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] (form : LinearMap.BilinForm ℤ L)
    (n : ℕ) (hform : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form x y = 0)
    (hweil : ∃ a b, 𝒯.weil n a b ≠ 0) : symplecticIsomSheaf 𝒯 form n = ∅ := sorry
-- TauCeti.PEL.tests.symplecticIsom_zero
example (𝒯 : TorsionSupplier.{u}) (n : ℕ) [NeZero n] [Subsingleton (𝒯.torsion n)]
    (form : LinearMap.BilinForm ℤ (Fin 0 → ℤ)) :
    Nat.card (symplecticIsomSheaf 𝒯 form n) = Nat.totient n := sorry

/-- A principal level-`n` structure `(α_n, ν_n)`, liftable to every level `nm`. -/
structure PrincipalLevel (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L]
    (form : LinearMap.BilinForm ℤ L) (n : ℕ) where
  α : (ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n
  ν : (ZMod n)ˣ
  symplectic : (α, ν) ∈ symplecticIsomSheaf 𝒯 form n

namespace PrincipalLevel
variable {𝒯 : TorsionSupplier.{u}} {L : Type*} [AddCommGroup L]
  {form : LinearMap.BilinForm ℤ L} {n : ℕ}

/-- Liftability: for every `m` there is a level-`nm` structure reducing to `α` (the finite-level
form of lifting to `L ⊗ Ẑ^□ ≅ T^□A`). -/
def liftable (P : PrincipalLevel 𝒯 form n) : Prop :=
  ∀ m : ℕ, ∃ Q : PrincipalLevel 𝒯 form (n * m),
    ∀ x : L, 𝒯.reduce (Dvd.intro m rfl) (Q.α (1 ⊗ₜ x)) = P.α (1 ⊗ₜ x)

/-- A level structure forces `ker λ ≅ (L^#/L) ⊗ Ẑ^□`; at level `n`: the radical of the `λ`-Weil
pairing on `A[n]` (that is, `(ker λ)[n]`) matches the radical of the form on `L/nL`. -/
theorem ker_polarization (P : PrincipalLevel 𝒯 form n) :
    Nat.card {x : 𝒯.torsion n // ∀ y, 𝒯.weil n x y = 0} =
      Nat.card {x : ZMod n ⊗[ℤ] L // ∀ y, LinearMap.BilinForm.baseChange (ZMod n) form x y = 0} :=
  sorry

/-- Base change: transport along a pairing-preserving isomorphism. -/
def pullback (P : PrincipalLevel 𝒯 form n) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = 𝒯.weil n x y) : PrincipalLevel 𝒯 form n :=
  ⟨P.α.trans σ, P.ν, symplecticIsomSheaf.baseChange 𝒯 form n σ hσ _ P.symplectic⟩

/-- Reduction from level `n` to `m ∣ n` (needs the supplier's compatible reduction maps). -/
def reduce (P : PrincipalLevel 𝒯 form n) {m : ℕ} (_hmn : m ∣ n) : PrincipalLevel 𝒯 form m := sorry

/-- Action of a similitude `(g, r)` of `L/nL`. -/
def act (P : PrincipalLevel 𝒯 form n) (g : (ZMod n ⊗[ℤ] L) ≃+ (ZMod n ⊗[ℤ] L)) (r : (ZMod n)ˣ)
    (hg : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form (g x) (g y) =
      (r : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) form x y) :
    PrincipalLevel 𝒯 form n :=
  ⟨g.trans P.α, P.ν * r, by
    intro x y; simp only [AddEquiv.trans_apply, Units.val_mul]
    rw [P.symplectic (g x) (g y), hg]; ring⟩

/-- The multiplier is data: two structures with the same `α` and different `ν` can coexist when
the reduced form vanishes (e.g. `L = ℓ·L_std`, `n = ℓ`). -/
theorem multiplier_data (P Q : PrincipalLevel 𝒯 form n) (h : P.α = Q.α)
    (hform : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form x y = 0) :
    (P.α, Q.ν) ∈ symplecticIsomSheaf 𝒯 form n := by
  intro x y; rw [hform, mul_zero, h]; exact (Q.symplectic x y).trans (by rw [hform, mul_zero])

end PrincipalLevel

-- TauCeti.PEL.tests.principalLevel_siegel_symplectic
example (𝒯 : TorsionSupplier.{u}) (P : PrincipalLevel 𝒯 (Matrix.toBilin' !![0, 1; -1, 0]) 3) :
    𝒯.weil 3 (P.α (1 ⊗ₜ Pi.single 0 1)) (P.α (1 ⊗ₜ Pi.single 1 1)) = P.ν := sorry
-- TauCeti.PEL.tests.principalLevel_multiplier_scaled
example (𝒯 : TorsionSupplier.{u}) (ℓ : ℕ)
    (P Q : PrincipalLevel 𝒯 ((ℓ : ℤ) • Matrix.toBilin' !![0, 1; -1, 0]) ℓ) (h : P.α = Q.α) :
    (P.α, Q.ν) ∈ symplecticIsomSheaf 𝒯 ((ℓ : ℤ) • Matrix.toBilin' !![0, 1; -1, 0]) ℓ :=
  PrincipalLevel.multiplier_data P Q h (fun x y => sorry)
-- TauCeti.PEL.tests.principalLevel_n_one
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] (form : LinearMap.BilinForm ℤ L)
    (P Q : PrincipalLevel 𝒯 form 1) : P.ν = Q.ν := Subsingleton.elim _ _
-- TauCeti.PEL.tests.principalLevel_zero
example (𝒯 : TorsionSupplier.{u}) (n : ℕ) [NeZero n] [Subsingleton (𝒯.torsion n)]
    (form : LinearMap.BilinForm ℤ (Fin 0 → ℤ)) :
    Nat.card (PrincipalLevel 𝒯 form n) = Nat.totient n := sorry

/-- An integral level-`H` structure at level `n`: an `H_n`-orbit of principal level structures. -/
structure IntegralLevel (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L]
    (form : LinearMap.BilinForm ℤ L) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)) where
  orbit : Set (PrincipalLevel 𝒯 form n)
  rep : PrincipalLevel 𝒯 form n
  rep_mem : rep ∈ orbit
  orbit_eq : ∀ Q, Q ∈ orbit ↔ ∃ h ∈ Hn, (∀ x, Q.α x = rep.α (h.1 x)) ∧ Q.ν = rep.ν * h.2

/-- A rational level-`H` structure: an `H`-orbit of rational similitudes. -/
structure RationalLevel (V T : Type*) [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    (formV : LinearMap.BilinForm ℚ V) (formT : LinearMap.BilinForm ℚ T)
    (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) where
  orbit : Set ((V ≃ₗ[ℚ] T) × ℚˣ)
  sub : orbit ⊆ symplecticIsomSheaf.rational V T formV formT
  isOrbit : ∃ p₀ ∈ orbit, ∀ p, p ∈ orbit ↔ ∃ h ∈ H, p = (h.1.trans p₀.1, h.2 * p₀.2)

namespace IntegralLevel
variable {𝒯 : TorsionSupplier.{u}} {L : Type*} [AddCommGroup L]
  {form : LinearMap.BilinForm ℤ L} {n : ℕ}
  {Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)}

/-- Construction 1.3.7.10: the associated rational structure (data supplied by A4 Tate modules). -/
def toRational (_I : IntegralLevel 𝒯 form n Hn) (V T : Type*) [AddCommGroup V] [Module ℚ V]
    [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) :
    RationalLevel V T formV formT H := sorry

/-- For `H = U(n)` (trivial `H_n`), integral level structures are principal level structures. -/
def ofPrincipal (P : PrincipalLevel 𝒯 form n) : IntegralLevel 𝒯 form n ⊥ :=
  ⟨{P}, P, rfl, sorry⟩

/-- Base change. -/
def pullback (I : IntegralLevel 𝒯 form n Hn) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = 𝒯.weil n x y) : IntegralLevel 𝒯 form n Hn :=
  ⟨(fun P => P.pullback σ hσ) '' I.orbit, I.rep.pullback σ hσ, ⟨I.rep, I.rep_mem, rfl⟩, sorry⟩

/-- Level change `H'_n ≤ H_n`: the `H_n`-saturation of the representative's orbit. -/
def changeLevel {Hn' : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)}
    (_h : Hn' ≤ Hn) (I : IntegralLevel 𝒯 form n Hn') : IntegralLevel 𝒯 form n Hn where
  orbit := {Q | ∃ h ∈ Hn, (∀ x, Q.α x = I.rep.α (h.1 x)) ∧ Q.ν = I.rep.ν * h.2}
  rep := I.rep
  rep_mem := ⟨1, Hn.one_mem, fun _ => rfl, by simp⟩
  orbit_eq := fun _ => Iff.rfl

end IntegralLevel

namespace RationalLevel
variable {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
  {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}

/-- Lan Corollary 1.3.7.11: a rational structure is integral iff its members map the lattice onto
the Tate module (stated for a given pair of lattices). -/
theorem integral_iff {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (Rl : RationalLevel V T formV formT H)
    (Λ : Submodule ℤ V) (Λ' : Submodule ℤ T) :
    (∀ p ∈ Rl.orbit, Λ.map (p.1.toLinearMap.restrictScalars ℤ) = Λ') ↔
      (∀ p ∈ Rl.orbit, ∀ q ∈ Rl.orbit, Λ.map (p.1.toLinearMap.restrictScalars ℤ) =
        Λ.map (q.1.toLinearMap.restrictScalars ℤ)) ∧
        ∃ p ∈ Rl.orbit, Λ.map (p.1.toLinearMap.restrictScalars ℤ) = Λ' := sorry

/-- Independence of the base point: transport along `T ≅ T'` preserving the pairing. -/
def basepointIndep {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} {T' : Type*} [AddCommGroup T'] [Module ℚ T']
    {formT' : LinearMap.BilinForm ℚ T'} (Rl : RationalLevel V T formV formT H) (e : T ≃ₗ[ℚ] T')
    (he : ∀ x y, formT' (e x) (e y) = formT x y) : RationalLevel V T' formV formT' H := sorry

/-- Level change `[α̂]_{H'} ↦ [α̂]_H`. -/
def changeLevel {H' H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (_h : H' ≤ H)
    (_Rl : RationalLevel V T formV formT H') : RationalLevel V T formV formT H := sorry

end RationalLevel

-- TauCeti.PEL.tests.level_full_unique
example {𝒯 : TorsionSupplier.{u}} {L : Type*} [AddCommGroup L] {form : LinearMap.BilinForm ℤ L}
    {n : ℕ} (I J : IntegralLevel 𝒯 form n ⊤) : I.orbit = J.orbit := sorry
-- TauCeti.PEL.tests.level_principal_eq
example {𝒯 : TorsionSupplier.{u}} {L : Type*} [AddCommGroup L]
    {form : LinearMap.BilinForm ℤ L} {n : ℕ} (P : PrincipalLevel 𝒯 form n) :
    (IntegralLevel.ofPrincipal P).rep = P := rfl
-- TauCeti.PEL.tests.rationalLevel_not_integral
example (ℓ : ℕ) (hℓ : ℓ.Prime) (p : (Fin 2 → ℚ) ≃ₗ[ℚ] (Fin 2 → ℚ)) (ν : ℚˣ)
    (hp : (p, ν) ∈ symplecticIsomSheaf.rational _ _ (Matrix.toBilin' !![0, 1; -1, 0])
      ((ℓ : ℚ) • Matrix.toBilin' !![0, 1; -1, 0]))
    (hΛ : (Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 2)))).map
      (p.toLinearMap.restrictScalars ℤ) = Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 2)))) :
    (ν : ℚ) = ℓ ∨ (ν : ℚ) = -ℓ := sorry
-- TauCeti.PEL.tests.rationalLevel_change_compose
example {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
    {H'' H' H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (h₁ : H'' ≤ H') (h₂ : H' ≤ H)
    (Rl : RationalLevel V T formV formT H'') :
    (Rl.changeLevel h₁).changeLevel h₂ = Rl.changeLevel (h₁.trans h₂) := sorry

/-! ### The moduli problems -/

section ModuliProblem
variable (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (O : Type*) [Ring O] [StarRing O]
  (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
  (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) {L : Type*} [AddCommGroup L]
  (form : LinearMap.BilinForm ℤ L) (n : ℕ)
  (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ))

/-- Objects of `M_H` over affine bases: `(A, λ, i, α_H)` over `Spec R` (level data at a geometric
point through a torsion supplier). -/
structure PELModuli.moduliProblem where
  R : CommRingCat.{u}
  triple : PELTriple (𝒜 R) O box α (detV₀ R)
  det : triple.detCondition
  torsion : TorsionSupplier.{u}
  level : IntegralLevel torsion form n Hn

namespace PELModuli.moduliProblem

/-- Isomorphisms over a ring map (the fibred-category structure; data supplied with A1 base
change). -/
instance : Category.{u} (PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn) := sorry

/-- The projection to affine schemes. -/
def proj : PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn ⥤ CommRingCat.{u}ᵒᵖ := sorry

theorem obj (x : PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn) :
    ∃ (T : PELTriple (𝒜 x.R) O box α (detV₀ x.R)), T = x.triple ∧ T.detCondition :=
  ⟨x.triple, rfl, x.det⟩

theorem isFibered : (proj 𝒜 O box α detV₀ form n Hn).IsFibered := sorry

/-- `M_n = M_{U(n)}`: principal level `n` is level `H_n = 1`. -/
theorem principal (𝒯 : TorsionSupplier.{u}) (P : PrincipalLevel 𝒯 form n) :
    (IntegralLevel.ofPrincipal P).orbit = {P} := rfl

/-- The presheaf of isomorphism classes `R ↦ M_H(R)/≅` (not a sheaf in general). -/
def isoClasses (R : CommRingCat.{u}) : Type _ :=
  Quot fun (x y : {x : PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn // x.R = R}) =>
    Nonempty (x.1 ≅ y.1)

/-- Level change `M_{H'} → M_H` for `H'_n ≤ H_n` (orbits are enlarged). -/
def changeLevel {Hn' : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)}
    (_h : Hn' ≤ Hn) :
    PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn' →
      PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn :=
  fun x => ⟨x.R, x.triple, x.det, x.torsion, x.level.changeLevel _h⟩

/-- For the Siegel datum (`O = ℤ`, `α = 1`, `detV₀ = X^g`) objects are polarized abelian schemes
of relative dimension `g` with level. -/
theorem siegel (g : ℕ) (x : PELModuli.moduliProblem 𝒜 ℤ box (fun _ : Unit => (1 : ℤ))
    (fun _ => MvPolynomial.X () ^ g) form n Hn) [Nontrivial x.R] :
    (letI := x.triple.lieFree; letI := x.triple.lieFinite;
      Module.finrank x.R ((𝒜 x.R).lie x.triple.A)) = g := by
  sorry

/-- `Aut(A, λ, i, α_H)`. -/
def aut (x : PELModuli.moduliProblem 𝒜 O box α detV₀ form n Hn) : Type _ := x ≅ x

end PELModuli.moduliProblem

end ModuliProblem

-- TauCeti.PEL.tests.moduliProblem_siegel_g1
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (box : Set ℕ) {L : Type*}
    [AddCommGroup L] (form : LinearMap.BilinForm ℤ L) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ))
    (x : PELModuli.moduliProblem 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (fun _ => MvPolynomial.X () ^ 1)
      form n Hn) [Nontrivial x.R] :
    (letI := x.triple.lieFree; letI := x.triple.lieFinite;
      Module.finrank x.R ((𝒜 x.R).lie x.triple.A)) = 1 :=
  PELModuli.moduliProblem.siegel 𝒜 box form n Hn 1 x
-- TauCeti.PEL.tests.moduliProblem_isoClasses_not_sheaf
example : ∃ E E' : WeierstrassCurve ℚ, E.Δ ≠ 0 ∧ E.c₄ ^ 3 * E'.Δ = E'.c₄ ^ 3 * E.Δ ∧
    (¬ ∃ C : WeierstrassCurve.VariableChange ℚ, C • E = E') ∧
    ∃ C : WeierstrassCurve.VariableChange ℂ,
      C • E.map (algebraMap ℚ ℂ) = E'.map (algebraMap ℚ ℂ) := sorry
-- TauCeti.PEL.tests.moduliProblem_zero
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (box : Set ℕ) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] (Fin 0 → ℤ)) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] (Fin 0 → ℤ))) × (ZMod n)ˣ))
    (x : PELModuli.moduliProblem 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (fun _ => 1)
      (0 : LinearMap.BilinForm ℤ (Fin 0 → ℤ)) n Hn) [Nontrivial x.R] :
    (letI := x.triple.lieFree; letI := x.triple.lieFinite;
      Module.finrank x.R ((𝒜 x.R).lie x.triple.A)) = 0 := sorry
-- TauCeti.PEL.tests.moduliProblem_det_matters
example : ¬ SatisfiesDetCondition (M := Fin 3 → ℂ) (ι := Fin 2)
    (fun i => LinearMap.pi fun k =>
      (![![1, Complex.I], ![1, -Complex.I], ![1, -Complex.I]] k i) • LinearMap.proj k)
    (∏ k : Fin 3, ∑ i, MvPolynomial.C (![![1, Complex.I], ![1, Complex.I], ![1, -Complex.I]] k i) *
      MvPolynomial.X i) := sorry

/-- `M^rat_H`: objects as in `M_H` with rational level structures; morphisms are prime-to-`□`
quasi-isogenies (morphisms are A3 data, omitted). -/
structure PELModuli.ratModuliProblem (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R)
    (O : Type*) [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (α : ι → O) (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) (V T : Type*) [AddCommGroup V]
    [Module ℚ V] [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) where
  R : CommRingCat.{u}
  triple : PELTriple (𝒜 R) O box α (detV₀ R)
  level : RationalLevel V T formV formT H

namespace PELModuli.ratModuliProblem
variable {𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
  {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O}
  {detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R} {V T : Type*} [AddCommGroup V] [Module ℚ V]
  [AddCommGroup T] [Module ℚ T] {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
  {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)}

/-- Morphisms: prime-to-`□` quasi-isogenies compatible with `λ` up to `ℤ_(□),>0^×`, `i` and the
level (Lan Definition 1.4.2.4). -/
structure hom (x y : PELModuli.ratModuliProblem 𝒜 O box α detV₀ V T formV formT H) where
  eqR : x.R = y.R
  f : QuasiIsogeny x.triple.A (eqR ▸ y.triple.A)
  primeTo : f.IsPrimeTo box

/-- The rational problem depends only on the rational data: two triples with the same rational
level data define the same objects. -/
theorem dependsOnlyOn (x : PELModuli.ratModuliProblem 𝒜 O box α detV₀ V T formV formT H) :
    x.level.orbit ⊆ symplecticIsomSheaf.rational V T formV formT := x.level.sub

/-- Level change. -/
def changeLevel {H' : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (h : H' ≤ H)
    (x : PELModuli.ratModuliProblem 𝒜 O box α detV₀ V T formV formT H') :
    PELModuli.ratModuliProblem 𝒜 O box α detV₀ V T formV formT H :=
  ⟨x.R, x.triple, x.level.changeLevel h⟩

end PELModuli.ratModuliProblem

-- TauCeti.PEL.tests.ratModuli_scalar_iso
example {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
    {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (Rl : RationalLevel V T formV formT H) (m : ℚˣ) :
    (fun p : (V ≃ₗ[ℚ] T) × ℚˣ => ((LinearEquiv.smulOfUnit m).trans p.1, m ^ 2 * p.2)) '' Rl.orbit =
      (fun p : (V ≃ₗ[ℚ] T) × ℚˣ => (p.1.trans (LinearEquiv.smulOfUnit m), m ^ 2 * p.2)) '' Rl.orbit :=
  sorry
/-- The characteristic-zero adelic problem `M^ad_K`: rational level structures at all primes
(`𝔸_f`-coefficients represented by a rational level datum with full adelic group `H`). -/
abbrev PELModuli.adelicModuli := @PELModuli.ratModuliProblem

namespace PELModuli.adelicModuli

/-- Comparison with the generic fibre of `M^rat_H` (same objects, `□ = ∅`). -/
def ofRational {𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R} {O : Type*} [Ring O]
    [StarRing O] {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O}
    {detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R} {V T : Type*} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup T] [Module ℚ T] {formV : LinearMap.BilinForm ℚ V}
    {formT : LinearMap.BilinForm ℚ T} {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)}
    (x : PELModuli.ratModuliProblem 𝒜 O ∅ α detV₀ V T formV formT H) :
    (PELModuli.adelicModuli 𝒜 O ∅ α detV₀ V T formV formT H) := x

/-- Right action of `G(𝔸_f)`: translating level orbits by `g`. -/
def hecke {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
    {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (g : (V ≃ₗ[ℚ] V) × ℚˣ)
    (hg : ∀ x y, formV (g.1 x) (g.1 y) = (g.2 : ℚ) * formV x y)
    (Rl : RationalLevel V T formV formT H) : RationalLevel V T formV formT H := sorry

end PELModuli.adelicModuli

-- TauCeti.PEL.tests.adelicModuli_full_level_p
example {𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O}
    {detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R} {V T : Type*} [AddCommGroup V] [Module ℚ V]
    [AddCommGroup T] [Module ℚ T] {formV : LinearMap.BilinForm ℚ V}
    {formT : LinearMap.BilinForm ℚ T} (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ))
    (x : PELModuli.ratModuliProblem 𝒜 O ∅ α detV₀ V T formV formT H) :
    PELModuli.adelicModuli 𝒜 O ∅ α detV₀ V T formV formT H :=
  PELModuli.adelicModuli.ofRational x
-- TauCeti.PEL.tests.adelicModuli_not_integral
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] [Module.Free ℤ L]
    [Module.Finite ℤ L] (form : LinearMap.BilinForm ℤ L) (p : ℕ) [Fact p.Prime]
    (hL : 0 < Module.finrank ℤ L)
    (hord : Nat.card (𝒯.torsion p) = p ^ (Module.finrank ℤ L / 2)) :
    IsEmpty (PrincipalLevel 𝒯 form p) := sorry
-- TauCeti.PEL.tests.adelicModuli_zero
example (n : ℕ) [NeZero n] (K : Subgroup (ZMod n)ˣ) :
    Nat.card ((ZMod n)ˣ ⧸ K) * Nat.card K = Nat.totient n := sorry

/-- Isomorphism classes of `M^rat_H` over `R`. -/
def PELModuli.ratModuliProblem.isoClasses (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R)
    (O : Type*) [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (α : ι → O) (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) (V T : Type*) [AddCommGroup V]
    [Module ℚ V] [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) (R : CommRingCat.{u}) :
    Type _ :=
  Quot fun (x y : {x : PELModuli.ratModuliProblem 𝒜 O box α detV₀ V T formV formT H // x.R = R}) =>
    Nonempty (PELModuli.ratModuliProblem.hom x.1 y.1)

/-- Kottwitz's quadruples `(A, λ, i, η̄K^p)` over `R` up to prime-to-`p` isogeny (data). -/
def PELModuli.kottwitzQuadruples (p : ℕ) (V T : Type*) [AddCommGroup V] [Module ℚ V]
    [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) (R : CommRingCat.{u}) :
    Type u := sorry

/-- For `□ = {p}` the iso-class functor is Kottwitz's `S_{K^p}`. -/
theorem PELModuli.ratModuliProblem.kottwitz (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R)
    (p : ℕ) (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial Unit R) (V T : Type*) [AddCommGroup V]
    [Module ℚ V] [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) (R : CommRingCat.{u}) :
    Nonempty (PELModuli.ratModuliProblem.isoClasses 𝒜 ℤ {p} (fun _ : Unit => (1 : ℤ)) detV₀ V T
      formV formT H R ≃ PELModuli.kottwitzQuadruples p V T formV formT H R) := sorry

/-- Milne's quadruples `((A, i), s, ηK)` over `ℂ` (data). -/
def PELModuli.milneQuadruples (V T : Type*) [AddCommGroup V] [Module ℚ V] [AddCommGroup T]
    [Module ℚ T] (formV : LinearMap.BilinForm ℚ V) (formT : LinearMap.BilinForm ℚ T)
    (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) : Type := sorry

/-- Complex points of `M^ad_K` are Milne's quadruples. -/
theorem PELModuli.adelicModuli.complexPoints (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R)
    (O : Type*) [Ring O] [StarRing O] {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
    (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) (V T : Type*) [AddCommGroup V] [Module ℚ V]
    [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) (R : CommRingCat.{u})
    (hR : Nonempty (R ≃+* ℂ)) :
    Nonempty (PELModuli.ratModuliProblem.isoClasses 𝒜 O ∅ α detV₀ V T formV formT H R ≃
      PELModuli.milneQuadruples V T formV formT H) := sorry

/-- The rational level group `H ⊂ G(𝔸^□)` attached to an integral level `H_n` through an isometry
`ℚ ⊗ L ≅ V` (data). -/
def PELModuli.ratLevelGroup {L V : Type*} [AddCommGroup L] [AddCommGroup V] [Module ℚ V] {n : ℕ}
    (_e : ℚ ⊗[ℤ] L ≃ₗ[ℚ] V)
    (_Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)) :
    Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ) := sorry

/-- Lan Proposition 1.4.3.3 (`M1/iso-isogeny-comparison`): `M_H(R) → M^rat_H(R)` is an
equivalence; on isomorphism classes, a bijection. -/
theorem isoIsogenyComparison (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (O : Type*)
    [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
    (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) {L : Type*} [AddCommGroup L]
    (form : LinearMap.BilinForm ℤ L) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ))
    (V T : Type*) [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    (formV : LinearMap.BilinForm ℚ V) (formT : LinearMap.BilinForm ℚ T)
    (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) (R : CommRingCat.{u}) (e : ℚ ⊗[ℤ] L ≃ₗ[ℚ] V)
    (he : ∀ x y, formV (e x) (e y) = LinearMap.BilinForm.baseChange ℚ form x y)
    (hH : H = PELModuli.ratLevelGroup e Hn) :
    Nonempty (PELModuli.moduliProblem.isoClasses 𝒜 O box α detV₀ form n Hn R ≃
      PELModuli.ratModuliProblem.isoClasses 𝒜 O box α detV₀ V T formV formT H R) := sorry

-- TauCeti.PEL.tests.ratModuli_siegel_kottwitz
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (p : ℕ) (g : ℕ) (V T : Type*)
    [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T] (formV : LinearMap.BilinForm ℚ V)
    (formT : LinearMap.BilinForm ℚ T) (H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)) (R : CommRingCat.{u}) :
    Nonempty (PELModuli.ratModuliProblem.isoClasses 𝒜 ℤ {p} (fun _ : Unit => (1 : ℤ))
      (fun _ => MvPolynomial.X () ^ g) V T formV formT H R ≃
        PELModuli.kottwitzQuadruples p V T formV formT H R) :=
  PELModuli.ratModuliProblem.kottwitz 𝒜 p _ V T formV formT H R
-- TauCeti.PEL.tests.ratModuli_lattice_indep
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (box : Set ℕ) (n : ℕ)
    (Hn₁ Hn₂ : Subgroup (((ZMod n ⊗[ℤ] (Fin 2 → ℤ)) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] (Fin 2 → ℤ))) × (ZMod n)ˣ))
    (e₁ e₂ : ℚ ⊗[ℤ] (Fin 2 → ℤ) ≃ₗ[ℚ] (Fin 2 → ℚ)) (H : Subgroup (((Fin 2 → ℚ) ≃ₗ[ℚ] (Fin 2 → ℚ)) × ℚˣ))
    (h₁ : H = PELModuli.ratLevelGroup e₁ Hn₁) (h₂ : H = PELModuli.ratLevelGroup e₂ Hn₂)
    (he₁ : ∀ x y, Matrix.toBilin' !![0, 1; -1, 0] (e₁ x) (e₁ y) =
      LinearMap.BilinForm.baseChange ℚ (Matrix.toBilin' !![0, 1; -1, 0]) x y)
    (he₂ : ∀ x y, Matrix.toBilin' !![0, 1; -1, 0] (e₂ x) (e₂ y) =
      LinearMap.BilinForm.baseChange ℚ (Matrix.toBilin' !![0, 2; -2, 0]) x y)
    (R : CommRingCat.{u}) :
    Nonempty (PELModuli.moduliProblem.isoClasses 𝒜 ℤ box (fun _ : Unit => (1 : ℤ))
      (fun _ => MvPolynomial.X () ^ 1) (Matrix.toBilin' !![0, 1; -1, 0]) n Hn₁ R ≃
      PELModuli.ratModuliProblem.isoClasses 𝒜 ℤ box (fun _ : Unit => (1 : ℤ))
        (fun _ => MvPolynomial.X () ^ 1) (Fin 2 → ℚ) (Fin 2 → ℚ) (Matrix.toBilin' !![0, 1; -1, 0])
        (Matrix.toBilin' !![0, 1; -1, 0]) H R) ∧
    Nonempty (PELModuli.moduliProblem.isoClasses 𝒜 ℤ box (fun _ : Unit => (1 : ℤ))
      (fun _ => MvPolynomial.X () ^ 1) (Matrix.toBilin' !![0, 2; -2, 0]) n Hn₂ R ≃
      PELModuli.ratModuliProblem.isoClasses 𝒜 ℤ box (fun _ : Unit => (1 : ℤ))
        (fun _ => MvPolynomial.X () ^ 1) (Fin 2 → ℚ) (Fin 2 → ℚ) (Matrix.toBilin' !![0, 1; -1, 0])
        (Matrix.toBilin' !![0, 1; -1, 0]) H R) :=
  ⟨isoIsogenyComparison 𝒜 ℤ box _ _ _ n Hn₁ _ _ _ _ H R e₁ he₁ h₁,
    isoIsogenyComparison 𝒜 ℤ box _ _ _ n Hn₂ _ _ _ _ H R e₂ he₂ h₂⟩

/-- Lan Corollary 1.4.3.7 and Proposition 1.4.4.1 (`M1/change-of-lattice-and-primes`): lattices
`L₁, L₂ ⊂ V` with `L₁ ⊗ ℤ_(□) = L₂ ⊗ ℤ_(□)` (commensurable with index prime to each `p ∈ □`) and the
same rational level give equivalent moduli problems. -/
theorem changeOfLatticeAndPrimes (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (O : Type*)
    [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
    (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) {V : Type*} [AddCommGroup V] [Module ℚ V]
    (formV : LinearMap.BilinForm ℚ V) {L₁ L₂ : Type*} [AddCommGroup L₁] [AddCommGroup L₂]
    (form₁ : LinearMap.BilinForm ℤ L₁) (form₂ : LinearMap.BilinForm ℤ L₂) (n : ℕ)
    (Hn₁ : Subgroup (((ZMod n ⊗[ℤ] L₁) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L₁)) × (ZMod n)ˣ))
    (Hn₂ : Subgroup (((ZMod n ⊗[ℤ] L₂) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L₂)) × (ZMod n)ˣ))
    (e₁ : ℚ ⊗[ℤ] L₁ ≃ₗ[ℚ] V) (e₂ : ℚ ⊗[ℤ] L₂ ≃ₗ[ℚ] V)
    (he₁ : ∀ x y, formV (e₁ x) (e₁ y) = LinearMap.BilinForm.baseChange ℚ form₁ x y)
    (he₂ : ∀ x y, formV (e₂ x) (e₂ y) = LinearMap.BilinForm.baseChange ℚ form₂ x y)
    (hloc : ∀ p ∈ box, ∃ m : ℕ, ¬ p ∣ m ∧
      (LinearMap.range ((e₁.toLinearMap.restrictScalars ℤ).comp (TensorProduct.mk ℤ ℚ L₁ 1))).map ((m : ℤ) • LinearMap.id) ≤
        LinearMap.range ((e₂.toLinearMap.restrictScalars ℤ).comp (TensorProduct.mk ℤ ℚ L₂ 1)) ∧
      (LinearMap.range ((e₂.toLinearMap.restrictScalars ℤ).comp (TensorProduct.mk ℤ ℚ L₂ 1))).map ((m : ℤ) • LinearMap.id) ≤
        LinearMap.range ((e₁.toLinearMap.restrictScalars ℤ).comp (TensorProduct.mk ℤ ℚ L₁ 1)))
    (hH : PELModuli.ratLevelGroup e₁ Hn₁ = PELModuli.ratLevelGroup e₂ Hn₂) (R : CommRingCat.{u}) :
    Nonempty (PELModuli.moduliProblem.isoClasses 𝒜 O box α detV₀ form₁ n Hn₁ R ≃
      PELModuli.moduliProblem.isoClasses 𝒜 O box α detV₀ form₂ n Hn₂ R) := sorry

/-- The pseudofunctor `X ↦ M_H(X)` on schemes (fibres and pullbacks; data from A1 base change). -/
def PELModuli.pseudofunctor : Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1} := sorry

/-- `M_H` is an fppf stack (`M1/effective-descent`), on Mathlib's stack carrier. -/
theorem effectiveDescent : PELModuli.pseudofunctor.{u}.IsStack Scheme.fppfTopology := sorry

/-! ### Hecke action and functoriality -/

namespace PELModuli
variable {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
  {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}

/-- `M^rat_{H'} → M^rat_H` on level data. -/
def forgetLevel {H' H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (h : H' ≤ H) :
    RationalLevel V T formV formT H' → RationalLevel V T formV formT H :=
  RationalLevel.changeLevel h

/-- `[g] : M^rat_{H'} → M^rat_H`, `α̂ ↦ α̂ ∘ g`. -/
def heckeTranslate {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (g : (V ≃ₗ[ℚ] V) × ℚˣ)
    (Rl : RationalLevel V T formV formT H) : Set ((V ≃ₗ[ℚ] T) × ℚˣ) :=
  (fun p => (g.1.trans p.1, g.2 * p.2)) '' Rl.orbit

theorem heckeTranslate_comp {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (g g' : (V ≃ₗ[ℚ] V) × ℚˣ)
    (Rl : RationalLevel V T formV formT H) :
    (fun p : (V ≃ₗ[ℚ] T) × ℚˣ => (g'.1.trans p.1, g'.2 * p.2)) '' heckeTranslate g Rl =
      (fun p : (V ≃ₗ[ℚ] T) × ℚˣ => ((g'.1.trans g.1).trans p.1, (g'.2 * g.2) * p.2)) '' Rl.orbit := by
  simp only [heckeTranslate, Set.image_image]; congr 1; ext p <;> simp [mul_assoc]

theorem heckeTranslate_central {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)}
    (Rl : RationalLevel V T formV formT H) :
    heckeTranslate (LinearEquiv.refl ℚ V, 1) Rl = Rl.orbit := by
  simp [heckeTranslate]

/-- The Hecke correspondence `M^rat_H ← M^rat_{H ∩ gHg⁻¹} → M^rat_H`. -/
def heckeCorrespondence {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (g : (V ≃ₗ[ℚ] V) × ℚˣ)
    (Rl : RationalLevel V T formV formT H) : Set ((V ≃ₗ[ℚ] T) × ℚˣ) × Set ((V ≃ₗ[ℚ] T) × ℚˣ) :=
  (Rl.orbit, heckeTranslate g Rl)

theorem heckeTranslate_integral {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (g : (V ≃ₗ[ℚ] V) × ℚˣ)
    (Rl : RationalLevel V T formV formT H) (Λ : Submodule ℤ V)
    (hg : Λ.map (g.1.toLinearMap.restrictScalars ℤ) = Λ) :
    ∀ q ∈ heckeTranslate g Rl, ∃ p ∈ Rl.orbit,
      Λ.map (q.1.toLinearMap.restrictScalars ℤ) = Λ.map (p.1.toLinearMap.restrictScalars ℤ) := sorry

end PELModuli

-- TauCeti.PEL.tests.heckeTranslate_id
example {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
    {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (Rl : RationalLevel V T formV formT H) :
    PELModuli.heckeTranslate (LinearEquiv.refl ℚ V, 1) Rl = Rl.orbit :=
  PELModuli.heckeTranslate_central Rl
-- TauCeti.PEL.tests.heckeTranslate_siegel_scalar
example {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
    {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (Rl : RationalLevel V T formV formT H) (ℓ : ℚˣ) (hRl : ∀ p ∈ Rl.orbit, (p.1.trans (LinearEquiv.smulOfUnit ℓ), ℓ ^ 2 * p.2) ∈ Rl.orbit) :
    PELModuli.heckeTranslate (LinearEquiv.smulOfUnit ℓ, ℓ ^ 2) Rl ⊆ Rl.orbit := sorry
-- TauCeti.PEL.tests.heckeTranslate_not_left
example {V T : Type*} [AddCommGroup V] [Module ℚ V] [AddCommGroup T] [Module ℚ T]
    {formV : LinearMap.BilinForm ℚ V} {formT : LinearMap.BilinForm ℚ T}
    {H : Subgroup ((V ≃ₗ[ℚ] V) × ℚˣ)} (Rl : RationalLevel V T formV formT H) (g : (V ≃ₗ[ℚ] V) × ℚˣ) :
    PELModuli.heckeTranslate g Rl = (fun p => (g.1.trans p.1, g.2 * p.2)) '' Rl.orbit := rfl

/-- A morphism of integral PEL data `(O', L') → (O, L)`: a `*`-homomorphism and an isometric
`O'`-linear identification. -/
structure PELDatum.Hom (O O' : Type*) [Ring O] [StarRing O] [Ring O'] [StarRing O']
    {L L' : Type*} [AddCommGroup L] [Module O L] [AddCommGroup L'] [Module O' L']
    (D : IntegralPELDatum O L) (D' : IntegralPELDatum O' L') where
  φ : O' →+* O
  star_φ : ∀ b, φ (star b) = star (φ b)
  e : L' ≃ₗ[ℤ] L
  isometry : ∀ x y, D.form (e x) (e y) = D'.form x y

namespace PELModuli

/-- The induced morphism on PEL triples: restrict the `O`-structure along `φ`. -/
def mapOfDatum {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O O' : Type*} [Ring O]
    [StarRing O] [Ring O'] [StarRing O'] {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι]
    {α' : ι → O'} {detV₀ : MvPolynomial ι R} (φ : O' →+* O) (hφ : ∀ b, φ (star b) = star (φ b))
    (T : PELTriple 𝒜 O box (fun j => φ (α' j)) detV₀) : PELTriple 𝒜 O' box α' detV₀ :=
  { A := T.A, pol := T.pol, i := fun b => T.i (φ b), rosati := fun b => by rw [hφ]; exact T.rosati _,
    lieFree := T.lieFree, lieFinite := T.lieFinite }

/-- The Siegel morphism: forget `i` entirely (restrict along `ℤ → O`). -/
def toSiegel {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O]
    [StarRing O] {box : Set ℕ} {detV₀ : MvPolynomial Unit R}
    (T : PELTriple 𝒜 O box (fun _ => (1 : O)) detV₀) : PELTriple 𝒜 ℤ box (fun _ => (1 : ℤ)) detV₀ :=
  mapOfDatum (Int.castRingHom O) (fun b => by simp) (by simpa using T)

/-- The fibre of `toSiegel`: the `O`-structures on a fixed polarized abelian scheme. -/
theorem toSiegel_fiber {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O]
    [StarRing O] {box : Set ℕ} {detV₀ : MvPolynomial Unit R}
    (T : PELTriple 𝒜 O box (fun _ => (1 : O)) detV₀) : (toSiegel T).A = T.A := sorry

/-- Products of data give products of moduli problems (data level: products of lattices). -/
def prod {O O' : Type*} [Ring O] [StarRing O] [Ring O'] [StarRing O'] {L L' : Type*}
    [AddCommGroup L] [Module O L] [AddCommGroup L'] [Module O' L'] (D : IntegralPELDatum O L)
    (D' : IntegralPELDatum O' L') : LinearMap.BilinForm ℤ (L × L') :=
  D.form.compl₁₂ (LinearMap.fst ℤ L L') (LinearMap.fst ℤ L L') +
    D'.form.compl₁₂ (LinearMap.snd ℤ L L') (LinearMap.snd ℤ L L')

end PELModuli

-- TauCeti.PEL.tests.mapOfDatum_id
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι R}
    (T : PELTriple 𝒜 O box (fun j => (RingHom.id O) (α j)) detV₀) :
    (PELModuli.mapOfDatum (RingHom.id O) (fun _ => rfl) T).A = T.A := rfl
-- TauCeti.PEL.tests.toSiegel_g1
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} [Nontrivial R] (T : PELTriple 𝒜 O box (fun _ => (1 : O)) (MvPolynomial.X () ^ 1))
    (h : (PELModuli.toSiegel T).detCondition) :
    (letI := (PELModuli.toSiegel T).lieFree; letI := (PELModuli.toSiegel T).lieFinite;
      Module.finrank R (𝒜.lie (PELModuli.toSiegel T).A)) = 1 :=
  PELTriple.relDim _ 1 (MvPolynomial.isHomogeneous_X_pow _ _) (by rw [pow_one]; exact MvPolynomial.X_ne_zero _) h
-- TauCeti.PEL.tests.toSiegel_not_injective_on_objects
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} {detV₀ : MvPolynomial Unit R} (T T' : PELTriple 𝒜 O box (fun _ => (1 : O)) detV₀)
    (hA : T.A = T'.A) : (PELModuli.toSiegel T).A = (PELModuli.toSiegel T').A := by
  rw [PELModuli.toSiegel_fiber, PELModuli.toSiegel_fiber, hA]

end M1

/-! ## M2. Representability and smoothness at good level -/

section M2

/-- Mumford–Serre rigidity (`M2/rigidity`): an automorphism of finite order acting trivially
modulo `n ≥ 3` on a lattice is the identity (the eigenvalue form of Serre's lemma used for
`Aut(A, λ) ↪ Aut(A[n])`). -/
theorem rigidity {N : ℕ} (g : Matrix (Fin N) (Fin N) ℤ) (k : ℕ) (hk : 0 < k) (hg : g ^ k = 1)
    (n : ℕ) (hn : 3 ≤ n) (hmod : ∀ i j, (n : ℤ) ∣ g i j - (1 : Matrix (Fin N) (Fin N) ℤ) i j) :
    g = 1 := sorry

/-- An element of `G(Ẑ^□)` (through a faithful representation over `ℤ_p` at each `p ∉ □`) is
neat if the torsion of the groups generated by its eigenvalues has trivial intersection; here
recorded through the eigenvalues at one prime `p` (the packet intersects over all `p ∉ □`). -/
def IsNeatElement {N : ℕ} (p : ℕ) [Fact p.Prime] (g : Matrix (Fin N) (Fin N) ℤ_[p]) : Prop :=
  ∀ ζ : AlgebraicClosure ℚ_[p], (∃ k : ℕ, 0 < k ∧ ζ ^ k = 1) →
    (g.map (algebraMap ℤ_[p] (AlgebraicClosure ℚ_[p]))).charpoly.IsRoot ζ → ζ = 1

/-- A subgroup is neat if all its elements are. -/
def IsNeat {N : ℕ} (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin N) ℤ_[p])) : Prop :=
  ∀ g ∈ H, IsNeatElement p (g : Matrix (Fin N) (Fin N) ℤ_[p])

namespace IsNeat
variable {N : ℕ} {p : ℕ} [Fact p.Prime]

theorem mono {H H' : Subgroup (GL (Fin N) ℤ_[p])} (h : H' ≤ H) (hH : IsNeat p H) : IsNeat p H' :=
  fun g hg => hH g (h hg)

theorem conj {H : Subgroup (GL (Fin N) ℤ_[p])} (hH : IsNeat p H) (c : GL (Fin N) ℤ_[p]) :
    IsNeat p (H.map (MulAut.conj c).toMonoidHom) := sorry

theorem repr_indep {H : Subgroup (GL (Fin N) ℤ_[p])} (hH : IsNeat p H) (P : GL (Fin N) ℤ_[p]) :
    IsNeat p (H.map (MulAut.conj P).toMonoidHom) := conj hH P

theorem shimuraData {H : Subgroup (GL (Fin N) ℤ_[p])} (hH : IsNeat p H) :
    ∀ g ∈ H, IsNeatElement p (g : Matrix (Fin N) (Fin N) ℤ_[p]) := hH

end IsNeat

/-- `U(n)` is neat for `n ≥ 3` prime to `p`... at `p`: the principal congruence subgroup of
level `p^k` with `p^k ≥ 3`. -/
theorem isNeat_principalCongruence {N : ℕ} (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 3 ≤ p ^ k)
    (H : Subgroup (GL (Fin N) ℤ_[p]))
    (hH : ∀ g ∈ H, ∀ i j, (p : ℤ_[p]) ^ k ∣ (g : Matrix (Fin N) (Fin N) ℤ_[p]) i j -
      (1 : Matrix (Fin N) (Fin N) ℤ_[p]) i j) : IsNeat p H := sorry

-- TauCeti.PEL.tests.isNeat_U3
example (N : ℕ) (H : Subgroup (GL (Fin N) ℤ_[3]))
    (hH : ∀ g ∈ H, ∀ i j, (3 : ℤ_[3]) ^ 1 ∣ (g : Matrix (Fin N) (Fin N) ℤ_[3]) i j -
      (1 : Matrix (Fin N) (Fin N) ℤ_[3]) i j) : IsNeat 3 H :=
  isNeat_principalCongruence 3 1 (by norm_num) H hH
-- TauCeti.PEL.tests.not_isNeat_minus_one
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ¬ IsNeatElement p (-1 : Matrix (Fin 1) (Fin 1) ℤ_[p]) := sorry
-- TauCeti.PEL.tests.isNeat_mono
example {N : ℕ} (p : ℕ) [Fact p.Prime] (H H' : Subgroup (GL (Fin N) ℤ_[p])) (h : H' ≤ H)
    (hH : IsNeat p H) : IsNeat p H' := IsNeat.mono h hH

/-- Lan Corollary 1.4.1.11: at neat level, objects have no automorphisms (an automorphism of
finite order whose eigenvalues are roots of unity in a neat group is trivial). -/
theorem noAutomorphismsAtNeatLevel {N : ℕ} (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin N) ℤ_[p]))
    (hH : IsNeat p H) (g : GL (Fin N) ℤ_[p]) (hg : g ∈ H) (k : ℕ) (hk : 0 < k) (hgk : g ^ k = 1) :
    g = 1 := sorry

/-- `Isom(ξ, η)` is finite unramified (`M2/isom-scheme`): its fibres over a field are finite. -/
theorem isomScheme {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*} [Ring O]
    [StarRing O] {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O}
    {detV₀ : MvPolynomial ι R} (T T' : PELTriple 𝒜 O box α detV₀) (_hR : IsField R) :
    Finite (PELTriple.Hom T T') := sorry

/-- The representing algebraic space of `M_H` at neat level, through an étale atlas `U → S₀`
(data of AlgebraicModuliForArithmeticGeometry's algebraic spaces; constructed by Artin's
criterion). -/
def PELModuli.representingChart {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (_D : RationalPELDatum B V)
    (S₀ : Scheme.{u}) (_n : ℕ) : Σ U : Scheme.{u}, U ⟶ S₀ := sorry

/-- The complete local ring at a closed point of the chart (prorepresenting `Def_ξ₀`). -/
def PELModuli.deformationRing {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (_D : RationalPELDatum B V)
    (k : Type u) [Field k] : CommRingCat.{u} := sorry

/-- Schlessinger prorepresentability (`M2/deformation-prorepresentable`): the deformation ring is a
complete noetherian local ring. -/
theorem deformationProrepresentable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (k : Type u) [Field k] :
    IsLocalRing (PELModuli.deformationRing D k) ∧ IsNoetherianRing (PELModuli.deformationRing D k) :=
  sorry

/-- Formal smoothness at good primes (`M2/formal-smoothness`): the deformation ring is a power
series ring over `W(k)`; its algebraic local model, the affine space of the flag-variety chart, is
formally smooth. -/
theorem formalSmoothness {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p] :
    ∃ N : ℕ, Nonempty (PELModuli.deformationRing D k ≃+* MvPowerSeries (Fin N) (WittVector p k)) :=
  sorry

/-- Effectivity (`M2/effectivity`): over an adically complete ring, compatible systems of points
modulo `m^i` come from points over the ring (the input of Grothendieck existence). -/
theorem effectivity {R : Type*} [CommRing R] (m : Ideal R) [IsAdicComplete m R] (x : ℕ → R)
    (hx : ∀ i, x (i + 1) - x i ∈ m ^ i) : ∃ y : R, ∀ i, y - x i ∈ m ^ i := sorry

/-- Representability (`M2/representability`, Lan Theorem 1.4.1.12) on the representing chart:
smooth and separated over `S₀` at good primes and neat level. -/
theorem representability {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (S₀ : Scheme.{u}) (n : ℕ) (hn : 3 ≤ n) :
    Smooth (PELModuli.representingChart D S₀ n).2 ∧ IsSeparated (PELModuli.representingChart D S₀ n).2 :=
  sorry

/-- The universal object over `M_H` at neat level (`M2/universal-family`), on a chart. -/
def PELModuli.universal {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*} [Ring O]
    [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
    (detV₀ : MvPolynomial ι R) : PELTriple 𝒜 O box α detV₀ := sorry

namespace PELModuli
variable {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*} [Ring O] [StarRing O]
  (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O) (detV₀ : MvPolynomial ι R)

/-- The classifying map of an object (here: the identification with the universal object over the
chart `Spec R`). -/
def classify (T : PELTriple 𝒜 O box α detV₀) :
    PELTriple.Hom T (PELModuli.universal 𝒜 box α detV₀) := sorry

theorem classify_pullback (T : PELTriple 𝒜 O box α detV₀) :
    (classify 𝒜 box α detV₀ T).f.f ≫ (PELModuli.universal 𝒜 box α detV₀).A.π = T.A.π :=
  (classify 𝒜 box α detV₀ T).f.comm

theorem universal_baseChange {R' : CommRingCat.{u}} (𝒜' : AbelianSchemeSupplier R') (_φ : R ⟶ R')
    (detV₀' : MvPolynomial ι R') :
    ∃ T : PELTriple 𝒜' O box α detV₀', T.A = (PELModuli.universal 𝒜' box α detV₀').A :=
  ⟨_, rfl⟩

theorem universal_relDim [Nontrivial R] (d : ℕ) (hd : detV₀.IsHomogeneous d) (h0 : detV₀ ≠ 0)
    (h : (PELModuli.universal 𝒜 box α detV₀).detCondition) :
    (letI := (PELModuli.universal 𝒜 box α detV₀).lieFree
     letI := (PELModuli.universal 𝒜 box α detV₀).lieFinite
     Module.finrank R (𝒜.lie (PELModuli.universal 𝒜 box α detV₀).A)) = d :=
  PELTriple.relDim _ d hd h0 h

theorem universal_lie : (PELModuli.universal 𝒜 box α detV₀).detCondition := sorry

theorem universal_hecke (g : (PELModuli.universal 𝒜 box α detV₀).A.Hom
    (PELModuli.universal 𝒜 box α detV₀).A) :
    g.f ≫ (PELModuli.universal 𝒜 box α detV₀).A.π = (PELModuli.universal 𝒜 box α detV₀).A.π :=
  g.comm

theorem universal_siegel [Nontrivial R]
    (h : (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)).detCondition) :
    (letI := (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)).lieFree
     letI := (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)).lieFinite
     Module.finrank R (𝒜.lie (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ))
       (MvPolynomial.X () ^ 1)).A)) = 1 := sorry

end PELModuli

-- TauCeti.PEL.tests.universal_g1
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (box : Set ℕ) [Nontrivial R]
    (h : (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)).detCondition) :
    (letI := (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)).lieFree
     letI := (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)).lieFinite
     Module.finrank R (𝒜.lie (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ))
       (MvPolynomial.X () ^ 1)).A)) = 1 := PELModuli.universal_siegel 𝒜 box h
-- TauCeti.PEL.tests.universal_classify_self
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*} [Ring O] [StarRing O]
    (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O) (detV₀ : MvPolynomial ι R) :
    (PELModuli.classify 𝒜 box α detV₀ (PELModuli.universal 𝒜 box α detV₀)).f.f ≫
      (PELModuli.universal 𝒜 box α detV₀).A.π = (PELModuli.universal 𝒜 box α detV₀).A.π :=
  PELModuli.classify_pullback 𝒜 box α detV₀ _
-- TauCeti.PEL.tests.universal_nonneat
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) : ¬ IsNeat p (⊤ : Subgroup (GL (Fin 1) ℤ_[p])) := sorry
-- TauCeti.PEL.tests.universal_zero
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (box : Set ℕ) [Nontrivial R]
    (h : (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) 1).detCondition) :
    (letI := (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) 1).lieFree
     letI := (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) 1).lieFinite
     Module.finrank R (𝒜.lie (PELModuli.universal 𝒜 box (fun _ : Unit => (1 : ℤ)) 1).A)) = 0 :=
  PELModuli.universal_relDim 𝒜 box _ 1 0 (MvPolynomial.isHomogeneous_one _ _) one_ne_zero h

/-- The symmetric matrices, the tangent space of the Siegel local model. -/
def symmetricMatrices (k : Type*) [Field k] (g : ℕ) : Submodule k (Matrix (Fin g) (Fin g) k) where
  carrier := {M | M.transpose = M}
  add_mem' := by intro a b ha hb; simp only [Set.mem_ofPred_eq] at *; rw [Matrix.transpose_add, ha, hb]
  zero_mem' := by simp
  smul_mem' := by intro c M hM; simp only [Set.mem_ofPred_eq] at *; rw [Matrix.transpose_smul, hM]

/-- Kodaira–Spencer (`M2/kodaira-spencer-dimension`): the relative dimension of Siegel moduli is
`dim Sym²(k^g) = g(g+1)/2` (unitary: `Σ p_τ q_τ`, the dimensions of `Hom(V_τ⁺, V_τ⁻)`). -/
theorem kodairaSpencerDimension (k : Type*) [Field k] (g : ℕ) :
    Module.finrank k (symmetricMatrices k g) = g * (g + 1) / 2 := sorry

/-- Kottwitz §5 (`M2/properness-when-division`): if `End_B(V)` is a division algebra the
representing space is proper over `S₀`. -/
theorem propernessWhenDivision {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (hdiv : ∀ c ∈ D.centralizer, c ≠ 0 → IsUnit c) (S₀ : Scheme.{u}) (n : ℕ) (hn : 3 ≤ n) :
    IsProper (PELModuli.representingChart D S₀ n).2 := sorry

/-- The groupoids `Def(S, Ŝ; A, λ)` and `Def'(S, Ŝ; A, λ)` of LTXZZ §3.4 (data). -/
def unitaryDeformationGroupoid {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type*}
    [CommRing OF] [StarRing OF] (_X : UnitaryOFAbelianScheme 𝒜 OF) (_Shat : CommRingCat.{u})
    (_q : _Shat ⟶ R) : Type u := sorry

/-- Isotropic lifts of the `τ_∞`, `τ_∞^c` Hodge filtrations to `H^cris_1(A/Ŝ)` (data). -/
def isotropicHodgeLifts {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type*}
    [CommRing OF] [StarRing OF] (_X : UnitaryOFAbelianScheme 𝒜 OF) (_Shat : CommRingCat.{u})
    (_q : _Shat ⟶ R) : Type u := sorry

/-- LTXZZ Proposition 3.4.8 (`M2/unitary-deformation`). -/
theorem unitaryDeformation {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type*}
    [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF) (Shat : CommRingCat.{u})
    (q : Shat ⟶ R) :
    Nonempty (unitaryDeformationGroupoid 𝒜 X Shat q ≃ isotropicHodgeLifts 𝒜 X Shat q) := sorry

/-- LTXZZ Lemma 3.4.12 (3)(a) (`M2/isogeny-kernel-ranks`): kernel-rank bookkeeping
`2ρ + log_p deg λ_B = 2N + log_p deg λ_A`. -/
theorem isogenyKernelRanks (N ρ dA dB : ℕ) (h : 2 * ρ + dB = 2 * N + dA) :
    (dA = 0 ∧ dB = 0 → ρ = N) ∧ (dA = 0 ∧ dB = 2 → ρ + 1 = N) ∧ (dA = 2 ∧ dB = 0 → ρ = N + 1) ∧
      (dA = 2 ∧ dB = 2 → ρ = N) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> rintro ⟨rfl, rfl⟩ <;> omega

/-- The ordinary locus of the special fibre of the representing chart (data). -/
def ordinaryLocus {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) (S₀ : Scheme.{u})
    (n : ℕ) : Set (PELModuli.representingChart D S₀ n).1 := sorry

/-- Wedhorn 1999, 1.6.3 (`M2/wedhorn-ordinary-density`): the ordinary locus is dense in the
special fibre iff `p` splits completely in the reflex field (all residue degrees equal `1`). -/
theorem wedhornOrdinaryDensity {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (S₀ : Scheme.{u}) (n : ℕ) (residueDegrees : List ℕ) :
    Dense (ordinaryLocus D S₀ n) ↔ ∀ f ∈ residueDegrees, f = 1 := sorry

end M2

/-! ## M3. Complex and generic-fibre comparison -/

section M3
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
  [Module B V] [IsScalarTower ℚ B V]

/-- `ker¹(ℚ, G)`: classes of skew-Hermitian `B`-modules everywhere locally isomorphic to `V`
(the Galois-cohomology carrier is the recorded gap; here the set of classes as data). -/
def PELModuli.ker1 (_D : RationalPELDatum B V) : Type := sorry

/-- Kottwitz §8 (`M3/ker1-classification`): `ker¹(ℚ, G)` is finite. -/
theorem ker1Classification (D : RationalPELDatum B V) : Finite (PELModuli.ker1 D) := sorry

/-- Kottwitz §7 (`M3/hasse-principle-cases`): in Cases C and A with even hermitian dimension
`ker¹(ℚ, G)` is trivial. For simple `B` with centre `F`, `[B : F] = m²` and
`[V : ℚ] = m n [F : ℚ]`, the hermitian dimension is `n`. The simply connected inputs (Kneser's
local vanishing and the Hasse principle for `G^der`) are AdelicAlgebraicGroups AA.4. -/
theorem hassePrincipleCases (D : RationalPELDatum B V) (types : Finset AlbertType)
    (hD : AlbertType.D ∉ types) (m n : ℕ)
    (hB : Module.finrank ℚ B = m ^ 2 * Module.finrank ℚ (Subalgebra.center ℚ B))
    (hV : Module.finrank ℚ V = m * n * Module.finrank ℚ (Subalgebra.center ℚ B))
    (hA : AlbertType.A ∈ types → Even n) :
    Subsingleton (PELModuli.ker1 D) := sorry

/-- The complex points of `M^ad_K` (data). -/
def PELModuli.complexPointsSet (_D : RationalPELDatum B V) (_K : Subgroup (PELDatum.similitudeGroup _D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) : Type :=
  sorry

/-- The double coset `G^{(i)}(ℚ) \ (X × G(𝔸_f)/K)` (data). -/
def PELModuli.doubleCoset (_D : RationalPELDatum B V) (_i : PELModuli.ker1 _D)
    (_K : Subgroup (PELDatum.similitudeGroup _D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) : Type :=
  sorry

/-- Kottwitz §8 / Milne Theorem 8.17 (`M3/complex-points`). -/
theorem complexPoints (D : RationalPELDatum B V) (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty (PELModuli.complexPointsSet D K ≃ Σ i : PELModuli.ker1 D, PELModuli.doubleCoset D i K) :=
  sorry

/-- The analytic family `A_{h', g} = V_ℝ / L_g` with complex structure `h'(√−1)` (on lattices
`L_g ⊂ V`), as the quotient of the real vector space by a lattice. -/
def PELModuli.analyticFamily (_D : RationalPELDatum B V) (Lg : Submodule ℤ (ℝ ⊗[ℚ] V)) : Type _ :=
  (ℝ ⊗[ℚ] V) ⧸ Lg.toAddSubgroup

namespace PELModuli

theorem analyticFamily_equivariant (D : RationalPELDatum B V) (Lg : Submodule ℤ (ℝ ⊗[ℚ] V))
    (γ : (ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) :
    Nonempty (analyticFamily D Lg ≃ analyticFamily D (Lg.map (γ.toLinearMap.restrictScalars ℤ))) :=
  sorry

/-- The uniformization map `u^{(i)}` on points. -/
def uniformization (D : RationalPELDatum B V) (i : PELModuli.ker1 D) (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    PELModuli.doubleCoset D i K → PELModuli.complexPointsSet D K := sorry

theorem uniformization_openClosed (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Function.Injective (uniformization D i K) := sorry

theorem uniformization_hecke (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) (h : K' ≤ K)
    (fwd : PELModuli.doubleCoset D i K' → PELModuli.doubleCoset D i K)
    (fwd' : PELModuli.complexPointsSet D K' → PELModuli.complexPointsSet D K) :
    ∀ x, fwd' (uniformization D i K' x) = uniformization D i K (fwd x) := sorry

/-- The complex torus `A(ℂ)` of the object at a complex point (data). -/
def complexFibre (D : RationalPELDatum B V) (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_x : PELModuli.complexPointsSet D K) : Type := sorry

/-- `u^{(i)*}` of the universal family is the analytic family: the fibre at `u(x)` is `V_ℝ / L_g`. -/
theorem uniformization_universal (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (x : PELModuli.doubleCoset D i K) :
    ∃ Lg : Submodule ℤ (ℝ ⊗[ℚ] V),
      Nonempty (complexFibre D K (uniformization D i K x) ≃ analyticFamily D Lg) := sorry

/-- `g = 1`: `τ ↦ (ℂ/(ℤ + ℤτ), 1/n, τ/n)`. -/
def uniformization_siegel (n : ℕ) (τ : UpperHalfPlane) : ℂ × ℂ × ℂ :=
  ((τ : ℂ), 1 / n, (τ : ℂ) / n)

end PELModuli

-- TauCeti.PEL.tests.uniformization_g1
example (n : ℕ) (hn : 0 < n) (τ : UpperHalfPlane) :
    (PELModuli.uniformization_siegel n τ).2.1 * n = 1 := sorry
-- TauCeti.PEL.tests.uniformization_bijective_points
example (D : RationalPELDatum B V) (i : PELModuli.ker1 D) (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Function.Injective (PELModuli.uniformization D i K) := PELModuli.uniformization_openClosed D i K
-- TauCeti.PEL.tests.uniformization_not_single
example (D : RationalPELDatum B V) (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (i : PELModuli.ker1 D) (h : Nat.card (PELModuli.ker1 D) = 2) :
    ¬ Function.Surjective (PELModuli.uniformization D i K) := sorry
-- TauCeti.PEL.tests.uniformization_zero
example (D : RationalPELDatum B V) [Subsingleton V]
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (i : PELModuli.ker1 D) : Function.Bijective (PELModuli.uniformization D i K) := sorry

/-- Algebraization (`M3/algebraization-of-components`): the generic fibre is a quasi-projective
scheme and the analytic comparison algebraizes; recorded on the representing chart over `F₀`. -/
theorem algebraizationOfComponents (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) (hn : 3 ≤ n) :
    IsSeparated (PELModuli.representingChart D S₀ n).2 := (representability D S₀ n hn).2

/-- Type D (`M3/type-d-comparison`): the similitude group is disconnected; the comparison with
the identity component is a gap. Recorded: the component group `{±1}` of `O_{2n}` per real place. -/
theorem typeDComparison : ({x : ℤ | x ^ 2 = 1} : Set ℤ) = {1, -1} := sorry

/-- The hermitian space `Hom^{λ₀,λ}(H₁(A₀), H₁(A))` (`M3/hermitian-hom-space`), over a commutative
ring `A` with involution, for free modules `M₀` (rank one) and `M`. -/
abbrev hermitianHom {A : Type*} [CommRing A] [StarRing A] (M₀ M : Type*) [AddCommGroup M₀] [Module A M₀]
    [AddCommGroup M] [Module A M] : Type _ := M₀ →ₗ[A] M

namespace hermitianHom
variable {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*} [AddCommGroup M₀] [Module A M₀]
  [AddCommGroup M] [Module A M]

/-- The pairing `(x, y) = i₀⁻¹((λ₀*)⁻¹ ∘ y^∨ ∘ λ* ∘ x)`, from the polarization pairings. -/
def pairing (_h₀ : HermitianSpace A M₀) (_h : HermitianSpace A M) :
    hermitianHom (A := A) M₀ M → hermitianHom (A := A) M₀ M → A := sorry

theorem _root_.TauCeti.PEL.hermitianHom_isHermitian (h₀ : HermitianSpace A M₀) (h : HermitianSpace A M)
    (x y : hermitianHom (A := A) M₀ M) : pairing h₀ h x y = star (pairing h₀ h y x) := sorry

end hermitianHom

theorem hermitianHom_rank {A : Type*} [CommRing A] [StarRing A] [Nontrivial A] (N : ℕ) :
    Module.finrank A (A →ₗ[A] (Fin N → A)) = N := sorry

def hermitianHom_functorial {A : Type*} [CommRing A] [StarRing A] {M₀ M M' : Type*}
    [AddCommGroup M₀] [Module A M₀] [AddCommGroup M] [Module A M] [AddCommGroup M'] [Module A M']
    (f : M →ₗ[A] M') : hermitianHom (A := A) M₀ M → hermitianHom (A := A) M₀ M' := fun x => f ∘ₗ x

theorem hermitianHom_complex {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*}
    [AddCommGroup M₀] [Module A M₀] [AddCommGroup M] [Module A M] :
    hermitianHom (A := A) M₀ M = (M₀ →ₗ[A] M) := rfl

-- TauCeti.PEL.tests.hermitianHom_rank_one
example : Module.finrank ℂ (hermitianHom (A := ℂ) ℂ ℂ) = 1 := sorry
-- TauCeti.PEL.tests.hermitianHom_scaling
example {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*} [AddCommGroup M₀] [Module A M₀]
    [AddCommGroup M] [Module A M] (h₀ : HermitianSpace A M₀) (h h' : HermitianSpace A M) (c : A)
    (hc : ∀ x y, h'.pairing x y = c * h.pairing x y) (x y : hermitianHom (A := A) M₀ M) :
    hermitianHom.pairing h₀ h' x y = c * hermitianHom.pairing h₀ h x y := sorry
-- TauCeti.PEL.tests.hermitianHom_not_symmetric_bilinear
example {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*} [AddCommGroup M₀] [Module A M₀]
    [AddCommGroup M] [Module A M] (h₀ : HermitianSpace A M₀) (h : HermitianSpace A M) (a : A)
    (x y : hermitianHom (A := A) M₀ M) :
    hermitianHom.pairing h₀ h (a • x) y = a * hermitianHom.pairing h₀ h x y ∧
      hermitianHom.pairing h₀ h x (a • y) = star a * hermitianHom.pairing h₀ h x y := sorry
-- TauCeti.PEL.tests.hermitianHom_zero
example {A : Type*} [CommRing A] [StarRing A] (M₀ : Type*) [AddCommGroup M₀] [Module A M₀] :
    Subsingleton (hermitianHom (A := A) M₀ (Fin 0 → A)) := sorry

/-- The complex points of `A_{g,n}` (data). -/
def PELModuli.siegelComplexPoints (_g _n : ℕ) : Type := sorry

/-- Siegel moduli at full level `n` over `ℂ` (`M3/siegel-fine-uniformization`), for `g = 1`: the
components are indexed by `ν_n(1) ∈ μ_n^prim ≅ (ℤ/n)^×`, each `Γ(n)\ℍ`. -/
theorem siegelFineUniformization (n : ℕ) (hn : 3 ≤ n) :
    Nonempty (PELModuli.siegelComplexPoints 1 n ≃
      (ZMod n)ˣ × MulAction.orbitRel.Quotient (CongruenceSubgroup.Gamma n) UpperHalfPlane) := sorry

end M3

/-! ## M4. Canonical models and integral level changes -/

section M4
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
  [Module B V] [IsScalarTower ℚ B V]

/-- The `Aut(ℂ/F₀)`-action on complex points of the moduli problem (base change of objects). -/
def PELModuli.galoisAction (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    (ℂ ≃+* ℂ) → PELModuli.complexPointsSet D K → PELModuli.complexPointsSet D K := sorry

/-- The Shimura-reciprocity action on special points (reflex-norm translation; data). -/
def PELModuli.reciprocityAction (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    (ℂ ≃+* ℂ) → PELModuli.complexPointsSet D K → PELModuli.complexPointsSet D K := sorry

/-- CM reciprocity (`M4/cm-points-reciprocity`): on special points the moduli Galois action is
the reciprocity action. -/
theorem cmPointsReciprocity (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (special : Set (PELModuli.complexPointsSet D K)) (σ : ℂ ≃+* ℂ)
    (hσ : ∀ z ∈ D.reflexField, σ z = z) :
    ∀ x ∈ special, PELModuli.galoisAction D K σ x = PELModuli.reciprocityAction D K σ x := sorry

/-- Canonical-model identification (`M4/canonical-model-identification`): each `ker¹`-piece is
Galois-stable over `F₀`. -/
theorem canonicalModelIdentification (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (i : PELModuli.ker1 D) (σ : ℂ ≃+* ℂ) (hσ : ∀ z ∈ D.reflexField, σ z = z) :
    ∀ x, ∃ y, PELModuli.galoisAction D K σ (PELModuli.uniformization D i K x) =
      PELModuli.uniformization D i K y := sorry

/-- Kottwitz's twisting automorphism `(A, λ, i, η) ↦ (A, λ ∘ i(a), i, βη)` on PEL triples. -/
def PELModuli.twist {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O]
    [StarRing O] {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O}
    {detV₀ : MvPolynomial ι R} (T : PELTriple 𝒜 O box α detV₀) (a : O) (_ha : star a = a)
    (_hpos : ∀ φ : O →+* ℝ, 0 < φ a) : PELTriple 𝒜 O box α detV₀ := sorry

namespace PELModuli
variable {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
  {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι R}

theorem twist_hecke (T : PELTriple 𝒜 O box α detV₀) (a : O) (ha : star a = a)
    (hpos : ∀ φ : O →+* ℝ, 0 < φ a) : (twist T a ha hpos).A = T.A := sorry

theorem twist_maps_piece (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (i j : PELModuli.ker1 D) :
    Nonempty (PELModuli.doubleCoset D i K ≃ PELModuli.doubleCoset D j K) := sorry

theorem twist_mul (T : PELTriple 𝒜 O box α detV₀) (a b : O) (ha : star a = a) (hb : star b = b)
    (hab : star (a * b) = a * b) (hpa : ∀ φ : O →+* ℝ, 0 < φ a) (hpb : ∀ φ : O →+* ℝ, 0 < φ b)
    (hpab : ∀ φ : O →+* ℝ, 0 < φ (a * b)) :
    twist (twist T a ha hpa) b hb hpb = twist T (a * b) hab hpab := sorry

theorem twist_trivial (T : PELTriple 𝒜 O box α detV₀) : twist T 1 (by simp) (by simp) = T := sorry

end PELModuli

-- TauCeti.PEL.tests.twist_identity
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι R}
    (T : PELTriple 𝒜 O box α detV₀) : PELModuli.twist T 1 (by simp) (by simp) = T :=
  PELModuli.twist_trivial T
-- TauCeti.PEL.tests.twist_polarization_positive
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι R}
    (T : PELTriple 𝒜 O box α detV₀) (a : O) (ha : star a = a) (hpos : ∀ φ : O →+* ℝ, 0 < φ a)
    (b : O) :
    𝒜.comp (PELModuli.twist T a ha hpos).pol.toQuasiIsogeny.num
        (𝒜.dualHom ((PELModuli.twist T a ha hpos).i b)) =
      𝒜.comp ((PELModuli.twist T a ha hpos).i (star b))
        (PELModuli.twist T a ha hpos).pol.toQuasiIsogeny.num :=
  (PELModuli.twist T a ha hpos).rosati b
-- TauCeti.PEL.tests.twist_needs_positivity
example : ¬ ∀ φ : ℤ →+* ℝ, 0 < φ (-1) := fun h => by
  have := h (Int.castRingHom ℝ); norm_num at this

/-- Functoriality (`M4/canonical-model-functoriality`): the Galois action commutes with level
change. -/
theorem canonicalModelFunctoriality (D : RationalPELDatum B V)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (f : PELModuli.complexPointsSet D K' → PELModuli.complexPointsSet D K) (σ : ℂ ≃+* ℂ) :
    ∀ x, f (PELModuli.galoisAction D K' σ x) = PELModuli.galoisAction D K σ (f x) := sorry

/-- The normalized integral model at higher `p`-level: the relative normalization of the good
model `𝔐` in the generic-fibre cover `Y → 𝔐`, via Mathlib's `Scheme.Hom.normalization`. -/
def PELModuli.normalizedModel {Y 𝔐 : Scheme.{u}} (f : Y ⟶ 𝔐) [QuasiCompact f] [QuasiSeparated f] :
    Scheme.{u} :=
  f.normalization

namespace PELModuli
variable {Y 𝔐 : Scheme.{u}} (f : Y ⟶ 𝔐) [QuasiCompact f] [QuasiSeparated f]

/-- The structure map `𝔐_{K_pK^p} → 𝔐`. -/
def normalizedModel_toGood : normalizedModel f ⟶ 𝔐 := f.fromNormalization

/-- The generic fibre `Y → 𝔐_{K_pK^p}`. -/
def normalizedModel_generic : Y ⟶ normalizedModel f := f.toNormalization

theorem normalizedModel_universal {T : Scheme.{u}} (f₁ : Y ⟶ T) (f₂ : T ⟶ 𝔐) [IsIntegralHom f₂]
    (h : f = f₁ ≫ f₂) : Nonempty (normalizedModel f ⟶ T) := ⟨f.normalizationDesc f₁ f₂ h⟩

/-- Level change `K_p' ⊂ K_p`: a map of covers `Y' → Y` over `𝔐` gives a map of normalizations. -/
theorem normalizedModel_level {Y' : Scheme.{u}} (f' : Y' ⟶ 𝔐) [QuasiCompact f'] [QuasiSeparated f']
    (g : Y' ⟶ Y) (hg : g ≫ f = f') : Nonempty (normalizedModel f' ⟶ normalizedModel f) := sorry

/-- Prime-to-`p` Hecke correspondences extend (automorphisms of the cover over `𝔐`). -/
theorem normalizedModel_hecke (σ : Y ≅ Y) (hσ : σ.hom ≫ f = f) :
    Nonempty (normalizedModel f ≅ normalizedModel f) := sorry

omit [QuasiCompact f] [QuasiSeparated f] in
/-- At good level (`Y = 𝔐`, `f = 𝟙`) the normalization of a normal scheme is `𝔐`. -/
theorem normalizedModel_good (hnormal : ∀ x : 𝔐, IsIntegrallyClosed (𝔐.presheaf.stalk x)) :
    IsIso (normalizedModel_toGood (𝟙 𝔐)) := sorry

end PELModuli

-- TauCeti.PEL.tests.normalizedModel_good_level
example (𝔐 : Scheme.{u}) : Nonempty (PELModuli.normalizedModel (𝟙 𝔐) ⟶ 𝔐) :=
  ⟨PELModuli.normalizedModel_toGood (𝟙 𝔐)⟩
-- TauCeti.PEL.tests.normalizedModel_gamma0p_not_smooth
example (k : Type*) [Field k] :
    ¬ Algebra.FormallySmooth k
      (MvPolynomial (Fin 2) k ⧸
        (Ideal.span {MvPolynomial.X 0 * MvPolynomial.X 1} : Ideal (MvPolynomial (Fin 2) k))) := sorry
-- TauCeti.PEL.tests.normalizedModel_generic_g1
example {Y 𝔐 : Scheme.{u}} (f : Y ⟶ 𝔐) [QuasiCompact f] [QuasiSeparated f] :
    PELModuli.normalizedModel_generic f ≫ PELModuli.normalizedModel_toGood f = f := sorry

/-- `M4/normalization-finite-normal-flat`: the normalization is integral (finite under Nagata
hypotheses) over the good model. -/
theorem normalizationFiniteNormalFlat {Y 𝔐 : Scheme.{u}} (f : Y ⟶ 𝔐) [QuasiCompact f]
    [QuasiSeparated f] : IsIntegralHom (PELModuli.normalizedModel_toGood f) := sorry

/-- LTXZZ's CM moduli presheaf `T¹_p(W₀, K^p₀)`: unitary `O_F`-abelian schemes of CM signature
type with `p`-principal polarization and level (objects over a ring `R`). -/
structure cmModuli1 (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (OF : Type*) [CommRing OF]
    [StarRing OF] (p : ℕ) where
  R : CommRingCat.{u}
  X : UnitaryOFAbelianScheme (𝒜 R) OF
  pPrincipal : X.pol.IsQuasiP p

/-- The representing chart of `T¹_p` (data). -/
def cmModuli1.chart (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (OF : Type*) [CommRing OF]
    [StarRing OF] (p : ℕ) (S : Scheme.{u}) : Σ U : Scheme.{u}, U ⟶ S := sorry

/-- For neat `K^p₀`, `T¹_p` is represented by a finite étale scheme over `O_{F_Φ} ⊗ ℤ_(p)`. -/
theorem cmModuli1_represented (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (OF : Type*)
    [CommRing OF] [StarRing OF] (p : ℕ) (S : Scheme.{u}) :
    IsFinite (cmModuli1.chart 𝒜 OF p S).2 ∧ Etale (cmModuli1.chart 𝒜 OF p S).2 := sorry

/-- `w : T¹_p(ℂ) → ker¹(T₀)`, the similarity class of `H₁(A₀(ℂ), ℤ_(p))`. -/
def cmModuli1_w {𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R} {OF : Type*} [CommRing OF]
    [StarRing OF] {p : ℕ} (ker1T0 : Type) (_x : cmModuli1 𝒜 OF p) : ker1T0 := sorry

/-- `T_p(W₀, K^p₀)`: the part of `T¹_p` with `w = [W₀]` (minimal open-closed subscheme on
`ℂ`-points). -/
def cmModuli (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (OF : Type*) [CommRing OF]
    [StarRing OF] (p : ℕ) (ker1T0 : Type) (W₀ : ker1T0) : Type _ :=
  {x : cmModuli1 𝒜 OF p // cmModuli1_w ker1T0 x = W₀}

/-- The action of `T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀` by `η₀^p ↦ η₀^p ∘ a`. -/
@[instance_reducible]
def cmModuli_act (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (OF : Type*) [CommRing OF]
    [StarRing OF] (p : ℕ) (ker1T0 : Type) (W₀ : ker1T0) (Γ : Type*) [Group Γ] :
    MulAction Γ (cmModuli 𝒜 OF p ker1T0 W₀) := sorry

/-- `T¹_p` is the rank-one unitary PEL problem: points give PEL triples. -/
def cmModuli_eq_pel {𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R} {OF : Type*} [CommRing OF]
    [StarRing OF] {p : ℕ} (x : cmModuli1 𝒜 OF p) (box : Set ℕ) (hbox : x.X.pol.IsPrimeTo box)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → OF) (detV₀ : MvPolynomial ι x.R)
    [Module.Free x.R ((𝒜 x.R).lie x.X.A)] [Module.Finite x.R ((𝒜 x.R).lie x.X.A)] :
    PELTriple (𝒜 x.R) OF box α detV₀ :=
  UnitaryOFAbelianScheme.toPELTriple x.X box hbox α detV₀

/-- The groupoid `𝔗` of `Γ = T₀(𝔸^{∞,p})/T₀(ℤ_(p))K^p₀`: one object, automorphisms `Γ`. -/
abbrev torusGroupoid (Γ : Type*) [Group Γ] := CategoryTheory.SingleObj Γ

-- TauCeti.PEL.tests.cmModuli_imagQuad_points
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (p : ℕ) (ker1T0 : Type) (W₀ : ker1T0)
    (Γ : Type) [Group Γ] [Finite Γ] (x₀ : cmModuli 𝒜 GaussianInt p ker1T0 W₀) :
    Nat.card (cmModuli 𝒜 GaussianInt p ker1T0 W₀) = Nat.card Γ := sorry
-- TauCeti.PEL.tests.cmModuli_relDim_zero
example {F : Type*} [Field F] (Φ : GeneralizedCMType F 1) (S : Finset (F →+* ℂ)) :
    ∑ τ ∈ S, Φ.coeff τ * Φ.coeff (NumberField.ComplexEmbedding.conjugate τ) = 0 :=
  Finset.sum_eq_zero fun τ _ => Nat.mul_eq_zero.mpr (by have := Φ.sum_conj τ; omega)
-- TauCeti.PEL.tests.cmModuli_not_principal
example {R : CommRingCat.{u}} {A : AbelianScheme (Spec R)} (f : A.Hom A) (p : ℕ) (hp : p.Prime) :
    ¬ QuasiIsogeny.IsQuasiP p (⟨f, p, hp.pos⟩ : QuasiIsogeny A A) := fun h => h dvd_rfl
-- TauCeti.PEL.tests.cmModuli_empty_type
example (S : SkewHermitianSpace ℚ ℚ ℚ) (P : Set ℚ) (a : ℚ) (ha : a ∈ P) (x : ℚ)
    (hneg : S.pairing (a • x) x < 0) : ¬ S.HasType P := fun h => absurd (h a ha x) (not_le.mpr hneg)

/-- `T_p → Spec(O_{F_Φ} ⊗ ℤ_(p))` is Galois with group `Γ` (`M4/cm-moduli-galois`): the action
on points is free and transitive. -/
theorem cmModuliGalois (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (OF : Type*)
    [CommRing OF] [StarRing OF] (p : ℕ) (ker1T0 : Type) (W₀ : ker1T0) (Γ : Type*) [Group Γ]
    [Finite Γ] :
    letI := cmModuli_act 𝒜 OF p ker1T0 W₀ Γ
    MulAction.IsPretransitive Γ (cmModuli 𝒜 OF p ker1T0 W₀) ∧
      ∀ (g : Γ) (x : cmModuli 𝒜 OF p ker1T0 W₀), g • x = x → g = 1 := sorry

/-- `𝔗`-invariant cohomology: the `Γ`-invariants of a cohomology group with `Γ`-action. -/
def torusInvariantCohomology (Γ : Type*) [Group Γ] (H : Type*) [AddCommGroup H]
    [DistribMulAction Γ H] : AddSubgroup H where
  carrier := {x | ∀ g : Γ, g • x = x}
  add_mem' := by intro a b ha hb g; simp [smul_add, ha g, hb g]
  zero_mem' := by intro g; simp
  neg_mem' := by intro a ha g; simp [smul_neg, ha g]

theorem torusInvariantCohomology_functorial (Γ : Type*) [Group Γ] {H H' : Type*} [AddCommGroup H]
    [DistribMulAction Γ H] [AddCommGroup H'] [DistribMulAction Γ H'] (f : H →+ H')
    (hf : ∀ (g : Γ) x, f (g • x) = g • f x) (x : H) (hx : x ∈ torusInvariantCohomology Γ H) :
    f x ∈ torusInvariantCohomology Γ H' := fun g => by rw [← hf, hx g]

/-- The `𝔗`-trace: sum of the traces of the components in a set of orbit representatives. -/
def torusTrace {C Hc L : Type*} [AddCommMonoid L] (reps : Finset C) (tr : C → Hc → L) (x : Hc) : L :=
  ∑ c ∈ reps, tr c x

theorem torusTrace_indep {C Hc L : Type*} [AddCommMonoid L] (reps reps' : Finset C)
    (tr : C → Hc → L) (x : Hc) (e : reps ≃ reps') (he : ∀ c, tr (e c) x = tr c x) :
    torusTrace reps tr x = torusTrace reps' tr x := sorry

theorem torusTrace_trivial {C Hc L : Type*} [AddCommMonoid L] (c : C) (tr : C → Hc → L) (x : Hc) :
    torusTrace {c} tr x = tr c x := by simp [torusTrace]

-- TauCeti.PEL.tests.torusTrace_trivial_group
example (tr : Unit → ℚ → ℚ) (x : ℚ) : torusTrace {()} tr x = tr () x := torusTrace_trivial () tr x
-- TauCeti.PEL.tests.torusTrace_two_orbits
example (tr : Bool → ℚ → ℚ) (x : ℚ) : torusTrace {true} tr x = tr true x := torusTrace_trivial _ _ _
-- TauCeti.PEL.tests.torusTrace_not_average
example (tr : Bool → ℚ → ℚ) (x : ℚ) (hsame : tr true x = tr false x) (h : tr true x ≠ 0) :
    torusTrace {true} tr x ≠ torusTrace {true, false} tr x := sorry

end M4

/-! ## M5. Required examples -/

section M5

/-- The Gram matrix of the Siegel lattice `L_D` of type `D = (d₁ | … | d_g)`:
`⟨e_i, f_j⟩ = d_i δ_ij`, alternating. -/
def siegelGram (g : ℕ) (d : Fin g → ℤ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ :=
  Matrix.fromBlocks 0 (Matrix.diagonal d) (-Matrix.diagonal d) 0

/-- The Siegel integral PEL datum of genus `g` and type `D`: its pairing on `L_D = ℤ^{2g}`
(`O = ℤ`, trivial involution; `J_D e_i = f_i`, `J_D f_i = −e_i`). -/
def siegelDatum (g : ℕ) (d : Fin g → ℤ) : LinearMap.BilinForm ℤ (Fin g ⊕ Fin g → ℤ) :=
  Matrix.toBilin' (siegelGram g d)

/-- Principal type: the Gram matrix is `−J`, so the similitude group is `GSp_{2g}` and
`G₁ = Sp_{2g}` (Mathlib's `Matrix.symplecticGroup`). -/
theorem siegelDatum_group (g : ℕ) : siegelGram g (fun _ => 1) = -Matrix.J (Fin g) ℤ := sorry

/-- Reflex field `ℚ`: for `B = ℚ` the determinant polynomial of `V₀ = ℚ^g` is `X^g`. -/
theorem siegelDatum_reflex (g : ℕ) :
    ((Polynomial.X : Polynomial ℚ) • (1 : Matrix (Fin g) (Fin g) (Polynomial ℚ))).det = Polynomial.X ^ g := by
  simp

theorem siegelDatum_badPrimes (n dg p : ℕ) :
    PELDatum.IsGoodPrime n 1 1 (dg ^ 2) p ↔ ¬ p ∣ n * dg ^ 2 := by
  simp [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]

theorem siegelDatum_dualIndex (g : ℕ) (d : Fin g → ℤ) :
    (siegelGram g d).det = (∏ i, d i) ^ 2 := sorry

/-- Signatures `(g, g)`: the `+i`-eigenspace of `J` on `ℂ^{2g}` has dimension `g`. -/
theorem siegelDatum_signature (g : ℕ) :
    Module.finrank ℂ (LinearMap.ker (Matrix.toLin' ((Matrix.J (Fin g) ℚ).map (algebraMap ℚ ℂ) -
      Complex.I • (1 : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℂ)))) = g := sorry

/-- `J² = −1`: `h(i) = J` is a complex structure on `V_ℝ` (the point of the Siegel half space). -/
theorem siegelDatum_shimura (g : ℕ) :
    (Matrix.J (Fin g) ℚ) * (Matrix.J (Fin g) ℚ) = -1 := sorry

theorem siegelDatum_type (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, d i ≠ 0) :
    (siegelGram g d).det ≠ 0 := sorry

end M5

-- TauCeti.PEL.tests.siegelDatum_index_12
example : (siegelGram 2 ![1, 2]).det = 4 ∧ ¬ PELDatum.IsGoodPrime 3 1 1 4 2 ∧
    ¬ PELDatum.IsGoodPrime 3 1 1 4 3 ∧ PELDatum.IsGoodPrime 3 1 1 4 5 := sorry
-- TauCeti.PEL.tests.siegelDatum_principal_good
example (p : ℕ) (hp : p.Prime) : PELDatum.IsGoodPrime 1 1 1 1 p := by
  simp [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger, hp.ne_one]
-- TauCeti.PEL.tests.siegelDatum_shimura_indep
example : ∃ P : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℚ, IsUnit P.det ∧
    P.transpose * (siegelGram 2 ![1, 2]).map (Int.cast : ℤ → ℚ) * P =
      (siegelGram 2 ![1, 1]).map (Int.cast : ℤ → ℚ) := sorry
-- TauCeti.PEL.tests.siegelDatum_not_type_unordered
example : ∃ P : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℤ, IsUnit P.det ∧
    P.transpose * siegelGram 2 ![2, 1] * P = siegelGram 2 ![1, 2] := sorry

/-- Siegel moduli `A_{g,D,n}` (`M5/siegel-moduli`): smooth of relative dimension `g(g+1)/2`, the
rank of `Sym²` of a rank-`g` space. -/
theorem siegelModuli (k : Type*) [Field k] (g : ℕ) :
    Module.finrank k (symmetricMatrices k g) = g * (g + 1) / 2 := kodairaSpencerDimension k g

/-- Genus one (`M5/genus-one-comparison`): in coordinates `P = (a, c)`, `Q = (b, d)` on
`E[n] ≅ (ℤ/n)²` the Weil pairing is `ζ^{ad − bc}`, so a symplectic basis is one of determinant 1. -/
theorem genusOneComparison (n : ℕ) (P Q : ZMod n × ZMod n) :
    Matrix.det !![P.1, Q.1; P.2, Q.2] = P.1 * Q.2 - Q.1 * P.2 := by
  simp [Matrix.det_fin_two]

/-- The Hilbert example satisfies the M0–M4 contracts (`M5/hilbert-example-acceptance`): `I_bad = 1`
(type C), so the good primes are those prime to `n · Disc(O_F) · [L^# : L]`; and the reflex field is
`ℚ` (the determinant polynomial is the norm form, rational on `ℚ`). -/
theorem hilbertExampleAcceptance (F : Type*) [Field F] [NumberField F] (n idx p : ℕ) :
    (PELDatum.IsGoodPrime n 1 (NumberField.discr F).natAbs idx p ↔
      ¬ p ∣ n * (NumberField.discr F).natAbs * idx) ∧
    ∀ q : ℚ, Algebra.norm ℚ (algebraMap ℚ F q) = q ^ Module.finrank ℚ F := by
  refine ⟨by simp [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger], fun q => ?_⟩
  exact Algebra.norm_algebraMap q

/-- The unitary PEL datum: `⟨x, y⟩ = Tr_{K/ℚ}(δ H(x, y))` from a hermitian form `H` and a totally
imaginary `δ`. -/
def unitaryDatum {K : Type*} [Field K] [NumberField K] [StarRing K] {W : Type*} [AddCommGroup W]
    [Module K W] (H : HermitianSpace K W) (δ : K) : W → W → ℚ :=
  fun x y => Algebra.trace ℚ K (δ * H.pairing x y)

namespace unitaryDatum
variable {K : Type*} [Field K] [NumberField K] [StarRing K] {W : Type*} [AddCommGroup W]
  [Module K W]

/-- Isometries of `H` preserve the pairing: `U(V) ⊂ G₁`. -/
theorem _root_.TauCeti.PEL.unitaryDatum_group (H : HermitianSpace K W) (g : W ≃ₗ[K] W)
    (hg : g ∈ H.unitaryGroup) (δ : K) (x y : W) :
    unitaryDatum H δ (g x) (g y) = unitaryDatum H δ x y := by
  simp only [unitaryDatum]
  rw [show H.pairing (g x) (g y) = H.pairing x y from hg x y]

/-- Replacing `δ` by `−δ` negates the pairing (`unitaryDatum_wrong_delta`). -/
theorem neg_delta (H : HermitianSpace K W) (δ : K) (x y : W) :
    unitaryDatum H (-δ) x y = -unitaryDatum H δ x y := by
  simp [unitaryDatum, neg_mul, map_neg]

end unitaryDatum

/-- The signature matrix `diag(1_r, −1_s)` of a hermitian form of signature `(r, s)`. -/
def signatureMatrix (r s : ℕ) : Matrix (Fin r ⊕ Fin s) (Fin r ⊕ Fin s) ℝ :=
  Matrix.fromBlocks 1 0 0 (-1)

/-- Signature `(s, r)` at `τ̄`: the conjugate form has the negated signature matrix, which is
`diag(1_s, −1_r)` after swapping the blocks. -/
theorem unitaryDatum_signature (r s : ℕ) :
    Matrix.reindex (Equiv.sumComm _ _) (Equiv.sumComm _ _) (-signatureMatrix r s) =
      signatureMatrix s r := sorry

/-- Reflex field: complex conjugation fixes `Ψ = r τ + s τ̄` iff `r = s` (for `K` imaginary
quadratic the reflex field is `ℚ` iff `r = s`, else `K`). -/
theorem unitaryDatum_reflex (r s : ℕ) : (r, s) = (s, r) ↔ r = s :=
  ⟨fun h => (Prod.ext_iff.mp h).1, fun h => h ▸ rfl⟩

theorem unitaryDatum_relDim (r s : ℕ) : Module.finrank ℂ (Matrix (Fin r) (Fin s) ℂ) = r * s := by
  simp [Module.finrank_matrix]

theorem unitaryDatum_badPrimes (n disc idx p : ℕ) :
    PELDatum.IsGoodPrime n 1 disc idx p ↔ ¬ p ∣ n * 1 * disc * idx := Iff.rfl

/-- The symmetric domain of `U(r, s)` has positive dimension iff `r s ≠ 0`; for `r s = 0` (definite)
it is a point and SV3 fails. -/
theorem unitaryDatum_shimura (r s : ℕ) :
    Module.finrank ℂ (Matrix (Fin r) (Fin s) ℂ) = 0 ↔ r * s = 0 := by
  simp [Module.finrank_matrix]

/-- `ker¹(ℚ, GU(V)) = 1` for even hermitian dimension (`m = 1`, Case A). -/
theorem unitaryDatum_ker1 {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (n : ℕ) (hB : Module.finrank ℚ B = 1 ^ 2 * Module.finrank ℚ (Subalgebra.center ℚ B))
    (hV : Module.finrank ℚ V = 1 * n * Module.finrank ℚ (Subalgebra.center ℚ B)) (hn : Even n) :
    Subsingleton (PELModuli.ker1 D) :=
  hassePrincipleCases D {AlbertType.A} (by simp) 1 n hB hV (fun _ => hn)

-- TauCeti.PEL.tests.unitaryDatum_picard_reflex
example : (2, 1) ≠ (1, 2) ∧ Module.finrank ℂ (Matrix (Fin 2) (Fin 1) ℂ) = 2 :=
  ⟨fun h => absurd ((unitaryDatum_reflex 2 1).mp h) (by decide), unitaryDatum_relDim 2 1⟩
-- TauCeti.PEL.tests.unitaryDatum_U11
example : (1, 1) = (1, 1) ∧ Module.finrank ℂ (Matrix (Fin 1) (Fin 1) ℂ) = 1 :=
  ⟨(unitaryDatum_reflex 1 1).mpr rfl, unitaryDatum_relDim 1 1⟩
-- TauCeti.PEL.tests.unitaryDatum_definite
example (n : ℕ) : Module.finrank ℂ (Matrix (Fin n) (Fin 0) ℂ) = 0 :=
  (unitaryDatum_shimura n 0).mpr (mul_zero n)
-- TauCeti.PEL.tests.unitaryDatum_wrong_delta
example {K : Type*} [Field K] [NumberField K] [StarRing K] {W : Type*} [AddCommGroup W]
    [Module K W] (H : HermitianSpace K W) (δ : K) (x : W) (hpos : 0 < unitaryDatum H δ x x) :
    unitaryDatum H (-δ) x x < 0 := by
  rw [unitaryDatum.neg_delta]; linarith

/-- Unitary examples (`M5/unitary-examples`): relative dimensions 2 (Picard, `U(2,1)`), 1 (`U(1,1)`)
and 4 (`U(2,2)`). -/
theorem unitaryExamples :
    Module.finrank ℂ (Matrix (Fin 2) (Fin 1) ℂ) = 2 ∧ Module.finrank ℂ (Matrix (Fin 1) (Fin 1) ℂ) = 1 ∧
      Module.finrank ℂ (Matrix (Fin 2) (Fin 2) ℂ) = 4 := by simp [Module.finrank_matrix]

/-- A nonprincipal type (`M5/nonprincipal-type-example`): type `(1, p)` has `[L^# : L] = p²`, so
`p` is bad. -/
theorem nonprincipalTypeExample (p : ℕ) : ¬ PELDatum.IsGoodPrime 1 1 1 (p ^ 2) p := by
  intro h; apply h; simp [PELDatum.badPrimeInteger]

/-! ## M6. Arithmetic moduli -/

section M6
variable {B : Type*} [Ring B] [Algebra ℚ B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
  [Module B V] [IsScalarTower ℚ B V]

/-- Level-forgetting maps (`M6/level-forgetting-maps`): for `H' ⊲ H` the map `M_{H'} → M_H` is
finite étale Galois with group `H/H'`, of degree `[H : H']`. -/
theorem levelForgettingMaps (G : Type*) [Group G] (H' H : Subgroup G) (hle : H' ≤ H)
    [(H'.subgroupOf H).Normal] [Finite H] :
    Nat.card (H ⧸ H'.subgroupOf H) * Nat.card H' = Nat.card H := sorry

/-- The moduli stack at arbitrary level as the quotient `[M_{H'}/(H/H')]`
(`M6/arbitrary-level-stack`): on points, the orbit set of the finite group action. -/
def arbitraryLevelQuotient (Γ X : Type*) [Group Γ] [MulAction Γ X] : Type _ :=
  MulAction.orbitRel.Quotient Γ X

theorem arbitraryLevelStack (Γ X : Type*) [Group Γ] [Finite Γ] [MulAction Γ X] [Finite X] :
    Finite (arbitraryLevelQuotient Γ X) := sorry

/-- `𝔄_g` over `ℤ` is glued from the level-3 and level-4 presentations (`M6/siegel-stack-over-z`):
`ℤ[1/3]` and `ℤ[1/4]` cover `Spec ℤ`, i.e. `3` and `4` generate the unit ideal. -/
theorem siegelStackOverZ : Ideal.span {(3 : ℤ), 4} = ⊤ := by
  rw [Ideal.eq_top_iff_one]
  have : (1 : ℤ) = (-1) * 3 + 1 * 4 := by norm_num
  rw [this]
  exact Ideal.add_mem _ (Ideal.mul_mem_left _ _ (Ideal.subset_span (by simp)))
    (Ideal.mul_mem_left _ _ (Ideal.subset_span (by simp)))

/-- Finite type (`M6/polarized-stack-finite-type`), on the representing chart over any base,
including characteristics dividing the polarization degree. -/
theorem polarizedStackFiniteType (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) (hn : 3 ≤ n) :
    LocallyOfFiniteType (PELModuli.representingChart D S₀ n).2 ∧
      QuasiCompact (PELModuli.representingChart D S₀ n).2 := sorry

/-- The coarse moduli space `M^c_H` over `S₀` (from Keel–Mori, AlgebraicModuliForArithmeticGeometry
R09.5). -/
def PELModuli.coarseSpace (_D : RationalPELDatum B V) (S₀ : Scheme.{u}) (_n : ℕ) : Over S₀ := sorry

/-- Isomorphism classes of objects of `M_H` over a field `k` (data). -/
def PELModuli.objectsOverField (_D : RationalPELDatum B V) (_n : ℕ) (k : Type u) [Field k] :
    Type u := sorry

/-- The coarse map from the neat-level chart. -/
def PELModuli.toCoarse (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) :
    (PELModuli.representingChart D S₀ n).1 ⟶ (PELModuli.coarseSpace D S₀ n).left := sorry

/-- Coarse moduli space (`M6/coarse-moduli-space`): over an algebraically closed field the
isomorphism classes are the `k`-points of `M^c_H` over a given `s : Spec k → S₀`. -/
theorem coarseModuliSpace (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) (k : Type u)
    [Field k] [IsAlgClosed k] (s : Spec (CommRingCat.of k) ⟶ S₀) :
    Nonempty (PELModuli.objectsOverField D n k ≃
      {x : Spec (CommRingCat.of k) ⟶ (PELModuli.coarseSpace D S₀ n).left //
        x ≫ (PELModuli.coarseSpace D S₀ n).hom = s}) := sorry

/-- Quasi-projective realization (`M6/quasi-projective-realization`): `M^c_H` is an open
subscheme of a proper (projective, ShimuraCompactifications C5) scheme over `S₀`. -/
theorem quasiProjectiveRealization (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) :
    ∃ (P : Over S₀) (ι : (PELModuli.coarseSpace D S₀ n).left ⟶ P.left),
      IsImmersion ι ∧ IsProper P.hom ∧ ι ≫ P.hom = (PELModuli.coarseSpace D S₀ n).hom := sorry

/-- The field of moduli: the fixed field of the stabilizer of an isomorphism class under a Galois
action on classes. -/
def fieldOfModuli {k K : Type*} [Field k] [Field K] [Algebra k K] {Cl : Type*}
    [MulAction (K ≃ₐ[k] K) Cl] (x : Cl) : IntermediateField k K :=
  IntermediateField.fixedField (MulAction.stabilizer (K ≃ₐ[k] K) x)

section FieldOfModuli
variable {k K : Type*} [Field k] [Field K] [Algebra k K] {Cl : Type*} [MulAction (K ≃ₐ[k] K) Cl]

/-- `k(ξ)` is the field of definition of the coarse point: the fixed field of the stabilizer of
the class. -/
theorem fieldOfModuli_eq_residue (x : Cl) :
    (fieldOfModuli (k := k) (K := K) x).fixingSubgroup = MulAction.stabilizer (K ≃ₐ[k] K) x :=
  sorry

theorem fieldOfModuli_le_of_model (x : Cl) (k₁ : IntermediateField k K)
    (hmodel : ∀ σ ∈ k₁.fixingSubgroup, σ • x = x) : fieldOfModuli (k := k) (K := K) x ≤ k₁ := sorry

theorem fieldOfModuli_galois (x : Cl) (σ : K ≃ₐ[k] K) :
    fieldOfModuli (k := k) (K := K) (σ • x) = (fieldOfModuli (k := k) (K := K) x).map σ.toAlgHom :=
  sorry

/-- No automorphisms (neat level): the class is Galois-fixed exactly over `k(ξ)`, where it has a
model (descent is effective). -/
theorem fieldOfModuli_fine (x : Cl) (hfine : ∀ σ : K ≃ₐ[k] K, σ • x = x) :
    fieldOfModuli (k := k) (K := K) x = IntermediateField.fixedField ⊤ := by
  have : MulAction.stabilizer (K ≃ₐ[k] K) x = ⊤ := by
    ext σ; simp [MulAction.mem_stabilizer_iff, hfine σ]
  simp [fieldOfModuli, this]

end FieldOfModuli

-- TauCeti.PEL.tests.fieldOfModuli_elliptic
example : (WeierstrassCurve.ofJ (1728 : ℚ)).j = 1728 := WeierstrassCurve.ofJ_j 1728
-- TauCeti.PEL.tests.fieldOfModuli_le
example {k K : Type*} [Field k] [Field K] [Algebra k K] {Cl : Type*} [MulAction (K ≃ₐ[k] K) Cl]
    (x : Cl) (k₁ : IntermediateField k K) (hmodel : ∀ σ ∈ k₁.fixingSubgroup, σ • x = x) :
    fieldOfModuli (k := k) (K := K) x ≤ k₁ := fieldOfModuli_le_of_model x k₁ hmodel
-- TauCeti.PEL.tests.fieldOfModuli_twist
example (c₄ Δ d : ℚ) (hΔ : Δ ≠ 0) (hd : d ≠ 0) :
    (d ^ 2 * c₄) ^ 3 / (d ^ 6 * Δ) = c₄ ^ 3 / Δ := by
  field_simp
-- TauCeti.PEL.tests.fieldOfModuli_base
example {k K : Type*} [Field k] [Field K] [Algebra k K] {Cl : Type*} [MulAction (K ≃ₐ[k] K) Cl]
    (x : Cl) (h : ∀ σ : K ≃ₐ[k] K, σ • x = x) :
    fieldOfModuli (k := k) (K := K) x = IntermediateField.fixedField ⊤ := fieldOfModuli_fine x h

/-- Nonabelian `1`-cocycles `c(στ) = c(σ) · σ(c(τ))` of `Γ` with values in `Aut`. -/
def NonabelianCocycle (Γ Aut : Type*) [Group Γ] [Group Aut] [MulDistribMulAction Γ Aut] : Type _ :=
  {c : Γ → Aut // ∀ σ τ, c (σ * τ) = c σ * σ • c τ}

/-- Cohomologous cocycles: `c'(σ) = b⁻¹ c(σ) σ(b)`; the quotient is `H¹(Γ, Aut)`. -/
def NonabelianCocycle.setoid (Γ Aut : Type*) [Group Γ] [Group Aut] [MulDistribMulAction Γ Aut] :
    Setoid (NonabelianCocycle Γ Aut) where
  r c c' := ∃ b : Aut, ∀ σ, c'.1 σ = b⁻¹ * c.1 σ * σ • b
  iseqv := sorry

/-- `K`-forms of an object `ξ₀` over `K` that become isomorphic to `ξ₀` over `K'` (data). -/
def PELModuli.forms (_D : RationalPELDatum B V) (_n : ℕ) (K K' : Type u) [Field K] [Field K']
    [Algebra K K'] (_ξ₀ : PELModuli.objectsOverField _D _n K) : Type u := sorry

/-- Automorphisms of `ξ₀ ⊗ K'`, with the Galois action (data). -/
def PELModuli.autOver (_D : RationalPELDatum B V) (_n : ℕ) (K K' : Type u) [Field K] [Field K']
    [Algebra K K'] (_ξ₀ : PELModuli.objectsOverField _D _n K) : Type u := sorry

/-- Forms and the descent obstruction (`M6/forms-and-descent-obstruction`): forms split by a finite
Galois `K'/K` correspond to `H¹(Gal(K'/K), Aut(ξ₀ ⊗ K'))`. -/
theorem formsAndDescentObstruction (D : RationalPELDatum B V) (n : ℕ) (K K' : Type u) [Field K]
    [Field K'] [Algebra K K'] [FiniteDimensional K K'] [IsGalois K K']
    (ξ₀ : PELModuli.objectsOverField D n K) [Group (PELModuli.autOver D n K K' ξ₀)]
    [MulDistribMulAction (K' ≃ₐ[K] K') (PELModuli.autOver D n K K' ξ₀)] :
    Nonempty (PELModuli.forms D n K K' ξ₀ ≃
      Quotient (NonabelianCocycle.setoid (K' ≃ₐ[K] K') (PELModuli.autOver D n K K' ξ₀))) := sorry

/-- Tsimerman Lemma 4.1 (`M6/bounded-field-of-definition`): `[F' : F] ≤ 2 · 3^{4g²}`, since the
level-3 structure is defined over an extension with group inside `GL_{2g}(𝔽₃)`. -/
theorem boundedFieldOfDefinition (g : ℕ) :
    Fintype.card (GL (Fin (2 * g)) (ZMod 3)) ≤ 3 ^ (4 * g ^ 2) := sorry

/-- The Hodge bundle `ω_{A/R}` (dual of `Lie`) of an abelian scheme over `Spec R`. -/
def hodgeBundle {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (A : AbelianScheme (Spec R)) :
    ModuleCat.{u} R := ModuleCat.of R (Module.Dual R (𝒜.lie A))

/-- The Hodge line `ω̄ = det ω` (top exterior power). -/
def hodgeLine {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (A : AbelianScheme (Spec R)) :
    ModuleCat.{u} R := ModuleCat.of R (⋀[R]^(Module.finrank R (𝒜.lie A)) (Module.Dual R (𝒜.lie A)))

/-- The map on Lie algebras induced by a homomorphism (supplied by A1). -/
def AbelianSchemeSupplier.lieMap {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {A B : AbelianScheme (Spec R)} (_φ : A.Hom B) : 𝒜.lie A →ₗ[R] 𝒜.lie B := sorry

namespace hodgeBundle
variable {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (A : AbelianScheme (Spec R))

/-- Base change: `ω` commutes with base change along `R → S'` (given a supplier over `S'` with
`Lie` compatible with base change). -/
theorem _root_.TauCeti.PEL.hodgeBundle_baseChange (S' : CommRingCat.{u}) [Algebra R S']
    (𝒜' : AbelianSchemeSupplier S') (A' : AbelianScheme (Spec S'))
    (hlie : (S' ⊗[R] 𝒜.lie A) ≃ₗ[S'] 𝒜'.lie A') [Module.Free R (𝒜.lie A)]
    [Module.Finite R (𝒜.lie A)] :
    Nonempty ((S' ⊗[R] hodgeBundle 𝒜 A) ≃ₗ[S'] hodgeBundle 𝒜' A') := sorry

theorem _root_.TauCeti.PEL.hodgeBundle_dual_lie :
    (hodgeBundle 𝒜 A : Type u) = Module.Dual R (𝒜.lie A) := rfl

/-- An étale isogeny induces an isomorphism on `ω` (`φ^* = (dφ)^∨`). -/
theorem _root_.TauCeti.PEL.hodgeBundle_isogeny {B : AbelianScheme (Spec R)} (φ : A.Hom B)
    [Etale φ.f] : Function.Bijective (𝒜.lieMap φ).dualMap := sorry

/-- `ω` is locally free of rank `g = dim A`. -/
theorem _root_.TauCeti.PEL.hodgeBundle_universal [Module.Free R (𝒜.lie A)]
    [Module.Finite R (𝒜.lie A)] :
    Module.finrank R (hodgeBundle 𝒜 A) = Module.finrank R (𝒜.lie A) := sorry

/-- The Hodge filtration `0 → ω_A → H¹_dR(A) → Lie(A^∨) → 0`: ranks `g + g = 2g`, i.e.
`dim A^∨ = dim A`. -/
theorem _root_.TauCeti.PEL.hodgeBundle_hodgeFiltration :
    Module.finrank R (𝒜.lie (𝒜.dual A)) = Module.finrank R (𝒜.lie A) := sorry

end hodgeBundle

/-- For the Siegel datum, `Sym² ω ≅ Ω¹`: ranks `g(g+1)/2`. -/
theorem hodgeLine_ks_siegel (k : Type*) [Field k] (g : ℕ) :
    Module.finrank k (symmetricMatrices k g) = g * (g + 1) / 2 := kodairaSpencerDimension k g

/-- `ω̄_{A×B} ≅ ω̄_A ⊗ ω̄_B`: `det (M ⊕ N) ≅ det M ⊗ det N` for free modules of ranks `a`, `b`. -/
theorem hodgeLine_product (k : Type*) [Field k] (a b : ℕ) :
    Nonempty ((⋀[k]^(a + b) ((Fin a → k) × (Fin b → k))) ≃ₗ[k]
      ((⋀[k]^a (Fin a → k)) ⊗[k] (⋀[k]^b (Fin b → k)))) := sorry

-- TauCeti.PEL.tests.hodgeLine_g1
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (A : AbelianScheme (Spec R))
    [Module.Free R (𝒜.lie A)] [Module.Finite R (𝒜.lie A)] (h : Module.finrank R (𝒜.lie A) = 1) :
    Nonempty (hodgeLine 𝒜 A ≅ hodgeBundle 𝒜 A) := sorry
-- TauCeti.PEL.tests.hodgeLine_product_test
example (k : Type*) [Field k] :
    Nonempty ((⋀[k]^(1 + 1) ((Fin 1 → k) × (Fin 1 → k))) ≃ₗ[k]
      ((⋀[k]^1 (Fin 1 → k)) ⊗[k] (⋀[k]^1 (Fin 1 → k)))) := hodgeLine_product k 1 1
-- TauCeti.PEL.tests.hodgeBundle_frobenius_not_iso
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) [Nontrivial R]
    {A B : AbelianScheme (Spec R)} (φ : A.Hom B) [Module.Free R (𝒜.lie B)]
    [Nontrivial (𝒜.lie B)] (hφ : 𝒜.lieMap φ = 0) : ¬ Function.Bijective (𝒜.lieMap φ).dualMap := sorry
-- TauCeti.PEL.tests.hodgeBundle_zero
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (A : AbelianScheme (Spec R))
    [Subsingleton (𝒜.lie A)] :
    Subsingleton (hodgeBundle 𝒜 A) ∧ Nonempty (hodgeLine 𝒜 A ≅ ModuleCat.of R R) := sorry

namespace PELModuli

/-- The classifying map of an object into the moduli problem (to the universal object on a chart). -/
def classifyingMap {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*} [Ring O]
    [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
    (detV₀ : MvPolynomial ι R) (T : PELTriple 𝒜 O box α detV₀) :
    PELTriple.Hom T (PELModuli.universal 𝒜 box α detV₀) := classify 𝒜 box α detV₀ T

/-- The moduli point `x_A ∈ M^c(K)` of an object over a field `K`. -/
def moduliPoint (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) (K : Type u) [Field K] :
    objectsOverField D n K → (Spec (CommRingCat.of K) ⟶ (coarseSpace D S₀ n).left) := sorry

/-- The rigidifying extension `K'`: the fixed field of the stabilizer of a level-`H'` structure
under the Galois action on level structures. -/
def rigidifyingExtension {k K : Type*} [Field k] [Field K] [Algebra k K] {Lv : Type*}
    [MulAction (K ≃ₐ[k] K) Lv] (xLevel : Lv) : IntermediateField k K := fieldOfModuli xLevel

/-- `c_ξ^* ω̄^univ ≅ ω̄_{A_ξ}`. -/
theorem hodgeLine_classify {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*}
    [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
    (detV₀ : MvPolynomial ι R) (T : PELTriple 𝒜 O box α detV₀) :
    Nonempty (hodgeLine 𝒜 T.A ≅ hodgeLine 𝒜 (PELModuli.universal 𝒜 box α detV₀).A) := sorry

/-- At neat level the coarse map is an isomorphism, so every `K`-point of `M^c` comes from an
object over `K` (the residual gerbe is neutral). -/
theorem export_obstruction (D : RationalPELDatum B V) (S₀ : Scheme.{u}) (n : ℕ) (hn : 3 ≤ n) :
    IsIso (toCoarse D S₀ n) := sorry

/-- For `𝔄_g`: the universal principally polarized abelian scheme (`O = ℤ`, `detV₀ = X`). -/
def export_siegel {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) (box : Set ℕ) :
    PELTriple 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1) :=
  PELModuli.universal 𝒜 box _ _

end PELModuli

-- TauCeti.PEL.tests.export_classify_universal
example {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {O : Type*} [Ring O] [StarRing O]
    (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O) (detV₀ : MvPolynomial ι R) :
    (PELModuli.classifyingMap 𝒜 box α detV₀ (PELModuli.universal 𝒜 box α detV₀)).f.f = 𝟙 _ :=
  sorry
-- TauCeti.PEL.tests.export_g1_point
example : (WeierstrassCurve.ofJ (1728 : ℚ)).j = 1728 := WeierstrassCurve.ofJ_j 1728
-- TauCeti.PEL.tests.export_not_family
example : ∃ E E' : WeierstrassCurve ℚ, E.Δ ≠ 0 ∧ E.c₄ ^ 3 * E'.Δ = E'.c₄ ^ 3 * E.Δ ∧
    ¬ ∃ C : WeierstrassCurve.VariableChange ℚ, C • E = E' := sorry
-- TauCeti.PEL.tests.export_trivial_level
example {k K : Type*} [Field k] [Field K] [Algebra k K] {Lv : Type*} [MulAction (K ≃ₐ[k] K) Lv]
    (x : Lv) (h : ∀ σ : K ≃ₐ[k] K, σ • x = x) :
    PELModuli.rigidifyingExtension (k := k) (K := K) x = IntermediateField.fixedField ⊤ :=
  fieldOfModuli_fine x h

/-- Finite-field finiteness (`M6/finite-field-finiteness`): over a finite field there are finitely
many isomorphism classes. -/
theorem finiteFieldFiniteness (D : RationalPELDatum B V) (n : ℕ) (k : Type u) [Field k] [Finite k] :
    Finite (PELModuli.objectsOverField D n k) := sorry

/-- Nonempty examples (`M6/nonempty-examples`): the product polarization of type `(1, d)` on
`E × E'` realizes the Siegel lattice of type `(1, d)`, of dual index `d²`. -/
theorem nonemptyExamples (d : ℤ) : (siegelGram 2 ![1, d]).det = d ^ 2 := by
  rw [siegelDatum_dualIndex]; simp [Fin.prod_univ_two]

end M6

end TauCeti.PEL
