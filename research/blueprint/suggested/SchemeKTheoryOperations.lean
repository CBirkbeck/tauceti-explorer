import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Free
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.Double
import Mathlib.Algebra.Homology.Embedding.CochainComplex
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.Algebra.Unitization
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.MvPolynomial.Symmetric.NewtonIdentities
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Sites.BigZariski
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.Analysis.Complex.Basic
import Mathlib.RingTheory.Ideal.AssociatedPrime.Basic
import Mathlib.RingTheory.Ideal.Height
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.Topology.KrullDimension
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Scheme
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Topology.Sheaves.Flasque
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.ObjectProperty.Retract
import Mathlib.CategoryTheory.Retract
import Mathlib.CategoryTheory.Triangulated.Subcategory
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Support
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.RingTheory.ClassGroup.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.CategoryTheory.Exact.Frobenius
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated
import TauCeti.RingTheory.MvPolynomial.Symmetric.Substitution
import TauCeti.AlgebraicGeometry.LineBundle.Class

/-!
# Suggested Lean forms for `SchemeKTheoryOperations` (stages S.1–S.7)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/SchemeKTheoryOperations.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures; they claim
no implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` against the Mathlib `082e2d3` of a local project, with the imported Tau Ceti
modules compiled from the pinned `f790474` sources into a directory placed first on `LEAN_PATH`;
the only warnings are uses of sorry.

## Pinned conventions

* **Perfect complexes are defined locally**: a complex of `𝒪_X`-modules is perfect if on the
  members of an open cover it is quasi-isomorphic to a strictly perfect complex (bounded, of finite
  locally free modules) (`TauCeti.AlgebraicGeometry.Scheme.IsPerfect`; Stacks 08CM, TT 2.2.10).
  No global resolution is assumed.
* **`K(X)` is the K-theory of the perfect complexes and `G(X)` that of the coherent sheaves** on a
  noetherian `X`. Only the degree-zero groups are formed here: `Scheme.K0 X` is Tau Ceti's
  triangulated `K₀` of `D_perf(𝒪_X)`, `Scheme.G0 X` Tau Ceti's exact `K₀` of the coherent sheaves
  and `Scheme.K0Vect X` that of the vector bundles.
* **The localisation boundary is right-linear**: `∂ : K_n(U on U ∩ Z) → K_{n-1}(X on Y ∩ Z)`
  satisfies `∂(x · j^* y) = ∂(x) · y`, with the sign normalised by `∂(λ(π)) = +[k]` for a DVR with
  uniformiser `π` and residue field `k` (`S.3/localisation-boundary`); the left-linear
  normalisation is `(-1)^{n-1} ∂`.
* **λ-rings are special λ-rings** (Grothendieck's λ-anneaux; `TauCeti.LambdaRing`, over the pre-λ
  `TauCeti.PreLambdaRing`), and the **Adams operations are defined by the Newton formula**
  `ψ^k = N_k(λ^1, …, λ^k)` (`TauCeti.LambdaRing.adams`).
* **K-book locators**: PDF page = book page + 8.
* An `𝒪_X`-module is an object of Mathlib's `X.Modules`, a complex a `CochainComplex X.Modules ℤ`,
  and `D(𝒪_X)` Mathlib's `DerivedCategory X.Modules` under the hypothesis
  `[∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]`.

## Library declarations imported and reused

* Tau Ceti: `TauCeti.ExactK0` with `ExactK0.of` and `ExactK0.map`, `TauCeti.TriangulatedK0` with
  `of` and `map`, `TauCeti.SplitK0` with `SplitK0.of` (the ring `K₀` of `KTheoryLowDegrees--U.1`),
  `TauCeti.ExactStructure.abelian`, `ExactStructure.fullSubcategory`,
  `ExactStructure.IsExtensionClosed`, `ExactStructure.isConflationExact_ιOfLE`,
  `ExactStructure.IsFrobenius`, `ExactStructure.admitsFiniteResolution`,
  `TauCeti.finiteProjectiveModules`, `finiteProjectiveModulesExactStructure`,
  `finiteModulesExactStructure`, `TauCeti.cartanMap`, `TauCeti.cartanEquiv`,
  `Scheme.Modules.tensorProduct` and `SheafOfModules.tensorProductRightFunctor`,
  `SheafOfModules.isFinitePresentation` (`FinitelyPresentedSheaf`),
  `TauCeti.AlgebraicGeometry.LineBundleClass` and `InvertibleSheaf`,
  `MvPolynomial.IsSymmetric.exists_aeval_esymm`.
* Mathlib: `Scheme`, `Scheme.Modules` with `restrictFunctor` and `pullback`,
  `SheafOfModules.IsLocallyFree`, `IsFiniteType`, `IsQuasicoherent`, `IsFinitePresentation`,
  `AlgebraicGeometry.tilde` and `tilde.functor`, `CochainComplex` with `IsStrictlyGE`/`IsStrictlyLE`
  and `IsGE`/`IsLE`, `HomologicalComplex.double`, `CochainComplex.mappingCone`, `QuasiIso`,
  `DerivedCategory` with `homologyFunctor`, `Functor.mapDerivedCategory`,
  `ObjectProperty.IsTriangulated`, `ObjectProperty.IsStableUnderRetracts`, `ObjectProperty.lift`,
  `Retract`, `IsIdempotentComplete`, `EssentiallySmall`, `Proj` with `MvPolynomial.gradedAlgebra`,
  `AffineSpace` with `homOfVector`, `IsClosedImmersion`, `IsAffineHom`, `Flat`,
  `Precoverage.toGrothendieck`, `Scheme.etalePrecoverage`, `Scheme.zariskiTopology`,
  `Scheme.etaleTopology`, `Scheme.Hom.residueFieldMap`, `Module.support`, `associatedPrimes`,
  `Ideal.height`, `ringKrullDim`, `IsRegularLocalRing`, `DualNumber`, `AddMonoidAlgebra`,
  `LaurentPolynomial`, `Ring.choose`, `BinomialRing`, `PowerSeries`, `MvPolynomial.esymm`,
  `MvPolynomial.psum` with `psum_isSymmetric`, `IsWeightedHomogeneous`, `Unitization`, `Rep`,
  `Matrix.GeneralLinearGroup`, `ClassGroup`, `LocallyConstant`, `TensorProduct`,
  `Module.End.eigenspace`, `Localization.Away`.

## Stand-ins, helpers and omissions

K-theory spectra and spaces, their homotopy groups, the derived pullback and pushforward, K-theory
with supports as a spectrum, the spectral sequences of K-theory, Chow groups, Chern classes and the
higher λ-operations are in neither pinned library. A statement needing one of them is left out,
and a comment `<name>: not stated here; needs … (supplier: …)` records it in place, so that every
packet name appears in this file. The degree-zero groups above, the maps between them (restriction,
pullback, the Cartan maps, the rank augmentation) and the ring and λ-structures on `K_0(Vect X)`
and on representation rings are formed honestly, with their data left as `sorry` where the
construction is itself the work. Helpers that are not packet names say so in their docstrings.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated AlgebraicGeometry
  ZeroObject

universe u

/-! ## Prelude: restriction, tilde and flatness on complexes (helpers, not packet names)

The packet's conventions (every node of S.1): an `𝒪_X`-module is an object of `X.Modules`, a
complex is a `CochainComplex X.Modules ℤ`, the shift and the cone are Mathlib's
(`CategoryTheory.shiftFunctor`, `CochainComplex.mappingCone`), and `D(𝒪_X)` is Mathlib's
`DerivedCategory X.Modules`. Mathlib constructs no global `HasDerivedCategory` instance; the
choice of a localisation with `u`-small Hom types (which EnhancedDerivedSheaves E1 constructs from
K-injective resolutions) is a hypothesis `[∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]`
of every section below that forms `D(𝒪_Y)`.

The helpers of this prelude are not packet names:
* `restrictComplex E U`: the termwise restriction of a complex along the open immersion `U.ι`
  (Mathlib's `Scheme.Modules.restrictFunctor`);
* `restrictD U`: the induced functor `D(𝒪_X) ⥤ D(𝒪_U)` (Mathlib's
  `Functor.mapDerivedCategory`; restriction to an open is exact, recorded as an instance whose
  proof is left as `sorry`);
* `tildeComplex M`, `tildeD R`: the termwise tilde `M• ↦ M•~` on complexes of `R`-modules and the
  induced functor `D(R) ⥤ D(𝒪_{Spec R})` (tilde is exact);
* `IsFlatModule F`: `F ⊗_{𝒪_X} -` preserves monomorphisms, for Tau Ceti's sheafified tensor
  product `Scheme.Modules.tensorProduct`. -/

/-! ### Ring `K₀` in the spelling of `KTheoryLowDegrees--U.1` (Z.1/ring-k0) -/

namespace TauCeti

namespace RingK0

/-- `FP R`: finitely generated projective `R`-modules, the spelling of `KTheoryLowDegrees--Z.3`
and `--U.1` (helper). -/
abbrev FP (R : Type u) [Ring R] : Type (u + 1) :=
  (TauCeti.finiteProjectiveModules R).FullSubcategory

end RingK0

/-- Ring `K₀` as in `KTheoryLowDegrees--U.1` (`KTheoryLowDegrees:Z.1/ring-k0`): Tau Ceti's split
`K₀` of `FP R` (helper; the neighbouring suggested file's spelling, no new presentation). -/
abbrev RingK0 (R : Type u) [Ring R] : Type u := TauCeti.SplitK0.{u} (RingK0.FP R)

end TauCeti

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section Helpers

variable {X : Scheme.{u}}

attribute [local instance] preservesBinaryBiproducts_of_preservesBinaryCoproducts in
/-- Restriction to an open is additive (it preserves colimits). -/
instance restrictFunctor_additive (U : X.Opens) :
    (Scheme.Modules.restrictFunctor U.ι).Additive :=
  Functor.additive_of_preservesBinaryBiproducts _

/-- Restriction to an open is exact (helper instance; the left adjoint `j_!` that would give it
is not in Mathlib, so the proof is left as `sorry`). -/
instance restrictFunctor_preservesFiniteLimits (U : X.Opens) :
    PreservesFiniteLimits (Scheme.Modules.restrictFunctor U.ι) := by
  sorry

/-- The tilde functor is exact (localisation is exact; helper instance, proof left as `sorry`). -/
instance tildeFunctor_preservesFiniteLimits (R : CommRingCat.{u}) :
    PreservesFiniteLimits (tilde.functor R) := by
  sorry

/-- The termwise restriction `E•|_U` of a complex of `𝒪_X`-modules to an open `U`. -/
abbrev restrictComplex (E : CochainComplex X.Modules ℤ) (U : X.Opens) :
    CochainComplex U.toScheme.Modules ℤ :=
  ((Scheme.Modules.restrictFunctor U.ι).mapHomologicalComplex (ComplexShape.up ℤ)).obj E

/-- The termwise tilde `M•~` of a complex of `R`-modules, a complex on `Spec R`. -/
abbrev tildeComplex {R : CommRingCat.{u}} (M : CochainComplex (ModuleCat.{u} R) ℤ) :
    CochainComplex (Spec R).Modules ℤ :=
  ((tilde.functor R).mapHomologicalComplex (ComplexShape.up ℤ)).obj M

/-- The structure sheaf `𝒪_X` as an `𝒪_X`-module. -/
abbrev structureModule (X : Scheme.{u}) : X.Modules :=
  SheafOfModules.unit X.ringCatSheaf

/-- `F` is a flat `𝒪_X`-module: `- ⊗_{𝒪_X} F` preserves monomorphisms (Stacks 05NE), for Tau
Ceti's sheafified tensor product. -/
def IsFlatModule (F : X.Modules) : Prop :=
  (TauCeti.SheafOfModules.tensorProductRightFunctor X.sheaf F).PreservesMonomorphisms

/-- The Koszul complex `R --x--> R` in degrees `-1, 0` on `Spec R`, as the tilde of the
multiplication map (a test helper). -/
def koszulComplex (R : CommRingCat.{u}) (x : R) : CochainComplex (Spec R).Modules ℤ :=
  HomologicalComplex.double ((tilde.functor R).map (ModuleCat.ofHom (LinearMap.mulLeft R x)))
    (show (ComplexShape.up ℤ).Rel (-1) 0 by simp)

/-- An object `M` placed in degree `0` (helper). -/
abbrev single₀ {C : Type*} [Category C] [HasZeroMorphisms C] [HasZeroObject C] (M : C) :
    CochainComplex C ℤ :=
  (HomologicalComplex.single C (ComplexShape.up ℤ) 0).obj M

end Helpers

section DerivedHelpers

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-- Restriction `D(𝒪_X) ⥤ D(𝒪_U)` to an open, induced by the exact restriction functor. -/
abbrev restrictD (U : X.Opens) :
    _root_.DerivedCategory X.Modules ⥤ _root_.DerivedCategory U.toScheme.Modules :=
  (Scheme.Modules.restrictFunctor U.ι).mapDerivedCategory

/-- `D(R) ⥤ D(𝒪_{Spec R})`, induced by the exact tilde functor. -/
abbrev tildeD (R : CommRingCat.{u}) [HasDerivedCategory.{u} (ModuleCat.{u} R)] :
    _root_.DerivedCategory (ModuleCat.{u} R) ⥤ _root_.DerivedCategory (Spec R).Modules :=
  (tilde.functor R).mapDerivedCategory

end DerivedHelpers

end TauCeti.AlgebraicGeometry.Scheme

/-! ## Stage `SchemeKTheoryOperations:S.1` — perfect complexes on a scheme

Conventions (pinned by every definition node of S.1): `X` is an arbitrary scheme, an
`𝒪_X`-module is an object of `X.Modules`, a complex is a `CochainComplex X.Modules ℤ` (differential
raising degree), `E[k]^n = E^{n+k}` is Mathlib's shift and the cone `C(φ)^n = F^n ⊕ E^{n+1}` is
Mathlib's `CochainComplex.mappingCone`; `D(𝒪_X)` is `DerivedCategory X.Modules`. **Perfect
complexes are defined locally**: `E•` is perfect if, on the members of an open covering, it is
the target of a quasi-isomorphism from a strictly perfect complex (bounded, with finite locally
free terms). No finiteness, separation or regularity hypothesis enters any definition. -/

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section StrictlyPerfect

variable {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/strictly-perfect-complex` -/

/-- **Strictly perfect complex** (`SchemeKTheoryOperations:S.1/strictly-perfect-complex`,
Stacks 08C4 via 0BCJ, TT 2.2.2): `E^i = 0` outside a finite interval `[a, b]` (a *strict* bound,
not a cohomological one) and every `E^i` is a finite locally free `𝒪_X`-module, i.e. locally free
(`SheafOfModules.IsLocallyFree`) and of finite type (`SheafOfModules.IsFiniteType`). As a
predicate on complexes it is the object property `SPerf(X)`. -/
structure IsStrictlyPerfect (E : CochainComplex X.Modules ℤ) : Prop where
  /-- `IsStrictlyPerfect.exists_bounds` (projection): integers `a ≤ b` with `E^i = 0` for
  `i ∉ [a, b]`. -/
  exists_bounds : ∃ a b : ℤ, a ≤ b ∧ E.IsStrictlyGE a ∧ E.IsStrictlyLE b
  /-- Every term is locally free. -/
  isLocallyFree (i : ℤ) : SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) (E.X i)
  /-- Every term is of finite type. -/
  isFiniteType (i : ℤ) : SheafOfModules.IsFiniteType (R := X.ringCatSheaf) (E.X i)

/-- A finite locally free `𝒪_X`-module placed in a single degree `n` is strictly perfect. -/
theorem IsStrictlyPerfect.single (M : X.Modules)
    [SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) M]
    [SheafOfModules.IsFiniteType (R := X.ringCatSheaf) M] (n : ℤ) :
    IsStrictlyPerfect ((HomologicalComplex.single X.Modules (ComplexShape.up ℤ) n).obj M) := by
  sorry

/-- Strict perfectness is invariant under isomorphism of complexes. -/
theorem IsStrictlyPerfect.of_iso {E F : CochainComplex X.Modules ℤ} (e : E ≅ F)
    (hE : IsStrictlyPerfect E) : IsStrictlyPerfect F := by
  sorry

/-- `E•` strictly perfect implies `E•[k]` strictly perfect. -/
theorem IsStrictlyPerfect.shift {E : CochainComplex X.Modules ℤ} (hE : IsStrictlyPerfect E)
    (k : ℤ) : IsStrictlyPerfect ((CategoryTheory.shiftFunctor _ k).obj E) := by
  sorry

/-- Stacks 08C4 via 0BCJ: `E•` is strictly perfect iff it is strictly bounded and each `E^i` is,
locally on `X`, a direct summand (retract) of a finite free module `𝒪_U^{⊕n}`. -/
theorem isStrictlyPerfect_iff_locally_summand_free (E : CochainComplex X.Modules ℤ) :
    IsStrictlyPerfect E ↔ (∃ a b : ℤ, E.IsStrictlyGE a ∧ E.IsStrictlyLE b) ∧
      ∀ (i : ℤ) (x : X), ∃ (U : X.Opens) (_ : x ∈ U) (n : ℕ),
        Nonempty (Retract ((E.X i).restrict U.ι)
          (SheafOfModules.free (R := U.toScheme.ringCatSheaf) (ULift.{u} (Fin n)))) := by
  sorry

/-- Restriction to an open (`Scheme.Modules.restrictFunctor`) preserves strict perfectness. -/
theorem IsStrictlyPerfect.restrict {E : CochainComplex X.Modules ℤ} (hE : IsStrictlyPerfect E)
    (U : X.Opens) : IsStrictlyPerfect (restrictComplex E U) := by
  sorry

/-- For a ring `A` and a strictly bounded complex `P•` of finitely generated projective
`A`-modules (Tau Ceti's `finiteProjectiveModules`), the termwise tilde `P•~` is strictly perfect
on `Spec A` (finite projective modules are locally free of finite rank, KTheoryLowDegrees Z.2). -/
theorem IsStrictlyPerfect.tilde {A : CommRingCat.{u}} (P : CochainComplex (ModuleCat.{u} A) ℤ)
    (a b : ℤ) [P.IsStrictlyGE a] [P.IsStrictlyLE b]
    (hP : ∀ i, TauCeti.finiteProjectiveModules A (P.X i)) :
    IsStrictlyPerfect (tildeComplex P) := by
  sorry

-- test isStrictlyPerfect_koszul_affineLine (computation)
/- On `Spec k[x]` the Koszul complex `𝒪 --x--> 𝒪` (degrees `-1, 0`) is strictly perfect, its
`H^0` is the skyscraper `(k[x]/(x))~` and its other cohomology vanishes. -/
example (k : Type u) [Field k] :
    IsStrictlyPerfect (koszulComplex (.of (Polynomial k)) Polynomial.X) ∧
      Nonempty ((koszulComplex (.of (Polynomial k)) Polynomial.X).homology 0 ≅
        tilde (R := .of (Polynomial k)) (ModuleCat.of _ (Polynomial k ⧸ Ideal.span
          {(Polynomial.X : Polynomial k)}))) ∧
      ∀ j : ℤ, j ≠ 0 → IsZero ((koszulComplex (.of (Polynomial k)) Polynomial.X).homology j) := by
  sorry

-- test isStrictlyPerfect_zero_and_unit (degenerate)
example (X : Scheme.{u}) :
    IsStrictlyPerfect (0 : CochainComplex X.Modules ℤ) ∧
      IsStrictlyPerfect (single₀ (structureModule X)) ∧
      ∀ (Y : Scheme.{u}) [IsEmpty Y] (E : CochainComplex Y.Modules ℤ), IsStrictlyPerfect E := by
  sorry

-- test not_isStrictlyPerfect_skyscraper (non-example)
example (k : Type u) [Field k] :
    ¬ IsStrictlyPerfect (single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
      (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

/-- The complex with `𝒪_X` in every degree `n ≤ 0` and zero differentials (test helper for
`not_isStrictlyPerfect_unbounded`). -/
def unboundedUnitComplex (X : Scheme.{u}) : CochainComplex X.Modules ℤ where
  X n := if n ≤ 0 then structureModule X else 0
  d _ _ := 0
  shape _ _ _ := rfl
  d_comp_d' _ _ _ _ _ := zero_comp

-- test not_isStrictlyPerfect_unbounded (non-example)
example (X : Scheme.{u}) [Nonempty X] :
    (∀ i, SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) ((unboundedUnitComplex X).X i) ∧
      SheafOfModules.IsFiniteType (R := X.ringCatSheaf) ((unboundedUnitComplex X).X i)) ∧
      ¬ IsStrictlyPerfect (unboundedUnitComplex X) := by
  sorry

-- test isStrictlyPerfect_tilde_projective (compatibility)
/- For `A = ℤ` and `P• = (ℤ --2--> ℤ)` in degrees `-1, 0`, `P•~` is strictly perfect with
`H^0 = (ℤ/2)~`. -/
example :
    IsStrictlyPerfect (koszulComplex (.of ℤ) (2 : ℤ)) ∧
      Nonempty ((koszulComplex (.of ℤ) (2 : ℤ)).homology 0 ≅
        tilde (R := .of ℤ) (ModuleCat.of _ (ZMod 2))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/strictly-perfect-closure` -/

/-- **Closure properties of strictly perfect complexes** (`S.1/strictly-perfect-closure`):
(a) shifts, (b) cones of maps of complexes (Stacks 08C5), (d) degreewise pullback `f^*E•` along
any morphism (Stacks 09U6), and (e) every term is a flat `𝒪_X`-module. Left out: (c) the total
complex `Tot(E• ⊗ F•)` (needs the tensor product of complexes of `𝒪_X`-modules, i.e. a monoidal
structure on `X.Modules`, which neither library has), and the K-flatness consequences of (e)
(supplier: EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements). -/
theorem strictlyPerfect_closure {E F : CochainComplex X.Modules ℤ} (hE : IsStrictlyPerfect E)
    (hF : IsStrictlyPerfect F) :
    (∀ k : ℤ, IsStrictlyPerfect ((CategoryTheory.shiftFunctor _ k).obj E)) ∧
      (∀ φ : E ⟶ F, IsStrictlyPerfect (CochainComplex.mappingCone φ)) ∧
      (∀ {X' : Scheme.{u}} (f : X' ⟶ X),
        IsStrictlyPerfect (((Scheme.Modules.pullback f).mapHomologicalComplex _).obj E)) ∧
      ∀ i, IsFlatModule (E.X i) := by
  sorry

end StrictlyPerfect

end TauCeti.AlgebraicGeometry.Scheme

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section LocalLifting

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/strictly-perfect-local-lifting` -/

/-- **Maps out of strictly perfect complexes are locally chain maps**
(`S.1/strictly-perfect-local-lifting`, Stacks 08CA–08CB): (1) every `α : E ⟶ F` in `D(𝒪_X)` with
`E` strictly perfect is, on the members of an open covering depending on `α`, represented by a
map of complexes `E|_U ⟶ F|_U`; (2) a map of complexes out of a strictly perfect complex which
is zero in `D(𝒪_X)` is locally null-homotopic. The restriction of `α` is read through
`restrictD U` and Mathlib's `mapDerivedCategoryFactors`. No global chain-level representative is
claimed. Clause (3) of the node (lifting through a map with `H^j` iso for `j > a` and onto at `a`)
is `IsPseudoCoherentAt`'s local form and is not restated. -/
theorem strictlyPerfect_local_lifting {E F : CochainComplex X.Modules ℤ}
    (hE : IsStrictlyPerfect E) :
    (∀ (α : DerivedCategory.Q.obj E ⟶ DerivedCategory.Q.obj F) (x : X),
      ∃ (U : X.Opens) (_ : x ∈ U) (φ : restrictComplex E U ⟶ restrictComplex F U),
        (restrictD U).map α =
          ((Scheme.Modules.restrictFunctor U.ι).mapDerivedCategoryFactors.app E).hom ≫
            DerivedCategory.Q.map φ ≫
              ((Scheme.Modules.restrictFunctor U.ι).mapDerivedCategoryFactors.app F).inv) ∧
      ∀ (φ : E ⟶ F), DerivedCategory.Q.map φ = 0 → ∀ x : X,
        ∃ (U : X.Opens) (_ : x ∈ U),
          Nonempty (Homotopy (((Scheme.Modules.restrictFunctor U.ι).mapHomologicalComplex _).map φ)
            0) := by
  sorry

end LocalLifting

section PseudoCoherent

variable {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/pseudo-coherent-complex` -/

/-- **`m`-pseudo-coherent complex** (`S.1/pseudo-coherent-complex`, Stacks 08CC, TT 2.2.5): on the
members of an open covering there are strictly perfect complexes `E•_U` and maps of complexes
`α : E•_U ⟶ E•|_U` with `H^j(α)` an isomorphism for `j > m` and an epimorphism for `j = m`. The
covering may shrink as `m` decreases. -/
def IsPseudoCoherentAt (m : ℤ) (E : CochainComplex X.Modules ℤ) : Prop :=
  ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U) (F : CochainComplex U.toScheme.Modules ℤ)
    (α : F ⟶ restrictComplex E U), IsStrictlyPerfect F ∧
      (∀ j, m < j → IsIso (HomologicalComplex.homologyMap α j)) ∧
      Epi (HomologicalComplex.homologyMap α m)

/-- **Pseudo-coherent complex**: `m`-pseudo-coherent for every `m ∈ ℤ`. -/
def IsPseudoCoherent (E : CochainComplex X.Modules ℤ) : Prop :=
  ∀ m : ℤ, IsPseudoCoherentAt m E

/-- `m`-pseudo-coherence is invariant under quasi-isomorphism (Stacks 08CC), hence a property of
objects of `D(𝒪_X)`. -/
theorem IsPseudoCoherent.of_quasiIso {E F : CochainComplex X.Modules ℤ} (φ : E ⟶ F) [QuasiIso φ]
    (m : ℤ) : IsPseudoCoherentAt m E ↔ IsPseudoCoherentAt m F := by
  sorry

/-- `E` is `m`-pseudo-coherent iff `E[k]` is `(m - k)`-pseudo-coherent. -/
theorem IsPseudoCoherent.shift (E : CochainComplex X.Modules ℤ) (m k : ℤ) :
    IsPseudoCoherentAt m E ↔
      IsPseudoCoherentAt (m - k) ((CategoryTheory.shiftFunctor _ k).obj E) := by
  sorry

/-- On a noetherian scheme a complex with quasi-coherent cohomology is pseudo-coherent iff it is
cohomologically bounded above with coherent (finitely presented) cohomology sheaves: `D^-_Coh`
(Stacks 08E8, TT 2.2.8). -/
theorem isPseudoCoherent_iff_bounded_above_coherent [_root_.AlgebraicGeometry.IsNoetherian X]
    (E : CochainComplex X.Modules ℤ)
    (hE : ∀ i, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf) (E.homology i)) :
    IsPseudoCoherent E ↔ (∃ b : ℤ, E.IsLE b) ∧
      ∀ i, SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) (E.homology i) := by
  sorry

/-- A module in degree `0` is `0`-pseudo-coherent iff of finite type, and `(-1)`-pseudo-coherent
iff finitely presented (Stacks 09V9). -/
theorem isPseudoCoherent_zero_iff_finiteType (M : X.Modules) :
    (IsPseudoCoherentAt 0 (single₀ M) ↔ SheafOfModules.IsFiniteType (R := X.ringCatSheaf) M) ∧
      (IsPseudoCoherentAt (-1) (single₀ M) ↔
        SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) M) := by
  sorry

-- `IsPseudoCoherent.pullback`: not stated here; needs the derived pullback `Lf^*` on `D(𝒪_Y)`
-- for an arbitrary morphism `f` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, through
-- `SchemeKTheoryOperations:S.1/perfect-derived-pullback`).

section Derived

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]

/-- The induced property of objects of `D(𝒪_X)`: represented by an `m`-pseudo-coherent complex
(helper, not a packet name; the definition's second sentence). -/
def DerivedCategory.isPseudoCoherentAt (X : Scheme.{u}) (m : ℤ) :
    ObjectProperty (_root_.DerivedCategory X.Modules) :=
  fun K => ∃ E : CochainComplex X.Modules ℤ, IsPseudoCoherentAt m E ∧
    Nonempty (DerivedCategory.Q.obj E ≅ K)

/-- The three two-out-of-three rules in a distinguished triangle `K → L → M → K[1]` (Stacks 08CD,
TT 2.2.13(a)): `K` `(m+1)`- and `L` `m`-pseudo-coherent give `M` `m`-pseudo-coherent; `K`, `M`
`m`-pseudo-coherent give `L`; `L` `(m+1)`- and `M` `m`-pseudo-coherent give `K` `(m+1)`-p.c. -/
theorem IsPseudoCoherent.two_of_three (m : ℤ) (T : Triangle (_root_.DerivedCategory X.Modules))
    (hT : T ∈ distTriang _) :
    (DerivedCategory.isPseudoCoherentAt X (m + 1) T.obj₁ →
        DerivedCategory.isPseudoCoherentAt X m T.obj₂ →
        DerivedCategory.isPseudoCoherentAt X m T.obj₃) ∧
      (DerivedCategory.isPseudoCoherentAt X m T.obj₁ →
        DerivedCategory.isPseudoCoherentAt X m T.obj₃ →
        DerivedCategory.isPseudoCoherentAt X m T.obj₂) ∧
      (DerivedCategory.isPseudoCoherentAt X (m + 1) T.obj₂ →
        DerivedCategory.isPseudoCoherentAt X m T.obj₃ →
        DerivedCategory.isPseudoCoherentAt X (m + 1) T.obj₁) := by
  sorry

/-- Direct summands of `m`-pseudo-coherent objects are `m`-pseudo-coherent (Stacks 08CE). -/
theorem IsPseudoCoherent.summand (m : ℤ) (K L : _root_.DerivedCategory X.Modules)
    (h : DerivedCategory.isPseudoCoherentAt X m (K ⊞ L)) :
    DerivedCategory.isPseudoCoherentAt X m K := by
  sorry

end Derived

/-- The residue field `k = k[ε]/(ε)` of the dual numbers, as a `k[ε]`-module (test helper). -/
abbrev dualNumbersResidue (k : Type u) [Field k] : ModuleCat.{u} (CommRingCat.of (DualNumber k)) :=
  ModuleCat.of _ (DualNumber k ⧸ Ideal.span {(DualNumber.eps : DualNumber k)})

-- test isPseudoCoherent_residueField_dualNumbers (computation)
/- On `Spec k[ε]/(ε²)` the residue field in degree `0` is pseudo-coherent (resolved by
`⋯ --ε--> 𝒪 --ε--> 𝒪`); that it is not perfect is `not_isPerfect_residue_dualNumbers` below. -/
example (k : Type u) [Field k] : IsPseudoCoherent (single₀ (tilde (dualNumbersResidue k))) := by
  sorry

-- test isPseudoCoherent_zero (degenerate)
example (X : Scheme.{u}) :
    IsPseudoCoherent (0 : CochainComplex X.Modules ℤ) ∧
      ∀ (Y : Scheme.{u}) [IsEmpty Y] (E : CochainComplex Y.Modules ℤ), IsPseudoCoherent E := by
  sorry

-- test not_isPseudoCoherent_infinite_type (non-example)
example : ¬ IsPseudoCoherentAt 0 (single₀ (tilde (R := .of ℤ) (ModuleCat.of _ (ℕ →₀ ℤ)))) := by
  sorry

-- test isPseudoCoherent_iff_finite_cohomology_affine (compatibility)
/- On `Spec A`, `A` noetherian: `M•~` is pseudo-coherent iff `M•` is bounded above with finitely
generated cohomology (Stacks 08E7, More on Algebra 66.17). -/
example (A : CommRingCat.{u}) [IsNoetherianRing A] (M : CochainComplex (ModuleCat.{u} A) ℤ) :
    IsPseudoCoherent (tildeComplex M) ↔ (∃ b : ℤ, M.IsLE b) ∧ ∀ i, Module.Finite A (M.homology i) :=
  by
  sorry

end PseudoCoherent

section TorAmplitude

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/tor-amplitude` -/

/-- **Tor-amplitude in `[a, b]`** (`S.1/tor-amplitude`, TT 2.2.11), in the equivalent form of
Stacks 08CI that the packet records: `K ∈ D(𝒪_X)` is represented by a complex of flat
`𝒪_X`-modules concentrated in degrees `[a, b]`. The packet's defining form — `H^i(K ⊗^L F) = 0`
for every `𝒪_X`-module `F` and `i ∉ [a, b]` — needs the derived tensor product of
EnhancedDerivedSheaves E1, which neither library has. -/
def HasTorAmplitude (a b : ℤ) (K : _root_.DerivedCategory X.Modules) : Prop :=
  ∃ F : CochainComplex X.Modules ℤ, (∀ i, IsFlatModule (F.X i)) ∧ F.IsStrictlyGE a ∧
    F.IsStrictlyLE b ∧ Nonempty (DerivedCategory.Q.obj F ≅ K)

/-- **Finite tor dimension**: tor-amplitude in some `[a, b]`. -/
def HasFiniteTorDimension (K : _root_.DerivedCategory X.Modules) : Prop :=
  ∃ a b : ℤ, HasTorAmplitude a b K

/-- **Locally finite tor dimension**: finite tor dimension on the members of an open covering. -/
def HasLocallyFiniteTorDimension (K : _root_.DerivedCategory X.Modules) : Prop :=
  ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U), HasFiniteTorDimension ((restrictD U).obj K)

-- `hasTorAmplitude_iff_flat_representative`: not stated here; with the definition above the
-- flat-representative form (Stacks 08CI) *is* the definition, and the packet's `⊗^L` form needs
-- the derived tensor product `K ⊗^L F` on `D(𝒪_X)` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

-- `hasTorAmplitude_iff_stalks`: not stated here; needs the stalk functor from complexes of
-- `𝒪_X`-modules to complexes of `𝒪_{X,x}`-modules and tor-amplitude of complexes of modules over a
-- ring (supplier:
-- DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models, with
-- SchemeAndStackFoundations:SF.2 for stalks of `𝒪_X`-modules).

-- `HasTorAmplitude.pullback`: not stated here; needs the derived pullback `Lf^*` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

/-- The three-term rules in a distinguished triangle `K → L → M → K[1]` (Stacks 08CJ): `K` in
`[a+1, b+1]` and `L` in `[a, b]` give `M` in `[a, b]`; `K`, `M` in `[a, b]` give `L` in `[a, b]`;
`L` in `[a+1, b+1]` and `M` in `[a, b]` give `K` in `[a+1, b+1]`. The additivity of amplitudes
under `⊗^L` (Stacks 09J4) is left out: it needs E1's derived tensor product. -/
theorem HasTorAmplitude.triangle (a b : ℤ) (T : Triangle (_root_.DerivedCategory X.Modules))
    (hT : T ∈ distTriang _) :
    (HasTorAmplitude (a + 1) (b + 1) T.obj₁ → HasTorAmplitude a b T.obj₂ →
        HasTorAmplitude a b T.obj₃) ∧
      (HasTorAmplitude a b T.obj₁ → HasTorAmplitude a b T.obj₃ → HasTorAmplitude a b T.obj₂) ∧
      (HasTorAmplitude (a + 1) (b + 1) T.obj₂ → HasTorAmplitude a b T.obj₃ →
        HasTorAmplitude (a + 1) (b + 1) T.obj₁) := by
  sorry

/-- On a quasi-compact scheme locally finite tor dimension implies finite tor dimension
(TT 3.1.2). -/
theorem HasFiniteTorDimension.of_locally_quasiCompact [CompactSpace X]
    (K : _root_.DerivedCategory X.Modules) (hK : HasLocallyFiniteTorDimension K) :
    HasFiniteTorDimension K := by
  sorry

/-- Tor-amplitude in `[a, b]` implies `H^i(K) = 0` for `i ∉ [a, b]` (take `F = 𝒪_X`). -/
theorem HasTorAmplitude.bounded {a b : ℤ} {K : _root_.DerivedCategory X.Modules}
    (hK : HasTorAmplitude a b K) (i : ℤ) (hi : i < a ∨ b < i) :
    IsZero ((DerivedCategory.homologyFunctor X.Modules i).obj K) := by
  sorry

-- test hasTorAmplitude_locallyFree (computation)
example (X : Scheme.{u}) (M : X.Modules) [SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) M]
    [SheafOfModules.IsFiniteType (R := X.ringCatSheaf) M] (k : Type u) [Field k] :
    HasTorAmplitude 0 0 (DerivedCategory.Q.obj (single₀ M)) ∧
      HasTorAmplitude (-1) 0 (DerivedCategory.Q.obj
        (koszulComplex (.of (Polynomial k)) Polynomial.X)) := by
  sorry

-- test hasTorAmplitude_zero (degenerate)
example (X : Scheme.{u}) (a b : ℤ) :
    HasTorAmplitude a b (0 : _root_.DerivedCategory X.Modules) := by
  sorry

-- test not_hasFiniteTorDimension_residue_dualNumbers (non-example)
example (k : Type u) [Field k] :
    ¬ HasFiniteTorDimension (DerivedCategory.Q.obj (single₀ (tilde (dualNumbersResidue k)))) := by
  sorry

-- test hasTorAmplitude_affine_iff (compatibility): not stated here; needs tor-amplitude of
-- complexes of `A`-modules, `M• ⊗^L_A N` (supplier:
-- DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models).
-- Suggested form: `HasTorAmplitude a b ((tildeD A).obj M) ↔ (M has tor-amplitude in [a, b])`.

end TorAmplitude

end TauCeti.AlgebraicGeometry.Scheme

/-! ### `SchemeKTheoryOperations:S.1/perfect-module-complex`

The object is `TauCeti.DerivedCategory.IsPerfectModule` (api name `IsPerfectModule` in the node's
namespace `TauCeti.DerivedCategory`), and the node's other items (`IsPerfectModule.triangle`,
`isPerfectModule_iff_…`) are relative to the same namespace. -/

namespace TauCeti

section PerfectModule

variable (A : Type u) [Ring A] [HasDerivedCategory.{u} (ModuleCat.{u} A)]

/-- **Perfect complex of modules** (`SchemeKTheoryOperations:S.1/perfect-module-complex`,
Stacks 0657): `K ∈ D(A)` is isomorphic in `D(A)` to a strictly bounded complex of finitely
generated projective `A`-modules (Tau Ceti's `finiteProjectiveModules`). `A` is arbitrary: no
noetherian, local or completeness hypothesis. -/
def DerivedCategory.IsPerfectModule : ObjectProperty (_root_.DerivedCategory (ModuleCat.{u} A)) :=
  fun K => ∃ (P : CochainComplex (ModuleCat.{u} A) ℤ) (a b : ℤ), P.IsStrictlyGE a ∧
    P.IsStrictlyLE b ∧ (∀ i, TauCeti.finiteProjectiveModules A (P.X i)) ∧
    Nonempty (_root_.DerivedCategory.Q.obj P ≅ K)

namespace DerivedCategory

open TauCeti.AlgebraicGeometry.Scheme (single₀)

-- `isPerfectModule_iff_pseudoCoherent_finiteTor`: not stated here; needs pseudo-coherence and
-- tor-amplitude of complexes of `A`-modules (supplier:
-- DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models).

/-- A module is perfect iff it has a finite resolution by finitely generated projective modules
(Stacks 066Q), the resolution being Tau Ceti's `admitsFiniteResolution` for the abelian exact
structure. -/
theorem isPerfectModule_iff_finite_projective_resolution (M : ModuleCat.{u} A) :
    IsPerfectModule A (_root_.DerivedCategory.Q.obj (single₀ M)) ↔
      (ExactStructure.abelian (ModuleCat.{u} A)).admitsFiniteResolution
        (TauCeti.finiteProjectiveModules A) M := by
  sorry

/-- Perfect objects form a triangulated subcategory (two out of three in distinguished triangles,
Stacks 066R) closed under direct summands (Stacks 066S). -/
theorem IsPerfectModule.triangle :
    (IsPerfectModule A).IsTriangulated ∧ (IsPerfectModule A).IsStableUnderRetracts := by
  sorry

-- `IsPerfectModule.derivedTensor`: not stated here; needs the derived tensor product `K ⊗^L_A L`
-- on `D(A)` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

-- `IsPerfectModule.baseChange`: not stated here; needs the derived base change `K ⊗^L_A B`
-- (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

-- `isPerfectModule_iff_P7`: not stated here; needs DeformationAndDerivedPatchingAlgebra P7's
-- perfectness over complete noetherian local `𝒪`-algebras, which is in neither library
-- (supplier:
-- DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models).

end DerivedCategory

end PerfectModule

section PerfectModuleComm

namespace DerivedCategory

open TauCeti.AlgebraicGeometry.Scheme (single₀)

/-- Restriction of scalars along a ring map is exact (helper instance; it is a right adjoint of
extension of scalars, proof left as `sorry`). -/
instance restrictScalars_preservesFiniteLimits {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) : PreservesFiniteLimits (ModuleCat.restrictScalars.{u} f) := by
  sorry

/-- If `B` is perfect as an `A`-module, a perfect complex of `B`-modules is perfect over `A`
(Stacks 066V); restriction of scalars is exact, so it acts on derived categories. -/
theorem IsPerfectModule.restrictScalars {A B : Type u} [CommRing A] [CommRing B]
    [HasDerivedCategory.{u} (ModuleCat.{u} A)] [HasDerivedCategory.{u} (ModuleCat.{u} B)]
    (f : A →+* B)
    (hB : IsPerfectModule A (_root_.DerivedCategory.Q.obj
      (single₀ ((ModuleCat.restrictScalars.{u} f).obj (ModuleCat.of B B)))))
    (K : _root_.DerivedCategory (ModuleCat.{u} B)) (hK : IsPerfectModule B K) :
    IsPerfectModule A ((ModuleCat.restrictScalars.{u} f).mapDerivedCategory.obj K) := by
  sorry

/-- Over a regular ring every finitely generated module is perfect (Stacks 066Z; Serre's theorem,
DeformationAndDerivedPatchingAlgebra R03.3). -/
theorem isPerfectModule_of_isRegularRing (A : Type u) [CommRing A] [IsRegularRing A]
    [HasDerivedCategory.{u} (ModuleCat.{u} A)] (M : ModuleCat.{u} A) [Module.Finite A M] :
    IsPerfectModule A (_root_.DerivedCategory.Q.obj (single₀ M)) := by
  sorry

-- test isPerfectModule_int_quot (computation)
/- `ℤ/6` is a perfect `ℤ`-module, with the length-one resolution `0 → ℤ --6--> ℤ → ℤ/6 → 0`. -/
example [HasDerivedCategory.{0} (ModuleCat.{0} ℤ)] :
    IsPerfectModule ℤ (_root_.DerivedCategory.Q.obj (single₀ (ModuleCat.of ℤ (ZMod 6)))) ∧
      Function.Injective (fun n : ℤ => 6 * n) ∧
      Function.Exact (fun n : ℤ => 6 * n) (Int.cast : ℤ → ZMod 6) ∧
      Function.Surjective (Int.cast : ℤ → ZMod 6) := by
  sorry

-- test isPerfectModule_zero_ring (degenerate)
example (A : Type u) [CommRing A] [Subsingleton A] [HasDerivedCategory.{u} (ModuleCat.{u} A)]
    (K : _root_.DerivedCategory (ModuleCat.{u} A)) : IsPerfectModule A K := by
  sorry

-- test not_isPerfectModule_Z4 (non-example)
/- Over `ℤ/4`, the module `ℤ/2 = (ℤ/4)/(2)` is not perfect (its minimal resolution
`⋯ --2--> ℤ/4 --2--> ℤ/4` is infinite). -/
example [HasDerivedCategory.{0} (ModuleCat.{0} (ZMod 4))] :
    ¬ IsPerfectModule (ZMod 4) (_root_.DerivedCategory.Q.obj
      (single₀ (ModuleCat.of (ZMod 4) (ZMod 4 ⧸ Ideal.span {(2 : ZMod 4)})))) := by
  sorry

-- test isPerfectModule_single_iff_finiteProjective (compatibility)
/- A module in degree `0` is represented by finitely generated projectives concentrated in degree
`0` (perfect of tor-amplitude `[0, 0]`) iff it lies in Tau Ceti's `finiteProjectiveModules`. -/
example (A : Type u) [CommRing A] [HasDerivedCategory.{u} (ModuleCat.{u} A)]
    (M : ModuleCat.{u} A) :
    (∃ P : CochainComplex (ModuleCat.{u} A) ℤ, P.IsStrictlyGE 0 ∧ P.IsStrictlyLE 0 ∧
      (∀ i, TauCeti.finiteProjectiveModules A (P.X i)) ∧
      Nonempty (_root_.DerivedCategory.Q.obj P ≅ _root_.DerivedCategory.Q.obj (single₀ M))) ↔
      TauCeti.finiteProjectiveModules A M := by
  sorry

-- test isPerfectModule_eq_P7_on_complete_local (compatibility): not stated here; needs
-- DeformationAndDerivedPatchingAlgebra P7's perfectness for `ℤ_p[[x]]` over `ℤ_p` (supplier:
-- DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models).

end DerivedCategory

end PerfectModuleComm

end TauCeti

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section Perfect

variable {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/perfect-complex` -/

/-- **Perfect complex** (`SchemeKTheoryOperations:S.1/perfect-complex`, Stacks 08CM, TT 2.2.10):
there are an open covering and, on each member `U`, a strictly perfect complex `E•_U` with a
quasi-isomorphism `E•_U ⟶ E•|_U`. Defined locally: no global bounded complex of vector bundles is
required, and singular schemes are allowed. -/
def IsPerfect (E : CochainComplex X.Modules ℤ) : Prop :=
  ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U) (F : CochainComplex U.toScheme.Modules ℤ)
    (φ : F ⟶ restrictComplex E U), IsStrictlyPerfect F ∧ QuasiIso φ

/-- A strictly perfect complex is perfect. -/
theorem IsStrictlyPerfect.isPerfect {E : CochainComplex X.Modules ℤ} (hE : IsStrictlyPerfect E) :
    IsPerfect E := by
  sorry

/-- Stacks 0BCJ: `E•` is perfect iff locally it is the target of a quasi-isomorphism from a
strictly bounded complex whose terms are finite free modules `𝒪_U^{⊕n}`. -/
theorem isPerfect_iff_locally_finite_free (E : CochainComplex X.Modules ℤ) :
    IsPerfect E ↔ ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U) (F : CochainComplex U.toScheme.Modules ℤ)
      (φ : F ⟶ restrictComplex E U), (∃ a b : ℤ, F.IsStrictlyGE a ∧ F.IsStrictlyLE b) ∧
        (∀ i, ∃ n : ℕ, Nonempty (F.X i ≅
          SheafOfModules.free (R := U.toScheme.ringCatSheaf) (ULift.{u} (Fin n)))) ∧
        QuasiIso φ := by
  sorry

/-- Perfectness is invariant under quasi-isomorphism (`S.1/perfect-local-and-invariant`). -/
theorem IsPerfect.of_quasiIso {E F : CochainComplex X.Modules ℤ} (φ : E ⟶ F) [QuasiIso φ] :
    IsPerfect E ↔ IsPerfect F := by
  sorry

/-- `E` is perfect iff `E|_{U_i}` is perfect for every member of some open covering. -/
theorem isPerfect_iff_restrict (E : CochainComplex X.Modules ℤ) :
    IsPerfect E ↔ ∃ (ι : Type u) (U : ι → X.Opens), iSup U = ⊤ ∧
      ∀ i, IsPerfect (restrictComplex E (U i)) := by
  sorry

/-- On a quasi-compact scheme a perfect complex is cohomologically bounded
(`S.1/perfect-objects-quasi-coherent-bounded`). -/
theorem IsPerfect.bounded [CompactSpace X] {E : CochainComplex X.Modules ℤ} (hE : IsPerfect E) :
    ∃ a b : ℤ, E.IsGE a ∧ E.IsLE b := by
  sorry

-- test isPerfect_skyscraper_affineLine (computation)
/- The skyscraper `(k[x]/(x))~` in degree `0` on `Spec k[x]` is perfect: the Koszul complex maps
quasi-isomorphically to it. -/
example (k : Type u) [Field k] :
    IsPerfect (single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
      (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)})))) := by
  sorry

-- test not_isPerfect_residue_dualNumbers (non-example)
/- On `Spec k[ε]/(ε²)` the residue field in degree `0` is not perfect: `Tor_i(k, k) ≅ k` for all
`i`. -/
example (k : Type u) [Field k] : ¬ IsPerfect (single₀ (tilde (dualNumbersResidue k))) := by
  sorry

-- test not_isPerfect_iff_strictly_perfect (non-example): not stated here; needs the affine plane
-- with doubled origin as a scheme (two copies of `𝔸²_k` glued along `𝔸² ∖ 0`; Mathlib has
-- `Scheme.GlueData` but no such declaration, and the vector-bundle input is the packet's gap
-- "Vector bundles on affine space with doubled origin") (supplier:
-- SchemeKTheoryOperations:S.1/doubled-plane-counterexample).

section Derived

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]

/-- The induced object property on `D(𝒪_X)`: represented by a perfect complex. `D_perf(𝒪_X)` is
its full subcategory (`Dperf X`). -/
def DerivedCategory.isPerfect (X : Scheme.{u}) :
    ObjectProperty (_root_.DerivedCategory X.Modules) :=
  fun K => ∃ E : CochainComplex X.Modules ℤ, IsPerfect E ∧ Nonempty (DerivedCategory.Q.obj E ≅ K)

/-- `D_perf(𝒪_X)` is a triangulated subcategory of `D(𝒪_X)` (closure under summands is
`perfect_triangulated_and_thick`). -/
instance isTriangulated_isPerfect : (DerivedCategory.isPerfect X).IsTriangulated := by
  sorry

/-- The perfect derived category `D_perf(𝒪_X)` (helper abbreviation, not a packet name): the full
subcategory of `D(𝒪_X)` on `DerivedCategory.isPerfect X`, pretriangulated by Mathlib's
`ObjectProperty.FullSubcategory` instance. -/
abbrev Dperf (X : Scheme.{u}) : Type _ := (DerivedCategory.isPerfect X).FullSubcategory

/-- On `Spec A`, `M•~` is perfect iff `M•` is a perfect complex of `A`-modules
(`S.1/affine-perfect-comparison`). -/
theorem isPerfect_tilde_iff (R : CommRingCat.{u}) [HasDerivedCategory.{u} (ModuleCat.{u} R)]
    (M : CochainComplex (ModuleCat.{u} R) ℤ) :
    IsPerfect (tildeComplex M) ↔
      TauCeti.DerivedCategory.IsPerfectModule R (_root_.DerivedCategory.Q.obj M) := by
  sorry

-- test isPerfect_zero_unit (degenerate)
example (X : Scheme.{u}) :
    IsPerfect (0 : CochainComplex X.Modules ℤ) ∧
      (∀ n : ℤ, IsPerfect ((HomologicalComplex.single X.Modules (ComplexShape.up ℤ) n).obj
        (structureModule X))) ∧
      ∀ (Y : Scheme.{u}) [IsEmpty Y] (K : Dperf Y), IsZero K := by
  sorry

-- test isPerfect_iff_affine_projective (compatibility)
/- On `Spec ℤ`, `(ℤ/n)~` (`n ≠ 0`) is perfect, via `ℤ --n--> ℤ`, matching that `ℤ/n` is a perfect
`ℤ`-module (More on Algebra 066Q). -/
example [∀ Y : Scheme.{0}, HasDerivedCategory.{0} Y.Modules]
    [HasDerivedCategory.{0} (ModuleCat.{0} ℤ)] (n : ℕ) (hn : n ≠ 0) :
    IsPerfect (single₀ (tilde (R := .of ℤ) (ModuleCat.of _ (ZMod n)))) ∧
      TauCeti.DerivedCategory.IsPerfectModule ℤ
        (_root_.DerivedCategory.Q.obj (single₀ (ModuleCat.of ℤ (ZMod n)))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-local-and-invariant` -/

/-- **Perfectness is local and invariant** (`S.1/perfect-local-and-invariant`): (1) local
derived models (isomorphisms in `D(𝒪_U)`, not chain maps) suffice; (2) every complex
representing a perfect object is perfect; (3) restriction to an open preserves perfectness, and
perfectness can be checked on an open covering. -/
theorem perfect_local_and_invariant :
    (∀ K : _root_.DerivedCategory X.Modules,
      (∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U) (F : CochainComplex U.toScheme.Modules ℤ),
        IsStrictlyPerfect F ∧ Nonempty (DerivedCategory.Q.obj F ≅ (restrictD U).obj K)) →
        DerivedCategory.isPerfect X K) ∧
      (∀ E : CochainComplex X.Modules ℤ,
        DerivedCategory.isPerfect X (DerivedCategory.Q.obj E) → IsPerfect E) ∧
      (∀ (K : _root_.DerivedCategory X.Modules) (U : X.Opens),
        DerivedCategory.isPerfect X K → DerivedCategory.isPerfect U ((restrictD U).obj K)) ∧
      ∀ K : _root_.DerivedCategory X.Modules, DerivedCategory.isPerfect X K ↔
        ∃ (ι : Type u) (U : ι → X.Opens), iSup U = ⊤ ∧
          ∀ i, DerivedCategory.isPerfect (U i) ((restrictD (U i)).obj K) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor` -/

/-- **Perfect = pseudo-coherent + locally finite tor dimension**
(`S.1/perfect-iff-pseudo-coherent-finite-tor`, Stacks 08CQ, TT 2.2.12); precisely, tor-amplitude
in `[a, b]` and `(a - 1)`-pseudo-coherence give perfectness with local strictly perfect models in
degrees `[a, b]`. -/
theorem perfect_iff_pseudoCoherent_finiteTor (E : CochainComplex X.Modules ℤ) :
    (IsPerfect E ↔
      IsPseudoCoherent E ∧ HasLocallyFiniteTorDimension (DerivedCategory.Q.obj E)) ∧
      ∀ a b : ℤ, HasTorAmplitude a b (DerivedCategory.Q.obj E) → IsPseudoCoherentAt (a - 1) E →
        IsPerfect E ∧ ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U)
          (F : CochainComplex U.toScheme.Modules ℤ) (φ : F ⟶ restrictComplex E U),
          IsStrictlyPerfect F ∧ F.IsStrictlyGE a ∧ F.IsStrictlyLE b ∧ QuasiIso φ := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-triangulated-and-thick` -/

/-- **`D_perf(𝒪_X)` is thick** (`S.1/perfect-triangulated-and-thick`, Stacks 08CR–08CS,
TT 2.2.13(b)–(c)): closed under isomorphisms, shifts, two-out-of-three in distinguished triangles
(Mathlib's `ObjectProperty.IsTriangulated`) and retracts (direct summands). -/
theorem perfect_triangulated_and_thick :
    (DerivedCategory.isPerfect X).IsClosedUnderIsomorphisms ∧
      (DerivedCategory.isPerfect X).IsTriangulated ∧
      (DerivedCategory.isPerfect X).IsStableUnderRetracts := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-derived-tensor`,
`SchemeKTheoryOperations:S.1/perfect-derived-pullback` -/

/- `SchemeKTheoryOperations:S.1/perfect-derived-tensor`: not stated here; needs the derived tensor
product `K ⊗^L L` on `D(𝒪_X)` (supplier:
EnhancedDerivedSheaves:E1/presentability-and-derived-tensor). Its strictly perfect clause needs
`Tot(K• ⊗ L•)`, the tensor product of complexes of `𝒪_X`-modules (no monoidal structure on
`X.Modules` in either library).
`SchemeKTheoryOperations:S.1/perfect-derived-pullback`: not stated here; needs the derived
pullback `Lf^* : D(𝒪_Y) ⥤ D(𝒪_X)` for an arbitrary morphism (supplier:
EnhancedDerivedSheaves:E1/presentability-and-derived-tensor). Its degreewise clause for strictly
perfect complexes is `strictlyPerfect_closure` (d); for an open immersion `Lf^*` is `restrictD`. -/

/-! ### `SchemeKTheoryOperations:S.1/perfect-idempotent-complete` -/

/-- **`D_perf(𝒪_X)` is idempotent complete** (`S.1/perfect-idempotent-complete`): `D(𝒪_X)` has
arbitrary direct sums, hence is Karoubian, and `D_perf(𝒪_X)` is closed under summands. -/
theorem perfect_idempotent_complete :
    IsIdempotentComplete (_root_.DerivedCategory X.Modules) ∧ IsIdempotentComplete (Dperf X) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-objects-quasi-coherent-bounded` -/

/-- **Cohomology of perfect complexes** (`S.1/perfect-objects-quasi-coherent-bounded`): (1)
every `H^i(E)` is quasi-coherent (Stacks 08E5); (2) on a quasi-compact scheme `E` is
cohomologically bounded; (3) on a noetherian scheme every `H^i(E)` is coherent. The clause on
`E ⊗^L L` and `RHom(E, L)` (Stacks 0FXU) is left out: it needs E1's derived tensor and internal
Hom. -/
theorem perfect_objects_quasiCoherent_bounded {E : CochainComplex X.Modules ℤ}
    (hE : IsPerfect E) :
    (∀ i, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf) (E.homology i)) ∧
      (CompactSpace X → ∃ a b : ℤ, E.IsGE a ∧ E.IsLE b) ∧
      (_root_.AlgebraicGeometry.IsNoetherian X →
        ∀ i, SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) (E.homology i)) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-essentially-small` -/

/-- **`D_perf(𝒪_X)` is essentially small for qcqs `X`** (`S.1/perfect-essentially-small`): an
instance, because `TauCeti.TriangulatedK0` needs it. The Waldhausen category of perfect complexes
itself is not essentially small (`perfCategory_not_essentiallySmall`). -/
instance perfect_essentiallySmall [CompactSpace X] [QuasiSeparatedSpace X] :
    EssentiallySmall.{u} (Dperf X) := by
  sorry

end Derived

end Perfect

end TauCeti.AlgebraicGeometry.Scheme

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section Affine

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]

/-! ### `SchemeKTheoryOperations:S.1/coherator` -/

/- `SchemeKTheoryOperations:S.1/coherator`: not stated here; needs the abelian category
`QCoh(𝒪_X)` of quasi-coherent modules (Mathlib has only the object property
`SheafOfModules.isQuasicoherent`, no abelian structure on its full subcategory), its derived
category, the coherator `Q_X` right adjoint to the inclusion, and `RQ_X` on unbounded complexes
(supplier: SchemeAndStackFoundations:SF.2 and
EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements). Suggested form: for `X`
quasi-compact with affine diagonal, or noetherian, `D(QCoh(𝒪_X)) ⥤ D(𝒪_X)` is fully faithful with
essential image `D_QCoh(𝒪_X)`. -/

/-! ### `SchemeKTheoryOperations:S.1/affine-derived-equivalence` -/

/-- **The derived category of an affine scheme** (`S.1/affine-derived-equivalence`, Stacks 06Z0):
the termwise tilde induces a fully faithful functor `D(A) ⥤ D(𝒪_{Spec A})` whose essential image
is `D_QCoh`, the objects with quasi-coherent cohomology sheaves. `A` is arbitrary. The
compatibilities with `Lg^*`, `Rg_*` and `⊗^L` (Stacks 08DW, 0DJK, 08DX) are left out: they need
the derived functors of EnhancedDerivedSheaves E1. -/
theorem affine_derived_equivalence (R : CommRingCat.{u})
    [HasDerivedCategory.{u} (ModuleCat.{u} R)] :
    Nonempty (tildeD R).FullyFaithful ∧
      ∀ K : _root_.DerivedCategory (Spec R).Modules,
        (∃ M, Nonempty ((tildeD R).obj M ≅ K)) ↔
          ∀ i, SheafOfModules.IsQuasicoherent (R := (Spec R).ringCatSheaf)
            ((DerivedCategory.homologyFunctor (Spec R).Modules i).obj K) := by
  sorry

end Affine

end TauCeti.AlgebraicGeometry.Scheme

namespace TauCeti.DerivedCategory

open TauCeti.AlgebraicGeometry.Scheme

/-! ### `SchemeKTheoryOperations:S.1/affine-perfect-comparison` -/

/-- **Perfect complexes on an affine scheme** (`S.1/affine-perfect-comparison`, Stacks 08EB):
`K ∈ D(A)` is a perfect module complex iff `K~` is a perfect object of `D(𝒪_{Spec A})`; hence
`D_perf(A) ≃ D_perf(𝒪_{Spec A})`. No noetherian hypothesis. The further identification with
`K^b(proj A)` is left out (the bounded homotopy category of `finiteProjectiveModules A` is not
formed here). -/
theorem affine_perfect_comparison [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]
    (R : CommRingCat.{u}) [HasDerivedCategory.{u} (ModuleCat.{u} R)] :
    (∀ K : _root_.DerivedCategory (ModuleCat.{u} R),
      IsPerfectModule R K ↔ DerivedCategory.isPerfect (Spec R) ((tildeD R).obj K)) ∧
      Nonempty ((IsPerfectModule R).FullSubcategory ≌ Dperf (Spec R)) := by
  sorry

end TauCeti.DerivedCategory

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section Waldhausen

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category` -/

/-- **`Perf(X)`** (`S.1/perfect-complicial-waldhausen-category`, TT 3.1): the object property on
complexes of `𝒪_X`-modules of perfect complexes of globally finite tor-amplitude (all perfect
complexes when `X` is quasi-compact); `Perf(X)` is its full subcategory. The complicial
biWaldhausen structure (degreewise split monomorphisms with cokernel in `Perf(X)`,
quasi-isomorphisms) is GeneralAlgebraicKTheory K.4's notion and is not constructed here. -/
def perfCategory (X : Scheme.{u}) : ObjectProperty (CochainComplex X.Modules ℤ) :=
  fun E => IsPerfect E ∧ HasFiniteTorDimension (DerivedCategory.Q.obj E)

/-- The localisation functor `Perf(X) ⥤ D_perf(𝒪_X)` (helper). -/
def perfCategory.toDperf (X : Scheme.{u}) : (perfCategory X).FullSubcategory ⥤ Dperf X :=
  ObjectProperty.lift _ ((perfCategory X).ι ⋙ DerivedCategory.Q)
    (fun E => ⟨E.obj, E.property.1, ⟨Iso.refl _⟩⟩)

-- `perfCategory.cofibration_iff`: not stated here; needs complicial biWaldhausen categories and
-- their cofibrations (supplier:
-- GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction).
-- `perfCategory.weq_iff`: not stated here; needs the Waldhausen structure's weak equivalences
-- (supplier: GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction).
-- `perfCategory.isComplicialBiWaldhausen`: not stated here; needs saturated extensional
-- complicial biWaldhausen categories, TT 1.2.11 (supplier: GeneralAlgebraicKTheory:K.4).
-- `perfCategory.cylinder`: not stated here; needs cylinder functors on Waldhausen categories
-- (supplier: GeneralAlgebraicKTheory:K.4).
-- `perfCategory.closedUnderHomotopyPushouts`: not stated here; needs canonical homotopy pushouts
-- and pullbacks of complicial categories, TT 1.9.8 (supplier: GeneralAlgebraicKTheory:K.4).

/-- `w⁻¹Perf(X) ≃ D_perf(𝒪_X)` (TT 1.9.6): for quasi-compact `X`, `Perf(X) ⥤ D_perf(𝒪_X)` is a
localisation functor for the quasi-isomorphisms. -/
theorem perfCategory.homotopyCategoryEquiv [CompactSpace X] :
    (perfCategory.toDperf X).IsLocalization
      ((HomologicalComplex.quasiIso X.Modules (ComplexShape.up ℤ)).inverseImage
        (perfCategory X).ι) := by
  sorry

/-- `Perf_Z(X)`: perfect complexes of `Perf(X)` acyclic on `X ∖ Z` (TT 3.1, used in S.3). -/
def perfCategory.supports (X : Scheme.{u}) (Z : TopologicalSpace.Closeds X) :
    ObjectProperty (CochainComplex X.Modules ℤ) :=
  fun E => perfCategory X E ∧ (restrictComplex E Z.compl).Acyclic

/-- Restriction to an open maps `Perf(X)` to `Perf(U)` (its complicial exactness is K.4's). -/
theorem perfCategory.restrict (U : X.Opens) (E : CochainComplex X.Modules ℤ)
    (hE : perfCategory X E) : perfCategory U (restrictComplex E U) := by
  sorry

-- test perfCategory_affine_homotopy (compatibility)
/- For `X = Spec A`, `w⁻¹Perf(X) ≃ D_perf(𝒪_X)` (`perfCategory.homotopyCategoryEquiv`) is
equivalent to `D_perf(A)`; the further equivalence with `K^b(proj A)` is not formed here. -/
example (R : CommRingCat.{u}) [HasDerivedCategory.{u} (ModuleCat.{u} R)] :
    Nonempty ((TauCeti.DerivedCategory.IsPerfectModule R).FullSubcategory ≌ Dperf (Spec R)) := by
  sorry

-- test perfCategory_empty (degenerate)
example (Y : Scheme.{u}) [IsEmpty Y] (E : CochainComplex Y.Modules ℤ) (hE : perfCategory Y E) :
    IsZero E := by
  sorry

-- test perfCategory_not_essentiallySmall (non-example)
/- `Perf(Spec k)` is not essentially small: the acyclic complexes `k^(S) --id--> k^(S)` lie in it
and are pairwise non-isomorphic as the cardinality of `S` varies. -/
example [∀ Y : Scheme.{0}, HasDerivedCategory.{0} Y.Modules] (k : Type) [Field k] :
    ¬ EssentiallySmall.{0} (perfCategory (Spec (.of k))).FullSubcategory := by
  sorry

-- test perfCategory_weq_not_homotopyEquiv (characterisation)
/- On `Spec k[x]` the quasi-isomorphism `(𝒪 --x--> 𝒪) → (k[x]/(x))~` is not a chain homotopy
equivalence. -/
example (k : Type u) [Field k] :
    ∃ φ : koszulComplex (.of (Polynomial k)) Polynomial.X ⟶
        single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
          (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)}))),
      QuasiIso φ ∧ IsEmpty (HomotopyEquiv (koszulComplex (.of (Polynomial k)) Polynomial.X)
        (single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
          (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)}))))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-frobenius-pair` -/

/-- Stand-in for GeneralAlgebraicKTheory K.6's **Frobenius pair** (Schlichting 5.10), as far as
this file needs it: a Frobenius exact structure (Tau Ceti's `ExactStructure.IsFrobenius`) with a
full subcategory `sub` containing the projective-injective objects. -/
structure FrobeniusPair (C : Type*) [Category C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] where
  /-- The Frobenius exact structure. -/
  exact : TauCeti.ExactStructure C
  /-- It is Frobenius. -/
  isFrobenius : exact.IsFrobenius
  /-- The subcategory `A₀`. -/
  sub : ObjectProperty C
  /-- `A₀` contains the projective-injective objects. -/
  projective_le : ∀ E, exact.isProjective E → sub E

/-- `Perf(X)` contains the zero complex (helper instance). -/
instance perfCategory_containsZero : (perfCategory X).ContainsZero := by
  sorry

/-- `Perf(X)` is closed under binary products (helper instance). -/
instance perfCategory_isClosedUnderBinaryProducts :
    (perfCategory X).IsClosedUnderBinaryProducts := by
  sorry

/-- **The Frobenius pair of perfect complexes** (`S.1/perfect-frobenius-pair`, Schlichting 5.10):
on `Perf(X)` the conflations are the *degreewise split* short exact sequences; the Frobenius
structure has the contractible complexes as projective-injectives, and `A₀` is the acyclic
complexes. The exact-structure axioms are left as `sorry`. -/
def perfFrobeniusPair (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] :
    FrobeniusPair (perfCategory X).FullSubcategory where
  exact :=
    { Conflation := fun S => ∀ n : ℤ, Nonempty
        ((S.map ((perfCategory X).ι ⋙ HomologicalComplex.eval _ _ n)).Splitting)
      isKernelCokernelPair := sorry
      isClosedUnderIsomorphisms := sorry
      isInflation_id := sorry
      isDeflation_id := sorry
      isInflation_comp := sorry
      isDeflation_comp := sorry
      hasPushouts_inflations := sorry
      isStableUnderCobaseChange_inflations := sorry
      hasPullbacks_deflations := sorry
      isStableUnderBaseChange_deflations := sorry }
  isFrobenius := sorry
  sub := fun E => E.obj.Acyclic
  projective_le := sorry

/-- An object is projective-injective iff it is a contractible complex. -/
theorem perfFrobeniusPair.projectiveInjective_iff [CompactSpace X] [QuasiSeparatedSpace X]
    (E : (perfCategory X).FullSubcategory) :
    (perfFrobeniusPair X).exact.isProjective E ↔ Nonempty (Homotopy (𝟙 E.obj) 0) := by
  sorry

-- `perfFrobeniusPair.derivedEquiv`: not stated here; needs the derived category
-- `Stable(A)/Stable(A₀)` of a Frobenius pair (supplier:
-- GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension).
-- `perfFrobeniusPair.isIdempotentComplete`: not stated here; needs the same derived category of
-- the pair (supplier: GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension).
-- `perfFrobeniusPair.map`: not stated here; needs maps of Frobenius pairs (supplier:
-- GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension).

-- test perfFrobeniusPair_contractible (characterisation)
/- The cone of `𝟙 : 𝒪_X → 𝒪_X` is projective-injective; `𝒪_X[0]` is not. -/
example (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] [Nonempty X]
    (h₁ : perfCategory X (CochainComplex.mappingCone (𝟙 (single₀ (structureModule X)))))
    (h₂ : perfCategory X (single₀ (structureModule X))) :
    (perfFrobeniusPair X).exact.isProjective ⟨_, h₁⟩ ∧
      ¬ (perfFrobeniusPair X).exact.isProjective ⟨_, h₂⟩ := by
  sorry

-- test perfFrobeniusPair_empty (degenerate)
example (Y : Scheme.{u}) [IsEmpty Y] (E : (perfCategory Y).FullSubcategory) : IsZero E := by
  sorry

-- test perfFrobeniusPair_affine (compatibility): not stated here; needs K.6's Frobenius pair
-- `(Ch^b(proj A), Ac^b(proj A))` and derived categories of Frobenius pairs (supplier:
-- GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension).

-- test perfFrobeniusPair_not_all_ses (non-example)
/- `0 → 𝒪 --x--> 𝒪 → (k[x]/(x))~ → 0` in degree `0` on `Spec k[x]` has perfect terms but its first
map has no retraction, so the sequence is not split and is not a conflation (conflations are
degreewise split). -/
example (k : Type u) [Field k] :
    IsPerfect (single₀ (structureModule (Spec (.of (Polynomial k))))) ∧
      IsPerfect (single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
        (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)})))) ∧
      ¬ ∃ r : tilde (R := .of (Polynomial k)) (ModuleCat.of _ (Polynomial k)) ⟶
          tilde (R := .of (Polynomial k)) (ModuleCat.of _ (Polynomial k)),
        (tilde.functor (.of (Polynomial k))).map
          (ModuleCat.ofHom (LinearMap.mulLeft (Polynomial k) Polynomial.X)) ≫ r = 𝟙 _ := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-enhanced-subcategory`,
`SchemeKTheoryOperations:S.1/enhancement-comparison`,
`SchemeKTheoryOperations:S.1/perfect-universe-invariance` -/

-- `perfEnhanced`: not stated here; needs E1's enhanced derived category `D^∞(𝒪_X)`, the dg nerve
-- of the K-injective model (supplier: EnhancedDerivedSheaves:E1/enhanced-derived-category and
-- EnhancedDerivedSheaves:E0/dg-nerve).
-- `perfEnhanced.isStable`: not stated here; needs stable ∞-categories (supplier:
-- EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison).
-- `perfEnhanced.isIdempotentComplete`: not stated here; needs `D^∞_perf(𝒪_X)` (supplier:
-- EnhancedDerivedSheaves:E1/enhanced-derived-category).
-- `perfEnhanced.homotopyCategory`: not stated here; needs `Ho(D^∞(𝒪_X)) ≃ D(𝒪_X)` with E0's sign
-- comparison (supplier: EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison).
-- `perfEnhanced.mappingSpace`: not stated here; needs mapping spaces and Dold–Kan of truncated
-- RHom (supplier: EnhancedDerivedSheaves:E1/enhanced-derived-category).
-- `perfEnhanced.pullback`: not stated here; needs E1's enhanced pullback (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- test perfEnhanced_pi0_mapping (computation): not stated here; needs `π₀ Map(𝒪, 𝒪[n])` in
-- `D^∞(𝒪_{Spec k})` (supplier: EnhancedDerivedSheaves:E1/enhanced-derived-category).
-- test perfEnhanced_empty (degenerate): not stated here; needs `D^∞_perf` (supplier:
-- EnhancedDerivedSheaves:E1/enhanced-derived-category).
-- test perfEnhanced_homotopy_eq_Dperf (compatibility): not stated here; needs `Ho(D^∞_perf)` as a
-- full subcategory of `DerivedCategory X.Modules` (supplier:
-- EnhancedDerivedSheaves:E1/enhanced-derived-category). Its `D(𝒪_X)` side is
-- `DerivedCategory.isPerfect X`.
-- test perfEnhanced_not_all_compact (non-example): not stated here; needs `D^∞(𝒪_X)` (supplier:
-- EnhancedDerivedSheaves:E1/enhanced-derived-category). Its `D(𝒪_X)` shadow is
-- `not_isPerfect_residue_dualNumbers` with `perfect_objects_quasiCoherent_bounded`.

/- `SchemeKTheoryOperations:S.1/enhancement-comparison`: not stated here; needs the homotopy
category of E1's `D^∞_perf(𝒪_X)` and the derived category of K.6's Frobenius pair (supplier:
EnhancedDerivedSheaves:E1/enhanced-derived-category,
EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison, GeneralAlgebraicKTheory:K.6). Its
Waldhausen leg is `perfCategory.homotopyCategoryEquiv`.
`SchemeKTheoryOperations:S.1/perfect-universe-invariance`: not stated here; needs the
change-of-universe functor on sheaves of `𝒪_X`-modules, `X.Modules ⥤ (lifted modules in universe
max u v)`, which neither library has (supplier: none planned in the packet; TT Appendix F). -/

end Waldhausen

end TauCeti.AlgebraicGeometry.Scheme

namespace TauCeti.AlgebraicGeometry.Scheme

open _root_.AlgebraicGeometry.Scheme

section ResolutionProperty

variable {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.1/resolution-property` -/

/-- **The resolution property** (`S.1/resolution-property`, Stacks 0F86, TT 2.1.3): every
quasi-coherent `𝒪_X`-module of finite type is a quotient of a finite locally free `𝒪_X`-module
(locally free *and* of finite type). A `Prop` with its actual content. -/
def HasResolutionProperty (X : Scheme.{u}) : Prop :=
  ∀ F : X.Modules, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf) F →
    SheafOfModules.IsFiniteType (R := X.ringCatSheaf) F →
      ∃ (E : X.Modules) (p : E ⟶ F), SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) E ∧
        SheafOfModules.IsFiniteType (R := X.ringCatSheaf) E ∧ Epi p

/-- Affine diagonal (helper, not a packet name): the intersection of two affine opens is affine;
for a qcqs scheme this is `IsAffineHom` of the diagonal. -/
def HasAffineDiagonal (X : Scheme.{u}) : Prop :=
  ∀ U V : X.affineOpens, IsAffineOpen ((U : X.Opens) ⊓ V)

/-- For qcqs `X` it suffices to test finitely presented modules (Stacks 0F86, Properties 23.8). -/
theorem hasResolutionProperty_iff_finitePresentation [CompactSpace X] [QuasiSeparatedSpace X] :
    HasResolutionProperty X ↔ ∀ F : X.Modules,
      SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) F →
        ∃ (E : X.Modules) (p : E ⟶ F), SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) E ∧
          SheafOfModules.IsFiniteType (R := X.ringCatSheaf) E ∧ Epi p := by
  sorry

/-- Affine schemes have the resolution property (`𝒪_X` is ample). -/
theorem hasResolutionProperty_of_isAffine [IsAffine X] : HasResolutionProperty X := by
  sorry

-- `hasResolutionProperty_of_ample`: not stated here; needs ample invertible `𝒪_X`-modules, which
-- neither library defines (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, relative
-- ampleness; Tau Ceti's `InvertibleSheaf` supplies the line bundles but not ampleness).
-- `hasResolutionProperty_of_ampleFamily`: not stated here; needs ample families of invertible
-- modules, TT 2.1.1 (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).

/-- A quasi-compact scheme all of whose local rings are regular, with affine diagonal, has the
resolution property (Stacks 0F8A). -/
theorem hasResolutionProperty_of_regular_affineDiagonal [CompactSpace X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) (hdiag : HasAffineDiagonal X) :
    HasResolutionProperty X := by
  sorry

/-- The property ascends along affine morphisms to a qcqs base with the property (Stacks 0F88).
The quasi-affine case of the node is left out: Mathlib has quasi-affine *schemes*
(`IsQuasiAffine`) but no quasi-affine morphism property. -/
theorem HasResolutionProperty.of_quasiAffine {Y : Scheme.{u}} (f : Y ⟶ X) [IsAffineHom f]
    [CompactSpace X] [QuasiSeparatedSpace X] (hX : HasResolutionProperty X) :
    HasResolutionProperty Y := by
  sorry

/-- For qcqs `X`, the resolution property forces affine diagonal
(`S.1/resolution-property-affine-diagonal`). -/
theorem HasResolutionProperty.affineDiagonal [CompactSpace X] [QuasiSeparatedSpace X]
    (hX : HasResolutionProperty X) : HasAffineDiagonal X := by
  sorry

attribute [local instance] MvPolynomial.gradedAlgebra in
/-- The projective line `ℙ¹_k = Proj k[X₀, X₁]` (Mathlib's `Proj` of the degree grading;
test helper). -/
abbrev projectiveLine (k : Type u) [Field k] : Scheme.{u} :=
  Proj (MvPolynomial.homogeneousSubmodule (Fin 2) k)

-- test hasResolutionProperty_projectiveLine (computation)
/- `ℙ¹_k` has the resolution property. The explicit surjections `𝒪(-n)^m → F` of the test need the
twisting sheaves `𝒪(n)` on `Proj`, which neither library has (supplier:
AlgebraicModuliForArithmeticGeometry:R09.1); that clause is left out. -/
example (k : Type u) [Field k] : HasResolutionProperty (projectiveLine k) := by
  sorry

-- test hasResolutionProperty_spec (degenerate)
example (R : CommRingCat.{u}) :
    HasResolutionProperty (Spec R) ∧ ∀ (Y : Scheme.{u}) [IsEmpty Y], HasResolutionProperty Y := by
  sorry

-- test not_hasResolutionProperty_doubledPlane (non-example): not stated here; needs the affine
-- plane with doubled origin as a scheme (supplier:
-- SchemeKTheoryOperations:S.1/doubled-plane-counterexample; Mathlib's `Scheme.GlueData` has no
-- such declaration). Suggested form: `¬ HasResolutionProperty X ∧ ¬ HasAffineDiagonal X`.

-- test hasResolutionProperty_doubledLine (compatibility): not stated here; needs the affine line
-- with doubled origin as a scheme (supplier:
-- SchemeKTheoryOperations:S.1/doubled-plane-counterexample). Suggested form:
-- `HasAffineDiagonal X ∧ HasResolutionProperty X`, via
-- `hasResolutionProperty_of_regular_affineDiagonal`.

/-! ### `SchemeKTheoryOperations:S.1/resolution-property-affine-diagonal` -/

/-- **The resolution property forces affine diagonal**
(`S.1/resolution-property-affine-diagonal`, Stacks 0F8C, Totaro 1.3): for a qcqs scheme with the
resolution property, the intersection of any two affine opens is affine. -/
theorem resolutionProperty_affine_diagonal [CompactSpace X] [QuasiSeparatedSpace X]
    (hX : HasResolutionProperty X) : HasAffineDiagonal X := by
  sorry

section Derived

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]

/-! ### `SchemeKTheoryOperations:S.1/resolution-property-strict-representatives` -/

/-- **Vector-bundle models under the resolution property**
(`S.1/resolution-property-strict-representatives`, Stacks 0F8E–0F8H), for qcqs `X`: (1) a bounded
below complex of quasi-coherent modules representing a perfect object receives a
quasi-isomorphism from a strictly perfect complex; (2) every perfect object is represented by a
strictly perfect complex; (3) maps in `D(𝒪_X)` between strictly perfect complexes are roofs
`E ← G → F` with `G` strictly perfect and `G → E` a quasi-isomorphism; (4) two maps of complexes
that agree in `D(𝒪_X)` become homotopic after precomposition with such a quasi-isomorphism. -/
theorem resolutionProperty_strict_representatives [CompactSpace X] [QuasiSeparatedSpace X]
    (hX : HasResolutionProperty X) :
    (∀ F : CochainComplex X.Modules ℤ, (∃ a : ℤ, F.IsStrictlyGE a) →
      (∀ i, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf) (F.X i)) →
        DerivedCategory.isPerfect X (DerivedCategory.Q.obj F) →
          ∃ (E : CochainComplex X.Modules ℤ) (φ : E ⟶ F), IsStrictlyPerfect E ∧ QuasiIso φ) ∧
      (∀ K, DerivedCategory.isPerfect X K →
        ∃ E : CochainComplex X.Modules ℤ, IsStrictlyPerfect E ∧
          Nonempty (DerivedCategory.Q.obj E ≅ K)) ∧
      (∀ E F : CochainComplex X.Modules ℤ, IsStrictlyPerfect E → IsStrictlyPerfect F →
        ∀ α : DerivedCategory.Q.obj E ⟶ DerivedCategory.Q.obj F,
          ∃ (G : CochainComplex X.Modules ℤ) (s : G ⟶ E) (t : G ⟶ F),
            IsStrictlyPerfect G ∧ QuasiIso s ∧
              DerivedCategory.Q.map s ≫ α = DerivedCategory.Q.map t) ∧
      ∀ (E F : CochainComplex X.Modules ℤ) (α β : E ⟶ F), IsStrictlyPerfect E →
        IsStrictlyPerfect F → DerivedCategory.Q.map α = DerivedCategory.Q.map β →
          ∃ (G : CochainComplex X.Modules ℤ) (γ : G ⟶ E), IsStrictlyPerfect G ∧ QuasiIso γ ∧
            Nonempty (Homotopy (γ ≫ α) (γ ≫ β)) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/vector-bundle-comparison` -/

/-- `SPerf(X)`, strictly perfect complexes as an object property (helper). -/
def sPerf (X : Scheme.{u}) : ObjectProperty (CochainComplex X.Modules ℤ) :=
  fun E => IsStrictlyPerfect E

/-- The functor from strictly perfect complexes to `D_perf(𝒪_X)` (helper). -/
def strictlyPerfectToDperf (X : Scheme.{u}) : (sPerf X).FullSubcategory ⥤ Dperf X :=
  ObjectProperty.lift _ ((sPerf X).ι ⋙ DerivedCategory.Q)
    (fun E => ⟨E.obj, IsStrictlyPerfect.isPerfect E.property, ⟨Iso.refl _⟩⟩)

/-- **Vector-bundle comparison** (`S.1/vector-bundle-comparison`, Stacks 0F8I, TT 2.3.1(d), 3.8):
for a qcqs scheme with the resolution property, `S⁻¹K^b(Vect X) ≃ D_perf(𝒪_X)`; stated as:
the functor from strictly perfect complexes (bounded complexes of finite locally free modules) to
`D_perf(𝒪_X)` is a localisation functor for the quasi-isomorphisms (localising the category of
bounded complexes or its homotopy category `K^b` at quasi-isomorphisms gives the same category). -/
theorem vector_bundle_comparison [CompactSpace X] [QuasiSeparatedSpace X]
    (hX : HasResolutionProperty X) :
    (strictlyPerfectToDperf X).IsLocalization
      ((HomologicalComplex.quasiIso X.Modules (ComplexShape.up ℤ)).inverseImage
        (sPerf X).ι) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.1/perfect-waldhausen-models` -/

/-- `P` is a model of `Perf(X)` (helper): the perfect complexes of `Perf(X)` satisfying `P`, with
the quasi-isomorphisms, have homotopy category `D_perf(𝒪_X)`, i.e. `(Perf(X) ⊓ P) ⥤ D_perf(𝒪_X)`
is a localisation functor for the quasi-isomorphisms. -/
def IsPerfModel (X : Scheme.{u}) (P : ObjectProperty (CochainComplex X.Modules ℤ)) : Prop :=
  (ObjectProperty.lift (DerivedCategory.isPerfect X) ((perfCategory X ⊓ P).ι ⋙ DerivedCategory.Q)
      (fun E => ⟨E.obj, E.property.1.1, ⟨Iso.refl _⟩⟩)).IsLocalization
    ((HomologicalComplex.quasiIso X.Modules (ComplexShape.up ℤ)).inverseImage
      (perfCategory X ⊓ P).ι)

/-- **Model subcategories of `Perf(X)`** (`S.1/perfect-waldhausen-models`, TT 3.5–3.8): for `X`
quasi-compact, (i) strictly bounded, (ii) bounded above flat, (iii) bounded below injective and
(iv) bounded below flasque perfect complexes are models; (v) complexes of quasi-coherent modules
if moreover `X` has affine diagonal or is noetherian; (vi) bounded complexes of coherent modules
if `X` is noetherian; (vii) strictly perfect complexes if `X` is qcqs with the resolution
property. The versions acyclic off `Z` are not restated. -/
theorem perfect_waldhausen_models [CompactSpace X] :
    IsPerfModel X (fun E => ∃ a b : ℤ, E.IsStrictlyGE a ∧ E.IsStrictlyLE b) ∧
      IsPerfModel X (fun E => (∃ b : ℤ, E.IsStrictlyLE b) ∧ ∀ i, IsFlatModule (E.X i)) ∧
      IsPerfModel X (fun E => (∃ a : ℤ, E.IsStrictlyGE a) ∧ ∀ i, Injective (E.X i)) ∧
      IsPerfModel X (fun E => (∃ a : ℤ, E.IsStrictlyGE a) ∧
        ∀ i, TopCat.Presheaf.IsFlasque (E.X i).presheaf) ∧
      (HasAffineDiagonal X ∨ _root_.AlgebraicGeometry.IsNoetherian X →
        IsPerfModel X
          (fun E => ∀ i, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf) (E.X i))) ∧
      (_root_.AlgebraicGeometry.IsNoetherian X →
        IsPerfModel X (fun E => (∃ a b : ℤ, E.IsStrictlyGE a ∧ E.IsStrictlyLE b) ∧
          ∀ i, SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) (E.X i))) ∧
      (QuasiSeparatedSpace X → HasResolutionProperty X → IsPerfModel X (sPerf X)) := by
  sorry

end Derived

/-! ### `SchemeKTheoryOperations:S.1/doubled-plane-counterexample`,
`SchemeKTheoryOperations:S.1/perfect-complexes-on-limits` -/

/- `SchemeKTheoryOperations:S.1/doubled-plane-counterexample`: not stated here; needs the affine
`n`-space with doubled origin as a scheme (two copies of `𝔸ⁿ_k` glued along `𝔸ⁿ ∖ 0`), which no
declaration of either library provides, and the input that `Vect(X) → Vect(𝔸ⁿ)` is an
equivalence (the packet's gap "Vector bundles on affine space with doubled origin") (supplier:
the gap; gluing through Mathlib's `Scheme.GlueData`). Suggested form: the skyscraper `k(0′)` in
degree `0` satisfies `IsPerfect`, but no strictly perfect complex is isomorphic to it in
`D(𝒪_X)`, and `¬ HasResolutionProperty X`.
`SchemeKTheoryOperations:S.1/perfect-complexes-on-limits`: not stated here; needs the derived
pullbacks `Lf_i^*` along the projections of a limit of schemes and the colimit of the categories
`D_perf(𝒪_{S_i})` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, with
AdicCoefficientsAndComparisons:L2 for the approximation). Mathlib's `isAffineHom_π_app`,
`exists_preimage_eq` and `Scheme.exists_isOpenCover_and_isAffine` are the limit inputs. -/

end ResolutionProperty

end TauCeti.AlgebraicGeometry.Scheme

/-! ## Stage `SchemeKTheoryOperations:S.2` — K- and G-theory of schemes

K-theory spectra, their homotopy groups in degrees `n ≥ 1`, and all maps of spectra are in neither
pinned library (GeneralAlgebraicKTheory K.1, K.4, K.6 and StableHomotopyKTheory H.5 supply them);
statements about them are comments. **Degree zero has honest algebraic carriers**, defined here
as helpers (not packet names) and used for every degree-zero statement and test:

* `Scheme.K0 X := TauCeti.TriangulatedK0 (Dperf X)` for qcqs `X` — Stacks' `K_0(X)` (0FDG), which
  `S.2/k-zero-of-a-scheme` identifies with `π₀ K(X)`;
* `Scheme.K0Vect X := TauCeti.ExactK0` of the finite locally free `𝒪_X`-modules with the exact
  structure induced from `X.Modules` — `K_0` of vector bundles (`π₀ K^naive(X)`, TT 3.10);
* `Scheme.G0 X := TauCeti.ExactK0` of Tau Ceti's `FinitelyPresentedSheaf X` (coherent sheaves)
  for locally noetherian `X` — `G_0(X)` (`S.2/g-theory-of-a-scheme`'s `Scheme.G.zero_eq_exactK0`);
* `Scheme.cartanVect : K0Vect X →+ G0 X`, the degree-zero Cartan map on vector bundles, induced by
  the exact inclusion (reusing `TauCeti.ExactK0.map`), and on `Spec R` compared with Tau Ceti's
  `TauCeti.cartanMap R`; `Scheme.cartanZero : K0 X →+ G0 X`, `[E] ↦ Σ (-1)^i [H^i E]`
  (data, `sorry` body). -/

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

section Carriers

variable {X : Scheme.{u}}

/-- Finite locally free `𝒪_X`-modules (vector bundles), as an object property (helper). -/
def vectorBundles (X : Scheme.{u}) : ObjectProperty X.Modules :=
  fun M => SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) M ∧
    SheafOfModules.IsFiniteType (R := X.ringCatSheaf) M

instance vectorBundles_containsZero : (vectorBundles X).ContainsZero := by
  sorry

instance vectorBundles_isClosedUnderBinaryProducts :
    (vectorBundles X).IsClosedUnderBinaryProducts := by
  sorry

/-- Vector bundles are closed under extensions in `X.Modules` (helper). -/
theorem vectorBundles_isExtensionClosed (X : Scheme.{u}) :
    (TauCeti.ExactStructure.abelian X.Modules).IsExtensionClosed (vectorBundles X) := by
  sorry

/-- The exact structure on vector bundles induced from `X.Modules` (helper; the conflations are
the short exact sequences of vector bundles, locally split). -/
def vectExactStructure (X : Scheme.{u}) :
    TauCeti.ExactStructure (vectorBundles X).FullSubcategory :=
  (TauCeti.ExactStructure.abelian X.Modules).fullSubcategory _ (vectorBundles_isExtensionClosed X)

instance vectorBundles_essentiallySmall :
    EssentiallySmall.{u} (vectorBundles X).FullSubcategory := by
  sorry

/-- `K_0` of vector bundles (helper carrier): exact `K₀` of `Vect(X)`. -/
abbrev Scheme.K0Vect (X : Scheme.{u}) : Type u := TauCeti.ExactK0.{u} (vectExactStructure X)

/-- Coherent (finitely presented) `𝒪_X`-modules as an object property of `X.Modules` (helper): the
object property `SheafOfModules.isFinitePresentation` of Tau Ceti's `FinitelyPresentedSheaf X`,
read in `X.Modules` so that Mathlib's abelian and zero-object instances of `X.Modules` apply
(`FinitelyPresentedSheaf X` is formed in `SheafOfModules X.ringCatSheaf`, which carries none). -/
def coherent (X : Scheme.{u}) : ObjectProperty X.Modules :=
  SheafOfModules.isFinitePresentation X.ringCatSheaf

instance coherent_containsZero : (coherent X).ContainsZero := by
  sorry

instance coherent_isClosedUnderBinaryProducts : (coherent X).IsClosedUnderBinaryProducts := by
  sorry

/-- On a locally noetherian scheme coherent sheaves are closed under extensions (helper). -/
theorem coherent_isExtensionClosed (X : Scheme.{u}) [IsLocallyNoetherian X] :
    (TauCeti.ExactStructure.abelian X.Modules).IsExtensionClosed (coherent X) := by
  sorry

/-- The abelian exact structure on `Coh(X)`, the objects of Tau Ceti's `FinitelyPresentedSheaf X`
(helper). -/
def cohExactStructure (X : Scheme.{u}) [IsLocallyNoetherian X] :
    TauCeti.ExactStructure (coherent X).FullSubcategory :=
  (TauCeti.ExactStructure.abelian X.Modules).fullSubcategory _ (coherent_isExtensionClosed X)

instance coherent_essentiallySmall : EssentiallySmall.{u} (coherent X).FullSubcategory := by
  sorry

/-- `G_0` of a locally noetherian scheme (helper carrier): exact `K₀` of `Coh(X)`. -/
abbrev Scheme.G0 (X : Scheme.{u}) [IsLocallyNoetherian X] : Type u :=
  TauCeti.ExactK0.{u} (cohExactStructure X)

/-- Finite locally free modules are finitely presented (helper). -/
theorem vectorBundles_le_coherent (X : Scheme.{u}) : vectorBundles X ≤ coherent X := by
  sorry

/-- **The degree-zero Cartan map on vector bundles** (helper): `K_0(Vect X) → G_0(X)`,
`[V] ↦ [V]`, induced by the exact inclusion `Vect(X) ⊆ Coh(X)` (Tau Ceti's `ExactK0.map`). -/
def Scheme.cartanVect (X : Scheme.{u}) [IsLocallyNoetherian X] :
    Scheme.K0Vect X →+ Scheme.G0 X :=
  TauCeti.ExactK0.map _ (TauCeti.ExactStructure.isConflationExact_ιOfLE
    (hP := vectorBundles_isExtensionClosed X) (coherent_isExtensionClosed X)
    (vectorBundles_le_coherent X))

/-- `K_0(Vect(Spec R)) ≃ K_0(proj R)` induced by `P ↦ P~` (helper; data, `sorry` body: tilde is
an exact equivalence from finitely generated projective `R`-modules onto vector bundles). -/
def Scheme.K0VectSpecEquiv (R : CommRingCat.{u}) :
    Scheme.K0Vect (Spec R) ≃+
      TauCeti.ExactK0.{u} (TauCeti.finiteProjectiveModulesExactStructure R) :=
  sorry

/-- `G_0(Spec R) ≃ G_0(mod R)` induced by `M ↦ M~` for noetherian `R` (helper; data, `sorry`
body: tilde is an exact equivalence `mod R ≃ Coh(Spec R)`). -/
def Scheme.G0SpecEquiv (R : CommRingCat.{u}) [IsNoetherianRing R] :
    Scheme.G0 (Spec R) ≃+ TauCeti.ExactK0.{u} (TauCeti.finiteModulesExactStructure R) :=
  sorry

/-- The dual numbers `k[ε]` over a field are noetherian (helper instance; finite over `k`). -/
instance dualNumber_isNoetherianRing (k : Type u) [Field k] : IsNoetherianRing (DualNumber k) := by
  sorry

section Derived

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]

/-- `K_0(X)` of a qcqs scheme (helper carrier): Tau Ceti's triangulated `K₀` of `D_perf(𝒪_X)`,
defined because `D_perf(𝒪_X)` is essentially small (`perfect_essentiallySmall`). -/
abbrev Scheme.K0 (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] : Type u :=
  TauCeti.TriangulatedK0.{u} (Dperf X)

/-- `K_0(Vect X) → K_0(X)`, `[V] ↦ [V[0]]` (helper; data, `sorry` body: a short exact sequence of
vector bundles gives a distinguished triangle). -/
def Scheme.vectToK0 (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] :
    Scheme.K0Vect X →+ Scheme.K0 X :=
  sorry

/-- The degree-zero Cartan map `K_0(X) → G_0(X)`, `[E] ↦ Σ_i (-1)^i [H^i(E)]`, for noetherian `X`
(helper; data, `sorry` body: the cohomology sheaves of a perfect complex are coherent and almost
all zero, `perfect_objects_quasiCoherent_bounded`). -/
def Scheme.cartanZero (X : Scheme.{u}) [_root_.AlgebraicGeometry.IsNoetherian X] :
    Scheme.K0 X →+ Scheme.G0 X :=
  sorry

end Derived

end Carriers

end TauCeti.AlgebraicGeometry.KTheory

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

section KTheory

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.2/k-theory-of-a-scheme`

**K-theory conventions (pinned):** `K(X) := K(Perf(X))`, Waldhausen's K-theory of the complicial
biWaldhausen category of perfect complexes of globally finite tor-amplitude in *all*
`𝒪_X`-modules (TT 3.1); `K_n(X) = π_n K(X)`. `G(X)` is Quillen's K-theory of `Coh(X)` for
noetherian `X`. Degree zero is `Scheme.K0`, `Scheme.G0` above. -/

-- `Scheme.K`: not stated here; needs Waldhausen's K-theory spectrum of a complicial
-- biWaldhausen category and `π_n` of spectra (supplier:
-- GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction,
-- StableHomotopyKTheory:H.5:spectra). Its degree-zero group is `Scheme.K0` (via
-- `S.2/k-zero-of-a-scheme`).
-- `Scheme.KOn`: not stated here; needs `K(X on Z)`, Waldhausen K-theory of `perfCategory.supports`
-- (supplier: GeneralAlgebraicKTheory:K.4).
-- `Scheme.Knaive`: not stated here; needs Quillen's K-theory spectrum of `Vect(X)` (supplier:
-- GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories). Its `π₀` is `Scheme.K0Vect`.
-- `Scheme.Knaive_to_K`: not stated here; needs `K^naive(X)` and `K(X)` (supplier:
-- GeneralAlgebraicKTheory:K.4). Its degree-zero map is `Scheme.vectToK0`.

/-- `Scheme.K.class`: the class `[E] ∈ K_0(X)` of a perfect complex, on the degree-zero carrier;
it is additive on distinguished triangles and invariant under quasi-isomorphism by Tau Ceti's
`TriangulatedK0.of_distTriang` and `of_congr` (TT 1.5.6). -/
def Scheme.K.«class» [CompactSpace X] [QuasiSeparatedSpace X] (E : CochainComplex X.Modules ℤ)
    (hE : IsPerfect E) : Scheme.K0 X :=
  TauCeti.TriangulatedK0.of ⟨DerivedCategory.Q.obj E, E, hE, ⟨Iso.refl _⟩⟩

-- `Scheme.K.pullback`: not stated here; needs `K(Y) → K(X)` (supplier: GeneralAlgebraicKTheory:K.4,
-- through `SchemeKTheoryOperations:S.2/k-theory-pullback`).
-- `Scheme.K.pushforward`: not stated here; needs `K(X) → K(Y)` for proper perfect `f` (supplier:
-- GeneralAlgebraicKTheory:K.4, through `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`).
-- `Scheme.K.affineEquiv`: not stated here; needs the equivalence of spectra `K(Spec A) ≃ K(A)`
-- (supplier: GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison). Its degree-zero form is
-- `affine_k_theory_comparison` below.
-- `Scheme.K.zero_eq_triangulatedK0`: not stated here; needs `π₀ K(X)` (supplier:
-- GeneralAlgebraicKTheory:K.4); the right-hand side is the carrier `Scheme.K0 X`.
-- `Scheme.K.nonconnective`: not stated here; needs K.6's nonconnective spectrum (supplier:
-- GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance).

-- test K_zero_spec_field (computation)
/- `K_0(Spec F) ≅ ℤ` by the Euler characteristic `[E] ↦ Σ (-1)^i dim H^i(E)` (dimensions of global
sections over `Γ(Spec F, ⊤) ≅ F`); the degree-zero carrier `Scheme.K0`. -/
example (F : Type u) [Field F] :
    ∃ e : Scheme.K0 (Spec (.of F)) ≃+ ℤ, ∀ E : Dperf (Spec (.of F)),
      e (TauCeti.TriangulatedK0.of E) = ∑ᶠ i : ℤ, (i.negOnePow : ℤ) *
        (Module.finrank Γ(Spec (.of F), ⊤)
          Γ((DerivedCategory.homologyFunctor (Spec (.of F)).Modules i).obj E.obj, ⊤) : ℤ) := by
  sorry

-- test K_empty (degenerate)
/- Degree-zero part: `K_0(∅) = 0`. That `K(∅)` is contractible and `K_n(∅) = 0` for `n ≥ 1` needs
`K(X)` (supplier: GeneralAlgebraicKTheory:K.4). -/
example (Y : Scheme.{u}) [IsEmpty Y] : Subsingleton (Scheme.K0 Y) := by
  sorry

-- test K_zero_spec_eq_ringK0 (compatibility)
/- `K_0(Spec A) ≅ K_0(A)` (KTheoryLowDegrees Z.1's ring `K₀`, Tau Ceti's `SplitK0` of the
finitely generated projectives), `[P~] ↦ [P]` (Stacks 0FDH). -/
example (R : CommRingCat.{u}) :
    ∃ e : Scheme.K0 (Spec R) ≃+ TauCeti.RingK0 R,
      ∀ (P : TauCeti.RingK0.FP R)
        (h : DerivedCategory.isPerfect (Spec R) (DerivedCategory.Q.obj (single₀ (tilde P.obj)))),
        e (TauCeti.TriangulatedK0.of ⟨_, h⟩) = (TauCeti.SplitK0.of P : TauCeti.RingK0 R) := by
  sorry

-- test K_ne_Knaive_doubledPlane (non-example): not stated here; needs the affine plane with
-- doubled origin as a scheme (supplier: SchemeKTheoryOperations:S.1/doubled-plane-counterexample).
-- Suggested degree-zero form: `¬ Function.Surjective (Scheme.vectToK0 X)`.

-- test K_zero_class_skyscraper_affineLine (computation)
/- `[(k[x]/(x))~] = [𝒪] - [𝒪] = 0` in `K_0(Spec k[x])`. -/
example (k : Type u) [Field k]
    (h : IsPerfect (single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
      (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)}))))) :
    Scheme.K.«class» _ h = 0 := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/k-theory-model-invariance`,
`SchemeKTheoryOperations:S.2/k-zero-of-a-scheme` -/

/- `SchemeKTheoryOperations:S.2/k-theory-model-invariance`: not stated here; needs homotopy
equivalences of K-theory spectra induced by the model inclusions (supplier:
GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem). The homotopy-category input is
`perfect_waldhausen_models`.
`SchemeKTheoryOperations:S.2/k-zero-of-a-scheme`: not stated here; needs `π₀ K(Perf X)` (supplier:
GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction). Its target is
the carrier `Scheme.K0 X = TauCeti.TriangulatedK0 (Dperf X)`, on which `[E[k]] = (-1)^k [E]` is
Tau Ceti's `TriangulatedK0.of_shift`. -/

/-! ### `SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme` -/

-- `Scheme.KB`: not stated here; needs K.6's nonconnective `IK` of a Frobenius pair (supplier:
-- GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance); its input pair is
-- `perfFrobeniusPair`.
-- `Scheme.K_to_KB`: not stated here; needs `K(X)` and `𝕂(X)` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `Scheme.K_to_KB_iso`: not stated here; needs `π_n` of both spectra (supplier:
-- GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K).
-- `Scheme.KB_neg_eq_thomason`: not stated here; needs Thomason's `K^B` (supplier:
-- GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K).
-- `Scheme.KB_affine`: not stated here; needs Bass's negative K-groups (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `Scheme.KB_neg_eq_zero_of_regular`: not stated here; needs `π_n 𝕂(X)`, `n < 0` (supplier:
-- GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K).
-- test KB_zero_spec (computation): not stated here; needs `π₀ 𝕂(Spec A)` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test KB_empty (degenerate): not stated here; needs `𝕂(∅)` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test KB_neg_regular_zero (compatibility): not stated here; needs `π_{-1} 𝕂(Spec ℤ)` (supplier:
-- GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K).
-- test KB_neg_node_nonzero (non-example): not stated here; needs `K_{-1}` of the node (supplier:
-- GeneralAlgebraicKTheory:K.6).

end KTheory

section GTheory

variable {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.2/g-theory-of-a-scheme` -/

-- `Scheme.G`: not stated here; needs Quillen's K-theory spectrum of the abelian category `Coh(X)`
-- (supplier: GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories). Its `π₀` is `Scheme.G0`.

/-- `Scheme.G.class`: the class `[F] ∈ G_0(X)` of a coherent sheaf, additive on short exact
sequences (Tau Ceti's `ExactK0.of`, on the degree-zero carrier). -/
def Scheme.G.«class» [IsLocallyNoetherian X] (F : X.Modules)
    (hF : SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) F) : Scheme.G0 X :=
  TauCeti.ExactK0.of ⟨F, hF⟩

-- `Scheme.G.equivPsCoh`: not stated here; needs `K(PsCoh^b(X))` and `K(Ch^b Coh X)` (supplier:
-- GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison).
-- `Scheme.G.pushforward`: not stated here; needs `G(X) → G(Y)` (supplier:
-- GeneralAlgebraicKTheory:K.4, through `SchemeKTheoryOperations:S.2/g-theory-proper-pushforward`).
-- `Scheme.G.pullback`: not stated here; needs `G(Y) → G(X)` (supplier: GeneralAlgebraicKTheory:K.4,
-- through `SchemeKTheoryOperations:S.2/g-theory-finite-tor-pullback`).
-- `Scheme.G.affineEquiv`: not stated here; needs `G(Spec R) ≃ G(R)` of spectra (supplier:
-- GeneralAlgebraicKTheory:K.1); its degree-zero form is `affine_k_theory_comparison`.
-- `Scheme.G.zero_eq_exactK0`: not stated here; needs `π₀ G(X)` and K.1's identification
-- `π₁ BQ = ExactK0` (supplier: GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0); its right-hand side
-- is the carrier `Scheme.G0 X`.

-- test G_zero_spec_field (computation)
example (F : Type u) [Field F] :
    ∃ e : Scheme.G0 (Spec (.of F)) ≃+ ℤ, ∀ (M : (coherent (Spec (.of F))).FullSubcategory),
      e (TauCeti.ExactK0.of M) = Module.finrank Γ(Spec (.of F), ⊤) Γ(M.obj, ⊤) := by
  sorry

-- test G_empty (degenerate)
/- Degree-zero part `G_0(∅) = 0`; the contractibility of `G(∅)` needs `G(X)` (supplier:
GeneralAlgebraicKTheory:K.1). -/
example (Y : Scheme.{u}) [IsEmpty Y] [IsLocallyNoetherian Y] : Subsingleton (Scheme.G0 Y) := by
  sorry

-- test G_zero_spec_eq_tauceti (compatibility)
example (R : CommRingCat.{u}) [IsNoetherianRing R] (M : ModuleCat.{u} R) (hM : ModuleCat.isFG R M)
    (h : SheafOfModules.IsFinitePresentation (R := (Spec R).ringCatSheaf) (tilde M)) :
    Scheme.G0SpecEquiv R (Scheme.G.«class» (tilde M) h) = TauCeti.ExactK0.of ⟨M, hM⟩ := by
  sorry

-- test G_zero_dualNumbers (computation)
/- `G_0(Spec k[ε]) ≅ ℤ` generated by `[k]`, with `[𝒪] = 2[k]` (from `0 → k --ε--> k[ε] → k → 0`). -/
example (k : Type u) [Field k]
    (hk : SheafOfModules.IsFinitePresentation (R := (Spec (.of (DualNumber k))).ringCatSheaf)
      (tilde (dualNumbersResidue k)))
    (hO : SheafOfModules.IsFinitePresentation (R := (Spec (.of (DualNumber k))).ringCatSheaf)
      (structureModule (Spec (.of (DualNumber k))))) :
    (∃ e : Scheme.G0 (Spec (.of (DualNumber k))) ≃+ ℤ, e (Scheme.G.«class» _ hk) = 1) ∧
      Scheme.G.«class» _ hO = 2 • Scheme.G.«class» _ hk := by
  sorry

-- test G_ne_K_dualNumbers_map (non-example)
/- `K_0(Spec k[ε]) ≅ ℤ ≅ G_0(Spec k[ε])` abstractly, but the Cartan map is `×2`, not an
isomorphism. -/
example (k : Type u) [Field k] :
    Nonempty (Scheme.K0Vect (Spec (.of (DualNumber k))) ≃+ ℤ) ∧
      Nonempty (Scheme.G0 (Spec (.of (DualNumber k))) ≃+ ℤ) ∧
      ¬ Function.Bijective (Scheme.cartanVect (Spec (.of (DualNumber k)))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/g-theory-models` -/

/- `SchemeKTheoryOperations:S.2/g-theory-models`: not stated here; needs the K-theory spectra of
`Coh(X)`, `Ch^b(Coh X)` and `PsCoh^b(X)` (supplier:
GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison and K.4/waldhausen-approximation-theorem).
-/

end GTheory

section Pullback

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X Y : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.2/derived-pullback-perfect` -/

/-- `Perf^flat(X)`: perfect complexes of `Perf(X)` that are bounded above with flat terms
(helper; the model (ii) of `perfect_waldhausen_models`). -/
def perfFlat (X : Scheme.{u}) : ObjectProperty (CochainComplex X.Modules ℤ) :=
  perfCategory X ⊓ fun E => (∃ b : ℤ, E.IsStrictlyLE b) ∧ ∀ i, IsFlatModule (E.X i)

/-- **Derived pullback of perfect complexes** (`S.2/derived-pullback-perfect`, TT 3.14): for any
`f : X ⟶ Y`, the degreewise pullback `Perf^flat(Y) ⥤ Perf^flat(X)` (Mathlib's
`Scheme.Modules.pullback` applied termwise; the membership proof is left as `sorry`). -/
def perfPullback (f : X ⟶ Y) : (perfFlat Y).FullSubcategory ⥤ (perfFlat X).FullSubcategory :=
  ObjectProperty.lift _ ((perfFlat Y).ι ⋙
    (Scheme.Modules.pullback f).mapHomologicalComplex (ComplexShape.up ℤ)) (fun _ => by sorry)

-- `perfPullback.isComplicialExact`: not stated here; needs complicial exact functors of Waldhausen
-- categories (supplier:
-- GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction).
-- `perfPullback.represents`: not stated here; needs the derived pullback `Lf^*` on `D_perf`
-- (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

/-- `f^* ∘ g^* ≅ (g ∘ f)^*` naturally (Mathlib's `pullbackComp`, termwise); the pseudofunctor
coherences (`Scheme.Modules.pseudofunctor`) are not restated. -/
theorem perfPullback.comp {Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    Nonempty (perfPullback g ⋙ perfPullback f ≅ perfPullback (f ≫ g)) := by
  sorry

/-- `id^* ≅ id`. -/
theorem perfPullback.id (X : Scheme.{u}) : Nonempty (perfPullback (𝟙 X) ≅ 𝟭 _) := by
  sorry

/-- `f^*` maps complexes acyclic off a closed `Z ⊆ Y` to complexes acyclic off `f⁻¹(Z)`. -/
theorem perfPullback.supports (f : X ⟶ Y) (Z : TopologicalSpace.Closeds Y)
    (E : (perfFlat Y).FullSubcategory) (hE : (restrictComplex E.obj Z.compl).Acyclic) :
    (restrictComplex ((perfPullback f).obj E).obj (f ⁻¹ᵁ Z.compl)).Acyclic := by
  sorry

/-- On strictly perfect complexes it is the degreewise pullback of vector bundles, again strictly
perfect. -/
theorem perfPullback.strict (f : X ⟶ Y) (E : (perfFlat Y).FullSubcategory)
    (hE : IsStrictlyPerfect E.obj) :
    ((perfPullback f).obj E).obj =
        ((Scheme.Modules.pullback f).mapHomologicalComplex (ComplexShape.up ℤ)).obj E.obj ∧
      IsStrictlyPerfect ((perfPullback f).obj E).obj := by
  sorry

-- test perfPullback_open (compatibility)
/- For an open immersion `j : U → X`, `j^*` is Mathlib's restriction, termwise
(`Scheme.Modules.restrictFunctorIsoPullback`). -/
example (U : X.Opens) (E : (perfFlat X).FullSubcategory) :
    Nonempty (((perfPullback U.ι).obj E).obj ≅ restrictComplex E.obj U) := by
  sorry

-- test perfPullback_point (computation)
/- For the origin `ι : Spec k → Spec k[x]`, `ι^*` of the flat resolution `𝒪 --x--> 𝒪` of
`(k[x]/(x))~` is `k --0--> k`: its cohomology is `k` in degrees `-1` and `0`. -/
example (k : Type u) [Field k] :
    ∀ j : ℤ, j = -1 ∨ j = 0 → Nonempty
      ((((Scheme.Modules.pullback
          (Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k))))).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj (koszulComplex (.of (Polynomial k)) Polynomial.X)).homology j ≅
          structureModule (Spec (.of k))) := by
  sorry

-- test perfPullback_id (degenerate)
example (X : Scheme.{u}) (E : (perfFlat X).FullSubcategory) :
    Nonempty ((perfPullback (𝟙 X)).obj E ≅ E) := by
  sorry

-- test perfPullback_not_underived (non-example)
/- The underived pullback of the non-flat `(k[x]/(x))~` along the origin is `k` in degree `0`, with
`H^{-1} = 0`, whereas `Lι^* = k ⊕ k[1]` (computed on the flat model above) has `H^{-1} = k ≠ 0`. -/
example (k : Type u) [Field k] :
    IsZero ((((Scheme.Modules.pullback
        (Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k))))).mapHomologicalComplex
      (ComplexShape.up ℤ)).obj (single₀ (tilde (R := .of (Polynomial k)) (ModuleCat.of _
        (Polynomial k ⧸ Ideal.span {(Polynomial.X : Polynomial k)}))))).homology (-1)) ∧
      ¬ IsZero ((((Scheme.Modules.pullback
          (Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k))))).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj (koszulComplex (.of (Polynomial k)) Polynomial.X)).homology
          (-1)) := by
  sorry

end Pullback

end TauCeti.AlgebraicGeometry.KTheory

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

/-! ### `SchemeKTheoryOperations:S.2/k-theory-pullback` -/

-- `Scheme.K.pullback`: not stated here; needs `f^* : K(Y) → K(X)` on spectra (supplier:
-- GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction); already on
-- `K_0` it needs `Lf^* : D_perf(𝒪_Y) ⥤ D_perf(𝒪_X)` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor). Its chain-level functor is
-- `perfPullback`.
-- `Scheme.K.pullback_comp`: not stated here; needs `Scheme.K.pullback` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.K.pullback_id`: not stated here; needs `Scheme.K.pullback` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.K.pullback_class`: not stated here; needs `Lf^*` on `D_perf` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- `Scheme.K.pullback_supports`: not stated here; needs `K(Y on Z)` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.K.pullback_affine`: not stated here; needs `Scheme.K.pullback` and the ring map on
-- `K(A)` (supplier: GeneralAlgebraicKTheory:K.1).
-- `Scheme.Knaive.pullback`: not stated here; needs `K^naive` (supplier:
-- GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories).
-- test K_pullback_class_O (computation): not stated here; needs `f^*` on `K_0` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- test K_pullback_id (degenerate): not stated here; needs `Scheme.K.pullback` on `K_n` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test K_pullback_affine_eq_ringK0Map (compatibility): not stated here; needs `f^*` on `K_0` and
-- KTheoryLowDegrees Z.1's `ring-k0-map` (supplier: GeneralAlgebraicKTheory:K.4 and
-- KTheoryLowDegrees:Z.1/ring-k0-map).
-- test K_pullback_point_skyscraper (computation): not stated here; needs `ι^*` on `K_0` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor); its chain-level input is
-- `perfPullback_point`.
-- test K_pullback_not_G (non-example): not stated here; needs `Lι^*` on `D(𝒪)` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

/-! ### `SchemeKTheoryOperations:S.2/g-theory-finite-tor-pullback` -/

-- `Scheme.G.pullback`: not stated here; needs `G(Y) → G(X)` and `Lf^*` on `PsCoh^b` (supplier:
-- GeneralAlgebraicKTheory:K.4 and EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- `Scheme.G.pullback_comp`: not stated here; needs `Scheme.G.pullback` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.G.pullback_flat_class`: not stated here; needs `Scheme.G.pullback` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.G.pullback_class`: not stated here; needs `L_i f^*` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- `Scheme.G.pullback_cartan`: not stated here; needs `Scheme.G.pullback` and `Scheme.cartan`
-- (supplier: GeneralAlgebraicKTheory:K.4).
-- test G_pullback_open_class (computation): not stated here; needs `j^*` on `G_0` (supplier:
-- GeneralAlgebraicKTheory:K.1).
-- test G_pullback_id (degenerate): not stated here; needs `Scheme.G.pullback` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test G_pullback_flat_eq_quillen (compatibility): not stated here; needs Quillen K-theory of
-- `Coh` (supplier: GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories).
-- test not_G_pullback_dualNumbers_point (non-example): not stated here; needs `L_i ι^*` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

/-! ### Direct images, pushforward, base change and the projection formula

`SchemeKTheoryOperations:S.2/total-direct-image-qcqs`,
`S.2/proper-pushforward-coherent`, `S.2/proper-perfect-pushforward-perfect`,
`S.2/g-theory-proper-pushforward`, `S.2/k-theory-proper-pushforward`,
`S.2/pushforward-functoriality`, `S.2/derived-tor-independent-base-change`,
`S.2/k-theory-base-change`, `S.2/derived-projection-formula`, `S.2/tensor-product-pairings`,
`S.2/projection-formula`. -/

/- `SchemeKTheoryOperations:S.2/total-direct-image-qcqs`: not stated here; needs the derived
direct image `Rf_* : D(𝒪_X) ⥤ D(𝒪_Y)` (supplier:
EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements) and the quasi-coherent cohomology of
schemes (supplier: SchemeAndStackFoundations:SF.2). Mathlib's underived `Scheme.Modules.pushforward`
is its `H⁰`.
`SchemeKTheoryOperations:S.2/proper-pushforward-coherent`: not stated here; needs `Rf_*` and
Grothendieck's coherence theorem (supplier: SchemeAndStackFoundations:SF.2; the packet's gap).
`SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect`: not stated here; needs `Rf_*` on
`D_perf` (supplier: EnhancedDerivedSheaves:E1 and SchemeAndStackFoundations:SF.2).
`SchemeKTheoryOperations:S.2/pushforward-functoriality`: not stated here; needs `f_*` on `G` and
`K` (supplier: GeneralAlgebraicKTheory:K.4).
`SchemeKTheoryOperations:S.2/derived-tor-independent-base-change`: not stated here; needs `Lg^*`
and `Rf_*` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
`SchemeKTheoryOperations:S.2/k-theory-base-change`: not stated here; needs `f_*`, `g^*` on `G`
and `K` (supplier: GeneralAlgebraicKTheory:K.4).
`SchemeKTheoryOperations:S.2/derived-projection-formula`: not stated here; needs `Rf_*`, `Lf^*`
and `⊗^L` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
`SchemeKTheoryOperations:S.2/projection-formula`: not stated here; needs the pairings of spectra
and `f_*` (supplier: GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products). -/

-- `Scheme.G.pushforward`: not stated here (as above); needs `G(X) → G(Y)` (supplier:
-- GeneralAlgebraicKTheory:K.4 and SchemeAndStackFoundations:SF.2 for `R^i f_*`).
-- `Scheme.G.pushforward_class`: not stated here; needs `R^i f_*` of coherent sheaves (supplier:
-- SchemeAndStackFoundations:SF.2).
-- `Scheme.G.pushforward_closedImmersion`: not stated here; needs `Scheme.G.pushforward` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.G.pushforward_finite`: not stated here; needs `Scheme.G.pushforward` and Quillen K-theory
-- of `Coh` (supplier: GeneralAlgebraicKTheory:K.1).
-- `Scheme.G.pushforward_comp`: not stated here; needs `Scheme.G.pushforward` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.G.pushforward_godement`: not stated here; needs the Godement resolution and `Rf_*`
-- (supplier: SchemeAndStackFoundations:SF.2).
-- test G_pushforward_projectiveLine (computation): not stated here; needs `𝒪(n)` on `ℙ¹` and
-- `R^i p_*` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, SchemeAndStackFoundations:SF.2).
-- test G_pushforward_id (degenerate): not stated here; needs `Scheme.G.pushforward` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test G_pushforward_finite_eq_restrictScalars (compatibility): not stated here; needs
-- `Scheme.G.pushforward` on `G_0` (supplier: GeneralAlgebraicKTheory:K.4); the Tau Ceti side is
-- `ExactK0.map` of restriction of scalars.
-- test G_pushforward_class_point (computation): not stated here; needs `x_*` on `G_0` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test not_G_pushforward_open (non-example): not stated here; needs `Rj_*` (supplier:
-- SchemeAndStackFoundations:SF.2).
-- `Scheme.K.pushforward`: not stated here; needs `K(X) → K(Y)` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.K.pushforward_class`: not stated here; needs `Rf_*` on `D_perf` (supplier:
-- EnhancedDerivedSheaves:E1).
-- `Scheme.K.pushforward_comp`: not stated here; needs `Scheme.K.pushforward` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.K.pushforward_cartan`: not stated here; needs `Scheme.K.pushforward` and `Scheme.cartan`
-- (supplier: GeneralAlgebraicKTheory:K.4).
-- `Scheme.K.pushforward_affine`: not stated here; needs `Scheme.K.pushforward` and the ring
-- transfer (supplier: GeneralAlgebraicKTheory:K.4, KTheoryLowDegrees:Z.1/ring-k0-transfer).
-- `Scheme.K.pushforward_supports`: not stated here; needs `K(X on Z)` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test K_pushforward_projectiveLine (computation): not stated here; needs `𝒪(n)` and `Rp_*`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, SchemeAndStackFoundations:SF.2).
-- test K_pushforward_id (degenerate): not stated here; needs `Scheme.K.pushforward` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test K_pushforward_finiteFlat_eq_ringK0Transfer (compatibility): not stated here; needs
-- `Scheme.K.pushforward` and KTheoryLowDegrees Z.1's `ring-k0-transfer` (supplier:
-- GeneralAlgebraicKTheory:K.4, KTheoryLowDegrees:Z.1/ring-k0-transfer).
-- test K_pushforward_degree (computation): not stated here; needs `f_*` on `K_0` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- test not_K_pushforward_nonperfect (non-example): not stated here; needs `Ri_*` (supplier:
-- EnhancedDerivedSheaves:E1).
-- `Scheme.K.mulPairing`: not stated here; needs the biexact pairing of spectra (supplier:
-- GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).
-- `Scheme.G.modulePairing`: not stated here; needs the same (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `Scheme.K.mul_class`: not stated here; needs the product on `K_0(X)`, i.e. `⊗^L` on `D_perf`
-- (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- `Scheme.G.smul_class`: not stated here; needs `⊗^L` (supplier: EnhancedDerivedSheaves:E1).
-- `Scheme.K.one_mul`: not stated here; needs the products on `K_*` and `G_*` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `Scheme.K.mulPairing_pullback`: not stated here; needs `f^*` and the product on `K_0` (supplier:
-- EnhancedDerivedSheaves:E1).
-- `Scheme.K.mulPairing_affine`: not stated here; needs the product on `K_0(X)` and Z.3's ring
-- `K₀` (supplier: EnhancedDerivedSheaves:E1, KTheoryLowDegrees:Z.3/finite-projective-monoidal).
-- test K_mul_one (degenerate): not stated here; needs the product on `K_0(X)` (supplier:
-- EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- test K_mul_lineBundle_projectiveLine (computation): not stated here; needs `𝒪(n)` and the product
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, EnhancedDerivedSheaves:E1).
-- test K_mul_affine_eq_tensor (compatibility): not stated here; needs the product on `K_0(X)` and
-- Z.3's ring structure (supplier: EnhancedDerivedSheaves:E1, KTheoryLowDegrees:Z.3).
-- test G_smul_skyscraper (computation): not stated here; needs `⊗^L` (supplier:
-- EnhancedDerivedSheaves:E1).
-- test not_biexact_unflat (non-example): not stated here; needs biexact functors of Waldhausen
-- categories and the tensor product of complexes (supplier: GeneralAlgebraicKTheory:K.7).

/-! ### `SchemeKTheoryOperations:S.2/affine-k-theory-comparison` and the affine maps -/

section Affine

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]

/-- **Affine K- and G-theory** (`S.2/affine-k-theory-comparison`), degree-zero part: `K_0(Spec A)`
is KTheoryLowDegrees Z.1's ring `K₀(A)`, `[P~] ↦ [P]` (Stacks 0FDH), and for `A` noetherian
`G_0(Spec A)` is `ExactK0` of Tau Ceti's `finiteModulesExactStructure A`, `[M~] ↦ [M]`. The
homotopy equivalences `K(A) ≃ K(Spec A)` and `G(Spec A) ≃ G(A)` need the spectra (supplier:
GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison). -/
theorem affine_k_theory_comparison (R : CommRingCat.{u}) :
    (∃ e : Scheme.K0 (Spec R) ≃+ TauCeti.RingK0 R, ∀ (P : TauCeti.RingK0.FP R)
      (h : DerivedCategory.isPerfect (Spec R) (DerivedCategory.Q.obj (single₀ (tilde P.obj)))),
        e (TauCeti.TriangulatedK0.of ⟨_, h⟩) = (TauCeti.SplitK0.of P : TauCeti.RingK0 R)) ∧
      (∀ [IsNoetherianRing R] (M : ModuleCat.{u} R) (hM : ModuleCat.isFG R M)
        (h : SheafOfModules.IsFinitePresentation (R := (Spec R).ringCatSheaf) (tilde M)),
        Scheme.G0SpecEquiv R (Scheme.G.«class» (tilde M) h) = TauCeti.ExactK0.of ⟨M, hM⟩) := by
  sorry

/- `SchemeKTheoryOperations:S.2/affine-pullback-is-scalar-extension`: not stated here; needs
`g^*` on `K` (supplier: GeneralAlgebraicKTheory:K.4) and KTheoryLowDegrees Z.1's `ring-k0-map`
(supplier: KTheoryLowDegrees:Z.1/ring-k0-map).
`SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer`: not stated here; needs `f_*` on `K`
and `G` (supplier: GeneralAlgebraicKTheory:K.4, KTheoryLowDegrees:Z.1/ring-k0-transfer). -/

/-! ### `SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison` -/

/-- **Vector bundles compute K-theory under the resolution property**
(`S.2/vector-bundle-k-theory-comparison`), degree-zero part: for qcqs `X` with the resolution
property, `K_0(Vect X) ≅ K_0(X)` (Stacks 0FDJ). The homotopy equivalence
`K(Vect X) ≃ K^naive(X) ≃ K(X)` needs the spectra (supplier:
GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison). -/
theorem vector_bundle_k_theory_comparison {X : Scheme.{u}} [CompactSpace X]
    [QuasiSeparatedSpace X] (hX : HasResolutionProperty X) :
    Function.Bijective (Scheme.vectToK0 X) := by
  sorry

end Affine

/-! ### `SchemeKTheoryOperations:S.2/cartan-map` -/

section Cartan

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

-- `Scheme.cartan`: not stated here; needs `c_X : K(X) → G(X)` of spectra (supplier:
-- GeneralAlgebraicKTheory:K.4). Its degree-zero map is `Scheme.cartanZero` (and `cartanVect` on
-- vector bundles).

/-- `c_X[E] = Σ_i (-1)^i [H^i(E)]` in `G_0(X)` (degree zero, `Scheme.cartanZero`; the membership
of each `H^i(E)` in `Coh(X)` is part of the data). -/
theorem Scheme.cartan_class [_root_.AlgebraicGeometry.IsNoetherian X] (E : Dperf X)
    (hH : ∀ i : ℤ, SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf)
      ((DerivedCategory.homologyFunctor X.Modules i).obj E.obj)) :
    Scheme.cartanZero X (TauCeti.TriangulatedK0.of E) =
      ∑ᶠ i : ℤ, (i.negOnePow : ℤ) • Scheme.G.«class» _ (hH i) := by
  sorry

/-- `c_X[V] = [V]` for a vector bundle `V`: `cartanZero ∘ vectToK0 = cartanVect`. -/
theorem Scheme.cartan_class_vectorBundle [_root_.AlgebraicGeometry.IsNoetherian X] :
    (Scheme.cartanZero X).comp (Scheme.vectToK0 X) = Scheme.cartanVect X := by
  sorry

-- `Scheme.cartan_pullback`: not stated here; needs `f^*` on `K` and `G` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.cartan_pushforward`: not stated here; needs `f_*` on `K` and `G` (supplier:
-- GeneralAlgebraicKTheory:K.4).
-- `Scheme.cartan_linear`: not stated here; needs the product `K_*(X) × G_*(X) → G_*(X)`
-- (supplier: GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).

/-- For `X = Spec R`, `π₀ c_X` is Tau Ceti's `cartanMap R`: under `K_0(Vect(Spec R)) ≃ K_0(proj R)`
and `G_0(Spec R) ≃ G_0(mod R)` the degree-zero Cartan map is `TauCeti.cartanMap R`. -/
theorem Scheme.cartan_affine (R : CommRingCat.{u}) [IsNoetherianRing R] :
    (Scheme.G0SpecEquiv R).toAddMonoidHom.comp (Scheme.cartanVect (Spec R)) =
      (TauCeti.cartanMap R).comp (Scheme.K0VectSpecEquiv R).toAddMonoidHom := by
  sorry

/-- For a regular noetherian scheme the Cartan map is an equivalence
(`S.2/cartan-equivalence`); degree-zero form: `cartanZero` is bijective. -/
theorem Scheme.cartan_isEquiv_of_regular [_root_.AlgebraicGeometry.IsNoetherian X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) :
    Function.Bijective (Scheme.cartanZero X) := by
  sorry

-- test cartan_spec_field (computation)
/- For a field `F`, `c : K_0(Spec F) → G_0(Spec F)` is the identity of `ℤ`, `[F] ↦ [F]`. -/
example (F : Type u) [Field F] :
    ∃ (e₁ : Scheme.K0Vect (Spec (.of F)) ≃+ ℤ) (e₂ : Scheme.G0 (Spec (.of F)) ≃+ ℤ),
      e₂.toAddMonoidHom.comp (Scheme.cartanVect (Spec (.of F))) = e₁.toAddMonoidHom := by
  sorry

-- test cartan_empty (degenerate)
/- Degree-zero part: for `X = ∅` both groups vanish; the spectrum statement needs `K(X)`
(supplier: GeneralAlgebraicKTheory:K.4). -/
example (Y : Scheme.{u}) [IsEmpty Y] [IsLocallyNoetherian Y] :
    Subsingleton (Scheme.K0Vect Y) ∧ Subsingleton (Scheme.G0 Y) := by
  sorry

-- test cartan_dualNumbers (computation)
/- For `X = Spec k[ε]`, `c[𝒪] = [𝒪] = 2[k]` in `G_0(X) = ℤ[k]`. -/
example (k : Type u) [Field k]
    (hV : vectorBundles (Spec (.of (DualNumber k))) (structureModule _))
    (hO : SheafOfModules.IsFinitePresentation (R := (Spec (.of (DualNumber k))).ringCatSheaf)
      (structureModule (Spec (.of (DualNumber k)))))
    (hk : SheafOfModules.IsFinitePresentation (R := (Spec (.of (DualNumber k))).ringCatSheaf)
      (tilde (dualNumbersResidue k))) :
    Scheme.cartanVect _ (TauCeti.ExactK0.of ⟨_, hV⟩) = Scheme.G.«class» _ hO ∧
      Scheme.G.«class» _ hO = 2 • Scheme.G.«class» _ hk := by
  sorry

-- test cartan_affine_eq_tauceti (compatibility)
example (R : CommRingCat.{u}) [IsNoetherianRing R] :
    (Scheme.G0SpecEquiv R).toAddMonoidHom.comp (Scheme.cartanVect (Spec R)) =
      (TauCeti.cartanMap R).comp (Scheme.K0VectSpecEquiv R).toAddMonoidHom := by
  sorry

-- test cartan_not_surjective_dualNumbers (non-example)
example (k : Type u) [Field k]
    (hk : SheafOfModules.IsFinitePresentation (R := (Spec (.of (DualNumber k))).ringCatSheaf)
      (tilde (dualNumbersResidue k))) :
    Scheme.G.«class» _ hk ∉ Set.range (Scheme.cartanVect (Spec (.of (DualNumber k)))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/perfect-coherent-on-regular` -/

/-- **On a regular scheme bounded pseudo-coherent complexes are perfect**
(`S.2/perfect-coherent-on-regular`, TT 3.21, Stacks 0FDC), for `X` regular noetherian (its local
rings have finite global dimension); in particular every coherent sheaf is perfect. TT's weaker
hypothesis (finitely presented `𝒪_{X,x}`-modules of finite Tor-dimension) is not restated: Mathlib
has no Tor-dimension of modules. -/
theorem perfect_coherent_on_regular [_root_.AlgebraicGeometry.IsNoetherian X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) :
    (∀ E : CochainComplex X.Modules ℤ, (∃ a b : ℤ, E.IsGE a ∧ E.IsLE b) →
      IsPseudoCoherent E → IsPerfect E) ∧
      ∀ F : X.Modules, SheafOfModules.IsFinitePresentation (R := X.ringCatSheaf) F →
        IsPerfect (single₀ F) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/cartan-equivalence` -/

/-- **Poincaré duality `K ≃ G` for regular schemes** (`S.2/cartan-equivalence`, TT 3.21),
degree-zero form (Stacks 0FDI): for `X` regular noetherian (any dimension, not necessarily
separated) the Cartan map `K_0(X) → G_0(X)` is bijective. The homotopy equivalence of spectra and
the vanishing of negative `𝕂`-groups need K.4 and K.6 (supplier: GeneralAlgebraicKTheory:K.4,
GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K). -/
theorem cartan_equivalence [_root_.AlgebraicGeometry.IsNoetherian X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) :
    Function.Bijective (Scheme.cartanZero X) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/cartan-degree-zero-compatibility` -/

/-- **The degree-zero Cartan map on affines is Tau Ceti's**
(`S.2/cartan-degree-zero-compatibility`): for `R` noetherian, `π₀ c_{Spec R}` is
`TauCeti.cartanMap R`; for `R` regular every finitely generated module has a finite projective
resolution (the hypothesis of `TauCeti.cartanMap_bijective`), and the degree-zero Poincaré duality
is `TauCeti.cartanEquiv R`. -/
theorem cartan_degree_zero_compatibility (R : CommRingCat.{u}) [IsNoetherianRing R] :
    (Scheme.G0SpecEquiv R).toAddMonoidHom.comp (Scheme.cartanVect (Spec R)) =
        (TauCeti.cartanMap R).comp (Scheme.K0VectSpecEquiv R).toAddMonoidHom ∧
      (IsRegularRing R → ∃ h : ModuleCat.isFG R ≤
          (TauCeti.ExactStructure.abelian (ModuleCat.{u} R)).admitsFiniteResolution
            (TauCeti.finiteProjectiveModules R),
        (Scheme.G0SpecEquiv R).toAddMonoidHom.comp (Scheme.cartanVect (Spec R)) =
          (TauCeti.cartanEquiv R h).toAddMonoidHom.comp
            (Scheme.K0VectSpecEquiv R).toAddMonoidHom) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/cartan-singular-non-example` -/

/-- **For the dual numbers the Cartan map is `×2`** (`S.2/cartan-singular-non-example`): for
`R = k[ε]`, `K_0 ≅ ℤ` generated by `[𝒪]`, `G_0 ≅ ℤ` generated by `[k]`, and `c[𝒪] = 2[k]`; so the
Cartan map is injective but not surjective, and the residue field is coherent but not perfect. -/
theorem cartan_singular_non_example (k : Type u) [Field k]
    (hV : vectorBundles (Spec (.of (DualNumber k))) (structureModule _))
    (hk : SheafOfModules.IsFinitePresentation (R := (Spec (.of (DualNumber k))).ringCatSheaf)
      (tilde (dualNumbersResidue k))) :
    (∃ e : Scheme.K0Vect (Spec (.of (DualNumber k))) ≃+ ℤ, e (TauCeti.ExactK0.of ⟨_, hV⟩) = 1) ∧
      (∃ e : Scheme.G0 (Spec (.of (DualNumber k))) ≃+ ℤ, e (Scheme.G.«class» _ hk) = 1) ∧
      Function.Injective (Scheme.cartanVect (Spec (.of (DualNumber k)))) ∧
      ¬ Function.Surjective (Scheme.cartanVect (Spec (.of (DualNumber k)))) ∧
      ¬ IsPerfect (single₀ (tilde (dualNumbersResidue k))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.2/perfect-iff-compact`,
`SchemeKTheoryOperations:S.2/k-theory-continuity` -/

/- `SchemeKTheoryOperations:S.2/perfect-iff-compact`: not stated here; needs arbitrary direct sums
in `D_QCoh(𝒪_X)` (the coproducts of Mathlib's `DerivedCategory` of a Grothendieck abelian
category are not constructed) and the commutation of `RΓ` with them (supplier:
EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, SchemeAndStackFoundations:SF.2).
Suggested form: `DerivedCategory.isPerfect X K ↔ (K is compact in D_QCoh(𝒪_X))` for qcqs `X`.
`SchemeKTheoryOperations:S.2/k-theory-continuity`: not stated here; needs `K(X)`, `𝕂(X)` and
filtered colimits of spectra (supplier:
GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits, K.6). -/

end Cartan

end TauCeti.AlgebraicGeometry.KTheory

/-! ## Stage `SchemeKTheoryOperations:S.3` — supports, localisation and the DVR boundary

**The localisation boundary is right-linear (pinned):** `∂ : K_n(U on U ∩ Z) → K_{n-1}(X on Y ∩ Z)`
satisfies `∂(x · j^* y) = ∂(x) · y`, and for a DVR `∂(λ(π)) = +[k]` for every uniformiser `π`
(`S.3/localisation-boundary`); the left-linear normalisation is `(-1)^{n-1} ∂`. K-theory spectra,
their boundaries and `K_1` are in neither library, so only the triangulated and coherent
support categories, their degree-zero groups and the degree-zero ends of the localisation
sequences are stated in Lean. -/

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

section Support

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-- The closed point `V(𝔪)` of the spectrum of a local ring (test helper). -/
def closedPointSet (O : CommRingCat.{u}) [IsLocalRing O] : TopologicalSpace.Closeds (Spec O) :=
  ⟨PrimeSpectrum.zeroLocus (IsLocalRing.maximalIdeal O : Set O),
    PrimeSpectrum.isClosed_zeroLocus _⟩

/-! ### `SchemeKTheoryOperations:S.3/perfect-complexes-with-support` -/

/-- **Perfect complexes supported on `Z`** (`S.3/perfect-complexes-with-support`, Stacks 08DA):
the objects of `D_perf(𝒪_X)` whose restriction to `X ∖ Z` is zero in `D(𝒪_{X∖Z})`. Only the
closed subset `Z` enters, never a subscheme structure. -/
def PerfSupport (X : Scheme.{u}) (Z : TopologicalSpace.Closeds X) : ObjectProperty (Dperf X) :=
  fun E => IsZero ((restrictD Z.compl).obj E.obj)

/-- `Perf_Z(X)` is a triangulated subcategory of `D_perf(𝒪_X)`, closed under isomorphisms. -/
instance PerfSupport.isTriangulated (Z : TopologicalSpace.Closeds X) :
    (PerfSupport X Z).IsTriangulated := by
  sorry

/-- Direct summands of objects of `Perf_Z(X)` lie in `Perf_Z(X)`. -/
instance PerfSupport.isClosedUnderRetracts (Z : TopologicalSpace.Closeds X) :
    (PerfSupport X Z).IsStableUnderRetracts := by
  sorry

/-- `E ∈ Perf_Z(X)` iff every cohomology sheaf `H^i(E)` has support in `Z` (its stalks at points
off `Z` vanish). -/
theorem PerfSupport.mem_iff_support (Z : TopologicalSpace.Closeds X) (E : Dperf X) :
    PerfSupport X Z E ↔ ∀ (i : ℤ) (x : X), x ∉ Z →
      IsZero (((DerivedCategory.homologyFunctor X.Modules i).obj E.obj).presheaf.stalk x) := by
  sorry

/-- `Z ⊆ Z'` implies `Perf_Z(X) ≤ Perf_{Z'}(X)`. -/
theorem PerfSupport.mono {Z Z' : TopologicalSpace.Closeds X} (h : Z ≤ Z') :
    PerfSupport X Z ≤ PerfSupport X Z' := by
  sorry

/-- `Perf_Z(X) ⊓ Perf_W(X) = Perf_{Z ∩ W}(X)`. -/
@[simp]
theorem PerfSupport.inf (Z W : TopologicalSpace.Closeds X) :
    PerfSupport X Z ⊓ PerfSupport X W = PerfSupport X (Z ⊓ W) := by
  sorry

/-- `Perf_X(X) = D_perf(𝒪_X)`. -/
@[simp]
theorem PerfSupport.univ : PerfSupport X ⊤ = ⊤ := by
  sorry

/-- `E ∈ Perf_∅(X)` iff `E ≅ 0`. -/
@[simp]
theorem PerfSupport.empty (E : Dperf X) : PerfSupport X ⊥ E ↔ IsZero E := by
  sorry

/-- Restriction to an open `V` maps `Perf_Z(X)` into `Perf_{Z ∩ V}(V)`. The clause for the derived
pullback `Lf^*` along an arbitrary `f` is left out: it needs `Lf^*` (supplier:
EnhancedDerivedSheaves:E1/presentability-and-derived-tensor). -/
theorem PerfSupport.pullback (Z : TopologicalSpace.Closeds X) (V : X.Opens) (E : Dperf X)
    (hE : PerfSupport X Z E)
    (h : DerivedCategory.isPerfect V ((restrictD V).obj E.obj)) :
    PerfSupport V (Z.preimage V.ι.continuous) ⟨_, h⟩ := by
  sorry

-- `PerfSupport.tensor`: not stated here; needs the derived tensor product on `D_perf(𝒪_X)`
-- (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).

/-- On `Spec A` and `Z = V(I)`: a perfect complex of `A`-modules lies in `Perf_{V(I)}` iff every
`H^i` has `Module.support` inside `V(I)`. -/
theorem PerfSupport.affine_iff (R : CommRingCat.{u}) [HasDerivedCategory.{u} (ModuleCat.{u} R)]
    (I : Ideal R) (K : _root_.DerivedCategory (ModuleCat.{u} R))
    (h : DerivedCategory.isPerfect (Spec R) ((tildeD R).obj K)) :
    PerfSupport (Spec R) ⟨PrimeSpectrum.zeroLocus (I : Set R), PrimeSpectrum.isClosed_zeroLocus _⟩
        ⟨_, h⟩ ↔
      ∀ i : ℤ, Module.support R ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj K) ⊆
        PrimeSpectrum.zeroLocus (I : Set R) := by
  sorry

/-- For `s ∈ A`, `cone(s : 𝒪 → 𝒪)` (the Koszul complex `𝒪 --s--> 𝒪`) lies in `Perf_{V(s)}` on
`Spec A`. The node states it for a global function on any scheme; Mathlib has no multiplication
map `𝒪_X ⟶ 𝒪_X` by a global section as a declaration, so the affine case is stated. -/
theorem PerfSupport.cone_mem (R : CommRingCat.{u}) (s : R)
    (h : DerivedCategory.isPerfect (Spec R) (DerivedCategory.Q.obj (koszulComplex R s))) :
    PerfSupport (Spec R) ⟨PrimeSpectrum.zeroLocus {s}, PrimeSpectrum.isClosed_zeroLocus _⟩
      ⟨_, h⟩ := by
  sorry

-- test PerfSupport.univ_eq (degenerate)
example (X : Scheme.{u}) (E : Dperf X) : PerfSupport X ⊤ E ∧ (PerfSupport X ⊥ E ↔ IsZero E) := by
  sorry

-- test PerfSupport.dvr_cone (computation)
/- For a DVR `O` with uniformiser `π` (e.g. `ℤ_(p)`, `π = p`) and `Z` the closed point:
`cone(π) ∈ Perf_Z` with `H^0 = O/π`, while `𝒪 ∉ Perf_Z` (its restriction to the generic point is
the fraction field, not zero). -/
example (O : CommRingCat.{u}) [IsDomain O] [IsDiscreteValuationRing O] (π : O)
    (hπ : Irreducible π)
    (h₁ : DerivedCategory.isPerfect (Spec O) (DerivedCategory.Q.obj (koszulComplex O π)))
    (h₂ : DerivedCategory.isPerfect (Spec O)
      (DerivedCategory.Q.obj (single₀ (structureModule (Spec O))))) :
    PerfSupport (Spec O) (closedPointSet O) ⟨_, h₁⟩ ∧
      ¬ PerfSupport (Spec O) (closedPointSet O) ⟨_, h₂⟩ := by
  sorry

-- test PerfSupport.residue_field_not_perfect (non-example)
/- On `Spec k[ε]`, `Z = X`: the residue field is supported on `Z` but is not perfect, so it is not
an object of `Perf_Z(X)`; a definition by supports of cohomology alone would contain it. -/
example (k : Type u) [Field k] :
    ¬ DerivedCategory.isPerfect (Spec (.of (DualNumber k)))
      (DerivedCategory.Q.obj (single₀ (tilde (dualNumbersResidue k)))) := by
  sorry

-- test PerfSupport.affine_support (compatibility)
example (R : CommRingCat.{u}) (a : R)
    (h : DerivedCategory.isPerfect (Spec R) (DerivedCategory.Q.obj (koszulComplex R a))) :
    PerfSupport (Spec R) ⟨PrimeSpectrum.zeroLocus {a}, PrimeSpectrum.isClosed_zeroLocus _⟩
        ⟨_, h⟩ ∧
      Module.support R (R ⧸ Ideal.span {a}) = PrimeSpectrum.zeroLocus {a} := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/support-k-theory` -/

/-- `Perf_Z(X)` is essentially small for qcqs `X` (helper instance). -/
instance PerfSupport.essentiallySmall [CompactSpace X] [QuasiSeparatedSpace X]
    (Z : TopologicalSpace.Closeds X) : EssentiallySmall.{u} (PerfSupport X Z).FullSubcategory := by
  sorry

/-- `K_0(X on Z)` (helper carrier): Tau Ceti's triangulated `K₀` of `Perf_Z(X)`; for `n ≥ 0` the
nonconnective `K_n(X on Z)` agrees with the Waldhausen group of TT 3.1, `K_0` included. -/
abbrev supportK0 (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X]
    (Z : TopologicalSpace.Closeds X) : Type u :=
  TauCeti.TriangulatedK0.{u} (PerfSupport X Z).FullSubcategory

-- `supportKTheory`: not stated here; needs K.6's nonconnective `IK` of the Frobenius sub-pair on
-- `Perf_Z(X)` (supplier:
-- GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance). Its degree-zero group
-- is `supportK0`.
-- `supportKTheory.toK`: not stated here; needs the spectra (supplier: GeneralAlgebraicKTheory:K.6).

/-- `supportKTheory.class`: the class `[E] ∈ K_0(X on Z)` of `E ∈ Perf_Z(X)`, additive in
distinguished triangles, with `[E[1]] = -[E]` (Tau Ceti's `TriangulatedK0.of_shift_one`). -/
def supportKTheory.«class» [CompactSpace X] [QuasiSeparatedSpace X]
    (Z : TopologicalSpace.Closeds X) (E : (PerfSupport X Z).FullSubcategory) : supportK0 X Z :=
  TauCeti.TriangulatedK0.of E

-- `supportKTheory.univ`: not stated here; needs `K(X on X) ≃ K(X)` of spectra (supplier:
-- GeneralAlgebraicKTheory:K.6); degree zero is the test `supportKTheory.univ_eq` below.
-- `supportKTheory.empty`: not stated here; needs `K(X on ∅) ≃ 0` (supplier:
-- GeneralAlgebraicKTheory:K.6); degree zero is `supportKTheory.empty_vanishes`.
-- `supportKTheory.pullback`: not stated here; needs `f^*` on `K(X on Z)` (supplier:
-- GeneralAlgebraicKTheory:K.6, EnhancedDerivedSheaves:E1 for `Lf^*`).
-- `supportKTheory.enlarge`: not stated here; needs the maps of spectra (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `supportKTheory.pairing`: not stated here; needs module spectra and `⊗^L` (supplier:
-- GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).
-- `supportKTheory.pushforward`: not stated here; needs `Rf_*` on `Perf` (supplier:
-- EnhancedDerivedSheaves:E1, GeneralAlgebraicKTheory:K.4).
-- `supportKTheory.connective_comparison`: not stated here; needs Waldhausen and nonconnective K
-- (supplier: GeneralAlgebraicKTheory:K.4, K.6).

-- test supportKTheory.empty_vanishes (degenerate)
/- Degree-zero part: `K_0(X on ∅) = 0`; `K_n` for `n ≠ 0` needs the spectra (supplier:
GeneralAlgebraicKTheory:K.6). -/
example (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] :
    Subsingleton (supportK0 X ⊥) := by
  sorry

-- test supportKTheory.univ_eq (degenerate)
/- Degree-zero part: `K_0(X on X) ≅ K_0(X)`. -/
example (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] :
    Nonempty (supportK0 X ⊤ ≃+ Scheme.K0 X) := by
  sorry

-- test supportKTheory.dvr_K0 (computation)
/- For a DVR `O` with uniformiser `π` and `Z` the closed point, `K_0(Spec O on Z) ≅ ℤ` with
`[cone(π^n)] ↦ n`. -/
example (O : CommRingCat.{u}) [IsDomain O] [IsDiscreteValuationRing O] (π : O)
    (hπ : Irreducible π)
    (h : ∀ n : ℕ, DerivedCategory.isPerfect (Spec O)
      (DerivedCategory.Q.obj (koszulComplex O (π ^ n))))
    (h' : ∀ n : ℕ, PerfSupport (Spec O) (closedPointSet O) ⟨_, h n⟩) :
    ∃ e : supportK0 (Spec O) (closedPointSet O) ≃+ ℤ,
      ∀ n : ℕ, e (supportKTheory.«class» _ ⟨⟨_, h n⟩, h' n⟩) = n := by
  sorry

-- test supportKTheory.not_K_of_subscheme (non-example): not stated here; needs `K_1(X on Z)` and
-- `K_1(k[x]/(x²))` (supplier: GeneralAlgebraicKTheory:K.6, KTheoryLowDegrees:U.3/SK1-local).
-- test supportKTheory.affine_compat (compatibility): not stated here; needs GeneralAlgebraicKTheory
-- K.5's `K(R on S)` (supplier:
-- GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary).

end Support

end TauCeti.AlgebraicGeometry.KTheory

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

section Localisation

variable [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] {X : Scheme.{u}}

/-- `D_perf(𝒪_X) ⥤ D_perf(𝒪_U)`, restriction to an open (helper; triangulated by Mathlib's
`ObjectProperty.lift` instances, the membership proof left as `sorry`). -/
abbrev restrictDperf (U : X.Opens) : Dperf X ⥤ Dperf U :=
  (DerivedCategory.isPerfect U).lift ((DerivedCategory.isPerfect X).ι ⋙ restrictD U)
    (fun _ => by sorry)

/-! ### `SchemeKTheoryOperations:S.3/affine-extension-of-perfect` -/

/-- **Extending perfect complexes from a quasi-compact open of an affine scheme**
(`S.3/affine-extension-of-perfect`, Stacks 08EG, 08EI, 08EK): for `U ⊆ Spec A` quasi-compact open
and `F` perfect on `U`, (a) some `𝓕[-r] ⊕ F`, `𝓕` finite locally free, extends; (b) `F ⊕ F[1]`
extends; (c) if `F` is supported on `T ∩ U`, the extension of `F ⊕ F[1]` can be taken supported
on `T`. -/
theorem affine_extension_of_perfect (R : CommRingCat.{u}) (U : (Spec R).Opens) [CompactSpace U]
    (F : Dperf U) :
    (∃ (r : ℤ) (𝓕 : U.toScheme.Modules), vectorBundles U 𝓕 ∧ ∃ E : Dperf (Spec R),
      Nonempty ((restrictD U).obj E.obj ≅
        DerivedCategory.Q.obj ((HomologicalComplex.single _ (ComplexShape.up ℤ) r).obj 𝓕) ⊞
          F.obj)) ∧
      (∃ E : Dperf (Spec R), Nonempty ((restrictD U).obj E.obj ≅ F.obj ⊞ F.obj⟦(1 : ℤ)⟧)) ∧
      ∀ T : TopologicalSpace.Closeds (Spec R), CompactSpace T.compl →
        PerfSupport U (T.preimage U.ι.continuous) F →
          ∃ E : Dperf (Spec R), PerfSupport (Spec R) T E ∧
            Nonempty ((restrictD U).obj E.obj ≅ F.obj ⊞ F.obj⟦(1 : ℤ)⟧) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/affine-lifting-of-morphisms` -/

/-- **Lifting morphisms from a quasi-compact open of an affine scheme**
(`S.3/affine-lifting-of-morphisms`, Stacks 08EH), clause (a): every `α : E|_U → E'|_U`, `E`
perfect and `E'` with quasi-coherent cohomology, is `γ|_U ∘ (β|_U)⁻¹` for a roof `E ← E₁ → E'` with
`E₁` perfect and `β|_U` an isomorphism. Left out: that `E₁ = E ⊗^L I` (needs E1's `⊗^L`), and
clause (b), `f^n α = 0` (needs the action of `Γ(X, 𝒪_X)` on Hom groups of `D(𝒪_X)`, which Mathlib
does not provide). -/
theorem affine_lifting_of_morphisms (R : CommRingCat.{u}) (U : (Spec R).Opens) [CompactSpace U]
    (E E' : _root_.DerivedCategory (Spec R).Modules) (hE : DerivedCategory.isPerfect (Spec R) E)
    (hE' : ∀ i, SheafOfModules.IsQuasicoherent (R := (Spec R).ringCatSheaf)
      ((DerivedCategory.homologyFunctor (Spec R).Modules i).obj E'))
    (α : (restrictD U).obj E ⟶ (restrictD U).obj E') :
    ∃ (E₁ : _root_.DerivedCategory (Spec R).Modules) (β : E₁ ⟶ E) (γ : E₁ ⟶ E'),
      DerivedCategory.isPerfect (Spec R) E₁ ∧ IsIso ((restrictD U).map β) ∧
        (restrictD U).map β ≫ α = (restrictD U).map γ := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/extension-up-to-summand` -/

/-- **Thomason's extension lemma** (`S.3/extension-up-to-summand`, TT 5.5.1, 5.5.5, 5.6.1(a)):
for `X` qcqs, `U` quasi-compact open, `T` closed with quasi-compact complement, `E` with
quasi-coherent cohomology and `α : P → E|_U` with `P` perfect on `U` supported on `T ∩ U`, there
are `R ∈ Perf_T(X)` and `β : R → E` such that `P` is a retract of `R|_U` compatibly with `α` and
`β|_U`. The explicit shape `R|_U ≅ P ⊕ P^{⊕n₁}[1] ⊕ ⋯` is not restated. -/
theorem extension_up_to_summand [CompactSpace X] [QuasiSeparatedSpace X] (U : X.Opens)
    [CompactSpace U] (T : TopologicalSpace.Closeds X) [CompactSpace T.compl]
    (E : _root_.DerivedCategory X.Modules)
    (hE : ∀ i, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf)
      ((DerivedCategory.homologyFunctor X.Modules i).obj E))
    (P : Dperf U) (hP : PerfSupport U (T.preimage U.ι.continuous) P)
    (α : P.obj ⟶ (restrictD U).obj E) :
    ∃ (R : Dperf X) (β : R.obj ⟶ E) (ρ : Retract P.obj ((restrictD U).obj R.obj)),
      PerfSupport X T R ∧ ρ.i ≫ (restrictD U).map β = α := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/supported-perfect-generator` -/

/-- **A single perfect generator with supports** (`S.3/supported-perfect-generator`, Rouquier,
Stacks 0A9A): for `X` qcqs and `T` closed with quasi-compact complement there is `G ∈ Perf_T(X)`
such that every `E ∈ D_QCoh,T(𝒪_X)` with `Hom(G[n], E) = 0` for all `n` is zero. -/
theorem supported_perfect_generator [CompactSpace X] [QuasiSeparatedSpace X]
    (T : TopologicalSpace.Closeds X) [CompactSpace T.compl] :
    ∃ G : Dperf X, PerfSupport X T G ∧ ∀ E : _root_.DerivedCategory X.Modules,
      (∀ i, SheafOfModules.IsQuasicoherent (R := X.ringCatSheaf)
        ((DerivedCategory.homologyFunctor X.Modules i).obj E)) →
      IsZero ((restrictD T.compl).obj E) →
      (∀ (n : ℤ) (f : G.obj⟦n⟧ ⟶ E), f = 0) → IsZero E := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/killing-morphisms-into-supported` -/

/- `SchemeKTheoryOperations:S.3/killing-morphisms-into-supported`: not stated here; needs the
derived tensor product `I ⊗^L P` on `D_perf(𝒪_X)` (supplier:
EnhancedDerivedSheaves:E1/presentability-and-derived-tensor). -/

/-! ### `SchemeKTheoryOperations:S.3/restriction-quotient-fully-faithful` -/

/-- **Restriction is fully faithful on the Verdier quotient**
(`S.3/restriction-quotient-fully-faithful`, TT 5.2.3–5.2.4), in its roof form: for `X` qcqs, `U`
quasi-compact open and `Z` closed, (a) every `b : E|_U → E'|_U` between objects of `Perf_Z(X)` is
`a'|_U ∘ (a|_U)⁻¹` for a roof `E ← E'' → E'` in `Perf_Z(X)` with `a|_U` an isomorphism; (b) two maps
agreeing on `U` are equalised by some `c : E'' → E` with `c|_U` an isomorphism. (The quotient
functor on Mathlib's localisation at `ObjectProperty.trW` is fully faithful exactly when (a), (b)
hold.) -/
theorem restriction_quotient_fully_faithful [CompactSpace X] [QuasiSeparatedSpace X]
    (U : X.Opens) [CompactSpace U] (Z : TopologicalSpace.Closeds X) [CompactSpace Z.compl]
    (E E' : Dperf X) (hE : PerfSupport X Z E) (hE' : PerfSupport X Z E') :
    (∀ b : (restrictD U).obj E.obj ⟶ (restrictD U).obj E'.obj,
      ∃ (E'' : Dperf X) (a : E''.obj ⟶ E.obj) (a' : E''.obj ⟶ E'.obj), PerfSupport X Z E'' ∧
        IsIso ((restrictD U).map a) ∧ (restrictD U).map a ≫ b = (restrictD U).map a') ∧
      ∀ a b : E.obj ⟶ E'.obj, (restrictD U).map a = (restrictD U).map b →
        ∃ (E'' : Dperf X) (c : E''.obj ⟶ E.obj), PerfSupport X Z E'' ∧
          IsIso ((restrictD U).map c) ∧ c ≫ a = c ≫ b := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/extension-k0-criterion` -/

/-- **Which perfect complexes extend: the `K_0` criterion** (`S.3/extension-k0-criterion`,
TT 5.2.2), case `Z = X`: a perfect complex on a quasi-compact open `U` of a qcqs `X` is the
restriction of a perfect complex on `X` iff its class lies in the image of `K_0(X) → K_0(U)`. The
version with supports needs the restriction map on `supportK0`, and the identification of the
obstruction with the boundary into `K_{-1}` needs K.6 (supplier: GeneralAlgebraicKTheory:K.6). -/
theorem extension_k0_criterion [CompactSpace X] [QuasiSeparatedSpace X] (U : X.Opens)
    [CompactSpace U] [QuasiSeparatedSpace U] (F : Dperf U) :
    (∃ E : Dperf X, Nonempty ((restrictD U).obj E.obj ≅ F.obj)) ↔
      TauCeti.TriangulatedK0.of F ∈ (TauCeti.TriangulatedK0.map (restrictDperf U)).range := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/perfect-localisation-exact-sequence` -/

/-- **The support/open sequence is exact up to direct factors**
(`S.3/perfect-localisation-exact-sequence`): the composite `Perf_{Y∩Z}(X) → Perf_Z(X) →
Perf_{U∩Z}(U)` is zero and the restriction is cofinal (every object of `Perf_{U∩Z}(U)` is a direct
summand of a restriction); full faithfulness on the Verdier quotient is
`restriction_quotient_fully_faithful`. -/
theorem perfect_localisation_exact_sequence [CompactSpace X] [QuasiSeparatedSpace X]
    (U : X.Opens) [CompactSpace U] (Z : TopologicalSpace.Closeds X) [CompactSpace Z.compl] :
    (∀ E : Dperf X, PerfSupport X (U.compl ⊓ Z) E → IsZero ((restrictD U).obj E.obj)) ∧
      ∀ F : Dperf U, PerfSupport U (Z.preimage U.ι.continuous) F →
        ∃ E : Dperf X, PerfSupport X Z E ∧
          Nonempty (Retract F.obj ((restrictD U).obj E.obj)) := by
  sorry

/-! ### The localisation fibre sequence and its boundary

`SchemeKTheoryOperations:S.3/localisation-fibre-sequence`,
`S.3/connective-localisation-sequence`, `S.3/localisation-boundary`,
`S.3/boundary-pullback-naturality`, `S.3/boundary-module-linearity`,
`S.3/infinitely-near-equivalence`, `S.3/excision`. -/

/- `SchemeKTheoryOperations:S.3/localisation-fibre-sequence`: not stated here; needs K.6's
nonconnective spectra and homotopy fibre sequences (supplier:
GeneralAlgebraicKTheory:K.6/schlichting-set-up-and-negative-localization,
StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence). Its triangulated input is
`perfect_localisation_exact_sequence` with `restriction_quotient_fully_faithful`.
`SchemeKTheoryOperations:S.3/connective-localisation-sequence`: not stated here; needs Waldhausen
K-theory and the covering spectrum (supplier:
GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem,
K.3/cofinality-degree-zero-correction). Its degree-zero cokernel term is measured by
`extension_k0_criterion`.
`SchemeKTheoryOperations:S.3/boundary-pullback-naturality`: not stated here; needs the boundary
maps of spectra and `Lf^*` (supplier: GeneralAlgebraicKTheory:K.6, EnhancedDerivedSheaves:E1).
`SchemeKTheoryOperations:S.3/boundary-module-linearity`: not stated here; needs the support
pairings of K.7 (supplier: GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).
`SchemeKTheoryOperations:S.3/infinitely-near-equivalence`: not stated here; needs `Rf_*` and
`Lf^*` on `D^-_QCoh` (supplier: EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements,
SchemeKTheoryOperations:S.2/total-direct-image-qcqs).
`SchemeKTheoryOperations:S.3/excision`: not stated here; needs `K(X on Y)` (supplier:
GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance). -/

-- `localisationBoundary`: not stated here; needs `∂ : K_n(U on U∩Z) → K_{n-1}(X on Y∩Z)` of the
-- nonconnective fibre sequence (supplier: GeneralAlgebraicKTheory:K.6,
-- StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence). Pinned: right-linear, with
-- `∂(λ(π)) = +[k]` for a DVR.
-- `localisationBoundary_comp_restrict`: not stated here; needs `localisationBoundary` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `localisationBoundary_exact_left`: not stated here; needs the long exact sequence (supplier:
-- StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
-- `localisationBoundary_naturality`: not stated here; needs `f^*` on `K(X on Z)` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `localisationBoundary_mul_right`: not stated here; needs the products `K_*(X on Z) × K_*(X)`
-- (supplier: GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).
-- `localisationBoundary_K0`: not stated here; needs `∂ : K_0(U on U∩Z) → K_{-1}(X on Y∩Z)`
-- (supplier: GeneralAlgebraicKTheory:K.6); its extension half is `extension_k0_criterion`.
-- `localisationBoundary_cone`: not stated here; needs `λ[α|_U] ∈ K_1(U)` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `localisationBoundary_left`: not stated here; needs `localisationBoundary` (supplier:
-- GeneralAlgebraicKTheory:K.6). Pinned conversion: `∂^left_n = (-1)^{n-1} ∂_n`.
-- test localisationBoundary.dvr_uniformiser (computation): not stated here; needs `∂ ∘ λ` on
-- `K_1(ℚ)` (supplier: GeneralAlgebraicKTheory:K.2:plus, K.6).
-- test localisationBoundary.units_vanish (degenerate): not stated here; needs `λ(u) ∈ K_1(O)`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- test localisationBoundary.sign_pinned (non-example): not stated here; needs `∂` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test localisationBoundary.empty_support (degenerate): not stated here; needs `∂` (supplier:
-- GeneralAlgebraicKTheory:K.6).

/-! ### `SchemeKTheoryOperations:S.3/disjoint-support-additivity` -/

/-- **Disjoint supports add** (`S.3/disjoint-support-additivity`), triangulated part: for disjoint
closed `Z₁, Z₂`, `(E₁, E₂) ↦ E₁ ⊕ E₂` is an equivalence `Perf_{Z₁}(X) × Perf_{Z₂}(X) ≃
Perf_{Z₁ ⊔ Z₂}(X)`. The K-theory consequence needs the spectra (supplier:
GeneralAlgebraicKTheory:K.6). -/
theorem disjoint_support_additivity [CompactSpace X] [QuasiSeparatedSpace X]
    (Z₁ Z₂ : TopologicalSpace.Closeds X) (h : Disjoint Z₁ Z₂) :
    ∃ e : (PerfSupport X Z₁).FullSubcategory × (PerfSupport X Z₂).FullSubcategory ≌
        (PerfSupport X (Z₁ ⊔ Z₂)).FullSubcategory,
      ∀ E, Nonempty ((e.functor.obj E).obj.obj ≅ E.1.obj.obj ⊞ E.2.obj.obj) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/affine-support-comparison` -/

/-- **Affine support categories** (`S.3/affine-support-comparison`), object part: on `Spec R` with
`Z = V(s)`, a perfect complex of `R`-modules lies in `Perf_Z` iff its cohomology is `s`-power
torsion (`P[1/s]` acyclic). The identification `K(X on Z) ≃ K(R on S)` needs
GeneralAlgebraicKTheory K.5 (supplier:
GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary). -/
theorem affine_support_comparison (R : CommRingCat.{u}) [HasDerivedCategory.{u} (ModuleCat.{u} R)]
    (s : R) (K : _root_.DerivedCategory (ModuleCat.{u} R))
    (h : DerivedCategory.isPerfect (Spec R) ((tildeD R).obj K)) :
    PerfSupport (Spec R) ⟨PrimeSpectrum.zeroLocus {s}, PrimeSpectrum.isClosed_zeroLocus _⟩
        ⟨_, h⟩ ↔
      ∀ (i : ℤ) (m : (DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj K),
        ∃ n : ℕ, s ^ n • m = 0 := by
  sorry

/- `SchemeKTheoryOperations:S.3/divisor-support-comparison`: not stated here; needs Quillen
K-theory of the exact category `H_Z(X)` and `K(X on Z)` (supplier:
GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison, K.4/waldhausen-approximation-theorem);
also ample families of line bundles (supplier: AlgebraicModuliForArithmeticGeometry:R09.1). -/

end Localisation

end TauCeti.AlgebraicGeometry.KTheory

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

section CoherentSupport

variable {X : Scheme.{u}}

/-- `X ∖ Z` as an open of the scheme `X` (helper). -/
abbrev openCompl (Z : TopologicalSpace.Closeds X) : X.Opens := Z.compl

/-! ### `SchemeKTheoryOperations:S.3/coherent-sheaves-with-support` -/

/-- **Coherent sheaves supported on `Z`** (`S.3/coherent-sheaves-with-support`): coherent
`𝒪_X`-modules `F` with `F|_{X∖Z} = 0` (`Supp F ⊆ Z`), as an object property of `X.Modules`. -/
def cohSupport (X : Scheme.{u}) (Z : TopologicalSpace.Closeds X) : ObjectProperty X.Modules :=
  fun F => coherent X F ∧ IsZero (F.restrict (openCompl Z).ι)

/-- `Coh_Z(X)` is a Serre subcategory of `Coh(X)`: for a short exact sequence of coherent sheaves,
the middle term lies in `Coh_Z(X)` iff both ends do. -/
theorem cohSupport.isSerre [IsNoetherian X] (Z : TopologicalSpace.Closeds X)
    (S : ShortComplex X.Modules) (hS : S.ShortExact) (h₁ : coherent X S.X₁) (h₂ : coherent X S.X₂)
    (h₃ : coherent X S.X₃) :
    cohSupport X Z S.X₂ ↔ cohSupport X Z S.X₁ ∧ cohSupport X Z S.X₃ := by
  sorry

/-- `F ∈ Coh_Z(X)` iff its stalks at points off `Z` vanish; on `Spec A`, for `M` finitely
generated, `M~ ∈ Coh_{V(I)}` iff `Module.support M ⊆ V(I)` iff `I^n M = 0` for some `n`. -/
theorem cohSupport.mem_iff (Z : TopologicalSpace.Closeds X) (F : X.Modules) (hF : coherent X F) :
    (cohSupport X Z F ↔ ∀ x : X, x ∉ Z → IsZero (F.presheaf.stalk x)) ∧
      ∀ (R : CommRingCat.{u}) [IsNoetherianRing R] (M : ModuleCat.{u} R) [Module.Finite R M]
        (I : Ideal R),
        (cohSupport (Spec R) ⟨PrimeSpectrum.zeroLocus (I : Set R),
          PrimeSpectrum.isClosed_zeroLocus _⟩ (tilde M) ↔
          Module.support R M ⊆ PrimeSpectrum.zeroLocus (I : Set R)) ∧
        (Module.support R M ⊆ PrimeSpectrum.zeroLocus (I : Set R) ↔
          ∃ n : ℕ, I ^ n • (⊤ : Submodule R M) = ⊥) := by
  sorry

/-- `Z ⊆ Z'` implies `Coh_Z(X) ⊆ Coh_{Z'}(X)`. -/
theorem cohSupport.mono {Z Z' : TopologicalSpace.Closeds X} (h : Z ≤ Z') :
    cohSupport X Z ≤ cohSupport X Z' := by
  sorry

/-- For a closed immersion `i : Y → X` with image in `Z`, `i_*` maps `Coh(Y)` into `Coh_Z(X)` (and
is exact there). -/
theorem cohSupport.pushforward {Y : Scheme.{u}} (i : Y ⟶ X) [IsClosedImmersion i]
    (Z : TopologicalSpace.Closeds X) (hi : Set.range i.base ⊆ Z) (F : Y.Modules)
    (hF : coherent Y F) : cohSupport X Z ((Scheme.Modules.pushforward i).obj F) := by
  sorry

/-- For flat `f : X' → X`, `f^*` maps `Coh_Z(X)` to `Coh_{f⁻¹Z}(X')`. -/
theorem cohSupport.flatPullback {X' : Scheme.{u}} (f : X' ⟶ X) [Flat f]
    (Z : TopologicalSpace.Closeds X) (F : X.Modules) (hF : cohSupport X Z F) :
    cohSupport X' (Z.preimage f.continuous) ((Scheme.Modules.pullback f).obj F) := by
  sorry

-- test cohSupport.univ (degenerate)
example (X : Scheme.{u}) (F : X.Modules) :
    (cohSupport X ⊤ F ↔ coherent X F) ∧ (cohSupport X ⊥ F ↔ IsZero F) := by
  sorry

-- test cohSupport.Zp (computation)
example (p : ℕ) [Fact p.Prime] :
    cohSupport (Spec (.of ℤ))
        ⟨PrimeSpectrum.zeroLocus {(p : ℤ)}, PrimeSpectrum.isClosed_zeroLocus _⟩
        (tilde (R := .of ℤ) (ModuleCat.of _ (ZMod (p ^ 3)))) ∧
      ¬ cohSupport (Spec (.of ℤ))
        ⟨PrimeSpectrum.zeroLocus {(p : ℤ)}, PrimeSpectrum.isClosed_zeroLocus _⟩
        (tilde (R := .of ℤ) (ModuleCat.of _ ℤ)) := by
  sorry

-- test cohSupport.support_compat (compatibility)
example (R : CommRingCat.{u}) [IsNoetherianRing R] (M : ModuleCat.{u} R) [Module.Finite R M]
    (I : Ideal R) :
    cohSupport (Spec R) ⟨PrimeSpectrum.zeroLocus (I : Set R), PrimeSpectrum.isClosed_zeroLocus _⟩
        (tilde M) ↔ Module.support R M ⊆ PrimeSpectrum.zeroLocus (I : Set R) := by
  sorry

-- test cohSupport.not_scheme_structure (non-example)
/- `k[x]/(x²) ∈ Coh_{V(x)}(𝔸¹_k)`, but it is not `i_*` of any `𝒪_Z`-module for the reduced
`Z = Spec k ↪ 𝔸¹_k` (the origin): `Coh_Z(X)` is not `Coh(Z)`. -/
example (k : Type u) [Field k] :
    cohSupport (Spec (.of (Polynomial k)))
        ⟨PrimeSpectrum.zeroLocus {(Polynomial.X : Polynomial k)},
          PrimeSpectrum.isClosed_zeroLocus _⟩
        (tilde (R := .of (Polynomial k)) (ModuleCat.of _
          (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ 2 : Polynomial k)}))) ∧
      ¬ ∃ G : (Spec (.of k)).Modules, Nonempty ((Scheme.Modules.pushforward
          (Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k))))).obj G ≅
        tilde (R := .of (Polynomial k)) (ModuleCat.of _
          (Polynomial k ⧸ Ideal.span {(Polynomial.X ^ 2 : Polynomial k)}))) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/coherent-quotient-by-support` -/

/-- **Gabriel's theorem** (`S.3/coherent-quotient-by-support`), in the form stated here: for `X`
noetherian and `U = X ∖ Z`, restriction `Coh(X) → Coh(U)` is essentially surjective and its
kernel is `Coh_Z(X)`. That it induces an equivalence on the Serre quotient `Coh(X)/Coh_Z(X)` is
left out: `Coh(X)` has no abelian structure and no Serre quotient in either library (supplier:
GeneralAlgebraicKTheory:K.3, Gabriel's Serre quotient). -/
theorem coherent_quotient_by_support [IsNoetherian X] (Z : TopologicalSpace.Closeds X) :
    (∀ G : (openCompl Z).toScheme.Modules, coherent _ G →
      ∃ F : X.Modules, coherent X F ∧ Nonempty (F.restrict (openCompl Z).ι ≅ G)) ∧
      ∀ F : X.Modules, coherent X F → (IsZero (F.restrict (openCompl Z).ι) ↔ cohSupport X Z F) := by
  sorry

/- `SchemeKTheoryOperations:S.3/coherent-support-devissage`: not stated here; needs Quillen
K-theory of `Coh(Z)` and `Coh_Z(X)` and dévissage (supplier:
GeneralAlgebraicKTheory:K.3/devissage-theorem). -/

/-! ### `SchemeKTheoryOperations:S.3/g-theory-localisation` -/

/-- `j^* : G_0(X) → G_0(U)`, restriction of coherent sheaves (helper; restriction to an open is
exact, the membership and conflation-exactness proofs are left as `sorry`). -/
def Scheme.G0.restrict [IsLocallyNoetherian X] (U : X.Opens) : Scheme.G0 X →+ Scheme.G0 U :=
  TauCeti.ExactK0.map ((coherent U).lift ((coherent X).ι ⋙ Scheme.Modules.restrictFunctor U.ι)
    (fun _ => by sorry)) (by sorry)

/-- `i_* : G_0(Z) → G_0(X)` for a closed immersion, `[F] ↦ [i_* F]` (helper; `i_*` is exact on
coherent sheaves, the proofs are left as `sorry`). -/
def Scheme.G0.closedPushforward [IsLocallyNoetherian X] {Z : Scheme.{u}} [IsLocallyNoetherian Z]
    (i : Z ⟶ X) [IsClosedImmersion i] : Scheme.G0 Z →+ Scheme.G0 X :=
  TauCeti.ExactK0.map ((coherent X).lift ((coherent Z).ι ⋙ Scheme.Modules.pushforward i)
    (fun _ => by sorry)) (by sorry)

/-- **Quillen's localisation sequence for G-theory** (`S.3/g-theory-localisation`), degree-zero
end: for `X` noetherian, `i : Z → X` a closed immersion onto `X ∖ U`,
`G_0(Z) → G_0(X) → G_0(U) → 0` is exact. The fibre sequence of spectra and the higher terms need
Quillen's localisation theorem (supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
-/
theorem g_theory_localisation [IsNoetherian X] {Z : Scheme.{u}} [IsLocallyNoetherian Z]
    (i : Z ⟶ X) [IsClosedImmersion i] (U : X.Opens) (hU : Set.range i.base = (U : Set X)ᶜ) :
    (Scheme.G0.closedPushforward i).range = (Scheme.G0.restrict U).ker ∧
      Function.Surjective (Scheme.G0.restrict U) := by
  sorry

/- `SchemeKTheoryOperations:S.3/cartan-localisation-comparison`: not stated here; needs the map of
fibre sequences of spectra and the Cartan map with supports `K(X on Z) → G(Z)` (supplier:
GeneralAlgebraicKTheory:K.6, StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
`SchemeKTheoryOperations:S.3/regular-support-devissage`: not stated here; needs `K(X on Z)`, `G(Z)`
and `i_*` on spectra (supplier: GeneralAlgebraicKTheory:K.6, K.3/devissage-theorem).
`SchemeKTheoryOperations:S.3/boundary-of-a-nonzerodivisor`: not stated here; needs `[s] ∈ K_1` and
the boundary `G_1 → G_0` (supplier: GeneralAlgebraicKTheory:K.3, K.2:plus/plus-equals-Q).
`SchemeKTheoryOperations:S.3/g-theory-continuity`: not stated here; needs `G_n` for all `n` and
filtered colimits of spectra (supplier:
GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits, AdicCoefficientsAndComparisons:L2). -/

end CoherentSupport

section DVR

/-! ### `SchemeKTheoryOperations:S.3/unit-loop-class` -/

-- `unitLoopClass`: not stated here; needs `π₁ K(Spec A)` and the plus construction (supplier:
-- StableHomotopyKTheory:H.1/nerve-and-classifying-space, H.3/plus-construction-universal-property,
-- GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q).
-- `unitLoopClass_one`: not stated here; needs `unitLoopClass` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `unitLoopClass_mul`: not stated here; needs `unitLoopClass` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `unitLoopClass_map`: not stated here; needs `unitLoopClass` and `φ^*` on `K_1` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `unitLoopClass_eq_ofUnits`: not stated here; needs `GL(A)/E(A) → π₁ BGL(A)^+` (supplier:
-- StableHomotopyKTheory:H.3/plus-construction-universal-property,
-- KTheoryLowDegrees:U.3/units-to-K1).
-- `unitLoopClass_prod`: not stated here; needs the product `K_1 × K_1 → K_2` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- test unitLoopClass.one (degenerate): not stated here; needs `unitLoopClass` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- test unitLoopClass.dvr_valuation (computation): not stated here; needs `∂_S ∘ λ` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus, K.6).
-- test unitLoopClass.not_additive_in_u (non-example): not stated here; needs `∂_S ∘ λ` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus, K.6).
-- test unitLoopClass.compat_classical (compatibility): not stated here; needs `K1.ofUnits` of
-- KTheoryLowDegrees U.3 and the plus construction (supplier: KTheoryLowDegrees:U.3/units-to-K1,
-- GeneralAlgebraicKTheory:K.2:plus).

/-! ### `SchemeKTheoryOperations:S.3/dvr-localisation-sequence` -/

/-- **The localisation sequence of a DVR** (`S.3/dvr-localisation-sequence`), degree-zero end
(`K = G` for the regular schemes involved): for `O` a DVR with uniformiser `π`, `i_*[k] = 0` in
`G_0(O)` and restriction to the generic point `Spec L = D(π)` is an isomorphism
`G_0(O) ≅ G_0(L)`, both `≅ ℤ` by rank. The fibre sequence and the higher terms need K.6 and the
dévissage of `S.3/regular-support-devissage` (supplier: GeneralAlgebraicKTheory:K.6). -/
theorem dvr_localisation_sequence (O : CommRingCat.{u}) [IsDomain O] [IsDiscreteValuationRing O]
    (π : O) (hπ : Irreducible π)
    [IsLocallyNoetherian (Spec (.of (IsLocalRing.ResidueField O)))]
    [IsClosedImmersion (Spec.map (CommRingCat.ofHom (IsLocalRing.residue O)))]
    (hk : SheafOfModules.IsFinitePresentation
      (R := (Spec (.of (IsLocalRing.ResidueField O))).ringCatSheaf)
      (structureModule (Spec (.of (IsLocalRing.ResidueField O))))) :
    Scheme.G0.closedPushforward (Spec.map (CommRingCat.ofHom (IsLocalRing.residue O)))
        (Scheme.G.«class» _ hk) = 0 ∧
      Function.Bijective (Scheme.G0.restrict (X := Spec O) (PrimeSpectrum.basicOpen π)) ∧
      Nonempty (Scheme.G0 (Spec O) ≃+ ℤ) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.3/dvr-boundary`

Pinned: `∂_S(λ(π)) = [k] ↦ 1 ∈ ℤ ≅ K_0(k)` for every uniformiser `π` (RS-18's single owner of the
DVR unit boundary). -/

-- `dvrBoundary`: not stated here; needs `K_n(L) → K_{n-1}(k)`, the boundary of the DVR fibre
-- sequence followed by dévissage (supplier: GeneralAlgebraicKTheory:K.6,
-- SchemeKTheoryOperations:S.3/localisation-boundary). KTheoryLowDegrees U.1's classical
-- `K1.dvrBoundary` is the explicit cokernel-length form on `K₁`, compared there.
-- `dvrBoundary_comp_restrict`: not stated here; needs `dvrBoundary` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `dvrBoundary_exact`: not stated here; needs the long exact sequence (supplier:
-- StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
-- `dvrBoundary_unitLoopClass`: not stated here; needs `λ` and `∂_S` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus, K.6).
-- `dvrBoundary_uniformizer`: not stated here; needs `∂_S(λ(π))` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus, K.6).
-- `dvrBoundary_mul_right`: not stated here; needs the products on `K_*` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `dvrBoundary_unit_product`: not stated here; needs `λ(f)·λ(u) ∈ K_2(L)` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `dvrBoundary_flat_ramification`: not stated here; needs `∂_S` for `O → O'` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `dvrBoundary_completion`: not stated here; needs excision for `K(O on m)` (supplier:
-- GeneralAlgebraicKTheory:K.6, SchemeKTheoryOperations:S.3/excision).
-- `dvrBoundary_left_normalisation`: not stated here; needs `∂_S` (supplier:
-- GeneralAlgebraicKTheory:K.6). Pinned conversion `∂^left_n = (-1)^{n-1} ∂_S`.
-- `dvrBoundary_explicit`: not stated here; needs `∂_S ∘ λ` and KTheoryLowDegrees U.5's
-- `K1.dvrBoundary` (supplier: KTheoryLowDegrees:U.5/dvr-boundary-localisation-comparison).
-- test dvrBoundary.padic_uniformiser (computation): not stated here; needs `∂_S ∘ λ` on `K_1(ℚ)`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus, K.6).
-- test dvrBoundary.units_zero (degenerate): not stated here; needs `∂_S` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test dvrBoundary.power_series (compatibility): not stated here; needs `∂_S(λ(t))` for `k[[t]]`
-- (supplier: GeneralAlgebraicKTheory:K.6); its Mathlib side is `IsDiscreteValuationRing.addVal`.
-- test dvrBoundary.ramified (computation): not stated here; needs `∂_S` for `ℤ_(2)[i]` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test dvrBoundary.sign (non-example): not stated here; needs `∂_S` (supplier:
-- GeneralAlgebraicKTheory:K.6).

/- `SchemeKTheoryOperations:S.3/dvr-boundary-unit-valuation`: not stated here; needs
`∂_S ∘ λ_L : L^× → K_0(k)` (supplier: GeneralAlgebraicKTheory:K.2:plus, K.6). Suggested form:
`∂_S (λ u) = (IsDiscreteValuationRing.addVal extended to L^×) u • [k]`.
`SchemeKTheoryOperations:S.3/dvr-boundary-on-unit-products`: not stated here; needs `λ(f)·λ(u)` in
`K_2(L)` and `∂_S` on `K_2` (supplier: GeneralAlgebraicKTheory:K.7, K.6).
`SchemeKTheoryOperations:S.3/specialisation-of-restriction`: not stated here; needs `λ_s` and
`K_n(O) → K_n(k)` (supplier: GeneralAlgebraicKTheory:K.7).
`SchemeKTheoryOperations:S.3/algebraically-closed-injectivity`: not stated here; needs `K_n` for
all `n` (supplier: GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits). -/

/-! ### `SchemeKTheoryOperations:S.3/specialisation-map` -/

-- `specialisation`: not stated here; needs `λ_s(a) := ∂_S(λ(s)·a)` (supplier:
-- GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products, K.6).
-- `specialisation_restrict`: not stated here; needs `specialisation` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `specialisation_change_parameter`: not stated here; needs `specialisation` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `specialisation_unitLoopClass_param`: not stated here; needs `specialisation` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `specialisation_linear`: not stated here; needs `specialisation` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- test specialisation.units (computation): not stated here; needs `λ_5(λ(2))` in `K_1(𝔽_5)`
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- test specialisation.degree_zero (degenerate): not stated here; needs `∂_S(λ(s))` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test specialisation.depends_on_parameter (non-example): not stated here; needs `specialisation`
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- test specialisation.sign_even_degree (non-example): not stated here; needs `specialisation` on
-- `K_2` (supplier: GeneralAlgebraicKTheory:K.7).

/- `SchemeKTheoryOperations:S.3/unit-boundary-is-divisor`: not stated here; needs the boundary
`G_1(U) → G_0(Y)` and `[f] ∈ G_1(U)` (supplier: GeneralAlgebraicKTheory:K.3, K.2:plus). The
target order is Mathlib's `AlgebraicGeometry.Scheme.ord` and Tau Ceti's
`SchemeWeilDivisor.orderAt`.
`SchemeKTheoryOperations:S.3/boundary-finite-pushforward-naturality`: not stated here; needs the
G-localisation boundaries (supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
`SchemeKTheoryOperations:S.3/dedekind-localisation-sequence`: not stated here; needs the boundary
`K_1(F) → ⊕_p K_0(R/p)` (supplier: GeneralAlgebraicKTheory:K.3); its degree-zero end is
`g_theory_localisation` for `Spec R`.
`SchemeKTheoryOperations:S.3/one-dimensional-localisation-sequence`: not stated here; needs the
G-localisation boundaries in all degrees (supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.3/weil-reciprocity-k-theory`: not stated here; needs `∂_x` on
`K_{n+1}(F)` and the transfers `N_{k(x)/k}` (supplier: GeneralAlgebraicKTheory:K.3, K.4).
`SchemeKTheoryOperations:S.3/arithmetic-surface-localisation`: not stated here; needs `K(𝓧)`,
`G(𝓧_v)` and their fibre sequences (supplier: GeneralAlgebraicKTheory:K.6, K.3).
`SchemeKTheoryOperations:S.3/vertical-residue-compatibility`: not stated here; needs the vertical
residues on `K_n(𝓧_U)` (supplier: GeneralAlgebraicKTheory:K.6, K.3). -/

end DVR

end TauCeti.AlgebraicGeometry.KTheory

/-! ## Stage `SchemeKTheoryOperations:S.4` — descent, coniveau and Gersten

Presheaves of spectra, hypercohomology spectra and spectral sequences of K-theory are in neither
library (StableHomotopyKTheory H.5; Mathlib's `SpectralObject` gives spectral sequences of
spectral objects in abelian categories, not of towers of spectra). Stated in Lean: the
Nisnevich topology and its elementary distinguished squares, and the codimension filtration
`M^p(X)` of coherent sheaves by the codimension of their support. -/

namespace TauCeti.AlgebraicGeometry

open _root_.AlgebraicGeometry.Scheme

section Nisnevich

/-! ### `SchemeKTheoryOperations:S.4/nisnevich-site` -/

/-- The Nisnevich covering families (helper): families of étale morphisms `V_a → U` such that every
point `x ∈ U` has a preimage `y` in some `V_a` with `k(x) → k(y)` an isomorphism (TT E.1). -/
def nisnevichPrecoverage : Precoverage Scheme.{u} where
  coverings U := {R | (∀ ⦃V : Scheme.{u}⦄ (f : V ⟶ U), R f → Etale f) ∧
    ∀ x : U, ∃ (V : Scheme.{u}) (f : V ⟶ U) (_ : R f) (y : V), f.base y = x ∧
      IsIso (f.residueFieldMap y)}

/-- **The Nisnevich topology** (`S.4/nisnevich-site`), on the big site of schemes, generated by the
Nisnevich covering families; the small site `X_Nis` is its restriction to étale `X`-schemes. -/
def nisnevichTopology : GrothendieckTopology Scheme.{u} :=
  nisnevichPrecoverage.toGrothendieck

/-- **Elementary distinguished square** (`S.4/nisnevich-site`, K-book V.10): an open `U ⊆ X` and
an étale `p : V → X` inducing an isomorphism over `X ∖ U`; for étale `p` this is the condition
that every point of `X ∖ U` has exactly one preimage, with isomorphic residue field (equivalent to
`p⁻¹(X ∖ U)_red ≅ (X ∖ U)_red`; the reduced induced closed subscheme is not a Mathlib
declaration). The square is the cartesian square of `U → X ← V`. -/
structure DistinguishedSquare {X V : Scheme.{u}} (U : X.Opens) (p : V ⟶ X) : Prop where
  /-- `p` is étale. -/
  etale : Etale p
  /-- Every point off `U` has exactly one preimage. -/
  existsUnique_preimage : ∀ x : X, x ∉ U → ∃! y : V, p.base y = x
  /-- Over the complement of `U`, the residue field extensions are isomorphisms. -/
  isIso_residueFieldMap : ∀ y : V, p.base y ∉ U → IsIso (p.residueFieldMap y)

/-- The two maps of a distinguished square form a Nisnevich covering. -/
theorem DistinguishedSquare.isCover {X V : Scheme.{u}} {U : X.Opens} {p : V ⟶ X}
    (h : DistinguishedSquare U p) :
    Sieve.generate (Presieve.singleton U.ι ⊔ Presieve.singleton p) ∈ nisnevichTopology X := by
  sorry

/-- An open cover `X = U ∪ V` gives the distinguished square with `p` the inclusion of `V`. -/
theorem DistinguishedSquare.ofOpenCover {X : Scheme.{u}} (U V : X.Opens) (h : U ⊔ V = ⊤) :
    DistinguishedSquare U V.ι := by
  sorry

/-- Zariski covers are Nisnevich covers. -/
theorem zariski_le_nisnevich : Scheme.zariskiTopology.{u} ≤ nisnevichTopology := by
  sorry

/-- Nisnevich covers are étale covers (Mathlib's `Scheme.etaleTopology`). -/
theorem nisnevich_le_etale : nisnevichTopology.{u} ≤ Scheme.etaleTopology := by
  sorry

-- `DistinguishedSquare.mayerVietorisSquare`: not stated here; needs sheafification of
-- `Type u`-valued presheaves on the Nisnevich site (Mathlib's `MayerVietorisSquare` requires
-- `HasWeakSheafify J (Type u)`, not available for the big site) and the small site `X_Nis`
-- (supplier: SchemeKTheoryOperations:S.4/nisnevich-cohomological-dimension, citing MVW 12.7).
-- `nisnevich_point`: not stated here; needs the henselisation `𝒪^h_{X,x}` at a residue field
-- extension, which Mathlib does not construct (it has only `HenselianLocalRing`) (supplier: the
-- packet's gap "Nisnevich site inputs cited from SGA 4, EGA IV and MVW").

-- test nisnevichTopology.field (computation)
/- `Spec ℂ → Spec ℝ` is an étale cover but not a Nisnevich cover (`ℝ → ℂ` is not an isomorphism
of residue fields). -/
example :
    Presieve.singleton (Spec.map (CommRingCat.ofHom (algebraMap ℝ ℂ))) ∈
        Scheme.etalePrecoverage (Spec (.of ℝ)) ∧
      Presieve.singleton (Spec.map (CommRingCat.ofHom (algebraMap ℝ ℂ))) ∉
        nisnevichPrecoverage (Spec (.of ℝ)) := by
  sorry

-- test DistinguishedSquare.open_cover (degenerate)
example (X : Scheme.{u}) (U V : X.Opens) (h : U ⊔ V = ⊤) {W : Scheme.{u}} (q : W ⟶ X)
    [Etale q] : DistinguishedSquare U V.ι ∧ DistinguishedSquare ⊤ q := by
  sorry

-- test DistinguishedSquare.henselian_example (compatibility): not stated here; needs the
-- henselisation `ℤ_(p)^h` as a filtered limit of étale neighbourhoods (supplier: the packet's gap
-- "Nisnevich site inputs cited from SGA 4, EGA IV and MVW"; Mathlib has `HenselianLocalRing` but
-- no henselisation).

-- test DistinguishedSquare.not_etale_cover (non-example)
/- `X = Spec ℝ[t]`, `U = D(t)`, `V = Spec ℂ[t] → X`: `{U, V}` is an étale cover, but the fibre over
`t = 0` is `Spec ℂ ≇ Spec ℝ`, so the square is not distinguished. -/
example :
    ¬ DistinguishedSquare (X := Spec (.of (Polynomial ℝ)))
      (PrimeSpectrum.basicOpen (Polynomial.X : Polynomial ℝ))
      (Spec.map (CommRingCat.ofHom (Polynomial.mapRingHom (algebraMap ℝ ℂ)))) := by
  sorry

/- `SchemeKTheoryOperations:S.4/nisnevich-cohomological-dimension`: not stated here; needs the
points of `X_Nis` (henselisations), coherence of the topos and Nisnevich sheaf cohomology of
abelian sheaves on the small site (supplier: SchemeAndStackFoundations:SF.2 and the packet's gap
"Nisnevich site inputs cited from SGA 4, EGA IV and MVW"). -/

end Nisnevich

end TauCeti.AlgebraicGeometry

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

/-! ### Mayer–Vietoris, descent and hypercohomology

`SchemeKTheoryOperations:S.4/zariski-mayer-vietoris`, `S.4/g-theory-mayer-vietoris`,
`S.4/mayer-vietoris-property`, `S.4/brown-gersten-vanishing`, `S.4/nisnevich-excision-square`,
`S.4/sheaf-hypercohomology-spectrum`, `S.4/hypercohomology-spectral-sequence`,
`S.4/k-theory-sheaves`, `S.4/zariski-descent`, `S.4/zariski-descent-spectral-sequence`,
`S.4/nisnevich-descent`. -/

/- `SchemeKTheoryOperations:S.4/zariski-mayer-vietoris`: not stated here; needs homotopy cartesian
squares of nonconnective spectra (supplier: GeneralAlgebraicKTheory:K.6,
StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
`SchemeKTheoryOperations:S.4/g-theory-mayer-vietoris`: not stated here; needs `G(X)` as a spectrum
(supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
`SchemeKTheoryOperations:S.4/brown-gersten-vanishing`: not stated here; needs presheaves of spectra
with the Mayer–Vietoris property (supplier: StableHomotopyKTheory:H.5:spectra).
`SchemeKTheoryOperations:S.4/nisnevich-excision-square`: not stated here; needs `K(X on W)` of
spectra (supplier: GeneralAlgebraicKTheory:K.6); its square is `DistinguishedSquare`.
`SchemeKTheoryOperations:S.4/hypercohomology-spectral-sequence`: not stated here; needs Thomason's
hypercohomology spectrum (supplier: StableHomotopyKTheory:H.5:spectra).
`SchemeKTheoryOperations:S.4/zariski-descent`: not stated here; needs `K(X) → H_Zar(X; K)`
(supplier: StableHomotopyKTheory:H.5:spectra, GeneralAlgebraicKTheory:K.6).
`SchemeKTheoryOperations:S.4/zariski-descent-spectral-sequence`: not stated here; needs the
K-theory sheaves `𝒦_n` and the descent spectral sequence (supplier:
StableHomotopyKTheory:H.5:spectra).
`SchemeKTheoryOperations:S.4/nisnevich-descent`: not stated here; needs Nisnevich hypercohomology of
presheaves of spectra (supplier: StableHomotopyKTheory:H.5:spectra). -/

-- `HasMayerVietoris`: not stated here; needs presheaves of spectra on `Opens X` and homotopy
-- cartesian squares (supplier: StableHomotopyKTheory:H.5:spectra).
-- `HasMayerVietoris.les`: not stated here; needs `π_n` of spectra (supplier:
-- StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
-- `HasMayerVietoris.of_equiv`: not stated here; needs objectwise equivalences of presheaves of
-- spectra (supplier: StableHomotopyKTheory:H.5:spectra).
-- `HasMayerVietoris.fib`: not stated here; needs fibre sequences of presheaves of spectra
-- (supplier: StableHomotopyKTheory:H.5:spectra).
-- `HasMayerVietoris.restrict`: not stated here; needs `HasMayerVietoris` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `HasMayerVietoris.nisnevich`: not stated here; needs presheaves of spectra on the Nisnevich site
-- (supplier: StableHomotopyKTheory:H.5:spectra); its squares are `DistinguishedSquare`.
-- test HasMayerVietoris.ktheory (computation): not stated here; needs `U ↦ K(U)` as a presheaf of
-- spectra (supplier: GeneralAlgebraicKTheory:K.6).
-- test HasMayerVietoris.zero (degenerate): not stated here; needs `HasMayerVietoris` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- test HasMayerVietoris.constant_fails (non-example): not stated here; needs the Eilenberg–Mac
-- Lane spectrum `Hℤ` (supplier: StableHomotopyKTheory:H.5:spectra).
-- test HasMayerVietoris.sheaf_compat (compatibility): not stated here; needs Eilenberg–Mac Lane
-- presheaves; the comparison target is Mathlib's `CategoryTheory.Sheaf.H` (supplier:
-- StableHomotopyKTheory:H.5:spectra).

-- `TauCeti.Spectra.hypercohomology`: not stated here; needs presheaves of fibrant spectra and
-- `holim_Δ` of cosimplicial spectra (supplier: StableHomotopyKTheory:H.5:spectra).
-- `TauCeti.Spectra.hypercohomology.map`: not stated here; needs `hypercohomology` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `TauCeti.Spectra.hypercohomology.fiber`: not stated here; needs `hypercohomology` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `TauCeti.Spectra.hypercohomology.presheaf`: not stated here; needs `hypercohomology` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `TauCeti.Spectra.hypercohomology.skyscraper`: not stated here; needs `hypercohomology`
-- (supplier: StableHomotopyKTheory:H.5:spectra); flasqueness of skyscrapers is Tau Ceti's
-- `TauCeti.Topology.isFlasque_skyscraperSheaf`.
-- `TauCeti.Spectra.hypercohomology.supports`: not stated here; needs `hypercohomology` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `TauCeti.Spectra.hypercohomology.eilenbergMacLane`: not stated here; needs Eilenberg–Mac Lane
-- spectra; the target is Mathlib's `CategoryTheory.Sheaf.H A n` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- test hypercohomology.point (degenerate): not stated here; needs `hypercohomology` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- test hypercohomology.P1_ktheory_sheaf (computation): not stated here; needs `hypercohomology`
-- (supplier: StableHomotopyKTheory:H.5:spectra); its answer is `Pic(ℙ¹) ≅ ℤ`.
-- test hypercohomology.not_sections (non-example): not stated here; needs `hypercohomology`
-- (supplier: StableHomotopyKTheory:H.5:spectra).
-- test hypercohomology.sheafcoh_compat (compatibility): not stated here; needs `hypercohomology`
-- (supplier: StableHomotopyKTheory:H.5:spectra); the target is `CategoryTheory.Sheaf.H`.

-- `kSheaf`: not stated here; needs `U ↦ K_n(U on U ∩ Y)` for all `n ∈ ℤ` (supplier:
-- GeneralAlgebraicKTheory:K.6); its `n = 0` presheaf would need the restriction maps of
-- `Scheme.K0`, which need `Lf^*` for non-open maps only in the Nisnevich case.
-- `kSheaf.stalk`: not stated here; needs `kSheaf` and `K_n(𝒪_{X,x})` (supplier:
-- GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).
-- `kSheaf.stalk_nis`: not stated here; needs henselisations (supplier: the packet's Nisnevich gap).
-- `kSheaf.map`: not stated here; needs `kSheaf` (supplier: GeneralAlgebraicKTheory:K.6).
-- `kSheaf.zero_of_neg`: not stated here; needs negative K-groups (supplier:
-- GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K).
-- `kSheaf.units`: not stated here; needs `λ : 𝒪^× → 𝒦_1` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- test kSheaf.affine_line_stalk (computation): not stated here; needs `𝒦_0`, `𝒦_1` stalks
-- (supplier: GeneralAlgebraicKTheory:K.6).
-- test kSheaf.point (degenerate): not stated here; needs `kSheaf` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test kSheaf.not_presheaf (non-example): not stated here; needs `kSheaf` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test kSheaf.K0_rank (compatibility): not stated here; needs `𝒦_0` (supplier:
-- GeneralAlgebraicKTheory:K.6, KTheoryLowDegrees:Z.2/local-ring-k0).

/-! ### `SchemeKTheoryOperations:S.4/codimension-support-filtration`,
`S.4/coniveau-layer-fibre-sequence`, `S.4/k-coniveau-spectral-sequence` -/

-- `supportFiltration`: not stated here; needs `S^pK(X on Y) = colim K(X on Y ∩ Z')`, filtered
-- colimits of spectra (supplier: StableHomotopyKTheory:H.5:spectra, GeneralAlgebraicKTheory:K.6).
-- `supportFiltration.zero`: not stated here; needs `supportFiltration` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `supportFiltration.vanish`: not stated here; needs `supportFiltration` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `supportFiltration.flat`: not stated here; needs `supportFiltration` (supplier:
-- StableHomotopyKTheory:H.5:spectra).

/-- **The degree-zero coniveau filtration** (`supportFiltration.coniveauFiltration` for `n = 0`,
`S.4/codimension-support-filtration`): `F^p K_0(X) = ⋃_{codim Z ≥ p} im(K_0(X on Z) → K_0(X))`,
over the closed `Z` with `dim 𝒪_{X,z} ≥ p` at every `z ∈ Z` (`π_0` commutes with the filtered
colimit `S^pK`; the image of `K_0(X on Z)` is that of `TriangulatedK0.map` of the inclusion
`Perf_Z(X) ⊆ D_perf(𝒪_X)`). The groups `F^p K_n(X)` for `n ≠ 0` need `π_n S^pK` (supplier:
StableHomotopyKTheory:H.5:spectra). -/
def supportFiltration.coniveauFiltration [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules]
    (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] (p : ℕ) :
    AddSubgroup (Scheme.K0 X) :=
  ⨆ (Z : TopologicalSpace.Closeds X)
    (_ : ∀ z ∈ Z, (p : WithBot ℕ∞) ≤ ringKrullDim (X.presheaf.stalk z)),
    (TauCeti.TriangulatedK0.map (PerfSupport X Z).ι).range

-- test supportFiltration.dvr (computation)
/- For a DVR `O` (e.g. `ℤ_(p)`), `F^1 K_0(O) = 0`: the image of `K_0(O on the closed point)` is
generated by `[O/π] = [O] - [π O] = 0` (degree zero; `S^1K ≃ K(𝔽_p)` needs the spectra). -/
example [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] (O : Type u) [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] :
    supportFiltration.coniveauFiltration (Spec (.of O)) 1 = ⊥ := by
  sorry

-- test supportFiltration.point (degenerate)
/- For a field `k`, `F^p K_0(k) = 0` for `p ≥ 1` (degree zero of `S^pK = 0`). -/
example [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] (k : Type u) [Field k] (p : ℕ)
    (hp : 1 ≤ p) : supportFiltration.coniveauFiltration (Spec (.of k)) p = ⊥ := by
  sorry
-- test supportFiltration.not_dimension (non-example): not stated here; needs `supportFiltration`
-- (supplier: StableHomotopyKTheory:H.5:spectra); the codimension indexing it tests is the one of
-- `codimFiltration` below.

-- test supportFiltration.dedekind_classgroup (compatibility)
/- For a Dedekind domain `R`, `F^1 K_0(R) = ker(rank) ≅ Cl(R)` (Mathlib's `ClassGroup R`;
KTheoryLowDegrees Z.4/rank-pic-equivalence). -/
example [∀ Y : Scheme.{u}, HasDerivedCategory.{u} Y.Modules] (R : Type u) [CommRing R]
    [IsDedekindDomain R] :
    Nonempty
      (supportFiltration.coniveauFiltration (Spec (.of R)) 1 ≃+ Additive (ClassGroup R)) := by
  sorry

/- `SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence`: not stated here; needs fibre
sequences of presheaves of spectra and skyscraper presheaves of spectra (supplier:
StableHomotopyKTheory:H.5:spectra). -/

-- `kConiveauSS`: not stated here; needs the exact couple of the tower `S^•K` of spectra (supplier:
-- StableHomotopyKTheory:H.5:spectra; Mathlib's `SpectralObject` needs an abelian spectral object).
-- `kConiveauSS.converges`: not stated here; needs `kConiveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `kConiveauSS.flat`: not stated here; needs `kConiveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `kConiveauSS.edge`: not stated here; needs `kConiveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- `kConiveauSS.regular`: not stated here; needs `kConiveauSS` and `coniveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra, GeneralAlgebraicKTheory:K.3).
-- test kConiveauSS.dvr (computation): not stated here; needs `kConiveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- test kConiveauSS.field (degenerate): not stated here; needs `kConiveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra).
-- test kConiveauSS.singular_local_term (non-example): not stated here; needs `K_n(k[ε])` (supplier:
-- GeneralAlgebraicKTheory:K.6, KTheoryLowDegrees:U.3/SK1-local).
-- test kConiveauSS.G_compat (compatibility): not stated here; needs both spectral sequences
-- (supplier: StableHomotopyKTheory:H.5:spectra, GeneralAlgebraicKTheory:K.3).

section Codimension

variable {X : Scheme.{u}}

/-! ### `SchemeKTheoryOperations:S.4/coherent-codimension-filtration` -/

/-- **Coherent sheaves supported in codimension `≥ p`** (`S.4/coherent-codimension-filtration`,
Quillen §7.5): coherent `F` such that `dim 𝒪_{X,x} ≥ p` at every point `x` of `Supp F`
(equivalently at its generic points: the codimension of a closed subset is the infimum of
`dim 𝒪_{X,z}` over its generic points). This is the codimension filtration of supports. -/
def codimFiltration (X : Scheme.{u}) (p : ℕ) : ObjectProperty X.Modules :=
  fun F => coherent X F ∧ ∀ x : X, ¬ IsZero (F.presheaf.stalk x) →
    (p : WithBot ℕ∞) ≤ ringKrullDim (X.presheaf.stalk x)

/-- Each `M^p(X)` is a Serre subcategory of `Coh(X)`. -/
theorem codimFiltration.isSerre [IsNoetherian X] (p : ℕ) (S : ShortComplex X.Modules)
    (hS : S.ShortExact) (h₁ : coherent X S.X₁) (h₂ : coherent X S.X₂) (h₃ : coherent X S.X₃) :
    codimFiltration X p S.X₂ ↔ codimFiltration X p S.X₁ ∧ codimFiltration X p S.X₃ := by
  sorry

/-- `M^{p+1}(X) ⊆ M^p(X)`, `M^0(X) = Coh(X)`, and `M^p(X) = 0` for `p > dim X`. -/
theorem codimFiltration.antitone (p : ℕ) :
    codimFiltration X (p + 1) ≤ codimFiltration X p ∧ codimFiltration X 0 = coherent X ∧
      ((p : WithBot ℕ∞) > topologicalKrullDim X →
        ∀ F : X.Modules, codimFiltration X p F → IsZero F) := by
  sorry

-- `codimFiltration.K_colim`: not stated here; needs Quillen K-theory of `M^p(X)` and colimits of
-- spectra (supplier: GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits, K.3).

/-- Flat pullback preserves `M^p` (Quillen 5.2). -/
theorem codimFiltration.flat {X' : Scheme.{u}} (f : X' ⟶ X) [Flat f] (p : ℕ) (F : X.Modules)
    (hF : codimFiltration X p F) : codimFiltration X' p ((Scheme.Modules.pullback f).obj F) := by
  sorry

/-- On `Spec R`, `R` noetherian: `M~ ∈ M^p` iff every associated prime of `M` has height `≥ p`. -/
theorem codimFiltration.ring (R : CommRingCat.{u}) [IsNoetherianRing R] (M : ModuleCat.{u} R)
    [Module.Finite R M] (p : ℕ) :
    codimFiltration (Spec R) p (tilde M) ↔ ∀ q ∈ associatedPrimes R M, (p : ℕ∞) ≤ q.height := by
  sorry

-- test codimFiltration.Z (computation)
/- `M^1(Spec ℤ)` is the finite abelian groups, and `ℤ/6 ∈ M^1 ∖ M^2`. -/
example :
    codimFiltration (Spec (.of ℤ)) 1 (tilde (R := .of ℤ) (ModuleCat.of _ (ZMod 6))) ∧
      ¬ codimFiltration (Spec (.of ℤ)) 2 (tilde (R := .of ℤ) (ModuleCat.of _ (ZMod 6))) ∧
      ∀ (M : ModuleCat.{0} ℤ) [Module.Finite ℤ M],
        codimFiltration (Spec (.of ℤ)) 1 (tilde (R := .of ℤ) M) ↔ Finite M := by
  sorry

-- test codimFiltration.field (degenerate)
example (k : Type u) [Field k] :
    codimFiltration (Spec (.of k)) 0 = coherent (Spec (.of k)) ∧
      ∀ F : (Spec (.of k)).Modules, codimFiltration (Spec (.of k)) 1 F → IsZero F := by
  sorry

-- test codimFiltration.not_dimension (non-example)
/- On `X = Spec k[x, y, z]/(xz, yz)` (a plane and a line through the origin), the skyscraper at the
closed point `(0, 0, 1)` of the line has support of codimension `1` in `X`, not `2`
(`dim X − dim Supp = 2` would put it in `M^2`). -/
example (k : Type u) [Field k] :
    let R := MvPolynomial (Fin 3) k ⧸
      Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 2 : MvPolynomial (Fin 3) k),
        MvPolynomial.X 1 * MvPolynomial.X 2}
    let P : Ideal R := Ideal.span {Ideal.Quotient.mk _ (MvPolynomial.X 0),
      Ideal.Quotient.mk _ (MvPolynomial.X 1), Ideal.Quotient.mk _ (MvPolynomial.X 2 - 1)}
    codimFiltration (Spec (.of R)) 1 (tilde (R := .of R) (ModuleCat.of _ (R ⧸ P))) ∧
      ¬ codimFiltration (Spec (.of R)) 2 (tilde (R := .of R) (ModuleCat.of _ (R ⧸ P))) := by
  sorry

-- test codimFiltration.height_compat (compatibility)
example (k : Type u) [Field k] :
    codimFiltration (Spec (.of (MvPolynomial (Fin 2) k))) 1
        (tilde (R := .of (MvPolynomial (Fin 2) k)) (ModuleCat.of _
          (MvPolynomial (Fin 2) k ⧸ Ideal.span {(MvPolynomial.X 0 : MvPolynomial (Fin 2) k)}))) ∧
      ¬ codimFiltration (Spec (.of (MvPolynomial (Fin 2) k))) 2
        (tilde (R := .of (MvPolynomial (Fin 2) k)) (ModuleCat.of _
          (MvPolynomial (Fin 2) k ⧸ Ideal.span {(MvPolynomial.X 0 : MvPolynomial (Fin 2) k)}))) ∧
      (Ideal.span {(MvPolynomial.X 0 : MvPolynomial (Fin 2) k)}).height = 1 := by
  sorry

end Codimension

/-! ### Quillen's coniveau spectral sequence and Gersten

`SchemeKTheoryOperations:S.4/coniveau-quotient-decomposition`, `S.4/g-coniveau-spectral-sequence`,
`S.4/coniveau-flat-functoriality`, `S.4/coniveau-residue-differential`,
`S.4/coniveau-weight-one-differential`, `S.4/residue-composite-vanishes`,
`S.4/coniveau-chow-group`, `S.4/one-dimensional-coniveau`, `S.4/k-coniveau-first-page-regular`,
`S.4/gersten-quillen-property` and the Gersten nodes. -/

/- `SchemeKTheoryOperations:S.4/coniveau-quotient-decomposition`: not stated here; needs the Serre
quotient `M^p(X)/M^{p+1}(X)` (supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem)
and dévissage (K.3/devissage-theorem); the cycle group `Z^p(X)` is Mathlib's `AlgebraicCycle`.
`SchemeKTheoryOperations:S.4/coniveau-flat-functoriality`: not stated here; needs `coniveauSS`
(supplier: GeneralAlgebraicKTheory:K.3); its categorical input is `codimFiltration.flat`.
`SchemeKTheoryOperations:S.4/coniveau-residue-differential`: not stated here; needs `d_1` of
`coniveauSS` (supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.4/coniveau-weight-one-differential`: not stated here; needs `d_1` on
`K_1`; the target order is Mathlib's `Ring.ordFrac` (supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.4/residue-composite-vanishes`: not stated here; needs `d_1 ∘ d_1` on
`⊕ K_n(k(y))` and the boundaries on `K_2` (supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.4/coniveau-chow-group`: not stated here; needs Chow groups
`CH^p(X) = Z^p(X)/R^p(X)` with rational equivalence (supplier: SchemeAndStackFoundations:SF.5);
`Z^p(X)` is Mathlib's `AlgebraicCycle`.
`SchemeKTheoryOperations:S.4/one-dimensional-coniveau`: not stated here; needs `G_n` for all `n`
(supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.4/k-coniveau-first-page-regular`: not stated here; needs both towers of
spectra (supplier: StableHomotopyKTheory:H.5:spectra, GeneralAlgebraicKTheory:K.6). -/

-- `coniveauSS`: not stated here; needs Quillen K-theory of `M^p(X)` and the exact couple of its
-- localisation sequences (supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem;
-- Mathlib's `CategoryTheory.SpectralSequence` needs the exact couple as a spectral object).
-- `coniveauSS.exactCouple`: not stated here; needs `K_n(M^p(X))` (supplier:
-- GeneralAlgebraicKTheory:K.3).
-- `coniveauSS.converges`: not stated here; needs `coniveauSS` (supplier:
-- GeneralAlgebraicKTheory:K.3).
-- `coniveauSS.edge`: not stated here; needs `coniveauSS` (supplier: GeneralAlgebraicKTheory:K.3).
-- `coniveauSS.d1`: not stated here; needs `coniveauSS` (supplier: GeneralAlgebraicKTheory:K.3).
-- `coniveauSS.d1_d1`: not stated here; needs `coniveauSS` (supplier: GeneralAlgebraicKTheory:K.3).
-- `coniveauSS.E2_chow`: not stated here; needs `CH^p(X)` (supplier:
-- SchemeAndStackFoundations:SF.5).
-- `coniveauSS.flat`: not stated here; needs `coniveauSS` (supplier: GeneralAlgebraicKTheory:K.3).
-- `coniveauSS.proper`: not stated here; needs proper pushforward on `M^i` and its K-theory
-- (supplier: GeneralAlgebraicKTheory:K.3; the packet's gap "Proper pushforward on the coniveau
-- spectral sequence").
-- `coniveauSS.K_compat`: not stated here; needs `kConiveauSS` and `coniveauSS` (supplier:
-- StableHomotopyKTheory:H.5:spectra, GeneralAlgebraicKTheory:K.3).
-- test coniveauSS.dvr (computation): not stated here; needs `coniveauSS` (supplier:
-- GeneralAlgebraicKTheory:K.3).
-- test coniveauSS.field (degenerate): not stated here; needs `coniveauSS` (supplier:
-- GeneralAlgebraicKTheory:K.3).
-- test coniveauSS.P1 (computation): not stated here; needs `coniveauSS` and `CH^1(ℙ¹)` (supplier:
-- GeneralAlgebraicKTheory:K.3, SchemeAndStackFoundations:SF.5).
-- test coniveauSS.nonreduced (non-example): not stated here; needs `coniveauSS` (supplier:
-- GeneralAlgebraicKTheory:K.3).

-- `GerstenQuillen`: not stated here; needs `K_n(M^{p+1}(X)) → K_n(M^p(X))` for all `n`, Quillen
-- K-theory of the abelian categories `M^p(X)` (supplier:
-- GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories); only `K_0` has a carrier here.
-- `GerstenQuillen.iff_exact`: not stated here; needs `GerstenQuillen` and the Gersten complex
-- (supplier: GeneralAlgebraicKTheory:K.3).
-- `GerstenQuillen.of_colimit`: not stated here; needs `GerstenQuillen` (supplier:
-- GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).
-- `GerstenQuillen.field`: not stated here; needs `GerstenQuillen` (supplier:
-- GeneralAlgebraicKTheory:K.1).
-- `GerstenQuillen.injective`: not stated here; needs `K_n(R) → K_n(F)` (supplier:
-- GeneralAlgebraicKTheory:K.1).
-- test GerstenQuillen.field (degenerate): not stated here; needs `GerstenQuillen` (supplier:
-- GeneralAlgebraicKTheory:K.1); its input `M^1(Spec k) = 0` is the test `codimFiltration.field`.
-- test GerstenQuillen.dvr_Fp_t (computation): not stated here; needs `K_2(𝔽_p(t))` (supplier:
-- GeneralAlgebraicKTheory:K.1, K.3).
-- test GerstenQuillen.singular_fails (non-example): not stated here; needs `GerstenQuillen`
-- (supplier: GeneralAlgebraicKTheory:K.1); its `K_0` part needs `G_0(R) ≅ ℤ ⊕ ℤ/2`.
-- test GerstenQuillen.injective_K1 (compatibility): not stated here; needs `K_1(R) → K_1(F)`
-- (supplier: GeneralAlgebraicKTheory:K.1, KTheoryLowDegrees:U.3/SK1-local).

/-! ### `SchemeKTheoryOperations:S.4/quillen-presentation-lemma` -/

/-- **Quillen's normalisation lemma** (`S.4/quillen-presentation-lemma`, Quillen 5.12, K-book
V.9.6.2): for `R` smooth of dimension `r` over a field `k`, `t ∈ R` regular and `S` a finite set of
primes, there are `x_1, …, x_{r-1} ∈ R` algebraically independent over `k` such that, with
`B = k[x_1, …, x_{r-1}] ⊆ R`, `R ⧸ tR` is finite over `B` and `R` is smooth over `B` at the points
of `S` (smooth on a basic open neighbourhood of each). -/
theorem quillen_presentation_lemma (k R : Type u) [Field k] [CommRing R] [Algebra k R]
    [Algebra.Smooth k R] (r : ℕ) (hr : ringKrullDim R = r) (t : R) (ht : IsSMulRegular R t)
    (S : Finset (PrimeSpectrum R)) :
    ∃ x : Fin (r - 1) → R, AlgebraicIndependent k x ∧
      Module.Finite (Algebra.adjoin k (Set.range x)) (R ⧸ Ideal.span {t}) ∧
      ∀ 𝔭 ∈ S, ∃ g ∉ 𝔭.asIdeal,
        Algebra.Smooth (Algebra.adjoin k (Set.range x)) (Localization.Away g) := by
  sorry

/- `SchemeKTheoryOperations:S.4/gersten-conditions-equivalent`, `S.4/gersten-resolution`,
`S.4/bloch-formula`, `S.4/quillen-effacement`,
`S.4/quillen-gersten-theorem`, `S.4/gersten-power-series`, `S.4/panin-equicharacteristic-gersten`,
`S.4/gersten-dvr-split`, `S.4/gersten-dvr-equicharacteristic`, `S.4/gillet-levine-smooth-over-dvr`,
`S.4/mixed-char-higher-effacement`, `S.4/mixed-char-k0-generation`,
`S.4/mixed-char-gersten-partial-exactness`, `S.4/mixed-char-gersten-from-dvr`,
`S.4/descent-coniveau-e2-comparison`: not stated here; each needs Quillen K-groups
`K_n(M^p(X))` for `n ≥ 1` or the coniveau and descent spectral sequences (supplier:
GeneralAlgebraicKTheory:K.1, K.3; Bloch's formula also needs `CH^p(X)` from
SchemeAndStackFoundations:SF.5, and `S.4/quillen-effacement` the transfers of K.3). Of these,
`S.4/mixed-char-k0-generation` is a statement about `K_0 M^i(R)`, which has a carrier (exact `K₀`
of `codimFiltration`), but its proof and meaning rest on Gillet–Levine (the packet's gap), and it is
not stated. -/

end TauCeti.AlgebraicGeometry.KTheory

/-! ## Stage `SchemeKTheoryOperations:S.5` — homotopy invariance, projective bundles, Bass, blow-ups

Every theorem of S.5 is about K- or G-theory spectra or needs the projective bundle `P(E)`, its
twisting sheaves `𝒪(n)` and higher direct images (AlgebraicModuliForArithmeticGeometry R09.1) or
the blow-up (R09.7a); none of these is in either library (Mathlib's `Proj` is the `Proj` of a
graded ring, without `𝒪(n)`). **Mumford regularity is therefore not stated** (it needs `𝒪(n)` and
`R^qπ_*` on `P(E)`). Stated in Lean: the polynomial and Laurent extensions of a scheme. -/

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme _root_.AlgebraicGeometry.Scheme

/-! ### G-theory and K-theory homotopy invariance

`SchemeKTheoryOperations:S.5/graded-quillen-lemma`, `S.5/rees-dehomogenisation`,
`S.5/g-theory-homotopy-invariance-affine`, `S.5/zero-section-transfer-vanishes`,
`S.5/g-theory-homotopy-invariance`, `S.5/g-theory-laurent-decomposition`,
`S.5/homotopy-invariance-regular`, `S.5/laurent-decomposition-regular`,
`S.5/negative-k-vanishing-regular`. -/

/- `SchemeKTheoryOperations:S.5/graded-quillen-lemma`: not stated here; needs the abelian category
`Mgr(S)` of finitely generated graded modules and its Quillen K-theory (supplier:
GeneralAlgebraicKTheory:K.3/resolution-theorem, K.1).
`SchemeKTheoryOperations:S.5/rees-dehomogenisation`: not stated here; needs the Serre quotient
`Mgr(S)/Mt_gr(S)` (supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
`SchemeKTheoryOperations:S.5/g-theory-homotopy-invariance-affine`: not stated here; needs `G(R)`,
`G(R[s])` of spectra (supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.5/zero-section-transfer-vanishes`: not stated here; needs `z_*` on `G`
and `K` (supplier: GeneralAlgebraicKTheory:K.3, K.4/waldhausen-additivity-theorem).
`SchemeKTheoryOperations:S.5/g-theory-homotopy-invariance`: not stated here; needs `p^*` on `G`
(supplier: GeneralAlgebraicKTheory:K.3).
`SchemeKTheoryOperations:S.5/g-theory-laurent-decomposition`: not stated here; needs the G-theory
localisation boundary (supplier: GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
`SchemeKTheoryOperations:S.5/homotopy-invariance-regular`: not stated here; needs `K(X[T])` and
`NK_n` (supplier: GeneralAlgebraicKTheory:K.6). Its regularity inputs are Mathlib's
`Polynomial.isRegularRing_of_isRegularRing` and `MvPolynomial.isRegularRing_of_isRegularRing`.
`SchemeKTheoryOperations:S.5/laurent-decomposition-regular`: not stated here; needs `K_n` of Laurent
extensions (supplier: GeneralAlgebraicKTheory:K.6).
`SchemeKTheoryOperations:S.5/negative-k-vanishing-regular`: not stated here; needs negative
K-groups (supplier: GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K). -/

/-! ### Projective bundles and Mumford regularity

`SchemeKTheoryOperations:S.5/projective-bundle-cohomology`, `S.5/projective-bundle-koszul`,
`S.5/mumford-regularity`, `S.5/mumford-regularity-lemmas`, `S.5/quillen-resolution`,
`S.5/pbt-split-injection`, `S.5/pbt-regular-approximation`,
`S.5/projective-bundle-theorem-noetherian`, `S.5/projective-bundle-theorem`,
`S.5/projective-line-k-theory`. Convention (pinned): `P(E) = Proj_X(Sym E)`, rank-one quotients,
`P(𝒪^{⊕r}) = ℙ^{r-1}_X`, `F(n) = F ⊗ 𝒪(n)`. -/

/- `SchemeKTheoryOperations:S.5/projective-bundle-cohomology`: not stated here; needs `P(E)`,
`𝒪(n)` and `R^qπ_*` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1,
SchemeAndStackFoundations:SF.2).
`SchemeKTheoryOperations:S.5/projective-bundle-koszul`: not stated here; needs `P(E)`, `𝒪(n)` and
exterior powers of `𝒪_X`-modules (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).
`SchemeKTheoryOperations:S.5/mumford-regularity-lemmas`: not stated here; needs `MumfordRegular`
(supplier: AlgebraicModuliForArithmeticGeometry:R09.1).
`SchemeKTheoryOperations:S.5/pbt-split-injection`,
`SchemeKTheoryOperations:S.5/pbt-regular-approximation`,
`SchemeKTheoryOperations:S.5/projective-bundle-theorem-noetherian`,
`SchemeKTheoryOperations:S.5/projective-bundle-theorem`: not stated here; need `P(E)`, `𝒪(-i)` and
the nonconnective K-theory spectra (supplier: AlgebraicModuliForArithmeticGeometry:R09.1,
GeneralAlgebraicKTheory:K.6).
`SchemeKTheoryOperations:S.5/projective-line-k-theory`: not stated here; needs `𝒪(m)` on `ℙ¹_X`
(supplier: AlgebraicModuliForArithmeticGeometry:R09.1); even its degree-zero part (b)
`[𝒪(m-1)] + [𝒪(m+1)] = 2[𝒪(m)]` in `K_0(ℙ¹_X)` needs the twisting sheaves. -/

-- `MumfordRegular`: not stated here; needs the projective bundle `P(E)` with `𝒪(1)` and the higher
-- direct images `R^qπ_*` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1 for `P(E)` and
-- `𝒪(n)`, SchemeAndStackFoundations:SF.2 for `R^qπ_*`). Suggested form, for `F` quasi-coherent on
-- `P(E)`: `MumfordRegular m F :↔ ∀ q ≥ 1, R^qπ_*(F ⊗ 𝒪(m - q)) = 0`.
-- `MumfordRegular.twist`: not stated here; needs `MumfordRegular` and `𝒪(n)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `MumfordRegular.mono`: not stated here; needs `MumfordRegular` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `MumfordRegular.of_extension`: not stated here; needs `MumfordRegular` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `MumfordRegular.acyclic`: not stated here; needs `R^qπ_*` (supplier:
-- SchemeAndStackFoundations:SF.2).
-- `MumfordRegular.globallyGenerated`: not stated here; needs `π_*`, `π^*` on `P(E)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `MumfordRegular.exists`: not stated here; needs Serre vanishing on `P(E)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `MumfordRegular.pullback`: not stated here; needs `Sym^n E` and `𝒪(n)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `MumfordRegular.baseChange`: not stated here; needs flat base change of `R^qπ_*` (supplier:
-- SchemeAndStackFoundations:SF.2).
-- test mumfordRegular_twist_P1 (computation): not stated here; needs `𝒪(n)` on `ℙ¹_k` and
-- `H¹(ℙ¹, 𝒪(-2))` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1,
-- SchemeAndStackFoundations:SF.2).
-- test mumfordRegular_rank_one (degenerate): not stated here; needs `MumfordRegular` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test mumfordRegular_field (compatibility): not stated here; needs `H^q(ℙ^{r-1}_k, F(-q))`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, SchemeAndStackFoundations:SF.2).
-- test mumfordRegular_not_kernel_closed (non-example): not stated here; needs the Euler sequence
-- on `ℙ¹_k` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).

-- `quillenT`: not stated here; needs `π_*((Z_{n-1}F)(n))` on `P(E)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenZ`: not stated here; needs `𝒪(-n) ⊗ π^*T_nF` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenResolution`: not stated here; needs `quillenT`, `quillenZ` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenT_exact`: not stated here; needs `quillenT` and `MR(E)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenT_zero`: not stated here; needs `quillenT` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenT_pullback`: not stated here; needs `quillenT` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenZ_last`: not stated here; needs `quillenZ` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenT_perfect`: not stated here; needs `quillenT` on complexes (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenT_vectorBundle`: not stated here; needs `quillenT` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `quillenResolution_class`: not stated here; needs `𝒪(-k)` and `K_0(P(E))` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test quillenResolution_P1_O1 (computation): not stated here; needs `𝒪(±1)` on `ℙ¹_k` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test quillenResolution_pullback (degenerate): not stated here; needs `quillenT` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test quillenResolution_class_compat (compatibility): not stated here; needs `quillenT` on `K_0`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).
-- test quillenResolution_needs_regularity (non-example): not stated here; needs `𝒪(-1)` on `ℙ¹_k`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).

/-! ### `SchemeKTheoryOperations:S.5/laurent-extension-and-nk` -/

section Laurent

variable (X : Scheme.{u})

/-- **The polynomial extension** `X[T] := X ×_ℤ Spec ℤ[T]` (`S.5/laurent-extension-and-nk`): it is
Mathlib's affine line `𝔸(1; X)` (index type `ULift (Fin 1)`). -/
def Scheme.polynomialExtension : Scheme.{u} := 𝔸(ULift.{u} (Fin 1); X)

/-- The flat projection `p : X[T] → X` (helper). -/
def Scheme.polynomialExtension.proj : Scheme.polynomialExtension X ⟶ X :=
  𝔸(ULift.{u} (Fin 1); X) ↘ X

/-- The zero section `z : X → X[T]`, `T ↦ 0` (helper). -/
def Scheme.polynomialExtension.zeroSection : X ⟶ Scheme.polynomialExtension X :=
  AffineSpace.homOfVector (𝟙 X) (fun _ => 0)

/-- The unit section `e : X → X[T]`, `T ↦ 1` (helper). -/
def Scheme.polynomialExtension.unitSection : X ⟶ Scheme.polynomialExtension X :=
  AffineSpace.homOfVector (𝟙 X) (fun _ => 1)

/-- **The Laurent extension** `X[T, T⁻¹] := X ×_ℤ Spec ℤ[T, T⁻¹]`, with `ℤ[T, T⁻¹]` Mathlib's
`LaurentPolynomial`. -/
def Scheme.laurentExtension : Scheme.{u} :=
  Limits.pullback (Limits.terminal.from X)
    (Limits.terminal.from (Spec (.of (LaurentPolynomial (ULift.{u} ℤ)))))

/-- The inclusion `j₊ : X[T, T⁻¹] → X[T]` (helper), induced by `ℤ[T] → ℤ[T, T⁻¹]`, `T ↦ T`. -/
def Scheme.laurentExtension.inclusion :
    Scheme.laurentExtension X ⟶ Scheme.polynomialExtension X :=
  Limits.pullback.map _ _ _ _ (𝟙 X)
    (Spec.map (CommRingCat.ofHom (MvPolynomial.aeval (fun _ => LaurentPolynomial.T 1) :
      MvPolynomial (ULift.{u} (Fin 1)) (ULift.{u} ℤ) →ₐ[ULift.{u} ℤ]
        LaurentPolynomial (ULift.{u} ℤ)).toRingHom))
    (𝟙 _) (Limits.terminal.hom_ext _ _) (Limits.terminal.hom_ext _ _)

/-- `j₊ : X[T, T⁻¹] → X[T]` is the open immersion of the locus `T ≠ 0` (Mathlib's
`LaurentPolynomial.isLocalization`). -/
theorem laurentExtension_isOpen : IsOpenImmersion (Scheme.laurentExtension.inclusion X) := by
  sorry

end Laurent

-- `NK`: not stated here; needs `coker(p^* : K_n(X on Z) → K_n(X[T] on Z[T]))` for nonconnective
-- `K_n` (supplier: GeneralAlgebraicKTheory:K.6); already for `n = 0` it needs `p^*` on
-- `Scheme.K0`, i.e. flat pullback on `D_perf` (supplier: EnhancedDerivedSheaves:E1).
-- `NK_eq_ker`: not stated here; needs `NK` (supplier: GeneralAlgebraicKTheory:K.6).
-- `K_polynomialExtension_split`: not stated here; needs `K_n(X[T])` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `NK.map`: not stated here; needs `NK` (supplier: GeneralAlgebraicKTheory:K.6).
-- `NK_inv`: not stated here; needs `NK` and `N₋K` (supplier: GeneralAlgebraicKTheory:K.6).
-- `NK_affine`: not stated here; needs K.6's ring `NK_n(R)` (supplier: GeneralAlgebraicKTheory:K.6).
-- `NK_eq_zero_of_regular`: not stated here; needs `NK` (supplier: GeneralAlgebraicKTheory:K.6).
-- test NK_one_dualNumbers (computation): not stated here; needs `NK_1(Spec k[ε])` (supplier:
-- GeneralAlgebraicKTheory:K.6); its input that `1 + εT` is a unit is Mathlib's
-- `Polynomial.isUnit_iff_coeff_isUnit_isNilpotent`.
-- test NK_field (degenerate): not stated here; needs `NK` (supplier: GeneralAlgebraicKTheory:K.6).
-- test NK_affine_compat (compatibility): not stated here; needs `NK` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test NK_sections_differ (non-example): not stated here; needs `z^*`, `e^*` on `K_1` (supplier:
-- GeneralAlgebraicKTheory:K.6).

/-! ### Bass's fundamental theorem and blow-ups

`SchemeKTheoryOperations:S.5/bass-fundamental-theorem`, `S.5/bass-boundary-splitting`,
`S.5/nk-decomposition`, `S.5/affine-fundamental-theorem-comparison`,
`S.5/punctured-line-localisation-test`, `S.5/regular-blowup-geometry`,
`S.5/blowup-adjunction-lemma`, `S.5/codimension-one-triangle`,
`S.5/blowup-exceptional-triangles`, `S.5/blowup-acyclicity-criterion`,
`S.5/blowup-waldhausen-filtration`, `S.5/blowup-formula`, `S.5/blowup-exceptional-divisor-tests`,
`S.5/blowup-image-on-complement`. -/

/- `SchemeKTheoryOperations:S.5/bass-fundamental-theorem`, `S.5/bass-boundary-splitting`,
`S.5/nk-decomposition`, `S.5/affine-fundamental-theorem-comparison`,
`S.5/punctured-line-localisation-test`: not stated here; need nonconnective K-groups of
`X[T]`, `X[T⁻¹]`, `X[T, T⁻¹]` (defined above as schemes) and their boundaries (supplier:
GeneralAlgebraicKTheory:K.6, with the universal sign `ε = ∂_T(T)` of the packet's gap "Sign of
the boundary of the unit T").
`SchemeKTheoryOperations:S.5/regular-blowup-geometry`: not stated here; needs the blow-up
`Bl_Y X = Proj_X(⊕ J^n)` with `𝒪_{X′}(1)` (supplier: AlgebraicModuliForArithmeticGeometry:R09.7a,
tauceti StableReduction layer 4); its regular-sequence input is Mathlib's
`RingTheory.Sequence.IsRegular`.
`SchemeKTheoryOperations:S.5/blowup-adjunction-lemma`: not stated here; needs the blow-up and
`Rp_*`, `Lp^*` (supplier: AlgebraicModuliForArithmeticGeometry:R09.7a, EnhancedDerivedSheaves:E1).
`SchemeKTheoryOperations:S.5/codimension-one-triangle`: not stated here; needs `Li^* Ri_*` on
`D_perf` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
`SchemeKTheoryOperations:S.5/blowup-exceptional-triangles`,
`SchemeKTheoryOperations:S.5/blowup-acyclicity-criterion`: not stated here; need the blow-up,
`P(E)` and derived direct images (supplier: AlgebraicModuliForArithmeticGeometry:R09.7a, R09.1,
EnhancedDerivedSheaves:E1).
`SchemeKTheoryOperations:S.5/blowup-waldhausen-filtration`,
`SchemeKTheoryOperations:S.5/blowup-formula`,
`SchemeKTheoryOperations:S.5/blowup-exceptional-divisor-tests`,
`SchemeKTheoryOperations:S.5/blowup-image-on-complement`: not stated here; need the blow-up and
the K-theory spectra (supplier: AlgebraicModuliForArithmeticGeometry:R09.7a,
GeneralAlgebraicKTheory:K.4, K.6). -/

end TauCeti.AlgebraicGeometry.KTheory

/-! ## Stage `SchemeKTheoryOperations:S.6` — products and λ-operations

**λ-rings are special λ-rings (pinned):** "λ-ring" without qualification means special λ-ring;
the first two axioms alone define a pre-λ-ring (the K-book's "λ-ring"). **Adams operations are
defined by the Newton formula** `ψ^k = Σ_{i<k} (-1)^{i-1} λ^i ψ^{k-i} + (-1)^{k-1} k λ^k`
(`ψ² = x² - 2λ²`). Products of K-theory spectra, higher λ-operations on `K_m` (Quillen–Hiller,
Soulé) and the sheaf-level constructions are comments; the λ-ring algebra (universal polynomials
as `MvPolynomial`, special λ-rings, Adams and γ-operations, the γ-filtration, the monoid-algebra
λ-rings, the Bott class and the twisted λ-ring) is stated in full. -/

namespace TauCeti.AlgebraicGeometry.KTheory

/-! ### Products

`SchemeKTheoryOperations:S.6/support-product-pairings`, `S.6/external-product`,
`S.6/relative-k-theory-module`, `S.6/product-pullback-compatibility`,
`S.6/graded-commutative-ring`, `S.6/product-low-degree-comparison`. -/

-- `TauCeti.AlgebraicGeometry.KTheory.supportPairing`: not stated here; needs the biexact pairing
-- of spectra `K(X on Y) ∧ K(X on Z) → K(X on Y ∩ Z)` (supplier:
-- GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).
-- `TauCeti.AlgebraicGeometry.KTheory.supportMul`: not stated here; needs `K^Y_m(X)` and the
-- pairing (supplier: GeneralAlgebraicKTheory:K.7); in degree zero it needs `⊗^L` on
-- `Perf_Y(X) × Perf_Z(X)` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- `TauCeti.AlgebraicGeometry.KTheory.supportMul_forget`: not stated here; needs `supportMul`
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.supportMul_self`: not stated here; needs `supportMul`
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.supportMul_zero_class`: not stated here; needs `⊗^L` on
-- `D_perf` (supplier: EnhancedDerivedSheaves:E1/presentability-and-derived-tensor).
-- `TauCeti.AlgebraicGeometry.KTheory.gSupportPairing`: not stated here; needs the pairing with
-- G-theory (supplier: GeneralAlgebraicKTheory:K.7).
-- test supportMul_disjoint (degenerate): not stated here; needs `supportMul` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- test supportMul_point_line (computation): not stated here; needs the product on `K_0` with
-- supports (supplier: EnhancedDerivedSheaves:E1).
-- test supportMul_non_unital (non-example): not stated here; needs the product on `K^Y_0`
-- (supplier: EnhancedDerivedSheaves:E1).
-- test supportMul_self_compat (compatibility): not stated here; needs `supportMul` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.externalPairing`: not stated here; needs the external
-- product of spectra (supplier: GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products).
-- `TauCeti.AlgebraicGeometry.KTheory.externalMul_assoc`: not stated here; needs `externalPairing`
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.diag_externalMul`: not stated here; needs `externalPairing`
-- and `Δ^*` (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.externalMul_pullback`: not stated here; needs
-- `externalPairing` (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.externalMul_one`: not stated here; needs `externalPairing`
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.gExternalPairing`: not stated here; needs `G` of spectra
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- test externalMul_point (degenerate): not stated here; needs `externalPairing` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- test externalMul_structure_sheaf (computation): not stated here; needs `⊠` on `K_0` (supplier:
-- GeneralAlgebraicKTheory:K.7, EnhancedDerivedSheaves:E1).
-- test externalMul_projective_line (computation): not stated here; needs `𝒪(-1)` on `ℙ¹ × ℙ¹`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).
-- test diag_externalMul_compat (compatibility): not stated here; needs `externalPairing` (supplier:
-- GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.relative`: not stated here; needs the homotopy fibre of
-- `f^* : K(X) → K(X')` (supplier:
-- GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary,
-- StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
-- `TauCeti.AlgebraicGeometry.KTheory.relative_les`: not stated here; needs `relative` (supplier:
-- StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
-- `TauCeti.AlgebraicGeometry.KTheory.relative_module`: not stated here; needs module spectra
-- (supplier: GeneralAlgebraicKTheory:K.7).
-- `TauCeti.AlgebraicGeometry.KTheory.relative_open_immersion`: not stated here; needs `relative`
-- and `K(X on Y)` (supplier: GeneralAlgebraicKTheory:K.6).
-- `TauCeti.AlgebraicGeometry.KTheory.relative_map`: not stated here; needs `relative` (supplier:
-- GeneralAlgebraicKTheory:K.5).
-- test relative_id (degenerate): not stated here; needs `relative` (supplier:
-- GeneralAlgebraicKTheory:K.5).
-- test relative_open_compat (compatibility): not stated here; needs `relative` (supplier:
-- GeneralAlgebraicKTheory:K.5, K.6).
-- test relative_dvr (computation): not stated here; needs `K_0(j)` (supplier:
-- GeneralAlgebraicKTheory:K.5).
-- test relative_not_quotient (non-example): not stated here; needs `K_0(f)` (supplier:
-- GeneralAlgebraicKTheory:K.5).

/- `SchemeKTheoryOperations:S.6/product-pullback-compatibility`,
`SchemeKTheoryOperations:S.6/graded-commutative-ring`,
`SchemeKTheoryOperations:S.6/product-low-degree-comparison`: not stated here; need the products
on `K_*(X)` of K.7 (supplier: GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products); on `K_0`
the product needs `⊗^L` on `D_perf(𝒪_X)` (supplier:
EnhancedDerivedSheaves:E1/presentability-and-derived-tensor), and for `X = Spec A` it is
KTheoryLowDegrees Z.3's ring structure on Tau Ceti's `SplitK0` (`TauCeti.CategoryTheory.
GrothendieckGroup.Monoidal`). -/

end TauCeti.AlgebraicGeometry.KTheory

/-! ### `SchemeKTheoryOperations:S.6/lambda-universal-polynomials` -/

namespace TauCeti.LambdaRing

open MvPolynomial

/-- The two-set identity defining `P_k` in `k + k` variables (helper). -/
theorem exists_productPoly (k : ℕ) :
    ∃ P : MvPolynomial (Fin k ⊕ Fin k) ℤ,
      aeval (Sum.elim (fun i : Fin k => rename Sum.inl (esymm (Fin k) ℤ (i + 1)))
          (fun j : Fin k => rename Sum.inr (esymm (Fin k) ℤ (j + 1)))) P =
        aeval (fun p : Fin k × Fin k => (X (Sum.inl p.1) * X (Sum.inr p.2) :
          MvPolynomial (Fin k ⊕ Fin k) ℤ)) (esymm (Fin k × Fin k) ℤ k) := by
  sorry

/-- **Grothendieck's product polynomial** `P_k ∈ ℤ[a_1, …, a_k; b_1, …, b_k]`
(`S.6/lambda-universal-polynomials`), with `a_i = X (inl (i-1))`, `b_j = X (inr (j-1))`: the unique
polynomial with `e_k((ξ_i η_j)) = P_k(e(ξ); e(η))`, chosen from `exists_productPoly`. -/
noncomputable def productPoly (k : ℕ) : MvPolynomial (Fin k ⊕ Fin k) ℤ :=
  Classical.choose (exists_productPoly k)

/-- The polynomial `e_k` of the `l`-fold products `ξ_{i₁} ⋯ ξ_{i_l}`, `i₁ < ⋯ < i_l`, in `n`
variables (helper). -/
noncomputable def esymmOfProducts (n k l : ℕ) : MvPolynomial (Fin n) ℤ :=
  aeval (fun s : {s : Finset (Fin n) // s.card = l} => ∏ i ∈ s.1, (X i : MvPolynomial (Fin n) ℤ))
    (esymm {s : Finset (Fin n) // s.card = l} ℤ k)

/-- **Grothendieck's composition polynomial** `P_{k,l} ∈ ℤ[a_1, …, a_{kl}]`: the polynomial with
`P_{k,l}(e(ξ)) = e_k(ξ_{i₁} ⋯ ξ_{i_l})` in `kl` variables, from Tau Ceti's fundamental theorem
`MvPolynomial.IsSymmetric.exists_aeval_esymm` (the symmetry proof is left as `sorry`). -/
noncomputable def compPoly (k l : ℕ) : MvPolynomial (Fin (k * l)) ℤ :=
  Classical.choose (MvPolynomial.IsSymmetric.exists_aeval_esymm
    (p := esymmOfProducts (k * l) k l) (by sorry))

/-- **The Newton polynomial** `N_k` with `p_k = N_k(e_1, …, e_k)` (`psum`), from
`MvPolynomial.IsSymmetric.exists_aeval_esymm` and `MvPolynomial.psum_isSymmetric`. -/
noncomputable def newtonPoly (k : ℕ) : MvPolynomial (Fin k) ℤ :=
  Classical.choose (MvPolynomial.IsSymmetric.exists_aeval_esymm (psum_isSymmetric (Fin k) ℤ k))

/-- `e_k((ξ_i η_j)) = P_k(e(ξ); e(η))` in `ℤ[ξ_1, …, ξ_n, η_1, …, η_m]` for `n, m ≥ k`. -/
theorem productPoly_esymm (k n m : ℕ) (hn : k ≤ n) (hm : k ≤ m) :
    aeval (Sum.elim (fun i : Fin k => rename Sum.inl (esymm (Fin n) ℤ (i + 1)))
        (fun j : Fin k => rename Sum.inr (esymm (Fin m) ℤ (j + 1)))) (productPoly k) =
      aeval (fun p : Fin n × Fin m => (X (Sum.inl p.1) * X (Sum.inr p.2) :
        MvPolynomial (Fin n ⊕ Fin m) ℤ)) (esymm (Fin n × Fin m) ℤ k) := by
  sorry

/-- `e_k` of the products of `l` distinct `ξ`'s equals `P_{k,l}(e(ξ))` for `n ≥ kl`. -/
theorem compPoly_esymm (k l n : ℕ) (hn : k * l ≤ n) :
    aeval (fun i : Fin (k * l) => esymm (Fin n) ℤ (i + 1)) (compPoly k l) =
      esymmOfProducts n k l := by
  sorry

/-- Uniqueness of `P_k` (algebraic independence of the `e_j`): a polynomial with the defining
identity for some `n, m ≥ k` is `P_k`. -/
theorem productPoly_unique (k n m : ℕ) (hn : k ≤ n) (hm : k ≤ m)
    (Q : MvPolynomial (Fin k ⊕ Fin k) ℤ)
    (hQ : aeval (Sum.elim (fun i : Fin k => rename Sum.inl (esymm (Fin n) ℤ (i + 1)))
        (fun j : Fin k => rename Sum.inr (esymm (Fin m) ℤ (j + 1)))) Q =
      aeval (fun p : Fin n × Fin m => (X (Sum.inl p.1) * X (Sum.inr p.2) :
        MvPolynomial (Fin n ⊕ Fin m) ℤ)) (esymm (Fin n × Fin m) ℤ k)) :
    Q = productPoly k := by
  sorry

/-- `P_k` is isobaric of weight `k` in each set of variables (`a_i`, `b_i` of weight `i`), and
`P_{k,l}` is isobaric of weight `kl`. -/
theorem productPoly_isobaric (k l : ℕ) :
    (productPoly k).IsWeightedHomogeneous
        (Sum.elim (fun i : Fin k => (i : ℕ) + 1) (fun _ : Fin k => 0)) k ∧
      (productPoly k).IsWeightedHomogeneous
        (Sum.elim (fun _ : Fin k => 0) (fun j : Fin k => (j : ℕ) + 1)) k ∧
      (compPoly k l).IsWeightedHomogeneous (fun i : Fin (k * l) => (i : ℕ) + 1) (k * l) := by
  sorry

-- test productPoly_one (computation)
example : productPoly 1 = X (Sum.inl 0) * X (Sum.inr 0) := by
  sorry

-- test productPoly_two (computation)
/- `P_2 = a_1² b_2 + a_2 b_1² - 2 a_2 b_2`. -/
example : productPoly 2 = X (Sum.inl 0) ^ 2 * X (Sum.inr 1) + X (Sum.inl 1) * X (Sum.inr 0) ^ 2 -
    2 * X (Sum.inl 1) * X (Sum.inr 1) := by
  sorry

-- test compPoly_two_two (computation)
/- `P_{2,2} = a_1 a_3 - a_4`. -/
example : compPoly 2 2 = X 0 * X 2 - X 3 := by
  sorry

-- test compPoly_k_one (degenerate)
/- `P_{k,1} = a_k` and `P_{1,l} = a_l` (the index `k*1`, `1*l` read through `Fin.cast`). -/
example (k l : ℕ) (hk : 0 < k) (hl : 0 < l) :
    compPoly k 1 = X ⟨k - 1, by omega⟩ ∧ compPoly 1 l = X ⟨l - 1, by omega⟩ := by
  sorry

-- test productPoly_ne_naive (non-example)
/- `P_2 ≠ a_2 b_2 + a_1 b_1` (the naive `λ²(xy) = λ²(x)λ²(y) + xy` fails at `x = y = 2`: `λ²(4) = 6`
while `1 + 4 = 5`). -/
example : productPoly 2 ≠ X (Sum.inl 1) * X (Sum.inr 1) + X (Sum.inl 0) * X (Sum.inr 0) := by
  sorry

end TauCeti.LambdaRing

/-! ### `SchemeKTheoryOperations:S.6/lambda-ring` -/

namespace TauCeti

open MvPolynomial

/-- **Pre-λ-ring** (`S.6/lambda-ring`): a commutative ring with operations `λ^k` such that
`λ^0 = 1`, `λ^1 = id` and `λ^k(x + y) = Σ_{i+j=k} λ^i(x) λ^j(y)` (the K-book's "λ-ring"). -/
class PreLambdaRing (K : Type*) [CommRing K] where
  /-- The operations `λ^k`. -/
  lambda : ℕ → K → K
  /-- `λ^0(x) = 1`. -/
  lambda_zero' : ∀ x, lambda 0 x = 1
  /-- `λ^1(x) = x`. -/
  lambda_one' : ∀ x, lambda 1 x = x
  /-- The sum formula. -/
  lambda_add' : ∀ k x y,
    lambda k (x + y) = ∑ i ∈ Finset.range (k + 1), lambda i x * lambda (k - i) y

/-- **Special λ-ring** (`S.6/lambda-ring`, Grothendieck's λ-anneau): a pre-λ-ring with
`λ^k(1) = 0` for `k ≥ 2`, `λ^k(xy) = P_k(λ^•x; λ^•y)` and `λ^k(λ^l x) = P_{k,l}(λ^•x)`. -/
class LambdaRing (K : Type*) [CommRing K] extends PreLambdaRing K where
  /-- `λ^k(1) = 0` for `k ≥ 2`. -/
  lambda_one_eq_zero' : ∀ k, 2 ≤ k → lambda k 1 = 0
  /-- The product axiom. -/
  lambda_mul' : ∀ k x y, lambda k (x * y) =
    aeval (Sum.elim (fun i : Fin k => lambda (i + 1) x) (fun j : Fin k => lambda (j + 1) y))
      (LambdaRing.productPoly k)
  /-- The composition axiom. -/
  lambda_lambda' : ∀ k l x, lambda k (lambda l x) =
    aeval (fun i : Fin (k * l) => lambda (i + 1) x) (LambdaRing.compPoly k l)

namespace LambdaRing

open PreLambdaRing

variable {K : Type*} [CommRing K]

/-- A power series with constant coefficient `1` as a unit (helper). -/
noncomputable def unitOfConstOne (f : PowerSeries K) (hf : PowerSeries.constantCoeff f = 1) :
    (PowerSeries K)ˣ where
  val := f
  inv := PowerSeries.invOfUnit f 1
  val_inv := PowerSeries.mul_invOfUnit f 1 (by simpa using hf)
  inv_val := by rw [mul_comm]; exact PowerSeries.mul_invOfUnit f 1 (by simpa using hf)

/-- **`λ_t`** (`LambdaRing.lambdaTotal`): `x ↦ Σ λ^k(x) t^k`, an additive-to-multiplicative
homomorphism `K → 1 + tK[[t]]` (the spelling of KTheoryLowDegrees Z.3's `lambdaTotal`). -/
noncomputable def lambdaTotal [PreLambdaRing K] : K →+ Additive (PowerSeries K)ˣ where
  toFun x := Additive.ofMul (unitOfConstOne (PowerSeries.mk fun k => lambda k x)
    (by simp [PreLambdaRing.lambda_zero']))
  map_zero' := by sorry
  map_add' := by sorry

/-- `λ^k(x + y) = Σ_{i+j=k} λ^i(x) λ^j(y)`. -/
@[simp]
theorem lambda_add [PreLambdaRing K] (k : ℕ) (x y : K) :
    lambda k (x + y) = ∑ p ∈ Finset.antidiagonal k, lambda p.1 x * lambda p.2 y := by
  sorry

/-- `λ_t(-x) = λ_t(x)⁻¹`. -/
@[simp]
theorem lambda_neg [PreLambdaRing K] (x : K) : lambdaTotal (-x) = -lambdaTotal x :=
  map_neg _ x

/-- `λ^k(n) = C(n, k)` for `n ∈ ℕ` in a special λ-ring. -/
@[simp]
theorem lambda_natCast [LambdaRing K] (k n : ℕ) : lambda k (n : K) = (n.choose k : K) := by
  sorry

/-- `λ^k(xy) = P_k(λ^•x; λ^•y)`. -/
theorem lambda_mul [LambdaRing K] (k : ℕ) (x y : K) :
    lambda k (x * y) =
      aeval (Sum.elim (fun i : Fin k => lambda (i + 1) x) (fun j : Fin k => lambda (j + 1) y))
        (productPoly k) :=
  LambdaRing.lambda_mul' k x y

/-- `λ^k(λ^l x) = P_{k,l}(λ^•x)`. -/
theorem lambda_lambda [LambdaRing K] (k l : ℕ) (x : K) :
    lambda k (lambda l x) = aeval (fun i : Fin (k * l) => lambda (i + 1) x) (compPoly k l) :=
  LambdaRing.lambda_lambda' k l x

/-- **λ-homomorphisms**: ring homomorphisms commuting with every `λ^k`, with identity and
composition (`Hom.id`, `Hom.comp`); the bundled category of special λ-rings is not formed. -/
structure Hom (K L : Type*) [CommRing K] [LambdaRing K] [CommRing L] [LambdaRing L]
    extends K →+* L where
  /-- `f ∘ λ^k = λ^k ∘ f`. -/
  map_lambda' : ∀ k x, toRingHom (lambda k x) = lambda k (toRingHom x)

/-- The identity λ-homomorphism (helper). -/
def Hom.id (K : Type*) [CommRing K] [LambdaRing K] : Hom K K :=
  { RingHom.id K with map_lambda' := fun _ _ => rfl }

/-- Composition of λ-homomorphisms (helper). -/
def Hom.comp {K L M : Type*} [CommRing K] [LambdaRing K] [CommRing L] [LambdaRing L] [CommRing M]
    [LambdaRing M] (g : Hom L M) (f : Hom K L) : Hom K M :=
  { g.toRingHom.comp f.toRingHom with
    map_lambda' := fun k x => by
      simp only [RingHom.comp_apply]
      rw [f.map_lambda', g.map_lambda'] }

/-- **λ-ideals**: ideals with `λ^k(I) ⊆ I` for `k ≥ 1`. -/
structure Ideal (K : Type*) [CommRing K] [LambdaRing K] where
  /-- The underlying ideal. -/
  toIdeal : _root_.Ideal K
  /-- `λ^k(I) ⊆ I` for `k ≥ 1`. -/
  lambda_mem' : ∀ k, 1 ≤ k → ∀ x ∈ toIdeal, lambda k x ∈ toIdeal

/-- The kernel of a λ-homomorphism is a λ-ideal (helper). -/
def Hom.ker {K L : Type*} [CommRing K] [LambdaRing K] [CommRing L] [LambdaRing L] (f : Hom K L) :
    LambdaRing.Ideal K where
  toIdeal := RingHom.ker f.toRingHom
  lambda_mem' := by sorry

/-- **Non-unital λ-algebras** over a special λ-ring `K₀`: operations `λ^k` on `I` such that the
unitalisation `K₀ ⊕ I` with `λ^k(a, x) = (λ^k a, Σ_{i<k} λ^i(a) λ^{k-i}(x))` is a special λ-ring
(Soulé's structure on `K(A) = ⊕ K_m(A)` and on `K^Y(X)`). -/
structure NonUnitalAlgebra (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] (I : Type*)
    [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I] where
  /-- The operations on `I`. -/
  lambdaI : ℕ → I → I
  /-- The unitalisation is a special λ-ring with the displayed operations. -/
  isLambdaRing : ∃ inst : LambdaRing (Unitization K₀ I), ∀ (k : ℕ) (a : K₀) (x : I),
    inst.lambda (k + 1) (Unitization.inl a + (x : Unitization K₀ I)) =
      Unitization.inl (lambda (k + 1) a) +
        ((∑ i ∈ Finset.range (k + 1), lambda i a • lambdaI (k + 1 - i) x : I) : Unitization K₀ I)

/-- `ℤ` with the binomial operations `λ^k(n) = C(n, k)` (`Ring.choose`) is a special λ-ring; it is
initial among special λ-rings (not restated). The axioms are left as `sorry`. -/
instance int : LambdaRing ℤ where
  lambda k n := Ring.choose n k
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry
  lambda_one_eq_zero' := by sorry
  lambda_mul' := by sorry
  lambda_lambda' := by sorry

-- test LambdaRing.int_lambda_two_three (computation)
example : lambda 2 (3 : ℤ) = 3 ∧ lambda 3 (2 : ℤ) = 0 := by
  sorry

-- test LambdaRing.zero_ring (degenerate)
example (K : Type*) [CommRing K] [Subsingleton K] :
    Nonempty (LambdaRing K) ∧ ∀ s t : LambdaRing K, s = t := by
  sorry

/-- The pre-λ-ring `ℤ` with `λ_t(n) = (1 + t + t²)^n` (test helper). -/
@[instance_reducible]
noncomputable def cubicPreLambda : PreLambdaRing ℤ where
  lambda k n := PowerSeries.coeff k
    ((unitOfConstOne (1 + PowerSeries.X + PowerSeries.X ^ 2 : PowerSeries ℤ) (by simp)) ^ n :
      (PowerSeries ℤ)ˣ).val
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry

-- test LambdaRing.not_special_example (non-example)
/- `λ_t(n) = (1 + t + t²)^n` satisfies the pre-λ axioms but `λ²(1) = 1 ≠ 0`, so no special λ-ring
structure on `ℤ` has these operations. -/
example : cubicPreLambda.lambda 2 1 = 1 ∧
    ¬ ∃ inst : LambdaRing ℤ, inst.toPreLambdaRing = cubicPreLambda := by
  sorry

-- test LambdaRing.ringK0_compat (compatibility): not stated here; needs KTheoryLowDegrees Z.3's
-- `λ^k` on `K_0(R)` (`TauCeti.RingK0.lambda`, a suggested declaration in neither library)
-- (supplier: KTheoryLowDegrees:Z.3/lambda, with
-- SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring for specialness).

end LambdaRing

end TauCeti

namespace TauCeti.LambdaRing

open MvPolynomial PreLambdaRing

/-! ### `SchemeKTheoryOperations:S.6/laurent-lambda-ring` -/

section MonoidAlgebra

variable {R : Type*} [CommRing R]

/-- The unit `1 + a t` of `R[[t]]` (helper). -/
noncomputable def lineUnit (a : R) : (PowerSeries R)ˣ :=
  unitOfConstOne (1 + PowerSeries.C a * PowerSeries.X) (by simp)

variable (M : Type*) [AddCommMonoid M]

/-- `λ_t` on `ℤ[M]`: the additive extension of `[m] ↦ 1 + [m] t` (helper; a real definition through
`Finsupp.liftAddHom` on the coefficients). -/
noncomputable def monoidAlgebraLambdaTotal :
    AddMonoidAlgebra ℤ M →+ Additive (PowerSeries (AddMonoidAlgebra ℤ M))ˣ :=
  (Finsupp.liftAddHom fun m => zmultiplesHom _
      (Additive.ofMul (lineUnit (AddMonoidAlgebra.single m (1 : ℤ))))).comp
    AddMonoidAlgebra.coeffAddEquiv.toAddMonoidHom

/-- **The λ-ring of a monoid of line elements** (`S.6/laurent-lambda-ring`): `ℤ[M]` with
`λ_t(m) = 1 + m t`; the operations are the coefficients of `monoidAlgebraLambdaTotal`, the
axioms are left as `sorry`. Instances: `ℤ[u^{±1}]` (Mathlib's `LaurentPolynomial ℤ`), `ℤ[ℕ^n]`,
the character ring of a torus. -/
noncomputable instance monoidAlgebra : LambdaRing (AddMonoidAlgebra ℤ M) where
  lambda k x := PowerSeries.coeff k (Additive.toMul (monoidAlgebraLambdaTotal M x)).val
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry
  lambda_one_eq_zero' := by sorry
  lambda_mul' := by sorry
  lambda_lambda' := by sorry

variable {M}

/-- Every `m ∈ M` is a line element: `λ^k(m) = 0` for `k ≥ 2`. -/
@[simp]
theorem monoidAlgebra_lambda_of (m : M) (k : ℕ) (hk : 2 ≤ k) :
    lambda k (AddMonoidAlgebra.single m (1 : ℤ)) = 0 := by
  sorry

/-- `λ^k(m_1 + ⋯ + m_n) = e_k(m_1, …, m_n)`. -/
@[simp]
theorem monoidAlgebra_lambda_sum (n k : ℕ) (m : Fin n → M) :
    lambda k (∑ i, AddMonoidAlgebra.single (m i) (1 : ℤ)) =
      aeval (fun i => AddMonoidAlgebra.single (m i) (1 : ℤ)) (esymm (Fin n) ℤ k) := by
  sorry

/-- A monoid homomorphism `M → M'` induces a λ-homomorphism `ℤ[M] → ℤ[M']`. -/
noncomputable def monoidAlgebra_map {M' : Type*} [AddCommMonoid M'] (f : M →+ M') :
    Hom (AddMonoidAlgebra ℤ M) (AddMonoidAlgebra ℤ M') :=
  { AddMonoidAlgebra.mapDomainRingHom ℤ f with map_lambda' := by sorry }

/-- For a special λ-ring `K`, a monoid map `M → K` into line elements extends uniquely to a
λ-homomorphism `ℤ[M] → K` (K-book Ex. II.4.4(c)). -/
theorem monoidAlgebra_lift (K : Type*) [CommRing K] [LambdaRing K] (φ : Multiplicative M →* K)
    (hφ : ∀ (m : Multiplicative M) (j : ℕ), 2 ≤ j → lambda j (φ m) = 0) :
    ∃! f : Hom (AddMonoidAlgebra ℤ M) K,
      ∀ m : M, f.toRingHom (AddMonoidAlgebra.single m 1) = φ (Multiplicative.ofAdd m) := by
  sorry

/-- The λ-ring `ℤ[ξ_i]`, the monoid algebra of `σ →₀ ℕ` (helper instance). -/
noncomputable instance mvPolynomialLambdaRing (σ : Type*) : LambdaRing (MvPolynomial σ ℤ) :=
  inferInstanceAs (LambdaRing (AddMonoidAlgebra ℤ (σ →₀ ℕ)))

-- test monoidAlgebra_lambda_two (computation)
example :
    lambda 2 (LaurentPolynomial.T 1 + LaurentPolynomial.T (-1) : LaurentPolynomial ℤ) = 1 := by
  sorry

-- test monoidAlgebra_trivial (degenerate)
/- For the trivial monoid, `ℤ[M] = ℤ` with the binomial structure. -/
example (k : ℕ) (n : ℤ) :
    lambda k (n : AddMonoidAlgebra ℤ (Fin 1)) =
      ((Ring.choose n k : ℤ) : AddMonoidAlgebra ℤ (Fin 1)) := by
  sorry

-- test monoidAlgebra_special (characterisation)
/- `λ³(λ²(ξ₁ + ξ₂ + ξ₃)) = P_{3,2}(λ^•(ξ₁ + ξ₂ + ξ₃)) = ξ₁²ξ₂²ξ₃²` in `ℤ[ξ₁, ξ₂, ξ₃]`. -/
example :
    lambda 3 (lambda 2 (X 0 + X 1 + X 2 : MvPolynomial (Fin 3) ℤ)) =
        aeval (fun i : Fin (3 * 2) => lambda (i + 1) (X 0 + X 1 + X 2 : MvPolynomial (Fin 3) ℤ))
          (compPoly 3 2) ∧
      lambda 3 (lambda 2 (X 0 + X 1 + X 2 : MvPolynomial (Fin 3) ℤ)) =
        X 0 ^ 2 * X 1 ^ 2 * X 2 ^ 2 := by
  sorry

end MonoidAlgebra

/-! ### `SchemeKTheoryOperations:S.6/lambda-identity-principle` -/

/-- Expressions in `r` variables built from integer constants, `+`, `-`, `·` and the `λ^k`
(helper syntax for the identity principle). -/
inductive LambdaExpr (r : ℕ) : Type
  | var : Fin r → LambdaExpr r
  | const : ℤ → LambdaExpr r
  | add : LambdaExpr r → LambdaExpr r → LambdaExpr r
  | neg : LambdaExpr r → LambdaExpr r
  | mul : LambdaExpr r → LambdaExpr r → LambdaExpr r
  | lam : ℕ → LambdaExpr r → LambdaExpr r

/-- Evaluation of a λ-expression in a special λ-ring (helper). -/
def LambdaExpr.eval {r : ℕ} {K : Type*} [CommRing K] [LambdaRing K] (x : Fin r → K) :
    LambdaExpr r → K
  | .var i => x i
  | .const n => n
  | .add e f => e.eval x + f.eval x
  | .neg e => -e.eval x
  | .mul e f => e.eval x * f.eval x
  | .lam k e => lambda k (e.eval x)

/-- **The identity principle** (`S.6/lambda-identity-principle`): an identity `F = G` of
λ-expressions that holds in `ℤ[ξ^{(1)}, …, ξ^{(r)}]` for `x_j = ξ^{(j)}_1 + ⋯ + ξ^{(j)}_n`, for all
sufficiently large `n`, holds for all elements of every special λ-ring. (The augmented and
fixed-rank variants are not restated.) -/
theorem lambda_identity_principle {r : ℕ} (F G : LambdaExpr r)
    (h : ∃ N : ℕ, ∀ n ≥ N,
      F.eval (fun j => ∑ i : Fin n, (X (j, i) : MvPolynomial (Fin r × Fin n) ℤ)) =
        G.eval (fun j => ∑ i : Fin n, (X (j, i) : MvPolynomial (Fin r × Fin n) ℤ)))
    (K : Type*) [CommRing K] [LambdaRing K] (x : Fin r → K) : F.eval x = G.eval x := by
  sorry

/-! ### `SchemeKTheoryOperations:S.6/adams-operations` -/

section Adams

variable {K : Type*} [CommRing K]

/-- **Adams operations** (`S.6/adams-operations`) of a pre-λ-ring, by the **Newton recursion**
`ψ^{k+1}(x) = Σ_{i=0}^{k-1} (-1)^i λ^{i+1}(x) ψ^{k-i}(x) + (-1)^k (k+1) λ^{k+1}(x)`, i.e.
`ψ^k = N_k(λ^1, …, λ^k)`; `ψ^0` is set to `0` (for an augmented λ-ring the packet's `ψ^0 = ε`). -/
def adams [PreLambdaRing K] : ℕ → K → K
  | 0 => fun _ => 0
  | k + 1 => fun x => ∑ i : Fin k, (-1) ^ (i : ℕ) * lambda (i + 1) x * adams (k - i) x +
      (-1) ^ k * ((k + 1 : ℕ) : K) * lambda (k + 1) x
decreasing_by omega

/-- `ψ^1 = id`. -/
@[simp]
theorem adams_one [PreLambdaRing K] (x : K) : adams 1 x = x := by
  simp [adams, PreLambdaRing.lambda_one']

/-- `ψ²(x) = x² - 2λ²(x)`. -/
@[simp]
theorem adams_two [PreLambdaRing K] (x : K) : adams 2 x = x ^ 2 - 2 * lambda 2 x := by
  sorry

/-- The Newton recursion `ψ^k − λ^1ψ^{k−1} + ⋯ + (−1)^{k−1}λ^{k−1}ψ^1 + (−1)^k k λ^k = 0`. -/
theorem adams_newton [PreLambdaRing K] (k : ℕ) (hk : 1 ≤ k) (x : K) :
    adams k x + ∑ i ∈ Finset.Ico 1 k, (-1) ^ i * lambda i x * adams (k - i) x +
      (-1) ^ k * (k : K) * lambda k x = 0 := by
  sorry

/-- `Σ_{k≥1} ψ^k(x) t^k = -t λ'_{-t}(x) / λ_{-t}(x)`, in the division-free form
`ψ_t(x) · λ_{-t}(x) = -t · (d/dt) λ_{-t}(x)`. -/
theorem adamsSeries [PreLambdaRing K] (x : K) :
    PowerSeries.mk (fun k => adams k x) * PowerSeries.mk (fun k => (-1) ^ k * lambda k x) =
      -(PowerSeries.X *
        PowerSeries.derivative K (PowerSeries.mk fun k => (-1) ^ k * lambda k x)) := by
  sorry

/-- `ψ^k(x + y) = ψ^k(x) + ψ^k(y)` in any pre-λ-ring (`S.6/adams-additivity-square-zero`). -/
@[simp]
theorem adams_add [PreLambdaRing K] (k : ℕ) (x y : K) :
    adams k (x + y) = adams k x + adams k y := by
  sorry

/-- λ-homomorphisms commute with the Adams operations. -/
theorem adams_map [LambdaRing K] {L : Type*} [CommRing L] [LambdaRing L] (f : Hom K L) (k : ℕ)
    (x : K) : f.toRingHom (adams k x) = adams k (f.toRingHom x) := by
  sorry

-- test adams_int (computation)
/- In `ℤ` with `λ^k(n) = C(n, k)`: `ψ^k(n) = n` (e.g. `ψ²(2) = 4 - 2 = 2`). -/
example : (∀ (k : ℕ) (n : ℤ), 1 ≤ k → adams k n = n) ∧ adams 2 (2 : ℤ) = 2 := by
  sorry

-- test adams_zero (degenerate)
example [PreLambdaRing K] (k : ℕ) : adams k (0 : K) = 0 := by
  sorry

-- test adams_ne_pow (non-example)
example : adams 2 (2 : ℤ) ≠ 2 ^ 2 := by
  sorry

-- test adams_line (characterisation)
example [PreLambdaRing K] (ℓ : K) (hℓ : ∀ j, 2 ≤ j → lambda j ℓ = 0) (k : ℕ) (hk : 1 ≤ k) :
    adams k ℓ = ℓ ^ k := by
  sorry

-- test adams_ringK0_line (compatibility): not stated here; needs KTheoryLowDegrees Z.3's `λ^k` on
-- `K_0(R)` and the class `[L^{⊗k}]` (supplier: KTheoryLowDegrees:Z.3/lambda; Tau Ceti's
-- `SplitK0` carries `K_0(R)` but not its λ-operations).

/-! `SchemeKTheoryOperations:S.6/laurent-lambda-ring`, continued: the Adams operations of `ℤ[M]`
(stated here because `adams` is defined in this section). -/

/-- `ψ^k(m) = m^k` for `m ∈ M` (written additively, `k • m`), and `ψ^k` is the ring endomorphism of
`ℤ[M]` induced by `m ↦ k • m`, for `k ≥ 1`. -/
@[simp]
theorem monoidAlgebra_adams {M : Type*} [AddCommMonoid M] (k : ℕ) (hk : 1 ≤ k) (m : M) :
    adams k (AddMonoidAlgebra.single m (1 : ℤ)) = AddMonoidAlgebra.single (k • m) 1 ∧
      ∀ x : AddMonoidAlgebra ℤ M,
        adams k x = AddMonoidAlgebra.mapDomainRingHom ℤ (nsmulAddMonoidHom (α := M) k) x := by
  sorry

-- test monoidAlgebra_adams_ne_frobenius (non-example)
/- In `ℤ[u]` (the monoid algebra `MvPolynomial (Fin 1) ℤ`): `ψ²(u + 1) = u² + 1 ≠ (u + 1)²`. -/
example : adams 2 (X 0 + 1 : MvPolynomial (Fin 1) ℤ) = X 0 ^ 2 + 1 ∧
    adams 2 (X 0 + 1 : MvPolynomial (Fin 1) ℤ) ≠ (X 0 + 1) ^ 2 := by
  sorry

/-! ### `SchemeKTheoryOperations:S.6/adams-additivity-square-zero`,
`SchemeKTheoryOperations:S.6/adams-multiplicative-composition` -/

/-- **Additivity, line elements and square-zero ideals** (`S.6/adams-additivity-square-zero`):
in a pre-λ-ring (a) `ψ^k` is additive; (b) `ψ^k(ℓ) = ℓ^k` on line elements; (c) if
`λ^i(x) λ^j(x) = 0` for all `i, j ≥ 1` then `ψ^k(x) = (-1)^{k-1} k λ^k(x)`, and `λ^k` is additive on
a λ-ideal of square zero; (d) on a binomial λ-ring every `ψ^k` is the identity. -/
theorem adams_additivity_square_zero [PreLambdaRing K] :
    (∀ (k : ℕ) (x y : K), adams k (x + y) = adams k x + adams k y) ∧
      (∀ ℓ : K, (∀ j, 2 ≤ j → lambda j ℓ = 0) → ∀ k, 1 ≤ k → adams k ℓ = ℓ ^ k) ∧
      (∀ x : K, (∀ i j, 1 ≤ i → 1 ≤ j → lambda i x * lambda j x = 0) →
        ∀ k, 1 ≤ k → adams k x = (-1) ^ (k - 1) * (k : K) * lambda k x) ∧
      (∀ I : _root_.Ideal K, I * I = ⊥ → (∀ k, 1 ≤ k → ∀ x ∈ I, lambda k x ∈ I) →
        ∀ k, 1 ≤ k → ∀ x ∈ I, ∀ y ∈ I, lambda k (x + y) = lambda k x + lambda k y) ∧
      (∀ [BinomialRing K], (∀ k (x : K), lambda k x = Ring.choose x k) →
        ∀ k, 1 ≤ k → ∀ x : K, adams k x = x) := by
  sorry

/-- **Adams operations are λ-endomorphisms with `ψ^k ψ^l = ψ^{kl}`**
(`S.6/adams-multiplicative-composition`): in a special λ-ring `ψ^k` is a ring endomorphism
commuting with every `λ^l`, `ψ^k ∘ ψ^l = ψ^{kl}`, and `ψ^p(x) ≡ x^p` modulo `pK`. -/
theorem adams_multiplicative_composition [LambdaRing K] (k l : ℕ) (hk : 1 ≤ k) (hl : 1 ≤ l) :
    adams k (1 : K) = 1 ∧ (∀ x y : K, adams k (x * y) = adams k x * adams k y) ∧
      (∀ x : K, adams k (lambda l x) = lambda l (adams k x)) ∧
      (∀ x : K, adams k (adams l x) = adams (k * l) x) ∧
      ∀ p : ℕ, p.Prime → ∀ x : K, adams p x - x ^ p ∈ _root_.Ideal.span {(p : K)} := by
  sorry

-- test LambdaRing.habiro_compat (compatibility)
/- The condition of HabiroRings HR.1 (a Λ-ring with commuting Adams operations: `ψ^1 = id`,
`ψ^{mn} = ψ^m ψ^n`, `ψ^p(x) ≡ x^p mod p`) holds for the Adams operations of a torsion-free special
λ-ring; the HR.1 structure itself is a suggested declaration of that roadmap. -/
example [LambdaRing K] [IsAddTorsionFree K] :
    (∀ x : K, adams 1 x = x) ∧ (∀ (m n : ℕ) (x : K), 1 ≤ m → 1 ≤ n →
      adams (m * n) x = adams m (adams n x)) ∧
      ∀ p : ℕ, p.Prime → ∀ x : K, adams p x - x ^ p ∈ _root_.Ideal.span {(p : K)} := by
  sorry

end Adams

end TauCeti.LambdaRing

namespace TauCeti.LambdaRing

open MvPolynomial PreLambdaRing

/-! ### `SchemeKTheoryOperations:S.6/gamma-filtration` -/

section Gamma

variable {K : Type*} [CommRing K] [LambdaRing K]

/-- **Augmented λ-ring** (`S.6/gamma-filtration`): a special λ-ring `K` with a binomial λ-subring
`H` (given as a binomial ring `H` embedded by `ι`, with `λ^k(ι h) = ι C(h, k)`) and a
λ-homomorphism `ε : K → H` retracting `ι` (for `K_0(X)`, `H = H^0(X, ℤ)` and `ε` the rank). -/
structure Augmented (K : Type*) [CommRing K] [LambdaRing K] (H : Type*) [CommRing H]
    [BinomialRing H] where
  /-- The embedding of the binomial λ-subring. -/
  ι : H →+* K
  /-- `ι` is injective. -/
  ι_injective : Function.Injective ι
  /-- The augmentation. -/
  ε : K →+* H
  /-- `ε` retracts `ι`. -/
  ε_ι : ∀ h, ε (ι h) = h
  /-- On `H` the λ-operations are binomial. -/
  lambda_ι : ∀ k h, lambda k (ι h) = ι (Ring.choose h k)
  /-- `ε` is a λ-homomorphism. -/
  ε_lambda : ∀ k x, ε (lambda k x) = Ring.choose (ε x) k

/-- **γ-operations** `γ^k(x) = λ^k(x + k - 1)`, `γ^0 = 1` (the spelling of KTheoryLowDegrees Z.3's
`gamma`; for `k = 0` the truncated `k - 1 = 0` gives `λ^0 = 1`). -/
def gamma (k : ℕ) (x : K) : K := lambda k (x + ((k - 1 : ℕ) : K))

/-- `γ^k(x + y) = Σ_{i+j=k} γ^i(x) γ^j(y)`. -/
@[simp]
theorem gamma_add (k : ℕ) (x y : K) :
    gamma k (x + y) = ∑ i ∈ Finset.range (k + 1), gamma i x * gamma (k - i) y := by
  sorry

variable {H : Type*} [CommRing H] [BinomialRing H]

/-- **The γ-filtration** `F^n_γ K`: `F^0 = K`, and for `n ≥ 1` the ideal generated by the products
`γ^{i₁}(x₁) ⋯ γ^{i_r}(x_r)` with `ε(x_j) = 0` and `i₁ + ⋯ + i_r ≥ n` (Z.3's
`gammaFiltration`, with `ker ε` for Z.3's `augmentation`). -/
def gammaFiltration (A : Augmented K H) (n : ℕ) : _root_.Ideal K :=
  _root_.Ideal.span {y | ∃ (m : ℕ) (k : Fin m → ℕ) (x : Fin m → K), (∀ i, 0 < k i) ∧
    (∀ i, A.ε (x i) = 0) ∧ n ≤ ∑ i, k i ∧ y = ∏ i, gamma (k i) (x i)}

/-- `F^i F^j ⊆ F^{i+j}` and `F^{n+1} ⊆ F^n`. -/
theorem gammaFiltration_mul (A : Augmented K H) (i j n : ℕ) :
    gammaFiltration A i * gammaFiltration A j ≤ gammaFiltration A (i + j) ∧
      gammaFiltration A (n + 1) ≤ gammaFiltration A n := by
  sorry

/-- The ideal is the additive subgroup generated by the `ι(H)`-multiples of the γ-products (the
packet's "additive subgroup generated by the γ-products" when `H = ℤ` or, as for
`H = H^0(X, ℤ)`, `H` is spanned by idempotents). -/
theorem gammaFiltration_eq_span (A : Augmented K H) (n : ℕ) :
    ((gammaFiltration A n : Set K)) = AddSubgroup.closure
      {y | ∃ (h : H) (m : ℕ) (k : Fin m → ℕ) (x : Fin m → K), (∀ i, 0 < k i) ∧
        (∀ i, A.ε (x i) = 0) ∧ n ≤ ∑ i, k i ∧ y = A.ι h * ∏ i, gamma (k i) (x i)} := by
  sorry

/-- The graded pieces `gr^n_γ K = F^n_γ / F^{n+1}_γ` (their graded ring and `H`-module structures
are not formed here). -/
abbrev gammaGraded (A : Augmented K H) (n : ℕ) : Type _ :=
  ↥(gammaFiltration A n) ⧸
    Submodule.comap (Submodule.subtype (gammaFiltration A n)) (gammaFiltration A (n + 1))

/-- Augmented λ-homomorphisms preserve `F^n_γ`. -/
theorem gammaFiltration_map {L : Type*} [CommRing L] [LambdaRing L] (A : Augmented K H)
    (B : Augmented L H) (f : Hom K L) (hf : ∀ x, B.ε (f.toRingHom x) = A.ε x) (n : ℕ) :
    (gammaFiltration A n).map f.toRingHom ≤ gammaFiltration B n := by
  sorry

-- `TauCeti.LambdaRing.gammaFiltration_ringK0`: not stated here; needs KTheoryLowDegrees Z.3's
-- λ-structure and `gammaFiltration` on `K_0(R)` (supplier: KTheoryLowDegrees:Z.3/gamma-filtration,
-- a suggested declaration in neither library).

/-- `γ^k(ℓ - 1) = 0` for `k ≥ 2` and a line element `ℓ` (K-book Lemma II.4.5.3). -/
@[simp]
theorem gamma_line_sub_one (ℓ : K) (hℓ : ∀ j, 2 ≤ j → lambda j ℓ = 0) (k : ℕ) (hk : 2 ≤ k) :
    gamma k (ℓ - 1) = 0 := by
  sorry

-- test gamma_two (computation)
example (x : K) : gamma 2 x = lambda 2 x + x := by
  sorry

-- test gammaFiltration_zero_one (degenerate)
example (A : Augmented K H) (B : Augmented ℤ ℤ) :
    gammaFiltration A 0 = ⊤ ∧ gammaFiltration A 1 = RingHom.ker A.ε ∧ gammaFiltration B 1 = ⊥ := by
  sorry

-- test gamma_line (computation)
/- In `ℤ[u^{±1}]` (Mathlib's `LaurentPolynomial ℤ`, augmented by `u ↦ 1`), `F^n_γ = ((u - 1)^n)`. -/
example (A : Augmented (LaurentPolynomial ℤ) ℤ) (hA : A.ε (LaurentPolynomial.T 1) = 1) (n : ℕ)
    (hn : 1 ≤ n) :
    gammaFiltration A n = _root_.Ideal.span {(LaurentPolynomial.T 1 - 1) ^ n} := by
  sorry

-- test gammaFiltration_not_adic (non-example)
/- For `R(C_2) = ℤ[σ]/(σ² - 1) = ℤ[ℤ/2]` (augmented by `σ ↦ 1`), `F^n_γ = 2^{n-1}(σ - 1)ℤ ≠ 0`
for all `n ≥ 1`: the γ-filtration need not be finite. -/
example (A : Augmented (AddMonoidAlgebra ℤ (ZMod 2)) ℤ)
    (hA : A.ε (AddMonoidAlgebra.single 1 1) = 1) (n : ℕ) (hn : 1 ≤ n) :
    (gammaFiltration A n : Set (AddMonoidAlgebra ℤ (ZMod 2))) =
        Set.range (fun m : ℤ => m • (2 ^ (n - 1) * (AddMonoidAlgebra.single 1 1 - 1))) ∧
      gammaFiltration A n ≠ ⊥ := by
  sorry

-- test gammaFiltration_ringK0 (compatibility): not stated here; needs KTheoryLowDegrees Z.3's
-- `gammaFiltration` on `K_0(R)` (supplier: KTheoryLowDegrees:Z.3/gamma-filtration).

/-! ### `SchemeKTheoryOperations:S.6/adams-eigenvalue-on-gamma-graded` -/

/-- **`ψ^k` acts on `gr^n_γ` by `k^n`** (`S.6/adams-eigenvalue-on-gamma-graded`): for `x ∈ F^n_γ`
(`n ≥ 1`), modulo `F^{n+1}_γ`: `ψ^k(x) ≡ k^n x`, `λ^k(x) ≡ (-1)^{k-1} k^{n-1} x` and
`γ^n(x) ≡ (-1)^{n-1} (n-1)! x`. The explicit correction polynomials `Q_{k,i}` are not restated. -/
theorem adams_eigenvalue_on_gamma_graded (A : Augmented K H) (n : ℕ) (hn : 1 ≤ n) (k : ℕ)
    (hk : 1 ≤ k) (x : K) (hx : x ∈ gammaFiltration A n) :
    adams k x - (k : K) ^ n * x ∈ gammaFiltration A (n + 1) ∧
      lambda k x - (-1) ^ (k - 1) * (k : K) ^ (n - 1) * x ∈ gammaFiltration A (n + 1) ∧
      gamma n x - (-1) ^ (n - 1) * ((n - 1).factorial : K) * x ∈ gammaFiltration A (n + 1) := by
  sorry

/-! ### `SchemeKTheoryOperations:S.6/rational-weight-decomposition` -/

/-- `ψ^k` restricted to a `ψ^k`-stable additive subgroup, as a `ℤ`-linear map (helper; additive by
`adams_add`). -/
def adamsOn (J : AddSubgroup K) (hJ : ∀ (k : ℕ) (x : K), x ∈ J → adams k x ∈ J) (k : ℕ) :
    J →ₗ[ℤ] J :=
  AddMonoidHom.toIntLinearMap
    { toFun := fun x => ⟨adams k x, hJ k x x.2⟩
      map_zero' := by sorry
      map_add' := by sorry }

/-- **Weight decomposition from a γ-filtration of bounded length**
(`S.6/rational-weight-decomposition`): if `J = J ∩ F^a_γ` and `J ∩ F^{N+1}_γ` is torsion, then for
every `k ≥ 2`, (1) `∏_{i=a}^{N} (ψ^k - k^i) = 0` on `J ⊗ ℚ` and `J ⊗ ℚ = Σ_i J^{(i)}` (eigenspaces
of `ψ^k`), and (2) `J^{(i)}` does not depend on `k ≥ 2`. The identification `J^{(i)} ≅ gr^i_γ J_ℚ`,
the projector formula and multiplicativity (3)–(5) are not restated. -/
theorem rational_weight_decomposition (A : Augmented K H) (J : AddSubgroup K)
    (hJ : ∀ (k : ℕ) (x : K), x ∈ J → adams k x ∈ J) (a N : ℕ) (haN : a ≤ N)
    (ha : ∀ x ∈ J, x ∈ gammaFiltration A a)
    (hN : ∀ x ∈ J, x ∈ gammaFiltration A (N + 1) → ∃ m : ℕ, 0 < m ∧ m • x = 0) (k : ℕ)
    (hk : 2 ≤ k) :
    ((List.range' a (N + 1 - a)).map fun i =>
        LinearMap.baseChange ℚ (adamsOn J hJ k) - ((k : ℚ) ^ i) • (1 : Module.End ℚ _)).prod = 0 ∧
      (⨆ i ∈ Finset.Icc a N,
        Module.End.eigenspace (LinearMap.baseChange ℚ (adamsOn J hJ k)) ((k : ℚ) ^ i)) = ⊤ ∧
      ∀ (k' i : ℕ), 2 ≤ k' →
        Module.End.eigenspace (LinearMap.baseChange ℚ (adamsOn J hJ k)) ((k : ℚ) ^ i) =
          Module.End.eigenspace (LinearMap.baseChange ℚ (adamsOn J hJ k')) ((k' : ℚ) ^ i) := by
  sorry

end Gamma

end TauCeti.LambdaRing

/-! ### Representation rings

`SchemeKTheoryOperations:S.6/representation-ring-of-gl`, `S.6/serre-representation-ring-theorem`,
`S.6/representation-ring`, `S.6/representation-frobenius`. -/

namespace TauCeti.RepresentationRing

open TauCeti.LambdaRing TauCeti.PreLambdaRing

/-- **A representation of the group scheme `GL_N` over `k`** (`S.6/representation-ring-of-gl`):
for every commutative `k`-algebra `A` a homomorphism `GL_N(A) → GL_m(A)`, natural in `A`, whose
matrix entries are polynomials over `k` in the entries of `g` and in `det(g)⁻¹`. -/
structure GLRep (k : Type u) [CommRing k] (N : ℕ) where
  /-- The rank `m` of the representation module `k^m`. -/
  rank : ℕ
  /-- The action on `A`-points. -/
  ρ : ∀ (A : Type u) [CommRing A] [Algebra k A], GL (Fin N) A →* GL (Fin rank) A
  /-- Naturality in `A`. -/
  naturality : ∀ (A B : Type u) [CommRing A] [Algebra k A] [CommRing B] [Algebra k B]
    (f : A →ₐ[k] B) (g : GL (Fin N) A),
    ρ B (Matrix.GeneralLinearGroup.map f.toRingHom g) =
      Matrix.GeneralLinearGroup.map f.toRingHom (ρ A g)
  /-- The entries are polynomials in `g_ij` and `det(g)⁻¹`. -/
  polynomial : ∃ P : Matrix (Fin rank) (Fin rank) (MvPolynomial ((Fin N × Fin N) ⊕ Fin 1) k),
    ∀ (A : Type u) [CommRing A] [Algebra k A] (g : GL (Fin N) A),
      (ρ A g : Matrix (Fin rank) (Fin rank) A) =
        P.map (MvPolynomial.aeval (Sum.elim (fun ij => (g : Matrix (Fin N) (Fin N) A) ij.1 ij.2)
          (fun _ => ((g⁻¹ : GL (Fin N) A) : Matrix (Fin N) (Fin N) A).det)))

-- `TauCeti.RepresentationRing.ofGL`: not stated here; needs the abelian category of `GLRep`s
-- (comodules over `k[GL_N]`) with its exact sequences and their Grothendieck group (supplier:
-- tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups
-- #layer-4-characters-and-schur-polynomials,
-- with Tau Ceti's `ExactK0`).
-- `TauCeti.RepresentationRing.ofGL.preLambda`: not stated here; needs `ofGL` and exterior powers
-- of `GLRep`s (supplier: the same ClassicalGroups layer 4).
-- `TauCeti.RepresentationRing.ofGL.restrict`: not stated here; needs `ofGL` (supplier: the same).
-- `TauCeti.RepresentationRing.stableGL`: not stated here; needs `ofGL` and the inverse limit
-- (supplier: the same).
-- `TauCeti.RepresentationRing.stableGL.ofOperation`: not stated here; needs `stableGL` (supplier:
-- the same).
-- `TauCeti.RepresentationRing.ofGL.dual`: not stated here; needs `ofGL` (supplier: the same).
-- `TauCeti.RepresentationRing.ofGL.baseChange`: not stated here; needs `ofGL` over `ℤ` and `𝔽_p`
-- (supplier: the same).
-- test ofGL_one (computation): not stated here; needs `ofGL` (supplier: the same).
-- test ofGL_restrict_id (characterisation): not stated here; needs `ofGL.restrict` (supplier: the
-- same).
-- test ofGL_lambda_top (computation): not stated here; needs `λ^N` on `ofGL` (supplier: the same).
-- test ofGL_not_abstract_group (non-example): not stated here; needs `ofGL` (supplier: the same).
-- test ofGL_zero (degenerate): not stated here; needs `ofGL` (supplier: the same).

/- `SchemeKTheoryOperations:S.6/serre-representation-ring-theorem`: not stated here; needs
`R_k(GL_N)` (`ofGL`) and its character map to `ℤ[X_1^{±1}, …, X_N^{±1}]^{Σ_N}` (supplier: the
ClassicalGroups layer 4 request; the packet's gap "Serre's theorem on representation rings of
split reductive groups"). -/

end TauCeti.RepresentationRing

namespace TauCeti

open TauCeti.LambdaRing TauCeti.PreLambdaRing

section RepresentationRing

variable (A : Type u) [CommRing A] (G : Type u) [Group G]

/-- Representations whose underlying `A`-module is finitely generated projective (helper). -/
def repFiniteProjective : ObjectProperty (Rep.{u} A G) :=
  fun V => Module.Finite A V ∧ Module.Projective A V

instance repFiniteProjective_containsZero : (repFiniteProjective A G).ContainsZero := by
  sorry

instance repFiniteProjective_isClosedUnderBinaryProducts :
    (repFiniteProjective A G).IsClosedUnderBinaryProducts := by
  sorry

/-- They are closed under extensions in the abelian category `Rep A G` (helper). -/
theorem repFiniteProjective_isExtensionClosed :
    (ExactStructure.abelian (Rep.{u} A G)).IsExtensionClosed (repFiniteProjective A G) := by
  sorry

instance repFiniteProjective_essentiallySmall :
    EssentiallySmall.{u} (repFiniteProjective A G).FullSubcategory := by
  sorry

/-- **The representation ring `R_A(G)`** (`S.6/representation-ring`): Tau Ceti's `ExactK0` of the
exact category of `A G`-modules finitely generated projective over `A`, for short exact sequences
(not the split `K₀`: Tau Ceti's `repRing k G` over a field is the split version). -/
abbrev RepresentationRing : Type u :=
  ExactK0.{u} ((ExactStructure.abelian (Rep.{u} A G)).fullSubcategory _
    (repFiniteProjective_isExtensionClosed A G))

/-- The ring structure of `R_A(G)` under `⊗_A` with the diagonal action (helper instance; the
additive structure is `ExactK0`'s, the multiplication is data left as `sorry`). -/
noncomputable instance RepresentationRing.commRing : CommRing (RepresentationRing A G) :=
  { (inferInstance : AddCommGroup (RepresentationRing A G)) with
    mul := sorry
    one := sorry
    mul_assoc := sorry
    one_mul := sorry
    mul_one := sorry
    left_distrib := sorry
    right_distrib := sorry
    zero_mul := sorry
    mul_zero := sorry
    mul_comm := sorry }

/-- The pre-λ-ring structure of `R_A(G)` by exterior powers `Λ^k_A` (data left as `sorry`). -/
noncomputable instance RepresentationRing.preLambda : PreLambdaRing (RepresentationRing A G) :=
  sorry

variable {A G}

/-- Restriction `ρ^* : R_A(G') → R_A(G)` along `ρ : G → G'` (data, `sorry` body: `ExactK0.map` of
restriction of representations). -/
noncomputable def RepresentationRing.restrict {G' : Type u} [Group G'] (ρ : G →* G') :
    RepresentationRing A G' →+ RepresentationRing A G :=
  sorry

/-- Extension of scalars `f_* : R_A(G) → R_{A'}(G)` (data, `sorry` body). -/
noncomputable def RepresentationRing.extendScalars {A' : Type u} [CommRing A'] (f : A →+* A') :
    RepresentationRing A G →+ RepresentationRing A' G :=
  sorry

/-- The forgetful map `R_A(G) → K_0(A)` (data, `sorry` body: `ExactK0.map` of the forgetful
functor to `finiteProjectiveModules A`). -/
noncomputable def RepresentationRing.forget :
    RepresentationRing A G →+ ExactK0.{u} (finiteProjectiveModulesExactStructure A) :=
  sorry

-- `TauCeti.RepresentationRing.ofGLPullback`: not stated here; needs `R_ℤ(GL_N)` (`ofGL`) (supplier:
-- tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups
-- #layer-4-characters-and-schur-polynomials).

/-- The Frobenius twist `Φ^* : R_A(G) → R_A(G)`, `[P] ↦ [A ⊗_{Φ,A} P]`, for `pA = 0` (data,
`sorry` body). -/
noncomputable def RepresentationRing.frobeniusTwist (p : ℕ) [Fact p.Prime] [CharP A p] :
    RepresentationRing A G →+ RepresentationRing A G :=
  sorry

-- test representationRing_trivial_group (degenerate)
/- `R_A(1) = K_0(A)` (additively here; the pre-λ comparison needs Z.3's `λ^k` on `K_0(A)`, supplier:
KTheoryLowDegrees:Z.3/lambda). -/
example [Subsingleton G] : Function.Bijective (RepresentationRing.forget (A := A) (G := G)) := by
  sorry

-- test representationRing_cyclic_two (computation)
/- `R_ℂ(ℤ/2) = ℤ[σ]/(σ² - 1) = ℤ[ℤ/2]` with `λ²(1 + σ) = σ`. -/
example : ∃ e : RepresentationRing ℂ (Multiplicative (ZMod 2)) ≃+* AddMonoidAlgebra ℤ (ZMod 2),
    lambda 2 (1 + e.symm (AddMonoidAlgebra.single 1 1)) = e.symm (AddMonoidAlgebra.single 1 1) := by
  sorry

-- test representationRing_not_free_only (non-example)
/- For `A` a Dedekind domain with nontrivial class group and `G` trivial, `R_A(1) = K_0(A)` is not
`ℤ` (which the free modules alone would give). -/
example (A : Type u) [CommRing A] [IsDedekindDomain A] [Subsingleton G]
    (hA : Nontrivial (ClassGroup A)) :
    ¬ Nonempty (RepresentationRing A G ≃+ ℤ) := by
  sorry

-- test representationRing_forget_compat (compatibility): not stated here; needs `ofGLPullback`
-- (supplier: the ClassicalGroups layer 4 request).

/-- **`ψ^p` is the Frobenius twist in characteristic `p`** (`S.6/representation-frobenius`), part
(b): for `pA = 0`, `ψ^p = Φ^*` on `R_A(G)`. Part (a), on `R_{𝔽_p}(GL_N)`, needs `ofGL` (supplier:
the ClassicalGroups layer 4 request). -/
theorem representation_frobenius (p : ℕ) [Fact p.Prime] [CharP A p]
    (x : RepresentationRing A G) : adams p x = RepresentationRing.frobeniusTwist p x := by
  sorry

end RepresentationRing

end TauCeti

/-! ### λ-operations on higher K-theory (Quillen–Hiller, Kratzer, Soulé)

`SchemeKTheoryOperations:S.6/representation-classifying-map`, `S.6/quillen-hiller-operations`,
`S.6/quillen-hiller-special-lambda`, `S.6/hiller-universality`, `S.6/adams-product-compatibility`,
`S.6/adams-on-units-and-products`, `S.6/kratzer-low-gamma`, `S.6/soule-gamma-bound`,
`S.6/affine-weight-decomposition`, `S.6/field-weight-decomposition`. -/

-- `TauCeti.KTheory.LambdaOperations.classifyingMap`: not stated here; needs `[BG, BGL(A)^+]`, the
-- plus construction and homotopy classes of maps (supplier: GeneralAlgebraicKTheory:K.2:plus,
-- StableHomotopyKTheory:H.3/plus-construction-universal-property, H.1/nerve-and-classifying-space).
-- `TauCeti.KTheory.LambdaOperations.classifyingMap_add`: not stated here; needs `classifyingMap`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.classifyingMap_natural`: not stated here; needs
-- `classifyingMap` (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.stableMap`: not stated here; needs `[BGL(A)^+, BGL(A)^+]` and
-- `R_ℤ(GL)` (supplier: StableHomotopyKTheory:H.4/gl-telescope-plus-comparison).
-- `TauCeti.KTheory.LambdaOperations.stableMap_id`: not stated here; needs `stableMap` (supplier:
-- StableHomotopyKTheory:H.4/gl-telescope-plus-comparison).
-- test classifyingMap_trivial (degenerate): not stated here; needs `classifyingMap` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- test classifyingMap_units (computation): not stated here; needs `[S¹, BGL(A)^+] = K_1(A)`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- test classifyingMap_not_module_only (non-example): not stated here; needs `classifyingMap`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- test classifyingMap_restrict_compat (compatibility): not stated here; needs `r_{A,N}` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.op`: not stated here; needs `τ_A ∈ [BGL(A)^+, BGL(A)^+]`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.lambda`: not stated here; needs `K_m(A) = π_m BGL(A)^+`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.gamma`: not stated here; needs `K_m(A)` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.adams`: not stated here; needs `K_m(A)` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.op_natural`: not stated here; needs `op` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.KTheory.LambdaOperations.lambda_zero_ring`: not stated here; needs `op` and Z.3's
-- `λ^k` on `K_0(A)` (supplier: GeneralAlgebraicKTheory:K.2:plus, KTheoryLowDegrees:Z.3/lambda).
-- test lambda_one (degenerate): not stated here; needs `λ^1` on `K_m(A)` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- test adams_units (computation): not stated here; needs `ψ^k` on `K_1(A)` (supplier:
-- GeneralAlgebraicKTheory:K.2:plus).
-- test lambda_not_exterior_on_objects (non-example): not stated here; needs `λ²` on `K_1(A)`
-- (supplier: GeneralAlgebraicKTheory:K.2:plus).
-- test op_zero_ring_compat (compatibility): not stated here; needs `op` on `K_0(A)` and Z.3's
-- `λ^k` (supplier: KTheoryLowDegrees:Z.3/lambda).

/- `SchemeKTheoryOperations:S.6/quillen-hiller-special-lambda`, `S.6/hiller-universality`,
`S.6/adams-product-compatibility`, `S.6/adams-on-units-and-products`, `S.6/kratzer-low-gamma`,
`S.6/soule-gamma-bound`, `S.6/affine-weight-decomposition`, `S.6/field-weight-decomposition`: not
stated here; each needs the higher K-groups `K_m(A) = π_m BGL(A)^+` with their λ-operations
(supplier: GeneralAlgebraicKTheory:K.2:plus, StableHomotopyKTheory:H.3; `S.6/hiller-universality`
also the packet's gap "Hiller's universality of the classifying map", and
`S.6/soule-gamma-bound` the gap "Suslin's stability theorems"). Their λ-ring input, once
`K_0(A) ⊕ ⨁_{m ≥ 1} K_m(A)` is a K_0(A)-λ-algebra, is `TauCeti.LambdaRing.NonUnitalAlgebra`,
`adams_additivity_square_zero` and `rational_weight_decomposition`. -/

/-! ### Vector bundles, flag bundles, simplicial sheaves and Soulé's scheme operations

`SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring`, `S.6/complete-flag-bundle`,
`S.6/k-theoretic-splitting-principle`, `S.6/simplicial-sheaf-hypercohomology`,
`S.6/sheaf-level-k-theory-model`, `S.6/soule-scheme-operations`, `S.6/scheme-lambda-algebra`,
`S.6/operations-functoriality`, `S.6/degree-zero-comparison`, `S.6/singular-scheme-operations`,
`S.6/scheme-adams-multiplicative`, `S.6/scheme-gamma-bound`, `S.6/scheme-weight-decomposition`,
`S.6/finite-coefficient-weight-decomposition`, `S.6/riou-motivic-uniqueness`. -/

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme TauCeti.LambdaRing TauCeti.PreLambdaRing

variable {X : Scheme.{u}}

/-- The `n`-th tensor power `L^{⊗n}` of an `𝒪_X`-module (helper, Tau Ceti's
`Scheme.Modules.tensorProduct`). -/
noncomputable def tensorPow (L : X.Modules) : ℕ → X.Modules
  | 0 => structureModule X
  | n + 1 => Scheme.Modules.tensorProduct X (tensorPow L n) L

/-- The ring structure of `K_0(Vect X)` under `⊗` (helper instance; the additive structure is
`ExactK0`'s, the multiplication is data left as `sorry`, pinned by `vector_bundle_lambda_ring`). -/
noncomputable instance Scheme.K0Vect.commRing : CommRing (Scheme.K0Vect X) :=
  { (inferInstance : AddCommGroup (Scheme.K0Vect X)) with
    mul := sorry
    one := sorry
    mul_assoc := sorry
    one_mul := sorry
    mul_one := sorry
    left_distrib := sorry
    right_distrib := sorry
    zero_mul := sorry
    mul_zero := sorry
    mul_comm := sorry }

/-- The special λ-ring structure of `K_0(Vect X)` by exterior powers
(`S.6/vector-bundle-lambda-ring`; data left as `sorry`: exterior powers of `𝒪_X`-modules are in
neither library). -/
noncomputable instance Scheme.K0Vect.lambdaRing : LambdaRing (Scheme.K0Vect X) :=
  sorry

end TauCeti.AlgebraicGeometry.KTheory

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme TauCeti.LambdaRing TauCeti.PreLambdaRing
  TauCeti.RepresentationRing

/-- **`K_0` of vector bundles is a special λ-ring** (`S.6/vector-bundle-lambda-ring`), as far as it
is statable here: the product is the tensor product, line bundles are line elements and
`ψ^k[L] = [L^{⊗k}]`. The formula `λ^k[E] = [Λ^k E]` needs exterior powers of `𝒪_X`-modules, and the
map `R_ℤ(GL_N) → K_0(Vect X)` needs `ofGL`; both are left out (supplier: the ClassicalGroups
layer 4 request for `ofGL`; exterior powers of sheaves of modules are a gap of the packet). -/
theorem vector_bundle_lambda_ring {X : Scheme.{u}} [CompactSpace X] (E F : X.Modules)
    (hE : vectorBundles X E) (hF : vectorBundles X F)
    (hEF : vectorBundles X (Scheme.Modules.tensorProduct X E F)) (L : X.Modules)
    (hL : vectorBundles X L) (hLpow : ∀ n, vectorBundles X (tensorPow L n))
    (hLinv : ∃ L' : X.Modules,
      Nonempty (Scheme.Modules.tensorProduct X L L' ≅ structureModule X)) :
    (ExactK0.of ⟨E, hE⟩ * ExactK0.of ⟨F, hF⟩ : Scheme.K0Vect X) = ExactK0.of ⟨_, hEF⟩ ∧
      (∀ k, 2 ≤ k → lambda k (ExactK0.of ⟨L, hL⟩ : Scheme.K0Vect X) = 0) ∧
      ∀ k, 1 ≤ k →
        adams k (ExactK0.of ⟨L, hL⟩ : Scheme.K0Vect X) = ExactK0.of ⟨_, hLpow k⟩ := by
  sorry

end TauCeti.AlgebraicGeometry.KTheory

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme TauCeti.LambdaRing TauCeti.PreLambdaRing

-- `TauCeti.AlgebraicGeometry.flagBundle`: not stated here; needs the projective bundle `P(E)` of
-- lines with its tautological subbundle (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).
-- `TauCeti.AlgebraicGeometry.flagBundle.filtration`: not stated here; needs `flagBundle` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `TauCeti.AlgebraicGeometry.flagBundle.baseChange`: not stated here; needs `flagBundle` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `TauCeti.AlgebraicGeometry.flagBundle.projective`: not stated here; needs `flagBundle` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- `TauCeti.AlgebraicGeometry.flagBundle.lineQuotients_sum`: not stated here; needs `flagBundle`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).
-- test flagBundle_line (degenerate): not stated here; needs `flagBundle` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test flagBundle_rank_two (computation): not stated here; needs `P(E)` and `𝒪(±1)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test flagBundle_pbt_compat (compatibility): not stated here; needs `K_*(Fl(E))` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1, GeneralAlgebraicKTheory:K.6).
-- test flagBundle_not_grassmannian (non-example): not stated here; needs `Fl(𝒪³)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).

-- `TauCeti.AlgebraicGeometry.SimplicialSheaf`: not stated here; needs the Brown–Gersten closed
-- model structure on pointed simplicial sheaves on `X_Zar` (the packet's gap "The homotopy theory
-- of simplicial sheaves on a noetherian scheme"; Mathlib has `SSet`, `CategoryTheory.Sheaf` and
-- `HomotopicalAlgebra.ModelCategory`, but no such model structure).
-- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper`: not stated here; needs fibrant replacement in
-- that model structure (supplier: the same gap).
-- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_map`: not stated here; needs `hyper` (supplier:
-- the same gap).
-- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_les`: not stated here; needs `hyper` (supplier:
-- the same gap, StableHomotopyKTheory:H.2).
-- `TauCeti.AlgebraicGeometry.SimplicialSheaf.brownSS`: not stated here; needs `hyper` (supplier:
-- the same gap).
-- `TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_thomason`: not stated here; needs `hyper` and
-- Thomason's hypercohomology (supplier: StableHomotopyKTheory:H.5:spectra).
-- test hyper_point (degenerate): not stated here; needs `hyper` (supplier: the same gap).
-- test hyper_empty_support (degenerate): not stated here; needs `hyper` (supplier: the same gap).
-- test hyper_discrete (computation): not stated here; needs `hyper` (supplier: the same gap).
-- test hyper_not_sections (non-example): not stated here; needs `hyper` and `ℤ × BGL^+` (supplier:
-- the same gap, GeneralAlgebraicKTheory:K.2:plus).

-- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp`: not stated here; needs `K^Y_m(X)` as
-- hypercohomology of `ℤ × BGL^+` (supplier: the simplicial-sheaf gap,
-- GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.AlgebraicGeometry.KTheory.lambda`: not stated here; needs `K^Y_m(X)` (supplier: the
-- same).
-- `TauCeti.AlgebraicGeometry.KTheory.gamma`: not stated here; needs `K^Y_m(X)` (supplier: the
-- same).
-- `TauCeti.AlgebraicGeometry.KTheory.adams`: not stated here; needs `K^Y_m(X)` (supplier: the
-- same).
-- `TauCeti.AlgebraicGeometry.KTheory.augmentation`: not stated here; needs `K^Y_m(X)` (supplier:
-- the same); on `K_0(Vect X)` it is the rank.
-- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp_affine`: not stated here; needs `lambdaOp` and the
-- Quillen–Hiller operations (supplier: the same, GeneralAlgebraicKTheory:K.2:plus).
-- `TauCeti.AlgebraicGeometry.KTheory.lambdaOp_zero`: not stated here; needs `lambdaOp` (supplier:
-- the same); its target on vector bundles is `Scheme.K0Vect.lambdaRing`.
-- test adams_line_bundle (computation): not stated here; needs `lambdaOp` on `K_0(X)` (supplier:
-- the same); on `K_0(Vect X)` it is `vector_bundle_lambda_ring`.
-- test lambda_empty_support (degenerate): not stated here; needs `lambdaOp` (supplier: the same).
-- test lambdaOp_affine_compat (compatibility): not stated here; needs `lambdaOp` (supplier: the
-- same).
-- test adams_units_scheme (computation): not stated here; needs `ψ^k` on `K_1(X)` (supplier: the
-- same).
-- test lambda_not_objectwise (non-example): not stated here; needs `λ²` on `K_1(X)` (supplier: the
-- same).
-- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp`: not stated here; needs `K_m` of
-- quasi-projective schemes and the colimit over smooth embeddings (supplier: the same,
-- GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits).
-- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp_smooth`: not stated here; needs
-- `singularLambdaOp` (supplier: the same).
-- `TauCeti.AlgebraicGeometry.KTheory.singularLambdaOp_pullback`: not stated here; needs
-- `singularLambdaOp` (supplier: the same).
-- `TauCeti.AlgebraicGeometry.KTheory.singular_lambda_nilpotent`: not stated here; needs
-- `singularLambdaOp` (supplier: the same).
-- test singularLambdaOp_smooth (degenerate): not stated here; needs `singularLambdaOp` (supplier:
-- the same).
-- test singular_dual_numbers (computation): not stated here; needs `ψ^k` on `K_1(k[ε])` (supplier:
-- the same).
-- test singular_not_G_theory (non-example): not stated here; needs `ψ^k` on `K_0` of the dual
-- numbers (supplier: the same); its Cartan input is `cartan_singular_non_example`.
-- test singularLambdaOp_affine_compat (compatibility): not stated here; needs `singularLambdaOp`
-- (supplier: the same).

/- `SchemeKTheoryOperations:S.6/k-theoretic-splitting-principle`: not stated here; needs `Fl(E)` and
`K_*(Fl(E))` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, GeneralAlgebraicKTheory:K.6).
`SchemeKTheoryOperations:S.6/sheaf-level-k-theory-model`, `S.6/scheme-lambda-algebra`,
`S.6/operations-functoriality`, `S.6/degree-zero-comparison`, `S.6/scheme-adams-multiplicative`,
`S.6/scheme-gamma-bound`, `S.6/scheme-weight-decomposition`,
`S.6/finite-coefficient-weight-decomposition`: not stated here; need `K^Y_m(X)` as hypercohomology
of `ℤ × BGL^+` with Soulé's operations (supplier: the simplicial-sheaf gap,
GeneralAlgebraicKTheory:K.2:plus; `S.6/finite-coefficient-weight-decomposition` also
StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence).
`SchemeKTheoryOperations:S.6/riou-motivic-uniqueness`: not stated here; needs the `𝔸¹`-homotopy
category (the packet's gap "Representability of K-theory in the A¹-homotopy category"). -/

end TauCeti.AlgebraicGeometry.KTheory

/-! ### The Bott class and the twisted λ-ring

`SchemeKTheoryOperations:S.6/bott-cannibalistic-class`, `S.6/twisted-lambda-ring`,
`S.6/twisted-adams-formula`. A rank `p` element `N` is passed with its rank `p` and the hypothesis
`λ^j(N) = 0` for `j > p`. -/

namespace TauCeti.LambdaRing

open MvPolynomial PreLambdaRing

section Bott

/-- `∏_{i=1}^{p} (1 + ξ_i + ⋯ + ξ_i^{k-1})` in `ℤ[ξ_1, …, ξ_p]` (helper). -/
noncomputable def bottProduct (k p : ℕ) : MvPolynomial (Fin p) ℤ :=
  ∏ i : Fin p, ∑ j ∈ Finset.range k, (X i : MvPolynomial (Fin p) ℤ) ^ j

/-- **`Θ_k`**: the integer polynomial with `Θ_k(e_1, …, e_p) = ∏_i (1 + ξ_i + ⋯ + ξ_i^{k-1})`, from
Tau Ceti's `MvPolynomial.IsSymmetric.exists_aeval_esymm` (the symmetry proof is left as
`sorry`; helper). -/
noncomputable def bottPoly (k p : ℕ) : MvPolynomial (Fin p) ℤ :=
  Classical.choose (MvPolynomial.IsSymmetric.exists_aeval_esymm (p := bottProduct k p) (by sorry))

variable {K : Type*} [CommRing K] [LambdaRing K]

/-- **The Bott cannibalistic class** `θ^k(N) = Θ_k(λ^1 N, …, λ^p N)` of an element `N` of rank `p`
(`S.6/bott-cannibalistic-class`). -/
noncomputable def bott (k p : ℕ) (N : K) : K :=
  aeval (fun j : Fin p => lambda ((j : ℕ) + 1) N) (bottPoly k p)

/-- `θ^k(N + N') = θ^k(N) θ^k(N')` for `N`, `N'` of ranks `p`, `p'`. -/
@[simp]
theorem bott_add (k p p' : ℕ) (N N' : K) (hN : ∀ j, p < j → lambda j N = 0)
    (hN' : ∀ j, p' < j → lambda j N' = 0) :
    bott k (p + p') (N + N') = bott k p N * bott k p' N' := by
  sorry

/-- `θ^k(L) = 1 + L + ⋯ + L^{k-1}` for a line element `L`. -/
@[simp]
theorem bott_line (k : ℕ) (L : K) (hL : ∀ j, 2 ≤ j → lambda j L = 0) :
    bott k 1 L = ∑ i ∈ Finset.range k, L ^ i := by
  sorry

/-- `θ^{kk'}(N) = ψ^k(θ^{k'}(N)) θ^k(N)`. -/
theorem bott_mul_index (k k' p : ℕ) (hk : 1 ≤ k) (hk' : 1 ≤ k') (N : K)
    (hN : ∀ j, p < j → lambda j N = 0) :
    bott (k * k') p N = adams k (bott k' p N) * bott k p N := by
  sorry

variable {H : Type*} [CommRing H] [BinomialRing H]

/-- `ε(θ^k(N)) = k^p` for `N` of rank `p` (`ε(N) = p`), and `θ^k(N) - k^p ∈ F^1_γ`. -/
@[simp]
theorem augmentation_bott (A : Augmented K H) (k p : ℕ) (N : K)
    (hN : ∀ j, p < j → lambda j N = 0) (hεN : A.ε N = p) :
    A.ε (bott k p N) = (k : H) ^ p ∧ bott k p N - (k : K) ^ p ∈ gammaFiltration A 1 := by
  sorry

/-- λ-homomorphisms commute with `θ^k`. -/
theorem bott_map {L : Type*} [CommRing L] [LambdaRing L] (f : Hom K L) (k p : ℕ) (N : K) :
    f.toRingHom (bott k p N) = bott k p (f.toRingHom N) := by
  sorry

/-- **The exponential extension** `θ^k : K → (K[1/k])ˣ` (`S.6/bott-cannibalistic-class`), for an
augmented λ-ring whose augmentation ideal is nil and whose elements are differences of elements
of finite rank (as `K_0` of a connected quasi-compact scheme of finite dimension): `N ↦ θ^k(N)` on
elements of rank `p` and `θ^k(-N) = θ^k(N)⁻¹` (data left as `sorry`). The packet states the
extension on all of `K_0`; without the nil hypothesis `θ^k(N)` need not be a unit of `K[1/k]`. -/
noncomputable def bottExp (A : Augmented K H) (hnil : ∀ x ∈ RingHom.ker A.ε, IsNilpotent x)
    (hfin : ∀ x : K, ∃ (N N' : K) (p p' : ℕ), x = N - N' ∧ (∀ j, p < j → lambda j N = 0) ∧
      ∀ j, p' < j → lambda j N' = 0) (k : ℕ) (hk : 1 ≤ k) :
    K →+ Additive (Localization.Away (k : K))ˣ :=
  sorry

-- test bott_one (degenerate)
example (k : ℕ) : bott k 1 (1 : K) = k ∧ bott k 0 (0 : K) = 1 := by
  sorry

-- test bott_trivial (computation)
example (k c : ℕ) (L : K) (hL : ∀ j, 2 ≤ j → lambda j L = 0) :
    bott k c (c : K) = (k : K) ^ c ∧ bott 3 1 L = 1 + L + L ^ 2 := by
  sorry

-- test bott_ne_adams (non-example)
/- In `ℤ[t^{±1}] = ℤ[ℤ]` (the λ-ring `TauCeti.LambdaRing.monoidAlgebra`), `θ^2(t) = 1 + t` while
`ψ^2(t) = t^2`. -/
example : bott 2 1 (AddMonoidAlgebra.single (1 : ℤ) (1 : ℤ)) ≠
    adams 2 (AddMonoidAlgebra.single (1 : ℤ) (1 : ℤ)) := by
  sorry

-- test bott_augmentation (characterisation)
example (A : Augmented K H) (k p : ℕ) (hk : 1 ≤ k) (N : K) (hN : ∀ j, p < j → lambda j N = 0)
    (hεN : A.ε N = p) (hnil : ∀ x ∈ RingHom.ker A.ε, IsNilpotent x)
    (hι : ∀ h : H, A.ι h = 0 → h = 0) (hH : ∀ h : H, h ≠ 0 → ¬ IsNilpotent h) :
    A.ε (bott k p N) = (k : H) ^ p ∧
      IsUnit (algebraMap K (Localization.Away (k : K)) (bott k p N)) := by
  sorry

end Bott

section Twisted

variable {R : Type*} [CommRing R] [LambdaRing R]

/-- `λ_{-1}(N) = Σ_{j=0}^{p} (-1)^j λ^j(N)` for `N` of rank `p` (helper). -/
def lambdaNegOne (p : ℕ) (N : R) : R :=
  ∑ j ∈ Finset.range (p + 1), (-1) ^ j * lambda j N

variable (R) in
/-- **Grothendieck's twisted λ-ring** `R_N` (`S.6/twisted-lambda-ring`): the group `ℤ × R` with unit
`(1, 0)` and product `(n, x)(m, y) = (nm, n y + m x + x y λ_{-1}(N))`, for `N` of rank `p`. -/
def twisted (_N : R) (_p : ℕ) : Type _ := ℤ × R

namespace twisted

variable {N : R} {p : ℕ}

instance : AddCommGroup (twisted R N p) := inferInstanceAs (AddCommGroup (ℤ × R))

/-- The pair `(n, x)` in `R_N` (helper). -/
def ofPair (n : ℤ) (x : R) : twisted R N p := (n, x)

/-- The `ℤ`-component (helper). -/
def fst (a : twisted R N p) : ℤ := Prod.fst (α := ℤ) (β := R) a

/-- The `R`-component (helper). -/
def snd (a : twisted R N p) : R := Prod.snd (α := ℤ) (β := R) a

/-- The ring structure of `R_N`: the product is real data, the axioms are left as `sorry`. -/
noncomputable instance commRing : CommRing (twisted R N p) :=
  { (inferInstance : AddCommGroup (twisted R N p)) with
    mul := fun a b => ofPair (fst a * fst b)
      (fst a • snd b + fst b • snd a + snd a * snd b * lambdaNegOne p N)
    one := ofPair 1 0
    mul_assoc := sorry
    one_mul := sorry
    mul_one := sorry
    left_distrib := sorry
    right_distrib := sorry
    zero_mul := sorry
    mul_zero := sorry
    mul_comm := sorry }

/-- **`R_N` is a special λ-ring** for `N` of rank `p`, by Grothendieck's universal formulas (data
left as `sorry`). -/
noncomputable instance lambdaRing [Fact (∀ j, p < j → lambda j N = 0)] :
    LambdaRing (twisted R N p) :=
  sorry

end twisted

open twisted

/-- **The twisted operation** `τ(N, x)`, the `R`-component of `τ(0, x)` in `R_N`, for a natural
operation `τ` given as a λ-expression in one variable. -/
noncomputable def twistedOp (N : R) (p : ℕ) [Fact (∀ j, p < j → lambda j N = 0)]
    (τ : LambdaExpr 1) (x : R) : R :=
  snd (τ.eval (fun _ => (ofPair 0 x : twisted R N p)))

/-- `λ^k(N, x) λ_{-1}(N) = λ^k(x λ_{-1}(N))`, and the same for `γ^k`. -/
theorem twistedLambda_mul (N : R) (p : ℕ) [Fact (∀ j, p < j → lambda j N = 0)] (k : ℕ)
    (x : R) :
    twistedOp N p (.lam k (.var 0)) x * lambdaNegOne p N = lambda k (x * lambdaNegOne p N) ∧
      twistedOp N p (.lam k (.add (.var 0) (.const ((k - 1 : ℕ) : ℤ)))) x * lambdaNegOne p N =
        gamma k (x * lambdaNegOne p N) := by
  sorry

/-- The map `R_N → R'_{f(N)}`, `(n, x) ↦ (n, f x)` (helper). -/
def twistedMap {R' : Type*} [CommRing R'] [LambdaRing R'] (f : Hom R R') (N : R) (p : ℕ) :
    twisted R N p → twisted R' (f.toRingHom N) p :=
  fun a => ofPair (fst a) (f.toRingHom (snd a))

/-- A λ-homomorphism `f : R → R'` induces a λ-homomorphism `R_N → R'_{f(N)}`. -/
theorem twisted_map {R' : Type*} [CommRing R'] [LambdaRing R'] (f : Hom R R') (N : R) (p : ℕ)
    [Fact (∀ j, p < j → lambda j N = 0)] [Fact (∀ j, p < j → lambda j (f.toRingHom N) = 0)]
    (a b : twisted R N p) (k : ℕ) :
    twistedMap f N p (a * b) = twistedMap f N p a * twistedMap f N p b ∧
      twistedMap f N p 1 = 1 ∧ twistedMap f N p (lambda k a) = lambda k (twistedMap f N p a) := by
  sorry

-- test twisted_unit (degenerate)
example (N : R) (p : ℕ) (n m : ℤ) (y : R) :
    (1 : twisted R N p) = ofPair 1 0 ∧
      (ofPair n 0 : twisted R N p) * ofPair m y = ofPair (n * m) (n • y) := by
  sorry

-- test twisted_trivial_rank_one (computation)
example (x y : R) :
    lambdaNegOne 1 (1 : R) = 0 ∧ (ofPair 0 x : twisted R 1 1) * ofPair 0 y = 0 := by
  sorry

-- test twisted_lambda_one (computation)
example (N : R) (p : ℕ) [Fact (∀ j, p < j → lambda j N = 0)] (k : ℕ) (hk : 1 ≤ k) (x : R) :
    twistedOp N p (.lam 1 (.var 0)) x = x ∧ twistedOp N p (.lam k (.var 0)) 0 = 0 := by
  sorry

-- test twisted_not_untwisted (non-example)
/- For `R = ℤ[ξ]` (`TauCeti.LambdaRing.mvPolynomialLambdaRing`) and `N = ξ` of rank one,
`1_N · 1 = 1 - ξ ≠ 1`: `(0, 1)` is not the unit of `R_N`. -/
example : snd ((ofPair 0 1 : twisted (MvPolynomial (Fin 1) ℤ) (X 0) 1) * ofPair 0 1) =
    1 - X 0 ∧ (ofPair 0 1 : twisted (MvPolynomial (Fin 1) ℤ) (X 0) 1) ≠ 1 := by
  sorry

/-- **Adams operations of the twisted λ-ring** (`S.6/twisted-adams-formula`): for `k ≥ 1`,
`ψ^k(N, x) = θ^k(N) ψ^k(x)`, where `ψ^k(N, x)` is the `R`-component of `ψ^k(0, x)` in `R_N`. The
negative `k` (with an involution) is not restated. -/
theorem twisted_adams_formula (N : R) (p : ℕ) [Fact (∀ j, p < j → lambda j N = 0)] (k : ℕ)
    (hk : 1 ≤ k) (x : R) :
    snd (adams k (ofPair 0 x : twisted R N p)) = bott k p N * adams k x := by
  sorry

end Twisted

end TauCeti.LambdaRing

/-! ### Riemann–Roch without denominators and weight shifts

`SchemeKTheoryOperations:S.6/riemann-roch-without-denominators`, `S.6/gysin-weight-shift`,
`S.6/finite-etale-transfer-adams`, `S.6/adams-on-coniveau`, `S.6/residue-weight-shift`: not stated
here; each needs the higher K-groups with supports `K^Z_m(Y)` with Soulé's operations and the
proper pushforward `j_*` on them (supplier: the simplicial-sheaf gap and
GeneralAlgebraicKTheory:K.2:plus for the operations, SchemeKTheoryOperations S.2's pushforward
nodes and SchemeAndStackFoundations:SF.5 for `j_*`; `S.6/adams-on-coniveau` also the S.4 coniveau
spectral sequences, which are comments above; `S.6/residue-weight-shift` also the S.3 DVR
boundary, a comment above). Their λ-ring input is `TauCeti.LambdaRing.twisted`,
`twisted_adams_formula` and `bott`. -/

/-! ## Stage S.7: the γ-filtration, Chern characters and Riemann–Roch

The γ-filtration of a scheme is the S.6 γ-filtration of the augmented λ-ring `K_0(Vect X)`
(`Scheme.K0Vect`), augmented by the rank to `H^0(X, ℤ)` (`LocallyConstant X ℤ`). Chow groups
`CH^*(X)`, Chern classes and Todd classes are SchemeAndStackFoundations SF.5's and are not in
either library, so the Chern character into `CH^*(X)_ℚ` and every Riemann–Roch statement are
comments; the γ-Chern character into `gr_γ ⊗ ℚ` is defined for any augmented λ-ring. -/

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme TauCeti.PreLambdaRing
open TauCeti.LambdaRing (adams Augmented)
open scoped TensorProduct

/-! ### `SchemeKTheoryOperations:S.7/scheme-gamma-filtration`,
`SchemeKTheoryOperations:S.7/gamma-first-graded-pieces`, `S.7/gamma-in-coniveau`,
`S.7/cycle-class-to-graded-k0` -/

section SchemeGamma

/-- `H^0(X, ℤ)` is a binomial ring, with `C(f, n) = C(f(-), n)` pointwise (helper instance; the
proofs are left as `sorry`). -/
noncomputable instance locallyConstantInt_binomialRing (T : Type*) [TopologicalSpace T] :
    BinomialRing (LocallyConstant T ℤ) where
  toIsAddTorsionFree := sorry
  multichoose f n := f.map (fun m => Ring.multichoose m n)
  factorial_nsmul_multichoose := sorry

/-- The rank augmentation of `K_0(Vect X)` (helper; data left as `sorry`): `ε` is the rank
`K_0(Vect X) → H^0(X, ℤ)` and `ι` sends a locally constant `n` to `Σ n_U [𝒪_U]` over the finitely
many open-closed pieces `U` of a quasi-compact `X`. -/
noncomputable def rankAugmentation (X : Scheme.{u}) [CompactSpace X] :
    Augmented (Scheme.K0Vect X) (LocallyConstant X ℤ) :=
  sorry

/-- **The γ-filtration of a scheme** `F^i_γ K_0(X)` (`S.7/scheme-gamma-filtration`): the
γ-filtration of the augmented special λ-ring `K_0(Vect X)`, an ideal of `K_0(Vect X)`. -/
def gammaFiltration (X : Scheme.{u}) [CompactSpace X] (i : ℕ) : _root_.Ideal (Scheme.K0Vect X) :=
  TauCeti.LambdaRing.gammaFiltration (rankAugmentation X) i

/-- `F^i F^j ⊆ F^{i+j}`, `F^{i+1} ⊆ F^i`, `F^0 = K_0` and `F^1 = ker(rank)`. -/
theorem gammaFiltration_mul (X : Scheme.{u}) [CompactSpace X] (i j : ℕ) :
    gammaFiltration X i * gammaFiltration X j ≤ gammaFiltration X (i + j) ∧
      gammaFiltration X (i + 1) ≤ gammaFiltration X i ∧ gammaFiltration X 0 = ⊤ ∧
      gammaFiltration X 1 = RingHom.ker (rankAugmentation X).ε := by
  sorry

/-- Pullback `f^* : K_0(Vect Y) → K_0(Vect X)`, `[V] ↦ [f^* V]` (helper; data left as `sorry`:
`TauCeti.ExactK0.map` of Mathlib's `Scheme.Modules.pullback f` on vector bundles, which is exact
since short exact sequences of vector bundles are locally split). -/
noncomputable def Scheme.K0Vect.pullback {X Y : Scheme.{u}} (f : X ⟶ Y) :
    Scheme.K0Vect Y →+* Scheme.K0Vect X :=
  sorry

/-- `f^*(F^i_γ K_0(Y)) ⊆ F^i_γ K_0(X)`. -/
theorem gammaFiltration_pullback {X Y : Scheme.{u}} [CompactSpace X] [CompactSpace Y] (f : X ⟶ Y)
    (i : ℕ) : (gammaFiltration Y i).map (Scheme.K0Vect.pullback f) ≤ gammaFiltration X i := by
  sorry

-- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_affine`: not stated here; needs
-- KTheoryLowDegrees Z.3's `gammaFiltration` on `K_0(A)` (supplier:
-- KTheoryLowDegrees:Z.3/gamma-filtration; the comparison would run through
-- `Scheme.K0VectSpecEquiv`).

/-- **The γ-graded pieces** `gr^i_γ K_0(X) = F^i_γ / F^{i+1}_γ` (their graded `H^0(X, ℤ)`-algebra
structure is not formed here). -/
abbrev gammaGraded (X : Scheme.{u}) [CompactSpace X] (i : ℕ) : Type _ :=
  TauCeti.LambdaRing.gammaGraded (rankAugmentation X) i

/-- `F^1_γ / F^2_γ ≅ Pic(X)` (Tau Ceti's `LineBundleClass X`, a commutative monoid under `⊗`),
`[L] - 1 ↤ L`. The part `F^2_γ = SK_0(X) = ker(rank, det)` needs the determinant
`K_0(Vect X) → Pic(X)`, hence exterior powers of `𝒪_X`-modules, and is left out (supplier:
KTheoryLowDegrees:Z.3/determinant-hom for the affine case; exterior powers of sheaves of modules
are not planned in the packet). -/
theorem gammaFiltration_first (X : Scheme.{u}) [CompactSpace X] :
    ∃ e : Additive (LineBundleClass X) ≃+ gammaGraded X 1,
      ∀ (L : InvertibleSheaf X) (hL : vectorBundles X L.obj)
        (h : (TauCeti.ExactK0.of ⟨L.obj, hL⟩ : Scheme.K0Vect X) - 1 ∈ gammaFiltration X 1),
        e (Additive.ofMul (LineBundleClass.mk L)) = Submodule.Quotient.mk ⟨_, h⟩ := by
  sorry

-- test gammaFiltration_field (degenerate)
example (F : Type u) [Field F] : gammaFiltration (Spec (.of F)) 1 = ⊥ := by
  sorry

-- test gammaFiltration_P1 (computation): not stated here; needs the twisting sheaf `𝒪(-1)` on
-- `ℙ¹_k` as a vector bundle (supplier: AlgebraicModuliForArithmeticGeometry:R09.1; Mathlib's
-- `Proj` has no `𝒪(n)`, and `projectiveLine` above is only the scheme).
-- test gammaFiltration_P2 (computation): not stated here; needs `𝒪(-1)` on `ℙ²_k` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test gammaFiltration_affine_compat (compatibility): not stated here; needs KTheoryLowDegrees
-- Z.3's `gammaFiltration` on `K_0(A)` (supplier: KTheoryLowDegrees:Z.3/gamma-filtration).
-- test gammaFiltration_not_coniveau_integral (non-example): not stated here; needs the coniveau
-- filtration `F^p_cod K_0(X)` (supplier: SchemeKTheoryOperations:S.4/codimension-support-filtration
-- on `K_*`, a comment above) and Chow groups (supplier: SchemeAndStackFoundations:SF.5).

/-- **The first graded pieces of the γ-filtration** (`S.7/gamma-first-graded-pieces`): the rank
identifies `F^0_γ / F^1_γ` with `H^0(X, ℤ)` (it is onto with kernel `F^1_γ`), and
`F^1_γ / F^2_γ ≅ Pic(X)` (`gammaFiltration_first`). The determinant, `F^2_γ = SK_0(X)` and the
ring structure of `rank ⊕ det` are left out: they need exterior powers of `𝒪_X`-modules. -/
theorem gamma_first_graded_pieces (X : Scheme.{u}) [CompactSpace X] :
    Function.Surjective (rankAugmentation X).ε ∧
      RingHom.ker (rankAugmentation X).ε = gammaFiltration X 1 ∧
      Nonempty (Additive (LineBundleClass X) ≃+ gammaGraded X 1) := by
  sorry

/- `SchemeKTheoryOperations:S.7/gamma-in-coniveau`: not stated here; needs the coniveau filtration
`F^p_cod K_m(X)` and the higher K-groups `K_m(X)` (supplier: SchemeKTheoryOperations S.2's
`Scheme.K` and S.4's codimension filtration, comments above; SGA 6 X for (a), a gap).
`SchemeKTheoryOperations:S.7/cycle-class-to-graded-k0`: not stated here; needs `gr^p_cod G_0(X)`
(the image filtration of `G_0` of `codimFiltration X p`) and rational equivalence on Mathlib's
`AlgebraicGeometry.AlgebraicCycle` (supplier: SchemeKTheoryOperations:S.4/coniveau-chow-group,
SchemeAndStackFoundations:SF.5). -/

end SchemeGamma

/-! ### The Chern character into Chow groups

`SchemeKTheoryOperations:S.7/chern-character`, `S.7/chern-character-ring-homomorphism`,
`S.7/chern-character-adams`, `S.7/chern-class-of-subvariety`, `S.7/gamma-chow-comparison`. -/

-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter`: not stated here; needs `CH^*(X) ⊗ ℚ` and the
-- Chern classes `c_i : K_0(Vect X) → CH^i(X)` (supplier: SchemeAndStackFoundations:SF.5).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_line`: not stated here; needs `chernCharacter`
-- and `c_1` (supplier: SchemeAndStackFoundations:SF.5).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_add`: not stated here; needs `chernCharacter`
-- (supplier: SchemeAndStackFoundations:SF.5).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_mul`: not stated here; needs `chernCharacter`
-- and the ring `CH^*(X)` (supplier: SchemeAndStackFoundations:SF.5).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_pullback`: not stated here; needs `f^*` on
-- `CH^*` (supplier: SchemeAndStackFoundations:SF.5).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_degree_zero`: not stated here; needs
-- `chernCharacter` and `c_1(det)` (supplier: SchemeAndStackFoundations:SF.5).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_coherent`: not stated here; needs
-- `chernCharacter` (supplier: SchemeAndStackFoundations:SF.5); its Cartan input is
-- `cartan_isEquiv_of_regular` (S.2).
-- `TauCeti.AlgebraicGeometry.KTheory.chernCharacter_adams`: not stated here; needs `ch_n`
-- (supplier: SchemeAndStackFoundations:SF.5).
-- test chernCharacter_trivial (degenerate): not stated here; needs `chernCharacter` (supplier:
-- SchemeAndStackFoundations:SF.5).
-- test chernCharacter_P1 (computation): not stated here; needs `chernCharacter` and `𝒪(n)` on `ℙ¹`
-- (supplier: SchemeAndStackFoundations:SF.5, AlgebraicModuliForArithmeticGeometry:R09.1).
-- test chernCharacter_P2_point (computation): not stated here; needs `chernCharacter` on `ℙ²`
-- (supplier: the same).
-- test chernCharacter_not_total_chern (non-example): not stated here; needs `chernCharacter` and
-- the total Chern class (supplier: SchemeAndStackFoundations:SF.5).
-- test chernCharacter_gamma_compat (compatibility): not stated here; needs `ch_n` and `c_n`
-- (supplier: SchemeAndStackFoundations:SF.5); its γ-side is `gammaFiltration`.

/- `SchemeKTheoryOperations:S.7/chern-character-ring-homomorphism`, `S.7/chern-character-adams`,
`S.7/chern-class-of-subvariety`, `S.7/gamma-chow-comparison`: not stated here; each needs
`CH^*(X)_ℚ` with Chern classes (supplier: SchemeAndStackFoundations:SF.5;
`S.7/gamma-chow-comparison` (c) also the S.4 coniveau spectral sequence, a comment above). -/

/-! ### `SchemeKTheoryOperations:S.7/gamma-chern-character` -/

section GammaChern

variable {K : Type*} [CommRing K] [LambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]

/-- `N_i(γ^1(x - ε x), …, γ^i(x - ε x))`, the integral representative of `i! ch_i(x)` (helper). -/
noncomputable def gammaChernRep (A : Augmented K H) (i : ℕ) (x : K) : K :=
  MvPolynomial.aeval (fun j : Fin i => TauCeti.LambdaRing.gamma ((j : ℕ) + 1) (x - A.ι (A.ε x)))
    (TauCeti.LambdaRing.newtonPoly i)

/-- The representative lies in `F^i_γ` (helper). -/
theorem gammaChernRep_mem (A : Augmented K H) (i : ℕ) (x : K) :
    gammaChernRep A i x ∈ TauCeti.LambdaRing.gammaFiltration A i := by
  sorry

/-- `F^0_γ = K` (helper). -/
theorem mem_gammaFiltration_zero (A : Augmented K H) (x : K) :
    x ∈ TauCeti.LambdaRing.gammaFiltration A 0 := by
  sorry

/-- **The γ-Chern character** `ch = (ch_i)_i : K → Π_i gr^i_γ K ⊗ ℚ` (`S.7/gamma-chern-character`)
of an augmented λ-ring: `ch_0(x)` is the class of `x` in `gr^0_γ = K / F^1_γ ≅ H` (that is,
`ε(x)`), and `ch_i(x)` for `i > 0` is `(1/i!) N_i(γ^1(x - ε x), …, γ^i(x - ε x))` in `gr^i_γ ⊗ ℚ`.
For `K = K_0(Vect X)` this is the degree-zero case; `K_m(X)` for `m ≥ 1` needs higher K-theory. -/
noncomputable def gammaChern (A : Augmented K H) (x : K) :
    (i : ℕ) → ℚ ⊗[ℤ] TauCeti.LambdaRing.gammaGraded A i
  | 0 => (1 : ℚ) ⊗ₜ Submodule.Quotient.mk ⟨x, mem_gammaFiltration_zero A x⟩
  | i + 1 => (((i + 1).factorial : ℚ)⁻¹) ⊗ₜ
      Submodule.Quotient.mk ⟨gammaChernRep A (i + 1) x, gammaChernRep_mem A (i + 1) x⟩

/-- `ch` is additive. -/
@[simp]
theorem gammaChern_add (A : Augmented K H) (x y : K) :
    gammaChern A (x + y) = gammaChern A x + gammaChern A y := by
  sorry

-- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_mul`: not stated here; needs the graded ring
-- structure `gr^i_γ ⊗ gr^j_γ → gr^{i+j}_γ` on `Π_i gr^i_γ ⊗ ℚ` (supplier: this packet's
-- `S.6/gamma-filtration`, whose `gammaGraded` is formed here only as groups) and, for `K_*(X)`,
-- the products of S.6 (supplier: SchemeKTheoryOperations:S.6/graded-commutative-ring).

/-- `ch_i ∘ ψ^k = k^i ch_i` for `k ≥ 1`. -/
theorem gammaChern_adams (A : Augmented K H) (k : ℕ) (hk : 1 ≤ k) (x : K) (i : ℕ) :
    gammaChern A (adams k x) i = ((k : ℚ) ^ i) • gammaChern A x i := by
  sorry

/-- `ch ⊗ 1 : K_ℚ → Π_{i ≤ N} gr^i_γ K_ℚ` is bijective when `F^{N+1}_γ` is torsion (as for `K_0(X)`,
`X` regular noetherian of finite dimension, `S.6/scheme-gamma-bound`), stated without forming
`K_ℚ`: `ch(x) = 0` forces `x` to be torsion, and every family is `ch(x)/m`. The case of `K_m(X)`,
`m ≥ 1`, needs higher K-theory (supplier: GeneralAlgebraicKTheory:K.2:plus). -/
theorem gammaChern_bijective (A : Augmented K H) (N : ℕ)
    (hN : ∀ x ∈ TauCeti.LambdaRing.gammaFiltration A (N + 1), ∃ m : ℕ, 0 < m ∧ m • x = 0) :
    (∀ x : K, (∀ i ≤ N, gammaChern A x i = 0) → ∃ m : ℕ, 0 < m ∧ m • x = 0) ∧
      ∀ v : (i : ℕ) → ℚ ⊗[ℤ] TauCeti.LambdaRing.gammaGraded A i,
        ∃ (x : K) (m : ℕ), 0 < m ∧ ∀ i ≤ N, gammaChern A x i = (m : ℚ) • v i := by
  sorry

/-- `ch` commutes with augmented λ-homomorphisms `f`, on the integral representatives (the induced
map `gr(f) ⊗ ℚ` is not formed here; for schemes, `f^*` on `K_m` needs higher K-theory). -/
theorem gammaChern_pullback {L : Type*} [CommRing L] [LambdaRing L] (A : Augmented K H)
    (B : Augmented L H) (f : TauCeti.LambdaRing.Hom K L) (hε : ∀ x, B.ε (f.toRingHom x) = A.ε x)
    (hι : ∀ h, f.toRingHom (A.ι h) = B.ι h) (i : ℕ) (x : K) :
    f.toRingHom (gammaChernRep A i x) = gammaChernRep B i (f.toRingHom x) := by
  sorry

-- test gammaChern_zero (degenerate)
example (A : Augmented K H) :
    gammaChern A 0 = 0 ∧ ∀ x y : K, A.ε x = A.ε y → gammaChern A x 0 = gammaChern A y 0 := by
  sorry

-- test gammaChern_line (computation)
example (A : Augmented K H) (ℓ : K) (hℓ : ∀ j, 2 ≤ j → lambda j ℓ = 0) (hεℓ : A.ε ℓ = 1)
    (i : ℕ) (h : (ℓ - 1) ^ i ∈ TauCeti.LambdaRing.gammaFiltration A i) :
    gammaChern A ℓ i = ((i.factorial : ℚ)⁻¹) ⊗ₜ Submodule.Quotient.mk ⟨(ℓ - 1) ^ i, h⟩ := by
  sorry

-- test gammaChern_not_identity_integrally (non-example)
/- In `ℤ[t^{±1}]` (the λ-ring `TauCeti.LambdaRing.monoidAlgebra`, augmented by `t ↦ 1`), which
carries the part of `K_0(ℙ²)` generated by `[𝒪(-1)] = t^{-1}`: for `h = 1 - t^{-1}`,
`ch_2(h) = -h²/2` is not the image of an integral class of `gr^2_γ = ℤ h²`. (The packet states this
on `K_0(ℙ²)`, whose `𝒪(-1)` is not available: supplier AlgebraicModuliForArithmeticGeometry:R09.1.)
-/
example (A : Augmented (AddMonoidAlgebra ℤ ℤ) ℤ) (hA : A.ε (AddMonoidAlgebra.single 1 1) = 1) :
    ¬ ∃ y : TauCeti.LambdaRing.gammaGraded A 2,
      gammaChern A (1 - AddMonoidAlgebra.single (-1) 1) 2 = (1 : ℚ) ⊗ₜ y := by
  sorry

-- test gammaChern_chow_compat (compatibility): not stated here; needs `chernCharacter` and
-- `gr^i_γ K_0(X)_ℚ ≅ CH^i(X)_ℚ` (supplier: SchemeAndStackFoundations:SF.5).

end GammaChern

/-! ### Riemann–Roch

`SchemeKTheoryOperations:S.7/pushforward-euler-class`, `S.7/grothendieck-riemann-roch`,
`S.7/hirzebruch-riemann-roch`, `S.7/g-theory-adams-operations`, `S.7/adams-riemann-roch`,
`S.7/excess-tor-lemma`, `S.7/excess-intersection-formula`, `S.7/self-intersection-formula`,
`S.7/rational-point-self-intersection`. -/

-- `TauCeti.AlgebraicGeometry.KTheory.gAdams`: not stated here; needs `K'_m(X) = G_m(X)` and Soulé's
-- operations on `K^X_m(M)` (supplier: SchemeKTheoryOperations S.2's `Scheme.G` and S.6's
-- `lambdaOp`, comments above).
-- `TauCeti.AlgebraicGeometry.KTheory.gFiltration`: not stated here; needs `G_m(X) ⊗ ℚ` and the
-- γ-filtration of `K^X_m(M)` (supplier: the same).
-- `TauCeti.AlgebraicGeometry.KTheory.gRiemannRoch`: not stated here; needs `G_m(X)`, `gammaChern`
-- on `K^X_m(M)` and the Todd class in `gr_γ K_0(M)_ℚ` (supplier: the same).
-- `TauCeti.AlgebraicGeometry.KTheory.gAdams_graded`: not stated here; needs `gAdams` (supplier: the
-- same).
-- `TauCeti.AlgebraicGeometry.KTheory.gAdams_comp`: not stated here; needs `gAdams` (supplier: the
-- same).
-- `TauCeti.AlgebraicGeometry.KTheory.gAdams_embedding_indep`: not stated here; needs `gAdams`
-- (supplier: the same).
-- `TauCeti.AlgebraicGeometry.KTheory.gAdams_smooth`: not stated here; needs `gAdams` and Poincaré
-- duality `G_m(X) ≅ K_m(X)` (supplier: the same, SchemeKTheoryOperations:S.2/cartan-equivalence).
-- test gAdams_smooth (compatibility): not stated here; needs `gAdams` (supplier: the same).
-- test gAdams_point (degenerate): not stated here; needs `gAdams` (supplier: the same).
-- test gAdams_curve_point (computation): not stated here; needs `gAdams` on a curve (supplier: the
-- same).
-- test gAdams_not_psi (non-example): not stated here; needs `gAdams` on `ℙ¹` and `𝒪(-2)` (supplier:
-- the same, AlgebraicModuliForArithmeticGeometry:R09.1).

/- `SchemeKTheoryOperations:S.7/pushforward-euler-class`: not stated here; needs the proper
pushforward `f_* : G_0(X) → G_0(Y)` and the higher direct images `R^q f_*` (supplier:
SchemeKTheoryOperations S.2's pushforward nodes, comments above; Mathlib has no `R^q f_*`).
`SchemeKTheoryOperations:S.7/grothendieck-riemann-roch`, `S.7/hirzebruch-riemann-roch`: not stated
here; need `chernCharacter`, Todd classes and `f_*` on `CH^*` (supplier:
SchemeAndStackFoundations:SF.5; for (b) of the Hirzebruch node also JacobianChallenge layer B for
`H^0(X, 𝒪(D))` against Tau Ceti's `TauCeti.exists_isRiemannRochDivisor`).
`SchemeKTheoryOperations:S.7/adams-riemann-roch`: not stated here; needs `gAdams` and `f_*` on
`K_m` (supplier: as for `gAdams`).
`SchemeKTheoryOperations:S.7/excess-tor-lemma`: not stated here; needs the sheaves
`Tor_k^{𝒪_X}(𝒪_{X'}, 𝒪_Y)` and exterior powers of `𝒪_{Y'}`-modules (supplier:
SchemeKTheoryOperations:S.2/derived-pullback-perfect, S.2/derived-tor-independent-base-change;
Mathlib has no derived tensor product of `𝒪_X`-modules).
`SchemeKTheoryOperations:S.7/excess-intersection-formula`, `S.7/self-intersection-formula`,
`S.7/rational-point-self-intersection`: not stated here; need `K(Y on Z)`, `i_*` and `f^*` on
K-theory spectra (supplier: GeneralAlgebraicKTheory:K.4, through SchemeKTheoryOperations S.2's
pullback and pushforward nodes). -/

end TauCeti.AlgebraicGeometry.KTheory
