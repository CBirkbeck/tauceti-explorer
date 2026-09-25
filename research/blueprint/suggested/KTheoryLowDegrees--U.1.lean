import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.Algebra.Colimit.DirectLimit
import Mathlib.Algebra.EuclideanDomain.Basic
import Mathlib.Algebra.Group.Pi.Units
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.Module.StablyFree.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.Order.Ring.Units
import Mathlib.Algebra.Quaternion
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Idempotents.Karoubi
import Mathlib.CategoryTheory.Preadditive.AdditiveFunctor
import Mathlib.Data.Matrix.Basis
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.GroupTheory.Commutator.Basic
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.GeneralLinearGroup.Basic
import Mathlib.LinearAlgebra.InvariantBasisNumber
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.ElementaryRowOperations
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.Ideal
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.Matrix.Transvection
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.Projection
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.LinearAlgebra.Transvection.Generation
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.InfinitePlace.Embeddings
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Finiteness.Projective
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.Idempotents
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Length
import Mathlib.RingTheory.LocalRing.MaximalIdeal.Defs
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Morita.Matrix
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.Spectrum.Maximal.Defs
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Connected.Clopen
import Mathlib.Topology.LocallyConstant.Algebra
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace
import TauCeti.CategoryTheory.GrothendieckGroup.ObjectCodeMonoid
import TauCeti.LinearAlgebra.GeneralLinearGroup.Prod
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.LeftMulMatrix
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection
import TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Diagonal
import TauCeti.NumberTheory.NumberField.Units.Dirichlet
import TauCeti.RingTheory.DedekindDomain.SInteger.Spectrum
import TauCeti.RingTheory.DedekindDomain.SInteger.Unit
import TauCeti.RingTheory.Idempotents.Connected.Components

/-!
# Suggested Lean forms for `KTheoryLowDegrees--U.1` (stages Z.1, Z.2, U.1–U.6)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/KTheoryLowDegrees--U.1.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures; they claim no
implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` against the pinned commits (Mathlib `082e2d3` from a Lake project's packages,
and the imported Tau Ceti modules compiled from the pinned `f790474` sources with `lean -o` into a
directory placed first on `LEAN_PATH`); the only warnings are uses of `sorry`, also with
`autoImplicit` off and Mathlib's standard linter set switched on.

## Pinned conventions

* **`K₀` is formed from left modules**, as in Mathlib and Tau Ceti. Z.1's idempotent
  `e : Matrix ι ι R` presents the row-vector module `Rⁿe = range (v ↦ v ᵥ* e)`
  (`TauCeti.idempotentModule`), which is left `R`-linear for every ring.
* **The `K₁` class of an automorphism is formed from right modules with column vectors** (the
  K-book's and Bass's convention), i.e. from modules over `Aᵐᵒᵖ` in Mathlib
  (`TauCeti.KTheory.autClass`). For commutative rings the two agree and give Mathlib's column
  convention (`TauCeti.KTheory.autClassComm`, `Matrix.GeneralLinearGroup.toLin`). The row-vector
  convention would transpose matrices, which inverts `SK₁` classes.
* **`S` is a finite set of finite places**, `S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F))`
  with `S.Finite`, and `O_{F,S}` is Mathlib's `Set.integer S F`.
* **The DVR boundary** `∂ : K₁(L) → K₀(k)` satisfies `∂(π) = [k]` for every uniformiser `π`
  (`TauCeti.KTheory.K1.dvrBoundary_uniformizer`), so `∂ = v ∘ det`.
* **K-book locators**: PDF page = book page + 8 (Weibel's author-hosted draft of 29 August 2013).
* `K₁` is written multiplicatively; pairings and boundaries into `K₀` use `Additive (K1 B)`.
  Two-sided ideals are `Ideal A` with `[I.IsTwoSided]`, so that `A ⧸ I` is Mathlib's quotient
  ring (Mathlib's `TwoSidedIdeal` has no `A ⧸ I`).

## Library declarations imported and reused

* Tau Ceti: `TauCeti.finiteProjectiveModules`, `finiteProjectiveModules_iff` and
  `finiteProjectiveModulesExactStructure` (`CartanMap.lean`); `TauCeti.SplitK0` with `of`, `lift`,
  `map`, `mapEquiv`, `grothendieckAddGroupEquiv` and `AdditiveInvariant.mk`; `TauCeti.ObjectCode`,
  `TauCeti.objectCode` and its monoid structure; `TauCeti.ExactK0`, `ExactK0.of`,
  `ExactK0.fromSplitEquiv`; `TauCeti.SplitK0.finrankEquiv`; `TauCeti.transvectionUnit` and
  `TauCeti.transvectionWeylElement`; `Matrix.SpecialLinearGroup.diag2nUnit`;
  `LinearMap.GeneralLinearGroup.prodMap`; `TauCeti.unitsLeftMulMatrix`;
  `NumberField.unitsMulEquivTorsionProdMultiplicative`; `Set.unitEmptyEquivUnits`, `Set.unit_mono`
  and `IsDedekindDomain.integerHeightOneSpectrumEquiv`; `PrimeSpectrum.connectedComponentsIdeal`,
  `PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal` and the instance
  `PrimeSpectrum.connectedSpace_quotient_connectedComponentsIdeal`. Docstrings also cite, as
  proof routes, Tau Ceti declarations that no statement needs:
  `TauCeti.transvectionUnit_mem_of_adjacent` and `Set.mem_integer_iff` (in imported modules), and
  `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top` (with its `_of_field` form)
  and `Matrix.BlockTriangular.det_eq_prod_diag`, whose modules are not imported.
* Mathlib: `Matrix.GeneralLinearGroup` with `det`, `toLin`, `scalar` and `map`,
  `Matrix.SpecialLinearGroup.toGL`, `Matrix.single`, `Matrix.vecMulLinear`, `Matrix.reindex`,
  `Matrix.fromBlocks`, `RingHom.mapMatrix`; `DirectLimit` with `DirectedSystem`, `DirectLimit.lift`
  and `DirectLimit.map`; `Subgroup.closure`, `commutator`, `commutatorElement`, `QuotientGroup`,
  `Abelianization` with `equivOfComm`, `PresentedGroup`, `Relation.EqvGen`; `MulOpposite`,
  `RingEquiv.mopMatrix`, `LinearMap.toMatrixRight'`; `Module.Finite`, `Module.Projective`,
  `Module.Free`, `Module.IsStablyFree`, `ModuleCat.extendScalars`, `ModuleCat.restrictScalars`,
  `MoritaEquivalence`, `moritaEquivalenceMatrix`, `ModuleCat.matrixEquivalence`,
  `CategoryTheory.Idempotents.Karoubi`, `FGModuleCat`, `ObjectProperty.lift`; `Module.rankAtStalk`,
  `LocallyConstant`, `PrimeSpectrum` with `isIdempotentElemEquivClopens`, `ConnectedComponents`,
  `MaximalSpectrum`, `CompleteOrthogonalIdempotents`, `IsIdempotentElem.Corner`; `IsLocalRing`,
  `Localization.AtPrime`, `Localization.Away`, `IsLocalization`, `Zsqrtd`, `Quaternion`,
  `MvPolynomial`, `EuclideanDomain`, `CongruenceSubgroup.Gamma`; `Set.integer`,
  `Set.unitEquivUnitsInteger`, `IsDedekindDomain.HeightOneSpectrum` with `valuation`,
  `adicCompletion` and `adicCompletionIntegers`, `NumberField.RingOfIntegers`,
  `NumberField.Units.fundSystem`, `NumberField.Units.torsion`, `NumberField.IdeleClassGroup` with
  `ofAdicCompletion`, `NumberField.InfinitePlace`, `NumberField.IsTotallyComplex`,
  `Ideal.absNorm`; `Algebra.norm`, `Algebra.leftMulMatrix`, `Algebra.TensorProduct.includeRight`;
  `IsDiscreteValuationRing` with `addVal`, `Module.length`, `PowerSeries`, `LaurentSeries`;
  `MulEquiv.piUnits`, `MulEquiv.prodUnits`, `Pi.evalRingHom`.

## Real definitions, data sorries, helpers and omissions

The carriers are real definitions: `StableGL A` is Mathlib's `DirectLimit` of the `GL (Fin n) A`
along `g ↦ diag(g, 1)`; elementary matrices are `1 + e_ij(a)` over any ring; `E_n(A)`, `E(A)`,
`SK₁`, `GL(I)`, `E(A, I)` are subgroups given by closures and kernels; `K₁(A)` and `K₁(A, I)` are
quotient groups; `RingK0 R` is `SplitK0` of `finiteProjectiveModules R`, as in the companion file
`KTheoryLowDegrees--Z.3`; `HasStableRange` is a `Prop` with Bass's content; Mennicke symbols are
a structure of functions on `W_𝔮` satisfying the axioms, with the universal group a
`PresentedGroup`; the Dieudonné determinant takes values in `Abelianization Dˣ`. A few operations
whose construction is the work of the node (`autClass`, `K1.transfer`, `K1.smulK0`,
`K1.dvrBoundary`, `MennickeSymbol.sk1`, the Morita and idempotent-completion equivalences) are
`def`s with `sorry` bodies over the real carriers, each pinned by a characterising lemma. Helpers
that are not packet names (`glReindex`, `diagUnit`, `stabiliseMatrix`, `rightRes`, `unitsOneMod`,
`unitAway`, `sIntegerToAdicCompletionIntegers`, the test rings `CircleRing`, `swanSubring`, …)
say so in their docstrings. Statements needing a carrier that neither library provides and that
cannot honestly be defined here are left out: the plus construction `BGL(A)⁺`, K-theory spaces,
homotopy fibres and `π₁` of spaces (U.6), and the ring structure on `RingK0 A` owned by Z.3; a
comment `<name>: not stated here; needs … (supplier: …)` records each in place, so that every packet
name appears in this file.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct Matrix commutatorElement Quaternion Pointwise

universe u v w

/-! ## Stage `KTheoryLowDegrees:Z.1` — idempotent matrices, free-summand data and ring `K₀`

Left modules and row vectors throughout: an idempotent `e : Matrix ι ι R` acts on `ι → R` by
`v ↦ v ᵥ* e` (`Matrix.vecMulLinear`), which is left `R`-linear for every ring `R`, and presents the
row-vector module `Rⁿe`. Ring `K₀` is Tau Ceti's `SplitK0` of `finiteProjectiveModules R`, exactly
as in the companion file `KTheoryLowDegrees--Z.3` (`FP`, and `K0`/`cls` as spellings of
`RingK0`/`RingK0.of`), now for an arbitrary ring. -/

namespace TauCeti

namespace RingK0

variable (R : Type u) [Ring R]

/-- `FP R`: the full subcategory of finitely generated projective left `R`-modules, the spelling of
the companion file `KTheoryLowDegrees--Z.3`, here for an arbitrary ring. -/
abbrev FP := (TauCeti.finiteProjectiveModules R).FullSubcategory

end RingK0

/-! ### `KTheoryLowDegrees:Z.1/idempotent-module` -/

section IdempotentModule

variable {R : Type u} [Ring R] {ι κ : Type} [Fintype ι] [DecidableEq ι] [Fintype κ]
  [DecidableEq κ]

/-- **The module of an idempotent matrix** (`KTheoryLowDegrees:Z.1/idempotent-module`):
`P(e) := range (v ↦ v ᵥ* e)`, a left `R`-submodule of the row vectors `ι → R`, `e` acting on the
right. In the K-book's right-module notation this is `e(Rⁿ)`. -/
def idempotentModule (e : Matrix ι ι R) : Submodule R (ι → R) :=
  LinearMap.range (Matrix.vecMulLinear e)

omit [DecidableEq ι] in
/-- `v ∈ P(e) ↔ v ᵥ* e = v` for an idempotent `e`. -/
theorem mem_idempotentModule_iff {e : Matrix ι ι R} (he : IsIdempotentElem e) (v : ι → R) :
    v ∈ idempotentModule e ↔ v ᵥ* e = v := by
  sorry

/-- `P(1) = ⊤`. -/
@[simp]
theorem idempotentModule_one : idempotentModule (1 : Matrix ι ι R) = ⊤ := by
  sorry

omit [DecidableEq ι] in
/-- `P(0) = ⊥`. -/
@[simp]
theorem idempotentModule_zero : idempotentModule (0 : Matrix ι ι R) = ⊥ := by
  sorry

/-- The retraction `(ι → R) → P(e)`, `v ↦ v ᵥ* e` (a real definition); for idempotent `e` it is
the identity on `P(e)` (`idempotentModule.retraction_comp_subtype`). -/
def idempotentModule.retraction (e : Matrix ι ι R) : (ι → R) →ₗ[R] idempotentModule e :=
  (Matrix.vecMulLinear e).rangeRestrict

omit [DecidableEq ι] in
/-- The retraction restricts to the identity of `P(e)`. -/
theorem idempotentModule.retraction_comp_subtype {e : Matrix ι ι R} (he : IsIdempotentElem e) :
    idempotentModule.retraction e ∘ₗ (idempotentModule e).subtype = LinearMap.id := by
  sorry

omit [DecidableEq ι] [DecidableEq κ] in
/-- Reindexing along `σ : ι ≃ κ`: the coordinate permutation `v ↦ v ∘ σ.symm` maps `P(e)` onto
`P(reindex σ σ e)`. -/
theorem idempotentModule_reindex (σ : ι ≃ κ) (e : Matrix ι ι R) :
    (idempotentModule e).map (LinearEquiv.funCongrLeft R R σ.symm).toLinearMap =
      idempotentModule (Matrix.reindex σ σ e) := by
  sorry

/-- For `ι = Unit` and an idempotent `e ∈ R`, `P(e)` is the left ideal `R·e`. -/
theorem idempotentModule_unique {e : R} (he : IsIdempotentElem e) :
    idempotentModule (Matrix.of fun _ _ => e : Matrix Unit Unit R) = R ∙ (fun _ => e) := by
  sorry

-- test TauCeti.idempotentModule_one_test (degenerate)
example : idempotentModule (1 : Matrix (Fin 2) (Fin 2) R) = ⊤ ∧
    idempotentModule (0 : Matrix (Fin 2) (Fin 2) R) = ⊥ :=
  ⟨idempotentModule_one, idempotentModule_zero⟩

-- test TauCeti.idempotentModule_diag_test (computation)
/- `P(diag(1, 0)) = {(a, 0)}`, one-dimensional. -/
example {k : Type*} [Field k] :
    idempotentModule (Matrix.diagonal ![1, 0] : Matrix (Fin 2) (Fin 2) k) =
        LinearMap.ker (LinearMap.proj 1 : (Fin 2 → k) →ₗ[k] k) ∧
      Module.finrank k (idempotentModule (Matrix.diagonal ![1, 0] : Matrix (Fin 2) (Fin 2) k)) =
        1 := by
  sorry

-- test TauCeti.idempotentModule_rows_test (non-example)
/- Rows `(1, 1), (0, 0)`: `v ᵥ* e = (v₀, v₀)`, so `P(e) = {(a, a)}`; the column image
`{(a, 0)}` is a different submodule. -/
example : idempotentModule (!![1, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ) =
      LinearMap.ker ((LinearMap.proj 0 : (Fin 2 → ℚ) →ₗ[ℚ] ℚ) - LinearMap.proj 1) ∧
    LinearMap.range (Matrix.mulVecLin (!![1, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℚ)) ≠
      idempotentModule !![1, 1; 0, 0] := by
  sorry

-- test TauCeti.idempotentModule_prod_test (computation)
/- Over `ℤ × ℤ`, the `1 × 1` idempotent `(1, 0)` gives `R·(1, 0) = ℤ × 0`. -/
example : idempotentModule (!![((1 : ℤ), (0 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ)) =
    (ℤ × ℤ) ∙ (fun _ => ((1 : ℤ), (0 : ℤ))) := by
  sorry

/-! ### `KTheoryLowDegrees:Z.1/idempotent-module-finite-projective` -/

/-- `KTheoryLowDegrees:Z.1/idempotent-module-finite-projective`: for idempotent `e`, `P(e)` and
`P(1 - e)` are complementary, `v ↦ (v ᵥ* e, v ᵥ* (1 - e))` is an isomorphism
`(ι → R) ≃ P(e) × P(1 - e)`, and `P(e)` is finitely generated projective. -/
theorem idempotentModule_finite_projective {e : Matrix ι ι R} (he : IsIdempotentElem e) :
    IsCompl (idempotentModule e) (idempotentModule (1 - e)) ∧
      Function.Bijective
        ((idempotentModule.retraction e).prod (idempotentModule.retraction (1 - e))) ∧
      Module.Finite R (idempotentModule e) ∧ Module.Projective R (idempotentModule e) ∧
      finiteProjectiveModules R (ModuleCat.of R (idempotentModule e)) := by
  sorry

omit [DecidableEq ι] in
/-- Helper: the object-property form of `idempotentModule_finite_projective`, used to form the class
`[P(e)]`. -/
theorem finiteProjectiveModules_idempotentModule {e : Matrix ι ι R} (he : IsIdempotentElem e) :
    finiteProjectiveModules R (ModuleCat.of R (idempotentModule e)) := by
  classical
  exact (idempotentModule_finite_projective he).2.2.2.2

/-! ### `KTheoryLowDegrees:Z.1/idempotent-module-conj` and `Z.1/idempotent-module-block` -/

/-- `KTheoryLowDegrees:Z.1/idempotent-module-conj`: `g⁻¹ e g` is idempotent and `v ↦ v ᵥ* g` maps
`P(e)` onto `P(g⁻¹ e g)` (an isomorphism, with inverse `w ↦ w ᵥ* g⁻¹`). -/
theorem idempotentModule_conj {e : Matrix ι ι R} (he : IsIdempotentElem e) (g : GL ι R) :
    IsIdempotentElem ((g⁻¹ : GL ι R) * e * g : Matrix ι ι R) ∧
      (idempotentModule e).map (Matrix.vecMulLinear (g : Matrix ι ι R)) =
        idempotentModule ((g⁻¹ : GL ι R) * e * g : Matrix ι ι R) := by
  sorry

omit [DecidableEq ι] [DecidableEq κ] in
/-- `KTheoryLowDegrees:Z.1/idempotent-module-block`: `e ⊞ f = fromBlocks e 0 0 f` is idempotent
and the coordinate splitting `(ι ⊕ κ → R) ≃ (ι → R) × (κ → R)` carries `P(e ⊞ f)` onto
`P(e) × P(f)`; in particular `P(e ⊞ 0) ≅ P(e)`. -/
theorem idempotentModule_block {e : Matrix ι ι R} {f : Matrix κ κ R} (he : IsIdempotentElem e)
    (hf : IsIdempotentElem f) :
    IsIdempotentElem (Matrix.fromBlocks e 0 0 f) ∧
      (idempotentModule (Matrix.fromBlocks e 0 0 f)).map
          (LinearEquiv.sumArrowLequivProdArrow ι κ R R).toLinearMap =
        (idempotentModule e).prod (idempotentModule f) := by
  sorry

/-- `KTheoryLowDegrees:Z.1/iso-stably-conjugate`: from `φ : P(e) ≃ P(e')` build `A` (the matrix of
`v ↦ φ(v ᵥ* e)`) and `B` (that of `w ↦ φ⁻¹(w ᵥ* e')`); then `g = fromBlocks A (1 - e) (1 - e') B`
and `h = fromBlocks B (1 - e') (1 - e) A` are mutually inverse and `h (e ⊞ 0) g = e' ⊞ 0`. -/
theorem iso_stably_conjugate {e e' : Matrix ι ι R} (he : IsIdempotentElem e)
    (he' : IsIdempotentElem e') (φ : idempotentModule e ≃ₗ[R] idempotentModule e') :
    let A := LinearMap.toMatrixRight' ((idempotentModule e').subtype ∘ₗ φ.toLinearMap ∘ₗ
      idempotentModule.retraction e)
    let B := LinearMap.toMatrixRight' ((idempotentModule e).subtype ∘ₗ φ.symm.toLinearMap ∘ₗ
      idempotentModule.retraction e')
    Matrix.fromBlocks A (1 - e) (1 - e') B * Matrix.fromBlocks B (1 - e') (1 - e) A = 1 ∧
      Matrix.fromBlocks B (1 - e') (1 - e) A * Matrix.fromBlocks A (1 - e) (1 - e') B = 1 ∧
      Matrix.fromBlocks B (1 - e') (1 - e) A * Matrix.fromBlocks e 0 0 0 *
          Matrix.fromBlocks A (1 - e) (1 - e') B = Matrix.fromBlocks e' 0 0 0 := by
  sorry

end IdempotentModule

/-! ### `KTheoryLowDegrees:Z.1/free-summand-data` -/

/-- **Free-summand data** (`KTheoryLowDegrees:Z.1/free-summand-data`): `n ∈ ℕ` and left
`R`-linear maps `ι : P → Rⁿ`, `π : Rⁿ → P` with `π ∘ ι = id`. Data are not unique; only the
stabilised class of the idempotent `ι ∘ π` is (`Z.1/idempotent-classification`). -/
structure FreeSummandData (R : Type u) [Ring R] (P : Type v) [AddCommGroup P] [Module R P] where
  /-- The rank of the ambient free module. -/
  n : ℕ
  /-- The split injection `P → Rⁿ`. -/
  ι : P →ₗ[R] (Fin n → R)
  /-- The retraction `Rⁿ → P`. -/
  π : (Fin n → R) →ₗ[R] P
  /-- `π ∘ ι = id`. -/
  π_comp_ι : π ∘ₗ ι = LinearMap.id

namespace FreeSummandData

variable {R : Type u} [Ring R] {P : Type v} [AddCommGroup P] [Module R P]
  {P' : Type w} [AddCommGroup P'] [Module R P']

/-- Every finitely generated projective module admits free-summand data
(`Module.Finite.exists_comp_eq_id_of_projective`). -/
theorem «exists» [Module.Finite R P] [Module.Projective R P] :
    Nonempty (FreeSummandData R P) := by
  obtain ⟨n, f, g, -, -, h⟩ := Module.Finite.exists_comp_eq_id_of_projective R P
  exact ⟨⟨n, g, f, h⟩⟩

/-- A datum makes `P` finitely generated. -/
theorem finite (d : FreeSummandData R P) : Module.Finite R P :=
  Module.Finite.of_surjective d.π fun x => ⟨d.ι x, LinearMap.congr_fun d.π_comp_ι x⟩

/-- A datum makes `P` projective. -/
theorem projective (d : FreeSummandData R P) : Module.Projective R P :=
  Module.Projective.of_split d.ι d.π d.π_comp_ι

/-- The idempotent matrix `e := toMatrixRight' (ι ∘ π)` of a datum (row convention). -/
def idempotent (d : FreeSummandData R P) : Matrix (Fin d.n) (Fin d.n) R :=
  LinearMap.toMatrixRight' (d.ι ∘ₗ d.π)

/-- The idempotent of a datum is idempotent. -/
theorem isIdempotentElem_idempotent (d : FreeSummandData R P) : IsIdempotentElem d.idempotent := by
  sorry

/-- `P ≃ₗ P(e)`, `x ↦ ι x`. -/
def equivIdempotentModule (d : FreeSummandData R P) : P ≃ₗ[R] idempotentModule d.idempotent :=
  sorry

/-- The value of `equivIdempotentModule`. -/
theorem equivIdempotentModule_apply (d : FreeSummandData R P) (x : P) :
    (d.equivIdempotentModule x : Fin d.n → R) = d.ι x := by
  sorry

/-- The complement `Q := ker π` (a real definition). -/
def complement (d : FreeSummandData R P) : Submodule R (Fin d.n → R) :=
  LinearMap.ker d.π

/-- `range ι` and `ker π` are complementary. -/
theorem isCompl_range_complement (d : FreeSummandData R P) :
    IsCompl (LinearMap.range d.ι) d.complement := by
  sorry

/-- `P × ker π ≃ₗ Rⁿ`, `(x, q) ↦ ι x + q` (a real definition up to the bijectivity proof). -/
def prodComplementEquiv (d : FreeSummandData R P) : (P × d.complement) ≃ₗ[R] (Fin d.n → R) :=
  LinearEquiv.ofBijective (d.ι.coprod d.complement.subtype) (by sorry)

/-- The value of `prodComplementEquiv`. -/
theorem prodComplementEquiv_apply (d : FreeSummandData R P) (x : P) (q : d.complement) :
    d.prodComplementEquiv (x, q) = d.ι x + q :=
  rfl

/-- The complement is finitely generated projective. -/
theorem complement_finiteProjective (d : FreeSummandData R P) :
    Module.Finite R d.complement ∧ Module.Projective R d.complement := by
  sorry

/-- The datum of `P(e)`: `ι` the inclusion and `π = ρ_e`. -/
def ofIdempotent {m : ℕ} (e : Matrix (Fin m) (Fin m) R) (he : IsIdempotentElem e) :
    FreeSummandData R (idempotentModule e) where
  n := m
  ι := (idempotentModule e).subtype
  π := idempotentModule.retraction e
  π_comp_ι := idempotentModule.retraction_comp_subtype he

/-- The idempotent of `ofIdempotent e` is `e`. -/
theorem ofIdempotent_idempotent {m : ℕ} (e : Matrix (Fin m) (Fin m) R)
    (he : IsIdempotentElem e) : (ofIdempotent e he).idempotent = e := by
  sorry

/-- The block splitting `(Fin n → R) × (Fin n' → R) ≃ (Fin (n + n') → R)` (helper). -/
abbrev blockEquiv (n n' : ℕ) : ((Fin n → R) × (Fin n' → R)) ≃ₗ[R] (Fin (n + n') → R) :=
  (LinearEquiv.sumArrowLequivProdArrow (Fin n) (Fin n') R R).symm.trans
    (LinearEquiv.funCongrLeft R R finSumFinEquiv.symm)

/-- Data for `P` and `P'` give a datum for `P × P'` of rank `n + n'`. -/
def prod (d : FreeSummandData R P) (d' : FreeSummandData R P') :
    FreeSummandData R (P × P') where
  n := d.n + d'.n
  ι := (blockEquiv d.n d'.n).toLinearMap ∘ₗ d.ι.prodMap d'.ι
  π := d.π.prodMap d'.π ∘ₗ (blockEquiv d.n d'.n).symm.toLinearMap
  π_comp_ι := by sorry

/-- The idempotent of `prod` is the block sum, reindexed along `finSumFinEquiv`. -/
theorem prod_idempotent (d : FreeSummandData R P) (d' : FreeSummandData R P') :
    (d.prod d').idempotent =
      Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks d.idempotent 0 0 d'.idempotent) := by
  sorry

/-- Transport of a datum along `P ≃ₗ P'`, with the same idempotent (`congr_idempotent`). -/
def congr (d : FreeSummandData R P) (e : P ≃ₗ[R] P') : FreeSummandData R P' where
  n := d.n
  ι := d.ι ∘ₗ e.symm.toLinearMap
  π := e.toLinearMap ∘ₗ d.π
  π_comp_ι := by sorry

/-- `congr` does not change the idempotent. -/
theorem congr_idempotent (d : FreeSummandData R P) (e : P ≃ₗ[R] P') :
    (d.congr e).idempotent = d.idempotent := by
  sorry

-- test TauCeti.FreeSummandData.free_test (degenerate)
example (n : ℕ) :
    (⟨n, LinearMap.id, LinearMap.id, rfl⟩ : FreeSummandData R (Fin n → R)).idempotent = 1 ∧
      (⟨n, LinearMap.id, LinearMap.id, rfl⟩ : FreeSummandData R (Fin n → R)).complement = ⊥ := by
  sorry

-- test TauCeti.FreeSummandData.zero_test (degenerate)
example [Subsingleton P] (d : FreeSummandData R P) : d.idempotent = 0 ∧ d.complement = ⊤ := by
  sorry

-- test TauCeti.FreeSummandData.ofIdempotent_test (characterisation)
example {m : ℕ} (e : Matrix (Fin m) (Fin m) R) (he : IsIdempotentElem e) :
    (ofIdempotent e he).idempotent = e :=
  ofIdempotent_idempotent e he

-- test TauCeti.FreeSummandData.prod_field_test (computation)
/- `R = ℚ × ℚ`, `P = ℚ × 0` (the ideal spanned by `(1, 0)`), `n = 1`, `ι x = x`,
`π v = (1, 0)·v`: the idempotent is `(1, 0)` and the complement is `0 × ℚ`. -/
example (ι₁ : (Ideal.span {((1 : ℚ), (0 : ℚ))} : Ideal (ℚ × ℚ)) →ₗ[ℚ × ℚ] (Fin 1 → ℚ × ℚ))
    (π₁ : (Fin 1 → ℚ × ℚ) →ₗ[ℚ × ℚ] (Ideal.span {((1 : ℚ), (0 : ℚ))} : Ideal (ℚ × ℚ)))
    (hι : ∀ x, ι₁ x = fun _ => (x : ℚ × ℚ)) (hπ : ∀ v, (π₁ v : ℚ × ℚ) = ((1 : ℚ), (0 : ℚ)) * v 0)
    (h : π₁ ∘ₗ ι₁ = LinearMap.id) :
    (⟨1, ι₁, π₁, h⟩ : FreeSummandData (ℚ × ℚ) _).idempotent = !![((1 : ℚ), (0 : ℚ))] ∧
      ∀ v, v ∈ (⟨1, ι₁, π₁, h⟩ : FreeSummandData (ℚ × ℚ) _).complement ↔ (v 0).1 = 0 := by
  sorry

-- test TauCeti.FreeSummandData.not_unique_test (non-example)
/- For `P = ℚ`, the data `(1, id)` and `(2, x ↦ (x, 0), v ↦ v₀)` have idempotents `1 ∈ M₁(ℚ)` and
`diag(1, 0) ∈ M₂(ℚ)`. -/
example :
    (⟨1, LinearMap.pi fun _ => LinearMap.id, LinearMap.proj 0, rfl⟩ :
        FreeSummandData ℚ ℚ).idempotent = 1 ∧
      (⟨2, LinearMap.single ℚ (fun _ => ℚ) 0, LinearMap.proj 0,
          LinearMap.ext fun x => Pi.single_eq_same (M := fun _ : Fin 2 => ℚ) 0 x⟩ :
        FreeSummandData ℚ ℚ).idempotent = Matrix.diagonal ![1, 0] := by
  sorry

end FreeSummandData

/-! ### `KTheoryLowDegrees:Z.1/stable-idempotent-monoid` -/

section StableIdempotent

variable {R : Type u} [Ring R] {S : Type v} [Ring S] {T : Type w} [Ring T]
  {κ κ' : Type*} [Fintype κ] [DecidableEq κ] [Fintype κ'] [DecidableEq κ']

/-- Padding `e ∈ M_n(R)` to `M_N(R)` by zeros, the stabilisation `e ↦ diag(e, 0)` (helper, a real
definition; meaningful for `n ≤ N`). -/
def padMatrix {n : ℕ} (N : ℕ) (e : Matrix (Fin n) (Fin n) R) : Matrix (Fin N) (Fin N) R :=
  Matrix.of fun a b => if h : (a : ℕ) < n ∧ (b : ℕ) < n then e ⟨a, h.1⟩ ⟨b, h.2⟩ else 0

namespace StableIdempotent

variable (R) in
/-- Pairs `(n, e)` with `e ∈ M_n(R)` idempotent. -/
abbrev Pair : Type u := Σ n : ℕ, {e : Matrix (Fin n) (Fin n) R // IsIdempotentElem e}

variable (R) in
/-- Stabilised conjugacy: `(n, e) ∼ (m, f)` iff `g⁻¹ pad_N(e) g = pad_N(f)` for some `N ≥ n, m`
and `g ∈ GL_N(R)`. -/
def rel (x y : Pair R) : Prop :=
  ∃ N : ℕ, x.1 ≤ N ∧ y.1 ≤ N ∧ ∃ g : GL (Fin N) R,
    ((g⁻¹ : GL (Fin N) R) : Matrix (Fin N) (Fin N) R) * padMatrix N x.2.1 * g = padMatrix N y.2.1

variable (R) in
/-- The setoid of stabilised conjugacy. -/
def setoid : Setoid (Pair R) := ⟨rel R, by sorry⟩

/-- The block sum of two pairs, reindexed along `finSumFinEquiv`. -/
def pairAdd (x y : Pair R) : Pair R :=
  ⟨x.1 + y.1, Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks x.2.1 0 0 y.2.1),
    by sorry⟩

end StableIdempotent

variable (R) in
/-- **The monoid of stabilised idempotent matrices** `Idem(R)`
(`KTheoryLowDegrees:Z.1/stable-idempotent-monoid`): pairs `(n, e)` modulo stabilised
conjugacy, with `[e] + [f] = [e ⊞ f]` and `0 = [the 0 × 0 matrix]`. -/
def StableIdempotent : Type u := Quotient (StableIdempotent.setoid R)

namespace StableIdempotent

instance instAdd : Add (StableIdempotent R) :=
  ⟨Quotient.map₂ (sa := setoid R) (sb := setoid R) (sc := setoid R) pairAdd (by sorry)⟩

instance instZero : Zero (StableIdempotent R) :=
  ⟨Quotient.mk (setoid R) ⟨0, 0, IsIdempotentElem.zero⟩⟩

instance instAddCommMonoid : AddCommMonoid (StableIdempotent R) where
  add_assoc := by sorry
  zero_add := by sorry
  add_zero := by sorry
  add_comm := by sorry
  nsmul := nsmulRec

omit [DecidableEq κ] in
/-- The class `mk e := [reindex (Fintype.equivFin κ) e]` of an idempotent over a finite type. -/
def mk (e : Matrix κ κ R) (he : IsIdempotentElem e) : StableIdempotent R :=
  Quotient.mk (setoid R)
    ⟨Fintype.card κ, Matrix.reindex (Fintype.equivFin κ) (Fintype.equivFin κ) e, by sorry⟩

omit [DecidableEq κ] [DecidableEq κ'] in
/-- Reindexing does not change the class. -/
@[simp]
theorem mk_reindex (σ : κ ≃ κ') {e : Matrix κ κ R} (he : IsIdempotentElem e)
    (he' : IsIdempotentElem (Matrix.reindex σ σ e)) : mk (Matrix.reindex σ σ e) he' = mk e he := by
  sorry

/-- Equality of classes is stabilised conjugacy. -/
theorem mk_eq_mk_iff {n m : ℕ} {e : Matrix (Fin n) (Fin n) R} {f : Matrix (Fin m) (Fin m) R}
    (he : IsIdempotentElem e) (hf : IsIdempotentElem f) :
    mk e he = mk f hf ↔ ∃ N : ℕ, max n m ≤ N ∧ ∃ g : GL (Fin N) R,
      ((g⁻¹ : GL (Fin N) R) : Matrix (Fin N) (Fin N) R) * padMatrix N e * g = padMatrix N f := by
  sorry

/-- Conjugation does not change the class. -/
@[simp]
theorem mk_conj (g : GL κ R) {e : Matrix κ κ R} (he : IsIdempotentElem e)
    (he' : IsIdempotentElem ((g⁻¹ : GL κ R) * e * g : Matrix κ κ R)) :
    mk ((g⁻¹ : GL κ R) * e * g : Matrix κ κ R) he' = mk e he := by
  sorry

omit [DecidableEq κ] [DecidableEq κ'] in
/-- Stabilisation `e ↦ e ⊞ 0` does not change the class. -/
@[simp]
theorem mk_fromBlocks_zero {e : Matrix κ κ R} (he : IsIdempotentElem e)
    (he' : IsIdempotentElem (Matrix.fromBlocks e 0 0 (0 : Matrix κ' κ' R))) :
    mk (Matrix.fromBlocks e 0 0 (0 : Matrix κ' κ' R)) he' = mk e he := by
  sorry

omit [DecidableEq κ] [DecidableEq κ'] in
/-- The class of a block sum is the sum of the classes. -/
@[simp]
theorem mk_fromBlocks {e : Matrix κ κ R} {f : Matrix κ' κ' R} (he : IsIdempotentElem e)
    (hf : IsIdempotentElem f) (hef : IsIdempotentElem (Matrix.fromBlocks e 0 0 f)) :
    mk (Matrix.fromBlocks e 0 0 f) hef = mk e he + mk f hf := by
  sorry

/-- The zero matrix has class `0`. -/
@[simp]
theorem mk_zero {ι : Type*} [Fintype ι] : mk (0 : Matrix ι ι R) IsIdempotentElem.zero = 0 := by
  sorry

/-- Every element is `mk e` for an idempotent `e ∈ M_n(R)`. -/
theorem induction_on {motive : StableIdempotent R → Prop} (x : StableIdempotent R)
    (h : ∀ (n : ℕ) (e : Matrix (Fin n) (Fin n) R) (he : IsIdempotentElem e), motive (mk e he)) :
    motive x := by
  sorry

/-- Functoriality: `f : R →+* S` induces `[e] ↦ [e.map f]` (a real definition up to proofs). -/
def map (f : R →+* S) : StableIdempotent R →+ StableIdempotent S where
  toFun := Quotient.map (sa := setoid R) (sb := setoid S)
    (fun x => ⟨x.1, x.2.1.map f, x.2.2.map f.mapMatrix⟩) (by sorry)
  map_zero' := by sorry
  map_add' := by sorry

/-- The value of `map` on classes. -/
@[simp]
theorem map_mk (f : R →+* S) {ι : Type*} [Fintype ι] {e : Matrix ι ι R} (he : IsIdempotentElem e) :
    map f (mk e he) = mk (e.map f) (by rw [IsIdempotentElem, ← Matrix.map_mul, he.eq]) := by
  sorry

/-- `map` of the identity. -/
@[simp]
theorem map_id : map (RingHom.id R) = AddMonoidHom.id (StableIdempotent R) := by
  sorry

/-- `map` of a composite. -/
theorem map_comp (f : R →+* S) (g : S →+* T) : map (g.comp f) = (map g).comp (map f) := by
  sorry

-- test TauCeti.StableIdempotent.swap_test (computation)
example (h₁ : IsIdempotentElem (Matrix.diagonal ![(1 : R), 0]))
    (h₂ : IsIdempotentElem (Matrix.diagonal ![(0 : R), 1])) :
    mk (Matrix.diagonal ![(1 : R), 0]) h₁ = mk (Matrix.diagonal ![(0 : R), 1]) h₂ := by
  sorry

-- test TauCeti.StableIdempotent.zero_test (degenerate)
example (n : ℕ) : mk (0 : Matrix (Fin n) (Fin n) R) IsIdempotentElem.zero = 0 :=
  mk_zero

example [Subsingleton R] (x : StableIdempotent R) : x = 0 := by
  sorry

-- test TauCeti.StableIdempotent.field_test (computation)
example {k : Type u} [Field k] :
    (∀ {n m : ℕ} (e : Matrix (Fin n) (Fin n) k) (f : Matrix (Fin m) (Fin m) k)
        (he : IsIdempotentElem e) (hf : IsIdempotentElem f), mk e he = mk f hf ↔ e.rank = f.rank) ∧
      ∃ φ : StableIdempotent k ≃+ ℕ, ∀ (n : ℕ) (e : Matrix (Fin n) (Fin n) k)
        (he : IsIdempotentElem e), φ (mk e he) = e.rank := by
  sorry

-- test TauCeti.StableIdempotent.stabilise_test (non-example)
/- `mk 1₁ = mk diag(1, 0)` although the matrices have different sizes. -/
example {k : Type u} [Field k] (h : IsIdempotentElem (Matrix.diagonal ![(1 : k), 0])) :
    mk (1 : Matrix (Fin 1) (Fin 1) k) IsIdempotentElem.one =
      mk (Matrix.diagonal ![(1 : k), 0]) h := by
  sorry

-- test TauCeti.StableIdempotent.trace_test (characterisation)
example {A : Type u} [CommRing A] :
    ∃ tr : StableIdempotent A →+ A, ∀ (n : ℕ) (e : Matrix (Fin n) (Fin n) A)
      (he : IsIdempotentElem e), tr (mk e he) = e.trace := by
  sorry

example (h₁ : IsIdempotentElem (!![((1 : ℤ), (0 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))
    (h₂ : IsIdempotentElem (!![((0 : ℤ), (1 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) :
    [mk _ h₁, mk _ h₂, mk (1 : Matrix (Fin 1) (Fin 1) (ℤ × ℤ)) IsIdempotentElem.one, 0].Nodup := by
  sorry

end StableIdempotent

end StableIdempotent

/-! ### `KTheoryLowDegrees:Z.1/ring-k0` -/

/-- **K₀ of a ring** (`KTheoryLowDegrees:Z.1/ring-k0`): the reducible abbreviation
`SplitK0 (FP R)`, the split Grothendieck group of the finitely generated projective left
`R`-modules in `ModuleCat.{u} R`. No new presentation is introduced. -/
abbrev RingK0 (R : Type u) [Ring R] : Type u := SplitK0.{u} (RingK0.FP R)

namespace RingK0

section Basic

variable (R : Type u) [Ring R]

/-- The companion file's spelling `K0 R` (`KTheoryLowDegrees--Z.3`) of `RingK0 R`. -/
abbrev K0 : Type u := RingK0 R

/-- The class `[M] ∈ RingK0 R` of a finitely generated projective `M : Type u`. -/
abbrev of (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M] :
    RingK0 R :=
  SplitK0.of ⟨ModuleCat.of R M, finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩⟩

/-- The companion file's spelling `cls R M` of `RingK0.of R M`. -/
abbrev cls (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M] :
    RingK0 R :=
  of R M

variable {R}

/-- Isomorphic modules have the same class. -/
@[simp]
theorem of_congr {M N : Type u} [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] (e : M ≃ₗ[R] N) : of R M = of R N := by
  sorry

/-- `[M × N] = [M] + [N]`. -/
@[simp]
theorem of_prod (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] : of R (M × N) = of R M + of R N := by
  sorry

/-- `[Π i, M i] = Σ i, [M i]` for a finite family. (Mathlib has no instance for projectivity of a
dependent finite product; it is a hypothesis here.) -/
@[simp]
theorem of_pi {ι : Type} [Fintype ι] (M : ι → Type u) [∀ i, AddCommGroup (M i)]
    [∀ i, Module R (M i)] [∀ i, Module.Finite R (M i)] [∀ i, Module.Projective R (M i)]
    [Module.Projective R (∀ i, M i)] : of R (∀ i, M i) = ∑ i, of R (M i) := by
  sorry

/-- The class of a subsingleton module vanishes. -/
@[simp]
theorem of_subsingleton (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] [Subsingleton M] : of R M = 0 := by
  sorry

/-- `[Rⁿ] = n • [R]`. -/
@[simp]
theorem of_free (n : ℕ) : of R (Fin n → R) = n • of R R := by
  sorry

/-- The class `[P(e)]` of the module of an idempotent matrix. -/
def ofIdempotent {n : ℕ} (e : Matrix (Fin n) (Fin n) R) (he : IsIdempotentElem e) : RingK0 R :=
  SplitK0.of ⟨ModuleCat.of R (idempotentModule e), finiteProjectiveModules_idempotentModule he⟩

variable {G : Type*} [AddCommGroup G]

/-- The universal property: a linear-equivalence-invariant, product-additive function on finitely
generated projective modules induces `RingK0 R →+ G` (a real definition through `SplitK0.lift`). -/
def lift
    (c : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M],
      G)
    (_hc : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], (M ≃ₗ[R] N) → c M = c N)
    (_hprod : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], c (M × N) = c M + c N) :
    RingK0 R →+ G :=
  SplitK0.lift
    { obj := fun X => @c X.obj.carrier _ _ (finiteProjectiveModules_iff.mp X.property).1
        (finiteProjectiveModules_iff.mp X.property).2
      map_iso := fun _ _ _ => by sorry
      map_biprod := fun _ _ => by sorry }

/-- `lift c [M] = c M`. -/
@[simp]
theorem lift_of
    (c : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M],
      G)
    (hc : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], (M ≃ₗ[R] N) → c M = c N)
    (hprod : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], c (M × N) = c M + c N)
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M] :
    lift c hc hprod (of R M) = c M := by
  sorry

/-- Uniqueness in the universal property. -/
theorem lift_unique
    (c : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M],
      G)
    (hc : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], (M ≃ₗ[R] N) → c M = c N)
    (hprod : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], c (M × N) = c M + c N) (f : RingK0 R →+ G)
    (hf : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M], f (of R M) = c M) :
    f = lift c hc hprod := by
  sorry

/-- Two additive maps out of `RingK0 R` agreeing on every `[M]` are equal. -/
theorem hom_ext {f g : RingK0 R →+ G}
    (h : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M], f (of R M) = g (of R M)) : f = g := by
  sorry

variable (R) in
/-- `RingK0 R ≃+` the group completion of the monoid of isomorphism classes, the existing
`SplitK0.grothendieckAddGroupEquiv` (inverted). -/
def grothendieckAddGroupEquiv :
    RingK0 R ≃+ Algebra.GrothendieckAddGroup (ObjectCode.{u} (FP R)) :=
  (SplitK0.grothendieckAddGroupEquiv.{u} (FP R)).symm

-- test TauCeti.RingK0.zero_ring_test (degenerate)
example [Subsingleton R] : Subsingleton (RingK0 R) := by
  sorry

-- test TauCeti.RingK0.of_prod_test (computation)
/- Over `ℤ × ℤ`: `[ℤ × 0] + [0 × ℤ] = [R]`, with `ℤ × 0` and `0 × ℤ` the idempotent modules of
`(1, 0)` and `(0, 1)`. -/
example (h₁ : IsIdempotentElem (!![((1 : ℤ), (0 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))
    (h₂ : IsIdempotentElem (!![((0 : ℤ), (1 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) :
    ofIdempotent _ h₁ + ofIdempotent _ h₂ = of (ℤ × ℤ) (ℤ × ℤ) := by
  sorry

-- test TauCeti.RingK0.free_test (computation)
example {k : Type u} [Field k] : of k (Fin 2 → k) = 2 • of k k :=
  of_free 2

-- test TauCeti.RingK0.grothendieck_test (compatibility)
example (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M] :
    grothendieckAddGroupEquiv R (of R M) =
      Algebra.GrothendieckAddGroup.of
        (objectCode.{u} (⟨ModuleCat.of R M, finiteProjectiveModules_iff.mpr
          ⟨inferInstance, inferInstance⟩⟩ : FP R)) :=
  SplitK0.grothendieckAddGroupEquiv_symm_of.{u} _

-- test TauCeti.RingK0.swindle_test (non-example)
example : of ℤ ℤ ≠ 0 := by
  sorry

end Basic

/-! ### `KTheoryLowDegrees:Z.1/ring-k0-exact` and `Z.1/ring-k0-class-induction` -/

section Exact

variable (R : Type u) [Ring R]

/-- `RingK0.toExactK0 : RingK0 R ≃+ ExactK0 (finiteProjectiveModulesExactStructure R)`: every
conflation splits, so `ExactK0.fromSplitEquiv` applies. -/
def toExactK0 : RingK0 R ≃+ ExactK0.{u} (finiteProjectiveModulesExactStructure R) :=
  ExactK0.fromSplitEquiv (fun _ => by sorry)

variable {R}

/-- `toExactK0 [M] = ExactK0.of M`. -/
@[simp]
theorem toExactK0_of (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] :
    toExactK0 R (of R M) = (ExactK0.of (⟨ModuleCat.of R M, finiteProjectiveModules_iff.mpr
      ⟨inferInstance, inferInstance⟩⟩ : FP R) :
        ExactK0.{u} (finiteProjectiveModulesExactStructure R)) := by
  sorry

/-- `KTheoryLowDegrees:Z.1/ring-k0-exact`: the direct-sum relations already impose the
exact-sequence
relations: for `0 → M₁ → M₂ → M₃ → 0` exact with finitely generated projective terms,
`[M₂] = [M₁] + [M₃]` (so `toExactK0` is an isomorphism). -/
theorem ringK0_exact {M₁ M₂ M₃ : Type u} [AddCommGroup M₁] [Module R M₁] [Module.Finite R M₁]
    [Module.Projective R M₁] [AddCommGroup M₂] [Module R M₂] [Module.Finite R M₂]
    [Module.Projective R M₂] [AddCommGroup M₃] [Module R M₃] [Module.Finite R M₃]
    [Module.Projective R M₃] (f : M₁ →ₗ[R] M₂) (g : M₂ →ₗ[R] M₃) (hf : Function.Injective f)
    (hfg : Function.Exact f g) (hg : Function.Surjective g) :
    of R M₂ = of R M₁ + of R M₃ := by
  sorry

/-- `KTheoryLowDegrees:Z.1/ring-k0-class-induction` (a): induction on classes of modules. -/
theorem class_induction {motive : RingK0 R → Prop} (x : RingK0 R) (zero : motive 0)
    (of : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M], motive (of R M))
    (add : ∀ a b, motive a → motive b → motive (a + b)) (neg : ∀ a, motive a → motive (-a)) :
    motive x := by
  sorry

/-- `KTheoryLowDegrees:Z.1/ring-k0-class-induction` (b), (c): every class is `[P] - [Q]`, and even
`[P] - n • [R]` (cofinality of free modules). -/
theorem class_induction_sub (x : RingK0 R) :
    (∃ P Q : FP R, x = (SplitK0.of P : RingK0 R) - (SplitK0.of Q : RingK0 R)) ∧
      ∃ (P : FP R) (n : ℕ), x = (SplitK0.of P : RingK0 R) - n • of R R := by
  sorry

end Exact

end RingK0

/-! ### `KTheoryLowDegrees:Z.1/idempotent-classification`, `Z.1/projective-karoubi` and
`Z.1/ring-k0-idempotent-completion` -/

section Classification

variable (R : Type u) [Ring R]

/-- `KTheoryLowDegrees:Z.1/idempotent-classification`: `mk e ↦ objectCode P(e)` is an isomorphism
of additive monoids `Idem(R) ≃+ ObjectCode (FP R)`; equivalently every finitely generated
projective is some `P(e)`, and `P(e) ≅ P(f) ↔ mk e = mk f`. -/
theorem idempotent_classification :
    (∃ Φ : StableIdempotent R ≃+ ObjectCode.{u} (RingK0.FP R),
      ∀ {n : ℕ} (e : Matrix (Fin n) (Fin n) R) (he : IsIdempotentElem e),
        Φ (StableIdempotent.mk e he) = objectCode.{u} (⟨ModuleCat.of R (idempotentModule e),
          finiteProjectiveModules_idempotentModule he⟩ : RingK0.FP R)) ∧
      (∀ (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P],
        ∃ (n : ℕ) (e : Matrix (Fin n) (Fin n) R) (_ : IsIdempotentElem e),
          Nonempty (P ≃ₗ[R] idempotentModule e)) ∧
      ∀ {n m : ℕ} (e : Matrix (Fin n) (Fin n) R) (f : Matrix (Fin m) (Fin m) R)
        (he : IsIdempotentElem e) (hf : IsIdempotentElem f),
        StableIdempotent.mk e he = StableIdempotent.mk f hf ↔
          Nonempty (idempotentModule e ≃ₗ[R] idempotentModule f) := by
  sorry

/-- The modules `Fin n → R` (up to isomorphism), whose full subcategory is `Free(R)` (helper for
`Z.1/projective-karoubi`). -/
def freeModules : ObjectProperty (ModuleCat.{u} R) :=
  fun M => ∃ n : ℕ, Nonempty (M ≅ ModuleCat.of R (Fin n → R))

/-- `KTheoryLowDegrees:Z.1/projective-karoubi`: the idempotent completion of `Free(R)` is
equivalent to `FP R`, sending `(Rⁿ, p)` to the image of `p`. -/
theorem projective_karoubi :
    ∃ E : Idempotents.Karoubi (freeModules R).FullSubcategory ≌ RingK0.FP R,
      ∀ X : Idempotents.Karoubi (freeModules R).FullSubcategory,
        Nonempty ((E.functor.obj X).obj ≅ ModuleCat.of R (LinearMap.range X.p.hom.hom)) := by
  sorry

/-- The isomorphism `RingK0 R ≃+ GrothendieckAddGroup Idem(R)` of
`Z.1/ring-k0-idempotent-completion` (data; its value on classes is `ringK0_idempotent_completion`).
-/
def RingK0.idempotentCompletionEquiv :
    RingK0 R ≃+ Algebra.GrothendieckAddGroup (StableIdempotent R) :=
  sorry

/-- `KTheoryLowDegrees:Z.1/ring-k0-idempotent-completion`: `K₀` is the group completion of
stabilised idempotents, `[P(e)] ↦ [mk e]`. -/
theorem RingK0.idempotent_completion {n : ℕ} (e : Matrix (Fin n) (Fin n) R)
    (he : IsIdempotentElem e) :
    RingK0.idempotentCompletionEquiv R (RingK0.ofIdempotent e he) =
      Algebra.GrothendieckAddGroup.of (StableIdempotent.mk e he) := by
  sorry

end Classification

/-! ### `KTheoryLowDegrees:Z.1/stable-isomorphism-criterion`, `Z.1/stably-free-class`,
`Z.1/free-class-ibn` -/

namespace RingK0

section Stable

variable (R : Type u) [Ring R]

/-- `KTheoryLowDegrees:Z.1/stable-isomorphism-criterion`: `[P] = [Q]` iff
`P × Rⁿ ≃ₗ Q × Rⁿ` for some `n`. -/
theorem stable_isomorphism_criterion (P Q : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] [AddCommGroup Q] [Module R Q] [Module.Finite R Q]
    [Module.Projective R Q] :
    of R P = of R Q ↔ ∃ n : ℕ, Nonempty ((P × (Fin n → R)) ≃ₗ[R] (Q × (Fin n → R))) := by
  sorry

/-- `KTheoryLowDegrees:Z.1/stably-free-class`: `[P] = n • [R]` iff `P × Rᵏ ≃ R^{n+k}` for some `k`;
and `[P] ∈ ℤ • [R]` iff `P` is stably free (Mathlib's `Module.IsStablyFree`). -/
theorem stably_free_class (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] :
    (∀ n : ℕ, of R P = n • of R R ↔
      ∃ k : ℕ, Nonempty ((P × (Fin k → R)) ≃ₗ[R] (Fin (n + k) → R))) ∧
      (of R P ∈ AddSubgroup.zmultiples (of R R) ↔ Module.IsStablyFree R P) := by
  sorry

/-- The free class `ℤ →+ RingK0 R`, `m ↦ m • [R]` (a real definition). -/
def freeClass : ℤ →+ RingK0 R :=
  zmultiplesHom _ (of R R)

/-- `KTheoryLowDegrees:Z.1/free-class-ibn`: `freeClass` is injective iff `R` has the (left)
invariant basis number; under IBN it is bijective iff every finitely generated projective is stably
free. (Correcting K-book Lemma II.2.1(2): an abstract `K₀(R) ≅ ℤ` does not suffice.) -/
theorem free_class_ibn :
    (Function.Injective (freeClass R) ↔ InvariantBasisNumber R) ∧
      (InvariantBasisNumber R → (Function.Bijective (freeClass R) ↔
        ∀ (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
          [Module.Projective R P], Module.IsStablyFree R P)) := by
  sorry

end Stable

end RingK0

/-! ### `KTheoryLowDegrees:Z.1/extend-scalars` -/

section ExtendScalarsSection

variable {R S : Type u} [Ring R] [Ring S] (f : R →+* S) (M : Type v) [AddCommGroup M] [Module R M]

/-- The balancing relations `(s·f(r)) ⊗ m - s ⊗ (r • m)`, as a left `S`-submodule of `S ⊗[ℤ] M`. -/
def ExtendScalars.rel : Submodule S (S ⊗[ℤ] M) :=
  Submodule.span S {x | ∃ (s : S) (r : R) (m : M), x = (s * f r) ⊗ₜ m - s ⊗ₜ (r • m)}

/-- **Extension of scalars along an arbitrary ring homomorphism**
(`KTheoryLowDegrees:Z.1/extend-scalars`): `ExtendScalars f M := (S ⊗[ℤ] M) ⧸ N_f`, a left
`S`-module through the left factor (a real definition). -/
def ExtendScalars : Type (max u v) := (S ⊗[ℤ] M) ⧸ ExtendScalars.rel f M

namespace ExtendScalars

instance instAddCommGroup : AddCommGroup (ExtendScalars f M) :=
  inferInstanceAs (AddCommGroup ((S ⊗[ℤ] M) ⧸ ExtendScalars.rel f M))

instance instModule : Module S (ExtendScalars f M) :=
  inferInstanceAs (Module S ((S ⊗[ℤ] M) ⧸ ExtendScalars.rel f M))

variable {M}

/-- `tmul s m`, written `s ⊗ m`: the class of `s ⊗ₜ m`. -/
def tmul (s : S) (m : M) : ExtendScalars f M :=
  Submodule.Quotient.mk (s ⊗ₜ[ℤ] m)

/-- The balancing relation `(s·f(r)) ⊗ m = s ⊗ (r • m)`. -/
theorem tmul_smul (s : S) (r : R) (m : M) : tmul f (s * f r) m = tmul f s (r • m) := by
  sorry

/-- `s' • (s ⊗ m) = (s' * s) ⊗ m`. -/
@[simp]
theorem smul_tmul (s' s : S) (m : M) : s' • tmul f s m = tmul f (s' * s) m := by
  sorry

/-- Every element is a finite sum of elements `s ⊗ m`. -/
theorem induction_on {motive : ExtendScalars f M → Prop} (x : ExtendScalars f M) (zero : motive 0)
    (tmul : ∀ s m, motive (tmul f s m)) (add : ∀ a b, motive a → motive b → motive (a + b)) :
    motive x := by
  sorry

variable (M) in
/-- The universal property: `φ : M →ₗ[R] f_*N` induces `ExtendScalars f M →ₗ[S] N`,
`s ⊗ m ↦ s • φ m`. -/
def lift (N : ModuleCat.{w} S) (φ : M →ₗ[R] (ModuleCat.restrictScalars f).obj N) :
    ExtendScalars f M →ₗ[S] N :=
  sorry

/-- `lift φ (s ⊗ m) = s • φ m`. -/
@[simp]
theorem lift_tmul (N : ModuleCat.{w} S) (φ : M →ₗ[R] (ModuleCat.restrictScalars f).obj N)
    (s : S) (m : M) : lift f M N φ (tmul f s m) = s • (φ m : N) := by
  sorry

variable (M) in
/-- `lift` is a bijection. -/
def liftEquiv (N : ModuleCat.{w} S) :
    (M →ₗ[R] (ModuleCat.restrictScalars f).obj N) ≃ (ExtendScalars f M →ₗ[S] N) :=
  sorry

/-- `S`-linear maps agreeing on all `1 ⊗ m` are equal. -/
theorem hom_ext {N : Type w} [AddCommGroup N] [Module S N] {g₁ g₂ : ExtendScalars f M →ₗ[S] N}
    (h : ∀ m, g₁ (tmul f 1 m) = g₂ (tmul f 1 m)) : g₁ = g₂ := by
  sorry

/-- Extension of scalars as a functor `ModuleCat R ⥤ ModuleCat S`. -/
def functor : ModuleCat.{u} R ⥤ ModuleCat.{u} S where
  obj M := ModuleCat.of S (ExtendScalars f M)
  map _ := sorry
  map_id := by sorry
  map_comp := by sorry

/-- The functor is additive. -/
instance functor_additive : (functor f).Additive := by
  sorry

/-- The adjunction `ExtendScalars.functor f ⊣ ModuleCat.restrictScalars f`. -/
def adj : functor f ⊣ ModuleCat.restrictScalars.{u} f :=
  sorry

/-- Extension along the identity is the identity. -/
def functorId : functor (RingHom.id R) ≅ 𝟭 (ModuleCat.{u} R) :=
  sorry

/-- Extension along a composite is the composite. -/
def functorComp {T : Type u} [Ring T] (g : S →+* T) : functor (g.comp f) ≅ functor f ⋙ functor g :=
  sorry

/-- `ExtendScalars f R ≃ₗ[S] S`, `s ⊗ r ↦ s * f r`. -/
def selfEquiv : ExtendScalars f R ≃ₗ[S] S :=
  sorry

/-- The value of `selfEquiv`. -/
@[simp]
theorem selfEquiv_tmul (s : S) (r : R) : selfEquiv f (tmul f s r) = s * f r := by
  sorry

/-- For commutative rings, `functor f ≅ ModuleCat.extendScalars f`, `s ⊗ m ↦ s ⊗ₜ m`. -/
def isoExtendScalars {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    functor f ≅ (ModuleCat.extendScalars.{u, u, u} f : ModuleCat.{u} R ⥤ ModuleCat.{u} S) :=
  sorry

open ChangeOfRings in
/-- The value of `isoExtendScalars`: `s ⊗ m ↦ s ⊗ₜ m`. -/
theorem isoExtendScalars_hom_tmul {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (N : ModuleCat.{u} R) (s : S) (m : N) :
    (isoExtendScalars f).hom.app N (tmul f s m) = s ⊗ₜ[R,f] m := by
  sorry

/-- For a two-sided ideal `I`: `ExtendScalars (R → R ⧸ I) M ≃ M ⧸ I • ⊤`. -/
def quotientEquiv (I : Ideal R) [I.IsTwoSided] :
    ExtendScalars (Ideal.Quotient.mk I) M ≃+ M ⧸ (I • (⊤ : Submodule R M)) :=
  sorry

-- test TauCeti.ExtendScalars.self_test (computation)
example : Nonempty (ExtendScalars f R ≃ₗ[S] S) ∧
    Nonempty (ExtendScalars (RingHom.id R) M ≃ₗ[R] M) := by
  sorry

-- test TauCeti.ExtendScalars.balanced_test (non-example)
/- `ExtendScalars fst (ℤ × ℤ) ≃ ℤ`, whereas the unbalanced `ℤ ⊗[ℤ] (ℤ × ℤ)` is `ℤ²`. -/
example : Nonempty (ExtendScalars (RingHom.fst ℤ ℤ) (ℤ × ℤ) ≃ₗ[ℤ] ℤ) ∧
    ¬ Nonempty (ExtendScalars (RingHom.fst ℤ ℤ) (ℤ × ℤ) ≃ₗ[ℤ] (ℤ × ℤ)) ∧
    Nonempty ((ℤ ⊗[ℤ] (ℤ × ℤ)) ≃ₗ[ℤ] (ℤ × ℤ)) := by
  sorry

open ChangeOfRings in
-- test TauCeti.ExtendScalars.commRing_test (compatibility)
example {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) (N : ModuleCat.{u} R) (s : S)
    (m : N) : (isoExtendScalars f).hom.app N (tmul f s m) = s ⊗ₜ[R,f] m :=
  isoExtendScalars_hom_tmul f N s m

-- test TauCeti.ExtendScalars.quotient_test (computation)
example : Nonempty (ExtendScalars (Int.castRingHom (ZMod 2)) (Fin 3 → ℤ) ≃ₗ[ZMod 2]
      (Fin 3 → ZMod 2)) ∧
    Nonempty (ExtendScalars (Int.castRingHom (ZMod 2)) (ZMod 4) ≃ₗ[ZMod 2] ZMod 2) := by
  sorry

-- test TauCeti.ExtendScalars.comp_test (characterisation)
/- For `ℤ → ℚ → ℝ`, `functorComp` identifies `r ⊗ (q ⊗ m)` with `(r·q) ⊗ m`. -/
example (N : ModuleCat.{0} ℤ) (r : ℝ) (q : ℚ) (m : N) :
    (functorComp (Int.castRingHom ℚ) (Rat.castHom ℝ)).inv.app N
        (tmul (Rat.castHom ℝ) r (tmul (Int.castRingHom ℚ) q m)) =
      tmul ((Rat.castHom ℝ).comp (Int.castRingHom ℚ)) (r * q) m := by
  sorry

end ExtendScalars

/-! ### `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective` -/

namespace ExtendScalars

/-- `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`: (a) `ExtendScalars f Rⁿ ≅ Sⁿ`,
`1 ⊗ eᵢ ↦ eᵢ`, carrying `v ↦ v ᵥ* A` to `w ↦ w ᵥ* A.map f`; (b) finitely generated projectives go
to finitely generated projectives; (c) `ExtendScalars f P(e) ≅ P(e.map f)`. -/
theorem extendScalars_finite_projective :
    (∃ ε : ∀ n : ℕ, ExtendScalars f (Fin n → R) ≃ₗ[S] (Fin n → S),
      (∀ (n : ℕ) (i : Fin n), ε n (tmul f 1 (Pi.single i 1)) = Pi.single i 1) ∧
        ∀ (m n : ℕ) (A : Matrix (Fin m) (Fin n) R) (s : S) (v : Fin m → R),
          ε n (tmul f s (v ᵥ* A)) = ε m (tmul f s v) ᵥ* A.map f) ∧
      (∀ (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P],
        Module.Finite S (ExtendScalars f P) ∧ Module.Projective S (ExtendScalars f P)) ∧
      ∀ {n : ℕ} (e : Matrix (Fin n) (Fin n) R), IsIdempotentElem e →
        Nonempty (ExtendScalars f (idempotentModule e) ≃ₗ[S] idempotentModule (e.map f)) := by
  sorry

instance instFinite (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] : Module.Finite S (ExtendScalars f P) :=
  ((extendScalars_finite_projective f).2.1 P).1

instance instProjective (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] : Module.Projective S (ExtendScalars f P) :=
  ((extendScalars_finite_projective f).2.1 P).2

/-- (d) The restriction `FP R ⥤ FP S` of extension of scalars (a real definition through
`ObjectProperty.lift`). -/
def finiteProjectiveFunctor : RingK0.FP R ⥤ RingK0.FP S :=
  (finiteProjectiveModules S).lift ((finiteProjectiveModules R).ι ⋙ functor f) fun X =>
    finiteProjectiveModules_iff.mpr
      (@(extendScalars_finite_projective f).2.1 X.obj.carrier _ _
        (finiteProjectiveModules_iff.mp X.property).1 (finiteProjectiveModules_iff.mp X.property).2)

/-- (d) The restricted functor is additive. -/
instance finiteProjectiveFunctor_additive : (finiteProjectiveFunctor f).Additive := by
  sorry

end ExtendScalars

end ExtendScalarsSection

/-! ### `KTheoryLowDegrees:Z.1/ring-k0-map` -/

namespace RingK0

section Map

variable {R : Type u} [Ring R] {S : Type u} [Ring S] {T : Type u} [Ring T]

/-- **Scalar extension on `K₀`** (`KTheoryLowDegrees:Z.1/ring-k0-map`): `SplitK0.map` of the
additive functor `FP R ⥤ FP S`, `[P] ↦ [ExtendScalars f P]`. -/
def map (f : R →+* S) : RingK0 R →+ RingK0 S :=
  SplitK0.map (ExtendScalars.finiteProjectiveFunctor f)

/-- `map f [P] = [ExtendScalars f P]`. -/
@[simp]
theorem map_of (f : R →+* S) (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] : map f (of R P) = of S (ExtendScalars f P) := by
  sorry

/-- `map` of the identity. -/
@[simp]
theorem map_id : map (RingHom.id R) = AddMonoidHom.id (RingK0 R) := by
  sorry

/-- `map` of a composite. -/
theorem map_comp (f : R →+* S) (g : S →+* T) : map (g.comp f) = (map g).comp (map f) := by
  sorry

/-- `map f [R] = [S]`. -/
@[simp]
theorem map_one (f : R →+* S) : map f (of R R) = of S S := by
  sorry

/-- `map f [P(e)] = [P(e.map f)]`. -/
@[simp]
theorem map_ofIdempotent (f : R →+* S) {n : ℕ} (e : Matrix (Fin n) (Fin n) R)
    (he : IsIdempotentElem e) :
    map f (ofIdempotent e he) = ofIdempotent (f.mapMatrix e) (he.map f.mapMatrix) := by
  sorry

/-- For commutative rings, `map [P] = [S ⊗[R] P]` with Mathlib's tensor product. -/
theorem map_of_commRing {A B : Type u} [CommRing A] [CommRing B] [Algebra A B] (P : Type u)
    [AddCommGroup P] [Module A P] [Module.Finite A P] [Module.Projective A P] :
    map (algebraMap A B) (of A P) = of B (B ⊗[A] P) := by
  sorry

/-- A ring isomorphism gives an additive equivalence (a real definition up to the two inverse
laws). -/
def mapEquiv (e : R ≃+* S) : RingK0 R ≃+ RingK0 S :=
  { map e.toRingHom with
    invFun := map e.symm.toRingHom
    left_inv := by sorry
    right_inv := by sorry }

/-- Under `Z.1/ring-k0-idempotent-completion`, `map f` is the group completion of
`StableIdempotent.map f`. -/
theorem map_idempotentCompletion (f : R →+* S) (x : RingK0 R) :
    idempotentCompletionEquiv S (map f x) =
      Algebra.GrothendieckAddGroup.lift
        (Algebra.GrothendieckAddGroup.of.comp (StableIdempotent.map f))
        (idempotentCompletionEquiv R x) := by
  sorry

-- test TauCeti.RingK0.map_id_test (degenerate)
example (x : RingK0 R) : map (RingHom.id R) x = x := by
  rw [map_id, AddMonoidHom.id_apply]

-- test TauCeti.RingK0.map_zero_ring_test (degenerate)
example [Subsingleton S] (f : R →+* S) : map f = 0 := by
  sorry

-- test TauCeti.RingK0.map_rat_test (compatibility)
example : map (Int.castRingHom ℚ) (of ℤ (Fin 2 → ℤ)) = of ℚ (Fin 2 → ℚ) ∧
    ∀ (P : Type) [AddCommGroup P] [Module ℤ P] [Module.Finite ℤ P] [Module.Projective ℤ P],
      map (algebraMap ℤ ℚ) (of ℤ P) = of ℚ (ℚ ⊗[ℤ] P) := by
  sorry

-- test TauCeti.RingK0.map_fst_test (computation)
/- `map fst [ℤ × 0] = [ℤ]` and `map fst [0 × ℤ] = 0`, with `ℤ × 0`, `0 × ℤ` the idempotent
modules of `(1, 0)`, `(0, 1)`. -/
example (h₁ : IsIdempotentElem (!![((1 : ℤ), (0 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))
    (h₂ : IsIdempotentElem (!![((0 : ℤ), (1 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) :
    map (RingHom.fst ℤ ℤ) (ofIdempotent _ h₁) = of ℤ ℤ ∧
      map (RingHom.fst ℤ ℤ) (ofIdempotent _ h₂) = 0 := by
  sorry

-- test TauCeti.RingK0.map_not_injective_test (non-example)
example (h₂ : IsIdempotentElem (!![((0 : ℤ), (1 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) :
    ofIdempotent _ h₂ ≠ 0 ∧ map (RingHom.snd ℤ ℤ) (ofIdempotent _ h₂) = of ℤ ℤ ∧
      map (RingHom.fst ℤ ℤ) (ofIdempotent _ h₂) = 0 := by
  sorry

end Map

end RingK0

/-! ### `KTheoryLowDegrees:Z.1/restrict-scalars-finite-projective` and `Z.1/ring-k0-transfer` -/

section Restrict

variable {R S : Type u} [Ring R] [Ring S]

/-- `KTheoryLowDegrees:Z.1/restrict-scalars-finite-projective`: if `S` is finitely generated
projective as a left `R`-module through `f`, restriction of scalars preserves finitely generated
projectives. -/
theorem restrictScalars_finite_projective (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S)))
    (Q : ModuleCat.{u} S) (hQ : finiteProjectiveModules S Q) :
    finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj Q) := by
  sorry

/-- The restricted functor `FP S ⥤ FP R` (helper, a real definition through `ObjectProperty.lift`).
-/
def restrictScalarsFP (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S))) :
    RingK0.FP S ⥤ RingK0.FP R :=
  (finiteProjectiveModules R).lift
    ((finiteProjectiveModules S).ι ⋙ ModuleCat.restrictScalars f) fun X =>
      restrictScalars_finite_projective f hf X.obj X.property

/-- The restricted functor is additive. -/
instance restrictScalarsFP_additive (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S))) :
    (restrictScalarsFP f hf).Additive := by
  sorry

end Restrict

namespace RingK0

section Transfer

variable {R S T : Type u} [Ring R] [Ring S] [Ring T]

/-- **The transfer on `K₀`** (`KTheoryLowDegrees:Z.1/ring-k0-transfer`): `SplitK0.map` of
restriction of scalars along `f`, for `S` finitely generated projective over `R`. -/
def transfer (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S))) :
    RingK0 S →+ RingK0 R :=
  SplitK0.map (restrictScalarsFP f hf)

/-- `transfer f [Q] = [f_* Q]`. -/
@[simp]
theorem transfer_of (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S)))
    (Q : Type u) [AddCommGroup Q] [Module S Q] [Module.Finite S Q] [Module.Projective S Q] :
    transfer f hf (of S Q) = SplitK0.of ⟨(ModuleCat.restrictScalars f).obj (ModuleCat.of S Q),
      restrictScalars_finite_projective f hf _
        (finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩)⟩ := by
  sorry

/-- `transfer f [S] = [f_* S]`. -/
@[simp]
theorem transfer_one (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S))) :
    transfer f hf (of S S) =
      SplitK0.of ⟨(ModuleCat.restrictScalars f).obj (ModuleCat.of S S), hf⟩ := by
  sorry

/-- `transfer` of the identity. -/
@[simp]
theorem transfer_id (h : finiteProjectiveModules R
    ((ModuleCat.restrictScalars (RingHom.id R)).obj (ModuleCat.of R R))) :
    transfer (RingHom.id R) h = AddMonoidHom.id (RingK0 R) := by
  sorry

/-- `transfer` of a composite. -/
theorem transfer_comp (f : R →+* S) (g : S →+* T)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S)))
    (hg : finiteProjectiveModules S ((ModuleCat.restrictScalars g).obj (ModuleCat.of T T)))
    (hgf : finiteProjectiveModules R
      ((ModuleCat.restrictScalars (g.comp f)).obj (ModuleCat.of T T))) :
    transfer (g.comp f) hgf = (transfer f hf).comp (transfer g hg) := by
  sorry

/-- If `S ≃ Rᵈ` as a left `R`-module, `transfer (map x) = d • x` on `ℤ • [R]`. -/
theorem transfer_map_free (f : R →+* S)
    (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S)))
    (d : ℕ) (_hd : Nonempty ((ModuleCat.restrictScalars f).obj (ModuleCat.of S S) ≃ₗ[R]
      (Fin d → R))) (x : RingK0 R) (_hx : x ∈ AddSubgroup.zmultiples (of R R)) :
    transfer f hf (map f x) = d • x := by
  sorry

-- test TauCeti.RingK0.transfer_gaussian_test (computation)
example (hf : finiteProjectiveModules ℤ
    ((ModuleCat.restrictScalars (algebraMap ℤ GaussianInt)).obj (ModuleCat.of _ GaussianInt))) :
    transfer (algebraMap ℤ GaussianInt) hf (of GaussianInt GaussianInt) = 2 • of ℤ ℤ := by
  sorry

-- test TauCeti.RingK0.transfer_id_test (degenerate)
example (h : finiteProjectiveModules R
    ((ModuleCat.restrictScalars (RingHom.id R)).obj (ModuleCat.of R R))) :
    transfer (RingHom.id R) h = AddMonoidHom.id (RingK0 R) :=
  transfer_id h

-- test TauCeti.RingK0.transfer_projection_test (characterisation)
/- `ℤ ≅ ℤ × 0` is a projective `ℤ × ℤ`-module: `transfer fst [ℤ] = [ℤ × 0]` and
`map fst ∘ transfer fst = id`. -/
example (hf : finiteProjectiveModules (ℤ × ℤ)
      ((ModuleCat.restrictScalars (RingHom.fst ℤ ℤ)).obj (ModuleCat.of ℤ ℤ)))
    (h₁ : IsIdempotentElem (!![((1 : ℤ), (0 : ℤ))] : Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) :
    transfer (RingHom.fst ℤ ℤ) hf (of ℤ ℤ) = ofIdempotent _ h₁ ∧
      ∀ x, map (RingHom.fst ℤ ℤ) (transfer (RingHom.fst ℤ ℤ) hf x) = x := by
  sorry

-- test TauCeti.RingK0.transfer_matrix_test (compatibility)
example (n : ℕ) (hf : finiteProjectiveModules R ((ModuleCat.restrictScalars
      (Matrix.scalar (Fin n) : R →+* Matrix (Fin n) (Fin n) R)).obj
        (ModuleCat.of _ (Matrix (Fin n) (Fin n) R)))) :
    transfer (Matrix.scalar (Fin n) : R →+* Matrix (Fin n) (Fin n) R) hf
        (of _ (Matrix (Fin n) (Fin n) R)) = (n ^ 2) • of R R := by
  sorry

-- test TauCeti.RingK0.transfer_not_inverse_test (non-example)
example (hf : finiteProjectiveModules ℤ
    ((ModuleCat.restrictScalars (algebraMap ℤ GaussianInt)).obj (ModuleCat.of _ GaussianInt))) :
    transfer (algebraMap ℤ GaussianInt) hf (map (algebraMap ℤ GaussianInt) (of ℤ ℤ)) ≠
      of ℤ ℤ := by
  sorry

end Transfer

end RingK0

/-! ### `KTheoryLowDegrees:Z.1/equivalence-preserves-finite-projective`, `Z.1/ring-k0-morita`,
`Z.1/ring-k0-matrix` -/

section Morita

variable {A B C : Type u} [Ring A] [Ring B] [Ring C]

/-- `KTheoryLowDegrees:Z.1/equivalence-preserves-finite-projective`: an equivalence
`ModuleCat A ≌ ModuleCat B` sends finitely generated projectives to finitely generated
projectives. -/
theorem equivalence_preserves_finite_projective (E : ModuleCat.{u} A ≌ ModuleCat.{u} B)
    (M : ModuleCat.{u} A) (hM : finiteProjectiveModules A M) :
    finiteProjectiveModules B (E.functor.obj M) := by
  sorry

/-- The restricted equivalence `FP A ≌ FP B` (data; its functor is `E.functor` on objects,
`finiteProjectiveEquivalence_functor_obj`). -/
def finiteProjectiveEquivalence (E : ModuleCat.{u} A ≌ ModuleCat.{u} B) :
    RingK0.FP A ≌ RingK0.FP B :=
  sorry

/-- The restricted equivalence acts as `E.functor` on objects. -/
theorem finiteProjectiveEquivalence_functor_obj (E : ModuleCat.{u} A ≌ ModuleCat.{u} B)
    (X : RingK0.FP A) : ((finiteProjectiveEquivalence E).functor.obj X).obj =
        E.functor.obj X.obj := by
  sorry

/-- The restricted functor is additive. -/
instance finiteProjectiveEquivalence_additive (E : ModuleCat.{u} A ≌ ModuleCat.{u} B) :
    (finiteProjectiveEquivalence E).functor.Additive := by
  sorry

namespace RingK0

/-- **Morita invariance** (`KTheoryLowDegrees:Z.1/ring-k0-morita`): an equivalence of module
categories induces `RingK0 A ≃+ RingK0 B`, `[M] ↦ [E.functor.obj M]`. -/
def ofEquivalence (E : ModuleCat.{u} A ≌ ModuleCat.{u} B) : RingK0 A ≃+ RingK0 B :=
  SplitK0.mapEquiv (finiteProjectiveEquivalence E)

/-- `ofEquivalence E [M] = [E.functor.obj M]`. -/
@[simp]
theorem ofEquivalence_of (E : ModuleCat.{u} A ≌ ModuleCat.{u} B) (M : Type u) [AddCommGroup M]
    [Module A M] [Module.Finite A M] [Module.Projective A M] :
    ofEquivalence E (of A M) = SplitK0.of ⟨E.functor.obj (ModuleCat.of A M),
      equivalence_preserves_finite_projective E _
        (finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩)⟩ := by
  sorry

/-- `moritaEquiv e := ofEquivalence e.eqv` for a Mathlib Morita equivalence over `ℤ`. -/
def moritaEquiv (e : MoritaEquivalence ℤ A B) : RingK0 A ≃+ RingK0 B :=
  ofEquivalence e.eqv

/-- `moritaEquiv refl = refl`. -/
@[simp]
theorem moritaEquiv_refl : moritaEquiv (MoritaEquivalence.refl ℤ A) = AddEquiv.refl _ := by
  sorry

/-- `moritaEquiv` respects composition. -/
theorem moritaEquiv_trans (e : MoritaEquivalence ℤ A B) (e' : MoritaEquivalence ℤ B C) :
    moritaEquiv (e.trans ℤ e') = (moritaEquiv e).trans (moritaEquiv e') := by
  sorry

/-- `moritaEquiv` respects inverses. -/
@[simp]
theorem moritaEquiv_symm (e : MoritaEquivalence ℤ A B) :
    moritaEquiv (e.symm ℤ) = (moritaEquiv e).symm := by
  sorry

/-- For an algebra isomorphism, `moritaEquiv` is `mapEquiv`. -/
theorem moritaEquiv_ofAlgEquiv (φ : A ≃ₐ[ℤ] B) :
    moritaEquiv (MoritaEquivalence.ofAlgEquiv φ) = mapEquiv φ.toRingEquiv := by
  sorry

-- test TauCeti.RingK0.moritaEquiv_matrix_test (computation)
/- For a field `k` and `moritaEquivalenceMatrix` at `0 : Fin 2`: `[k] ↦ [k²]` (column vectors, the
functor `ModuleCat.matrixEquivalence`), and the inverse sends `[M₂(k)]` to `2[k]`. -/
example {k : Type u} [Field k] :
    moritaEquiv (moritaEquivalenceMatrix k ℤ (0 : Fin 2)) (of k k) =
        SplitK0.of ⟨(ModuleCat.matrixEquivalence k (0 : Fin 2)).functor.obj (ModuleCat.of k k),
          equivalence_preserves_finite_projective _ _
            (finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩)⟩ ∧
      (moritaEquiv (moritaEquivalenceMatrix k ℤ (0 : Fin 2))).symm
          (of (Matrix (Fin 2) (Fin 2) k) (Matrix (Fin 2) (Fin 2) k)) = 2 • of k k := by
  sorry

-- test TauCeti.RingK0.moritaEquiv_refl_test (degenerate)
example (x : RingK0 A) : moritaEquiv (MoritaEquivalence.refl ℤ A) x = x := by
  rw [moritaEquiv_refl, AddEquiv.refl_apply]

-- test TauCeti.RingK0.moritaEquiv_not_free_test (non-example)
/- `[k] ↦ [k²]`, which is not a multiple of `[M₂(k)]` in `K₀(M₂(k))`. -/
example {k : Type u} [Field k] :
    moritaEquiv (moritaEquivalenceMatrix k ℤ (0 : Fin 2)) (of k k) ∉
      AddSubgroup.zmultiples (of (Matrix (Fin 2) (Fin 2) k) (Matrix (Fin 2) (Fin 2) k)) := by
  sorry

-- test TauCeti.RingK0.moritaEquiv_algEquiv_test (compatibility)
example (φ : A ≃ₐ[ℤ] B) (x : RingK0 A) :
    moritaEquiv (MoritaEquivalence.ofAlgEquiv φ) x = mapEquiv φ.toRingEquiv x := by
  rw [moritaEquiv_ofAlgEquiv]

/-- `KTheoryLowDegrees:Z.1/ring-k0-matrix`: `K₀(A) ≃ K₀(Mᵢ(A))` through `moritaEquivalenceMatrix`;
its inverse sends `[Mᵢ(A)]` to `|ι| • [A]`. -/
theorem ringK0_matrix {ι : Type u} [Fintype ι] [DecidableEq ι] (i₀ : ι) :
    (moritaEquiv (moritaEquivalenceMatrix A ℤ i₀)).symm (of (Matrix ι ι A) (Matrix ι ι A)) =
      Fintype.card ι • of A A := by
  sorry

end RingK0

end Morita

end TauCeti

/-! ## Stage `KTheoryLowDegrees:Z.2` — rank, local rings and products

The rank is a locally constant function on `Spec A` (`LocallyConstant (PrimeSpectrum A) ℤ`),
never collapsed to one integer on a disconnected spectrum; `rankℤ` exists only under
`ConnectedSpace (PrimeSpectrum A)`. -/

namespace TauCeti

/-- Helper instance (a true fact, proof omitted): the spectrum of a commutative local ring is
connected (its only idempotents are `0` and `1`). Needed to state `rankℤ` for local rings. -/
instance connectedSpace_primeSpectrum_of_isLocalRing (A : Type u) [CommRing A] [IsLocalRing A] :
    ConnectedSpace (PrimeSpectrum A) := by
  sorry

namespace RingK0

section Rank

variable (A : Type u) [CommRing A]

/-- `KTheoryLowDegrees:Z.2/local-freeness`: `P_p` is free of rank `rankAtStalk P p` over `A_p`, `P`
is free of the same rank after inverting some `s ∉ p`, and `rankAtStalk P` is locally constant,
constant on `D(s)`. -/
theorem local_freeness (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] (p : PrimeSpectrum A) :
    Module.Free (Localization.AtPrime p.asIdeal) (LocalizedModule p.asIdeal.primeCompl P) ∧
      Nonempty (LocalizedModule p.asIdeal.primeCompl P ≃ₗ[Localization.AtPrime p.asIdeal]
        (Fin (Module.rankAtStalk (R := A) P p) → Localization.AtPrime p.asIdeal)) ∧
      (∃ s ∉ p.asIdeal, Module.Free (Localization.Away s) (LocalizedModule (Submonoid.powers s) P) ∧
        Module.finrank (Localization.Away s) (LocalizedModule (Submonoid.powers s) P) =
          Module.rankAtStalk (R := A) P p ∧
        ∀ q ∈ PrimeSpectrum.basicOpen s, Module.rankAtStalk (R := A) P q =
            Module.rankAtStalk (R := A) P p) ∧
      IsLocallyConstant (Module.rankAtStalk (R := A) P) := by
  sorry

/-- **The rank of a virtual projective module** (`KTheoryLowDegrees:Z.2/rank-hom`):
`rank : RingK0 A →+ LocallyConstant (PrimeSpectrum A) ℤ`, `[P] ↦ (p ↦ rankAtStalk P p)` (a real
definition through `RingK0.lift`). -/
def rank : RingK0 A →+ LocallyConstant (PrimeSpectrum A) ℤ :=
  lift (fun (P : Type u)
      [AddCommGroup P] [Module A P] [Module.Finite A P] [Module.Projective A P] =>
    ⟨fun p => (Module.rankAtStalk (R := A) P p : ℤ), by sorry⟩) (by sorry) (by sorry)

variable {A}

/-- `rank [P] p = rankAtStalk P p`. -/
@[simp]
theorem rank_of (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] (p : PrimeSpectrum A) :
    rank A (of A P) p = (Module.rankAtStalk (R := A) P p : ℤ) := by
  sorry

/-- `rank [A] = 1`. -/
@[simp]
theorem rank_one : rank A (of A A) = 1 := by
  sorry

/-- `rank (n • [A]) = n`. -/
@[simp]
theorem rank_free (n : ℕ) : rank A (n • of A A) = n := by
  sorry

/-- `rank [P] = 0 ↔ P = 0`. -/
theorem rank_of_eq_zero_iff (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] : rank A (of A P) = 0 ↔ Subsingleton P := by
  sorry

/-- The rank of an actual module is nonnegative. -/
theorem rank_of_nonneg (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] (p : PrimeSpectrum A) : 0 ≤ rank A (of A P) p := by
  sorry

/-- The rank has finite image. -/
theorem rank_range_finite (x : RingK0 A) : (Set.range (rank A x)).Finite :=
  (rank A x).range_finite

/-- The K-book's definition: the fibre dimension `dim_{κ(p)} κ(p) ⊗ P`. -/
theorem rank_of_eq_fiber (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] (p : PrimeSpectrum A) :
    rank A (of A P) p = (Module.finrank p.asIdeal.ResidueField (p.asIdeal.Fiber P) : ℤ) := by
  sorry

/-- The object-level multiplicativity from which Z.3 proves that `rank` is a ring homomorphism. -/
theorem rankAtStalk_tensor (P Q : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] [AddCommGroup Q] [Module A Q] [Module.Finite A Q]
    [Module.Projective A Q] :
    Module.rankAtStalk (R := A) (P ⊗[A] Q) =
      Module.rankAtStalk (R := A) P * Module.rankAtStalk (R := A) Q := by
  sorry

/-- Invertible modules have rank one. -/
@[simp]
theorem rank_of_invertible (L : Type u) [AddCommGroup L] [Module A L] [Module.Invertible A L] :
    rank A (of A L) = 1 := by
  sorry

/-- Constant rank `n` iff every localisation is `A_pⁿ`. -/
theorem rank_eq_const_iff (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] (n : ℕ) :
    rank A (of A P) = n ↔ ∀ p : PrimeSpectrum A,
      Nonempty (LocalizedModule p.asIdeal.primeCompl P ≃ₗ[Localization.AtPrime p.asIdeal]
        (Fin n → Localization.AtPrime p.asIdeal)) := by
  sorry

/-- `KTheoryLowDegrees:Z.2/rank-base-change`: `rank_B (map f x) = (rank_A x) ∘ Spec f`. -/
theorem rank_base_change {B : Type u} [CommRing B] (f : A →+* B) (x : RingK0 A) :
    rank B (map f x) =
      (rank A x).comap ⟨PrimeSpectrum.comap f, PrimeSpectrum.continuous_comap f⟩ := by
  sorry

end Rank

/-! ### `KTheoryLowDegrees:Z.2/componentwise-free` -/

section Componentwise

variable {A : Type u} [CommRing A]

/-- The idempotent `e_U` with `D(e_U) = U` (`PrimeSpectrum.isIdempotentElemEquivClopens`). -/
def clopenIdempotent (U : TopologicalSpace.Clopens (PrimeSpectrum A)) : A :=
  (PrimeSpectrum.isIdempotentElemEquivClopens.symm U).1

/-- The clopen module `A_U := A·e_U`. -/
def clopenModule (U : TopologicalSpace.Clopens (PrimeSpectrum A)) : Submodule A A :=
  Ideal.span {clopenIdempotent U}

/-- The clopen module is finitely generated. -/
instance clopenModule_finite (U : TopologicalSpace.Clopens (PrimeSpectrum A)) :
    Module.Finite A (clopenModule U) := by
  sorry

/-- The clopen module is projective (a direct summand of `A`). -/
instance clopenModule_finiteProjective (U : TopologicalSpace.Clopens (PrimeSpectrum A)) :
    Module.Projective A (clopenModule U) := by
  sorry

/-- `rankAtStalk A_U` is the indicator of `U`. -/
@[simp]
theorem rankAtStalk_clopenModule (U : TopologicalSpace.Clopens (PrimeSpectrum A)) :
    Module.rankAtStalk (R := A) (clopenModule U) = Set.indicator (U : Set (PrimeSpectrum A)) 1 := by
  sorry

/-- `A_{U ∪ V} ≅ A_U × A_V` for disjoint `U, V`. -/
theorem clopenModule_union {U V : TopologicalSpace.Clopens (PrimeSpectrum A)} (h : Disjoint U V) :
    Nonempty (clopenModule (U ⊔ V) ≃ₗ[A] clopenModule U × clopenModule V) := by
  sorry

/-- `A_{Spec A} ≅ A` and `A_∅ = 0`. -/
theorem clopenModule_top :
    Nonempty (clopenModule (⊤ : TopologicalSpace.Clopens (PrimeSpectrum A)) ≃ₗ[A] A) ∧
      clopenModule (⊥ : TopologicalSpace.Clopens (PrimeSpectrum A)) = ⊥ := by
  sorry

/-- The clopen class `[A_U]`. -/
def clopenClass (U : TopologicalSpace.Clopens (PrimeSpectrum A)) : RingK0 A :=
  of A (clopenModule U)

/-- Additivity of clopen classes on disjoint unions. -/
theorem clopenClass_union {U V : TopologicalSpace.Clopens (PrimeSpectrum A)} (h : Disjoint U V) :
    clopenClass (U ⊔ V) = clopenClass U + clopenClass V := by
  sorry

/-- `rank [A_U]` is the indicator of `U`. -/
@[simp]
theorem rank_clopenClass (U : TopologicalSpace.Clopens (PrimeSpectrum A)) :
    rank A (clopenClass U) = LocallyConstant.charFn ℤ U.isClopen := by
  sorry

/-- The clopen fibre `f⁻¹(a)` of a locally constant function (helper). -/
def fiberClopen {α : Type*} (f : LocallyConstant (PrimeSpectrum A) α) (a : α) :
    TopologicalSpace.Clopens (PrimeSpectrum A) :=
  ⟨f ⁻¹' {a}, f.isLocallyConstant.isClopen_fiber a⟩

/-- **The componentwise free module** `A^f := ∏_{n ∈ range f} (A_{f⁻¹(n)})ⁿ` (a real definition). -/
def componentwiseFree (f : LocallyConstant (PrimeSpectrum A) ℕ) : Type u :=
  ∀ n : Set.range f, Fin n.1 → clopenModule (fiberClopen f n.1)

instance componentwiseFree.instAddCommGroup (f : LocallyConstant (PrimeSpectrum A) ℕ) :
    AddCommGroup (componentwiseFree f) :=
  inferInstanceAs (AddCommGroup (∀ n : Set.range f, Fin n.1 → clopenModule (fiberClopen f n.1)))

instance componentwiseFree.instModule (f : LocallyConstant (PrimeSpectrum A) ℕ) :
    Module A (componentwiseFree f) :=
  inferInstanceAs (Module A (∀ n : Set.range f, Fin n.1 → clopenModule (fiberClopen f n.1)))

/-- `A^f` is finitely generated. -/
instance componentwiseFree_finite (f : LocallyConstant (PrimeSpectrum A) ℕ) :
    Module.Finite A (componentwiseFree f) := by
  sorry

/-- `A^f` is projective. -/
instance componentwiseFree_projective (f : LocallyConstant (PrimeSpectrum A) ℕ) :
    Module.Projective A (componentwiseFree f) := by
  sorry

/-- `rank [A^f] = f`. -/
@[simp]
theorem rank_componentwiseFree (f : LocallyConstant (PrimeSpectrum A) ℕ) :
    rank A (of A (componentwiseFree f)) = f.map (fun n : ℕ => (n : ℤ)) := by
  sorry

/-- `A^{f+g} ≅ A^f × A^g`. -/
theorem componentwiseFree_add (f g : LocallyConstant (PrimeSpectrum A) ℕ) :
    Nonempty (componentwiseFree (f + g) ≃ₗ[A] componentwiseFree f × componentwiseFree g) := by
  sorry

/-- `A^{const n} ≅ Aⁿ`. -/
theorem componentwiseFree_const (n : ℕ) :
    Nonempty (componentwiseFree (LocallyConstant.const (PrimeSpectrum A) n) ≃ₗ[A] (Fin n → A)) := by
  sorry

end Componentwise

/-! ### `KTheoryLowDegrees:Z.2/rank-section` -/

section RankSection

variable (A : Type u) [CommRing A]

/-- **`H⁰` as a direct summand** (`KTheoryLowDegrees:Z.2/rank-section`):
`rankSection f = Σ_{n ∈ range f} n • [A_{f⁻¹(n)}]` (a real definition up to additivity). -/
def rankSection : LocallyConstant (PrimeSpectrum A) ℤ →+ RingK0 A where
  toFun f := ∑ n ∈ f.range_finite.toFinset, n • clopenClass (fiberClopen f n)
  map_zero' := by sorry
  map_add' := by sorry

variable {A}

/-- `rank ∘ rankSection = id`. -/
@[simp]
theorem rank_rankSection (f : LocallyConstant (PrimeSpectrum A) ℤ) :
    rank A (rankSection A f) = f := by
  sorry

/-- `rankSection (const n) = n • [A]`. -/
@[simp]
theorem rankSection_const (n : ℤ) :
    rankSection A (LocallyConstant.const (PrimeSpectrum A) n) = n • of A A := by
  sorry

/-- `rankSection (indicator of U) = [A_U]`. -/
@[simp]
theorem rankSection_indicator (U : TopologicalSpace.Clopens (PrimeSpectrum A)) :
    rankSection A (LocallyConstant.charFn ℤ U.isClopen) = clopenClass U := by
  sorry

/-- For `f ≥ 0`, `rankSection f = [A^f]`. -/
theorem rankSection_of_nonneg (f : LocallyConstant (PrimeSpectrum A) ℕ) :
    rankSection A (f.map (fun n : ℕ => (n : ℤ))) = of A (componentwiseFree f) := by
  sorry

/-- The rank is surjective. -/
theorem rank_surjective : Function.Surjective (rank A) := by
  sorry

variable (A) in
/-- `RingK0 A ≃+ H⁰ × ker rank`, `x ↦ (rank x, x - rankSection (rank x))` (a real definition up to
proofs). -/
def rankSplitting : RingK0 A ≃+ LocallyConstant (PrimeSpectrum A) ℤ × (rank A).ker where
  toFun x := (rank A x, ⟨x - rankSection A (rank A x), by sorry⟩)
  invFun y := rankSection A y.1 + y.2
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

end RankSection

/-! ### `KTheoryLowDegrees:Z.2/rank-fibre-decomposition` -/

section RankFibres

variable (A : Type u) [CommRing A] (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
  [Module.Projective A P]

/-- The finite set of values of `rankAtStalk P`. -/
def rankFibres : Finset ℕ :=
  haveI := Module.finitePresentation_of_projective A P
  (Module.isLocallyConstant_rankAtStalk (R := A) (M := P)).range_finite.toFinset

/-- The idempotent `e_n` of the rank fibre `rankAtStalk⁻¹(n)`. -/
def rankFibreIdempotent (n : rankFibres A P) : A :=
  haveI := Module.finitePresentation_of_projective A P
  (PrimeSpectrum.isIdempotentElemEquivClopens.symm
    ⟨Module.rankAtStalk (R := A) P ⁻¹' {n.1},
      (Module.isLocallyConstant_rankAtStalk (R := A) (M := P)).isClopen_fiber n.1⟩).1

/-- `D(e_n) = rankAtStalk⁻¹(n)`. -/
theorem basicOpen_rankFibreIdempotent (n : rankFibres A P) :
    (PrimeSpectrum.basicOpen (rankFibreIdempotent A P n) : Set (PrimeSpectrum A)) =
      Module.rankAtStalk (R := A) P ⁻¹' {n.1} := by
  sorry

/-- The `e_n` form a complete orthogonal family. -/
theorem completeOrthogonalIdempotents_rankFibre :
    CompleteOrthogonalIdempotents (rankFibreIdempotent A P) := by
  sorry

/-- `A ≃+* ∏_n A ⧸ (1 - e_n)` (a real definition: `CompleteOrthogonalIdempotents.bijective_pi`). -/
def rankFibreRingEquiv :
    A ≃+* ((n : rankFibres A P) → A ⧸ Ideal.span {1 - rankFibreIdempotent A P n}) :=
  RingEquiv.ofBijective _ (completeOrthogonalIdempotents_rankFibre A P).bijective_pi

/-- `P ≃ ∏_n e_n P`. -/
def rankFibreModuleEquiv :
    P ≃ₗ[A] ((n : rankFibres A P) →
      LinearMap.range (LinearMap.lsmul A P (rankFibreIdempotent A P n))) :=
  sorry

/-- The `n`-th component has constant rank `n` over `A ⧸ (1 - e_n)`. -/
theorem rankAtStalk_rankFibre (n : rankFibres A P)
    (q : PrimeSpectrum (A ⧸ Ideal.span {1 - rankFibreIdempotent A P n})) :
    Module.rankAtStalk ((A ⧸ Ideal.span {1 - rankFibreIdempotent A P n}) ⊗[A] P) q = n.1 := by
  sorry

/-- Any finite clopen partition refining the rank fibres gives the analogous decomposition. -/
theorem rankFibre_refine {ι : Type} [Fintype ι] (U : ι → TopologicalSpace.Clopens (PrimeSpectrum A))
    (hdisj : Pairwise fun i j => Disjoint (U i) (U j))
    (hcover : ⋃ i, (U i : Set (PrimeSpectrum A)) = Set.univ)
    (hrefine : ∀ i, ∃ n, (U i : Set (PrimeSpectrum A)) ⊆ Module.rankAtStalk (R := A) P ⁻¹' {n}) :
    ∃ e : ι → A, CompleteOrthogonalIdempotents e ∧ ∀ i,
      (PrimeSpectrum.basicOpen (e i) : Set (PrimeSpectrum A)) = U i ∧ ∃ n : ℕ,
        ∀ q : PrimeSpectrum (A ⧸ Ideal.span {1 - e i}),
          Module.rankAtStalk ((A ⧸ Ideal.span {1 - e i}) ⊗[A] P) q = n := by
  sorry

end RankFibres

/-! ### `KTheoryLowDegrees:Z.2/connected-iff-constant-rank` and `Z.2/rank-connected` -/

section Connected

variable (A : Type u) [CommRing A]

/-- `KTheoryLowDegrees:Z.2/connected-iff-constant-rank`: for nontrivial `A`, connected spectrum ⟺
constant rank of every finitely generated projective ⟺ only the idempotents `0, 1`. -/
theorem connected_iff_constant_rank [Nontrivial A] :
    List.TFAE [ConnectedSpace (PrimeSpectrum A),
      ∀ (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P] [Module.Projective A P],
        ∃ n : ℕ, ∀ p, Module.rankAtStalk (R := A) P p = n,
      ∀ e : A, IsIdempotentElem e → e = 0 ∨ e = 1] := by
  sorry

variable [ConnectedSpace (PrimeSpectrum A)]

/-- **The integer rank on a connected spectrum** (`KTheoryLowDegrees:Z.2/rank-connected`):
`rankℤ x := (rank x)(p)` at any point (a real definition). -/
def rankℤ : RingK0 A →+ ℤ where
  toFun x := rank A x (Classical.arbitrary (PrimeSpectrum A))
  map_zero' := by simp
  map_add' x y := by simp

variable {A}

/-- `rankℤ [P] = rankAtStalk P p` for every `p`. -/
@[simp]
theorem rankℤ_of (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] (p : PrimeSpectrum A) :
    rankℤ A (of A P) = (Module.rankAtStalk (R := A) P p : ℤ) := by
  sorry

/-- `rankℤ [A] = 1`. -/
@[simp]
theorem rankℤ_one : rankℤ A (of A A) = 1 := by
  sorry

/-- On a connected spectrum the rank is constant. -/
theorem rank_eq_const (x : RingK0 A) :
    rank A x = LocallyConstant.const (PrimeSpectrum A) (rankℤ A x) := by
  sorry

/-- `rankℤ` is surjective, split by `n ↦ n • [A]`. -/
theorem rankℤ_surjective :
    Function.Surjective (rankℤ A) ∧ ∀ n : ℤ, rankℤ A (n • of A A) = n := by
  sorry

/-- `rankℤ` is invariant under maps of rings with connected spectra. -/
theorem rankℤ_map {B : Type u} [CommRing B] [ConnectedSpace (PrimeSpectrum B)] (f : A →+* B)
    (x : RingK0 A) : rankℤ B (map f x) = rankℤ A x := by
  sorry

variable (A) in
/-- `RingK0 A ≃+ ℤ × ker rankℤ` (a real definition up to proofs). -/
def rankℤSplitting : RingK0 A ≃+ ℤ × (rankℤ A).ker where
  toFun x := (rankℤ A x, ⟨x - rankℤ A x • of A A, by sorry⟩)
  invFun y := y.1 • of A A + y.2
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

-- test TauCeti.RingK0.rankℤ_int_test (computation)
example (n : ℕ) : rankℤ ℤ (of ℤ (Fin n → ℤ)) = n := by
  sorry

-- test TauCeti.RingK0.rankℤ_local_test (degenerate)
example {B : Type u} [CommRing B] [IsLocalRing B] (P : Type u) [AddCommGroup P] [Module B P]
    [Module.Finite B P] [Module.Projective B P] : rankℤ B (of B P) = Module.finrank B P := by
  sorry

end Connected

/-- `KTheoryLowDegrees:Z.2/rank-domain`: over a domain with fraction field `K`, the rank at every
prime is `finrank_K (K ⊗ P) = finrank_A P`; `Spec A` is connected, `rankℤ [P]` is that dimension,
and a nonzero projective ideal has `rankℤ = 1`. -/
theorem rank_domain {A : Type u} [CommRing A] [IsDomain A] (K : Type u) [Field K] [Algebra A K]
    [IsFractionRing A K] (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] :
    (∀ p : PrimeSpectrum A, Module.rankAtStalk (R := A) P p = Module.finrank K (K ⊗[A] P)) ∧
      Module.finrank K (K ⊗[A] P) = Module.finrank A P ∧ ConnectedSpace (PrimeSpectrum A) ∧
      rankℤ A (of A P) = Module.finrank K (K ⊗[A] P) ∧
      rankℤ A (of A P) = rankℤ K (map (algebraMap A K) (of A P)) ∧
      ∀ (I : Ideal A) [Module.Finite A I] [Module.Projective A I], I ≠ ⊥ → rankℤ A (of A I) =
          1 := by
  sorry

/-! ### `KTheoryLowDegrees:Z.2/division-ring-k0` -/

section DivisionRing

variable (D : Type u) [DivisionRing D]

/-- Helper: over a division ring the two object properties coincide (every module is projective). -/
theorem finiteProjectiveModules_eq_isFG : finiteProjectiveModules D = ModuleCat.isFG D := by
  sorry

instance fullSubcategoryCongr_additive :
    (ObjectProperty.fullSubcategoryCongr (finiteProjectiveModules_eq_isFG D)).functor.Additive := by
  sorry

/-- The transport `RingK0 D ≃+ SplitK0 (FGModuleCat D)` along `fullSubcategoryCongr` (a real
definition). -/
def fgModuleCatEquiv : RingK0 D ≃+ SplitK0.{u} (FGModuleCat.{u} D) :=
  SplitK0.mapEquiv (ObjectProperty.fullSubcategoryCongr (finiteProjectiveModules_eq_isFG D))

/-- **K₀ of a division ring** (`KTheoryLowDegrees:Z.2/division-ring-k0`): the existing
`SplitK0.finrankEquiv` transported to ring `K₀` (a real definition). -/
def divisionRingEquiv : RingK0 D ≃+ ℤ :=
  (fgModuleCatEquiv D).trans (SplitK0.finrankEquiv D)

variable {D}

/-- `[P] ↦ finrank_D P`. -/
@[simp]
theorem divisionRingEquiv_of (P : Type u) [AddCommGroup P] [Module D P] [Module.Finite D P]
    [Module.Projective D P] : divisionRingEquiv D (of D P) = Module.finrank D P := by
  sorry

/-- `[D] ↦ 1`. -/
@[simp]
theorem divisionRingEquiv_one : divisionRingEquiv D (of D D) = 1 := by
  sorry

/-- The inverse is `n ↦ n • [D]`. -/
@[simp]
theorem divisionRingEquiv_symm_apply (n : ℤ) : (divisionRingEquiv D).symm n = n • of D D := by
  sorry

/-- For a field, `divisionRingEquiv = rankℤ`. -/
theorem divisionRingEquiv_eq_rankℤ (k : Type u) [Field k] :
    ((divisionRingEquiv k : RingK0 k ≃+ ℤ) : RingK0 k →+ ℤ) = rankℤ k := by
  sorry

/-- Invariance under ring maps of division rings. -/
theorem divisionRingEquiv_map {D' : Type u} [DivisionRing D'] (f : D →+* D') (x : RingK0 D) :
    divisionRingEquiv D' (map f x) = divisionRingEquiv D x := by
  sorry

-- test TauCeti.RingK0.divisionRingEquiv_quaternion_test (computation)
example : divisionRingEquiv ℍ[ℝ] (of ℍ[ℝ] (Fin 2 → ℍ[ℝ])) = 2 := by
  sorry

-- test TauCeti.RingK0.divisionRingEquiv_zero_test (degenerate)
example : divisionRingEquiv D 0 = 0 ∧ divisionRingEquiv D (of D D) = 1 :=
  ⟨map_zero _, divisionRingEquiv_one⟩

-- test TauCeti.RingK0.divisionRingEquiv_finrankEquiv_test (compatibility)
example (x : RingK0 D) : divisionRingEquiv D x = SplitK0.finrankEquiv D (fgModuleCatEquiv D x) :=
  rfl

-- test TauCeti.RingK0.divisionRingEquiv_subfield_test (non-example)
/- The dimension is over `D` itself: `[ℂ] ↦ 1`, not `dim_ℝ ℂ = 2`. -/
example : divisionRingEquiv ℂ (of ℂ ℂ) = 1 ∧ Module.finrank ℝ ℂ = 2 :=
  ⟨divisionRingEquiv_one, Complex.finrank_real_complex⟩

end DivisionRing

/-! Tests of `Z.2/rank-hom` and `Z.2/rank-connected` that use `divisionRingEquiv`, and the tests
of `Z.2/rank-hom`, `Z.2/componentwise-free`, `Z.2/rank-section`, `Z.2/rank-fibre-decomposition`,
`Z.2/rank-connected` on `A = k × k` (with `(primeFst k) = ker fst`, `(primeSnd k) = ker snd`). -/

section RankTests

variable {k : Type u} [Field k]

variable (k) in
/-- Test notation: the prime `(primeFst k) = ker(fst)` of `k × k`. -/
def primeFst : PrimeSpectrum (k × k) := ⟨RingHom.ker (RingHom.fst k k), RingHom.ker_isPrime _⟩

variable (k) in
/-- Test notation: the prime `(primeSnd k) = ker(snd)` of `k × k`. -/
def primeSnd : PrimeSpectrum (k × k) := ⟨RingHom.ker (RingHom.snd k k), RingHom.ker_isPrime _⟩

-- test TauCeti.RingK0.rank_prod_field_test (computation)
/- `k × 0` is the idempotent module of the `1 × 1` idempotent `(1, 0)`. -/
example (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    rank (k × k) (ofIdempotent _ h₁) (primeFst k) = 1 ∧
        rank (k × k) (ofIdempotent _ h₁) (primeSnd k) = 0 ∧
      rank (k × k) (of (k × k) (k × k)) = 1 := by
  sorry

-- test TauCeti.RingK0.rank_zero_ring_test (degenerate)
example {B : Type u} [CommRing B] [Subsingleton B] :
    IsEmpty (PrimeSpectrum B) ∧ rank B = 0 ∧ rank B (of B B) = 1 := by
  sorry

-- test TauCeti.RingK0.rank_field_test (compatibility)
example (x : RingK0 k) (n : ℕ) :
    rank k x = LocallyConstant.const (PrimeSpectrum k) (divisionRingEquiv k x) ∧
      rank k (of k (Fin n → k)) = n := by
  sorry

-- test TauCeti.RingK0.rank_disconnected_test (non-example)
/- `rank [k × 0]` is not constant, while `Module.finrank (k × k) (k × 0) = 0`. -/
example (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    rank (k × k) (ofIdempotent _ h₁) (primeFst k) ≠ rank (k × k) (ofIdempotent _ h₁) (primeSnd k) ∧
      Module.finrank (k × k) (idempotentModule (!![((1 : k), (0 : k))] :
        Matrix (Fin 1) (Fin 1) (k × k))) = 0 := by
  sorry

-- test TauCeti.RingK0.rank_torsion_test (non-example)
/- For the non-projective `ℤ`-module `ℤ/2` the fibre dimension is `1` at `(2)` and `0` at `(0)`,
while `rankAtStalk (ℤ/2)` is identically `0`. -/
example [(Ideal.span {(2 : ℤ)}).IsPrime] :
    Module.finrank (Ideal.span {(2 : ℤ)}).ResidueField
        ((Ideal.span {(2 : ℤ)}).Fiber (ZMod 2)) = 1 ∧
      Module.finrank (⊥ : Ideal ℤ).ResidueField ((⊥ : Ideal ℤ).Fiber (ZMod 2)) = 0 ∧
      ∀ p : PrimeSpectrum ℤ, Module.rankAtStalk (R := ℤ) (ZMod 2) p = 0 := by
  sorry

-- test TauCeti.RingK0.clopenClass_prod_test (computation)
example (hU : IsClopen ({(primeFst k)} : Set (PrimeSpectrum (k × k)))) :
    clopenModule (⟨{(primeFst k)}, hU⟩ : TopologicalSpace.Clopens (PrimeSpectrum (k × k))) =
        Ideal.span {((1 : k), (0 : k))} ∧
      rank (k × k) (clopenClass ⟨{(primeFst k)}, hU⟩) = LocallyConstant.charFn ℤ hU := by
  sorry

-- test TauCeti.RingK0.componentwiseFree_const_test (degenerate)
example {B : Type u} [CommRing B] :
    Subsingleton (componentwiseFree (0 : LocallyConstant (PrimeSpectrum B) ℕ)) ∧
      ∀ n : ℕ, Nonempty (componentwiseFree (LocallyConstant.const (PrimeSpectrum B) n) ≃ₗ[B]
        (Fin n → B)) := by
  sorry

example {B : Type u} [CommRing B] [Subsingleton B] (f : LocallyConstant (PrimeSpectrum B) ℕ) :
    Subsingleton (componentwiseFree f) := by
  sorry

-- test TauCeti.RingK0.clopenClass_connected_test (characterisation)
example {B : Type u} [CommRing B] [ConnectedSpace (PrimeSpectrum B)]
    (U : TopologicalSpace.Clopens (PrimeSpectrum B)) :
    clopenClass U = 0 ∨ clopenClass U = of B B := by
  sorry

-- test TauCeti.RingK0.componentwiseFree_not_free_test (non-example)
example (f : LocallyConstant (PrimeSpectrum (k × k)) ℕ) (hf₁ : f (primeFst k) =
    1) (hf₂ : f (primeSnd k) = 2) :
    Module.Projective (k × k) (componentwiseFree f) ∧
        ¬ Module.Free (k × k) (componentwiseFree f) := by
  sorry

-- test TauCeti.RingK0.rankSection_prod_test (computation)
example (hU : IsClopen ({(primeFst k)} : Set (PrimeSpectrum (k × k))))
    (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    rankSection (k × k) (LocallyConstant.charFn ℤ hU) = ofIdempotent _ h₁ ∧
      rankSection (k × k) 1 = of (k × k) (k × k) := by
  sorry

-- test TauCeti.RingK0.rankSection_zero_test (degenerate)
example {B : Type u} [CommRing B] : rankSection B 0 = 0 :=
  map_zero _

example {B : Type u} [CommRing B] [Subsingleton B] : rankSection B = 0 := by
  sorry

-- test TauCeti.RingK0.rankSection_connected_test (compatibility)
example {B : Type u} [CommRing B] [ConnectedSpace (PrimeSpectrum B)] (n : ℤ) :
    rankSection B (LocallyConstant.const (PrimeSpectrum B) n) = n • of B B :=
  rankSection_const n

-- test TauCeti.RingK0.rankSection_not_scalar_test (non-example)
example (hU : IsClopen ({(primeFst k)} : Set (PrimeSpectrum (k × k)))) :
    rankSection (k × k) (LocallyConstant.charFn ℤ hU) ∉
      AddSubgroup.zmultiples (of (k × k) (k × k)) := by
  sorry

-- test TauCeti.RingK0.rankFibres_constant_test (degenerate)
example {B : Type u} [CommRing B] [Nontrivial B] (n : ℕ) :
    rankFibres B (Fin n → B) = {n} ∧
      ∀ m : rankFibres B (Fin n → B), rankFibreIdempotent B (Fin n → B) m = 1 := by
  sorry

-- test TauCeti.RingK0.rankFibres_prod_test (computation)
/- `P = k × k²` is the componentwise free module of `f` with `f (primeFst k) = 1`, `f (primeSnd k)
= 2`. -/
example (f : LocallyConstant (PrimeSpectrum (k × k)) ℕ) (hf₁ : f (primeFst k) =
    1) (hf₂ : f (primeSnd k) = 2)
    (h1 : 1 ∈ rankFibres (k × k) (componentwiseFree f)) (h2 : 2 ∈ rankFibres (k × k)
        (componentwiseFree f)) :
    rankFibres (k × k) (componentwiseFree f) = {1, 2} ∧
      rankFibreIdempotent (k × k) (componentwiseFree f) ⟨1, h1⟩ = ((1 : k), (0 : k)) ∧
      rankFibreIdempotent (k × k) (componentwiseFree f) ⟨2, h2⟩ = ((0 : k), (1 : k)) := by
  sorry

-- test TauCeti.RingK0.rankFibres_connected_test (characterisation)
example {B : Type u} [CommRing B] [Nontrivial B] :
    ConnectedSpace (PrimeSpectrum B) ↔
      ∀ (P : Type u) [AddCommGroup P] [Module B P] [Module.Finite B P] [Module.Projective B P],
        (rankFibres B P).card = 1 := by
  sorry

-- test TauCeti.RingK0.rankFibres_not_components_test (non-example)
example : rankFibres (k × k × k) (k × k × k) = {1} ∧
    Nat.card (ConnectedComponents (PrimeSpectrum (k × k × k))) = 3 := by
  sorry

-- test TauCeti.RingK0.rankℤ_field_test (compatibility)
example : rankℤ k = ((divisionRingEquiv k : RingK0 k ≃+ ℤ) : RingK0 k →+ ℤ) :=
  (divisionRingEquiv_eq_rankℤ k).symm

-- test TauCeti.RingK0.rankℤ_disconnected_test (non-example)
example (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    ¬ ConnectedSpace (PrimeSpectrum (k × k)) ∧
      rank (k × k) (ofIdempotent _ h₁) (primeFst k) = 1 ∧
          rank (k × k) (ofIdempotent _ h₁) (primeSnd k) = 0 := by
  sorry

end RankTests

/-! ### `KTheoryLowDegrees:Z.2/integer-summand`, `Z.2/pid-k0` -/

/-- `KTheoryLowDegrees:Z.2/integer-summand`: a ring map `φ : R → D` to a division ring gives
`divisionRingEquiv ∘ map φ` sending `[R] ↦ 1`, so `freeClass` is split injective and
`RingK0 R ≃+ ℤ × ker`. -/
theorem integer_summand {R : Type u} [Ring R] {D : Type u} [DivisionRing D] (φ : R →+* D) :
    ((divisionRingEquiv D : RingK0 D →+ ℤ).comp (map φ)) (of R R) = 1 ∧
      Function.Injective (freeClass R) ∧
      Nonempty (RingK0 R ≃+ ℤ × ((divisionRingEquiv D : RingK0 D →+ ℤ).comp (map φ)).ker) := by
  sorry

/-- `KTheoryLowDegrees:Z.2/integer-summand` (existence): every nonzero commutative ring maps to a
field (a residue field `A ⧸ 𝔪`). -/
theorem integer_summand_exists (A : Type u) [CommRing A] [Nontrivial A] :
    ∃ (K : Type u) (_ : Field K), Nonempty (A →+* K) := by
  sorry

/-- `KTheoryLowDegrees:Z.2/pid-k0`: over a principal ideal domain every finitely generated
projective is free and `rankℤ : RingK0 A ≃ ℤ`, `[P] ↦ finrank_A P`; in particular `RingK0 ℤ ≃+ ℤ`.
-/
theorem pid_k0 (A : Type u) [CommRing A] [IsDomain A] [IsPrincipalIdealRing A] :
    (∀ (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P] [Module.Projective A P],
      Module.Free A P ∧ rankℤ A (of A P) = Module.finrank A P) ∧
      Function.Bijective (rankℤ A) := by
  sorry

/-! ### `KTheoryLowDegrees:Z.2/local-matrix-lift`, `Z.2/local-projective-free`, `Z.2/local-ring-k0`

A (possibly noncommutative) local ring is given by a two-sided ideal `m` (an `Ideal R` with
`m.IsTwoSided`, so that `R ⧸ m` is Mathlib's quotient ring) with `m ≠ ⊤` and every element outside
`m` a unit. -/

end RingK0

section LocalRing

variable {R : Type u} [Ring R] (m : Ideal R) [m.IsTwoSided]

/-- `KTheoryLowDegrees:Z.2/local-matrix-lift`: for `m : Ideal R` two-sided (`R ⧸ m` is
`Ideal.Quotient.ring`; the Jacobson-radical lemmas take `Ideal.toTwoSided m`), (i) `R ⧸ m` is a
division ring; (ii) `m` lies in the Jacobson radical, so `1 + x` is a unit for `x ∈ m`; (iii) a
matrix invertible modulo `m` is invertible. -/
theorem local_matrix_lift (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) :
    (Nontrivial (R ⧸ m) ∧ ∀ x : R ⧸ m, x ≠ 0 → IsUnit x) ∧
      (m ≤ Ideal.jacobson ⊥ ∧ ∀ x ∈ m, IsUnit (1 + x)) ∧
      ∀ (n : ℕ) (A : Matrix (Fin n) (Fin n) R),
        IsUnit (A.map (Ideal.Quotient.mk m)) → IsUnit A := by
  sorry

/-- `KTheoryLowDegrees:Z.2/local-projective-free`: over a local ring every finitely generated
projective left module is free, of rank `finrank_{R ⧸ m} (ExtendScalars (R → R ⧸ m) P)`. -/
theorem local_projective_free (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) (P : Type u)
    [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P] :
    Nonempty (P ≃ₗ[R]
      (Fin (Module.finrank (R ⧸ m) (ExtendScalars (Ideal.Quotient.mk m) P)) → R)) := by
  sorry

namespace RingK0

/-- **K₀ of a local ring** (`KTheoryLowDegrees:Z.2/local-ring-k0`): `[P] ↦ finrank_{R ⧸ m}
(ExtendScalars (R → R ⧸ m) P)` (a real definition through `RingK0.lift`, up to proofs). -/
def localEquiv (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) : RingK0 R ≃+ ℤ :=
  AddEquiv.ofBijective
    (lift (fun (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
        [Module.Projective R P] => (Module.finrank (R ⧸ m) (ExtendScalars (Ideal.Quotient.mk m) P)
            : ℤ))
      (by sorry) (by sorry))
    (by sorry)

variable {m}

/-- The value of `localEquiv` on classes. -/
@[simp]
theorem localEquiv_of (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) (P : Type u) [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] :
    localEquiv m hm hunit (of R P) =
      Module.finrank (R ⧸ m) (ExtendScalars (Ideal.Quotient.mk m) P) := by
  sorry

/-- `[R] ↦ 1`. -/
@[simp]
theorem localEquiv_one (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) :
    localEquiv m hm hunit (of R R) = 1 := by
  sorry

/-- The inverse is `n ↦ n • [R]`. -/
@[simp]
theorem localEquiv_symm_apply (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) (n : ℤ) :
    (localEquiv m hm hunit).symm n = n • of R R := by
  sorry

/-- For a commutative local ring, `localEquiv (maximalIdeal A) = rankℤ`. -/
theorem localEquiv_eq_rankℤ (A : Type u) [CommRing A] [IsLocalRing A] :
    ((localEquiv (IsLocalRing.maximalIdeal A) (IsLocalRing.maximalIdeal.isMaximal A).ne_top
      (fun _ hx => IsLocalRing.notMem_maximalIdeal.mp hx) : RingK0 A ≃+ ℤ) : RingK0 A →+ ℤ) =
        rankℤ A := by
  sorry

/-- `[P] = (localEquiv [P]) • [R]`. -/
theorem of_eq_finrank_smul (hm : m ≠ ⊤) (hunit : ∀ x ∉ m, IsUnit x) (P : Type u) [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] :
    of R P = localEquiv m hm hunit (of R P) • of R R := by
  sorry

end RingK0

end LocalRing

namespace RingK0

-- test TauCeti.RingK0.localEquiv_zp_test (computation)
example (p : ℕ) [(Ideal.span {(p : ℤ)}).IsPrime] :
    localEquiv (IsLocalRing.maximalIdeal (Localization.AtPrime (Ideal.span {(p : ℤ)})))
      (IsLocalRing.maximalIdeal.isMaximal _).ne_top
      (fun _ hx => IsLocalRing.notMem_maximalIdeal.mp hx)
      (of _ (Fin 3 → Localization.AtPrime (Ideal.span {(p : ℤ)}))) = 3 := by
  sorry

-- test TauCeti.RingK0.localEquiv_divisionRing_test (degenerate)
example {D : Type u} [DivisionRing D] (hm : (⊥ : Ideal D) ≠ ⊤)
    (hunit : ∀ x ∉ (⊥ : Ideal D), IsUnit x) : localEquiv ⊥ hm hunit = divisionRingEquiv D := by
  sorry

-- test TauCeti.RingK0.localEquiv_commRing_test (compatibility)
example (A : Type u) [CommRing A] [IsLocalRing A] (P : Type u) [AddCommGroup P] [Module A P]
    [Module.Finite A P] [Module.Projective A P] :
    ((localEquiv (IsLocalRing.maximalIdeal A) (IsLocalRing.maximalIdeal.isMaximal A).ne_top
      (fun _ hx => IsLocalRing.notMem_maximalIdeal.mp hx) : RingK0 A ≃+ ℤ) : RingK0 A →+ ℤ) =
        rankℤ A ∧
      localEquiv (IsLocalRing.maximalIdeal A) (IsLocalRing.maximalIdeal.isMaximal A).ne_top
        (fun _ hx => IsLocalRing.notMem_maximalIdeal.mp hx) (of A P) = Module.finrank A P := by
  sorry

-- test TauCeti.RingK0.localEquiv_nonlocal_test (non-example)
/- `k × k` has two maximal ideals: no ideal satisfies the hypothesis, and `K₀(k × k) ≅ ℤ²`. -/
example {k : Type u} [Field k] :
    ¬ (∃ m : Ideal (k × k), m ≠ ⊤ ∧ ∀ x ∉ m, IsUnit x) ∧ Nonempty (RingK0 (k × k) ≃+ ℤ × ℤ) := by
  sorry

/-- `KTheoryLowDegrees:Z.2/rank-localization`: (a) localisation restricts the rank along
`Spec(S⁻¹A) → Spec A`; (b) `(rank x)(p) = localEquiv (map (A → A_p) x)`; (c) `ker rank` is the
kernel of `K₀(A) → ∏_p K₀(A_p)`. -/
theorem rank_localization {A : Type u} [CommRing A] :
    (∀ (S : Submonoid A) (x : RingK0 A),
      rank (Localization S) (map (algebraMap A (Localization S)) x) =
        (rank A x).comap ⟨PrimeSpectrum.comap (algebraMap A (Localization S)),
          PrimeSpectrum.continuous_comap _⟩) ∧
      (∀ (p : PrimeSpectrum A) (x : RingK0 A),
        rank A x p = localEquiv (IsLocalRing.maximalIdeal (Localization.AtPrime p.asIdeal))
          (IsLocalRing.maximalIdeal.isMaximal _).ne_top
          (fun _ hx => IsLocalRing.notMem_maximalIdeal.mp hx)
          (map (algebraMap A (Localization.AtPrime p.asIdeal)) x)) ∧
      (rank A).ker = ⨅ p : PrimeSpectrum A,
        (map (algebraMap A (Localization.AtPrime p.asIdeal))).ker := by
  sorry

/-! ### `KTheoryLowDegrees:Z.2/pi-ring-modules`, `Z.2/k0-pi`, `Z.2/k0-field-product` -/

section Pi

variable {ι : Type} [Fintype ι] [DecidableEq ι] (A : ι → Type u) [∀ i, Ring (A i)]

/-- Helper instance: the product group structure on `∀ i, RingK0 (A i)` (instance search cannot
find `Pi.addCommGroup` here, as it leaves the universe of the `EssentiallySmall` instance of each
factor undetermined). -/
instance (priority := high) instAddCommGroupPi : AddCommGroup (∀ i, RingK0 (A i)) :=
  @Pi.addCommGroup ι (fun i => RingK0 (A i)) fun _ => inferInstance

/-- Helper instance: the addition of `∀ i, RingK0 (A i)`, from `instAddCommGroupPi`. -/
instance (priority := high) instAddPi : Add (∀ i, RingK0 (A i)) :=
  (instAddCommGroupPi A).toAdd

omit [Fintype ι] [DecidableEq ι] in
/-- `KTheoryLowDegrees:Z.2/pi-ring-modules` (a): each `A_i`, as a left `∏ A_j`-module through `πᵢ`,
is finitely generated projective. -/
theorem pi_ring_modules_finite_projective (i : ι) :
    finiteProjectiveModules (∀ i, A i)
      ((ModuleCat.restrictScalars (Pi.evalRingHom A i)).obj (ModuleCat.of (A i) (A i))) := by
  sorry

omit [Fintype ι] [DecidableEq ι] in
/-- `KTheoryLowDegrees:Z.2/pi-ring-modules` (b): `ExtendScalars πⱼ ((πᵢ)_* M)` is `M` for `j = i`
and `0` for `j ≠ i`. -/
theorem pi_ring_modules_extendScalars (i : ι) (M : Type u) [AddCommGroup M] [Module (A i) M] :
    Nonempty (ExtendScalars (Pi.evalRingHom A i)
        ((ModuleCat.restrictScalars (Pi.evalRingHom A i)).obj (ModuleCat.of (A i) M)) ≃ₗ[A i] M) ∧
      ∀ j, j ≠ i → Subsingleton (ExtendScalars (Pi.evalRingHom A j)
        ((ModuleCat.restrictScalars (Pi.evalRingHom A i)).obj (ModuleCat.of (A i) M))) := by
  sorry

omit [Fintype ι] [DecidableEq ι] in
/-- `KTheoryLowDegrees:Z.2/pi-ring-modules` (c): `P ≅ ∏ᵢ (πᵢ)_* (ExtendScalars πᵢ P)` (`ι` finite).
-/
theorem pi_ring_modules_decompose [Finite ι] (P : Type u) [AddCommGroup P] [Module (∀ i, A i) P] :
    Nonempty (P ≃ₗ[∀ i, A i] ∀ i, (ModuleCat.restrictScalars (Pi.evalRingHom A i)).obj
      (ModuleCat.of (A i) (ExtendScalars (Pi.evalRingHom A i) P))) := by
  sorry

/-- **The product formula** (`KTheoryLowDegrees:Z.2/k0-pi`): `x ↦ (map πᵢ x)ᵢ`, with inverse
`(xᵢ) ↦ Σᵢ transfer πᵢ xᵢ` (a real definition up to the inverse laws). -/
def piEquiv : RingK0 (∀ i, A i) ≃+ ∀ i, RingK0 (A i) where
  toFun x i := map (Pi.evalRingHom A i) x
  invFun y := ∑ i, transfer (Pi.evalRingHom A i) (pi_ring_modules_finite_projective A i) (y i)
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

omit [DecidableEq ι] in
/-- `piEquiv x i = map πᵢ x`. -/
@[simp]
theorem piEquiv_apply (x : RingK0 (∀ i, A i)) (i : ι) :
    piEquiv A x i = map (Pi.evalRingHom A i) x :=
  rfl

omit [DecidableEq ι] in
/-- `piEquiv.symm y = Σᵢ transfer πᵢ (y i)`. -/
@[simp]
theorem piEquiv_symm_apply (y : ∀ i, RingK0 (A i)) :
    (piEquiv A).symm y =
      ∑ i, transfer (Pi.evalRingHom A i) (pi_ring_modules_finite_projective A i) (y i) :=
  rfl

end Pi

section Prod

variable (A B : Type u) [Ring A] [Ring B]

/-- The binary product formula `RingK0 (A × B) ≃+ RingK0 A × RingK0 B`,
`x ↦ (map fst x, map snd x)` (a real definition up to proofs). -/
def prodEquiv : RingK0 (A × B) ≃+ RingK0 A × RingK0 B where
  toFun x := (map (RingHom.fst A B) x, map (RingHom.snd A B) x)
  invFun y := transfer (RingHom.fst A B) (by sorry) y.1 + transfer (RingHom.snd A B) (by sorry) y.2
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

variable {A B}

/-- `prodEquiv [P] = ([ExtendScalars fst P], [ExtendScalars snd P])`. -/
@[simp]
theorem prodEquiv_of (P : Type u) [AddCommGroup P] [Module (A × B) P] [Module.Finite (A × B) P]
    [Module.Projective (A × B) P] :
    prodEquiv A B (of (A × B) P) =
      (of A (ExtendScalars (RingHom.fst A B) P), of B (ExtendScalars (RingHom.snd A B) P)) := by
  sorry

/-- `prodEquiv.symm ([M], [N]) = [M × N]` with the componentwise action. -/
@[simp]
theorem prodEquiv_symm_of (M N : Type u) [AddCommGroup M] [Module A M] [Module.Finite A M]
    [Module.Projective A M] [AddCommGroup N] [Module B N] [Module.Finite B N]
    [Module.Projective B N]
    (h : finiteProjectiveModules (A × B) (ModuleCat.of (A × B)
      ((ModuleCat.restrictScalars (RingHom.fst A B)).obj (ModuleCat.of A M) ×
        (ModuleCat.restrictScalars (RingHom.snd A B)).obj (ModuleCat.of B N)))) :
    (prodEquiv A B).symm (of A M, of B N) = SplitK0.of ⟨_, h⟩ := by
  sorry

/-- For commutative `A, B`, under `PrimeSpectrum (A × B) ≃ PrimeSpectrum A ⊕ PrimeSpectrum B`,
`rank` corresponds to `(rank_A, rank_B)`. -/
theorem rank_prodEquiv {A B : Type u} [CommRing A] [CommRing B] (x : RingK0 (A × B)) :
    (∀ p : PrimeSpectrum A, rank (A × B) x ((PrimeSpectrum.primeSpectrumProd A B).symm (.inl p)) =
      rank A (prodEquiv A B x).1 p) ∧
      ∀ q : PrimeSpectrum B, rank (A × B) x ((PrimeSpectrum.primeSpectrumProd A B).symm (.inr q)) =
        rank B (prodEquiv A B x).2 q := by
  sorry

end Prod

section PiTests

variable {k : Type u} [Field k]

-- test TauCeti.RingK0.prodEquiv_field_test (computation)
example (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] : Matrix (Fin 1) (Fin 1) (k × k)))
    (h₂ : IsIdempotentElem (!![((0 : k), (1 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    Prod.map (divisionRingEquiv k) (divisionRingEquiv k) (prodEquiv k k (of (k × k) (k × k))) =
        (1, 1) ∧
      Prod.map (divisionRingEquiv k) (divisionRingEquiv k) (prodEquiv k k (ofIdempotent _ h₁)) =
        (1, 0) ∧
      Prod.map (divisionRingEquiv k) (divisionRingEquiv k) (prodEquiv k k (ofIdempotent _ h₂)) =
        (0, 1) := by
  sorry

-- test TauCeti.RingK0.piEquiv_empty_test (degenerate)
example (A : Fin 0 → Type u) [∀ i, Ring (A i)] :
    Subsingleton (RingK0 (∀ i, A i)) ∧ Subsingleton (∀ i, RingK0 (A i)) := by
  sorry

-- test TauCeti.RingK0.prodEquiv_rank_test (compatibility)
example {A B : Type u} [CommRing A] [CommRing B] (P : Type u) [AddCommGroup P] [Module (A × B) P]
    [Module.Finite (A × B) P] [Module.Projective (A × B) P] (p : PrimeSpectrum A) :
    rank (A × B) (of (A × B) P) ((PrimeSpectrum.primeSpectrumProd A B).symm (.inl p)) =
      rank A (map (RingHom.fst A B) (of (A × B) P)) p := by
  sorry

-- test TauCeti.RingK0.prodEquiv_not_diagonal_test (non-example)
example (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    (∀ n : ℤ, Prod.map (divisionRingEquiv k) (divisionRingEquiv k)
        (prodEquiv k k (n • of (k × k) (k × k))) = (n, n)) ∧
      Prod.map (divisionRingEquiv k) (divisionRingEquiv k) (prodEquiv k k (ofIdempotent _ h₁)) =
        (1, 0) := by
  sorry

/-- `KTheoryLowDegrees:Z.2/k0-field-product`: `rank : K₀(k × k) ≃ LocallyConstant (Spec (k × k)) ℤ ≅
ℤ²`, `[k × 0] ↦ (1, 0)`, `[0 × k] ↦ (0, 1)`. -/
theorem k0_field_product (h₁ : IsIdempotentElem (!![((1 : k), (0 : k))] :
      Matrix (Fin 1) (Fin 1) (k × k)))
    (h₂ : IsIdempotentElem (!![((0 : k), (1 : k))] : Matrix (Fin 1) (Fin 1) (k × k))) :
    Function.Bijective (rank (k × k)) ∧
      ∃ φ : LocallyConstant (PrimeSpectrum (k × k)) ℤ ≃+ ℤ × ℤ,
        φ (rank (k × k) (ofIdempotent _ h₁)) = (1, 0) ∧
          φ (rank (k × k) (ofIdempotent _ h₂)) = (0, 1) ∧
          φ (rank (k × k) (of (k × k) (k × k))) = (1, 1) := by
  sorry

end PiTests

end RingK0

/-! ### `KTheoryLowDegrees:Z.2/semilocal-components-finite`, `Z.2/semilocal-connected-k0`,
`Z.2/semilocal-k0` -/

/-- `KTheoryLowDegrees:Z.2/semilocal-components-finite`: a semilocal ring has at most as many
connected components as maximal ideals. -/
theorem semilocal_components_finite (A : Type u) [CommRing A] [Finite (MaximalSpectrum A)] :
    Finite (ConnectedComponents (PrimeSpectrum A)) ∧
      Nat.card (ConnectedComponents (PrimeSpectrum A)) ≤ Nat.card (MaximalSpectrum A) := by
  sorry

namespace RingK0

/-- `KTheoryLowDegrees:Z.2/semilocal-connected-k0`: over a connected semilocal ring every finitely
generated projective is free and `rankℤ : K₀(A) ≃ ℤ`. -/
theorem semilocal_connected_k0 (A : Type u) [CommRing A] [Finite (MaximalSpectrum A)]
    [ConnectedSpace (PrimeSpectrum A)] :
    (∀ (P : Type u) [AddCommGroup P] [Module A P] [Module.Finite A P] [Module.Projective A P],
      Nonempty (P ≃ₗ[A] (Fin (rankℤ A (of A P)).toNat → A))) ∧
      Function.Bijective (rankℤ A) := by
  sorry

/-- `KTheoryLowDegrees:Z.2/semilocal-k0`: for a semilocal ring, `rank : K₀(A) ≃
LocallyConstant (Spec A) ℤ ≅ ℤ^{π₀(Spec A)}`; the exponent counts components, not maximal ideals.
The isomorphism is `K₀(A) ≅ ∏_C K₀(A ⧸ I_C) ≅ ∏_C ℤ` through Tau Ceti's
`PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal`, each `A ⧸ I_C` connected
(`PrimeSpectrum.connectedSpace_quotient_connectedComponentsIdeal`). -/
theorem semilocal_k0 (A : Type u) [CommRing A] [Finite (MaximalSpectrum A)] :
    Function.Bijective (rank A) ∧
      Nonempty (LocallyConstant (PrimeSpectrum A) ℤ ≃+ (ConnectedComponents (PrimeSpectrum A) →
          ℤ)) ∧
      haveI := (semilocal_components_finite A).1
      Function.Bijective fun (x : RingK0 A) (C : ConnectedComponents (PrimeSpectrum A)) =>
        rankℤ (A ⧸ PrimeSpectrum.connectedComponentsIdeal C)
          (map ((Pi.evalRingHom _ C).comp
            (PrimeSpectrum.ringEquivPiQuotientConnectedComponentsIdeal (R := A)).toRingHom) x) := by
  sorry

/-! ### `KTheoryLowDegrees:Z.2/nonfree-projective-ideal`, `Z.2/matrix-division-ring-k0` -/

/-- `KTheoryLowDegrees:Z.2/nonfree-projective-ideal`: in `ℤ[√−5]` the ideal `(2, 1 + √−5)` is
finitely generated projective of constant rank one, and not free. -/
theorem nonfree_projective_ideal :
    let I : Ideal (Zsqrtd (-5)) := Ideal.span {2, 1 + Zsqrtd.sqrtd}
    Module.Finite (Zsqrtd (-5)) I ∧ Module.Projective (Zsqrtd (-5)) I ∧
      ¬ Module.Free (Zsqrtd (-5)) I ∧ ∀ p, Module.rankAtStalk (R := Zsqrtd (-5)) I p = 1 := by
  sorry

/-- `KTheoryLowDegrees:Z.2/matrix-division-ring-k0`: `K₀(Mₙ(D)) ≃ ℤ` sends the column vectors
`V = Dⁿ` to `1` and `[Mₙ(D)]` to `n`; for `n ≥ 2`, `freeClass` is injective, not surjective, and
`V` is not stably free. -/
theorem matrix_division_ring_k0 (D : Type u) [DivisionRing D] (n : ℕ) [NeZero n] :
    ∃ φ : RingK0 (Matrix (Fin n) (Fin n) D) ≃+ ℤ,
      φ (of _ (Matrix (Fin n) (Fin n) D)) = n ∧
        φ (SplitK0.of ⟨(ModuleCat.matrixEquivalence D (0 : Fin n)).functor.obj (ModuleCat.of D D),
          equivalence_preserves_finite_projective _ _
            (finiteProjectiveModules_iff.mpr ⟨inferInstance, inferInstance⟩)⟩) = 1 ∧
        (2 ≤ n → Function.Injective (freeClass (Matrix (Fin n) (Fin n) D)) ∧
          ¬ Function.Surjective (freeClass (Matrix (Fin n) (Fin n) D)) ∧
          ¬ Module.IsStablyFree (Matrix (Fin n) (Fin n) D)
            ((ModuleCat.matrixEquivalence D (0 : Fin n)).functor.obj (ModuleCat.of D D))) := by
  sorry

end RingK0

end TauCeti

/-! ## Stage `KTheoryLowDegrees:U.1` — the stable group `GL(A)`, elementary matrices, Whitehead

Over an arbitrary (noncommutative) ring. `GL n A = (Matrix n n A)ˣ` (Mathlib), `glMap` is its
functoriality (Mathlib's `Matrix.GeneralLinearGroup.map` needs commutative rings), and the stable
group `StableGL A` is Mathlib's `DirectLimit` along `g ↦ diag(g, 1)`. Commutators are Mathlib's
`⁅x, y⁆ = x y x⁻¹ y⁻¹`. -/

namespace TauCeti.KTheory

section Helpers

variable {A : Type u} [Ring A] {n m : Type*} [Fintype n] [DecidableEq n] [Fintype m]
  [DecidableEq m]

/-- Helper: reindexing `GL n A ≃* GL m A` along `n ≃ m` (through `Matrix.reindexAlgEquiv ℕ`). -/
def glReindex (e : n ≃ m) : GL n A ≃* GL m A :=
  Units.mapEquiv (Matrix.reindexAlgEquiv ℕ A e).toRingEquiv.toMulEquiv

/-- Helper: the diagonal matrix of a family of units, as an element of `GL`. -/
def diagUnit (d : n → Aˣ) : GL n A :=
  ⟨Matrix.diagonal fun i => (d i : A), Matrix.diagonal fun i => ((d i)⁻¹ : Aˣ), by sorry, by sorry⟩

/-- The matrix of `diagUnit d` (a real definition). -/
@[simp]
theorem coe_diagUnit (d : n → Aˣ) :
    (diagUnit d : Matrix n n A) = Matrix.diagonal fun i => (d i : A) :=
  rfl

/-- Helper: the permutation matrix of `σ` as an element of `GL` (inverse the matrix of `σ⁻¹`). -/
def permGL (σ : Equiv.Perm n) : GL n A :=
  ⟨σ.permMatrix A, σ⁻¹.permMatrix A, by sorry, by sorry⟩

end Helpers

/-! ### `KTheoryLowDegrees:U.1/general-linear-map` -/

section GeneralLinearMap

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {C : Type w} [Ring C]
  {n m : Type*} [Fintype n] [DecidableEq n] [Fintype m] [DecidableEq m]

/-- **`GL_n` along a homomorphism of arbitrary rings** (`KTheoryLowDegrees:U.1/general-linear-map`):
`glMap f := Units.map (RingHom.mapMatrix f)`, entrywise application of `f` (a real definition). -/
def glMap (f : A →+* B) : GL n A →* GL n B :=
  Units.map (RingHom.mapMatrix f).toMonoidHom

/-- Entries of `glMap f g` and of its inverse. -/
@[simp]
theorem glMap_apply (f : A →+* B) (g : GL n A) (i j : n) :
    (glMap f g : Matrix n n B) i j = f ((g : Matrix n n A) i j) ∧
      (((glMap f g)⁻¹ : GL n B) : Matrix n n B) i j = f (((g⁻¹ : GL n A) : Matrix n n A) i j) :=
  ⟨rfl, rfl⟩

/-- `glMap id = id`. -/
@[simp]
theorem glMap_id : glMap (RingHom.id A) = MonoidHom.id (GL n A) :=
  rfl

/-- `glMap (g ∘ f) = glMap g ∘ glMap f`. -/
theorem glMap_comp (f : A →+* B) (g : B →+* C) :
    glMap (n := n) (g.comp f) = (glMap g).comp (glMap f) :=
  rfl

/-- `glMap f` is injective if `f` is. -/
theorem glMap_injective {f : A →+* B} (hf : Function.Injective f) :
    Function.Injective (glMap (n := n) f) := by
  sorry

/-- `glMap f` commutes with reindexing. -/
theorem glMap_reindex (f : A →+* B) (e : n ≃ m) (g : GL n A) :
    glMap f (glReindex e g) = glReindex e (glMap f g) := by
  sorry

/-- For commutative rings, `glMap f` is Mathlib's `Matrix.GeneralLinearGroup.map f`. -/
theorem glMap_eq_map {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S) :
    glMap (n := n) f = Matrix.GeneralLinearGroup.map f :=
  rfl

-- test TauCeti.KTheory.glMap_int_zmod_two (computation)
example : glMap (Int.castRingHom (ZMod 2)) (diagUnit ![-1, 1] : GL (Fin 2) ℤ) = 1 := by
  apply Units.ext
  decide

-- test TauCeti.KTheory.glMap_id_eq (degenerate)
example (k : ℕ) : glMap (RingHom.id A) = MonoidHom.id (GL (Fin k) A) :=
  glMap_id

-- test TauCeti.KTheory.glMap_eq_map_int (compatibility)
example : glMap (n := Fin 2) (Int.castRingHom (ZMod 5)) =
    Matrix.GeneralLinearGroup.map (Int.castRingHom (ZMod 5)) :=
  glMap_eq_map _

-- test TauCeti.KTheory.glMap_not_surjective (non-example)
/- `diag(2, 1) ∈ GL₂(ℤ/5)` has determinant `2 ≠ ±1`. -/
example : (diagUnit ![ZMod.unitOfCoprime 2 (by decide), 1] : GL (Fin 2) (ZMod 5)) ∉
    Set.range (glMap (n := Fin 2) (Int.castRingHom (ZMod 5))) := by
  sorry

end GeneralLinearMap

/-! ### `KTheoryLowDegrees:U.1/elementary-matrix` -/

section Elementary

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {n m : Type*} [Fintype n] [DecidableEq n]
  [Fintype m] [DecidableEq m]

/-- **Elementary matrices over an arbitrary ring** (`KTheoryLowDegrees:U.1/elementary-matrix`):
`e_ij(a) := 1 + E_ij(a) ∈ GL n A` with inverse `1 + E_ij(-a)`, for `h : i ≠ j` (a real
definition; the unit laws are proofs). Left multiplication adds `a` times row `j` to row `i`. -/
def elementary {i j : n} (h : i ≠ j) (a : A) : GL n A :=
  ⟨1 + Matrix.single i j a, 1 + Matrix.single i j (-a), by sorry, by sorry⟩

/-- The matrices of `e_ij(a)` and of its inverse. -/
@[simp]
theorem coe_elementary {i j : n} (h : i ≠ j) (a : A) :
    (elementary h a : Matrix n n A) = 1 + Matrix.single i j a ∧
      (((elementary h a)⁻¹ : GL n A) : Matrix n n A) = 1 + Matrix.single i j (-a) :=
  ⟨rfl, rfl⟩

/-- `e_ij(0) = 1`. -/
@[simp]
theorem elementary_zero {i j : n} (h : i ≠ j) : elementary h (0 : A) = 1 := by
  sorry

/-- `e_ij(a + b) = e_ij(a) e_ij(b)`. -/
@[simp]
theorem elementary_add {i j : n} (h : i ≠ j) (a b : A) :
    elementary h (a + b) = elementary h a * elementary h b := by
  sorry

/-- `e_ij(a)⁻¹ = e_ij(-a)`. -/
@[simp]
theorem elementary_inv {i j : n} (h : i ≠ j) (a : A) : (elementary h a)⁻¹ = elementary h (-a) :=
  Units.ext rfl

/-- `a ↦ e_ij(a)` as a homomorphism `Multiplicative A →* GL n A` (a real definition). -/
def elementaryHom {i j : n} (h : i ≠ j) : Multiplicative A →* GL n A where
  toFun a := elementary h a.toAdd
  map_one' := elementary_zero h
  map_mul' a b := elementary_add h a.toAdd b.toAdd

/-- `a ↦ e_ij(a)` is injective: the `(i, j)` entry of `e_ij(a)` is `a`. -/
theorem elementary_injective {i j : n} (h : i ≠ j) :
    Function.Injective (elementary (A := A) h) ∧
      ∀ a : A, (elementary h a : Matrix n n A) i j = a := by
  sorry

/-- Row and column operations: left multiplication adds `a · (row j)` to row `i`, right
multiplication adds `(column i) · a` to column `j`. -/
theorem elementary_mul_apply {i j : n} (h : i ≠ j) (a : A) (M : Matrix n n A) (k l : n) :
    ((elementary h a : Matrix n n A) * M) k l = M k l + (if k = i then a * M j l else 0) ∧
      (M * (elementary h a : Matrix n n A)) k l = M k l + (if l = j then M k i * a else 0) := by
  sorry

/-- Naturality: `glMap f (e_ij(a)) = e_ij(f a)`. -/
@[simp]
theorem glMap_elementary (f : A →+* B) {i j : n} (h : i ≠ j) (a : A) :
    glMap f (elementary h a) = elementary h (f a) := by
  sorry

/-- Reindexing along `e : n ≃ m` sends `e_ij(a)` to `e_{e i, e j}(a)`. -/
theorem elementary_reindex (e : n ≃ m) {i j : n} (h : i ≠ j) (a : A) :
    glReindex e (elementary h a) = elementary (e.injective.ne h) a := by
  sorry

/-- For commutative `A`, `e_ij(a)` is Mathlib's `GeneralLinearGroup.transvection` and Tau Ceti's
`transvectionUnit`. -/
theorem elementary_eq_transvection {R : Type*} [CommRing R] {i j : n} (h : i ≠ j) (a : R) :
    elementary h a = Matrix.GeneralLinearGroup.transvection i j h a ∧
      elementary h a = TauCeti.transvectionUnit h a := by
  sorry

/-- For commutative `A`, `det e_ij(a) = 1`. -/
@[simp]
theorem det_elementary {R : Type*} [CommRing R] {i j : n} (h : i ≠ j) (a : R) :
    Matrix.GeneralLinearGroup.det (elementary h a) = 1 := by
  sorry

-- test TauCeti.KTheory.elementary_weyl_two (computation)
/- `e₁₂(1) e₂₁(-1) e₁₂(1)` has rows `(0, 1), (-1, 0)` over any ring (0-indexed). -/
example : ((elementary (by decide : (0 : Fin 2) ≠ 1) (1 : A) *
    elementary (by decide : (1 : Fin 2) ≠ 0) (-1) * elementary (by decide : (0 : Fin 2) ≠ 1) 1 :
      GL (Fin 2) A) : Matrix (Fin 2) (Fin 2) A) = !![0, 1; -1, 0] := by
  rw [Units.val_mul, Units.val_mul, (coe_elementary _ _).1, (coe_elementary _ _).1]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Fin.sum_univ_two, Matrix.one_apply, Matrix.single_apply]

-- test TauCeti.KTheory.elementary_zero_eq_one (degenerate)
example {i j : n} (h : i ≠ j) : elementary h (0 : A) = 1 :=
  elementary_zero h

example [Subsingleton A] (g : GL n A) : g = 1 := by
  sorry

-- test TauCeti.KTheory.elementary_eq_transvectionUnit_int (compatibility)
example {i j : Fin 3} (h : i ≠ j) (a : ℤ) : elementary h a = TauCeti.transvectionUnit h a :=
  (elementary_eq_transvection h a).2

-- test TauCeti.KTheory.elementary_mul_quaternion (non-example)
/- Row `0` of `e₀₁(i) · M`, `M` with rows `(0, 0), (j, 0)`, is `(i·j, 0) = (k, 0)`, not
`(j·i, 0) = (-k, 0)`. -/
example : ((elementary (by decide : (0 : Fin 2) ≠ 1) (⟨0, 1, 0, 0⟩ : ℍ[ℝ]) :
        Matrix (Fin 2) (Fin 2) ℍ[ℝ]) * !![0, 0; (⟨0, 0, 1, 0⟩ : ℍ[ℝ]), 0]) 0 0 =
      (⟨0, 0, 0, 1⟩ : ℍ[ℝ]) ∧
    ((elementary (by decide : (0 : Fin 2) ≠ 1) (⟨0, 1, 0, 0⟩ : ℍ[ℝ]) :
        Matrix (Fin 2) (Fin 2) ℍ[ℝ]) * !![0, 0; (⟨0, 0, 1, 0⟩ : ℍ[ℝ]), 0]) 0 0 ≠
      (⟨0, 0, 0, -1⟩ : ℍ[ℝ]) := by
  sorry

end Elementary

/-! ### `KTheoryLowDegrees:U.1/stabilisation-map` -/

section Stabilise

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {k m n p : ℕ}

/-- The matrix `diag(M, 1)` of size `n` from `M` of size `m` (entries of `M` on the first `m`
indices, identity elsewhere; helper, a real definition). -/
def stabiliseMatrix (M : Matrix (Fin m) (Fin m) A) : Matrix (Fin n) (Fin n) A :=
  Matrix.of fun a b => if h : (a : ℕ) < m ∧ (b : ℕ) < m then M ⟨a, h.1⟩ ⟨b, h.2⟩
    else (1 : Matrix (Fin n) (Fin n) A) a b

/-- `M ↦ diag(M, 1)` is multiplicative for `m ≤ n` (helper). -/
def stabiliseMonoidHom (h : m ≤ n) : Matrix (Fin m) (Fin m) A →* Matrix (Fin n) (Fin n) A where
  toFun := stabiliseMatrix
  map_one' := by sorry
  map_mul' := by sorry

/-- **The stabilisation embedding** `g ↦ diag(g, 1)` (`KTheoryLowDegrees:U.1/stabilisation-map`),
`GL_m(A) →* GL_n(A)` for `m ≤ n` (a real definition). -/
def stabilise (h : m ≤ n) : GL (Fin m) A →* GL (Fin n) A :=
  Units.map (stabiliseMonoidHom h)

/-- Entries of `stabilise h g`. -/
@[simp]
theorem stabilise_apply (h : m ≤ n) (g : GL (Fin m) A) (a b : Fin n) :
    (stabilise h g : Matrix (Fin n) (Fin n) A) a b =
      if hab : (a : ℕ) < m ∧ (b : ℕ) < m then (g : Matrix (Fin m) (Fin m) A) ⟨a, hab.1⟩ ⟨b, hab.2⟩
        else if a = b then 1 else 0 := by
  sorry

/-- `stabilise` along `m ≤ m` is the identity. -/
@[simp]
theorem stabilise_self : stabilise (le_refl m) = MonoidHom.id (GL (Fin m) A) := by
  sorry

/-- The directed-system law `stabilise_{n,k} ∘ stabilise_{m,n} = stabilise_{m,k}`. -/
theorem stabilise_stabilise (hmn : m ≤ n) (hnk : n ≤ k) (g : GL (Fin m) A) :
    stabilise hnk (stabilise hmn g) = stabilise (hmn.trans hnk) g := by
  sorry

/-- `(GL_n(A), stabilise)` is a directed system over `(ℕ, ≤)`. -/
instance instDirectedSystem :
    DirectedSystem (fun n : ℕ => GL (Fin n) A) (fun _ _ h => ⇑(stabilise (A := A) h)) where
  map_self i x := by rw [stabilise_self]; rfl
  map_map _ _ _ hij hjk x := stabilise_stabilise hij hjk x

/-- `stabilise h` is injective. -/
theorem stabilise_injective (h : m ≤ n) : Function.Injective (stabilise (A := A) h) := by
  sorry

/-- `stabilise` sends `e_ij(a)` to `e_{ij}(a)` with the indices cast along `Fin m → Fin n`. -/
@[simp]
theorem stabilise_elementary (h : m ≤ n) {i j : Fin m} (hij : i ≠ j) (a : A) :
    stabilise h (elementary hij a) = elementary ((Fin.castLE_injective h).ne hij) a := by
  sorry

/-- `stabilise` commutes with `glMap f`. -/
theorem glMap_stabilise (f : A →+* B) (h : m ≤ n) (g : GL (Fin m) A) :
    glMap f (stabilise h g) = stabilise h (glMap f g) := by
  sorry

/-- The matrix of `stabilise h g` is `fromBlocks g 0 0 1` reindexed along `finSumFinEquiv` and the
cast `m + (n - m) = n`. -/
theorem stabilise_eq_fromBlocks (h : m ≤ n) (g : GL (Fin m) A) :
    (stabilise h g : Matrix (Fin n) (Fin n) A) =
      Matrix.reindex (finSumFinEquiv.trans (finCongr (Nat.add_sub_cancel' h)))
        (finSumFinEquiv.trans (finCongr (Nat.add_sub_cancel' h)))
        (Matrix.fromBlocks (g : Matrix (Fin m) (Fin m) A) 0 0 1) := by
  sorry

/-- For commutative `A`, `stabilise` preserves determinants. -/
@[simp]
theorem det_stabilise {R : Type*} [CommRing R] (h : m ≤ n) (g : GL (Fin m) R) :
    Matrix.GeneralLinearGroup.det (stabilise h g) = Matrix.GeneralLinearGroup.det g := by
  sorry

-- test TauCeti.KTheory.stabilise_one_two_unit (computation)
example (u : Aˣ) : stabilise (by norm_num : 1 ≤ 2) (diagUnit ![u]) = diagUnit ![u, 1] := by
  apply Units.ext
  ext a b
  rw [stabilise_apply]
  fin_cases a <;> fin_cases b <;> simp [coe_diagUnit]

-- test TauCeti.KTheory.stabilise_zero (degenerate)
example (g : GL (Fin 0) A) : stabilise (Nat.zero_le n) g = 1 := by
  sorry

-- test TauCeti.KTheory.stabilise_transvectionStruct (compatibility)
example {R : Type*} [CommRing R] (t : Matrix.TransvectionStruct (Fin m) R) :
    (stabilise (Nat.le_add_right m p) (Matrix.SpecialLinearGroup.toGL t.toSpecialLinearGroup) :
        Matrix (Fin (m + p)) (Fin (m + p)) R) =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (t.sumInl (Fin p)).toMatrix := by
  sorry

-- test TauCeti.KTheory.stabilise_ne_right_corner (non-example)
example (u : Aˣ) (hu : u ≠ 1) :
    stabilise (by norm_num : 1 ≤ 2) (diagUnit ![u]) ≠ diagUnit ![1, u] := by
  sorry

end Stabilise

/-! ### `KTheoryLowDegrees:U.1/stable-general-linear-group` -/

section StableGL

variable (A : Type u) [Ring A] {B : Type v} [Ring B] {C : Type w} [Ring C]

/-- **The infinite general linear group** (`KTheoryLowDegrees:U.1/stable-general-linear-group`):
Mathlib's `DirectLimit` of `(GL_n(A), stabilise)` over `ℕ`, a group through
`Mathlib/Algebra/Colimit/DirectLimit.lean` (a real definition). -/
def StableGL : Type u :=
  DirectLimit (fun n : ℕ => GL (Fin n) A) (fun _ _ h => stabilise (A := A) h)

/-- The group structure from Mathlib's `DirectLimit`. -/
instance StableGL.instGroup : Group (StableGL A) :=
  inferInstanceAs (Group (DirectLimit (fun n : ℕ => GL (Fin n) A) (fun _ _ h => stabilise h)))

variable {A}

namespace StableGL

/-- `StableGL.of n : GL_n(A) →* GL(A)`, `g ↦ ⟦(n, g)⟧` (a real definition). -/
def of (n : ℕ) : GL (Fin n) A →* StableGL A where
  toFun g := (⟦⟨n, g⟩⟧ : DirectLimit (fun n : ℕ => GL (Fin n) A) (fun _ _ h => stabilise h))
  map_one' := by sorry
  map_mul' := by sorry

/-- `of_n ∘ stabilise_{m,n} = of_m`. -/
@[simp]
theorem of_stabilise {m n : ℕ} (h : m ≤ n) (g : GL (Fin m) A) : of n (stabilise h g) = of m g := by
  sorry

/-- `of n` is injective. -/
theorem of_injective (n : ℕ) : Function.Injective (of (A := A) n) := by
  sorry

/-- Every element is `of n g` (promoted to `U.1/finite-representatives`). -/
theorem exists_of (x : StableGL A) : ∃ (n : ℕ) (g : GL (Fin n) A), x = of n g := by
  sorry

/-- Equality after the common stabilisation to `max m n` (promoted to
`U.1/stable-equality-criterion`). -/
theorem of_eq_of_iff {m n : ℕ} (g : GL (Fin m) A) (h : GL (Fin n) A) :
    of m g = of n h ↔ stabilise (le_max_left m n) g = stabilise (le_max_right m n) h := by
  sorry

/-- The universal property: a compatible family `φ n : GL_n(A) →* H` induces `GL(A) →* H` (a real
definition through `DirectLimit.lift`). -/
def lift {H : Type*} [Group H] (φ : ∀ n : ℕ, GL (Fin n) A →* H)
    (hφ : ∀ (m n : ℕ) (h : m ≤ n) (g : GL (Fin m) A), φ n (stabilise h g) = φ m g) :
    StableGL A →* H where
  toFun := DirectLimit.lift _ (fun n g => φ n g) fun m n h g => (hφ m n h g).symm
  map_one' := by sorry
  map_mul' := by sorry

/-- `lift φ (of n g) = φ n g`. -/
@[simp]
theorem lift_of {H : Type*} [Group H] (φ : ∀ n : ℕ, GL (Fin n) A →* H)
    (hφ : ∀ (m n : ℕ) (h : m ≤ n) (g : GL (Fin m) A), φ n (stabilise h g) = φ m g) (n : ℕ)
    (g : GL (Fin n) A) : lift φ hφ (of n g) = φ n g :=
  rfl

/-- Homomorphisms out of `GL(A)` agreeing on every `of n` are equal. -/
theorem hom_ext {H : Type*} [Group H] {f g : StableGL A →* H}
    (h : ∀ n : ℕ, f.comp (of n) = g.comp (of n)) : f = g := by
  sorry

/-- Functoriality: `StableGL.map f` (a real definition through `DirectLimit.map`). -/
def map (f : A →+* B) : StableGL A →* StableGL B where
  toFun := DirectLimit.map _ _ (fun n => glMap (n := Fin n) f) fun m n h g =>
    (glMap_stabilise f h g).symm
  map_one' := by sorry
  map_mul' := by sorry

/-- `map f (of n g) = of n (glMap f g)`. -/
@[simp]
theorem map_of (f : A →+* B) (n : ℕ) (g : GL (Fin n) A) : map f (of n g) = of n (glMap f g) :=
  rfl

/-- `map id = id`. -/
@[simp]
theorem map_id : map (RingHom.id A) = MonoidHom.id (StableGL A) := by
  sorry

/-- `map (g ∘ f) = map g ∘ map f`. -/
theorem map_comp (f : A →+* B) (g : B →+* C) : map (g.comp f) = (map g).comp (map f) := by
  sorry

/-- Induction on representatives. -/
theorem induction_on {motive : StableGL A → Prop} (x : StableGL A)
    (h : ∀ (n : ℕ) (g : GL (Fin n) A), motive (of n g)) : motive x := by
  sorry

-- test TauCeti.KTheory.StableGL.of_one_eq_of_two (computation)
example (u : Aˣ) : of 1 (diagUnit ![u]) = of 2 (diagUnit ![u, 1]) := by
  sorry

-- test TauCeti.KTheory.StableGL.subsingleton_zero_ring (degenerate)
example [Subsingleton A] : Subsingleton (StableGL A) := by
  sorry

-- test TauCeti.KTheory.StableGL.map_int_zmod (compatibility)
example (n : ℕ) (g : GL (Fin n) ℤ) :
    map (Int.castRingHom (ZMod 2)) (of n g) =
      of n (Matrix.GeneralLinearGroup.map (Int.castRingHom (ZMod 2)) g) :=
  rfl

-- test TauCeti.KTheory.StableGL.of_two_right_corner_ne (non-example)
example (u : Aˣ) (hu : u ≠ 1) : of 2 (diagUnit ![1, u]) ≠ of 1 (diagUnit ![u]) := by
  sorry

end StableGL

/-- `KTheoryLowDegrees:U.1/finite-representatives`: finitely many elements of `GL(A)` have
representatives in one `GL_n(A)`, and then in every larger one. -/
theorem finite_representatives {k : ℕ} (x : Fin k → StableGL A) :
    ∃ n₀ : ℕ, ∀ n, n₀ ≤ n → ∃ g : Fin k → GL (Fin n) A, ∀ i, x i = StableGL.of n (g i) := by
  sorry

/-- `KTheoryLowDegrees:U.1/stable-equality-criterion`: `of_m g = of_n h` iff the stabilisations
agree in some, equivalently every, common rank, equivalently in rank `max m n`; `of_n` is
injective. -/
theorem stable_equality_criterion {m n : ℕ} (g : GL (Fin m) A) (h : GL (Fin n) A) :
    List.TFAE [StableGL.of m g = StableGL.of n h,
      ∃ (k : ℕ) (hm : m ≤ k) (hn : n ≤ k), stabilise hm g = stabilise hn h,
      ∀ (k : ℕ) (hm : m ≤ k) (hn : n ≤ k), stabilise hm g = stabilise hn h,
      stabilise (le_max_left m n) g = stabilise (le_max_right m n) h] ∧
      (StableGL.of m g = 1 ↔ g = 1) := by
  sorry

end StableGL

/-! ### `KTheoryLowDegrees:U.1/block-sum` -/

section BlockSum

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {l m n : ℕ}

/-- **Block sums** (`KTheoryLowDegrees:U.1/block-sum`): `(g, h) ↦ g ⊕ h`, the matrix
`fromBlocks g 0 0 h` reindexed along `finSumFinEquiv` (a real definition up to the unit and
homomorphism laws). -/
def blockSum : GL (Fin m) A × GL (Fin n) A →* GL (Fin (m + n)) A where
  toFun p := ⟨Matrix.reindex finSumFinEquiv finSumFinEquiv
      (Matrix.fromBlocks (p.1 : Matrix (Fin m) (Fin m) A) 0 0 (p.2 : Matrix (Fin n) (Fin n) A)),
    Matrix.reindex finSumFinEquiv finSumFinEquiv
      (Matrix.fromBlocks ((p.1⁻¹ : GL (Fin m) A) : Matrix (Fin m) (Fin m) A) 0 0
        ((p.2⁻¹ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A)), by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- The entries of `g ⊕ h`: `g` on the first block, `h` on the last, `0` elsewhere. -/
@[simp]
theorem blockSum_apply (g : GL (Fin m) A) (h : GL (Fin n) A) (a b : Fin m) (c d : Fin n) :
    (blockSum (g, h) : Matrix (Fin (m + n)) (Fin (m + n)) A) (Fin.castAdd n a) (Fin.castAdd n b) =
        (g : Matrix (Fin m) (Fin m) A) a b ∧
      (blockSum (g, h) : Matrix (Fin (m + n)) (Fin (m + n)) A) (Fin.natAdd m c) (Fin.natAdd m d) =
        (h : Matrix (Fin n) (Fin n) A) c d ∧
      (blockSum (g, h) : Matrix (Fin (m + n)) (Fin (m + n)) A) (Fin.castAdd n a) (Fin.natAdd m d) =
        0 ∧
      (blockSum (g, h) : Matrix (Fin (m + n)) (Fin (m + n)) A) (Fin.natAdd m c) (Fin.castAdd n b) =
        0 := by
  sorry

/-- `g ⊕ 1 = stabilise g`. -/
theorem blockSum_one_right (g : GL (Fin m) A) :
    blockSum (g, (1 : GL (Fin n) A)) = stabilise (Nat.le_add_right m n) g := by
  sorry

/-- Associativity up to the identification `Fin (l + (m + n)) = Fin (l + m + n)`. -/
theorem blockSum_assoc (f : GL (Fin l) A) (g : GL (Fin m) A) (h : GL (Fin n) A) :
    blockSum (blockSum (f, g), h) =
      glReindex (finCongr (Nat.add_assoc l m n).symm) (blockSum (f, blockSum (g, h))) := by
  sorry

/-- The summand `GL_0` is neutral up to the cast `Fin (0 + n) = Fin n`. -/
theorem blockSum_zero_left (h : GL (Fin n) A) :
    blockSum ((1 : GL (Fin 0) A), h) = glReindex (finCongr (Nat.zero_add n).symm) h := by
  sorry

/-- Swapping the summands is conjugation by a permutation matrix `w` (which need not lie in
`E_{m+n}(A)`). -/
theorem blockSum_swap (g : GL (Fin m) A) (h : GL (Fin n) A) :
    ∃ (σ : Equiv.Perm (Fin (n + m))) (w : GL (Fin (n + m)) A),
      (w : Matrix (Fin (n + m)) (Fin (n + m)) A) = σ.permMatrix A ∧
        blockSum (h, g) = w * glReindex (finCongr (Nat.add_comm m n)) (blockSum (g, h)) * w⁻¹ := by
  sorry

/-- `glMap f (g ⊕ h) = glMap f g ⊕ glMap f h`. -/
theorem glMap_blockSum (f : A →+* B) (g : GL (Fin m) A) (h : GL (Fin n) A) :
    glMap f (blockSum (g, h)) = blockSum (glMap f g, glMap f h) := by
  sorry

/-- `e_ij(a) ⊕ 1 = e_ij(a)` and `1 ⊕ e_ij(a) = e_{m+i, m+j}(a)`. -/
@[simp]
theorem blockSum_elementary {i j : Fin m} (hij : i ≠ j) {c d : Fin n} (hcd : c ≠ d) (a : A) :
    blockSum (elementary hij a, (1 : GL (Fin n) A)) =
        elementary ((Fin.castAdd_injective m n).ne hij) a ∧
      blockSum ((1 : GL (Fin m) A), elementary hcd a) =
        elementary ((Fin.natAdd_injective n m).ne hcd) a := by
  sorry

/-- For commutative `A`, `det (g ⊕ h) = det g · det h`. -/
@[simp]
theorem det_blockSum {R : Type*} [CommRing R] (g : GL (Fin m) R) (h : GL (Fin n) R) :
    Matrix.GeneralLinearGroup.det (blockSum (g, h)) =
      Matrix.GeneralLinearGroup.det g * Matrix.GeneralLinearGroup.det h := by
  sorry

/-- For commutative `A`, `toLin (g ⊕ h)` is Tau Ceti's `prodMap (toLin g) (toLin h)` under
`(Fin (m + n) → A) ≃ (Fin m → A) × (Fin n → A)`. -/
theorem toLin_blockSum {R : Type u} [CommRing R] (g : GL (Fin m) R) (h : GL (Fin n) R) :
    LinearMap.GeneralLinearGroup.congrLinearEquiv (FreeSummandData.blockEquiv m n).symm
        (Matrix.GeneralLinearGroup.toLin (blockSum (g, h))) =
      LinearMap.GeneralLinearGroup.prodMap (Matrix.GeneralLinearGroup.toLin g)
        (Matrix.GeneralLinearGroup.toLin h) := by
  sorry

-- test TauCeti.KTheory.blockSum_units (computation)
example (u v : Aˣ) : blockSum (diagUnit ![u], diagUnit ![v]) = diagUnit ![u, v] := by
  apply Units.ext
  ext a b
  have h := blockSum_apply (diagUnit ![u]) (diagUnit ![v]) 0 0 0 0
  fin_cases a <;> fin_cases b
  · simpa [coe_diagUnit] using h.1
  · simpa [coe_diagUnit] using h.2.2.1
  · simpa [coe_diagUnit] using h.2.2.2
  · simpa [coe_diagUnit] using h.2.1

-- test TauCeti.KTheory.blockSum_one_eq_stabilise (degenerate)
example (g : GL (Fin m) A) :
    blockSum (g, (1 : GL (Fin 0) A)) = glReindex (finCongr (Nat.add_zero m).symm) g ∧
      blockSum (g, (1 : GL (Fin n) A)) = stabilise (Nat.le_add_right m n) g := by
  sorry

-- test TauCeti.KTheory.det_blockSum_int (compatibility)
example (g : GL (Fin 2) ℤ) (h : GL (Fin 3) ℤ) :
    Matrix.GeneralLinearGroup.det (blockSum (g, h)) =
      Matrix.GeneralLinearGroup.det g * Matrix.GeneralLinearGroup.det h :=
  det_blockSum g h

-- test TauCeti.KTheory.blockSum_not_comm (non-example)
example (u : Aˣ) (hu : u ≠ 1) :
    blockSum (diagUnit ![u], (1 : GL (Fin 1) A)) ≠ blockSum ((1 : GL (Fin 1) A), diagUnit ![u])
        := by
  sorry

end BlockSum

/-! ### The real circle ring (test notation for `U.1`, `U.3` and `U.4`) -/

/-- Test notation: the real circle ring `ℝ[x, y]/(x² + y² - 1)`. -/
abbrev CircleRing : Type :=
  MvPolynomial (Fin 2) ℝ ⧸ Ideal.span {(MvPolynomial.X 0 : MvPolynomial (Fin 2) ℝ) ^ 2 +
    MvPolynomial.X 1 ^ 2 - 1}

/-- Test notation: `x ∈ ℝ[x, y]/(x² + y² - 1)`. -/
abbrev circleX : CircleRing := Ideal.Quotient.mk _ (MvPolynomial.X 0)

/-- Test notation: `y ∈ ℝ[x, y]/(x² + y² - 1)`. -/
abbrev circleY : CircleRing := Ideal.Quotient.mk _ (MvPolynomial.X 1)

/-- Test notation: the rotation matrix with rows `(x, -y), (y, x)`, of determinant `x² + y² = 1`,
in `SL₂` of the circle ring (a real matrix; the determinant equation is a proof). -/
def circleRotation : Matrix.SpecialLinearGroup (Fin 2) CircleRing :=
  ⟨!![circleX, -circleY; circleY, circleX], by sorry⟩

/-! ### `KTheoryLowDegrees:U.1/elementary-subgroup` -/

section ElementarySubgroup

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {n m : Type*} [Fintype n] [DecidableEq n]
  [Fintype m] [DecidableEq m]

/-- **The elementary subgroup** `E_n(A)` (`KTheoryLowDegrees:U.1/elementary-subgroup`): the closure
of the elementary matrices (a real definition). -/
def elementarySubgroup (n : Type*) [Fintype n] [DecidableEq n] (A : Type u) [Ring A] :
    Subgroup (GL n A) :=
  Subgroup.closure {g | ∃ (i j : n) (h : i ≠ j) (a : A), g = elementary h a}

/-- `e_ij(a) ∈ E_n(A)`. -/
@[simp]
theorem elementary_mem {i j : n} (h : i ≠ j) (a : A) : elementary h a ∈ elementarySubgroup n A :=
  Subgroup.subset_closure ⟨i, j, h, a, rfl⟩

/-- Induction on `E_n(A)`. -/
theorem elementarySubgroup.induction {motive : GL n A → Prop} {g : GL n A}
    (hg : g ∈ elementarySubgroup n A) (one : motive 1)
    (elem : ∀ {i j : n} (h : i ≠ j) (a : A), motive (elementary h a))
    (mul : ∀ x y, motive x → motive y → motive (x * y)) (inv : ∀ x, motive x → motive x⁻¹) :
    motive g := by
  sorry

/-- `E_1(A) = ⊥`. -/
@[simp]
theorem elementarySubgroup_fin_one : elementarySubgroup (Fin 1) A = ⊥ := by
  sorry

/-- For commutative `A`, `E_n(A) ≤ SL_n(A)`. -/
theorem elementarySubgroup_le_specialLinear {R : Type*} [CommRing R] :
    elementarySubgroup n R ≤ (Matrix.SpecialLinearGroup.toGL (n := n) (R := R)).range := by
  sorry

/-- For commutative `A`, `E_n(A)` is generated by Tau Ceti's `transvectionUnit`s. -/
theorem elementarySubgroup_eq_closure_transvectionUnit {R : Type*} [CommRing R] :
    elementarySubgroup n R =
      Subgroup.closure {g | ∃ (i j : n) (h : i ≠ j) (a : R), g = TauCeti.transvectionUnit h a} := by
  sorry

/-- Stabilisation maps `E_m(A)` into `E_n(A)`. -/
theorem map_stabilise_elementarySubgroup_le {k l : ℕ} (h : k ≤ l) :
    (elementarySubgroup (Fin k) A).map (stabilise h) ≤ elementarySubgroup (Fin l) A := by
  sorry

/-- `glMap f` maps `E_n(A)` into `E_n(B)`. -/
theorem map_glMap_elementarySubgroup_le (f : A →+* B) :
    (elementarySubgroup n A).map (glMap f) ≤ elementarySubgroup n B := by
  sorry

/-- Reindexing maps `E_n(A)` onto `E_m(A)`. -/
theorem elementarySubgroup_reindex (e : n ≃ m) :
    (elementarySubgroup n A).map (glReindex e).toMonoidHom = elementarySubgroup m A := by
  sorry

/-- For commutative `A`, a subgroup containing all adjacent elementary matrices contains
`E_{k+1}(A)` (from Tau Ceti's `transvectionUnit_mem_of_adjacent`). -/
theorem mem_of_adjacent {R : Type*} [CommRing R] {k : ℕ} (H : Subgroup (GL (Fin (k + 1)) R))
    (hadj : ∀ {i j : Fin (k + 1)} (hij : i ≠ j) (c : R),
      i.val + 1 = j.val ∨ j.val + 1 = i.val → elementary hij c ∈ H) :
    elementarySubgroup (Fin (k + 1)) R ≤ H := by
  sorry

-- test TauCeti.KTheory.card_elementarySubgroup_zmod_two (computation)
example : Nat.card (elementarySubgroup (Fin 2) (ZMod 2)) = 6 ∧
    elementarySubgroup (Fin 2) (ZMod 2) = ⊤ := by
  sorry

-- test TauCeti.KTheory.elementarySubgroup_fin_one_eq_bot (degenerate)
example : elementarySubgroup (Fin 1) A = ⊥ :=
  elementarySubgroup_fin_one

example [Subsingleton A] : elementarySubgroup n A = ⊤ := by
  sorry

-- test TauCeti.KTheory.elementarySubgroup_field_eq (compatibility)
example (F : Type*) [Field F] (k : ℕ) :
    elementarySubgroup (Fin k) F =
        (Matrix.SpecialLinearGroup.toGL (n := Fin k) (R := F)).range := by
  sorry

-- test TauCeti.KTheory.elementarySubgroup_ne_specialLinear (non-example)
/- The rotation matrix over `ℝ[x, y]/(x² + y² - 1)` is in `SL₂` but no stabilisation of it is
elementary (`U.3/SK1-real-circle-nonzero`). -/
example (k : ℕ) (h : 2 ≤ k) :
    stabilise h (Matrix.SpecialLinearGroup.toGL circleRotation) ∉
      elementarySubgroup (Fin k) CircleRing := by
  sorry

end ElementarySubgroup

/-! ### Commutator identities: `U.1/elementary-commutator-chain`, `U.1/elementary-commute`,
`U.1/elementary-commutator-reverse`, `U.1/signed-transposition`,
`U.1/elementary-surjective-map`, `U.1/elementary-perfect` -/

section Commutators

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {n : Type*} [Fintype n] [DecidableEq n]

/-- `KTheoryLowDegrees:U.1/elementary-commutator-chain`: `⁅e_ij(a), e_jl(b)⁆ = e_il(ab)` for
pairwise distinct `i, j, l`, over any ring (the order `ab` is forced). -/
theorem elementary_commutator_chain {i j l : n} (hij : i ≠ j) (hjl : j ≠ l) (hil : i ≠ l)
    (a b : A) : ⁅elementary hij a, elementary hjl b⁆ = elementary hil (a * b) := by
  sorry

/-- `KTheoryLowDegrees:U.1/elementary-commute`: `e_ij(a)` and `e_kl(b)` commute when `j ≠ k` and
`i ≠ l`. -/
theorem elementary_commute {i j k l : n} (hij : i ≠ j) (hkl : k ≠ l) (hjk : j ≠ k) (hil : i ≠ l)
    (a b : A) : Commute (elementary hij a) (elementary hkl b) := by
  sorry

/-- `KTheoryLowDegrees:U.1/elementary-commutator-reverse`: `⁅e_ij(a), e_ki(b)⁆ = e_kj(-ba)`. -/
theorem elementary_commutator_reverse {i j k : n} (hij : i ≠ j) (hki : k ≠ i) (hkj : k ≠ j)
    (a b : A) : ⁅elementary hij a, elementary hki b⁆ = elementary hkj (-(b * a)) :=
  calc ⁅elementary hij a, elementary hki b⁆ = ⁅elementary hki b, elementary hij a⁆⁻¹ :=
        (commutatorElement_inv _ _).symm
    _ = (elementary hkj (b * a))⁻¹ := by rw [elementary_commutator_chain hki hij hkj]
    _ = elementary hkj (-(b * a)) := elementary_inv _ _

/-- The signed transposition `w̄_ij := e_ij(1) e_ji(-1) e_ij(1)` (a real definition, helper for
`U.1/signed-transposition`). -/
def signedTransposition {i j : n} (h : i ≠ j) : GL n A :=
  elementary h 1 * elementary h.symm (-1) * elementary h 1

/-- `KTheoryLowDegrees:U.1/signed-transposition`: `w̄_ij ∈ E_n(A)` sends `e_j ↦ e_i`,
`e_i ↦ -e_j` and fixes the other basis vectors (column vectors); `w̄_ij⁻¹ = w̄_ji`; `w̄_jk w̄_ij` is
the permutation matrix of the 3-cycle `e_i ↦ e_k ↦ e_j ↦ e_i`; permutation matrices of even
permutations are elementary; for commutative `A`, `w̄_ij` is Tau Ceti's `transvectionWeylElement`.
-/
theorem signed_transposition {i j : n} (hij : i ≠ j) :
    signedTransposition (A := A) hij ∈ elementarySubgroup n A ∧
      (signedTransposition (A := A) hij : Matrix n n A) *ᵥ Pi.single j 1 = Pi.single i 1 ∧
      (signedTransposition (A := A) hij : Matrix n n A) *ᵥ Pi.single i 1 = -Pi.single j 1 ∧
      (∀ k, k ≠ i → k ≠ j →
        (signedTransposition (A := A) hij : Matrix n n A) *ᵥ Pi.single k 1 = Pi.single k 1) ∧
      (signedTransposition (A := A) hij)⁻¹ = signedTransposition hij.symm ∧
      (∀ {k : n} (hik : i ≠ k) (hjk : j ≠ k),
        ((signedTransposition (A := A) hjk * signedTransposition hij : GL n A) : Matrix n n A) *ᵥ
            Pi.single i 1 = Pi.single k 1 ∧
          ((signedTransposition (A := A) hjk * signedTransposition hij : GL n A) : Matrix n n A) *ᵥ
            Pi.single k 1 = Pi.single j 1 ∧
          ((signedTransposition (A := A) hjk * signedTransposition hij : GL n A) : Matrix n n A) *ᵥ
            Pi.single j 1 = Pi.single i 1) ∧
      ∀ σ : Equiv.Perm n, Equiv.Perm.sign σ = 1 →
        ∃ g ∈ elementarySubgroup n A, (g : Matrix n n A) = σ.permMatrix A := by
  sorry

/-- `KTheoryLowDegrees:U.1/signed-transposition` (commutative case): `w̄_ij` is Tau Ceti's
`transvectionWeylElement`. -/
theorem signed_transposition_eq_transvectionWeylElement {R : Type*} [CommRing R] {i j : n}
    (hij : i ≠ j) : signedTransposition (A := R) hij = TauCeti.transvectionWeylElement hij := by
  sorry

/-- `KTheoryLowDegrees:U.1/elementary-surjective-map`: a surjective ring map maps `E_n(A)` onto
`E_n(B)`. -/
theorem elementary_surjective_map {f : A →+* B} (hf : Function.Surjective f) :
    (elementarySubgroup n A).map (glMap f) = elementarySubgroup n B := by
  sorry

/-- **`E_n(A)` is perfect for `n ≥ 3`** (`KTheoryLowDegrees:U.1/elementary-perfect`), with
`e_ij(a) = ⁅e_ik(a), e_kj(1)⁆` for `k ∉ {i, j}`. -/
theorem elementary_perfect (hn : 3 ≤ Fintype.card n) :
    ⁅elementarySubgroup n A, elementarySubgroup n A⁆ = elementarySubgroup n A ∧
      ∀ {i j k : n} (hij : i ≠ j) (hik : i ≠ k) (hkj : k ≠ j) (a : A),
        elementary hij a = ⁅elementary hik a, elementary hkj 1⁆ := by
  sorry

end Commutators

/-! ### Whitehead: `U.1/block-unitriangular-elementary`, `U.1/whitehead-diagonal`,
`U.1/whitehead-block-product`, `U.1/commutator-in-elementary` -/

section Whitehead

variable {A : Type u} [Ring A]

/-- `KTheoryLowDegrees:U.1/block-unitriangular-elementary`: `[[1, X], [0, 1]]` and
`[[1, 0], [Y, 1]]` (reindexed along `finSumFinEquiv`) lie in `E_{p+q}(A)`, as products of `pq`
commuting elementary matrices. -/
theorem block_unitriangular_elementary {p q : ℕ} (X : Matrix (Fin p) (Fin q) A)
    (Y : Matrix (Fin q) (Fin p) A) :
    (∃ g ∈ elementarySubgroup (Fin (p + q)) A, (g : Matrix (Fin (p + q)) (Fin (p + q)) A) =
      Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks 1 X 0 1)) ∧
      ∃ g ∈ elementarySubgroup (Fin (p + q)) A, (g : Matrix (Fin (p + q)) (Fin (p + q)) A) =
        Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks 1 0 Y 1) := by
  sorry

/-- **Whitehead's identity** (`KTheoryLowDegrees:U.1/whitehead-diagonal`): `g ⊕ g⁻¹ ∈ E_{2n}(A)`,
through `g ⊕ g⁻¹ = [[1, g], [0, 1]] [[1, 0], [-g⁻¹, 1]] [[1, g], [0, 1]] [[0, -1], [1, 0]]`. -/
theorem whitehead_diagonal {n : ℕ} (g : GL (Fin n) A) :
    blockSum (g, g⁻¹) ∈ elementarySubgroup (Fin (n + n)) A ∧
      Matrix.fromBlocks (g : Matrix (Fin n) (Fin n) A) 0 0 ((g⁻¹ : GL (Fin n) A) : Matrix _ _ A) =
        Matrix.fromBlocks 1 (g : Matrix (Fin n) (Fin n) A) 0 1 *
          Matrix.fromBlocks 1 0 (-((g⁻¹ : GL (Fin n) A) : Matrix (Fin n) (Fin n) A)) 1 *
          Matrix.fromBlocks 1 (g : Matrix (Fin n) (Fin n) A) 0 1 * Matrix.fromBlocks 0 (-1)
              1 0 := by
  sorry

/-- `KTheoryLowDegrees:U.1/whitehead-block-product`: `a ⊕ b` lies in the left and right cosets of
`E_{2n}(A)` of `ab ⊕ 1` and of `ba ⊕ 1`. -/
theorem whitehead_block_product {n : ℕ} (a b : GL (Fin n) A) :
    (blockSum (a * b, 1))⁻¹ * blockSum (a, b) ∈ elementarySubgroup (Fin (n + n)) A ∧
      blockSum (a, b) * (blockSum (a * b, 1))⁻¹ ∈ elementarySubgroup (Fin (n + n)) A ∧
      (blockSum (b * a, 1))⁻¹ * blockSum (a, b) ∈ elementarySubgroup (Fin (n + n)) A ∧
      blockSum (a, b) * (blockSum (b * a, 1))⁻¹ ∈ elementarySubgroup (Fin (n + n)) A := by
  sorry

/-- `KTheoryLowDegrees:U.1/commutator-in-elementary`: `⁅g, h⁆ ⊕ 1 = (g ⊕ g⁻¹)(h ⊕ h⁻¹)((hg)⁻¹ ⊕ hg)`
lies in `E_{2n}(A)`, and so does `(g e g⁻¹) ⊕ 1` for `e ∈ E_n(A)`. -/
theorem commutator_in_elementary {n : ℕ} (g h : GL (Fin n) A) :
    blockSum (⁅g, h⁆, 1) = blockSum (g, g⁻¹) * blockSum (h, h⁻¹) * blockSum ((h * g)⁻¹, h * g) ∧
      blockSum (⁅g, h⁆, 1) ∈ elementarySubgroup (Fin (n + n)) A ∧
      ∀ e ∈ elementarySubgroup (Fin n) A,
        blockSum (g * e * g⁻¹, 1) = blockSum (g, g⁻¹) * blockSum (e, 1) * blockSum (g⁻¹, g) ∧
          blockSum (g * e * g⁻¹, 1) ∈ elementarySubgroup (Fin (n + n)) A := by
  sorry

end Whitehead

/-! ### `KTheoryLowDegrees:U.1/stable-elementary-subgroup` -/

section StableElementary

variable {A : Type u} [Ring A] {B : Type v} [Ring B]

variable (A) in
/-- **The stable elementary group** `E(A)` (`KTheoryLowDegrees:U.1/stable-elementary-subgroup`): the
closure of the `of_n(e_ij(a))` in `GL(A)` (a real definition). -/
def StableGL.elementary : Subgroup (StableGL A) :=
  Subgroup.closure {x | ∃ (n : ℕ) (i j : Fin n) (h : i ≠ j) (a : A),
    x = StableGL.of n (KTheory.elementary h a)}

namespace StableGL

/-- `of_n(e_ij(a)) ∈ E(A)`. -/
@[simp]
theorem of_elementary_mem {n : ℕ} {i j : Fin n} (h : i ≠ j) (a : A) :
    of n (KTheory.elementary h a) ∈ StableGL.elementary A :=
  Subgroup.subset_closure ⟨n, i, j, h, a, rfl⟩

/-- `x ∈ E(A)` iff `x = of_n e` with `e ∈ E_n(A)`. -/
theorem mem_elementary_iff (x : StableGL A) :
    x ∈ StableGL.elementary A ↔
      ∃ (n : ℕ) (e : GL (Fin n) A), e ∈ elementarySubgroup (Fin n) A ∧ x = of n e := by
  sorry

/-- `of_n g ∈ E(A)` iff some stabilisation of `g` is elementary. -/
theorem of_mem_elementary_iff {n : ℕ} (g : GL (Fin n) A) :
    of n g ∈ StableGL.elementary A ↔
      ∃ (k : ℕ) (h : n ≤ k), stabilise h g ∈ elementarySubgroup (Fin k) A := by
  sorry

/-- `E(A) = ⨆ n, (E_n(A)).map of_n`. -/
theorem elementary_eq_iSup :
    StableGL.elementary A = ⨆ n : ℕ, (elementarySubgroup (Fin n) A).map (of n) := by
  sorry

/-- `GL(f)` maps `E(A)` into `E(B)`. -/
theorem map_elementary_le (f : A →+* B) :
    (StableGL.elementary A).map (map f) ≤ StableGL.elementary B := by
  sorry

/-- For surjective `f`, `GL(f)` maps `E(A)` onto `E(B)`. -/
theorem map_elementary_eq {f : A →+* B} (hf : Function.Surjective f) :
    (StableGL.elementary A).map (map f) = StableGL.elementary B := by
  sorry

-- test TauCeti.KTheory.StableGL.of_neg_one_two_mem (computation)
example : of 2 (diagUnit ![-1, -1]) ∈ StableGL.elementary A := by
  sorry

-- test TauCeti.KTheory.StableGL.elementary_zero_ring (degenerate)
example [Subsingleton A] : StableGL.elementary A = ⊤ := by
  sorry

-- test TauCeti.KTheory.StableGL.elementary_transvectionUnit (compatibility)
example {R : Type u} [CommRing R] {n : ℕ} {i j : Fin n} (h : i ≠ j) (a : R) :
    of n (TauCeti.transvectionUnit h a) ∈ StableGL.elementary R := by
  sorry

-- test TauCeti.KTheory.StableGL.of_neg_one_not_mem (non-example)
example : of 1 (diagUnit ![-1] : GL (Fin 1) ℤ) ∉ StableGL.elementary ℤ := by
  sorry

end StableGL

end StableElementary

/-! ### `KTheoryLowDegrees:U.1/whitehead-lemma`, `U.1/stable-elementary-perfect`,
`U.1/stable-elementary-normal`, `U.1/elementary-centraliser`, `U.1/stable-elementary-centre`,
`U.1/rank-two-failure` -/

section WhiteheadLemma

variable {A : Type u} [Ring A]

/-- **Whitehead's Lemma** (`KTheoryLowDegrees:U.1/whitehead-lemma`): `⁅GL(A), GL(A)⁆ = E(A)` for
every ring. -/
theorem whitehead_lemma : commutator (StableGL A) = StableGL.elementary A := by
  sorry

/-- `KTheoryLowDegrees:U.1/stable-elementary-perfect`: `⁅E(A), E(A)⁆ = E(A)`. -/
theorem stable_elementary_perfect :
    ⁅StableGL.elementary A, StableGL.elementary A⁆ = StableGL.elementary A := by
  sorry

/-- `KTheoryLowDegrees:U.1/stable-elementary-normal`: `E(A)` is normal in `GL(A)` (an instance). -/
instance stable_elementary_normal : (StableGL.elementary A).Normal := by
  sorry

/-- `KTheoryLowDegrees:U.1/stable-elementary-normal`, with the explicit rank:
`(g e g⁻¹) ⊕ 1 ∈ E_{2n}(A)` for `g ∈ GL_n(A)` and `e ∈ E_n(A)`; no finite-rank normality. -/
theorem stable_elementary_normal_rank {n : ℕ} (g : GL (Fin n) A)
    (e : GL (Fin n) A) (he : e ∈ elementarySubgroup (Fin n) A) :
    blockSum (g * e * g⁻¹, 1) ∈ elementarySubgroup (Fin (n + n)) A := by
  sorry

/-- `KTheoryLowDegrees:U.1/elementary-centraliser`: for `n ≥ 2`, the centraliser of `E_n(A)`
consists of the scalar matrices `u · 1` with `u` a central unit. -/
theorem elementary_centraliser {n : Type*} [Fintype n] [DecidableEq n] (hn : 2 ≤ Fintype.card n)
    (g : GL n A) :
    (∀ e ∈ elementarySubgroup n A, Commute g e) ↔
      ∃ u : Aˣ, (u : A) ∈ Set.center A ∧ (g : Matrix n n A) = Matrix.scalar n (u : A) := by
  sorry

/-- `KTheoryLowDegrees:U.1/stable-elementary-centre`: an element of `GL(A)` commuting with `E(A)` is
`1`; in particular the centre of `E(A)` is trivial. -/
theorem stable_elementary_centre :
    (∀ z : StableGL A, (∀ e ∈ StableGL.elementary A, Commute z e) → z = 1) ∧
      Subgroup.center (StableGL.elementary A) = ⊥ := by
  sorry

/-- `KTheoryLowDegrees:U.1/rank-two-failure`: `E₂(𝔽₂) = GL₂(𝔽₂)` has order `6` with commutator
subgroup of order `3`, and `E₂(𝔽₃) = SL₂(𝔽₃)` has order `24` with commutator subgroup of order `8`;
so no rank-two form of `U.1/elementary-perfect` or `U.1/whitehead-lemma` holds. -/
theorem rank_two_failure :
    (Nat.card (elementarySubgroup (Fin 2) (ZMod 2)) = 6 ∧
        Nat.card (commutator (elementarySubgroup (Fin 2) (ZMod 2))) = 3 ∧
        ⁅(⊤ : Subgroup (GL (Fin 2) (ZMod 2))), ⊤⁆ ≠ elementarySubgroup (Fin 2) (ZMod 2)) ∧
      Nat.card (elementarySubgroup (Fin 2) (ZMod 3)) = 24 ∧
        Nat.card (commutator (elementarySubgroup (Fin 2) (ZMod 3))) = 8 ∧
        ⁅(⊤ : Subgroup (GL (Fin 2) (ZMod 3))), ⊤⁆ =
          (Matrix.SpecialLinearGroup.toGL (n := Fin 2) (R := ZMod 3)).range := by
  sorry

end WhiteheadLemma

end TauCeti.KTheory

/-! ## Stage `KTheoryLowDegrees:U.2` — `K₁` and the class of an automorphism

`K₁(A) = GL(A)/E(A)`, written multiplicatively. The class of an automorphism is taken for
finitely generated projective RIGHT `A`-modules and column vectors, i.e. modules over `Aᵐᵒᵖ` in
Mathlib (`autClass`); for commutative `A` this agrees with Mathlib's column convention
(`Matrix.GeneralLinearGroup.toLin`, `autClassComm`). The row-vector convention would transpose
matrices, which inverts `SK₁` classes. -/

namespace TauCeti.KTheory

/-! ### `KTheoryLowDegrees:U.2/K1` -/

section K1Def

variable (A : Type u) [Ring A] {B : Type v} [Ring B] {C : Type w} [Ring C]

/-- **K₁ of a ring** (`KTheoryLowDegrees:U.2/K1`): `K1 A := GL(A) ⧸ E(A)` (a real definition; the
normality instance is `stable_elementary_normal`). -/
def K1 : Type u := StableGL A ⧸ StableGL.elementary A

/-- `K1 A` is a commutative group (Whitehead's Lemma). -/
instance K1.instCommGroup : CommGroup (K1 A) :=
  { QuotientGroup.Quotient.group (StableGL.elementary A) with
    mul_comm := by sorry }

variable {A}

namespace K1

/-- The quotient map `GL(A) →* K₁(A)`. -/
def mk : StableGL A →* K1 A :=
  QuotientGroup.mk' (StableGL.elementary A)

/-- `K1.of n := K1.mk ∘ StableGL.of n`, the class `[g]` of `g ∈ GL_n(A)`. -/
def of (n : ℕ) : GL (Fin n) A →* K1 A :=
  mk.comp (StableGL.of n)

/-- `K1.mk` is surjective; every class is some `[g]`. -/
theorem mk_surjective :
    Function.Surjective (mk (A := A)) ∧ ∀ x : K1 A, ∃ (n : ℕ) (g : GL (Fin n) A), x = of n g := by
  sorry

/-- `mk x = 1 ↔ x ∈ E(A)`. -/
theorem mk_eq_one_iff (x : StableGL A) : mk x = 1 ↔ x ∈ StableGL.elementary A :=
  QuotientGroup.eq_one_iff x

/-- `[g] = 1` iff some stabilisation of `g` is elementary. -/
theorem of_eq_one_iff {n : ℕ} (g : GL (Fin n) A) :
    of n g = 1 ↔ ∃ (k : ℕ) (h : n ≤ k), stabilise h g ∈ elementarySubgroup (Fin k) A := by
  sorry

/-- `[g] = [h]` iff `of_n (g h⁻¹) ∈ E(A)`. -/
theorem of_eq_of_iff {n : ℕ} (g h : GL (Fin n) A) :
    of n g = of n h ↔ StableGL.of n (g * h⁻¹) ∈ StableGL.elementary A := by
  sorry

/-- Conjugate matrices have the same class. -/
@[simp]
theorem of_conj {n : ℕ} (x g : GL (Fin n) A) : of n (x * g * x⁻¹) = of n g := by
  sorry

/-- The universal property: homomorphisms from `GL(A)` to a commutative group factor uniquely
through `K1.mk` (a real definition through `QuotientGroup.lift`). -/
def lift {H : Type*} [CommGroup H] : (StableGL A →* H) ≃ (K1 A →* H) where
  toFun φ := QuotientGroup.lift (StableGL.elementary A) φ (by sorry)
  invFun ψ := ψ.comp mk
  left_inv := by sorry
  right_inv := by sorry

/-- `lift φ (mk x) = φ x`. -/
@[simp]
theorem lift_mk {H : Type*} [CommGroup H] (φ : StableGL A →* H) (x : StableGL A) :
    lift φ (mk x) = φ x :=
  rfl

/-- Homomorphisms out of `K1 A` agreeing on every `[g]` are equal. -/
theorem hom_ext {H : Type*} [Monoid H] {f g : K1 A →* H}
    (h : ∀ (n : ℕ) (x : GL (Fin n) A), f (of n x) = g (of n x)) : f = g := by
  sorry

end K1

end K1Def

/-! ### `KTheoryLowDegrees:U.2/K1-abelianization` and `U.2/K1-map` -/

section K1Map

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {C : Type w} [Ring C]

variable (A) in
/-- The isomorphism `K₁(A) ≃* Abelianization GL(A)` of `U.2/K1-abelianization` (a real definition:
`QuotientGroup.quotientMulEquivOfEq` along Whitehead's Lemma). -/
def K1.equivAbelianization : K1 A ≃* Abelianization (StableGL A) :=
  QuotientGroup.quotientMulEquivOfEq whitehead_lemma.symm

/-- `KTheoryLowDegrees:U.2/K1-abelianization`: `K₁(A) ≃* Abelianization GL(A)` sends `K1.mk x` to
`Abelianization.of x`, and turns `K1.lift` into `Abelianization.lift`. -/
theorem k1_abelianization (x : StableGL A) :
    K1.equivAbelianization A (K1.mk x) = Abelianization.of x := by
  sorry

/-- `KTheoryLowDegrees:U.2/K1-abelianization`: under `K1.equivAbelianization`, `K1.lift` is
`Abelianization.lift`. -/
theorem k1_abelianization_lift {H : Type*} [CommGroup H] (φ : StableGL A →* H) :
    K1.lift φ = (Abelianization.lift φ).comp (K1.equivAbelianization A).toMonoidHom := by
  sorry

namespace K1

/-- **Functoriality of `K₁`** (`KTheoryLowDegrees:U.2/K1-map`): induced by `StableGL.map f` (a real
definition through `QuotientGroup.map`). -/
def map (f : A →+* B) : K1 A →* K1 B :=
  QuotientGroup.map _ _ (StableGL.map f)
    (Subgroup.map_le_iff_le_comap.mp (StableGL.map_elementary_le f))

/-- `map f [g] = [glMap f g]`. -/
@[simp]
theorem map_of (f : A →+* B) {n : ℕ} (g : GL (Fin n) A) : map f (of n g) = of n (glMap f g) :=
  rfl

/-- `map f (mk x) = mk (StableGL.map f x)`. -/
@[simp]
theorem map_mk (f : A →+* B) (x : StableGL A) : map f (mk x) = mk (StableGL.map f x) :=
  rfl

/-- `map id = id`. -/
@[simp]
theorem map_id : map (RingHom.id A) = MonoidHom.id (K1 A) := by
  sorry

/-- `map (g ∘ f) = map g ∘ map f`. -/
theorem map_comp (f : A →+* B) (g : B →+* C) : map (g.comp f) = (map g).comp (map f) := by
  sorry

/-- Under `K1.equivAbelianization`, `map f` is `Abelianization.map (StableGL.map f)`. -/
theorem map_abelianization (f : A →+* B) (x : K1 A) :
    K1.equivAbelianization B (map f x) =
      Abelianization.map (StableGL.map f) (K1.equivAbelianization A x) := by
  sorry

-- test TauCeti.KTheory.K1.subsingleton_zero_ring (degenerate)
example [Subsingleton A] : Subsingleton (K1 A) := by
  sorry

-- test TauCeti.KTheory.K1.of_neg_one_two (computation)
example : of 2 (diagUnit ![-1, -1] : GL (Fin 2) A) = 1 := by
  sorry

-- test TauCeti.KTheory.K1.of_diag_right_eq_left (characterisation)
example (u : Aˣ) : of 2 (diagUnit ![1, u]) = of 2 (diagUnit ![u, 1]) ∧
    of 2 (diagUnit ![u, 1]) = of 1 (diagUnit ![u]) := by
  sorry

-- test TauCeti.KTheory.K1.equivAbelianization_mk (compatibility)
example (x : StableGL A) : K1.equivAbelianization A (mk x) = Abelianization.of x :=
  k1_abelianization x

-- test TauCeti.KTheory.K1.of_neg_one_int_ne_one (non-example)
example : of 1 (diagUnit ![-1] : GL (Fin 1) ℤ) ≠ 1 := by
  sorry

-- test TauCeti.KTheory.K1.map_zmod_two (computation)
example : map (Int.castRingHom (ZMod 2)) (of 2 (diagUnit ![-1, 1] : GL (Fin 2) ℤ)) = 1 := by
  sorry

-- test TauCeti.KTheory.K1.map_id_eq (degenerate)
example : map (RingHom.id A) = MonoidHom.id (K1 A) :=
  map_id

-- test TauCeti.KTheory.K1.map_eq_abelianization_map (compatibility)
example (f : A →+* B) :
    (K1.equivAbelianization B).toMonoidHom.comp (map f) =
      (Abelianization.map (StableGL.map f)).comp (K1.equivAbelianization A).toMonoidHom :=
  MonoidHom.ext fun x => map_abelianization f x

-- test TauCeti.KTheory.K1.map_not_surjective (non-example)
example : of 1 (diagUnit ![ZMod.unitOfCoprime 2 (by decide)] : GL (Fin 1) (ZMod 5)) ∉
    Set.range (map (Int.castRingHom (ZMod 5))) := by
  sorry

end K1

end K1Map

/-! ### `U.2/K1-stabilisation-invariance`, `U.2/K1-elementary-trivial`, `U.2/K1-block-sum`,
`U.2/K1-prod`, `U.2/K1-pi`, `U.2/block-triangular-class` -/

section K1Lemmas

variable {A : Type u} [Ring A]

/-- `KTheoryLowDegrees:U.2/K1-stabilisation-invariance`: `[stabilise g] = [g]`,
`[g ⊕ 1_k] = [g]` and `[1_k ⊕ g] = [g]`. -/
theorem k1_stabilisation_invariance {m n k : ℕ} (h : m ≤ n) (g : GL (Fin m) A) :
    K1.of n (stabilise h g) = K1.of m g ∧
      K1.of (m + k) (blockSum (g, (1 : GL (Fin k) A))) = K1.of m g ∧
      K1.of (k + m) (blockSum ((1 : GL (Fin k) A), g)) = K1.of m g := by
  sorry

/-- `KTheoryLowDegrees:U.2/K1-elementary-trivial`: `[e] = 1` for `e ∈ E_n(A)`, and
`[g ⊕ g⁻¹] = 1`. -/
theorem k1_elementary_trivial {n : ℕ} :
    (∀ e ∈ elementarySubgroup (Fin n) A, K1.of n e = 1) ∧
      ∀ g : GL (Fin n) A, K1.of (n + n) (blockSum (g, g⁻¹)) = 1 := by
  sorry

/-- `KTheoryLowDegrees:U.2/K1-block-sum`: `[g ⊕ h] = [g][h]`, and `[g ⊕ h] = [gh] = [hg]` in equal
sizes. -/
theorem k1_block_sum {m n : ℕ} (g : GL (Fin m) A) (h : GL (Fin n) A) :
    K1.of (m + n) (blockSum (g, h)) = K1.of m g * K1.of n h ∧
      ∀ g' h' : GL (Fin n) A, K1.of (n + n) (blockSum (g', h')) = K1.of n (g' * h') ∧
        K1.of (n + n) (blockSum (g', h')) = K1.of n (h' * g') := by
  sorry

/-- `KTheoryLowDegrees:U.2/K1-prod`: the projections induce `K₁(A × B) ≃* K₁(A) × K₁(B)`. -/
theorem k1_prod (A B : Type u) [Ring A] [Ring B] :
    Function.Bijective ((K1.map (RingHom.fst A B)).prod (K1.map (RingHom.snd A B))) := by
  sorry

/-- `KTheoryLowDegrees:U.2/K1-pi`: for a finite family, `K₁(∏ Aᵢ) ≃* ∏ K₁(Aᵢ)` (finiteness is used
twice; it fails for infinite families). -/
theorem k1_pi {ι : Type} [Finite ι] (A : ι → Type u) [∀ i, Ring (A i)] :
    Function.Bijective (MonoidHom.pi fun i => K1.map (Pi.evalRingHom A i)) := by
  sorry

/-- `KTheoryLowDegrees:U.2/block-triangular-class`: a block triangular matrix has the class of its
diagonal blocks, `[[[g₁, X], [0, g₂]]] = [g₁][g₂]` (and the lower form); a triangular matrix with
unit diagonal `u` has class `[diag u] = ∏ [uᵢ]`. -/
theorem block_triangular_class {m n : ℕ} (g₁ : GL (Fin m) A) (g₂ : GL (Fin n) A) :
    (∀ (X : Matrix (Fin m) (Fin n) A) (g : GL (Fin (m + n)) A),
      (g : Matrix (Fin (m + n)) (Fin (m + n)) A) = Matrix.reindex finSumFinEquiv finSumFinEquiv
        (Matrix.fromBlocks (g₁ : Matrix (Fin m) (Fin m) A) X 0 (g₂ : Matrix (Fin n) (Fin n) A)) →
        K1.of (m + n) g = K1.of m g₁ * K1.of n g₂) ∧
      (∀ (Y : Matrix (Fin n) (Fin m) A) (g : GL (Fin (m + n)) A),
        (g : Matrix (Fin (m + n)) (Fin (m + n)) A) = Matrix.reindex finSumFinEquiv finSumFinEquiv
          (Matrix.fromBlocks (g₁ : Matrix (Fin m) (Fin m) A) 0 Y (g₂ : Matrix (Fin n) (Fin n) A)) →
          K1.of (m + n) g = K1.of m g₁ * K1.of n g₂) ∧
      ∀ (k : ℕ) (g : GL (Fin k) A) (u : Fin k → Aˣ),
        (g : Matrix (Fin k) (Fin k) A).BlockTriangular id →
          (∀ i, (g : Matrix (Fin k) (Fin k) A) i i = u i) →
          K1.of k g = K1.of k (diagUnit u) ∧
              K1.of k (diagUnit u) = ∏ i, K1.of 1 (diagUnit ![u i]) := by
  sorry

end K1Lemmas

/-! ### `KTheoryLowDegrees:U.2/right-module-matrix-equiv` -/

section RightModule

variable {A : Type u} [Ring A]

/-- Helper: `(Fin n → A) ≃ₗ[Aᵐᵒᵖ] (Fin n → Aᵐᵒᵖ)`, `v ↦ (op (v i))ᵢ`. -/
def opFun (n : ℕ) : (Fin n → A) ≃ₗ[Aᵐᵒᵖ] (Fin n → Aᵐᵒᵖ) where
  toFun v i := MulOpposite.op (v i)
  invFun w i := (w i).unop
  map_add' := by sorry
  map_smul' := by sorry
  left_inv _ := rfl
  right_inv _ := rfl

variable (A) in
/-- **Matrices as endomorphisms of the free right module**
(`KTheoryLowDegrees:U.2/right-module-matrix-equiv`):
`Module.End Aᵐᵒᵖ (Fin n → A) ≃+* Matrix (Fin n) (Fin n) A`, `φ ↦ (φ (eⱼ) i)ᵢⱼ`, inverse
`M ↦ (v ↦ M *ᵥ v)`; multiplicative, no reversal (a real definition up to proofs). -/
def rightModuleEnd (n : ℕ) : Module.End Aᵐᵒᵖ (Fin n → A) ≃+* Matrix (Fin n) (Fin n) A where
  toFun φ := Matrix.of fun i j => φ (Pi.single j 1) i
  invFun M :=
    { toFun := fun v => M *ᵥ v
      map_add' := by sorry
      map_smul' := by sorry }
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
  map_add' := by sorry

/-- `rightModuleEnd.symm M v = M *ᵥ v`. -/
@[simp]
theorem rightModuleEnd_symm_apply {n : ℕ} (M : Matrix (Fin n) (Fin n) A) (v : Fin n → A) :
    (rightModuleEnd A n).symm M v = M *ᵥ v :=
  rfl

/-- `rightModuleEnd φ i j = φ (eⱼ) i`. -/
@[simp]
theorem rightModuleEnd_apply {n : ℕ} (φ : Module.End Aᵐᵒᵖ (Fin n → A)) (i j : Fin n) :
    rightModuleEnd A n φ i j = φ (Pi.single j 1) i :=
  rfl

variable (A) in
/-- The restriction `GL_n(A) ≃* Aut_{Aᵐᵒᵖ}(Aⁿ)` (a real definition). -/
def rightModuleAut (n : ℕ) : GL (Fin n) A ≃* ((Fin n → A) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)) :=
  (Units.mapEquiv (rightModuleEnd A n).symm.toMulEquiv).trans
    (LinearMap.GeneralLinearGroup.generalLinearEquiv Aᵐᵒᵖ (Fin n → A))

/-- For commutative `A`, `rightModuleEnd.symm` is Mathlib's `Matrix.toLin'` (column convention). -/
theorem rightModuleEnd_comm {R : Type u} [CommRing R] {n : ℕ} (M : Matrix (Fin n) (Fin n) R)
    (v : Fin n → R) : (rightModuleEnd R n).symm M v = Matrix.toLin' M v := by
  sorry

/-- `rightModuleEnd` is `LinearMap.toMatrixRight'` over `Aᵐᵒᵖ` (transported along `opFun`) followed
by `RingEquiv.mopMatrix`. -/
theorem rightModuleEnd_eq_mopMatrix {n : ℕ} (φ : Module.End Aᵐᵒᵖ (Fin n → A)) :
    rightModuleEnd A n φ =
      (RingEquiv.mopMatrix (LinearMap.toMatrixRight' ((opFun n).toLinearMap ∘ₗ φ ∘ₗ
        (opFun n).symm.toLinearMap))).unop := by
  sorry

-- test TauCeti.KTheory.rightModuleEnd_symm_elementary (computation)
example (a : A) : (rightModuleEnd A 2).symm (elementary (by decide : (0 : Fin 2) ≠ 1)
    a : Matrix _ _ A)
    (Pi.single 1 1) = Pi.single 1 1 + Pi.single 0 a := by
  rw [rightModuleEnd_symm_apply, (coe_elementary _ _).1]
  ext i
  fin_cases i <;>
    simp [Matrix.mulVec, dotProduct, Fin.sum_univ_two, Matrix.one_apply, Matrix.single_apply]

-- test TauCeti.KTheory.rightModuleEnd_zero_dim (degenerate)
example : Subsingleton (Module.End Aᵐᵒᵖ (Fin 0 → A)) ∧ Subsingleton (Matrix (Fin 0) (Fin 0) A) := by
  sorry

-- test TauCeti.KTheory.rightModuleEnd_comm_eq_toLin (compatibility)
example (M : Matrix (Fin 2) (Fin 2) ℤ) (v : Fin 2 → ℤ) :
    (rightModuleEnd ℤ 2).symm M v = Matrix.toLin' M v :=
  rightModuleEnd_comm M v

-- test TauCeti.KTheory.toMatrixRight_transpose (non-example)
/- `toMatrixRight'` of `toLin' e₀₁(1)` is the transpose `e₁₀(1)`: the row convention is not the one
used here. -/
example : LinearMap.toMatrixRight' (Matrix.toLin'
      (elementary (by decide : (0 : Fin 2) ≠ 1) (1 : ℤ) : Matrix (Fin 2) (Fin 2) ℤ)) =
      (elementary (by decide : (1 : Fin 2) ≠ 0) (1 : ℤ) : Matrix (Fin 2) (Fin 2) ℤ) ∧
    LinearMap.toMatrixRight' (Matrix.toLin'
      (elementary (by decide : (0 : Fin 2) ≠ 1) (1 : ℤ) : Matrix (Fin 2) (Fin 2) ℤ)) ≠
      (elementary (by decide : (0 : Fin 2) ≠ 1) (1 : ℤ) : Matrix (Fin 2) (Fin 2) ℤ) := by
  sorry

end RightModule

/-! ### `KTheoryLowDegrees:U.2/automorphism-class-independence`, `U.2/automorphism-class` -/

/-- Helper instance (a true fact, proof omitted): `A_A` is finitely generated over `Aᵐᵒᵖ`. -/
instance rightRegular_finite (A : Type u) [Ring A] : Module.Finite Aᵐᵒᵖ A := by
  sorry

/-- Helper instance (a true fact, proof omitted): `A_A` is projective (free of rank one) over
`Aᵐᵒᵖ`. -/
instance rightRegular_projective (A : Type u) [Ring A] : Module.Projective Aᵐᵒᵖ A := by
  sorry

/-- Helper instance (a true fact, proof omitted): `Aⁿ_A` is projective (free) over `Aᵐᵒᵖ`. -/
instance rightFree_projective (A : Type u) [Ring A] (n : ℕ) : Module.Projective Aᵐᵒᵖ (Fin n →
    A) := by
  sorry

section AutClass

variable {A : Type u} [Ring A] (P : Type u) [AddCommGroup P] [Module Aᵐᵒᵖ P]
  [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P]

/-- The class `c(Q, θ; α) := [θ ∘ (α ⊕ 1_Q) ∘ θ⁻¹] ∈ K₁(A)` of an automorphism through a
presentation `θ : P × Q ≃ Aⁿ_A` (helper, a real definition). -/
def presentationClass {P : Type u} [AddCommGroup P] [Module Aᵐᵒᵖ P] {Q : Type u} [AddCommGroup Q]
    [Module Aᵐᵒᵖ Q] {n : ℕ} (θ : (P × Q) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)) (α : P ≃ₗ[Aᵐᵒᵖ] P) : K1 A :=
  K1.of n ((rightModuleAut A n).symm
    (θ.symm.trans ((α.prodCongr (LinearEquiv.refl Aᵐᵒᵖ Q)).trans θ)))

/-- `KTheoryLowDegrees:U.2/automorphism-class-independence`: presentations exist, and
`c(Q, θ; α)` depends neither on `θ` nor on the complement `Q`; it is multiplicative in `α`. -/
theorem automorphism_class_independence :
    (∃ (Q : Type u) (_ : AddCommGroup Q) (_ : Module Aᵐᵒᵖ Q) (n : ℕ),
      Nonempty ((P × Q) ≃ₗ[Aᵐᵒᵖ] (Fin n → A))) ∧
      (∀ (Q Q' : Type u) [AddCommGroup Q] [Module Aᵐᵒᵖ Q] [AddCommGroup Q'] [Module Aᵐᵒᵖ Q']
        (n n' : ℕ) (θ : (P × Q) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)) (θ' : (P × Q') ≃ₗ[Aᵐᵒᵖ] (Fin n' → A))
        (α : P ≃ₗ[Aᵐᵒᵖ] P), presentationClass θ α = presentationClass θ' α) ∧
      ∀ (Q : Type u) [AddCommGroup Q] [Module Aᵐᵒᵖ Q] (n : ℕ)
        (θ : (P × Q) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)) (α β : P ≃ₗ[Aᵐᵒᵖ] P),
        presentationClass θ (α * β) = presentationClass θ α * presentationClass θ β ∧
          presentationClass θ 1 = 1 := by
  sorry

/-- **The K₁ class of an automorphism** (`KTheoryLowDegrees:U.2/automorphism-class`), for `P`
finitely generated projective over `Aᵐᵒᵖ` (a right `A`-module); pinned by
`autClass_eq_of_presentation`. -/
def autClass (P : Type u) [AddCommGroup P] [Module Aᵐᵒᵖ P] [Module.Finite Aᵐᵒᵖ P]
    [Module.Projective Aᵐᵒᵖ P] : (P ≃ₗ[Aᵐᵒᵖ] P) →* K1 A :=
  sorry

/-- `[1] = 1`. -/
@[simp]
theorem autClass_one : autClass P (1 : P ≃ₗ[Aᵐᵒᵖ] P) = 1 :=
  map_one _

/-- `[αβ] = [α][β]`. -/
@[simp]
theorem autClass_mul (α β : P ≃ₗ[Aᵐᵒᵖ] P) : autClass P (α * β) = autClass P α * autClass P β :=
  map_mul _ _ _

/-- Transport invariance: `[φ α φ⁻¹] = [α]`. -/
theorem autClass_conj {P' : Type u} [AddCommGroup P'] [Module Aᵐᵒᵖ P'] [Module.Finite Aᵐᵒᵖ P']
    [Module.Projective Aᵐᵒᵖ P'] (φ : P ≃ₗ[Aᵐᵒᵖ] P') (α : P ≃ₗ[Aᵐᵒᵖ] P) :
    autClass P' (φ.symm.trans (α.trans φ)) = autClass P α := by
  sorry

/-- The value through any presentation. -/
theorem autClass_eq_of_presentation {Q : Type u} [AddCommGroup Q] [Module Aᵐᵒᵖ Q] {n : ℕ}
    (θ : (P × Q) ≃ₗ[Aᵐᵒᵖ] (Fin n → A)) (α : P ≃ₗ[Aᵐᵒᵖ] P) :
    autClass P α = presentationClass θ α := by
  sorry

/-- On `Aⁿ_A`, `[v ↦ g v] = [g]`. -/
theorem autClass_free {n : ℕ} (g : GL (Fin n) A) :
    autClass (Fin n → A) (rightModuleAut A n g) = K1.of n g := by
  sorry

/-- For a basis `b` of `P`, `[α]` is the class of the matrix of `α` in `b` (column convention). -/
theorem autClass_basis {n : ℕ} (b : Module.Basis (Fin n) Aᵐᵒᵖ P) (α : P ≃ₗ[Aᵐᵒᵖ] P) :
    autClass P α = K1.of n ((rightModuleAut A n).symm
      ((b.equivFun.trans (opFun n).symm).symm.trans (α.trans (b.equivFun.trans (opFun n).symm))))
          := by
  sorry

/-- For commutative `R` and a finitely generated projective `R`-module, the class built with
`Matrix.GeneralLinearGroup.toLin`; pinned by `autClassComm_eq_of_presentation`. -/
def autClassComm {R : Type u} [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] : (M ≃ₗ[R] M) →* K1 R :=
  sorry

/-- `autClassComm` through a presentation `θ : M × Q ≃ Rⁿ` and `Matrix.GeneralLinearGroup.toLin`. -/
theorem autClassComm_eq_of_presentation {R : Type u} [CommRing R] (M : Type u) [AddCommGroup M]
    [Module R M] [Module.Finite R M] [Module.Projective R M] {Q : Type u} [AddCommGroup Q]
    [Module R Q] {n : ℕ} (θ : (M × Q) ≃ₗ[R] (Fin n → R)) (α : M ≃ₗ[R] M) :
    autClassComm M α = K1.of n (Matrix.GeneralLinearGroup.toLin.symm
      ((LinearMap.GeneralLinearGroup.generalLinearEquiv R (Fin n → R)).symm
        (θ.symm.trans ((α.prodCongr (LinearEquiv.refl R Q)).trans θ)))) := by
  sorry

/-- `autClassComm` is `autClass` of `M` viewed as a right module (through a central `Rᵐᵒᵖ`-action).
-/
theorem autClassComm_eq {R : Type u} [CommRing R] (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] [Module Rᵐᵒᵖ M] [IsCentralScalar R M]
    [Module.Finite Rᵐᵒᵖ M] [Module.Projective Rᵐᵒᵖ M] (α : M ≃ₗ[R] M) (α' : M ≃ₗ[Rᵐᵒᵖ] M)
    (hα : ∀ x, α' x = α x) : autClassComm M α = autClass M α' := by
  sorry

-- test TauCeti.KTheory.autClass_zero_module (degenerate)
example [Subsingleton P] (α : P ≃ₗ[Aᵐᵒᵖ] P) : autClass P α = 1 := by
  sorry

-- test TauCeti.KTheory.autClass_left_mul_unit (computation)
example (u : Aˣ) (α : A ≃ₗ[Aᵐᵒᵖ] A)
    (hα : ∀ x, α x = u * x) : autClass A α = K1.of 1 (diagUnit ![u]) := by
  sorry

-- test TauCeti.KTheory.autClass_swap_int (computation)
/- The swap `(x, y) ↦ (y, x)` of `ℤ²` is `w̄₁₂ · diag(-1, 1)`: its class is `[-1]`. -/
example : autClassComm (ℤ × ℤ) (LinearEquiv.prodComm ℤ ℤ ℤ) = K1.of 1 (diagUnit ![-1]) := by
  sorry

-- test TauCeti.KTheory.autClass_nonfree_det (non-example)
/- `P = ℤ × 0` (the idempotent module of `(1, 0)`) over `ℤ × ℤ`: `[-1]` goes to `([-1], 1)` under
`U.2/K1-prod`, while `LinearMap.det (-1) = 1` because `P` has no finite basis. -/
example [Module.Finite (ℤ × ℤ) (idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
      Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))]
    [Module.Projective (ℤ × ℤ) (idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
      Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))] :
    (K1.map (RingHom.fst ℤ ℤ)).prod (K1.map (RingHom.snd ℤ ℤ))
        (autClassComm (idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
          Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) (LinearEquiv.neg (ℤ × ℤ))) =
          (K1.of 1 (diagUnit ![-1]), 1) ∧
      LinearMap.det (-LinearMap.id : idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
        Matrix (Fin 1) (Fin 1) (ℤ × ℤ)) →ₗ[ℤ × ℤ] _) = 1 := by
  sorry

end AutClass

/-! ### `U.2/automorphism-class-direct-sum`, `U.2/automorphism-class-unipotent`,
`U.2/automorphism-class-exact-sequence`, `U.2/automorphism-class-filtration`,
`U.2/automorphism-class-base-change`, `U.2/automorphism-class-universal` -/

section AutClassProperties

variable {A : Type u} [Ring A] {P P' P'' : Type u} [AddCommGroup P] [Module Aᵐᵒᵖ P]
  [Module.Finite Aᵐᵒᵖ P] [Module.Projective Aᵐᵒᵖ P] [AddCommGroup P'] [Module Aᵐᵒᵖ P']
  [Module.Finite Aᵐᵒᵖ P'] [Module.Projective Aᵐᵒᵖ P'] [AddCommGroup P''] [Module Aᵐᵒᵖ P'']
  [Module.Finite Aᵐᵒᵖ P''] [Module.Projective Aᵐᵒᵖ P'']

/-- `KTheoryLowDegrees:U.2/automorphism-class-direct-sum`: `[α ⊕ β] = [α][β]`. -/
theorem automorphism_class_direct_sum (α : P ≃ₗ[Aᵐᵒᵖ] P) (β : P' ≃ₗ[Aᵐᵒᵖ] P') :
    autClass (P × P') (α.prodCongr β) = autClass P α * autClass P' β := by
  sorry

/-- The unipotent automorphism `(x', x'') ↦ (x' + γ x'', x'')` of `P' × P''` (helper). -/
def unipotentEquiv (γ : P'' →ₗ[Aᵐᵒᵖ] P') : (P' × P'') ≃ₗ[Aᵐᵒᵖ] (P' × P'') where
  toFun x := (x.1 + γ x.2, x.2)
  invFun x := (x.1 - γ x.2, x.2)
  map_add' := by sorry
  map_smul' := by sorry
  left_inv := by sorry
  right_inv := by sorry

/-- The lower unipotent automorphism `(x', x'') ↦ (x', x'' + δ x')` of `P' × P''` (helper). -/
def lowerUnipotentEquiv (δ : P' →ₗ[Aᵐᵒᵖ] P'') : (P' × P'') ≃ₗ[Aᵐᵒᵖ] (P' × P'') where
  toFun x := (x.1, x.2 + δ x.1)
  invFun x := (x.1, x.2 - δ x.1)
  map_add' := by sorry
  map_smul' := by sorry
  left_inv := by sorry
  right_inv := by sorry

/-- `KTheoryLowDegrees:U.2/automorphism-class-unipotent`: unipotent automorphisms of a direct sum
have trivial class. -/
theorem automorphism_class_unipotent (γ : P'' →ₗ[Aᵐᵒᵖ] P') (δ : P' →ₗ[Aᵐᵒᵖ] P'') :
    autClass (P' × P'') (unipotentEquiv γ) = 1 ∧
        autClass (P' × P'') (lowerUnipotentEquiv δ) = 1 := by
  sorry

/-- **Additivity along short exact sequences**
(`KTheoryLowDegrees:U.2/automorphism-class-exact-sequence`):
for `0 → P' → P → P'' → 0` exact and `α` with `α(ι P') = ι P'`, `[α] = [α'][α'']`. -/
theorem automorphism_class_exact_sequence (ι : P' →ₗ[Aᵐᵒᵖ] P) (π : P →ₗ[Aᵐᵒᵖ] P'')
    (hι : Function.Injective ι) (hexact : Function.Exact ι π) (hπ : Function.Surjective π)
    (α : P ≃ₗ[Aᵐᵒᵖ] P) (hα : (LinearMap.range ι).map α.toLinearMap = LinearMap.range ι)
    (α' : P' ≃ₗ[Aᵐᵒᵖ] P') (α'' : P'' ≃ₗ[Aᵐᵒᵖ] P'') (h' : ∀ x, ι (α' x) = α (ι x))
    (h'' : ∀ x, α'' (π x) = π (α x)) :
    autClass P α = autClass P' α' * autClass P'' α'' := by
  sorry

/-- `KTheoryLowDegrees:U.2/automorphism-class-filtration`: for a filtration `0 = F₀ ⊆ ⋯ ⊆ F_r = P`
with projective quotients `Qᵢ = Fᵢ₊₁/Fᵢ` (given with their quotient maps) and `α(Fᵢ) = Fᵢ`,
`[α] = ∏ [grᵢ α]`. -/
theorem automorphism_class_filtration {r : ℕ} (F : ℕ → Submodule Aᵐᵒᵖ P) (hF0 : F 0 = ⊥)
    (hFr : F r = ⊤) (hmono : Monotone F) (Q : Fin r → Type u) [∀ i, AddCommGroup (Q i)]
    [∀ i, Module Aᵐᵒᵖ (Q i)] [∀ i, Module.Finite Aᵐᵒᵖ (Q i)] [∀ i, Module.Projective Aᵐᵒᵖ (Q i)]
    (q : ∀ i : Fin r, F (i + 1) →ₗ[Aᵐᵒᵖ] Q i) (hq : ∀ i, Function.Surjective (q i))
    (hker : ∀ i, LinearMap.ker (q i) = (F i).comap (F (i + 1)).subtype)
    (α : P ≃ₗ[Aᵐᵒᵖ] P) (hα : ∀ i, (F i).map α.toLinearMap = F i)
    (gr : ∀ i, Q i ≃ₗ[Aᵐᵒᵖ] Q i)
    (hgr : ∀ (i : Fin r) (x : P) (hx : x ∈ F (i + 1)) (hαx : α x ∈ F (i + 1)),
      gr i (q i ⟨x, hx⟩) = q i ⟨α x, hαx⟩) :
    autClass P α = ∏ i, autClass (Q i) (gr i) := by
  sorry

/-- `KTheoryLowDegrees:U.2/automorphism-class-base-change` (general rings): with Z.1's scalar
extension along `fᵐᵒᵖ`, `[α ⊗ 1] = K1.map f [α]`. -/
theorem automorphism_class_base_change {B : Type u} [Ring B] (f : A →+* B) (α : P ≃ₗ[Aᵐᵒᵖ] P) :
    autClass (A := B) (ExtendScalars (RingHom.op f) P)
        ((ExtendScalars.functor (RingHom.op f)).mapIso α.toModuleIso).toLinearEquiv =
      K1.map f (autClass P α) := by
  sorry

/-- `KTheoryLowDegrees:U.2/automorphism-class-base-change` (commutative rings), with Mathlib's
`TensorProduct` and `LinearEquiv.baseChange`. -/
theorem automorphism_class_base_change_comm {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    (α : M ≃ₗ[R] M) :
    autClassComm (S ⊗[R] M) (α.baseChange R S M M) =
        K1.map (algebraMap R S) (autClassComm M α) := by
  sorry

/-- **Bass's universal property** (`KTheoryLowDegrees:U.2/automorphism-class-universal`): a function
`W` on pairs `(P, α)` that is multiplicative (M) and additive along exact sequences (A) factors
uniquely through `[·] : Aut(P) → K₁(A)`. -/
theorem automorphism_class_universal {G : Type*} [CommGroup G]
    (W : ∀ (P : Type u) [AddCommGroup P] [Module Aᵐᵒᵖ P] [Module.Finite Aᵐᵒᵖ P]
      [Module.Projective Aᵐᵒᵖ P], (P ≃ₗ[Aᵐᵒᵖ] P) → G)
    (hM : ∀ (P : Type u) [AddCommGroup P] [Module Aᵐᵒᵖ P] [Module.Finite Aᵐᵒᵖ P]
      [Module.Projective Aᵐᵒᵖ P] (α β : P ≃ₗ[Aᵐᵒᵖ] P), W P (α * β) = W P α * W P β)
    (hA : ∀ (P P' P'' : Type u) [AddCommGroup P] [Module Aᵐᵒᵖ P] [Module.Finite Aᵐᵒᵖ P]
      [Module.Projective Aᵐᵒᵖ P] [AddCommGroup P'] [Module Aᵐᵒᵖ P'] [Module.Finite Aᵐᵒᵖ P']
      [Module.Projective Aᵐᵒᵖ P'] [AddCommGroup P''] [Module Aᵐᵒᵖ P''] [Module.Finite Aᵐᵒᵖ P'']
      [Module.Projective Aᵐᵒᵖ P''] (ι : P' →ₗ[Aᵐᵒᵖ] P) (π : P →ₗ[Aᵐᵒᵖ] P''),
      Function.Injective ι → Function.Exact ι π → Function.Surjective π →
      ∀ (α : P ≃ₗ[Aᵐᵒᵖ] P) (α' : P' ≃ₗ[Aᵐᵒᵖ] P') (α'' : P'' ≃ₗ[Aᵐᵒᵖ] P''),
        (∀ x, ι (α' x) = α (ι x)) → (∀ x, α'' (π x) = π (α x)) → W P α = W P' α' * W P'' α'') :
    ∃! h : K1 A →* G, ∀ (P : Type u) [AddCommGroup P] [Module Aᵐᵒᵖ P] [Module.Finite Aᵐᵒᵖ P]
      [Module.Projective Aᵐᵒᵖ P] (α : P ≃ₗ[Aᵐᵒᵖ] P), W P α = h (autClass P α) := by
  sorry

end AutClassProperties

end TauCeti.KTheory

/-! ## Stage `KTheoryLowDegrees:U.3` — determinant, `SK₁`, stable range, Dieudonné

For commutative `A`: the stable determinant `K1.det : K₁(A) →* Aˣ` from Mathlib's
`Matrix.GeneralLinearGroup.det`, `SK₁ = ker det` and `K₁(A) ≅ Aˣ × SK₁(A)`. Stable range is
Bass's condition, stated as a `Prop` with its content. For division rings, the Dieudonné
determinant takes values in `Abelianization Dˣ`. -/

namespace TauCeti.KTheory

/-! ### `KTheoryLowDegrees:U.3/stable-determinant` -/

section Determinant

variable {A : Type u} [CommRing A] {B : Type v} [CommRing B]

variable (A) in
/-- The stable determinant `GL(A) →* Aˣ` (a real definition through `StableGL.lift`). -/
def StableGL.det : StableGL A →* Aˣ :=
  StableGL.lift (fun _ => Matrix.GeneralLinearGroup.det) fun _ _ h g => det_stabilise h g

variable (A) in
/-- **The determinant on `K₁`** (`KTheoryLowDegrees:U.3/stable-determinant`), for commutative `A`
(a real definition through `K1.lift`). -/
def K1.det : K1 A →* Aˣ :=
  K1.lift (StableGL.det A)

namespace K1

/-- `det [g] = det g`. -/
@[simp]
theorem det_of {n : ℕ} (g : GL (Fin n) A) :
    K1.det A (K1.of n g) = Matrix.GeneralLinearGroup.det g :=
  rfl

/-- `det (mk x) = StableGL.det x`. -/
@[simp]
theorem det_mk (x : StableGL A) : K1.det A (K1.mk x) = StableGL.det A x :=
  rfl

/-- The determinant is surjective. -/
theorem det_surjective : Function.Surjective (K1.det A) := by
  sorry

/-- Naturality: `det (K1.map f x) = Units.map f (det x)`. -/
theorem det_map (f : A →+* B) (x : K1 A) :
    K1.det B (K1.map f x) = Units.map f.toMonoidHom (K1.det A x) := by
  sorry

/-- For a finitely generated free module, `det [α] = LinearEquiv.det α`. -/
theorem det_autClassComm_free (M : Type u) [AddCommGroup M] [Module A M] [Module.Finite A M]
    [Module.Free A M] (α : M ≃ₗ[A] M) : K1.det A (autClassComm M α) = LinearEquiv.det α := by
  sorry

/-- `det [g ⊕ h] = det g · det h`. -/
@[simp]
theorem det_blockSum {m n : ℕ} (g : GL (Fin m) A) (h : GL (Fin n) A) :
    K1.det A (K1.of (m + n) (blockSum (g, h))) =
      Matrix.GeneralLinearGroup.det g * Matrix.GeneralLinearGroup.det h := by
  rw [det_of, KTheory.det_blockSum]

-- test TauCeti.KTheory.K1.det_diag_rat (computation)
example : K1.det ℚ (K1.of 2 (diagUnit ![Units.mk0 2 two_ne_zero, Units.mk0 3 three_ne_zero])) =
    Units.mk0 6 (by norm_num) := by
  rw [det_of]
  apply Units.ext
  simp only [Matrix.GeneralLinearGroup.val_det_apply, coe_diagUnit, Matrix.det_diagonal,
    Fin.prod_univ_two, Units.val_mk0]
  norm_num

-- test TauCeti.KTheory.K1.det_zero_ring (degenerate)
example [Subsingleton A] (φ : K1 A →* Aˣ) : φ = K1.det A := by
  sorry

-- test TauCeti.KTheory.K1.det_comp_of (compatibility)
example (n : ℕ) : (K1.det A).comp (K1.of n) = Matrix.GeneralLinearGroup.det :=
  rfl

-- test TauCeti.KTheory.K1.det_not_injective_circle (non-example)
/- The rotation class over `ℝ[x, y]/(x² + y² - 1)` has determinant `1` but is nontrivial. -/
example : K1.det CircleRing (K1.of 2 (Matrix.SpecialLinearGroup.toGL circleRotation)) = 1 ∧
    K1.of 2 (Matrix.SpecialLinearGroup.toGL circleRotation) ≠ 1 ∧
    ¬ Function.Injective (K1.det CircleRing) := by
  sorry

-- test TauCeti.KTheory.K1.det_ne_linearMap_det (non-example)
/- `P = ℤ × 0` over `ℤ × ℤ`: `det [-1] = (-1, 1) ≠ 1`, while `LinearMap.det (-1) = 1`. -/
example [Module.Finite (ℤ × ℤ) (idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
      Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))]
    [Module.Projective (ℤ × ℤ) (idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
      Matrix (Fin 1) (Fin 1) (ℤ × ℤ)))] :
    ((K1.det (ℤ × ℤ) (autClassComm (idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
        Matrix (Fin 1) (Fin 1) (ℤ × ℤ))) (LinearEquiv.neg (ℤ × ℤ))) : ℤ × ℤ) = (-1, 1)) ∧
      LinearMap.det (-LinearMap.id : idempotentModule (!![((1 : ℤ), (0 : ℤ))] :
        Matrix (Fin 1) (Fin 1) (ℤ × ℤ)) →ₗ[ℤ × ℤ] _) = 1 := by
  sorry

-- test TauCeti.KTheory.autClassComm_det_free (compatibility)
/- (A test of `U.2/automorphism-class`, placed after `K1.det`.) -/
example (M : Type u) [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Free A M]
    (α : M ≃ₗ[A] M) : K1.det A (autClassComm M α) = LinearEquiv.det α :=
  det_autClassComm_free M α

end K1

end Determinant

/-! ### `KTheoryLowDegrees:U.3/units-to-K1` -/

section OfUnits

variable {A : Type u} [Ring A] {B : Type v} [Ring B]

variable (A) in
/-- **Units in `K₁`** (`KTheoryLowDegrees:U.3/units-to-K1`): `u ↦ [u]`, the class of the `1 × 1`
matrix `u` (a real definition). -/
def K1.ofUnits : Aˣ →* K1 A :=
  (K1.of 1).comp (Matrix.GeneralLinearGroup.scalar (Fin 1))

namespace K1

/-- `[diag(u₁, …, uₙ)] = [u₁ ⋯ uₙ]` (in any order). -/
@[simp]
theorem ofUnits_diag {n : ℕ} (u : Fin n → Aˣ) :
    K1.of n (diagUnit u) = K1.ofUnits A (List.ofFn u).prod := by
  sorry

/-- For commutative `A`, `det [u] = u`. -/
@[simp]
theorem det_ofUnits {R : Type u} [CommRing R] (u : Rˣ) : K1.det R (K1.ofUnits R u) = u := by
  sorry

/-- For commutative `A`, `ofUnits` is injective. -/
theorem ofUnits_injective {R : Type u} [CommRing R] : Function.Injective (K1.ofUnits R) := by
  sorry

/-- Naturality of `ofUnits`. -/
theorem ofUnits_map (f : A →+* B) (u : Aˣ) :
    K1.ofUnits B (Units.map f.toMonoidHom u) = K1.map f (K1.ofUnits A u) := by
  sorry

/-- `ofUnits` kills commutators, so factors through `Abelianization Aˣ`. -/
theorem ofUnits_commutator (u v : Aˣ) :
    K1.ofUnits A (u * v * u⁻¹ * v⁻¹) = 1 ∧
      ∃ ψ : Abelianization Aˣ →* K1 A, ψ.comp Abelianization.of = K1.ofUnits A := by
  sorry

-- test TauCeti.KTheory.K1.ofUnits_neg_one_int (computation)
example : K1.ofUnits ℤ (-1) ≠ 1 := by
  intro h
  have h2 := congrArg (K1.det ℤ) h
  rw [map_one] at h2
  change Matrix.GeneralLinearGroup.det (Matrix.GeneralLinearGroup.scalar (Fin 1) (-1 : ℤˣ)) = 1
    at h2
  have h3 := congrArg (fun x : ℤˣ => (x : ℤ)) h2
  simp at h3

-- test TauCeti.KTheory.K1.ofUnits_one (degenerate)
example : K1.ofUnits A 1 = 1 :=
  map_one _

-- test TauCeti.KTheory.K1.ofUnits_eq_of_one (compatibility)
example (u : Aˣ) :
    K1.ofUnits A u = K1.of 1 (Units.map (Matrix.scalar (Fin 1) : A →+* _).toMonoidHom u) :=
  rfl

/-- Test notation: the upper triangular `2 × 2` matrices over `ZMod 2`, as a subring (the carrier is
real; the closure proofs are omitted). -/
def upperTriangularF2 : Subring (Matrix (Fin 2) (Fin 2) (ZMod 2)) where
  carrier := {M | M 1 0 = 0}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

-- test TauCeti.KTheory.K1.ofUnits_upperTriangular_trivial (non-example)
/- For `T` the upper triangular matrices over `𝔽₂` and `u = (1 1; 0 1)`: `u ≠ 1` but `[u] = 1`,
since `diag(u, 1) ∈ E₂(T)`. -/
example (u : (upperTriangularF2)ˣ)
    (hu : (((u : upperTriangularF2) : Matrix (Fin 2) (Fin 2) (ZMod 2))) = !![1, 1; 0, 1]) :
    u ≠ 1 ∧ K1.ofUnits upperTriangularF2 u = 1 := by
  sorry

end K1

end OfUnits

/-! ### `KTheoryLowDegrees:U.3/special-K1`, `U.3/K1-units-split` -/

section SK1

variable (A : Type u) [CommRing A] {B : Type v} [CommRing B]

/-- **`SK₁`** (`KTheoryLowDegrees:U.3/special-K1`): `SK1 A := ker K1.det` (a real definition). -/
def SK1 : Subgroup (K1 A) :=
  (K1.det A).ker

variable {A}

/-- `x ∈ SK₁(A) ↔ det x = 1`. -/
theorem mem_SK1_iff (x : K1 A) : x ∈ SK1 A ↔ K1.det A x = 1 :=
  MonoidHom.mem_ker

/-- `[g] ∈ SK₁(A) ↔ det g = 1`. -/
theorem of_mem_SK1_iff {n : ℕ} (g : GL (Fin n) A) :
    K1.of n g ∈ SK1 A ↔ Matrix.GeneralLinearGroup.det g = 1 :=
  MonoidHom.mem_ker

/-- `K1.map f` maps `SK₁(A)` into `SK₁(B)`: the restriction `SK1.map f` (a real definition up to the
membership proof). -/
def SK1.map (f : A →+* B) : SK1 A →* SK1 B :=
  ((K1.map f).comp (SK1 A).subtype).codRestrict (SK1 B) fun _ => by sorry

/-- `SK₁(A) = ⊥ ↔ det injective ↔ ofUnits surjective`. -/
theorem SK1_eq_bot_iff :
    (SK1 A = ⊥ ↔ Function.Injective (K1.det A)) ∧
      (Function.Injective (K1.det A) ↔ Function.Surjective (K1.ofUnits A)) := by
  sorry

-- test TauCeti.KTheory.SK1_zero_ring (degenerate)
example [Subsingleton A] : SK1 A = ⊥ := by
  sorry

-- test TauCeti.KTheory.SK1_field_eq_bot (computation)
example [Fact (Nat.Prime 7)] : SK1 (ZMod 7) = ⊥ := by
  sorry

-- test TauCeti.KTheory.SK1_int_eq_bot (compatibility)
example : SK1 ℤ = ⊥ := by
  sorry

-- test TauCeti.KTheory.SK1_circle_ne_bot (non-example)
example : SK1 CircleRing ≠ ⊥ := by
  sorry

variable (A) in
/-- The splitting `K₁(A) ≃* Aˣ × SK₁(A)`, `x ↦ (det x, x · [det x]⁻¹)`, inverse `(u, y) ↦ [u] · y`
(a real definition up to proofs; helper for `U.3/K1-units-split`). -/
def K1.unitsProdEquiv : K1 A ≃* Aˣ × SK1 A where
  toFun x := (K1.det A x, ⟨x * K1.ofUnits A (K1.det A x)⁻¹, by sorry⟩)
  invFun y := K1.ofUnits A y.1 * y.2
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

/-- **`K₁(A) = Aˣ × SK₁(A)`** (`KTheoryLowDegrees:U.3/K1-units-split`): `K1.unitsProdEquiv` is
natural in `A`. -/
theorem k1_units_split (f : A →+* B) (x : K1 A) :
    K1.unitsProdEquiv B (K1.map f x) =
      (Units.map f.toMonoidHom (K1.unitsProdEquiv A x).1,
        SK1.map f (K1.unitsProdEquiv A x).2) := by
  sorry

end SK1

/-! ### `KTheoryLowDegrees:U.3/stable-special-linear-group`, `U.3/special-linear-mod-elementary`,
`U.3/field-special-linear-eq-elementary`, `U.3/SK1-field` -/

section SpecialLinear

variable (A : Type u) [CommRing A] {B : Type v} [CommRing B]

/-- **The stable special linear group** (`KTheoryLowDegrees:U.3/stable-special-linear-group`):
`SL(A) := ker StableGL.det` (a real definition). -/
def StableGL.specialLinear : Subgroup (StableGL A) :=
  (StableGL.det A).ker

variable {A}

namespace StableGL

/-- `of_n g ∈ SL(A) ↔ det g = 1`. -/
theorem of_mem_specialLinear_iff {n : ℕ} (g : GL (Fin n) A) :
    of n g ∈ StableGL.specialLinear A ↔ Matrix.GeneralLinearGroup.det g = 1 :=
  MonoidHom.mem_ker

/-- `E(A) ≤ SL(A)`. -/
theorem elementary_le_specialLinear : StableGL.elementary A ≤ StableGL.specialLinear A := by
  sorry

/-- `SL(A)` is normal. -/
instance specialLinear_normal : (StableGL.specialLinear A).Normal :=
  MonoidHom.normal_ker _

/-- `GL(f)` maps `SL(A)` into `SL(B)`. -/
theorem map_specialLinear_le (f : A →+* B) :
    (StableGL.specialLinear A).map (map f) ≤ StableGL.specialLinear B := by
  sorry

-- test TauCeti.KTheory.StableGL.diag_inv_mem_specialLinear (computation)
example (u : Aˣ) : of 2 (diagUnit ![u, u⁻¹]) ∈ StableGL.specialLinear A := by
  change Matrix.GeneralLinearGroup.det (diagUnit ![u, u⁻¹]) = 1
  ext
  simp [Matrix.GeneralLinearGroup.val_det_apply, coe_diagUnit, Matrix.det_diagonal,
    Fin.prod_univ_two]

-- test TauCeti.KTheory.StableGL.specialLinear_zero_ring (degenerate)
example [Subsingleton A] : StableGL.specialLinear A = ⊤ := by
  sorry

-- test TauCeti.KTheory.StableGL.specialLinear_of_range_toGL (compatibility)
example (n : ℕ) : (of n) ⁻¹' (StableGL.specialLinear A : Set (StableGL A)) =
    Set.range (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin n) A →
        GL (Fin n) A) := by
  sorry

-- test TauCeti.KTheory.StableGL.elementary_ne_specialLinear_circle (non-example)
example : StableGL.elementary CircleRing ≠ StableGL.specialLinear CircleRing := by
  sorry

end StableGL

/-- `KTheoryLowDegrees:U.3/special-linear-mod-elementary`: `SL(A) ⧸ E(A) ≃* SK₁(A)`, induced by the
inclusion `SL(A) ≤ GL(A)`. -/
theorem special_linear_mod_elementary :
    ∃ e : StableGL.specialLinear A ⧸ (StableGL.elementary A).subgroupOf (StableGL.specialLinear A)
        ≃*
        SK1 A, ∀ x : StableGL.specialLinear A,
      (e (QuotientGroup.mk x) : K1 A) = K1.mk (x : StableGL A) := by
  sorry

/-- `KTheoryLowDegrees:U.3/field-special-linear-eq-elementary`: for a field, `E_n(F)` is the image
of `SL_n(F)` (Tau Ceti's `closure_range_toSpecialLinearGroup_eq_top_of_field`), i.e. `ker det`. -/
theorem field_special_linear_eq_elementary (F : Type u) [Field F] (n : Type*) [Fintype n]
    [DecidableEq n] :
    elementarySubgroup n F = (Matrix.SpecialLinearGroup.toGL (n := n) (R := F)).range ∧
      elementarySubgroup n F = (Matrix.GeneralLinearGroup.det (n := n) (R := F)).ker := by
  sorry

/-- **`SK₁` of a field vanishes** (`KTheoryLowDegrees:U.3/SK1-field`): `SL(F) = E(F)`, `SK₁(F) = ⊥`
and `det : K₁(F) ≃* Fˣ` with inverse `ofUnits`. -/
theorem sk1_field (F : Type u) [Field F] :
    StableGL.specialLinear F = StableGL.elementary F ∧ SK1 F = ⊥ ∧
      Function.Bijective (K1.det F) ∧ ∀ u : Fˣ, K1.det F (K1.ofUnits F u) = u := by
  sorry

end SpecialLinear

/-! ### Stable range: `U.3/stable-range`, `U.3/stable-range-transitive`,
`U.3/stable-range-reduction`,
`U.3/stable-range-one-special-linear`, `U.3/semilocal-unit-lemma`,
`U.3/semilocal-stable-range-one`, `U.3/SK1-semilocal`, `U.3/SK1-local` -/

section StableRange

/-- **Bass's stable range condition** (`KTheoryLowDegrees:U.3/stable-range`): `HasStableRange A n`
means that for every `m ≥ n` (so length `r = m + 1 > n`) and every left unimodular column
`(a₀, …, a_m)` (`Σ A aᵢ = A`), some `bᵢ` make `(a₀ + b₀ a_m, …, a_{m-1} + b_{m-1} a_m)` left
unimodular (a real definition: `sr(A) ≤ n`, BMS's `(7.2)_{n+1}` for `𝔮 = A`). -/
def HasStableRange (A : Type u) [Ring A] (n : ℕ) : Prop :=
  ∀ m : ℕ, n ≤ m → ∀ a : Fin (m + 1) → A, Ideal.span (Set.range a) = ⊤ →
    ∃ b : Fin m → A, Ideal.span (Set.range fun i : Fin m => a i.castSucc + b i * a (Fin.last m)) = ⊤

namespace HasStableRange

variable {A : Type u} [Ring A]

/-- Monotonicity (a real proof). -/
theorem mono {n m : ℕ} (h : HasStableRange A n) (hnm : n ≤ m) : HasStableRange A m :=
  fun k hk a ha => h k (hnm.trans hk) a ha

/-- Stable range passes to quotients by two-sided ideals (Bass, Lemma 4.1). -/
theorem quotient {n : ℕ} (I : Ideal A) [I.IsTwoSided] (h : HasStableRange A n) :
    HasStableRange (A ⧸ I) n := by
  sorry

/-- Every division ring has stable range `1`. -/
theorem of_field (D : Type u) [DivisionRing D] : HasStableRange D 1 := by
  sorry

end HasStableRange

/-- The case `r = 2` of stable range one for commutative `A`: `aA + bA = A ⇒ a + tb ∈ Aˣ`. -/
theorem hasStableRange_one_two {A : Type u} [CommRing A] (h : HasStableRange A 1) {a b : A}
    (hab : Ideal.span {a, b} = ⊤) : ∃ t : A, IsUnit (a + t * b) := by
  sorry

-- test TauCeti.KTheory.not_hasStableRange_one_int (non-example)
/- `(2, 5)` is unimodular, but no `2 + 5b` is a unit of `ℤ`. -/
example : ¬ HasStableRange ℤ 1 := by
  sorry

-- test TauCeti.KTheory.hasStableRange_one_zmod (computation)
example : HasStableRange (ZMod 6) 1 := by
  sorry

-- test TauCeti.KTheory.hasStableRange_zero_ring (degenerate)
example {A : Type u} [Ring A] [Subsingleton A] : HasStableRange A 1 := by
  sorry

-- test TauCeti.KTheory.hasStableRange_bms_index (compatibility)
/- `HasStableRange A n` is BMS's `(7.2)_{n+1}` for `𝔮 = A`: shortening for every length
`r ≥ n + 1`. -/
example {A : Type u} [Ring A] (n : ℕ) :
    HasStableRange A n ↔ ∀ (r : ℕ) (hr : n + 1 ≤ r) (a : Fin r → A), Ideal.span (Set.range a) = ⊤ →
      ∃ b : Fin (r - 1) → A, Ideal.span (Set.range fun i : Fin (r - 1) =>
        a ⟨i, by have := i.isLt; omega⟩ + b i * a ⟨r - 1, by omega⟩) = ⊤ := by
  sorry

variable {A : Type u} [Ring A]

/-- `KTheoryLowDegrees:U.3/stable-range-transitive`: in the stable range `E_r(A)` moves every left
unimodular column to `e₀` (and to `e_{r-1}`). -/
theorem stable_range_transitive {n : ℕ} (h : HasStableRange A n) (r : ℕ) (hr : n < r)
    (v : Fin r → A) (hv : Ideal.span (Set.range v) = ⊤) :
    (∃ τ ∈ elementarySubgroup (Fin r) A,
      (τ : Matrix (Fin r) (Fin r) A) *ᵥ v = Pi.single ⟨0, by omega⟩ 1) ∧
      ∃ τ ∈ elementarySubgroup (Fin r) A,
        (τ : Matrix (Fin r) (Fin r) A) *ᵥ v = Pi.single ⟨r - 1, by omega⟩ 1 := by
  sorry

/-- **Surjective stability** (`KTheoryLowDegrees:U.3/stable-range-reduction`): in the stable range
`GL_r(A) = E_r(A) · stabilise(GL_n(A))`, so `K1.of n` is onto; for `n = 1` every class is `[u]`. -/
theorem stable_range_reduction {n : ℕ} (h : HasStableRange A n) :
    (∀ (r : ℕ) (hr : n < r) (g : GL (Fin r) A), ∃ e ∈ elementarySubgroup (Fin r) A,
      ∃ g' : GL (Fin n) A, g = e * stabilise hr.le g') ∧
      Function.Surjective (K1.of (A := A) n) ∧
      (n = 1 → ∀ x : K1 A, ∃ u : Aˣ, x = K1.ofUnits A u) := by
  sorry

/-- `KTheoryLowDegrees:U.3/stable-range-one-special-linear`: for commutative `A` of stable range
one, `E_r(A) = SL_r(A)`, `SL(A) = E(A)`, `SK₁(A) = ⊥`, `det : K₁(A) ≃ Aˣ`, and every `g ∈ GL_r(A)`
is `e · diag(det g, 1, …, 1)`. -/
theorem stable_range_one_special_linear {R : Type u} [CommRing R] (h : HasStableRange R 1) :
    (∀ r : ℕ, elementarySubgroup (Fin r) R =
      (Matrix.SpecialLinearGroup.toGL (n := Fin r) (R := R)).range) ∧
      StableGL.specialLinear R = StableGL.elementary R ∧ SK1 R = ⊥ ∧
      Function.Bijective (K1.det R) ∧
      ∀ (r : ℕ) (g : GL (Fin (r + 1)) R), ∃ e ∈ elementarySubgroup (Fin (r + 1)) R,
        g = e * diagUnit (Function.update 1 0 (Matrix.GeneralLinearGroup.det g)) := by
  sorry

/-- `KTheoryLowDegrees:U.3/semilocal-unit-lemma`: in a commutative semilocal ring, `Ab + 𝔞 = A`
gives a unit `b + a` with `a ∈ 𝔞` (prime avoidance). -/
theorem semilocal_unit_lemma {R : Type u} [CommRing R] [Finite (MaximalSpectrum R)] (b : R)
    (𝔞 : Ideal R) (h : Ideal.span {b} ⊔ 𝔞 = ⊤) : ∃ a ∈ 𝔞, IsUnit (b + a) := by
  sorry

/-- `KTheoryLowDegrees:U.3/semilocal-stable-range-one`: commutative semilocal rings have stable
range one. -/
theorem semilocal_stable_range_one (R : Type u) [CommRing R] [Finite (MaximalSpectrum R)] :
    HasStableRange R 1 := by
  sorry

/-- **`SK₁` of a semilocal ring vanishes** (`KTheoryLowDegrees:U.3/SK1-semilocal`), through stable
range one. -/
theorem sk1_semilocal (R : Type u) [CommRing R] [Finite (MaximalSpectrum R)] :
    (∀ r : ℕ, elementarySubgroup (Fin r) R =
      (Matrix.SpecialLinearGroup.toGL (n := Fin r) (R := R)).range) ∧
      StableGL.specialLinear R = StableGL.elementary R ∧ SK1 R = ⊥ ∧
      Function.Bijective (K1.det R) := by
  sorry

/-- `KTheoryLowDegrees:U.3/SK1-local`: `K₁` of a commutative local ring is its unit group. -/
theorem sk1_local (R : Type u) [CommRing R] [IsLocalRing R] :
    SK1 R = ⊥ ∧ Function.Bijective (K1.det R) := by
  sorry

end StableRange

/-! ### Dieudonné: `U.3/division-ring-reduction`, `U.3/division-ring-elementary-normal`,
`U.3/dieudonne-determinant`, `U.3/dieudonne-expansion-properties`, `U.3/dieudonne-multiplicative`,
`U.3/dieudonne-kernel`, `U.3/dieudonne-block-triangular`, `U.3/dieudonne-commutator-subgroup`,
`U.3/K1-division-ring`, `U.3/no-units-valued-determinant` -/

section Dieudonne

variable {D : Type u} [DivisionRing D]

/-- `D(μ) = diag(1, …, 1, μ) ∈ GL_{n+1}(D)` (helper). -/
def lastDiag (n : ℕ) (μ : Dˣ) : GL (Fin (n + 1)) D :=
  diagUnit (Function.update 1 (Fin.last n) μ)

/-- `KTheoryLowDegrees:U.3/division-ring-reduction`: every `g ∈ GL_{n+1}(D)` is `e · D(μ)` with
`e ∈ E_{n+1}(D)` (row operations only). -/
theorem division_ring_reduction (n : ℕ) (g : GL (Fin (n + 1)) D) :
    ∃ e ∈ elementarySubgroup (Fin (n + 1)) D, ∃ μ : Dˣ, g = e * lastDiag n μ := by
  sorry

/-- `KTheoryLowDegrees:U.3/division-ring-elementary-normal`: `E_{n+1}(D)` is normal in
`GL_{n+1}(D)`,
with Dieudonné's conjugation formulas; every transvection of `Dⁿ` (Mathlib's
`LinearEquiv.transvections`, matrices through `LinearMap.toMatrixRight'`) is elementary. -/
theorem division_ring_elementary_normal (n : ℕ) :
    (elementarySubgroup (Fin (n + 1)) D).Normal ∧
      (∀ (μ : Dˣ) {i j : Fin (n + 1)} (hij : i ≠ j) (c : D), i ≠ Fin.last n → j ≠ Fin.last n →
        lastDiag n μ * elementary hij c * (lastDiag n μ)⁻¹ = elementary hij c) ∧
      (∀ (μ : Dˣ) {j : Fin (n + 1)} (hj : Fin.last n ≠ j) (c : D),
        lastDiag n μ * elementary hj c * (lastDiag n μ)⁻¹ = elementary hj ((μ : D) * c)) ∧
      (∀ (μ : Dˣ) {i : Fin (n + 1)} (hi : i ≠ Fin.last n) (c : D),
        lastDiag n μ * elementary hi c * (lastDiag n μ)⁻¹ = elementary hi (c * ((μ⁻¹ : Dˣ) : D))) ∧
      ∀ τ ∈ LinearEquiv.transvections D (Fin (n + 1) → D), ∃ g ∈ elementarySubgroup (Fin (n + 1)) D,
        (g : Matrix (Fin (n + 1)) (Fin (n + 1)) D) = LinearMap.toMatrixRight' τ.toLinearMap := by
  sorry

/-- The minor after clearing the first column with pivot row `i`: rows `k ≠ i` of
`row_k - ξ_k0 ξ_i0⁻¹ row_i`, first column deleted (a real definition, helper). -/
def pivotMinor {n : ℕ} (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) (i : Fin (n + 1)) :
    Matrix (Fin n) (Fin n) D :=
  fun k l => X (i.succAbove k) l.succ - X (i.succAbove k) 0 * (X i 0)⁻¹ * X i l.succ

open Classical in
variable (D) in
/-- The recursion of the Dieudonné determinant on matrices (Dieudonné n° 6): take the least `i` with
`ξᵢ₀ ≠ 0`, clear the first column by row operations, delete row `i` and column `0`, and multiply by
`φ((-1)ⁱ ξᵢ₀)` (0-indexed); the value on a matrix with zero first column is `1` (helper, a real
definition). -/
def dieudonneDetAux : (n : ℕ) → Matrix (Fin n) (Fin n) D → Abelianization Dˣ
  | 0, _ => 1
  | n + 1, X =>
    if h : ∃ i, X i 0 ≠ 0 then
      let i : Fin (n + 1) := (Finset.univ.filter fun i => X i 0 ≠ 0).min'
        (by obtain ⟨i, hi⟩ := h; exact ⟨i, by simp [hi]⟩)
      Abelianization.of ((-1) ^ (i : ℕ) * Units.mk0 (X i 0)
          (Finset.mem_filter.mp (Finset.min'_mem (Finset.univ.filter fun i => X i 0 ≠ 0) _)).2) *
        dieudonneDetAux n (pivotMinor X i)
    else 1

variable (D) in
/-- **The Dieudonné determinant** (`KTheoryLowDegrees:U.3/dieudonne-determinant`):
`Δₙ : GL_n(D) → Abelianization Dˣ`, the recursion `dieudonneDetAux` (a real definition; it is a
homomorphism by `U.3/dieudonne-multiplicative`). -/
def dieudonneDet (n : ℕ) (X : GL (Fin n) D) : Abelianization Dˣ :=
  dieudonneDetAux D n X

/-- `Δ₁(u) = φ(u)`. -/
@[simp]
theorem dieudonneDet_one_dim (u : Dˣ) :
    dieudonneDet D 1 (Matrix.GeneralLinearGroup.scalar (Fin 1) u) = Abelianization.of u := by
  sorry

/-- The expansion along any pivot `i` with `ξᵢ₀ ≠ 0` (`U.3/dieudonne-expansion-properties`). -/
theorem dieudonneDet_expansion {n : ℕ} (X : GL (Fin (n + 1)) D) (i : Fin (n + 1))
    (hi : (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) i 0 ≠ 0) :
    dieudonneDet D (n + 1) X = Abelianization.of ((-1) ^ (i : ℕ) * Units.mk0 _ hi) *
      dieudonneDetAux D n (pivotMinor (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) i) := by
  sorry

/-- `Δ(e X) = Δ(X)` for an elementary `e`. -/
@[simp]
theorem dieudonneDet_elementary_mul {n : ℕ} {i j : Fin n} (h : i ≠ j) (c : D) (X : GL (Fin n) D) :
    dieudonneDet D n (elementary h c * X) = dieudonneDet D n X := by
  sorry

/-- `Δ(D(μ)) = φ(μ)`. -/
@[simp]
theorem dieudonneDet_diag (n : ℕ) (μ : Dˣ) :
    dieudonneDet D (n + 1) (lastDiag n μ) = Abelianization.of μ := by
  sorry

/-- Multiplying a row on the left by `μ ≠ 0` multiplies `Δ` by `φ(μ)`. -/
theorem dieudonneDet_updateRow_smul {n : ℕ} (X Y : GL (Fin n) D) (i : Fin n) (μ : Dˣ)
    (hY : (Y : Matrix (Fin n) (Fin n) D) =
      (X : Matrix (Fin n) (Fin n) D).updateRow i fun l => (μ : D) * (X : Matrix _ _ D) i l) :
    dieudonneDet D n Y = Abelianization.of μ * dieudonneDet D n X := by
  sorry

/-- Exchanging two rows multiplies `Δ` by `φ(-1)`. -/
theorem dieudonneDet_swap_rows {n : ℕ} (X Y : GL (Fin n) D) {i j : Fin n} (hij : i ≠ j)
    (hY : (Y : Matrix (Fin n) (Fin n) D) =
        (X : Matrix (Fin n) (Fin n) D).submatrix (Equiv.swap i j) id) :
    dieudonneDet D n Y = Abelianization.of (-1) * dieudonneDet D n X := by
  sorry

/-- `Δ(X ⊕ 1) = Δ(X)` (`U.3/dieudonne-block-triangular`). -/
theorem dieudonneDet_stabilise {m n : ℕ} (h : m ≤ n) (X : GL (Fin m) D) :
    dieudonneDet D n (stabilise h X) = dieudonneDet D m X := by
  sorry

/-- For a field, `Δ` is the determinant under `Fˣab ≅ Fˣ`. -/
theorem dieudonneDet_field {F : Type u} [Field F] {n : ℕ} (X : GL (Fin n) F) :
    Abelianization.equivOfComm.symm (dieudonneDet F n X) = Matrix.GeneralLinearGroup.det X := by
  sorry

/-- For `ℍ[ℝ]`, the reduced norm `Quaternion.normSq` induces `ℍˣab ≅ ℝ_{>0}`. -/
theorem dieudonneDet_quaternion_norm :
    ∃ ν : Abelianization ℍ[ℝ]ˣ ≃* Units.posSubgroup ℝ, ∀ q : ℍ[ℝ]ˣ,
      (((ν (Abelianization.of q) : ℝˣ)) : ℝ) = Quaternion.normSq (q : ℍ[ℝ]) := by
  sorry

-- test TauCeti.KTheory.dieudonneDet_rat_two (computation)
example : dieudonneDet ℚ 2 (Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 2; 3, 4] (by norm_num)) =
    Abelianization.of (Units.mk0 (-2) (by norm_num)) := by
  sorry

-- test TauCeti.KTheory.dieudonneDet_swap (computation)
example : dieudonneDet D 2 (permGL (Equiv.swap 0 1)) = Abelianization.of (-1) ∧
    dieudonneDet ℚ 2 (permGL (Equiv.swap 0 1)) ≠ 1 := by
  sorry

-- test TauCeti.KTheory.dieudonneDet_quaternion_swap (non-example)
/- `-1 = i j i⁻¹ j⁻¹` in `ℍˣ`, so the swap has trivial Dieudonné determinant over `ℍ`, while its
determinant over a field is `-1`. -/
example : Abelianization.of (-1 : ℍ[ℝ]ˣ) = 1 ∧
    dieudonneDet ℍ[ℝ] 2 (permGL (Equiv.swap 0 1)) = 1 ∧
    Matrix.GeneralLinearGroup.det (permGL (Equiv.swap (0 : Fin 2) 1) : GL (Fin 2) ℚ) = -1 := by
  sorry

-- test TauCeti.KTheory.dieudonneDet_one_by_one (degenerate)
example (u : Dˣ) : dieudonneDet D 1 (Matrix.GeneralLinearGroup.scalar (Fin 1) u) =
    Abelianization.of u :=
  dieudonneDet_one_dim u

-- test TauCeti.KTheory.dieudonneDet_eq_det_field (compatibility)
/- Over the field with five elements (any field `F` with `5` elements). -/
example {F : Type u} [Field F] [Fintype F] (_hF : Fintype.card F = 5) (X : GL (Fin 3) F) :
    Abelianization.equivOfComm.symm (dieudonneDet F 3 X) = Matrix.GeneralLinearGroup.det X :=
  dieudonneDet_field X

/-- `KTheoryLowDegrees:U.3/dieudonne-expansion-properties`: (1°) independence of the pivot,
(2°) invariance under elementary row operations, (3°) scaling a row by `μ` multiplies `Δ` by
`φ(μ)`. -/
theorem dieudonne_expansion_properties (n : ℕ) :
    (∀ (X : GL (Fin (n + 1)) D) (i j : Fin (n + 1))
      (hi : (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) i 0 ≠ 0)
      (hj : (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) j 0 ≠ 0),
      Abelianization.of ((-1) ^ (i : ℕ) * Units.mk0 _ hi) *
          dieudonneDetAux D n (pivotMinor (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) i) =
        Abelianization.of ((-1) ^ (j : ℕ) * Units.mk0 _ hj) *
          dieudonneDetAux D n (pivotMinor (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) j)) ∧
      (∀ {i j : Fin (n + 1)} (h : i ≠ j) (c : D) (X : GL (Fin (n + 1)) D),
        dieudonneDet D (n + 1) (elementary h c * X) = dieudonneDet D (n + 1) X) ∧
      ∀ (X Y : GL (Fin (n + 1)) D) (i : Fin (n + 1)) (μ : Dˣ),
        (Y : Matrix (Fin (n + 1)) (Fin (n + 1)) D) =
            (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D).updateRow i
              (fun l => (μ : D) * (X : Matrix (Fin (n + 1)) (Fin (n + 1)) D) i l) →
          dieudonneDet D (n + 1) Y = Abelianization.of μ * dieudonneDet D (n + 1) X := by
  sorry

/-- `KTheoryLowDegrees:U.3/dieudonne-multiplicative`: `Δₙ` is a homomorphism, trivial on `Eₙ(D)`,
with `Δ(D(μ)) = φ(μ)`; for `n ≥ 1` it is surjective. -/
theorem dieudonne_multiplicative (n : ℕ) :
    (∀ X Y : GL (Fin n) D, dieudonneDet D n (X * Y) = dieudonneDet D n X * dieudonneDet D n Y) ∧
      (∀ e ∈ elementarySubgroup (Fin n) D, dieudonneDet D n e = 1) ∧
      (∀ (m : ℕ) (μ : Dˣ), dieudonneDet D (m + 1) (lastDiag m μ) = Abelianization.of μ) ∧
      Function.Surjective (dieudonneDet D (n + 1)) := by
  sorry

variable (D) in
/-- The Dieudonné determinant as a homomorphism (helper; multiplicativity from
`dieudonne_multiplicative`). -/
def dieudonneDetHom (n : ℕ) : GL (Fin n) D →* Abelianization Dˣ where
  toFun := dieudonneDet D n
  map_one' := by simpa using (dieudonne_multiplicative (D := D) n).2.1 1 (Subgroup.one_mem _)
  map_mul' := (dieudonne_multiplicative (D := D) n).1

/-- **Dieudonné's theorem** (`KTheoryLowDegrees:U.3/dieudonne-kernel`): for `n ≥ 2`,
`ker Δₙ = Eₙ(D)` and `GL_n(D) ⧸ ker Δₙ ≃* Dˣab`, without exception; for `n = 1`,
`ker Δ₁ = [Dˣ, Dˣ]`. -/
theorem dieudonne_kernel (n : ℕ) (hn : 2 ≤ n) :
    (dieudonneDetHom D n).ker = elementarySubgroup (Fin n) D ∧
      Nonempty (GL (Fin n) D ⧸ (dieudonneDetHom D n).ker ≃* Abelianization Dˣ) ∧
      (dieudonneDetHom D 1).ker =
          (commutator Dˣ).map (Matrix.GeneralLinearGroup.scalar (Fin 1)) := by
  sorry

/-- `KTheoryLowDegrees:U.3/dieudonne-block-triangular`: `Δ([[X, Y], [0, Z]]) = Δ(X) Δ(Z)`, so the
`Δₙ` are compatible with stabilisation; and the Schur complement formula. -/
theorem dieudonne_block_triangular {p q : ℕ} (X : GL (Fin p) D) (Z : GL (Fin q) D)
    (Y : Matrix (Fin p) (Fin q) D) :
    (∀ g : GL (Fin (p + q)) D, (g : Matrix (Fin (p + q)) (Fin (p + q)) D) =
        Matrix.reindex finSumFinEquiv finSumFinEquiv
          (Matrix.fromBlocks (X : Matrix (Fin p) (Fin p) D) Y 0 (Z : Matrix (Fin q) (Fin q) D)) →
        dieudonneDet D (p + q) g = dieudonneDet D p X * dieudonneDet D q Z) ∧
      (∀ (W : Matrix (Fin q) (Fin p) D) (T : Matrix (Fin q) (Fin q) D) (g : GL (Fin (p + q)) D)
        (S : GL (Fin q) D),
        (g : Matrix (Fin (p + q)) (Fin (p + q)) D) = Matrix.reindex finSumFinEquiv finSumFinEquiv
          (Matrix.fromBlocks (X : Matrix (Fin p) (Fin p) D) Y W T) →
        (S : Matrix (Fin q) (Fin q) D) =
            T - W * ((X⁻¹ : GL (Fin p) D) : Matrix (Fin p) (Fin p) D) * Y →
        dieudonneDet D (p + q) g = dieudonneDet D p X * dieudonneDet D q S) := by
  sorry

variable (D) in
/-- The stable Dieudonné determinant `GL(D) →* Dˣab` (helper; compatibility from
`dieudonneDet_stabilise`). -/
def stableDieudonneDet : StableGL D →* Abelianization Dˣ :=
  StableGL.lift (dieudonneDetHom D) fun _ _ h X => dieudonneDet_stabilise h X

/-- `KTheoryLowDegrees:U.3/dieudonne-commutator-subgroup`: for `n ≥ 2`,
`⁅GL_n(D), GL_n(D)⁆ = E_n(D)` except for `n = 2`, `D = 𝔽₂`, where the commutator subgroup has index
`2` in `E₂(𝔽₂) = GL₂(𝔽₂)`. -/
theorem dieudonne_commutator_subgroup (n : ℕ) (hn : 2 ≤ n) (hD : ¬ (n = 2 ∧ Nat.card D = 2)) :
    ⁅(⊤ : Subgroup (GL (Fin n) D)), ⊤⁆ = elementarySubgroup (Fin n) D ∧
      Subgroup.index ⁅(⊤ : Subgroup (GL (Fin 2) (ZMod 2))), (⊤ : Subgroup (GL (Fin 2) (ZMod 2)))⁆ =
        2 ∧
      elementarySubgroup (Fin 2) (ZMod 2) = ⊤ := by
  sorry

/-- **K₁ of a division ring** (`KTheoryLowDegrees:U.3/K1-division-ring`): the stable Dieudonné
determinant induces `K₁(D) ≃* Dˣab` with inverse induced by `ofUnits`; for every `n ≥ 2`,
`GL_n(D) → K₁(D)` is onto with kernel `E_n(D)`. -/
theorem k1_division_ring :
    ∃ e : K1 D ≃* Abelianization Dˣ,
      (∀ (n : ℕ) (X : GL (Fin n) D), e (K1.of n X) = dieudonneDet D n X) ∧
        (∀ u : Dˣ, e.symm (Abelianization.of u) = K1.ofUnits D u) ∧
        ∀ n : ℕ, 2 ≤ n → Function.Surjective (K1.of (A := D) n) ∧
          (K1.of (A := D) n).ker = elementarySubgroup (Fin n) D := by
  sorry

/-- `KTheoryLowDegrees:U.3/no-units-valued-determinant`: if `2 ≠ 0` in `D` and `Dˣ` is not
commutative, no homomorphism `GL₂(D) → Dˣ` sends `diag(x, 1)` to `x`. -/
theorem no_units_valued_determinant (h2 : (2 : D) ≠ 0) (hnc : ∃ x y : Dˣ, x * y ≠ y * x) :
    ¬ ∃ f : GL (Fin 2) D →* Dˣ, ∀ x : Dˣ, f (diagUnit ![x, 1]) = x := by
  sorry

end Dieudonne

/-- `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`: over `ℝ[x, y]/(x² + y² - 1)` the rotation
matrix with rows `(x, -y), (y, x)` has nontrivial class in `SK₁`, so `K₁ ≠ Aˣ` even for this
Dedekind domain (proof: the topological gap recorded in the packet). -/
theorem sk1_real_circle_nonzero :
    K1.of 2 (Matrix.SpecialLinearGroup.toGL circleRotation) ∈ SK1 CircleRing ∧
      K1.of 2 (Matrix.SpecialLinearGroup.toGL circleRotation) ≠ 1 ∧ SK1 CircleRing ≠ ⊥ := by
  sorry

end TauCeti.KTheory

/-! ## Stage `KTheoryLowDegrees:U.4` — `SK₁(O_{F,S}) = 0` (Bass–Milnor–Serre)

`S` is a finite set of finite places, `S : Set (HeightOneSpectrum (𝓞 F))`, and `O_{F,S}` is
Mathlib's `Set.integer S F`; BMS's `S_∞` is `S` together with the archimedean places. Mennicke
symbols put the second coordinate on top, `[b/a]`, as in BMS. The class-field-theoretic inputs
(Chebotarev, the ray-class Artin map, local Hilbert symbols and the power reciprocity law) are
requested from Tau Ceti roadmaps and gaps of the packet; only the proofs need them — the
statements below use Mathlib's idèles, completions and valuations. -/

open NumberField IsDedekindDomain

/-! ### `KTheoryLowDegrees:U.4/dedekind-stable-range-two` -/

namespace TauCeti.KTheory.HasStableRange

/-- `KTheoryLowDegrees:U.4/dedekind-stable-range-two`: a Dedekind domain has stable range at most
two (every unimodular column of length `≥ 3` can be shortened by multiples of its last entry). -/
theorem dedekind_stable_range_two (A : Type u) [CommRing A] [IsDedekindDomain A] :
    HasStableRange A 2 := by
  sorry

end TauCeti.KTheory.HasStableRange

/-! ### `KTheoryLowDegrees:U.4/mennicke-symbol` -/

namespace TauCeti

namespace MennickeSymbol

variable {A : Type u} [CommRing A]

/-- `W_𝔮 ⊆ A × A`: the pairs `(a, b)` with `a ≡ 1`, `b ≡ 0 (mod 𝔮)` and `aA + bA = A` (a real
definition). -/
def W (𝔮 : Ideal A) : Set (A × A) :=
  {x | x.1 - 1 ∈ 𝔮 ∧ x.2 ∈ 𝔮 ∧ IsCoprime x.1 x.2}

/-- The two elementary moves of `𝔮`-equivalence: `(a, b) ↦ (a, b + ta)` for `t ∈ 𝔮` and
`(a, b) ↦ (a + tb, b)` for `t ∈ A`. -/
inductive Move (𝔮 : Ideal A) : A × A → A × A → Prop
  | first (a b t : A) (ht : t ∈ 𝔮) : Move 𝔮 (a, b) (a, b + t * a)
  | second (a b t : A) : Move 𝔮 (a, b) (a + t * b, b)

/-- `𝔮`-equivalence `∼_𝔮`: the equivalence closure (Mathlib's `Relation.EqvGen`) of the two moves
(a real definition). -/
def QEquiv (𝔮 : Ideal A) : A × A → A × A → Prop :=
  Relation.EqvGen (Move 𝔮)

/-- The moves, hence `∼_𝔮`, preserve `W_𝔮`. -/
theorem QEquiv.mem_W {𝔮 : Ideal A} {x y : A × A} (h : QEquiv 𝔮 x y) (hx : x ∈ W 𝔮) : y ∈ W 𝔮 := by
  sorry

/-- `W_{𝔮'} ⊆ W_𝔮` for `𝔮' ≤ 𝔮` (helper). -/
theorem W_mono {𝔮 𝔮' : Ideal A} (h : 𝔮' ≤ 𝔮) : W 𝔮' ⊆ W 𝔮 :=
  fun _ hx => ⟨h hx.1, h hx.2.1, hx.2.2⟩

end MennickeSymbol

/-- **Mennicke symbols on `W_𝔮`** (`KTheoryLowDegrees:U.4/mennicke-symbol`): a function
`W_𝔮 → C`, `(a, b) ↦ [b/a]`, with MS1 (`[0/1] = 1`, invariance under `∼_𝔮`) and MS2
(`[b₁b₂/a] = [b₁/a][b₂/a]`). -/
structure MennickeSymbol (A : Type u) [CommRing A] (𝔮 : Ideal A) (C : Type v) [Group C] where
  /-- The symbol `(a, b) ↦ [b/a]`. -/
  toFun : MennickeSymbol.W 𝔮 → C
  /-- MS1: `[0/1] = 1`. -/
  map_zero_one : ∀ h : ((1 : A), (0 : A)) ∈ MennickeSymbol.W 𝔮, toFun ⟨(1, 0), h⟩ = 1
  /-- MS1: invariance under `𝔮`-equivalence. -/
  map_qEquiv : ∀ x y : MennickeSymbol.W 𝔮, MennickeSymbol.QEquiv 𝔮 x.1 y.1 → toFun x = toFun y
  /-- MS2: multiplicativity in the top entry. -/
  map_mul : ∀ (a b₁ b₂ : A) (h₁ : (a, b₁) ∈ MennickeSymbol.W 𝔮) (h₂ : (a, b₂) ∈ MennickeSymbol.W 𝔮)
    (h : (a, b₁ * b₂) ∈ MennickeSymbol.W 𝔮), toFun ⟨_, h⟩ = toFun ⟨_, h₁⟩ * toFun ⟨_, h₂⟩

namespace MennickeSymbol

variable {A : Type u} [CommRing A] {𝔮 𝔮' : Ideal A} {C : Type v} [Group C] {C' : Type w} [Group C']

/-- `∼_𝔮` is the orbit relation on columns of the subgroup of `GL₂(A)` generated by
`(1 0; t 1)`, `t ∈ 𝔮`, and `(1 t; 0 1)`, `t ∈ A`. -/
theorem qEquiv_iff_orbit (x y : A × A) :
    QEquiv 𝔮 x y ↔ ∃ g ∈ Subgroup.closure
        {g : GL (Fin 2) A | (∃ t ∈ 𝔮, g = KTheory.elementary (by decide : (1 : Fin 2) ≠ 0) t) ∨
          ∃ t : A, g = KTheory.elementary (by decide : (0 : Fin 2) ≠ 1) t},
      (g : Matrix (Fin 2) (Fin 2) A) *ᵥ ![x.1, x.2] = ![y.1, y.2] := by
  sorry

/-- Composing with a group homomorphism (a real definition up to proofs). -/
def comp (s : MennickeSymbol A 𝔮 C) (φ : C →* C') : MennickeSymbol A 𝔮 C' where
  toFun x := φ (s.toFun x)
  map_zero_one h := by rw [s.map_zero_one h, map_one]
  map_qEquiv x y h := by rw [s.map_qEquiv x y h]
  map_mul a b₁ b₂ h₁ h₂ h := by rw [s.map_mul a b₁ b₂ h₁ h₂ h, _root_.map_mul]

/-- Restriction to `W_{𝔮'}` for `𝔮' ≤ 𝔮` (a real definition up to proofs). -/
def restrict (h : 𝔮' ≤ 𝔮) (s : MennickeSymbol A 𝔮 C) : MennickeSymbol A 𝔮' C where
  toFun x := s.toFun ⟨x.1, W_mono h x.2⟩
  map_zero_one _ := s.map_zero_one _
  map_qEquiv x y hxy := by sorry
  map_mul a b₁ b₂ h₁ h₂ h' := s.map_mul a b₁ b₂ _ _ _

-- test TauCeti.MennickeSymbol.W_bot (degenerate)
example : W (⊥ : Ideal A) = {((1 : A), (0 : A))} ∧
    ∀ (s : MennickeSymbol A ⊥ C) (x : W (⊥ : Ideal A)), s.toFun x = 1 := by
  sorry

-- test TauCeti.MennickeSymbol.int_qEquiv_example (computation)
/- Over `ℤ` with `𝔮 = ℤ`: `(5, 2) ∼ (1, 2)` (`t = -2`, second move) `∼ (1, 0)` (`t = -2`, first). -/
example : QEquiv (⊤ : Ideal ℤ) (5, 2) (1, 2) ∧ QEquiv (⊤ : Ideal ℤ) (1, 2) (1, 0) := by
  constructor
  · have h := Move.second (𝔮 := (⊤ : Ideal ℤ)) 5 2 (-2)
    norm_num at h
    exact Relation.EqvGen.rel _ _ h
  · have h := Move.first (𝔮 := (⊤ : Ideal ℤ)) 1 2 (-2) Submodule.mem_top
    norm_num at h
    exact Relation.EqvGen.rel _ _ h

-- test TauCeti.MennickeSymbol.W_two_not_closed (non-example)
/- `(1, 2) ∈ W_{2ℤ}`, but the move `(1, 2) ↦ (1, 3)` with `t = 1 ∉ 2ℤ` leaves `W_{2ℤ}`. -/
example : ((1 : ℤ), (2 : ℤ)) ∈ W (Ideal.span {(2 : ℤ)}) ∧
    ((1 : ℤ), (3 : ℤ)) ∉ W (Ideal.span {(2 : ℤ)}) := by
  sorry

-- test TauCeti.MennickeSymbol.symm_top (characterisation)
example (s : MennickeSymbol A ⊤ C) (a b : A) (h₁ : (a, b) ∈ W (⊤ : Ideal A))
    (h₂ : (b, a) ∈ W (⊤ : Ideal A)) : s.toFun ⟨_, h₁⟩ = s.toFun ⟨_, h₂⟩ := by
  sorry

end MennickeSymbol

/-! ### `KTheoryLowDegrees:U.4/universal-mennicke-group` -/

namespace MennickeGroup

variable {A : Type u} [CommRing A]

/-- The relations of the universal Mennicke group: `⟨1, 0⟩ = 1`, `⟨x⟩ = ⟨y⟩` for `x ∼_𝔮 y`, and
`⟨a, b₁b₂⟩ = ⟨a, b₁⟩⟨a, b₂⟩`. -/
def rels (𝔮 : Ideal A) : Set (FreeGroup (MennickeSymbol.W 𝔮)) :=
  {r | ∃ h : ((1 : A), (0 : A)) ∈ MennickeSymbol.W 𝔮, r = FreeGroup.of ⟨_, h⟩} ∪
  {r | ∃ x y : MennickeSymbol.W 𝔮, MennickeSymbol.QEquiv 𝔮 x.1 y.1 ∧
    r = FreeGroup.of x * (FreeGroup.of y)⁻¹} ∪
  {r | ∃ (a b₁ b₂ : A) (h₁ : (a, b₁) ∈ MennickeSymbol.W 𝔮) (h₂ : (a, b₂) ∈ MennickeSymbol.W 𝔮)
    (h : (a, b₁ * b₂) ∈ MennickeSymbol.W 𝔮),
    r = FreeGroup.of ⟨_, h⟩ * (FreeGroup.of ⟨_, h₂⟩)⁻¹ * (FreeGroup.of ⟨_, h₁⟩)⁻¹}

end MennickeGroup

/-- **The universal Mennicke group** `C_𝔮` (`KTheoryLowDegrees:U.4/universal-mennicke-group`):
Mathlib's `PresentedGroup` on `W_𝔮` with the relations MS1, MS2 (a real definition). -/
def MennickeGroup {A : Type u} [CommRing A] (𝔮 : Ideal A) : Type u :=
  PresentedGroup (MennickeGroup.rels 𝔮)

namespace MennickeGroup

variable {A : Type u} [CommRing A] {𝔮 𝔮' : Ideal A} {C : Type v} [Group C]

instance instGroup (𝔮 : Ideal A) : Group (MennickeGroup 𝔮) :=
  inferInstanceAs (Group (PresentedGroup (rels 𝔮)))

variable (𝔮) in
/-- The universal symbol `(a, b) ↦ ⟨a, b⟩`. -/
def symbol (x : MennickeSymbol.W 𝔮) : MennickeGroup 𝔮 :=
  PresentedGroup.of x

variable (𝔮) in
/-- The universal symbol is a Mennicke symbol (MS1, MS2). -/
def symbol_isMennicke : MennickeSymbol A 𝔮 (MennickeGroup 𝔮) where
  toFun := symbol 𝔮
  map_zero_one := by sorry
  map_qEquiv := by sorry
  map_mul := by sorry

/-- The universal property: a Mennicke symbol `s` induces `C_𝔮 →* C` (a real definition through
`PresentedGroup.toGroup`). -/
def lift (s : MennickeSymbol A 𝔮 C) : MennickeGroup 𝔮 →* C :=
  PresentedGroup.toGroup (f := s.toFun) (by sorry)

/-- `lift s ∘ symbol = s`. -/
@[simp]
theorem lift_symbol (s : MennickeSymbol A 𝔮 C) (x : MennickeSymbol.W 𝔮) :
    lift s (symbol 𝔮 x) = s.toFun x := by
  sorry

/-- Homomorphisms out of `C_𝔮` agreeing on the symbols are equal. -/
theorem hom_ext {f g : MennickeGroup 𝔮 →* C} (h : ∀ x, f (symbol 𝔮 x) = g (symbol 𝔮 x)) :
    f = g := by
  sorry

/-- The homomorphism `C_{𝔮'} →* C_𝔮` of BMS (2.6), for `𝔮' ≤ 𝔮` (a real definition). -/
def restrictHom (h : 𝔮' ≤ 𝔮) : MennickeGroup 𝔮' →* MennickeGroup 𝔮 :=
  lift ((symbol_isMennicke 𝔮).restrict h)

/-- `restrictHom` is surjective for `A` Dedekind and `𝔮' ≠ ⊥`. -/
theorem restrictHom_surjective [IsDedekindDomain A] (h : 𝔮' ≤ 𝔮) (h' : 𝔮' ≠ ⊥) :
    Function.Surjective (restrictHom h) := by
  sorry

-- test TauCeti.MennickeGroup.bot_trivial (degenerate)
example : Subsingleton (MennickeGroup (⊥ : Ideal A)) := by
  sorry

-- test TauCeti.MennickeGroup.int_top_trivial (computation)
example : Subsingleton (MennickeGroup (⊤ : Ideal ℤ)) := by
  sorry

-- test TauCeti.MennickeGroup.trivial_iff (characterisation)
example : Subsingleton (MennickeGroup 𝔮) ↔
    ∀ (C : Type u) [Group C] (s : MennickeSymbol A 𝔮 C) (x : MennickeSymbol.W 𝔮), s.toFun x =
        1 := by
  sorry

-- test TauCeti.MennickeGroup.real_circle_nontrivial (non-example)
example : Nontrivial (MennickeGroup (⊤ : Ideal KTheory.CircleRing)) := by
  sorry

end MennickeGroup

/-! ### Lemmas of BMS § 2: `U.4/q-equivalence-to-base-point`, `U.4/q-equivalence-smaller-ideal`,
`U.4/q-equivalence-ring-of-fractions`, `U.4/mennicke-newman-common-entry`,
`U.4/mennicke-symbol-residue-map`, `U.4/mennicke-symbol-residue-homomorphism` -/

namespace MennickeSymbol

variable {A : Type u} [CommRing A] {𝔮 : Ideal A} {C : Type v} [Group C]

/-- `KTheoryLowDegrees:U.4/q-equivalence-to-base-point` (BMS Lemma 2.2): `(a, b) ∼ (a, b(1 - a))`,
and `(a, b) ∼ (1, 0)` if `a` is congruent to a unit mod `b` or `b` to a unit mod `a`. -/
theorem q_equivalence_to_base_point {a b : A} (h : (a, b) ∈ W 𝔮) :
    QEquiv 𝔮 (a, b) (a, b * (1 - a)) ∧
      ((∃ u : Aˣ, a - u ∈ Ideal.span {b}) ∨ (∃ u : Aˣ, b - u ∈ Ideal.span {a}) →
        QEquiv 𝔮 (a, b) (1, 0)) := by
  sorry

/-- `KTheoryLowDegrees:U.4/q-equivalence-smaller-ideal` (BMS Lemma 2.3): for `A` Dedekind and
nonzero `𝔮' ≤ 𝔮`, every element of `W_𝔮` is `𝔮`-equivalent to one of `W_{𝔮'}`. -/
theorem q_equivalence_smaller_ideal [IsDedekindDomain A] {𝔮' : Ideal A} (h : 𝔮' ≤ 𝔮)
    (h' : 𝔮' ≠ ⊥) {x : A × A} (hx : x ∈ W 𝔮) : ∃ y ∈ W 𝔮', QEquiv 𝔮 x y := by
  sorry

/-- `KTheoryLowDegrees:U.4/q-equivalence-ring-of-fractions` (BMS Lemma 2.1): for a ring of fractions
`A' = M⁻¹A` of a Dedekind domain and `𝔮' ≠ 0`, every element of `W_{𝔮'}` is `𝔮'`-equivalent to the
image of an element of `W_{𝔮' ∩ A}`. -/
theorem q_equivalence_ring_of_fractions [IsDedekindDomain A] (M : Submonoid A)
    (hM : M ≤ nonZeroDivisors A) (A' : Type u) [CommRing A'] [Algebra A A'] [IsLocalization M A']
    (𝔮' : Ideal A') (h' : 𝔮' ≠ ⊥) {x : A' × A'} (hx : x ∈ W 𝔮') :
    ∃ a b : A, (a, b) ∈ W (𝔮'.comap (algebraMap A A')) ∧
      QEquiv 𝔮' x (algebraMap A A' a, algebraMap A A' b) := by
  sorry

/-- `KTheoryLowDegrees:U.4/mennicke-newman-common-entry` (BMS Lemma 2.4): finitely many elements of
`W_𝔮` are `𝔮`-equivalent to elements with a common first entry. -/
theorem mennicke_newman_common_entry [IsDedekindDomain A] (h𝔮 : 𝔮 ≠ ⊥) {k : ℕ}
    (x : Fin k → A × A) (hx : ∀ i, x i ∈ W 𝔮) :
    ∃ (a : A) (c : Fin k → A), ∀ i, (a, c i) ∈ W 𝔮 ∧ QEquiv 𝔮 (a, c i) (x i) := by
  sorry

/-- `KTheoryLowDegrees:U.4/mennicke-symbol-residue-map` (BMS Lemma 2.7), for a function `s`
satisfying MS1: (a) triviality near units; (b) moving into a smaller `W_{𝔮'}`; (c) the map
`U(A/aA) → C`, `b ↦ [bq/a]`, trivial on `U(A)`; (d) finitely many symbols lie in one image of (c),
with `a` free in a progression `a + tcq`. -/
theorem mennicke_symbol_residue_map [IsDedekindDomain A] (h𝔮 : 𝔮 ≠ ⊥) (s : W 𝔮 → C)
    (h0 : ∀ h : ((1 : A), (0 : A)) ∈ W 𝔮, s ⟨_, h⟩ = 1)
    (hq : ∀ x y : W 𝔮, QEquiv 𝔮 x.1 y.1 → s x = s y) :
    (∀ x : W 𝔮, ((∃ u : Aˣ, x.1.1 - u ∈ Ideal.span {x.1.2}) ∨
      (∃ u : Aˣ, x.1.2 - u ∈ Ideal.span {x.1.1})) → s x = 1) ∧
    (∀ 𝔮' : Ideal A, 𝔮' ≤ 𝔮 → 𝔮' ≠ ⊥ → ∀ x : W 𝔮, ∃ y ∈ W 𝔮', ∃ hy : y ∈ W 𝔮, s x = s ⟨y, hy⟩) ∧
    (∀ a q : A, q ∈ 𝔮 → a - 1 ∈ 𝔮 →
      ∃ ψ : (A ⧸ Ideal.span {a})ˣ → C,
        (∀ (b : A) (u : (A ⧸ Ideal.span {a})ˣ), (u : A ⧸ Ideal.span {a}) = Ideal.Quotient.mk _ b →
          ∀ h : (a, b * q) ∈ W 𝔮, ψ u = s ⟨_, h⟩) ∧
        ∀ u : Aˣ, ψ (Units.map (Ideal.Quotient.mk (Ideal.span {a})).toMonoidHom u) = 1) ∧
    ∀ {k : ℕ} (x : Fin k → W 𝔮), ∃ a q c : A, q ∈ 𝔮 ∧ a - 1 ∈ 𝔮 ∧ IsCoprime c a ∧
      ∀ (t : A) (i : Fin k), ∃ (b : A) (h : (a + t * c * q, b * q) ∈ W 𝔮), s (x i) = s ⟨_, h⟩ := by
  sorry

/-- `KTheoryLowDegrees:U.4/mennicke-symbol-residue-homomorphism` (BMS Lemma 2.9): for a Mennicke
symbol the maps (2.8) are homomorphisms, and the image of `W_𝔮` is abelian. -/
theorem mennicke_symbol_residue_homomorphism [IsDedekindDomain A] (h𝔮 : 𝔮 ≠ ⊥)
    (s : MennickeSymbol A 𝔮 C) :
    (∀ a q : A, q ∈ 𝔮 → a - 1 ∈ 𝔮 →
      ∃ ψ : (A ⧸ Ideal.span {a})ˣ →* C,
        ∀ (b : A) (u : (A ⧸ Ideal.span {a})ˣ), (u : A ⧸ Ideal.span {a}) = Ideal.Quotient.mk _ b →
          ∀ h : (a, b * q) ∈ W 𝔮, ψ u = s.toFun ⟨_, h⟩) ∧
      ∀ x y : W 𝔮, Commute (s.toFun x) (s.toFun y) := by
  sorry

end MennickeSymbol

/-! ### `KTheoryLowDegrees:U.4/sk1-mennicke-symbol`, `U.4/sk1-generated-by-mennicke-symbols` -/

namespace MennickeSymbol

open KTheory

variable {A : Type u} [CommRing A] {B : Type u} [CommRing B] {C : Type v} [Group C]

/-- The Mennicke symbol attached to an `E_n(A)`-conjugation-invariant `κ : SL_n(A) →* C`, `n ≥ 3`:
`[b/a] = κ(diag(σ, 1))` for any `σ ∈ SL₂(A)` with first row `(a, b)` (BMS Theorem 5.4; data, pinned
by `ofSLHom_apply`). -/
def ofSLHom {n : ℕ} (hn : 3 ≤ n) (κ : Matrix.SpecialLinearGroup (Fin n) A →* C)
    (hκ : ∀ τ σ : Matrix.SpecialLinearGroup (Fin n) A,
      Matrix.SpecialLinearGroup.toGL τ ∈ elementarySubgroup (Fin n) A → κ (τ * σ * τ⁻¹) = κ σ) :
    MennickeSymbol A ⊤ C :=
  sorry

/-- The value of `ofSLHom`. -/
theorem ofSLHom_apply {n : ℕ} (hn : 3 ≤ n) (κ : Matrix.SpecialLinearGroup (Fin n) A →* C)
    (hκ : ∀ τ σ : Matrix.SpecialLinearGroup (Fin n) A,
      Matrix.SpecialLinearGroup.toGL τ ∈ elementarySubgroup (Fin n) A → κ (τ * σ * τ⁻¹) = κ σ)
    {a b : A} (hx : (a, b) ∈ W (⊤ : Ideal A)) (σ : Matrix.SpecialLinearGroup (Fin 2) A)
    (hσ : σ 0 0 = a ∧ σ 0 1 = b) (τ : Matrix.SpecialLinearGroup (Fin n) A)
    (hτ : Matrix.SpecialLinearGroup.toGL τ =
      stabilise (by omega : 2 ≤ n) (Matrix.SpecialLinearGroup.toGL σ)) :
    (ofSLHom hn κ hκ).toFun ⟨(a, b), hx⟩ = κ τ := by
  sorry

variable (A) in
/-- **Mennicke's theorem** (`KTheoryLowDegrees:U.4/sk1-mennicke-symbol`): the `SK₁`-valued Mennicke
symbol `[b/a]` = the class of any `σ ∈ SL₂(A)` with first row `(a, b)` (data, pinned by
`sk1_apply`). -/
def sk1 : MennickeSymbol A ⊤ (SK1 A) :=
  sorry

/-- `sk1 (a, b)` is the class of any `σ ∈ SL₂(A)` with first row `(a, b)`. -/
theorem sk1_apply {a b : A} (hx : (a, b) ∈ W (⊤ : Ideal A)) (σ : Matrix.SpecialLinearGroup (Fin 2)
    A)
    (hσ : σ 0 0 = a ∧ σ 0 1 = b) :
    ((sk1 A).toFun ⟨(a, b), hx⟩ : K1 A) = K1.of 2 (Matrix.SpecialLinearGroup.toGL σ) := by
  sorry

/-- Symmetry `[b/a] = [a/b]`. -/
theorem sk1_symm {a b : A} (hx : (a, b) ∈ W (⊤ : Ideal A)) (hy : (b, a) ∈ W (⊤ : Ideal A)) :
    (sk1 A).toFun ⟨_, hx⟩ = (sk1 A).toFun ⟨_, hy⟩ := by
  sorry

/-- Naturality: `SK₁(f)[b/a] = [f b/f a]`. -/
theorem sk1_map (f : A →+* B) {a b : A} (hx : (a, b) ∈ W (⊤ : Ideal A))
    (hy : (f a, f b) ∈ W (⊤ : Ideal B)) :
    SK1.map f ((sk1 A).toFun ⟨_, hx⟩) = (sk1 B).toFun ⟨_, hy⟩ := by
  sorry

/-- `[b/a] = 1` when `a` or `b` is a unit. -/
@[simp]
theorem sk1_of_isUnit {a b : A} (hx : (a, b) ∈ W (⊤ : Ideal A)) (h : IsUnit a ∨ IsUnit b) :
    (sk1 A).toFun ⟨_, hx⟩ = 1 := by
  sorry

-- test TauCeti.MennickeSymbol.sk1_one (degenerate)
example (b : A) (hx : ((1 : A), b) ∈ W (⊤ : Ideal A)) : (sk1 A).toFun ⟨_, hx⟩ = 1 :=
  sk1_of_isUnit hx (Or.inl isUnit_one)

-- test TauCeti.MennickeSymbol.sk1_int (computation)
example (x : W (⊤ : Ideal ℤ)) : (sk1 ℤ).toFun x = 1 := by
  sorry

-- test TauCeti.MennickeSymbol.sk1_unit (characterisation)
example (a : Aˣ) (b : A) (hx : ((a : A), b) ∈ W (⊤ : Ideal A)) : (sk1 A).toFun ⟨_, hx⟩ = 1 :=
  sk1_of_isUnit hx (Or.inl a.isUnit)

-- test TauCeti.MennickeSymbol.sk1_eq_kbook (compatibility)
/- For `ru - st = 1`, `sk1 (r, s)` is the class of `(r s; t u)`, the K-book's `[s/r]`. -/
example (r s t u : A) (h : r * u - s * t = 1) (hx : (r, s) ∈ W (⊤ : Ideal A)) :
    ((sk1 A).toFun ⟨_, hx⟩ : K1 A) =
      K1.of 2 (Matrix.SpecialLinearGroup.toGL ⟨!![r, s; t,
          u], by rw [Matrix.det_fin_two_of]; exact h⟩) :=
  sk1_apply hx _ ⟨rfl, rfl⟩

-- test TauCeti.MennickeSymbol.sk1_real_circle (non-example)
example (hx : (circleX, circleY) ∈ W (⊤ : Ideal CircleRing)) :
    (sk1 CircleRing).toFun ⟨_, hx⟩ ≠ 1 := by
  sorry

-- test TauCeti.MennickeGroup.lift_sk1 (compatibility)
/- (A test of `U.4/universal-mennicke-group`, placed after `sk1`.) -/
example [IsDedekindDomain A] : Function.Surjective (MennickeGroup.lift (sk1 A)) := by
  sorry

/-- `KTheoryLowDegrees:U.4/sk1-generated-by-mennicke-symbols`: for stable range `≤ 2` the lift
`C_A → SK₁(A)` of the `SK₁`-valued symbol is surjective; so `SK₁(A) = 0` if `C_A = 1`. -/
theorem sk1_generated_by_mennicke_symbols (h : HasStableRange A 2) :
    Function.Surjective (MennickeGroup.lift (sk1 A)) ∧
      (Subsingleton (MennickeGroup (⊤ : Ideal A)) → SK1 A = ⊥) := by
  sorry

end MennickeSymbol

/-! ### Rings of `S`-integers: `U.4/s-integers-ring-of-fractions` and the arithmetic inputs
`U.4/idelic-density-theorem`, `U.4/primes-with-norm-not-one`,
`U.4/dirichlet-theorem-arithmetic-type`,
`U.4/dirichlet-theorem-number-field` -/

namespace NumberField

variable (F : Type) [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))

/-- `KTheoryLowDegrees:U.4/s-integers-ring-of-fractions`: `O_{F,S} = 𝓞_F[1/s]` for a nonzero `s`
whose prime divisors are exactly the primes of `S`; more generally `O_{F,S'} = O_{F,S}[1/s']` for
`S ⊆ S'`. -/
theorem s_integers_ring_of_fractions (hS : S.Finite) :
    (∃ s : 𝓞 F, s ≠ 0 ∧ (∀ v : HeightOneSpectrum (𝓞 F), s ∈ v.asIdeal ↔ v ∈ S) ∧
      IsLocalization.Away s (S.integer F)) ∧
      ∀ (S' : Set (HeightOneSpectrum (𝓞 F))), S'.Finite → S ⊆ S' →
        ∀ hle : S.integer F ≤ S'.integer F, ∃ s' : S.integer F,
          @IsLocalization.Away _ _ s' (S'.integer F) _
            (Subalgebra.inclusion hle).toRingHom.toAlgebra := by
  sorry

/-- `KTheoryLowDegrees:U.4/idelic-density-theorem` (BMS (A.7)): if `V` is an open subgroup of finite
index in the idèle class group (Mathlib's `IdeleClassGroup`), every coset of `C/V` contains the
classes of prime idèles `ofAdicCompletion 𝔭 π` (`π` a uniformiser) at infinitely many finite primes.
(Proof inputs: the ray-class Artin map and Chebotarev, requested from Tau Ceti.) -/
theorem idelic_density_theorem (V : Subgroup (IdeleClassGroup (𝓞 F) F))
    (hV : IsOpen (V : Set (IdeleClassGroup (𝓞 F) F))) [V.FiniteIndex]
    (c : IdeleClassGroup (𝓞 F) F) :
    Set.Infinite {𝔭 : HeightOneSpectrum (𝓞 F) | ∃ π : (𝔭.adicCompletion F)ˣ,
      Valued.v (π : 𝔭.adicCompletion F) = WithZero.exp (-1 : ℤ) ∧
        c⁻¹ * IdeleClassGroup.ofAdicCompletion (𝓞 F) F 𝔭 π ∈ V} := by
  sorry

/-- `KTheoryLowDegrees:U.4/primes-with-norm-not-one` (BMS (A.8)): if `F` has no primitive `m`-th
root of unity, infinitely many primes `𝔭 ∤ m` have `N𝔭 ≢ 1 (mod m)`. (Proof inputs: Chebotarev and
the cyclotomic Frobenius, requested from Tau Ceti.) -/
theorem primes_with_norm_not_one (m : ℕ) (hm : 2 ≤ m) (h : ¬ ∃ ζ : F, IsPrimitiveRoot ζ m) :
    Set.Infinite {𝔭 : Ideal (𝓞 F) | 𝔭.IsMaximal ∧ (m : 𝓞 F) ∉ 𝔭 ∧
      ¬ Ideal.absNorm 𝔭 ≡ 1 [MOD m]} := by
  sorry

/-- **Dirichlet's theorem for arithmetic Dedekind rings**
(`KTheoryLowDegrees:U.4/dirichlet-theorem-arithmetic-type`,
BMS (A.10)): for `a, b ∈ O_{F,S}` nonzero coprime, a finite set `S₀` of primes outside `S` prime to
`b`, open subgroups `V_𝔭` and elements `x_𝔭` of `F_𝔭ˣ` at `𝔭 ∈ S₀ ∪ S_∞` (with `ord_𝔭 x_𝔭 = e_𝔭 ≥ 0`
on `S₀`, and some `V_𝔭`, `𝔭 ∈ S_∞`, of finite index), infinitely many primes `𝔭₀ ∉ S₀ ∪ S` admit
`c ≡ a (mod b)` with `c ∈ x_𝔭 V_𝔭` on `S₀ ∪ S_∞` and `cA = 𝔭₀ ∏ 𝔭^{e_𝔭}` (read on valuations). -/
theorem dirichlet_theorem_arithmetic_type (a b : S.integer F) (ha : a ≠ 0) (hb : b ≠ 0)
    (hab : IsCoprime a b) (S₀ : Finset (HeightOneSpectrum (𝓞 F)))
    (hS₀ : ∀ 𝔭 ∈ S₀, 𝔭 ∉ S ∧ 𝔭.valuation F (b : F) = 1)
    (Vf : ∀ 𝔭 : HeightOneSpectrum (𝓞 F), Subgroup (𝔭.adicCompletion F)ˣ)
    (hVf : ∀ 𝔭, IsOpen (Vf 𝔭 : Set (𝔭.adicCompletion F)ˣ))
    (xf : ∀ 𝔭 : HeightOneSpectrum (𝓞 F), (𝔭.adicCompletion F)ˣ) (e : HeightOneSpectrum (𝓞 F) → ℕ)
    (he : ∀ 𝔭 ∈ S₀, Valued.v (xf 𝔭 : 𝔭.adicCompletion F) = WithZero.exp (-(e 𝔭 : ℤ)))
    (Vi : ∀ w : InfinitePlace F, Subgroup w.Completionˣ)
    (hVi : ∀ w, IsOpen (Vi w : Set w.Completionˣ)) (xi : ∀ w : InfinitePlace F, w.Completionˣ)
    (hfin : (∃ w, (Vi w).FiniteIndex) ∨ ∃ 𝔭 ∈ S, (Vf 𝔭).FiniteIndex) :
    Set.Infinite {𝔭₀ : HeightOneSpectrum (𝓞 F) | 𝔭₀ ∉ S ∧ 𝔭₀ ∉ S₀ ∧
      ∃ (c : S.integer F) (hc : (c : F) ≠ 0), c - a ∈ Ideal.span {b} ∧
        (∀ 𝔭, 𝔭 ∈ S₀ ∨ 𝔭 ∈ S →
          (xf 𝔭)⁻¹ * Units.mk0 (algebraMap F (𝔭.adicCompletion F) c) ((map_ne_zero _).mpr hc) ∈
            Vf 𝔭) ∧
        (∀ w : InfinitePlace F,
          (xi w)⁻¹ * Units.mk0 (algebraMap F w.Completion c) ((map_ne_zero _).mpr hc) ∈ Vi w) ∧
        𝔭₀.valuation F c = WithZero.exp (-1 : ℤ) ∧
        (∀ 𝔭 ∈ S₀, 𝔭.valuation F c = WithZero.exp (-(e 𝔭 : ℤ))) ∧
        ∀ 𝔭, 𝔭 ∉ S → 𝔭 ≠ 𝔭₀ → 𝔭 ∉ S₀ → 𝔭.valuation F c = 1} := by
  sorry

/-- `KTheoryLowDegrees:U.4/dirichlet-theorem-number-field` (BMS (A.11)): for `a, b ∈ O_{F,S}`
nonzero and `𝔞 ≠ 0` with `aA + bA = A = 𝔞 + bA`, infinitely many primes `𝔭₀` of `A` have `𝔭₀𝔞 = cA`
for some `c ≡ a (mod b)` with prescribed signs at the real places. -/
theorem dirichlet_theorem_number_field (a b : S.integer F) (ha : a ≠ 0) (hb : b ≠ 0)
    (𝔞 : Ideal (S.integer F)) (h𝔞 : 𝔞 ≠ ⊥) (hab : IsCoprime a b)
    (h𝔞b : 𝔞 ⊔ Ideal.span {b} = ⊤) (pos : {w : InfinitePlace F // w.IsReal} → Bool) :
    Set.Infinite {𝔭₀ : Ideal (S.integer F) | 𝔭₀.IsMaximal ∧ ∃ c : S.integer F,
      c - a ∈ Ideal.span {b} ∧ 𝔭₀ * 𝔞 = Ideal.span {c} ∧
        ∀ w : {w : InfinitePlace F // w.IsReal},
          (0 < InfinitePlace.embedding_of_isReal w.2 (c : F) ↔ pos w = true)} := by
  sorry

end NumberField

/-! ### BMS § 3: `U.4/prime-choice`, `U.4/power-reduction-non-totally-imaginary`,
`U.4/power-reduction-totally-imaginary`, `U.4/power-reduction`, `U.4/mennicke-group-locally-cyclic`,
`U.4/mennicke-group-exponent`, `U.4/arithmetic-mennicke-symbols-trivial` -/

namespace MennickeSymbol

variable (F : Type) [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))

open Classical in
/-- `ord_𝔭(I)`, the exponent of `𝔭` in the ideal `I` of `𝓞_F` (helper, a real definition). -/
def ordAt (𝔭 : HeightOneSpectrum (𝓞 F)) (I : Ideal (𝓞 F)) : ℕ :=
  (UniqueFactorizationMonoid.normalizedFactors I).count 𝔭.asIdeal

/-- BMS's `j_p(𝔮) = min_{𝔭 | p} [ord_𝔭(𝔮)/ord_𝔭(p) - 1/(p - 1)]_{[0,n]}` (helper, a real
definition; `[x]_{[0,n]} = min(n, max(0, ⌊x⌋))`). -/
def jIndex (p n : ℕ) (𝔮 : Ideal (𝓞 F)) : ℕ :=
  ⨅ (𝔭 : HeightOneSpectrum (𝓞 F)) (_ : (p : 𝓞 F) ∈ 𝔭.asIdeal),
    min n (⌊(ordAt F 𝔭 𝔮 : ℚ) / ordAt F 𝔭 (Ideal.span {(p : 𝓞 F)}) - 1 / ((p : ℚ) - 1)⌋).toNat

/-- `n` is maximal with `μ_{pⁿ} ⊂ F` (helper). -/
def IsMaxRootsExponent (p n : ℕ) : Prop :=
  (∃ ζ : F, IsPrimitiveRoot ζ (p ^ n)) ∧ ¬ ∃ ζ : F, IsPrimitiveRoot ζ (p ^ (n + 1))

/-- `KTheoryLowDegrees:U.4/prime-choice` (BMS Theorem 3.2): every `(a, b) ∈ W_𝔮` is `𝔮`-equivalent
to some `(a₁, b₁)` with `a₁A = 𝔭₁𝔭₂`, distinct primes prime to `p`, with `N𝔭ᵢ ≢ 1 (mod p^{n+1})`. -/
theorem prime_choice (𝔮 : Ideal (S.integer F)) (h𝔮 : 𝔮 ≠ ⊥) (p : ℕ) [Fact p.Prime] (n : ℕ)
    (hn : IsMaxRootsExponent F p n) {x : S.integer F × S.integer F} (hx : x ∈ W 𝔮) :
    ∃ y ∈ W 𝔮, QEquiv 𝔮 x y ∧ ∃ 𝔭₁ 𝔭₂ : Ideal (S.integer F), 𝔭₁.IsMaximal ∧ 𝔭₂.IsMaximal ∧
      𝔭₁ ≠ 𝔭₂ ∧ Ideal.span {y.1} = 𝔭₁ * 𝔭₂ ∧ (p : S.integer F) ∉ 𝔭₁ ∧ (p : S.integer F) ∉ 𝔭₂ ∧
      ¬ Nat.card (S.integer F ⧸ 𝔭₁) ≡ 1 [MOD p ^ (n + 1)] ∧
      ¬ Nat.card (S.integer F ⧸ 𝔭₂) ≡ 1 [MOD p ^ (n + 1)] := by
  sorry

/-- `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary` (BMS Theorem 3.5, Case 1): if
`O_{F,S}` is not totally imaginary, every `(a, b) ∈ W_𝔮` is `𝔮`-equivalent to `(a₁, c^{pⁿ} q)`
with `q ∈ 𝔮`, `a₁ ≡ 1 (mod 𝔮)`. (Proof inputs: local Hilbert symbols, requested; the tame formula
and reciprocity (A.16), (A.21), gaps.) -/
theorem power_reduction_non_totally_imaginary (hnti : S.Nonempty ∨ ∃ w : InfinitePlace F, w.IsReal)
    (𝔮 : Ideal (S.integer F)) (h𝔮 : 𝔮 ≠ ⊥) (p : ℕ) [Fact p.Prime] (n : ℕ)
    (hn : IsMaxRootsExponent F p n) {x : S.integer F × S.integer F} (hx : x ∈ W 𝔮) :
    ∃ q a₁ c : S.integer F, q ∈ 𝔮 ∧ a₁ - 1 ∈ 𝔮 ∧ QEquiv 𝔮 x (a₁, c ^ (p ^ n) * q) := by
  sorry

/-- `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary` (BMS Theorem 3.5, Cases 2–3): for `F`
totally complex, `A = 𝓞_F` and `j_p(𝔮) = 0` (e.g. `𝔮 = A`), the same reduction. (Proof inputs: the
wild local computation (A.17), a gap.) -/
theorem power_reduction_totally_imaginary [IsTotallyComplex F] (𝔮 : Ideal (𝓞 F)) (h𝔮 : 𝔮 ≠ ⊥)
    (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : IsMaxRootsExponent F p n) (hj : jIndex F p n 𝔮 = 0)
    {x : 𝓞 F × 𝓞 F} (hx : x ∈ W 𝔮) :
    ∃ q a₁ c : 𝓞 F, q ∈ 𝔮 ∧ a₁ - 1 ∈ 𝔮 ∧ QEquiv 𝔮 x (a₁, c ^ (p ^ n) * q) := by
  sorry

/-- `KTheoryLowDegrees:U.4/power-reduction` (BMS Theorem 3.5): if `A = O_{F,S}` is not totally
imaginary, or `j_p(𝔮) = 0`, every `(a, b) ∈ W_𝔮` is `𝔮`-equivalent to `(a₁, c^{pⁿ} q)`. -/
theorem power_reduction (𝔮 : Ideal (S.integer F)) (h𝔮 : 𝔮 ≠ ⊥) (p : ℕ) [Fact p.Prime] (n : ℕ)
    (hn : IsMaxRootsExponent F p n)
    (hcase : S.Nonempty ∨ (∃ w : InfinitePlace F, w.IsReal) ∨
      jIndex F p n (𝔮.comap (algebraMap (𝓞 F) (S.integer F))) = 0)
    {x : S.integer F × S.integer F} (hx : x ∈ W 𝔮) :
    ∃ q a₁ c : S.integer F, q ∈ 𝔮 ∧ a₁ - 1 ∈ 𝔮 ∧ QEquiv 𝔮 x (a₁, c ^ (p ^ n) * q) := by
  sorry

/-- `KTheoryLowDegrees:U.4/mennicke-group-locally-cyclic`: every finite subset of `C_𝔮` lies in a
finite cyclic subgroup. -/
theorem mennicke_group_locally_cyclic (𝔮 : Ideal (S.integer F)) (h𝔮 : 𝔮 ≠ ⊥)
    (s : Finset (MennickeGroup 𝔮)) :
    ∃ H : Subgroup (MennickeGroup 𝔮), IsCyclic H ∧ Finite H ∧ (s : Set (MennickeGroup 𝔮)) ⊆ H := by
  sorry

/-- `KTheoryLowDegrees:U.4/mennicke-group-exponent`: `C_𝔮` is cyclic of order dividing `#μ(F)`. -/
theorem mennicke_group_exponent (𝔮 : Ideal (S.integer F)) (h𝔮 : 𝔮 ≠ ⊥) :
    Finite (MennickeGroup 𝔮) ∧ IsCyclic (MennickeGroup 𝔮) ∧
      Nat.card (MennickeGroup 𝔮) ∣ NumberField.Units.torsionOrder F := by
  sorry

/-- **Arithmetic Mennicke symbols are trivial**
(`KTheoryLowDegrees:U.4/arithmetic-mennicke-symbols-trivial`,
BMS Theorem 3.6): `C_𝔮 = 1` for every `𝔮 ≠ 0` if `O_{F,S}` is not totally imaginary, and for every
`𝔮 ≠ 0` with all `j_p(𝔮) = 0` if it is; in particular `C_A = 1`. -/
theorem arithmetic_mennicke_symbols_trivial :
    ((S.Nonempty ∨ ∃ w : InfinitePlace F, w.IsReal) →
      ∀ 𝔮 : Ideal (S.integer F), 𝔮 ≠ ⊥ → Subsingleton (MennickeGroup 𝔮)) ∧
      (∀ 𝔮 : Ideal (S.integer F), 𝔮 ≠ ⊥ →
        (∀ p n : ℕ, p.Prime → IsMaxRootsExponent F p n →
          jIndex F p n (𝔮.comap (algebraMap (𝓞 F) (S.integer F))) = 0) →
        Subsingleton (MennickeGroup 𝔮)) ∧
      Subsingleton (MennickeGroup (⊤ : Ideal (S.integer F))) := by
  sorry

end MennickeSymbol

/-! ### `KTheoryLowDegrees:U.4/bass-milnor-serre`, `U.4/K1-S-integers-determinant`,
`U.4/s-unit-theorem`, `U.4/fundamental-s-units`, `U.4/K1-S-integers-structure`,
`U.4/K1-S-integers-into-field`, `U.4/K1-S-integers-residue-and-local` -/

namespace NumberField

open KTheory

variable (F : Type) [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))

/-- **Bass–Milnor–Serre** (`KTheoryLowDegrees:U.4/bass-milnor-serre`): `SK₁(O_{F,S}) = 0`, i.e.
`SL(O_{F,S}) = E(O_{F,S})`. -/
theorem bass_milnor_serre (hS : S.Finite) :
    SK1 (S.integer F) = ⊥ ∧
        StableGL.specialLinear (S.integer F) = StableGL.elementary (S.integer F) := by
  sorry

/-- `KTheoryLowDegrees:U.4/K1-S-integers-determinant`: `det : K₁(O_{F,S}) ≃ O_{F,S}ˣ ≅ Set.unit S F`
(inverse `u ↦ [u]`), naturally in `S`: for `S ⊆ S'` the induced map is the inclusion of `S`-units.
-/
theorem k1_S_integers_determinant (hS : S.Finite) :
    Function.Bijective (K1.det (S.integer F)) ∧
      (∀ u, K1.det (S.integer F) (K1.ofUnits (S.integer F) u) = u) ∧
      ∀ (S' : Set (HeightOneSpectrum (𝓞 F))) (hle : S.integer F ≤ S'.integer F)
        (x : K1 (S.integer F)),
        (((Set.unitEquivUnitsInteger S' F).symm
            (K1.det (S'.integer F) (K1.map (Subalgebra.inclusion hle).toRingHom x)) : Fˣ)) =
          ((Set.unitEquivUnitsInteger S F).symm (K1.det (S.integer F) x) : Fˣ) := by
  sorry

/-- The `S`-unit rank `r₁ + r₂ + |S| - 1` (helper). -/
noncomputable def sUnitRank : ℕ :=
  InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F + S.ncard - 1

/-- The inclusion `(𝓞 F)ˣ →* O_{F,S}ˣ` of units into `S`-units (helper, a real definition through
Tau Ceti's `Set.unitEmptyEquivUnits` and `Set.unit_mono`). -/
noncomputable def unitsToSUnits : (𝓞 F)ˣ →* S.unit F :=
  (Subgroup.inclusion (Set.unit_mono F (Set.empty_subset S))).comp
    (Set.unitEmptyEquivUnits (R := 𝓞 F) F).symm.toMonoidHom

/-- **Dirichlet's `S`-unit theorem** (`KTheoryLowDegrees:U.4/s-unit-theorem`): `O_{F,S}ˣ` is
finitely generated, its torsion is the image of `μ(F)`, and its rank is `r₁ + r₂ + |S| - 1`. -/
theorem s_unit_theorem (hS : S.Finite) :
    Group.FG (S.unit F) ∧
      CommGroup.torsion (S.unit F) = (NumberField.Units.torsion F).map (unitsToSUnits F S) ∧
      Module.finrank ℤ (Additive (S.unit F)) = sUnitRank F S := by
  sorry

namespace SUnits

variable {F S}

/-- A **system of fundamental `S`-units** (`KTheoryLowDegrees:U.4/fundamental-s-units`): every
`S`-unit is uniquely `ζ · ∏ εᵢ^{eᵢ}` with `ζ ∈ μ(F)` (a real definition). -/
def IsFundamentalSystem {r : ℕ} (ε : Fin r → S.unit F) : Prop :=
  ∀ u : S.unit F, ∃! p : NumberField.Units.torsion F × (Fin r → ℤ),
    u = unitsToSUnits F S p.1 * ∏ i, ε i ^ p.2 i

variable (F S) in
/-- A fundamental system of rank `r₁ + r₂ + |S| - 1` exists. -/
theorem exists_isFundamentalSystem (hS : S.Finite) :
    ∃ ε : Fin (sUnitRank F S) → S.unit F, IsFundamentalSystem ε := by
  sorry

/-- The homomorphism `(ζ, e) ↦ ζ · ∏ εᵢ^{eᵢ}` (helper, a real definition up to the homomorphism
laws). -/
def torsionProdHom {r : ℕ} (ε : Fin r → S.unit F) :
    NumberField.Units.torsion F × Multiplicative (Fin r → ℤ) →* S.unit F :=
  MonoidHom.coprod ((unitsToSUnits F S).comp (NumberField.Units.torsion F).subtype)
    { toFun := fun e => ∏ i, ε i ^ Multiplicative.toAdd e i
      map_one' := by sorry
      map_mul' := by sorry }

/-- For a fundamental system, `μ(F) × ℤʳ ≃* O_{F,S}ˣ` (a real definition up to bijectivity). -/
noncomputable def mulEquivTorsionProd {r : ℕ} (ε : Fin r → S.unit F) (hε : IsFundamentalSystem ε) :
    NumberField.Units.torsion F × Multiplicative (Fin r → ℤ) ≃* S.unit F :=
  MulEquiv.ofBijective (torsionProdHom ε) (by sorry)

/-- `(ζ, e) ↦ ζ · ∏ εᵢ^{eᵢ}`. -/
@[simp]
theorem mulEquivTorsionProd_apply {r : ℕ} (ε : Fin r → S.unit F) (hε : IsFundamentalSystem ε)
    (p : NumberField.Units.torsion F × Multiplicative (Fin r → ℤ)) :
    mulEquivTorsionProd ε hε p = unitsToSUnits F S p.1 * ∏ i, ε i ^ Multiplicative.toAdd p.2 i := by
  sorry

/-- Every `S`-unit is uniquely `ζ · ∏ εᵢ^{eᵢ}` (a real proof). -/
theorem exist_unique_eq_mul_prod {r : ℕ} (ε : Fin r → S.unit F) (hε : IsFundamentalSystem ε)
    (u : S.unit F) : ∃! p : NumberField.Units.torsion F × (Fin r → ℤ),
      u = unitsToSUnits F S p.1 * ∏ i, ε i ^ p.2 i :=
  hε u

/-- For `S = ∅` and Mathlib's `fundSystem`, the decomposition is Tau Ceti's
`unitsMulEquivTorsionProdMultiplicative`. -/
theorem mulEquivTorsionProd_empty
    (h : IsFundamentalSystem (S := (∅ : Set (HeightOneSpectrum (𝓞 F))))
      fun i => unitsToSUnits F ∅ (NumberField.Units.fundSystem F i))
    (p : NumberField.Units.torsion F × Multiplicative (Fin (NumberField.Units.rank F) → ℤ)) :
    mulEquivTorsionProd _ h p =
      unitsToSUnits F ∅ ((NumberField.unitsMulEquivTorsionProdMultiplicative F).symm p) := by
  sorry

end SUnits

/-- `KTheoryLowDegrees:U.4/K1-S-integers-structure`: `K₁(O_{F,S})` is finitely generated with
torsion of order `#μ(F)` and rank `r₁ + r₂ + |S| - 1`; a fundamental system gives
`K₁(O_{F,S}) ≅ μ(F) × ℤ^{r₁+r₂+|S|-1}` (not canonically). -/
theorem k1_S_integers_structure (hS : S.Finite) :
    Group.FG (K1 (S.integer F)) ∧
      Nat.card (CommGroup.torsion (K1 (S.integer F))) = NumberField.Units.torsionOrder F ∧
      Module.finrank ℤ (Additive (K1 (S.integer F))) = sUnitRank F S ∧
      Nonempty (K1 (S.integer F) ≃*
        NumberField.Units.torsion F × Multiplicative (Fin (sUnitRank F S) → ℤ)) := by
  sorry

/-- `KTheoryLowDegrees:U.4/K1-S-integers-into-field`: under the determinant identifications,
`K₁(O_{F,S}) → K₁(F)` is the inclusion `Set.unit S F ≤ Fˣ`; in particular it is injective. -/
theorem k1_S_integers_into_field (hS : S.Finite) :
    (∀ x : K1 (S.integer F),
      K1.det F (K1.map (algebraMap (S.integer F) F) x) =
        ((Set.unitEquivUnitsInteger S F).symm (K1.det (S.integer F) x) : Fˣ)) ∧
      Function.Injective (K1.map (algebraMap (S.integer F) F)) := by
  sorry

/-- The `S`-integers map into the completed valuation ring `𝒪_v` at a place `v ∉ S`, through
`F → F_v` (helper; `v(x) ≤ 1` for `x ∈ O_{F,S}` and `v ∉ S` is `Set.mem_integer_iff`). -/
def sIntegerToAdicCompletionIntegers (v : HeightOneSpectrum (𝓞 F)) (hv : v ∉ S) :
    S.integer F →+* v.adicCompletionIntegers F where
  toFun x := ⟨algebraMap F (v.adicCompletion F) x, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

/-- `KTheoryLowDegrees:U.4/K1-S-integers-residue-and-local`: let `v ∉ S` and `𝔭` the prime of
`A = O_{F,S}` above it (Tau Ceti's `IsDedekindDomain.integerHeightOneSpectrumEquiv`). Under the
determinant identifications, (i) `K₁(A) → K₁(A/𝔭)` is reduction of units, with `(A/𝔭)ˣ` cyclic of
order `N𝔭 - 1`; (ii) `K₁(A) → K₁(A_𝔭)` is the inclusion of units, injective; (iii) the same for the
completed valuation ring `𝒪_v` (Mathlib's `adicCompletionIntegers`). -/
theorem k1_S_integers_residue_and_local (hS : S.Finite) (v : HeightOneSpectrum (𝓞 F)) (hv : v ∉ S)
    (𝔭 : Ideal (S.integer F)) [𝔭.IsMaximal]
    (h𝔭 : 𝔭 = (IsDedekindDomain.integerHeightOneSpectrumEquiv F S ⟨v, hv⟩).asIdeal) :
    (∀ x : K1 (S.integer F),
      ((K1.det (S.integer F ⧸ 𝔭) (K1.map (Ideal.Quotient.mk 𝔭) x) : S.integer F ⧸ 𝔭)) =
        Ideal.Quotient.mk 𝔭 (K1.det (S.integer F) x : S.integer F)) ∧
      IsCyclic (S.integer F ⧸ 𝔭)ˣ ∧ Nat.card (S.integer F ⧸ 𝔭)ˣ = Nat.card (S.integer F ⧸ 𝔭) - 1 ∧
      (∀ x : K1 (S.integer F),
        ((K1.det (Localization.AtPrime 𝔭) (K1.map (algebraMap (S.integer F) _) x) :
          Localization.AtPrime 𝔭)) =
            algebraMap (S.integer F) _ (K1.det (S.integer F) x : S.integer F)) ∧
      Function.Injective (K1.map (algebraMap (S.integer F) (Localization.AtPrime 𝔭))) ∧
      (∀ x : K1 (S.integer F),
        ((K1.det (v.adicCompletionIntegers F)
            (K1.map (sIntegerToAdicCompletionIntegers F S v hv) x) : v.adicCompletionIntegers F)) =
          sIntegerToAdicCompletionIntegers F S v hv (K1.det (S.integer F) x : S.integer F)) ∧
      Function.Injective (K1.map (sIntegerToAdicCompletionIntegers F S v hv)) := by
  sorry

section Tests

-- test TauCeti.NumberField.SUnits.rat_p (computation)
/- `F = ℚ`, `S = {(p)}`: `r = 1`, `ε₁ = p`, `ℤ[1/p]ˣ ≃ {±1} × ℤ`. -/
example (p : ℕ) [Fact p.Prime] (v : HeightOneSpectrum (𝓞 ℚ))
    (hv : v.asIdeal = Ideal.span {(p : 𝓞 ℚ)}) (ε : ({v} : Set (HeightOneSpectrum (𝓞 ℚ))).unit ℚ)
    (hε : ((ε : ℚˣ) : ℚ) = p) :
    sUnitRank ℚ {v} = 1 ∧ SUnits.IsFundamentalSystem ![ε] ∧
      Nonempty (({v} : Set (HeightOneSpectrum (𝓞 ℚ))).unit ℚ ≃* ℤˣ × Multiplicative ℤ) := by
  sorry

-- test TauCeti.NumberField.SUnits.gauss (computation)
/- `F = ℚ(i)`, `S = {(1 + i)}`: `r = 1`, `ε₁ = 1 + i`, torsion `⟨i⟩` of order `4`. -/
example (K : Type) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (ι : 𝓞 K)
    (hι : ι ^ 2 = -1) (v : HeightOneSpectrum (𝓞 K)) (hv : v.asIdeal = Ideal.span {1 + ι})
    (ε : ({v} : Set (HeightOneSpectrum (𝓞 K))).unit K) (hε : ((ε : Kˣ) : K) = 1 + ι) :
    sUnitRank K {v} = 1 ∧ NumberField.Units.torsionOrder K = 4 ∧
        SUnits.IsFundamentalSystem ![ε] := by
  sorry

-- test TauCeti.NumberField.SUnits.rat_empty (degenerate)
example : sUnitRank ℚ ∅ = 0 ∧ NumberField.Units.torsionOrder ℚ = 2 := by
  sorry

-- test TauCeti.NumberField.SUnits.not_canonical (non-example)
/- `F = ℚ(√2)`, `S = ∅`: both `1 + √2` and `1 - √2` are fundamental and the two decompositions
differ. -/
example (K : Type) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (s : 𝓞 K) (hs : s ^ 2 =
    2)
    (ε₁ ε₂ : (∅ : Set (HeightOneSpectrum (𝓞 K))).unit K) (h₁ : ((ε₁ : Kˣ) : K) = 1 + s)
    (h₂ : ((ε₂ : Kˣ) : K) = 1 - s) (hf₁ : SUnits.IsFundamentalSystem ![ε₁])
    (hf₂ : SUnits.IsFundamentalSystem ![ε₂]) :
    SUnits.mulEquivTorsionProd _ hf₁ ≠ SUnits.mulEquivTorsionProd _ hf₂ := by
  sorry

-- test TauCeti.NumberField.SUnits.empty_compat (compatibility)
example (h : SUnits.IsFundamentalSystem (S := (∅ : Set (HeightOneSpectrum (𝓞 F))))
      fun i => unitsToSUnits F ∅ (NumberField.Units.fundSystem F i))
    (p : NumberField.Units.torsion F × Multiplicative (Fin (NumberField.Units.rank F) → ℤ)) :
    SUnits.mulEquivTorsionProd _ h p =
      unitsToSUnits F ∅ ((NumberField.unitsMulEquivTorsionProdMultiplicative F).symm p) :=
  SUnits.mulEquivTorsionProd_empty h p

end Tests

end NumberField

end TauCeti

/-! ## Stage `KTheoryLowDegrees:U.5` — relative `K₁`, transfer, the DVR boundary

A two-sided ideal is `I : Ideal A` with `[I.IsTwoSided]`, so that `A ⧸ I` is Mathlib's
`Ideal.Quotient.ring`; `Ideal.toTwoSided I` is its `TwoSidedIdeal` where one is needed. `K₁(A, I)`
is `GL(I) ⧸ E(A, I)`, not a kernel. The boundary is normalised by `∂(π) = [k]`. -/

namespace TauCeti.RelativeK1

open KTheory

/-! ### `KTheoryLowDegrees:U.5/congruence-subgroup` -/

section Congruence

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {n : Type*} [Fintype n] [DecidableEq n]

variable (n) in
/-- **The congruence subgroup** `GL_n(A, I) := ker (GL_n(A) → GL_n(A/I))`
(`KTheoryLowDegrees:U.5/congruence-subgroup`, a real definition). -/
def congruenceSubgroup (I : Ideal A) [I.IsTwoSided] : Subgroup (GL n A) :=
  (glMap (n := n) (Ideal.Quotient.mk I)).ker

/-- `g ∈ GL_n(A, I)` iff every entry of `g - 1` lies in `I`. -/
theorem mem_congruenceSubgroup (I : Ideal A) [I.IsTwoSided] (g : GL n A) :
    g ∈ congruenceSubgroup n I ↔
      ∀ i j, (g : Matrix n n A) i j - (1 : Matrix n n A) i j ∈ I := by
  sorry

/-- `GL_n(A, I)` is normal. -/
instance congruenceSubgroup.normal (I : Ideal A) [I.IsTwoSided] :
    (congruenceSubgroup n I).Normal :=
  MonoidHom.normal_ker _

/-- `GL(I)`, the kernel of the stable reduction map `GL(A) → GL(A/I)` (a real definition). -/
def stableCongruenceSubgroup (I : Ideal A) [I.IsTwoSided] : Subgroup (StableGL A) :=
  (StableGL.map (Ideal.Quotient.mk I)).ker

/-- `GL(I)` is normal in `GL(A)`. -/
instance stableCongruenceSubgroup.normal (I : Ideal A) [I.IsTwoSided] :
    (stableCongruenceSubgroup I).Normal :=
  MonoidHom.normal_ker _

/-- `diag(g, 1) ∈ GL_n(A, I) ↔ g ∈ GL_m(A, I)`. -/
theorem stabilise_mem_congruenceSubgroup (I : Ideal A) [I.IsTwoSided] {k m : ℕ} (h : k ≤ m)
    (g : GL (Fin k) A) :
    stabilise h g ∈ congruenceSubgroup (Fin m) I ↔ g ∈ congruenceSubgroup (Fin k) I := by
  sorry

/-- A ring map with `f(I) ⊆ J` maps `GL_n(A, I)` into `GL_n(B, J)`. -/
theorem congruenceSubgroup.map (f : A →+* B) (I : Ideal A) [I.IsTwoSided] (J : Ideal B)
    [J.IsTwoSided] (hf : ∀ a ∈ I, f a ∈ J) :
    (congruenceSubgroup n I).map (glMap f) ≤ congruenceSubgroup n J := by
  sorry

/-- `GL_n(A, 0) = 1`. -/
@[simp]
theorem congruenceSubgroup_bot : congruenceSubgroup n (⊥ : Ideal A) = ⊥ := by
  sorry

/-- `GL_n(A, A) = GL_n(A)`. -/
@[simp]
theorem congruenceSubgroup_top : congruenceSubgroup n (⊤ : Ideal A) = ⊤ := by
  sorry

/-- The determinant-one part of `GL₂(ℤ, Nℤ)` is Mathlib's `CongruenceSubgroup.Gamma N`. -/
theorem congruenceSubgroup_gamma (N : ℕ) :
    (congruenceSubgroup (Fin 2) (Ideal.span {(N : ℤ)})).comap Matrix.SpecialLinearGroup.toGL =
      CongruenceSubgroup.Gamma N := by
  sorry

-- test TauCeti.RelativeK1.congruenceSubgroup_bot_top (degenerate)
example : congruenceSubgroup n (⊥ : Ideal A) = ⊥ ∧ congruenceSubgroup n (⊤ : Ideal A) = ⊤ :=
  ⟨congruenceSubgroup_bot, congruenceSubgroup_top⟩

-- test TauCeti.RelativeK1.congruenceSubgroup_zmod_four (computation)
example : (congruenceSubgroup (Fin 1) (Ideal.span {(2 : ZMod 4)}) : Set (GL (Fin 1) (ZMod 4))) =
      {1, diagUnit ![ZMod.unitOfCoprime 3 (by decide)]} ∧
    Nat.card (congruenceSubgroup (Fin 1) (Ideal.span {(2 : ZMod 4)})) = 2 := by
  sorry

-- test TauCeti.RelativeK1.congruenceSubgroup_gamma_test (compatibility)
example (N : ℕ) :
    (congruenceSubgroup (Fin 2) (Ideal.span {(N : ℤ)})).comap Matrix.SpecialLinearGroup.toGL =
      CongruenceSubgroup.Gamma N :=
  congruenceSubgroup_gamma N

-- test TauCeti.RelativeK1.congruenceSubgroup_two_det (non-example)
/- `diag(-1, 1) ∈ GL₂(ℤ, 2ℤ)` has determinant `-1`, so `GL₂(ℤ, 2ℤ) ⊋ Γ(2)`. -/
example : (diagUnit ![-1, 1] : GL (Fin 2) ℤ) ∈ congruenceSubgroup (Fin 2) (Ideal.span {(2 : ℤ)}) ∧
    Matrix.GeneralLinearGroup.det (diagUnit ![-1, 1] : GL (Fin 2) ℤ) = -1 := by
  sorry

end Congruence

/-! ### `KTheoryLowDegrees:U.5/relative-elementary-subgroup` -/

section RelElementary

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {n : Type*} [Fintype n] [DecidableEq n]

variable (n) in
/-- **The relative elementary group** `E_n(A, I)`
(`KTheoryLowDegrees:U.5/relative-elementary-subgroup`):
generated by the `E_n(A)`-conjugates of the `e_ij(x)`, `x ∈ I` (a real definition). -/
def relElementary (I : Ideal A) : Subgroup (GL n A) :=
  Subgroup.closure {g | ∃ τ ∈ elementarySubgroup n A, ∃ (i j : n) (h : i ≠ j) (x : A),
    x ∈ I ∧ g = τ * elementary h x * τ⁻¹}

/-- `e_ij(x) ∈ E_n(A, I)` for `x ∈ I`. -/
theorem elementary_mem_relElementary (I : Ideal A) {i j : n} (h : i ≠ j) {x : A} (hx : x ∈ I) :
    elementary h x ∈ relElementary n I := by
  sorry

/-- `E_n(A, I)` is normalised by `E_n(A)`. -/
theorem relElementary.conj_mem (I : Ideal A) {τ g : GL n A} (hτ : τ ∈ elementarySubgroup n A)
    (hg : g ∈ relElementary n I) : τ * g * τ⁻¹ ∈ relElementary n I := by
  sorry

/-- `E_n(A, I) ≤ GL_n(A, I)`. -/
theorem relElementary_le_congruenceSubgroup (I : Ideal A) [I.IsTwoSided] :
    relElementary n I ≤ congruenceSubgroup n I := by
  sorry

/-- `E(A, I) ≤ GL(A)`, the union of the `E_n(A, I)` (a real definition). -/
def stableRelElementary (I : Ideal A) : Subgroup (StableGL A) :=
  ⨆ k : ℕ, (relElementary (Fin k) I).map (StableGL.of k)

/-- `f(I) ⊆ J` maps `E_n(A, I)` into `E_n(B, J)`. -/
theorem relElementary.map (f : A →+* B) (I : Ideal A) (J : Ideal B) (hf : ∀ a ∈ I, f a ∈ J) :
    (relElementary n I).map (glMap f) ≤ relElementary n J := by
  sorry

/-- `E_n(A, A) = E_n(A)`. -/
@[simp]
theorem relElementary_top : relElementary n (⊤ : Ideal A) = elementarySubgroup n A := by
  sorry

/-- `E_n(A, 0) = 1`. -/
@[simp]
theorem relElementary_bot : relElementary n (⊥ : Ideal A) = ⊥ := by
  sorry

/-- For commutative `A` and `n ≥ 3`, `E_n(A, I) = ⁅E_n(A), E_n(A, I)⁆` (BMS (5.1)). -/
theorem relElementary_eq_commutator {R : Type u} [CommRing R] (I : Ideal R)
    (hn : 3 ≤ Fintype.card n) :
    relElementary n I = ⁅elementarySubgroup n R, relElementary n I⁆ := by
  sorry

-- test TauCeti.RelativeK1.relElementary_top_bot (degenerate)
example : relElementary n (⊤ : Ideal A) = elementarySubgroup n A ∧
    relElementary n (⊥ : Ideal A) = ⊥ ∧ ∀ I : Ideal A, relElementary (Fin 1) I = ⊥ := by
  sorry

-- test TauCeti.RelativeK1.relElementary_int_two_conj (computation)
/- `e₀₁(1) e₁₀(2) e₀₁(-1) = (3 -2; 2 -1)` (a matrix computation) lies in `E₂(ℤ, 2ℤ)`. -/
example : ((elementary (by decide : (0 : Fin 2) ≠ 1) (1 : ℤ) *
      elementary (by decide : (1 : Fin 2) ≠ 0) 2 * elementary (by decide : (0 : Fin 2) ≠ 1) (-1) :
        GL (Fin 2) ℤ) : Matrix (Fin 2) (Fin 2) ℤ) = !![3, -2; 2, -1] := by
  decide

example : (elementary (by decide : (0 : Fin 2) ≠ 1) (1 : ℤ) *
      elementary (by decide : (1 : Fin 2) ≠ 0) 2 * elementary (by decide : (0 : Fin 2) ≠ 1) (-1) :
        GL (Fin 2) ℤ) ∈ relElementary (Fin 2) (Ideal.span {(2 : ℤ)}) := by
  sorry

-- test TauCeti.RelativeK1.relElementary_not_generated (non-example)
/- The `e_ij(x)`, `x ∈ 2ℤ`, alone generate a subgroup of matrices with diagonal `≡ 1 (mod 4)`, which
misses `(3 -2; 2 -1)`. -/
example : (elementary (by decide : (0 : Fin 2) ≠ 1) (1 : ℤ) *
      elementary (by decide : (1 : Fin 2) ≠ 0) 2 * elementary (by decide : (0 : Fin 2) ≠ 1) (-1) :
        GL (Fin 2) ℤ) ∉
    Subgroup.closure {g : GL (Fin 2) ℤ | ∃ (i j : Fin 2) (h : i ≠ j) (x : ℤ),
      x ∈ Ideal.span {(2 : ℤ)} ∧ g = elementary h x} := by
  sorry

-- test TauCeti.RelativeK1.relElementary_commutator (characterisation)
example {R : Type u} [CommRing R] (I : Ideal R) {i j k : n} (hij : i ≠ j) (hik : i ≠ k)
    (hkj : k ≠ j) {x : R} (hx : x ∈ I) (hn : 3 ≤ Fintype.card n) :
    elementary hij x = ⁅elementary hik x, elementary hkj 1⁆ ∧
      relElementary n I ≤ ⁅elementarySubgroup n R, relElementary n I⁆ := by
  sorry

end RelElementary

/-! ### `KTheoryLowDegrees:U.5/augmented-double-ring` -/

section DoubleRingSection

variable (A : Type u) [Ring A] (I : Ideal A) [I.IsTwoSided]

/-- **The double ring** `A ⊕ I` (`KTheoryLowDegrees:U.5/augmented-double-ring`): the group `A × I`
with `(r, x)(s, y) = (rs, ry + xs + xy)` and unit `(1, 0)` (a real definition; the ring axioms are
proofs). -/
def DoubleRing : Type u := A × I

namespace DoubleRing

instance instAddCommGroup : AddCommGroup (DoubleRing A I) :=
  inferInstanceAs (AddCommGroup (A × I))

instance instRing : Ring (DoubleRing A I) :=
  { instAddCommGroup A I with
    mul := fun p q => (p.1 * q.1,
      ⟨p.1 * (q.2 : A) + (p.2 : A) * q.1 + (p.2 : A) * (q.2 : A), by sorry⟩)
    one := ((1 : A), 0)
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    left_distrib := by sorry
    right_distrib := by sorry
    zero_mul := by sorry
    mul_zero := by sorry }

/-- The pull-back subring `A ×_{A/I} A = {(a, b) | a - b ∈ I}` (helper; carrier real). -/
def pullbackSubring : Subring (A × A) where
  carrier := {x | x.1 - x.2 ∈ I}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

variable {A I}

/-- `pr : (r, x) ↦ r` (a real definition up to the homomorphism laws). -/
def pr : DoubleRing A I →+* A where
  toFun p := p.1
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

/-- `add : (r, x) ↦ r + x` (a real definition up to the homomorphism laws). -/
def add : DoubleRing A I →+* A where
  toFun p := p.1 + p.2
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

/-- The common section `r ↦ (r, 0)`. -/
def diag : A →+* DoubleRing A I where
  toFun r := (r, 0)
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

/-- `pr ∘ diag = id = add ∘ diag`. -/
@[simp]
theorem pr_diag : (pr (I := I)).comp diag = RingHom.id A ∧
    (add (I := I)).comp diag = RingHom.id A := by
  sorry

/-- `(pr, add) : D ≃+* A ×_{A/I} A`, `(r, x) ↦ (r, r + x)` (a real definition up to proofs). -/
def equivPullback : DoubleRing A I ≃+* pullbackSubring A I where
  toFun p := ⟨(p.1, p.1 + p.2), by sorry⟩
  invFun y := (y.1.1, ⟨y.1.2 - y.1.1, by sorry⟩)
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
  map_add' := by sorry

/-- `ker pr = 0 ⊕ I`, and `add` maps it bijectively onto `I`. -/
theorem ker_pr :
    (RingHom.ker (pr (I := I)) : Set (DoubleRing A I)) = {p | p.1 = 0} ∧
      Set.InjOn (add (I := I)) {p | p.1 = 0} ∧ add '' {p : DoubleRing A I | p.1 = 0} = I := by
  sorry

/-- Functoriality in `(A, I)`, compatible with `pr`, `add` and `diag` (a real definition). -/
def map {B : Type v} [Ring B] (f : A →+* B) (J : Ideal B) [J.IsTwoSided] (hf : ∀ a ∈ I, f a ∈ J) :
    DoubleRing A I →+* DoubleRing B J where
  toFun p := (f p.1, ⟨f p.2, hf _ p.2.2⟩)
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

-- test TauCeti.RelativeK1.DoubleRing.bot (degenerate)
example : Function.Bijective (pr (A := A) (I := ⊥)) ∧ (pr (A := A) (I := ⊥)) = add := by
  sorry

/-- Test notation: the element `(1, 2)` of `ℤ ⊕ 2ℤ`. -/
def oneTwo : DoubleRing ℤ (Ideal.span {(2 : ℤ)}) := ((1 : ℤ), ⟨2, Ideal.mem_span_singleton_self 2⟩)

-- test TauCeti.RelativeK1.DoubleRing.int_two (computation)
/- In `ℤ ⊕ 2ℤ`: `equivPullback (1, 2) = (1, 3)` and `(1, 2)² = (1, 8) ↦ (1, 9) = (1, 3)²`. -/
example : (equivPullback oneTwo : ℤ × ℤ) = (1, 3) ∧
    oneTwo * oneTwo = (((1 : ℤ), ⟨8, Ideal.mem_span_singleton.mpr ⟨4, by norm_num⟩⟩) :
      DoubleRing ℤ (Ideal.span {(2 : ℤ)})) ∧
    (equivPullback (oneTwo * oneTwo) : ℤ × ℤ) = (1, 9) ∧ ((1, 3) : ℤ × ℤ) ^ 2 = (1, 9) := by
  refine ⟨rfl, Prod.ext ?_ (Subtype.ext ?_), ?_, ?_⟩
  · change (1 : ℤ) * 1 = 1
    norm_num
  · change (1 : ℤ) * 2 + 2 * 1 + 2 * 2 = 8
    norm_num
  · change ((1 : ℤ) * 1, (1 : ℤ) * 1 + ((1 : ℤ) * 2 + 2 * 1 + 2 * 2)) = (1, 9)
    norm_num
  · decide

-- test TauCeti.RelativeK1.DoubleRing.top (characterisation)
example : Nonempty (DoubleRing A ⊤ ≃+* A × A) := by
  sorry

-- test TauCeti.RelativeK1.DoubleRing.not_componentwise (non-example)
/- The product is not componentwise: `(1, 2)(1, 2) = (1, 8)` in `ℤ ⊕ 2ℤ`, not `(1, 4)`. -/
example : oneTwo * oneTwo ≠ (((1 : ℤ), ⟨4, Ideal.mem_span_singleton.mpr ⟨2, by norm_num⟩⟩) :
      DoubleRing ℤ (Ideal.span {(2 : ℤ)})) := by
  intro h
  have h2 := congrArg (fun p : DoubleRing ℤ (Ideal.span {(2 : ℤ)}) => ((p.2 : ℤ))) h
  change (1 : ℤ) * 2 + 2 * 1 + 2 * 2 = 4 at h2
  norm_num at h2

end DoubleRing

end DoubleRingSection

/-! ### `U.5/relative-whitehead-lemma`, `U.5/relative-commutator-formula`, `U.5/relative-K1` -/

section RelK1Section

variable {A : Type u} [Ring A] {B : Type v} [Ring B] {C : Type w} [Ring C]

/-- **The relative Whitehead lemma** (`KTheoryLowDegrees:U.5/relative-whitehead-lemma`): (a)
`diag(g, g⁻¹) ∈ E_{2n}(A, I)` for `g ∈ GL_n(A, I)`; (b) `E(A, I) ≤ GL(I)` and `E(A, I)` is normal in
`GL(A)`; (c) `⁅GL(I), GL(I)⁆ ≤ E(A, I)`. -/
theorem relative_whitehead_lemma (I : Ideal A) [I.IsTwoSided] :
    (∀ (n : ℕ) (g : GL (Fin n) A), g ∈ congruenceSubgroup (Fin n) I →
      blockSum (g, g⁻¹) ∈ relElementary (Fin (n + n)) I) ∧
      stableRelElementary I ≤ stableCongruenceSubgroup I ∧ (stableRelElementary I).Normal ∧
      ⁅stableCongruenceSubgroup I, stableCongruenceSubgroup I⁆ ≤ stableRelElementary I := by
  sorry

/-- `E(A, I)` is normal in `GL(A)` (instance form of `relative_whitehead_lemma` (b)). -/
instance stableRelElementary_normal (I : Ideal A) [I.IsTwoSided] :
    (stableRelElementary I).Normal :=
  (relative_whitehead_lemma I).2.2.1

/-- `KTheoryLowDegrees:U.5/relative-commutator-formula`: `E(A, I) = ⁅GL(A), GL(I)⁆ = ⁅E(A), E(A,
I)⁆`. -/
theorem relative_commutator_formula (I : Ideal A) [I.IsTwoSided] :
    stableRelElementary I = ⁅(⊤ : Subgroup (StableGL A)), stableCongruenceSubgroup I⁆ ∧
      stableRelElementary I = ⁅StableGL.elementary A, stableRelElementary I⁆ := by
  sorry

/-- **Relative K₁** (`KTheoryLowDegrees:U.5/relative-K1`): `K₁(A, I) := GL(I) ⧸ E(A, I)` (a real
definition). -/
def RelK1 (I : Ideal A) [I.IsTwoSided] : Type u :=
  stableCongruenceSubgroup I ⧸ (stableRelElementary I).subgroupOf (stableCongruenceSubgroup I)

namespace RelK1

/-- `K₁(A, I)` is a commutative group (relative Whitehead lemma (c)). -/
instance instCommGroup (I : Ideal A) [I.IsTwoSided] : CommGroup (RelK1 I) :=
  { QuotientGroup.Quotient.group ((stableRelElementary I).subgroupOf (stableCongruenceSubgroup I))
      with
    mul_comm := by sorry }

variable {I : Ideal A} [I.IsTwoSided]

variable (I) in
/-- The quotient map `GL(I) →* K₁(A, I)`. -/
def mk : stableCongruenceSubgroup I →* RelK1 I :=
  QuotientGroup.mk' _

/-- `mk` is surjective. -/
theorem mk_surjective : Function.Surjective (mk I) :=
  QuotientGroup.mk'_surjective _

/-- `mk x = 1 ↔ x ∈ E(A, I)`. -/
theorem mk_eq_one_iff (x : stableCongruenceSubgroup I) :
    mk I x = 1 ↔ (x : StableGL A) ∈ stableRelElementary I := by
  sorry

variable (I) in
/-- `ι : K₁(A, I) →* K₁(A)`, induced by `GL(I) ≤ GL(A)` (a real definition). -/
def toK1 : RelK1 I →* K1 A :=
  QuotientGroup.lift _ (K1.mk.comp (stableCongruenceSubgroup I).subtype) (by sorry)

/-- The restriction `GL(I) →* GL(J)` of `GL(f)` for `f(I) ⊆ J` (helper). -/
def congruenceMap (f : A →+* B) (J : Ideal B) [J.IsTwoSided] (hf : ∀ a ∈ I, f a ∈ J) :
    stableCongruenceSubgroup I →* stableCongruenceSubgroup J :=
  ((StableGL.map f).comp (stableCongruenceSubgroup I).subtype).codRestrict _ fun _ => by sorry

/-- Functoriality: `f(I) ⊆ J` induces `K₁(A, I) →* K₁(B, J)` (a real definition). -/
def map (f : A →+* B) (J : Ideal B) [J.IsTwoSided] (hf : ∀ a ∈ I, f a ∈ J) : RelK1 I →* RelK1 J :=
  QuotientGroup.map _ _ (congruenceMap f J hf) (by sorry)

/-- `map id = id`. -/
theorem map_id : map (RingHom.id A) I (fun _ h => h) = MonoidHom.id (RelK1 I) := by
  sorry

/-- `map (g ∘ f) = map g ∘ map f`. -/
theorem map_comp (f : A →+* B) (g : B →+* C) (J : Ideal B) [J.IsTwoSided] (K : Ideal C)
    [K.IsTwoSided] (hf : ∀ a ∈ I, f a ∈ J) (hg : ∀ b ∈ J, g b ∈ K) :
    map (g.comp f) K (fun a ha => hg _ (hf a ha)) = (map g K hg).comp (map f J hf) := by
  sorry

/-- `mk (e_ij(x)) = 1` for `x ∈ I`. -/
@[simp]
theorem mk_elementary {n : ℕ} {i j : Fin n} (h : i ≠ j) {x : A} (hx : x ∈ I)
    (hmem : StableGL.of n (elementary h x) ∈ stableCongruenceSubgroup I) :
    mk I ⟨_, hmem⟩ = 1 := by
  sorry

variable (A) in
/-- `K₁(A, A) ≃* K₁(A)`, compatibly with `ι` (a real definition: `toK1` is bijective). -/
def equivK1_top : RelK1 (⊤ : Ideal A) ≃* K1 A :=
  MulEquiv.ofBijective (toK1 ⊤) (by sorry)

/-- `K₁(A, 0)` is trivial. -/
theorem subsingleton_bot : Subsingleton (RelK1 (⊥ : Ideal A)) := by
  sorry

end RelK1

-- test TauCeti.RelativeK1.RelK1.bot_top (degenerate)
example : Subsingleton (RelK1 (⊥ : Ideal A)) ∧ Function.Bijective (RelK1.toK1 (⊤ : Ideal A)) :=
  ⟨RelK1.subsingleton_bot, (RelK1.equivK1_top A).bijective⟩

-- test TauCeti.RelativeK1.RelK1.zmod_sq (computation)
/- For `A = ℤ/p²`, `I = (p)`: `K₁(A, I) ≅ ℤ/p`, and `ι` is injective (orders `p`, `p(p - 1)`,
`p - 1` in `1 → ℤ/p → (ℤ/p²)ˣ → 𝔽_pˣ → 1`). -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (RelK1 (Ideal.span {(p : ZMod (p ^ 2))}) ≃* Multiplicative (ZMod p)) ∧
      Function.Injective (RelK1.toK1 (Ideal.span {(p : ZMod (p ^ 2))})) := by
  sorry

/-- Test notation: the upper triangular `2 × 2` matrices over a field (carrier real). -/
def upperTriangularRing (F : Type u) [Field F] : Subring (Matrix (Fin 2) (Fin 2) F) where
  carrier := {M | M 1 0 = 0}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

/-- Test notation: Swan's subring `R₀ = F · 1 ⊕ I` of the upper triangular matrices (carrier real).
-/
def swanSubring (F : Type u) [Field F] : Subring (Matrix (Fin 2) (Fin 2) F) where
  carrier := {M | M 1 0 = 0 ∧ M 0 0 = M 1 1}
  mul_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  zero_mem' := by sorry
  neg_mem' := by sorry

-- test TauCeti.RelativeK1.RelK1.swan (non-example)
/- Swan's example: `I` the matrices with only the `(0, 1)` entry, an ideal of both the upper
triangular ring `R` and `R₀ = F ⊕ I`; `K₁(R₀, I) ≅ F` while `K₁(R, I) = 0`. The two ideals are
hypotheses with their carriers pinned. -/
example (F : Type u) [Field F] (I : Ideal (upperTriangularRing F)) [I.IsTwoSided]
    (hI : ∀ M, M ∈ I ↔ (M : Matrix (Fin 2) (Fin 2) F) 0 0 = 0 ∧
        (M : Matrix (Fin 2) (Fin 2) F) 1 1 = 0)
    (I₀ : Ideal (swanSubring F)) [I₀.IsTwoSided]
    (hI₀ : ∀ M, M ∈ I₀ ↔ (M : Matrix (Fin 2) (Fin 2) F) 0 0 = 0 ∧
        (M : Matrix (Fin 2) (Fin 2) F) 1 1 = 0) :
    Nonempty (RelK1 I₀ ≃* Multiplicative F) ∧ Subsingleton (RelK1 I) := by
  sorry

-- test TauCeti.RelativeK1.RelK1.top_compat (compatibility)
example (f : A →+* B) (x : RelK1 (⊤ : Ideal A)) :
    RelK1.toK1 ⊤ (RelK1.map f ⊤ (fun _ _ => Submodule.mem_top) x) = K1.map f (RelK1.toK1 ⊤ x) := by
  sorry

end RelK1Section

/-! ### `KTheoryLowDegrees:U.5/relative-determinant`, `U.5/relative-K1-radical-ideal`,
`U.5/relative-K1-split`, `U.5/relative-sequence-degree-one` -/

section RelDet

variable {A : Type u} [Ring A]

/-- `GL₁(I)`: the units congruent to `1` modulo `I` (helper, a real definition). -/
def unitsOneMod (I : Ideal A) [I.IsTwoSided] : Subgroup Aˣ :=
  (Units.map (Ideal.Quotient.mk I).toMonoidHom).ker

variable {R : Type u} [CommRing R] {I : Ideal R}

/-- **The relative determinant** (`KTheoryLowDegrees:U.5/relative-determinant`):
`det : K₁(A, I) →* GL₁(I)` (a real definition through `QuotientGroup.lift`). -/
def RelK1.det (I : Ideal R) : RelK1 I →* unitsOneMod I :=
  QuotientGroup.lift _
    (((StableGL.det R).comp (stableCongruenceSubgroup I).subtype).codRestrict (unitsOneMod I)
      fun _ => by sorry)
    (by sorry)

/-- `det (mk x) = det x`. -/
@[simp]
theorem RelK1.det_mk (x : stableCongruenceSubgroup I) :
    (RelK1.det I (RelK1.mk I x) : Rˣ) = StableGL.det R x :=
  rfl

/-- The section `GL₁(I) →* K₁(A, I)`, `u ↦ [u]` (a real definition up to proofs). -/
def RelK1.ofUnit (I : Ideal R) : unitsOneMod I →* RelK1 I where
  toFun u := RelK1.mk I ⟨StableGL.of 1 (Matrix.GeneralLinearGroup.scalar (Fin 1) u), by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

/-- `det ∘ ofUnit = id`. -/
@[simp]
theorem RelK1.det_ofUnit : (RelK1.det I).comp (RelK1.ofUnit I) = MonoidHom.id _ := by
  sorry

/-- `SK₁(A, I) := ker det` (a real definition). -/
def RelSK1 (I : Ideal R) : Subgroup (RelK1 I) :=
  (RelK1.det I).ker

/-- `SK₁(A, I) ≃* (SL(A) ⊓ GL(I)) ⧸ E(A, I)`. -/
theorem RelSK1.equiv :
    Nonempty (RelSK1 I ≃* ↥(StableGL.specialLinear R ⊓ stableCongruenceSubgroup I) ⧸
      (stableRelElementary I).subgroupOf (StableGL.specialLinear R ⊓ stableCongruenceSubgroup I))
          := by
  sorry

variable (I) in
/-- `K₁(A, I) ≃* GL₁(I) × SK₁(A, I)`, `x ↦ (det x, x · [det x]⁻¹)` (a real definition up to
proofs). -/
def RelK1.equivProd : RelK1 I ≃* unitsOneMod I × RelSK1 I where
  toFun x := (RelK1.det I x, ⟨x * RelK1.ofUnit I (RelK1.det I x)⁻¹, by sorry⟩)
  invFun y := RelK1.ofUnit I y.1 * y.2
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

/-- Compatibility with U.3: `det ∘ ι = (GL₁(I) ≤ Aˣ) ∘ det`. -/
theorem RelK1.det_toK1 (x : RelK1 I) : (RelK1.det I x : Rˣ) = K1.det R (RelK1.toK1 I x) := by
  sorry

-- test TauCeti.RelativeK1.RelK1.det_top (degenerate)
example (x : RelK1 (⊤ : Ideal R)) : (RelK1.det ⊤ x : Rˣ) = K1.det R (RelK1.toK1 ⊤ x) :=
  RelK1.det_toK1 x

-- test TauCeti.RelativeK1.RelK1.det_zmod_sq (computation)
example (p : ℕ) [Fact p.Prime] :
    Function.Bijective (RelK1.det (Ideal.span {(p : ZMod (p ^ 2))})) ∧
      IsCyclic (unitsOneMod (Ideal.span {(p : ZMod (p ^ 2))})) ∧
      Nat.card (unitsOneMod (Ideal.span {(p : ZMod (p ^ 2))})) = p ∧
      RelSK1 (Ideal.span {(p : ZMod (p ^ 2))}) = ⊥ := by
  sorry

-- test TauCeti.RelativeK1.RelK1.det_int_three (non-example)
/- `det` takes values in units `≡ 1 (mod I)`: `det(K₁(ℤ, 3ℤ)) = 1` although `det(K₁(ℤ)) = {±1}`. -/
example : (∀ x : RelK1 (Ideal.span {(3 : ℤ)}), RelK1.det _ x = 1) ∧
    ∃ y : K1 ℤ, K1.det ℤ y = -1 := by
  sorry

-- test TauCeti.RelativeK1.RelK1.det_compat (compatibility)
example {n : ℕ} (g : GL (Fin n) R) (hg : StableGL.of n g ∈ stableCongruenceSubgroup I) :
    (RelK1.det I (RelK1.mk I ⟨_, hg⟩) : Rˣ) = Matrix.GeneralLinearGroup.det g :=
  rfl

/-- `KTheoryLowDegrees:U.5/relative-K1-radical-ideal`: for a radical ideal (`I ≤ jacobson ⊥`),
`GL_{n+2}(A, I) = E_{n+2}(A, I) · GL_{n+1}(A, I)`, so `K₁(A, I)` is generated by `GL₁(I)`. -/
theorem relative_K1_radical_ideal {A : Type u} [Ring A] (J : Ideal A) [J.IsTwoSided]
    (hJ : J ≤ Ideal.jacobson ⊥) :
    (∀ (n : ℕ) (g : GL (Fin (n + 2)) A), g ∈ congruenceSubgroup (Fin (n + 2)) J →
      ∃ e ∈ relElementary (Fin (n + 2)) J, ∃ g' ∈ congruenceSubgroup (Fin (n + 1)) J,
        g = e * stabilise (Nat.le_succ (n + 1)) g') ∧
      ∀ x : RelK1 J, ∃ (u : unitsOneMod J)
        (hu : StableGL.of 1 (Matrix.GeneralLinearGroup.scalar (Fin 1) (u : Aˣ)) ∈
          stableCongruenceSubgroup J),
        x = RelK1.mk J ⟨_, hu⟩ := by
  sorry

/-- `KTheoryLowDegrees:U.5/relative-K1-radical-ideal` (commutative case): `SK₁(A, I) = 0`,
`det : K₁(A, I) ≅ 1 + I`, and `ι` is injective. -/
theorem relative_K1_radical_ideal_comm (hI : I ≤ Ideal.jacobson ⊥) :
    RelSK1 I = ⊥ ∧ Function.Bijective (RelK1.det I) ∧ Function.Injective (RelK1.toK1 I) := by
  sorry

/-- `KTheoryLowDegrees:U.5/relative-K1-split`: if `A → A/I` has a ring section, then
`E(A) ∩ GL(I) = E(A, I)`, `ι` is injective, and `K₁(A) ≅ K₁(A/I) × K₁(A, I)`. -/
theorem relative_K1_split {A : Type u} [Ring A] (J : Ideal A) [J.IsTwoSided] (s : A ⧸ J →+* A)
    (hs : (Ideal.Quotient.mk J).comp s = RingHom.id _) :
    StableGL.elementary A ⊓ stableCongruenceSubgroup J = stableRelElementary J ∧
      Function.Injective (RelK1.toK1 J) ∧ Nonempty (K1 A ≃* K1 (A ⧸ J) × RelK1 J) := by
  sorry

/-- **The relative exact sequence** (`KTheoryLowDegrees:U.5/relative-sequence-degree-one`):
`E(A) → E(A/I)` is onto, `K₁(A, I) → K₁(A) → K₁(A/I)` is exact, and `ker ι` is the image of
`E(A) ∩ GL(I)`, i.e. `(E(A) ∩ GL(I))/E(A, I)` (the target of the `K₂` boundary). -/
theorem relative_sequence_degree_one {A : Type u} [Ring A] (J : Ideal A) [J.IsTwoSided] :
    (StableGL.elementary A).map (StableGL.map (Ideal.Quotient.mk J)) = StableGL.elementary (A ⧸ J) ∧
      (RelK1.toK1 J).range = (K1.map (Ideal.Quotient.mk J)).ker ∧
      (RelK1.toK1 J).ker = ((StableGL.elementary A).subgroupOf (stableCongruenceSubgroup J)).map
        (RelK1.mk J) := by
  sorry

end RelDet

end TauCeti.RelativeK1

/-! ### `KTheoryLowDegrees:U.5/relative-K0-of-ideal`, `U.5/ideal-sequence-degree-zero` -/

namespace TauCeti.RelativeK0

open KTheory RelativeK1

variable {A : Type u} [Ring A] {B : Type u} [Ring B]

/-- **`K₀` of an ideal** (`KTheoryLowDegrees:U.5/relative-K0-of-ideal`):
`K₀(I) := ker (K₀(pr) : K₀(A ⊕ I) → K₀(A))` (a real definition). -/
def RelK0 (I : Ideal A) [I.IsTwoSided] : AddSubgroup (RingK0 (DoubleRing A I)) :=
  (RingK0.map DoubleRing.pr).ker

namespace RelK0

variable (I : Ideal A) [I.IsTwoSided]

/-- `K₀(I) →+ K₀(A)`, the restriction of `K₀(add)` (a real definition). -/
def toK0 : RelK0 I →+ RingK0 A :=
  (RingK0.map DoubleRing.add).comp (RelK0 I).subtype

/-- `K₀(A ⊕ I) ≃+ K₀(A) × K₀(I)` via `K₀(pr)` and the projection along `K₀(diag)` (a real definition
up to proofs). -/
def splitting : RingK0 (DoubleRing A I) ≃+ RingK0 A × RelK0 I where
  toFun x := (RingK0.map DoubleRing.pr x,
    ⟨x - RingK0.map DoubleRing.diag (RingK0.map DoubleRing.pr x), by sorry⟩)
  invFun y := RingK0.map DoubleRing.diag y.1 + (y.2 : RingK0 (DoubleRing A I))
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

variable {I} in
/-- Functoriality: `f(I) ⊆ J` induces `K₀(I) →+ K₀(J)` (a real definition). -/
def map (f : A →+* B) (J : Ideal B) [J.IsTwoSided] (hf : ∀ a ∈ I, f a ∈ J) : RelK0 I →+ RelK0 J :=
  ((RingK0.map (DoubleRing.map f J hf)).comp (RelK0 I).subtype).codRestrict _ fun _ => by sorry

/-- `K₀(0) = 0`. -/
theorem subsingleton_bot : Subsingleton (RelK0 (⊥ : Ideal A)) := by
  sorry

/-- For `I = eA`, `e` a central idempotent, `K₀(I) ≃+ K₀(eA)` of the unital ring `eA` (Mathlib's
corner ring `IsIdempotentElem.Corner`, with unit `e`; K-book Ex. II.2.4(a)). -/
theorem equiv_of_unital (e : A) (he : IsIdempotentElem e) (hc : IsMulCentral e) (J : Ideal A)
    [J.IsTwoSided] (hJ : (J : Set A) = Set.range (e * ·)) :
    Nonempty (RelK0 J ≃+ RingK0 he.Corner) := by
  sorry

-- test TauCeti.RelativeK0.RelK0.bot (degenerate)
example : Subsingleton (RelK0 (⊥ : Ideal A)) :=
  subsingleton_bot

-- test TauCeti.RelativeK0.RelK0.top (computation)
example : Nonempty (RelK0 (⊤ : Ideal A) ≃+ RingK0 A) := by
  sorry

-- test TauCeti.RelativeK0.RelK0.product_factor (compatibility)
example (A₁ A₂ : Type u) [Ring A₁] [Ring A₂] :
    Nonempty (RelK0 (RingHom.ker (RingHom.fst A₁ A₂)) ≃+ RingK0 A₂) := by
  sorry

-- test TauCeti.RelativeK0.RelK0.two_int (non-example)
/- `K₀(2ℤ) = 0`, although `2ℤ ≅ ℤ` as a `ℤ`-module. -/
example : Subsingleton (RelK0 (Ideal.span {(2 : ℤ)})) ∧
    Nonempty ((Ideal.span {(2 : ℤ)} : Ideal ℤ) ≃ₗ[ℤ] ℤ) := by
  sorry

end RelK0

/-- `KTheoryLowDegrees:U.5/ideal-sequence-degree-zero`: there is `∂ : K₁(A/I) → K₀(I)` with
`K₁(A) → K₁(A/I) → K₀(I) → K₀(A) → K₀(A/I)` exact (proof: Milnor patching, a gap). -/
theorem ideal_sequence_degree_zero (I : Ideal A) [I.IsTwoSided] :
    ∃ δ : Additive (K1 (A ⧸ I)) →+ RelK0 I,
      (MonoidHom.toAdditive (K1.map (Ideal.Quotient.mk I))).range = δ.ker ∧
        δ.range = (RelK0.toK0 I).ker ∧
        (RelK0.toK0 I).range = (RingK0.map (Ideal.Quotient.mk I)).ker := by
  sorry

end TauCeti.RelativeK0

/-! ### Transfer and the `K₀`-action: `U.5/transfer`, `U.5/transfer-determinant-norm`,
`U.5/transfer-field-norm`, `U.5/transfer-base-change`, `U.5/K0-action-on-K1`,
`U.5/projection-formula`

The packet's `K1.transfer`, `K1.smulK0`, `K1.dvrBoundary`, … live in namespace `TauCeti.KTheory`,
beside `K₁` itself (`TauCeti.KTheory.K1`), so they are `TauCeti.KTheory.K1.transfer`, …; the
theorem nodes are `TauCeti.KTheory.transfer_determinant_norm`, …. -/

namespace TauCeti.KTheory

section Transfer

variable {A B C : Type u} [Ring A] [Ring B] [Ring C]

/-- `B` as a right `A`-module through `f` (`b · a = b f(a)`), i.e. a left `Aᵐᵒᵖ`-module (helper). -/
abbrev rightRes (f : A →+* B) (M : ModuleCat.{u} Bᵐᵒᵖ) : ModuleCat.{u} Aᵐᵒᵖ :=
  (ModuleCat.restrictScalars (RingHom.op f)).obj M

/-- **The transfer** `f_* : K₁(B) →* K₁(A)` (`KTheoryLowDegrees:U.5/transfer`), for `B` finitely
generated projective as a right `A`-module: `[g] ↦ [res g]` on `Bⁿ` (data, pinned by
`K1.transfer_mk`). -/
def K1.transfer (f : A →+* B)
    (hf : finiteProjectiveModules Aᵐᵒᵖ (rightRes f (ModuleCat.of Bᵐᵒᵖ B))) :
    K1 B →* K1 A :=
  sorry

/-- Helper: `Bⁿ`, restricted to `Aᵐᵒᵖ`, is finitely generated projective. -/
theorem rightRes_free_finiteProjective (f : A →+* B)
    (hf : finiteProjectiveModules Aᵐᵒᵖ (rightRes f (ModuleCat.of Bᵐᵒᵖ B))) (n : ℕ) :
    finiteProjectiveModules Aᵐᵒᵖ (rightRes f (ModuleCat.of Bᵐᵒᵖ (Fin n → B))) := by
  sorry

/-- `f_*[g] = [res g]`: the class of `g`, restricted to `A`, on the right `A`-module `Bⁿ`. -/
theorem K1.transfer_mk (f : A →+* B)
    (hf : finiteProjectiveModules Aᵐᵒᵖ (rightRes f (ModuleCat.of Bᵐᵒᵖ B))) {n : ℕ}
    (g : GL (Fin n) B) :
    K1.transfer f hf (K1.of n g) =
      haveI := (finiteProjectiveModules_iff.mp (rightRes_free_finiteProjective f hf n)).1
      haveI := (finiteProjectiveModules_iff.mp (rightRes_free_finiteProjective f hf n)).2
      autClass (rightRes f (ModuleCat.of Bᵐᵒᵖ (Fin n → B)))
        ((ModuleCat.restrictScalars (RingHom.op f)).mapIso
          (rightModuleAut B n g).toModuleIso).toLinearEquiv := by
  sorry

/-- For `A` commutative, `B` an `A`-algebra (`f = algebraMap A B`) and a basis `b` of `B` over `A`,
`f_*[g]` is the class of the block matrix of the `Algebra.leftMulMatrix b` of the entries of `g`
(given as `G` with its entries pinned). -/
theorem K1.transfer_basis {R S : Type u} [CommRing R] [CommRing S] [Algebra R S] {d : ℕ}
    (b : Module.Basis (Fin d) R S)
    (hf : finiteProjectiveModules Rᵐᵒᵖ (rightRes (algebraMap R S) (ModuleCat.of Sᵐᵒᵖ S))) {n : ℕ}
    (g : GL (Fin n) S) (G : GL (Fin n × Fin d) R)
    (hG : ∀ i j k l, (G : Matrix _ _ R) (i, k) (j, l) =
      Algebra.leftMulMatrix b ((g : Matrix (Fin n) (Fin n) S) i j) k l) :
    K1.transfer (algebraMap R S) hf (K1.of n g) = K1.of (n * d) (glReindex finProdFinEquiv G) := by
  sorry

/-- On units, for `A` commutative and `B` an `A`-algebra (`f = algebraMap A B`),
`f_*[u] = [unitsLeftMulMatrix b u]` (Tau Ceti's `unitsLeftMulMatrix`). -/
@[simp]
theorem K1.transfer_units {R S : Type u} [CommRing R] [CommRing S] [Algebra R S] {d : ℕ}
    (b : Module.Basis (Fin d) R S)
    (hf : finiteProjectiveModules Rᵐᵒᵖ (rightRes (algebraMap R S) (ModuleCat.of Sᵐᵒᵖ S))) (u : Sˣ) :
    K1.transfer (algebraMap R S) hf (K1.ofUnits S u) =
      K1.of d (TauCeti.unitsLeftMulMatrix b u) := by
  sorry

/-- `(id_A)_* = id`. -/
@[simp]
theorem K1.transfer_id (h : finiteProjectiveModules Aᵐᵒᵖ (rightRes (RingHom.id A)
    (ModuleCat.of Aᵐᵒᵖ A))) :
    K1.transfer (RingHom.id A) h = MonoidHom.id (K1 A) := by
  sorry

/-- `(g ∘ f)_* = f_* ∘ g_*`. -/
theorem K1.transfer_comp (f : A →+* B) (g : B →+* C)
    (hf : finiteProjectiveModules Aᵐᵒᵖ (rightRes f (ModuleCat.of Bᵐᵒᵖ B)))
    (hg : finiteProjectiveModules Bᵐᵒᵖ (rightRes g (ModuleCat.of Cᵐᵒᵖ C)))
    (hgf : finiteProjectiveModules Aᵐᵒᵖ (rightRes (g.comp f) (ModuleCat.of Cᵐᵒᵖ C))) :
    K1.transfer (g.comp f) hgf = (K1.transfer f hf).comp (K1.transfer g hg) := by
  sorry

/-- For `B = B₁ × B₂`, `f_* x = (f₁)_*(pr₁ x) · (f₂)_*(pr₂ x)` under `U.2/K1-prod` (`K₁` is written
multiplicatively). -/
theorem K1.transfer_prod {B₁ B₂ : Type u} [Ring B₁] [Ring B₂] (f : A →+* B₁ × B₂)
    (hf : finiteProjectiveModules Aᵐᵒᵖ (rightRes f (ModuleCat.of (B₁ × B₂)ᵐᵒᵖ (B₁ × B₂))))
    (h₁ : finiteProjectiveModules Aᵐᵒᵖ
      (rightRes ((RingHom.fst B₁ B₂).comp f) (ModuleCat.of B₁ᵐᵒᵖ B₁)))
    (h₂ : finiteProjectiveModules Aᵐᵒᵖ
      (rightRes ((RingHom.snd B₁ B₂).comp f) (ModuleCat.of B₂ᵐᵒᵖ B₂))) (x : K1 (B₁ × B₂)) :
    K1.transfer f hf x = K1.transfer _ h₁ (K1.map (RingHom.fst B₁ B₂) x) *
      K1.transfer _ h₂ (K1.map (RingHom.snd B₁ B₂) x) := by
  sorry

-- test TauCeti.KTheory.K1.transfer_id_test (degenerate)
example (h : finiteProjectiveModules Aᵐᵒᵖ (rightRes (RingHom.id A) (ModuleCat.of Aᵐᵒᵖ A))) :
    K1.transfer (RingHom.id A) h = MonoidHom.id (K1 A) :=
  K1.transfer_id h

-- test TauCeti.KTheory.K1.transfer_complex (computation)
/- For `ℝ → ℂ`, under `det`: `f_*(z) = |z|²`; so `f_*(i) = 1` and `f_*(1 + i) = 2`. -/
example (hf : finiteProjectiveModules ℝᵐᵒᵖ (rightRes (algebraMap ℝ ℂ) (ModuleCat.of ℂᵐᵒᵖ ℂ)))
    (z : ℂˣ) :
    (K1.det ℝ (K1.transfer (algebraMap ℝ ℂ) hf (K1.ofUnits ℂ z)) : ℝ) = Complex.normSq (z : ℂ) ∧
      (K1.det ℝ (K1.transfer (algebraMap ℝ ℂ)
          hf (K1.ofUnits ℂ (Units.mk0 Complex.I Complex.I_ne_zero))) :
        ℝ) = 1 := by
  sorry

-- test TauCeti.KTheory.K1.transfer_diagonal (computation)
/- For the diagonal `A → A × A`, `f_*(x, y) = x·y` under `K₁(A × A) ≅ K₁(A) × K₁(A)`. -/
example {R : Type u} [CommRing R]
    (hf : finiteProjectiveModules Rᵐᵒᵖ (rightRes (RingHom.prod (RingHom.id R) (RingHom.id R))
      (ModuleCat.of (R × R)ᵐᵒᵖ (R × R)))) (u v : Rˣ) :
    K1.transfer (RingHom.prod (RingHom.id R) (RingHom.id R)) hf (K1.ofUnits (R × R)
        (MulEquiv.prodUnits.symm (u, v))) =
      K1.ofUnits R (u * v) := by
  sorry

-- test TauCeti.KTheory.K1.transfer_not_norm (non-example)
/- For the projection `k × k → k` (projective, not free): `f_*[x] = ([x], 1)`, whereas
`Algebra.norm (k × k) x = 1` (`Algebra.norm_eq_one_of_not_exists_basis`). -/
example {k : Type u} [Field k]
    (hf : finiteProjectiveModules (k × k)ᵐᵒᵖ (rightRes (RingHom.fst k k) (ModuleCat.of kᵐᵒᵖ k)))
    (x : kˣ) :
    K1.map (RingHom.fst k k) (K1.transfer (RingHom.fst k k) hf (K1.ofUnits k x)) = K1.ofUnits k x ∧
      K1.map (RingHom.snd k k) (K1.transfer (RingHom.fst k k) hf (K1.ofUnits k x)) = 1 ∧
      @Algebra.norm (k × k) k _ _ (RingHom.fst k k).toAlgebra (x : k) = 1 := by
  sorry

-- test TauCeti.KTheory.K1.transfer_field_norm_test (compatibility)
example {K L : Type u} [Field K] [Field L] [Algebra K L] [FiniteDimensional K L]
    (hf : finiteProjectiveModules Kᵐᵒᵖ (rightRes (algebraMap K L) (ModuleCat.of Lᵐᵒᵖ L))) (u : Lˣ) :
    (K1.det K (K1.transfer (algebraMap K L) hf (K1.ofUnits L u)) : K) = Algebra.norm K (u : L) := by
  sorry

/-- `KTheoryLowDegrees:U.5/transfer-determinant-norm`: for `B` free of finite rank over commutative
`A`, `det_A (f_* x) = N_{B/A}(det_B x)` (Mathlib's `Algebra.norm`). -/
theorem transfer_determinant_norm {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    [Module.Free R S] [Module.Finite R S]
    (hf : finiteProjectiveModules Rᵐᵒᵖ (rightRes (algebraMap R S) (ModuleCat.of Sᵐᵒᵖ S)))
        (x : K1 S) :
    (K1.det R (K1.transfer (algebraMap R S) hf x) : R) = Algebra.norm R (K1.det S x : S) := by
  sorry

/-- `KTheoryLowDegrees:U.5/transfer-field-norm`: under `K₁(L) ≅ Lˣ` and `K₁(F) ≅ Fˣ`, the transfer
is the field norm. -/
theorem transfer_field_norm {K L : Type u} [Field K] [Field L] [Algebra K L] [FiniteDimensional K L]
    (hf : finiteProjectiveModules Kᵐᵒᵖ (rightRes (algebraMap K L) (ModuleCat.of Lᵐᵒᵖ L))) (u : Lˣ) :
    (K1.det K (K1.transfer (algebraMap K L) hf (K1.ofUnits L u)) : K) = Algebra.norm K (u : L) := by
  sorry

/-- `KTheoryLowDegrees:U.5/transfer-base-change`: `f'_* ∘ K₁(B → A' ⊗_A B) = K₁(A → A') ∘ f_*`. -/
theorem transfer_base_change {R R' S : Type u} [CommRing R] [CommRing R'] [CommRing S]
    [Algebra R R'] [Algebra R S]
    (hf : finiteProjectiveModules Rᵐᵒᵖ (rightRes (algebraMap R S) (ModuleCat.of Sᵐᵒᵖ S)))
    (hf' : finiteProjectiveModules R'ᵐᵒᵖ (rightRes (algebraMap R' (R' ⊗[R] S))
      (ModuleCat.of (R' ⊗[R] S)ᵐᵒᵖ (R' ⊗[R] S)))) :
    (K1.transfer (algebraMap R' (R' ⊗[R] S)) hf').comp
        (K1.map (Algebra.TensorProduct.includeRight (R := R) (A := R') (B := S)).toRingHom) =
      (K1.map (algebraMap R R')).comp (K1.transfer (algebraMap R S) hf) := by
  sorry

end Transfer

section K0Action

variable (A : Type u) [CommRing A] (B : Type u) [Ring B] [Algebra A B]

/-- **`K₁(B)` over `K₀(A)`** (`KTheoryLowDegrees:U.5/K0-action-on-K1`): the biadditive pairing
`K₀(A) × K₁(B) → K₁(B)`, `[P]·[β] = [1_P ⊗ β]` (data, pinned for commutative `B` by
`K1.smulK0_class`). -/
def K1.smulK0 : RingK0 A →+ Additive (K1 B) →+ Additive (K1 B) :=
  sorry

/-- The automorphism `(qⱼ) ↦ (Σⱼ βᵢⱼ qⱼ)` of `Qᵐ` for `β ∈ GL_m(B)`, `B` commutative (helper; the
matrix of `1_Q ⊗ β` on `Q ⊗_B Bᵐ = Qᵐ`). -/
def matrixAct {R : Type u} [CommRing R] (Q : Type u) [AddCommGroup Q] [Module R Q] {m : ℕ}
    (β : GL (Fin m) R) : (Fin m → Q) ≃ₗ[R] (Fin m → Q) where
  toFun v i := ∑ j, (β : Matrix (Fin m) (Fin m) R) i j • v j
  invFun v i := ∑ j, ((β⁻¹ : GL (Fin m) R) : Matrix (Fin m) (Fin m) R) i j • v j
  map_add' := by sorry
  map_smul' := by sorry
  left_inv := by sorry
  right_inv := by sorry

/-- For commutative `B`: `[P]·[β]` is the class of `1 ⊗ β` on `(B ⊗_A P)ᵐ`. -/
@[simp]
theorem K1.smulK0_class {S : Type u} [CommRing S] [Algebra A S] (P : Type u) [AddCommGroup P]
    [Module A P] [Module.Finite A P] [Module.Projective A P] {m : ℕ} (β : GL (Fin m) S)
    [Module.Projective S (Fin m → S ⊗[A] P)] :
    K1.smulK0 A S (RingK0.of A P) (Additive.ofMul (K1.of m β)) =
      Additive.ofMul (autClassComm (Fin m → S ⊗[A] P) (matrixAct (S ⊗[A] P) β)) := by
  sorry

-- `TauCeti.KTheory.K1.module`: not stated here; needs the ring structure on `RingK0 A` (the
-- monoidal structure of `finiteProjectiveModules A`) (supplier:
-- `KTheoryLowDegrees:Z.3/finite-projective-monoidal`).

/-- `[A]·x = x`. -/
@[simp]
theorem K1.one_smulK0 (x : Additive (K1 B)) : K1.smulK0 A B (RingK0.of A A) x = x := by
  sorry

/-- `K₁(B) → K₁(B')` is `K₀(A)`-linear for an `A`-algebra map `B → B'`. -/
theorem K1.smulK0_map {B' : Type u} [Ring B'] [Algebra A B'] (g : B →ₐ[A] B') (y : RingK0 A)
    (x : Additive (K1 B)) :
    Additive.ofMul (K1.map g.toRingHom (Additive.toMul (K1.smulK0 A B y x))) =
      K1.smulK0 A B' y (Additive.ofMul (K1.map g.toRingHom (Additive.toMul x))) := by
  sorry

/-- For `B` commutative and `P` of constant rank `r`, `det([P]·x) = det(x)^r`. -/
theorem K1.det_smulK0 {S : Type u} [CommRing S] [Algebra A S] (P : Type u)
    [AddCommGroup P] [Module A P]
    [Module.Finite A P] [Module.Projective A P] (r : ℕ) (hP : ∀ p, Module.rankAtStalk (R := A)
        P p = r)
    (x : Additive (K1 S)) :
    K1.det S (Additive.toMul (K1.smulK0 A S (RingK0.of A P) x)) =
      K1.det S (Additive.toMul x) ^ r := by
  sorry

-- test TauCeti.KTheory.K1.smulK0_free (computation)
example (n : ℕ) (x : Additive (K1 B)) : K1.smulK0 A B (RingK0.of A (Fin n → A)) x = n • x := by
  sorry

-- test TauCeti.KTheory.K1.smulK0_zero (degenerate)
example (x : Additive (K1 B)) : K1.smulK0 A B 0 x = 0 ∧ K1.smulK0 A B (RingK0.of A A) x = x :=
  ⟨by rw [map_zero, AddMonoidHom.zero_apply], K1.one_smulK0 A B x⟩

-- test TauCeti.KTheory.K1.smulK0_ideal_units (computation)
/- For `R = ℤ[√−5]` and `𝔞 = (2, 1 + √−5)`: `[𝔞]·[-1] = [-1]`. -/
example [Module.Finite (Zsqrtd (-5)) (Ideal.span {2, 1 + Zsqrtd.sqrtd} : Ideal (Zsqrtd (-5)))]
    [Module.Projective (Zsqrtd (-5)) (Ideal.span {2, 1 + Zsqrtd.sqrtd} : Ideal (Zsqrtd (-5)))] :
    K1.smulK0 (Zsqrtd (-5)) (Zsqrtd (-5))
        (RingK0.of _ (Ideal.span {2, 1 + Zsqrtd.sqrtd} : Ideal (Zsqrtd (-5))))
        (Additive.ofMul (K1.ofUnits _ (-1))) =
      Additive.ofMul (K1.ofUnits _ (-1)) := by
  sorry

-- test TauCeti.KTheory.K1.smulK0_kbook (compatibility)
/- The K-book's product `[P]·β` of Corollary III.1.6.1 (commutative case). -/
example {S : Type u} [CommRing S] [Algebra A S] (P : Type u) [AddCommGroup P] [Module A P]
    [Module.Finite A P] [Module.Projective A P] {m : ℕ} (β : GL (Fin m) S)
    [Module.Projective S (Fin m → S ⊗[A] P)] :
    K1.smulK0 A S (RingK0.of A P) (Additive.ofMul (K1.of m β)) =
      Additive.ofMul (autClassComm (Fin m → S ⊗[A] P) (matrixAct (S ⊗[A] P) β)) :=
  K1.smulK0_class A P β

/-- **The projection formula** (`KTheoryLowDegrees:U.5/projection-formula`), for `B` a commutative
`A`-algebra, finitely generated projective over `A`: (a) `f_*(f^*x · y) = x · f_*y`;
(b) `f_*(y · f^*z) = f_*y · z`; (c) `f_* f^* z = [B] · z`. -/
theorem projection_formula {S : Type u} [CommRing S] [Algebra A S]
    (hf : finiteProjectiveModules Aᵐᵒᵖ (rightRes (algebraMap A S) (ModuleCat.of Sᵐᵒᵖ S)))
    (hf' : finiteProjectiveModules A
      ((ModuleCat.restrictScalars (algebraMap A S)).obj (ModuleCat.of S S))) :
    (∀ (x : RingK0 A) (y : K1 S),
      K1.transfer (algebraMap A S) hf (Additive.toMul (K1.smulK0 S S (RingK0.map (algebraMap A S) x)
        (Additive.ofMul y))) =
        Additive.toMul (K1.smulK0 A A x (Additive.ofMul (K1.transfer (algebraMap A S) hf y)))) ∧
      (∀ (y : RingK0 S) (z : K1 A),
        K1.transfer (algebraMap A S) hf (Additive.toMul (K1.smulK0 S S y
          (Additive.ofMul (K1.map (algebraMap A S) z)))) =
          Additive.toMul (K1.smulK0 A A (RingK0.transfer (algebraMap A S) hf' y)
            (Additive.ofMul z))) ∧
      ∀ z : K1 A, K1.transfer (algebraMap A S) hf (K1.map (algebraMap A S) z) =
        Additive.toMul (K1.smulK0 A A
          (SplitK0.of ⟨(ModuleCat.restrictScalars (algebraMap A S)).obj (ModuleCat.of S S), hf'⟩)
          (Additive.ofMul z)) := by
  sorry

end K0Action

/-! ### `KTheoryLowDegrees:U.5/dvr-boundary`, `U.5/dvr-boundary-valuation`,
`U.5/dvr-units-sequence` -/

section DVR

variable (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] (L : Type u) [Field L]
  [Algebra O L] [IsFractionRing O L]

/-- **The boundary** `∂ : K₁(L) → K₀(k)` of a DVR (`KTheoryLowDegrees:U.5/dvr-boundary`):
`∂[g] = (ℓ(Oⁿ/αOⁿ) - n ℓ(O/sO))·[k]` for `α = s g ∈ Mₙ(O)` (data, pinned by `K1.dvrBoundary_mk`);
normalised by `∂(π) = [k]`. -/
def K1.dvrBoundary : Additive (K1 L) →+ RingK0 (IsLocalRing.ResidueField O) :=
  sorry

variable {O L}

/-- `∂[g] = (ℓ(coker (s g)) - n ℓ(O/sO))·[k]`. -/
@[simp]
theorem K1.dvrBoundary_mk {n : ℕ} (g : GL (Fin n) L) (s : O) (hs : s ≠ 0)
    (α : Matrix (Fin n) (Fin n) O)
    (hα : α.map (algebraMap O L) = algebraMap O L s • (g : Matrix (Fin n) (Fin n) L)) :
    K1.dvrBoundary O L (Additive.ofMul (K1.of n g)) =
      (((Module.length O ((Fin n → O) ⧸ LinearMap.range (Matrix.mulVecLin α))).toNat : ℤ) -
        n * (Module.length O (O ⧸ Ideal.span {s})).toNat) •
        RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) := by
  sorry

/-- For `α ∈ Mₙ(O)` invertible over `L`, `∂[α] = ℓ(coker α)·[k]`. -/
@[simp]
theorem K1.dvrBoundary_integral {n : ℕ} (α : Matrix (Fin n) (Fin n) O) (g : GL (Fin n) L)
    (hg : (g : Matrix (Fin n) (Fin n) L) = α.map (algebraMap O L)) :
    K1.dvrBoundary O L (Additive.ofMul (K1.of n g)) =
      ((Module.length O ((Fin n → O) ⧸ LinearMap.range (Matrix.mulVecLin α))).toNat : ℤ) •
        RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) := by
  sorry

/-- `∂ ∘ K₁(O → L) = 0`. -/
@[simp]
theorem K1.dvrBoundary_map_O :
    (K1.dvrBoundary O L).comp (MonoidHom.toAdditive (K1.map (algebraMap O L))) = 0 := by
  sorry

/-- `∂[π] = [k]` for any uniformiser `π`. -/
@[simp]
theorem K1.dvrBoundary_uniformizer (π : O) (hπ : Irreducible π) :
    K1.dvrBoundary O L (Additive.ofMul (K1.ofUnits L (Units.mk0 (algebraMap O L π)
      ((map_ne_zero_iff _ (IsFractionRing.injective O L)).mpr hπ.ne_zero)))) =
      RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) := by
  sorry

/-- `∂(x) = v(det x)·[k]`, the valuation read through `det x = u πⁿ`
(`U.5/dvr-boundary-valuation`). -/
theorem K1.dvrBoundary_eq_valuation (x : K1 L) (u : Oˣ) (π : O) (hπ : Irreducible π) (n : ℤ)
    (hx : (K1.det L x : L) = algebraMap O L u * algebraMap O L π ^ n) :
    K1.dvrBoundary O L (Additive.ofMul x) =
      n • RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) := by
  sorry

/-- `KTheoryLowDegrees:U.5/dvr-boundary-valuation`: `∂(x) = v(det x)·[k]`; so `∂(uπⁿ) = n[k]`, and
`∂` does not depend on the uniformiser. -/
theorem dvr_boundary_valuation (x : K1 L) (u : Oˣ) (π : O) (hπ : Irreducible π) (n : ℤ)
    (hx : (K1.det L x : L) = algebraMap O L u * algebraMap O L π ^ n) :
    K1.dvrBoundary O L (Additive.ofMul x) =
      n • RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) :=
  K1.dvrBoundary_eq_valuation x u π hπ n hx

/-- `KTheoryLowDegrees:U.5/dvr-units-sequence`: `1 → K₁(O) → K₁(L) →∂ K₀(k) → 0` is exact, and the
next map `K₀(k) → K₀(O)`, `[k] ↦ [O] - [πO]`, vanishes. -/
theorem dvr_units_sequence (π : O) (hπ : Irreducible π) [Module.Finite O (Ideal.span {π})]
    [Module.Projective O (Ideal.span {π})] :
    Function.Injective (K1.map (algebraMap O L)) ∧
      (MonoidHom.toAdditive (K1.map (algebraMap O L))).range = (K1.dvrBoundary O L).ker ∧
      Function.Surjective (K1.dvrBoundary O L) ∧
      RingK0.of O O - RingK0.of O (Ideal.span {π}) = 0 := by
  sorry

-- test TauCeti.KTheory.K1.dvrBoundary_padic (computation)
/- `O = ℤ_(p)` modelled as a DVR with fraction field `ℚ` in which `p` is a uniformiser:
`∂(p) = [𝔽_p]`, `∂(1/p) = -[𝔽_p]`, and for `p = 2`, `∂(12) = 2[𝔽_p]`. -/
example (O : Type) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Algebra O ℚ]
    [IsFractionRing O ℚ] (p : ℕ) (hp : Irreducible (p : O)) (hp0 : (p : ℚ) ≠ 0) :
    K1.dvrBoundary O ℚ (Additive.ofMul (K1.ofUnits ℚ (Units.mk0 (p : ℚ) hp0))) =
        RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) ∧
      K1.dvrBoundary O ℚ (Additive.ofMul (K1.ofUnits ℚ (Units.mk0 (p : ℚ) hp0)⁻¹)) =
        -RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) ∧
      (p = 2 → K1.dvrBoundary O ℚ (Additive.ofMul (K1.ofUnits ℚ (Units.mk0 12 (by norm_num)))) =
        2 • RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O)) := by
  sorry

-- test TauCeti.KTheory.K1.dvrBoundary_units (degenerate)
example (x : K1 O) : K1.dvrBoundary O L (Additive.ofMul (K1.map (algebraMap O L) x)) = 0 := by
  sorry

-- test TauCeti.KTheory.K1.dvrBoundary_matrix (computation)
/- `g = (π 1; 0 1)`: `coker g = O/π`, so `∂[g] = [k]`; `∂[diag(π, π⁻¹)] = 0`. -/
example (π : O) (hπ : Irreducible π) (g : GL (Fin 2) L)
    (hg : (g : Matrix (Fin 2) (Fin 2) L) = !![algebraMap O L π, 1; 0, 1]) (πL : Lˣ)
    (hπL : (πL : L) = algebraMap O L π) :
    K1.dvrBoundary O L (Additive.ofMul (K1.of 2 g)) =
        RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) ∧
      K1.dvrBoundary O L (Additive.ofMul (K1.of 2 (diagUnit ![πL, πL⁻¹]))) = 0 := by
  sorry

-- test TauCeti.KTheory.K1.dvrBoundary_not_entry (non-example)
/- `g = (π 1; 0 1)` has an off-diagonal entry of valuation `0`, yet `∂[g] = v(det g) = 1`: an
entrywise definition fails. -/
example (π : O) (hπ : Irreducible π) (g : GL (Fin 2) L)
    (hg : (g : Matrix (Fin 2) (Fin 2) L) = !![algebraMap O L π, 1; 0, 1]) :
    K1.dvrBoundary O L (Additive.ofMul (K1.of 2 g)) =
      RingK0.of (IsLocalRing.ResidueField O) (IsLocalRing.ResidueField O) := by
  sorry

-- test TauCeti.KTheory.K1.dvrBoundary_power_series (compatibility)
/- `O = k[[t]]`: `∂(t) = [k]`, agreeing with `IsDiscreteValuationRing.addVal_uniformizer`. -/
example (k : Type u) [Field k]
    (ht : (algebraMap (PowerSeries k) (LaurentSeries k) PowerSeries.X) ≠ 0) :
    K1.dvrBoundary (PowerSeries k) (LaurentSeries k)
        (Additive.ofMul (K1.ofUnits _ (Units.mk0 _ ht))) =
      RingK0.of (IsLocalRing.ResidueField (PowerSeries k))
          (IsLocalRing.ResidueField (PowerSeries k)) ∧
      IsDiscreteValuationRing.addVal (PowerSeries k) PowerSeries.X = 1 := by
  sorry

end DVR

end TauCeti.KTheory

/-! ## Stage `KTheoryLowDegrees:U.6` — `π₁BGL(A)⁺` and computations

The four comparison nodes with the plus construction need spaces that neither Mathlib nor Tau Ceti
provides at the pinned commits; they are recorded as comments naming their suppliers. The
computations are stated through U.2's `K₁`, U.3's `det` and `SK₁`, and U.5's boundary, in namespace
`TauCeti.KTheory` beside `K₁`. -/

namespace TauCeti.KTheory

/-! ### `U.6/pi1-plus-construction`, `U.6/pi1-plus-determinant`, `U.6/pi1-plus-transfer` -/

-- `TauCeti.KTheory.pi1_plus_construction` (`KTheoryLowDegrees:U.6/pi1-plus-construction`): not
-- stated here; needs the classifying space `BGL(A)`, a plus construction `BGL(A)⁺` relative to
-- `E(A)` and `π₁` of the result as a group with the map `K₁(A) ≃* π₁BGL(A)⁺` (supplier:
-- `StableHomotopyKTheory:H.1/nerve-and-classifying-space`,
-- `StableHomotopyKTheory:H.3/plus-construction-by-cell-attachment`,
-- `StableHomotopyKTheory:H.3/plus-construction-universal-property`,
-- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`). Suggested form, once they exist:
-- `K1.equivPiOnePlus A : K1 A ≃* π₁ (BGL⁺ A)`, natural in `A` via `K1.map`.

-- `TauCeti.KTheory.pi1_plus_determinant` (`KTheoryLowDegrees:U.6/pi1-plus-determinant`): not
-- stated here; needs `BGL(A)⁺`, `B(Aˣ)` and the factorisation `BGL(A)⁺ → B(Aˣ)` of `B det`
-- (supplier: `StableHomotopyKTheory:H.1/nerve-and-classifying-space`,
-- `StableHomotopyKTheory:H.3/plus-construction-universal-property`). Suggested form: the induced
-- map on `π₁` composed with `K1.equivPiOnePlus A` is `K1.det A`.

-- `TauCeti.KTheory.pi1_plus_transfer` (`KTheoryLowDegrees:U.6/pi1-plus-transfer`): not stated
-- here; needs `BGL(A)⁺`, the map `Bρ⁺ : BGL(B)⁺ → BGL(A)⁺` of the restriction `ρ : GL(B) → GL(A)`
-- and `π₁` (supplier: `StableHomotopyKTheory:H.3/plus-construction-universal-property`).
-- Suggested form: the induced map on `π₁`, read through `K1.equivPiOnePlus`, is `K1.transfer f hf`
-- of U.5.

end TauCeti.KTheory

namespace TauCeti.RelativeK1

-- `TauCeti.RelativeK1.relative_K1_homotopy_comparison`
-- (`KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`): not stated here; needs the K-theory
-- spaces `K(A)`, the homotopy fibre `K(A, I)` of `K(A) → K(A/I)` and its homotopy groups `π₀`, `π₁`
-- (supplier: `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`,
-- `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`; the proof also needs
-- `K2SymbolsBrauer:T.1` and `T.6`). Suggested form: `RelK1 I ≃* π₁ (K(A, I))` and
-- `RelativeK0.RelK0 I ≃+ π₀ (K(A, I))`, compatible with `RelK1.toK1` and `RelativeK0.RelK0.toK0`.

end TauCeti.RelativeK1

namespace TauCeti.KTheory

/-! ### `U.6/euclidean-elementary-generation`, `U.6/localised-integers-euclidean` -/

/-- `KTheoryLowDegrees:U.6/euclidean-elementary-generation`: let `R` be a commutative ring with a
Euclidean division, i.e. a well-founded relation `rel` such that for all `x` and all `y ≠ 0` there
are `q, ρ` with `x = q * y + ρ` and `ρ = 0 ∨ rel ρ y` (a `Prop`, so no new `EuclideanDomain`
instance is needed; every Mathlib `EuclideanDomain` has one,
`euclideanDivision_of_euclideanDomain`). Then `SL_n(R) = E_n(R)` for every `n`; hence
`SL(R) = E(R)`, `SK₁(R) = 0` and `det : K₁(R) ≅ Rˣ`. For `R = ℤ` this is Tau Ceti's
`Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top`. -/
theorem euclidean_elementary_generation (R : Type u) [CommRing R] (rel : R → R → Prop)
    (hrel : WellFounded rel)
    (hdiv : ∀ x y : R, y ≠ 0 → ∃ q ρ, x = q * y + ρ ∧ (ρ = 0 ∨ rel ρ y)) :
    (∀ n : ℕ, (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin n) R →* GL (Fin n)
        R).range =
      elementarySubgroup (Fin n) R) ∧
      StableGL.specialLinear R = StableGL.elementary R ∧ SK1 R = ⊥ ∧
      Function.Bijective (K1.det R) := by
  sorry

/-- Every Mathlib `EuclideanDomain` has a Euclidean division in the sense of
`euclidean_elementary_generation`, for its relation `EuclideanDomain.r` (helper, a real proof:
`EuclideanDomain.r_wellFounded`, `div_add_mod'` and `mod_lt`). -/
theorem euclideanDivision_of_euclideanDomain (R : Type u) [EuclideanDomain R] :
    WellFounded (EuclideanDomain.r : R → R → Prop) ∧
      ∀ x y : R, y ≠ 0 → ∃ q ρ, x = q * y + ρ ∧ (ρ = 0 ∨ EuclideanDomain.r ρ y) :=
  ⟨EuclideanDomain.r_wellFounded, fun x y hy =>
    ⟨x / y, x % y, (EuclideanDomain.div_add_mod' x y).symm, Or.inr (EuclideanDomain.mod_lt x hy)⟩⟩

-- Not a packet test: `euclidean_elementary_generation` applies to any Mathlib `EuclideanDomain`.
example (R : Type u) [EuclideanDomain R] : SK1 R = ⊥ :=
  (euclidean_elementary_generation R _ (euclideanDivision_of_euclideanDomain R).1
    (euclideanDivision_of_euclideanDomain R).2).2.2.1

/-- `KTheoryLowDegrees:U.6/localised-integers-euclidean`: for `m ≥ 1`, `ℤ[1/m]` (Mathlib's
`Localization.Away (m : ℤ)`) has a Euclidean division in the sense of
`euclidean_elementary_generation` for the relation `φ x < φ y`, where `φ 0 = 0` and `φ (u·a) = |a|`
for `u` a unit and `a` coprime to `m`. -/
theorem localised_integers_euclidean (m : ℕ) (hm : 1 ≤ m) :
    ∃ φ : Localization.Away (m : ℤ) → ℕ, φ 0 = 0 ∧
      (∀ (u : (Localization.Away (m : ℤ))ˣ) (a : ℤ), a ≠ 0 → IsCoprime a (m : ℤ) →
        φ (u * algebraMap ℤ _ a) = a.natAbs) ∧
      WellFounded (fun x y : Localization.Away (m : ℤ) => φ x < φ y) ∧
      ∀ x y : Localization.Away (m : ℤ), y ≠ 0 →
        ∃ q r, x = q * y + r ∧ (r = 0 ∨ φ r < φ y) := by
  sorry

/-! ### `U.6/K1-integers`, `U.6/K1-finite-field` -/

/-- `KTheoryLowDegrees:U.6/K1-integers`: `det : K₁(ℤ) ≅ {±1}`, `SK₁(ℤ) = 0`; the class of
`(-1) ∈ GL₁(ℤ)` generates, and `diag(-1, -1)` has trivial class. -/
theorem k1_integers :
    Function.Bijective (K1.det ℤ) ∧ SK1 ℤ = ⊥ ∧ Nat.card (K1 ℤ) = 2 ∧
      K1.ofUnits ℤ (-1) ≠ 1 ∧ (∀ x : K1 ℤ, x = 1 ∨ x = K1.ofUnits ℤ (-1)) ∧
      K1.of 2 (diagUnit ![-1, -1] : GL (Fin 2) ℤ) = 1 := by
  sorry

/-- `KTheoryLowDegrees:U.6/K1-finite-field`: `det : K₁(𝔽_q) ≅ 𝔽_qˣ`, cyclic of order `q - 1`; and in
each rank `n ≥ 1`, `SL_n(𝔽_q) = E_n(𝔽_q)` and `GL_n(𝔽_q) → K₁(𝔽_q)` is onto with kernel
`SL_n(𝔽_q)`. -/
theorem k1_finite_field (F : Type u) [Field F] [Fintype F] :
    Function.Bijective (K1.det F) ∧ IsCyclic (K1 F) ∧ Nat.card (K1 F) = Fintype.card F - 1 ∧
      ∀ n : ℕ, 1 ≤ n →
        (Matrix.SpecialLinearGroup.toGL : Matrix.SpecialLinearGroup (Fin n) F →* GL (Fin n)
            F).range =
          elementarySubgroup (Fin n) F ∧
        Function.Surjective (K1.of n : GL (Fin n) F →* K1 F) ∧
        (K1.of n : GL (Fin n) F →* K1 F).ker = (Matrix.GeneralLinearGroup.det).ker := by
  sorry

/-! ### `U.6/units-of-integers-away-from-p`, `U.6/K1-integers-away-from-p` -/

/-- `p` as a unit of `ℤ[1/p]` (helper, a real definition). -/
def unitAway (p : ℕ) : (Localization.Away (p : ℤ))ˣ :=
  (IsLocalization.Away.algebraMap_isUnit (p : ℤ)).unit

/-- `KTheoryLowDegrees:U.6/units-of-integers-away-from-p`: `ℤ[1/p]ˣ = {±pᵏ}`, and
`(sign, v_p) : ℤ[1/p]ˣ ≃* {±1} × ℤ`. -/
theorem units_of_integers_away_from_p (p : ℕ) [Fact p.Prime] :
    (∀ u : (Localization.Away (p : ℤ))ˣ, ∃ (ε : ℤˣ) (k : ℤ),
      u = Units.map (algebraMap ℤ (Localization.Away (p : ℤ))).toMonoidHom ε * unitAway p ^ k) ∧
      ∃ e : (Localization.Away (p : ℤ))ˣ ≃* ℤˣ × Multiplicative ℤ,
        e (-1) = (-1, 1) ∧ e (unitAway p) = (1, Multiplicative.ofAdd 1) := by
  sorry

/-- `KTheoryLowDegrees:U.6/K1-integers-away-from-p`: `det : K₁(ℤ[1/p]) ≅ {±1} × p^ℤ ≅ ℤ/2 ⊕ ℤ`,
`SK₁(ℤ[1/p]) = 0`; `[-1]` generates the torsion and `[p]` the free part. The first two parts are
`euclidean_elementary_generation` applied to `localised_integers_euclidean` (proved so below). -/
theorem k1_integers_away_from_p (p : ℕ) [Fact p.Prime] :
    Function.Bijective (K1.det (Localization.Away (p : ℤ))) ∧ SK1 (Localization.Away (p : ℤ)) = ⊥ ∧
      ∃ e : K1 (Localization.Away (p : ℤ)) ≃* ℤˣ × Multiplicative ℤ,
        e (K1.ofUnits _ (-1)) = (-1, 1) ∧
            e (K1.ofUnits _ (unitAway p)) = (1, Multiplicative.ofAdd 1) := by
  obtain ⟨φ, -, -, hwf, hdiv⟩ := localised_integers_euclidean p (Fact.out : p.Prime).one_lt.le
  obtain ⟨-, -, hSK1, hdet⟩ := euclidean_elementary_generation _ _ hwf hdiv
  refine ⟨hdet, hSK1, ?_⟩
  sorry

/-! ### `U.6/K1-product-of-fields` -/

/-- `KTheoryLowDegrees:U.6/K1-product-of-fields`: `K₁(F₁ × ⋯ × F_r) ≅ F₁ˣ × ⋯ × F_rˣ`, by the two
routes `U.2/K1-pi` + `det` factorwise and `det` of the semilocal product with `MulEquiv.piUnits`,
which agree. -/
theorem k1_product_of_fields {ι : Type} [Finite ι] (F : ι → Type u) [∀ i, Field (F i)] :
    ∃ e : K1 (∀ i, F i) ≃* ∀ i, (F i)ˣ,
      (∀ x, e x = fun i => K1.det (F i) (K1.map (Pi.evalRingHom F i) x)) ∧
        ∀ x, e x = MulEquiv.piUnits (K1.det (∀ i, F i) x) := by
  sorry

/-! ### `U.6/triangular-determinant-class`, `U.6/diagonal-inverse-pair-test` -/

/-- `KTheoryLowDegrees:U.6/triangular-determinant-class`: for commutative `A` and `g ∈ GL_n(A)`
upper or lower triangular, the diagonal entries are units, `det g = ∏ gᵢᵢ`, and `[g] = [det g]` is
the class of a unit (Tau Ceti's `Matrix.BlockTriangular.det_eq_prod_diag`). -/
theorem triangular_determinant_class {A : Type u} [CommRing A] {n : ℕ} (g : GL (Fin n) A)
    (hg : (g : Matrix (Fin n) (Fin n) A).BlockTriangular id ∨
      (g : Matrix (Fin n) (Fin n) A).BlockTriangular OrderDual.toDual) :
    (∀ i, IsUnit ((g : Matrix (Fin n) (Fin n) A) i i)) ∧
      ((Matrix.GeneralLinearGroup.det g : Aˣ) : A) = ∏ i, (g : Matrix (Fin n) (Fin n) A) i i ∧
      K1.of n g = K1.ofUnits A (Matrix.GeneralLinearGroup.det g) := by
  sorry

/-- `KTheoryLowDegrees:U.6/diagonal-inverse-pair-test`: `diag(g, g⁻¹) ∈ E_{2n}(A)` with trivial
class, while `[diag(g, 1)] = [g]`; over `ℤ`, `[diag(-1, -1)] = 1 ≠ [diag(-1, 1)]`; and for
commutative `R`, `diag(a, a⁻¹)` (Tau Ceti's `diag2nUnit`) lies in `E₂(R)`. -/
theorem diagonal_inverse_pair_test {A : Type u} [Ring A] {n : ℕ} (g : GL (Fin n) A) :
    blockSum (g, g⁻¹) ∈ elementarySubgroup (Fin (n + n)) A ∧
      K1.of (n + n) (blockSum (g, g⁻¹)) = 1 ∧ K1.of (n + n) (blockSum (g, 1)) = K1.of n g ∧
      K1.of 2 (diagUnit ![-1, -1] : GL (Fin 2) ℤ) = 1 ∧
      K1.of 2 (diagUnit ![-1, 1] : GL (Fin 2) ℤ) ≠ 1 ∧
      ∀ (R : Type u) [CommRing R] (a : Rˣ),
        Matrix.SpecialLinearGroup.toGL
            (Matrix.SpecialLinearGroup.diag2nUnit (by decide : (0 : Fin 2) ≠ 1) a) ∈
          elementarySubgroup (Fin 2) R := by
  sorry

/-! ### `U.6/uniformiser-boundary-one` -/

/-- `KTheoryLowDegrees:U.6/uniformiser-boundary-one`: `∂(π) = [k] ↦ 1` under `K₀(k) ≅ ℤ`, and
`∂(uπ) = 1` for every unit `u`, so the value does not depend on the uniformiser. -/
theorem uniformiser_boundary_one (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (L : Type u) [Field L] [Algebra O L] [IsFractionRing O L] (π : O) (hπ : Irreducible π)
    (u : Oˣ) :
    RingK0.divisionRingEquiv (IsLocalRing.ResidueField O)
        (K1.dvrBoundary O L (Additive.ofMul (K1.ofUnits L (Units.mk0 (algebraMap O L π)
          ((map_ne_zero_iff _ (IsFractionRing.injective O L)).mpr hπ.ne_zero))))) = 1 ∧
      RingK0.divisionRingEquiv (IsLocalRing.ResidueField O)
        (K1.dvrBoundary O L (Additive.ofMul (K1.ofUnits L (Units.mk0 (algebraMap O L (u * π))
          ((map_ne_zero_iff _ (IsFractionRing.injective O L)).mpr
            (mul_ne_zero u.ne_zero hπ.ne_zero)))))) = 1 := by
  sorry

end TauCeti.KTheory
