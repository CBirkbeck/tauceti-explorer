/-
This file is not the roadmap and is not exhaustive. The roadmap document README.md is definitive. These statements suggest Lean forms so that contributors and reviewers
converge on names and signatures. Proofs are left open; no implementation is claimed.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

Every geometric carrier below is from the pinned library. End0 is a tensor product
of the native endomorphism ring, not CategoryTheory.End on an invented category.
Native dimension is WithBot ℕ∞; finite dimension is the finrank of the native tangent
space. The dimension adapter below is for the older library pin; current Tau Ceti
provides AbelianVariety.finrank_tangentSpace_eq_dim. There is no replacement Jacobian, Tate module,
newform, automorphic representation, or cohomology quotient. Signatures needing the native interfaces of other roadmaps are described in the
mathematical interface notes below.
The prototypes use the native carriers at the recorded pins. The mathematical
specification and the full targets, including interfaces described in comments,
are given in README.md.
-/
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.IsomOfJ
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.KrullTopology
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.GroupTheory.Solvable
import Mathlib.Tactic.NormNum
import Mathlib.RingTheory.AdjoinRoot

set_option autoImplicit false
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false
noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct NumberField

namespace TauCeti.GL2Type

abbrev Qbar := AlgebraicClosure ℚ
abbrev GQ := Field.absoluteGaloisGroup ℚ
abbrev AVQ := TauCeti.AlgebraicGeometry.AbelianVariety ℚ

/-- Rationalization of the actual ring of endomorphisms. -/
abbrev End0 {K : Type} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :=
  ℚ ⊗[ℤ] TauCeti.AlgebraicGeometry.AbelianVariety.End A

/-- The canonical map of integral endomorphisms into the rational tensor product. -/
def integralEnd (A : AVQ) (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A) : End0 A :=
  1 ⊗ₜ[ℤ] a

/-- Finite dimension has a geometric carrier rather than an unconstrained parameter. -/
abbrev finiteDim (A : AVQ) := Module.finrank ℚ A.TangentSpace

/-- Compatibility adapter for the older Tau Ceti pin. Current Tau Ceti already proves
`AbelianVariety.finrank_tangentSpace_eq_dim` in the native TangentSpace module;
use that theorem when porting these signatures to the current library. -/
theorem finiteDim_eq_dim (A : AVQ) : (finiteDim A : WithBot ℕ∞) = A.dim := sorry

/-- Simplicity over ℚ, spelled with actual closed subgroup varieties.
The positive-dimension condition excludes the trivial variety. -/
def IsSimpleOverQ (A : AVQ) : Prop :=
  A.dim ≠ 0 ∧ ∀ (B : AVQ) (f : B ⟶ A),
    _root_.AlgebraicGeometry.IsClosedImmersion
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f) →
    B.dim = 0 ∨ _root_.AlgebraicGeometry.Surjective
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f)

/-- Equality of rational actions after clearing a common denominator. This uses native
homomorphisms and composition, whose pointwise additive law is written multiplicatively
in the native category; no Preadditive instance is imposed on its hom-sets. -/
def EEquivariant {A B : AVQ} {E : Type} [Field E] [Algebra ℚ E]
    (ιA : E →ₐ[ℚ] End0 A) (ιB : E →ₐ[ℚ] End0 B) (f : A ⟶ B) : Prop :=
  ∀ x : E, ∃ (n : ℤ) (hn : n ≠ 0)
    (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (b : TauCeti.AlgebraicGeometry.AbelianVariety.End B),
    integralEnd A a = (n : ℚ) • ιA x ∧ integralEnd B b = (n : ℚ) • ιB x ∧
    TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a ≫ f =
      f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom b

/-! GT.1/lie-algebra-divisibility: the native tangent-module conclusion.
Producing the D-action from End0, and the subvariety corollary, require A6. -/
theorem lieAlgebraDivisibility (A : AVQ) (D : Type) [DivisionRing D]
    [Algebra ℚ D] [FiniteDimensional ℚ D] [Module D A.TangentSpace]
    [IsScalarTower ℚ D A.TangentSpace] :
    Module.finrank ℚ D ∣ finiteDim A := sorry

/-! GT.1/primitive. The R25.5 structure is not redeclared here: ι and the native
field-degree/dimension equation are its mathematical inputs. -/

def power (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E] : AVQ :=
  piObj (fun _ : Fin (Module.finrank F E) => B)

/-- The regular representation on a chosen basis, followed by the A6 matrix-End0
identification. This is the action part of GL2Type.power. -/
def powerAction (B : AVQ) {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] [IsScalarTower ℚ F E]
    [FiniteDimensional F E] (b : Module.Basis (Fin (Module.finrank F E)) F E)
    (ι : F →ₐ[ℚ] End0 B) : E →ₐ[ℚ] End0 (power B F E) := sorry

theorem power_dim (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E]
    [FiniteDimensional F E] :
    (power B F E).dim = (Module.finrank F E : WithBot ℕ∞) * B.dim := sorry

theorem power_basis_indep (B : AVQ) {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] [IsScalarTower ℚ F E]
    [FiniteDimensional F E] (b b' : Module.Basis (Fin (Module.finrank F E)) F E)
    (ι : F →ₐ[ℚ] End0 B) :
    ∃ f : power B F E ⟶ power B F E,
      TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f ∧
      EEquivariant (powerAction B b ι) (powerAction B b' ι) f := sorry

/-- A consumer-specific predicate, using the actual finite products and actions. -/
def IsPrimitive (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) : Prop :=
  ¬ ∃ (F : IntermediateField ℚ E) (B : AVQ) (ιF : F →ₐ[ℚ] End0 B)
    (b : Module.Basis (Fin (Module.finrank F E)) F E) (f : A ⟶ power B F E),
    (Module.finrank ℚ F : WithBot ℕ∞) = B.dim ∧ 1 < Module.finrank F E ∧
    TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f ∧
    EEquivariant ι (powerAction B b ιF) f

theorem IsPrimitive.of_isogeny {A B : AVQ} {E : Type} [Field E] [NumberField E]
    (ιA : E →ₐ[ℚ] End0 A) (ιB : E →ₐ[ℚ] End0 B) (f : A ⟶ B)
    (hf : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f)
    (he : EEquivariant ιA ιB f) (h : IsPrimitive A ιA) : IsPrimitive B ιB := sorry

theorem isPrimitive_iff_isSimple (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim) :
    IsPrimitive A ι ↔ IsSimpleOverQ A := sorry

-- test: GL2Type.power_degree_one
example (B : AVQ) (F : Type) [Field F] [NumberField F]
    (ι : F →ₐ[ℚ] End0 B) (hd : (Module.finrank ℚ F : WithBot ℕ∞) = B.dim)
    (b : Module.Basis (Fin (Module.finrank F F)) F F) :
    (∃ e : power B F F ≅ B, EEquivariant (powerAction B b ι) ι e.hom) ∧
      (IsPrimitive B ι ↔ IsSimpleOverQ B) := sorry

/-- Concrete ℚ(√2), on Mathlib's quotient-field carrier. These fixture proofs are open. -/
def sqrtTwoPolynomial : Polynomial ℚ := Polynomial.X ^ 2 - Polynomial.C 2
instance : Fact (Irreducible sqrtTwoPolynomial) := ⟨by sorry⟩
abbrev SqrtTwoField := AdjoinRoot sqrtTwoPolynomial
instance : NumberField SqrtTwoField := by sorry

-- test: GL2Type.power_not_primitive
example (B : AVQ) (hdB : B.dim = 1)
    (b : Module.Basis (Fin (Module.finrank ℚ SqrtTwoField)) ℚ SqrtTwoField) :
    (power B ℚ SqrtTwoField).dim = 2 ∧
      Nonempty (power B ℚ SqrtTwoField ≅
        TauCeti.AlgebraicGeometry.AbelianVariety.prod B B) ∧
      ¬ IsPrimitive (power B ℚ SqrtTwoField)
        (powerAction B b (Algebra.ofId ℚ (End0 B))) := sorry

-- test: GL2Type.power_compat_R25_5 (native degree equation; supplier-bundle equality omitted)
example (B : AVQ) {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E]
    [Algebra F E] [IsScalarTower ℚ F E] [FiniteDimensional F E]
    (hd : (Module.finrank ℚ F : WithBot ℕ∞) = B.dim) :
    (Module.finrank ℚ E : WithBot ℕ∞) = (power B F E).dim := sorry

/-! GT.1/ribet-theorem-2-1: field part of the three-way equivalence. -/
theorem ribetTheorem21 (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : ∃ e : E ≃ₐ[ℚ] End0 A, ∀ x, e x = ι x := sorry

/-! GT.1/endomorphism-field. The underlying ring is canonical. Field transport is
constrained to preserve that Ring; no incompatible global instance is installed. -/
abbrev endField (A : AVQ) := End0 A

def endField_equiv (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : E ≃ₐ[ℚ] endField A := sorry

/-- The Field structure must preserve the existing native rational ring operations.
A separate arbitrary Field instance on the same type would not satisfy this statement. -/
theorem endField_numberField (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) :
    ∃ field : Field (endField A),
      field.toRing = (inferInstance : Ring (endField A)) ∧
      @NumberField (endField A) field := sorry

theorem endField_finrank (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) :
    (Module.finrank ℚ (endField A) : WithBot ℕ∞) = A.dim := sorry

/-- Conjugation by the rational inverse of f. Its construction is imported from A6;
this signature constrains its effect on the actual integral endomorphisms. -/
def endField_isogeny {A B : AVQ} (f : A ⟶ B)
    (hf : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f) :
    endField A ≃ₐ[ℚ] endField B := sorry

theorem endField_isogeny_commutes {A B : AVQ} (f : A ⟶ B)
    (hf : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f)
    (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (b : TauCeti.AlgebraicGeometry.AbelianVariety.End B)
    (hab : TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a ≫ f =
      f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom b) :
    endField_isogeny f hf (integralEnd A a) = integralEnd B b := sorry

-- test: GL2Type.endField_elliptic (native dimension-one AV; elliptic adapter omitted)
example (A : AVQ) (hd : A.dim = 1) : Nonempty (endField A ≃ₐ[ℚ] ℚ) := sorry

-- test: GL2Type.endField_not_simple
example (B : AVQ) (hd : B.dim = 1) :
    ¬ ∀ x y : End0 (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B), x * y = y * x := sorry

/-! GT.1/totally-real-or-cm: field alternative. The Rosati restriction
requires the native polarization/duality supplier and is omitted. -/
theorem totallyRealOrCm (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : NumberField.IsTotallyReal E ∨ NumberField.IsCMField E := sorry

/-! GT.2/integral-model. Integer endomorphisms and the order of E are native rings.
The rational E-action is required to intertwine with the given one. -/
structure IntegralModel (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) where
  variety : AVQ
  isogeny : A ⟶ variety
  isIsogeny : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny isogeny
  rationalAction : E →ₐ[ℚ] End0 variety
  equivariant : EEquivariant ι rationalAction isogeny
  integralAction : 𝓞 E ≃+* TauCeti.AlgebraicGeometry.AbelianVariety.End variety
  extendsIntegral : ∀ x : 𝓞 E,
    integralEnd variety (integralAction x) = rationalAction (x : E)

def integralModel (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : IntegralModel A ι := sorry

theorem integralModel_end (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) (x : 𝓞 E) :
    integralEnd (integralModel A ι hd hs).variety
      ((integralModel A ι hd hs).integralAction x) =
      (integralModel A ι hd hs).rationalAction (x : E) := sorry

-- test: GL2Type.integralModel_trivial (existence with the SAME native variety)
example (A : AVQ) {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End0 A)
    (e : 𝓞 E ≃+* TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (he : ∀ x : 𝓞 E, integralEnd A (e x) = ι (x : E)) :
    ∃ M : IntegralModel A ι, M.variety = A := sorry

end TauCeti.GL2Type

namespace TauCeti.EllipticCurve
open TauCeti.GL2Type

/-! GT.5/q-curve: actual nonsingular curves and actual conjugate isogenies.
Conjugation is coefficientwise WeierstrassCurve.map; map_id/map_map and
TauCeti.Isogeny.map_id/map_map supply coherence, not extra axiomatic fields. -/
def IsQCurve (C : WeierstrassCurve Qbar) [C.IsElliptic] : Prop :=
  ∀ σ : GQ, Nonempty (TauCeti.Isogeny (C.map σ.toRingHom) C)

theorem IsQCurve.of_isogeny {C D : WeierstrassCurve Qbar} [C.IsElliptic] [D.IsElliptic]
    (φ : TauCeti.Isogeny C D) (h : IsQCurve C) : IsQCurve D := sorry

theorem IsQCurve.conj {C : WeierstrassCurve Qbar} [C.IsElliptic]
    (h : IsQCurve C) (σ : GQ) : IsQCurve (C.map σ.toRingHom) := sorry

/-- Rational-model constructor on the actual native base change. -/
theorem IsQCurve.of_rational_model (W : WeierstrassCurve ℚ) [W.IsElliptic] :
    IsQCurve (W.map (algebraMap ℚ Qbar)) := sorry

/-- Rational-j constructor, using pinned WeierstrassCurve.exists_variableChange_of_j_eq. -/
theorem IsQCurve.of_rat (C : WeierstrassCurve Qbar) [C.IsElliptic]
    (hj : ∃ r : ℚ, algebraMap ℚ Qbar r = C.j) : IsQCurve C := sorry

/-- A finite Galois field contains the coefficients of a model and all needed isogenies.
Equality of base change fixes the actual model; no conjugation functor is assumed. -/
theorem IsQCurve.isogenies_over_galois (C : WeierstrassCurve Qbar) [C.IsElliptic]
    (h : IsQCurve C) (K₀ : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K₀] :
    ∃ K : IntermediateField ℚ Qbar, K₀ ≤ K ∧ FiniteDimensional ℚ K ∧ IsGalois ℚ K ∧
      ∃ W : WeierstrassCurve K, W.IsElliptic ∧ W.map K.val = C ∧
        ∀ σ : K ≃ₐ[ℚ] K, Nonempty (TauCeti.Isogeny (W.map σ.toRingHom) W) := sorry

/-- Native Weierstrass model of X₀(11); identifying it with the modular curve is R14. -/
def X0_11_model : WeierstrassCurve ℚ :=
  { a₁ := 0, a₂ := -1, a₃ := 1, a₄ := -10, a₆ := -20 }
instance : X0_11_model.IsElliptic := by
  refine ⟨?_⟩
  norm_num [X0_11_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

-- test: IsQCurve.rational
example : IsQCurve (X0_11_model.map (algebraMap ℚ Qbar)) := sorry

/-- A concrete CM curve, with its nonsingularity on the actual Mathlib carrier. -/
def Gaussian_model : WeierstrassCurve ℚ :=
  { a₁ := 0, a₂ := 0, a₃ := 0, a₄ := -1, a₆ := 0 }
instance : Gaussian_model.IsElliptic := by
  refine ⟨?_⟩
  norm_num [Gaussian_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

-- test: IsQCurve.cm (concrete curve; general CM-order branch omitted)
example : IsQCurve (Gaussian_model.map (algebraMap ℚ Qbar)) := sorry

-- test: IsQCurve.twist (native quadraticTwistOf with nonzero discriminant)
-- t=0, n=-d/4 has t²-4n=d, so this is the short model twist by d.
example (W : WeierstrassCurve ℚ) [W.IsElliptic] (d : Qbar) (hd : d ≠ 0) :
    ∃ h : ((W.map (algebraMap ℚ Qbar)).quadraticTwistOf 0 (-d / 4)).IsElliptic,
      @IsQCurve ((W.map (algebraMap ℚ Qbar)).quadraticTwistOf 0 (-d / 4)) h := sorry

-- Same test: the two reductions of the √2 twist at 7; unequal traces are allowed.
example :
    1 + (Finset.univ.filter (fun xy : ZMod 7 × ZMod 7 =>
      xy.2 ^ 2 = xy.1 ^ 3 - 9 * xy.1 + 27)).card = 4 ∧
    1 + (Finset.univ.filter (fun xy : ZMod 7 × ZMod 7 =>
      xy.2 ^ 2 = xy.1 ^ 3 - 16 * xy.1 + 64)).card = 12 := by decide
end TauCeti.EllipticCurve

namespace TauCeti.QCurve
open TauCeti.GL2Type

/-! GT.5/ribet-cocycle: scalar extraction on the ACTUAL geometric End0 ring over ℚ̄.
The geometric construction is omitted until A1/A6 connect Weierstrass isogenies to
that ring with faithful base change and rational inverses. No epsilon chooses a
scalar without the non-CM identification. -/
def rationalScalar {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (nonCM : ℚ ≃ₐ[ℚ] End0 A) (u : (End0 A)ˣ) : ℚˣ :=
  Units.map nonCM.symm.toMonoidHom u

theorem rationalScalar_spec {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (nonCM : ℚ ≃ₐ[ℚ] End0 A) (u : (End0 A)ˣ) :
    nonCM (rationalScalar nonCM u : ℚ) = (u : End0 A) := sorry

/-! The coefficient action here is TRIVIAL, including on algebraic units.
It is distinct from the natural Galois action on ℚ̄. These local instances are
fixed inside the resulting TopRep. Their topology is discrete. -/
section UnitCoefficients
variable (F : Type) [Field F]
local instance : TopologicalSpace (Additive Fˣ) := ⊥
local instance : DiscreteTopology (Additive Fˣ) := ⟨rfl⟩
local instance : DistribMulAction GQ (Additive Fˣ) where
  smul _ x := x
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
  smul_zero _ := rfl
  smul_add _ _ _ := rfl
local instance : SMulCommClass GQ ℤ (Additive Fˣ) := ⟨fun _ _ _ => rfl⟩
local instance : ContinuousSMul ℤ (Additive Fˣ) := ⟨continuous_of_discreteTopology⟩
local instance : ContinuousSMul GQ (Additive Fˣ) := ⟨continuous_snd⟩

def trivialUnitsCoefficients : TopRep ℤ GQ :=
  TauCeti.ofDiscreteModule ℤ GQ (Additive Fˣ)

/-- An abbreviation of canonical continuous cohomology, never a new quotient. -/
abbrev unitCohomology2 : TopModuleCat ℤ :=
  continuousCohomology 2 (trivialUnitsCoefficients F)
end UnitCoefficients
end TauCeti.QCurve

namespace TauCeti.GL2Type

/-! GT.5/tate-vanishing-qbar, Ribet Theorem 6.3, p.13.
At the older pin the cocycle-to-class application lacks the canonical comparison.
Current Tau Ceti supplies explicitH2IsoContinuousCohomology, explicitIso_coeffMap2
and explicitIso_infl2; use those native maps when porting. The geometric cocycle
still requires A1/A6. The canonical vanishing signature itself is available. -/
theorem tateVanishingQbar (x : TauCeti.QCurve.unitCohomology2 Qbar) : x = 0 := sorry

/-! GT.6/twisting-lemma. The finite-order character acts on the Hom line in the
same convention as the displayed scalar twist. No geometric context is required. -/
theorem twistingLemma {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (H : Subgroup G) [H.Normal]
    (hH : IsOpen (H : Set G)) {L : Type} [Field L] [IsAlgClosed L] [CharZero L]
    [TopologicalSpace L] [IsTopologicalRing L] (ρ₁ ρ₂ : G →* GL (Fin 2) L)
    (hc₁ : Continuous ρ₁) (hc₂ : Continuous ρ₂)
    (hiso : ∃ P : GL (Fin 2) L, ∀ g ∈ H,
      (ρ₂ g : Matrix (Fin 2) (Fin 2) L) =
        (P : Matrix (Fin 2) (Fin 2) L) * (ρ₁ g : Matrix (Fin 2) (Fin 2) L) *
        ((P⁻¹ : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L))
    (hirr : ∀ v : Fin 2 → L, v ≠ 0 →
      ¬ ∀ g ∈ H, ∃ c : L, (ρ₁ g : Matrix (Fin 2) (Fin 2) L).mulVec v = c • v) :
    ∃ ψ : G →* Lˣ, Continuous ψ ∧ Set.Finite (Set.range ψ) ∧
      (∀ g ∈ H, ψ g = 1) ∧ ∃ P : GL (Fin 2) L, ∀ g : G,
      (ρ₂ g : Matrix (Fin 2) (Fin 2) L) =
        (ψ g : L) • ((P : Matrix (Fin 2) (Fin 2) L) * (ρ₁ g : Matrix (Fin 2) (Fin 2) L) *
        ((P⁻¹ : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L)) := sorry
end TauCeti.GL2Type

/-! ## Mathematical interface notes

The README gives the full specification for every target below, including the
geometric API and definition tests. These comments describe the signatures that
need interfaces from the named roadmap owners. They are mathematical requirements,
not declarations or executable tests. A signature stated above can cover only a
part of its target. In particular, the tangent-module divisibility lemma does not
construct the derivative action, rationalScalar does not construct the geometric
cocycle, and canonical H² vanishing does not yet extract its splitting map.
-/

/- GT.1/lie-algebra-divisibility — The degree of an acting division algebra divides the dimension
If a finite-dimensional division ℚ-algebra D acts unitally on End⁰_ℚ(A), then dim_ℚ D divides dim A. Consequently an E-stable, nonzero abelian subvariety B of a GL₂(E)-type A equals A. Stability here is up to isogeny: integer multiples of every element of E act on B.

Interface requirements: The divisor conclusion is stated for the actual tangent module and its actual finrank. Omitted: constructing the D-action from the native End0 action, and the E-stable-subvariety consequence; requires AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The older-pin finiteDim_eq_dim adapter is replaced by the native library dimension identity on current Tau Ceti.
Declaration names: GL2Type.lieAlgebraDivisibility.
-/

/- GT.1/primitive — Primitive abelian varieties of GL₂-type and the power construction
Given a GL₂(F)-type B over ℚ and a finite extension E/F of degree n, choose an F-basis of E. Define E ⊗_F B as the power Bⁿ, equipped with the E-action through its regular representation E ↪ M_n(F) ↪ End⁰_ℚ(Bⁿ). Its dimension is [E : ℚ], so it is of GL₂(E)-type. A GL₂(E)-type A is primitive when no E-equivariant ℚ-isogeny identifies it with such a construction for [E : F] > 1. The equivariant isogeny class is independent of the chosen basis.

Interface requirements: Native finite product, regular E-action, denominator-cleared E-equivariance and primitivity are stated, with action-compatible degree-one and concrete ℚ(√2) power tests. Omitted: the canonical R25.5 bundle comparison and the actual Hecke-J₀(23) specialization. The action construction imports A6 native matrix-End0; the Jacobian test needs R14.2/R14.5 actual Hecke action.
Declaration names: GL2Type.power, GL2Type.power_dim, GL2Type.power_basis_indep, GL2Type.IsPrimitive, GL2Type.IsPrimitive.of_isogeny, GL2Type.isPrimitive_iff_isSimple.
API GL2Type.power: E ⊗_F B for B of GL₂(F)-type over ℚ and a finite extension E/F with a chosen F-basis.
API GL2Type.power_dim: dim (E ⊗_F B) = [E : F] · dim B.
API GL2Type.power_basis_indep: The power constructions for two F-bases of E are E-equivariantly ℚ-isogenous (the change of basis has entries in F, acting through End⁰).
API GL2Type.IsPrimitive: The predicate on (A, E): not E-equivariantly ℚ-isogenous to a power construction with [E : F] > 1.
API GL2Type.IsPrimitive.of_isogeny: Primitivity is invariant under E-equivariant ℚ-isogeny.
API GL2Type.isPrimitive_iff_isSimple: A is primitive if and only if A is ℚ-simple (GT.1/ribet-theorem-2-1).
Definition test GL2Type.power_degree_one: For E = F the power construction is B itself with its structure, and B is primitive exactly when it is ℚ-simple.
Definition test GL2Type.power_not_primitive: For an elliptic curve B over ℚ and E = ℚ(√2), E ⊗_ℚ B = B × B is of GL₂(E)-type but not primitive.
Definition test GL2Type.J0_23_primitive: J₀(23), of dimension two with E = ℚ(√5) acting through the Hecke algebra, is primitive.
Definition test GL2Type.power_compat_R25_5: The power construction satisfies the definition of SmallRamificationAndAbelianVarietyBaseCases R25.5: [E : ℚ] = dim (E ⊗_F B).
-/

/- GT.1/ribet-theorem-2-1 — Ribet's Theorem 2.1: primitive, simple and maximal endomorphism field
For GL₂(E)-type A, put X = End⁰_ℚ(A). The centralizer of E in X is E. Its centre F lies in E; with n = [E : F], one has X ≃ M_n(F) and an E-equivariant ℚ-isogeny A ∼ E ⊗_F B, where B is ℚ-simple, End⁰_ℚ(B) = F and B has GL₂(F)-type. Thus primitivity, ℚ-simplicity, and the assertion that X is a number field of degree dim A are equivalent. Under these equivalent conditions the given copy of E is all of X.

Interface requirements: The simple⇒E≃End0 implication is stated on native varieties and the exact R25.5 degree equation. Omitted: the full matrix decomposition and bundled three-way field/primitive equivalence; AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action must export the native matrix decomposition and coherent field structure. isPrimitive_iff_isSimple separately states the primitive/simple equivalence.
Declaration names: GL2Type.ribetTheorem21.
-/

/- GT.1/endomorphism-field — The endomorphism field of a ℚ-simple GL₂-type variety
For a ℚ-simple GL₂-type A define E_A to be its actual rational endomorphism algebra, with the compatible number-field structure supplied by the preceding theorem. Its degree is dim A and its identity action supplies GL₂(E_A)-type. Any given GL₂(E)-type embedding ι is an isomorphism E ≃ E_A. Transport along ι identifies the coefficient fields, primes and λ-adic representations of the two descriptions.

Interface requirements: Canonical native End0, the E-algebra equivalence, compatible Field/NumberField existence, degree and isogeny conjugation on integral endomorphisms are stated. Field existence explicitly preserves the original Ring operations. Omitted: a canonical global field-instance API/R25.5 bundle, Rosati restriction and λ-adic transport law, requiring A6/A2 and R01.6. Actual J₀(23) must retain Hecke T₂, T₂²+T₂−1=0 and End0=ℚ[T₂]; R14.2/R14.5 supplies those native objects.
Declaration names: GL2Type.endField, GL2Type.endField_numberField, GL2Type.endField_finrank, GL2Type.endField_isGL2Type, GL2Type.endField_equiv, GL2Type.endField_isogeny, GL2Type.endField_involution.
API GL2Type.endField: E_A = End⁰_ℚ(A) as a field, for ℚ-simple A of GL₂-type.
API GL2Type.endField_numberField: E_A is a number field.
API GL2Type.endField_finrank: [E_A : ℚ] = dim A.
API GL2Type.endField_isGL2Type: The tautological GL₂(E_A)-type structure in the sense of R25.5.
API GL2Type.endField_equiv: Every GL₂(E)-type structure ι on A is a field isomorphism E ≃ E_A.
API GL2Type.endField_isogeny: A ℚ-isogeny φ : A → A′ induces E_A ≃ E_{A′}, α ↦ φ ∘ α ∘ φ⁻¹, compatibly with the λ-adic representations.
API GL2Type.endField_involution: The canonical involution of E_A (GT.1/totally-real-or-cm) is the Rosati involution of every ℚ-polarization.
Definition test GL2Type.endField_elliptic: For an elliptic curve E₀ over ℚ, E_{E₀} = ℚ (End_ℚ(E₀) = ℤ, EllipticCurveModularity R29.1).
Definition test GL2Type.endField_J0_23: E_{J₀(23)} = ℚ(√5), generated by the Hecke operator T₂ with T₂² + T₂ − 1 = 0.
Definition test GL2Type.endField_J1_13: E_{J₁(13)} = ℚ(√−3), a CM field, matching the order-6 character of the newform of level 13.
Definition test GL2Type.endField_not_simple: For B × B with B an elliptic curve over ℚ, End⁰_ℚ = M₂(ℚ) is not a field: simplicity is needed.
-/

/- GT.1/totally-real-or-cm — The endomorphism field is totally real or CM, with the Rosati involution as canonical involution
The endomorphism field of a ℚ-simple GL₂-type A is totally real or CM. Every polarization defined over ℚ induces the same restriction of Rosati to that field: the identity in the totally real case and the canonical complex conjugation in the CM case. In particular this field involution is independent of the polarization.

Interface requirements: The totally-real/CM alternative is stated on the actual native End0 action and native dimension equation, using Mathlib’s NumberField predicates. The Rosati restriction on every native polarization is omitted pending the A2/A6 polarization, duality and positive-involution export.
Declaration names: GL2Type.totallyRealOrCm.
-/

/- GT.1/modular-quotient-is-gl2-type — The modular quotient A_f is ℚ-simple of GL₂-type with endomorphism field K_f
Let f be a normalized weight-two newform on Γ₁(N), with positive N, coefficient field K_f and character ε_f. The quotient A_f = J₁(N)/p_f J₁(N) of R14.5 is ℚ-simple, and its Hecke action identifies K_f with End⁰_ℚ(A_f); in particular it has GL₂(K_f)-type. More generally J₁(N) is ℚ-isogenous to ∏_{M | N} ∏_{[g]} A_g^{d(N/M)}, where [g] runs through the coefficient-conjugacy orbits of weight-two newforms of level M and d is the divisor-counting function.

Interface requirements: The native A_f with its Hecke coefficient-field action requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and the R25.5 bundle, together with ModularForms Layer 3 old/new decomposition.
Declaration names: GL2Type.modularQuotientIsGl2Type.
-/

/- GT.2/integral-model — The integral model with endomorphism ring 𝒪_E
Choose an E-equivariant ℚ-isogeny A → A′ such that End_ℚ(A′) identifies with 𝒪_E. Such an A′ exists. For every maximal ideal λ of 𝒪_E the actual group A′[λ] is a two-dimensional vector space over 𝔽_λ with continuous G_ℚ-action. Its semisimplification is the semisimplified reduction of ρ_λ and is independent of the integral model.

Interface requirements: IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
Declaration names: GL2Type.integralModel, GL2Type.integralModel_end, GL2Type.residualRep, GL2Type.residualRep_finrank, GL2Type.residualRep_charpoly, GL2Type.residualRep_ss_indep.
API GL2Type.integralModel: An E-equivariantly isogenous A′ with End_ℚ(A′) = 𝒪_E.
API GL2Type.integralModel_end: End_ℚ(integralModel A) = 𝒪_E as subrings of E.
API GL2Type.residualRep: ρ̄_λ : G_ℚ → GL(A′[λ]) ≅ GL₂(𝔽_λ), from R01.6 lambdaTorsion.
API GL2Type.residualRep_finrank: dim_{𝔽_λ} A′[λ] = 2.
API GL2Type.residualRep_charpoly: For p ∉ S, p ∉ λ: the characteristic polynomial of ρ̄_λ(Frob_p) is X² − ā_p X + ε̄(p)p, the reduction of GT.2/frobenius-polynomial.
API GL2Type.residualRep_ss_indep: ρ̄_λ^{ss} is independent of the integral model and of the lattice.
Definition test GL2Type.residualRep_elliptic: For an elliptic curve E₀ over ℚ, ρ̄_ℓ is the action on E₀[ℓ] of ArithmeticGaloisRepresentations R01.6.
Definition test GL2Type.residualRep_det: det ρ̄_λ = ε̄ · χ̄_ℓ, the reduction of GT.2/determinant-character.
Definition test GL2Type.integralModel_trivial: If End_ℚ(A) = 𝒪_E already (for example A_f with 𝒪_{K_f} acting), A′ = A is an integral model.
Definition test GL2Type.residualRep_not_A_l: A′[ℓ] is not A′[λ] unless λ = ℓ𝒪_E: A′[ℓ] = ⊕_{λ|ℓ} A′[λ^{e_λ}] has 𝔽_ℓ-dimension 2[E : ℚ].
-/

/- GT.2/frobenius-polynomial — E-rationality of the Frobenius polynomials
For each good prime p there are a_p,d_p ∈ 𝒪_E such that, for every λ not over p, ρ_λ is unramified at p and has arithmetic Frobenius polynomial X² − a_p X + d_p. The coefficients are read through E ↪ E_λ and are independent of λ. This is E-rational strict compatibility in the good-prime sense of Serre, with exceptional set S.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.frobeniusPolynomial.
-/

/- GT.2/determinant-character — Ribet's Lemma 3.1: the determinant is ε·χ_ℓ
One finite-order E-valued character ε works for all λ: det ρ_λ = εχ_ℓ for λ | ℓ. It is unramified at all good primes, has N_{E/ℚ}(ε) = 1, and may be viewed as a Dirichlet character supported only at bad primes. Consequently d_p = ε(p)p at every good p.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.determinantCharacter.
-/

/- GT.2/odd — Ribet's Lemma 3.2: the system is odd
For every complex conjugation c in G_ℚ, ε(c) = 1 and det ρ_λ(c) = −1. Thus ε is even and every λ-adic component is odd in the sense of R01.4.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.odd.
-/

/- GT.2/absolute-irreducibility — Ribet's Proposition 3.3: absolute irreducibility
Every ρ_λ is absolutely irreducible, and its commutant as a ℚ_ℓ[G_ℚ]-module is E_λ. For the whole Tate module over an open subgroup H = G_K, the more general comparison is End_{ℚ_ℓ[H]} V_ℓ(A) = End⁰_K(A) ⊗ ℚ_ℓ.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.absoluteIrreducibility.
-/

/- GT.2/coefficient-conjugation — Ribet's Proposition 3.4: a_p = ε(p)·ā_p
Write bar for the canonical involution of E from GT.1. At every good prime p, a_p = ε(p)ā_p. On representations this is V_σ ≃ V_{σ̄} ⊗ σ(ε) for every σ : E ↪ ℚ̄_ℓ, where V_σ = V_ℓ(A) ⊗_{E⊗ℚ_ℓ,σ} ℚ̄_ℓ and σ̄ = σ ∘ bar.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.coefficientConjugation.
-/

/- GT.2/coefficients-generate — Ribet's Proposition 3.5: the traces generate E
Deleting any finite set S′ containing the bad primes leaves enough Frobenius traces to generate the whole field: E = ℚ(a_p : p ∉ S′).

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.coefficientsGenerate.
-/

/- GT.2/inner-twist-field — Ribet's Proposition 3.6: F = ℚ(a_p²/ε(p)) is totally real and E/F is abelian
The subfield F = ℚ(a_p²/ε(p) : p ∉ S) of E is totally real, and E/F is an abelian extension.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.innerTwistField.
-/

/- GT.2/residual-irreducibility — Ribet's Lemma 3.7: residual absolute irreducibility for almost all λ
For an integral model A′, the G_ℚ-action on A′[λ] is absolutely irreducible for all but finitely many maximal ideals λ of 𝒪_E. In dimension one this specializes to the almost-all irreducibility of elliptic prime torsion in R29.1.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.residualIrreducibility.
-/

/- GT.2/conductor-bound — Bounded conductors of the λ-adic and residual representations
Let cond(A) = ∏_p p^{f_p(A)}, with f_p(A) the Artin conductor exponent of V_ℓ(A) for an auxiliary ℓ ≠ p. For λ of residue degree one over ℓ, the prime-to-ℓ conductors satisfy N(ρ̄_λ) | N(ρ_λ) | cond(A). Scalar restriction in the proof retains the factor [E_λ : ℚ_ℓ], even when the residue degree is one.

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.conductorBound.
-/

/- GT.2/crystalline-at-good-primes — Crystalline with Hodge–Tate weights {0, 1} at good primes; finite flat residual representations
At a good coefficient prime ℓ, each ρ_λ|_{G_{ℚ_ℓ}} for λ | ℓ is crystalline. After extension through any embedding E_λ ↪ ℚ̄_ℓ its weights are 0 and 1, once each. The λ-torsion of an integral model extends to a finite flat group scheme over ℤ_ℓ. With χ_ℓ of weight 1, this is the regular weight pair (1,0).

Interface requirements: This signature requires ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
Declaration names: GL2Type.crystallineAtGoodPrimes.
-/

/- GT.3/modular-abelian-variety — Modular abelian varieties over ℚ
For positive N, define modularity of A at level N by the existence of a surjective homomorphism J₁(N) → A over ℚ. Define Γ₀ modularity at N using J₀(N) instead. In each case modularity without a specified level means that such a positive level exists.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: AbelianVariety.IsModularOfLevel, AbelianVariety.IsModular, AbelianVariety.IsModularOfLevel.mono, AbelianVariety.IsModular.of_isogeny, AbelianVariety.IsModular.quotient, AbelianVariety.isModular_iff, AbelianVariety.IsModularOfLevel.gamma0, AbelianVariety.IsModular.elliptic.
API AbelianVariety.IsModularOfLevel: A is modular of level N: ∃ surjective J₁(N) → A over ℚ.
API AbelianVariety.IsModular: ∃ N ≥ 1 with IsModularOfLevel A N.
API AbelianVariety.IsModularOfLevel.mono: IsModularOfLevel A N → N ∣ M → 0 < M → IsModularOfLevel A M (levels are positive).
API AbelianVariety.IsModular.of_isogeny: A ℚ-isogeny A → A′ (or any surjection) transports modularity of A to A′.
API AbelianVariety.IsModular.quotient: A quotient of a modular abelian variety is modular.
API AbelianVariety.isModular_iff: For ℚ-simple A of GL₂-type: modular ⇔ isogenous to some A_f ⇔ some V_λ(A) ≅ ρ_{f,λ′} (GT.3/modularity-equivalences).
API AbelianVariety.IsModularOfLevel.gamma0: Modular of level N for Γ₀ implies modular of level N: pushforward along the finite surjection X₁(N) → X₀(N) gives a surjection J₁(N) → J₀(N) (R14.2).
API AbelianVariety.IsModular.elliptic: For an elliptic curve over ℚ, being modular for Γ₀ at level N is the formulation (ii) of EllipticCurveModularity R29.6.
Definition test IsModular.X0_11: X₀(11) is modular of level 11 for Γ₀.
Definition test IsModular.zero: The zero abelian variety is modular of every positive level; J₁(N) = 0 for 1 ≤ N ≤ 10 and N = 12.
Definition test IsModular.J1_13_not_gamma0: J₁(13) is modular of level 13 but not modular of level 13 for Γ₀, since J₀(13) = 0.
Definition test IsModular.level_not_minimal: X₀(11) is modular of level 22 as well as 11: the level in the definition is not the conductor.
-/

/- GT.3/serre-witnesses — Residual Serre witnesses of weight two at bounded level
Choose an integral model A′. There are infinitely many maximal ideals λ of 𝒪_E with residue degree one above odd good primes ℓ that are unramified in E and for which ρ̄_λ is absolutely irreducible. For each such λ, obtain a normalized weight-two newform g_λ of level N_λ dividing cond(A) and a prime λ′ of K_{g_λ} above ℓ. After embedding both residue fields into 𝔽̄_ℓ, their residual representations are isomorphic. Thus the traces a_p(g_λ) and a_p(A) agree in that field for every p outside S ∪ {ℓ}. The nebentypus is allowed to depend on λ.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.serreWitnesses.
-/

/- GT.3/fixed-newform — One newform for infinitely many λ
From the witnesses choose one normalized weight-two newform f, of level N_f dividing cond(A), that occurs for an infinite subset Λ_f. For each λ in this subset there is a ring homomorphism φ_λ : 𝒪_{K_f} → 𝔽_λ = 𝔽_ℓ carrying a_p(f) to the reduction of a_p(A) for all p outside S ∪ {ℓ}. These maps use the whole ring of integers; the finite coefficient-order index is excluded before choosing the infinite subset.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.fixedNewform.
-/

/- GT.3/coefficient-identification — Exact coefficients: K_f ≅ E with a_p(f) ↦ a_p(A)
The infinitely many reductions determine a field isomorphism j : K_f ≃ E. For every p outside S with p ∤ N_f, it satisfies j(a_p(f)) = a_p(A) and j(ε_f(p)) = ε(p).

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.coefficientIdentification.
-/

/- GT.3/tate-module-comparison — Comparison of λ-adic representations with those of the newform
For every prime λ of E, the coefficient identification j gives an isomorphism of E_λ[G_ℚ]-modules ρ_λ ≃ ρ_{f,j⁻¹(λ)} ⊗_{K_{f,j⁻¹(λ)}} E_λ. Taking all components over ℓ yields V_ℓ(A) ≃ V_ℓ(A_f) over ℚ_ℓ, with the field actions intertwined by j.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.tateModuleComparison.
-/

/- GT.3/modularity-theorem — Modularity of abelian varieties of GL₂-type (Ribet's Theorem 4.4, Khare–Wintenberger Corollary 10.2(i))
If A is ℚ-simple of GL₂-type, there is a normalized weight-two newform f on Γ₁(N_f) and a ℚ-isogeny A_f → A. The isomorphism K_f ≃ End⁰_ℚ(A) identifies the Hecke action with the endomorphism action. Composing with J₁(N_f) → A_f makes A modular at N_f. Every GL₂-type variety over ℚ is modular, including the powers described in GT.1; the latter conclusion uses enough oldform copies at a suitable larger level.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.modularityTheorem.
-/

/- GT.3/modularity-equivalences — Equivalent forms of modularity
For a ℚ-simple GL₂-type A, modularity is equivalent to each of the following: being ℚ-isogenous to some weight-two A_f; having one λ-adic component isomorphic, after extension to ℚ̄_ℓ, to a component of a weight-two newform representation; having such a realization for every λ; and being isomorphic to a ℚ-simple quotient of some J₁(N). The representation comparison always uses primes above the same ℓ. The implications between these assertions use no Serre modularity theorem; GT.3/modularity-theorem proves that they hold.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.modularityEquivalences.
-/

/- GT.3/simple-quotients-characterisation — The ℚ-simple quotients of the J₁(N) are the GL₂-type varieties (generalised Shimura–Taniyama–Weil)
A variety B over ℚ is a ℚ-simple quotient of a positive-level J₁(N) precisely when it is ℚ-simple of GL₂-type. The assignment f ↦ A_f induces a bijection between coefficient-conjugacy orbits of normalized weight-two newforms, over all levels and characters, and the ℚ-isogeny classes of these varieties.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.simpleQuotientsCharacterisation.
-/

/- GT.3/trivial-character — Totally real endomorphism field, trivial character and quotients of J₀(N)
For ℚ-simple GL₂-type A, total reality of E, triviality of ε, and Γ₀ modularity are equivalent. When they hold, A is a quotient of J₀(N_f). Applying the conductor theorem in GT.4 identifies this level as cond(A)^{1/dim A}. This gives the higher-dimensional content of Serre’s Théorème 5 and specializes to the parent’s quotient at the elliptic conductor.

Interface requirements: This signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
Declaration names: GL2Type.trivialCharacter.
-/

/- GT.3/modular-parametrisation — Modular parametrisation of a GL₂-type variety
Suppose dim A > 0 and q : J₁(N) → A is surjective over ℚ. For the rational cusp c and its pointed Abel–Jacobi map, φ = q ∘ AJ_c : X₁(N) → A satisfies φ(c) = 0. It is nonconstant and its image generates A. If A is ℚ-simple of GL₂-type, q can be chosen through a degeneracy map to J₁(M), the newform quotient A_f of level M | N, and an isogeny A_f → A. With ε = 1, use X₀(N) and the cusp ∞ instead. The first assertion also applies to modular powers.

Interface requirements: The full pointed curve-morphism signature is omitted until ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and JacobianChallenge Layer F supply native AJ_c and image generation. Required clauses are X₁(N)→A, rational cusp c, φ(c)=0, nonconstancy and generating image, for every positive-dimensional modular A; the ℚ-simple refinement uses degeneracy from N to newform level M|N and the Γ₀ branch uses ∞. A nonzero Jacobian Hom is not this signature.
Declaration names: GL2Type.modularParametrisation.
-/

/- GT.4/conductor-of-gl2-type — Carayol's conductor formula for GL₂-type varieties
With the simple A and newform f fixed above, for every p and every λ not over p prove f_p(A) = n f_p(ρ_λ) and f_p(ρ_λ) = ord_p(N_f). Here f_p(A) is the Artin exponent of the rational Tate module and the component exponent is measured over E_λ. Consequently cond(A) = N_fⁿ. In particular, a weight-two newform of level N has cond(A_f) = N^{dim A_f}.

Interface requirements: Native conductor/Artin-exponent and coefficient-restriction interfaces are required from NeronModelsAndSemistableAbelianVarieties R11.5, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. No arbitrary natural-valued conductor function is introduced.
Declaration names: GL2Type.conductorOfGl2Type.
-/

/- GT.4/exact-level — The exact level of a GL₂-type variety
For ℚ-simple GL₂-type A of dimension n, define N(A) as the positive integer with N(A)ⁿ = cond(A). It equals the level of every newform whose abelian variety is ℚ-isogenous to A. For every M ≥ 1, a surjection J₁(M) → A exists if and only if N(A) | M; hence N(A) is the least parametrisation level. The larger level cond(A)ⁿ in Khare–Wintenberger §10.2 is valid. It is N(A)^{n²}, so for n ≥ 2 it is strictly larger than N(A); the positive-dimensional variety cannot have conductor one. For n = 1 the two levels agree.

Interface requirements: The level/conductor signature requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and the preceding native conductor interface. No placeholder modularity predicate is introduced.
Declaration names: GL2Type.exactLevel.
-/

/- GT.4/strict-compatibility — The λ-adic system is strictly compatible in the sense of Khare–Wintenberger
The good-prime polynomials of A lie in E. After some finite extension i : E ↪ E′, its representations, indexed through τ′ ∘ i for embeddings τ′ : E′ → ℚ̄_ℓ, form an E′-rational, two-dimensional, regular, irreducible, odd, geometric strictly compatible system of weights (1,0). For each q choose a Frobenius-semisimple Weil–Deligne parameter r_q over E′, unramified when q ∉ S, such that WD(ρ_{τ′∘i}|_{D_q})^{F-ss} ≃ τ′r_q for every τ′. This includes q = ℓ. The all-place conclusion follows from modularity and allows the finite coefficient extension in Carayol’s theorem.

Interface requirements: The full KW strictly-compatible-system signature is omitted until PotentialModularityAndCompatibleSystems R24.5 and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition provide native local WD parameters, reindexing over finite E′/E and coefficient-prime comparison. Good-prime E-rationality is distinct from the E′-rational all-place realization.
Declaration names: GL2Type.strictCompatibility.
-/

/- GT.4/l-function — The L-function of a GL₂-type variety
At every prime p, identify the local factor of L(A,s), defined through inertia invariants of H¹ for an auxiliary ℓ ≠ p, with ∏_{σ:K_f→ℂ} L_p(f^σ,s). For p ∤ N_f the individual factor is (1−a_p(f^σ)p^{−s}+ε_f^σ(p)p^{1−2s})⁻¹; for p | N_f it is (1−a_p(f^σ)p^{−s})⁻¹. It follows that L(A,s) = ∏_σ L(f^σ,s) is entire. Its completion Λ(A,s) = cond(A)^{s/2}((2π)^{−s}Γ(s))ⁿL(A,s) satisfies Λ(A,s) = w_A Λ(A,2−s), with w_A ∈ {−1,1}.

Interface requirements: The equality of all local factors, completed L-functions and the functional equation are omitted until R11.5 and ModularForms Layers 6–7 export native Euler/L-series and normalized Fricke data, plus AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. The mathematical convention keeps i²=−1 at weight two.
Declaration names: GL2Type.lFunction.
-/

/- GT.4/parent-compatibility — Compatibility with the parent in dimension one
Let E₀/ℚ be elliptic, with conductor N_{E₀}. The dimension-one specialization has endomorphism field ℚ, ε = 1, K_f = ℚ, and f = F_{E₀} at level N_{E₀}. Compare the isogeny and the pointed X₀(N_{E₀}) parametrisation with EllipticCurveModularity R29.5–R29.6 using the same quotient q : J₀(N_{E₀}) → E₀ and the same AJ_∞. In both constructions the curve map is q ∘ AJ_∞. This is a compatibility of chosen data; arbitrary isogenies and parametrisations are not required to be unique.

Interface requirements: The full curve-level comparison is omitted until ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and EllipticCurveModularity R29.5 export native pointed quotient/parametrisation data. The mathematical statement compares compatible choices through the same quotient, rather than identifying arbitrary isogenies or parametrisations.
Declaration names: GL2Type.parentCompatibility.
-/

/- GT.5/q-curve — ℚ-curves
An elliptic curve C/ℚ̄ is a ℚ-curve when each conjugate ᵍC, for g ∈ G_ℚ, is isogenous to C over ℚ̄. A curve C₀ over a number field K ⊆ ℚ̄ has this property when its geometric base change does, including conjugations that move K. Non-CM means End_ℚ̄(C) = ℤ.

Interface requirements: The definition, geometric-isogeny invariance, conjugation, rational-model/rational-j constructors and finite-Galois model/isogeny descent use WeierstrassCurve.IsElliptic and TauCeti.Isogeny with their native map coherence. Concrete rational/CM models, actual quadraticTwistOf and point counts are stated. Omitted: general CM-order constructor and the squared-trace non-example; these require A1/CM.1 geometric endomorphism interfaces and R01.6/R11.5 reduction/Tate comparison. The descent conclusion fixes the coefficients by equality of actual base change. Finite-Galois descent contains any prescribed finite coefficient field. Rational j uses the native classification, not a new supplier theorem.
Declaration names: EllipticCurve.IsQCurve, EllipticCurve.IsQCurve.of_isogeny, EllipticCurve.IsQCurve.conj, EllipticCurve.IsQCurve.of_rat, EllipticCurve.IsQCurve.of_cm, EllipticCurve.IsQCurve.isogenies_over_galois.
API EllipticCurve.IsQCurve: C over ℚ̄ (or over K ⊆ ℚ̄) with ᵍC ~ C over ℚ̄ for all g ∈ G_ℚ.
API EllipticCurve.IsQCurve.of_isogeny: If C ~ C′ over ℚ̄ and C is a ℚ-curve then so is C′.
API EllipticCurve.IsQCurve.conj: ᵍC is a ℚ-curve whenever C is.
API EllipticCurve.IsQCurve.of_rat: A curve with a model over ℚ (more generally with j(C) ∈ ℚ) is a ℚ-curve.
API EllipticCurve.IsQCurve.of_cm: Every CM elliptic curve over ℚ̄ is a ℚ-curve.
API EllipticCurve.IsQCurve.isogenies_over_galois: For a ℚ-curve with a model over K there are a finite Galois K′ ⊇ K over ℚ and K′-isogenies μ_g : ᵍC₀ → C₀ for all g ∈ Gal(K′/ℚ).
Definition test IsQCurve.rational: The base change to ℚ̄ of X₀(11) is a ℚ-curve, with μ_g the identity.
Definition test IsQCurve.cm: The curve y² = x³ − x with CM by ℤ[i] is a ℚ-curve; so are all curves with CM by an order of ℚ(i).
Definition test IsQCurve.twist: A quadratic twist over K of a curve defined over ℚ is a ℚ-curve with μ_g isomorphisms over ℚ̄. In particular, over K = ℚ(√2), the twist of y² = x³ − x + 1 by d = √2 has traces 4 and −4 at the two primes above 7 (d reduces to 3 and 4), and is still a non-CM ℚ-curve: its j-invariant is −6912/23, which is not an algebraic integer.
Definition test IsQCurve.not_of_squared_traces: Let C₀ be non-CM over a quadratic field K and let p = 𝔭·σ𝔭 split, with good reduction at both primes. If a_𝔭(C₀)² ≠ a_{σ𝔭}(C₀)² then C₀ is not a ℚ-curve. For a geometric isogeny to σC₀, the one-dimensional space Hom⁰_ℚ̄(σC₀,C₀) is a G_K-line with finite action in ℚ^×, hence action by {±1}; the two Tate representations differ by this quadratic character, so their good traces agree up to sign. Unequal unsquared traces are not an obstruction to a geometric isogeny.
-/

/- GT.5/ribet-cocycle — The cocycle of a non-CM ℚ-curve
For non-CM C₀/K, choose K-isogenies μ_g : ᵍC₀ → C₀ over a finite Galois K/ℚ. Form c(g,h) = μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ in Hom⁰. Its value is a nonzero rational scalar, and c is a 2-cocycle for the trivial action on ℚˣ. Inflate its class to continuous H²(G_ℚ,ℚˣ). This class depends only on the geometric isogeny class, independently of the field, model and chosen isogenies. Its degree relation is c(g,h)² = deg μ_g deg μ_h / deg μ_{gh}.

Interface requirements: Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence use the current Tau Ceti explicitH2IsoContinuousCohomology, explicitIso_coeffMap2 and explicitIso_infl2. Those comparison exports are absent at this file’s older pin; they are existing library inputs when porting. Explicit continuous cocycles/inflation already exist in the library and are imported rather than redefined.
Declaration names: QCurve.cocycle, QCurve.cocycle_isCocycle, QCurve.cocycleClass, QCurve.cocycleClass_indep, QCurve.cocycle_sq, QCurve.cocycleClass_of_rat.
API QCurve.cocycle: c : Gal(K/ℚ) × Gal(K/ℚ) → ℚ^× from the chosen μ_g.
API QCurve.cocycle_isCocycle: c is a 2-cocycle for the trivial action.
API QCurve.cocycleClass: [c_C] ∈ H²(G_ℚ, ℚ^×), by inflation.
API QCurve.cocycleClass_indep: [c_C] depends only on the ℚ̄-isogeny class of the non-CM elliptic curve; it is independent of K, the model C₀ and the μ_g after inflation.
API QCurve.cocycle_sq: c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}.
API QCurve.cocycleClass_of_rat: If C has a model over ℚ, [c_C] = 0.
Definition test QCurve.cocycle_rational: For a curve over ℚ with μ_g = id, c ≡ 1.
Definition test QCurve.cocycle_quadratic: For K quadratic and μ ∘ σμ = [m]: c(σ, σ) = m, c(1, ·) = c(·, 1) = 1.
Definition test QCurve.cocycle_twist_after_extension: For a non-CM quadratic twist C₀/K of an elliptic curve E₀/ℚ, enlarge K to a finite Galois L/ℚ where a twisting isomorphism φ : C₀,L ≅ E₀,L is defined. Taking μ_g = φ⁻¹ ∘ ᵍφ gives an L-defined family of isomorphisms with c ≡ 1 and [c_C] = 0. The geometric twist hypothesis does not supply K-defined conjugate isogenies.
Definition test QCurve.cocycle_cm_excluded: For a CM curve, End⁰ is an imaginary quadratic field, the values μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ need not be rational, and the construction does not apply.
-/

/- GT.5/tate-vanishing-qbar — Tate's theorem: H²(G_ℚ, ℚ̄^×) = 0 for the trivial action, and the splitting map α
Continuous H²(G_ℚ,ℚ̄ˣ) vanishes when ℚ̄ˣ is discrete with trivial action. Therefore the geometric cocycle has a locally constant splitting α with c(g,h) = α(g)α(h)/α(gh). Enlarge K to a finite Galois field K′ through which α factors. Then ε_C(g) = α(g)²/deg μ_g is a finite-order Dirichlet character, and the field E_α = ℚ(α(g) : g ∈ G_ℚ) is an abelian extension of ℚ.

Interface requirements: Vanishing is stated on canonical continuousCohomology 2 of ofDiscreteModule with trivial G_ℚ-action on discrete Additive ℚ̄ˣ. Omitted: extracting α from the geometric cocycle, finite quotient and ε_C/E_α conclusions; requires the geometric cocycle construction. Current Tau Ceti supplies the canonical degree-two comparison and its coefficient/inflation naturality, as well as subsingleton_continuousCohomology_of_module_rat for the uniquely divisible quotient. These are library inputs when porting from this file’s older pin.
Declaration names: GL2Type.tateVanishingQbar.
-/

/- GT.5/restriction-of-scalars-endomorphisms — Ribet's Lemma 6.4: the endomorphism algebra of Res_{K/ℚ} C₀ is a twisted group algebra
Use a common finite Galois K/ℚ where both the conjugate isogenies and the splitting α are defined. The actual B = Res_{K/ℚ} C₀ is an abelian variety of dimension [K:ℚ]. Its rational endomorphisms identify with ⊕_σ Hom⁰_K(σC₀,C₀). The μ_σ give a basis λ_σ satisfying λ_σλ_τ = c(σ,τ)λ_{στ}, hence End⁰_ℚ(B) ≃ R = ℚ^c[Gal(K/ℚ)]. This algebra is semisimple, and λ_σ ↦ α(σ) gives a surjective ℚ-algebra map ω : R → E_α.

Interface requirements: The concrete restriction-of-scalars object, twisted group algebra and its End0 identification require AbelianSchemesAndArithmeticModuli A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny and the typed geometric cocycle. They are not represented by unconstrained functors or actions.
Declaration names: GL2Type.restrictionOfScalarsEndomorphisms.
-/

/- GT.5/lie-free-rank-one — Ribet's Proposition 6.5 and Corollary 6.6: B_K ~ R ⊗ C₀ and Lie(B) is free of rank one
Write T = ∏_σ C_σ with each C_σ a copy of C₀ over K. On T let λ_g carry C_σ to C_{gσ} by the rational scalar c(g,σ). The map ι : T → B_K = ∏_σ σC₀ in the isogeny category sends C_σ to the σ⁻¹C₀ factor by σ⁻¹μ_σ. It is R-equivariant for this source action and the structural target action. Taking Lie algebras and descending the semisimple multiplicities proves Lie(B/ℚ) ≃ R as R-modules.

Interface requirements: Both the R-equivariant isogeny of concrete products and Lie(B/ℚ)≃R are omitted until AbelianSchemesAndArithmeticModuli A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny. The mathematical proof below specifies source R-action, target structural action and the inverse-index component computation; no arbitrary product map is offered as a substitute.
Declaration names: GL2Type.lieFreeRankOne.
-/

/- GT.5/ribet-theorem-6-1 — Ribet's Theorem 6.1: non-CM ℚ-curves are factors of GL₂-type varieties
For a non-CM ℚ-curve, let π be the central projector of R onto the E_α factor. Take the image A of a positive integer multiple of π acting on B. It is a ℚ-simple, primitive GL₂(E_α)-type variety with End⁰_ℚ(A) = E_α and dim A = [E_α:ℚ]. Over K it is isogenous to C₀^{dim A}; thus C is a geometric simple factor of A.

Interface requirements: Projector-image and geometric-factor signatures require AbelianSchemesAndArithmeticModuli A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny, A3 image/quotient interfaces and Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality, together with the native R25.5 bundle. The exact construction and degree/rank proof remain in these targets.
Declaration names: GL2Type.ribetTheorem61.
-/

/- GT.5/q-curves-geometrically-modular — Ribet's Corollary 6.2, unconditional: ℚ-curves are quotients of J₁(N) over ℚ̄
Every non-CM ℚ-curve is a geometric quotient of some positive-level J₁(N). More precisely choose a weight-two newform f at level N and a finite Galois K′/ℚ with a model C₀ of C such that (A_f)_{K′} is K′-isogenous to C₀^{[K_f:ℚ]}. The forward assertion follows by applying GT.3 to the projector variety. Ribet’s converse from geometric factors to ℚ-curves belongs to the broader building-block theory.

Interface requirements: The quotient J₁(N)_ℚ̄→C requires ModularCurvesPartII R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality so the elliptic curve, abelian variety and geometric quotient have compatible native types.
Declaration names: GL2Type.qCurvesGeometricallyModular.
-/

/- GT.5/quadratic-q-curves — ℚ-curves over quadratic fields (Ribet §7)
Let K/ℚ be quadratic, σ its nontrivial automorphism, and C₀/K non-CM with a K-isogeny μ : σC₀ → C₀. Write μ ∘ σμ = [m], where m is a nonzero integer. The Weil-restriction endomorphism algebra is ℚ[X]/(X²−m), and the character θ = α²/deg μ has θ(σ) = sign(m). If m is a square, the algebra is ℚ × ℚ and C₀ is K-isogenous to a rational elliptic curve. If m is not a square, B = Res_{K/ℚ} C₀ is a primitive GL₂(ℚ(√m))-type surface, with determinant character ε = θ; its endomorphism field is real exactly when θ is trivial. Imaginary K forces m > 0. Thus in the nonsquare case at least one of K and ℚ(√m) is real, and imaginary K makes B a Γ₀ quotient. In the square case its rational elliptic factors are Γ₀ modular.

Interface requirements: The actual Weil restriction, endomorphism algebra ℚ[X]/(X²−m), character and descent signature require AbelianSchemesAndArithmeticModuli A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny, Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality and ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings. Both square/split and nonsquare/field branches are retained in these targets.
Declaration names: GL2Type.quadraticQCurves.
-/

/- GT.6/twisting-lemma — Representations agreeing on an open normal subgroup differ by a character
Let G be profinite and H an open normal subgroup. Over an algebraically closed characteristic-zero field L with its ℓ-adic or discrete topology, take continuous ρ₁,ρ₂ : G → GL₂(L). If their restrictions to H are isomorphic and absolutely irreducible, there is a character ψ : G/H → Lˣ with ρ₂ ≃ ρ₁ ⊗ ψ. In particular the inflated character has finite order.

Interface requirements: The complete two-dimensional continuous matrix representation signature is independent of geometric suppliers and was separately elaborated at the Mathlib pin.
Declaration names: GL2Type.twistingLemma.
-/

/- GT.6/q-curve-galois-modularity — The Tate module of a ℚ-curve is a twist of the restriction of a newform's representation
For a non-CM ℚ-curve C over any number field K and any prime ℓ, choose a weight-two newform f, an embedding ι : K_f → ℚ̄_ℓ and a finite-order character ψ : G_K → ℚ̄_ℓˣ such that V_ℓ(C) ⊗_{ℚ_ℓ} ℚ̄_ℓ ≃ (ρ_{f,ι}|_{G_K}) ⊗ ψ. The restriction of ρ_{f,ι} to G_{K″} remains absolutely irreducible for every finite extension K″/K.

Interface requirements: The native C Tate module, newform coefficient embedding and finite-order twisting character/family require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality, ArithmeticGaloisRepresentations R01.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations R01.5 recognition. No mirrored representation carrier is used.
Declaration names: GL2Type.qCurveGaloisModularity.
-/

/- GT.6/q-curve-automorphy — Modularity of ℚ-curves over solvable Galois fields
Suppose K/ℚ is finite, Galois and solvable, and C/K is a non-CM ℚ-curve. Use the f and finite algebraic character underlying ψ from the preceding target. Base change π_f along a prime-cyclic tower and twist by ψ ∘ Art_K. The resulting Π = BC_{K/ℚ}(π_f) ⊗ (ψ ∘ Art_K) is cuspidal of parallel weight two. For every finite place v, its local factor in L(Π,s−1/2) equals that of L(C,s), including bad places. At an unramified v its classical T_v eigenvalue is a_v(C) = Nv+1−#C̃_v(k_v). Consequently C is modular in Caraiani–Newton’s sense, and in the Freitas–Le Hung–Siksek sense when K is totally real.

Interface requirements: The native cuspidal representation, algebraic finite-order twist, all-place Euler equality and auxiliary-prime transport require GL2AutomorphicRepresentationsAndTransfer R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties R11.5 local factors and ClassFieldTheory Layer 11 Artin reciprocity. Caraiani–Newton modularity retains its separate CM branch.
Declaration names: GL2Type.qCurveAutomorphy.
-/

/- GT.6/quadratic-q-curves-modular — ℚ-curves over quadratic fields are modular
Every ℚ-curve over a real or imaginary quadratic field is modular in the sense of Caraiani–Newton §1. The conclusion includes their CM alternative. In the non-CM case obtain a cuspidal parallel-weight-two Π on GL₂(𝔸_K) with L(Π,s−1/2) = L(C,s). This supplies the ℚ-curve input to Caraiani–Newton Corollaries 7.2.5 and 7.3.4 and Freitas–Le Hung–Siksek §12.

Interface requirements: The quadratic-field modularity signature requires the geometric and automorphic interfaces of Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality and GL2AutomorphicRepresentationsAndTransfer R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties R11.5 local factors. The README distinguishes square/nonsquare m and the CM alternative.
Declaration names: GL2Type.quadraticQCurvesModular.
-/
