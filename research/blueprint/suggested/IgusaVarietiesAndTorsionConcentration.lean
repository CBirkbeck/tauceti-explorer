import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Morphisms.Immersion
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.ValuativeCriterion
import Mathlib.AlgebraicGeometry.Sites.Proetale
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.Valuation.ValuationRing
import Mathlib.FieldTheory.Perfect
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.RepresentationTheory.Basic
import Mathlib.RingTheory.LocalProperties.Basic
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.Topology.Algebra.Category.ProfiniteGrp.Basic
import Mathlib.CategoryTheory.Triangulated.TStructure.Basic
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.RingTheory.DedekindDomain.Different
import Mathlib.Geometry.Manifold.ChartedSpace
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Topology.LocallyClosed
import Mathlib.Topology.KrullDimension
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.Topology.Constructible
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.Topology.NoetherianSpace
import Mathlib.AlgebraicGeometry.Morphisms.FiniteType
import Mathlib.CategoryTheory.Functor.OfSequence
import Mathlib.Algebra.Homology.QuasiIso
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Module.End
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.Analysis.Normed.Field.Ultra
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Topology.MetricSpace.Ultra.Basic
import Mathlib.Topology.QuasiSeparated
import Mathlib.CategoryTheory.Limits.Shapes.Diagonal
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.HasPullback
import Mathlib.RingTheory.IntegralClosure.IntegrallyClosed
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Topology.Algebra.Constructions
import Mathlib.Topology.Instances.Matrix
import Mathlib.Algebra.Category.Grp.Colimits
import Mathlib.FieldTheory.PerfectClosure
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.Algebra.Ring.ULift
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.RingTheory.Valuation.RankOne
import Mathlib.LinearAlgebra.Span.Defs
import Mathlib.NumberTheory.Padics.Complex
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.Length
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.RingTheory.Etale.Basic
import Mathlib.Algebra.Homology.DerivedCategory.TStructure

/-!
# Igusa varieties, compactified period fibres and torsion concentration — suggested Lean

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/IgusaVarietiesAndTorsionConcentration.md` is definitive; the
statements below suggest Lean forms so that contributors and reviewers converge on names and
signatures. Everything is proved by `sorry`; nothing here is an implementation.

Objects that other roadmaps own (p-divisible groups, the Kottwitz set, adic spaces and
diamonds, étale cohomology with its operations, Hecke algebras, smooth representations) appear
as opaque carriers in the section `Carriers`, with docstrings naming their owners. A condition
that cannot be stated with these carriers is left out rather than replaced by a `Prop` field.

Conventions: `p` is the geometric prime (unramified in `F`), `ℓ ≠ p` the coefficient prime,
`k` an algebraically closed field of characteristic `p`, `C` a complete algebraically closed
extension of `ℚ_p`, `d = [F⁺ : ℚ] n²` the dimension of the Shimura variety.
-/

open CategoryTheory AlgebraicGeometry

noncomputable section

namespace TauCeti.Igusa

universe u

/-! ## The unitary datum (IG.0) -/

/-- The split trace pairing, defined before the datum so self-duality is a field. -/
def splitTracePairing (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F]
    (n : ℕ) (x y : Fin (2 * n) → F) : ℚ :=
  Algebra.trace ℚ F (∑ i : Fin n,
    (x ⟨i, by omega⟩ * NumberField.IsCMField.complexConj F (y ⟨2 * n - 1 - i, by omega⟩) -
      x ⟨2 * n - 1 - i, by omega⟩ * NumberField.IsCMField.complexConj F (y ⟨i, by omega⟩)))

/-- The quasi-split unitary similitude datum: a CM field `F`, an integer `n ≥ 1` and an
`O_F`-lattice `L ⊂ F^{2n}` (self-dual for the trace of the split skew-hermitian form; that
condition is part of `IG.0/quasi-split-unitary-datum`). -/
structure UnitarySimilitudeDatum where
  /-- The CM field. -/
  F : Type
  [field : Field F]
  [numberField : NumberField F]
  [isCM : NumberField.IsCMField F]
  /-- Half the dimension of `V = F^{2n}`. -/
  n : ℕ
  n_pos : 0 < n
  /-- The self-dual lattice. -/
  L : Submodule (NumberField.RingOfIntegers F) (Fin (2 * n) → F)
  L_finite : Module.Finite (NumberField.RingOfIntegers F) L
  L_full : Submodule.span F (L : Set (Fin (2 * n) → F)) = ⊤
  L_selfDual : ∀ y, y ∈ L ↔ ∀ x ∈ L, ∃ z : ℤ, splitTracePairing F n x y = z

attribute [instance] UnitarySimilitudeDatum.field UnitarySimilitudeDatum.numberField
  UnitarySimilitudeDatum.isCM

namespace UnitarySimilitudeDatum

variable (D : UnitarySimilitudeDatum)

/-- The dimension `d = [F⁺ : ℚ] n²` of the Shimura variety. -/
def dim : ℕ := Module.finrank ℚ (NumberField.maximalRealSubfield D.F) * D.n ^ 2

end UnitarySimilitudeDatum

/-! ## Carriers owned by other roadmaps -/

section Carriers

/-- p-divisible groups over a scheme `S` (owner: FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1). -/
def PDivGroup (p : ℕ) (S : Scheme.{u}) : Type (u + 1) := sorry

instance (p : ℕ) (S : Scheme.{u}) : Category.{u} (PDivGroup p S) := sorry

/-- Height of a p-divisible group (constant on connected bases). -/
def PDivGroup.height {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) : ℕ := sorry

/-- Dimension of a p-divisible group. -/
def PDivGroup.dim {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) : ℕ := sorry

/-- Base change of p-divisible groups along `T ⟶ S`. -/
def PDivGroup.baseChange {p : ℕ} {S T : Scheme.{u}} (f : T ⟶ S) :
    PDivGroup p S ⥤ PDivGroup p T := sorry

/-- The p-divisible group `μ_{p^∞}` over `S`. -/
def PDivGroup.mu (p : ℕ) (S : Scheme.{u}) : PDivGroup p S := sorry

/-- The p-divisible group `ℚ_p/ℤ_p` over `S`. -/
def PDivGroup.etaleUnit (p : ℕ) (S : Scheme.{u}) : PDivGroup p S := sorry

/-- Direct sum of p-divisible groups. -/
def PDivGroup.sum {p : ℕ} {S : Scheme.{u}} (X Y : PDivGroup p S) : PDivGroup p S := sorry

/-- The finite set `B(G_{ℚ_p}, μ⁻¹)` of `μ⁻¹`-admissible σ-conjugacy classes of the unitary
similitude group (owner: BunGAndNewtonStrata BG0–BG1; `B(G, μ)` is requested from BG1). -/
def KottwitzSet (D : UnitarySimilitudeDatum) (p : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p : ℕ) : Fintype (KottwitzSet D p) := sorry

/-- The partial order on `B(G_{ℚ_p}, μ⁻¹)` (owner: BunGAndNewtonStrata BG1). -/
instance (D : UnitarySimilitudeDatum) (p : ℕ) : PartialOrder (KottwitzSet D p) := sorry

/-- The locally profinite group `J_b(ℚ_p)` (owner: BunGAndNewtonStrata BG0). -/
def JGroup {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) : Type := sorry

instance {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) : Group (JGroup b) := sorry
instance {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) :
    TopologicalSpace (JGroup b) := sorry
instance {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) :
    IsTopologicalGroup (JGroup b) := sorry

/-- The prime-to-`p` finite adelic points `G(𝔸_f^p)` of the unitary similitude group. -/
def GAfp (D : UnitarySimilitudeDatum) (p : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p : ℕ) : Group (GAfp D p) := sorry
instance (D : UnitarySimilitudeDatum) (p : ℕ) : TopologicalSpace (GAfp D p) := sorry

/-- The abstract unramified Hecke algebra `𝕋^S` outside a finite set of primes `S`, over `ℤ`
(double cosets: Tau Ceti `HeckeRing`; owner of the spherical theory: SmoothRepresentations
SR.1). -/
def HeckeAlgebra (D : UnitarySimilitudeDatum) (S : Finset ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (S : Finset ℕ) : CommRing (HeckeAlgebra D S) := sorry

/-- Étale cohomology `H^i(X, Λ)` of a scheme with coefficients in a finite ring `Λ` (owner:
EtaleDualityAndPerverseSheaves EDC.0). -/
def EtH (X : Scheme.{u}) (Λ : Type) [CommRing Λ] (i : ℕ) : Type := sorry

instance (X : Scheme.{u}) (Λ : Type) [CommRing Λ] (i : ℕ) : AddCommGroup (EtH X Λ i) := sorry
instance (X : Scheme.{u}) (Λ : Type) [CommRing Λ] (i : ℕ) : Module Λ (EtH X Λ i) := sorry

/-- Compactly supported étale cohomology `H^i_c(X, Λ)` (owner: EtaleDualityAndPerverseSheaves
EDC.0, `Rf_!`). -/
def EtHc (X : Scheme.{u}) (Λ : Type) [CommRing Λ] (i : ℕ) : Type := sorry

instance (X : Scheme.{u}) (Λ : Type) [CommRing Λ] (i : ℕ) : AddCommGroup (EtHc X Λ i) := sorry
instance (X : Scheme.{u}) (Λ : Type) [CommRing Λ] (i : ℕ) : Module Λ (EtHc X Λ i) := sorry

/-- Diamonds over `Spd ℚ_p` (owner: DiamondsAndVStacks D4). -/
def Diamond : Type (u + 1) := sorry

instance : Category.{u} Diamond.{u} := sorry

/-- The diamond of the flag variety of totally isotropic `F`-subspaces of `V` over `C` (owner:
PerfectoidShimuraVarieties S3). -/
def FlagVariety (D : UnitarySimilitudeDatum) (p : ℕ) : Diamond.{u} := sorry

/-- Étale cohomology of a diamond with `𝔽_ℓ`-coefficients (owner: DiamondEtaleCohomology). -/
def DiamondH (X : Diamond.{u}) (ℓ : ℕ) (i : ℕ) : Type := sorry

instance (X : Diamond.{u}) (ℓ : ℕ) (i : ℕ) : AddCommGroup (DiamondH X ℓ i) := sorry

end Carriers

/-! ## Shared objects of IG.0–IG.2 used by later layers -/

section Shared

/-- p-divisible groups with `G`-structure over `S` (`IG.0/g-structure`). -/
def PDivGStructure (D : UnitarySimilitudeDatum) (p : ℕ) (S : Scheme.{u}) : Type (u + 1) :=
  sorry

instance (D : UnitarySimilitudeDatum) (p : ℕ) (S : Scheme.{u}) :
    Category.{u} (PDivGStructure D p S) := sorry

/-- The underlying p-divisible group. -/
def PDivGStructure.toPDivGroup {D : UnitarySimilitudeDatum} {p : ℕ} {S : Scheme.{u}} :
    PDivGStructure D p S ⥤ PDivGroup p S := sorry

/-- The point `Spec k` of an algebraically closed field. -/
abbrev pt (k : Type u) [Field k] : Scheme.{u} := Spec (CommRingCat.of k)

/-- The special fibre `S_{K(N),k}` of the integral model at principal level `N`, `p ∤ N`
(`IG.0/integral-model`). -/
def SpecialFibre (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    Scheme.{u} := sorry

/-- The structure morphism of the special fibre. -/
def SpecialFibre.toSpec (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    SpecialFibre D p k N ⟶ pt k := sorry

/-- The universal p-divisible group with `G`-structure over the special fibre. -/
def SpecialFibre.universal (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k]
    (N : ℕ) : PDivGStructure D p (SpecialFibre D p k N) := sorry

/-- The Newton stratum `S^b` (`IG.0/newton-map`). -/
def NewtonStratum (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (b : KottwitzSet D p) : Scheme.{u} := sorry

/-- The locally closed immersion of a Newton stratum. -/
def NewtonStratum.ι (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (b : KottwitzSet D p) : NewtonStratum D p k N b ⟶ SpecialFibre D p k N := sorry

instance (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (b : KottwitzSet D p) : IsImmersion (NewtonStratum.ι D p k N b) := sorry

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]

/-- The central leaf `C^X ⊂ S_{K,k}` of a p-divisible group with `G`-structure over `k`
(`IG.0/central-leaf`). -/
def CentralLeaf (N : ℕ) (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

/-- The immersion of the central leaf into the special fibre. -/
def CentralLeaf.ι (N : ℕ) (X : PDivGStructure D p (pt k)) :
    CentralLeaf N X ⟶ SpecialFibre D p k N := sorry

/-- The perfect Igusa variety `Ig^X → C^X` (`IG.1/perfect-igusa-variety`). -/
def IgusaVariety (N : ℕ) (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

/-- The projection `Ig^X → C^X`. -/
def IgusaVariety.toLeaf (N : ℕ) (X : PDivGStructure D p (pt k)) :
    IgusaVariety N X ⟶ CentralLeaf N X := sorry

/-- Mantovan's finite-level Igusa variety `Ig^X_{Mant,m}` (`IG.1/mantovan-igusa-variety`). -/
def MantovanIgusaVariety (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Scheme.{u} :=
  sorry

/-- The partial minimal compactification `Ig^{b,*}_m` at finite level
(`IG.2/minimal-igusa-compactification`). -/
def MinimalIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Scheme.{u} := sorry

/-- The open immersion `j : Ig^b_m ↪ Ig^{b,*}_m`. -/
def MinimalIgusa.j (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MantovanIgusaVariety N X m ⟶ MinimalIgusa N X m := sorry

/-- The partial toroidal compactification `Ig^{X,tor}_m` at finite level
(`IG.2/toroidal-igusa-finite-level`). -/
def ToroidalIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Scheme.{u} := sorry

/-- The perfect partial toroidal compactification `Ig^{X,tor}`
(`IG.2/perfect-toroidal-igusa-variety`). -/
def PerfectToroidalIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

/-- The perfect partial minimal compactification `Ig^{X,*}` (`IG.2/perfect-minimal-igusa`). -/
def PerfectMinimalIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

/-- Étale cohomology `H^i(Ig^b, 𝔽_ℓ)` of the Igusa variety at tame level `K(N)`, the colimit
over Mantovan levels (`IG.1/igusa-cohomology`); a module over the Hecke algebra `𝕋^S`. -/
def IgusaCoh (N : ℕ) (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) : Type := sorry

/-- Compactly supported Igusa cohomology `H^i_c(Ig^b, 𝔽_ℓ)` (`IG.1/igusa-cohomology`). -/
def IgusaCohC (N : ℕ) (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) : Type := sorry

/-- Partially compactly supported cohomology `H^i_{c−∂}(Ig^b, 𝔽_ℓ) = H^i(Ig^{b,*}, j_!𝔽_ℓ)`
(`IG.4/partial-support-cohomology`). -/
def PartialSupportCoh (N : ℕ) (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) : Type := sorry

instance (N : ℕ) (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) : AddCommGroup (IgusaCoh N X ℓ i) :=
  sorry
instance (N : ℕ) (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) :
    AddCommGroup (IgusaCohC N X ℓ i) := sorry
instance (N : ℕ) (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) :
    AddCommGroup (PartialSupportCoh N X ℓ i) := sorry
instance (N : ℕ) (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (IgusaCoh N X ℓ i) := sorry
instance (N : ℕ) (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (IgusaCohC N X ℓ i) := sorry
instance (N : ℕ) (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (PartialSupportCoh N X ℓ i) := sorry

/-- The localization `M_𝔪` of a module over the Hecke algebra at a maximal ideal. -/
abbrev localizeAt {D : UnitarySimilitudeDatum} {S : Finset ℕ} (𝔪 : Ideal (HeckeAlgebra D S))
    [𝔪.IsPrime] (M : Type) [AddCommGroup M] [Module (HeckeAlgebra D S) M] : Type :=
  LocalizedModule 𝔪.primeCompl M

end Shared

/-! ## Shared objects of IG.3 used by later layers -/

section SharedAdic

/-- The good-reduction locus at infinite level `S°_{K(p^∞N)}`, a perfectoid space over `C`
(`IG.3/good-reduction-locus`). -/
def GoodReductionLocus (D : UnitarySimilitudeDatum) (p N : ℕ) : Diamond.{u} := sorry

/-- The Hodge–Tate period map `π°_HT : S°_{K(p^∞N)} → Fℓ` (owner: PerfectoidShimuraVarieties
S3). -/
def piHTGood (D : UnitarySimilitudeDatum) (p N : ℕ) :
    GoodReductionLocus.{u} D p N ⟶ FlagVariety.{u} D p := sorry

end SharedAdic

end TauCeti.Igusa

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open CategoryTheory AlgebraicGeometry Limits
open scoped NumberField TensorProduct

noncomputable section

namespace TauCeti.Igusa

universe u

/-! ## IG.0 — Newton strata, central leaves and local deformation data -/

/-! ### Auxiliary carriers for IG.0 -/

section IG0Carriers

/-- The finite adeles `𝔸_f` of `ℚ`. -/
abbrev IG0Af : Type := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

/-- A finite étale correspondence `X ← Z → X` of schemes (shape of Hecke correspondences). -/
structure SchemeCorrespondence (X : Scheme.{u}) where
  /-- The source `Z`. -/
  src : Scheme.{u}
  /-- The left leg. -/
  left : src ⟶ X
  /-- The right leg. -/
  right : src ⟶ X
  left_finite : IsFinite left
  left_etale : Etale left
  right_finite : IsFinite right
  right_etale : Etale right

/-- A subset of `X` is stable under a correspondence `c` if its preimages under both legs agree. -/
def SchemeCorrespondence.Preserves {X : Scheme.{u}} (c : SchemeCorrespondence X) (Z : Set X) :
    Prop :=
  c.left.base ⁻¹' Z = c.right.base ⁻¹' Z

/-- Cartier duality on p-divisible groups (owner: FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1). -/
def PDivGroup.cartierDual {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) : PDivGroup p S := sorry

/-- Quasi-isogenies `X ⇢ Y` of p-divisible groups (owner: R07.1). -/
def PDivGroup.QIsog {p : ℕ} {S : Scheme.{u}} (X Y : PDivGroup p S) : Type u := sorry

/-- Isogenies `X → Y` of p-divisible groups (owner: R07.1). -/
def PDivGroup.Isogeny {p : ℕ} {S : Scheme.{u}} (X Y : PDivGroup p S) : Type u := sorry

/-- The underlying homomorphism of an isogeny. -/
def PDivGroup.Isogeny.hom {p : ℕ} {S : Scheme.{u}} {X Y : PDivGroup p S}
    (f : PDivGroup.Isogeny X Y) : X ⟶ Y := sorry

/-- The `p^m`-torsion `X[p^m]` as a finite locally free group scheme over `S` (owner: R07.1). -/
def PDivGroup.torsion {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) (m : ℕ) : Over S := sorry

/-- `X ⊗_{ℤ_p} ℤ_p^m = X^{⊕ m}`. -/
def PDivGroup.tensorFree {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) (m : ℕ) :
    PDivGroup p S := sorry

/-- Relative Frobenius `X → X^{(p^s)}` iterated `s` times, composed with `p^{-r}`, as a
quasi-isogeny `X ⇢ X^{(p^s)}` (owner: R07.1). -/
def PDivGroup.frobTwist {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) (s : ℕ) :
    PDivGroup p S := sorry

/-- The quasi-isogeny `p^{-r} Frob^s : X ⇢ X^{(p^s)}`. -/
def PDivGroup.slopeQIsog {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) (r s : ℕ) :
    PDivGroup.QIsog X (X.frobTwist s) := sorry

/-- A quasi-isogeny that is an isogeny (with its underlying isogeny). -/
def PDivGroup.QIsog.IsogenyLift {p : ℕ} {S : Scheme.{u}} {X Y : PDivGroup p S}
    (f : PDivGroup.QIsog X Y) : Type u := sorry

/-- A quasi-isogeny that is an isomorphism (with its underlying isomorphism). -/
def PDivGroup.QIsog.IsoLift {p : ℕ} {S : Scheme.{u}} {X Y : PDivGroup p S}
    (f : PDivGroup.QIsog X Y) : Type u := sorry

/-- The slope sequence (Newton polygon) of a p-divisible group over a point, as a multiset of
slopes in `[0, 1]` counted with multiplicity (owner: R07.1, Dieudonné–Manin). -/
def PDivGroup.newtonPolygon {p : ℕ} {K : Type u} [Field K] (X : PDivGroup p (pt K)) :
    Multiset ℚ := sorry

/-- The rational covariant Dieudonné module `D(X)[1/p]` of a p-divisible group over a perfect
field, an isocrystal over `K(p, K) = W(K)[1/p]` (owner: R07.1). -/
def PDivGroup.rationalDieudonne {p : ℕ} [Fact p.Prime] {K : Type u} [Field K] [CharP K p]
    [PerfectRing K p] (X : PDivGroup p (pt K)) : Type u := sorry

instance {p : ℕ} [Fact p.Prime] {K : Type u} [Field K] [CharP K p] [PerfectRing K p]
    (X : PDivGroup p (pt K)) : AddCommGroup X.rationalDieudonne := sorry

instance {p : ℕ} [Fact p.Prime] {K : Type u} [Field K] [CharP K p] [PerfectRing K p]
    (X : PDivGroup p (pt K)) : WittVector.Isocrystal p K X.rationalDieudonne := sorry

/-- The set `B(G_{ℚ_p})` of all σ-conjugacy classes of `G(L)`, `L = W(𝔽̄_p)[1/p]` (owner:
BunGAndNewtonStrata BG0). -/
def IG0BG (D : UnitarySimilitudeDatum) (p : ℕ) : Type := sorry

/-- The inclusion `B(G, μ⁻¹) ↪ B(G)` (owner: BunGAndNewtonStrata BG1). -/
def KottwitzSet.toBG {D : UnitarySimilitudeDatum} {p : ℕ} : KottwitzSet D p ↪ IG0BG D p := sorry

/-- The basic element of `B(G, μ⁻¹)`. -/
def KottwitzSet.basic (D : UnitarySimilitudeDatum) (p : ℕ) : KottwitzSet D p := sorry

/-- The (μ-)ordinary element of `B(G, μ⁻¹)`. -/
def KottwitzSet.ordinary (D : UnitarySimilitudeDatum) (p : ℕ) : KottwitzSet D p := sorry

/-- The pairing `⟨2ρ, ν_b⟩` of the Newton point with twice the half-sum of positive roots (owner:
BunGAndNewtonStrata BG1). -/
def KottwitzSet.dimLeaf {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) : ℕ := sorry

/-- The pairing `⟨2ρ, μ⟩` (the dimension of the Shimura variety, or of a Rapoport–Zink space). -/
def KottwitzSet.dimMu (D : UnitarySimilitudeDatum) (p : ℕ) : ℕ := sorry

/-- The isocrystal with `G`-structure of a p-divisible group with `G`-structure over a perfect
field, as a class in `B(G)` (owner of `B(G)`: BunGAndNewtonStrata BG0). -/
def PDivGStructure.isocrystalClass {D : UnitarySimilitudeDatum} {p : ℕ} {K : Type u} [Field K]
    (X : PDivGStructure D p (pt K)) : IG0BG D p := sorry

end IG0Carriers

/-! ### `IG.0/quasi-split-unitary-datum` -/

namespace UnitarySimilitudeDatum

variable (D : UnitarySimilitudeDatum)

/-- (IG.0/quasi-split-unitary-datum) The unitary similitude group scheme `G` over `ℤ`, through its
functor of points `R ↦ G(R) = {(g, c) ∈ GL_{O_F}(L ⊗ R) × Rˣ : (gv, gw) = c (v, w)}`. -/
def group (D : UnitarySimilitudeDatum) (R : Type) [CommRing R] : Type := sorry

instance (R : Type) [CommRing R] : Group (D.group R) := sorry

/-- Functoriality of `G(R)` in `R`. -/
def groupMap (D : UnitarySimilitudeDatum) {R R' : Type} [CommRing R] [CommRing R'] (f : R →+* R') : D.group R →* D.group R' :=
  sorry

/-- The similitude character `c : G → 𝔾_m`. -/
def similitude (D : UnitarySimilitudeDatum) (R : Type) [CommRing R] : D.group R →* Rˣ := sorry

/-- The central scalars `𝔾_m ⊂ G`, `t ↦ t · id` (similitude factor `t²`). -/
def scalar (D : UnitarySimilitudeDatum) (R : Type) [CommRing R] : Rˣ →* D.group R := sorry

/-- (IG.0/quasi-split-unitary-datum) The unitary group `G⁰ = ker (c : G → 𝔾_m)`. -/
def unitaryGroup (R : Type) [CommRing R] : Subgroup (D.group R) := (D.similitude R).ker

/-- The principal congruence subgroup `K(N) = {g ∈ G(ℤ̂) : g ≡ 1 mod N} ⊂ G(𝔸_f)`. -/
def principalLevel (D : UnitarySimilitudeDatum) (N : ℕ) : Subgroup (D.group IG0Af) := sorry

/-- (IG.0/quasi-split-unitary-datum) The locally symmetric space
`X_K = G(ℚ) \ (X × G(𝔸_f) / K)`. -/
def locallySymmetricSpace (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) : Type := sorry

instance (K : Subgroup (D.group IG0Af)) : TopologicalSpace (D.locallySymmetricSpace K) := sorry

/-- The locally symmetric space `X⁰_{K⁰}` of the unitary group, for `K⁰ ⊂ G⁰(𝔸_f)`. -/
def unitaryLocallySymmetricSpace (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) : Type := sorry

instance (K : Subgroup (D.group IG0Af)) :
    TopologicalSpace (D.unitaryLocallySymmetricSpace K) := sorry

/-- (IG.0/quasi-split-unitary-datum) `X_{K(N)}` (`N ≥ 3`, so `K(N)` is neat) is a real manifold of
dimension `2d = 2 [F⁺ : ℚ] n²`. -/
theorem dim_locallySymmetricSpace (N : ℕ) (hN : 3 ≤ N) :
    Nonempty (ChartedSpace (EuclideanSpace ℝ (Fin (2 * D.dim)))
      (D.locallySymmetricSpace (D.principalLevel N))) := sorry

/-- The Hecke algebra `𝕋^{0,S}` of the unitary group. -/
def UnitaryHeckeAlgebra (D : UnitarySimilitudeDatum) (S : Finset ℕ) : Type := sorry

instance (S : Finset ℕ) : CommRing (D.UnitaryHeckeAlgebra S) := sorry

/-- The restriction map `𝕋^S → 𝕋^{0,S}`. -/
def heckeRestrict (D : UnitarySimilitudeDatum) (S : Finset ℕ) : HeckeAlgebra D S →+* D.UnitaryHeckeAlgebra S := sorry

/-- (IG.0/quasi-split-unitary-datum) The Hecke operator `T_{i,v} ∈ 𝕋^S`, for `1 ≤ i ≤ 2n` and a
prime `v` of `F` above `p ∉ S` (split in `F₀`; that condition is not expressible with these
carriers). -/
def heckeOperator (D : UnitarySimilitudeDatum) (S : Finset ℕ) (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 2 * D.n)
    (v : IsDedekindDomain.HeightOneSpectrum (𝓞 D.F)) (p : ℕ) (hp : p ∉ S)
    (hv : (p : 𝓞 D.F) ∈ v.asIdeal) : HeckeAlgebra D S := sorry

/-- The Hecke operator `T⁰_{i,v} ∈ 𝕋^{0,S}`. -/
def unitaryHeckeOperator (D : UnitarySimilitudeDatum) (S : Finset ℕ) (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 2 * D.n)
    (v : IsDedekindDomain.HeightOneSpectrum (𝓞 D.F)) (p : ℕ) (hp : p ∉ S)
    (hv : (p : 𝓞 D.F) ∈ v.asIdeal) : D.UnitaryHeckeAlgebra S := sorry

/-- (IG.0/quasi-split-unitary-datum) The restriction `𝕋^S → 𝕋^{0,S}` maps `T_{i,v}` to `T⁰_{i,v}`. -/
@[simp]
theorem heckeRestrict_heckeOperator (S : Finset ℕ) (i : ℕ) (hi : 1 ≤ i ∧ i ≤ 2 * D.n)
    (v : IsDedekindDomain.HeightOneSpectrum (𝓞 D.F)) (p : ℕ) (hp : p ∉ S)
    (hv : (p : 𝓞 D.F) ∈ v.asIdeal) :
    D.heckeRestrict S (D.heckeOperator S i hi v p hp hv) =
      D.unitaryHeckeOperator S i hi v p hp hv := sorry

end UnitarySimilitudeDatum

/-- A rational PEL datum `(B, *, V, (·,·), L)` (owner: PELModuli M0): a finite-dimensional
`ℚ`-algebra with anti-involution acting on `V = ℚ^m`, an alternating form with `(bv, w) =
(v, b* w)`, and a lattice. -/
structure PELDatum where
  /-- The algebra `B`. -/
  B : Type
  [ring : Ring B]
  [algebra : Algebra ℚ B]
  [finiteDimensional : FiniteDimensional ℚ B]
  /-- The anti-involution `*`. -/
  invol : B ≃ₐ[ℚ] Bᵐᵒᵖ
  /-- `dim_ℚ V`. -/
  dimV : ℕ
  /-- The action of `B` on `V = ℚ^{dimV}`. -/
  act : B →ₐ[ℚ] Module.End ℚ (Fin dimV → ℚ)
  /-- The alternating form. -/
  form : LinearMap.BilinForm ℚ (Fin dimV → ℚ)
  form_alt : ∀ v, form v v = 0
  form_adj : ∀ (b : B) (v w : Fin dimV → ℚ), form (act b v) w = form v (act (invol b).unop w)
  /-- The lattice `L`. -/
  L : Submodule ℤ (Fin dimV → ℚ)

namespace UnitarySimilitudeDatum

variable (D : UnitarySimilitudeDatum)

/-- (IG.0/quasi-split-unitary-datum) The underlying PEL datum `(F, c, V, (·,·), L)` of PELModuli
M0. -/
def toPELDatum (D : UnitarySimilitudeDatum) : PELDatum := sorry

/-- The skew-hermitian form `⟨x, y⟩ = Σ_{i=1}^n (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i)` on `F^{2n}`. -/
def skewHermitian (x y : Fin (2 * D.n) → D.F) : D.F :=
  ∑ i : Fin D.n,
    (x ⟨i, by omega⟩ * NumberField.IsCMField.complexConj D.F (y ⟨2 * D.n - 1 - i, by omega⟩) -
      x ⟨2 * D.n - 1 - i, by omega⟩ * NumberField.IsCMField.complexConj D.F (y ⟨i, by omega⟩))

/-- The alternating form `(x, y) = tr_{F/ℚ} ⟨x, y⟩`. -/
def traceForm (x y : Fin (2 * D.n) → D.F) : ℚ := splitTracePairing D.F D.n x y

/-- Self-duality of an `O_F`-lattice for `(·,·)`. -/
def IsSelfDualLattice (M : Submodule (𝓞 D.F) (Fin (2 * D.n) → D.F)) : Prop :=
  ∀ y, y ∈ M ↔ ∀ x ∈ M, ∃ z : ℤ, D.traceForm x y = z

/-- The standard lattice `O_F^n ⊕ (𝔡^{-1})^n`, `𝔡^{-1}` the inverse different. -/
def standardLattice : Submodule (𝓞 D.F) (Fin (2 * D.n) → D.F) :=
  Submodule.pi Set.univ fun i =>
    if (i : ℕ) < D.n then (1 : Submodule (𝓞 D.F) D.F)
    else ((FractionalIdeal.dual ℤ ℚ (1 : FractionalIdeal (nonZeroDivisors (𝓞 D.F)) D.F) :
      FractionalIdeal (nonZeroDivisors (𝓞 D.F)) D.F) : Submodule (𝓞 D.F) D.F)

/-- The antidiagonal matrix `J` of `⟨·,·⟩`, with entries in any ring. -/
def skewMatrix (A : Type) [Ring A] : Matrix (Fin (2 * D.n)) (Fin (2 * D.n)) A :=
  fun i j => if (i : ℕ) + j + 1 = 2 * D.n then (if (i : ℕ) < D.n then 1 else -1) else 0

/-- Complex conjugation on `F ⊗_ℚ R`. -/
def conjTensor (R : Type) [CommRing R] [Algebra ℚ R] : D.F ⊗[ℚ] R →ₐ[ℚ] D.F ⊗[ℚ] R :=
  Algebra.TensorProduct.map
    ((NumberField.IsCMField.complexConj D.F).toAlgHom.restrictScalars ℚ) (AlgHom.id ℚ R)

/-- The `J`-unitary group `{g ∈ GL_{2n}(F ⊗ R) : gᵀ J ḡ = J}`. -/
def skewUnitaryGroup (R : Type) [CommRing R] [Algebra ℚ R] :
    Subgroup (GL (Fin (2 * D.n)) (D.F ⊗[ℚ] R)) where
  carrier := {g | (g : Matrix _ _ _).transpose * D.skewMatrix (D.F ⊗[ℚ] R) *
    (g : Matrix _ _ _).map (D.conjTensor R) = D.skewMatrix (D.F ⊗[ℚ] R)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

end UnitarySimilitudeDatum

-- test: UnitarySimilitudeDatum.dim_imagQuadratic_one — F imaginary quadratic, n = 1: d = 1 and X_{K(N)} is a real surface
example (D : UnitarySimilitudeDatum) (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1) :
    D.dim = 1 ∧ ∀ N, 3 ≤ N →
      Nonempty (ChartedSpace (EuclideanSpace ℝ (Fin 2))
        (D.locallySymmetricSpace (D.principalLevel N))) := sorry

-- test: UnitarySimilitudeDatum.selfDual_standardLattice — O_F^n ⊕ 𝔡^{-1,n} is self-dual for tr⟨·,·⟩
example (D : UnitarySimilitudeDatum) : D.IsSelfDualLattice D.standardLattice := sorry

-- test: UnitarySimilitudeDatum.unitaryGroup_ne_group — the scalar 2 ∈ G(ℚ) has similitude 4 ≠ 1, so G⁰(ℚ) ≠ G(ℚ)
example (D : UnitarySimilitudeDatum) :
    (D.similitude ℚ (D.scalar ℚ (Units.mk0 2 two_ne_zero)) : ℚ) = 4 ∧
      D.scalar ℚ (Units.mk0 2 two_ne_zero) ∉ D.unitaryGroup ℚ ∧ D.unitaryGroup ℚ ≠ ⊤ := sorry

-- test: UnitarySimilitudeDatum.unitaryGroup_compat — for a ℚ-algebra R, G⁰(R) is the J-unitary group of ⟨·,·⟩ over F ⊗ R (not Mathlib's `Matrix.unitaryGroup`, which is the unitary group of the identity form)
example (D : UnitarySimilitudeDatum) (R : Type) [CommRing R] [Algebra ℚ R] :
    Nonempty (D.unitaryGroup R ≃* D.skewUnitaryGroup R) := sorry

/-! ### `IG.0/unitary-subgroup-comparison` -/

namespace UnitarySimilitudeDatum

/-- `H^i(X_K, Λ)` of the locally symmetric space (owner of the singular/sheaf cohomology:
LocallySymmetricSpaces). -/
def lssCoh (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type) [CommRing Λ]
    (i : ℕ) : Type := sorry
/-- `H^i_c(X_K, Λ)`. -/
def lssCohC (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type) [CommRing Λ]
    (i : ℕ) : Type := sorry
/-- `H^i(X⁰_{K⁰}, Λ)`. -/
def unitaryLssCoh (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type)
    [CommRing Λ] (i : ℕ) : Type := sorry
/-- `H^i_c(X⁰_{K⁰}, Λ)`. -/
def unitaryLssCohC (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type)
    [CommRing Λ] (i : ℕ) : Type := sorry

variable (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type) [CommRing Λ]
  (i : ℕ) (S : Finset ℕ)

instance : AddCommGroup (D.lssCoh K Λ i) := sorry
instance : AddCommGroup (D.lssCohC K Λ i) := sorry
instance : AddCommGroup (D.unitaryLssCoh K Λ i) := sorry
instance : AddCommGroup (D.unitaryLssCohC K Λ i) := sorry
instance : Module (HeckeAlgebra D S) (D.lssCoh K Λ i) := sorry
instance : Module (HeckeAlgebra D S) (D.lssCohC K Λ i) := sorry
instance : Module (D.UnitaryHeckeAlgebra S) (D.unitaryLssCoh K Λ i) := sorry
instance : Module (D.UnitaryHeckeAlgebra S) (D.unitaryLssCohC K Λ i) := sorry

/-- The map `X⁰_{K⁰} → X_K`, `K⁰ = K ∩ G⁰(𝔸_f)`, induced by `G⁰ ↪ G`. -/
def unitaryInclusion (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) :
    D.unitaryLocallySymmetricSpace (K ⊓ D.unitaryGroup IG0Af) → D.locallySymmetricSpace K :=
  sorry

/-- Restriction `H^i(X_K) → H^i(X⁰_{K⁰})`. -/
def restrictCoh (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type)
    [CommRing Λ] (i : ℕ) :
    D.lssCoh K Λ i →+ D.unitaryLssCoh (K ⊓ D.unitaryGroup IG0Af) Λ i := sorry

/-- Extension by zero `H^i_c(X⁰_{K⁰}) → H^i_c(X_K)` along the open and closed immersion. -/
def extendCohC (D : UnitarySimilitudeDatum) (K : Subgroup (D.group IG0Af)) (Λ : Type)
    [CommRing Λ] (i : ℕ) :
    D.unitaryLssCohC (K ⊓ D.unitaryGroup IG0Af) Λ i →+ D.lssCohC K Λ i := sorry

end UnitarySimilitudeDatum

/-- (IG.0/unitary-subgroup-comparison) For `K = K(N)` (`N ≥ 3`, neat) and `K⁰ = K ∩ G⁰(𝔸_f)`,
`X⁰_{K⁰} → X_K` is an open and closed embedding, and the induced maps on `H^i` and `H^i_c` are
equivariant for `𝕋^S → 𝕋^{0,S}` (`S` containing the primes dividing `N`). -/
theorem unitarySubgroupComparison (D : UnitarySimilitudeDatum) (N : ℕ) (hN : 3 ≤ N)
    (S : Finset ℕ) (hS : ∀ q : ℕ, q.Prime → q ∣ N → q ∈ S) (Λ : Type) [CommRing Λ] (i : ℕ) :
    Topology.IsOpenEmbedding (D.unitaryInclusion (D.principalLevel N)) ∧
      IsClosed (Set.range (D.unitaryInclusion (D.principalLevel N))) ∧
      (∀ (t : HeckeAlgebra D S) (x : D.lssCoh (D.principalLevel N) Λ i),
        D.restrictCoh (D.principalLevel N) Λ i (t • x) =
          D.heckeRestrict S t • D.restrictCoh (D.principalLevel N) Λ i x) ∧
      (∀ (t : HeckeAlgebra D S)
          (x : D.unitaryLssCohC (D.principalLevel N ⊓ D.unitaryGroup IG0Af) Λ i),
        D.extendCohC (D.principalLevel N) Λ i (D.heckeRestrict S t • x) =
          t • D.extendCohC (D.principalLevel N) Λ i x) := sorry

/-! ### `IG.0/hasse-principle` -/

/-- The pointed Galois cohomology set `H¹(K, G)` for a field `K ⊃ ℚ` (owner:
GaloisCohomology of reductive groups). -/
def UnitarySimilitudeDatum.galoisH1 (D : UnitarySimilitudeDatum) (K : Type) [Field K]
    [Algebra ℚ K] : Type := sorry

/-- Functoriality of `H¹(·, G)` in the field. -/
def UnitarySimilitudeDatum.galoisH1Map (D : UnitarySimilitudeDatum) {K K' : Type} [Field K]
    [Field K'] [Algebra ℚ K] [Algebra ℚ K'] (f : K →ₐ[ℚ] K') :
    D.galoisH1 K → D.galoisH1 K' := sorry

/-- (IG.0/hasse-principle) `H¹(ℚ, G) → ∏_v H¹(ℚ_v, G)` is injective. -/
theorem hassePrinciple (D : UnitarySimilitudeDatum) (c c' : D.galoisH1 ℚ)
    (hfin : ∀ (p : ℕ) [Fact p.Prime],
      D.galoisH1Map (Algebra.ofId ℚ ℚ_[p]) c = D.galoisH1Map (Algebra.ofId ℚ ℚ_[p]) c')
    (hinf : D.galoisH1Map (Algebra.ofId ℚ ℝ) c = D.galoisH1Map (Algebra.ofId ℚ ℝ) c') :
    c = c' := sorry

/-! ### `IG.0/g-structure` -/

/-- Abelian schemes with `G`-structure `(A, ι, λ)` over `S` (owner of abelian schemes:
AbelianSchemesAndArithmeticModuli A1). -/
def AbVarGStructure (D : UnitarySimilitudeDatum) (S : Scheme.{u}) : Type (u + 1) := sorry

/-- The relative dimension of the abelian scheme. -/
def AbVarGStructure.relDim {D : UnitarySimilitudeDatum} {S : Scheme.{u}}
    (A : AbVarGStructure D S) : ℕ := sorry

namespace PDivGStructure

variable {D : UnitarySimilitudeDatum} {p : ℕ}

/-- The underlying p-divisible group. -/
abbrev pdiv {S : Scheme.{u}} (X : PDivGStructure D p S) : PDivGroup p S :=
  PDivGStructure.toPDivGroup.obj X

/-- (IG.0/g-structure) `A[p^∞]` of an abelian variety with `G`-structure. -/
def ofAbelian (D : UnitarySimilitudeDatum) (p : ℕ) {S : Scheme.{u}} (A : AbVarGStructure D S) :
    PDivGStructure D p S := sorry

/-- (IG.0/g-structure) Base change along `T → S`. -/
def baseChange (D : UnitarySimilitudeDatum) (p : ℕ) {S T : Scheme.{u}} (f : T ⟶ S) :
    PDivGStructure D p S ⥤ PDivGStructure D p T := sorry

/-- Base change is compatible with composition. -/
def baseChangeComp (D : UnitarySimilitudeDatum) (p : ℕ) {S T U : Scheme.{u}} (f : T ⟶ S)
    (g : U ⟶ T) : baseChange D p (g ≫ f) ≅ baseChange D p f ⋙ baseChange D p g := sorry

/-- (IG.0/g-structure) Height `2[F:ℚ]n` and dimension `[F:ℚ]n`. -/
theorem height_eq {S : Scheme.{u}} (X : PDivGStructure D p S) :
    X.pdiv.height = 2 * Module.finrank ℚ D.F * D.n ∧
      X.pdiv.dim = Module.finrank ℚ D.F * D.n := sorry

/-- (IG.0/g-structure) Similitude isomorphisms: `O_F`-linear isomorphisms carrying `λ` to a
`ℤ_p^×`-multiple of `λ′`. -/
def Iso {S : Scheme.{u}} (X Y : PDivGStructure D p S) : Type u := sorry

/-- Strict isomorphisms are similitude isomorphisms. -/
def Iso.ofIso {S : Scheme.{u}} {X Y : PDivGStructure D p S} (e : X ≅ Y) : Iso X Y := sorry

/-- The underlying isomorphism of p-divisible groups. -/
def Iso.toPDivIso {S : Scheme.{u}} {X Y : PDivGStructure D p S} (e : Iso X Y) :
    X.pdiv ≅ Y.pdiv := sorry

/-- (IG.0/g-structure) The principal polarization `λ : X ≅ X^∨` (semilinear for complex
conjugation on `O_F`). -/
def cartierDual {S : Scheme.{u}} (X : PDivGStructure D p S) :
    X.pdiv ≅ X.pdiv.cartierDual := sorry

/-- The rank of the `τ`-isotypic part `(Lie X)_τ`, `τ : O_F → k` (signature at `τ`). -/
def lieRank {k : Type u} [Field k] (X : PDivGStructure D p (pt k)) (τ : 𝓞 D.F →+* k) : ℕ :=
  sorry

/-- Quasi-isogenies of p-divisible groups with `G`-structure (respecting `λ` up to `ℚ_p^×`). -/
def QIsog {S : Scheme.{u}} (X Y : PDivGStructure D p S) : Type u := sorry

end PDivGStructure

-- test: PDivGStructure.ordinary_exists — over 𝔽̄_p, μ ⊗ O_F^n ⊕ ℚ_p/ℤ_p ⊗ O_F^n carries a G-structure of height 2[F:ℚ]n
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (hunr : ¬ (p : ℤ) ∣ NumberField.discr D.F) :
    ∃ X : PDivGStructure D p (pt k),
      Nonempty (X.pdiv ≅ PDivGroup.sum
        ((PDivGroup.mu p (pt k)).tensorFree (Module.finrank ℚ D.F * D.n))
        ((PDivGroup.etaleUnit p (pt k)).tensorFree (Module.finrank ℚ D.F * D.n))) ∧
      X.pdiv.height = 2 * Module.finrank ℚ D.F * D.n := sorry

-- test: PDivGStructure.lie_rank_condition — every τ-part of Lie X has rank n, so signature (n+1, n−1) is excluded
example (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k]
    (X : PDivGStructure D p (pt k)) (τ : 𝓞 D.F →+* k) : X.lieRank τ = D.n := sorry

-- test: PDivGStructure.ofAbelian_height — ht A[p^∞] = 2 dim A = 2[F:ℚ]n
example (D : UnitarySimilitudeDatum) (p : ℕ) {S : Scheme.{u}} (A : AbVarGStructure D S) :
    (PDivGStructure.ofAbelian D p A).pdiv.height = 2 * A.relDim ∧
      A.relDim = Module.finrank ℚ D.F * D.n := sorry

/-! ### `IG.0/integral-model` -/

instance IG0spanPrime (p : ℕ) [Fact p.Prime] : (Ideal.span {(p : ℤ)}).IsPrime := sorry

/-- `ℤ_(p)`. -/
abbrev IG0Zloc (p : ℕ) [Fact p.Prime] : Type := Localization.AtPrime (Ideal.span {(p : ℤ)})

/-- `ℤ[1/(Δ_F N)]`. -/
abbrev IG0Away (D : UnitarySimilitudeDatum) (N : ℕ) : Type :=
  Localization.Away ((N : ℤ) * NumberField.discr D.F)

/-- The moduli problem `S^pre_K` of `(A, ι, λ, η, ζ_N)` with the lifting condition, as a scheme
over `ℤ[1/Δ_F]` (it is a scheme after inverting `N` or localizing at `p` with prime-to-`p` part of
`N` at least 3). -/
def PreIntegralModel (D : UnitarySimilitudeDatum) (N : ℕ) : Scheme.{0} := sorry

/-- Structure morphism of `S^pre_K`. -/
def PreIntegralModel.toSpecZ (D : UnitarySimilitudeDatum) (N : ℕ) :
    PreIntegralModel D N ⟶ Spec (CommRingCat.of ℤ) := sorry

/-- `S^pre_K × ℤ[1/(Δ_F N)]`. -/
def PreIntegralModel.away (D : UnitarySimilitudeDatum) (N : ℕ) : Scheme.{0} :=
  pullback (PreIntegralModel.toSpecZ D N)
    (Spec.map (CommRingCat.ofHom (algebraMap ℤ (IG0Away D N))))

/-- The open immersion `S^pre_K × ℤ[1/(Δ_F N)] → S^pre_K`. -/
def PreIntegralModel.awayι (D : UnitarySimilitudeDatum) (N : ℕ) :
    PreIntegralModel.away D N ⟶ PreIntegralModel D N := pullback.fst _ _

instance (D : UnitarySimilitudeDatum) (N : ℕ) : QuasiCompact (PreIntegralModel.awayι D N) :=
  sorry
instance (D : UnitarySimilitudeDatum) (N : ℕ) : QuasiSeparated (PreIntegralModel.awayι D N) :=
  sorry

/-- (IG.0/integral-model) The integral model `S_K`, `K = K(N)`: the normalization of `S^pre_K` in
`S^pre_K × ℤ[1/(Δ_F N)]`. -/
def IntegralModel (D : UnitarySimilitudeDatum) (N : ℕ) : Scheme.{0} :=
  (PreIntegralModel.awayι D N).normalization

namespace IntegralModel

/-- Structure morphism `S_K → Spec ℤ`. -/
def toSpecZ (D : UnitarySimilitudeDatum) (N : ℕ) : IntegralModel D N ⟶ Spec (CommRingCat.of ℤ) :=
  (PreIntegralModel.awayι D N).fromNormalization ≫ PreIntegralModel.toSpecZ D N

/-- `S_K ⊗ ℤ_(p)`. -/
def atP (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime] : Scheme.{0} :=
  pullback (toSpecZ D N) (Spec.map (CommRingCat.ofHom (algebraMap ℤ (IG0Zloc p))))

/-- `S_K ⊗ ℤ_(p) → Spec ℤ_(p)`. -/
def toZp (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime] :
    atP D N p ⟶ Spec (CommRingCat.of (IG0Zloc p)) := pullback.snd _ _

/-- `S_K × ℤ[1/(Δ_F N)]`. -/
def away (D : UnitarySimilitudeDatum) (N : ℕ) : Scheme.{0} :=
  pullback (toSpecZ D N) (Spec.map (CommRingCat.ofHom (algebraMap ℤ (IG0Away D N))))

/-- `S_K × ℤ[1/(Δ_F N)] → Spec ℤ[1/(Δ_F N)]`. -/
def awayToBase (D : UnitarySimilitudeDatum) (N : ℕ) :
    away D N ⟶ Spec (CommRingCat.of (IG0Away D N)) := pullback.snd _ _

/-- Isomorphism classes of tuples `(A, ι, λ, η, ζ_N)` over `T` satisfying the lifting condition. -/
def LevelTuple (D : UnitarySimilitudeDatum) (N : ℕ) (T : Scheme.{0}) : Type := sorry

/-- (IG.0/integral-model) Away from `Δ_F N`, `S_K` represents the moduli problem. -/
theorem moduli (D : UnitarySimilitudeDatum) (N : ℕ) (hN : 3 ≤ N) (T : Scheme.{0})
    (f : T ⟶ Spec (CommRingCat.of (IG0Away D N))) :
    Nonempty ({g : T ⟶ away D N // g ≫ awayToBase D N = f} ≃ LevelTuple D N T) := sorry

/-- (IG.0/integral-model) For `p ∤ NΔ_F`, `S_K ⊗ ℤ_(p)` is smooth of relative dimension `d`. -/
instance smooth_of_good (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime] [Fact (3 ≤ N)]
    [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    SmoothOfRelativeDimension D.dim (toZp D N p) := sorry

/-- (IG.0/integral-model) The universal p-divisible group with `G`-structure `A[p^∞]`. -/
def universalPDiv (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime] :
    PDivGStructure D p (atP D N p) := sorry

/-- (IG.0/integral-model) The prime-to-`p` Hecke correspondence `[g]`, `g ∈ G(𝔸_f^p)`. -/
def hecke (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime] (g : GAfp D p) :
    SchemeCorrespondence (atP D N p) := sorry

/-- Change of level `S_{K(M)} → S_{K(N)}` for `N ∣ M`. -/
def transition (D : UnitarySimilitudeDatum) {N M : ℕ} (h : N ∣ M) :
    IntegralModel D M ⟶ IntegralModel D N := sorry

end IntegralModel

/-- The smooth integral model of a PEL datum at hyperspecial level (owner: PELModuli M2). -/
def PELIntegralModel (P : PELDatum) (N p : ℕ) [Fact p.Prime] : Scheme.{0} := sorry

/-- (IG.0/integral-model) Over `ℤ_(p)`, `p ∤ NΔ_F`, `S_K` is the PELModuli M2 model. -/
def IntegralModel.toPELModuli (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime]
    (hN : 3 ≤ N) (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) :
    IntegralModel.atP D N p ≅ PELIntegralModel D.toPELDatum N p := sorry

-- test: IntegralModel.relDim — relative dimension [F⁺:ℚ]n²; a relative curve for F imaginary quadratic, n = 1
example (D : UnitarySimilitudeDatum) (N p : ℕ) [Fact p.Prime] [Fact (3 ≤ N)]
    [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    SmoothOfRelativeDimension
        (Module.finrank ℚ (NumberField.maximalRealSubfield D.F) * D.n ^ 2)
        (IntegralModel.toZp D N p) ∧
      (Module.finrank ℚ D.F = 2 → D.n = 1 →
        SmoothOfRelativeDimension 1 (IntegralModel.toZp D N p)) := sorry

-- test: IntegralModel.generic_points — S_K(ℂ) ≅ X_K
example (D : UnitarySimilitudeDatum) (N : ℕ) (hN : 3 ≤ N) :
    Nonempty ((Spec (CommRingCat.of ℂ) ⟶ IntegralModel D N) ≃
      D.locallySymmetricSpace (D.principalLevel N)) := sorry

-- test: IntegralModel.not_smooth_at_N — no smoothness at p ∣ N: e.g. F imaginary quadratic, n = 1, N = p ≥ 3 gives a non-smooth model at p (Katz–Mazur full level p)
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (hp : 3 ≤ p)
    (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1)
    (hunr : ¬ (p : ℤ) ∣ NumberField.discr D.F) :
    ¬ Smooth (IntegralModel.toZp D p p) := sorry

/-! ### `IG.0/complex-uniformization` -/

/-- Change of level `X_{K(M)} → X_{K(N)}` for `N ∣ M`. -/
def UnitarySimilitudeDatum.lssTransition (D : UnitarySimilitudeDatum) {N M : ℕ} (h : N ∣ M) :
    D.locallySymmetricSpace (D.principalLevel M) → D.locallySymmetricSpace (D.principalLevel N) :=
  sorry

/-- (IG.0/complex-uniformization) Natural bijections `S_{K(N)}(ℂ) ≅ X_{K(N)}`, compatible with the
change-of-level maps of the tower (the `G(𝔸_f)`-equivariance at the level of the tower); the
complex-analytic structure on `S_K(ℂ)` is not available in Mathlib. -/
theorem complexUniformization (D : UnitarySimilitudeDatum) :
    ∃ e : ∀ N : ℕ, 3 ≤ N → ((Spec (CommRingCat.of ℂ) ⟶ IntegralModel D N) ≃
        D.locallySymmetricSpace (D.principalLevel N)),
      ∀ (N M : ℕ) (hN : 3 ≤ N) (hM : 3 ≤ M) (h : N ∣ M)
        (x : Spec (CommRingCat.of ℂ) ⟶ IntegralModel D M),
        e N hN (x ≫ IntegralModel.transition D h) = D.lssTransition h (e M hM x) := sorry


/-! ### `IG.0/unramified-local-pel-datum` -/

/-- The three types of simple algebras with positive involution: (A) unitary, (C) symplectic,
(D) orthogonal. -/
inductive PELType
  | A
  | C
  | D

/-- The type of a semisimple `ℚ_p`-algebra with anti-involution (owner: PELModuli M0). -/
def involutionType {p : ℕ} [Fact p.Prime] (B : Type) [Ring B] [Algebra ℚ_[p] B]
    (invol : B ≃ₐ[ℚ_[p]] Bᵐᵒᵖ) : PELType := sorry

/-- An unramified extension of `ℚ_p`, described by its finite étale `ℤ_p`-order and
fraction field. This is an imported local-field interface (owner: PELModuli M0), not a
new classification of local fields. -/
structure UnramifiedPadicField (p : ℕ) [Fact p.Prime] where
  F : Type
  [field : Field F]
  [algebra : Algebra ℚ_[p] F]
  [finiteDimensional : FiniteDimensional ℚ_[p] F]
  [integerAlgebra : Algebra ℤ_[p] F]
  [tower : IsScalarTower ℤ_[p] ℚ_[p] F]
  integers : Subalgebra ℤ_[p] F
  finite : Module.Finite ℤ_[p] integers
  etale : Algebra.Etale ℤ_[p] integers
  fraction : IsFractionRing integers F

attribute [instance] UnramifiedPadicField.field UnramifiedPadicField.algebra
  UnramifiedPadicField.finiteDimensional UnramifiedPadicField.integerAlgebra
  UnramifiedPadicField.tower

/-- Scalar extension of a bilinear form in the standard coordinates, with no extra
arbitrary pairing over `ℚ̄_p`. -/
def localPELFormBar {p d : ℕ} [Fact p.Prime]
    (form : LinearMap.BilinForm ℚ_[p] (Fin d → ℚ_[p]))
    (v w : Fin d → AlgebraicClosure ℚ_[p]) : AlgebraicClosure ℚ_[p] :=
  ∑ i, ∑ j, algebraMap ℚ_[p] (AlgebraicClosure ℚ_[p])
    (form (Pi.single i 1) (Pi.single j 1)) * v i * w j

/-- Scalar extension of the `B`-action in the same coordinates. -/
def localPELActBar {p d : ℕ} [Fact p.Prime] {B : Type} [Ring B] [Algebra ℚ_[p] B]
    (act : B →ₐ[ℚ_[p]] Module.End ℚ_[p] (Fin d → ℚ_[p]))
    (b : B) (v : Fin d → AlgebraicClosure ℚ_[p]) : Fin d → AlgebraicClosure ℚ_[p] :=
  fun i ↦ ∑ j, algebraMap ℚ_[p] (AlgebraicClosure ℚ_[p]) (act b (Pi.single j 1) i) * v j

/-- (IG.0/unramified-local-pel-datum) The full unramified local PEL datum, excluding type D.
The matrix decomposition specifies the unramified centre and its maximal integral order.
The projector specifies weights 0 and 1; B-linearity, both isotropy conditions and the
similitude equation ensure that `(1-P)+tP` is the required cocharacter in `G`, with `c∘μ=id`.
The admissible class `b ∈ B(G,μ⁻¹)` is a separate argument. -/
structure LocalPELDatum (p : ℕ) [Fact p.Prime] where
  /-- The algebra `B`. -/
  B : Type
  [ring : Ring B]
  [algebra : Algebra ℚ_[p] B]
  [finiteDimensional : FiniteDimensional ℚ_[p] B]
  [semisimple : IsSemisimpleRing B]
  factors : ℕ
  fieldFactor : Fin factors → UnramifiedPadicField p
  matrixSize : Fin factors → ℕ
  matrixSize_pos : ∀ i, 0 < matrixSize i
  decomposition : B ≃ₐ[ℚ_[p]] (∀ i, Matrix (Fin (matrixSize i)) (Fin (matrixSize i)) (fieldFactor i).F)
  /-- The anti-involution `*`. -/
  invol : B ≃ₐ[ℚ_[p]] Bᵐᵒᵖ
  invol_invol : ∀ b, (invol (invol b).unop).unop = b
  not_typeD : involutionType B invol ≠ PELType.D
  /-- The `*`-stable maximal order `O_B`. -/
  OB : Subring B
  OB_maximal : ∀ b, b ∈ OB ↔ ∀ i r c, decomposition b i r c ∈ (fieldFactor i).integers
  OB_stable : ∀ b ∈ OB, (invol b).unop ∈ OB
  /-- `dim_{ℚ_p} V`. -/
  dimV : ℕ
  /-- The action of `B` on `V = ℚ_p^{dimV}`. -/
  act : B →ₐ[ℚ_[p]] Module.End ℚ_[p] (Fin dimV → ℚ_[p])
  /-- The alternating form. -/
  form : LinearMap.BilinForm ℚ_[p] (Fin dimV → ℚ_[p])
  form_alt : ∀ v, form v v = 0
  form_nondegenerate : ∀ v, (∀ w, form v w = 0) → v = 0
  form_adj : ∀ (b : B) (v w : Fin dimV → ℚ_[p]), form (act b v) w = form v (act (invol b).unop w)
  /-- The self-dual `O_B`-stable lattice `Λ`. -/
  Λ : Submodule ℤ_[p] (Fin dimV → ℚ_[p])
  Λ_finite : Module.Finite ℤ_[p] Λ
  Λ_full : Submodule.span ℚ_[p] (Λ : Set (Fin dimV → ℚ_[p])) = ⊤
  Λ_stable : ∀ b ∈ OB, ∀ v ∈ Λ, act b v ∈ Λ
  Λ_selfDual : ∀ y, y ∈ Λ ↔ ∀ x ∈ Λ, ∃ z : ℤ_[p], form x y = z
  /-- The projector onto the weight-one summand `V₁` of `μ`. -/
  hodgeProj : Module.End (AlgebraicClosure ℚ_[p]) (Fin dimV → AlgebraicClosure ℚ_[p])
  hodgeProj_idem : hodgeProj * hodgeProj = hodgeProj
  hodgeProj_Blinear : ∀ b v,
    hodgeProj (localPELActBar act b v) = localPELActBar act b (hodgeProj v)
  hodgeProj_isotropic : ∀ v w, localPELFormBar form (hodgeProj v) (hodgeProj w) = 0
  hodgeComplement_isotropic : ∀ v w,
    localPELFormBar form (v - hodgeProj v) (w - hodgeProj w) = 0
  hodge_similitude : ∀ (t : (AlgebraicClosure ℚ_[p])ˣ) v w,
    localPELFormBar form ((v - hodgeProj v) + (t : AlgebraicClosure ℚ_[p]) • hodgeProj v)
      ((w - hodgeProj w) + (t : AlgebraicClosure ℚ_[p]) • hodgeProj w) =
        (t : AlgebraicClosure ℚ_[p]) * localPELFormBar form v w

attribute [instance] LocalPELDatum.ring LocalPELDatum.algebra LocalPELDatum.finiteDimensional
  LocalPELDatum.semisimple

namespace LocalPELDatum

variable {p : ℕ} [Fact p.Prime]

/-- `B(G, μ⁻¹)` of the local datum (owner: BunGAndNewtonStrata BG1). -/
def KottwitzSet (𝒟 : LocalPELDatum p) : Type := sorry

/-- The basic class. -/
def basic (𝒟 : LocalPELDatum p) : 𝒟.KottwitzSet := sorry

/-- `⟨2ρ, ν_b⟩` (owner: BunGAndNewtonStrata BG1). -/
def dimLeaf {𝒟 : LocalPELDatum p} (b : 𝒟.KottwitzSet) : ℕ := sorry

/-- `⟨2ρ, μ⟩`. -/
def dimMu (𝒟 : LocalPELDatum p) : ℕ := sorry

/-- (IG.0/unramified-local-pel-datum) The reductive model `G_{ℤ_p}`, by its points. -/
def reductiveModel (𝒟 : LocalPELDatum p) (R : Type) [CommRing R] [Algebra ℤ_[p] R] : Type :=
  sorry

instance (𝒟 : LocalPELDatum p) (R : Type) [CommRing R] [Algebra ℤ_[p] R] :
    Group (𝒟.reductiveModel R) := sorry

/-- Rational framing objects: p-divisible groups with rational `B`-action on the
universal cover and symmetric quasi-polarization compatible with `*`. No integral
principal polarization is inferred from the isocrystal. -/
def PDivB (𝒟 : LocalPELDatum p) (S : Scheme.{u}) : Type (u + 1) := sorry

/-- The underlying p-divisible group. -/
def PDivB.toPDivGroup {𝒟 : LocalPELDatum p} {S : Scheme.{u}} (X : 𝒟.PDivB S) : PDivGroup p S :=
  sorry

/-- `B`-linear quasi-isogenies respecting the polarizations up to `ℚ_p^×`. -/
def PDivB.QIsog {𝒟 : LocalPELDatum p} {S : Scheme.{u}} (X Y : 𝒟.PDivB S) : Type u := sorry

/-- Integral PEL objects: integral `O_B`-action, determinant condition and principal
polarization. The underlying rational object is accessed only by `forget`. -/
def IntegralPDivB (𝒟 : LocalPELDatum p) (S : Scheme.{u}) : Type (u + 1) := sorry

def IntegralPDivB.forget {𝒟 : LocalPELDatum p} {S : Scheme.{u}} :
    𝒟.IntegralPDivB S → 𝒟.PDivB S := sorry

/-- (IG.0/unramified-local-pel-datum) The p-divisible group `X_b` over an algebraically closed
`k ⊃ 𝔽_p` attached to `b ∈ B(G, μ⁻¹)`. -/
def pdivOfB (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k]
    [CharP k p] : 𝒟.PDivB (pt k) := sorry

/-- The isocrystal `(V ⊗ K(p, k), b σ)`. -/
def isocrystalOfB (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] : Type u := sorry

instance (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] : AddCommGroup (𝒟.isocrystalOfB b k) := sorry

instance (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] : WittVector.Isocrystal p k (𝒟.isocrystalOfB b k) := sorry

/-- Rational isocrystal isomorphisms respecting the B-action and the pairing.
Owner: R07.2/PELModuli. An underlying Witt isocrystal equivalence alone is insufficient. -/
def PDivB.IsocrystalEquivOfB {𝒟 : LocalPELDatum p} {k : Type u} [Field k] [CharP k p]
    (Y : 𝒟.PDivB (pt k)) (b : 𝒟.KottwitzSet) : Type u := sorry

/-- (IG.0/unramified-local-pel-datum) The rational covariant Dieudonné module of `X_b` is
`(V ⊗ L, bσ)` (slopes in `[−1, 0]` in this normalization). -/
theorem pdivOfB_isocrystal (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] [PerfectRing k p] :
    Nonempty (PDivB.IsocrystalEquivOfB (𝒟.pdivOfB b k) b) := sorry

/-- (IG.0/unramified-local-pel-datum) `X_b` is unique up to quasi-isogeny with extra structures. -/
theorem pdivOfB_unique (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] [PerfectRing k p] (Y : 𝒟.PDivB (pt k))
    (hY : Nonempty (PDivB.IsocrystalEquivOfB Y b)) :
    Nonempty (PDivB.QIsog Y (𝒟.pdivOfB b k)) := sorry

/-- (IG.0/unramified-local-pel-datum) The local datum of the quasi-split unitary datum at a prime
`p ∤ Δ_F` (hyperspecial level). -/
def ofGlobal (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) : LocalPELDatum p := sorry

/-- The identification `B(G_{ℚ_p}, μ⁻¹)` of the global datum with that of its local datum. -/
def ofGlobalKottwitz (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) :
    TauCeti.Igusa.KottwitzSet D p ≃ (ofGlobal D p hp).KottwitzSet := sorry

/-- (IG.0/unramified-local-pel-datum) `J_b(ℚ_p)`: self-quasi-isogenies of `X_b` with extra
structures. -/
def J (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) : Type := sorry

instance (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) : Group (𝒟.J b) := sorry
instance (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) : TopologicalSpace (𝒟.J b) := sorry

end LocalPELDatum

/-- Every prime of `F⁺` above `p` splits in `F` (no prime of `F` above `p` is conjugation-stable). -/
def IG0SplitInF (D : UnitarySimilitudeDatum) (p : ℕ) : Prop :=
  ∀ P : Ideal (𝓞 D.F), P.IsPrime → (p : 𝓞 D.F) ∈ P →
    P.map (NumberField.IsCMField.ringOfIntegersComplexConj D.F) ≠ P

-- test: LocalPELDatum.pdivOfB_ordinary — unitary datum, p split, b ordinary: X_b ≅ (μ ⊕ ℚ_p/ℤ_p) ⊗ O_F^n ⊗ ℤ_p
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) (hsplit : IG0SplitInF D p) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    Nonempty (((LocalPELDatum.ofGlobal D p hp).pdivOfB
        (LocalPELDatum.ofGlobalKottwitz D p hp (KottwitzSet.ordinary D p)) k).toPDivGroup ≅
      (PDivGroup.sum (PDivGroup.mu p (pt k)) (PDivGroup.etaleUnit p (pt k))).tensorFree
        (Module.finrank ℚ D.F * D.n)) := sorry

-- test: LocalPELDatum.pdivOfB_basic_isoclinic — quasi-split unitary datum, b basic: X_b isoclinic of slope 1/2
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    ∀ s ∈ ((LocalPELDatum.ofGlobal D p hp).pdivOfB
        (LocalPELDatum.ofGlobalKottwitz D p hp (KottwitzSet.basic D p)) k).toPDivGroup.newtonPolygon,
      s = 1 / 2 := sorry

-- test: LocalPELDatum.typeD_excluded — orthogonal (type D) data are not local PEL data
example (p : ℕ) [Fact p.Prime] (𝒟 : LocalPELDatum p) :
    involutionType 𝒟.B 𝒟.invol ≠ PELType.D := sorry

-- test: LocalPELDatum.J_compat — J_b(ℚ_p) of the local datum is the J_b of BunGAndNewtonStrata BG0
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) (b : KottwitzSet D p) :
    Nonempty ((LocalPELDatum.ofGlobal D p hp).J (LocalPELDatum.ofGlobalKottwitz D p hp b) ≃*
      JGroup b) := sorry

/-! ### `IG.0/newton-map` -/

/-- A geometric point `Spec κ(x)^alg → X` over a point `x`. -/
def IG0geomPoint (X : Scheme.{u}) (x : X) : pt (AlgebraicClosure (X.residueField x)) ⟶ X :=
  Spec.map (CommRingCat.ofHom (algebraMap (X.residueField x)
    (AlgebraicClosure (X.residueField x)))) ≫ X.fromSpecResidueField x

/-- The class `[b] ∈ B(G_{ℚ_p}, μ⁻¹)` of a p-divisible group with `G`-structure over an
algebraically closed field (Rapoport–Richartz). -/
def PDivGStructure.newtonClass {D : UnitarySimilitudeDatum} {p : ℕ} {K : Type u} [Field K]
    [IsAlgClosed K] (X : PDivGStructure D p (pt K)) : KottwitzSet D p := sorry

/-- The fibre `A[p^∞]_x̄` of the universal p-divisible group at a geometric point over `x`. -/
def SpecialFibre.geomFibre (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (x : SpecialFibre D p k N) :
    PDivGStructure D p (pt (AlgebraicClosure ((SpecialFibre D p k N).residueField x))) :=
  (PDivGStructure.baseChange D p (IG0geomPoint _ x)).obj (SpecialFibre.universal D p k N)

/-- (IG.0/newton-map) The Newton point `x ↦ [b_x] ∈ B(G_{ℚ_p}, μ⁻¹)`. -/
def newtonPoint (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (x : SpecialFibre D p k N) : KottwitzSet D p :=
  (SpecialFibre.geomFibre D p k N x).newtonClass

/-- (IG.0/newton-map) The Newton stratum `S^b = {x : [b_x] = b}` as a subset. -/
def newtonStratum (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (b : KottwitzSet D p) : Set (SpecialFibre D p k N) :=
  {x | newtonPoint D p k N x = b}

/-- The prime-to-`p` Hecke correspondences on the special fibre. -/
def SpecialFibre.hecke (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (g : GAfp D p) : SchemeCorrespondence (SpecialFibre D p k N) := sorry

section NewtonMap

variable (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
  [IsAlgClosed k] [CharP k p] (N : ℕ)

/-- (IG.0/newton-map) `S = ⊔_b S^b`, each `S^b` locally closed, realised by the reduced
subscheme `NewtonStratum` of the prelude. -/
theorem newtonStratum_disjoint_union (hN : 3 ≤ N)
    (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) :
    (⋃ b, newtonStratum D p k N b) = Set.univ ∧
      Pairwise (Function.onFun Disjoint (newtonStratum D p k N)) ∧
      ∀ b, IsLocallyClosed (newtonStratum D p k N b) ∧
        Set.range (NewtonStratum.ι D p k N b).base = newtonStratum D p k N b ∧
        IsReduced (NewtonStratum D p k N b) := sorry

/-- (IG.0/newton-map) Grothendieck specialization: `closure S^b ⊆ ⋃_{b′ ≤ b} S^{b′}`. -/
theorem closure_newtonStratum_subset (hN : 3 ≤ N)
    (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) (b : KottwitzSet D p) :
    closure (newtonStratum D p k N b) ⊆ ⋃ b' ≤ b, newtonStratum D p k N b' := sorry

/-- (IG.0/newton-map) The Newton point is constant along prime-to-`p` Hecke correspondences. -/
theorem newtonPoint_hecke (g : GAfp D p) (z : (SpecialFibre.hecke D p k N g).src) :
    newtonPoint D p k N ((SpecialFibre.hecke D p k N g).left.base z) =
      newtonPoint D p k N ((SpecialFibre.hecke D p k N g).right.base z) := sorry

end NewtonMap

/-- (IG.0/newton-map) The Newton point depends only on the quasi-isogeny class with `G`-structure. -/
theorem newtonPoint_isogeny {D : UnitarySimilitudeDatum} {p : ℕ} {K : Type u} [Field K]
    [IsAlgClosed K] (X Y : PDivGStructure D p (pt K)) (f : PDivGStructure.QIsog X Y) :
    X.newtonClass = Y.newtonClass := sorry

-- test: newtonStratum_ordinary_open — p split in F: the ordinary stratum is open and dense
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N)
    (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) (hsplit : IG0SplitInF D p) :
    IsOpen (newtonStratum D p k N (KottwitzSet.ordinary D p)) ∧
      Dense (newtonStratum D p k N (KottwitzSet.ordinary D p)) := sorry

-- test: newtonStratum_modularCurve — F imaginary quadratic, n = 1, p split: two strata, the basic one finite
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N)
    (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) (hsplit : IG0SplitInF D p)
    (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1) :
    Fintype.card (KottwitzSet D p) = 2 ∧ KottwitzSet.ordinary D p ≠ KottwitzSet.basic D p ∧
      (newtonStratum D p k N (KottwitzSet.basic D p)).Finite := sorry

-- test: newtonPoint_not_isoClass — quasi-isogenous but non-isomorphic groups exist (n ≥ 2) and share their Newton point
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F)
    (hn : 2 ≤ D.n) (K : Type u) [Field K] [IsAlgClosed K] [CharP K p] :
    ∃ X Y : PDivGStructure D p (pt K), Nonempty (PDivGStructure.QIsog X Y) ∧ IsEmpty (X ≅ Y) ∧
      X.newtonClass = Y.newtonClass := sorry

-- test: newtonPoint_compat_BG — the Newton point is the B(G)-class (BG0) of the isocrystal of A_x̄[p^∞]
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (x : SpecialFibre D p k N) :
    KottwitzSet.toBG (newtonPoint D p k N x) = (SpecialFibre.geomFibre D p k N x).isocrystalClass :=
  sorry

/-! ### `IG.0/splitting-symplectic-filtrations` -/

/-- Isomorphisms of the biconnected parts `X^{(0,1)}` respecting `O_F`-actions and polarizations. -/
def PDivGStructure.Part01Iso {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    (X Y : PDivGStructure D p (pt k)) : Type u := sorry

/-- The rank of the `τ`-part of `T_p(X^{ét})` over `O_F ⊗ ℤ_p`. -/
def PDivGStructure.etaleRank {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    (X : PDivGStructure D p (pt k)) (τ : 𝓞 D.F →+* k) : ℕ := sorry

/-- (IG.0/splitting-symplectic-filtrations) Over algebraically closed `k`,
`X ≅ X^μ ⊕ X^{(0,1)} ⊕ X^{ét}` with `X^μ` multiplicative, `X^{ét}` étale and `X^{(0,1)}` of slopes
in `(0, 1)`; `X` is determined by `X^{(0,1)}` (with `O_F`, `λ`) and the ranks of `T_p X^{ét}`. (The
general split of `Z₋₂ ⊂ Z₋₁ ⊂ X` needs quotients of p-divisible groups, not available here.) -/
theorem splittingSymplecticFiltrations {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGStructure D p (pt k)) :
    (∃ Xμ X01 Xet : PDivGroup p (pt k),
      Nonempty (X.pdiv ≅ PDivGroup.sum Xμ (PDivGroup.sum X01 Xet)) ∧
      Xμ.cartierDual.dim = 0 ∧ Xet.dim = 0 ∧
      ∀ s ∈ X01.newtonPolygon, 0 < s ∧ s < 1) ∧
    ∀ Y : PDivGStructure D p (pt k), Nonempty (PDivGStructure.Part01Iso X Y) →
      (∀ τ, X.etaleRank τ = Y.etaleRank τ) → Nonempty (X ≅ Y) := sorry

/-! ### `IG.0/internal-hom-p-divisible-group` -/

/-- A p-divisible group over a field is isoclinic if its Newton polygon has a single slope. -/
def PDivGroup.IsIsoclinic {p : ℕ} {K : Type u} [Field K] (X : PDivGroup p (pt K)) : Prop :=
  ∃ s : ℚ, ∀ x ∈ X.newtonPolygon, x = s

/-- The fpqc sheaf `R ↦ Hom_R(G_R, G′_R)` on `k`-algebras (owner: R07.1). -/
def PDivGroup.homFunctor {p : ℕ} {k : Type u} [Field k] (G G' : PDivGroup p (pt k)) :
    Under (CommRingCat.of k) ⥤ Type u := sorry

/-- The Tate module sheaf `R ↦ T_p X(R) = lim X[p^n](R)` (owner: R07.1). -/
def PDivGroup.tateFunctor {p : ℕ} {k : Type u} [Field k] (X : PDivGroup p (pt k)) :
    Under (CommRingCat.of k) ⥤ Type u := sorry

namespace InternalHom

variable {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p] [PerfectRing k p]

/-- (IG.0/internal-hom-p-divisible-group) The internal Hom p-divisible group `H_{G,G′}` of
isoclinic `G, G′` over a perfect field. -/
def pdiv (G G' : PDivGroup p (pt k)) (hG : G.IsIsoclinic) (hG' : G'.IsIsoclinic) :
    PDivGroup p (pt k) := sorry

/-- The naive Hom scheme `H_n = 𝓗om(G[p^n], G′[p^n])`. -/
def naiveHom (G G' : PDivGroup p (pt k)) (n : ℕ) : Over (pt k) := sorry

/-- The stable image `H′_n ⊂ H_n` of `H_m → H_n`, `m ≫ 0`. -/
def stableImage (G G' : PDivGroup p (pt k)) (n : ℕ) : Over (pt k) := sorry

/-- The closed immersion `H′_n ↪ H_n`. -/
def stableImageι (G G' : PDivGroup p (pt k)) (n : ℕ) : stableImage G G' n ⟶ naiveHom G G' n :=
  sorry

/-- (IG.0/internal-hom-p-divisible-group) `H_{G,G′}[p^n] = H′_n`. -/
theorem torsion_eq (G G' : PDivGroup p (pt k)) (hG : G.IsIsoclinic) (hG' : G'.IsIsoclinic)
    (n : ℕ) : Nonempty ((pdiv G G' hG hG').torsion n ≅ stableImage G G' n) ∧
      IsClosedImmersion (stableImageι G G' n).left := sorry

/-- (IG.0/internal-hom-p-divisible-group) `T_p H_{G,G′} ≅ 𝓗om(G, G′)` as fpqc sheaves. -/
def tateModule (G G' : PDivGroup p (pt k)) (hG : G.IsIsoclinic) (hG' : G'.IsIsoclinic) :
    (pdiv G G' hG hG').tateFunctor ≅ PDivGroup.homFunctor G G' := sorry

/-- (IG.0/internal-hom-p-divisible-group) Functoriality: contravariant in `G`, covariant in `G′`. -/
def map {G₁ G₂ G₁' G₂' : PDivGroup p (pt k)} (h₁ : G₁.IsIsoclinic) (h₂ : G₂.IsIsoclinic)
    (h₁' : G₁'.IsIsoclinic) (h₂' : G₂'.IsIsoclinic) (f : G₂ ⟶ G₁) (g : G₁' ⟶ G₂') :
    pdiv G₁ G₁' h₁ h₁' ⟶ pdiv G₂ G₂' h₂ h₂' := sorry

/-- (IG.0/internal-hom-p-divisible-group) The `O`-linear variant for an action of the ring of
integers `O` of an unramified extension of `ℚ_p`. -/
def ofLinear (O : Type) [CommRing O] (G G' : PDivGroup p (pt k)) (hG : G.IsIsoclinic)
    (hG' : G'.IsIsoclinic) (ιG : O →* End G) (ιG' : O →* End G') : PDivGroup p (pt k) := sorry

end InternalHom

-- test: InternalHom.etale_mu — H_{μ, μ} ≅ ℚ_p/ℤ_p
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (h : (PDivGroup.mu p (pt k)).IsIsoclinic) :
    Nonempty (InternalHom.pdiv _ _ h h ≅ PDivGroup.etaleUnit p (pt k)) := sorry

-- test: InternalHom.zero_of_slope_gt — H_{μ, ℚ_p/ℤ_p} = 0
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (h : (PDivGroup.mu p (pt k)).IsIsoclinic) (h' : (PDivGroup.etaleUnit p (pt k)).IsIsoclinic) :
    (InternalHom.pdiv _ _ h h').height = 0 := sorry

-- test: InternalHom.connected — H_{ℚ_p/ℤ_p, μ} ≅ μ, of dimension 1
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (h : (PDivGroup.mu p (pt k)).IsIsoclinic) (h' : (PDivGroup.etaleUnit p (pt k)).IsIsoclinic) :
    Nonempty (InternalHom.pdiv _ _ h' h ≅ PDivGroup.mu p (pt k)) ∧
      (InternalHom.pdiv _ _ h' h).dim = 1 := sorry

-- test: InternalHom.not_naive_hom — H′_n can be a proper subgroup of 𝓗om(G[p^n], G′[p^n])
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]
    [PerfectRing k p] :
    ∃ (G G' : PDivGroup p (pt k)) (_ : G.IsIsoclinic) (_ : G'.IsIsoclinic) (n : ℕ),
      ¬ IsIso (InternalHom.stableImageι G G' n) := sorry

/-! ### `IG.0/internal-hom-dieudonne-module` -/

/-- The slope `≤ 0` part `Hom(V, W)^{≤ 0}` of the internal Hom isocrystal (owner of internal Homs
of isocrystals: R07.1). -/
def IG0IsocrystalHomNonpos (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (V W : Type u) [AddCommGroup V] [AddCommGroup W]
    [WittVector.Isocrystal p k V] [WittVector.Isocrystal p k W] : Type u := sorry

instance (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (V W : Type u) [AddCommGroup V] [AddCommGroup W] [WittVector.Isocrystal p k V]
    [WittVector.Isocrystal p k W] : AddCommGroup (IG0IsocrystalHomNonpos p k V W) := sorry

instance (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (V W : Type u) [AddCommGroup V] [AddCommGroup W] [WittVector.Isocrystal p k V]
    [WittVector.Isocrystal p k W] : WittVector.Isocrystal p k (IG0IsocrystalHomNonpos p k V W) :=
  sorry

/-- (IG.0/internal-hom-dieudonne-module) `T_p H_{G,G′} = 𝓗om(G, G′)` and
`D(H_{G,G′})[1/p] = Hom(D(G)[1/p], D(G′)[1/p])^{≤0}`. -/
theorem internalHomDieudonneModule {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p]
    [PerfectRing k p] (G G' : PDivGroup p (pt k)) (hG : G.IsIsoclinic) (hG' : G'.IsIsoclinic) :
    Nonempty ((InternalHom.pdiv G G' hG hG').tateFunctor ≅ PDivGroup.homFunctor G G') ∧
      Nonempty (WittVector.IsocrystalEquiv p k (InternalHom.pdiv G G' hG hG').rationalDieudonne
        (IG0IsocrystalHomNonpos p k G.rationalDieudonne G'.rationalDieudonne)) := sorry

/-! ### `IG.0/internal-hom-slopes` -/

/-- `k[[x₁^{1/p^∞}, …, x_r^{1/p^∞}]]/(x₁, …, x_r)` as a `k`-algebra. -/
def IG0PerfPowerSeriesQuot (p : ℕ) (k : Type u) [Field k] (r : ℕ) : Under (CommRingCat.of k) :=
  sorry

/-- (IG.0/internal-hom-slopes) Slopes of `H_{G,G′}`: zero if `slope G > slope G′`, étale if equal,
connected if `slope G < slope G′`, and then `𝓗om(G, G′)` is represented by
`Spec k[[x^{1/p^∞}]]/(x)` in `dim H_{G,G′}` variables. -/
theorem internalHomSlopes {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [CharP k p]
    [PerfectRing k p] (G G' : PDivGroup p (pt k)) (s s' : ℚ) (hs : ∀ x ∈ G.newtonPolygon, x = s)
    (hs' : ∀ x ∈ G'.newtonPolygon, x = s') :
    (s' < s → (InternalHom.pdiv G G' ⟨s, hs⟩ ⟨s', hs'⟩).height = 0) ∧
      (s = s' → (InternalHom.pdiv G G' ⟨s, hs⟩ ⟨s', hs'⟩).dim = 0) ∧
      (s < s' → (0 : ℚ) ∉ (InternalHom.pdiv G G' ⟨s, hs⟩ ⟨s', hs'⟩).newtonPolygon ∧
        Nonempty (PDivGroup.homFunctor G G' ≅ coyoneda.obj (Opposite.op
          (IG0PerfPowerSeriesQuot p k (InternalHom.pdiv G G' ⟨s, hs⟩ ⟨s', hs'⟩).dim)))) := sorry


/-! ### `IG.0/completely-slope-divisible` -/

/-- The base change of a p-divisible group to geometric points has constant Newton polygon. -/
def PDivGroup.HasConstantNewtonPolygon {p : ℕ} {T : Scheme.{u}} (X : PDivGroup p T) : Prop :=
  ∀ x y : T, ((PDivGroup.baseChange (IG0geomPoint T x)).obj X).newtonPolygon =
    ((PDivGroup.baseChange (IG0geomPoint T y)).obj X).newtonPolygon

/-- Finite direct sums of p-divisible groups. -/
def PDivGroup.finSum {p : ℕ} {S : Scheme.{u}} {r : ℕ} (G : Fin r → PDivGroup p S) :
    PDivGroup p S := sorry

/-- The map on finite torsion group schemes (owner: R07.1). -/
def PDivGroup.torsionMap {p : ℕ} {T : Scheme.{u}} {A B : PDivGroup p T}
    (f : A ⟶ B) (m : ℕ) : A.torsion m ⟶ B.torsion m := sorry

/-- Quotient by a sub-p-divisible group (owner: R07.1; requested exactness interface).
Closed immersion on each finite torsion level expresses an actual subgroup; categorical
monicity alone also admits multiplication by p and is insufficient. -/
def PDivGroup.quotient {p : ℕ} {T : Scheme.{u}} {A B : PDivGroup p T}
    (f : A ⟶ B) (hf : ∀ m, IsClosedImmersion (PDivGroup.torsionMap f m).left) :
    PDivGroup p T := sorry

/-- The canonical quotient map. -/
def PDivGroup.quotientπ {p : ℕ} {T : Scheme.{u}} {A B : PDivGroup p T}
    (f : A ⟶ B) (hf : ∀ m, IsClosedImmersion (PDivGroup.torsionMap f m).left) :
    B ⟶ PDivGroup.quotient f hf := sorry

/-- A slope filtration witnessing complete slope divisibility: slopes `λ₁ > ⋯ > λ_r ≥ 0`
(`λ_i = num/den`), a chain `0 = 𝒢₀ ⊂ ⋯ ⊂ 𝒢_r = 𝒢` of monomorphisms with `p^{-num} Frob^{den}` an
isogeny on `𝒢_i` and an isomorphism on the graded piece `𝒢_i/𝒢_{i−1}`. -/
structure SlopeFiltration {p : ℕ} {T : Scheme.{u}} (X : PDivGroup p T) where
  /-- Number of slopes. -/
  r : ℕ
  /-- Numerators of the slopes. -/
  num : Fin r → ℕ
  /-- Denominators of the slopes. -/
  den : Fin r → ℕ
  den_pos : ∀ i, 0 < den i
  strictAnti : StrictAnti fun i => (num i : ℚ) / den i
  /-- The filtration `𝒢_i`. -/
  piece : Fin (r + 1) → PDivGroup p T
  piece_zero : (piece 0).height = 0
  /-- The inclusions `𝒢_{i−1} ⊂ 𝒢_i`. -/
  incl : ∀ i : Fin r, piece i.castSucc ⟶ piece i.succ
  incl_mono : ∀ i, Mono (incl i)
  incl_closed : ∀ i m, IsClosedImmersion (PDivGroup.torsionMap (incl i) m).left
  /-- `𝒢_r = 𝒢`. -/
  top : piece (Fin.last r) ≅ X
  /-- The graded pieces `𝒢_i/𝒢_{i−1}`. -/
  graded : Fin r → PDivGroup p T
  graded_pos : ∀ i, 0 < (graded i).height
  gradedIso : ∀ i, PDivGroup.quotient (incl i) (incl_closed i) ≅ graded i
  /-- The quotient maps `𝒢_i → 𝒢_i/𝒢_{i−1}`. -/
  quot : ∀ i : Fin r, piece i.succ ⟶ graded i
  quot_epi : ∀ i, Epi (quot i)
  quot_eq : ∀ i, quot i = PDivGroup.quotientπ (incl i) (incl_closed i) ≫ (gradedIso i).hom
  /-- `p^{-λ_i num} Frob^{den}` is an isogeny of `𝒢_i`. -/
  slopeDivisible : ∀ i : Fin r, ((piece i.succ).slopeQIsog (num i) (den i)).IsogenyLift
  /-- … and an isomorphism of the graded piece. -/
  gradedIsoclinic : ∀ i : Fin r, ((graded i).slopeQIsog (num i) (den i)).IsoLift

/-- (IG.0/completely-slope-divisible) A p-divisible group is completely slope divisible if it
admits a slope filtration. -/
def IsCompletelySlopeDivisible {p : ℕ} {T : Scheme.{u}} (X : PDivGroup p T) : Prop :=
  Nonempty (SlopeFiltration X)

namespace IsCompletelySlopeDivisible

variable {p : ℕ} [Fact p.Prime]

/-- (IG.0/completely-slope-divisible) The slope filtration. -/
def slopeFiltration {T : Scheme.{u}} {X : PDivGroup p T} (h : IsCompletelySlopeDivisible X) :
    SlopeFiltration X := h.some

/-- The slope filtration is unique: any two have the same slopes and isomorphic pieces. -/
theorem slopeFiltration_unique {T : Scheme.{u}} {X : PDivGroup p T} (F F' : SlopeFiltration X) :
    ∃ e : F.r = F'.r, (∀ i, (F.num i : ℚ) / F.den i = (F'.num (Fin.cast e i) : ℚ) / F'.den (Fin.cast e i)) ∧
      ∀ i, Nonempty (F.piece i ≅ F'.piece (Fin.cast (by rw [e]) i)) := sorry

/-- (IG.0/completely-slope-divisible) Stability under base change. -/
theorem baseChange {T T' : Scheme.{u}} (f : T' ⟶ T) {X : PDivGroup p T}
    (h : IsCompletelySlopeDivisible X) :
    IsCompletelySlopeDivisible ((PDivGroup.baseChange f).obj X) := sorry

/-- (IG.0/completely-slope-divisible) Over a connected regular (hence integral) base with
constant Newton polygon, complete slope divisibility at the geometric generic point implies it everywhere (Zink; CSnc E12). -/
theorem of_generic {T : Scheme.{u}} [IsIntegral T] [∀ x : T, CharP (T.presheaf.stalk x) p]
    (hreg : ∀ x : T, IsRegularLocalRing (T.presheaf.stalk x)) (X : PDivGroup p T)
    (hNP : X.HasConstantNewtonPolygon)
    (h : IsCompletelySlopeDivisible
      ((PDivGroup.baseChange (IG0geomPoint T (genericPoint T))).obj X)) :
    IsCompletelySlopeDivisible X := sorry

/-- (IG.0/completely-slope-divisible) Over a perfect base the slope filtration splits
(Oort–Zink Proposition 1.3). -/
theorem split_of_perfect (R : Type u) [CommRing R] [CharP R p] [PerfectRing R p]
    {X : PDivGroup p (Spec (CommRingCat.of R))} (F : SlopeFiltration X) :
    Nonempty (X ≅ PDivGroup.finSum F.graded) := sorry

end IsCompletelySlopeDivisible

-- test: IsCompletelySlopeDivisible.mu — μ ⊕ ℚ_p/ℤ_p is completely slope divisible with slopes 1 > 0
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    ∃ F : SlopeFiltration (PDivGroup.sum (PDivGroup.mu p (pt k)) (PDivGroup.etaleUnit p (pt k))),
      F.r = 2 ∧ ∀ i, (F.num i : ℚ) / F.den i = if (i : ℕ) = 0 then 1 else 0 := sorry

-- test: IsCompletelySlopeDivisible.isoclinic — nonzero isoclinic slope divisible ⇒ r = 1
example (p : ℕ) [Fact p.Prime] {T : Scheme.{u}} (X : PDivGroup p T) (a s : ℕ) (hs : 0 < s)
    (h : (X.slopeQIsog a s).IsoLift) (hheight : 0 < X.height) :
    ∃ F : SlopeFiltration X, F.r = 1 := sorry

-- test: IsCompletelySlopeDivisible.not_all — some p-divisible group (e.g. with non-constant Newton polygon) is not completely slope divisible
example (p : ℕ) [Fact p.Prime] :
    ∃ (T : Scheme.{u}) (X : PDivGroup p T), ¬ IsCompletelySlopeDivisible X := sorry

-- test: IsCompletelySlopeDivisible.etale_connected — slopes {1, 0}: the filtration is the multiplicative–étale one
example (p : ℕ) [Fact p.Prime] {T : Scheme.{u}} (X : PDivGroup p T) (F : SlopeFiltration X)
    (hr : F.r = 2) (h0 : (F.num ⟨0, by omega⟩ : ℚ) / F.den ⟨0, by omega⟩ = 1)
    (h1 : (F.num ⟨1, by omega⟩ : ℚ) / F.den ⟨1, by omega⟩ = 0) :
    (F.graded ⟨0, by omega⟩).cartierDual.dim = 0 ∧ (F.graded ⟨1, by omega⟩).dim = 0 := sorry

/-! ### `IG.0/slope-filtration-existence` -/

/-- Requested R07.2 adapter: an integral principal-polarized, completely slope divisible
representative of a rational PEL class. This type records the exact existence obligation;
it is not populated by the rational construction `pdivOfB`. Source: CS17 §4.3.1 and
Koshikawa §6; the generic integral G-structure theorem is requested from R07.2. -/
structure LocalPELDatum.IntegralSlopeRepresentative {p : ℕ} [Fact p.Prime]
    (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k]
    [CharP k p] where
  integral : 𝒟.IntegralPDivB (pt k)
  framing : LocalPELDatum.PDivB.QIsog integral.forget (𝒟.pdivOfB b k)
  slopeDivisible : IsCompletelySlopeDivisible integral.forget.toPDivGroup

/-- (IG.0/slope-filtration-existence) Oort–Zink: (1) over algebraically closed `k` every p-divisible
group is isogenous to a completely slope divisible one; (2) over perfect bases the slope filtration
splits; (3) over a valuation ring with constant Newton polygon, complete slope divisibility of the
generic fibre propagates; (4) Zink's regular-base criterion. -/
theorem slopeFiltrationExistence (p : ℕ) [Fact p.Prime] :
    (∀ (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGroup p (pt k)),
      ∃ Y : PDivGroup p (pt k), IsCompletelySlopeDivisible Y ∧
        Nonempty (PDivGroup.Isogeny X Y)) ∧
    (∀ (R : Type u) [CommRing R] [CharP R p] [PerfectRing R p]
      (X : PDivGroup p (Spec (CommRingCat.of R))) (F : SlopeFiltration X),
        Nonempty (X ≅ PDivGroup.finSum F.graded)) ∧
    (∀ (V : Type u) [CommRing V] [IsDomain V] [ValuationRing V] [CharP V p]
      (X : PDivGroup p (Spec (CommRingCat.of V))), X.HasConstantNewtonPolygon →
      IsCompletelySlopeDivisible ((PDivGroup.baseChange (Spec.map (CommRingCat.ofHom
        (algebraMap V (FractionRing V))))).obj X) →
      IsCompletelySlopeDivisible X) ∧
    (∀ (T : Scheme.{u}) [IsIntegral T] [∀ x : T, CharP (T.presheaf.stalk x) p],
      (∀ x : T, IsRegularLocalRing (T.presheaf.stalk x)) → ∀ X : PDivGroup p T,
      X.HasConstantNewtonPolygon →
      IsCompletelySlopeDivisible ((PDivGroup.baseChange (IG0geomPoint T (genericPoint T))).obj X) →
      IsCompletelySlopeDivisible X) := sorry

/-! ### `IG.0/automorphism-group-of-universal-cover` -/

/-- `Nilp_A`: `A`-algebras in which `p` is nilpotent. -/
abbrev IG0Nilp (p : ℕ) (A : Type u) [CommRing A] : Type (u + 1) :=
  ObjectProperty.FullSubcategory fun R : Under (CommRingCat.of A) => IsNilpotent ((p : ℕ) : R.right)

/-- The residue field `k` as an object of `Nilp_{W(k)}`. -/
def IG0Nilp.residue (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] :
    IG0Nilp p (WittVector p k) :=
  ⟨Under.mk (CommRingCat.ofHom (WittVector.constantCoeff (p := p) (R := k))), sorry⟩

/-- The quotient `R/I` of an object of `Nilp_A`. -/
def IG0Nilp.quot {p : ℕ} {A : Type u} [CommRing A] (R : IG0Nilp p A) (I : Ideal R.obj.right) :
    IG0Nilp p A :=
  ⟨Under.mk (R.obj.hom ≫ CommRingCat.ofHom (Ideal.Quotient.mk I)), sorry⟩

/-- `R ↠ R/I` in `Nilp_A`. -/
def IG0Nilp.toQuot {p : ℕ} {A : Type u} [CommRing A] (R : IG0Nilp p A) (I : Ideal R.obj.right) :
    R ⟶ R.quot I := sorry

/-- `Spf W(R)` for a perfect ring `R`, as a functor on `Nilp_{W(k)}`. -/
def IG0SpfW (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] (R : Type u) [CommRing R] [CharP R p]
    [PerfectRing R p] : IG0Nilp p (WittVector p k) ⥤ Type u := sorry

/-- `Spf W(k)[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]`. -/
def IG0SpfPerfPS (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] (d : ℕ) :
    IG0Nilp p (WittVector p k) ⥤ Type u := sorry

/-- The sheaf `U ↦ C(|Spec|, X)` of locally constant maps to a topological space. -/
def IG0LocConst (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] (X : Type) [TopologicalSpace X] :
    IG0Nilp p (WittVector p k) ⥤ Type u := sorry

/-- (IG.0/automorphism-group-of-universal-cover) The group sheaf `Aut_G(X̃_b)` on
`Nilp_{W(k)}`. -/
def AutUniversalCover {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet)
    (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    IG0Nilp p (WittVector p k) ⥤ GrpCat.{u} := sorry

namespace AutUniversalCover

variable {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
  [IsAlgClosed k] [CharP k p]

/-- (IG.0/automorphism-group-of-universal-cover) Representable: a disjoint union of `Spf W(R_i)`
with `R_i` perfect. -/
theorem representable :
    ∃ (ι : Type u) (R : ι → Type u) (_ : ∀ i, CommRing (R i)) (_ : ∀ i, CharP (R i) p)
      (_ : ∀ i, PerfectRing (R i) p),
      Nonempty (AutUniversalCover 𝒟 b k ⋙ forget GrpCat ≅ ∐ fun i => IG0SpfW p k (R i)) := sorry

/-- (IG.0/automorphism-group-of-universal-cover) `Aut_G(X̃_b)(k) = J_b(ℚ_p)`. -/
theorem points :
    Nonempty (((AutUniversalCover 𝒟 b k).obj (IG0Nilp.residue p k)) ≃* 𝒟.J b) := sorry

/-- (IG.0/automorphism-group-of-universal-cover) Rigidity: bijective on nilpotent thickenings. -/
theorem rigid (R : IG0Nilp p (WittVector p k)) (I : Ideal R.obj.right) (hI : IsNilpotent I) :
    Function.Bijective ((AutUniversalCover 𝒟 b k).map (IG0Nilp.toQuot R I)).hom := sorry

/-- (IG.0/automorphism-group-of-universal-cover) The map `Aut_G(X̃_b) → J_b(ℚ_p)`. -/
def toJ : AutUniversalCover 𝒟 b k ⋙ forget GrpCat ⟶ IG0LocConst p k (𝒟.J b) := sorry

/-- The fibre of `toJ` over `j ∈ J_b(ℚ_p)`. -/
def fibre (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] (j : 𝒟.J b) : IG0Nilp p (WittVector p k) ⥤ Type u := sorry

end AutUniversalCover

-- test: AutUniversalCover.etale_case — X_b isoclinic: Aut_G(X̃_b) = J_b(ℚ_p) (d = 0)
example (p : ℕ) [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (h : (𝒟.pdivOfB b k).toPDivGroup.IsIsoclinic) :
    IsIso (AutUniversalCover.toJ 𝒟 b k) ∧ LocalPELDatum.dimLeaf b = 0 := sorry

-- test: AutUniversalCover.ordinary_GL2 — X_b = μ × ℚ_p/ℤ_p: fibres Spf W[[x^{1/p^∞}]] (d = 1)
example (p : ℕ) [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p]
    (h : Nonempty ((𝒟.pdivOfB b k).toPDivGroup ≅
      PDivGroup.sum (PDivGroup.mu p (pt k)) (PDivGroup.etaleUnit p (pt k)))) :
    ∀ j : 𝒟.J b, Nonempty (AutUniversalCover.fibre 𝒟 b k j ≅ IG0SpfPerfPS p k 1) := sorry

-- test: AutUniversalCover.not_aut_Xb — its k-points J_b(ℚ_p) are not compact, unlike Aut(X_b)(k)
example (p : ℕ) [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) :
    ¬ CompactSpace (𝒟.J b) := sorry

-- test: AutUniversalCover.J_compat — its k-points are the J_b(ℚ_p) of BunGAndNewtonStrata BG0
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) (b : KottwitzSet D p) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] :
    Nonempty (((AutUniversalCover (LocalPELDatum.ofGlobal D p hp)
      (LocalPELDatum.ofGlobalKottwitz D p hp b) k).obj (IG0Nilp.residue p k)) ≃* JGroup b) := sorry

/-! ### `IG.0/structure-of-automorphism-group` -/

/-- (IG.0/structure-of-automorphism-group) Every fibre of `Aut_G(X̃_b) → J_b(ℚ_p)` is
`Spf W(k)[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]` with `d = ⟨2ρ, ν_b⟩`. -/
theorem structureOfAutomorphismGroup {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p)
    (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] (j : 𝒟.J b) :
    Nonempty (AutUniversalCover.fibre 𝒟 b k j ≅ IG0SpfPerfPS p k (LocalPELDatum.dimLeaf b)) := sorry

/-! ### `IG.0/liftable-automorphisms` -/

/-- A torsor `π : P → X` under a (discrete) group `Γ`: `Γ` acts by `X`-automorphisms, `π` is
surjective, and `Γ` acts simply transitively on `T`-points over each `T`-point of `X`, `T`
connected. -/
structure IG0Torsor (Γ : Type u) [Group Γ] {P X : Scheme.{u}} (π : P ⟶ X) where
  /-- The action. -/
  act : Γ →* Aut (Over.mk π)
  surjective : Surjective π
  simplyTransitive : ∀ (T : Scheme.{u}) [ConnectedSpace T] (t₁ t₂ : T ⟶ P), t₁ ≫ π = t₂ ≫ π →
    ∃! γ : Γ, t₁ ≫ (act γ).hom.left = t₂

/-- Seminormal rings (Swan): reduced, and `b³ = c²` forces `b = a², c = a³`. -/
def IG0SeminormalRing (R : Type u) [CommRing R] : Prop :=
  _root_.IsReduced R ∧ ∀ b c : R, b ^ 3 = c ^ 2 → ∃ a, a ^ 2 = b ∧ a ^ 3 = c

/-- Seminormal schemes: all local rings seminormal. -/
def IG0Seminormal (X : Scheme.{u}) : Prop := ∀ x : X, IG0SeminormalRing (X.presheaf.stalk x)

/-- `Γ_m`: automorphisms of `X[p^m]` with extra structures that lift to all `X[p^{m′}]`. -/
def LiftableAut {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    (X : PDivGStructure D p (pt k)) (m : ℕ) : Type u := sorry

instance {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    (X : PDivGStructure D p (pt k)) (m : ℕ) : Group (LiftableAut X m) := sorry

/-- Isomorphisms `𝒢[p^m]_T ≅ X[p^m]_T` with extra structures that lift fppf locally to all
`p^{m′}`-truncations, for `t : T → 𝒳`. -/
def IG0LiftableTruncIso {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    {𝒳 : Scheme.{u}} (𝒢 : PDivGStructure D p 𝒳) (X : PDivGStructure D p (pt k)) (m : ℕ)
    {T : Scheme.{u}} (t : T ⟶ 𝒳) : Type u := sorry

/-- (IG.0/liftable-automorphisms) For isoclinic `X`, `Γ_m` is finite, and over a seminormal
`𝒳` with `𝒢` geometrically isomorphic to `X`, the functor of liftable isomorphisms
`ρ_m : 𝒢[p^m] ≅ X[p^m]` is represented by a finite étale `Γ_m`-torsor `J_m(𝒢/𝒳) → 𝒳`. -/
theorem liftableAutomorphisms {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u}
    [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGStructure D p (pt k))
    (hX : X.pdiv.IsIsoclinic) (m : ℕ) (hm : 1 ≤ m) :
    Finite (LiftableAut X m) ∧
    ∀ (𝒳 : Scheme.{u}) (s : 𝒳 ⟶ pt k), IG0Seminormal 𝒳 → ∀ 𝒢 : PDivGStructure D p 𝒳,
      (∀ x : 𝒳, Nonempty ((PDivGStructure.baseChange D p (IG0geomPoint 𝒳 x)).obj 𝒢 ≅
        (PDivGStructure.baseChange D p (IG0geomPoint 𝒳 x ≫ s)).obj X)) →
      ∃ (J : Scheme.{u}) (π : J ⟶ 𝒳), IsFinite π ∧ Etale π ∧
        Nonempty (IG0Torsor (LiftableAut X m) π) ∧
        ∀ (T : Scheme.{u}) (t : T ⟶ 𝒳),
          Nonempty ({j : T ⟶ J // j ≫ π = t} ≃ IG0LiftableTruncIso 𝒢 X m t) := sorry

/-! ### `IG.0/pel-rapoport-zink-space` -/

/-- Formally smooth functors on `Nilp_A`: surjective on nilpotent thickenings. -/
class IG0FormallySmooth {p : ℕ} {A : Type u} [CommRing A] (F : IG0Nilp p A ⥤ Type u) : Prop where
  surj : ∀ (R : IG0Nilp p A) (I : Ideal R.obj.right), IsNilpotent I →
    Function.Surjective (F.map (IG0Nilp.toQuot R I))

/-- Base change of p-divisible groups with `O_B`-structure. -/
def LocalPELDatum.PDivB.baseChange {p : ℕ} [Fact p.Prime] {𝒟 : LocalPELDatum p}
    {S T : Scheme.{u}} (f : T ⟶ S) (X : 𝒟.PDivB S) : 𝒟.PDivB T := sorry

/-- (IG.0/pel-rapoport-zink-space) The Rapoport–Zink space `𝔐_{D^int}` as a functor on
`Nilp_{W(k)}` (`O_Ĕ = W(k)` for the unramified data used here). -/
def RZSpace {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u)
    [Field k] [IsAlgClosed k] [CharP k p] : IG0Nilp p (WittVector p k) ⥤ Type u := sorry

namespace RZSpace

variable {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
  [IsAlgClosed k] [CharP k p]

/-- Isomorphism classes of pairs `(G, ρ)` over `R ∈ Nilp`. -/
-- The deforming `G` in a pair is an `IntegralPDivB`; the rational framing object
-- is `pdivOfB`. The quasi-isogeny is between their rational objects after reduction.
def Pairs (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] (R : IG0Nilp p (WittVector p k)) : Type u := sorry

/-- (IG.0/pel-rapoport-zink-space) `𝔐(R) = {(G, ρ)}/≅`. -/
theorem represents (R : IG0Nilp p (WittVector p k)) :
    Nonempty ((RZSpace 𝒟 b k).obj R ≃ Pairs 𝒟 b k R) := sorry

/-- (IG.0/pel-rapoport-zink-space) Formal smoothness (Rapoport–Zink 3.25, 3.82). -/
instance formallySmooth : IG0FormallySmooth (RZSpace 𝒟 b k) := sorry

/-- (IG.0/pel-rapoport-zink-space) The action of `J_b(ℚ_p)`, `g · (G, ρ) = (G, ρ ∘ g⁻¹)`. -/
def jAction : 𝒟.J b →* Aut (RZSpace 𝒟 b k) := sorry

/-- (IG.0/pel-rapoport-zink-space) The generic fibre `M_{D^int}` over `Spa(Ĕ, O_Ĕ)`, as a
diamond. -/
def genericFibre (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] : Diamond.{u} := sorry

/-- (IG.0/pel-rapoport-zink-space) The truncated space `M^{0,d}` (kernel of `ρ` in `X_b[p^d]`). -/
def truncated (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] (d : ℕ) : IG0Nilp p (WittVector p k) ⥤ Type u := sorry

/-- `M^{0,d} ↪ 𝔐`. -/
def truncatedι (d : ℕ) : truncated 𝒟 b k d ⟶ RZSpace 𝒟 b k := sorry

instance (d : ℕ) : Mono (truncatedι 𝒟 b k d) := sorry

/-- The Igusa-type locus where `ρ` is an isomorphism, and its inclusion. -/
def isoLocus (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] : IG0Nilp p (WittVector p k) ⥤ Type u := sorry

/-- `isoLocus ↪ 𝔐`. -/
def isoLocusι : isoLocus 𝒟 b k ⟶ RZSpace 𝒟 b k := sorry

/-- The formal dimension of `𝔐` (dimension of its tangent space at a `k`-point). -/
def formalDim (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] : ℕ := sorry

end RZSpace

/-- The PEL realization of `GL_n × 𝔾_m` (`B = ℚ_p × ℚ_p` with the exchange involution, `μ =
(1, 0, …, 0)`) and its basic class. -/
def LocalPELDatum.lubinTate (p : ℕ) [Fact p.Prime] (n : ℕ) : LocalPELDatum p := sorry

/-- `⊔_A F` for a set `A` and a functor `F` on `Nilp`. -/
def IG0DisjointCopies {p : ℕ} {A : Type u} [CommRing A] (I : Type) (F : IG0Nilp p A ⥤ Type u) :
    IG0Nilp p A ⥤ Type u := sorry

/-- `Spf W(k)[[x₁, …, x_m]]`. -/
def IG0SpfPS (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] (m : ℕ) : IG0Nilp p (WittVector p k) ⥤ Type u :=
  sorry

/-- The point `Spf W(k)`. -/
def IG0SpfWk (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] : IG0Nilp p (WittVector p k) ⥤ Type u := sorry

/-- `Aut(X_b) ⊂ J_b(ℚ_p)`. -/
def LocalPELDatum.autXb {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) :
    Subgroup (𝒟.J b) := sorry

-- test: RZSpace.lubinTate — for the PEL realization of GL_n × 𝔾_m (μ = (1,0,…,0), b basic): ⊔_{ℤ×ℤ} Spf W[[x₁,…,x_{n−1}]] (the EL space has a single ℤ index)
example (p : ℕ) [Fact p.Prime] (n : ℕ) (hn : 1 ≤ n) (k : Type u) [Field k] [IsAlgClosed k]
    [CharP k p] :
    Nonempty (RZSpace (LocalPELDatum.lubinTate p n) (LocalPELDatum.lubinTate p n).basic k ≅
      IG0DisjointCopies (ℤ × ℤ) (IG0SpfPS p k (n - 1))) := sorry

-- test: RZSpace.not_isomorphisms — requiring ρ to be an isomorphism gives a proper subfunctor
example (p : ℕ) [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (hV : 0 < 𝒟.dimV) : ¬ IsIso (RZSpace.isoLocusι 𝒟 b k) := sorry

-- test: RZSpace.dim — the formal dimension of 𝔐 is ⟨2ρ, μ⟩
example (p : ℕ) [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] : RZSpace.formalDim 𝒟 b k = 𝒟.dimMu := sorry

/-! ### `IG.0/truncated-rz-isomorphism-locus` -/

/-- The reduced special fibre `M^{0,d}_Y` of the truncated RZ space of `Y`, with its structure map
and universal p-divisible group `H`. -/
def TruncRZFibre {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) {k : Type u} [Field k]
    (Y : 𝒟.PDivB (pt k)) (d : ℕ) : Scheme.{u} := sorry

/-- Structure map of `M^{0,d}_Y`. -/
def TruncRZFibre.toSpec {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) {k : Type u} [Field k]
    (Y : 𝒟.PDivB (pt k)) (d : ℕ) : TruncRZFibre 𝒟 Y d ⟶ pt k := sorry

/-- The universal p-divisible group `H` over `M^{0,d}_Y`. -/
def TruncRZFibre.universal {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) {k : Type u} [Field k]
    (Y : 𝒟.PDivB (pt k)) (d : ℕ) : 𝒟.PDivB (TruncRZFibre 𝒟 Y d) := sorry

/-- Isomorphisms of p-divisible groups with `O_B`-structure. -/
def LocalPELDatum.PDivB.Iso {p : ℕ} [Fact p.Prime] {𝒟 : LocalPELDatum p} {S : Scheme.{u}}
    (X Y : 𝒟.PDivB S) : Type u := sorry

/-- (IG.0/truncated-rz-isomorphism-locus) `{x : H_x̄ ≅ Y_x̄}` is a finite set of closed
(`k`-rational) points. -/
theorem truncatedRzIsomorphismLocus {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) {k : Type u}
    [Field k] [IsAlgClosed k] [CharP k p] (Y : 𝒟.PDivB (pt k)) (d : ℕ) :
    let Z : Set (TruncRZFibre 𝒟 Y d) := {x | Nonempty (LocalPELDatum.PDivB.Iso
      ((TruncRZFibre.universal 𝒟 Y d).baseChange (IG0geomPoint _ x))
      (Y.baseChange (IG0geomPoint _ x ≫ TruncRZFibre.toSpec 𝒟 Y d)))}
    Z.Finite ∧ ∀ x ∈ Z, IsClosed ({x} : Set (TruncRZFibre 𝒟 Y d)) := sorry

/-! ### `IG.0/isomorphism-torsors` -/

/-- (IG.0/isomorphism-torsors) For `𝒢` geometrically isomorphic to `X` (not necessarily
isoclinic): (1) over a perfect `𝒳`, isomorphisms `𝒢_T ≅ X_T` on perfect `T` form a torsor under
the profinite `Γ = Aut(X)(k)`; (2) over a regular `𝒳`, isomorphisms on all `T` are represented by
a flat surjective `Aut(X)`-torsor. -/
theorem isomorphismTorsors {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u}
    [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGStructure D p (pt k)) (𝒳 : Scheme.{u})
    (s : 𝒳 ⟶ pt k) (𝒢 : PDivGStructure D p 𝒳)
    (hgeom : ∀ x : 𝒳, Nonempty ((PDivGStructure.baseChange D p (IG0geomPoint 𝒳 x)).obj 𝒢 ≅
      (PDivGStructure.baseChange D p (IG0geomPoint 𝒳 x ≫ s)).obj X)) :
    ((∀ x : 𝒳, PerfectRing (𝒳.presheaf.stalk x) p) →
      ∃ (J : Scheme.{u}) (π : J ⟶ 𝒳), Nonempty (IG0Torsor (Aut X) π) ∧
        ∀ (T : Scheme.{u}) (_ : ∀ y : T, PerfectRing (T.presheaf.stalk y) p) (t : T ⟶ 𝒳),
          Nonempty ({j : T ⟶ J // j ≫ π = t} ≃
            ((PDivGStructure.baseChange D p t).obj 𝒢 ≅
              (PDivGStructure.baseChange D p (t ≫ s)).obj X))) ∧
    ((∀ x : 𝒳, IsRegularLocalRing (𝒳.presheaf.stalk x)) →
      ∃ (J : Scheme.{u}) (π : J ⟶ 𝒳), Flat π ∧ Surjective π ∧
        ∀ (T : Scheme.{u}) (t : T ⟶ 𝒳),
          Nonempty ({j : T ⟶ J // j ≫ π = t} ≃
            ((PDivGStructure.baseChange D p t).obj 𝒢 ≅
              (PDivGStructure.baseChange D p (t ≫ s)).obj X))) := sorry


/-! ### `IG.0/central-leaf` -/

/-- The point `x̄ → Spec k` underlying a geometric point of the special fibre. -/
def SpecialFibre.geomToBase (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (x : SpecialFibre D p k N) :
    pt (AlgebraicClosure ((SpecialFibre D p k N).residueField x)) ⟶ pt k :=
  IG0geomPoint _ x ≫ SpecialFibre.toSpec D p k N

/-- (IG.0/central-leaf) The central leaf `C^X = {x : A[p^∞]_x̄ ≅ X ×_k k(x̄)}` as a subset of
`S_{K,k}`; the reduced subscheme is the prelude's `CentralLeaf N X`. -/
def centralLeaf (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) : Set (SpecialFibre D p k N) :=
  {x | Nonempty (SpecialFibre.geomFibre D p k N x ≅
    (PDivGStructure.baseChange D p (SpecialFibre.geomToBase D p k N x)).obj X)}

section CentralLeafAPI

variable {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u} [Field k]
  [IsAlgClosed k] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))

/-- (IG.0/central-leaf) `C^X` is smooth over `k` (Mantovan). -/
instance centralLeaf_smooth [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    Smooth (CentralLeaf.ι N X ≫ SpecialFibre.toSpec D p k N) := sorry

/-- (IG.0/central-leaf) `C^X ⊂ S^b`, closed in `S^b`, `b` the class of `X`. -/
theorem centralLeaf_subset_newtonStratum (hN : 3 ≤ N)
    (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) :
    centralLeaf D p k N X ⊆ newtonStratum D p k N X.newtonClass ∧
      IsClosed ((↑) ⁻¹' centralLeaf D p k N X : Set (newtonStratum D p k N X.newtonClass)) ∧
      IsLocallyClosed (centralLeaf D p k N X) := sorry

/-- (IG.0/central-leaf) The prelude's reduced locally closed subscheme `CentralLeaf N X` has the
points `x` with `A[p^∞]_x̄ ≅ X ×_k k(x̄)`. -/
theorem mem_centralLeaf_iff (hN : 3 ≤ N) (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F)
    (x : SpecialFibre D p k N) :
    x ∈ Set.range (CentralLeaf.ι N X).base ↔ x ∈ centralLeaf D p k N X := sorry

/-- (IG.0/central-leaf) Prime-to-`p` Hecke correspondences preserve `C^X`. -/
theorem centralLeaf_hecke (g : GAfp D p) :
    (SpecialFibre.hecke D p k N g).Preserves (centralLeaf D p k N X) := sorry

/-- (IG.0/central-leaf) Over `C^X`, `A[p^∞]` is geometrically isomorphic to `X` at every point. -/
theorem centralLeaf_universal_iso (y : CentralLeaf N X) :
    Nonempty ((PDivGStructure.baseChange D p (IG0geomPoint _ y ≫ CentralLeaf.ι N X)).obj
        (SpecialFibre.universal D p k N) ≅
      (PDivGStructure.baseChange D p
        (IG0geomPoint _ y ≫ CentralLeaf.ι N X ≫ SpecialFibre.toSpec D p k N)).obj X) := sorry

end CentralLeafAPI

-- test: centralLeaf_ordinary_eq_stratum — for b ordinary the leaf is the ordinary stratum
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N) (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F)
    (X : PDivGStructure D p (pt k)) (hX : X.newtonClass = KottwitzSet.ordinary D p) :
    centralLeaf D p k N X = newtonStratum D p k N (KottwitzSet.ordinary D p) := sorry

-- test: centralLeaf_modularCurve_basic — F imaginary quadratic, n = 1, b basic: a finite set of supersingular points
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N) (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F)
    (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1) (X : PDivGStructure D p (pt k))
    (hX : X.newtonClass = KottwitzSet.basic D p) :
    (centralLeaf D p k N X).Finite := sorry

-- test: centralLeaf_ne_newtonStratum — if d_b < dim S^b the leaf is a proper subset of the stratum
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N) (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F)
    (X : PDivGStructure D p (pt k))
    (hdim : (X.newtonClass.dimLeaf : WithBot ℕ∞) <
      topologicalKrullDim (newtonStratum D p k N X.newtonClass)) :
    centralLeaf D p k N X ⊂ newtonStratum D p k N X.newtonClass := sorry

-- test: centralLeaf_dim — dim C^{X_b} = ⟨2ρ, ν_b⟩
example (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N) (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F)
    (X : PDivGStructure D p (pt k)) (hne : Nonempty (CentralLeaf N X)) :
    topologicalKrullDim (CentralLeaf N X) = (X.newtonClass.dimLeaf : WithBot ℕ∞) := sorry

/-! ### `IG.0/central-leaf-dimension` -/

/-- (IG.0/central-leaf-dimension) Hamacher: every central leaf in the isogeny class `b` is smooth
of pure dimension `d_b = ⟨2ρ, ν_b⟩`, and so is the perfect Igusa variety `Ig^b`. -/
theorem centralLeafDimension (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (k : Type u)
    [Field k] [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N)
    (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) (X : PDivGStructure D p (pt k)) :
    SmoothOfRelativeDimension X.newtonClass.dimLeaf
        (CentralLeaf.ι N X ≫ SpecialFibre.toSpec D p k N) ∧
      (Nonempty (IgusaVariety N X) →
        topologicalKrullDim (IgusaVariety N X) = (X.newtonClass.dimLeaf : WithBot ℕ∞)) := sorry

/-! ### `IG.0/serre-tate-semi-abelian` -/

/-- p-divisible groups over `S` up to isogeny (owner: R07.1). -/
def PDivGroupIsog (p : ℕ) (S : Scheme.{u}) : Type (u + 1) := sorry
instance (p : ℕ) (S : Scheme.{u}) : Category.{u} (PDivGroupIsog p S) := sorry
/-- Base change up to isogeny. -/
def PDivGroupIsog.baseChange {p : ℕ} {S T : Scheme.{u}} (f : T ⟶ S) :
    PDivGroupIsog p S ⥤ PDivGroupIsog p T := sorry

/-- Global extensions of abelian schemes by split tori over `S`, with `Hom ⊗ ℤ[1/p]` when
`invert = true` (owner of abelian schemes: AbelianSchemesAndArithmeticModuli A4). -/
def SemiAbExt (p : ℕ) (S : Scheme.{u}) (invert : Bool) : Type (u + 1) := sorry
instance (p : ℕ) (S : Scheme.{u}) (invert : Bool) : Category.{u} (SemiAbExt p S invert) := sorry
/-- Base change of extensions. -/
def SemiAbExt.baseChange {p : ℕ} {S T : Scheme.{u}} (f : T ⟶ S) (invert : Bool) :
    SemiAbExt p S invert ⥤ SemiAbExt p T invert := sorry

/-- Triples `(G_S, 𝒢_{S′}, ρ : G_S[p^∞] ≅ 𝒢_{S′} ×_{S′} S)` for `f : S → S′`. -/
def SerreTateTriple {p : ℕ} {S S' : Scheme.{u}} (f : S ⟶ S') : Type (u + 1) := sorry
instance {p : ℕ} {S S' : Scheme.{u}} (f : S ⟶ S') : Category.{u} (SerreTateTriple (p := p) f) :=
  sorry

/-- (IG.0/serre-tate-semi-abelian) For `S′ ↠ S` with nilpotent kernel and `p` nilpotent (no
noetherian hypothesis): base change is an equivalence on p-divisible groups up to isogeny and on
semi-abelian extensions with `Hom ⊗ ℤ[1/p]`; extensions over `S′` are equivalent to Serre–Tate
triples. -/
theorem serreTateSemiAbelian (p : ℕ) [Fact p.Prime] {R' R : Type u} [CommRing R'] [CommRing R]
    (f : R' →+* R) (hf : Function.Surjective f) (hker : IsNilpotent (RingHom.ker f))
    (hp : IsNilpotent (p : R')) :
    (PDivGroupIsog.baseChange (p := p) (Spec.map (CommRingCat.ofHom f))).IsEquivalence ∧
      (SemiAbExt.baseChange (p := p) (Spec.map (CommRingCat.ofHom f)) true).IsEquivalence ∧
      Nonempty (SemiAbExt p (Spec (CommRingCat.of R')) false ≌
        SerreTateTriple (p := p) (Spec.map (CommRingCat.ofHom f))) := sorry

/-! ### `IG.0/berthelot-without-noetherian` -/

/-- (IG.0/berthelot-without-noetherian) Over a valuation ring (resp. an integrally closed domain)
of characteristic `p`, homomorphisms of p-divisible groups with constant Newton polygon are
determined by and extend from the generic fibre. -/
theorem berthelotWithoutNoetherian (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [IsDomain R]
    [CharP R p] (hR : ValuationRing R ∨ IsIntegrallyClosed R)
    (G H : PDivGroup p (Spec (CommRingCat.of R))) (hG : G.HasConstantNewtonPolygon)
    (hH : H.HasConstantNewtonPolygon) :
    Function.Bijective (fun φ : G ⟶ H =>
      (PDivGroup.baseChange (Spec.map (CommRingCat.ofHom
        (algebraMap R (FractionRing R))))).map φ) := sorry

/-! ### `IG.0/constant-newton-polygon-over-perfect-rings` -/

/-- Multiplication by `p^c`. -/
def PDivGroup.pPow {p : ℕ} {S : Scheme.{u}} (X : PDivGroup p S) (c : ℕ) : X ⟶ X := sorry

/-- (IG.0/constant-newton-polygon-over-perfect-rings) Over a strictly henselian perfect ring `R`
over an algebraically closed `k₀` with residue field `k`: every `G` with constant Newton polygon
is isogenous to `G₀ ×_{k₀} R` with `G₀` completely slope divisible; there is `c` (depending on the
heights) such that `p^c ψ_k` lifts uniquely; automorphisms of `X_R` are constant. -/
theorem constantNewtonPolygonOverPerfectRings (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
    [HenselianLocalRing R] [IsSepClosed (IsLocalRing.ResidueField R)] [CharP R p]
    [PerfectRing R p] (k₀ : Type u) [Field k₀] [IsAlgClosed k₀] [Algebra k₀ R] :
    let toK : pt (IsLocalRing.ResidueField R) ⟶ Spec (CommRingCat.of R) :=
      Spec.map (CommRingCat.ofHom (IsLocalRing.residue R))
    let fromK₀ : Spec (CommRingCat.of R) ⟶ pt k₀ := Spec.map (CommRingCat.ofHom (algebraMap k₀ R))
    (∀ G : PDivGroup p (Spec (CommRingCat.of R)), G.HasConstantNewtonPolygon →
      ∃ G₀ : PDivGroup p (pt k₀), IsCompletelySlopeDivisible G₀ ∧
        Nonempty (PDivGroup.Isogeny G ((PDivGroup.baseChange fromK₀).obj G₀))) ∧
    (∀ h h' : ℕ, ∃ c : ℕ, ∀ G H : PDivGroup p (Spec (CommRingCat.of R)), G.height = h →
      H.height = h' → G.HasConstantNewtonPolygon → H.HasConstantNewtonPolygon →
      ∀ ψ : (PDivGroup.baseChange toK).obj G ⟶ (PDivGroup.baseChange toK).obj H,
        ∃! φ : G ⟶ H, (PDivGroup.baseChange toK).map φ = ψ ≫ PDivGroup.pPow _ c) ∧
    (∀ X : PDivGroup p (pt k₀), Function.Bijective
      (fun e : X ≅ X => (PDivGroup.baseChange fromK₀).mapIso e)) := sorry

/-! ### `IG.0/quasi-isogeny-torsor` -/

/-- Torsors on `S_proét` under the group sheaf of a topological group `J` (Bhatt–Scholze), with
their fibres at geometric points (owner: ProetaleCohomology). -/
def IG0ProetTorsor (J : Type) [Group J] [TopologicalSpace J] (S : Scheme.{u}) : Type (u + 1) :=
  sorry

/-- The fibre of a pro-étale torsor at a geometric point. -/
def IG0ProetTorsor.fibre {J : Type} [Group J] [TopologicalSpace J] {S : Scheme.{u}}
    (P : IG0ProetTorsor J S) {K : Type u} [Field K] (x : pt K ⟶ S) : Type u := sorry

/-- The pro-étale fundamental group `π₁^proét(S, x̄)` (owner: ProetaleCohomology). -/
def IG0ProetPi1 (S : Scheme.{u}) {K : Type u} [Field K] (x : pt K ⟶ S) : Type u := sorry
instance (S : Scheme.{u}) {K : Type u} [Field K] (x : pt K ⟶ S) : Group (IG0ProetPi1 S x) :=
  sorry
instance (S : Scheme.{u}) {K : Type u} [Field K] (x : pt K ⟶ S) :
    TopologicalSpace (IG0ProetPi1 S x) := sorry

/-- (IG.0/quasi-isogeny-torsor) If all geometric fibres of `X/S` are quasi-isogenous to `X_b`,
there is a `J_b(ℚ_p)`-torsor on `S_proét` with fibres the quasi-isogenies `X_x̄ → X_b`; on a
connected locally topologically noetherian `S` it comes from a continuous
`π₁^proét(S, x̄) → J_b(ℚ_p)`. -/
theorem quasiIsogenyTorsor {p : ℕ} [Fact p.Prime] (𝒟 : LocalPELDatum p) (b : 𝒟.KottwitzSet)
    (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] (S : Scheme.{u}) (s : S ⟶ pt k)
    (X : 𝒟.PDivB S)
    (hX : ∀ x : S, Nonempty (LocalPELDatum.PDivB.QIsog (X.baseChange (IG0geomPoint S x))
      ((𝒟.pdivOfB b k).baseChange (IG0geomPoint S x ≫ s)))) :
    ∃ P : IG0ProetTorsor (𝒟.J b) S,
      (∀ x : S, Nonempty (P.fibre (IG0geomPoint S x) ≃
        LocalPELDatum.PDivB.QIsog (X.baseChange (IG0geomPoint S x))
          ((𝒟.pdivOfB b k).baseChange (IG0geomPoint S x ≫ s)))) ∧
      (ConnectedSpace S → TopologicalSpace.NoetherianSpace S → ∀ x : S,
        ∃ ρ : IG0ProetPi1 S (IG0geomPoint S x) →* 𝒟.J b, Continuous ρ) := sorry

/-! ### `IG.0/drinfeld-level-newton-strata` -/

/-- A unitary datum of Harris–Taylor type (signature `(1, n−1)` at one archimedean place, `(0, n)`
at the others) with a place `u` of `F⁺` split in `F` (owner: HarrisTaylorShimuraVarieties). -/
def HTDatum : Type := sorry

/-- The rank `n`. -/
def HTDatum.n (H : HTDatum) : ℕ := sorry

/-- The special fibre `Y_m = 𝒳_m ⊗ k` at Drinfeld level `𝔭^m` at `u`. -/
def HTDatum.specialFibre (H : HTDatum) (m : ℕ) (k : Type u) [Field k] : Scheme.{u} := sorry

/-- Its structure map. -/
def HTDatum.toSpec (H : HTDatum) (m : ℕ) (k : Type u) [Field k] :
    H.specialFibre m k ⟶ pt k := sorry

/-- The height of the formal part of the one-dimensional `O_{F_u}`-divisible group
`A[u^{c,∞}]_x̄` at a point. -/
def HTDatum.formalHeight (H : HTDatum) (m : ℕ) (k : Type u) [Field k] :
    H.specialFibre m k → ℕ := sorry

/-- The prime-to-`p` Hecke group and its correspondences on `Y_m`. -/
def HTDatum.HeckeGroup (H : HTDatum) : Type := sorry

/-- Hecke correspondences on `Y_m` (away from `p`, resp. away from `u`). -/
def HTDatum.hecke (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (g : H.HeckeGroup) :
    SchemeCorrespondence (H.specialFibre m k) := sorry

/-- The Newton point at level zero (owner: IG.0/newton-map for the Harris–Taylor datum). -/
def HTDatum.newtonPoint (H : HTDatum) (k : Type u) [Field k] : H.specialFibre 0 k → ℕ ⊕ ℕ :=
  sorry

/-- (IG.0/drinfeld-level-newton-strata) `Y°_{m,j}`: formal part of height exactly `j + 1`. -/
def DrinfeldStratum (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (j : ℕ) :
    Set (H.specialFibre m k) :=
  {x | H.formalHeight m k x = j + 1}

namespace DrinfeldStratum

/-- The reduced subscheme structure on `Y°_{m,j}`. -/
def scheme (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (j : ℕ) : Scheme.{u} := sorry

/-- Its immersion into `Y_m`. -/
def ι (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (j : ℕ) :
    scheme H m k j ⟶ H.specialFibre m k := sorry

/-- (IG.0/drinfeld-level-newton-strata) `Y_{m,j} = {height ≥ j + 1} = ⊔_{j′ ≥ j} Y°_{m,j′}` is
closed. -/
theorem closed (H : HTDatum) (m : ℕ) (k : Type u) [Field k] [IsAlgClosed k] (j : ℕ) :
    IsClosed {x | j + 1 ≤ H.formalHeight m k x} ∧
      {x | j + 1 ≤ H.formalHeight m k x} = ⋃ j' ≥ j, DrinfeldStratum H m k j' := sorry

/-- (IG.0/drinfeld-level-newton-strata) `Y°_{m,j}` is smooth over `k` of pure dimension
`n − 1 − j` (Harris–Taylor III.4.4). -/
instance smooth (H : HTDatum) (m : ℕ) (k : Type u) [Field k] [IsAlgClosed k] (j : ℕ) :
    SmoothOfRelativeDimension (H.n - 1 - j) (ι H m k j ≫ H.toSpec m k) := sorry

/-- (IG.0/drinfeld-level-newton-strata) Stable under prime-to-`p` Hecke correspondences. -/
theorem hecke (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (j : ℕ) (g : H.HeckeGroup) :
    (H.hecke m k g).Preserves (DrinfeldStratum H m k j) := sorry

/-- (IG.0/drinfeld-level-newton-strata) At `m = 0` the strata are the Newton strata. -/
theorem levelZero (H : HTDatum) (k : Type u) [Field k] [IsAlgClosed k]
    (x y : H.specialFibre 0 k) :
    H.newtonPoint k x = H.newtonPoint k y ↔ H.formalHeight 0 k x = H.formalHeight 0 k y := sorry

end DrinfeldStratum

-- test: DrinfeldStratum.n_two — n = 2: Y°_{m,1} is zero-dimensional (the supersingular locus)
example (H : HTDatum) (m : ℕ) (k : Type u) [Field k] [IsAlgClosed k] (hn : H.n = 2) :
    topologicalKrullDim (DrinfeldStratum H m k 1) ≤ 0 := sorry

-- test: DrinfeldStratum.top — Y°_{m,0} is open and dense, of dimension n − 1
example (H : HTDatum) (m : ℕ) (k : Type u) [Field k] [IsAlgClosed k] (hn : 1 ≤ H.n) :
    IsOpen (DrinfeldStratum H m k 0) ∧ Dense (DrinfeldStratum H m k 0) ∧
      topologicalKrullDim (DrinfeldStratum H m k 0) = ((H.n - 1 : ℕ) : WithBot ℕ∞) := sorry

-- test: DrinfeldStratum.not_regular_m — for some m ≥ 1, Y_m is not reduced (only Y_m^red is stratified)
example (H : HTDatum) (k : Type u) [Field k] [IsAlgClosed k] (hn : 1 ≤ H.n) :
    ∃ m ≥ 1, ¬ IsReduced (H.specialFibre m k) := sorry

/-! ### `IG.0/isomorphism-locus-constructible` -/

/-- (IG.0/isomorphism-locus-constructible) Oort: for `𝒢` with `G`-structure over `T` of finite
type over `k`, `{t : 𝒢_t̄ ≅ Y_{k(t̄)}}` is constructible, and closed in every locally closed subset
on which the Newton polygon is constant. -/
theorem isomorphismLocusConstructible {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (T : Scheme.{u}) (s : T ⟶ pt k)
    [LocallyOfFiniteType s] [QuasiCompact s] (𝒢 : PDivGStructure D p T)
    (Y : PDivGStructure D p (pt k)) :
    let Z : Set T := {t | Nonempty ((PDivGStructure.baseChange D p (IG0geomPoint T t)).obj 𝒢 ≅
      (PDivGStructure.baseChange D p (IG0geomPoint T t ≫ s)).obj Y)}
    Topology.IsConstructible Z ∧
      ∀ W : Set T, IsLocallyClosed W →
        (∀ x ∈ W, ∀ y ∈ W,
          ((PDivGroup.baseChange (IG0geomPoint T x)).obj 𝒢.pdiv).newtonPolygon =
            ((PDivGroup.baseChange (IG0geomPoint T y)).obj 𝒢.pdiv).newtonPolygon) →
        IsClosed ((↑) ⁻¹' Z : Set W) := sorry

/-! ### `IG.0/refined-drinfeld-strata` -/

/-- `O_{F_u}/𝔭_u^m` (owner: HarrisTaylorShimuraVarieties). -/
def HTDatum.Om (H : HTDatum) (m : ℕ) : Type := sorry
instance (H : HTDatum) (m : ℕ) : CommRing (H.Om m) := sorry

/-- The height `h(x)` of the étale part of `A_x[u^{c,∞}]`. -/
def HTDatum.etaleHeight (H : HTDatum) (m : ℕ) (k : Type u) [Field k] :
    H.specialFibre m k → ℕ := sorry

/-- The kernel of the Drinfeld level structure at `x`, a submodule of
`(𝔭^{−m}/O)^n ≅ (O/𝔭^m)^n`. -/
def HTDatum.drinfeldKernel (H : HTDatum) (m : ℕ) (k : Type u) [Field k] :
    H.specialFibre m k → Submodule (H.Om m) (Fin H.n → H.Om m) := sorry

/-- `𝔖^h_m`: free `O/𝔭^m`-submodules of `(𝔭^{−m}/O)^n` of rank `n − h`. -/
def RefinedStratum.Index (H : HTDatum) (m h : ℕ) : Type :=
  {M : Submodule (H.Om m) (Fin H.n → H.Om m) //
    Module.Free (H.Om m) M ∧ Module.finrank (H.Om m) M = H.n - h}

/-- (IG.0/refined-drinfeld-strata) `Y^{(M)}_m ⊂ Y^{(h)}_m`: étale height `h`, Drinfeld kernel `M`. -/
def RefinedStratum (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (h : ℕ)
    (M : RefinedStratum.Index H m h) : Set (H.specialFibre m k) :=
  {x | H.etaleHeight m k x = h ∧ H.drinfeldKernel m k x = M.1}

namespace RefinedStratum

/-- (IG.0/refined-drinfeld-strata) The closure `Y^{[M]}_m`. -/
def closure (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (h : ℕ) (M : Index H m h) :
    Set (H.specialFibre m k) :=
  _root_.closure (RefinedStratum H m k h M)

/-- (IG.0/refined-drinfeld-strata) `Y^{[M]}_m = ⋃_{M ⊆ M′} Y^{(M′)}_m` (Li–Liu (4.1)). -/
theorem closure_eq (H : HTDatum) (m : ℕ) (hm : 1 ≤ m) (k : Type u) [Field k] [IsAlgClosed k]
    (h : ℕ) (M : Index H m h) :
    closure H m k h M = ⋃ (h' : ℕ) (M' : Index H m h') (_ : M.1 ≤ M'.1), RefinedStratum H m k h' M' :=
  sorry

/-- (IG.0/refined-drinfeld-strata) `Y^{(h)}_m = ⊔_{M ∈ 𝔖^h_m} Y^{(M)}_m`. -/
theorem decomp (H : HTDatum) (m : ℕ) (hm : 1 ≤ m) (k : Type u) [Field k] [IsAlgClosed k]
    (h : ℕ) (hh : h ≤ H.n - 1) :
    {x | H.etaleHeight m k x = h} = ⋃ M : Index H m h, RefinedStratum H m k h M ∧
      Pairwise (Function.onFun Disjoint (RefinedStratum H m k h)) := sorry

/-- (IG.0/refined-drinfeld-strata) Preserved by Hecke operators away from `u`. -/
theorem hecke (H : HTDatum) (m : ℕ) (k : Type u) [Field k] (h : ℕ) (M : Index H m h)
    (g : H.HeckeGroup) : (H.hecke m k g).Preserves (RefinedStratum H m k h M) := sorry

end RefinedStratum

-- test: RefinedStratum.n_two_supersingular — n = 2: 𝔖^0_m is a singleton and Y^{(0)}_m is the supersingular locus
example (H : HTDatum) (m : ℕ) (hm : 1 ≤ m) (k : Type u) [Field k] [IsAlgClosed k]
    (hn : H.n = 2) :
    Nonempty (Unique (RefinedStratum.Index H m 0)) ∧
      {x | H.etaleHeight m k x = 0} = DrinfeldStratum H m k 1 := sorry

-- test: RefinedStratum.top — h = n − 1: rank-one submodules, and Y^{(n−1)}_m is dense
example (H : HTDatum) (m : ℕ) (hm : 1 ≤ m) (k : Type u) [Field k] [IsAlgClosed k]
    (hn : 1 ≤ H.n) :
    (∀ M : RefinedStratum.Index H m (H.n - 1), Module.finrank (H.Om m) M.1 = 1) ∧
      Dense {x | H.etaleHeight m k x = H.n - 1} := sorry

-- test: RefinedStratum.not_closed — for h ≥ 1 the stratum Y^{(M)}_m is not closed
example (H : HTDatum) (m : ℕ) (hm : 1 ≤ m) (k : Type u) [Field k] [IsAlgClosed k] (h : ℕ)
    (hh : 1 ≤ h) (hhn : h ≤ H.n - 1) (M : RefinedStratum.Index H m h) :
    ¬ IsClosed (RefinedStratum H m k h M) := sorry


end TauCeti.Igusa

end

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false
set_option linter.dupNamespace false

open CategoryTheory AlgebraicGeometry Limits

noncomputable section

namespace TauCeti.Igusa

universe u

/-! ## IG.1 — Igusa towers and their actions -/

section IG1Carriers

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- The finite group `Γ_{m,X}`, the image of `Aut(X)` in the automorphisms of `⊕ X_i[p^m]`
(owner: `IG.0/liftable-automorphisms`; local carrier). -/
def GammaLevelIG1 (X : PDivGStructure D p (pt k)) (m : ℕ) : Type := sorry

instance (X : PDivGStructure D p (pt k)) (m : ℕ) : Group (GammaLevelIG1 X m) := sorry
instance (X : PDivGStructure D p (pt k)) (m : ℕ) : Finite (GammaLevelIG1 X m) := sorry

/-- For isoclinic `X`, `Γ_{m,X}` is `IG.0`'s group `LiftableAut X m` of liftable automorphisms
of `X[p^m]` (for non-isoclinic `X` they differ: `Γ_{m,X}` acts on the graded pieces only). -/
def GammaLevelIG1.equivLiftableAut [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    (hX : X.pdiv.IsIsoclinic) (m : ℕ) : GammaLevelIG1 X m ≃* LiftableAut X m := sorry

/-- The reduction `Γ_X = Aut(X)(k) → Γ_{m,X}`. -/
def GammaLevelIG1.ofAut (X : PDivGStructure D p (pt k)) (m : ℕ) :
    Aut X →* GammaLevelIG1 X m := sorry

/-- The (non-reduced) group scheme `Aut(X)` over `k` of automorphisms of `X` with
`G`-structure (owner: `IG.0/automorphism-group-of-universal-cover`; local carrier, its group
law is not recorded). -/
def AutSchemeIG1 (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

/-- The structure morphism of `Aut(X)`. -/
def AutSchemeIG1.toPt (X : PDivGStructure D p (pt k)) : AutSchemeIG1 X ⟶ pt k := sorry

/-- The `k`-points of `Aut(X)` are `Γ_X = Aut(X)(k)`. -/
def AutSchemeIG1.kPoints (X : PDivGStructure D p (pt k)) :
    {x : pt k ⟶ AutSchemeIG1 X // x ≫ AutSchemeIG1.toPt X = 𝟙 _} ≃ Aut X := sorry

/-- The embedding `Γ_X = Aut(X)(k) ↪ J_b(ℚ_p)` (owner: `IG.0`, `AutUniversalCover.toJ`). -/
def autToJIG1 (X : PDivGStructure D p (pt k)) : Aut X →* JGroup (X.newtonClass) := sorry

/-- The identification `J_b(ℚ_p) ≅ J_{b'}(ℚ_p)` through a `G`-quasi-isogeny `φ` (conjugation by
`φ`; `IG.0`'s `PDivGStructure.QIsog`). -/
def PDivGStructure.QIsog.jIsoIG1 {X X' : PDivGStructure D p (pt k)}
    (φ : PDivGStructure.QIsog X X') :
    JGroup (X.newtonClass) ≃* JGroup (X'.newtonClass) := sorry

/-- The principal congruence subgroup `K^p(N) ⊂ G(𝔸_f^p)` (owner: `IG.0/integral-model`;
local carrier). -/
def levelSubgroupIG1 (D : UnitarySimilitudeDatum) (p N : ℕ) : Subgroup (GAfp D p) := sorry

/-- An fpqc torsor `f : T → S` under a group scheme `g : G → K` (`S` lying over `K` via `s`),
with action `act : T ×_K G → T`: the action is over `S`, the shear map
`T ×_K G → T ×_S T` is an isomorphism, and `f` is faithfully flat and quasi-compact. The group
law of `G` is not part of the carriers and is not recorded. -/
structure IsFpqcTorsorIG1 {T S K G : Scheme.{u}} (f : T ⟶ S) (s : S ⟶ K) (g : G ⟶ K)
    (act : pullback (f ≫ s) g ⟶ T) : Prop where
  act_over : act ≫ f = pullback.fst (f ≫ s) g ≫ f
  isIso_shear : IsIso (pullback.lift act (pullback.fst (f ≫ s) g) act_over)
  flat : Flat f
  surjective : Surjective f
  quasiCompact : QuasiCompact f

/-- A perfect `𝔽_p`-scheme: `p = 0` and `r ↦ r^p` is bijective on all sections (equivalently,
the absolute Frobenius is an isomorphism). -/
class PerfectSchemeIG1 (p : ℕ) (X : Scheme.{u}) : Prop where
  char_eq_zero : ∀ U : X.Opens, (p : Γ(X, U)) = 0
  frob_bijective : ∀ U : X.Opens, Function.Bijective (fun r : Γ(X, U) => r ^ p)

/-- A finite étale morphism. -/
class IsFiniteEtaleIG1 {Y S : Scheme.{u}} (f : Y ⟶ S) : Prop where
  finite : IsFinite f
  etale : Etale f

/-- A finite étale Galois cover `f : Y → S` with group `G` acting over `S`: `f` is finite,
étale and surjective, and `G` acts simply transitively on every geometric fibre. -/
class IsGaloisCoverIG1 {Y S : Scheme.{u}} (f : Y ⟶ S) (G : Type) [Group G]
    (act : G →* Aut (Over.mk f)) : Prop where
  finite : IsFinite f
  etale : Etale f
  surjective : Surjective f
  simplyTransitive : ∀ (K : Type u) [Field K] [IsAlgClosed K] (x : pt K ⟶ S)
    (y y' : pt K ⟶ Y), y ≫ f = x → y' ≫ f = x → ∃! γ : G, y ≫ (act γ).hom.left = y'

/-- Pullback on étale cohomology along a morphism of schemes (owner:
EtaleDualityAndPerverseSheaves EDC.0). -/
def EtH.pullbackIG1 {X Y : Scheme.{u}} (f : X ⟶ Y) (Λ : Type) [CommRing Λ] (i : ℕ) :
    EtH Y Λ i →ₗ[Λ] EtH X Λ i := sorry

/-- Pullback on compactly supported étale cohomology along an integral morphism (owner:
EtaleDualityAndPerverseSheaves EDC.0; `f_! = f_*` for integral `f`). -/
def EtHc.pullbackIG1 {X Y : Scheme.{u}} (f : X ⟶ Y) [IsIntegralHom f] (Λ : Type) [CommRing Λ]
    (i : ℕ) : EtHc Y Λ i →ₗ[Λ] EtHc X Λ i := sorry

/-- The structure morphism `C^X → Spec k` of a central leaf. -/
def CentralLeaf.toPtIG1 (N : ℕ) (X : PDivGStructure D p (pt k)) : CentralLeaf N X ⟶ pt k :=
  CentralLeaf.ι N X ≫ SpecialFibre.toSpec D p k N

/-- The structure morphism `Ig^X → Spec k`. -/
def IgusaVariety.toPtIG1 (N : ℕ) (X : PDivGStructure D p (pt k)) : IgusaVariety N X ⟶ pt k :=
  IgusaVariety.toLeaf N X ≫ CentralLeaf.toPtIG1 N X

/-- The reduced locally closed subscheme with underlying set `Y` (local carrier; well defined
for locally closed `Y`). -/
def LCSubschemeIG2 {X : Scheme.{u}} (Y : Set X) : Scheme.{u} := sorry

/-- Its immersion. -/
def LCSubschemeIG2.ι {X : Scheme.{u}} (Y : Set X) : LCSubschemeIG2 Y ⟶ X := sorry

/-- For locally closed `Y`, `LCSubschemeIG2 Y` is a reduced subscheme with underlying set
`Y`. -/
theorem LCSubschemeIG2.spec {X : Scheme.{u}} (Y : Set X) (hY : IsLocallyClosed Y) :
    IsImmersion (LCSubschemeIG2.ι Y) ∧ IsReduced (LCSubschemeIG2 Y) ∧
      Set.range (LCSubschemeIG2.ι Y).base = Y := sorry

end IG1Carriers

/-! ### IG.1/perfect-igusa-variety -/

section PerfectIgusa

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- (IG.1/perfect-igusa-variety) The perfect Igusa variety `Ig^X → C^X` as an object over the
central leaf: it parametrizes isomorphisms `ρ : A[p^∞] ≅ X` of p-divisible groups with
`G`-structure (CSnc Cor. 2.3.2; CS17 Def. 4.3.1–Cor. 4.3.5). The scheme is the prelude's
`IgusaVariety N X`. -/
def Igusa (N : ℕ) (X : PDivGStructure D p (pt k)) : Over (CentralLeaf N X) :=
  Over.mk (IgusaVariety.toLeaf N X)

namespace Igusa

/-- The action of `Γ_X = Aut(X)(k)` on `Ig^X` over `C^X`, `ρ ↦ γ ∘ ρ`. -/
def gammaAction (N : ℕ) (X : PDivGStructure D p (pt k)) : Aut X →* Aut (Igusa N X) := sorry

/-- The action morphism `Ig^X ×_k Aut(X) → Ig^X` of the group scheme `Aut(X)`. -/
def autAct (N : ℕ) (X : PDivGStructure D p (pt k)) :
    pullback (IgusaVariety.toLeaf N X ≫ CentralLeaf.toPtIG1 N X) (AutSchemeIG1.toPt X) ⟶
      IgusaVariety N X := sorry

/-- (IG.1/perfect-igusa-variety, (1)) `Ig^X → C^X` is an fpqc `Aut(X)`-torsor; on `k`-points
it is a `Γ_X`-torsor (the pro-étale `Γ_X`-torsor over `(C^X)_perf` is recorded on geometric
points, the perfection of a scheme not being among the carriers). -/
theorem isTorsor [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k)) [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    IsFpqcTorsorIG1 (IgusaVariety.toLeaf N X) (CentralLeaf.toPtIG1 N X) (AutSchemeIG1.toPt X)
        (autAct N X) ∧
      ∀ x : pt k ⟶ CentralLeaf N X,
        (∃ y : pt k ⟶ IgusaVariety N X, y ≫ IgusaVariety.toLeaf N X = x) ∧
        ∀ y y' : pt k ⟶ IgusaVariety N X, y ≫ IgusaVariety.toLeaf N X = x →
          y' ≫ IgusaVariety.toLeaf N X = x →
          ∃! γ : Aut X, y ≫ (gammaAction N X γ).hom.left = y' := sorry

/-- (IG.1/perfect-igusa-variety, (2)) `Ig^X` is a perfect `𝔽_p`-scheme. -/
instance isPerfect [Fact p.Prime] [CharP k p] {N : ℕ}
    {X : PDivGStructure D p (pt k)} [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    PerfectSchemeIG1 p (IgusaVariety N X) := sorry

end Igusa

/-- The set of pairs `(A, ρ̃)` over a perfect `k`-algebra `R`: `A` an abelian variety with
`G`-structure and `K^p(N)`-level over `R` up to `p`-power isogeny, `ρ̃ : A[p^∞] → X ×_k R` a
quasi-isogeny respecting the extra structures (owner: this roadmap, IG.1; the moduli of
abelian varieties is `IG.0/integral-model`). -/
def IgusaIsogenyPairsIG1 (N : ℕ) (X : PDivGStructure D p (pt k)) (R : Type u) [CommRing R]
    [Algebra k R] : Type := sorry

namespace Igusa

/-- (IG.1/perfect-igusa-variety, (3); CS17 Lemma 4.3.4) For every `k`-algebra `R`,
`Ig^X(R)` is the set of pairs `(A, ρ̃)` with `A` up to `p`-power isogeny and `ρ̃` a
quasi-isogeny. The construction of A′ uses a reverse quasi-isogeny, not necessarily an isogeny. -/
def isoUpToIsogeny [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
    (R : Type u) [CommRing R] [Algebra k R] :
    {y : Spec (CommRingCat.of R) ⟶ IgusaVariety N X //
        y ≫ IgusaVariety.toPtIG1 N X = Spec.map (CommRingCat.ofHom (algebraMap k R))} ≃
      IgusaIsogenyPairsIG1 N X R := sorry

/-- (IG.1/perfect-igusa-variety) The action of `J_b(ℚ_p) = Aut_G(X̃)(k)` on `Ig^X` through
`ρ̃ ↦ g ∘ ρ̃`; being a monoid homomorphism it is compatible with composition. -/
def jAction (N : ℕ) (X : PDivGStructure D p (pt k)) :
    JGroup (X.newtonClass) →* Aut (IgusaVariety N X) := sorry

/-- The `J_b(ℚ_p)`-action extends the `Γ_X`-action. -/
theorem jAction_autToJ (N : ℕ) (X : PDivGStructure D p (pt k)) (γ : Aut X) :
    jAction N X (autToJIG1 X γ) = (Over.forget _).mapIso (gammaAction N X γ) := sorry

/-- (IG.1/perfect-igusa-variety) The prime-to-`p` Hecke correspondence attached to
`g ∈ G(𝔸_f^p)` with `g⁻¹ K^p(N') g ⊂ K^p(N)`: the map `Ig^X_{K(N')} → Ig^X_{K(N)}`, `η ↦ η ∘ g`
(the other leg of the correspondence being the transition map, the case `g = 1`). -/
def heckeAction (N N' : ℕ) (X : PDivGStructure D p (pt k)) (g : GAfp D p)
    (h : (levelSubgroupIG1 D p N').map (MulAut.conj g⁻¹).toMonoidHom ≤ levelSubgroupIG1 D p N) :
    IgusaVariety N' X ⟶ IgusaVariety N X := sorry

/-- The Hecke correspondences commute with the `J_b(ℚ_p)`-action. -/
theorem heckeAction_jAction [Fact p.Prime] [CharP k p] (N N' : ℕ)
    (X : PDivGStructure D p (pt k)) (g : GAfp D p)
    (h : (levelSubgroupIG1 D p N').map (MulAut.conj g⁻¹).toMonoidHom ≤ levelSubgroupIG1 D p N)
    (j : JGroup (X.newtonClass)) :
    (jAction N' X j).hom ≫ heckeAction N N' X g h = heckeAction N N' X g h ≫ (jAction N X j).hom :=
  sorry

/-- (IG.1/perfect-igusa-variety) A `G`-isogeny `φ : X → X'` induces `Ig^X ≅ Ig^{X'}` (over the
correspondence `C^X ← Ig^X ≅ Ig^{X'} → C^{X'}`). -/
def ofIsogeny (N : ℕ) {X X' : PDivGStructure D p (pt k)} (φ : PDivGStructure.QIsog X X') :
    IgusaVariety N X ≅ IgusaVariety N X' := sorry

end Igusa

-- test: Igusa.ordinary — for b ordinary, Γ_X ≅ GL_n(O_F ⊗ ℤ_p) × ℤ_p^×
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (hb : X.newtonClass = KottwitzSet.ordinary D p) :
    Nonempty (Aut X ≃* (Matrix.GeneralLinearGroup (Fin D.n)
      (TensorProduct ℤ (NumberField.RingOfIntegers D.F) ℤ_[p]) × ℤ_[p]ˣ)) := sorry

-- test: Igusa.basic_pointwise — F imaginary quadratic, n = 1, b basic: C^b finite, Ig^b profinite, Γ_X-torsors of points
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (hF : Module.finrank ℚ D.F = 2)
    (hn : D.n = 1)
    (hb : X.newtonClass = KottwitzSet.basic D p) :
    Finite (CentralLeaf N X) ∧ CompactSpace (IgusaVariety N X) ∧ T2Space (IgusaVariety N X) ∧
      TotallyDisconnectedSpace (IgusaVariety N X) ∧
      ∀ (x : pt k ⟶ CentralLeaf N X) (y y' : pt k ⟶ IgusaVariety N X),
        y ≫ IgusaVariety.toLeaf N X = x → y' ≫ IgusaVariety.toLeaf N X = x →
        ∃! γ : Aut X, y ≫ (Igusa.gammaAction N X γ).hom.left = y' := sorry

-- test: Igusa.not_mantovan — Ig^X is not of finite type, hence not any finite Mantovan level
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] [Nonempty (CentralLeaf N X)] :
    ¬ LocallyOfFiniteType (IgusaVariety.toPtIG1 N X) ∧
      ∀ m, IsEmpty (IgusaVariety N X ≅ MantovanIgusaVariety N X m) := sorry

-- test: Igusa.frobenius_bijective — the absolute Frobenius of Ig^X is an isomorphism (p-th power bijective on sections)
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (U : (IgusaVariety N X).Opens) :
    Function.Bijective (fun r : Γ(IgusaVariety N X, U) => r ^ p) := sorry

/-- (IG.1/igusa-isogeny-invariance) A `G`-isogeny `φ : X → X'` induces `Ig^X ≅ Ig^{X'}`,
equivariant for `J_b(ℚ_p)` (identified through `φ`) and for the prime-to-`p` Hecke
correspondences; in particular `X` and `X'` have the same isogeny class `b`, so `Ig^b` depends
only on `b`. -/
theorem igusaIsogenyInvariance [Fact p.Prime] [CharP k p]
    {X X' : PDivGStructure D p (pt k)} (φ : PDivGStructure.QIsog X X') :
    X.newtonClass = X'.newtonClass ∧
      ∀ (N : ℕ) [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)],
        (∀ j : JGroup (X.newtonClass),
          (Igusa.jAction N X j).hom ≫ (Igusa.ofIsogeny N φ).hom =
            (Igusa.ofIsogeny N φ).hom ≫ (Igusa.jAction N X' (φ.jIsoIG1 j)).hom) ∧
        ∀ (N' : ℕ) [Fact (3 ≤ N')] [Fact (¬ (p : ℤ) ∣ N' * NumberField.discr D.F)] (g : GAfp D p)
          (h : (levelSubgroupIG1 D p N').map (MulAut.conj g⁻¹).toMonoidHom ≤
            levelSubgroupIG1 D p N),
          Igusa.heckeAction N N' X g h ≫ (Igusa.ofIsogeny N φ).hom =
            (Igusa.ofIsogeny N' φ).hom ≫ Igusa.heckeAction N N' X' g h := sorry

end PerfectIgusa

/-! ### IG.1/mantovan-igusa-variety, IG.1/perfection-of-mantovan, IG.1/igusa-faithfully-flat -/

section Mantovan

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- The structure map `Ig^X_{Mant,m} → C^X` (data carrier for the morphism; the scheme is the
prelude's `MantovanIgusaVariety N X m`). -/
def MantovanIgusa.toLeaf (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MantovanIgusaVariety N X m ⟶ CentralLeaf N X := sorry

/-- (IG.1/mantovan-igusa-variety) Mantovan's finite-level Igusa variety `Ig^X_{Mant,m} → C^X`
for completely slope divisible `X = ⊕ X_i`: it parametrizes tuples of isomorphisms
`ρ_{i,m} : 𝒢^i[p^m] ≅ X_i[p^m]` lifting fppf locally to every level and respecting the extra
structures up to `(ℤ/p^m)^×` (CSnc Def. 2.3.5; CS17 Def. 4.3.6). -/
def MantovanIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Over (CentralLeaf N X) :=
  Over.mk (MantovanIgusa.toLeaf N X m)

namespace MantovanIgusa

/-- The Galois action of `Γ_{m,X}` on `Ig^X_{Mant,m}` over `C^X`. -/
def galoisAction (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    GammaLevelIG1 X m →* Aut (MantovanIgusa N X m) := sorry

/-- (IG.1/mantovan-igusa-variety) `Ig^X_{Mant,m} → C^X` is a finite étale Galois cover with
group `Γ_{m,X}`. -/
instance finiteEtale [Fact p.Prime] [CharP k p] {N : ℕ}
    {X : PDivGStructure D p (pt k)} {m : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    IsGaloisCoverIG1 (toLeaf N X m) (GammaLevelIG1 X m) (galoisAction N X m) := sorry

/-- (IG.1/mantovan-igusa-variety) The transition map `Ig^X_{Mant,m+1} → Ig^X_{Mant,m}`. -/
def transition (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MantovanIgusaVariety N X (m + 1) ⟶ MantovanIgusaVariety N X m := sorry

/-- The transition maps are finite étale. -/
instance transition_isFiniteEtale [Fact p.Prime] [CharP k p] {N : ℕ}
    {X : PDivGStructure D p (pt k)} {m : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    IsFiniteEtaleIG1 (transition N X m) := sorry

/-- The transition maps are maps over `C^X`. -/
theorem transition_toLeaf (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    transition N X m ≫ toLeaf N X m = toLeaf N X (m + 1) := sorry

/-- The composite transition `Ig^X_{Mant,m+e} → Ig^X_{Mant,m}`. -/
def transitionIter (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    (e : ℕ) → (MantovanIgusaVariety N X (m + e) ⟶ MantovanIgusaVariety N X m)
  | 0 => 𝟙 _
  | e + 1 => transition N X (m + e) ≫ transitionIter N X m e

/-- Composite transitions are finite, hence integral. -/
instance transitionIter_isIntegralHom [Fact p.Prime] [CharP k p] {N : ℕ}
    {X : PDivGStructure D p (pt k)} {m e : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    IsIntegralHom (transitionIter N X m e) := sorry

/-- (IG.1/mantovan-igusa-variety) `Ig^X_{Mant,m}` is smooth of dimension `d_b` over `k`. -/
instance smooth [Fact p.Prime] [CharP k p] {N : ℕ}
    {X : PDivGStructure D p (pt k)} {m : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    SmoothOfRelativeDimension (X.newtonClass.dimLeaf) (toLeaf N X m ≫ CentralLeaf.toPtIG1 N X) :=
  sorry

/-- (IG.1/mantovan-igusa-variety) The pro-Igusa variety `Ig^X_Mant = lim_m Ig^X_{Mant,m}`,
as a cone over the tower of transition maps. -/
def pro (N : ℕ) (X : PDivGStructure D p (pt k)) :
    Cone (Functor.ofOpSequence (transition N X)) := sorry

/-- `Ig^X_Mant` is the limit of the tower; it is a pro-finite étale `Γ_X`-cover of `C^X`. -/
theorem pro_isLimit [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (hX : IsCompletelySlopeDivisible X.pdiv) :
    Nonempty (IsLimit (pro N X)) := sorry

/-- The submonoid of `J_b(ℚ_p)` of quasi-isogenies preserving `⊕ X_i` integrally with
nonnegative valuations on the graded pieces (local data carrier). -/
def jMonoid (X : PDivGStructure D p (pt k)) : Submonoid (JGroup (X.newtonClass)) := sorry

/-- (IG.1/mantovan-igusa-variety) Only the submonoid `jMonoid X` of `J_b(ℚ_p)` acts on the
Mantovan tower, by finite correspondences (here: endomorphisms of `Ig^X_Mant`). -/
def monoidAction (N : ℕ) (X : PDivGStructure D p (pt k)) :
    jMonoid X →* End (pro N X).pt := sorry

/-- Trivializing all of `A[p^m]` (rather than its graded pieces): the moduli scheme
`Isom_{C^X}(𝒢[p^m], X[p^m])` with its map to `C^X` (local carrier for the non-example). -/
def wholeTorsionIG1 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Scheme.{u} := sorry

/-- The structure map of `wholeTorsionIG1`. -/
def wholeTorsionIG1.toLeaf (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    wholeTorsionIG1 N X m ⟶ CentralLeaf N X := sorry

end MantovanIgusa

-- test: MantovanIgusa.ordinary_level_one — F imaginary quadratic, n = 1, b ordinary: Ig_{Mant,1} is a curve, Galois group (O_F/p)^× × (ℤ/p)^×
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1)
    (hb : X.newtonClass = KottwitzSet.ordinary D p) :
    Nonempty (GammaLevelIG1 X 1 ≃*
        ((NumberField.RingOfIntegers D.F ⧸ Ideal.span {(p : NumberField.RingOfIntegers D.F)})ˣ ×
          (ZMod p)ˣ)) ∧
      SmoothOfRelativeDimension 1 (MantovanIgusa.toLeaf N X 1 ≫ CentralLeaf.toPtIG1 N X) := sorry

-- test: MantovanIgusa.level_zero — Ig^X_{Mant,0} = C^X
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] : IsIso (MantovanIgusa.toLeaf N X 0) := sorry

-- test: MantovanIgusa.not_whole_group — trivializing all of A[p^m] is not finite étale when X is not isoclinic
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (c : SlopeFiltration X.pdiv)
    (hc : 2 ≤ c.r) (m : ℕ) (hm : 1 ≤ m)
    [Nonempty (CentralLeaf N X)] :
    ¬ IsFiniteEtaleIG1 (MantovanIgusa.wholeTorsionIG1.toLeaf N X m) := sorry

-- test: MantovanIgusa.galoisGroup — the Galois group is Γ_{m,X}, the image of Aut(X), acting faithfully
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ) [Nonempty (CentralLeaf N X)] :
    Function.Surjective (GammaLevelIG1.ofAut X m) ∧
      Function.Injective (MantovanIgusa.galoisAction N X m) := sorry

/-- The natural map `Ig^X → Ig^X_Mant = lim_m Ig^X_{Mant,m}` (`ρ ↦ (ρ restricted to the graded
pieces mod p^m)_m`). -/
def Igusa.toMantovanPro (N : ℕ) (X : PDivGStructure D p (pt k)) :
    IgusaVariety N X ⟶ (MantovanIgusa.pro N X).pt := sorry

/-- The map `Ig^X → Ig^X_{Mant,m}`. -/
def Igusa.toMantovan (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    IgusaVariety N X ⟶ MantovanIgusaVariety N X m :=
  Igusa.toMantovanPro N X ≫ (MantovanIgusa.pro N X).π.app (Opposite.op m)

/-- `Ig^X → Ig^X_{Mant,m}` is integral (a limit of finite étale maps after perfection). -/
instance Igusa.toMantovan_isIntegralHom [Fact p.Prime] [CharP k p] {N : ℕ}
    {X : PDivGStructure D p (pt k)} {m : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    IsIntegralHom (Igusa.toMantovan N X m) := sorry

/-- (IG.1/perfection-of-mantovan; CS17 Prop. 4.3.8) For completely slope divisible `X`:
(1) `Ig^X → lim_m Ig^X_{Mant,m}` is the perfection: `Ig^X` is perfect and every compatible
family of maps from a perfect scheme to the `Ig^X_{Mant,m}` lifts uniquely to `Ig^X`;
(2) `H^i(Ig^b, ℤ/ℓ^n)` and `H^i_c(Ig^b, ℤ/ℓ^n)` are the colimits of the finite-level groups
(every class comes from a finite level, and a class dying on `Ig^b` dies at a finite level);
(3) the `J_b(ℚ_p)`-action on `Ig^b` restricts on the submonoid acting on `Ig^b_Mant` to that
action, so the two actions agree on cohomology. -/
theorem perfectionOfMantovan [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    PerfectSchemeIG1 p (IgusaVariety N X) ∧
    (∀ (T : Scheme.{u}) [PerfectSchemeIG1 p T] (f : ∀ m, T ⟶ MantovanIgusaVariety N X m),
      (∀ m, f (m + 1) ≫ MantovanIgusa.transition N X m = f m) →
      ∃! y : T ⟶ IgusaVariety N X, ∀ m, y ≫ Igusa.toMantovan N X m = f m) ∧
    (∀ (ℓ n i : ℕ), ℓ.Prime → ℓ ≠ p →
      (∀ x : EtH (IgusaVariety N X) (ZMod (ℓ ^ n)) i, ∃ (m : ℕ) (y : EtH _ (ZMod (ℓ ^ n)) i),
          EtH.pullbackIG1 (Igusa.toMantovan N X m) (ZMod (ℓ ^ n)) i y = x) ∧
      (∀ (m : ℕ) (y : EtH (MantovanIgusaVariety N X m) (ZMod (ℓ ^ n)) i),
          EtH.pullbackIG1 (Igusa.toMantovan N X m) (ZMod (ℓ ^ n)) i y = 0 →
          ∃ e, EtH.pullbackIG1 (MantovanIgusa.transitionIter N X m e) (ZMod (ℓ ^ n)) i y = 0) ∧
      (∀ x : EtHc (IgusaVariety N X) (ZMod (ℓ ^ n)) i, ∃ (m : ℕ) (y : EtHc _ (ZMod (ℓ ^ n)) i),
          EtHc.pullbackIG1 (Igusa.toMantovan N X m) (ZMod (ℓ ^ n)) i y = x) ∧
      (∀ (m : ℕ) (y : EtHc (MantovanIgusaVariety N X m) (ZMod (ℓ ^ n)) i),
          EtHc.pullbackIG1 (Igusa.toMantovan N X m) (ZMod (ℓ ^ n)) i y = 0 →
          ∃ e, EtHc.pullbackIG1 (MantovanIgusa.transitionIter N X m e) (ZMod (ℓ ^ n)) i y = 0)) ∧
    (∀ j : MantovanIgusa.jMonoid X,
      Igusa.toMantovanPro N X ≫ MantovanIgusa.monoidAction N X j =
        (Igusa.jAction N X (j : JGroup (X.newtonClass))).hom ≫ Igusa.toMantovanPro N X) :=
  sorry

/-- (IG.1/igusa-faithfully-flat; CS17 Cor. 4.3.9) For completely slope divisible `X_b`,
`Ig^b → C^b` is faithfully flat, hence an fpqc torsor under the group scheme `Aut(X_b)`; this
group scheme is not reduced as soon as `X_b` is not isoclinic, so the torsor differs from the
pro-étale `Γ_X`-torsor over `(C^b)_perf`. -/
theorem igusaFaithfullyFlat [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (c : SlopeFiltration X.pdiv) :
    Flat (IgusaVariety.toLeaf N X) ∧ Surjective (IgusaVariety.toLeaf N X) ∧
      IsFpqcTorsorIG1 (IgusaVariety.toLeaf N X) (CentralLeaf.toPtIG1 N X)
        (AutSchemeIG1.toPt X) (Igusa.autAct N X) ∧
      (2 ≤ c.r → ¬ IsReduced (AutSchemeIG1 X)) := sorry

end Mantovan

/-! ### IG.1/igusa-group-actions -/

section Tower

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- (IG.1/igusa-group-actions) The Igusa tower at infinite prime-to-`p` level
`Ig^b_∞ = lim_{K^p} Ig^b_{K^p}` (data carrier; the finite levels are the prelude's
`IgusaVariety N X`). -/
def IgusaTower (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

namespace IgusaTower

/-- The projection `Ig^b_∞ → Ig^b_{K(N)}`. -/
def proj (N : ℕ) (X : PDivGStructure D p (pt k)) : IgusaTower X ⟶ IgusaVariety N X := sorry

/-- The projection `Ig^b_∞ → Ig^b_{Mant,K(N),m}` to a finite Mantovan level. -/
def projMant (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    IgusaTower X ⟶ MantovanIgusaVariety N X m :=
  proj N X ≫ Igusa.toMantovan N X m

/-- The transition `Ig^b_{K(N)} → Ig^b_{K(N')}` for `N' ∣ N`. -/
def transitionIG1 (X : PDivGStructure D p (pt k)) {N N' : ℕ} (h : N' ∣ N) :
    IgusaVariety N X ⟶ IgusaVariety N' X := sorry

/-- (IG.1/igusa-group-actions) The action of `J_b(ℚ_p) × G(𝔸_f^p)` on `Ig^b_∞`; being a
monoid homomorphism into the automorphism group, it satisfies `(gh)·x = g·(h·x)`, `1·x = x`. -/
def action (X : PDivGStructure D p (pt k)) :
    JGroup (X.newtonClass) × GAfp D p →* Aut (IgusaTower X) := sorry

/-- (IG.1/igusa-group-actions) Openness of stabilizers at finite level: the stabilizer in
`J_b(ℚ_p) × G(𝔸_f^p)` of each finite-level projection `Ig^b_∞ → Ig^b_{Mant,K(N),m}` is open
(it contains `ker(Γ_X → Γ_{m,X}) × K^p(N)`). Read literally for individual points of
`Ig^b_∞` the statement is false (point stabilizers are discrete); this is the form used for
smoothness of the cohomology. -/
theorem stabilizer_open [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ) :
    IsOpen {g : JGroup (X.newtonClass) × GAfp D p |
      (action X g).hom ≫ projMant N X m = projMant N X m} := sorry

/-- (IG.1/igusa-group-actions) `Ig^b_{K(N)} = Ig^b_∞ / K^p(N)`: the projection is
`K^p(N)`-invariant and is the categorical quotient. -/
theorem levelQuotient [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k)) [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    (∀ g ∈ levelSubgroupIG1 D p N, (action X (1, g)).hom ≫ proj N X = proj N X) ∧
      ∀ (T : Scheme.{u}) (f : IgusaTower X ⟶ T),
        (∀ g ∈ levelSubgroupIG1 D p N, (action X (1, g)).hom ≫ f = f) →
        ∃! f' : IgusaVariety N X ⟶ T, proj N X ≫ f' = f := sorry

/-- The diagonal embedding of the scalars `ℚ^×` into `J_b(ℚ_p) × G(𝔸_f^p)` (local carrier). -/
def globalEmbedding (X : PDivGStructure D p (pt k)) :
    ℚˣ →* JGroup (X.newtonClass) × GAfp D p := sorry

/-- (IG.1/igusa-group-actions) `ℤ[1/p]^× = {±p^e}`, embedded diagonally, acts trivially on
`Ig^b_∞`. -/
theorem globalUnits_trivial [Fact p.Prime] [CharP k p]
    (X : PDivGStructure D p (pt k)) (x : ℚˣ)
    (hx : ∃ (s : ℤˣ) (e : ℤ), (x : ℚ) = (s : ℚ) * (p : ℚ) ^ e) :
    action X (globalEmbedding X x) = 1 := sorry

end IgusaTower

/-- The special fibre at infinite prime-to-`p` level `lim_N S_{K(N),k}` with its
`G(𝔸_f^p)`-action (owner: `IG.0/integral-model`, Hecke action; local carrier). -/
def ShimuraTowerIG1 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] : Scheme.{u} :=
  sorry

/-- The projection to level `K(N)`. -/
def ShimuraTowerIG1.proj (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    ShimuraTowerIG1 D p k ⟶ SpecialFibre D p k N := sorry

/-- The prime-to-`p` Hecke action on the tower. -/
def ShimuraTowerIG1.action (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] :
    GAfp D p →* Aut (ShimuraTowerIG1 D p k) := sorry

/-- The map `Ig^b_∞ → C^b_∞ ⊂ S_{∞,k}`. -/
def IgusaTower.toShimura (X : PDivGStructure D p (pt k)) :
    IgusaTower X ⟶ ShimuraTowerIG1 D p k := sorry

/-- (IG.1/igusa-group-actions) The `G(𝔸_f^p)`-action on `Ig^b_∞` is compatible with the
prime-to-`p` Hecke action on `S_k` under `Ig^b → C^b ⊂ S_{K,k}`. -/
theorem IgusaTower.hecke_compat [Fact p.Prime] [CharP k p]
    (X : PDivGStructure D p (pt k)) :
    (∀ g : GAfp D p, (IgusaTower.action X (1, g)).hom ≫ IgusaTower.toShimura X =
      IgusaTower.toShimura X ≫ (ShimuraTowerIG1.action D p k g).hom) ∧
    ∀ N : ℕ, IgusaTower.toShimura X ≫ ShimuraTowerIG1.proj D p k N =
      IgusaTower.proj N X ≫ IgusaVariety.toLeaf N X ≫ CentralLeaf.ι N X := sorry

/-- The Galois action of `K^p(N') / K^p(N)` on the transition `Ig^b_{K(N)} → Ig^b_{K(N')}`
(local carrier). -/
def IgusaTower.transitionActionIG1 (X : PDivGStructure D p (pt k)) {N N' : ℕ} (h : N' ∣ N)
    [((levelSubgroupIG1 D p N).subgroupOf (levelSubgroupIG1 D p N')).Normal] :
    (levelSubgroupIG1 D p N' ⧸ (levelSubgroupIG1 D p N).subgroupOf (levelSubgroupIG1 D p N')) →*
      Aut (Over.mk (IgusaTower.transitionIG1 X h)) := sorry

-- test: IgusaTower.ordinary_J — for b ordinary, J_b(ℚ_p) ≅ GL_n(F ⊗ ℚ_p) × ℚ_p^× (Levi of the Siegel parabolic)
example [Fact p.Prime] :
    Nonempty (JGroup (KottwitzSet.ordinary D p) ≃* (Matrix.GeneralLinearGroup (Fin D.n)
    (TensorProduct ℚ D.F ℚ_[p]) ×
      ℚ_[p]ˣ)) := sorry

-- test: IgusaTower.trivial_level — for K(N) normal in K(N'), Ig_{K(N)} → Ig_{K(N')} is finite étale Galois with group K(N')/K(N); identity for N = N'
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k)) (N N' : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] [Fact (3 ≤ N')] [Fact (¬ (p : ℤ)
    ∣ N' * NumberField.discr D.F)] (h : N' ∣ N)
    [((levelSubgroupIG1 D p N).subgroupOf (levelSubgroupIG1 D p N')).Normal] :
    IsGaloisCoverIG1 (IgusaTower.transitionIG1 X h)
        (levelSubgroupIG1 D p N' ⧸ (levelSubgroupIG1 D p N).subgroupOf (levelSubgroupIG1 D p N'))
        (IgusaTower.transitionActionIG1 X h) ∧
      IgusaTower.transitionIG1 X (dvd_refl N) = 𝟙 _ := sorry

-- test: IgusaTower.not_free — the diagonal scalar (p, p) ≠ 1 fixes every point of Ig^b_∞
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    (hp : (p : ℚ) ≠ 0) :
    IgusaTower.globalEmbedding X (Units.mk0 (p : ℚ) hp) ≠ 1 ∧
      ∀ y : pt k ⟶ IgusaTower X,
        y ≫ (IgusaTower.action X (IgusaTower.globalEmbedding X (Units.mk0 (p : ℚ) hp))).hom = y :=
  sorry

end Tower

/-! ### IG.1/igusa-cohomology -/

section Cohomology

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

namespace IgusaCohomology

/-- (IG.1/igusa-cohomology) A complex representing
`RΓ_c(Ig^b_∞, Λ) := colim_{K^p, m} RΓ_c(Ig^b_{Mant,K^p,m}, Λ)` (filtered colimit along the
pullbacks by the finite étale transition maps; for `ℤ_ℓ, ℚ_ℓ` the derived limit over torsion
coefficients is taken first at each finite level). Data carrier. -/
def compactSupport (X : PDivGStructure D p (pt k)) (Λ : Type) [CommRing Λ] :
    CochainComplex (ModuleCat.{0} Λ) ℤ := sorry

/-- (IG.1/igusa-cohomology) A complex representing `RΓ(Ig^b_∞, Λ)` (same colimit, ordinary
cohomology). -/
def ordinary (X : PDivGStructure D p (pt k)) (Λ : Type) [CommRing Λ] :
    CochainComplex (ModuleCat.{0} Λ) ℤ := sorry

/-- The action of `J_b(ℚ_p) × G(𝔸_f^p)` on `RΓ_c(Ig^b_∞, Λ)`. -/
def actionC (X : PDivGStructure D p (pt k)) (Λ : Type) [CommRing Λ] :
    JGroup (X.newtonClass) × GAfp D p →* Aut (compactSupport X Λ) := sorry

/-- The action of `J_b(ℚ_p) × G(𝔸_f^p)` on `RΓ(Ig^b_∞, Λ)`. -/
def actionO (X : PDivGStructure D p (pt k)) (Λ : Type) [CommRing Λ] :
    JGroup (X.newtonClass) × GAfp D p →* Aut (ordinary X Λ) := sorry

end IgusaCohomology

/-- A complex of smooth representations: a group `G` acting on a cochain complex of
`Λ`-modules such that every element of every term has an open stabilizer (local stand-in for
SmoothRepresentations SR). -/
class IsSmoothComplexIG1 {Λ : Type} [CommRing Λ] {G : Type} [Group G] [TopologicalSpace G]
    {K : CochainComplex (ModuleCat.{0} Λ) ℤ} (ρ : G →* Aut K) : Prop where
  isOpen_stabilizer : ∀ (j : ℤ) (v : K.X j), IsOpen {g : G | ((ρ g).hom.f j).hom v = v}

namespace IgusaCohomology

/-- (IG.1/igusa-cohomology) `RΓ_c(Ig^b_∞, Λ)` is a complex of smooth
`Λ[J_b(ℚ_p) × G(𝔸_f^p)]`-modules. -/
instance smooth [Fact p.Prime] [CharP k p] {X : PDivGStructure D p (pt k)}
    [Fact (IsCompletelySlopeDivisible X.pdiv)] {Λ : Type} [CommRing Λ] [Fact (IsUnit (p : Λ))] :
    IsSmoothComplexIG1 (actionC X Λ) := sorry

/-- `RΓ(Ig^b_∞, Λ)` is a complex of smooth `Λ[J_b(ℚ_p) × G(𝔸_f^p)]`-modules. -/
instance smooth_ordinary [Fact p.Prime] [CharP k p]
    {X : PDivGStructure D p (pt k)} [Fact (IsCompletelySlopeDivisible X.pdiv)]
    {Λ : Type} [CommRing Λ]
    [Fact (IsUnit (p : Λ))] : IsSmoothComplexIG1 (actionO X Λ) := sorry

/-- (IG.1/igusa-cohomology) At each finite level, `H^i_c(Ig^b_{Mant,K(N),m}, Λ)` is finitely
generated over the finite ring `Λ` and vanishes for `i > 2 d_b`. -/
theorem finite_level [Fact p.Prime] [CharP k p] (N : ℕ)
    (X : PDivGStructure D p (pt k))
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ)
    (Λ : Type) [CommRing Λ] [Finite Λ] (hΛ : IsUnit (p : Λ)) (i : ℕ) :
    Module.Finite Λ (EtHc (MantovanIgusaVariety N X m) Λ i) ∧
      (2 * X.newtonClass.dimLeaf < i →
        Subsingleton (EtHc (MantovanIgusaVariety N X m) Λ i)) := sorry

/-- (IG.1/igusa-cohomology) Change of coefficients:
`RΓ_c(·, ℤ/ℓ^n) ⊗^L_{ℤ/ℓ^n} 𝔽_ℓ ≅ RΓ_c(·, 𝔽_ℓ)`. Stated with a representative by flat
`ℤ/ℓ^n`-modules (so the derived tensor product is the termwise one) and a quasi-isomorphism;
the equivariance is not recorded. -/
theorem changeCoeff [Fact p.Prime] [CharP k p]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (ℓ n : ℕ)
    [Fact ℓ.Prime] (hℓ : ℓ ≠ p)
    (hn : n ≠ 0) :
    (∀ j, Module.Flat (ZMod (ℓ ^ n)) ((compactSupport X (ZMod (ℓ ^ n))).X j)) ∧
      ∃ f : ((ModuleCat.extendScalars (ZMod.castHom (dvd_pow_self ℓ hn)
      (ZMod ℓ))).mapHomologicalComplex
          (ComplexShape.up ℤ)).obj (compactSupport X (ZMod (ℓ ^ n))) ⟶ compactSupport X (ZMod ℓ),
        QuasiIso f := sorry

/-- (IG.1/igusa-cohomology) The Hecke algebra `𝕋^S` acting on `H^i_c(Ig^b_{K(N)}, 𝔽_ℓ)` (the
prelude's module structure on `IgusaCohC`, through the `G(𝔸_f^S)`-action). -/
def heckeAction (N : ℕ) (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    HeckeAlgebra D S →+* AddMonoid.End (IgusaCohC N X ℓ i) :=
  Module.toAddMonoidEnd (HeckeAlgebra D S) (IgusaCohC N X ℓ i)

/-- The transition map `H^i_c(Ig^b_{K(N)}, 𝔽_ℓ) → H^i_c(Ig^b_{K(N')}, 𝔽_ℓ)` for `N ∣ N'`
(pullback along the finite étale level-change map; local carrier). -/
def levelMapIG1 (X : PDivGStructure D p (pt k)) {N N' : ℕ} (h : N ∣ N') (ℓ i : ℕ) :
    IgusaCohC N X ℓ i →+ IgusaCohC N' X ℓ i := sorry

/-- The `𝕋^S`-action is compatible with the transition maps when `S` contains the primes
dividing `N'`. -/
theorem heckeAction_levelMap [Fact p.Prime] [CharP k p]
    (X : PDivGStructure D p (pt k)) {N N' : ℕ} (h : N ∣ N') (S : Finset ℕ)
    (hS : ∀ q : ℕ, q.Prime → q ∣ p * N' → q ∈ S) (ℓ i : ℕ) (t : HeckeAlgebra D S)
    (x : IgusaCohC N X ℓ i) :
    levelMapIG1 X h ℓ i (heckeAction N X S ℓ i t x) =
      heckeAction N' X S ℓ i t (levelMapIG1 X h ℓ i x) := sorry

/-- (IG.1/igusa-cohomology) The natural map `RΓ_c(Ig^b_∞, Λ) → RΓ(Ig^b_∞, Λ)`. -/
def forgetToCompact (X : PDivGStructure D p (pt k)) (Λ : Type) [CommRing Λ] :
    compactSupport X Λ ⟶ ordinary X Λ := sorry

/-- The forget-supports map is equivariant. -/
theorem forgetToCompact_equivariant (X : PDivGStructure D p (pt k)) (Λ : Type) [CommRing Λ]
    (g : JGroup (X.newtonClass) × GAfp D p) :
    (actionC X Λ g).hom ≫ forgetToCompact X Λ = forgetToCompact X Λ ≫ (actionO X Λ g).hom :=
  sorry

end IgusaCohomology

-- test: IgusaCohomology.basic_degree0 — for b basic, H^i_c(Ig^b, 𝔽_ℓ) = 0 for i ≠ 0 (the description of H^0_c as a smooth induction is not stated)
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (hb : X.newtonClass = KottwitzSet.basic D p) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p)
    (i : ℕ) (hi : i ≠ 0) : Subsingleton (IgusaCohC N X ℓ i) := sorry

-- test: IgusaCohomology.ordinary_top — for b ordinary, H^i_c(Ig^b_{Mant,K^p,m}, 𝔽_ℓ) = 0 for i > 2d
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (hb : X.newtonClass = KottwitzSet.ordinary D p)
    (m ℓ : ℕ)
    [Fact ℓ.Prime] (hℓ : ℓ ≠ p) (i : ℕ) (hi : 2 * D.dim < i) :
    Subsingleton (EtHc (MantovanIgusaVariety N X m) (ZMod ℓ) i) := sorry

-- test: IgusaCohomology.not_euler — an Euler characteristic does not determine the individual cohomology groups (toy form over 𝔽_ℓ)
example (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ K : CochainComplex (ModuleCat.{0} (ZMod ℓ)) ℤ,
      (∑ i ∈ Finset.range 2, (-1 : ℤ) ^ i * (Module.finrank (ZMod ℓ) (K.homology (i : ℤ)) : ℤ))
      = 0 ∧
        Nontrivial (K.homology 0) := sorry

-- test: IgusaCohomology.perfection_invariant — H^i(Ig^b, 𝔽_ℓ) of the perfect Igusa variety agrees with colim_m H^i(Ig^b_{Mant,m}, 𝔽_ℓ)
example [Fact p.Prime] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p) (i : ℕ) :
    Nonempty (EtH (IgusaVariety N X) (ZMod ℓ) i ≃+ IgusaCoh N X ℓ i) := sorry

-- test: IgusaTower.smooth_cohomology — every H^i_c(Ig^b_∞, 𝔽_ℓ) is a smooth J_b(ℚ_p) × G(𝔸_f^p)-representation
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p) (i : ℤ)
    (v : (IgusaCohomology.compactSupport X (ZMod ℓ)).homology i) :
    IsOpen {g : JGroup (X.newtonClass) × GAfp D p |
      (HomologicalComplex.homologyMap (IgusaCohomology.actionC X (ZMod ℓ) g).hom i).hom v = v} :=
  sorry

end Cohomology

/-! ### IG.1/alternating-igusa-cohomology -/

section Alternating

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- Irreducible smooth admissible `ℚ̄_ℓ`-representations of `G(𝔸_f^p) × J_b(ℚ_p)` (owner:
SmoothRepresentations SR; local carrier). -/
def IrrIG1 (b : KottwitzSet D p) (ℓ : ℕ) : Type := sorry

/-- The dimension of the `K`-invariants `π^K` (finite for admissible `π` and compact open
`K`). -/
def IrrIG1.invariantsDim {b : KottwitzSet D p} {ℓ : ℕ} (π : IrrIG1 b ℓ)
    (K : Subgroup (GAfp D p × JGroup b)) : Cardinal.{0} := sorry

/-- The Hecke algebra `C^∞_c(G(𝔸_f^p) × J_b(ℚ_p), ℚ̄_ℓ)` of test functions (owner:
SmoothRepresentations SR; local carrier). -/
def TestFunctionIG1 (b : KottwitzSet D p) (ℓ : ℕ) [Fact ℓ.Prime] : Type := sorry

instance (b : KottwitzSet D p) (ℓ : ℕ) [Fact ℓ.Prime] : AddCommGroup (TestFunctionIG1 b ℓ) :=
  sorry
instance (b : KottwitzSet D p) (ℓ : ℕ) [Fact ℓ.Prime] :
    Module (AlgebraicClosure ℚ_[ℓ]) (TestFunctionIG1 b ℓ) := sorry

/-- The trace distribution `φ ↦ tr(φ | π)` of an admissible irreducible representation. -/
def IrrIG1.trace {b : KottwitzSet D p} {ℓ : ℕ} [Fact ℓ.Prime] (π : IrrIG1 b ℓ) :
    TestFunctionIG1 b ℓ →ₗ[AlgebraicClosure ℚ_[ℓ]] AlgebraicClosure ℚ_[ℓ] := sorry

/-- The character `ψ_π : 𝕋^S → ℚ̄_ℓ` through which `𝕋^S` acts on `π^{K^S}` for `S`-unramified
`π`. -/
def IrrIG1.heckeCharacter {b : KottwitzSet D p} {ℓ : ℕ} [Fact ℓ.Prime] (π : IrrIG1 b ℓ)
    (S : Finset ℕ) : HeckeAlgebra D S →+* AlgebraicClosure ℚ_[ℓ] := sorry

/-- The hyperspecial subgroup `K^S = ∏_{q ∉ S} K_q ⊂ G(𝔸_f^p)` (local carrier). -/
def hyperspecialAwayIG1 (D : UnitarySimilitudeDatum) (p : ℕ) (S : Finset ℕ) :
    Subgroup (GAfp D p) := sorry

/-- The Grothendieck group `Groth(G(𝔸_f^p) × J_b(ℚ_p))`: possibly infinite formal sums
`Σ n_i π_i` of irreducibles (admissibility is the predicate `GrothIG1.IsAdmissible`). -/
abbrev GrothIG1 (b : KottwitzSet D p) (ℓ : ℕ) : Type := IrrIG1 b ℓ → ℤ

/-- Admissibility: for each compact open `K`, only finitely many constituents with `n_i ≠ 0`
have `π_i^K ≠ 0`. -/
def GrothIG1.IsAdmissible {b : KottwitzSet D p} {ℓ : ℕ} (c : GrothIG1 b ℓ) : Prop :=
  ∀ K : Subgroup (GAfp D p × JGroup b), IsOpen (K : Set (GAfp D p × JGroup b)) →
    IsCompact (K : Set (GAfp D p × JGroup b)) →
    Set.Finite {π : IrrIG1 b ℓ | c π ≠ 0 ∧ π.invariantsDim K ≠ 0}

/-- The trace `tr(φ | Σ n_i π_i) = Σ n_i tr(φ | π_i)` (a finite sum for admissible elements). -/
def GrothIG1.trace {b : KottwitzSet D p} {ℓ : ℕ} [Fact ℓ.Prime] (c : GrothIG1 b ℓ)
    (φ : TestFunctionIG1 b ℓ) : AlgebraicClosure ℚ_[ℓ] :=
  ∑ᶠ π : IrrIG1 b ℓ, (c π : AlgebraicClosure ℚ_[ℓ]) * π.trace φ

/-- The `S`-unramified part `π^{S-ur} = Σ_{π_i^{K^S} ≠ 0} n_i π_i`. -/
def GrothIG1.unramifiedPart {b : KottwitzSet D p} {ℓ : ℕ} (S : Finset ℕ) (c : GrothIG1 b ℓ) :
    GrothIG1 b ℓ :=
  fun π => if π.invariantsDim ((hyperspecialAwayIG1 D p S).prod ⊥) ≠ 0 then c π else 0

/-- The multiplicity of `π` in `lim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ)` (local carrier). -/
def IgusaCohomology.multiplicityIG1 (X : PDivGStructure D p (pt k)) (ℓ k' : ℕ)
    (π : IrrIG1 (X.newtonClass) ℓ) : ℕ := sorry

/-- The trace of `φ` on the admissible representation `lim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ)`
(local carrier). -/
def IgusaCohomology.traceDegreeIG1 (X : PDivGStructure D p (pt k)) (ℓ : ℕ) [Fact ℓ.Prime]
    (k' : ℕ) (φ : TestFunctionIG1 (X.newtonClass) ℓ) : AlgebraicClosure ℚ_[ℓ] := sorry

/-- (IG.1/alternating-igusa-cohomology; CS17 §5.2) The alternating Igusa cohomology
`[H_c(Ig^b, ℚ̄_ℓ)] = Σ_k (−1)^k lim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ)` in
`Groth(G(𝔸_f^p) × J_b(ℚ_p))` (the cohomology vanishes for `k > 2 d_b`). -/
def AltIgusaCohomology (X : PDivGStructure D p (pt k)) (ℓ : ℕ) :
    GrothIG1 (X.newtonClass) ℓ :=
  fun π => ∑ k' ∈ Finset.range (2 * X.newtonClass.dimLeaf + 1),
    (-1 : ℤ) ^ k' * (IgusaCohomology.multiplicityIG1 X ℓ k' π : ℤ)

namespace AltIgusaCohomology

/-- (IG.1/alternating-igusa-cohomology) `[H_c(Ig^b, ℚ̄_ℓ)]` is admissible. -/
theorem admissible [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p) :
    GrothIG1.IsAdmissible (AltIgusaCohomology X ℓ) := sorry

/-- (IG.1/alternating-igusa-cohomology) `tr(φ | [H_c]) = Σ_k (−1)^k tr(φ | H^k_c)`. -/
theorem trace [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p)
    (φ : TestFunctionIG1 (X.newtonClass) ℓ) :
    GrothIG1.trace (AltIgusaCohomology X ℓ) φ =
      ∑ k' ∈ Finset.range (2 * X.newtonClass.dimLeaf + 1),
        (-1 : AlgebraicClosure ℚ_[ℓ]) ^ k' * IgusaCohomology.traceDegreeIG1 X ℓ k' φ := sorry

/-- (IG.1/alternating-igusa-cohomology) The `S`-unramified part `[H_c]^{S-ur}`; `𝕋^S` acts on
each of its constituents through the character `IrrIG1.heckeCharacter`. -/
def unramifiedPart (X : PDivGStructure D p (pt k)) (ℓ : ℕ) (S : Finset ℕ) :
    GrothIG1 (X.newtonClass) ℓ :=
  GrothIG1.unramifiedPart S (AltIgusaCohomology X ℓ)

/-- (IG.1/alternating-igusa-cohomology) Admissible elements of `Groth` are determined by their
traces. -/
theorem ext_trace {b : KottwitzSet D p} {ℓ : ℕ} [Fact ℓ.Prime] (c c' : GrothIG1 b ℓ)
    (hc : GrothIG1.IsAdmissible c) (hc' : GrothIG1.IsAdmissible c')
    (h : ∀ φ, GrothIG1.trace c φ = GrothIG1.trace c' φ) : c = c' := sorry

end AltIgusaCohomology

-- test: AltIgusaCohomology.basic — for b basic, [H_c(Ig^b)] = [H^0_c] is a genuine representation
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (hb : X.newtonClass = KottwitzSet.basic D p)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p)
    (π : IrrIG1 (X.newtonClass) ℓ) : 0 ≤ AltIgusaCohomology X ℓ π := sorry

-- test: AltIgusaCohomology.zero_test_function — tr(0 | [H_c]) = 0 and the trace is additive in φ
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ p) :
    GrothIG1.trace (AltIgusaCohomology X ℓ) 0 = 0 ∧
      ∀ φ ψ, GrothIG1.trace (AltIgusaCohomology X ℓ) (φ + ψ) =
        GrothIG1.trace (AltIgusaCohomology X ℓ) φ + GrothIG1.trace (AltIgusaCohomology X ℓ) ψ :=
  sorry

-- test: AltIgusaCohomology.cancellation — a constituent with equal multiplicity in H^k_c and H^{k+1}_c only cancels in [H_c]
example (X : PDivGStructure D p (pt k)) (ℓ : ℕ) (π : IrrIG1 (X.newtonClass) ℓ) (k' : ℕ)
    (hk : k' + 1 ≤ 2 * X.newtonClass.dimLeaf)
    (h : IgusaCohomology.multiplicityIG1 X ℓ k' π = IgusaCohomology.multiplicityIG1 X ℓ (k' + 1) π)
    (h' : ∀ j, j ≠ k' → j ≠ k' + 1 → IgusaCohomology.multiplicityIG1 X ℓ j π = 0) :
    AltIgusaCohomology X ℓ π = 0 := sorry

end Alternating

/-! ### IG.1/harris-taylor-igusa-varieties, IG.1/refined-strata-closures-smooth -/

section HarrisTaylor

/-! The Harris–Taylor datum `HTDatum`, its special fibres `Y_m`, the strata `DrinfeldStratum`
(with reduced subschemes `DrinfeldStratum.scheme`) and the refined strata `RefinedStratum` are
`IG.0`'s. -/

/-- The structure map `I_{m,j} → Y°_{0,j}` of the Harris–Taylor Igusa variety of the first
kind (data carrier for the scheme). -/
def IgusaFirstKind.space (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) : Scheme.{u} := sorry

/-- The map `I_{m,j} → Y°_{0,j}`. -/
def IgusaFirstKind.toStratum (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) :
    IgusaFirstKind.space E k m j ⟶ DrinfeldStratum.scheme E 0 k j := sorry

/-- (IG.1/harris-taylor-igusa-varieties) The Igusa variety of the first kind `I_{m,j} → Y°_{0,j}`
(`0 ≤ j ≤ n − 1`): level-`m` trivializations of the étale part of `A[u^{c,∞}]`,
of height `n−1−j` [HT01, §IV.1]. Trivializing the formal part of height `j+1` is the
additional Mantovan cover, not part of the first-kind variety (Li–Liu footnote 15). -/
def IgusaFirstKind (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) :
    Over (DrinfeldStratum.scheme E 0 k j) :=
  Over.mk (IgusaFirstKind.toStratum E k m j)

namespace IgusaFirstKind

/-- The structure map `I_{m,j} → Spec k`. -/
def toPt (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) : space E k m j ⟶ pt k :=
  toStratum E k m j ≫ DrinfeldStratum.ι E 0 k j ≫ E.toSpec 0 k

/-- The transition map `I_{m+1,j} → I_{m,j}`. -/
def transition (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) :
    space E k (m + 1) j ⟶ space E k m j := sorry

/-- (IG.1/harris-taylor-igusa-varieties) The transition maps are finite étale. -/
instance finiteEtale {E : HTDatum} {p : ℕ} {k : Type u} [Field k] [Fact p.Prime] [CharP k p]
    [IsAlgClosed k] {m j : ℕ} : IsFiniteEtaleIG1 (transition E k m j) := sorry

/-- (IG.1/harris-taylor-igusa-varieties) `Y°_{m,j}` is a finite disjoint union of copies of
`I_{m,j}`. -/
theorem stratum_decomp (E : HTDatum) (p : ℕ) (k : Type u) [Field k] [Fact p.Prime] [CharP k p]
    [IsAlgClosed k] (m j : ℕ) (hj : j < E.n) :
    ∃ r : ℕ, Nonempty (DrinfeldStratum.scheme E m k j ≅ ∐ (fun _ : Fin r => space E k m j)) := sorry

/-- Mantovan's Igusa variety `I^j_{Mant,m}` of the Harris–Taylor datum (local carrier;
`IG.1/mantovan-igusa-variety` for this datum). -/
def mantovanIG1 (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) : Scheme.{u} := sorry

/-- The transition maps of `I^j_{Mant,•}`. -/
def mantovanTransitionIG1 (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) :
    mantovanIG1 E k (m + 1) j ⟶ mantovanIG1 E k m j := sorry

/-- The covering map `I^j_{Mant,m} → I_{m,j}`. -/
def fromMantovan (E : HTDatum) (k : Type u) [Field k] (m j : ℕ) :
    mantovanIG1 E k m j ⟶ space E k m j := sorry

/-- The perfect Igusa variety `Ig_j` of the stratum (local carrier). -/
def perfectIG1 (E : HTDatum) (k : Type u) [Field k] (j : ℕ) : Scheme.{u} := sorry

/-- The maps `Ig_j → I^j_{Mant,m}`. -/
def perfectToMantovanIG1 (E : HTDatum) (k : Type u) [Field k] (j m : ℕ) :
    perfectIG1 E k j ⟶ mantovanIG1 E k m j := sorry

/-- (IG.1/harris-taylor-igusa-varieties) `I^j_{Mant,m} → I_{m,j}` is a finite surjective
(Galois) cover, and `Ig_j = (lim_m I^j_{Mant,m})_perf`: `Ig_j` is perfect and every compatible
family of maps from a perfect scheme lifts uniquely. The Galois group is not recorded. -/
theorem mantovanCover (E : HTDatum) (p : ℕ) (k : Type u) [Field k] [Fact p.Prime] [CharP k p]
    [IsAlgClosed k] (j : ℕ) (hj : j < E.n) :
    (∀ m, IsFinite (fromMantovan E k m j) ∧ Surjective (fromMantovan E k m j)) ∧
    PerfectSchemeIG1 p (perfectIG1 E k j) ∧
    (∀ m, perfectToMantovanIG1 E k j (m + 1) ≫ mantovanTransitionIG1 E k m j =
      perfectToMantovanIG1 E k j m) ∧
    ∀ (T : Scheme.{u}) [PerfectSchemeIG1 p T] (f : ∀ m, T ⟶ mantovanIG1 E k m j),
      (∀ m, f (m + 1) ≫ mantovanTransitionIG1 E k m j = f m) →
      ∃! y : T ⟶ perfectIG1 E k j, ∀ m, y ≫ perfectToMantovanIG1 E k j m = f m := sorry

end IgusaFirstKind

-- test: IgusaFirstKind.n_two_ordinary — for n = 2, j = 0, I_{m,0} is the Igusa curve of level m over the ordinary locus
example (E : HTDatum) (p : ℕ) (k : Type u) [Field k] [Fact p.Prime] [CharP k p] [IsAlgClosed k]
    (hn : E.n = 2) (m : ℕ) :
    IsFiniteEtaleIG1 (IgusaFirstKind.toStratum E k m 0) ∧
      SmoothOfRelativeDimension 1 (IgusaFirstKind.toPt E k m 0) := sorry

-- test: IgusaFirstKind.level_zero — I_{0,j} = Y°_{0,j}
example (E : HTDatum) (p : ℕ) (k : Type u) [Field k] [Fact p.Prime] [CharP k p] [IsAlgClosed k]
    (j : ℕ) (hj : j < E.n) : IsIso (IgusaFirstKind.toStratum E k 0 j) := sorry

-- test: IgusaFirstKind.not_perfect — for j < n − 1, I_{m,j} is smooth of positive dimension n − 1 − j, hence not perfect (it is not Ig_j)
example (E : HTDatum) (p : ℕ) (k : Type u) [Field k] [Fact p.Prime] [CharP k p] [IsAlgClosed k]
    (m j : ℕ) (hj : j + 1 < E.n) [Nonempty (IgusaFirstKind.space E k m j)] :
    SmoothOfRelativeDimension (E.n - 1 - j) (IgusaFirstKind.toPt E k m j) ∧
      ¬ PerfectSchemeIG1 p (IgusaFirstKind.space E k m j) := sorry

/-- (IG.1/refined-strata-closures-smooth; Mantovan [Man08, Prop. 12], Li–Liu II) For `m ≥ 1`,
`0 ≤ h ≤ n − 1` and `M ∈ 𝔖^h_m`, the closure `Y^[M]_m` (`IG.0`'s `RefinedStratum.closure`, with
its reduced structure) is smooth and proper over `k` of pure dimension `h`, and
`Y^(M)_m ≅ I^h_m` as `k`-schemes (not over `Y^(h)_0`). -/
theorem refinedStrataClosuresSmooth (E : HTDatum) (p : ℕ) (k : Type u) [Field k] [Fact p.Prime]
    [CharP k p] [IsAlgClosed k] (m h : ℕ) (hm : 1 ≤ m) (hh : h < E.n)
    (M : RefinedStratum.Index E m h) :
    SmoothOfRelativeDimension h
        (LCSubschemeIG2.ι (RefinedStratum.closure E m k h M) ≫ E.toSpec m k) ∧
      IsProper (LCSubschemeIG2.ι (RefinedStratum.closure E m k h M) ≫ E.toSpec m k) ∧
      ∃ e : LCSubschemeIG2 (RefinedStratum E m k h M) ≅ IgusaFirstKind.space E k m (E.n - 1 - h),
        e.hom ≫ IgusaFirstKind.toPt E k m (E.n - 1 - h) =
          LCSubschemeIG2.ι (RefinedStratum E m k h M) ≫ E.toSpec m k := sorry

end HarrisTaylor

end TauCeti.Igusa

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false
set_option linter.dupNamespace false

open CategoryTheory AlgebraicGeometry Limits

noncomputable section

namespace TauCeti.Igusa

universe u

/-! ## IG.2 — Partial compactifications and affineness -/

section IG2Carriers

/-- Cusp labels `Z = (Z_N, X)` at level `K(N)` (owner: ShimuraCompactifications C5; local
carrier), partially ordered by the closure relation of boundary strata. -/
def CuspLabelIG2 (D : UnitarySimilitudeDatum) (p N : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p N : ℕ) : PartialOrder (CuspLabelIG2 D p N) := sorry

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- The minimal compactification `S^*_{K(N),k}` (owner: ShimuraCompactifications; local
carrier). -/
def MinimalCompactIG2 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    Scheme.{u} := sorry

/-- The open immersion `S_k ↪ S^*_k`. -/
def MinimalCompactIG2.j (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    SpecialFibre D p k N ⟶ MinimalCompactIG2 D p k N := sorry

/-- The toroidal compactification `S^tor_{K(N),Σ,k}` for the fixed cone decomposition `Σ`
(owner: ShimuraCompactifications; local carrier). -/
def ToroidalCompactIG2 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    Scheme.{u} := sorry

/-- The open immersion `S_k ↪ S^tor_k`. -/
def ToroidalCompactIG2.j (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    SpecialFibre D p k N ⟶ ToroidalCompactIG2 D p k N := sorry

/-- The structure morphism `S^*_k → Spec k`. -/
def MinimalCompactIG2.toPt (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    MinimalCompactIG2 D p k N ⟶ pt k := sorry

/-- The structure morphism `S^tor_k → Spec k`. -/
def ToroidalCompactIG2.toPt (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    ToroidalCompactIG2 D p k N ⟶ pt k := sorry

/-- The proper surjection `π : S^tor_k → S^*_k`. -/
def ToroidalCompactIG2.pi (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    ToroidalCompactIG2 D p k N ⟶ MinimalCompactIG2 D p k N := sorry

/-- The boundary Shimura variety `S_{Z,k}` (for the unitary group with `n` replaced by `n − r`)
of a cusp label (local carrier). -/
def BoundaryShimuraIG2 (k : Type u) [Field k] {N : ℕ} (Z : CuspLabelIG2 D p N) : Scheme.{u} :=
  sorry

/-- The locally closed immersion of the stratum `S_{Z,k} ↪ S^*_k`. -/
def BoundaryShimuraIG2.ι (k : Type u) [Field k] {N : ℕ} (Z : CuspLabelIG2 D p N) :
    BoundaryShimuraIG2 k Z ⟶ MinimalCompactIG2 D p k N := sorry

/-- The point of a scheme hit by a morphism from `Spec` of a field. -/
def schemePointIG2 {C : Type u} [Field C] {Y : Scheme.{u}} (x : pt C ⟶ Y) : Y :=
  x.base (IsLocalRing.closedPoint C)

/-- The Raynaud degeneration of a point `x = (A, ι, λ, η) ∈ S_k(C)` (`C` complete algebraically
closed nonarchimedean over `k`): `some ⟨Z, π(x)⟩` if `x` degenerates into the cusp `Z`, with
`π(x) = (B, …) ∈ S_{Z,k}(C)` the abelian part of the Raynaud extension, `none` if `x` has good
reduction (owner: ShimuraCompactifications; local carrier). -/
def raynaudIG2 {N : ℕ} (C : Type u) [NontriviallyNormedField C] [IsUltrametricDist C]
    [CompleteSpace C] [IsAlgClosed C] [Algebra k C] (x : pt C ⟶ SpecialFibre D p k N) :
    Option (Σ Z : CuspLabelIG2 D p N, pt C ⟶ BoundaryShimuraIG2 k Z) := sorry

/-- A cone decomposition `Σ` (compatible family of smooth projective cone decompositions with
trivial stabilizers; owner: ShimuraCompactifications; local carrier). -/
def ConeDecompIG2 (D : UnitarySimilitudeDatum) (p N : ℕ) : Type := sorry

/-- The affine opens `Spf R` of the formal charts `𝔛°_σ` of the toroidal boundary for `Σ` along
the cusp `Z` (local carrier). -/
def BoundaryChartIG2 (k : Type u) [Field k] {N : ℕ} (cone : ConeDecompIG2 D p N)
    (Z : CuspLabelIG2 D p N) : Type := sorry

/-- The preimage `W⁰ ⊂ Spec R` of the interior of a chart. -/
def BoundaryChartIG2.interior {N : ℕ} {cone : ConeDecompIG2 D p N} {Z : CuspLabelIG2 D p N}
    (w : BoundaryChartIG2 k cone Z) : Scheme.{u} := sorry

/-- The map `W⁰ → S_k`. -/
def BoundaryChartIG2.toS {N : ℕ} {cone : ConeDecompIG2 D p N} {Z : CuspLabelIG2 D p N}
    (w : BoundaryChartIG2 k cone Z) : w.interior ⟶ SpecialFibre D p k N := sorry

/-- The map `W⁰ → S_{Z,k}`. -/
def BoundaryChartIG2.toSZ {N : ℕ} {cone : ConeDecompIG2 D p N} {Z : CuspLabelIG2 D p N}
    (w : BoundaryChartIG2 k cone Z) : w.interior ⟶ BoundaryShimuraIG2 k Z := sorry

/-- The image `T_c(Y) = c₂(c₁⁻¹(Y))` of a subset under a correspondence `X ← Z → X`. -/
def SchemeCorrespondence.imageIG2 {X : Scheme.{u}} (c : SchemeCorrespondence X) (Y : Set X) :
    Set X :=
  c.right.base '' (c.left.base ⁻¹' Y)

/-- The source of the extension to `S^*_k` of the prime-to-`p` Hecke correspondence `[g]`
(`IG.0`'s `SpecialFibre.hecke`); its legs are finite but not étale at the boundary (local
carrier). -/
def MinimalCompactIG2.heckeSrcIG2 (k : Type u) [Field k] (N : ℕ) (g : GAfp D p) : Scheme.{u} :=
  sorry

/-- The first leg of the extended Hecke correspondence. -/
def MinimalCompactIG2.heckeLeftIG2 (k : Type u) [Field k] (N : ℕ) (g : GAfp D p) :
    MinimalCompactIG2.heckeSrcIG2 (D := D) k N g ⟶ MinimalCompactIG2 D p k N := sorry

/-- The second leg of the extended Hecke correspondence. -/
def MinimalCompactIG2.heckeRightIG2 (k : Type u) [Field k] (N : ℕ) (g : GAfp D p) :
    MinimalCompactIG2.heckeSrcIG2 (D := D) k N g ⟶ MinimalCompactIG2 D p k N := sorry

/-- The étale part `X^{ét}` of a p-divisible group (owner: FiniteFlatGroups R07; local
carrier). -/
def PDivGroup.etalePartIG2 {S : Scheme.{u}} (G : PDivGroup p S) : PDivGroup p S := sorry

/-- The multiplicative part `X^μ` of a p-divisible group (local carrier). -/
def PDivGroup.multPartIG2 {S : Scheme.{u}} (G : PDivGroup p S) : PDivGroup p S := sorry

/-- The connected part `X° = X^μ ⊕ X^{(0,1)}` (over a perfect field) (local carrier). -/
def PDivGroup.connectedPartIG2 {S : Scheme.{u}} (G : PDivGroup p S) : PDivGroup p S := sorry

/-- Formal schemes (owner: SchemeAndStackFoundations / AdicSpaces; local carrier), used for
formal completions along boundary strata. -/
def FormalSchemeIG2 : Type (u + 1) := sorry

instance : Category.{u} FormalSchemeIG2.{u} := sorry

/-- A proper surjective morphism. -/
class IsProperSurjectiveIG2 {X Y : Scheme.{u}} (f : X ⟶ Y) : Prop where
  proper : IsProper f
  surjective : Surjective f

/-- A finite surjective morphism. -/
class IsFiniteSurjectiveIG2 {X Y : Scheme.{u}} (f : X ⟶ Y) : Prop where
  finite : IsFinite f
  surjective : Surjective f

/-- A normal scheme: all local rings are integrally closed domains. -/
class IsNormalSchemeIG2 (X : Scheme.{u}) : Prop where
  isDomain : ∀ x : X, IsDomain (X.presheaf.stalk x)
  isIntegrallyClosed : ∀ x : X, IsIntegrallyClosed (X.presheaf.stalk x)

end IG2Carriers

/-! ### IG.2/well-positioned-subscheme -/

section WellPositioned

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] {N : ℕ}

/-- (IG.2/well-positioned-subscheme; CSnc Def. 3.1.1, Lan–Stroh Def. 2.2.1) A well-positioned
locally closed subset `Y ⊆ S_k`, with its boundary data `Y^♮ = {Y^♮_Z}`: each `Y^♮_Z` is
locally closed in `S_{Z,k}`, and a point `x ∈ S_k(C)` degenerating into the cusp `Z` lies in
`Y` iff `π(x) ∈ Y^♮_Z`. -/
structure IsWellPositioned (Y : Set (SpecialFibre D p k N)) where
  isLocallyClosed : IsLocallyClosed Y
  /-- The boundary data `Y^♮_Z ⊆ S_{Z,k}`. -/
  boundary : ∀ Z : CuspLabelIG2 D p N, Set (BoundaryShimuraIG2 k Z)
  boundary_isLocallyClosed : ∀ Z, IsLocallyClosed (boundary Z)
  degen : ∀ (C : Type u) [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C]
    [IsAlgClosed C] [Algebra k C] (x : pt C ⟶ SpecialFibre D p k N)
    (Z : CuspLabelIG2 D p N) (b : pt C ⟶ BoundaryShimuraIG2 k Z),
    raynaudIG2 C x = some ⟨Z, b⟩ → (schemePointIG2 x ∈ Y ↔ schemePointIG2 b ∈ boundary Z)

namespace IsWellPositioned

/-- (IG.2/well-positioned-subscheme) The boundary data `Y^♮_Z ⊂ S_{Z,k}`. -/
def boundaryData {Y : Set (SpecialFibre D p k N)} (hY : IsWellPositioned Y)
    (Z : CuspLabelIG2 D p N) : Set (BoundaryShimuraIG2 k Z) := hY.boundary Z

/-- The boundary data are uniquely determined by `Y`. -/
theorem boundaryData_unique {Y : Set (SpecialFibre D p k N)}
    (hY hY' : IsWellPositioned Y) : hY.boundaryData = hY'.boundaryData := sorry

end IsWellPositioned

/-- Lan–Stroh's chart condition for the cone decomposition `Σ`: `Y` is locally closed and
there are locally closed `Y^♮_Z` with `Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰` for all affine charts. -/
def IsWellPositionedChartIG2 (cone : ConeDecompIG2 D p N) (Y : Set (SpecialFibre D p k N)) :
    Prop :=
  IsLocallyClosed Y ∧ ∃ B : ∀ Z : CuspLabelIG2 D p N, Set (BoundaryShimuraIG2 k Z),
    (∀ Z, IsLocallyClosed (B Z)) ∧
    ∀ (Z : CuspLabelIG2 D p N) (w : BoundaryChartIG2 k cone Z),
      w.toS.base ⁻¹' Y = w.toSZ.base ⁻¹' B Z

/-- (IG.2/well-positioned-subscheme) Well-positionedness is Lan–Stroh's chart condition. -/
theorem isWellPositioned_iff_chart (cone : ConeDecompIG2 D p N)
    (Y : Set (SpecialFibre D p k N)) :
    Nonempty (IsWellPositioned Y) ↔ IsWellPositionedChartIG2 cone Y := sorry

/-- (IG.2/well-positioned-subscheme) The notion does not depend on `Σ`. -/
theorem IsWellPositioned.indep_cone (cone cone' : ConeDecompIG2 D p N)
    (Y : Set (SpecialFibre D p k N)) :
    IsWellPositionedChartIG2 cone Y ↔ IsWellPositionedChartIG2 cone' Y := sorry

/-- (IG.2/well-positioned-subscheme) Images of well-positioned subsets under the prime-to-`p`
Hecke correspondences `[g]` (`IG.0`'s `SpecialFibre.hecke`) are well-positioned. -/
def IsWellPositioned.hecke (g : GAfp D p) {Y : Set (SpecialFibre D p k N)}
    (hY : IsWellPositioned Y) :
    IsWellPositioned ((SpecialFibre.hecke D p k N g).imageIG2 Y) := sorry

/-- (IG.2/well-positioned-subscheme) The closure of a well-positioned `Y` and the complement
`Y₀ = closure Y \ Y` are well-positioned. -/
theorem IsWellPositioned.closure {Y : Set (SpecialFibre D p k N)}
    (hY : IsWellPositioned Y) :
    Nonempty (IsWellPositioned (_root_.closure Y)) ∧
      Nonempty (IsWellPositioned (_root_.closure Y \ Y)) := sorry

end WellPositioned

-- test: IsWellPositioned.univ — S_k is well-positioned with Y^♮_Z = S_{Z,k}
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] (N : ℕ) :
    ∃ h : IsWellPositioned (Set.univ : Set (SpecialFibre D p k N)),
      ∀ Z, h.boundaryData Z = Set.univ := sorry

-- test: IsWellPositioned.empty — ∅ is well-positioned with all Y^♮_Z empty
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] (N : ℕ) :
    ∃ h : IsWellPositioned (∅ : Set (SpecialFibre D p k N)), ∀ Z, h.boundaryData Z = ∅ := sorry

/-- The ordinary locus of the boundary Shimura variety `S_{Z,k}` (local carrier). -/
def BoundaryShimuraIG2.ordinaryLocus {D : UnitarySimilitudeDatum} {p : ℕ} (k : Type u) [Field k]
    {N : ℕ} (Z : CuspLabelIG2 D p N) : Set (BoundaryShimuraIG2 k Z) := sorry

-- test: IsWellPositioned.ordinary — the ordinary locus is well-positioned with Y^♮_Z the ordinary locus of S_{Z,k}
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    ∃ h : IsWellPositioned (newtonStratum D p k N (KottwitzSet.ordinary D p)),
      ∀ Z, h.boundaryData Z = BoundaryShimuraIG2.ordinaryLocus k Z := sorry

-- test: IsWellPositioned.not_point — n = 1, [F⁺:ℚ] = 2: a closed curve whose closure in S^* meets a cusp is not well-positioned
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (hn : D.n = 1)
    (hF : Module.finrank ℚ (NumberField.maximalRealSubfield D.F) = 2)
    (Y : Set (SpecialFibre D p k N)) (hY : IsClosed Y) (hY' : interior Y = ∅)
    (Z : CuspLabelIG2 D p N)
    (hZ : (closure ((MinimalCompactIG2.j D p k N).base '' Y) ∩
      Set.range (BoundaryShimuraIG2.ι k Z).base).Nonempty) :
    IsEmpty (IsWellPositioned Y) := sorry

/-! ### IG.2/partial-compactifications, IG.2/lan-stroh-boundary-charts, IG.2/partial-minimal-closed -/

section Partial

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] {N : ℕ}

/-- The underlying set `Y^* = closure(Y) \ closure(Y₀)` (closures in `S^*_k`,
`Y₀ = closure Y \ Y`). -/
def partialMinimalSet (Y : Set (SpecialFibre D p k N)) : Set (MinimalCompactIG2 D p k N) :=
  closure ((MinimalCompactIG2.j D p k N).base '' Y) \
    closure ((MinimalCompactIG2.j D p k N).base '' (closure Y \ Y))

/-- The underlying set `Y^tor = closure(Y) \ closure(Y₀)` (closures in `S^tor_k`). -/
def partialToroidalSet (Y : Set (SpecialFibre D p k N)) : Set (ToroidalCompactIG2 D p k N) :=
  closure ((ToroidalCompactIG2.j D p k N).base '' Y) \
    closure ((ToroidalCompactIG2.j D p k N).base '' (closure Y \ Y))

/-- (IG.2/partial-compactifications; CSnc §3.1) The partial minimal compactification `Y^*`, the
locally closed subset `closure(Y) \ closure(Y₀)` of `S^*_k` with its reduced structure. -/
def partialMinimal (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) : Scheme.{u} :=
  LCSubschemeIG2 (partialMinimalSet Y)

/-- (IG.2/partial-compactifications) The partial toroidal compactification `Y^tor ⊂ S^tor_k`
with its reduced structure. -/
def partialToroidal (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) : Scheme.{u} :=
  LCSubschemeIG2 (partialToroidalSet Y)

/-- The restriction `Y^tor → Y^*` of `π : S^tor → S^*` (data carrier). -/
def partialToroidal.toMinimal (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) :
    partialToroidal Y hY ⟶ partialMinimal Y hY := sorry

/-- (IG.2/partial-compactifications) `Y^tor = π⁻¹(Y^*)`. -/
theorem partialToroidal_eq_preimage (Y : Set (SpecialFibre D p k N))
    (hY : IsWellPositioned Y) :
    partialToroidalSet Y = (ToroidalCompactIG2.pi D p k N).base ⁻¹' partialMinimalSet Y := sorry

/-- (IG.2/partial-compactifications) `Y^* ×_{S^*_k} S_{Z,k} = Y^♮_Z`. -/
@[simp] theorem partialMinimal_inter_boundary (Y : Set (SpecialFibre D p k N))
    (hY : IsWellPositioned Y) (Z : CuspLabelIG2 D p N) :
    (BoundaryShimuraIG2.ι k Z).base ⁻¹' partialMinimalSet Y = hY.boundaryData Z := sorry

/-- (IG.2/partial-compactifications) `Y^tor → Y^*` is proper and surjective. -/
instance partialToroidal_to_partialMinimal_proper
    {Y : Set (SpecialFibre D p k N)} {hY : IsWellPositioned Y} :
    IsProperSurjectiveIG2 (partialToroidal.toMinimal Y hY) := sorry

/-- (IG.2/partial-compactifications) Compatibility with prime-to-`p` Hecke correspondences: the
partial minimal compactification of `T_g(Y)` is the image of `Y^*` under the extension of `[g]`
to `S^*_k` (the compatibility with refinements of `Σ` is not recorded: `Σ` is fixed in the
carriers). -/
theorem partialCompactification_hecke (g : GAfp D p) (Y : Set (SpecialFibre D p k N))
    (hY : IsWellPositioned Y) :
    partialMinimalSet ((SpecialFibre.hecke D p k N g).imageIG2 Y) =
      (MinimalCompactIG2.heckeRightIG2 (D := D) k N g).base ''
        ((MinimalCompactIG2.heckeLeftIG2 (D := D) k N g).base ⁻¹' partialMinimalSet Y) := sorry

end Partial

-- test: partialMinimal_univ — (S_k)^* = S^*_k and (S_k)^tor = S^tor_k
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] (N : ℕ) :
    partialMinimalSet (Set.univ : Set (SpecialFibre D p k N)) = Set.univ ∧
      partialToroidalSet (Set.univ : Set (SpecialFibre D p k N)) = Set.univ := sorry

/-- Sections of `ω^{⊗a}` over the reduced closed subscheme `Y ⊂ S^*_k` (the Hodge line bundle
is ample on `S^*`; owner: ShimuraCompactifications; local carrier). -/
def HodgeSectionIG2 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ)
    (Y : Set (MinimalCompactIG2 D p k N)) (a : ℕ) : Type := sorry

/-- The non-vanishing locus of a section. -/
def HodgeSectionIG2.nonVanishing {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    {N : ℕ} {Y : Set (MinimalCompactIG2 D p k N)} {a : ℕ} (s : HodgeSectionIG2 D p k N Y a) :
    Set (MinimalCompactIG2 D p k N) := sorry

/-- The classical Hasse invariant `det(V : ω^{(p)} → ω)`, a section of `ω^{⊗(p−1)}` on
`S^*_k` (local carrier). -/
def hasseInvariantIG2 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    HodgeSectionIG2 D p k N Set.univ (p - 1) := sorry

-- test: partialMinimal_ordinary — for Y the ordinary locus, Y^* is the non-vanishing locus of the Hasse invariant on S^*_k
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    partialMinimalSet (newtonStratum D p k N (KottwitzSet.ordinary D p)) =
      (hasseInvariantIG2 D p k N).nonVanishing := sorry

-- test: partialMinimal_ne_closure — Y^* is not the closure of Y in S^*_k when Y₀ ≠ ∅
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] (N : ℕ)
    (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) (hY0 : (closure Y \ Y).Nonempty) :
    partialMinimalSet Y ≠ closure ((MinimalCompactIG2.j D p k N).base '' Y) := sorry

-- test: partialMinimal_compat_open — Y^* ∩ S_k = Y
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k] (N : ℕ)
    (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) :
    (MinimalCompactIG2.j D p k N).base ⁻¹' partialMinimalSet Y = Y := sorry

/-- The formal completion of `Y^tor` along its `Z`-stratum (local carrier). -/
def torCompletionIG2 {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] {N : ℕ}
    (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) (Z : CuspLabelIG2 D p N) :
    FormalSchemeIG2.{u} := sorry

/-- The `Γ_Z`-quotient of the completion of `Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z` along its toroidal
boundary `∂_{Z,Σ_Z} ×_{S_Z} Y^♮_Z` (local carrier). -/
def torBoundaryModelIG2 {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] {N : ℕ}
    (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) (Z : CuspLabelIG2 D p N) :
    FormalSchemeIG2.{u} := sorry

/-- (IG.2/lan-stroh-boundary-charts; Lan–Stroh Thm. 2.3.2) The completion of `Y^tor` along its
`Z`-stratum is (canonically) the `Γ_Z`-quotient of the completion of `Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z`
along its boundary; if `Y` is smooth over `k`, so is `Y^tor` (the regular case is not
recorded: no regularity predicate for schemes among the carriers). -/
theorem lanStrohBoundaryCharts {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    [IsAlgClosed k] [Fact p.Prime] [CharP k p] {N : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (Y : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) :
    (∀ Z : CuspLabelIG2 D p N, Nonempty (torCompletionIG2 Y hY Z ≅ torBoundaryModelIG2 Y hY Z)) ∧
      (Smooth (LCSubschemeIG2.ι Y ≫ SpecialFibre.toSpec D p k N) →
        Smooth (LCSubschemeIG2.ι (partialToroidalSet Y) ≫ ToroidalCompactIG2.toPt D p k N)) :=
  sorry

/-- (IG.2/partial-minimal-closed; CSnc Prop. 3.1.3) If `Y ⊂ Y'` are well-positioned with `Y`
closed in `Y'`, then `Y^*` is closed in `Y'^*` and `Y^♮_Z` is closed in `Y'^♮_Z`. -/
theorem partialMinimalClosed {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    [IsAlgClosed k] [Fact p.Prime] [CharP k p] {N : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (Y Y' : Set (SpecialFibre D p k N)) (hY : IsWellPositioned Y) (hY' : IsWellPositioned Y')
    (hsub : Y ⊆ Y') (hcl : IsClosed (Subtype.val ⁻¹' Y : Set Y')) :
    partialMinimalSet Y ⊆ partialMinimalSet Y' ∧
      IsClosed (Subtype.val ⁻¹' partialMinimalSet Y : Set (partialMinimalSet Y')) ∧
      ∀ Z : CuspLabelIG2 D p N, hY.boundaryData Z ⊆ hY'.boundaryData Z ∧
        IsClosed (Subtype.val ⁻¹' hY.boundaryData Z : Set (hY'.boundaryData Z)) := sorry

/-! ### IG.2/leaves-are-well-positioned, IG.2/connected-part-at-boundary -/

section Leaves

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- The central leaf `C^{X_Z}_Z ⊂ S_{Z,k}` of the boundary Shimura variety for the unique
`X_Z` with `X ≅ Hom(𝒳, μ_{p^∞}) ⊕ X_Z ⊕ 𝒳 ⊗ ℚ_p/ℤ_p`, or `∅` if no such `X_Z` exists (local
carrier). -/
def boundaryLeafIG2 {N : ℕ} (X : PDivGStructure D p (pt k)) (Z : CuspLabelIG2 D p N) :
    Set (BoundaryShimuraIG2 k Z) := sorry

/-- The well-positioned structure of the central leaf `C^X` (data carrier; its existence and
boundary data are `leavesAreWellPositioned`). -/
def leafWPIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    IsWellPositioned (centralLeaf D p k N X) := sorry

/-- The partial toroidal compactification `C^{X,tor}`. -/
def LeafToroidalIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) : Scheme.{u} :=
  partialToroidal _ (leafWPIG2 N X)

/-- The partial minimal compactification `C^{X,*}`. -/
def LeafMinimalIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) : Scheme.{u} :=
  partialMinimal _ (leafWPIG2 N X)

/-- The open immersion `C^X ↪ C^{X,tor}` (data carrier). -/
def leafToToroidalIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    CentralLeaf N X ⟶ LeafToroidalIG2 N X := sorry

/-- The open immersion `C^X ↪ C^{X,*}` (data carrier). -/
def leafToMinimalIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    CentralLeaf N X ⟶ LeafMinimalIG2 N X := sorry

/-- `C^{X,tor} → Spec k`. -/
def LeafToroidalIG2.toPt (N : ℕ) (X : PDivGStructure D p (pt k)) :
    LeafToroidalIG2 N X ⟶ pt k :=
  LCSubschemeIG2.ι (partialToroidalSet (centralLeaf D p k N X)) ≫
    ToroidalCompactIG2.toPt D p k N

/-- `C^{X,*} → Spec k`. -/
def LeafMinimalIG2.toPt (N : ℕ) (X : PDivGStructure D p (pt k)) : LeafMinimalIG2 N X ⟶ pt k :=
  LCSubschemeIG2.ι (partialMinimalSet (centralLeaf D p k N X)) ≫
    MinimalCompactIG2.toPt D p k N

/-- (IG.2/leaves-are-well-positioned; CSnc Prop. 3.1.4, Lemma 3.1.5) Every central leaf `C^X`
is well-positioned with boundary data the boundary central leaves `C^{X_Z}_Z` (or `∅`), and
`C^{X,tor}` is smooth over `k`. -/
theorem leavesAreWellPositioned [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (X : PDivGStructure D p (pt k)) :
    (∀ Z : CuspLabelIG2 D p N, (leafWPIG2 N X).boundaryData Z = boundaryLeafIG2 X Z) ∧
      Smooth (LeafToroidalIG2.toPt N X) := sorry

/-- The connected part `𝒜[p^∞]°` of the semi-abelian scheme over `C^{X,tor}` (local data
carrier; that it is a p-divisible group is part of `connectedPartAtBoundary`). -/
def connectedPartIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    PDivGroup p (LeafToroidalIG2 N X) := sorry

/-- The biconnected part `𝒜[p^∞]^{(0,1)} = 𝒜[p^∞]° / 𝒜[p^∞]^μ` over `C^{X,tor}`. -/
def biconnectedPartIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    PDivGroup p (LeafToroidalIG2 N X) := sorry

/-- (IG.2/connected-part-at-boundary; CSnc Props. 3.2.1–3.2.2) `𝒜[p^∞]°` is a p-divisible group
over `C^{X,tor}`, isomorphic at every geometric point to `X°`; its multiplicative part has
constant height; the biconnected part carries a principal polarization `𝒜^{(0,1)} ≅ (𝒜^{(0,1)})^∨`.
The `O_F`-actions are not recorded. -/
theorem connectedPartAtBoundary [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (X : PDivGStructure D p (pt k)) :
    (∀ (K : Type u) [Field K] [IsAlgClosed K] [Algebra k K] (x : pt K ⟶ LeafToroidalIG2 N X),
      x ≫ LeafToroidalIG2.toPt N X = Spec.map (CommRingCat.ofHom (algebraMap k K)) →
      Nonempty ((PDivGroup.baseChange x).obj (connectedPartIG2 N X) ≅
        (PDivGroup.baseChange (Spec.map (CommRingCat.ofHom (algebraMap k K)))).obj
          (PDivGroup.connectedPartIG2 (PDivGStructure.toPDivGroup.obj X)))) ∧
    (∀ (x y : pt k ⟶ LeafToroidalIG2 N X),
      ((PDivGroup.baseChange x).obj (PDivGroup.multPartIG2 (connectedPartIG2 N X))).height =
        ((PDivGroup.baseChange y).obj (PDivGroup.multPartIG2 (connectedPartIG2 N X))).height) ∧
    Nonempty (biconnectedPartIG2 N X ≅ PDivGroup.cartierDual (biconnectedPartIG2 N X)) := sorry

end Leaves

/-! ### IG.2/toroidal-igusa-finite-level -/

section ToroidalFinite

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

-- api: ToroidalIgusa — the scheme `Ig^{X,tor}_m` is the prelude's `ToroidalIgusa N X m`; its structure map and Galois action follow

namespace ToroidalIgusa

/-- (IG.2/toroidal-igusa-finite-level) The structure map `Ig^{X,tor}_m → C^{X,tor}`. -/
def toLeafTor (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    ToroidalIgusa N X m ⟶ LeafToroidalIG2 N X := sorry

/-- The Galois action of `Γ_{m,X}` over `C^{X,tor}`. -/
def galoisAction (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    GammaLevelIG1 X m →* Aut (Over.mk (toLeafTor N X m)) := sorry

/-- (IG.2/toroidal-igusa-finite-level; CSnc Thm. 3.2.4) `Ig^{X,tor}_m → C^{X,tor}` is a finite
étale Galois cover with group `Γ_{m,X}`. -/
instance isGaloisCover [Fact p.Prime] [CharP k p] {N : ℕ}
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X : PDivGStructure D p (pt k)} [Fact (IsCompletelySlopeDivisible X.pdiv)] {m : ℕ} :
    IsGaloisCoverIG1 (toLeafTor N X m) (GammaLevelIG1 X m) (galoisAction N X m) := sorry

/-- Igusa level-`p^m` structures on a `C^{X,tor}`-scheme `T`: isomorphisms
`ρ_{i,m} : 𝒜[p^∞]°_i[p^m] ×T ≅ X_i[p^m] × T` (for the slope pieces with `λ_i > 0`) commuting
with `O_F`, lifting fppf locally to all levels, with a common similitude scalar in
`(ℤ/p^m)^×(T)` (local carrier). -/
def levelStructuresIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ)
    (T : Over (LeafToroidalIG2 N X)) : Type u := sorry

/-- (IG.2/toroidal-igusa-finite-level; CSnc Def. 3.2.5) `Ig^{X,tor}_m` represents Igusa
level-`p^m` structures on `C^{X,tor}`-schemes. -/
def represents (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (T : Over (LeafToroidalIG2 N X)) :
    (T ⟶ Over.mk (toLeafTor N X m)) ≃ levelStructuresIG2 N X m T := sorry

/-- The open immersion `Ig^X_{Mant,m} ↪ Ig^{X,tor}_m`. -/
def fromMantovan (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MantovanIgusaVariety N X m ⟶ ToroidalIgusa N X m := sorry

/-- (IG.2/toroidal-igusa-finite-level) The restriction of `Ig^{X,tor}_m` to `C^X` is
`Ig^X_{Mant,m}`. -/
theorem restrict_open [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ) :
    IsPullback (fromMantovan N X m) (MantovanIgusa.toLeaf N X m) (toLeafTor N X m)
      (leafToToroidalIG2 N X) := sorry

/-- (IG.2/toroidal-igusa-finite-level) Uniqueness: any finite étale `W → C^{X,tor}` restricting
to `Ig^X_{Mant,m}` over `C^X` is isomorphic to `Ig^{X,tor}_m`, compatibly. -/
theorem unique [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ)
    (W : Scheme.{u})
    (f : W ⟶ LeafToroidalIG2 N X) [IsFiniteEtaleIG1 f] (i : MantovanIgusaVariety N X m ⟶ W)
    (hi : IsPullback i (MantovanIgusa.toLeaf N X m) f (leafToToroidalIG2 N X)) :
    ∃ e : W ≅ ToroidalIgusa N X m, e.hom ≫ toLeafTor N X m = f ∧ i ≫ e.hom = fromMantovan N X m :=
  sorry

/-- The completion of `Ig^{X,tor}_m` along its `Z`-stratum (local carrier). -/
def completionIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Z : CuspLabelIG2 D p N) :
    FormalSchemeIG2.{u} := sorry

/-- The quotient `𝔜_{Z,Σ_Z}/Γ_Z`, `𝔜_{Z,Σ_Z}` the completion along the boundary of the
`Γ_{m,X}`-torsor `Ig^X_{Z,Σ_Z} → Ξ_{Z,Σ_Z} ×_{S_Z} C^X_Z` of Igusa structures on the connected
part `H_Z` of the Raynaud extension (local carrier). -/
def boundaryModelIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Z : CuspLabelIG2 D p N) :
    FormalSchemeIG2.{u} := sorry

/-- (IG.2/toroidal-igusa-finite-level; CSnc Thm. 3.2.6) With the splitting of `Z_N` fixed, the
completion along the `Z`-stratum is `𝔜_{Z,Σ_Z}/Γ_Z`. -/
theorem boundaryChart [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ)
    (Z : CuspLabelIG2 D p N) :
    Nonempty (completionIG2 N X m Z ≅ boundaryModelIG2 N X m Z) := sorry

/-- (IG.2/toroidal-igusa-finite-level) The transition map `Ig^{X,tor}_{m+1} → Ig^{X,tor}_m`. -/
def transition (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    ToroidalIgusa N X (m + 1) ⟶ ToroidalIgusa N X m := sorry

/-- The transition maps are finite étale. -/
instance transition_isFiniteEtale [Fact p.Prime] [CharP k p] {N : ℕ}
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X : PDivGStructure D p (pt k)} [Fact (IsCompletelySlopeDivisible X.pdiv)] {m : ℕ} :
    IsFiniteEtaleIG1 (transition N X m) := sorry

/-- Trivializing all of `𝒜[p^m]` over `C^{X,tor}`: the moduli scheme with its map to
`C^{X,tor}` (local carrier for the non-example). -/
def wholeTorsionIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Scheme.{u} := sorry

/-- Its structure map. -/
def wholeTorsionIG2.toLeafTor (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    wholeTorsionIG2 N X m ⟶ LeafToroidalIG2 N X := sorry

end ToroidalIgusa

-- test: ToroidalIgusa.level_zero — Ig^{X,tor}_0 = C^{X,tor}
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    IsIso (ToroidalIgusa.toLeafTor N X 0) := sorry

-- test: ToroidalIgusa.no_etale_part — if X^ét = 0 then Ig^{X,tor}_m = Ig^X_{Mant,m}
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ)
    (hX : ∀ τ, X.etaleRank τ = 0) :
    IsIso (ToroidalIgusa.fromMantovan N X m) := sorry

-- test: ToroidalIgusa.ordinary_modular_curve — n = 1, F imaginary quadratic, b ordinary: Ig^{b,tor}_1 is a smooth curve finite étale over the ordinary locus with its cusps
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)]
    (hF : Module.finrank ℚ D.F = 2)
    (hn : D.n = 1) (hb : X.newtonClass = KottwitzSet.ordinary D p) :
    IsFiniteEtaleIG1 (ToroidalIgusa.toLeafTor N X 1) ∧
      SmoothOfRelativeDimension 1 (ToroidalIgusa.toLeafTor N X 1 ≫ LeafToroidalIG2.toPt N X) :=
  sorry

-- test: ToroidalIgusa.not_whole_torsion — trivializing all of 𝒜[p^m] (quasi-finite at the boundary) is not finite étale over C^{X,tor}
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) (m : ℕ) (hm : 1 ≤ m)
    (hX : ∃ τ, X.etaleRank τ ≠ 0)
    (hbd : (Set.range (leafToToroidalIG2 N X).base)ᶜ.Nonempty) :
    ¬ IsFiniteEtaleIG1 (ToroidalIgusa.wholeTorsionIG2.toLeafTor N X m) := sorry

end ToroidalFinite

/-! ### IG.2/perfect-toroidal-igusa-variety, IG.2/igusa-boundary-charts -/

section PerfectToroidal

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

-- api: PerfectToroidalIgusa — the scheme `Ig^{X,tor}` is the prelude's `PerfectToroidalIgusa N X`; its structure map and Γ_X-action follow

namespace PerfectToroidalIgusa

/-- (IG.2/perfect-toroidal-igusa-variety) The structure map `Ig^{X,tor} → C^{X,tor}` (it
factors through `C^{X,tor}_perf`; perfections of schemes are not among the carriers). -/
def toLeafTor (N : ℕ) (X : PDivGStructure D p (pt k)) :
    PerfectToroidalIgusa N X ⟶ LeafToroidalIG2 N X := sorry

/-- The action of `Γ_X` over `C^{X,tor}`. -/
def gammaAction (N : ℕ) (X : PDivGStructure D p (pt k)) :
    Aut X →* Aut (Over.mk (toLeafTor N X)) := sorry

/-- (IG.2/perfect-toroidal-igusa-variety; CSnc Thm. 3.2.8) `Ig^{X,tor} → C^{X,tor}` is a
pro-finite étale `Γ_X`-Galois cover (any `X`, not necessarily completely slope divisible): it is
integral and surjective, `Ig^{X,tor}` is perfect, and `Γ_X` acts simply transitively on the
geometric fibres. -/
theorem isGalois [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) :
    IsIntegralHom (toLeafTor N X) ∧ Surjective (toLeafTor N X) ∧
      PerfectSchemeIG1 p (PerfectToroidalIgusa N X) ∧
      ∀ (K : Type u) [Field K] [IsAlgClosed K] (x : pt K ⟶ LeafToroidalIG2 N X)
        (y y' : pt K ⟶ PerfectToroidalIgusa N X), y ≫ toLeafTor N X = x →
        y' ≫ toLeafTor N X = x → ∃! γ : Aut X, y ≫ (gammaAction N X γ).hom.left = y' := sorry

/-- Perfect Igusa level structures on a perfect `C^{X,tor}`-scheme `T`: an `O_F`-linear
`ρ : 𝒜[p^∞]° ×T ≅ X° × T` with a scalar in `ℤ_p^×(T)` such that `ρ^{(0,1)}` respects the
polarizations up to that scalar (local carrier). -/
def levelStructuresIG2 (N : ℕ) (X : PDivGStructure D p (pt k))
    (T : Over (LeafToroidalIG2 N X)) : Type u := sorry

/-- (IG.2/perfect-toroidal-igusa-variety; CSnc Def. 3.2.9) `Ig^{X,tor}` represents perfect
Igusa level structures on perfect `C^{X,tor}`-schemes. -/
def represents [Fact p.Prime] (N : ℕ) (X : PDivGStructure D p (pt k))
    (T : Over (LeafToroidalIG2 N X)) [PerfectSchemeIG1 p T.left] :
    (T ⟶ Over.mk (toLeafTor N X)) ≃ levelStructuresIG2 N X T := sorry

/-- The open immersion `Ig^X ↪ Ig^{X,tor}`. -/
def fromIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) :
    IgusaVariety N X ⟶ PerfectToroidalIgusa N X := sorry

/-- (IG.2/perfect-toroidal-igusa-variety) `Ig^{X,tor}` restricts to `Ig^X` over `C^X`. -/
theorem restrict_open [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) :
    IsPullback (fromIgusa N X) (IgusaVariety.toLeaf N X) (toLeafTor N X)
      (leafToToroidalIG2 N X) := sorry

/-- The maps `Ig^{X,tor} → Ig^{X,tor}_m` for completely slope divisible `X`. -/
def toFinite (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    PerfectToroidalIgusa N X ⟶ ToroidalIgusa N X m := sorry

/-- (IG.2/perfect-toroidal-igusa-variety) For completely slope divisible `X`,
`Ig^{X,tor} ≅ (lim_m Ig^{X,tor}_m)_perf`: compatible families from perfect schemes lift
uniquely. -/
theorem eq_perf_lim [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    (∀ m, toFinite N X (m + 1) ≫ ToroidalIgusa.transition N X m = toFinite N X m) ∧
    ∀ (T : Scheme.{u}) [PerfectSchemeIG1 p T] (f : ∀ m, T ⟶ ToroidalIgusa N X m),
      (∀ m, f (m + 1) ≫ ToroidalIgusa.transition N X m = f m) →
      ∃! y : T ⟶ PerfectToroidalIgusa N X, ∀ m, y ≫ toFinite N X m = f m := sorry

/-- The subgroup of `J_b(ℚ_p)` of quasi-isogenies inducing isomorphisms on the étale and
multiplicative parts (local carrier). -/
def jSubgroupIG2 (X : PDivGStructure D p (pt k)) : Subgroup (JGroup (X.newtonClass)) := sorry

/-- (IG.2/perfect-toroidal-igusa-variety) The action on `Ig^{X,tor}` of the quasi-isogenies in
`J_b(ℚ_p)` inducing isomorphisms on étale and multiplicative parts, extending the action on
`Ig^X` (the prime-to-`p` Hecke operators compatible with `Σ` are not recorded). -/
def action (N : ℕ) (X : PDivGStructure D p (pt k)) :
    jSubgroupIG2 X →* Aut (PerfectToroidalIgusa N X) := sorry

/-- The action extends the `J_b(ℚ_p)`-action on `Ig^X`. -/
theorem action_fromIgusa (N : ℕ) (X : PDivGStructure D p (pt k)) (j : jSubgroupIG2 X) :
    fromIgusa N X ≫ (action N X j).hom = (Igusa.jAction N X j).hom ≫ fromIgusa N X := sorry

end PerfectToroidalIgusa

-- test: PerfectToroidalIgusa.no_etale — if X^ét = 0 then Ig^{X,tor} = Ig^X
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k))
    (hX : ∀ τ, X.etaleRank τ = 0) :
    IsIso (PerfectToroidalIgusa.fromIgusa N X) := sorry

-- test: PerfectToroidalIgusa.modular_curve — n = 1, F imaginary quadratic, X ordinary: over a cusp the fibre is a Γ_X-torsor (of trivializations of μ_{p^∞} with a scalar)
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1)
    (hb : X.newtonClass = KottwitzSet.ordinary D p) (x : pt k ⟶ LeafToroidalIG2 N X)
    (hx : schemePointIG2 x ∉ Set.range (leafToToroidalIG2 N X).base) :
    (∃ y : pt k ⟶ PerfectToroidalIgusa N X, y ≫ PerfectToroidalIgusa.toLeafTor N X = x) ∧
      ∀ y y' : pt k ⟶ PerfectToroidalIgusa N X, y ≫ PerfectToroidalIgusa.toLeafTor N X = x →
        y' ≫ PerfectToroidalIgusa.toLeafTor N X = x →
        ∃! γ : Aut X, y ≫ (PerfectToroidalIgusa.gammaAction N X γ).hom.left = y' := sorry

-- test: PerfectToroidalIgusa.not_aut_torsor — Ig^{X,tor} → C^{X,tor} is not an Aut(X)-torsor at the boundary (Howe)
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) (c : SlopeFiltration X.pdiv) (hc : 2 ≤ c.r)
    (hbd : (Set.range (leafToToroidalIG2 N X).base)ᶜ.Nonempty)
    (act : pullback (PerfectToroidalIgusa.toLeafTor N X ≫ LeafToroidalIG2.toPt N X)
      (AutSchemeIG1.toPt X) ⟶ PerfectToroidalIgusa N X) :
    ¬ IsFpqcTorsorIG1 (PerfectToroidalIgusa.toLeafTor N X) (LeafToroidalIG2.toPt N X)
      (AutSchemeIG1.toPt X) act := sorry

/-- The perfect `Γ_X`-torsor `C^{Ig,X}_Z → (C_Z ×_{S_Z} C^X_Z)_perf` of `O_F`-linear
isomorphisms `H_Z ≅ X°` with a `ℤ_p^×`-scalar (local carrier). -/
def igusaCuspTorsorIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (Z : CuspLabelIG2 D p N) :
    Scheme.{u} := sorry

/-- Tuples `(B, ι, λ, η) ∈ S_Z`, an extension `0 → T → G → B → 0` by the split torus with
cocharacter group `𝒳`, and an `O_F`-linear embedding `ρ : G[p^∞] ↪ X` with `T[p^∞] ⊂ G[p^∞] ⊂ X`
symplectic and `B[p^∞] ≅ Gr_{−1}` compatibly with polarizations, over a perfect `k`-scheme `T`
(local carrier). -/
def igusaCuspDataIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (Z : CuspLabelIG2 D p N)
    (T : Scheme.{u}) : Type u := sorry

/-- The completion of `Ig^{X,tor}` along its `Z`-stratum (local carrier). -/
def perfectTorCompletionIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (Z : CuspLabelIG2 D p N) :
    FormalSchemeIG2.{u} := sorry

/-- `𝔜_{Z,Σ_Z}/Γ_Z`, `𝔜_{Z,Σ_Z}` the completion of
`Ξ^{Ig,X}_{Z,Σ_Z} = Ξ^{Ig,X}_Z ×_{Ξ_Z} Ξ_{Z,Σ_Z}` along its toroidal boundary (local carrier). -/
def perfectTorBoundaryModelIG2 (N : ℕ) (X : PDivGStructure D p (pt k))
    (Z : CuspLabelIG2 D p N) : FormalSchemeIG2.{u} := sorry

/-- (IG.2/igusa-boundary-charts; CSnc Props. 3.2.11–3.2.12, Thm. 3.2.13) (1) `C^{Ig,X}_Z` is the
perfect scheme representing the data `(B, ι, λ, η, G, ρ)` on perfect schemes; (3) the
completion of `Ig^{X,tor}` along its `Z`-stratum is `𝔜_{Z,Σ_Z}/Γ_Z`. Part (2) (the
`𝐒_{Z,perf}`-torsor of symmetric lifts) is not recorded. -/
theorem igusaBoundaryCharts [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (X : PDivGStructure D p (pt k))
    (Z : CuspLabelIG2 D p N) :
    PerfectSchemeIG1 p (igusaCuspTorsorIG2 N X Z) ∧
      (∀ (T : Scheme.{u}) [PerfectSchemeIG1 p T],
        Nonempty ((T ⟶ igusaCuspTorsorIG2 N X Z) ≃ igusaCuspDataIG2 N X Z T)) ∧
      Nonempty (perfectTorCompletionIG2 N X Z ≅ perfectTorBoundaryModelIG2 N X Z) := sorry

end PerfectToroidal

/-! ### IG.2/unit-similitude-quasi-isogeny, IG.2/toroidal-isogeny-invariance -/

section QuasiIsogeny

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- `G`-quasi-isogenies `X → X'` with similitude factor in `ℤ_p^×` restricting to isomorphisms
on étale and multiplicative parts (local data carrier; owner of quasi-isogenies:
FiniteFlatGroups R07). The restrictions and the similitude are recorded by accessors. -/
def UnitQIsogIG2 (X X' : PDivGStructure D p (pt k)) : Type := sorry

/-- The underlying `G`-quasi-isogeny (`IG.0`'s `PDivGStructure.QIsog`). -/
def UnitQIsogIG2.toQIsog {X X' : PDivGStructure D p (pt k)} (φ : UnitQIsogIG2 X X') :
    PDivGStructure.QIsog X X' := sorry

/-- The similitude factor. -/
def UnitQIsogIG2.similitude [Fact p.Prime] {X X' : PDivGStructure D p (pt k)}
    (φ : UnitQIsogIG2 X X') : ℤ_[p]ˣ := sorry

/-- The induced isomorphism of étale parts. -/
def UnitQIsogIG2.etaleIso {X X' : PDivGStructure D p (pt k)} (φ : UnitQIsogIG2 X X') :
    PDivGroup.etalePartIG2 (PDivGStructure.toPDivGroup.obj X) ≅
      PDivGroup.etalePartIG2 (PDivGStructure.toPDivGroup.obj X') := sorry

/-- The induced isomorphism of multiplicative parts. -/
def UnitQIsogIG2.multIso {X X' : PDivGStructure D p (pt k)} (φ : UnitQIsogIG2 X X') :
    PDivGroup.multPartIG2 (PDivGStructure.toPDivGroup.obj X) ≅
      PDivGroup.multPartIG2 (PDivGStructure.toPDivGroup.obj X') := sorry

/-- The isomorphism `Ig^X ≅ Ig^{X'}` induced by `φ` (`IG.1/igusa-isogeny-invariance`). -/
def UnitQIsogIG2.igusaIso (N : ℕ) {X X' : PDivGStructure D p (pt k)} (φ : UnitQIsogIG2 X X') :
    IgusaVariety N X ≅ IgusaVariety N X' := sorry

/-- (IG.2/unit-similitude-quasi-isogeny) If `p` splits in an imaginary quadratic subfield
`F₀ ⊂ F`, any two p-divisible groups with `G`-structure in the same isogeny class are related by
a `G`-quasi-isogeny of similitude `1` restricting to isomorphisms on étale and multiplicative
parts. -/
theorem unitSimilitudeQuasiIsogeny [Fact p.Prime] [CharP k p]
    (F₀ : Type) [Field F₀] [NumberField F₀] [Algebra F₀ D.F] (hF₀ : Module.finrank ℚ F₀ = 2)
    (hF₀c : NumberField.IsTotallyComplex F₀)
    (hsplit : ∃ P Q : Ideal (NumberField.RingOfIntegers F₀), P ≠ Q ∧ P.IsMaximal ∧
      Q.IsMaximal ∧ Ideal.span {(p : NumberField.RingOfIntegers F₀)} = P * Q)
    (X X' : PDivGStructure D p (pt k)) (h : X.newtonClass = X'.newtonClass) :
    ∃ φ : UnitQIsogIG2 X' X, φ.similitude = 1 := sorry

/-- (IG.2/toroidal-isogeny-invariance; CSnc Cor. 3.2.14, corrected as in sourceIssues E1) A
`G`-quasi-isogeny with unit similitude inducing isomorphisms on étale and multiplicative parts:
the isomorphism `Ig^X ≅ Ig^{X'}` it induces extends uniquely to `Ig^{X,tor} ≅ Ig^{X',tor}` (the
Hecke equivariance is not recorded). -/
theorem toroidalIsogenyInvariance [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X X' : PDivGStructure D p (pt k)} (φ : UnitQIsogIG2 X X') :
    ∃! e : PerfectToroidalIgusa N X ≅ PerfectToroidalIgusa N X',
      PerfectToroidalIgusa.fromIgusa N X ≫ e.hom =
        (φ.igusaIso N).hom ≫ PerfectToroidalIgusa.fromIgusa N X' := sorry

end QuasiIsogeny

/-! ### IG.2/ekedahl-oort-stratification, IG.2/eo-strata-minimal-affine,
IG.2/fundamental-eo-stratum-in-newton-stratum -/

section EkedahlOort

/-- The set `^JW` of minimal-length coset representatives for the Weyl group of the Levi of `μ`
(owner: the Weyl-group carriers of ReductiveGroups; local carrier). -/
def EOIndexIG2 (D : UnitarySimilitudeDatum) (p : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p : ℕ) : Fintype (EOIndexIG2 D p) := sorry

/-- The length `ℓ(w)`. -/
def EOIndexIG2.length {D : UnitarySimilitudeDatum} {p : ℕ} (w : EOIndexIG2 D p) : ℕ := sorry

/-- The longest element of `^JW` (local carrier). -/
def EOIndexIG2.longest (D : UnitarySimilitudeDatum) (p : ℕ) : EOIndexIG2 D p := sorry

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- (IG.2/ekedahl-oort-stratification) The Ekedahl–Oort stratum `S^w ⊂ S_k`, the fibre of the
zip morphism `ζ : S_k → [E_𝒵\G_k]` over the point `w` (data carrier for the subset; it is
locally closed by `ekedahlOortStratum_isLocallyClosed`). -/
def ekedahlOortStratum (k : Type u) [Field k] (N : ℕ) (w : EOIndexIG2 D p) :
    Set (SpecialFibre D p k N) := sorry

/-- EO strata are locally closed. -/
theorem ekedahlOortStratum_isLocallyClosed [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (w : EOIndexIG2 D p) :
    IsLocallyClosed (ekedahlOortStratum (D := D) k N w) := sorry

/-- (IG.2/ekedahl-oort-stratification) A nonempty `S^w` is smooth of dimension `ℓ(w)`. -/
theorem ekedahlOortStratum_dim [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (w : EOIndexIG2 D p)
    (hw : (ekedahlOortStratum (D := D) k N w).Nonempty) :
    SmoothOfRelativeDimension w.length
      (LCSubschemeIG2.ι (ekedahlOortStratum (D := D) k N w) ≫ SpecialFibre.toSpec D p k N) := sorry

/-- The group `G_k` as a scheme (local carrier). -/
def GkSchemeIG2 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] : Scheme.{u} :=
  sorry

/-- The `E_𝒵`-torsor `I → S_k` trivializing the universal `G`-zip, with its `E_𝒵`-equivariant
map `I → G_k`; `ζ : S_k → [E_𝒵\G_k]` is smooth iff this map is (the stack of `G`-zips is not
among the carriers; local carrier). -/
def zipTorsorIG2 (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    Scheme.{u} := sorry

/-- The map `I → G_k`. -/
def zipTorsorIG2.toG (D : UnitarySimilitudeDatum) (p : ℕ) (k : Type u) [Field k] (N : ℕ) :
    zipTorsorIG2 D p k N ⟶ GkSchemeIG2 D p k := sorry

/-- (IG.2/ekedahl-oort-stratification) The zip morphism `ζ : S_k → [E_𝒵\G_k]` is smooth
(recorded on the `E_𝒵`-torsor trivializing the zip). -/
instance zipMorphism_smooth [Fact p.Prime] [CharP k p] {N : ℕ}
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    : Smooth (zipTorsorIG2.toG D p k N) := sorry

/-- (IG.2/ekedahl-oort-stratification) The Hasse section of `S^w`: a weight `a ≥ 1` and a
section of `ω^{⊗a}` on the closure of `S^w` (in `S^*_k`). -/
def hasseSection (k : Type u) [Field k] (N : ℕ) (w : EOIndexIG2 D p) :
    Σ a : ℕ, HodgeSectionIG2 D p k N
      (closure ((MinimalCompactIG2.j D p k N).base '' ekedahlOortStratum k N w)) a := sorry

/-- The non-vanishing locus of the Hasse section of `S^w` on `S_k` is `S^w` (and the weight is
positive). -/
theorem hasseSection_nonVanishing [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (w : EOIndexIG2 D p) :
    0 < (hasseSection (D := D) k N w).1 ∧
      (MinimalCompactIG2.j D p k N).base ⁻¹' (hasseSection (D := D) k N w).2.nonVanishing =
        ekedahlOortStratum k N w := sorry

/-- The EO strata of the boundary Shimura variety `S_{Z,k}` corresponding to `w` (local
carrier). -/
def boundaryEOIG2 {N : ℕ} (Z : CuspLabelIG2 D p N) (w : EOIndexIG2 D p) :
    Set (BoundaryShimuraIG2 k Z) := sorry

/-- The well-positioned structure of `S^w` (data carrier). -/
def eoWPIG2 (k : Type u) [Field k] (N : ℕ) (w : EOIndexIG2 D p) :
    IsWellPositioned (ekedahlOortStratum (D := D) k N w) := sorry

/-- (IG.2/ekedahl-oort-stratification) `S^w` is well-positioned with boundary data the EO strata
of the `S_{Z,k}`. -/
theorem ekedahlOortStratum_wellPositioned [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (w : EOIndexIG2 D p)
    (Z : CuspLabelIG2 D p N) :
    (eoWPIG2 (D := D) k N w).boundaryData Z = boundaryEOIG2 Z w := sorry

/-- (IG.2/ekedahl-oort-stratification) The open EO stratum is the ordinary Newton stratum, and
its Hasse section has the non-vanishing locus of the classical Hasse invariant. -/
theorem ekedahlOortStratum_ordinary [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    ekedahlOortStratum k N (EOIndexIG2.longest D p) =
        newtonStratum D p k N (KottwitzSet.ordinary D p) ∧
      (hasseSection (D := D) k N (EOIndexIG2.longest D p)).2.nonVanishing =
        (hasseInvariantIG2 D p k N).nonVanishing := sorry

end EkedahlOort

-- test: ekedahlOortStratum_modularCurve — n = 1, F imaginary quadratic: two strata, of dimensions 1 and 0
example {D : UnitarySimilitudeDatum} {p : ℕ} (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1) :
    Fintype.card (EOIndexIG2 D p) = 2 ∧
      ∃ w w' : EOIndexIG2 D p, w.length = 1 ∧ w'.length = 0 := sorry

-- test: ekedahlOortStratum_ordinary_open — the stratum of the longest element is open and dense
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    IsOpen (ekedahlOortStratum (D := D) k N (EOIndexIG2.longest D p)) ∧
      Dense (ekedahlOortStratum (D := D) k N (EOIndexIG2.longest D p)) := sorry

-- test: ekedahlOortStratum_disjoint — distinct G-zip labels cannot contain the same point
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (w w' : EOIndexIG2 D p) (hne : w ≠ w') :
    Disjoint (ekedahlOortStratum (D := D) k N w)
      (ekedahlOortStratum (D := D) k N w') := sorry

-- test: hasseSection_ordinary_compat — on the ordinary stratum the Hasse section is a power of the classical Hasse invariant
example {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    (p - 1) ∣ (hasseSection (D := D) k N (EOIndexIG2.longest D p)).1 ∧
      (hasseSection (D := D) k N (EOIndexIG2.longest D p)).2.nonVanishing =
        (hasseInvariantIG2 D p k N).nonVanishing := sorry

/-- (IG.2/eo-strata-minimal-affine; Boxer, Thm. C) The partial minimal compactification
`(S^w)^*` of every EO stratum is affine. -/
theorem eoStrataMinimalAffine {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    [IsAlgClosed k] [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (w : EOIndexIG2 D p) :
    IsAffine (partialMinimal (ekedahlOortStratum (D := D) k N w) (eoWPIG2 k N w)) := sorry

/-- (IG.2/fundamental-eo-stratum-in-newton-stratum; Nie, Prop. 1.5, Cor. 1.6) Every Newton
stratum contains an EO stratum (of a fundamental element `w`) which is a central leaf
`C^{X_w}`, `X_w` in the class `b` (the minimal p-divisible group with `G`-structure). -/
theorem fundamentalEoStratumInNewtonStratum {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u}
    [Field k] [IsAlgClosed k] [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (b : KottwitzSet D p) :
    ∃ (w : EOIndexIG2 D p) (Xw : PDivGStructure D p (pt k)),
      ekedahlOortStratum k N w ⊆ newtonStratum D p k N b ∧
        Xw.newtonClass = b ∧ IsCompletelySlopeDivisible Xw.pdiv ∧
        ekedahlOortStratum k N w = centralLeaf D p k N Xw := sorry

/-- (IG.2/affineness-transfer-lemma; CSnc Lemma 3.3.3) Given `X ← C → Y` with closed
subschemes `X₀, C₀, Y₀`, `C₀` topologically the preimage of both `X₀` and `Y₀`, `X`, `X₀`, `Y₀`
affine, and `π₁, π₂` proper surjective and finite away from `C₀`, the scheme `Y` is affine. -/
theorem affinenessTransferLemma {X C Y X₀ C₀ Y₀ : Scheme.{u}} (π₁ : C ⟶ X) (π₂ : C ⟶ Y)
    (i : X₀ ⟶ X) (c : C₀ ⟶ C) (j : Y₀ ⟶ Y) [IsClosedImmersion i] [IsClosedImmersion c]
    [IsClosedImmersion j]
    (h₁ : Set.range c.base = π₁.base ⁻¹' Set.range i.base)
    (h₂ : Set.range c.base = π₂.base ⁻¹' Set.range j.base)
    [IsAffine X] [IsAffine X₀] [IsAffine Y₀] [IsProper π₁] [IsProper π₂] [Surjective π₁]
    [Surjective π₂] (U : X.Opens) (hU : (U : Set X) = (Set.range i.base)ᶜ) (V : Y.Opens)
    (hV : (V : Set Y) = (Set.range j.base)ᶜ) (hf₁ : IsFinite (π₁ ∣_ U))
    (hf₂ : IsFinite (π₂ ∣_ V)) : IsAffine Y := sorry

/-- (IG.2/leaf-minimal-compactification-affine; CSnc Thm. 3.3.2, in the proved form) (1) If the
central leaf `C^X` is an EO stratum (`X = X_w` for a fundamental `w`), `C^{X,*}` is affine;
(2) for `X` in the class of such an `X_w`, `C^{X,*}` is affine provided there is a
unit-similitude `G`-quasi-isogeny `X_w → X` that is an isomorphism on étale and multiplicative
parts and the toroidal invariance holds for it (recorded gap, entered as the hypothesis that
the induced `Ig^X_w ≅ Ig^X` extends to the toroidal compactifications). -/
theorem leafMinimalCompactificationAffine {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u}
    [Field k] [IsAlgClosed k] [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] :
    (∀ (w : EOIndexIG2 D p) (Xw : PDivGStructure D p (pt k)),
      ekedahlOortStratum k N w = centralLeaf D p k N Xw →
      IsAffine (LeafMinimalIG2 N Xw)) ∧
    (∀ (w : EOIndexIG2 D p) (Xw X : PDivGStructure D p (pt k)),
      ekedahlOortStratum k N w = centralLeaf D p k N Xw →
      ∀ φ : UnitQIsogIG2 Xw X,
        (∃ e : PerfectToroidalIgusa N Xw ≅ PerfectToroidalIgusa N X,
          PerfectToroidalIgusa.fromIgusa N Xw ≫ e.hom =
            (φ.igusaIso N).hom ≫ PerfectToroidalIgusa.fromIgusa N X) →
        IsAffine (LeafMinimalIG2 N X)) := sorry

/-! ### IG.2/perfect-minimal-igusa, IG.2/minimal-igusa-compactification -/

section Minimal

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

-- api: PerfectMinimalIgusa — the scheme `Ig^{X,*}` is the prelude's `PerfectMinimalIgusa N X`; its identification with Mathlib's relative normalization follows

namespace PerfectMinimalIgusa

/-- The map `Ig^X → C^X → C^{X,*}`. -/
def igusaToLeafMin (N : ℕ) (X : PDivGStructure D p (pt k)) :
    IgusaVariety N X ⟶ LeafMinimalIG2 N X :=
  IgusaVariety.toLeaf N X ≫ leafToMinimalIG2 N X

/-- `Ig^X → C^{X,*}` is quasi-compact (`Ig^X → C^X` is affine). -/
instance igusaToLeafMin_quasiCompact {N : ℕ} {X : PDivGStructure D p (pt k)} :
    QuasiCompact (igusaToLeafMin N X) := sorry

/-- `Ig^X → C^{X,*}` is quasi-separated. -/
instance igusaToLeafMin_quasiSeparated {N : ℕ} {X : PDivGStructure D p (pt k)} :
    QuasiSeparated (igusaToLeafMin N X) := sorry

/-- (IG.2/perfect-minimal-igusa; CSnc Prop. 3.3.4) `Ig^{X,*}` is the normalization of `C^{X,*}`
in `Ig^X` (Mathlib's `Scheme.Hom.normalization`). -/
def isoNormalization (N : ℕ) (X : PDivGStructure D p (pt k)) :
    PerfectMinimalIgusa N X ≅ (igusaToLeafMin N X).normalization := sorry

/-- The structure map `Ig^{X,*} → C^{X,*}`. -/
def toLeafMin (N : ℕ) (X : PDivGStructure D p (pt k)) :
    PerfectMinimalIgusa N X ⟶ LeafMinimalIG2 N X :=
  (isoNormalization N X).hom ≫ (igusaToLeafMin N X).fromNormalization

/-- (IG.2/perfect-minimal-igusa) `Ig^{X,*} → C^{X,*}` is integral. -/
instance integral {N : ℕ} {X : PDivGStructure D p (pt k)} : IsIntegralHom (toLeafMin N X) :=
  sorry

/-- (IG.2/perfect-minimal-igusa) When `C^{X,*}` is affine, `Ig^{X,*}` agrees with the Stein
factorization of `Ig^{X,tor} → C^{X,*}`, i.e. `Ig^{X,*} = Spec H⁰(Ig^{X,tor}, O)`. The
affineness hypothesis is needed for the last identification (it is available unconditionally
only for `X = X_w`, `leafMinimalCompactificationAffine`). -/
theorem eq_spec_H0 [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [IsAffine (LeafMinimalIG2 N X)] :
    Nonempty (PerfectMinimalIgusa N X ≅ Spec Γ(PerfectToroidalIgusa N X, ⊤)) := sorry

/-- (IG.2/perfect-minimal-igusa) `Ig^{X,*}` is affine when `C^{X,*}` is. -/
instance isAffine [Fact p.Prime] [CharP k p] {N : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X : PDivGStructure D p (pt k)} [IsAffine (LeafMinimalIG2 N X)] :
    IsAffine (PerfectMinimalIgusa N X) := sorry

/-- The open immersion `Ig^X ↪ Ig^{X,*}`. -/
def jIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) : IgusaVariety N X ⟶ PerfectMinimalIgusa N X :=
  (igusaToLeafMin N X).toNormalization ≫ (isoNormalization N X).inv

/-- (IG.2/perfect-minimal-igusa) `Ig^X ⊂ Ig^{X,*}` is a dense open. -/
theorem «open» [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) :
    IsOpenImmersion (jIG2 N X) ∧ Dense (Set.range (jIG2 N X).base) := sorry

-- api: PerfectMinimalIgusa.open — declared as `PerfectMinimalIgusa.«open»` (`open` is a keyword)

end PerfectMinimalIgusa

-- test: PerfectMinimalIgusa.no_etale — if X^ét = 0 then Ig^{X,*} = Ig^X
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k))
    (hX : ∀ τ, X.etaleRank τ = 0) :
    IsIso (PerfectMinimalIgusa.jIG2 N X) := sorry

-- test: PerfectMinimalIgusa.not_finite — Ig^{X,*} → C^{X,*} is integral but not finite (Γ_X infinite)
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Infinite (Aut X)] [Nonempty (CentralLeaf N X)] :
    IsIntegralHom (PerfectMinimalIgusa.toLeafMin N X) ∧
      ¬ IsFinite (PerfectMinimalIgusa.toLeafMin N X) := sorry

-- api: MinimalIgusa — the scheme `Ig^{b,*}_m` and `j : Ig^b_m ↪ Ig^{b,*}_m` are the prelude's `MinimalIgusa N X m`, `MinimalIgusa.j`

namespace MinimalIgusa

/-- The map `Ig^b_m → C^b → C^{b,*}`. -/
def mantovanToLeafMin (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MantovanIgusaVariety N X m ⟶ LeafMinimalIG2 N X :=
  MantovanIgusa.toLeaf N X m ≫ leafToMinimalIG2 N X

/-- `Ig^b_m → C^{b,*}` is quasi-compact. -/
instance mantovanToLeafMin_quasiCompact {N : ℕ} {X : PDivGStructure D p (pt k)} {m : ℕ} :
    QuasiCompact (mantovanToLeafMin N X m) := sorry

/-- `Ig^b_m → C^{b,*}` is quasi-separated. -/
instance mantovanToLeafMin_quasiSeparated {N : ℕ} {X : PDivGStructure D p (pt k)} {m : ℕ} :
    QuasiSeparated (mantovanToLeafMin N X m) := sorry

/-- (IG.2/minimal-igusa-compactification; CSnc Def. 3.3.7) `Ig^{b,*}_m` is the normalization of
`C^{b,*}` in `Ig^b_m`, compatibly with `j`. -/
def isoNormalization (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MinimalIgusa N X m ≅ (mantovanToLeafMin N X m).normalization := sorry

/-- `j` is the canonical map to the normalization. -/
theorem j_eq (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MinimalIgusa.j N X m ≫ (isoNormalization N X m).hom =
      (mantovanToLeafMin N X m).toNormalization := sorry

/-- The structure map `h^{b,*}_m : Ig^{b,*}_m → C^{b,*}`. -/
def toLeafMin (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MinimalIgusa N X m ⟶ LeafMinimalIG2 N X :=
  (isoNormalization N X m).hom ≫ (mantovanToLeafMin N X m).fromNormalization

/-- (IG.2/minimal-igusa-compactification, (1)) `h^{b,*}_m` is finite and surjective. -/
instance finite [Fact p.Prime] [CharP k p] {N : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X : PDivGStructure D p (pt k)} [Fact (IsCompletelySlopeDivisible X.pdiv)] {m : ℕ} :
    IsFiniteSurjectiveIG2 (toLeafMin N X m) := sorry

/-- (IG.2/minimal-igusa-compactification, (2)) `Ig^{b,*}_m` is normal. -/
instance normal [Fact p.Prime] [CharP k p] {N : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X : PDivGStructure D p (pt k)} [Fact (IsCompletelySlopeDivisible X.pdiv)] {m : ℕ} :
    IsNormalSchemeIG2 (MinimalIgusa N X m) := sorry

/-- (IG.2/minimal-igusa-compactification, (2)) `Ig^b_m ↪ Ig^{b,*}_m` is a dense open
immersion. -/
theorem j_dense_open [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ) :
    IsOpenImmersion (MinimalIgusa.j N X m) ∧ Dense (Set.range (MinimalIgusa.j N X m).base) :=
  sorry

/-- (IG.2/minimal-igusa-compactification, (1)) `Ig^{b,*}_m` is affine whenever `C^{b,*}` is. -/
instance isAffine [Fact p.Prime] [CharP k p] {N : ℕ}
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    {X : PDivGStructure D p (pt k)} [Fact (IsCompletelySlopeDivisible X.pdiv)]
    {m : ℕ} [IsAffine (LeafMinimalIG2 N X)] :
    IsAffine (MinimalIgusa N X m) := sorry

/-- The transition maps `Ig^{b,*}_{m+1} → Ig^{b,*}_m` (data carrier). -/
def transitionIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MinimalIgusa N X (m + 1) ⟶ MinimalIgusa N X m := sorry

/-- `Ig^{b,*} = lim_m Ig^{b,*}_m`, as a cone over the transition maps (data carrier). -/
def limIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    Cone (Functor.ofOpSequence (transitionIG2 N X)) := sorry

/-- The map `Ig^{b,*} → C^{b,*}`. -/
def limToLeafMinIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    (limIG2 N X).pt ⟶ LeafMinimalIG2 N X :=
  (limIG2 N X).π.app (Opposite.op 0) ≫ toLeafMin N X 0

/-- `Ig^{b,*}` is the limit, and it is affine when `C^{b,*}` is. -/
theorem lim_isLimit_isAffine [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)]
    [IsAffine (LeafMinimalIG2 N X)] :
    Nonempty (IsLimit (limIG2 N X)) ∧ IsAffine (limIG2 N X).pt := sorry

/-- (IG.2/minimal-igusa-compactification, (3), corrected as in sourceIssues E2)
`Ig^{b,*} → C^{b,*}` is integral (not finite in general). -/
theorem lim_integral [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    IsIntegralHom (limToLeafMinIG2 N X) := sorry

/-- The map `Ig^{X_b,*} → Ig^{b,*}` (data carrier). -/
def perfToLimIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) :
    PerfectMinimalIgusa N X ⟶ (limIG2 N X).pt := sorry

/-- (IG.2/minimal-igusa-compactification, (3)) `(Ig^{b,*})_perf ≅ Ig^{X_b,*}`: `Ig^{X_b,*}` is
perfect and maps from perfect schemes to `Ig^{b,*}` lift uniquely. -/
theorem perf [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] :
    PerfectSchemeIG1 p (PerfectMinimalIgusa N X) ∧
      ∀ (T : Scheme.{u}) [PerfectSchemeIG1 p T],
        Function.Bijective (fun y : T ⟶ PerfectMinimalIgusa N X => y ≫ perfToLimIG2 N X) :=
  sorry

/-- (IG.2/minimal-igusa-compactification) The prime-to-`p` Hecke maps extend to the
`Ig^{b,*}_m` (the extension of the `J_b`-monoid action is not recorded). -/
def hecke (N N' : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (g : GAfp D p)
    (h : (levelSubgroupIG1 D p N').map (MulAut.conj g⁻¹).toMonoidHom ≤ levelSubgroupIG1 D p N) :
    MinimalIgusa N' X m ⟶ MinimalIgusa N X m := sorry

/-- The extended Hecke maps restrict to the Hecke maps of the Igusa varieties. -/
theorem hecke_j (N N' : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (g : GAfp D p)
    (h : (levelSubgroupIG1 D p N').map (MulAut.conj g⁻¹).toMonoidHom ≤ levelSubgroupIG1 D p N) :
    Igusa.toMantovan N' X m ≫ MinimalIgusa.j N' X m ≫ hecke N N' X m g h =
      Igusa.heckeAction N N' X g h ≫ Igusa.toMantovan N X m ≫ MinimalIgusa.j N X m := sorry

end MinimalIgusa

-- test: MinimalIgusa.level_zero — Ig^{b,*}_0 = C^{b,*}
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)]
    : IsIso (MinimalIgusa.toLeafMin N X 0) :=
  sorry

-- test: MinimalIgusa.ordinary — modular-curve case, b ordinary: Ig^{b,*}_1 is a smooth curve (the Igusa curve with its cusps), finite over C^{b,*}
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)]
    (hF : Module.finrank ℚ D.F = 2)
    (hn : D.n = 1) (hb : X.newtonClass = KottwitzSet.ordinary D p) :
    IsFinite (MinimalIgusa.toLeafMin N X 1) ∧
      SmoothOfRelativeDimension 1 (MinimalIgusa.toLeafMin N X 1 ≫ LeafMinimalIG2.toPt N X) :=
  sorry

-- test: MinimalIgusa.not_finite_limit — Ig^{b,*} → C^{b,*} is not finite when Γ_X is infinite
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] [Infinite (Aut X)]
    [Nonempty (CentralLeaf N X)] : ¬ IsFinite (MinimalIgusa.limToLeafMinIG2 N X) := sorry

-- test: MinimalIgusa.not_etale — for n ≥ 2 and nonempty boundary, some Ig^{b,*}_m → C^{b,*} is not étale (for n = 1 it is étale)
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (hn : 2 ≤ D.n)
    (hX : ∃ τ, X.etaleRank τ ≠ 0)
    (hbd : (Set.range (leafToMinimalIG2 N X).base)ᶜ.Nonempty) :
    ∃ m, ¬ Etale (MinimalIgusa.toLeafMin N X m) := sorry

end Minimal

/-! ### IG.2/igusa-cusp-labels, IG.2/toroidal-igusa-boundary-strata,
IG.2/minimal-igusa-boundary-strata -/

section CuspLabels

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- (IG.2/igusa-cusp-labels; CSnc Def. 3.3.10) Igusa cusp labels `Z̃ = (Z_b, Z^p, 𝒳)`: an
`O_F`-stable filtration `Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b` with multiplicative `Gr_{−2}` and étale
`Gr_0` Cartier dual under the polarization, an `O_F`-stable symplectic filtration of
`L ⊗ ℤ̂^p`, and a finite projective `O_F`-module `𝒳` with `𝒳 ⊗ ℚ_p/ℤ_p ≅ Gr_0^{Z_b}` and
`𝒳 ⊗ ℤ̂^p ≅ Gr_0^{Z^p}` (local data carrier). -/
def IgusaCuspLabel (X : PDivGStructure D p (pt k)) : Type := sorry

namespace IgusaCuspLabel

/-- (IG.2/igusa-cusp-labels) The underlying cusp label `(Z^p, 𝒳)` at level `K(N)`. -/
def toCuspLabel (N : ℕ) {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) :
    CuspLabelIG2 D p N := sorry

/-- (IG.2/igusa-cusp-labels) The action of `J_b(ℚ_p) × G(𝔸_f^p)` on Igusa cusp labels. -/
instance action (X : PDivGStructure D p (pt k)) :
    MulAction (JGroup (X.newtonClass) × GAfp D p) (IgusaCuspLabel X) := sorry

/-- The level group `Γ_b(p^m) × K^p(N) ⊂ J_b(ℚ_p) × G(𝔸_f^p)`,
`Γ_b(p^m) = ker(Γ_X → Γ_{m,X})`. -/
def levelGroup (X : PDivGStructure D p (pt k)) (m N : ℕ) :
    Subgroup (JGroup (X.newtonClass) × GAfp D p) :=
  ((GammaLevelIG1.ofAut X m).ker.map (autToJIG1 X)).prod (levelSubgroupIG1 D p N)

/-- Triples `(Z_{m,b}, Z_N, 𝒳)`: `Z = (Z_N, 𝒳)` a cusp label at level `K(N)` and `Z_{m,b}` an
`O_F`-linear symplectic filtration of `X_b[p^m]` with `𝒳/p^m ≅ Gr_0` (local carrier). -/
def TripleIG2 (X : PDivGStructure D p (pt k)) (m N : ℕ) : Type := sorry

/-- The underlying cusp label of a triple. -/
def TripleIG2.cusp {X : PDivGStructure D p (pt k)} {m N : ℕ} (t : TripleIG2 X m N) :
    CuspLabelIG2 D p N := sorry

/-- (IG.2/igusa-cusp-labels) At level `Γ_b(p^m) K^p(N)`, Igusa cusp labels (orbits) correspond
to triples `(Z_{m,b}, Z_N, 𝒳)`. -/
def atLevel (X : PDivGStructure D p (pt k)) (m N : ℕ) :
    MulAction.orbitRel.Quotient (levelGroup X m N) (IgusaCuspLabel X) ≃ TripleIG2 X m N := sorry

/-- The finite projective `O_F`-module `𝒳` of a label (local carrier). -/
def lattice {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) : Type := sorry

instance {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) : AddCommGroup Z.lattice := sorry
instance {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) :
    Module (NumberField.RingOfIntegers D.F) Z.lattice := sorry

/-- (IG.2/igusa-cusp-labels) `Γ_Z̃ = {γ ∈ Aut_{O_F}(𝒳) : γ ≡ 1 mod p^m N}`. -/
def stabilizer {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) (m N : ℕ) :
    Subgroup (Z.lattice ≃ₗ[NumberField.RingOfIntegers D.F] Z.lattice) where
  carrier := {γ | ∀ x : Z.lattice, γ x - x ∈
    (Ideal.span {((p ^ m * N : ℕ) : NumberField.RingOfIntegers D.F)} •
      (⊤ : Submodule (NumberField.RingOfIntegers D.F) Z.lattice))}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- (IG.2/igusa-cusp-labels) The rank `r = rk_{O_F} 𝒳`. -/
def rank {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) : ℕ :=
  Module.finrank (NumberField.RingOfIntegers D.F) Z.lattice

/-- `r ∈ {0, …, n}`. -/
theorem rank_le {X : PDivGStructure D p (pt k)} (Z : IgusaCuspLabel X) : Z.rank ≤ D.n := sorry

end IgusaCuspLabel

-- test: IgusaCuspLabel.trivial — there is exactly one label with 𝒳 = 0 (it corresponds to the open stratum)
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k)) :
    ∃! Z : IgusaCuspLabel X, Z.rank = 0 := sorry

-- test: IgusaCuspLabel.ordinary_count — at m = 0 the labels above Z correspond to Z; for n = 1, F imaginary quadratic, b ordinary exactly one above each cusp
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) (Zc : CuspLabelIG2 D p N) :
    Subsingleton {t : IgusaCuspLabel.TripleIG2 X 0 N // t.cusp = Zc} ∧
      (Module.finrank ℚ D.F = 2 → D.n = 1 → X.newtonClass = KottwitzSet.ordinary D p →
        Nat.card {t : IgusaCuspLabel.TripleIG2 X 0 N // t.cusp = Zc} = 1) := sorry

-- test: IgusaCuspLabel.basic_none — if X_b^ét = 0 there are no labels with 𝒳 ≠ 0
example [Fact p.Prime] [CharP k p] (X : PDivGStructure D p (pt k))
    (hX : ∀ τ, X.etaleRank τ = 0)
    (Z : IgusaCuspLabel X) : Z.rank = 0 := sorry

-- test: PerfectMinimalIgusa.modular_curve — n = 1, F imaginary quadratic, X ordinary: the boundary of Ig^{X,*} over a cusp is a profinite set in bijection with the Igusa cusp labels above it
example [Fact p.Prime] [CharP k p] (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) (hF : Module.finrank ℚ D.F = 2) (hn : D.n = 1)
    (hb : X.newtonClass = KottwitzSet.ordinary D p) (Zc : CuspLabelIG2 D p N) :
    let B : Set (PerfectMinimalIgusa N X) :=
      (PerfectMinimalIgusa.toLeafMin N X ≫
        LCSubschemeIG2.ι (partialMinimalSet (centralLeaf D p k N X))).base ⁻¹'
        Set.range (BoundaryShimuraIG2.ι k Zc).base
    CompactSpace B ∧ T2Space B ∧ TotallyDisconnectedSpace B ∧
      Nonempty (B ≃ Quot (fun a b : {Z : IgusaCuspLabel X // Z.toCuspLabel N = Zc} =>
        ∃ g ∈ levelSubgroupIG1 D p N,
          ((1, g) : JGroup (X.newtonClass) × GAfp D p) • a.1 = b.1)) := sorry

/-- The index set of the open and closed formal subschemes of the completion of `Ig^{b,tor}_m`
along its `Z`-stratum (local carrier). -/
def torIgusaPiecesIG2 (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ)
    (Z : CuspLabelIG2 D p N) : Type := sorry

/-- The abelian scheme `C_Z̃ = Hom_{O_F}((1/N)𝒳, (B/B[p^m]^μ)^∨)` over `Ig^b_{Z,m}` (local
carrier). -/
def cuspAbelianIG2 {N m : ℕ} {X : PDivGStructure D p (pt k)}
    (t : IgusaCuspLabel.TripleIG2 X m N) : Scheme.{u} := sorry

/-- The scheme `C_Z ×_{S_Z} Ig^b_{Z,m}` (local carrier). -/
def cuspAbelianBaseIG2 {N m : ℕ} {X : PDivGStructure D p (pt k)}
    (t : IgusaCuspLabel.TripleIG2 X m N) : Scheme.{u} := sorry

/-- The natural map `C_Z̃ → C_Z ×_{S_Z} Ig^b_{Z,m}` (local carrier). -/
def cuspAbelianIG2.toBase {N m : ℕ} {X : PDivGStructure D p (pt k)}
    (t : IgusaCuspLabel.TripleIG2 X m N) : cuspAbelianIG2 t ⟶ cuspAbelianBaseIG2 t := sorry

/-- (IG.2/toroidal-igusa-boundary-strata; CSnc Thm. 3.3.12) (1) The completion of
`Ig^{b,tor}_m` along its `Z`-stratum decomposes into open and closed pieces indexed by the Igusa
cusp labels at level `Γ_b(p^m)K^p(N)` above `Z`; (2) the map `C_Z̃ → C_Z ×_{S_Z} Ig^b_{Z,m}` is
finite étale. The identification of each piece with `𝔛_{Z̃,Σ_Z}/Γ_Z̃` and its moduli
interpretation (Def. 3.3.13) are not recorded. -/
theorem toroidalIgusaBoundaryStrata [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ)
    (Z : CuspLabelIG2 D p N) :
    Nonempty (torIgusaPiecesIG2 N X m Z ≃ {t : IgusaCuspLabel.TripleIG2 X m N // t.cusp = Z}) ∧
      ∀ t : IgusaCuspLabel.TripleIG2 X m N, IsFiniteEtaleIG1 (cuspAbelianIG2.toBase t) := sorry

/-- The level-`p^m` Igusa variety `Ig^b_{Z,m}` over the boundary leaf `C^b_Z ⊂ S_Z` (for the
unitary group of rank `2(n − r)`) attached to a label (local carrier). -/
def boundaryIgusaIG2 {N m : ℕ} {X : PDivGStructure D p (pt k)}
    (t : IgusaCuspLabel.TripleIG2 X m N) : Scheme.{u} := sorry

/-- The stratum `Ig^b_Z̃ ⊂ Ig^{b,*}_m` of a label (local data carrier for the subset). -/
def MinimalIgusa.stratumIG2 {N m : ℕ} {X : PDivGStructure D p (pt k)}
    (t : IgusaCuspLabel.TripleIG2 X m N) : Set (MinimalIgusa N X m) := sorry

/-- (IG.2/minimal-igusa-boundary-strata; CSnc Thm. 3.3.15) `Ig^{b,*}_m = ⊔_Z̃ Ig^b_Z̃` into
locally closed strata indexed by Igusa cusp labels at level `Γ_b(p^m)K^p(N)`, with
`Ig^b_Z̃ ≅ Ig^b_{Z,m}`; a stratum meets the closure of another only if the underlying cusp
labels are ordered accordingly. -/
theorem minimalIgusaBoundaryStrata [Fact p.Prime] [CharP k p] (N : ℕ)
   
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)] (X : PDivGStructure D p (pt k))
    [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ) :
    (∀ y : MinimalIgusa N X m, ∃! t : IgusaCuspLabel.TripleIG2 X m N,
      y ∈ MinimalIgusa.stratumIG2 t) ∧
    (∀ t : IgusaCuspLabel.TripleIG2 X m N,
      IsLocallyClosed (MinimalIgusa.stratumIG2 t) ∧
        Nonempty (LCSubschemeIG2 (MinimalIgusa.stratumIG2 t) ≅ boundaryIgusaIG2 t)) ∧
    ∀ t t' : IgusaCuspLabel.TripleIG2 X m N,
      (MinimalIgusa.stratumIG2 t ∩ closure (MinimalIgusa.stratumIG2 t')).Nonempty →
        t.cusp ≤ t'.cusp := sorry

end CuspLabels

end TauCeti.Igusa

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open CategoryTheory AlgebraicGeometry CategoryTheory.Limits

noncomputable section

namespace TauCeti.Igusa

universe u

/-! ## IG.3 — Fibers of compactified Hodge–Tate maps -/

/-! ### Carriers for IG.3 (owned by other roadmaps unless stated) -/

section IG3Carriers

/-- A complete algebraically closed nonarchimedean extension `C` of `ℚ_p` (bundled so that one
can quantify over all such `C′`). Its ring of integers, residue field `k` and the fixed section
`k → O_C/p` are the carriers below. -/
structure PadicCField (p : ℕ) [Fact p.Prime] where
  /-- The field `C`. -/
  C : Type u
  [nf : NontriviallyNormedField C]
  [algClosed : IsAlgClosed C]
  [complete : CompleteSpace C]
  [ultra : IsUltrametricDist C]
  [qpAlg : NormedAlgebra ℚ_[p] C]

attribute [instance] PadicCField.nf PadicCField.algClosed PadicCField.complete
  PadicCField.ultra PadicCField.qpAlg

namespace PadicCField

variable {p : ℕ} [Fact p.Prime]

/-- The ring of integers `O_C` (as a commutative ring of the same universe). -/
def O (C : PadicCField.{u} p) : CommRingCat.{u} := sorry

/-- The inclusion `O_C → C`. -/
def OtoC (C : PadicCField.{u} p) : C.O ⟶ CommRingCat.of C.C := sorry

/-- The residue field `k` of `O_C`, algebraically closed of characteristic `p`. -/
def k (C : PadicCField.{u} p) : Type u := sorry

instance (C : PadicCField.{u} p) : Field C.k := sorry
instance (C : PadicCField.{u} p) : IsAlgClosed C.k := sorry
instance (C : PadicCField.{u} p) : CharP C.k p := sorry

/-- The reduction `Spec k → Spec O_C`. -/
def toResidue (C : PadicCField.{u} p) : pt C.k ⟶ Spec C.O := sorry

/-- `O_C/p^ε` for `ε ∈ ℚ ∩ (0, 1]` (the ideal of elements of absolute value `≤ |p|^ε`). -/
def Oeps (C : PadicCField.{u} p) (ε : ℚ) : CommRingCat.{u} := sorry

/-- The closed immersion `Spec O_C/p^ε → Spec O_C`. -/
def epsToO (C : PadicCField.{u} p) (ε : ℚ) : Spec (C.Oeps ε) ⟶ Spec C.O := sorry

/-- The fixed section `k → O_C/p` composed with `O_C/p → O_C/p^ε`, as `Spec O_C/p^ε → Spec k`. -/
def epsSection (C : PadicCField.{u} p) (ε : ℚ) : Spec (C.Oeps ε) ⟶ pt C.k := sorry

/-- The reduction `Spec k → Spec O_C/p^ε`. -/
def epsReduction (C : PadicCField.{u} p) (ε : ℚ) : pt C.k ⟶ Spec (C.Oeps ε) := sorry

end PadicCField

/-- `Spd(K, K°)` for a nontrivially normed (nonarchimedean) field `K` over `ℚ_p` (owner:
DiamondsAndVStacks D4). Rank-one geometric points of a diamond `X` are maps
`Diamond.spa C ⟶ X` with `C` complete algebraically closed. -/
def Diamond.spa (K : Type u) [NontriviallyNormedField K] : Diamond.{u} := sorry

/-- The base `Spd ℚ_p` (terminal diamond; owner: DiamondsAndVStacks D4). -/
def Diamond.spdQp : Diamond.{u} := sorry

/-- The base `Spd Ĕ`, `Ĕ = W(𝔽̄_p)[1/p]` (owner: DiamondsAndVStacks D4). -/
def Diamond.spdBreveQp : Diamond.{u} := sorry

/-- Diamonds have fibre products (owner: DiamondsAndVStacks D4). -/
instance : HasPullbacks Diamond.{u} := sorry

/-- Diamonds have sequential limits (owner: DiamondsAndVStacks D4). -/
instance : HasLimitsOfShape ℕᵒᵖ Diamond.{u} := sorry

/-- The underlying topological space `|X|` of a diamond (owner: DiamondsAndVStacks D4). -/
def Diamond.space (X : Diamond.{u}) : Type u := sorry

instance (X : Diamond.{u}) : TopologicalSpace (Diamond.space X) := sorry

/-- The continuous map `|f| : |X| → |Y|`. -/
def Diamond.spaceMap {X Y : Diamond.{u}} (f : X ⟶ Y) :
    ContinuousMap (Diamond.space X) (Diamond.space Y) := sorry

/-- The open subdiamond attached to an open subset of `|X|` (owner: DiamondsAndVStacks D4). -/
def Diamond.restrict (X : Diamond.{u}) (U : TopologicalSpace.Opens (Diamond.space X)) :
    Diamond.{u} := sorry

/-- The inclusion of an open subdiamond. -/
def Diamond.restrict.ι (X : Diamond.{u}) (U : TopologicalSpace.Opens (Diamond.space X)) :
    Diamond.restrict X U ⟶ X := sorry

/-- The closed subdiamond attached to a closed subset of `|X|` (owner: DiamondsAndVStacks D4). -/
def Diamond.restrictClosed (X : Diamond.{u}) (Z : TopologicalSpace.Closeds (Diamond.space X)) :
    Diamond.{u} := sorry

/-- The inclusion of a closed subdiamond. -/
def Diamond.restrictClosed.ι (X : Diamond.{u}) (Z : TopologicalSpace.Closeds (Diamond.space X)) :
    Diamond.restrictClosed X Z ⟶ X := sorry

/-- A map of diamonds is an open immersion if it is isomorphic to the inclusion of the open
subdiamond attached to an open subset of `|Y|`. -/
def Diamond.IsOpenImmersionD {X Y : Diamond.{u}} (f : X ⟶ Y) : Prop :=
  ∃ (U : TopologicalSpace.Opens (Diamond.space Y)) (e : X ≅ Diamond.restrict Y U),
    e.hom ≫ Diamond.restrict.ι Y U = f

/-- A map of diamonds is a closed immersion if it is isomorphic to the inclusion of a closed
subdiamond. -/
def Diamond.IsClosedImmersionD {X Y : Diamond.{u}} (f : X ⟶ Y) : Prop :=
  ∃ (Z : TopologicalSpace.Closeds (Diamond.space Y)) (e : X ≅ Diamond.restrictClosed Y Z),
    e.hom ≫ Diamond.restrictClosed.ι Y Z = f

/-- `f` induces a bijection on rank-one geometric points `(C′, O_{C′})` for every complete
algebraically closed `C′/ℚ_p`. -/
def Diamond.SameRankOnePoints (p : ℕ) [Fact p.Prime] {X Y : Diamond.{u}} (f : X ⟶ Y) : Prop :=
  ∀ C : PadicCField.{u} p, Function.Bijective (fun y : Diamond.spa C.C ⟶ X => y ≫ f)

/-- The canonical compactification `X̄^{/S}` of a (separated) map `s : X → S` of diamonds
(owner: DiamondsAndVStacks D4, Scholze ECD §18). -/
def Diamond.canonicalCompactification {X S : Diamond.{u}} (s : X ⟶ S) : Diamond.{u} := sorry

/-- The map `X → X̄^{/S}`. -/
def Diamond.canonicalCompactification.ι {X S : Diamond.{u}} (s : X ⟶ S) :
    X ⟶ Diamond.canonicalCompactification s := sorry

/-- The structure map `X̄^{/S} → S`. -/
def Diamond.canonicalCompactification.toBase {X S : Diamond.{u}} (s : X ⟶ S) :
    Diamond.canonicalCompactification s ⟶ S := sorry

/-- The map `X̄^{/S} → Y` induced by a map `f : X → Y` over `S` (universal property, for `Y`
partially proper over `S`). -/
def Diamond.canonicalCompactification.lift {X Y S : Diamond.{u}} (s : X ⟶ S) (t : Y ⟶ S)
    (f : X ⟶ Y) (h : f ≫ t = s) : Diamond.canonicalCompactification s ⟶ Y := sorry

/-- Separatedness: the diagonal has closed image in `|X ×_S X|`. -/
def Diamond.IsSeparatedOver {X S : Diamond.{u}} (s : X ⟶ S) : Prop :=
  IsClosed (Set.range (Diamond.spaceMap (pullback.diagonal s)))

/-- Properness over a geometric point `Spd C`: separated, quasicompact and partially proper
(`X = X̄^{/S}`, ECD Proposition 18.6). -/
def Diamond.IsProperOverPoint {X S : Diamond.{u}} (s : X ⟶ S) : Prop :=
  Diamond.IsSeparatedOver s ∧ CompactSpace (Diamond.space X) ∧
    IsIso (Diamond.canonicalCompactification.ι s)

/-- Perfectoid spaces (owner: PerfectoidSpaces P0). -/
def PerfectoidSpace : Type (u + 1) := sorry

instance : Category.{u} PerfectoidSpace.{u} := sorry

/-- The diamond of a perfectoid space (owner: DiamondsAndVStacks D4). -/
def PerfectoidSpace.toDiamond : PerfectoidSpace.{u} ⥤ Diamond.{u} := sorry

instance : PerfectoidSpace.toDiamond.{u}.Full := sorry
instance : PerfectoidSpace.toDiamond.{u}.Faithful := sorry

/-- Perfectoid Huber pairs `(R, R⁺)` (owner: PerfectoidSpaces P0). -/
def PerfectoidSpace.HuberPair : Type (u + 1) := sorry

/-- The affinoid perfectoid space `Spa(R, R⁺)`. -/
def PerfectoidSpace.spa (A : PerfectoidSpace.HuberPair.{u}) : PerfectoidSpace.{u} := sorry

/-- Global sections `O(X)` of perfectoid spaces. -/
def PerfectoidSpace.Γ : PerfectoidSpace.{u}ᵒᵖ ⥤ CommRingCat.{u} := sorry

/-- A diamond is representable by a perfectoid space. -/
def Diamond.IsPerfectoid (X : Diamond.{u}) : Prop :=
  ∃ P : PerfectoidSpace.{u}, Nonempty (PerfectoidSpace.toDiamond.obj P ≅ X)

/-- A diamond is representable by an affinoid perfectoid space `Spa(R, R⁺)`. -/
def Diamond.IsAffinoidPerfectoid (X : Diamond.{u}) : Prop :=
  ∃ A : PerfectoidSpace.HuberPair.{u},
    Nonempty (PerfectoidSpace.toDiamond.obj (PerfectoidSpace.spa A) ≅ X)

/-- The diamond `T̲ × S` of a locally profinite set over a base (owner: DiamondsAndVStacks
D4). -/
def Diamond.constOver (T : Type) [TopologicalSpace T] (S : Diamond.{u}) : Diamond.{u} := sorry

/-- Étale sheaves of `ℤ/m`-modules on a diamond (owner: DiamondEtaleCohomology). -/
def Diamond.EtSheaf (X : Diamond.{u}) (m : ℕ) : Type (u + 1) := sorry

/-- The constant sheaf `ℤ/m`. -/
def Diamond.EtSheaf.const (X : Diamond.{u}) (m : ℕ) : Diamond.EtSheaf X m := sorry

/-- Pullback of étale sheaves. -/
def Diamond.EtSheaf.pull {X Y : Diamond.{u}} (f : X ⟶ Y) {m : ℕ} :
    Diamond.EtSheaf Y m → Diamond.EtSheaf X m := sorry

/-- Locally constant étale sheaves of `ℤ/m`-modules (owner: DiamondEtaleCohomology). -/
def Diamond.LCSheaf (X : Diamond.{u}) (m : ℕ) : Type (u + 1) := sorry

/-- A locally constant sheaf as an étale sheaf. -/
def Diamond.LCSheaf.toEtSheaf {X : Diamond.{u}} {m : ℕ} :
    Diamond.LCSheaf X m → Diamond.EtSheaf X m := sorry

/-- Pullback of locally constant sheaves. -/
def Diamond.LCSheaf.pull {X Y : Diamond.{u}} (f : X ⟶ Y) {m : ℕ} :
    Diamond.LCSheaf Y m → Diamond.LCSheaf X m := sorry

/-- Étale cohomology `H^i(X, 𝒢)` of a diamond (owner: DiamondEtaleCohomology). -/
def Diamond.Hcoh (X : Diamond.{u}) {m : ℕ} (𝒢 : Diamond.EtSheaf X m) (i : ℕ) : Type := sorry

instance (X : Diamond.{u}) {m : ℕ} (𝒢 : Diamond.EtSheaf X m) (i : ℕ) :
    AddCommGroup (Diamond.Hcoh X 𝒢 i) := sorry

/-- The pullback map `H^i(Y, 𝒢) → H^i(X, f^*𝒢)`. -/
def Diamond.Hcoh.pullMap {X Y : Diamond.{u}} (f : X ⟶ Y) {m : ℕ} (𝒢 : Diamond.EtSheaf Y m)
    (i : ℕ) : Diamond.Hcoh Y 𝒢 i →+ Diamond.Hcoh X (Diamond.EtSheaf.pull f 𝒢) i := sorry

/-- `H^i(X, ℤ/m)`. -/
abbrev DiamondHMod (X : Diamond.{u}) (m i : ℕ) : Type := Diamond.Hcoh X (Diamond.EtSheaf.const X m) i

/-- The stalk `(R^i f_* 𝒢)_x̄` at a geometric point `x̄ : Spd C → Y` (owner:
DiamondEtaleCohomology). -/
def Diamond.RStalk {X Y : Diamond.{u}} (f : X ⟶ Y) {m : ℕ} (𝒢 : Diamond.EtSheaf X m)
    {K : Type u} [NontriviallyNormedField K] (x : Diamond.spa K ⟶ Y) (i : ℕ) : Type := sorry

instance {X Y : Diamond.{u}} (f : X ⟶ Y) {m : ℕ} (𝒢 : Diamond.EtSheaf X m)
    {K : Type u} [NontriviallyNormedField K] (x : Diamond.spa K ⟶ Y) (i : ℕ) :
    AddCommGroup (Diamond.RStalk f 𝒢 x i) := sorry

/-- The base-change map from the stalk `(R^i f_*𝒢)_x̄` to the cohomology of the fibre
`f^{-1}(x̄) = X ×_Y Spd C`. -/
def Diamond.RStalk.toFibre {X Y : Diamond.{u}} (f : X ⟶ Y) {m : ℕ} (𝒢 : Diamond.EtSheaf X m)
    {K : Type u} [NontriviallyNormedField K] (x : Diamond.spa K ⟶ Y) (i : ℕ) :
    Diamond.RStalk f 𝒢 x i →+
      Diamond.Hcoh (pullback f x) (Diamond.EtSheaf.pull (pullback.fst f x) 𝒢) i := sorry

/-- p-adic formal schemes (formal schemes on which `p` is topologically nilpotent), carried by
the formal-scheme carrier `FormalSchemeIG2` of part p03 (owner: SchemeAndStackFoundations /
AdicSpaces). -/
abbrev PadicFormalScheme : Type (u + 1) := FormalSchemeIG2.{u}
instance : HasPullbacks PadicFormalScheme.{u} := sorry

/-- The special fibre `𝔛 ⊗ 𝔽_p` (reduction modulo `p`). -/
def PadicFormalScheme.reduction : PadicFormalScheme.{u} ⥤ Scheme.{u} := sorry

/-- `Spf A` for a `p`-adically complete ring `A`. -/
def PadicFormalScheme.spf (A : CommRingCat.{u}) : PadicFormalScheme.{u} := sorry

/-- The relative affine line `Spf A⟨t⟩`. -/
def PadicFormalScheme.affineLine (A : CommRingCat.{u}) : PadicFormalScheme.{u} := sorry

/-- Affine opens of a formal scheme. -/
def PadicFormalScheme.AffineOpen (𝔛 : PadicFormalScheme.{u}) : Type u := sorry

/-- Sections over an affine open. -/
def PadicFormalScheme.sections (𝔛 : PadicFormalScheme.{u}) (U : 𝔛.AffineOpen) :
    CommRingCat.{u} := sorry

/-- Flatness over `ℤ_p`: `p` is a non-zero-divisor on all affine sections. -/
def PadicFormalScheme.IsFlatPadic (p : ℕ) (𝔛 : PadicFormalScheme.{u}) : Prop :=
  ∀ U : 𝔛.AffineOpen, (p : 𝔛.sections U) ∈ nonZeroDivisors (𝔛.sections U)

/-- The adic generic fibre (as a diamond over `Spd ℚ_p`). -/
def PadicFormalScheme.adicGenericFibre : PadicFormalScheme.{u} ⥤ Diamond.{u} := sorry

/-- Base change `𝔛 ×̂_{W(k)} O_C` of a formal scheme over `W(k)`, `k` the residue field of `C`
(along `W(k) → O_C` given by the fixed section). -/
def PadicFormalScheme.baseChangeOC {p : ℕ} [Fact p.Prime] (𝔛 : PadicFormalScheme.{u})
    (C : PadicCField.{u} p) : PadicFormalScheme.{u} := sorry

/-- The structure map of the generic fibre of a formal scheme over `O_C` to `Spd C`. -/
def PadicFormalScheme.genericToSpa {p : ℕ} [Fact p.Prime] (𝔛 : PadicFormalScheme.{u})
    (C : PadicCField.{u} p) :
    PadicFormalScheme.adicGenericFibre.obj (𝔛.baseChangeOC C) ⟶ Diamond.spa C.C := sorry

/-- The structure map to `Spf W(k)`. -/
def PadicFormalScheme.toSpfW (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    (𝔛 : PadicFormalScheme.{u}) : 𝔛 ⟶ PadicFormalScheme.spf (CommRingCat.of (WittVector p k)) :=
  sorry

/-- Étale cohomology `H^i(𝔛, ℤ/m)` of a formal scheme (owner: AdicEtaleGeometry). -/
def PadicFormalScheme.EtH (𝔛 : PadicFormalScheme.{u}) (m i : ℕ) : Type := sorry

instance (𝔛 : PadicFormalScheme.{u}) (m i : ℕ) : AddCommGroup (𝔛.EtH m i) := sorry

/-- Isomorphisms `T_p 𝒳 ≅ L ⊗ ℤ_p` compatible with `G`-structures (owner: IG.0/g-structure). -/
def PDivGStructure.TateTriv {D : UnitarySimilitudeDatum} {p : ℕ} {S : Scheme.{u}}
    (X : PDivGStructure D p S) : Type u := sorry

/-- Transport of a Tate-module trivialization along an isomorphism. -/
def PDivGStructure.TateTriv.transport {D : UnitarySimilitudeDatum} {p : ℕ} {S : Scheme.{u}}
    {X Y : PDivGStructure D p S} (e : X ≅ Y) : X.TateTriv → Y.TateTriv := sorry

/-- The modular-curve case of the unitary datum: `n = 1` and `F` imaginary quadratic. -/
def UnitarySimilitudeDatum.IsModularCase (D : UnitarySimilitudeDatum) : Prop :=
  D.n = 1 ∧ Module.finrank ℚ (NumberField.maximalRealSubfield D.F) = 1

end IG3Carriers

/-! ### Shimura-variety carriers at finite and infinite level (owner: PerfectoidShimuraVarieties
S3; integral models: IG.0/integral-model) -/

section IG3Shimura


/-- The adic space `S_{K(p^m N), ℚ_p}` (as a diamond over `Spd ℚ_p`). -/
def ShimuraAdic (D : UnitarySimilitudeDatum) (p N : ℕ) (m : ℕ) : Diamond.{u} := sorry

/-- The transition map `S_{K(p^{m'}N)} → S_{K(p^m N)}` for `m ≤ m'`. -/
def ShimuraAdic.transition (D : UnitarySimilitudeDatum) (p N : ℕ) {m m' : ℕ} (h : m ≤ m') :
    ShimuraAdic.{u} D p N m' ⟶ ShimuraAdic.{u} D p N m := sorry

/-- A prime-to-`p` Hecke correspondence `S_{K(p^m N)} ← S_g → S_{K(p^m N)}` attached to
`g ∈ G(𝔸_f^p)`: its source. -/
def ShimuraAdic.heckeSource (D : UnitarySimilitudeDatum) (p N : ℕ) (m : ℕ) (g : GAfp D p) : Diamond.{u} := sorry

/-- The first leg of the Hecke correspondence. -/
def ShimuraAdic.heckeLeft (D : UnitarySimilitudeDatum) (p N : ℕ) (m : ℕ) (g : GAfp D p) :
    ShimuraAdic.heckeSource.{u} D p N m g ⟶ ShimuraAdic.{u} D p N m := sorry

/-- The second leg of the Hecke correspondence. -/
def ShimuraAdic.heckeRight (D : UnitarySimilitudeDatum) (p N : ℕ) (m : ℕ) (g : GAfp D p) :
    ShimuraAdic.heckeSource.{u} D p N m g ⟶ ShimuraAdic.{u} D p N m := sorry

/-- The `p`-adic completion of `S_{K(N)} ⊗ ℤ_p` (owner: IG.0/integral-model). -/
def ShimuraFormalCompletion (D : UnitarySimilitudeDatum) (p N : ℕ) : PadicFormalScheme.{u} := sorry

/-- The map from the adic generic fibre of the completion into `S_{K(N),ℚ_p}`. -/
def ShimuraFormalCompletion.toAdic (D : UnitarySimilitudeDatum) (p N : ℕ) :
    PadicFormalScheme.adicGenericFibre.obj (ShimuraFormalCompletion.{u} D p N) ⟶
      ShimuraAdic.{u} D p N 0 := sorry

/-- The infinite-level minimal compactification `S^*_{K(p^∞N)} = lim_m S^{*,◇}_{K(p^mN)}`. -/
def MinimalShimuraInf (D : UnitarySimilitudeDatum) (p N : ℕ) : Diamond.{u} := sorry

/-- The infinite-level toroidal compactification `S^tor_{K(p^∞N)}`. -/
def ToroidalShimuraInf (D : UnitarySimilitudeDatum) (p N : ℕ) : Diamond.{u} := sorry

/-- The projection `S^tor_{K(p^∞N)} → S^*_{K(p^∞N)}`. -/
def ToroidalShimuraInf.toMin (D : UnitarySimilitudeDatum) (p N : ℕ) : ToroidalShimuraInf.{u} D p N ⟶ MinimalShimuraInf.{u} D p N :=
  sorry

/-- `π^*_HT : S^*_{K(p^∞N)} → Fℓ`. -/
def piHTMin (D : UnitarySimilitudeDatum) (p N : ℕ) : MinimalShimuraInf.{u} D p N ⟶ FlagVariety.{u} D p := sorry

/-- `π^tor_HT : S^tor_{K(p^∞N)} → Fℓ`. -/
def piHTTor (D : UnitarySimilitudeDatum) (p N : ℕ) : ToroidalShimuraInf.{u} D p N ⟶ FlagVariety.{u} D p := sorry

/-- `π^tor_HT = π^*_HT ∘ (S^tor → S^*)`. -/
theorem piHTTor_comp (D : UnitarySimilitudeDatum) (p N : ℕ) :
    ToroidalShimuraInf.toMin D p N ≫ piHTMin D p N = piHTTor.{u} D p N ≫ 𝟙 _ := sorry

/-- The open inclusion `S°_{K(p^∞N)} ⊂ S^*_{K(p^∞N)}`. -/
def GoodReductionLocus.toMin (D : UnitarySimilitudeDatum) (p N : ℕ) : GoodReductionLocus.{u} D p N ⟶ MinimalShimuraInf.{u} D p N :=
  sorry

/-- The open inclusion `S°_{K(p^∞N)} ⊂ S^tor_{K(p^∞N)}`. -/
def GoodReductionLocus.toTor (D : UnitarySimilitudeDatum) (p N : ℕ) : GoodReductionLocus.{u} D p N ⟶ ToroidalShimuraInf.{u} D p N :=
  sorry

/-- The Shimura variety `S_{K(N), ℚ̄}` over an algebraic closure of `ℚ` (owner:
IG.0/integral-model). -/
def ShimuraQbar (D : UnitarySimilitudeDatum) (p N : ℕ) : Scheme.{u} := sorry

instance (D : UnitarySimilitudeDatum) (p N : ℕ) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (EtH (ShimuraQbar.{u} D p N) (ZMod ℓ) i) := sorry

end IG3Shimura

/-! ### IG.3/good-reduction-locus -/

section GoodReduction

/-- (IG.3/good-reduction-locus) The good-reduction locus `S°_{K(p^mN),ℚ_p} ⊂ S_{K(p^mN),ℚ_p}`:
the open subset of points where the universal abelian variety has good reduction. -/
def goodReductionLocus (D : UnitarySimilitudeDatum) (p N m : ℕ) :
    TopologicalSpace.Opens (Diamond.space (ShimuraAdic.{u} D p N m)) := sorry

/-- The good-reduction locus is quasicompact. -/
theorem goodReductionLocus_isCompact (D : UnitarySimilitudeDatum) (p N m : ℕ) :
    IsCompact (goodReductionLocus.{u} D p N m : Set (Diamond.space (ShimuraAdic.{u} D p N m))) :=
  sorry

/-- (IG.3/good-reduction-locus) For `p ∤ NΔ_F`, `S°_{K(N),ℚ_p}` is the adic generic fibre of
the `p`-adic completion of `S_{K(N)} ⊗ ℤ_p`. -/
theorem goodReductionLocus_eq_genericFibre (D : UnitarySimilitudeDatum) (p N : ℕ)
    [Fact p.Prime] (hp : ¬ (p : ℤ) ∣ N * NumberField.discr D.F) :
    ∃ e : PadicFormalScheme.adicGenericFibre.obj (ShimuraFormalCompletion.{u} D p N) ≅
        Diamond.restrict _ (goodReductionLocus.{u} D p N 0),
      e.hom ≫ Diamond.restrict.ι _ _ = ShimuraFormalCompletion.toAdic D p N := sorry

/-- (IG.3/good-reduction-locus) Stability under the transition maps in `p`-level and under
prime-to-`p` Hecke correspondences. -/
theorem goodReductionLocus_hecke (D : UnitarySimilitudeDatum) (p N : ℕ) :
    (∀ {m m' : ℕ} (h : m ≤ m'), goodReductionLocus.{u} D p N m' =
      TopologicalSpace.Opens.comap (Diamond.spaceMap (ShimuraAdic.transition D p N h))
        (goodReductionLocus D p N m)) ∧
    (∀ (m : ℕ) (g : GAfp D p),
      TopologicalSpace.Opens.comap (Diamond.spaceMap (ShimuraAdic.heckeLeft.{u} D p N m g))
          (goodReductionLocus D p N m) =
        TopologicalSpace.Opens.comap (Diamond.spaceMap (ShimuraAdic.heckeRight D p N m g))
          (goodReductionLocus D p N m)) := sorry

/-- The tower `m ↦ S°^◇_{K(p^mN),ℚ_p}` (restrictions of the transition maps). -/
def goodReductionTower (D : UnitarySimilitudeDatum) (p N : ℕ) : ℕᵒᵖ ⥤ Diamond.{u} := sorry

theorem goodReductionTower_obj (D : UnitarySimilitudeDatum) (p N m : ℕ) :
    (goodReductionTower.{u} D p N).obj (Opposite.op m) =
      Diamond.restrict _ (goodReductionLocus D p N m) := sorry

/-- The projections `S°_{K(p^∞N)} → S°_{K(p^mN)}`. -/
def GoodReductionLocus.toLevel (D : UnitarySimilitudeDatum) (p N m : ℕ) :
    GoodReductionLocus.{u} D p N ⟶ (goodReductionTower D p N).obj (Opposite.op m) := sorry

/-- (IG.3/good-reduction-locus) `S°_{K(p^∞N)} = lim_m S°^◇_{K(p^mN)}` is representable by a
perfectoid space and is open in `S^*_{K(p^∞N)}`; so are `S^*_{K(p^∞N)}` and `S^tor_{K(p^∞N)}`
perfectoid. -/
theorem goodReductionLocus_infinite (D : UnitarySimilitudeDatum) (p N : ℕ) :
    (∃ e : GoodReductionLocus.{u} D p N ≅ limit (goodReductionTower D p N),
      ∀ m, e.hom ≫ limit.π _ (Opposite.op m) = GoodReductionLocus.toLevel D p N m) ∧
    Diamond.IsPerfectoid (GoodReductionLocus.{u} D p N) ∧
    Diamond.IsOpenImmersionD (GoodReductionLocus.toMin.{u} D p N) ∧
    Diamond.IsPerfectoid (MinimalShimuraInf.{u} D p N) ∧
    Diamond.IsPerfectoid (ToroidalShimuraInf.{u} D p N) := sorry

/-- (IG.3/good-reduction-locus) `π°_HT` is the restriction of `π^*_HT` (and of `π^tor_HT`). -/
theorem goodReductionLocus_piHT (D : UnitarySimilitudeDatum) (p N : ℕ) :
    piHTGood.{u} D p N = GoodReductionLocus.toMin D p N ≫ piHTMin D p N ∧
    piHTGood.{u} D p N = GoodReductionLocus.toTor D p N ≫ piHTTor D p N := sorry

/-- The residue discs of the supersingular points of the special fibre of the modular curve
`S_{K(N)}` (finite level, `n = 1`, `F` imaginary quadratic, `p` split), as an open of
`|S_{K(N),ℚ_p}|` (owner: PerfectoidShimuraVarieties S3). -/
def ShimuraAdic.supersingularResidueDiscs (D : UnitarySimilitudeDatum) (p N : ℕ) :
    TopologicalSpace.Opens (Diamond.space (ShimuraAdic.{u} D p N 0)) := sorry

-- test: goodReductionLocus_supersingular — `S°` is not the tube of the ordinary locus: for the modular curve the supersingular residue discs lie in `S°`
example (D : UnitarySimilitudeDatum) (p N : ℕ) (hD : D.IsModularCase) :
    ShimuraAdic.supersingularResidueDiscs.{u} D p N ≤ goodReductionLocus.{u} D p N 0 := sorry

/-- The cusps of the modular curve `S_{K(N),ℚ_p}` (finite level, `n = 1`, `F` imaginary
quadratic), as points of `|S_{K(N),ℚ_p}|` of the minimal compactification (owner:
PerfectoidShimuraVarieties S3). -/
def ShimuraAdic.cuspResidueDiscs (D : UnitarySimilitudeDatum) (p N : ℕ) :
    TopologicalSpace.Opens (Diamond.space (ShimuraAdic.{u} D p N 0)) := sorry

-- test: goodReductionLocus_modular — for the modular curve the complement of `S°` is the union of the open residue discs at the cusps
example (D : UnitarySimilitudeDatum) (p N : ℕ) (hD : D.IsModularCase) :
    ((goodReductionLocus.{u} D p N 0 : Set _))ᶜ =
      (ShimuraAdic.cuspResidueDiscs.{u} D p N : Set (Diamond.space (ShimuraAdic D p N 0))) :=
  sorry

-- test: goodReductionLocus_not_closed — `S°` is not closed in `S_{ℚ_p}` (the quasi-split Shimura variety is non-compact)
example (D : UnitarySimilitudeDatum) (p N m : ℕ) :
    ¬ IsClosed (goodReductionLocus.{u} D p N m : Set (Diamond.space (ShimuraAdic.{u} D p N m))) :=
  sorry

end GoodReduction

/-! ### IG.3/good-reduction-locus-cohomology -/

/-- The good-reduction locus `S°_{K(N),C}` over `C`. -/
def goodReductionLocusC (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) : Diamond.{u} := sorry

instance (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime] (C : PadicCField.{u} p)
    (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (DiamondH (goodReductionLocusC D p N C) ℓ i) := sorry

/-- The natural restriction map `H^i(S_{K(N),ℚ̄}, 𝔽_ℓ) → H^i(S°_{K(N),C}, 𝔽_ℓ)` (comparison
of algebraic and analytic étale cohomology followed by restriction), `𝕋^S`-linear. -/
def goodReductionRestriction (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) (S : Finset ℕ) (ℓ i : ℕ) :
    EtH (ShimuraQbar.{u} D p N) (ZMod ℓ) i →ₗ[HeckeAlgebra D S]
      DiamondH (goodReductionLocusC D p N C) ℓ i := sorry

/-- (IG.3/good-reduction-locus-cohomology) CSnc Proposition 2.6.4 (Lan–Stroh Corollary 5.20):
the Hecke-equivariant restriction `H^i(S_{K(N),ℚ̄}, 𝔽_ℓ) → H^i(S°_{K(N),C}, 𝔽_ℓ)` is an
isomorphism for all `i` and `ℓ ≠ p`, `N ≥ 3` prime to `p`. -/
theorem goodReductionLocusCohomology (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (hN : 3 ≤ N) (hpN : Nat.Coprime p N) (C : PadicCField.{u} p) (S : Finset ℕ) (ℓ : ℕ)
    (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) (i : ℕ) :
    Function.Bijective (goodReductionRestriction.{u} D p N C S ℓ i) := sorry

/-! ### IG.3/flag-points-and-p-divisible-groups -/

section FlagPoints

variable {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {C : PadicCField.{u} p}

/-- Pairs `(𝒳_{O_C}, α)`: a p-divisible group with `G`-structure over `O_C` and a
trivialization `α : T_p𝒳 ≅ L ⊗ ℤ_p` compatible with `G`-structures. -/
structure HTPair (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] (C : PadicCField.{u} p) where
  X : PDivGStructure D p (Spec C.O)
  α : X.TateTriv

/-- Isomorphism of pairs. -/
def HTPair.Iso (a b : HTPair D p C) : Prop :=
  ∃ e : a.X ≅ b.X, PDivGStructure.TateTriv.transport e a.α = b.α

/-- The pair `(𝒳_{O_C}, α)` attached to `x ∈ Fℓ(C)`. -/
def FlagPoint.pair (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) : HTPair D p C := sorry

/-- The special fibre `X_k = 𝒳_{O_C} ⊗ k` of the p-divisible group of a flag point. -/
def FlagPoint.specialFibre (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    PDivGStructure D p (pt C.k) := sorry

/-- The Newton point `b(x) ∈ B(G_{ℚ_p}, μ⁻¹)` of a flag point (owner: BunGAndNewtonStrata BG3). -/
def FlagPoint.newton (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) : KottwitzSet D p := sorry

/-- (IG.3/flag-points-and-p-divisible-groups) Scholze–Weinstein Theorem B with PEL structure:
`x ↦ (𝒳_{O_C}, α)` is a bijection from `Fℓ(C)` onto isomorphism classes of pairs; the special
fibre of `𝒳_{O_C}` is `X_k` and `b(x)` is the isogeny class of `X_k`. (The Hodge–Tate
filtration description and the symplectic splittings `δ_𝒳, δ_X` are not formalised here: they
need the Tate module and Lie algebra as carriers.) -/
theorem flagPointsAndPDivisibleGroups (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) :
    Function.Bijective (fun x : Diamond.spa C.C ⟶ FlagVariety.{u} D p =>
      (Quot.mk HTPair.Iso (FlagPoint.pair x) : Quot (HTPair.Iso (D := D) (p := p) (C := C)))) ∧
    (∀ x : Diamond.spa C.C ⟶ FlagVariety.{u} D p,
      Nonempty ((PDivGStructure.baseChange D p C.toResidue).obj (FlagPoint.pair x).X ≅
        FlagPoint.specialFibre x) ∧
      FlagPoint.newton x = (FlagPoint.specialFibre x).newtonClass) := sorry

end FlagPoints

/-! ### IG.3/flag-newton-strata-dimension -/

/-- The Newton stratum `Fℓ^b ⊂ Fℓ` (locally closed; owner: BunGAndNewtonStrata BG3). -/
def flagStratum (D : UnitarySimilitudeDatum) (p : ℕ) (b : KottwitzSet D p) : Diamond.{u} := sorry

/-- The inclusion `Fℓ^b → Fℓ`. -/
def flagStratum.ι (D : UnitarySimilitudeDatum) (p : ℕ) (b : KottwitzSet D p) :
    flagStratum.{u} D p b ⟶ FlagVariety.{u} D p := sorry

/-- (IG.3/flag-newton-strata-dimension) CS17 Proposition 4.2.23, CSnc Theorem 2.7.3: the
`C`-points of `Fℓ^b` are those with `b(x) = b`; `dim |Fℓ^b| = d − d_b`; the ordinary element is
the largest, with `d_ord = d` (so `Fℓ^{ord}` is `0`-dimensional); `d_b` is monotone in `b`. -/
theorem flagNewtonStrataDimension (D : UnitarySimilitudeDatum) (p : ℕ) [Fact p.Prime] :
    (∀ (C : PadicCField.{u} p) (b : KottwitzSet D p) (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p),
      (∃ y, y ≫ flagStratum.ι D p b = x) ↔ FlagPoint.newton x = b) ∧
    (∀ b : KottwitzSet D p, topologicalKrullDim (Diamond.space (flagStratum.{u} D p b)) =
      ((D.dim - b.dimLeaf : ℕ) : WithBot ℕ∞)) ∧
    (∀ b : KottwitzSet D p, b ≤ KottwitzSet.ordinary D p) ∧
    (KottwitzSet.ordinary D p).dimLeaf = D.dim ∧
    (∀ b b' : KottwitzSet D p, b ≤ b' → b.dimLeaf ≤ b'.dimLeaf) := sorry

/-! ### Local carriers attached to `LocalPELDatum` (IG.0/unramified-local-pel-datum, part p01;
flag varieties and strata owned by BunGAndNewtonStrata BG3) -/

section LocalPEL

variable {p : ℕ} [Fact p.Prime]

/-- The partial order (closure relation) on `B(G, μ⁻¹)` of a local datum (owner:
BunGAndNewtonStrata BG1). -/
instance (Dl : LocalPELDatum p) : PartialOrder Dl.KottwitzSet := sorry

/-- The (μ-)ordinary element of `B(G, μ⁻¹)` of a local datum (owner: BunGAndNewtonStrata BG1). -/
def LocalPELDatum.ordinary (Dl : LocalPELDatum p) : Dl.KottwitzSet := sorry

/-- `G(ℚ_p)`, the `ℚ_p`-points of the reductive model. -/
abbrev LocalPELDatum.G (Dl : LocalPELDatum p) : Type := Dl.reductiveModel ℚ_[p]

/-- `G(ℤ_p)`, the `ℤ_p`-points of the reductive model. -/
abbrev LocalPELDatum.Gzp (Dl : LocalPELDatum p) : Type := Dl.reductiveModel ℤ_[p]

/-- The base `Spd Ĕ` of the local datum. -/
def LocalPELDatum.base (Dl : LocalPELDatum p) : Diamond.{u} := sorry

/-- The flag variety `Fℓ_{G,μ}` over `Spd Ĕ`. -/
def LocalPELDatum.flag (Dl : LocalPELDatum p) : Diamond.{u} := sorry

/-- Its structure map. -/
def LocalPELDatum.flagToBase (Dl : LocalPELDatum p) : Dl.flag.{u} ⟶ Dl.base := sorry

/-- The action of `g ∈ G(ℚ_p)` on `Fℓ_{G,μ}`. -/
def LocalPELDatum.flagAct (Dl : LocalPELDatum p) (g : Dl.G) : Dl.flag.{u} ⟶ Dl.flag := sorry

/-- The Newton stratum `Fℓ^b_{G,μ}`. -/
def LocalPELDatum.flagStratum (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) : Diamond.{u} := sorry

/-- Its inclusion. -/
def LocalPELDatum.flagStratumι (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    Dl.flagStratum.{u} b ⟶ Dl.flag := sorry

end LocalPEL

/-! ### IG.3/local-hodge-tate-period-map -/

section LocalHT

variable {p : ℕ} [Fact p.Prime]

/-- (IG.3/local-hodge-tate-period-map) The Rapoport–Zink space at infinite level `M_{D,∞}`
(CS17 Definition 4.2.3, Theorem 4.2.4), a preperfectoid space over `Spa Ĕ(ζ_{p^∞})`, recorded
by its diamond. -/
def RZSpaceInfinite (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) : Diamond.{u} := sorry

/-- The finite-level spaces `M_{D^int,n}`. -/
def RZSpaceLevel (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (n : ℕ) : Diamond.{u} := sorry

/-- The tower `n ↦ M_{D^int,n}` (finite étale transition maps). -/
def RZSpaceTower (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) : ℕᵒᵖ ⥤ Diamond.{u} := sorry

/-- The projections `M_{D,∞} → M_{D^int,n}`. -/
def RZSpaceInfinite.toLevel (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (n : ℕ) :
    RZSpaceInfinite.{u} Dl b ⟶ (RZSpaceTower Dl b).obj (Opposite.op n) := sorry

/-- The structure map to `Spd Ĕ`. -/
def RZSpaceInfinite.toBase (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    RZSpaceInfinite.{u} Dl b ⟶ Dl.base := sorry

/-- (IG.3/local-hodge-tate-period-map) `M_{D,∞} ∼ lim_n M_{D^int,n}`: on diamonds the
projections identify `M_{D,∞}` with the limit, and `M_{D,∞}` is preperfectoid (its diamond is
the perfectoid space `M̂_{D,∞}`). -/
theorem RZSpaceInfinite.tilde_lim (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    (∃ e : RZSpaceInfinite.{u} Dl b ≅ limit (RZSpaceTower Dl b),
      ∀ n, e.hom ≫ limit.π _ (Opposite.op n) = RZSpaceInfinite.toLevel Dl b n) ∧
    Diamond.IsPerfectoid (RZSpaceInfinite.{u} Dl b) := sorry

/-- The v-sheaf of `B`-linear maps `V → (X̃_b)^ad_η(R, R⁺)` matching the polarization, with
totally isotropic image in `D(X_b)[1/p] ⊗ R`, locally free quotient `W ≅ V₁ ⊗ R` locally, and
`0 → V → X̃_b(C, C⁺) → W ⊗ C → 0` exact at geometric points (CS17 Proposition 4.2.5). -/
def RZSpaceInfinite.rationalSheaf (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) : Diamond.{u} :=
  sorry

/-- The natural map from `M_{D,∞}` to the rational description. -/
def RZSpaceInfinite.toRational (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    RZSpaceInfinite.{u} Dl b ⟶ RZSpaceInfinite.rationalSheaf Dl b := sorry

/-- (IG.3/local-hodge-tate-period-map) `M_{D,∞}` depends only on the rational datum: the map
to the sheafified rational description is an isomorphism. -/
theorem RZSpaceInfinite.rational_description (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    IsIso (RZSpaceInfinite.toRational.{u} Dl b) := sorry

/-- The action of `g ∈ G(ℚ_p)` on `M_{D,∞}` (through `α`). -/
def RZSpaceInfinite.actG (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (g : Dl.G) :
    RZSpaceInfinite.{u} Dl b ⟶ RZSpaceInfinite Dl b := sorry

/-- The action of `j ∈ J_b(ℚ_p)` on `M_{D,∞}` (through `ρ`). -/
def RZSpaceInfinite.actJ (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (j : Dl.J b) :
    RZSpaceInfinite.{u} Dl b ⟶ RZSpaceInfinite Dl b := sorry

/-- (IG.3/local-hodge-tate-period-map) The local Hodge–Tate period map
`π_HT : M_{D,∞} → Fℓ_{G,μ}`, sending a point to the kernel of `V ⊗ R → D(X_b)[1/p] ⊗ R`. -/
def localHodgeTate (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    RZSpaceInfinite.{u} Dl b ⟶ Dl.flag := sorry

/-- `π_HT` is `G(ℚ_p)`-equivariant. -/
theorem localHodgeTate_equivariant (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (g : Dl.G) :
    RZSpaceInfinite.actG.{u} Dl b g ≫ localHodgeTate Dl b =
      localHodgeTate Dl b ≫ Dl.flagAct g := sorry

/-- The factorisation `π^b_HT : M_{D,∞} → Fℓ^b_{G,μ}`. -/
def localHodgeTateStratum (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    RZSpaceInfinite.{u} Dl b ⟶ Dl.flagStratum b := sorry

/-- (IG.3/local-hodge-tate-period-map) `π_HT` factors through the `b`-stratum. -/
theorem localHodgeTate_mem_stratum (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    localHodgeTateStratum.{u} Dl b ≫ Dl.flagStratumι b = localHodgeTate Dl b := sorry

/-- (IG.3/local-hodge-tate-period-map) The actions of `G(ℚ_p)` and `J_b(ℚ_p)` commute, and
`π_HT` is `J_b(ℚ_p)`-invariant. -/
theorem RZSpaceInfinite.groupActions (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    (∀ (g : Dl.G) (j : Dl.J b), RZSpaceInfinite.actG.{u} Dl b g ≫ RZSpaceInfinite.actJ Dl b j =
      RZSpaceInfinite.actJ Dl b j ≫ RZSpaceInfinite.actG Dl b g) ∧
    (∀ j : Dl.J b, RZSpaceInfinite.actJ.{u} Dl b j ≫ localHodgeTate Dl b = localHodgeTate Dl b) :=
  sorry

-- test: localHodgeTate_J_invariant — J_b acts on the source and fixes the period map
example (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (j : Dl.J b) :
    RZSpaceInfinite.actJ.{u} Dl b j ≫ localHodgeTate Dl b = localHodgeTate Dl b := sorry

/-- The Drinfeld upper half plane `Ω ⊂ ℙ¹ = Fℓ` (for `LocalPELDatum.lubinTate p 2`, the PEL
realization of `GL₂ × 𝔾_m` of part p01) (owner: BunGAndNewtonStrata BG3). -/
def drinfeldUpperHalfPlane (p : ℕ) [Fact p.Prime] : Diamond.{u} := sorry

/-- The inclusion `Ω → ℙ¹`. -/
def drinfeldUpperHalfPlane.ι (p : ℕ) [Fact p.Prime] :
    drinfeldUpperHalfPlane.{u} p ⟶ (LocalPELDatum.lubinTate p 2).flag := sorry

-- test: localHodgeTate_lubinTate — for Lubin–Tate, `π_HT` maps `M_{LT,∞}` onto Drinfeld's `Ω` on rank-one points
example (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ (LocalPELDatum.lubinTate p 2).flag) :
    (∃ y, y ≫ localHodgeTate _ (LocalPELDatum.lubinTate p 2).basic = x) ↔
      ∃ z, z ≫ drinfeldUpperHalfPlane.ι p = x := sorry

-- test: localHodgeTate_not_surjective_Fl — `π_HT` is not surjective onto `Fℓ_{G,μ}` (its image is one stratum)
example :
    ∃ (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ (LocalPELDatum.lubinTate p 2).flag),
      ¬ ∃ y, y ≫ localHodgeTate _ (LocalPELDatum.lubinTate p 2).basic = x := sorry

end LocalHT

/-! ### IG.3/local-period-fibres -/

section LocalFibres

variable {p : ℕ} [Fact p.Prime]

/-- The adic generic fibre `Aut_G(X̃_b)^ad_η` of the automorphism group of the universal cover,
over `Spa L` (owner: here; built from BunGAndNewtonStrata BG0). -/
def AutGroupAd (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) : Diamond.{u} := sorry

/-- Its structure map to the base `Spd Ĕ`. -/
def AutGroupAd.toBase (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) : AutGroupAd.{u} Dl b ⟶ Dl.base :=
  sorry

/-- The action map `M_{D,∞} ×_{Spa L} Aut_G(X̃_b)^ad_η → M_{D,∞}`. -/
def RZSpaceInfinite.autAction (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    pullback (RZSpaceInfinite.toBase.{u} Dl b) (AutGroupAd.toBase Dl b) ⟶ RZSpaceInfinite Dl b :=
  sorry

/-- `π_HT` is invariant under the `Aut_G(X̃_b)^ad_η`-action. -/
theorem localPeriodFibres_invariant (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    pullback.fst _ _ ≫ localHodgeTate.{u} Dl b = RZSpaceInfinite.autAction Dl b ≫ localHodgeTate Dl b :=
  sorry

/-- (IG.3/local-period-fibres) CS17 Proposition 4.2.14: the action map
`M̂_{D,∞} ×_{Spa L} Aut_G(X̃_b)^ad_η → (M_{D,∞} ×_{Fℓ_{G,μ}} M_{D,∞})^∧`, `(m, g) ↦ (m, m·g)`,
is an isomorphism (of perfectoid spaces; recorded on diamonds, fibre products over a common
base as corrected in PAPER-CARAIANI-SCHOLZE-17/E44). -/
theorem localPeriodFibres (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) :
    IsIso (pullback.lift (pullback.fst _ _) (RZSpaceInfinite.autAction.{u} Dl b)
      (localPeriodFibres_invariant Dl b) :
        pullback (RZSpaceInfinite.toBase.{u} Dl b) (AutGroupAd.toBase Dl b) ⟶
          pullback (localHodgeTate Dl b) (localHodgeTate Dl b)) := sorry

end LocalFibres

/-! ### IG.3/integral-extension-lemma -/

/-- The canonical isomorphism of base-change functors attached to a commutative square of
schemes (pseudo-functoriality of `PDivGroup.baseChange`). -/
def PDivGroup.baseChangeSquare {p : ℕ} {S T T' U : Scheme.{u}} {f : T ⟶ S} {g : U ⟶ T}
    {f' : T' ⟶ S} {g' : U ⟶ T'} (h : g ≫ f = g' ≫ f') :
    PDivGroup.baseChange f ⋙ PDivGroup.baseChange g ≅
      PDivGroup.baseChange f' ⋙ PDivGroup.baseChange (p := p) g' := sorry

/-- (IG.3/integral-extension-lemma) CS17 Lemma 4.2.15: let `R⁺` be integrally closed in
`R = R⁺[1/p]` and `G, H` p-divisible groups over `R⁺` with constant Newton polygons at the
geometric points of `Spec(R⁺/p)`. A morphism `f_R : G_R → H_R` extends to `R⁺` iff for every
rank-one geometric point `Spa(C, O_C) → Spa(R, R⁺)` the base change `f_C` extends to `O_C`. -/
theorem integralExtensionLemma {p : ℕ} [Fact p.Prime] (Rp : Type u) [CommRing Rp]
    [IsIntegrallyClosedIn Rp (Localization.Away (p : Rp))]
    (G H : PDivGroup p (Spec (CommRingCat.of Rp)))
    (hG : ∀ (k k' : Type u) [Field k] [IsAlgClosed k] [CharP k p] [Field k'] [IsAlgClosed k']
      [CharP k' p] (s : pt k ⟶ Spec (CommRingCat.of Rp)) (s' : pt k' ⟶ Spec (CommRingCat.of Rp)),
      ((PDivGroup.baseChange s).obj G).newtonPolygon = ((PDivGroup.baseChange s').obj G).newtonPolygon)
    (hH : ∀ (k k' : Type u) [Field k] [IsAlgClosed k] [CharP k p] [Field k'] [IsAlgClosed k']
      [CharP k' p] (s : pt k ⟶ Spec (CommRingCat.of Rp)) (s' : pt k' ⟶ Spec (CommRingCat.of Rp)),
      ((PDivGroup.baseChange s).obj H).newtonPolygon = ((PDivGroup.baseChange s').obj H).newtonPolygon)
    (fR : (PDivGroup.baseChange (Spec.map (CommRingCat.ofHom
        (algebraMap Rp (Localization.Away (p : Rp)))))).obj G ⟶
      (PDivGroup.baseChange (Spec.map (CommRingCat.ofHom
        (algebraMap Rp (Localization.Away (p : Rp)))))).obj H) :
    (∃ f : G ⟶ H, (PDivGroup.baseChange (Spec.map (CommRingCat.ofHom
        (algebraMap Rp (Localization.Away (p : Rp)))))).map f = fR) ↔
    ∀ (C : PadicCField.{u} p) (φ : Spec C.O ⟶ Spec (CommRingCat.of Rp))
      (ψ : Spec (CommRingCat.of C.C) ⟶ Spec (CommRingCat.of (Localization.Away (p : Rp))))
      (h : ψ ≫ Spec.map (CommRingCat.ofHom (algebraMap Rp (Localization.Away (p : Rp)))) =
        Spec.map C.OtoC ≫ φ),
      ∃ g : (PDivGroup.baseChange φ).obj G ⟶ (PDivGroup.baseChange φ).obj H,
        (PDivGroup.baseChange (Spec.map C.OtoC)).map g =
          (PDivGroup.baseChangeSquare h).inv.app G ≫ (PDivGroup.baseChange ψ).map fR ≫
            (PDivGroup.baseChangeSquare h).hom.app H := sorry

/-! ### IG.3/local-period-surjective-on-stratum -/

/-- (IG.3/local-period-surjective-on-stratum) CS17 Lemma 4.2.18: for `C` complete algebraically
closed (over `Ĕ(ζ_{p^∞})`), `π^b_HT : M_{D,∞}(C, O_C) → Fℓ^b_{G,μ}(C, O_C)` is surjective. -/
theorem localPeriodSurjectiveOnStratum {p : ℕ} [Fact p.Prime] (Dl : LocalPELDatum p)
    (b : Dl.KottwitzSet) (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ Dl.flagStratum b) :
    ∃ y : Diamond.spa C.C ⟶ RZSpaceInfinite.{u} Dl b, y ≫ localHodgeTateStratum Dl b = x := sorry

/-! ### IG.3/automorphism-group-dimension -/

/-- The base change `Aut_G(X̃_b)^ad ×_{Spa O_Ĕ} Spa(K, O_K)` for a complete nonarchimedean
field `K` over `O_Ĕ`. -/
def AutGroupAd.over {p : ℕ} [Fact p.Prime] (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (K : Type u)
    [NontriviallyNormedField K] : Diamond.{u} := sorry

/-- Its structure map to `Spd(K, O_K)`. -/
def AutGroupAd.overToBase {p : ℕ} [Fact p.Prime] (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (K : Type u)
    [NontriviallyNormedField K] : AutGroupAd.over.{u} Dl b K ⟶ Diamond.spa K := sorry

/-- The perfectoid open unit polydisc `Spa(O_Ĕ[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]) ×_{Spa O_Ĕ}
Spa(K, O_K)` of dimension `d` (owner: PerfectoidSpaces P0). -/
def perfectoidOpenPolydisc (d : ℕ) (K : Type u) [NontriviallyNormedField K] : Diamond.{u} := sorry

/-- (IG.3/automorphism-group-dimension) CS17 Proposition 4.2.22: for `K` complete
nonarchimedean of characteristic `0` over `O_Ĕ`, `Aut_G(X̃_b)^ad_K` is partially proper over
`Spa(K, O_K)` (it equals its canonical compactification), of dimension `⟨2ρ, ν_b⟩`, and every
connected component is a perfectoid open unit polydisc of that dimension. -/
theorem automorphismGroupDimension {p : ℕ} [Fact p.Prime] (Dl : LocalPELDatum p)
    (b : Dl.KottwitzSet) (K : Type u) [NontriviallyNormedField K] [CompleteSpace K]
    [IsUltrametricDist K] [NormedAlgebra ℚ_[p] K] :
    IsIso (Diamond.canonicalCompactification.ι (AutGroupAd.overToBase.{u} Dl b K)) ∧
    topologicalKrullDim (Diamond.space (AutGroupAd.over.{u} Dl b K)) =
      ((LocalPELDatum.dimLeaf b : ℕ) : WithBot ℕ∞) ∧
    ∀ (x : Diamond.space (AutGroupAd.over.{u} Dl b K))
      (U : TopologicalSpace.Opens (Diamond.space (AutGroupAd.over.{u} Dl b K))),
      (U : Set _) = connectedComponent x →
        Nonempty (Diamond.restrict _ U ≅ perfectoidOpenPolydisc (LocalPELDatum.dimLeaf b) K) := sorry

/-! ### IG.3/canonical-lift-of-igusa -/

section CanonicalLift

/-- (IG.3/canonical-lift-of-igusa) The canonical lift `W(Y)`: the unique flat `p`-adic formal
scheme over `W(k)` lifting a perfect `k`-scheme `Y` (Witt vectors of an affine cover, glued). -/
def canonicalLift (p : ℕ) (Y : Scheme.{u}) : PadicFormalScheme.{u} := sorry

/-- `W(Y)` reduces to `Y` modulo `p`, and is flat over `ℤ_p`, for `Y` perfect. -/
theorem canonicalLift_reduction (p : ℕ) (Y : Scheme.{u}) [PerfectSchemeIG1 p Y] :
    Nonempty (PadicFormalScheme.reduction.obj (canonicalLift p Y) ≅ Y) ∧
      (canonicalLift p Y).IsFlatPadic p := sorry

/-- (IG.3/canonical-lift-of-igusa) Uniqueness: any flat `p`-adic formal scheme with special
fibre `Y` (perfect) is isomorphic to `W(Y)`. -/
theorem canonicalLift_unique (p : ℕ) (Y : Scheme.{u}) [PerfectSchemeIG1 p Y]
    (𝔛 : PadicFormalScheme.{u}) (h𝔛 : 𝔛.IsFlatPadic p)
    (e : PadicFormalScheme.reduction.obj 𝔛 ≅ Y) : Nonempty (𝔛 ≅ canonicalLift p Y) := sorry

/-- (IG.3/canonical-lift-of-igusa) The generic fibre of `W(Y) ×̂_{W(k)} O_C` is a perfectoid
space. -/
theorem canonicalLift_genericFibre_perfectoid (p : ℕ) [Fact p.Prime] (C : PadicCField.{u} p)
    (Y : Scheme.{u}) [PerfectSchemeIG1 p Y] :
    Diamond.IsPerfectoid
      (PadicFormalScheme.adicGenericFibre.obj ((canonicalLift p Y).baseChangeOC C)) := sorry

/-- The category `Nilp_{W(k)}` of `W(k)`-algebras in which `p` is nilpotent. -/
abbrev NilpW (p : ℕ) [Fact p.Prime] (k : Type u) [CommRing k] [CharP k p] : Type (u + 1) :=
  ObjectProperty.FullSubcategory
    (fun A : Under (CommRingCat.of (WittVector p k)) => IsNilpotent ((p : A.right)))

/-- The functor of points of a `p`-adic formal scheme over `W(k)` on `Nilp_{W(k)}`. -/
def PadicFormalScheme.pointsOn (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    (𝔛 : PadicFormalScheme.{u}) : NilpW p k ⥤ Type u := sorry

/-- The moduli functor of pairs `(A, ρ)` with `A` an abelian variety with `G`-structure over
`R ∈ Nilp_{W(k)}` and `ρ : A[p^∞] ≅ X_{W(k)} ⊗ R` an isomorphism with `G`-structures, for a
fixed lift `X_{W(k)}` of `X` (owner: here). -/
def igusaLiftModuli {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u} [Field k]
    [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
    (Xlift : PDivGStructure D p (Spec (CommRingCat.of (WittVector p k)))) :
    NilpW p k ⥤ Type u := sorry

/-- (IG.3/canonical-lift-of-igusa) CS17 Lemma 4.3.10 (over `O_Ĕ = W(k)`): for a lift
`X_{W(k)}` of the completely slope divisible `X`, `Ig^b_{O_Ĕ} = W(Ig^b)` represents
`(A, ρ : A[p^∞] ≅ X_{W(k)} ⊗ R)` on `Nilp_{W(k)}`. -/
theorem canonicalLift_moduli {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u}
    [Field k] [IsAlgClosed k] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k))
    (Xlift : PDivGStructure D p (Spec (CommRingCat.of (WittVector p k))))
    (hlift : Nonempty ((PDivGStructure.baseChange D p (Spec.map (CommRingCat.ofHom
      (WittVector.constantCoeff (p := p) (R := k))))).obj Xlift ≅ X)) :
    Nonempty ((canonicalLift p (IgusaVariety N X)).pointsOn p k ≅ igusaLiftModuli N X Xlift) :=
  sorry

/-- The formal scheme `𝔛^b` of pairs `(A, ρ)` with `ρ : A[p^∞] ⊗ R/p → X_b ⊗ R/p` a
quasi-isogeny with extra structures (CS17 Definition 4.3.11, base `Nilp_{O_Ĕ}` by E53, direction
of `ρ` by E54). -/
def XbFormal {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) : PadicFormalScheme.{u} := sorry

/-- The Rapoport–Zink formal scheme `𝔐^b` of `X_b`. -/
def RZFormal {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]
    (X : PDivGStructure D p (pt k)) : PadicFormalScheme.{u} := sorry

/-- (IG.3/canonical-lift-of-igusa) CS17 Lemma 4.3.12: `𝔛^b ≅ Ig^b_{O_Ĕ} ×_{Spf O_Ĕ} 𝔐^b`. -/
theorem XbSpace_decomp {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u}
    [Field k] [IsAlgClosed k] [CharP k p] (N : ℕ) (X : PDivGStructure D p (pt k)) :
    Nonempty (XbFormal N X ≅
      pullback ((canonicalLift p (IgusaVariety N X)).toSpfW p k) ((RZFormal X).toSpfW p k)) :=
  sorry

-- test: canonicalLift_point — `W(Spec k) = Spf W(k)`
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    Nonempty (canonicalLift p (pt k) ≅
      PadicFormalScheme.spf (CommRingCat.of (WittVector p k))) := sorry

-- test: canonicalLift_perfection_Fp — `W(Spec 𝔽_p[t^{1/p^∞}]) = Spf ℤ_p⟨t^{1/p^∞}⟩ = Spf W(𝔽_p[t^{1/p^∞}])`
example (p : ℕ) [Fact p.Prime] :
    Nonempty (canonicalLift p (Spec (CommRingCat.of (PerfectClosure (Polynomial (ZMod p)) p))) ≅
      PadicFormalScheme.spf
        (CommRingCat.of (WittVector p (PerfectClosure (Polynomial (ZMod p)) p)))) := sorry

-- test: canonicalLift_not_nonperfect — corrected: for the non-perfect `𝔸¹_k` the flat lift `Spf W(k)⟨t⟩` has a non-identity automorphism reducing to the identity (lifts are not canonical); the packet's "many non-isomorphic lifts" is false for smooth affine schemes
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    ∃ σ : PadicFormalScheme.affineLine (CommRingCat.of (WittVector p k)) ≅
        PadicFormalScheme.affineLine (CommRingCat.of (WittVector p k)),
      σ ≠ Iso.refl _ ∧ PadicFormalScheme.reduction.map σ.hom = 𝟙 _ := sorry

end CanonicalLift

/-! ### Global PEL carriers for CS17 (owner: PerfectoidShimuraVarieties S3; the rational datum
is `PELDatum` of part p01, PELModuli M0) -/

/-- An integral PEL datum: a rational PEL datum `P` (part p01) together with a prime-to-`p` level
`K(N)`, `N ≥ 3` prime to `p`, and hyperspecial level at `p`. The CS17 statements below are for
data of type (A) or (C) unramified at `p`, the domain on which the carriers are meaningful. -/
structure IntegralPELDatum (p : ℕ) [Fact p.Prime] where
  /-- The rational PEL datum. -/
  P : PELDatum
  /-- The prime-to-`p` level. -/
  N : ℕ
  level_ge : 3 ≤ N
  coprime : Nat.Coprime p N

section PELCarriers

variable {p : ℕ} [Fact p.Prime]

/-- The local datum at `p`. -/
def IntegralPELDatum.toLocal (Dp : IntegralPELDatum p) : LocalPELDatum p := sorry

/-- The base `Spec O_{E,(𝔭)}` of the integral model. -/
def PELIntegralModel.base (P : PELDatum) (p : ℕ) [Fact p.Prime] : Scheme.{0} := sorry

/-- The structure morphism of the integral model `PELIntegralModel` (part p01). -/
def PELIntegralModel.toBase (P : PELDatum) (N p : ℕ) [Fact p.Prime] :
    PELIntegralModel P N p ⟶ PELIntegralModel.base P p := sorry

/-- The structure morphism of the integral model of an integral PEL datum. -/
abbrev IntegralPELDatum.integralModelToBase (Dp : IntegralPELDatum p) :
    PELIntegralModel Dp.P Dp.N p ⟶ PELIntegralModel.base Dp.P p :=
  PELIntegralModel.toBase Dp.P Dp.N p

/-- The perfectoid Shimura variety `𝒮_{K^p}` (infinite level at `p`), as a diamond. -/
def IntegralPELDatum.shimuraPerf (Dp : IntegralPELDatum p) : Diamond.{u} := sorry

/-- `π_HT : 𝒮_{K^p} → Fℓ_{G,μ}`. -/
def IntegralPELDatum.piHT (Dp : IntegralPELDatum p) : Dp.shimuraPerf.{u} ⟶ Dp.toLocal.flag := sorry

/-- The locus `𝒮^b_{K^p}` of points with good reduction in the Newton stratum `S^b`. -/
def IntegralPELDatum.shimuraNewton (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    Diamond.{u} := sorry

/-- The inclusion `𝒮^b_{K^p} → 𝒮_{K^p}`. -/
def IntegralPELDatum.shimuraNewtonι (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    Dp.shimuraNewton.{u} b ⟶ Dp.shimuraPerf := sorry

/-- The perfect Igusa variety `Ig^b` over the residue field of `C`. -/
def IntegralPELDatum.igusa (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) : Scheme.{u} := sorry

/-- Mantovan's Igusa varieties `Ig^b_{Mant,m}`. -/
def IntegralPELDatum.mantovan (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) (m : ℕ) : Scheme.{u} := sorry

/-- The tower `m ↦ H^i(Ig^b_{Mant,m}, ℤ/ℓ^n)` of abelian groups. -/
def IntegralPELDatum.mantovanCohTower (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) (m i : ℕ) : ℕ ⥤ AddCommGrpCat.{0} := sorry

/-- The prime-to-`p` group `G(𝔸_f^p)` of the datum. -/
def IntegralPELDatum.Gfp (Dp : IntegralPELDatum p) : Type := sorry

instance (Dp : IntegralPELDatum p) : Group Dp.Gfp := sorry

end PELCarriers

/-! ### IG.3/infinite-level-newton-space -/

section XbInf

variable {p : ℕ} [Fact p.Prime]

/-- `X^b = (𝔛^b)^ad_η` for the PEL datum (as a diamond). -/
def XbAdic (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) : Diamond.{u} := sorry

/-- `X^b → M^b`, `A ↦ A[p^∞]`, with `M^b = RZSpace.genericFibre` of part p01. -/
def XbAdic.toRZ (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    XbAdic.{u} Dp b ⟶ RZSpace.genericFibre Dp.toLocal b k := sorry

/-- `M^b_∞ → M^b` (forgetting `α`). -/
def RZSpaceInfinite.toAdic (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    RZSpaceInfinite.{u} Dl b ⟶ RZSpace.genericFibre Dl b k := sorry

/-- (IG.3/infinite-level-newton-space) CS17 Definition 4.3.17: `X^b_∞`, triples `(𝒜, ρ, α)`
with `(𝒜, ρ) ∈ X^b(R, R⁺)` and `α : Λ → T_p𝒜` matching the pairings, an isomorphism at
geometric points; recorded by its diamond. -/
def XbInfinite (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) : Diamond.{u} := sorry

/-- `X^b_∞ → X^b` (forgetting `α`). -/
def XbInfinite.toXb (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    XbInfinite.{u} Dp b ⟶ XbAdic Dp b := sorry

/-- `X^b_∞ → M^b_∞`, `(𝒜, ρ, α) ↦ (𝒜[p^∞], ρ, α)`. -/
def XbInfinite.toRZInf (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    XbInfinite.{u} Dp b ⟶ RZSpaceInfinite Dp.toLocal b := sorry

theorem XbInfinite.condition (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    XbInfinite.toXb.{u} Dp b ≫ XbAdic.toRZ Dp b k =
      XbInfinite.toRZInf Dp b ≫ RZSpaceInfinite.toAdic _ b k := sorry

/-- (IG.3/infinite-level-newton-space) `X^b_∞ = X^b ×_{M^b} M^b_∞`. -/
theorem XbInfinite.eq_fibreProduct (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet)
    (k : Type u) [Field k] [IsAlgClosed k] [CharP k p] :
    IsIso (pullback.lift (XbInfinite.toXb.{u} Dp b) (XbInfinite.toRZInf Dp b)
      (XbInfinite.condition Dp b k)) := sorry

/-- The generic fibre `(Ig^b_{O_C})^ad_η` of the canonical lift of `Ig^b`, with its map to
`Spd Ĕ`. -/
def IntegralPELDatum.igusaGenericToBase (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) :
    PadicFormalScheme.adicGenericFibre.obj ((canonicalLift p (Dp.igusa C b)).baseChangeOC C) ⟶
      Dp.toLocal.base := sorry

/-- `X^b_{∞,C}`, the base change of `X^b_∞` to `C`. -/
def XbInfinite.over (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) : Diamond.{u} := sorry

/-- (IG.3/infinite-level-newton-space) CS17 Corollary 4.3.19:
`(Ig^b_{O_C})^ad_η ×_{Spa Ĕ} M^b_∞ ≅ X^b_{∞,C}`. -/
theorem XbInfinite.product (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) :
    Nonempty (pullback (Dp.igusaGenericToBase C b) (RZSpaceInfinite.toBase.{u} _ b) ≅
      XbInfinite.over Dp C b) := sorry

/-- (IG.3/infinite-level-newton-space) `X^b_∞` is preperfectoid: its diamond is the perfectoid
space `X̂^b_∞`. -/
theorem XbInfinite.preperfectoid (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    Diamond.IsPerfectoid (XbInfinite.{u} Dp b) := sorry

-- test: XbInfinite.ordinary — corrected: for `b` ordinary, `π_HT(M^{ord}_∞)` lies over the rational flags (`Fℓ^{ord}` is `0`-dimensional), but the fibre over each rational flag is an `Aut_G(X̃_b)^ad`-torsor of dimension `⟨2ρ, ν_ord⟩ = ⟨2ρ, μ⟩ > 0`, not a profinite set (see report)
example (Dl : LocalPELDatum p) (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ Dl.flagStratum Dl.ordinary) :
    topologicalKrullDim (Diamond.space (Dl.flagStratum.{u} Dl.ordinary)) = 0 ∧
    topologicalKrullDim (Diamond.space
        (pullback (localHodgeTateStratum.{u} Dl Dl.ordinary) x)) =
      ((LocalPELDatum.dimLeaf Dl.ordinary : ℕ) : WithBot ℕ∞) ∧
    LocalPELDatum.dimLeaf Dl.ordinary = Dl.dimMu := sorry

/-- The action of `G(ℤ_p)` on `X^b_∞` (through `α`). -/
def XbInfinite.actGzp (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) (g : Dp.toLocal.Gzp) :
    XbInfinite.{u} Dp b ⟶ XbInfinite Dp b := sorry

-- test: XbInfinite.level_compat — `X^b_∞ → X^b` is a pro-finite étale `G(ℤ_p)`-torsor: surjective on rank-one points and `G(ℤ_p)` acts simply transitively on its fibres
example (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) (C : PadicCField.{u} p) :
    (∀ y : Diamond.spa C.C ⟶ XbAdic.{u} Dp b, ∃ z, z ≫ XbInfinite.toXb Dp b = y) ∧
    (∀ g, XbInfinite.actGzp.{u} Dp b g ≫ XbInfinite.toXb Dp b = XbInfinite.toXb Dp b) ∧
    (∀ z z' : Diamond.spa C.C ⟶ XbInfinite.{u} Dp b,
      z ≫ XbInfinite.toXb Dp b = z' ≫ XbInfinite.toXb Dp b →
        ∃! g, z ≫ XbInfinite.actGzp Dp b g = z') := sorry

/-- The map `X̂^b_∞ → 𝒮^b_{K^p}` forgetting `ρ`. -/
def XbInfinite.toShimura (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    XbInfinite.{u} Dp b ⟶ Dp.shimuraNewton b := sorry

-- test: XbInfinite.not_shimura — `X^b_∞` is not the Newton stratum `𝒮^b_{K^p}`: the forgetful map is not an isomorphism
example (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    ¬ IsIso (XbInfinite.toShimura.{u} Dp b) := sorry

end XbInf

/-! ### IG.3/product-formula -/

theorem productFormula_compat {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    XbInfinite.toRZInf.{u} Dp b ≫ localHodgeTate _ b =
      XbInfinite.toShimura Dp b ≫ (Dp.shimuraNewtonι b ≫ Dp.piHT) := sorry

/-- (IG.3/product-formula) CS17 Lemma 4.3.20: the induced map
`X̂^b_∞ → (M^b_∞ ×_{Fℓ_{G,μ}} 𝒮^b_{K^p})^∧` is an isomorphism (no compactness needed). -/
theorem productFormula {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (b : Dp.toLocal.KottwitzSet) :
    IsIso (pullback.lift (XbInfinite.toRZInf.{u} Dp b) (XbInfinite.toShimura Dp b)
      (productFormula_compat Dp b)) := sorry

/-! ### IG.3/rank-one-cohomology-lemma -/

/-- (IG.3/rank-one-cohomology-lemma) CS17 Lemmas 4.4.1–4.4.2 (perfectoid case): (1) for a map
`f : Y → X` of qcqs perfectoid spaces and a geometric point `x̄`, `(R^i f_*𝒢)_x̄` is the
cohomology of the fibre `f^{-1}(x̄)`; (2) for `X` qcqs perfectoid and `U ⊂ X` a quasicompact open
containing all rank-one points, `H^i(X, 𝒢) → H^i(U, 𝒢)` is an isomorphism for locally
constant `𝒢`. -/
theorem rankOneCohomologyLemma {p : ℕ} [Fact p.Prime] (m : ℕ) :
    (∀ {X Y : Diamond.{u}} (f : Y ⟶ X), Diamond.IsPerfectoid X → Diamond.IsPerfectoid Y →
      CompactSpace (Diamond.space X) → QuasiSeparatedSpace (Diamond.space X) →
      CompactSpace (Diamond.space Y) → QuasiSeparatedSpace (Diamond.space Y) →
      ∀ (𝒢 : Diamond.EtSheaf Y m) (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ X) (i : ℕ),
        Function.Bijective (Diamond.RStalk.toFibre f 𝒢 x i)) ∧
    (∀ (X : Diamond.{u}) (U : TopologicalSpace.Opens (Diamond.space X)),
      Diamond.IsPerfectoid X → CompactSpace (Diamond.space X) →
      QuasiSeparatedSpace (Diamond.space X) → IsCompact (U : Set (Diamond.space X)) →
      (∀ (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ X),
        ∃ y, y ≫ Diamond.restrict.ι X U = x) →
      ∀ (𝒢 : Diamond.LCSheaf X m) (i : ℕ),
        Function.Bijective (Diamond.Hcoh.pullMap (Diamond.restrict.ι X U) 𝒢.toEtSheaf i)) :=
  sorry

/-! ### IG.3/perfect-scheme-lift-cohomology -/

/-- The specialisation map `H^i(𝔛, ℤ/m) → H^i(𝔛_s, ℤ/m)` (restriction to the special fibre;
here an isomorphism by topological invariance, map as in PAPER-CARAIANI-SCHOLZE-17/E61). -/
def PadicFormalScheme.toSpecialCoh (𝔛 : PadicFormalScheme.{u}) (m i : ℕ) :
    𝔛.EtH m i →+ TauCeti.Igusa.EtH (PadicFormalScheme.reduction.obj 𝔛) (ZMod m) i := sorry

/-- The map `H^i(𝔛, ℤ/m) → H^i(𝔛_η, ℤ/m)` to the generic fibre. -/
def PadicFormalScheme.toGenericCoh (𝔛 : PadicFormalScheme.{u}) (m i : ℕ) :
    𝔛.EtH m i →+ DiamondHMod (PadicFormalScheme.adicGenericFibre.obj 𝔛) m i := sorry

/-- (IG.3/perfect-scheme-lift-cohomology) CS17 Lemma 4.4.3: for `X` perfect (qcqs) over the
residue field of `C`, `ℓ ≠ p`, and `𝔛_{O_C} = W(X) ×̂ O_C`, the maps
`H^i(X, ℤ/ℓ^n) ← H^i(𝔛_{O_C}, ℤ/ℓ^n) → H^i(𝒳_C, ℤ/ℓ^n)` are isomorphisms (the left one
identifies `H^i(𝔛_{O_C})` with the cohomology of the special fibre `X ⊗ O_C/p`, whose
reduction is `X`). -/
theorem perfectSchemeLiftCohomology {p : ℕ} [Fact p.Prime] (C : PadicCField.{u} p)
    (X : Scheme.{u}) [CompactSpace X] [QuasiSeparatedSpace X] [PerfectSchemeIG1 p X]
    (ℓ n i : ℕ) (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) :
    Function.Bijective (((canonicalLift p X).baseChangeOC C).toSpecialCoh (ℓ ^ n) i) ∧
    Function.Bijective (((canonicalLift p X).baseChangeOC C).toGenericCoh (ℓ ^ n) i) := sorry

/-! ### IG.3/newton-strata-correspond -/

/-- (IG.3/newton-strata-correspond) CS17 §4.2–4.4, for proper `S_{K^pK_p}`: (1) a rank-one point
`y` of `𝒮_{K^p}` lies in `𝒮^b_{K^p}` iff `π_HT(y) ∈ Fℓ^b`; (2) for `x ∈ Fℓ^b(C)`, the fibre
`𝒮^b_{K^p,x}` is a quasicompact open of `𝒮_{K^p,x}` with the same rank-one points, and
`(R^iπ_HT* ℤ/ℓ^n)_x = H^i(𝒮^b_{K^p,x}, ℤ/ℓ^n)`. -/
theorem newtonStrataCorrespond {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p)
    (hprop : IsProper (Dp.integralModelToBase)) (b : Dp.toLocal.KottwitzSet) :
    (∀ (C : PadicCField.{u} p) (y : Diamond.spa C.C ⟶ Dp.shimuraPerf),
      (∃ z, z ≫ Dp.shimuraNewtonι b = y) ↔
        ∃ w, w ≫ Dp.toLocal.flagStratumι b = y ≫ Dp.piHT) ∧
    (∀ (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ Dp.toLocal.flag),
      (∃ w, w ≫ Dp.toLocal.flagStratumι b = x) →
      Diamond.IsOpenImmersionD (pullback.map (Dp.shimuraNewtonι b ≫ Dp.piHT) x Dp.piHT x
          (Dp.shimuraNewtonι b) (𝟙 _) (𝟙 _) (by simp) (by simp)) ∧
      Diamond.SameRankOnePoints p (pullback.map (Dp.shimuraNewtonι b ≫ Dp.piHT) x Dp.piHT x
          (Dp.shimuraNewtonι b) (𝟙 _) (𝟙 _) (by simp) (by simp)) ∧
      CompactSpace (Diamond.space (pullback (Dp.shimuraNewtonι b ≫ Dp.piHT) x)) ∧
      ∀ ℓ n i : ℕ, ℓ ≠ p →
        Nonempty (Diamond.RStalk Dp.piHT (Diamond.EtSheaf.const _ (ℓ ^ n)) x i ≃+
          DiamondHMod (pullback (Dp.shimuraNewtonι b ≫ Dp.piHT) x) (ℓ ^ n) i)) := sorry

/-! ### IG.3/compact-fibre-theorem -/

instance {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) {K : Type u} [NontriviallyNormedField K]
    (x : Diamond.spa K ⟶ Dp.toLocal.flag) (m i : ℕ) :
    DistribMulAction Dp.Gfp (Diamond.RStalk Dp.piHT (Diamond.EtSheaf.const _ m) x i) := sorry

instance {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) (m i : ℕ) :
    DistribMulAction Dp.Gfp (EtH (Dp.igusa C b) (ZMod m) i) := sorry

/-- (IG.3/compact-fibre-theorem) CS17 Theorem 4.4.4 = Theorem 1.15: for a PEL datum of type (A)
or (C) unramified at `p` with proper integral model (`G^ad` anisotropic, E58), `ℓ ≠ p` and a
geometric point `x̄` of `Fℓ^b_{G,μ}`, there are `G(𝔸_f^p)`-equivariant isomorphisms
`(R^iπ_HT* ℤ/ℓ^n)_x̄ ≅ H^i(Ig^b, ℤ/ℓ^n) ≅ colim_m H^i(Ig^b_{Mant,m}, ℤ/ℓ^n)` (depending on a lift
of `x̄` to `M^b_∞`). -/
theorem compactFibreTheorem {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p)
    (hprop : IsProper (Dp.integralModelToBase)) (b : Dp.toLocal.KottwitzSet)
    (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ Dp.toLocal.flag)
    (hx : ∃ w, w ≫ Dp.toLocal.flagStratumι b = x) (ℓ n i : ℕ) (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) :
    (∃ e : Diamond.RStalk Dp.piHT (Diamond.EtSheaf.const _ (ℓ ^ n)) x i ≃+
        EtH (Dp.igusa C b) (ZMod (ℓ ^ n)) i, ∀ (g : Dp.Gfp) v, e (g • v) = g • e v) ∧
    Nonempty (EtH (Dp.igusa C b) (ZMod (ℓ ^ n)) i ≃+
      (colimit (Dp.mantovanCohTower C b (ℓ ^ n) i) : AddCommGrpCat.{0})) := sorry

/-! ### IG.3/open-fibre-theorem -/

section OpenFibre

variable {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]

/-- `Ig^{X}_C`: the generic fibre of the canonical lift `W(Ig^X) ×̂_{W(k)} O_C`. -/
abbrev igusaGeneric (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    Diamond.{u} :=
  PadicFormalScheme.adicGenericFibre.obj ((canonicalLift p (IgusaVariety N X)).baseChangeOC C)

/-- The canonical map `Ig^{X_k}_C → (π°_HT)^{-1}(x)` (Serre–Tate lift along
`IG.3/pdiv-constant-mod-p-epsilon`, level at `p` from `α`). -/
def openFibreMap (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    igusaGeneric N (FlagPoint.specialFibre x) ⟶ pullback (piHTGood.{u} D p N) x := sorry

instance (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p)
    (S : Finset ℕ) (m i : ℕ) :
    Module (HeckeAlgebra D S) (Diamond.RStalk (piHTGood.{u} D p N)
      (Diamond.EtSheaf.const _ m) x i) := sorry

/-- (IG.3/open-fibre-theorem) CSnc Theorem 2.7.2: for `x ∈ Fℓ(C)` with special fibre `X_k`,
the canonical map `Ig^{X_k}_C → (π°_HT)^{-1}(x)` is an open immersion containing all rank-one
points; consequently `(R^i(π°_HT)_*𝔽_ℓ)_x ≅ H^i(Ig^{X_k}, 𝔽_ℓ)`, canonically and
`𝕋^S`-equivariantly, for `ℓ ≠ p`. -/
theorem openFibreTheorem (N : ℕ) (hN : 3 ≤ N) (hpN : Nat.Coprime p N) (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) (S : Finset ℕ) (ℓ : ℕ) (hℓ : ℓ.Prime)
    (hℓp : ℓ ≠ p) :
    Diamond.IsOpenImmersionD (openFibreMap N x) ∧ Diamond.SameRankOnePoints p (openFibreMap N x) ∧
    ∀ i : ℕ, Nonempty (Diamond.RStalk (piHTGood.{u} D p N) (Diamond.EtSheaf.const _ ℓ) x i ≃ₗ[HeckeAlgebra D S]
      IgusaCoh N (FlagPoint.specialFibre x) ℓ i) := sorry

end OpenFibre

/-! ### IG.3/period-map-on-boundary -/

/-- The generic fibre of the completion `Ŝ^tor_{K(p^∞N),Z,ℤ_p}` along the `Z`-boundary. -/
def toroidalBoundaryChart (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    Diamond.{u} := sorry

/-- Its map to `S^tor_{K(p^∞N)}`. -/
def toroidalBoundaryChart.ι (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    toroidalBoundaryChart.{u} D p N Z ⟶ ToroidalShimuraInf D p N := sorry

/-- `π_{HT,Z}`: the Hodge–Tate filtration `Lie B(1) ⊂ L_Z ⊗ O` of the abelian part of the
Raynaud extension, pulled back to `Z_{p^∞,−1} ⊗ O` (a totally isotropic subspace of `L ⊗ O`). -/
def piHTChart (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    toroidalBoundaryChart.{u} D p N Z ⟶ FlagVariety D p := sorry

/-- The boundary stratum `S_{K(p^∞N),Ẑ}` of the minimal compactification. -/
def minimalBoundaryStratum (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    Diamond.{u} := sorry

/-- Its inclusion into `S^*_{K(p^∞N)}`. -/
def minimalBoundaryStratum.ι (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    minimalBoundaryStratum.{u} D p N Z ⟶ MinimalShimuraInf D p N := sorry

/-- The flag variety `Fℓ_Ẑ` of the smaller unitary group. -/
def flagVarietySmall (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    Diamond.{u} := sorry

/-- The Hodge–Tate period map of the smaller Shimura variety. -/
def minimalBoundaryStratum.piHT (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    minimalBoundaryStratum.{u} D p N Z ⟶ flagVarietySmall D p N Z := sorry

/-- `Fℓ_Ẑ ↪ Fℓ`: preimage of a totally isotropic subspace of `L_Z ⊗ ℚ_p` in
`Z_{p^∞,−1} ⊗ ℚ_p`. -/
def flagVarietySmall.embed (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    flagVarietySmall.{u} D p N Z ⟶ FlagVariety D p := sorry

/-- (IG.3/period-map-on-boundary) CSnc Theorem 4.2.1, Corollary 4.2.2: (1) `π_{HT,Z}` agrees
with `π^tor_HT` on the generic fibre of `Ŝ^tor_Z`; (2) on a minimal boundary stratum, `π^*_HT`
is the period map of the smaller Shimura variety followed by `Fℓ_Ẑ ↪ Fℓ`, which is a closed
immersion. -/
theorem periodMapOnBoundary (D : UnitarySimilitudeDatum) (p N : ℕ) (Z : CuspLabelIG2 D p N) :
    piHTChart.{u} D p N Z = toroidalBoundaryChart.ι D p N Z ≫ piHTTor D p N ∧
    minimalBoundaryStratum.ι.{u} D p N Z ≫ piHTMin D p N =
      minimalBoundaryStratum.piHT D p N Z ≫ flagVarietySmall.embed D p N Z ∧
    Diamond.IsClosedImmersionD (flagVarietySmall.embed.{u} D p N Z) := sorry

/-! ### IG.3/pdiv-constant-mod-p-epsilon -/

/-- The canonical comparison `(X ⊗_k O_C/p^ε) ⊗ k ≅ X` (section followed by reduction is the
identity of `Spec k`). -/
def FlagPoint.epsComparisonConst {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    {C : PadicCField.{u} p} (ε : ℚ) (X : PDivGStructure D p (pt C.k)) :
    (PDivGStructure.baseChange D p (C.epsReduction ε)).obj
      ((PDivGStructure.baseChange D p (C.epsSection ε)).obj X) ≅ X := sorry

/-- The canonical comparison `(𝒳_{O_C} ⊗ O_C/p^ε) ⊗ k ≅ 𝒳_{O_C} ⊗ k = X_k`. -/
def FlagPoint.epsComparison {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    {C : PadicCField.{u} p} (ε : ℚ) (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    (PDivGStructure.baseChange D p (C.epsReduction ε)).obj
      ((PDivGStructure.baseChange D p (C.epsToO ε)).obj (FlagPoint.pair x).X) ≅
      FlagPoint.specialFibre x := sorry

/-- (IG.3/pdiv-constant-mod-p-epsilon) CSnc Proposition 4.3.1: there are `ε ∈ ℚ ∩ (0, 1]` and
an isomorphism `ρ : X ⊗_k O_C/p^ε ≅ 𝒳_{O_C} ⊗ O_C/p^ε` of p-divisible groups with `G`-structure
lifting the identity of `X = X_k`. (The compatibility with the splittings `δ_𝒳, δ_X` is not
formalised: splittings are not among the carriers.) -/
theorem pdivConstantModPEpsilon {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    ∃ (ε : ℚ) (_ : 0 < ε ∧ ε ≤ 1)
      (ρ : (PDivGStructure.baseChange D p (C.epsSection ε)).obj (FlagPoint.specialFibre x) ≅
        (PDivGStructure.baseChange D p (C.epsToO ε)).obj (FlagPoint.pair x).X),
      (PDivGStructure.baseChange D p (C.epsReduction ε)).map ρ.hom =
        (FlagPoint.epsComparisonConst ε _).hom ≫ (FlagPoint.epsComparison ε x).inv := sorry

/-! ### IG.3/compactified-igusa-to-shimura -/

section IgusaToShimura

variable {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]

/-- `Ig^{X,tor}_{O_C} = W(Ig^{X,tor}) ×̂_{W(k)} O_C`. -/
abbrev igusaTorOC (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    PadicFormalScheme.{u} :=
  (canonicalLift p (PerfectToroidalIgusa N X)).baseChangeOC C

/-- `Ig^{X,*}_{O_C} = W(Ig^{X,*}) ×̂_{W(k)} O_C`. -/
abbrev igusaMinOC (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    PadicFormalScheme.{u} :=
  (canonicalLift p (PerfectMinimalIgusa N X)).baseChangeOC C

/-- `Ig^X_{O_C} = W(Ig^X) ×̂_{W(k)} O_C`. -/
abbrev igusaOC (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    PadicFormalScheme.{u} :=
  (canonicalLift p (IgusaVariety N X)).baseChangeOC C

/-- The open immersion `Ig^X_{O_C} → Ig^{X,tor}_{O_C}`. -/
def igusaOC.toTor (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    igusaOC N X ⟶ igusaTorOC N X := sorry

/-- The map `Ig^{X,tor}_{O_C} → Ig^{X,*}_{O_C}`. -/
def igusaTorOC.toMin (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    igusaTorOC N X ⟶ igusaMinOC N X := sorry

/-- The formal models `S_{K(p^∞N),O_C}`, `S^tor_{K(p^∞N),O_C}` (owner: PerfectoidShimuraVarieties
S3). -/
def ShimuraFormalOC (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime] (C : PadicCField.{u} p) :
    PadicFormalScheme.{u} := sorry

def ToroidalShimuraFormalOC (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) : PadicFormalScheme.{u} := sorry

def ShimuraFormalOC.toTor (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) : ShimuraFormalOC.{u} D p N C ⟶ ToroidalShimuraFormalOC D p N C := sorry

/-- The comparison of the generic fibre of `S^tor_{K(p^∞N),O_C}` with `S^tor_{K(p^∞N)}`. -/
def ToroidalShimuraFormalOC.genericToInf (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) :
    PadicFormalScheme.adicGenericFibre.obj (ToroidalShimuraFormalOC.{u} D p N C) ⟶
      ToroidalShimuraInf D p N := sorry

/-- The Serre–Tate map `g : Ig^X_{O_C} → S_{K(p^∞N),O_C}`. -/
def serreTateMap (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    igusaOC N (FlagPoint.specialFibre x) ⟶ ShimuraFormalOC D p N C := sorry

/-- (IG.3/compactified-igusa-to-shimura) CSnc Theorem 4.3.2: `g^tor : Ig^{X,tor}_{O_C} →
S^tor_{K(p^∞N),O_C}`, extending the Serre–Tate map. -/
def igusaToShimura (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    igusaTorOC N (FlagPoint.specialFibre x) ⟶ ToroidalShimuraFormalOC D p N C := sorry

/-- (IG.3/compactified-igusa-to-shimura) `g^tor` restricts to the Serre–Tate map on
`Ig^X_{O_C}`. -/
theorem igusaToShimura_open (N : ℕ) {C : PadicCField.{u} p}
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    igusaOC.toTor N _ ≫ igusaToShimura N x = serreTateMap N x ≫ ShimuraFormalOC.toTor D p N C :=
  sorry

/-- The `Z̃`-boundary chart of `Ig^{X,tor}_{O_C}`, with its map. -/
def igusaBoundaryChart (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k))
    (Z : IgusaCuspLabel X) : PadicFormalScheme.{u} := sorry

def igusaBoundaryChart.ι (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k))
    (Z : IgusaCuspLabel X) : igusaBoundaryChart N X Z ⟶ igusaTorOC N X := sorry

/-- The `Z`-boundary chart of `S^tor_{K(p^∞N),O_C}`, with its map. -/
def shimuraBoundaryChart (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) (Z : CuspLabelIG2 D p N) : PadicFormalScheme.{u} := sorry

def shimuraBoundaryChart.ι (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) (Z : CuspLabelIG2 D p N) :
    shimuraBoundaryChart.{u} D p N C Z ⟶ ToroidalShimuraFormalOC D p N C := sorry

/-- (IG.3/compactified-igusa-to-shimura) `g^tor` maps the `Z̃`-boundary chart into the
`Z`-boundary chart, `Z` the cusp label underlying `Z̃`. -/
theorem igusaToShimura_cusp (N : ℕ) {C : PadicCField.{u} p}
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) (Z : IgusaCuspLabel (FlagPoint.specialFibre x)) :
    ∃ h : igusaBoundaryChart N _ Z ⟶ shimuraBoundaryChart D p N C (IgusaCuspLabel.toCuspLabel N Z),
      h ≫ shimuraBoundaryChart.ι D p N C _ = igusaBoundaryChart.ι N _ Z ≫ igusaToShimura N x :=
  sorry

/-- The finite group `K^p/K(N)` acting on level-`K(N)` objects (prime-to-`p` Hecke action at
fixed level; passing to the limit over `N` gives the `G(𝔸_f^p)`-action). -/
def LevelGroupIG (D : UnitarySimilitudeDatum) (p N : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p N : ℕ) : Group (LevelGroupIG D p N) := sorry

def igusaTorOC.act (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k))
    (g : LevelGroupIG D p N) : igusaTorOC N X ⟶ igusaTorOC N X := sorry

def ToroidalShimuraFormalOC.act (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    (C : PadicCField.{u} p) (g : LevelGroupIG D p N) :
    ToroidalShimuraFormalOC.{u} D p N C ⟶ ToroidalShimuraFormalOC D p N C := sorry

/-- (IG.3/compactified-igusa-to-shimura) `g^tor` is equivariant for the prime-to-`p` Hecke
action. -/
theorem igusaToShimura_hecke (N : ℕ) {C : PadicCField.{u} p}
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) (g : LevelGroupIG D p N) :
    igusaTorOC.act N _ g ≫ igusaToShimura N x =
      igusaToShimura N x ≫ ToroidalShimuraFormalOC.act D p N C g := sorry

/-- (IG.3/compactified-igusa-to-shimura) The composite of `g^tor_C` with `π^tor_HT` is the
constant map to `x`. -/
theorem igusaToShimura_piHT (N : ℕ) {C : PadicCField.{u} p}
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    PadicFormalScheme.adicGenericFibre.map (igusaToShimura N x) ≫
        ToroidalShimuraFormalOC.genericToInf D p N C ≫ piHTTor D p N =
      PadicFormalScheme.genericToSpa _ C ≫ x := sorry

-- test: igusaToShimura_constant_period — on rank-one points, `π^tor_HT ∘ g^tor_C` is the constant map to `x`
example (N : ℕ) (C C' : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p)
    (y : Diamond.spa C'.C ⟶ PadicFormalScheme.adicGenericFibre.obj
      (igusaTorOC N (FlagPoint.specialFibre x))) :
    y ≫ PadicFormalScheme.adicGenericFibre.map (igusaToShimura N x) ≫
        ToroidalShimuraFormalOC.genericToInf D p N C ≫ piHTTor D p N =
      (y ≫ PadicFormalScheme.genericToSpa _ C) ≫ x := sorry

/-- For the modular curve and a rational flag `x`: the locus of the infinite-level toroidal
curve over `C` where the trivialized Tate module carries the canonical subgroup to the line
`x`, together with its cusps (owner: here). -/
def modularCanonicalLocus (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) : Diamond.{u} := sorry

def modularCanonicalLocus.ι (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    modularCanonicalLocus D p N x ⟶
      PadicFormalScheme.adicGenericFibre.obj (ToroidalShimuraFormalOC D p N C) := sorry

/-- The structure map `Spd C → Spd ℚ_p`. -/
def Diamond.spa.toQp (K : Type u) [NontriviallyNormedField K] : Diamond.spa K ⟶ Diamond.spdQp :=
  sorry

/-- `x` is a rational flag: it factors through `Spd C → Spd ℚ_p`. -/
def FlagPoint.IsRational {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    Prop :=
  ∃ x₀ : Diamond.spdQp ⟶ FlagVariety.{u} D p, x = Diamond.spa.toQp C.C ≫ x₀

-- test: igusaToShimura_ordinary_modular — modular curve, `x` rational: `g^tor_C` is an isomorphism onto the canonical-subgroup locus attached to `x` (with its cusps)
example (N : ℕ) (C : PadicCField.{u} p) (hD : D.IsModularCase)
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) (hx : FlagPoint.IsRational x) :
    ∃ e : PadicFormalScheme.adicGenericFibre.obj (igusaTorOC N (FlagPoint.specialFibre x)) ≅
        modularCanonicalLocus D p N x,
      e.hom ≫ modularCanonicalLocus.ι D p N x =
        PadicFormalScheme.adicGenericFibre.map (igusaToShimura N x) := sorry

end IgusaToShimura

/-! ### IG.3/canonical-compactification-criterion -/

/-- (IG.3/canonical-compactification-criterion) CSnc Lemma 4.4.2: let `f : X → Y` be a map over
`Spd C` from a quasicompact separated perfectoid space to a proper diamond (proper, not merely
partially proper: IgusaVarietiesAndTorsionConcentration/E4). If `f` is bijective on
`(C′, O_{C′})`-points for all `C′`, then `f` induces `X̄ ≅ Y`; if moreover `X → X̄` is an open
immersion (`X` compactifiable over `Spd C`), `f` is an open immersion. -/
theorem canonicalCompactificationCriterion {p : ℕ} [Fact p.Prime] (C : PadicCField.{u} p)
    {X Y : Diamond.{u}} (sX : X ⟶ Diamond.spa C.C) (sY : Y ⟶ Diamond.spa C.C) (f : X ⟶ Y)
    (hf : f ≫ sY = sX) (hXp : Diamond.IsPerfectoid X) (hXqc : CompactSpace (Diamond.space X))
    (hXsep : Diamond.IsSeparatedOver sX) (hY : Diamond.IsProperOverPoint sY)
    (hbij : Diamond.SameRankOnePoints p f) :
    IsIso (Diamond.canonicalCompactification.lift sX sY f hf) ∧
      (Diamond.IsOpenImmersionD (Diamond.canonicalCompactification.ι sX) →
        Diamond.IsOpenImmersionD f) := sorry

/-! ### IG.3/toroidal-fibre-theorem -/

section FibreTheorems

variable {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]

/-- `Ig^{X,tor}_C`, the generic fibre of `Ig^{X,tor}_{O_C}`. -/
abbrev igusaTorGeneric (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    Diamond.{u} :=
  PadicFormalScheme.adicGenericFibre.obj (igusaTorOC N X)

/-- `Ig^{X,*}_C`, the generic fibre of `Ig^{X,*}_{O_C}`. -/
abbrev igusaMinGeneric (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    Diamond.{u} :=
  PadicFormalScheme.adicGenericFibre.obj (igusaMinOC N X)

/-- The map `Ig^{b,tor}_C → (π^tor_HT)^{-1}(x)` induced by `g^tor`. -/
def toroidalFibreMap (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    igusaTorGeneric N (FlagPoint.specialFibre x) ⟶ pullback (piHTTor.{u} D p N) x := sorry

/-- The map `f^* : Ig^{b,*}_C → (π^*_HT)^{-1}(x)` induced by `f^tor`. -/
def minimalFibreMap (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    igusaMinGeneric N (FlagPoint.specialFibre x) ⟶ pullback (piHTMin.{u} D p N) x := sorry

/-- (IG.3/toroidal-fibre-theorem) CSnc Theorem 4.4.1: the map `Ig^{b,tor}_C → (π^tor_HT)^{-1}(x)`
induced by `g^tor` is an open immersion with the same rank-one points; the fibre is proper over
`Spd C` and is the canonical compactification of `Ig^{b,tor}_C`. -/
theorem toroidalFibreTheorem (N : ℕ) (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    toroidalFibreMap N x ≫ pullback.fst _ _ =
      PadicFormalScheme.adicGenericFibre.map (igusaToShimura N x) ≫
        ToroidalShimuraFormalOC.genericToInf D p N C ∧
    Diamond.IsOpenImmersionD (toroidalFibreMap N x) ∧
    Diamond.SameRankOnePoints p (toroidalFibreMap N x) ∧
    Diamond.IsProperOverPoint (pullback.snd (piHTTor.{u} D p N) x) ∧
    ∃ e : Diamond.canonicalCompactification (PadicFormalScheme.genericToSpa _ C) ≅
        pullback (piHTTor.{u} D p N) x,
      Diamond.canonicalCompactification.ι _ ≫ e.hom = toroidalFibreMap N x := sorry

-- test: igusaToShimura_not_surjective — `g^tor_C` misses higher-rank points of the fibre (stated for the modular curve and an ordinary rational flag; false e.g. for basic `x`, where `Ig^{b,tor}` is proper)
example (N : ℕ) (C : PadicCField.{u} p) (hD : D.IsModularCase)
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) (hx : FlagPoint.IsRational x) :
    ¬ Function.Surjective (Diamond.spaceMap (toroidalFibreMap N x)) := sorry

/-! ### IG.3/minimal-fibre-theorem -/

/-- Global sections `O(X)` of diamonds over `Spd C`, computed on the untilt over `C` (for
perfectoid `X` the ring of functions of the perfectoid space; owner: PerfectoidSpaces P0). -/
def Diamond.Γover {p : ℕ} [Fact p.Prime] (C : PadicCField.{u} p) :
    (Over (Diamond.spa C.C))ᵒᵖ ⥤ CommRingCat.{u} := sorry

/-- The map `Ig^{X,tor}_C → Ig^{X,*}_C` lies over `Spd C`. -/
theorem igusaTorToMin_over (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    PadicFormalScheme.adicGenericFibre.map (igusaTorOC.toMin N X) ≫
      PadicFormalScheme.genericToSpa _ C = PadicFormalScheme.genericToSpa _ C := sorry

/-- (IG.3/minimal-fibre-theorem) CSnc Theorem 4.5.1, Lemma 4.5.2: `f^* : Ig^{b,*}_C →
(π^*_HT)^{-1}(x)` is an open immersion of affinoid perfectoid spaces with the same rank-one
points; (1) `Ig^{b,tor}_C → Ig^{b,*}_C` and (2) `F^tor = (π^tor_HT)^{-1}(x) → F^* =
(π^*_HT)^{-1}(x)` induce isomorphisms on global sections. -/
theorem minimalFibreTheorem (N : ℕ) (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) :
    Diamond.IsOpenImmersionD (minimalFibreMap N x) ∧
    Diamond.SameRankOnePoints p (minimalFibreMap N x) ∧
    Diamond.IsAffinoidPerfectoid (igusaMinGeneric N (FlagPoint.specialFibre x)) ∧
    Diamond.IsAffinoidPerfectoid (pullback (piHTMin.{u} D p N) x) ∧
    IsIso ((Diamond.Γover C).map (Over.homMk
      (PadicFormalScheme.adicGenericFibre.map (igusaTorOC.toMin N (FlagPoint.specialFibre x)))
      (igusaTorToMin_over N _) :
        Over.mk (PadicFormalScheme.genericToSpa _ C) ⟶
          Over.mk (PadicFormalScheme.genericToSpa (igusaMinOC N (FlagPoint.specialFibre x)) C)).op) ∧
    IsIso ((Diamond.Γover C).map (Over.homMk
      (pullback.map (piHTTor.{u} D p N) x (piHTMin D p N) x (ToroidalShimuraInf.toMin D p N)
        (𝟙 _) (𝟙 _) (piHTTor_comp D p N).symm (by simp))
      (by exact (pullback.lift_snd _ _ _).trans (Category.comp_id _)) :
        Over.mk (pullback.snd (piHTTor.{u} D p N) x) ⟶
          Over.mk (pullback.snd (piHTMin.{u} D p N) x)).op) := sorry

/-! ### IG.3/compactified-fibre-theorem -/

instance (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p)
    (S : Finset ℕ) (m i : ℕ) :
    Module (HeckeAlgebra D S) (Diamond.RStalk (piHTMin.{u} D p N)
      (Diamond.EtSheaf.const _ m) x i) := sorry

instance (N : ℕ) {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p)
    (S : Finset ℕ) (m i : ℕ) :
    Module (HeckeAlgebra D S) (Diamond.RStalk (piHTTor.{u} D p N)
      (Diamond.EtSheaf.const _ m) x i) := sorry

instance (N : ℕ) {k : Type u} [Field k] (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (EtH (PerfectMinimalIgusa N X) (ZMod ℓ) i) := sorry

instance (N : ℕ) {k : Type u} [Field k] (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (EtH (PerfectToroidalIgusa N X) (ZMod ℓ) i) := sorry

/-- The open map `Ig^X_C → Ig^{X,*}_C` on generic fibres. -/
def igusaGeneric.toMin (N : ℕ) {C : PadicCField.{u} p} (X : PDivGStructure D p (pt C.k)) :
    igusaGeneric N X ⟶ igusaMinGeneric N X := sorry

/-- (IG.3/compactified-fibre-theorem) CSnc Theorem 4.1.1, Corollary 4.1.2: the natural maps
`Ig^{X,*}_C → (π^*_HT)^{-1}(x)` and `Ig^{X,tor}_C → (π^tor_HT)^{-1}(x)` are open immersions with
the same rank-one points whose targets are the canonical compactifications of the sources;
hence Hecke-equivariant isomorphisms `H^i(Ig^{X,*}, 𝔽_ℓ) ≅ (R^iπ^*_HT*𝔽_ℓ)_x` and
`H^i(Ig^{X,tor}, 𝔽_ℓ) ≅ (R^iπ^tor_HT*𝔽_ℓ)_x`; compatibly with the flag Newton strata and with the
good-reduction part. (Compatibility with the `p`-level transition maps and the statement on
higher-rank stalks are not formalised.) -/
theorem compactifiedFibreTheorem (N : ℕ) (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p) (S : Finset ℕ) (ℓ : ℕ) (hℓ : ℓ.Prime)
    (hℓp : ℓ ≠ p) :
    (Diamond.IsOpenImmersionD (minimalFibreMap N x) ∧
      Diamond.SameRankOnePoints p (minimalFibreMap N x) ∧
      ∃ e : Diamond.canonicalCompactification (PadicFormalScheme.genericToSpa _ C) ≅
          pullback (piHTMin.{u} D p N) x,
        Diamond.canonicalCompactification.ι _ ≫ e.hom = minimalFibreMap N x) ∧
    (Diamond.IsOpenImmersionD (toroidalFibreMap N x) ∧
      Diamond.SameRankOnePoints p (toroidalFibreMap N x) ∧
      ∃ e : Diamond.canonicalCompactification (PadicFormalScheme.genericToSpa _ C) ≅
          pullback (piHTTor.{u} D p N) x,
        Diamond.canonicalCompactification.ι _ ≫ e.hom = toroidalFibreMap N x) ∧
    (∀ i : ℕ, Nonempty (EtH (PerfectMinimalIgusa N (FlagPoint.specialFibre x)) (ZMod ℓ) i
        ≃ₗ[HeckeAlgebra D S] Diamond.RStalk (piHTMin.{u} D p N) (Diamond.EtSheaf.const _ ℓ) x i)) ∧
    (∀ i : ℕ, Nonempty (EtH (PerfectToroidalIgusa N (FlagPoint.specialFibre x)) (ZMod ℓ) i
        ≃ₗ[HeckeAlgebra D S] Diamond.RStalk (piHTTor.{u} D p N) (Diamond.EtSheaf.const _ ℓ) x i)) ∧
    (FlagPoint.newton x = (FlagPoint.specialFibre x).newtonClass) ∧
    openFibreMap N x ≫ pullback.map (piHTGood.{u} D p N) x (piHTMin D p N) x
        (GoodReductionLocus.toMin D p N) (𝟙 _) (𝟙 _)
        (by rw [Category.comp_id, (goodReductionLocus_piHT D p N).1]) (by simp) =
      igusaGeneric.toMin N _ ≫ minimalFibreMap N x := sorry

end FibreTheorems

/-! ### IG.3/sw-infinite-level-rz-space -/

section SWInfinite

variable {p : ℕ} [Fact p.Prime] {k : Type u} [Field k] [ExpChar k p] [PerfectRing k p]

/-- (IG.3/sw-infinite-level-rz-space) The Scholze–Weinstein Rapoport–Zink space at infinite level
`M_∞` of a p-divisible group `H` over a perfect field `k` (SW13 §6.3): triples `(G, ρ, α)` with
`α : ℤ_p^h → T_pG^ad_η` an isomorphism at geometric points; recorded by its diamond. -/
def SWInfiniteLevel (H : PDivGroup p (pt k)) : Diamond.{u} := sorry

/-- The finite-level spaces `M_n`, as a tower. -/
def SWInfiniteLevel.tower (H : PDivGroup p (pt k)) : ℕᵒᵖ ⥤ Diamond.{u} := sorry

def SWInfiniteLevel.toLevel (H : PDivGroup p (pt k)) (n : ℕ) :
    SWInfiniteLevel H ⟶ (SWInfiniteLevel.tower H).obj (Opposite.op n) := sorry

/-- The base `Spd W(k)[1/p]`. -/
def SWInfiniteLevel.base (H : PDivGroup p (pt k)) : Diamond.{u} := sorry

/-- (IG.3/sw-infinite-level-rz-space) SW Theorem 6.3.4: `M_∞` is preperfectoid (its diamond is
perfectoid) and `M_∞ ∼ lim_n M_n` (on diamonds: the projections identify `M_∞` with the limit). -/
theorem SWInfiniteLevel.preperfectoid (H : PDivGroup p (pt k)) :
    Diamond.IsPerfectoid (SWInfiniteLevel H) ∧
    ∃ e : SWInfiniteLevel H ≅ limit (SWInfiniteLevel.tower H),
      ∀ n, e.hom ≫ limit.π _ (Opposite.op n) = SWInfiniteLevel.toLevel H n := sorry

/-- `M_∞ ×_{Spd W(k)[1/p]} Spd W(k)[1/p](ζ_{p^∞})`. -/
def SWInfiniteLevel.overCyc (H : PDivGroup p (pt k)) : Diamond.{u} := sorry

/-- `M′_∞`: `h`-tuples `(s₁, …, s_h) ∈ H̃^ad_η(R, R⁺)` whose quasi-logarithms span a rank
`h − d` subspace with locally free quotient `W` of rank `d` of `M(H) ⊗ R`, with
`0 → ℤ_p^h → H̃^ad_η(C, C⁺) → W ⊗ C → 0` exact at geometric points (SW Lemma 6.3.6). -/
def SWInfiniteLevel.tuples (H : PDivGroup p (pt k)) : Diamond.{u} := sorry

/-- (IG.3/sw-infinite-level-rz-space) `M_∞ ≅ M′_∞` over `W(k)[1/p](ζ_{p^∞})`. -/
theorem SWInfiniteLevel.eq_tuples (H : PDivGroup p (pt k)) :
    Nonempty (SWInfiniteLevel.overCyc H ≅ SWInfiniteLevel.tuples H) := sorry

/-- The group `J_H(ℚ_p)` of self-quasi-isogenies of `H`. -/
def SWInfiniteLevel.J (H : PDivGroup p (pt k)) : Type := sorry

instance (H : PDivGroup p (pt k)) : Group (SWInfiniteLevel.J H) := sorry

def SWInfiniteLevel.actGL (H : PDivGroup p (pt k)) (g : GL (Fin H.height) ℚ_[p]) :
    SWInfiniteLevel H ⟶ SWInfiniteLevel H := sorry

def SWInfiniteLevel.actJ (H : PDivGroup p (pt k)) (j : SWInfiniteLevel.J H) :
    SWInfiniteLevel H ⟶ SWInfiniteLevel H := sorry

/-- The Hodge–Tate and Grothendieck–Messing period targets `ℙ^{h−1}`-type flag varieties. -/
def SWInfiniteLevel.flagHT (H : PDivGroup p (pt k)) : Diamond.{u} := sorry

def SWInfiniteLevel.flagGM (H : PDivGroup p (pt k)) : Diamond.{u} := sorry

def SWInfiniteLevel.piHT (H : PDivGroup p (pt k)) :
    SWInfiniteLevel H ⟶ SWInfiniteLevel.flagHT H := sorry

def SWInfiniteLevel.piGM (H : PDivGroup p (pt k)) :
    SWInfiniteLevel H ⟶ SWInfiniteLevel.flagGM H := sorry

def SWInfiniteLevel.flagHTAct (H : PDivGroup p (pt k)) (g : GL (Fin H.height) ℚ_[p]) :
    SWInfiniteLevel.flagHT H ⟶ SWInfiniteLevel.flagHT H := sorry

def SWInfiniteLevel.flagGMAct (H : PDivGroup p (pt k)) (j : SWInfiniteLevel.J H) :
    SWInfiniteLevel.flagGM H ⟶ SWInfiniteLevel.flagGM H := sorry

/-- (IG.3/sw-infinite-level-rz-space) `GL_h(ℚ_p)` acts on `α`, `J_H(ℚ_p)` on `ρ`; the actions
commute; `π_HT` is `GL_h`-equivariant and `J_H`-invariant, `π_GM` is `J_H`-equivariant and
`GL_h`-invariant. -/
theorem SWInfiniteLevel.actions (H : PDivGroup p (pt k)) :
    (∀ g j, SWInfiniteLevel.actGL H g ≫ SWInfiniteLevel.actJ H j =
      SWInfiniteLevel.actJ H j ≫ SWInfiniteLevel.actGL H g) ∧
    (∀ g, SWInfiniteLevel.actGL H g ≫ SWInfiniteLevel.piHT H =
      SWInfiniteLevel.piHT H ≫ SWInfiniteLevel.flagHTAct H g) ∧
    (∀ g, SWInfiniteLevel.actGL H g ≫ SWInfiniteLevel.piGM H = SWInfiniteLevel.piGM H) ∧
    (∀ j, SWInfiniteLevel.actJ H j ≫ SWInfiniteLevel.piGM H =
      SWInfiniteLevel.piGM H ≫ SWInfiniteLevel.flagGMAct H j) ∧
    (∀ j, SWInfiniteLevel.actJ H j ≫ SWInfiniteLevel.piHT H = SWInfiniteLevel.piHT H) := sorry

/-- The embedding `M_{D^int,∞} → M_∞` for `H = X_b`. -/
def SWInfiniteLevel.pelEmbedding (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] [ExpChar k p] [PerfectRing k p] :
    RZSpaceInfinite.{u} Dl b ⟶ SWInfiniteLevel (Dl.pdivOfB b k).toPDivGroup := sorry

/-- (IG.3/sw-infinite-level-rz-space) For an unramified local PEL datum, `M_{D^int,∞}` is a
closed subspace of `M_∞` for `H = X_b`. -/
theorem SWInfiniteLevel.pel (Dl : LocalPELDatum p) (b : Dl.KottwitzSet) (k : Type u) [Field k]
    [IsAlgClosed k] [CharP k p] [ExpChar k p] [PerfectRing k p] :
    Diamond.IsClosedImmersionD (SWInfiniteLevel.pelEmbedding Dl b k) := sorry

/-- Base change of the SW tower to a geometric p-adic field (owner: local-shtuka tower). -/
def SWInfiniteLevel.overC (H : PDivGroup p (pt k)) (C : PadicCField.{u} p) : Diamond.{u} := sorry

-- test: SWInfiniteLevel.mu — over C with all roots of unity, the tower is constant locally profinite
example [CharP k p] (C : PadicCField.{u} p) :
    Nonempty (SWInfiniteLevel.overC (PDivGroup.mu p (pt k)) C ≅
      Diamond.constOver (GL (Fin 1) ℚ_[p]) (Diamond.spa C.C)) := sorry

-- test: SWInfiniteLevel.etale — for `H` étale of height `h` (`d = 0`), `M_∞ ≅ GL_h(ℚ_p)` (locally profinite set over the base)
example (H : PDivGroup p (pt k)) (hd : H.dim = 0) :
    Nonempty (SWInfiniteLevel H ≅
      Diamond.constOver (GL (Fin H.height) ℚ_[p]) (SWInfiniteLevel.base H)) := sorry

-- test: SWInfiniteLevel.tower_not_stationary — for `H` of height `h ≥ 1` and `n ≥ 1` no transition map `M_{n+1} → M_n` is an isomorphism, so `M_∞` is not any finite-level `M_n`
example (H : PDivGroup p (pt k)) (hH : 0 < H.height) (n : ℕ) (hn : 1 ≤ n) :
    ¬ IsIso ((SWInfiniteLevel.tower H).map (homOfLE (Nat.le_succ n)).op) := sorry

end SWInfinite

/-! ### IG.3/mantovan-formula -/

section Mantovan

open CategoryTheory.Pretriangulated

/-- The derived category of smooth `G(ℚ_p) × W_{E_p}`-representations on `𝔽_ℓ`-modules
(owner: SmoothRepresentations SR.1 / LocalLanglandsCorrespondence). -/
def SmoothRepDerived {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (ℓ : ℕ) : Type (u + 1) := sorry

variable {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (ℓ : ℕ)

instance : Category.{u} (SmoothRepDerived.{u} Dp ℓ) := sorry
instance : Preadditive (SmoothRepDerived.{u} Dp ℓ) := sorry
instance : HasZeroObject (SmoothRepDerived.{u} Dp ℓ) := sorry
instance : HasShift (SmoothRepDerived.{u} Dp ℓ) ℤ := sorry
instance (n : ℤ) : (shiftFunctor (SmoothRepDerived.{u} Dp ℓ) n).Additive := sorry
instance : Pretriangulated (SmoothRepDerived.{u} Dp ℓ) := sorry

/-- `RΓ(S_{K^p, ℚ̄_p}, 𝔽_ℓ)` with its `G(ℚ_p) × W_{E_p}`-action. -/
def RGammaShimuraSmooth : SmoothRepDerived.{u} Dp ℓ := sorry

/-- The graded piece `RΓ(Ig^b, 𝔽_ℓ)^{op} ⊗^L_{C_c(J_b(ℚ_p))} RΓ_c(M_{(G,b,μ),∞}, 𝔽_ℓ(d_b))[2d_b]`. -/
def mantovanGraded (b : Dp.toLocal.KottwitzSet) : SmoothRepDerived.{u} Dp ℓ := sorry

/-- (IG.3/mantovan-formula) Koshikawa Theorem 7.1: for `ℓ ≠ p`, `RΓ(S_{K^p,ℚ̄_p}, 𝔽_ℓ)` has a
finite filtration `0 = F₀ → F₁ → ⋯ → F_n ≅ RΓ` by complexes of smooth
`G(ℚ_p) × W_{E_p}`-representations, indexed by a linear extension `e` of the closure order on
`B(G_{ℚ_p}, μ⁻¹)`, with cones `F_{i+1}/F_i ≅ mantovanGraded (e i)`. -/
theorem mantovanFormula [Fintype Dp.toLocal.KottwitzSet] (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) :
    ∃ (n : ℕ) (e : Fin n ≃ Dp.toLocal.KottwitzSet) (_ : ∀ i j, e i ≤ e j → i ≤ j)
      (F : Fin (n + 1) → SmoothRepDerived.{u} Dp ℓ)
      (ι : ∀ i : Fin n, F i.castSucc ⟶ F i.succ)
      (π : ∀ i : Fin n, F i.succ ⟶ mantovanGraded Dp ℓ (e i))
      (δ : ∀ i : Fin n, mantovanGraded Dp ℓ (e i) ⟶ (F i.castSucc)⟦(1 : ℤ)⟧),
      (∀ i, Triangle.mk (ι i) (π i) (δ i) ∈ distTriang (SmoothRepDerived.{u} Dp ℓ)) ∧
      IsZero (F 0) ∧ Nonempty (F (Fin.last n) ≅ RGammaShimuraSmooth Dp ℓ) := sorry

end Mantovan

end TauCeti.Igusa

end

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

open CategoryTheory AlgebraicGeometry CategoryTheory.Limits CategoryTheory.Pretriangulated

noncomputable section

namespace TauCeti.Igusa

universe u

/-! ## IG.4 — Nearby-cycle semiperversity and support bounds -/

/-! ### Carriers for IG.4: étale derived categories of schemes and diamonds (owner:
EtaleDualityAndPerverseSheaves EDC.0–EDC.4; DiamondEtaleCohomology for diamonds) -/

attribute [local instance] HasDerivedCategory.standard

section IG4Carriers

/-- The derived category `D(X_ét, Λ)` of étale sheaves of `Λ`-modules on a scheme (owner:
EtaleDualityAndPerverseSheaves EDC.0). -/
def EtDerivedIG (X : Scheme.{u}) (Λ : Type u) [CommRing Λ] : Type (u + 1) := sorry

variable (X : Scheme.{u}) (Λ : Type u) [CommRing Λ]

instance : Category.{u} (EtDerivedIG X Λ) := sorry
instance : Preadditive (EtDerivedIG X Λ) := sorry
instance : HasZeroObject (EtDerivedIG X Λ) := sorry
instance : HasShift (EtDerivedIG X Λ) ℤ := sorry
instance (n : ℤ) : (shiftFunctor (EtDerivedIG X Λ) n).Additive := sorry
instance : Pretriangulated (EtDerivedIG X Λ) := sorry

/-- Geometric costalk followed by cohomology over an algebraic closure of `κ(x)`.
Owner: EDC.5; its extension to integral limits and nonconstructible complexes is requested. -/
def EtDerivedIG.costalk (x : X) : EtDerivedIG X Λ ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- Geometric stalk, with the same convention. -/
def EtDerivedIG.stalk (x : X) : EtDerivedIG X Λ ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- The actual lower-bound criterion: `H^i(i_x!K)=0` for `i<a-δ(x)`. The dimension
function is supplied by a finite-type residue-field model, or pulled back along an integral
map. This predicate asserts no t-structure on arbitrary nonnoetherian schemes. -/
def perverseLower (δ : X → ℤ) (a : ℤ) (K : EtDerivedIG X Λ) : Prop :=
  ∀ x, DerivedCategory.TStructure.t.ge (a - δ x) ((EtDerivedIG.costalk X Λ x).obj K)

/-- The upper-bound stalk criterion on the same model. -/
def perverseUpper (δ : X → ℤ) (a : ℤ) (K : EtDerivedIG X Λ) : Prop :=
  ∀ x, DerivedCategory.TStructure.t.le (a - δ x) ((EtDerivedIG.stalk X Λ x).obj K)

/-- `δ(x)=trdeg_k κ(x)`, i.e. dimension of the closure of `x` for a finite-type
`k`-scheme. The model and its finite-presentation hypothesis are explicit below. -/
def residueDimension (k : Type u) [Field k] (toK : X ⟶ pt k) : X → ℤ := sorry

/-- The constant sheaf `Λ`. -/
def EtDerivedIG.const : EtDerivedIG X Λ := sorry

variable {X Λ}

/-- `Rf_*`. -/
def EtDerivedIG.Rpush {Y : Scheme.{u}} (f : X ⟶ Y) : EtDerivedIG X Λ ⥤ EtDerivedIG Y Λ := sorry

/-- `f^*`. -/
def EtDerivedIG.pull {Y : Scheme.{u}} (f : X ⟶ Y) : EtDerivedIG Y Λ ⥤ EtDerivedIG X Λ := sorry

/-- `j_!` (extension by zero along an open immersion). -/
def EtDerivedIG.lowerShriek {Y : Scheme.{u}} (j : X ⟶ Y) : EtDerivedIG X Λ ⥤ EtDerivedIG Y Λ :=
  sorry

/-- The natural transformation `j_! → Rj_*`. -/
def EtDerivedIG.shriekToPush {Y : Scheme.{u}} (j : X ⟶ Y) :
    EtDerivedIG.lowerShriek (Λ := Λ) j ⟶ EtDerivedIG.Rpush j := sorry

/-- The unit `Λ_Y → Rj_* Λ_X`. -/
def EtDerivedIG.unitConst {Y : Scheme.{u}} (j : X ⟶ Y) :
    EtDerivedIG.const Y Λ ⟶ (EtDerivedIG.Rpush j).obj (EtDerivedIG.const X Λ) := sorry

/-- `RΓ(X, -) : D(X_ét, Λ) → D(Λ)`. -/
def EtDerivedIG.RGamma (X : Scheme.{u}) (Λ : Type u) [CommRing Λ] :
    EtDerivedIG X Λ ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- `RΓ_c(X, Λ)`. -/
def EtDerivedIG.RGammaC (X : Scheme.{u}) (Λ : Type u) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- `RΓ(Y, Rf_* -) ≅ RΓ(X, -)`. -/
def EtDerivedIG.RGammaPush {Y : Scheme.{u}} (f : X ⟶ Y) :
    EtDerivedIG.Rpush f ⋙ EtDerivedIG.RGamma Y Λ ≅ EtDerivedIG.RGamma X Λ := sorry

/-- The derived category `D(X, 𝔽_ℓ)` of étale sheaves on a diamond, with `Rf_*` (owner:
DiamondEtaleCohomology). -/
def DiamondDerived (Y : Diamond.{u}) (Λ : Type u) [CommRing Λ] : Type (u + 1) := sorry

instance (Y : Diamond.{u}) : Category.{u} (DiamondDerived Y Λ) := sorry

def DiamondDerived.const (Y : Diamond.{u}) (Λ : Type u) [CommRing Λ] : DiamondDerived Y Λ := sorry

def DiamondDerived.Rpush {Y Z : Diamond.{u}} (f : Y ⟶ Z) :
    DiamondDerived Y Λ ⥤ DiamondDerived Z Λ := sorry

def DiamondDerived.pull {Y Z : Diamond.{u}} (f : Y ⟶ Z) :
    DiamondDerived Z Λ ⥤ DiamondDerived Y Λ := sorry

end IG4Carriers

/-! ### IG.4/equivariant-sites-and-nearby-cycles -/

section EquivariantSites

variable {Λ : Type u} [CommRing Λ]

/-- (IG.4/equivariant-sites-and-nearby-cycles) Scholze's equivariant étale site `(X/G)_ét` for a
continuous action `act : G →* Aut X` of a locally profinite group on a diamond, recorded by its
derived category of `Λ`-sheaves (owner of the site formalism: AdicEtaleGeometry A1). -/
def equivariantSite (X : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G]
    (act : G →* Aut X) (Λ : Type u) [CommRing Λ] : Type (u + 1) := sorry

instance (X : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G] (act : G →* Aut X) :
    Category.{u} (equivariantSite X G act Λ) := sorry

/-- Pullback along `X_ét → (X/G)_ét`. -/
def equivariantSite.forget (X : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G]
    (act : G →* Aut X) : equivariantSite X G act Λ ⥤ DiamondDerived X Λ := sorry

/-- `R(π/G)_*` for a `G`-equivariant map `π : Y → X`. -/
def equivariantSite.Rpush {X Y : Diamond.{u}} (G : Type) [Group G] [TopologicalSpace G]
    (actX : G →* Aut X) (actY : G →* Aut Y) (π : Y ⟶ X) :
    equivariantSite Y G actY Λ ⥤ equivariantSite X G actX Λ := sorry

/-- (IG.4/equivariant-sites-and-nearby-cycles) `R(π/G)_*F` pulls back to `Rπ_*F` along
`X_ét → (X/G)_ét` for a `G`-equivariant `π`. -/
theorem equivariantSite.pullback {X Y : Diamond.{u}} (G : Type) [Group G] [TopologicalSpace G]
    (actX : G →* Aut X) (actY : G →* Aut Y) (π : Y ⟶ X)
    (hπ : ∀ g, (actY g).hom ≫ π = π ≫ (actX g).hom) :
    Nonempty (equivariantSite.Rpush (Λ := Λ) G actX actY π ⋙ equivariantSite.forget X G actX ≅
      equivariantSite.forget Y G actY ⋙ DiamondDerived.Rpush π) := sorry

/-- The object `X × G/K` of `(X/G)_ét` attached to a compact open subgroup `K`. -/
def equivariantSite.cosetObject (X : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G]
    (act : G →* Aut X) (K : Subgroup G) : equivariantSite X G act Λ := sorry

/-- (IG.4/equivariant-sites-and-nearby-cycles) For `K ⊂ G` compact open, `(X/K)_ét` is the slice
of `(X/G)_ét` over `X × G/K`. -/
theorem equivariantSite.slice (X : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G]
    (act : G →* Aut X) (K : Subgroup G) (hK : IsOpen (K : Set G) ∧ IsCompact (K : Set G)) :
    Nonempty (equivariantSite X K (act.comp K.subtype) Λ ≌
      Over (equivariantSite.cosetObject (Λ := Λ) X G act K)) := sorry

/-- (IG.4/equivariant-sites-and-nearby-cycles) The nearby-cycle functor
`Rλ_{U/K_p *} : D((U_η̄/K_p)_ét) → D(U_{s̄,ét})` for an affinoid `U = Spa(A, A°)` étale over
`Fℓ` with `𝔘 = Spf A°`, `K_p` small enough to act trivially on `U_s = Spec(A°/p)`. -/
def nearbyCyclesEquivariant (U : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G]
    (act : G →* Aut U) (Us : Scheme.{u}) : equivariantSite U G act Λ ⥤ EtDerivedIG Us Λ := sorry

-- test: equivariantSite.trivial_group — for `G` trivial, `(X/G)_ét = X_ét`
example (X : Diamond.{u}) :
    Nonempty (equivariantSite (Λ := Λ) X Unit 1 ≌ DiamondDerived X Λ) := sorry

/-- The quotient `X/G` of a diamond by a finite group acting freely. -/
def Diamond.quotient (X : Diamond.{u}) (G : Type) [Group G] (act : G →* Aut X) : Diamond.{u} :=
  sorry

-- test: equivariantSite.finite_group — for a finite group acting freely, `(X/G)_ét` is the étale site of the quotient
example (X : Diamond.{u}) (G : Type) [Group G] [Finite G] [TopologicalSpace G]
    [DiscreteTopology G] (act : G →* Aut X)
    (hfree : ∀ (g : G) {K : Type u} [NontriviallyNormedField K] (y : Diamond.spa K ⟶ X),
      y ≫ (act g).hom = y → g = 1) :
    Nonempty (equivariantSite (Λ := Λ) X G act ≌ DiamondDerived (Diamond.quotient X G act) Λ) :=
  sorry

/-- Cohomology of the equivariant site with constant coefficients; for a trivial action
on a geometric point this computes group cohomology (owner: equivariant étale sites). -/
def equivariantSite.H (X : Diamond.{u}) (G : Type) [Group G] [TopologicalSpace G]
    (act : G →* Aut X) (Λ : Type u) [CommRing Λ] (i : ℕ) : Type u := sorry

-- test: equivariantSite.trivial_action_retains_group — H¹(B C_ℓ,F_ℓ) is nonzero
example {p : ℕ} [Fact p.Prime] (C : PadicCField.{u} p) (ℓ : ℕ) [Fact ℓ.Prime] :
    letI : TopologicalSpace (Multiplicative (ZMod ℓ)) := ⊥
    Nonempty (equivariantSite.H (Diamond.spa C.C) (Multiplicative (ZMod ℓ)) 1 (ULift.{u} (ZMod ℓ)) 1 ≃
      ULift.{u} (ZMod ℓ)) ∧ Subsingleton (DiamondH (Diamond.spa C.C) ℓ 1) := sorry

end EquivariantSites

/-! ### IG.4/finiteness-from-rank-one-valuative-criterion -/

/-- (IG.4/finiteness-from-rank-one-valuative-criterion) CS17 proof of Proposition 6.1.3: a
morphism `f : X → Y` of affine schemes of finite type over `𝔽_p` satisfying the existence part
of the valuative criterion for rank-one valuation rings with algebraically closed fraction
field is proper, hence finite. -/
theorem finitenessFromRankOneValuativeCriterion {p : ℕ} [Fact p.Prime] {X Y : Scheme.{u}}
    [IsAffine X] [IsAffine Y] (f : X ⟶ Y)
    (sX : X ⟶ Spec (CommRingCat.of (ULift.{u} (ZMod p))))
    (sY : Y ⟶ Spec (CommRingCat.of (ULift.{u} (ZMod p)))) (hf : f ≫ sY = sX)
    [LocallyOfFiniteType sX] [LocallyOfFiniteType sY]
    (hval : ∀ S : ValuativeCommSq f, IsAlgClosed S.K →
      Nonempty ((ValuationRing.valuation S.R S.K).RankOne) → S.commSq.HasLift) :
    IsProper f ∧ IsFinite f := sorry

/-! ### IG.4/finite-level-formal-models -/

section FormalNbhd

variable {Λ : Type u} [CommRing Λ]

/-- An affinoid étale neighbourhood `U = Spa(A, A°) → Y` of a geometric point
`x : Spd C → Y`, with formal model `𝔘 = Spf A°` and the special fibre `Spec(A°/p) ⊗ k`. -/
structure AffinoidEtaleNbhd {p : ℕ} [Fact p.Prime] (Y : Diamond.{u}) {C : PadicCField.{u} p}
    (x : Diamond.spa C.C ⟶ Y) where
  /-- The neighbourhood `U`. -/
  V : Diamond.{u}
  /-- The étale map `U → Y`. -/
  toY : V ⟶ Y
  /-- The lift of the point. -/
  pt : Diamond.spa C.C ⟶ V
  pt_comp : pt ≫ toY = x
  /-- The formal model `𝔘 = Spf A°`. -/
  model : PadicFormalScheme.{u}
  /-- The special fibre `𝔘_k = Spec(A°/p ⊗ k)`. -/
  special : Scheme.{u}
  special_affine : IsAffine special
  /-- Raw reduction `Spec(A°/p)` and its structure over `O_C/p`. -/
  modP : Scheme.{u}
  modPToBase : modP ⟶ Spec (C.Oeps 1)
  /-- This property is imposed only on the cofinal basis used in CSnc p.62. -/
  modP_finitePresentation : LocallyOfFinitePresentation modPToBase
  specialToK : special ⟶ TauCeti.Igusa.pt C.k
  special_finiteType : LocallyOfFiniteType specialToK
  /-- Residue-field reduction of the raw model, with its cartesian square. -/
  reduction : special ⟶ modP
  reduction_cartesian : IsPullback reduction specialToK modPToBase (C.epsReduction 1)

/-- `V` refines `U`: a map of neighbourhoods over `Y` compatible with the points. -/
def AffinoidEtaleNbhd.Refines {p : ℕ} [Fact p.Prime] {Y : Diamond.{u}} {C : PadicCField.{u} p}
    {x : Diamond.spa C.C ⟶ Y} (V U : AffinoidEtaleNbhd Y x) : Prop :=
  ∃ h : V.V ⟶ U.V, h ≫ U.toY = V.toY ∧ V.pt ≫ h = U.pt

/-- (IG.4/finite-level-formal-models) A neighbourhood `U = Spa(A) → Fℓ_C` of `x` together with
the finite-level data: `S^*_{K(p^∞N),U}` is affinoid perfectoid, the preimage of an affinoid
`U′ = S^*_{K(p^mN),U}` for `m ≥ level`, and the mod-`p` maps
`Spec(R°_{K(p^mN),U}/p) → Spec(A°/p)` at each finite level `m ≥ level`. -/
structure FormalNeighbourhood (D : UnitarySimilitudeDatum) (p N : ℕ) [Fact p.Prime]
    {C : PadicCField.{u} p} (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p)
    extends AffinoidEtaleNbhd (FlagVariety.{u} D p) x where
  /-- The level `m₀` from which on the preimage comes from finite level. -/
  level : ℕ
  /-- `S^*_{K(p^∞N),U} = S^*_{K(p^∞N),C} ×_{Fℓ_C} U`. -/
  preimage : Diamond.{u}
  /-- `π_{HT,U} : S^*_{K(p^∞N),U} → U`. -/
  piHTU : preimage ⟶ V
  preimage_affinoid : Diamond.IsAffinoidPerfectoid preimage
  /-- `Spec(R°_{K(p^mN),U}/p ⊗ k)`, for `m ≥ level`. -/
  specialLevel : ℕ → Scheme.{u}
  /-- Raw finite-level mod-p models are distinguished from their residue-field reductions. -/
  modPLevel : ℕ → Scheme.{u}
  modPProj : ∀ m, modPLevel m ⟶ modP
  levelReduction : ∀ m, specialLevel m ⟶ modPLevel m

  /-- The mod-`p` maps `Spec(R°_{K(p^mN),U}/p) → Spec(A°/p)`. -/
  projLevel : ∀ m, specialLevel m ⟶ special
  levelReduction_cartesian : ∀ m,
    IsPullback (levelReduction m) (projLevel m) (modPProj m) reduction
  /-- The transition maps in `p`-level. -/
  transitionMap : ∀ {m m'}, m ≤ m' → (specialLevel m' ⟶ specialLevel m)
  /-- The corresponding transitions on the raw `O_C/p` models. -/
  modPTransitionMap : ∀ {m m'}, m ≤ m' → (modPLevel m' ⟶ modPLevel m)
  /-- `Spec(R°_{K(p^∞N),U}/p ⊗ k)` and its map to `Spec(A°/p)`. -/
  specialInf : Scheme.{u}
  projInf : specialInf ⟶ special
  modPInf : Scheme.{u}
  modPInfProj : modPInf ⟶ modP
  modPInfToLevel : ∀ m, modPInf ⟶ modPLevel m
  /-- Finite presentation factors the target map, not a finiteness assertion about the source. -/
  modP_factor : ∀ m, level ≤ m → modPInfToLevel m ≫ modPProj m = modPInfProj

namespace FormalNeighbourhood

variable {D : UnitarySimilitudeDatum} {p N : ℕ} [Fact p.Prime] {C : PadicCField.{u} p}
  {x : Diamond.spa C.C ⟶ FlagVariety.{u} D p}

/-- (IG.4/finite-level-formal-models) Such `U` form a cofinal system of affinoid étale
neighbourhoods of `x`. -/
theorem cofinal (hN : 3 ≤ N) (hpN : Nat.Coprime p N)
    (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) (V : AffinoidEtaleNbhd (FlagVariety.{u} D p) x) :
    ∃ U : FormalNeighbourhood D p N x, U.toAffinoidEtaleNbhd.Refines V := sorry

/-- (IG.4/finite-level-formal-models) The valuative criterion for the affine raw
mod-p map proves integrality at sufficiently large level. Base change gives the
residue-field maps; no finite-type-F_p finiteness lemma is applied to these raw models. -/
theorem integral (U : FormalNeighbourhood D p N x) :
    IsIntegralHom U.modPInfProj ∧ IsIntegralHom U.projInf ∧
      ∀ m, U.level ≤ m → IsIntegralHom (U.modPProj m) ∧ IsIntegralHom (U.projLevel m) := sorry

/-- (IG.4/finite-level-formal-models) The raw mod-p map factors at sufficiently large
level using the finite presentation of `A°/p` over `O_C/p`. -/
theorem factor_modP (U : FormalNeighbourhood D p N x) (m : ℕ) (hm : U.level ≤ m) :
    U.modPInfToLevel m ≫ U.modPProj m = U.modPInfProj := sorry

/-- (IG.4/finite-level-formal-models) Requested EDC.5 integral-pushforward lower-bound
contract, with source dimension pulled back from the finite-type residue-field base.
The underlying theorem must prove this for the level complexes in CSnc, including
nonconstructible filtered limits, rather than assuming arbitrary perverse t-exactness. -/
theorem pushforward_ge (U : FormalNeighbourhood D p N x) (d : ℤ) (m : ℕ) (hm : U.level ≤ m)
    (ℓ : ℕ) [Fact ℓ.Prime] [CharP Λ ℓ] (hℓp : ℓ ≠ p)
    (K : EtDerivedIG (U.specialLevel m) Λ)
    (hK : perverseLower _ Λ (fun z ↦ residueDimension _ C.k U.specialToK ((U.projLevel m).base z)) d K) :
    perverseLower _ Λ (residueDimension _ C.k U.specialToK) d
      ((EtDerivedIG.Rpush (U.projLevel m)).obj K) := sorry

/-- Imported SF.2/LPV.6 compatibility predicate: the algebraized open/finite charts
at auxiliary ℓ-power tame level, their level-change maps and toroidal boundary maps
commute with nearby-cycle and scheme/adic comparisons. This is the requested geometric
interface, rather than an assertion that the p-level equality supplies those comparisons. -/
def AuxiliaryTowerBoundaryCompatible (U : FormalNeighbourhood D p N x) : Prop := sorry

/-- (IG.4/finite-level-formal-models) Compatibility on both reductions and in the
auxiliary tower and boundary comparisons. -/
theorem transition (U : FormalNeighbourhood D p N x) {m m' : ℕ} (h : m ≤ m') :
    (U.transitionMap h ≫ U.projLevel m = U.projLevel m') ∧
    (U.modPTransitionMap h ≫ U.modPProj m = U.modPProj m') ∧
    AuxiliaryTowerBoundaryCompatible U := sorry

/-- A composite `V → U` of finite étale maps and rational embeddings (data witnessing the chain;
owner: AdicSpacesPartII). -/
def FiniteEtaleRationalChain (V W : Diamond.{u}) : Type (u + 1) := sorry

def FiniteEtaleRationalChain.toHom {V W : Diamond.{u}} :
    FiniteEtaleRationalChain V W → (V ⟶ W) := sorry

-- test: FormalNeighbourhood.rational_point — the system is stable under refinement by composites of finite étale maps and rational embeddings
example (U : FormalNeighbourhood D p N x) (V : Diamond.{u}) (c : FiniteEtaleRationalChain V U.V)
    (pt' : Diamond.spa C.C ⟶ V) (hpt : pt' ≫ c.toHom = U.pt) :
    ∃ (U' : FormalNeighbourhood D p N x) (e : U'.V ≅ V),
      e.hom ≫ c.toHom ≫ U.toY = U'.toY := sorry

-- test: FormalNeighbourhood.level_zero — at sufficiently large finite level the mod-`p` map is integral
example (U : FormalNeighbourhood D p N x) (m : ℕ) (hm : U.level ≤ m) :
    IsIntegralHom (U.modPProj m) ∧ IsIntegralHom (U.projLevel m) := sorry

-- test: FormalNeighbourhood.not_proper_generic — `π_{HT,U}` has positive-dimensional fibres (needs `d_{b(x)} > 0`, false for basic `x`) although its mod-`p` model is integral
example (U : FormalNeighbourhood D p N x) (hb : 0 < (FlagPoint.newton x).dimLeaf) :
    0 < topologicalKrullDim (Diamond.space (pullback U.piHTU U.pt)) := sorry

end FormalNeighbourhood

end FormalNbhd

/-! ### IG.4/compact-perversity -/

section CompactHodge

variable {p : ℕ} [Fact p.Prime]

/-- A compact Shimura datum of Hodge type with sufficiently small `K^p` (owner:
PerfectoidShimuraVarieties S3). -/
def HodgeDatum (p : ℕ) : Type := sorry

/-- `𝒮_{K^p}`, `Fℓ_{G,μ}`, `π_HT` and `⟨2ρ, μ⟩` for the Hodge-type datum. -/
def HodgeDatum.shimuraPerf (Dh : HodgeDatum p) : Diamond.{u} := sorry

def HodgeDatum.flag (Dh : HodgeDatum p) : Diamond.{u} := sorry

def HodgeDatum.piHT (Dh : HodgeDatum p) : Dh.shimuraPerf.{u} ⟶ Dh.flag := sorry

def HodgeDatum.dimFlag (Dh : HodgeDatum p) : ℕ := sorry

/-- The group `G(ℚ_p)`, a locally profinite group. -/
def HodgeDatum.Gp (Dh : HodgeDatum p) : Type := sorry

instance (Dh : HodgeDatum p) : Group Dh.Gp := sorry
instance (Dh : HodgeDatum p) : TopologicalSpace Dh.Gp := sorry

/-- Pro-`p` compact open subgroups of `G(ℚ_p)` (carrier; owner: SmoothRepresentations SR.0). -/
def HodgeDatum.ProPCompactOpen (Dh : HodgeDatum p) : Type := sorry

def HodgeDatum.ProPCompactOpen.toSubgroup {Dh : HodgeDatum p} :
    Dh.ProPCompactOpen → Subgroup Dh.Gp := sorry

/-- `Rλ_{U/K_p*}(R(π_HT/G(ℚ_p))_*𝔽_ℓ)|_{U_η̄/K_p}` on `𝔘_s̄`. -/
def compactNearbyCycles (Dh : HodgeDatum p) {C : PadicCField.{u} p}
    {x : Diamond.spa C.C ⟶ Dh.flag.{u}} (U : AffinoidEtaleNbhd Dh.flag x)
    (K : Dh.ProPCompactOpen) (Λ : Type u) [CommRing Λ] : EtDerivedIG U.special Λ := sorry

/-- (IG.4/compact-perversity) CS17 Proposition 6.1.3: for a compact Shimura variety of Hodge type
and a geometric point `x̄` of `Fℓ_{G,μ}`, every affinoid étale neighbourhood of `x̄` is refined by
one, `U`, such that `Rλ_{U/K_p*}(R(π_HT/G(ℚ_p))_*𝔽_ℓ)[⟨2ρ, μ⟩]` is perverse on `𝔘_s̄` for every
sufficiently small pro-`p` compact open `K_p`. -/
theorem compactPerversity (Dh : HodgeDatum p) (C : PadicCField.{u} p)
    (x : Diamond.spa C.C ⟶ Dh.flag.{u}) (Λ : Type u) [Field Λ] (ℓ : ℕ) [CharP Λ ℓ]
    [Fintype Λ] (hΛ : Fintype.card Λ = ℓ) (hℓp : ℓ ≠ p)
    (V : AffinoidEtaleNbhd Dh.flag x) :
    ∃ U : AffinoidEtaleNbhd Dh.flag x, U.Refines V ∧
      ∃ K₀ : Dh.ProPCompactOpen, ∀ K : Dh.ProPCompactOpen, K.toSubgroup ≤ K₀.toSubgroup →
        let L := (shiftFunctor (EtDerivedIG U.special Λ) (Dh.dimFlag : ℤ)).obj
          (compactNearbyCycles Dh U K Λ)
        perverseLower _ Λ (residueDimension _ C.k U.specialToK) 0 L ∧
          perverseUpper _ Λ (residueDimension _ C.k U.specialToK) 0 L := sorry

end CompactHodge

/-! ### IG.4/compact-minimal-stratum-concentration -/

/-- The Hecke algebra `𝕋^S` of a PEL datum (owner: SmoothRepresentations SR.1). -/
def IntegralPELDatum.Hecke {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (S : Finset ℕ) : Type := sorry

instance {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (S : Finset ℕ) : CommRing (Dp.Hecke S) := sorry

instance {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p) (S : Finset ℕ) (C : PadicCField.{u} p)
    (b : Dp.toLocal.KottwitzSet) (ℓ i : ℕ) :
    Module (Dp.Hecke S) (EtH (Dp.igusa C b) (ZMod ℓ) i) := sorry

/-- (IG.4/compact-minimal-stratum-concentration) CS17 Corollary 6.1.4: for a compact PEL Shimura
variety of type (A) or (C) with good reduction at `p`, `ℓ ≠ p`, `S ∋ p` and `𝔪 ⊂ 𝕋^S` maximal:
if `b` minimises `d_b` among the `b` with `H^*(Ig^b, 𝔽_ℓ)[𝔪] ≠ 0`, then `H^i(Ig^b, 𝔽_ℓ)[𝔪] ≠ 0`
only for `i = d_b`. -/
theorem compactMinimalStratumConcentration {p : ℕ} [Fact p.Prime] (Dp : IntegralPELDatum p)
    (hprop : IsProper (Dp.integralModelToBase)) (C : PadicCField.{u} p) (ℓ : ℕ)
    (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) (S : Finset ℕ) (hpS : p ∈ S) (𝔪 : Ideal (Dp.Hecke S))
    [𝔪.IsMaximal] (b : Dp.toLocal.KottwitzSet)
    (hb : ∃ i, Submodule.torsionBySet (Dp.Hecke S) (EtH (Dp.igusa C b) (ZMod ℓ) i) 𝔪 ≠ ⊥)
    (hmin : ∀ b' : Dp.toLocal.KottwitzSet,
      (∃ i, Submodule.torsionBySet (Dp.Hecke S) (EtH (Dp.igusa C b') (ZMod ℓ) i) 𝔪 ≠ ⊥) →
        LocalPELDatum.dimLeaf b ≤ LocalPELDatum.dimLeaf b') (i : ℕ)
    (hi : Submodule.torsionBySet (Dp.Hecke S) (EtH (Dp.igusa C b) (ZMod ℓ) i) 𝔪 ≠ ⊥) :
    i = LocalPELDatum.dimLeaf b := sorry

/-! ### IG.4/ell-power-boundary-killing -/

section EllPower

variable {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]

/-- `S_{K(Nℓ^∞),ℚ̄} = lim_m S_{K(Nℓ^m),ℚ̄}` and its toroidal compactification (limits in schemes;
owner: IG.0/IG.2). -/
def ShimuraQbarEllInf (D : UnitarySimilitudeDatum) (N ℓ : ℕ) : Scheme.{u} := sorry

def ToroidalQbarEllInf (D : UnitarySimilitudeDatum) (N ℓ : ℕ) : Scheme.{u} := sorry

/-- `j_{Nℓ^∞}`. -/
def ShimuraQbarEllInf.j (D : UnitarySimilitudeDatum) (N ℓ : ℕ) :
    ShimuraQbarEllInf.{u} D N ℓ ⟶ ToroidalQbarEllInf D N ℓ := sorry

/-- `Ig^X_{K(Nℓ^∞)}` and `Ig^{X,tor}_{K(Nℓ^∞)}` with the open immersion. -/
def IgusaEllInf (N ℓ : ℕ) {k : Type u} [Field k] (X : PDivGStructure D p (pt k)) : Scheme.{u} :=
  sorry

def IgusaTorEllInf (N ℓ : ℕ) {k : Type u} [Field k] (X : PDivGStructure D p (pt k)) :
    Scheme.{u} := sorry

def IgusaEllInf.j (N ℓ : ℕ) {k : Type u} [Field k] (X : PDivGStructure D p (pt k)) :
    IgusaEllInf N ℓ X ⟶ IgusaTorEllInf N ℓ X := sorry

/-- `S^tor_{K(p^∞Nℓ^∞)}` and `S°_{K(p^∞Nℓ^∞)}` (limits over `ℓ`-power tame level) with their
Hodge–Tate period maps (owner: PerfectoidShimuraVarieties S3). -/
def ToroidalShimuraInfEll (D : UnitarySimilitudeDatum) (p N ℓ : ℕ) : Diamond.{u} := sorry

def GoodReductionLocusEll (D : UnitarySimilitudeDatum) (p N ℓ : ℕ) : Diamond.{u} := sorry

def piHTTorEll (D : UnitarySimilitudeDatum) (p N ℓ : ℕ) :
    ToroidalShimuraInfEll.{u} D p N ℓ ⟶ FlagVariety D p := sorry

def piHTGoodEll (D : UnitarySimilitudeDatum) (p N ℓ : ℕ) :
    GoodReductionLocusEll.{u} D p N ℓ ⟶ FlagVariety D p := sorry

/-- The restriction map `Rπ^tor_{HT,ℓ^∞,*}𝔽_ℓ → Rπ°_{HT,ℓ^∞,*}𝔽_ℓ` in `D(Fℓ, 𝔽_ℓ)`. -/
def ellPowerComparison (D : UnitarySimilitudeDatum) (p N ℓ : ℕ) (Λ : Type u) [CommRing Λ] :
    (DiamondDerived.Rpush (piHTTorEll.{u} D p N ℓ)).obj (DiamondDerived.const _ Λ) ⟶
      (DiamondDerived.Rpush (piHTGoodEll.{u} D p N ℓ)).obj (DiamondDerived.const _ Λ) := sorry

/-- (IG.4/ell-power-boundary-killing) CSnc Lemmas 4.6.2–4.6.3: at tame level `Nℓ^∞`, (1)
`𝔽_ℓ → Rj_{Nℓ^∞,*}𝔽_ℓ` is an isomorphism; (2) `H^i(Ig^{X,tor}_{K(Nℓ^∞)}, 𝔽_ℓ) →
H^i(Ig^X_{K(Nℓ^∞)}, 𝔽_ℓ)` is an isomorphism; consequently `Rπ^tor_{HT,ℓ^∞,*}𝔽_ℓ →
Rπ°_{HT,ℓ^∞,*}𝔽_ℓ` is an isomorphism. (`Λ` is a field with `ℓ` elements.) -/
theorem ellPowerBoundaryKilling (N : ℕ) (hN : 3 ≤ N) (hpN : Nat.Coprime p N) (ℓ : ℕ)
    (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) (Λ : Type u) [Field Λ] [CharP Λ ℓ] [Fintype Λ]
    (hΛ : Fintype.card Λ = ℓ) :
    IsIso (EtDerivedIG.unitConst (Λ := Λ) (ShimuraQbarEllInf.j.{u} D N ℓ)) ∧
    (∀ {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGStructure D p (pt k)) (i : ℕ),
      Function.Bijective (EtH.pullbackIG1 (IgusaEllInf.j N ℓ X) (ZMod ℓ) i)) ∧
    IsIso (ellPowerComparison.{u} D p N ℓ Λ) := sorry

end EllPower

/-! ### IG.4/semiperversity -/

/-- The nearby cycles `Rψ(Rπ°_HT*𝔽_ℓ)|_𝔘 ∈ D(𝔘_k, 𝔽_ℓ)` on the special fibre of the formal model of
an affinoid étale neighbourhood. -/
def nearbyCyclesGood {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] (N : ℕ)
    {C : PadicCField.{u} p} {x : Diamond.spa C.C ⟶ FlagVariety.{u} D p}
    (U : AffinoidEtaleNbhd (FlagVariety.{u} D p) x) (Λ : Type u) [CommRing Λ] :
    EtDerivedIG U.special Λ := sorry

/-- (IG.4/semiperversity) CSnc Theorem 4.6.1 = Theorem 2.8.3: every geometric point `x` of
`Fℓ_C` has a cofinal system of affinoid étale neighbourhoods `U = Spa(A)` such that
`Rψ(Rπ°_HT*𝔽_ℓ)|_𝔘 ∈ ^pD^{≥d}(𝔘_k, 𝔽_ℓ)`, `d = [F⁺:ℚ]n²` (a local statement on the special
fibres `𝔘_k`, not a perverse t-structure on `Fℓ`). -/
theorem semiperversity {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] (N : ℕ) (hN : 3 ≤ N)
    (hpN : Nat.Coprime p N) (hp : ¬ (p : ℤ) ∣ NumberField.discr D.F) (C : PadicCField.{u} p) (x : Diamond.spa C.C ⟶ FlagVariety.{u} D p)
    (ℓ : ℕ) (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) (Λ : Type u) [Field Λ] [CharP Λ ℓ] [Fintype Λ]
    (hΛ : Fintype.card Λ = ℓ) (V : AffinoidEtaleNbhd (FlagVariety.{u} D p) x) :
    ∃ U : AffinoidEtaleNbhd (FlagVariety.{u} D p) x, U.Refines V ∧
      perverseLower _ Λ (residueDimension _ C.k U.specialToK) (D.dim : ℤ) (nearbyCyclesGood N U Λ) := sorry

/-! ### IG.4/partial-support-cohomology -/

section PartialSupport

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k]

/-- The boundary `∂Ig^{b,*}_m = Ig^{b,*}_m ∖ Ig^b_m` with its closed immersion (owner:
IG.2/minimal-igusa-compactification). -/
def MinimalIgusa.boundary (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) : Scheme.{u} := sorry

def MinimalIgusa.i (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) :
    MinimalIgusa.boundary N X m ⟶ MinimalIgusa N X m := sorry

/-- (IG.4/partial-support-cohomology) `RΓ_{c−∂}(Ig^b_m, Λ) := RΓ(Ig^{b,*}_m, j_!Λ)` at finite
level `m` (the colimit over `m` has cohomology `PartialSupportCoh`). -/
def partialSupportCohomology (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Λ : Type u)
    [CommRing Λ] : DerivedCategory (ModuleCat.{u} Λ) :=
  (EtDerivedIG.RGamma _ Λ).obj
    ((EtDerivedIG.lowerShriek (MinimalIgusa.j N X m)).obj (EtDerivedIG.const _ Λ))

namespace partialSupportCohomology

/-- `RΓ(Ig^b_m, Λ)`. -/
abbrev igusaRGamma (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Λ : Type u) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) :=
  (EtDerivedIG.RGamma (MantovanIgusaVariety N X m) Λ).obj (EtDerivedIG.const _ Λ)

/-- (IG.4/partial-support-cohomology) The natural map `RΓ_{c−∂}(Ig^b) → RΓ(Ig^b)` induced by
`j_!Λ → Rj_*Λ`. -/
def toCohomology (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Λ : Type u) [CommRing Λ] :
    partialSupportCohomology N X m Λ ⟶ igusaRGamma N X m Λ :=
  (EtDerivedIG.RGamma _ Λ).map ((EtDerivedIG.shriekToPush (MinimalIgusa.j N X m)).app _) ≫
    ((EtDerivedIG.RGammaPush (MinimalIgusa.j N X m)).app _).hom

/-- (IG.4/partial-support-cohomology) The distinguished triangle
`RΓ_{c−∂}(Ig^b) → RΓ(Ig^b) → RΓ(∂Ig^{b,*}, i^*Rj_*Λ) →`. -/
theorem triangle (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Λ : Type u) [CommRing Λ] :
    ∃ (g : igusaRGamma N X m Λ ⟶ (EtDerivedIG.RGamma _ Λ).obj
        ((EtDerivedIG.pull (MinimalIgusa.i N X m)).obj
          ((EtDerivedIG.Rpush (MinimalIgusa.j N X m)).obj (EtDerivedIG.const _ Λ))))
      (h : (EtDerivedIG.RGamma _ Λ).obj
        ((EtDerivedIG.pull (MinimalIgusa.i N X m)).obj
          ((EtDerivedIG.Rpush (MinimalIgusa.j N X m)).obj (EtDerivedIG.const _ Λ))) ⟶
          (partialSupportCohomology N X m Λ)⟦(1 : ℤ)⟧),
      Triangle.mk (toCohomology N X m Λ) g h ∈ distTriang _ := sorry

/-- (IG.4/partial-support-cohomology) The natural map `RΓ_c(Ig^b) → RΓ_{c−∂}(Ig^b)` (from
`j′_! = i_*j_!` for the compactification `Ig^{b,*} ⊂ Ig^{b,*,c}` by a proper scheme). -/
def fromCompact (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Λ : Type u) [CommRing Λ] :
    EtDerivedIG.RGammaC (MantovanIgusaVariety N X m) Λ ⟶ partialSupportCohomology N X m Λ :=
  sorry

/-- (IG.4/partial-support-cohomology) On cohomology (colimit over levels), the map
`H^i_{c−∂}(Ig^b, 𝔽_ℓ) → H^i(Ig^b, 𝔽_ℓ)` is `𝕋^S`-linear (and prime-to-`p` Hecke equivariant). -/
def hecke (N : ℕ) (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    PartialSupportCoh N X ℓ i →ₗ[HeckeAlgebra D S] IgusaCoh N X ℓ i := sorry

-- test: partialSupportCohomology.no_boundary — if `X_b^{ét} = 0` then `RΓ_{c−∂}(Ig^b) = RΓ(Ig^b)`
example (N : ℕ) (X : PDivGStructure D p (pt k)) (m : ℕ) (Λ : Type u) [CommRing Λ]
    (h : ∀ τ : NumberField.RingOfIntegers D.F →+* k, X.etaleRank τ = 0) :
    IsIso (toCohomology N X m Λ) := sorry

-- test: partialSupportCohomology.ordinary_modular — modular curve, `b` ordinary: `H⁰_{c−∂}(Ig^b_m, 𝔽_ℓ) = 0` while `H⁰(Ig^b_m, 𝔽_ℓ) ≠ 0`
example [IsAlgClosed k] [CharP k p] (hD : D.IsModularCase) (N : ℕ) (X : PDivGStructure D p (pt k))
    (hX : X.newtonClass = KottwitzSet.ordinary D p) (m : ℕ) (Λ : Type u) [Field Λ] :
    IsZero ((DerivedCategory.homologyFunctor _ 0).obj (partialSupportCohomology N X m Λ)) ∧
    ¬ IsZero ((DerivedCategory.homologyFunctor _ 0).obj (igusaRGamma N X m Λ)) := sorry

-- test: partialSupportCohomology.ne_compact — `RΓ_{c−∂}(Ig^b) ≠ RΓ_c(Ig^b)`: for the ordinary modular Igusa curve the natural map is not an isomorphism (they differ in degree 2)
example [IsAlgClosed k] [CharP k p] (hD : D.IsModularCase) (N : ℕ) (X : PDivGStructure D p (pt k))
    (hX : X.newtonClass = KottwitzSet.ordinary D p) (m : ℕ) (Λ : Type u) [Field Λ] :
    ¬ IsIso (fromCompact N X m Λ) := sorry

end partialSupportCohomology

end PartialSupport

/-! ### IG.4/artin-vanishing-upper-bound -/

/-- (IG.4/artin-vanishing-upper-bound) CSnc Theorem 2.8.1, Proposition 2.8.2: the partial minimal
compactifications `Ig^{b,*}` (perfect and at every finite level) are affine; consequently
`H^i_{c−∂}(Ig^b, 𝔽_ℓ) = H^i(Ig^{b,*}, j_!𝔽_ℓ) = 0` for `i > d_b = dim Ig^b`, `ℓ ≠ p`. -/
theorem artinVanishingUpperBound {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N)
    (hpN : Nat.Coprime p N) (X : PDivGStructure D p (pt k)) (ℓ : ℕ) (hℓ : ℓ.Prime)
    (hℓp : ℓ ≠ p) :
    IsAffine (PerfectMinimalIgusa N X) ∧ (∀ m, IsAffine (MinimalIgusa N X m)) ∧
    ∀ i, X.newtonClass.dimLeaf < i → Subsingleton (PartialSupportCoh N X ℓ i) := sorry

/-! ### IG.4/minimal-stratum-lower-bound -/

/-- A completely slope divisible representative `X_b` over `k` of `b ∈ B(G_{ℚ_p}, μ⁻¹)` (owner:
IG.0/newton-map, IG.1). -/
def KottwitzSet.rep {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) (k : Type u)
    [Field k] : PDivGStructure D p (pt k) := sorry

/-- (IG.4/minimal-stratum-lower-bound) CSnc Lemma 2.8.4: let `S` contain all primes dividing
`pℓNΔ_F` (and `∞`), `𝔪 ⊂ 𝕋^S` maximal with `ℓ ∈ 𝔪`, and `b` with `d_b` minimal among those with
`H^*(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0`. Then `H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0` implies `i ≥ d_b`. -/
theorem minimalStratumLowerBound {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime]
    {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (N : ℕ) (hN : 3 ≤ N)
    (hpN : Nat.Coprime p N) (ℓ : ℕ) (hℓ : ℓ.Prime) (hℓp : ℓ ≠ p) (S : Finset ℕ)
    (hS : ∀ q : ℕ, q.Prime → q ∣ p * ℓ * N * (NumberField.discr D.F).natAbs → q ∈ S)
    (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal] (hℓ𝔪 : (ℓ : HeckeAlgebra D S) ∈ 𝔪)
    (b : KottwitzSet D p)
    (hb : ∃ i, Nontrivial (localizeAt 𝔪 (IgusaCoh N (b.rep k) ℓ i)))
    (hmin : ∀ b' : KottwitzSet D p, (∃ i, Nontrivial (localizeAt 𝔪 (IgusaCoh N (b'.rep k) ℓ i))) →
      b.dimLeaf ≤ b'.dimLeaf) (i : ℕ)
    (hi : Nontrivial (localizeAt 𝔪 (IgusaCoh N (b.rep k) ℓ i))) :
    b.dimLeaf ≤ i := sorry

end TauCeti.Igusa

end

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

namespace TauCeti.Igusa

open CategoryTheory AlgebraicGeometry IsDedekindDomain Polynomial

noncomputable section

/-! ## IG.5 — Rational Igusa trace comparison and genericity obstruction -/

section IG5Carriers

/-! ### Places, Frobenius elements and residual Galois representations

Carriers for the Galois side. Owners: AutomorphicGaloisRepresentationsPartII AG2.7 (residual
representations attached to Hecke eigensystems, the residual ratio predicate), and the
global class field theory roadmap for Frobenius and inertia subgroups. -/

/-- Finite places of `F`, i.e. height-one primes of `𝓞_F`. -/
abbrev IgPlace (D : UnitarySimilitudeDatum) : Type :=
  HeightOneSpectrum (NumberField.RingOfIntegers D.F)

/-- The residue cardinality `q_v = |𝓞_F / v|`. -/
def IgPlace.normQ {D : UnitarySimilitudeDatum} (v : IgPlace D) : ℕ := Ideal.absNorm v.asIdeal

/-- `p` splits completely in the number field `K`: `p𝓞_K` is radical (unramified) and every
prime above `p` has residue field `𝔽_p`. -/
def SplitsCompletelyIG (K : Type) [Field K] [NumberField K] (p : ℕ) : Prop :=
  (Ideal.span {(p : NumberField.RingOfIntegers K)}).IsRadical ∧
    ∀ v : HeightOneSpectrum (NumberField.RingOfIntegers K),
      (p : NumberField.RingOfIntegers K) ∈ v.asIdeal → Ideal.absNorm v.asIdeal = p

/-- A fixed imaginary quadratic subfield `F₀ ⊂ F` (part of the standing data of CSnc §5). -/
structure ImagQuadSubfield (D : UnitarySimilitudeDatum) where
  /-- The subfield `F₀`. -/
  F₀ : IntermediateField ℚ D.F
  finrank_eq : Module.finrank ℚ F₀ = 2
  totallyComplex : NumberField.IsTotallyComplex F₀

/-- The rational prime `q` splits in `F₀`: two distinct maximal ideals of `𝓞_{F₀}` contain `q`. -/
def ImagQuadSubfield.SplitsAt {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D) (q : ℕ) :
    Prop :=
  ∃ P Q : Ideal (NumberField.RingOfIntegers E.F₀), P.IsMaximal ∧ Q.IsMaximal ∧ P ≠ Q ∧
    (q : NumberField.RingOfIntegers E.F₀) ∈ P ∧ (q : NumberField.RingOfIntegers E.F₀) ∈ Q

/-- A place `v | q` of `F` with `q ∉ S` split in `F₀`; at such places
`G(ℚ_q) = GL_{2n}(F_v) × ∏_{w | 𝔮, w ≠ v} GL_{2n}(F_w) × ℚ_q^×`. -/
structure SplitPlace {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D) (S : Finset ℕ) where
  /-- The place of `F`. -/
  v : IgPlace D
  /-- Its residue characteristic. -/
  q : ℕ
  q_prime : q.Prime
  q_not_mem : q ∉ S
  lies_over : (q : NumberField.RingOfIntegers D.F) ∈ v.asIdeal
  split : E.SplitsAt q

/-- `𝔽̄_ℓ`. -/
abbrev FlBar (ℓ : ℕ) [Fact ℓ.Prime] : Type := AlgebraicClosure (ZMod ℓ)

/-- `ℚ̄_ℓ`, with its spectral norm (Mathlib `PadicAlgCl`). -/
abbrev QlBar (ℓ : ℕ) [Fact ℓ.Prime] : Type := PadicAlgCl ℓ

/-- The representation on `R^m` defined by a homomorphism to `GL_m(R)`. -/
def igGLRep {G R : Type} [Group G] [CommRing R] {m : ℕ}
    (f : G →* Matrix.GeneralLinearGroup (Fin m) R) : Representation R G (Fin m → R) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp f)

/-- A continuous residual representation `Gal(K̄/K) → GL_m(𝔽̄_ℓ)`; continuity for the discrete
topology on the target is openness of the kernel (owner: AutomorphicGaloisRepresentationsPartII
AG2.7). -/
structure ResidualRep (K : Type) [Field K] (m ℓ : ℕ) [Fact ℓ.Prime] where
  /-- The underlying homomorphism. -/
  toHom : Field.absoluteGaloisGroup K →* Matrix.GeneralLinearGroup (Fin m) (FlBar ℓ)
  isOpen_ker : IsOpen (toHom.ker : Set (Field.absoluteGaloisGroup K))

namespace ResidualRep

variable {K : Type} [Field K] {m ℓ : ℕ} [Fact ℓ.Prime]

/-- The associated representation on `𝔽̄_ℓ^m`. -/
def toRep (ρ : ResidualRep K m ℓ) :
    Representation (FlBar ℓ) (Field.absoluteGaloisGroup K) (Fin m → FlBar ℓ) :=
  igGLRep ρ.toHom

/-- Semisimplicity of `ρ`. -/
def IsSemisimple (ρ : ResidualRep K m ℓ) : Prop :=
  IsSemisimpleModule (MonoidAlgebra (FlBar ℓ) (Field.absoluteGaloisGroup K)) ρ.toRep.asModule

/-- The Jordan–Hölder length of `ρ` (number of constituents). -/
def length (ρ : ResidualRep K m ℓ) : ℕ∞ :=
  Module.length (MonoidAlgebra (FlBar ℓ) (Field.absoluteGaloisGroup K)) ρ.toRep.asModule

/-- Absolute irreducibility (irreducibility over `𝔽̄_ℓ`). -/
def IsAbsIrreducible (ρ : ResidualRep K m ℓ) : Prop := ρ.toRep.IsIrreducible

/-- Isomorphism of residual representations (conjugacy by `GL_m(𝔽̄_ℓ)`). -/
def Iso (ρ σ : ResidualRep K m ℓ) : Prop :=
  ∃ P : Matrix.GeneralLinearGroup (Fin m) (FlBar ℓ), ∀ g, σ.toHom g = P * ρ.toHom g * P⁻¹

/-- `ρ` is unramified with respect to the inertia subgroup `I`. -/
def IsUnramifiedAt (ρ : ResidualRep K m ℓ) (I : Subgroup (Field.absoluteGaloisGroup K)) :
    Prop :=
  I ≤ ρ.toHom.ker

/-- The characteristic polynomial of `ρ(g)`. -/
def charpolyAt (ρ : ResidualRep K m ℓ) (g : Field.absoluteGaloisGroup K) : (FlBar ℓ)[X] :=
  (ρ.toHom g : Matrix (Fin m) (Fin m) (FlBar ℓ)).charpoly

/-- The contragredient `g ↦ (ρ(g)⁻¹)ᵀ`. -/
def dual (ρ : ResidualRep K m ℓ) : ResidualRep K m ℓ := sorry

/-- The twist `g ↦ χ(g) ρ(g)` by a continuous character. -/
def twist (ρ : ResidualRep K m ℓ) (χ : Field.absoluteGaloisGroup K →* (FlBar ℓ)ˣ) :
    ResidualRep K m ℓ := sorry

/-- The direct sum of continuous characters `χ_1 ⊕ ⋯ ⊕ χ_m` (diagonal matrices). -/
def ofChars (χ : Fin m → Field.absoluteGaloisGroup K →* (FlBar ℓ)ˣ)
    (hχ : ∀ i, IsOpen ((χ i).ker : Set (Field.absoluteGaloisGroup K))) : ResidualRep K m ℓ :=
  sorry

end ResidualRep

/-- The polynomial `P` splits with roots `α_1, …, α_m` satisfying `α_i ≠ q α_j` for `i ≠ j`
(repeated roots allowed): the residual ratio predicate of AG2.7. -/
def PolyRatioCond {L : Type} [Field L] (P : L[X]) (m q : ℕ) : Prop :=
  ∃ α : Fin m → L, P = ∏ i, (X - C (α i)) ∧ ∀ i j, i ≠ j → α i ≠ (q : L) * α j

/-- CS17 decomposed genericity of the roots: `α_i / α_j ∉ {1, q}` for `i ≠ j`. -/
def PolyDecompGeneric {L : Type} [Field L] (P : L[X]) (m q : ℕ) : Prop :=
  ∃ α : Fin m → L, P = ∏ i, (X - C (α i)) ∧ ∀ i j, i ≠ j → α i ≠ α j ∧ α i ≠ (q : L) * α j

/-- The ratio predicate for `ρ(g)`: eigenvalues with `α_i ≠ q α_j` for `i ≠ j`. -/
def ResidualRep.FrobRatioCond {K : Type} [Field K] {m ℓ : ℕ} [Fact ℓ.Prime]
    (ρ : ResidualRep K m ℓ) (g : Field.absoluteGaloisGroup K) (q : ℕ) : Prop :=
  PolyRatioCond (ρ.charpolyAt g) m q

/-- CS17 decomposed genericity for `ρ(g)`: `α_i / α_j ∉ {1, q}` for `i ≠ j`. -/
def ResidualRep.DecomposedGenericAt {K : Type} [Field K] {m ℓ : ℕ} [Fact ℓ.Prime]
    (ρ : ResidualRep K m ℓ) (g : Field.absoluteGaloisGroup K) (q : ℕ) : Prop :=
  PolyDecompGeneric (ρ.charpolyAt g) m q

/-- A (geometric) Frobenius element at a finite place `v` of `F`, for a fixed embedding of the
decomposition group (owner: AG2.7; only its conjugacy class modulo inertia matters). -/
def frobAt {D : UnitarySimilitudeDatum} (v : IgPlace D) : Field.absoluteGaloisGroup D.F :=
  sorry

/-- The inertia subgroup at `v` (for the same embedding of the decomposition group). -/
def inertiaAt {D : UnitarySimilitudeDatum} (v : IgPlace D) :
    Subgroup (Field.absoluteGaloisGroup D.F) := sorry

/-- The mod-`ℓ` reduction of `|Art_F^{-1}|^k`, with `Art_F` sending uniformizers to geometric
Frobenii (a power of the mod-`ℓ` cyclotomic character). -/
def cycloTwist (D : UnitarySimilitudeDatum) (ℓ : ℕ) [Fact ℓ.Prime] (k : ℤ) :
    Field.absoluteGaloisGroup D.F →* (FlBar ℓ)ˣ := sorry

/-- `|Art_F^{-1}|^k (Frob_v) = q_v^{-k}` at places `v ∤ ℓ`. -/
theorem cycloTwist_frobAt (D : UnitarySimilitudeDatum) (ℓ : ℕ) [Fact ℓ.Prime] (k : ℤ)
    (v : IgPlace D) (hv : (ℓ : NumberField.RingOfIntegers D.F) ∉ v.asIdeal) :
    ((cycloTwist D ℓ k (frobAt v) : (FlBar ℓ)ˣ) : FlBar ℓ) = ((v.normQ : FlBar ℓ)) ^ (-k) :=
  sorry

/-! ### Hecke operators at split places -/

/-- The Hecke operator `T_{i,v} ∈ 𝕋^S`: the characteristic function of
`GL_{2n}(𝓞_v) diag(ϖ_v^{(i)}, 1^{(2n-i)}) GL_{2n}(𝓞_v)` in the factor `GL_{2n}(F_v)` of `G(ℚ_q)`
(owner of the spherical Hecke algebra: SmoothRepresentationsOfLocalGroups SR.1). For
`1 ≤ i ≤ 2n` it is IG.0's `UnitarySimilitudeDatum.heckeOperator` at the split place; `T_{0,v} = 1`
(and `0` for `i > 2n`). -/
def heckeT {D : UnitarySimilitudeDatum} {E : ImagQuadSubfield D} {S : Finset ℕ}
    (v : SplitPlace E S) (i : ℕ) : HeckeAlgebra D S :=
  if h : 1 ≤ i ∧ i ≤ 2 * D.n then D.heckeOperator S i h v.v v.q v.q_not_mem v.lies_over
  else if i = 0 then 1 else 0

theorem heckeT_zero {D : UnitarySimilitudeDatum} {E : ImagQuadSubfield D} {S : Finset ℕ}
    (v : SplitPlace E S) : heckeT v 0 = 1 := sorry

/-- `T_{2n,v}` is a unit of `𝕋^S`. -/
def heckeTTopUnit {D : UnitarySimilitudeDatum} {E : ImagQuadSubfield D} {S : Finset ℕ}
    (v : SplitPlace E S) : (HeckeAlgebra D S)ˣ := sorry

theorem heckeTTopUnit_val {D : UnitarySimilitudeDatum} {E : ImagQuadSubfield D} {S : Finset ℕ}
    (v : SplitPlace E S) : (heckeTTopUnit v : HeckeAlgebra D S) = heckeT v (2 * D.n) := sorry

/-- The Hecke polynomial
`X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2} T_{i,v} X^{2n−i} + … + q_v^{n(2n−1)} T_{2n,v}`. -/
def heckePoly {D : UnitarySimilitudeDatum} {E : ImagQuadSubfield D} {S : Finset ℕ}
    (v : SplitPlace E S) : (HeckeAlgebra D S)[X] :=
  ∑ i ∈ Finset.range (2 * D.n + 1),
    C ((-1) ^ i * (v.v.normQ : HeckeAlgebra D S) ^ (i * (i - 1) / 2) * heckeT v i) *
      X ^ (2 * D.n - i)

/-- An ideal `𝔪 ⊂ 𝕋^S` of Galois type: an embedding of `𝕋^S/𝔪` into `𝔽̄_ℓ` and a continuous
semisimple `ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ)`, unramified at every split place `v | q ∉ S`, with
`charpoly ρ̄_𝔪(Frob_v)` the reduction of the Hecke polynomial (owner: AG2.7). -/
structure GaloisTypeData {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D) {S : Finset ℕ}
    (ℓ : ℕ) [Fact ℓ.Prime] (𝔪 : Ideal (HeckeAlgebra D S)) where
  /-- The embedding of the residue field. -/
  emb : HeckeAlgebra D S ⧸ 𝔪 →+* FlBar ℓ
  /-- The residual representation `ρ̄_𝔪`. -/
  rho : ResidualRep D.F (2 * D.n) ℓ
  semisimple : rho.IsSemisimple
  unramified : ∀ v : SplitPlace E S, rho.IsUnramifiedAt (inertiaAt v.v)
  charpoly_eq : ∀ v : SplitPlace E S,
    rho.charpolyAt (frobAt v.v) = (heckePoly v).map (emb.comp (Ideal.Quotient.mk 𝔪))

/-- `𝔪` is of Galois type. -/
def IsGaloisType {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D) {S : Finset ℕ}
    (ℓ : ℕ) [Fact ℓ.Prime] (𝔪 : Ideal (HeckeAlgebra D S)) : Prop :=
  Nonempty (GaloisTypeData E ℓ 𝔪)

/-- The map induced on localizations at a prime `P`. -/
abbrev locMapIG {R : Type} [CommRing R] (P : Ideal R) [P.IsPrime] {M N : Type} [AddCommGroup M]
    [Module R M] [AddCommGroup N] [Module R N] (f : M →ₗ[R] N) :
    LocalizedModule P.primeCompl M →ₗ[R] LocalizedModule P.primeCompl N :=
  IsLocalizedModule.map P.primeCompl (LocalizedModule.mkLinearMap P.primeCompl M)
    (LocalizedModule.mkLinearMap P.primeCompl N) f

/-- The finite-level-structure integer `N₀` of CSnc Remark 5.4.5 (owner: this roadmap, IG.0). -/
def cuspLevelN₀ (D : UnitarySimilitudeDatum) : ℕ := sorry

/-- The standing assumptions of CSnc §5: `p` unramified in `F`, `F ⊇ F₀` imaginary quadratic with
`p` split in `F₀`, `F⁺ ≠ ℚ`, `S ⊇ {p, ℓ} ∪ {primes dividing Δ_F}`, `N ≥ 3` with `N₀ ∣ N` and all
prime factors of `N` in `S ∖ {p}`. The character `ϖ` (whose ramification lies in `S`) and the
isomorphism `ι_ℓ : ℚ̄_ℓ ≅ ℂ` are auxiliary choices not modelled by the carriers. -/
structure CSStandingHyp {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D) (p ℓ : ℕ)
    (S : Finset ℕ) (N : ℕ) : Prop where
  p_prime : p.Prime
  ell_prime : ℓ.Prime
  p_ne_ell : p ≠ ℓ
  p_unramified : (Ideal.span {(p : NumberField.RingOfIntegers D.F)}).IsRadical
  p_split_F₀ : E.SplitsAt p
  Fplus_ne_Q : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F)
  p_mem : p ∈ S
  ell_mem : ℓ ∈ S
  disc_mem : ∀ q : ℕ, q.Prime → q ∣ (NumberField.discr D.F).natAbs → q ∈ S
  three_le_N : 3 ≤ N
  N₀_dvd : cuspLevelN₀ D ∣ N
  N_primes : ∀ q : ℕ, q.Prime → q ∣ N → q ∈ S ∧ q ≠ p


end IG5Carriers

section DualIdeal

variable {D : UnitarySimilitudeDatum} {S : Finset ℕ}

/-- The prime-to-`S` adelic points `G(𝔸^S)` (owner: ArithmeticLocallySymmetricSpaces). -/
def GAS (D : UnitarySimilitudeDatum) (S : Finset ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (S : Finset ℕ) : Group (GAS D S) := sorry

/-- The double coset `[K^S g K^S] ∈ 𝕋^S` (characteristic function; Tau Ceti `HeckeRing`). -/
def heckeDoubleCoset (g : GAS D S) : HeckeAlgebra D S := sorry

/-- (IG.5/dual-hecke-ideal) The involution `ι : 𝕋^S → 𝕋^S`, `[KgK] ↦ [Kg⁻¹K]`, a ring involution of
the commutative Hecke algebra; it is Tau Ceti `HeckeAntiInvolution.ofAmbient` applied to the
inversion anti-automorphism of `G(𝔸^S)` (TauCeti/NumberTheory/HeckeRing/Commutativity.lean). -/
def heckeInvolution (D : UnitarySimilitudeDatum) (S : Finset ℕ) :
    HeckeAlgebra D S →+* HeckeAlgebra D S := sorry

/-- `ι ∘ ι = id`. -/
@[simp] theorem heckeInvolution_involutive (T : HeckeAlgebra D S) :
    heckeInvolution D S (heckeInvolution D S T) = T := sorry

/-- (IG.5/dual-hecke-ideal) The dual ideal `𝔪^∨ := ι(𝔪)`. -/
def dualIdeal (𝔪 : Ideal (HeckeAlgebra D S)) : Ideal (HeckeAlgebra D S) :=
  𝔪.map (heckeInvolution D S)

/-- `𝔪^∨` is maximal when `𝔪` is. -/
instance dualIdeal.isMaximal (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal] :
    (dualIdeal 𝔪).IsMaximal := sorry

/-- `𝔪^∨` has the same residue field as `𝔪` (via `ι`). -/
def dualIdeal.residueEquiv (𝔪 : Ideal (HeckeAlgebra D S)) :
    (HeckeAlgebra D S ⧸ dualIdeal 𝔪) ≃+* (HeckeAlgebra D S ⧸ 𝔪) := sorry

/-- `ι(T_{i,v}) = T_{2n,v}^{-1} T_{2n−i,v}`. -/
@[simp] theorem heckeInvolution_T {E : ImagQuadSubfield D} (v : SplitPlace E S) (i : ℕ)
    (hi : i ≤ 2 * D.n) :
    heckeInvolution D S (heckeT v i) =
      ((heckeTTopUnit v)⁻¹ : (HeckeAlgebra D S)ˣ) * heckeT v (2 * D.n - i) := sorry

/-- `ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ |Art_F^{-1}|^{1−2n}` (with compatible residue embeddings), and the Frobenius
eigenvalues of `ρ_{𝔪^∨}` at `v ∤ ℓ` are `q_v^{2n−1} α_{i,v}^{-1}`. -/
theorem dualIdeal_galois {E : ImagQuadSubfield D} {ℓ : ℕ} [Fact ℓ.Prime]
    (𝔪 : Ideal (HeckeAlgebra D S)) (h : GaloisTypeData E ℓ 𝔪) :
    ∃ h' : GaloisTypeData E ℓ (dualIdeal 𝔪),
      h'.emb = h.emb.comp (dualIdeal.residueEquiv 𝔪).toRingHom ∧
      h'.rho.Iso ((h.rho.dual).twist (cycloTwist D ℓ (1 - 2 * (D.n : ℤ)))) ∧
      ∀ v : SplitPlace E S, (ℓ : NumberField.RingOfIntegers D.F) ∉ v.v.asIdeal →
        (h'.rho.charpolyAt (frobAt v.v)).roots =
          (h.rho.charpolyAt (frobAt v.v)).roots.map
            (fun α => (v.v.normQ : FlBar ℓ) ^ (2 * D.n - 1) * α⁻¹) := sorry

/-- Unramifiedness at `v ∤ ℓ`, the length and the ratio condition `α_i ≠ q α_j` are invariant
under `𝔪 ↦ 𝔪^∨`. -/
theorem dualIdeal_preserves {E : ImagQuadSubfield D} {ℓ : ℕ} [Fact ℓ.Prime]
    {𝔪 : Ideal (HeckeAlgebra D S)} (h : GaloisTypeData E ℓ 𝔪)
    (h' : GaloisTypeData E ℓ (dualIdeal 𝔪))
    (hiso : h'.rho.Iso ((h.rho.dual).twist (cycloTwist D ℓ (1 - 2 * (D.n : ℤ))))) :
    (∀ v : IgPlace D, (ℓ : NumberField.RingOfIntegers D.F) ∉ v.asIdeal →
      (h.rho.IsUnramifiedAt (inertiaAt v) ↔ h'.rho.IsUnramifiedAt (inertiaAt v))) ∧
    h.rho.length = h'.rho.length ∧
    (∀ (v : IgPlace D) (q : ℕ), h.rho.FrobRatioCond (frobAt v) q ↔
      h'.rho.FrobRatioCond (frobAt v) q) := sorry

/-- `ι` is characterised on double cosets by `[KgK] ↦ [Kg⁻¹K]`: any ring endomorphism with this
property is `ι`. This is the statement that `ι` agrees with Tau Ceti
`HeckeAntiInvolution.ofAmbient` for the inversion anti-automorphism. -/
theorem heckeInvolution_compat_tauceti :
    (∀ g : GAS D S, heckeInvolution D S (heckeDoubleCoset g) = heckeDoubleCoset g⁻¹) ∧
    ∀ φ : HeckeAlgebra D S →+* HeckeAlgebra D S,
      (∀ g : GAS D S, φ (heckeDoubleCoset g) = heckeDoubleCoset g⁻¹) → φ = heckeInvolution D S :=
  sorry

-- test: dualIdeal_dual — (𝔪^∨)^∨ = 𝔪
example (𝔪 : Ideal (HeckeAlgebra D S)) : dualIdeal (dualIdeal 𝔪) = 𝔪 := sorry

-- test: dualIdeal_rank_two — for 2n = 2 the dual eigenvalues are {q_v/α, q_v/β}
example {E : ImagQuadSubfield D} {ℓ : ℕ} [Fact ℓ.Prime] (hn : D.n = 1)
    (𝔪 : Ideal (HeckeAlgebra D S)) (h : GaloisTypeData E ℓ 𝔪) (v : SplitPlace E S)
    (hv : (ℓ : NumberField.RingOfIntegers D.F) ∉ v.v.asIdeal) (α β : FlBar ℓ)
    (hroots : (h.rho.charpolyAt (frobAt v.v)).roots = {α, β}) :
    ∃ h' : GaloisTypeData E ℓ (dualIdeal 𝔪),
      (h'.rho.charpolyAt (frobAt v.v)).roots =
        {(v.v.normQ : FlBar ℓ) / α, (v.v.normQ : FlBar ℓ) / β} := sorry

-- test: dualIdeal_ne — eigenvalues {1, 2} at q_v = 7 over 𝔽_11 dualise to {7, 7/2} ≠ {1, 2}
example : (({1, 2} : Multiset (ZMod 11)).map (fun α => (7 : ZMod 11) ^ 1 * α⁻¹)) ≠ {1, 2} :=
  sorry

-- test: heckeInvolution_compat — ι is induced by g ↦ g⁻¹ on double cosets (HeckeAntiInvolution.ofAmbient)
example (g : GAS D S) : heckeInvolution D S (heckeDoubleCoset g) = heckeDoubleCoset g⁻¹ := sorry

end DualIdeal

section IG5Theorems

/-! ### Carriers for the Igusa-side statements of IG.5 -/

/-- The prime-to-`S` Hecke action on `H^i(Ig^b_{Mant,m,K(N)}, Λ)` (owner: IG.1/igusa-cohomology). -/
instance mantovanEtH_hecke {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) (m : ℕ) (S : Finset ℕ) (Λ : Type) [CommRing Λ] (i : ℕ) :
    Module (HeckeAlgebra D S) (EtH (MantovanIgusaVariety N X m) Λ i) := sorry

/-- The prime-to-`S` Hecke action on `H^i_c(Ig^b_{Mant,m,K(N)}, Λ)`. -/
instance mantovanEtHc_hecke {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) (m : ℕ) (S : Finset ℕ) (Λ : Type) [CommRing Λ] (i : ℕ) :
    Module (HeckeAlgebra D S) (EtHc (MantovanIgusaVariety N X m) Λ i) := sorry

/-- Compactly supported Igusa cohomology with `ℤ_ℓ`-coefficients
`colim_m H^i_c(Ig^b_{m,K(N)}, ℤ_ℓ)` (owner: IG.1/igusa-cohomology). -/
def IgusaCohCZl {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) : Type := sorry

instance {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) (ℓ i : ℕ) : AddCommGroup (IgusaCohCZl N X ℓ i) := sorry
instance {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] (N : ℕ)
    (X : PDivGStructure D p (pt k)) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (HeckeAlgebra D S) (IgusaCohCZl N X ℓ i) := sorry

/-- A continuous `ℓ`-adic representation `Gal(K̄/K) → GL_m(ℚ̄_ℓ)` (owner: AG2.7). -/
structure AdicRep (K : Type) [Field K] (m ℓ : ℕ) [Fact ℓ.Prime] where
  /-- The underlying continuous homomorphism. -/
  toHom : ContinuousMonoidHom (Field.absoluteGaloisGroup K)
    (Matrix.GeneralLinearGroup (Fin m) (QlBar ℓ))

namespace AdicRep

variable {K : Type} [Field K] {m ℓ : ℕ} [Fact ℓ.Prime]

/-- Semisimplicity. -/
def IsSemisimple (ρ : AdicRep K m ℓ) : Prop :=
  IsSemisimpleModule (MonoidAlgebra (QlBar ℓ) (Field.absoluteGaloisGroup K))
    (igGLRep ρ.toHom.toMonoidHom).asModule

/-- Unramified with respect to the inertia subgroup `I`. -/
def IsUnramifiedAt (ρ : AdicRep K m ℓ) (I : Subgroup (Field.absoluteGaloisGroup K)) : Prop :=
  I ≤ ρ.toHom.toMonoidHom.ker

/-- Characteristic polynomial of `ρ(g)`. -/
def charpolyAt (ρ : AdicRep K m ℓ) (g : Field.absoluteGaloisGroup K) : (QlBar ℓ)[X] :=
  (ρ.toHom g : Matrix (Fin m) (Fin m) (QlBar ℓ)).charpoly

/-- Isomorphism (conjugacy by `GL_m(ℚ̄_ℓ)`). -/
def Iso (ρ σ : AdicRep K m ℓ) : Prop :=
  ∃ P : Matrix.GeneralLinearGroup (Fin m) (QlBar ℓ), ∀ g, σ.toHom g = P * ρ.toHom g * P⁻¹

/-- The semisimplified reduction `ρ̄` (well defined by compactness and Brauer–Nesbitt; owner AG2.7). -/
def reductionSS (ρ : AdicRep K m ℓ) : ResidualRep K m ℓ := sorry

/-- Direct sum of continuous characters. -/
def ofChars (χ : Fin m → ContinuousMonoidHom (Field.absoluteGaloisGroup K) (QlBar ℓ)ˣ) :
    AdicRep K m ℓ := sorry

end AdicRep

/-- Irreducible smooth `ℚ̄_ℓ`-representations of `J_b(ℚ_p)` up to isomorphism (owner:
SmoothRepresentationsOfLocalGroups SR.1). -/
def JIrrep {D : UnitarySimilitudeDatum} {p : ℕ} (b : KottwitzSet D p) (ℓ : ℕ) : Type := sorry

/-- The multiplicity `n(π, ψ)` of `π ⊗ ψ` in the virtual `J_b(ℚ_p) × 𝕋^S`-representation
`[H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] = Σ_i (−1)^i [colim_m H^i_c(Ig^b_{m,K(N)}, ℚ̄_ℓ)]` (owner: IG.1). -/
def igusaEulerMult {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]
    (N : ℕ)
    (X : PDivGStructure D p (pt k)) (ℓ : ℕ) [Fact ℓ.Prime] (S : Finset ℕ)
    (π : JIrrep (X.newtonClass) ℓ) (ψ : HeckeAlgebra D S →+* QlBar ℓ) : ℤ := sorry

/-- Semisimple `ℚ̄_ℓ`-valued L-parameters of `W_{F_v}` in `GL_{2n}` up to conjugacy, in the sense of
CSnc Remark 5.1.1 (owner: the local Langlands roadmap for `GL_n`). -/
def LocalSSParam (D : UnitarySimilitudeDatum) (ℓ : ℕ) (v : IgPlace D) : Type := sorry

/-- The semisimple parameter of `π_v |·|^{1/2−n}`, via Badulescu's Jacquet–Langlands transfer for the
inner form `J_{b_v}` of a Levi of `GL_{2n}(F_v)` (owner: the local Langlands roadmap). -/
def badulescuParam {D : UnitarySimilitudeDatum} {p : ℕ} {b : KottwitzSet D p} {ℓ : ℕ}
    (π : JIrrep b ℓ) (v : IgPlace D) : LocalSSParam D ℓ v := sorry

/-- The semisimple parameter of `ρ|_{Gal(F̄_v/F_v)}`. -/
def AdicRep.localSSParam {D : UnitarySimilitudeDatum} {ℓ : ℕ} [Fact ℓ.Prime]
    (ρ : AdicRep D.F (2 * D.n) ℓ) (v : IgPlace D) : LocalSSParam D ℓ v := sorry

/-- `ψ : 𝕋^S → ℚ̄_ℓ` takes values in `ℤ̄_ℓ` and reduces to `𝔪`. -/
def HeckeCharLifts {D : UnitarySimilitudeDatum} {S : Finset ℕ} {ℓ : ℕ} [Fact ℓ.Prime]
    (ψ : HeckeAlgebra D S →+* QlBar ℓ) (𝔪 : Ideal (HeckeAlgebra D S)) : Prop :=
  (∀ T, ‖ψ T‖ ≤ 1) ∧ ∀ T ∈ 𝔪, ‖ψ T‖ < 1

/-- (IG.5/igusa-poincare-duality) Hecke-equivariant Poincaré duality on the finite-level Igusa
variety `Ig = Ig^b_{Mant,m,K(N)}`, smooth of dimension `d_b = ⟨2ρ, ν_b⟩` over `k` (IG.1's
`MantovanIgusa.smooth`), stated with `𝔽_ℓ`
coefficients degreewise: `H^i_c(Ig, 𝔽_ℓ) ≅ H^{2d_b−i}(Ig, 𝔽_ℓ)^∨` (the twist `(−d_b)` is trivialised
over `k = k̄`), with `T` on the left corresponding to `ι(T)` on the right; hence
`H^i_c(Ig)_{𝔪^∨} ≠ 0 ↔ H^{2d_b−i}(Ig)_𝔪 ≠ 0`. The derived form
`RΓ_c(Ig, Λ) ≅ RHom_Λ(RΓ(Ig, Λ), Λ)[−2d_b](−d_b)` for `Λ = ℤ/ℓ^n, ℤ_ℓ`, and its compatibility with the
trace transition maps, need a derived-category carrier and are not stated here. -/
theorem igusaPoincareDuality {D : UnitarySimilitudeDatum} {p : ℕ} [Fact p.Prime] {k : Type u}
    [Field k] [IsAlgClosed k] [CharP k p] (ℓ : ℕ) [Fact ℓ.Prime] (hℓp : ℓ ≠ p) (N : ℕ)
    [Fact (3 ≤ N)] [Fact (¬ (p : ℤ) ∣ N * NumberField.discr D.F)]
    (X : PDivGStructure D p (pt k)) [Fact (IsCompletelySlopeDivisible X.pdiv)] (m : ℕ)
    (S : Finset ℕ) (i : ℕ) (hi : i ≤ 2 * X.newtonClass.dimLeaf) :
    (∃ e : EtHc (MantovanIgusaVariety N X m) (ZMod ℓ) i ≃ₗ[ZMod ℓ]
        Module.Dual (ZMod ℓ) (EtH (MantovanIgusaVariety N X m) (ZMod ℓ) (2 * X.newtonClass.dimLeaf - i)),
      ∀ (T : HeckeAlgebra D S) x y, e (T • x) y = e x (heckeInvolution D S T • y)) ∧
    ∀ (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal],
      Nontrivial (localizeAt (dualIdeal 𝔪) (EtHc (MantovanIgusaVariety N X m) (ZMod ℓ) i)) ↔
        Nontrivial (localizeAt 𝔪 (EtH (MantovanIgusaVariety N X m) (ZMod ℓ) (2 * X.newtonClass.dimLeaf - i))) :=
  sorry

/-- (IG.5/galois-representations-for-igusa-constituents) CSnc Theorem 5.1.2: for every constituent
`π ⊗ ψ` of `[H_c(Ig^b_{K(N)}, ℚ̄_ℓ)]` with nonzero multiplicity there is a continuous semisimple
`ρ : Gal(F̄/F) → GL_{2n}(ℚ̄_ℓ)`, unramified almost everywhere and at every split `v | q ∉ S`, with
`charpoly ρ(Frob_v) = ψ(P_v)`, and with local–global compatibility at `v | p` for the semisimple
parameters (through Badulescu's Jacquet–Langlands). -/
theorem galoisRepresentationsForIgusaConstituents {D : UnitarySimilitudeDatum}
    (E : ImagQuadSubfield D) {p ℓ : ℕ} [Fact ℓ.Prime] {S : Finset ℕ} {N : ℕ}
    (hyp : CSStandingHyp E p ℓ S N) {k : Type u} [Field k] [IsAlgClosed k] [CharP k p]
    (X : PDivGStructure D p (pt k)) (π : JIrrep (X.newtonClass) ℓ)
    (ψ : HeckeAlgebra D S →+* QlBar ℓ) (hmult : igusaEulerMult N X ℓ S π ψ ≠ 0) :
    ∃ ρ : AdicRep D.F (2 * D.n) ℓ, ρ.IsSemisimple ∧
      {v : IgPlace D | ¬ ρ.IsUnramifiedAt (inertiaAt v)}.Finite ∧
      (∀ v : SplitPlace E S, ρ.IsUnramifiedAt (inertiaAt v.v) ∧
        ρ.charpolyAt (frobAt v.v) = (heckePoly v).map ψ) ∧
      ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
        badulescuParam π v = ρ.localSSParam v := sorry

/-- (IG.5/concentrated-cohomology-gives-constituent) If `H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪` is nonzero for
exactly one `i`, then `H^*_c(Ig^b, ℤ_ℓ)_{𝔪^∨}` is concentrated in one degree and torsion-free, some
constituent `π ⊗ ψ` with `n(π, ψ) ≠ 0` has `ψ ≡ 𝔪^∨`, `𝔪^∨` is of Galois type, and the semisimplified
reduction of every `ρ` attached to such a constituent is `ρ̄_{𝔪^∨}` (independent of the constituent
and the lattice). -/
theorem concentratedCohomologyGivesConstituent {D : UnitarySimilitudeDatum}
    (E : ImagQuadSubfield D) {p ℓ : ℕ} [Fact ℓ.Prime] {S : Finset ℕ} {N : ℕ}
    (hyp : CSStandingHyp E p ℓ S N) {k : Type u} [Field k] [IsAlgClosed k] [CharP k p]
    (X : PDivGStructure D p (pt k)) (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal]
    (hconc : ∃! i, Nontrivial (localizeAt 𝔪 (IgusaCoh N X ℓ i))) :
    (∃ i₀, ∀ i, i ≠ i₀ → Subsingleton (localizeAt (dualIdeal 𝔪) (IgusaCohCZl N X ℓ i))) ∧
    (∀ i (x : localizeAt (dualIdeal 𝔪) (IgusaCohCZl N X ℓ i)),
      (ℓ : HeckeAlgebra D S) • x = 0 → x = 0) ∧
    (∃ (π : JIrrep (X.newtonClass) ℓ) (ψ : HeckeAlgebra D S →+* QlBar ℓ),
      igusaEulerMult N X ℓ S π ψ ≠ 0 ∧ HeckeCharLifts ψ (dualIdeal 𝔪)) ∧
    ∃ h : GaloisTypeData E ℓ (dualIdeal 𝔪),
      ∀ (π : JIrrep (X.newtonClass) ℓ) (ψ : HeckeAlgebra D S →+* QlBar ℓ)
        (ρ : AdicRep D.F (2 * D.n) ℓ), igusaEulerMult N X ℓ S π ψ ≠ 0 →
        HeckeCharLifts ψ (dualIdeal 𝔪) →
        (∀ v : SplitPlace E S, ρ.charpolyAt (frobAt v.v) = (heckePoly v).map ψ) →
        ρ.reductionSS.Iso h.rho := sorry

/-- The inertia subgroup of a finite extension `L/ℚ_p` (owner: local class field theory). -/
def localInertia (p : ℕ) [Fact p.Prime] (L : Type) [Field L] [Algebra ℚ_[p] L] :
    Subgroup (Field.absoluteGaloisGroup L) := sorry

/-- A geometric Frobenius lift in `Gal(L̄/L)`. -/
def localFrob (p : ℕ) [Fact p.Prime] (L : Type) [Field L] [Algebra ℚ_[p] L] :
    Field.absoluteGaloisGroup L := sorry

/-- The residue cardinality `q` of a finite extension `L/ℚ_p`. -/
def localResidueCard (p : ℕ) [Fact p.Prime] (L : Type) [Field L] [Algebra ℚ_[p] L] : ℕ := sorry

/-- The `ℓ`-adic cyclotomic character of `Gal(L̄/L)`. -/
def adicCyclotomic (p : ℕ) [Fact p.Prime] (L : Type) [Field L] [Algebra ℚ_[p] L] (ℓ : ℕ)
    [Fact ℓ.Prime] : ContinuousMonoidHom (Field.absoluteGaloisGroup L) (QlBar ℓ)ˣ := sorry

/-- (IG.5/generic-lift-splits) CS17 Lemma 6.2.2: let `ρ : Gal(L̄/L) → GL_m(ℚ̄_ℓ)` have unramified
semisimplified reduction with Frobenius eigenvalues `α_i ≠ q α_j` (`i ≠ j`). (1) If moreover
`α_i/α_j ∉ {1, q}`, then `ρ` is a sum of characters with no ratio cyclotomic (so the associated
representation of `GL_m(L)` is a generic principal series). (2) If `q ≢ 1 mod ℓ`, `ρ` is unramified;
if `q ≡ 1 mod ℓ`, `ρ` is a sum of characters with no ratio cyclotomic. -/
theorem genericLiftSplits (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hℓp : ℓ ≠ p) (L : Type)
    [Field L] [Algebra ℚ_[p] L] [FiniteDimensional ℚ_[p] L] (m : ℕ) (ρ : AdicRep L m ℓ)
    (hunr : ρ.reductionSS.IsUnramifiedAt (localInertia p L))
    (hratio : ρ.reductionSS.FrobRatioCond (localFrob p L) (localResidueCard p L)) :
    (ρ.reductionSS.DecomposedGenericAt (localFrob p L) (localResidueCard p L) →
      ∃ χ : Fin m → ContinuousMonoidHom (Field.absoluteGaloisGroup L) (QlBar ℓ)ˣ,
        ρ.Iso (AdicRep.ofChars χ) ∧
        ∀ a b, a ≠ b → ¬ ∀ g, χ a g = adicCyclotomic p L ℓ g * χ b g) ∧
    (((localResidueCard p L : ℕ) : ZMod ℓ) ≠ 1 → ρ.IsUnramifiedAt (localInertia p L)) ∧
    (((localResidueCard p L : ℕ) : ZMod ℓ) = 1 →
      ∃ χ : Fin m → ContinuousMonoidHom (Field.absoluteGaloisGroup L) (QlBar ℓ)ˣ,
        ρ.Iso (AdicRep.ofChars χ) ∧
        ∀ a b, a ≠ b → ¬ ∀ g, χ a g = adicCyclotomic p L ℓ g * χ b g) := sorry

/-- (IG.5/genericity-forces-ordinary) CSnc Corollary 5.1.3: if `H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0` in
exactly one degree, then `𝔪` is of Galois type with `ρ̄_𝔪 ≅ (ρ̄_{𝔪^∨})^∨ ⊗ |Art_F^{-1}|^{1−2n}`
(the contragredient is missing in the source, sourceIssues E3); if moreover `p` splits completely
in `F` and `ρ̄_𝔪` is unramified at every `v | p` with `α_{i,v} ≠ p α_{j,v}` (`i ≠ j`), then `b` is
ordinary. -/
theorem genericityForcesOrdinary {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D)
    {p ℓ : ℕ} [Fact ℓ.Prime] {S : Finset ℕ} {N : ℕ} (hyp : CSStandingHyp E p ℓ S N)
    {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGStructure D p (pt k))
    (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal]
    (hconc : ∃! i, Nontrivial (localizeAt 𝔪 (IgusaCoh N X ℓ i))) :
    ∃ (h : GaloisTypeData E ℓ 𝔪) (h' : GaloisTypeData E ℓ (dualIdeal 𝔪)),
      h.rho.Iso ((h'.rho.dual).twist (cycloTwist D ℓ (1 - 2 * (D.n : ℤ)))) ∧
      (SplitsCompletelyIG D.F p →
        (∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
          h.rho.IsUnramifiedAt (inertiaAt v) ∧ h.rho.FrobRatioCond (frobAt v) p) →
        X.newtonClass = KottwitzSet.ordinary D p) := sorry

end IG5Theorems

end

end TauCeti.Igusa

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

namespace TauCeti.Igusa

open CategoryTheory AlgebraicGeometry IsDedekindDomain Polynomial

noncomputable section

/-! ## IG.6 — Equivariant Igusa boundary formula -/

section IG6Carriers

/-- `D^+_sm(G, 𝔽_ℓ)`: the derived category of smooth `𝔽_ℓ`-representations of a topological group
`G` (owner: SmoothRepresentationsOfLocalGroups SR.1; for `G = Unit` this is `D(𝔽_ℓ)`). -/
def SmoothDerived (G : Type) [Group G] [TopologicalSpace G] (ℓ : ℕ) : Type 1 := sorry

instance (G : Type) [Group G] [TopologicalSpace G] (ℓ : ℕ) :
    Category.{0} (SmoothDerived G ℓ) := sorry

/-- Unnormalized smooth induction `Ind_H^G` from a (closed) subgroup. -/
def SmoothDerived.ind {G : Type} [Group G] [TopologicalSpace G] {ℓ : ℕ} (H : Subgroup G) :
    SmoothDerived H ℓ ⥤ SmoothDerived G ℓ := sorry

/-- Restriction (inflation) along a continuous homomorphism `f : H → G`. -/
def SmoothDerived.inf {G H : Type} [Group G] [TopologicalSpace G] [Group H]
    [TopologicalSpace H] {ℓ : ℕ} (f : H →* G) : SmoothDerived G ℓ ⥤ SmoothDerived H ℓ := sorry

/-- External tensor product `A ⊠ B` over `𝔽_ℓ`. -/
def SmoothDerived.extTensor {G₁ G₂ : Type} [Group G₁] [TopologicalSpace G₁] [Group G₂]
    [TopologicalSpace G₂] {ℓ : ℕ} (A : SmoothDerived G₁ ℓ) (B : SmoothDerived G₂ ℓ) :
    SmoothDerived (G₁ × G₂) ℓ := sorry

/-- Tensor product over `𝔽_ℓ` with the diagonal action. -/
def SmoothDerived.tensor {G : Type} [Group G] [TopologicalSpace G] {ℓ : ℕ}
    (A B : SmoothDerived G ℓ) : SmoothDerived G ℓ := sorry

/-- The underlying complex in `D(𝔽_ℓ)`. -/
abbrev SmoothDerived.forget {G : Type} [Group G] [TopologicalSpace G] {ℓ : ℕ} :
    SmoothDerived G ℓ ⥤ SmoothDerived Unit ℓ :=
  SmoothDerived.inf (1 : Unit →* G)

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- The perfect partial minimal compactification `Ig^{b,*}_∞ = lim_N Ig^{b,*}_{K(N)}` at infinite
level (owner: IG.2/perfect-minimal-igusa, limit over `N`). -/
def MinIgusaInf (X : PDivGStructure D p (pt k)) : Scheme.{u} := sorry

/-- The open immersion `j : Ig^b_∞ ↪ Ig^{b,*}_∞` of IG.1's Igusa tower `IgusaTower X`. -/
def MinIgusaInf.j (X : PDivGStructure D p (pt k)) : IgusaTower X ⟶ MinIgusaInf X := sorry

instance (X : PDivGStructure D p (pt k)) : IsOpenImmersion (MinIgusaInf.j X) := sorry

/-- The action of `J_b(ℚ_p) × G(𝔸_f^p)` on `Ig^{b,*}_∞` (owner: IG.2). -/
def minIgusaAct (X : PDivGStructure D p (pt k)) :
    JGroup (X.newtonClass) × GAfp D p →* Aut (MinIgusaInf X) := sorry

/-- (IG.6/boundary-strata-by-parabolics) The boundary stratum `Ig^{b,*}_{∞,[P_r]} ⊂ ∂Ig^{b,*}_∞`
for `r = 1, …, n`: the preimage of the strata `S_Z ⊂ S^*` whose cusp label `Z = (Z_N, X)` has
`rk_{𝓞_F} X = r`. -/
def boundaryStratum (X : PDivGStructure D p (pt k)) (r : ℕ) : Scheme.{u} := sorry

/-- The locally closed immersion of a boundary stratum. -/
def boundaryStratum.ι (X : PDivGStructure D p (pt k)) (r : ℕ) :
    boundaryStratum X r ⟶ MinIgusaInf X := sorry

instance (X : PDivGStructure D p (pt k)) (r : ℕ) : IsImmersion (boundaryStratum.ι X r) := sorry

/-- `∂Ig^{b,*}_∞ = ⊔_{r=1}^n Ig^{b,*}_{∞,[P_r]}`, the strata are pairwise disjoint, and the closure of
the `r`-th stratum lies in the union of the strata of rank `≥ r`. -/
theorem boundaryStratum_union (X : PDivGStructure D p (pt k)) :
    (⋃ r ∈ Finset.Icc 1 D.n, Set.range (boundaryStratum.ι X r).base) =
      (Set.range (MinIgusaInf.j X).base)ᶜ ∧
    (∀ r ∈ Finset.Icc 1 D.n, ∀ r' ∈ Finset.Icc 1 D.n, r ≠ r' →
      Disjoint (Set.range (boundaryStratum.ι X r).base)
        (Set.range (boundaryStratum.ι X r').base)) ∧
    ∀ r ∈ Finset.Icc 1 D.n, closure (Set.range (boundaryStratum.ι X r).base) ⊆
      ⋃ r' ∈ Finset.Icc r D.n, Set.range (boundaryStratum.ι X r').base := sorry

/-- The strata are stable under `J_b(ℚ_p) × G(𝔸_f^p)`: the action restricts to each stratum,
compatibly with the immersion. -/
theorem boundaryStratum_hecke (X : PDivGStructure D p (pt k)) (r : ℕ) :
    ∃ act : JGroup (X.newtonClass) × GAfp D p →* Aut (boundaryStratum X r),
      ∀ g, (act g).hom ≫ boundaryStratum.ι X r = boundaryStratum.ι X r ≫ (minIgusaAct X g).hom :=
  sorry

/-- The restricted action on a stratum (exists by `boundaryStratum_hecke`). -/
def boundaryStratumAct (X : PDivGStructure D p (pt k)) (r : ℕ) :
    JGroup (X.newtonClass) × GAfp D p →* Aut (boundaryStratum X r) := sorry

/-- An `𝓞_F`-stable symplectic filtration `Z_b : 0 ⊂ Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b` with
`Z_{b,−2} ≅ Hom(𝓞_F^r, μ_{p^∞})` (owner: this roadmap, IG.6; carrier for the filtration data). -/
def SymplecticFiltration (X : PDivGStructure D p (pt k)) (r : ℕ) : Type := sorry

/-- The middle graded piece `X_P = Z_{b,−1}/Z_{b,−2}` as a p-divisible group (defined for every `r`;
it is `0` for `r = n`). -/
def SymplecticFiltration.graded {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) : PDivGroup p (pt k) := sorry

/-- (IG.6/boundary-strata-by-parabolics) `P_b(ℚ_p) ⊂ J_b(ℚ_p)`, the self-quasi-isogenies preserving
`Z_b`. -/
def levelSubgroup {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    Subgroup (JGroup (X.newtonClass)) := sorry

/-- The rational parabolic `P_r(𝔸_f^p) ⊂ G(𝔸_f^p)`, `P_r = Stab(0 ⊂ F^r ⊂ F^{2n−r} ⊂ F^{2n})`. -/
def parabolicAfp (D : UnitarySimilitudeDatum) (p r : ℕ) : Subgroup (GAfp D p) := sorry

/-- The group `P_b(ℚ_p) × P(𝔸_f^p)`. -/
abbrev PbP {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    Subgroup (JGroup (X.newtonClass) × GAfp D p) :=
  (levelSubgroup Z).prod (parabolicAfp D p r)

/-- The datum `G_{2(n−r)}`: the analogue of the unitary similitude datum with `n` replaced by
`n − r` (`r < n`; for `r = n` the group `G_0` is the similitude torus, which the prelude's
`UnitarySimilitudeDatum` with `0 < n` cannot express). The standard lattice is a data body. -/
def UnitarySimilitudeDatum.lowerRank (D : UnitarySimilitudeDatum) (r : ℕ) (hr : r < D.n) :
    UnitarySimilitudeDatum where
  F := D.F
  n := D.n - r
  n_pos := by omega
  L := sorry
  L_finite := sorry
  L_full := sorry
  L_selfDual := sorry

/-- (IG.6/boundary-strata-by-parabolics) The lower-rank Igusa datum: `X_P = Z_{b,−1}/Z_{b,−2}` with
its `G_{2(n−r)}`-structure (`r < n`); its class `b_P` is `(lowerRankDatum Z hr).newtonClass`. -/
def lowerRankDatum {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (hr : r < D.n) : PDivGStructure (D.lowerRank r hr) p (pt k) := sorry

theorem lowerRankDatum_graded {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) (hr : r < D.n) :
    Nonempty (PDivGStructure.toPDivGroup.obj (lowerRankDatum Z hr) ≅ Z.graded) := sorry

/-- `J_{b_P}(ℚ_p)` for the lower-rank datum, for every `1 ≤ r ≤ n` (for `r < n` it is
`JGroup ((lowerRankDatum Z hr).newtonClass)`; for `r = n` it is `ℚ_p^×`). -/
def lowerJ {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) : Type :=
  sorry

instance {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    Group (lowerJ Z) := sorry
instance {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    TopologicalSpace (lowerJ Z) := sorry

/-- `J_{b_P}(ℚ_p)` agrees with the `J`-group of the lower-rank datum when `r < n`. -/
def lowerJ.equiv {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (hr : r < D.n) : lowerJ Z ≃* JGroup ((lowerRankDatum Z hr).newtonClass) := sorry

/-- `G_{2(n−r)}(𝔸_f^p)` for every `1 ≤ r ≤ n`. -/
def lowerGAfp (D : UnitarySimilitudeDatum) (p r : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p r : ℕ) : Group (lowerGAfp D p r) := sorry
instance (D : UnitarySimilitudeDatum) (p r : ℕ) : TopologicalSpace (lowerGAfp D p r) := sorry

/-- `GL_r(𝔸_{F,f})` (owner: ArithmeticLocallySymmetricSpaces). -/
def GLrAdelic (D : UnitarySimilitudeDatum) (r : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (r : ℕ) : Group (GLrAdelic D r) := sorry
instance (D : UnitarySimilitudeDatum) (r : ℕ) : TopologicalSpace (GLrAdelic D r) := sorry

/-- The Levi `M = Res_{F/ℚ} GL_r × G_{2(n−r)}` through its two projections from
`P_b(ℚ_p) × P(𝔸_f^p)`. -/
structure LeviProjections {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) where
  /-- To `J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p)`. -/
  toLower : PbP Z →* lowerJ Z × lowerGAfp D p r
  /-- To `GL_r(𝔸_{F,f}) = GL_r(F ⊗ ℚ_p) × GL_r(𝔸^p_{F,f})` (at `p` via the action on
  `Z_{b,−2} ≅ Hom(𝓞_F^r, μ_{p^∞})`). -/
  toGL : PbP Z →* GLrAdelic D r

/-- (IG.6/boundary-strata-by-parabolics) The Levi projections of `P_b(ℚ_p) × P(𝔸_f^p)`. -/
def levi {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    LeviProjections Z := sorry

/-- `RΓ_c(Ig^{b,*}_{∞,[P_r]}, i^*_{[P]} Rj_* 𝔽_ℓ)` as a complex of smooth
`J_b(ℚ_p) × G(𝔸_f^p)`-representations (owner: IG.6, built on DiamondEtaleCohomology). -/
def boundaryCohStratum (X : PDivGStructure D p (pt k)) (r ℓ : ℕ) :
    SmoothDerived (JGroup (X.newtonClass) × GAfp D p) ℓ := sorry

/-- `RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_* 𝔽_ℓ)` for the fibre `Ig^{b,*}_{∞,P}` over the identity. -/
def boundaryCohFibre {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (ℓ : ℕ) : SmoothDerived (PbP Z) ℓ := sorry

/-- `RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ)`. -/
def boundaryCohFibreConst {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) (ℓ : ℕ) : SmoothDerived (PbP Z) ℓ := sorry

/-- `RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_* 𝔽_ℓ)`. -/
def boundaryCohFibreRj {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) (ℓ : ℕ) : SmoothDerived (PbP Z) ℓ := sorry

/-- `RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ≅ colim_K RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})/K), 𝔽_ℓ)`
(owner: ArithmeticLocallySymmetricSpaces, Borel–Serre). -/
def lsCohGLr (D : UnitarySimilitudeDatum) (r ℓ : ℕ) : SmoothDerived (GLrAdelic D r) ℓ := sorry

/-- `RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ)` for the lower-rank datum (for `r = n`: functions with compact support
on the profinite set `Ig^{b_P}_∞`). -/
def lowerIgusaCohC {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (ℓ : ℕ) : SmoothDerived (lowerJ Z × lowerGAfp D p r) ℓ := sorry

/-- The source `RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f}))) ⊗ RΓ_c(Ig^{b_P}_∞)`, with `P_b(ℚ_p) × P(𝔸_f^p)`
acting through the Levi projections. -/
def boundarySource {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (ℓ : ℕ) : SmoothDerived (PbP Z) ℓ :=
  (SmoothDerived.inf ((levi Z).toGL.prod (levi Z).toLower)).obj
    (SmoothDerived.extTensor (lsCohGLr D r ℓ) (lowerIgusaCohC Z ℓ))

end IG6Carriers

section IG6Strata

variable {D : UnitarySimilitudeDatum} {p : ℕ} {k : Type u} [Field k] [IsAlgClosed k]

/-- `Z_{b,−2} ≅ Hom(𝓞_F^r, μ_{p^∞})`. -/
def SymplecticFiltration.minusTwo {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) : PDivGroup p (pt k) := sorry

/-- `Z_{b,−1} = Z_{b,−2}^⊥`. -/
def SymplecticFiltration.minusOne {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) : PDivGroup p (pt k) := sorry

/-- The inclusion `Z_{b,−2} ⊂ Z_{b,−1}`. -/
def SymplecticFiltration.incl {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) : Z.minusTwo ⟶ Z.minusOne := sorry

instance {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    Mono Z.incl := sorry

-- test: boundaryStratum_n_one — for n = 1 the only boundary class is r = 1 and X_P = 0
example (X : PDivGStructure D p (pt k)) (hn : D.n = 1) :
    Finset.Icc 1 D.n = {1} ∧ ∀ Z : SymplecticFiltration X 1, Z.graded.height = 0 := sorry

-- test: boundaryStratum_basic — if X_b^{ét} = 0 every boundary stratum is empty
example (X : PDivGStructure D p (pt k)) (h : ∀ τ : NumberField.RingOfIntegers D.F →+* k, X.etaleRank τ = 0) (r : ℕ)
    (hr : r ∈ Finset.Icc 1 D.n) : IsEmpty (boundaryStratum X r) := sorry

-- test: lowerRankDatum_not_quotient — X_P is Z_{b,−1}/Z_{b,−2} (Z_{b,−2} ⊂ Z_{b,−1}), so heights add up
example (X : PDivGStructure D p (pt k)) (r : ℕ) (Z : SymplecticFiltration X r) :
    Z.minusTwo.height + Z.graded.height = Z.minusOne.height := sorry

/-- The fibre `Ig^{b,*}_{∞,P}` of the cusp-label map over the identity coset. -/
def boundaryFibre {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    Scheme.{u} := sorry

/-- Its immersion into the stratum. -/
def boundaryFibre.ι {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    boundaryFibre Z ⟶ boundaryStratum X r := sorry

/-- (IG.6/boundary-parabolic-induction) CSnc §6.2.1: the cusp labels give a
`J_b(ℚ_p) × G(𝔸_f^p)`-equivariant map `Ig^{b,*}_{∞,[P]} → J_b(ℚ_p)/P_b(ℚ_p) × G(𝔸_f^p)/P(𝔸_f^p)` whose
fibre over the identity is `Ig^{b,*}_{∞,P}`, and
`RΓ_c(Ig^{b,*}_{∞,[P]}, i^*Rj_*𝔽_ℓ) ≅ Ind^{J_b × G(𝔸_f^p)}_{P_b × P(𝔸_f^p)} RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ)`
(unnormalized smooth induction). -/
theorem boundaryParabolicInduction [CharP k p]
    (hp : (Ideal.span {(p : NumberField.RingOfIntegers D.F)}).IsRadical)
    (X : PDivGStructure D p (pt k)) (r : ℕ) (hr : r ∈ Finset.Icc 1 D.n)
    (Z : SymplecticFiltration X r) (ℓ : ℕ) (hℓp : ℓ ≠ p) :
    ∃ c : boundaryStratum X r →
        (JGroup (X.newtonClass) ⧸ levelSubgroup Z) × (GAfp D p ⧸ parabolicAfp D p r),
      (∀ g x, c ((boundaryStratumAct X r g).hom.base x) = (g.1 • (c x).1, g.2 • (c x).2)) ∧
      Set.range (boundaryFibre.ι Z).base =
        c ⁻¹' {(QuotientGroup.mk (s := levelSubgroup Z) 1,
          QuotientGroup.mk (s := parabolicAfp D p r) 1)} ∧
      Nonempty (boundaryCohStratum X r ℓ ≅ (SmoothDerived.ind (PbP Z)).obj (boundaryCohFibre Z ℓ)) :=
  sorry

/-! ### The comparison map (IG.6/boundary-comparison-map) -/

/-- (IG.6/boundary-comparison-map) The `P_b(ℚ_p) × P(𝔸_f^p)`-equivariant map
`RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ)`,
the cup product of `igusaFactor` and `lsFactor`. -/
def boundaryComparison {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (ℓ : ℕ) : boundarySource Z ℓ ⟶ boundaryCohFibre Z ℓ := sorry

/-- The pullback `RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ)` along the profinite map
`Ig^{b,*}_{∞,P} → Ig^{b_P}_∞` (limit of IG.2/minimal-igusa-boundary-strata). -/
def igusaFactor {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r)
    (ℓ : ℕ) :
    (SmoothDerived.inf (levi Z).toLower).obj (lowerIgusaCohC Z ℓ) ⟶ boundaryCohFibreConst Z ℓ :=
  sorry

/-- The map `RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) → RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ)` constructed
from the continuous map `lsMap` on the punctured perfectoid neighbourhood, Huber's Cor. 3.5.14 at
finite level and Borel–Serre. -/
def lsFactor {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) (ℓ : ℕ) :
    (SmoothDerived.inf (levi Z).toGL).obj (lsCohGLr D r ℓ) ⟶ boundaryCohFibreRj Z ℓ := sorry

/-- The underlying space `|Ig^b_{∞,P}|` of the punctured perfectoid formal neighbourhood (owner:
PerfectoidShimuraVarieties; carrier). -/
def punctNbhd {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) : Type :=
  sorry

instance {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    TopologicalSpace (punctNbhd Z) := sorry
instance {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    MulAction (PbP Z) (punctNbhd Z) := sorry

/-- The locally symmetric space `GL_r(F)\(X_r × GL_r(𝔸_{F,f}))`,
`X_r = (∏_{τ : F⁺ ↪ ℝ} M_r^{herm,>0}(ℂ))/ℝ_{>0}` (owner: ArithmeticLocallySymmetricSpaces). -/
def LSSpaceGLr (D : UnitarySimilitudeDatum) (r : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (r : ℕ) : TopologicalSpace (LSSpaceGLr D r) := sorry
instance (D : UnitarySimilitudeDatum) (r : ℕ) : MulAction (GLrAdelic D r) (LSSpaceGLr D r) :=
  sorry

/-- The continuous map `f : |Ig^b_{∞,P}| → GL_r(F)\(X_r × GL_r(𝔸_{F,f}))` (logarithms of the norms
of the sections of the Poincaré bundle of the Raynaud extension, up to `ℝ_{>0}`, and the level
structures). -/
def lsMap {X : PDivGStructure D p (pt k)} {r : ℕ} (Z : SymplecticFiltration X r) :
    C(punctNbhd Z, LSSpaceGLr D r) := sorry

/-- `f` is equivariant through the projection `P_b(ℚ_p) × P(𝔸_f^p) → GL_r(𝔸_{F,f})` (at `p` through
the action on `Z_{b,−2}`, away from `p` through `P(𝔸_f^p) → GL_r(𝔸^p_{F,f})`). -/
theorem lsFactor_equivariant {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) (h : PbP Z) (x : punctNbhd Z) :
    lsMap Z (h • x) = (levi Z).toGL h • lsMap Z x := sorry

/-- The unipotent radical of `P_b(ℚ_p) × P(𝔸_f^p)`. -/
def unipotentRadicalPbP {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) : Subgroup (PbP Z) := sorry

/-- The unipotent radicals of `P_b(ℚ_p)` and `P(𝔸_f^p)` act trivially on the source: they lie in the
kernel of the Levi projection through which the source is inflated. -/
theorem boundaryComparison_levi {X : PDivGStructure D p (pt k)} {r : ℕ}
    (Z : SymplecticFiltration X r) :
    unipotentRadicalPbP Z ≤ ((levi Z).toGL.prod (levi Z).toLower).ker := sorry

/-- Locally constant `𝔽_ℓ`-valued functions on `GL_1(F)\GL_1(𝔸_{F,f})`, in degree `0`. -/
def smoothFunctionsGL1 (D : UnitarySimilitudeDatum) (ℓ : ℕ) : SmoothDerived (GLrAdelic D 1) ℓ :=
  sorry

-- test: boundaryComparison_n_one — for n = 1 (and F⁺ = ℚ, Igusa curves) the map identifies the cusp cohomology with functions on GL_1(F)\GL_1(𝔸_{F,f}) ⊗ RΓ_c(Ig^{b_P})
example (X : PDivGStructure D p (pt k)) (hn : D.n = 1)
    (hF : Module.finrank ℚ (NumberField.maximalRealSubfield D.F) = 1)
    (Z : SymplecticFiltration X 1) (ℓ : ℕ) (hℓp : ℓ ≠ p) :
    Nonempty (lsCohGLr D 1 ℓ ≅ smoothFunctionsGL1 D ℓ) ∧ IsIso (boundaryComparison Z ℓ) := sorry

-- test: boundaryComparison_empty — if X_b^{ét} = 0 there is no filtration and the boundary complex vanishes
example (X : PDivGStructure D p (pt k)) (h : ∀ τ : NumberField.RingOfIntegers D.F →+* k, X.etaleRank τ = 0) (r : ℕ)
    (hr : r ∈ Finset.Icc 1 D.n) (ℓ : ℕ) :
    IsEmpty (SymplecticFiltration X r) ∧ Limits.IsZero (boundaryCohStratum X r ℓ) := sorry

-- test: lsFactor_not_pullback_scheme — for [F⁺:ℚ] > 1 the target of f is a positive-dimensional real manifold, not totally disconnected
example (r : ℕ) (hr : 1 ≤ r)
    (hF : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F)) :
    ¬ TotallyDisconnectedSpace (LSSpaceGLr D r) := sorry

/-! ### Local computation and Pink's formula -/

/-- The filtration `Z_b` of an Igusa cusp label `Z̃ = (Z_b, Z^p, 𝒳)` (IG.2's `IgusaCuspLabel`), of
rank `r = rk 𝒳`. The labels above `P_r` are those of rank `r`; their lattices `𝒳` run over the
finite projective `𝓞_F`-modules with `𝒳 ⊗ ℤ̂^p ≅ 𝓞_F^r ⊗ ℤ̂^p`, `𝒳 ⊗ ℤ_p ≅ 𝓞_F^r ⊗ ℤ_p`, giving
`⊔_{𝒳/≅} GL_{𝓞_F}(𝒳)\GL_{𝓞_F}(𝒳 ⊗ ℤ̂) ≅ GL_r(F)\GL_r(𝔸_{F,f})`, compatibly with `f`. -/
def IgusaCuspLabel.filtrationIG6 {X : PDivGStructure D p (pt k)} (c : IgusaCuspLabel X) :
    SymplecticFiltration X c.rank := sorry

/-- `RΓ_c(Ig^{b,*}_{∞,Z̃}, i^*_{Z̃} Rj_*𝔽_ℓ)` for the closed subset of a fixed Igusa cusp label. -/
def cuspLabelCoh {X : PDivGStructure D p (pt k)} (c : IgusaCuspLabel X) (ℓ : ℕ) :
    SmoothDerived Unit ℓ := sorry

/-- `colim_Γ RΓ(Γ, 𝔽_ℓ)` over the congruence subgroups `Γ` of `GL_{𝓞_F}(𝒳)` (IG.2's
`IgusaCuspLabel.stabilizer c m N`). -/
def congruenceCohColim {X : PDivGStructure D p (pt k)} (c : IgusaCuspLabel X) (ℓ : ℕ) :
    SmoothDerived Unit ℓ := sorry

/-- The restriction of the comparison map to the label `c`. -/
def localBoundaryMap {X : PDivGStructure D p (pt k)} (c : IgusaCuspLabel X) (ℓ : ℕ) :
    SmoothDerived.tensor (SmoothDerived.forget.obj (lowerIgusaCohC c.filtrationIG6 ℓ))
      (congruenceCohColim c ℓ) ⟶ cuspLabelCoh c ℓ := sorry

/-- (IG.6/local-boundary-computation) CSnc Proposition 6.3.1: for a fixed Igusa cusp label `Z̃`,
`RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) ⊗ colim_Γ RΓ(Γ, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,Z̃}, i^*_{Z̃} Rj_*𝔽_ℓ)` is an
isomorphism. (Remark 6.3.2: the same method proves Pink's original formula Hecke-equivariantly.) -/
theorem localBoundaryComputation [CharP k p]
    (hp : (Ideal.span {(p : NumberField.RingOfIntegers D.F)}).IsRadical)
    {X : PDivGStructure D p (pt k)} (c : IgusaCuspLabel X) (hc : 1 ≤ c.rank) (ℓ : ℕ)
    (hℓp : ℓ ≠ p) :
    IsIso (localBoundaryMap c ℓ) := sorry

/-- (IG.6/igusa-pink-formula) CSnc Theorem 6.1.1: the comparison map is an isomorphism, and
`RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)}
(RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ))` as complexes of smooth
representations (unnormalized induction, Levi action on the tensor product, no twist or shift). -/
theorem igusaPinkFormula [CharP k p]
    (hp : (Ideal.span {(p : NumberField.RingOfIntegers D.F)}).IsRadical)
    (X : PDivGStructure D p (pt k)) (r : ℕ) (hr : r ∈ Finset.Icc 1 D.n)
    (Z : SymplecticFiltration X r) (ℓ : ℕ) (hℓp : ℓ ≠ p) :
    IsIso (boundaryComparison Z ℓ) ∧
      Nonempty (boundaryCohStratum X r ℓ ≅ (SmoothDerived.ind (PbP Z)).obj (boundarySource Z ℓ)) :=
  sorry

end IG6Strata

section IG6Hecke

/-- `G(𝔸^S)` carries its locally profinite topology. -/
instance (D : UnitarySimilitudeDatum) (S : Finset ℕ) : TopologicalSpace (GAS D S) := sorry

/-- Standard rational parabolics `P = MN` of `G` (owner: ArithmeticLocallySymmetricSpaces ALS.4). -/
def StdParabolicIG (D : UnitarySimilitudeDatum) : Type := sorry

/-- `P(𝔸^S) ⊂ G(𝔸^S)`. -/
def StdParabolicIG.adelic {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    Subgroup (GAS D S) := sorry

/-- The Levi quotient `M(𝔸^S)`. -/
def StdParabolicIG.leviAdelic {D : UnitarySimilitudeDatum} (P : StdParabolicIG D)
    (S : Finset ℕ) : Type := sorry

instance {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    Group (P.leviAdelic S) := sorry
instance {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    TopologicalSpace (P.leviAdelic S) := sorry

/-- The projection `P(𝔸^S) → M(𝔸^S)`. -/
def StdParabolicIG.leviProj {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    P.adelic S →* P.leviAdelic S := sorry

/-- `𝕋^S_P = H(P(𝔸^S), K^S_P)`, `K^S_P = K^S ∩ P(𝔸^S)`. -/
def StdParabolicIG.hecke {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    Type := sorry

instance {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    Ring (P.hecke S) := sorry

/-- `𝕋^S_M = H(M(𝔸^S), K^S_M)`. -/
def StdParabolicIG.heckeLevi {D : UnitarySimilitudeDatum} (P : StdParabolicIG D)
    (S : Finset ℕ) : Type := sorry

instance {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    Ring (P.heckeLevi S) := sorry

/-- `r_P : 𝕋^S → 𝕋^S_P`, restriction of functions. -/
def StdParabolicIG.rP {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    HeckeAlgebra D S →+* P.hecke S := sorry

/-- `r_M : 𝕋^S_P → 𝕋^S_M`, integration along unipotent fibres (`r_M ∘ r_P` is the unnormalized
Satake transform, ALS.4). -/
def StdParabolicIG.rM {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) :
    P.hecke S →+* P.heckeLevi S := sorry

/-- `D^+(R)`: the derived category of `R`-modules (bounded below). -/
def HeckeDerived (R : Type) [Ring R] : Type 1 := sorry

instance (R : Type) [Ring R] : Category.{0} (HeckeDerived R) := sorry

/-- Restriction of scalars `f^*` along `f : R → R'`. -/
def HeckeDerived.restrictScalars {R R' : Type} [Ring R] [Ring R'] (f : R →+* R') :
    HeckeDerived R' ⥤ HeckeDerived R := sorry

/-- `RΓ_cont(K^S, −) : D^+_sm(G(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S)`. -/
def rGammaContG (D : UnitarySimilitudeDatum) (S : Finset ℕ) (ℓ : ℕ) :
    SmoothDerived (GAS D S) ℓ ⥤ HeckeDerived (HeckeAlgebra D S) := sorry

/-- `RΓ_cont(K^S_P, −) : D^+_sm(P(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_P)`. -/
def rGammaContP {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) (ℓ : ℕ) :
    SmoothDerived (P.adelic S) ℓ ⥤ HeckeDerived (P.hecke S) := sorry

/-- `RΓ_cont(K^S_M, −) : D^+_sm(M(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_M)`. -/
def rGammaContM {D : UnitarySimilitudeDatum} (P : StdParabolicIG D) (S : Finset ℕ) (ℓ : ℕ) :
    SmoothDerived (P.leviAdelic S) ℓ ⥤ HeckeDerived (P.heckeLevi S) := sorry

/-- (IG.6/parabolic-induction-derived-invariants) CSnc Lemmas 6.4.2–6.4.3, with `K^S` hyperspecial
outside `S` and `K^S_N` pro-prime-to-`ℓ` (`ℓ ∈ S`):
(1) `RΓ_cont(K^S, Ind^{G(𝔸^S)}_{P(𝔸^S)}(−)) ≅ r_P^* RΓ_cont(K^S_P, −)`;
(2) `r_M^* RΓ_cont(K^S_M, −) ≅ RΓ_cont(K^S_P, Inf^{P(𝔸^S)}_{M(𝔸^S)}(−))`. -/
theorem parabolicInductionDerivedInvariants {D : UnitarySimilitudeDatum} (P : StdParabolicIG D)
    (S : Finset ℕ) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ∈ S) :
    Nonempty (SmoothDerived.ind (P.adelic S) ⋙ rGammaContG D S ℓ ≅
      rGammaContP P S ℓ ⋙ HeckeDerived.restrictScalars (P.rP S)) ∧
    Nonempty (rGammaContM P S ℓ ⋙ HeckeDerived.restrictScalars (P.rM S) ≅
      SmoothDerived.inf (P.leviProj S) ⋙ rGammaContP P S ℓ) := sorry

/-- (IG.6/boundary-length-obstruction) CSnc Theorem 6.4.1: (1) if some `H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪` or
`H^i(Ig^b, 𝔽_ℓ)_𝔪` is nonzero then `𝔪` is of Galois type (`ρ̄_𝔪` with the Hecke Frobenius
polynomials at split `v | q ∉ S`); (2) if moreover `H^i_{c−∂}(Ig^b)_𝔪 → H^i(Ig^b)_𝔪` is not an
isomorphism for some `i` and `b` is not ordinary, then `ρ̄_𝔪` has at least three Jordan–Hölder
constituents. -/
theorem boundaryLengthObstruction {D : UnitarySimilitudeDatum} (E : ImagQuadSubfield D)
    {p ℓ : ℕ} [Fact ℓ.Prime] {S : Finset ℕ} {N : ℕ} (hyp : CSStandingHyp E p ℓ S N)
    {k : Type u} [Field k] [IsAlgClosed k] [CharP k p] (X : PDivGStructure D p (pt k))
    (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal] (hℓ : (ℓ : HeckeAlgebra D S) ∈ 𝔪) :
    ((∃ i, Nontrivial (localizeAt 𝔪 (PartialSupportCoh N X ℓ i)) ∨
        Nontrivial (localizeAt 𝔪 (IgusaCoh N X ℓ i))) → IsGaloisType E ℓ 𝔪) ∧
    ∀ h : GaloisTypeData E ℓ 𝔪,
      (∃ i, ¬ Function.Bijective (locMapIG 𝔪 (partialSupportCohomology.hecke N X S ℓ i))) →
      X.newtonClass ≠ KottwitzSet.ordinary D p → 3 ≤ h.rho.length := sorry

end IG6Hecke

end

end TauCeti.Igusa

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

namespace TauCeti.Igusa

open CategoryTheory AlgebraicGeometry IsDedekindDomain Polynomial

noncomputable section

/-! ## IG.7 — Localized concentration and arithmetic handoff -/

section IG7Carriers

/-! ### Locally symmetric spaces of the unitary group `G⁰` (owner: ArithmeticLocallySymmetricSpaces) -/

/-! The Hecke algebra `𝕋^{0,S}` of `G⁰`, the map `𝕋^S → 𝕋^{0,S}`, the locally symmetric spaces
and their cohomology `H^i(X⁰_{K⁰}, Λ)`, `H^i_c(X⁰_{K⁰}, Λ)`, `H^i(X_K, Λ)` are IG.0's
`UnitarySimilitudeDatum.UnitaryHeckeAlgebra`, `heckeRestrict`, `unitaryLssCoh`, `unitaryLssCohC`,
`lssCoh`, `principalLevel`. -/

/-- The inclusion `𝕋^{S'} ⊂ 𝕋^S` for `S ⊆ S'`. -/
def HeckeAlgebra.restrictIG (D : UnitarySimilitudeDatum) {S S' : Finset ℕ} (h : S ⊆ S') :
    HeckeAlgebra D S' →+* HeckeAlgebra D S := sorry

/-- Neat compact open subgroups `K ⊂ G⁰(𝔸_f)` (owner: ArithmeticLocallySymmetricSpaces; neatness
is not expressible with IG.0's carriers, so levels are a carrier type over IG.0's subgroups). -/
def NeatLevel (D : UnitarySimilitudeDatum) : Type := sorry

/-- The underlying subgroup `K ⊂ G(𝔸_f)` (contained in `G⁰(𝔸_f)`). -/
def NeatLevel.toSubgroup {D : UnitarySimilitudeDatum} (K : NeatLevel D) :
    Subgroup (D.group IG0Af) := sorry

theorem NeatLevel.toSubgroup_le {D : UnitarySimilitudeDatum} (K : NeatLevel D) :
    K.toSubgroup ≤ D.unitaryGroup IG0Af := sorry

/-- The finite set of primes `q` with `K_q ≠ G⁰(ℤ_q)` (not hyperspecial). -/
def NeatLevel.badPrimes {D : UnitarySimilitudeDatum} (K : NeatLevel D) : Finset ℕ := sorry

/-- The level `K⁰ = K(N) ∩ G⁰(𝔸_f)` (`N ≥ 3`). -/
def levelK0 (D : UnitarySimilitudeDatum) (N : ℕ) : NeatLevel D := sorry

theorem levelK0_toSubgroup (D : UnitarySimilitudeDatum) (N : ℕ) :
    (levelK0 D N).toSubgroup = D.principalLevel N ⊓ D.unitaryGroup IG0Af := sorry

/-- `H^i(∂X_K, 𝔽_ℓ)` for the Borel–Serre boundary. -/
def LSBdryCoh {D : UnitarySimilitudeDatum} (K : NeatLevel D) (ℓ i : ℕ) : Type := sorry

instance {D : UnitarySimilitudeDatum} (K : NeatLevel D) (ℓ i : ℕ) :
    AddCommGroup (LSBdryCoh K ℓ i) := sorry
instance {D : UnitarySimilitudeDatum} (K : NeatLevel D) (S : Finset ℕ) (ℓ i : ℕ) :
    Module (D.UnitaryHeckeAlgebra S) (LSBdryCoh K ℓ i) := sorry

/-- The forget-supports map `H^i_c(X_K, 𝔽_ℓ) → H^i(X_K, 𝔽_ℓ)`. -/
def lsForget {D : UnitarySimilitudeDatum} (K : NeatLevel D) (ℓ i : ℕ) (S : Finset ℕ) :
    D.unitaryLssCohC K.toSubgroup (ZMod ℓ) i →ₗ[D.UnitaryHeckeAlgebra S]
      D.unitaryLssCoh K.toSubgroup (ZMod ℓ) i := sorry

/-- `ℤ_ℓ`- or `O`-lattices `V_λ` in algebraic representations of `G⁰` (owner:
ArithmeticLocallySymmetricSpaces; `O` a finite `ℤ_ℓ`-algebra). -/
def AlgRepLattice (D : UnitarySimilitudeDatum) (O : Type) [CommRing O] : Type := sorry

/-- The trivial lattice `O`, giving constant coefficients. -/
def AlgRepLattice.trivial (D : UnitarySimilitudeDatum) (O : Type) [CommRing O] :
    AlgRepLattice D O := sorry

/-- `H^i(X_K, V_λ)`. -/
def LSCohV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : Type := sorry
/-- `H^i_c(X_K, V_λ)`. -/
def LSCohCV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : Type := sorry
/-- `H^i(∂X_K, V_λ)`. -/
def LSBdryV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : Type := sorry
/-- `H^i(X_K, V_λ[1/ℓ])`. -/
def LSCohVRat {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : Type := sorry

instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : AddCommGroup (LSCohV K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : AddCommGroup (LSCohCV K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : AddCommGroup (LSBdryV K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) : AddCommGroup (LSCohVRat K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (S : Finset ℕ) (i : ℕ) :
    Module (D.UnitaryHeckeAlgebra S) (LSCohV K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (S : Finset ℕ) (i : ℕ) :
    Module (D.UnitaryHeckeAlgebra S) (LSCohCV K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (S : Finset ℕ) (i : ℕ) :
    Module (D.UnitaryHeckeAlgebra S) (LSBdryV K V i) := sorry
instance {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (S : Finset ℕ) (i : ℕ) :
    Module (D.UnitaryHeckeAlgebra S) (LSCohVRat K V i) := sorry

/-- The connecting map `H^i(∂X_K, V_λ) → H^j_c(X_K, V_λ)` of the boundary sequence (meaningful for
`j = i + 1`). -/
def lsConnectingV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i j : ℕ) (S : Finset ℕ) :
    LSBdryV K V i →ₗ[D.UnitaryHeckeAlgebra S] LSCohCV K V j := sorry

/-- `H^i_c(X_K, V_λ) → H^i(X_K, V_λ)`. -/
def lsForgetV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) (S : Finset ℕ) :
    LSCohCV K V i →ₗ[D.UnitaryHeckeAlgebra S] LSCohV K V i := sorry

/-- Restriction to the boundary `H^i(X_K, V_λ) → H^i(∂X_K, V_λ)`. -/
def lsRestrictV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) (S : Finset ℕ) :
    LSCohV K V i →ₗ[D.UnitaryHeckeAlgebra S] LSBdryV K V i := sorry

/-- `H^i(X_K, V_λ) → H^i(X_K, V_λ[1/ℓ])`. -/
def lsInvertEllV {D : UnitarySimilitudeDatum} {O : Type} [CommRing O] (K : NeatLevel D)
    (V : AlgRepLattice D O) (i : ℕ) (S : Finset ℕ) :
    LSCohV K V i →ₗ[D.UnitaryHeckeAlgebra S] LSCohVRat K V i := sorry

/-- The Hecke action on `H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)` (owner: PerfectoidShimuraVarieties). -/
instance goodReductionLocusInf_hecke (D : UnitarySimilitudeDatum) (p N : ℕ) (S : Finset ℕ)
    (ℓ i : ℕ) : Module (HeckeAlgebra D S) (DiamondH (GoodReductionLocus.{u} D p N) ℓ i) := sorry

end IG7Carriers

section CSGeneric

variable {D : UnitarySimilitudeDatum}

/-- The prime `p` witnesses condition (iii) for `ρ̄_𝔪`: `p ≠ ℓ` splits completely in `F`, and
`ρ̄_𝔪` is unramified at every `v | p` with `α_{i,v} ≠ p α_{j,v}` for `i ≠ j` (the decomposed-generic
prime of AG2.7; repeated eigenvalues allowed). -/
def GaloisTypeData.IsCSWitness {E : ImagQuadSubfield D} {S : Finset ℕ} {ℓ : ℕ} [Fact ℓ.Prime]
    {𝔪 : Ideal (HeckeAlgebra D S)} (h : GaloisTypeData E ℓ 𝔪) (p : ℕ) : Prop :=
  p.Prime ∧ p ≠ ℓ ∧ SplitsCompletelyIG D.F p ∧
    ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      h.rho.IsUnramifiedAt (inertiaAt v) ∧ h.rho.FrobRatioCond (frobAt v) p

/-- (IG.7/cs-generic-maximal-ideal) `𝔪` is CS-generic: of Galois type with (i) `F⁺ ≠ ℚ`,
(ii) `ρ̄_𝔪` of length at most two, (iii) a witness prime `p`. Distinct from non-Eisenstein and
weaker than CS17 decomposed genericity (`α_i/α_j ∉ {1, q}`). -/
def IsCSGeneric (E : ImagQuadSubfield D) {S : Finset ℕ} (ℓ : ℕ) [Fact ℓ.Prime]
    (𝔪 : Ideal (HeckeAlgebra D S)) : Prop :=
  ∃ h : GaloisTypeData E ℓ 𝔪, 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F) ∧
    h.rho.length ≤ 2 ∧ ∃ p, h.IsCSWitness p

/-- ACC+ Definition 4.3.1, in ACC+'s names: the coefficient prime is `pc` and the auxiliary prime
`l ≠ pc` splits completely in `F`, with `ρ̄` unramified at `v | l` and `α_i/α_j ≠ l` (`i ≠ j`). -/
def IsACCDecomposedGeneric {m pc : ℕ} [Fact pc.Prime] (ρ : ResidualRep D.F m pc) : Prop :=
  ∃ l : ℕ, l.Prime ∧ l ≠ pc ∧ SplitsCompletelyIG D.F l ∧
    ∀ v : IgPlace D, (l : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      ρ.IsUnramifiedAt (inertiaAt v) ∧ ρ.FrobRatioCond (frobAt v) l

variable {E : ImagQuadSubfield D} {S : Finset ℕ} {ℓ : ℕ} [Fact ℓ.Prime]

/-- `𝔪` is CS-generic iff `𝔪^∨` is (IG.5/dual-hecke-ideal). -/
theorem IsCSGeneric.dual (𝔪 : Ideal (HeckeAlgebra D S)) :
    IsCSGeneric E ℓ 𝔪 ↔ IsCSGeneric E ℓ (dualIdeal 𝔪) := sorry

/-- CS17 decomposed genericity at a completely split `p` with length `≤ 2` implies CS-genericity. -/
theorem IsCSGeneric.of_strong {𝔪 : Ideal (HeckeAlgebra D S)} (h : GaloisTypeData E ℓ 𝔪)
    (hF : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F))
    (hlen : h.rho.length ≤ 2) (p : ℕ) (hp : p.Prime) (hpℓ : p ≠ ℓ)
    (hsplit : SplitsCompletelyIG D.F p)
    (hgen : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      h.rho.IsUnramifiedAt (inertiaAt v) ∧ h.rho.DecomposedGenericAt (frobAt v) p) :
    IsCSGeneric E ℓ 𝔪 := sorry

/-- If some prime witnesses (iii), infinitely many do (Chebotarev; AG2.7). -/
theorem IsCSGeneric.infinitely_many_primes {𝔪 : Ideal (HeckeAlgebra D S)}
    (h : GaloisTypeData E ℓ 𝔪) (hw : ∃ p, h.IsCSWitness p) :
    ∀ T : Finset ℕ, ∃ p ∉ T, h.IsCSWitness p := sorry

/-- The ACC+ dictionary: CS-generic iff "decomposed generic and length `≤ 2`" (ACC+ §4.3) with
`F⁺ ≠ ℚ`, after exchanging the names of the two primes (ACC+'s coefficient prime `p` is `ℓ` here,
its auxiliary prime `l` is `p` here). -/
theorem IsCSGeneric.acc_dictionary (𝔪 : Ideal (HeckeAlgebra D S)) :
    IsCSGeneric E ℓ 𝔪 ↔ ∃ h : GaloisTypeData E ℓ 𝔪,
      1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F) ∧ h.rho.length ≤ 2 ∧
        IsACCDecomposedGeneric h.rho := sorry

-- test: IsCSGeneric.reducible_ok — for 2n = 2, χ₁ ⊕ χ₂ unramified above p with χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p⁻¹} is CS-generic of length two
example (hn : D.n = 1) (hF : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F))
    (𝔪 : Ideal (HeckeAlgebra D S)) (h : GaloisTypeData E ℓ 𝔪)
    (χ : Fin (2 * D.n) → Field.absoluteGaloisGroup D.F →* (FlBar ℓ)ˣ)
    (hχ : ∀ a, IsOpen ((χ a).ker : Set (Field.absoluteGaloisGroup D.F)))
    (hρ : h.rho.Iso (ResidualRep.ofChars χ hχ)) (p : ℕ) (hp : p.Prime) (hpℓ : p ≠ ℓ)
    (hsplit : SplitsCompletelyIG D.F p)
    (hunr : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      ∀ a, inertiaAt v ≤ (χ a).ker)
    (hratio : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      ∀ a b, a ≠ b → ((χ a (frobAt v) : (FlBar ℓ)ˣ) : FlBar ℓ) ≠ p * (χ b (frobAt v) : FlBar ℓ)) :
    IsCSGeneric E ℓ 𝔪 ∧ h.rho.length = 2 := sorry

-- test: IsCSGeneric.reducible_ok — ρ̄ = 1 ⊕ ε̄⁻¹ is not CS-generic (eigenvalue ratio p at every v | p, v ∤ ℓ)
example (hn : D.n = 1) (𝔪 : Ideal (HeckeAlgebra D S)) (h : GaloisTypeData E ℓ 𝔪)
    (hχ : ∀ a : Fin (2 * D.n), IsOpen (((fun a : Fin (2 * D.n) =>
      if (a : ℕ) = 0 then (1 : Field.absoluteGaloisGroup D.F →* (FlBar ℓ)ˣ)
      else cycloTwist D ℓ (-1)) a).ker : Set (Field.absoluteGaloisGroup D.F)))
    (hρ : h.rho.Iso (ResidualRep.ofChars (fun a : Fin (2 * D.n) =>
      if (a : ℕ) = 0 then (1 : Field.absoluteGaloisGroup D.F →* (FlBar ℓ)ˣ)
      else cycloTwist D ℓ (-1)) hχ)) :
    ¬ IsCSGeneric E ℓ 𝔪 := sorry

-- test: IsCSGeneric.length_three — ρ̄_𝔪 with three or more Jordan–Hölder constituents is never CS-generic
example (𝔪 : Ideal (HeckeAlgebra D S)) (h : GaloisTypeData E ℓ 𝔪) (hlen : 3 ≤ h.rho.length) :
    ¬ IsCSGeneric E ℓ 𝔪 := sorry

-- test: IsCSGeneric.not_noneisenstein — the reducible χ₁ ⊕ χ₂ of reducible_ok is CS-generic and Eisenstein
example (hn : D.n = 1) (hF : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F))
    (𝔪 : Ideal (HeckeAlgebra D S)) (h : GaloisTypeData E ℓ 𝔪)
    (χ : Fin (2 * D.n) → Field.absoluteGaloisGroup D.F →* (FlBar ℓ)ˣ)
    (hχ : ∀ a, IsOpen ((χ a).ker : Set (Field.absoluteGaloisGroup D.F)))
    (hρ : h.rho.Iso (ResidualRep.ofChars χ hχ)) (p : ℕ) (hp : p.Prime) (hpℓ : p ≠ ℓ)
    (hsplit : SplitsCompletelyIG D.F p)
    (hunr : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      ∀ a, inertiaAt v ≤ (χ a).ker)
    (hratio : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      ∀ a b, a ≠ b → ((χ a (frobAt v) : (FlBar ℓ)ˣ) : FlBar ℓ) ≠ p * (χ b (frobAt v) : FlBar ℓ)) :
    IsCSGeneric E ℓ 𝔪 ∧ ¬ h.rho.IsAbsIrreducible := sorry

-- test: IsCSGeneric.repeated_eigenvalues — α_i = α_j is allowed when α_i ≠ p α_j, although CS17 decomposed genericity fails
example (p : ℕ) (α : FlBar ℓ) (hα : α ≠ 0) (hp : (p : FlBar ℓ) ≠ 1) :
    PolyRatioCond ((X - C α) ^ 2) 2 p ∧ ¬ PolyDecompGeneric ((X - C α) ^ 2) 2 p := sorry

end CSGeneric

section CohGeneric

/-! ### Cohomologically generic Hecke homomorphisms (LTXZZ Appendix D) -/


/-- Finite places of `F⁺` (carrier). -/
def LTXZZPlace (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] : Type := sorry

/-- The abstract spherical Hecke algebra `𝕋_N^{Σ⁺}` of the unitary groups of `N`-dimensional
hermitian spaces over `F`, away from `Σ⁺` (owner: ArithmeticLocallySymmetricSpaces). -/
def LTXZZHecke (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ) (Sp : Finset (LTXZZPlace F)) : Type := sorry

instance (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ) (Sp : Finset (LTXZZPlace F)) :
    CommRing (LTXZZHecke F N Sp) := sorry

/-- The inclusion `𝕋_N^{Σ⁺′} ⊂ 𝕋_N^{Σ⁺}` for `Σ⁺ ⊆ Σ⁺′`. -/
def LTXZZHecke.incl (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ) {Sp Sp' : Finset (LTXZZPlace F)} (h : Sp ⊆ Sp') :
    LTXZZHecke F N Sp' →+* LTXZZHecke F N Sp := sorry

/-- `Σ⁺_bad` (LTXZZ §3). -/
def ltxzzBadPlaces (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] : Finset (LTXZZPlace F) := sorry

/-- Standard indefinite hermitian spaces of dimension `N` (signature `(N−1, 1)` at one archimedean
place, `(N, 0)` at the others). -/
def StdIndefHermitian (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ) : Type := sorry

/-- Levels `K = K_{Σ⁺′} × ∏_{v ∉ Σ⁺_∞ ∪ Σ⁺′} U(Λ)(𝓞_{F⁺_v})` with `Λ` self-dual. -/
def LTXZZLevel {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ}
    (V : StdIndefHermitian F N) (Sp' : Finset (LTXZZPlace F)) : Type := sorry

/-- `H^i_ét(Sh(V, K)_{F̄}, κ)` with its Hecke action. -/
def ltxzzShCoh {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ}
    {V : StdIndefHermitian F N} {Sp' : Finset (LTXZZPlace F)} (K : LTXZZLevel V Sp')
    (κ : Type) [Field κ] (i : ℕ) : Type := sorry

instance {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ}
    {V : StdIndefHermitian F N} {Sp' : Finset (LTXZZPlace F)} (K : LTXZZLevel V Sp')
    (κ : Type) [Field κ] (i : ℕ) : AddCommGroup (ltxzzShCoh K κ i) := sorry
instance {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ}
    {V : StdIndefHermitian F N} {Sp' : Finset (LTXZZPlace F)} (K : LTXZZLevel V Sp')
    (κ : Type) [Field κ] (i : ℕ) : Module (LTXZZHecke F N Sp') (ltxzzShCoh K κ i) := sorry

/-- The kernel of a homomorphism to a field is prime. -/
instance ltxzzKerPrime {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F] {N : ℕ} {Sp : Finset (LTXZZPlace F)} {κ : Type} [Field κ]
    (φ : LTXZZHecke F N Sp →+* κ) : (RingHom.ker φ).IsPrime := RingHom.ker_isPrime φ

variable {F : Type} [Field F] [NumberField F] [NumberField.IsCMField F]

/-- (IG.7/cohomologically-generic) LTXZZ Definition D.1.1: `φ : 𝕋_N^{Σ⁺} → κ` is cohomologically
generic if `H^i_ét(Sh(V, K)_{F̄}, κ)_{𝕋_N^{Σ⁺′} ∩ ker φ} = 0` for every finite `Σ⁺′ ⊇ Σ⁺`, every
`i ≠ N − 1`, every standard indefinite `V` of dimension `N` and every `K` as above. -/
def IsCohomologicallyGeneric {N : ℕ} {Sp : Finset (LTXZZPlace F)} {κ : Type} [Field κ]
    (φ : LTXZZHecke F N Sp →+* κ) : Prop :=
  ∀ (Sp' : Finset (LTXZZPlace F)) (h : Sp ⊆ Sp') (V : StdIndefHermitian F N)
    (K : LTXZZLevel V Sp') (i : ℕ), i ≠ N - 1 →
      Subsingleton (LocalizedModule ((RingHom.ker φ).comap (LTXZZHecke.incl F N h)).primeCompl
        (ltxzzShCoh K κ i))

/-- Stable under enlarging `Σ⁺`. -/
theorem IsCohomologicallyGeneric.mono {N : ℕ} {Sp Sp' : Finset (LTXZZPlace F)} {κ : Type}
    [Field κ] (φ : LTXZZHecke F N Sp →+* κ) (h : Sp ⊆ Sp') (hφ : IsCohomologicallyGeneric φ) :
    IsCohomologicallyGeneric (φ.comp (LTXZZHecke.incl F N h)) := sorry

/-- Invariant under extension of the field `κ`. -/
theorem IsCohomologicallyGeneric.field_ext {N : ℕ} {Sp : Finset (LTXZZPlace F)} {κ κ' : Type}
    [Field κ] [Field κ'] (φ : LTXZZHecke F N Sp →+* κ) (ι : κ →+* κ') :
    IsCohomologicallyGeneric (ι.comp φ) ↔ IsCohomologicallyGeneric φ := sorry

/-- The Satake (Hecke) polynomial of `φ` at a finite place `v` of `F` above a split place of `F⁺`
outside `Σ⁺` (owner: ArithmeticLocallySymmetricSpaces). -/
def ltxzzSatakePoly {N : ℕ} {Sp : Finset (LTXZZPlace F)} {κ : Type} [Field κ]
    (φ : LTXZZHecke F N Sp →+* κ) (v : HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    κ[X] := sorry

/-- The residue characteristic of a place of `F⁺`. -/
def LTXZZPlace.residueChar (w : LTXZZPlace F) : ℕ := sorry

/-- LTXZZ Proposition D.1.3: if `F⁺ ≠ ℚ`, `Σ⁺ ⊇ Σ⁺_bad`, and `φ` is decomposed generic at a prime
`p` splitting completely in `F` and below no place of `Σ⁺` (Satake roots at every `v | p` with
`α_i/α_j ∉ {1, p}`), then `φ` is cohomologically generic. -/
theorem IsCohomologicallyGeneric.of_decomposedGeneric {N : ℕ} {Sp : Finset (LTXZZPlace F)}
    {κ : Type} [Field κ] (φ : LTXZZHecke F N Sp →+* κ)
    (hF : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield F))
    (hbad : ltxzzBadPlaces F ⊆ Sp)
    (hgen : ∃ p : ℕ, p.Prime ∧ SplitsCompletelyIG F p ∧ (∀ w ∈ Sp, w.residueChar ≠ p) ∧
      ∀ v : HeightOneSpectrum (NumberField.RingOfIntegers F),
        (p : NumberField.RingOfIntegers F) ∈ v.asIdeal →
        PolyDecompGeneric ((ltxzzSatakePoly φ v).map (algebraMap κ (AlgebraicClosure κ))) N p) :
    IsCohomologicallyGeneric φ := sorry

/-- The Eisenstein homomorphism of the trivial representation (degree character). -/
def ltxzzTrivialChar (F : Type) [Field F] [NumberField F] [NumberField.IsCMField F] (N : ℕ)
    (Sp : Finset (LTXZZPlace F)) (κ : Type) [Field κ] : LTXZZHecke F N Sp →+* κ := sorry

-- test: IsCohomologicallyGeneric.N_one — for N = 1 every φ is cohomologically generic
example {Sp : Finset (LTXZZPlace F)} {κ : Type} [Field κ] (φ : LTXZZHecke F 1 Sp →+* κ) :
    IsCohomologicallyGeneric φ := sorry

-- test: IsCohomologicallyGeneric.trivial_char — the trivial-representation character is not cohomologically generic for N ≥ 2 (H⁰ ≠ 0, 0 ≠ N − 1)
example (N : ℕ) (hN : 2 ≤ N) (Sp : Finset (LTXZZPlace F)) (κ : Type) [Field κ] :
    ¬ IsCohomologicallyGeneric (ltxzzTrivialChar F N Sp κ) := sorry

-- test: IsCohomologicallyGeneric.N_two — for N = 2, cohomologically generic iff for every V, K the localized H⁰ and H² vanish
example {Sp : Finset (LTXZZPlace F)} {κ : Type} [Field κ] (φ : LTXZZHecke F 2 Sp →+* κ) :
    IsCohomologicallyGeneric φ ↔
      ∀ (Sp' : Finset (LTXZZPlace F)) (h : Sp ⊆ Sp') (V : StdIndefHermitian F 2)
        (K : LTXZZLevel V Sp'),
        Subsingleton (LocalizedModule ((RingHom.ker φ).comap (LTXZZHecke.incl F 2 h)).primeCompl
          (ltxzzShCoh K κ 0)) ∧
        Subsingleton (LocalizedModule ((RingHom.ker φ).comap (LTXZZHecke.incl F 2 h)).primeCompl
          (ltxzzShCoh K κ 2)) := sorry

end CohGeneric

section Concentration

variable {D : UnitarySimilitudeDatum}

/-- (IG.7/only-ordinary-contributes) CSnc proof of Theorem 1.1, first part: if `𝔪` is CS-generic with
witness prime `p` (completely split in `F`), then `H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0` only for `b` ordinary and
`i ≥ d`, and `H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 ≅ H^i(Fℓ, (Rπ°_{HT*}𝔽_ℓ)_𝔪) = 0` for `i < d` (the sheaf
`(Rπ°_{HT*}𝔽_ℓ)_𝔪`, whose stalks are the Igusa cohomologies by IG.3, is concentrated on `Fℓ(ℚ_p)` in
degrees `≥ d`). -/
theorem onlyOrdinaryContributes (E : ImagQuadSubfield D) {p ℓ : ℕ} [Fact ℓ.Prime]
    {S : Finset ℕ} {N : ℕ} (hyp : CSStandingHyp E p ℓ S N) {k : Type u} [Field k]
    [IsAlgClosed k] [CharP k p] (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal]
    (h : GaloisTypeData E ℓ 𝔪) (hlen : h.rho.length ≤ 2) (hw : h.IsCSWitness p) :
    (∀ (X : PDivGStructure D p (pt k)) (i : ℕ), Nontrivial (localizeAt 𝔪 (IgusaCoh N X ℓ i)) →
      X.newtonClass = KottwitzSet.ordinary D p ∧ D.dim ≤ i) ∧
    ∀ i < D.dim, Subsingleton (localizeAt 𝔪 (DiamondH (GoodReductionLocus.{u} D p N) ℓ i)) :=
  sorry

/-- (IG.7/level-descent) CSnc proof of Theorem 1.1, descent: (1) from infinite level at `p` to
`X_{K(N)}`; (2) to the unitary group at `K⁰ = K(N) ∩ G⁰(𝔸_f)` for every maximal `𝔪⁰ ⊂ 𝕋^{0,S}` over
`𝔪`; (3) to an arbitrary neat `K⁰` with `K⁰.badPrimes ⊆ S`, given the infinite-level vanishing for
every enlargement `S' ⊇ S` and every admissible `N'` (Hochschild–Serre along `K(N') ∩ G⁰(𝔸_f) ⊂ K⁰`
when `K⁰_p = G⁰(ℤ_p)`, from infinite level at `p` with Lan–Stroh otherwise). The source writes the
descent only at level `K(N)` (sourceIssues E9). -/
theorem levelDescent (E : ImagQuadSubfield D) {p ℓ : ℕ} [Fact ℓ.Prime] {S : Finset ℕ} {N : ℕ}
    (hyp : CSStandingHyp E p ℓ S N) (𝔪 : Ideal (HeckeAlgebra D S)) [𝔪.IsMaximal] :
    ((∀ i < D.dim, Subsingleton (localizeAt 𝔪 (DiamondH (GoodReductionLocus.{u} D p N) ℓ i))) →
      ∀ i < D.dim, Subsingleton (localizeAt 𝔪 (D.lssCoh (D.principalLevel N) (ZMod ℓ) i))) ∧
    ((∀ i < D.dim, Subsingleton (localizeAt 𝔪 (D.lssCoh (D.principalLevel N) (ZMod ℓ) i))) →
      ∀ (𝔪₀ : Ideal (D.UnitaryHeckeAlgebra S)) [𝔪₀.IsMaximal], 𝔪₀.comap (D.heckeRestrict S) = 𝔪 →
        ∀ i < D.dim, Subsingleton (LocalizedModule 𝔪₀.primeCompl (D.unitaryLssCoh (levelK0 D N).toSubgroup (ZMod ℓ) i))) ∧
    (∀ K0 : NeatLevel D, K0.badPrimes ⊆ S →
      ∀ (𝔪₀ : Ideal (D.UnitaryHeckeAlgebra S)) [𝔪₀.IsMaximal], 𝔪₀.comap (D.heckeRestrict S) = 𝔪 →
        (∀ (S' : Finset ℕ) (hS : S ⊆ S') (N' : ℕ), CSStandingHyp E p ℓ S' N' →
          ∀ i < D.dim, Subsingleton (localizeAt (𝔪.comap (HeckeAlgebra.restrictIG D hS))
            (DiamondH (GoodReductionLocus.{u} D p N') ℓ i))) →
        ∀ i < D.dim, Subsingleton (LocalizedModule 𝔪₀.primeCompl (D.unitaryLssCoh K0.toSubgroup (ZMod ℓ) i))) := sorry

/-- (IG.7/caraiani-scholze-vanishing) Caraiani–Scholze, Theorem 1.1: for `F ⊇ F₀` CM with `F⁺ ≠ ℚ`,
`G⁰` quasi-split unitary of signature `(n, n)`, `K` neat, `d = [F⁺:ℚ]n²`, and `𝔪 ⊂ 𝕋^{0,S}` in the
support of `H^*(X_K, 𝔽_ℓ)` whose Galois-type pullback to `𝕋^S` is CS-generic,
(1) `H^i(X_K, 𝔽_ℓ)_𝔪 ≠ 0 → i ≥ d` and (2) `H^i_c(X_K, 𝔽_ℓ)_𝔪 ≠ 0 → i ≤ d`. (Concentration of both
in degree `d` is not asserted.) -/
theorem caraianiScholzeVanishing (E : ImagQuadSubfield D) {ℓ : ℕ} [Fact ℓ.Prime]
    {S : Finset ℕ} (K : NeatLevel D) (hK : K.badPrimes ⊆ S) (hℓ : ℓ ∈ S)
    (hdisc : ∀ q : ℕ, q.Prime → q ∣ (NumberField.discr D.F).natAbs → q ∈ S)
    (𝔪 : Ideal (D.UnitaryHeckeAlgebra S)) [𝔪.IsMaximal]
    (hsupp : ∃ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.unitaryLssCoh K.toSubgroup (ZMod ℓ) i)))
    (hgen : IsCSGeneric E ℓ (𝔪.comap (D.heckeRestrict S))) :
    (∀ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.unitaryLssCoh K.toSubgroup (ZMod ℓ) i)) → D.dim ≤ i) ∧
    (∀ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.unitaryLssCohC K.toSubgroup (ZMod ℓ) i)) → i ≤ D.dim) := sorry

/-- (IG.7/integral-and-local-system-versions) CSnc Remark 1.5, for every `ℤ_ℓ`-lattice `V_λ`
(`V_λ = ℤ_ℓ` gives constant coefficients): (1) `H^i(X_K, V_λ)_𝔪 = 0` for `i < d` and
`H^i_c(X_K, V_λ)_𝔪 = 0` for `i > d`; (2) `H^d(X_K, V_λ)_𝔪` is torsion-free; (3)
`0 → H^{d−1}(∂X_K)_𝔪 → H^d_c(X_K)_𝔪 → H^d(X_K)_𝔪 → H^d(∂X_K)_𝔪 → 0` is exact. -/
theorem integralAndLocalSystemVersions (E : ImagQuadSubfield D) {ℓ : ℕ} [Fact ℓ.Prime]
    {S : Finset ℕ} (K : NeatLevel D) (hK : K.badPrimes ⊆ S) (hℓ : ℓ ∈ S)
    (hdisc : ∀ q : ℕ, q.Prime → q ∣ (NumberField.discr D.F).natAbs → q ∈ S)
    (𝔪 : Ideal (D.UnitaryHeckeAlgebra S)) [𝔪.IsMaximal]
    (hsupp : ∃ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.unitaryLssCoh K.toSubgroup (ZMod ℓ) i)))
    (hgen : IsCSGeneric E ℓ (𝔪.comap (D.heckeRestrict S))) (V : AlgRepLattice D (PadicInt ℓ)) :
    (∀ i < D.dim, Subsingleton (LocalizedModule 𝔪.primeCompl (LSCohV K V i))) ∧
    (∀ i, D.dim < i → Subsingleton (LocalizedModule 𝔪.primeCompl (LSCohCV K V i))) ∧
    (∀ x : LocalizedModule 𝔪.primeCompl (LSCohV K V D.dim),
      (ℓ : D.UnitaryHeckeAlgebra S) • x = 0 → x = 0) ∧
    Function.Injective (locMapIG 𝔪 (lsConnectingV K V (D.dim - 1) D.dim S)) ∧
    Function.Exact (locMapIG 𝔪 (lsConnectingV K V (D.dim - 1) D.dim S))
      (locMapIG 𝔪 (lsForgetV K V D.dim S)) ∧
    Function.Exact (locMapIG 𝔪 (lsForgetV K V D.dim S)) (locMapIG 𝔪 (lsRestrictV K V D.dim S)) ∧
    Function.Surjective (locMapIG 𝔪 (lsRestrictV K V D.dim S)) := sorry

/-- (IG.7/irreducible-specialization) CSnc Remark 1.6: if moreover `ρ̄_𝔪` is absolutely irreducible,
then `H^i(∂X_K, 𝔽_ℓ)_𝔪 = 0` for all `i` (imported boundary vanishing), so
`H^i_c(X_K, 𝔽_ℓ)_𝔪 ≅ H^i(X_K, 𝔽_ℓ)_𝔪` vanish for `i ≠ d`; integrally `H^i(X_K, ℤ_ℓ)_𝔪` is
concentrated in degree `d` and torsion-free. -/
theorem irreducibleSpecialization (E : ImagQuadSubfield D) {ℓ : ℕ} [Fact ℓ.Prime]
    {S : Finset ℕ} (K : NeatLevel D) (hK : K.badPrimes ⊆ S) (hℓ : ℓ ∈ S)
    (hdisc : ∀ q : ℕ, q.Prime → q ∣ (NumberField.discr D.F).natAbs → q ∈ S)
    (𝔪 : Ideal (D.UnitaryHeckeAlgebra S)) [𝔪.IsMaximal]
    (hsupp : ∃ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.unitaryLssCoh K.toSubgroup (ZMod ℓ) i)))
    (hgen : IsCSGeneric E ℓ (𝔪.comap (D.heckeRestrict S)))
    (h : GaloisTypeData E ℓ (𝔪.comap (D.heckeRestrict S))) (hirr : h.rho.IsAbsIrreducible) :
    (∀ i, Subsingleton (LocalizedModule 𝔪.primeCompl (LSBdryCoh K ℓ i))) ∧
    (∀ i, Function.Bijective (locMapIG 𝔪 (lsForget K ℓ i S))) ∧
    (∀ i, i ≠ D.dim → Subsingleton (LocalizedModule 𝔪.primeCompl (D.unitaryLssCoh K.toSubgroup (ZMod ℓ) i)) ∧
      Subsingleton (LocalizedModule 𝔪.primeCompl (D.unitaryLssCohC K.toSubgroup (ZMod ℓ) i))) ∧
    (∀ i, i ≠ D.dim → Subsingleton (LocalizedModule 𝔪.primeCompl
      (LSCohV K (AlgRepLattice.trivial D (PadicInt ℓ)) i))) ∧
    ∀ x : LocalizedModule 𝔪.primeCompl (LSCohV K (AlgRepLattice.trivial D (PadicInt ℓ)) D.dim),
      (ℓ : D.UnitaryHeckeAlgebra S) • x = 0 → x = 0 := sorry

/-- (IG.7/acc-middle-degree-export) ACC+ Theorem 4.3.3 (renamed: ACC+'s coefficient prime `p` is `ℓ`
here). Assume `[F⁺:ℚ] > 1`, `F ⊇ F₀` imaginary quadratic, and every prime `l ∉ S` is unramified in
`F` or split in an imaginary quadratic subfield of `F`. If `𝔪 ⊂ 𝕋^{0,S}` is in the support of
`H^*(X_K, V_λ)` (`V_λ` an `O`-lattice) and `ρ̄_𝔪` has length `≤ 2` and is decomposed generic
(ACC+ Definition 4.3.1), then with `d = n²[F⁺:ℚ]`, `H^d(X_K, V_λ)_𝔪 → H^d(X_K, V_λ[1/ℓ])_𝔪` is
injective and `H^d(X_K, V_λ)_𝔪 → H^d(∂X_K, V_λ)_𝔪` is surjective. -/
theorem accMiddleDegreeExport (E : ImagQuadSubfield D) {ℓ : ℕ} [Fact ℓ.Prime] {S : Finset ℕ}
    (O : Type) [CommRing O] [IsDomain O] [IsIntegrallyClosed O] [Algebra (PadicInt ℓ) O]
    [Module.Finite (PadicInt ℓ) O] (K : NeatLevel D) (hK : K.badPrimes ⊆ S)
    (hS : ∀ l : ℕ, l.Prime → l ∉ S →
      (Ideal.span {(l : NumberField.RingOfIntegers D.F)}).IsRadical ∨
        ∃ E' : ImagQuadSubfield D, E'.SplitsAt l)
    (hF : 1 < Module.finrank ℚ (NumberField.maximalRealSubfield D.F))
    (V : AlgRepLattice D O) (𝔪 : Ideal (D.UnitaryHeckeAlgebra S)) [𝔪.IsMaximal]
    (hsupp : ∃ i, Nontrivial (LocalizedModule 𝔪.primeCompl (LSCohV K V i)))
    (h : GaloisTypeData E ℓ (𝔪.comap (D.heckeRestrict S))) (hlen : h.rho.length ≤ 2)
    (hdg : IsACCDecomposedGeneric h.rho) :
    Function.Injective (locMapIG 𝔪 (lsInvertEllV K V D.dim S)) ∧
      Function.Surjective (locMapIG 𝔪 (lsRestrictV K V D.dim S)) := sorry

/-- (IG.7/middle-degree-without-length-hypothesis) Caraiani–Newton Theorem 2.1.28 (renamed: CN's
coefficient prime `p` is `ℓ` here): for `F ⊇ F₀` imaginary CM (`F⁺ = ℚ` allowed), `T ∋ ℓ` a finite
set of primes such that every prime `l ∉ T` is unramified in `F` or split in an imaginary quadratic
subfield, and `𝔪 ⊂ 𝕋^{0,T}` with `ρ̄_𝔪` decomposed generic (CN Definition 2.1.27), the maps
`H^d(X_K, V_λ[1/ℓ])_𝔪 ↩ H^d(X_K, V_λ)_𝔪 ↠ H^d(∂X_K, V_λ)_𝔪` are injective, resp. surjective; no
length hypothesis and no `[F⁺:ℚ] > 1`. -/
theorem middleDegreeWithoutLengthHypothesis (E : ImagQuadSubfield D) {ℓ : ℕ} [Fact ℓ.Prime]
    {T : Finset ℕ} (hℓT : ℓ ∈ T) (O : Type) [CommRing O] [IsDomain O] [IsIntegrallyClosed O]
    [Algebra (PadicInt ℓ) O] [Module.Finite (PadicInt ℓ) O] (K : NeatLevel D) (hK : K.badPrimes ⊆ T)
    (hT : ∀ l : ℕ, l.Prime → l ∉ T →
      (Ideal.span {(l : NumberField.RingOfIntegers D.F)}).IsRadical ∨
        ∃ E' : ImagQuadSubfield D, E'.SplitsAt l)
    (V : AlgRepLattice D O) (𝔪 : Ideal (D.UnitaryHeckeAlgebra T)) [𝔪.IsMaximal]
    (hsupp : ∃ i, Nontrivial (LocalizedModule 𝔪.primeCompl (LSCohV K V i)))
    (h : GaloisTypeData E ℓ (𝔪.comap (D.heckeRestrict T))) (hdg : IsACCDecomposedGeneric h.rho) :
    Function.Injective (locMapIG 𝔪 (lsInvertEllV K V D.dim T)) ∧
      Function.Surjective (locMapIG 𝔪 (lsRestrictV K V D.dim T)) := sorry

end Concentration

section Koshikawa

attribute [local instance] HasDerivedCategory.standard

/-- Local Shimura data `(G, b, μ)` with `G = ∏_{i ∈ I} GL_{n_i}` over a finite extension `F_v/ℚ_p`
and `K = ∏ GL_{n_i}(𝓞_{F_v})` (owner: HeckeStacksAndLocalShtukas HS2). -/
def LocalShimuraDatumGL (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) : Type := sorry

/-- The Newton slopes of `b` in each factor `GL_{n_i}` (relative to `F_v`). -/
def LocalShimuraDatumGL.slopes {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv]
    {I : Type} [Fintype I] {n : I → ℕ} (𝒟 : LocalShimuraDatumGL p Fv I n) : I → Multiset ℚ :=
  sorry

/-- `J_b` is quasi-split iff all slopes of `b` are integers
(`J_b = ∏ GL_{m_λ}(D_λ)`, `D_λ` of invariant `λ`). -/
def LocalShimuraDatumGL.IsJbQuasiSplit {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv]
    [Algebra ℚ_[p] Fv] {I : Type} [Fintype I] {n : I → ℕ} (𝒟 : LocalShimuraDatumGL p Fv I n) :
    Prop :=
  ∀ i, ∀ s ∈ 𝒟.slopes i, s.den = 1

/-- The spherical Hecke algebra `ℤ_ℓ[K\G(F_v)/K]`, `G = ∏ GL_{n_i}`. -/
def LocalSphericalHeckeGL (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) : Type := sorry

instance (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv] (I : Type)
    [Fintype I] (n : I → ℕ) (ℓ : ℕ) : CommRing (LocalSphericalHeckeGL p Fv I n ℓ) := sorry

/-- `H^i_c(M_{(G,b,μ),K}, ℤ_ℓ)` over the completed algebraic closure, with its Hecke action. -/
def localShimuraCohC {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv]
    {I : Type} [Fintype I] {n : I → ℕ} (𝒟 : LocalShimuraDatumGL p Fv I n) (ℓ i : ℕ) : Type :=
  sorry

instance {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv] {I : Type}
    [Fintype I] {n : I → ℕ} (𝒟 : LocalShimuraDatumGL p Fv I n) (ℓ i : ℕ) :
    AddCommGroup (localShimuraCohC 𝒟 ℓ i) := sorry
instance {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv] {I : Type}
    [Fintype I] {n : I → ℕ} (𝒟 : LocalShimuraDatumGL p Fv I n) (ℓ i : ℕ) :
    Module (LocalSphericalHeckeGL p Fv I n ℓ) (localShimuraCohC 𝒟 ℓ i) := sorry

/-- The characteristic polynomial of `ρ̄_𝔪(Frob)` in the factor `GL_{n_i}` of the unramified
L-parameter of `𝔪` (Satake), for an embedding of the residue field into `𝔽̄_ℓ`. -/
def localUnramifiedParam {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv]
    {I : Type} [Fintype I] {n : I → ℕ} {ℓ : ℕ} [Fact ℓ.Prime]
    (𝔪 : Ideal (LocalSphericalHeckeGL p Fv I n ℓ))
    (emb : LocalSphericalHeckeGL p Fv I n ℓ ⧸ 𝔪 →+* FlBar ℓ) (i : I) : (FlBar ℓ)[X] := sorry

/-! ### IG.7/koshikawa-parameter-irrelevance — the mod-ℓ application of LLC

These carriers import the general ES/SR interfaces. The application theorem below belongs
to IG. Koshikawa lifts supercuspidal support, not every irreducible representation. -/

/-- Irreducible smooth `𝔽̄_ℓ`-representations of `J_b(F_v)` (owner: SR.0/SR.5). -/
def JbModEllIrreducible {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv]
    {I : Type} [Fintype I] {n : I → ℕ} (𝒟 : LocalShimuraDatumGL p Fv I n) (ℓ : ℕ) : Type := sorry

/-- The semisimple FS parameter, composed with the appropriate twisted Levi inclusion
into the dual of `G`. `some P` means unramified, with Frobenius characteristic polynomials
`P`; `none` means ramified. Owners: ES5, ES6 and ES7:parabolic. -/
def fsUnramifiedJbParameter {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv] [Algebra ℚ_[p] Fv]
    {I : Type} [Fintype I] {n : I → ℕ} {𝒟 : LocalShimuraDatumGL p Fv I n}
    {ℓ : ℕ} [Fact ℓ.Prime] (π : JbModEllIrreducible 𝒟 ℓ) : Option (I → (FlBar ℓ)[X]) := sorry

/-- (IG.7/koshikawa-parameter-irrelevance) Koshikawa Lemma 3.1, including mod-ℓ coefficients.
Its proof uses supercuspidal-support lifting (SR.5), reduction and parabolic compatibility,
then characteristic-zero inner-form LLC (ES7). -/
theorem koshikawaParameterIrrelevance (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hℓp : ℓ ≠ p)
    (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv] [FiniteDimensional ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (𝒟 : LocalShimuraDatumGL p Fv I n)
    (hJ : ¬ 𝒟.IsJbQuasiSplit) (π : JbModEllIrreducible 𝒟 ℓ) (P : I → (FlBar ℓ)[X])
    (hP : fsUnramifiedJbParameter π = some P) :
    ¬ ∀ i, PolyRatioCond (P i) (n i) (localResidueCard p Fv) := sorry

/-- Spherical Hecke algebra after the faithful `ℤ_ℓ[q^(1/2)]` coefficient extension
(owner: SR.4); kept separate from the original `ℤ_ℓ` algebra in the endpoint. -/
def SphericalHeckeGLSqrtQ (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) : Type := sorry

instance (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) : CommRing (SphericalHeckeGLSqrtQ p Fv I n ℓ) := sorry

/-- The coefficient-extension map (owner: SR.4). -/
def sphericalHeckeSqrtScalar (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) :
    LocalSphericalHeckeGL p Fv I n ℓ →+* SphericalHeckeGLSqrtQ p Fv I n ℓ := sorry

/-- Integral spectral Bernstein centre for this product of GL groups, after the faithful
`q^(1/2)` coefficient extension used in Koshikawa §4 (owner: ES3). -/
def SpectralBernsteinGL (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) : Type := sorry

instance (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) : CommRing (SpectralBernsteinGL p Fv I n ℓ) := sorry

/-- Spectral action on `c-Ind_K^G Λ`, with End identified with `H_K^op` (owner: ES3).
For hyperspecial K this algebra is commutative; the opposite identification still matters
for the involution in the following theorem. -/
def compactIndSpectralMap (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) :
    SpectralBernsteinGL p Fv I n ℓ →+* SphericalHeckeGLSqrtQ p Fv I n ℓ := sorry

/-- Integral Satake spectral-to-spherical map (owner: ES3/SR.4). -/
def spectralSatakeMap (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) :
    SpectralBernsteinGL p Fv I n ℓ →+* SphericalHeckeGLSqrtQ p Fv I n ℓ := sorry

/-- The involution sending `[KgK]` to `[Kg⁻¹K]` (owner: SR.4). -/
def sphericalHeckeInversion (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    (I : Type) [Fintype I] (n : I → ℕ) (ℓ : ℕ) :
    SphericalHeckeGLSqrtQ p Fv I n ℓ ≃+* SphericalHeckeGLSqrtQ p Fv I n ℓ := sorry

/-- (IG.7/koshikawa-local-vanishing) The requested integral action/Satake compatibility.
Reduction of the right side at `𝔪` has parameter `localUnramifiedParam 𝔪 emb`; this coefficient
compatibility is part of the ES3/ES5 request, not a consequence of ES7 characteristic-zero LLC.
The integral finite-generation passage is a separate SR.6 request. -/
theorem koshikawaSpectralSatake (p : ℕ) [Fact p.Prime] (Fv : Type) [Field Fv]
    [Algebra ℚ_[p] Fv] [FiniteDimensional ℚ_[p] Fv] (I : Type) [Fintype I]
    (n : I → ℕ) (ℓ : ℕ) [Fact ℓ.Prime] (hℓp : ℓ ≠ p) :
    spectralSatakeMap p Fv I n ℓ =
      (sphericalHeckeInversion p Fv I n ℓ).toRingHom.comp (compactIndSpectralMap p Fv I n ℓ) := sorry

/-- The unramified parameter of a mod-ℓ spectral character, with `none` for ramification
(owner: ES5). This is the parameter of the character of the excursion/spectral algebra,
not an arbitrarily selected irreducible representation. -/
def fsUnramifiedSpectralCharacter {p : ℕ} [Fact p.Prime] {Fv : Type} [Field Fv]
    [Algebra ℚ_[p] Fv] {I : Type} [Fintype I] {n : I → ℕ} {ℓ : ℕ} [Fact ℓ.Prime]
    (χ : SpectralBernsteinGL p Fv I n ℓ →+* FlBar ℓ) : Option (I → (FlBar ℓ)[X]) := sorry

/-- Requested ES3/ES5 reduction part of integral Satake compatibility, after choosing
an extension χ of the residue character to the q^(1/2) coefficient algebra. -/
theorem koshikawaSpectralSatakeReduction (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime]
    (hℓp : ℓ ≠ p) (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv]
    [FiniteDimensional ℚ_[p] Fv] (I : Type) [Fintype I] (n : I → ℕ)
    (𝔪 : Ideal (LocalSphericalHeckeGL p Fv I n ℓ)) [𝔪.IsMaximal]
    (emb : LocalSphericalHeckeGL p Fv I n ℓ ⧸ 𝔪 →+* FlBar ℓ)
    (χ : SphericalHeckeGLSqrtQ p Fv I n ℓ →+* FlBar ℓ)
    (hχ : χ.comp (sphericalHeckeSqrtScalar p Fv I n ℓ) = emb.comp (Ideal.Quotient.mk 𝔪)) :
    fsUnramifiedSpectralCharacter (χ.comp (spectralSatakeMap p Fv I n ℓ)) =
      some (fun i ↦ localUnramifiedParam 𝔪 emb i) := sorry

/-- (IG.7/koshikawa-local-vanishing) Koshikawa Theorem 1.1: for `G = ∏ GL_{n_i}`, hyperspecial `K`,
`ℓ ≠ p`, and `𝔪 ⊂ ℤ_ℓ[K\G(F_v)/K]` with generic unramified parameter (`α_{j'}/α_j ≠ q` for `j ≠ j'`
in each factor), if `J_b` is not quasi-split then `H^i_c(M_{(G,b,μ),K}, ℤ_ℓ)_𝔪 = 0` for all `i`. -/
theorem koshikawaLocalVanishing (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (hℓp : ℓ ≠ p)
    (Fv : Type) [Field Fv] [Algebra ℚ_[p] Fv] [FiniteDimensional ℚ_[p] Fv] (I : Type) [Fintype I]
    (n : I → ℕ) (𝒟 : LocalShimuraDatumGL p Fv I n)
    (𝔪 : Ideal (LocalSphericalHeckeGL p Fv I n ℓ)) [𝔪.IsMaximal]
    (emb : LocalSphericalHeckeGL p Fv I n ℓ ⧸ 𝔪 →+* FlBar ℓ)
    (hgen : ∀ i, PolyRatioCond (localUnramifiedParam 𝔪 emb i) (n i) (localResidueCard p Fv))
    (hJ : ¬ 𝒟.IsJbQuasiSplit) :
    ∀ i, Subsingleton (LocalizedModule 𝔪.primeCompl (localShimuraCohC 𝒟 ℓ i)) := sorry

/-- Levels `K = K_p K^p ⊂ G(𝔸_f)` with `K_p` hyperspecial and `K^p` sufficiently small (owner:
ArithmeticLocallySymmetricSpaces). -/
def ShimuraLevelG (D : UnitarySimilitudeDatum) (p : ℕ) : Type := sorry

/-- The local Hecke algebra `ℤ_ℓ[K_p\G(ℚ_p)/K_p]` at `p`. -/
def LocalHeckeAtP (D : UnitarySimilitudeDatum) (p ℓ : ℕ) : Type := sorry

instance (D : UnitarySimilitudeDatum) (p ℓ : ℕ) : CommRing (LocalHeckeAtP D p ℓ) := sorry

/-- The underlying subgroup `K = K_pK^p ⊂ G(𝔸_f)`. -/
def ShimuraLevelG.toSubgroup {D : UnitarySimilitudeDatum} {p : ℕ} (K : ShimuraLevelG D p) :
    Subgroup (D.group IG0Af) := sorry

/-- The local Hecke algebra at `p` acts on `H^i(S_K, 𝔽_ℓ) = H^i(X_K, 𝔽_ℓ)` (IG.0's `lssCoh`). -/
instance {D : UnitarySimilitudeDatum} {p : ℕ} (K : ShimuraLevelG D p) (ℓ i : ℕ) :
    Module (LocalHeckeAtP D p ℓ) (D.lssCoh K.toSubgroup (ZMod ℓ) i) := sorry
/-- The local Hecke algebra at `p` acts on `H^i_c(S_K, 𝔽_ℓ)` (IG.0's `lssCohC`). -/
instance {D : UnitarySimilitudeDatum} {p : ℕ} (K : ShimuraLevelG D p) (ℓ i : ℕ) :
    Module (LocalHeckeAtP D p ℓ) (D.lssCohC K.toSubgroup (ZMod ℓ) i) := sorry

/-- The characteristic polynomial at `v | p` of the unramified parameter `ρ̄_{𝔪_p}` (Satake; for `p`
split completely, `G(ℚ_p) = ∏ GL_{2n}(ℚ_p) × ℚ_p^×`). -/
def localParamAtP {D : UnitarySimilitudeDatum} {p ℓ : ℕ} [Fact ℓ.Prime]
    (𝔪 : Ideal (LocalHeckeAtP D p ℓ)) (emb : LocalHeckeAtP D p ℓ ⧸ 𝔪 →+* FlBar ℓ)
    (v : IgPlace D) : (FlBar ℓ)[X] := sorry

/-! ### Ordinary support at the local spherical ideal (Koshikawa §§8–9)

The following objects are complexes of modules for `H_{K_p}`; thus localization is at p,
and is not the away-p `𝕋^S` localization used by the other vanishing route. -/

/-- `RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!Rπ°_HT*𝔽_ℓ)` (support functors: C6, equivariance: SF.2). -/
def ordinaryCostalkAtP {D : UnitarySimilitudeDatum} {p : ℕ}
    (K : ShimuraLevelG D p) (ℓ : ℕ) : DerivedCategory (ModuleCat (LocalHeckeAtP D p ℓ)) := sorry

/-- `RΓ_c([Fℓ(ℚ_p)/K_p],i₀*Rπ°_HT*𝔽_ℓ)`. -/
def ordinaryStalkAtP {D : UnitarySimilitudeDatum} {p : ℕ}
    (K : ShimuraLevelG D p) (ℓ : ℕ) : DerivedCategory (ModuleCat (LocalHeckeAtP D p ℓ)) := sorry

/-- The natural costalk-to-stalk map: restrict the counit `i₀*Ri₀!F→F`.
Here `Ri₀!` is the RIGHT adjoint of `i₀*`; Koshikawa Lemma 8.3's prose has the reversed
adjunction (packet source issue E13). -/
def ordinaryCostalkToStalk {D : UnitarySimilitudeDatum} {p : ℕ}
    (K : ShimuraLevelG D p) (ℓ : ℕ) : ordinaryCostalkAtP K ℓ ⟶ ordinaryStalkAtP K ℓ := sorry

/-- Derived localization at a maximal local spherical ideal, restricted back to modules
for `H_{K_p}` (owner: integral Hecke/SR; localization is flat). -/
def localizeHeckeAtP {D : UnitarySimilitudeDatum} {p ℓ : ℕ}
    (𝔪 : Ideal (LocalHeckeAtP D p ℓ)) [𝔪.IsMaximal] :
    DerivedCategory (ModuleCat (LocalHeckeAtP D p ℓ)) ⥤
      DerivedCategory (ModuleCat (LocalHeckeAtP D p ℓ)) := sorry

/-- (IG.7/koshikawa-ordinary-costalk-bound) Koshikawa Corollary 8.2.
The proof uses finite closed specialization sets Z and `Rlim RΓ_Z(RψF)`, preserving D≥d.
No filtered-colimit replacement, stalk bound or away-p localization enters this theorem. -/
theorem koshikawaOrdinaryCostalkBound (D : UnitarySimilitudeDatum) (p ℓ : ℕ)
    [Fact p.Prime] [Fact ℓ.Prime] (hℓp : ℓ ≠ p) (hsplit : SplitsCompletelyIG D.F p)
    (K : ShimuraLevelG D p) :
    DerivedCategory.TStructure.t.ge (D.dim : ℤ) (ordinaryCostalkAtP K ℓ) := sorry

/-- (IG.7/koshikawa-ordinary-costalk-stalk) Koshikawa Proposition 1.7.
Smooth base change along q_K, the ordinary dualizing object κ⁻¹[−2d], the opposite-action
tensor/smooth-dual Hom dictionary and disjoint spectral supports prove this map is an
isomorphism after local spherical localization. These general interfaces are explicitly
requested from BG3, SR, C6 and ES; the application belongs here. -/
theorem koshikawaOrdinaryCostalkStalk (D : UnitarySimilitudeDatum) (p ℓ : ℕ)
    [Fact p.Prime] [Fact ℓ.Prime] (hℓp : ℓ ≠ p) (hsplit : SplitsCompletelyIG D.F p)
    (K : ShimuraLevelG D p) (𝔪 : Ideal (LocalHeckeAtP D p ℓ)) [𝔪.IsMaximal]
    (emb : LocalHeckeAtP D p ℓ ⧸ 𝔪 →+* FlBar ℓ)
    (hgen : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      PolyRatioCond (localParamAtP 𝔪 emb v) (2 * D.n) p) :
    IsIso ((localizeHeckeAtP 𝔪).map (ordinaryCostalkToStalk K ℓ)) := sorry

/-- (IG.7/koshikawa-generic-vanishing) Koshikawa Theorem 1.3 (cited by Caraiani–Newton as
"[Kos21, Theorem 1.4]", sourceIssues E7): for the datum of IG.0 over any CM field, `p` split
completely in `F`, `K_p` hyperspecial, `K` sufficiently small, `d = dim S_K`, `ℓ ≠ p`, and
`𝔪_p ⊂ ℤ_ℓ[K_p\G(ℚ_p)/K_p]` with generic unramified parameter, `H^i(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0` only for
`i ≥ d` and `H^i_c(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0` only for `i ≤ d`; no `[F⁺:ℚ] > 1`, no length condition. -/
theorem koshikawaGenericVanishing (D : UnitarySimilitudeDatum) (p ℓ : ℕ) [Fact p.Prime]
    [Fact ℓ.Prime] (hℓp : ℓ ≠ p) (hsplit : SplitsCompletelyIG D.F p) (K : ShimuraLevelG D p)
    (𝔪 : Ideal (LocalHeckeAtP D p ℓ)) [𝔪.IsMaximal]
    (emb : LocalHeckeAtP D p ℓ ⧸ 𝔪 →+* FlBar ℓ)
    (hgen : ∀ v : IgPlace D, (p : NumberField.RingOfIntegers D.F) ∈ v.asIdeal →
      PolyRatioCond (localParamAtP 𝔪 emb v) (2 * D.n) p) :
    (∀ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.lssCoh K.toSubgroup (ZMod ℓ) i)) → D.dim ≤ i) ∧
    (∀ i, Nontrivial (LocalizedModule 𝔪.primeCompl (D.lssCohC K.toSubgroup (ZMod ℓ) i)) → i ≤ D.dim) := sorry

end Koshikawa

end

end TauCeti.Igusa
