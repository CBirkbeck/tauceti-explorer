/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/FaltingsFinitenessAndIsogenyTheorems.md` is definitive.
These statements suggest Lean forms so that contributors and reviewers can converge
on names and signatures. They claim no implementation.

BP-FaltingsFinitenessAndIsogenyTheorems: partial prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Reviewed: the file elaborates at those two commits, with the Tau Ceti modules imported
below built at the Tau Ceti pin; its only warnings are `declaration uses sorry`.

The reviewed library audit records all six layers of this roadmap as not built. The
pinned libraries have abelian varieties over a field with their homomorphism groups,
endomorphism rings, isogenies, products and base change, homomorphisms of elliptic
Weierstrass curves with their degrees, and Mathlib's schemes, smoothness, properness,
sheaves of modules, number fields, adic completions, `l`-adic numbers, induced
representations, determinants and semisimple modules. They have no polarisation, no
moduli space, no Neron model, no `l`-divisible group, no Tate module of an abelian
variety, no arithmetic degree and no height.

The first section, "Imported interfaces", holds what other roadmaps own and this one
consumes: semiabelian schemes (ShimuraCompactifications C4), the Hodge line, the
arithmetic degree and the height (ArakelovGeometryAndAbelianHeights R35.1-R35.3),
polarisations, duals and kernels (AbelianSchemesAndArithmeticModuli A2, A3), moduli and
the modular bundle (PELModuli M6, ShimuraVarieties V2), Tate modules, torsion and
Frobenius (ArithmeticGaloisRepresentations R01.1, R01.6), `l`-divisible groups
(FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1) and complex-analytic metrics
(ComplexComparisonPartII C0). Each is a structure with only the conditions the pinned
libraries can state (its docstring names what it leaves out) or an opaque `def` of a
type, module, function or morphism whose body is `sorry`. No condition is a
`Prop`-valued placeholder and no statement is `True`. The packet's own objects
(`CorrespondenceStack`, `HermitianMetric.HasLogSingularities`, `PolarizationReduction`,
`QuaternionIsotropic`) and every node's statement follow, stage by stage; each node's
docstring starts with its packet id.
-/
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Geometrically.Connected
import Mathlib.AlgebraicGeometry.Geometrically.Integral
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.VariableChange
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Module.Lattice
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.KrullTopology
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.TensorProduct
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.NumberField.Discriminant.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Order.Northcott
import Mathlib.RepresentationTheory.Induced
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.RamificationInertia.Inertia
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.SimpleModule.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.Trivial
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Hom

set_option autoImplicit false

noncomputable section

namespace TauCeti.Faltings

open _root_.AlgebraicGeometry TauCeti.AlgebraicGeometry CategoryTheory MonObj NumberField
  IsDedekindDomain

open scoped TauCeti.AlgebraicGeometry.AbelianVariety.Hom

universe u

/-! ## Conventions -/

/-- Finitely many classes: a finite set of elements meets the class under `r` of every element
satisfying `P`. With `r` an isomorphism relation this is "finitely many isomorphism classes". -/
def FiniteUpTo {α : Type*} (r : α → α → Prop) (P : α → Prop) : Prop :=
  ∃ s : Set α, s.Finite ∧ ∀ x, P x → ∃ y ∈ s, r x y

/-- The `ℚ_l`-span in `ℚ_l ⊗ T` of a `ℤ_l`-submodule of `T`. -/
def rationalSpan {l : ℕ} [Fact l.Prime] {T : Type*} [AddCommGroup T] [Module ℤ_[l] T]
    (N : Submodule ℤ_[l] T) : Submodule ℚ_[l] (TensorProduct ℤ_[l] ℚ_[l] T) :=
  Submodule.span ℚ_[l] (TensorProduct.mk ℤ_[l] ℚ_[l] T 1 '' N)

/-- A subspace equal to its own orthogonal: maximal isotropic, for a nondegenerate form. -/
def IsLagrangian {k V : Type*} [Field k] [AddCommGroup V] [Module k V]
    (e : LinearMap.BilinForm k V) (W : Submodule k V) : Prop :=
  LinearMap.BilinForm.orthogonal e W = W

/-- The restriction of a representation to an invariant subspace. -/
def restrictRep {k G V : Type*} [CommRing k] [Monoid G] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) (W : Submodule k V) (hW : ∀ g, ∀ x ∈ W, ρ g x ∈ W) :
    Representation k G W where
  toFun g := (ρ g).restrict (hW g)
  map_one' := by ext; simp
  map_mul' g h := by ext; simp

/-! ## Imported interfaces

Nothing in this section is planned by this roadmap. Each declaration stands in for an object
another roadmap (named in its docstring) or a library gap owns; the owner's definition governs.
A structure below has only conditions the pinned libraries can state, and says which it leaves
out; an opaque `def` is a data type or a function whose body is `sorry`. -/

section SemiabelianSchemes

/-- ShimuraCompactifications C4 (stand-in): a semiabelian scheme `p : A → S` of relative dimension
`g`, a smooth separated commutative group scheme with geometrically connected fibres. Left out
(neither library has tori): each fibre is an extension of an abelian variety by a torus. -/
structure SemiabelianScheme (S : Scheme.{u}) (g : ℕ) where
  /-- The group scheme `p : A → S`. -/
  toOver : Over S
  [grpObj : GrpObj toOver]
  [isCommMonObj : IsCommMonObj toOver]
  [smooth : SmoothOfRelativeDimension g toOver.hom]
  [isSeparated : IsSeparated toOver.hom]
  [geometricallyConnected : GeometricallyConnected toOver.hom]

attribute [instance] SemiabelianScheme.grpObj SemiabelianScheme.isCommMonObj
  SemiabelianScheme.smooth SemiabelianScheme.isSeparated
  SemiabelianScheme.geometricallyConnected

namespace SemiabelianScheme

variable {S : Scheme.{u}} {g : ℕ}

/-- The zero section `s : S → A`. -/
abbrev zeroSection (A : SemiabelianScheme S g) : S ⟶ A.toOver.left :=
  η[A.toOver].left

/-- Base change along `f : S' → S`. -/
def baseChange (A : SemiabelianScheme S g) {S' : Scheme.{u}} (f : S' ⟶ S) :
    SemiabelianScheme S' g where
  toOver := (Over.pullback f).obj A.toOver
  grpObj := Functor.grpObjObj
  isCommMonObj := sorry
  smooth := sorry
  isSeparated := sorry
  geometricallyConnected :=
    inferInstanceAs (GeometricallyConnected (Limits.pullback.snd A.toOver.hom f))

/-- The fibre over `Spec K` for an algebra map `R → K`. -/
def genericFibre {R : Type u} [CommRing R] (K : Type u) [Field K] [Algebra R K]
    (A : SemiabelianScheme (Spec (.of R)) g) : Over (Spec (.of K)) :=
  (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap R K)))).obj A.toOver

/-- Opaque, a Mathlib gap (relative differentials of a morphism of schemes): `Ω^g_{A/S}`. -/
def relativeTopForms (A : SemiabelianScheme S g) : A.toOver.left.Modules := sorry

/-- ArakelovGeometryAndAbelianHeights R35.2 (stand-in): the Hodge line
`ω_{A/S} = s^*(Ω^g_{A/S})`. -/
def hodgeBundle (A : SemiabelianScheme S g) : S.Modules :=
  (Scheme.Modules.pullback A.zeroSection).obj A.relativeTopForms

/-- Opaque (R35.2): `φ^* : ω_{B/S} → ω_{A/S}` for a homomorphism `φ : A → B`. -/
def hodgeMap {g' : ℕ} {A : SemiabelianScheme S g} {B : SemiabelianScheme S g'}
    (φ : A.toOver ⟶ B.toOver) : B.hodgeBundle ⟶ A.hodgeBundle := sorry

/-- Opaque, a Mathlib gap (integration of forms on a compact complex manifold):
`∫_{A(ℂ)} α ∧ β̄` for global `g`-forms. -/
def wedgeIntegral (A : SemiabelianScheme (Spec (.of ℂ)) g) :
    Γ(A.relativeTopForms, ⊤) → Γ(A.relativeTopForms, ⊤) → ℂ := sorry

/-- The hermitian product `⟨α, β⟩ = 2^{-g} i^{g²} ∫_A α ∧ β̄` of Bemerkung d), with the sign
corrected (source issue E1). -/
def hodgeProduct (A : SemiabelianScheme (Spec (.of ℂ)) g) :
    Γ(A.relativeTopForms, ⊤) → Γ(A.relativeTopForms, ⊤) → ℂ :=
  fun α β => (2 : ℂ)⁻¹ ^ g * Complex.I ^ (g ^ 2) * A.wedgeIntegral α β

end SemiabelianScheme

/-- Deligne–Mumford (a gap) with NeronModelsAndSemistableAbelianVarieties R11.4 (stand-in): a
stable curve `q : C → S` of genus `g`, proper and flat with geometrically connected fibres. Left
out: the geometric fibres are reduced curves of arithmetic genus `g` with only ordinary double
points, each smooth rational component meeting the others in at least three points. -/
structure StableCurve (S : Scheme.{u}) (g : ℕ) where
  /-- The curve `q : C → S`. -/
  toOver : Over S
  [isProper : IsProper toOver.hom]
  [flat : Flat toOver.hom]
  [geometricallyConnected : GeometricallyConnected toOver.hom]

namespace StableCurve

variable {S : Scheme.{u}} {g : ℕ}

/-- Opaque (R11.4): `Pic^τ(C/S) = Pic^0(C/S)`, semiabelian of relative dimension `g`. -/
def picardTau (C : StableCurve S g) : SemiabelianScheme S g := sorry

/-- Opaque (relative duality and exterior powers of sheaves are Mathlib gaps):
`Λ^k q_*(ω_{C/S})`, `ω_{C/S}` the relative dualising sheaf. -/
def wedgePushforwardDualizing (C : StableCurve S g) (k : ℕ) : S.Modules := sorry

end StableCurve

/-- A semiabelian scheme over `Spec 𝓞_K` whose generic fibre is proper. -/
structure SemiabelianModel (K : Type u) [Field K] [NumberField K] (g : ℕ)
    extends SemiabelianScheme (Spec (.of (𝓞 K))) g where
  [properGenericFibre : IsProper (toSemiabelianScheme.genericFibre K).hom]

attribute [instance] SemiabelianModel.properGenericFibre

namespace SemiabelianModel

variable {K : Type u} [Field K] [NumberField K] {g : ℕ}

/-- The generic fibre `A/K`, an abelian variety. -/
def abelianVariety (A : SemiabelianModel K g) : AbelianVariety K where
  toOver := A.toSemiabelianScheme.genericFibre K
  grpObj := Functor.grpObjObj
  isProper := A.properGenericFibre
  geometricallyIntegral := sorry

/-- Base change to the ring of integers of a finite extension `K'/K`. -/
def baseChange (A : SemiabelianModel K g) (K' : Type u) [Field K'] [NumberField K']
    [Algebra K K'] : SemiabelianModel K' g where
  toSemiabelianScheme :=
    A.toSemiabelianScheme.baseChange (Spec.map (CommRingCat.ofHom (algebraMap (𝓞 K) (𝓞 K'))))
  properGenericFibre := sorry

end SemiabelianModel

/-- `B` has a semiabelian model over `𝓞_K`, that is, semistable reduction everywhere. -/
def HasSemiabelianModel {K : Type u} [Field K] [NumberField K] (B : AbelianVariety K) : Prop :=
  ∃ (g : ℕ) (M : SemiabelianModel K g), Nonempty (M.abelianVariety ≅ B)

end SemiabelianSchemes

section Arakelov

/-- ArakelovGeometryAndAbelianHeights R35.1 (stand-in): a metrized line bundle on `Spec 𝓞_K`, a
projective `𝓞_K`-module `P` of rank one with, at each infinite place `w`, the restriction to `P`
of a norm on `P ⊗ K_w`. -/
structure MetrizedLineBundle (K : Type u) [Field K] [NumberField K] where
  /-- The module `P`. -/
  P : Type u
  [addCommGroup : AddCommGroup P]
  [module : Module (𝓞 K) P]
  [projective : Module.Projective (𝓞 K) P]
  [finite : Module.Finite (𝓞 K) P]
  finrank_eq_one : Module.finrank (𝓞 K) P = 1
  /-- `‖·‖_w`. -/
  norm : InfinitePlace K → P → ℝ
  norm_smul : ∀ w (a : 𝓞 K) p, norm w (a • p) = w (a : K) * norm w p
  norm_pos : ∀ w p, p ≠ 0 → 0 < norm w p

attribute [instance] MetrizedLineBundle.addCommGroup MetrizedLineBundle.module
  MetrizedLineBundle.projective MetrizedLineBundle.finite

variable {K : Type u} [Field K] [NumberField K] {g : ℕ}

/-- Opaque (R35.1): the arithmetic degree `deg(P, ‖·‖)`. -/
def MetrizedLineBundle.arakelovDegree (L : MetrizedLineBundle K) : ℝ := sorry

/-- Opaque (R35.2): the Hodge line `ω_{A/𝓞_K}` with its Faltings metric at the infinite places. -/
def SemiabelianModel.hodgeLine (A : SemiabelianModel K g) : MetrizedLineBundle K := sorry

/-- Opaque (R35.3): the height `h(A)` of a semiabelian model with proper generic fibre. -/
def modularHeight (A : SemiabelianModel K g) : ℝ := sorry

end Arakelov

section Polarizations

variable {K : Type u} [Field K]

/-- Opaque (AbelianSchemesAndArithmeticModuli A2): the dual abelian variety `Â`. -/
def abelianDual (A : AbelianVariety K) : AbelianVariety K := sorry

/-- Opaque (A2): the dual `f^∨ : B̂ → Â` of `f : A → B`. -/
def dualHom {A B : AbelianVariety K} (f : A ⟶ B) : abelianDual B ⟶ abelianDual A := sorry

/-- Opaque (A2): the polarizations of `A`. -/
def Polarization (A : AbelianVariety K) : Type u := sorry

/-- Opaque (A2): a polarization as an isogeny `A → Â`. -/
def Polarization.toHom {A : AbelianVariety K} : Polarization A → (A ⟶ abelianDual A) := sorry

/-- Opaque (A2): transport along an isomorphism. -/
def Polarization.map {A B : AbelianVariety K} (e : A ≅ B) : Polarization A → Polarization B :=
  sorry

/-- Opaque (A2): base change along a field extension. -/
def Polarization.baseChange {A : AbelianVariety K} (pol : Polarization A) (L : Type u) [Field L]
    [Algebra K L] : Polarization (A.baseChange L) := sorry

/-- Opaque (AbelianSchemesAndArithmeticModuli A3): the degree of a homomorphism, `#ker` for an
isogeny and `0` otherwise. -/
def isogenyDegree {A B : AbelianVariety K} (f : A ⟶ B) : ℕ := sorry

/-- The degree of a polarization; it is principal when the degree is one. -/
def Polarization.degree {A : AbelianVariety K} (pol : Polarization A) : ℕ :=
  isogenyDegree pol.toHom

/-- Isomorphism of polarized abelian varieties. -/
def PolarizedIso (x y : Σ A : AbelianVariety K, Polarization A) : Prop :=
  ∃ e : x.1 ≅ y.1, Polarization.map e x.2 = y.2

/-- The power `A^k`, iterated binary products of Tau Ceti. -/
def abelianPower (A : AbelianVariety K) : ℕ → AbelianVariety K
  | 0 => AbelianVariety.trivial K
  | k + 1 => AbelianVariety.prod (abelianPower A k) A

/-- Opaque (A2): the product polarization `λ^k` on `A^k`. -/
def Polarization.pow {A : AbelianVariety K} (pol : Polarization A) (k : ℕ) :
    Polarization (abelianPower A k) := sorry

/-- Opaque (A3, ArithmeticGaloisRepresentations R01.6): the group `A(K̄)`. -/
def geometricPoints (A : AbelianVariety K) : Type u := sorry

instance (A : AbelianVariety K) : AddCommGroup (geometricPoints A) := sorry

/-- Opaque (A3): `f : A(K̄) → B(K̄)`. -/
def pointsMap {A B : AbelianVariety K} (f : A ⟶ B) : geometricPoints A →+ geometricPoints B :=
  sorry

/-- Opaque (A3): the pairing `e^λ` on `ker(λ)(K̄)`, with values in the roots of unity of `K̄`. -/
def Polarization.kernelPairing {A : AbelianVariety K} (pol : Polarization A) :
    (pointsMap pol.toHom).ker → (pointsMap pol.toHom).ker → (AlgebraicClosure K)ˣ := sorry

/-- Opaque (A2): the principal polarizations of an abelian scheme `A → S`. -/
def RelativePrincipalPolarization {S : Scheme.{u}} {g : ℕ} (A : SemiabelianScheme S g) :
    Type u := sorry

end Polarizations

section Moduli

/-- Opaque (PELModuli M6, ShimuraVarieties V2): `Ā_g/ℤ ⊆ ℙ^N_ℤ`, the closure of the coarse
moduli space of principally polarized abelian varieties of dimension `g`, embedded by `ω^{⊗ r}`. -/
def siegelClosure (g : ℕ) : Over (Spec (.of ℤ)) := sorry

/-- Opaque (M6): the coarse space `A_g`, open in `Ā_g/ℤ`. -/
def siegelInterior (g : ℕ) : (siegelClosure g).left.Opens := sorry

/-- Opaque (V2, Baily–Borel): an `r > 0` with `ω^{⊗ r}` very ample on `A_g/ℚ`. -/
def siegelExponent (g : ℕ) : ℕ := sorry

/-- Opaque (V2): `M = O(1)` on `Ā_g/ℤ`. -/
def modularBundle (g : ℕ) : (siegelClosure g).left.Modules := sorry

/-- Opaque, a Mathlib gap (tensor powers of sheaves of modules): `M^{⊗ r}`. -/
def modulesTensorPow {X : Scheme.{u}} (M : X.Modules) (r : ℕ) : X.Modules := sorry

/-- The fibre `X ⊗ ℚ` of a scheme over `Spec ℤ`. -/
abbrev rationalFibre (X : Over (Spec (.of ℤ))) : Over (Spec (.of ℚ)) :=
  (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))).obj X

/-- The projection `X ⊗ ℚ → X`. -/
abbrev rationalFibreι (X : Over (Spec (.of ℤ))) : (rationalFibre X).left ⟶ X.left :=
  Limits.pullback.fst X.hom _

/-- The fibre `X ⊗ ℂ` of a scheme over `Spec ℤ`. -/
abbrev complexFibre (X : Over (Spec (.of ℤ))) : Over (Spec (.of ℂ)) :=
  (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℂ)))).obj X

/-- The projection `X ⊗ ℂ → X`. -/
abbrev complexFibreι (X : Over (Spec (.of ℤ))) : (complexFibre X).left ⟶ X.left :=
  Limits.pullback.fst X.hom _

end Moduli

section TateModules

variable {K : Type u} [Field K]

/-- Opaque (ArithmeticGaloisRepresentations R01.6): the Tate module `T_l(A)`. -/
def TateModule (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : Type u := sorry

instance (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : AddCommGroup (TateModule A l) := sorry

instance (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : Module ℤ_[l] (TateModule A l) := sorry

/-- Opaque (R01.6): the action of `π = Gal(K̄/K)` on `T_l(A)`. -/
def tateRep (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    Representation ℤ_[l] (Field.absoluteGaloisGroup K) (TateModule A l) := sorry

/-- Opaque (R01.6): `T_l(f)`. -/
def tateMap {A B : AbelianVariety K} (f : A ⟶ B) (l : ℕ) [Fact l.Prime] :
    TateModule A l →ₗ[ℤ_[l]] TateModule B l := sorry

/-- Opaque (R01.6): `T_l(A_L) ≅ T_l(A)` for a field extension `L/K`, after an embedding of
algebraic closures. -/
def tateBaseChangeEquiv (A : AbelianVariety K) (L : Type u) [Field L] [Algebra K L]
    (l : ℕ) [Fact l.Prime] : TateModule (A.baseChange L) l ≃ₗ[ℤ_[l]] TateModule A l := sorry

/-- Opaque (R01.6): the Weil pairing `e^λ` on `T_l(A)`, with values in `ℤ_l(1) ≅ ℤ_l`. -/
def weilPairing {A : AbelianVariety K} (pol : Polarization A) (l : ℕ) [Fact l.Prime] :
    LinearMap.BilinForm ℤ_[l] (TateModule A l) := sorry

/-- Opaque (R01.6): `A[l](K̄)` with its Galois action. -/
def TorsionPoints (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : Type u := sorry

instance (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : AddCommGroup (TorsionPoints A l) := sorry

instance (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : Module (ZMod l) (TorsionPoints A l) :=
  sorry

/-- Opaque (R01.6): the action of `π` on `A[l](K̄)`. -/
def torsionRep (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    Representation (ZMod l) (Field.absoluteGaloisGroup K) (TorsionPoints A l) := sorry

/-- The rational Tate module `V_l(A) = ℚ_l ⊗ T_l(A)`. -/
abbrev RationalTateModule (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] : Type u :=
  TensorProduct ℤ_[l] ℚ_[l] (TateModule A l)

/-- The action of `π` on `V_l(A)`. -/
def rationalTateRep (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    Representation ℚ_[l] (Field.absoluteGaloisGroup K) (RationalTateModule A l) where
  toFun σ := LinearMap.baseChange ℚ_[l] (tateRep A l σ)
  map_one' := by simp [Module.End.one_eq_id]
  map_mul' σ τ := by simp [Module.End.mul_eq_comp, LinearMap.baseChange_comp]

/-- The Weil pairing on `V_l(A)`. -/
def rationalWeilPairing {A : AbelianVariety K} (pol : Polarization A) (l : ℕ) [Fact l.Prime] :
    LinearMap.BilinForm ℚ_[l] (RationalTateModule A l) :=
  (weilPairing pol l).baseChange ℚ_[l]

/-- The natural map `End_K(A) ⊗_ℤ ℤ_l → End_{ℤ_l}(T_l(A))`. -/
def endTateComparison (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    TensorProduct ℤ (AbelianVariety.End A) ℤ_[l] →ₗ[ℤ] Module.End ℤ_[l] (TateModule A l) :=
  TensorProduct.lift (LinearMap.mk₂ ℤ (fun f c => c • tateMap (AbelianVariety.End.toHom f) l)
    (by sorry) (by sorry) (fun _ c₁ c₂ => add_smul c₁ c₂ _) (fun n _ c => smul_assoc n c _))

/-- The natural map `End_K(A) ⊗_ℤ ℚ_l → End_{ℚ_l}(V_l(A))`. -/
def rationalEndTateComparison (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    TensorProduct ℤ (AbelianVariety.End A) ℚ_[l] →ₗ[ℤ]
      Module.End ℚ_[l] (RationalTateModule A l) :=
  TensorProduct.lift (LinearMap.mk₂ ℤ
    (fun f c => c • LinearMap.baseChange ℚ_[l] (tateMap (AbelianVariety.End.toHom f) l))
    (by sorry) (by sorry) (fun _ c₁ c₂ => add_smul c₁ c₂ _) (fun n _ c => smul_assoc n c _))

/-- The natural map `Hom_K(A, B) ⊗_ℤ ℤ_l → Hom_{ℤ_l}(T_l(A), T_l(B))`. -/
def homTateComparison (A B : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    TensorProduct ℤ (Additive (A ⟶ B)) ℤ_[l] →ₗ[ℤ] (TateModule A l →ₗ[ℤ_[l]] TateModule B l) :=
  TensorProduct.lift (LinearMap.mk₂ ℤ (fun f c => c • tateMap f.toMul l)
    (by sorry) (by sorry) (fun _ c₁ c₂ => add_smul c₁ c₂ _) (fun n _ c => smul_assoc n c _))

/-- The natural map `Hom_K(A, B) ⊗_ℤ ℚ_l → Hom_{ℚ_l}(V_l(A), V_l(B))`. -/
def rationalHomTateComparison (A B : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    TensorProduct ℤ (Additive (A ⟶ B)) ℚ_[l] →ₗ[ℤ]
      (RationalTateModule A l →ₗ[ℚ_[l]] RationalTateModule B l) :=
  TensorProduct.lift (LinearMap.mk₂ ℤ
    (fun f c => c • LinearMap.baseChange ℚ_[l] (tateMap f.toMul l))
    (by sorry) (by sorry) (fun _ c₁ c₂ => add_smul c₁ c₂ _) (fun n _ c => smul_assoc n c _))

/-- Opaque (R01.6, NeronModelsAndSemistableAbelianVarieties R11.5):
`det(1 - F_v T | T_{l'}(A)^{I_v})`
for a prime `l'` prime to `v`, the reciprocal of `L_v(A, s)` at `T = Nv^{-s}`, independent of
`l'`. -/
def localFactor [NumberField K] (A : AbelianVariety K) (v : HeightOneSpectrum (𝓞 K)) :
    Polynomial ℤ := sorry

end TateModules

section Galois

/-- Opaque (ArithmeticGaloisRepresentations R01.1): `π = Gal(K̄/K) → π̃ = Gal(ℚ̄/ℚ)`, after an
embedding `ℚ̄ → K̄`. -/
def galoisInclusion (K : Type u) [Field K] [NumberField K] :
    Field.absoluteGaloisGroup K →* Field.absoluteGaloisGroup ℚ := sorry

/-- Opaque (R01.1): an arithmetic Frobenius at the prime `p` in `Gal(ℚ̄/ℚ)`. -/
def frobeniusAt (p : ℕ) : Field.absoluteGaloisGroup ℚ := sorry

/-- Opaque (R01.1): an inertia group at the prime `p` in `Gal(ℚ̄/ℚ)`. -/
def inertiaAt (p : ℕ) : Subgroup (Field.absoluteGaloisGroup ℚ) := sorry

/-- Opaque (R01.1, a Mathlib gap for Galois groups of local fields): the inertia group
`I_v ⊆ D_v = Gal(K̄_v/K_v)`. -/
def localInertia (K : Type u) [Field K] [NumberField K] (v : HeightOneSpectrum (𝓞 K)) :
    Subgroup (Field.absoluteGaloisGroup (v.adicCompletion K)) := sorry

/-- The `l`-adic cyclotomic character `χ₀` of `Gal(ℚ̄/ℚ)`. -/
def cyclotomicChar (l : ℕ) [Fact l.Prime] : Field.absoluteGaloisGroup ℚ → ℤ_[l]ˣ :=
  fun σ => cyclotomicCharacter (AlgebraicClosure ℚ) l σ.toRingEquiv

/-- The induced representation `Ind_π^π̃`. -/
abbrev inducedRep {K : Type u} [Field K] [NumberField K] {k V : Type*} [CommRing k]
    [AddCommGroup V] [Module k V] (ρ : Representation k (Field.absoluteGaloisGroup K) V) :
    Representation k (Field.absoluteGaloisGroup ℚ) (Representation.IndV (galoisInclusion K) ρ) :=
  Representation.ind (galoisInclusion K) ρ

/-- `ε`, the character of `π̃` on `Λ^m Ind_π^π̃(ℤ)`: the sign of the permutation action on
`π̃/π`. -/
def inductionSign (K : Type u) [Field K] [NumberField K] (σ : Field.absoluteGaloisGroup ℚ) : ℤ :=
  LinearMap.det (inducedRep (K := K) (Representation.trivial ℤ _ ℤ) σ)

end Galois

section LDivisible

/-- Opaque (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1): the `l`-divisible groups over
`R`. -/
def LDivisibleGroup (R : Type u) [CommRing R] (l : ℕ) : Type u := sorry

variable {R : Type u} [CommRing R] {l : ℕ} [Fact l.Prime]

/-- Opaque (R07.1): the dimension, of the connected part. -/
def LDivisibleGroup.dim (Γ : LDivisibleGroup R l) : ℕ := sorry

/-- Opaque (R07.1): the height. -/
def LDivisibleGroup.height (Γ : LDivisibleGroup R l) : ℕ := sorry

/-- Opaque (R07.1): the Tate module of the generic fibre. -/
def LDivisibleGroup.TateModule (Γ : LDivisibleGroup R l) : Type u := sorry

instance (Γ : LDivisibleGroup R l) : AddCommGroup Γ.TateModule := sorry

instance (Γ : LDivisibleGroup R l) : Module ℤ_[l] Γ.TateModule := sorry

/-- Opaque (R07.1): `# s^*(Ω¹_{Γ[l^n]/R})`. -/
def LDivisibleGroup.levelDifferentialsCard (Γ : LDivisibleGroup R l) (n : ℕ) : ℕ := sorry

end LDivisible

/-- An `l`-divisible subgroup `G ⊆ A[l^∞]` defined over `K`, through its Tate module: a
`π`-stable saturated `ℤ_l`-submodule of `T_l(A)`. -/
structure LDivisibleSubgroup {K : Type u} [Field K] (A : AbelianVariety K) (l : ℕ)
    [Fact l.Prime] where
  /-- `T_l(G) ⊆ T_l(A)`. -/
  tate : Submodule ℤ_[l] (TateModule A l)
  stable : ∀ σ, ∀ x ∈ tate, tateRep A l σ x ∈ tate
  saturated : ∀ x, (l : ℤ_[l]) • x ∈ tate → x ∈ tate

namespace LDivisibleSubgroup

variable {K : Type u} [Field K] {A : AbelianVariety K} {l : ℕ} [Fact l.Prime]

/-- The height of `G`, the rank of `T_l(G)`. -/
def height (G : LDivisibleSubgroup A l) : ℕ :=
  Module.finrank ℤ_[l] G.tate

/-- The action of `π` on `T_l(G)`. -/
def rep (G : LDivisibleSubgroup A l) :
    Representation ℤ_[l] (Field.absoluteGaloisGroup K) G.tate :=
  restrictRep (tateRep A l) G.tate G.stable

/-- `T_l(G)` over `K_v`, inside `T_l(A_{K_v})`. -/
def localize [NumberField K] (G : LDivisibleSubgroup A l) (v : HeightOneSpectrum (𝓞 K)) :
    Submodule ℤ_[l] (TateModule (A.baseChange (v.adicCompletion K)) l) :=
  G.tate.comap (tateBaseChangeEquiv A (v.adicCompletion K) l).toLinearMap

end LDivisibleSubgroup

/-! ## R28.1 Height finiteness on arithmetic moduli -/

/-! ### R28.1/semiabelian-scheme-and-its-hodge-line-bundle (Bemerkungen a)–d); no object of its
own) -/

namespace SemiabelianScheme

variable {S : Scheme.{u}} {g : ℕ}

/-- (a) For `p` proper, `ω_{A/S} ≅ p_*(Ω^g_{A/S})`. -/
theorem hodgeBundle_of_proper (A : SemiabelianScheme S g) [IsProper A.toOver.hom] :
    Nonempty (A.hodgeBundle ≅
      (Scheme.Modules.pushforward A.toOver.hom).obj A.relativeTopForms) := by
  sorry

/-- (b) The formation of `ω_{A/S}` commutes with every base change `S' → S`. -/
theorem hodgeBundle_baseChange (A : SemiabelianScheme S g) {S' : Scheme.{u}} (f : S' ⟶ S) :
    Nonempty ((A.baseChange f).hodgeBundle ≅ (Scheme.Modules.pullback f).obj A.hodgeBundle) := by
  sorry

/-- (c) For `A = Pic^τ(C/S)`, `C` a stable curve of genus `g`, `ω_{A/S} ≅ Λ^g q_*(ω_{C/S})`. -/
theorem hodgeBundle_of_stableCurve (C : StableCurve S g) :
    Nonempty (C.picardTau.hodgeBundle ≅ C.wedgePushforwardDualizing g) := by
  sorry

/-- (d) Over `ℂ` and for `p` proper, `⟨α, β⟩ = 2^{-g} i^{g²} ∫_A α ∧ β̄` is hermitian and
positive definite on `Γ(A, Ω^g)`; Faltings' printed `(i/2)^g ∫_A α ∧ β̄` is negative definite
when `g ≡ 2, 3 mod 4` (source issue E1). -/
theorem hodgeProduct_posDef (A : SemiabelianScheme (Spec (.of ℂ)) g) [IsProper A.toOver.hom] :
    (∀ α β, A.hodgeProduct β α = star (A.hodgeProduct α β)) ∧
      (∀ α, α ≠ 0 → (A.hodgeProduct α α).im = 0 ∧ 0 < (A.hodgeProduct α α).re) ∧
      (g % 4 = 2 ∨ g % 4 = 3 →
        ∀ α, α ≠ 0 → ((Complex.I / 2) ^ g * A.wedgeIntegral α α).re < 0) := by
  sorry

end SemiabelianScheme

/-- R28.1/extension-of-homomorphisms-of-semiabelian-schemes-over-a-normal-base (Lemma 1): over a
normal base `S`, a homomorphism of semiabelian schemes defined over a dense open `U` extends
uniquely to a homomorphism over `S`. -/
theorem extend_hom_of_dense_open {S : Scheme.{u}} {g₁ g₂ : ℕ}
    (hS : ∀ x : S, IsDomain (S.presheaf.stalk x) ∧ IsIntegrallyClosed (S.presheaf.stalk x))
    (U : S.Opens) (hU : Dense (U : Set S))
    (A₁ : SemiabelianScheme S g₁) (A₂ : SemiabelianScheme S g₂)
    (φ : (A₁.baseChange U.ι).toOver ⟶ (A₂.baseChange U.ι).toOver) [IsMonHom φ] :
    ∃! ψ : A₁.toOver ⟶ A₂.toOver, IsMonHom ψ ∧ (Over.pullback U.ι).map ψ = φ := by
  sorry

/-! ### R28.1/stable-curve-correspondence-stack-over-Z (Lemma 2) -/

/-- `U ⊗ ℚ → J` for an open `U` of `J → Spec ℤ`. -/
abbrev rationalOpenι (J : Over (Spec (.of ℤ))) (U : J.left.Opens) :
    (rationalFibre (Over.mk (U.ι ≫ J.hom))).left ⟶ J.left :=
  rationalFibreι (Over.mk (U.ι ≫ J.hom)) ≫ U.ι

/-- Opaque (R35.2 with the construction of Lemma 2): over `U ⊗ ℚ`, the map
`α^* : ψ^*(ω_{A/𝔄_g}) → Λ^g q_*(ω_{C/J})` induced by `α : Pic^τ(C/J) → ψ^*(A)`. -/
def correspondenceAlphaStar {g g' : ℕ} (J : Over (Spec (.of ℤ))) (U : J.left.Opens)
    (family : SemiabelianScheme U g) (curve : StableCurve J.left g')
    (alpha : (curve.picardTau.baseChange U.ι).toOver ⟶ family.toOver) :
    (Scheme.Modules.pullback (rationalFibreι (Over.mk (U.ι ≫ J.hom)))).obj family.hodgeBundle ⟶
      (Scheme.Modules.pullback (rationalOpenι J U)).obj (curve.wedgePushforwardDualizing g) :=
  sorry

/-- R28.1/stable-curve-correspondence-stack-over-Z (Lemma 2): the data of Faltings'
correspondence. The source's `J` is a proper Deligne–Mumford stack and `ψ` lands in the moduli
stack `𝔄_g`; the pinned libraries have no stacks, so `J` is a scheme here, `ψ` lands in the
coarse space, and `ψ^*(A)` is the abelian scheme `family` over `U`. Left out: `ψ` is proper,
`family` is the pull-back of the universal abelian scheme, and the isomorphism of (d) restricts
over `U ⊗ ℚ` to the `ψ^*`-pull-back of `ω^{⊗ r} ≅ M`. One `d` for all components of `U` (a
common multiple) is equivalent to the source's. -/
structure CorrespondenceStack (g : ℕ) where
  /-- `J → Spec ℤ`, proper. -/
  J : Over (Spec (.of ℤ))
  [isProper : IsProper J.hom]
  /-- The open `U ⊆ J`. -/
  U : J.left.Opens
  /-- `ψ : U → A_g`, through the coarse space. -/
  psi : (U : Scheme) ⟶ (siegelClosure g).left
  /-- `ψ^*(A)`, an abelian scheme over `U`. -/
  family : SemiabelianScheme U g
  [family_isProper : IsProper family.toOver.hom]
  /-- The genus `g̃ ≥ max(g, 2)`. -/
  curveGenus : ℕ
  curveGenus_ge : max g 2 ≤ curveGenus
  /-- (a) The stable curve `q : C → J`. -/
  curve : StableCurve J.left curveGenus
  /-- (b) The line subbundle `L`. -/
  subbundle : J.left.Modules
  /-- `L ⊆ Λ^g q_*(ω_{C/J})`, locally a direct summand: the cokernel is locally free. -/
  subbundleι : subbundle ⟶ curve.wedgePushforwardDualizing g
  [subbundleι_mono : Mono subbundleι]
  [cokernel_locallyFree : SheafOfModules.IsLocallyFree (Limits.cokernel subbundleι)]
  /-- The integer `d ≠ 0` of (c). -/
  d : ℕ
  d_ne_zero : d ≠ 0
  /-- (c) `α : Pic^τ(C/J)|_U → ψ^*(A)`. -/
  alpha : (curve.picardTau.baseChange U.ι).toOver ⟶ family.toOver
  /-- (c) `β : ψ^*(A) → Pic^τ(C/J)|_U`. -/
  beta : family.toOver ⟶ (curve.picardTau.baseChange U.ι).toOver
  [alpha_isMonHom : IsMonHom alpha]
  [beta_isMonHom : IsMonHom beta]
  /-- (c) `α ∘ β = [d]`. -/
  alpha_beta : beta ≫ alpha = (𝟙 family.toOver) ^ d
  /-- (d) Over `U ⊗ ℚ`, `L` is the image of `α^*`. -/
  subbundle_eq_image : Nonempty (Limits.image (correspondenceAlphaStar J U family curve alpha) ≅
    (Scheme.Modules.pullback (rationalOpenι J U)).obj subbundle)
  /-- (d) `ψ̄ : J ⊗ ℚ → Ā_g ⊗ ℚ`. -/
  psibar : (rationalFibre J).left ⟶ (rationalFibre (siegelClosure g)).left
  /-- (d) Over `J ⊗ ℚ`, `L^{⊗ r} ≅ ψ̄^*(M)`. -/
  modular_iso : Nonempty
    ((Scheme.Modules.pullback (rationalFibreι J)).obj
        (modulesTensorPow subbundle (siegelExponent g))
      ≅ (Scheme.Modules.pullback psibar).obj
        ((Scheme.Modules.pullback (rationalFibreι (siegelClosure g))).obj (modularBundle g)))
  /-- `ψ̄` is surjective (source issue E4). -/
  [psi_surjective : Surjective psibar]
  /-- `ψ̄^{-1}(A_g ⊗ ℚ) ⊆ U ⊗ ℚ` (source issue E4). -/
  psibar_preimage_le :
    psibar ⁻¹ᵁ (rationalFibreι (siegelClosure g) ⁻¹ᵁ siegelInterior g) ≤ rationalFibreι J ⁻¹ᵁ U

/-- Lemma 2: the correspondence exists for every `g ≥ 1`. -/
theorem exists_correspondenceStack (g : ℕ) (hg : 1 ≤ g) : Nonempty (CorrespondenceStack g) := by
  sorry

/-- Unit test `CorrespondenceStack.curve_genus_ge_two`: the curve has genus `g̃ ≥ max(g, 2)`, even
for `g = 1`. -/
example (g : ℕ) (C : CorrespondenceStack g) : 2 ≤ C.curveGenus ∧ g ≤ C.curveGenus :=
  ⟨le_trans (le_max_right _ _) C.curveGenus_ge, le_trans (le_max_left _ _) C.curveGenus_ge⟩

/-- Unit test `CorrespondenceStack.alpha_not_iso`: `α ∘ β = [d]` with `d ≠ 0`, and `α` is not an
isomorphism when `g̃ > g` (the relative dimensions differ). -/
example (g : ℕ) (C : CorrespondenceStack g) (h : g < C.curveGenus) :
    C.d ≠ 0 ∧ ¬ IsIso C.alpha := by
  refine ⟨C.d_ne_zero, ?_⟩
  sorry

/-- Unit test `CorrespondenceStack.proper_over_Z`: `J` is proper over `Spec ℤ` while `A_g` is not;
`ψ̄` is only defined over `ℚ` (its type). -/
example (g : ℕ) (hg : 1 ≤ g) :
    (∀ C : CorrespondenceStack g, IsProper C.J.hom) ∧
      ¬ IsProper ((siegelInterior g).ι ≫ (siegelClosure g).hom) := by
  refine ⟨fun C => C.isProper, ?_⟩
  sorry

/-- Unit test `CorrespondenceStack.subbundle_saturated`: pulled back along a point
`x : Spec R' → J`, `L` is saturated in `Λ^g q_*(ω_{C/R'})`: the cokernel of `x^*(L) → x^*(Λ^g q_*ω)`
is torsion-free. -/
example (g : ℕ) (C : CorrespondenceStack g) (R' : Type) [CommRing R'] [IsDedekindDomain R']
    (x : Spec (.of R') ⟶ C.J.left) :
    NoZeroSMulDivisors Γ(Spec (.of R'), ⊤)
      Γ(Limits.cokernel ((Scheme.Modules.pullback x).map C.subbundleι), ⊤) := by
  sorry

/-! ### R28.1/commensurability-of-the-modular-and-hodge-line-bundles (Korollar to Lemma 2) -/

section Commensurability

open scoped TensorProduct

variable {K : Type u} [Field K] [NumberField K] {g : ℕ}

/-- Opaque (PELModuli M6, ShimuraVarieties V2): `ρ^*(M)` on `Spec 𝓞_K`, for
`ρ : Spec 𝓞_K → Ā_g/ℤ` extending the moduli point of `(A/K, λ)`. -/
def modularPullback (A : SemiabelianModel K g) (pol : Polarization A.abelianVariety) :
    MetrizedLineBundle K := sorry

/-- Opaque: `ρ^*(M) ⊗ K ≅ ω_{A/𝓞_K}^{⊗ r} ⊗ K`, `r = siegelExponent g`, from the construction of
`M`. -/
def modularHodgeIso (A : SemiabelianModel K g) (pol : Polarization A.abelianVariety) :
    K ⊗[𝓞 K] (modularPullback A pol).P ≃ₗ[K]
      K ⊗[𝓞 K] TensorPower (𝓞 K) (siegelExponent g) A.hodgeLine.P := sorry

end Commensurability

/-- R28.1/commensurability-of-the-modular-and-hodge-line-bundles: there is `e > 0`, depending only
on `g`, with `e · ρ^*(M) ⊆ ω_{A/𝓞_K}^{⊗ r} ⊆ e⁻¹ · ρ^*(M)`, for every number field `K` and every
semiabelian `A/𝓞_K` with proper, principally polarized generic fibre. -/
theorem modular_hodge_commensurable (g : ℕ) :
    ∃ e : ℕ, 0 < e ∧ ∀ (K : Type u) [Field K] [NumberField K] (A : SemiabelianModel K g)
      (pol : Polarization A.abelianVariety), pol.degree = 1 →
      (∀ x : (modularPullback A pol).P, ∃ y,
        modularHodgeIso A pol ((1 : K) ⊗ₜ (e • x)) = (1 : K) ⊗ₜ y) ∧
      (∀ y, ∃ x : (modularPullback A pol).P,
        (modularHodgeIso A pol).symm ((1 : K) ⊗ₜ (e • y)) = (1 : K) ⊗ₜ x) := by
  sorry

/-! ### R28.1/faltings-modular-height-of-a-semiabelian-model (comparison with R35.1–R35.3) -/

/-- Faltings' `Grad(P, ‖·‖) = log #(P/𝓞_K p) - ∑_v ε_v log ‖p‖_v`, computed at `p`, with
`ε_v = InfinitePlace.mult v`. -/
def faltingsGrad {K : Type u} [Field K] [NumberField K] (L : MetrizedLineBundle K) (p : L.P) :
    ℝ :=
  Real.log (Nat.card (L.P ⧸ Submodule.span (𝓞 K) {p})) -
    ∑ v : InfinitePlace K, (v.mult : ℝ) * Real.log (L.norm v p)

/-- R28.1/faltings-modular-height-of-a-semiabelian-model: (i) Faltings' `Grad` is the arithmetic
degree of R35.1, at every `p ≠ 0`; (ii) `h(A) = Grad(ω_{A/𝓞_K})/[K : ℚ]` is the height of R35.3,
where the metric of R35.2 is `‖α‖_v² = 2^{-g} i^{g²} ∫_{A_σ(ℂ)} α ∧ ᾱ` (not stated here: the pinned
libraries cannot identify `P ⊗ ℂ` with `Γ(A_σ, Ω^g)`); (iii) `h` is unchanged by a finite
extension of `K`; (iv) `h` depends only on `A_K`. -/
theorem faltings_height_comparison {K : Type u} [Field K] [NumberField K] {g : ℕ} :
    (∀ (L : MetrizedLineBundle K) (p : L.P), p ≠ 0 → L.arakelovDegree = faltingsGrad L p) ∧
      (∀ A : SemiabelianModel K g,
        modularHeight A = A.hodgeLine.arakelovDegree / Module.finrank ℚ K) ∧
      (∀ (A : SemiabelianModel K g) (K' : Type u) [Field K'] [NumberField K'] [Algebra K K'],
        modularHeight (A.baseChange K') = modularHeight A) ∧
      (∀ A B : SemiabelianModel K g, Nonempty (A.abelianVariety ≅ B.abelianVariety) →
        modularHeight A = modularHeight B) := by
  sorry

/-! ### R28.1/metric-with-logarithmic-singularities-along-a-closed-subvariety -/

namespace HermitianMetric

/-- Opaque (ComplexComparisonPartII C0): continuous hermitian metrics on (the analytification of)
`M` over `X(ℂ) - Y(ℂ)`, where `X` is proper over `ℂ` and `Y = X - U`. -/
def _root_.TauCeti.Faltings.HermitianMetric (X : Over (Spec (.of ℂ))) (U : X.left.Opens)
    (M : X.left.Modules) : Type := sorry

/-- Opaque (C0, SchemeAndStackFoundations): a proper dominant `Φ : X̃ → X` with `X̃` smooth and
`Φ^{-1}(Y)` a divisor with normal crossings, with a finite atlas of charts `Δⁿ → X̃` covering a
neighbourhood of `Φ^{-1}(Y)`, in each of which `Φ^{-1}(Y) = {z₀ ⋯ z_{k-1} = 0}`. -/
def _root_.TauCeti.Faltings.NCResolution (X : Over (Spec (.of ℂ))) (U : X.left.Opens) : Type :=
  sorry

end HermitianMetric

namespace NCResolution

variable {X : Over (Spec (.of ℂ))} {U : X.left.Opens}

/-- Opaque: `dim X̃`. -/
def dim (Φ : NCResolution X U) : ℕ := sorry

/-- Opaque: the charts. -/
def Chart (Φ : NCResolution X U) : Type := sorry

/-- Opaque: the number `k` of branches of `Φ^{-1}(Y)` in a chart. -/
def branches (Φ : NCResolution X U) : Φ.Chart → ℕ := sorry

/-- The local equation `f = z₀ ⋯ z_{k-1}` of `Φ^{-1}(Y)` in a chart. -/
def localEquation (Φ : NCResolution X U) (i : Φ.Chart) (z : Fin Φ.dim → ℂ) : ℂ :=
  ∏ j ∈ Finset.univ.filter (fun j : Fin Φ.dim => (j : ℕ) < Φ.branches i), z j

/-- Opaque (C0): `Φ` itself as a resolution of its source, with `Φ = id` (its own charts). -/
def source (Φ : NCResolution X U) : Over (Spec (.of ℂ)) := sorry

/-- Opaque: `X̃ - Φ^{-1}(Y)`. -/
def sourceOpen (Φ : NCResolution X U) : Φ.source.left.Opens := sorry

/-- Opaque: `Φ^*(M)`. -/
def pullbackModule (Φ : NCResolution X U) (M : X.left.Modules) : Φ.source.left.Modules := sorry

/-- Opaque: the identity resolution of `X̃` with the charts of `Φ`. -/
def self (Φ : NCResolution X U) : NCResolution Φ.source Φ.sourceOpen := sorry

end NCResolution

namespace HermitianMetric

variable {X : Over (Spec (.of ℂ))} {U : X.left.Opens} {M : X.left.Modules}

/-- Opaque (C0): in a chart of `Φ`, `z ↦ sup{‖h(z)‖, ‖h(z)⁻¹‖}` for a local frame `h` of `Φ^*(M)`
(operator norms; for a line bundle `max(‖h‖, ‖h‖⁻¹)`). -/
def chartBound (m : HermitianMetric X U M) (Φ : NCResolution X U) (i : Φ.Chart) :
    (Fin Φ.dim → ℂ) → ℝ := sorry

/-- `‖·‖` has logarithmic singularities along `Y` for the resolution `Φ`: on each chart, where
`0 < |f| ≤ 1/2`, `sup{‖h‖, ‖h‖⁻¹} ≤ c₁ |log |f||^{c₂}` (the bound is required only near
`Φ^{-1}(Y)`, source issue E6). -/
def HasLogSingularitiesWith (m : HermitianMetric X U M) (Φ : NCResolution X U) : Prop :=
  ∃ c₁ c₂ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧ ∀ (i : Φ.Chart) (z : Fin Φ.dim → ℂ), (∀ j, ‖z j‖ < 1) →
    Φ.localEquation i z ≠ 0 → ‖Φ.localEquation i z‖ ≤ 1 / 2 →
      m.chartBound Φ i z ≤ c₁ * |Real.log ‖Φ.localEquation i z‖| ^ c₂

/-- `‖·‖` has logarithmic singularities along `Y`: for some resolution `Φ`. -/
def HasLogSingularities (m : HermitianMetric X U M) : Prop :=
  ∃ Φ : NCResolution X U, m.HasLogSingularitiesWith Φ

/-- Opaque (C0): the restriction to `X - Y` of a metric on `M` over `X`. -/
def restrict (m : HermitianMetric X ⊤ M) (U : X.left.Opens) : HermitianMetric X U M := sorry

/-- Opaque (C0): the tensor product metric. -/
def tensor {M' : X.left.Modules} (m : HermitianMetric X U M) (m' : HermitianMetric X U M')
    (MM' : X.left.Modules) : HermitianMetric X U MM' := sorry

/-- Opaque (C0): the metric on `M^{⊗ r}`. -/
def pow (m : HermitianMetric X U M) (r : ℕ) : HermitianMetric X U (modulesTensorPow M r) := sorry

/-- Opaque (C0): the dual metric. -/
def dual (m : HermitianMetric X U M) (M' : X.left.Modules) : HermitianMetric X U M' := sorry

/-- Opaque (C0): the induced metric on the determinant `det M` of a vector bundle. -/
def det (m : HermitianMetric X U M) (detM : X.left.Modules) : HermitianMetric X U detM := sorry

/-- Opaque (C0): `Φ^*‖·‖` on `Φ^*(M)` over `X̃ - Φ^{-1}(Y)`. -/
def pullback (m : HermitianMetric X U M) (Φ : NCResolution X U) :
    HermitianMetric Φ.source Φ.sourceOpen (Φ.pullbackModule M) := sorry

/-- The complex points of `X`. -/
abbrev ComplexPoint (X : Over (Spec (.of ℂ))) : Type := Over.mk (𝟙 (Spec (.of ℂ))) ⟶ X

/-- The point of `X` underlying a complex point. -/
def ComplexPoint.pt {X : Over (Spec (.of ℂ))} (z : ComplexPoint X) : X.left :=
  z.left (IsLocalRing.closedPoint ℂ)

/-- Opaque (C0): `(‖·‖/‖·‖₁)(z)` at `z ∈ X(ℂ) - Y(ℂ)`, for a second metric `‖·‖₁` on `M`
over `X`. -/
def ratio (m : HermitianMetric X U M) (m₁ : HermitianMetric X ⊤ M) (z : ComplexPoint X) : ℝ :=
  sorry

/-- Opaque (C0): the norm `‖f(z)‖` of a global section at a complex point. -/
def sectionNorm (m : HermitianMetric X ⊤ M) (f : Γ(M, ⊤)) (z : ComplexPoint X) : ℝ := sorry

/-- If a resolution exists and `‖·‖` extends continuously over `X`, it has logarithmic
singularities along `Y`. -/
theorem HasLogSingularities.of_continuous (m : HermitianMetric X ⊤ M) (U : X.left.Opens)
    (Φ : NCResolution X U) : (m.restrict U).HasLogSingularitiesWith Φ := by
  sorry

/-- Tensor products, tensor powers and duals, for the same `Φ`. -/
theorem HasLogSingularities.tensor {M' MM' : X.left.Modules} (m : HermitianMetric X U M)
    (m' : HermitianMetric X U M') (Φ : NCResolution X U) (hm : m.HasLogSingularitiesWith Φ)
    (hm' : m'.HasLogSingularitiesWith Φ) :
    (m.tensor m' MM').HasLogSingularitiesWith Φ ∧ (∀ r, (m.pow r).HasLogSingularitiesWith Φ) ∧
      ∀ M'' : X.left.Modules, (m.dual M'').HasLogSingularitiesWith Φ := by
  sorry

/-- The determinant of a hermitian vector bundle with logarithmic singularities. -/
theorem HasLogSingularities.det (m : HermitianMetric X U M) (detM : X.left.Modules)
    (Φ : NCResolution X U) (hm : m.HasLogSingularitiesWith Φ) :
    (m.det detM).HasLogSingularitiesWith Φ := by
  sorry

/-- If `Ψ^*‖·‖` has logarithmic singularities along `Ψ^{-1}(Y)` with the identity resolution, then
`‖·‖` has logarithmic singularities along `Y` with `Φ = Ψ`. -/
theorem HasLogSingularities.of_pullback (m : HermitianMetric X U M) (Ψ : NCResolution X U)
    (h : (m.pullback Ψ).HasLogSingularitiesWith Ψ.self) : m.HasLogSingularitiesWith Ψ := by
  sorry

/-- The form used in Lemma 3: for a metric `‖·‖₁` on `M` over `X` and sections `f_i` of `M^{⊗ s}`
whose common zero set is `Y`, with `‖f_i‖₁ ≤ e⁻¹`, there are `c₁, c₂` with
`|log (‖·‖/‖·‖₁)(z)| ≤ c₁ + c₂ min_i log |log ‖f_i(z)‖₁|` on `X - Y`. -/
theorem HasLogSingularities.abs_log_ratio_le (m : HermitianMetric X U M)
    (hm : m.HasLogSingularities) (m₁ : HermitianMetric X ⊤ M) (s t : ℕ) (ht : 0 < t)
    (f : Fin t → Γ(modulesTensorPow M s, ⊤))
    (hzero : ∀ z : ComplexPoint X, (∀ i, sectionNorm (m₁.pow s) (f i) z = 0) ↔ z.pt ∉ U)
    (hnorm : ∀ i z, sectionNorm (m₁.pow s) (f i) z ≤ Real.exp (-1)) :
    ∃ c₁ c₂ : ℝ, ∀ z : ComplexPoint X, z.pt ∈ U → ∀ i,
      |Real.log (m.ratio m₁ z)| ≤
        c₁ + c₂ * Real.log |Real.log (sectionNorm (m₁.pow s) (f i) z)| := by
  sorry

/-- Unit test `HermitianMetric.hasLogSingularities_log_metric`: a metric with
`‖1‖ = |log |t||` near the divisor `t = 0` of a one-dimensional chart has logarithmic
singularities for suitable constants (`c₁ = c₂ = 1` fail near `|t| = 1/2`, where
`‖1‖⁻¹ = 1/log 2 > log 2`; `c₁ = (log 2)⁻², c₂ = 1` work). -/
example (m : HermitianMetric X U M) (Φ : NCResolution X U) (h1 : ∀ i, Φ.branches i = 1)
    (hm : ∀ i z, m.chartBound Φ i z =
      max |Real.log ‖Φ.localEquation i z‖| |Real.log ‖Φ.localEquation i z‖|⁻¹) :
    m.HasLogSingularitiesWith Φ := by
  sorry

/-- Unit test `HermitianMetric.not_hasLogSingularities_power_metric`: `‖1‖ = |t|^{-1/2}` near
`t = 0` does not have logarithmic singularities. -/
example (m : HermitianMetric X U M) (Φ : NCResolution X U) (i₀ : Φ.Chart)
    (hdim : 0 < Φ.dim) (h1 : Φ.branches i₀ = 1)
    (hm : ∀ z, m.chartBound Φ i₀ z = max (‖Φ.localEquation i₀ z‖ ^ (-(1 / 2 : ℝ)))
      (‖Φ.localEquation i₀ z‖ ^ (1 / 2 : ℝ))) :
    ¬ m.HasLogSingularitiesWith Φ := by
  sorry

/-- Unit test `HermitianMetric.hasLogSingularities_empty`: along `Y = ∅` every continuous metric
has logarithmic singularities. -/
example (m : HermitianMetric X ⊤ M) [Nonempty (NCResolution X ⊤)] : m.HasLogSingularities := by
  sorry

/-- Unit test `HermitianMetric.hasLogSingularities_tate_curve`: for the universal elliptic curve
near the cusp `q = 0`, `‖du/u‖² = -2π log |q|`, so the Hodge metric has logarithmic singularities
with `c₂ = 1/2`. -/
example (m : HermitianMetric X U M) (Φ : NCResolution X U) (h1 : ∀ i, Φ.branches i = 1)
    (hm : ∀ i z, m.chartBound Φ i z =
      max (Real.sqrt (-2 * Real.pi * Real.log ‖Φ.localEquation i z‖))
        (Real.sqrt (-2 * Real.pi * Real.log ‖Φ.localEquation i z‖))⁻¹) :
    m.HasLogSingularitiesWith Φ := by
  sorry

end HermitianMetric

/-! ### R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary -/

/-- Opaque (C0): the structure of a divisor with normal crossings on `Y = X - U`, for `X` smooth:
charts of `X` itself, giving the resolution `Φ = id`. -/
def NCDivisor (X : Over (Spec (.of ℂ))) (U : X.left.Opens) : Type := sorry

/-- Opaque (C0): the identity resolution attached to a normal-crossings divisor. -/
def NCDivisor.toResolution {X : Over (Spec (.of ℂ))} {U : X.left.Opens} (D : NCDivisor X U) :
    NCResolution X U := sorry

/-- Opaque (R35.2): the Hodge metric on `ω_{A/X}` over `X - Y`, for `A` proper over `X - Y`
(fibrewise the product of Bemerkung d), with the corrected sign). -/
def SemiabelianScheme.hodgeMetric {X : Over (Spec (.of ℂ))} {g : ℕ}
    (A : SemiabelianScheme X.left g) (U : X.left.Opens) [IsProper (A.baseChange U.ι).toOver.hom] :
    HermitianMetric X U A.hodgeBundle := sorry

/-- Opaque (R35.2, ShimuraCompactifications C2, C4): the metric on `M` over `A_g(ℂ)` induced from
the Hodge metric on `ω^{⊗ r}`. -/
def siegelMetric (g : ℕ) :
    HermitianMetric (complexFibre (siegelClosure g))
      (complexFibreι (siegelClosure g) ⁻¹ᵁ siegelInterior g)
      ((Scheme.Modules.pullback (complexFibreι (siegelClosure g))).obj (modularBundle g)) := sorry

/-- R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary: for `X` smooth over `ℂ`,
`Y = X - U` a divisor with normal crossings and `A → X` semiabelian, proper and principally
polarized over `X - Y`, the Hodge metric has logarithmic singularities along `Y` with `Φ = id`. -/
theorem hodge_metric_log_singularities {X : Over (Spec (.of ℂ))} {g : ℕ} [Smooth X.hom]
    (U : X.left.Opens) (D : NCDivisor X U) (A : SemiabelianScheme X.left g)
    [IsProper (A.baseChange U.ι).toOver.hom]
    (pol : RelativePrincipalPolarization (A.baseChange U.ι)) :
    (A.hodgeMetric U).HasLogSingularitiesWith D.toResolution := by
  sorry

/-- R28.1/hodge-metric-has-logarithmic-singularities-along-the-boundary, Faltings' Beispiel: the
metric on `M` over `A_g(ℂ)` has logarithmic singularities along `Ā_g(ℂ) - A_g(ℂ)`, through
Namikawa's `φ : N → Ā_g(ℂ)`. -/
theorem hodge_metric_log_singularities_siegel (g : ℕ) :
    (siegelMetric g).HasLogSingularities := by
  sorry

/-! ### R28.1/northcott-property-for-heights-from-log-singular-metrics (Lemma 3) -/

section Northcott

variable (X : Over (Spec (.of ℤ))) (U : X.left.Opens) (O1 : X.left.Modules)

/-- The metrized `O(1)` on `X(ℂ) - Y(ℂ)`. -/
abbrev ComplexMetric : Type :=
  HermitianMetric (complexFibre X) (complexFibreι X ⁻¹ᵁ U)
    ((Scheme.Modules.pullback (complexFibreι X)).obj O1)

/-- The `K`-points of `X - Y`. -/
def pointsOff (K : Type) [Field K] : Type :=
  {x : Spec (.of K) ⟶ X.left // x (IsLocalRing.closedPoint K) ∈ U}

variable {X U O1}

/-- Opaque (R35.1): `ρ_x^*(O(1), ‖·‖)` on `Spec 𝓞_K`, for `ρ_x : Spec 𝓞_K → X` extending `x`. -/
def metrizedPullback (m : ComplexMetric X U O1) {K : Type} [Field K] [NumberField K]
    (x : pointsOff X U K) : MetrizedLineBundle K := sorry

/-- `h(x) = Grad(ρ_x^*O(1), ‖·‖)/[K : ℚ]`. -/
def pointHeight (m : ComplexMetric X U O1) {K : Type} [Field K] [NumberField K]
    (x : pointsOff X U K) : ℝ :=
  (metrizedPullback m x).arakelovDegree / Module.finrank ℚ K

end Northcott

/-- R28.1/northcott-property-for-heights-from-log-singular-metrics (Lemma 3): for `X ⊆ ℙ^n_ℤ`
closed (here `X` proper over `ℤ` with `O1` the restriction of `O(1)`; the pinned Mathlib has no
`ℙ^n_ℤ`), `Y = X - U` closed and a metric on `O(1)` over `X(ℂ) - Y(ℂ)` with logarithmic
singularities along `Y` (invariance under complex conjugation left out), finitely many
`x ∈ X(K) - Y(K)` have `h(x) ≤ c`. -/
theorem northcott_of_log_singular (X : Over (Spec (.of ℤ))) [IsProper X.hom] (U : X.left.Opens)
    (O1 : X.left.Modules) (m : ComplexMetric X U O1) (hm : m.HasLogSingularities)
    (K : Type) [Field K] [NumberField K] :
    Northcott (fun x : pointsOff X U K => pointHeight m x) := by
  sorry

/-- R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S (imported, Lemma 4):
inside a fixed algebraic closure, finitely many extensions of `K` of degree `n` are unramified at
every finite place outside `S`. -/
theorem hermite_minkowski_outside_S (K : Type) [Field K] [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (n : ℕ) :
    {E : IntermediateField K (AlgebraicClosure K) | FiniteDimensional K E ∧
      Module.finrank K E = n ∧ ∀ v ∉ S, ∀ (P : Ideal (integralClosure (𝓞 K) E)) [P.IsPrime],
        P.comap (algebraMap (𝓞 K) (integralClosure (𝓞 K) E)) = v.asIdeal →
          Algebra.IsUnramifiedAt (𝓞 K) P}.Finite := by
  sorry

/-- R28.1/finiteness-of-principally-polarized-semiabelian-models-of-bounded-height (Satz 1):
finitely many isomorphism classes of pairs of a semiabelian `A/𝓞_K` of relative dimension `g`
with proper generic fibre and a principal polarization of `A_K`, with `h(A) ≤ c`; by Lemma 1 an
isomorphism of pairs is a `K`-isomorphism of the polarized generic fibres. -/
theorem satz_1_finiteness_of_bounded_height (K : Type u) [Field K] [NumberField K] (g : ℕ)
    (c : ℝ) :
    FiniteUpTo (fun x y : Σ A : SemiabelianModel K g, Polarization A.abelianVariety =>
        PolarizedIso ⟨x.1.abelianVariety, x.2⟩ ⟨y.1.abelianVariety, y.2⟩)
      (fun x => x.2.degree = 1 ∧ modularHeight x.1 ≤ c) := by
  sorry

/-- R28.1/finitely-many-K-forms-with-semiabelian-models-in-a-geometric-class: finitely many
`K`-isomorphism classes of principally polarized `(A, λ)` with a semiabelian model over `𝓞_K` and
`(A, λ) ⊗ K̄ ≅ (A₀, λ₀) ⊗ K̄`. -/
theorem finitely_many_K_forms (K : Type u) [Field K] [NumberField K] (A₀ : AbelianVariety K)
    (pol₀ : Polarization A₀) (h₀ : pol₀.degree = 1) :
    FiniteUpTo PolarizedIso (fun x : Σ A : AbelianVariety K, Polarization A =>
      x.2.degree = 1 ∧ HasSemiabelianModel x.1 ∧
        PolarizedIso ⟨x.1.baseChange (AlgebraicClosure K), x.2.baseChange (AlgebraicClosure K)⟩
          ⟨A₀.baseChange (AlgebraicClosure K), pol₀.baseChange (AlgebraicClosure K)⟩) := by
  sorry

/-! ## R28.2 Isogeny-height estimates and boundedness -/

section R28_2

variable {K : Type u} [Field K] [NumberField K] {g : ℕ}

/-- Opaque (AbelianSchemesAndArithmeticModuli A3): `# s^*(Ω¹_{G/𝓞_K})` for `G` the kernel of the
extension of `φ` over `𝓞_K` (Lemma 1), a quasi-finite flat group scheme. -/
def kernelDifferentialsCard {A₁ A₂ : SemiabelianModel K g}
    (φ : A₁.abelianVariety ⟶ A₂.abelianVariety) : ℕ := sorry

/-- Opaque (A3): `# (ω_{A₁/𝓞_K} / φ^*(ω_{A₂/𝓞_K}))`. -/
def hodgeCokernelCard {A₁ A₂ : SemiabelianModel K g}
    (φ : A₁.abelianVariety ⟶ A₂.abelianVariety) : ℕ := sorry

/-- R28.2/height-change-under-an-isogeny-of-semiabelian-models (Lemma 5): for an isogeny
`φ : A₁ → A₂` (given over `K`), `#(ω_{A₁}/φ^*ω_{A₂}) = # s^*(Ω¹_{G/𝓞_K})` and
`h(A₂) = h(A₁) + ½ log Grad(φ) - [K : ℚ]⁻¹ log # s^*(Ω¹_{G/𝓞_K})`. -/
theorem isogeny_height_formula {A₁ A₂ : SemiabelianModel K g}
    (φ : A₁.abelianVariety ⟶ A₂.abelianVariety) (hφ : AbelianVariety.IsIsogeny φ) :
    hodgeCokernelCard φ = kernelDifferentialsCard φ ∧
      modularHeight A₂ = modularHeight A₁ + (1 / 2) * Real.log (isogenyDegree φ) -
        Real.log (kernelDifferentialsCard φ) / Module.finrank ℚ K := by
  sorry

/-- R28.2/bounded-denominators-of-height-differences-under-isogeny (the Bemerkung):
`exp(2[K:ℚ](h(A₂) - h(A₁))) = Grad(φ)^{[K:ℚ]} (# s^*Ω¹_{G/𝓞_K})^{-2}`, a rational number whose
numerator and denominator have only prime divisors of `Grad(φ)`, and for every prime `p`,
`-(2g-1)[K:ℚ] v_p(Grad φ) ≤ v_p(…) ≤ [K:ℚ] v_p(Grad φ)`. -/
theorem isogeny_height_denominators {A₁ A₂ : SemiabelianModel K g}
    (φ : A₁.abelianVariety ⟶ A₂.abelianVariety) (hφ : AbelianVariety.IsIsogeny φ) :
    Real.exp (2 * Module.finrank ℚ K * (modularHeight A₂ - modularHeight A₁)) =
        ((isogenyDegree φ ^ Module.finrank ℚ K / kernelDifferentialsCard φ ^ 2 : ℚ) : ℝ) ∧
      ∀ p : ℕ, p.Prime →
        let q : ℚ := isogenyDegree φ ^ Module.finrank ℚ K / kernelDifferentialsCard φ ^ 2
        (padicValRat p q ≠ 0 → p ∣ isogenyDegree φ) ∧
          -((2 * g - 1) * Module.finrank ℚ K * padicValNat p (isogenyDegree φ) : ℤ) ≤
            padicValRat p q ∧
          padicValRat p q ≤ Module.finrank ℚ K * padicValNat p (isogenyDegree φ) := by
  sorry

/-- Opaque (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, SGA 7 IX): `T_l(Â) = T_l(H_v)`, for
`Â` the formal completion of `A` along its special fibre at `v | l` and `H_v` the `l`-divisible
group over `𝓞_v` with formal completion `Â[l^∞]`. -/
def formalTateSubmodule (A : SemiabelianModel K g) (v : HeightOneSpectrum (𝓞 K)) (l : ℕ)
    [Fact l.Prime] :
    Submodule ℤ_[l] (TateModule (A.abelianVariety.baseChange (v.adicCompletion K)) l) := sorry

/-- R28.2/inertia-triviality-on-the-quotient-by-the-l-divisible-group-of-the-formal-completion
(Lemma 6): at `v | l`, `I_v` acts trivially on `T_l(A)/T_l(H_v)` and `D_v/I_v` acts through a
finite quotient: a finite-index subgroup of `D_v` containing `I_v` acts trivially. -/
theorem lemma_6_inertia_trivial (A : SemiabelianModel K g) (v : HeightOneSpectrum (𝓞 K))
    (l : ℕ) [Fact l.Prime] (hv : (l : 𝓞 K) ∈ v.asIdeal) :
    (∀ σ ∈ localInertia K v, ∀ x,
      tateRep (A.abelianVariety.baseChange (v.adicCompletion K)) l σ x - x ∈
        formalTateSubmodule A v l) ∧
    ∃ H : Subgroup (Field.absoluteGaloisGroup (v.adicCompletion K)), H.FiniteIndex ∧
      localInertia K v ≤ H ∧ ∀ σ ∈ H, ∀ x,
        tateRep (A.abelianVariety.baseChange (v.adicCompletion K)) l σ x - x ∈
          formalTateSubmodule A v l := by
  sorry

/-- R28.2/local-differential-computation-for-the-l-divisible-tower (Tate, Proposition 2): for
`K_v/ℚ_l` of degree `m_v` with valuation ring `R_v` and `Γ` an `l`-divisible group over `R_v` of
dimension `d`, `# s^*(Ω¹_{Γ[l^n]/R_v}) = l^{n m_v d}`. The consequence for isogenies whose kernel
has finite part `Γ[l^n]` is the node on the shifted tower. -/
theorem tate_local_differentials (l : ℕ) [Fact l.Prime] (Kv : Type u) [Field Kv]
    [Algebra ℚ_[l] Kv] [FiniteDimensional ℚ_[l] Kv] [Algebra ℤ_[l] Kv]
    [IsScalarTower ℤ_[l] ℚ_[l] Kv] (Γ : LDivisibleGroup (integralClosure ℤ_[l] Kv) l) (n : ℕ) :
    Γ.levelDifferentialsCard n = l ^ (n * Module.finrank ℚ_[l] Kv * Γ.dim) := by
  sorry

/-- The local degree `m_v = [K_v : ℚ_l] = e_v f_v` of a prime `v` of `K` over `ℚ`. -/
def localDegree (v : HeightOneSpectrum (𝓞 K)) : ℕ :=
  v.asIdeal.ramificationIdx ℤ * v.asIdeal.inertiaDeg ℤ

/-- Hypothesis `(H_v)` at `v | l`: `V_l(G) ∩ V_l(H_v)` is the rational Tate module of an
`l`-divisible group `Γ_v` over `𝓞_v`. -/
structure HodgeTateHypothesis (A : SemiabelianModel K g) {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (v : HeightOneSpectrum (𝓞 K)) where
  /-- `Γ_v` over `𝓞_v`. -/
  Γ : LDivisibleGroup (v.adicCompletionIntegers K) l
  /-- `T_l(Γ_v) → T_l(A_{K_v})`. -/
  embedding : Γ.TateModule →ₗ[ℤ_[l]] TateModule (A.abelianVariety.baseChange (v.adicCompletion K)) l
  injective : Function.Injective embedding
  /-- `V_l(Γ_v) = V_l(G) ∩ V_l(H_v)`. -/
  rational_eq : rationalSpan (LinearMap.range embedding) =
    rationalSpan (G.localize v) ⊓ rationalSpan (formalTateSubmodule A v l)

/-- Opaque (PadicHodgeTheory R06.2, HodgeTateAndCanonicalSubgroups T0): the `D_v`-semilinear
isomorphisms `Λ^h V_l(G) ⊗ C_v ≅ C_v(k)`, `C_v` the completion of an algebraic closure of `K_v`. -/
def HodgeTateDeterminantIso (A : SemiabelianModel K g) {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (v : HeightOneSpectrum (𝓞 K)) (k : ℤ) : Type :=
  sorry

/-- R28.2/hodge-tate-determinant-of-the-tate-module-at-a-place-above-l: under `(H_v)`,
`Λ^h V_l(G) ⊗ C_v ≅ C_v(d_v)` as semilinear `D_v`-modules. -/
theorem hodge_tate_determinant (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (v : HeightOneSpectrum (𝓞 K))
    (hv : (l : 𝓞 K) ∈ v.asIdeal) (H : HodgeTateHypothesis A G v) :
    Nonempty (HodgeTateDeterminantIso A G v H.Γ.dim) := by
  sorry

/-- Opaque, a Mathlib gap: `x ↦ ⟨x⟩`, the projection `ℤ_l^× = μ(ℤ_l) × (1 + qℤ_l) → 1 + qℤ_l`
(`q = l`, or `4` for `l = 2`). -/
def oneUnitPart (l : ℕ) [Fact l.Prime] : ℤ_[l]ˣ →* ℤ_[l]ˣ := sorry

/-- Opaque, a Mathlib gap: `u^a` for `u ∈ 1 + qℤ_l` and `a ∈ ℤ_l`. -/
def lAdicPow (l : ℕ) [Fact l.Prime] (u : ℤ_[l]ˣ) (a : ℤ_[l]) : ℤ_[l]ˣ := sorry

/-- R28.2/l-adic-characters-of-the-absolute-galois-group-of-q-are-cyclotomic-up-to-finite-order:
every continuous `χ : Gal(ℚ̄/ℚ) → ℤ_l^×` is `⟨χ₀⟩^a ε` for a unique `a ∈ ℤ_l` and `ε` of finite
order, and `χ χ₀^{-k}` has finite order if and only if `a = k`. -/
theorem lAdic_character_eq_cyclotomic_pow (l : ℕ) [Fact l.Prime]
    (χ : Field.absoluteGaloisGroup ℚ →* ℤ_[l]ˣ) (hχ : Continuous χ) :
    ∃! a : ℤ_[l], (∃ ε : Field.absoluteGaloisGroup ℚ →* ℤ_[l]ˣ, IsOfFinOrder ε ∧
        ∀ σ, χ σ = lAdicPow l (oneUnitPart l (cyclotomicChar l σ)) a * ε σ) ∧
      ∀ k : ℤ, (∃ n : ℕ, 0 < n ∧ ∀ σ, (χ σ * (cyclotomicChar l σ) ^ (-k)) ^ n = 1) ↔
        a = k := by
  sorry

/-- `χ(σ) = det(σ | Ind_π^π̃ T_l(G))`, the character of `π̃` on `L = Λ^{mh}(Ind_π^π̃ T_l(G))`. -/
def determinantCharacter {A : AbelianVariety K} {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A l) (σ : Field.absoluteGaloisGroup ℚ) : ℤ_[l] :=
  LinearMap.det (inducedRep G.rep σ)

/-- Opaque (R06.2, R01.1): the semilinear isomorphisms `L ⊗ C ≅ C(k)` of modules over a
decomposition group `D ≅ Gal(ℚ̄_l/ℚ_l)` at `l`, `C` the completion of `ℚ̄_l`. -/
def InducedDeterminantIso {A : AbelianVariety K} {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A l) (k : ℤ) : Type := sorry

/-- R28.2/determinant-of-the-induced-tate-module-at-the-decomposition-group-of-l: under `(H_v)`
at every `v | l`, `L ⊗ C ≅ C(∑_v m_v d_v)` as semilinear `D`-modules. -/
theorem induced_determinant_at_l (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l)
    (H : ∀ v : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∈ v.asIdeal → HodgeTateHypothesis A G v) :
    Nonempty (InducedDeterminantIso G
      (∑ᶠ v : {v : HeightOneSpectrum (𝓞 K) // (l : 𝓞 K) ∈ v.asIdeal},
        (localDegree v.1 * (H v.1 v.2).Γ.dim : ℕ))) := by
  sorry

/-- R28.2/frobenius-weights-on-the-induced-tate-module: for `p ≠ l` unramified in `K` with `A` of
good reduction above `p`, every eigenvalue of `F_p` on `Ind_π^π̃ V_l(A)` is algebraic with all
conjugates of absolute value `p^{1/2}`, and `χ(F_p)` is algebraic with all conjugates of absolute
value `p^{mh/2}`. -/
theorem frobenius_weights_induced (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (p : ℕ) (hp : p.Prime) (hpl : p ≠ l)
    (hunr : ¬ (p : ℤ) ∣ discr K)
    (hgood : ∀ v : HeightOneSpectrum (𝓞 K), (p : 𝓞 K) ∈ v.asIdeal →
      ∃ (g' : ℕ) (𝒜 : SemiabelianScheme (Spec (.of (v.adicCompletionIntegers K))) g'),
        IsProper 𝒜.toOver.hom ∧ Nonempty (𝒜.genericFibre (v.adicCompletion K) ≅
          (A.abelianVariety.baseChange (v.adicCompletion K)).toOver)) :
    (∃ P : Polynomial ℚ, P ≠ 0 ∧
      (∀ z ∈ (P.map (algebraMap ℚ ℂ)).roots, ‖z‖ = Real.sqrt p) ∧
      ∃ n : ℕ, Polynomial.aeval (inducedRep (rationalTateRep A.abelianVariety l) (frobeniusAt p))
        (P.map (algebraMap ℚ ℚ_[l])) ^ n = 0) ∧
    ∃ P : Polynomial ℚ, P ≠ 0 ∧
      (∀ z ∈ (P.map (algebraMap ℚ ℂ)).roots,
        ‖z‖ = (p : ℝ) ^ ((Module.finrank ℚ K * G.height : ℕ) / 2 : ℝ)) ∧
      Polynomial.aeval ((determinantCharacter G (frobeniusAt p) : ℤ_[l]) : ℚ_[l])
        (P.map (algebraMap ℚ ℚ_[l])) = 0 := by
  sorry

/-- R28.2/global-determinant-identity-forcing-sum-m-i-d-i-equals-mh-over-two: under `(H_v)` at
every `v | l`, `∑_{v | l} m_v d_v = [K : ℚ] h / 2`, `h` the height of `G`. -/
theorem global_determinant_identity (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l)
    (H : ∀ v : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∈ v.asIdeal → HodgeTateHypothesis A G v) :
    2 * ∑ᶠ v : {v : HeightOneSpectrum (𝓞 K) // (l : 𝓞 K) ∈ v.asIdeal},
        localDegree v.1 * (H v.1 v.2).Γ.dim = Module.finrank ℚ K * G.height := by
  sorry

end R28_2

/-! ## R28.3 Finiteness within an isogeny class -/

section Tower

variable {K : Type u} [Field K] [NumberField K] {g : ℕ}

/-- Opaque (AbelianSchemesAndArithmeticModuli A3, with R11.3): the semiabelian model over `𝓞_K`
of `A_n = A/G_n`, `G_n` the kernel of `l^n` on `G`. -/
def SemiabelianModel.quotientByLevel (A : SemiabelianModel K g) {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (n : ℕ) : SemiabelianModel K g := sorry

/-- Opaque (A3): the isogeny `A_m → A_{m+n}` with kernel `G_{m+n}/G_m`. -/
def levelIsogeny (A : SemiabelianModel K g) {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (m n : ℕ) :
    (A.quotientByLevel G m).abelianVariety ⟶ (A.quotientByLevel G (m + n)).abelianVariety :=
  sorry

/-- Opaque: the image `G/G_m ⊆ A_m[l^∞]`, so that `(A_m)_n = A_{m+n}`. -/
def LDivisibleSubgroup.shift {A : SemiabelianModel K g} {l : ℕ} [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (m : ℕ) :
    LDivisibleSubgroup (A.quotientByLevel G m).abelianVariety l := sorry

/-- Opaque (A3): `# (s^*(Ω¹_{A₁/A₂}) ⊗ 𝓞_v)` for an isogeny `φ : A₁ → A₂` and a finite place `v`. -/
def localKernelDifferentialsCard {A₁ A₂ : SemiabelianModel K g}
    (φ : A₁.abelianVariety ⟶ A₂.abelianVariety) (v : HeightOneSpectrum (𝓞 K)) : ℕ := sorry

end Tower

section R28_3

variable {K : Type u} [Field K] [NumberField K] {g : ℕ}

/-- Opaque (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1): for a sublattice `W ⊆ T_l(Â)` at
`v | l`, the quotient `G_{v,n}/G_{v,n-1}` of the schematic closures `G_{v,n} ⊆ Â` of the levels of
the `l`-divisible subgroup of `A/K_v` attached to `W`. -/
def closureQuotient (A : SemiabelianModel K g) (v : HeightOneSpectrum (𝓞 K)) (l : ℕ)
    [Fact l.Prime]
    (W : Submodule ℤ_[l] (TateModule (A.abelianVariety.baseChange (v.adicCompletion K)) l))
    (n : ℕ) : Over (Spec (.of (v.adicCompletionIntegers K))) := sorry

/-- Opaque: `G_{v,n+1}/G_{v,n} → G_{v,n}/G_{v,n-1}`, induced by multiplication by `l`. -/
def closureTransition (A : SemiabelianModel K g) (v : HeightOneSpectrum (𝓞 K)) (l : ℕ)
    [Fact l.Prime]
    (W : Submodule ℤ_[l] (TateModule (A.abelianVariety.baseChange (v.adicCompletion K)) l))
    (n : ℕ) : closureQuotient A v l W (n + 1) ⟶ closureQuotient A v l W n := sorry

/-- R28.3/closure-tower-becomes-l-divisible-only-after-a-shift (erratum (a)): for a
`D_v`-invariant sublattice `W ⊆ T_l(Â)`, the transition maps of the closures are isomorphisms
for all `n ≥ n₀` (not in general for all `n ≥ 1`); passing to `A_m`, `m ≥ n₀`, only the maps with
`n > m` matter. -/
theorem erratum_a_shift (A : SemiabelianModel K g) (v : HeightOneSpectrum (𝓞 K)) (l : ℕ)
    [Fact l.Prime] (hv : (l : 𝓞 K) ∈ v.asIdeal)
    (W : Submodule ℤ_[l] (TateModule (A.abelianVariety.baseChange (v.adicCompletion K)) l))
    (hW : W ≤ formalTateSubmodule A v l)
    (hWst : ∀ σ, ∀ x ∈ W, tateRep (A.abelianVariety.baseChange (v.adicCompletion K)) l σ x ∈ W) :
    ∃ n₀, ∀ n ≥ n₀, IsIso (closureTransition A v l W n) := by
  sorry

/-- The intersection of the `l`-divisible groups with Tate modules `M, N ⊆ T` is `l`-divisible:
`(M + l^n T) ∩ (N + l^n T) = (M ∩ N) + l^n T` for every `n`. -/
def IntersectionIsLDivisible {l : ℕ} [Fact l.Prime] {T : Type*} [AddCommGroup T]
    [Module ℤ_[l] T] (M N : Submodule ℤ_[l] T) : Prop :=
  ∀ n : ℕ, (M ⊔ Ideal.span {(l : ℤ_[l]) ^ n} • ⊤) ⊓ (N ⊔ Ideal.span {(l : ℤ_[l]) ^ n} • ⊤) =
    (M ⊓ N) ⊔ Ideal.span {(l : ℤ_[l]) ^ n} • ⊤

/-- R28.3/intersection-with-the-toric-l-divisible-group-after-a-shift (erratum (b)): `G ∩ H_v`
need not be `l`-divisible even over `K_v`, but `(G/G_m) ∩ H_v^{(m)}` is for `m ≥ m₁`. -/
theorem erratum_b_shift (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) (v : HeightOneSpectrum (𝓞 K))
    (hv : (l : 𝓞 K) ∈ v.asIdeal) :
    ∃ m₁, ∀ m ≥ m₁, IntersectionIsLDivisible ((G.shift m).localize v)
      (formalTateSubmodule (A.quotientByLevel G m) v l) := by
  sorry

/-- R28.3/differential-count-along-the-shifted-tower: for `m ≥ m₀`, (i) at each `v | l` the closure
of `(G/G_m) ∩ H_v^{(m)}` is an `l`-divisible group `Γ_v` over `𝓞_v` with
`V_l(Γ_v) = V_l(G) ∩ V_l(H_v)`, and (iii) `# (s^*(Ω¹_{A_m/A_{m+n}}) ⊗ 𝓞_v) = l^{n m_v d_v}` and
`# s^*(Ω¹_{A_m/A_{m+n}}) = l^{n ∑_v m_v d_v}`, `d_v = dim Γ_v`. Step (ii), that the finite part of
the kernel over `𝓞_v` is `Γ_v[l^n]`, is left out (no finite parts in the pinned libraries). -/
theorem differential_count_shifted_tower (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) :
    ∃ m₀, ∀ m ≥ m₀, ∃ H : ∀ v : HeightOneSpectrum (𝓞 K), (l : 𝓞 K) ∈ v.asIdeal →
        HodgeTateHypothesis (A.quotientByLevel G m) (G.shift m) v,
      (∀ v hv n, localKernelDifferentialsCard (levelIsogeny A G m n) v =
        l ^ (n * localDegree v * (H v hv).Γ.dim)) ∧
      ∀ n, kernelDifferentialsCard (levelIsogeny A G m n) =
        l ^ (n * ∑ᶠ v : {v : HeightOneSpectrum (𝓞 K) // (l : 𝓞 K) ∈ v.asIdeal},
          localDegree v.1 * (H v.1 v.2).Γ.dim) := by
  sorry

/-- R28.3/corrected-satz-2-stationarity-of-heights-along-an-l-divisible-tower (Satz 2 as
corrected by the erratum): `h(A_n)` becomes stationary. The printed `h(A_n) = h(A)` for all `n`
is false (Katz, Gabber). -/
theorem satz_2_corrected_stationarity (A : SemiabelianModel K g) (l : ℕ) [Fact l.Prime]
    (G : LDivisibleSubgroup A.abelianVariety l) :
    ∃ m₀, ∀ n ≥ m₀,
      modularHeight (A.quotientByLevel G n) = modularHeight (A.quotientByLevel G m₀) := by
  sorry

/-- R28.3/infinitely-many-isomorphic-quotients-along-a-maximal-isotropic-tower: for `(A, λ)`
principally polarized with a semiabelian model, `W ⊆ V_l(A)` `π`-invariant and maximal isotropic
for `e^λ`, and `G` with `T_l(G) = W ∩ T_l(A)`: every `A_n` carries a principal polarization `λ_n`
over `K`, the heights `h(A_n)` are bounded, and infinitely many `(A_n, λ_n)` are isomorphic over
`K`. -/
theorem infinitely_many_isomorphic_quotients (A : SemiabelianModel K g)
    (pol : Polarization A.abelianVariety) (hpol : pol.degree = 1) (l : ℕ) [Fact l.Prime]
    (W : Submodule ℚ_[l] (RationalTateModule A.abelianVariety l))
    (hWst : ∀ σ, ∀ x ∈ W, rationalTateRep A.abelianVariety l σ x ∈ W)
    (hW : IsLagrangian (rationalWeilPairing pol l) W)
    (G : LDivisibleSubgroup A.abelianVariety l)
    (hG : G.tate = (W.restrictScalars ℤ_[l]).comap
      (TensorProduct.mk ℤ_[l] ℚ_[l] (TateModule A.abelianVariety l) 1)) :
    ∃ pols : ∀ n, Polarization (A.quotientByLevel G n).abelianVariety,
      (∀ n, (pols n).degree = 1) ∧ (∃ C, ∀ n, modularHeight (A.quotientByLevel G n) ≤ C) ∧
      ∃ n₀, {n | PolarizedIso ⟨_, pols n⟩ ⟨_, pols n₀⟩}.Infinite := by
  sorry

/-- R28.3/powers-of-a-principally-polarized-semiabelian-model: `A^k` carries the product principal
polarization `λ^k`, has a semiabelian model, and `T_l(A^k) ≅ T_l(A)^k` as `π`-modules, carrying
`e^{λ^k}` to the orthogonal sum of `k` copies of `e^λ`. -/
theorem powers_of_principally_polarized (A : SemiabelianModel K g)
    (pol : Polarization A.abelianVariety) (hpol : pol.degree = 1) (k : ℕ) (hk : 1 ≤ k)
    (l : ℕ) [Fact l.Prime] :
    (pol.pow k).degree = 1 ∧ HasSemiabelianModel (abelianPower A.abelianVariety k) ∧
      ∃ e : TateModule (abelianPower A.abelianVariety k) l ≃ₗ[ℤ_[l]]
          (Fin k → TateModule A.abelianVariety l),
        (∀ σ x, e (tateRep _ l σ x) = fun i => tateRep A.abelianVariety l σ (e x i)) ∧
        ∀ x y, weilPairing (pol.pow k) l x y = ∑ i, weilPairing pol l (e x i) (e y i) := by
  sorry

end R28_3

/-- The rational form of Satz 4 for `A` and `l`: `End_K(A) ⊗ ℚ_l → End_π(V_l(A))` is bijective. -/
def RationalEndBijective {K : Type u} [Field K] (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    Prop :=
  Function.Injective (rationalEndTateComparison A l) ∧
    ∀ φ, φ ∈ Subalgebra.centralizer ℚ_[l] (Set.range (rationalTateRep A l)) ↔
      φ ∈ LinearMap.range (rationalEndTateComparison A l)

/-- `V_l(A)` is a semisimple `ℚ_l[π]`-module. -/
def RationalTateSemisimple {K : Type u} [Field K] (A : AbelianVariety K) (l : ℕ)
    [Fact l.Prime] : Prop :=
  IsSemisimpleModule (MonoidAlgebra ℚ_[l] (Field.absoluteGaloisGroup K))
    (rationalTateRep A l).asModule

/-- R28.3/invariance-of-satz-3-and-satz-4-under-field-extension-and-isogeny: (i) semisimplicity
over a finite extension `L` gives it over `K`; (ii) for `L/K` finite Galois the rational form of
Satz 4 over `L` gives it over `K`; (iii) an isogeny `A → B` gives `V_l(A) ≅ V_l(B)` as
`π`-modules, and the statements hold for `A` if and only if for `B`. -/
theorem satz_3_4_invariance {K : Type u} [Field K] [NumberField K] (A : AbelianVariety K)
    (l : ℕ) [Fact l.Prime] :
    (∀ (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L],
      RationalTateSemisimple (A.baseChange L) l → RationalTateSemisimple A l) ∧
    (∀ (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L],
      RationalEndBijective (A.baseChange L) l → RationalEndBijective A l) ∧
    ∀ (B : AbelianVariety K) (f : A ⟶ B), AbelianVariety.IsIsogeny f →
      Nonempty ((rationalTateRep A l).asModule ≃ₗ[MonoidAlgebra ℚ_[l]
        (Field.absoluteGaloisGroup K)] (rationalTateRep B l).asModule) ∧
      (RationalTateSemisimple A l ↔ RationalTateSemisimple B l) ∧
      (RationalEndBijective A l ↔ RationalEndBijective B l) := by
  sorry

/-! ### R28.3/reduction-to-a-principally-polarized-semiabelian-model -/

/-- R28.3/reduction-to-a-principally-polarized-semiabelian-model: for `(A, λ)` over `K` and an
extension `L/K`, the data of a subgroup `H ⊆ ker(λ_L)(L̄)`, maximal isotropic for `e^λ`, the
quotient `π : A_L → B = A_L/H` and a principal polarization `μ` of `B` with `λ_L = π^∨ ∘ μ ∘ π`. -/
structure PolarizationReduction {K : Type u} [Field K] {A : AbelianVariety K}
    (pol : Polarization A) (L : Type u) [Field L] [Algebra K L] where
  /-- `H ⊆ A_L(L̄)`. -/
  H : AddSubgroup (geometricPoints (A.baseChange L))
  H_le : H ≤ (pointsMap (pol.baseChange L).toHom).ker
  /-- `e^λ` vanishes on `H`. -/
  isotropic : ∀ x y (hx : x ∈ H) (hy : y ∈ H),
    (pol.baseChange L).kernelPairing ⟨x, H_le hx⟩ ⟨y, H_le hy⟩ = 1
  /-- `#H = √(deg λ)`. -/
  card_sq : Nat.card H ^ 2 = pol.degree
  /-- `B = A_L/H`. -/
  B : AbelianVariety L
  /-- The principal polarization `μ` of `B`. -/
  mu : Polarization B
  /-- The quotient isogeny `π : A_L → B`. -/
  proj : A.baseChange L ⟶ B
  isIsogeny : AbelianVariety.IsIsogeny proj
  ker_eq : (pointsMap proj).ker = H
  /-- `λ_L = π^∨ ∘ μ ∘ π`. -/
  comp_eq : (pol.baseChange L).toHom = proj ≫ mu.toHom ≫ dualHom proj

namespace PolarizationReduction

variable {K : Type u} [Field K] {A : AbelianVariety K} {pol : Polarization A}
  {L : Type u} [Field L] [Algebra K L]

/-- `deg π = √(deg λ)`. -/
theorem isogeny_degree (R : PolarizationReduction pol L) :
    isogenyDegree R.proj ^ 2 = pol.degree := by
  sorry

/-- `μ` is principal. -/
theorem isPrincipal (R : PolarizationReduction pol L) : R.mu.degree = 1 := by
  sorry

/-- `ker π = H` is maximal isotropic for `e^λ`, of order `√(deg λ)`. -/
theorem ker_isotropic (R : PolarizationReduction pol L) :
    (pointsMap R.proj).ker = R.H ∧ Nat.card R.H ^ 2 = pol.degree ∧
      ∀ H' : AddSubgroup (geometricPoints (A.baseChange L)), R.H ≤ H' →
        ∀ hH' : H' ≤ (pointsMap (pol.baseChange L).toHom).ker,
          (∀ x y (hx : x ∈ H') (hy : y ∈ H'),
            (pol.baseChange L).kernelPairing ⟨x, hH' hx⟩ ⟨y, hH' hy⟩ = 1) → H' = R.H := by
  sorry

/-- For `λ` principal: `L = K`, `H = 0`, `B = A`, `μ = λ`, `π = id`. -/
def of_principal (pol : Polarization A) (h : pol.degree = 1) : PolarizationReduction pol K where
  H := ⊥
  H_le := bot_le
  isotropic := by sorry
  card_sq := by sorry
  B := A.baseChange K
  mu := pol.baseChange K
  proj := 𝟙 _
  isIsogeny := by sorry
  ker_eq := by sorry
  comp_eq := by sorry

/-- Opaque: the base change of `(H, B, μ, π)` to a further extension `L'/L`. -/
def baseChange (R : PolarizationReduction pol L) (L' : Type u) [Field L'] [Algebra K L']
    [Algebra L L'] [IsScalarTower K L L'] : PolarizationReduction pol L' := sorry

/-- A further finite extension over which `B` has a semiabelian model (semistable reduction,
R11.3). -/
theorem semistable [NumberField L] (R : PolarizationReduction pol L) :
    ∃ (L' : Type u) (_ : Field L') (_ : NumberField L') (_ : Algebra L L'),
      FiniteDimensional L L' ∧ HasSemiabelianModel (R.B.baseChange L') := by
  sorry

end PolarizationReduction

/-- R28.3/reduction-to-a-principally-polarized-semiabelian-model: every polarized `(A, λ)` over a
number field has a polarization reduction over some finite extension. -/
theorem exists_polarizationReduction {K : Type u} [Field K] [NumberField K] {A : AbelianVariety K}
    (pol : Polarization A) :
    ∃ (L : Type u) (_ : Field L) (_ : NumberField L) (_ : Algebra K L),
      FiniteDimensional K L ∧ Nonempty (PolarizationReduction pol L) := by
  sorry

section PolarizationReductionTests

variable {K : Type u} [Field K] {A : AbelianVariety K} {L : Type u} [Field L] [Algebra K L]

/-- Unit test `PolarizationReduction.degree_square_root`: for `A` of dimension one (an elliptic
curve) and `λ = n λ_E` (the group of homomorphisms is written multiplicatively), `deg λ = n²` and
`π` has degree `n`. -/
example (hA : A.dim = 1) (pol₀ pol : Polarization A) (h₀ : pol₀.degree = 1) (n : ℕ) (hn : 0 < n)
    (hpol : pol.toHom = pol₀.toHom ^ n) (R : PolarizationReduction pol L) :
    pol.degree = n ^ 2 ∧ isogenyDegree R.proj = n := by
  sorry

/-- Unit test `PolarizationReduction.principal_degenerate`: for `λ` principal, `H = 0`, `π = id`
and no field extension is needed. -/
example (pol : Polarization A) (h : pol.degree = 1) :
    (PolarizationReduction.of_principal pol h).H = ⊥ ∧
      isogenyDegree (PolarizationReduction.of_principal pol h).proj = 1 := by
  refine ⟨rfl, ?_⟩
  sorry

/-- Unit test `PolarizationReduction.not_whole_kernel`: for `λ = n λ_E` with `n > 1`, the whole
kernel `E[n]` is not isotropic and no reduction has `H = ker λ`. -/
example (hA : A.dim = 1) (pol₀ pol : Polarization A) (h₀ : pol₀.degree = 1) (n : ℕ) (hn : 1 < n)
    (hpol : pol.toHom = pol₀.toHom ^ n) (R : PolarizationReduction pol L) :
    R.H ≠ (pointsMap (pol.baseChange L).toHom).ker := by
  sorry

/-- Unit test `PolarizationReduction.field_extension_needed`: for `E/ℚ` with irreducible mod-`l`
representation and `λ = l λ_E`, there is no reduction over `ℚ`. -/
example (E : AbelianVariety ℚ) (hE : E.dim = 1) (pol₀ pol : Polarization E)
    (h₀ : pol₀.degree = 1) (l : ℕ) [Fact l.Prime] (hpol : pol.toHom = pol₀.toHom ^ l)
    (hirr : ∀ M : Submodule ℤ_[l] (TateModule E l), (∀ σ, ∀ x ∈ M, tateRep E l σ x ∈ M) →
      Ideal.span {(l : ℤ_[l])} • ⊤ ≤ M → M = Ideal.span {(l : ℤ_[l])} • ⊤ ∨ M = ⊤) :
    IsEmpty (PolarizationReduction pol ℚ) := by
  sorry

/-- Unit test `PolarizationReduction.weil_pairing_compatibility`: `e^μ(π x, π y) = e^λ(x, y)` on
`T_l(A_L)` (Milne, Abelian Varieties, Prop. 13.2(b)). -/
example {pol : Polarization A} (R : PolarizationReduction pol L) (l : ℕ) [Fact l.Prime]
    (x y : TateModule (A.baseChange L) l) :
    weilPairing R.mu l (tateMap R.proj l x) (tateMap R.proj l y) =
      weilPairing (pol.baseChange L) l x y := by
  sorry

end PolarizationReductionTests

/-- `A` has good reduction at the finite place `v`: `A_{K_v}` extends to an abelian scheme (a
proper semiabelian scheme) over `𝓞_v`. -/
def HasGoodReductionAt {K : Type u} [Field K] [NumberField K] (A : AbelianVariety K)
    (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ (g : ℕ) (𝒜 : SemiabelianScheme (Spec (.of (v.adicCompletionIntegers K))) g),
    IsProper 𝒜.toOver.hom ∧
      Nonempty (𝒜.genericFibre (v.adicCompletion K) ≅ (A.baseChange (v.adicCompletion K)).toOver)

/-- Good reduction at every finite place outside `S`; the infinite places play no role. -/
def HasGoodReductionOutside {K : Type u} [Field K] [NumberField K] (A : AbelianVariety K)
    (S : Set (HeightOneSpectrum (𝓞 K))) : Prop :=
  ∀ v ∉ S, HasGoodReductionAt A v

/-- The places of `K'` above a set `S` of places of `K`. -/
def placesAbove {K K' : Type u} [Field K] [NumberField K] [Field K'] [NumberField K']
    [Algebra K K'] (S : Set (HeightOneSpectrum (𝓞 K))) : Set (HeightOneSpectrum (𝓞 K')) :=
  {w | ∃ v ∈ S, w.asIdeal.comap (algebraMap (𝓞 K) (𝓞 K')) = v.asIdeal}

/-- R28.1/principal-polarization-after-a-uniform-extension-and-finiteness-transfer: there is a
finite Galois `K'/K`, depending only on `K`, `S`, `g`, `d`, such that (i) for every `B` of
dimension `g` with good reduction outside `S` and every polarization `μ` of degree `d`, `B_{K'}`
is semistable and every `H ⊆ ker(μ_{K'})` maximal isotropic for `e^μ` gives a polarization
reduction over `K'` whose target is semistable with good reduction outside the places above `S`
(that `ker μ` is constant over `K'` is left out); and (ii) a set of such `(B, μ)` whose reductions
lie in finitely many `K'`-classes is finite up to `K`-isomorphism. -/
theorem principal_polarization_uniform_extension (K : Type u) [Field K] [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (g d : ℕ) (hg : 1 ≤ g) (hd : 1 ≤ d) :
    ∃ (K' : Type u) (_ : Field K') (_ : NumberField K') (_ : Algebra K K'),
      FiniteDimensional K K' ∧ IsGalois K K' ∧
      (∀ (B : AbelianVariety K) (pol' : Polarization B), B.dim = g →
        HasGoodReductionOutside B S → pol'.degree = d →
        HasSemiabelianModel (B.baseChange K') ∧
        ∀ H : AddSubgroup (geometricPoints (B.baseChange K')),
          ∀ hH : H ≤ (pointsMap (pol'.baseChange K').toHom).ker,
          (∀ x y (hx : x ∈ H) (hy : y ∈ H),
            (pol'.baseChange K').kernelPairing ⟨x, hH hx⟩ ⟨y, hH hy⟩ = 1) →
          Nat.card H ^ 2 = d →
          ∃ R : PolarizationReduction pol' K', R.H = H ∧ HasSemiabelianModel R.B ∧
            HasGoodReductionOutside R.B
              (placesAbove (K := K) (K' := K') (S : Set (HeightOneSpectrum (𝓞 K))))) ∧
      ∀ 𝒮 : Set (Σ B : AbelianVariety K, Polarization B),
        (∀ x ∈ 𝒮, x.1.dim = g ∧ HasGoodReductionOutside x.1 S ∧ x.2.degree = d) →
        FiniteUpTo PolarizedIso (fun y : Σ B' : AbelianVariety K', Polarization B' =>
          ∃ x ∈ 𝒮, ∃ R : PolarizationReduction x.2 K', y = ⟨R.B, R.mu⟩) →
        FiniteUpTo PolarizedIso (· ∈ 𝒮) := by
  sorry

/-! ## R28.4 Semisimplicity and the Tate isogeny theorem -/

/-! ### R28.4/quaternion-construction-of-an-invariant-maximal-isotropic-subspace (Zarhin) -/

namespace QuaternionIsotropic

/-- The `4 × 4` matrix of the packet, `v = [[a, -b, -c, -d], [b, a, d, -c], [c, -d, a, b],
[d, c, -b, a]]` in the basis `1, i, j, k` (it is the matrix of right multiplication by
`a + bi + cj + dk`; left multiplication has the same `v vᵀ`). -/
def quatMatrix {R : Type*} [CommRing R] (a b c d : R) : Matrix (Fin 4) (Fin 4) R :=
  !![a, -b, -c, -d; b, a, d, -c; c, -d, a, b; d, c, -b, a]

/-- `v vᵀ = vᵀ v = (a² + b² + c² + d²) · 1`. -/
theorem quatMatrix_mul_transpose {R : Type*} [CommRing R] (a b c d : R) :
    quatMatrix a b c d * (quatMatrix a b c d).transpose = (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) • 1 ∧
      (quatMatrix a b c d).transpose * quatMatrix a b c d =
        (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) • 1 := by
  constructor <;>
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp [quatMatrix, Matrix.mul_apply, Fin.sum_univ_four] <;> ring

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- A `4 × 4` matrix acting on `V^4 = V ⊗ k^4` through the second factor. -/
def matrixAct (v : Matrix (Fin 4) (Fin 4) k) : (Fin 4 → V) →ₗ[k] (Fin 4 → V) :=
  LinearMap.pi fun i => ∑ j, v i j • LinearMap.proj j

/-- The orthogonal-sum form on `V^8 = V^4 × V^4`. -/
def sumForm (e : LinearMap.BilinForm k V) :
    LinearMap.BilinForm k ((Fin 4 → V) × (Fin 4 → V)) :=
  ∑ i : Fin 4,
    (e.compl₁₂ ((LinearMap.proj i).comp (LinearMap.fst k _ _))
        ((LinearMap.proj i).comp (LinearMap.fst k _ _)) +
      e.compl₁₂ ((LinearMap.proj i).comp (LinearMap.snd k _ _))
        ((LinearMap.proj i).comp (LinearMap.snd k _ _)))

/-- `W₁ = {(x, v x) : x ∈ W^4} ⊕ {(y, -v y) : y ∈ (W^⊥)^4} ⊆ V^4 × V^4`. -/
def subspace (e : LinearMap.BilinForm k V) (v : Matrix (Fin 4) (Fin 4) k)
    (W : Submodule k V) : Submodule k ((Fin 4 → V) × (Fin 4 → V)) :=
  (Submodule.pi Set.univ fun _ => W).map (LinearMap.prod LinearMap.id (matrixAct v)) ⊔
    (Submodule.pi Set.univ fun _ => LinearMap.BilinForm.orthogonal e W).map
      (LinearMap.prod LinearMap.id (-matrixAct v))

/-- `W₁` is isotropic for the orthogonal-sum form. -/
theorem subspace_isotropic (e : LinearMap.BilinForm k V) (he : LinearMap.BilinForm.IsAlt e)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * v.transpose = -1) (W : Submodule k V) :
    ∀ x ∈ subspace e v W, ∀ y ∈ subspace e v W, sumForm e x y = 0 := by
  sorry

/-- `dim W₁ = 4 dim V`; hence `W₁` is maximal isotropic. -/
theorem finrank_subspace [FiniteDimensional k V] (e : LinearMap.BilinForm k V)
    (he : LinearMap.BilinForm.IsAlt e) (hnd : LinearMap.BilinForm.Nondegenerate e)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * v.transpose = -1) (W : Submodule k V) :
    Module.finrank k (subspace e v W) = 4 * Module.finrank k V ∧
      IsLagrangian (sumForm e) (subspace e v W) := by
  sorry

/-- The diagonal action on `V^8`. -/
def diagonal {π : Type*} [Monoid π] (ρ : Representation k π V) (σ : π) :
    ((Fin 4 → V) × (Fin 4 → V)) →ₗ[k] ((Fin 4 → V) × (Fin 4 → V)) :=
  (LinearMap.pi fun i => (ρ σ).comp (LinearMap.proj i)).prodMap
    (LinearMap.pi fun i => (ρ σ).comp (LinearMap.proj i))

/-- For a group acting by similitudes of `e`, `W₁` is invariant when `W` is. -/
theorem subspace_invariant {π : Type*} [Group π] (ρ : Representation k π V)
    (e : LinearMap.BilinForm k V) (c : π → k) (hc : ∀ σ, c σ ≠ 0)
    (hρ : ∀ σ x y, e (ρ σ x) (ρ σ y) = c σ * e x y) (v : Matrix (Fin 4) (Fin 4) k)
    (W : Submodule k V) (hW : ∀ σ, ∀ x ∈ W, ρ σ x ∈ W) :
    ∀ σ, ∀ x ∈ subspace e v W, diagonal ρ σ x ∈ subspace e v W := by
  sorry

/-- `(s, t) ↦ ½ (s + v⁻¹ t)`. -/
def recoverMap [Invertible (2 : k)] (v : Matrix (Fin 4) (Fin 4) k) :
    ((Fin 4 → V) × (Fin 4 → V)) →ₗ[k] (Fin 4 → V) :=
  ⅟(2 : k) • (LinearMap.fst k _ _ + (matrixAct v⁻¹).comp (LinearMap.snd k _ _))

/-- `(s, t) ↦ ½ (s + v⁻¹ t)` maps `W₁` onto `W^4`. -/
theorem map_recover_subspace [Invertible (2 : k)] (e : LinearMap.BilinForm k V)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * v.transpose = -1) (W : Submodule k V) :
    (subspace e v W).map (recoverMap v) = Submodule.pi Set.univ fun _ => W := by
  sorry

/-- For `V = V_l(A)` with the Weil pairing of a principal polarization, `V^8 ≅ V_l(A^8)`
equivariantly, the orthogonal-sum form being the Weil pairing of the product polarization. -/
theorem subspace_tateModule {K : Type u} [Field K] {A : AbelianVariety K} (pol : Polarization A)
    (hpol : pol.degree = 1) (l : ℕ) [Fact l.Prime] :
    ∃ e : RationalTateModule (abelianPower A 8) l ≃ₗ[ℚ_[l]]
        ((Fin 4 → RationalTateModule A l) × (Fin 4 → RationalTateModule A l)),
      (∀ σ x, e (rationalTateRep (abelianPower A 8) l σ x) =
        diagonal (rationalTateRep A l) σ (e x)) ∧
      ∀ x y, rationalWeilPairing (pol.pow 8) l x y =
        sumForm (rationalWeilPairing pol l) (e x) (e y) := by
  sorry

/-- Unit test `QuaternionIsotropic.quatMatrix_mul_transpose_example`: for `(2, 3, 5, 7)` over `ℤ`,
`v vᵀ = 87 · 1`. -/
example : quatMatrix (2 : ℤ) 3 5 7 * (quatMatrix (2 : ℤ) 3 5 7).transpose = (87 : ℤ) • 1 := by
  have := (quatMatrix_mul_transpose (2 : ℤ) 3 5 7).1
  norm_num at this ⊢
  exact this

/-- Unit test `QuaternionIsotropic.subspace_bot`: `W = 0` gives the graph of `-v`, `W = V` the
graph of `v`. -/
example (e : LinearMap.BilinForm k V) (hnd : LinearMap.BilinForm.Nondegenerate e)
    (v : Matrix (Fin 4) (Fin 4) k) :
    subspace e v ⊥ = LinearMap.range (LinearMap.prod LinearMap.id (-matrixAct v)) ∧
      subspace e v ⊤ = LinearMap.range (LinearMap.prod LinearMap.id (matrixAct v)) := by
  sorry

/-- Unit test `QuaternionIsotropic.subspace_of_isotropic_line`: for `dim V = 2` and `W` a line
(`W^⊥ = W`), `W₁ = W^4 × W^4`, an `8`-dimensional isotropic subspace. -/
example (e : LinearMap.BilinForm k V) (he : LinearMap.BilinForm.IsAlt e)
    (hnd : LinearMap.BilinForm.Nondegenerate e) (hV : Module.finrank k V = 2)
    (v : Matrix (Fin 4) (Fin 4) k) (hv : v * v.transpose = -1) (W : Submodule k V)
    (hW : Module.finrank k W = 1) :
    subspace e v W = (Submodule.pi Set.univ fun _ => W).prod (Submodule.pi Set.univ fun _ => W) ∧
      Module.finrank k (subspace e v W) = 8 := by
  sorry

/-- Unit test `QuaternionIsotropic.not_isotropic_identity`: with `v = 1` (`v vᵀ = +1`) the graph
`{(x, x)}` is not isotropic for `e ≠ 0`: `e((x, x), (x', x')) = 2 e(x, x')`. -/
example [Invertible (2 : k)] (e : LinearMap.BilinForm k V) (he : e ≠ 0) :
    ¬ ∀ x y : Fin 4 → V, sumForm e (x, x) (y, y) = 0 := by
  sorry

end QuaternionIsotropic

section R28_4

variable {K : Type u} [Field K] [NumberField K]

/-- R28.4/semisimplicity-and-the-tate-homomorphism-comparison (Satz 3): `π` acts semisimply on
`V_l(A) = T_l(A) ⊗ ℚ_l`, for every prime `l`. -/
theorem satz_3_semisimplicity (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    RationalTateSemisimple A l := by
  sorry

/-- R28.4/semisimplicity-and-the-tate-homomorphism-comparison (Satz 4):
`End_K(A) ⊗_ℤ ℤ_l → End_π(T_l(A))` is an isomorphism. -/
theorem satz_4_tate_comparison (A : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    Function.Injective (endTateComparison A l) ∧
      ∀ φ, φ ∈ Subalgebra.centralizer ℤ_[l] (Set.range (tateRep A l)) ↔
        φ ∈ LinearMap.range (endTateComparison A l) := by
  sorry

/-- R28.4/hom-comparison-for-pairs-and-the-isogeny-criterion (Korollar 1):
`Hom_K(A₁, A₂) ⊗ ℤ_l ≅ Hom_π(T_l(A₁), T_l(A₂))`, and `⊗ ℚ_l ≅ Hom_π(V_l(A₁), V_l(A₂))`. -/
theorem hom_comparison (A₁ A₂ : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    (Function.Injective (homTateComparison A₁ A₂ l) ∧
      ∀ φ : TateModule A₁ l →ₗ[ℤ_[l]] TateModule A₂ l,
        (∀ σ, φ ∘ₗ tateRep A₁ l σ = tateRep A₂ l σ ∘ₗ φ) ↔
          φ ∈ LinearMap.range (homTateComparison A₁ A₂ l)) ∧
    (Function.Injective (rationalHomTateComparison A₁ A₂ l) ∧
      ∀ φ : RationalTateModule A₁ l →ₗ[ℚ_[l]] RationalTateModule A₂ l,
        (∀ σ, φ ∘ₗ rationalTateRep A₁ l σ = rationalTateRep A₂ l σ ∘ₗ φ) ↔
          φ ∈ LinearMap.range (rationalHomTateComparison A₁ A₂ l)) := by
  sorry

/-- R28.4/isogeny-criterion-by-rational-tate-modules-and-local-factors (Korollar 2): equivalent
are (i) `A₁`, `A₂` isogenous over `K`; (ii) `V_l(A₁) ≅ V_l(A₂)` as `π`-modules; (iii)
`L_v(A₁, s) = L_v(A₂, s)` for almost all `v`; (iv) for all `v`. -/
theorem isogeny_criterion (A₁ A₂ : AbelianVariety K) (l : ℕ) [Fact l.Prime] :
    List.TFAE
      [∃ f : A₁ ⟶ A₂, AbelianVariety.IsIsogeny f,
        Nonempty ((rationalTateRep A₁ l).asModule ≃ₗ[MonoidAlgebra ℚ_[l]
          (Field.absoluteGaloisGroup K)] (rationalTateRep A₂ l).asModule),
        ∀ᶠ v in Filter.cofinite, localFactor A₁ v = localFactor A₂ v,
        ∀ v, localFactor A₁ v = localFactor A₂ v] := by
  sorry

/-- R28.4/finiteness-of-polarized-varieties-with-all-tate-modules-isomorphic (Korollar 3):
finitely many isomorphism classes of `d`-fold polarized `B/K` with `T_l(B) ≅ T_l(A)` as `π`-modules
for every prime `l`. -/
theorem finiteness_with_fixed_tate_modules (A : AbelianVariety K) (d : ℕ) (hd : 0 < d) :
    FiniteUpTo PolarizedIso (fun x : Σ B : AbelianVariety K, Polarization B =>
      x.2.degree = d ∧ ∀ (l : ℕ) [Fact l.Prime], Nonempty ((tateRep A l).asModule ≃ₗ[MonoidAlgebra
        ℤ_[l] (Field.absoluteGaloisGroup K)] (tateRep x.1 l).asModule)) := by
  sorry

/-- R28.4/minus-one-is-a-sum-of-four-squares-in-Q_l: for every prime `l` there are
`a, b, c, d ∈ ℤ_l` with `a² + b² + c² + d² = -1`. -/
theorem neg_one_eq_sum_four_squares (l : ℕ) [Fact l.Prime] :
    ∃ a b c d : ℤ_[l], a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2 = -1 := by
  sorry

/-- The image of `u ∈ End_K(A) ⊗ ℚ_l` in `End(V_l(A))`. -/
abbrev endAction (A : AbelianVariety K) (l : ℕ) [Fact l.Prime]
    (u : TensorProduct ℤ (AbelianVariety.End A) ℚ_[l]) :
    Module.End ℚ_[l] (RationalTateModule A l) :=
  rationalEndTateComparison A l u

/-- R28.4/invariant-maximal-isotropic-subspace-is-the-image-of-an-idempotent (Zarhin's lemma): for
`A` principally polarized with a semiabelian model and `W ⊆ V_l(A)` `π`-invariant and maximal
isotropic for the Weil pairing, `W = u(V_l(A))` for some `u ∈ End_K(A) ⊗ ℚ_l`, and
`W = e(V_l(A))` for an idempotent `e`. -/
theorem zarhin_idempotent {g : ℕ} (A : SemiabelianModel K g)
    (pol : Polarization A.abelianVariety) (hpol : pol.degree = 1) (l : ℕ) [Fact l.Prime]
    (W : Submodule ℚ_[l] (RationalTateModule A.abelianVariety l))
    (hWst : ∀ σ, ∀ x ∈ W, rationalTateRep A.abelianVariety l σ x ∈ W)
    (hW : IsLagrangian (rationalWeilPairing pol l) W) :
    (∃ u, LinearMap.range (endAction A.abelianVariety l u) = W) ∧
      ∃ e, IsIdempotentElem e ∧ LinearMap.range (endAction A.abelianVariety l e) = W := by
  sorry

/-- R28.4/every-invariant-subspace-is-the-image-of-an-idempotent: for `A` principally polarized
with a semiabelian model, every `π`-invariant `W ⊆ V_l(A)` is `e(V_l(A))` for an idempotent
`e ∈ End_K(A) ⊗ ℚ_l`; the same holds for `A × A`. -/
theorem invariant_subspace_eq_idempotent_range {g : ℕ} (A : SemiabelianModel K g)
    (pol : Polarization A.abelianVariety) (hpol : pol.degree = 1) (l : ℕ) [Fact l.Prime] :
    (∀ W : Submodule ℚ_[l] (RationalTateModule A.abelianVariety l),
      (∀ σ, ∀ x ∈ W, rationalTateRep A.abelianVariety l σ x ∈ W) →
      ∃ e, IsIdempotentElem e ∧ LinearMap.range (endAction A.abelianVariety l e) = W) ∧
    (∀ W : Submodule ℚ_[l]
        (RationalTateModule (AbelianVariety.prod A.abelianVariety A.abelianVariety) l),
      (∀ σ, ∀ x ∈ W, rationalTateRep (AbelianVariety.prod A.abelianVariety A.abelianVariety) l
        σ x ∈ W) →
      ∃ e, IsIdempotentElem e ∧
        LinearMap.range (endAction (AbelianVariety.prod A.abelianVariety A.abelianVariety) l e) =
          W) := by
  sorry

end R28_4

/-! ## R28.5 Shafarevich finiteness -/

section R28_5

variable {K : Type u} [Field K] [NumberField K]

/-- R28.5/finiteness-of-isogeny-classes-with-good-reduction-outside-S (Satz 5): finitely many
isogeny classes of abelian varieties over `K` of dimension `g` with good reduction outside `S`. -/
theorem satz_5_finiteness_of_isogeny_classes (S : Finset (HeightOneSpectrum (𝓞 K))) (g : ℕ) :
    FiniteUpTo (fun A B : AbelianVariety K => ∃ f : A ⟶ B, AbelianVariety.IsIsogeny f)
      (fun A => A.dim = g ∧ HasGoodReductionOutside A S) := by
  sorry

/-- Opaque (AbelianSchemesAndArithmeticModuli A6, R01.6): `P_h(T) = det(T - F_p | Λ^h Ind_π^π̃
T_l(A))`, with integer coefficients and independent of the auxiliary `l ∤ p n`. -/
def inducedFrobeniusCharpoly (A : AbelianVariety K) (p h : ℕ) : Polynomial ℤ := sorry

/-- R28.5/weil-bounds-on-exterior-powers-and-the-choice-of-N: with `n` the product of the primes
at which `K/ℚ` ramifies or `A` has bad reduction at some place above, and `p ∤ n`, the roots of
`P_h` have absolute value `p^{h/2}` (Weil), and there is `N ≥ max(2, n p)` such that no prime
`l > N` divides `P_h(± p^j)` for `0 ≤ h ≤ 2gm`, `0 ≤ j ≤ gm`, `j ≠ h/2`, `m = [K : ℚ]`. -/
theorem weil_bounds_choice_of_N (A : AbelianVariety K) (g : ℕ) (hA : A.dim = g) (n : ℕ)
    (hsq : Squarefree n)
    (hn : ∀ q : ℕ, q.Prime → (q ∣ n ↔ ((q : ℤ) ∣ discr K ∨
      ∃ v : HeightOneSpectrum (𝓞 K), (q : 𝓞 K) ∈ v.asIdeal ∧ ¬ HasGoodReductionAt A v)))
    (p : ℕ) (hp : p.Prime) (hpn : ¬ p ∣ n) :
    (∀ h ≤ 2 * g * Module.finrank ℚ K,
      ∀ z ∈ ((inducedFrobeniusCharpoly A p h).map (Int.castRingHom ℂ)).roots,
        ‖z‖ = (p : ℝ) ^ ((h : ℝ) / 2)) ∧
    ∃ N : ℕ, 2 ≤ N ∧ n * p ≤ N ∧ ∀ l : ℕ, l.Prime → N < l →
      ∀ h ≤ 2 * g * Module.finrank ℚ K, ∀ j ≤ g * Module.finrank ℚ K, 2 * j ≠ h →
        ∀ ε : ℤ, (ε = 1 ∨ ε = -1) →
          ¬ (l : ℤ) ∣ (inducedFrobeniusCharpoly A p h).eval (ε * (p : ℤ) ^ j) := by
  sorry

/-- `χ(σ) = det(σ | Ind_π^π̃ W)` for a `π`-stable `W ⊆ B[l](K̄)`: the character of `π̃` on the
line `Λ^{mh}(Ind_π^π̃ W)`. -/
def torsionDeterminantCharacter {B : AbelianVariety K} {l : ℕ} [Fact l.Prime]
    (W : Submodule (ZMod l) (TorsionPoints B l)) (hW : ∀ σ, ∀ x ∈ W, torsionRep B l σ x ∈ W)
    (σ : Field.absoluteGaloisGroup ℚ) : ZMod l :=
  LinearMap.det (inducedRep (restrictRep (torsionRep B l) W hW) σ)

/-- R28.5/twisted-determinant-character-is-unramified-outside-l: for `B₁` semistable everywhere
and `W = G(K̄) ⊆ B₁[l](K̄)` `π`-stable, `χ ε^h` is unramified at every prime `p' ≠ l`. -/
theorem twisted_determinant_unramified (B₁ : AbelianVariety K) (hB₁ : HasSemiabelianModel B₁)
    (l : ℕ) [Fact l.Prime] (W : Submodule (ZMod l) (TorsionPoints B₁ l))
    (hW : ∀ σ, ∀ x ∈ W, torsionRep B₁ l σ x ∈ W) (h : ℕ) (hh : Nat.card W = l ^ h)
    (p' : ℕ) (hp' : p'.Prime) (hp'l : p' ≠ l) :
    ∀ τ ∈ inertiaAt p',
      torsionDeterminantCharacter W hW τ * (inductionSign K τ : ZMod l) ^ h = 1 := by
  sorry

/-- The mod-`l` cyclotomic character `χ₀ : Gal(ℚ̄/ℚ) → (ℤ/l)^×`. -/
def modCyclotomicChar (l : ℕ) [Fact l.Prime] : Field.absoluteGaloisGroup ℚ → (ZMod l)ˣ :=
  fun σ => modularCyclotomicCharacter (n := l) (AlgebraicClosure ℚ) (by sorry) σ.toRingEquiv

/-- R28.5/mod-l-characters-unramified-outside-l-are-cyclotomic-powers: a continuous (open kernel)
`ψ : Gal(ℚ̄/ℚ) → (ℤ/l)^×` unramified at every `p' ≠ l` is a power of `χ₀`. -/
theorem mod_l_character_eq_cyclotomic_pow (l : ℕ) [Fact l.Prime]
    (ψ : Field.absoluteGaloisGroup ℚ →* (ZMod l)ˣ)
    (hψ : IsOpen ((ψ.ker : Subgroup (Field.absoluteGaloisGroup ℚ)) :
      Set (Field.absoluteGaloisGroup ℚ)))
    (hunr : ∀ p' : ℕ, p'.Prime → p' ≠ l → ∀ τ ∈ inertiaAt p', ψ τ = 1) :
    ∃ k : ℕ, ∀ σ, ψ σ = modCyclotomicChar l σ ^ k := by
  sorry

/-- Opaque (R01.6): `G(K̄) ⊆ B₁[l](K̄)` for an isogeny `φ : B₁ → B₂` whose kernel `G` is killed by
`l`. -/
def kernelTorsion {B₁ B₂ : AbelianVariety K} (φ : B₁ ⟶ B₂) (l : ℕ) [Fact l.Prime] :
    Submodule (ZMod l) (TorsionPoints B₁ l) := sorry

/-- `π`-stability of `G(K̄)`. -/
theorem kernelTorsion_stable {B₁ B₂ : AbelianVariety K} (φ : B₁ ⟶ B₂) (l : ℕ) [Fact l.Prime] :
    ∀ σ, ∀ x ∈ kernelTorsion φ l, torsionRep B₁ l σ x ∈ kernelTorsion φ l := by
  sorry

/-- R28.5/determinant-character-of-the-kernel-computed-by-raynaud: for `B₁, B₂` isogenous to `A`
with semistable reduction and `φ : B₁ → B₂` of degree `l^h`, `l > N`, with kernel killed by `l`:
`χ ε^h = χ₀^d`, where `l^d = # s^*(Ω¹_{G/𝓞_K})` and `0 ≤ d ≤ g m`. -/
theorem raynaud_determinant_character (A : AbelianVariety K) (g : ℕ) (hA : A.dim = g)
    (hAss : HasSemiabelianModel A) :
    ∃ N : ℕ, ∀ (B₁ B₂ : SemiabelianModel K g) (φ : B₁.abelianVariety ⟶ B₂.abelianVariety),
      AbelianVariety.IsIsogeny φ → (∃ f : A ⟶ B₁.abelianVariety, AbelianVariety.IsIsogeny f) →
      ∀ (l : ℕ) [Fact l.Prime] (h : ℕ), N < l → isogenyDegree φ = l ^ h →
      (∃ ψ : B₂.abelianVariety ⟶ B₁.abelianVariety,
        φ ≫ ψ = AbelianVariety.mulBy B₁.abelianVariety (l : ℤ)) →
      ∃ d : ℕ, kernelDifferentialsCard φ = l ^ d ∧ d ≤ g * Module.finrank ℚ K ∧
        ∀ σ : Field.absoluteGaloisGroup ℚ,
          torsionDeterminantCharacter (kernelTorsion φ l) (kernelTorsion_stable φ l) σ *
              (inductionSign K σ : ZMod l) ^ h =
            ((modCyclotomicChar l σ ^ d : (ZMod l)ˣ) : ZMod l) := by
  sorry

/-- R28.5/equal-heights-along-isogenies-of-large-prime-power-degree: for `A` semistable everywhere
and `N` as in the choice of `N`, an isogeny `φ : B₁ → B₂` between varieties isogenous to `A`, of
degree a power of a prime `l > N`, preserves the height. -/
theorem equal_heights_large_prime (A : AbelianVariety K) (g : ℕ) (hA : A.dim = g)
    (hAss : HasSemiabelianModel A) :
    ∃ N : ℕ, ∀ (B₁ B₂ : SemiabelianModel K g) (φ : B₁.abelianVariety ⟶ B₂.abelianVariety),
      AbelianVariety.IsIsogeny φ → (∃ f : A ⟶ B₁.abelianVariety, AbelianVariety.IsIsogeny f) →
      ∀ l : ℕ, l.Prime → N < l → (∃ h, isogenyDegree φ = l ^ h) →
        modularHeight B₁ = modularHeight B₂ := by
  sorry

/-- R28.5/finiteness-of-pi-invariant-lattices-from-semisimplicity: for a free `ℤ_l`-module `T` of
finite rank with a `π`-action such that `V = T ⊗ ℚ_l` is semisimple, the `π`-stable lattices in
`V` fall into finitely many isomorphism classes; two lattices are isomorphic as `π`-modules when a
`π`-equivariant automorphism of `V` carries one to the other. -/
theorem finiteness_of_invariant_lattices (l : ℕ) [Fact l.Prime] {π T : Type*} [Group π]
    [AddCommGroup T] [Module ℤ_[l] T] [Module.Free ℤ_[l] T] [Module.Finite ℤ_[l] T]
    (ρ : Representation ℤ_[l] π T)
    (hss : IsSemisimpleModule (MonoidAlgebra ℚ_[l] π)
      (Representation.asModule (k := ℚ_[l]) (V := TensorProduct ℤ_[l] ℚ_[l] T)
        { toFun := fun σ => LinearMap.baseChange ℚ_[l] (ρ σ)
          map_one' := by simp [Module.End.one_eq_id]
          map_mul' := fun σ τ => by simp [Module.End.mul_eq_comp, LinearMap.baseChange_comp] })) :
    FiniteUpTo
      (fun L L' : Submodule ℤ_[l] (TensorProduct ℤ_[l] ℚ_[l] T) =>
        ∃ e : TensorProduct ℤ_[l] ℚ_[l] T ≃ₗ[ℚ_[l]] TensorProduct ℤ_[l] ℚ_[l] T,
          (∀ σ x, e (LinearMap.baseChange ℚ_[l] (ρ σ) x) = LinearMap.baseChange ℚ_[l] (ρ σ) (e x)) ∧
            L.map (e.toLinearMap.restrictScalars ℤ_[l]) = L')
      (fun L => Submodule.IsLattice ℚ_[l] L ∧
        ∀ σ, ∀ x ∈ L, LinearMap.baseChange ℚ_[l] (ρ σ) x ∈ L) := by
  sorry

/-- R28.5/bounded-small-prime-parts-of-height-differences-in-an-isogeny-class: for `A` semistable
everywhere and a fixed prime `l`, as `B` ranges over the varieties isogenous to `A`, the exponent
of `l` in `exp(2[K:ℚ](h(B) - h(A)))` takes only finitely many values. -/
theorem bounded_small_prime_parts {g : ℕ} (A : SemiabelianModel K g) (l : ℕ) (hl : l.Prime) :
    {r : ℤ | ∃ (B : SemiabelianModel K g) (q : ℚ),
      (∃ f : A.abelianVariety ⟶ B.abelianVariety, AbelianVariety.IsIsogeny f) ∧
      (q : ℝ) = Real.exp (2 * Module.finrank ℚ K * (modularHeight B - modularHeight A)) ∧
      padicValRat l q = r}.Finite := by
  sorry

/-- R28.5/shafarevich-finiteness (Satz 6): finitely many isomorphism classes of `d`-fold polarized
abelian varieties over `K` of dimension `g` with good reduction outside `S`. -/
theorem satz_6_shafarevich (S : Finset (HeightOneSpectrum (𝓞 K))) (g d : ℕ) (hd : 0 < d) :
    FiniteUpTo PolarizedIso (fun x : Σ A : AbelianVariety K, Polarization A =>
      x.2.degree = d ∧ x.1.dim = g ∧ HasGoodReductionOutside x.1 S) := by
  sorry

/-- R28.5/shafarevich-finiteness-without-polarization: finitely many isomorphism classes of
abelian varieties over `K` of dimension `g` with good reduction outside `S`. -/
theorem shafarevich_without_polarization (S : Finset (HeightOneSpectrum (𝓞 K))) (g : ℕ)
    (hg : 1 ≤ g) :
    FiniteUpTo (fun A B : AbelianVariety K => Nonempty (A ≅ B))
      (fun A => A.dim = g ∧ HasGoodReductionOutside A S) := by
  sorry

end R28_5

/-- A smooth projective geometrically connected curve over `K`: here smooth, proper and
geometrically integral of relative dimension one. -/
structure SmoothProperCurve (K : Type u) [Field K] where
  /-- The curve `X → Spec K`. -/
  toOver : Over (Spec (.of K))
  [smooth : SmoothOfRelativeDimension 1 toOver.hom]
  [isProper : IsProper toOver.hom]
  [geometricallyIntegral : GeometricallyIntegral toOver.hom]

namespace SmoothProperCurve

variable {K : Type u} [Field K]

/-- Opaque (Tau Ceti has `TauCeti.genus` of a function field, not yet of a curve): the genus. -/
def genus (X : SmoothProperCurve K) : ℕ := sorry

/-- `X` has good reduction at `v`: `X_{K_v}` extends to a smooth proper curve over `𝓞_v`. -/
def HasGoodReductionAt [NumberField K] (X : SmoothProperCurve K) (v : HeightOneSpectrum (𝓞 K)) :
    Prop :=
  ∃ 𝒳 : Over (Spec (.of (v.adicCompletionIntegers K))), Smooth 𝒳.hom ∧ IsProper 𝒳.hom ∧
    Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom
        (algebraMap (v.adicCompletionIntegers K) (v.adicCompletion K))))).obj 𝒳 ≅
      (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap K (v.adicCompletion K))))).obj
        X.toOver)

end SmoothProperCurve

/-- R28.5/finiteness-of-curves-of-genus-at-least-two-with-good-reduction-outside-S (Korollar 1 to
Satz 6): finitely many isomorphism classes of curves over `K` of genus `g ≥ 2` with good reduction
outside `S`. The proof is Torelli, an imported gap. -/
theorem finiteness_of_curves (K : Type u) [Field K] [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (g : ℕ) (hg : 2 ≤ g) :
    FiniteUpTo (fun X Y : SmoothProperCurve K => Nonempty (X.toOver ≅ Y.toOver))
      (fun X => X.genus = g ∧ ∀ v ∉ S, X.HasGoodReductionAt v) := by
  sorry

/-- R28.5/mordell-conjecture-by-the-parshin-construction (Satz 7): a curve of genus at least two
over a number field has finitely many rational points. -/
theorem mordell_conjecture (K : Type u) [Field K] [NumberField K] (X : SmoothProperCurve K)
    (hX : 2 ≤ X.genus) : Finite (Over.mk (𝟙 (Spec (.of K))) ⟶ X.toOver) := by
  sorry

/-! ## R28.6 Interfaces for elliptic curves and automorphic cohomology -/

/-- R28.6/commutant-statement-for-almost-all-primes (Bemerkung 2, after Zarhin): for almost all
`l`, the `ℤ_l`-algebra generated by `π` in `End_{ℤ_l}(T_l(A))` is the commutant of
`End_K(A) ⊗ ℤ_l`. -/
theorem commutant_at_almost_all_primes (K : Type u) [Field K] [NumberField K]
    (A : AbelianVariety K) :
    ∀ᶠ l : ℕ in Filter.cofinite, ∀ hl : l.Prime,
      haveI : Fact l.Prime := ⟨hl⟩
      Algebra.adjoin ℤ_[l] (Set.range (tateRep A l)) =
        Subalgebra.centralizer ℤ_[l]
          (Set.range fun f : AbelianVariety.End A => tateMap (AbelianVariety.End.toHom f) l) := by
  sorry

/-- R28.6/siegel-theorem-without-diophantine-approximation (Bemerkung 1): the source gives no
precise form; the form exported here is finiteness of integral points on an integral Weierstrass
equation with `Δ ≠ 0`. -/
theorem siegel_without_approximation (W : WeierstrassCurve ℤ) (hΔ : W.Δ ≠ 0) :
    {p : ℤ × ℤ | W.toAffine.Equation p.1 p.2}.Finite := by
  sorry

section EllipticCurves

variable {K : Type u} [Field K]

/-- Opaque (Tau Ceti EllipticCurves, Layer 2, not in the pinned library): `T_l(E)` of an elliptic
Weierstrass curve. -/
def EllipticTateModule (E : WeierstrassCurve K) (l : ℕ) [Fact l.Prime] : Type u := sorry

instance (E : WeierstrassCurve K) (l : ℕ) [Fact l.Prime] : AddCommGroup (EllipticTateModule E l) :=
  sorry

instance (E : WeierstrassCurve K) (l : ℕ) [Fact l.Prime] :
    Module ℤ_[l] (EllipticTateModule E l) := sorry

/-- Opaque (Layer 2): the Galois action on `T_l(E)`. -/
def ellipticTateRep (E : WeierstrassCurve K) (l : ℕ) [Fact l.Prime] :
    Representation ℤ_[l] (Field.absoluteGaloisGroup K) (EllipticTateModule E l) := sorry

/-- Opaque (Layer 2): `T_l(f)` for `f ∈ Hom_K(E, E')`. -/
def ellipticTateMap {E E' : WeierstrassCurve K} (f : Isogeny.Hom E.toAffine E'.toAffine) (l : ℕ)
    [Fact l.Prime] : EllipticTateModule E l →ₗ[ℤ_[l]] EllipticTateModule E' l := sorry

/-- The Galois action on `V_l(E)`. -/
def ellipticRationalTateRep (E : WeierstrassCurve K) (l : ℕ) [Fact l.Prime] :
    Representation ℚ_[l] (Field.absoluteGaloisGroup K)
      (TensorProduct ℤ_[l] ℚ_[l] (EllipticTateModule E l)) where
  toFun σ := LinearMap.baseChange ℚ_[l] (ellipticTateRep E l σ)
  map_one' := by simp [Module.End.one_eq_id]
  map_mul' σ τ := by simp [Module.End.mul_eq_comp, LinearMap.baseChange_comp]

/-- Opaque (Layer 4): `a_v(E)`, the trace of Frobenius of the reduction at a place of good
reduction (`WeierstrassCurve.frobeniusTrace` of the reduced curve). -/
def ellipticTrace [NumberField K] (E : WeierstrassCurve K) (v : HeightOneSpectrum (𝓞 K)) : ℤ :=
  sorry

/-- The natural map `Hom_K(E, E') ⊗ ℤ_l → Hom(T_l(E), T_l(E'))`. -/
def ellipticHomTateComparison (E E' : WeierstrassCurve K) [E'.IsElliptic] (l : ℕ)
    [Fact l.Prime] :
    TensorProduct ℤ (Isogeny.Hom E.toAffine E'.toAffine) ℤ_[l] →ₗ[ℤ]
      (EllipticTateModule E l →ₗ[ℤ_[l]] EllipticTateModule E' l) :=
  TensorProduct.lift (LinearMap.mk₂ ℤ (fun f c => c • ellipticTateMap f l)
    (by sorry) (by sorry) (fun _ c₁ c₂ => add_smul c₁ c₂ _) (fun n _ c => smul_assoc n c _))

/-- R28.6/semisimplicity-of-the-rational-tate-module-of-an-elliptic-curve: `V_l(E)` is a
semisimple `ℚ_l[Gal(K̄/K)]`-module. -/
theorem elliptic_semisimple [NumberField K] (E : WeierstrassCurve K) [E.IsElliptic] (l : ℕ)
    [Fact l.Prime] :
    IsSemisimpleModule (MonoidAlgebra ℚ_[l] (Field.absoluteGaloisGroup K))
      (ellipticRationalTateRep E l).asModule := by
  sorry

/-- R28.6/tate-hom-comparison-for-elliptic-curves:
`Hom_K(E, E') ⊗ ℤ_l ≅ Hom_{G_K}(T_l E, T_l E')`. -/
theorem elliptic_hom_comparison [NumberField K] (E E' : WeierstrassCurve K) [E.IsElliptic]
    [E'.IsElliptic] (l : ℕ) [Fact l.Prime] :
    Function.Injective (ellipticHomTateComparison E E' l) ∧
      ∀ φ : EllipticTateModule E l →ₗ[ℤ_[l]] EllipticTateModule E' l,
        (∀ σ, φ ∘ₗ ellipticTateRep E l σ = ellipticTateRep E' l σ ∘ₗ φ) ↔
          φ ∈ LinearMap.range (ellipticHomTateComparison E E' l) := by
  sorry

/-- R28.6/isogeny-criterion-for-elliptic-curves: `E`, `E'` are `K`-isogenous iff `V_l(E) ≅ V_l(E')`
for one (equivalently every) `l`, iff `a_v(E) = a_v(E')` for almost all `v`. -/
theorem elliptic_isogeny_criterion [NumberField K] (E E' : WeierstrassCurve K) [E.IsElliptic]
    [E'.IsElliptic] (l : ℕ) [Fact l.Prime] :
    List.TFAE
      [∃ f : Isogeny.Hom E.toAffine E'.toAffine, f ≠ 0,
        Nonempty ((ellipticRationalTateRep E l).asModule ≃ₗ[MonoidAlgebra ℚ_[l]
          (Field.absoluteGaloisGroup K)] (ellipticRationalTateRep E' l).asModule),
        ∀ (l' : ℕ) [Fact l'.Prime], Nonempty ((ellipticRationalTateRep E l').asModule ≃ₗ[
          MonoidAlgebra ℚ_[l'] (Field.absoluteGaloisGroup K)]
            (ellipticRationalTateRep E' l').asModule),
        ∀ᶠ v in Filter.cofinite, ellipticTrace E v = ellipticTrace E' v] := by
  sorry

/-- R28.6/finiteness-of-the-isogeny-class-of-an-elliptic-curve: up to `K`-isomorphism, finitely
many elliptic curves are `K`-isogenous to `E`. -/
theorem elliptic_isogeny_class_finite [NumberField K] (E : WeierstrassCurve K) [E.IsElliptic] :
    FiniteUpTo (fun E₁ E₂ : WeierstrassCurve K => ∃ C : WeierstrassCurve.VariableChange K,
        C • E₁ = E₂)
      (fun E' => ∃ _ : E'.IsElliptic, ∃ f : Isogeny.Hom E.toAffine E'.toAffine, f ≠ 0) := by
  sorry

/-- R28.6/hom-to-an-isogenous-elliptic-curve-is-infinite-cyclic: if `Hom_K(E, E') ≠ 0` and
`End_K(E') = ℤ`, then `Hom_K(E, E')` is infinite cyclic, generated by some `f₀`, and
`deg (n • f₀) = n² deg f₀`. -/
theorem elliptic_hom_infinite_cyclic (E E' : WeierstrassCurve K) [E.IsElliptic] [E'.IsElliptic]
    (hne : ∃ f : Isogeny.Hom E.toAffine E'.toAffine, f ≠ 0)
    (hend : ∀ u : Isogeny.Hom E'.toAffine E'.toAffine, ∃ n : ℤ, u = n • Isogeny.Hom.id _) :
    ∃ f₀ : Isogeny.Hom E.toAffine E'.toAffine, f₀ ≠ 0 ∧
      (∀ f, ∃! n : ℤ, f = n • f₀) ∧ ∀ n : ℤ, (n • f₀).degree = n.natAbs ^ 2 * f₀.degree := by
  sorry

end EllipticCurves

end TauCeti.Faltings
