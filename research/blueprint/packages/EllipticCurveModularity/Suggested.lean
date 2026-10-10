/-
Suggested.lean — EllipticCurveModularity (modularity and modular parametrisations of elliptic curves over ℚ)

This file is not the roadmap and is not exhaustive. The accompanying README.md is definitive. These statements suggest Lean forms so that
contributors and reviewers can converge on names and signatures. They claim no implementation: apart from a few
facts that follow at once from the definitions (nonzero discriminants of the test curves, the clause `p ≤ 5`,
`IsNewformOf.congr`, the trivial-character test), every other proof is `sorry`.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

What the pinned libraries have and this file uses directly: Weierstrass curves over ℚ with their reduction types over
`ℤ_[p]`, local polynomials, `LFunction` and `LSeries` (Mathlib), the group of points over a field extension with the
map induced by a field homomorphism (Mathlib), `Field.absoluteGaloisGroup`, cusp forms with their `q`-expansions,
the Dedekind eta function, and Tau Ceti's bundled newforms `HeckeRing.GL2.Newform`. The exceptional set `Σ_E`, the
coefficients `a_n(E)` and the predicate "attached to `E`" are therefore real definitions here.

What they do not have is collected in the first section, "Imported interfaces": the conductor of `E`, the Galois
modules `E[p]` and `V_r(E)`, Artin conductors and Serre weights of residual representations, the Galois
representations of a newform, and the ℚ-curves `X₀(N)`, `J₀(N)`, `A_f` with their maps. Other roadmaps own all of
these (each docstring names the owner); they are restated only as typed stand-ins, a `def` of a type, a number, a
representation or a morphism whose body is `sorry`, so that this roadmap's own signatures can be typed. None is a
`Prop`-valued placeholder, and no statement is `True`. The owner's definition governs.

Later Tau Ceti versions supply `WeierstrassCurve.torsionGaloisAction`,
`WeierstrassCurve.tateModuleGaloisRepresentation`,
`WeierstrassCurve.nonempty_linearEquiv_tateModule`, and
`TauCeti.det_tateModuleGaloisRepresentation`. Replace the corresponding pinned-baseline
interfaces with that native substrate and extend scalars for the rational Tate module;
this roadmap does not plan those constructions again.
-/
import Mathlib.AlgebraicGeometry.EllipticCurve.LFunction
import Mathlib.AlgebraicGeometry.Morphisms.UnderlyingMap
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Data.Fintype.Pigeonhole
import Mathlib.Data.Nat.Totient
import Mathlib.Data.Set.Finite.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.LegendreSymbol.ZModChar
import Mathlib.NumberTheory.ModularForms.DedekindEta
import Mathlib.NumberTheory.ModularForms.QExpansion
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RingTheory.Ideal.Operations
import Mathlib.RingTheory.Norm.Basic
import TauCeti.NumberTheory.ModularForms.Newforms.Newform

set_option autoImplicit false

noncomputable section

open AlgebraicGeometry CategoryTheory NumberField Polynomial TensorProduct

open scoped MonoidAlgebra

namespace TauCeti.EllipticCurve.Modularity

open HeckeRing.GL2 (Newform)

/-! ## Conventions -/

/-- `G_ℚ = Gal(ℚ̄/ℚ)`. -/
abbrev GQ : Type := Field.absoluteGaloisGroup ℚ

/-- `Spec ℚ`. -/
abbrev SpecQ : Scheme := Spec (CommRingCat.of ℚ)

/-- `a_n(E)`: the `n`-th coefficient of Mathlib's `L`-function of `E`. At a prime `ℓ` of good reduction it is
`ℓ + 1 - #Ẽ(𝔽_ℓ)`; at a bad prime it is `1`, `-1`, `0` for split multiplicative, nonsplit multiplicative, additive
reduction. -/
def lCoeff (E : WeierstrassCurve ℚ) (n : ℕ) : ℤ := E.LFunction n

/-- Good reduction of `E` at `p`, in Mathlib's sense for the minimal model over `ℤ_[p]`. For the conductor `N` of
`E` this is `p ∤ N`. Mathlib's `LFunction` takes its local factors over the completions `v.adicCompletion ℚ`; the
comparison of those with `ℚ_[p]` is a library lemma that statements mixing `lCoeff` and `ℤ_[p]` rely on. -/
def HasGoodReductionAt (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ((E.baseChange ℚ_[p]).minimal ℤ_[p]).HasGoodReduction ℤ_[p]

/-- Multiplicative reduction of `E` at `ℓ` (Mathlib). For the conductor `N` of `E` this is `v_ℓ(N) = 1`. -/
def HasMultiplicativeReductionAt (E : WeierstrassCurve ℚ) (ℓ : ℕ) [Fact ℓ.Prime] : Prop :=
  ((E.baseChange ℚ_[ℓ]).minimal ℤ_[ℓ]).HasMultiplicativeReduction ℤ_[ℓ]

open scoped Classical in
/-- The action of `σ ∈ G_ℚ` on `E(ℚ̄)`. -/
def galoisPointMap (E : WeierstrassCurve ℚ) (σ : GQ) :
    (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point →+ (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point :=
  WeierstrassCurve.Affine.Point.map (W' := E) σ.toAlgHom

open scoped Classical in
/-- `E` has a ℚ-rational cyclic subgroup of order `p`: a finite cyclic subgroup of `E(ℚ̄)` of order `p` stable
under `G_ℚ` (the kernel of a ℚ-rational cyclic isogeny of degree `p`). -/
def HasRationalCyclicSubgroup (E : WeierstrassCurve ℚ) (p : ℕ) : Prop :=
  ∃ C : AddSubgroup (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point,
    IsAddCyclic C ∧ Finite C ∧ Nat.card C = p ∧ ∀ σ : GQ, C.map (galoisPointMap E σ) = C

/-- The Fourier coefficient `a_n(f)` of a newform at the cusp `∞`. -/
def coeff {N : ℕ} [NeZero N] {k : ℤ} (f : Newform N k) (n : ℕ) : ℂ :=
  (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n

/-! ## Imported interfaces

Nothing in this section is planned by this roadmap. Each declaration stands in for an object that the roadmap named
in its docstring owns and that the pinned libraries do not have. -/

section Imported

/-- ArithmeticGaloisRepresentations R01.6 (stand-in): the conductor `N` of `E/ℚ`, defined through the Tate modules
(`p ∣ N` iff bad reduction at `p`; `v_p(N) = 1` iff multiplicative reduction). -/
def conductor (E : WeierstrassCurve ℚ) [E.IsElliptic] : ℕ := sorry

instance (E : WeierstrassCurve ℚ) [E.IsElliptic] : NeZero (conductor E) := sorry

/-- ArithmeticGaloisRepresentations R01.6 (stand-in): `E[p](ℚ̄)` as an `𝔽_p`-vector space of dimension two. -/
def Torsion (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : Type := sorry

instance (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : AddCommGroup (Torsion E p) := sorry

instance (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : Module (ZMod p) (Torsion E p) := sorry

/-- R01.6 (stand-in): the residual representation `ρ̄_{E,p}` of `G_ℚ` on `E[p]`. -/
def residualRep (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] :
    Representation (ZMod p) GQ (Torsion E p) := sorry

/-- R01.6, residual conductor interface (stand-in): the prime-to-`p` Artin conductor `N(ρ̄)` of a representation of
`G_ℚ` on a finite-dimensional `𝔽_p`-vector space. -/
def artinConductor {p : ℕ} [Fact p.Prime] {V : Type} [AddCommGroup V] [Module (ZMod p) V]
    (ρ : Representation (ZMod p) GQ V) : ℕ := sorry

/-- AlgebraicModularFormsAndSerreWeights R15.4 (stand-in): Serre's weight `k(ρ̄)` of a two-dimensional mod-`p`
representation of `G_ℚ`. -/
def serreWeight {p : ℕ} [Fact p.Prime] {V : Type} [AddCommGroup V] [Module (ZMod p) V]
    (ρ : Representation (ZMod p) GQ V) : ℕ := sorry

/-- R01.6 and Tau Ceti EllipticCurves Layer 2 (stand-in): the rational Tate module `V_r(E) = T_r(E) ⊗ ℚ_r`. -/
def RationalTateModule (E : WeierstrassCurve ℚ) (r : ℕ) [Fact r.Prime] : Type := sorry

instance (E : WeierstrassCurve ℚ) (r : ℕ) [Fact r.Prime] : AddCommGroup (RationalTateModule E r) := sorry

instance (E : WeierstrassCurve ℚ) (r : ℕ) [Fact r.Prime] : Module ℚ_[r] (RationalTateModule E r) := sorry

/-- R01.6 (stand-in): the action of `G_ℚ` on `V_r(E)`. -/
def rationalTateRep (E : WeierstrassCurve ℚ) (r : ℕ) [Fact r.Prime] :
    Representation ℚ_[r] GQ (RationalTateModule E r) := sorry

/-- AutomorphicGaloisRepresentations R19.1 (stand-in): the `r`-adic representation `V_r(f)` of a weight-two newform
all of whose Fourier coefficients are rational integers (so that its coefficient field is ℚ). -/
def newformGaloisRep {N : ℕ} [NeZero N] (f : Newform N 2) (_hf : ∀ n, ∃ m : ℤ, coeff f n = m) (r : ℕ)
    [Fact r.Prime] : Representation ℚ_[r] GQ (Fin 2 → ℚ_[r]) := sorry

/-- AutomorphicGaloisRepresentations R19.6, `residual-representation-of-a-newform` (stand-in): the semisimple residual
representation `ρ̄_{f,λ}` at a maximal ideal `λ` of the ring of algebraic integers of ℂ, over its residue field. -/
def newformResidualRep {N : ℕ} [NeZero N] (f : Newform N 2) (lam : Ideal (integralClosure ℤ ℂ))
    [lam.IsMaximal] :
    Representation (integralClosure ℤ ℂ ⧸ lam) GQ (Fin 2 → integralClosure ℤ ℂ ⧸ lam) := sorry

/-- Tau Ceti ModularCurves Layer 10, and ModularCurvesPartII R13.2–R13.4 at general level (stand-in): the modular
curve `X₀(N)` over ℚ. -/
def X0 (N : ℕ) : Over SpecQ := sorry

/-- ModularCurvesPartII R14.6, `rational-cusp-abel-jacobi` (stand-in): the rational cusp `∞ ∈ X₀(N)(ℚ)`. -/
def X0.cuspInfty (N : ℕ) : Over.mk (𝟙 SpecQ) ⟶ X0 N := sorry

/-- ModularCurvesPartII R14.2 (stand-in): the Jacobian `J₀(N)` over ℚ, as a ℚ-scheme. -/
def J0 (N : ℕ) : Over SpecQ := sorry

/-- R14.2 (stand-in): the origin of `J₀(N)`. -/
def J0.origin (N : ℕ) : Over.mk (𝟙 SpecQ) ⟶ J0 N := sorry

/-- ModularCurvesPartII R14.6, `rational-cusp-abel-jacobi` (stand-in, the owner's `abelJacobiInfty`): the Abel–Jacobi
morphism `X₀(N) → J₀(N)`, `x ↦ [x - ∞]`. -/
def abelJacobiInfty (N : ℕ) : X0 N ⟶ J0 N := sorry

/-- ModularCurvesPartII R14.5, `trivial-character-J0` (stand-in): the quotient `A_f⁰ = J₀(N)/𝔭_f⁰ J₀(N)` of a
weight-two newform with trivial character, as a ℚ-scheme. The owner's `modularQuotient` is the quotient of
`J₁(N)`, which is isogenous to this one and can differ from it (11a3 and 11a1 at level 11); the owner has no
declaration name for the quotient of `J₀(N)` yet, and this roadmap requests one. -/
def modularQuotient₀ {N : ℕ} [NeZero N] (f : Newform N 2) (_hf : f.χ = 1) : Over SpecQ := sorry

/-- R14.5 (stand-in): the origin of `A_f⁰`. -/
def modularQuotient₀.origin {N : ℕ} [NeZero N] (f : Newform N 2) (hf : f.χ = 1) :
    Over.mk (𝟙 SpecQ) ⟶ modularQuotient₀ f hf := sorry

/-- R14.5 (stand-in): the quotient morphism `J₀(N) → A_f⁰`. -/
def modularQuotient₀.map {N : ℕ} [NeZero N] (f : Newform N 2) (hf : f.χ = 1) :
    J0 N ⟶ modularQuotient₀ f hf := sorry

/-- Tau Ceti ModularCurves Layer 1, part 1A (stand-in): the projective Weierstrass model of `E`, a smooth projective
curve over ℚ. -/
def toOver (E : WeierstrassCurve ℚ) [E.IsElliptic] : Over SpecQ := sorry

/-- Tau Ceti ModularCurves Layer 1 (stand-in): the origin `O` of `E`. -/
def origin (E : WeierstrassCurve ℚ) [E.IsElliptic] : Over.mk (𝟙 SpecQ) ⟶ toOver E := sorry

/-- Tau Ceti AlgebraicCurves Layers 6 and 12 (stand-in): the degree of a morphism of smooth projective ℚ-curves,
the degree of the extension of function fields, with value `0` for a constant morphism. -/
def curveDegree {X Y : Over SpecQ} (_φ : X ⟶ Y) : ℕ := sorry

/-- ModularCurvesPartII R12.5 (stand-in): for `φ : X₀(N) → E`, the cusp form `g` with
`φ^* ω_E = 2πi g(z) dz`, where `ω_E = dx/(2y + a₁x + a₃)` is the invariant differential of the given Weierstrass
equation. -/
def pullbackInvariantDifferential (E : WeierstrassCurve ℚ) [E.IsElliptic] {N : ℕ} (_φ : X0 N ⟶ toOver E) :
    CuspForm ((CongruenceSubgroup.Gamma1 N).map (Matrix.SpecialLinearGroup.mapGL ℝ)) 2 := sorry

/-- IMPORTED CONTRACT, not a theorem of this roadmap. Owner: Tau Ceti ModularForms Layer 5,
`tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`
(Miyake 4.6.19), in the case this roadmap requests: two newforms of weight 2 and trivial character whose
coefficients agree at almost all primes not dividing the product of the levels have the same level and the same
coefficients. The pinned fixed-level theorem `Newform.eq_of_forall_notMem_eigenvalue_eq` does not supply it. -/
theorem eq_of_eigenvalue_eq_across_levels {M M' : ℕ} [NeZero M] [NeZero M'] (f : Newform M 2)
    (g : Newform M' 2) (hf : f.χ = 1) (hg : g.χ = 1)
    (h : ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → ¬ ℓ ∣ M * M' → coeff f ℓ = coeff g ℓ) :
    M = M' ∧ ∀ n, coeff f n = coeff g n := sorry

end Imported

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-! ## R29.1. The exceptional primes, residual irreducibility and the residual conductor -/

/-- `EllipticCurveModularity:R29.1/exceptional-primes`: the primes `p` with `p ≤ 5`, or of bad reduction, or
dividing `v_ℓ(j_E)` at a prime `ℓ` of multiplicative reduction, or the order of a ℚ-rational cyclic subgroup. -/
def exceptionalPrimes (E : WeierstrassCurve ℚ) [E.IsElliptic] : Set ℕ :=
  {p | ∃ hp : p.Prime, haveI : Fact p.Prime := ⟨hp⟩
      p ≤ 5 ∨ ¬ HasGoodReductionAt E p ∨
        (∃ (ℓ : ℕ) (hℓ : ℓ.Prime), haveI : Fact ℓ.Prime := ⟨hℓ⟩
          HasMultiplicativeReductionAt E ℓ ∧ (p : ℤ) ∣ padicValRat ℓ E.j) ∨
        HasRationalCyclicSubgroup E p}

theorem exceptionalPrimes_finite : (exceptionalPrimes E).Finite := sorry

/-- For a prime `p ∉ Σ_E`, `E[p]` is an irreducible `𝔽_p[G_ℚ]`-module. -/
theorem irreducible_of_not_mem {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) :
    (residualRep E p).IsIrreducible := sorry

/-- For a prime `p ∉ Σ_E`, `E` has good reduction at `p`; equivalently `p ∤ N`. -/
theorem goodReduction_of_not_mem {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) :
    HasGoodReductionAt E p := sorry

theorem not_dvd_conductor_of_not_mem {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) :
    ¬ p ∣ conductor E := sorry

/-- `EllipticCurveModularity:R29.1/residual-conductor-divides`. -/
theorem artinConductor_residualRep_dvd (p : ℕ) [Fact p.Prime] :
    artinConductor (residualRep E p) ∣ conductor E := sorry

/-- `EllipticCurveModularity:R29.1/residual-conductor-equality`: Serre's criterion (a), (b), for `p ≥ 5`. -/
theorem artinConductor_residualRep_eq_iff (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) :
    artinConductor (residualRep E p) = conductor E ↔
      HasGoodReductionAt E p ∧ ∀ (ℓ : ℕ) (hℓ : ℓ.Prime), haveI : Fact ℓ.Prime := ⟨hℓ⟩
        HasMultiplicativeReductionAt E ℓ → ¬ (p : ℤ) ∣ padicValRat ℓ E.j := sorry

/-- `EllipticCurveModularity:R29.1/residual-irreducibility-and-the-conductor-of-E-p`, (4.6.1): `det ρ̄_{E,p}` is the
mod-`p` cyclotomic character. -/
theorem det_residualRep (p : ℕ) [Fact p.Prime] (σ : GQ) :
    LinearMap.det (residualRep E p σ) =
      PadicInt.toZMod ((cyclotomicCharacter (AlgebraicClosure ℚ) p σ.toRingEquiv : ℤ_[p]ˣ) : ℤ_[p]) := sorry

/-- Lemme 5, (4.6.2): for `p ∉ Σ_E` the representation `E[p]` is absolutely irreducible: after extension of
scalars to any field `k ⊇ 𝔽_p` it has no proper nonzero invariant subspace. -/
theorem absolutelyIrreducible_of_not_mem {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) (k : Type)
    [Field k] [Algebra (ZMod p) k] (W : Submodule k (k ⊗[ZMod p] Torsion E p))
    (hW : ∀ σ : GQ, W.map (LinearMap.baseChange k (residualRep E p σ)) ≤ W) : W = ⊥ ∨ W = ⊤ := sorry

/-- Lemme 5, (4.6.3): for `p ∉ Σ_E` the conductor of `E[p]` is `N`. -/
theorem artinConductor_residualRep_of_not_mem {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) :
    artinConductor (residualRep E p) = conductor E := sorry

/-! Unit tests for `exceptional-primes`. Coefficients are in the order `a₁, a₂, a₃, a₄, a₆`. The exact arithmetic
behind the expected values is stated in the accompanying roadmap. -/

/-- 11a1 = `X₀(11)`: `y² + y = x³ - x² - 10x - 20`. -/
def curve11a1 : WeierstrassCurve ℚ := ⟨0, -1, 1, -10, -20⟩
/-- 11a2: `y² + y = x³ - x² - 7820x - 263580`. -/
def curve11a2 : WeierstrassCurve ℚ := ⟨0, -1, 1, -7820, -263580⟩
/-- 11a3 = `X₁(11)`: `y² + y = x³ - x²`. -/
def curve11a3 : WeierstrassCurve ℚ := ⟨0, -1, 1, 0, 0⟩
/-- 26b1: `y² + xy + y = x³ - x² - 3x + 3`, with the point `(1, 0)` of order 7. -/
def curve26b1 : WeierstrassCurve ℚ := ⟨1, -1, 1, -3, 3⟩
/-- 274a1: `y² + xy = x³ - 7x + 9`, with `v₂(j) = -7` and no rational 7-isogeny. -/
def curveValuationOnly : WeierstrassCurve ℚ := ⟨1, 0, 0, -7, 9⟩
/-- 162b1: `y² + xy + y = x³ - x² - 5x + 5`, with a rational 7-isogeny and `v₂(j) = -3`. -/
def curveIsogenyOnly : WeierstrassCurve ℚ := ⟨1, -1, 1, -5, 5⟩
/-- 32a2: `y² = x³ - x`, with complex multiplication by `ℤ[i]`. -/
def curveCM : WeierstrassCurve ℚ := ⟨0, 0, 0, -1, 0⟩
/-- 37a1: `y² + y = x³ - x`. -/
def curve37a1 : WeierstrassCurve ℚ := ⟨0, 0, 1, -1, 0⟩
/-- The quadratic twist of 11a1 by `-1`: `y² = x³ + 4x² - 160x + 1264`. -/
def curve11a1TwistNegOne : WeierstrassCurve ℚ := ⟨0, 4, 0, -160, 1264⟩

instance : curve11a1.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve11a2.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a2, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve11a3.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a3, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve26b1.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve26b1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curveValuationOnly.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curveValuationOnly, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curveIsogenyOnly.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curveIsogenyOnly, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curveCM.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curveCM, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve37a1.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve37a1, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩
instance : curve11a1TwistNegOne.IsElliptic :=
  ⟨by
    rw [isUnit_iff_ne_zero]
    norm_num [curve11a1TwistNegOne, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄, WeierstrassCurve.b₆,
      WeierstrassCurve.b₈]⟩

theorem exceptionalPrimes_11a1 :
    5 ∈ exceptionalPrimes curve11a1 ∧ 11 ∈ exceptionalPrimes curve11a1 := by sorry

/-- The clause `p ≤ 5`; this one follows from the definition. -/
theorem exceptionalPrimes_contains_small :
    2 ∈ exceptionalPrimes E ∧ 3 ∈ exceptionalPrimes E ∧ 5 ∈ exceptionalPrimes E :=
  ⟨⟨Nat.prime_two, Or.inl (by norm_num)⟩, ⟨Nat.prime_three, Or.inl (by norm_num)⟩,
    ⟨Nat.prime_five, Or.inl (by norm_num)⟩⟩

theorem exceptionalPrimes_CM :
    (exceptionalPrimes curveCM).Finite ∧ 2 ∈ exceptionalPrimes curveCM := by sorry

/-- Non-membership: 11a1 is good at 7, `v₁₁(j) = -5`, and there is no rational cyclic subgroup of order 7. -/
theorem exceptionalPrimes_11a1_seven : 7 ∉ exceptionalPrimes curve11a1 := by sorry

/-- Both extra clauses at once: a rational point of order 7, and `v₂(j) = -7` at the multiplicative prime 2. -/
theorem exceptionalPrimes_26b1 :
    7 ∈ exceptionalPrimes curve26b1 ∧ HasRationalCyclicSubgroup curve26b1 7 ∧
      padicValRat 2 curve26b1.j = -7 := by sorry

/-- The valuation clause alone: `v₂(j) = -7`, good reduction at 7, no rational cyclic subgroup of order 7. -/
theorem exceptionalPrimes_valuation_only :
    7 ∈ exceptionalPrimes curveValuationOnly ∧ ¬ HasRationalCyclicSubgroup curveValuationOnly 7 := by sorry

/-- The isogeny clause alone: a rational cyclic subgroup of order 7, good reduction at 7, and `7 ∤ v₂(j) = -3` at
the only multiplicative prime. -/
theorem exceptionalPrimes_isogeny_only :
    7 ∈ exceptionalPrimes curveIsogenyOnly ∧ HasRationalCyclicSubgroup curveIsogenyOnly 7 ∧
      padicValRat 2 curveIsogenyOnly.j = -3 := by sorry

/-! ## R29.2. Serre witnesses -/

/-- `EllipticCurveModularity:R29.2/finite-flat-weight-two`: for `p ∉ Σ_E`, Serre's weight of `E[p]` is 2. -/
theorem serreWeight_residualRep {p : ℕ} [Fact p.Prime] (h : p ∉ exceptionalPrimes E) :
    serreWeight (residualRep E p) = 2 := sorry

/-- `EllipticCurveModularity:R29.2/weight-two-and-level-N-from-the-weight-recipe`: a Serre witness for `E` at `p`
is a newform `g` of weight 2 and level `N` with a maximal ideal `λ ∣ p` of the ring of algebraic integers. -/
structure SerreWitness (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) where
  /-- The newform `g_p` of weight 2 and level the conductor of `E`. -/
  form : Newform (conductor E) 2
  /-- The prime `λ_p` of the ring of algebraic integers of ℂ. -/
  prime : Ideal (integralClosure ℤ ℂ)
  /-- `λ_p` is maximal. -/
  isMaximal : prime.IsMaximal
  /-- `λ_p` lies over `p`. -/
  natCast_mem : (p : integralClosure ℤ ℂ) ∈ prime

attribute [instance] SerreWitness.isMaximal

/-- The witness `(g_p, λ_p)` at a prime `p ∉ Σ_E`, from ClassicalSerreModularity R27.6. -/
def serreWitness {p : ℕ} (hp : p.Prime) (h : p ∉ exceptionalPrimes E) : SerreWitness E p := sorry

/-- Weight 2 and level `N` are carried by the type; the character of `g_p` is trivial. -/
theorem serreWitness_level {p : ℕ} (hp : p.Prime) (h : p ∉ exceptionalPrimes E) :
    (serreWitness E hp h).form.χ = 1 := sorry

/-- `a_ℓ(g_p) ≡ a_ℓ(E) mod λ_p` for every prime `ℓ ∤ Np`. -/
theorem serreWitness_trace {p : ℕ} (hp : p.Prime) (h : p ∉ exceptionalPrimes E) {ℓ : ℕ} (hℓ : ℓ.Prime)
    (hℓN : ¬ ℓ ∣ conductor E) (hℓp : ℓ ≠ p) :
    ∃ x ∈ (serreWitness E hp h).prime, (x : ℂ) = coeff (serreWitness E hp h).form ℓ - (lCoeff E ℓ : ℂ) := sorry

/-- `ρ̄_{g_p,λ_p} ≅ ρ̄_{E,p} ⊗ k_λ`: an equivariant additive (hence `𝔽_p`-linear) map `E[p] → k_λ²` whose image
spans `k_λ²` over the residue field `k_λ`. -/
theorem serreWitness_residual {p : ℕ} (hp : p.Prime) (h : p ∉ exceptionalPrimes E) :
    haveI : Fact p.Prime := ⟨hp⟩
    ∃ φ : Torsion E p →+ (Fin 2 → integralClosure ℤ ℂ ⧸ (serreWitness E hp h).prime),
      (∀ (σ : GQ) (v : Torsion E p), φ (residualRep E p σ v) =
        newformResidualRep (serreWitness E hp h).form (serreWitness E hp h).prime σ (φ v)) ∧
      Submodule.span (integralClosure ℤ ℂ ⧸ (serreWitness E hp h).prime) (Set.range φ) = ⊤ := sorry

/-- Unit test: at `p = 7` the witness of 11a1 is `η(z)² η(11z)²`. -/
theorem serreWitness_11a1 (τ : UpperHalfPlane) :
    (serreWitness curve11a1 (p := 7) (by decide) exceptionalPrimes_11a1_seven).form.toCuspForm τ =
      ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2 := by sorry

/-- Unit test: `a₂(g₇) = -2 = a₂(E)` for `E` = 11a1. -/
theorem serreWitness_trace_2 :
    coeff (serreWitness curve11a1 (p := 7) (by decide) exceptionalPrimes_11a1_seven).form 2 = -2 ∧
      lCoeff curve11a1 2 = -2 := by sorry

/-- Unit test: `5 ∈ Σ_{11a1}` and `E[5]` is reducible, so no witness is requested at 5. -/
theorem serreWitness_not_at_exceptional :
    haveI : Fact (Nat.Prime 5) := ⟨by decide⟩
    5 ∈ exceptionalPrimes curve11a1 ∧ ¬ (residualRep curve11a1 5).IsIrreducible := by sorry

/-- `EllipticCurveModularity:R29.2/trivial-nebentypus-by-reduction`: a root of unity of order prime to `p` that is
`≡ 1` modulo a prime above `p` equals 1. The primality of `p` is needed: for `p = 4`, `m = 2`, `ζ = -1` and
`𝔭 = (2)` in `ℤ` all other hypotheses hold. -/
theorem eq_one_of_pow_eq_one_of_sub_mem {K : Type*} [Field K] [NumberField K] (ζ : 𝓞 K) {m : ℕ} (hm : ζ ^ m = 1)
    (𝔭 : Ideal (𝓞 K)) [𝔭.IsPrime] {p : ℕ} (hp' : p.Prime) (hp : (p : 𝓞 K) ∈ 𝔭) (hpm : ¬ p ∣ m)
    (h : ζ - 1 ∈ 𝔭) : ζ = 1 := sorry

/-! ## R29.3. One newform with exact coefficients -/

/-- `EllipticCurveModularity:R29.3/pigeonhole-infinite-fiber`. -/
theorem exists_infinite_fiber {ι : Type*} [Finite ι] {P : Set ℕ} (hP : P.Infinite) (F : ℕ → ι) :
    ∃ i, (P ∩ F ⁻¹' {i}).Infinite := sorry

/-- `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`, integer form. -/
theorem int_eq_zero_of_forall_dvd {n : ℤ} {P : Set ℕ} (hP : P.Infinite) (h : ∀ p ∈ P, (p : ℤ) ∣ n) : n = 0 := sorry

/-- `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`. -/
theorem eq_zero_of_mem_primes {K : Type*} [Field K] [NumberField K] (α : 𝓞 K) {P : Set ℕ} (hP : P.Infinite)
    (hprime : ∀ p ∈ P, p.Prime)
    (h : ∀ p ∈ P, ∃ 𝔭 : Ideal (𝓞 K), 𝔭.IsPrime ∧ (p : 𝓞 K) ∈ 𝔭 ∧ α ∈ 𝔭) : α = 0 := sorry

example : ¬ ∃ P : Set ℕ, P.Infinite ∧ ∀ p ∈ P, (p : ℤ) ∣ 6 := sorry
/-- The primes split into the classes 1 and 3 mod 4; one class is infinite. -/
example : ∃ b : Bool, ({p : ℕ | p.Prime} ∩ (fun p => p % 4 == 1) ⁻¹' {b}).Infinite := sorry
example : ¬ (3 : ℤ) ∣ 2 := by decide

/-- `EllipticCurveModularity:R29.3/attached-newform`: a normalised newform `F` of weight 2 and any level is
attached to `E` when its character is trivial and `a_ℓ(F) = a_ℓ(E)` for all but finitely many primes `ℓ`. -/
def IsNewformOf (E : WeierstrassCurve ℚ) {M : ℕ} [NeZero M] (F : Newform M 2) : Prop :=
  F.χ = 1 ∧ ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → coeff F ℓ = (lCoeff E ℓ : ℂ)

/-- Two newforms attached to `E`, of any levels, have the same level and the same coefficients (Layer 5). -/
theorem IsNewformOf.unique {M M' : ℕ} [NeZero M] [NeZero M'] {F : Newform M 2} {G : Newform M' 2}
    (hF : IsNewformOf E F) (hG : IsNewformOf E G) : M = M' ∧ ∀ n, coeff F n = coeff G n := sorry

/-- The notion depends only on the coefficients `a_ℓ(E)` at almost all primes; so it is invariant under ℚ-isogeny
and under change of Weierstrass model. This one follows from the definition. -/
theorem IsNewformOf.congr {E E' : WeierstrassCurve ℚ} {M : ℕ} [NeZero M] {F : Newform M 2}
    (h : ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → lCoeff E ℓ = lCoeff E' ℓ) :
    IsNewformOf E F ↔ IsNewformOf E' F := by
  constructor
  · rintro ⟨hχ, hF⟩
    exact ⟨hχ, by filter_upwards [h, hF] with ℓ h1 h2 hp; rw [h2 hp, h1 hp]⟩
  · rintro ⟨hχ, hF⟩
    exact ⟨hχ, by filter_upwards [h, hF] with ℓ h1 h2 hp; rw [h2 hp, h1 hp]⟩

/-- Unit test: the newform `η(z)² η(11z)²` of level 11 is attached to 11a1 and to the isogenous curve 11a3. -/
theorem isNewformOf_11a1 :
    ∃ F : Newform 11 2, (∀ τ : UpperHalfPlane,
        F.toCuspForm τ = ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2) ∧
      IsNewformOf curve11a1 F ∧ IsNewformOf curve11a3 F := by sorry

/-- Unit test: no newform of level 11 is attached to 37a1. -/
theorem not_isNewformOf_37a1 (F : Newform 11 2) : ¬ IsNewformOf curve37a1 F := by sorry

omit [E.IsElliptic] in
/-- Unit test: a newform with nontrivial character is attached to no curve. This one follows from the definition. -/
theorem not_isNewformOf_of_char_ne_one {M : ℕ} [NeZero M] (F : Newform M 2) (hF : F.χ ≠ 1) :
    ¬ IsNewformOf E F := fun h => hF h.1

/-- `EllipticCurveModularity:R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients`: a newform of
weight 2, level `N` and trivial character with `a_ℓ = a_ℓ(E)` at every prime `ℓ ∤ N`. The level is `N` because the
Serre witnesses are newforms of level `N`. -/
theorem exists_newform_coeff_eq :
    ∃ F : Newform (conductor E) 2, F.χ = 1 ∧
      ∀ ℓ : ℕ, ℓ.Prime → ¬ ℓ ∣ conductor E → coeff F ℓ = (lCoeff E ℓ : ℂ) := sorry

/-- `EllipticCurveModularity:R29.3/rational-coefficient-field`: every coefficient of a newform attached to `E` is
a rational integer. -/
theorem IsNewformOf.coeff_int {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    ∃ m : ℤ, coeff F n = m := sorry

/-- `EllipticCurveModularity:R29.3/newform-of-E`: the newform `F_E` attached to `E`, of level `N`. -/
def newformOf (E : WeierstrassCurve ℚ) [E.IsElliptic] : Newform (conductor E) 2 := sorry

theorem isNewformOf_newformOf : IsNewformOf E (newformOf E) := sorry

theorem newformOf_coeff_prime {ℓ : ℕ} (hℓ : ℓ.Prime) (h : ¬ ℓ ∣ conductor E) :
    coeff (newformOf E) ℓ = (lCoeff E ℓ : ℂ) := sorry

/-- Any newform attached to `E`, of any level, is `F_E`: same level and same coefficients. -/
theorem newformOf_unique {M : ℕ} [NeZero M] (F : Newform M 2) (h : IsNewformOf E F) :
    M = conductor E ∧ ∀ n, coeff F n = coeff (newformOf E) n := sorry

theorem newformOf_coeff_int (n : ℕ) : ∃ m : ℤ, coeff (newformOf E) n = m := sorry

/-- Unit test: the conductor of 11a1 is 11 and `F_E = η(z)² η(11z)²`. -/
theorem newformOf_11a1 :
    conductor curve11a1 = 11 ∧ ∀ τ : UpperHalfPlane,
      (newformOf curve11a1).toCuspForm τ = ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2 := by sorry

/-- Unit test: the isogenous curves 11a1, 11a2, 11a3 have the same newform. -/
theorem newformOf_isogeny_invariant (n : ℕ) :
    coeff (newformOf curve11a2) n = coeff (newformOf curve11a1) n ∧
      coeff (newformOf curve11a3) n = coeff (newformOf curve11a1) n := by sorry

/-- Unit test: the twist of 11a1 by `-1` has the newform twisted by the character `χ₋₄`, at the primes `ℓ ∤ 2·11`. -/
theorem newformOf_twist {ℓ : ℕ} (hℓ : ℓ.Prime) (h2 : ℓ ≠ 2) (h11 : ℓ ≠ 11) :
    coeff (newformOf curve11a1TwistNegOne) ℓ = (ZMod.χ₄ (ℓ : ZMod 4) : ℂ) * coeff (newformOf curve11a1) ℓ := by
  sorry

/-! ## R29.4. Galois comparison, exact conductor and bad Euler factors -/

/-- `EllipticCurveModularity:R29.4/tate-module-comparison`: `V_r(E) ≅ V_r(F)` for a newform `F` attached to `E`. -/
theorem IsNewformOf.nonempty_tateModule_equiv {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (r : ℕ)
    [Fact r.Prime] :
    Nonempty ((rationalTateRep E r).asModule ≃ₗ[ℚ_[r][GQ]] (newformGaloisRep F (h.coeff_int E) r).asModule) :=
  sorry

/-- `EllipticCurveModularity:R29.4/exact-conductor`: the level of a newform attached to `E` is the conductor. The
proof does not use the Serre witnesses. -/
theorem IsNewformOf.level_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    M = conductor E := sorry

/-- `EllipticCurveModularity:R29.4/bad-euler-factors`: every local factor of `E`, in Mathlib's convention, is the
Euler factor of a newform `F` attached to `E`. -/
theorem IsNewformOf.localPolynomial_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (ℓ : ℕ)
    [Fact ℓ.Prime] :
    ∃ a : ℤ, coeff F ℓ = a ∧ (E.baseChange ℚ_[ℓ]).localPolynomial ℤ_[ℓ] =
      1 - C a * X + (if ℓ ∣ conductor E then 0 else C (ℓ : ℤ) * X ^ 2) := sorry

/-- All coefficients agree: `a_n(F) = a_n(E)` for every `n`, bad primes included. -/
theorem IsNewformOf.coeff_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    coeff F n = (lCoeff E n : ℂ) := sorry

/-! ## R29.5. The modular quotient and the modular parametrisation -/

theorem newformOf_χ : (newformOf E).χ = 1 := (isNewformOf_newformOf E).1

/-- A ℚ-isogeny `λ : A_F → E` from the quotient of `J₀` attached to a newform `F` with trivial character: a
surjective morphism of ℚ-curves that respects the origins. -/
structure QuotientIsogeny (E : WeierstrassCurve ℚ) [E.IsElliptic] {M : ℕ} [NeZero M] (F : Newform M 2)
    (hF : F.χ = 1) where
  /-- The underlying morphism over ℚ. -/
  hom : modularQuotient₀ F hF ⟶ toOver E
  /-- It sends the origin to the origin. -/
  map_origin : modularQuotient₀.origin F hF ≫ hom = origin E
  /-- It is surjective. -/
  surjective : Surjective hom.left

/-- `EllipticCurveModularity:R29.5/isogeny-to-E`: for every newform `F` attached to `E` there is a ℚ-isogeny
`A_F → E`. -/
theorem IsNewformOf.nonempty_quotientIsogeny {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    Nonempty (QuotientIsogeny E F h.1) := sorry

/-- Consequence, used for the equivalence in R29.6: a newform attached to `E`, of level `M`, gives a surjective
homomorphism `J₀(M) → E`. -/
theorem IsNewformOf.exists_hom_J0 {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    ∃ π : J0 M ⟶ toOver E, J0.origin M ≫ π = origin E ∧ Surjective π.left := sorry

/-- And a nonconstant morphism `X₀(M) → E` sending `∞` to `O`. -/
theorem IsNewformOf.exists_hom_X0 {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    ∃ φ : X0 M ⟶ toOver E, X0.cuspInfty M ≫ φ = origin E ∧ Surjective φ.left := sorry

variable {E} in
/-- `EllipticCurveModularity:R29.5/modular-parametrisation`: `φ_E`, the composite of the Abel–Jacobi morphism at
`∞`, the quotient `J₀(N) → A_{F_E}` and the chosen isogeny `λ`. -/
def modularParametrisation (lam : QuotientIsogeny E (newformOf E) (newformOf_χ E)) :
    X0 (conductor E) ⟶ toOver E :=
  abelJacobiInfty (conductor E) ≫ modularQuotient₀.map (newformOf E) (newformOf_χ E) ≫ lam.hom

theorem modularParametrisation_cusp (lam : QuotientIsogeny E (newformOf E) (newformOf_χ E)) :
    X0.cuspInfty (conductor E) ≫ modularParametrisation lam = origin E := sorry

theorem modularParametrisation_nonconstant (lam : QuotientIsogeny E (newformOf E) (newformOf_χ E)) :
    Surjective (modularParametrisation lam).left ∧ 0 < curveDegree (modularParametrisation lam) := sorry

/-- `φ_E^* ω_E = c · 2πi F_E(z) dz` with `c ∈ ℚ^×`. -/
theorem modularParametrisation_pullback (lam : QuotientIsogeny E (newformOf E) (newformOf_χ E)) :
    ∃ c : ℚ, c ≠ 0 ∧ ∀ τ : UpperHalfPlane,
      pullbackInvariantDifferential E (modularParametrisation lam) τ = (c : ℂ) * (newformOf E).toCuspForm τ :=
  sorry

/-- Unit test: for 11a1 = `X₀(11)` the parametrisation is an isomorphism. -/
theorem modularParametrisation_11a1 :
    ∃ lam : QuotientIsogeny curve11a1 (newformOf curve11a1) (newformOf_χ curve11a1),
      IsIso (modularParametrisation lam) := by sorry

/-- Unit test: for 11a3 the minimal degree of a parametrisation is 5, attained by a 5-isogeny 11a1 → 11a3. -/
theorem modularParametrisation_11a3 :
    (∃ lam : QuotientIsogeny curve11a3 (newformOf curve11a3) (newformOf_χ curve11a3),
        curveDegree (modularParametrisation lam) = 5) ∧
      ∀ lam : QuotientIsogeny curve11a3 (newformOf curve11a3) (newformOf_χ curve11a3),
        5 ≤ curveDegree (modularParametrisation lam) := by sorry

/-- Unit test: 37a1 is its own modular quotient, and the parametrisation has degree 2. -/
theorem modularParametrisation_37a :
    ∃ lam : QuotientIsogeny curve37a1 (newformOf curve37a1) (newformOf_χ curve37a1),
      IsIso lam.hom ∧ curveDegree (modularParametrisation lam) = 2 := by sorry

/-! ## R29.6. The modularity theorem, the converse and the L-function -/

/-- `EllipticCurveModularity:R29.6/absolute-irreducibility-of-the-rational-tate-module`: the ℚ_r-span of the image
of `G_ℚ` in `End(V_r(E))` is everything. -/
theorem span_range_rationalTateRep (r : ℕ) [Fact r.Prime] :
    Submodule.span ℚ_[r] (Set.range (rationalTateRep E r)) = ⊤ := sorry

/-- `EllipticCurveModularity:R29.6/newform-from-a-modular-quotient`: a surjective homomorphism `J₀(N') → E` over ℚ,
of any level `N'`, yields a newform attached to `E` of level dividing `N'`. -/
theorem exists_isNewformOf_of_J0 {N' : ℕ} [NeZero N'] (π : J0 N' ⟶ toOver E) (h0 : J0.origin N' ≫ π = origin E)
    (hπ : Surjective π.left) :
    ∃ (M : ℕ) (_ : NeZero M) (F : Newform M 2), M ∣ N' ∧ IsNewformOf E F := sorry

/-- The same from a parametrisation, through the universal property of the Abel–Jacobi morphism (part of
`EllipticCurveModularity:R29.6/modularity-theorem`): a nonconstant `X₀(N') → E` sending `∞` to `O`. -/
theorem exists_isNewformOf_of_X0 {N' : ℕ} [NeZero N'] (φ : X0 N' ⟶ toOver E)
    (h0 : X0.cuspInfty N' ≫ φ = origin E) (hφ : Surjective φ.left) :
    ∃ (M : ℕ) (_ : NeZero M) (F : Newform M 2), M ∣ N' ∧ IsNewformOf E F := sorry

/-- Consequence: `E` is a quotient of `J₀(N')` only if `N ∣ N'`. -/
theorem conductor_dvd_of_J0 {N' : ℕ} [NeZero N'] (π : J0 N' ⟶ toOver E) (h0 : J0.origin N' ≫ π = origin E)
    (hπ : Surjective π.left) : conductor E ∣ N' := sorry

/-- `EllipticCurveModularity:R29.6/modularity-theorem`, formulation (i). -/
theorem modularity :
    ∃ F : Newform (conductor E) 2, F.χ = 1 ∧ ∀ n : ℕ, coeff F n = (lCoeff E n : ℂ) := sorry

/-- Formulation (ii): `E` is a quotient of `J₀(N)`. -/
theorem modularity_quotient :
    ∃ π : J0 (conductor E) ⟶ toOver E, J0.origin (conductor E) ≫ π = origin E ∧ Surjective π.left := sorry

/-- Formulation (iii): a nonconstant morphism `X₀(N) → E` over ℚ sending `∞` to `O`. -/
theorem modularity_parametrisation :
    ∃ φ : X0 (conductor E) ⟶ toOver E, X0.cuspInfty (conductor E) ≫ φ = origin E ∧ Surjective φ.left := sorry

/-- `EllipticCurveModularity:R29.6/l-function-continuation`: the Dirichlet coefficients of `L(E, s)` are the
Fourier coefficients of `F_E`. -/
theorem LFunction_eq (n : ℕ) : (E.LFunction n : ℂ) = coeff (newformOf E) n := sorry

/-- The completed `L`-function `Λ(E, s) = N^{s/2} (2π)^{-s} Γ(s) L(E, s)` is entire and satisfies
`Λ(E, s) = w Λ(E, 2 - s)` with `w = ±1`. -/
theorem exists_entire_completed_LSeries :
    ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
      (∀ s : ℂ, 3 / 2 < s.re →
        Λ s = (conductor E : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * E.LSeries s) ∧
      ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ, Λ s = w * Λ (2 - s) := sorry

/-- Acceptance test of `l-function-continuation`: 11a1 has root number `+1` and `L(E, 1) ≠ 0`. -/
example : ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
    (∀ s : ℂ, 3 / 2 < s.re →
      Λ s = (11 : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * curve11a1.LSeries s) ∧
    (∀ s : ℂ, Λ s = Λ (2 - s)) ∧ Λ 1 ≠ 0 := sorry

/-
`EllipticCurveModularity:R29.6/what-theoreme-4-asserts-and-its-scope` records Serre's Théorème 5 (abelian varieties
over ℚ with real multiplication) as a separately scoped target. The pinned Tau Ceti library has abelian varieties
and their endomorphism rings. Its abelian-variety conductor and real-multiplication compatible-system interfaces
are not supplied here, so this companion is specified in the README rather than stated in this file.
-/

/-! ## Unit examples

The named assertions above preserve the reusable test names. These examples also state the
mathematical cases directly as prototyping checks for the definitions and constructions.
-/

/-- Unit example for `exceptionalPrimes_11a1`. -/
example :
    5 ∈ exceptionalPrimes curve11a1 ∧ 11 ∈ exceptionalPrimes curve11a1 := sorry

/-- Unit example for `exceptionalPrimes_contains_small`. -/
example :
    2 ∈ exceptionalPrimes E ∧ 3 ∈ exceptionalPrimes E ∧ 5 ∈ exceptionalPrimes E := sorry

/-- Unit example for `exceptionalPrimes_CM`. -/
example :
    (exceptionalPrimes curveCM).Finite ∧ 2 ∈ exceptionalPrimes curveCM := sorry

/-- Unit example for `exceptionalPrimes_11a1_seven`. -/
example : 7 ∉ exceptionalPrimes curve11a1 := sorry

/-- Unit example for `exceptionalPrimes_26b1`. -/
example :
    7 ∈ exceptionalPrimes curve26b1 ∧ HasRationalCyclicSubgroup curve26b1 7 ∧
      padicValRat 2 curve26b1.j = -7 := sorry

/-- Unit example for `exceptionalPrimes_valuation_only`. -/
example :
    7 ∈ exceptionalPrimes curveValuationOnly ∧ ¬ HasRationalCyclicSubgroup curveValuationOnly 7 := sorry

/-- Unit example for `exceptionalPrimes_isogeny_only`. -/
example :
    7 ∈ exceptionalPrimes curveIsogenyOnly ∧ HasRationalCyclicSubgroup curveIsogenyOnly 7 ∧
      padicValRat 2 curveIsogenyOnly.j = -3 := sorry

/-- Unit example for `serreWitness_11a1`. -/
example (τ : UpperHalfPlane) :
    (serreWitness curve11a1 (p := 7) (by decide) exceptionalPrimes_11a1_seven).form.toCuspForm τ =
      ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2 := sorry

/-- Unit example for `serreWitness_trace_2`. -/
example :
    coeff (serreWitness curve11a1 (p := 7) (by decide) exceptionalPrimes_11a1_seven).form 2 = -2 ∧
      lCoeff curve11a1 2 = -2 := sorry

/-- Unit example for `serreWitness_not_at_exceptional`. -/
example :
    haveI : Fact (Nat.Prime 5) := ⟨by decide⟩
    5 ∈ exceptionalPrimes curve11a1 ∧ ¬ (residualRep curve11a1 5).IsIrreducible := sorry

/-- Unit example for `isNewformOf_11a1`. -/
example :
    ∃ F : Newform 11 2, (∀ τ : UpperHalfPlane,
        F.toCuspForm τ = ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2) ∧
      IsNewformOf curve11a1 F ∧ IsNewformOf curve11a3 F := sorry

/-- Unit example for `not_isNewformOf_37a1`. -/
example (F : Newform 11 2) : ¬ IsNewformOf curve37a1 F := sorry

/-- Unit example for `not_isNewformOf_of_char_ne_one`. -/
example {M : ℕ} [NeZero M] (F : Newform M 2) (hF : F.χ ≠ 1) :
    ¬ IsNewformOf E F := sorry

/-- Unit example for `newformOf_11a1`. -/
example :
    conductor curve11a1 = 11 ∧ ∀ τ : UpperHalfPlane,
      (newformOf curve11a1).toCuspForm τ = ModularForm.eta τ ^ 2 * ModularForm.eta (11 * τ) ^ 2 := sorry

/-- Unit example for `newformOf_isogeny_invariant`. -/
example (n : ℕ) :
    coeff (newformOf curve11a2) n = coeff (newformOf curve11a1) n ∧
      coeff (newformOf curve11a3) n = coeff (newformOf curve11a1) n := sorry

/-- Unit example for `newformOf_twist`. -/
example {ℓ : ℕ} (hℓ : ℓ.Prime) (h2 : ℓ ≠ 2) (h11 : ℓ ≠ 11) :
    coeff (newformOf curve11a1TwistNegOne) ℓ = (ZMod.χ₄ (ℓ : ZMod 4) : ℂ) * coeff (newformOf curve11a1) ℓ := sorry

/-- Unit example for `modularParametrisation_11a1`. -/
example :
    ∃ lam : QuotientIsogeny curve11a1 (newformOf curve11a1) (newformOf_χ curve11a1),
      IsIso (modularParametrisation lam) := sorry

/-- Unit example for `modularParametrisation_11a3`. -/
example :
    (∃ lam : QuotientIsogeny curve11a3 (newformOf curve11a3) (newformOf_χ curve11a3),
        curveDegree (modularParametrisation lam) = 5) ∧
      ∀ lam : QuotientIsogeny curve11a3 (newformOf curve11a3) (newformOf_χ curve11a3),
        5 ≤ curveDegree (modularParametrisation lam) := sorry

/-- Unit example for `modularParametrisation_37a`. -/
example :
    ∃ lam : QuotientIsogeny curve37a1 (newformOf curve37a1) (newformOf_χ curve37a1),
      IsIso lam.hom ∧ curveDegree (modularParametrisation lam) = 2 := sorry

end TauCeti.EllipticCurve.Modularity
