/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/EllipticCurveModularityPartIIGL2TypeAbelianVarieties.md is
definitive. The statements below suggest Lean forms so that contributors and reviewers
converge on names and signatures; the file claims no implementation, every proof is left
open, and every packet node stays unchecked.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Carriers. The intended carriers are Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety`
(with its `End`, `TangentSpace` and `IsIsogeny`) and the bundled newforms
`HeckeRing.GL2.Newform`. These modules are not available in the build in which this file
is elaborated, so the file prototypes against an explicit data-only carrier structure
`TauCeti.GL2Type.AVContext` that mirrors them:

* abelian varieties over `ℚ` (and over subfields `K ⊆ ℚ̄`) are the objects of a
  `ℚ`-linear preadditive category whose morphisms are the homomorphisms up to isogeny
  `Hom⁰ = Hom ⊗ ℚ`; an isomorphism there is an isogeny, an epimorphism a surjection up to
  isogeny, `CategoryTheory.Simple` is `ℚ`-simplicity and `CategoryTheory.End A` is
  `End⁰(A)`; the genuine homomorphisms `End(A) ⊆ End⁰(A)` are a `Subring`;
* the tangent space `Lie(A/ℚ)` with the action of `End⁰(A)`;
* Tate modules `V_ℓ(A)` with their Galois and endomorphism actions, the λ-adic
  representations of R25.5 in the embedding form `V_ℓ(A) ⊗_{E ⊗ ℚ_ℓ, τ} ℚ̄_ℓ`, and the
  λ-torsion of R01.6 (d);
* conductor exponents, Artin conductor exponents, Euler polynomials and L-functions;
* the Jacobians of modular curves, newforms with their q-expansion coefficients and
  characters, and the quotients `A_f` with their Hecke action;
* cuspidal automorphic representations of `GL₂(𝔸_K)` of parallel weight two (GT.6).

Every field is data: no field of the carrier states a theorem. The notions built from
them (simplicity, isogeny, Frobenius elements, inertia, complex conjugations, the
cyclotomic character, cocycles) are honest definitions below.

Root namespace: `TauCeti`. The packet's dotted API names are kept relative to it
(`TauCeti.GL2Type.power`, `TauCeti.AbelianVariety.IsModularOfLevel`,
`TauCeti.EllipticCurve.IsQCurve`, `TauCeti.QCurve.cocycle`); the named theorems live in
`TauCeti.GL2Type`, the namespace the packet records for the planned module
`TauCeti/NumberTheory/ModularAbelianVariety/GL2Type`.
-/
import Mathlib.CategoryTheory.Linear.Basic
import Mathlib.CategoryTheory.Simple
import Mathlib.CategoryTheory.Preadditive.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.KrullTopology
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.DirichletCharacter.Basic
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.RingTheory.DedekindDomain.AdicValuation
import Mathlib.RingTheory.Ideal.Norm.AbsNorm
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Determinant
import Mathlib.AlgebraicGeometry.EllipticCurve.Affine.Point
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.NumberTheory.LSeries.Basic
import Mathlib.RingTheory.SimpleRing.Basic
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.GroupTheory.Solvable

set_option autoImplicit false
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

noncomputable section

open CategoryTheory NumberField Polynomial Module
open scoped TensorProduct

namespace TauCeti

namespace GL2Type

/-! ## Galois-theoretic notation -/

/-- A fixed algebraic closure `ℚ̄` of `ℚ`. -/
abbrev Qbar : Type := AlgebraicClosure ℚ

/-- `G_ℚ = Gal(ℚ̄/ℚ)`, with its Krull topology. -/
abbrev GQ : Type := Field.absoluteGaloisGroup ℚ

/-- An element of `G_ℚ` as an automorphism of `ℚ̄`. -/
def GQ.toAut (σ : GQ) : Qbar ≃ₐ[ℚ] Qbar := σ

/-- Subfields `K ⊆ ℚ̄`; the number fields among them are the finite-dimensional ones,
`ℚ = ⊥` and `ℚ̄ = ⊤`. -/
abbrev NF : Type := IntermediateField ℚ Qbar

/-- `G_K = Gal(ℚ̄/K) ⊆ G_ℚ` for a subfield `K ⊆ ℚ̄`. -/
def GK (K : NF) : Subgroup GQ := K.fixingSubgroup

/-- `ℚ̄_ℓ`, an algebraic closure of `ℚ_ℓ`. -/
abbrev Qlbar (ℓ : ℕ) [Fact ℓ.Prime] : Type := AlgebraicClosure ℚ_[ℓ]

/-- The ring of algebraic integers of `ℚ̄`. -/
abbrev Zbar : Subalgebra ℤ Qbar := integralClosure ℤ Qbar

/-- `P` is a prime of `ℤ̄` above the rational prime `p`. -/
def IsPrimeAbove (P : Ideal Zbar) (p : ℕ) : Prop := P.IsMaximal ∧ (p : Zbar) ∈ P

/-- `σ ∈ G_ℚ` is an arithmetic Frobenius element at some prime of `ℤ̄` above `p`:
`σ x ≡ x ^ p` modulo that prime for every algebraic integer `x`. -/
def IsArithFrobAt (σ : GQ) (p : ℕ) : Prop :=
  ∃ P : Ideal Zbar, IsPrimeAbove P p ∧
    ∀ x y : Zbar, (y : Qbar) = GQ.toAut σ (x : Qbar) → y - x ^ p ∈ P

/-- `σ ∈ G_ℚ` lies in the inertia group of some prime of `ℤ̄` above `p`. -/
def IsInertiaAt (σ : GQ) (p : ℕ) : Prop :=
  ∃ P : Ideal Zbar, IsPrimeAbove P p ∧
    ∀ x y : Zbar, (y : Qbar) = GQ.toAut σ (x : Qbar) → y - x ∈ P

/-- `σ ∈ G_K` is an arithmetic Frobenius element at a prime of `ℤ̄` above the finite place
`v` of the number field `K ⊆ ℚ̄`: `σ x ≡ x ^ {N v}` modulo that prime. -/
def IsArithFrobAtPlace (K : NF) (σ : GQ)
    (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K)) : Prop :=
  σ ∈ GK K ∧ ∃ P : Ideal Zbar, P.IsMaximal ∧
    (∀ x ∈ v.asIdeal, ∀ y : Zbar, (y : Qbar) = ((x : K) : Qbar) → y ∈ P) ∧
    ∀ x y : Zbar, (y : Qbar) = GQ.toAut σ (x : Qbar) → y - x ^ (Nat.card (𝓞 K ⧸ v.asIdeal)) ∈ P

/-- `c ∈ G_ℚ` is a complex conjugation: it is induced by complex conjugation through some
embedding `ℚ̄ → ℂ`. -/
def IsComplexConj (c : GQ) : Prop :=
  ∃ j : Qbar →+* ℂ, ∀ x : Qbar, j (GQ.toAut c x) = starRingEnd ℂ (j x)

/-- The `ℓ`-adic cyclotomic character `χ_ℓ`, with values in `ℚ̄_ℓ`. -/
def cycloChar (ℓ : ℕ) [Fact ℓ.Prime] (σ : GQ) : Qlbar ℓ :=
  algebraMap ℚ_[ℓ] (Qlbar ℓ)
    (((cyclotomicCharacter Qbar ℓ (GQ.toAut σ).toRingEquiv : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) : ℚ_[ℓ])

/-- A representation is unramified at `p`: inertia at `p` acts trivially. -/
def IsUnramifiedAt {k W : Type} [CommRing k] [AddCommGroup W] [Module k W]
    (ρ : Representation k GQ W) (p : ℕ) : Prop :=
  ∀ σ : GQ, IsInertiaAt σ p → ρ σ = 1

/-- Absolute irreducibility of a representation over an algebraically closed field (the
representations of this file over `ℚ̄_ℓ`): irreducibility of `ρ`. -/
abbrev IsAbsIrred {G k W : Type} [Group G] [Field k] [AddCommGroup W] [Module k W]
    (ρ : Representation k G W) : Prop :=
  ρ.IsIrreducible

/-! ## The carrier -/

/-- The data the roadmap's statements are about, mirroring Tau Ceti's
`AbelianVariety`, `AbelianVariety.End`, `TangentSpace`, `IsIsogeny` and
`HeckeRing.GL2.Newform` (not available in the elaborating build). Data only. -/
structure AVContext where
  /-- Abelian varieties over `ℚ`, as objects of the isogeny category (`Hom⁰ = Hom ⊗ ℚ`). -/
  AV : Type
  [cat : Category.{0} AV]
  [preadd : Preadditive AV]
  [lin : Linear ℚ AV]
  /-- The dimension. -/
  dim : AV → ℕ
  /-- Genuine endomorphisms `End_ℚ(A)` inside `End⁰_ℚ(A)`. -/
  intEnd : (A : AV) → Subring (End A)
  /-- Finite products `∏ᵢ Aᵢ`. -/
  pi : {ι : Type} → [Fintype ι] → (ι → AV) → AV
  /-- `M_n(End⁰ B) = End⁰(Bⁿ)`. -/
  piEnd : (B : AV) → (n : ℕ) → Matrix (Fin n) (Fin n) (End B) →ₐ[ℚ] End (pi fun _ : Fin n => B)
  /-- Genuine homomorphisms `Hom_ℚ(A, B)` inside `Hom⁰_ℚ(A, B)`. -/
  intHom : (A B : AV) → AddSubgroup (A ⟶ B)
  /-- The tangent space `Lie(A/ℚ) = T₀A` (Tau Ceti `AbelianVariety.TangentSpace`). -/
  Lie : AV → Type
  [lieGroup : ∀ A, AddCommGroup (Lie A)]
  [lieModule : ∀ A, Module ℚ (Lie A)]
  /-- `End⁰(A)` acts on the tangent space (characteristic zero). -/
  lieAct : (A : AV) → End A →+* Module.End ℚ (Lie A)
  /-- The rational Tate module `V_ℓ(A)`. -/
  V : AV → (ℓ : ℕ) → [Fact ℓ.Prime] → Type
  [vGroup : ∀ A (ℓ : ℕ) [Fact ℓ.Prime], AddCommGroup (V A ℓ)]
  [vModule : ∀ A (ℓ : ℕ) [Fact ℓ.Prime], Module ℚ_[ℓ] (V A ℓ)]
  /-- The action of `G_ℚ` on `V_ℓ(A)`. -/
  galRep : (A : AV) → (ℓ : ℕ) → [Fact ℓ.Prime] → Representation ℚ_[ℓ] GQ (V A ℓ)
  /-- The action of `End⁰(A)` on `V_ℓ(A)`. -/
  tateEnd : (A : AV) → (ℓ : ℕ) → [Fact ℓ.Prime] → End A →+* Module.End ℚ_[ℓ] (V A ℓ)
  /-- `ℚ`-polarizations of `A`. -/
  Pol : AV → Type
  /-- The Rosati involution `α ↦ λ⁻¹ ∘ α^∨ ∘ λ` of a polarization `λ`. -/
  rosati : {A : AV} → Pol A → End A →ₗ[ℚ] End A
  /-- R25.5, embedding form: `V_τ(A) = V_ℓ(A) ⊗_{E ⊗ ℚ_ℓ, τ} ℚ̄_ℓ` for an action
  `ι : E → End⁰(A)` and an embedding `τ : E → ℚ̄_ℓ` (the λ-adic `V_λ(A) ⊗_{E_λ} ℚ̄_ℓ` for the
  prime `λ` of `E` induced by `τ`). -/
  Vemb : (A : AV) → {E : Type} → [Field E] → [Algebra ℚ E] → (E →ₐ[ℚ] End A) →
    (ℓ : ℕ) → [Fact ℓ.Prime] → (E →+* Qlbar ℓ) → Type
  [vembGroup : ∀ (A : AV) {E : Type} [Field E] [Algebra ℚ E] (ι : E →ₐ[ℚ] End A)
    (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ), AddCommGroup (Vemb A ι ℓ τ)]
  [vembModule : ∀ (A : AV) {E : Type} [Field E] [Algebra ℚ E] (ι : E →ₐ[ℚ] End A)
    (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ), Module (Qlbar ℓ) (Vemb A ι ℓ τ)]
  /-- `ρ_τ`, the action of `G_ℚ` on `V_τ(A)`. -/
  rhoEmb : (A : AV) → {E : Type} → [Field E] → [Algebra ℚ E] → (ι : E →ₐ[ℚ] End A) →
    (ℓ : ℕ) → [Fact ℓ.Prime] → (τ : E →+* Qlbar ℓ) →
    Representation (Qlbar ℓ) GQ (Vemb A ι ℓ τ)
  /-- R01.6 (d): the `λ`-torsion `A[λ]` for a maximal ideal `λ` of `𝒪_E`, meaningful when
  `ι(𝒪_E) ⊆ End_ℚ(A)`. -/
  lamTors : (A : AV) → {E : Type} → [Field E] → [NumberField E] → (E →ₐ[ℚ] End A) →
    Ideal (𝓞 E) → Type
  [lamGroup : ∀ (A : AV) {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (lam : Ideal (𝓞 E)), AddCommGroup (lamTors A ι lam)]
  [lamModule : ∀ (A : AV) {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (lam : Ideal (𝓞 E)), Module (𝓞 E ⧸ lam) (lamTors A ι lam)]
  /-- `ρ̄_λ`, the action of `G_ℚ` on `A[λ]`. -/
  rhoBar : (A : AV) → {E : Type} → [Field E] → [NumberField E] → (ι : E →ₐ[ℚ] End A) →
    (lam : Ideal (𝓞 E)) → Representation (𝓞 E ⧸ lam) GQ (lamTors A ι lam)
  /-- NeronModelsAndSemistableAbelianVarieties R11.5: the conductor exponent `f_p(A)`. -/
  condExp : AV → ℕ → ℕ
  /-- The Artin conductor exponent at `p` of a representation of `G_ℚ`. -/
  artinExp : {k : Type} → [Field k] → {W : Type} → [AddCommGroup W] → [Module k W] →
    Representation k GQ W → ℕ → ℕ
  /-- p-adic Hodge theory at `ℓ` (KW §5 conventions): `dim D_cris(ρ|_{G_{ℚ_ℓ}})`, so that `ρ` is
  crystalline at `ℓ` exactly when this equals `dim ρ`. -/
  dcrisDim : {ℓ : ℕ} → [Fact ℓ.Prime] → {W : Type} → [AddCommGroup W] → [Module (Qlbar ℓ) W] →
    Representation (Qlbar ℓ) GQ W → ℕ
  /-- The Hodge–Tate weights of `ρ|_{G_{ℚ_ℓ}}` with multiplicity (`χ_ℓ` has weight `1`). -/
  htWeights : {ℓ : ℕ} → [Fact ℓ.Prime] → {W : Type} → [AddCommGroup W] →
    [Module (Qlbar ℓ) W] → Representation (Qlbar ℓ) GQ W → Multiset ℤ
  /-- Finite flat group schemes over `ℤ_ℓ` with generic fibre `ρ|_{G_{ℚ_ℓ}}` (for a finite
  `G_ℚ`-module `W`). -/
  ffModels : {k : Type} → [Field k] → {W : Type} → [AddCommGroup W] → [Module k W] →
    Representation k GQ W → ℕ → Type
  /-- Isomorphism classes of Frobenius-semisimple Weil–Deligne representations of `W_{ℚ_q}`
  over `k`. -/
  WDRep : (k : Type) → [Field k] → ℕ → Type
  /-- `WD(ρ|_{D_q})^{F-ss}` (Grothendieck's monodromy theorem for `q ≠ ℓ`, Fontaine's `D_pst`
  for `q = ℓ`). -/
  wdOf : {ℓ : ℕ} → [Fact ℓ.Prime] → {W : Type} → [AddCommGroup W] → [Module (Qlbar ℓ) W] →
    Representation (Qlbar ℓ) GQ W → (q : ℕ) → WDRep (Qlbar ℓ) q
  /-- Extension of scalars of Weil–Deligne representations along `k → k'`. -/
  wdMap : {k k' : Type} → [Field k] → [Field k'] → (k →+* k') → {q : ℕ} → WDRep k q →
    WDRep k' q
  /-- R11.5: the Euler polynomial `P_p(A, T) = det(1 - Frob_p T | V_ℓ(A)^{I_p})`, `ℓ ≠ p`,
  so that `L_p(A, s) = P_p(A, p^{-s})⁻¹`. -/
  eulerPoly : AV → ℕ → ℚ[X]
  /-- `L(A, s)` (its continuation where the statements assert one). -/
  LFun : AV → ℂ → ℂ
  /-- ModularCurvesPartII R14.2: the Jacobian of the modular curve `X_Γ` over `ℚ`, for
  `Γ = Γ₀(N), Γ₁(N)`. -/
  jac : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ) → AV
  /-- Normalised newforms of weight two and level `N`, of any character
  (Tau Ceti `HeckeRing.GL2.Newform N 2`). -/
  Newform : ℕ → Type
  /-- The q-expansion coefficients `a_n(f)`. -/
  coeff : {N : ℕ} → Newform N → ℕ → ℂ
  /-- The character `ε_f`, with values in `K_f = ℚ(a_n(f) : n)`. -/
  nebentypus : {N : ℕ} → (f : Newform N) →
    DirichletCharacter (IntermediateField.adjoin ℚ (Set.range (coeff f))) N
  /-- ModularCurvesPartII R14.5: the quotient `A_f = J₁(N)/p_f J₁(N)`. -/
  Af : {N : ℕ} → Newform N → AV
  /-- The Hecke action `K_f → End⁰(A_f)`. -/
  hecke : {N : ℕ} → (f : Newform N) →
    IntermediateField.adjoin ℚ (Set.range (coeff f)) →ₐ[ℚ] End (Af f)
  /-- The quotient map `J₁(N) → A_f`. -/
  quotMap : {N : ℕ} → (f : Newform N) → jac (CongruenceSubgroup.Gamma1 N) ⟶ Af f
  /-- The elliptic curve of a Weierstrass equation over `ℚ`, as an abelian variety. -/
  ell : WeierstrassCurve ℚ → AV
  /-- Abelian varieties over a subfield `K ⊆ ℚ̄` (isogeny category over `K`). -/
  AVK : NF → Type
  [catK : ∀ K, Category.{0} (AVK K)]
  [preaddK : ∀ K, Preadditive (AVK K)]
  [linK : ∀ K, Linear ℚ (AVK K)]
  /-- The dimension over `K`. -/
  dimK : {K : NF} → AVK K → ℕ
  /-- Finite products over `K`. -/
  piK : {K : NF} → {ι : Type} → [Fintype ι] → (ι → AVK K) → AVK K
  /-- The elliptic curve of a Weierstrass equation over `K`. -/
  ellK : {K : NF} → WeierstrassCurve K → AVK K
  /-- Base change from `ℚ` to `K`. -/
  bcQ : (K : NF) → AV ⥤ AVK K
  /-- Base change along an embedding `K → ℚ̄` (so `ᵍC₀ ×_{gK} ℚ̄ = bcEmb (g ∘ incl) C₀`). -/
  bcEmb : {K : NF} → (K →ₐ[ℚ] Qbar) → AVK K → AVK ⊤
  /-- Conjugation `C₀ ↦ ᵟC₀` by an automorphism `σ` of `K`, on objects and morphisms. -/
  conj : {K : NF} → (K ≃ₐ[ℚ] K) → AVK K ⥤ AVK K
  /-- `¹C₀ = C₀`. -/
  conjOne : {K : NF} → (X : AVK K) → ((conj 1).obj X ≅ X)
  /-- Base change along an inclusion `K ⊆ L` of subfields of `ℚ̄`. -/
  bcLE : {K L : NF} → K ≤ L → AVK K ⥤ AVK L
  /-- `ᵍ(ʰC₀) = ^{gh}C₀`. -/
  conjMul : {K : NF} → (g h : K ≃ₐ[ℚ] K) → (X : AVK K) →
    ((conj g).obj ((conj h).obj X) ≅ (conj (g * h)).obj X)
  /-- Weil restriction `Res_{K/ℚ}`. -/
  res : (K : NF) → AVK K → AV
  /-- The degree of an isogeny, extended to `Hom⁰` (a `ℚ`-valued quadratic function). -/
  degK : {K : NF} → {X Y : AVK K} → (X ⟶ Y) → ℚ
  /-- Genuine homomorphisms over `K` inside `Hom⁰_K`. -/
  intHomK : {K : NF} → (X Y : AVK K) → AddSubgroup (X ⟶ Y)
  /-- `V_ℓ(X)` for `X` over `K`. -/
  VK : {K : NF} → AVK K → (ℓ : ℕ) → [Fact ℓ.Prime] → Type
  [vKGroup : ∀ {K : NF} (X : AVK K) (ℓ : ℕ) [Fact ℓ.Prime], AddCommGroup (VK X ℓ)]
  [vKModule : ∀ {K : NF} (X : AVK K) (ℓ : ℕ) [Fact ℓ.Prime], Module ℚ_[ℓ] (VK X ℓ)]
  /-- The action of `G_K` on `V_ℓ(X)`. -/
  galRepK : {K : NF} → (X : AVK K) → (ℓ : ℕ) → [Fact ℓ.Prime] →
    Representation ℚ_[ℓ] (GK K) (VK X ℓ)
  /-- The action of `End⁰_K(X)` on `V_ℓ(X)`. -/
  tateEndK : {K : NF} → (X : AVK K) → (ℓ : ℕ) → [Fact ℓ.Prime] →
    End X →+* Module.End ℚ_[ℓ] (VK X ℓ)
  /-- The Euler polynomial of `X` over `K` at a finite place `v`, in `T = N v ^ {-s}`. -/
  eulerPolyK : {K : NF} → AVK K → IsDedekindDomain.HeightOneSpectrum (𝓞 K) → ℚ[X]
  /-- `L(X, s)` over `K`. -/
  LFunK : {K : NF} → AVK K → ℂ → ℂ
  /-- Cuspidal automorphic representations of `GL₂(𝔸_K)` of parallel weight two. -/
  AutRep : NF → Type
  /-- The local factor polynomial of `L(Π, s - 1/2)` at a finite place `v`, in
  `T = N v ^ {-s}`. -/
  eulerAut : {K : NF} → AutRep K → IsDedekindDomain.HeightOneSpectrum (𝓞 K) → ℂ[X]
  /-- `L(Π, s)`. -/
  LAut : {K : NF} → AutRep K → ℂ → ℂ

attribute [instance] AVContext.cat AVContext.preadd AVContext.lin AVContext.lieGroup
  AVContext.lieModule AVContext.vGroup AVContext.vModule AVContext.vembGroup
  AVContext.vembModule AVContext.lamGroup AVContext.lamModule AVContext.catK
  AVContext.preaddK AVContext.linK AVContext.vKGroup AVContext.vKModule

variable (ctx : AVContext)

namespace AVContext

/-- `J₁(N)`. -/
abbrev J1 (N : ℕ) : ctx.AV := ctx.jac (CongruenceSubgroup.Gamma1 N)

/-- `J₀(N)`. -/
abbrev J0 (N : ℕ) : ctx.AV := ctx.jac (CongruenceSubgroup.Gamma0 N)

/-- `Bⁿ`. -/
abbrev pow (B : ctx.AV) (n : ℕ) : ctx.AV := ctx.pi fun _ : Fin n => B

/-- `Xⁿ` over `K`. -/
abbrev powK {K : NF} (X : ctx.AVK K) (n : ℕ) : ctx.AVK K := ctx.piK fun _ : Fin n => X

/-- The coefficient field `K_f = ℚ(a_n(f) : n ≥ 1) ⊆ ℂ`. -/
abbrev Kf {N : ℕ} (f : ctx.Newform N) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range (ctx.coeff f))

/-- `a_n(f)` as an element of `K_f`. -/
def ap {N : ℕ} (f : ctx.Newform N) (n : ℕ) : ctx.Kf f :=
  ⟨ctx.coeff f n, IntermediateField.subset_adjoin ℚ _ (Set.mem_range_self n)⟩

/-- `K_f` is a number field (Hecke stability of the newspace). -/
instance Kf_finiteDimensional {N : ℕ} (f : ctx.Newform N) :
    FiniteDimensional ℚ (ctx.Kf f) := sorry

/-- The residue field `𝔽_λ = 𝒪_E/λ` of a maximal ideal. -/
instance residueField {E : Type} [Field E] [NumberField E] (lam : Ideal (𝓞 E))
    [lam.IsMaximal] : Field (𝓞 E ⧸ lam) :=
  Ideal.Quotient.field lam

/-- `ℚ`-isogeny: isomorphism in the isogeny category. -/
def Isogenous (A B : ctx.AV) : Prop := Nonempty (A ≅ B)

/-- The set `S` of primes of bad reduction: by Néron–Ogg–Shafarevich, the primes with
nonzero conductor exponent. -/
def IsBad (A : ctx.AV) (p : ℕ) : Prop := ctx.condExp A p ≠ 0

/-- The conductor `cond(A) = ∏_p p ^ {f_p(A)}`. -/
def cond (A : ctx.AV) : ℕ := ∏ᶠ (p : ℕ) (_ : p.Prime), p ^ ctx.condExp A p

/-- The prime-to-`ℓ` Artin conductor `N(ρ) = ∏_{p ≠ ℓ} p ^ {f_p(ρ)}`. -/
def primeToConductor {k W : Type} [Field k] [AddCommGroup W] [Module k W]
    (ρ : Representation k GQ W) (ℓ : ℕ) : ℕ :=
  ∏ᶠ (p : ℕ) (_ : p.Prime ∧ p ≠ ℓ), p ^ ctx.artinExp ρ p

/-- `K_f` is a number field. -/
instance Kf_numberField {N : ℕ} (f : ctx.Newform N) : NumberField (ctx.Kf f) := sorry

/-- `g` is a Galois conjugate `f^σ` of `f` (same level, coefficients `σ(a_n(f))`). -/
def IsGaloisConj {N M : ℕ} (f : ctx.Newform N) (g : ctx.Newform M) : Prop :=
  N = M ∧ ∃ σ : ℂ ≃ₐ[ℚ] ℂ, ∀ n, ctx.coeff g n = σ (ctx.coeff f n)

/-- `V_τ(A)` is finite-dimensional. -/
instance Vemb_finite (A : ctx.AV) {E : Type} [Field E] [Algebra ℚ E] (ι : E →ₐ[ℚ] End A)
    (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ) :
    Module.Finite (Qlbar ℓ) (ctx.Vemb A ι ℓ τ) := sorry

end AVContext

open AVContext

/-- R25.5: `ι : E → End⁰_ℚ(A)` is a GL₂(E)-type structure: `[E : ℚ] = dim A`
(`ι` is a unital `ℚ`-algebra map). -/
def IsGL2TypeVia {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A) :
    Prop :=
  finrank ℚ E = ctx.dim A

/-- R25.5: `A` is of GL₂(E)-type. -/
def IsGL2Type (A : ctx.AV) (E : Type) [Field E] [NumberField E] : Prop :=
  ∃ ι : E →ₐ[ℚ] End A, IsGL2TypeVia ctx ι

/-- `A` is of GL₂-type for some number field. -/
def IsGL2TypeSome (A : ctx.AV) : Prop :=
  ∃ (E : Type) (_ : Field E) (_ : NumberField E), IsGL2Type ctx A E

/-- The standing hypothesis of GT.2–GT.4: `A` is `ℚ`-simple of GL₂-type and
`ι : E ≅ End⁰_ℚ(A)` identifies `E` with its endomorphism field. -/
def IsEndField (A : ctx.AV) {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A) :
    Prop :=
  Simple A ∧ IsGL2TypeVia ctx ι ∧ Function.Bijective ι

/-- `ε : G_ℚ → E^×` is the determinant character: `det ρ_τ = τ ∘ ε · χ_ℓ` for every `ℓ` and
every `τ : E → ℚ̄_ℓ`. -/
def IsDetChar {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (ε : GQ →* Eˣ) : Prop :=
  ∀ (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ) (σ : GQ),
    LinearMap.det (ctx.rhoEmb A ι ℓ τ σ) = τ (ε σ : E) * cycloChar ℓ σ

/-- `a : E` is the Frobenius trace of `A` at `p`: `tr ρ_τ(Frob_p) = τ a` for every `ℓ ≠ p`
and every `τ : E → ℚ̄_ℓ`. -/
def IsFrobTrace {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (p : ℕ) (a : E) : Prop :=
  ∀ (ℓ : ℕ) [Fact ℓ.Prime], ℓ ≠ p → ∀ (τ : E →+* Qlbar ℓ) (σ : GQ), IsArithFrobAt σ p →
    LinearMap.trace (Qlbar ℓ) _ (ctx.rhoEmb A ι ℓ τ σ) = τ a

/-- `bar : E → E` is the canonical involution: it induces complex conjugation through every
complex embedding (complex conjugation if `E` is CM, the identity if `E` is totally real). -/
def IsCanonicalInvolution {E : Type} [Field E] (bar : E →+* E) : Prop :=
  ∀ (φ : E →+* ℂ) (x : E), φ (bar x) = starRingEnd ℂ (φ x)

/-- Two representations are isomorphic. -/
def RepIso {G k W₁ W₂ : Type} [Group G] [CommRing k] [AddCommGroup W₁] [Module k W₁]
    [AddCommGroup W₂] [Module k W₂] (ρ₁ : Representation k G W₁)
    (ρ₂ : Representation k G W₂) : Prop :=
  ∃ e : W₁ ≃ₗ[k] W₂, ∀ (σ : G) (x : W₁), e (ρ₁ σ x) = ρ₂ σ (e x)

/-- The twist `ρ ⊗ ψ` by a character `ψ : G_ℚ → k^×`. -/
def twist {G k W : Type} [Group G] [CommRing k] [AddCommGroup W] [Module k W]
    (ρ : Representation k G W) (ψ : G →* kˣ) : Representation k G W where
  toFun σ := (ψ σ : k) • ρ σ
  map_one' := sorry
  map_mul' := sorry

/-- Extension of scalars `ρ ⊗_k L`. -/
def repBaseChange {G k W : Type} [Group G] [Field k] [AddCommGroup W] [Module k W] (L : Type)
    [Field L] [Algebra k L] (ρ : Representation k G W) : Representation L G (L ⊗[k] W) where
  toFun σ := (ρ σ).baseChange L
  map_one' := sorry
  map_mul' := sorry

/-- Absolute irreducibility over a field `k`: `ρ ⊗_k k̄` is irreducible. -/
def IsAbsIrredOver {G k W : Type} [Group G] [Field k] [AddCommGroup W] [Module k W]
    (ρ : Representation k G W) : Prop :=
  (repBaseChange (AlgebraicClosure k) ρ).IsIrreducible

/-- The mod-`ℓ` cyclotomic character `χ̄_ℓ`, read in a ring `R` of characteristic `ℓ`. -/
def cycloCharMod (ℓ : ℕ) [Fact ℓ.Prime] (R : Type) [CommRing R] (σ : GQ) : R :=
  ((PadicInt.toZMod
    ((cyclotomicCharacter Qbar ℓ (GQ.toAut σ).toRingEquiv : ℤ_[ℓ]ˣ) : ℤ_[ℓ])).val : R)

/-- The embedding `τ : E → ℚ̄_ℓ` induces the prime `λ` of `𝒪_E`: `x ∈ λ` exactly when `τ x`
has positive valuation. -/
def InducesPrime {E : Type} [Field E] [NumberField E] {ℓ : ℕ} [Fact ℓ.Prime]
    (τ : E →+* Qlbar ℓ) (lam : Ideal (𝓞 E)) : Prop :=
  ∀ x : 𝓞 E, x ∈ lam ↔ ∃ n : ℕ, 0 < n ∧ IsIntegral ℤ_[ℓ] (τ (x : E) ^ n / (ℓ : Qlbar ℓ))

/-- `ψ : G → L^×` has finite order and open kernel. -/
def IsFiniteOrderChar {G L : Type} [Group G] [TopologicalSpace G] [CommMonoid L]
    (ψ : G →* L) : Prop :=
  IsOfFinOrder ψ ∧ IsOpen (ψ.ker : Set G)

end GL2Type

end TauCeti

/-! ## GT.1 — GL₂-type varieties: primitivity, Ribet's Theorem 2.1, the endomorphism field -/

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-- GT.1/lie-algebra-divisibility. A division `ℚ`-algebra `D` acting unitally on `A` up to
isogeny has `dim_ℚ D ∣ dim A`; in particular a nonzero abelian subvariety `B ⊆ A` (a
monomorphism in the isogeny category) stable up to isogeny under the action of `E` on an
`A` of GL₂(E)-type is all of `A`. -/
theorem lieAlgebraDivisibility (A : ctx.AV) (D : Type) [DivisionRing D] [Algebra ℚ D]
    (φ : D →ₐ[ℚ] End A) :
    finrank ℚ D ∣ ctx.dim A ∧
      ∀ {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A), IsGL2TypeVia ctx ι →
        ∀ (B : ctx.AV) (i : B ⟶ A) [Mono i], ¬ Limits.IsZero B →
          (∀ e : E, ∃ ψ : B ⟶ B, ψ ≫ i = i ≫ (ι e : A ⟶ A)) → IsIso i := sorry

/-! ### GT.1/primitive -/

/-- GT.1/primitive: the power construction `E ⊗_F B = Bⁿ` for `B` with an action
`ιB : F → End⁰(B)` and an `F`-basis `b` of `E`, `E` acting through the regular representation
`E ↪ M_n(F)` followed by `M_n(F) ↪ M_n(End⁰ B) = End⁰(Bⁿ)`. The variety is `ctx.pow B n`;
this is its `E`-action. -/
def power {B : ctx.AV} {F : Type} [Field F] [NumberField F] (ιB : F →ₐ[ℚ] End B)
    {E : Type} [Field E] [NumberField E] [Algebra F E] {n : ℕ} (b : Basis (Fin n) F E) :
    E →ₐ[ℚ] End (ctx.pow B n) :=
  { toRingHom := (ctx.piEnd B n).toRingHom.comp
      ((AlgHom.mapMatrix ιB).toRingHom.comp (Algebra.leftMulMatrix b).toRingHom)
    commutes' := sorry }

/-- GT.1/primitive: `dim (E ⊗_F B) = [E : F] · dim B`. -/
@[simp]
theorem power_dim {B : ctx.AV} {F : Type} [Field F] [NumberField F] (ιB : F →ₐ[ℚ] End B)
    {E : Type} [Field E] [NumberField E] [Algebra F E] {n : ℕ} (b : Basis (Fin n) F E) :
    ctx.dim (ctx.pow B n) = finrank F E * ctx.dim B := sorry

/-- GT.1/primitive: the power constructions for two `F`-bases of `E` are isomorphic in the
isogeny category, compatibly with the `E`-actions. -/
theorem power_basis_indep {B : ctx.AV} {F : Type} [Field F] [NumberField F]
    (ιB : F →ₐ[ℚ] End B) {E : Type} [Field E] [NumberField E] [Algebra F E] {n : ℕ}
    (b b' : Basis (Fin n) F E) :
    ∃ φ : ctx.pow B n ≅ ctx.pow B n,
      ∀ e : E, (power ctx ιB b e : ctx.pow B n ⟶ ctx.pow B n) ≫ φ.hom =
        φ.hom ≫ (power ctx ιB b' e : ctx.pow B n ⟶ ctx.pow B n) := sorry

/-- GT.1/primitive: `(A, ι)` is primitive: not `E`-equivariantly `ℚ`-isogenous to a power
construction `E ⊗_F B` with `B` of GL₂(F)-type and `[E : F] > 1`. -/
def IsPrimitive {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A) :
    Prop :=
  ¬ ∃ (F : Type) (_ : Field F) (_ : NumberField F) (_ : Algebra F E) (n : ℕ)
      (b : Basis (Fin n) F E) (B : ctx.AV) (ιB : F →ₐ[ℚ] End B) (φ : A ≅ ctx.pow B n),
      1 < n ∧ IsGL2TypeVia ctx ιB ∧
        ∀ e : E, (ι e : A ⟶ A) ≫ φ.hom = φ.hom ≫ (power ctx ιB b e : ctx.pow B n ⟶ _)

/-- GT.1/primitive: primitivity is invariant under `E`-equivariant `ℚ`-isogeny. -/
theorem IsPrimitive.of_isogeny {A A' : ctx.AV} {E : Type} [Field E] [NumberField E]
    {ι : E →ₐ[ℚ] End A} {ι' : E →ₐ[ℚ] End A'} (φ : A ≅ A')
    (hφ : ∀ e : E, (ι e : A ⟶ A) ≫ φ.hom = φ.hom ≫ (ι' e : A' ⟶ A'))
    (h : IsPrimitive ctx ι) : IsPrimitive ctx ι' := sorry

/-- GT.1/primitive: for `A` of GL₂(E)-type, primitive if and only if `ℚ`-simple
(GT.1/ribet-theorem-2-1). -/
theorem isPrimitive_iff_isSimple {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (hι : IsGL2TypeVia ctx ι) : IsPrimitive ctx ι ↔ Simple A := sorry

-- test: GL2Type.power_degree_one
example {B : ctx.AV} {F : Type} [Field F] [NumberField F] (ιB : F →ₐ[ℚ] End B)
    (b : Basis (Fin 1) F F) :
    (∃ φ : ctx.pow B 1 ≅ B,
        ∀ e : F, (power ctx ιB b e : ctx.pow B 1 ⟶ _) ≫ φ.hom = φ.hom ≫ (ιB e : B ⟶ B)) ∧
      (IsGL2TypeVia ctx ιB → (IsPrimitive ctx ιB ↔ Simple B)) := sorry

-- test: GL2Type.power_not_primitive
example (B : ctx.AV) (hB : ctx.dim B = 1) (E : Type) [Field E] [NumberField E]
    [IsSplittingField ℚ E (X ^ 2 - 2 : ℚ[X])] (b : Basis (Fin 2) ℚ E) :
    IsGL2TypeVia ctx (power ctx (Algebra.ofId ℚ (End B)) b) ∧
      ¬ IsPrimitive ctx (power ctx (Algebra.ofId ℚ (End B)) b) := sorry

-- test: GL2Type.J0_23_primitive
-- (that `ℚ(√5)` acts through the Hecke operators of `J₀(23)` is not stated: the carrier has
-- no Hecke operators on `J₀(N)`.)
example (E : Type) [Field E] [NumberField E] [IsSplittingField ℚ E (X ^ 2 - 5 : ℚ[X])] :
    ctx.dim (ctx.J0 23) = 2 ∧
      ∃ ι : E →ₐ[ℚ] End (ctx.J0 23), IsGL2TypeVia ctx ι ∧ IsPrimitive ctx ι := sorry

-- test: GL2Type.power_compat_R25_5
example {B : ctx.AV} {F : Type} [Field F] [NumberField F] (ιB : F →ₐ[ℚ] End B)
    (hB : IsGL2TypeVia ctx ιB) {E : Type} [Field E] [NumberField E] [Algebra F E] {n : ℕ}
    (b : Basis (Fin n) F E) :
    finrank ℚ E = ctx.dim (ctx.pow B n) ∧ IsGL2TypeVia ctx (power ctx ιB b) := sorry

/-! ### GT.1/ribet-theorem-2-1 -/

/-- `End⁰` is a number field of degree `dim A`: commutative, every nonzero element
invertible, of `ℚ`-dimension `dim A`. -/
def EndIsNumberFieldOfDim (A : ctx.AV) : Prop :=
  (∀ x y : End A, x * y = y * x) ∧ (∀ x : End A, x ≠ 0 → IsUnit x) ∧
    finrank ℚ (End A) = ctx.dim A

/-- GT.1/ribet-theorem-2-1 (Ribet, Theorem 2.1). For `A` of GL₂(E)-type with
`X = End⁰_ℚ(A)`: the commutant of `E` in `X` is `E`; the centre of `X` lies in `E`, is a
field `F`, `X ≅ M_n(F)` with `n = [E : F]`, and `A` is `E`-equivariantly isogenous to
`E ⊗_F B` with `B` `ℚ`-simple of GL₂(F)-type and `End⁰(B) = F`; and primitive ⇔ simple ⇔
`X` is a number field of degree `dim A`, in which case `X = E`. -/
theorem ribetTheorem21 {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (hι : IsGL2TypeVia ctx ι) :
    (∀ x : End A, (∀ e : E, x * ι e = ι e * x) → x ∈ ι.range) ∧
      Subalgebra.center ℚ (End A) ≤ ι.range ∧
      (∃ (F : Type) (_ : Field F) (_ : NumberField F) (_ : Algebra F E) (n : ℕ)
          (b : Basis (Fin n) F E) (B : ctx.AV) (ιB : F →ₐ[ℚ] End B),
          Nonempty (Subalgebra.center ℚ (End A) ≃ₐ[ℚ] F) ∧
          Nonempty (End A ≃ₐ[ℚ] Matrix (Fin n) (Fin n) F) ∧
          Simple B ∧ IsGL2TypeVia ctx ιB ∧ Function.Bijective ιB ∧
          ∃ φ : A ≅ ctx.pow B n,
            ∀ e : E, (ι e : A ⟶ A) ≫ φ.hom = φ.hom ≫ (power ctx ιB b e : ctx.pow B n ⟶ _)) ∧
      (IsPrimitive ctx ι ↔ Simple A) ∧
      (Simple A ↔ EndIsNumberFieldOfDim ctx A) ∧
      (Simple A → Function.Bijective ι) := sorry

/-! ### GT.1/endomorphism-field -/

/-- GT.1/endomorphism-field: `E_A = End⁰_ℚ(A)`, as a type carrying a field structure when
`A` is `ℚ`-simple of GL₂-type. -/
def endField (A : ctx.AV) : Type := End A

/-- The field structure of `E_A` (its ring structure is that of `End⁰_ℚ(A)`). -/
instance endField.instField (A : ctx.AV) [Fact (Simple A ∧ IsGL2TypeSome ctx A)] :
    Field (endField ctx A) :=
  letI : CommRing (End A) := { (inferInstance : Ring (End A)) with mul_comm := sorry }
  letI : Nontrivial (End A) := sorry
  (Field.ofIsUnitOrEqZero (R := End A) sorry : Field (End A))

/-- GT.1/endomorphism-field: `E_A` is a number field. -/
instance endField_numberField (A : ctx.AV) [Fact (Simple A ∧ IsGL2TypeSome ctx A)] :
    NumberField (endField ctx A) := sorry

/-- GT.1/endomorphism-field: `[E_A : ℚ] = dim A` (the degree half of
`endField_numberField`). -/
theorem endField_finrank (A : ctx.AV) [Fact (Simple A ∧ IsGL2TypeSome ctx A)] :
    finrank ℚ (endField ctx A) = ctx.dim A := sorry

/-- GT.1/endomorphism-field: the tautological GL₂(E_A)-type structure `E_A = End⁰(A)`. -/
def endField_isGL2Type (A : ctx.AV) [Fact (Simple A ∧ IsGL2TypeSome ctx A)] :
    {ι : endField ctx A →ₐ[ℚ] End A // IsGL2TypeVia ctx ι} :=
  ⟨{ toFun := fun x => x
     map_one' := sorry
     map_mul' := sorry
     map_zero' := sorry
     map_add' := sorry
     commutes' := sorry }, sorry⟩

/-- GT.1/endomorphism-field: every GL₂(E)-type structure `ι` on `A` is a field isomorphism
`E ≃ E_A`, through which the λ-adic representations of `(A, E)` and `(A, E_A)` correspond. -/
theorem endField_equiv (A : ctx.AV) [Fact (Simple A ∧ IsGL2TypeSome ctx A)] {E : Type}
    [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A) (hι : IsGL2TypeVia ctx ι) :
    ∃ e : E ≃ₐ[ℚ] endField ctx A, ∀ x : E, (endField_isGL2Type ctx A).1 (e x) = ι x := sorry

/-- GT.1/endomorphism-field: a `ℚ`-isogeny `φ : A → A'` induces `E_A ≃ E_{A'}`,
`α ↦ φ ∘ α ∘ φ⁻¹`. (Its compatibility with the λ-adic representations needs the
functoriality of `V_τ`, which the carrier does not supply; it is not stated.) -/
def endField_isogeny {A A' : ctx.AV} [Fact (Simple A ∧ IsGL2TypeSome ctx A)]
    [Fact (Simple A' ∧ IsGL2TypeSome ctx A')] (φ : A ≅ A') :
    endField ctx A ≃+* endField ctx A' where
  toFun α := φ.inv ≫ (α : A ⟶ A) ≫ φ.hom
  invFun β := φ.hom ≫ (β : A' ⟶ A') ≫ φ.inv
  left_inv := sorry
  right_inv := sorry
  map_mul' := sorry
  map_add' := sorry

/-- GT.1/endomorphism-field: the canonical involution of `E_A` (GT.1/totally-real-or-cm) is
the Rosati involution of every `ℚ`-polarization. -/
theorem endField_involution (A : ctx.AV) [Fact (Simple A ∧ IsGL2TypeSome ctx A)]
    (bar : endField ctx A →+* endField ctx A) (hbar : IsCanonicalInvolution bar)
    (P : ctx.Pol A) (x : endField ctx A) :
    ctx.rosati P (x : End A) = (bar x : End A) := sorry

-- test: GL2Type.endField_elliptic
example (E₀ : ctx.AV) (h : ctx.dim E₀ = 1) [Fact (Simple E₀ ∧ IsGL2TypeSome ctx E₀)] :
    finrank ℚ (endField ctx E₀) = 1 ∧ ctx.intEnd E₀ = ⊥ := sorry

-- test: GL2Type.endField_J0_23
-- (the generator is `T₂`; the carrier has no Hecke operators on `J₀(23)`, so the statement
-- records a generator with the minimal equation of `T₂`.)
example [Fact (Simple (ctx.J0 23) ∧ IsGL2TypeSome ctx (ctx.J0 23))] :
    finrank ℚ (endField ctx (ctx.J0 23)) = 2 ∧
      ∃ t : endField ctx (ctx.J0 23), t ^ 2 + t - 1 = 0 ∧ Algebra.adjoin ℚ {t} = ⊤ := sorry

-- test: GL2Type.endField_J1_13
example [Fact (Simple (ctx.J1 13) ∧ IsGL2TypeSome ctx (ctx.J1 13))] :
    IsCMField (endField ctx (ctx.J1 13)) ∧ finrank ℚ (endField ctx (ctx.J1 13)) = 2 ∧
      (∃ x : endField ctx (ctx.J1 13), x ^ 2 = -3) ∧
      ∃ f : ctx.Newform 13, orderOf (ctx.nebentypus f) = 6 := sorry

-- test: GL2Type.endField_not_simple
example (B : ctx.AV) (hB : ctx.dim B = 1) :
    Nonempty (End (ctx.pow B 2) ≃ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ) ∧
      ¬ Simple (ctx.pow B 2) ∧ ¬ EndIsNumberFieldOfDim ctx (ctx.pow B 2) := sorry

/-! ### GT.1/totally-real-or-cm -/

/-- GT.1/totally-real-or-cm. The endomorphism field `E` of a `ℚ`-simple GL₂-type `A` is
totally real or CM, and the Rosati involution of every `ℚ`-polarization preserves `E` and
restricts to its canonical involution (so does not depend on the polarization). -/
theorem totallyRealOrCm {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) :
    (IsTotallyReal E ∨ IsCMField E) ∧
      ∃ bar : E →+* E, IsCanonicalInvolution bar ∧
        ∀ (P : ctx.Pol A) (x : E), ctx.rosati P (ι x) = ι (bar x) := sorry

/-! ### GT.1/modular-quotient-is-gl2-type -/

/-- GT.1/modular-quotient-is-gl2-type. For a weight-two newform `f` of level `N`, the Hecke
action `K_f → End⁰(A_f)` is a GL₂(K_f)-type structure, `A_f` is `ℚ`-simple with
`End⁰(A_f) = K_f`, and `J₁(N) ~ ∏_{M ∣ N} ∏_{[g]} A_g ^ {d(N/M)}` over representatives `g` of
the Galois orbits of newforms of level `M ∣ N`. -/
theorem modularQuotientIsGl2Type {N : ℕ} [NeZero N] (f : ctx.Newform N) :
    IsGL2TypeVia ctx (ctx.hecke f) ∧ Simple (ctx.Af f) ∧ Function.Bijective (ctx.hecke f) ∧
      ∃ (I : Type) (_ : Fintype I) (M : I → ℕ) (g : (i : I) → ctx.Newform (M i)),
        (∀ i, M i ∣ N) ∧
        (∀ (M' : ℕ) (h : ctx.Newform M'), M' ∣ N → ∃! i, ctx.IsGaloisConj (g i) h) ∧
        ctx.Isogenous (ctx.J1 N)
          (ctx.pi fun i => ctx.pow (ctx.Af (g i)) (Nat.divisors (N / M i)).card) := sorry

end TauCeti.GL2Type

/-! ## GT.2 — The λ-adic system of a GL₂-type variety (Ribet §3) -/

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-! ### GT.2/integral-model -/

/-- An integral model of `(A, ι)`: an `E`-equivariantly `ℚ`-isogenous `A'` on which the action
of `E` restricts to `End_ℚ(A') = 𝒪_E`. -/
structure IntegralModel {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) where
  /-- The variety `A'`. -/
  A' : ctx.AV
  /-- The action of `E` on `A'`. -/
  ι' : E →ₐ[ℚ] End A'
  /-- The `ℚ`-isogeny `A → A'`. -/
  φ : A ≅ A'
  /-- `φ` is `E`-equivariant. -/
  equivariant : ∀ e : E, (ι e : A ⟶ A) ≫ φ.hom = φ.hom ≫ (ι' e : A' ⟶ A')
  /-- `End_ℚ(A') = 𝒪_E`. -/
  end_eq : ctx.intEnd A' = (ι'.toRingHom.comp (algebraMap (𝓞 E) E)).range

/-- GT.2/integral-model: an `E`-equivariantly isogenous `A'` with `End_ℚ(A') = 𝒪_E`. -/
def integralModel {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (h : IsEndField ctx A ι) : IntegralModel ctx ι := sorry

/-- GT.2/integral-model: `End_ℚ(integralModel A) = 𝒪_E` as subrings of `E = End⁰`. -/
theorem integralModel_end {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) :
    ctx.intEnd (integralModel ctx ι h).A' =
      ((integralModel ctx ι h).ι'.toRingHom.comp (algebraMap (𝓞 E) E)).range :=
  (integralModel ctx ι h).end_eq

/-- GT.2/integral-model: `ρ̄_λ : G_ℚ → GL(A'[λ])`, from R01.6 `lambdaTorsion`. -/
def residualRep {A : ctx.AV} {E : Type} [Field E] [NumberField E] {ι : E →ₐ[ℚ] End A}
    (M : IntegralModel ctx ι) (lam : Ideal (𝓞 E)) :
    Representation (𝓞 E ⧸ lam) GQ (ctx.lamTors M.A' M.ι' lam) :=
  ctx.rhoBar M.A' M.ι' lam

/-- `A'[λ]` is finite-dimensional over `𝔽_λ`. -/
instance lamTors_finite (A : ctx.AV) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (lam : Ideal (𝓞 E)) [lam.IsMaximal] :
    Module.Finite (𝓞 E ⧸ lam) (ctx.lamTors A ι lam) := sorry

/-- GT.2/integral-model: `dim_{𝔽_λ} A'[λ] = 2`. -/
@[simp]
theorem residualRep_finrank {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    {ι : E →ₐ[ℚ] End A} (h : IsEndField ctx A ι) (M : IntegralModel ctx ι)
    (lam : Ideal (𝓞 E)) [lam.IsMaximal] :
    finrank (𝓞 E ⧸ lam) (ctx.lamTors M.A' M.ι' lam) = 2 := sorry

/-- GT.2/integral-model: for `p ∉ S`, `p ∉ λ`, the characteristic polynomial of `ρ̄_λ(Frob_p)` is
`X² - ā_p X + ε̄(p) p`, the reduction of GT.2/frobenius-polynomial (with `a_p ∈ 𝒪_E` the
Frobenius traces and `ε` the determinant character, with values in `𝒪_E^×`). -/
theorem residualRep_charpoly {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    {ι : E →ₐ[ℚ] End A} (h : IsEndField ctx A ι) (M : IntegralModel ctx ι)
    (a : ℕ → 𝓞 E) (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p))
    (ε : GQ →* (𝓞 E)ˣ) (hε : IsDetChar ctx ι ((Units.map (algebraMap (𝓞 E) E).toMonoidHom).comp ε))
    (lam : Ideal (𝓞 E)) [lam.IsMaximal] (p : ℕ) (hp : p.Prime) (hS : ¬ ctx.IsBad A p)
    (hpl : (p : 𝓞 E) ∉ lam) (σ : GQ) (hσ : IsArithFrobAt σ p) :
    LinearMap.charpoly (residualRep ctx M lam σ) =
      X ^ 2 - C (Ideal.Quotient.mk lam (a p)) * X +
        C (Ideal.Quotient.mk lam ((ε σ : 𝓞 E) * p)) := sorry

/-- GT.2/integral-model: `ρ̄_λ^{ss}` does not depend on the integral model: the two residual
representations have the same characteristic polynomials (equivalently, by Brauer–Nesbitt,
isomorphic semisimplifications). The independence of the lattice is the same statement for
the lattices `T_λ(A')`, which the carrier does not expose. -/
theorem residualRep_ss_indep {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    {ι : E →ₐ[ℚ] End A} (h : IsEndField ctx A ι) (M M' : IntegralModel ctx ι)
    (lam : Ideal (𝓞 E)) [lam.IsMaximal] (σ : GQ) :
    LinearMap.charpoly (residualRep ctx M lam σ) = LinearMap.charpoly (residualRep ctx M' lam σ) :=
  sorry

-- test: GL2Type.residualRep_elliptic
open Classical in
example (W : WeierstrassCurve ℚ) [W.IsElliptic] (ℓ : ℕ) [Fact ℓ.Prime]
    (h : IsEndField ctx (ctx.ell W) (Algebra.ofId ℚ (End (ctx.ell W))))
    (M : IntegralModel ctx (Algebra.ofId ℚ (End (ctx.ell W)))) :
    ∃ e : ctx.lamTors M.A' M.ι' (Ideal.span {(ℓ : 𝓞 ℚ)}) ≃
        {P : (W.baseChange Qbar).toAffine.Point // ℓ • P = 0},
      (∀ x y : ctx.lamTors M.A' M.ι' (Ideal.span {(ℓ : 𝓞 ℚ)}),
        ((e (x + y)) : (W.baseChange Qbar).toAffine.Point) = e x + e y) ∧
      ∀ (σ : GQ) (x : ctx.lamTors M.A' M.ι' (Ideal.span {(ℓ : 𝓞 ℚ)})),
        ((e (residualRep ctx M _ σ x)) : (W.baseChange Qbar).toAffine.Point) =
          WeierstrassCurve.Affine.Point.map (W' := W.toAffine) (GQ.toAut σ).toAlgHom
            (e x : (W.baseChange Qbar).toAffine.Point) := sorry

-- test: GL2Type.residualRep_det
example {A : ctx.AV} {E : Type} [Field E] [NumberField E] {ι : E →ₐ[ℚ] End A}
    (h : IsEndField ctx A ι) (M : IntegralModel ctx ι) (ε : GQ →* (𝓞 E)ˣ)
    (hε : IsDetChar ctx ι ((Units.map (algebraMap (𝓞 E) E).toMonoidHom).comp ε))
    (ℓ : ℕ) [Fact ℓ.Prime] (lam : Ideal (𝓞 E)) [lam.IsMaximal] (hl : (ℓ : 𝓞 E) ∈ lam)
    (σ : GQ) :
    LinearMap.det (residualRep ctx M lam σ) =
      Ideal.Quotient.mk lam (ε σ : 𝓞 E) * cycloCharMod ℓ (𝓞 E ⧸ lam) σ := sorry

-- test: GL2Type.integralModel_trivial
example {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (h : ctx.intEnd A = (ι.toRingHom.comp (algebraMap (𝓞 E) E)).range) :
    ∃ M : IntegralModel ctx ι, M.A' = A := sorry

-- test: GL2Type.residualRep_not_A_l
example {A : ctx.AV} {E : Type} [Field E] [NumberField E] {ι : E →ₐ[ℚ] End A}
    (h : IsEndField ctx A ι) (M : IntegralModel ctx ι) (ℓ : ℕ) [Fact ℓ.Prime]
    (lam : Ideal (𝓞 E)) [lam.IsMaximal] (hl : (ℓ : 𝓞 E) ∈ lam)
    (hne : lam ≠ Ideal.span {(ℓ : 𝓞 E)}) :
    Nat.card (ctx.lamTors M.A' M.ι' (Ideal.span {(ℓ : 𝓞 E)})) = ℓ ^ (2 * finrank ℚ E) ∧
      Nat.card (ctx.lamTors M.A' M.ι' lam) < Nat.card (ctx.lamTors M.A' M.ι' (Ideal.span {(ℓ : 𝓞 E)})) :=
  sorry

/-! ### GT.2/frobenius-polynomial -/

/-- GT.2/frobenius-polynomial. For `p ∉ S` there are `a_p, d_p ∈ 𝒪_E` such that for every
`ℓ ≠ p` and every `τ : E → ℚ̄_ℓ` (equivalently every `λ ∤ p`), `ρ_τ` is unramified at `p` and the
characteristic polynomial of `ρ_τ(Frob_p)` is `X² - τ(a_p) X + τ(d_p)`: the system is
`E`-rational and strictly compatible with exceptional set `S`. -/
theorem frobeniusPolynomial {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (p : ℕ) (hp : p.Prime)
    (hS : ¬ ctx.IsBad A p) :
    ∃ a d : 𝓞 E, ∀ (ℓ : ℕ) [Fact ℓ.Prime], ℓ ≠ p → ∀ τ : E →+* Qlbar ℓ,
      IsUnramifiedAt (ctx.rhoEmb A ι ℓ τ) p ∧
        ∀ σ : GQ, IsArithFrobAt σ p →
          LinearMap.charpoly (ctx.rhoEmb A ι ℓ τ σ) = X ^ 2 - C (τ a) * X + C (τ d) := sorry

/-! ### GT.2/determinant-character -/

/-- GT.2/determinant-character (Ribet, Lemma 3.1). There is a finite-order character
`ε : G_ℚ → E^×`, unramified outside `S`, with `det ρ_λ = ε · χ_ℓ` for every `λ`; as a Dirichlet
character it has conductor supported on `S` and `d_p = ε(p) p`; and `N_{E/ℚ}(ε) = 1`. -/
theorem determinantCharacter {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) :
    ∃ ε : GQ →* Eˣ, IsFiniteOrderChar ε ∧
      (∀ p, p.Prime → ¬ ctx.IsBad A p → ∀ σ : GQ, IsInertiaAt σ p → ε σ = 1) ∧
      IsDetChar ctx ι ε ∧
      (∃ (N : ℕ) (χ : DirichletCharacter E N), (∀ q, q.Prime → q ∣ N → ctx.IsBad A q) ∧
        ∀ p, p.Prime → ¬ ctx.IsBad A p → ∀ σ : GQ, IsArithFrobAt σ p → (ε σ : E) = χ p) ∧
      ∀ σ : GQ, Algebra.norm ℚ (ε σ : E) = 1 := sorry

/-! ### GT.2/odd -/

/-- GT.2/odd (Ribet, Lemma 3.2). `ε` is even and every `ρ_λ` is odd: `det ρ_τ(c) = -1` for every
complex conjugation `c`. -/
theorem odd {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (h : IsEndField ctx A ι) (ε : GQ →* Eˣ) (hε : IsDetChar ctx ι ε) (c : GQ)
    (hc : IsComplexConj c) :
    ε c = 1 ∧ ∀ (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ),
      LinearMap.det (ctx.rhoEmb A ι ℓ τ c) = -1 := sorry

/-! ### GT.2/absolute-irreducibility -/

/-- GT.2/absolute-irreducibility (Ribet, Proposition 3.3). Every `ρ_λ` is absolutely
irreducible; the `G_ℚ`-commutant of `V_ℓ(A)` is `End⁰(A) ⊗ ℚ_ℓ = E ⊗ ℚ_ℓ = ∏_{λ ∣ ℓ} E_λ`, so
`End_{ℚ_ℓ[G_ℚ]} V_λ(A) = E_λ`; and for a number field `K ⊆ ℚ̄` the `G_K`-commutant of
`V_ℓ(A_K)` is `End⁰_K(A_K) ⊗ ℚ_ℓ`. -/
theorem absoluteIrreducibility {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (ℓ : ℕ) [Fact ℓ.Prime] :
    (∀ τ : E →+* Qlbar ℓ, IsAbsIrred (ctx.rhoEmb A ι ℓ τ)) ∧
      (∀ T : Module.End ℚ_[ℓ] (ctx.V A ℓ),
        (∀ σ : GQ, T * ctx.galRep A ℓ σ = ctx.galRep A ℓ σ * T) ↔
          T ∈ Submodule.span ℚ_[ℓ] (Set.range (ctx.tateEnd A ℓ))) ∧
      ∀ (K : NF), FiniteDimensional ℚ K →
        ∀ T : Module.End ℚ_[ℓ] (ctx.VK ((ctx.bcQ K).obj A) ℓ),
          (∀ σ : GK K, T * ctx.galRepK ((ctx.bcQ K).obj A) ℓ σ =
              ctx.galRepK ((ctx.bcQ K).obj A) ℓ σ * T) ↔
            T ∈ Submodule.span ℚ_[ℓ] (Set.range (ctx.tateEndK ((ctx.bcQ K).obj A) ℓ)) := sorry

/-! ### GT.2/coefficient-conjugation -/

/-- GT.2/coefficient-conjugation (Ribet, Proposition 3.4). `a_p = ε(p) · ā_p` for `p ∉ S`;
equivalently `V_τ ≅ V_{τ ∘ bar} ⊗ τ(ε)` for every embedding `τ : E → ℚ̄_ℓ`. -/
theorem coefficientConjugation {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (a : ℕ → E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) (ε : GQ →* Eˣ)
    (hε : IsDetChar ctx ι ε) (bar : E →+* E) (hbar : IsCanonicalInvolution bar) :
    (∀ p, p.Prime → ¬ ctx.IsBad A p → ∀ σ : GQ, IsArithFrobAt σ p →
        a p = (ε σ : E) * bar (a p)) ∧
      ∀ (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ),
        RepIso (ctx.rhoEmb A ι ℓ τ)
          (twist (ctx.rhoEmb A ι ℓ (τ.comp bar)) ((Units.map τ.toMonoidHom).comp ε)) := sorry

/-! ### GT.2/coefficients-generate -/

/-- GT.2/coefficients-generate (Ribet, Proposition 3.5). For every finite `S' ⊇ S`,
`E = ℚ(a_p : p ∉ S')`. -/
theorem coefficientsGenerate {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (a : ℕ → E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) (S' : Finset ℕ)
    (hS' : ∀ p, p.Prime → ctx.IsBad A p → p ∈ S') :
    IntermediateField.adjoin ℚ (a '' {p | p.Prime ∧ p ∉ S'}) = ⊤ := sorry

/-! ### GT.2/inner-twist-field -/

/-- GT.2/inner-twist-field (Ribet, Proposition 3.6). `F = ℚ(a_p² / ε(p) : p ∉ S)` is totally
real and `E/F` is abelian. -/
theorem innerTwistField {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (a : ℕ → E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) (ε : GQ →* Eˣ)
    (hε : IsDetChar ctx ι ε) :
    let F : IntermediateField ℚ E := IntermediateField.adjoin ℚ
      {x | ∃ (p : ℕ) (σ : GQ), p.Prime ∧ ¬ ctx.IsBad A p ∧ IsArithFrobAt σ p ∧
        x = a p ^ 2 / (ε σ : E)}
    IsTotallyReal F ∧ IsGalois F E ∧ ∀ g g' : E ≃ₐ[F] E, g * g' = g' * g := sorry

/-! ### GT.2/residual-irreducibility -/

/-- GT.2/residual-irreducibility (Ribet, Lemma 3.7). For all but finitely many maximal ideals
`λ` of `𝒪_E`, `ρ̄_λ` on `A'[λ]` is absolutely irreducible. -/
theorem residualIrreducibility {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (M : IntegralModel ctx ι) :
    Set.Finite {lam : Ideal (𝓞 E) |
      ∃ _ : lam.IsMaximal, ¬ IsAbsIrredOver (residualRep ctx M lam)} := sorry

/-! ### GT.2/conductor-bound -/

/-- GT.2/conductor-bound. For `λ` of degree one over `ℓ` (an embedding `τ` with values in
`ℚ_ℓ`), the prime-to-`ℓ` conductor `N(ρ_λ)` divides `cond(A)`, and `N(ρ̄_λ) ∣ N(ρ_λ)` for the
residual representation at the prime `λ` induced by `τ`. -/
theorem conductorBound {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (ℓ : ℕ) [Fact ℓ.Prime]
    (τ : E →+* Qlbar ℓ) (hτ : ∀ x : E, τ x ∈ (algebraMap ℚ_[ℓ] (Qlbar ℓ)).range) :
    ctx.primeToConductor (ctx.rhoEmb A ι ℓ τ) ℓ ∣ ctx.cond A ∧
      ∀ (M : IntegralModel ctx ι) (lam : Ideal (𝓞 E)) [lam.IsMaximal], InducesPrime τ lam →
        ctx.primeToConductor (residualRep ctx M lam) ℓ ∣
          ctx.primeToConductor (ctx.rhoEmb A ι ℓ τ) ℓ := sorry

/-! ### GT.2/crystalline-at-good-primes -/

/-- GT.2/crystalline-at-good-primes. For `ℓ ∉ S` and `τ : E → ℚ̄_ℓ`, `ρ_τ|_{G_{ℚ_ℓ}}` is
crystalline with Hodge–Tate weights `0` and `1`, each once (`χ_ℓ` has weight `1`), so the system
has weights `(1, 0)` and is regular; and for an integral model `A'`, `A'[λ]` extends to a finite
flat group scheme over `ℤ_ℓ` for every `λ ∣ ℓ`. -/
theorem crystallineAtGoodPrimes {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : ¬ ctx.IsBad A ℓ) :
    (∀ τ : E →+* Qlbar ℓ,
      ctx.dcrisDim (ctx.rhoEmb A ι ℓ τ) = finrank (Qlbar ℓ) (ctx.Vemb A ι ℓ τ) ∧
        ctx.htWeights (ctx.rhoEmb A ι ℓ τ) = {0, 1}) ∧
      ∀ (M : IntegralModel ctx ι) (lam : Ideal (𝓞 E)) [lam.IsMaximal], (ℓ : 𝓞 E) ∈ lam →
        Nonempty (ctx.ffModels (residualRep ctx M lam) ℓ) := sorry

end TauCeti.GL2Type

/-! ## GT.3 — Modularity of GL₂-type varieties (Ribet §4, Khare–Wintenberger Corollary 10.2(i)) -/

/-! ### GT.3/modular-abelian-variety -/

namespace TauCeti.AbelianVariety

open GL2Type GL2Type.AVContext

variable (ctx : GL2Type.AVContext)

/-- GT.3/modular-abelian-variety: `A` is modular of level `N`: there is a surjection
`J₁(N) → A` over `ℚ`. In the isogeny category a surjection up to isogeny is an epimorphism,
and a multiple of it is a genuine surjective homomorphism. -/
def IsModularOfLevel (A : ctx.AV) (N : ℕ) : Prop :=
  0 < N ∧ ∃ q : ctx.J1 N ⟶ A, Epi q

/-- GT.3/modular-abelian-variety: `A` is modular of level `N` for `Γ₀`: there is a surjection
`J₀(N) → A` over `ℚ`. -/
def IsModularOfLevelGamma0 (A : ctx.AV) (N : ℕ) : Prop :=
  0 < N ∧ ∃ q : ctx.J0 N ⟶ A, Epi q

/-- GT.3/modular-abelian-variety: `A` is modular of some level `N ≥ 1`. -/
def IsModular (A : ctx.AV) : Prop :=
  ∃ N : ℕ, 1 ≤ N ∧ IsModularOfLevel ctx A N

/-- GT.3/modular-abelian-variety: modularity of level `N` propagates to multiples `M ≥ 1` of
`N` (the level must be positive: `N ∣ 0` always holds). -/
theorem IsModularOfLevel.mono {A : ctx.AV} {N M : ℕ} (h : IsModularOfLevel ctx A N)
    (hNM : N ∣ M) (hM : 0 < M) : IsModularOfLevel ctx A M := sorry

/-- GT.3/modular-abelian-variety: a `ℚ`-isogeny `A → A'` transports modularity. -/
theorem IsModular.of_isogeny {A A' : ctx.AV} (φ : A ≅ A') (h : IsModular ctx A) :
    IsModular ctx A' := sorry

/-- GT.3/modular-abelian-variety: a quotient of a modular abelian variety is modular. -/
theorem IsModular.quotient {A A' : ctx.AV} (q : A ⟶ A') [Epi q] (h : IsModular ctx A) :
    IsModular ctx A' := sorry

/-- GT.3/modular-abelian-variety: for `ℚ`-simple `A` of GL₂-type with endomorphism field `E`,
modular ⇔ isogenous to some `A_f` ⇔ some `V_λ(A) ≅ ρ_{f,λ'}` (GT.3/modularity-equivalences). -/
theorem isModular_iff {A : ctx.AV} {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End A)
    (h : IsEndField ctx A ι) :
    (IsModular ctx A ↔ ∃ (N : ℕ) (f : ctx.Newform N), ctx.Isogenous (ctx.Af f) A) ∧
      (IsModular ctx A ↔ ∃ (ℓ : ℕ) (_ : Fact ℓ.Prime) (τ : E →+* Qlbar ℓ) (N : ℕ)
        (f : ctx.Newform N) (τ' : ctx.Kf f →+* Qlbar ℓ),
          RepIso (ctx.rhoEmb A ι ℓ τ) (ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ τ')) := sorry

/-- GT.3/modular-abelian-variety: modular of level `N` for `Γ₀` implies modular of level `N`
(`X₁(N) → X₀(N)` gives `J₁(N) → J₀(N)` surjective up to isogeny). -/
theorem IsModularOfLevel.gamma0 {A : ctx.AV} {N : ℕ} (h : IsModularOfLevelGamma0 ctx A N) :
    IsModularOfLevel ctx A N := sorry

/-- GT.3/modular-abelian-variety: for an elliptic curve `E₀` over `ℚ`, `Γ₀`-modularity at
level `N` is formulation (ii) of EllipticCurveModularity R29.6 (a nonconstant `X₀(N) → E₀`,
i.e. a nonzero `J₀(N) → E₀`). -/
theorem IsModular.elliptic (E₀ : ctx.AV) (h : ctx.dim E₀ = 1) (N : ℕ) (hN : 0 < N) :
    IsModularOfLevelGamma0 ctx E₀ N ↔ ∃ q : ctx.J0 N ⟶ E₀, q ≠ 0 := sorry

-- test: IsModular.X0_11
example : ctx.dim (ctx.J0 11) = 1 ∧ IsModularOfLevelGamma0 ctx (ctx.J0 11) 11 := sorry

-- test: IsModular.zero
example (Z : ctx.AV) (hZ : Limits.IsZero Z) :
    (∀ N, 0 < N → IsModularOfLevel ctx Z N) ∧
      ∀ N, 0 < N → (N ≤ 10 ∨ N = 12) → Limits.IsZero (ctx.J1 N) := sorry

-- test: IsModular.J1_13_not_gamma0
example : IsModularOfLevel ctx (ctx.J1 13) 13 ∧ Limits.IsZero (ctx.J0 13) ∧
    ¬ IsModularOfLevelGamma0 ctx (ctx.J1 13) 13 := sorry

-- test: IsModular.level_not_minimal
example : IsModularOfLevel ctx (ctx.J0 11) 11 ∧ IsModularOfLevel ctx (ctx.J0 11) 22 ∧
    ctx.cond (ctx.J0 11) = 11 := sorry

end TauCeti.AbelianVariety

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-! ### GT.3/serre-witnesses -/

/-- The set `Λ` of GT.3/serre-witnesses: maximal ideals `λ` of `𝒪_E` of degree one over an odd
prime `ℓ ∉ S` unramified in `E`, with `ρ̄_λ` absolutely irreducible. -/
def serreSet {A : ctx.AV} {E : Type} [Field E] [NumberField E] {ι : E →ₐ[ℚ] End A}
    (M : IntegralModel ctx ι) : Set (Ideal (𝓞 E)) :=
  {lam | ∃ (_ : lam.IsMaximal) (ℓ : ℕ), ℓ.Prime ∧ ℓ ≠ 2 ∧ ¬ ctx.IsBad A ℓ ∧
    (ℓ : 𝓞 E) ∈ lam ∧ Nat.card (𝓞 E ⧸ lam) = ℓ ∧
    (∀ P : Ideal (𝓞 E), P.IsPrime → P ≠ ⊥ → ¬ Ideal.span {(ℓ : 𝓞 E)} ≤ P ^ 2) ∧
    IsAbsIrredOver (residualRep ctx M lam)}

/-- The coefficients of `f` reduce to the Frobenius traces of `A` modulo `λ`: a ring map
`φ : 𝒪_{K_f} → 𝔽_λ` with `φ(a_p(f)) = a_p(A) mod λ` for `p ∉ S`, `p ∉ λ`. -/
def CongruentAt {A : ctx.AV} {E : Type} [Field E] [NumberField E] (a : ℕ → 𝓞 E) {N : ℕ}
    (f : ctx.Newform N) (lam : Ideal (𝓞 E)) : Prop :=
  ∃ φ : 𝓞 (ctx.Kf f) →+* 𝓞 E ⧸ lam, ∀ p, p.Prime → ¬ ctx.IsBad A p → (p : 𝓞 E) ∉ lam →
    ∀ b : 𝓞 (ctx.Kf f), (b : ctx.Kf f) = ctx.ap f p → φ b = Ideal.Quotient.mk lam (a p)

/-- GT.3/serre-witnesses. `Λ` is infinite, and for every `λ ∈ Λ` over `ℓ` there are a weight-two
newform `g_λ` of level `N_λ ∣ cond(A)`, an integral model of `A_{g_λ}` and a prime `λ'` of
`K_{g_λ}` over `ℓ` with `ρ̄_{g_λ,λ'} ≅ ρ̄_λ` (stated through characteristic polynomials over
`𝔽_λ ⊆ 𝔽_{λ'}`, equivalent by Brauer–Nesbitt as both are absolutely irreducible); in particular
`a_p(g_λ) ≡ a_p(A)` modulo `(λ', λ)` for `p ∉ S ∪ {ℓ}`. -/
theorem serreWitnesses {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (M : IntegralModel ctx ι) (a : ℕ → 𝓞 E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) :
    (serreSet ctx M).Infinite ∧
      ∀ lam ∈ serreSet ctx M, ∃ (_ : lam.IsMaximal) (Nl : ℕ) (g : ctx.Newform Nl)
        (Mg : IntegralModel ctx (ctx.hecke g)) (lam' : Ideal (𝓞 (ctx.Kf g)))
        (_ : lam'.IsMaximal) (ψ : 𝓞 E ⧸ lam →+* 𝓞 (ctx.Kf g) ⧸ lam'),
        Nl ∣ ctx.cond A ∧
        (∀ σ : GQ, LinearMap.charpoly (residualRep ctx Mg lam' σ) =
          (LinearMap.charpoly (residualRep ctx M lam σ)).map ψ) ∧
        ∀ p, p.Prime → ¬ ctx.IsBad A p → (p : 𝓞 E) ∉ lam →
          ∀ b : 𝓞 (ctx.Kf g), (b : ctx.Kf g) = ctx.ap g p →
            Ideal.Quotient.mk lam' b = ψ (Ideal.Quotient.mk lam (a p)) := sorry

/-! ### GT.3/fixed-newform -/

/-- GT.3/fixed-newform. One weight-two newform `f` of level `N_f ∣ cond(A)` serves an infinite
`Λ_f ⊆ Λ`: for `λ ∈ Λ_f` there is `φ_λ : 𝒪_{K_f} → 𝔽_λ = 𝔽_ℓ` with
`φ_λ(a_p(f)) = a_p(A) mod λ` for `p ∉ S ∪ {ℓ}`. -/
theorem fixedNewform {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (M : IntegralModel ctx ι) (a : ℕ → 𝓞 E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) :
    ∃ (Nf : ℕ) (f : ctx.Newform Nf) (Λf : Set (Ideal (𝓞 E))),
      Nf ∣ ctx.cond A ∧ Λf ⊆ serreSet ctx M ∧ Λf.Infinite ∧
        ∀ lam ∈ Λf, CongruentAt ctx (A := A) a f lam := sorry

/-! ### GT.3/coefficient-identification -/

/-- GT.3/coefficient-identification. In the situation of GT.3/fixed-newform there is a field
isomorphism `j : K_f ≃ E` with `j(a_p(f)) = a_p(A)` and `j(ε_f(p)) = ε(p)` for `p ∉ S`,
`p ∤ N_f`. -/
theorem coefficientIdentification {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (M : IntegralModel ctx ι) (a : ℕ → 𝓞 E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) (ε : GQ →* Eˣ)
    (hε : IsDetChar ctx ι ε) {Nf : ℕ} (f : ctx.Newform Nf) (Λf : Set (Ideal (𝓞 E)))
    (hNf : Nf ∣ ctx.cond A) (hsub : Λf ⊆ serreSet ctx M) (hinf : Λf.Infinite)
    (hcong : ∀ lam ∈ Λf, CongruentAt ctx (A := A) a f lam) :
    ∃ j : ctx.Kf f ≃+* E, ∀ p, p.Prime → ¬ ctx.IsBad A p → ¬ p ∣ Nf →
      j (ctx.ap f p) = (a p : E) ∧
        ∀ σ : GQ, IsArithFrobAt σ p → j (ctx.nebentypus f p) = (ε σ : E) := sorry

/-! ### GT.3/tate-module-comparison -/

/-- GT.3/tate-module-comparison. In the situation of GT.3/coefficient-identification, for every
`τ : E → ℚ̄_ℓ`, `ρ_τ(A) ≅ ρ_{f, τ ∘ j}` (the λ-adic statement `ρ_λ ≅ ρ_{f,j⁻¹λ} ⊗ E_λ`), and
`V_ℓ(A) ≅ V_ℓ(A_f)` as `ℚ_ℓ[G_ℚ]`-modules, compatibly with `j`. -/
theorem tateModuleComparison {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (a : ℕ → 𝓞 E)
    (ha : ∀ p, p.Prime → ¬ ctx.IsBad A p → IsFrobTrace ctx ι p (a p)) {Nf : ℕ}
    (f : ctx.Newform Nf) (j : ctx.Kf f ≃+* E)
    (hj : ∀ p, p.Prime → ¬ ctx.IsBad A p → ¬ p ∣ Nf → j (ctx.ap f p) = (a p : E))
    (ℓ : ℕ) [Fact ℓ.Prime] :
    (∀ τ : E →+* Qlbar ℓ,
      RepIso (ctx.rhoEmb A ι ℓ τ) (ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ (τ.comp j.toRingHom))) ∧
      ∃ e : ctx.V A ℓ ≃ₗ[ℚ_[ℓ]] ctx.V (ctx.Af f) ℓ,
        (∀ (σ : GQ) (x : ctx.V A ℓ), e (ctx.galRep A ℓ σ x) = ctx.galRep (ctx.Af f) ℓ σ (e x)) ∧
        ∀ (y : ctx.Kf f) (x : ctx.V A ℓ),
          e (ctx.tateEnd A ℓ (ι (j y)) x) = ctx.tateEnd (ctx.Af f) ℓ (ctx.hecke f y) (e x) :=
  sorry

/-! ### GT.3/modularity-theorem -/

/-- GT.3/modularity-theorem (Ribet, Theorem 4.4; Khare–Wintenberger, Corollary 10.2(i)). Every
`ℚ`-simple `A` of GL₂-type is `ℚ`-isogenous to `A_f` for a weight-two newform `f` on `Γ₁(N_f)`,
through an isogeny intertwining the Hecke action of `K_f` with an isomorphism
`K_f ≅ End⁰_ℚ(A)`; so `A` is modular of level `N_f`. Every GL₂-type variety is modular. -/
theorem modularityTheorem :
    (∀ A : ctx.AV, Simple A → IsGL2TypeSome ctx A →
      ∃ (Nf : ℕ) (f : ctx.Newform Nf) (φ : ctx.Af f ≅ A) (j : ctx.Kf f →ₐ[ℚ] End A),
        Function.Bijective j ∧
        (∀ y : ctx.Kf f, (ctx.hecke f y : ctx.Af f ⟶ ctx.Af f) ≫ φ.hom = φ.hom ≫ (j y : A ⟶ A)) ∧
        AbelianVariety.IsModularOfLevel ctx A Nf) ∧
      ∀ A : ctx.AV, IsGL2TypeSome ctx A → AbelianVariety.IsModular ctx A := sorry

/-! ### GT.3/modularity-equivalences -/

/-- GT.3/modularity-equivalences. For `ℚ`-simple `A` of GL₂-type with endomorphism field `E`:
(a) modular ⇔ (b) isogenous to some `A_f` ⇔ (c) some `ρ_λ ≅ ρ_{f,λ'}` over `ℚ̄_ℓ` ⇔ (d) the same
for every `λ` ⇔ (e) a `ℚ`-simple quotient of some `J₁(N)`; and all hold. (In the isogeny
category "isomorphic to a quotient" and "isogenous to a quotient" coincide, so (e) is stated up
to isogeny.) -/
theorem modularityEquivalences {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) :
    (AbelianVariety.IsModular ctx A ↔ ∃ (N : ℕ) (f : ctx.Newform N), ctx.Isogenous (ctx.Af f) A) ∧
      (AbelianVariety.IsModular ctx A ↔ ∃ (ℓ : ℕ) (_ : Fact ℓ.Prime) (τ : E →+* Qlbar ℓ)
        (N : ℕ) (f : ctx.Newform N) (τ' : ctx.Kf f →+* Qlbar ℓ),
          RepIso (ctx.rhoEmb A ι ℓ τ) (ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ τ')) ∧
      (AbelianVariety.IsModular ctx A ↔ ∀ (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ),
        ∃ (N : ℕ) (f : ctx.Newform N) (τ' : ctx.Kf f →+* Qlbar ℓ),
          RepIso (ctx.rhoEmb A ι ℓ τ) (ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ τ')) ∧
      (AbelianVariety.IsModular ctx A ↔
        ∃ N : ℕ, 0 < N ∧ Simple A ∧ ∃ q : ctx.J1 N ⟶ A, Epi q) ∧
      AbelianVariety.IsModular ctx A := sorry

/-! ### GT.3/simple-quotients-characterisation -/

/-- GT.3/simple-quotients-characterisation (generalised Shimura–Taniyama–Weil). `B` is a
`ℚ`-simple quotient of some `J₁(N)` iff `B` is `ℚ`-simple of GL₂-type; and `[f] ↦ [A_f]` is a
bijection from Galois orbits of weight-two newforms to isogeny classes of such `B`. -/
theorem simpleQuotientsCharacterisation :
    (∀ B : ctx.AV, (∃ N : ℕ, 0 < N ∧ Simple B ∧ ∃ q : ctx.J1 N ⟶ B, Epi q) ↔
      Simple B ∧ IsGL2TypeSome ctx B) ∧
      (∀ {N M : ℕ} (f : ctx.Newform N) (g : ctx.Newform M),
        ctx.Isogenous (ctx.Af f) (ctx.Af g) ↔ ctx.IsGaloisConj f g) ∧
      ∀ B : ctx.AV, Simple B → IsGL2TypeSome ctx B →
        ∃ (N : ℕ) (f : ctx.Newform N), ctx.Isogenous (ctx.Af f) B := sorry

/-! ### GT.3/trivial-character -/

/-- GT.3/trivial-character (Serre, Théorème 5). For `ℚ`-simple `A` of GL₂-type with
endomorphism field `E` and character `ε`: `E` totally real ⇔ `ε = 1` ⇔ `A` is a quotient of
some `J₀(N)`; then the level can be taken to be `N_f = cond(A)^{1/dim A}`. -/
theorem trivialCharacter {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (ε : GQ →* Eˣ) (hε : IsDetChar ctx ι ε) :
    (IsTotallyReal E ↔ ε = 1) ∧
      (ε = 1 ↔ ∃ N : ℕ, AbelianVariety.IsModularOfLevelGamma0 ctx A N) ∧
      (ε = 1 → ∃ N : ℕ, N ^ ctx.dim A = ctx.cond A ∧
        AbelianVariety.IsModularOfLevelGamma0 ctx A N) := sorry

/-! ### GT.3/modular-parametrisation -/

/-- GT.3/modular-parametrisation. For `ℚ`-simple `A` of GL₂-type, modular of level `N`, there
is a surjective homomorphism `h : J₁(N) → A` factoring as a quotient `J₁(N) → A_f` followed by
an isogeny `A_f → A`; `φ = h ∘ AJ_c : X₁(N) → A` is then the parametrisation (nonconstant,
`φ(c) = 0`, image generating `A`) by the Albanese property of the Abel–Jacobi map `AJ_c`, which
the carrier does not supply as a morphism of curves. If `ε = 1`, `h` can be taken on `J₀(N)`. -/
theorem modularParametrisation {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) (N : ℕ)
    (hN : AbelianVariety.IsModularOfLevel ctx A N) (ε : GQ →* Eˣ) (hε : IsDetChar ctx ι ε) :
    (∃ (M : ℕ) (f : ctx.Newform M) (q : ctx.J1 N ⟶ ctx.Af f) (ψ : ctx.Af f ≅ A),
      M ∣ N ∧ Epi q ∧ q ≫ ψ.hom ∈ ctx.intHom (ctx.J1 N) A ∧ Epi (q ≫ ψ.hom)) ∧
      (ε = 1 → ∃ q₀ : ctx.J0 N ⟶ A, q₀ ∈ ctx.intHom (ctx.J0 N) A ∧ Epi q₀) := sorry

end TauCeti.GL2Type

/-! ## GT.4 — Conductor, exact level, strict compatibility and L-function -/

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-! ### GT.4/conductor-of-gl2-type -/

/-- GT.4/conductor-of-gl2-type (Carayol). Let `A` be `ℚ`-simple of GL₂-type with endomorphism
field `E`, `n = dim A`, and `φ : A_f ≅ A` an isogeny from a weight-two newform `f` of level `N_f`
intertwining the Hecke action with `j : K_f ≃ E` (GT.3/modularity-theorem). For every prime `p`
and every `τ : E → ℚ̄_ℓ` with `ℓ ≠ p`, `f_p(A) = n · f_p(ρ_τ)` and `f_p(ρ_τ) = ord_p(N_f)`; hence
`cond(A) = N_f ^ n`, and `cond(A_g) = N ^ {dim A_g}` for every weight-two newform `g` of level
`N`. -/
theorem conductorOfGl2Type {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) {Nf : ℕ} (f : ctx.Newform Nf)
    (φ : ctx.Af f ≅ A) (j : ctx.Kf f ≃+* E)
    (hφ : ∀ y : ctx.Kf f,
      (ctx.hecke f y : ctx.Af f ⟶ ctx.Af f) ≫ φ.hom = φ.hom ≫ (ι (j y) : A ⟶ A)) :
    (∀ p, p.Prime → ∀ (ℓ : ℕ) [Fact ℓ.Prime], ℓ ≠ p → ∀ τ : E →+* Qlbar ℓ,
      ctx.condExp A p = ctx.dim A * ctx.artinExp (ctx.rhoEmb A ι ℓ τ) p ∧
        ctx.artinExp (ctx.rhoEmb A ι ℓ τ) p = padicValNat p Nf) ∧
      ctx.cond A = Nf ^ ctx.dim A ∧
      ∀ {N : ℕ} (g : ctx.Newform N), ctx.cond (ctx.Af g) = N ^ ctx.dim (ctx.Af g) := sorry

/-! ### GT.4/exact-level -/

/-- GT.4/exact-level. For `ℚ`-simple `A` of GL₂-type of dimension `n`, `cond(A)` is an `n`-th
power `N(A) ^ n`; `N(A) = N_f` for every newform `f` with `A ~ A_f`; `A` is modular of level
`M ≥ 1` iff `N(A) ∣ M`; `N(A) > 1`; and the level `cond(A) ^ n` of Khare–Wintenberger §10.2 is
valid, equal to `N(A)` when `n = 1` and to `N(A) ^ {n²} ≠ N(A)` when `n ≥ 2`. -/
theorem exactLevel (A : ctx.AV) (hA : Simple A) (hgl : IsGL2TypeSome ctx A) :
    ∃ NA : ℕ, NA ^ ctx.dim A = ctx.cond A ∧ 1 < NA ∧
      (∀ {N : ℕ} (f : ctx.Newform N), ctx.Isogenous (ctx.Af f) A → N = NA) ∧
      (∀ M : ℕ, 0 < M → (AbelianVariety.IsModularOfLevel ctx A M ↔ NA ∣ M)) ∧
      NA ∣ ctx.cond A ^ ctx.dim A ∧
      (ctx.dim A = 1 → ctx.cond A ^ ctx.dim A = NA) ∧
      (2 ≤ ctx.dim A →
        ctx.cond A ^ ctx.dim A = NA ^ (ctx.dim A ^ 2) ∧ ctx.cond A ^ ctx.dim A ≠ NA) := sorry

/-! ### GT.4/strict-compatibility -/

/-- GT.4/strict-compatibility. The family `ρ_τ = V_λ(A) ⊗_{E_λ, τ} ℚ̄_ℓ` is an `E`-rational,
two-dimensional, strictly compatible system of geometric representations with Hodge–Tate
weights `(1, 0)`: for every prime `q` there is a Frobenius-semisimple Weil–Deligne
representation `r_q` over `E` with `WD(ρ_τ|_{D_q})^{F-ss} ≅ τ r_q` for all `τ`, including
`q = ℓ`, unramified (`ρ_τ` unramified at `q`, `ℓ ≠ q`) for `q ∉ S`; it is regular, irreducible
and odd. -/
theorem strictCompatibility {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) :
    (∀ q : ℕ, q.Prime → ∃ r : ctx.WDRep E q,
      ∀ (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ), ctx.wdOf (ctx.rhoEmb A ι ℓ τ) q = ctx.wdMap τ r) ∧
      (∀ q : ℕ, q.Prime → ¬ ctx.IsBad A q → ∀ (ℓ : ℕ) [Fact ℓ.Prime], ℓ ≠ q →
        ∀ τ : E →+* Qlbar ℓ, IsUnramifiedAt (ctx.rhoEmb A ι ℓ τ) q) ∧
      ∀ (ℓ : ℕ) [Fact ℓ.Prime] (τ : E →+* Qlbar ℓ),
        finrank (Qlbar ℓ) (ctx.Vemb A ι ℓ τ) = 2 ∧
        ctx.htWeights (ctx.rhoEmb A ι ℓ τ) = {0, 1} ∧
        IsAbsIrred (ctx.rhoEmb A ι ℓ τ) ∧
        ∀ c : GQ, IsComplexConj c → LinearMap.det (ctx.rhoEmb A ι ℓ τ c) = -1 := sorry

/-! ### GT.4/l-function -/

/-- The completed L-function `Λ(s) = N^{s/2} ((2π)^{-s} Γ(s))^n L(s)`. -/
def completedL (N n : ℕ) (L : ℂ → ℂ) (s : ℂ) : ℂ :=
  (N : ℂ) ^ (s / 2) * ((2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s) ^ n * L s

/-- GT.4/l-function. In the situation of GT.4/conductor-of-gl2-type, for every prime `p` the
Euler polynomial of `A` at `p` is `∏_{σ : K_f → ℂ}` of `1 - σ(a_p) T + σ(ε_f(p)) p T²`
(`p ∤ N_f`) or `1 - σ(a_p) T` (`p ∣ N_f`); hence `L(A, s) = ∏_σ L(f^σ, s)` for `Re s > 3/2`,
it continues to an entire function, and `Λ(A, s) = cond(A)^{s/2}((2π)^{-s}Γ(s))^n L(A, s)`
satisfies `Λ(A, s) = w_A Λ(A, 2 - s)` with `w_A = ±1`. -/
theorem lFunction {A : ctx.AV} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End A) (h : IsEndField ctx A ι) {Nf : ℕ} (f : ctx.Newform Nf)
    (φ : ctx.Af f ≅ A) (j : ctx.Kf f ≃+* E)
    (hφ : ∀ y : ctx.Kf f,
      (ctx.hecke f y : ctx.Af f ⟶ ctx.Af f) ≫ φ.hom = φ.hom ≫ (ι (j y) : A ⟶ A)) :
    (∀ p : ℕ, p.Prime →
      (ctx.eulerPoly A p).map (algebraMap ℚ ℂ) =
        ∏ᶠ σ : ctx.Kf f →ₐ[ℚ] ℂ,
          (if p ∣ Nf then 1 - C (σ (ctx.ap f p)) * X
           else 1 - C (σ (ctx.ap f p)) * X + C (σ (ctx.nebentypus f p) * p) * X ^ 2)) ∧
      ∃ F : ℂ → ℂ, Differentiable ℂ F ∧
        (∀ s : ℂ, 3 / 2 < s.re →
          F s = ctx.LFun A s ∧
            ctx.LFun A s = ∏ᶠ σ : ctx.Kf f →ₐ[ℚ] ℂ, LSeries (fun n => σ (ctx.ap f n)) s) ∧
        ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ,
          completedL (ctx.cond A) (ctx.dim A) F s = w * completedL (ctx.cond A) (ctx.dim A) F (2 - s) :=
  sorry

/-! ### GT.4/parent-compatibility -/

/-- GT.4/parent-compatibility. For an elliptic curve `E₀` over `ℚ` of conductor `N_{E₀}`:
`E = ℚ` acting by `ℚ → End⁰(E₀)`, `ε = 1`, and there is a newform `f` of level
`N_f = N_{E₀}` with `K_f = ℚ` and `A_f ~ E₀`, through which `E₀` is a quotient of `J₀(N_{E₀})`
(EllipticCurveModularity R29.5–R29.6). -/
theorem parentCompatibility (E₀ : ctx.AV) (h1 : ctx.dim E₀ = 1) :
    IsEndField ctx E₀ (Algebra.ofId ℚ (End E₀)) ∧
      IsDetChar ctx (Algebra.ofId ℚ (End E₀)) 1 ∧
      ∃ f : ctx.Newform (ctx.cond E₀), finrank ℚ (ctx.Kf f) = 1 ∧
        ctx.Isogenous (ctx.Af f) E₀ ∧
        AbelianVariety.IsModularOfLevelGamma0 ctx E₀ (ctx.cond E₀) := sorry

end TauCeti.GL2Type

/-! ## GT.5 — ℚ-curves (Ribet §§5–7) -/

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-- `C` over `K ⊆ ℚ̄` is non-CM: `End⁰_ℚ̄(C) = ℚ`. -/
def IsNonCM {K : NF} (C : ctx.AVK K) : Prop :=
  Function.Surjective (algebraMap ℚ (End (ctx.bcEmb K.val C)))

/-- The restriction `G_ℚ → Gal(K/ℚ)` for `K/ℚ` normal. -/
def resK (K : NF) [Normal ℚ K] (g : GQ) : K ≃ₐ[ℚ] K :=
  AlgEquiv.restrictNormalHom K (GQ.toAut g)

/-- Locally constant 2-cocycles `G_ℚ × G_ℚ → M` for the trivial action on a discrete `M`. -/
def Z2 (M : Type) [CommGroup M] : Subgroup (GQ × GQ → M) where
  carrier := {c | IsLocallyConstant c ∧
    ∀ g h k : GQ, c (g * h, k) * c (g, h) = c (h, k) * c (g, h * k)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Locally constant 2-coboundaries `(g, h) ↦ α(g) α(h) / α(gh)`. -/
def B2 (M : Type) [CommGroup M] : Subgroup (GQ × GQ → M) where
  carrier := {c | ∃ α : GQ → M, IsLocallyConstant α ∧
    ∀ g h : GQ, c (g, h) = α g * α h / α (g * h)}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- Continuous cohomology `H²(G_ℚ, M)` for the trivial action on a discrete abelian group `M`. -/
abbrev H2 (M : Type) [CommGroup M] : Type := Z2 M ⧸ (B2 M).subgroupOf (Z2 M)

end TauCeti.GL2Type

/-! ### GT.5/q-curve -/

namespace TauCeti.EllipticCurve

open GL2Type GL2Type.AVContext

variable (ctx : GL2Type.AVContext)

/-- GT.5/q-curve: `C₀` over `K ⊆ ℚ̄` (in particular `C` over `ℚ̄ = ⊤`) is a `ℚ`-curve:
`ᵍC₀ ×_{gK} ℚ̄` is `ℚ̄`-isogenous to `C₀ ×_K ℚ̄` for every `g ∈ G_ℚ`. -/
def IsQCurve {K : NF} (C₀ : ctx.AVK K) : Prop :=
  ∀ g : GQ, Nonempty (ctx.bcEmb ((GQ.toAut g).toAlgHom.comp K.val) C₀ ≅ ctx.bcEmb K.val C₀)

/-- GT.5/q-curve: being a `ℚ`-curve is invariant under `ℚ̄`-isogeny. -/
theorem IsQCurve.of_isogeny {K K' : NF} {C : ctx.AVK K} {C' : ctx.AVK K'}
    (φ : ctx.bcEmb K.val C ≅ ctx.bcEmb K'.val C') (h : IsQCurve ctx C) : IsQCurve ctx C' :=
  sorry

/-- GT.5/q-curve: the conjugate `ᵍC₀` (over `ℚ̄`) is a `ℚ`-curve whenever `C₀` is. -/
theorem IsQCurve.conj {K : NF} {C₀ : ctx.AVK K} (h : IsQCurve ctx C₀) (g : GQ) :
    IsQCurve ctx (ctx.bcEmb ((GQ.toAut g).toAlgHom.comp K.val) C₀) := sorry

/-- GT.5/q-curve: a curve with `j(C) ∈ ℚ` (in particular one with a model over `ℚ`) is a
`ℚ`-curve. -/
theorem IsQCurve.of_rat {K : NF} (W : WeierstrassCurve K) [W.IsElliptic]
    (hj : ∃ q : ℚ, W.j = algebraMap ℚ K q) : IsQCurve ctx (ctx.ellK W) := sorry

/-- GT.5/q-curve: every CM elliptic curve over `ℚ̄` is a `ℚ`-curve. -/
theorem IsQCurve.of_cm (C : ctx.AVK ⊤) (h1 : ctx.dimK C = 1) (hcm : ¬ IsNonCM ctx C) :
    IsQCurve ctx C := sorry

/-- GT.5/q-curve: a `ℚ`-curve with a model `C₀` over a number field `K` has `K`-isogenies up to
a finite Galois `K' ⊇ K`: `K'`-isogenies `μ_g : ᵍC₀ → C₀` for all `g ∈ Gal(K'/ℚ)`. -/
theorem IsQCurve.isogenies_over_galois {K : NF} [FiniteDimensional ℚ K] (C₀ : ctx.AVK K)
    (h1 : ctx.dimK C₀ = 1) (h : IsQCurve ctx C₀) :
    ∃ (K' : NF) (hKK' : K ≤ K'), FiniteDimensional ℚ K' ∧ IsGalois ℚ K' ∧
      ∀ g : K' ≃ₐ[ℚ] K', ∃ μ : (ctx.conj g).obj ((ctx.bcLE hKK').obj C₀) ⟶ (ctx.bcLE hKK').obj C₀,
        IsIso μ ∧ μ ∈ ctx.intHomK _ _ := sorry

-- test: IsQCurve.rational
example : IsQCurve ctx ((ctx.bcQ ⊤).obj (ctx.J0 11)) := sorry

-- test: IsQCurve.cm
example :
    IsQCurve ctx (ctx.ellK (K := ⊤) { a₁ := 0, a₂ := 0, a₃ := 0, a₄ := -1, a₆ := 0 }) ∧
      ∀ C : ctx.AVK ⊤, ctx.dimK C = 1 → (∃ i : End C, i * i = -1) → IsQCurve ctx C := sorry

-- test: IsQCurve.twist
example {K : NF} (hK : finrank ℚ K = 2) (E₀ : ctx.AV) (h1 : ctx.dim E₀ = 1)
    (C₀ : ctx.AVK K) (htw : Nonempty (ctx.bcEmb K.val C₀ ≅ ctx.bcEmb K.val ((ctx.bcQ K).obj E₀))) :
    IsQCurve ctx C₀ := sorry

-- test: IsQCurve.not_of_traces
example {K : NF} [FiniteDimensional ℚ K] (hK : finrank ℚ K = 2) (C₀ : ctx.AVK K)
    (h1 : ctx.dimK C₀ = 1) (p : ℕ) (hp : p.Prime)
    (v w : IsDedekindDomain.HeightOneSpectrum (𝓞 K)) (hvw : v ≠ w)
    (hv : (p : 𝓞 K) ∈ v.asIdeal) (hw : (p : 𝓞 K) ∈ w.asIdeal)
    (hgood : (ctx.eulerPolyK C₀ v).natDegree = 2 ∧ (ctx.eulerPolyK C₀ w).natDegree = 2)
    (hne : (ctx.eulerPolyK C₀ v).coeff 1 ≠ (ctx.eulerPolyK C₀ w).coeff 1) :
    ¬ IsQCurve ctx C₀ := sorry

end TauCeti.EllipticCurve

/-! ### GT.5/ribet-cocycle -/

namespace TauCeti.QCurve

open GL2Type GL2Type.AVContext

variable (ctx : GL2Type.AVContext)

/-- A `ℚ`-curve over `K` with chosen `K`-isogenies `μ_g : ᵍC₀ → C₀`, `g ∈ Gal(K/ℚ)`. -/
structure Data (K : NF) where
  /-- The curve `C₀` over `K`. -/
  C₀ : ctx.AVK K
  /-- The isogenies `μ_g`, invertible in the isogeny category. -/
  μ : (g : K ≃ₐ[ℚ] K) → ((ctx.conj g).obj C₀ ≅ C₀)
  /-- Each `μ_g` is a genuine `K`-isogeny. -/
  μ_int : ∀ g, (μ g).hom ∈ ctx.intHomK _ _

/-- The endomorphism `μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹` of `C₀`. -/
def cocycleValue {K : NF} (D : Data ctx K) (g h : K ≃ₐ[ℚ] K) : End D.C₀ :=
  (D.μ (g * h)).inv ≫ (ctx.conjMul g h D.C₀).inv ≫ (ctx.conj g).map (D.μ h).hom ≫ (D.μ g).hom

/-- GT.5/ribet-cocycle: `c(g, h) = μ_g ∘ ᵍμ_h ∘ μ_{gh}⁻¹ ∈ (End⁰_K C₀)^× = ℚ^×` (for non-CM
`C₀`). -/
def cocycle {K : NF} (D : Data ctx K) (gh : (K ≃ₐ[ℚ] K) × (K ≃ₐ[ℚ] K)) : ℚˣ :=
  Units.mk0
    (Classical.epsilon fun q : ℚ => algebraMap ℚ (End D.C₀) q = cocycleValue ctx D gh.1 gh.2)
    sorry

/-- GT.5/ribet-cocycle: `c` is a 2-cocycle of `Gal(K/ℚ)` for the trivial action. -/
theorem cocycle_isCocycle {K : NF} (D : Data ctx K) (hnc : IsNonCM ctx D.C₀)
    (g h k : K ≃ₐ[ℚ] K) :
    cocycle ctx D (g * h, k) * cocycle ctx D (g, h) =
      cocycle ctx D (h, k) * cocycle ctx D (g, h * k) := sorry

/-- GT.5/ribet-cocycle: the class `[c_C] ∈ H²(G_ℚ, ℚ^×)`, inflated along `G_ℚ → Gal(K/ℚ)`. -/
def cocycleClass {K : NF} [Normal ℚ K] (D : Data ctx K) : H2 ℚˣ :=
  QuotientGroup.mk (⟨fun gh => cocycle ctx D (resK K gh.1, resK K gh.2), sorry⟩ : Z2 ℚˣ)

/-- GT.5/ribet-cocycle: `[c_C]` depends only on the `ℚ̄`-isogeny class of `C`: not on `K`, the
model `C₀` or the `μ_g`. -/
theorem cocycleClass_indep {K K' : NF} [Normal ℚ K] [Normal ℚ K'] (D : Data ctx K)
    (D' : Data ctx K') (hnc : IsNonCM ctx D.C₀)
    (φ : ctx.bcEmb K.val D.C₀ ≅ ctx.bcEmb K'.val D'.C₀) :
    cocycleClass ctx D = cocycleClass ctx D' := sorry

/-- GT.5/ribet-cocycle: `c(g, h)² = deg μ_g · deg μ_h / deg μ_{gh}`. -/
theorem cocycle_sq {K : NF} (D : Data ctx K) (hnc : IsNonCM ctx D.C₀) (g h : K ≃ₐ[ℚ] K) :
    ((cocycle ctx D (g, h) : ℚˣ) : ℚ) ^ 2 =
      ctx.degK (D.μ g).hom * ctx.degK (D.μ h).hom / ctx.degK (D.μ (g * h)).hom := sorry

/-- GT.5/ribet-cocycle: if `C` has a model over `ℚ` (up to isogeny), `[c_C] = 0`. -/
@[simp]
theorem cocycleClass_of_rat {K : NF} [Normal ℚ K] (D : Data ctx K) (E₀ : ctx.AV)
    (φ : D.C₀ ≅ (ctx.bcQ K).obj E₀) : cocycleClass ctx D = 1 := sorry

-- test: QCurve.cocycle_rational
-- (`μ_g = id` is recorded through the compatibility `μ_g ∘ ᵍμ_h = μ_{gh}` it implies.)
example {K : NF} (D : Data ctx K) (E₀ : ctx.AV) (φ : D.C₀ ≅ (ctx.bcQ K).obj E₀)
    (hid : ∀ g h : K ≃ₐ[ℚ] K, (ctx.conjMul g h D.C₀).inv ≫ (ctx.conj g).map (D.μ h).hom ≫
      (D.μ g).hom = (D.μ (g * h)).hom) (g h : K ≃ₐ[ℚ] K) :
    cocycle ctx D (g, h) = 1 := sorry

-- test: QCurve.cocycle_quadratic
example {K : NF} [FiniteDimensional ℚ K] (hK : finrank ℚ K = 2) (D : Data ctx K)
    (hnc : IsNonCM ctx D.C₀) (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) (m : ℤ)
    (hm : (ctx.conjMul σ σ D.C₀).inv ≫ (ctx.conj σ).map (D.μ σ).hom ≫ (D.μ σ).hom =
      (D.μ (σ * σ)).hom ≫ (m • 𝟙 D.C₀))
    (h1 : D.μ 1 = ctx.conjOne D.C₀) :
    ((cocycle ctx D (σ, σ) : ℚˣ) : ℚ) = m ∧
      ∀ g : K ≃ₐ[ℚ] K, cocycle ctx D (1, g) = 1 ∧ cocycle ctx D (g, 1) = 1 := sorry

-- test: QCurve.cocycle_twist_trivial
example {K : NF} [FiniteDimensional ℚ K] [Normal ℚ K] (hK : finrank ℚ K = 2) (E₀ : ctx.AV)
    (h1 : ctx.dim E₀ = 1) (C₀ : ctx.AVK K)
    (htw : Nonempty (ctx.bcEmb K.val C₀ ≅ ctx.bcEmb K.val ((ctx.bcQ K).obj E₀))) :
    ∃ D : Data ctx K, D.C₀ = C₀ ∧
      (∀ g h : K ≃ₐ[ℚ] K, cocycle ctx D (g, h) = 1 ∨ cocycle ctx D (g, h) = -1) ∧
      cocycleClass ctx D ^ 2 = 1 := sorry

-- test: QCurve.cocycle_cm_excluded
example {K : NF} (C₀ : ctx.AVK K) (h1 : ctx.dimK C₀ = 1) (hcm : ¬ IsNonCM ctx C₀) :
    finrank ℚ (End (ctx.bcEmb K.val C₀)) = 2 ∧
      ∀ x y : End (ctx.bcEmb K.val C₀), x * y = y * x := sorry

end TauCeti.QCurve

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-! ### GT.5/tate-vanishing-qbar -/

/-- GT.5/tate-vanishing-qbar (Tate). `H²(G_ℚ, ℚ̄^×) = 0` for the trivial action; hence for a
non-CM `ℚ`-curve with cocycle `c` over a Galois `K` there is a locally constant
`α : G_ℚ → ℚ̄^×` factoring through `Gal(K'/ℚ)` for a finite Galois `K' ⊇ K`, with
`c(g, h) = α(g) α(h) / α(gh)`; `ε_C(g) = α(g)² / deg μ_g` is a finite-order character with values
in `E_α = ℚ(α(g) : g ∈ G_ℚ)`, and `E_α/ℚ` is abelian. -/
theorem tateVanishingQbar :
    (∀ c ∈ Z2 Qbarˣ, c ∈ B2 Qbarˣ) ∧
      ∀ {K : NF} [FiniteDimensional ℚ K] [Normal ℚ K] (D : QCurve.Data ctx K),
        IsNonCM ctx D.C₀ →
        ∃ (α : GQ → Qbarˣ) (K' : NF), IsLocallyConstant α ∧ K ≤ K' ∧
          FiniteDimensional ℚ K' ∧ IsGalois ℚ K' ∧
          (∀ σ τ : GQ, σ⁻¹ * τ ∈ GK K' → α σ = α τ) ∧
          (∀ g h : GQ, algebraMap ℚ Qbar (QCurve.cocycle ctx D (resK K g, resK K h)) =
            α g * α h / α (g * h)) ∧
          let Eα : IntermediateField ℚ Qbar :=
            IntermediateField.adjoin ℚ (Set.range fun σ : GQ => (α σ : Qbar))
          (∃ εC : GQ →* Eαˣ, IsFiniteOrderChar εC ∧ ∀ σ : GQ,
            ((εC σ : Eα) : Qbar) = (α σ : Qbar) ^ 2 / (ctx.degK (D.μ (resK K σ)).hom : Qbar)) ∧
          IsGalois ℚ Eα ∧ ∀ g g' : Eα ≃ₐ[ℚ] Eα, g * g' = g' * g := sorry

/-! ### GT.5/restriction-of-scalars-endomorphisms -/

/-- GT.5/restriction-of-scalars-endomorphisms (Ribet, Lemma 6.4). For a non-CM `ℚ`-curve
`C₀` over a finite Galois `K` with isogenies `μ_σ` and cocycle `c`, `B = Res_{K/ℚ} C₀` has
dimension `[K : ℚ]`, and `End⁰_ℚ(B)` has a `ℚ`-basis `λ_σ` with `λ_σ λ_τ = c(σ, τ) λ_{στ}`: the
twisted group algebra `R = ℚ^c[Gal(K/ℚ)]`, which is semisimple. For a splitting `α` of `c` on
`Gal(K/ℚ)` (enlarging `K` if necessary, GT.5/tate-vanishing-qbar),
`ω : R → E_α, λ_σ ↦ α(σ)` is a surjective `ℚ`-algebra map. -/
theorem restrictionOfScalarsEndomorphisms {K : NF} [FiniteDimensional ℚ K] [IsGalois ℚ K]
    (D : QCurve.Data ctx K) (h1 : ctx.dimK D.C₀ = 1) (hnc : IsNonCM ctx D.C₀) :
    ctx.dim (ctx.res K D.C₀) = finrank ℚ K ∧
      ∃ lam : (K ≃ₐ[ℚ] K) → End (ctx.res K D.C₀),
        LinearIndependent ℚ lam ∧ Submodule.span ℚ (Set.range lam) = ⊤ ∧
        (∀ σ τ : K ≃ₐ[ℚ] K,
          lam σ * lam τ = ((QCurve.cocycle ctx D (σ, τ) : ℚˣ) : ℚ) • lam (σ * τ)) ∧
        IsSemisimpleRing (End (ctx.res K D.C₀)) ∧
        ∀ α : (K ≃ₐ[ℚ] K) → Qbarˣ,
          (∀ σ τ, algebraMap ℚ Qbar (QCurve.cocycle ctx D (σ, τ)) = α σ * α τ / α (σ * τ)) →
          ∃ ω : End (ctx.res K D.C₀) →ₐ[ℚ] Qbar, (∀ σ, ω (lam σ) = α σ) ∧
            ∀ y : Qbar, y ∈ IntermediateField.adjoin ℚ (Set.range fun σ => (α σ : Qbar)) ↔
              ∃ x, ω x = y := sorry

/-! ### GT.5/lie-free-rank-one -/

/-- GT.5/lie-free-rank-one (Ribet, Proposition 6.5 and Corollary 6.6). `T = ∏_σ C_σ` (copies of
`C₀`) and `B_K = ∏_σ ᵟC₀` are isogenous over `K` (the `R`-equivariance of the isogeny `ι`, which
moves the factors, needs the projections of finite products, not in the carrier); consequently
`Lie(B/ℚ)` is a free `R`-module of rank one, `R = End⁰_ℚ(B)`. -/
theorem lieFreeRankOne {K : NF} [FiniteDimensional ℚ K] [IsGalois ℚ K]
    (D : QCurve.Data ctx K) (h1 : ctx.dimK D.C₀ = 1) (hnc : IsNonCM ctx D.C₀) :
    Nonempty ((ctx.bcQ K).obj (ctx.res K D.C₀) ≅
      ctx.piK fun σ : K ≃ₐ[ℚ] K => (ctx.conj σ).obj D.C₀) ∧
      Nonempty (ctx.piK (fun _ : K ≃ₐ[ℚ] K => D.C₀) ≅ (ctx.bcQ K).obj (ctx.res K D.C₀)) ∧
      ∃ x : ctx.Lie (ctx.res K D.C₀),
        Function.Bijective fun r : End (ctx.res K D.C₀) => ctx.lieAct _ r x := sorry

/-! ### GT.5/ribet-theorem-6-1 -/

/-- GT.5/ribet-theorem-6-1 (Ribet, Theorem 6.1). A non-CM `ℚ`-curve is a `ℚ̄`-simple factor of a
primitive (`ℚ`-simple) `A` of GL₂(E_α)-type: `A` is a quotient of `B = Res_{K/ℚ} C₀` (the image
of a multiple of the projector onto `E_α`), `End⁰_ℚ(A) = E_α`, `dim A = [E_α : ℚ]`, and
`A_K ~ C₀ ^ {dim A}`. -/
theorem ribetTheorem61 {K : NF} [FiniteDimensional ℚ K] [IsGalois ℚ K]
    (D : QCurve.Data ctx K) (h1 : ctx.dimK D.C₀ = 1) (hnc : IsNonCM ctx D.C₀)
    (α : (K ≃ₐ[ℚ] K) → Qbarˣ)
    (hα : ∀ σ τ, algebraMap ℚ Qbar (QCurve.cocycle ctx D (σ, τ)) = α σ * α τ / α (σ * τ)) :
    ∃ (A : ctx.AV) (E : Type) (_ : Field E) (_ : NumberField E) (ι : E →ₐ[ℚ] End A),
      Nonempty (E ≃ₐ[ℚ] IntermediateField.adjoin ℚ (Set.range fun σ => (α σ : Qbar))) ∧
      IsGL2TypeVia ctx ι ∧ IsPrimitive ctx ι ∧ IsEndField ctx A ι ∧
      ctx.dim A = finrank ℚ E ∧
      (∃ q : ctx.res K D.C₀ ⟶ A, Epi q) ∧
      Nonempty ((ctx.bcQ K).obj A ≅ ctx.powK D.C₀ (ctx.dim A)) := sorry

/-! ### GT.5/q-curves-geometrically-modular -/

/-- GT.5/q-curves-geometrically-modular (Ribet, Corollary 6.2, unconditional). A non-CM
`ℚ`-curve `C` over `ℚ̄` is a quotient of `J₁(N)_ℚ̄`; more precisely there are a weight-two
newform `f` and a finite Galois `K'/ℚ` over which `C` has a model `C₀` with
`(A_f)_{K'} ~ C₀ ^ {[K_f : ℚ]}`. -/
theorem qCurvesGeometricallyModular (C : ctx.AVK ⊤) (h1 : ctx.dimK C = 1)
    (hQ : EllipticCurve.IsQCurve ctx C) (hnc : IsNonCM ctx C) :
    (∃ N : ℕ, 0 < N ∧ ∃ q : (ctx.bcQ ⊤).obj (ctx.J1 N) ⟶ C, Epi q) ∧
      ∃ (N : ℕ) (f : ctx.Newform N) (K' : NF) (C₀ : ctx.AVK K'),
        FiniteDimensional ℚ K' ∧ IsGalois ℚ K' ∧ Nonempty (ctx.bcEmb K'.val C₀ ≅ C) ∧
        Nonempty ((ctx.bcQ K').obj (ctx.Af f) ≅ ctx.powK C₀ (finrank ℚ (ctx.Kf f))) := sorry

/-! ### GT.5/quadratic-q-curves -/

open Classical in
/-- GT.5/quadratic-q-curves (Ribet §7). `K` quadratic with `Gal(K/ℚ) = {1, σ}`, `C₀` non-CM over
`K` with a `K`-isogeny `μ : ᵟC₀ → C₀`. Then `μ ∘ ᵟμ = [m]` with `m ≠ 0`,
`End⁰_ℚ(Res_{K/ℚ} C₀) ≅ ℚ[X]/(X² - m)`; (a) if `m` is a square, `C₀` is `K`-isogenous to the
base change of a curve over `ℚ`; (b) otherwise `B = Res_{K/ℚ} C₀` is a primitive abelian surface
of GL₂(ℚ(√m))-type whose character `ε` is `θ` (`θ(g) = 1` on `G_K`, `sign m` off it), with
`E = ℚ(√m)` real iff `θ = 1`; (c) `E` or `K` is real, and if `K` is imaginary then `m > 0`,
`ε = 1` and `B` is a quotient of some `J₀(N)`. -/
theorem quadraticQCurves {K : NF} [FiniteDimensional ℚ K] [Normal ℚ K]
    (hK : finrank ℚ K = 2) (σ : K ≃ₐ[ℚ] K) (hσ : σ ≠ 1) (hσ2 : σ * σ = 1) (C₀ : ctx.AVK K)
    (h1 : ctx.dimK C₀ = 1) (hnc : IsNonCM ctx C₀) (μ : (ctx.conj σ).obj C₀ ≅ C₀)
    (hμ : μ.hom ∈ ctx.intHomK _ _) :
    ∃ m : ℤ, m ≠ 0 ∧
      (ctx.conjOne C₀).inv ≫ eqToHom (congrArg (fun g => (ctx.conj g).obj C₀) hσ2.symm) ≫
          (ctx.conjMul σ σ C₀).inv ≫ (ctx.conj σ).map μ.hom ≫ μ.hom = m • 𝟙 C₀ ∧
      Nonempty (End (ctx.res K C₀) ≃ₐ[ℚ] AdjoinRoot (X ^ 2 - C (m : ℚ))) ∧
      (IsSquare m → ∃ E₀ : ctx.AV, Nonempty ((ctx.bcQ K).obj E₀ ≅ C₀)) ∧
      (¬ IsSquare m →
        ∃ (E : Type) (_ : Field E) (_ : NumberField E) (ι : E →ₐ[ℚ] End (ctx.res K C₀))
          (r : E), r ^ 2 = (m : E) ∧ finrank ℚ E = 2 ∧ ctx.dim (ctx.res K C₀) = 2 ∧
          IsGL2TypeVia ctx ι ∧ IsPrimitive ctx ι ∧ IsEndField ctx (ctx.res K C₀) ι ∧
          (∀ ε : GQ →* Eˣ, IsDetChar ctx ι ε → ∀ g : GQ,
            (ε g : E) = if resK K g = 1 ∨ 0 < m then 1 else -1) ∧
          (IsTotallyReal E ↔ 0 < m) ∧
          (IsTotallyReal E ∨ IsTotallyReal K) ∧
          (¬ IsTotallyReal K → 0 < m ∧ (∀ ε : GQ →* Eˣ, IsDetChar ctx ι ε → ε = 1) ∧
            ∃ N : ℕ, AbelianVariety.IsModularOfLevelGamma0 ctx (ctx.res K C₀) N)) := sorry

end TauCeti.GL2Type

/-! ## GT.6 — Modularity of ℚ-curves over solvable fields -/

namespace TauCeti.GL2Type

open AVContext

variable (ctx : AVContext)

/-! ### GT.6/twisting-lemma -/

/-- GT.6/twisting-lemma. `G` profinite, `H ⊆ G` open normal, `L` algebraically closed of
characteristic `0` with an (`ℓ`-adic or discrete) topology, and `ρ₁, ρ₂ : G → GL₂(L)` continuous
with `ρ₁|_H ≅ ρ₂|_H` absolutely irreducible (no common eigenvector of `ρ₁(H)`). Then
`ρ₂ ≅ ρ₁ ⊗ ψ` for a character `ψ : G/H → L^×`. -/
theorem twistingLemma {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (H : Subgroup G) [H.Normal]
    (hH : IsOpen (H : Set G)) {L : Type} [Field L] [IsAlgClosed L] [CharZero L]
    [TopologicalSpace L] [IsTopologicalRing L] (ρ₁ ρ₂ : G →* GL (Fin 2) L)
    (hc₁ : Continuous ρ₁) (hc₂ : Continuous ρ₂)
    (hiso : ∃ P : GL (Fin 2) L, ∀ g ∈ H,
      (ρ₂ g : Matrix (Fin 2) (Fin 2) L) = (P : Matrix (Fin 2) (Fin 2) L) * (ρ₁ g : Matrix (Fin 2) (Fin 2) L) *
        ((P⁻¹ : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L))
    (hirr : ∀ v : Fin 2 → L, v ≠ 0 →
      ¬ ∀ g ∈ H, ∃ c : L, (ρ₁ g : Matrix (Fin 2) (Fin 2) L).mulVec v = c • v) :
    ∃ ψ : G →* Lˣ, (∀ g ∈ H, ψ g = 1) ∧ ∃ P : GL (Fin 2) L, ∀ g : G,
      (ρ₂ g : Matrix (Fin 2) (Fin 2) L) =
        (ψ g : L) • ((P : Matrix (Fin 2) (Fin 2) L) * (ρ₁ g : Matrix (Fin 2) (Fin 2) L) *
        ((P⁻¹ : GL (Fin 2) L) : Matrix (Fin 2) (Fin 2) L)) := sorry

/-! ### GT.6/q-curve-galois-modularity -/

/-- `ρ ⊗_{ℚ_ℓ} ℚ̄_ℓ` for the `G_K`-representation `V_ℓ(C)` of `C` over `K`. -/
abbrev VKbar {K : NF} (C : ctx.AVK K) (ℓ : ℕ) [Fact ℓ.Prime] :
    Representation (Qlbar ℓ) (GK K) (Qlbar ℓ ⊗[ℚ_[ℓ]] ctx.VK C ℓ) :=
  repBaseChange (Qlbar ℓ) (ctx.galRepK C ℓ)

/-- GT.6/q-curve-galois-modularity. For a non-CM `ℚ`-curve `C` over a number field `K` and a
prime `ℓ` there are a weight-two newform `f`, an embedding `ι : K_f → ℚ̄_ℓ` and a finite-order
character `ψ : G_K → ℚ̄_ℓ^×` with `V_ℓ(C) ⊗ ℚ̄_ℓ ≅ (ρ_{f,ι}|_{G_K}) ⊗ ψ`; and `ρ_{f,ι}|_{G_{K''}}`
is absolutely irreducible for every finite extension `K''` of `K`. -/
theorem qCurveGaloisModularity {K : NF} [FiniteDimensional ℚ K] (C : ctx.AVK K)
    (h1 : ctx.dimK C = 1) (hnc : IsNonCM ctx C) (hQ : EllipticCurve.IsQCurve ctx C)
    (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ (N : ℕ) (f : ctx.Newform N) (ι : ctx.Kf f →+* Qlbar ℓ) (ψ : GK K →* (Qlbar ℓ)ˣ),
      IsFiniteOrderChar ψ ∧
      RepIso (VKbar ctx C ℓ)
        (twist ((ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ ι).comp (GK K).subtype) ψ) ∧
      ∀ K'' : NF, K ≤ K'' → FiniteDimensional ℚ K'' →
        IsAbsIrred ((ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ ι).comp (GK K'').subtype) := sorry

/-! ### GT.6/q-curve-automorphy -/

/-- `C` over `K` is modular in the sense of Caraiani–Newton §1: a cuspidal automorphic
representation `Π` of `GL₂(𝔸_K)` of parallel weight two has, at every finite place, the local
factor of `L(Π, s - 1/2)` equal to that of `L(C, s)`. -/
def IsModularCN {K : NF} (C : ctx.AVK K) : Prop :=
  ∃ PiK : ctx.AutRep K, ∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K),
    ctx.eulerAut PiK v = (ctx.eulerPolyK C v).map (algebraMap ℚ ℂ)

/-- GT.6/q-curve-automorphy. For `K/ℚ` finite Galois with solvable group, `C` a non-CM `ℚ`-curve
over `K` and `(f, ι, ψ)` as in GT.6/q-curve-galois-modularity, there is a cuspidal automorphic
`Π` of `GL₂(𝔸_K)` of parallel weight two whose local factors at every finite place match those of
`C`, with `L(Π, s - 1/2) = L(C, s)` and Hecke eigenvalues the rational integers `a_v(C)` at
places of good reduction; so `C` is modular (Caraiani–Newton §1). That `Π` is the twisted base
change `BC_{K/ℚ}(π_f) ⊗ (ψ ∘ Art_K)` needs cyclic base change and the Artin map, which the
carrier does not supply; by strong multiplicity one the local factors characterise `Π`. -/
theorem qCurveAutomorphy {K : NF} [FiniteDimensional ℚ K] [IsGalois ℚ K]
    [Group.IsSolvable (K ≃ₐ[ℚ] K)] (C : ctx.AVK K) (h1 : ctx.dimK C = 1) (hnc : IsNonCM ctx C)
    (hQ : EllipticCurve.IsQCurve ctx C) (ℓ : ℕ) [Fact ℓ.Prime] {N : ℕ} (f : ctx.Newform N)
    (ι : ctx.Kf f →+* Qlbar ℓ) (ψ : GK K →* (Qlbar ℓ)ˣ) (hψ : IsFiniteOrderChar ψ)
    (hfψ : RepIso (VKbar ctx C ℓ)
      (twist ((ctx.rhoEmb (ctx.Af f) (ctx.hecke f) ℓ ι).comp (GK K).subtype) ψ)) :
    ∃ PiK : ctx.AutRep K,
      (∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K),
        ctx.eulerAut PiK v = (ctx.eulerPolyK C v).map (algebraMap ℚ ℂ)) ∧
      (∀ s : ℂ, ctx.LAut PiK (s - 1 / 2) = ctx.LFunK C s) ∧
      (∀ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K), (ctx.eulerPolyK C v).natDegree = 2 →
        ∃ a : ℤ, (ctx.eulerAut PiK v).coeff 1 = -(a : ℂ)) ∧
      IsModularCN ctx C := sorry

/-! ### GT.6/quadratic-q-curves-modular -/

/-- GT.6/quadratic-q-curves-modular. A `ℚ`-curve `C` over a quadratic field `K` (real or
imaginary) is modular in the sense of Caraiani–Newton §1: either `C` has CM, or a cuspidal
automorphic `Π` of `GL₂(𝔸_K)` of parallel weight two has `L(Π, s - 1/2) = L(C, s)`. -/
theorem quadraticQCurvesModular {K : NF} [FiniteDimensional ℚ K] (hK : finrank ℚ K = 2)
    (C : ctx.AVK K) (h1 : ctx.dimK C = 1) (hQ : EllipticCurve.IsQCurve ctx C) :
    ¬ IsNonCM ctx C ∨
      (IsModularCN ctx C ∧ ∃ PiK : ctx.AutRep K, ∀ s : ℂ, ctx.LAut PiK (s - 1 / 2) = ctx.LFunK C s) :=
  sorry

end TauCeti.GL2Type
