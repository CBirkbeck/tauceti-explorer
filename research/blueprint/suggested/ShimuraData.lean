import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.DedekindDomain.FiniteAdeleRing
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.RingTheory.Bialgebra.MonoidAlgebra
import Mathlib.Algebra.DirectSum.Module
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.GroupTheory.Coxeter.Length
import Mathlib.LinearAlgebra.RootSystem.WeylGroup
import Mathlib.LinearAlgebra.RootSystem.Base
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.Analysis.Calculus.FDeriv.Basic
import Mathlib.Analysis.Complex.UpperHalfPlane.Basic
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.GroupTheory.Coset.Basic
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.AlgebraicTopology.FundamentalGroupoid.Basic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.HopfAlgebra
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Coordinate.BaseChange
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.AlgebraicTopology.LocalCoefficient
import TauCeti.Geometry.Hodge.Structure
import TauCeti.Geometry.Hodge.Polarization
import TauCeti.Geometry.Hodge.Substructure

/-!
# Shimura data, Part II: suggested Lean statements (BP-ShimuraData~4, reviewed in REV-ShimuraData~4; revision 5, BP-ShimuraData~5)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ShimuraData.md` is definitive. The statements suggest Lean forms so that
contributors and reviewers converge on names and signatures; every proof is `sorry` and nothing
here claims an implementation.

Revision 4 consumes what the open TauCetiRoadmap pull requests state: pure Shimura data, their
Hermitian components, the representation–Hodge dictionary, the Borel embedding, reflex fields,
levels and the GL₂/Siegel/torus examples (ShimuraVarieties §§P.1–P.5, PR #933); PEL data and the
scalar-determinant Hilbert datum (PELModuli §§M0.12, M5.4, PR #966); the Deligne torus
(ReductiveGroupsPartII §RG2.0a.3, PR #785); adelic points and neatness (AdelicAlgebraicGroups
§§1.3–1.4, 4.3, PR #792); real points as Lie groups and Cartan involutions
(ArithmeticLocallySymmetricSpaces §§ALS.F.1, ALS.0.1–0.2, PR #871). None of these is at the pins,
so nothing below re-defines them. Revision 5 also consumes ComplexKahlerGeometry §K4 (PR #953) for
the holomorphic flat bundle of a local system; it is not at the pins either.

Conventions. Type `(p,q)` means the split character `(−p,−q)` of `S_ℂ = G_m × G_m`, so `h_ℂ(z₁,z₂)`
acts on `V^{p,q}` by `z₁^{-p} z₂^{-q}` and `μ_h(z) = h_ℂ(z,1)` (ShimuraVarieties §P.3). The complexified
Deligne torus has coordinate algebra `ℂ[ℤ²] = MonoidAlgebra ℂ (Multiplicative (ℤ × ℤ))`.

What is left out, and why. The pins have no Weil restriction, Deligne torus, pure Shimura datum,
holomorphic flat bundle, or flag scheme over `ℤ`. Statements needing them are README targets and
are listed, with their packet names, in the section *README-only targets* at the end. Where a
retained statement can be made on carriers that exist (GL coordinate Hopf algebras, the split
torus algebra, matrices, root pairings, Coxeter systems, valuations, finite adeles, local
coefficient systems, Hodge structures), it is made there, and any condition those carriers cannot
express is named in a comment rather than replaced by an arbitrary proposition.
-/

noncomputable section

open scoped TensorProduct

namespace TauCeti.Shimura

/-! ## D0. Points of the Hilbert groups -/

section HilbertPoints

variable (F : Type*) [Field F] [NumberField F]

/-- **D0/hilbert-real-points.** For totally real `F`, `ℝ ⊗_ℚ F ≅ ℝ^{Hom(F,ℝ)}` by
`r ⊗ x ↦ (r σ(x))_σ`; on `GL₂` this is `(Res_{F/ℚ} GL₂)(ℝ) ≅ ∏_σ GL₂(ℝ)`, and the scalar-determinant
subgroup `G*` corresponds to the tuples with one common real determinant (of either sign).
Left out: the Lie-group structure (ArithmeticLocallySymmetricSpaces §ALS.F.1) and the component
count, which need the point topology of RG2.0. -/
theorem hilbertRealPoints [NumberField.IsTotallyReal F] :
    ∃ e : ℝ ⊗[ℚ] F ≃ₐ[ℝ] ((F →+* ℝ) → ℝ),
      (∀ (r : ℝ) (x : F) (σ : F →+* ℝ), e (r ⊗ₜ x) σ = r * σ x) ∧
      ∀ g : GL (Fin 2) (ℝ ⊗[ℚ] F),
        (∃ t : ℝ, ∀ σ : F →+* ℝ,
            ((Matrix.GeneralLinearGroup.map
              ((Pi.evalRingHom (fun _ : F →+* ℝ ↦ ℝ) σ).comp e.toRingHom) g).det : ℝ) = t) ↔
          (Matrix.GeneralLinearGroup.det g : ℝ ⊗[ℚ] F) ∈ Set.range (algebraMap ℝ (ℝ ⊗[ℚ] F)) := by
  sorry

/-- **D0/hilbert-adelic-points.** `𝔸_{ℚ,f} ⊗_ℚ F ≅ 𝔸_{F,f}` (AdelicAlgebraicGroups §1.4,
`base-change-adelic`), so `(Res_{F/ℚ}GL₂)(𝔸_{ℚ,f}) ≅ GL₂(𝔸_{F,f})`; under it `G*(𝔸_{ℚ,f})` is the
locus with determinant in the image of `𝔸_{ℚ,f}^×`. Left out: the topology on the tensor
product (AA §1.4 states the isomorphism as topological groups). -/
theorem hilbertAdelicPoints :
    ∃ e : IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] F ≃+*
        IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F,
      (∀ x : F, e (1 ⊗ₜ x) = algebraMap F _ x) ∧
      ∀ g : GL (Fin 2) (IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] F),
        (Matrix.GeneralLinearGroup.det g : IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] F) ∈
            Set.range (fun a : IsDedekindDomain.FiniteAdeleRing ℤ ℚ ↦
              (a ⊗ₜ (1 : F) : IsDedekindDomain.FiniteAdeleRing ℤ ℚ ⊗[ℚ] F)) ↔
          ((Matrix.GeneralLinearGroup.map e.toRingHom g).det :
              IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) ∈
            Set.range (fun a : IsDedekindDomain.FiniteAdeleRing ℤ ℚ ↦ e (a ⊗ₜ 1)) := by
  sorry

end HilbertPoints

/-! ## D1. Rational weight and Mumford–Tate groups -/

section RationalWeight

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

/-- The operator acting by `t^n` on the `n`-th summand of an internal real grading of `ℝ ⊗_ℚ V`;
for the weight grading of a real `S`-representation this is `w_h(t)`. -/
def weightOperator (W : ℤ → Submodule ℝ (ℝ ⊗[ℚ] V)) (hW : DirectSum.IsInternal W) (t : ℝ) :
    Module.End ℝ (ℝ ⊗[ℚ] V) :=
  let e := LinearEquiv.ofBijective (DirectSum.coeLinearMap W) hW
  (DirectSum.toModule ℝ ℤ (ℝ ⊗[ℚ] V) fun n ↦ (t ^ n) • (W n).subtype) ∘ₗ e.symm.toLinearMap

/-- **D1/rational-weight-criterion.** The weight cocharacter descends to `ℚ` (its rational values
preserve the rational structure `1 ⊗ V`) iff the real weight grading is the scalar extension of an
internal `ℚ`-grading. The full `h` need not descend. -/
theorem rationalWeightCriterion (W : ℤ → Submodule ℝ (ℝ ⊗[ℚ] V)) (hW : DirectSum.IsInternal W) :
    (∃ WQ : ℤ → Submodule ℚ V, DirectSum.IsInternal WQ ∧
        ∀ n, W n = Submodule.span ℝ (TensorProduct.mk ℚ ℝ V 1 '' (WQ n))) ↔
      ∀ (t : ℚ) (v : V), t ≠ 0 →
        weightOperator W hW (t : ℝ) (1 ⊗ₜ v) ∈ Set.range (TensorProduct.mk ℚ ℝ V 1) := by
  sorry

end RationalWeight

section MumfordTate

/-- The coordinate algebra of the complexified Deligne torus `S_ℂ = G_m × G_m`. -/
abbrev SplitTorusAlg := MonoidAlgebra ℂ (Multiplicative (ℤ × ℤ))

/-- The carrier of Tau Ceti's coordinate Hopf algebra of `GL_n` over `R`. -/
abbrev GLCoord (R : Type) [CommRing R] (n : ℕ) : Type :=
  (GeneralLinear.coordinateHopfAlgebra R n : Type)

/-- Scalar extension `O(GL_n)_ℚ → O(GL_n)_ℂ`, `f ↦ 1 ⊗ f` followed by Tau Ceti's base-change
identification. -/
def glBaseChange (n : ℕ) : GLCoord ℚ n →+* GLCoord ℂ n :=
  (GeneralLinear.coordinateRingBaseChangeAlgEquiv ℚ ℂ n).toRingEquiv.toRingHom.comp
    (Algebra.TensorProduct.includeRight (R := ℚ) (A := ℂ)).toRingHom

/-- A rational-coordinate map `φ` comes from an algebraic homomorphism `S_ℂ → GL_{n,ℂ}`: it is the
restriction to `O(GL_n)_ℚ` of a map of complex bialgebras. (The real structure of `S`, the Galois
swap, is not at the pins and is left out; the Mumford–Tate ideal does not depend on it.) -/
def IsAlgebraicSMap (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) : Prop :=
  ∃ ψ : GLCoord ℂ n →ₐc[ℂ] SplitTorusAlg, ∀ x, φ x = ψ (glBaseChange n x)

/-- The kernel of the coordinate map of `h` on `O(GL(V))`: the ideal of the `ℚ`-Zariski closure of
`h(S)`. It need not be a Hopf ideal (the closure of a torus can be a union of Galois-conjugate
tori), so it is not the Mumford–Tate ideal. -/
def hodgeKernelIdeal (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) : Ideal (GLCoord ℚ n) :=
  RingHom.ker φ

/-- **D1/mumford-tate-group.** The Mumford–Tate Hopf ideal: the largest Hopf ideal killed by the
coordinate map of `h`, the supremum of all such Hopf ideals. -/
def mumfordTateHopfIdeal (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) :
    TauCeti.HopfIdeal ℚ (GLCoord ℚ n) :=
  sSup {I | ∀ x ∈ I, φ x = 0}

/-- The ideal of `MT(V)` in `O(GL(V))`. -/
def mumfordTateIdeal (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) : Ideal (GLCoord ℚ n) :=
  (mumfordTateHopfIdeal n φ).toIdeal

/-- **D1/mumford-tate-group.** `MT(V) = Spec (O(GL(V)) / I_MT)` as a commutative Hopf algebra. -/
def mumfordTateGroup (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) : CommHopfAlgCat ℚ :=
  CommHopfAlgCat.of ℚ (GLCoord ℚ n ⧸ (mumfordTateHopfIdeal n φ).toIdeal)

theorem mumfordTateMinimal (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg)
    (I : TauCeti.HopfIdeal ℚ (GLCoord ℚ n)) (hI : ∀ x ∈ I, φ x = 0) :
    I.toIdeal ≤ mumfordTateIdeal n φ := by
  sorry

/-- `mumfordTateHopf`: `I_MT` is a Hopf ideal by construction and lies in the kernel of `h`. -/
theorem mumfordTateHopf (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) :
    mumfordTateIdeal n φ ≤ hodgeKernelIdeal n φ := by
  sorry

/-- The character `(a,b) ↦ −(a+b)` through which the weight `w(r) = (r⁻¹, r⁻¹)` acts. -/
def weightCharacter : Multiplicative (ℤ × ℤ) →* Multiplicative ℤ :=
  AddMonoidHom.toMultiplicative (-(AddMonoidHom.fst ℤ ℤ + AddMonoidHom.snd ℤ ℤ))

/-- The coordinate map of the weight `w(r) = (r⁻¹, r⁻¹)` of `S_ℂ`: `(a,b) ↦ −(a+b)`. -/
def weightCoordinate : SplitTorusAlg →ₐ[ℚ] MonoidAlgebra ℂ (Multiplicative ℤ) :=
  (MonoidAlgebra.mapDomainAlgHom ℂ ℂ weightCharacter).restrictScalars ℚ

theorem mumfordTateWeight (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) :
    ∃ χ : (GLCoord ℚ n ⧸ mumfordTateIdeal n φ) →ₐ[ℚ] MonoidAlgebra ℂ (Multiplicative ℤ),
      χ.comp (Ideal.Quotient.mkₐ ℚ (mumfordTateIdeal n φ)) = weightCoordinate.comp φ := by
  sorry

/-- `mumfordTateIsomorphism`: a change of coordinates induced by a `ℚ`-linear isomorphism
`V ≅ V′` is a Hopf algebra automorphism of `O(GL_n)`; it carries `I_MT` to `I′_MT`. -/
theorem mumfordTateIsomorphism (n : ℕ) (φ φ' : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg)
    (e : GLCoord ℚ n ≃ₐc[ℚ] GLCoord ℚ n) (he : φ'.comp e.toAlgEquiv.toAlgHom = φ) :
    (mumfordTateIdeal n φ).map e = mumfordTateIdeal n φ' := by
  sorry

/-- `mumfordTateComplexified`: the kernel of `h` is the contraction of the kernel of the
complexified split map; `I_MT` is the largest Hopf ideal inside it. -/
theorem mumfordTateComplexified (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg)
    (ψ : GLCoord ℂ n →ₐc[ℂ] SplitTorusAlg) (hψ : ∀ x, φ x = ψ (glBaseChange n x)) :
    hodgeKernelIdeal n φ = (RingHom.ker (ψ : GLCoord ℂ n →+* SplitTorusAlg)).comap (glBaseChange n) := by
  sorry

/-- **D1/mumford-tate-connected.** `MT(V)` is geometrically connected. -/
theorem mumfordTateConnected (n : ℕ) (φ : GLCoord ℚ n →ₐ[ℚ] SplitTorusAlg) (hφ : IsAlgebraicSMap n φ)
    (K : Type) [Field K] [Algebra ℚ K] :
    ConnectedSpace (PrimeSpectrum ((GLCoord ℚ n ⧸ mumfordTateIdeal n φ) ⊗[ℚ] K)) := by
  sorry

/-- The similitude ideal of `GSp_{2g} ⊂ GL_{2g}`: the `2 × 2` minors expressing that `X J Xᵀ` is a
scalar multiple of the standard alternating matrix `J`. -/
def gspIdeal (g : ℕ) : Ideal (GLCoord ℚ (g + g)) :=
  let X := GeneralLinear.genericMatrix ℚ (g + g)
  let J : Matrix (Fin (g + g)) (Fin (g + g)) (GLCoord ℚ (g + g)) := fun i j ↦
    if (i : ℕ) < g ∧ (j : ℕ) = i + g then 1 else if (j : ℕ) < g ∧ (i : ℕ) = j + g then -1 else 0
  let Y := X * J * X.transpose
  Ideal.span {x | ∃ i j k l, x = Y i j * J k l - Y k l * J i j}

/-- **D1/hodge-generic.** A polarized weight-one rational Hodge structure on `ℚ^{2g}` (the
`H¹(A,ℚ)` of AbelianSchemesAndArithmeticModuli §A5.2, in a symplectic basis) is Hodge generic when
its Mumford–Tate group is all of `GSp_{2g}`. -/
def hodgeGeneric (g : ℕ) (φ : GLCoord ℚ (g + g) →ₐ[ℚ] SplitTorusAlg) : Prop :=
  mumfordTateIdeal (g + g) φ = gspIdeal g

theorem hodgeGenericBasis (g : ℕ) (φ φ' : GLCoord ℚ (g + g) →ₐ[ℚ] SplitTorusAlg)
    (e : GLCoord ℚ (g + g) ≃ₐc[ℚ] GLCoord ℚ (g + g)) (he : φ'.comp e.toAlgEquiv.toAlgHom = φ)
    (hJ : (gspIdeal g).map e = gspIdeal g) :
    hodgeGeneric g φ ↔ hodgeGeneric g φ' := by
  sorry

theorem hodgeGenericIsogeny (g : ℕ) (φ φ' : GLCoord ℚ (g + g) →ₐ[ℚ] SplitTorusAlg)
    (e : GLCoord ℚ (g + g) ≃ₐc[ℚ] GLCoord ℚ (g + g)) (he : φ'.comp e.toAlgEquiv.toAlgHom = φ)
    (hJ : (gspIdeal g).map e = gspIdeal g) (hgen : hodgeGeneric g φ) : hodgeGeneric g φ' := by
  sorry

/-- The coordinate map of the weight-one Hodge structure of `ℂ/(ℤ + ℤτ)` in the basis `(1, τ)`:
`h(a + bi)` acts on `ℝ²` by multiplication by `a + bi` written in that basis, so with
`a = (z₁ + z₂)/2` and `b = (z₁ − z₂)/(2i)` its matrix entries are explicit elements of `ℂ[ℤ²]`. -/
def ellipticEntry (τ : ℂ) (i j : Fin 2) : SplitTorusAlg :=
  let z₁ : SplitTorusAlg := MonoidAlgebra.of ℂ _ (Multiplicative.ofAdd (1, 0))
  let z₂ : SplitTorusAlg := MonoidAlgebra.of ℂ _ (Multiplicative.ofAdd (0, 1))
  let a : SplitTorusAlg := (1 / 2 : ℂ) • (z₁ + z₂)
  let b : SplitTorusAlg := (1 / (2 * Complex.I)) • (z₁ - z₂)
  -- multiplication by a + bi on ℝ·1 ⊕ ℝ·τ, with τ = x + iy:
  -- (a+bi)·1 = (a - b x/y)·1 + (b/y)·τ,  (a+bi)·τ = -(b |τ|²/y)·1 + (a + b x/y)·τ
  let x : ℂ := τ.re
  let y : ℂ := τ.im
  ![![a - (x / y) • b, -((Complex.normSq τ : ℂ) / y) • b], ![(1 / y) • b, a + (x / y) • b]] i j

theorem hodgeGenericElliptic (τ : ℂ) (hτ : 0 < τ.im) (φ : GLCoord ℚ (0 + 1 + 1) →ₐ[ℚ] SplitTorusAlg)
    (hφ : ∀ i j, φ (GeneralLinear.genericMatrix ℚ (0 + 1 + 1) i j) = ellipticEntry τ i j) :
    hodgeGeneric 1 φ ↔ ∀ p q r : ℚ, (p : ℂ) * τ ^ 2 + q * τ + r = 0 → p = 0 ∧ q = 0 ∧ r = 0 := by
  sorry

end MumfordTate


/-! ## D3. Variations, the filtration parabolic, compact duals and Kostant combinatorics -/

section LocalModel

variable {E W : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
  [NormedAddCommGroup W] [NormedSpace ℂ W] [FiniteDimensional ℂ W]

/-- Local model of a holomorphic filtration of a flat bundle in a flat frame: over the open set
`U ⊆ E` every step `F^p` is locally spanned by finitely many holomorphic sections. -/
def IsHolomorphicFamily (U : Set E) (F : E → ℤ → Submodule ℂ W) : Prop :=
  ∀ p, ∀ x ∈ U, ∃ V ∈ nhds x, ∃ (k : ℕ) (s : Fin k → E → W),
    (∀ i, DifferentiableOn ℂ (s i) V) ∧ ∀ y ∈ V ∩ U, Submodule.span ℂ (Set.range fun i ↦ s i y) = F y p

/-- Griffiths transversality in a flat frame: derivatives of sections of `F^p` lie in `F^{p−1}`. -/
def IsGriffithsTransversal (U : Set E) (F : E → ℤ → Submodule ℂ W) : Prop :=
  ∀ (p : ℤ) (s : E → W), DifferentiableOn ℂ s U → (∀ y ∈ U, s y ∈ F y p) →
    ∀ y ∈ U, ∀ v : E, fderiv ℂ s y v ∈ F y (p - 1)

/-- **D3/flat-bundle-local.** In a flat frame over a connected open `U`, the flat connection is the
ordinary derivative, so transversality of a holomorphic family is the condition of
`IsGriffithsTransversal`; it is unchanged by a constant change of frame. -/
theorem flatBundleLocal (U : Set E) (hU : IsOpen U) (F : E → ℤ → Submodule ℂ W)
    (A : W ≃ₗ[ℂ] W) :
    IsGriffithsTransversal U F ↔ IsGriffithsTransversal U (fun y p ↦ (F y p).map A.toLinearMap) := by
  sorry

/-- **D3/transversality-tangent.** For a holomorphic family with constant fibre, Griffiths
transversality holds iff, at every point and in every direction, the derivative of every section of
`F^p` lies in `F^{p−1}` modulo `F^p`: the differential of the flag map lies in `F^{−1}End/F⁰End`. -/
theorem transversalityTangent (U : Set E) (hU : IsOpen U) (F : E → ℤ → Submodule ℂ W)
    (hF : IsHolomorphicFamily U F) :
    IsGriffithsTransversal U F ↔
      ∀ (p : ℤ) (s : E → W), DifferentiableOn ℂ s U → (∀ y ∈ U, s y ∈ F y p) →
        ∀ y ∈ U, ∀ v : E, Submodule.Quotient.mk (p := F y p) (fderiv ℂ s y v) ∈
          (F y (p - 1)).map (F y p).mkQ := by
  sorry

end LocalModel

section Variations

open CategoryTheory

/-- **D3/variation.** A pure real variation of Hodge structure of weight `n` over `B`: a real local
coefficient system (Tau Ceti's fundamental-groupoid functor) whose complexified fibres carry pure
Hodge structures of weight `n` for the canonical conjugation. Left out: the holomorphic structure of
the associated flat bundle and Griffiths transversality, which need holomorphic flat bundles over a
complex manifold (not at the pins); their local form is `IsHolomorphicFamily` and
`IsGriffithsTransversal`. -/
structure Variation (B : TopCat.{0}) (n : ℤ) where
  /-- The underlying local system. -/
  L : TauCeti.LocalCoefficientSystem.{0, 0, 0} ℝ B
  /-- The pure Hodge structure on each complexified fibre. -/
  fiber : ∀ b : FundamentalGroupoid B,
    TauCeti.Hodge.HodgeStructureOn (ℂ ⊗[ℝ] (L.obj b)) (TauCeti.Hodge.complexificationConjugation _) n

variable {B : TopCat.{0}} {n : ℤ}

/-- `variationFiber`: evaluation at a point is the fibre's pure Hodge structure. -/
def variationFiber (v : Variation B n) (b : FundamentalGroupoid B) :
    TauCeti.Hodge.HodgeStructureOn (ℂ ⊗[ℝ] (v.L.obj b)) (TauCeti.Hodge.complexificationConjugation _) n :=
  v.fiber b

/-- `variationMk`: assemble a variation from its local system and fibrewise Hodge structures. -/
def variationMk (L : TauCeti.LocalCoefficientSystem.{0, 0, 0} ℝ B)
    (fiber : ∀ b : FundamentalGroupoid B,
      TauCeti.Hodge.HodgeStructureOn (ℂ ⊗[ℝ] (L.obj b)) (TauCeti.Hodge.complexificationConjugation _) n) :
    Variation B n :=
  ⟨L, fiber⟩

theorem variationExt (v w : Variation B n) (hL : v.L = w.L) (hF : HEq v.fiber w.fiber) : v = w := by
  sorry

/-- `variationPullback`: pulling back along a continuous map pulls back the local system along the
induced functor of fundamental groupoids. -/
theorem variationPullback {B' : TopCat.{0}} (f : B' ⟶ B) (v : Variation B n) :
    ∃ v' : Variation B' n, v'.L = FundamentalGroupoid.map f.hom ⋙ v.L := by
  sorry

/-- **D3/variation-morphism.** A morphism of variations of the same weight: a map of local systems
whose complexification preserves every `F^p` on every fibre. (Compatibility with the flat
connection is automatic for a map of local systems.) -/
structure VariationHom (v w : Variation B n) where
  /-- The underlying map of local systems. -/
  hom : v.L ⟶ w.L
  /-- The complexified fibre maps preserve the Hodge filtrations. -/
  preserves : ∀ (b : FundamentalGroupoid B) (p : ℤ),
    ((v.fiber b).F p).map (LinearMap.baseChange ℂ (hom.app b).hom) ≤ (w.fiber b).F p

/-- `variationHomMk`. -/
def variationHomMk {v w : Variation B n} (θ : v.L ⟶ w.L)
    (h : ∀ (b : FundamentalGroupoid B) (p : ℤ),
      ((v.fiber b).F p).map (LinearMap.baseChange ℂ (θ.app b).hom) ≤ (w.fiber b).F p) :
    VariationHom v w :=
  ⟨θ, h⟩

theorem variationHomExt {v w : Variation B n} (f g : VariationHom v w) (h : f.hom = g.hom) : f = g := by
  sorry

/-- `variationHomIdentity`. -/
def variationHomIdentity (v : Variation B n) : VariationHom v v :=
  ⟨𝟙 v.L, fun _ _ ↦ by sorry⟩

/-- `variationMorphism`: composition. -/
def variationMorphism {u v w : Variation B n} (f : VariationHom u v) (g : VariationHom v w) :
    VariationHom u w :=
  ⟨f.hom ≫ g.hom, fun _ _ ↦ by sorry⟩

theorem variationHomCompMap {u v w : Variation B n} (f : VariationHom u v) (g : VariationHom v w) :
    (variationMorphism f g).hom = f.hom ≫ g.hom := rfl

/-- `variationHomKer`, fibrewise half: the kernel of the complexified fibre map of a morphism of
variations is a sub-Hodge structure (Tau Ceti's `IsMorphism.isSubstructure_ker`); the README states
that these kernels form a sub-local system and a subvariation. -/
theorem variationHomKer {v w : Variation B n} (f : VariationHom v w) (b : FundamentalGroupoid B) :
    (v.fiber b).IsSubstructure (LinearMap.ker (LinearMap.baseChange ℂ (f.hom.app b).hom)) := by
  sorry

/-- **D3/rational-polarized-variation.** A polarized rational variation: a rational local system
whose real scalar extension is the local system of a real variation, with a parallel family of
`ℚ`-bilinear forms of parity `(−1)^n`. Left out: the fibrewise Hodge–Riemann conditions for the
complexified form (stated in the README; Tau Ceti's `IsPolarization` is phrased for lattices). -/
structure RationalPolarizedVariation (B : TopCat.{0}) (n : ℤ) where
  /-- The rational local system. -/
  LQ : TauCeti.LocalCoefficientSystem.{0, 0, 0} ℚ B
  /-- The real variation. -/
  real : Variation B n
  /-- The scalar-extension comparison. -/
  comparison : LQ ⋙ ModuleCat.extendScalars (algebraMap ℚ ℝ) ≅ real.L
  /-- The polarizing form on each fibre. -/
  Q : ∀ b : FundamentalGroupoid B, LinearMap.BilinForm ℚ (LQ.obj b)
  /-- The form is parallel. -/
  parallel : ∀ {b c : FundamentalGroupoid B} (γ : b ⟶ c) (x y : LQ.obj b),
    Q c ((LQ.map γ).hom x) ((LQ.map γ).hom y) = Q b x y
  /-- Parity `(−1)^n`. -/
  parity : ∀ (b : FundamentalGroupoid B) (x y : LQ.obj b), Q b y x = (-1) ^ n.natAbs * Q b x y

/-- `rationalVariationMk`. -/
def rationalVariationMk (LQ : TauCeti.LocalCoefficientSystem.{0, 0, 0} ℚ B) (real : Variation B n)
    (comparison : LQ ⋙ ModuleCat.extendScalars (algebraMap ℚ ℝ) ≅ real.L)
    (Q : ∀ b : FundamentalGroupoid B, LinearMap.BilinForm ℚ (LQ.obj b))
    (parallel : ∀ {b c : FundamentalGroupoid B} (γ : b ⟶ c) (x y : LQ.obj b),
      Q c ((LQ.map γ).hom x) ((LQ.map γ).hom y) = Q b x y)
    (parity : ∀ (b : FundamentalGroupoid B) (x y : LQ.obj b), Q b y x = (-1) ^ n.natAbs * Q b x y) :
    RationalPolarizedVariation B n :=
  ⟨LQ, real, comparison, Q, parallel, parity⟩

theorem rationalVariationExt (P P' : RationalPolarizedVariation B n) (h₁ : P.LQ = P'.LQ)
    (h₂ : P.real = P'.real) (h₃ : HEq P.comparison P'.comparison) (h₄ : HEq P.Q P'.Q) : P = P' := by
  sorry

theorem rationalVariationParallel (P : RationalPolarizedVariation B n) {b c : FundamentalGroupoid B}
    (γ : b ⟶ c) (x y : P.LQ.obj b) :
    P.Q c ((P.LQ.map γ).hom x) ((P.LQ.map γ).hom y) = P.Q b x y :=
  P.parallel γ x y

/-- **D3/polarized-integral-variation.** A polarized integral variation: a locally constant
finite free `ℤ`-lattice whose rationalization is a polarized rational variation, with a parallel
`ℤ`-bilinear form inducing the rational one. The form need not be unimodular. -/
structure polarizedIntegralVariation (B : TopCat.{0}) (n : ℤ) where
  /-- The lattice local system. -/
  LZ : TauCeti.LocalCoefficientSystem.{0, 0, 0} ℤ B
  /-- Its fibres are finite free. -/
  free : ∀ b, Module.Free ℤ (LZ.obj b) ∧ Module.Finite ℤ (LZ.obj b)
  /-- The rational polarized variation. -/
  rational : RationalPolarizedVariation B n
  /-- The lattice inclusion into the rational fibre. -/
  ι : ∀ b : FundamentalGroupoid B, LZ.obj b →ₗ[ℤ] rational.LQ.obj b
  /-- Each fibre is a lattice: the rational fibre is its scalar extension. -/
  isLattice : ∀ b, IsBaseChange ℚ (ι b)
  /-- The inclusion is flat (commutes with transport). -/
  natural : ∀ {b c : FundamentalGroupoid B} (γ : b ⟶ c) (x : LZ.obj b),
    (rational.LQ.map γ).hom (ι b x) = ι c ((LZ.map γ).hom x)
  /-- The integral polarizing form. -/
  QZ : ∀ b : FundamentalGroupoid B, LinearMap.BilinForm ℤ (LZ.obj b)
  /-- It induces the rational form. -/
  compatible : ∀ (b : FundamentalGroupoid B) (x y : LZ.obj b), rational.Q b (ι b x) (ι b y) = QZ b x y

/-- `integralVariationRational`: the rationalization. -/
def integralVariationRational (P : polarizedIntegralVariation B n) : RationalPolarizedVariation B n :=
  P.rational

theorem integralVariationPairing (P : polarizedIntegralVariation B n) {b c : FundamentalGroupoid B}
    (γ : b ⟶ c) (x y : P.LZ.obj b) :
    P.QZ c ((P.LZ.map γ).hom x) ((P.LZ.map γ).hom y) = P.QZ b x y := by
  sorry

theorem integralVariationPullback {B' : TopCat.{0}} (f : B' ⟶ B) (P : polarizedIntegralVariation B n) :
    ∃ P' : polarizedIntegralVariation B' n, P'.LZ = FundamentalGroupoid.map f.hom ⋙ P.LZ := by
  sorry

/-- `integralVariationMk`. -/
def integralVariationMk (LZ : TauCeti.LocalCoefficientSystem.{0, 0, 0} ℤ B)
    (free : ∀ b, Module.Free ℤ (LZ.obj b) ∧ Module.Finite ℤ (LZ.obj b))
    (rational : RationalPolarizedVariation B n)
    (ι : ∀ b : FundamentalGroupoid B, LZ.obj b →ₗ[ℤ] rational.LQ.obj b)
    (isLattice : ∀ b, IsBaseChange ℚ (ι b))
    (natural : ∀ {b c : FundamentalGroupoid B} (γ : b ⟶ c) (x : LZ.obj b),
      (rational.LQ.map γ).hom (ι b x) = ι c ((LZ.map γ).hom x))
    (QZ : ∀ b : FundamentalGroupoid B, LinearMap.BilinForm ℤ (LZ.obj b))
    (compatible : ∀ (b : FundamentalGroupoid B) (x y : LZ.obj b),
      rational.Q b (ι b x) (ι b y) = QZ b x y) :
    polarizedIntegralVariation B n :=
  ⟨LZ, free, rational, ι, isLattice, natural, QZ, compatible⟩

theorem integralVariationExt (P P' : polarizedIntegralVariation B n) (h₁ : P.LZ = P'.LZ)
    (h₂ : P.rational = P'.rational) (h₃ : HEq P.ι P'.ι) (h₄ : HEq P.QZ P'.QZ) :
    P = P' := by
  sorry

end Variations

section FiltrationParabolic

variable {W : Type*} [AddCommGroup W] [Module ℂ W]

/-- **D3/filtration-parabolic.** The stabilizer of a filtration (of the Hodge filtration `F_h` in a
faithful representation) in `GL(W)`. -/
def filtrationParabolic (F : ℤ → Submodule ℂ W) : Subgroup (W ≃ₗ[ℂ] W) where
  carrier := {g | ∀ p, (F p).map g.toLinearMap = F p}
  mul_mem' := fun _ _ ↦ by sorry
  one_mem' := fun _ ↦ by sorry
  inv_mem' := fun _ ↦ by sorry

/-- The endomorphisms preserving every step: `F⁰ End(W)`, the Lie algebra of the filtration
parabolic. -/
def filtrationEndZero (F : ℤ → Submodule ℂ W) : Set (Module.End ℂ W) :=
  {A | ∀ p, F p ≤ (F p).comap A}

theorem filtrationParabolicLie (F : ℤ → Submodule ℂ W) (A : Module.End ℂ W) (hA : A ∈ filtrationEndZero F)
    (B : Module.End ℂ W) (hB : B ∈ filtrationEndZero F) :
    ⁅A, B⁆ ∈ filtrationEndZero F ∧ A + B ∈ filtrationEndZero F := by
  sorry

/-- `filtrationParabolicLevi`: if the filtration is split by a grading `W = ⊕ Wᵖ`,
`Fᵖ = ⊕_{q ≥ p} W^q` (the weights of `μ_h`), the automorphisms preserving every `Wᵖ` (the centralizer
of `μ_h`) lie in the filtration parabolic. -/
theorem filtrationParabolicLevi (Wg : ℤ → Submodule ℂ W) (hW : DirectSum.IsInternal Wg)
    (F : ℤ → Submodule ℂ W) (hF : ∀ p, F p = ⨆ q ≥ p, Wg q) (g : W ≃ₗ[ℂ] W)
    (hg : ∀ p, (Wg p).map g.toLinearMap = Wg p) :
    g ∈ filtrationParabolic F := by
  sorry

theorem filtrationParabolicConjugate (F : ℤ → Submodule ℂ W) (g : W ≃ₗ[ℂ] W) :
    filtrationParabolic (fun p ↦ (F p).map g.toLinearMap) =
      (filtrationParabolic F).map (MulAut.conj g).toMonoidHom := by
  sorry

end FiltrationParabolic

section CompactDual

/-- **D3/compact-dual.** On points, the compact dual is the homogeneous space `G/P_h`. Left out: its
structure of projective variety (ReductiveGroups layer 7) and complex manifold (LieGroups layer 8);
`compactDualTangent` is a README target. -/
abbrev compactDual (G : Type*) [Group G] (P : Subgroup G) : Type _ := G ⧸ P

theorem compactDualBasepoint {G : Type*} [Group G] (P : Subgroup G) :
    MulAction.stabilizer G ((1 : G) : compactDual G P) = P := by
  sorry

theorem compactDualChangePoint {G : Type*} [Group G] (P : Subgroup G) (g : G) :
    MulAction.stabilizer G ((g : G) : compactDual G P) = P.map (MulAut.conj g).toMonoidHom := by
  sorry

/-- The Lagrangian subspaces of `ℂ^{2g}` for the standard alternating form pairing `i` with `g+i`. -/
def IsLagrangian (g : ℕ) (L : Submodule ℂ (Fin (g + g) → ℂ)) : Prop :=
  Module.finrank ℂ L = g ∧
    ∀ x ∈ L, ∀ y ∈ L, ∑ i : Fin g, (x (Fin.castAdd g i) * y (Fin.natAdd g i) -
      x (Fin.natAdd g i) * y (Fin.castAdd g i)) = 0

end CompactDual

section Kostant

variable {B W : Type*} [Group W] {M : CoxeterMatrix B} (cs : CoxeterSystem M W)

/-- The standard parabolic subgroup `W_J` generated by the simple reflections in `J`. -/
def parabolicSubgroup (J : Set B) : Subgroup W := Subgroup.closure (cs.simple '' J)

/-- **D3/kostant-representatives.** `^J W`: the minimal-length representatives of the left cosets
`W_J \ W`. -/
def kostantRepresentatives (J : Set B) : Set W :=
  {w | ∀ u ∈ parabolicSubgroup cs J, cs.length w ≤ cs.length (u * w)}

theorem kostantUnique (J : Set B) (w : W) :
    ∃! v, v ∈ kostantRepresentatives cs J ∧ ∃ u ∈ parabolicSubgroup cs J, w = u * v := by
  sorry

/-- `kostantPositive`: in Coxeter terms `w⁻¹ α_s > 0` for the simple roots of the Levi is the absence
of left descents in `J`. -/
theorem kostantPositive (J : Set B) (w : W) :
    w ∈ kostantRepresentatives cs J ↔ ∀ j ∈ J, ¬ cs.IsLeftDescent w j := by
  sorry

theorem kostantLengthAdd (J : Set B) (u w : W) (hu : u ∈ parabolicSubgroup cs J)
    (hw : w ∈ kostantRepresentatives cs J) : cs.length (u * w) = cs.length u + cs.length w := by
  sorry

/-- **D3/kostant-involution.** With `w₀` longest in `W` and `w₀,J` longest in `W_J`,
`w ↦ w₀,J w w₀` preserves `^J W`, is an involution, and `ℓ(w₀,J w w₀) = ℓ(w₀) − ℓ(w₀,J) − ℓ(w)`. -/
theorem kostantInvolution (J : Set B) (w₀ w₀J : W) (h₀ : ∀ v, cs.length v ≤ cs.length w₀)
    (hJ : w₀J ∈ parabolicSubgroup cs J) (h₀J : ∀ v ∈ parabolicSubgroup cs J, cs.length v ≤ cs.length w₀J)
    (w : W) (hw : w ∈ kostantRepresentatives cs J) :
    w₀J * w * w₀ ∈ kostantRepresentatives cs J ∧ w₀J * (w₀J * w * w₀) * w₀ = w ∧
      cs.length (w₀J * w * w₀) + cs.length w + cs.length w₀J = cs.length w₀ := by
  sorry

end Kostant

section KostantCones

variable {ι R M N : Type*} [Finite ι] [Field R] [LinearOrder R] [IsStrictOrderedRing R]
  [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
  (P : RootPairing ι R M N) (b : P.Base)

/-- The dominant chamber of `X*(T) ⊗ R`. -/
def dominantChamber : Set M := {x | ∀ i ∈ b.support, 0 ≤ P.toLinearMap x (P.coroot i)}

/-- The Levi dominant chamber for the simple roots `J ⊆ b.support` of `M`. -/
def leviChamber (J : Set ι) : Set M := {x | ∀ i ∈ J, 0 ≤ P.toLinearMap x (P.coroot i)}

/-- `kostantKostantIndex` / root form of `^M W`: the Weyl elements `w` with `w⁻¹ α > 0` for every
simple root `α` of `M`; this is the index set `W^P` of ArithmeticLocallySymmetricSpaces §ALS.4.5. -/
def kostantKostantIndex [CharZero R] [P.IsCrystallographic] (J : Set ι) : Set P.weylGroup :=
  {w | ∀ i ∈ J, b.IsPos (P.weylGroupToPerm w⁻¹ i)}

/-- **D3/kostant-cone-criterion.** `w(X⁺) ⊆ X^{+,M}` iff `w⁻¹ Φ_M⁺ ⊆ Φ⁺`. -/
theorem kostantConeCriterion [CharZero R] [P.IsCrystallographic] (J : Set ι) (hJ : J ⊆ b.support)
    (w : P.weylGroup) :
    (∀ x ∈ dominantChamber P b, w • x ∈ leviChamber P J) ↔ w ∈ kostantKostantIndex P b J := by
  sorry

/-- **D3/kostant-cones.** `X^{+,M} = ⋃_{w ∈ ^M W} w X⁺`, boundary weights included. -/
theorem kostantCones [CharZero R] [P.IsCrystallographic] (J : Set ι) (hJ : J ⊆ b.support) :
    leviChamber P J = ⋃ w ∈ kostantKostantIndex P b J, (fun x ↦ w • x) '' dominantChamber P b := by
  sorry

end KostantCones


/-! ## D5. Hilbert data, Siegel and genus-two coordinates, adelic neatness -/

section HilbertData

/-- The domain `ℍ^±` of the `GL₂` datum: complex numbers off the real line. -/
abbrev upperLowerHalfPlanes : Type := {z : ℂ // z.im ≠ 0}

/-- **D5/hilbert-datum.** On points, the domain of the restriction-of-scalars Hilbert datum of a
totally real field of degree `d`: one copy of `ℍ^±` per real embedding. Left out: the datum
itself (ShimuraVarieties §P.1), its reflex field and its compact dual (`hilbertReflexDual`). -/
abbrev hilbertDatum (d : ℕ) : Type := Fin d → upperLowerHalfPlanes

/-- `hilbertDomain`: the domain has `2^d` connected components. -/
theorem hilbertDomain (d : ℕ) : Nat.card (ConnectedComponents (hilbertDatum d)) = 2 ^ d := by
  sorry

/-- The standard `GL₂` Hodge map `a + ib ↦ [[a, b], [−b, a]]` on real points. -/
def gl2HodgeMap (z : ℂ) : Matrix (Fin 2) (Fin 2) ℝ := !![z.re, z.im; -z.im, z.re]

/-- `hilbertDeterminantMap`: at each real embedding the determinant of the Hodge map is the norm
`z z̄`, so `Res(det)` carries the Hilbert datum to the norm torus datum. -/
theorem hilbertDeterminantMap (d : ℕ) (z : ℂ) :
    (fun _ : Fin d ↦ (gl2HodgeMap z).det) = fun _ ↦ Complex.normSq z := by
  sorry

/-- **D5/hilbert-star-datum.** The domain of the scalar-determinant datum `G*` (PELModuli §M5.4)
inside `hilbertDatum d`: the all-upper and all-lower tuples. -/
def hilbertStarDatum (d : ℕ) : Set (hilbertDatum d) :=
  {x | (∀ i, 0 < (x i).1.im) ∨ ∀ i, (x i).1.im < 0}

theorem hilbertStarPoints (d : ℕ) (g : Fin d → GL (Fin 2) ℝ) :
    (∃ t : ℝ, ∀ i, ((g i).det : ℝ) = t) ↔ ∀ i j, ((g i).det : ℝ) = (g j).det := by
  sorry

theorem hilbertStarDomain (d : ℕ) (hd : 0 < d) :
    Nat.card (ConnectedComponents (hilbertStarDatum d)) = 2 := by
  sorry

/-- `hilbertStarInclusion`: on real points the inclusion `G*(ℝ) → G(ℝ)` is injective and lands in
the tuples of common determinant. -/
theorem hilbertStarInclusion (d : ℕ) :
    Function.Injective (fun x : hilbertStarDatum d ↦ (x : hilbertDatum d)) := by
  sorry

end HilbertData

section SiegelCoordinates

/-- **D5/siegel-reflex-dual.** The Siegel cocharacter `z ↦ diag(z I_g, I_g)` is a symplectic
similitude with multiplier `z` for the form pairing `i` with `g + i`; it is defined over `ℚ`, so its
filtration parabolic stabilizes the Lagrangian of the first `g` vectors. Left out: the
identification of the compact dual with `LG(g,2g)` as a variety (README). -/
theorem siegelReflexDual (g : ℕ) {K : Type*} [Field K] (z : K) :
    let μ : Matrix (Fin (g + g)) (Fin (g + g)) K :=
      Matrix.diagonal fun i ↦ if (i : ℕ) < g then z else 1
    let J : Matrix (Fin (g + g)) (Fin (g + g)) K := fun i j ↦
      if (i : ℕ) < g ∧ (j : ℕ) = i + g then 1 else if (j : ℕ) < g ∧ (i : ℕ) = j + g then -1 else 0
    μ.transpose * J * μ = z • J := by
  sorry

/-- The positive roots of the Siegel Borel in BP coordinates `κ = (k₁,…,k_g)` (central coordinate
omitted): compact `e_i − e_j` (`i < j`) and noncompact `−e_i − e_j` (`i ≤ j`). -/
def siegelCompactRoots (g : ℕ) : Finset (Fin g → ℤ) :=
  ((Finset.univ : Finset (Fin g × Fin g)).filter fun p ↦ p.1 < p.2).image
    fun p ↦ Pi.single p.1 1 - Pi.single p.2 1

def siegelNoncompactRoots (g : ℕ) : Finset (Fin g → ℤ) :=
  ((Finset.univ : Finset (Fin g × Fin g)).filter fun p ↦ p.1 ≤ p.2).image
    fun p ↦ -Pi.single p.1 1 - Pi.single p.2 1

/-- **D5/siegel-root-convention.** `ρ_i = −i` and `ρ_{nc,i} = −(g+1)/2` (1-indexed), and the
`G`-dominant cone is `0 ≥ k₁ ≥ ⋯ ≥ k_g`. -/
theorem siegelRootConvention (g : ℕ) :
    ((1 / 2 : ℚ) • ∑ α ∈ siegelCompactRoots g ∪ siegelNoncompactRoots g, fun i ↦ (α i : ℚ)) =
        (fun i : Fin g ↦ -((i : ℚ) + 1)) ∧
      ((1 / 2 : ℚ) • ∑ α ∈ siegelNoncompactRoots g, fun i ↦ (α i : ℚ)) = fun _ ↦ -((g : ℚ) + 1) / 2 := by
  sorry

/-- The Siegel Weyl group: permutations of `Fin (2g)` commuting with `i ↦ 2g − 1 − i`. -/
def siegelWeyl (g : ℕ) : Subgroup (Equiv.Perm (Fin (2 * g))) where
  carrier := {σ | ∀ i, σ (Fin.rev i) = Fin.rev (σ i)}
  mul_mem' := fun _ _ ↦ by sorry
  one_mem' := fun _ ↦ by sorry
  inv_mem' := fun _ ↦ by sorry

/-- The cyclic order `g ≺ ⋯ ≺ 2g−1 ≺ 0 ≺ ⋯ ≺ g−1` (0-indexed). -/
def siegelCyclicKey (g : ℕ) (i : Fin (2 * g)) : ℕ := if g ≤ (i : ℕ) then i - g else i + g

/-- The minimal left representatives: `σ⁻¹(g) ≺ ⋯ ≺ σ⁻¹(2g−1)` in the cyclic order. -/
def siegelKostant (g : ℕ) : Set (Equiv.Perm (Fin (2 * g))) :=
  {σ | σ ∈ siegelWeyl g ∧ ∀ i j : Fin (2 * g), g ≤ (i : ℕ) → i < j →
      siegelCyclicKey g (σ⁻¹ i) < siegelCyclicKey g (σ⁻¹ j)}

/-- **D5/siegel-weyl-permutations.** There are `2^g` minimal representatives. -/
theorem siegelWeylPermutations (g : ℕ) : (siegelKostant g).ncard = 2 ^ g := by
  sorry

/-- **D5/kostant-sequence.** `a_i = #{j < i : g + j ∈ σ⁻¹{g, …, 2g−1}}` (0-indexed). -/
def kostantSequence (g : ℕ) (σ : Equiv.Perm (Fin (2 * g))) (i : Fin (g + 1)) : ℕ :=
  ((Finset.univ : Finset (Fin (2 * g))).filter fun k : Fin (2 * g) ↦
    g ≤ (k : ℕ) ∧ (k : ℕ) < g + i ∧ g ≤ (σ k : ℕ)).card

theorem kostantSequenceZero (g : ℕ) (σ : Equiv.Perm (Fin (2 * g))) : kostantSequence g σ 0 = 0 := by
  sorry

theorem kostantSequenceStep (g : ℕ) (σ : Equiv.Perm (Fin (2 * g))) (i : Fin g) :
    kostantSequence g σ i.succ = kostantSequence g σ i.castSucc +
      if g ≤ (σ ⟨g + i, by omega⟩ : ℕ) then 1 else 0 := by
  sorry

theorem kostantSequenceInjective (g : ℕ) :
    Set.InjOn (kostantSequence g) (siegelKostant g) := by
  sorry

end SiegelCoordinates

section GenusTwo

/-- CG coordinates `(a, b; c)` of `X*(T)` for `T = diag(t₁, t₂, ν t₂⁻¹, ν t₁⁻¹)`. -/
abbrev CGWeight : Type := ℤ × ℤ × ℤ

/-- `χ(diag(t₁,t₂,νt₂⁻¹,νt₁⁻¹)) = t₁^a t₂^b ν^c`. -/
def cgCharEval {K : Type*} [Field K] (χ : CGWeight) (t₁ t₂ ν : Kˣ) : Kˣ := t₁ ^ χ.1 * t₂ ^ χ.2.1 * ν ^ χ.2.2

/-- The positive roots `(1,−1;0), (0,2;−1), (1,1;−1), (2,0;−1)` and coroots
`(1,−1;0), (0,1;0), (1,1;0), (1,0;0)`, paired in order. -/
def cgRoots : Fin 4 → CGWeight := ![(1, -1, 0), (0, 2, -1), (1, 1, -1), (2, 0, -1)]
def cgCoroots : Fin 4 → CGWeight := ![(1, -1, 0), (0, 1, 0), (1, 1, 0), (1, 0, 0)]

/-- The dot pairing of weights with coweights. -/
def cgPair (χ μ : CGWeight) : ℤ := χ.1 * μ.1 + χ.2.1 * μ.2.1 + χ.2.2 * μ.2.2

/-- **D5/gsp4-cg-roots.** Each root pairs to `2` with its coroot, the simple Cartan matrix is that
of type `C₂`, `ρ = (2, 1; −3/2)`, and the parity conversion is `(a,b;c) ↦ (a,b;a+b+2c)`. -/
theorem gsp4CgRoots :
    (∀ i, cgPair (cgRoots i) (cgCoroots i) = 2) ∧ cgPair (cgRoots 0) (cgCoroots 1) = -1 ∧
      cgPair (cgRoots 1) (cgCoroots 0) = -2 ∧ (∑ i, cgRoots i) = (4, 2, -3) := by
  sorry

/-- The CG-to-Pilloni coordinate change `(a,b;c) ↦ (a,b;a+b+2c)`. -/
def cgToPilloni (χ : CGWeight) : CGWeight := (χ.1, χ.2.1, χ.1 + χ.2.1 + 2 * χ.2.2)

/-- The four Kostant actions `w̃₀,…,w̃₃` in CG coordinates. -/
def gsp4KostantAction : Fin 4 → CGWeight → CGWeight :=
  ![fun χ ↦ χ, fun χ ↦ (χ.1, -χ.2.1, χ.2.1 + χ.2.2), fun χ ↦ (χ.2.1, -χ.1, χ.1 + χ.2.2),
    fun χ ↦ (-χ.2.1, -χ.1, χ.1 + χ.2.1 + χ.2.2)]

/-- The longest Levi element `(a,b;c) ↦ (b,a;c)` and the longest Weyl element `(−a,−b;a+b+c)`. -/
def gsp4LeviLongest (χ : CGWeight) : CGWeight := (χ.2.1, χ.1, χ.2.2)
def gsp4FullLongest (χ : CGWeight) : CGWeight := (-χ.1, -χ.2.1, χ.1 + χ.2.1 + χ.2.2)

/-- **D5/gsp4-kostant.** `w ↦ w₀,M w w₀,G` sends `w̃_i` to `w̃_{3−i}`, and the Levi and full longest
elements differ. -/
theorem gsp4Kostant :
    (∀ i : Fin 4, gsp4LeviLongest ∘ gsp4KostantAction i ∘ gsp4FullLongest = gsp4KostantAction (Fin.rev i)) ∧
      gsp4LeviLongest ≠ gsp4FullLongest := by
  sorry

/-- The `G`-dominant cone `a ≥ b ≥ 0` in the real character space. -/
def gsp4Dominant : Set (ℚ × ℚ × ℚ) := {x | x.2.1 ≤ x.1 ∧ 0 ≤ x.2.1}

/-- The Kostant actions on the rational character space. -/
def gsp4KostantActionQ : Fin 4 → ℚ × ℚ × ℚ → ℚ × ℚ × ℚ :=
  ![fun x ↦ x, fun x ↦ (x.1, -x.2.1, x.2.1 + x.2.2), fun x ↦ (x.2.1, -x.1, x.1 + x.2.2),
    fun x ↦ (-x.2.1, -x.1, x.1 + x.2.1 + x.2.2)]

/-- The chamber `C_i = w̃_i C_G⁺`. -/
def gsp4Chamber (i : Fin 4) : Set (ℚ × ℚ × ℚ) := gsp4KostantActionQ i '' gsp4Dominant

/-- **D5/gsp4-cone-reversal.** `−w₀,M` sends `C_i` to `C_{3−i}`. -/
theorem gsp4ConeReversal (i : Fin 4) :
    (fun x : ℚ × ℚ × ℚ ↦ (-x.2.1, -x.1, -x.2.2)) '' gsp4Chamber i = gsp4Chamber (Fin.rev i) := by
  sorry

/-- The CG symplectic matrix `J = [[0, S], [−S, 0]]` with `S = [[0,1],[1,0]]`, in block form. -/
def cgS : Matrix (Fin 2) (Fin 2) ℝ := !![0, 1; 1, 0]
def cgJ : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℝ := Matrix.fromBlocks 0 cgS (-cgS) 0

/-- **D5/gsp4-centralizer.** For `g` a symplectic similitude, `g` centralizes `J = h(i)` iff
`gᵀ g = ν(g) I` with `ν(g) > 0`. -/
theorem gsp4Centralizer (g : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℝ) (ν : ℝ)
    (hg : g.transpose * cgJ * g = ν • cgJ) (hdet : IsUnit g.det) :
    g * cgJ = cgJ * g ↔ 0 < ν ∧ g.transpose * g = ν • 1 := by
  sorry

/-- `K_{∞,1} = Sp₄(ℝ) ∩ O(4)`: orthogonal matrices commuting with `J`. -/
def kInfinityOne : Set (Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℝ) :=
  {k | k.transpose * k = 1 ∧ k * cgJ = cgJ * k}

/-- **D5/gsp4-unitary.** `k = [[SAS, SB], [−BS, A]] ↦ A + iB` identifies `K_{∞,1}` with `U(2)`. -/
theorem gsp4Unitary :
    ∃ e : kInfinityOne ≃ Matrix.unitaryGroup (Fin 2) ℂ,
      ∀ k : kInfinityOne, (e k : Matrix (Fin 2) (Fin 2) ℂ) =
        (k.1.toBlocks₂₂).map (algebraMap ℝ ℂ) + Complex.I • (cgS * k.1.toBlocks₁₂).map (algebraMap ℝ ℂ) := by
  sorry

/-- **D5/gsp4-compact-cartan.** Characters `(a, b; c)` of the compact Cartan in angular/scalar
coordinates: those with `a + b ≡ c (mod 2)`. -/
def gsp4CompactCartan : AddSubgroup CGWeight where
  carrier := {χ | (χ.1 + χ.2.1 + χ.2.2) % 2 = 0}
  add_mem' := fun _ _ ↦ by sorry
  zero_mem' := by sorry
  neg_mem' := fun _ ↦ by sorry

theorem compactCartanRank :
    Function.Bijective (fun x : ℤ × ℤ × ℤ ↦ (⟨(x.1, x.2.1, x.1 + x.2.1 + 2 * x.2.2), by
        change (x.1 + x.2.1 + (x.1 + x.2.1 + 2 * x.2.2)) % 2 = 0; omega⟩ :
      gsp4CompactCartan)) := by
  sorry

theorem compactCartanParity (χ : CGWeight) : χ ∈ gsp4CompactCartan ↔ (χ.1 + χ.2.1 - χ.2.2) % 2 = 0 := by
  sorry

theorem compactCartanEmbedding (χ : CGWeight) :
    (-1 : ℂˣ) ^ χ.1 * (-1) ^ χ.2.1 * (-1) ^ χ.2.2 = 1 ↔ χ ∈ gsp4CompactCartan := by
  sorry

/-- **D5/gsp4-exp-kernel.** The kernel of `(t₁, t₂, z) ↦ [(e^{i t₁}, e^{i t₂}, e^{z})]` modulo
`(−1, −1, −1)`. -/
theorem gsp4ExpKernel (t₁ t₂ z : ℂ) :
    ((Complex.exp (t₁ * Complex.I) = 1 ∧ Complex.exp (t₂ * Complex.I) = 1 ∧ Complex.exp z = 1) ∨
      (Complex.exp (t₁ * Complex.I) = -1 ∧ Complex.exp (t₂ * Complex.I) = -1 ∧ Complex.exp z = -1)) ↔
    ∃ m n k : ℤ, (t₁ = 2 * Real.pi * m ∧ t₂ = 2 * Real.pi * n ∧ z = 2 * Real.pi * Complex.I * k) ∨
      (t₁ = Real.pi + 2 * Real.pi * m ∧ t₂ = Real.pi + 2 * Real.pi * n ∧
        z = Real.pi * Complex.I + 2 * Real.pi * Complex.I * k) := by
  sorry

/-- **D5/gsp4-cayley-basis.** The Cayley matrix `C = [[I, −iS], [−iS, I]]`. -/
def gsp4CayleyBasis : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℂ :=
  Matrix.fromBlocks 1 (-Complex.I • cgS.map (algebraMap ℝ ℂ)) (-Complex.I • cgS.map (algebraMap ℝ ℂ)) 1

theorem cayleyInverse :
    gsp4CayleyBasis * ((1 / 2 : ℂ) • Matrix.fromBlocks 1 (Complex.I • cgS.map (algebraMap ℝ ℂ))
      (Complex.I • cgS.map (algebraMap ℝ ℂ)) 1) = 1 := by
  sorry

theorem cayleyHodgeLines (j : Fin 2) :
    Matrix.mulVec (cgJ.map (algebraMap ℝ ℂ)) (fun i ↦ gsp4CayleyBasis i (Sum.inl j)) =
        (-Complex.I) • (fun i ↦ gsp4CayleyBasis i (Sum.inl j)) ∧
      Matrix.mulVec (cgJ.map (algebraMap ℝ ℂ)) (fun i ↦ gsp4CayleyBasis i (Sum.inr j)) =
        Complex.I • (fun i ↦ gsp4CayleyBasis i (Sum.inr j)) := by
  sorry

theorem cayleyConjugation (j : Fin 2) :
    (fun i ↦ star (gsp4CayleyBasis i (Sum.inl j))) = Complex.I • fun i ↦ gsp4CayleyBasis i (Sum.inr (Fin.rev j)) := by
  sorry

/-- **D5/gsp4-cayley-action.** `C⁻¹ k C = diag(SAS − iSBS, A + iB)` for `k = [[SAS, SB], [−BS, A]]`. -/
theorem gsp4CayleyAction (A B : Matrix (Fin 2) (Fin 2) ℝ) :
    let Sc := cgS.map (algebraMap ℝ ℂ)
    let Ac := A.map (algebraMap ℝ ℂ)
    let Bc := B.map (algebraMap ℝ ℂ)
    ((1 / 2 : ℂ) • Matrix.fromBlocks 1 (Complex.I • Sc) (Complex.I • Sc) 1) *
        (Matrix.fromBlocks (Sc * Ac * Sc) (Sc * Bc) (-(Bc * Sc)) Ac) * gsp4CayleyBasis =
      Matrix.fromBlocks (Sc * Ac * Sc - Complex.I • (Sc * Bc * Sc)) 0 0 (Ac + Complex.I • Bc) := by
  sorry

/-- The Cayley conversion of D5/gsp4-cayley-action: the CG split character `(a,b;c)` is the compact
character `(−a,−b;a+b+2c)`, because `C⁻¹ h(t₁,t₂;z) C = diag(z−it₁, z−it₂, z+it₂, z+it₁)`. -/
def cgToCompact (χ : CGWeight) : CGWeight := (-χ.1, -χ.2.1, χ.1 + χ.2.1 + 2 * χ.2.2)

/-- **D5/gsp4-cayley-action**, character clause. The lower-triangular roots (the negatives of
`cgRoots`) go to CG's positive roots `(1,−1;0), (0,2;0), (1,1;0), (2,0;0)`, whose half-sum is
`ρ_H = (2,1;0)`, and composing with `−1` on the angular coordinates gives `(a,b;c) ↦ (a,b;a+b+2c)`. -/
theorem gsp4CayleyCompactCoordinates :
    (Finset.univ.image fun i ↦ cgToCompact (-cgRoots i)) =
        ({(1, -1, 0), (0, 2, 0), (1, 1, 0), (2, 0, 0)} : Finset CGWeight) ∧
      (∑ i, cgToCompact (-cgRoots i)) = (4, 2, 0) ∧
      ∀ χ : CGWeight, ((-(cgToCompact χ).1, -(cgToCompact χ).2.1, (cgToCompact χ).2.2) : CGWeight) =
        cgToPilloni χ := by
  sorry

/-- **D5/gsp4-pilloni-convention.** Pilloni's lower-Borel positive roots `e₂−e₁, −2e₁+e₃,
−e₁−e₂+e₃, −2e₂+e₃` in parity coordinates are the negatives of the CG positive roots after
`(a,b;c) ↦ (a,b;a+b+2c)`, and `ρ = (−2, −1; 0)`. -/
theorem gsp4PilloniConvention :
    (Finset.univ.image fun i ↦ -cgToPilloni (cgRoots i)) =
        ({(-1, 1, 0), (-2, 0, 0), (-1, -1, 0), (0, -2, 0)} : Finset CGWeight) ∧
      (∑ i, -cgToPilloni (cgRoots i)) = (-4, -2, 0) := by
  sorry

end GenusTwo

section LocalNeatness

variable {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ))

/-- **D5/local-eigenvalue-bound.** With `v(ℓ) = 1`, a root `λ` of a monic quartic congruent to
`(X − 1)⁴` modulo `ℓ` (the characteristic polynomial of an element of `Iw₁(v)`, absolutely
unramified) satisfies `v(λ − 1) ≥ 1/4`. -/
theorem localEigenvalueBound (ℓ : ℕ) (hℓ : v (ℓ : K) = 1) (f : Polynomial K) (hf : f.Monic)
    (hdeg : f.natDegree = 4) (hint : ∀ i, 0 ≤ v (f.coeff i))
    (hcong : ∀ i, 1 ≤ v ((f - (Polynomial.X - 1) ^ 4).coeff i)) (lam : K) (hlam : f.eval lam = 0) :
    ((1 / 4 : ℚ) : WithTop ℚ) ≤ v (lam - 1) := by
  sorry

/-- **D5/local-products-bound.** The units within `v(x − 1) ≥ 1/4` form a subgroup. -/
theorem localProductsBound (S : Set Kˣ) (hS : ∀ u ∈ S, ((1 / 4 : ℚ) : WithTop ℚ) ≤ v ((u : K) - 1)) :
    ∀ x ∈ Subgroup.closure S, ((1 / 4 : ℚ) : WithTop ℚ) ≤ v ((x : K) - 1) := by
  sorry

/-- **D5/iwahori-neat**, local core. If the residue characteristic `ℓ > 5` (`v(ℓ) = 1`, every other
prime a unit), the group generated by the roots of such quartics is torsion free; with
AdelicAlgebraicGroups §4.3 and `adelicNeatRational` this gives the adelic and rational neatness of
every level whose components at all places above `ℓ` lie in `Iw₁`. -/
theorem iwahoriNeat (ℓ : ℕ) (hℓ5 : 5 < ℓ) (hℓ : v (ℓ : K) = 1)
    (hprime : ∀ p : ℕ, p.Prime → p ≠ ℓ → v (p : K) = 0) [CharZero K]
    (S : Set Kˣ) (hS : ∀ u ∈ S, ∃ f : Polynomial K, f.Monic ∧ f.natDegree = 4 ∧ (∀ i, 0 ≤ v (f.coeff i)) ∧
      (∀ i, 1 ≤ v ((f - (Polynomial.X - 1) ^ 4).coeff i)) ∧ f.eval (u : K) = 0) :
    ∀ x ∈ Subgroup.closure S, IsOfFinOrder x → x = 1 := by
  sorry

/-- The subgroup generated by the eigenvalues of a matrix (the roots of its characteristic
polynomial). -/
def eigenvalueGroup {n : Type*} [Fintype n] [DecidableEq n] (g : Matrix n n K) : Subgroup Kˣ :=
  Subgroup.closure {u | g.charpoly.eval (u : K) = 0}

end LocalNeatness

section AdelicNeat

variable {n : Type*} [Fintype n] [DecidableEq n]
  (Kℓ : Nat.Primes → Type) [∀ ℓ, Field (Kℓ ℓ)] (ι : ∀ ℓ, AlgebraicClosure ℚ →+* Kℓ ℓ)

/-- **D5/adelic-neat.** BCGP Definition 3.2.1: a family of local matrices `g_ℓ` (an adele in a
faithful representation, with algebraic closures `Kℓ` and compatible embeddings `ι`) is adelically
neat away from a set `Sg` of primes when no nontrivial root of unity of `ℚ̄` lies, for every `ℓ ∉ Sg`,
in the group generated by the eigenvalues of `g_ℓ`. -/
def adelicNeat (Sg : Set Nat.Primes) (g : ∀ ℓ, Matrix n n (Kℓ ℓ)) : Prop :=
  ∀ ζ : (AlgebraicClosure ℚ)ˣ, IsOfFinOrder ζ →
    (∀ ℓ ∉ Sg, Units.map (ι ℓ).toMonoidHom ζ ∈ eigenvalueGroup (g ℓ)) → ζ = 1

theorem adelicNeatRational (Sg : Set Nat.Primes) (γ : Matrix n n ℚ)
    (hγ : adelicNeat Kℓ ι Sg fun ℓ ↦ γ.map ((ι ℓ).comp (algebraMap ℚ (AlgebraicClosure ℚ)))) :
    ∀ ζ : (AlgebraicClosure ℚ)ˣ, IsOfFinOrder ζ →
      ζ ∈ eigenvalueGroup (γ.map (algebraMap ℚ (AlgebraicClosure ℚ))) → ζ = 1 := by
  sorry

theorem adelicNeatConjugate (Sg : Set Nat.Primes) (g h : ∀ ℓ, Matrix n n (Kℓ ℓ)) (hh : ∀ ℓ, IsUnit (h ℓ)) :
    adelicNeat Kℓ ι Sg (fun ℓ ↦ h ℓ * g ℓ * (h ℓ)⁻¹) ↔ adelicNeat Kℓ ι Sg g := by
  sorry

theorem primeToPNeatInsert (p : Nat.Primes) (g : ∀ ℓ, Matrix n n (Kℓ ℓ)) (gp : Matrix n n (Kℓ p))
    (hg : adelicNeat Kℓ ι {p} g) : adelicNeat Kℓ ι {p} (Function.update g p gp) := by
  sorry

end AdelicNeat


/-! Unit tests for D3. -/
section D3Tests

open CategoryTheory

/-- `variationConstant`: a constant decreasing filtration is holomorphic and transversal. -/
example {E W : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (U : Set E) (hU : IsOpen U) (F₀ : ℤ → Submodule ℂ W) (hF : Antitone F₀) :
    IsHolomorphicFamily U (fun _ ↦ F₀) ∧ IsGriffithsTransversal U (fun _ ↦ F₀) := by
  sorry

/-- The weight-one elliptic family over `ℍ`: `F¹(τ) = ℂ·(τ, 1)`, `F⁰ = ℂ²`, `F² = 0`. -/
def ellipticFiltration (τ : ℂ) (p : ℤ) : Submodule ℂ (Fin 2 → ℂ) :=
  if p ≤ 0 then ⊤ else if p = 1 then Submodule.span ℂ {![τ, 1]} else ⊥

/-- `variationElliptic`. -/
example : IsHolomorphicFamily {τ : ℂ | 0 < τ.im} ellipticFiltration ∧
    IsGriffithsTransversal {τ : ℂ | 0 < τ.im} ellipticFiltration := by
  sorry

/-- The non-horizontal weight-three family: `F³(z) = ℂ(e₀ + z e₃)`, `F²(z) = F³(z) + ℂ e₁`,
`F¹(z) = F³(z)^⊥` for `Q(e₀,e₃) = i`, `Q(e₁,e₂) = −i`. -/
def nonHorizontalFiltration (z : ℂ) (p : ℤ) : Submodule ℂ (Fin 4 → ℂ) :=
  if p ≤ 0 then ⊤
  else if p = 1 then LinearMap.ker
    ((LinearMap.proj (R := ℂ) (φ := fun _ : Fin 4 ↦ ℂ) 3) - z • LinearMap.proj (R := ℂ) (φ := fun _ : Fin 4 ↦ ℂ) 0)
  else if p = 2 then Submodule.span ℂ {![1, 0, 0, z], ![0, 1, 0, 0]}
  else if p = 3 then Submodule.span ℂ {![1, 0, 0, z]} else ⊥

/-- `variationNonHorizontal`: `dF³(0) = e₃` is not in `F²(0)`, so this is not a variation. -/
example : ¬ IsGriffithsTransversal (Metric.ball (0 : ℂ) 1) nonHorizontalFiltration := by
  sorry

variable {B : TopCat.{0}} {n : ℤ}

/-- `variationHomIdentity`. -/
example (v : Variation B n) : (variationHomIdentity v).hom = 𝟙 v.L := rfl

/-- `variationHomZero`. -/
example (v w : Variation B n) : ∃ f : VariationHom v w, f.hom = 0 := by
  sorry

/-- `variationHomReject`. -/
example (v w : Variation B n) (θ : v.L ⟶ w.L) (b : FundamentalGroupoid B) (p : ℤ)
    (x : ℂ ⊗[ℝ] v.L.obj b) (hx : x ∈ (v.fiber b).F p)
    (hθ : LinearMap.baseChange ℂ (θ.app b).hom x ∉ (w.fiber b).F p) :
    ¬ ∃ f : VariationHom v w, f.hom = θ := by
  sorry

/-- `rationalTate`: rationalization keeps the integral form. -/
example (P : polarizedIntegralVariation B (-2)) (b : FundamentalGroupoid B) (x y : P.LZ.obj b) :
    (integralVariationRational P).Q b (P.ι b x) (P.ι b y) = P.QZ b x y :=
  P.compatible b x y

/-- `rationalScaled`: twice a polarizing form is again parallel of the same parity. -/
example (P : RationalPolarizedVariation B n) :
    ∃ P' : RationalPolarizedVariation B n, P'.LQ = P.LQ ∧ P'.real = P.real ∧ HEq P'.Q (fun b ↦ 2 • P.Q b) := by
  sorry

/-- `rationalNegativeFalse`: on a nonzero pure piece the negative of a polarization violates the
second Hodge–Riemann relation (Tau Ceti's `IsPolarization`). -/
example {V Vℂ : Type} [AddCommGroup V] [AddCommGroup Vℂ] [Module ℂ Vℂ] {ιℂ : V →ₗ[ℤ] Vℂ}
    (hℂ : IsBaseChange ℂ ιℂ) {m : ℤ} (hs : TauCeti.Hodge.HodgeStructure hℂ m) (Q : LinearMap.BilinForm ℤ V)
    (hQ : TauCeti.Hodge.IsPolarization hℂ hs Q) (p : ℤ) (x : Vℂ) (hx : x ∈ hs.piece p) (hx0 : x ≠ 0) :
    ¬ TauCeti.Hodge.IsPolarization hℂ hs (-Q) := by
  sorry

/-- `integralConstantTate`: a rank-one polarized integral variation of weight `−2` exists. -/
example (b : FundamentalGroupoid B) :
    ∃ P : polarizedIntegralVariation B (-2), Module.finrank ℤ (P.LZ.obj b) = 1 := by
  sorry

/-- `integralScaledPairing`: doubling the lattice form gives a polarized integral variation. -/
example (P : polarizedIntegralVariation B n) :
    ∃ P' : polarizedIntegralVariation B n, P'.LZ = P.LZ ∧ HEq P'.QZ (fun b ↦ 2 • P.QZ b) := by
  sorry

/-- `integralMonodromy`: around a cusp (the punctured plane) the elliptic variation has nontrivial
integral monodromy. -/
example : ∃ (P : polarizedIntegralVariation (TopCat.of {z : ℂ // z ≠ 0}) 1)
    (b : FundamentalGroupoid (TopCat.of {z : ℂ // z ≠ 0})) (γ : b ⟶ b), P.LZ.map γ ≠ 𝟙 _ := by
  sorry

/-- The filtration `F⁰ = W ⊇ F¹ = L ⊇ F² = 0` of a weight-one structure. -/
def lineFiltration {W : Type*} [AddCommGroup W] [Module ℂ W] (L : Submodule ℂ W) (p : ℤ) : Submodule ℂ W :=
  if p ≤ 0 then ⊤ else if p = 1 then L else ⊥

/-- `parabolicGl2`: for `GL₂` the filtration parabolic is the stabilizer of the line `F¹`
(a Borel subgroup). -/
example (L : Submodule ℂ (Fin 2 → ℂ)) (hL : Module.finrank ℂ L = 1) :
    (filtrationParabolic (lineFiltration L) : Set ((Fin 2 → ℂ) ≃ₗ[ℂ] (Fin 2 → ℂ))) =
      {g | L.map g.toLinearMap = L} := by
  sorry

/-- `parabolicTorus`: the trivial filtration of weight zero has stabilizer all of `GL(W)`. -/
example {W : Type*} [AddCommGroup W] [Module ℂ W] :
    filtrationParabolic (fun p : ℤ ↦ if p ≤ 0 then (⊤ : Submodule ℂ W) else ⊥) = ⊤ := by
  sorry

/-- `parabolicSiegel`: for a Lagrangian `F¹ = L` the filtration parabolic is the stabilizer of `L`. -/
example (g : ℕ) (L : Submodule ℂ (Fin (g + g) → ℂ)) (hL : IsLagrangian g L) :
    (filtrationParabolic (lineFiltration L) : Set ((Fin (g + g) → ℂ) ≃ₗ[ℂ] (Fin (g + g) → ℂ))) =
      {k | L.map k.toLinearMap = L} := by
  sorry

/-- `dualGl2`: `GL₂(ℂ)/B ≅ ℙ¹(ℂ)`. -/
example (L : Submodule ℂ (Fin 2 → ℂ)) (hL : Module.finrank ℂ L = 1) :
    Nonempty (compactDual ((Fin 2 → ℂ) ≃ₗ[ℂ] (Fin 2 → ℂ)) (filtrationParabolic (lineFiltration L)) ≃
      Projectivization ℂ (Fin 2 → ℂ)) := by
  sorry

/-- `dualUnitary`: for a unitary datum of signature `(p, q)` the compact dual is the Grassmannian of
`p`-planes in `ℂ^{p+q}` (here as `GL_{p+q}(ℂ)` modulo the stabilizer of a `p`-plane). -/
example (p q : ℕ) (L : Submodule ℂ (Fin (p + q) → ℂ)) (hL : Module.finrank ℂ L = p) :
    Nonempty (compactDual ((Fin (p + q) → ℂ) ≃ₗ[ℂ] (Fin (p + q) → ℂ)) (filtrationParabolic (lineFiltration L)) ≃
      {L' : Submodule ℂ (Fin (p + q) → ℂ) // Module.finrank ℂ L' = p}) := by
  sorry

/-- `variationKerZero`: the kernel of the identity morphism is zero on every fibre. -/
example {B : TopCat.{0}} {n : ℤ} (v : Variation B n) (b : FundamentalGroupoid B) :
    LinearMap.ker (LinearMap.baseChange ℂ ((variationHomIdentity v).hom.app b).hom) = ⊥ := by
  sorry

/-- `dualTorus`: the compact dual of a torus datum is a point. -/
example (G : Type*) [Group G] : Subsingleton (compactDual G ⊤) := by
  sorry

/-- `dualSiegel`: the Siegel compact dual is the space of Lagrangians (in `GL_{2g}(ℂ)`, restricted
to the symplectic group; its dimension `g(g+1)/2` is a README statement). -/
example (g : ℕ) (L₀ : Submodule ℂ (Fin (g + g) → ℂ)) (hL₀ : IsLagrangian g L₀)
    (Sp : Subgroup ((Fin (g + g) → ℂ) ≃ₗ[ℂ] (Fin (g + g) → ℂ)))
    (hSp : ∀ k ∈ Sp, ∀ L, IsLagrangian g L → IsLagrangian g (L.map k.toLinearMap)) :
    Nonempty (compactDual Sp ((filtrationParabolic (lineFiltration L₀)).subgroupOf Sp) ≃
      {L : Submodule ℂ (Fin (g + g) → ℂ) // IsLagrangian g L}) := by
  sorry

/-- `kostantBorel`: for `J = ∅`, every element is a minimal representative. -/
example {B W : Type*} [Group W] {M : CoxeterMatrix B} (cs : CoxeterSystem M W) :
    kostantRepresentatives cs ∅ = Set.univ := by
  sorry

/-- `kostantWholeGroup`: if `W_J = W`, only the identity is minimal. -/
example {B W : Type*} [Group W] {M : CoxeterMatrix B} (cs : CoxeterSystem M W) (J : Set B)
    (hJ : parabolicSubgroup cs J = ⊤) : kostantRepresentatives cs J = {1} := by
  sorry

/-- `kostantA2Left`: in type `A₂` with `W_M = ⟨s₁⟩` (Mathlib's index `0`), the minimal left
representatives are `1, s₂, s₂ s₁`. -/
example : kostantRepresentatives (CoxeterMatrix.A 2).toCoxeterSystem {0} =
    {1, (CoxeterMatrix.A 2).toCoxeterSystem.simple 1,
      (CoxeterMatrix.A 2).toCoxeterSystem.simple 1 * (CoxeterMatrix.A 2).toCoxeterSystem.simple 0} := by
  sorry

/-- `kostantTypeA`: for `GL_{p+q}` with Levi `GL_p × GL_q` (all simple reflections except the
`p`-th), there are `C(p+q, p)` minimal left representatives. -/
example (p q : ℕ) (hp : 0 < p) (hq : 0 < q) :
    (kostantRepresentatives (CoxeterMatrix.A (p + q - 1)).toCoxeterSystem
      {j : Fin (p + q - 1) | (j : ℕ) ≠ p - 1}).ncard = Nat.choose (p + q) p := by
  sorry

end D3Tests

/-! Unit tests for D5. -/
section D5Tests

/-- `hilbertRational`: for `F = ℚ` the domain is `ℍ^±`. -/
example : Nonempty (hilbertDatum 1 ≃ upperLowerHalfPlanes) := ⟨Equiv.funUnique (Fin 1) _⟩

/-- `hilbertQuadratic`: for a real quadratic field the domain has four components. -/
example : Nat.card (ConnectedComponents (hilbertDatum 2)) = 4 := by
  sorry

/-- `hilbertNonHodge`: at the two real embeddings of `ℚ(√2)` the image of `diag(√2, 1)` has
determinants `√2` and `−√2`, so no common similitude factor exists and the standard trace
representation of `Res_{F/ℚ} GL₂` does not land in a rational `GSp`. -/
example : (!![Real.sqrt 2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ).det ≠
    (!![-Real.sqrt 2, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ).det := by
  sorry

/-- `starRational`: for `F = ℚ` the scalar-determinant domain is all of `ℍ^±`. -/
example : hilbertStarDatum 1 = Set.univ := by
  sorry

/-- `starQuadratic`: for a real quadratic field the scalar-determinant domain has two components. -/
example : Nat.card (ConnectedComponents (hilbertStarDatum 2)) = 2 := by
  sorry

/-- `starMixedSignFalse`: a tuple with determinants of opposite signs is not in `G*(ℝ)`. -/
example : ¬ ∃ t : ℝ, ∀ i : Fin 2, (![(1 : ℝ), -1] i) = t := by
  sorry

/-- `sequenceGenusOne`. -/
example : kostantSequence 1 '' siegelKostant 1 = {![0, 0], ![0, 1]} := by
  sorry

/-- `sequenceGenusTwo`. -/
example : kostantSequence 2 '' siegelKostant 2 = {![0, 0, 0], ![0, 0, 1], ![0, 1, 1], ![0, 1, 2]} := by
  sorry

/-- `sequenceStepFalse`. -/
example : ![0, 0, 2] ∉ kostantSequence 2 '' siegelKostant 2 := by
  sorry

/-- `cartanParityTrue`. -/
example : ((1, 0, 1) : CGWeight) ∈ gsp4CompactCartan ∧ ((0, 1, 1) : CGWeight) ∈ gsp4CompactCartan ∧
    ((0, 0, 2) : CGWeight) ∈ gsp4CompactCartan := by
  sorry

/-- `cartanParityFalse`. -/
example : ((1, 0, 0) : CGWeight) ∉ gsp4CompactCartan := by
  sorry

/-- `cartanRank`: `(a, b, k) ↦ (a, b; a + b + 2k)` hits every lattice point. -/
example (χ : CGWeight) (hχ : χ ∈ gsp4CompactCartan) :
    ∃ x : ℤ × ℤ × ℤ, ((x.1, x.2.1, x.1 + x.2.1 + 2 * x.2.2) : CGWeight) = χ := by
  sorry

/-- `cayleyProduct`. -/
example : gsp4CayleyBasis * ((1 / 2 : ℂ) • Matrix.fromBlocks 1 (Complex.I • cgS.map (algebraMap ℝ ℂ))
    (Complex.I • cgS.map (algebraMap ℝ ℂ)) 1) = 1 := cayleyInverse

/-- `cayleyColumn`: the first column is `e₁ − i e₄`. -/
example : (fun i ↦ gsp4CayleyBasis i (Sum.inl 0)) =
    Pi.single (Sum.inl 0) 1 - Complex.I • Pi.single (Sum.inr 1) 1 := by
  sorry

/-- `cayleyWrongSign`: flipping the sign of one off-diagonal block makes the matrix singular. -/
example : (Matrix.fromBlocks (1 : Matrix (Fin 2) (Fin 2) ℂ) (-Complex.I • cgS.map (algebraMap ℝ ℂ))
    (Complex.I • cgS.map (algebraMap ℝ ℂ)) 1).det = 0 := by
  sorry

variable {n : Type*} [Fintype n] [DecidableEq n]
  (Kℓ : Nat.Primes → Type) [∀ ℓ, Field (Kℓ ℓ)] (ι : ∀ ℓ, AlgebraicClosure ℚ →+* Kℓ ℓ)

/-- `adelicIdentity`. -/
example : adelicNeat Kℓ ι ∅ (fun _ ↦ (1 : Matrix n n _)) := by
  sorry

/-- `adelicRationalMinusOne`: the scalar `−1` (in positive dimension) is not adelically neat. -/
example [Nonempty n] (hι : ∀ ℓ, Function.Injective (ι ℓ)) :
    ¬ adelicNeat Kℓ ι ∅ (fun _ ↦ (-1 : Matrix n n _)) := by
  sorry

/-- `primeToPInsert`. -/
example (p : Nat.Primes) (g : ∀ ℓ, Matrix n n (Kℓ ℓ)) (hg : adelicNeat Kℓ ι {p} g) (gp : Matrix n n (Kℓ p)) :
    adelicNeat Kℓ ι {p} (Function.update g p gp) :=
  primeToPNeatInsert Kℓ ι p g gp hg

end D5Tests

namespace tests

open TauCeti.Shimura

/-- `mtTrivial`: the trivial action on `ℚ`. -/
example (φ : GLCoord ℚ 1 →ₐ[ℚ] SplitTorusAlg) (hφ : φ (GeneralLinear.genericMatrix ℚ 1 0 0) = 1) :
    mumfordTateIdeal 1 φ = Ideal.span {GeneralLinear.genericMatrix ℚ 1 0 0 - 1} := by
  sorry

/-- `mtTate`: `ℚ(1)`, of type `(−1,−1)`, where the coordinate goes to `z₁ z₂`. -/
example (φ : GLCoord ℚ 1 →ₐ[ℚ] SplitTorusAlg)
    (hφ : φ (GeneralLinear.genericMatrix ℚ 1 0 0) = MonoidAlgebra.of ℂ _ (Multiplicative.ofAdd (1, 1))) :
    mumfordTateIdeal 1 φ = ⊥ := by
  sorry

/-- `mtCmElliptic`: `H₁(ℂ/ℤ[i], ℚ)` in the basis `(1, i)`. -/
example (φ : GLCoord ℚ 2 →ₐ[ℚ] SplitTorusAlg)
    (hφ : ∀ i j, φ (GeneralLinear.genericMatrix ℚ 2 i j) = ellipticEntry Complex.I i j) :
    GeneralLinear.genericMatrix ℚ 2 0 0 - GeneralLinear.genericMatrix ℚ 2 1 1 ∈ mumfordTateIdeal 2 φ ∧
      GeneralLinear.genericMatrix ℚ 2 0 1 + GeneralLinear.genericMatrix ℚ 2 1 0 ∈ mumfordTateIdeal 2 φ ∧
      mumfordTateIdeal 2 φ ≠ ⊥ := by
  sorry

/-- `mtKernelNotHopf`: the kernel of `h` need not be a Hopf ideal. For `V = ℚ(ζ₅)` (so `n = 4`) with
`h` acting through one complex place by `z/z̄` and trivially through the other, the kernel cuts out
two Galois-conjugate one-dimensional tori, while `MT(V)` is the two-dimensional norm-one torus of
`ℚ(ζ₅)/ℚ(√5)`; so the Mumford–Tate ideal is strictly smaller than the kernel. -/
example : ∃ φ : GLCoord ℚ 4 →ₐ[ℚ] SplitTorusAlg, IsAlgebraicSMap 4 φ ∧
    mumfordTateIdeal 4 φ ≠ hodgeKernelIdeal 4 φ := by
  sorry

/-- `genericCmFalse`: `τ = i` is not Hodge generic. -/
example (φ : GLCoord ℚ (1 + 1) →ₐ[ℚ] SplitTorusAlg)
    (hφ : ∀ i j, φ (GeneralLinear.genericMatrix ℚ (1 + 1) i j) = ellipticEntry Complex.I i j) :
    ¬ hodgeGeneric 1 φ := by
  sorry

/-- `genericNonCmElliptic`: a transcendental `τ` in the upper half-plane is Hodge generic. -/
example (τ : ℂ) (hτ : 0 < τ.im) (htr : Transcendental ℚ τ) (φ : GLCoord ℚ (1 + 1) →ₐ[ℚ] SplitTorusAlg)
    (hφ : ∀ i j, φ (GeneralLinear.genericMatrix ℚ (1 + 1) i j) = ellipticEntry τ i j) :
    hodgeGeneric 1 φ := by
  sorry

/-- `genericProductFalse`: `E_i × E_i` with the product polarization is not Hodge generic in
genus two. In the symplectic basis `(e₁, e₂, f₁, f₂)` the first factor occupies the indices
`0, 2` and the second `1, 3`; both carry the `τ = i` matrices. -/
example (φ : GLCoord ℚ (2 + 2) →ₐ[ℚ] SplitTorusAlg)
    (hφ : ∀ (k : Fin 2) (i j : Fin 2),
      φ (GeneralLinear.genericMatrix ℚ (2 + 2) (![![0, 2], ![1, 3]] k i) (![![0, 2], ![1, 3]] k j)) =
        ellipticEntry Complex.I i j) :
    ¬ hodgeGeneric 2 φ := by
  sorry

end tests


/-! ## README-only targets

The following packet names have no carrier at the pins (a pure Shimura datum is ShimuraVarieties
§P.1's `TauCeti.Shimura.PureDatum`, a README target of an open pull request; flag schemes over `ℤ`
and their Schubert closures, the parabolic-type scheme over the reflex field and holomorphic flat
bundles are not in Mathlib or Tau Ceti at the pins). They are specified in
`research/blueprint/readmes/ShimuraData.md`, layer by layer, with these intended Lean forms.

D1.
* `mumfordTateReductive` — for a polarizable rational Hodge structure, the Hopf algebra
  `mumfordTateGroup n φ`, bundled as a `FiniteTypeCommHopfAlgCat ℚ` object, satisfies Tau Ceti's
  `reductiveCommHopfAlgProperty ℚ`. Polarizability needs the real structure of `S`.

D2.
* `uniqueComplexStructure` — for a pure datum `(G, X)` and two complex-manifold structures on `X`
  for which the filtration map of one faithful representation is holomorphic, the identity is
  biholomorphic.

D3.
* `variationFilteredFlatBundle`, `variationGriffiths`, `variationHodgeBundles` — the holomorphic
  flat bundle `L ⊗ O_B` with its connection (ComplexKahlerGeometry §K4, not at the pins), the
  filtration by holomorphic subbundles, `∇F^p ⊆ F^{p−1} ⊗ Ω¹`, and the real-analytic Hodge bundles.
* `variationSub`, `variationDirectSum` — subvariations from sub-local systems with sub-Hodge fibres
  (Tau Ceti's `IsSubstructure.hodgeStructure`), and direct sums; tests `variationSubRationalLine`.
* `rationalVariationOrthogonal` — `L = W ⊕ W^⊥` for a subvariation of a polarized rational
  variation (fibrewise Tau Ceti's `RationalHodgeSubstructure.isCompl_orthogonal`); test
  `rationalOrthogonalSum`.
* `compactDualTangent` — the tangent space of `G_ℂ/P_h` at the base point is `g_ℂ/F⁰g_ℂ`.
* `compactDualBorelEmbedding` — the Borel embedding of ShimuraVarieties §P.3 lands in `G_ℂ/P_h` and
  is a `G(ℝ)`-equivariant holomorphic open embedding, independent of the faithful representation.
* `reflexFlagDescent` — the projective `E(G,X)`-scheme `Par_t(G_E)` with complex fibre `X^∨` and
  `G_L/P` over any `L` with an `L`-rational parabolic of type `t`.
* `bruhatIntegral` — for a pinned split reductive `ℤ`-group and standard `P`, the cells
  `C_w = P\PwB ≅ 𝔸^{ℓ(w)}_ℤ`, `w ∈ ^MW`, stratify `P\G` compatibly with base change.
* `schubertFamilies` — `X_w`, `X^w`, `Y_w` on `P\G`, with API `schubertClosure`,
  `oppositeSchubertClosure`, `schubertUpperOpen` and tests `schubertRankOne`,
  `schubertOppositeRankOne`, `schubertTrivialFlag` (rank one: `X₁` a point, `X_s = ℙ¹`, `Y_s` affine;
  `X^s ⊂ Y_s`; for `P = G` all loci are the point).
* `bruhatClosureOrder` — `C_v ⊂ X_w` iff `v ≤ w`, fibrewise.
* `oppositeIntersection` — `X^w ∩ X_v ≠ ∅` iff `w ≤ v` over every algebraically closed field.
* `oppositeInsideUpper` — `X^w ⊂ Y_w` as a closed subscheme, over `ℤ`, `ℤ_p` and `𝔽_p`.

D4 (all on ShimuraVarieties §P.1's pure datum).
* `PureDatum.AdditionalAxioms` — the predicates SV2*, SV4, SV5, SV6; API `sv2Star_indep`,
  `sv2Star_sv2`, `sv4_rationalHodge`, `additionalAxioms_iso`, `additionalAxioms_prod` (SV4–SV6 for a
  product iff for both factors; SV2* only from the product to the factors); tests `additionalGl2`,
  `additionalHilbertSV5`, `additionalQuaternionWeight`, `additionalTrivialTorus`,
  `additionalProductSV2Star` (`GL₂ × GL₂` fails SV2*).
* `sv5_iff_anisotropic` — `T(ℚ)` discrete in `T(𝔸_f)` iff the largest `ℚ`-anisotropic subtorus has
  compact real points.
* `PureDatum.IsPELType` — isomorphic to `RationalPELDatum.toShimuraDatum` of PELModuli §M0.12; API
  `pelType_iso`, `pelType_hodgeType`, `pelType_sv4`, `pelType_ofDatum`; tests `pelUnitarySignature`, `pelSiegel`,
  `pelHilbertStar`, `pelQuaternionNot`.
* `preabelianType` — API `abelianTypePreabelian`, `preabelianTypeAdjoint`,
  `preabelianTypeIsomorphism`, `preabelianTypeConnected` (connected data); tests `preabelianSiegel`,
  `preabelianTorus`, `preabelianComponent`, `preabelianConnectedSl2`.
* `typeImplications` — PEL ⇒ Hodge ⇒ abelian ⇒ preabelian.
* `reflexField_prod` — `E(G₁ × G₂, X₁ × X₂) = E(G₁, X₁) · E(G₂, X₂)` inside `ℚ̄`.
* `exists_pureDatum_lift` — every connected datum lifts to a datum with `G^der = H` satisfying SV1,
  SV2, SV2*, SV3, SV4, SV5, SV6.
* `distinguishedDatum` — Lovering's `B = G ×_{G^ab} Res_{E/ℚ} G_m` with the class of `(h, h_E)`;
  API `distinguishedDatumExact`, `distinguishedDatumToDatum`, `distinguishedDatumReflex`,
  `distinguishedDatumIndep`, `distinguishedDatumIsogeny`, `distinguishedDatumNorm`,
  `distinguishedDatumAbelian`; tests `distinguishedGl2`, `distinguishedImaginaryReflex`,
  `distinguishedTorus`, `distinguishedNotProduct`.
* `distinguishedDatum_levi` — `Z_s(B₁) = Z_s(Res_{E/ℚ} G_m)`, `B₁^c = G₁ ×_{G₁^ab} T^c` and
  `M^c_{μ_{B₁}} = M_{μ_{G₁}} ×_{G₁^ab} T^c` for a Hodge-type `(G₁, X₁)`.

D5.
* `hilbertReflexDual` — the reflex field of the restriction-of-scalars Hilbert datum is `ℚ` and its
  compact dual is `Res_{F/ℚ} ℙ¹`.
* `kostantSequenceGeometry` — for `x ∈ C_w ⊂ P\G`, `a_i(w) = dim(L_x ∩ ⟨e_{g+1}, …, e_{g+i}⟩)`.
-/

end TauCeti.Shimura
