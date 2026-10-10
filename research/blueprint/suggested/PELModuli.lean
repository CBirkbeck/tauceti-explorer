import TauCeti.Geometry.Symplectic.ExistsCompatible
import TauCeti.Geometry.Hodge.WeightOne.Basic
import TauCeti.Geometry.Hodge.WeightOne.Polarization
import TauCeti.LinearAlgebra.BilinearForm.DualLattice
import TauCeti.LinearAlgebra.Matrix.SmithNormalForm
import TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import TauCeti.Algebra.AlgebraicGroup.ConstantForm.Basic
import TauCeti.Algebra.AlgebraicGroup.Symplectic.Basic
import TauCeti.Algebra.AlgebraicGroup.Orthogonal.Basic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Scheme
import Mathlib.CategoryTheory.Monoidal.Cartesian.CommGrp_
import Mathlib.Algebra.Quaternion
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
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.AlgebraicGeometry.EllipticCurve.ModelsWithJ
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.CategoryTheory.FiberedCategory.Fibered
import Mathlib.CategoryTheory.Bicategory.NaturalTransformation.Pseudo
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.NonabelianCohomology.H1
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.CategoryTheory.SingleObj
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.Algebra.Polynomial.Derivative

/-!
# Siegel and PEL moduli problems: suggested Lean signatures

Revision BP-PELModuli~2; Codex, codex-Mp65ad.
Independent review REV-PELModuli~2; Codex, codex-tPhnDV.
Mathlib baseline: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti baseline: f790474821cf4256814db967cb154e7af3d0c369.

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PELModuli.md` is definitive. The statements suggest Lean forms so
that contributors and reviewers converge on names and signatures. They are unproved interfaces,
not implementation claims.

Conventions: `ℤ(1)` is identified with `ℤ` by a choice of `√−1`; `V₀ = V^{−1,0}` is the
subspace where `h(z)` acts by `z`; level structures carry their multiplier; Hecke translations
act on the right. Imported future interfaces are marked at their point of use. Their owning roadmaps, precise
contracts and outstanding extensions are listed in the packet and reader. Missing conditions
are stated in comments and omitted from the prototype, never asserted by arbitrary proposition
fields. Elaboration is a check of signatures, not a proof or an implementation claim.
-/

noncomputable section
open scoped TensorProduct Matrix NumberField
open CategoryTheory AlgebraicGeometry

namespace TauCeti.PEL

namespace Supplier
/-- AA.4 Part II's pointed continuous nonabelian absolute Galois H1 of an algebraic group.
Cocycles take values in its separable-closure points, modulo twisted conjugation. -/
def ReductiveGaloisH1 (_G : CommHopfAlgCat.{0} ℚ) : Type := sorry
def neutralClass (G : CommHopfAlgCat ℚ) : ReductiveGaloisH1 G := sorry
abbrev QPlace := Unit ⊕ IsDedekindDomain.HeightOneSpectrum ℤ
def LocalGaloisH1 (_G : CommHopfAlgCat.{0} ℚ) (_v : QPlace) : Type := sorry
def localNeutralClass (G : CommHopfAlgCat ℚ) (v : QPlace) : LocalGaloisH1 G v := sorry
def localizeClass (G : CommHopfAlgCat ℚ) (v : QPlace) :
    ReductiveGaloisH1 G → LocalGaloisH1 G v := sorry

def KerOne (G : CommHopfAlgCat.{0} ℚ) : Type :=
  {c : ReductiveGaloisH1 G // ∀ v : QPlace,
    localizeClass G v c = localNeutralClass G v}
end Supplier

/-! ## M0. Linear algebra and reflex field -/

section M0
open scoped _root_.TensorProduct

/-- The trace of left multiplication on a ℚ-algebra. -/
noncomputable def lmulTrace (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] (x : B) : ℚ :=
  LinearMap.trace ℚ B (LinearMap.mulLeft ℚ x)

/-- The reduced trace `Trd_{B/ℚ}`: the sum over simple factors of the field trace of the reduced
trace, constructed from Wedderburn–Artin. -/
noncomputable def reducedTrace (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] : B →ₗ[ℚ] ℚ := sorry

/-- A positive involution: `Trd(x x*) > 0` for `x ≠ 0` (Lan §1.2.1). -/
structure PositiveInvolution (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] [StarModule ℚ B] :
    Prop where
  trd_pos : ∀ x : B, x ≠ 0 → 0 < reducedTrace B (x * star x)

namespace PositiveInvolution
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] [StarModule ℚ B]

theorem trd_mul_star_pos (h : PositiveInvolution B) {x : B} (hx : x ≠ 0) :
    0 < reducedTrace B (x * star x) := h.trd_pos x hx

theorem iff_trace_pos :
    PositiveInvolution B ↔ ∀ x : B, x ≠ 0 → 0 < lmulTrace B (x * star x) := sorry

theorem iff_real :
    PositiveInvolution B ↔ ∀ x : ℝ ⊗[ℚ] B, x ≠ 0 →
      0 < LinearMap.trace ℝ (ℝ ⊗[ℚ] B) (LinearMap.mulLeft ℝ (x * star x)) := sorry

theorem center_stable (_h : PositiveInvolution B) {z : B} (hz : z ∈ Subring.center B) :
    star z ∈ Subring.center B := sorry

theorem ofStarRing (_h : PositiveInvolution B) (q : ℚ) (x : B) : star (q • x) = q • star x :=
  star_smul q x

end PositiveInvolution

/-- A `*`-stable ℤ-order in `B`. -/
structure StarOrder (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] where
  carrier : Subring B
  fg : (Submodule.span ℤ (carrier : Set B)).FG
  spans : Submodule.span ℚ (carrier : Set B) = ⊤
  star_mem : ∀ x ∈ carrier, star x ∈ carrier

-- Unit test: positiveInvolution_rat
example : PositiveInvolution ℚ := sorry
-- Unit test: positiveInvolution_transpose
example (n : ℕ) : PositiveInvolution (Matrix (Fin n) (Fin n) ℚ) := sorry
-- Unit test: not_positiveInvolution_adjugate
example : ¬ ∀ x : Matrix (Fin 2) (Fin 2) ℚ, x ≠ 0 →
    0 < lmulTrace (Matrix (Fin 2) (Fin 2) ℚ) (x * x.adjugate) := sorry
-- Unit test: not_positiveInvolution_id_imaginary
example
    (K : Type*) [Field K] [NumberField K] (i : K) (hi : i ^ 2 = -1) :
    ¬ ∀ x : K, x ≠ 0 → 0 < lmulTrace K (x * x) := sorry

/-- Albert types of simple factors with positive involution (`M0/albert-types`). -/
inductive AlbertType | A | C | D
  deriving DecidableEq

/-- `I_bad = 2` iff a type D factor occurs (Lan Definition 1.2.1.17). -/
def iBad (types : Finset AlbertType) : ℕ := if AlbertType.D ∈ types then 2 else 1

/-- The classification includes the involution, rather than just Wedderburn decomposition.
Zero-sized index sets allow missing Albert types. Quaternionic positive involution is conjugate
transpose. The centre/fixed-centre number-field conclusions are separate packet targets. -/
theorem albertTypes (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] [StarModule ℚ B] (h : PositiveInvolution B) :
    ∃ (r c d : ℕ) (nr : Fin r → ℕ) (nc : Fin c → ℕ) (nd : Fin d → ℕ)
      (e : (ℝ ⊗[ℚ] B) ≃ₐ[ℝ]
        ((Π i, Matrix (Fin (nr i)) (Fin (nr i)) ℝ) ×
         (Π i, Matrix (Fin (nc i)) (Fin (nc i)) ℂ) ×
         (Π i, Matrix (Fin (nd i)) (Fin (nd i)) (Quaternion ℝ)))),
      (∀ i, 0 < nr i) ∧ (∀ i, 0 < nc i) ∧ (∀ i, 0 < nd i) ∧
      ∀ x, e (star x) = star (e x) := sorry

/-! ### Orders and discriminants -/

/-- The discriminant of a ℤ-order with a basis, computed with the reduced trace form. -/
noncomputable def Order.disc {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] {ι : Type*} [Fintype ι]
    [DecidableEq ι] (b : ι → B) : ℚ :=
  (Matrix.of fun i j => reducedTrace B (b i * b j)).det

namespace Order
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem disc_eq_det_basis (b : ι → B) :
    disc b = (Matrix.of fun i j => reducedTrace B (b i * b j)).det := rfl

/-- Full orders, not arbitrary rational tuples. The inverse different uses reduced trace. -/
def inverseDifferent (O : Subring B) : AddSubgroup B := sorry

theorem mem_inverseDifferent (O : Subring B) (x : B) :
    x ∈ inverseDifferent O ↔ ∀ y ∈ O, reducedTrace B (x * y) ∈ Set.range (Int.cast : ℤ → ℚ) := sorry

theorem disc_eq_index_diffInv [StarRing B] (O : StarOrder B)
    (b : Module.Basis ι ℤ O.carrier) :
    |disc (fun i => (b i : B))| =
      (O.carrier.toAddSubgroup.relIndex (inverseDifferent O.carrier) : ℚ) := sorry

/-- Maximality after localization is expressed as absence of a p-part in any overorder. -/
theorem isMaximalAt_of_not_dvd_disc [StarRing B] (O O' : StarOrder B)
    (b : Module.Basis ι ℤ O.carrier) (p : ℕ) [Fact p.Prime]
    (hp : ¬ p ∣ (disc (fun i => (b i : B))).num.natAbs) (hle : O.carrier ≤ O'.carrier) :
    ¬ p ∣ O.carrier.toAddSubgroup.relIndex O'.carrier.toAddSubgroup := sorry

/-- The generic algebra part of Lan 1.1.1.17. Its integral factor orders, finite-etale
Zp-algebras and fraction-field identifications are supplied by the order/local-fields request. -/
theorem matrixAlgebra_of_not_dvd_disc [StarRing B] (O : StarOrder B)
    (b : Module.Basis ι ℤ O.carrier) (p : ℕ) [Fact p.Prime]
    (hp : ¬ p ∣ (disc (fun i => (b i : B))).num.natAbs) :
    ∃ (n : ℕ) (d : Fin n → ℕ) (K : Fin n → Type) (_ : ∀ i, Field (K i))
      (_ : ∀ i, Algebra ℚ_[p] (K i)),
      Nonempty ((ℚ_[p] ⊗[ℚ] B) ≃ₐ[ℚ_[p]] Π i, Matrix (Fin (d i)) (Fin (d i)) (K i)) := sorry

theorem disc_numberField (K : Type*) [Field K] [NumberField K] :
    disc (fun i => (NumberField.RingOfIntegers.basis K i : K)) = (NumberField.discr K : ℚ) :=
  sorry

/-- `*` preserves a `*`-stable order and induces an involution of it. -/
theorem map_star [StarRing B] (O : StarOrder B) (x : B) (hx : x ∈ O.carrier) :
    star x ∈ O.carrier ∧ star (star x) = x := ⟨O.star_mem x hx, star_star x⟩

end Order

-- Unit test: Order.disc_numberField_quadratic
example
    (K : Type*) [Field K] [NumberField K] (i : K) (hi : i ^ 2 = -1)
    (hdim : Module.finrank ℚ K = 2) : Order.disc ![(1 : K), i] = -4 := sorry

-- Unit test: Order.disc_nonmaximal
example
    (K : Type*) [Field K] [NumberField K] (i : K) (hi : i ^ 2 = -1)
    (hdim : Module.finrank ℚ K = 2) : Order.disc ![(1 : K), 2 * i] = -16 := sorry


/-! ### Symplectic O-lattices and PEL data -/

/-- A symplectic `O`-lattice: an `O`-module `L` with a nondegenerate alternating ℤ-valued form
(`ℤ(1)` identified with `ℤ` by a choice of `√−1`) for which `b` and `b*` are adjoint. -/
structure SymplecticOLattice (O : Type*) [Ring O] [StarRing O] (L : Type*) [AddCommGroup L]
    [Module O L] where
  finite : Module.Finite ℤ L
  free : Module.Free ℤ L
  form : LinearMap.BilinForm ℤ L
  isAlt : form.IsAlt
  nondeg : form.Nondegenerate
  adjoint : ∀ (b : O) (x y : L), form (b • x) y = form x (star b • y)

namespace SymplecticOLattice
variable {O : Type*} [Ring O] [StarRing O] {L : Type*} [AddCommGroup L] [Module O L]
  (Λ : SymplecticOLattice O L)

/-- The dual of a ℤ-submodule of `ℚ ⊗ L` for the ℚ-linear extension of the form. -/
noncomputable def dualOf (Λ : SymplecticOLattice O L) (N : Submodule ℤ (ℚ ⊗[ℤ] L)) :
    Submodule ℤ (ℚ ⊗[ℤ] L) :=
  (LinearMap.BilinForm.baseChange ℚ Λ.form).dualSubmodule N

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
theorem polarizationType :
    ∃ (g : ℕ) (b : Module.Basis (Fin g ⊕ Fin g) ℤ L) (d : Fin g → ℕ),
      (∀ i, 0 < d i) ∧ (∀ i j, i ≤ j → d i ∣ d j) ∧
      (∀ i j, Λ.form (b (.inl i)) (b (.inr j)) = if i = j then (d i : ℤ) else 0) ∧
      (∀ i j, Λ.form (b (.inl i)) (b (.inl j)) = 0) ∧
      (∀ i j, Λ.form (b (.inr i)) (b (.inr j)) = 0) ∧
      Λ.dualIndex = (∏ i, d i) ^ 2 := sorry

/-- Extension of scalars of the form. -/
noncomputable def baseChange (R : Type*) [CommRing R] : LinearMap.BilinForm R (R ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange R Λ.form

end SymplecticOLattice

-- Unit test: SymplecticOLattice.dual_standard
example (Λ : SymplecticOLattice ℤ (Fin 2 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 2)) Λ.form = !![0, 1; -1, 0]) :
    Λ.dualIndex = 1 := sorry
-- Unit test: SymplecticOLattice.index_type
example (d : ℤ) (Λ : SymplecticOLattice ℤ (Fin 4 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 4)) Λ.form =
      !![0, 1, 0, 0; -1, 0, 0, 0; 0, 0, 0, d; 0, 0, -d, 0]) :
    (Λ.dualIndex : ℤ) = d ^ 2 := sorry
-- Unit test: SymplecticOLattice.zero
example (Λ : SymplecticOLattice ℤ (Fin 0 → ℤ)) : Λ.dualIndex = 1 := sorry
-- Unit test: SymplecticOLattice.not_symmetric
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

def almostComplexStructure : TauCeti.AlmostComplexStructure (ℝ ⊗[ℤ] L) :=
  ⟨D.J, D.J_sq⟩

def symplecticForm (D : IntegralPELDatum O L) : TauCeti.SymplecticForm (ℝ ⊗[ℤ] L) := sorry

theorem symplecticForm_apply (x y : ℝ ⊗[ℤ] L) :
    D.symplecticForm x y = D.baseChange ℝ x y := sorry

theorem compatible : D.symplecticForm.Compatible D.almostComplexStructure := sorry

theorem nondegenerate_real : (D.baseChange ℝ).Nondegenerate := sorry

/-- Restriction to a `*`-stable suborder `φ : O' → O` keeps the adjointness. -/
theorem adjoint_ofSubOrder {O' : Type*} [Ring O'] [StarRing O'] (φ : O' →+* O)
    (hφ : ∀ b, φ (star b) = star (φ b)) (b : O') (x y : L) :
    D.form (φ b • x) y = D.form x (φ (star b) • y) := by
  rw [hφ]; exact D.adjoint (φ b) x y

end IntegralPELDatum

-- Unit test: IntegralPELDatum.siegel
example (g : ℕ) : ∃ D : IntegralPELDatum ℤ (Fin g ⊕ Fin g → ℤ),
    LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin g ⊕ Fin g)) D.form = -Matrix.J (Fin g) ℤ ∧
      D.dualIndex = 1 := sorry
-- Unit test: IntegralPELDatum.zero
example (D : IntegralPELDatum ℤ (Fin 0 → ℤ)) : D.dualIndex = 1 := sorry
-- Unit test: IntegralPELDatum.wrong_sign
example {L : Type*} [AddCommGroup L] (D : IntegralPELDatum ℤ L) (x : ℝ ⊗[ℤ] L) (hx : x ≠ 0) :
    D.baseChange ℝ x ((-D.J) x) < 0 := by
  have := D.pos x hx; rw [LinearMap.neg_apply, map_neg]; linarith
-- Unit test: IntegralPELDatum.compatible_iff
example {L : Type*} [AddCommGroup L] (D : IntegralPELDatum ℤ L) (x : ℝ ⊗[ℤ] L) (hx : x ≠ 0) :
    0 < D.baseChange ℝ x (D.J x) := D.pos x hx

/-! ### Rational and p-integral data, the similitude group, good primes -/

/-- The action of `b ∈ B` on `V` as a ℚ-linear map. -/
abbrev bAct {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (b : B) : V →ₗ[ℚ] V := DistribSMul.toLinearMap ℚ V b

/-- A rational PEL datum `(B, *, V, ⟨·,·⟩, h)` with `J = h(√−1)` on `ℝ ⊗ V`. -/
structure RationalPELDatum (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] (V : Type*)
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] where
  positive_B : ∀ b : B, b ≠ 0 → 0 < reducedTrace B (b * star b)
  finite_V : Module.Finite ℚ V
  form : LinearMap.BilinForm ℚ V
  isAlt : form.IsAlt
  nondeg : form.Nondegenerate
  faithful : FaithfulSMul B V
  adjoint : ∀ (b : B) (x y : V), form (b • x) y = form x (star b • y)
  J : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)
  J_sq : J ∘ₗ J = -LinearMap.id
  J_comm : ∀ b : B, J ∘ₗ (bAct (V := V) b).baseChange ℝ = (bAct (V := V) b).baseChange ℝ ∘ₗ J
  h_adjoint : ∀ x y, LinearMap.BilinForm.baseChange ℝ form (J x) (J y) =
    LinearMap.BilinForm.baseChange ℝ form x y
  pos : ∀ x : ℝ ⊗[ℚ] V, x ≠ 0 → 0 < LinearMap.BilinForm.baseChange ℝ form x (J x)

/-- A `p`-integral PEL datum: a rational datum with a `*`-stable order maximal at `p` and a
self-dual lattice in `ℚ_p ⊗ V` (maximality and unramifiedness are stated in the packet). -/
structure PIntegralPELDatum (p : ℕ) [Fact p.Prime] (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
    [StarRing B] (V : Type*) [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    extends RationalPELDatum B V where
  order : StarOrder B
  selfDual : Submodule ℤ_[p] (ℚ_[p] ⊗[ℚ] V)
  lattice_fg : selfDual.FG
  lattice_spans : Submodule.span ℚ_[p] (selfDual : Set (ℚ_[p] ⊗[ℚ] V)) = ⊤
  order_stable : ∀ b ∈ order.carrier, ∀ x ∈ selfDual,
    (bAct (V := V) b).baseChange ℚ_[p] x ∈ selfDual
  selfDual_eq : ∀ x : ℚ_[p] ⊗[ℚ] V, x ∈ selfDual ↔
    ∀ y ∈ selfDual, LinearMap.BilinForm.baseChange ℚ_[p] form x y ∈ (algebraMap ℤ_[p] ℚ_[p]).range

namespace IntegralPELDatum
variable {O : Type*} [Ring O] [StarRing O] {L : Type*} [AddCommGroup L] [Module O L]

/-- Rationalization: the ℚ-bilinear extension of the form to `ℚ ⊗ L`. -/
def toRational (D : IntegralPELDatum O L) : LinearMap.BilinForm ℚ (ℚ ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℚ D.form

/-- The rational PEL datum `(B, *, L ⊗ ℚ, ⟨·,·⟩, h)`, for `B = O ⊗ ℚ` given with its action on
`L ⊗ ℚ` extending that of `O`. -/
def rationalize (_D : IntegralPELDatum O L) (B : Type*) [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B]
    [Module B (ℚ ⊗[ℤ] L)] [IsScalarTower ℚ B (ℚ ⊗[ℤ] L)]
    [FaithfulSMul B (ℚ ⊗[ℤ] L)]
    (hBpos : ∀ b : B, b ≠ 0 → 0 < reducedTrace B (b * star b))
    (ι : O →+* B) (hιinj : Function.Injective ι)
    (e : ℚ ⊗[ℤ] O ≃ₐ[ℚ] B) (he : ∀ b : O, e (1 ⊗ₜ[ℤ] b) = ι b)
    (hstar : ∀ b : O, ι (star b) = star (ι b))
    (_hι : ∀ (b : O) (x : L), ι b • ((1 : ℚ) ⊗ₜ[ℤ] x) = (1 : ℚ) ⊗ₜ[ℤ] (b • x)) :
    RationalPELDatum B (ℚ ⊗[ℤ] L) := sorry

/-- Restriction to `ℤ_p` at a good prime. -/
def completedForm (D : IntegralPELDatum O L) (p : ℕ) [Fact p.Prime] :
    LinearMap.BilinForm ℤ_[p] (ℤ_[p] ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℤ_[p] D.form

end IntegralPELDatum

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- The image of an integral lattice in `𝔸_f ⊗ L` (its `Ẑ`-span is `L ⊗ Ẑ`). -/
def integralImageInAdeles (L : Type*) [AddCommGroup L] :
    Submodule ℤ (IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℤ] L) :=
  LinearMap.range (TensorProduct.mk ℤ (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) L 1)

/-- `C = End_B(V)` inside `End_ℚ(V)`. -/
def centralizer (_D : RationalPELDatum B V) : Subalgebra ℚ (Module.End ℚ V) :=
  Subalgebra.centralizer ℚ (Set.range fun b : B => bAct (V := V) b)

end RationalPELDatum

-- Unit test: RationalPELDatum.siegel_pIntegral
example (p : ℕ) [Fact p.Prime] (D : IntegralPELDatum ℤ (Fin 2 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 2)) D.form = !![0, 1; -1, 0]) :
    D.toSymplecticOLattice.IsSelfDualAt p := sorry
-- Unit test: IntegralPELDatum.toPIntegral_type
example (p : ℕ) [Fact p.Prime] (D : IntegralPELDatum ℤ (Fin 4 → ℤ))
    (h : LinearMap.BilinForm.toMatrix (Pi.basisFun ℤ (Fin 4)) D.form =
      !![0, 1, 0, 0; -1, 0, 0, 0; 0, 0, 0, (p : ℤ); 0, 0, -(p : ℤ), 0]) :
    ¬ D.toSymplecticOLattice.IsSelfDualAt p := sorry
-- Unit test: RationalPELDatum.zero
example {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] [Nontrivial B] {V : Type*}
    [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] [Subsingleton V]
    (D : RationalPELDatum B V) : False := sorry
-- Unit test: IntegralPELDatum.toRational_injective_fails
example : ∃ D₁ D₂ : IntegralPELDatum ℤ (Fin 2 → ℤ), D₁.dualIndex = 1 ∧ D₂.dualIndex = 4 ∧
    ∃ e : ℚ ⊗[ℤ] (Fin 2 → ℤ) ≃ₗ[ℚ] ℚ ⊗[ℤ] (Fin 2 → ℤ),
      ∀ x y, D₁.toRational (e x) (e y) = D₂.toRational x y := sorry

namespace PELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
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
def similitudeGroup.forgetLinear (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] : similitudeGroup D R →* ((R ⊗[ℚ] V) ≃ₗ[R] (R ⊗[ℚ] V)) :=
  (MonoidHom.fst _ _).comp (similitudeGroup D R).subtype

/-- The principal congruence subgroup `U(n)` of the automorphisms of a lattice. -/
def similitudeGroup.principalCongruence (L : Type*) [AddCommGroup L] (n : ℕ) :
    Subgroup (L ≃ₗ[ℤ] L) := sorry

theorem similitudeGroup.standardSymplectic_iff (g : ℕ)
    (A : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ) :
    A ∈ Matrix.symplecticGroup (Fin g) ℚ ↔ A.transpose * Matrix.J (Fin g) ℚ * A = Matrix.J (Fin g) ℚ :=
  sorry

theorem similitudeGroup.ofZero (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] [Subsingleton V] (r : Rˣ) :
    (LinearEquiv.refl R (R ⊗[ℚ] V), r) ∈ similitudeGroup D R := sorry

end PELDatum

-- Unit test: similitudeGroup_siegel_one
example (A : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ) :
    A.transpose * Matrix.J (Fin 1) ℤ * A = A.det • Matrix.J (Fin 1) ℤ := sorry
-- Supporting calculation for similitudeGroup_zero.
example {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] [Subsingleton V] (D : RationalPELDatum B V)
    (r : ℚˣ) : (LinearEquiv.refl ℚ (ℚ ⊗[ℚ] V), r) ∈ PELDatum.similitudeGroup D ℚ :=
  PELDatum.similitudeGroup.ofZero D ℚ r
-- Supporting calculation for isometryGroup_siegel.
example (A : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℚ) (hA : A ∈ Matrix.symplecticGroup (Fin 1) ℚ) :
    A.det = 1 := sorry
-- Unit test: similitudeGroup_not_isometry
example : (Matrix.diagonal (fun i : Fin 1 ⊕ Fin 1 => Sum.elim (fun _ => (2 : ℚ)) (fun _ => 1) i)) ∉
    Matrix.symplecticGroup (Fin 1) ℚ := sorry

/-- Kottwitz Lemma 7.1 (the conjugacy part of `M0/similitude-group-structure`): over an
algebraically closed field of characteristic zero, two elements of `G` are conjugate iff they have
the same multiplier and are conjugate by a `B`-linear automorphism. Connectedness in Cases A, C and
the `2^{[F₀:ℚ]}` components in Case D are stated in the packet (no algebraic-group carrier here). -/
theorem similitudeConjugacyCriterion {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*}
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

/-- The good-prime reflex base. Integers whose prime divisors avoid box are inverted. -/
def goodBaseRing (E : Type u) [Field E] [NumberField E] (box : Set ℕ) : Type u :=
  Localization (Submonoid.closure {x : 𝓞 E | ∃ n : ℕ, x = (n : 𝓞 E) ∧
    n ≠ 0 ∧ ∀ p ∈ box, ¬ p ∣ n})
instance goodBaseRingRing (E : Type u) [Field E] [NumberField E] (box : Set ℕ) :
    CommRing (goodBaseRing E box) := sorry

def goodBase (E : Type u) [Field E] [NumberField E] (box : Set ℕ) : Scheme.{u} :=
  Spec (CommRingCat.of (goodBaseRing E box))

theorem IsGoodPrime.not_dvd_dualIndex {n iBad disc dualIndex p : ℕ}
    (h : IsGoodPrime n iBad disc dualIndex p) : ¬ p ∣ dualIndex := fun hp =>
  h (Dvd.dvd.mul_left hp _)

theorem IsGoodPrime.not_two_of_typeD {n disc dualIndex : ℕ} (types : Finset AlbertType)
    (hD : AlbertType.D ∈ types) : ¬ IsGoodPrime n (iBad types) disc dualIndex 2 := by
  intro h; apply h; simp only [badPrimeInteger, iBad, hD, ite_true]
  exact Dvd.dvd.mul_right (Dvd.dvd.mul_right (dvd_mul_left 2 n) _) _

theorem IsGoodPrime.not_dvd_order_discriminant {n iBad disc dualIndex p : ℕ}
    (h : IsGoodPrime n iBad disc dualIndex p) : ¬ p ∣ disc := fun hp =>
  h (Dvd.dvd.mul_right (Dvd.dvd.mul_left hp _) _)

end PELDatum

-- Unit test: goodPrime_siegel
example (p : ℕ) (hp : p.Prime) : PELDatum.IsGoodPrime 3 1 1 1 p ↔ p ≠ 3 := sorry
-- Unit test: goodPrime_type
example : ¬ PELDatum.IsGoodPrime 1 1 1 36 2 ∧ ¬ PELDatum.IsGoodPrime 1 1 1 36 3 ∧
    PELDatum.IsGoodPrime 1 1 1 36 5 := by
  simp only [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]; decide
-- Unit test: goodPrime_typeD_two
example : ¬ PELDatum.IsGoodPrime 1 2 9 1 2 := by
  simp only [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]; decide
-- Unit test: goodBase_empty
example (E : Type u) [Field E] [NumberField E] :
    Nonempty (PELDatum.goodBaseRing E ∅ ≃+* E) := sorry

/-- Imported ShimuraData D4 carrier: rational reductive group, real algebraic S-map
conjugacy orbit and SV axioms. It is not this roadmap's independent definition. -/
def SupplierShimuraDatum : Type (u + 1) := sorry

/-! ### The Hodge structure, the Shimura datum, signatures -/

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
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
    (hadjoint : ∀ x y, LinearMap.BilinForm.baseChange ℝ D.form (J' x) (J' y) =
      LinearMap.BilinForm.baseChange ℝ D.form x y)
    (hpos : ∀ x, x ≠ 0 → 0 < LinearMap.BilinForm.baseChange ℝ D.form x (J' x)) :
    J' ∈ D.domain := sorry

/-- Kottwitz Lemma 4.1 in the form used here: `(x, y) ↦ ⟨x, J y⟩` is symmetric. -/
theorem kottwitzSymmetricForm (D : RationalPELDatum B V) (x y : ℝ ⊗[ℚ] V) :
    LinearMap.BilinForm.baseChange ℝ D.form x (D.J y) =
      LinearMap.BilinForm.baseChange ℝ D.form y (D.J x) := sorry

/-- Coordinate Hopf algebra of the actual PEL similitude group, cut out in GL(V)×Gm
by the order-commutator and multiplier-form equations. AA.1 provides the closed subgroup
construction; the existing constant-form Hopf ideals supply the isometry fibre. -/
def coordinate (_D : RationalPELDatum B V) : CommHopfAlgCat.{0} ℚ := sorry

def coordinatePoints (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] :
    WithConv (D.coordinate →ₐ[ℚ] R) ≃* PELDatum.similitudeGroup D R := sorry

/-- ShimuraData D4's rational algebraic datum with its full real-S conjugacy orbit.
Connectedness, SV1–SV3 and the condition that h is nontrivial on every rational simple
adjoint factor are omitted here, as allowed for future supplier conditions. -/
def toShimuraDatum (D : RationalPELDatum B V) : SupplierShimuraDatum := sorry

/-- The Siegel morphism `G → GSp(V)` on real points. -/
def forgetfulRealRepresentation (D : RationalPELDatum B V) :
    PELDatum.similitudeGroup D ℝ →* ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) :=
  PELDatum.similitudeGroup.forgetLinear D ℝ

/-- Kottwitz's `(G, h⁻¹)` and Deligne's `(G, h)`: replacing `J` by `−J` exchanges `V₀` and `V₀ᶜ`. -/
theorem signConvention (D : RationalPELDatum B V) (J' : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V))
    (hJ' : J' ∈ D.domain) :
    LinearMap.ker ((-J').baseChange ℂ - Complex.I • LinearMap.id) =
      LinearMap.ker (J'.baseChange ℂ + Complex.I • LinearMap.id) := sorry

/-- The central τ-eigenspace inside a Hodge piece. For noncommutative B the signature
is its dimension divided by the degree of the simple matrix factor. The prototype is the
commutative B=F specialization; Morita-normalized multi-ranks remain in the packet. -/
def centralTauPart (_D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (τ : F →+* ℂ) (U : Submodule ℂ (ℂ ⊗[ℝ] (ℝ ⊗[ℚ] V))) :
    Submodule ℂ (ℂ ⊗[ℝ] (ℝ ⊗[ℚ] V)) :=
  U ⊓ ⨅ a : F, LinearMap.ker
    (((bAct (V := V) (algebraMap F B a)).baseChange ℝ).baseChange ℂ - τ a • LinearMap.id)

def signature (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (τ : F →+* ℂ) : ℕ × ℕ :=
  (Module.finrank ℂ (D.centralTauPart F τ D.V₀),
    Module.finrank ℂ (D.centralTauPart F τ
      (LinearMap.ker (D.J.baseChange ℂ + Complex.I • LinearMap.id))))

def multiRankAt (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (τ : F →+* ℂ) : ℕ := Module.finrank ℂ (D.centralTauPart F τ ⊤)

theorem signature_add (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (τ : F →+* ℂ) : (D.signature F τ).1 + (D.signature F τ).2 = D.multiRankAt F τ := sorry

theorem signature_conj (D : RationalPELDatum B V) (F : Type*) [Field F] [Algebra F B]
    (hcentre : Set.range (algebraMap F B) = (Subring.center B : Set B))
    (τ : F →+* ℂ) :
    D.signature F (NumberField.ComplexEmbedding.conjugate τ) = (D.signature F τ).swap := sorry

def signatureType (D : RationalPELDatum B V) (K : Type*) [Field K] [NumberField K]
    [Algebra K B] : (K →+* ℂ) →₀ ℕ := sorry

theorem signature_unitary (D : RationalPELDatum B V) (K : Type*) [Field K] [NumberField K]
    [Algebra K B] (τ : K →+* ℂ) : D.signatureType K τ = (D.signature K τ).1 := sorry

end RationalPELDatum

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

def almostComplexStructure (D : RationalPELDatum B V) : TauCeti.AlmostComplexStructure (ℝ ⊗[ℚ] V) :=
  ⟨D.J, D.J_sq⟩

/-- Tau Ceti's cohomological weight +1 carrier. The packet's homological weight -1
structure is its dual; the integral polarization adapter needs the chosen lattice. -/
def hodgeStructure (D : RationalPELDatum B V) := D.almostComplexStructure.hodgeStructure

end RationalPELDatum

/-- The actual library Hodge piece agrees with the PEL i-eigenspace. -/
theorem hodgeStructureOfDatum {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) :
    (D.hodgeStructure).piece 1 = D.V₀ := sorry

-- Supporting calculation for pelShimuraDatum_siegel.
example (g : ℕ) (A : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℝ)
    (hA : A ∈ Matrix.symplecticGroup (Fin g) ℝ) :
    A * Matrix.J (Fin g) ℝ * A⁻¹ * (A * Matrix.J (Fin g) ℝ * A⁻¹) = -1 := sorry
-- Unit test: pelShimuraDatum_definite
example {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (hcentral : ∀ g : PELDatum.similitudeGroup D ℝ,
      ((g : ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) × ℝˣ).1 : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)) ∘ₗ D.J =
        D.J ∘ₗ ((g : ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) × ℝˣ).1 : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V))) :
    D.domain = {D.J} := sorry
-- Supporting calculation for pelShimuraDatum_typeD.
example : ¬ _root_.IsConnected ({x : ℝ | x ^ 2 = 1}) := sorry
-- Supporting calculation for pelShimuraDatum_gl2.
example (A : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℝ) :
    A ∈ Matrix.symplecticGroup (Fin 1) ℝ ↔ A.det = 1 := sorry

-- Unit test: signature_siegel
example {V : Type*} [AddCommGroup V] [Module ℚ V] (D : RationalPELDatum ℚ V) (g : ℕ)
    (hV : Module.finrank ℚ V = 2 * g) : D.signature ℚ (algebraMap ℚ ℂ) = (g, g) := sorry
-- Unit test: signature_picard
example {V : Type*} [AddCommGroup V] [Module ℚ V] (K : Type*) [Field K] [NumberField K]
    [StarRing K] [Module K V] [IsScalarTower ℚ K V] (D : RationalPELDatum K V) (τ : K →+* ℂ)
    (hcentre : Set.range (algebraMap K K) = (Subring.center K : Set K))
    (h : D.signature K τ = (2, 1)) :
    D.signature K (NumberField.ComplexEmbedding.conjugate τ) = (1, 2) := by
  rw [D.signature_conj K hcentre, h]; rfl
-- Unit test: signature_zero
-- Raw zero integral Hodge pieces; no impossible faithful rational datum is assumed.
example :
    (Module.finrank ℂ (⊥ : Submodule ℂ (Fin 0 → ℂ)),
      Module.finrank ℂ (⊥ : Submodule ℂ (Fin 0 → ℂ))) = (0, 0) := by simp
-- Unit test: signature_not_free
example {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
    [Module ℚ V] [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) (F : Type*)
    [Field F] [Algebra F B] (τ : F →+* ℂ)
    (hcentre : Set.range (algebraMap F B) = (Subring.center B : Set B))
    (h : D.signature F τ = (2, 0)) :
    D.signature F (NumberField.ComplexEmbedding.conjugate τ) ≠ (2, 0) := by
  rw [D.signature_conj F hcentre, h]; decide

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

theorem detPoly_exact {M' M'' : Type*} [AddCommGroup M'] [Module R M']
    [Module.Free R M'] [Module.Finite R M'] [AddCommGroup M''] [Module R M'']
    [Module.Free R M''] [Module.Finite R M'']
    (i : M' →ₗ[R] M) (q : M →ₗ[R] M'') (hi : Function.Injective i)
    (hq : Function.Surjective q) (he : LinearMap.range i = LinearMap.ker q)
    (a' : ι → Module.End R M') (a : ι → Module.End R M) (a'' : ι → Module.End R M'')
    (h_i : ∀ j, (a j).comp i = i.comp (a' j))
    (h_q : ∀ j, q.comp (a j) = (a'' j).comp q) :
    detPoly a = detPoly a' * detPoly a'' := sorry

theorem detPoly_homogeneous (a : ι → Module.End R M) :
    (detPoly a).IsHomogeneous (Module.finrank R M) := sorry

theorem detPoly_eq_polyCharpoly (a : ι → Module.End R M)
    (φ : (ι → R) →ₗ[R] Module.End R M) (hφ : ∀ i, φ (Pi.single i 1) = a i) :
    MvPolynomial.map (RingHom.id R) (detPoly a) =
      (-1) ^ Module.finrank R M * (LinearMap.polyCharpoly φ (Pi.basisFun R ι)).coeff 0 := sorry

end DetPoly

-- Unit test: detPoly_int
example (r : ℕ) : detPoly (R := ℤ) (M := Fin r → ℤ) (ι := Unit) (fun _ => LinearMap.id) =
    MvPolynomial.X () ^ r := sorry
-- Unit test: detPoly_gaussian
example : detPoly (R := ℂ) (M := ℂ) (ι := Fin 2) ![LinearMap.id, Complex.I • LinearMap.id] =
    MvPolynomial.X 0 + MvPolynomial.C Complex.I * MvPolynomial.X 1 := sorry
-- Unit test: detPoly_eval_charpoly
example (r : ℕ) (f : Module.End ℚ (Fin r → ℚ)) :
    MvPolynomial.eval ![(-1 : ℚ)] (detPoly (ι := Fin 1) ![f]) =
      (LinearMap.charpoly f).eval 0 := sorry
-- Odd rank detects a misplaced extra sign in the constant-term comparison.
example :
    MvPolynomial.eval ![(-1 : ℚ)]
      (detPoly (M := Fin 1 → ℚ) (ι := Fin 1) ![LinearMap.id]) = -1 := sorry
-- Unit test: detPoly_not_trace
example : ∃ t : Fin 3 → Fin 2 → ZMod 3, (∑ k, t k 1) = 0 ∧
    detPoly (R := ZMod 3) (M := Fin 3 → ZMod 3) (ι := Fin 2)
      (fun i => LinearMap.pi fun k => t k i • LinearMap.proj k) ≠
    detPoly (R := ZMod 3) (M := Fin 3 → ZMod 3) (ι := Fin 2)
      (fun i => LinearMap.pi fun k => t 0 i • LinearMap.proj k) := sorry

/-- Over a field, the determinant polynomial classifies modules over a semisimple algebra
(`M0/determinant-classifies`; separability of the centre is a packet hypothesis). -/
theorem determinantClassifies {K : Type*} [Field K] {C : Type*} [Ring C] [Algebra K C]
    [IsSemisimpleRing C] [FiniteDimensional K C] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (α : ι → C) (hα : Submodule.span K (Set.range α) = ⊤)
    {M₁ M₂ : Type*} [AddCommGroup M₁] [Module K M₁] [FiniteDimensional K M₁]
    [AddCommGroup M₂] [Module K M₂] [FiniteDimensional K M₂]
    (ρ₁ : C →ₐ[K] Module.End K M₁) (ρ₂ : C →ₐ[K] Module.End K M₂) :
    (∃ e : M₁ ≃ₗ[K] M₂, ∀ c, (e : M₁ →ₗ[K] M₂) ∘ₗ ρ₁ c = ρ₂ c ∘ₗ e) ↔
      detPoly (fun i => ρ₁ (α i)) = detPoly (fun i => ρ₂ (α i)) := sorry

/-! ### The reflex field and the determinant condition -/

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- `Tr(b | V₀)`. -/
def actionOnV₀ (D : RationalPELDatum B V) (b : B) : Module.End ℂ D.V₀ := sorry

theorem actionOnV₀_apply (D : RationalPELDatum B V) (b : B) (x : D.V₀) :
    (D.actionOnV₀ b x : ℂ ⊗[ℝ] (ℝ ⊗[ℚ] V)) =
      ((bAct (V := V) b).baseChange ℝ).baseChange ℂ x := sorry

def traceV₀ (D : RationalPELDatum B V) (b : B) : ℂ :=
  LinearMap.trace ℂ D.V₀ (D.actionOnV₀ b)

/-- The reflex field `F₀ ⊂ ℂ`: the field of definition of the class of `V₀`. -/
def reflexField (D : RationalPELDatum B V) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range D.traceV₀)

theorem reflexField_eq_traces (D : RationalPELDatum B V) :
    D.reflexField = IntermediateField.adjoin ℚ (Set.range D.traceV₀) := rfl

theorem reflexField_fixed (D : RationalPELDatum B V) (σ : ℂ ≃ₐ[ℚ] ℂ)
    (hσ : ∀ b : B, ∀ z ∈ Set.range (fun c : B => D.traceV₀ c), σ z = z) :
    ∀ x ∈ D.reflexField, σ x = x := sorry

theorem reflexField_finite (D : RationalPELDatum B V) :
    FiniteDimensional ℚ D.reflexField := sorry

/-- `p` unramified in the centre `F` (here: `p ∤ disc F`) is unramified in `F₀`. -/
theorem unramified_reflex (D : RationalPELDatum B V) (F : Type*) [Field F] [NumberField F]
    [Algebra F B] [NumberField D.reflexField]
    (hcentre : Set.range (algebraMap F B) = (Subring.center B : Set B)) (p : ℕ) (hp : ¬ (p : ℤ) ∣ NumberField.discr F) :
    ¬ (p : ℤ) ∣ NumberField.discr D.reflexField := sorry

/-- `Det_{O|V₀}` has integral coefficients: traces of elements of an order are integral. -/
theorem traceV₀_integral (D : RationalPELDatum B V) (O : Subring B)
    (hO : (Submodule.span ℤ (O : Set B)).FG) (b : B) (hb : b ∈ O) :
    IsIntegral ℤ (D.traceV₀ b) := sorry

theorem reflexField_siegel (D : RationalPELDatum ℚ V) : D.reflexField = ⊥ := sorry

end RationalPELDatum

-- Unit test: reflexField_siegel
example {V : Type*} [AddCommGroup V] [Module ℚ V] (D : RationalPELDatum ℚ V) : D.reflexField = ⊥ :=
  D.reflexField_siegel
-- Unit test: reflexField_picard
example {V : Type*} [AddCommGroup V] [Module ℚ V] (K : Type*) [Field K] [NumberField K] [StarRing K]
    [Module K V] [IsScalarTower ℚ K V] (D : RationalPELDatum K V) (τ : K →+* ℂ)
    (hV₀ : ∀ b : K, D.traceV₀ b = 2 * τ b + starRingEnd ℂ (τ b)) (a : K)
    (ha : τ a ≠ starRingEnd ℂ (τ a)) : D.reflexField ≠ ⊥ := sorry
-- Unit test: reflexField_U11
example {V : Type*} [AddCommGroup V] [Module ℚ V] (K : Type*) [Field K] [NumberField K] [StarRing K]
    [Module K V] [IsScalarTower ℚ K V] (D : RationalPELDatum K V) (τ : K →+* ℂ)
    (hV₀ : ∀ b : K, D.traceV₀ b = τ b + starRingEnd ℂ (τ b)) : D.reflexField = ⊥ := sorry
-- Unit test: reflexField_not_center
example {V : Type*} [AddCommGroup V] [Module ℚ V] (F : Type*) [Field F] [NumberField F] [StarRing F]
    [Module F V] [IsScalarTower ℚ F V] (D : RationalPELDatum F V)
    (hV₀ : ∀ b : F, D.traceV₀ b = algebraMap ℚ ℂ (Algebra.trace ℚ F b))
    (hF : 1 < Module.finrank ℚ F) : D.reflexField = ⊥ := sorry

/-- ShimuraData D4's stabilizer of the conjugacy class of the actual cocharacter mu_h.
The cocharacter is obtained from this D's h, with the sign conversion above. -/
def Supplier.muStabilizer {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (_D : RationalPELDatum B V) :
    Subgroup (ℂ ≃ₐ[ℚ] ℂ) := sorry

/-- The determinant/reflex field agrees with the conjugacy-class field of mu_h;
no stabilizer equality is assumed as a hypothesis. -/
theorem reflexFieldComparison {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) :
    ∀ σ : ℂ ≃ₐ[ℚ] ℂ, σ ∈ Supplier.muStabilizer D ↔
      ∀ x ∈ D.reflexField, σ x = x := sorry

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

-- Unit test: detCondition_siegel
example (g : ℕ) (M : Type) [AddCommGroup M] [Module ℤ M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    SatisfiesDetCondition (ι := Unit) (fun _ => (LinearMap.id : Module.End ℤ M))
      (MvPolynomial.X () ^ g) ↔ Module.finrank ℤ M = g := sorry
-- Unit test: detCondition_char3_signature
example (t t' : Fin 3 → Fin 2 → ZMod 3) (ht : ∀ k, t k = ![1, 1]) (ht' : ∀ k, t' k = ![1, -1])
    (htr : (∑ k, t k 1) = ∑ k, t' k 1) :
    ¬ SatisfiesDetCondition (M := Fin 3 → ZMod 3)
      (fun i => LinearMap.pi fun k => t k i • LinearMap.proj k)
      (∏ k, ∑ i, MvPolynomial.C (t' k i) * MvPolynomial.X i) := sorry
-- Unit test: detCondition_zero
example (M : Type) [AddCommGroup M] [Module ℤ M] [Module.Free ℤ M] [Module.Finite ℤ M] :
    SatisfiesDetCondition (ι := Unit) (fun _ => (LinearMap.id : Module.End ℤ M)) 1 ↔
      Module.finrank ℤ M = 0 := sorry
-- Unit test: detCondition_baseChange_C
example {ι : Type} [Fintype ι] [DecidableEq ι] (M₁ M₂ : Type) [AddCommGroup M₁] [Module ℂ M₁]
    [FiniteDimensional ℂ M₁] [AddCommGroup M₂] [Module ℂ M₂] [FiniteDimensional ℂ M₂]
    (C : Type) [Ring C] [Algebra ℂ C] [IsSemisimpleRing C] [FiniteDimensional ℂ C]
    (α : ι → C) (hα : Submodule.span ℂ (Set.range α) = ⊤)
    (ρ₁ : C →ₐ[ℂ] Module.End ℂ M₁) (ρ₂ : C →ₐ[ℂ] Module.End ℂ M₂) :
    SatisfiesDetCondition (fun i => ρ₁ (α i)) (detPoly fun i => ρ₂ (α i)) ↔
      ∃ e : M₁ ≃ₗ[ℂ] M₂, ∀ c, (e : M₁ →ₗ[ℂ] M₂) ∘ₗ ρ₁ c = ρ₂ c ∘ₗ e :=
  (determinantClassifies α hα ρ₁ ρ₂).symm

/-- Over an algebraically closed field of characteristic prime to `Disc`, the determinant
condition says `M ≅ L₀ ⊗ k` (`M0/determinant-condition-splitting`). -/
theorem determinantConditionSplitting {k : Type*} [Field k] [IsAlgClosed k] {C : Type*} [Ring C]
    [Algebra k C] [IsSemisimpleRing C] [FiniteDimensional k C]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → C)
    (hα : Submodule.span k (Set.range α) = ⊤)
    {M L₀ : Type*} [AddCommGroup M] [Module k M] [FiniteDimensional k M] [AddCommGroup L₀]
    [Module k L₀] [FiniteDimensional k L₀] (ρ : C →ₐ[k] Module.End k M)
    (ρ₀ : C →ₐ[k] Module.End k L₀) :
    SatisfiesDetCondition (fun i => ρ (α i)) (detPoly fun i => ρ₀ (α i)) ↔
      ∃ e : M ≃ₗ[k] L₀, ∀ c, (e : M →ₗ[k] L₀) ∘ₗ ρ c = ρ₀ c ∘ₗ e := sorry

/-- Kottwitz Lemma 7.2 / Corollary 7.3: actual self-dual O-linear lattices
in the same rational PEL space are isometric. Maximal unramified order, the A/C cases
and the D-case p != 2 condition are omitted prototype hypotheses, explicit in the packet. -/
theorem selfDualLatticeClassification (p : ℕ) [Fact p.Prime]
    {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B]
    {V : Type*} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (D₁ D₂ : PIntegralPELDatum p B V) (hform : D₁.form = D₂.form)
    (horder : D₁.order.carrier = D₂.order.carrier) :
    ∃ e : (ℚ_[p] ⊗[ℚ] V) ≃ₗ[ℚ_[p]] (ℚ_[p] ⊗[ℚ] V),
      (∀ b ∈ D₁.order.carrier, ∀ x,
        e ((bAct (V := V) b).baseChange ℚ_[p] x) =
          (bAct (V := V) b).baseChange ℚ_[p] (e x)) ∧
      (∀ x y, LinearMap.BilinForm.baseChange ℚ_[p] D₁.form (e x) (e y) =
        LinearMap.BilinForm.baseChange ℚ_[p] D₁.form x y) ∧
      e '' (D₁.selfDual : Set (ℚ_[p] ⊗[ℚ] V)) = D₂.selfDual := sorry

/-- Bijakowski–Pilloni–Stroh Lemme 1.1.4: with `ℂ ≅ ℂ_p` fixed and `p` totally split in the
reflex field, signatures at two embeddings inducing the same `p`-adic place agree (the remaining
hypotheses (i)–(iv) of their 1.1.1 are packet hypotheses). -/
theorem bpsSignatureConstancy {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B] {V : Type*}
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
  finite : Module.Finite A V
  projective : Module.Projective A V
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
def toSkewHermitian {F : Type*} [Field F] [NumberField F] [StarRing F]
    {W : Type*} [AddCommGroup W] [Module F W] [Module ℚ W] [IsScalarTower ℚ F W]
    (H : HermitianSpace F W) (δ : F) (_hδ : star δ = -δ) : W → W → ℚ :=
  fun x y => Algebra.trace ℚ F (δ * H.pairing x y)

theorem unitaryGroup_matrix (n : Type*) [Fintype n] [DecidableEq n] (U : Matrix n n A) :
    U ∈ Matrix.unitaryGroup n A ↔ star U * U = 1 := Matrix.mem_unitaryGroup_iff'

end HermitianSpace

-- Unit test: hermitianSpace_sharp_rank
example {A : Type*} [CommRing A] [StarRing A] {V : Type*} [AddCommGroup V] [Module A V]
    (H : HermitianSpace A V) (x : V) (a : A) :
    H.sharp.pairing (x, a) (0, 1) = a ∧ H.sharp.pairing (x, 0) (x, 0) = H.pairing x x := sorry
-- Unit test: hermitianSpace_unitary_matrix
example (n : ℕ) (U : Matrix (Fin n) (Fin n) ℂ) :
    U ∈ Matrix.unitaryGroup (Fin n) ℂ ↔ star U * U = 1 := Matrix.mem_unitaryGroup_iff'
-- Unit test: hermitianSpace_not_symmetric
example (H : HermitianSpace ℂ ℂ) (a x y : ℂ) : H.pairing x (a • y) = star a * H.pairing x y := sorry
-- Unit test: hermitianSpace_trace_dictionary
example
    {F : Type*} [Field F] [NumberField F] [StarRing F] {W : Type*} [AddCommGroup W]
    [Module F W] [Module ℚ W] [IsScalarTower ℚ F W] (H : HermitianSpace F W)
    (δ : F) (_hδ : star δ = -δ) (x y : W) :
    H.toSkewHermitian δ _hδ x y = -H.toSkewHermitian δ _hδ y x := sorry

/-- A rational skew-hermitian space over `O_F ⊗ R`: an `R`-bilinear skew-symmetric perfect pairing
with `⟨ax, y⟩ = ⟨x, a^c y⟩`. -/
structure SkewHermitianSpace (R : Type*) [CommRing R] (A : Type*) [CommRing A] [StarRing A]
    [Algebra R A] (W : Type*) [AddCommGroup W] [Module A W] [Module R W] [IsScalarTower R A W] where
  pairing : LinearMap.BilinForm R W
  skew : ∀ x y, pairing x y = -pairing y x
  finite : Module.Finite A W
  projective : Module.Projective A W
  perfect : Function.Bijective (fun x => pairing x)
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

/-- The paper's GU consists of maps, including the trivial group on W=0. Lan's paired
similitude group is kept separately as PELDatum.similitudeGroup. -/
def GU (S : SkewHermitianSpace R A W) : Subgroup (W ≃ₗ[A] W) where
  carrier := {g | ∃ c : Rˣ, ∀ x y, S.pairing (g x) (g y) = (c : R) * S.pairing x y}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem gu_rankOne (S : SkewHermitianSpace R A A) (a : Aˣ) (c : Rˣ)
    (hc : algebraMap R A c = (a : A) * star (a : A)) :
    LinearEquiv.smulOfUnit a ∈ S.GU := sorry

/-- Type `Φ` for rank one: `⟨a x, x⟩ ≥ 0` for totally imaginary `a` positive on `Φ`. -/
def HasType [Algebra ℚ A] [Module ℚ W] [IsScalarTower ℚ A W] (S : SkewHermitianSpace ℚ A W)
    (posImag : Set A) : Prop :=
  ∀ a ∈ posImag, ∀ x, 0 ≤ S.pairing (a • x) x

/-- The integral PEL datum underlying a skew-hermitian space (forgetting to `ℤ`-lattices). -/
def underlyingPairing (S : SkewHermitianSpace R A W) : LinearMap.BilinForm R W := S.pairing

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

-- Unit test: cmTorus_points_imagQuad
example (a : ℂˣ) : a ∈ cmTorus ℝ ℂ := sorry
-- Unit test: gu_rankOne_multiplier
example (S : SkewHermitianSpace ℝ ℂ ℂ) (a : ℂˣ) (c : ℝˣ)
    (hc : algebraMap ℝ ℂ c = (a : ℂ) * star (a : ℂ)) :
    LinearEquiv.smulOfUnit a ∈ S.GU := S.gu_rankOne a c hc
-- Unit test: skewHermitian_type_flip
example (S : SkewHermitianSpace ℚ ℚ ℚ) (posImag : Set ℚ) (_hS : S.HasType posImag)
    (a : ℚ) (ha : a ∈ posImag) (x : ℚ) (hx : 0 < S.pairing (a • x) x) :
    ¬ (∀ a ∈ posImag, ∀ x, 0 ≤ -S.pairing (a • x) x) := fun h => by
  have := h a ha x; linarith
-- Unit test: skewHermitian_zero
example (S : SkewHermitianSpace ℚ ℚ (Fin 0 → ℚ)) :
    Subsingleton S.GU := sorry

/-- Similarity classes of rank-one skew-hermitian spaces everywhere locally similar to `S` (data). -/
def rankOneLocalClasses {A : Type*} [CommRing A] [StarRing A] [Algebra ℚ A]
    (_S : SkewHermitianSpace ℚ A A) : Type := sorry

/-- AA.1's norm-similitude torus of the actual CM field. Its R-points are cmTorus
R (R tensor F), and the star is the CM conjugation. The coefficient comparison is omitted. -/
def Supplier.cmTorusCoordinate (F : Type*) [Field F] [NumberField F]
    [NumberField.IsCMField F] [StarRing F] : CommHopfAlgCat.{0} ℚ := sorry

abbrev cmTorusKer1 (F : Type*) [Field F] [NumberField F] [NumberField.IsCMField F]
    [StarRing F] : Type := Supplier.KerOne (Supplier.cmTorusCoordinate F)

/-- LTXZZ Remark 3.5.2: everywhere-locally-similar rank-one spaces are classified by the finite
group `ker¹(T₀)` (the Galois-cohomology carrier is the recorded gap). -/
theorem rankOneSkewHermitianClassification {A : Type*} [Field A] [NumberField A]
    [NumberField.IsCMField A] [StarRing A]
    (S : SkewHermitianSpace ℚ A A) :
    Nonempty (rankOneLocalClasses S ≃ cmTorusKer1 A) ∧ Finite (cmTorusKer1 A) := sorry

/-- A generalized CM type of rank `N`: `Ψ : Σ_∞ →₀ ℕ` with `Ψ τ + Ψ (c ∘ τ) = N`. -/
structure GeneralizedCMType (F : Type*) [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ) where
  coeff : (F →+* ℂ) →₀ ℕ
  sum_conj : ∀ τ, coeff τ + coeff (NumberField.ComplexEmbedding.conjugate τ) = N

namespace GeneralizedCMType
variable {F : Type*} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ}

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

theorem fixed_of_stabilizer (Ψ : GeneralizedCMType F N) (σ : ℂ ≃+* ℂ) (hσ : galois_smul σ Ψ = Ψ)
    (z : ℂ) (hz : z ∈ Ψ.reflexField) : σ z = z := hz σ hσ

/-- `Ψ = NΦ − τ_∞ + τ_∞^c` (LTXZZ Lemma 4.2.1 signature). -/
def nPhi_sub (Φ : GeneralizedCMType F 1) (τ : F →+* ℂ) (N : ℕ)
    (hN : 1 ≤ N) (hτ : Φ.coeff τ = 1) : GeneralizedCMType F N := sorry

end GeneralizedCMType

-- Signature arithmetic helper.
example {F : Type*} [Field F] [NumberField F] [NumberField.IsCMField F] (Ψ : GeneralizedCMType F 3) (τ : F →+* ℂ) (h : Ψ.coeff τ = 2) :
    Ψ.coeff (NumberField.ComplexEmbedding.conjugate τ) = 1 := by
  have := Ψ.sum_conj τ; omega
-- Unit test: gcmType_cm_rank1
example {F : Type*} [Field F] [NumberField F] [NumberField.IsCMField F] (Ψ : GeneralizedCMType F 1) (τ : F →+* ℂ) :
    Ψ.IsCMType ∧ (Ψ.coeff τ = 0 ∨ Ψ.coeff τ = 1) := by
  refine ⟨rfl, ?_⟩; have := Ψ.sum_conj τ; omega
-- Unit test: gcmType_not
example {F : Type*} [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ) (c : (F →+* ℂ) →₀ ℕ) (τ₁ : F →+* ℂ)
    (h₁ : c τ₁ + c (NumberField.ComplexEmbedding.conjugate τ₁) = 2) (h₂ : N = 3) :
    ¬ ∃ Ψ : GeneralizedCMType F N, Ψ.coeff = c := by
  rintro ⟨Ψ, rfl⟩; have := Ψ.sum_conj τ₁; omega

/-- Published LTXZZ Definition 3.3.2: CM types are the actual rank-one types of F. -/
def CMField.reflexiveClosure (F : Subfield ℂ) [NumberField F] [NumberField.IsCMField F] :
    Subfield ℂ := F ⊔ ⨅ Φ : GeneralizedCMType F 1, Φ.reflexField

namespace CMField
variable (F : Subfield ℂ) [NumberField F] [NumberField.IsCMField F]

theorem reflexiveClosure_isCM : NumberField.IsCMField (reflexiveClosure F) := sorry

@[instance_reducible] def reflexiveClosure.algebra : Algebra F (reflexiveClosure F) := sorry

attribute [instance] reflexiveClosure.algebra

theorem reflexiveClosure_galois :
    FiniteDimensional F (reflexiveClosure F) ∧ IsGalois F (reflexiveClosure F) := sorry

theorem reflexiveClosure_eq_of_galois [IsGalois ℚ F] : reflexiveClosure F = F := sorry

theorem reflexiveClosure_eq_of_imagQuad (K : Subfield ℂ) [NumberField K]
    [NumberField.IsCMField K] (hdim : Module.finrank ℚ K = 2) (hKF : K ≤ F) :
    reflexiveClosure F = F := sorry

theorem reflexiveClosure_le_galoisClosure (G : Subfield ℂ) [NumberField G] [IsGalois ℚ G]
    (hF : F ≤ G) : reflexiveClosure F ≤ G := sorry

end CMField

-- Unit test: reflexiveClosure_imagQuad
example (F : Subfield ℂ) [NumberField F]
    [NumberField.IsCMField F] (hdim : Module.finrank ℚ F = 2) :
    CMField.reflexiveClosure F = F := sorry

-- Unit test: reflexiveClosure_galois
example (F : Subfield ℂ) [NumberField F]
    [NumberField.IsCMField F] [IsGalois ℚ F] : CMField.reflexiveClosure F = F := sorry

-- Inclusion helper for the published closure.
example (F : Subfield ℂ)
    [NumberField F] [NumberField.IsCMField F] : F ≤ CMField.reflexiveClosure F := sorry

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

theorem tauPart_span_of_decomposition {R : Type*} [CommRing R] {OF : Type*} [CommRing OF] {M : Type*}
    [AddCommGroup M] [Module R M] [Module OF M] {ι : Type*} [Fintype ι] (τ : ι → (OF →+* R))
    (hdec : ∀ m : M, ∃ v : ι → M, (∀ i, v i ∈ tauPart (M := M) (τ i)) ∧ m = ∑ i, v i) :
    ⨆ i, tauPart (M := M) (τ i) = ⊤ := sorry

/-- The `p`-Frobenius on embeddings `Σ_∞ = Hom(O_F, 𝔽_p^◇)`. -/
def frobeniusOnEmbeddings (p : ℕ) [Fact p.Prime] {OF k : Type*} [CommRing OF] [Field k]
    [CharP k p] (τ : OF →+* k) : OF →+* k := (frobenius k p).comp τ

theorem frobeniusOnEmbeddings_apply {OF k : Type*} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] (τ : OF →+* k) (a : OF) :
    frobeniusOnEmbeddings p τ a = τ a ^ p := rfl

-- Unit test: tauField_split
example (p : ℕ) [Fact p.Prime] {F : Type*} [Field F] (τ : F →+* AlgebraicClosure ℚ_[p])
    (h : ∀ a, τ a ∈ Set.range (algebraMap ℚ_[p] (AlgebraicClosure ℚ_[p]))) :
    tauField p τ = ⊥ := sorry
-- Unit test: tauField_inert
example (p : ℕ) [Fact p.Prime] {F : Type*} [Field F] (τ : F →+* AlgebraicClosure ℚ_[p])
    [NumberField F] (x : F) (hx : x ^ 2 = -1)
    (hgen : IntermediateField.adjoin ℚ ({x} : Set F) = ⊤)
    (hp : ¬ ∃ y : ℚ_[p], y ^ 2 = -1) :
    Module.finrank ℚ_[p] (tauField p τ) = 2 := sorry
-- Unit test: tauPart_ramified
example {R OF : Type*} [CommRing R] [CommRing OF] {M : Type*} [AddCommGroup M] [Module R M]
    [Module OF M] (τ : OF →+* R) (π : OF) (m : M) (hπ : τ π = 0) (hm : π • m ≠ 0) :
    m ∉ tauPart (R := R) (M := M) τ := fun h => hm (by rw [h π, hπ, zero_smul])
-- Unit test: tauPart_zero
example {R OF : Type*} [CommRing R] [CommRing OF] (τ : OF →+* R) :
    tauPart (R := R) (M := PUnit) τ = ⊤ := by ext; simp [tauPart]

/-- The PEL adapter to Tau Ceti's actual integral weight-one Hodge carrier.
This is the current library's AlmostComplexStructure.latticeHodgeStructure applied to D.J;
its newest module is not compiled in the shared build, so its construction is an interface
here. It is cited as existing work, not a new generic Hodge construction. -/
def IntegralPELDatum.latticeHodge {O : Type*} [Ring O] [StarRing O]
    {L : Type*} [AddCommGroup L] [Module O L] (D : IntegralPELDatum O L)
    {W : Type*} [AddCommGroup W] [Module ℂ W] {ι : L →ₗ[ℤ] W}
    (hℂ : IsBaseChange ℂ ι) : TauCeti.Hodge.HodgeStructure hℂ 1 := sorry

/-- Tau Ceti uses Q(Jx,x)>0, while PEL uses psi(x,Jx)>0; the weight-one adapter
uses -psi. The homological weight-minus-one structure is its existing Hodge dual. -/
theorem IntegralPELDatum.hodgePolarization {O : Type*} [Ring O] [StarRing O]
    {L : Type*} [AddCommGroup L] [Module O L] (D : IntegralPELDatum O L)
    {W : Type*} [AddCommGroup W] [Module ℂ W] {ι : L →ₗ[ℤ] W}
    (hℂ : IsBaseChange ℂ ι) :
    TauCeti.Hodge.IsPolarization hℂ (D.latticeHodge hℂ) (-D.form) := sorry

/-! Additional intrinsic targets: the simple centre, completed lattice and rationalization.
These use the library carriers; local-field unramifiedness remains an imported hypothesis. -/
namespace PositiveInvolution
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B] [StarModule ℚ B]

theorem centralIdempotent_fixed (_h : PositiveInvolution B) (e : B)
    (he : e * e = e) (hc : e ∈ Subring.center B) : star e = e := sorry

theorem center_classification [IsSimpleRing B] (_h : PositiveInvolution B)
    (F : Type*) [Field F] [NumberField F] (ι : F →ₐ[ℚ] B)
    (hι : Set.range ι = (Subalgebra.center ℚ B : Set B)) :
    NumberField.IsTotallyReal F ∨ NumberField.IsCMField F := sorry

theorem fixedCenter_totallyReal [IsSimpleRing B] (_h : PositiveInvolution B)
    (F₀ : Type*) [Field F₀] [NumberField F₀] (ι : F₀ →ₐ[ℚ] B)
    (hι : Set.range ι = {b | b ∈ Subalgebra.center ℚ B ∧ star b = b}) :
    NumberField.IsTotallyReal F₀ := sorry
end PositiveInvolution

/-- Product presentation of ProfiniteArithmetic Layer 0's Additive TauCeti.zHat,
identified by zHat.nonempty_ringEquiv_pi. CompletedIntegerRing is a local notation,
not an upstream declaration or a new profinite-integers target. -/
instance completedPrimeFact (p : Nat.Primes) : Fact p.val.Prime := ⟨p.property⟩
abbrev CompletedIntegerRing := ∀ p : Nat.Primes, ℤ_[p.val]
def completedIntegerToAdele : CompletedIntegerRing →+* IsDedekindDomain.FiniteAdeleRing ℤ ℚ := sorry
instance completedIntegerAdeleAlgebra :
    Algebra CompletedIntegerRing (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) :=
  completedIntegerToAdele.toAlgebra

namespace RationalPELDatum
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- The full completed lattice, not the discrete integral image.
The lattice embedding is integral, finite free and rationally spanning; O-stability and
compatibility with the chosen rationalization are omitted prototype inputs. -/
def adelicLattice (_D : RationalPELDatum B V) (L : Type*) [AddCommGroup L]
    [Module.Finite ℤ L] [Module.Free ℤ L] (ι : L →ₗ[ℤ] V)
    (_hi : Function.Injective ι) (_hs : Submodule.span ℚ (Set.range ι) = ⊤) :
    Submodule CompletedIntegerRing (IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] V) :=
  Submodule.span CompletedIntegerRing (Set.range fun x : L => (1 : IsDedekindDomain.FiniteAdeleRing ℤ ℚ) ⊗ₜ[ℚ] ι x)
end RationalPELDatum

namespace IntegralPELDatum
variable {O : Type*} [Ring O] [StarRing O] {L : Type*} [AddCommGroup L] [Module O L]

/-- Source-faithful promotion to a p-integral datum. Dq is the rationalization of D through e;
order-action, J, star and full-order compatibility are omitted prototype hypotheses.
Good discriminant, type-D parity and dual-index hypotheses are required in the roadmap. -/
def toPIntegral (D : IntegralPELDatum O L)
    {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B]
    {V : Type*} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (Dq : RationalPELDatum B V) (_Oq : StarOrder B) (e : (ℚ ⊗[ℤ] L) ≃ₗ[ℚ] V)
    (_he : ∀ x y, Dq.form (e x) (e y) = D.toRational x y)
    (p : ℕ) [Fact p.Prime] : PIntegralPELDatum p B V := sorry
end IntegralPELDatum

-- Unit test: Order.disc_matrix
example (n : ℕ) : Order.disc (fun ij : Fin n × Fin n =>
    Matrix.single ij.1 ij.2 (1 : ℚ)) = (-1 : ℚ) ^ (n * (n - 1) / 2) := sorry

end M0

/-! ## Carriers for M1–M6

Abelian schemes over a base, their duals, torsion, Lie algebras and Tate modules belong to
AbelianSchemesAndArithmeticModuli A1–A4 and are not in the pinned libraries (Tau Ceti has abelian
varieties over a field, `TauCeti.AlgebraicGeometry.AbelianVariety`). They enter here through the
data-only carrier `AbelianScheme` and the supplier structure `AbelianSchemeSupplier`, over an
affine base `Spec R`. Group laws and geometric connectedness are retained. A2 supplies ample polarizations; A3–A4
supply the linked torsion, de Rham and Tate objects with their comparison laws. -/

universe u

/-- Contract imported from A1: actual smooth proper commutative group schemes with
geometrically connected fibres. The carrier extends Tau Ceti's field-only abelian varieties. -/
structure AbelianScheme (S : Scheme.{u}) where
  X : Scheme.{u}
  π : X ⟶ S
  group : CategoryTheory.GrpObj (Over.mk π)
  commutative : CategoryTheory.IsCommMonObj (Over.mk π)
  proper : IsProper π
  smooth : Smooth π
  connected : GeometricallyConnected π

attribute [instance] AbelianScheme.group AbelianScheme.commutative
  AbelianScheme.proper AbelianScheme.smooth AbelianScheme.connected

/-- A group-scheme homomorphism, rather than an arbitrary map over S. -/
@[ext] structure AbelianScheme.Hom {S : Scheme.{u}} (A B : AbelianScheme S) where
  f : A.X ⟶ B.X
  comm : f ≫ B.π = A.π
  preservesGroup : CategoryTheory.IsMonHom (Over.homMk (U := Over.mk A.π) (V := Over.mk B.π) f comm)

namespace AbelianScheme
variable {S : Scheme.{u}}

/-- Addition is the target group law; multiplication in End is composition. These instances
are the relative A1 extension of the imported field-level Tau Ceti construction. -/
def End (A : AbelianScheme S) := A.Hom A
noncomputable instance endRing (A : AbelianScheme S) : Ring (End A) := sorry

def id (A : AbelianScheme S) : A.Hom A := sorry

def comp {A B C : AbelianScheme S} (f : A.Hom B) (g : B.Hom C) : A.Hom C := sorry

theorem comp_f {A B C : AbelianScheme S} (f : A.Hom B) (g : B.Hom C) :
    (comp f g).f = f.f ≫ g.f := sorry

def mulBy (A : AbelianScheme S) (n : ℤ) : A.Hom A := (n : End A)

/-- Finite faithfully flat group homomorphisms. Surjectivity is on the underlying topological
spaces, so this also allows the zero-dimensional abelian scheme. -/
def IsIsogeny {A B : AbelianScheme S} (f : A.Hom B) : Prop :=
  IsFinite f.f ∧ Flat f.f ∧ Function.Surjective f.f.base

def ofAbelianVariety {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) : AbelianScheme (Spec (.of K)) := sorry

def toAbelianVariety {K : Type u} [Field K]
    (A : AbelianScheme (Spec (.of K))) : TauCeti.AlgebraicGeometry.AbelianVariety K := sorry

theorem of_toAbelianVariety {K : Type u} [Field K]
    (A : AbelianScheme (Spec (.of K))) : ofAbelianVariety (toAbelianVariety A) = A := sorry

end AbelianScheme

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
  comp_eq : ∀ {A B C : AbelianScheme (Spec R)} (f : A.Hom B) (g : B.Hom C), comp f g = AbelianScheme.comp f g
  mulBy_eq : ∀ A n, mulBy A n = AbelianScheme.mulBy A n
  dual_id : ∀ A, dualHom (AbelianScheme.id A) = AbelianScheme.id (dual A)
  dual_comp : ∀ {A B C : AbelianScheme (Spec R)} (f : A.Hom B) (g : B.Hom C),
    dualHom (comp f g) = comp (dualHom g) (dualHom f)
  lie_id : ∀ A, lieAct (AbelianScheme.id A) = LinearMap.id
  lie_comp : ∀ {A : AbelianScheme (Spec R)} (f g : A.Hom A), lieAct (comp f g) = (lieAct g).comp (lieAct f)
  lieRepresentation : ∀ A, AbelianScheme.End A →+* Module.End R (lie A)
  lieRepresentation_eq : ∀ A f, lieRepresentation A f = lieAct f
  homologicalDeRham : AbelianScheme (Spec R) → ModuleCat.{u} R
  deRhamAct : ∀ A, AbelianScheme.End A →+* Module.End R (homologicalDeRham A)
  hodgeInjection : ∀ A, (Module.Dual R (lie (dual A))) →ₗ[R] homologicalDeRham A
  hodgeProjection : ∀ A, homologicalDeRham A →ₗ[R] lie A
  hodgeExact : ∀ A, Function.Exact (hodgeInjection A) (hodgeProjection A)
  hodgeInjective : ∀ A, Function.Injective (hodgeInjection A)
  hodgeSurjective : ∀ A, Function.Surjective (hodgeProjection A)
  polarizationPairing : ∀ {A : AbelianScheme (Spec R)}, A.Hom (dual A) →
    LinearMap.BilinForm R (homologicalDeRham A)
  negHom : ∀ {A B : AbelianScheme (Spec R)}, A.Hom B → A.Hom B
  bidual : ∀ A : AbelianScheme (Spec R), A.Hom (dual (dual A))
  /-- A2's ample polarization carrier. Its geometric definition is a fibrewise ample
  invertible sheaf inducing the map A→A∨. This future Type is not an arbitrary predicate. -/
  polarization : AbelianScheme (Spec R) → Type u
  polarizationHom : ∀ {A : AbelianScheme (Spec R)}, polarization A → A.Hom (dual A)
  polarizationIsogeny : ∀ {A} (pol0 : polarization A),
    AbelianScheme.IsIsogeny (polarizationHom pol0)
  polarizationSymmetric : ∀ {A} (pol0 : polarization A),
    comp (bidual A) (dualHom (polarizationHom pol0)) = polarizationHom pol0

attribute [instance] AbelianSchemeSupplier.torsionGroup

/-! ## M1. The moduli functors and descent -/

section M1
variable {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)

/-- A quasi-isogeny `A ⇢ B`: a homomorphism `f` with a denominator `n` (`f/n`). -/
structure QuasiIsogeny (A B : AbelianScheme (Spec R)) where
  num : A.Hom B
  den : ℕ
  den_pos : 0 < den
  isogeny : AbelianScheme.IsIsogeny num

namespace QuasiIsogeny
variable {A B C : AbelianScheme (Spec R)}

/-- Equality after clearing denominators. Raw representatives are not themselves morphisms;
the localized category and all moduli equivalences use Class. -/
def Equivalent (f g : QuasiIsogeny A B) : Prop :=
  𝒜.comp f.num (𝒜.mulBy B g.den) = 𝒜.comp g.num (𝒜.mulBy B f.den)

def setoid (𝒜 : AbelianSchemeSupplier R) : Setoid (QuasiIsogeny A B) := sorry

def Class (A B : AbelianScheme (Spec R)) := Quotient (setoid 𝒜 (A := A) (B := B))

theorem setoid_iff (f g : QuasiIsogeny A B) :
    (setoid 𝒜).r f g ↔ Equivalent 𝒜 f g := sorry

/-- The degree of the finite locally free kernel, locally constant on the base (A3 contract). -/
def numeratorKernelDegree (f : QuasiIsogeny A B) : LocallyConstant (Spec R) ℕ := sorry

/-- Lan's prime-to-box condition includes the numerator's kernel degree and allows changing
representatives. For LTXZZ quasi-p-isogenies only the clearing denominator must avoid p. -/
def IsPrimeTo (box : Set ℕ) (f : QuasiIsogeny A B) : Prop :=
  ∃ g : QuasiIsogeny A B, Equivalent 𝒜 f g ∧
    (∀ p ∈ box, ¬ p ∣ g.den) ∧ (∀ p ∈ box, ∀ s, ¬ p ∣ numeratorKernelDegree g s)

def dual (f : QuasiIsogeny A B) : QuasiIsogeny (𝒜.dual B) (𝒜.dual A) := sorry

def comp (𝒜 : AbelianSchemeSupplier R) (f : QuasiIsogeny A B) (g : QuasiIsogeny B C) : QuasiIsogeny A C := sorry

def inverse (𝒜 : AbelianSchemeSupplier R) (f : QuasiIsogeny A B) : QuasiIsogeny B A := sorry

def IsQuasiP (p : ℕ) (f : QuasiIsogeny A B) : Prop :=
  ∃ g : QuasiIsogeny A B, Equivalent 𝒜 f g ∧ ¬ p ∣ g.den

def ofIsogeny (f : A.Hom B) (hf : AbelianScheme.IsIsogeny f) : QuasiIsogeny A B :=
  ⟨f, 1, Nat.one_pos, hf⟩

theorem inverse_comp (f : QuasiIsogeny A B) :
    Equivalent 𝒜 (comp 𝒜 f (inverse 𝒜 f))
      (ofIsogeny (AbelianScheme.id A) (by sorry)) := sorry

theorem primeTo_iff_both_quasiP (p : ℕ) [Fact p.Prime] (f : QuasiIsogeny A B) :
    IsPrimeTo 𝒜 {p} f ↔ IsQuasiP 𝒜 p f ∧ IsQuasiP 𝒜 p (inverse 𝒜 f) := sorry

end QuasiIsogeny

/-- Multiplication by a locally constant integer section, glued from the usual [n] maps. -/
def AbelianScheme.locallyConstantMulBy (A : AbelianScheme (Spec R))
    (_n : LocallyConstant (Spec R) ℤ) : A.Hom A := sorry

/-- A rational polarization with a positive locally constant clearing factor and an actual
A2 polarization. This retains the source's componentwise positivity. -/
structure BoxPolarization (box : Set ℕ) (A : AbelianScheme (Spec R)) where
  toQuasiIsogeny : QuasiIsogeny A (𝒜.dual A)
  primeTo : toQuasiIsogeny.IsPrimeTo 𝒜 box
  amplePolarization : 𝒜.polarization A
  clearing : LocallyConstant (Spec R) ℕ
  clearing_pos : ∀ s, 0 < clearing s
  clearingRelation : 𝒜.comp toQuasiIsogeny.num
      (AbelianScheme.locallyConstantMulBy (𝒜.dual A) (clearing.map (fun (n : ℕ) => (n : ℤ)))) =
    𝒜.comp (𝒜.polarizationHom amplePolarization)
      (𝒜.mulBy (𝒜.dual A) toQuasiIsogeny.den)

namespace BoxPolarization
variable {𝒜} {box : Set ℕ} {A B : AbelianScheme (Spec R)}

/-- `f^∨ ∘ λ ∘ f`. -/
def pullback (pol' : BoxPolarization 𝒜 box B) (f : QuasiIsogeny A B) (hf : f.IsPrimeTo 𝒜 box) :
    BoxPolarization 𝒜 box A :=
  sorry

/-- Positive inverse polarization on the dual, transported through the canonical bidual. -/
def inverse (pol' : BoxPolarization 𝒜 box A) : BoxPolarization 𝒜 box (𝒜.dual A) := sorry

theorem inv_pos (pol' : BoxPolarization 𝒜 box A) :
    QuasiIsogeny.Equivalent 𝒜 (inverse pol').toQuasiIsogeny
      (QuasiIsogeny.comp 𝒜 (QuasiIsogeny.inverse 𝒜 pol'.toQuasiIsogeny)
        (QuasiIsogeny.ofIsogeny (𝒜.bidual A) (by sorry))) := sorry

end BoxPolarization

-- Unit test: quasiIsogeny_mulBy
example (A : AbelianScheme (Spec R))
    (n : ℕ) (hn : 0 < n) (hniso : AbelianScheme.IsIsogeny (𝒜.mulBy A n)) :
    QuasiIsogeny.Equivalent 𝒜 ⟨𝒜.mulBy A n, n, hn, hniso⟩
      (QuasiIsogeny.ofIsogeny (AbelianScheme.id A) (by sorry)) := sorry

-- Unit test: quasiIsogeny_id
example (A : AbelianScheme (Spec R)) (box : Set ℕ)
    (hbox : ∀ p ∈ box, p.Prime) :
    (QuasiIsogeny.ofIsogeny (AbelianScheme.id A) (by sorry)).IsPrimeTo 𝒜 box := sorry

-- Unit test: quasiIsogeny_frobenius_not_primeTo
example
    (A B : AbelianScheme (Spec R)) (p : ℕ) [Fact p.Prime] (f : QuasiIsogeny A B)
    (hdeg : ∀ s, f.numeratorKernelDegree s = p) (hden : f.den = 1) (s : Spec R) :
    f.IsQuasiP 𝒜 p ∧ ¬ f.IsPrimeTo 𝒜 {p} := sorry

/-- Symmetry and ampleness use A2's actual polarization carrier; negation is never inferred
from a positive denominator. This test is supplied once that carrier is imported. -/
-- Unit test: boxPolarization_neg
example
    (A : AbelianScheme (Spec R)) (box : Set ℕ) (pol' : BoxPolarization 𝒜 box A)
    [Nontrivial (𝒜.lie A)] :
    ¬ ∃ (q : 𝒜.polarization A) (c : ℕ), 0 < c ∧
      𝒜.comp (𝒜.negHom pol'.toQuasiIsogeny.num) (𝒜.mulBy (𝒜.dual A) c) =
        𝒜.comp (𝒜.polarizationHom q) (𝒜.mulBy (𝒜.dual A) pol'.toQuasiIsogeny.den) := sorry

/-- A PEL triple `(A, λ, i)` over `Spec R`: `i : O → End(A)` with the Rosati condition
`i(b)^∨ ∘ λ = λ ∘ i(b*)` and the Kottwitz condition on `Lie_{A/R}` (a basis `α` of `O` and the
reflex polynomial `detV₀` are fixed). Ampleness is carried by A2's polarization type. -/
structure PELTriple (O : Type*) [Ring O] [StarRing O] (box : Set ℕ) {ι : Type*} [Fintype ι]
    [DecidableEq ι] (α : ι → O) (detV₀ : MvPolynomial ι R) where
  A : AbelianScheme (Spec R)
  pol : BoxPolarization 𝒜 box A
  actualPolarization : 𝒜.polarization A
  numerator_eq : pol.toQuasiIsogeny.num = 𝒜.polarizationHom actualPolarization
  denominator_eq : pol.toQuasiIsogeny.den = 1
  i : O →+* AbelianScheme.End A
  rosati : ∀ b : O, 𝒜.comp pol.toQuasiIsogeny.num (𝒜.dualHom (i b)) =
    𝒜.comp (i (star b)) pol.toQuasiIsogeny.num
  lieFree : Module.Free R (𝒜.lie A)
  lieFinite : Module.Finite R (𝒜.lie A)
  determinant : letI := lieFree; letI := lieFinite
    SatisfiesDetCondition (fun j => 𝒜.lieAct (i (α j))) detV₀

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
  left_inv : 𝒜.comp f g = AbelianScheme.id T.A
  right_inv : 𝒜.comp g f = AbelianScheme.id T'.A
  pol : 𝒜.comp (𝒜.comp f T'.pol.toQuasiIsogeny.num) (𝒜.dualHom f) |>
    fun u => 𝒜.comp u (𝒜.mulBy (𝒜.dual T.A) T.pol.toQuasiIsogeny.den) =
      𝒜.comp T.pol.toQuasiIsogeny.num (𝒜.mulBy (𝒜.dual T.A) T'.pol.toQuasiIsogeny.den)
  equivariant : ∀ b, 𝒜.comp (T.i b) f = 𝒜.comp f (T'.i b)

/-- Base change (supplied by A1 base change of abelian schemes). -/
def pullback {R' : CommRingCat.{u}} (𝒜' : AbelianSchemeSupplier R') (φ : R ⟶ R')
    (_T : PELTriple 𝒜 O box α detV₀) (detV₀' : MvPolynomial ι R')
    (hdet : detV₀' = MvPolynomial.map φ.hom detV₀) :
    PELTriple 𝒜' O box α detV₀' := sorry

theorem relDim (T : PELTriple 𝒜 O box α detV₀) (d : ℕ) (hd : detV₀.IsHomogeneous d)
    (h0 : detV₀ ≠ 0) [Nontrivial R] (h : T.detCondition) : Module.finrank R (𝒜.lie T.A) = d := by
  let _ := T.lieFree; let _ := T.lieFinite; exact SatisfiesDetCondition.rank h d hd h0

theorem siegel (T : PELTriple 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)) :
    T.detCondition ↔ (letI := T.lieFree; letI := T.lieFinite; Module.finrank R (𝒜.lie T.A) = 1) :=
  sorry

/-- A1's extension specializes to Tau Ceti's actual abelian-variety carrier. -/
def toAbelianVariety {K : Type u} [Field K] (𝒜 : AbelianSchemeSupplier (.of K))
    {O : Type*} [Ring O] [StarRing O] {box : Set ℕ} {ι : Type*} [Fintype ι]
    [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι K}
    (T : PELTriple 𝒜 O box α detV₀) : TauCeti.AlgebraicGeometry.AbelianVariety K :=
  T.A.toAbelianVariety

end PELTriple

-- Unit test: pelTriple_siegel
example (T : PELTriple 𝒜 ℤ ∅ (fun _ : Unit => (1 : ℤ)) (MvPolynomial.X () ^ 1)) :
    T.detCondition ↔ (letI := T.lieFree; letI := T.lieFinite; Module.finrank R (𝒜.lie T.A) = 1) :=
  T.siegel
-- Unit test: pelTriple_rosati_fails
example (box : Set ℕ) (α : Fin 2 → GaussianInt) (detV₀ : MvPolynomial (Fin 2) R)
    (T : PELTriple 𝒜 GaussianInt box α detV₀) :
    𝒜.comp T.pol.toQuasiIsogeny.num (𝒜.dualHom (T.i ⟨0, 1⟩)) =
      𝒜.comp (T.i ⟨0, -1⟩) T.pol.toQuasiIsogeny.num := T.rosati ⟨0, 1⟩
-- Unit test: pelTriple_zero
example (T : PELTriple 𝒜 ℤ ∅ (fun _ : Unit => (1 : ℤ)) 1) [Nontrivial R] (h : T.detCondition) :
    (letI := T.lieFree; letI := T.lieFinite; Module.finrank R (𝒜.lie T.A)) = 0 := by
  let _ := T.lieFree; let _ := T.lieFinite
  exact SatisfiesDetCondition.rank h 0 (MvPolynomial.isHomogeneous_one _ _) one_ne_zero
-- Unit test: pelTriple_det_picard
example {O : Type*} [Ring O] [StarRing O] {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι]
    {α : ι → O} {detV₀ : MvPolynomial ι R} (T : PELTriple 𝒜 O box α detV₀) [Nontrivial R]
    (hd : detV₀.IsHomogeneous 3) (h0 : detV₀ ≠ 0) (h : T.detCondition) :
    Module.finrank R (𝒜.lie T.A) = 3 := T.relDim 3 hd h0 h

/-- `O_F`-abelian schemes `(A, i)`. -/
structure OFAbelianScheme (R : CommRingCat.{u}) (OF : Type*) [CommRing OF] where
  A : AbelianScheme (Spec R)
  i : OF →+* AbelianScheme.End A

/-- Unitary `O_F`-abelian schemes `(A, i, λ)` with `i(a^c)^∨ ∘ λ = λ ∘ i(a)`. -/
structure UnitaryOFAbelianScheme (OF : Type*) [CommRing OF] [StarRing OF] extends
    OFAbelianScheme R OF where
  pol : QuasiIsogeny A (𝒜.dual A)
  amplePolarization : 𝒜.polarization A
  clearing : ℕ
  clearing_pos : 0 < clearing
  clearingRelation : 𝒜.comp pol.num (𝒜.mulBy (𝒜.dual A) clearing) =
    𝒜.comp (𝒜.polarizationHom amplePolarization) (𝒜.mulBy (𝒜.dual A) pol.den)
  compat : ∀ a : OF, 𝒜.comp pol.num (𝒜.dualHom (i (star a))) = 𝒜.comp (i a) pol.num

namespace OFAbelianScheme
variable {OF : Type*} [CommRing OF]

/-- Signature is equality of determinant polynomial laws, so it survives every base
change, including nilpotent bases. Evaluating only on elements over a finite base ring is
insufficient. The finite family ranges over all order elements; a full Z-basis suffices. -/
def HasSignatureType (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ) :
    Prop := ∀ (ι : Type) [Fintype ι] [DecidableEq ι] (α : ι → OF),
      SatisfiesDetCondition (fun j => 𝒜.lieAct (X.i (α j)))
        (∏ t, (∑ j, MvPolynomial.C (τ t (α j)) * MvPolynomial.X j) ^ r t)

def lieTauPart (X : OFAbelianScheme R OF) (τ : OF →+* R) : Submodule R (𝒜.lie X.A) :=
  ⨅ a : OF, LinearMap.ker (𝒜.lieAct (X.i a) - τ a • LinearMap.id)

end OFAbelianScheme

namespace HasSignatureType
variable {OF : Type*} [CommRing OF]

theorem iff_detCondition (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ)
    {ι : Type} [Fintype ι] [DecidableEq ι] (α : ι → OF)
    (hα : Submodule.span ℤ (Set.range α) = ⊤) :
    OFAbelianScheme.HasSignatureType 𝒜 X τ r ↔ SatisfiesDetCondition (fun j => 𝒜.lieAct (X.i (α j)))
      (∏ s, (∑ j, MvPolynomial.C (τ s (α j)) * MvPolynomial.X j) ^ r s) := sorry

theorem dim (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)] [Module.Finite R (𝒜.lie X.A)]
    {κ : Type*} [Fintype κ] (τ : κ → OF →+* R) (r : κ → ℕ) [Nontrivial R]
    (h : OFAbelianScheme.HasSignatureType 𝒜 X τ r) : Module.finrank R (𝒜.lie X.A) = ∑ s, r s := sorry

/-- Ranks of actual eigensummands, after finite-etale splitting of the order.
The source's unramified CM order and distinct conjugate embeddings are required in the
packet; the prototype supplies the splitting algebra itself. -/
theorem hodge_tau (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] [Nontrivial R] {κ : Type*} [Fintype κ]
    (τ : κ → OF →+* R) (r : κ → ℕ)
    (e : (R ⊗[ℤ] OF) ≃ₐ[R] (κ → R))
    (he : ∀ a t, e (1 ⊗ₜ a) t = τ t a)
    (h : OFAbelianScheme.HasSignatureType 𝒜 X τ r) (t : κ) :
    Module.finrank R (OFAbelianScheme.lieTauPart 𝒜 X (τ t)) = r t := sorry

end HasSignatureType

namespace UnitaryOFAbelianScheme
variable {𝒜} {OF : Type*} [CommRing OF] [StarRing OF]

/-- The tau-eigensummand in homological de Rham cohomology, rather than in Lie. -/
def deRhamTauPart (X : UnitaryOFAbelianScheme 𝒜 OF) (τ : OF →+* R) :
    Submodule R (𝒜.homologicalDeRham X.A) :=
  ⨅ a : OF, LinearMap.ker (𝒜.deRhamAct X.A (X.i a) - τ a • LinearMap.id)

/-- Polarization pairs tau with its conjugate tau^c. The positive clearing relation
normalizes the A4 pairing; its inversion on the base is omitted from this prototype. -/
def pairingTau (X : UnitaryOFAbelianScheme 𝒜 OF) (τ τc : OF →+* R) :
    X.deRhamTauPart τ →ₗ[R] Module.Dual R (X.deRhamTauPart τc) := sorry

/-- Perfectness requires p-principality, not merely a denominator equal to one.
The CM-order splitting and tau^c=conjugate(tau) are omitted hypotheses here and are
stated in the packet, together with invertible clearing factors. -/
theorem pairingTau_perfect (X : UnitaryOFAbelianScheme 𝒜 OF) (p : ℕ) [Fact p.Prime]
    [CharP R p] (τ τc : OF →+* R) (hp : X.pol.IsPrimeTo 𝒜 {p}) :
    Function.Bijective (X.pairingTau τ τc) := sorry

/-- A unitary `O_F`-abelian scheme as a PEL triple (with `* = c`). -/
def toPELTriple (X : UnitaryOFAbelianScheme 𝒜 OF) (box : Set ℕ) (hbox : X.pol.IsPrimeTo 𝒜 box)
    {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → OF) (detV₀ : MvPolynomial ι R)
    [Module.Free R (𝒜.lie X.A)] [Module.Finite R (𝒜.lie X.A)]
    (hdet : SatisfiesDetCondition (fun j => 𝒜.lieAct (X.i (α j))) detV₀) :
    PELTriple 𝒜 OF box α detV₀ := sorry

end UnitaryOFAbelianScheme

-- Unit test: signatureType_cm_elliptic
example {OF : Type*} [CommRing OF]
    (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)] [Module.Finite R (𝒜.lie X.A)]
    [Nontrivial R] (τ : OF →+* R) (hdim : Module.finrank R (𝒜.lie X.A) = 1) :
    OFAbelianScheme.HasSignatureType 𝒜 X (fun _ : Fin 1 => τ) (fun _ => 1) ↔
      ∀ a, 𝒜.lieAct (X.i a) = τ a • LinearMap.id := sorry
-- Unit test: signatureType_conj
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] [Nontrivial R] (τ τ' : OF →+* R)
    (h : OFAbelianScheme.HasSignatureType 𝒜 X (fun _ : Fin 1 => τ) (fun _ => 1))
    (h' : OFAbelianScheme.HasSignatureType 𝒜 X (fun _ : Fin 1 => τ') (fun _ => 1)) : τ = τ' := sorry
-- Unit test: signatureType_iff_det
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] (τ : Fin 2 → OF →+* R) (r : Fin 2 → ℕ) (α : Fin 2 → OF)
    (hα : Submodule.span ℤ (Set.range α) = ⊤) :
    OFAbelianScheme.HasSignatureType 𝒜 X τ r ↔ SatisfiesDetCondition (fun j => 𝒜.lieAct (X.i (α j)))
      (∏ s, (∑ j, MvPolynomial.C (τ s (α j)) * MvPolynomial.X j) ^ r s) :=
  HasSignatureType.iff_detCondition 𝒜 X τ r α hα
-- Unit test: unitary_zero
example {OF : Type*} [CommRing OF] (X : OFAbelianScheme R OF) [Module.Free R (𝒜.lie X.A)]
    [Module.Finite R (𝒜.lie X.A)] [Nontrivial R] (τ : Fin 2 → OF →+* R)
    (h : OFAbelianScheme.HasSignatureType 𝒜 X τ 0) : Module.finrank R (𝒜.lie X.A) = 0 := by
  rw [HasSignatureType.dim 𝒜 X τ 0 h]; simp

/-! ### Tate-module trivializations and level structures (finite level `n`) -/

/-- A geometric point of a scheme, including the actual base morphism. -/
structure GeometricPoint (S : Scheme.{u}) where
  Ω : Type u
  [field : Field Ω]
  [closed : IsAlgClosed Ω]
  point : Spec (.of Ω) ⟶ S
attribute [instance] GeometricPoint.field GeometricPoint.closed

/-- Geometric points in the fibre of the abelian scheme. Its addition comes from the
relative group object, not from an independent abelian group. -/
def AbelianScheme.fibrePoints {S : Scheme.{u}} (A : AbelianScheme S) (s : GeometricPoint S) :=
  {f : Spec (.of s.Ω) ⟶ A.X // f ≫ A.π = s.point}
instance AbelianScheme.fibrePointsGroup {S : Scheme.{u}} (A : AbelianScheme S)
    (s : GeometricPoint S) : AddCommGroup (A.fibrePoints s) := sorry

def AbelianScheme.torsionPoints {S : Scheme.{u}} (A : AbelianScheme S)
    (s : GeometricPoint S) (n : ℕ) : AddSubgroup (A.fibrePoints s) where
  carrier := {x | n • x = 0}
  add_mem' := by intro x y hx hy; simp only [Set.mem_ofPred_eq] at *; simp [hx, hy]
  zero_mem' := by simp
  neg_mem' := by intro x hx; simp only [Set.mem_ofPred_eq] at *; simp [hx]

/-- Imported A3 polarization Weil pairing, with its canonical roots-of-unity target.
It is obtained from the dual Weil pairing by the actual polarization numerator, normalized
by its denominator whenever that denominator and n are invertible on the geometric fibre. -/
def AbelianSchemeSupplier.weilPairing {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {A : AbelianScheme (Spec R)} (pol : QuasiIsogeny A (𝒜.dual A))
    (s : GeometricPoint (Spec R)) (n : ℕ) :
    A.torsionPoints s n → A.torsionPoints s n → rootsOfUnity n s.Ω := sorry

/-- A3's stalk, tied to an abelian scheme, geometric point and polarization.
Only allowed levels have a roots-of-unity trivialization. Finite-etale sheaf descent is
specified in the packet; the declarations below display its stalks and transition maps. -/
structure TorsionSupplier where
  R : CommRingCat.{u}
  supplier : AbelianSchemeSupplier R
  A : AbelianScheme (Spec R)
  box : Set ℕ
  pol : BoxPolarization supplier box A
  point : GeometricPoint (Spec R)
  torsion : ℕ → Type u
  group : ∀ n, AddCommGroup (torsion n)
  identify : ∀ n, letI := group n; torsion n ≃+ A.torsionPoints point n
  weil : ∀ n, torsion n → torsion n → ZMod n
  roots : ∀ n : ℕ, 0 < n → (n : point.Ω) ≠ 0 → rootsOfUnity n point.Ω ≃* Multiplicative (ZMod n)
  weil_eq : ∀ n : ℕ, ∀ (hn : 0 < n) (hchar : (n : point.Ω) ≠ 0) x y,
    Multiplicative.ofAdd (weil n x y) = roots n hn hchar
      (supplier.weilPairing pol.toQuasiIsogeny point n (identify n x) (identify n y))
  reduce : ∀ {m n : ℕ}, m ∣ n → torsion n → torsion m
  reduce_eq : ∀ {m n : ℕ} (hmn : m ∣ n) (_hm : 0 < m) (_hn : 0 < n) x,
    ((identify m (reduce hmn x) : A.torsionPoints point m) : A.fibrePoints point) =
      (n / m) • ((identify n x : A.torsionPoints point n) : A.fibrePoints point)

attribute [instance] TorsionSupplier.group

def TorsionSupplier.Allowed (𝒯 : TorsionSupplier.{u}) (n : ℕ) : Prop :=
  0 < n ∧ (n : 𝒯.point.Ω) ≠ 0 ∧ (∀ p ∈ 𝒯.box, ¬ p ∣ n) ∧
    Nat.Coprime n 𝒯.pol.toQuasiIsogeny.den

section SymplecticIsomSheaf
variable (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L]
  (form : LinearMap.BilinForm ℤ L)

/-- The level-`n` symplectic similitudes `L/nL ≅ A[n]` with multiplier (the stalk of the étale
sheaf of symplectic trivializations at a geometric point, at level `n`). -/
def symplecticIsomFibre (n : ℕ) : Set (((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) :=
  {p | ∀ x y, 𝒯.weil n (p.1 x) (p.1 y) = (p.2 : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) form x y}

/-- Right action of similitudes `(g, r)` of `L/nL`. -/
def symplecticIsomFibre.act {n : ℕ} (g : (ZMod n ⊗[ℤ] L) ≃+ (ZMod n ⊗[ℤ] L)) (r : (ZMod n)ˣ)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) :
    ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ :=
  (g.trans p.1, p.2 * r)

theorem symplecticIsomFibre.torsor (n : ℕ) (p q : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ)
    (_hp : p ∈ symplecticIsomFibre 𝒯 form n) (_hq : q ∈ symplecticIsomFibre 𝒯 form n) :
    ∃ g r, q = symplecticIsomFibre.act 𝒯 g r p := by
  refine ⟨q.1.trans p.1.symm, p.2⁻¹ * q.2, ?_⟩
  ext x <;> simp [symplecticIsomFibre.act]

/-- A Galois (or `π₁`) automorphism of `A[n]` scaling the Weil pairing acts on trivializations. -/
theorem symplecticIsomFibre.galois (n : ℕ) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n) (c : (ZMod n)ˣ)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = (c : ZMod n) * 𝒯.weil n x y)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomFibre 𝒯 form n) :
    (p.1.trans σ, c * p.2) ∈ symplecticIsomFibre 𝒯 form n := by
  intro x y; simp only [AddEquiv.trans_apply, Units.val_mul]; rw [hσ, hp x y]; ring

/-- Reduction from level `n` to level `m ∣ n`, compatible with the supplier's `A[n] → A[m]`. -/
theorem symplecticIsomFibre.reduce {m n : ℕ} (hmn : m ∣ n)
    (hm : 𝒯.Allowed m) (hn : 𝒯.Allowed n)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomFibre 𝒯 form n) :
    ∃ q ∈ symplecticIsomFibre 𝒯 form m, ∀ x : L, q.1 (1 ⊗ₜ x) = 𝒯.reduce hmn (p.1 (1 ⊗ₜ x)) :=
  sorry

/-- The rational variant: `ℚ`-linear similitudes `V ≅ V(A)` with multiplier in `ℚˣ`. -/
def symplecticIsomFibre.rational (V T : Type*) [AddCommGroup V] [Module ℚ V] [AddCommGroup T]
    [Module ℚ T] (formV : LinearMap.BilinForm ℚ V) (formT : LinearMap.BilinForm ℚ T) :
    Set ((V ≃ₗ[ℚ] T) × ℚˣ) :=
  {p | ∀ x y, formT (p.1 x) (p.1 y) = (p.2 : ℚ) * formV x y}

/-- Transport along an isomorphism of torsion groups preserving the pairing (base change). -/
theorem symplecticIsomFibre.baseChange (n : ℕ) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = 𝒯.weil n x y)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomFibre 𝒯 form n) :
    (p.1.trans σ, p.2) ∈ symplecticIsomFibre 𝒯 form n := by
  intro x y; simp only [AddEquiv.trans_apply]; rw [hσ, hp x y]

end SymplecticIsomSheaf

-- Unit test: symplecticIsom_siegel_points
example (𝒯 : TorsionSupplier.{u}) (n : ℕ) [NeZero n]
    (p : ((ZMod n ⊗[ℤ] (Fin 2 ⊕ Fin 2 → ℤ)) ≃+ 𝒯.torsion n) × (ZMod n)ˣ)
    (hp : p ∈ symplecticIsomFibre 𝒯 (Matrix.toBilin' (Matrix.J (Fin 2) ℤ)) n) :
    Nat.card (symplecticIsomFibre 𝒯 (Matrix.toBilin' (Matrix.J (Fin 2) ℤ)) n) =
      Nat.card {gr : ((ZMod n ⊗[ℤ] (Fin 2 ⊕ Fin 2 → ℤ)) ≃+ (ZMod n ⊗[ℤ] (Fin 2 ⊕ Fin 2 → ℤ))) × (ZMod n)ˣ //
        ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) (Matrix.toBilin' (Matrix.J (Fin 2) ℤ))
          (gr.1 x) (gr.1 y) = (gr.2 : ZMod n) *
            LinearMap.BilinForm.baseChange (ZMod n) (Matrix.toBilin' (Matrix.J (Fin 2) ℤ)) x y} :=
  sorry
-- Unit test: symplecticIsom_multiplier
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] (form : LinearMap.BilinForm ℤ L)
    (n : ℕ) (g : (ZMod n ⊗[ℤ] L) ≃+ (ZMod n ⊗[ℤ] L)) (r : (ZMod n)ˣ)
    (hg : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form (g x) (g y) =
      (r : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) form x y)
    (p : ((ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n) × (ZMod n)ˣ) (hp : p ∈ symplecticIsomFibre 𝒯 form n) :
    symplecticIsomFibre.act 𝒯 g r p ∈ symplecticIsomFibre 𝒯 form n ∧
      (symplecticIsomFibre.act 𝒯 g r p).2 = p.2 * r := by
  refine ⟨fun x y => ?_, rfl⟩
  simp only [symplecticIsomFibre.act, AddEquiv.trans_apply, Units.val_mul]
  rw [hp (g x) (g y), hg]; ring
-- Unit test: symplecticIsom_empty
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] (form : LinearMap.BilinForm ℤ L)
    (n : ℕ) (hform : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form x y = 0)
    (hweil : ∃ a b, 𝒯.weil n a b ≠ 0) : symplecticIsomFibre 𝒯 form n = ∅ := sorry
-- Unit test: symplecticIsom_zero
example (𝒯 : TorsionSupplier.{u}) (n : ℕ) [NeZero n] [Subsingleton (𝒯.torsion n)]
    (form : LinearMap.BilinForm ℤ (Fin 0 → ℤ)) :
    Nat.card (symplecticIsomFibre 𝒯 form n) = Nat.totient n := sorry

/-- A principal level-`n` structure `(α_n, ν_n)`, liftable to every level `nm`. -/
structure PrincipalLevelFibre (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L]
    (form : LinearMap.BilinForm ℤ L) (n : ℕ) where
  α : (ZMod n ⊗[ℤ] L) ≃+ 𝒯.torsion n
  ν : (ZMod n)ˣ
  symplectic : (α, ν) ∈ symplecticIsomFibre 𝒯 form n

namespace PrincipalLevelFibre
variable {𝒯 : TorsionSupplier.{u}} {L : Type*} [AddCommGroup L]
  {form : LinearMap.BilinForm ℤ L} {n : ℕ}

/-- Liftability: for every `m` there is a level-`nm` structure reducing to `α` (the finite-level
form of lifting to `L ⊗ Ẑ^□ ≅ T^□A`). -/
def liftable (P : PrincipalLevelFibre 𝒯 form n) : Prop :=
  𝒯.Allowed n ∧ ∀ m : ℕ, 𝒯.Allowed (n * m) → ∃ Q : PrincipalLevelFibre 𝒯 form (n * m),
    (∀ x : L, 𝒯.reduce (Dvd.intro m rfl) (Q.α (1 ⊗ₜ x)) = P.α (1 ⊗ₜ x)) ∧
      (ZMod.castHom (Dvd.intro m rfl) (ZMod n)) Q.ν = (P.ν : ZMod n)

/-- A level structure forces `ker λ ≅ (L^#/L) ⊗ Ẑ^□`; at level `n`: the radical of the `λ`-Weil
pairing on `A[n]` (that is, `(ker λ)[n]`) matches the radical of the form on `L/nL`. -/
theorem ker_polarization (P : PrincipalLevelFibre 𝒯 form n) :
    Nat.card {x : 𝒯.torsion n // ∀ y, 𝒯.weil n x y = 0} =
      Nat.card {x : ZMod n ⊗[ℤ] L // ∀ y, LinearMap.BilinForm.baseChange (ZMod n) form x y = 0} :=
  sorry

/-- Base change: transport along a pairing-preserving isomorphism. -/
def pullback (P : PrincipalLevelFibre 𝒯 form n) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = 𝒯.weil n x y) : PrincipalLevelFibre 𝒯 form n :=
  ⟨P.α.trans σ, P.ν, symplecticIsomFibre.baseChange 𝒯 form n σ hσ _ P.symplectic⟩

/-- Reduction from level `n` to `m ∣ n` (needs the supplier's compatible reduction maps). -/
def reduce (P : PrincipalLevelFibre 𝒯 form n) {m : ℕ} (_hmn : m ∣ n) (_hm : 𝒯.Allowed m) (_hn : 𝒯.Allowed n) : PrincipalLevelFibre 𝒯 form m := sorry

/-- Action of a similitude `(g, r)` of `L/nL`. -/
def act (P : PrincipalLevelFibre 𝒯 form n) (g : (ZMod n ⊗[ℤ] L) ≃+ (ZMod n ⊗[ℤ] L)) (r : (ZMod n)ˣ)
    (hg : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form (g x) (g y) =
      (r : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) form x y) :
    PrincipalLevelFibre 𝒯 form n :=
  ⟨g.trans P.α, P.ν * r, by
    intro x y; simp only [AddEquiv.trans_apply, Units.val_mul]
    rw [P.symplectic (g x) (g y), hg]; ring⟩

/-- The multiplier is data: two structures with the same `α` and different `ν` can coexist when
the reduced form vanishes (e.g. `L = ℓ·L_std`, `n = ℓ`). -/
theorem multiplier_data (P Q : PrincipalLevelFibre 𝒯 form n) (h : P.α = Q.α)
    (hform : ∀ x y, LinearMap.BilinForm.baseChange (ZMod n) form x y = 0) :
    (P.α, Q.ν) ∈ symplecticIsomFibre 𝒯 form n := by
  intro x y; rw [hform, mul_zero, h]; exact (Q.symplectic x y).trans (by rw [hform, mul_zero])

end PrincipalLevelFibre

-- Unit test: principalLevel_siegel_symplectic
example (𝒯 : TorsionSupplier.{u}) (P : PrincipalLevelFibre 𝒯 (Matrix.toBilin' !![0, 1; -1, 0]) 3) :
    𝒯.weil 3 (P.α (1 ⊗ₜ Pi.single 0 1)) (P.α (1 ⊗ₜ Pi.single 1 1)) = P.ν := sorry
-- Unit test: principalLevel_multiplier_scaled
example (𝒯 : TorsionSupplier.{u}) (ℓ : ℕ)
    (P Q : PrincipalLevelFibre 𝒯 ((ℓ : ℤ) • Matrix.toBilin' !![0, 1; -1, 0]) ℓ) (h : P.α = Q.α) :
    (P.α, Q.ν) ∈ symplecticIsomFibre 𝒯 ((ℓ : ℤ) • Matrix.toBilin' !![0, 1; -1, 0]) ℓ :=
  PrincipalLevelFibre.multiplier_data P Q h (fun x y => sorry)
-- Unit test: principalLevel_n_one
example (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L] (form : LinearMap.BilinForm ℤ L)
    (P Q : PrincipalLevelFibre 𝒯 form 1) : P.ν = Q.ν := Subsingleton.elim _ _
-- Unit test: principalLevel_zero
example (𝒯 : TorsionSupplier.{u}) (n : ℕ) [NeZero n] [Subsingleton (𝒯.torsion n)]
    (form : LinearMap.BilinForm ℤ (Fin 0 → ℤ)) :
    Nat.card (PrincipalLevelFibre 𝒯 form n) = Nat.totient n := sorry

/-- An integral level-`H` structure at level `n`: an `H_n`-orbit of principal level structures. -/
structure IntegralLevelFibre (𝒯 : TorsionSupplier.{u}) {L : Type*} [AddCommGroup L]
    (form : LinearMap.BilinForm ℤ L) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)) where
  orbit : Set (PrincipalLevelFibre 𝒯 form n)
  rep : PrincipalLevelFibre 𝒯 form n
  rep_mem : rep ∈ orbit
  orbit_eq : ∀ Q, Q ∈ orbit ↔ ∃ h ∈ Hn, (∀ x, Q.α x = rep.α (h.1 x)) ∧ Q.ν = rep.ν * h.2

/-- Actual restricted-product coefficient ring away from the chosen primes, reusing Mathlib's
restricted product and the p-adic integer subrings. This is not a Q-vector-space substitute. -/
abbrev AwayPrime (box : Set ℕ) := {p : ℕ // p.Prime ∧ p ∉ box}
instance awayPrimeFact {box : Set ℕ} (p : AwayPrime box) : Fact p.val.Prime := ⟨p.property.1⟩
def AwayAdeleRing (box : Set ℕ) : Type :=
  RestrictedProduct (fun p : AwayPrime box => ℚ_[p.val])
    (fun p => (PadicInt.subring p.val : Set ℚ_[p.val])) Filter.cofinite
instance awayAdeleRing (box : Set ℕ) : CommRing (AwayAdeleRing box) := by
  unfold AwayAdeleRing; infer_instance
instance awayAdeleTopology (box : Set ℕ) : TopologicalSpace (AwayAdeleRing box) := by
  unfold AwayAdeleRing; infer_instance
/-- The diagonal rational scalar map; finite denominator support is the Mathlib adelic argument. -/
def awayAdeleDiagonal (box : Set ℕ) : ℚ →+* AwayAdeleRing box := sorry
instance awayAdeleAlgebra (box : Set ℕ) : Algebra ℚ (AwayAdeleRing box) :=
  (awayAdeleDiagonal box).toAlgebra
attribute [local irreducible] AwayAdeleRing

abbrev AwayIntegralRing (box : Set ℕ) := ∀ p : AwayPrime box, ℤ_[p.val]

/-- H-orbits of adelic similitudes, retaining the multiplier and the coefficient ring.
O-linearity and monodromy invariance are imposed on the attached geometric Tate local system. -/
structure RationalLevel (C : Type*) [CommRing C] (V T : Type*)
    [AddCommMonoid V] [Module C V] [AddCommMonoid T] [Module C T]
    (formV : LinearMap.BilinForm C V) (formT : LinearMap.BilinForm C T)
    (H : Subgroup ((V ≃ₗ[C] V) × Cˣ)) where
  orbit : Set ((V ≃ₗ[C] T) × Cˣ)
  isOrbit : ∃ p₀ ∈ orbit, ∀ p, p ∈ orbit ↔ ∃ h ∈ H, p = (h.1.trans p₀.1, h.2 * p₀.2)
  similitude : ∀ p ∈ orbit, ∀ x y, formT (p.1 x) (p.1 y) = p.2 * formV x y

namespace IntegralLevelFibre
variable {𝒯 : TorsionSupplier.{u}} {L : Type*} [AddCommGroup L]
  {form : LinearMap.BilinForm ℤ L} {n : ℕ}
  {Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)}

/-- For `H = U(n)` (trivial `H_n`), integral level structures are principal level structures. -/
def ofPrincipal (P : PrincipalLevelFibre 𝒯 form n) : IntegralLevelFibre 𝒯 form n ⊥ :=
  ⟨{P}, P, rfl, sorry⟩

/-- Base change. -/
def pullback (I : IntegralLevelFibre 𝒯 form n Hn) (σ : 𝒯.torsion n ≃+ 𝒯.torsion n)
    (hσ : ∀ x y, 𝒯.weil n (σ x) (σ y) = 𝒯.weil n x y) : IntegralLevelFibre 𝒯 form n Hn :=
  ⟨(fun P => P.pullback σ hσ) '' I.orbit, I.rep.pullback σ hσ, ⟨I.rep, I.rep_mem, rfl⟩, sorry⟩

/-- Level change `H'_n ≤ H_n`: the `H_n`-saturation of the representative's orbit. -/
def changeLevel {Hn' : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)}
    (_h : Hn' ≤ Hn) (I : IntegralLevelFibre 𝒯 form n Hn') : IntegralLevelFibre 𝒯 form n Hn where
  orbit := {Q | ∃ h ∈ Hn, (∀ x, Q.α x = I.rep.α (h.1 x)) ∧ Q.ν = I.rep.ν * h.2}
  rep := I.rep
  rep_mem := ⟨1, Hn.one_mem, fun _ => rfl, by simp⟩
  orbit_eq := fun _ => Iff.rfl

end IntegralLevelFibre

namespace RationalLevel
variable {C : Type*} [CommRing C] {V T : Type*} [AddCommMonoid V] [Module C V]
  [AddCommMonoid T] [Module C T] {formV : LinearMap.BilinForm C V} {formT : LinearMap.BilinForm C T}
def changeLevel {H' H : Subgroup ((V ≃ₗ[C] V) × Cˣ)} (_h : H' ≤ H)
    (_Rl : RationalLevel C V T formV formT H') : RationalLevel C V T formV formT H := sorry

def basepointIndep {H : Subgroup ((V ≃ₗ[C] V) × Cˣ)} {T' : Type*}
    [AddCommMonoid T'] [Module C T'] {formT' : LinearMap.BilinForm C T'}
    (_Rl : RationalLevel C V T formV formT H) (e : T ≃ₗ[C] T')
    (_he : ∀ x y, formT' (e x) (e y) = formT x y) : RationalLevel C V T' formV formT' H := sorry
end RationalLevel

/-! ### The moduli problems -/

section ModuliProblem
variable (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (O : Type*) [Ring O] [StarRing O]
  (box : Set ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι] (α : ι → O)
  (detV₀ : ∀ R : CommRingCat.{u}, MvPolynomial ι R) {L : Type*} [AddCommGroup L]
  (form : LinearMap.BilinForm ℤ L) (n : ℕ)
  (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ))

/-- Objects of `M_H` over affine bases: `(A, λ, i, α_H)` over `Spec R` (level data at a geometric
point through a torsion supplier). -/
structure PELModuli.moduliProblemAffine where
  R : CommRingCat.{u}
  triple : PELTriple (𝒜 R) O box α (detV₀ R)
  det : triple.detCondition
  torsion : TorsionSupplier.{u}
  torsionRing : torsion.R = R
  torsionSupplier : HEq torsion.supplier (𝒜 R)
  torsionAbelian : HEq torsion.A triple.A
  torsionPolarization : HEq torsion.pol triple.pol
  level : IntegralLevelFibre torsion form n Hn
  liftable : level.rep.liftable

namespace PELModuli.moduliProblemAffine

/-- Isomorphisms over a ring map (the fibred-category structure; data supplied with A1 base
change). -/
instance : Category.{u} (PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn) := sorry

/-- The projection to affine schemes. -/
def proj : PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn ⥤ CommRingCat.{u}ᵒᵖ := sorry

theorem obj (x : PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn) :
    ∃ (T : PELTriple (𝒜 x.R) O box α (detV₀ x.R)), T = x.triple ∧ T.detCondition :=
  ⟨x.triple, rfl, x.det⟩

theorem isFibered : (proj 𝒜 O box α detV₀ form n Hn).IsFibered := sorry

/-- `M_n = M_{U(n)}`: principal level `n` is level `H_n = 1`. -/
theorem principal (𝒯 : TorsionSupplier.{u}) (P : PrincipalLevelFibre 𝒯 form n) :
    (IntegralLevelFibre.ofPrincipal P).orbit = {P} := rfl

/-- The presheaf of isomorphism classes `R ↦ M_H(R)/≅` (not a sheaf in general). -/
def isoClasses (R : CommRingCat.{u}) : Type _ :=
  Quot fun (x y : {x : PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn // x.R = R}) =>
    Nonempty (x.1 ≅ y.1)

/-- Level change `M_{H'} → M_H` for `H'_n ≤ H_n` (orbits are enlarged). -/
def changeLevel {Hn' : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)}
    (_h : Hn' ≤ Hn) :
    PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn' →
      PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn :=
  fun x => { x with level := x.level.changeLevel _h, liftable := x.liftable }

/-- For the Siegel datum (`O = ℤ`, `α = 1`, `detV₀ = X^g`) objects are polarized abelian schemes
of relative dimension `g` with level. -/
theorem siegel (g : ℕ) (x : PELModuli.moduliProblemAffine 𝒜 ℤ box (fun _ : Unit => (1 : ℤ))
    (fun _ => MvPolynomial.X () ^ g) form n Hn) [Nontrivial x.R] :
    (letI := x.triple.lieFree; letI := x.triple.lieFinite;
      Module.finrank x.R ((𝒜 x.R).lie x.triple.A)) = g := by
  sorry

/-- `Aut(A, λ, i, α_H)`. -/
def aut (x : PELModuli.moduliProblemAffine 𝒜 O box α detV₀ form n Hn) : Type _ := x ≅ x

end PELModuli.moduliProblemAffine

end ModuliProblem

-- Unit test: moduliProblem_siegel_g1
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (box : Set ℕ) {L : Type*}
    [AddCommGroup L] (form : LinearMap.BilinForm ℤ L) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ))
    (x : PELModuli.moduliProblemAffine 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (fun _ => MvPolynomial.X () ^ 1)
      form n Hn) [Nontrivial x.R] :
    (letI := x.triple.lieFree; letI := x.triple.lieFinite;
      Module.finrank x.R ((𝒜 x.R).lie x.triple.A)) = 1 :=
  PELModuli.moduliProblemAffine.siegel 𝒜 box form n Hn 1 x
-- Unit test: moduliProblem_isoClasses_not_sheaf
example : ∃ E E' : WeierstrassCurve ℚ, E.Δ ≠ 0 ∧ E.c₄ ^ 3 * E'.Δ = E'.c₄ ^ 3 * E.Δ ∧
    (¬ ∃ C : WeierstrassCurve.VariableChange ℚ, C • E = E') ∧
    ∃ C : WeierstrassCurve.VariableChange ℂ,
      C • E.map (algebraMap ℚ ℂ) = E'.map (algebraMap ℚ ℂ) := sorry
-- Unit test: moduliProblem_zero
example (𝒜 : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R) (box : Set ℕ) (n : ℕ)
    (Hn : Subgroup (((ZMod n ⊗[ℤ] (Fin 0 → ℤ)) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] (Fin 0 → ℤ))) × (ZMod n)ˣ))
    (x : PELModuli.moduliProblemAffine 𝒜 ℤ box (fun _ : Unit => (1 : ℤ)) (fun _ => 1)
      (0 : LinearMap.BilinForm ℤ (Fin 0 → ℤ)) n Hn) [Nontrivial x.R] :
    (letI := x.triple.lieFree; letI := x.triple.lieFinite;
      Module.finrank x.R ((𝒜 x.R).lie x.triple.A)) = 0 := sorry
-- Unit test: moduliProblem_det_matters
example : ¬ SatisfiesDetCondition (M := Fin 3 → ℂ) (ι := Fin 2)
    (fun i => LinearMap.pi fun k =>
      (![![1, Complex.I], ![1, -Complex.I], ![1, -Complex.I]] k i) • LinearMap.proj k)
    (∏ k : Fin 3, ∑ i, MvPolynomial.C (![![1, Complex.I], ![1, Complex.I], ![1, -Complex.I]] k i) *
      MvPolynomial.X i) := sorry

/-- A morphism of integral PEL data `(O', L') → (O, L)`: a `*`-homomorphism and an isometric
`O'`-linear identification. -/
structure PELDatum.Hom (O O' : Type*) [Ring O] [StarRing O] [Ring O'] [StarRing O']
    {L L' : Type*} [AddCommGroup L] [Module O L] [AddCommGroup L'] [Module O' L']
    (D : IntegralPELDatum O L) (D' : IntegralPELDatum O' L') where
  φ : O' →+* O
  star_φ : ∀ b, φ (star b) = star (φ b)
  e : L' ≃ₗ[ℤ] L
  isometry : ∀ x y, D.form (e x) (e y) = D'.form x y
  orderLinear : ∀ b : O', ∀ x : L', e (b • x) = φ b • e x
  complexLinear : ∀ x : ℝ ⊗[ℤ] L',
    LinearEquiv.baseChange ℤ ℝ L' L e (D'.J x) =
      D.J (LinearEquiv.baseChange ℤ ℝ L' L e x)

namespace PELModuli

/-- The induced morphism on PEL triples: restrict the `O`-structure along `φ`. -/
def mapOfDatum {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O O' : Type*} [Ring O]
    [StarRing O] [Ring O'] [StarRing O'] {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι]
    {α' : ι → O'} {detV₀ : MvPolynomial ι R} (φ : O' →+* O) (hφ : ∀ b, φ (star b) = star (φ b))
    (T : PELTriple 𝒜 O box (fun j => φ (α' j)) detV₀) : PELTriple 𝒜 O' box α' detV₀ :=
  { A := T.A, pol := T.pol, actualPolarization := T.actualPolarization,
    numerator_eq := T.numerator_eq, denominator_eq := T.denominator_eq,
    i := T.i.comp φ, rosati := by sorry,
    lieFree := T.lieFree, lieFinite := T.lieFinite, determinant := T.determinant }

/-- The Siegel morphism: forget `i` entirely (restrict along `ℤ → O`). -/
def toSiegel {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O]
    [StarRing O] {box : Set ℕ} {detV₀ : MvPolynomial Unit R}
    (T : PELTriple 𝒜 O box (fun _ => (1 : O)) detV₀) : PELTriple 𝒜 ℤ box (fun _ => (1 : ℤ)) detV₀ :=
  mapOfDatum (Int.castRingHom O) (fun b => by simp) (by simpa using T)

/-- The fibre of `toSiegel`: the `O`-structures on a fixed polarized abelian scheme. -/
theorem toSiegel_underlying {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O]
    [StarRing O] {box : Set ℕ} {detV₀ : MvPolynomial Unit R}
    (T : PELTriple 𝒜 O box (fun _ => (1 : O)) detV₀) : (toSiegel T).A = T.A := sorry

/-- Products of data give products of moduli problems (data level: products of lattices). -/
def prod {O O' : Type*} [Ring O] [StarRing O] [Ring O'] [StarRing O'] {L L' : Type*}
    [AddCommGroup L] [Module O L] [AddCommGroup L'] [Module O' L'] (D : IntegralPELDatum O L)
    (D' : IntegralPELDatum O' L') : LinearMap.BilinForm ℤ (L × L') :=
  D.form.compl₁₂ (LinearMap.fst ℤ L L') (LinearMap.fst ℤ L L') +
    D'.form.compl₁₂ (LinearMap.snd ℤ L L') (LinearMap.snd ℤ L L')

end PELModuli

-- Unit test: mapOfDatum_affine_id
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → O} {detV₀ : MvPolynomial ι R}
    (T : PELTriple 𝒜 O box (fun j => (RingHom.id O) (α j)) detV₀) :
    (PELModuli.mapOfDatum (RingHom.id O) (fun _ => rfl) T).A = T.A := rfl
-- Affine helper: genus-one dimension after forgetting the order.
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} [Nontrivial R] (T : PELTriple 𝒜 O box (fun _ => (1 : O)) (MvPolynomial.X () ^ 1))
    (h : (PELModuli.toSiegel T).detCondition) :
    (letI := (PELModuli.toSiegel T).lieFree; letI := (PELModuli.toSiegel T).lieFinite;
      Module.finrank R (𝒜.lie (PELModuli.toSiegel T).A)) = 1 :=
  PELTriple.relDim _ 1 (MvPolynomial.isHomogeneous_X_pow _ _) (by rw [pow_one]; exact MvPolynomial.X_ne_zero _) h
-- Affine helper: preserving the underlying abelian object.
example {R : CommRingCat.{u}} {𝒜 : AbelianSchemeSupplier R} {O : Type*} [Ring O] [StarRing O]
    {box : Set ℕ} {detV₀ : MvPolynomial Unit R} (T T' : PELTriple 𝒜 O box (fun _ => (1 : O)) detV₀)
    (hA : T.A = T'.A) : (PELModuli.toSiegel T).A = (PELModuli.toSiegel T').A := by
  rw [PELModuli.toSiegel_underlying, PELModuli.toSiegel_underlying, hA]

/-! ### The fixed moduli input and relative families

These interfaces import ordinary algebraic spaces from SchemeAndStackFoundations SF.1
and ordinary stacks from DiamondsAndVStacks D0, as agreed by RS-27. The Family type is the fppf-glued relative PEL object of M1: its affine presentation is
the linked moduliProblem above. Missing geometric supplier conditions are omitted in prototypes
and listed in the packet; no predicate is admitted as a replacement for those conditions. -/

structure ModuliParameters where
  R₀ : CommRingCat.{u}
  supplier : ∀ R : CommRingCat.{u}, AbelianSchemeSupplier R
  O : Type u
  [orderRing : Ring O]
  [orderStar : StarRing O]
  L : Type u
  [latticeGroup : AddCommGroup L]
  [latticeAction : Module O L]
  datum : IntegralPELDatum O L
  box : Set ℕ
  n : ℕ
  n_pos : 0 < n
  level_primeTo : ∀ p ∈ box, p.Prime ∧ ¬ p ∣ n
  ι : Type u
  [basisIndex : Fintype ι]
  [basisDecidable : DecidableEq ι]
  basis : Module.Basis ι ℤ O
  determinant : MvPolynomial ι R₀
  Hn : Subgroup (((ZMod n ⊗[ℤ] L) ≃ₗ[ZMod n] (ZMod n ⊗[ℤ] L)) × (ZMod n)ˣ)
  Hn_scale : ∀ h ∈ Hn, ∀ x y,
    LinearMap.BilinForm.baseChange (ZMod n) datum.form (h.1 x) (h.1 y) =
      (h.2 : ZMod n) * LinearMap.BilinForm.baseChange (ZMod n) datum.form x y
attribute [instance] ModuliParameters.orderRing ModuliParameters.orderStar
  ModuliParameters.latticeGroup ModuliParameters.latticeAction
  ModuliParameters.basisIndex ModuliParameters.basisDecidable

def ModuliParameters.base (P : ModuliParameters.{u}) : Scheme.{u} := Spec P.R₀

namespace Supplier
def relativeFppfTopology (S : Scheme.{u}) : GrothendieckTopology (Over S) := sorry
end Supplier

namespace PELModuli
/-- Relative families over any base, formed by effective fppf gluing of affine PEL objects.
All objects include their actual abelian scheme, polarization, O-action and invariant level.
This future Type is this roadmap's construction, rather than an independent supplier record. -/
def Family (P : ModuliParameters.{u}) (_S : Over P.base) : Type (u + 1) := sorry
instance familyGroupoid (P : ModuliParameters.{u}) (S : Over P.base) : Groupoid.{u + 1} (Family P S) := sorry

def Family.abelian {P : ModuliParameters.{u}} {S : Over P.base} (_x : Family P S) :
    AbelianScheme S.left := sorry

/-- Relative etale-local compatible level orbits of the actual affine triple. This carrier
is defined by descent of its completed Tate trivialization sheaf. It includes invariant
sections on every connected component, not an arbitrarily chosen point. -/
def AffineIntegralLevel (P : ModuliParameters.{u}) {R : CommRingCat.{u}} {φ : P.R₀ ⟶ R}
    (_ξ : PELTriple (P.supplier R) P.O P.box P.basis
      (MvPolynomial.map φ.hom P.determinant)) : Type (u + 1) := sorry

structure AffineFamily (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R) where
  triple : PELTriple (P.supplier R) P.O P.box P.basis
    (MvPolynomial.map φ.hom P.determinant)
  level : AffineIntegralLevel P (φ := φ) triple

/-- All stalks are taken on this same triple, with its actual polarization. -/
def AffineIntegralLevel.stalk {P : ModuliParameters.{u}} {R : CommRingCat.{u}}
    {φ : P.R₀ ⟶ R} {ξ : PELTriple (P.supplier R) P.O P.box P.basis
      (MvPolynomial.map φ.hom P.determinant)} (_α : AffineIntegralLevel P (φ := φ) ξ)
    (_s : GeometricPoint (Spec R)) : Type (u + 1) := sorry

def Family.affine (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R) :
    Family P (Over.mk (Spec.map φ)) ≃ AffineFamily P R φ := sorry

def Family.pullback {P : ModuliParameters.{u}} {S T : Over P.base} (_f : S ⟶ T) :
    Family P T ⥤ Family P S := sorry

def Family.isoClasses (P : ModuliParameters.{u}) (S : Over P.base) : Type (u + 1) :=
  Quot (fun x y : Family P S => Nonempty (x ≅ y))

def Family.isoClassesMap {P : ModuliParameters.{u}} {S T : Over P.base} (f : S ⟶ T) :
    Family.isoClasses P T → Family.isoClasses P S := sorry

def familyFunctor (P : ModuliParameters.{u}) : (Over P.base)ᵒᵖ ⥤ Type (u + 1) := sorry

def pseudofunctor (P : ModuliParameters.{u}) :
    Pseudofunctor (LocallyDiscrete (Over P.base)ᵒᵖ) Cat.{u + 1, u + 1} := sorry

theorem effectiveDescent (P : ModuliParameters.{u}) :
    (pseudofunctor P).IsStack (Supplier.relativeFppfTopology P.base) := sorry

end PELModuli

namespace Supplier
/-- Ordinary algebraic spaces over a scheme, supplied by RS27SF.1; their functor is the actual
etale sheaf quotient of an etale equivalence relation. -/
def AlgebraicSpaceOver (_S : Scheme.{u}) : Type (u + 1) := sorry

def spaceFunctor {S : Scheme.{u}} (_X : AlgebraicSpaceOver S) :
    (Over S)ᵒᵖ ⥤ Type (u + 1) := sorry

def spaceAtlas {S : Scheme.{u}} (_X : AlgebraicSpaceOver S) : Over S := sorry

/-- The actual relative differentials of the algebraic space on a test scheme, and the
Hodge tensors on the pulled-back family. The base-change maps are A4/RS27SF.1's ones. -/
def cotangent {S : Scheme.{u}} (_X : AlgebraicSpaceOver S) (R : CommRingCat.{u}) :
    ModuleCat.{u} R := sorry

def hodgeSymmetricSquare {P : ModuliParameters.{u}} (_X : AlgebraicSpaceOver P.base)
    (R : CommRingCat.{u}) : ModuleCat.{u} R := sorry

end Supplier

namespace Supplier
/-- A3's localization of the actual endomorphism ring by integers prime to box. Elements
are endomorphisms divided by such integers, modulo clearing denominators. -/
def localizedEnd {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    (_A : AbelianScheme (Spec R)) (_box : Set ℕ) : Type u := sorry
instance localizedEndRing {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    (A : AbelianScheme (Spec R)) (box : Set ℕ) : Ring (localizedEnd 𝒜 A box) := sorry
def lieLocalizedAction {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    (A : AbelianScheme (Spec R)) (box : Set ℕ) :
    localizedEnd 𝒜 A box →+* Module.End R (𝒜.lie A) := sorry

/-- Actual rational etale H1 at the geometric point, formed from the inverse torsion limits
and the restricted product away from box. The integral module is the product of the limits,
not the image of an integral lattice under Q tensoring. -/
def adelicTate {R : CommRingCat.{u}} (_A : AbelianScheme (Spec R))
    (_s : GeometricPoint (Spec R)) (box : Set ℕ) : ModuleCat.{u} (AwayAdeleRing box) := sorry
def integralTate {R : CommRingCat.{u}} (A : AbelianScheme (Spec R))
    (s : GeometricPoint (Spec R)) (box : Set ℕ) :
    Submodule ℤ (adelicTate A s box) := sorry

def adelicWeil {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {A : AbelianScheme (Spec R)} (box : Set ℕ) (_pol : BoxPolarization 𝒜 box A)
    (s : GeometricPoint (Spec R)) :
    LinearMap.BilinForm (AwayAdeleRing box) (adelicTate A s box) := sorry
end Supplier

namespace PELModuli
variable {B : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B] {V : Type u} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- The ambient adelic level subgroup, with order action and multiplier retained. -/
def adelicLevelGroup (D : RationalPELDatum B V) (box : Set ℕ)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing box))) :
    Subgroup (((AwayAdeleRing box ⊗[ℚ] V) ≃ₗ[AwayAdeleRing box]
      (AwayAdeleRing box ⊗[ℚ] V)) × (AwayAdeleRing box)ˣ) :=
  K.map (PELDatum.similitudeGroup D (AwayAdeleRing box)).subtype

/-- Affine rational PEL object, linked to its actual geometric Tate module. The localized
Rosati law, monodromy invariance on every component, O-linearity and admissible base are
omitted prototype conditions, explicitly imposed in the roadmap. -/
structure RationalAffineFamily (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R) where
  A : AbelianScheme (Spec R)
  pol : BoxPolarization (P.supplier R) P.box A
  action : P.O →+* Supplier.localizedEnd (P.supplier R) A P.box
  lieFree : Module.Free R ((P.supplier R).lie A)
  lieFinite : Module.Finite R ((P.supplier R).lie A)
  determinant : SatisfiesDetCondition
    (fun i => Supplier.lieLocalizedAction (P.supplier R) A P.box (action (P.basis i)))
    (MvPolynomial.map φ.hom P.determinant)
  level : ∀ s : GeometricPoint (Spec R),
    RationalLevel (AwayAdeleRing P.box) (AwayAdeleRing P.box ⊗[ℚ] V)
      (Supplier.adelicTate A s P.box) (D.form.baseChange (AwayAdeleRing P.box))
      (Supplier.adelicWeil (P.supplier R) P.box pol s) (adelicLevelGroup D P.box K)

/-- Localized prime-to-box quasi-isogeny groupoid of rational PEL families. The morphisms
preserve the localized action, positive rational polarization class and invariant level;
their quotient is the clearing-denominators equivalence on QuasiIsogeny. -/
def ratModuliProblem (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (_K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (_S : Over P.base) :
    Type (u + 1) := sorry
instance rationalFamilyGroupoid (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (S : Over P.base) :
    Groupoid.{u + 1} (ratModuliProblem P D K S) := sorry

def ratModuliProblem.affine (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R) :
    ratModuliProblem P D K (Over.mk (Spec.map φ)) ≃ RationalAffineFamily P D K R φ := sorry

def ratModuliProblem.hom {P : ModuliParameters.{u}} {D : RationalPELDatum B V}
    {K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))} {S : Over P.base}
    (x y : ratModuliProblem P D K S) := x ⟶ y

def rationalFamilyFunctor (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (_K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) :
    (Over P.base)ᵒᵖ ⥤ Type (u + 1) := sorry

/-- The characteristic-zero moduli problem uses the full finite adele ring, an actual
Q-action on End^0 and a Q-positive polarization class. Restriction to characteristic-zero
bases and rationalization of P's order are omitted here, not substituted by box=empty. -/
def adelicModuli (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (_K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_S : Over P.base) : Type (u + 1) := sorry
instance adelicFamilyGroupoid (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (S : Over P.base) : Groupoid.{u + 1} (adelicModuli P D K S) := sorry

/-- The comparison functor clears denominators, reconstructs the Tate lattice by a
prime-to-box isogeny, and transports its polarization and level. -/
def integralToRational (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (S : Over P.base) :
    Family P S ⥤ ratModuliProblem P D K S := sorry

def rationalToIntegral (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (S : Over P.base) :
    ratModuliProblem P D K S ⥤ Family P S := sorry

/-- Change the compact-open adelic level on the actual rational moduli functor. -/
def forgetLevel (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K K' : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (_h : K' ≤ K) :
    rationalFamilyFunctor P D K' ⟶ rationalFamilyFunctor P D K := sorry

/-- Actual right Hecke translation with domain at gKg^-1 and codomain at K. -/
def heckeLevel (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (_K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (_g : PELDatum.similitudeGroup D (AwayAdeleRing P.box)) :
    Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)) := sorry

def heckeTranslate (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (g : PELDatum.similitudeGroup D (AwayAdeleRing P.box)) :
    rationalFamilyFunctor P D (heckeLevel P D K g) ⟶ rationalFamilyFunctor P D K := sorry

/-- The moduli correspondence with its common refined level and both functorial maps. -/
def heckeCorrespondence (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (g : PELDatum.similitudeGroup D (AwayAdeleRing P.box)) :
    (rationalFamilyFunctor P D (K ⊓ heckeLevel P D K g) ⟶ rationalFamilyFunctor P D K) ×
      (rationalFamilyFunctor P D (K ⊓ heckeLevel P D K g) ⟶ rationalFamilyFunctor P D K) := sorry
end PELModuli

/-- Lan 1.4.3.3: full faithfulness and essential surjectivity for the actual groupoids.
P,D and K must have the same localized lattice, form, h, determinant and level; these
compatibility conditions are omitted here and stated in the packet. -/
theorem isoIsogenyComparison (P : ModuliParameters.{u})
    {B : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B] [StarRing B]
    {V : Type u} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (S : Over P.base) :
    (PELModuli.integralToRational P D K S).IsEquivalence := sorry

/-- Lan 1.4.3.7 and 1.4.4.1 after the errata: change of localized lattice/order and primes
induces an equivalence of the actual family-class functors on a common good base.
Base equality, localized data identification and transported compact-open levels are omitted. -/
theorem changeOfLatticeAndPrimes (P P' : ModuliParameters.{u}) (e : P.base ≅ P'.base) :
    Nonempty (PELModuli.familyFunctor P ≅
      (Over.map e.hom).op ⋙ PELModuli.familyFunctor P') := sorry

end M1

/-! ## M2. Representability and smoothness at good level -/

section M2

/-- Action of an isomorphism of the actual PEL family on its geometric n-torsion. -/
def AbelianScheme.isoTorsionAction {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Family P S} (_f : ξ ≅ ξ) (s : GeometricPoint S.left) (n : ℕ) :
    ξ.abelian.torsionPoints s n ≃+ ξ.abelian.torsionPoints s n := sorry

/-- Mumford–Serre rigidity (`M2/rigidity`): an automorphism of finite order acting trivially
modulo `n ≥ 3` on a lattice is the identity (the eigenvalue form of Serre's lemma used for
`Aut(A, λ) ↪ Aut(A[n])`). -/
theorem rigidity {N : ℕ} (g : Matrix (Fin N) (Fin N) ℤ) (k : ℕ) (hk : 0 < k) (hg : g ^ k = 1)
    (n : ℕ) (hn : 3 ≤ n) (hmod : ∀ i j, (n : ℤ) ∣ g i j - (1 : Matrix (Fin N) (Fin N) ℤ) i j) :
    g = 1 := sorry

/-- A polarized relative object has a finite automorphism group; at n≥3 prime to the
residue characteristic the restriction to its actual n-torsion is faithful. The geometric
fibre and polarization-preservation hypotheses are omitted here, and explicit in the packet. -/
theorem polarizedAutomorphismRigidity {P : ModuliParameters.{u}} (S : Over P.base)
    (ξ : PELModuli.Family P S) (f : ξ ≅ ξ) (n : ℕ) (hn : 3 ≤ n)
    (s : GeometricPoint S.left) [ConnectedSpace S.left]
    (hchar : (n : s.Ω) ≠ 0)
    (hfix : ∀ x : ξ.abelian.torsionPoints s n,
      AbelianScheme.isoTorsionAction f s n x = x) : f = Iso.refl ξ := sorry

/-- An element of `G(Ẑ^□)` (through a faithful representation over `ℤ_p` at each `p ∉ □`) is
neat if the torsion of the groups generated by its eigenvalues has trivial intersection; here
recorded through the eigenvalues at one prime `p` (the packet intersects over all `p ∉ □`). -/
def eigenvalueGroup {N : ℕ} (p : ℕ) [Fact p.Prime]
    (g : Matrix (Fin N) (Fin N) ℤ_[p]) : Subgroup (AlgebraicClosure ℚ_[p])ˣ :=
  Subgroup.closure {ζ | (g.map (algebraMap ℤ_[p] (AlgebraicClosure ℚ_[p]))).charpoly.IsRoot (ζ : _)}

def IsNeatElement {N : ℕ} (p : ℕ) [Fact p.Prime] (g : Matrix (Fin N) (Fin N) ℤ_[p]) : Prop :=
  ∀ ζ ∈ eigenvalueGroup p g, (∃ k : ℕ, 0 < k ∧ ζ ^ k = 1) → ζ = 1

/-- Lan's adelic definition intersects the torsion groups at every allowed prime.
A common torsion order is one precisely when that intersection is trivial. -/
def IsAdelicallyNeatElement (box : Set ℕ) (N : ℕ)
    (g : ∀ (p : ℕ) [Fact p.Prime], Matrix (Fin N) (Fin N) ℤ_[p]) : Prop :=
  ∀ k : ℕ, 0 < k →
    (∀ (p : ℕ) [Fact p.Prime], p ∉ box →
      ∃ ζ ∈ eigenvalueGroup p (g p), orderOf ζ = k) → k = 1

/-- A subgroup is neat if all its elements are. -/
def IsLocallyNeat {N : ℕ} (p : ℕ) [Fact p.Prime] (H : Subgroup (GL (Fin N) ℤ_[p])) : Prop :=
  ∀ g ∈ H, IsNeatElement p (g : Matrix (Fin N) (Fin N) ℤ_[p])

namespace IsLocallyNeat
variable {N : ℕ} {p : ℕ} [Fact p.Prime]

theorem mono {H H' : Subgroup (GL (Fin N) ℤ_[p])} (h : H' ≤ H) (hH : IsLocallyNeat p H) : IsLocallyNeat p H' :=
  fun g hg => hH g (h hg)

theorem conj {H : Subgroup (GL (Fin N) ℤ_[p])} (hH : IsLocallyNeat p H) (c : GL (Fin N) ℤ_[p]) :
    IsLocallyNeat p (H.map (MulAut.conj c).toMonoidHom) := sorry

theorem basis_indep {H : Subgroup (GL (Fin N) ℤ_[p])} (hH : IsLocallyNeat p H) (P : GL (Fin N) ℤ_[p]) :
    IsLocallyNeat p (H.map (MulAut.conj P).toMonoidHom) := conj hH P

theorem shimuraData {H : Subgroup (GL (Fin N) ℤ_[p])} (hH : IsLocallyNeat p H) :
    ∀ g ∈ H, IsNeatElement p (g : Matrix (Fin N) (Fin N) ℤ_[p]) := hH

end IsLocallyNeat

/-- Local principal congruence neatness at level p^k≥3; Lan's adelic U(n) consequence
uses the torsion-group intersection rather than requiring every local component to be neat. -/
theorem isLocallyNeat_principalCongruence {N : ℕ} (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 3 ≤ p ^ k)
    (H : Subgroup (GL (Fin N) ℤ_[p]))
    (hH : ∀ g ∈ H, ∀ i j, (p : ℤ_[p]) ^ k ∣ (g : Matrix (Fin N) (Fin N) ℤ_[p]) i j -
      (1 : Matrix (Fin N) (Fin N) ℤ_[p]) i j) : IsLocallyNeat p H := sorry

-- Unit test: isNeat_U3
example (N : ℕ) (H : Subgroup (GL (Fin N) ℤ_[3]))
    (hH : ∀ g ∈ H, ∀ i j, (3 : ℤ_[3]) ^ 1 ∣ (g : Matrix (Fin N) (Fin N) ℤ_[3]) i j -
      (1 : Matrix (Fin N) (Fin N) ℤ_[3]) i j) : IsLocallyNeat 3 H :=
  isLocallyNeat_principalCongruence 3 1 (by norm_num) H hH
-- Unit test: not_isNeat_minus_one
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ¬ IsNeatElement p (-1 : Matrix (Fin 1) (Fin 1) ℤ_[p]) := sorry
-- Unit test: isNeat_mono
example {N : ℕ} (p : ℕ) [Fact p.Prime] (H H' : Subgroup (GL (Fin N) ℤ_[p])) (h : H' ≤ H)
    (hH : IsLocallyNeat p H) : IsLocallyNeat p H' := IsLocallyNeat.mono h hH

/-- Lan Corollary 1.4.1.11: relative PEL automorphisms are trivial at neat level.
The actual compact-open adelic neatness condition is omitted pending the AA.0 representation
interface; the theorem is about family automorphisms, not only matrix elements. -/
theorem noAutomorphismsAtNeatLevel {P : ModuliParameters.{u}} (S : Over P.base)
    (ξ : PELModuli.Family P S) : Subsingleton (ξ ≅ ξ) := sorry

/-- The review's counterexample checks the group generated by eigenvalues. -/
-- Unit test: not_isNeat_generated_ratio
example :
    ¬ IsNeatElement 3 (Matrix.diagonal ![(2 : ℤ_[3]), -2]) := sorry

namespace PELModuli
/-- An algebraic-space representation of the actual PEL isomorphism-class functor.
Neatness and all good-prime conditions are hypotheses of the existence theorem. -/
structure SpaceRepresentative (P : ModuliParameters.{u}) where
  space : Supplier.AlgebraicSpaceOver P.base
  representation : Supplier.spaceFunctor space ≅ familyFunctor P

/-- The fppf family on an algebraic space, with pullback to actual scheme families.
This extends A1–A4 from schemes using R09.1's descent, rather than defining another stack. -/
def FamilyOnSpace (P : ModuliParameters.{u}) (_X : Supplier.AlgebraicSpaceOver P.base) :
    Type (u + 1) := sorry

def FamilyOnSpace.pullback {P : ModuliParameters.{u}} {X : Supplier.AlgebraicSpaceOver P.base}
    (_ξ : FamilyOnSpace P X) (S : Over P.base) (_t : (Supplier.spaceFunctor X).obj (.op S)) :
    Family P S := sorry

def representingSpace (P : ModuliParameters.{u}) : SpaceRepresentative P := sorry

/-- The universal PEL family lives on the representing algebraic space. -/
def universal (P : ModuliParameters.{u}) : FamilyOnSpace P (representingSpace P).space := sorry

def classify {P : ModuliParameters.{u}} {S : Over P.base} (_ξ : Family P S) :
    (Supplier.spaceFunctor (representingSpace P).space).obj (.op S) := sorry

/-- Classification includes the base point and an isomorphism with its pullback. -/
theorem classify_universal {P : ModuliParameters.{u}} {S : Over P.base} (ξ : Family P S) :
    Nonempty (ξ ≅ (universal P).pullback S (classify ξ)) := sorry

theorem classify_unique {P : ModuliParameters.{u}} {S : Over P.base} (ξ : Family P S)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op S))
    (h : Nonempty (ξ ≅ (universal P).pullback S t)) : classify ξ = t := sorry

theorem universal_baseChange {P : ModuliParameters.{u}} {S T : Over P.base} (f : S ⟶ T)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op T)) :
    Nonempty ((Family.pullback f).obj ((universal P).pullback T t) ≅
      (universal P).pullback S ((Supplier.spaceFunctor (representingSpace P).space).map f.op t)) := sorry

def universalAffine (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op (Over.mk (Spec.map φ)))) :
    AffineFamily P R φ := Family.affine P R φ ((universal P).pullback _ t)

theorem universal_relDim (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op (Over.mk (Spec.map φ))))
    [Nontrivial R] (d : ℕ) (hd : (MvPolynomial.map φ.hom P.determinant).IsHomogeneous d)
    (h0 : MvPolynomial.map φ.hom P.determinant ≠ 0) :
    let T := (universalAffine P R φ t).triple
    letI := T.lieFree; letI := T.lieFinite
    Module.finrank R ((P.supplier R).lie T.A) = d := sorry

theorem universal_lie (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op (Over.mk (Spec.map φ)))) :
    (universalAffine P R φ t).triple.detCondition := sorry

/-- The actual pulled-back abelian scheme, used by the Hodge and Hecke interfaces. -/
def universal_underlying (P : ModuliParameters.{u}) (S : Over P.base)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op S)) : AbelianScheme S.left :=
  ((universal P).pullback S t).abelian

theorem universal_siegel_dimension (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj (.op (Over.mk (Spec.map φ))))
    [Nontrivial R] (g : ℕ) (hd : (MvPolynomial.map φ.hom P.determinant).IsHomogeneous g)
    (h0 : MvPolynomial.map φ.hom P.determinant ≠ 0) :
    let T := (universalAffine P R φ t).triple
    letI := T.lieFree; letI := T.lieFinite
    Module.finrank R ((P.supplier R).lie T.A) = g := sorry

/-- Relative Isom functor, represented over the same test base. Naturalities in further
base change are part of the R09.2 representer; displayed here on every test scheme. -/
structure IsomRepresentative {P : ModuliParameters.{u}} (S : Over P.base) (ξ η : Family P S) where
  I : Over S.left
  points : ∀ (T : Over P.base) (f : T ⟶ S),
    {g : T.left ⟶ I.left // g ≫ I.hom = f.left} ≃
      ((Family.pullback f).obj ξ ≅ (Family.pullback f).obj η)

end PELModuli

/-- Lan §2.3.3, thesis pp.265–266: the actual relative Isom functor is finite unramified.
The finite-presentation hypotheses and level-invariance comparison are omitted from this
prototype and stated in the packet. -/
theorem isomScheme {P : ModuliParameters.{u}} (S : Over P.base) (ξ η : PELModuli.Family P S) :
    ∃ I : PELModuli.IsomRepresentative S ξ η, IsFinite I.I.hom ∧ FormallyUnramified I.I.hom := sorry

namespace PELModuli
/-- Artinian local tests with a specified residue field and good-base map. -/
structure ArtinTest (P : ModuliParameters.{u}) (k : Type u) [Field k] (φ₀ : P.R₀ →+* k) where
  R : CommRingCat.{u}
  [localRing : IsLocalRing R]
  [artinian : IsArtinianRing R]
  residue : R →+* k
  residue_surjective : Function.Surjective residue
  base : P.R₀ →+* R
  compatible : residue.comp base = φ₀
attribute [instance] ArtinTest.localRing ArtinTest.artinian

def ArtinTest.specialMap {P : ModuliParameters.{u}} {k : Type u} [Field k]
    {φ₀ : P.R₀ →+* k} (A : ArtinTest P k φ₀) :
    Over.mk (Spec.map (CommRingCat.ofHom φ₀)) ⟶
      Over.mk (Spec.map (CommRingCat.ofHom A.base)) := sorry

def residueTest {P : ModuliParameters.{u}} {k : Type u} [Field k]
    (φ₀ : P.R₀ →+* k) : Over P.base := Over.mk (Spec.map (CommRingCat.ofHom φ₀))
def ArtinTest.test {P : ModuliParameters.{u}} {k : Type u} [Field k]
    {φ₀ : P.R₀ →+* k} (A : ArtinTest P k φ₀) : Over P.base :=
  Over.mk (Spec.map (CommRingCat.ofHom A.base))

def ArtinTest.specialMap' {P : ModuliParameters.{u}} {k : Type u} [Field k]
    {φ₀ : P.R₀ →+* k} (A : ArtinTest P k φ₀) : residueTest φ₀ ⟶ A.test := sorry

/-- Marked lifts of the actual residue-field PEL object. -/
structure MarkedDeformation {P : ModuliParameters.{u}} {k : Type u} [Field k]
    {φ₀ : P.R₀ →+* k}
    (ξ₀ : Family P (residueTest φ₀)) (A : ArtinTest P k φ₀) where
  lift : Family P A.test
  marking : (Family.pullback A.specialMap').obj lift ≅ ξ₀

/-- Quotient by isomorphisms of lifts that commute with the residue marking. -/
def MarkedDeformation.isoClasses {P : ModuliParameters.{u}} {k : Type u} [Field k]
    {φ₀ : P.R₀ →+* k}
    (ξ₀ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) (A : ArtinTest P k φ₀) :
    Type (u + 1) :=
  Quot (fun x y : MarkedDeformation ξ₀ A => ∃ e : x.lift ≅ y.lift,
    (Family.pullback A.specialMap').mapIso e ≪≫ y.marking = x.marking)

def deformationRing {P : ModuliParameters.{u}} {k : Type u} [Field k] {φ₀ : P.R₀ →+* k}
    (_ξ₀ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) : CommRingCat.{u} := sorry

def deformationBase {P : ModuliParameters.{u}} {k : Type u} [Field k] {φ₀ : P.R₀ →+* k}
    (ξ₀ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) :
    P.R₀ →+* deformationRing ξ₀ := sorry

def deformationResidue {P : ModuliParameters.{u}} {k : Type u} [Field k] {φ₀ : P.R₀ →+* k}
    (ξ₀ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) :
    deformationRing ξ₀ →+* k := sorry

def deformationHom {P : ModuliParameters.{u}} {k : Type u} [Field k] {φ₀ : P.R₀ →+* k}
    (ξ₀ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) (A : ArtinTest P k φ₀) :=
  {f : deformationRing ξ₀ →+* A.R //
    A.residue.comp f = deformationResidue ξ₀ ∧ f.comp (deformationBase ξ₀) = A.base}

def FormalFamily (P : ModuliParameters.{u}) (_R : CommRingCat.{u}) (_φ : P.R₀ ⟶ R)
    (_m : Ideal R) : Type (u + 1) := sorry
instance formalFamilyGroupoid (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (m : Ideal R) : Groupoid.{u + 1} (FormalFamily P R φ m) := sorry

/-- Completion consists of compatible reductions of the abelian scheme, polarization,
order action and level modulo every power of m, with their actual transition isomorphisms. -/
def formalCompletion (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (m : Ideal R) : Family P (Over.mk (Spec.map φ)) ⥤ FormalFamily P R φ m := sorry

end PELModuli

/-- Schlessinger's ring prorepresents the marked PEL deformation functor. Naturality of the
bijections in Artinian local maps and the Schlessinger hypotheses are stated in the packet.
They are not replaced by assuming prorepresentability. -/
theorem deformationProrepresentable {P : ModuliParameters.{u}} {k : Type u} [Field k]
    {φ₀ : P.R₀ →+* k}
    (ξ₀ : PELModuli.Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) :
    ∃ h : IsLocalRing (PELModuli.deformationRing ξ₀),
      letI := h
      IsNoetherianRing (PELModuli.deformationRing ξ₀) ∧
        IsAdicComplete (IsLocalRing.maximalIdeal (PELModuli.deformationRing ξ₀))
          (PELModuli.deformationRing ξ₀) ∧
        ∀ A : PELModuli.ArtinTest P k φ₀,
          Nonempty (PELModuli.deformationHom ξ₀ A ≃ PELModuli.MarkedDeformation.isoClasses ξ₀ A) := sorry

/-- Good-prime deformation ring, with the residue point and base map retained.
Unramified reflex-local coefficients and the prescribed component condition in type D are
omitted hypotheses in this prototype; the packet imposes them. -/
theorem formalSmoothness {P : ModuliParameters.{u}} (p : ℕ) [Fact p.Prime] (hp : p ∈ P.box)
    (k : Type u) [Field k] [CharP k p] [PerfectRing k p] (φ₀ : P.R₀ →+* k)
    (ξ₀ : PELModuli.Family P (Over.mk (Spec.map (CommRingCat.ofHom φ₀)))) :
    ∃ N : ℕ, Nonempty (PELModuli.deformationRing ξ₀ ≃+* MvPowerSeries (Fin N) (WittVector p k)) := sorry

/-- Effectivity algebraizes an entire compatible formal PEL family, including its marking,
polarization, action and level. Proper polarized Grothendieck existence uses A2 and R09.3’s generic descent's input. -/
theorem effectivity (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (m : Ideal R) [IsNoetherianRing R] [IsLocalRing R] [IsAdicComplete m R]
    (_hm : m = IsLocalRing.maximalIdeal R)
    (formal : PELModuli.FormalFamily P R φ m) :
    ∃ ξ : PELModuli.Family P (Over.mk (Spec.map φ)),
      Nonempty ((PELModuli.formalCompletion P R φ m).obj ξ ≅ formal) := sorry

/-- At good primes and neat level, the PEL functor has a smooth separated algebraic-space
representation. Its representing natural isomorphism is part of SpaceRepresentative.
Neatness and the remaining good-base hypotheses are omitted here and stated in the packet. -/
theorem representability (P : ModuliParameters.{u}) :
    ∃ M : PELModuli.SpaceRepresentative P,
      Smooth (Supplier.spaceAtlas M.space).hom ∧
      LocallyOfFiniteType (Supplier.spaceAtlas M.space).hom ∧
      QuasiCompact (Supplier.spaceAtlas M.space).hom ∧
        ∀ (S : Over P.base) (ξ η : PELModuli.Family P S),
          ∃ I : PELModuli.IsomRepresentative S ξ η, IsProper I.I.hom := sorry

/-- Principal/type-D Siegel input constructor from the M0/M1 carriers: O=Z, a fixed positive polarization type,
standard compatible J, good reflex base and neat level. -/
def siegelParameters (g : ℕ) (_d : Fin g → ℕ) (_n : ℕ) : ModuliParameters.{u} := sorry

theorem kodairaSpencerSiegel (g : ℕ) (d : Fin g → ℕ) (n : ℕ)
    (R : CommRingCat.{u}) :
    let P := siegelParameters g d n
    Nonempty (Supplier.hodgeSymmetricSquare (PELModuli.representingSpace P).space R ≅
      Supplier.cotangent (PELModuli.representingSpace P).space R) := sorry

/-- Numerical Siegel dimension is a consequence, kept separate from Kodaira–Spencer. -/
def symmetricMatrices (k : Type*) [Field k] (g : ℕ) : Submodule k (Matrix (Fin g) (Fin g) k) where
  carrier := {M | M.transpose = M}
  add_mem' := by intro a b ha hb; simp only [Set.mem_ofPred_eq] at *; rw [Matrix.transpose_add, ha, hb]
  zero_mem' := by simp
  smul_mem' := by intro c M hM; simp only [Set.mem_ofPred_eq] at *; rw [Matrix.transpose_smul, hM]

theorem symmetricMatrices_dimension (k : Type*) [Field k] (g : ℕ) :
    Module.finrank k (symmetricMatrices k g) = g * (g + 1) / 2 := sorry

/-- Valuative properness of the actual model, after division rules out the toric part and
neat level kills finite inertia. The division hypothesis is imposed on the rational datum
in the packet and omitted here pending the common algebraic-group/space interface. -/
theorem propernessWhenDivision (P : ModuliParameters.{u})
    (R : CommRingCat.{u}) [IsDomain R] [IsDiscreteValuationRing R]
    (K : Type u) [Field K] [Algebra R K] [IsFractionRing R K] (φ : P.R₀ ⟶ R)
    (t : (Supplier.spaceFunctor (PELModuli.representingSpace P).space).obj
      (.op (Over.mk (Spec.map (φ ≫ CommRingCat.ofHom (algebraMap R K)))))) :
    ∃! x : (Supplier.spaceFunctor (PELModuli.representingSpace P).space).obj
      (.op (Over.mk (Spec.map φ))),
      (Supplier.spaceFunctor (PELModuli.representingSpace P).space).map
        (Over.homMk (Spec.map (CommRingCat.ofHom (algebraMap R K))) (by sorry)).op x = t := sorry

/-- Tests of the universal-family contract. -/
-- Unit test: universal_classify_self
example {P : ModuliParameters.{u}} (S : Over P.base)
    (t : (Supplier.spaceFunctor (PELModuli.representingSpace P).space).obj (.op S)) :
    PELModuli.classify ((PELModuli.universal P).pullback S t) = t := sorry

-- Unit test: universal_g1
example (P : ModuliParameters.{u}) (R : CommRingCat.{u})
    (φ : P.R₀ ⟶ R) (t : (Supplier.spaceFunctor (PELModuli.representingSpace P).space).obj
      (.op (Over.mk (Spec.map φ)))) [Nontrivial R]
    (hd : (MvPolynomial.map φ.hom P.determinant).IsHomogeneous 1)
    (h0 : MvPolynomial.map φ.hom P.determinant ≠ 0) :
    let T := (PELModuli.universalAffine P R φ t).triple
    letI := T.lieFree; letI := T.lieFinite
    Module.finrank R ((P.supplier R).lie T.A) = 1 := sorry

-- Unit test: universal_zero
example (P : ModuliParameters.{u}) (R : CommRingCat.{u})
    (φ : P.R₀ ⟶ R) (t : (Supplier.spaceFunctor (PELModuli.representingSpace P).space).obj
      (.op (Over.mk (Spec.map φ)))) [Nontrivial R]
    (hd : (MvPolynomial.map φ.hom P.determinant).IsHomogeneous 0)
    (h0 : MvPolynomial.map φ.hom P.determinant ≠ 0) :
    let T := (PELModuli.universalAffine P R φ t).triple
    letI := T.lieFree; letI := T.lieFinite
    Module.finrank R ((P.supplier R).lie T.A) = 0 := sorry

-- Unit test: universal_nonneat
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    ¬ IsLocallyNeat p (⊤ : Subgroup (GL (Fin 1) ℤ_[p])) := sorry

namespace Supplier
/-- A4's nilpotent PD thickening with p nilpotent; its ring map is not an unrelated lift. -/
def PDThickening (_R : CommRingCat.{u}) : Type (u + 1) := sorry
def PDThickening.ring {R : CommRingCat.{u}} (_q : PDThickening R) : CommRingCat.{u} := sorry
def PDThickening.map {R : CommRingCat.{u}} (q : PDThickening R) : q.ring ⟶ R := sorry

/-- R07.2's covariant Dieudonne crystal of the actual abelian scheme evaluated on q. -/
def unitaryCrystal {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type u}
    [CommRing OF] [StarRing OF] (_X : UnitaryOFAbelianScheme 𝒜 OF) (q : PDThickening R) :
    ModuleCat.{u} q.ring := sorry

def crystalPairing {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type u}
    [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF) (q : PDThickening R) :
    LinearMap.BilinForm q.ring (unitaryCrystal 𝒜 X q) := sorry

def crystalAction {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type u}
    [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF) (q : PDThickening R) :
    OF →+* Module.End q.ring (unitaryCrystal 𝒜 X q) := sorry

/-- The reduced Hodge filtration is the image of the actual injection in homological H1. -/
def crystalReduction {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R) {OF : Type u}
    [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF) (q : PDThickening R) :
    unitaryCrystal 𝒜 X q →+ (𝒜.homologicalDeRham X.A) := sorry
end Supplier

/-- Marked lifts of X over q, with the exact OF-action and quasi-polarization, as in
LTXZZ Proposition 3.4.8. Pullback and marking are the A1/A2 ones. Signature and the
single non-extreme conjugate pair are omitted prototype hypotheses. -/
def unitaryDeformationGroupoid {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {OF : Type u} [CommRing OF] [StarRing OF] (_X : UnitaryOFAbelianScheme 𝒜 OF)
    (_q : Supplier.PDThickening R) : Type (u + 1) := sorry
instance unitaryDeformationCategory {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {OF : Type u} [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF)
    (q : Supplier.PDThickening R) : Groupoid.{u + 1} (unitaryDeformationGroupoid 𝒜 X q) := sorry

/-- Isotropic OF-stable direct-summand lifts in the evaluated crystal. Local freeness,
the prescribed tau ranks and their reduction to the Hodge filtration are omitted here. -/
structure isotropicHodgeLifts {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {OF : Type u} [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF)
    (q : Supplier.PDThickening R) where
  filtration : Submodule q.ring (Supplier.unitaryCrystal 𝒜 X q)
  stable : ∀ a : OF, ∀ x ∈ filtration, Supplier.crystalAction 𝒜 X q a x ∈ filtration
  isotropic : ∀ x ∈ filtration, ∀ y ∈ filtration, Supplier.crystalPairing 𝒜 X q x y = 0

/-- The Hodge-filtration functor of the actual Grothendieck–Messing equivalence. -/
def unitaryHodgeFunctor {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {OF : Type u} [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF)
    (q : Supplier.PDThickening R) :
    unitaryDeformationGroupoid 𝒜 X q ⥤ Discrete (isotropicHodgeLifts 𝒜 X q) := sorry

theorem unitaryDeformation {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {OF : Type u} [CommRing OF] [StarRing OF] (X : UnitaryOFAbelianScheme 𝒜 OF)
    (q : Supplier.PDThickening R) : (unitaryHodgeFunctor 𝒜 X q).IsEquivalence := sorry

/-- LTXZZ Lemma 3.4.12: derive the degree identity from the actual polarized isogeny.
The inert unramified CM prime, varpi-uniformizer and Frobenius/signature compatibility
hypotheses are omitted here and explicit in the packet. The four rho cases are consequences. -/
theorem isogenyKernelDegreeIdentity {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {OF : Type u} [CommRing OF] [StarRing OF] (A B : UnitaryOFAbelianScheme 𝒜 OF)
    (α : A.A.Hom B.A) (β : B.A.Hom A.A) (p : ℕ) [Fact p.Prime] (N ρ dA dB : ℕ)
    (hα : AbelianScheme.IsIsogeny α) (hβ : AbelianScheme.IsIsogeny β)
    (hcomp : 𝒜.comp α β = 𝒜.mulBy A.A p)
    (hpol : 𝒜.comp (𝒜.comp α B.pol.num) (𝒜.dualHom α) =
      𝒜.comp A.pol.num (𝒜.mulBy (𝒜.dual A.A) p))
    (s : Spec R) (hdegα : (QuasiIsogeny.ofIsogeny α hα).numeratorKernelDegree s = p ^ ρ)
    (hdegA : A.pol.numeratorKernelDegree s = p ^ dA) (hdegB : B.pol.numeratorKernelDegree s = p ^ dB)
    (hheight : Module.finrank R (𝒜.homologicalDeRham A.A) = 2 * N) :
    2 * ρ + dB = 2 * N + dA := sorry

/-- Trace field of the actual integral datum after rationalization. Nonfaithful/zero
integral input is handled by its effective image; the semisimple comparison is in M0. -/
def IntegralPELDatum.reflexField {O : Type*} [Ring O] [StarRing O] {L : Type*}
    [AddCommGroup L] [Module O L] (_D : IntegralPELDatum O L) : Subfield ℂ := sorry

namespace PELModuli
/-- A selected place of the actual reflex field of P, with its completion.
The source reflex-field/base compatibility is omitted in this prototype. -/
structure GoodPlace (P : ModuliParameters.{u}) (p : ℕ) [Fact p.Prime] where
  E : Type u
  [fieldE : Field E]
  [numberE : NumberField E]
  embedding : E →ₐ[ℚ] ℂ
  reflex_eq : embedding.fieldRange.toSubfield = P.datum.reflexField
  place : IsDedekindDomain.HeightOneSpectrum (𝓞 E)
  above_p : (p : 𝓞 E) ∈ place.asIdeal
  Ev : Type u
  [fieldEv : Field Ev]
  [algebraEv : Algebra ℚ_[p] Ev]
  completion : Ev ≃+* place.adicCompletion E
  residue : Type u
  [fieldResidue : Field residue]
  [charResidue : CharP residue p]
  residueIdent : residue ≃+* ((𝓞 E) ⧸ place.asIdeal)
  base : P.R₀ →+* residue
attribute [instance] GoodPlace.fieldE GoodPlace.numberE GoodPlace.fieldEv GoodPlace.algebraEv
  GoodPlace.fieldResidue GoodPlace.charResidue

/-- The actual special-fibre model and its ordinary locus, computed from the attached
abelian p-divisible group. These import R07.2/A4, not an arbitrary set with a numeric parameter. -/
def specialFibre (P : ModuliParameters.{u}) (p : ℕ) [Fact p.Prime] (v : GoodPlace P p) : Scheme.{u} := sorry
def ordinaryLocus (P : ModuliParameters.{u}) (p : ℕ) [Fact p.Prime] (v : GoodPlace P p) :
    Set (specialFibre P p v) := sorry
end PELModuli

/-- Wedhorn Theorem 1.6.3: for the chosen good place, nonemptiness, density and
E_v=Q_p are equivalent. Complete splitting of p in E is a stronger sufficient condition.
The classical PEL types, determinant, good unramified maximal-order and nonempty model
hypotheses are omitted here and specified in the packet. -/
theorem wedhornOrdinaryDensity (P : ModuliParameters.{u}) (p : ℕ) [Fact p.Prime]
    (v : PELModuli.GoodPlace P p) :
    ((PELModuli.ordinaryLocus P p v).Nonempty ↔ Nonempty (v.Ev ≃ₐ[ℚ_[p]] ℚ_[p])) ∧
      (Dense (PELModuli.ordinaryLocus P p v) ↔ Nonempty (v.Ev ≃ₐ[ℚ_[p]] ℚ_[p])) := sorry

end M2

/-! ## M3. Complex and generic-fibre comparison -/

section M3
variable {B : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] {V : Type u} [AddCommGroup V] [Module ℚ V]
  [Module B V] [IsScalarTower ℚ B V]

namespace Supplier
/-- SF.2 extension selected for RT-AREA/3: analytic locally C-ringed spaces allowing
nilpotents, with morphisms, open gluing and fibre products. PR196 is an integration contract. -/
def ComplexAnalyticSpace : Type (u + 1) := sorry
instance analyticCategory : Category.{u + 1} ComplexAnalyticSpace.{u} := sorry
def analyticPoints (_X : ComplexAnalyticSpace.{u}) : TopCat.{u} := sorry
def analyticPointsMap {X Y : ComplexAnalyticSpace.{u}} (_f : X ⟶ Y) :
    analyticPoints X → analyticPoints Y := sorry
instance analyticHasPullbacks : Limits.HasPullbacks ComplexAnalyticSpace.{u} := sorry
/-- Scheme representable functor, with ULift to the family-class universe. -/
def schemeFunctor {S : Scheme.{u}} (_M : Over S) : (Over S)ᵒᵖ ⥤ Type (u + 1) := sorry
def analytification : Over (Spec (.of ℂ)) ⥤ ComplexAnalyticSpace.{u} := sorry
end Supplier

namespace PELModuli
/-- The actual local-global kernel in nonabelian Galois H1. -/
abbrev ker1 (D : RationalPELDatum B V) : Type := Supplier.KerOne D.coordinate

/-- Restriction of M1's actual family-class functor to complex schemes. -/
def complexFamilyFunctor (P : ModuliParameters.{0}) (_φ : P.R₀ →+* ℂ) :
    (Over (Spec (.of ℂ)))ᵒᵖ ⥤ Type 1 := sorry

structure ComplexRepresentative (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) where
  model : Over (Spec (.of ℂ))
  represented : Supplier.schemeFunctor model ≅ complexFamilyFunctor P φ

def genericFibre (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) : ComplexRepresentative P φ := sorry

def complexPointsSet (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) : Type 1 :=
  Family.isoClasses P (Over.mk (Spec.map (CommRingCat.ofHom φ)))

/-- Rational diagonal on the actual similitude points, by scalar extension. -/
def rationalDiagonal (D : RationalPELDatum B V) (R : Type*) [CommRing R] [Algebra ℚ R] :
    PELDatum.similitudeGroup D ℚ →* PELDatum.similitudeGroup D R := sorry

def conjugateComplexStructure (D : RationalPELDatum B V) (γ : PELDatum.similitudeGroup D ℚ)
    (J : (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V)) :
    (ℝ ⊗[ℚ] V) →ₗ[ℝ] (ℝ ⊗[ℚ] V) :=
  let e := ((rationalDiagonal D ℝ γ : PELDatum.similitudeGroup D ℝ) :
    ((ℝ ⊗[ℚ] V) ≃ₗ[ℝ] (ℝ ⊗[ℚ] V)) × ℝˣ).1
  e.toLinearMap ∘ₗ J ∘ₗ e.symm.toLinearMap

/-- The full-G double quotient has its actual two-sided equivalence relation. -/
def doubleCoset (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :=
  Quot (fun x y : D.domain × PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) =>
    ∃ γ : PELDatum.similitudeGroup D ℚ, ∃ k : K,
      y.1.val = conjugateComplexStructure D γ x.1.val ∧
        y.2 = rationalDiagonal D _ γ * x.2 * k.val)

/-- The AA.4 twisting construction supplies each locally equivalent rational form, with
its own faithful B-module and PEL datum. This dependent carrier is not a local invariant. -/
def twistedDoubleCoset (D : RationalPELDatum B V) (_i : ker1 D)
    (_K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Type (u + 1) := sorry

def quotientAnalyticSpace (D : RationalPELDatum B V) (_i : ker1 D)
    (_K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Supplier.ComplexAnalyticSpace.{0} := sorry

/-- The relative complex torus family, with Riemann polarization, order and level,
constructed over the arithmetic quotient and descended from the domain's lattice family.
The Riemann form is ε(J) q_g ψ: ε makes it positive on each full-G real component,
and the positive rational q_g normalizes the finite adelic multiplier on the chosen lattice.
Under rational γ these change by sign(c(γ)) and |c(γ)|⁻¹, giving polarization equivariance. -/
def analyticFamily (D : RationalPELDatum B V) (i : ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Over (quotientAnalyticSpace D i K) := sorry

/-- M3 compares the analytic quotient with the analytification of the actual moduli model.
The compatibility between P and D, compact-open neat K and phi is omitted in the prototype. -/
def uniformization (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    quotientAnalyticSpace D i K ⟶ Supplier.analytification.obj (genericFibre P φ).model := sorry

theorem uniformization_openClosed (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Topology.IsOpenEmbedding (Supplier.analyticPointsMap (uniformization P φ D i K)) ∧
      IsClosed (Set.range (Supplier.analyticPointsMap (uniformization P φ D i K))) := sorry

/-- Analytification of the universal abelian family on the actual moduli scheme. -/
def analyticUniversal (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) :
    Over (Supplier.analytification.obj (genericFibre P φ).model) := sorry

theorem uniformization_universal (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty ((Over.pullback (uniformization P φ D i K)).obj (analyticUniversal P φ) ≅
      analyticFamily D i K) := sorry
end PELModuli

/-- Rational skew-Hermitian faithful B-modules, modulo B-linear similarities,
which become similar to D at every rational place, including the real place. -/
def PELModuli.locallyEquivalentForms (_D : RationalPELDatum B V) : Type (u + 1) := sorry

theorem ker1Classification (D : RationalPELDatum B V) :
    Nonempty (PELModuli.locallyEquivalentForms D ≃ PELModuli.ker1 D) ∧
      Finite (PELModuli.ker1 D) := sorry

/-- Type C and type A with even Hermitian rank are the omitted type hypotheses. -/
theorem hassePrincipleCases (D : RationalPELDatum B V) (m n : ℕ)
    (hB : Module.finrank ℚ B = m ^ 2 * Module.finrank ℚ (Subalgebra.center ℚ B))
    (hV : Module.finrank ℚ V = m * n * Module.finrank ℚ (Subalgebra.center ℚ B)) :
    Subsingleton (PELModuli.ker1 D) := sorry

/-- All locally equivalent rational-form pieces, not just one local invariant, occur.
Compatibility of P,D,K and the classical PEL conditions is omitted here. -/
theorem complexPoints (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty (PELModuli.complexPointsSet P φ ≃
      Σ i : PELModuli.ker1 D, PELModuli.twistedDoubleCoset D i K) := sorry

/-- Algebraization yields an actual open-and-closed scheme immersion whose analytification
is the comparison. V2/V3 apply to the effective Hermitian arithmetic quotient; Sh notation requires SV3.
C0 faithful flatness supplies the local comparison; proper GAGA is not an input. -/
theorem algebraizationOfComponents (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    ∃ (Sh : Over (Spec (.of ℂ))) (f : Sh ⟶ (PELModuli.genericFibre P φ).model),
      IsOpenImmersion f.left ∧ IsClosedImmersion f.left ∧
        ∃ e : Supplier.analytification.obj Sh ≅ PELModuli.quotientAnalyticSpace D i K,
          Supplier.analytification.map f = e.hom ≫ PELModuli.uniformization P φ D i K := sorry

/-- Lan, Example-based introduction, §5.1.3, pp.54–56: retain the full possibly disconnected
G comparison. No unsupported replacement by G° or finite pi0-orbit assertion is made. -/
theorem typeDComparison (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty (PELModuli.complexPointsSet P φ ≃
      Σ i : PELModuli.ker1 D, PELModuli.twistedDoubleCoset D i K) := sorry

/-- The hermitian space `Hom^{pol₀,λ}(H₁(A₀), H₁(A))` (`M3/hermitian-hom-space`), over a commutative
ring `A` with involution, for free modules `M₀` (rank one) and `M`. -/
abbrev hermitianHom {A : Type*} [CommRing A] [StarRing A] (M₀ M : Type*) [AddCommGroup M₀] [Module A M₀]
    [AddCommGroup M] [Module A M] : Type _ := M₀ →ₗ[A] M

namespace hermitianHom
variable {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*} [AddCommGroup M₀] [Module A M₀]
  [AddCommGroup M] [Module A M]

/-- The pairing `(x, y) = i₀⁻¹((pol₀*)⁻¹ ∘ y^∨ ∘ λ* ∘ x)`, from the polarization pairings. -/
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

theorem hermitianHom_unfold {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*}
    [AddCommGroup M₀] [Module A M₀] [AddCommGroup M] [Module A M] :
    hermitianHom (A := A) M₀ M = (M₀ →ₗ[A] M) := rfl

-- Unit test: hermitianHom_rank_one
example : Module.finrank ℂ (hermitianHom (A := ℂ) ℂ ℂ) = 1 := sorry
-- Unit test: hermitianHom_scaling
example {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*} [AddCommGroup M₀] [Module A M₀]
    [AddCommGroup M] [Module A M] (h₀ : HermitianSpace A M₀) (h h' : HermitianSpace A M) (c : A)
    (hc : ∀ x y, h'.pairing x y = c * h.pairing x y) (x y : hermitianHom (A := A) M₀ M) :
    hermitianHom.pairing h₀ h' x y = c * hermitianHom.pairing h₀ h x y := sorry
-- Unit test: hermitianHom_not_symmetric_bilinear
example {A : Type*} [CommRing A] [StarRing A] {M₀ M : Type*} [AddCommGroup M₀] [Module A M₀]
    [AddCommGroup M] [Module A M] (h₀ : HermitianSpace A M₀) (h : HermitianSpace A M) (a : A)
    (x y : hermitianHom (A := A) M₀ M) :
    hermitianHom.pairing h₀ h (a • x) y = a * hermitianHom.pairing h₀ h x y ∧
      hermitianHom.pairing h₀ h x (a • y) = star a * hermitianHom.pairing h₀ h x y := sorry
-- Unit test: hermitianHom_zero
example {A : Type*} [CommRing A] [StarRing A] (M₀ : Type*) [AddCommGroup M₀] [Module A M₀] :
    Subsingleton (hermitianHom (A := A) M₀ (Fin 0 → A)) := sorry

namespace Supplier
/-- A4's actual etale homology with coefficients C and its polarization-induced adjoint. -/
def etaleHomology {R : CommRingCat.{u}} (_A : AbelianScheme (Spec R))
    (C : CommRingCat.{u}) : ModuleCat.{u} C := sorry

def polarizedHomPairing {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    (A₀ A : AbelianScheme (Spec R)) (pol₀ : QuasiIsogeny A₀ (𝒜.dual A₀))
    (pol : QuasiIsogeny A (𝒜.dual A)) (C : CommRingCat.{u}) :
    (etaleHomology A₀ C →ₗ[C] etaleHomology A C) →
      (etaleHomology A₀ C →ₗ[C] etaleHomology A C) → C := sorry

/-- D5/V0/V1's analytic quotient of the genus-g Siegel domain by full level. -/
def siegelAnalyticQuotient (_g _n : ℕ) : ComplexAnalyticSpace.{0} := sorry
end Supplier

/-- LTXZZ Construction 3.4.4, p.149: Hom uses the attached actual H1 modules and the
polarization adjoint. Rank-one H1(A0), the unramified integral comparison and the OF-linear
restriction are omitted here. The hermitian convention is linear in the first variable. -/
def hermitianHomOfAbelianSchemes {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    (A₀ A : AbelianScheme (Spec R)) (pol₀ : QuasiIsogeny A₀ (𝒜.dual A₀))
    (pol : QuasiIsogeny A (𝒜.dual A)) (C : CommRingCat.{u}) [StarRing C] :
    HermitianSpace C (Supplier.etaleHomology A₀ C →ₗ[C] Supplier.etaleHomology A C) := sorry

/-- Agreement with the polarization-induced adjoint pairing on the actual H1 modules.
The coefficient algebra is OF tensor the appropriate adelic ring, with CM conjugation;
rank-one source, perfectness and OF-linearity are omitted source hypotheses. -/
theorem hermitianHomOfAbelianSchemes_pairing {R : CommRingCat.{u}}
    (𝒜 : AbelianSchemeSupplier R) (A₀ A : AbelianScheme (Spec R))
    (pol₀ : QuasiIsogeny A₀ (𝒜.dual A₀)) (pol : QuasiIsogeny A (𝒜.dual A))
    (C : CommRingCat.{u}) [StarRing C]
    (x y : Supplier.etaleHomology A₀ C →ₗ[C] Supplier.etaleHomology A C) :
    (hermitianHomOfAbelianSchemes 𝒜 A₀ A pol₀ pol C).pairing x y =
      Supplier.polarizedHomPairing 𝒜 A₀ A pol₀ pol C x y := sorry

/-- All-genus fine Siegel uniformization, retaining multiplier components and the
universal analytic family; D5/V0/V1 supply the domain quotient. The actual coefficient map,
neat n≥3 and positive polarization type are omitted prototype conditions. -/
theorem siegelFineUniformization (g n : ℕ) (d : Fin g → ℕ)
    (φ : (siegelParameters g d n).R₀ →+* ℂ) :
    Nonempty (Supplier.analytification.obj (PELModuli.genericFibre (siegelParameters g d n) φ).model ≅
      Supplier.siegelAnalyticQuotient g n) := sorry

end M3

/-! ## M4. Canonical models and integral level changes -/

section M4
variable {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B] {V : Type} [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

namespace Supplier
/-- V4/V6's canonical model of the AA.4 twist indexed by i. The reflex-field embedding,
classical Shimura conditions and compact-open K are omitted prototype conditions. -/
def canonicalPiece (D : RationalPELDatum B V) (_i : PELModuli.ker1 D)
    (_K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (E : CommRingCat.{0}) : Over (Spec E) := sorry
end Supplier

namespace PELModuli
/-- The descended open-and-closed component of the actual PEL representing scheme. -/
def moduliPiece (P : ModuliParameters.{0}) (_φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (_i : ker1 D)
    (_K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (E : CommRingCat.{0}) : Over (Spec E) := sorry

/-- Base change of the actual complex PEL family by an automorphism of C. -/
def galoisAction (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (_σ : ℂ ≃+* ℂ) : complexPointsSet P φ → complexPointsSet P φ := sorry

/-- Special points: the Mumford–Tate group of the attached polarized rational H1 is a torus.
HodgeStructures H0/H1 and V4 supply the Mumford–Tate construction. -/
def specialPoints (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) :
    Set (complexPointsSet P φ) := sorry

/-- Translation by the reflex norm of the Artin idele on the actual CM level structure.
Artin normalization is V4/V5's; this is not an arbitrary second action. -/
def reciprocityAction (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (_σ : ℂ ≃+* ℂ) : specialPoints P φ → complexPointsSet P φ := sorry

/-- Compatible positive central rational a and adelic beta: beta transforms the polarization
form by a through its central norm, with a unit at the chosen good primes. Kottwitz p.400 supplies the compatibility equation.
The rational a, not merely its integral suborder, is required. -/
structure TwistData (D : RationalPELDatum B V) where
  a : Bˣ
  central : (a : B) ∈ Subalgebra.center ℚ B
  selfAdjoint : star (a : B) = a
  positive : ∀ τ : Subalgebra.center ℚ B →ₐ[ℚ] ℂ,
    0 < (τ ⟨a, central⟩).re
  beta : (IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] Subalgebra.center ℚ B)ˣ

/-- The adelic compatibility equation, level normalization and rationalization agreement of
P and D are omitted here and imposed in the reader, rather than represented by admitted Props. -/
def twistLevel (P : ModuliParameters.{0}) (D : RationalPELDatum B V) :
    Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)) := sorry

def twist (P : ModuliParameters.{0}) (D : RationalPELDatum B V)
    (_t : TwistData D) : rationalFamilyFunctor P D (twistLevel P D) ≅ rationalFamilyFunctor P D (twistLevel P D) := sorry

def identityTwist (D : RationalPELDatum B V) : TwistData D := sorry

theorem twist_trivial (P : ModuliParameters.{0}) (D : RationalPELDatum B V) :
    twist P D (identityTwist D) = Iso.refl _ := sorry

theorem twist_mul (P : ModuliParameters.{0}) (D : RationalPELDatum B V)
    (s t st : TwistData D) (ha : st.a = s.a * t.a) (hbeta : st.beta = s.beta * t.beta) :
    twist P D st = twist P D s ≪≫ twist P D t := sorry

/-- First transport the complex analytic pieces; their reflex-field descent is proved
subsequently by CM reciprocity and density. A class-zero twist preserves a piece; it is the identity only when its a and beta act
trivially. The map on ker1 is the global twisting action supplied by AA.4 Part II. -/
def twistClass (D : RationalPELDatum B V) (_t : TwistData D) : ker1 D → ker1 D := sorry

theorem twist_maps_piece (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (t : TwistData D) (i : ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    : Nonempty (quotientAnalyticSpace D i K ≅
      quotientAnalyticSpace D (twistClass D t i) K) := sorry
end PELModuli

/-- Assume SV3 for the actual Shimura datum (omitted prototype condition).
CM reciprocity on the actual PEL points, Milne 14.12/14.14, pp.125–127.
The chosen automorphism fixes the reflex embedding; that condition is omitted here. -/
theorem cmPointsReciprocity (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (σ : ℂ ≃+* ℂ) (x : PELModuli.specialPoints P φ) :
    PELModuli.galoisAction P φ σ x.val = PELModuli.reciprocityAction P φ σ x := sorry

/-- Each type A/C piece descends and equals its canonical model by CM density and global
reciprocity (Kottwitz §8, p.400). SV3 and the type/reflex compatibility conditions are omitted here;
local triviality in ker1 alone is never the descent argument. -/
theorem canonicalModelIdentification (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (E : CommRingCat.{0}) :
    Nonempty (PELModuli.moduliPiece P φ D i K E ≅ Supplier.canonicalPiece D i K E) := sorry

/-- SV3 and compatibility with actual Shimura data are omitted in this canonical comparison.
V6's canonical level/Hecke map and the descended moduli map agree. These are the maps
constructed from the same level inclusion or admissible PEL-data morphism, not arbitrary maps. -/
def Supplier.canonicalLevelMap (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_hle : K' ≤ K) (E : CommRingCat.{0}) :
    Supplier.canonicalPiece D i K' E ⟶ Supplier.canonicalPiece D i K E := sorry

def PELModuli.descendedLevelMap (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_hle : K' ≤ K) (E : CommRingCat.{0}) :
    PELModuli.moduliPiece P φ D i K' E ⟶ PELModuli.moduliPiece P φ D i K E := sorry

theorem canonicalModelFunctoriality (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (hle : K' ≤ K) (E : CommRingCat.{0}) :
    ∃ (e : PELModuli.moduliPiece P φ D i K E ≅ Supplier.canonicalPiece D i K E)
      (e' : PELModuli.moduliPiece P φ D i K' E ≅ Supplier.canonicalPiece D i K' E),
      PELModuli.descendedLevelMap P φ D i K K' hle E ≫ e.hom =
        e'.hom ≫ Supplier.canonicalLevelMap D i K K' hle E := sorry

/-- Higher-level integral model: relative normalization in the actual generic PEL cover.
Y and f are obtained from the tower above; qcqs relative normalization is already Mathlib. -/
def PELModuli.normalizedModel {Y M : Scheme.{u}} (f : Y ⟶ M)
    [QuasiCompact f] [QuasiSeparated f] : Scheme.{u} := f.normalization

namespace PELModuli
variable {Y M : Scheme.{u}} (f : Y ⟶ M) [QuasiCompact f] [QuasiSeparated f]
def normalizedModel_toGood : normalizedModel f ⟶ M := f.fromNormalization
def normalizedModel_generic : Y ⟶ normalizedModel f := f.toNormalization

theorem normalizedModel_universal {T : Scheme.{u}} (f₁ : Y ⟶ T) (f₂ : T ⟶ M)
    [IsIntegralHom f₂] (h : f = f₁ ≫ f₂) :
    ∃! g : normalizedModel f ⟶ T,
      normalizedModel_generic f ≫ g = f₁ ∧ g ≫ f₂ = normalizedModel_toGood f := by
  refine ⟨f.normalizationDesc f₁ f₂ h, ⟨?_, ?_⟩, ?_⟩
  · exact f.toNormalization_normalizationDesc f₁ f₂ h
  · exact f.normalizationDesc_comp f₁ f₂ h
  · intro g hg
    exact Scheme.Hom.normalization.hom_ext f g _ f₂
      (hg.1.trans (f.toNormalization_normalizationDesc f₁ f₂ h).symm)
      hg.2 (f.normalizationDesc_comp f₁ f₂ h)

def normalizedModel_level {Y' : Scheme.{u}} (f' : Y' ⟶ M)
    [QuasiCompact f'] [QuasiSeparated f'] (g : Y' ⟶ Y) (_hg : g ≫ f = f') :
    normalizedModel f' ⟶ normalizedModel f := sorry

theorem normalizedModel_hecke (σ : Y ≅ Y) (hσ : σ.hom ≫ f = f) :
    ∃ e : normalizedModel f ≅ normalizedModel f,
      normalizedModel_generic f ≫ e.hom = σ.hom ≫ normalizedModel_generic f := sorry
end PELModuli

/-- Finite generic cover of a normal excellent/Nagata good model, componentwise dominant
and flat over a DVR/Dedekind good base. Excellence, dominance and generic-fibre identifications
are omitted hypotheses; unlike integrality, all three conclusions are stated. -/
theorem normalizationFiniteNormalFlat {Y M S : Scheme.{u}} (f : Y ⟶ M) (b : M ⟶ S)
    [QuasiCompact f] [QuasiSeparated f] :
    IsFinite (PELModuli.normalizedModel_toGood f) ∧
      (∀ x : PELModuli.normalizedModel f,
        IsIntegrallyClosed ((PELModuli.normalizedModel f).presheaf.stalk x)) ∧
      Flat (PELModuli.normalizedModel_toGood f ≫ b) := sorry

/-- M4's rank-one CM specialization includes the exact CM signature, p-principal polarization,
rank-one skew-Hermitian lattice and prime-to-p compact-open level. Future constructor from
LTXZZ 3.5.1–3.5.4; agreement of its supplier data is an omitted prototype condition. -/
def cmParameters {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (_Φ : GeneralizedCMType F 1) (_p : ℕ) (_n : ℕ) : ModuliParameters.{u} := sorry

/-- Rank-one CM quasi-isogeny functor T1, on the selected CM-type reflex p-local base.
Objects have the actual OF action, p-principal positive quasi-polarization, signature Phi
and prime-to-p adelic level. Morphisms are prime-to-p quasi-isogenies carrying this data. -/
def cmFamilyFunctor {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) :
    (Over (cmParameters Φ p n).base)ᵒᵖ ⥤ Type (u + 1) := sorry

structure CMRepresentative {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) where
  model : Over (cmParameters Φ p n).base
  represented : Supplier.schemeFunctor model ≅ cmFamilyFunctor Φ p n

def cmModuli1 {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) : CMRepresentative Φ p n := sorry

theorem cmModuli1_represented {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) :
    IsFinite (cmModuli1 Φ p n).model.hom ∧ Etale (cmModuli1 Φ p n).model.hom := sorry

def cmRationalDatum {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    [StarRing F] (_Φ : GeneralizedCMType F 1) : RationalPELDatum F F := sorry

/-- w classifies the rank-one polarized rational H1 form by its actual global torus H1 class. -/
def cmModuli1_w {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    [StarRing F] (Φ : GeneralizedCMType F 1) (p n : ℕ) (φ : (cmParameters Φ p n).R₀ →+* ℂ)
    (_x : (cmFamilyFunctor Φ p n).obj
      (.op (Over.mk (Spec.map (CommRingCat.ofHom φ))))) :
    PELModuli.ker1 (cmRationalDatum Φ) := sorry

/-- The minimal open-and-closed subscheme of T1 containing the prescribed w-fibre on C-points.
The points-to-model bijection is CMRepresentative.represented evaluated at Spec C; its
minimality and reciprocal Galois action are explicit acceptance contracts below. -/
def cmModuli {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) : Over (cmModuli1 Φ p n).model.left := sorry

theorem cmModuli_openClosed {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) :
    IsOpenImmersion (cmModuli Φ p n).hom ∧ IsClosedImmersion (cmModuli Φ p n).hom := sorry

/-- The torus quotient Gamma=T(Af,p)/(T(Z_(p)) Kp), with reciprocity Galois action.
This owner construction is the actual torus attached to Phi, not an arbitrary finite group. -/
def cmGamma {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (_Φ : GeneralizedCMType F 1) (_p _n : ℕ) : Type u := sorry
instance cmGammaGroup {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) : CommGroup (cmGamma Φ p n) := sorry

abbrev torusGroupoid (Γ : Type*) [Group Γ] := SingleObj Γ

/-- Geometric points on the selected CM scheme and their transported adelic torus action. -/
def cmGeometricPoints {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (_Φ : GeneralizedCMType F 1) (_p _n : ℕ) : Type (u + 1) := sorry
instance cmModuli_act {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) : MulAction (cmGamma Φ p n) (cmGeometricPoints Φ p n) := sorry

theorem cmModuliGalois {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) :
    Finite (cmGamma Φ p n) ∧ MulAction.IsPretransitive (cmGamma Φ p n) (cmGeometricPoints Φ p n) ∧
      ∀ (g : cmGamma Φ p n) (x : cmGeometricPoints Φ p n), g • x = x → g = 1 := sorry

namespace Supplier
/-- Actual compact-support etale H^(2d)(Y,Lambda(d)); smooth pure dimension d and
invertibility of coefficient characteristic are omitted. SF.2/R12.3 own this general functor. -/
def compactTopCohomology (_Y : Scheme.{u}) (_d : ℕ) (Λ : CommRingCat.{u}) : ModuleCat.{u} Λ := sorry
/-- Geometric trace on one connected component, supplied by the etale trace formalism. -/
def componentTrace (Y : Scheme.{u}) (d : ℕ) (Λ : CommRingCat.{u}) (_c : ConnectedComponents Y) :
    compactTopCohomology Y d Λ →ₗ[Λ] Λ := sorry
end Supplier

def torusInvariantCohomology (Γ : Type*) [Group Γ] (H : Type*) [AddCommGroup H]
    [DistribMulAction Γ H] : AddSubgroup H where
  carrier := {x | ∀ g : Γ, g • x = x}
  add_mem' := by intro a b ha hb g; simp [smul_add, ha g, hb g]
  zero_mem' := by intro g; simp
  neg_mem' := by intro a ha g; simp [smul_neg, ha g]

/-- Orbit trace of actual etale cohomology: choose one component per torus orbit, not all
components and not an average requiring the group order to be invertible. -/
def torusTrace (Y : Scheme.{u}) (d : ℕ) (Λ : CommRingCat.{u})
    (reps : Finset (ConnectedComponents Y))
    (x : Supplier.compactTopCohomology Y d Λ) : Λ :=
  ∑ c ∈ reps, Supplier.componentTrace Y d Λ c x

theorem torusTrace_indep (Y : Scheme.{u}) (d : ℕ) (Λ : CommRingCat.{u})
    (Γ : Type*) [Group Γ] [MulAction Γ (ConnectedComponents Y)]
    [DistribMulAction Γ (Supplier.compactTopCohomology Y d Λ)]
    (heq : ∀ (g : Γ) (c : ConnectedComponents Y) (x : Supplier.compactTopCohomology Y d Λ),
      Supplier.componentTrace Y d Λ (g • c) (g • x) = Supplier.componentTrace Y d Λ c x)
    (reps reps' : Finset (ConnectedComponents Y))
    (x : Supplier.compactTopCohomology Y d Λ) (hx : x ∈ torusInvariantCohomology Γ _)
    (h : ∀ c, ∃! r : reps, ∃ g : Γ, g • r.val = c)
    (h' : ∀ c, ∃! r : reps', ∃ g : Γ, g • r.val = c) :
    torusTrace Y d Λ reps x = torusTrace Y d Λ reps' x := sorry

/-- Characteristic-two test retained as a scalar consequence of the geometric orbit trace. -/
example : (1 : ZMod 2) + 1 = 0 ∧ (1 : ZMod 2) ≠ 0 := by decide

end M4


/-! ## M5. Required examples -/

section M5

/-- Alternating block form of positive ordered polarization type. -/
def siegelGram (g : ℕ) (d : Fin g → ℤ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ :=
  Matrix.fromBlocks 0 (Matrix.diagonal d) (-Matrix.diagonal d) 0

def siegelForm (g : ℕ) (d : Fin g → ℤ) : LinearMap.BilinForm ℤ (Fin g ⊕ Fin g → ℤ) :=
  Matrix.toBilin' (siegelGram g d)

/-- All-genus datum, including the finite free lattice, perfect rational form and positive
compatible complex structure. Ordering d_i|d_(i+1) is needed only to call d the canonical type. -/
def siegelIntegralDatum (g : ℕ) (d : Fin g → ℤ) (_hd : ∀ i, 0 < d i) :
    IntegralPELDatum ℤ (Fin g ⊕ Fin g → ℤ) := sorry

theorem siegelIntegralDatum_form (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) :
    (siegelIntegralDatum g d hd).form = siegelForm g d := sorry

theorem siegelGram_standard (g : ℕ) : siegelGram g (fun _ => 1) = -Matrix.J (Fin g) ℤ := sorry

theorem siegelDatum_dualIndex (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) :
    (siegelIntegralDatum g d hd).dualIndex = (∏ i, (d i).natAbs) ^ 2 := sorry

/-- Standard rational basis of Q tensor the all-genus integral lattice. -/
def siegelRationalBasis (g : ℕ) :
    Module.Basis (Fin g ⊕ Fin g) ℚ (ℚ ⊗[ℤ] (Fin g ⊕ Fin g → ℤ)) := sorry

/-- Both e_i and f_i are scaled by d_i inverse in the dual lattice. -/
theorem siegelDatum_dual (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) :
    (siegelIntegralDatum g d hd).dual = Submodule.span ℤ
      (Set.range (fun i : Fin g ⊕ Fin g =>
        ((d (Sum.elim id id i) : ℚ)⁻¹) • siegelRationalBasis g i)) := sorry

/-- The actual rationalization of this datum, with B=Q and the tensor action. -/
def siegelRationalDatum (g : ℕ) (d : Fin g → ℤ) (_hd : ∀ i, 0 < d i)
    (_hg : 0 < g) : RationalPELDatum ℚ (ℚ ⊗[ℤ] (Fin g ⊕ Fin g → ℤ)) := sorry

theorem siegelDatum_reflex (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) (hg : 0 < g) :
    (siegelRationalDatum g d hd hg).reflexField = ⊥ := sorry

theorem siegelDatum_signature (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) (hg : 0 < g) :
    Module.finrank ℂ (siegelRationalDatum g d hd hg).V₀ = g := sorry

theorem siegelDatum_badPrimes (n dg p : ℕ) :
    PELDatum.IsGoodPrime n 1 1 (dg ^ 2) p ↔ ¬ p ∣ n * dg ^ 2 := by
  simp [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]

namespace Supplier
/-- A1/A2's actual genus-g polarized abelian schemes of prescribed type with full n-level,
on the good base. Its functor quotients polarization-preserving isomorphisms, not line bundles.
The order of the type, its degree, invertibility of n and fixed Weil multiplier are imposed. -/
def siegelFamilyFunctor (g : ℕ) (d : Fin g → ℕ) (n : ℕ) :
    (Over (siegelParameters g d n).base)ᵒᵖ ⥤ Type (u + 1) := sorry

/-- ModularCurves 5B's elliptic group schemes with a symplectic full-n torsion basis and
specified primitive Weil value, on the same base as the principal genus-one PEL problem. -/
def ellipticLevelFunctor (n : ℕ) :
    (Over (siegelParameters 1 (fun _ => 1) n).base)ᵒᵖ ⥤ Type (u + 1) := sorry

/-- D5 and R28 H0/H1 own the Hilbert polarization-module lattice and its integral moduli
functor. M5 imports their entire functor, including totally positive polarization module,
different and level; no second Hilbert moduli theory is constructed here. -/
def HilbertInput (F : Type u) [Field F] [NumberField F] : Type (u + 1) := sorry
def hilbertParameters {F : Type u} [Field F] [NumberField F]
    (_h : HilbertInput F) : ModuliParameters.{u} := sorry
def hilbertFamilyFunctor {F : Type u} [Field F] [NumberField F] (h : HilbertInput F) :
    (Over (hilbertParameters h).base)ᵒᵖ ⥤ Type (u + 1) := sorry
end Supplier

/-- Actual identification of the all-genus Siegel and PEL family functors. -/
theorem siegelModuli (g : ℕ) (d : Fin g → ℕ) (n : ℕ) :
    Nonempty (PELModuli.familyFunctor (siegelParameters g d n) ≅
      Supplier.siegelFamilyFunctor g d n) := sorry

/-- Milne 6.11 and the genus-one aside p.75: the universal elliptic group scheme and fixed
Weil-pairing basis are recovered from the principal genus-one universal PEL family. -/
theorem genusOneComparison (n : ℕ) :
    Nonempty (PELModuli.familyFunctor (siegelParameters 1 (fun _ => 1) n) ≅
      Supplier.ellipticLevelFunctor n) := sorry

/-- RS-23: Hilbert example acceptance imports D5/H0/H1, independently of the M6 C5 suffix. -/
theorem hilbertExampleAcceptance (F : Type u) [Field F] [NumberField F]
    (h : Supplier.HilbertInput F) :
    Nonempty (PELModuli.familyFunctor (Supplier.hilbertParameters h) ≅
      Supplier.hilbertFamilyFunctor h) := sorry

/-- Trace dictionary for a CM field with its CM involution. -/
def unitaryTraceForm {K : Type*} [Field K] [NumberField K] [StarRing K] {W : Type*}
    [AddCommGroup W] [Module K W] (H : HermitianSpace K W) (δ : K) : W → W → ℚ :=
  fun x y => Algebra.trace ℚ K (δ * H.pairing x y)

/-- Complete rational datum from the nondegenerate Hermitian form, totally imaginary delta
and positive compatible h of the prescribed signature. Those geometric conditions, including
CM star, positive finite rank and the chosen h, are omitted here and explicit in the packet. -/
def unitaryRationalDatum {K : Type*} [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] {W : Type*} [AddCommGroup W] [Module ℚ W] [Module K W]
    [IsScalarTower ℚ K W] (_H : HermitianSpace K W) (_δ : K) : RationalPELDatum K W := sorry

theorem unitaryDatum_form {K : Type*} [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] {W : Type*} [AddCommGroup W] [Module ℚ W] [Module K W]
    [IsScalarTower ℚ K W] (H : HermitianSpace K W) (δ : K) (x y : W) :
    (unitaryRationalDatum H δ).form x y = unitaryTraceForm H δ x y := sorry

/-- Concrete imaginary-quadratic diagonal form and h with signature (r,s).
The quadratic degree and positive rank are explicit. The chosen embedding, delta and integral lattice are omitted prototype inputs. -/
def imaginaryQuadraticDatum (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] [Fact (Module.finrank ℚ K = 2)] (_r _s : ℕ) (_hrank : 0 < _r + _s) : RationalPELDatum K (Fin (_r + _s) → K) := sorry

theorem unitaryDatum_reflex (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] [Fact (Module.finrank ℚ K = 2)] (τ : K →ₐ[ℚ] ℂ) (r s : ℕ) (hrank : 0 < r + s) :
    (imaginaryQuadraticDatum K r s hrank).reflexField =
      if r = s then ⊥ else τ.fieldRange := sorry

/-- Rank-one definite data have torus adjoint group; definite rank at least two violates SV3.
SV3's interface is imported from D4; this target uses its actual adjoint datum. -/
def Supplier.adjointDatum (_D : SupplierShimuraDatum) : CommHopfAlgCat.{0} ℚ := sorry

theorem unitaryDatum_definite_rankOne (K : Type*) [Field K] [NumberField K]
    [NumberField.IsCMField K] [StarRing K] [Fact (Module.finrank ℚ K = 2)] :
    ∀ (R : Type*) [CommRing R] [Algebra ℚ R],
      Subsingleton ((Supplier.adjointDatum (imaginaryQuadraticDatum K 1 0 (by norm_num)).toShimuraDatum) →ₐ[ℚ] R) := sorry

/-- U(1,1) has reflex Q and U(2,1) has reflex K; their actual positive PEL data have
complex domain dimensions one and two. This target is not merely the signature arithmetic. -/
theorem unitaryExamples (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] [Fact (Module.finrank ℚ K = 2)] (τ : K →ₐ[ℚ] ℂ) :
    (imaginaryQuadraticDatum K 1 1 (by norm_num)).reflexField = ⊥ ∧
      (imaginaryQuadraticDatum K 2 1 (by norm_num)).reflexField = τ.fieldRange := sorry

/-- Actual type-(1,d) polarized abelian surface, obtained by taking the product of two
elliptic curves and scaling the second principal polarization by d. No arbitrary Gram matrix
is substituted for existence of the polarized object. -/
theorem nonprincipalTypeExample (k : Type u) [Field k] (d : ℕ) (hd : 0 < d) :
    ∃ (𝒜 : AbelianSchemeSupplier (.of k)) (A : AbelianScheme (Spec (.of k)))
      (pol : 𝒜.polarization A),
      Module.finrank k (𝒜.lie A) = 2 ∧
        ∀ s : Spec (.of k), (QuasiIsogeny.ofIsogeny (𝒜.polarizationHom pol) (𝒜.polarizationIsogeny pol)).numeratorKernelDegree s = d ^ 2 := sorry

/-- Nonvacuous tests on actual data and functors. -/
example : (siegelIntegralDatum 2 ![1, 2] (by intro i; fin_cases i <;> norm_num)).dualIndex = 4 := sorry
example : (siegelIntegralDatum 0 (fun _ => 1) (by simp)).dualIndex = 1 := sorry
example (n : ℕ) : Nonempty (PELModuli.familyFunctor (siegelParameters 1 (fun _ => 1) n) ≅
    Supplier.ellipticLevelFunctor n) := genusOneComparison n

end M5


/-! ## M6. Arithmetic moduli -/

section M6

namespace Supplier
/-- D0's ordinary algebraic stacks with their fppf fibre groupoids, diagonal and atlases.
No derived-stack carrier is used. Quotients and Keel–Mori are R09.4/R09.5 extensions of D0. -/
def AlgebraicStackOver (_S : Scheme.{u}) : Type (u + 1) := sorry
def stackPseudofunctor {S : Scheme.{u}} (_X : AlgebraicStackOver S) :
    Pseudofunctor (LocallyDiscrete (Over S)ᵒᵖ) Cat.{u + 1, u + 1} := sorry
def StackToSpace {S : Scheme.{u}} (_X : AlgebraicStackOver S)
    (_Y : AlgebraicSpaceOver S) : Type (u + 1) := sorry
def stackToSpaceComp {S : Scheme.{u}} {X : AlgebraicStackOver S}
    {Y Z : AlgebraicSpaceOver S} (_m : StackToSpace X Y)
    (_f : spaceFunctor Y ⟶ spaceFunctor Z) : StackToSpace X Z := sorry

def quotientStack {S : Scheme.{u}} (M : AlgebraicSpaceOver S) (Γ : Type u) [Group Γ]
    (_a : Γ →* Aut (spaceFunctor M)) : AlgebraicStackOver S := sorry

/-- C5's actual projective N-space over S. Algebraic geometry/projective-space owners
supply the scheme; quasi-projectivity below requires an immersion into this space. -/
def projectiveSpace (S : Scheme.{u}) (_N : ℕ) : Over S := sorry
end Supplier

namespace PELModuli
/-- Forgetting the additional compatible etale level; relation between P and P' is omitted.
The natural map is induced by the actual family functors and their representations. -/
def levelMap (P P' : ModuliParameters.{u}) :
    Supplier.spaceFunctor (representingSpace P').space ⟶
      Supplier.spaceFunctor (representingSpace P).space := sorry

/-- Scheme representatives when the M2 algebraic space is known to be a scheme. -/
structure SchemeRepresentative (P : ModuliParameters.{u}) where
  model : Over P.base
  represented : Supplier.schemeFunctor model ≅ familyFunctor P

def neatScheme (P : ModuliParameters.{u}) : SchemeRepresentative P := sorry

/-- Level schemes on a common prescribed good base. Base compatibility of P and P',
compact-open inclusion, its finite index and neatness are omitted prototype hypotheses. -/
def schemeLevelMap (P P' : ModuliParameters.{u}) :
    (neatScheme P').model.left ⟶ (neatScheme P).model.left := sorry

/-- The ordinary stack of the actual PEL families, including nonneat automorphisms. -/
def arbitraryLevel (P : ModuliParameters.{u}) : Supplier.AlgebraicStackOver P.base := sorry

def quotientPresentation (P P' : ModuliParameters.{u}) (Γ : Type u) [Group Γ]
    (_a : Γ →* Aut (Supplier.spaceFunctor (representingSpace P').space)) :
    Supplier.AlgebraicStackOver P.base := sorry

/-- Coarse space and map of the actual nonneat PEL stack. -/
def coarseSpace (P : ModuliParameters.{u}) : Supplier.AlgebraicSpaceOver P.base := sorry
def toCoarse (P : ModuliParameters.{u}) : Supplier.StackToSpace (arbitraryLevel P) (coarseSpace P) := sorry
end PELModuli

/-- Finite etale level-forgetting morphism. For normal level inclusion it is the actual
H/H'-torsor; the degree and Galois action are recorded in the packet's API. -/
theorem levelForgettingMaps (P P' : ModuliParameters.{u}) :
    IsFinite (PELModuli.schemeLevelMap P P') ∧ Etale (PELModuli.schemeLevelMap P P') := sorry

/-- Equivalence of the family stack and the torsor-valued quotient presentation. Finite
normal H' in H, its neatness and base agreement are omitted, never replaced by orbit sets. -/
theorem arbitraryLevelStack (P P' : ModuliParameters.{u}) (Γ : Type u) [Group Γ] [Finite Γ]
    (a : Γ →* Aut (Supplier.spaceFunctor (PELModuli.representingSpace P').space)) :
    ∃ η : Pseudofunctor.StrongTrans
      (Supplier.stackPseudofunctor (PELModuli.arbitraryLevel P))
      (Supplier.stackPseudofunctor (PELModuli.quotientPresentation P P' Γ a)),
      ∀ S, (η.app S).toFunctor.IsEquivalence := sorry

namespace Supplier
/-- A1/A2's actual relative polarized abelian schemes of fixed genus g and polarization
degree d^2, with polarization-preserving isomorphisms, over an arbitrary base. -/
def polarizedStack (S : Scheme.{u}) (_g _d : ℕ) : AlgebraicStackOver S := sorry

def stackAtlas {S : Scheme.{u}} (_X : AlgebraicStackOver S) : Over S := sorry
end Supplier

/-- Glued ppav stack over Z, using the level-three presentation over Z[1/3] and level-four
presentation over Z[1/2]. R09.4 supplies quotient/gluing; the overlap equivalence is induced
by common etale level refinements and includes characteristics two and three. -/
def siegelStack (g : ℕ) : Supplier.AlgebraicStackOver (Spec (.of ℤ)) := sorry

theorem siegelStackOverZ (g : ℕ) :
    ∃ η : Pseudofunctor.StrongTrans
      (Supplier.stackPseudofunctor (siegelStack g))
      (Supplier.stackPseudofunctor (Supplier.polarizedStack (Spec (.of ℤ)) g 1)),
      ∀ S, (η.app S).toFunctor.IsEquivalence := sorry

/-- General polarization degree, including p|d. The Hilbert presentation first represents
(A,L); A2's Pic0 torsor and fppf descent then pass to (A,phi_L). This is a target, not a claim
that the Hilbert scheme alone represents polarizations. -/
theorem polarizedStackFiniteType (g d : ℕ) (hd : 0 < d) (S : Scheme.{u}) :
    LocallyOfFiniteType (Supplier.stackAtlas (Supplier.polarizedStack S g d)).hom ∧
      QuasiCompact (Supplier.stackAtlas (Supplier.polarizedStack S g d)).hom := sorry

/-- Keel–Mori universal property for maps to arbitrary algebraic spaces. Finite inertia,
finite type and ordinary DM hypotheses are supplied by the actual PEL stack. -/
theorem coarseModuliSpace (P : ModuliParameters.{u}) :
    ∀ (Y : Supplier.AlgebraicSpaceOver P.base)
      (m : Supplier.StackToSpace (PELModuli.arbitraryLevel P) Y),
      ∃! f : Supplier.spaceFunctor (PELModuli.coarseSpace P) ⟶ Supplier.spaceFunctor Y,
        Supplier.stackToSpaceComp (PELModuli.toCoarse P) f = m := sorry

theorem coarse_geometricPoints (P : ModuliParameters.{u}) (k : Type u) [Field k] [IsAlgClosed k]
    (φ : P.R₀ →+* k) :
    Nonempty (PELModuli.Family.isoClasses P (Over.mk (Spec.map (CommRingCat.ofHom φ))) ≃
      (Supplier.spaceFunctor (PELModuli.coarseSpace P)).obj
        (.op (Over.mk (Spec.map (CommRingCat.ofHom φ))))) := sorry

/-- Actual quasi-projective scheme representative of the coarse algebraic space.
C5's suffix is imported here once under RS-23; an immersion into a merely proper scheme
would not imply this conclusion. -/
theorem quasiProjectiveRealization (P : ModuliParameters.{u}) :
    ∃ (M : Over P.base) (N : ℕ),
      Nonempty (Supplier.schemeFunctor M ≅ Supplier.spaceFunctor (PELModuli.coarseSpace P)) ∧
        ∃ i : M ⟶ Supplier.projectiveSpace P.base N, IsImmersion i.left := sorry

namespace Supplier
/-- A1/A2's relative supplier, whose fields are the geometry of the actual scheme. -/
def abelianSupplier (R : CommRingCat.{u}) : AbelianSchemeSupplier R := sorry
end Supplier

/-- Objects used in fields-of-moduli and finite-field claims. Genus and degree constrain
actual polarized abelian schemes, rather than an unrelated admitted set. -/
structure PolarizedObject (g d : ℕ) (k : Type u) [Field k] where
  A : AbelianScheme (Spec (.of k))
  pol : (Supplier.abelianSupplier (.of k)).polarization A
  genus : Module.finrank k ((Supplier.abelianSupplier (.of k)).lie A) = g
  degree : ∀ s : Spec (.of k),
    (QuasiIsogeny.ofIsogeny ((Supplier.abelianSupplier (.of k)).polarizationHom pol)
      ((Supplier.abelianSupplier (.of k)).polarizationIsogeny pol)).numeratorKernelDegree s = d ^ 2

/-- Morphisms are actual group-scheme isomorphisms carrying lambda to lambda', as in A2. -/
instance polarizedObjectGroupoid (g d : ℕ) (k : Type u) [Field k] :
    Groupoid.{u + 1} (PolarizedObject g d k) := sorry

abbrev polarizedIsoClasses (g d : ℕ) (k : Type u) [Field k] : Type (u + 1) :=
  Quot (fun x y : PolarizedObject g d k => Nonempty (x ≅ y))

def polarizedBaseChange {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K] :
    PolarizedObject g d k ⥤ PolarizedObject g d K := sorry

/-- Galois action induced by scheme base change, preserving the actual polarization. -/
instance polarizedGaloisAction (g d : ℕ) (k K : Type u) [Field k] [Field K] [Algebra k K] :
    MulAction (K ≃ₐ[k] K) (polarizedIsoClasses g d K) := sorry

def fieldOfModuli {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (ξ : PolarizedObject g d K) : IntermediateField k K :=
  letI := polarizedGaloisAction g d k K
  IntermediateField.fixedField (MulAction.stabilizer (K ≃ₐ[k] K)
    (Quot.mk _ ξ : polarizedIsoClasses g d K))

/-- Residue field of the actual coarse moduli point, pulled into K via the point.
R09.5 supplies the coarse stack's point construction. -/
def Supplier.coarsePointField {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (_ξ : PolarizedObject g d K) : IntermediateField k K := sorry

theorem fieldOfModuli_eq_residue {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K] (ξ : PolarizedObject g d K) :
    fieldOfModuli (k := k) ξ = Supplier.coarsePointField (k := k) ξ := sorry

/-- Forms split by K/k are actual objects over k with the specified geometric isomorphism
class. Taking iso classes prevents counting markings as distinct forms. -/
def PELModuli.forms {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (ξ : PolarizedObject g d k) : Type (u + 1) :=
    {x : polarizedIsoClasses g d k //
      ∃ η : PolarizedObject g d k, Quot.mk _ η = x ∧
        Nonempty ((polarizedBaseChange (K := K)).obj η ≅ (polarizedBaseChange (K := K)).obj ξ)}

/-- AA.4 Part II supplies continuous nonabelian H1 for the Galois action on the finite
automorphism group of the actual polarized object. Finite Galois extensions need no extra
continuity predicate; the absolute-Galois version uses locally constant cocycles. -/
def Supplier.formsH1 {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (_ξ : PolarizedObject g d k) : Type (u + 1) := sorry

theorem formsAndDescentObstruction {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    [FiniteDimensional k K] [IsGalois k K] (ξ : PolarizedObject g d k) :
    Nonempty (PELModuli.forms (K := K) ξ ≃ Supplier.formsH1 (K := K) ξ) := sorry

/-- The residual gerbe has geometric band Aut(xi); it is neutral iff xi descends to its
field of moduli. A band need not be a canonical k-group before a neutral object is chosen. -/
def Supplier.residualGerbe {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (ξ : PolarizedObject g d K) : AlgebraicStackOver (Spec (.of (fieldOfModuli (k := k) ξ))) := sorry

/-- Tsimerman Lemma 4.1: an actual model over an extension of the field of moduli of
uniformly bounded degree depending only on g. The level-three torsor and Silverberg input
are used in the proof, not replaced by the cardinality inequality alone. -/
theorem boundedFieldOfDefinition {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]
    (ξ : PolarizedObject g d K) :
    ∃ L : IntermediateField (fieldOfModuli (k := k) ξ) K,
      Module.finrank (fieldOfModuli (k := k) ξ) L ≤ 2 * 3 ^ (4 * g ^ 2) ∧
        ∃ η : PolarizedObject g d L, Nonempty (polarizedBaseChange.obj η ≅ ξ) := sorry

/-- A1 base change is the fibre product abelian group scheme over T. -/
def AbelianScheme.pullback {S T : Scheme.{u}} (_f : T ⟶ S) (_A : AbelianScheme S) :
    AbelianScheme T := sorry

/-- Actual Hodge sheaf e*Omega_(A/S) of a relative abelian scheme, with its locally free
structure supplied by A4/AlgebraicVectorBundles. -/
def hodgeBundle {S : Scheme.{u}} (_A : AbelianScheme S) : S.Modules := sorry
/-- Its determinant line bundle, not a rank-one affine substitute. -/
def hodgeLine {S : Scheme.{u}} (_A : AbelianScheme S) : S.Modules := sorry

/-- Pullback of the Hodge line under the actual abelian-scheme base change. -/
theorem hodgeLine_baseChange {S T : Scheme.{u}} (f : T ⟶ S) (A : AbelianScheme S) :
    Nonempty ((Scheme.Modules.pullback f).obj (hodgeLine A) ≅
      hodgeLine (AbelianScheme.pullback f A)) := sorry

/-- Classifying an arithmetic PEL object gives a base point and a pullback of the universal
family; the Hodge line comparison is between these actual families on the same test scheme. -/
theorem PELModuli.hodgeLine_classify {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Family P S) :
    Nonempty (hodgeLine ξ.abelian ≅
      hodgeLine ((PELModuli.universal P).pullback S (PELModuli.classify ξ)).abelian) := sorry

/-- All-genus universal export for the fixed Siegel type and level. -/
def PELModuli.export_siegel (g : ℕ) (d : Fin g → ℕ) (n : ℕ) :
    PELModuli.FamilyOnSpace (siegelParameters g d n) (PELModuli.representingSpace (siegelParameters g d n)).space :=
  PELModuli.universal (siegelParameters g d n)

theorem universalFamilyExport {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Family P S) :
    Nonempty ((PELModuli.universal P).pullback S (PELModuli.classify ξ) ≅ ξ) :=
  (PELModuli.classify_universal ξ).map Iso.symm

/-- Lipnowski–Tsimerman: fixed g and degree d^2, over the actual finite field, including
forms of each geometric object. Polarization classes are retained. -/
theorem finiteFieldFiniteness (g d : ℕ) (k : Type u) [Field k] [Finite k] :
    Finite (polarizedIsoClasses g d k) := sorry

/-- Genuine type-(1,d) examples over a field with elliptic curves, with etale full level
added after a finite separable extension. The fixed-genus polarized object is nonempty. -/
theorem nonemptyExamples (k : Type u) [Field k] (d : ℕ) (hd : 0 < d) :
    Nonempty (PolarizedObject 2 d k) := sorry

example (k : Type u) [Field k] : Nonempty (PolarizedObject 2 1 k) := nonemptyExamples k 1 (by decide)
example (g d : ℕ) (k : Type u) [Field k] [Finite k] :
    Finite (polarizedIsoClasses g d k) := finiteFieldFiniteness g d k
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Family P S) :
    Nonempty ((PELModuli.universal P).pullback S (PELModuli.classify ξ) ≅ ξ) := universalFamilyExport ξ

end M6

/-! Relative levels. The earlier Fibre declarations are computations on geometric stalks.
The following interfaces are the relative sheaf/groupoid targets. P fixes the full order,
lattice, good base and compact-open level. Connectedness, local noetherianness and the
matching Tate-lattice conditions are omitted prototype hypotheses and imposed in the packet. -/
namespace PELModuli
/-- Relative triples before choosing a level: the abelian scheme, actual prime-to-box
polarization, order action, Rosati and Lie determinant condition, with isomorphisms. -/
def Triple (P : ModuliParameters.{u}) (_S : Over P.base) : Type (u + 1) := sorry
instance tripleGroupoid (P : ModuliParameters.{u}) (S : Over P.base) :
    Groupoid.{u + 1} (Triple P S) := sorry

def Triple.pullback {P : ModuliParameters.{u}} {S T : Over P.base} (_f : S ⟶ T) :
    Triple P T ⥤ Triple P S := sorry

def Triple.affine (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R) :
    Triple P (Over.mk (Spec.map φ)) ≃
      PELTriple (P.supplier R) P.O P.box P.basis (MvPolynomial.map φ.hom P.determinant) := sorry

def Family.triple {P : ModuliParameters.{u}} {S : Over P.base} (_ξ : Family P S) : Triple P S := sorry
end PELModuli

namespace Supplier
def relativeEtaleTopology (S : Scheme.{u}) : GrothendieckTopology (Over S) := sorry
/-- AA.1's order-linear pair similitudes G(completed Z away from P.box). -/
def integralSimilitudes (_P : ModuliParameters.{u}) : Type u := sorry
instance integralSimilitudesGroup (P : ModuliParameters.{u}) : Group (integralSimilitudes P) := sorry
/-- A4's etale fundamental group at the indicated geometric point. -/
def etaleFundamentalGroup (S : Scheme.{u}) (_s : GeometricPoint S) : Type u := sorry
instance etaleFundamentalGroupGroup (S : Scheme.{u}) (s : GeometricPoint S) :
    Group (etaleFundamentalGroup S s) := sorry
end Supplier

/-- Etale sheaf of O-linear isomorphisms of the completed lattice and the actual Tate
local system of xi, with its Tate-twist isomorphism and polarization pairing equation. -/
def symplecticIsomSheaf {P : ModuliParameters.{u}} {S : Over P.base} (_ξ : PELModuli.Triple P S) :
    Sheaf (Supplier.relativeEtaleTopology S.left) (Type (u + 1)) := sorry

def symplecticIsomSheaf.stalk {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (_s : GeometricPoint S.left) : Type (u + 1) := sorry
instance symplecticIsomSheaf.action {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (s : GeometricPoint S.left) :
    MulAction (Supplier.integralSimilitudes P)ᵐᵒᵖ (symplecticIsomSheaf.stalk ξ s) := sorry

def symplecticIsomSheaf.act {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) :
    (Supplier.integralSimilitudes P)ᵐᵒᵖ →* Aut (symplecticIsomSheaf ξ).obj := sorry

theorem symplecticIsomSheaf.torsor {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (s : GeometricPoint S.left)
    (x y : symplecticIsomSheaf.stalk ξ s) :
    ∃! g : (Supplier.integralSimilitudes P)ᵐᵒᵖ, g • x = y := sorry

instance symplecticIsomSheaf.monodromy {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (s : GeometricPoint S.left) :
    MulAction (Supplier.etaleFundamentalGroup S.left s) (symplecticIsomSheaf.stalk ξ s) := sorry

theorem symplecticIsomSheaf.galois {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (s : GeometricPoint S.left)
    (σ : Supplier.etaleFundamentalGroup S.left s) (g : (Supplier.integralSimilitudes P)ᵐᵒᵖ)
    (x : symplecticIsomSheaf.stalk ξ s) : σ • (g • x) = g • (σ • x) := sorry

/-- Sheaf of finite-level O-linear trivializations, with the roots-of-unity twist retained.
Liftability is built into its sections, using reductions of the completed trivialization. -/
def PrincipalLevel {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_n : ℕ) : Type (u + 1) := sorry

def symplecticIsomSheaf.reduce {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (n : ℕ) :
    (symplecticIsomSheaf ξ).obj.obj (.op (Over.mk (𝟙 S.left))) → PrincipalLevel ξ n := sorry

def symplecticIsomSheaf.rational {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) :
    Sheaf (Supplier.relativeEtaleTopology S.left) (Type (u + 1)) := sorry

theorem symplecticIsomSheaf.baseChange {P : ModuliParameters.{u}} {S T : Over P.base}
    (f : S ⟶ T) (ξ : PELModuli.Triple P T) (s : GeometricPoint S.left) :
    Nonempty (symplecticIsomSheaf.stalk ((PELModuli.Triple.pullback f).obj ξ) s ≃
      symplecticIsomSheaf.stalk ξ ⟨s.Ω, s.point ≫ f.left⟩) := sorry

namespace PrincipalLevel
/-- Finite etale sheaves A[n] times A[n] and mu_n on the actual base. -/
def pairingSource {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_n : ℕ) :
    Sheaf (Supplier.relativeEtaleTopology S.left) (Type (u + 1)) := sorry
def pairingTarget {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_n : ℕ) :
    Sheaf (Supplier.relativeEtaleTopology S.left) (Type (u + 1)) := sorry
/-- The actual Weil pairing and the lattice pairing transported along alpha and nu. -/
def weilPairing {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (n : ℕ) : pairingSource ξ n ⟶ pairingTarget ξ n := sorry
def transportedPairing {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} {n : ℕ} (_α : PrincipalLevel ξ n) :
    pairingSource ξ n ⟶ pairingTarget ξ n := sorry
/-- A3's kernel of the polarization and the finite quotient of the full dual lattice. -/
def polarizationKernel {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (s : GeometricPoint S.left) : Over (Spec (.of s.Ω)) := sorry
def latticeKernel {P : ModuliParameters.{u}} (S : Over P.base) (s : GeometricPoint S.left) :
    Over (Spec (.of s.Ω)) := sorry

theorem symplectic {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} {n : ℕ} (α : PrincipalLevel ξ n) :
    weilPairing ξ n = transportedPairing α := sorry
/-- Reduction on each completed-trivialization stalk retains both alpha and nu. -/
def finiteStalk {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_n : ℕ) (_s : GeometricPoint S.left) : Type (u + 1) := sorry
def stalk {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    {n : ℕ} (_α : PrincipalLevel ξ n) (s : GeometricPoint S.left) : finiteStalk ξ n s := sorry
def stalkReduction {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (n : ℕ) (s : GeometricPoint S.left) :
    symplecticIsomSheaf.stalk ξ s → finiteStalk ξ n s := sorry

def reductionFibre {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} {n : ℕ} (α : PrincipalLevel ξ n)
    (s : GeometricPoint S.left) := {x : symplecticIsomSheaf.stalk ξ s //
      stalkReduction ξ n s x = stalk α s}

theorem liftable {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} {n : ℕ} (α : PrincipalLevel ξ n) :
    ∀ s, Nonempty (reductionFibre α s) := sorry

theorem ker_polarization {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} {n : ℕ} (_α : PrincipalLevel ξ n) (s : GeometricPoint S.left) :
    Nonempty (polarizationKernel ξ s ≅ latticeKernel S s) := sorry

def pullback {P : ModuliParameters.{u}} {S T : Over P.base} (f : S ⟶ T)
    {ξ : PELModuli.Triple P T} {n : ℕ} (_α : PrincipalLevel ξ n) :
    PrincipalLevel ((PELModuli.Triple.pullback f).obj ξ) n := sorry

def reduce {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    {m n : ℕ} (_hmn : m ∣ n) (_α : PrincipalLevel ξ n) : PrincipalLevel ξ m := sorry

def act {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    {n : ℕ} (_g : Supplier.integralSimilitudes P) (_α : PrincipalLevel ξ n) :
    PrincipalLevel ξ n := sorry
/-- The constant rank-one Z/n lattice with its specified twist convention. -/
def constantTwist {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_n : ℕ) :
    Sheaf (Supplier.relativeEtaleTopology S.left) (Type (u + 1)) := sorry
/-- The finite Tate-twist isomorphism, including its source and target, is part of alpha. -/
def multiplier_data {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    {n : ℕ} (_α : PrincipalLevel ξ n) :
    constantTwist ξ n ≅ pairingTarget ξ n := sorry
end PrincipalLevel

/-- Compatible etale-local H_n-orbits of principal levels at every permitted refinement.
This is a descended relative section, rather than one orbit at one geometric point. -/
def IntegralLevel {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) : Type (u + 1) := sorry
namespace IntegralLevel
def ofPrincipal {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    (_α : PrincipalLevel ξ P.n) : IntegralLevel ξ := sorry

def pullback {P : ModuliParameters.{u}} {S T : Over P.base} (f : S ⟶ T)
    {ξ : PELModuli.Triple P T} (_α : IntegralLevel ξ) :
    IntegralLevel ((PELModuli.Triple.pullback f).obj ξ) := sorry
end IntegralLevel

def PELModuli.Family.level {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Family P S) : IntegralLevel ξ.triple := sorry

namespace PELModuli
abbrev moduliProblem (P : ModuliParameters.{u}) := pseudofunctor P
namespace moduliProblem
abbrev obj (P : ModuliParameters.{u}) (S : Over P.base) := Family P S
/-- Grothendieck construction of the actual pullback pseudofunctor. -/
def total (P : ModuliParameters.{u}) : Type (u + 1) := sorry
instance totalCategory (P : ModuliParameters.{u}) : Category.{u + 1} (total P) := sorry
def projection (P : ModuliParameters.{u}) : total P ⥤ Over P.base := sorry

theorem isFibered (P : ModuliParameters.{u}) : (projection P).IsFibered := sorry
abbrev isoClasses (P : ModuliParameters.{u}) (S : Over P.base) := Family.isoClasses P S
/-- Principal-level presentation of the same family groupoid, when H=U(n).
The exact congruence-level hypothesis is omitted in this prototype. -/
def principalFamily (P : ModuliParameters.{u}) (_S : Over P.base) : Type (u + 1) := sorry
instance principalFamilyGroupoid (P : ModuliParameters.{u}) (S : Over P.base) :
    Groupoid.{u + 1} (principalFamily P S) := sorry

theorem principal (P : ModuliParameters.{u}) (S : Over P.base) :
    Nonempty (Family P S ≌ principalFamily P S) := sorry

/-- Identical datum/base with H' contained in H; these parameter hypotheses are omitted. -/
def changeLevel (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base) :
    (hbase ▸ familyFunctor P') ⟶ familyFunctor P := sorry
/-- For Siegel input the family functor is exactly the actual polarized-abelian functor. -/
theorem siegel (g n : ℕ) (d : Fin g → ℕ) :
    Nonempty (familyFunctor (siegelParameters g d n) ≅ Supplier.siegelFamilyFunctor g d n) := sorry
abbrev aut {P : ModuliParameters.{u}} {S : Over P.base} (ξ : Family P S) := ξ ≅ ξ
end moduliProblem
end PELModuli


/-! Additional relative contracts. These complete the packet API rather than using
stalk computations as stand-ins for a relative level or a family functor. -/
namespace Supplier
/-- The actual away-from-box completed integer embedding and Tate local system. -/
def awayIntegerToAdele (box : Set ℕ) : AwayIntegralRing box →+* AwayAdeleRing box := sorry
def relativeAdelicTate {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_s : GeometricPoint S.left) :
    ModuleCat.{u} (AwayAdeleRing P.box) := sorry

def relativeIntegralTate {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (s : GeometricPoint S.left) :
    Submodule ℤ (relativeAdelicTate ξ s) := sorry

def completedLattice (P : ModuliParameters.{u}) :
    Submodule ℤ (AwayAdeleRing P.box ⊗[ℤ] P.L) := sorry
end Supplier

/-- Monodromy-invariant orbits of O-linear adelic symplectic trivializations on every
connected component, with their finite-Tate-twist multiplier. -/
def RelativeRationalLevel {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) : Type (u + 1) := sorry

def IntegralLevel.rationalize {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} (_α : IntegralLevel ξ) : RelativeRationalLevel ξ := sorry

namespace RelativeRationalLevel
def representatives {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} (_β : RelativeRationalLevel ξ) (s : GeometricPoint S.left) :
    Set (((AwayAdeleRing P.box ⊗[ℤ] P.L) ≃ₗ[AwayAdeleRing P.box]
      Supplier.relativeAdelicTate ξ s) × (AwayAdeleRing P.box)ˣ) := sorry

/-- Both the completed lattice and the completed Tate-twist lattice must match. -/
def MatchesIntegralLattices {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} (β : RelativeRationalLevel ξ) : Prop :=
  ∀ s, ∀ r ∈ representatives β s,
    (Supplier.completedLattice P).map (r.1.toLinearMap.restrictScalars ℤ) =
      Supplier.relativeIntegralTate ξ s ∧
    Set.range (fun z : AwayIntegralRing P.box => (r.2 : AwayAdeleRing P.box) *
      Supplier.awayIntegerToAdele P.box z) = Set.range (Supplier.awayIntegerToAdele P.box)

-- Here K is contained in the completed integral group; this future comparison
-- ensures that integrality is independent of the orbit representative.
theorem integral_iff {P : ModuliParameters.{u}} {S : Over P.base}
    {ξ : PELModuli.Triple P S} (β : RelativeRationalLevel ξ) :
    (∃! α : IntegralLevel ξ, IntegralLevel.rationalize α = β) ↔ MatchesIntegralLattices β := sorry

/-- The monodromy-invariant H-orbit stalk, not the entire trivialization torsor. -/
def orbitStalk {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_s : GeometricPoint S.left) : Type (u + 1) := sorry
/-- Connectedness is omitted; transport of invariant orbits is independent of a path. -/
def basepointIndep {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Triple P S) (s t : GeometricPoint S.left) :
    orbitStalk ξ s ≃ orbitStalk ξ t := sorry
end RelativeRationalLevel

/-- Same datum and base, with H' contained in H; the level inclusion is omitted. -/
def PELModuli.changeLevelTriple (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base)
    (S : Over P'.base) : PELModuli.Triple P' S ⥤ PELModuli.Triple P (hbase ▸ S) := sorry
namespace RelativeRationalLevel
def changeLevel {P P' : ModuliParameters.{u}} (hbase : P'.base = P.base)
    {S : Over P'.base} (ξ : PELModuli.Triple P' S) :
    RelativeRationalLevel ξ → RelativeRationalLevel ((PELModuli.changeLevelTriple P P' hbase S).obj ξ) := sorry
end RelativeRationalLevel

namespace PELModuli
section
variable {B : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] {V : Type u} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- Kottwitz's quadruples using the same actual A, localized action, positive polarization
class, determinant and invariant away-adelic level. -/
def kottwitzFamilyFunctor (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (_K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) :
    (Over P.base)ᵒᵖ ⥤ Type (u + 1) := sorry

theorem ratModuliProblem.kottwitz (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) :
    Nonempty (rationalFamilyFunctor P D K ≅ kottwitzFamilyFunctor P D K) := sorry

/-- Identification of localized orders, lattices, h, forms and levels is omitted. The
same rational datum, rather than merely an isomorphism of abstract lattices, is required. -/
theorem ratModuliProblem.dependsOnlyOn (P P' : ModuliParameters.{u})
    (e : P.base ≅ P'.base) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (K' : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P'.box))) :
    Nonempty (rationalFamilyFunctor P D K ≅ (Over.map e.hom).op ⋙
      rationalFamilyFunctor P' D K') := sorry

abbrev ratModuliProblem.changeLevel := @forgetLevel

/-- Characteristic-zero, same rationalized datum and full finite adelic level.
The base restriction and the away/full coefficient comparison are omitted here. -/
def adelicModuli.ofRational (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (Kf : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (S : Over P.base) : ratModuliProblem P D K S ⥤ adelicModuli P D Kf S := sorry

/-- The actual abelian scheme retained by the full adelic family. -/
def adelicModuli.abelian {P : ModuliParameters.{u}} {D : RationalPELDatum B V}
    {K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))}
    {S : Over P.base} (_ξ : adelicModuli P D K S) : AbelianScheme S.left := sorry

namespace Supplier
/-- A4's inverse limit of all torsion groups at the point, on a characteristic-zero base. -/
def fullIntegralTate {S : Scheme.{u}} (_A : AbelianScheme S)
    (_s : GeometricPoint S) : ModuleCat.{u} ℤ := sorry
/-- A4's full restricted-product finite adelic homology of the same actual abelian scheme. -/
def fullTate {S : Scheme.{u}} (_A : AbelianScheme S)
    (_s : GeometricPoint S) : ModuleCat.{u} (IsDedekindDomain.FiniteAdeleRing ℤ ℚ) := sorry
end Supplier

/-- The full finite adelic level stalk of the actual family, including its multiplier.
Monodromy, B-linearity, pairings and characteristic-zero base compatibility are as in M1. -/
def adelicModuli.levelOrbit {P : ModuliParameters.{u}} {D : RationalPELDatum B V}
    {K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))}
    {S : Over P.base} (ξ : adelicModuli P D K S) (s : GeometricPoint S.left) :
    Set (((IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] V) ≃ₗ[IsDedekindDomain.FiniteAdeleRing ℤ ℚ]
      Supplier.fullTate (adelicModuli.abelian ξ) s) × (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)ˣ) := sorry

def adelicModuli.hecke (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))
    (S : Over P.base) : adelicModuli P D K' S ⥤ adelicModuli P D K S := sorry

/-- The orbit of (hecke P D K K' g S).obj ξ, transported through its canonical
underlying-abelian-scheme comparison. K'=gKg^-1 is an omitted level compatibility. -/
def adelicModuli.heckeOrbit {P : ModuliParameters.{u}} {D : RationalPELDatum B V}
    {K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))}
    {S : Over P.base} (g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))
    (ξ : adelicModuli P D K' S) (s : GeometricPoint S.left) :
    Set (((IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] V) ≃ₗ[IsDedekindDomain.FiniteAdeleRing ℤ ℚ]
      Supplier.fullTate (adelicModuli.abelian ξ) s) × (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)ˣ) := sorry

theorem adelicModuli.hecke_orbit {P : ModuliParameters.{u}} {D : RationalPELDatum B V}
    {K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))}
    {S : Over P.base} (g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))
    (ξ : adelicModuli P D K' S) (s : GeometricPoint S.left) :
    adelicModuli.heckeOrbit (K := K) g ξ s =
      (fun η => (g.val.1.trans η.1, g.val.2 * η.2)) '' adelicModuli.levelOrbit ξ s := sorry

/-- Composition of actual right translations. The equality of the intermediate level
with the corresponding conjugate is omitted; e transports that same level functor. -/
theorem heckeTranslate_comp (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (g h : PELDatum.similitudeGroup D (AwayAdeleRing P.box))
    (e : rationalFamilyFunctor P D (heckeLevel P D K (h * g)) ≅
      rationalFamilyFunctor P D (heckeLevel P D (heckeLevel P D K g) h)) :
    e.hom ≫ heckeTranslate P D (heckeLevel P D K g) h ≫ heckeTranslate P D K g =
      heckeTranslate P D K (h * g) := sorry

/-- A positive rational central scalar acts by the localized scalar quasi-isogeny.
Only scalars trivial in the moduli equivalence are used; a general adelic central element
need not act trivially. That rational-scalar identification is omitted here. -/
theorem heckeTranslate_central (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (g : PELDatum.similitudeGroup D (AwayAdeleRing P.box))
    (e : rationalFamilyFunctor P D (heckeLevel P D K g) ≅ rationalFamilyFunctor P D K) :
    heckeTranslate P D K g = e.hom := sorry

/-- Integral comparison transports Hecke to an actual prime-to-box isogeny of families;
the corresponding transported lattice/level parameters P' are omitted conditions. -/
def heckeTranslate_integral (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base) :
    (hbase ▸ familyFunctor P') ⟶ familyFunctor P := sorry

/-- The Hecke-correspondence family and its translated target. Compatible transported
parameters, integral lattices and the right-translation element are omitted here. -/
def heckeFamily {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : Family P S) : Family P S := sorry
/-- Universal quasi-isogeny is supplied on the Hecke correspondence, not for arbitrary families. -/
def universal_hecke {P : ModuliParameters.{u}} (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (ξ : Family P (Over.mk (Spec.map φ))) :
    QuasiIsogeny (Family.affine P R φ ξ).triple.A
      (Family.affine P R φ (heckeFamily ξ)).triple.A := sorry

end
end PELModuli

namespace Supplier
/-- Faithful integral matrix representation of the pair group, including its multiplier. -/
def integralRepresentationDimension (_P : ModuliParameters.{u}) : ℕ := sorry
def integralMatrix (P : ModuliParameters.{u}) (p : ℕ) [Fact p.Prime]
    (_g : integralSimilitudes P) :
    Matrix (Fin (integralRepresentationDimension P)) (Fin (integralRepresentationDimension P)) ℤ_[p] := sorry
end Supplier

/-- Lan's actual adelic neatness, using the faithful lattice-plus-multiplier representation. -/
def IsNeat (P : ModuliParameters.{u}) (H : Subgroup (Supplier.integralSimilitudes P)) : Prop :=
  ∀ g ∈ H, IsAdelicallyNeatElement P.box (Supplier.integralRepresentationDimension P)
    (fun p => Supplier.integralMatrix P p g)

namespace IsNeat
theorem mono {P : ModuliParameters.{u}} {H H' : Subgroup (Supplier.integralSimilitudes P)}
    (hle : H' ≤ H) (hH : IsNeat P H) : IsNeat P H' := fun g hg => hH g (hle hg)

theorem conj {P : ModuliParameters.{u}} {H : Subgroup (Supplier.integralSimilitudes P)}
    (hH : IsNeat P H) (g : Supplier.integralSimilitudes P) :
    IsNeat P (H.map (MulAut.conj g).toMonoidHom) := sorry

/-- Alternative faithful algebraic representations are AA.0's representations, not arbitrary
abstract group homomorphisms. Their common eigenvalue torsion intersection agrees. -/
theorem repr_indep (P : ModuliParameters.{u}) (H : Subgroup (Supplier.integralSimilitudes P))
    (N : ℕ) (ρ : ∀ (p : ℕ) [Fact p.Prime], Supplier.integralSimilitudes P →*
      GL (Fin N) ℤ_[p]) :
    IsNeat P H ↔ ∀ g ∈ H, IsAdelicallyNeatElement P.box N
      (fun p hp => (@ρ p hp g : Matrix (Fin N) (Fin N) ℤ_[p])) := sorry

theorem shimuraData (P : ModuliParameters.{u}) (H : Subgroup (Supplier.integralSimilitudes P)) :
    IsNeat P H ↔ ∀ g ∈ H, IsAdelicallyNeatElement P.box
      (Supplier.integralRepresentationDimension P) (fun p => Supplier.integralMatrix P p g) := Iff.rfl
end IsNeat

/-- U(n) consists of completed integral similitudes trivial modulo n. -/
def principalCongruence (P : ModuliParameters.{u}) (n : ℕ) :
    Subgroup (Supplier.integralSimilitudes P) := sorry

theorem isNeat_principalCongruence (P : ModuliParameters.{u}) (n : ℕ) (hn : 3 ≤ n)
    (hbox : ∀ p ∈ P.box, ¬ p ∣ n) : IsNeat P (principalCongruence P n) := sorry

/-- Uniqueness of algebraization up to the actual PEL isomorphism, including all structures. -/
theorem effectivity_unique (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (m : Ideal R) [IsNoetherianRing R] [IsLocalRing R] [IsAdicComplete m R]
    (_hm : m = IsLocalRing.maximalIdeal R)
    (ξ η : PELModuli.Family P (Over.mk (Spec.map φ)))
    (h : Nonempty ((PELModuli.formalCompletion P R φ m).obj ξ ≅
      (PELModuli.formalCompletion P R φ m).obj η)) : Nonempty (ξ ≅ η) := sorry

namespace Supplier
/-- Quotient of omega_A tensor omega_Adual by the actual Rosati symmetry and O-adjoint
relations, for the universal family on X. A4 supplies differentials and KS, not this quotient. -/
def pelKodairaSpencerTensors {P : ModuliParameters.{u}} (_X : AlgebraicSpaceOver P.base)
    (R : CommRingCat.{u}) : ModuleCat.{u} R := sorry
end Supplier

theorem kodairaSpencerDimension (P : ModuliParameters.{u}) (R : CommRingCat.{u}) :
    Nonempty (Supplier.pelKodairaSpencerTensors (PELModuli.representingSpace P).space R ≅
      Supplier.cotangent (PELModuli.representingSpace P).space R) := sorry


namespace Supplier
/-- Relative differentials of the test scheme over P.base, on an affine chart R.
The chart identification and cotangent local freeness are omitted supplier conditions. -/
def testCotangent (P : ModuliParameters.{u}) (S : Scheme.{u})
    (R : CommRingCat.{u}) (_t : Spec R ⟶ S) : ModuleCat.{u} R := sorry
/-- Actual Hodge tensor quotient on the family pulled back from an etale presentation.
The test morphism is over P.base; this base compatibility is omitted here. -/
def pulledBackKSTensors (P : ModuliParameters.{u}) {S : Scheme.{u}}
    (_f : S ⟶ (spaceAtlas (PELModuli.representingSpace P).space).left)
    (R : CommRingCat.{u}) (_t : Spec R ⟶ S) : ModuleCat.{u} R := sorry
def pulledBackKSMap (P : ModuliParameters.{u}) {S : Scheme.{u}}
    (f : S ⟶ (spaceAtlas (PELModuli.representingSpace P).space).left)
    (R : CommRingCat.{u}) (t : Spec R ⟶ S) :
    pulledBackKSTensors P f R t ⟶ testCotangent P S R t := sorry
end Supplier

/-- M2's criterion on an ordinary etale scheme presentation. Good-base, neatness,
affine-chart and cotangent local-freeness conditions are as in the packet.
Unlike vanishing differentials alone, local finite presentation is essential (E6). -/
theorem kodairaSpencer_etale_iff (P : ModuliParameters.{u}) {S : Scheme.{u}}
    (f : S ⟶ (Supplier.spaceAtlas (PELModuli.representingSpace P).space).left)
    [LocallyOfFinitePresentation f] :
    Etale f ↔ Flat f ∧ ∀ (R : CommRingCat.{u}) (t : Spec R ⟶ S),
      IsOpenImmersion t → IsIso (Supplier.pulledBackKSMap P f R t) := sorry

namespace Supplier
/-- A3's actual Hom(A,B) tensor P, with clearing-denominators equivalence. -/
def homTensor (P : Subring ℚ) {R : CommRingCat.{u}}
    (_A _B : AbelianScheme (Spec R)) : Type u := sorry
instance homTensorGroup (P : Subring ℚ) {R : CommRingCat.{u}}
    (A B : AbelianScheme (Spec R)) : AddCommGroup (homTensor P A B) := sorry
instance endTensorRing (P : Subring ℚ) {R : CommRingCat.{u}}
    (A : AbelianScheme (Spec R)) : Ring (homTensor P A A) := sorry

def homTensorComp (P : Subring ℚ) {R : CommRingCat.{u}} {A B C : AbelianScheme (Spec R)}
    (_f : homTensor P A B) (_g : homTensor P B C) : homTensor P A C := sorry

def homTensorDual (P : Subring ℚ) {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    {A B : AbelianScheme (Spec R)} (_f : homTensor P A B) :
    homTensor P (𝒜.dual B) (𝒜.dual A) := sorry

def quasiToHomTensor (P : Subring ℚ) {R : CommRingCat.{u}}
    {A B : AbelianScheme (Spec R)} (_f : QuasiIsogeny A B) : homTensor P A B := sorry

def unitScaleQuasi (P : Subring ℚ) {R : CommRingCat.{u}}
    {A B : AbelianScheme (Spec R)} (_c : Pˣ) (_f : QuasiIsogeny A B) : QuasiIsogeny A B := sorry

def endTensorLie (P : Subring ℚ) {R : CommRingCat.{u}} (_base : P →+* R)
    (𝒜 : AbelianSchemeSupplier R) (A : AbelianScheme (Spec R)) :
    homTensor P A A →+* Module.End R (𝒜.lie A) := sorry
end Supplier

/-- LTXZZ Definition 3.4.2 over its full coefficient subring P of Q. -/
structure LocalizedOFAbelianScheme {R : CommRingCat.{u}} (P : Subring ℚ)
    (OF : Type u) [CommRing OF] where
  base : P →+* R
  A : AbelianScheme (Spec R)
  action : OF →+* Supplier.homTensor P A A

/-- c may be any unit of P in the source's convention; a positive rational polarization
is the additional Lan convention. The equality is in the actual localized Hom module. -/
structure LocalizedUnitaryOFAbelianScheme {R : CommRingCat.{u}} (𝒜 : AbelianSchemeSupplier R)
    (P : Subring ℚ) (OF : Type u) [CommRing OF] [StarRing OF]
    extends LocalizedOFAbelianScheme (R := R) P OF where
  quasiPolarization : QuasiIsogeny A (𝒜.dual A)
  unit : Pˣ
  ample : 𝒜.polarization A
  clears : QuasiIsogeny.Equivalent 𝒜 (Supplier.unitScaleQuasi P unit quasiPolarization)
    (QuasiIsogeny.ofIsogeny (𝒜.polarizationHom ample) (𝒜.polarizationIsogeny ample))
  rosati : ∀ a : OF,
    Supplier.homTensorComp P (action a) (Supplier.quasiToHomTensor P quasiPolarization) =
      Supplier.homTensorComp P (Supplier.quasiToHomTensor P quasiPolarization)
        (Supplier.homTensorDual P 𝒜 (action (star a)))

namespace LocalizedOFAbelianScheme
def HasSignatureType {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u} [CommRing OF]
    (𝒜 : AbelianSchemeSupplier R) (X : LocalizedOFAbelianScheme (R := R) P OF)
    [Module.Finite R (𝒜.lie X.A)] [Module.Free R (𝒜.lie X.A)]
    {ι : Type*} [Fintype ι] (τ : ι → OF →+* R) (r : ι → ℕ) : Prop :=
  ∀ {κ : Type*} [Fintype κ] [DecidableEq κ] (a : κ → OF),
    detPoly (fun j => Supplier.endTensorLie P X.base 𝒜 X.A (X.action (a j))) =
      ∏ i, (∑ j, MvPolynomial.C (τ i (a j)) * MvPolynomial.X j) ^ r i
end LocalizedOFAbelianScheme

namespace Supplier
/-- Actual tau-eigenspaces of covariant H1_dR, with the action induced by X.action. -/
def localizedDeRhamTau {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (_X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (_τ : OF →+* R) : ModuleCat.{u} R := sorry

def localizedLieTau {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (_X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (_τ : OF →+* R) : ModuleCat.{u} R := sorry

def localizedDeRhamMap {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    {X Y : LocalizedUnitaryOFAbelianScheme 𝒜 P OF} (_α : QuasiIsogeny X.A Y.A)
    (τ : OF →+* R) : localizedDeRhamTau 𝒜 X τ →ₗ[R] localizedDeRhamTau 𝒜 Y τ := sorry

def varpiIsogeny {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (π : OF) (_hπ : π ≠ 0) :
    QuasiIsogeny X.A X.A := sorry

def varpiPolarization {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (_π : OF) (_e : ℕ) :
    QuasiIsogeny X.A (𝒜.dual X.A) := sorry
end Supplier

/-- LTXZZ Lemma 3.4.12(1),(2), pp.153–154. P=Z_(p), inert CM prime with F+_p=Qp,
varpi valuation one, Fp² base, OF-linearity and conjugate tau indexing are omitted here.
Both quasi-isogenies are quasi-p; their crystal maps have the same kernels and images. -/
theorem isogenyKernelRanks {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X Y : LocalizedUnitaryOFAbelianScheme 𝒜 P OF)
    (α : QuasiIsogeny X.A Y.A) (β : QuasiIsogeny Y.A X.A) (π : OF) (hπ : π ≠ 0)
    (hcomp : QuasiIsogeny.Equivalent 𝒜 (QuasiIsogeny.comp 𝒜 α β)
      (Supplier.varpiIsogeny 𝒜 X π hπ)) (τ τc : OF →+* R) :
    (∀ t ∈ ({τ, τc} : Set (OF →+* R)),
      Module.Finite R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α t)) ∧
      Module.Projective R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α t)) ∧
      Module.Finite R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 β t)) ∧
      Module.Projective R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 β t))) ∧
    LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α τ) =
      LinearMap.range (Supplier.localizedDeRhamMap 𝒜 β τ) ∧
    LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 β τ) =
      LinearMap.range (Supplier.localizedDeRhamMap 𝒜 α τ) ∧
    Module.finrank R (Supplier.localizedLieTau 𝒜 Y τ) +
        Module.finrank R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α τc)) =
      Module.finrank R (Supplier.localizedLieTau 𝒜 X τ) +
        Module.finrank R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α τ)) := sorry

/-- LTXZZ Lemma 3.4.12(3),(4): rho is the sum of the two actual crystalline kernel ranks.
Only the distinguished p-primary degrees are used, not the full kernel away from p.
The inert uniformizer and p-primary degree identifications are omitted hypotheses. -/
theorem isogenyKernelRanks_degree {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X Y : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (α : QuasiIsogeny X.A Y.A)
    (π : OF) (e N dX dY : ℕ) (τ τc : OF →+* R)
    (p : ℕ) [Fact p.Prime] (s : Spec R)
    (hdegX : X.quasiPolarization.numeratorKernelDegree s = p ^ dX)
    (hdegY : Y.quasiPolarization.numeratorKernelDegree s = p ^ dY)
    (hheight : Module.finrank R (Supplier.localizedDeRhamTau 𝒜 X τ) = N)
    (hheightc : Module.finrank R (Supplier.localizedDeRhamTau 𝒜 X τc) = N)
    (hpol : QuasiIsogeny.Equivalent 𝒜
      (QuasiIsogeny.comp 𝒜 (QuasiIsogeny.comp 𝒜 α Y.quasiPolarization) (α.dual 𝒜))
      (Supplier.varpiPolarization 𝒜 X π e)) :
    2 * (Module.finrank R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α τ)) +
      Module.finrank R (LinearMap.ker (Supplier.localizedDeRhamMap 𝒜 α τc))) + dY =
      2 * N * e + dX := sorry

/-! Final API contracts. All Supplier declarations are imported future interfaces. Their
geometric meanings and omitted prototype hypotheses are stated in the packet and reader. -/
section FinalContracts

namespace Supplier
/-- AlgebraicVectorBundles' dual, tensor, symmetric power and determinant constructions
on actual locally free structure sheaves. Their finite-rank hypotheses are omitted here. -/
def moduleDual {S : Scheme.{u}} (_M : S.Modules) : S.Modules := sorry
def moduleTensor {S : Scheme.{u}} (_M _N : S.Modules) : S.Modules := sorry
def moduleSymmetricPower {S : Scheme.{u}} (_M : S.Modules) (_n : ℕ) : S.Modules := sorry
def moduleTensorPower {S : Scheme.{u}} (_M : S.Modules) (_n : ℕ) : S.Modules := sorry
def moduleDeterminant {S : Scheme.{u}} (_M : S.Modules) : S.Modules := sorry
/-- A4's actual relative tangent at the identity and relative de Rham H1. -/
def lieSheaf {S : Scheme.{u}} (_A : AbelianScheme S) : S.Modules := sorry
def deRhamCohomology {S : Scheme.{u}} (_A : AbelianScheme S) : S.Modules := sorry
def deRhamFilOne {S : Scheme.{u}} (_A : AbelianScheme S) : S.Modules := sorry
/-- Actual A1 product and dual, with the inherited relative group scheme. -/
def abelianProduct {S : Scheme.{u}} (_A _B : AbelianScheme S) : AbelianScheme S := sorry
end Supplier

theorem hodgeBundle_baseChange {S T : Scheme.{u}} (f : T ⟶ S) (A : AbelianScheme S) :
    Nonempty ((Scheme.Modules.pullback f).obj (hodgeBundle A) ≅
      hodgeBundle (AbelianScheme.pullback f A)) := sorry

theorem hodgeBundle_dual_lie {S : Scheme.{u}} (A : AbelianScheme S) :
    Nonempty (hodgeBundle A ≅ Supplier.moduleDual (Supplier.lieSheaf A)) := sorry

def hodgeBundle_isogeny {S : Scheme.{u}} {A B : AbelianScheme S} (f : A.Hom B) :
    hodgeBundle B ⟶ hodgeBundle A := sorry

theorem hodgeBundle_isogeny_iff {S : Scheme.{u}} {A B : AbelianScheme S}
    (f : A.Hom B) (_hf : AbelianScheme.IsIsogeny f) :
    IsIso (hodgeBundle_isogeny f) ↔ Etale f.f := sorry

theorem hodgeBundle_universal {P : ModuliParameters.{u}} {S : Over P.base}
    (ξ : PELModuli.Family P S) :
    Nonempty (hodgeBundle ((PELModuli.universal P).pullback S (PELModuli.classify ξ)).abelian ≅
      hodgeBundle ξ.abelian) := sorry

theorem hodgeBundle_hodgeFiltration {S : Scheme.{u}} (A : AbelianScheme S) :
    Nonempty (hodgeBundle A ≅ Supplier.deRhamFilOne A) := sorry

theorem hodgeLine_product {S : Scheme.{u}} (A B : AbelianScheme S) :
    Nonempty (hodgeLine (Supplier.abelianProduct A B) ≅
      Supplier.moduleTensor (hodgeLine A) (hodgeLine B)) := sorry

namespace Supplier
/-- The cotangent sheaf of the actual neat Siegel scheme and its universal Hodge sheaf. -/
def siegelOmega (g : ℕ) (d : Fin g → ℕ) (n : ℕ) :
    (PELModuli.neatScheme (siegelParameters g d n)).model.left.Modules := sorry
def siegelHodge (g : ℕ) (d : Fin g → ℕ) (n : ℕ) :
    (PELModuli.neatScheme (siegelParameters g d n)).model.left.Modules := sorry
end Supplier

theorem hodgeLine_ks_siegel (g : ℕ) (d : Fin g → ℕ) (n : ℕ) :
    Nonempty (Supplier.moduleSymmetricPower (Supplier.siegelHodge g d n) 2 ≅
      Supplier.siegelOmega g d n) ∧
    Nonempty (Supplier.moduleTensorPower (Supplier.moduleDeterminant (Supplier.siegelHodge g d n))
      (g + 1) ≅ Supplier.moduleDeterminant (Supplier.siegelOmega g d n)) := sorry

namespace Supplier
/-- R09.5's objects of the residual gerbe at the indicated coarse point. -/
def coarseGerbeObjects (P : ModuliParameters.{u}) (k : Type u) [Field k]
    (φ : P.R₀ →+* k)
    (_x : (spaceFunctor (PELModuli.coarseSpace P)).obj
      (.op (Over.mk (Spec.map (CommRingCat.ofHom φ))))) : Type (u + 1) := sorry
end Supplier

namespace Supplier
/-- Lifts through the actual level-forgetting morphism, with an isomorphism to xi after
base change. Base compatibility and a finite-etale inclusion of levels are omitted. -/
def levelLifts (P P' : ModuliParameters.{u}) (k : Type u) [Field k] (φ : P.R₀ →+* k)
    (_ξ : PELModuli.Family P (Over.mk (Spec.map (CommRingCat.ofHom φ))))
    (L : Type u) [Field L] [Algebra k L] : Type (u + 1) := sorry
end Supplier

namespace PELModuli
abbrev classifyingMap := @classify
/-- The actual coarse point of the PEL object, induced by the coarse-stack map. -/
def moduliPoint {P : ModuliParameters.{u}} {S : Over P.base} (_ξ : Family P S) :
    (Supplier.spaceFunctor (coarseSpace P)).obj (.op S) := sorry
/-- A field extension and a genuine lifted object after finite etale refinement of level.
The normal compact-open inclusion H' <= H of index N is an omitted hypothesis. -/
theorem rigidifyingExtension (P P' : ModuliParameters.{u}) (N : ℕ)
    (k : Type u) [Field k] (φ : P.R₀ →+* k)
    (ξ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ)))) :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra k L),
      Module.finrank k L ≤ N ∧
      Nonempty (Supplier.levelLifts P P' k φ ξ L) := sorry

theorem export_obstruction (P : ModuliParameters.{u}) (k : Type u) [Field k]
    (φ : P.R₀ →+* k)
    (x : (Supplier.spaceFunctor (coarseSpace P)).obj
      (.op (Over.mk (Spec.map (CommRingCat.ofHom φ))))) :
    (∃ ξ : Family P (Over.mk (Spec.map (CommRingCat.ofHom φ))), moduliPoint ξ = x) ↔
      Nonempty (Supplier.coarseGerbeObjects P k φ x) := sorry
end PELModuli

/-- The separably closed/characteristic-zero field-of-moduli setting is omitted. -/
theorem fieldOfModuli_le_of_model {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]
    (ξ : PolarizedObject g d K) (L : IntermediateField k K) (η : PolarizedObject g d L)
    (_h : Nonempty (polarizedBaseChange.obj η ≅ ξ)) : fieldOfModuli (k := k) ξ ≤ L := sorry

namespace Supplier
/-- Pullback of the polarized group scheme by the indicated field automorphism. -/
def polarizedConjugate {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (_σ : K ≃ₐ[k] K) (_ξ : PolarizedObject g d K) : PolarizedObject g d K := sorry
end Supplier

theorem fieldOfModuli_galois {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]
    (ξ : PolarizedObject g d K) (σ : K ≃ₐ[k] K) :
    fieldOfModuli (k := k) (Supplier.polarizedConjugate σ ξ) =
      (fieldOfModuli (k := k) ξ).map σ.toAlgHom := sorry

/-- No automorphisms, effective polarized descent and the algebraically closed
characteristic-zero extension are omitted; no unconditional model over a coarse point. -/
theorem fieldOfModuli_fine {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]
    (ξ : PolarizedObject g d K) (_h : Subsingleton (ξ ≅ ξ)) :
    ∃ η : PolarizedObject g d (fieldOfModuli (k := k) ξ),
      Nonempty (polarizedBaseChange.obj η ≅ ξ) := sorry

/-- Functoriality of invariants under an equivariant actual cohomology map. -/
def torusInvariantCohomology_functorial (Γ : Type*) [Group Γ]
    {H H' : Type*} [AddCommGroup H] [AddCommGroup H']
    [DistribMulAction Γ H] [DistribMulAction Γ H'] (f : H →+ H')
    (hf : ∀ (g : Γ) (x : H), f (g • x) = g • f x) :
    torusInvariantCohomology Γ H →+ torusInvariantCohomology Γ H' := sorry

theorem torusTrace_trivial (Y : Scheme.{u}) (d : ℕ) (Λ : CommRingCat.{u})
    (c : ConnectedComponents Y) (x : Supplier.compactTopCohomology Y d Λ) :
    torusTrace Y d Λ {c} x = Supplier.componentTrace Y d Λ c x := by
  simp [torusTrace]

/-- Normalization at the original good level: its generic cover is the identity.
The normality and dominance conditions on the good model are omitted. -/
theorem PELModuli.normalizedModel_good (M : Scheme.{u})
    (_hnormal : ∀ x : M, IsIntegrallyClosed (M.presheaf.stalk x)) :
    IsIso (PELModuli.normalizedModel_toGood (𝟙 M)) := sorry

section
variable {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] {V : Type} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

namespace PELModuli
/-- Right translation on the analytic arithmetic quotient and the corresponding
moduli model; g conjugates K' into K, a condition omitted here. -/
def analyticHecke (D : RationalPELDatum B V) (i : ker1 D)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) :
    quotientAnalyticSpace D i K' ⟶ quotientAnalyticSpace D i K := sorry

def analyticModuliHecke (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (_g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) :
    Supplier.analytification.obj (genericFibre P φ).model ⟶
      Supplier.analytification.obj (genericFibre P φ).model := sorry

theorem uniformization_hecke (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : ker1 D)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) :
    analyticHecke D i K K' g ≫ uniformization P φ D i K =
      uniformization P φ D i K' ≫ analyticModuliHecke P φ D K K' g := sorry

/-- Domain transport by the actual rational similitude. -/
def domainAction (D : RationalPELDatum B V) (γ : PELDatum.similitudeGroup D ℚ)
    (x : D.domain) : D.domain := sorry
/-- Upstairs polarized complex torus at the specified domain point and adelic lattice.
A5 supplies relative Riemann theory; AA.4 supplies the locally equivalent twist.
Use the positive normalized PEL form ε(x)q_gψ; A5's convention takes its negative. -/
def upstairsFibre (D : RationalPELDatum B V) (i : ker1 D) (_x : D.domain)
    (_g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) :
    Supplier.ComplexAnalyticSpace.{0} := sorry

def analyticFamily_equivariant (D : RationalPELDatum B V) (i : ker1 D)
    (γ : PELDatum.similitudeGroup D ℚ) (x : D.domain)
    (g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) :
    upstairsFibre D i x g ≅ upstairsFibre D i (domainAction D γ x) (rationalDiagonal D _ γ * g) := sorry

/-- The Siegel comparison identifies the actual genus-one quotient and universal family,
including all Weil-multiplier components. -/
theorem uniformization_siegel (n : ℕ) (φ : (siegelParameters 1 (fun _ => 1) n).R₀ →+* ℂ) :
    Nonempty (Supplier.analytification.obj (genericFibre (siegelParameters 1 (fun _ => 1) n) φ).model ≅
      Supplier.siegelAnalyticQuotient 1 n) := sorry

/-- Twists and Hecke commute when beta is central and alpha's positive norm condition
holds. The common transported datum and compact-open levels are omitted inputs. -/
theorem twist_hecke (P : ModuliParameters.{0}) (D : RationalPELDatum B V)
    (t : TwistData D) (η : rationalFamilyFunctor P D (twistLevel P D) ⟶
      rationalFamilyFunctor P D (twistLevel P D)) :
    (twist P D t).hom ≫ η = η ≫ (twist P D t).hom := sorry
end PELModuli
end

/-- The rank-one torus datum is the same datum used to construct the CM quasi-isogeny
functor. The compact-open torus level, base identification and CM star are omitted inputs. -/
theorem cmModuli_eq_pel {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    [StarRing F] (Φ : GeneralizedCMType F 1) (p n : ℕ)
    (K : Subgroup (PELDatum.similitudeGroup (cmRationalDatum Φ) (AwayAdeleRing (cmParameters Φ p n).box))) :
    Nonempty (cmFamilyFunctor Φ p n ≅
      PELModuli.rationalFamilyFunctor (cmParameters Φ p n) (cmRationalDatum Φ) K) := sorry

end FinalContracts

section StructuralContracts
namespace Supplier
/-- AA.1's actual affine group scheme and its geometric components. -/
def groupScheme (H : CommHopfAlgCat.{0} ℚ) (k : Type) [Field k] [Algebra ℚ k] : Scheme.{0} := sorry
/-- Primitive rational central-idempotent factors, with their Albert type and fixed-centre degree. -/
def factorCount {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (_D : RationalPELDatum B V) : ℕ := sorry
def factorType {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (_i : Fin (factorCount D)) : AlbertType := sorry
def factorFixedDegree {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (_i : Fin (factorCount D)) : ℕ := sorry
/-- Actual identity component, unipotent radical, derived group and simply connected cover,
with their structural morphisms, owned by AA.1. -/
def connectedGroup (H : CommHopfAlgCat.{0} ℚ) : CommHopfAlgCat.{0} ℚ := sorry
def unipotentRadical (_H : CommHopfAlgCat.{0} ℚ) : CommHopfAlgCat.{0} ℚ := sorry
def trivialGroup : CommHopfAlgCat.{0} ℚ := sorry
def derivedGroup (_H : CommHopfAlgCat.{0} ℚ) : CommHopfAlgCat.{0} ℚ := sorry
def simplyConnectedCover (_H : CommHopfAlgCat.{0} ℚ) : CommHopfAlgCat.{0} ℚ := sorry
def coverMap (H : CommHopfAlgCat.{0} ℚ) : H ⟶ simplyConnectedCover H := sorry
end Supplier

/-- Full structure theorem, componentwise over the actual central-idempotent factors.
The algebraic classification and characteristic-zero field are not replaced by matrices. -/
theorem similitudeGroupStructure {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] {V : Type*} [AddCommGroup V] [Module ℚ V]
    [Module B V] [IsScalarTower ℚ B V] (D : RationalPELDatum B V) :
    Nonempty (Supplier.unipotentRadical (Supplier.connectedGroup D.coordinate) ≅ Supplier.trivialGroup) ∧
    Nat.card (ConnectedComponents (Supplier.groupScheme D.coordinate ℂ)) =
      2 ^ (∑ i : Fin (Supplier.factorCount D), if Supplier.factorType D i = .D then
        Supplier.factorFixedDegree D i else 0) ∧
    ((∀ i : Fin (Supplier.factorCount D), Supplier.factorType D i ≠ .D) →
      IsIso (Supplier.coverMap (Supplier.derivedGroup D.coordinate))) := sorry

namespace Supplier
/-- D5's actual Siegel Shimura datum and D4's isomorphisms of rational algebraic data.
The datum carrier is imported, including its domain, weight and SV1--SV3. -/
def siegelShimuraDatum (_g : ℕ) : SupplierShimuraDatum := sorry
def shimuraIso (_D _D' : SupplierShimuraDatum) : Type := sorry
end Supplier

theorem siegelDatum_shimura (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) (hg : 0 < g) :
    Nonempty (Supplier.shimuraIso (siegelRationalDatum g d hd hg).toShimuraDatum
      (Supplier.siegelShimuraDatum g)) := sorry

/-- IntegralLattices owns alternating Smith elementary divisors. This records the actual
ordered symplectic type of the full rank-2g Gram matrix, with each invariant repeated twice. -/
def siegelElementaryDivisors (g : ℕ) (_d : Fin g → ℤ) : Fin g → ℕ := sorry

theorem siegelDatum_type (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i)
    (_hdiv : ∀ i j : Fin g, i ≤ j → d i ∣ d j) :
    siegelElementaryDivisors g d = fun i => (d i).natAbs := sorry

section
variable {K : Type} [Field K] [NumberField K] [NumberField.IsCMField K] [StarRing K]
  {W : Type} [AddCommGroup W] [Module ℚ W] [Module K W] [IsScalarTower ℚ K W]
namespace Supplier
/-- AA.1's GU coordinate algebra of this exact CM-hermitian form. -/
def unitaryCoordinate (_H : HermitianSpace K W) : CommHopfAlgCat.{0} ℚ := sorry
/-- Generalized CM signature induced by the actual compatible h. -/
def unitaryCMType (H : HermitianSpace K W) (δ : K) :
    GeneralizedCMType K (Module.finrank K W) := sorry
/-- Same integral unitary lattice/h datum, with its good base and level n. -/
def unitaryParameters (_H : HermitianSpace K W) (_δ : K) (_n : ℕ) : ModuliParameters.{0} := sorry
end Supplier

theorem unitaryDatum_group (H : HermitianSpace K W) (δ : K) :
    Nonempty ((unitaryRationalDatum H δ).coordinate ≅ Supplier.unitaryCoordinate H) := sorry

/-- CM star, delta=-star(delta), nondegeneracy and positive h are omitted source hypotheses. -/
theorem unitaryDatum_signature (H : HermitianSpace K W) (δ : K) (τ : K →+* ℂ) :
    ((unitaryRationalDatum H δ).signature K τ).1 = (Supplier.unitaryCMType H δ).coeff τ ∧
    ((unitaryRationalDatum H δ).signature K τ).2 =
      (Supplier.unitaryCMType H δ).coeff (NumberField.ComplexEmbedding.conjugate τ) := sorry

/-- The dimension of the moduli domain, not the dimension of an abelian fibre.
A CM type Phi containing one embedding per conjugate pair is an omitted input condition. -/
theorem unitaryDatum_relDim (H : HermitianSpace K W) (δ : K) (n : ℕ)
    (Φ : Finset (K →+* ℂ)) (k : Type) [Field k] [Algebra ℚ k] :
    Module.finrank k (Supplier.cotangent (PELModuli.representingSpace
      (Supplier.unitaryParameters H δ n)).space (.of k)) =
      ∑ τ ∈ Φ, ((unitaryRationalDatum H δ).signature K τ).1 *
        ((unitaryRationalDatum H δ).signature K τ).2 := sorry

theorem unitaryDatum_badPrimes (n disc index p : ℕ) :
    PELDatum.IsGoodPrime n 1 disc index p ↔ ¬ p ∣ n * disc * index := by
  simp [PELDatum.IsGoodPrime, PELDatum.badPrimeInteger]

/-- The exact generalized-CM reflex field; the embedding of K in C is fixed. -/
theorem unitaryDatum_reflex_general (H : HermitianSpace K W) (δ : K) :
    (unitaryRationalDatum H δ).reflexField.toSubfield = (Supplier.unitaryCMType H δ).reflexField := sorry

/-- Connected GU and its centre, under the prescribed CM simple algebra. Odd rank gives
an actual bijection of ker1, whereas even rank gives a singleton. AA.4 supplies the centre. -/
def Supplier.centralCoordinate (_H : HermitianSpace K W) : CommHopfAlgCat.{0} ℚ := sorry

theorem unitaryDatum_ker1 (H : HermitianSpace K W) (δ : K) :
    (Even (Module.finrank K W) → Subsingleton (PELModuli.ker1 (unitaryRationalDatum H δ))) ∧
    (Odd (Module.finrank K W) → Nonempty (PELModuli.ker1 (unitaryRationalDatum H δ) ≃
      Supplier.KerOne (Supplier.centralCoordinate H))) := sorry
end

end StructuralContracts

section IntegralSplitting
namespace Supplier
/-- Actual integer ring of the finite unramified compositum Qp-diamond inside a fixed
algebraic closure, and its integral embeddings of the CM order. -/
def diamondIntegerRing (_F : Type) [Field _F] [NumberField _F] (_p : ℕ) : Type := sorry
instance diamondIntegerCommRing (F : Type) [Field F] [NumberField F] (p : ℕ) :
    CommRing (diamondIntegerRing F p) := sorry
instance diamondIntegerAlgebra (F : Type) [Field F] [NumberField F] (p : ℕ) :
    Algebra ℤ (diamondIntegerRing F p) := Ring.toIntAlgebra _
def diamondEmbeddings (F : Type) [Field F] [NumberField F] (p : ℕ) :
    Fin (Module.finrank ℚ F) → (𝓞 F →+* diamondIntegerRing F p) := sorry
end Supplier

/-- Unramified p and compatibility of the integer ring/embeddings are omitted. The actual
finite-etale CM-order algebra splits even after a nonreduced coefficient base change. -/
def unramifiedTauDecomposition (F : Type) [Field F] [NumberField F]
    [NumberField.IsCMField F] (p : ℕ) [Fact p.Prime] :
    (Supplier.diamondIntegerRing F p ⊗[ℤ] 𝓞 F) ≃ₐ[Supplier.diamondIntegerRing F p]
      (Fin (Module.finrank ℚ F) → Supplier.diamondIntegerRing F p) := sorry

/-- The summation isomorphism onto M supplied by the orthogonal idempotent decomposition
of the actual split CM algebra. Compatible module action and the unramified base are omitted. -/
def tauPart_decomp (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (p : ℕ) [Fact p.Prime] (M : Type) [AddCommGroup M]
    [Module (Supplier.diamondIntegerRing F p) M] [Module (𝓞 F) M] :
    (∀ i : Fin (Module.finrank ℚ F), tauPart (M := M) (Supplier.diamondEmbeddings F p i)) ≃+ M := sorry

namespace Supplier
/-- The actual Frobenius scalar pullback, retaining its CM-order module action. -/
def frobeniusModule {OF k : Type} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] (M : Type) [AddCommGroup M] [Module k M] [Module OF M] : Type := sorry
instance frobeniusModuleAdd {OF k : Type} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] (M : Type) [AddCommGroup M] [Module k M] [Module OF M] :
    AddCommGroup (frobeniusModule (OF := OF) (k := k) p M) := sorry
instance frobeniusModuleK {OF k : Type} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] (M : Type) [AddCommGroup M] [Module k M] [Module OF M] :
    Module k (frobeniusModule (OF := OF) (k := k) p M) := sorry
instance frobeniusModuleOF {OF k : Type} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] (M : Type) [AddCommGroup M] [Module k M] [Module OF M] :
    Module OF (frobeniusModule (OF := OF) (k := k) p M) := sorry
end Supplier

/-- The tau component after Frobenius pullback is the pullback of the inverse-Frobenius
component. Perfection and the split CM action are imposed here, rather than a numeric rank. -/
def tauPart_frobeniusAddEquiv {OF k : Type} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] [PerfectRing k p] (M : Type) [AddCommGroup M] [Module k M] [Module OF M]
    (τ : OF →+* k) (τ' : OF →+* k) (_hτ : frobeniusOnEmbeddings p τ' = τ) :
    tauPart (M := Supplier.frobeniusModule (OF := OF) (k := k) p M) τ ≃+
      tauPart (M := M) τ' := sorry
end IntegralSplitting

section SheafDeterminant
/-- AlgebraicVectorBundles supplies locally finite free sheaf determinants; apply the
existing generic determinant to the finite family of sheaf endomorphisms on affine charts
and glue its coefficients. Local finite freeness of M is an omitted prototype hypothesis. -/
def detPoly_sheaf (S : Scheme.{u}) (M : S.Modules) {ι : Type u} [Fintype ι]
    (_a : ι → (M ⟶ M)) (U : TopologicalSpace.Opens S) : MvPolynomial ι (S.presheaf.obj (.op U)) := sorry

theorem detPoly_sheaf_restrict (S : Scheme.{u}) (M : S.Modules) {ι : Type u} [Fintype ι]
    (a : ι → (M ⟶ M)) {U V : TopologicalSpace.Opens S} (h : U ≤ V) :
    MvPolynomial.map (S.presheaf.map (homOfLE h).op).hom (detPoly_sheaf S M a V) =
      detPoly_sheaf S M a U := sorry
end SheafDeterminant

section CMArithmeticContracts
namespace Supplier
/-- The selected CM type’s reflex field, with its integral p-local base in cmParameters
(LTXZZ published Definition 3.5.4, pp.157–158). This is distinct from reflexiveClosure. -/
def cmBaseField {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) : Subfield ℂ := Φ.reflexField
-- Regression: the base uses the selected type, not the separate reflexive closure.
example {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) : cmBaseField Φ = Φ.reflexField := rfl
/-- Geometric Galois action induced by the finite etale CM scheme. -/
def cmGaloisAction {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ)
    (_σ : AlgebraicClosure (cmBaseField Φ) ≃ₐ[cmBaseField Φ] AlgebraicClosure (cmBaseField Φ)) :
    cmGeometricPoints Φ p n → cmGeometricPoints Φ p n := sorry
/-- The CM reflex norm composed with Artin reciprocity, with V4/V5's sign normalization. -/
def cmReciprocity {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) :
    (AlgebraicClosure (cmBaseField Φ) ≃ₐ[cmBaseField Φ] AlgebraicClosure (cmBaseField Φ)) →*
      cmGamma Φ p n := sorry
end Supplier

theorem cmModuli_reciprocity {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ)
    (σ : AlgebraicClosure (Supplier.cmBaseField Φ) ≃ₐ[Supplier.cmBaseField Φ]
      AlgebraicClosure (Supplier.cmBaseField Φ)) (x : cmGeometricPoints Φ p n) :
    Supplier.cmGaloisAction Φ p n σ x = Supplier.cmReciprocity Φ p n σ • x := sorry

namespace Supplier
/-- Underlying point of the actual finite-etale T1 representative evaluated at Spec C. -/
def cmComplexPoint {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) (φ : (cmParameters Φ p n).R₀ →+* ℂ)
    (_x : (cmFamilyFunctor Φ p n).obj (.op (Over.mk (Spec.map (CommRingCat.ofHom φ))))) :
    (cmModuli1 Φ p n).model.left := sorry
/-- Neutral class of the actual rank-one torus in continuous nonabelian H1. -/
def cmNeutral {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] [StarRing F]
    (Φ : GeneralizedCMType F 1) : PELModuli.ker1 (cmRationalDatum Φ) := sorry
end Supplier

def cmSelectedPoints {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] [StarRing F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) (φ : (cmParameters Φ p n).R₀ →+* ℂ) :
    Set (cmModuli1 Φ p n).model.left :=
  {z | ∃ x, Supplier.cmComplexPoint Φ p n φ x = z ∧ cmModuli1_w Φ p n φ x = Supplier.cmNeutral Φ}

theorem cmModuli_minimal {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] [StarRing F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) (φ : (cmParameters Φ p n).R₀ →+* ℂ) :
    cmSelectedPoints Φ p n φ ⊆ Set.range (cmModuli Φ p n).hom.base ∧
      ∀ U : Set (cmModuli1 Φ p n).model.left, IsOpen U → IsClosed U →
        cmSelectedPoints Φ p n φ ⊆ U → Set.range (cmModuli Φ p n).hom.base ⊆ U := sorry
end CMArithmeticContracts

section LocalOrderContracts
namespace Supplier
/-- Completed full order Zp tensor O and the integer ring of a finite unramified extension
of degree f. LocalFieldsRamification supplies the latter with its actual fraction/residue fields. -/
def completedOrder {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] (_O : StarOrder B) (_p : ℕ) : Type := sorry
instance completedOrderRing {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] (O : StarOrder B) (p : ℕ) : Ring (completedOrder O p) := sorry
instance completedOrderAlgebra {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] (O : StarOrder B) (p : ℕ) [Fact p.Prime] :
    Algebra ℤ_[p] (completedOrder O p) := sorry

def unramifiedIntegers (_p _f : ℕ) : Type := sorry
instance unramifiedIntegersRing (p f : ℕ) : CommRing (unramifiedIntegers p f) := sorry
instance unramifiedIntegersAlgebra (p f : ℕ) [Fact p.Prime] :
    Algebra ℤ_[p] (unramifiedIntegers p f) := sorry
end Supplier

namespace Order
/-- Integral maximality: quantify over all full overorders, without assuming star stability. -/
theorem maximality_of_not_dvd_disc {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] (O : StarOrder B)
    {ι : Type} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℤ O.carrier)
    (p : ℕ) [Fact p.Prime] (hp : ¬ p ∣ (disc (fun i => (b i : B))).num.natAbs)
    (O' : Subring B) (_hfg : (Submodule.span ℤ (O' : Set B)).FG)
    (_hspan : Submodule.span ℚ (O' : Set B) = ⊤) (_hle : O.carrier ≤ O') :
    ¬ p ∣ O.carrier.toAddSubgroup.relIndex O'.toAddSubgroup := sorry

/-- The full integral matrix-order decomposition, not only a decomposition of generic Bp.
All unramified factors and their completions are those supplied by the local-field owner. -/
theorem matrixOrder_of_not_dvd_disc {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] (O : StarOrder B)
    {ι : Type} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℤ O.carrier)
    (p : ℕ) [Fact p.Prime] (hp : ¬ p ∣ (disc (fun i => (b i : B))).num.natAbs) :
    ∃ (r : ℕ) (n f : Fin r → ℕ), (∀ i, 0 < n i ∧ 0 < f i) ∧
      Nonempty (Supplier.completedOrder O p ≃ₐ[ℤ_[p]]
        Π i, Matrix (Fin (n i)) (Fin (n i)) (Supplier.unramifiedIntegers p (f i))) := sorry
end Order
end LocalOrderContracts

/-! Named unit tests of the relative and arithmetic interfaces. Conditions referring to
future supplier notions are omitted exactly as listed in the reader's prototype table. -/
section RelativeTests
namespace Supplier
/-- Actual geometric degree of the integral polarization of a relative triple. -/
def triplePolarizationDegree {P : ModuliParameters.{u}} {S : Over P.base}
    (_ξ : PELModuli.Triple P S) (_s : GeometricPoint S.left) : ℕ := sorry
/-- The canonical zero abelian scheme/triple, with the prescribed zero datum. -/
def zeroTriple (P : ModuliParameters.{u}) (S : Over P.base) : PELModuli.Triple P S := sorry
end Supplier

-- Unit test: symplecticIsom_relative_torsor
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Triple P S)
    (s : GeometricPoint S.left) (x y : symplecticIsomSheaf.stalk ξ s) :
    ∃! g : (Supplier.integralSimilitudes P)ᵐᵒᵖ, g • x = y := sorry

-- Unit test: symplecticIsom_relative_monodromy
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Triple P S)
    (s : GeometricPoint S.left) (σ : Supplier.etaleFundamentalGroup S.left s)
    (g : (Supplier.integralSimilitudes P)ᵐᵒᵖ) (x : symplecticIsomSheaf.stalk ξ s) :
    σ • (g • x) = g • (σ • x) := sorry

/-- Principal genus-one lattice, degree l^2 polarization, l away from box: the completed
pairing types differ. Positive l prime and the specific Siegel datum are omitted inputs. -/
-- Unit test: symplecticIsom_relative_empty
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Triple P S)
    (s : GeometricPoint S.left) (ℓ : ℕ) (hℓ : ℓ.Prime) (hbox : ℓ ∉ P.box)
    (hdegree : Supplier.triplePolarizationDegree ξ s = ℓ ^ 2) :
    IsEmpty (symplecticIsomSheaf.stalk ξ s) := sorry

-- Unit test: principalLevel_relative_pairing
example {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    {n : ℕ} (α : PrincipalLevel ξ n) :
    PrincipalLevel.weilPairing ξ n = PrincipalLevel.transportedPairing α := sorry

-- Unit test: principalLevel_relative_lift
example {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    {n : ℕ} (α : PrincipalLevel ξ n) (s : GeometricPoint S.left) :
    Nonempty (PrincipalLevel.reductionFibre α s) := sorry

-- Unit test: principalLevel_relative_kernel
example {P : ModuliParameters.{u}} {S : Over P.base} {ξ : PELModuli.Triple P S}
    (α : PrincipalLevel ξ 1) (s : GeometricPoint S.left) :
    Nonempty (PrincipalLevel.polarizationKernel ξ s ≅ PrincipalLevel.latticeKernel S s) := sorry

/-- For full completed integral level and an everywhere liftable triple. -/
-- Unit test: level_full_unique
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Triple P S)
    (hlift : ∀ s, Nonempty (symplecticIsomSheaf.stalk ξ s)) : Subsingleton (IntegralLevel ξ) := sorry

/-- For H=U(n); no identification is asserted for arbitrary H. -/
-- Unit test: level_principal_eq
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Triple P S) :
    Nonempty (IntegralLevel ξ ≃ PrincipalLevel ξ P.n) := sorry

/-- Same principal genus-one datum over C and a polarization of degree l^2. -/
-- Unit test: rationalLevel_not_integral
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Triple P S)
    (s : GeometricPoint S.left) (ℓ : ℕ) (hℓ : ℓ.Prime) (hbox : ℓ ∉ P.box)
    (hdegree : Supplier.triplePolarizationDegree ξ s = ℓ ^ 2)
    (β : RelativeRationalLevel ξ) : ¬ RelativeRationalLevel.MatchesIntegralLattices β := sorry

section
variable {B : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] {V : Type u} [AddCommGroup V] [Module ℚ V]
  [Module B V] [IsScalarTower ℚ B V]

-- Unit test: rationalLevel_change_compose
example (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K K' K'' : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (h : K' ≤ K) (h' : K'' ≤ K') :
    PELModuli.forgetLevel P D K' K'' h' ≫ PELModuli.forgetLevel P D K K' h =
      PELModuli.forgetLevel P D K K'' (h'.trans h) := sorry

/-- Actual level scalar translation of the same quasi-isogeny object. -/
def PELModuli.scalarTranslate (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (S : Over P.base)
    (_m : ℕ) (_ξ : PELModuli.ratModuliProblem P D K S) : PELModuli.ratModuliProblem P D K S := sorry

-- Unit test: ratModuli_scalar_iso
example (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) (S : Over P.base)
    (m : ℕ) (hm : 0 < m) (hbox : ∀ p ∈ P.box, ¬ p ∣ m)
    (ξ : PELModuli.ratModuliProblem P D K S) :
    Nonempty (ξ ≅ PELModuli.scalarTranslate P D K S m ξ) := sorry

-- Unit test: ratModuli_siegel_kottwitz
example (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) :
    Nonempty (PELModuli.rationalFamilyFunctor P D K ≅ PELModuli.kottwitzFamilyFunctor P D K) := sorry

-- Unit test: ratModuli_lattice_indep
example (P P' : ModuliParameters.{u}) (e : P.base ≅ P'.base) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (K' : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P'.box))) :
    Nonempty (PELModuli.rationalFamilyFunctor P D K ≅
      (Over.map e.hom).op ⋙ PELModuli.rationalFamilyFunctor P' D K') := sorry

-- Supporting calculation for heckeTranslate_id.
example (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (e : PELModuli.rationalFamilyFunctor P D (PELModuli.heckeLevel P D K 1) ≅
      PELModuli.rationalFamilyFunctor P D K) : PELModuli.heckeTranslate P D K 1 = e.hom := sorry

/-- For the positive rational scalar g=m, the corresponding isomorphism e is [m]. -/
-- Supporting calculation for heckeTranslate_siegel_scalar.
example (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (g : PELDatum.similitudeGroup D (AwayAdeleRing P.box))
    (e : PELModuli.rationalFamilyFunctor P D (PELModuli.heckeLevel P D K g) ≅
      PELModuli.rationalFamilyFunctor P D K) : PELModuli.heckeTranslate P D K g = e.hom := sorry

-- Unit test: hecke_matrices_noncommute
example : (!![(1 : ℚ), 1; 0, 1] * !![(1 : ℚ), 0; 1, 1]) ≠
    (!![(1 : ℚ), 0; 1, 1] * !![(1 : ℚ), 1; 0, 1]) := by native_decide
end
end RelativeTests

section ArithmeticTests
-- Unit test: siegelDatum_index_12
example : (siegelIntegralDatum 2 ![1, 2] (by intro i; fin_cases i <;> norm_num)).dualIndex = 4 := sorry
-- Unit test: siegelDatum_principal_good
example (p : ℕ) (hp : p.Prime) : PELDatum.IsGoodPrime 1 1 1 1 p := sorry
-- Unit test: siegelDatum_shimura_indep
example (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) (hg : 0 < g) :
    Nonempty (Supplier.shimuraIso (siegelRationalDatum g d hd hg).toShimuraDatum
      (Supplier.siegelShimuraDatum g)) := sorry
-- Unit test: siegelDatum_not_type_unordered
example : ¬ (∀ i j : Fin 2, i ≤ j → (![2, 1] : Fin 2 → ℤ) i ∣ ![2, 1] j) := by
  intro h
  have := h 0 1 (by decide)
  norm_num at this

-- Unit test: unitaryDatum_picard_reflex
example (K : Type) [Field K] [NumberField K] [NumberField.IsCMField K] [StarRing K] [Fact (Module.finrank ℚ K = 2)]
    (τ : K →ₐ[ℚ] ℂ) : (imaginaryQuadraticDatum K 2 1 (by norm_num)).reflexField = τ.fieldRange := sorry
-- Unit test: unitaryDatum_U11
example (K : Type) [Field K] [NumberField K] [NumberField.IsCMField K] [StarRing K] [Fact (Module.finrank ℚ K = 2)] :
    (imaginaryQuadraticDatum K 1 1 (by norm_num)).reflexField = ⊥ := sorry
-- Unit test: unitaryDatum_wrong_delta
example : ¬ (star (1 : ℂ) = -(1 : ℂ)) := by norm_num

-- Unit test: hodgeLine_g1
example (k : Type u) [Field k] (A : AbelianScheme (Spec (.of k)))
    (hdim : Module.finrank k ((Supplier.abelianSupplier (.of k)).lie A) = 1) :
    Nonempty (hodgeLine A ≅ hodgeBundle A) := sorry
-- Unit test: hodgeLine_product_test
example {S : Scheme.{u}} (A B : AbelianScheme S) :
    Nonempty (hodgeLine (Supplier.abelianProduct A B) ≅
      Supplier.moduleTensor (hodgeLine A) (hodgeLine B)) := sorry
-- Unit test: hodgeBundle_mul_p_not_iso
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    (𝒜 : AbelianSchemeSupplier (.of k)) (A : AbelianScheme (Spec (.of k)))
    (hdim : Module.finrank k (𝒜.lie A) = 1) :
    ¬ IsIso (hodgeBundle_isogeny (𝒜.mulBy A p)) := sorry
namespace Supplier
/-- AlgebraicVectorBundles/A4's zero O_S-module sheaf. -/
def zeroModule (S : Scheme.{u}) : S.Modules := sorry
end Supplier
-- Unit test: hodgeBundle_zero
example (k : Type u) [Field k] (A : AbelianScheme (Spec (.of k)))
    (hdim : Module.finrank k ((Supplier.abelianSupplier (.of k)).lie A) = 0) :
    Nonempty (hodgeBundle A ≅ Supplier.zeroModule (Spec (.of k))) := sorry

-- Unit test: export_classify_universal
example {P : ModuliParameters.{u}} (S : Over P.base)
    (t : (Supplier.spaceFunctor (PELModuli.representingSpace P).space).obj (.op S)) :
    PELModuli.classifyingMap ((PELModuli.universal P).pullback S t) = t := sorry
-- Unit test: export_model_point
example (P : ModuliParameters.{u}) (k : Type u) [Field k] (φ : P.R₀ →+* k)
    (ξ : PELModuli.Family P (Over.mk (Spec.map (CommRingCat.ofHom φ)))) :
    (Supplier.spaceFunctor (PELModuli.coarseSpace P)).obj
      (.op (Over.mk (Spec.map (CommRingCat.ofHom φ)))) := PELModuli.moduliPoint ξ
-- Unit test: export_not_family
example (P : ModuliParameters.{u}) (k : Type u) [Field k] (φ : P.R₀ →+* k)
    (x : (Supplier.spaceFunctor (PELModuli.coarseSpace P)).obj
      (.op (Over.mk (Spec.map (CommRingCat.ofHom φ)))))
    (h : IsEmpty (Supplier.coarseGerbeObjects P k φ x)) :
    ¬ ∃ ξ : PELModuli.Family P (Over.mk (Spec.map (CommRingCat.ofHom φ))),
      PELModuli.moduliPoint ξ = x := sorry
-- Unit test: export_classify_pullback
example {P : ModuliParameters.{u}} {S : Over P.base} (ξ : PELModuli.Family P S) :
    Nonempty (ξ ≅ (PELModuli.universal P).pullback S (PELModuli.classifyingMap ξ)) := sorry
end ArithmeticTests

section RemainingContracts
/-- Restrict the actual order action along a star-preserving inclusion. The action supplied
on L is its restriction; full-suborder status is an omitted arithmetic condition. -/
def IntegralPELDatum.ofSubOrder {O O' L : Type*} [Ring O] [StarRing O] [Ring O']
    [StarRing O'] [AddCommGroup L] [Module O L] [Module O' L]
    (D : IntegralPELDatum O L) (φ : O' →+* O)
    (_hstar : ∀ b, φ (star b) = star (φ b))
    (_hact : ∀ (b : O') (x : L), b • x = φ b • x) : IntegralPELDatum O' L := sorry

theorem IntegralPELDatum.ofSubOrder_form {O O' L : Type*} [Ring O] [StarRing O] [Ring O']
    [StarRing O'] [AddCommGroup L] [Module O L] [Module O' L]
    (D : IntegralPELDatum O L) (φ : O' →+* O)
    (hstar : ∀ b, φ (star b) = star (φ b)) (hact : ∀ (b : O') (x : L), b • x = φ b • x) :
    (D.ofSubOrder φ hstar hact).form = D.form ∧ (D.ofSubOrder φ hstar hact).J = D.J := sorry

namespace Supplier
/-- AA.1/Tau Ceti GSp coordinate Hopf algebra for the standard rank-2g form. -/
def siegelCoordinateGSp (_g : ℕ) : CommHopfAlgCat.{0} ℚ := sorry
end Supplier

theorem siegelDatum_coordinate (g : ℕ) (d : Fin g → ℤ) (hd : ∀ i, 0 < d i) (hg : 0 < g) :
    Nonempty ((siegelRationalDatum g d hd hg).coordinate ≅ Supplier.siegelCoordinateGSp g) := sorry

namespace Supplier
/-- D4's GU Shimura datum with the actual hermitian signatures. Its SV3 nontriviality on
each rational simple adjoint factor is required; definite rank >=2 is excluded. -/
def unitaryShimuraDatum {K : Type} [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] {W : Type} [AddCommGroup W] [Module ℚ W] [Module K W]
    [IsScalarTower ℚ K W] (_H : HermitianSpace K W) (_δ : K) : SupplierShimuraDatum := sorry
end Supplier

/-- CM conjugation, anti-invariant nonzero delta, positive h and SV3 are omitted prototype
hypotheses; they are stated in the node. Rank-one definite tori satisfy SV3 vacuously. -/
theorem unitaryDatum_shimura {K : Type} [Field K] [NumberField K] [NumberField.IsCMField K]
    [StarRing K] {W : Type} [AddCommGroup W] [Module ℚ W] [Module K W]
    [IsScalarTower ℚ K W] (H : HermitianSpace K W) (δ : K) :
    Nonempty (Supplier.shimuraIso (unitaryRationalDatum H δ).toShimuraDatum
      (Supplier.unitaryShimuraDatum H δ)) := sorry

namespace LocalizedOFAbelianScheme
section
variable {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u} [CommRing OF]
  (𝒜 : AbelianSchemeSupplier R) (X : LocalizedOFAbelianScheme (R := R) P OF)
  [Module.Free R (𝒜.lie X.A)] [Module.Finite R (𝒜.lie X.A)]
  {ι : Type u} [Fintype ι] [DecidableEq ι] (τ : ι → OF →+* R) (r : ι → ℕ)

/-- A full integral basis suffices to test the entire polynomial law, including nilpotents. -/
theorem iff_detCondition {κ : Type u} [Fintype κ] [DecidableEq κ] (a : κ → OF)
    (_ha : Submodule.span ℤ (Set.range a) = ⊤) : HasSignatureType 𝒜 X τ r ↔
    detPoly (fun j => Supplier.endTensorLie P X.base 𝒜 X.A (X.action (a j))) =
      ∏ i, (∑ j, MvPolynomial.C (τ i (a j)) * MvPolynomial.X j) ^ r i := sorry

theorem dim [Nontrivial R] (_h : HasSignatureType 𝒜 X τ r) :
    Module.finrank R (𝒜.lie X.A) = ∑ i, r i := sorry
end
end LocalizedOFAbelianScheme

namespace Supplier
/-- The actual tau component of the Hodge submodule in covariant de Rham homology. -/
def localizedHodgeTau {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (_X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (_τ : OF →+* R) : ModuleCat.{u} R := sorry
end Supplier

namespace LocalizedUnitaryOFAbelianScheme
section
variable {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u} [CommRing OF] [StarRing OF]
  (𝒜 : AbelianSchemeSupplier R) (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF)

/-- The full CM-order splitting, distinct conjugate embeddings and constant central rank N
are omitted. These are ranks of actual Hodge, homology and Lie components, respectively. -/
theorem hodge_tau (τ : OF →+* R) (N r : ℕ) :
    Module.finrank R (Supplier.localizedHodgeTau 𝒜 X τ) = N - r ∧
    Module.finrank R (Supplier.localizedDeRhamTau 𝒜 X τ) = N ∧
    Module.finrank R (Supplier.localizedLieTau 𝒜 X τ) = r := sorry

def pairingTau (τ τc : OF →+* R) :
    Supplier.localizedDeRhamTau 𝒜 X τ →ₗ[R]
      Module.Dual R (Supplier.localizedDeRhamTau 𝒜 X τc) := sorry

/-- P=Z_(p), tau^c conjugate to tau, unramified splitting and a unit clearing factor on the
base are omitted. Prime-to-p requires a prime-to-p quasi-isogeny AND inverse. -/
theorem pairingTau_perfect (p : ℕ) [Fact p.Prime] [CharP R p]
    (τ τc : OF →+* R) (_hp : X.quasiPolarization.IsPrimeTo 𝒜 {p}) :
    Function.Bijective (pairingTau 𝒜 X τ τc) := sorry
end
end LocalizedUnitaryOFAbelianScheme

namespace PELModuli
/-- Extension from a normal source, distinct from the integral-factor universal property.
j identifies the generic fibre of the normal, flat source over a Dedekind base; a is its
specified lift to the generic PEL cover. These base/generic-fibre conditions are omitted. -/
theorem normalizedModel_normalSource {Y M T U : Scheme.{u}} (f : Y ⟶ M)
    [QuasiCompact f] [QuasiSeparated f] (j : U ⟶ T) (a : U ⟶ Y) (t : T ⟶ M)
    (_hnormal : ∀ x : T, IsIntegrallyClosed (T.presheaf.stalk x))
    (_hcomm : a ≫ f = j ≫ t) :
    ∃! g : T ⟶ normalizedModel f,
      j ≫ g = a ≫ normalizedModel_generic f ∧ g ≫ normalizedModel_toGood f = t := sorry
end PELModuli

namespace Supplier
/-- Actual Betti homology with the OF action; C=OF tensor Af uses that action, rather than
an unrelated scalar extension of the underlying Z-module. A4 owns Betti/etale comparison. -/
def bettiHomology (_A : AbelianScheme (Spec (.of ℂ))) (C : CommRingCat.{0}) : ModuleCat.{0} C := sorry
end Supplier

/-- Betti--etale comparison on the actual polarization-adjoint Hom, preserving its pairing.
The rank-one source, OF-coefficient algebra and positivity are omitted prototype hypotheses. -/
def hermitianHomOfAbelianSchemes_complex (A₀ A : AbelianScheme (Spec (.of ℂ)))
    (C : CommRingCat.{0}) :
    (Supplier.bettiHomology A₀ C →ₗ[C] Supplier.bettiHomology A C) ≃ₗ[C]
      (Supplier.etaleHomology A₀ C →ₗ[C] Supplier.etaleHomology A C) := sorry

namespace Supplier
/-- Surjectivity of the actual endomorphism base-change ring map. -/
def endomorphismBaseChange {g d : ℕ} {k K : Type u} [Field k] [Field K] [Algebra k K]
    (η : PolarizedObject g d k) : AbelianScheme.End η.A →+*
      AbelianScheme.End (polarizedBaseChange.obj η : PolarizedObject g d K).A := sorry

end Supplier

/-- Tsimerman Lemma 4.1, p.384, including the endomorphism descent used for polarizations.
Silverberg's input is imported through A6. K is an algebraic closure in characteristic zero. -/
theorem boundedFieldOfDefinition_endomorphisms {g d : ℕ} {k K : Type u} [Field k] [Field K]
    [Algebra k K] [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]
    (ξ : PolarizedObject g d K) :
    ∃ L : IntermediateField (fieldOfModuli (k := k) ξ) K,
      Module.finrank (fieldOfModuli (k := k) ξ) L ≤ 2 * 3 ^ (4 * g ^ 2) ∧
        ∃ η : PolarizedObject g d L, Nonempty (polarizedBaseChange.obj η ≅ ξ) ∧
          Function.Surjective (Supplier.endomorphismBaseChange (K := K) η) := sorry

/-- Actual signature-(1,1) Gaussian CM surface over a number field, with nonprincipal
polarization degree p^2 from the lattice <e1,p e2> and pairing divided by p. Construction is
by M3 uniformization plus M4 descent, after a finite extension; p is a good odd prime. -/
theorem nonprincipalUnitaryTypeExample (p : ℕ) [Fact p.Prime] (_hp : p ≠ 2) :
    ∃ (k : Type) (_ : Field k) (_ : NumberField k) (i : k), i ^ 2 = -1 ∧
      ∃ (X : UnitaryOFAbelianScheme (Supplier.abelianSupplier (.of k)) GaussianInt)
        (e : (Supplier.abelianSupplier (.of k)).lie X.A ≃ₗ[k] (Fin 2 → k)),
        (∀ x, e ((Supplier.abelianSupplier (.of k)).lieAct (X.i ⟨0, 1⟩) x) =
          ![i * e x 0, -i * e x 1]) ∧ X.pol.den = 1 ∧
        X.pol.num = (Supplier.abelianSupplier (.of k)).polarizationHom X.amplePolarization ∧
        ∀ s : Spec (.of k), X.pol.numeratorKernelDegree s = p ^ 2 := sorry

end RemainingContracts

section GeometricRegressionTests
section
variable {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] {V : Type} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

-- Unit test: heckeTranslate_right_order
example (P : ModuliParameters.{0}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (g h : PELDatum.similitudeGroup D (AwayAdeleRing P.box))
    (e : PELModuli.rationalFamilyFunctor P D (PELModuli.heckeLevel P D K (h * g)) ≅
      PELModuli.rationalFamilyFunctor P D (PELModuli.heckeLevel P D (PELModuli.heckeLevel P D K g) h)) :
    e.hom ≫ PELModuli.heckeTranslate P D (PELModuli.heckeLevel P D K g) h ≫
      PELModuli.heckeTranslate P D K g = PELModuli.heckeTranslate P D K (h * g) := sorry

-- Unit test: adelicModuli_coefficient_compare
-- The inverse limit and restricted product are those of this family's actual abelian scheme.
example (P : ModuliParameters.{0}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (S : Over P.base) (ξ : PELModuli.adelicModuli P D K S) (s : GeometricPoint S.left) :
    Nonempty ((ℚ ⊗[ℤ] PELModuli.Supplier.fullIntegralTate (PELModuli.adelicModuli.abelian ξ) s)
      ≃ₗ[ℚ] ((ModuleCat.restrictScalars (algebraMap ℚ (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))).obj
        (PELModuli.Supplier.fullTate (PELModuli.adelicModuli.abelian ξ) s))) := sorry

-- Unit test: adelicModuli_actual_hecke
example (P : ModuliParameters.{0}) (D : RationalPELDatum B V)
    (K K' : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)))
    (g : PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ)) (S : Over P.base)
    (ξ : PELModuli.adelicModuli P D K' S) (s : GeometricPoint S.left) :
    PELModuli.adelicModuli.heckeOrbit (K := K) g ξ s =
      (fun η => (g.val.1.trans η.1, g.val.2 * η.2)) '' PELModuli.adelicModuli.levelOrbit ξ s := sorry

-- Unit test: uniformization_all_pieces
example (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty (PELModuli.complexPointsSet P φ ≃
      Σ i : PELModuli.ker1 D, PELModuli.twistedDoubleCoset D i K) := sorry

-- Unit test: uniformization_family_pullback
example (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) (D : RationalPELDatum B V)
    (i : PELModuli.ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty ((Over.pullback (PELModuli.uniformization P φ D i K)).obj
      (PELModuli.analyticUniversal P φ) ≅ PELModuli.analyticFamily D i K) := sorry

-- Unit test: twist_identity
example (P : ModuliParameters.{0}) (D : RationalPELDatum B V) :
    PELModuli.twist P D (PELModuli.identityTwist D) = Iso.refl _ := sorry

-- Unit test: twist_polarization_positive
example (D : RationalPELDatum B V) (t : PELModuli.TwistData D)
    (τ : Subalgebra.center ℚ B →ₐ[ℚ] ℂ) : 0 < (τ ⟨t.a, t.central⟩).re := t.positive τ

-- Unit test: twist_needs_positivity
example (D : RationalPELDatum B V) (t : PELModuli.TwistData D)
    (τ : Subalgebra.center ℚ B →ₐ[ℚ] ℂ) : (t.a : B) ≠ -1 := sorry
end

-- Unit test: uniformization_g1
example (n : ℕ) (φ : (siegelParameters 1 (fun _ => 1) n).R₀ →+* ℂ) :
    Nonempty (Supplier.analytification.obj
      (PELModuli.genericFibre (siegelParameters 1 (fun _ => 1) n) φ).model ≅
        Supplier.siegelAnalyticQuotient 1 n) := sorry

-- Unit test: normalizedModel_good_level
example (M : Scheme.{u}) (hnormal : ∀ x : M, IsIntegrallyClosed (M.presheaf.stalk x)) :
    IsIso (PELModuli.normalizedModel_toGood (𝟙 M)) := sorry

-- Unit test: normalizedModel_integral_factor
example {Y M T : Scheme.{u}} (f : Y ⟶ M) [QuasiCompact f] [QuasiSeparated f]
    (a : Y ⟶ T) (b : T ⟶ M) [IsIntegralHom b] (h : f = a ≫ b) :
    ∃! g : PELModuli.normalizedModel f ⟶ T,
      PELModuli.normalizedModel_generic f ≫ g = a ∧ g ≫ b = PELModuli.normalizedModel_toGood f := sorry

-- Unit test: normalizedModel_generic_factor
example {Y M : Scheme.{u}} (f : Y ⟶ M) [QuasiCompact f] [QuasiSeparated f] :
    PELModuli.normalizedModel_generic f ≫ PELModuli.normalizedModel_toGood f = f := sorry

section
variable {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
  (Φ : GeneralizedCMType F 1) (p n : ℕ)

-- Unit test: cmModuli_finite_etale
example : IsFinite (cmModuli1 Φ p n).model.hom ∧ Etale (cmModuli1 Φ p n).model.hom := sorry

-- Unit test: cmModuli_torus_torsor
example : MulAction.IsPretransitive (cmGamma Φ p n) (cmGeometricPoints Φ p n) ∧
    ∀ (g : cmGamma Φ p n) (x : cmGeometricPoints Φ p n), g • x = x → g = 1 := sorry

-- Unit test: cmModuli_reciprocity_test
example (σ : AlgebraicClosure (Supplier.cmBaseField Φ) ≃ₐ[Supplier.cmBaseField Φ]
    AlgebraicClosure (Supplier.cmBaseField Φ)) (x : cmGeometricPoints Φ p n) :
    Supplier.cmGaloisAction Φ p n σ x = Supplier.cmReciprocity Φ p n σ • x := sorry

-- Unit test: cmModuli_open_closed
example : IsOpenImmersion (cmModuli Φ p n).hom ∧ IsClosedImmersion (cmModuli Φ p n).hom := sorry
end

-- Unit test: torusTrace_trivial_group
example (Y : Scheme.{u}) (d : ℕ) (Λ : CommRingCat.{u}) (c : ConnectedComponents Y)
    (x : Supplier.compactTopCohomology Y d Λ) :
    torusTrace Y d Λ {c} x = Supplier.componentTrace Y d Λ c x := sorry

-- Unit test: torusTrace_two_orbits
example (Y : Scheme.{u}) [DecidableEq (ConnectedComponents Y)] (d : ℕ) (Λ : CommRingCat.{u}) (c c' : ConnectedComponents Y)
    (h : c ≠ c') (x : Supplier.compactTopCohomology Y d Λ) :
    torusTrace Y d Λ {c, c'} x =
      Supplier.componentTrace Y d Λ c x + Supplier.componentTrace Y d Λ c' x := sorry

-- Unit test: torusTrace_not_average
example (Y : Scheme.{0}) [DecidableEq (ConnectedComponents Y)] (d : ℕ) (c c' : ConnectedComponents Y) (h : c ≠ c')
    (x : Supplier.compactTopCohomology Y d (.of (ZMod 2)))
    (hc : Supplier.componentTrace Y d (.of (ZMod 2)) c x = 1)
    (hc' : Supplier.componentTrace Y d (.of (ZMod 2)) c' x = 1) :
    torusTrace Y d (.of (ZMod 2)) {c} x = 1 ∧
      torusTrace Y d (.of (ZMod 2)) {c, c'} x = 0 := sorry

-- Unit test: unitaryDatum_definite
example (K : Type) [Field K] [NumberField K] [NumberField.IsCMField K] [StarRing K] [Fact (Module.finrank ℚ K = 2)] :
    ∀ (R : Type*) [CommRing R] [Algebra ℚ R],
      Subsingleton ((Supplier.adjointDatum (imaginaryQuadraticDatum K 1 0 (by norm_num)).toShimuraDatum) →ₐ[ℚ] R) := sorry

section
variable {k K : Type u} [Field k] [Field K] [Algebra k K]
  [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]

-- Unit test: fieldOfModuli_residue_test
example (ξ : PolarizedObject 1 1 K) :
    fieldOfModuli (k := k) ξ = Supplier.coarsePointField (k := k) ξ := sorry

-- Unit test: fieldOfModuli_le
example {g d : ℕ} (ξ : PolarizedObject g d K) (L : IntermediateField k K)
    (η : PolarizedObject g d L) (h : Nonempty (polarizedBaseChange.obj η ≅ ξ)) :
    fieldOfModuli (k := k) ξ ≤ L := sorry

-- Unit test: fieldOfModuli_twist
example {g d : ℕ} (ξ η : PolarizedObject g d K) (h : Nonempty (ξ ≅ η)) :
    fieldOfModuli (k := k) ξ = fieldOfModuli (k := k) η := sorry

-- Unit test: fieldOfModuli_base
example {g d : ℕ} (ξ : PolarizedObject g d k) :
    fieldOfModuli (k := k) (polarizedBaseChange.obj ξ : PolarizedObject g d K) = ⊥ := sorry
end
end GeometricRegressionTests

section CMIntegralAdapters
/-- The archimedean positive cone for the actual CM type, using CM conjugation and the
chosen complex embeddings. It is not an arbitrary ordered star-ring cone. -/
def GeneralizedCMType.positiveImaginaryCone {F : Type} [Field F] [NumberField F]
    [NumberField.IsCMField F] [StarRing F] (Φ : GeneralizedCMType F 1) : Set F :=
  {a | star a = -a ∧ ∀ τ : F →+* ℂ, Φ.coeff τ = 1 → 0 < (τ a).im}

def SkewHermitianSpace.HasCMType {F : Type} [Field F] [NumberField F]
    [NumberField.IsCMField F] [StarRing F] (S : SkewHermitianSpace ℚ F F)
    (Φ : GeneralizedCMType F 1) : Prop :=
  ∀ a ∈ Φ.positiveImaginaryCone, ∀ x : F, 0 ≤ S.pairing (a * x) x

/-- Actual rank-one CM integral PEL adapter. The order embedding is star-compatible and
the full lattice is stable with integral pairings. The CM star and split archimedean action
used to build positive J are omitted prototype hypotheses. -/
def SkewHermitianSpace.toIntegralPELDatum {F O L : Type} [Field F] [NumberField F]
    [NumberField.IsCMField F] [StarRing F] [Ring O] [StarRing O]
    [AddCommGroup L] [Module O L] [Module.Finite ℤ L] [Module.Free ℤ L]
    (S : SkewHermitianSpace ℚ F F) (Φ : GeneralizedCMType F 1) (_htype : S.HasCMType Φ)
    (φ : O →+* F) (_hstar : ∀ a, φ (star a) = star (φ a))
    (ι : L →ₗ[ℤ] F) (_hi : Function.Injective ι) (_hspan : Submodule.span ℚ (Set.range ι) = ⊤)
    (_hact : ∀ (a : O) (x : L), ι (a • x) = φ a * ι x)
    (_hint : ∀ x y : L, S.pairing (ι x) (ι y) ∈ Set.range (Int.cast : ℤ → ℚ)) :
    IntegralPELDatum O L := sorry

-- Unit test: skewHermitian_cm_cone_sign
example {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] [StarRing F]
    (Φ : GeneralizedCMType F 1) (a : F) (ha : a ∈ Φ.positiveImaginaryCone)
    (τ : F →+* ℂ) (hτ : Φ.coeff τ = 1) : ¬ (-a ∈ Φ.positiveImaginaryCone) := sorry
end CMIntegralAdapters

/-- M6 arithmetic construction is independent of M5: the Gaussian CM elliptic curve over
k and its conjugate give E times Ebar with the second polarization scaled by p. Existence
of that CM elliptic curve with its action over k is the omitted A1/A6 input. -/
theorem nonemptyUnitaryExamples (k : Type) [Field k] [NumberField k] (i : k)
    (_hi : i ^ 2 = -1) (p : ℕ) [Fact p.Prime] (_hp : p ≠ 2) :
    ∃ (X : UnitaryOFAbelianScheme (Supplier.abelianSupplier (.of k)) GaussianInt)
      (e : (Supplier.abelianSupplier (.of k)).lie X.A ≃ₗ[k] (Fin 2 → k)),
      (∀ x, e ((Supplier.abelianSupplier (.of k)).lieAct (X.i ⟨0, 1⟩) x) =
        ![i * e x 0, -i * e x 1]) ∧ X.pol.den = 1 ∧
      X.pol.num = (Supplier.abelianSupplier (.of k)).polarizationHom X.amplePolarization ∧
      ∀ s : Spec (.of k), X.pol.numeratorKernelDegree s = p ^ 2 := sorry

section LinearTransportContracts
namespace Supplier
/-- The actual tau-eigensubmodule with its coefficient-ring module structure; the order
action commutes with that structure. -/
def tauModule {OF k : Type} [CommRing OF] [Field k] (M : Type) [AddCommGroup M]
    [Module k M] [Module OF M] (_τ : OF →+* k) : ModuleCat.{0} k := sorry
/-- Scalar pullback along Frobenius on the actual module, owned by R07.2. -/
def frobeniusPullbackModule (p : ℕ) [Fact p.Prime] {k : Type} [Field k] [CharP k p]
    (_M : ModuleCat.{0} k) : ModuleCat.{0} k := sorry
end Supplier

/-- The full linear tau comparison includes the scalar pullback on the right. The unramified
CM splitting and commuting action are omitted; forgetting scalars gives the additive adapter. -/
def tauPart_frobeniusTwist {OF k : Type} [CommRing OF] [Field k] (p : ℕ) [Fact p.Prime]
    [CharP k p] [PerfectRing k p] (M : Type) [AddCommGroup M] [Module k M] [Module OF M]
    (τ τ' : OF →+* k) (_hτ : frobeniusOnEmbeddings p τ' = τ) :
    Supplier.tauModule (Supplier.frobeniusModule (OF := OF) (k := k) p M) τ ≅
      Supplier.frobeniusPullbackModule p (Supplier.tauModule M τ') := sorry

namespace Supplier
/-- Actual maps of the covariant Hodge sequence, retaining the localized CM-order action. -/
def localizedHodgeInclusion {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (τ : OF →+* R) :
    localizedHodgeTau 𝒜 X τ →ₗ[R] localizedDeRhamTau 𝒜 X τ := sorry

def localizedHodgeProjection {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (τ : OF →+* R) :
    localizedDeRhamTau 𝒜 X τ →ₗ[R] localizedLieTau 𝒜 X τ := sorry
end Supplier

/-- A4's Hodge exact sequence restricted by the actual unramified idempotents. Splitting
of the CM order and finite local freeness of the three terms are omitted hypotheses. -/
theorem LocalizedUnitaryOFAbelianScheme.hodge_sequence_exact
    {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u} [CommRing OF] [StarRing OF]
    (𝒜 : AbelianSchemeSupplier R) (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF)
    (τ : OF →+* R) :
    Function.Injective (Supplier.localizedHodgeInclusion 𝒜 X τ) ∧
    LinearMap.range (Supplier.localizedHodgeInclusion 𝒜 X τ) =
      LinearMap.ker (Supplier.localizedHodgeProjection 𝒜 X τ) ∧
    Function.Surjective (Supplier.localizedHodgeProjection 𝒜 X τ) := sorry
end LinearTransportContracts

section FullFunctorContracts
namespace PELModuli
section
variable {B : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] {V : Type} [AddCommGroup V]
  [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

abbrev adelicModuli.complexIsoClasses (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :=
  Quot (fun x y : adelicModuli P D K (Over.mk (Spec.map (CommRingCat.ofHom φ))) => Nonempty (x ≅ y))

/-- Full finite adelic quadruples classified with all global rational-form pieces.
P and phi have the same reflex datum as D; neatness is needed for the fine-family comparison. -/
theorem adelicModuli.complexPoints (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty (adelicModuli.complexIsoClasses P φ D K ≃
      Σ i : ker1 D, twistedDoubleCoset D i K) := sorry

-- Unit test: adelicModuli_all_primes_points
example (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    Nonempty (adelicModuli.complexIsoClasses P φ D K ≃
      Σ i : ker1 D, twistedDoubleCoset D i K) := sorry
end

/-- Restrict the order through the admissible PEL-data morphism, transporting polarization,
determinant and the actual relative level. That morphism and transported-level identification
are omitted prototype hypotheses, not replaced by a map on unrelated triples. -/
def mapOfDatumFunctor (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base) :
    familyFunctor P ⟶ (hbase ▸ familyFunctor P') := sorry

/-- The Siegel datum P' is the underlying symplectic datum of P, with compatible full level
and twist. It forgets the order action of the actual family; this identification is omitted. -/
def toSiegelFunctor (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base) :
    familyFunctor P ⟶ (hbase ▸ familyFunctor P') := sorry
end PELModuli

namespace Supplier
/-- Pairs of families over the common base with the common Tate-twist multiplier prescribed
by the product datum and its compact-open level. -/
def compatibleProductFunctor (P Q : ModuliParameters.{u}) (hbase : Q.base = P.base) :
    (Over P.base)ᵒᵖ ⥤ Type (u + 1) := sorry
end Supplier

/-- Product datum R has O_P times O_Q, orthogonal direct-sum lattice and compatible level.
These data and their common base are omitted prototype conditions. -/
theorem PELModuli.productFamilyEquivalence (P Q R : ModuliParameters.{u})
    (hQ : Q.base = P.base) (hR : R.base = P.base) :
    Nonempty ((hR ▸ PELModuli.familyFunctor R) ≅ Supplier.compatibleProductFunctor P Q hQ) := sorry

-- Unit test: mapOfDatum_id_functor
example (P : ModuliParameters.{u}) : PELModuli.mapOfDatumFunctor P P rfl = 𝟙 _ := sorry
end FullFunctorContracts

section LastAdapters
/-- Trace conversion for the actual finite-etale CM coefficient algebra. Conjugation fixes
R, delta is an anti-invariant unit and the trace pairing is perfect; the finite-etale and
CM-algebra identifications are omitted supplier conditions. -/
def HermitianSpace.traceSkewHermitian {R A W : Type} [CommRing R] [CommRing A] [StarRing A]
    [Algebra R A] [Module.Free R A] [Module.Finite R A] [AddCommGroup W]
    [Module A W] [Module R W] [IsScalarTower R A W] (H : HermitianSpace A W)
    (δ : Aˣ) (_hδ : star (δ : A) = -(δ : A)) : SkewHermitianSpace R A W := sorry

namespace Supplier
/-- Marked deformations of the full localized unitary object (O_F action in End tensor P,
quasi-polarization and signature), across the specified PD thickening. -/
def localizedUnitaryDeformations {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (_X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (_q : PDThickening R) : Type (u + 1) := sorry
instance localizedUnitaryDeformationGroupoid {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (q : PDThickening R) :
    Groupoid.{u + 1} (localizedUnitaryDeformations 𝒜 X q) := sorry
/-- Pairs of actual locally direct-summand Hodge submodules in the evaluated tau/tau^c
crystal, mutually annihilating under lambda and reducing to the marked Hodge submodules. -/
def localizedFiltrationLifts {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (_X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (_q : PDThickening R) : Type (u + 1) := sorry

def localizedUnitaryHodgeFunctor {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (q : PDThickening R) :
    localizedUnitaryDeformations 𝒜 X q ⥤ Discrete (localizedFiltrationLifts 𝒜 X q) := sorry
end Supplier

/-- LTXZZ Lemma 3.4.8: P=Z_(p), unramified p, locally nilpotent p/PD ideal, the designated
pair of embeddings and the extreme signatures away from it are omitted source hypotheses. -/
theorem localizedUnitaryDeformation {R : CommRingCat.{u}} {P : Subring ℚ} {OF : Type u}
    [CommRing OF] [StarRing OF] (𝒜 : AbelianSchemeSupplier R)
    (X : LocalizedUnitaryOFAbelianScheme 𝒜 P OF) (q : Supplier.PDThickening R) :
    (Supplier.localizedUnitaryHodgeFunctor 𝒜 X q).IsEquivalence := sorry
end LastAdapters

section FinalLinearContracts
namespace Supplier
/-- D4's morphisms of the actual Shimura data, with the group morphism carrying h-orbits. -/
def shimuraMorphism (_D _D' : SupplierShimuraDatum) : Type := sorry
/-- AA.1's finite integral similitude quotient, with the lattice and multiplier retained. -/
def finiteIntegralSimilitudes (_P : ModuliParameters.{u}) (_n : ℕ) : Type u := sorry
instance finiteIntegralSimilitudesGroup (P : ModuliParameters.{u}) (n : ℕ) :
    Group (finiteIntegralSimilitudes P n) := sorry

def integralReduction (P : ModuliParameters.{u}) (n : ℕ) :
    integralSimilitudes P →* finiteIntegralSimilitudes P n := sorry
end Supplier

namespace PELDatum.similitudeGroup
/-- Principal congruence subgroup of the actual completed PEL lattice group. -/
def completedPrincipalCongruence (P : ModuliParameters.{u}) (n : ℕ) :
    Subgroup (Supplier.integralSimilitudes P) := (Supplier.integralReduction P n).ker
end PELDatum.similitudeGroup

namespace RationalPELDatum
variable {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]

/-- Forget B in the connected SV3-admissible datum. The target is D5's underlying Siegel
Shimura datum; positivity and g>0 and its rank identification are omitted conditions. -/
def siegelMorphism (D : RationalPELDatum B V) (g : ℕ)
    (_hg : Module.finrank ℚ V = 2 * g) :
    Supplier.shimuraMorphism D.toShimuraDatum (Supplier.siegelShimuraDatum g) := sorry

/-- The centre is identified with F. G contains every embedded conjugate of F, so contains
all traces on V0 and hence the actual PEL reflex field. -/
theorem reflexField_le_galoisClosure (D : RationalPELDatum B V)
    (F : Type) [Field F] [NumberField F] [Algebra F B]
    (_hc : Set.range (algebraMap F B) = (Subring.center B : Set B))
    (G : Subfield ℂ) [NumberField G] [IsGalois ℚ G]
    (_hG : ∀ τ : F →+* ℂ, Set.range τ ⊆ G) :
    (D.reflexField : Set ℂ) ⊆ G := sorry

/-- Integrality of every determinant coefficient, not merely of a trace. -/
theorem detPoly_integral (D : RationalPELDatum B V) (O : StarOrder B)
    {ι : Type} [Fintype ι] [DecidableEq ι] (a : ι → O.carrier)
    (m : ι →₀ ℕ) :
    IsIntegral ℤ ((detPoly (fun i => D.actionOnV₀ (a i))).coeff m) := sorry
end RationalPELDatum

namespace Order
variable {B : Type*} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
  [StarRing B]
/-- Trace-adjointness of star transports the full inverse different, not just O. -/
theorem inverseDifferent_star (O : StarOrder B) (x : B) :
    x ∈ inverseDifferent O.carrier ↔ star x ∈ inverseDifferent O.carrier := sorry
end Order

namespace GeneralizedCMType
variable {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]
  {N : ℕ}
/-- F is the actual CM centre. Equality of the signature coefficients identifies the two
Galois stabilizers and hence the reflex fields, inside the same complex field. -/
theorem reflexField_eq_pel (Ψ : GeneralizedCMType F N)
    {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
    [StarRing B] [Algebra F B] [AddCommGroup V] [Module ℚ V] [Module B V]
    [IsScalarTower ℚ B V] (D : RationalPELDatum B V)
    (_hc : Set.range (algebraMap F B) = (Subring.center B : Set B))
    (_hΨ : D.signatureType F = Ψ.coeff) (z : ℂ) :
    z ∈ D.reflexField ↔ z ∈ Ψ.reflexField := sorry
end GeneralizedCMType

/-- Rank-one perfect forms over the finite-etale CM coefficient algebra give the norm
similitude torus. Faithful R-to-A and the actual CM involution are omitted conditions. -/
def SkewHermitianSpace.gu_rankOneEquiv {R A : Type} [CommRing R] [CommRing A]
    [StarRing A] [Algebra R A]
    (S : SkewHermitianSpace R A A) : S.GU ≃* cmTorus R A := sorry
end FinalLinearContracts


/-! Final API contracts: full integral groups, relative fibres, and geometric family
comparisons. Future supplier conditions are omitted where named in the packet. -/
section FidelityContracts

namespace IntegralPELDatum
variable {O L : Type} [Ring O] [StarRing O] [AddCommGroup L] [Module O L]
/-- The actual O-action after integral scalar extension. -/
def scalarAction (D : IntegralPELDatum O L) (R : Type) [CommRing R] (b : O) :
    Module.End R (R ⊗[ℤ] L) := sorry

/-- Pair-valued points over every integral base, including nonflat bases and rank zero. -/
def similitudePoints (D : IntegralPELDatum O L) (R : Type) [CommRing R] :
    Subgroup (((R ⊗[ℤ] L) ≃ₗ[R] (R ⊗[ℤ] L)) × Rˣ) where
  carrier := {gr | (∀ b, gr.1.toLinearMap ∘ₗ D.scalarAction R b =
      D.scalarAction R b ∘ₗ gr.1.toLinearMap) ∧
    ∀ x y, D.baseChange R (gr.1 x) (gr.1 y) = (gr.2 : R) * D.baseChange R x y}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- AA.1's closed Hopf-algebra construction for these actual integral equations. -/
def coordinate (_D : IntegralPELDatum O L) : CommHopfAlgCat.{0} ℤ := sorry

def coordinatePoints (D : IntegralPELDatum O L) (R : Type) [CommRing R] :
    WithConv (D.coordinate →ₐ[ℤ] R) ≃* D.similitudePoints R := sorry

/-- Flatness and positive rank are essential to uniqueness. -/
theorem multiplier_unique (D : IntegralPELDatum O L) (R : Type) [CommRing R]
    [Module.Flat ℤ R] [Nontrivial L] [Nontrivial R]
    (g : (R ⊗[ℤ] L) ≃ₗ[R] (R ⊗[ℤ] L)) (r r' : Rˣ)
    (_h : (g,r) ∈ D.similitudePoints R) (_h' : (g,r') ∈ D.similitudePoints R) : r = r' := sorry

def zeroSimilitudeEquiv (D : IntegralPELDatum O L) (R : Type) [CommRing R]
    [Subsingleton L] : D.similitudePoints R ≃* Rˣ := sorry
end IntegralPELDatum

namespace PELDatum.similitudeGroup
variable {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
  [IsSemisimpleRing B] [StarRing B] [AddCommGroup V] [Module ℚ V]
  [Module B V] [IsScalarTower ℚ B V]
/-- Forget B-linearity but retain the multiplier and the same form. AA.1 supplies the
corresponding closed group-scheme immersion. -/
def siegelEmbedding (D : RationalPELDatum B V) (R : Type) [CommRing R] [Algebra ℚ R] :
    PELDatum.similitudeGroup D R →*
      (((R ⊗[ℚ] V) ≃ₗ[R] (R ⊗[ℚ] V)) × Rˣ) := (PELDatum.similitudeGroup D R).subtype
end PELDatum.similitudeGroup

/-- The actual eigensummand as an R-module; the two scalar actions commute. -/
def tauSubmodule {R OF M : Type} [CommRing R] [CommRing OF] [AddCommGroup M]
    [Module R M] [Module OF M] [SMulCommClass R OF M] (τ : OF →+* R) : Submodule R M where
  carrier := {x | ∀ a : OF, a • x = (τ a) • x}
  zero_mem' := by simp
  add_mem' := sorry
  smul_mem' := sorry

/-- The actual unramified evaluation splitting supplies R-linearity of summation. -/
def tauPart_decomp_linear (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (p : ℕ) [Fact p.Prime] (M : Type) [AddCommGroup M]
    [Module (Supplier.diamondIntegerRing F p) M] [Module (𝓞 F) M]
    [SMulCommClass (Supplier.diamondIntegerRing F p) (𝓞 F) M] :
    (∀ i : Fin (Module.finrank ℚ F), tauSubmodule (M := M) (Supplier.diamondEmbeddings F p i))
      ≃ₗ[Supplier.diamondIntegerRing F p] M := sorry

namespace Supplier
/-- The order actions on the fixed relative polarized Siegel family which satisfy Rosati,
the exact determinant condition and compatibility with its descended level. -/
def orderStructures (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base)
    (S : Over P.base) (_ξ : (hbase ▸ PELModuli.familyFunctor P').obj (.op S)) : Type (u + 1) := sorry

/-- ModularCurves 5B's actual universal elliptic curve, transported by the fine
principal genus-one comparison; all parameters refer to that comparison. -/
def modularUniversalAffine (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (_t : (spaceFunctor (PELModuli.representingSpace P).space).obj
      (.op (Over.mk (Spec.map φ)))) : AbelianScheme (Spec R) := sorry
end Supplier

namespace Supplier
/-- The actual 2-fibre of the order-forgetting functor: a PEL family and a polarized
level-preserving identification with ξ; morphisms commute with that identification. -/
def siegelFibre (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base)
    (S : Over P.base) (_ξ : (hbase ▸ PELModuli.familyFunctor P').obj (.op S)) : Type (u + 1) := sorry
instance siegelFibreGroupoid (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base)
    (S : Over P.base) (ξ : (hbase ▸ PELModuli.familyFunctor P').obj (.op S)) :
    Groupoid (siegelFibre P P' hbase S ξ) := sorry
end Supplier

namespace PELModuli
/-- P' is the underlying symplectic datum with the indicated compatible level. The
relative 2-fibre is the discrete sheaf of compatible order structures on ξ. -/
def toSiegel_fiber (P P' : ModuliParameters.{u}) (hbase : P'.base = P.base)
    (S : Over P.base) (ξ : (hbase ▸ familyFunctor P').obj (.op S)) :
    Supplier.siegelFibre P P' hbase S ξ ≌
      Discrete (Supplier.orderStructures P P' hbase S ξ) := sorry

/-- Naturality of the actual classifying morphism, in addition to classify_universal's
pullback of the universal family. -/
theorem classify_pullback {P : ModuliParameters.{u}} {S T : Over P.base}
    (f : S ⟶ T) (ξ : Family P T) :
    classify ((Family.pullback f).obj ξ) =
      (Supplier.spaceFunctor (representingSpace P).space).map f.op (classify ξ) := sorry

/-- Principal genus one, invertible level n>=3 and the 5B pairing convention are omitted
identifications. Compare actual universal abelian schemes, not their dimensions. -/
theorem universal_siegel (P : ModuliParameters.{u}) (R : CommRingCat.{u}) (φ : P.R₀ ⟶ R)
    (t : (Supplier.spaceFunctor (representingSpace P).space).obj
      (.op (Over.mk (Spec.map φ)))) :
    ∃ f : ((universalAffine P R φ t).triple.A).Hom (Supplier.modularUniversalAffine P R φ t),
      IsIso f.f := sorry
end PELModuli

/-- Scheme automorphisms realizing the torus action on the actual selected CM cover. -/
def cmModuliAct {F : Type u} [Field F] [NumberField F] [NumberField.IsCMField F]
    (Φ : GeneralizedCMType F 1) (p n : ℕ) :
    cmGamma Φ p n →* Aut (cmModuli Φ p n).left := sorry

namespace Supplier
/-- Actual j-invariants of complex elliptic curves with action by the full integer ring
of the specified CM field. -/
def cmEllipticJ (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] : Set ℂ := sorry
end Supplier

-- Unit test: mapOfDatum_id
example (P : ModuliParameters.{u}) : PELModuli.mapOfDatumFunctor P P rfl = 𝟙 _ := sorry

-- Unit test: toSiegel_g1
example (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (_hdim : Module.finrank ℚ F = 2) : (Supplier.cmEllipticJ F).Finite := sorry

-- Unit test: toSiegel_not_injective_on_objects
-- Witness: O=Z times Z, with two rank-two factors, and underlying Siegel datum.
-- Over C swap projector actions on E1 times E2 for nonisogenous elliptic curves.
example :
    ∃ (P P' : ModuliParameters.{0}) (hbase : P'.base = P.base) (S : Over P.base),
      P.O = (ℤ × ℤ) ∧ P'.O = ℤ ∧
        ¬ Function.Injective ((PELModuli.toSiegelFunctor P P' hbase).app (.op S)) := sorry

end FidelityContracts

/-! Exact compatibility and regression contracts completing the API audit. -/
section AuditedContracts
namespace IntegralPELDatum
variable {O L : Type} [Ring O] [StarRing O] [AddCommGroup L] [Module O L]
/-- The multiplier-one closed subgroup, represented by AA.1's same integral equations. -/
def isometryCoordinate (_D : IntegralPELDatum O L) : CommHopfAlgCat.{0} ℤ := sorry
end IntegralPELDatum

/-- The principal symplectic lattice, after the explicit Fin-sum/JFin basis conversion.
This is an isomorphism of actual integral group schemes, not just a matrix identity. -/
theorem PELDatum.similitudeGroup.isometry_siegel (g : ℕ) :
    Nonempty ((siegelIntegralDatum g (fun _ => 1) (by intro _; norm_num)).isometryCoordinate ≅
      TauCeti.Symplectic.coordinateHopfAlgebra ℤ g) := sorry

namespace GeneralizedCMType
variable {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ}
/-- Transport of the actual stabilizer fixed field. -/
theorem galois_reflex (σ : ℂ ≃+* ℂ) (Ψ : GeneralizedCMType F N) (z : ℂ) :
    σ z ∈ (galois_smul σ Ψ).reflexField ↔ z ∈ Ψ.reflexField := sorry
end GeneralizedCMType

namespace CMField
/-- The conjugation-fixed subfield, as an actual subfield of C. -/
def realSubfield (F : Subfield ℂ) : Subfield ℂ :=
  F ⊓
    { carrier := {z | star z = z}
      mul_mem' := sorry
      one_mem' := sorry
      add_mem' := sorry
      zero_mem' := sorry
      neg_mem' := sorry
      inv_mem' := sorry }

@[instance_reducible] def realReflexiveAlgebra (F : Subfield ℂ)
    [NumberField F] [NumberField.IsCMField F] :
    Algebra (realSubfield F) (realSubfield (reflexiveClosure F)) := sorry
attribute [instance] realReflexiveAlgebra

theorem reflexiveClosure_real_galois (F : Subfield ℂ)
    [NumberField F] [NumberField.IsCMField F] :
    FiniteDimensional (realSubfield F) (realSubfield (reflexiveClosure F)) ∧
      IsGalois (realSubfield F) (realSubfield (reflexiveClosure F)) := sorry
end CMField

namespace Supplier
/-- SF.2 Part II's open analytic subspace with restricted structure sheaf, retaining nilpotents. -/
def analyticOpenSubspace (X : ComplexAnalyticSpace.{0})
    (_U : TopologicalSpace.Opens (analyticPoints X)) : ComplexAnalyticSpace.{0} := sorry
def analyticOpenInclusion (X : ComplexAnalyticSpace.{0}) (U : TopologicalSpace.Opens (analyticPoints X)) :
    analyticOpenSubspace X U ⟶ X := sorry
end Supplier

namespace PELModuli
/-- The piece is isomorphic to an actual open-and-closed analytic subspace.
Same datum/base/level and neatness conditions as uniformization are omitted identifications. -/
theorem uniformization_analyticOpenClosed
    {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
    [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    ∃ U : TopologicalSpace.Opens (Supplier.analyticPoints
        (Supplier.analytification.obj (genericFibre P φ).model)),
      IsClosed U.carrier ∧
      ∃ e : quotientAnalyticSpace D i K ≅ Supplier.analyticOpenSubspace
          (Supplier.analytification.obj (genericFibre P φ).model) U,
        e.hom ≫ Supplier.analyticOpenInclusion _ U = uniformization P φ D i K := sorry
end PELModuli

/-- The direct full-group type-D family comparison, in addition to typeDComparison's
point bijection. Full-group neatness, rational twists and level/base agreement are omitted
prototype conditions. SF.2 retains the structure sheaf, including nilpotents. -/
theorem typeDComparison_analytic
    {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
    [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (P : ModuliParameters.{0}) (φ : P.R₀ →+* ℂ)
    (D : RationalPELDatum B V) (i : PELModuli.ker1 D)
    (K : Subgroup (PELDatum.similitudeGroup D (IsDedekindDomain.FiniteAdeleRing ℤ ℚ))) :
    ∃ U : TopologicalSpace.Opens (Supplier.analyticPoints
        (Supplier.analytification.obj (PELModuli.genericFibre P φ).model)),
      IsClosed U.carrier ∧
      ∃ e : PELModuli.quotientAnalyticSpace D i K ≅ Supplier.analyticOpenSubspace
          (Supplier.analytification.obj (PELModuli.genericFibre P φ).model) U,
        e.hom ≫ Supplier.analyticOpenInclusion _ U = PELModuli.uniformization P φ D i K := sorry

-- Unit test: gcmType_reflex_imagQuad
example (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (_hdim : Module.finrank ℚ F = 2) (Ψ : GeneralizedCMType F 3)
    (τ : F →+* ℂ) (_h : Ψ.coeff τ = 2) (z : ℂ) :
    z ∈ Ψ.reflexField ↔ z ∈ Set.range τ := sorry

-- Unit test: reflexiveClosure_not_intersection_alone
example (F : Subfield ℂ) [NumberField F] [NumberField.IsCMField F]
    (_hdim : Module.finrank ℚ F = 4)
    (_hinter : (⨅ Φ : GeneralizedCMType F 1, Φ.reflexField) = Subfield.closure (∅ : Set ℂ)) :
    CMField.reflexiveClosure F ≠ ⨅ Φ : GeneralizedCMType F 1, Φ.reflexField := sorry

end AuditedContracts

section FaithfulRegressionTests
namespace HermitianSpace
/-- The actual closed unitary group over R. AA.1's coefficient algebra A/R is finite
etale, star fixes R and W is finite locally free; those supplier conditions are omitted. -/
def coordinate (R : Type) [CommRing R] {A W : Type} [CommRing A] [StarRing A]
    [Algebra R A] [AddCommGroup W] [Module A W] [Module R W] [IsScalarTower R A W]
    (_H : HermitianSpace A W) : CommHopfAlgCat.{0} R := sorry
end HermitianSpace

-- Unit test: similitudeGroup_zero
example (D : IntegralPELDatum ℤ (Fin 0 → ℤ)) (R : Type) [CommRing R] :
    Nonempty (D.similitudePoints R ≃* Rˣ) := ⟨D.zeroSimilitudeEquiv R⟩

-- Unit test: isometryGroup_siegel
example (g : ℕ) :
    Nonempty ((siegelIntegralDatum g (fun _ => 1) (by intro _; norm_num)).isometryCoordinate ≅
      TauCeti.Symplectic.coordinateHopfAlgebra ℤ g) := PELDatum.similitudeGroup.isometry_siegel g

-- Unit test: pelShimuraDatum_siegel
example (g : ℕ) (hg : 0 < g) :
    Nonempty (Supplier.shimuraIso
      (siegelRationalDatum g (fun _ => 1) (by intro _; norm_num) hg).toShimuraDatum
      (Supplier.siegelShimuraDatum g)) := sorry

-- Unit test: pelShimuraDatum_gl2
example :
    Nonempty (Supplier.shimuraIso
      (siegelRationalDatum 1 (fun _ => 1) (by intro _; norm_num) (by norm_num)).toShimuraDatum
      (Supplier.siegelShimuraDatum 1)) := sorry

-- Unit test: pelShimuraDatum_typeD
example {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
    [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (D : RationalPELDatum B V)
    (_hD : 0 < ∑ i : Fin (Supplier.factorCount D),
      if Supplier.factorType D i = .D then Supplier.factorFixedDegree D i else 0) :
    Nat.card (ConnectedComponents (Supplier.groupScheme D.coordinate ℂ)) ≠ 1 := sorry

namespace Supplier
/-- The canonical comparison at conjugate level by 1, induced by the subgroup equality. -/
def heckeIdentityComparison {B V : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V]
    [IsScalarTower ℚ B V] (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) :
    PELModuli.rationalFamilyFunctor P D (PELModuli.heckeLevel P D K 1) ≅
      PELModuli.rationalFamilyFunctor P D K := sorry
end Supplier

-- Unit test: heckeTranslate_id
example {B V : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V]
    [IsScalarTower ℚ B V] (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box))) :
    PELModuli.heckeTranslate P D K 1 = (Supplier.heckeIdentityComparison P D K).hom := sorry

namespace Supplier
/-- Actual central scalar in the same adelic PEL group; the positive m has multiplier m². -/
def centralScalar {B V : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V]
    [IsScalarTower ℚ B V] (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (m : ℕ) (_hm : 0 < m) : PELDatum.similitudeGroup D (AwayAdeleRing P.box) := sorry

/-- The comparison induced by [m] on the actual rational family, with level multiplied by m. -/
def heckeScalarComparison {B V : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V]
    [IsScalarTower ℚ B V] (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (m : ℕ) (hm : 0 < m) (_hbox : ∀ p ∈ P.box, ¬ p ∣ m) :
    PELModuli.rationalFamilyFunctor P D
      (PELModuli.heckeLevel P D K (centralScalar P D m hm)) ≅
        PELModuli.rationalFamilyFunctor P D K := sorry
end Supplier

-- Unit test: heckeTranslate_siegel_scalar
example {B V : Type u} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B]
    [IsSemisimpleRing B] [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V]
    [IsScalarTower ℚ B V] (P : ModuliParameters.{u}) (D : RationalPELDatum B V)
    (K : Subgroup (PELDatum.similitudeGroup D (AwayAdeleRing P.box)))
    (m : ℕ) (hm : 0 < m) (hbox : ∀ p ∈ P.box, ¬ p ∣ m) :
    PELModuli.heckeTranslate P D K (Supplier.centralScalar P D m hm) =
      (Supplier.heckeScalarComparison P D K m hm hbox).hom := sorry

end FaithfulRegressionTests

section PELFieldContracts
namespace Supplier
/-- Pullback of the actual PEL family along an automorphism fixing its base field.
This preserves the order, polarization, determinant and level, not just the abelian variety. -/
def pelConjugate (P : ModuliParameters.{u}) {k K : Type u}
    [Field k] [Field K] [Algebra k K] (φ : P.R₀ →+* k) (_σ : K ≃ₐ[k] K)
    (_ξ : PELModuli.Family P
      (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ))))) :
    PELModuli.Family P
      (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ)))) := sorry

/-- Actual base change of a family over a subfield of K which contains k. -/
def pelFieldBaseChange (P : ModuliParameters.{u}) {k K : Type u}
    [Field k] [Field K] [Algebra k K] (φ : P.R₀ →+* k) (L : IntermediateField k K) :
    PELModuli.Family P
      (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k L).comp φ)))) ⥤
    PELModuli.Family P
      (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ)))) := sorry
end Supplier

namespace PELModuli
def isomorphismStabilizer (P : ModuliParameters.{u}) {k K : Type u}
    [Field k] [Field K] [Algebra k K] (φ : P.R₀ →+* k)
    (ξ : Family P (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ))))) :
    Subgroup (K ≃ₐ[k] K) where
  carrier := {σ | Nonempty (Supplier.pelConjugate P φ σ ξ ≅ ξ)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

def fieldOfModuliPEL (P : ModuliParameters.{u}) {k K : Type u}
    [Field k] [Field K] [Algebra k K] (φ : P.R₀ →+* k)
    (ξ : Family P (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ))))) :
    IntermediateField k K := IntermediateField.fixedField (isomorphismStabilizer P φ ξ)
end PELModuli

namespace Supplier
/-- The embedded residue field of the actual PEL coarse point attached to ξ. -/
def pelCoarsePointField (P : ModuliParameters.{u}) {k K : Type u}
    [Field k] [Field K] [Algebra k K] (φ : P.R₀ →+* k)
    (_ξ : PELModuli.Family P
      (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ))))) :
    IntermediateField k K := sorry
end Supplier

namespace PELModuli
section
variable (P : ModuliParameters.{u}) {k K : Type u}
  [Field k] [Field K] [Algebra k K] [CharZero k] [IsAlgClosed K] [Algebra.IsAlgebraic k K]
  (φ : P.R₀ →+* k)
  (ξ : Family P (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k K).comp φ)))))

theorem fieldOfModuliPEL_residue :
    fieldOfModuliPEL P φ ξ = Supplier.pelCoarsePointField P φ ξ := sorry

theorem fieldOfModuliPEL_le (L : IntermediateField k K)
    (η : Family P (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k L).comp φ)))))
    (_h : Nonempty ((Supplier.pelFieldBaseChange P φ L).obj η ≅ ξ)) :
    fieldOfModuliPEL P φ ξ ≤ L := sorry

theorem fieldOfModuliPEL_fine (_h : Subsingleton (ξ ≅ ξ)) :
    ∃ η : Family P (Over.mk (Spec.map (CommRingCat.ofHom
      ((algebraMap k (fieldOfModuliPEL P φ ξ)).comp φ)))),
      Nonempty ((Supplier.pelFieldBaseChange P φ (fieldOfModuliPEL P φ ξ)).obj η ≅ ξ) := sorry

-- Unit test: fieldOfModuliPEL_residue_test
example : fieldOfModuliPEL P φ ξ = Supplier.pelCoarsePointField P φ ξ := sorry

-- Unit test: fieldOfModuliPEL_model_test
example (L : IntermediateField k K)
    (η : Family P (Over.mk (Spec.map (CommRingCat.ofHom ((algebraMap k L).comp φ)))))
    (h : Nonempty ((Supplier.pelFieldBaseChange P φ L).obj η ≅ ξ)) :
    fieldOfModuliPEL P φ ξ ≤ L := sorry

-- Unit test: fieldOfModuliPEL_fine_test
example (h : Subsingleton (ξ ≅ ξ)) :
    ∃ η : Family P (Over.mk (Spec.map (CommRingCat.ofHom
      ((algebraMap k (fieldOfModuliPEL P φ ξ)).comp φ)))),
      Nonempty ((Supplier.pelFieldBaseChange P φ (fieldOfModuliPEL P φ ξ)).obj η ≅ ξ) := sorry
end
end PELModuli

namespace Supplier
/-- Betti version of the actual polarization-adjoint Hom pairing. -/
def bettiPolarizedHomPairing (𝒜 : AbelianSchemeSupplier (.of ℂ))
    (A₀ A : AbelianScheme (Spec (.of ℂ))) (pol₀ : QuasiIsogeny A₀ (𝒜.dual A₀))
    (pol : QuasiIsogeny A (𝒜.dual A)) (C : CommRingCat.{0}) :
    (bettiHomology A₀ C →ₗ[C] bettiHomology A C) →
      (bettiHomology A₀ C →ₗ[C] bettiHomology A C) → C := sorry
end Supplier

/-- Betti--etale comparison preserves the actual polarization-adjoint pairing. The same
rank-one CM source, OF-linear coefficient algebra, positive quasi-polarizations and comparison
identifications as the geometric Hom target are omitted supplier hypotheses. -/
theorem hermitianHomOfAbelianSchemes_complex_pairing
    (𝒜 : AbelianSchemeSupplier (.of ℂ)) (A₀ A : AbelianScheme (Spec (.of ℂ)))
    (pol₀ : QuasiIsogeny A₀ (𝒜.dual A₀)) (pol : QuasiIsogeny A (𝒜.dual A))
    (C : CommRingCat.{0})
    (x y : Supplier.bettiHomology A₀ C →ₗ[C] Supplier.bettiHomology A C) :
    Supplier.polarizedHomPairing 𝒜 A₀ A pol₀ pol C
      (hermitianHomOfAbelianSchemes_complex A₀ A C x)
      (hermitianHomOfAbelianSchemes_complex A₀ A C y) =
      Supplier.bettiPolarizedHomPairing 𝒜 A₀ A pol₀ pol C x y := sorry
end PELFieldContracts

-- Unit test: uniformization_negative_component
example {B V : Type} [Ring B] [Algebra ℚ B] [Module.Finite ℚ B] [IsSemisimpleRing B]
    [StarRing B] [AddCommGroup V] [Module ℚ V] [Module B V] [IsScalarTower ℚ B V]
    (D : RationalPELDatum B V) (x : ℝ ⊗[ℚ] V) (hx : x ≠ 0) :
    LinearMap.BilinForm.baseChange ℝ D.form x ((-D.J) x) < 0 ∧
      0 < -(LinearMap.BilinForm.baseChange ℝ D.form x ((-D.J) x)) := by
  have h := D.pos x hx
  rw [LinearMap.neg_apply, map_neg]
  constructor <;> linarith

end TauCeti.PEL

/-! The integral form 5J vanishes after reduction to F5, so two distinct units both
scale it identically. Tests the missing flatness hypothesis without a fake integral-group carrier. -/
namespace TauCeti.PEL.tests
-- Unit test: similitudeGroup_multiplier_nonflat
example :
    let P : Matrix (Fin 2) (Fin 2) (ZMod 5) := (5 : ZMod 5) • !![0, 1; -1, 0]
    P = (1 : ZMod 5) • P ∧ P = (2 : ZMod 5) • P ∧ (1 : ZMod 5) ≠ 2 := by
  decide
end TauCeti.PEL.tests
