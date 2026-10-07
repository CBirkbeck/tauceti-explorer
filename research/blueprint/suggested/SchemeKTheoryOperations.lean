import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Free
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Category.ModuleCat.Sheaf.Quasicoherent
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.LinearAlgebra.Finsupp.Defs
import Mathlib.Algebra.Module.LinearMap.End
import Mathlib.RingTheory.Finiteness.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
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
import Mathlib.RingTheory.PowerSeries.Binomial
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.CategoryTheory.Monoidal.Subcategory
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
import Mathlib.RingTheory.Smooth.StandardSmooth
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
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.StandardComodule
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Monoidal
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Preadditive
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Product
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric
import TauCeti.CategoryTheory.GrothendieckGroup.Exact

/-!
# Suggested Lean forms for `SchemeKTheoryOperations` (stages S.1–S.7)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/SchemeKTheoryOperations.md` awaits the corrections listed by
REV-SchemeKTheoryOperations. The reviewed packet is the corrected contract for this file. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures; they claim
no implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

This pass did not compile the full file: no existing shared build has both library pins.
The planning worker reported an isolated Mathlib-only square-zero regression check at the
Mathlib pin, with only uses-of-sorry warnings. This independent review did not rerun that probe
and did not compile the full file; the retained Tau Ceti signatures remain unelaborated.

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
* **λ-rings are special λ-rings** (Grothendieck's λ-anneaux): KTheoryLowDegrees Z.3's
  `TauCeti.LambdaRing` (Z.3/special-lambda-ring), over the pre-λ `TauCeti.PreLambdaRing`
  (Z.3/pre-lambda-ring), and the **Adams operations are Z.3's, defined by the Newton formula**
  `ψ^k = N_k(λ^1, …, λ^k)` (`TauCeti.LambdaRing.adams`, Z.3/adams-operations).
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
  `MvPolynomial.IsSymmetric.exists_aeval_esymm`; in the block repeated from Z.3,
  `TauCeti.GeneralLinear.coordinateHopfAlgebra`, `TauCeti.FGComoduleCat` with its monoidal
  structure and `ExactK0.BiadditiveInvariant.bilift`.
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
  `LaurentPolynomial`, `Ring.choose`, `BinomialRing`, `PowerSeries` (with `subst` and
  `binomialSeries`), `MvPolynomial.esymm`,
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

The abstract λ-ring algebra (universal polynomials, pre-λ- and special λ-rings, binomial and monoid
λ-rings, γ-operations, augmentations and the γ-filtration, Adams operations, the identity principle)
and the representation rings `R_k(∏ GL_{N_i})` with Serre's theorem are KTheoryLowDegrees Z.3's.
They are repeated from `KTheoryLowDegrees--Z.3.lean` in two blocks headed "Repeated from
`KTheoryLowDegrees--Z.3.lean`", under Z.3's names, with Z.3's docstrings (which cite the Z.3 node
ids) and without Z.3's unit tests, so that this prototype elaborates on its own; they are not nodes
of this packet.
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
TT 2.2.2; compare the locally restricted Stacks 08C4 convention): `E^i = 0` outside a finite interval `[a, b]` (a *strict* bound,
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

/-- Finite locally free terms (Stacks 0BCJ): `E•` is strictly perfect iff it is strictly bounded and each `E^i` is,
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

/-- **Bounded-projective presentation of imported module perfection**
(`SchemeKTheoryOperations:S.1/perfect-module-complex`,
Stacks 0657): `K ∈ D(A)` is isomorphic in `D(A)` to a strictly bounded complex of finitely
generated projective `A`-modules (Tau Ceti's `finiteProjectiveModules`). `A` is arbitrary: no
noetherian, local or completeness hypothesis. This is the homotopy-category comparison prototype
for DGAInfinity layer5, transported from right Aᵒᵖ-modules to left A-modules. The module-level
notion and compact/thick/semi-free characterisations belong to that supplier. -/
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
essential image `D_QCoh(𝒪_X)`. For the noetherian unbounded comparison, the inclusion-derived functor is left adjoint to `RQ_X` (Stacks 09T4). -/

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
-- SchemeKTheoryOperations:S.5/scheme-nonconnective-agreement).
-- `Scheme.KB_affine`: not stated here; needs Bass's negative K-groups (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- `Scheme.KB_neg_eq_zero_of_regular`: not stated here; needs `π_n 𝕂(X)`, `n < 0`
-- (supplier: SchemeKTheoryOperations:S.2/negative-g-theory-vanishing and Cartan comparison).
-- test KB_zero_spec (computation): not stated here; needs `π₀ 𝕂(Spec A)` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test KB_empty (degenerate): not stated here; needs `𝕂(∅)` (supplier:
-- GeneralAlgebraicKTheory:K.6).
-- test KB_neg_regular_zero (compatibility): not stated here; needs `π_{-1} 𝕂(Spec ℤ)`
-- (supplier: SchemeKTheoryOperations:S.2/negative-g-theory-vanishing).
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
Grothendieck's coherence theorem (supplier: StableReduction layer2). The Noetherian proper-support
bridge and arbitrary-base projective ambient descent are different nodes in this packet.
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
-- GeneralAlgebraicKTheory:K.4 and StableReduction layer2 for `R^i f_*`).
-- `Scheme.G.pushforward_class`: not stated here; needs `R^i f_*` of coherent sheaves (supplier:
-- StableReduction layer2, with the S.2 proper-support bridge).
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
theorem cohSupport.pushforward [IsLocallyNoetherian X] {Y : Scheme.{u}} (i : Y ⟶ X) [IsClosedImmersion i]
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
Nisnevich covering families; the small site `X_Nis` has a finitely presented étale basis.
This big-site presentation allows arbitrary étale generators; the small basis comparison uses
finite-presentation refinements, not an assertion that every étale map is globally finitely presented. -/
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
V.9.6.2): for `R` smooth of constant relative dimension `r ≥ 1` over a field `k`, `t ∈ R` regular and `S` a finite set of
primes, there are `x_1, …, x_{r-1} ∈ R` algebraically independent over `k` such that, with
`B = k[x_1, …, x_{r-1}] ⊆ R`, `R ⧸ tR` is finite over `B` and `R` is smooth over `B` at the points
of `S` (smooth on a basic open neighbourhood of each). -/
theorem quillen_presentation_lemma (k R : Type u) [Field k] [CommRing R] [Algebra k R]
    [Algebra.Smooth k R] (r : ℕ) (hr : ringKrullDim R = r) (hrpos : 1 ≤ r)
    (hrel : ∀ 𝔭 : PrimeSpectrum R, ∃ g ∉ 𝔭.asIdeal,
      Algebra.IsStandardSmoothOfRelativeDimension r k (Localization.Away g)) (t : R) (ht : IsSMulRegular R t)
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

**λ-rings are special λ-rings (pinned):** "λ-ring" without qualification means special λ-ring
(KTheoryLowDegrees Z.3/special-lambda-ring); the first two axioms alone define a pre-λ-ring
(Z.3/pre-lambda-ring, the K-book's "λ-ring"). **Adams operations are defined by the Newton
formula** `ψ^k = Σ_{i<k} (-1)^{i-1} λ^i ψ^{k-i} + (-1)^{k-1} k λ^k` (Z.3/adams-operations,
`ψ² = x² - 2λ²`). The abstract λ-ring algebra and the rings `R_ℤ(∏ GL_{N_i})` are KTheoryLowDegrees
Z.3's; they are repeated below, in two blocks labelled as such, so that this file elaborates on its
own. S.6's own λ-ring nodes are the non-unital λ-algebras and their γ-filtration, `ψ^k = k^n` on
`gr^n_γ`, the rational weight decomposition, `R_ℤ(GL)` with its specialness, `R_A(G)`, the Bott
class and the twisted λ-ring. Products of K-theory spectra, higher λ-operations on `K_m`
(Quillen–Hiller, Soulé) and the sheaf-level constructions are comments. -/

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

/-! ### Repeated from `KTheoryLowDegrees--Z.3.lean`: the abstract λ-ring algebra

KTheoryLowDegrees Z.3's declarations (Z.3/pre-lambda-ring …), repeated here so that this prototype
elaborates on its own. They realise KTheoryLowDegrees Z.3/lambda-universal-polynomials,
Z.3/pre-lambda-ring, Z.3/binomial-lambda-ring, Z.3/special-lambda-ring, Z.3/binomial-special,
Z.3/gamma, Z.3/augmented-lambda-ring, Z.3/gamma-filtration, Z.3/adams-operations,
Z.3/adams-ring-endomorphism, Z.3/adams-composition, Z.3/adams-frobenius, Z.3/monoid-lambda-ring,
Z.3/lambda-identity-principle and their lemma nodes, under Z.3's names and with Z.3's docstrings;
Z.3's unit tests are not repeated. They are not nodes of `SchemeKTheoryOperations`, which cites them
(its restructure entry "The abstract λ-ring algebra is owned by KTheoryLowDegrees Z.3"). -/

/-! #### `KTheoryLowDegrees:Z.3/lambda-universal-polynomials` -/

namespace TauCeti.LambdaRing

open MvPolynomial

/-- Helper (not a packet name): the two-set identity defining `P_k` in `k + k` variables. -/
theorem exists_productPoly (k : ℕ) :
    ∃ P : MvPolynomial (Fin k ⊕ Fin k) ℤ,
      aeval (Sum.elim (fun i : Fin k => rename Sum.inl (esymm (Fin k) ℤ (i + 1)))
          (fun j : Fin k => rename Sum.inr (esymm (Fin k) ℤ (j + 1)))) P =
        aeval (fun p : Fin k × Fin k => (X (Sum.inl p.1) * X (Sum.inr p.2) :
          MvPolynomial (Fin k ⊕ Fin k) ℤ)) (esymm (Fin k × Fin k) ℤ k) := by
  sorry

/-- **Grothendieck's product polynomial** `P_k ∈ ℤ[a₁, …, a_k; b₁, …, b_k]`
(`KTheoryLowDegrees:Z.3/lambda-universal-polynomials`), with `a_i = X (inl (i - 1))` and
`b_j = X (inr (j - 1))`: the polynomial with `e_k((ξ_i η_j)) = P_k(e(ξ); e(η))`, chosen from
`exists_productPoly` (a real definition; only the existence proof is omitted). -/
noncomputable def productPoly (k : ℕ) : MvPolynomial (Fin k ⊕ Fin k) ℤ :=
  Classical.choose (exists_productPoly k)

/-- Helper (not a packet name): `e_k` of the `l`-fold products `ξ_{i₁} ⋯ ξ_{i_l}`,
`i₁ < ⋯ < i_l`, in `n` variables. -/
noncomputable def esymmOfProducts (n k l : ℕ) : MvPolynomial (Fin n) ℤ :=
  aeval (fun s : {s : Finset (Fin n) // s.card = l} => ∏ i ∈ s.1, (X i : MvPolynomial (Fin n) ℤ))
    (esymm {s : Finset (Fin n) // s.card = l} ℤ k)

/-- **Grothendieck's composition polynomial** `P_{k,l} ∈ ℤ[a₁, …, a_{kl}]`: the polynomial with
`P_{k,l}(e(ξ)) = e_k(ξ_{i₁} ⋯ ξ_{i_l})` in `kl` variables, from Tau Ceti's fundamental theorem
`MvPolynomial.IsSymmetric.exists_aeval_esymm` (the symmetry proof is omitted). -/
noncomputable def compPoly (k l : ℕ) : MvPolynomial (Fin (k * l)) ℤ :=
  Classical.choose (MvPolynomial.IsSymmetric.exists_aeval_esymm
    (p := esymmOfProducts (k * l) k l) (by sorry))

/-- **The Newton polynomial** `N_k` with `p_k = N_k(e₁, …, e_k)` (`MvPolynomial.psum`), from
`MvPolynomial.IsSymmetric.exists_aeval_esymm` and `MvPolynomial.psum_isSymmetric` (a real
definition with a complete proof). -/
noncomputable def newtonPoly (k : ℕ) : MvPolynomial (Fin k) ℤ :=
  Classical.choose (MvPolynomial.IsSymmetric.exists_aeval_esymm (psum_isSymmetric (Fin k) ℤ k))

/-- `e_k((ξ_i η_j)) = P_k(e(ξ); e(η))` in `ℤ[ξ₁, …, ξ_n, η₁, …, η_m]` for `n, m ≥ k`. -/
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

/-- Uniqueness of `P_k` (algebraic independence of `e₁, …, e_k`,
`MvPolynomial.esymmAlgHom_fin_injective`): a polynomial with the defining identity for some
`n, m ≥ k` is `P_k`. -/
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

end TauCeti.LambdaRing

/-! #### `KTheoryLowDegrees:Z.3/pre-lambda-ring` -/

namespace TauCeti

/-- **Pre-λ-rings** (`KTheoryLowDegrees:Z.3/pre-lambda-ring`; Weibel's and Atiyah's "λ-ring",
Grothendieck's "pré-λ-anneau"): a commutative ring with operations `λⁿ` such that `λ⁰ = 1`,
`λ¹ = id` and `λⁿ(x + y) = Σ_{i=0}^{n} λⁱ(x) λ^{n-i}(y)`. -/
class PreLambdaRing (K : Type*) [CommRing K] where
  /-- The operations `λⁿ`. -/
  lambda : ℕ → K → K
  /-- `λ⁰(x) = 1`. -/
  lambda_zero' : ∀ x, lambda 0 x = 1
  /-- `λ¹(x) = x`. -/
  lambda_one' : ∀ x, lambda 1 x = x
  /-- The sum formula. -/
  lambda_add' : ∀ n x y,
    lambda n (x + y) = ∑ i ∈ Finset.range (n + 1), lambda i x * lambda (n - i) y

namespace LambdaRing

open PreLambdaRing

variable {K : Type*} [CommRing K]

/-- Helper (not a packet name): a power series with constant coefficient `1` as a unit. -/
noncomputable def unitOfConstOne (f : PowerSeries K) (hf : PowerSeries.constantCoeff f = 1) :
    (PowerSeries K)ˣ where
  val := f
  inv := PowerSeries.invOfUnit f 1
  val_inv := PowerSeries.mul_invOfUnit f 1 (by simpa using hf)
  inv_val := by rw [mul_comm]; exact PowerSeries.mul_invOfUnit f 1 (by simpa using hf)

/-- **`λ_t`** (`TauCeti.LambdaRing.lambdaTotal`, KTheoryLowDegrees:Z.3/pre-lambda-ring):
`x ↦ Σ λⁿ(x) tⁿ`, an additive-to-multiplicative homomorphism `K → 1 + tK[[t]]` (a real definition;
additivity is the sum formula). -/
noncomputable def lambdaTotal [PreLambdaRing K] : K →+ Additive (PowerSeries K)ˣ where
  toFun x := Additive.ofMul (unitOfConstOne (PowerSeries.mk fun n => lambda n x)
    (by simp [PreLambdaRing.lambda_zero']))
  map_zero' := by sorry
  map_add' := by sorry

/-- `λⁿ(x + y) = Σ_{i+j=n} λⁱ(x) λʲ(y)`. -/
@[simp]
theorem lambda_add [PreLambdaRing K] (n : ℕ) (x y : K) :
    lambda n (x + y) = ∑ p ∈ Finset.antidiagonal n, lambda p.1 x * lambda p.2 y := by
  sorry

/-- `λ⁰(x) = 1`. -/
@[simp]
theorem lambda_zero_eq_one [PreLambdaRing K] (x : K) : lambda 0 x = 1 :=
  PreLambdaRing.lambda_zero' x

/-- `λ¹(x) = x`. -/
@[simp]
theorem lambda_one_eq_id [PreLambdaRing K] (x : K) : lambda 1 x = x :=
  PreLambdaRing.lambda_one' x

/-- `KTheoryLowDegrees:Z.3/lambda-zero-class`: `λⁿ(0) = 0` for `n > 0`, i.e. `λ_t(0) = 1`, in every
pre-λ-ring (in particular in `K₀(R)`). -/
@[simp]
theorem lambda_of_zero [PreLambdaRing K] (n : ℕ) (hn : 0 < n) : lambda n (0 : K) = 0 := by
  sorry

/-- `λ_t(-x) = λ_t(x)⁻¹` (the series form of `KTheoryLowDegrees:Z.3/lambda-neg-recursion`). -/
@[simp]
theorem lambdaTotal_neg [PreLambdaRing K] (x : K) :
    Additive.toMul (lambdaTotal (-x)) = (Additive.toMul (lambdaTotal x))⁻¹ := by
  sorry

/-- `KTheoryLowDegrees:Z.3/lambda-neg-recursion`: for `n > 0`,
`λⁿ(-x) = -Σ_{i=0}^{n-1} λ^{n-i}(x) λⁱ(-x)`; the recursion is integral. -/
theorem lambda_neg_recursion [PreLambdaRing K] (n : ℕ) (hn : 0 < n) (x : K) :
    lambda n (-x) = -∑ i ∈ Finset.range n, lambda (n - i) x * lambda i (-x) := by
  sorry

/-- **λ-ideals** (`TauCeti.LambdaRing.IsLambdaIdeal`, KTheoryLowDegrees:Z.3/pre-lambda-ring): ideals
with `λⁿ(I) ⊆ I` for `n ≥ 1`. The kernel of a pre-λ-ring homomorphism is one
(`PreLambdaRing.Hom.isLambdaIdeal_ker`). -/
class IsLambdaIdeal [PreLambdaRing K] (I : Ideal K) : Prop where
  /-- `λⁿ(I) ⊆ I` for `n ≥ 1`. -/
  lambda_mem : ∀ n, 1 ≤ n → ∀ x ∈ I, lambda n x ∈ I

/-- **Line elements** (`TauCeti.LambdaRing.IsLineElement`, KTheoryLowDegrees:Z.3/pre-lambda-ring):
`λⁿ(ℓ) = 0` for `n ≥ 2`, so that `λ_t(ℓ) = 1 + ℓt`. -/
def IsLineElement [PreLambdaRing K] (ℓ : K) : Prop :=
  ∀ n, 2 ≤ n → lambda n ℓ = 0

/-- A line element has `λ_t(ℓ) = 1 + ℓt`. -/
theorem IsLineElement.lambdaTotal [PreLambdaRing K] {ℓ : K} (h : IsLineElement ℓ) :
    ((Additive.toMul (lambdaTotal ℓ) : (PowerSeries K)ˣ) : PowerSeries K) =
      1 + PowerSeries.C ℓ * PowerSeries.X := by
  sorry

end LambdaRing

namespace PreLambdaRing

open LambdaRing

variable {K : Type*} [CommRing K]

/-- **Pre-λ-rings from `λ_t`** (`TauCeti.PreLambdaRing.ofLambdaTotal`,
KTheoryLowDegrees:Z.3/pre-lambda-ring): an additive-to-multiplicative `λ_t : K → (K[[t]])ˣ` with
constant coefficient `1` and `t`-coefficient the identity is a pre-λ-ring structure,
`λⁿ = coeffₙ ∘ λ_t` (a real definition). -/
@[instance_reducible]
def ofLambdaTotal (L : K →+ Additive (PowerSeries K)ˣ)
    (h0 : ∀ x, PowerSeries.coeff 0 ((Additive.toMul (L x) : (PowerSeries K)ˣ) : PowerSeries K) = 1)
    (h1 : ∀ x,
      PowerSeries.coeff 1 ((Additive.toMul (L x) : (PowerSeries K)ˣ) : PowerSeries K) = x) :
    PreLambdaRing K where
  lambda n x := PowerSeries.coeff n ((Additive.toMul (L x) : (PowerSeries K)ˣ) : PowerSeries K)
  lambda_zero' := h0
  lambda_one' := h1
  lambda_add' := by sorry

/-- **Pre-λ-ring homomorphisms** (`TauCeti.PreLambdaRing.Hom`,
KTheoryLowDegrees:Z.3/pre-lambda-ring): ring homomorphisms commuting with every `λⁿ`. -/
structure Hom (K L : Type*) [CommRing K] [PreLambdaRing K] [CommRing L] [PreLambdaRing L]
    extends K →+* L where
  /-- `f ∘ λⁿ = λⁿ ∘ f`. -/
  map_lambda' : ∀ n x, toRingHom (lambda n x) = lambda n (toRingHom x)

namespace Hom

/-- The identity pre-λ-homomorphism. -/
def id (K : Type*) [CommRing K] [PreLambdaRing K] : Hom K K :=
  { RingHom.id K with map_lambda' := fun _ _ => rfl }

/-- Composition of pre-λ-homomorphisms. -/
def comp {K L M : Type*} [CommRing K] [PreLambdaRing K] [CommRing L] [PreLambdaRing L]
    [CommRing M] [PreLambdaRing M] (g : Hom L M) (f : Hom K L) : Hom K M :=
  { g.toRingHom.comp f.toRingHom with
    map_lambda' := fun n x => by
      simp only [RingHom.comp_apply]
      rw [f.map_lambda', g.map_lambda'] }

/-- The kernel of a pre-λ-homomorphism is a λ-ideal. -/
theorem isLambdaIdeal_ker {K L : Type*} [CommRing K] [PreLambdaRing K] [CommRing L]
    [PreLambdaRing L] (f : Hom K L) : IsLambdaIdeal (RingHom.ker f.toRingHom) := by
  sorry

end Hom

end PreLambdaRing

namespace LambdaRing

open PreLambdaRing

variable {K : Type*} [CommRing K]

/-- **The quotient by a λ-ideal** (`TauCeti.LambdaRing.quotient`,
KTheoryLowDegrees:Z.3/pre-lambda-ring, pre-λ form): `K ⧸ I` with `λⁿ[x] = [λⁿ x]` (well defined
because `I` is a λ-ideal and by the sum formula). -/
noncomputable instance quotient [PreLambdaRing K] (I : Ideal K) [IsLambdaIdeal I] :
    PreLambdaRing (K ⧸ I) where
  lambda n := Quotient.lift (fun x : K => Ideal.Quotient.mk I (lambda n x)) (by sorry)
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry

/-- The projection `K → K ⧸ I` is a pre-λ-homomorphism. -/
theorem quotient_mk_lambda [PreLambdaRing K] (I : Ideal K) [IsLambdaIdeal I] (n : ℕ) (x : K) :
    Ideal.Quotient.mk I (lambda n x) = lambda n (Ideal.Quotient.mk I x) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/lambda-nat-cast`: if `1` is a line element (`λ_t(1) = 1 + t`), then
`λ^k(m · 1) = Ring.choose m k · 1` for every `m ∈ ℤ` (`C(m, k)` for `m ≥ 0` and
`(-1)^k C(|m| + k - 1, k)` for `m < 0`). -/
theorem lambda_intCast [PreLambdaRing K] (h1 : IsLineElement (1 : K)) (k : ℕ) (m : ℤ) :
    lambda k (m : K) = ((Ring.choose m k : ℤ) : K) := by
  sorry

/-- The same for `m ∈ ℕ`: `λ^k(m) = C(m, k)`, in particular `λ^k(m) = 0` for `k > m`. -/
theorem lambda_natCast_of_isLineElement [PreLambdaRing K] (h1 : IsLineElement (1 : K))
    (k m : ℕ) : lambda k (m : K) = (m.choose k : K) := by
  sorry

end LambdaRing

end TauCeti

namespace TauCeti.LambdaRing

open PreLambdaRing

variable {K : Type*} [CommRing K]

/-! #### `KTheoryLowDegrees:Z.3/binomial-lambda-ring` -/

section Binomial

/-- **Binomial rings as pre-λ-rings** (`TauCeti.LambdaRing.ofBinomialRing`,
KTheoryLowDegrees:Z.3/binomial-lambda-ring): `λ^k b = C(b, k)` (`Ring.choose`), so
`λ_t(b) = (1 + t)^b` (`PowerSeries.binomialSeries`); the sum formula is Chu–Vandermonde
(`Ring.add_choose_eq`). -/
instance ofBinomialRing (B : Type*) [CommRing B] [BinomialRing B] : PreLambdaRing B where
  lambda k b := Ring.choose b k
  lambda_zero' := Ring.choose_zero_right
  lambda_one' := Ring.choose_one_right
  lambda_add' := by sorry

variable {B : Type*} [CommRing B] [BinomialRing B]

/-- In a binomial ring, `λ^k b = Ring.choose b k`. -/
@[simp]
theorem lambda_eq_choose (k : ℕ) (b : B) : lambda k b = Ring.choose b k :=
  rfl

/-- `λ_t(b) = binomialSeries b`. -/
theorem lambdaTotal_eq_binomialSeries (b : B) :
    ((Additive.toMul (lambdaTotal b) : (PowerSeries B)ˣ) : PowerSeries B) =
      PowerSeries.binomialSeries B b := by
  sorry

/-- Helper instance (a true fact, proof omitted): `LocallyConstant X ℤ` is torsion-free. -/
instance locallyConstant_isAddTorsionFree (X : Type*) [TopologicalSpace X] :
    IsAddTorsionFree (LocallyConstant X ℤ) := by
  sorry

/-- Helper instance (not a packet name): `LocallyConstant X ℤ` is a binomial ring with the pointwise
`multichoose` (a real definition; the Pochhammer identity is pointwise). This is what makes
`H⁰(X, ℤ)` the binomial ring `H` of an augmentation. -/
noncomputable instance binomialRingLocallyConstant (X : Type*) [TopologicalSpace X] :
    BinomialRing (LocallyConstant X ℤ) where
  multichoose f n := f.map fun a => Ring.multichoose a n
  factorial_nsmul_multichoose := by sorry

/-- **The pointwise binomial pre-λ-ring** `H⁰(X, ℤ) = LocallyConstant X ℤ`
(`TauCeti.LambdaRing.locallyConstantInt`), `(λ^k f)(x) = C(f x, k)`; it is the structure
`ofBinomialRing` of the pointwise binomial ring. -/
noncomputable instance locallyConstantInt (X : Type*) [TopologicalSpace X] :
    PreLambdaRing (LocallyConstant X ℤ) :=
  ofBinomialRing (LocallyConstant X ℤ)

/-- `(λ^k f)(x) = Ring.choose (f x) k`. -/
@[simp]
theorem locallyConstant_lambda_apply {X : Type*} [TopologicalSpace X] (k : ℕ)
    (f : LocallyConstant X ℤ) (x : X) : (lambda k f) x = Ring.choose (f x) k := by
  sorry

/-- Comap along a continuous map is a pre-λ-ring homomorphism
(`TauCeti.LambdaRing.locallyConstant_comap`; a real definition over
`LocallyConstant.comapRingHom`). -/
noncomputable def locallyConstant_comap {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
    (g : C(X, Y)) : PreLambdaRing.Hom (LocallyConstant Y ℤ) (LocallyConstant X ℤ) where
  toRingHom := LocallyConstant.comapRingHom g
  map_lambda' := by sorry

/-- The canonical ring homomorphism `ℤ → K` is a pre-λ-homomorphism when `1` is a line element
(`KTheoryLowDegrees:Z.3/lambda-nat-cast`). -/
theorem intCast_isLambdaHom {K : Type*} [CommRing K] [PreLambdaRing K]
    (h1 : IsLineElement (1 : K)) (k : ℕ) (m : ℤ) :
    Int.castRingHom K (lambda k m) = lambda k (Int.castRingHom K m) := by
  sorry

end Binomial

/-! #### `KTheoryLowDegrees:Z.3/special-lambda-ring` -/

end TauCeti.LambdaRing

namespace TauCeti

open MvPolynomial

/-- **Special λ-rings** (`TauCeti.LambdaRing`, `KTheoryLowDegrees:Z.3/special-lambda-ring`;
Grothendieck's λ-anneau): a pre-λ-ring with `λ^k(1) = 0` for `k ≥ 2`,
`λ^k(xy) = P_k(λ^• x; λ^• y)` and `λ^k(λ^l x) = P_{k,l}(λ^• x)`. -/
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

/-- `λ^k(xy) = P_k(λ^• x; λ^• y)`. -/
theorem lambda_mul [LambdaRing K] (k : ℕ) (x y : K) :
    lambda k (x * y) =
      aeval (Sum.elim (fun i : Fin k => lambda (i + 1) x) (fun j : Fin k => lambda (j + 1) y))
        (productPoly k) :=
  LambdaRing.lambda_mul' k x y

/-- `λ^k(λ^l x) = P_{k,l}(λ^• x)`. -/
theorem lambda_lambda [LambdaRing K] (k l : ℕ) (x : K) :
    lambda k (lambda l x) = aeval (fun i : Fin (k * l) => lambda (i + 1) x) (compPoly k l) :=
  LambdaRing.lambda_lambda' k l x

/-- `λ^k(n) = C(n, k)` in a special λ-ring (`KTheoryLowDegrees:Z.3/lambda-nat-cast`). -/
@[simp]
theorem lambda_natCast [LambdaRing K] (k n : ℕ) : lambda k (n : K) = (n.choose k : K) :=
  lambda_natCast_of_isLineElement (fun k hk => LambdaRing.lambda_one_eq_zero' k hk) k n

/-- **Special λ-subrings** (`TauCeti.LambdaRing.ofSubring`,
KTheoryLowDegrees:Z.3/special-lambda-ring): a subring closed under the `λ^k` of a special λ-ring is
a special λ-ring (a real definition; the axioms are inherited). -/
@[instance_reducible]
def ofSubring {L : Type*} [CommRing L] [LambdaRing L] (S : Subring L)
    (hS : ∀ k x, x ∈ S → lambda k x ∈ S) : LambdaRing S where
  lambda k x := ⟨lambda k (x : L), hS k x x.2⟩
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry
  lambda_one_eq_zero' := by sorry
  lambda_mul' := by sorry
  lambda_lambda' := by sorry

/-- `TauCeti.LambdaRing.quotient` (special form): the quotient of a special λ-ring by a λ-ideal is
special. Z.3's packet gives this item the same name as the pre-λ instance `quotient` above; it is
stated here as `quotientSpecial`, extending that instance. -/
noncomputable instance quotientSpecial [LambdaRing K] (I : Ideal K) [IsLambdaIdeal I] :
    LambdaRing (K ⧸ I) :=
  { quotient I with
    lambda_one_eq_zero' := by sorry
    lambda_mul' := by sorry
    lambda_lambda' := by sorry }

/-- **`ℤ` with the binomial operations** (`TauCeti.LambdaRing.int`,
`KTheoryLowDegrees:Z.3/binomial-special`): a special λ-ring extending `ofBinomialRing ℤ`. -/
instance int : LambdaRing ℤ :=
  { ofBinomialRing ℤ with
    lambda_one_eq_zero' := by sorry
    lambda_mul' := by sorry
    lambda_lambda' := by sorry }

/-- `KTheoryLowDegrees:Z.3/binomial-special`: `LocallyConstant X ℤ` with the pointwise binomial
operations is a special λ-ring (extending `locallyConstantInt`). -/
noncomputable instance binomialSpecial (X : Type*) [TopologicalSpace X] :
    LambdaRing (LocallyConstant X ℤ) :=
  { locallyConstantInt X with
    lambda_one_eq_zero' := by sorry
    lambda_mul' := by sorry
    lambda_lambda' := by sorry }

/-! #### `KTheoryLowDegrees:Z.3/gamma` -/

section Gamma

variable [PreLambdaRing K]

/-- **The total γ-operation** (`TauCeti.LambdaRing.gammaTotal`, KTheoryLowDegrees:Z.3/gamma):
`γ_t(x) = λ_s(x)` with `s = t/(1 - t)` (Mathlib's `PowerSeries.subst`), an
additive-to-multiplicative homomorphism `K → 1 + tK[[t]]` (a real definition). -/
noncomputable def gammaTotal : K →+ Additive (PowerSeries K)ˣ where
  toFun x := Additive.ofMul (unitOfConstOne
    (PowerSeries.subst (PowerSeries.X * PowerSeries.invUnitsSub (1 : Kˣ))
      ((Additive.toMul (lambdaTotal x) : (PowerSeries K)ˣ) : PowerSeries K)) (by sorry))
  map_zero' := by sorry
  map_add' := by sorry

/-- **The γ-operations** (`TauCeti.LambdaRing.gamma`, KTheoryLowDegrees:Z.3/gamma):
`γⁿ(x) = coeffₙ(γ_t(x))`. -/
noncomputable def gamma (n : ℕ) (x : K) : K :=
  PowerSeries.coeff n ((Additive.toMul (gammaTotal x) : (PowerSeries K)ˣ) : PowerSeries K)

/-- `γ⁰(x) = 1`. -/
@[simp]
theorem gamma_zero (x : K) : gamma 0 x = 1 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-one`: `γ¹(x) = x`. -/
@[simp]
theorem gamma_one (x : K) : gamma 1 x = x := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-add`: `γⁿ(x + y) = Σ_{i=0}^{n} γⁱ(x) γ^{n-i}(y)`. -/
@[simp]
theorem gamma_add (n : ℕ) (x y : K) :
    gamma n (x + y) = ∑ i ∈ Finset.range (n + 1), gamma i x * gamma (n - i) y := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-series` (shifted form): if `λ^k(1) = 0` for `k ≥ 2`, then
`γⁿ(x) = λⁿ(x + n - 1)` for `n ≥ 1`. -/
theorem gamma_eq_lambda_add (h1 : IsLineElement (1 : K)) (n : ℕ) (hn : 1 ≤ n) (x : K) :
    gamma n x = lambda n (x + ((n - 1 : ℕ) : K)) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-series` (expanded form):
`γⁿ(x) = Σ_{j=1}^{n} C(n - 1, j - 1) λʲ(x)` for `n ≥ 1`. -/
theorem gamma_series (h1 : IsLineElement (1 : K)) (n : ℕ) (hn : 1 ≤ n) (x : K) :
    gamma n x = ∑ j ∈ Finset.Icc 1 n, ((n - 1).choose (j - 1) : K) * lambda j x := by
  sorry

/-- `γ²(x) = λ²(x) + x` when `λ²(1) = 0`. -/
theorem gamma_two (h2 : lambda 2 (1 : K) = 0) (x : K) : gamma 2 x = lambda 2 x + x := by
  sorry

/-- Pre-λ-ring homomorphisms commute with the γ-operations. -/
theorem gamma_map {L : Type*} [CommRing L] [PreLambdaRing L] (f : PreLambdaRing.Hom K L)
    (n : ℕ) (x : K) : f.toRingHom (gamma n x) = gamma n (f.toRingHom x) := by
  sorry

end Gamma

/-! #### `KTheoryLowDegrees:Z.3/augmented-lambda-ring` -/

/-- **Augmented pre-λ-rings** (`TauCeti.LambdaRing.Augmentation`,
KTheoryLowDegrees:Z.3/augmented-lambda-ring): a binomial ring `H` (with its pre-λ-structure
`ofBinomialRing`) and pre-λ-homomorphisms `ι : H → K`, `ε : K → H` with `ε ∘ ι = id` (parts 1) and
2) of Weibel's positive structure). -/
structure Augmentation (K : Type*) [CommRing K] [PreLambdaRing K] (H : Type*) [CommRing H]
    [BinomialRing H] where
  /-- The unit map `H → K` (`TauCeti.LambdaRing.Augmentation.ι`). -/
  ι : PreLambdaRing.Hom H K
  /-- The augmentation `K → H` (`TauCeti.LambdaRing.Augmentation.ε`). -/
  ε : PreLambdaRing.Hom K H
  /-- `ε ∘ ι = id`. -/
  ε_ι : ∀ h, ε.toRingHom (ι.toRingHom h) = h

section Augmented

variable [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]

/-- **The augmentation ideal** `ker ε` (`TauCeti.LambdaRing.augmentationIdeal`). -/
def augmentationIdeal (A : Augmentation K H) : Ideal K :=
  RingHom.ker A.ε.toRingHom

/-- `ker ε` is a λ-ideal. -/
instance augmentationIdeal_isLambdaIdeal (A : Augmentation K H) :
    IsLambdaIdeal (augmentationIdeal A) :=
  PreLambdaRing.Hom.isLambdaIdeal_ker A.ε

/-- `ε(λ^k x) = C(ε x, k)`. -/
@[simp]
theorem ε_lambda (A : Augmentation K H) (k : ℕ) (x : K) :
    A.ε.toRingHom (lambda k x) = Ring.choose (A.ε.toRingHom x) k :=
  A.ε.map_lambda' k x

/-- `x - ι(ε x) ∈ ker ε`. -/
theorem sub_ι_ε_mem (A : Augmentation K H) (x : K) :
    x - A.ι.toRingHom (A.ε.toRingHom x) ∈ augmentationIdeal A := by
  sorry

/-- **Morphisms of augmented pre-λ-rings** (`TauCeti.LambdaRing.Augmentation.Hom`,
KTheoryLowDegrees:Z.3/augmented-lambda-ring). -/
structure Augmentation.Hom {L : Type*} [CommRing L] [PreLambdaRing L] (A : Augmentation K H)
    (B : Augmentation L H) where
  /-- The underlying pre-λ-homomorphism. -/
  toHom : PreLambdaRing.Hom K L
  /-- Compatibility with the augmentations. -/
  ε_comp : ∀ x, B.ε.toRingHom (toHom.toRingHom x) = A.ε.toRingHom x
  /-- Compatibility with the unit maps. -/
  ι_comp : ∀ h, toHom.toRingHom (A.ι.toRingHom h) = B.ι.toRingHom h

/-- `ι(1)` is a line element, so `λ^k(1) = 0` in `K` for `k ≥ 2`. -/
theorem Augmentation.isLineElement_one (A : Augmentation K H) : IsLineElement (1 : K) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-rank-zero`: `γⁿ(ker ε) ⊆ ker ε` for `n ≥ 1`. -/
theorem gamma_mem_augmentationIdeal (A : Augmentation K H) {x : K}
    (hx : x ∈ augmentationIdeal A) (n : ℕ) (hn : 1 ≤ n) : gamma n x ∈ augmentationIdeal A := by
  sorry

end Augmented

/-! #### `KTheoryLowDegrees:Z.3/gamma-filtration` -/

section GammaFiltration

variable [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]

/-- **The γ-filtration** (`TauCeti.LambdaRing.gammaFiltration`,
KTheoryLowDegrees:Z.3/gamma-filtration): `F^n_γ K` is the ideal generated by the products
`γ^{k₁}(x₁) ⋯ γ^{k_m}(x_m)` with `x_j ∈ ker ε`, `k_j ≥ 1` and `Σ k_j ≥ n` (the weight is the sum of
the degrees; the empty product `1` has weight `0`). This is Weibel's ideal-generated form. -/
def gammaFiltration (A : Augmentation K H) (n : ℕ) : Ideal K :=
  Ideal.span {y | ∃ (m : ℕ) (k : Fin m → ℕ) (x : Fin m → K), (∀ i, 1 ≤ k i) ∧
    (∀ i, x i ∈ augmentationIdeal A) ∧ n ≤ ∑ i, k i ∧ y = ∏ i, gamma (k i) (x i)}

/-- `KTheoryLowDegrees:Z.3/gamma-filtration-generators`: a weighted product of weight `≥ n` lies in
`F^n_γ`. -/
theorem gamma_prod_mem_gammaFiltration (A : Augmentation K H) (n m : ℕ) (k : Fin m → ℕ)
    (x : Fin m → K) (hk : ∀ i, 1 ≤ k i) (hx : ∀ i, x i ∈ augmentationIdeal A)
    (hn : n ≤ ∑ i, k i) : (∏ i, gamma (k i) (x i)) ∈ gammaFiltration A n :=
  Ideal.subset_span ⟨m, k, x, hk, hx, hn, rfl⟩

/-- `KTheoryLowDegrees:Z.3/gamma-filtration-zero`: `F⁰_γ = K`. -/
@[simp]
theorem gammaFiltration_zero (A : Augmentation K H) : gammaFiltration A 0 = ⊤ := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-filtration-one`: `F¹_γ = ker ε` (and `F⁰/F¹ ≅ H` via `ε`). -/
theorem gammaFiltration_one (A : Augmentation K H) :
    gammaFiltration A 1 = augmentationIdeal A := by
  sorry

/-- `F^{n+1}_γ ≤ F^n_γ`. -/
theorem gammaFiltration_antitone (A : Augmentation K H) : Antitone (gammaFiltration A) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-filtration-mul`: `F^i_γ · F^j_γ ≤ F^{i+j}_γ`. -/
theorem gammaFiltration_mul (A : Augmentation K H) (i j : ℕ) :
    gammaFiltration A i * gammaFiltration A j ≤ gammaFiltration A (i + j) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-filtration-eq-span`: if `H` is additively generated by idempotents
`e` with `λ^k(ι(e) x) = ι(e) λ^k(x)` (for `H = ℤ` and for `K₀(R)`), then for `n ≥ 1` the ideal
`F^n_γ` is the additive subgroup generated by the weighted products (Soulé's form). -/
theorem gammaFiltration_eq_span (A : Augmentation K H)
    (hH : AddSubgroup.closure {e : H | IsIdempotentElem e ∧
      ∀ k, 1 ≤ k → ∀ x : K, lambda k (A.ι.toRingHom e * x) = A.ι.toRingHom e * lambda k x} = ⊤)
    (n : ℕ) (hn : 1 ≤ n) :
    ((gammaFiltration A n : Set K)) = AddSubgroup.closure
      {y | ∃ (m : ℕ) (k : Fin m → ℕ) (x : Fin m → K), 1 ≤ m ∧ (∀ i, 1 ≤ k i) ∧
        (∀ i, x i ∈ augmentationIdeal A) ∧ n ≤ ∑ i, k i ∧ y = ∏ i, gamma (k i) (x i)} := by
  sorry

/-- A morphism of augmented pre-λ-rings maps `F^n_γ` into `F^n_γ`. -/
theorem gammaFiltration_map {L : Type*} [CommRing L] [PreLambdaRing L] {A : Augmentation K H}
    {B : Augmentation L H} (f : Augmentation.Hom A B) (n : ℕ) :
    (gammaFiltration A n).map f.toHom.toRingHom ≤ gammaFiltration B n := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-vanishing-above-rank`: if `λʲ(p) = 0` for `j > n`, then
`γ^k(p - n) = 0` for `k > n` (`γ_t(p - n) = Σ_{j ≤ n} λʲ(p) tʲ (1 - t)^{n-j}`). -/
theorem gamma_sub_natCast_eq_zero (h1 : IsLineElement (1 : K)) (n : ℕ) (p : K)
    (hp : ∀ j, n < j → lambda j p = 0) (k : ℕ) (hk : n < k) :
    gamma k (p - (n : K)) = 0 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/gamma-top-sum`: if `λʲ(p) = 0` for `j > n`, then
`Σ_{i=0}^{n} γⁱ(p - n) = λⁿ(p)`. -/
theorem sum_gamma_sub_natCast_eq_lambda (h1 : IsLineElement (1 : K)) (n : ℕ) (p : K)
    (hp : ∀ j, n < j → lambda j p = 0) :
    ∑ i ∈ Finset.range (n + 1), gamma i (p - (n : K)) = lambda n p := by
  sorry

end GammaFiltration

/-! #### `KTheoryLowDegrees:Z.3/adams-operations` -/

section Adams

/-- **Adams operations** (`TauCeti.LambdaRing.adams`, KTheoryLowDegrees:Z.3/adams-operations) of a
pre-λ-ring, by the **Newton recursion**
`ψ^{k+1}(x) = Σ_{i=0}^{k-1} (-1)^i λ^{i+1}(x) ψ^{k-i}(x) + (-1)^k (k+1) λ^{k+1}(x)`, i.e.
`ψ^k = N_k(λ¹, …, λ^k)` (the Newton formula). `ψ⁰` is set to `0`; for an augmented ring Z.3's
`ψ⁰ = ι ∘ ε` is `adams_zero_aug`. -/
def adams [PreLambdaRing K] : ℕ → K → K
  | 0 => fun _ => 0
  | k + 1 => fun x => ∑ i : Fin k, (-1) ^ (i : ℕ) * lambda (i + 1) x * adams (k - i) x +
      (-1) ^ k * ((k + 1 : ℕ) : K) * lambda (k + 1) x
decreasing_by omega

/-- `ψ¹ = id`. -/
@[simp]
theorem adams_one [PreLambdaRing K] (x : K) : adams 1 x = x := by
  simp [adams]

/-- `ψ²(x) = x² - 2λ²(x)`. -/
@[simp]
theorem adams_two [PreLambdaRing K] (x : K) : adams 2 x = x ^ 2 - 2 * lambda 2 x := by
  sorry

/-- The Newton recursion
`ψ^k - λ¹ψ^{k-1} + ⋯ + (-1)^{k-1}λ^{k-1}ψ¹ + (-1)^k k λ^k = 0` for `k ≥ 1`. -/
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

/-- `KTheoryLowDegrees:Z.3/adams-add`: `ψ^k(x + y) = ψ^k(x) + ψ^k(y)` in every pre-λ-ring. -/
@[simp]
theorem adams_add [PreLambdaRing K] (k : ℕ) (x y : K) :
    adams k (x + y) = adams k x + adams k y := by
  sorry

/-- Pre-λ-homomorphisms commute with the Adams operations. -/
theorem adams_map [PreLambdaRing K] {L : Type*} [CommRing L] [PreLambdaRing L]
    (f : PreLambdaRing.Hom K L) (k : ℕ) (x : K) :
    f.toRingHom (adams k x) = adams k (f.toRingHom x) := by
  sorry

/-- `ψ⁰ := ι ∘ ε` for an augmented pre-λ-ring (`TauCeti.LambdaRing.adams_zero_aug`). -/
def adams_zero_aug [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]
    (A : Augmentation K H) : K → K :=
  fun x => A.ι.toRingHom (A.ε.toRingHom x)

/-- `KTheoryLowDegrees:Z.3/adams-line-element`: `ψ^k(ℓ) = ℓ^k` on line elements, and
`ψ^k(ℓ⁻¹) = ℓ^{-k}` when `ℓ` is a unit whose inverse is a line element. -/
theorem adams_of_isLineElement [PreLambdaRing K] {ℓ : K} (h : IsLineElement ℓ) (k : ℕ)
    (hk : 1 ≤ k) : adams k ℓ = ℓ ^ k := by
  sorry

theorem adams_inv_of_isLineElement [PreLambdaRing K] (ℓ : Kˣ) (h : IsLineElement (ℓ : K))
    (h' : IsLineElement ((ℓ⁻¹ : Kˣ) : K)) (k : ℕ) (hk : 1 ≤ k) :
    adams k ((ℓ⁻¹ : Kˣ) : K) = ((ℓ ^ k)⁻¹ : Kˣ) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/adams-square-zero`: if `λⁱ(x) λʲ(x) = 0` for all `i, j ≥ 1`, then
`ψ^k(x) = (-1)^{k-1} k λ^k(x)`; on a λ-ideal of square zero every `λ^k` (`k ≥ 1`) is additive. -/
theorem adams_eq_of_lambda_mul_lambda_eq_zero [PreLambdaRing K] (x : K)
    (hx : ∀ i j, 1 ≤ i → 1 ≤ j → lambda i x * lambda j x = 0) (k : ℕ) (hk : 1 ≤ k) :
    adams k x = (-1) ^ (k - 1) * (k : K) * lambda k x := by
  sorry

theorem lambda_add_of_sq_eq_bot [PreLambdaRing K] (I : Ideal K) [IsLambdaIdeal I]
    (hI : I * I = ⊥) (k : ℕ) (hk : 1 ≤ k) (x y : K) (hx : x ∈ I) (hy : y ∈ I) :
    lambda k (x + y) = lambda k x + lambda k y := by
  sorry

/-- `KTheoryLowDegrees:Z.3/adams-binomial`: in a binomial ring every `ψ^k` (`k ≥ 1`) is the
identity; hence `ψ^k ∘ ι = ι` and `ε ∘ ψ^k = ε` in an augmented pre-λ-ring. -/
theorem adams_binomial {B : Type*} [CommRing B] [BinomialRing B] (k : ℕ) (hk : 1 ≤ k) (b : B) :
    adams k b = b := by
  sorry

theorem adams_ι [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]
    (A : Augmentation K H) (k : ℕ) (hk : 1 ≤ k) (h : H) :
    adams k (A.ι.toRingHom h) = A.ι.toRingHom h ∧
      ∀ x, A.ε.toRingHom (adams k x) = A.ε.toRingHom x := by
  sorry

/-- `KTheoryLowDegrees:Z.3/adams-first-graded` (Weibel Proposition 4.9 for `n = 1`, sign of E3
corrected): for `x ∈ F¹_γ = ker ε` and `k ≥ 1`, modulo `F²_γ`:
`λ^k(x) ≡ (-1)^{k-1} x` and `ψ^k(x) ≡ k x`. -/
theorem lambda_adams_sub_mem_gammaFiltration_two [PreLambdaRing K] {H : Type*} [CommRing H]
    [BinomialRing H] (A : Augmentation K H) {x : K} (hx : x ∈ augmentationIdeal A) (k : ℕ)
    (hk : 1 ≤ k) :
    lambda k x - (-1) ^ (k - 1) * x ∈ gammaFiltration A 2 ∧
      adams k x - (k : K) * x ∈ gammaFiltration A 2 := by
  sorry

end Adams

/-! #### `KTheoryLowDegrees:Z.3/adams-ring-endomorphism`, `adams-composition`, `adams-frobenius` -/

/-- `KTheoryLowDegrees:Z.3/adams-ring-endomorphism`: in a special λ-ring every `ψ^k` (`k ≥ 1`) is a
ring endomorphism commuting with every `λ^l`. -/
theorem adams_isLambdaEndomorphism [LambdaRing K] (k : ℕ) (hk : 1 ≤ k) :
    adams k (1 : K) = 1 ∧ (∀ x y : K, adams k (x * y) = adams k x * adams k y) ∧
      ∀ (l : ℕ) (x : K), adams k (lambda l x) = lambda l (adams k x) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/adams-composition`: `ψ^k ∘ ψ^l = ψ^{kl}` in a special λ-ring. -/
theorem adams_comp [LambdaRing K] (k l : ℕ) (hk : 1 ≤ k) (hl : 1 ≤ l) (x : K) :
    adams k (adams l x) = adams (k * l) x := by
  sorry

/-- `KTheoryLowDegrees:Z.3/adams-frobenius`: `ψ^p(x) ≡ x^p` modulo `pK` in a special λ-ring. -/
theorem adams_frobenius [LambdaRing K] (p : ℕ) (hp : p.Prime) (x : K) :
    adams p x - x ^ p ∈ Ideal.span {(p : K)} := by
  sorry

/-! #### `KTheoryLowDegrees:Z.3/monoid-lambda-ring` -/

section MonoidAlgebra

variable {R : Type*} [CommRing R]

/-- Helper (not a packet name): the unit `1 + a t` of `R[[t]]`. -/
noncomputable def lineUnit (a : R) : (PowerSeries R)ˣ :=
  unitOfConstOne (1 + PowerSeries.C a * PowerSeries.X) (by simp)

variable (M : Type*) [AddCommMonoid M]

/-- Helper (not a packet name): `λ_t` on `ℤ[M]`, the additive extension of `[m] ↦ 1 + [m] t` (a
real definition through `Finsupp.liftAddHom` on the coefficients). -/
noncomputable def monoidAlgebraLambdaTotal :
    AddMonoidAlgebra ℤ M →+ Additive (PowerSeries (AddMonoidAlgebra ℤ M))ˣ :=
  (Finsupp.liftAddHom fun m => zmultiplesHom _
      (Additive.ofMul (lineUnit (AddMonoidAlgebra.single m (1 : ℤ))))).comp
    AddMonoidAlgebra.coeffAddEquiv.toAddMonoidHom

/-- **The special λ-ring of a monoid of line elements** (`TauCeti.LambdaRing.monoidAlgebra`,
KTheoryLowDegrees:Z.3/monoid-lambda-ring): `ℤ[M]` with `λ_t(m) = 1 + m t`; the operations are the
coefficients of `monoidAlgebraLambdaTotal`. Instances: `ℤ[u^{±1}]` (Mathlib's
`LaurentPolynomial ℤ`), `ℤ[ℕⁿ] = ℤ[ξ₁, …, ξ_n]`, the character ring `ℤ[X(T)]` of a split torus. -/
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

/-- `λ^k(m₁ + ⋯ + m_n) = e_k(m₁, …, m_n)`. -/
@[simp]
theorem monoidAlgebra_lambda_sum (n k : ℕ) (m : Fin n → M) :
    lambda k (∑ i, AddMonoidAlgebra.single (m i) (1 : ℤ)) =
      MvPolynomial.aeval (fun i => AddMonoidAlgebra.single (m i) (1 : ℤ))
        (MvPolynomial.esymm (Fin n) ℤ k) := by
  sorry

/-- `ψ^k` is the ring endomorphism of `ℤ[M]` induced by `m ↦ k • m` (`m^k` multiplicatively), for
`k ≥ 1`. -/
@[simp]
theorem monoidAlgebra_adams (k : ℕ) (hk : 1 ≤ k) (x : AddMonoidAlgebra ℤ M) :
    adams k x = AddMonoidAlgebra.mapDomainRingHom ℤ (nsmulAddMonoidHom (α := M) k) x := by
  sorry

/-- A monoid homomorphism `M → M'` induces a λ-homomorphism `ℤ[M] → ℤ[M']` (a real definition over
`AddMonoidAlgebra.mapDomainRingHom`). -/
noncomputable def monoidAlgebra_map {M' : Type*} [AddCommMonoid M'] (f : M →+ M') :
    PreLambdaRing.Hom (AddMonoidAlgebra ℤ M) (AddMonoidAlgebra ℤ M') :=
  { AddMonoidAlgebra.mapDomainRingHom ℤ f with map_lambda' := by sorry }

/-- For a special λ-ring `K`, a monoid map from `M` to the line elements of `K` extends uniquely to
a λ-homomorphism `ℤ[M] → K` (Weibel Ex. II.4.4(c)). -/
theorem monoidAlgebra_lift (K : Type*) [CommRing K] [LambdaRing K] (φ : Multiplicative M →* K)
    (hφ : ∀ m, IsLineElement (φ m)) :
    ∃! f : PreLambdaRing.Hom (AddMonoidAlgebra ℤ M) K,
      ∀ m : M, f.toRingHom (AddMonoidAlgebra.single m 1) = φ (Multiplicative.ofAdd m) := by
  sorry

/-- Helper instance (not a packet name): `ℤ[ξ_i]` is the monoid λ-ring of `σ →₀ ℕ`. -/
noncomputable instance mvPolynomialLambdaRing (σ : Type*) : LambdaRing (MvPolynomial σ ℤ) :=
  inferInstanceAs (LambdaRing (AddMonoidAlgebra ℤ (σ →₀ ℕ)))

end MonoidAlgebra

/-! #### `KTheoryLowDegrees:Z.3/lambda-identity-principle` -/

/-- Helper (not a packet name): expressions in `r` variables built from integer constants, `+`,
`-`, `·` and the `λ^k`. -/
inductive LambdaExpr (r : ℕ) : Type
  | var : Fin r → LambdaExpr r
  | const : ℤ → LambdaExpr r
  | add : LambdaExpr r → LambdaExpr r → LambdaExpr r
  | neg : LambdaExpr r → LambdaExpr r
  | mul : LambdaExpr r → LambdaExpr r → LambdaExpr r
  | lam : ℕ → LambdaExpr r → LambdaExpr r

/-- Helper (not a packet name): evaluation of a λ-expression in a pre-λ-ring. -/
def LambdaExpr.eval {r : ℕ} {K : Type*} [CommRing K] [PreLambdaRing K] (x : Fin r → K) :
    LambdaExpr r → K
  | .var i => x i
  | .const n => n
  | .add e f => e.eval x + f.eval x
  | .neg e => -e.eval x
  | .mul e f => e.eval x * f.eval x
  | .lam k e => lambda k (e.eval x)

/-- **The identity principle** (`KTheoryLowDegrees:Z.3/lambda-identity-principle`): an identity
`F = G` of λ-expressions holding in `ℤ[ξ^{(1)}, …, ξ^{(r)}]` for
`x_j = ξ^{(j)}₁ + ⋯ + ξ^{(j)}_n`, for all sufficiently large `n`, holds for all elements of every
special λ-ring. (The augmented and fixed-rank variants of the node are not restated.) -/
theorem lambda_identity_principle {r : ℕ} (F G : LambdaExpr r)
    (h : ∃ N : ℕ, ∀ n ≥ N,
      F.eval (fun j => ∑ i : Fin n, (MvPolynomial.X (j, i) : MvPolynomial (Fin r × Fin n) ℤ)) =
        G.eval (fun j => ∑ i : Fin n, (MvPolynomial.X (j, i) : MvPolynomial (Fin r × Fin n) ℤ)))
    (K : Type*) [CommRing K] [LambdaRing K] (x : Fin r → K) : F.eval x = G.eval x := by
  sorry

end LambdaRing

end TauCeti

/-! ### `SchemeKTheoryOperations:S.6/non-unital-lambda-algebra`

S.6's λ-ring nodes proper, built on the Z.3 declarations above. The unitalisation `K₀ ⊕ I` is
Mathlib's `Unitization K₀ I`; its special λ-ring structure is part of the data of a non-unital
λ-algebra and is an instance through `NonUnitalAlgebra.unitization`. -/

namespace TauCeti.LambdaRing

open PreLambdaRing

/-- **Non-unital λ-algebras** over a special λ-ring `K₀` (`S.6/non-unital-lambda-algebra`, over
KTheoryLowDegrees Z.3/special-lambda-ring): operations `λ^k` on `I` for `k ≥ 1` and a special
λ-ring structure on the unitalisation `K₀ ⊕ I` whose operations are
`λ^k(a + x) = λ^k(a) + Σ_{i<k} λ^i(a) λ^{k-i}(x)`. This is Soulé's structure on `⊕_{m ≥ 1} K_m(A)`
over `K_0(A)` and on `K^Y(X)` over `ℤ`. The structure on `K₀ ⊕ I` is determined by the `λ^k` on
`I` (every element is `a + x`). -/
class NonUnitalAlgebra (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] (I : Type*)
    [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I] where
  /-- The operations `λ^k` on `I`, for `k ≥ 1` (the value at `k = 0` is not used). -/
  lambdaI : ℕ → I → I
  /-- **The special λ-ring** `K₀ ⊕ I` (`NonUnitalAlgebra.unitization`). -/
  unitization : LambdaRing (Unitization K₀ I)
  /-- `λ^k(a + x) = λ^k(a) + Σ_{i<k} λ^i(a) λ^{k-i}(x)` for `k ≥ 1`
  (`NonUnitalAlgebra.lambda_inl_add`). -/
  lambda_inl_add : ∀ (k : ℕ) (a : K₀) (x : I),
    unitization.lambda (k + 1) (Unitization.inl a + (x : Unitization K₀ I)) =
      Unitization.inl (lambda (k + 1) a) +
        ((∑ i ∈ Finset.range (k + 1), lambda i a • lambdaI (k + 1 - i) x : I) : Unitization K₀ I)

/-- Helper instance (not a packet name): the special λ-ring `K₀ ⊕ I` of a non-unital λ-algebra,
the field `NonUnitalAlgebra.unitization`. -/
noncomputable instance NonUnitalAlgebra.instLambdaRingUnitization {K₀ : Type*} [CommRing K₀]
    [LambdaRing K₀] {I : Type*} [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I]
    [SMulCommClass K₀ I I] [NonUnitalAlgebra K₀ I] : LambdaRing (Unitization K₀ I) :=
  NonUnitalAlgebra.unitization

/-- `I`, the kernel of the first projection `K₀ ⊕ I → K₀`, is a λ-ideal of `K₀ ⊕ I` (with quotient
`K₀`). -/
theorem NonUnitalAlgebra.isLambdaIdeal {K₀ : Type*} [CommRing K₀] [LambdaRing K₀] {I : Type*}
    [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I]
    [NonUnitalAlgebra K₀ I] :
    IsLambdaIdeal (RingHom.ker (Unitization.fstHom K₀ I).toRingHom) := by
  sorry

/-- **The induced augmentation** of `K₀ ⊕ I`: an augmentation `(ι₀, ε₀)` of `K₀` with values in `H`
(Z.3's `Augmentation`) gives `ι = inl ∘ ι₀` and `ε = ε₀ ∘ fst`; the augmentation ideal is
`ker ε₀ ⊕ I` (the λ-compatibility proofs are left as `sorry`). -/
noncomputable def NonUnitalAlgebra.augmentation {K₀ : Type*} [CommRing K₀] [LambdaRing K₀]
    {I : Type*} [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I]
    [NonUnitalAlgebra K₀ I] {H : Type*} [CommRing H] [BinomialRing H] (B : Augmentation K₀ H) :
    Augmentation (Unitization K₀ I) H where
  ι := { toRingHom := (Unitization.inlRingHom K₀ I).comp B.ι.toRingHom, map_lambda' := sorry }
  ε := { toRingHom := B.ε.toRingHom.comp (Unitization.fstHom K₀ I).toRingHom, map_lambda' := sorry }
  ε_ι := sorry

/-- If `I · I = 0`: `λ^k(x + y) = λ^k(x) + λ^k(y)` and `ψ^k(x) = (-1)^{k-1} k λ^k(x)` for `x, y ∈ I`
and `k ≥ 1` (Z.3's `adams_eq_of_lambda_mul_lambda_eq_zero` in `K₀ ⊕ I`). -/
theorem NonUnitalAlgebra.lambda_add_of_mul_eq_zero {K₀ : Type*} [CommRing K₀] [LambdaRing K₀]
    {I : Type*} [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I]
    [NonUnitalAlgebra K₀ I] (hI : ∀ x y : I, x * y = 0) (k : ℕ) (hk : 1 ≤ k) (x y : I) :
    NonUnitalAlgebra.lambdaI (K₀ := K₀) k (x + y) =
        NonUnitalAlgebra.lambdaI (K₀ := K₀) k x + NonUnitalAlgebra.lambdaI (K₀ := K₀) k y ∧
      adams k (x : Unitization K₀ I) =
        (-1) ^ (k - 1) * (k : Unitization K₀ I) * lambda k (x : Unitization K₀ I) := by
  sorry

/-- **A λ-ideal as a non-unital λ-algebra** (`NonUnitalAlgebra.ofLambdaIdeal`): a λ-ideal `J` of
`K₀` with the restricted operations; `(a, x) ↦ (a, a + x)` identifies `K₀ ⊕ J` with the λ-subring
`{(a, c) : c - a ∈ J}` of `K₀ × K₀` (Z.3's `ofSubring`), which gives the special structure (left as
`sorry`). -/
@[reducible]
noncomputable def NonUnitalAlgebra.ofLambdaIdeal {K₀ : Type*} [CommRing K₀] [LambdaRing K₀]
    (J : Ideal K₀) [IsLambdaIdeal J] : NonUnitalAlgebra K₀ J where
  lambdaI k x :=
    if hk : 1 ≤ k then ⟨lambda k (x : K₀), IsLambdaIdeal.lambda_mem k hk _ x.2⟩ else 0
  unitization := sorry
  lambda_inl_add := sorry

/-- **Morphisms of non-unital λ-algebras** over `K₀` (`NonUnitalAlgebra.Hom`): `K₀`-linear
multiplicative maps commuting with every `λ^k`, `k ≥ 1`. -/
structure NonUnitalAlgebra.Hom (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] (I J : Type*)
    [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I]
    [NonUnitalCommRing J] [Module K₀ J] [IsScalarTower K₀ J J] [SMulCommClass K₀ J J]
    [NonUnitalAlgebra K₀ I] [NonUnitalAlgebra K₀ J] extends I →ₙₐ[K₀] J where
  /-- `f ∘ λ^k = λ^k ∘ f` for `k ≥ 1`. -/
  map_lambdaI : ∀ k, 1 ≤ k → ∀ x,
    toNonUnitalAlgHom (NonUnitalAlgebra.lambdaI (K₀ := K₀) k x) =
      NonUnitalAlgebra.lambdaI (K₀ := K₀) k (toNonUnitalAlgHom x)

-- test nonUnitalAlgebra_square_zero_units (computation)
/- If `I · I = 0` and `λ^k(x) = (-1)^{k-1} x` for `k ≥ 1` (as for `ε ∈ ℤ[ε]/(ε²)`, or a unit in
`K_1(A)`), then `ψ^k(x) = k x`; for instance `ψ²(ε) = 2ε`. -/
example {I : Type*} [NonUnitalCommRing I] [IsScalarTower ℤ I I] [NonUnitalAlgebra ℤ I]
    (hI : ∀ x y : I, x * y = 0) (x : I)
    (hx : ∀ k, 1 ≤ k → NonUnitalAlgebra.lambdaI (K₀ := ℤ) k x = ((-1 : ℤ) ^ (k - 1)) • x)
    (k : ℕ) (hk : 1 ≤ k) :
    adams k (x : Unitization ℤ I) = ((k • x : I) : Unitization ℤ I) := by
  sorry

-- test nonUnitalAlgebra_zero (degenerate)
/- For `I = 0`, `K₀ ⊕ 0 = K₀`: `λ^k(a, 0) = (λ^k a, 0)`. -/
example (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] [NonUnitalAlgebra K₀ PUnit] (k : ℕ) (a : K₀) :
    lambda k (Unitization.inl a : Unitization K₀ PUnit) = Unitization.inl (lambda k a) := by
  sorry

-- test nonUnitalAlgebra_ofLambdaIdeal_compat (compatibility)
/- For a λ-ideal `J` with `ofLambdaIdeal J`, the map `K₀ ⊕ J → K₀`, `(a, x) ↦ a + x`, is a
λ-homomorphism. -/
example (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] (J : Ideal K₀) [IsLambdaIdeal J] (k : ℕ)
    (a : K₀) (x : J) :
    letI := NonUnitalAlgebra.ofLambdaIdeal J
    (lambda k (Unitization.inl a + (x : Unitization K₀ J))).fst +
        ((lambda k (Unitization.inl a + (x : Unitization K₀ J))).snd : K₀) =
      lambda k (a + x) := by
  sorry

-- test nonUnitalAlgebra_wrong_sign (non-example)
/- On a torsion-free `I` with `I · I = 0`, `λ^k(x) = x` for all `k ≥ 1` and `x ≠ 0` is impossible:
`ψ²(ψ²(x)) = 4x ≠ -4x = ψ⁴(x)` (the sign of the K-book's Example IV.5.4.1). -/
example {I : Type*} [NonUnitalCommRing I] [IsScalarTower ℤ I I] [IsAddTorsionFree I]
    (hI : ∀ x y : I, x * y = 0) (x : I) (hx : x ≠ 0) :
    ¬ ∃ A : NonUnitalAlgebra ℤ I, ∀ k, 1 ≤ k → A.lambdaI k x = x := by
  sorry

/-! ### `SchemeKTheoryOperations:S.6/non-unital-gamma-filtration` -/

/-- **The γ-filtration of a non-unital λ-algebra** (`S.6/non-unital-gamma-filtration`):
`F^n_γ I = I ∩ F^n_γ(K₀ ⊕ I)` for Z.3's γ-filtration (KTheoryLowDegrees Z.3/gamma-filtration) of the
augmented λ-ring `K₀ ⊕ I` (`NonUnitalAlgebra.augmentation`), a `K₀`-submodule of `I` (the closure
proofs are left as `sorry`). -/
noncomputable def NonUnitalAlgebra.gammaFiltration {K₀ : Type*} [CommRing K₀] [LambdaRing K₀]
    {I : Type*} [NonUnitalCommRing I] [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I]
    [NonUnitalAlgebra K₀ I] {H : Type*} [CommRing H] [BinomialRing H] (B : Augmentation K₀ H)
    (n : ℕ) : Submodule K₀ I where
  carrier := {x | (x : Unitization K₀ I) ∈
    _root_.TauCeti.LambdaRing.gammaFiltration (NonUnitalAlgebra.augmentation (I := I) B) n}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

section NonUnitalGamma

variable {K₀ : Type*} [CommRing K₀] [LambdaRing K₀] {I : Type*} [NonUnitalCommRing I]
  [Module K₀ I] [IsScalarTower K₀ I I] [SMulCommClass K₀ I I] [NonUnitalAlgebra K₀ I]
  {H : Type*} [CommRing H] [BinomialRing H]

/-- `F^0_γ I = F^1_γ I = I`. -/
@[simp]
theorem NonUnitalAlgebra.gammaFiltration_zero_one (B : Augmentation K₀ H) :
    NonUnitalAlgebra.gammaFiltration (I := I) B 0 = ⊤ ∧
      NonUnitalAlgebra.gammaFiltration (I := I) B 1 = ⊤ := by
  sorry

/-- `F^{n+1}_γ I ⊆ F^n_γ I`. -/
theorem NonUnitalAlgebra.gammaFiltration_antitone (B : Augmentation K₀ H) :
    Antitone (NonUnitalAlgebra.gammaFiltration (I := I) B) := by
  sorry

/-- `F^i_γ K₀ · F^j_γ I ⊆ F^{i+j}_γ I`. -/
theorem NonUnitalAlgebra.smul_mem_gammaFiltration (B : Augmentation K₀ H) {i j : ℕ} {a : K₀}
    {x : I} (ha : a ∈ _root_.TauCeti.LambdaRing.gammaFiltration B i)
    (hx : x ∈ NonUnitalAlgebra.gammaFiltration B j) :
    a • x ∈ NonUnitalAlgebra.gammaFiltration B (i + j) := by
  sorry

/-- If `I · I = 0`, `F^n_γ I` is the subgroup generated by `b · γ^j(x)` (`b ∈ K₀`, `j ≥ n`) and
`a · γ^j(x)` (`a ∈ F^i_γ K₀`, `i, j ≥ 1`, `i + j ≥ n`), where `γ^j(x) ∈ I` is computed in
`K₀ ⊕ I`. -/
theorem NonUnitalAlgebra.gammaFiltration_eq_span_of_mul_eq_zero (B : Augmentation K₀ H)
    (hI : ∀ x y : I, x * y = 0) (n : ℕ) :
    (NonUnitalAlgebra.gammaFiltration (I := I) B n : Set I) = AddSubgroup.closure
      ({y | ∃ (b : K₀) (x : I) (j : ℕ), n ≤ j ∧ y = b • (gamma j (x : Unitization K₀ I)).snd} ∪
        {y | ∃ (a : K₀) (x : I) (i j : ℕ), 1 ≤ i ∧ 1 ≤ j ∧ n ≤ i + j ∧
          a ∈ _root_.TauCeti.LambdaRing.gammaFiltration B i ∧
          y = a • (gamma j (x : Unitization K₀ I)).snd}) := by
  sorry

/-- Morphisms of non-unital λ-algebras over `K₀` preserve `F^n_γ`. -/
theorem NonUnitalAlgebra.gammaFiltration_map {J : Type*} [NonUnitalCommRing J] [Module K₀ J]
    [IsScalarTower K₀ J J] [SMulCommClass K₀ J J] [NonUnitalAlgebra K₀ J]
    (f : NonUnitalAlgebra.Hom K₀ I J) (B : Augmentation K₀ H) (n : ℕ) (x : I)
    (hx : x ∈ NonUnitalAlgebra.gammaFiltration B n) :
    f.toNonUnitalAlgHom x ∈ NonUnitalAlgebra.gammaFiltration (I := J) B n := by
  sorry

/-- **The graded pieces** `gr^n_γ I = F^n_γ I / F^{n+1}_γ I` (`NonUnitalAlgebra.gammaGraded`). -/
abbrev NonUnitalAlgebra.gammaGraded (B : Augmentation K₀ H) (n : ℕ) : Type _ :=
  ↥(NonUnitalAlgebra.gammaFiltration (I := I) B n) ⧸
    Submodule.comap (Submodule.subtype (NonUnitalAlgebra.gammaFiltration (I := I) B n))
      (NonUnitalAlgebra.gammaFiltration (I := I) B (n + 1))

end NonUnitalGamma

-- test nonUnital_gammaFiltration_units (computation)
/- Over `ℤ`, if `I · I = 0`, `I = ℤ x` and `λ^k(x) = (-1)^{k-1} x` (as for `ε ∈ ℤ[ε]/(ε²)`), then
`γ_t(m x) = 1 + m x t`, so `F^1_γ I = I` and `F^2_γ I = 0`. -/
example {I : Type*} [NonUnitalCommRing I] [IsScalarTower ℤ I I] [NonUnitalAlgebra ℤ I]
    (B : Augmentation ℤ ℤ) (hI : ∀ x y : I, x * y = 0) (x : I) (hgen : ∀ y : I, ∃ m : ℤ, y = m • x)
    (hx : ∀ k, 1 ≤ k → NonUnitalAlgebra.lambdaI (K₀ := ℤ) k x = ((-1 : ℤ) ^ (k - 1)) • x) :
    NonUnitalAlgebra.gammaFiltration (I := I) B 1 = ⊤ ∧
      NonUnitalAlgebra.gammaFiltration (I := I) B 2 = ⊥ := by
  sorry

-- test nonUnital_gammaFiltration_zero (degenerate)
/- `F^0_γ I = F^1_γ I = I`; for `I = 0` every `F^n_γ I` is `0`. -/
example (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] [NonUnitalAlgebra K₀ PUnit] {H : Type*}
    [CommRing H] [BinomialRing H] (B : Augmentation K₀ H) (n : ℕ) :
    NonUnitalAlgebra.gammaFiltration (I := PUnit) B n = ⊥ := by
  sorry

-- test nonUnital_gammaFiltration_augmentationIdeal (compatibility)
/- For `J = ker ε₀` with `ofLambdaIdeal J`, `F^n_γ J = F^n_γ K₀` (Z.3's `gammaFiltration`) for
`n ≥ 1`. -/
example (K₀ : Type*) [CommRing K₀] [LambdaRing K₀] {H : Type*} [CommRing H] [BinomialRing H]
    (B : Augmentation K₀ H) (n : ℕ) (hn : 1 ≤ n) :
    letI := NonUnitalAlgebra.ofLambdaIdeal (augmentationIdeal B)
    (NonUnitalAlgebra.gammaFiltration (I := augmentationIdeal B) B n).map
        (augmentationIdeal B).subtype = gammaFiltration B n := by
  sorry

-- test nonUnital_gammaFiltration_not_adic (non-example)
/- `I · I = 0` does not force `F^2_γ I = 0`: if `λ^k(x) = (-1)^{k-1} k x` (as for `η = εδ` in
`ℤ[ε, δ]/(ε², δ²)`), then `γ_t(x) = 1 + x(t - t²)` and `x = -γ²(x) ∈ F^2_γ I`. -/
example {I : Type*} [NonUnitalCommRing I] [IsScalarTower ℤ I I] [NonUnitalAlgebra ℤ I]
    (B : Augmentation ℤ ℤ) (hI : ∀ x y : I, x * y = 0) (x : I)
    (hx : ∀ k, 1 ≤ k →
      NonUnitalAlgebra.lambdaI (K₀ := ℤ) k x = ((-1 : ℤ) ^ (k - 1) * (k : ℤ)) • x) :
    x ∈ NonUnitalAlgebra.gammaFiltration (I := I) B 2 := by
  sorry

end TauCeti.LambdaRing

/-! ### `SchemeKTheoryOperations:S.6/adams-eigenvalue-on-gamma-graded`,
`SchemeKTheoryOperations:S.6/rational-weight-decomposition`

Stated for Z.3's augmented λ-rings (`TauCeti.LambdaRing.Augmentation`) and Z.3's γ-filtration. -/

namespace TauCeti.LambdaRing

open MvPolynomial PreLambdaRing

section Weights

variable {K : Type*} [CommRing K] [LambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]

/-- Helper (not a packet name): the graded pieces `gr^n_γ K = F^n_γ / F^{n+1}_γ` of Z.3's
γ-filtration, formed as groups (their graded ring and `H`-module structures are not formed here);
used by S.7. -/
abbrev gammaGraded (A : Augmentation K H) (n : ℕ) : Type _ :=
  ↥(gammaFiltration A n) ⧸
    Submodule.comap (Submodule.subtype (gammaFiltration A n)) (gammaFiltration A (n + 1))

/-- **`ψ^k` acts on `gr^n_γ` by `k^n`** (`S.6/adams-eigenvalue-on-gamma-graded`): for `x ∈ F^n_γ`
(`n ≥ 1`), modulo `F^{n+1}_γ`: `ψ^k(x) ≡ k^n x`, `λ^k(x) ≡ (-1)^{k-1} k^{n-1} x` and
`γ^n(x) ≡ (-1)^{n-1} (n-1)! x`. For `n = 1` this is Z.3's
`lambda_adams_sub_mem_gammaFiltration_two` (Z.3/adams-first-graded). The explicit correction
polynomials `Q_{k,i}` and the non-unital case (`NonUnitalAlgebra.gammaFiltration`) are not
restated. -/
theorem adams_eigenvalue_on_gamma_graded (A : Augmentation K H) (n : ℕ) (hn : 1 ≤ n) (k : ℕ)
    (hk : 1 ≤ k) (x : K) (hx : x ∈ gammaFiltration A n) :
    adams k x - (k : K) ^ n * x ∈ gammaFiltration A (n + 1) ∧
      lambda k x - (-1) ^ (k - 1) * (k : K) ^ (n - 1) * x ∈ gammaFiltration A (n + 1) ∧
      gamma n x - (-1) ^ (n - 1) * ((n - 1).factorial : K) * x ∈ gammaFiltration A (n + 1) := by
  sorry

/-- `ψ^k` restricted to a `ψ^k`-stable additive subgroup, as a `ℤ`-linear map (helper; additive by
Z.3's `adams_add`). -/
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
theorem rational_weight_decomposition (A : Augmentation K H) (J : AddSubgroup K)
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

end Weights

end TauCeti.LambdaRing

/-! ### Repeated from `KTheoryLowDegrees--Z.3.lean`: the representation rings `R_ℤ(∏ GL_{N_i})`

KTheoryLowDegrees Z.3's declarations (Z.3/representation-ring-of-gl,
Z.3/serre-representation-ring-theorem), repeated here so that this prototype elaborates on its own,
under Z.3's names and with Z.3's docstrings and without Z.3's unit tests. S.6 builds `R_ℤ(GL)` on
them below. -/

/-! #### `KTheoryLowDegrees:Z.3/representation-ring-of-gl` and
`Z.3/serre-representation-ring-theorem`

`G = GL_{N₁} × ⋯ × GL_{N_r}` is indexed by the list `Ns = [N₁, …, N_r]`; its coordinate Hopf algebra
is the iterated tensor product of Tau Ceti's `GeneralLinear.coordinateHopfAlgebra`. The base ring
`k` is general (Z.3's case is `k = ℤ`); stating it generically avoids the two `ℤ`-module
structures on a bundled Hopf `ℤ`-algebra. Representations are Tau Ceti's finitely generated
comodules (`FGComoduleCat`) that are free over `k`, and `R_k(G)` is Tau Ceti's `ExactK0` for the
short sequences that are exact on underlying modules. -/

namespace TauCeti.RepresentationRing

open TauCeti.GeneralLinear CategoryTheory.MonoidalCategory
open scoped TensorProduct

variable (k : Type) [CommRing k]

/-- Helper (not a packet name): the coordinate Hopf algebra `k[G] = ⊗_i k[GL_{N_i}]` of
`G = ∏ GL_{N_i}` (a real definition, by recursion on the list of sizes). -/
def glCoordinate : List ℕ → CommHopfAlgCat.{0} k
  | [] => CommHopfAlgCat.of k k
  | N :: Ns => CommHopfAlgCat.of k (coordinateHopfAlgebra k N ⊗[k] glCoordinate Ns)

/-- Helper (not a packet name): the object property of being free over `k`. -/
def isFree (Ns : List ℕ) : ObjectProperty (FGComoduleCat.{0, 0, 0} k (glCoordinate k Ns)) :=
  fun V => Module.Free k V

/-- **Representations of `∏ GL_{N_i}`** (`TauCeti.RepresentationRing.GLRep`,
KTheoryLowDegrees:Z.3/representation-ring-of-gl): finitely generated comodules over `k[G]` that are
free over `k` (lattices for `k = ℤ`). -/
abbrev GLRep (Ns : List ℕ) : Type 1 := (isFree k Ns).FullSubcategory

/-- Helper instance (a true fact, proof omitted). -/
instance (Ns : List ℕ) : (isFree k Ns).ContainsZero := by sorry
/-- Helper instance (a true fact, proof omitted). -/
instance (Ns : List ℕ) : (isFree k Ns).IsClosedUnderBinaryProducts := by sorry
/-- Helper instance (a true fact, proof omitted): tensor products of free comodules are free. -/
instance (Ns : List ℕ) : (isFree k Ns).IsMonoidal := by sorry
/-- Helper instance (a true fact, proof omitted). -/
instance (Ns : List ℕ) : ObjectProperty.EssentiallySmall.{0} (isFree k Ns) := by sorry

/-- Helper (not a packet name): the short sequences of representations that are exact on the
underlying modules. -/
def IsConflation (Ns : List ℕ) (S : ShortComplex (GLRep k Ns)) : Prop :=
  Function.Injective S.f.hom.hom ∧ Function.Surjective S.g.hom.hom ∧
    Function.Exact S.f.hom.hom S.g.hom.hom

/-- Helper (not a packet name): the exact structure of `GLRep`, with conflations `IsConflation`
(a real definition of the conflations; the Quillen axioms are omitted). -/
def exactStructure (Ns : List ℕ) : ExactStructure (GLRep k Ns) where
  Conflation := IsConflation k Ns
  isKernelCokernelPair := by sorry
  isClosedUnderIsomorphisms := by sorry
  isInflation_id := by sorry
  isDeflation_id := by sorry
  isInflation_comp := by sorry
  isDeflation_comp := by sorry
  hasPushouts_inflations := by sorry
  isStableUnderCobaseChange_inflations := by sorry
  hasPullbacks_deflations := by sorry
  isStableUnderBaseChange_deflations := by sorry

/-- **The representation ring** `R_k(∏ GL_{N_i})` (`TauCeti.RepresentationRing.ofGL`,
KTheoryLowDegrees:Z.3/representation-ring-of-gl): Tau Ceti's
exact `K₀` of `GLRep`, a real definition. -/
def ofGL (Ns : List ℕ) : Type := ExactK0.{0} (exactStructure k Ns)

instance (Ns : List ℕ) : AddCommGroup (ofGL k Ns) :=
  inferInstanceAs (AddCommGroup (ExactK0.{0} (exactStructure k Ns)))

namespace ofGL

variable {k}

/-- Helper (not a packet name): the class of a representation. -/
def of {Ns : List ℕ} (V : GLRep k Ns) : ofGL k Ns := ExactK0.of V

variable (k)

/-- Helper (not a packet name): the tensor product as a biadditive invariant, descended by
`ExactK0.BiadditiveInvariant.bilift` (a real definition; exactness of `⊗` over `k`-free comodules is
omitted). -/
def mulHom (Ns : List ℕ) : ofGL k Ns →+ ofGL k Ns →+ ofGL k Ns :=
  ExactK0.BiadditiveInvariant.bilift
    { obj := fun V W => (of (V ⊗ W) : ofGL k Ns)
      map_iso₁ := by sorry
      map_iso₂ := by sorry
      map_conflation₂ := by sorry
      map_conflation₁ := by sorry }

/-- `R_k(G)` is a commutative ring under `⊗`, with unit the trivial representation (a real
multiplication; the ring axioms are omitted). -/
instance instCommRing (Ns : List ℕ) : CommRing (ofGL k Ns) :=
  letI : Mul (ofGL k Ns) := ⟨fun a b => mulHom k Ns a b⟩
  letI : One (ofGL k Ns) := ⟨(of (𝟙_ (GLRep k Ns)) : ofGL k Ns)⟩
  { (inferInstance : AddCommGroup (ofGL k Ns)) with
    mul := fun a b => mulHom k Ns a b
    one := (of (𝟙_ (GLRep k Ns)) : ofGL k Ns)
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    left_distrib := by sorry
    right_distrib := by sorry
    zero_mul := by sorry
    mul_zero := by sorry
    mul_comm := by sorry
    natCast := fun n => n • (of (𝟙_ (GLRep k Ns)) : ofGL k Ns)
    natCast_zero := by sorry
    natCast_succ := by sorry
    intCast := fun n => n • (of (𝟙_ (GLRep k Ns)) : ofGL k Ns)
    intCast_ofNat := by sorry
    intCast_negSucc := by sorry
    npow := npowRec
    npow_zero := by sorry
    npow_succ := by sorry }

/-- `TauCeti.RepresentationRing.ofGL.preLambda`: the pre-λ-ring structure by exterior powers of
representations (the exterior power comodule is not in Tau Ceti; the operations are omitted,
their values pinned by `character_lambda`). -/
instance preLambda (Ns : List ℕ) : PreLambdaRing (ofGL k Ns) where
  lambda := sorry
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry

/-- Helper (not a packet name): the standard representation `k^{N_i}` of the `i`-th factor, Tau
Ceti's `GeneralLinear.standardComodule` corestricted along the inclusion of the `i`-th tensor
factor (the construction through `FGComoduleCat.corestrict` is omitted). -/
def stdRep (Ns : List ℕ) (i : Fin Ns.length) : GLRep k Ns := sorry

/-- **The standard classes** (`TauCeti.RepresentationRing.ofGL.std`,
KTheoryLowDegrees:Z.3/representation-ring-of-gl): `std_i = [k^{N_i}]`; the determinant of the `i`-th
factor is `det_i = λ^{N_i}(std_i)`. -/
def std (Ns : List ℕ) (i : Fin Ns.length) : ofGL k Ns := of (stdRep k Ns i)

/-- Helper (not a packet name): the character lattice `X(T) = ⊕_i ℤ^{N_i}` of the diagonal torus. -/
abbrev CharLattice (Ns : List ℕ) : Type := (Σ i : Fin Ns.length, Fin (Ns.get i)) →₀ ℤ

/-- Helper (not a packet name): the variable `X_{i,a} ∈ ℤ[X(T)]`. -/
def charVar {Ns : List ℕ} (i : Fin Ns.length) (a : Fin (Ns.get i)) :
    AddMonoidAlgebra ℤ (CharLattice Ns) :=
  AddMonoidAlgebra.single (Finsupp.single ⟨i, a⟩ 1) 1

/-- **The character map** (`TauCeti.RepresentationRing.ofGL.character`):
`ch : R_k(G) → ℤ[X(T)]`, by restriction to the diagonal torus (Tau Ceti's
`GeneralLinear.diagonalTorus`) and the weight decomposition; a pre-λ-homomorphism into the special
λ-ring of `Z.3/monoid-lambda-ring` (construction omitted). -/
def character (Ns : List ℕ) :
    PreLambdaRing.Hom (ofGL k Ns) (AddMonoidAlgebra ℤ (CharLattice Ns)) :=
  sorry

/-- `ch(std_i) = X_{i,1} + ⋯ + X_{i,N_i}`. -/
@[simp]
theorem character_std (Ns : List ℕ) (i : Fin Ns.length) :
    (character k Ns).toRingHom (std k Ns i) = ∑ a, charVar i a := by
  sorry

/-- Restriction along `g ↦ diag(g, 1) : GL_N → GL_{N+1}`, a pre-λ-homomorphism
(`TauCeti.RepresentationRing.ofGL.restrict`; construction omitted), with `std ↦ std + 1`. -/
def restrict (N : ℕ) : PreLambdaRing.Hom (ofGL k [N + 1]) (ofGL k [N]) :=
  sorry

theorem restrict_std (N : ℕ) :
    (restrict k N).toRingHom (std k [N + 1] ⟨0, by simp⟩) = std k [N] ⟨0, by simp⟩ + 1 := by
  sorry

/-- The duality involution `V ↦ V^∨` (`TauCeti.RepresentationRing.ofGL.dual`; construction
omitted), with `det^∨ = det⁻¹`. -/
def dual (Ns : List ℕ) : ofGL k Ns →+* ofGL k Ns :=
  sorry

theorem dual_det (N : ℕ) :
    PreLambdaRing.lambda N (std k [N] ⟨0, by simp⟩) *
      dual k [N] (PreLambdaRing.lambda N (std k [N] ⟨0, by simp⟩)) = 1 := by
  sorry

end ofGL

/-- `KTheoryLowDegrees:Z.3/serre-representation-ring-theorem` (Serre 1968, Théorèmes 4–5): the
character map `R_ℤ(G) → ℤ[X(T)]` is injective with image the Weyl invariants `ℤ[X(T)]^W`
(`W = ∏ Σ_{N_i}` permuting the variables within each block); hence `R_ℤ(G)` is a special λ-ring,
a pre-λ-subring of `ℤ[X(T)]` (Z.3/monoid-lambda-ring). Rests on the recorded gap (Serre's
classification input). -/
theorem serre_representation_ring (Ns : List ℕ) :
    Function.Injective (ofGL.character ℤ Ns).toRingHom ∧
      Set.range (ofGL.character ℤ Ns).toRingHom =
        {f | ∀ w : ∀ i : Fin Ns.length, Equiv.Perm (Fin (Ns.get i)),
          AddMonoidAlgebra.mapDomain (Finsupp.mapDomain
            (fun p : Σ i : Fin Ns.length, Fin (Ns.get i) => (⟨p.1, w p.1 p.2⟩ :
              Σ i : Fin Ns.length, Fin (Ns.get i)))) f = f} ∧
      ∃ inst : LambdaRing (ofGL ℤ Ns), inst.toPreLambdaRing = ofGL.preLambda ℤ Ns := by
  sorry

end TauCeti.RepresentationRing

/-! ### `SchemeKTheoryOperations:S.6/stable-representation-ring` and
`SchemeKTheoryOperations:S.6/stable-representation-ring-special`

S.6's representation-ring nodes proper, over Z.3's `ofGL ℤ [N] = R_ℤ(GL_N)` above: the inverse limit
`R_ℤ(GL)` along restriction and the elements `τ_∞ = (τ(id_N - N))_N` of natural operations, with
`id_N` Z.3's standard class `ofGL.std ℤ [N] 0`. -/

namespace TauCeti.RepresentationRing

open TauCeti.LambdaRing TauCeti.PreLambdaRing

/-- **The stable representation ring** `R_ℤ(GL) = lim_N R_ℤ(GL_N)`
(`S.6/stable-representation-ring`): the subring of `∏_N R_ℤ(GL_N)` of the families compatible with
restriction along `diag(g, 1)` (Z.3's `ofGL.restrict`); the closure proofs are left as `sorry`. -/
def stableGL : Subring (∀ N : ℕ, ofGL ℤ [N]) where
  carrier := {f | ∀ N, (ofGL.restrict ℤ N).toRingHom (f (N + 1)) = f N}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- The pre-λ-ring structure of `R_ℤ(GL)`, componentwise (`stableGL.preLambda`; the compatibility
of the components and the axioms are left as `sorry`). -/
noncomputable instance stableGL.preLambda : PreLambdaRing stableGL where
  lambda k f := ⟨fun N => lambda k (f.1 N), sorry⟩
  lambda_zero' := sorry
  lambda_one' := sorry
  lambda_add' := sorry

/-- The projection `R_ℤ(GL) → R_ℤ(GL_N)`, a pre-λ-homomorphism (`stableGL.proj`). -/
noncomputable def stableGL.proj (N : ℕ) : PreLambdaRing.Hom stableGL (ofGL ℤ [N]) where
  toRingHom := (Pi.evalRingHom (fun N : ℕ => ofGL ℤ [N]) N).comp stableGL.subtype
  map_lambda' := sorry

/-- Two elements of `R_ℤ(GL)` are equal if all their components are. -/
theorem stableGL.ext {x y : stableGL}
    (h : ∀ N, (stableGL.proj N).toRingHom x = (stableGL.proj N).toRingHom y) : x = y := by
  sorry

/-- **The element of a natural operation** `τ_∞ = (τ(id_N - N))_N` (`stableGL.ofOperation`), for
`τ` a λ-expression in one variable (Z.3's `LambdaExpr`); its compatibility with restriction is left
as `sorry`. -/
noncomputable def stableGL.ofOperation (τ : LambdaExpr 1) : stableGL :=
  ⟨fun N => τ.eval (fun _ => ofGL.std ℤ [N] ⟨0, by simp⟩ - (N : ofGL ℤ [N])), sorry⟩

/-- `proj_N(τ_∞) = τ(id_N - N)`. -/
@[simp]
theorem stableGL.proj_ofOperation (τ : LambdaExpr 1) (N : ℕ) :
    (stableGL.proj N).toRingHom (stableGL.ofOperation τ) =
      τ.eval (fun _ => ofGL.std ℤ [N] ⟨0, by simp⟩ - (N : ofGL ℤ [N])) := by
  sorry

/-- The involution of `R_ℤ(GL)` induced levelwise by `ρ ↦ ρ^∨` (Z.3's `ofGL.dual`; data left as
`sorry`). -/
noncomputable def stableGL.dual : stableGL →+* stableGL :=
  sorry

-- test stableGL_ofOperation_adams (computation)
/- `proj_N(ψ²_∞) = ψ²(id_N - N) = ψ²(id_N) - N`, with `ψ²(x) = x² - 2λ²(x)` as a λ-expression and
character `X_1² + ⋯ + X_N² - N`. -/
example (N : ℕ) :
    (stableGL.proj N).toRingHom (stableGL.ofOperation
        (.add (.mul (.var 0) (.var 0)) (.neg (.mul (.const 2) (.lam 2 (.var 0)))))) =
      adams 2 (ofGL.std ℤ [N] ⟨0, by simp⟩) - N ∧
    (ofGL.character ℤ [N]).toRingHom (adams 2 (ofGL.std ℤ [N] ⟨0, by simp⟩)) =
      ∑ a, ofGL.charVar (Ns := [N]) ⟨0, by simp⟩ a ^ 2 := by
  sorry

-- test stableGL_ofOperation_rank_zero (degenerate)
/- In `R_ℤ(GL_0) = ℤ`, `id_0 = 0`, so `proj_0(λ^k_∞) = λ^k(0) = 0` for `k ≥ 1`. -/
example (k : ℕ) (hk : 1 ≤ k) :
    (stableGL.proj 0).toRingHom (stableGL.ofOperation (.lam k (.var 0))) = 0 := by
  sorry

-- test stableGL_restrict_compat (characterisation)
/- `ρ_N(proj_{N+1} x) = proj_N x`, and `ρ_N(id_{N+1} - (N + 1)) = id_N - N`. -/
example (N : ℕ) (x : stableGL) :
    (ofGL.restrict ℤ N).toRingHom ((stableGL.proj (N + 1)).toRingHom x) =
        (stableGL.proj N).toRingHom x ∧
      (ofGL.restrict ℤ N).toRingHom
          (ofGL.std ℤ [N + 1] ⟨0, by simp⟩ - ((N + 1 : ℕ) : ofGL ℤ [N + 1])) =
        ofGL.std ℤ [N] ⟨0, by simp⟩ - (N : ofGL ℤ [N]) := by
  sorry

-- test stableGL_not_id (non-example)
/- `(id_N)_N` is not a compatible family: `ρ_N(id_{N+1}) = id_N + 1`. -/
example : (fun N : ℕ => ofGL.std ℤ [N] ⟨0, by simp⟩) ∉ stableGL := by
  sorry

-- test stableGL_gamma_vanishing (compatibility)
/- `proj_N(γ^k_∞) = 0` for `N < k`, with `γ^k(x) = λ^k(x + k - 1)` as a λ-expression (Z.3's
`gamma_sub_natCast_eq_zero` in `R_ℤ(GL_N)`). -/
example (k N : ℕ) (hN : N < k) :
    (stableGL.proj N).toRingHom
      (stableGL.ofOperation (.lam k (.add (.var 0) (.const ((k - 1 : ℕ) : ℤ))))) = 0 := by
  sorry

/-- **`R_ℤ(GL)` is a special λ-ring** (`S.6/stable-representation-ring-special`): the passage to the
limit of Serre's theorem (`serre_representation_ring`, KTheoryLowDegrees
Z.3/serre-representation-ring-theorem). The projections are then λ-homomorphisms, and `τ ↦ τ_∞`
respects every identity of special λ-rings. -/
theorem stableGL_special :
    (∃ inst : LambdaRing stableGL, inst.toPreLambdaRing = stableGL.preLambda) ∧
      ∀ τ σ : LambdaExpr 1,
        (∀ (K : Type) [CommRing K] [LambdaRing K] (x : K),
          τ.eval (fun _ => x) = σ.eval (fun _ => x)) →
        stableGL.ofOperation τ = stableGL.ofOperation σ := by
  sorry

end TauCeti.RepresentationRing

/-! ### `SchemeKTheoryOperations:S.6/representation-ring`, `S.6/representation-frobenius`

`R_A(G)` of an abstract group over a commutative ring, with the pullbacks from Z.3's `R_ℤ(GL_N)`. -/

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

/-- For `ρ : G → GL_N(A)`, the pre-λ-homomorphism `R_ℤ(GL_N) → R_A(G)`, `σ ↦ [σ_A ∘ ρ]`, from Z.3's
`R_ℤ(GL_N)` (`RepresentationRing.ofGL ℤ [N]`); data left as `sorry`: base change of comodules and
their pullback along `ρ`. -/
noncomputable def RepresentationRing.ofGLPullback (N : ℕ) (ρ : G →* GL (Fin N) A) :
    PreLambdaRing.Hom (RepresentationRing.ofGL ℤ [N]) (RepresentationRing A G) :=
  sorry

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

-- test representationRing_forget_compat (compatibility)
/- `forget(ofGLPullback ρ (id_N)) = [A^N] = N · [A]` in `K_0(A)`: the class of the trivial
representation on `A^N` is `N · 1`. -/
example (N : ℕ) (ρ : G →* GL (Fin N) A) :
    RepresentationRing.forget
        ((RepresentationRing.ofGLPullback N ρ).toRingHom
          (RepresentationRing.ofGL.std ℤ [N] ⟨0, by simp⟩)) =
      RepresentationRing.forget (N : RepresentationRing A G) := by
  sorry

/-- **`ψ^p` is the Frobenius twist in characteristic `p`** (`S.6/representation-frobenius`), part
(b): for `pA = 0`, `ψ^p = Φ^*` on `R_A(G)` (`ψ^p` is Z.3's `adams`). Part (a), on
`R_{𝔽_p}(GL_N)` (Z.3's `RepresentationRing.ofGL (ZMod p) [N]`), needs the Frobenius representation
`g ↦ (g_{ij}^p)` as a comodule, which is not constructed here. -/
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
-- `TauCeti.KTheory.LambdaOperations.stableMap`: not stated here; needs `[BGL(A)^+, BGL(A)^+]`
-- (supplier: StableHomotopyKTheory:H.4/gl-telescope-plus-comparison); its source `R_ℤ(GL)` is
-- `TauCeti.RepresentationRing.stableGL` above.
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
`⨁_{m ≥ 1} K_m(A)` is a non-unital λ-algebra over `K_0(A)`, is
`TauCeti.LambdaRing.NonUnitalAlgebra` with `NonUnitalAlgebra.lambda_add_of_mul_eq_zero` and
`NonUnitalAlgebra.gammaFiltration`, Z.3's `adams_eq_of_lambda_mul_lambda_eq_zero`, and
`rational_weight_decomposition`. -/

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
map `R_ℤ(GL_N) → K_0(Vect X)` from Z.3's `RepresentationRing.ofGL ℤ [N]` needs the associated
bundles `σ(E)` (the scheme version of KTheoryLowDegrees Z.3/associated-projective-module, glued
along a trivialising cover); both are left out (exterior powers of sheaves of modules are a gap of
the packet). -/
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
theorem augmentation_bott (A : Augmentation K H) (k p : ℕ) (N : K)
    (hN : ∀ j, p < j → lambda j N = 0) (hεN : A.ε.toRingHom N = p) :
    A.ε.toRingHom (bott k p N) = (k : H) ^ p ∧ bott k p N - (k : K) ^ p ∈ gammaFiltration A 1 := by
  sorry

/-- λ-homomorphisms commute with `θ^k`. -/
theorem bott_map {L : Type*} [CommRing L] [LambdaRing L] (f : PreLambdaRing.Hom K L) (k p : ℕ)
    (N : K) :
    f.toRingHom (bott k p N) = bott k p (f.toRingHom N) := by
  sorry

/-- **The exponential extension** `θ^k : K → (K[1/k])ˣ` (`S.6/bott-cannibalistic-class`), for an
augmented λ-ring whose augmentation ideal is nil and whose elements are differences of elements
of finite rank (as `K_0` of a connected quasi-compact scheme of finite dimension): `N ↦ θ^k(N)` on
elements of rank `p` and `θ^k(-N) = θ^k(N)⁻¹` (data left as `sorry`). The packet states the
extension on all of `K_0`; without the nil hypothesis `θ^k(N)` need not be a unit of `K[1/k]`. -/
noncomputable def bottExp (A : Augmentation K H) (hnil : ∀ x ∈ augmentationIdeal A, IsNilpotent x)
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
example (A : Augmentation K H) (k p : ℕ) (hk : 1 ≤ k) (N : K) (hN : ∀ j, p < j → lambda j N = 0)
    (hεN : A.ε.toRingHom N = p) (hnil : ∀ x ∈ augmentationIdeal A, IsNilpotent x)
    (hι : ∀ h : H, A.ι.toRingHom h = 0 → h = 0) (hH : ∀ h : H, h ≠ 0 → ¬ IsNilpotent h) :
    A.ε.toRingHom (bott k p N) = (k : H) ^ p ∧
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
def twistedMap {R' : Type*} [CommRing R'] [LambdaRing R'] (f : PreLambdaRing.Hom R R') (N : R)
    (p : ℕ) :
    twisted R N p → twisted R' (f.toRingHom N) p :=
  fun a => ofPair (fst a) (f.toRingHom (snd a))

/-- A λ-homomorphism `f : R → R'` induces a λ-homomorphism `R_N → R'_{f(N)}`. -/
theorem twisted_map {R' : Type*} [CommRing R'] [LambdaRing R'] (f : PreLambdaRing.Hom R R') (N : R)
    (p : ℕ)
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

The γ-filtration of a scheme is KTheoryLowDegrees Z.3's γ-filtration of the augmented λ-ring
`K_0(Vect X)`
(`Scheme.K0Vect`), augmented by the rank to `H^0(X, ℤ)` (`LocallyConstant X ℤ`). Chow groups
`CH^*(X)`, Chern classes and Todd classes are SchemeAndStackFoundations SF.5's and are not in
either library, so the Chern character into `CH^*(X)_ℚ` and every Riemann–Roch statement are
comments; the γ-Chern character into `gr_γ ⊗ ℚ` is defined for any augmented λ-ring. -/

namespace TauCeti.AlgebraicGeometry.KTheory

open TauCeti.AlgebraicGeometry.Scheme TauCeti.PreLambdaRing
open TauCeti.LambdaRing (adams Augmentation augmentationIdeal)
open scoped TensorProduct

/-! ### `SchemeKTheoryOperations:S.7/scheme-gamma-filtration`,
`SchemeKTheoryOperations:S.7/gamma-first-graded-pieces`, `S.7/gamma-in-coniveau`,
`S.7/cycle-class-to-graded-k0` -/

section SchemeGamma

/-- The rank augmentation of `K_0(Vect X)` (helper; data left as `sorry`): `ε` is the rank
`K_0(Vect X) → H^0(X, ℤ)` and `ι` sends a locally constant `n` to `Σ n_U [𝒪_U]` over the finitely
many open-closed pieces `U` of a quasi-compact `X`. -/
noncomputable def rankAugmentation (X : Scheme.{u}) [CompactSpace X] :
    Augmentation (Scheme.K0Vect X) (LocallyConstant X ℤ) :=
  sorry

/-- **The γ-filtration of a scheme** `F^i_γ K_0(X)` (`S.7/scheme-gamma-filtration`): the
γ-filtration of the augmented special λ-ring `K_0(Vect X)`, an ideal of `K_0(Vect X)`. -/
def gammaFiltration (X : Scheme.{u}) [CompactSpace X] (i : ℕ) : _root_.Ideal (Scheme.K0Vect X) :=
  TauCeti.LambdaRing.gammaFiltration (rankAugmentation X) i

/-- `F^i F^j ⊆ F^{i+j}`, `F^{i+1} ⊆ F^i`, `F^0 = K_0` and `F^1 = ker(rank)`. -/
theorem gammaFiltration_mul (X : Scheme.{u}) [CompactSpace X] (i j : ℕ) :
    gammaFiltration X i * gammaFiltration X j ≤ gammaFiltration X (i + j) ∧
      gammaFiltration X (i + 1) ≤ gammaFiltration X i ∧ gammaFiltration X 0 = ⊤ ∧
      gammaFiltration X 1 = RingHom.ker (rankAugmentation X).ε.toRingHom := by
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

-- `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_affine`: not stated here; needs Z.3's rank
-- augmentation `TauCeti.RingK0.augmentation` of `K_0(A)` (supplier:
-- KTheoryLowDegrees:Z.3/ring-k0-augmented, a Z.3 declaration not repeated here) to apply
-- `TauCeti.LambdaRing.gammaFiltration` on both sides of `Scheme.K0VectSpecEquiv`.

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
-- test gammaFiltration_affine_compat (compatibility): not stated here; needs Z.3's augmentation
-- of `K_0(A)` (supplier: KTheoryLowDegrees:Z.3/ring-k0-augmented, not repeated here).
-- test gammaFiltration_not_coniveau_integral (non-example): not stated here; needs the coniveau
-- filtration `F^p_cod K_0(X)` (supplier: SchemeKTheoryOperations:S.4/codimension-support-filtration
-- on `K_*`, a comment above) and Chow groups (supplier: SchemeAndStackFoundations:SF.5).

/-- **The first graded pieces of the γ-filtration** (`S.7/gamma-first-graded-pieces`): the rank
identifies `F^0_γ / F^1_γ` with `H^0(X, ℤ)` (it is onto with kernel `F^1_γ`), and
`F^1_γ / F^2_γ ≅ Pic(X)` (`gammaFiltration_first`). The determinant, `F^2_γ = SK_0(X)` and the
ring structure of `rank ⊕ det` are left out: they need exterior powers of `𝒪_X`-modules (for
`X = Spec A` they are KTheoryLowDegrees Z.3/gamma-filtration-two, Z.3/gamma-first-graded and
Z.3/rank-det-ring-hom, whose `K₀(R)` declarations are not repeated here). -/
theorem gamma_first_graded_pieces (X : Scheme.{u}) [CompactSpace X] :
    Function.Surjective (rankAugmentation X).ε.toRingHom ∧
      RingHom.ker (rankAugmentation X).ε.toRingHom = gammaFiltration X 1 ∧
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
noncomputable def gammaChernRep (A : Augmentation K H) (i : ℕ) (x : K) : K :=
  MvPolynomial.aeval
    (fun j : Fin i => TauCeti.LambdaRing.gamma ((j : ℕ) + 1) (x - A.ι.toRingHom (A.ε.toRingHom x)))
    (TauCeti.LambdaRing.newtonPoly i)

/-- The representative lies in `F^i_γ` (helper). -/
theorem gammaChernRep_mem (A : Augmentation K H) (i : ℕ) (x : K) :
    gammaChernRep A i x ∈ TauCeti.LambdaRing.gammaFiltration A i := by
  sorry

/-- `F^0_γ = K` (helper). -/
theorem mem_gammaFiltration_zero (A : Augmentation K H) (x : K) :
    x ∈ TauCeti.LambdaRing.gammaFiltration A 0 := by
  sorry

/-- **The γ-Chern character** `ch = (ch_i)_i : K → Π_i gr^i_γ K ⊗ ℚ` (`S.7/gamma-chern-character`)
of an augmented λ-ring: `ch_0(x)` is the class of `x` in `gr^0_γ = K / F^1_γ ≅ H` (that is,
`ε(x)`), and `ch_i(x)` for `i > 0` is `(1/i!) N_i(γ^1(x - ε x), …, γ^i(x - ε x))` in `gr^i_γ ⊗ ℚ`.
For `K = K_0(Vect X)` this is the degree-zero case; `K_m(X)` for `m ≥ 1` needs higher K-theory. -/
noncomputable def gammaChern (A : Augmentation K H) (x : K) :
    (i : ℕ) → ℚ ⊗[ℤ] TauCeti.LambdaRing.gammaGraded A i
  | 0 => (1 : ℚ) ⊗ₜ Submodule.Quotient.mk ⟨x, mem_gammaFiltration_zero A x⟩
  | i + 1 => (((i + 1).factorial : ℚ)⁻¹) ⊗ₜ
      Submodule.Quotient.mk ⟨gammaChernRep A (i + 1) x, gammaChernRep_mem A (i + 1) x⟩

/-- `ch` is additive. -/
@[simp]
theorem gammaChern_add (A : Augmentation K H) (x y : K) :
    gammaChern A (x + y) = gammaChern A x + gammaChern A y := by
  sorry

-- `TauCeti.AlgebraicGeometry.KTheory.gammaChern_mul`: not stated here; needs the graded ring
-- structure `gr^i_γ ⊗ gr^j_γ → gr^{i+j}_γ` on `Π_i gr^i_γ ⊗ ℚ` (from Z.3's multiplicative
-- γ-filtration, KTheoryLowDegrees:Z.3/gamma-filtration-mul; the helper `gammaGraded` is formed here
-- only as groups) and, for `K_*(X)`,
-- the products of S.6 (supplier: SchemeKTheoryOperations:S.6/graded-commutative-ring).

/-- `ch_i ∘ ψ^k = k^i ch_i` for `k ≥ 1`. -/
theorem gammaChern_adams (A : Augmentation K H) (k : ℕ) (hk : 1 ≤ k) (x : K) (i : ℕ) :
    gammaChern A (adams k x) i = ((k : ℚ) ^ i) • gammaChern A x i := by
  sorry

/-- `ch ⊗ 1 : K_ℚ → Π_{i ≤ N} gr^i_γ K_ℚ` is bijective when `F^{N+1}_γ` is torsion (as for `K_0(X)`,
`X` regular noetherian of finite dimension, `S.6/scheme-gamma-bound`), stated without forming
`K_ℚ`: `ch(x) = 0` forces `x` to be torsion, and every family is `ch(x)/m`. The case of `K_m(X)`,
`m ≥ 1`, needs higher K-theory (supplier: GeneralAlgebraicKTheory:K.2:plus). -/
theorem gammaChern_bijective (A : Augmentation K H) (N : ℕ)
    (hN : ∀ x ∈ TauCeti.LambdaRing.gammaFiltration A (N + 1), ∃ m : ℕ, 0 < m ∧ m • x = 0) :
    (∀ x : K, (∀ i ≤ N, gammaChern A x i = 0) → ∃ m : ℕ, 0 < m ∧ m • x = 0) ∧
      ∀ v : (i : ℕ) → ℚ ⊗[ℤ] TauCeti.LambdaRing.gammaGraded A i,
        ∃ (x : K) (m : ℕ), 0 < m ∧ ∀ i ≤ N, gammaChern A x i = (m : ℚ) • v i := by
  sorry

/-- `ch` commutes with augmented λ-homomorphisms `f`, on the integral representatives (the induced
map `gr(f) ⊗ ℚ` is not formed here; for schemes, `f^*` on `K_m` needs higher K-theory). -/
theorem gammaChern_pullback {L : Type*} [CommRing L] [LambdaRing L] (A : Augmentation K H)
    (B : Augmentation L H) (f : PreLambdaRing.Hom K L)
    (hε : ∀ x, B.ε.toRingHom (f.toRingHom x) = A.ε.toRingHom x)
    (hι : ∀ h, f.toRingHom (A.ι.toRingHom h) = B.ι.toRingHom h) (i : ℕ) (x : K) :
    f.toRingHom (gammaChernRep A i x) = gammaChernRep B i (f.toRingHom x) := by
  sorry

-- test gammaChern_zero (degenerate)
example (A : Augmentation K H) :
    gammaChern A 0 = 0 ∧
      ∀ x y : K, A.ε.toRingHom x = A.ε.toRingHom y → gammaChern A x 0 = gammaChern A y 0 := by
  sorry

-- test gammaChern_line (computation)
example (A : Augmentation K H) (ℓ : K) (hℓ : ∀ j, 2 ≤ j → lambda j ℓ = 0)
    (hεℓ : A.ε.toRingHom ℓ = 1)
    (i : ℕ) (h : (ℓ - 1) ^ i ∈ TauCeti.LambdaRing.gammaFiltration A i) :
    gammaChern A ℓ i = ((i.factorial : ℚ)⁻¹) ⊗ₜ Submodule.Quotient.mk ⟨(ℓ - 1) ^ i, h⟩ := by
  sorry

-- test gammaChern_not_identity_integrally (non-example)
/- In `ℤ[t^{±1}]` (the λ-ring `TauCeti.LambdaRing.monoidAlgebra`, augmented by `t ↦ 1`), which
carries the part of `K_0(ℙ²)` generated by `[𝒪(-1)] = t^{-1}`: for `h = 1 - t^{-1}`,
`ch_2(h) = -h²/2` is not the image of an integral class of `gr^2_γ = ℤ h²`. (The packet states this
on `K_0(ℙ²)`, whose `𝒪(-1)` is not available: supplier AlgebraicModuliForArithmeticGeometry:R09.1.)
-/
example (A : Augmentation (AddMonoidAlgebra ℤ ℤ) ℤ)
    (hA : A.ε.toRingHom (AddMonoidAlgebra.single 1 1) = 1) :
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


/-!
# Target-pass additions and reconciled supplier contracts

The contracts below agree with the packet. Enhanced categories, spectra, formal Witt schemes,
supported polynomial operations and Chow-with-support carriers are unavailable at the pins.
Their declarations, API signatures and example statements are omitted until the named suppliers
exist. These are mathematical signatures and acceptance specifications, not Lean declarations
with opaque or proposition-valued stand-ins. The retained native prototypes above remain naming
proposals; every implementationStatus is unchecked.
-/

/-!
### `SchemeKTheoryOperations:S.1/perfect-module-complex`

Import Perf(A) from DGAInfinity layer5 for an associative ring A viewed as a degree-zero DG algebra over ℤ: compact objects of the derived category of right A-modules, equivalently the thick closure of A, equivalently retracts of finite semi-free complexes. Mathlib ModuleCat A uses left modules, so use the supplier for Aᵒᵖ when comparing to D(ModuleCat A); commutative A identifies the two. These objects are exactly complexes quasi-isomorphic to bounded complexes of finite projective modules. Identify the complete-Noetherian-local specialization with P7; no new general module-perfectness definition is owned here.

Hypotheses: A is associative and unital; scheme uses require commutative A.; DGAInfinity allows arbitrary commutative coefficient bases; choose ℤ, not a field.

Suppliers/prerequisites: mathlib:ModuleCat, mathlib:DerivedCategory, mathlib:Module.Projective, mathlib:Module.Finite, tauceti:TauCeti.finiteProjectiveModules, DeformationAndDerivedPatchingAlgebra:P7/perfect-complexes-tor-amplitude-and-minimal-models, tauceti:TauCetiRoadmap/DGAInfinity#layer-5-derived-modules-twisted-complexes-and-perfect-envelopes

Omitted signature `IsPerfectModule` (constructor): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: K ∈ D(A) is perfect: isomorphic in D(A) to a bounded complex of finitely generated projective modules.

Omitted signature `isPerfectModule_iff_pseudoCoherent_finiteTor` (characterisation): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: Perfect iff pseudo-coherent of finite tor dimension (Stacks 0658).

Omitted signature `isPerfectModule_iff_finite_projective_resolution` (characterisation): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: A module is perfect iff it has a finite resolution by finite projective modules (Stacks 066Q).

Omitted signature `IsPerfectModule.triangle` (structure): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: Two out of three in distinguished triangles (Stacks 066R); summands (Stacks 066S).

Omitted signature `IsPerfectModule.derivedTensor` (structure): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: For commutative A, K ⊗^L_A L of perfect objects is perfect (Stacks 0GM0).

Omitted signature `IsPerfectModule.baseChange` (functoriality): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: For a map of commutative rings A → B, K ⊗^L_A B is perfect over B (Stacks 066W).

Omitted signature `IsPerfectModule.restrictScalars` (functoriality): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: If B is perfect as an A-module, a perfect complex of B-modules is perfect over A (Stacks 066V).

Omitted signature `isPerfectModule_iff_P7` (compatibility): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: For a complete noetherian local O-algebra R, this property agrees with DeformationAndDerivedPatchingAlgebra P7's perfectness.

Omitted signature `isPerfectModule_of_isRegularRing` (example): Imported DGAInfinity module API, transported to left modules by Aᵒᵖ: Over a commutative regular Noetherian ring every finite module is perfect (Stacks 066Z; Serre's theorem via DeformationAndDerivedPatchingAlgebra R03.3).

Omitted example `isPerfectModule_int_quot` (computation): ℤ/6 is a perfect ℤ-module, with resolution 0 → ℤ --6--> ℤ → ℤ/6 → 0 of length one.

Omitted example `isPerfectModule_zero_ring` (degenerate): Over the zero ring every object of D(A) is perfect, and D_perf(A) is equivalent to the zero category.

Omitted example `not_isPerfectModule_Z4` (non-example): Over A = ℤ/4 the module ℤ/2 is not perfect: its minimal resolution ⋯ --2--> ℤ/4 --2--> ℤ/4 → ℤ/2 is infinite and Tor_i^{ℤ/4}(ℤ/2, ℤ/2) ≅ ℤ/2 for every i ≥ 0.

Omitted example `isPerfectModule_single_iff_finiteProjective` (compatibility): A module M in degree 0 is perfect of tor-amplitude [0, 0] iff M ∈ tauceti:TauCeti.finiteProjectiveModules A.

Omitted example `isPerfectModule_eq_P7_on_complete_local` (compatibility): For R = ℤ_p[[x]], O = ℤ_p, the object (R --x--> R) is perfect here and in P7, with cohomology R/(x) ≅ ℤ_p in degree 0.

Acceptance: A[0] is perfect; ℤ/n (n ≠ 0) is a perfect ℤ-module; the residue field of k[ε]/(ε²) is not a perfect module.

Acceptance: On P7's rings the two definitions return the same object property of D(R).

-/

/-!
### `SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme`

For qcqs X define 𝕂(X) to be K.6’s IK-spectrum of the Frobenius pair from S.1. K(X)→𝕂(X) is an isomorphism on π_i for i≥0 because D_perf(X) is idempotent complete. Define negative groups by this spectrum. Scheme agreement with TT’s Bass construction is proved only at S.5/scheme-nonconnective-agreement, after the scheme projective-bundle and Bass theorems; negative G vanishing is S.2/negative-g-theory-vanishing, not a scheme clause imported from K.6.

Hypotheses: qcqs is needed for the agreement with Thomason's K^B (Schlichting 7.1).; Negative groups of singular schemes need not vanish; nothing here infers their vanishing from the connective model.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-frobenius-pair, SchemeKTheoryOperations:S.1/perfect-idempotent-complete, SchemeKTheoryOperations:S.2/k-theory-of-a-scheme, GeneralAlgebraicKTheory:K.6/frobenius-pairs-flasque-envelope-and-suspension, GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance, GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K

Omitted signature `Scheme.KB` (data): 𝕂(X) := IK of the Frobenius pair of perfect complexes.

Omitted signature `Scheme.K_to_KB` (projection): The natural map K(X) → 𝕂(X).

Omitted signature `Scheme.K_to_KB_iso` (characterisation): π_n K(X) → π_n 𝕂(X) is an isomorphism for n ≥ 0.

Omitted signature `Scheme.KB_neg_eq_thomason` (compatibility): The downstream theorem S.5/scheme-nonconnective-agreement supplies this equality; it is not an axiom of Scheme.KB.

Omitted signature `Scheme.KB_affine` (compatibility): 𝕂(Spec A) has negative homotopy Bass's K_n(A) (K.6).

Omitted signature `Scheme.KB_neg_eq_zero_of_regular` (example): By S.2/negative-g-theory-vanishing and nonconnective Cartan comparison, negative groups vanish for regular Noetherian X.

Omitted example `KB_zero_spec` (computation): π_0 𝕂(Spec A) ≅ K_0(A) for every commutative ring A.

Omitted example `KB_empty` (degenerate): 𝕂(∅) is contractible.

Omitted example `KB_neg_regular_zero` (compatibility): π_{−1} 𝕂(Spec ℤ) = 0, matching the vanishing of Bass's K_{−1} for the regular noetherian ring ℤ.

Omitted example `KB_neg_node_nonzero` (non-example): For the node A = k[x, y]/(y² − x² − x³) over a field k of characteristic ≠ 2, π_{−1} 𝕂(Spec A) ≅ K_{−1}(A) ≅ ℤ: the Mayer–Vietoris sequence of negative K-theory for the conductor square of A → k[t] (x = t² − 1, y = tx) gives K_{−1}(A) ≅ coker(K_0(k[t]) ⊕ K_0(k) → K_0(k × k)) ≅ ℤ; negative groups need not vanish for singular schemes.

Acceptance: 𝕂_0(Spec A) = K_0(A).

Acceptance: 𝕂_{−1} of a regular noetherian ring is 0.

-/

/-!
### `SchemeKTheoryOperations:S.2/proper-pushforward-coherent`

Let f : X → Y be a proper morphism of schemes with Y noetherian (more generally, f locally of finite type with Y noetherian and E with proper support). Then Rf_* maps D^b_Coh(O_X) into D^b_Coh(O_Y) (Stacks 08E2); equivalently Rf_* preserves cohomologically bounded pseudo-coherent complexes (TT 2.5.4, pseudo-coherent case). On G_0 this gives the class Σ_i (−1)^i [R^if_*F] of a coherent sheaf F (Stacks 0FDL).

Hypotheses: Y is Noetherian. For the locally finite-type variant, each of the finitely many coherent cohomology sheaves has support proper over Y.; StableReduction layer2 supplies proper coherence without flatness or a relative-dimension-one restriction.

Suppliers/prerequisites: SchemeKTheoryOperations:S.2/proper-support-coherence-bridge, SchemeKTheoryOperations:S.1/pseudo-coherent-complex, tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity

Acceptance: For f : P^1_k → Spec k, Rf_*O = k[0] and Rf_*O(−2) = k[−1].

Acceptance: For a closed immersion Rf_* is exact and preserves coherence trivially.

-/

/-!
### `SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect`

Let f : X → Y be a proper morphism of schemes with Y noetherian (or f projective), and suppose f is perfect: pseudo-coherent (automatic over a noetherian base) and of locally finite Tor-dimension, i.e. O_X has locally finite tor dimension over f^{-1}O_Y. Then Rf_* maps perfect complexes on X to perfect complexes on Y (TT 2.5.4; SGA 6 III 4.8.1). In particular this holds for f flat and proper over a noetherian base (Stacks 0B6F), for regular closed immersions, and for proper morphisms to a regular noetherian scheme of finite Krull dimension (whose local rings have global dimension bounded by the dimension).

Hypotheses: Proper is needed (a non-proper f can send O_X to a non-coherent complex); perfect (finite Tor-dimension) is needed: for the closed point i : Spec k → Spec k[ε]/(ε²), Ri_*k = k is not perfect.; Y noetherian or f projective: the stated generality of TT 2.5.4.

Suppliers/prerequisites: SchemeKTheoryOperations:S.2/proper-pushforward-coherent, SchemeKTheoryOperations:S.2/derived-projection-formula, SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor, SchemeKTheoryOperations:S.1/tor-amplitude, mathlib:AlgebraicGeometry.IsProper, mathlib:AlgebraicGeometry.Flat, SchemeKTheoryOperations:S.2/projective-ambient-perfect-descent

Acceptance: For A=k⊕V with V=⊕_{n≥0}ke_n square-zero, ker(e₀:A→A)=V, not a finitely generated A-module. The strict perfect two-term complex remains perfect under the projective identity map.

Acceptance: Proper flat pushforward over a Noetherian base preserves perfectness by the Noetherian branch.

Acceptance: The point in Spec(k[ε]/ε²) is proper but not perfect as a morphism; its pushed-forward residue field is not perfect.

Acceptance: The open immersion G_m→A¹ is flat but not proper, and its O-module pushforward is not perfect.

-/

/-!
### `SchemeKTheoryOperations:S.2/derived-tor-independent-base-change`

Consider a cartesian square of schemes X′ = X ×_Y Y′ with g : Y′ → Y, f : X → Y quasi-compact quasi-separated, g′ : X′ → X and f′ : X′ → Y′ the projections. If X and Y′ are Tor-independent over Y (Tor_p^{O_{Y,y}}(O_{X,x}, O_{Y′,y′}) = 0 for p ≥ 1 whenever x, y′ map to the same y), then for every E ∈ D_QCoh(O_X) the canonical base-change map Lg*Rf_*E → Rf′_*L(g′)*E is an isomorphism (Stacks 08IB; TT 2.5.6; SGA 6 IV 3.1). This holds in particular if g is flat, e.g. an open immersion or the inclusion of a generic fibre (a limit of opens is handled by the flat case).

Hypotheses: Tor-independence may be required only at points of a closed subset off which E is acyclic (TT 2.5.6.4).; TT state it for E cohomologically bounded with either E of finite tor-amplitude over f^{-1}O_Y or g of finite Tor-dimension; the Stacks statement needs neither for E ∈ D_QCoh.

Suppliers/prerequisites: SchemeKTheoryOperations:S.2/derived-projection-formula, SchemeKTheoryOperations:S.2/total-direct-image-qcqs, SchemeKTheoryOperations:S.1/affine-derived-equivalence, EnhancedDerivedSheaves:E1/presentability-and-derived-tensor, mathlib:AlgebraicGeometry.Flat, SchemeAndStackFoundations:SF.2, tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change

Acceptance: Restriction to an open V ⊂ Y: (Rf_*E)|V ≅ R(f|f^{-1}V)_*(E|f^{-1}V).

Acceptance: For the flat map Spec F → Spec O_F from the generic point, Rf_* commutes with restriction to the generic fibre.

-/

/-!
### `SchemeKTheoryOperations:S.4/nisnevich-site`

For any scheme X, use the finitely presented étale X-schemes as a basis for the small Nisnevich site. A family covers U iff every x∈U lifts to some component with residue field isomorphic to κ(x). On qcqs schemes the site is generated by finite Zariski covers and elementary distinguished squares U×_X V→V, U→X: U is a quasi-compact open, V→X finitely presented étale, and V×_X(X∖U)_red→(X∖U)_red is an isomorphism. TT E.5 gives a conservative family of points indexed by x and finite étale residue-field extensions k′/κ(x), represented by the corresponding finite unramified extension of O^h_{X,x}. Ordinary henselizations occur for the trivial extension; strict henselizations are different objects.

Hypotheses: The finitely presented étale basis agrees with the usual small site; do not equate finite presentation with merely local finite presentation on non-quasi-compact objects.; Point-family conservativity holds without a Noetherian assumption (TT E.5). Cohomological dimension uses the separate Noetherian hypotheses of S.4/nisnevich-cohomological-dimension.

Suppliers/prerequisites: mathlib:AlgebraicGeometry.Etale, mathlib:AlgebraicGeometry.IsOpenImmersion, mathlib:CategoryTheory.GrothendieckTopology, mathlib:AlgebraicGeometry.Scheme.etaleTopology, mathlib:AlgebraicGeometry.Scheme.zariskiTopology, mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare, mathlib:HenselianLocalRing

Omitted signature `nisnevichTopology` (data): The Grothendieck topology on the category of étale X-schemes.

Omitted signature `DistinguishedSquare` (structure): Structure: U ⊆ X open, p: V → X étale, p^{-1}(X ∖ U)_red ≅ (X ∖ U)_red, with the cartesian square.

Omitted signature `DistinguishedSquare.isCover` (constructor): {U → X, V → X} is a Nisnevich cover.

Omitted signature `DistinguishedSquare.ofOpenCover` (example): X = U ∪ V gives the distinguished square with p the inclusion of V. Generation holds on qcqs schemes via Hoyois2016; do not infer hypercompleteness.

Omitted signature `zariski_le_nisnevich` (relation): Zariski covers are Nisnevich covers.

Omitted signature `nisnevich_le_etale` (relation): Nisnevich covers are étale covers (Mathlib's Scheme.etaleTopology).

Omitted signature `DistinguishedSquare.mayerVietorisSquare` (compatibility): A distinguished square is a MayerVietorisSquare for the Nisnevich topology in Mathlib's sense (f₁₃ an open immersion, pushout of sheaves), for noetherian X (MVW 12.7, cited by the K-book). Generation holds on qcqs schemes via Hoyois2016; do not infer hypercompleteness.

Omitted signature `nisnevich_point` (characterisation): The conservative TT E.5 family uses henselizations with finite étale residue-field extensions; includes the ordinary henselization at the trivial extension.

Omitted example `nis_field_split_component` (computation): Spec(k×k)→Spec k is a Nisnevich cover although its whole source is not isomorphic to Spec k: a single component gives a section.

Omitted example `nis_nonsplit_field` (non-example): Spec l→Spec k for a nontrivial finite separable field extension is étale but not a Nisnevich cover.

Omitted example `nis_henselian_shrink` (compatibility): For a pointed étale neighborhood of a henselian local ring with residue-isomorphic point, shrink around that point to remove other closed-fibre components before using a local section; do not require the original neighborhood to be an isomorphism.

Omitted example `nis_empty` (degenerate): The empty family covers the empty scheme and no nonempty scheme.

Acceptance: For k a field, (Spec k)_Nis consists of finite products of finite separable extensions, and a family covers k' iff one member is isomorphic to k' (TT E.4).

Acceptance: The square Spec k[x]_{(x)}^h over Spec k[x]_{(x)} with U = Spec k(x) is a filtered limit of distinguished squares.

-/

/-!
### `SchemeKTheoryOperations:S.4/hypercohomology-spectral-sequence`

Let C be a site with enough points and F a presheaf of fibrant spectra on C. There is a spectral sequence E_2^{p,q} = H^p(C; π~_qF) ⇒ π_{q−p} H(C; F) (p ≥ 0), with π~_qF the sheafification of the presheaf π_qF and differentials of bidegree (r, r − 1) (Thomason 1985, Proposition 1.36); it converges strongly if π_qF = 0 for q ≫ 0, or if C has bounded cohomological dimension for the sheaves π~_qF. In cohomological indexing E_2^{p,q} = H^p(C, π~_{−q}F) ⇒ π_{−p−q}H(C; F), as in K-book V.10.11.

Hypotheses: As in S.4/sheaf-hypercohomology-spectrum; convergence under one of the two boundedness hypotheses.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/sheaf-hypercohomology-spectrum, StableHomotopyKTheory:H.5:spectra, mathlib:CategoryTheory.Sheaf.H, mathlib:TopCat.Presheaf.IsFlasque, tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque, mathlib:CategoryTheory.SpectralSequence, StableHomotopyKTheory:H.6/exact-couple, StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence, StableHomotopyKTheory:H.6/spectral-sequence-conditional-convergence, StableHomotopyKTheory:H.6/spectral-sequence-convergence-complete

Acceptance: For F = K(A, 0) the spectral sequence is concentrated on q = 0 and gives π_{−p}H = H^p(C; A).

Acceptance: For X noetherian of Krull dimension d, E_2^{p,q} = 0 for p > d (Grothendieck vanishing), so the Zariski spectral sequence for K converges strongly (S.4/zariski-descent-spectral-sequence).

-/

/-!
### `SchemeKTheoryOperations:S.4/zariski-descent-spectral-sequence`

Let X be a noetherian scheme of Krull dimension d < ∞ and Y ⊆ X closed. There are strongly convergent spectral sequences E_2^{p,q} = H^p_Zar(X, 𝒦_{−q}) ⇒ K_{−p−q}(X) and E_2^{p,q} = H^p_Zar(X, 𝒦_{−q}(− on − ∩ Y)) ⇒ K_{−p−q}(X on Y), with E_2^{p,q} = 0 for p > d (Grothendieck vanishing) (TT (10.3.2); K-book V.10.11-10.12), and with supports E_2 = H^p_Y(X, 𝒦_{−q}) ⇒ K_{−p−q}(X on Y) (TT 10.5). The rows q = 0 and q = −1 begin with H^p(X, ℤ) and H^p(X, O^×).

Hypotheses: X noetherian of finite Krull dimension d; 𝒦_n from S.4/k-theory-sheaves.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/zariski-descent, SchemeKTheoryOperations:S.4/hypercohomology-spectral-sequence, SchemeKTheoryOperations:S.4/k-theory-sheaves, SchemeAndStackFoundations:SF.2, mathlib:CategoryTheory.Sheaf.H, mathlib:topologicalKrullDim, StableHomotopyKTheory:H.6/exact-couple, StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence, StableHomotopyKTheory:H.6/spectral-sequence-conditional-convergence, StableHomotopyKTheory:H.6/spectral-sequence-convergence-complete

Acceptance: X = Spec R local: the spectral sequence is concentrated on p = 0.

Acceptance: X a curve (d = 1): 0 → H^1(X, 𝒦_{n+1}) → K_n(X) → H^0(X, 𝒦_n) → 0 for all n.

-/

/-!
### `SchemeKTheoryOperations:S.4/nisnevich-descent`

Let X be a noetherian scheme of finite Krull dimension and Y ⊆ X a closed subscheme. Then K(X) → H_Nis(X; K) and K(X on Y) → H_Nis(X; K(− on − ×_X Y)) are homotopy equivalences, K(X on Y) ≃ H_Y(X; K)_Nis, and there are strongly convergent spectral sequences E_2^{p,q} = H^p_Nis(X, 𝒦^{Nis}_{−q}(− on − ×_X Y)) ⇒ K_{−p−q}(X on Y) whose stalks are the K-groups of henselian local rings of schemes étale over X (TT 10.8-10.10).

Hypotheses: X noetherian of finite Krull dimension; Y closed.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence, SchemeKTheoryOperations:S.4/codimension-support-filtration, SchemeKTheoryOperations:S.4/nisnevich-site, SchemeKTheoryOperations:S.4/nisnevich-cohomological-dimension, SchemeKTheoryOperations:S.4/sheaf-hypercohomology-spectrum, SchemeKTheoryOperations:S.4/hypercohomology-spectral-sequence, SchemeKTheoryOperations:S.4/zariski-descent, SchemeKTheoryOperations:S.4/nisnevich-excision-square, SchemeKTheoryOperations:S.4/k-theory-sheaves, SchemeKTheoryOperations:S.4/nisnevich-distinguished-square-criterion

Acceptance: For X = Spec O^h (a henselian local ring) the spectral sequence is concentrated on p = 0.

Acceptance: K-book Ex. V.10.9: for a one-dimensional noetherian X, K_{−1}(X) ≅ H^1_Nis(X, ℤ) follows from this spectral sequence and K_{−1} = 0 for henselian local rings (K-book III.4.4.3).

-/

/-!
### `SchemeKTheoryOperations:S.4/k-coniveau-spectral-sequence`

Let X be a noetherian scheme of finite Krull dimension and Y ⊆ X closed. The tower S^•K(X on Y) of S.4/codimension-support-filtration, with layers ⊕_{codim x = p} K(Spec O_{X,x} on x ∩ Y) (S.4/coniveau-layer-fibre-sequence evaluated on X), gives an exact couple D_1^{p,q} = π_{−p−q}S^pK, E_1^{p,q} = ⊕_{x∈Y, codim_X x = p} K_{−p−q}(O_{X,x} on x) and a bounded, strongly convergent spectral sequence E_1^{p,q} ⇒ K_{−p−q}(X on Y) whose abutment filtration is the coniveau filtration F^p. It is natural for flat maps. If X is regular, E_1^{p,q} ≅ ⊕_{x∈Y, codim_X x = p} K_{−p−q}(k(x)) and the spectral sequence is identified with Quillen's G-theory coniveau spectral sequence (S.4/k-coniveau-first-page-regular); for singular X the local terms K(O_{X,x} on x) are not K(k(x)) in general.

Hypotheses: X noetherian of finite Krull dimension; Y closed.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/codimension-support-filtration, SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence, StableHomotopyKTheory:H.5:spectra, mathlib:CategoryTheory.Abelian.SpectralObject, mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence, mathlib:CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological, StableHomotopyKTheory:H.6/exact-couple, StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence, StableHomotopyKTheory:H.6/spectral-sequence-convergence-exhaustive

Omitted signature `kConiveauSS` (data): The spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(O_{X,x} on x ∩ Y) ⇒ K_{−p−q}(X on Y).

Omitted signature `kConiveauSS.converges` (characterisation): Strong convergence to K_*(X on Y) with the coniveau filtration F^p; E_1^{p,q} = 0 unless 0 ≤ p ≤ dim X.

Omitted signature `kConiveauSS.flat` (functoriality): Natural for flat morphisms.

Omitted signature `kConiveauSS.edge` (projection): The edge map K_n(X) → E_1^{0,−n} = ⊕_{generic η} K_n(O_{X,η}) is restriction to the generic points.

Omitted signature `kConiveauSS.regular` (compatibility): For X regular, E_1^{p,q} ≅ ⊕ K_{−p−q}(k(x)) and the spectral sequence is Quillen's (S.4/k-coniveau-first-page-regular).

Omitted example `kConiveauSS.dvr` (computation): For O = ℤ_(p): E_1^{0,−1} = K_1(ℚ), E_1^{1,−1} = K_0(ℤ_(p) on (p)) ≅ ℤ, d_1(λ(p)) = 1.

Omitted example `kConiveauSS.field` (degenerate): For X = Spec k the spectral sequence is concentrated in p = 0 with E_1^{0,−n} = K_n(k).

Omitted example `kConiveauSS.singular_local_term` (non-example): For X = Spec k[ε]/(ε²) (dimension 0), E_1^{0,−n} = K_n(k[ε]/(ε²)), which is not K_n(k) (K_1 = k^× × k): the first page is not ⊕ K(k(x)) without regularity.

Omitted example `kConiveauSS.G_compat` (compatibility): For X = A²_k the spectral sequence agrees with Quillen's (K = G), with E_1^{2,−2} = ⊕_{closed x} ℤ.

Acceptance: X = Spec O (a DVR): E_1 has two columns K_n(L) (p = 0) and K_{n−1}(k) (p = 1, via dévissage), d_1 = ∂_S, and the spectral sequence is S.3/dvr-localisation-sequence.

Acceptance: X a regular curve: two columns, identified with S.3/one-dimensional-localisation-sequence.

-/

/-!
### `SchemeKTheoryOperations:S.4/g-coniveau-spectral-sequence`

Let X be a noetherian scheme of finite Krull dimension. The localisation sequences K(M^{p+1}(X)) → K(M^p(X)) → K(M^p/M^{p+1}) (GeneralAlgebraicKTheory K.3) form an exact couple D_1^{p,q} = K_{−p−q}(M^p(X)), E_1^{p,q} = K_{−p−q}(M^p/M^{p+1}) ≅ ⊕_{codim x = p} K_{−p−q}(k(x)), giving a bounded, convergent fourth-quadrant cohomological spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X) (Quillen 5.4, Gersten; K-book V.9.5), with abutment filtration the coniveau filtration F^pG_n(X) = im(K_nM^p(X) → G_n(X)). Its edge maps G_n(X) → E_1^{0,−n} = ⊕ K_n(k(η)) (generic points) are restriction to generic points (X reduced), its d_1 components are residues (S.4/coniveau-residue-differential), E_2^{p,−p} = CH^p(X) (S.4/coniveau-chow-group), and it is contravariant for flat maps (S.4/coniveau-flat-functoriality). For X not finite-dimensional, no convergence is asserted without the completeness and derived-limit hypotheses of H.6; see the review gap.

Hypotheses: X noetherian of finite Krull dimension.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/coherent-codimension-filtration, SchemeKTheoryOperations:S.4/coniveau-quotient-decomposition, GeneralAlgebraicKTheory:K.3/abelian-localization-theorem, SchemeKTheoryOperations:S.2/g-theory-of-a-scheme, mathlib:CategoryTheory.Abelian.SpectralObject, mathlib:CategoryTheory.Abelian.SpectralObject.spectralSequence, mathlib:CategoryTheory.Abelian.SpectralObject.coreE₂Cohomological, mathlib:CategoryTheory.SpectralSequence, StableHomotopyKTheory:H.6/exact-couple, StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence, StableHomotopyKTheory:H.6/spectral-sequence-convergence-exhaustive

Omitted signature `coniveauSS` (data): The spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X).

Omitted signature `coniveauSS.exactCouple` (structure): The exact couple (D_1, E_1) from the localisation sequences of M^{p+1} ⊆ M^p.

Omitted signature `coniveauSS.converges` (characterisation): Convergence to G_*(X) with filtration F^pG_n(X) = im(K_nM^p(X) → G_n(X)); E_1^{p,q} = 0 unless 0 ≤ p ≤ dim X and p + q ≤ 0.

Omitted signature `coniveauSS.edge` (projection): The edge map G_n(X) → ⊕_η K_n(k(η)) is restriction to the generic points. For nonreduced X, use Artinian dévissage at generic local rings rather than identifying the local ring with k(η); this is the dévissage already supplied by S.4/coniveau-quotient-decomposition.

Omitted signature `coniveauSS.d1` (simp): The components of d_1 are residues (S.4/coniveau-residue-differential); on K_1 they are length orders (S.4/coniveau-weight-one-differential).

Omitted signature `coniveauSS.d1_d1` (relation): d_1 ∘ d_1 = 0 (S.4/residue-composite-vanishes).

Omitted signature `coniveauSS.E2_chow` (characterisation): E_2^{p,−p} ≅ CH^p(X) (S.4/coniveau-chow-group).

Omitted signature `coniveauSS.flat` (functoriality): Contravariant for flat maps (S.4/coniveau-flat-functoriality).

Omitted signature `coniveauSS.proper` (functoriality): For a proper map f: X → Y with a support-dimension estimate ensuring f_*M^i(X) ⊆ M^{i−d}(Y) on bounded coherent complexes, the resulting filtered derived functor induces the shifted spectral-sequence map. Pure-dimensional catenary schemes with a dimension formula provide the intended codimension shift; relative fibre dimension alone does not. Establish filtered functoriality and coherent pushforward before applying H.6 (K-book Ex. V.9.3).

Omitted signature `coniveauSS.K_compat` (compatibility): For X regular it is the K-theoretic coniveau spectral sequence of S.4/k-coniveau-spectral-sequence (S.4/k-coniveau-first-page-regular).

Omitted example `coniveauSS.dvr` (computation): X = Spec ℤ_(p): E_1^{0,−1} = ℚ^× (via λ), E_1^{1,−1} = K_0(𝔽_p) = ℤ, d_1 = v_p; E_2^{1,−1} = 0, E_2^{0,−1} = ℤ_(p)^×.

Omitted example `coniveauSS.field` (degenerate): X = Spec k: only the column p = 0, E_1^{0,−n} = K_n(k), E_2 = E_1.

Omitted example `coniveauSS.P1` (computation): X = P¹_k: E_2^{1,−1} = CH^1(P¹) = ℤ and E_2^{0,0} = ℤ, so G_0(P¹) ≅ ℤ² (with S.5's projective-line theorem as a cross-check).

Omitted example `coniveauSS.nonreduced` (non-example): X = Spec k[ε]/(ε²): E_1^{0,−n} = K_n(k) (residue field), not K_n(k[ε]/(ε²)): the first page sees residue fields only, matching G = K(k) (dévissage), and differs from K_n(X) (K_1(X) = k^× × k).

Acceptance: X = Spec O (a DVR): two columns, d_1 = ∂_S, and the spectral sequence is S.3/dvr-localisation-sequence.

Acceptance: X = P¹_k: E_1^{0,−n} = K_n(k(t)), E_1^{1,−n} = ⊕_x K_{n−1}(k(x)); d_1 is split surjective (the transfers to K_{n−1}(k) and S.3/weil-reciprocity-k-theory), giving G_n(P¹) = K_n(k) ⊕ K_{n−1}(k) (K-book Example V.9.8.2).

-/

/-!
### `SchemeKTheoryOperations:S.5/projective-bundle-theorem`

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Let X be quasi-compact and quasi-separated and Y ⊂ X closed with X − Y quasi-compact. Then u: ∏_{i=0}^{r−1} K(X on Y) → K(P(E) on P(E)_Y), (x_0, …, x_{r−1}) ↦ Σ_{i=0}^{r−1} π^*(x_i) ⊗ [O(−i)], is a natural homotopy equivalence of S.2's non-connective K-theory spectra; in particular K_n(P(E)) ≅ ⊕_{i=0}^{r−1} K_n(X) for all n ∈ ℤ, the i-th summand embedded by x ↦ π^*x ⊗ [O(−i)]. In degree zero: K_0(P(E)) is a free K_0(X)-module (through π^* and ⊗) with basis 1 = [O], [O(−1)], …, [O(−(r−1))]. The generators are the classes of the powers O(−i) = O(−1)^{⊗i} of the tautological line bundle.

Hypotheses: X quasi-compact and quasi-separated; Y ⊂ X closed with X − Y quasi-compact; E of constant rank r ≥ 1.; Rank convention: the K-book writes rank E = r + 1 and the basis [O(−i)], 0 ≤ i ≤ r; Thomason–Trobaugh write rank r and 0 ≤ i ≤ r − 1, as here. EllipticKTheory's request writes ⊕_{i=0}^{r}, i.e. the K-book's convention.

Suppliers/prerequisites: SchemeKTheoryOperations:S.5/projective-bundle-theorem-noetherian, AlgebraicModuliForArithmeticGeometry:R09.1, GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits, AdicCoefficientsAndComparisons:L2, SchemeKTheoryOperations:S.2/k-theory-continuity, SchemeKTheoryOperations:S.2/tensor-product-pairings, SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison, SchemeKTheoryOperations:S.3/support-k-theory, GeneralAlgebraicKTheory:K.6/projective-line-splitting, GeneralAlgebraicKTheory:K.6/nil-groups-are-NK

Acceptance: X = Spec k: K_0(P^{r−1}_k) ≅ ℤ^r with basis [O(−i)], 0 ≤ i ≤ r − 1; K_1(P^{r−1}_k) ≅ (k^×)^r.

Acceptance: E trivial of rank n + 1: K(P^n_X) ≃ K(X)^{n+1}; with S.2's product, K_*(P^n_X) ≅ K_*(X)[z]/(z^{n+1}), z = 1 − [O(−1)] (K-book V.1.5.1 with its exponent corrected to n + 1; K_0(P^n_ℤ) = ℤ[z]/(z^{n+1}), II.8.6).

Acceptance: r = 1: P(E) = X and u = id.

Acceptance: Consumers: EllipticKTheory E.5 (projective line and projective bundles in all degrees), KTheoryLowDegrees Z.6 (the projective-bundle basis of K_0(P¹_F)), EllipticKTheory E.4 (K_1(P¹_F)); for a quasi-projective or divisorial X, K_0(P(E)) is also K_0 of vector bundles (S.2/vector-bundle-k-theory-comparison), which is the K-book's II.8.5.

-/

/-!
### `SchemeKTheoryOperations:S.5/bass-fundamental-theorem`

Let X be quasi-compact and quasi-separated and Z ⊂ X closed with X − Z quasi-compact. For every n ∈ ℤ there is a natural exact sequence 0 → K_n(X on Z) →(p^*, p₋^*) K_n(X[T] on Z[T]) ⊕ K_n(X[T⁻¹] on Z[T⁻¹]) →(j₊^* − j₋^*) K_n(X[T, T⁻¹] on Z[T, T⁻¹]) →(∂_T) K_{n−1}(X on Z) → 0 of S.2's non-connective K-groups, where ∂_T is the Mayer–Vietoris boundary of the cover P¹_X = X[T] ∪ X[T⁻¹] followed by projection of K_{n−1}(P¹_X on P¹_Z) onto the coefficient of [O] − [O(−1)]. It comes from a homotopy fibre sequence of spectra K(X on Z) → K(X[T] on Z[T]) ∪_{K(X on Z)} K(X[T⁻¹] on Z[T⁻¹]) → K(X[T, T⁻¹] on Z[T, T⁻¹]) → ΣK(X on Z). Consequently (Bass contraction) K_{n−1}(X on Z) ≅ coker(K_n(X[T] on Z[T]) ⊕ K_n(X[T⁻¹] on Z[T⁻¹]) → K_n(X[T, T⁻¹] on Z[T, T⁻¹])) naturally, for every n ∈ ℤ.

Hypotheses: X quasi-compact and quasi-separated; Z closed with X − Z quasi-compact (absolute case Z = X).; K is S.2's non-connective K; the proof uses S.4's Zariski Mayer–Vietoris squares and S.3's supports in all degrees, and does not use any comparison with Thomason–Trobaugh's K^B.

Suppliers/prerequisites: SchemeKTheoryOperations:S.5/projective-line-k-theory, SchemeKTheoryOperations:S.5/projective-bundle-theorem, SchemeKTheoryOperations:S.5/laurent-extension-and-nk, SchemeKTheoryOperations:S.4/zariski-mayer-vietoris, SchemeKTheoryOperations:S.2/k-theory-pullback, SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme, mathlib:AlgebraicGeometry.Proj.awayι, mathlib:AlgebraicGeometry.«Proj», SchemeKTheoryOperations:S.3/support-k-theory, SchemeKTheoryOperations:S.3/localisation-fibre-sequence, SchemeKTheoryOperations:S.3/excision

Acceptance: X regular noetherian: NK = 0 and the sequence reduces to S.5/laurent-decomposition-regular.

Acceptance: X = Spec ℤ, n = 1: 0 → {±1} → {±1} ⊕ {±1} → K_1(ℤ[T, T⁻¹]) → ℤ → 0 with K_1(ℤ[T, T⁻¹]) = {±1} × T^ℤ.

Acceptance: n = 0 identifies K_{−1}(X) with coker(K_0(X[T]) ⊕ K_0(X[T⁻¹]) → K_0(X[T, T⁻¹])), Bass's definition of K_{−1} (K-book V.8.3.2, Thomason–Trobaugh 6.2).

Acceptance: For X = Spec R it is GeneralAlgebraicKTheory K.6's ring fundamental theorem (S.5/affine-fundamental-theorem-comparison).

Acceptance: Supplies the geometric fundamental theorem; K.6’s current ring theorem is an input, with no reverse dependency on S.5.

-/

/-!
### `SchemeKTheoryOperations:S.5/affine-fundamental-theorem-comparison`

For X = Spec R with R commutative, under S.2/affine-k-theory-comparison (K(Spec R) ≃ K(R), non-connective, compatible with pullback along ring maps), the exact sequence of S.5/bass-fundamental-theorem is GeneralAlgebraicKTheory K.6's ring fundamental theorem 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t, t⁻¹]) → K_{n−1}(R) → 0, the boundaries agree up to the universal sign ε of S.5/bass-boundary-splitting, h_T(x) = ε·([t] ∪ x), where [t] is the K₁ class of the Laurent unit and ε ∈ {±1} acts on the additive K-group, NK_n(Spec R) = NK_n(R), and the Nil terms are identified by Nil_n(R) ≅ NK_{n+1}(R) (K-book V.8.1). For singular R the Nil terms need not vanish: NK_1(k[ε]) ≅ Nil_0(k[ε]) ≅ (1 + εT·k[T])^×.

Hypotheses: R commutative; K-groups of R are K.6's (Bass's in negative degrees, agreeing with the non-connective K of perfect complexes, GeneralAlgebraicKTheory K.6/agreement-and-vanishing-of-negative-K, ring clause).

Suppliers/prerequisites: SchemeKTheoryOperations:S.5/bass-fundamental-theorem, SchemeKTheoryOperations:S.5/bass-boundary-splitting, SchemeKTheoryOperations:S.5/nk-decomposition, SchemeKTheoryOperations:S.5/laurent-extension-and-nk, SchemeKTheoryOperations:S.2/affine-k-theory-comparison, SchemeKTheoryOperations:S.2/affine-pullback-is-scalar-extension, GeneralAlgebraicKTheory:K.6, GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K, GeneralAlgebraicKTheory:K.6/projective-line-splitting, GeneralAlgebraicKTheory:K.6/nil-groups-are-NK

Acceptance: For R regular noetherian, NK_n(R) = 0 and K_n(R[t, t⁻¹]) ≅ K_n(R) ⊕ K_{n−1}(R) (K-book V.6.3).

Acceptance: For R = k[ε]: NK_1(Spec R) ≅ (1 + εT·k[T])^× ≠ 0, so the four-term decomposition has non-zero Nil terms.

Acceptance: The comparison is compatible with ring maps R → R′.

-/

/-!
### `SchemeKTheoryOperations:S.6/complete-flag-bundle`

Import the complete flag scheme Fl(E) and universal filtration from AlgebraicModuliForArithmeticGeometry R09.1. For its sub-line recursive presentation use P_lines(E)=Proj Sym(E∨), with O(−1)⊂π*E; S.5 instead uses P_quot(E)=Proj Sym(E), with π*E↠O(1). These are related by P_lines(E)=P_quot(E∨). The imported flag filtration gives[f*E]=Σ[L_i] in K₀, and its projective-bundle tower gives the K-theoretic splitting principle.

Hypotheses: E is finite locally free of constant rank on qcqs X, componentwise otherwise.; Quote the supplier geometry; no new projective or flag scheme is constructed in S.6.

Suppliers/prerequisites: SchemeKTheoryOperations:S.5/projective-bundle-theorem, SchemeKTheoryOperations:S.5/projective-bundle-cohomology, AlgebraicModuliForArithmeticGeometry:R09.1

Omitted signature `TauCeti.AlgebraicGeometry.flagBundle` (constructor): Imported R09.1 geometry and its K-theory compatibility: f: Fl(E) → X for a vector bundle E of constant rank.

Omitted signature `TauCeti.AlgebraicGeometry.flagBundle.filtration` (data): Imported R09.1 geometry and its K-theory compatibility: The filtration F_• of f^*E with line bundle quotients L_1, …, L_n.

Omitted signature `TauCeti.AlgebraicGeometry.flagBundle.baseChange` (functoriality): Imported R09.1 geometry and its K-theory compatibility: Fl(g^*E) ≅ X' ×_X Fl(E) compatibly with filtrations.

Omitted signature `TauCeti.AlgebraicGeometry.flagBundle.projective` (structure): Imported R09.1 geometry and its K-theory compatibility: f is smooth, projective and a composite of projective bundles.

Omitted signature `TauCeti.AlgebraicGeometry.flagBundle.lineQuotients_sum` (characterisation): Imported R09.1 geometry and its K-theory compatibility: [f^*E] = Σ[L_i] in K_0(Vect Fl(E)).

Omitted example `flagBundle_line` (degenerate): For E of rank 1, Fl(E) = X and the filtration is 0 ⊂ E.

Omitted example `flagBundle_rank_two` (computation): For rank2, Fl(E)=P_lines(E)=P_quot(E∨); the sub-line filtration has quotient π*det(E)⊗O(1). S.5’s P_quot(E) must not be used without this dualization.

Omitted example `flagBundle_pbt_compat` (compatibility): For rank 2, K_*(Fl(E)) = K_*(X) ⊕ K_*(X)[O(−1)] is S.5/projective-bundle-theorem.

Omitted example `flagBundle_not_grassmannian` (non-example): Fl(O^3) over a field has K_0 free of rank 6 = 3!, while the Grassmannian of lines in k^3 (= P^2) has K_0 of rank 3: the flag bundle is not the Grassmannian.

Acceptance: Fl of a line bundle is X; Fl(O^2) = P^1_X.

Acceptance: For E = O^n on X = Spec k, Fl(E) is the variety of complete flags in k^n, of dimension n(n−1)/2.

-/

/-!
### `SchemeKTheoryOperations:S.1/enhanced-perf-tor-stratum`

For a qcqs scheme X and integers a≤b, Perf^[a,b](X) is the maximal ∞-groupoid of the full subcategory of E1’s enhanced D_QCoh(X) on perfect objects E with H^i(E⊗ᴸM)=0 for every O_X-module M and i outside[a,b]. Perf(X) denotes its entire core when used as a space; D_perf(X) is its homotopy category, not this core.

Hypotheses: Use the enhanced Perf subcategory, not ordinary DerivedCategory as a replacement for mapping spaces.; The amplitude condition is invariant under equivalence and derived pullback.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-enhanced-subcategory, SchemeKTheoryOperations:S.1/tor-amplitude, EnhancedDerivedSheaves:E0, EnhancedDerivedSheaves:E1

Omitted signature `PerfTorStratum` (constructor): Core of enhanced perfect objects with amplitude[a,b].

Omitted signature `PerfTorStratum.pullback` (functoriality): Derived pullback preserves this stratum.

Omitted signature `PerfTorStratum.colimit` (characterisation): Filtered union of finite intervals is the full Perf core.

Omitted signature `PerfTorStratum.homotopyCategory` (compatibility): Underlying homotopy-category object is S.1’s perfect complex.

Omitted example `stratum_field_single` (computation): For a field k, k[0] lies in[0,0], while k[1] lies in[−1,−1] and not[0,0].

Omitted example `stratum_zero` (degenerate): Zero lies in every stratum; on the empty scheme each core is contractible.

Omitted example `stratum_dual_numbers` (non-example): Over k[ε]/ε², k[0] is not perfect and cannot be admitted just because its cohomology is concentrated in degree0.

Omitted example `stratum_vector_bundles` (compatibility): The[0,0] stratum agrees with finite locally free sheaves and their isomorphisms.

Acceptance: For a qcqs scheme X and integers a≤b, Perf^[a,b](X) is the maximal ∞-groupoid of the full subcategory of E1’s enhanced D_QCoh(X) on perfect objects E with H^i(E⊗ᴸM)=0 for every O_X-module M and i outside[a,b]. Perf(X) denotes its entire core when used as a space; D_perf(X) is its homotopy category, not this core.

-/

/-!
### `SchemeKTheoryOperations:S.1/enhanced-perf-truncation`

For perfect E,F of Tor-amplitude[a,b] on any scheme X, Map(E,F) is(b−a)-truncated and the core Perf^[a,b](X) is(b−a+1)-truncated. In particular these are uniform bounds on the affine site basis. A global upper cohomological-dimension bound is unnecessary: RHom has lower bound a−b and derived global sections preserve that lower bound.

Hypotheses: a≤b; the core bound has one additional degree.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/enhanced-perf-tor-stratum, SchemeKTheoryOperations:S.1/perfect-module-complex, EnhancedDerivedSheaves:E0, EnhancedDerivedSheaves:E1

Acceptance: For k a field, Perf^[0,0](k) has π₁ at k equal to k×, disproving a 0-truncated core.

-/

/-!
### `SchemeKTheoryOperations:S.1/residue-fields-detect-perfect-amplitude`

For any commutative ring A and E∈Perf(A), E has Tor-amplitude[a,b] iff E⊗ᴸ_A κ(p) has cohomology only in[a,b] for every prime p. No Noetherian hypothesis is required.

Hypotheses: E is perfect; residue-field tests alone do not make an arbitrary unbounded complex perfect.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-module-complex, SchemeKTheoryOperations:S.1/tor-amplitude, AdicCoefficientsAndComparisons:L2

Acceptance: For any commutative ring A and E∈Perf(A), E has Tor-amplitude[a,b] iff E⊗ᴸ_A κ(p) has cohomology only in[a,b] for every prime p. No Noetherian hypothesis is required.

-/

/-!
### `SchemeKTheoryOperations:S.1/enhanced-perfect-affine-continuity`

For filtered commutative rings A_i with colimit A, the natural enhanced functor colim_i Perf(A_i)→Perf(A) is an equivalence, hence the corresponding cores are equivalent. On qcqs inverse limits with affine transition maps, transport S.1/perfect-complexes-on-limits to E1’s enhancements and their cores.

Hypotheses: Filtered colimit in the ∞-category of small idempotent-complete stable categories, not a colimit of sets of objects.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-complexes-on-limits, SchemeKTheoryOperations:S.1/perfect-enhanced-subcategory, EnhancedDerivedSheaves:E1

Acceptance: For filtered commutative rings A_i with colimit A, the natural enhanced functor colim_i Perf(A_i)→Perf(A) is an equivalence, hence the corresponding cores are equivalent. On qcqs inverse limits with affine transition maps, transport S.1/perfect-complexes-on-limits to E1’s enhancements and their cores.

-/

/-!
### `SchemeKTheoryOperations:S.2/proper-support-coherence-bridge`

Let f:X→Y be locally of finite type with Y Noetherian. If E has bounded coherent cohomology and each H^q(E) has support proper over Y, Rf_*E has bounded coherent cohomology. The ambient f need not be proper or quasi-compact.

Hypotheses: Only finitely many cohomology sheaves occur; factor each separately through a closed subscheme proper over Y.

Suppliers/prerequisites: tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity, SchemeAndStackFoundations:SF.2, SchemeKTheoryOperations:S.1/pseudo-coherent-complex, EnhancedDerivedSheaves:E1

Acceptance: For countably many disjoint affine lines over k and the origin sheaf on just one component, the pushforward is k[0], despite non-quasi-compact ambient f.

-/

/-!
### `SchemeKTheoryOperations:S.2/projective-ambient-perfect-descent`

For projective perfect f:X→Y over an arbitrary scheme and E perfect on X, locally on affine Y choose an immersion i:X→P^n_Y. The ambient complex Ri_*E is perfect. Its descent, along a Noetherian approximation of this smooth projective ambient scheme, yields a perfect Rf_*E without assuming E has coherent cohomology over the original base.

Hypotheses: Projective is an alternative to Noetherian base, not an invitation to use Noetherian coherence on arbitrary Y.; The approximation descends the ambient perfect complex and eventual proper support.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-complexes-on-limits, SchemeKTheoryOperations:S.2/proper-support-coherence-bridge, SchemeKTheoryOperations:S.2/derived-projection-formula, SchemeKTheoryOperations:S.2/derived-tor-independent-base-change, SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor, AdicCoefficientsAndComparisons:L2, AlgebraicModuliForArithmeticGeometry:R09.1, mathlib:TrivSqZeroExt, mathlib:TrivSqZeroExt.inr, mathlib:TrivSqZeroExt.commRing, mathlib:Finsupp.single, mathlib:DistribSMul.toLinearMap, mathlib:Module.Free

Acceptance: For A=k⊕⊕_{n≥0}ke_n with square-zero ideal V, identity pushforward preserves the strict perfect complex A --e₀--> A in degrees−1,0, although H^(−1)=V is not finitely generated.

-/

/-!
### `SchemeKTheoryOperations:S.2/negative-g-theory-vanishing`

For a Noetherian scheme X, the nonconnective K-spectrum of its coherent sheaves has G_i(X)=0 for all i<0. Consequently negative K_i(X)=0 for regular Noetherian X by the Cartan equivalence. No finite global dimension or finite Krull-dimension bound is required for these scheme statements.

Hypotheses: Use a small skeleton of Coh(X), a Noetherian abelian category, and K.6’s general theorem.

Suppliers/prerequisites: SchemeKTheoryOperations:S.2/g-theory-of-a-scheme, SchemeKTheoryOperations:S.2/cartan-equivalence, GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K

Acceptance: For a Noetherian scheme X, the nonconnective K-spectrum of its coherent sheaves has G_i(X)=0 for all i<0. Consequently negative K_i(X)=0 for regular Noetherian X by the Cartan equivalence. No finite global dimension or finite Krull-dimension bound is required for these scheme statements.

-/

/-!
### `SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes`

For a perfect F_p-algebra R, Perf(W(R) on R) is the enhanced category of perfect W(R)-complexes acyclic after inverting p; K(W(R) on R) is its connective K-spectrum, with the nonconnective version separately supplied by S.3. For a perfect qcqs scheme X, W_n(X) is the Witt thickening and W(X)=colim_n W_n(X) is the p-adic formal scheme in BS17. Define Perf(W(X) on X) by gluing these affine p-supported categories. The affine model uses Spec W(R) and V(p); W(X) itself is not asserted to be an ordinary scheme. Support at p=0 is distinct from all perfect complexes on W(X).

Hypotheses: p is prime and R perfect of characteristic p; W(R) is p-torsion-free and p-adically complete.; No regularity hypothesis is imposed on R.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/perfect-complexes-with-support, SchemeKTheoryOperations:S.3/support-k-theory, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4, EnhancedDerivedSheaves:E4

Omitted signature `WittSupport.Perf` (constructor): Full enhanced support category.

Omitted signature `WittSupport.K` (data): K of this category.

Omitted signature `WittSupport.pullback` (functoriality): Base change along a perfect F_p-algebra map.

Omitted signature `WittSupport.localization` (compatibility): Its nonconnective spectrum is the fibre of 𝕂(W(R))→𝕂(W(R)[1/p]); this fibre statement is not imposed on connective K without the K₀ surjectivity condition.

Omitted signature `WittSupport.affine` (compatibility): Matches S.3/perfect-with-support on Spec W(R) with closed subset V(p).

Omitted example `witt_support_field` (computation): W(k)/p^m for a perfect field k and m≥1 is perfect supported at p, represented by Cone(p^m).

Omitted example `witt_support_zero` (degenerate): The zero complex is supported; m=0 gives Cone(1), the zero object.

Omitted example `witt_support_unit` (non-example): W(k)[0] is perfect but not supported at p; W(k)[1/p] is nonzero.

Omitted example `witt_support_singular_R` (compatibility): For perfect singular R, support does not mean every finite R-module is perfect over R.

Acceptance: On Spec R the category agrees with the supported perfect category of Spec W(R) on V(p).

Acceptance: W(k)/p^m is supported for m≥1, but W(k)[0] is not.

Acceptance: W(X) is the formal colimit of W_n(X); global descent must glue affine complete perfect models, not assume W(X) is an ordinary scheme.

-/

/-!
### `SchemeKTheoryOperations:S.3/witt-special-fibre-k-map`

For perfect F_p-algebras R, pushforward along i:Spec R→Spec W(R) induces α_R:K(R)→K(W(R) on R). R=W(R)/p is a perfect W(R)-module represented by Cone(p), so restriction of scalars sends Perf(R) into the supported category. These maps are natural in R and glue on perfect qcqs schemes.

Hypotheses: Use the quotient map W(R)→R, not an assumed ring section R→W(R).

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes, SchemeKTheoryOperations:S.2/k-theory-of-a-scheme, SchemeKTheoryOperations:S.1/perfect-module-complex, GeneralAlgebraicKTheory:K.4

Omitted signature `WittSupport.alpha` (constructor): Map K(R)→K(W(R) on R).

Omitted signature `WittSupport.alpha_pullback` (functoriality): Naturality under maps of perfect F_p-algebras.

Omitted signature `WittSupport.alpha_unit` (simp): The class of R maps to Cone(p).

Omitted signature `WittSupport.alpha_support_model` (compatibility): Agrees with S.3’s supported restriction-of-scalars functor.

Omitted example `alpha_field` (computation): For perfect field k, α sends[k] to[W(k)/p] and dévissage identifies K(k) with supported K.

Omitted example `alpha_zero` (degenerate): α sends zero to zero; its map on the empty scheme is the unique map of contractible spectra.

Omitted example `alpha_no_ring_section` (non-example): For R=F_p there is no unital ring map F_p→W(F_p)=ℤ_p. The construction must use pushforward, not scalar extension along such a section.

Omitted example `alpha_change_coefficients` (compatibility): For perfect fields k→l, base change carries Cone(p over W(k)) to Cone(p over W(l)).

Acceptance: For perfect F_p-algebras R, pushforward along i:Spec R→Spec W(R) induces α_R:K(R)→K(W(R) on R). R=W(R)/p is a perfect W(R)-module represented by Cone(p), so restriction of scalars sends Perf(R) into the supported category. These maps are natural in R and glue on perfect qcqs schemes.

-/

/-!
### `SchemeKTheoryOperations:S.3/derived-closed-base-change-excision`

Let π:Y→X be a qcqs morphism of qcqs algebraic spaces and Z⊂X a finitely presented closed subspace. If Z×ᴸ_XY→Z is an equivalence, pullback gives D_Z(X)≃D_π⁻¹Z(Y) and Perf_Z(X)≃Perf_π⁻¹Z(Y), hence equivalence on supported K. In particular completion is invariant when its derived closed fibre is unchanged. For p-torsion-free rings A, ordinary p-adic completion has this property at V(p).

Hypotheses: Finite presentation of Z and the derived fibre condition are essential.; Classical isomorphism of closed fibres alone does not establish the Tor comparison.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/supported-perfect-generator, SchemeKTheoryOperations:S.2/perfect-iff-compact, SchemeKTheoryOperations:S.2/k-theory-model-invariance, DerivedDeRhamCohomology:DD.1

Acceptance: Let π:Y→X be a qcqs morphism of qcqs algebraic spaces and Z⊂X a finitely presented closed subspace. If Z×ᴸ_XY→Z is an equivalence, pullback gives D_Z(X)≃D_π⁻¹Z(Y) and Perf_Z(X)≃Perf_π⁻¹Z(Y), hence equivalence on supported K. In particular completion is invariant when its derived closed fibre is unchanged. For p-torsion-free rings A, ordinary p-adic completion has this property at V(p).

-/

/-!
### `SchemeKTheoryOperations:S.3/frobenius-lift-supported-comparison`

Let A₀ be a p-torsion-free p-adically complete ring with a Frobenius lift φ reducing to Frobenius on R₀=A₀/p. Put R=colim_F R₀, A∞=colim_φ A₀, and let its p-adic completion be identified with W(R). Then Perf(A∞ on V(p))≃Perf(W(R) on R), and K(W(R) on R)≃colim_φ K(A₀ on V(p)).

Hypotheses: The lift and the identification of its completed colimit with W(R) are supplied coefficient mathematics.; This does not claim that every regular F_p-algebra admits a Frobenius lift.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/derived-closed-base-change-excision, SchemeKTheoryOperations:S.1/enhanced-perfect-affine-continuity, SchemeKTheoryOperations:S.2/k-theory-continuity, SchemeAndStackFoundations:SF.4

Acceptance: Let A₀ be a p-torsion-free p-adically complete ring with a Frobenius lift φ reducing to Frobenius on R₀=A₀/p. Put R=colim_F R₀, A∞=colim_φ A₀, and let its p-adic completion be identified with W(R). Then Perf(A∞ on V(p))≃Perf(W(R) on R), and K(W(R) on R)≃colim_φ K(A₀ on V(p)).

-/

/-!
### `SchemeKTheoryOperations:S.3/witt-regular-perfection-devissage`

If R₀ is any regular F_p-algebra (regular here means Noetherian with regular local rings) and R=colim_F R₀, α_R:K(R)→K(W(R) on R) is an equivalence. Neither R nor W(R) is assumed Noetherian, and no finite-dimensional bound is imposed on R₀.

Hypotheses: For smooth finite-type R₀ the lift argument applies; the passage to arbitrary regular R₀ needs Popescu approximation.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/witt-special-fibre-k-map, SchemeKTheoryOperations:S.3/frobenius-lift-supported-comparison, SchemeKTheoryOperations:S.3/regular-support-devissage, SchemeKTheoryOperations:S.2/cartan-equivalence, SchemeKTheoryOperations:S.2/k-theory-continuity, SchemeAndStackFoundations:SF.0

Acceptance: If R₀ is any regular F_p-algebra (regular here means Noetherian with regular local rings) and R=colim_F R₀, α_R:K(R)→K(W(R) on R) is an equivalence. Neither R nor W(R) is assumed Noetherian, and no finite-dimensional bound is imposed on R₀.

-/

/-!
### `SchemeKTheoryOperations:S.3/witt-quasi-isogeny-exact-category`

For a perfect F_p-algebra R, C_R has objects(E₁,E₂,β) with E₁,E₂ finite projective W(R)-modules and β:E₁[1/p]≃E₂[1/p]. A morphism is a pair of W(R)-linear maps commuting with β after p-inversion. Conflations are componentwise short exact sequences of finite projectives; the two sequences split as module sequences, but need not split compatibly with β. Its K-theory imports the exact-category machinery.

Hypotheses: β need not be integral or injective as a W(R)-linear map; it is defined after inversion.; The full K-spectrum of C_R is not asserted equivalent to K(R); Zhu RemarkB.3 asks how they are related.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-module-complex, GeneralAlgebraicKTheory:K.3, GeneralAlgebraicKTheory:K.4, GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction

Omitted signature `WittQuasiIsogeny` (constructor): Triple of finite projectives and a localized isomorphism.

Omitted signature `WittQuasiIsogeny.Hom` (data): Pairs commuting with β after inversion.

Omitted signature `WittQuasiIsogeny.exact` (structure): Componentwise short exact conflations.

Omitted signature `WittQuasiIsogeny.forget₁` (functoriality): Exact functor to finite projective W(R)-modules.

Omitted signature `WittQuasiIsogeny.baseChange` (functoriality): Base change along perfect-ring maps.

Omitted example `quasi_isogeny_fractional` (computation): (W(k),W(k),p^(−1)) is an object despite having no integral map β.

Omitted example `quasi_isogeny_zero` (degenerate): (0,0,identity) is the zero object.

Omitted example `quasi_isogeny_identity_not_zero` (non-example): (W(k),W(k),identity) has nonzero class detected by rank after forget₁; a zero supported class does not make the original exact-category K₀ class zero.

Omitted example `quasi_isogeny_integral` (compatibility): An integral β is an object exactly when it becomes invertible after p-inversion, compatibly with the support of its cone.

Acceptance: For a perfect F_p-algebra R, C_R has objects(E₁,E₂,β) with E₁,E₂ finite projective W(R)-modules and β:E₁[1/p]≃E₂[1/p]. A morphism is a pair of W(R)-linear maps commuting with β after p-inversion. Conflations are componentwise short exact sequences of finite projectives; the two sequences split as module sequences, but need not split compatibly with β. Its K-theory imports the exact-category machinery.

-/

/-!
### `SchemeKTheoryOperations:S.3/witt-quasi-isogeny-supported-class`

For(E₁,E₂,β)∈C_R choose m≥0 such that p^mβ:E₁→E₂ is integral. Define c(β)=[Cone(p^mβ)]−[Cone(p^m:E₁→E₁)]∈K₀(W(R) on R). It is independent of m, additive on conflations, natural under perfect-ring base change, and satisfies c(γβ)=c(γ)+c(β). It defines a homomorphism K₀(C_R)→K₀(W(R) on R), not a chosen functor on full K-spectra.

Hypotheses: The subtraction is essential for fractional β. All cones become acyclic after p-inversion.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/witt-quasi-isogeny-exact-category, SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes, SchemeKTheoryOperations:S.3/support-k-theory, tauceti:TauCeti.ExactK0, tauceti:TauCeti.ExactK0.lift

Omitted signature `WittQuasiIsogeny.supportClass` (constructor): Normalized virtual cone class.

Omitted signature `supportClass_independent_denominator` (characterisation): Any integralizing exponent gives the same class.

Omitted signature `supportClass_comp` (relation): c(γβ)=c(γ)+c(β).

Omitted signature `supportClass_exactK0` (compatibility): Homomorphism defined by TauCeti.ExactK0.lift.

Omitted signature `supportClass_pullback` (functoriality): Compatible with base change.

Omitted example `support_class_p` (computation): For perfect field k and β=p^r on W(k), r∈ℤ, c(β)=r[k] under supported dévissage; β=p^(−1) gives−[k].

Omitted example `support_class_identity` (degenerate): c(identity)=0 although the triple’s class in K₀(C_k) is nonzero.

Omitted example `support_class_denominator` (non-example): For β=identity and m=1 both cones have class[k], so their difference is0. The unnormalized cone would give the wrong answer.

Omitted example `support_class_integral` (compatibility): For an integral isogeny β, m=0 yields the ordinary supported cone class.

Acceptance: For(E₁,E₂,β)∈C_R choose m≥0 such that p^mβ:E₁→E₂ is integral. Define c(β)=[Cone(p^mβ)]−[Cone(p^m:E₁→E₁)]∈K₀(W(R) on R). It is independent of m, additive on conflations, natural under perfect-ring base change, and satisfies c(γβ)=c(γ)+c(β). It defines a homomorphism K₀(C_R)→K₀(W(R) on R), not a chosen functor on full K-spectra.

-/

/-!
### `SchemeKTheoryOperations:S.3/ramified-witt-supported-restriction`

Let O_K be a complete mixed-characteristic DVR with perfect residue field k, finite free of ramification degree e over W(k), and R a perfect k-algebra. Import W_{O_K}(R)=W(R)⊗_{W(k)}O_K. Restriction of scalars gives Perf(W_{O_K}(R) on R)→Perf(W(R) on R) and the corresponding K-map, because the coefficient ring is finite free over W(R) and π-inversion and p-inversion have the same support.

Hypotheses: p=uπ^e; assume the stated finite-free coefficient presentation. Arbitrary Cohen coefficient choices are not implicit.

Suppliers/prerequisites: RelativeFarguesFontaine:RF0/ramified-witt-universal-property, SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes, GeneralAlgebraicKTheory:K.4

Omitted signature `RamifiedWittSupport.restrict` (constructor): Exact restriction of supported perfect complexes.

Omitted signature `RamifiedWittSupport.Kmap` (data): Induced map of supported K-spectra.

Omitted signature `RamifiedWittSupport.baseChange` (functoriality): Restriction commutes with perfect k-algebra base change.

Omitted signature `RamifiedWittSupport.unramified` (compatibility): For e=1 this is the ordinary supported identity comparison.

Omitted example `ramified_restrict_pi` (computation): For R=k, O_K/π restricts to W(k)/p and has Witt-support degree1.

Omitted example `ramified_restrict_p` (computation): O_K/p has filtration length e and its restricted supported degree is e, not[e:Q_p].

Omitted example `ramified_restrict_zero` (degenerate): Zero restricts to zero; e=1 with O_K=W(k) yields the identity.

Omitted example `ramified_restrict_not_support` (non-example): O_K[0] is perfect after restriction but not supported at p; it must not be admitted to the supported source.

Acceptance: Let O_K be a complete mixed-characteristic DVR with perfect residue field k, finite free of ramification degree e over W(k), and R a perfect k-algebra. Import W_{O_K}(R)=W(R)⊗_{W(k)}O_K. Restriction of scalars gives Perf(W_{O_K}(R) on R)→Perf(W(R) on R) and the corresponding K-map, because the coefficient ring is finite free over W(R) and π-inversion and p-inversion have the same support.

-/

/-!
### `SchemeKTheoryOperations:S.4/perfect-scheme-h-and-v-sites`

On qcqs perfect F_p-schemes, a v-cover is a qcqs map for which every map from a valuation-ring spectrum lifts after extension of the valuation ring. The v-topology is generated by these maps. The h-topology is generated by perfectly finitely presented v-covers, equivalently refinements of perfections of finite-presentation h-covers. These are scheme sites; the perfectoid v-site is a different carrier.

Hypotheses: Use perfect schemes in characteristic p and qcqs covering maps.; Perfectly finitely presented means descended from a finitely presented map before perfection.

Suppliers/prerequisites: SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4, mathlib:CategoryTheory.GrothendieckTopology

Omitted signature `PerfectScheme.vTopology` (constructor): Valuation-lifting coverage and generated topology.

Omitted signature `PerfectScheme.hTopology` (constructor): Topology from perfectly finitely presented v-covers.

Omitted signature `PerfectScheme.h_le_v` (relation): Every h-cover is a v-cover.

Omitted signature `PerfectScheme.vCover_approximation` (characterisation): Affine v-covers are inverse limits of finite-presentation h-covers.

Omitted signature `PerfectScheme.cover_baseChange` (functoriality): Both cover classes are stable under pullback.

Omitted example `perfect_sites_identity` (computation): Identity and finite Zariski covers are h- and v-covers.

Omitted example `perfect_sites_empty` (degenerate): Empty covers the empty scheme; empty→a nonempty perfect field spectrum is not a cover.

Omitted example `perfect_sites_finite_map` (compatibility): Perfection of a proper surjective finite-presentation map is an h-cover, even when it is not étale.

Omitted example `perfect_sites_open_noncover` (non-example): D(t)→Spec F_p[t^(1/p∞)] is not a v-cover: the closed point t=0 has no lift.

Acceptance: On qcqs perfect F_p-schemes, a v-cover is a qcqs map for which every map from a valuation-ring spectrum lifts after extension of the valuation ring. The v-topology is generated by these maps. The h-topology is generated by perfectly finitely presented v-covers, equivalently refinements of perfections of finite-presentation h-covers. These are scheme sites; the perfectoid v-site is a different carrier.

-/

/-!
### `SchemeKTheoryOperations:S.4/noetherian-h-detection-of-perfectness`

Let f:Y→X be an h-cover of Noetherian schemes and E∈D_QCoh(X). If Lf*E is perfect, E is perfect; the same statement holds for pseudo-coherence. The pullback is derived. This detects an existing object and does not itself prove effectiveness of descent data.

Hypotheses: Classical Noetherian schemes and finite-presentation h-covers; no unrestricted non-Noetherian or hypercomplete assertion.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/perfect-iff-pseudo-coherent-finite-tor, SchemeKTheoryOperations:S.1/residue-fields-detect-perfect-amplitude, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2

Acceptance: Let f:Y→X be an h-cover of Noetherian schemes and E∈D_QCoh(X). If Lf*E is perfect, E is perfect; the same statement holds for pseudo-coherence. The pullback is derived. This detects an existing object and does not itself prove effectiveness of descent data.

-/

/-!
### `SchemeKTheoryOperations:S.4/noetherian-derived-h-descent`

For an h-cover f:Y→X of classical Noetherian schemes, the enhanced D_QCoh(X) is the limit of D_QCoh(Y^•/X) on the derived Čech nerve. Passage to perfect or pseudo-coherent objects gives the corresponding descent statements. This theorem does not extend to all quasi-coherent complexes on arbitrary derived schemes, and no hypercompleteness is asserted here.

Hypotheses: Use derived fibre products. Replacing them by ordinary fibre products before perfection loses Tor information.

Suppliers/prerequisites: EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2, SchemeKTheoryOperations:S.1/perfect-enhanced-subcategory, SchemeKTheoryOperations:S.4/noetherian-h-detection-of-perfectness

Acceptance: Use the derived Čech nerve even when X and Y are classical.

Acceptance: The same descent statement holds for perfect and pseudo-coherent objects by h-local detection.

Acceptance: BS17 Remark11.13: A=Sym_C(C[2])→π₀A=C is an h-cover on underlying schemes, but D(A)→D(C) kills the nonzero A[u⁻¹]; thus unrestricted derived-scheme D_QCoh h-descent is false.

-/

/-!
### `SchemeKTheoryOperations:S.4/perfect-scheme-derived-h-descent`

On qcqs perfect F_p-schemes, X↦D_QCoh(X) is an h-sheaf of spaces underlying symmetric monoidal ∞-categories. Consequently X↦Perf(X), its dualizable-object core, is an h-sheaf.

Hypotheses: No claim here of hypercomplete D_QCoh on all perfect schemes; BS17 Theorem11.2(4) has narrower base hypotheses.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/perfect-scheme-h-and-v-sites, SchemeKTheoryOperations:S.4/noetherian-derived-h-descent, EnhancedDerivedSheaves:E1, EnhancedDerivedSheaves:E2, SchemeAndStackFoundations:SF.4

Acceptance: On qcqs perfect F_p-schemes, X↦D_QCoh(X) is an h-sheaf of spaces underlying symmetric monoidal ∞-categories. Consequently X↦Perf(X), its dualizable-object core, is an h-sheaf.

-/

/-!
### `SchemeKTheoryOperations:S.4/perfect-v-hyperdescent`

On qcqs perfect F_p-schemes, the space-valued functor X↦Perf(X) is a hypercomplete v-sheaf. For any v-hypercover X^•→S, Perf(S)≃lim Perf(X^•), compatibly with the enhanced perfect categories.

Hypotheses: Perf means the maximal ∞-groupoid, not a set of isomorphism classes.; This does not imply hyperdescent for algebraic K-theory or for Perf on arbitrary derived/nonreduced schemes.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/perfect-scheme-derived-h-descent, SchemeKTheoryOperations:S.1/enhanced-perf-tor-stratum, SchemeKTheoryOperations:S.1/enhanced-perf-truncation, SchemeKTheoryOperations:S.1/residue-fields-detect-perfect-amplitude, SchemeKTheoryOperations:S.1/enhanced-perfect-affine-continuity, EnhancedDerivedSheaves:E2

Acceptance: On qcqs perfect F_p-schemes, the space-valued functor X↦Perf(X) is a hypercomplete v-sheaf. For any v-hypercover X^•→S, Perf(S)≃lim Perf(X^•), compatibly with the enhanced perfect categories.

-/

/-!
### `SchemeKTheoryOperations:S.4/truncated-witt-v-hyperdescent`

On qcqs perfect F_p-schemes, X↦Perf(W_n(X)) is a hypercomplete v-sheaf of spaces. For each v-hypercover X^•→S, its value at S is equivalent to the limit of its values on X^•. This is a separate assertion from Perf(X) hyperdescent.

Hypotheses: For truncated Witt vectors n≥1 is fixed.; Witt carriers and their gluing are imported; their homotopy categories alone do not specify these spaces.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/perfect-v-hyperdescent, SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes, SchemeAndStackFoundations:SF.4, EnhancedDerivedSheaves:E4, EnhancedDerivedSheaves:E2

Acceptance: On qcqs perfect F_p-schemes, X↦Perf(W_n(X)) is a hypercomplete v-sheaf of spaces. For each v-hypercover X^•→S, its value at S is equivalent to the limit of its values on X^•. This is a separate assertion from Perf(X) hyperdescent.

-/

/-!
### `SchemeKTheoryOperations:S.4/witt-v-hyperdescent`

On qcqs perfect F_p-schemes, X↦Perf(W(X)) is a hypercomplete v-sheaf of spaces. For each v-hypercover X^•→S, its value at S is equivalent to the limit of its values on X^•. This is a separate assertion from Perf(X) hyperdescent.

Hypotheses: For truncated Witt vectors n≥1 is fixed.; Witt carriers and their gluing are imported; their homotopy categories alone do not specify these spaces.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/perfect-v-hyperdescent, SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes, SchemeAndStackFoundations:SF.4, EnhancedDerivedSheaves:E4, EnhancedDerivedSheaves:E2

Acceptance: On qcqs perfect F_p-schemes, X↦Perf(W(X)) is a hypercomplete v-sheaf of spaces. For each v-hypercover X^•→S, its value at S is equivalent to the limit of its values on X^•. This is a separate assertion from Perf(X) hyperdescent.

-/

/-!
### `SchemeKTheoryOperations:S.4/supported-witt-v-hyperdescent`

On qcqs perfect F_p-schemes, X↦Perf(W(X) on X) is a hypercomplete v-sheaf of spaces. For each v-hypercover X^•→S, its value at S is equivalent to the limit of its values on X^•. This is a separate assertion from Perf(X) hyperdescent.

Hypotheses: For truncated Witt vectors n≥1 is fixed.; Witt carriers and their gluing are imported; their homotopy categories alone do not specify these spaces.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/perfect-v-hyperdescent, SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes, SchemeAndStackFoundations:SF.4, EnhancedDerivedSheaves:E4, EnhancedDerivedSheaves:E2

Acceptance: On qcqs perfect F_p-schemes, X↦Perf(W(X) on X) is a hypercomplete v-sheaf of spaces. For each v-hypercover X^•→S, its value at S is equivalent to the limit of its values on X^•. This is a separate assertion from Perf(X) hyperdescent.

-/

/-!
### `SchemeKTheoryOperations:S.4/witt-k-one-truncation-sheafification`

On perfect qcqs F_p-schemes, α:K(X)→K(W(X) on X) induces an equivalence after h-sheafification of τ≤1, and therefore after v-sheafification of τ≤1. The resulting sheaf agrees with the graded Picard groupoid via the determinant comparison supplied by its owner. This asserts equivalence of low truncations after sheafification, not equivalence of full K spectra at every X.

Hypotheses: τ≤1 is the groupoid truncation of the connective K space/spectrum interface.; The determinant and Picard construction belong to their existing owner; only the support comparison is here.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/witt-regular-perfection-devissage, SchemeKTheoryOperations:S.4/perfect-scheme-h-and-v-sites, SchemeAndStackFoundations:SF.4, KTheoryLowDegrees:Z.3/graded-line-groupoid, KTheoryLowDegrees:Z.3/zariski-sheafified-det, KTheoryLowDegrees:Z.3/graded-pic-v-descent, SchemeKTheoryOperations:S.2/affine-k-theory-comparison

Acceptance: On perfect qcqs F_p-schemes, α:K(X)→K(W(X) on X) induces an equivalence after h-sheafification of τ≤1, and therefore after v-sheafification of τ≤1. The resulting sheaf agrees with the graded Picard groupoid via the determinant comparison supplied by its owner. This asserts equivalence of low truncations after sheafification, not equivalence of full K spectra at every X.

-/

/-!
### `SchemeKTheoryOperations:S.4/witt-support-degree`

For perfect qcqs X, define deg:K₀(W(X) on X)→H⁰(X,ℤ_lc) by the inverse of the sheafified τ≤1 α comparison followed by the locally constant rank of K₀(X). For a supported perfect complex, this is a locally constant integer-valued function, compatible with pullback and additive in triangles. It does not choose a global inverse of α_X on unsheafified K.

Hypotheses: Use the sheafified comparison; ℤ_lc denotes the locally constant integer sheaf.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/witt-k-one-truncation-sheafification, SchemeKTheoryOperations:S.3/witt-special-fibre-k-map, KTheoryLowDegrees:Z.2/rank-hom

Omitted signature `WittSupport.degree` (constructor): Supported K₀ to locally constant ℤ.

Omitted signature `WittSupport.degree_triangle` (relation): Degree is additive in distinguished triangles.

Omitted signature `WittSupport.degree_pullback` (functoriality): Degree commutes with perfect-scheme base change.

Omitted signature `WittSupport.degree_alpha` (compatibility): Degree of α(E) is the locally constant rank of E.

Omitted example `witt_degree_field_length` (computation): deg(W(k)/p^m)=m for perfect k and m≥0.

Omitted example `witt_degree_identity` (degenerate): Zero and the identity quasi-isogeny have degree0.

Omitted example `witt_degree_fractional` (non-example): The virtual quasi-isogeny β=p^(−1) has degree−1; degree is not an unsigned torsion length.

Omitted example `witt_degree_components` (compatibility): For R=k×k, classes of lengths1 and2 on the two components have degree function(1,2), not one integer.

Acceptance: For perfect qcqs X, define deg:K₀(W(X) on X)→H⁰(X,ℤ_lc) by the inverse of the sheafified τ≤1 α comparison followed by the locally constant rank of K₀(X). For a supported perfect complex, this is a locally constant integer-valued function, compatible with pullback and additive in triangles. It does not choose a global inverse of α_X on unsheafified K.

-/

/-!
### `SchemeKTheoryOperations:S.4/nisnevich-distinguished-square-criterion`

A presheaf of spectra F on qcqs schemes is a Nisnevich sheaf iff F(∅) is a zero spectrum and it takes every elementary distinguished square to a homotopy pullback. The square’s representables define Mathlib’s MayerVietorisSquare after Nisnevich sheafification. This is Čech sheaf descent, with no automatic hypercompleteness over arbitrary qcqs bases.

Hypotheses: Use the finitely presented étale/quasi-compact open basis in S.4/nisnevich-site.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/nisnevich-site, mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare, EnhancedDerivedSheaves:E2, StableHomotopyKTheory:H.5:spectra

Acceptance: Representable sheaves satisfy the criterion. A nonzero constant value at ∅ violates the empty-cover condition even if every square is cartesian.

-/

/-!
### `SchemeKTheoryOperations:S.5/scheme-nonconnective-agreement`

For qcqs X, Schlichting’s IK-spectrum of S.2 and TT’s K^B spectrum have naturally identified groups in degrees i≤0; together with their common connective K-theory this gives the canonical model comparison once its spectrum compatibility is supplied. This statement includes schemes, whereas K.6/agreement-and-vanishing-of-negative-K owns only the ring/additive-category theorem.

Hypotheses: The scheme projective-bundle and Bass fundamental theorems are proved before this comparison and never use it as an input.

Suppliers/prerequisites: SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme, SchemeKTheoryOperations:S.5/projective-bundle-theorem, SchemeKTheoryOperations:S.5/bass-fundamental-theorem, GeneralAlgebraicKTheory:K.6/agreement-and-vanishing-of-negative-K

Acceptance: For qcqs X, Schlichting’s IK-spectrum of S.2 and TT’s K^B spectrum have naturally identified groups in degrees i≤0; together with their common connective K-theory this gives the canonical model comparison once its spectrum compatibility is supplied. This statement includes schemes, whereas K.6/agreement-and-vanishing-of-negative-K owns only the ring/additive-category theorem.

-/

/-!
### `SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison`

GS87’s K₀^Y(X) is generated by globally bounded vector-bundle complexes acyclic off Y, modulo short exact sequences and quasi-isomorphisms. For separated Noetherian regular finite-dimensional X with the resolution property, this group identifies with S.3’s TT K₀(X on Y), and by regular dévissage with G₀(Y). Without the resolution property use TT’s local-perfect model; do not claim global strict representatives merely from regularity.

Hypotheses: Y is closed. The resolution property is explicitly needed for the global strict/TT comparison.; The regular TT Cartan/support comparison has greater generality and is kept separately.

Suppliers/prerequisites: SchemeKTheoryOperations:S.1/resolution-property-strict-representatives, SchemeKTheoryOperations:S.3/support-k-theory, SchemeKTheoryOperations:S.3/regular-support-devissage

Acceptance: GS87’s K₀^Y(X) is generated by globally bounded vector-bundle complexes acyclic off Y, modulo short exact sequences and quasi-isomorphisms. For separated Noetherian regular finite-dimensional X with the resolution property, this group identifies with S.3’s TT K₀(X on Y), and by regular dévissage with G₀(Y). Without the resolution property use TT’s local-perfect model; do not claim global strict representatives merely from regularity.

-/

/-!
### `SchemeKTheoryOperations:S.6/supported-degree-zero-adams-operations`

For a separated Noetherian regular finite-dimensional scheme X with the resolution property and closed supports Y,Z, construct special λ-operations on ⊕_Y K₀^Y(X) in GS87’s strict model and Adams ψ^k for k≥1. Transport to TT K₀ via the strict-support comparison. ψ^k is additive, respects pullback and support enlargement, and ψ^k(x∪y)=ψ^k(x)∪ψ^k(y) in K₀^(Y∩Z)(X). For a length-r regular-sequence Koszul class ψ^k[K]=k^r[K]. The extension to arbitrary regular separated finite-dimensional X is a gluing target with an explicit gap.

Hypotheses: These degree-zero operations have an independent GS87 proof; their multiplicativity does not require the unproved Hiller higher-operation input.; Do not rebuild the special λ-ring identities owned by Z.3.

Suppliers/prerequisites: SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison, SchemeKTheoryOperations:S.6/support-product-pairings, KTheoryLowDegrees:Z.3, EnhancedDerivedSheaves:E1

Omitted signature `SupportK0.lambda` (constructor): Degree-zero operations on supported strict models.

Omitted signature `SupportK0.adams` (constructor): Newton Adams operations.

Omitted signature `SupportK0.adams_cup` (relation): ψ^k(x∪y)=ψ^k(x)∪ψ^k(y), with intersected support.

Omitted signature `SupportK0.adams_support_enlarge` (functoriality): Support enlargement commutes with ψ.

Omitted signature `SupportK0.adams_koszul` (simp): Regular-sequence length r gives ψ^k[K]=k^r[K].

Omitted signature `SupportK0.adams_tt` (compatibility): Transport agrees with the degree-zero TT support model where strict comparison holds.

Omitted example `support_adams_dvr` (computation): For a DVR parameter π, ψ^k[Cone(π)]=k[Cone(π)] in supported K₀.

Omitted example `support_adams_zero` (degenerate): ψ¹ is identity and ψ^k(0)=0; empty support has zero group.

Omitted example `support_adams_two_parameters` (computation): For k[x,y] supported at the origin, ψ^k[K(x,y)]=k²[K(x,y)], detecting a missing codimension shift.

Omitted example `support_adams_vector_bundle` (compatibility): For a line bundle L without a smaller support, ψ^k[L]=[L^⊗k], agreeing with Z.3’s λ-ring Adams operation.

Acceptance: For a separated Noetherian regular finite-dimensional scheme X with the resolution property and closed supports Y,Z, construct special λ-operations on ⊕_Y K₀^Y(X) in GS87’s strict model and Adams ψ^k for k≥1. Transport to TT K₀ via the strict-support comparison. ψ^k is additive, respects pullback and support enlargement, and ψ^k(x∪y)=ψ^k(x)∪ψ^k(y) in K₀^(Y∩Z)(X). For a length-r regular-sequence Koszul class ψ^k[K]=k^r[K]. The extension to arbitrary regular separated finite-dimensional X is a gluing target with an explicit gap.

-/

/-!
### `SchemeKTheoryOperations:S.6/supported-codimension-filtration`

For separated Noetherian regular X of finite Krull dimension d and closed Y⊂X, identify the existing S.4 support-tower filtration in degree zero with F^p K₀^Y(X): the subgroup generated by images of K₀^Z(X), where Z⊂Y has ambient codimension at least p. Thus F⁰=K₀^Y(X), F^(d+1)=0, and support enlargement Y⊂Y′ preserves F^p. Codimension is measured in X, not relative to Y.

Hypotheses: Use TT’s support group generally; compare GS87’s strict model when the resolution property holds.

Suppliers/prerequisites: SchemeKTheoryOperations:S.4/codimension-support-filtration, SchemeKTheoryOperations:S.3/regular-support-devissage, SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison

Acceptance: For separated Noetherian regular X of finite Krull dimension d and closed Y⊂X, identify the existing S.4 support-tower filtration in degree zero with F^p K₀^Y(X): the subgroup generated by images of K₀^Z(X), where Z⊂Y has ambient codimension at least p. Thus F⁰=K₀^Y(X), F^(d+1)=0, and support enlargement Y⊂Y′ preserves F^p. Codimension is measured in X, not relative to Y.

-/

/-!
### `SchemeKTheoryOperations:S.6/supported-codimension-weight-splitting`

For separated Noetherian regular finite-dimensional X and closed Y, F^p K₀^Y(X)⊗ℚ is the sum of rational Adams weight spaces of weights q≥p, with 0≤q≤dim X. Every ψ^k, k≥2, acts by k^p on Gr_F^p⊗ℚ. The GS strict-model proof transports under the resolution property; extension to general TT locally perfect X requires the recorded operations/gluing bridge.

Hypotheses: The finite weight bound permits polynomial projectors with rational denominators.; This is codimension filtration on degree-zero supported K, distinct from the higher γ filtration.

Suppliers/prerequisites: SchemeKTheoryOperations:S.6/supported-degree-zero-adams-operations, SchemeKTheoryOperations:S.6/supported-codimension-filtration

Acceptance: For separated Noetherian regular finite-dimensional X and closed Y, F^p K₀^Y(X)⊗ℚ is the sum of rational Adams weight spaces of weights q≥p, with 0≤q≤dim X. Every ψ^k, k≥2, acts by k^p on Gr_F^p⊗ℚ. The GS strict-model proof transports under the resolution property; extension to general TT locally perfect X requires the recorded operations/gluing bridge.

-/

/-!
### `SchemeKTheoryOperations:S.6/rational-supported-filtration-product`

For separated Noetherian regular finite-dimensional X, closed Y,Z, and a,b≥0, the support product maps F^aK₀^Y(X)×F^bK₀^Z(X) into F^(a+b)K₀^(Y∩Z)(X)⊗ℚ. The GS strict-model proof holds with the resolution property; extending its operations to TT local models is the explicit bridge gap. This is a rational inclusion; no integral or formal-scheme inclusion is inferred.

Hypotheses: Codimension is ambient; supports intersect.; GS87 Prop5.5 is presented in its regular-local setup. The global rational inclusion follows instead from Prop4.11 multiplicativity and Prop5.3 weight splitting, as used by Th8.3.

Suppliers/prerequisites: SchemeKTheoryOperations:S.6/supported-degree-zero-adams-operations, SchemeKTheoryOperations:S.6/supported-codimension-weight-splitting, SchemeKTheoryOperations:S.6/support-product-pairings

Acceptance: For separated Noetherian regular finite-dimensional X, closed Y,Z, and a,b≥0, the support product maps F^aK₀^Y(X)×F^bK₀^Z(X) into F^(a+b)K₀^(Y∩Z)(X)⊗ℚ. The GS strict-model proof holds with the resolution property; extending its operations to TT local models is the explicit bridge gap. This is a rational inclusion; no integral or formal-scheme inclusion is inferred.

-/

/-!
### `SchemeKTheoryOperations:S.7/supported-cycle-to-k-zero`

For separated Noetherian regular finite-dimensional X and closed Y, define cl_K:⊕_(q≥p) Z_Y^q(X)→F^pK₀^Y(X) by[V]↦[O_V] using regular support dévissage. Here Z_Y^q(X) is the free group on integral closed subschemes V⊂Y of ambient codimension q. Support enlargement preserves this map. Its image on Gr_F^p descends through the Chow-with-support relation after rationalization.

Hypotheses: This is Li–Liu(B.3), a map from cycles of all codimensions≥p into F^p; it is not an isomorphism from cycles before rational equivalence.; The locally perfect TT model permits O_V through G₀ support dévissage; a global vector-bundle resolution is not automatic.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/regular-support-devissage, SchemeKTheoryOperations:S.6/supported-codimension-filtration, SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence, SchemeAndStackFoundations:SF.5

Omitted signature `SupportedCycle.kClass` (constructor): Map the cycle[V] to[O_V] in supported K₀.

Omitted signature `SupportedCycle.kClass_filtration` (relation): Codimension≥p maps into F^p.

Omitted signature `SupportedCycle.support_enlarge` (functoriality): Class maps commute with support enlargement.

Omitted signature `SupportedCycle.generic_length` (characterisation): The leading coefficient at a codimension-p generic point is the module length.

Omitted signature `SupportedCycle.chow_graded` (compatibility): On the p-th graded quotient the rationalized map descends to CH_Y^p(X).

Omitted example `cycle_class_dvr` (computation): On a DVR, the closed point maps to[Cone(π)] and generic length1 in Gr¹.

Omitted example `cycle_class_empty` (degenerate): The zero cycle and empty support map to0.

Omitted example `cycle_class_thickening` (computation): The coherent sheaf O/(π^m) has leading cycle m[s], not[s], detecting loss of generic length.

Omitted example `cycle_class_enlarge` (compatibility): The same closed point class has the same image after enlarging support; ambient codimension stays1.

Acceptance: For separated Noetherian regular finite-dimensional X and closed Y, define cl_K:⊕_(q≥p) Z_Y^q(X)→F^pK₀^Y(X) by[V]↦[O_V] using regular support dévissage. Here Z_Y^q(X) is the free group on integral closed subschemes V⊂Y of ambient codimension q. Support enlargement preserves this map. Its image on Gr_F^p descends through the Chow-with-support relation after rationalization.

-/

/-!
### `SchemeKTheoryOperations:S.7/supported-chow-k-zero-comparison`

For separated Noetherian regular finite-dimensional X and closed Y, the cycle map gives CH_Y^p(X)⊗ℚ≃Gr_F^pK₀^Y(X)⊗ℚ. CH_Y^p means ambient codimension-p cycles in Y modulo divisors of rational functions on ambient codimension-(p−1) integral subschemes contained in Y. This is a supported comparison, not automatically CH^p(Y). For equidimensional catenary X of dimension d it identifies with CH_(d−p)(Y)⊗ℚ.

Hypotheses: The degree-zero rational Adams action on the coniveau pages and its compatibility with residue differentials are required inputs.; No Gersten exactness over arbitrary mixed-characteristic bases is assumed.

Suppliers/prerequisites: SchemeKTheoryOperations:S.7/supported-cycle-to-k-zero, SchemeKTheoryOperations:S.6/supported-codimension-weight-splitting, SchemeKTheoryOperations:S.4/k-coniveau-spectral-sequence, SchemeKTheoryOperations:S.6/adams-on-coniveau, SchemeAndStackFoundations:SF.5

Acceptance: For separated Noetherian regular finite-dimensional X and closed Y, the cycle map gives CH_Y^p(X)⊗ℚ≃Gr_F^pK₀^Y(X)⊗ℚ. CH_Y^p means ambient codimension-p cycles in Y modulo divisors of rational functions on ambient codimension-(p−1) integral subschemes contained in Y. This is a supported comparison, not automatically CH^p(Y). For equidimensional catenary X of dimension d it identifies with CH_(d−p)(Y)⊗ℚ.

-/

/-!
### `SchemeKTheoryOperations:S.7/dimension-one-supported-g-cycle-comparison`

In the regular separated Noetherian finite-dimensional scheme setting above, G₀ of coherent sheaves supported on Y has increasing support-dimension filtration F_i. Gr₁=F₁/F₀ rationally identifies with CH₁(Y), via generic lengths of one-dimensional sheaves. On an equidimensional catenary ambient X of dimension d, this is the p=d−1 instance of the supported Chow comparison. If Y is proper over a Dedekind base, its one-dimensional cycle classes map to the group of proper one-cycles used in Zhang §9.1; include only the stated vertical rational-equivalence relations there.

Hypotheses: Gr₁ refers to dimension of support, not codimension1 in the ambient X.; Zhang’s proper-cycle consumer needs its properness and zero-dimensional generic fibre hypotheses; its arithmetic intersection pairing has another owner.

Suppliers/prerequisites: SchemeKTheoryOperations:S.3/regular-support-devissage, SchemeKTheoryOperations:S.7/supported-chow-k-zero-comparison, SchemeAndStackFoundations:SF.5

Acceptance: In the regular separated Noetherian finite-dimensional scheme setting above, G₀ of coherent sheaves supported on Y has increasing support-dimension filtration F_i. Gr₁=F₁/F₀ rationally identifies with CH₁(Y), via generic lengths of one-dimensional sheaves. On an equidimensional catenary ambient X of dimension d, this is the p=d−1 instance of the supported Chow comparison. If Y is proper over a Dedekind base, its one-dimensional cycle classes map to the group of proper one-cycles used in Zhang §9.1; include only the stated vertical rational-equivalence relations there.

-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.6/non-unital-lambda-algebra.
Suppliers: KTheoryLowDegrees:Z.3/special-lambda-ring, KTheoryLowDegrees:Z.3/pre-lambda-ring, KTheoryLowDegrees:Z.3/augmented-lambda-ring, KTheoryLowDegrees:Z.3/binomial-special, KTheoryLowDegrees:Z.3/adams-square-zero, mathlib:Unitization
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.unitization: The special λ-ring K_0 ⊕ I (Mathlib's Unitization K_0 I).
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.lambda_inl_add: λ^k(a + x) = λ^k(a) + Σ_{i=0}^{k−1} λ^i(a)λ^{k−i}(x) in K_0 ⊕ I, for k ≥ 1.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.isLambdaIdeal: I, the kernel of the first projection K_0 ⊕ I → K_0, is a λ-ideal.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.augmentation: An augmentation ε_0: K_0 → H induces the augmentation ε(a, x) = ε_0(a) of K_0 ⊕ I, with augmentation ideal ker ε_0 ⊕ I.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.lambda_add_of_mul_eq_zero: If I·I = 0: λ^k(x + y) = λ^k(x) + λ^k(y) and ψ^k(x) = (−1)^{k−1}kλ^k(x) for x, y ∈ I and k ≥ 1.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.ofLambdaIdeal: A λ-ideal J of K_0 with the restricted operations: (a, x) ↦ (a, a + x) identifies K_0 ⊕ J with the λ-subring {(a, c) : c − a ∈ J} of K_0 × K_0 (Z.3 API ofSubring).
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.Hom: Morphisms: K_0-linear multiplicative maps commuting with every λ^k, k ≥ 1.
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.6/non-unital-gamma-filtration.
Suppliers: SchemeKTheoryOperations:S.6/non-unital-lambda-algebra, KTheoryLowDegrees:Z.3/augmented-lambda-ring, KTheoryLowDegrees:Z.3/gamma, KTheoryLowDegrees:Z.3/gamma-add, KTheoryLowDegrees:Z.3/gamma-series, KTheoryLowDegrees:Z.3/gamma-filtration, KTheoryLowDegrees:Z.3/gamma-filtration-generators, KTheoryLowDegrees:Z.3/gamma-filtration-zero, KTheoryLowDegrees:Z.3/gamma-filtration-one, KTheoryLowDegrees:Z.3/gamma-filtration-mul, KTheoryLowDegrees:Z.3/gamma-filtration-eq-span
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration: F^n_γI = I ∩ F^n_γ(K_0 ⊕ I), a K_0-submodule of I.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_zero_one: F^0_γI = F^1_γI = I.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_antitone: F^{n+1}_γI ⊆ F^n_γI.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.smul_mem_gammaFiltration: a ∈ F^i_γK_0 and x ∈ F^j_γI give a·x ∈ F^{i+j}_γI.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_eq_span_of_mul_eq_zero: If I·I = 0, F^n_γI is the subgroup generated by b·γ^j(x) (b ∈ K_0, j ≥ n) and a·γ^j(x) (a ∈ F^i_γK_0, i, j ≥ 1, i + j ≥ n).
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_map: Morphisms of non-unital λ-algebras over K_0 preserve F^n_γ.
Omitted API TauCeti.LambdaRing.NonUnitalAlgebra.gammaGraded: gr^n_γI = F^n_γI/F^{n+1}_γI.
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.6/stable-representation-ring.
Suppliers: KTheoryLowDegrees:Z.3/representation-ring-of-gl, KTheoryLowDegrees:Z.3/pre-lambda-ring, KTheoryLowDegrees:Z.3/serre-representation-ring-theorem, KTheoryLowDegrees:Z.3/gamma, KTheoryLowDegrees:Z.3/gamma-series, KTheoryLowDegrees:Z.3/adams-operations
Omitted API TauCeti.RepresentationRing.stableGL.preLambda: The pre-λ-ring structure of R_ℤ(GL), componentwise.
Omitted API TauCeti.RepresentationRing.stableGL.proj: The projections R_ℤ(GL) → R_ℤ(GL_N), pre-λ-homomorphisms with ρ_N ∘ proj_{N+1} = proj_N.
Omitted API TauCeti.RepresentationRing.stableGL.ext: Two elements of R_ℤ(GL) are equal if all their components are.
Omitted API TauCeti.RepresentationRing.stableGL.ofOperation: The element τ_∞ = (τ(id_N − N))_N for a natural operation τ given as a λ-expression in one variable.
Omitted API TauCeti.RepresentationRing.stableGL.proj_ofOperation: proj_N(τ_∞) = τ(id_N − N).
Omitted API TauCeti.RepresentationRing.stableGL.dual: The involution induced by ρ ↦ ρ^∨ levelwise (Z.3 API dual).
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.6/representation-ring.
Suppliers: tauceti:TauCeti.ExactK0, KTheoryLowDegrees:Z.3/pre-lambda-ring, KTheoryLowDegrees:Z.3/representation-ring-of-gl, KTheoryLowDegrees:Z.3/exterior-extension-filtration, KTheoryLowDegrees:Z.3/exterior-extension-graded, mathlib:Rep, tauceti:TauCeti.repRing
Omitted API TauCeti.RepresentationRing.preLambda: The pre-λ-ring structure by exterior powers.
Omitted API TauCeti.RepresentationRing.restrict: ρ^*: R_A(G') → R_A(G) for ρ: G → G', with id and composition.
Omitted API TauCeti.RepresentationRing.extendScalars: f_*: R_A(G) → R_{A'}(G) for f: A → A'.
Omitted API TauCeti.RepresentationRing.forget: The forgetful λ-homomorphism R_A(G) → K_0(A), a retraction of R_A(1) = K_0(A) → R_A(G).
Omitted API TauCeti.RepresentationRing.ofGLPullback: For ρ: G → GL_N(A), the pre-λ-homomorphism R_ℤ(GL_N) → R_A(G), σ ↦ [σ_A ∘ ρ].
Omitted API TauCeti.RepresentationRing.frobeniusTwist: For pA = 0, Φ^*: R_A(G) → R_A(G), [P] ↦ [A ⊗_{Φ,A} P].
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.6/bott-cannibalistic-class.
Suppliers: KTheoryLowDegrees:Z.3/special-lambda-ring, KTheoryLowDegrees:Z.3/augmented-lambda-ring, KTheoryLowDegrees:Z.3/lambda-identity-principle, KTheoryLowDegrees:Z.3/adams-operations, KTheoryLowDegrees:Z.3/gamma-filtration-one, tauceti:MvPolynomial.IsSymmetric.exists_aeval_esymm
Omitted API TauCeti.LambdaRing.bott: θ^k(N) for N of finite rank p.
Omitted API TauCeti.LambdaRing.bott_add: θ^k(N + N') = θ^k(N)θ^k(N').
Omitted API TauCeti.LambdaRing.bott_line: θ^k(L) = 1 + L + ⋯ + L^{k−1} for a line element L.
Omitted API TauCeti.LambdaRing.bott_mul_index: θ^{kk'}(N) = ψ^k(θ^{k'}(N))θ^k(N).
Omitted API TauCeti.LambdaRing.augmentation_bott: ε(θ^k(N)) = k^{rank N}.
Omitted API TauCeti.LambdaRing.bott_map: λ-homomorphisms commute with θ^k.
Omitted API TauCeti.LambdaRing.bottExp: The exponential extension θ^k: K_0 → K_0 ⊗ ℤ[1/k], for K_0 with nil augmentation ideal in which every element is a difference of finite-rank elements.
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.6/twisted-lambda-ring.
Suppliers: KTheoryLowDegrees:Z.3/special-lambda-ring, KTheoryLowDegrees:Z.3/lambda-identity-principle, KTheoryLowDegrees:Z.3/lambda-universal-polynomials, KTheoryLowDegrees:Z.3/monoid-lambda-ring
Omitted API TauCeti.LambdaRing.twisted.lambdaRing: R_N is a special λ-ring, under the hypothesis λ^j(N) = 0 for j > p.
Omitted API TauCeti.LambdaRing.twistedOp: τ(N, x), the R-component of τ(0, x).
Omitted API TauCeti.LambdaRing.twistedLambda_mul: λ^k(N, x)λ_{−1}(N) = λ^k(xλ_{−1}(N)), and the same for γ^k.
Omitted API TauCeti.LambdaRing.twisted_map: A λ-homomorphism f: R → R' induces R_N → R'_{f(N)}.
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.7/scheme-gamma-filtration.
Suppliers: KTheoryLowDegrees:Z.3/gamma-filtration, KTheoryLowDegrees:Z.3/augmented-lambda-ring, KTheoryLowDegrees:Z.3/gamma-filtration-mul, KTheoryLowDegrees:Z.3/gamma-filtration-one, SchemeKTheoryOperations:S.6/vector-bundle-lambda-ring, SchemeKTheoryOperations:S.6/degree-zero-comparison, SchemeKTheoryOperations:S.6/scheme-lambda-algebra
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_mul: F^iF^j ⊆ F^{i+j}; F^{i+1} ⊆ F^i; F^0 = K_0, F^1 = ker(rank).
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_pullback: f^*(F^i_γK_0(X)) ⊆ F^i_γK_0(X').
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaGraded: gr^•_γK_0(X), a graded H^0(X, ℤ)-algebra.
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaFiltration_first: F^1/F^2 ≅ Pic(X) and F^2 = SK_0(X) (S.7/gamma-first-graded-pieces).
-/

/- Missing-carrier signatures for SchemeKTheoryOperations:S.7/gamma-chern-character.
Suppliers: KTheoryLowDegrees:Z.3/augmented-lambda-ring, KTheoryLowDegrees:Z.3/gamma-filtration, SchemeKTheoryOperations:S.6/non-unital-lambda-algebra, SchemeKTheoryOperations:S.6/non-unital-gamma-filtration, KTheoryLowDegrees:Z.3/lambda-identity-principle, KTheoryLowDegrees:Z.3/lambda-universal-polynomials, SchemeKTheoryOperations:S.6/adams-eigenvalue-on-gamma-graded, SchemeKTheoryOperations:S.6/rational-weight-decomposition, SchemeKTheoryOperations:S.6/scheme-gamma-bound, SchemeKTheoryOperations:S.6/scheme-adams-multiplicative, SchemeKTheoryOperations:S.6/operations-functoriality, mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaChern_add: ch is additive.
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaChern_adams: ch_i ∘ ψ^k = k^ich_i.
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaChern_bijective: ch ⊗ 1 is an isomorphism K_m(X)_ℚ ≅ ⊕gr^i_γK_m(X)_ℚ.
Omitted API TauCeti.AlgebraicGeometry.KTheory.gammaChern_pullback: ch commutes with f^*.
-/

/-! Native regression for S.2/projective-ambient-perfect-descent. The finite-free complex
A --ε--> A in degrees −1,0 has H⁻¹=ker(ε)=⊕ℕ ℚ, which is not finite over A.
Its terms are finite free, so the projective identity must preserve this perfect complex.
This validates signatures only; the examples retain the required sorry proofs. -/

noncomputable section

namespace TauCeti.AlgebraicGeometry.KTheory

/-- A noncoherent square-zero ring used to test the arbitrary-base projective branch. -/
abbrev projectivePushforwardRegressionRing := TrivSqZeroExt ℚ (ℕ →₀ ℚ)

/-- Multiplication by the first basis vector in the square-zero ideal. -/
def projectivePushforwardRegressionEpsilon : projectivePushforwardRegressionRing :=
  TrivSqZeroExt.inr (Finsupp.single 0 1)

def projectivePushforwardRegressionDifferential :
    projectivePushforwardRegressionRing →ₗ[projectivePushforwardRegressionRing]
      projectivePushforwardRegressionRing :=
  DistribSMul.toLinearMap _ _ projectivePushforwardRegressionEpsilon

-- test proper_perfect_pushforward_square_zero: a strict two-term finite-free complex
-- may have non-finitely-generated H⁻¹. The projective identity still preserves it.
example (x : projectivePushforwardRegressionRing) :
    projectivePushforwardRegressionDifferential x = 0 ↔ x.fst = 0 := by
  sorry

example : ¬ Module.Finite projectivePushforwardRegressionRing
    (LinearMap.ker projectivePushforwardRegressionDifferential) := by
  sorry

example : projectivePushforwardRegressionEpsilon ≠ 0 ∧
    projectivePushforwardRegressionEpsilon * projectivePushforwardRegressionEpsilon = 0 := by
  sorry

example : Module.Free projectivePushforwardRegressionRing projectivePushforwardRegressionRing ∧
    Module.Finite projectivePushforwardRegressionRing projectivePushforwardRegressionRing := by
  sorry

end TauCeti.AlgebraicGeometry.KTheory

/-!
# Independent review contracts (REV-SchemeKTheoryOperations)

These comments specify the corrected mathematical scope for signatures whose higher K,
supported Chow, or enhanced carriers are missing. They introduce no Lean stand-ins.
-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.1/strictly-perfect-complex`

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. A complex E• of O_X-modules is strictly perfect if E^i = 0 for all but finitely many i and every E^i is a finite locally free O_X-module, meaning an O_X-module that is locally free (Mathlib's SheafOfModules.IsLocallyFree) and of finite type (SheafOfModules.IsFiniteType). Since every stalk O_{X,x} is a local ring, this is equivalent to asking that each E^i be, locally on X, a direct summand of a finite free module, whereas Stacks 08C4 requires the terms to be globally direct summands of finite free modules. These are different global definitions; Stacks 0BCJ concerns local representatives of perfect derived objects; Thomason–Trobaugh call such a complex a strict perfect complex, a strict bounded complex of algebraic vector bundles (TT 2.2.2). Write SPerf(X) for the full subcategory of the category of complexes on the strictly perfect ones.

Hypotheses: X is an arbitrary scheme; no finiteness or separation hypothesis is imposed.; The bound is strict: E^i = 0 outside a finite interval [a, b], not merely H^i(E•) = 0 outside it.; The terms are required to be of finite type; a locally free module of infinite rank is excluded.

Reviewed API: IsStrictlyPerfect: The object property on complexes of O_X-modules: bounded, with finite locally free terms.
IsStrictlyPerfect.single: A finite locally free O_X-module placed in a single degree n is strictly perfect.
IsStrictlyPerfect.exists_bounds: A strictly perfect complex has integers a ≤ b with E^i = 0 for i ∉ [a, b].
IsStrictlyPerfect.of_iso: The property is closed under isomorphism of complexes.
IsStrictlyPerfect.shift: E• strictly perfect implies E•[k] strictly perfect for every k ∈ ℤ.
isStrictlyPerfect_iff_locally_summand_free: E• is strictly perfect iff it is bounded and each E^i is locally on X a direct summand of a finite free module (the local summand formulation of TT 2.2.2; distinguish Stacks 08C4).
IsStrictlyPerfect.restrict: For an open immersion j : U → X, the restriction of a strictly perfect complex is strictly perfect.
IsStrictlyPerfect.tilde: For a ring A and a bounded complex P• of finite projective A-modules, the termwise tilde P•~ on Spec A is strictly perfect (finite projective modules are locally free of finite rank, KTheoryLowDegrees Z.2).

Acceptance specifications (not executed):
isStrictlyPerfect_koszul_affineLine: On Spec k[x] for a field k, the complex O --x--> O in degrees −1, 0 is strictly perfect, and its only nonzero cohomology sheaf is H^0 = (k[x]/(x))~, the skyscraper at the origin.
isStrictlyPerfect_zero_and_unit: On every scheme the zero complex and O_X[0] are strictly perfect; on the empty scheme every complex is strictly perfect.
not_isStrictlyPerfect_skyscraper: On Spec k[x] the skyscraper (k[x]/(x))~ in degree 0 is not strictly perfect: its stalk at the origin is k while its stalk at the generic point is 0, so it is not locally free of any locally constant rank.
not_isStrictlyPerfect_unbounded: On a nonempty scheme X, the complex with O_X in every degree n ≤ 0 and zero differentials has finite free terms but is not strictly perfect, because it is not bounded.
isStrictlyPerfect_tilde_projective: For a ring A and a bounded complex P• of finitely generated projective A-modules, P•~ on Spec A is strictly perfect; for A = ℤ and P• = (ℤ --2--> ℤ) its cohomology is (ℤ/2)~ in degree 0.
isStrictlyPerfect_projectiveLine_lineBundle: On P¹_k the complex O(1)[0] is strictly perfect in the TT convention but not in the global summand convention of Stacks 08C4: Hom(O(1), O^r) = H⁰(P¹, O(−1))^r = 0 for every finite r, so no split inclusion exists.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.1/perfect-derived-tensor`

Let X be a scheme. If K, L are perfect objects of D(O_X), then K ⊗^L_{O_X} L is perfect; if K has tor-amplitude in [a, b] and L in [c, d], then K ⊗^L L has tor-amplitude in [a + c, b + d]. If E is perfect and F is pseudo-coherent (resp. cohomologically bounded pseudo-coherent, with E of globally finite Tor-amplitude) then E ⊗^L F is pseudo-coherent (resp. cohomologically bounded pseudo-coherent, with E of globally finite Tor-amplitude). For strictly perfect K•, L• the derived tensor product is represented by Tot(K• ⊗ L•), which is strictly perfect.

Hypotheses: The derived tensor product is EnhancedDerivedSheaves E1's, computed on K-flat representatives.; The bounded mixed assertion requires a global Tor bound on E; quasi-compact X supplies it for every perfect E. On the disjoint union of countably many points, shifts O[n] give a locally perfect object with no global bound.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.1/coherator`

Let X be a scheme and Q_X : Mod(O_X) → QCoh(O_X) the coherator, the right adjoint of the inclusion QCoh(O_X) → Mod(O_X) (it exists on every scheme, and Q_X(F) → F is an isomorphism for quasi-coherent F). Its right derived functor RQ_X : D(O_X) → D(QCoh(O_X)) is right adjoint to the canonical functor D(QCoh(O_X)) → D(O_X). (1) If X is quasi-compact with affine diagonal (quasi-compact and semi-separated in TT's language), D(QCoh(O_X)) → D_QCoh(O_X) is an equivalence with quasi-inverse RQ_X (Stacks 08DB). (2) If X is noetherian, the same holds (Stacks 09T4), and D^b(Coh(O_X)) → D^b_Coh(O_X) is an equivalence (Stacks 0FDB). TT B.16 proves the bounded-below case of (1) and (2).

Hypotheses: Affine diagonal (every intersection of two affine opens is affine) is needed in (1); separated schemes qualify. The noetherian case (2) supplies the unbounded comparison without affine diagonal; TT B.16 is the bounded-below predecessor.; The unbounded derived functors use the K-injective replacements of EnhancedDerivedSheaves E1 for X.Modules and for QCoh(O_X) (both Grothendieck abelian).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category`

Conventions of this layer: X is a scheme; an O_X-module is an object of Mathlib's abelian category X.Modules; a complex is a cochain complex indexed by ℤ with differential raising degree (TT 1.1.1, Stacks, Mathlib's CochainComplex); the shift is E[k]^n = E^{n+k} with differential multiplied by (−1)^k, and the cone of φ : E → F has C(φ)^n = F^n ⊕ E^{n+1} (Mathlib's mappingCone); D(O_X) is Mathlib's DerivedCategory of X.Modules, identified by EnhancedDerivedSheaves E1 with the homotopy category of its enhancement. Let X be a scheme. Perf(X) is the full subcategory of the category of complexes of O_X-modules on the perfect complexes of globally finite Tor-amplitude (all perfect complexes if X is quasi-compact), with the default complicial biWaldhausen structure of TT 1.2.11: cofibrations are the degreewise split monomorphisms whose cokernel lies in Perf(X), and weak equivalences are the quasi-isomorphisms. Its homotopy category w^{-1}Perf(X) (TT 1.9.6) maps by a fully faithful triangulated functor to D(O_X) with essential image the perfect objects of globally finite Tor-amplitude (equal to D_perf(O_X) when X is quasi-compact). This is the Waldhausen model on which GeneralAlgebraicKTheory K.4 computes K(X) (TT 3.1). For a closed subset Z with quasi-compact complement, the full subcategory Perf_Z(X) of complexes acyclic on X ∖ Z carries the induced structure (TT 3.1, used in S.3).

Hypotheses: Perf(X) is not essentially small: every acyclic complex M --id--> M of O_X-modules is perfect. Only its homotopy category is (for qcqs X, SchemeKTheoryOperations:S.1/perfect-essentially-small); K-theory is formed in the universe of complexes, as TT 1.4 prescribes, and does not depend on it (SchemeKTheoryOperations:S.1/perfect-universe-invariance).; Weak equivalences are quasi-isomorphisms, not chain homotopy equivalences.; The ambient abelian category is all O_X-modules, not quasi-coherent ones; quasi-coherent models are compared in SchemeKTheoryOperations:S.1/perfect-waldhausen-models.

Reviewed API: perfCategory: The full subcategory Perf(X) of complexes of O_X-modules on perfect complexes of globally finite Tor-amplitude.
perfCategory.cofibration_iff: A map is a cofibration iff it is a degreewise split monomorphism with cokernel in Perf(X).
perfCategory.weq_iff: A map is a weak equivalence iff it is a quasi-isomorphism of complexes.
perfCategory.isComplicialBiWaldhausen: Perf(X) is a saturated extensional complicial biWaldhausen category (TT 1.2.11).
perfCategory.cylinder: The TT 1.3.4 mapping cylinder is a cylinder functor satisfying the cylinder axiom on Perf(X).
perfCategory.closedUnderHomotopyPushouts: Perf(X) is closed under canonical homotopy pushouts and pullbacks (hypothesis of TT 1.9.8).
perfCategory.homotopyCategoryEquiv: w^{-1}Perf(X) is equivalent to the perfect subcategory with globally finite Tor-amplitude; for quasi-compact X this is D_perf(O_X).
perfCategory.supports: For Z closed with X ∖ Z quasi-compact, Perf_Z(X): perfect complexes acyclic on X ∖ Z, with the induced structure.
perfCategory.restrict: Restriction to an open U is a complicial exact functor Perf(X) → Perf(U).

Acceptance specifications (not executed):
perfCategory_affine_homotopy: For X = Spec A, w^{-1}Perf(X) is equivalent to D_perf(A) (SchemeKTheoryOperations:S.1/affine-perfect-comparison), hence to K^b(proj A).
perfCategory_empty: For X = ∅, Perf(X) has only zero objects and w^{-1}Perf(X) is the zero category.
perfCategory_not_essentiallySmall: Perf(Spec k) is not essentially small: for every set S the acyclic complex k^(S) --id--> k^(S) lies in Perf(Spec k), and these complexes are pairwise non-isomorphic as the cardinality of S varies; w^{-1}Perf(Spec k) is nevertheless equivalent to finite-dimensional graded vector spaces.
perfCategory_weq_not_homotopyEquiv: On Spec k[x] the quasi-isomorphism (O --x--> O) → (k[x]/(x))~ is a weak equivalence between objects of Perf(Spec k[x]) that is not a chain homotopy equivalence: a homotopy inverse would give a nonzero map from the torsion module (k[x]/(x))~ to the free module O in degree 0, and there is none.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.1/perfect-frobenius-pair`

Let X be a quasi-compact quasi-separated scheme. Declare a sequence in Perf(X) a conflation if it is degreewise split exact. Then Perf(X) is a Frobenius category whose projective-injective objects are the contractible complexes, and with Perf(X)^0 the full subcategory of acyclic complexes, (Perf(X), Perf(X)^0) is a Frobenius pair in the sense of GeneralAlgebraicKTheory K.6 (Schlichting 5.10). Its derived category D(Perf(X), Perf(X)^0) = Stable(Perf(X))/Stable(Perf(X)^0) is isomorphic to w^{-1}Perf(X), hence equivalent to D_perf(O_X). This is the model on which K.6's nonconnective IK-spectrum computes 𝕂(X) (SchemeKTheoryOperations:S.2/nonconnective-k-theory-of-a-scheme).

Hypotheses: Schlichting states 5.10 for any complicial biWaldhausen category closed under canonical homotopy pushouts and pullbacks with weak equivalences closed under retracts; Perf(X) satisfies these (SchemeKTheoryOperations:S.1/perfect-complicial-waldhausen-category).; K.6 needs small Frobenius categories. Perf(X), formed from O_X-modules in the universe u of X, is small relative to the next universe, where IK is computed; SchemeKTheoryOperations:S.1/perfect-universe-invariance shows the result does not depend on this choice (TT 1.4, Appendix F).; The Frobenius structure uses degreewise split conflations, not all short exact sequences of complexes.

Reviewed API: perfFrobeniusPair: The Frobenius pair (Perf(X), acyclic perfect complexes) with degreewise split conflations.
perfFrobeniusPair.projectiveInjective_iff: An object is projective-injective iff it is a contractible complex.
perfFrobeniusPair.derivedEquiv: D(Perf(X), Perf(X)^0) ≃ w^{-1}Perf(X) ≃ D_perf(O_X), triangulated.
perfFrobeniusPair.isIdempotentComplete: Its derived category is idempotent complete.
perfFrobeniusPair.map: A complicial exact functor preserving acyclic complexes and degreewise split sequences (e.g. pullback on flat models) induces a map of Frobenius pairs.

Acceptance specifications (not executed):
perfFrobeniusPair_contractible: The cone of the identity of O_X is projective-injective in the Frobenius structure; on nonempty X, O_X[0] itself is not (it is not contractible).
perfFrobeniusPair_empty: For X = ∅ the pair is (0, 0) and its derived category is zero.
perfFrobeniusPair_affine: For X = Spec A the derived category of the pair is equivalent to K^b(proj A), the derived category of K.6's Frobenius pair (Ch^b(proj A), Ac^b(proj A)).
perfFrobeniusPair_not_all_ses: The short exact sequence of complexes 0 → O --x--> O → (k[x]/(x))~ → 0 in degree 0 on Spec k[x] is not a conflation of the pair (not degreewise split), although its three terms are perfect.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.2/k-theory-model-invariance`

Let X be a quasi-compact scheme. The inclusions of the model subcategories of SchemeKTheoryOperations:S.1/perfect-waldhausen-models into Perf(X) (strict bounded, bounded above flat, bounded below injective or flasque perfect complexes; quasi-coherent ones when X has affine diagonal or is noetherian; coherent ones when X is noetherian; strictly perfect ones under the resolution property) induce homotopy equivalences of K-theory spectra, so all are models of K(X) (TT 3.5–3.8). For qcqs X the change of universe induces a homotopy equivalence (TT Appendix F). The same holds for K(X on Z) and for the pseudo-coherent models of G(X) (TT 3.11). For a non-quasi-compact scheme, TT 3.5 uses the globally finite Tor-amplitude model of TT 3.1 and its indicated subcategories; this must not be identified with all locally perfect derived objects. The regularity, coherence and resolution-property qualifications of the individual models still apply.

Hypotheses: The K-theoretic input is GeneralAlgebraicKTheory K.4's derived invariance for complicial biWaldhausen categories closed under canonical homotopy pushouts and pullbacks (TT 1.9.8; K-book V.3.9), requested from K.4.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.2/k-theory-proper-pushforward`

Let f : X → Y be a proper perfect morphism of noetherian schemes (proper, of finite Tor-dimension). Then f_* = Rf_* restricts to a complicial exact functor on the flasque models of perfect complexes (TT 3.5.5), because Rf_* preserves perfection (SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect), and induces f_* : K(X) → K(Y) (TT 3.16.4; K-book V.3.7.1, V.3.11). Variants with the same construction: perfect projective morphisms and flat proper finitely presented morphisms of qcqs schemes (TT 3.16.5; the unrestricted wording of 3.16.6 needs correction), and the maps on K(X on Z). On K_0, f_*[E] = [Rf_*E]. It is compatible with the G-pushforward through the Cartan maps: c_Y∘f_* ≃ f_*∘c_X.

Hypotheses: Finite Tor-dimension is part of the hypothesis and is proved in each application (regular target, flat f, lci f); it is not implied by properness.; Over an arbitrary nonnoetherian base, flat proper alone does not imply perfect. The flat variant requires finite presentation and the proper-perfect preservation theorem; noetherian proper finite-Tor morphisms already satisfy the needed pseudo-coherence.

Reviewed API: Scheme.K.pushforward: f_* : K(X) → K(Y) for f proper perfect between noetherian schemes.
Scheme.K.pushforward_class: f_*[E] = [Rf_*E] in K_0(Y).
Scheme.K.pushforward_comp: (g∘f)_* ≃ g_*∘f_* (SchemeKTheoryOperations:S.2/pushforward-functoriality).
Scheme.K.pushforward_cartan: c_Y∘f_* ≃ f_*∘c_X with the G-pushforward (SchemeKTheoryOperations:S.2/cartan-map).
Scheme.K.pushforward_affine: For Spec B → Spec A finite with B perfect over A, f_* is the restriction-of-scalars transfer (SchemeKTheoryOperations:S.2/affine-pushforward-is-transfer).
Scheme.K.pushforward_supports: The analogous maps K(X on Z) → K(Y on f(Z)) (TT 3.16.7).

Acceptance specifications (not executed):
K_pushforward_projectiveLine: For p : P^1_k → Spec k, p_*[O(n)] = n + 1 in K_0(Spec k) = ℤ.
K_pushforward_id: id_* is the identity of K(X).
K_pushforward_finiteFlat_eq_ringK0Transfer: For a finite ring extension A → B with B finitely generated projective over A, (Spec B → Spec A)_* on K_0 is KTheoryLowDegrees Z.1's ring-k0-transfer.
K_pushforward_degree: For the degree-2 map f : Spec ℤ[i] → Spec ℤ, f_*[O] = [ℤ[i]] = 2 in K_0(ℤ) = ℤ.
not_K_pushforward_nonperfect: For i : Spec k → Spec k[ε]/(ε²), i is proper but not perfect and Ri_*k = k is not perfect, so K-pushforward along i is not defined (only i_* : G(Spec k) → G(Spec k[ε]/(ε²)) is).
not_K_pushforward_flat_non_finitelyPresented: Let R = ∏_{n∈ℕ} k and I = ⊕_{n∈ℕ} k. The closed immersion Spec(R/I) → Spec R is finite, hence proper, and flat because R is von Neumann regular. Its pushforward of O is R/I, which is not finitely presented, hence not perfect: I is not finitely generated. Flat proper alone cannot license K-pushforward.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.2/affine-pullback-is-scalar-extension`

Let φ : A → B be a homomorphism of commutative rings and g = Spec φ : Spec B → Spec A. Under the identifications of SchemeKTheoryOperations:S.2/affine-k-theory-comparison, g* : K(Spec A) → K(Spec B) is homotopic to the map K(A) → K(B) induced by the exact functor B ⊗_A − : P(A) → P(B); on K_0 it is KTheoryLowDegrees Z.1's ring-k0-map. If A and B are noetherian and B is flat over A (more generally of finite Tor-dimension, via K-book V.3.5), g* : G(Spec A) → G(Spec B) is induced by the exact functor B ⊗_A − when B is flat, and by B ⊗^L_A − on bounded coherent complexes when B has finite Tor-dimension. The latter is not an exact functor on the abelian category of finitely generated modules.

Hypotheses: No hypothesis on φ for K.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.2/cartan-equivalence`

Let X be a quasi-compact scheme such that every finitely presented module over every local ring O_{X,x} has finite Tor-dimension; in particular let X be a regular noetherian scheme (of any Krull dimension, not necessarily separated). Then the Cartan map c_X : K(X) → G(X) is a homotopy equivalence (TT 3.21, 'Poincaré duality'), so K_n(X) ≅ G_n(X) for all n ≥ 0; on K_0 this is Stacks 0FDI. Moreover the negative groups of 𝕂(X) vanish for X regular noetherian, so 𝕂(X) ≃ K(X) ≃ G(X). For separated regular noetherian X the equivalence also follows from Quillen's resolution theorem applied to Vect(X) ⊂ Coh(X) (K-book V.3.4). In the first, potentially nonnoetherian branch, G(X) means TT 3.3’s Waldhausen K-theory of cohomologically bounded pseudo-coherent complexes; it is not the noetherian-only Coh(X) construction of S.2/g-theory-of-a-scheme.

Hypotheses: Regularity is essential and is never assumed by definition: for singular X the Cartan map need not be an equivalence (SchemeKTheoryOperations:S.2/cartan-singular-non-example).; The stage's 'finite-dimensional' hypothesis is not needed in TT's proof; the consumers' schemes (curves, arithmetic surfaces over O_F) are finite-dimensional in any case.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/perfect-complexes-with-support`

Let X be a scheme and Z ⊆ X a closed subset, with open complement j: U = X ∖ Z → X. Perf_Z(X) is the full subcategory of D_perf(O_X) (SchemeKTheoryOperations S.1/perfect-complex) on the perfect complexes E with j^*E ≅ 0 in D(O_U); equivalently every cohomology sheaf H^i(E) has support contained in Z (Stacks 08DA: E is supported on Z). As an object property of the pretriangulated category D_perf(O_X) it is closed under isomorphisms, shifts, cones and direct summands, so it is a thick triangulated subcategory in Mathlib's sense (ObjectProperty.IsTriangulated, closed under retracts). Its models: the complicial biWaldhausen category of TT 3.1 (perfect complexes of O_X-modules acyclic on X ∖ Z, cofibrations the degreewise split monomorphisms, weak equivalences the quasi-isomorphisms) and the Frobenius sub-pair of S.1/perfect-frobenius-pair on the objects acyclic off Z; both have homotopy category Perf_Z(X). Only the closed subset Z matters, never a scheme structure on it. The TT and Frobenius model comparison in this statement is asserted for qcqs X. On arbitrary non-quasi-compact X, the TT model only represents supported perfect objects with globally finite Tor-amplitude.

Hypotheses: X a scheme; in the theorems of this layer X is quasi-compact and quasi-separated and U = X ∖ Z is quasi-compact (so Z = |Y| for a finitely presented closed subscheme Y, TT 2.6.1(c)).; Z is a closed subset of the underlying space; Perf_Z(X) does not depend on a subscheme structure.

Reviewed API: PerfSupport: PerfSupport X Z : ObjectProperty (D_perf X), E ↦ (E|_{X∖Z} ≅ 0).
PerfSupport.isTriangulated: PerfSupport X Z is a triangulated subcategory closed under isomorphisms.
PerfSupport.isClosedUnderRetracts: Direct summands of objects of Perf_Z(X) lie in Perf_Z(X).
PerfSupport.mem_iff_support: E ∈ Perf_Z(X) iff Supp H^i(E) ⊆ Z for all i ∈ ℤ.
PerfSupport.mono: Z ⊆ Z' implies Perf_Z(X) ≤ Perf_{Z'}(X).
PerfSupport.inf: Perf_Z(X) ⊓ Perf_W(X) = Perf_{Z∩W}(X).
PerfSupport.univ: Perf_X(X) = D_perf(O_X).
PerfSupport.empty: E ∈ Perf_∅(X) iff E ≅ 0.
PerfSupport.pullback: For f: X' → X, Lf^* maps Perf_Z(X) into Perf_{f^{-1}Z}(X'); restriction to an open V maps Perf_Z(X) into Perf_{Z∩V}(V).
PerfSupport.tensor: E ∈ Perf_Z(X), F ∈ Perf_W(X) imply E ⊗^L F ∈ Perf_{Z∩W}(X) (S.1/perfect-derived-tensor).
PerfSupport.affine_iff: On X = Spec A with Z = V(I), E = M~ lies in Perf_Z(X) iff every H^i(M) has Module.support inside V(I) (S.1/affine-perfect-comparison).
PerfSupport.cone_mem: For s ∈ Γ(X, O_X), cone(s: O_X → O_X) ∈ Perf_{V(s)}(X).

Acceptance specifications (not executed):
PerfSupport.univ_eq: Perf_X(X) is all of D_perf(O_X); Perf_∅(X) contains only zero objects.
PerfSupport.dvr_cone: On X = Spec ℤ_(p) with Z the closed point: cone(p: O_X → O_X) ∈ Perf_Z(X) with H^0 = 𝔽_p, while O_X ∉ Perf_Z(X) since its restriction to Spec ℚ is ℚ ≠ 0.
PerfSupport.residue_field_not_perfect: On X = Spec k[ε]/(ε²), Z = X: the residue field k in degree 0 is supported on Z but is not in Perf_Z(X), because k has infinite projective dimension over k[ε]/(ε²); a definition by supports of cohomology alone, without perfectness, would contain it.
PerfSupport.affine_support: On X = Spec A and a ∈ A: cone(a) ∈ Perf_{V(a)}(X) and Module.support(A/aA) = V(a), agreeing with Mathlib's Module.support.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/killing-morphisms-into-supported`

Let X be quasi-compact and quasi-separated, T ⊆ X closed with U = X ∖ T quasi-compact, and α: P → E a morphism in D_QCoh(O_X) with P perfect and E supported on T (or P pseudo-coherent and E supported on T and bounded below). Then there are a perfect complex I and a map I → O_X[0] whose restriction to U is an isomorphism, such that the composite I ⊗^L P → P → E is zero (Stacks 0A9C). In the perfect-P branch, consequently the cone Q of I ⊗^L P → P is perfect, supported on T, and α factors through P → Q.

Hypotheses: X quasi-compact and quasi-separated; T closed with X ∖ T quasi-compact.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/affine-support-comparison`

Let R be a commutative ring and s ∈ R, X = Spec R, Z = V(s), S = {s^n}. Under the affine comparison D_perf(Spec R) ≃ D_perf(R) (S.1/affine-perfect-comparison), Perf_Z(X) corresponds to the perfect R-complexes P with P[1/s] acyclic, and the connective cover of the nonconnective K(X on Z) is K(R on S) := K Ch^b_S(P(R)) of GeneralAlgebraicKTheory K.5 (bounded complexes of finitely generated projectives with S^{-1}P exact); the localisation sequence of S.3/localisation-fibre-sequence for (X, D(s)) is identified with Weibel's K(R on S) → K(R) → K(S^{-1}R) (K-book V.2.6.3) in degrees ≥ 0. More generally for Z = V(I) with I finitely generated, Perf_Z(X) is the perfect complexes with I-power-torsion cohomology.

Hypotheses: R commutative; s ∈ R (or I finitely generated, so that X ∖ V(I) is quasi-compact).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/divisor-support-comparison`

Let X be a quasi-compact quasi-separated scheme with an ample family of line bundles (for example quasi-projective over a ring) and Z ⊆ X the closed subscheme of an invertible ideal I ⊆ O_X. Let H_Z(X) be the exact category of O_X-modules supported on Z with a resolution of length ≤ 1 by vector bundles (equivalently pseudo-coherent of Tor-dimension ≤ 1, supported on Z). Then the inclusion H_Z(X) ⊆ Perf_Z(X) induces a homotopy equivalence of connective spectra K(H_Z(X)) ≃ K(X on Z) (K-book Cor. V.7.6.1, TT Exercise 5.7 with k = 1), so the connective localisation sequence reads ⋯ → K_n H_Z(X) → K_n(X) → K_n(U) → ⋯; for X = Spec R and Z = V(s), s a nonzerodivisor, this is Quillen's localisation for nonzerodivisors K(H_s(R)) → K(R) → K(R[1/s]) (K-book V.7.1).

Hypotheses: X with an ample family of line bundles; Z defined by an invertible ideal (an effective Cartier divisor).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/coherent-sheaves-with-support`

For a noetherian scheme X and a closed subset Z ⊆ X, Coh_Z(X) is the full subcategory of the abelian category Coh(X) of coherent O_X-modules F with F|_{X∖Z} = 0, i.e. Supp F ⊆ Z. It is a Serre subcategory (closed under subobjects, quotients and extensions); K(Coh_Z(X)) is its Quillen K-theory spectrum (GeneralAlgebraicKTheory K.1), and G(X) = K(Coh(X)) is S.2/g-theory-of-a-scheme.

Hypotheses: X noetherian (so Coh(X) is abelian and noetherian); Z closed.

Reviewed API: cohSupport: Coh_Z(X) as an ObjectProperty of Coh(X) (or as a full subcategory).
cohSupport.isSerre: Coh_Z(X) is closed under subobjects, quotients and extensions.
cohSupport.mem_iff: F ∈ Coh_Z(X) iff F|_{X∖Z} = 0 iff Supp F ⊆ Z; on Spec A, M~ ∈ Coh_{V(I)} iff Module.support M ⊆ V(I) iff I^n M = 0 for some n.
cohSupport.mono: Z ⊆ Z' implies Coh_Z(X) ⊆ Coh_{Z'}(X).
cohSupport.pushforward: For a closed immersion i: Y → X into noetherian X with |Y| ⊆ Z, i_*: Coh(Y) → Coh_Z(X) is exact.
cohSupport.flatPullback: For flat f: X' → X, f^* maps Coh_Z(X) to Coh_{f^{-1}Z}(X').

Acceptance specifications (not executed):
cohSupport.univ: Coh_X(X) = Coh(X) and Coh_∅(X) = {0}.
cohSupport.Zp: On X = Spec ℤ, ℤ/p^3 ∈ Coh_{V(p)}(X) and ℤ ∉ Coh_{V(p)}(X).
cohSupport.support_compat: On X = Spec A: M~ ∈ Coh_{V(I)}(X) iff Mathlib's Module.support M ⊆ PrimeSpectrum.zeroLocus I (M finitely generated).
cohSupport.not_scheme_structure: Coh_{V(x)}(A¹_k) contains k[x]/(x²), which is not an O_Z-module for the reduced structure Z = Spec k: Coh_Z(X) is not Coh(Z) (they have the same K-theory by S.3/coherent-support-devissage).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/g-theory-localisation`

Let X be a noetherian scheme, i: Z → X a closed subscheme and j: U = X ∖ Z → X. Then G(Z) →i_* G(X) →j^* G(U) is a homotopy fibre sequence, with long exact sequence ⋯ → G_n(Z) → G_n(X) → G_n(U) →∂ G_{n−1}(Z) → ⋯ ending in G_0(Z) → G_0(X) → G_0(U) → 0; negative G-groups vanish. It is a sequence of K_*(X)-modules (tensor with vector bundles, or with perfect complexes of finite Tor-amplitude), natural for flat pullback, and ∂ is K_*(X)-linear in the sense of S.3/boundary-module-linearity. For X = Spec R and Z = V(s): ⋯ → G_n(R/sR) → G_n(R) → G_n(R[1/s]) → ⋯ (K-book (6.1.1)).

Hypotheses: X noetherian; Z closed with any subscheme structure.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/regular-support-devissage`

Let X be a regular noetherian scheme and Z ⊆ X closed. Then K(X on Z) ≃ G(Z) (via S.3/cartan-localisation-comparison and S.3/coherent-support-devissage, for any subscheme structure on Z). If moreover Z is regular for some closed subscheme structure i: Z → X (for example i a regular immersion between regular schemes, or Z a point with its reduced structure), then i_*: K(Z) → K(X on Z), induced by Ri_*: Perf(Z) → Perf_Z(X), is an equivalence, and composing with Cartan maps it is the dévissage equivalence G(Z) ≃ K(Coh_Z(X)). The identity K(X on Z) = K(Z) is not unconditional: it fails when Z is singular (e.g. X = A²_k and Z the nodal cubic y² = x³ + x², where K_{−1}(Z) ≅ ℤ but K_{−1}(X on Z) = G_{−1}(Z) = 0) and for non-reduced subscheme structures (Z = V(x²) ⊂ A¹_k, where K_1(Z) = k^× × k but K_1(X on Z) = k^×).

Hypotheses: X regular noetherian (all local rings regular); Z closed.; For the K(Z) statement: a regular closed subscheme structure on Z; i proper and perfect because X is regular.; The nodal cubic counterexample is over a field of characteristic different from 2, so its normalisation has two branches over the node.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/unit-loop-class`

For a commutative ring A, λ_A: A^× → K_1(Spec A) = π_1 K(Spec A) sends u to the image of the loop u ∈ π_1 BGL_1(A) = GL_1(A) (StableHomotopyKTheory H.1: π_1 of the classifying space of a group) under BGL_1(A) → BGL(A) → BGL(A)^+ (H.3), the identification of BGL(A)^+ with the base-point component of ΩBQP(A) (GeneralAlgebraicKTheory K.2:plus/plus-equals-Q), and K(A) ≃ K(Spec A) in degrees ≥ 1 (SchemeKTheoryOperations S.2/affine-k-theory-comparison). It is a group homomorphism (multiplicative to additive) and natural for ring homomorphisms. It factors as the canonical map GL(A)/E(A) → π_1BGL(A)^+ (H.3's plus construction kills the perfect normal subgroup E(A) = [GL(A), GL(A)], KTheoryLowDegrees U.1/whitehead-lemma) after K1.ofUnits: A^× → K_1(A) (U.3/units-to-K1). That the canonical map is an isomorphism is KTheoryLowDegrees U.6's theorem and is not used here.

Hypotheses: A commutative; the plus construction is taken with respect to E(A) ⊆ GL(A).

Reviewed API: unitLoopClass: λ_A: Additive(A^×) →+ K_1(Spec A), u ↦ loop of the 1 × 1 matrix u.
unitLoopClass_one: λ_A(1) = 0.
unitLoopClass_mul: λ_A(uv) = λ_A(u) + λ_A(v).
unitLoopClass_map: For φ: A → B, φ^* λ_A(u) = λ_B(φ(u)).
unitLoopClass_eq_ofUnits: λ_A = (GL(A)/E(A) → π_1BGL(A)^+ → K_1(Spec A)) ∘ K1.ofUnits (KTheoryLowDegrees U.3/units-to-K1).
unitLoopClass_prod: For u, w ∈ A^×, λ(u)·λ(w) ∈ K_2(Spec A) is the product of GeneralAlgebraicKTheory K.7; it is bilinear in (u, w).

Acceptance specifications (not executed):
unitLoopClass.one: λ_A(1) = 0 for every commutative ring A.
unitLoopClass.dvr_valuation: For O = ℤ_(p), L = ℚ: ∂_S(λ(p²/3)) = 2 for p ≠ 3 (S.3/dvr-boundary-unit-valuation), so λ(p²/3) ≠ 0.
unitLoopClass.not_additive_in_u: λ is multiplicative-to-additive, not additive in u: for O = ℤ_(3), ∂_S λ(3 + 3) = ∂_S λ(6) = 1 whereas ∂_S(λ(3) + λ(3)) = 2.
unitLoopClass.compat_classical: For a field F and u ∈ F^×, λ_F(u) is the image of K1.ofUnits u ∈ K_1(F) (KTheoryLowDegrees U.3) under the canonical map to π_1BGL(F)^+.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/one-dimensional-localisation-sequence`

Let Y be a noetherian scheme of dimension one, with closed points y and generic points η (finitely many). Then there is a long exact sequence ⋯ → ⊕_{y} K_n(k(y)) →⊕(i_y)_* G_n(Y) → ⊕_η K_n(k(η)) →∂ ⊕_y K_{n−1}(k(y)) → ⋯ ending in ⊕_y ℤ → G_0(Y) → ⊕_η ℤ → 0 (sums over closed points y that are not generic, and over generic points η, with G_n(O_{Y,η}) ≅ K_n(k(η)) by dévissage over the artinian local ring). If Y is an integral curve over a field k with function field F, this is ⋯ → ⊕_x K_n(k(x)) → G_n(Y) → K_n(F) →∂ ⊕_x K_{n−1}(k(x)) → ⋯ over the closed points (K-book 6.12), with ∂'s x-component the DVR boundary of O_{Y,x} when Y is regular (then K = G), and in general the boundary of the one-dimensional local domain O_{Y,x} (degree one: the length order ord_x).

Hypotheses: Y noetherian of dimension ≤ 1; for the curve form, Y integral.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.3/arithmetic-surface-localisation`

Let B = Spec A with A a Dedekind domain (for example O_{F,S}) and p: 𝓧 → B a flat finite-type dominant morphism with 𝓧 an integral regular noetherian scheme of dimension two and every nonempty closed fibre pure of dimension one (for example a regular proper flat model of a curve over F). For a finite set V of closed points of B, U = B ∖ V and 𝓧_v = p^{-1}(v): (a) there is a fibre sequence ∏_{v∈V} G(𝓧_v) → K(𝓧) → K(𝓧_U), i.e. K(𝓧 on 𝓧_V) ≃ ⊕_{v∈V} G(𝓧_v); (b) passing to the colimit over V (continuity), K_n(𝓧) → K_n(𝓧_F) →∂ ⊕_{v} G_{n−1}(𝓧_v) → K_{n−1}(𝓧) → ⋯ with 𝓧_F the generic fibre, in particular K_2(𝓧) → K_2(𝓧_F) → ⊕_v G_1(𝓧_v); (c) the codimension-two terms are retained: for each v, S.3/one-dimensional-localisation-sequence for the curve 𝓧_v gives ⊕_{x∈𝓧_v closed} K_1(k(x)) → G_1(𝓧_v) → ⊕_{C} K_1(k(C)) →∂ ⊕_x K_0(k(x)) → G_0(𝓧_v) → ⊕_C ℤ → 0 over the irreducible components C (generic points c) of 𝓧_v, and G_1(𝓧_v) is not replaced by ⊕_C k(C)^×: its kernel term ⊕_x k(x)^× (each summand finite when its residue field is finite; their direct sum need not be finite) and the cokernel term ⊕_x ℤ are part of the statement.

Hypotheses: A Dedekind; 𝓧 integral regular noetherian of dimension 2; p flat, finite type and dominant with nonempty closed fibres pure of dimension one; V finite. Parts (a) and (b) have broader localisation generality, but part (c) uses the fibre-dimension hypothesis.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/zariski-mayer-vietoris`

Let X be quasi-separated, U, V ⊆ X quasi-compact opens and Z ⊆ U ∪ V closed with (U ∪ V) ∖ Z quasi-compact. Then the square K(U ∪ V on Z) → K(U on U ∩ Z), K(V on V ∩ Z) → K(U ∩ V on U ∩ V ∩ Z) of nonconnective spectra (restrictions) is homotopy cartesian; for Z = U ∪ V this is K(U ∪ V) → K(U) × K(V) → K(U ∩ V), with long exact sequence ⋯ → K_n(U ∪ V) → K_n(U) ⊕ K_n(V) →± K_n(U ∩ V) →∂ K_{n−1}(U ∪ V) → ⋯ in all degrees (TT 8.1, K-book V.7.10). In the terminology of S.4/mayer-vietoris-property, U ↦ K(U on U ∩ Z) has the Zariski Mayer–Vietoris property on qcqs schemes.

Hypotheses: X quasi-separated; U, V quasi-compact opens; Z closed in U ∪ V with quasi-compact complement.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/mayer-vietoris-property`

Let X be a scheme (or a noetherian topological space). A presheaf of spectra F on the opens of X (valued in StableHomotopyKTheory H.5's spectra) has the Mayer–Vietoris property (for the Zariski topology) if for all opens U, V ⊆ X the square F(U ∪ V) → F(U), F(V) → F(U ∩ V) is homotopy cartesian, and F(∅) ≃ 0 (K-book V.10.1). For a noetherian scheme it suffices to ask this for quasi-compact opens. The Nisnevich variant asks the same for every elementary distinguished square of S.4/nisnevich-site (K-book V.10.9), which contains the Zariski one (take the square of an open cover X = U ∪ V).

Hypotheses: F a presheaf of spectra on the opens of X; homotopy cartesian squares as in H.5 (fibres of the two horizontal maps agree).

Reviewed API: HasMayerVietoris: HasMayerVietoris F : Prop, for F a presheaf of spectra on Opens X.
HasMayerVietoris.les: For U, V: the long exact sequence ⋯ → π_nF(U ∪ V) → π_nF(U) ⊕ π_nF(V) → π_nF(U ∩ V) → π_{n−1}F(U ∪ V) → ⋯.
HasMayerVietoris.of_equiv: Invariance under objectwise equivalences F ≃ F'.
HasMayerVietoris.fib: If F → E → B is objectwise a fibre sequence and E, B have the property, so does F (K-book Ex. V.10.1).
HasMayerVietoris.restrict: The property restricts to any open W ⊆ X.
HasMayerVietoris.nisnevich: HasNisnevichMayerVietoris F for presheaves on the Nisnevich site: F(∅) ≃ 0 and elementary distinguished squares go to homotopy cartesian squares; implies HasMayerVietoris on the Zariski opens.

Acceptance specifications (not executed):
HasMayerVietoris.ktheory: U ↦ K(U) on a qcqs scheme has the property (S.4/zariski-mayer-vietoris).
HasMayerVietoris.zero: The zero presheaf has the property; a presheaf with F(∅) ≄ 0 does not.
HasMayerVietoris.constant_fails: The constant presheaf U ↦ Hℤ (Eilenberg–Mac Lane spectrum of ℤ, including U = ∅) satisfies every square condition (all its maps are identities) but fails the property because F(∅) = Hℤ is not zero. This tests the empty-object normalisation separately from square excision.
HasMayerVietoris.sheaf_compat: For an abelian sheaf A on X with an injective resolution I, the presheaf of Eilenberg–Mac Lane spectra U ↦ H(I(U)) has the property, and π_{−n} of its value at X is Mathlib's sheaf cohomology Sheaf.H A n (K-book Example V.10.6.1).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/brown-gersten-vanishing`

Let X be a noetherian topological space of finite Krull dimension and F a presheaf of spectra on X with the Mayer–Vietoris property (S.4/mayer-vietoris-property). If every presheaf of homotopy groups π_qF has zero associated sheaf, then π_qF(X) = 0 for all q (K-book Proposition V.10.8, Brown–Gersten).

Hypotheses: X noetherian of finite Krull dimension; F with the Zariski Mayer–Vietoris property; a(π_qF) = 0 for all q.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/nisnevich-cohomological-dimension`

Let X be a noetherian scheme. (a) X_Nis has enough points, given by the henselisations O^h_{X,x} at finite separable residue extensions (TT E.5). (b) X_Nis is a noetherian (coherent) topos: every Nisnevich cover of a quasi-compact object has a finite subcover (TT E.6(a)). (c) If X has finite Krull dimension N, then H^q_Nis(X, F) = 0 for q > N and every abelian sheaf F (TT E.6(c)). (d) If X has finite Krull dimension, Nisnevich hypercohomology of presheaves of spectra commutes up to homotopy with filtered colimits (TT E.6(d)).

Hypotheses: X noetherian; (c), (d) with finite Krull dimension.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/k-coniveau-spectral-sequence`

Let X be a noetherian scheme of finite Krull dimension and Y ⊆ X closed. The tower S^•K(X on Y) of S.4/codimension-support-filtration, with layers ⊕_{codim x = p} K(Spec O_{X,x} on x ∩ Y) (S.4/coniveau-layer-fibre-sequence evaluated on X), gives an exact couple D_1^{p,q} = π_{−p−q}S^pK, E_1^{p,q} = ⊕_{x∈Y, codim_X x = p} K_{−p−q}(O_{X,x} on x) and a bounded, strongly convergent spectral sequence E_1^{p,q} ⇒ K_{−p−q}(X on Y) whose abutment filtration is the coniveau filtration F^p. It is natural for flat maps. If X is regular, E_1^{p,q} ≅ ⊕_{x∈Y, codim_X x = p} K_{−p−q}(k(x)) and the spectral sequence is identified with Quillen's G-theory coniveau spectral sequence (S.4/k-coniveau-first-page-regular); for singular X the local terms K(O_{X,x} on x) are not K(k(x)) in general.

Hypotheses: X noetherian of finite Krull dimension; Y closed.

Reviewed API: kConiveauSS: The spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(O_{X,x} on x ∩ Y) ⇒ K_{−p−q}(X on Y).
kConiveauSS.converges: Strong convergence to K_*(X on Y) with the coniveau filtration F^p; E_1^{p,q} = 0 unless 0 ≤ p ≤ dim X.
kConiveauSS.flat: Natural for flat morphisms.
kConiveauSS.edge: The edge map K_n(X) → E_1^{0,−n} = ⊕_{generic η} K_n(O_{X,η}) is restriction to the generic points.
kConiveauSS.regular: For X regular, E_1^{p,q} ≅ ⊕ K_{−p−q}(k(x)) and the spectral sequence is Quillen's (S.4/k-coniveau-first-page-regular).

Acceptance specifications (not executed):
kConiveauSS.dvr: For O = ℤ_(p): E_1^{0,−1} = K_1(ℚ), E_1^{1,−1} = K_0(ℤ_(p) on (p)) ≅ ℤ, d_1(λ(p)) = 1.
kConiveauSS.field: For X = Spec k the spectral sequence is concentrated in p = 0 with E_1^{0,−n} = K_n(k).
kConiveauSS.singular_local_term: For X = Spec k[ε]/(ε²) (dimension 0), E_1^{0,−n} = K_n(k[ε]/(ε²)), which is not K_n(k) (K_1 = k^× × k): the first page is not ⊕ K(k(x)) without regularity.
kConiveauSS.G_compat: For X = A²_k the spectral sequence agrees with Quillen's (K = G), with E_1^{2,−2} = ⊕_{closed x} ℤ.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/g-coniveau-spectral-sequence`

Let X be a noetherian scheme of finite Krull dimension. The localisation sequences K(M^{p+1}(X)) → K(M^p(X)) → K(M^p/M^{p+1}) (GeneralAlgebraicKTheory K.3) form an exact couple D_1^{p,q} = K_{−p−q}(M^p(X)), E_1^{p,q} = K_{−p−q}(M^p/M^{p+1}) ≅ ⊕_{codim x = p} K_{−p−q}(k(x)), giving a bounded, convergent fourth-quadrant cohomological spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X) (Quillen 5.4, Gersten; K-book V.9.5), with abutment filtration the coniveau filtration F^pG_n(X) = im(K_nM^p(X) → G_n(X)). Its edge maps G_n(X) → E_1^{0,−n} = ⊕ K_n(k(η)) (generic points) are restriction to generic points (X reduced), its d_1 components are residues (S.4/coniveau-residue-differential), E_2^{p,−p} = CH^p(X) (S.4/coniveau-chow-group), and it is contravariant for flat maps (S.4/coniveau-flat-functoriality). For X not finite-dimensional, no convergence is asserted without the completeness and derived-limit hypotheses of H.6; see the review gap.

Hypotheses: X noetherian of finite Krull dimension.

Reviewed API: coniveauSS: The spectral sequence E_1^{p,q} = ⊕_{codim x = p} K_{−p−q}(k(x)) ⇒ G_{−p−q}(X).
coniveauSS.exactCouple: The exact couple (D_1, E_1) from the localisation sequences of M^{p+1} ⊆ M^p.
coniveauSS.converges: Convergence to G_*(X) with filtration F^pG_n(X) = im(K_nM^p(X) → G_n(X)); E_1^{p,q} = 0 unless 0 ≤ p ≤ dim X and p + q ≤ 0.
coniveauSS.edge: The edge map G_n(X) → ⊕_η K_n(k(η)) is restriction to the generic points. For nonreduced X, use Artinian dévissage at generic local rings rather than identifying the local ring with k(η); this is the dévissage already supplied by S.4/coniveau-quotient-decomposition.
coniveauSS.d1: The components of d_1 are residues (S.4/coniveau-residue-differential); on K_1 they are length orders (S.4/coniveau-weight-one-differential).
coniveauSS.d1_d1: d_1 ∘ d_1 = 0 (S.4/residue-composite-vanishes).
coniveauSS.E2_chow: E_2^{p,−p} ≅ CH^p(X) (S.4/coniveau-chow-group).
coniveauSS.flat: Contravariant for flat maps (S.4/coniveau-flat-functoriality).
coniveauSS.proper: For a proper map f: X → Y with a support-dimension estimate ensuring f_*M^i(X) ⊆ M^{i−d}(Y) on bounded coherent complexes, the resulting filtered derived functor induces the shifted spectral-sequence map. Pure-dimensional catenary schemes with a dimension formula provide the intended codimension shift; relative fibre dimension alone does not. Establish filtered functoriality and coherent pushforward before applying H.6 (K-book Ex. V.9.3).
coniveauSS.K_compat: For X regular it is the K-theoretic coniveau spectral sequence of S.4/k-coniveau-spectral-sequence (S.4/k-coniveau-first-page-regular).

Acceptance specifications (not executed):
coniveauSS.dvr: X = Spec ℤ_(p): E_1^{0,−1} = ℚ^× (via λ), E_1^{1,−1} = K_0(𝔽_p) = ℤ, d_1 = v_p; E_2^{1,−1} = 0, E_2^{0,−1} = ℤ_(p)^×.
coniveauSS.field: X = Spec k: only the column p = 0, E_1^{0,−n} = K_n(k), E_2 = E_1.
coniveauSS.P1: X = P¹_k: E_2^{1,−1} = CH^1(P¹) = ℤ and E_2^{0,0} = ℤ, so G_0(P¹) ≅ ℤ² (with S.5's projective-line theorem as a cross-check).
coniveauSS.nonreduced: X = Spec k[ε]/(ε²): E_1^{0,−n} = K_n(k) (residue field), not K_n(k[ε]/(ε²)): the first page sees residue fields only, matching G = K(k) (dévissage), and differs from K_n(X) (K_1(X) = k^× × k).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/coniveau-chow-group`

Let X be a noetherian scheme of finite Krull dimension. Then E_2^{p,−p} of the coniveau spectral sequence is CH^p(X) := Z^p(X)/R^p(X), where Z^p(X) is the free abelian group on points of codimension p (Mathlib's AlgebraicCycle, codimension-p part) and R^p(X) is generated by div_Y(f) = Σ_x ord_x^Y(f)[x] for Y the closure of a point of codimension p − 1 and f ∈ k(Y)^× (K-book Lemma V.9.1.1, Proposition V.9.5; Fulton's rational equivalence in the form of divisors of rational functions on subvarieties). For X pure-dimensional and of finite type over a field this is Fulton's Chow group of codimension-p cycles (K-book Lemma V.9.4.1, whose comparison with the X × P¹ definition is imported from SchemeAndStackFoundations SF.5). For p = 1 and X normal, CH^1(X) is the Weil divisor class group.

Hypotheses: X noetherian of finite Krull dimension (Fulton comparison: X of finite type over a field).; For a general noetherian X the statement uses the codimension-graded divisor relation from the coniveau differential: retain only specialisations of codimension p. Identification with a dimension-graded Chow group requires the dimension formula (in particular, the pure-dimensional finite-type-over-a-field case).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/one-dimensional-coniveau`

Let X be a noetherian scheme of dimension one. Its coniveau spectral sequence has two columns: E_1^{0,−n} = ⊕_η K_n(k(η)), E_1^{1,−n−1} = ⊕_{x closed, not generic} K_n(k(x)), d_1 = the residue maps ∂ of S.3/one-dimensional-localisation-sequence; hence E_2 = E_∞ and for every n there is a short exact sequence 0 → coker(∂: ⊕_η K_{n+1}(k(η)) → ⊕_x K_n(k(x))) → G_n(X) → ker(∂: ⊕_η K_n(k(η)) → ⊕_x K_{n−1}(k(x))) → 0, whose maps are those of the localisation sequence, with F^1G_n(X) = im(⊕_x (i_x)_*: ⊕_x K_n(k(x)) → G_n(X)). For X regular (a regular curve), G = K. This is the curve case used directly, without Gersten's conjecture: the exact couple is the single localisation sequence of M^1 ⊆ M^0.

Hypotheses: X noetherian of dimension ≤ 1.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/quillen-presentation-lemma`

Let R be a smooth finite-type algebra of constant relative dimension r ≥ 1 over a field k, t ∈ R a regular element and S ⊆ Spec R a finite set. Then there are x_1, …, x_{r−1} ∈ R, algebraically independent over k, such that for B = k[x_1, …, x_{r−1}] ⊆ R: (i) R/tR is finite over B, and (ii) R is smooth over B at the points of S (Quillen Lemma 5.12; K-book Lemma V.9.6.2 states it for infinite k in the form: a projection Spec R → A^{r−1} finite on V(t) and smooth at S).

Hypotheses: k a field (Quillen); the K-book restricts to infinite k and treats finite fields in S.4/quillen-effacement by a transfer argument, which is then not needed.; R smooth of constant relative dimension r ≥ 1 over k; t regular; S finite (replace each prime by a maximal ideal containing it).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/quillen-effacement`

Let R be a smooth domain of finite type over a field k and S ⊆ R a multiplicative set with S^{-1}R semilocal. For every t ∈ R ∖ ({0} ∪ S) there is s ∈ S such that for every i the exact functor M^i(R/tR) → M^i(R[1/s]), N ↦ N[1/s] (N viewed as an R-module; codimensions in R/tR shifted into R), induces the zero map on K-groups (K-book Proposition V.9.6.1, Quillen proof of 5.11).

Hypotheses: R smooth domain of finite type over k; S^{-1}R semilocal; t ≠ 0, t ∉ S.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/gersten-power-series`

The Gersten–Quillen condition holds for A = k[[x_1, …, x_n]] over a field k, and for the ring of convergent power series in x_1, …, x_n over a field complete for a nontrivial absolute value (Quillen 5.13, K-book Ex. V.9.2).

Hypotheses: k a field (complete valued for the convergent case).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.4/mixed-char-higher-effacement`

Let R be a regular semilocal Λ-algebra as in S.4/gillet-levine-smooth-over-dvr (R = S^{-1}A, A smooth over the mixed-characteristic DVR Λ). Then for i ≥ 1 the map K M^{i+1}(R) → K M^i(R) is null-homotopic (K-book Corollary V.9.7.1(a)).

Hypotheses: As in S.4/gillet-levine-smooth-over-dvr; i ≥ 1.; The proof’s single DVR D = R_(πR) requires R to be a domain and πR a nonzero prime proper ideal. In the general semilocal smooth branch use the product of the local DVRs at all special-fibre generic points; do not treat πR as one prime.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/graded-quillen-lemma`

Let S = ⊕_{n≥0} S_n be a commutative graded noetherian ring with R := S_0, such that S is flat as an R-module and R = S/S_+ has finite flat dimension as an S-module. Let Mgr(S) be the abelian category of finitely generated ℤ-graded S-modules, and let σ be the shift automorphism σ(M) = M(−1), which makes K_*Mgr(S) a ℤ[σ, σ⁻¹]-module. Then the map β: G_i(R) ⊗_ℤ ℤ[σ, σ⁻¹] → K_iMgr(S), [M]·σⁿ ↦ [(M ⊗_R S)(−n)], induced by the exact functor M ↦ M ⊗_R S, is an isomorphism of ℤ[σ, σ⁻¹]-modules for every i ≥ 0. Its inverse is induced by M ↦ M ⊗_S R on the resolving subcategory Pgr of graded modules Tor-independent of R, followed by K_iMgr(R) ≅ ⊕_{n∈ℤ} G_i(R). The same holds for the category Mgr,≥0(S) of positively graded modules with ℤ[σ] in place of ℤ[σ, σ⁻¹].

Hypotheses: S is commutative, graded by ℕ, noetherian, and flat over R = S_0; R = S/S_+ has finite flat (Tor) dimension over S.; G_i(R) = K_i(M(R)) is Quillen's K-theory of finitely generated R-modules (S.2's G-theory of the affine scheme Spec R).; Graded modules are ℤ-graded and finitely generated; σ(M)_n = M_{n−1}.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/g-theory-homotopy-invariance`

For every noetherian scheme X, the flat projection p: X[s] → X induces a homotopy equivalence p^*: G(X) ≃ G(X[s]), with homotopy inverse z^* (the zero section). Hence G_n(X) ≅ G_n(X[s]) for all n ≥ 0, and by induction G(X) ≃ G(A^m_X) for all m.

Hypotheses: X noetherian (quasi-compact, covered by finitely many spectra of noetherian rings); no separatedness or regularity is assumed.; G(X) = K(Coh X) (S.2/g-theory-of-a-scheme); p^* is flat pullback.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/negative-k-vanishing-regular`

Let X be a regular noetherian scheme. Then K_n(X) = 0 for all n < 0 in S.2's non-connective K-theory, i.e. the connective cover K(X)⟨0⟩ → K(X) is an equivalence. The regularity hypothesis is needed: the node B = k[x, y]/(y² − x³ + x²) has K_{−1}(B) ≅ ℤ.

Hypotheses: X regular noetherian.; Negative K-groups are π_n of S.2's non-connective K; by S.5/nk-decomposition they satisfy Bass's contraction formula.; The nodal cubic counterexample is over a field of characteristic different from 2, so its normalisation has two branches over the node.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/projective-bundle-cohomology`

Conventions: E is a vector bundle (finite locally free O_X-module) of constant rank r ≥ 1; π: P(E) = Proj_X(Sym E) → X is its projective bundle with the tautological surjection π^*E → O(1) (Grothendieck's convention: rank-one quotients of E; K-book I.5.8, Thomason–Trobaugh, Stacks), so P(O_X^{⊕r}) = P^{r−1}_X; F(n) := F ⊗ O(n). Then: (a) R^qπ_* preserves quasi-coherence, and coherence when X is locally noetherian; (b) R^qπ_*F = 0 for q ≥ r and every quasi-coherent F; (c) if X is noetherian and F coherent, there is n₀ with R^qπ_*(F(n)) = 0 for all n ≥ n₀ and q ≥ 1; (d) R^qπ_*(F ⊗ π^*M) ≅ R^qπ_*(F) ⊗ M for F quasi-coherent on P(E) and M flat quasi-coherent on X; (e) if r ≥ 2, then for every n ∈ ℤ, π_*O(n) ≅ Sym^n E (zero for n < 0), R^{r−1}π_*O(n) ≅ (Sym^{−r−n}E)^∨ ⊗ (Λ^r E)^∨, and R^qπ_*O(n) = 0 for q ≠ 0, r − 1 (for r = 1, π is an isomorphism and O(n) ≅ E^{⊗n}, so π_*O(n) = E^{⊗n} for all n); (f) R^qπ_*(O(n) ⊗ π^*M) ≅ R^qπ_*(O(n)) ⊗ M for every quasi-coherent M. Consequently Rπ_*O ≃ O_X, Rπ_*O(−i) ≃ 0 for 1 ≤ i ≤ r − 1, and Rπ_*(π^*G ⊗ O(−i)) ≃ 0 for 1 ≤ i ≤ r − 1 and every perfect G (derived projection formula).

Hypotheses: X a scheme (quasi-compact and quasi-separated where derived images are formed); E of constant rank r ≥ 1.; P(E), O(1) and their base change are imported from AlgebraicModuliForArithmeticGeometry R09.1.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/bass-fundamental-theorem`

Let X be quasi-compact and quasi-separated and Z ⊂ X closed with X − Z quasi-compact. For every n ∈ ℤ there is a natural exact sequence 0 → K_n(X on Z) →(p^*, p₋^*) K_n(X[T] on Z[T]) ⊕ K_n(X[T⁻¹] on Z[T⁻¹]) →(j₊^* − j₋^*) K_n(X[T, T⁻¹] on Z[T, T⁻¹]) →(∂_T) K_{n−1}(X on Z) → 0 of S.2's non-connective K-groups, where ∂_T is the Mayer–Vietoris boundary of the cover P¹_X = X[T] ∪ X[T⁻¹] followed by projection of K_{n−1}(P¹_X on P¹_Z) onto the coefficient of [O] − [O(−1)]. It comes from a homotopy fibre sequence of spectra K(X on Z) → K(X[T] on Z[T]) ∪_{K(X on Z)} K(X[T⁻¹] on Z[T⁻¹]) → K(X[T, T⁻¹] on Z[T, T⁻¹]) → ΣK(X on Z). Consequently (Bass contraction) K_{n−1}(X on Z) ≅ coker(K_n(X[T] on Z[T]) ⊕ K_n(X[T⁻¹] on Z[T⁻¹]) → K_n(X[T, T⁻¹] on Z[T, T⁻¹])) naturally, for every n ∈ ℤ.

Hypotheses: X quasi-compact and quasi-separated; Z closed with X − Z quasi-compact (absolute case Z = X).; K is S.2's non-connective K; the proof uses S.4's Zariski Mayer–Vietoris squares and S.3's supports in all degrees, and does not use any comparison with Thomason–Trobaugh's K^B.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/affine-fundamental-theorem-comparison`

For X = Spec R with R commutative, under S.2/affine-k-theory-comparison (K(Spec R) ≃ K(R), non-connective, compatible with pullback along ring maps), the exact sequence of S.5/bass-fundamental-theorem is GeneralAlgebraicKTheory K.6's ring fundamental theorem 0 → K_n(R) → K_n(R[t]) ⊕ K_n(R[t⁻¹]) → K_n(R[t, t⁻¹]) → K_{n−1}(R) → 0, the boundaries agree up to the universal sign ε of S.5/bass-boundary-splitting, h_T(x) = ε·([t] ∪ x), where [t] is the K₁ class of the Laurent unit and ε ∈ {±1} acts on the additive K-group, NK_n(Spec R) = NK_n(R), and the Nil terms are identified by Nil_n(R) ≅ NK_{n+1}(R) (K-book V.8.1). For singular R the Nil terms need not vanish: NK_1(k[ε]) ≅ Nil_0(k[ε]) ≅ (1 + εT·k[T])^×.

Hypotheses: R commutative; K-groups of R are K.6's (Bass's in negative degrees, agreeing with the non-connective K of perfect complexes, GeneralAlgebraicKTheory K.6/agreement-and-vanishing-of-negative-K, ring clause).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.5/blowup-exceptional-divisor-tests`

(a) d = 1: X′ = X and the blow-up formula is the identity K(X) ≃ K(X). (b) Let X be a regular noetherian scheme of dimension two and x a closed point with dim O_{X,x} = 2 (the maximal ideal of the regular local ring O_{X,x} is generated by a regular sequence of length 2, so x → X is regular of codimension 2), E := p⁻¹(x) ≅ P¹_{k(x)}. Then K_n(X′) ≅ K_n(X) ⊕ K_n(k(x)), the second summand embedded by y ↦ i′_*(p′^*y) ⊗ [O_{X′}(−1)] = i′_*(y·[O_E(−1)]); in K_0, i′_*[O_E(−1)] = [O_{X′}(−1)] − [O_{X′}] = [O_{X′}(E)] − 1 and i′_*[O_E] = 1 − [O_{X′}(1)] = 1 − [O_{X′}(−E)]. (c) For a field k: K_0(Bl_0 A²_k) ≅ ℤ², with basis 1 and i′_*[O_E(−1)]; K_0(Bl_x P²_k) ≅ ℤ⁴ for a rational point x. (d) On the exceptional curve, i′_*[O_E(m)] = (m + 1)·i′_*[O_E] − m·i′_*[O_E(−1)] for all m ∈ ℤ.

Hypotheses: X regular noetherian of dimension two for (b); k a field for (c).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/support-product-pairings`

Let X be a quasi-compact quasi-separated scheme and Y, Z ⊆ X closed subsets with quasi-compact complements. The derived tensor product of perfect complexes, computed on the model of bounded-above flat perfect complexes, restricts to a biexact functor Perf_Y(X) × Perf_Z(X) → Perf_{Y∩Z}(X) (a complex acyclic off Y tensored with one acyclic off Z is acyclic off Y ∩ Z), and hence induces pairings of spectra K(X on Y) ∧ K(X on Z) → K(X on Y ∩ Z) and, for X noetherian, K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z), with the same statements for the nonconnective spectra. On homotopy groups they give bilinear products K^Y_m(X) ⊗ K^Z_n(X) → K^{Y∩Z}_{m+n}(X), m, n ≥ 0 (all m, n ∈ ℤ nonconnectively). For Y = Z = X they are the pairings of S.2/tensor-product-pairings, and they are compatible with the maps forgetting supports K(X on Y) → K(X on Y') for Y ⊆ Y'.

Hypotheses: X qcqs; Y, Z closed with X − Y, X − Z quasi-compact (the hypothesis under which the support categories of S.3 are defined).; The G-theory pairing needs X noetherian.; The products are defined up to canonical homotopy; their homotopy-group products are strict.

Reviewed API: TauCeti.AlgebraicGeometry.KTheory.supportPairing: The pairing K(X on Y) ∧ K(X on Z) → K(X on Y ∩ Z).
TauCeti.AlgebraicGeometry.KTheory.supportMul: The bilinear product K^Y_m(X) ⊗ K^Z_n(X) → K^{Y∩Z}_{m+n}(X).
TauCeti.AlgebraicGeometry.KTheory.supportMul_forget: Forgetting supports commutes with the products.
TauCeti.AlgebraicGeometry.KTheory.supportMul_self: For Y = Z = X the product is that of S.2/tensor-product-pairings.
TauCeti.AlgebraicGeometry.KTheory.supportMul_zero_class: On π_0 the product of [E] and [F] is [E ⊗^L F].
TauCeti.AlgebraicGeometry.KTheory.gSupportPairing: The pairing K(X on Y) ∧ G(X on Z) → G(X on Y ∩ Z), X noetherian.

Acceptance specifications (not executed):
supportMul_disjoint: If Y ∩ Z = ∅ the pairing lands in K(X on ∅) ≃ 0, so every product vanishes.
supportMul_point_line: On X = A²_k with Y = {x = 0}, Z = {y = 0}: [O_Y]·[O_Z] = [O_{Y∩Z}] = [k(0)] in K^{0}_0(A²_k), because the Koszul complexes of x and y tensor to that of (x, y).
supportMul_non_unital: A proper support can give a nonunital product: on X = Spec k[t], Y = {0}, K^Y_0(X) ≅ K_0(k) = ℤ·[k(0)] with [k(0)]² = [k(0) ⊗^L k(0)] = [k(0)] − [k(0)] = 0.
supportMul_self_compat: For Y = Z = X the product equals S.2/tensor-product-pairings on K_*(X).
supportMul_clopen_unit: For X = Spec k ⊔ Spec k and Y the first component, Perf_Y(X) ≃ Perf(k) under tensor, so K^Y_0(X) ≅ ℤ has a unit [O_Y], despite Y ≠ X.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/external-product`

Let S be a scheme, X and Z qcqs S-schemes with X flat over S and X ×_S Z qcqs, and Y ⊆ X, W ⊆ Z closed with quasi-compact complements. External tensor product (E, F) ↦ pr_1^*E ⊗_{O_{X×_SZ}} pr_2^*F is biexact on the flat perfect models and induces the external product ⊠: K(X on Y) ∧ K(Z on W) → K(X ×_S Z on Y ×_S W), with K(X) ∧ G(Z) → G(X ×_S Z) for Z noetherian and X ×_S Z noetherian. The internal product of S.6/support-product-pairings is recovered by pulling back along the diagonal: x·y = Δ^*(x ⊠ y) for x ∈ K^Y(X), y ∈ K^Z(X), Δ: X → X ×_S X (S = X, or S = Spec ℤ with X flat over ℤ). The external product is bilinear, associative, and natural for pullback along maps of S-schemes.

Hypotheses: X flat over S (so that the external tensor product represents the derived one; TT 3.15.6). Without flatness the external product is defined through derived tensor products on X ×_S Z.; Supports are closed subsets with quasi-compact complements.; Require the fibre product to be qcqs; quasi-separated S is a sufficient condition when X and Z are qcqs. Individual qcqs schemes over an arbitrary base do not ensure this.

Reviewed API: TauCeti.AlgebraicGeometry.KTheory.externalPairing: ⊠: K(X on Y) ∧ K(Z on W) → K(X ×_S Z on Y ×_S W).
TauCeti.AlgebraicGeometry.KTheory.externalMul_assoc: (x ⊠ y) ⊠ z = x ⊠ (y ⊠ z) under the associativity isomorphism of fibre products.
TauCeti.AlgebraicGeometry.KTheory.diag_externalMul: Δ^*(x ⊠ y) = x·y.
TauCeti.AlgebraicGeometry.KTheory.externalMul_pullback: (f × g)^*(x ⊠ y) = f^*x ⊠ g^*y for maps of S-schemes.
TauCeti.AlgebraicGeometry.KTheory.externalMul_one: [O_X] ⊠ y = pr_2^*y.
TauCeti.AlgebraicGeometry.KTheory.gExternalPairing: K(X) ∧ G(Z) → G(X ×_S Z) for noetherian Z and X ×_S Z.

Acceptance specifications (not executed):
externalMul_point: For X = Z = S the external product is the internal product of S.6/graded-commutative-ring.
externalMul_structure_sheaf: [O_X] ⊠ [O_Z] = [O_{X ×_S Z}] in K_0(X ×_S Z).
externalMul_projective_line: On P^1_k × P^1_k, ([O] − [O(−1)]) ⊠ ([O] − [O(−1)]) is the class of the structure sheaf of a point (Koszul resolution of a point as intersection of two lines).
diag_externalMul_compat: Δ^*(x ⊠ y) equals the product of S.2/tensor-product-pairings on K_*(X).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/non-unital-gamma-filtration`

Let K_0 be a special λ-ring augmented by ε_0: K_0 → H (KTheoryLowDegrees Z.3/augmented-lambda-ring) and I a non-unital λ-algebra over K_0 (S.6/non-unital-lambda-algebra), so that K_0 ⊕ I is an augmented special λ-ring with ε(a, x) = ε_0(a). For n ≥ 0 put F^n_γI := I ∩ F^n_γ(K_0 ⊕ I), where F^n_γ(K_0 ⊕ I) is the γ-filtration of Z.3/gamma-filtration. Then F^0_γI = F^1_γI = I, F^{n+1}_γI ⊆ F^n_γI, each F^n_γI is a K_0-submodule of I, F^i_γK_0 · F^j_γI ⊆ F^{i+j}_γI, and gr^n_γI = F^n_γI/F^{n+1}_γI is a module over K_0/F^1_γK_0 ≅ H. If I·I = 0 (the groups K_m(A) and K^Y_m(X), m ≥ 1), F^n_γI is the subgroup generated by the elements b·γ^j(x) with b ∈ K_0, x ∈ I, j ≥ n, and a·γ^j(x) with a ∈ F^i_γK_0, x ∈ I, i, j ≥ 1 and i + j ≥ n; for H = ℤ the factor b can be dropped, which is the K-book's description of F^n_γK_m(A). If moreover I·I = 0 and I = ⊕_m I_m with each I_m stable under the λ^k, then F^n_γI = ⊕_m (I_m ∩ F^n_γI). For K(A) = K_0(A) ⊕ ⊕_{m≥1}K_m(A) this is Soulé's F^i_γK_m(A) = K_m(A) ∩ F^i_γK(A) (for Spec A connected, H = ℤ, and his additive span agrees with the ideal by Z.3/gamma-filtration-eq-span); the same construction gives F^i_γK^Y_m(X).

Hypotheses: K_0 an augmented special λ-ring (Z.3/special-lambda-ring, Z.3/augmented-lambda-ring); I a non-unital λ-algebra over K_0.; The description by generators needs I·I = 0; for general I (such as K^Y_0(X) with Y ≠ X) only the definition by intersection is used.

Reviewed API: TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration: F^n_γI = I ∩ F^n_γ(K_0 ⊕ I), a K_0-submodule of I.
TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_zero_one: F^0_γI = F^1_γI = I.
TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_antitone: F^{n+1}_γI ⊆ F^n_γI.
TauCeti.LambdaRing.NonUnitalAlgebra.smul_mem_gammaFiltration: a ∈ F^i_γK_0 and x ∈ F^j_γI give a·x ∈ F^{i+j}_γI.
TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_eq_span_of_mul_eq_zero: If I·I = 0, F^n_γI is the subgroup generated by b·γ^j(x) (b ∈ K_0, j ≥ n) and a·γ^j(x) (a ∈ F^i_γK_0, i, j ≥ 1, i + j ≥ n).
TauCeti.LambdaRing.NonUnitalAlgebra.gammaFiltration_map: Morphisms of non-unital λ-algebras over K_0 preserve F^n_γ.
TauCeti.LambdaRing.NonUnitalAlgebra.gammaGraded: gr^n_γI = F^n_γI/F^{n+1}_γI.

Acceptance specifications (not executed):
nonUnital_gammaFiltration_units: Over K_0 = ℤ (H = ℤ), if I·I = 0, I = ℤx and λ^k(x) = (−1)^{k−1}x for k ≥ 1 (ε ∈ ℤ[ε]/(ε²), or K_1 of a field generated by one unit), then γ_t(mx) = 1 + mxt, so F^1_γI = I and F^2_γI = 0.
nonUnital_gammaFiltration_zero: F^0_γI = F^1_γI = I; for I = 0 every F^n_γI is 0.
nonUnital_gammaFiltration_augmentationIdeal: For J = ker ε_0 with the structure ofLambdaIdeal (S.6/non-unital-lambda-algebra), F^n_γJ = F^n_γK_0 of Z.3/gamma-filtration for n ≥ 1.
nonUnital_gammaFiltration_not_adic: I·I = 0 does not force F^2_γI = 0: for I = ℤη, η = εδ in ℤ[ε, δ]/(ε², δ²) = ℤ[u^{±1}, v^{±1}]/((u − 1)², (v − 1)²) (ε = u − 1, δ = v − 1, a λ-ideal quotient of the monoid λ-ring of ℤ²), λ^k(η) = (−1)^{k−1}kη and γ_t(η) = 1 + η(t − t²), so η = −γ²(η) ∈ F^2_γI = I; this models K_2(F) = F^2_γK_2(F) (S.6/kratzer-low-gamma).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/adams-eigenvalue-on-gamma-graded`

Let K be an augmented special λ-ring and n ≥ 1, with k ≥ 1 for the displayed λ and Adams congruences. For x ∈ F^n_γ K: ψ^k(x) ≡ k^n x, λ^k(x) ≡ (−1)^{k−1}k^{n−1}x and γ^n(x) ≡ (−1)^{n−1}(n−1)! x modulo F^{n+1}_γ K. More precisely, for x ∈ ker ε and i ≥ 1, ψ^k(γ^i(x)) − k^iγ^i(x) = Q_{k,i}(γ^1(x), γ^2(x), …) for a universal integer polynomial Q_{k,i} all of whose monomials have weight ≥ i + 1 (γ^j of weight j). In Soulé's notation every natural operation τ acts on gr^i_γ by a universal constant ω_i(τ), with ω_i(ψ^k) = k^i, ω_i(λ^k) = (−1)^{k−1}k^{i−1}, ω_i(γ^i) = (−1)^{i−1}(i−1)!, and ω_i(γ^k) = 0 for i < k. For n = 1 the congruences for ψ^k and λ^k are KTheoryLowDegrees Z.3/adams-first-graded. The same holds for the filtration of a non-unital λ-algebra (S.6/non-unital-gamma-filtration; K_m(A), K^Y_m(X)).

Hypotheses: K is a special λ-ring (KTheoryLowDegrees Z.3/special-lambda-ring) with an augmentation (Z.3/augmented-lambda-ring) and the γ-filtration of Z.3/gamma-filtration; no splitting principle and no finiteness are assumed.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/kratzer-low-gamma`

For every commutative ring A: F^1_γK_1(A)/F^2_γK_1(A) ≅ A^× (via the determinant) and F^2_γK_1(A) = SK_1(A), so K_1(A) = A^× ⊕ F^2_γK_1(A); and K_n(A) = F^2_γK_n(A) for n ≥ 2. Here F^i_γ is the filtration of S.6/non-unital-gamma-filtration on the K_0(A)-λ-algebra K_m(A) (m ≥ 1), with F^1_γK_m(A) = K_m(A).

Hypotheses: A commutative; the filtration is the one generated by γ^j(x) and a·γ^j(x) (S.6/non-unital-gamma-filtration).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/soule-gamma-bound`

(i) Let A be a commutative finite R-algebra with dim Max(R) < ∞. For x ∈ K_0(A) with ε(x) = 0 and k ≥ dim Max(R) + 1, γ^k(x) = 0. (ii) Let A be a commutative ring with stable rank r = sr(A) < ∞ (KTheoryLowDegrees U.3/stable-range) and m ≥ 1. For x ∈ K_m(A) and k ≥ m + r, γ^k(x) = 0; hence ″F^{m+r}_γK_m(A) = 0, where ″F^i is the subgroup generated by the individual γ^j(x), j ≥ i. Soulé §1.6 proves that this filtration and the full filtration of S.6/non-unital-gamma-filtration agree after tensoring with ℚ; thus F^{m+r}_γK_m(A)_ℚ = 0. No integral vanishing of the full coefficient filtration is asserted here. Since sr(A) ≤ dim(A) + 1 for noetherian A, γ^k = 0 on K_m(A) for k ≥ m + dim(A) + 1.

Hypotheses: (i) A finite over R with dim Max(R) finite; (ii) sr(A) < ∞. (ii) uses Suslin's surjective stability K_m(A)_N → K_m(A) for N ≥ m + r − 1 on Volodin's model, which is cited (Suslin, 'Stability in algebraic K-theory', LNM 966) and not read: gap.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/affine-weight-decomposition`

Let A be a commutative ring and m ≥ 1; a single Adams operator used to define a rational eigenspace has k ≥ 2. (1) Rationally: the eigenvalues of ψ^k on K_m(A)_ℚ lie in {k, k², …}, the eigenspace K^{(i)}_m(A) for ψ^k = k^i is independent of k, and K_*(A)_ℚ ≅ ⊕_{m,i}K^{(i)}_m(A)_ℚ as bigraded rings; if sr(A) = r < ∞, only 2 ≤ i ≤ m + r − 1 occur for m ≥ 2 and 1 ≤ i ≤ r for m = 1. (2) Integrally (Soulé): with r = sr(A) < ∞, K_m(A) = ⊕_{i=2}^{m+r−1} K_m(A)^{(i)} modulo 𝒮_{m+r−1} for m ≥ 2, and K_1(A) = ⊕_{i=1}^{r} K_1(A)^{(i)} modulo 𝒮_{r+1}, where K_m(A)^{(i)} = {x : ψ^k(x) = k^ix for all k} and 𝒮_n is the class of abelian groups of finite exponent all of whose prime divisors p satisfy p = 2 or p < n (an isomorphism modulo 𝒮_n becomes one after ⊗ℤ[1/(n−1)!] for n ≥ 3). The denominators are controlled by w_i = gcd_{k≥2} k^N(k^i − 1) (N large): w_i = 2 for i odd, and for i even a prime p divides w_i iff (p − 1) | i (w_2 = 24).

Hypotheses: A commutative; (1) needs only that every element of K_m(A) comes from a finitely generated subring, where sr < ∞.; (2) needs sr(A) < ∞ and the bound of S.6/soule-gamma-bound.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/simplicial-sheaf-hypercohomology`

Let X be a noetherian scheme of finite Krull dimension. S_*(X) is the category of sheaves of pointed simplicial sets on X_Zar; a map is a weak equivalence if it induces isomorphisms of homotopy groups of all stalks (at every point and base point), and a fibration if its sections over each inclusion U ⊆ V of opens give Kan fibrations Γ(V, F) → Γ(V, G) ×_{Γ(U,G)} Γ(U, F) (Brown–Gersten); Ho S_*(X) is the homotopy category. For a closed subset Y and a sheaf F with fibrant replacement F → K, the hypercohomology with supports is H^{−m}_Y(X, F) = π_m(fibre(Γ(X, K) → Γ(X − Y, K))) = [S^m_Y, K], where S^m_Y is the constant sheaf of m-spheres with support in Y. It is contravariant in (X, Y), covariant in F for maps in Ho S_*(X), sits in the long exact sequence ⋯ → H^{−m}_Y(X, F) → H^{−m}(X, F) → H^{−m}(X − Y, F) → H^{−m+1}_Y(X, F) → ⋯, and has the Brown spectral sequence E_2^{pq} = H^p_Y(X, π_{−q}F) ⇒ H^{p+q}_Y(X, F) with a fringe effect on p + q = 0.

Hypotheses: X noetherian of finite Krull dimension (for convergence of the Brown spectral sequence and Thomason's comparison).; The existence of the closed model structure is Brown–Gersten's theorem (Soulé 4.1, citing [9] Théorème 2), which is not read: gap. Only the homotopy category and the hypercohomology groups are used.

Reviewed API: TauCeti.AlgebraicGeometry.SimplicialSheaf: Pointed simplicial sheaves on X_Zar with stalkwise weak equivalences and Brown–Gersten fibrations.
TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper: H^{−m}_Y(X, F) = [S^m_Y, K] for a fibrant replacement K of F.
TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_map: Maps in Ho S_*(X) act on H^{−m}_Y; pullback along maps of pairs (X', Y') → (X, Y).
TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_les: The long exact sequence of (X, Y, X − Y), natural in F.
TauCeti.AlgebraicGeometry.SimplicialSheaf.brownSS: The Brown spectral sequence with its fringe effect.
TauCeti.AlgebraicGeometry.SimplicialSheaf.hyper_thomason: Agreement with Thomason's Godement hypercohomology of S.4 for sheaves of infinite loop spaces.

Acceptance specifications (not executed):
hyper_point: For X = Spec k a point and Y = X, H^{−m}(X, F) = π_m(F).
hyper_empty_support: H^{−m}_∅(X, F) = 0.
hyper_discrete: For F the constant sheaf ℤ (discrete), H^0(X, F) = H^0(X, ℤ) and H^{−m} = 0 for m ≥ 1.
hyper_not_sections: H^{−m}(X, F) is not π_mΓ(X, F) before fibrant replacement: for F the sheaf associated to U ↦ ℤ × BGL(Γ(U, O))^+ on a regular X, π_0Γ(X, F) need not see the classes of vector bundles that are not trivial on X, while H^0(X, F) = K_0(X) does.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/soule-scheme-operations`

Let X be a regular noetherian scheme of finite Krull dimension and Y ⊆ X closed. A representation ρ: GL_N → GL_M over ℤ induces a map of simplicial sheaves BGL_N → BGL_M, hence ρ: BGL_N → BGL^+; conjugate representations give the same class in [BGL_N, BGL^+], and the H-group structure of BGL^+ (direct sum; inverse in Ho S(X)) makes ρ ↦ ρ additive on exact sequences, giving R_ℤ(GL_N) → [ℤ × BGL_N^+, ℤ × BGL^+] (R_ℤ(GL_N) of KTheoryLowDegrees Z.3/representation-ring-of-gl) and, by S.6/sheaf-level-k-theory-model, R_ℤ(GL) → End_Set(K^Y_m(X)). For a natural operation τ with τ(0) = 0, the element (τ(id_N − N))_N ∈ R_ℤ(GL) (S.6/stable-representation-ring) defines τ: K^Y_m(X) → K^Y_m(X) for all m ≥ 0: in particular λ^k, γ^k, ψ^k. The augmentation ε: K^Y_m(X) → H^0_Y(X, ℤ) is zero for m ≠ 0 and the rank for m = 0, and the tensor product defines the pairing μ: (ℤ × BGL^+) × (ℤ × BGL^+) → ℤ × BGL^+ in Ho S(X) and K^Y_m(X) × K^Y_n(X) → K^Y_{m+n}(X).

Hypotheses: X regular noetherian of finite Krull dimension; Y closed. For singular quasi-projective X over a regular base see S.6/singular-scheme-operations.; The additivity of ρ ↦ ρ on non-split exact sequences uses the same input as S.6/representation-classifying-map (Quillen's homology isomorphism for block-triangular groups), applied stalkwise: gap.

Reviewed API: TauCeti.AlgebraicGeometry.KTheory.lambdaOp: τ: K^Y_m(X) → K^Y_m(X) for a natural operation τ with τ(0) = 0, X regular noetherian of finite dimension.
TauCeti.AlgebraicGeometry.KTheory.lambda: λ^k on K^Y_m(X).
TauCeti.AlgebraicGeometry.KTheory.gamma: γ^k on K^Y_m(X).
TauCeti.AlgebraicGeometry.KTheory.adams: ψ^k on K^Y_m(X), k ∈ ℤ − {0} (ψ^{−1} the duality).
TauCeti.AlgebraicGeometry.KTheory.augmentation: ε: K^Y_m(X) → H^0_Y(X, ℤ), zero for m ≠ 0.
TauCeti.AlgebraicGeometry.KTheory.lambdaOp_affine: For X = Spec A regular, τ agrees with S.6/quillen-hiller-operations.
TauCeti.AlgebraicGeometry.KTheory.lambdaOp_zero: On K_0(X), λ^k[E] = [Λ^kE].

Acceptance specifications (not executed):
adams_line_bundle: ψ^k[L] = [L^{⊗k}] in K_0(X) for a line bundle L.
lambda_empty_support: For Y = ∅ every operation is the zero map on K^∅_m(X) = 0.
lambdaOp_affine_compat: For X = Spec A regular, ψ^k on K_m(X) = K_m(A) is ψ^k of S.6/quillen-hiller-operations.
adams_units_scheme: For a unit u ∈ O(X)^× ⊆ K_1(X), ψ^k(u) = u^k.
lambda_not_objectwise: λ² on K_1(X) is not induced by Λ² on automorphisms of vector bundles: for u ∈ O(X)^×, Λ² of the automorphism u of O_X is the identity of the zero bundle, while λ²(u) = u^{−1} ≠ 1 when u² ≠ 1.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/scheme-weight-decomposition`

Let X be a regular noetherian scheme of Krull dimension d and Y ⊆ X closed. (1) For m ≥ 0, K^Y_m(X)_ℚ = ⊕_{i=α}^{m+d} K^Y_m(X)^{(i)}_ℚ, where K^{(i)} is the subgroup on which ψ^k = k^i for every k ≠ 0, α = 0 for m = 0, α = 1 for m = 1 and α = 2 for m ≥ 2; K^{(i)}_ℚ ≅ gr^i_γK^Y_m(X)_ℚ. (2) Low weights: K_1(X)^{(1)}_ℚ = Γ(X, O_X^×) ⊗ ℚ, K_0(X)^{(0)}_ℚ = H^0(X, ℚ), K_0(X)^{(1)}_ℚ = Pic(X) ⊗ ℚ. (3) Integrally (Soulé): F^2_γK^Y_m(X) = ⊕_{i=2}^{m+d}K^Y_m(X)^{(i)} modulo 𝒮_{m+d} (m ≥ 2), F^2_γK^Y_1(X) = ⊕_{i=2}^{d+2}F^2_γK^Y_1(X)^{(i)} modulo 𝒮_{d+2}, F^2_γK_0(X) = ⊕_{i=2}^{d}F^2_γK_0(X)^{(i)} modulo 𝒮_d. (4) Projectors: with k = 2 and weights a ≤ i ≤ N = m + d, π_i = ∏_{j≠i}(ψ² − 2^j)/(2^i − 2^j) is the projection to weight i on K_m(X)_ℚ; its denominator ∏_{j≠i}(2^i − 2^j) is recorded (for d = 1, m = 1 the weights are 1, 2 and π_1 = −(ψ² − 4)/2, π_2 = (ψ² − 2)/2). The decomposition is compatible with pullback, with products (weights add) and with forgetting supports.

Hypotheses: X regular noetherian of Krull dimension d; the rational statement is Gillet–Soulé's Proposition 8 for K-coherent spaces of dimension ≤ d, and the integral one Soulé's Proposition 5.; The weight range is an upper bound; the Beilinson–Soulé vanishing of low weights is not claimed.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/finite-coefficient-weight-decomposition`

Let X be a regular noetherian scheme of Krull dimension d, m ≥ 1, and ℓ an odd prime with ℓ > m + d + 1. The Adams operations act on K_m(X; ℤ/ℓ^ν) (mod ℓ^ν homotopy of the sheaf model, StableHomotopyKTheory H.6), additively for m ≥ 2, compatibly with the Bockstein sequence 0 → K_m(X)/ℓ^ν → K_m(X; ℤ/ℓ^ν) → K_{m−1}(X)[ℓ^ν] → 0. For a primitive root k modulo ℓ, the elements k^i (0 ≤ i ≤ m + d) are distinct modulo ℓ, and K_m(X; ℤ/ℓ^ν) = ⊕_{i} K_m(X; ℤ/ℓ^ν)^{(i)}, where the summand of weight i is the generalised eigenspace ker(ψ^k − k^i)^2, independent of the choice of k; it contains the images of (K_m(X)_{(ℓ)})^{(i)}/ℓ^ν and maps onto K_{m−1}(X)^{(i)}[ℓ^ν]. The projectors are the Chinese-remainder idempotents of ℤ/ℓ^ν[T]/∏_i(T − k^i)^2, defined over ℤ/ℓ^ν because the differences k^i − k^j are units.

Hypotheses: ℓ odd, ℓ > m + d + 1 (so ℓ ∉ 𝒮_{m+d+1} and a primitive root separates the weights); m ≥ 1 (for m = 1 the mod-ℓ group is π_1 of a Moore-space mapping set, a group via the H-space structure).; This node is a deduction from the cited integral results; no source read states it with finite coefficients.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/riemann-roch-without-denominators`

Let S be a regular noetherian scheme of finite Krull dimension, j: Y → X a closed immersion of regular schemes of finite type over S (hence regular, of codimension p on components), N ∈ K_0(Y) the class of the conormal sheaf I/I² of Y in X (Soulé's 'fibré normal' in SGA 6's convention V(I/I²)), and Z ⊆ Y closed. Then j_*: K^Z_m(Y) → K^Z_m(X) is an isomorphism (dévissage) and, for x ∈ K^Z(Y) = ⊕_m K^Z_m(Y) and every natural operation τ, τ(j_*(x)) = j_*(τ(N, x)) with τ(N, x) as in S.6/twisted-lambda-ring. In particular j_*: K^Z(Y)_N → K^Z(X) is a morphism of λ-rings, and ψ^k(j_*x) = j_*(θ^k(N)ψ^k(x)).

Hypotheses: X, Y regular of finite type over a regular noetherian S of finite Krull dimension; j a closed immersion over S; supports Z ⊆ Y.; The conormal convention is pinned: N = [I/I²], λ_{−1}(N) = Σ(−1)^i[Λ^iI/I²] = j^*j_*(1).

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/chern-character`

Let X be a smooth quasi-projective variety over a field (more generally a regular separated noetherian scheme of finite Krull dimension for which SchemeAndStackFoundations SF.5 supplies Chow groups and Chern classes c_i: K_0(Vect X) → CH^i(X) with the Whitney formula, c_1(L) = [D] for L = O(D), and the splitting principle). The Chern character ch: K_0(X) → CH^*(X)_ℚ = ⊕_i CH^i(X) ⊗ ℚ is the unique additive map with ch(L) = exp(c_1(L)) = Σ c_1(L)^n/n! on line bundles and compatible with pullback; for a bundle E with Chern roots a_1, …, a_r, ch(E) = Σ_j exp(a_j), and ch_n(E) = N_n(c_1(E), …, c_n(E))/n! with the Newton polynomial N_n in the Chern classes (ch = rk + c_1 + (c_1² − 2c_2)/2 + (c_1³ − 3c_1c_2 + 3c_3)/6 + ⋯). K/G realisation: through the Cartan isomorphism K_0(X) ≅ G_0(X) (X regular separated) ch is defined on G_0(X), i.e. on classes of coherent sheaves ch[F] = Σ(−1)^i ch[E_i] for a finite locally free resolution E_• → F.

Hypotheses: X regular separated noetherian of finite dimension with the Chow-theoretic input of SF.5 (request); denominators n! occur in ch_n, so ch takes values in CH^* ⊗ ℚ.; The Chern classes are SF.5's (RS-18: geometric Chern classes are imported); this node constructs only ch on the K/G groups.

Reviewed API: TauCeti.AlgebraicGeometry.KTheory.chernCharacter: ch: K_0(X) → CH^*(X) ⊗ ℚ.
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_line: ch([L]) = exp(c_1(L)).
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_add: ch(x + y) = ch(x) + ch(y).
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_mul: ch(xy) = ch(x)ch(y) (S.7/chern-character-ring-homomorphism).
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_pullback: ch(f^*x) = f^*ch(x).
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_degree_zero: ch_0 = rank and ch_1 = c_1 = [det].
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_coherent: ch on G_0(X) via the Cartan isomorphism: ch[F] = Σ(−1)^ich[E_i] for a locally free resolution.
TauCeti.AlgebraicGeometry.KTheory.chernCharacter_adams: ch_n(ψ^kx) = k^nch_n(x) (S.7/chern-character-adams).

Acceptance specifications (not executed):
chernCharacter_trivial: ch(O_X^r) = r.
chernCharacter_P1: On P^1_k, ch(O(n)) = 1 + n·[pt] and ch(1 − [O(−1)]) = [pt].
chernCharacter_P2_point: On P^2_k with h = c_1(O(1)): ch([O_pt]) = ch((1 − [O(−1)])²) = (1 − e^{−h})² = h² = [pt].
chernCharacter_not_total_chern: ch is not the total Chern class c: c is multiplicative on sums (c(x + y) = c(x)c(y)) while ch is additive; for L ⊕ L, c = (1 + a)² but ch = 2e^{a}.
chernCharacter_gamma_compat: ch_n vanishes on F^{n+1}_γ ⊗ ℚ and on K_0^{(i)}, i ≠ n, and for x ∈ F^n_γ, ch_n(x) = (−1)^{n−1}c_n(x)/(n − 1)!.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/chern-class-of-subvariety`

Let X be a smooth quasi-projective variety over a field and Z ⊆ X an integral closed subvariety of codimension i ≥ 1. Then c_j([O_Z]) = 0 for 1 ≤ j < i and c_i([O_Z]) = (−1)^{i−1}(i − 1)!·[Z] in CH^i(X); equivalently ch([O_Z]) = [Z] + (terms in CH^{>i}(X)_ℚ). For i = 1, c_1(O_D) = [D]. The sign is (−1)^{i−1} (not (−1)^i as printed in the K-book's Ex. II.8.7): check i = 1, O_D = 1 − O(−D), c_1 = −c_1(O(−D)) = [D].

Hypotheses: X smooth quasi-projective over a field; Z integral of codimension i ≥ 1. The reduction to complete intersections (removing a closed subset of Z) needs the localisation sequence for Chow groups (SF.5) and the fact that the statement only concerns the coefficient of [Z].

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/gamma-chow-comparison`

Let X be a smooth quasi-projective variety over a field k of dimension d (Soulé: X regular of finite type over a field). Then: (a) ch ⊗ ℚ: K_0(X)_ℚ → CH^*(X)_ℚ is an isomorphism of rings, graded for the Adams decomposition: ch_i: K_0(X)^{(i)}_ℚ ≅ CH^i(X)_ℚ; (b) gr^i_γK_0(X)_ℚ ≅ K_0(X)^{(i)}_ℚ ≅ gr^i_cod K_0(X)_ℚ ≅ CH^i(X)_ℚ, with F^i_γK_0(X)_ℚ = F^i_cod K_0(X)_ℚ, where CH^i → gr^i_cod is [Z] ↦ [O_Z] and c_i: gr^i_γ → CH^i is multiplication by (−1)^{i−1}(i − 1)! on the identified groups; (c) integrally, K_0(X) = ⊕_{p=0}^{d} E_2^{p,−p}(X) = ⊕_{p=0}^{d}CH^p(X) modulo 𝒮_d (groups of exponent divisible only by 2 and primes < d). The integral groups gr^i_γK_0(X) and CH^i(X) are not claimed isomorphic (they differ by torsion).

Hypotheses: X smooth quasi-projective over a field (regular of finite type suffices for (b), (c)); the Chow groups and Chern classes are SF.5's.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/grothendieck-riemann-roch`

Let f: X → Y be a projective morphism of smooth quasi-projective varieties over a field k (Borel–Serre: a proper morphism of nonsingular quasi-projective irreducible varieties over an algebraically closed field). Then for x ∈ K_0(X), ch(f_*(x))·td(T_Y) = f_*(ch(x)·td(T_X)) in CH^*(Y)_ℚ, where f_* on K_0 is the pushforward of SchemeKTheoryOperations S.2 (π_0 of the K-theory pushforward, equal under Cartan to the G-theory one), f_* on CH^* is proper pushforward, ch is S.7/chern-character and td(E) = ∏a_j/(1 − e^{−a_j}) over the Chern roots of E (td = 1 + c_1/2 + (c_1² + c_2)/12 + ⋯). The denominators of td and ch are retained; the integral refinement is S.7/adams-riemann-roch. This node proves the compatibility of the imported geometric GRR (SchemeAndStackFoundations SF.5, for the Euler-characteristic pushforward f_! = Σ(−1)^qR^qf_*) with the actual K/G pushforward; it does not extend SF.5's source scope.

Hypotheses: f projective between smooth quasi-projective k-varieties (proper suffices over an algebraically closed field in Borel–Serre); X, Y connected or componentwise.; The geometric theorem (Borel–Serre §§7–16; SGA 6 VIII; Fulton 15.2) is SF.5's: request.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/g-theory-adams-operations`

Let S be a regular noetherian irreducible scheme of finite Krull dimension and 𝒱_S the category of quasi-projective S-schemes. For X ∈ 𝒱_S there are operations φ^k: K'_m(X) ⊗ ℤ[1/k] → K'_m(X) ⊗ ℤ[1/k] (k ∈ ℤ − {0}), a finite increasing filtration F_jK'_m(X) ⊗ ℚ (j ∈ ℤ) and an isomorphism σ: K'_m(X) ⊗ ℚ → ⊕_j Gr_jK'_m(X) ⊗ ℚ, where K' = G-theory. For a closed immersion f: X → M into M of absolute Krull dimension d, smooth and equidimensional over S, with M → S surjective and f_*: K'_m(X) ≅ K^X_m(M) (dévissage): F^M_jK'_m(X)_ℚ = f_*^{−1}(F^{d−j}_γK^X_m(M)_ℚ), k^{dim S}φ^k_M(α) = f_*^{−1}(ψ^k(f_*α)·θ^k(M)) with θ^k(M) = θ^k(−T^∨_M) ∈ K_0(M) ⊗ ℤ[1/k] (S.6/bott-cannibalistic-class), and σ^M(α) = f_*^{−1}(ch(f_*α)·Td(M)) (S.7/gamma-chern-character, Td(M) the Todd class of T_M relative to S in ⊕gr^i_γK_0(M)_ℚ). These do not depend on the embedding. φ^k preserves F_j and acts on Gr_j by k^{−j}; φ^kφ^l = φ^{kl}; φ^k commutes with σ. Gr_j means F_j/F_{j−1}. In the formula for σ, f_*^{-1} on the right means the inverse induced map on the shifted associated γ-graded groups, not the ungraded K-group inverse.

Hypotheses: S regular noetherian irreducible of finite Krull dimension; X quasi-projective over S (possibly singular: this is the K/G realisation for singular schemes).; The normalisation k^{dim S} makes φ^k act on Gr_j by exactly k^{−j} (ε(θ^k(M)) = k^{−d+dim S}).

Reviewed API: TauCeti.AlgebraicGeometry.KTheory.gAdams: φ^k on K'_m(X) ⊗ ℤ[1/k] for X quasi-projective over a regular S.
TauCeti.AlgebraicGeometry.KTheory.gFiltration: The increasing filtration F_jK'_m(X) ⊗ ℚ.
TauCeti.AlgebraicGeometry.KTheory.gRiemannRoch: σ: K'_m(X)_ℚ ≅ ⊕Gr_jK'_m(X)_ℚ.
TauCeti.AlgebraicGeometry.KTheory.gAdams_graded: φ^k acts on Gr_j by k^{−j}.
TauCeti.AlgebraicGeometry.KTheory.gAdams_comp: φ^kφ^l = φ^{kl}.
TauCeti.AlgebraicGeometry.KTheory.gAdams_embedding_indep: The definitions do not depend on the closed immersion into a smooth M.
TauCeti.AlgebraicGeometry.KTheory.gAdams_smooth: On smooth equidimensional X → S, surjective, let η: G_m(X) ≅ K_m(X) be Cartan duality. Then k^{dim S}η(φ^k x) = ψ^k(η x)θ^k(X). Under the induced isomorphism of associated graded groups, σ(x) corresponds to ch_γ(η x)Td_γ(X); ch_γ takes values in γ-graded K-theory, not Chow groups for arbitrary m.

Acceptance specifications (not executed):
gAdams_smooth: For X smooth over S = Spec k (dim S = 0): φ^k(x) = ψ^k(x)θ^k(X) under K' = K.
gAdams_point: For X = S = Spec k: θ^k(Spec k) = 1, φ^k = ψ^k and F_0 = everything on K'_0 = ℤ.
gAdams_curve_point: For a closed point x of a smooth curve X over k (S = Spec k, M = X): φ^k[O_x] = ψ^k[O_x]·θ^k(X) = k[O_x]·k^{−1}(1 + y) with y ∈ F^1_γK_0(X), and [O_x]·y ∈ F^2_γ = 0, so φ^k[O_x] = [O_x]: points have homological weight 0.
gAdams_not_psi: φ^k ≠ ψ^k on smooth X of positive dimension: on X = P^1_k, φ^k(1) = θ^k(P^1) = θ^k(−T^∨) ≠ 1 = ψ^k(1), since θ^k(T^∨_{P^1}) = 1 + [O(−2)] + ⋯ + [O(−2(k − 1))] ≠ 1 for k ≥ 2.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/self-intersection-formula`

Let i: Y → X be a regular closed immersion of quasi-compact quasi-separated schemes with conormal sheaf 𝒩 = I/I² (locally free of rank c). Then i^* ∘ i_* = λ_{−1}(𝒩)·(−) on K_m(Y) (and on K_m(Y on Z) for closed Z ⊆ Y with quasi-compact complement), for all m, where λ_{−1}(𝒩) = Σ_{k=0}^{c}(−1)^k[Λ^k𝒩] ∈ K_0(Y). In E.4's notation, λ_{−1}(N^∨) with N the normal bundle. In particular, if 𝒩 has a trivial direct summand O_Y, then i^*i_* = 0.

Hypotheses: i a regular closed immersion; no regularity of X, Y.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.1/enhanced-perf-truncation`

For perfect E,F of Tor-amplitude[a,b] on any scheme X, Map(E,F) is(b−a)-truncated and the core Perf^[a,b](X) is(b−a+1)-truncated. In particular these are uniform bounds on the affine site basis. A global upper cohomological-dimension bound is unnecessary: RHom has lower bound a−b and derived global sections preserve that lower bound.

Hypotheses: a≤b; the core bound has one additional degree.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/gillet-soule-strict-support-comparison`

GS87’s K₀^Y(X) is generated by globally bounded vector-bundle complexes acyclic off Y, modulo short exact sequences and quasi-isomorphisms. For separated Noetherian regular finite-dimensional X with the resolution property, this group identifies with S.3’s TT K₀(X on Y), and by regular dévissage with G₀(Y). Without the resolution property use TT’s local-perfect model; do not claim global strict representatives merely from regularity.

Hypotheses: Y is closed. The resolution property is explicitly needed for the global strict/TT comparison.; The regular TT Cartan/support comparison has greater generality and is kept separately.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/supported-codimension-filtration`

For separated Noetherian regular X of finite Krull dimension d and closed Y⊂X, identify the existing S.4 support-tower filtration in degree zero with F^p K₀^Y(X): the subgroup generated by images of K₀^Z(X), where Z⊂Y has ambient codimension at least p. Thus F⁰=K₀^Y(X), F^(d+1)=0, and support enlargement Y⊂Y′ preserves F^p. Codimension is measured in X, not relative to Y.

Hypotheses: Use TT’s support group generally; compare GS87’s strict model when the resolution property holds.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.6/rational-supported-filtration-product`

For separated Noetherian regular finite-dimensional X, closed Y,Z, and a,b≥0, the support product maps F^aK₀^Y(X)×F^bK₀^Z(X) into F^(a+b)K₀^(Y∩Z)(X)⊗ℚ. The GS strict-model proof holds with the resolution property; extending its operations to TT local models is the explicit bridge gap. This is a rational inclusion; no integral or formal-scheme inclusion is inferred.

Hypotheses: Codimension is ambient; supports intersect.; GS87 Prop5.5 is presented in its regular-local setup. The global rational inclusion follows instead from Prop4.11 multiplicativity and Prop5.3 weight splitting, as used by Th8.3.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/supported-cycle-to-k-zero`

For separated Noetherian regular finite-dimensional X and closed Y, define cl_K:⊕_(q≥p) Z_Y^q(X)→F^pK₀^Y(X) by[V]↦[O_V] using regular support dévissage. Here Z_Y^q(X) is the free group on integral closed subschemes V⊂Y of ambient codimension q. Support enlargement preserves this map. Its image on Gr_F^p descends through the Chow-with-support relation after rationalization.

Hypotheses: This is Li–Liu(B.3), a map from cycles of all codimensions≥p into F^p; it is not an isomorphism from cycles before rational equivalence.; The locally perfect TT model permits O_V through G₀ support dévissage; a global vector-bundle resolution is not automatic.

Reviewed API: SupportedCycle.kClass: Map the cycle[V] to[O_V] in supported K₀.
SupportedCycle.kClass_filtration: Codimension≥p maps into F^p.
SupportedCycle.support_enlarge: Class maps commute with support enlargement.
SupportedCycle.generic_length: The leading coefficient at a codimension-p generic point is the module length.
SupportedCycle.chow_graded: On the p-th graded quotient the rationalized map descends to CH_Y^p(X).

Acceptance specifications (not executed):
cycle_class_dvr: On a DVR, the closed point maps to[Cone(π)] and generic length1 in Gr¹.
cycle_class_empty: The zero cycle and empty support map to0.
cycle_class_thickening: The coherent sheaf O/(π^m) has leading cycle m[s], not[s], detecting loss of generic length.
cycle_class_enlarge: The same closed point class has the same image after enlarging support; ambient codimension stays1.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/supported-chow-k-zero-comparison`

For separated Noetherian regular finite-dimensional X and closed Y, the cycle map gives CH_Y^p(X)⊗ℚ≃Gr_F^pK₀^Y(X)⊗ℚ. CH_Y^p means ambient codimension-p cycles in Y modulo divisors of rational functions on ambient codimension-(p−1) integral subschemes contained in Y. This is a supported comparison, not automatically CH^p(Y). For equidimensional catenary X of dimension d it identifies with CH_(d−p)(Y)⊗ℚ.

Hypotheses: The degree-zero rational Adams action on the coniveau pages and its compatibility with residue differentials are required inputs.; No Gersten exactness over arbitrary mixed-characteristic bases is assumed.

-/

/-!
### Reviewed contract `SchemeKTheoryOperations:S.7/dimension-one-supported-g-cycle-comparison`

In the regular separated Noetherian finite-dimensional scheme setting above, G₀ of coherent sheaves supported on Y has increasing support-dimension filtration F_i. Gr₁=F₁/F₀ rationally identifies with CH₁(Y), via generic lengths of one-dimensional sheaves. On an equidimensional catenary ambient X of dimension d, this is the p=d−1 instance of the supported Chow comparison. If Y is proper over a Dedekind base, its one-dimensional cycle classes map to the group of proper one-cycles used in Zhang §9.1; include only the stated vertical rational-equivalence relations there.

Hypotheses: Gr₁ refers to dimension of support, not codimension1 in the ambient X.; Zhang’s proper-cycle consumer needs its properness and zero-dimensional generic fibre hypotheses; its arithmetic intersection pairing has another owner.

-/

/- Reviewed source convention for S.3/algebraically-closed-injectivity: A ≠ 0 is required;
K₀(0)=0 rules out the printed universal claim. The higher-group signatures remain omitted
pending GeneralAlgebraicKTheory:K.7 and the DVR specialisation interface. -/
