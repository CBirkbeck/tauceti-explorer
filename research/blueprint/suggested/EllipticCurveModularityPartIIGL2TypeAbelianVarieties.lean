/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/EllipticCurveModularityPartIIGL2TypeAbelianVarieties.md is
definitive. These statements suggest Lean forms so that contributors and reviewers
converge on names and signatures. Proofs are left open; no implementation is claimed.

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

Every geometric carrier below is from the pinned library. End0 is a tensor product
of the native endomorphism ring, not CategoryTheory.End on an invented category.
Native dimension is WithBot ℕ∞; finite dimension is the finrank of the native tangent
space, with an explicit bridge. There is no replacement Jacobian, Tate module,
newform, automorphic representation, or cohomology quotient. Unavailable signatures
are recorded in the omission ledger below and in each node's suggestedCoverage.
The whole file has not elaborated: the available shared build lacks the required
Tau Ceti native modules. Separately checked Mathlib fragments do not validate its native imports.
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
import Mathlib.Algebra.Algebra.TensorProduct.Basic
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
open scoped TensorProduct

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

/-- Bridge from smooth finite-type geometry; supplier AbelianSchemesAndArithmeticModuli:A1.
The signature fixes both dimensions even while its proof remains a supplier obligation. -/
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
    [FiniteDimensional F E] (b : Basis (Fin (Module.finrank F E)) F E)
    (ι : F →ₐ[ℚ] End0 B) : E →ₐ[ℚ] End0 (power B F E) := sorry

theorem power_dim (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E]
    [FiniteDimensional F E] :
    (power B F E).dim = (Module.finrank F E : WithBot ℕ∞) * B.dim := sorry

theorem power_basis_indep (B : AVQ) {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] [IsScalarTower ℚ F E]
    [FiniteDimensional F E] (b b' : Basis (Fin (Module.finrank F E)) F E)
    (ι : F →ₐ[ℚ] End0 B) :
    ∃ f : power B F E ⟶ power B F E,
      TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f ∧
      EEquivariant (powerAction B b ι) (powerAction B b' ι) f := sorry

/-- A consumer-specific predicate, using the actual finite products and actions. -/
def IsPrimitive (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) : Prop :=
  ¬ ∃ (F : IntermediateField ℚ E) (B : AVQ) (ιF : F →ₐ[ℚ] End0 B)
    (b : Basis (Fin (Module.finrank F E)) F E) (f : A ⟶ power B F E),
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
    (b : Basis (Fin (Module.finrank F F)) F F) :
    (∃ e : power B F F ≅ B, EEquivariant (powerAction B b ι) ι e.hom) ∧
      (IsPrimitive B ι ↔ IsSimpleOverQ B) := sorry

/-- Concrete ℚ(√2), on Mathlib's quotient-field carrier. These fixture proofs are open. -/
def sqrtTwoPolynomial : Polynomial ℚ := Polynomial.X ^ 2 - Polynomial.C 2
instance : Fact (Irreducible sqrtTwoPolynomial) := ⟨by sorry⟩
abbrev SqrtTwoField := AdjoinRoot sqrtTwoPolynomial
instance : NumberField SqrtTwoField := by sorry

-- test: GL2Type.power_not_primitive
example (B : AVQ) (hdB : B.dim = 1)
    (b : Basis (Fin (Module.finrank ℚ SqrtTwoField)) ℚ SqrtTwoField) :
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
The cocycle-to-class application needs the canonical comparison requested from
ProfiniteCohomology Layer 10; the canonical vanishing signature itself is available. -/
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

/-! ## Omission ledger

These entries retain the full mathematical targets and names. An omitted entry
is a comment, not a declaration or an example. No unavailable condition is filled
by a Prop-valued placeholder. The packet records the same item-level coverage.
-/
/- GT.1/lie-algebra-divisibility — signature-fragment
The divisor conclusion is stated for the actual tangent module and its actual finrank. Omitted: constructing the D-action from the native End0 action, and the E-stable-subvariety consequence; requires AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. finiteDim_eq_dim explicitly states the native dimension bridge owned by A1.
-/

/- GT.1/primitive — signature-fragment
Native finite product, regular E-action, denominator-cleared E-equivariance and primitivity are stated, with action-compatible degree-one and concrete ℚ(√2) power tests. Omitted: the canonical R25.5 bundle comparison and the actual Hecke-J₀(23) specialization. The action construction imports A6 native matrix-End0; the Jacobian test needs R14.2/R14.5 actual Hecke action.
GL2Type.power [signature-fragment]: E ⊗_F B for B of GL₂(F)-type over ℚ and a finite extension E/F with a chosen F-basis.
Native product and its separately named powerAction are present. Equality with the owner’s bundled R25.5 construction needs that interface.
test: GL2Type.J0_23_primitive [omitted]: J₀(23), of dimension two with E = ℚ(√5) acting through the Hecke algebra, is primitive.
The primitive Hecke-J₀(23) example requires the actual R14.2/R14.5 Jacobian and T₂ action, its polynomial T₂²+T₂−1=0, and the native End0=ℚ[T₂] identification. The concrete ℚ(√2) power test is separately present.
test: GL2Type.power_compat_R25_5 [example-fragment]: The power construction satisfies the definition of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety: [E : ℚ] = dim (E ⊗_F B).
The actual degree/dimension equation is present. Identifying the result with the canonical R25.5 bundle requires that supplier’s declaration.
-/

/- GT.1/ribet-theorem-2-1 — signature-fragment
The simple⇒E≃End0 implication is stated on native varieties and the exact R25.5 degree equation. Omitted: the full matrix decomposition and bundled three-way field/primitive equivalence; AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action must export the native matrix decomposition and coherent field structure. isPrimitive_iff_isSimple separately states the primitive/simple equivalence.
-/

/- GT.1/endomorphism-field — signature-fragment
Canonical native End0, the E-algebra equivalence, compatible Field/NumberField existence, degree and isogeny conjugation on integral endomorphisms are stated. Field existence explicitly preserves the original Ring operations. Omitted: a canonical global field-instance API/R25.5 bundle, Rosati restriction and λ-adic transport law, requiring A6/A2 and R01.6. Actual J₀(23) must retain Hecke T₂, T₂²+T₂−1=0 and End0=ℚ[T₂]; R14.2/R14.5 supplies those native objects.
GL2Type.endField [signature-fragment]: E_A = End⁰_ℚ(A) as a field, for ℚ-simple A of GL₂-type.
Canonical native End0 and compatible Field/NumberField existence preserving its Ring are present; packaging the canonical global instance is omitted pending the A6 instance interface.
GL2Type.endField_isGL2Type [omitted]: The tautological GL₂(E_A)-type structure in the sense of R25.5.
Requires the canonical R25.5 bundled GL₂-type structure and an A6 canonical compatible Field/NumberField instance package on native End0. Compatible field existence and the degree equation are separately present.
GL2Type.endField_isogeny [signature-fragment]: A ℚ-isogeny φ : A → A′ induces E_A ≃ E_{A′}, α ↦ φ ∘ α ∘ φ⁻¹, compatibly with the λ-adic representations.
Native End0 algebra equivalence and integral-endomorphism conjugation equation are present; λ-adic intertwining is omitted pending R01.6 Tate functoriality.
GL2Type.endField_involution [omitted]: The canonical involution of E_A (GT.1/totally-real-or-cm) is the Rosati involution of every ℚ-polarization.
Requires A2/A6 native polarizations, duality, Rosati restriction and the canonical field involution. The field alternative alone is separately stated as a signature fragment.
test: GL2Type.endField_elliptic [example-fragment]: For an elliptic curve E₀ over ℚ, E_{E₀} = ℚ (End_ℚ(E₀) = ℤ, EllipticCurveModularity:R29.1).
Native dimension-one AV and End0≃ℚ are present. Identifying it with a Weierstrass elliptic curve uses A1’s equivalence.
test: GL2Type.endField_J0_23 [omitted]: E_{J₀(23)} = ℚ(√5), generated by the Hecke operator T₂ with T₂² + T₂ − 1 = 0.
Requires the actual R14.2/R14.5 J₀(23), Hecke T₂ and its End0 identification with ℚ[T₂], including T₂²+T₂−1=0. An abstract quadratic field would not test this action.
test: GL2Type.endField_J1_13 [omitted]: E_{J₁(13)} = ℚ(√−3), a CM field, matching the order-6 character of the newform of level 13.
Requires actual R14.2/R14.5 J₁(13), its native Hecke action and identification of its End0 field with ℚ(√−3), together with the corresponding order-six character.
-/

/- GT.1/totally-real-or-cm — signature-fragment
The totally-real/CM alternative is stated on the actual native End0 action and native dimension equation, using Mathlib’s NumberField predicates. The Rosati restriction on every native polarization is omitted pending the A2/A6 polarization, duality and positive-involution export.
-/

/- GT.1/modular-quotient-is-gl2-type — omitted
The native A_f with its Hecke coefficient-field action requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and the R25.5 bundle, together with ModularForms Layer 3 old/new decomposition.
GL2Type.modularQuotientIsGl2Type [omitted]: Let f be a normalised newform of weight two on Γ₁(N) with character ε_f and coefficient field K_f, and A_f = J₁(N)/p_f J₁(N) the quotient of ModularCurvesPartII:R14.5/modular-quotient. Then the Hecke action K_f → End⁰_ℚ(A_f) is a GL₂(K_f)-type structure, A_f is ℚ-simple, and End⁰_ℚ(A_f) = K_f. Moreover J₁(N) is ℚ-isogenous to ∏_{M | N} ∏_{[g]} A_g^{d(N/M)}, the product over the Galois orbits [g] of newforms of weight two and level M | N, with d(N/M) the number of divisors of N/M.
-/

/- GT.2/integral-model — signature-fragment
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
GL2Type.residualRep [omitted]: ρ̄_λ : G_ℚ → GL(A′[λ]) ≅ GL₂(𝔽_λ), from R01.6 lambdaTorsion.
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
GL2Type.residualRep_finrank [omitted]: dim_{𝔽_λ} A′[λ] = 2.
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
GL2Type.residualRep_charpoly [omitted]: For p ∉ S, p ∉ λ: the characteristic polynomial of ρ̄_λ(Frob_p) is X² − ā_p X + ε̄(p)p, the reduction of GT.2/frobenius-polynomial.
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
GL2Type.residualRep_ss_indep [omitted]: ρ̄_λ^{ss} is independent of the integral model and of the lattice.
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
test: GL2Type.residualRep_elliptic [omitted]: For an elliptic curve E₀ over ℚ, ρ̄_ℓ is the action on E₀[ℓ] of ArithmeticGaloisRepresentations R01.6.
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
test: GL2Type.residualRep_det [omitted]: det ρ̄_λ = ε̄ · χ̄_ℓ, the reduction of GT.2/determinant-character.
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
test: GL2Type.residualRep_not_A_l [omitted]: A′[ℓ] is not A′[λ] unless λ = ℓ𝒪_E: A′[ℓ] = ⊕_{λ|ℓ} A′[λ^{e_λ}] has 𝔽_ℓ-dimension 2[E : ℚ].
IntegralModel contains an actual variety, native isogeny, rational E-action, denominator-cleared equivariance and an order-to-native-End ring equivalence with its compatibility equation. The same-variety test is stated. Omitted: λ-torsion and all residual representation clauses/tests; requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and the A3 finite-subgroup quotient/lattice interface.
-/

/- GT.2/frobenius-polynomial — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.frobeniusPolynomial [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For every prime p ∉ S there are algebraic integers a_p, d_p ∈ 𝒪_E such that for every prime λ of E with λ ∤ p, ρ_λ is unramified at p and the characteristic polynomial of ρ_λ(Frob_p) (arithmetic Frobenius) is X² − a_p X + d_p, read in E_λ. Thus (ρ_λ) is an E-rational strictly compatible system in Serre's sense, with exceptional set S.
-/

/- GT.2/determinant-character — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.determinantCharacter [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. There is a character of finite order ε : G_ℚ → E^×, unramified at every p ∉ S, with det ρ_λ = ε · χ_ℓ for every prime λ of E (λ | ℓ). Equivalently d_p = ε(p)·p for p ∉ S (GT.2/frobenius-polynomial), where ε is regarded as an E-valued Dirichlet character whose conductor is divisible only by primes of S; and N_{E/ℚ}(ε) = 1.
-/

/- GT.2/odd — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.odd [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. The character ε of GT.2/determinant-character is even, ε(c) = 1 for every complex conjugation c ∈ G_ℚ; equivalently det ρ_λ(c) = −1 for every λ, so every ρ_λ is odd (ArithmeticGaloisRepresentations:R01.4/odd-representation).
-/

/- GT.2/absolute-irreducibility — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.absoluteIrreducibility [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For every prime λ of E, ρ_λ is absolutely irreducible and End_{ℚ_ℓ[G_ℚ]} V_λ(A) = E_λ. More generally, for an open subgroup H = G_K ⊆ G_ℚ, End_{ℚ_ℓ[H]} V_ℓ(A) = End⁰_K(A) ⊗ ℚ_ℓ.
-/

/- GT.2/coefficient-conjugation — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.coefficientConjugation [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and e ↦ ē the canonical involution of E (GT.1/totally-real-or-cm). For every p ∉ S, a_p = ε(p)·ā_p. Equivalently, for every embedding σ : E → ℚ̄_ℓ, V_σ ≅ V_{σ̄} ⊗ σ(ε), where V_σ = V_ℓ ⊗_{E⊗ℚ_ℓ, σ} ℚ̄_ℓ and σ̄ = σ ∘ (bar).
-/

/- GT.2/coefficients-generate — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.coefficientsGenerate [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and S′ ⊇ S a finite set of primes. Then E = ℚ(a_p : p ∉ S′).
-/

/- GT.2/inner-twist-field — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.innerTwistField [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and F ⊆ E the subfield generated by the a_p²/ε(p) for p ∉ S. Then F is totally real and E/F is an abelian extension.
-/

/- GT.2/residual-irreducibility — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.residualIrreducibility [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and A′ an integral model (GT.2/integral-model). For all but finitely many maximal ideals λ of 𝒪_E, ρ̄_λ on A′[λ] is absolutely irreducible. For dim A = 1 this is the irreducibility of E[p] for almost all p of EllipticCurveModularity:R29.1.
-/

/- GT.2/conductor-bound — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.conductorBound [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety and cond(A) = ∏_p p^{f_p(A)} the conductor of A, f_p(A) the Artin conductor exponent of V_ℓ(A) at p for any ℓ ≠ p. For every prime λ of degree one over ℓ, the prime-to-ℓ Artin conductor N(ρ_λ) divides cond(A), and the prime-to-ℓ Artin conductor N(ρ̄_λ) of the residual representation divides N(ρ_λ).
-/

/- GT.2/crystalline-at-good-primes — omitted
This signature requires ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AbelianSchemesAndArithmeticModuli:A6 native End0, rational inverse/conjugation, matrix-product action, field transport preserving the existing Ring and ℚ-Algebra, and derivative action. The Frobenius polynomial, character, conjugation and local-condition data must come from those native actions; arbitrary representations with no functorial connection to A are not introduced.
GL2Type.crystallineAtGoodPrimes [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E = End⁰_ℚ(A) (GT.1/endomorphism-field), S the finite set of primes of bad reduction of A, and ρ_λ : G_ℚ → GL(V_λ(A)) ≅ GL₂(E_λ) the λ-adic representations of SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety. For ℓ ∉ S and λ | ℓ, ρ_λ|_{G_{ℚ_ℓ}} is crystalline, and for every embedding τ : E_λ → ℚ̄_ℓ the Hodge–Tate weights of ρ_λ ⊗_{E_λ,τ} ℚ̄_ℓ are 0 and 1, each once (convention: χ_ℓ has weight 1, that of Khare–Wintenberger §5); and for an integral model A′, A′[λ] extends to a finite flat group scheme over ℤ_ℓ. In particular the system has weights (a, b) = (1, 0) and is regular.
-/

/- GT.3/modular-abelian-variety — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModularOfLevel [omitted]: A is modular of level N: ∃ surjective J₁(N) → A over ℚ.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModular [omitted]: ∃ N ≥ 1 with IsModularOfLevel A N.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModularOfLevel.mono [omitted]: IsModularOfLevel A N → N ∣ M → 0 < M → IsModularOfLevel A M (levels are positive).
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModular.of_isogeny [omitted]: A ℚ-isogeny A → A′ (or any surjection) transports modularity of A to A′.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModular.quotient [omitted]: A quotient of a modular abelian variety is modular.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.isModular_iff [omitted]: For ℚ-simple A of GL₂-type: modular ⇔ isogenous to some A_f ⇔ some V_λ(A) ≅ ρ_{f,λ′} (GT.3/modularity-equivalences).
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModularOfLevel.gamma0 [omitted]: Modular of level N for Γ₀ implies modular of level N: pushforward along the finite surjection X₁(N) → X₀(N) gives a surjection J₁(N) → J₀(N) (R14.2).
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
AbelianVariety.IsModular.elliptic [omitted]: For an elliptic curve over ℚ, being modular for Γ₀ at level N is the formulation (ii) of EllipticCurveModularity:R29.6/modularity-theorem.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
test: IsModular.X0_11 [omitted]: X₀(11) is modular of level 11 for Γ₀.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
test: IsModular.zero [omitted]: The zero abelian variety is modular of every positive level; J₁(N) = 0 for 1 ≤ N ≤ 10 and N = 12.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
test: IsModular.J1_13_not_gamma0 [omitted]: J₁(13) is modular of level 13 but not modular of level 13 for Γ₀, since J₀(13) = 0.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
test: IsModular.level_not_minimal [omitted]: X₀(11) is modular of level 22 as well as 11: the level in the definition is not the conductor.
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
-/

/- GT.3/serre-witnesses — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.serreWitnesses [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E (GT.1/endomorphism-field), S its set of primes of bad reduction, cond(A) its conductor, ρ_λ its λ-adic representations with Frobenius traces a_p ∈ E (GT.2/frobenius-polynomial) and character ε (GT.2/determinant-character) and A′ an integral model (GT.2/integral-model). Let Λ be the set of maximal ideals λ of 𝒪_E of degree one over odd primes ℓ ∉ S, unramified in E, with ρ̄_λ absolutely irreducible; Λ is infinite. For every λ ∈ Λ there are a normalised newform g_λ of weight two, level N_λ dividing cond(A) and some character, and a prime λ′ of its coefficient field above ℓ, with ρ̄_{g_λ,λ′} ⊗ 𝔽̄_ℓ ≅ ρ̄_λ ⊗ 𝔽̄_ℓ through fixed embeddings of both residue fields; in particular a_p(g_λ) ≡ a_p(A) mod (λ′, λ) for every p ∉ S ∪ {ℓ}. This generalises EllipticCurveModularity:R29.2/weight-two-and-level-N-from-the-weight-recipe.
-/

/- GT.3/fixed-newform — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.fixedNewform [omitted]: In the situation of GT.3/serre-witnesses there are a normalised newform f of weight two and level N_f dividing cond(A), with coefficient field K_f, and an infinite subset Λ_f ⊆ Λ such that for every λ ∈ Λ_f there is a ring homomorphism φ_λ : 𝒪_{K_f} → 𝔽_λ = 𝔽_ℓ with φ_λ(a_p(f)) = a_p(A) mod λ for all p ∉ S ∪ {ℓ}. This generalises the pigeonhole step of EllipticCurveModularity:R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients.
-/

/- GT.3/coefficient-identification — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.coefficientIdentification [omitted]: In the situation of GT.3/fixed-newform there is a field isomorphism j : K_f → E with j(a_p(f)) = a_p(A) for every prime p ∉ S with p ∤ N_f, and j(ε_f(p)) = ε(p) for those p. This generalises the exact-coefficient step of EllipticCurveModularity:R29.3 and R29.3/rational-coefficient-field.
-/

/- GT.3/tate-module-comparison — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.tateModuleComparison [omitted]: In the situation of GT.3/coefficient-identification, for every prime λ of E, ρ_λ ≅ ρ_{f, j⁻¹(λ)} ⊗_{K_{f,j⁻¹(λ)}} E_λ as E_λ[G_ℚ]-modules (identifying K_{f,j⁻¹λ} with E_λ through j), and V_ℓ(A) ≅ V_ℓ(A_f) as ℚ_ℓ[G_ℚ]-modules, compatibly with j. This generalises EllipticCurveModularity:R29.4/tate-module-comparison.
-/

/- GT.3/modularity-theorem — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.modularityTheorem [omitted]: Every abelian variety A over ℚ of GL₂-type which is ℚ-simple is ℚ-isogenous to A_f for a normalised newform f of weight two on Γ₁(N_f), with an isomorphism K_f ≅ End⁰_ℚ(A) intertwining the Hecke action and the endomorphisms; consequently A is a quotient of J₁(N_f) over ℚ, i.e. A is modular of level N_f. Every abelian variety over ℚ of GL₂-type, simple or not, is modular. This generalises EllipticCurveModularity:R29.5/isogeny-to-E.
-/

/- GT.3/modularity-equivalences — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.modularityEquivalences [omitted]: For a ℚ-simple abelian variety A over ℚ of GL₂-type with endomorphism field E, the following are equivalent, and (by GT.3/modularity-theorem) all hold: (a) A is modular; (b) A is ℚ-isogenous to A_f for a weight-two newform f; (c) for some prime λ of E there are a weight-two newform f and a prime λ′ of K_f with ρ_λ ≅ ρ_{f,λ′} ⊗ ℚ̄_ℓ after extension of scalars; (d) the same for every λ; (e) A is isomorphic to a ℚ-simple quotient of J₁(N) for some N. The equivalences do not use Serre's conjecture. This generalises the equivalences of EllipticCurveModularity:R29.6/modularity-theorem.
-/

/- GT.3/simple-quotients-characterisation — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.simpleQuotientsCharacterisation [omitted]: An abelian variety B over ℚ is isomorphic to a ℚ-simple quotient of J₁(N) for some N ≥ 1 if and only if B is ℚ-simple and of GL₂-type. The isogeny classes of such B correspond bijectively to the Galois orbits of normalised newforms of weight two (of all levels and characters), by [f] ↦ [A_f].
-/

/- GT.3/trivial-character — omitted
This signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The normalized newform carrier itself exists; its coefficient field, attached quotient and compatible Galois representation must come from their owners, not private stand-ins.
GL2Type.trivialCharacter [omitted]: For a ℚ-simple abelian variety A over ℚ of GL₂-type with endomorphism field E and character ε, the following are equivalent: (a) E is totally real; (b) ε = 1; (c) A is modular for Γ₀, i.e. a quotient of J₀(N) over ℚ for some N. In that case the level can be taken to be N_f = cond(A)^{1/dim A} (GT.4/exact-level). This is Serre's Théorème 5, recorded by EllipticCurveModularity:R29.6/what-theoreme-4-asserts-and-its-scope as an inherited target, and for dim A = 1 the quotient J₀(N_E) → E of the parent.
-/

/- GT.3/modular-parametrisation — omitted
The full pointed curve-morphism signature is omitted until ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and JacobianChallenge Layer F supply native AJ_c and image generation. Required clauses are X₁(N)→A, rational cusp c, φ(c)=0, nonconstancy and generating image, with degeneracy from N to newform level M|N; the Γ₀ branch uses ∞. A nonzero Jacobian Hom is not this signature.
GL2Type.modularParametrisation [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type, modular of level N. There is a nonconstant morphism φ : X₁(N) → A over ℚ with φ(c) = 0 for the rational cusp c of ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi, whose image generates A as an algebraic group; φ is the composite of the Abel–Jacobi map, a quotient J₁(N) → J₁(M) → A_f with the newform level M dividing N and an isogeny A_f → A. If ε = 1, φ can be taken on X₀(N) with φ(∞) = 0. This generalises EllipticCurveModularity:R29.5/modular-parametrisation.
-/

/- GT.4/conductor-of-gl2-type — omitted
Native conductor/Artin-exponent and coefficient-restriction interfaces are required from NeronModelsAndSemistableAbelianVarieties:R11.5, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. No arbitrary natural-valued conductor function is introduced.
GL2Type.conductorOfGl2Type [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E, n = dim A = [E : ℚ], f a weight-two newform of level N_f with j : K_f ≅ E and V_ℓ(A) ≅ V_ℓ(A_f) (GT.3/modularity-theorem, GT.3/tate-module-comparison), and cond(A) = ∏_p p^{f_p(A)} the conductor of A (NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import). For every prime p and every prime λ of E with λ ∤ p, f_p(A) = n·f_p(ρ_λ), where f_p(ρ_λ) is the Artin conductor exponent of the E_λ-representation ρ_λ at p, and f_p(ρ_λ) = ord_p(N_f) for all such λ. Hence cond(A) = N_f^{n}; in particular cond(A_f) = N^{dim A_f} for every weight-two newform of level N (Carayol, Corollaire 0.8 for dim A_f = 1).
-/

/- GT.4/exact-level — omitted
The level/conductor signature requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and the preceding native conductor interface. No placeholder modularity predicate is introduced.
GL2Type.exactLevel [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type of dimension n. Then cond(A) is an n-th power, N(A) := cond(A)^{1/n} equals the level N_f of every newform f with A ~ A_f, and for M ≥ 1: A is modular of level M if and only if N(A) divides M. In particular the least level of a modular parametrisation is N(A). The level M = cond(A)^{n} offered in Khare–Wintenberger §10.2 is valid, since N(A) divides it; it equals N(A) when n = 1 and is N(A)^{n²} ≠ N(A) when n ≥ 2, as N(A) > 1 (no nonzero abelian variety over ℚ has good reduction everywhere). This generalises EllipticCurveModularity:R29.4/exact-conductor.
-/

/- GT.4/strict-compatibility — omitted
The full KW strictly-compatible-system signature is omitted until PotentialModularityAndCompatibleSystems:R24.5 and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition provide native local WD parameters, reindexing over finite E′/E and coefficient-prime comparison. Good-prime E-rationality is distinct from the E′-rational all-place realization.
GL2Type.strictCompatibility [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E. Its good-prime Frobenius polynomials are E-rational (GT.2/frobenius-polynomial). There is a finite number-field extension i : E ↪ E′ for which the reindexed family ρ_{τ′∘i}, for τ′ : E′ → ℚ̄_ℓ, is an E′-rational, two-dimensional strictly compatible system of geometric representations of G_ℚ with Hodge–Tate weights (1, 0) (R24.5/compatible-system). For every prime q there is a Frobenius-semisimple Weil–Deligne representation r_q over E′, unramified for q ∉ S, with WD(ρ_{τ′∘i}|_{D_q})^{F-ss} ≅ τ′r_q for every τ′, including q = ℓ. It is regular, irreducible and odd. The full local compatibility is obtained after modularity. Realisation of every r_q over the original endomorphism field E is not asserted: Carayol §0.6 and Théorème (A) allow a finite coefficient extension.
-/

/- GT.4/l-function — omitted
The equality of all local factors, completed L-functions and the functional equation are omitted until R11.5 and ModularForms Layers 6–7 export native Euler/L-series and normalized Fricke data, plus AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. The mathematical convention keeps i²=−1 at weight two.
GL2Type.lFunction [omitted]: Let A be a ℚ-simple abelian variety over ℚ of GL₂-type with endomorphism field E, n = dim A = [E : ℚ], f a weight-two newform of level N_f with j : K_f ≅ E and V_ℓ(A) ≅ V_ℓ(A_f) (GT.3/modularity-theorem, GT.3/tate-module-comparison), and cond(A) = ∏_p p^{f_p(A)} the conductor of A (NeronModelsAndSemistableAbelianVarieties:R11.5/conductor-import). For every prime p the local factor of L(A, s) (from H¹(A_ℚ̄, ℚ_ℓ)^{I_p}, ℓ ≠ p, NeronModelsAndSemistableAbelianVarieties:R11.5/local-euler-polynomial) equals ∏_{σ : K_f → ℂ} L_p(f^σ, s), the product over the embeddings of K_f of the Euler factors (1 − a_p(f^σ)p^{−s} + ε_f^σ(p)p^{1−2s})⁻¹ for p ∤ N_f and (1 − a_p(f^σ)p^{−s})⁻¹ for p | N_f. Hence L(A, s) = ∏_σ L(f^σ, s) extends to an entire function, and Λ(A, s) = cond(A)^{s/2}((2π)^{−s}Γ(s))^n L(A, s) satisfies Λ(A, s) = w_A Λ(A, 2 − s) with w_A = ±1. This generalises EllipticCurveModularity:R29.4/bad-euler-factors and R29.6/l-function-continuation.
-/

/- GT.4/parent-compatibility — omitted
The full curve-level comparison is omitted until ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and EllipticCurveModularity:R29.5 export native pointed quotient/parametrisation data. The mathematical statement compares compatible choices through the same quotient, rather than identifying arbitrary isogenies or parametrisations.
GL2Type.parentCompatibility [omitted]: For an elliptic curve E₀ over ℚ of conductor N_{E₀} (a ℚ-simple abelian variety of GL₂(ℚ)-type), GT.3–GT.4 specialise to the parent's theorem EllipticCurveModularity:R29.6/modularity-theorem: E = ℚ, ε = 1, K_f = ℚ, f is the newform F_{E₀} of level N_f = N_{E₀} (GT.4/exact-level), the isogeny A_f → E₀ and the pointed parametrisation can be chosen to agree with R29.5/isogeny-to-E, and the parametrisation of GT.3/modular-parametrisation factors through X₀(N_{E₀}) as in R29.5/modular-parametrisation. The Part II statements are proved compatible with these, not used to reprove them. Compatibility means equality for choices induced by the same quotient q : J₀(N_{E₀}) → E₀ and the same Abel–Jacobi map: φ = q ∘ AJ_∞; it does not assert uniqueness of arbitrary isogenies or parametrisations.
-/

/- GT.5/q-curve — signature-fragment
The definition, geometric-isogeny invariance, conjugation, rational-model/rational-j constructors and finite-Galois model/isogeny descent use WeierstrassCurve.IsElliptic and TauCeti.Isogeny with their native map coherence. Concrete rational/CM models, actual quadraticTwistOf and point counts are stated. Omitted: general CM-order constructor and the squared-trace non-example; these require A1/CM.1 geometric endomorphism interfaces and R01.6/R11.5 reduction/Tate comparison. The descent conclusion fixes the coefficients by equality of actual base change. Finite-Galois descent contains any prescribed finite coefficient field. Rational j uses the pinned native classification, not a new supplier theorem.
EllipticCurve.IsQCurve.of_cm [omitted]: Every CM elliptic curve over ℚ̄ is a ℚ-curve.
The general CM-order constructor requires the CM.1 ideal-lattice/ideal-isogeny classification on native elliptic curves and its A1 geometric endomorphism comparison. The rational-model and rational-j constructors and finite-Galois descent are separately present.
test: IsQCurve.cm [example-fragment]: The curve y² = x³ − x with CM by ℤ[i] is a ℚ-curve; so are all curves with CM by an order of ℚ(i).
Concrete y²=x³−x is nonsingular and is a Q-curve. The CM predicate and every CM-order branch need the A1/CM.1 interface.
test: IsQCurve.twist [example-fragment]: A quadratic twist over K of a curve defined over ℚ is a ℚ-curve with μ_g isomorphisms over ℚ̄. In particular, over K = ℚ(√2), the twist of y² = x³ − x + 1 by d = √2 has traces 4 and −4 at the two primes above 7 (d reduces to 3 and 4), and is still a non-CM ℚ-curve: its j-invariant is −6912/23, which is not an algebraic integer.
Native quadraticTwistOf Q-curve example and exact counts 4/12 at 7 are present. Named K=ℚ(√2), reductions and non-CM j-integrality comparison require A1/R11.5/CM interfaces.
test: IsQCurve.not_of_squared_traces [omitted]: Let C₀ be non-CM over a quadratic field K and let p = 𝔭·σ𝔭 split, with good reduction at both primes. If a_𝔭(C₀)² ≠ a_{σ𝔭}(C₀)² then C₀ is not a ℚ-curve. For a geometric isogeny to σC₀, the one-dimensional space Hom⁰_ℚ̄(σC₀,C₀) is a G_K-line with finite action in ℚ^×, hence action by {±1}; the two Tate representations differ by this quadratic character, so their good traces agree up to sign. Unequal unsquared traces are not an obstruction to a geometric isogeny.
The squared-trace obstruction needs A1/A6 geometric Hom0 and the non-CM identification, with R01.6 Tate representations and R11.5 good-reduction/Frobenius comparison. No trace placeholder is introduced.
-/

/- GT.5/ribet-cocycle — omitted
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
QCurve.cocycle [omitted]: c : Gal(K/ℚ) × Gal(K/ℚ) → ℚ^× from the chosen μ_g.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
QCurve.cocycle_isCocycle [omitted]: c is a 2-cocycle for the trivial action.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
QCurve.cocycleClass [omitted]: [c_C] ∈ H²(G_ℚ, ℚ^×), by inflation.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
QCurve.cocycleClass_indep [omitted]: [c_C] depends only on the ℚ̄-isogeny class of the non-CM elliptic curve; it is independent of K, the model C₀ and the μ_g after inflation.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
QCurve.cocycle_sq [omitted]: c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
QCurve.cocycleClass_of_rat [omitted]: If C has a model over ℚ, [c_C] = 0.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
test: QCurve.cocycle_rational [omitted]: For a curve over ℚ with μ_g = id, c ≡ 1.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
test: QCurve.cocycle_quadratic [omitted]: For K quadratic and μ ∘ σμ = [m]: c(σ, σ) = m, c(1, ·) = c(·, 1) = 1.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
test: QCurve.cocycle_twist_after_extension [omitted]: For a non-CM quadratic twist C₀/K of an elliptic curve E₀/ℚ, enlarge K to a finite Galois L/ℚ where a twisting isomorphism φ : C₀,L ≅ E₀,L is defined. Taking μ_g = φ⁻¹ ∘ ᵍφ gives an L-defined family of isomorphisms with c ≡ 1 and [c_C] = 0. The geometric twist hypothesis does not supply K-defined conjugate isogenies.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
test: QCurve.cocycle_cm_excluded [omitted]: For a CM curve, End⁰ is an imaginary quadratic field, the values μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ need not be rational, and the construction does not apply.
Geometric μ composition and rational inverse require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality. The file only gives rationalScalar with an actual ℚ≃End0_ℚ̄ hypothesis on a native abelian variety over ℚ̄, which constrains scalar extraction; it does not substitute that helper for cocycle construction. All six API signatures and four geometric tests are omitted. The canonical class and choice-independence need ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation. Explicit continuous cocycles/inflation already exist at the pin and are imported rather than redefined.
-/

/- GT.5/tate-vanishing-qbar — signature-fragment
Vanishing is stated on canonical continuousCohomology 2 of ofDiscreteModule with trivial G_ℚ-action on discrete Additive ℚ̄ˣ. Omitted: extracting α from the geometric cocycle, finite quotient and ε_C/E_α conclusions; requires the cocycle construction and ProfiniteCohomology Layer 10 canonical degree-two comparison, natural for coefficients and finite-quotient inflation.
-/

/- GT.5/restriction-of-scalars-endomorphisms — omitted
The concrete restriction-of-scalars object, twisted group algebra and its End0 identification require AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny and the typed geometric cocycle. They are not represented by unconstrained functors or actions.
GL2Type.restrictionOfScalarsEndomorphisms [omitted]: Let C₀ be a non-CM ℚ-curve over a finite Galois K/ℚ with K-isogenies μ_g and cocycle c (GT.5/ribet-cocycle), and B = Res_{K/ℚ} C₀, an abelian variety over ℚ of dimension [K : ℚ], where K is enlarged (Ribet: 'after again enlarging K') so that the splitting α of GT.5/tate-vanishing-qbar factors through Gal(K/ℚ). Then End⁰_ℚ(B) = ⊕_{σ ∈ Gal(K/ℚ)} Hom⁰_K(σC₀, C₀) has a ℚ-basis λ_σ corresponding to μ_σ with λ_σλ_τ = c(σ, τ)λ_{στ}: it is the twisted group algebra R = ℚ^c[Gal(K/ℚ)]. For a splitting α of c (GT.5/tate-vanishing-qbar), ω : R → E_α, λ_σ ↦ α(σ), is a surjective homomorphism of ℚ-algebras, and R is semisimple.
-/

/- GT.5/lie-free-rank-one — omitted
Both the R-equivariant isogeny of concrete products and Lie(B/ℚ)≃R are omitted until AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny. The mathematical proof below specifies source R-action, target structural action and the inverse-index component computation; no arbitrary product map is offered as a substitute.
GL2Type.lieFreeRankOne [omitted]: In the situation of GT.5/restriction-of-scalars-endomorphisms, let T = ∏_{σ} C_σ (copies of C₀ over K) with R acting by λ_g : C_σ → C_{gσ} through multiplication by c(g, σ). The isomorphism up to isogeny ι : T → B_K = ∏_σ σC₀, taking C_σ to the σ⁻¹C₀ factor by ᵟμ_σ with δ = σ⁻¹ (the conjugate of μ_σ, not its inverse), is R-equivariant. Consequently Lie(B/ℚ) is a free R-module of rank one.
-/

/- GT.5/ribet-theorem-6-1 — omitted
Projector-image and geometric-factor signatures require AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny, A3 image/quotient interfaces and Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality, together with the native R25.5 bundle. The exact construction and degree/rank proof remain in the mathematical plan.
GL2Type.ribetTheorem61 [omitted]: Let C be a non-CM ℚ-curve. There is a primitive (ℚ-simple) abelian variety A over ℚ of GL₂(E_α)-type such that C is a ℚ̄-simple factor of A: A is the image of a positive multiple of the projector π ∈ R onto the factor E_α (GT.5/restriction-of-scalars-endomorphisms) acting on B = Res_{K/ℚ} C₀, End⁰_ℚ(A) = E_α, dim A = [E_α : ℚ], and A_K is K-isogenous to C₀^{dim A}.
-/

/- GT.5/q-curves-geometrically-modular — omitted
The quotient J₁(N)_ℚ̄→C requires ModularCurvesPartII:R14.2/R14.5/R14.6 native X₁(N), X₀(N), Jacobians, A_f, coefficient fields, Hecke actions, rational cusps and pointed Abel–Jacobi maps and Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality so the elliptic curve, abelian variety and geometric quotient have compatible native types.
GL2Type.qCurvesGeometricallyModular [omitted]: Every non-CM ℚ-curve C is a quotient over ℚ̄ of J₁(N)_ℚ̄ for some N ≥ 1; more precisely there are a weight-two newform f of level N and a finite Galois extension K′/ℚ over which C has a model C₀ with (A_f)_{K′} K′-isogenous to C₀^{[K_f : ℚ]}. Ribet §5 proves the converse (a non-CM ℚ̄-simple factor of a GL₂-type variety over ℚ is a ℚ-curve); this roadmap plans the direction stated.
-/

/- GT.5/quadratic-q-curves — omitted
The actual Weil restriction, endomorphism algebra ℚ[X]/(X²−m), character and descent signature require AbelianSchemesAndArithmeticModuli:A6 restriction of scalars, its product descent, twisted-group-algebra action and the R-equivariant inverse-index isogeny, Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality and ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings. Both square/split and nonsquare/field branches are retained in the mathematical plan.
GL2Type.quadraticQCurves [omitted]: Let K be a quadratic field with Gal(K/ℚ) = {1, σ} and C₀ a non-CM elliptic curve over K with a K-isogeny μ : σC₀ → C₀; then μ ∘ σμ = [m] for a nonzero integer m, R = End⁰_ℚ(Res_{K/ℚ} C₀) = ℚ[X]/(X² − m), and θ : Gal(K/ℚ) → {±1}, θ(σ) = sign(m), is the character α²/deg μ. (a) If m is a square, C₀ is K-isogenous to the base change of an elliptic curve over ℚ. (b) If m is not a square, B = Res_{K/ℚ} C₀ is a primitive abelian surface of GL₂(ℚ(√m))-type, its character ε (GT.2/determinant-character) equals θ (Lemma 7.1), and E = ℚ(√m) is real if and only if θ is trivial. (c) If K is imaginary then m > 0. In the nonsquare case (b), Serre’s Proposition 7.2 says that at least one of the two quadratic fields E and K is real; thus imaginary K gives real quadratic E, ε = 1 and B a quotient of J₀(N). In the square case R ≅ ℚ × ℚ and there is no quadratic endomorphism field E of B; instead its rational elliptic factors are modular Γ₀ quotients.
-/

/- GT.6/q-curve-galois-modularity — omitted
The native C Tate module, newform coefficient embedding and finite-order twisting character/family require Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality, ArithmeticGaloisRepresentations:R01.6 and SmallRamificationAndAbelianVarietyBaseCases:R25.5 native Tate components, lattices, residual fields and coefficient embeddings and AutomorphicGaloisRepresentations:R19.3/R19.4 native newform representations and local compatibility; ArithmeticGaloisRepresentations:R01.5 recognition. No mirrored representation carrier is used.
GL2Type.qCurveGaloisModularity [omitted]: Let K be a number field, C an elliptic curve over K without CM (End_K̄(C) = ℤ) that is a ℚ-curve (GT.5/q-curve), and ℓ a prime. There are a weight-two newform f, an embedding ι : K_f → ℚ̄_ℓ and a character of finite order ψ : G_K → ℚ̄_ℓ^× such that V_ℓ(C) ⊗_{ℚ_ℓ} ℚ̄_ℓ ≅ (ρ_{f,ι}|_{G_K}) ⊗ ψ as representations of G_K. Moreover ρ_{f,ι}|_{G_{K″}} is absolutely irreducible for every finite extension K″ of K.
-/

/- GT.6/q-curve-automorphy — omitted
The native cuspidal representation, algebraic finite-order twist, all-place Euler equality and auxiliary-prime transport require GL2AutomorphicRepresentationsAndTransfer:R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties:R11.5 local factors and ClassFieldTheory Layer 11 Artin reciprocity. Caraiani–Newton modularity retains its separate CM branch.
GL2Type.qCurveAutomorphy [omitted]: Let K be a finite Galois extension of ℚ with solvable Galois group, C a non-CM ℚ-curve over K, and (f, ι, ψ) as in GT.6/q-curve-galois-modularity. Then Π = BC_{K/ℚ}(π_f) ⊗ (ψ ∘ Art_K) (base change along a prime-cyclic tower, twisted by the finite-order Hecke character ψ ∘ Art_K of ψ) is a cuspidal automorphic representation of GL₂(𝔸_K) of parallel weight two, and for every finite place v of K the local factor of L(Π, s − 1/2) equals the local factor of L(C, s); hence L(Π, s − 1/2) = L(C, s), and in the classical normalisation the Hecke eigenvalue of T_v on Π at unramified v is the integer a_v(C) = Nv + 1 − #C̃_v(k_v). So C is modular in the sense of Caraiani–Newton §1 (and, for K totally real, of Freitas–Le Hung–Siksek §1).
-/

/- GT.6/quadratic-q-curves-modular — omitted
The quadratic-field modularity signature requires the geometric and automorphic interfaces of Native A1 elliptic/abelian equivalence and A6 rational quasi-isogenies, faithful geometric base change and End0/Hom0 functoriality and GL2AutomorphicRepresentationsAndTransfer:R17.4/R17.6 native automorphic/base-change/twist interface, with R19.4 and NeronModelsAndSemistableAbelianVarieties:R11.5 local factors. The mathematical plan distinguishes square/nonsquare m and the CM alternative.
GL2Type.quadraticQCurvesModular [omitted]: Let K be a quadratic field (real or imaginary) and C an elliptic curve over K that is a ℚ-curve. Then C is modular in the sense of Caraiani–Newton §1: either C has CM, or there is a cuspidal automorphic representation Π of GL₂(𝔸_K) of parallel weight two with L(Π, s − 1/2) = L(C, s). This is the input of Caraiani–Newton Corollaries 7.2.5 and 7.3.4 (for imaginary K) and of Freitas–Le Hung–Siksek §12 (for real K).
-/
