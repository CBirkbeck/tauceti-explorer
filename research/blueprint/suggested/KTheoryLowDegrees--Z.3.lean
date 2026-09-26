import Mathlib.Algebra.Category.CommHopfAlgCat
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.Category.ModuleCat.Sheaf.LocallyFree
import Mathlib.Algebra.Category.ModuleCat.Stalk
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.TrivSqZeroExt.Ideal
import Mathlib.AlgebraicGeometry.Modules.Sheaf
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.CategoryTheory.Monoidal.Subcategory
import Mathlib.CategoryTheory.Subobject.Limits
import Mathlib.LinearAlgebra.Determinant
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.Zsqrtd.Basic
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.ClassGroup.ExtendedHom
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Finiteness.Prod
import Mathlib.RingTheory.HopfAlgebra.TensorProduct
import Mathlib.RingTheory.Ideal.Norm.RelNorm
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Idempotents
import Mathlib.RingTheory.LocalRing.Basic
import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem
import Mathlib.RingTheory.MvPolynomial.Symmetric.NewtonIdentities
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.PowerSeries.Binomial
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.WellKnown
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.TensorProduct.Finite
import Mathlib.Topology.LocallyConstant.Algebra
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.StandardComodule
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Monoidal
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Preadditive
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Product
import TauCeti.Algebra.Coalgebra.Comodule.Finite.Symmetric
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.TensorProduct
import TauCeti.CategoryTheory.Exact.Abelian
import TauCeti.CategoryTheory.Exact.ExtensionClosed
import TauCeti.CategoryTheory.GrothendieckGroup.Exact
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal
import TauCeti.NumberTheory.Multiquadratic.MinusFive.ClassNumber
import TauCeti.RepresentationTheory.RepresentationRing.Basic
import TauCeti.RingTheory.ClassGroup.Basic
import TauCeti.RingTheory.ClassGroup.RelNorm
import TauCeti.RingTheory.DedekindDomain.SInteger.ClassGroup
import TauCeti.RingTheory.MvPolynomial.Symmetric.Substitution

/-!
# Suggested Lean forms for `KTheoryLowDegrees--Z.3` (stages Z.3, Z.4, Z.5, Z.6)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/KTheoryLowDegrees--Z.3.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures; they claim no
implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` against the pinned commits (Mathlib `082e2d3` from the packages of a Lake
project pinned there, and the imported Tau Ceti modules compiled from the pinned `f790474` sources
with `lean -o` into a directory placed first on `LEAN_PATH`); the only warnings are uses of
`sorry`.

## Pinned conventions

* **`K₀` of a commutative ring** is Tau Ceti's `SplitK0` of `finiteProjectiveModules R`
  (`TauCeti.RingK0.K0 R`, with classes `cls R M`), and its ring structure is the tensor product:
  Tau Ceti's `SplitK0.instCommRing` on the full monoidal subcategory
  (`TauCeti.RingK0.finiteProjective_isMonoidal`). No second presentation of `K₀(R)` is introduced.
* **λ-rings are special λ-rings over pre-λ-rings**: `TauCeti.PreLambdaRing` (λ⁰ = 1, λ¹ = id, the
  sum formula) and `TauCeti.LambdaRing` extending it (λ^k(1) = 0 for k ≥ 2, the product and
  composition axioms with Grothendieck's `productPoly` and `compPoly`); "λ-ring" is never used
  unqualified. **Adams operations are defined by the Newton formula**
  (`TauCeti.LambdaRing.adams`, `ψ^k = N_k(λ¹, …, λ^k)`).
* **`det : K₀(R) → Pic(R)` is an additive-to-multiplicative group map**,
  `TauCeti.RingK0.detHom : K0 R →+ Additive (CommRing.Pic R)`, **never a ring map**; the ring map is
  `rank ⊕ det` into the square-zero extension `RankPic R`.
* **The rank lives in `LocallyConstant (PrimeSpectrum R) ℤ`** (`H⁰(Spec R, ℤ)`), never an integer on
  a disconnected spectrum; `rankℤ` exists only under `ConnectedSpace (PrimeSpectrum R)`.
* **`S` is a finite set of finite places** (height-one primes of `𝓞_F`) and **`O_{F,S}` is
  Mathlib's `Set.integer S F`**, with Tau Ceti's `IsDedekindDomain.integerClassGroupEquiv`.
* **On `P¹` the coordinates `(r, d)` (rank, degree of the determinant) correspond to `(r + d, -d)`
  in the basis `(1, [O(-1)])`** (`TauCeti.AlgebraicGeometry.KTheory.projectiveLineChangeOfBasis`).
* **K-book locators**: PDF page = book page + 8 (Weibel's author-hosted draft of 29 August 2013).
* `Pic X` of a scheme is the group of units of Tau Ceti's commutative monoid `LineBundleClass X`
  (all of it, Stacks 01CT; the group structure is JacobianChallenge layer A's, requested).

## Library declarations imported and reused

* Tau Ceti: `TauCeti.finiteProjectiveModules`, `finiteProjectiveModules_iff`,
  `finiteProjectiveModulesExactStructure`, `finiteModulesExactStructure`, `cartanMap`
  (`CartanMap.lean`); `TauCeti.SplitK0` with `of`, `lift`, `AdditiveInvariant` and the ring
  structure of `GrothendieckGroup/Monoidal.lean`; `TauCeti.ExactK0` with `of`, `of_congr`,
  `of_biprod`, `of_zero`, `lift`, `lift_of`, `hom_ext`, `map`, `map_of`, `fromSplit` and
  `BiadditiveInvariant.bilift`; `TauCeti.ExactStructure` (`abelian`, `fullSubcategory`,
  `IsExtensionClosed`); `TauCeti.GeneralLinear.coordinateHopfAlgebra`; `TauCeti.FGComoduleCat`
  with its preadditive, biproduct, monoidal and symmetric structures; `TauCeti.repRing`;
  `MvPolynomial.IsSymmetric.exists_aeval_esymm`; `ClassGroup.relNorm` and `Ideal.relNorm0`;
  `IsDedekindDomain.integerClassGroupEquiv` (with the `IsDedekindDomain` instance on
  `Set.integer`) and `HeightOneSpectrum.classGroupMk`; the concrete field `AdjoinRoot (X² + 5)` of
  `MinusFive/ClassNumber.lean`; `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `LineBundleClass`
  (`mk`, its `CommMonoid`), `TauCeti.SheafOfModules.IsInvertible`, `Scheme.Modules.tensorProduct`;
  `CodimensionOnePoint`, `SchemeWeilDivisor` with `sheaf`, `sheafHomOfLE`, `unitIsoSheafZero`,
  `toInvertibleSheaf`, `toLineBundleClass`, `classGroupToLineBundleClass` and
  `classGroupToLineBundleClassHom`; `WeilDivisor.ofPoint`, `isEffective_ofPoint`,
  `OrderSystem.ofScheme`, `OrderSystem.ClassGroup`, `divisorClass`, `principalDivisor`. Docstrings
  and comments also name, as proof routes or suppliers, `ExactK0.fromSplitEquiv`,
  `finiteProjectiveModulesExactStructure_eq_split`, `moduleEulerClassOf`, `cartanEquiv`,
  `exteriorPower.topEquiv`, `exteriorPower.map_top_eq_det_smul`, `relativeDegree` and
  `FinitelyPresentedSheaf`.
* Mathlib: `CommRing.Pic` with `mk`, `AsModule`, `mapAlgebra`, `mapRingHom`; `Module.Invertible`;
  `Module.rankAtStalk` (`rankAtStalk_eq_finrank_of_free`); `⋀[R]^n`, `exteriorPower.map`,
  `exteriorPower.oneEquiv`, `ExteriorAlgebra.map`; `PowerSeries` (`coeff`, `mk`, `subst`,
  `invUnitsSub`, `invOfUnit`, `derivative`, `binomialSeries`); `MvPolynomial` (`esymm`, `psum`,
  `aeval`, `rename`, `IsWeightedHomogeneous`); `Ring.choose` (`choose_natCast`, `choose_neg`) and
  `BinomialRing`; `LocallyConstant` (`map`, `comap`, `comapRingHom`, `const`, `charFn`,
  `evalRingHom`); `PrimeSpectrum.isIdempotentElemEquivClopens`; `TrivSqZeroExt`;
  `AddMonoidAlgebra` and `LaurentPolynomial`; `Zsqrtd` (`sqrtd`, `lift`, `norm`); `Ideal.span`,
  `Ideal.span_mul_span`; `ClassGroup` (`mk0`, `equivPic`, `extendedHom`), `Set.integer`,
  `HeightOneSpectrum`, `NumberField.RingOfIntegers`, `NumberField.classNumber`, `Ideal.relNorm`;
  `IsLocalization`, `LocalizedModule`; `CompleteOrthogonalIdempotents`; `LinearMap.det`;
  `DualNumber`; `CommHopfAlgCat`; `Scheme.Modules` (`pullback`, `restrictFunctor`),
  `SheafOfModules` (`LocalGeneratorsData`, `IsLocallyFreeData`, `IsFiniteType`, `IsLocallyFree`,
  `free`, `unit`, `isFinitePresentation`), `tilde.functor`, `TopCat.Presheaf.stalk` with its
  module structure, `IsRegularLocalRing`, `IsDiscreteValuationRing`, `IsIntegral`,
  `IsNoetherian`, `IsAffineOpen`, `Order.coheight`, `genericPoint`, `Scheme.functionField`,
  `Subobject`, `ShortComplex.ShortExact`; `ObjectProperty` (`FullSubcategory`, `lift`, `ιOfLE`,
  `IsMonoidal`, `ContainsZero`, `IsClosedUnderBinaryProducts`, `EssentiallySmall`).

## Real definitions, data sorries, helpers and omissions

Real definitions: the λ-ring classes and the universal polynomials (the Newton polynomial with a
complete proof), `lambdaTotal`, `gammaTotal`/`gamma` (by `PowerSeries.subst`), `adams`, the
augmentation ideals and the γ-filtration (as `Ideal.span`), the binomial and monoid λ-structures,
the rank, scalar extension and `K₀`-operations of `K₀(R)` through `SplitK0.lift`, the componentwise
determinant `detProjective` (the Picard class of `∏_n e_n ⋀ⁿP` along the rank fibres) and
`detHom`, `zpowLocallyConstant` and the `H⁰`-module `Pic R`, `RankPic`, `rankDet`, `SK0`, the
exterior filtration of an extension (inside the graded exterior algebra), `picToK0`,
`rankPicEquiv`, `rankClassGroupEquiv`, `steinitzClass`, `CommRing.Pic.relNorm` (the transport of
Tau Ceti's `ClassGroup.relNorm`), the index ideal, `isVectorBundle`, `rankAt`, the exact structure
of `Vect(X)` and `VectorBundleK0 = ExactK0` with its pullback, product, rank and determinant, the
Cartan map to a stand-in `G₀`, the structure sheaf `𝒪_D` of an effective divisor (a cokernel) and
`pointClass`. `R_k(∏ GL_{N_i})` is Tau Ceti's `ExactK0` of free finitely generated comodules over
the iterated tensor product of `GeneralLinear.coordinateHopfAlgebra` (over a general base ring
`k`, to avoid the two `ℤ`-module structures on a bundled Hopf `ℤ`-algebra), with a real exact
structure (conflations exact on underlying modules; the Quillen axioms omitted) and a real
multiplication. Data left as `sorry`, each pinned by characterising lemmas: the companion's
`rankSection`, `transfer` and `divisionRingEquiv`; the λ-operations, standard representations,
character map, restriction and duality of `R_k(G)`; the associated module `V(P)` and `τ_P`; the
sheaf exterior power `Λⁿ`, the determinant bundle `det E` and `detIso`; `RankPic.map`;
`VectorBundleK0.rankSection` and `affineRingEquiv`. Helpers that are not packet names say so in
their docstrings. Statements needing a carrier in neither library — K-theory spectra and `π₀K`,
`K₀(D_perf)`, `P¹` and `O(n)` on schemes, the doubled line, an elliptic curve or a real conic as
schemes, the exterior-power comodule, the module structure of a stalk over the commutative stalk
ring — are left out, and a comment `<name>: not stated here; needs … (supplier: …)` records each in
place, so that every packet name appears in this file.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.MonoidalCategory ZeroObject
open scoped TensorProduct nonZeroDivisors

universe u

/-! ## Stage `KTheoryLowDegrees:Z.3` — the `K₀` ring, λ-operations, determinant and γ-filtration -/
/-! ### The abstract λ-ring algebra (moved here from `SchemeKTheoryOperations:S.6`)

The spellings are those of the companion file `SchemeKTheoryOperations.lean` (`PreLambdaRing` with
the field `lambda`, `LambdaRing` extending it, `productPoly`, `compPoly`, `newtonPoly`, `adams`),
declared here under the packet's Z.3 names. -/

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

-- test TauCeti.LambdaRing.productPoly_one_test (computation)
/- `P₁ = a₁ b₁`: by uniqueness, from `e₁(ξ₀η₀) = ξ₀η₀` in one plus one variables. -/
example : productPoly 1 = X (Sum.inl 0) * X (Sum.inr 0) := by
  refine (productPoly_unique 1 1 1 le_rfl le_rfl _ ?_).symm
  simp [esymm_one, Fintype.sum_prod_type]

-- test TauCeti.LambdaRing.productPoly_two_test (computation)
/- `P₂ = a₁² b₂ + a₂ b₁² − 2 a₂ b₂`. -/
example : productPoly 2 = X (Sum.inl 0) ^ 2 * X (Sum.inr 1) + X (Sum.inl 1) * X (Sum.inr 0) ^ 2 -
    2 * X (Sum.inl 1) * X (Sum.inr 1) := by
  sorry

-- test TauCeti.LambdaRing.compPoly_two_two_test (computation)
/- `P_{2,2} = a₁ a₃ − a₄`. -/
example : compPoly 2 2 = X 0 * X 2 - X 3 := by
  sorry

-- test TauCeti.LambdaRing.compPoly_one_test (degenerate)
/- `P_{k,1} = a_k` and `P_{1,l} = a_l` (the index sets `k * 1`, `1 * l` read through `Fin`). -/
example (k l : ℕ) (hk : 0 < k) (hl : 0 < l) :
    compPoly k 1 = X ⟨k - 1, by omega⟩ ∧ compPoly 1 l = X ⟨l - 1, by omega⟩ := by
  sorry

-- test TauCeti.LambdaRing.productPoly_ne_naive_test (non-example)
/- `P₂ ≠ a₂ b₂ + a₁ b₁`: in `ℤ`, `λ²(2 · 2) = 6` while `λ²(2) λ²(2) + 2 · 2 = 5`. -/
example : productPoly 2 ≠ X (Sum.inl 1) * X (Sum.inr 1) + X (Sum.inl 0) * X (Sum.inr 0) := by
  sorry

-- The Newton polynomials in low degree (acceptance of the node): `N₂ = a₁² − 2a₂`.
example : newtonPoly 2 = X 0 ^ 2 - 2 * X 1 := by
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

/-- **`λ_t`** (`TauCeti.LambdaRing.lambdaTotal`): `x ↦ Σ λⁿ(x) tⁿ`, an additive-to-multiplicative
homomorphism `K → 1 + tK[[t]]` (a real definition; additivity is the sum formula). -/
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

/-- **λ-ideals** (`TauCeti.LambdaRing.IsLambdaIdeal`): ideals with `λⁿ(I) ⊆ I` for `n ≥ 1`. The
kernel of a pre-λ-ring homomorphism is one (`PreLambdaRing.Hom.isLambdaIdeal_ker`). -/
class IsLambdaIdeal [PreLambdaRing K] (I : Ideal K) : Prop where
  /-- `λⁿ(I) ⊆ I` for `n ≥ 1`. -/
  lambda_mem : ∀ n, 1 ≤ n → ∀ x ∈ I, lambda n x ∈ I

/-- **Line elements** (`TauCeti.LambdaRing.IsLineElement`): `λⁿ(ℓ) = 0` for `n ≥ 2`, so that
`λ_t(ℓ) = 1 + ℓt`. -/
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

/-- **Pre-λ-rings from `λ_t`** (`TauCeti.PreLambdaRing.ofLambdaTotal`): an
additive-to-multiplicative `λ_t : K → (K[[t]])ˣ` with constant coefficient `1` and `t`-coefficient
the identity is a pre-λ-ring structure, `λⁿ = coeffₙ ∘ λ_t` (a real definition). -/
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

/-- **Pre-λ-ring homomorphisms** (`TauCeti.PreLambdaRing.Hom`): ring homomorphisms commuting with
every `λⁿ`. -/
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

/-- **The quotient by a λ-ideal** (`TauCeti.LambdaRing.quotient`, pre-λ form): `K ⧸ I` with
`λⁿ[x] = [λⁿ x]` (well defined because `I` is a λ-ideal and by the sum formula). -/
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

/-! #### Tests of `KTheoryLowDegrees:Z.3/pre-lambda-ring` that need no `K₀` -/

-- test TauCeti.PreLambdaRing.zero_ring_test (degenerate)
example (K : Type*) [CommRing K] [Subsingleton K] :
    Nonempty (PreLambdaRing K) ∧ ∀ s t : PreLambdaRing K, s = t := by
  sorry

/-- Test helper (not a packet name): the pre-λ-ring `ℤ` with `λ_t(m) = (1 + t + t²)^m`. -/
@[instance_reducible]
noncomputable def cubicPreLambda : PreLambdaRing ℤ where
  lambda k n := PowerSeries.coeff k
    ((unitOfConstOne (1 + PowerSeries.X + PowerSeries.X ^ 2 : PowerSeries ℤ) (by simp)) ^ n :
      (PowerSeries ℤ)ˣ).val
  lambda_zero' := by sorry
  lambda_one' := by sorry
  lambda_add' := by sorry

-- test TauCeti.PreLambdaRing.nonspecial_test (characterisation)
/- `λ_t(m) = (1 + t + t²)^m` satisfies the pre-λ axioms (it is a structure), with `λ²(1) = 1`. -/
example : cubicPreLambda.lambda 2 1 = 1 ∧ cubicPreLambda.lambda 1 5 = 5 := by
  sorry

-- test TauCeti.PreLambdaRing.powers_not_test (non-example)
/- `λⁿ(x) := xⁿ` is not a pre-λ-ring on `ℤ`: `λ²(1 + 1) = 4` but the sum formula gives `3`. -/
example : ¬ ∃ s : PreLambdaRing ℤ, ∀ (n : ℕ) (x : ℤ), s.lambda n x = x ^ n := by
  rintro ⟨s, hs⟩
  have h := s.lambda_add' 2 1 1
  simp only [hs, Finset.sum_range_succ, Finset.sum_range_zero] at h
  norm_num at h

/-! #### `KTheoryLowDegrees:Z.3/binomial-lambda-ring` -/

section Binomial

/-- **Binomial rings as pre-λ-rings** (`TauCeti.LambdaRing.ofBinomialRing`): `λ^k b = C(b, k)`
(`Ring.choose`), so `λ_t(b) = (1 + t)^b` (`PowerSeries.binomialSeries`); the sum formula is
Chu–Vandermonde (`Ring.add_choose_eq`). -/
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

-- test TauCeti.LambdaRing.int_choose_test (computation)
example : lambda 2 (5 : ℤ) = 10 ∧ lambda 3 (2 : ℤ) = 0 ∧ lambda 2 (-1 : ℤ) = 1 := by
  refine ⟨?_, ?_, ?_⟩
  · rw [lambda_eq_choose, show (5 : ℤ) = ((5 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide
  · rw [lambda_eq_choose, show (2 : ℤ) = ((2 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide
  · rw [lambda_eq_choose, show (-1 : ℤ) = -(1 : ℤ) from rfl, Ring.choose_neg,
      show ((1 : ℤ) + (2 : ℕ) - 1) = ((2 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide

-- test TauCeti.PreLambdaRing.int_binomial_test (computation)
example : lambda 2 (3 : ℤ) = 3 ∧ lambda 2 (-1 : ℤ) = 1 := by
  refine ⟨?_, ?_⟩
  · rw [lambda_eq_choose, show (3 : ℤ) = ((3 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide
  · rw [lambda_eq_choose, show (-1 : ℤ) = -(1 : ℤ) from rfl, Ring.choose_neg,
      show ((1 : ℤ) + (2 : ℕ) - 1) = ((2 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide

-- test TauCeti.LambdaRing.locallyConstant_empty_test (degenerate)
example : Subsingleton (LocallyConstant Empty ℤ) :=
  ⟨fun _ _ => LocallyConstant.ext fun x => x.elim⟩

-- test TauCeti.LambdaRing.polynomial_not_binomial_test (non-example)
/- `ℤ[x]` is not binomial (`x(x-1)/2 ∉ ℤ[x]`), and in the monoid λ-ring `ℤ[x]` (`x` a line
element, `monoidAlgebra` below) `λ²(x) = 0 ≠ x(x-1)/2`. -/
example : IsEmpty (BinomialRing (Polynomial ℤ)) := by
  sorry

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

/-- **Special λ-subrings** (`TauCeti.LambdaRing.ofSubring`): a subring closed under the `λ^k` of a
special λ-ring is a special λ-ring (a real definition; the axioms are inherited). -/
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
special. The packet gives this item the same name as the pre-λ instance `quotient` above; it is
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

-- test TauCeti.LambdaRing.int_special_test (computation)
/- `λ²(6) = 15 = P₂(λ¹3, λ²3; λ¹2, λ²2) = 9 · 1 + 3 · 4 − 2 · 3 · 1`. -/
example : lambda 2 (6 : ℤ) = 15 ∧
    aeval (Sum.elim (fun i : Fin 2 => lambda (i + 1) (3 : ℤ))
      (fun j : Fin 2 => lambda (j + 1) (2 : ℤ))) (productPoly 2) = 15 := by
  refine ⟨?_, ?_⟩
  · rw [lambda_eq_choose, show (6 : ℤ) = ((6 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide
  · sorry

-- test TauCeti.LambdaRing.zero_ring_special_test (degenerate)
example (K : Type*) [CommRing K] [Subsingleton K] : Nonempty (LambdaRing K) := by
  sorry

-- test TauCeti.LambdaRing.not_special_test (non-example)
/- `λ_t(m) = (1 + t + t²)^m` has `λ²(1) = 1 ≠ 0`, so no special λ-ring structure extends it. -/
example : ¬ ∃ inst : LambdaRing ℤ, inst.toPreLambdaRing = cubicPreLambda := by
  sorry

/-! #### `KTheoryLowDegrees:Z.3/gamma` -/

section Gamma

variable [PreLambdaRing K]

/-- **The total γ-operation** (`TauCeti.LambdaRing.gammaTotal`): `γ_t(x) = λ_s(x)` with
`s = t/(1 - t)` (Mathlib's `PowerSeries.subst`), an additive-to-multiplicative homomorphism
`K → 1 + tK[[t]]` (a real definition). -/
noncomputable def gammaTotal : K →+ Additive (PowerSeries K)ˣ where
  toFun x := Additive.ofMul (unitOfConstOne
    (PowerSeries.subst (PowerSeries.X * PowerSeries.invUnitsSub (1 : Kˣ))
      ((Additive.toMul (lambdaTotal x) : (PowerSeries K)ˣ) : PowerSeries K)) (by sorry))
  map_zero' := by sorry
  map_add' := by sorry

/-- **The γ-operations** (`TauCeti.LambdaRing.gamma`): `γⁿ(x) = coeffₙ(γ_t(x))`. -/
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

-- test TauCeti.LambdaRing.gamma_int_test (computation)
/- In `ℤ`: `γ^k(m) = C(m + k - 1, k)`; `γ²(3) = 6`. -/
example : gamma 2 (3 : ℤ) = 6 ∧
    ∀ (k : ℕ) (m : ℤ), 1 ≤ k → gamma k m = Ring.choose (m + k - 1) k := by
  have h1 : IsLineElement (1 : ℤ) := fun n hn => by
    rw [lambda_eq_choose, show (1 : ℤ) = ((1 : ℕ) : ℤ) by norm_num, Ring.choose_natCast,
      Nat.choose_eq_zero_of_lt (by omega), Nat.cast_zero]
  refine ⟨?_, fun k m hk => ?_⟩
  · rw [gamma_eq_lambda_add h1 2 (by norm_num), lambda_eq_choose,
      show (3 : ℤ) + ((2 - 1 : ℕ) : ℤ) = ((4 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
    decide
  · rw [gamma_eq_lambda_add h1 k hk, lambda_eq_choose]
    congr 1
    push_cast [Nat.cast_sub hk]
    ring

-- test TauCeti.LambdaRing.gamma_zero_class_test (degenerate)
example [PreLambdaRing K] (n : ℕ) (hn : 0 < n) : gamma n (0 : K) = 0 := by
  sorry

/-! #### `KTheoryLowDegrees:Z.3/augmented-lambda-ring` -/

/-- **Augmented pre-λ-rings** (`TauCeti.LambdaRing.Augmentation`): a binomial ring `H` (with its
pre-λ-structure `ofBinomialRing`) and pre-λ-homomorphisms `ι : H → K`, `ε : K → H` with
`ε ∘ ι = id` (parts 1) and 2) of Weibel's positive structure). -/
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

/-- **Morphisms of augmented pre-λ-rings** (`TauCeti.LambdaRing.Augmentation.Hom`). -/
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

-- test TauCeti.LambdaRing.augmentation_self_test (degenerate)
example {H : Type*} [CommRing H] [BinomialRing H] :
    augmentationIdeal
      (⟨PreLambdaRing.Hom.id H, PreLambdaRing.Hom.id H, fun _ => rfl⟩ : Augmentation H H) = ⊥ := by
  sorry

-- test TauCeti.LambdaRing.augmentation_nonexistence_test (non-example)
/- The pre-λ-ring `ℤ` with `λ_t(m) = (1 + t + t²)^m` has no augmentation (`λ²(1) = 1`). -/
example : IsEmpty (@Augmentation ℤ _ cubicPreLambda ℤ _ _) := by
  sorry

/-! #### `KTheoryLowDegrees:Z.3/gamma-filtration` -/

section GammaFiltration

variable [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H]

/-- **The γ-filtration** (`TauCeti.LambdaRing.gammaFiltration`): `F^n_γ K` is the ideal generated
by the products `γ^{k₁}(x₁) ⋯ γ^{k_m}(x_m)` with `x_j ∈ ker ε`, `k_j ≥ 1` and `Σ k_j ≥ n` (the
weight is the sum of the degrees; the empty product `1` has weight `0`). This is Weibel's
ideal-generated form. -/
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

-- test TauCeti.LambdaRing.gammaFiltration_zero_test (degenerate)
example [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H] (A : Augmentation K H) :
    gammaFiltration A 0 = ⊤ ∧
      gammaFiltration
        (⟨PreLambdaRing.Hom.id ℤ, PreLambdaRing.Hom.id ℤ, fun _ => rfl⟩ : Augmentation ℤ ℤ) 1 =
        ⊥ := by
  sorry

-- test TauCeti.LambdaRing.gammaFiltration_weight_two_test (characterisation)
example [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H] (A : Augmentation K H)
    (x : K) (hx : x ∈ augmentationIdeal A) : gamma 2 x ∈ gammaFiltration A 2 := by
  sorry

-- test TauCeti.LambdaRing.gammaFiltration_product_test (compatibility)
/- `(ker ε)ⁿ ⊆ F^n_γ`; for `ℤ[u, u⁻¹]` with `ε(u) = 1`, `F^n_γ = ((u - 1))ⁿ`. -/
example [PreLambdaRing K] {H : Type*} [CommRing H] [BinomialRing H] (A : Augmentation K H)
    (n : ℕ) : augmentationIdeal A ^ n ≤ gammaFiltration A n := by
  sorry

/-! #### `KTheoryLowDegrees:Z.3/adams-operations` -/

section Adams

/-- **Adams operations** (`TauCeti.LambdaRing.adams`) of a pre-λ-ring, by the **Newton recursion**
`ψ^{k+1}(x) = Σ_{i=0}^{k-1} (-1)^i λ^{i+1}(x) ψ^{k-i}(x) + (-1)^k (k+1) λ^{k+1}(x)`, i.e.
`ψ^k = N_k(λ¹, …, λ^k)` (the companion's definition). `ψ⁰` is set to `0`; for an augmented ring
the packet's `ψ⁰ = ι ∘ ε` is `adams_zero_aug`. -/
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

-- test TauCeti.LambdaRing.adams_int_test (computation)
/- In `ℤ`: `ψ^k(n) = n` for `k ≥ 1`; `ψ²(2) = 4 - 2 = 2`. -/
example : (∀ (k : ℕ) (n : ℤ), 1 ≤ k → adams k n = n) ∧ adams 2 (2 : ℤ) = 2 := by
  refine ⟨fun k n hk => adams_binomial k hk n, ?_⟩
  rw [adams_two, lambda_eq_choose, show (2 : ℤ) = ((2 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
  decide

-- test TauCeti.LambdaRing.adams_zero_test (degenerate)
example [PreLambdaRing K] (k : ℕ) : adams k (0 : K) = 0 := by
  sorry

-- test TauCeti.LambdaRing.adams_ne_pow_test (non-example)
example : adams 2 (2 : ℤ) ≠ 2 ^ 2 := by
  rw [adams_two, lambda_eq_choose, show (2 : ℤ) = ((2 : ℕ) : ℤ) by norm_num, Ring.choose_natCast]
  decide

-- test TauCeti.LambdaRing.adams_line_test (characterisation)
example [PreLambdaRing K] (ℓ : K) (hℓ : IsLineElement ℓ) (k : ℕ) (hk : 1 ≤ k) :
    adams k ℓ = ℓ ^ k :=
  adams_of_isLineElement hℓ k hk

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

/-- **The special λ-ring of a monoid of line elements** (`TauCeti.LambdaRing.monoidAlgebra`):
`ℤ[M]` with `λ_t(m) = 1 + m t`; the operations are the coefficients of `monoidAlgebraLambdaTotal`.
Instances: `ℤ[u^{±1}]` (Mathlib's `LaurentPolynomial ℤ`), `ℤ[ℕⁿ] = ℤ[ξ₁, …, ξ_n]`, the character
ring `ℤ[X(T)]` of a split torus. -/
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

-- test TauCeti.LambdaRing.monoidAlgebra_lambda_two_test (computation)
example :
    lambda 2 (LaurentPolynomial.T 1 + LaurentPolynomial.T (-1) : LaurentPolynomial ℤ) = 1 := by
  sorry

-- test TauCeti.LambdaRing.monoidAlgebra_trivial_test (degenerate)
/- For the trivial monoid, `ℤ[M] = ℤ` with the binomial structure. -/
example (k : ℕ) (n : ℤ) :
    lambda k (algebraMap ℤ (AddMonoidAlgebra ℤ (Fin 1)) n) =
      algebraMap ℤ (AddMonoidAlgebra ℤ (Fin 1)) (Ring.choose n k) := by
  sorry

-- test TauCeti.LambdaRing.monoidAlgebra_adams_ne_frobenius_test (non-example)
/- In `ℤ[u]` (`MvPolynomial (Fin 1) ℤ`): `ψ²(u + 1) = u² + 1 ≠ (u + 1)²`. -/
example : adams 2 (MvPolynomial.X 0 + 1 : MvPolynomial (Fin 1) ℤ) = MvPolynomial.X 0 ^ 2 + 1 ∧
    adams 2 (MvPolynomial.X 0 + 1 : MvPolynomial (Fin 1) ℤ) ≠ (MvPolynomial.X 0 + 1) ^ 2 := by
  sorry

-- test TauCeti.LambdaRing.monoidAlgebra_special_test (characterisation)
/- `λ³(λ²(ξ₁ + ξ₂ + ξ₃)) = ξ₁²ξ₂²ξ₃²`, the value of `P_{3,2}`. -/
example :
    lambda 3 (lambda 2 (MvPolynomial.X 0 + MvPolynomial.X 1 + MvPolynomial.X 2 :
        MvPolynomial (Fin 3) ℤ)) =
      MvPolynomial.X 0 ^ 2 * MvPolynomial.X 1 ^ 2 * MvPolynomial.X 2 ^ 2 := by
  sorry

-- test TauCeti.LambdaRing.monoid_special_test (compatibility)
/- `ℤ[M]` with `λ_t(m) = 1 + mt` is special (the instance `monoidAlgebra`); for `M = ℤ`,
`λ²(u + u⁻¹) = 1`. -/
example : ∃ inst : LambdaRing (LaurentPolynomial ℤ),
    inst.lambda 2 (LaurentPolynomial.T 1 + LaurentPolynomial.T (-1)) = 1 :=
  ⟨inferInstance, by sorry⟩

-- test TauCeti.LambdaRing.augmentation_laurent_test (computation)
/- For `K = ℤ[u, u⁻¹]` (the monoid λ-ring below) with `ε(u) = 1`:
`ε(λ²(u + u⁻¹)) = ε(1) = 1 = C(2, 2)`. -/
example (A : Augmentation (LaurentPolynomial ℤ) ℤ)
    (hA : A.ε.toRingHom (LaurentPolynomial.T 1) = 1) :
    A.ε.toRingHom (lambda 2 (LaurentPolynomial.T 1 + LaurentPolynomial.T (-1))) = 1 := by
  sorry

-- (continued) test TauCeti.LambdaRing.gammaFiltration_product_test (compatibility): the Laurent
-- case
example (A : Augmentation (LaurentPolynomial ℤ) ℤ)
    (hA : A.ε.toRingHom (LaurentPolynomial.T 1) = 1) (n : ℕ) :
    gammaFiltration A n = Ideal.span {LaurentPolynomial.T 1 - 1} ^ n := by
  sorry

-- test TauCeti.LambdaRing.gammaFiltration_not_finite_test (non-example)
/- `ℤ[C₂] = ℤ[σ]/(σ² - 1)` (`AddMonoidAlgebra ℤ (ZMod 2)`, `σ` a line element) with `ε(σ) = 1`:
`F^n_γ = 2^{n-1}(σ - 1)ℤ ≠ 0` for all `n ≥ 1`. -/
example (A : Augmentation (AddMonoidAlgebra ℤ (ZMod 2)) ℤ)
    (hA : A.ε.toRingHom (AddMonoidAlgebra.single 1 1) = 1) (n : ℕ) (hn : 1 ≤ n) :
    gammaFiltration A n =
        Ideal.span {2 ^ (n - 1) * (AddMonoidAlgebra.single (1 : ZMod 2) (1 : ℤ) - 1)} ∧
      gammaFiltration A n ≠ ⊥ := by
  sorry


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

/-! ### The ring `K₀(R)` and its exterior-power operations

`K0 R` is Tau Ceti's `SplitK0` of `finiteProjectiveModules R` (the carrier of the checkpoint and of
the companion file `KTheoryLowDegrees--U.1`, where it is `RingK0 R`); `cls R M` is the class of a
finitely generated projective `M`. The ring structure is Tau Ceti's `SplitK0.instCommRing`,
available once the full subcategory is monoidal (`finiteProjective_isMonoidal`). -/

namespace TauCeti.RingK0

section Carrier

variable (R : Type u) [CommRing R]

/-- `FP R`: the full subcategory of finitely generated projective `R`-modules in `ModuleCat R`
(Tau Ceti's `finiteProjectiveModules`). -/
abbrev FP := (TauCeti.finiteProjectiveModules R).FullSubcategory

/-- **`K₀` of a commutative ring** (`KTheoryLowDegrees:Z.1/ring-k0`): `SplitK0 (FP R)`. -/
abbrev K0 := TauCeti.SplitK0.{u} (FP R)

/-- The class `[M] ∈ K₀(R)` of a finitely generated projective `M : Type u`. -/
abbrev cls (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] : K0 R :=
  TauCeti.SplitK0.of ⟨ModuleCat.of R M, ⟨inferInstance, inferInstance⟩⟩

/-- `KTheoryLowDegrees:Z.3/projective-exterior-power`: exterior powers of projective modules are
projective (no finiteness needed); with `exteriorPower.instFinite` they preserve finitely generated
projectives. -/
instance exteriorPower_projective (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Projective R M] (n : ℕ) : Module.Projective R (⋀[R]^n M) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/finite-projective-monoidal`: `finiteProjectiveModules R` contains `R`
and is closed under `⊗[R]`, so its full subcategory is a full (symmetric, monoidal-preadditive)
monoidal subcategory of `ModuleCat R`, and Tau Ceti's `SplitK0.instCommRing` makes `K₀(R)` a
commutative ring with `1 = [R]` and `[P][Q] = [P ⊗ Q]`. -/
instance finiteProjective_isMonoidal :
    (TauCeti.finiteProjectiveModules R).IsMonoidal := by
  sorry

-- The ring structure is the pinned categorical one, not a new definition.
example : CommRing (K0 R) := inferInstance

variable {R}

/-- `[P] · [Q] = [P ⊗[R] Q]` (Tau Ceti's `SplitK0.of_mul_of`). -/
theorem cls_mul_cls (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] : cls R M * cls R N = cls R (M ⊗[R] N) := by
  sorry

/-- `1 = [R]`. -/
theorem one_eq_cls : (1 : K0 R) = cls R R := by
  sorry

/-- Isomorphic modules have equal classes (Tau Ceti's `SplitK0.of_congr`). -/
theorem cls_congr {M N : Type u} [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] (e : M ≃ₗ[R] N) : cls R M = cls R N := by
  sorry

/-- `[M × N] = [M] + [N]` (Tau Ceti's `SplitK0.of_biprod`). -/
theorem cls_prod (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
    [Module.Projective R N] : cls R (M × N) = cls R M + cls R N := by
  sorry

/-- `[Rⁿ] = n` in the ring `K₀(R)`. -/
theorem cls_free (n : ℕ) : cls R (Fin n → R) = (n : K0 R) := by
  sorry

/-- Test helper (not a packet name): the idempotent ideal `k × 0 ⊆ k × k`. -/
abbrev fstLine (k : Type u) [Field k] : Ideal (k × k) := RingHom.ker (RingHom.snd k k)

/-- Test helper (not a packet name): the idempotent ideal `0 × k ⊆ k × k`. -/
abbrev sndLine (k : Type u) [Field k] : Ideal (k × k) := RingHom.ker (RingHom.fst k k)

/-- Helper instance (a true fact, proof omitted): `k × 0` is a direct summand of `k × k`. -/
instance fstLine_projective (k : Type u) [Field k] : Module.Projective (k × k) (fstLine k) := by
  sorry

/-- Helper instance (a true fact, proof omitted): `0 × k` is a direct summand of `k × k`. -/
instance sndLine_projective (k : Type u) [Field k] : Module.Projective (k × k) (sndLine k) := by
  sorry

-- Acceptance of `KTheoryLowDegrees:Z.3/finite-projective-monoidal`: for `R = k × k`,
-- `[k × 0] · [0 × k] = 0` (the ring `K₀(k × k) ≅ ℤ²` has zero divisors).
example (k : Type u) [Field k] : cls (k × k) (fstLine k) * cls (k × k) (sndLine k) = 0 := by
  sorry

end Carrier

/-! #### Stand-ins for the companion part (`KTheoryLowDegrees--U.1`: Z.1 and Z.2)

The companion part owns the universal property, scalar extension, the transfer and the rank.
They are restated here, over the same carrier, so that the Z.3–Z.6 statements can be made; the
universal property, scalar extension and the rank are real definitions through `SplitK0.lift`,
while `rankSection`, `transfer` and `divisionRingEquiv` are `def`s with `sorry` bodies pinned by
the lemmas of the companion. -/

section StandIns

variable (R : Type u) [CommRing R]

variable {G : Type*} [AddCommGroup G] in
/-- Stand-in for `RingK0.lift` (`KTheoryLowDegrees:Z.1/ring-k0`): an isomorphism-invariant,
product-additive function on finitely generated projectives induces `K0 R →+ G` (a real
definition through `SplitK0.lift`). -/
def lift
    (c : ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M],
      G)
    (_hc : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], (M ≃ₗ[R] N) → c M = c N)
    (_hprod : ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
      [Module.Projective R M] [AddCommGroup N] [Module R N] [Module.Finite R N]
      [Module.Projective R N], c (M × N) = c M + c N) :
    K0 R →+ G :=
  SplitK0.lift
    { obj := fun X => @c X.obj.carrier _ _ (finiteProjectiveModules_iff.mp X.property).1
        (finiteProjectiveModules_iff.mp X.property).2
      map_iso := fun _ _ _ => by sorry
      map_biprod := fun _ _ => by sorry }

/-- Stand-in for `RingK0.rank` (`KTheoryLowDegrees:Z.2/rank-hom`):
`rank : K₀(R) →+ H⁰(Spec R, ℤ) = LocallyConstant (PrimeSpectrum R) ℤ`, `[P] ↦ rankAtStalk P` (a real
definition through `lift`). -/
def rank : K0 R →+ LocallyConstant (PrimeSpectrum R) ℤ :=
  lift R (fun (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
      [Module.Projective R P] =>
    ⟨fun p => (Module.rankAtStalk (R := R) P p : ℤ), by sorry⟩) (by sorry) (by sorry)

/-- Stand-in for `RingK0.rankSection` (`KTheoryLowDegrees:Z.2/rank-section`):
`f ↦ Σ_n n · [R_{f⁻¹(n)}]`, the section of `rank` by componentwise free modules. -/
def rankSection : LocallyConstant (PrimeSpectrum R) ℤ →+ K0 R := sorry

/-- Stand-in for `RingK0.map` (`KTheoryLowDegrees:Z.1/ring-k0-map`): `[P] ↦ [S ⊗[R] P]` (a real
definition through `lift`). -/
def map {S : Type u} [CommRing S] (f : R →+* S) : K0 R →+ K0 S :=
  letI := f.toAlgebra
  lift R (fun (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
      [Module.Projective R P] => cls S (S ⊗[R] P)) (by sorry) (by sorry)

/-- Stand-in for `RingK0.rankℤ` (`KTheoryLowDegrees:Z.2/rank-connected`): on a connected spectrum
the rank at any point (a real definition). -/
def rankℤ [ConnectedSpace (PrimeSpectrum R)] : K0 R →+ ℤ where
  toFun x := rank R x (Classical.arbitrary (PrimeSpectrum R))
  map_zero' := by simp
  map_add' x y := by simp

/-- Stand-in for `RingK0.transfer` (`KTheoryLowDegrees:Z.1/ring-k0-transfer`): restriction of
scalars `[Q] ↦ [Q|_R]` for `S` finitely generated projective over `R`. -/
def transfer (S : Type u) [CommRing S] [Algebra R S] [Module.Finite R S]
    [Module.Projective R S] : K0 S →+ K0 R :=
  sorry

/-- Stand-in for `RingK0.divisionRingEquiv` (`KTheoryLowDegrees:Z.2/division-ring-k0`):
`K₀(k) ≃+ ℤ` by dimension. -/
def divisionRingEquiv (k : Type u) [Field k] : K0 k ≃+ ℤ :=
  sorry

variable {R}

/-- `rank [P] (p) = rankAtStalk P p`. -/
@[simp]
theorem rank_of (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] (p : PrimeSpectrum R) :
    rank R (cls R P) p = (Module.rankAtStalk (R := R) P p : ℤ) := by
  sorry

/-- `rank ∘ rankSection = id`. -/
@[simp]
theorem rank_rankSection (f : LocallyConstant (PrimeSpectrum R) ℤ) :
    rank R (rankSection R f) = f := by
  sorry

/-- `map f [P] = [S ⊗[R] P]` (for `f = algebraMap R S`). -/
@[simp]
theorem map_cls {S : Type u} [CommRing S] [Algebra R S] (P : Type u) [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] :
    map R (algebraMap R S) (cls R P) = cls S (S ⊗[R] P) := by
  sorry

/-- `rankℤ [P] = rankAtStalk P p` for every `p`. -/
@[simp]
theorem rankℤ_of [ConnectedSpace (PrimeSpectrum R)] (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] (p : PrimeSpectrum R) :
    rankℤ R (cls R P) = (Module.rankAtStalk (R := R) P p : ℤ) := by
  sorry

end StandIns

/-! #### Exterior powers (`Z.3/exterior-direct-sum` … `Z.3/projective-dual-base-change`) -/

section Exterior

variable (R : Type u) [CommRing R]

/-- `KTheoryLowDegrees:Z.3/exterior-direct-sum` (the Sum Formula): for arbitrary `M, N`,
`⋀ⁿ(M × N) ≅ ⊕_{i=0}^{n} ⋀ⁱM ⊗ ⋀^{n-i}N`, the `M`-factors placed before the `N`-factors. -/
theorem exteriorPower_prod (M N : Type u)
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N] (n : ℕ) :
    Nonempty ((⋀[R]^n (M × N)) ≃ₗ[R]
      ((i : Fin (n + 1)) → (⋀[R]^(i : ℕ) M) ⊗[R] (⋀[R]^(n - i) N))) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/exterior-class-sum`:
`[⋀ⁿ(P × Q)] = Σ_{i=0}^{n} [⋀ⁱP] · [⋀^{n-i}Q]` in the ring `K₀(R)`. -/
theorem exteriorClass_prod (M N : Type u)
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] (n : ℕ) :
    cls R (⋀[R]^n (M × N)) =
      ∑ i ∈ Finset.range (n + 1), cls R (⋀[R]^i M) * cls R (⋀[R]^(n - i) N) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/exterior-base-change`: `S ⊗[R] ⋀ⁿ_R M ≅ ⋀ⁿ_S (S ⊗[R] M)`, sending
`1 ⊗ (m₁ ∧ ⋯ ∧ m_n)` to `(1 ⊗ m₁) ∧ ⋯ ∧ (1 ⊗ m_n)`. -/
theorem exteriorPower_baseChange (S : Type u) [CommRing S] [Algebra R S]
    (M : Type u) [AddCommGroup M] [Module R M] (n : ℕ) :
    Nonempty ((S ⊗[R] (⋀[R]^n M)) ≃ₗ[S] (⋀[S]^n (S ⊗[R] M))) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/exterior-base-change`, consequence:
`rankAtStalk (⋀ⁿP) = C(rankAtStalk P, n)`. -/
theorem rankAtStalk_exteriorPower (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] (n : ℕ) (p : PrimeSpectrum R) :
    Module.rankAtStalk (R := R) (⋀[R]^n P) p = (Module.rankAtStalk (R := R) P p).choose n := by
  sorry

/-- `KTheoryLowDegrees:Z.3/exterior-above-rank`: if `rankAtStalk M p < n` at every prime then
`⋀ⁿM = 0`. -/
theorem exteriorPower_subsingleton (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ)
    (hn : ∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) M p < n) :
    Subsingleton (⋀[R]^n M) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/projective-dual-base-change`: `S ⊗[R] Hom_R(M, R) ≅ Hom_S(S ⊗ M, S)`,
`s ⊗ f ↦ (t ⊗ m ↦ st f(m))`, for finitely generated projective `M` (no flatness). -/
theorem dual_baseChange (S : Type u) [CommRing S] [Algebra R S]
    (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    ∃ e : (S ⊗[R] Module.Dual R M) ≃ₗ[S] Module.Dual S (S ⊗[R] M),
      ∀ (s t : S) (f : Module.Dual R M) (m : M),
        e (s ⊗ₜ[R] f) (t ⊗ₜ[R] m) = s * t * algebraMap R S (f m) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/constant-rank-top-invertible`: if `P` has constant rank `n`, then
`⋀ⁿP` is invertible (`Module.Invertible`); for `n = 0` it is `R`. -/
theorem topExterior_invertible (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ)
    (hn : ∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) M p = n) :
    Module.Invertible R (⋀[R]^n M) := by
  sorry

end Exterior

/-! #### `KTheoryLowDegrees:Z.3/total-lambda` and `KTheoryLowDegrees:Z.3/lambda` -/

section Lambda

variable (R : Type u) [CommRing R]

/-- **The total exterior operation** (`KTheoryLowDegrees:Z.3/total-lambda`):
`λ_t : K₀(R) → (1 + tK₀(R)[[t]])ˣ`, the homomorphism from `(K₀(R), +)` to the units of the
power-series ring with `λ_t([P]) = Σ [⋀ⁿP] tⁿ` (a real definition through `lift`). -/
def lambdaTotal : K0 R →+ Additive (PowerSeries (K0 R))ˣ :=
  lift R (fun (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
      [Module.Projective R P] =>
    Additive.ofMul (LambdaRing.unitOfConstOne (PowerSeries.mk fun n => cls R (⋀[R]^n P))
      (by sorry))) (by sorry) (by sorry)

/-- The underlying power series `λ_t(x)`. -/
abbrev lambdaSeries (x : K0 R) : PowerSeries (K0 R) :=
  ((Additive.toMul (lambdaTotal R x) : (PowerSeries (K0 R))ˣ) : PowerSeries (K0 R))

/-- `KTheoryLowDegrees:Z.3/total-lambda-constant`: every `λ_t(x)` has constant coefficient `1`. -/
@[simp]
theorem lambdaTotal_constant (x : K0 R) :
    PowerSeries.coeff 0 (lambdaSeries R x) = 1 := by sorry

/-- `KTheoryLowDegrees:Z.3/total-lambda-of`: the coefficient of `tⁿ` in `λ_t([P])` is `[⋀ⁿP]`. -/
@[simp]
theorem lambdaTotal_of (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ) :
    PowerSeries.coeff n (lambdaSeries R (cls R M)) = cls R (⋀[R]^n M) := by sorry

/-- An additive-to-multiplicative map with the values `[⋀ⁿP]` on classes is `λ_t`. -/
theorem lambdaTotal_unique (f : K0 R →+ Additive (PowerSeries (K0 R))ˣ)
    (hf : ∀ (M : Type u) [AddCommGroup M] [Module R M]
      [Module.Finite R M] [Module.Projective R M],
      ∀ n, PowerSeries.coeff n (Additive.toMul (f (cls R M))).val = cls R (⋀[R]^n M)) :
    f = lambdaTotal R := by sorry

/-- `λ_t(x + y) = λ_t(x) λ_t(y)` and `λ_t(-x) = λ_t(x)⁻¹`. -/
theorem lambdaTotal_add (x y : K0 R) :
    lambdaSeries R (x + y) = lambdaSeries R x * lambdaSeries R y ∧
      Additive.toMul (lambdaTotal R (-x)) = (Additive.toMul (lambdaTotal R x))⁻¹ := by
  sorry

-- test TauCeti.RingK0.lambdaTotal_zero_test (degenerate)
example : lambdaSeries R 0 = 1 := by sorry

-- test TauCeti.RingK0.lambdaTotal_unit_test (computation)
example : lambdaSeries R 1 = 1 + PowerSeries.X := by sorry

-- test TauCeti.RingK0.lambdaTotal_neg_unit_test (computation)
example (n : ℕ) : PowerSeries.coeff n (lambdaSeries R (-1)) = (-1 : K0 R) ^ n := by sorry

-- test TauCeti.RingK0.lambdaTotal_two_test (non-example)
/- `λ_t(2[R]) = 1 + 2t + t²`, not `1 + 2t`: the `t²` coefficient is `[⋀²R²] = [R] ≠ 0`. -/
example [Nontrivial R] :
    lambdaSeries R 2 = 1 + 2 * PowerSeries.X + PowerSeries.X ^ 2 ∧
      lambdaSeries R 2 ≠ 1 + 2 * PowerSeries.X := by
  sorry

/-- **The λ-operations on `K₀(R)`** (`KTheoryLowDegrees:Z.3/lambda`):
`λⁿ(x) := coeffₙ(λ_t(x))`. -/
def lambda (n : ℕ) (x : K0 R) : K0 R := PowerSeries.coeff n (lambdaSeries R x)

/-- `KTheoryLowDegrees:Z.3/lambda-zero`: `λ⁰(x) = 1`. -/
@[simp]
theorem lambda_zero (x : K0 R) : lambda R 0 x = 1 := lambdaTotal_constant R x

/-- `KTheoryLowDegrees:Z.3/lambda-one`: `λ¹(x) = x`. -/
@[simp]
theorem lambda_one (x : K0 R) : lambda R 1 x = x := by sorry

/-- `KTheoryLowDegrees:Z.3/lambda-of`: `λⁿ([P]) = [⋀ⁿP]`. -/
theorem lambda_of (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ) :
    lambda R n (cls R M) = cls R (⋀[R]^n M) := lambdaTotal_of R M n

-- test TauCeti.RingK0.lambda_line_test (compatibility)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    lambda R 1 (cls R L) = cls R L ∧ ∀ n, 2 ≤ n → lambda R n (cls R L) = 0 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/lambda-add`: `λⁿ(x + y) = Σ_{i=0}^{n} λⁱ(x) λ^{n-i}(y)`. -/
theorem lambda_add (n : ℕ) (x y : K0 R) :
    lambda R n (x + y) = ∑ i ∈ Finset.range (n + 1), lambda R i x * lambda R (n - i) y := by
  sorry

/-- `KTheoryLowDegrees:Z.3/lambda-free`: `λⁿ(m[R]) = C(m, n)[R]`. -/
theorem lambda_natCast (m n : ℕ) : lambda R n (m : K0 R) = (m.choose n : K0 R) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/lambda-free`: `λⁿ(-m[R]) = (-1)ⁿ C(m + n - 1, n)[R]`. -/
theorem lambda_neg_natCast (m n : ℕ) :
    lambda R n (-(m : K0 R)) = (-1) ^ n * ((m + n - 1).choose n : K0 R) := by
  sorry

-- Acceptance of `Z.3/lambda-free`: `λ²(-2[R]) = 3[R]` (`C(-2, 2) = 3`).
example : lambda R 2 (-(2 : K0 R)) = 3 := by
  rw [show (2 : K0 R) = ((2 : ℕ) : K0 R) by norm_num, lambda_neg_natCast]
  norm_num [Nat.choose]

-- test TauCeti.RingK0.lambda_rank_two_test (computation)
example : lambda R 2 (2 : K0 R) = 1 ∧ lambda R 3 (2 : K0 R) = 0 := by
  rw [show (2 : K0 R) = ((2 : ℕ) : K0 R) by norm_num, lambda_natCast, lambda_natCast]
  norm_num [Nat.choose]

-- test TauCeti.RingK0.lambda_neg_unit_test (non-example)
/- `λ²(-[R]) = [R]` although `-[R]` has negative rank. -/
example : lambda R 2 (-1 : K0 R) = 1 := by
  rw [show (-1 : K0 R) = -((1 : ℕ) : K0 R) by norm_num, lambda_neg_natCast]
  norm_num [Nat.choose]

-- test TauCeti.RingK0.lambda_zero_class_test (degenerate)
example (n : ℕ) : lambda R (n + 1) 0 = 0 := by
  rw [show (0 : K0 R) = ((0 : ℕ) : K0 R) by norm_num, lambda_natCast]
  simp

end Lambda

/-! #### `KTheoryLowDegrees:Z.3/rank-ring-hom`, `Z.3/map-ring-hom`, `Z.3/rank-lambda`,
`Z.3/lambda-base-change` -/

section RankMap

variable (R : Type u) [CommRing R]

/-- `KTheoryLowDegrees:Z.3/rank-ring-hom`: the rank is a ring homomorphism
`K₀(R) →+* H⁰(Spec R, ℤ)` (a real definition over the stand-in `rank`). -/
def rankRingHom : K0 R →+* LocallyConstant (PrimeSpectrum R) ℤ :=
  { rank R with
    map_one' := by sorry
    map_mul' := by sorry }

/-- `rank(xy) = rank(x) · rank(y)` (`KTheoryLowDegrees:Z.3/rank-ring-hom`). -/
theorem rank_mul (x y : K0 R) : rank R (x * y) = rank R x * rank R y := by
  sorry

/-- `rank(1) = 1`. -/
theorem rank_one : rank R 1 = 1 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/map-ring-hom`: scalar extension is a ring homomorphism on `K₀`. -/
def mapRingHom {S : Type u} [CommRing S] (f : R →+* S) : K0 R →+* K0 S :=
  { map R f with
    map_one' := by sorry
    map_mul' := by sorry }

/-- `map f (xy) = map f x · map f y` and `rank_S(map f x) = rank_R(x) ∘ Spec f`. -/
theorem map_mul {S : Type u} [CommRing S] (f : R →+* S) (x y : K0 R) :
    map R f (x * y) = map R f x * map R f y ∧
      rank S (map R f x) =
        (rank R x).comap ⟨PrimeSpectrum.comap f, PrimeSpectrum.continuous_comap f⟩ := by
  sorry

-- Acceptance of `Z.3/rank-ring-hom` on free modules: `rank [R³] = 3` at every prime.
example [Nontrivial R] (p : PrimeSpectrum R) : rank R (cls R (Fin 3 → R)) p = 3 := by
  rw [rank_of, Module.rankAtStalk_eq_finrank_of_free, Module.finrank_fin_fun]
  norm_num

/-- `KTheoryLowDegrees:Z.3/rank-lambda`: `rank(λⁿx)(p) = C(rank(x)(p), n)` (`Ring.choose`), i.e.
`rank` is a pre-λ-homomorphism to the binomial pre-λ-ring `H⁰(Spec R, ℤ)`. -/
theorem rank_lambda (x : K0 R) (n : ℕ) (p : PrimeSpectrum R) :
    rank R (lambda R n x) p = Ring.choose (rank R x p) n := by
  sorry

/-- `KTheoryLowDegrees:Z.3/lambda-base-change`: `map f (λⁿ x) = λⁿ (map f x)`. -/
theorem map_lambda {S : Type u} [CommRing S] (f : R →+* S) (n : ℕ) (x : K0 R) :
    map R f (lambda R n x) = lambda S n (map R f x) := by
  sorry

end RankMap

/-! #### `KTheoryLowDegrees:Z.3/ring-k0-pre-lambda` -/

section PreLambda

variable (R : Type u) [CommRing R]

open LambdaRing in
/-- **`K₀(R)` as a pre-λ-ring** (`TauCeti.RingK0.instPreLambdaRing`), with `λ_t = lambdaTotal`. -/
instance instPreLambdaRing : PreLambdaRing (K0 R) where
  lambda := lambda R
  lambda_zero' := lambda_zero R
  lambda_one' := lambda_one R
  lambda_add' := lambda_add R

/-- The total operation of the instance is `RingK0.lambdaTotal`. -/
theorem lambdaTotal_eq (x : K0 R) : LambdaRing.lambdaTotal x = lambdaTotal R x := by
  sorry

/-- The class operations are the pre-λ-ring operations. -/
@[simp]
theorem preLambda_lambda (n : ℕ) (x : K0 R) : PreLambdaRing.lambda n x = lambda R n x :=
  rfl

/-- `λ^k(1) = 0` for `k ≥ 2`: `1 = [R]` is a line element. -/
@[simp]
theorem lambda_one_class (k : ℕ) (hk : 2 ≤ k) : lambda R k 1 = 0 := by
  sorry

/-- `[L]` is a line element for every invertible `L`. -/
theorem isLineElement_of_invertible (L : Type u) [AddCommGroup L] [Module R L]
    [Module.Invertible R L] : LambdaRing.IsLineElement (cls R L) := by
  sorry

/-- `rank` is a pre-λ-homomorphism to `LocallyConstant (PrimeSpectrum R) ℤ`. -/
theorem rank_isLambdaHom (n : ℕ) (x : K0 R) :
    rankRingHom R (lambda R n x) = PreLambdaRing.lambda n (rankRingHom R x) := by
  sorry

/-- `RingK0.map f` is a pre-λ-homomorphism. -/
theorem map_isLambdaHom {S : Type u} [CommRing S] (f : R →+* S) (n : ℕ) (x : K0 R) :
    mapRingHom R f (PreLambdaRing.lambda n x) = PreLambdaRing.lambda n (mapRingHom R f x) := by
  sorry

/-- `λ^k([P] - n[R]) = Σ_i (-1)^i C(n + i - 1, i) [⋀^{k-i}P]` (Weibel Ex. II.4.1). -/
theorem lambda_sub_nsmul (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] (n k : ℕ) :
    lambda R k (cls R P - (n : K0 R)) =
      ∑ i ∈ Finset.range (k + 1), (-1) ^ i * ((n + i - 1).choose i : K0 R) *
        cls R (⋀[R]^(k - i) P) := by
  sorry

-- test TauCeti.RingK0.preLambda_rank_two_test (computation)
example : lambda R 2 (2 : K0 R) = 1 ∧ lambda R 2 (-(2 : K0 R)) = 3 := by
  rw [show (2 : K0 R) = ((2 : ℕ) : K0 R) by norm_num, lambda_natCast, lambda_neg_natCast]
  norm_num [Nat.choose]

-- test TauCeti.RingK0.preLambda_zero_ring_test (degenerate)
example [Subsingleton R] : Subsingleton (K0 R) := by
  sorry

-- test TauCeti.RingK0.preLambda_field_test (compatibility)
/- For a field `k`, `divisionRingEquiv : K₀(k) ≃+ ℤ` is a pre-λ-isomorphism onto the binomial
ring `ℤ`. -/
example (k : Type u) [Field k] (n : ℕ) (x : K0 k) :
    divisionRingEquiv k (lambda k n x) = PreLambdaRing.lambda n (divisionRingEquiv k x) := by
  sorry

-- test TauCeti.RingK0.preLambda_not_truncated_test (non-example)
/- Setting `λ^k := 0` for `k ≥ 2` is not the λ-structure: `λ²[R²] = [R] ≠ 0` for `R ≠ 0`. -/
example [Nontrivial R] : lambda R 2 (cls R (Fin 2 → R)) = 1 ∧ (1 : K0 R) ≠ 0 := by
  sorry

-- test TauCeti.PreLambdaRing.ringK0_test (compatibility)
/- `K₀(R)` with `Z.3/lambda` is a pre-λ-ring and `rank` is a homomorphism to the binomial
pre-λ-ring `H⁰(Spec R, ℤ)`. -/
example : (∀ (n : ℕ) (x y : K0 R), PreLambdaRing.lambda n (x + y) =
      ∑ i ∈ Finset.range (n + 1), PreLambdaRing.lambda i x * PreLambdaRing.lambda (n - i) y) ∧
    ∀ (n : ℕ) (x : K0 R),
      rankRingHom R (PreLambdaRing.lambda n x) = PreLambdaRing.lambda n (rankRingHom R x) :=
  ⟨PreLambdaRing.lambda_add', rank_isLambdaHom R⟩

-- test TauCeti.LambdaRing.locallyConstant_two_points_test (compatibility)
/- For `R = k × k`, `rank : K₀(k × k) → H⁰ = ℤ²` is a pre-λ-isomorphism (Z.2/k0-field-product
with Z.3/rank-lambda). -/
example (k : Type u) [Field k] :
    Function.Bijective (rankRingHom (k × k)) ∧
      ∀ (n : ℕ) (x : K0 (k × k)), rankRingHom (k × k) (lambda (k × k) n x) =
        PreLambdaRing.lambda n (rankRingHom (k × k) x) := by
  sorry

end PreLambda

/-! #### `KTheoryLowDegrees:Z.3/gamma` on `K₀(R)` -/

section GammaK0

variable (R : Type u) [CommRing R]

/-- `TauCeti.RingK0.gamma_ringK0`: on `K₀(R)`, `γⁿ(x) = λⁿ(x + (n - 1)[R])` for `n ≥ 1`. -/
theorem gamma_ringK0 (n : ℕ) (hn : 1 ≤ n) (x : K0 R) :
    LambdaRing.gamma n x = lambda R n (x + ((n - 1 : ℕ) : K0 R)) := by
  sorry

-- test TauCeti.RingK0.gamma_unit_test (computation)
example (n : ℕ) (hn : 1 ≤ n) : LambdaRing.gamma n (1 : K0 R) = 1 := by
  rw [gamma_ringK0 R n hn, show (1 : K0 R) + ((n - 1 : ℕ) : K0 R) = ((n : ℕ) : K0 R) by
    rw [← Nat.cast_one, ← Nat.cast_add]; congr 1; omega, lambda_natCast, Nat.choose_self,
    Nat.cast_one]

-- test TauCeti.RingK0.gamma_neg_unit_test (non-example)
/- `γ_t(-[R]) = 1 - [R]t`, so `γ²(-[R]) = 0` whereas `λ²(-[R]) = [R]`: `γⁿ ≠ λⁿ`. -/
example [Nontrivial R] :
    LambdaRing.gamma 2 (-1 : K0 R) = 0 ∧ lambda R 2 (-1 : K0 R) = 1 ∧
      ((Additive.toMul (LambdaRing.gammaTotal (-1 : K0 R)) : (PowerSeries (K0 R))ˣ) :
        PowerSeries (K0 R)) = 1 - PowerSeries.X := by
  sorry

-- test TauCeti.RingK0.gamma_line_test (characterisation)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    (∀ k, 1 ≤ k → LambdaRing.gamma k (cls R L) = cls R L) ∧
      ∀ k, 2 ≤ k → LambdaRing.gamma k (cls R L - 1) = 0 := by
  sorry

end GammaK0

/-! #### `KTheoryLowDegrees:Z.3/augmentation` and `Z.3/rank-section-lambda` -/

section Augmentation

variable (R : Type u) [CommRing R]

/-- **The augmentation ideal** `I_R = ker(rank) = K̃₀(R)` (`TauCeti.RingK0.augmentationIdeal`). -/
def augmentationIdeal : Ideal (K0 R) := RingHom.ker (rankRingHom R)

variable {R}

/-- `KTheoryLowDegrees:Z.3/augmentation-membership`: `x ∈ I_R ↔ rank x = 0`. -/
theorem mem_augmentationIdeal (x : K0 R) : x ∈ augmentationIdeal R ↔ rank R x = 0 :=
  Iff.rfl

/-- `x - rankSection(rank x) ∈ I_R`. -/
theorem sub_rankSection_mem (x : K0 R) : x - rankSection R (rank R x) ∈ augmentationIdeal R := by
  sorry

/-- For `P` of constant rank `n`, `[P] - n[R] ∈ I_R`. -/
theorem of_sub_mem_augmentationIdeal (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] (n : ℕ)
    (hP : ∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) P p = n) :
    cls R P - (n : K0 R) ∈ augmentationIdeal R := by
  sorry

/-- `λⁿ(I_R) ⊆ I_R` for `n ≥ 1` (`KTheoryLowDegrees:Z.3/rank-lambda`). -/
instance augmentationIdeal_isLambdaIdeal : LambdaRing.IsLambdaIdeal (augmentationIdeal R) := by
  sorry

variable (R)

/-- `KTheoryLowDegrees:Z.3/rank-section-lambda`: `rankSection` is a ring homomorphism and a
pre-λ-homomorphism from the binomial pre-λ-ring: `λ^k(rankSection f) = rankSection(C(f, k))`. -/
theorem rankSection_lambda (f g : LocallyConstant (PrimeSpectrum R) ℤ) (k : ℕ) :
    rankSection R (f * g) = rankSection R f * rankSection R g ∧ rankSection R 1 = 1 ∧
      lambda R k (rankSection R f) = rankSection R (PreLambdaRing.lambda k f) := by
  sorry

-- test TauCeti.RingK0.augmentation_zero_test (degenerate)
example : (0 : K0 R) ∈ augmentationIdeal R ∧
    (Subsingleton R → augmentationIdeal R = ⊤) := by
  sorry

-- test TauCeti.RingK0.augmentation_unit_test (non-example)
/- `[R] ∉ I_R` for `R ≠ 0`; and for `R = k × k`, `[k × 0] - [0 × k] ∉ I_R` although its "total
rank" `1 - 1` is `0`. -/
example [Nontrivial R] : (1 : K0 R) ∉ augmentationIdeal R := by sorry

example (k : Type u) [Field k] :
    cls (k × k) (fstLine k) - cls (k × k) (sndLine k) ∉
      augmentationIdeal (k × k) := by
  sorry

-- test TauCeti.RingK0.augmentation_line_test (compatibility)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    cls R L - 1 ∈ augmentationIdeal R := by sorry

-- test TauCeti.RingK0.augmentation_field_test (computation)
example (k : Type u) [Field k] : augmentationIdeal k = ⊥ := by sorry

/-- The ring homomorphism underlying `rankSection` (helper for the augmentation). -/
def rankSectionRingHom : LocallyConstant (PrimeSpectrum R) ℤ →+* K0 R :=
  { rankSection R with
    map_one' := by sorry
    map_mul' := by sorry }

/-- **`K₀(R)` as an augmented pre-λ-ring** (`TauCeti.RingK0.augmentation`,
`KTheoryLowDegrees:Z.3/ring-k0-augmented`): `(K₀(R), H⁰(Spec R, ℤ), rankSection, rank)`. -/
def augmentation : LambdaRing.Augmentation (K0 R) (LocallyConstant (PrimeSpectrum R) ℤ) where
  ι := ⟨rankSectionRingHom R, by sorry⟩
  ε := ⟨rankRingHom R, by sorry⟩
  ε_ι := by sorry

/-- `ε = rank`. -/
@[simp]
theorem augmentation_ε : (augmentation R).ε.toRingHom = rankRingHom R :=
  rfl

/-- `ι = rankSection`. -/
@[simp]
theorem augmentation_ι : (augmentation R).ι.toRingHom = rankSectionRingHom R :=
  rfl

/-- The augmentation ideal of `augmentation R` is `I_R`. -/
theorem augmentationIdeal_eq :
    LambdaRing.augmentationIdeal (augmentation R) = augmentationIdeal R :=
  rfl

-- test TauCeti.LambdaRing.augmentation_ringK0_test (compatibility)
example : LambdaRing.augmentationIdeal (augmentation R) = augmentationIdeal R :=
  augmentationIdeal_eq R

-- test TauCeti.RingK0.augmented_field_test (degenerate)
example (k : Type u) [Field k] :
    Function.Bijective (augmentation k).ε.toRingHom ∧
      LambdaRing.augmentationIdeal (augmentation k) = ⊥ := by
  sorry

-- test TauCeti.RingK0.augmented_two_points_test (computation)
example (k : Type u) [Field k] :
    Function.Bijective (augmentation (k × k)).ε.toRingHom ∧
      LambdaRing.augmentationIdeal (augmentation (k × k)) = ⊥ := by
  sorry

-- test TauCeti.RingK0.augmented_total_rank_test (non-example)
/- The integer "total rank" `x ↦ Σ_p rank x p` is not multiplicative on `K₀(k × k)`:
`[k × 0] · [0 × k] = 0` has total rank `0`, the product of the total ranks is `1`. -/
example (k : Type u) [Field k] (p q : PrimeSpectrum (k × k)) (hpq : p ≠ q)
    (hall : ∀ r : PrimeSpectrum (k × k), r = p ∨ r = q) :
    let e₁ := cls (k × k) (fstLine k)
    let e₂ := cls (k × k) (sndLine k)
    rank (k × k) (e₁ * e₂) p + rank (k × k) (e₁ * e₂) q = 0 ∧
      (rank (k × k) e₁ p + rank (k × k) e₁ q) * (rank (k × k) e₂ p + rank (k × k) e₂ q) = 1 := by
  sorry

end Augmentation

end TauCeti.RingK0

/-! ### Local Picard-group facts
(`Z.3/projective-sheaf-condition` … `Z.3/pic-locally-constant-power`) -/

namespace TauCeti.PicardGroup

variable {R : Type u} [CommRing R]

/-- `KTheoryLowDegrees:Z.3/projective-sheaf-condition`, elementwise: for `s₁, …, s_c` generating
the unit ideal, `M → ∏ M[1/s_a]` is injective, and a family `m_a / s_a^k` compatible on the
overlaps `D(s_a s_b)` glues to a unique `x ∈ M`. -/
theorem projective_sheaf_condition (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M]
    [Module.Projective R M] {c : ℕ} (s : Fin c → R) (hs : Ideal.span (Set.range s) = ⊤) :
    (∀ m : M, (∀ a, ∃ n : ℕ, s a ^ n • m = 0) → m = 0) ∧
      ∀ (m : Fin c → M) (k : ℕ),
        (∀ a b, ∃ N : ℕ, (s a * s b) ^ N • (s b ^ k • m a - s a ^ k • m b) = 0) →
          ∃! x : M, ∀ a, ∃ N : ℕ, s a ^ N • (s a ^ k • x - m a) = 0 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/invertible-local-iso`, frame form: if `D[1/s_a]` and `E[1/s_a]` are
generated by `d_a` and `e_a` with the same transition elements
`d_a = (u_ab / (s_a s_b)^k) d_b`, `e_a = (u_ab / (s_a s_b)^k) e_b` on `D(s_a s_b)`, then
`D ≅ E` by `d_a ↦ e_a`; in particular `Pic.mk D = Pic.mk E`. -/
theorem invertible_local_iso (D E : Type u) [AddCommGroup D] [Module R D] [Module.Invertible R D]
    [AddCommGroup E] [Module R E] [Module.Invertible R E] {c : ℕ} (s : Fin c → R)
    (hs : Ideal.span (Set.range s) = ⊤) (d : Fin c → D) (e : Fin c → E)
    (hd : ∀ a (x : D), ∃ (n : ℕ) (r : R), s a ^ n • x = r • d a)
    (he : ∀ a (y : E), ∃ (n : ℕ) (r : R), s a ^ n • y = r • e a)
    (w : Fin c → Fin c → R) (k : ℕ)
    (hw : ∀ a b, ∃ N : ℕ, (s a * s b) ^ N • ((s a * s b) ^ k • d a - w a b • d b) = 0 ∧
      (s a * s b) ^ N • ((s a * s b) ^ k • e a - w a b • e b) = 0) :
    ∃ φ : D ≃ₗ[R] E, ∀ a, ∃ N : ℕ, s a ^ N • (φ (d a) - e a) = 0 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/pic-product-decomposition`: for complete orthogonal idempotents `e_i`,
`Pic(R) → ∏ Pic(R ⧸ (1 - e_i))`, `L ↦ (R_i ⊗ L)_i`, is bijective (a group isomorphism). -/
theorem bijective_mapRingHom_pi {c : ℕ} (e : Fin c → R) (he : CompleteOrthogonalIdempotents e) :
    Function.Bijective (fun (L : CommRing.Pic R) (i : Fin c) =>
      CommRing.Pic.mapRingHom (Ideal.Quotient.mk (Ideal.span {1 - e i})) L) := by
  sorry

-- Acceptance of `Z.3/pic-product-decomposition`: `Pic(k × k) = 1`.
example (k : Type u) [Field k] : Subsingleton (CommRing.Pic (k × k)) := by
  sorry

/-- Helper (not a packet name): the idempotent of a clopen subset of `Spec R`
(`PrimeSpectrum.isIdempotentElemEquivClopens`). -/
def clopenIdempotent (U : TopologicalSpace.Clopens (PrimeSpectrum R)) : R :=
  (PrimeSpectrum.isIdempotentElemEquivClopens.symm U).1

/-- Helper (not a packet name): the class `L_e` equal to `L` on `D(e)` and trivial on `D(1 - e)`,
represented by `eL × (1 - e)R`. -/
def restrictIdempotent (e : R) (L : CommRing.Pic R) : Type u :=
  ↥((Ideal.span {e}) • (⊤ : Submodule R L)) × ↥(Ideal.span {1 - e})

instance (e : R) (L : CommRing.Pic R) : AddCommGroup (restrictIdempotent e L) :=
  inferInstanceAs (AddCommGroup (↥((Ideal.span {e}) • (⊤ : Submodule R L)) ×
    ↥(Ideal.span {1 - e})))

instance (e : R) (L : CommRing.Pic R) : Module R (restrictIdempotent e L) :=
  inferInstanceAs (Module R (↥((Ideal.span {e}) • (⊤ : Submodule R L)) ×
    ↥(Ideal.span {1 - e})))

/-- Helper instance (a true fact for idempotent `e`, proof omitted). -/
instance restrictIdempotent_invertible (e : R) (L : CommRing.Pic R) :
    Module.Invertible R (restrictIdempotent e L) := by
  sorry

/-- **`L^f` for a locally constant exponent** (`TauCeti.PicardGroup.zpowLocallyConstant`,
`KTheoryLowDegrees:Z.3/pic-locally-constant-power`): `L^f = ∏_{n ∈ f(Spec R)} (L^n)_{e_n}`, with
`e_n` the idempotent of the clopen `f⁻¹(n)` (a real definition). -/
def zpowLocallyConstant (L : CommRing.Pic R) (f : LocallyConstant (PrimeSpectrum R) ℤ) :
    CommRing.Pic R :=
  ∏ n ∈ f.range_finite.toFinset,
    CommRing.Pic.mk R (restrictIdempotent
      (clopenIdempotent ⟨f ⁻¹' {n}, f.isLocallyConstant.isClopen_fiber n⟩) (L ^ n))

/-- `L^{const n} = L^n`. -/
@[simp]
theorem zpowLocallyConstant_const (L : CommRing.Pic R) (n : ℤ) :
    zpowLocallyConstant L (LocallyConstant.const (PrimeSpectrum R) n) = L ^ n := by
  sorry

/-- `L^{f+g} = L^f L^g`. -/
@[simp]
theorem zpowLocallyConstant_add (L : CommRing.Pic R) (f g : LocallyConstant (PrimeSpectrum R) ℤ) :
    zpowLocallyConstant L (f + g) = zpowLocallyConstant L f * zpowLocallyConstant L g := by
  sorry

/-- `L^{fg} = (L^f)^g`. -/
@[simp]
theorem zpowLocallyConstant_mul (L : CommRing.Pic R) (f g : LocallyConstant (PrimeSpectrum R) ℤ) :
    zpowLocallyConstant L (f * g) = zpowLocallyConstant (zpowLocallyConstant L f) g := by
  sorry

/-- `(LM)^f = L^f M^f`. -/
@[simp]
theorem mul_zpowLocallyConstant (L M : CommRing.Pic R) (f : LocallyConstant (PrimeSpectrum R) ℤ) :
    zpowLocallyConstant (L * M) f = zpowLocallyConstant L f * zpowLocallyConstant M f := by
  sorry

/-- **`Pic(R)` as an `H⁰(Spec R, ℤ)`-module** (`TauCeti.PicardGroup.module`):
`f • ofMul L = ofMul (L^f)` (a real definition; the axioms are the four identities above). -/
instance module : Module (LocallyConstant (PrimeSpectrum R) ℤ) (Additive (CommRing.Pic R)) where
  smul f a := Additive.ofMul (zpowLocallyConstant (Additive.toMul a) f)
  one_smul := by sorry
  mul_smul := by sorry
  smul_zero := by sorry
  smul_add := by sorry
  add_smul := by sorry
  zero_smul := by sorry

/-- `mapRingHom f (L^g) = (mapRingHom f L)^{g ∘ Spec f}`. -/
theorem zpowLocallyConstant_map {S : Type u} [CommRing S] (f : R →+* S) (L : CommRing.Pic R)
    (g : LocallyConstant (PrimeSpectrum R) ℤ) :
    CommRing.Pic.mapRingHom f (zpowLocallyConstant L g) =
      zpowLocallyConstant (CommRing.Pic.mapRingHom f L)
        (g.comap ⟨PrimeSpectrum.comap f, PrimeSpectrum.continuous_comap f⟩) := by
  sorry

-- test TauCeti.PicardGroup.zpow_const_test (computation)
/- For `I = (2, 1 + √-5) ⊂ ℤ[√-5]`: `[I]^{const 2} = [I²] = 1`. -/
example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I] :
    zpowLocallyConstant (CommRing.Pic.mk (ℤ√(-5)) I)
      (LocallyConstant.const (PrimeSpectrum (ℤ√(-5))) 2) = 1 := by
  sorry

-- test TauCeti.PicardGroup.zpow_zero_test (degenerate)
example (L : CommRing.Pic R) (f : LocallyConstant (PrimeSpectrum R) ℤ) :
    zpowLocallyConstant L 0 = 1 ∧ zpowLocallyConstant 1 f = 1 := by
  sorry

-- test TauCeti.PicardGroup.zpow_indicator_test (characterisation)
/- For `R = R₁ × R₂` and `f = (1, 0)`: `(L₁, L₂)^f = (L₁, 1)`. -/
example (R₁ R₂ : Type u) [CommRing R₁] [CommRing R₂] (L : CommRing.Pic (R₁ × R₂))
    (U : TopologicalSpace.Clopens (PrimeSpectrum (R₁ × R₂)))
    (hU : clopenIdempotent U = ((1 : R₁), (0 : R₂))) :
    CommRing.Pic.mapRingHom (RingHom.fst R₁ R₂) (zpowLocallyConstant L
        (LocallyConstant.charFn ℤ U.isClopen)) = CommRing.Pic.mapRingHom (RingHom.fst R₁ R₂) L ∧
      CommRing.Pic.mapRingHom (RingHom.snd R₁ R₂) (zpowLocallyConstant L
        (LocallyConstant.charFn ℤ U.isClopen)) = 1 := by
  sorry

-- test TauCeti.PicardGroup.zpow_not_integer_test (non-example)
/- On `R = A × A` with `Pic(A) ≠ 1` and `f = (1, 2)`, `L^f` need not be `L^n` for any `n ∈ ℤ`. -/
example (A : Type u) [CommRing A] (hA : ∃ M : CommRing.Pic A, M ^ 2 ≠ M) :
    ∃ (L : CommRing.Pic (A × A)) (f : LocallyConstant (PrimeSpectrum (A × A)) ℤ),
      ∀ n : ℤ, zpowLocallyConstant L f ≠ L ^ n := by
  sorry

end TauCeti.PicardGroup

/-! ### The determinant (`Z.3/determinant-projective` … `Z.3/gamma-first-graded`) -/

namespace TauCeti.RingK0

open TauCeti.PicardGroup

section Determinant

variable (R : Type u) [CommRing R]

/-- Helper (not a packet name): the clopen rank fibre `{p : rankAtStalk P p = n}`. -/
def rankFibre (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] (n : ℕ) : TopologicalSpace.Clopens (PrimeSpectrum R) :=
  ⟨Module.rankAtStalk (R := R) P ⁻¹' {n}, by sorry⟩

/-- Helper (not a packet name): **the componentwise top exterior power**
`∏_{n ∈ rank(P)} e_n · ⋀ⁿP`, `e_n` the idempotent of the rank fibre `{rank P = n}`. -/
def detModule (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] : Type u :=
  ∀ n : Set.range (Module.rankAtStalk (R := R) P),
    ↥((Ideal.span {clopenIdempotent (rankFibre R P n.1)}) • (⊤ : Submodule R (⋀[R]^n.1 P)))

section
variable (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P]

instance : AddCommGroup (detModule R P) :=
  inferInstanceAs (AddCommGroup (∀ n : Set.range (Module.rankAtStalk (R := R) P),
    ↥((Ideal.span {clopenIdempotent (rankFibre R P n.1)}) • (⊤ : Submodule R (⋀[R]^n.1 P)))))

instance : Module R (detModule R P) :=
  inferInstanceAs (Module R (∀ n : Set.range (Module.rankAtStalk (R := R) P),
    ↥((Ideal.span {clopenIdempotent (rankFibre R P n.1)}) • (⊤ : Submodule R (⋀[R]^n.1 P)))))

/-- Helper instance (a true fact, proof omitted): the componentwise top exterior power is
invertible (`Z.3/constant-rank-top-invertible` on each rank fibre). -/
instance detModule_invertible : Module.Invertible R (detModule R P) := by
  sorry
end

/-- **The componentwise determinant** (`TauCeti.RingK0.detProjective`,
`KTheoryLowDegrees:Z.3/determinant-projective`):
`det(P) = Pic.mk(∏_i ⋀^{n_i} P_i)` along the rank fibres (a real definition). -/
def detProjective (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] : CommRing.Pic R :=
  CommRing.Pic.mk R (detModule R P)

/-- `KTheoryLowDegrees:Z.3/determinant-congr`: `P ≃ₗ Q → det P = det Q`. -/
theorem detProjective_congr (M N : Type u)
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N]
    (e : M ≃ₗ[R] N) : detProjective R M = detProjective R N := by sorry

/-- `KTheoryLowDegrees:Z.3/determinant-free`: `det P = 1` for finite free `P`. -/
@[simp]
theorem detProjective_free (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Free R M] : detProjective R M = 1 := by sorry

/-- `KTheoryLowDegrees:Z.3/determinant-line`: `det L = Pic.mk L` for invertible `L`. -/
theorem detProjective_line (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Invertible R M] : detProjective R M = CommRing.Pic.mk R M := by sorry

/-- `KTheoryLowDegrees:Z.3/determinant-sum`: `det(P × Q) = det P · det Q`. -/
theorem detProjective_prod (M N : Type u)
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] :
    detProjective R (M × N) = detProjective R M * detProjective R N := by sorry

/-- For `P` of constant rank `n`, `det P = Pic.mk(⋀ⁿP)`. -/
theorem detProjective_of_constant_rank (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] (n : ℕ)
    (hn : ∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) P p = n) :
    haveI := topExterior_invertible R P n hn
    detProjective R P = CommRing.Pic.mk R (⋀[R]^n P) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/determinant-base-change` on modules:
`det(S ⊗ P) = mapAlgebra (det P)`. -/
theorem detProjective_baseChange (S : Type u) [CommRing S] [Algebra R S] (P : Type u)
    [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P] :
    detProjective S (S ⊗[R] P) = CommRing.Pic.mapAlgebra R S (detProjective R P) := by
  sorry

-- test TauCeti.RingK0.detProjective_zero_test (degenerate)
example : detProjective R (Fin 0 → R) = 1 := by sorry

-- test TauCeti.RingK0.detProjective_free_test (computation)
example (n : ℕ) : detProjective R (Fin n → R) = 1 := detProjective_free R _

-- test TauCeti.RingK0.detProjective_ideal_test (computation)
/- For `R = ℤ[√-5]` and `I = (2, 1 + √-5)`: `det(I ⊕ R) = Pic.mk I ≠ 1`. -/
example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I] :
    detProjective (ℤ√(-5)) (I × ℤ√(-5)) = CommRing.Pic.mk (ℤ√(-5)) I ∧
      CommRing.Pic.mk (ℤ√(-5)) I ≠ 1 := by
  sorry

-- test TauCeti.RingK0.detProjective_disconnected_test (non-example)
/- For `R = k × k` and `P = k × k²` (ranks `1` and `2`): `det P = 1`, while
`⋀^{max rank} P = ⋀²P = 0 × k` is not invertible. -/
example (k : Type u) [Field k] :
    detProjective (k × k) (fstLine k × (sndLine k × sndLine k)) = 1 ∧
      ¬ Module.Invertible (k × k) (⋀[k × k]^2 (fstLine k × (sndLine k × sndLine k))) := by
  sorry

-- test TauCeti.RingK0.detProjective_line_test (compatibility)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    detProjective R L = CommRing.Pic.mk R L := detProjective_line R L

/-- **The determinant homomorphism** (`TauCeti.RingK0.detHom`,
`KTheoryLowDegrees:Z.3/determinant-hom`): `det : K₀(R) →+ Additive (Pic R)`, additive-to-
multiplicative, never a ring map (a real definition through `lift`). -/
def detHom : K0 R →+ Additive (CommRing.Pic R) :=
  lift R (fun (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
      [Module.Projective R P] => Additive.ofMul (detProjective R P)) (by sorry) (by sorry)

/-- `det x ∈ Pic(R)`, multiplicatively. -/
abbrev det (x : K0 R) : CommRing.Pic R := Additive.toMul (detHom R x)

/-- `KTheoryLowDegrees:Z.3/determinant-hom-of`: `det([P]) = det(P)`. -/
@[simp]
theorem detHom_of (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    det R (cls R M) = detProjective R M := by sorry

/-- `det(x + y) = det(x) det(y)`. -/
theorem det_add (x y : K0 R) : det R (x + y) = det R x * det R y := by sorry

/-- `det(-x) = det(x)⁻¹`. -/
theorem det_neg (x : K0 R) : det R (-x) = (det R x)⁻¹ := by sorry

/-- `det(rankSection f) = 1`. -/
@[simp]
theorem det_rankSection (f : LocallyConstant (PrimeSpectrum R) ℤ) :
    det R (rankSection R f) = 1 := by sorry

/-- `KTheoryLowDegrees:Z.3/determinant-mul`: `det(xy) = det(x)^{rank y} · det(y)^{rank x}`, with
the `H⁰(Spec R, ℤ)`-exponents of `zpowLocallyConstant`. -/
theorem det_mul (x y : K0 R) :
    det R (x * y) =
      zpowLocallyConstant (det R x) (rank R y) * zpowLocallyConstant (det R y) (rank R x) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/determinant-base-change`: `det(map f x) = Pic.mapRingHom f (det x)`. -/
theorem det_map {S : Type u} [CommRing S] (f : R →+* S) (x : K0 R) :
    det S (map R f x) = CommRing.Pic.mapRingHom f (det R x) := by
  sorry

-- test TauCeti.RingK0.det_zero_test (degenerate)
example : det R 0 = 1 := by sorry

-- test TauCeti.RingK0.det_free_test (computation)
example (n : ℤ) : det R (n : K0 R) = 1 := by sorry

-- test TauCeti.RingK0.det_line_test (compatibility)
example (L : CommRing.Pic R) : det R (cls R L) = L := by sorry

-- test TauCeti.RingK0.det_not_multiplicative_test (non-example)
/- For invertible `L`: `det([L] · 2[R]) = Pic.mk(L ⊗ L)`, while `det[L] · det(2[R]) = Pic.mk L`. -/
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    det R (cls R L * 2) = CommRing.Pic.mk R (L ⊗[R] L) ∧
      det R (cls R L) * det R 2 = CommRing.Pic.mk R L := by
  sorry

/-- `KTheoryLowDegrees:Z.3/determinant-surjective`: `det : K₀(R) → Pic(R)` is surjective,
`det [L] = L`. -/
theorem detHom_surjective : Function.Surjective (detHom R) := by sorry

/-- `KTheoryLowDegrees:Z.3/compound-matrix-determinant` (Sylvester–Franke): for an endomorphism `g`
of `Aⁿ` and `1 ≤ j ≤ n`, `det(⋀ʲg) = det(g)^{C(n-1, j-1)}`. -/
theorem det_exteriorPower_map (A : Type u) [CommRing A] (n j : ℕ) (hj : 1 ≤ j) (hjn : j ≤ n)
    (g : Module.End A (Fin n → A)) :
    LinearMap.det (exteriorPower.map j g) = LinearMap.det g ^ (n - 1).choose (j - 1) := by
  sorry

/-- `KTheoryLowDegrees:Z.3/determinant-tensor`: for `P, Q` of constant ranks `p, q`,
`det(P ⊗ Q) = det(P)^q · det(Q)^p`; in general `det(P)^{rank Q} · det(Q)^{rank P}`. -/
theorem detProjective_tensor (P Q : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] [AddCommGroup Q] [Module R Q] [Module.Finite R Q]
    [Module.Projective R Q] :
    detProjective R (P ⊗[R] Q) =
      zpowLocallyConstant (detProjective R P) (rank R (cls R Q)) *
        zpowLocallyConstant (detProjective R Q) (rank R (cls R P)) := by
  sorry

theorem detProjective_tensor_of_constant_rank (P Q : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] [AddCommGroup Q] [Module R Q] [Module.Finite R Q]
    [Module.Projective R Q] (p q : ℕ) (hp : ∀ x, Module.rankAtStalk (R := R) P x = p)
    (hq : ∀ x, Module.rankAtStalk (R := R) Q x = q) :
    detProjective R (P ⊗[R] Q) = detProjective R P ^ q * detProjective R Q ^ p := by
  sorry

/-- `KTheoryLowDegrees:Z.3/determinant-exterior-power`: for `P` of constant rank `n` and
`1 ≤ j ≤ n`, `det(⋀ʲP) = det(P)^{C(n-1, j-1)}`. -/
theorem detProjective_exteriorPower (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] (n : ℕ)
    (hn : ∀ x, Module.rankAtStalk (R := R) P x = n) (j : ℕ) (hj : 1 ≤ j) (hjn : j ≤ n) :
    detProjective R (⋀[R]^j P) = detProjective R P ^ (n - 1).choose (j - 1) := by
  sorry

end Determinant

/-! #### `KTheoryLowDegrees:Z.3/rank-det-ring`, `Z.3/rank-det-ring-hom`, `Z.3/sk-zero` -/

section RankPic

variable (R : Type u) [CommRing R]

/-- Helper instance (not a packet name): the right action of `H⁰ᵐᵒᵖ` on `Pic`, through the
commutativity of `H⁰`. -/
instance : Module (LocallyConstant (PrimeSpectrum R) ℤ)ᵐᵒᵖ (Additive (CommRing.Pic R)) :=
  Module.compHom _ (RingEquiv.toOpposite (LocallyConstant (PrimeSpectrum R) ℤ)).symm.toRingHom

/-- Helper instance (not a packet name). -/
instance : IsCentralScalar (LocallyConstant (PrimeSpectrum R) ℤ) (Additive (CommRing.Pic R)) :=
  ⟨fun _ _ => rfl⟩

/-- **The ring `H⁰(R) ⊕ Pic(R)`** (`TauCeti.RingK0.RankPic`, `KTheoryLowDegrees:Z.3/rank-det-ring`):
the trivial square-zero extension of `H⁰(Spec R, ℤ)` by the `H⁰`-module `Pic(R)`, i.e.
`(a, L)(b, M) = (ab, L^b M^a)`. -/
abbrev RankPic : Type u :=
  TrivSqZeroExt (LocallyConstant (PrimeSpectrum R) ℤ) (Additive (CommRing.Pic R))

example : CommRing (RankPic R) := inferInstance

/-- `(a, L)(b, M) = (ab, L^b M^a)`. -/
@[simp]
theorem RankPic.mul_def (a b : LocallyConstant (PrimeSpectrum R) ℤ) (L M : CommRing.Pic R) :
    (TrivSqZeroExt.inl a + TrivSqZeroExt.inr (Additive.ofMul L) : RankPic R) *
        (TrivSqZeroExt.inl b + TrivSqZeroExt.inr (Additive.ofMul M)) =
      TrivSqZeroExt.inl (a * b) + TrivSqZeroExt.inr
        (Additive.ofMul (zpowLocallyConstant L b * zpowLocallyConstant M a)) := by
  sorry

/-- The first projection, a ring homomorphism onto `H⁰`. -/
def RankPic.fst : RankPic R →+* LocallyConstant (PrimeSpectrum R) ℤ :=
  (TrivSqZeroExt.fstHom ℤ _ _).toRingHom

/-- `(0, L)(0, M) = 0`: `Pic(R)` is an ideal of square zero. -/
@[simp]
theorem RankPic.inr_mul_inr (L M : CommRing.Pic R) :
    (TrivSqZeroExt.inr (Additive.ofMul L) : RankPic R) * TrivSqZeroExt.inr (Additive.ofMul M) =
      0 := by
  sorry

/-- A ring homomorphism `R → S` induces `RankPic R →+* RankPic S`,
`(a, L) ↦ (a ∘ Spec f, mapRingHom f L)`. -/
def RankPic.map {S : Type u} [CommRing S] (f : R →+* S) : RankPic R →+* RankPic S :=
  sorry

-- test TauCeti.RingK0.RankPic_mul_test (computation)
example (L M : CommRing.Pic R) :
    (TrivSqZeroExt.inl 2 + TrivSqZeroExt.inr (Additive.ofMul L) : RankPic R) *
        (TrivSqZeroExt.inl 3 + TrivSqZeroExt.inr (Additive.ofMul M)) =
      TrivSqZeroExt.inl 6 + TrivSqZeroExt.inr (Additive.ofMul (L ^ 3 * M ^ 2)) := by
  sorry

-- test TauCeti.RingK0.RankPic_trivial_test (degenerate)
example [IsLocalRing R] : Function.Bijective (RankPic.fst R) := by
  sorry

-- test TauCeti.RingK0.RankPic_square_zero_test (characterisation)
example : (TrivSqZeroExt.kerIdeal (LocallyConstant (PrimeSpectrum R) ℤ)
    (Additive (CommRing.Pic R))) ^ 2 = ⊥ := by
  sorry

-- test TauCeti.RingK0.RankPic_not_product_test (non-example)
/- `(2, 1)(1, L) = (2, L²) ≠ (2, L)` when `L² ≠ L`: not the product ring `ℤ × Pic`. -/
example (L : CommRing.Pic R) (hL : L ≠ 1) :
    (TrivSqZeroExt.inl 2 : RankPic R) * (TrivSqZeroExt.inl 1 + TrivSqZeroExt.inr
        (Additive.ofMul L)) =
      TrivSqZeroExt.inl 2 + TrivSqZeroExt.inr (Additive.ofMul (L ^ 2)) ∧
      (TrivSqZeroExt.inl 2 + TrivSqZeroExt.inr (Additive.ofMul (L ^ 2)) : RankPic R) ≠
        TrivSqZeroExt.inl 2 + TrivSqZeroExt.inr (Additive.ofMul L) := by
  sorry

/-- Helper (not a packet name): `rank ⊕ det : K₀(R) →+* H⁰(R) ⊕ Pic(R)` (a real definition;
multiplicativity is `Z.3/determinant-mul` with `Z.3/rank-ring-hom`). -/
def rankDet : K0 R →+* RankPic R where
  toFun x := TrivSqZeroExt.inl (rank R x) + TrivSqZeroExt.inr (detHom R x)
  map_one' := by sorry
  map_mul' := by sorry
  map_zero' := by sorry
  map_add' := by sorry

/-- `KTheoryLowDegrees:Z.3/rank-det-ring-hom`: `rank ⊕ det` is a surjective ring homomorphism with
kernel `SK₀(R) = ker rank ∩ ker det`. -/
theorem rankDet_surjective :
    Function.Surjective (rankDet R) ∧
      ∀ x, rankDet R x = 0 ↔ rank R x = 0 ∧ det R x = 1 := by
  sorry

/-- **`SK₀(R)`** (`TauCeti.RingK0.SK0`, `KTheoryLowDegrees:Z.3/sk-zero`): the ideal
`ker(rank ⊕ det)`. -/
def SK0 : Ideal (K0 R) := RingHom.ker (rankDet R)

/-- `x ∈ SK₀(R) ↔ rank x = 0 ∧ det x = 1`. -/
theorem mem_SK0_iff (x : K0 R) : x ∈ SK0 R ↔ rank R x = 0 ∧ det R x = 1 := by
  sorry

/-- `SK₀(R) ≤ I_R`. -/
theorem SK0_le_augmentationIdeal : SK0 R ≤ augmentationIdeal R := by
  sorry

/-- `I_R ⧸ SK₀(R) ≃+ Additive (Pic R)` via `det`. -/
def augmentationIdeal_quot_SK0 :
    (↥(augmentationIdeal R) ⧸ Submodule.comap (augmentationIdeal R).subtype (SK0 R)) ≃+
      Additive (CommRing.Pic R) :=
  sorry

/-- `map f (SK₀ R) ≤ SK₀ S`. -/
theorem SK0_map {S : Type u} [CommRing S] (f : R →+* S) :
    (SK0 R).map (mapRingHom R f) ≤ SK0 S := by
  sorry

-- test TauCeti.RingK0.SK0_field_test (degenerate)
example (k : Type u) [Field k] : SK0 k = ⊥ := by sorry

-- test TauCeti.RingK0.SK0_line_test (characterisation)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    cls R L - 1 ∈ SK0 R ↔ Nonempty (L ≃ₗ[R] R) := by
  sorry

-- test TauCeti.RingK0.SK0_not_ker_det_test (non-example)
/- `[R] ∈ ker det` but `rank [R] = 1 ≠ 0`, so `SK₀(R) ≠ ker det`. -/
example [Nontrivial R] : det R 1 = 1 ∧ (1 : K0 R) ∉ SK0 R := by
  sorry

end RankPic

/-! #### `Z.3/determinant-gamma-congruence`, `Z.3/determinant-kills-gamma-two`,
`Z.3/gamma-filtration-two`, `Z.3/gamma-first-graded` -/

section GammaTwo

variable (R : Type u) [CommRing R]

/-- `KTheoryLowDegrees:Z.3/determinant-gamma-congruence`: for `x ∈ I_R`,
`x ≡ [det x] - [R]` modulo `F²_γ K₀(R)`. -/
theorem sub_det_mem_gammaFiltration_two (x : K0 R) (hx : x ∈ augmentationIdeal R) :
    x - (cls R (det R x) - 1) ∈ LambdaRing.gammaFiltration (augmentation R) 2 := by
  sorry

/-- `KTheoryLowDegrees:Z.3/determinant-kills-gamma-two`: `det(F²_γ K₀(R)) = 1`. -/
theorem det_eq_one_of_mem_gammaFiltration_two (x : K0 R)
    (hx : x ∈ LambdaRing.gammaFiltration (augmentation R) 2) : det R x = 1 := by
  sorry

/-- `TauCeti.RingK0.gammaFiltration_two` (`KTheoryLowDegrees:Z.3/gamma-filtration-two`):
`F²_γ K₀(R) = SK₀(R)`, without the splitting principle, for disconnected `Spec R` too. -/
theorem gammaFiltration_two : LambdaRing.gammaFiltration (augmentation R) 2 = SK0 R := by
  sorry

/-- `TauCeti.RingK0.SK0_eq_gammaFiltration_two`: the same identity, read from `SK₀`. -/
theorem SK0_eq_gammaFiltration_two : SK0 R = LambdaRing.gammaFiltration (augmentation R) 2 :=
  (gammaFiltration_two R).symm

/-- `KTheoryLowDegrees:Z.3/gamma-first-graded`: `L ↦ [L] - [R]` and `det` induce
`F¹_γ/F²_γ ≅ Pic(R)`, and `rank` induces `F⁰_γ/F¹_γ ≅ H⁰(Spec R, ℤ)`. -/
theorem gamma_first_graded :
    (∀ L : CommRing.Pic R, cls R L - 1 ∈ LambdaRing.gammaFiltration (augmentation R) 1 ∧
        det R (cls R L - 1) = L) ∧
      (∀ x ∈ LambdaRing.gammaFiltration (augmentation R) 1,
        det R x = 1 ↔ x ∈ LambdaRing.gammaFiltration (augmentation R) 2) ∧
      (∀ x, x ∈ LambdaRing.gammaFiltration (augmentation R) 1 ↔ rank R x = 0) ∧
      Function.Surjective (rank R) := by
  sorry

-- test TauCeti.RingK0.gammaFiltration_ringK0_test (computation)
/- For `R = ℤ[√-5]`: `F¹_γ/F²_γ ≅ Pic(R) ≅ ℤ/2`, so `F²_γ ≠ F¹_γ`. -/
example : LambdaRing.gammaFiltration (augmentation (ℤ√(-5))) 2 ≠
    LambdaRing.gammaFiltration (augmentation (ℤ√(-5))) 1 := by
  sorry

-- test TauCeti.RingK0.augmented_dedekind_test (compatibility)
example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I] :
    cls (ℤ√(-5)) I - 1 ∈ LambdaRing.augmentationIdeal (augmentation (ℤ√(-5))) ∧
      det (ℤ√(-5)) (cls (ℤ√(-5)) I - 1) ≠ 1 := by
  sorry

-- test TauCeti.RingK0.SK0_dedekind_test (computation)
/- `SK₀(ℤ[√-5]) = 0` while `I_R ≅ ℤ/2`. -/
example : SK0 (ℤ√(-5)) = ⊥ ∧ augmentationIdeal (ℤ√(-5)) ≠ ⊥ := by
  sorry

end GammaTwo

/-! #### `Z.3/ring-k0-adams-line`, `Z.3/ring-k0-adams-rank-det`, `Z.3/ring-k0-special` -/

section AdamsK0

variable (R : Type u) [CommRing R]

/-- `KTheoryLowDegrees:Z.3/ring-k0-adams-line`: for invertible `L` and `k ≥ 1`,
`ψ^k[L] = [L]^k = [L^{⊗k}]` and `ψ^k[L^∨] = [L^∨]^k`. -/
theorem adams_cls_invertible (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L]
    (k : ℕ) (hk : 1 ≤ k) :
    LambdaRing.adams k (cls R L) = cls R L ^ k ∧
      LambdaRing.adams k (cls R (Module.Dual R L)) = cls R (Module.Dual R L) ^ k := by
  sorry

/-- `KTheoryLowDegrees:Z.3/ring-k0-adams-rank-det`: `rank(ψ^k x) = rank x` and
`det(ψ^k x) = det(x)^k` for `k ≥ 1` (the degree-zero normalisation of the Adams operations). -/
theorem rank_adams_det_adams (k : ℕ) (hk : 1 ≤ k) (x : K0 R) :
    rank R (LambdaRing.adams k x) = rank R x ∧ det R (LambdaRing.adams k x) = det R x ^ k := by
  sorry

-- test TauCeti.RingK0.adams_line_test (compatibility)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] (k : ℕ)
    (hk : 1 ≤ k) : LambdaRing.adams k (cls R L) = cls R L ^ k :=
  (adams_cls_invertible R L k hk).1

-- Acceptance of `Z.3/adams-operations`: `ψ²(2[R]) = 2[R]`.
example : LambdaRing.adams 2 (2 : K0 R) = 2 := by
  rw [LambdaRing.adams_two, preLambda_lambda, show (2 : K0 R) = ((2 : ℕ) : K0 R) by norm_num,
    lambda_natCast]
  norm_num [Nat.choose]

end AdamsK0

end TauCeti.RingK0

/-! ### `KTheoryLowDegrees:Z.3/exterior-extension-filtration` and `Z.3/exterior-extension-graded` -/

namespace TauCeti

section ExteriorFiltration

variable {R : Type u} [CommRing R] {M' M M'' : Type u} [AddCommGroup M'] [Module R M']
  [AddCommGroup M] [Module R M] [AddCommGroup M''] [Module R M'']

/-- **The exterior filtration of an extension** (`TauCeti.exteriorExtensionFiltration`): for
`ι : M' → M` (the first map of `0 → M' → M → M'' → 0`), `Fⁱ ⊆ ⋀ⁿM` is the image of
`⋀ⁱM' ⊗ ⋀^{n-i}M → ⋀ⁿM`, `a ⊗ b ↦ (⋀ⁱι)(a) ∧ b`, i.e. the part of degree `n` of
`ι(⋀ⁱM') · ⋀^{n-i}M` in the graded exterior algebra (a real definition; no splitting is chosen, and
the construction needs only `ι`). -/
def exteriorExtensionFiltration (ι : M' →ₗ[R] M) (n i : ℕ) : Submodule R (⋀[R]^n M) :=
  Submodule.comap (⋀[R]^n M).subtype
    (Submodule.map (ExteriorAlgebra.map ι).toLinearMap (⋀[R]^i M') * ⋀[R]^(n - i) M)

/-- `Fⁱ⁺¹ ≤ Fⁱ`. -/
theorem exteriorExtensionFiltration_antitone (ι : M' →ₗ[R] M) (n : ℕ) :
    Antitone (exteriorExtensionFiltration ι n) := by
  sorry

/-- `F⁰ = ⊤`. -/
@[simp]
theorem exteriorExtensionFiltration_zero (ι : M' →ₗ[R] M) (n : ℕ) :
    exteriorExtensionFiltration ι n 0 = ⊤ := by
  sorry

/-- `F^{n+1} = ⊥`. -/
@[simp]
theorem exteriorExtensionFiltration_succ_n (ι : M' →ₗ[R] M) (n : ℕ) :
    exteriorExtensionFiltration ι n (n + 1) = ⊥ := by
  sorry

/-- A morphism of extensions `(f', f)` with `f ∘ ι₁ = ι₂ ∘ f'` maps `Fⁱ` into `Fⁱ`. -/
theorem exteriorExtensionFiltration_map {N' N : Type u} [AddCommGroup N'] [Module R N']
    [AddCommGroup N] [Module R N] (ι : M' →ₗ[R] M) (κ : N' →ₗ[R] N) (f' : M' →ₗ[R] N')
    (f : M →ₗ[R] N) (hf : f ∘ₗ ι = κ ∘ₗ f') (n i : ℕ) :
    Submodule.map (exteriorPower.map n f) (exteriorExtensionFiltration ι n i) ≤
      exteriorExtensionFiltration κ n i := by
  sorry

/-- Base change: `S ⊗ Fⁱ` maps onto the filtration of the base-changed extension under the
comparison `S ⊗ ⋀ⁿM ≅ ⋀ⁿ_S(S ⊗ M)` of `Z.3/exterior-base-change`. -/
theorem exteriorExtensionFiltration_baseChange (S : Type u) [CommRing S] [Algebra R S]
    (ι : M' →ₗ[R] M) (n i : ℕ) :
    ∃ e : (S ⊗[R] ⋀[R]^n M) ≃ₗ[S] ⋀[S]^n (S ⊗[R] M),
      Submodule.map e.toLinearMap
          (LinearMap.range ((exteriorExtensionFiltration ι n i).subtype.baseChange S)) =
        exteriorExtensionFiltration (ι.baseChange S) n i := by
  sorry

/-- For the split extension `M' → M' × M''`, `Fⁱ` is the sum over `j ≥ i` of the images of
`⋀ʲM' ⊗ ⋀^{n-j}M''` (the Sum Formula of `Z.3/exterior-direct-sum`). -/
theorem exteriorExtensionFiltration_split (n i : ℕ) :
    exteriorExtensionFiltration (LinearMap.inl R M' M'') n i =
      ⨆ j ∈ Finset.Icc i n, Submodule.comap (⋀[R]^n (M' × M'')).subtype
        (Submodule.map (ExteriorAlgebra.map (LinearMap.inl R M' M'')).toLinearMap (⋀[R]^j M') *
          Submodule.map (ExteriorAlgebra.map (LinearMap.inr R M' M'')).toLinearMap
            (⋀[R]^(n - j) M'')) := by
  sorry

end ExteriorFiltration

-- test TauCeti.exteriorExtensionFiltration_zero_sub_test (degenerate)
example {R : Type u} [CommRing R] {M' M : Type u} [AddCommGroup M'] [Module R M']
    [AddCommGroup M] [Module R M] [Subsingleton M'] (ι : M' →ₗ[R] M) (n i : ℕ) (hi : 1 ≤ i) :
    exteriorExtensionFiltration ι n 0 = ⊤ ∧ exteriorExtensionFiltration ι n i = ⊥ := by
  sorry

-- test TauCeti.exteriorExtensionFiltration_rank_two_test (computation)
/- `0 → Re₁ → R² → R → 0`, `n = 2`: `F⁰ = F¹ = R(e₁ ∧ e₂) = ⋀²R²` and `F² = 0`. -/
example (R : Type u) [CommRing R] :
    exteriorExtensionFiltration (LinearMap.single R (fun _ : Fin 2 => R) 0) 2 1 = ⊤ ∧
      exteriorExtensionFiltration (LinearMap.single R (fun _ : Fin 2 => R) 0) 2 2 = ⊥ := by
  sorry

-- test TauCeti.exteriorExtensionFiltration_split_test (compatibility)
example {R : Type u} [CommRing R] {M' M'' : Type u} [AddCommGroup M'] [Module R M']
    [AddCommGroup M''] [Module R M''] (n i : ℕ) :
    exteriorExtensionFiltration (LinearMap.inl R M' M'') n i =
      ⨆ j ∈ Finset.Icc i n, Submodule.comap (⋀[R]^n (M' × M'')).subtype
        (Submodule.map (ExteriorAlgebra.map (LinearMap.inl R M' M'')).toLinearMap (⋀[R]^j M') *
          Submodule.map (ExteriorAlgebra.map (LinearMap.inr R M' M'')).toLinearMap
            (⋀[R]^(n - j) M'')) :=
  exteriorExtensionFiltration_split n i

-- test TauCeti.exteriorExtensionFiltration_not_splitting_test (non-example)
/- For `0 → Re₁ → R² → R → 0` and `n = 1`: `F¹ = Re₁`, and every `R(e₂ + r e₁)` is a complement
of `F¹`; the complement depends on the section, only the filtration is canonical. -/
example (R : Type u) [CommRing R] :
    Submodule.map (exteriorPower.oneEquiv R (Fin 2 → R)).toLinearMap
        (exteriorExtensionFiltration (LinearMap.single R (fun _ : Fin 2 => R) 0) 1 1) =
      R ∙ Pi.single 0 1 ∧
    ∀ r : R, IsCompl (R ∙ (Pi.single 0 1 : Fin 2 → R))
      (R ∙ (Pi.single 1 1 + r • Pi.single 0 1 : Fin 2 → R)) := by
  sorry

end TauCeti

namespace TauCeti.RingK0

/-- `KTheoryLowDegrees:Z.3/exterior-extension-graded`: for an exact `0 → M' → M → M'' → 0` with
`M''` projective, `Fⁱ → ⋀ⁱM' ⊗ ⋀^{n-i}M''` is surjective with kernel `Fⁱ⁺¹`, i.e.
`⋀ⁱM' ⊗ ⋀^{n-i}M'' ≅ Fⁱ/Fⁱ⁺¹` canonically; hence
`[⋀ⁿM] = Σ [⋀ⁱM'][⋀^{n-i}M'']`, `λ_t[M] = λ_t[M'] λ_t[M'']` and `det M = det M' · det M''` for
finitely generated projective `M', M''`. -/
theorem exteriorExtensionFiltration_graded {R : Type u} [CommRing R] {M' M M'' : Type u}
    [AddCommGroup M'] [Module R M'] [AddCommGroup M] [Module R M] [AddCommGroup M'']
    [Module R M''] [Module.Projective R M''] (ι : M' →ₗ[R] M) (π : M →ₗ[R] M'')
    (hι : Function.Injective ι) (hπ : Function.Surjective π) (hex : Function.Exact ι π)
    (n i : ℕ) (hi : i ≤ n) :
    ∃ q : ↥(exteriorExtensionFiltration ι n i) →ₗ[R] (⋀[R]^i M' ⊗[R] ⋀[R]^(n - i) M''),
      Function.Surjective q ∧
        LinearMap.ker q = Submodule.comap (exteriorExtensionFiltration ι n i).subtype
          (exteriorExtensionFiltration ι n (i + 1)) := by
  sorry

theorem cls_exteriorPower_of_exact {R : Type u} [CommRing R] {M' M M'' : Type u}
    [AddCommGroup M'] [Module R M'] [Module.Finite R M'] [Module.Projective R M']
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup M''] [Module R M''] [Module.Finite R M''] [Module.Projective R M'']
    (ι : M' →ₗ[R] M) (π : M →ₗ[R] M'') (hι : Function.Injective ι) (hπ : Function.Surjective π)
    (hex : Function.Exact ι π) (n : ℕ) :
    cls R (⋀[R]^n M) = ∑ i ∈ Finset.range (n + 1), cls R (⋀[R]^i M') * cls R (⋀[R]^(n - i) M'') ∧
      detProjective R M = detProjective R M' * detProjective R M'' := by
  sorry

end TauCeti.RingK0

/-! ### `KTheoryLowDegrees:Z.3/representation-ring-of-gl` and
`Z.3/serre-representation-ring-theorem`

`G = GL_{N₁} × ⋯ × GL_{N_r}` is indexed by the list `Ns = [N₁, …, N_r]`; its coordinate Hopf algebra
is the iterated tensor product of Tau Ceti's `GeneralLinear.coordinateHopfAlgebra`. The base ring
`k` is general (the packet's case is `k = ℤ`); stating it generically avoids the two `ℤ`-module
structures on a bundled Hopf `ℤ`-algebra. Representations are Tau Ceti's finitely generated
comodules (`FGComoduleCat`) that are free over `k`, and `R_k(G)` is Tau Ceti's `ExactK0` for the
short sequences that are exact on underlying modules. -/

namespace TauCeti.RepresentationRing

open TauCeti.GeneralLinear

variable (k : Type) [CommRing k]

/-- Helper (not a packet name): the coordinate Hopf algebra `k[G] = ⊗_i k[GL_{N_i}]` of
`G = ∏ GL_{N_i}` (a real definition, by recursion on the list of sizes). -/
def glCoordinate : List ℕ → CommHopfAlgCat.{0} k
  | [] => CommHopfAlgCat.of k k
  | N :: Ns => CommHopfAlgCat.of k (coordinateHopfAlgebra k N ⊗[k] glCoordinate Ns)

/-- Helper (not a packet name): the object property of being free over `k`. -/
def isFree (Ns : List ℕ) : ObjectProperty (FGComoduleCat.{0, 0, 0} k (glCoordinate k Ns)) :=
  fun V => Module.Free k V

/-- **Representations of `∏ GL_{N_i}`** (`TauCeti.RepresentationRing.GLRep`): finitely generated
comodules over `k[G]` that are free over `k` (lattices for `k = ℤ`). -/
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

/-- **The representation ring** `R_k(∏ GL_{N_i})` (`TauCeti.RepresentationRing.ofGL`): Tau Ceti's
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

/-- **The standard classes** (`TauCeti.RepresentationRing.ofGL.std`): `std_i = [k^{N_i}]`; the
determinant of the `i`-th factor is `det_i = λ^{N_i}(std_i)`. -/
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

-- test TauCeti.RepresentationRing.ofGL_one_test (computation)
/- `R_ℤ(GL₁) = ℤ[t, t⁻¹]` with `t = std₁` a line element. -/
example : (∃ e : ofGL ℤ [1] ≃+* LaurentPolynomial ℤ,
      e (ofGL.std ℤ [1] ⟨0, by simp⟩) = LaurentPolynomial.T 1) ∧
    ∀ n, 2 ≤ n → PreLambdaRing.lambda n (ofGL.std ℤ [1] ⟨0, by simp⟩) = 0 := by
  sorry

-- test TauCeti.RepresentationRing.ofGL_zero_test (degenerate)
/- `GL₀` is trivial and `R_ℤ(GL₀) = ℤ` with the binomial structure. -/
example : ∃ e : ofGL ℤ [0] ≃+* ℤ, ∀ (n : ℕ) (x : ofGL ℤ [0]),
    e (PreLambdaRing.lambda n x) = PreLambdaRing.lambda n (e x) := by
  sorry

-- test TauCeti.RepresentationRing.ofGL_lambda_top_test (computation)
/- `λ^N(std_N) = det` is invertible, with inverse `det^∨`. -/
example (N : ℕ) : IsUnit (PreLambdaRing.lambda N (ofGL.std ℤ [N] ⟨0, by simp⟩)) :=
  ⟨⟨_, _, ofGL.dual_det ℤ N, by rw [mul_comm]; exact ofGL.dual_det ℤ N⟩, rfl⟩

-- test TauCeti.RepresentationRing.ofGL_not_abstract_group_test (non-example)
/- `R_ℤ(GL₁)` is not the representation ring of the abstract group `GL₁(ℤ) = {±1}` (Tau Ceti's
`repRing`, over `ℚ`): there the sign character `σ` has `σ² = 1`, while `t² ≠ 1` in `ℤ[t^{±1}]`. -/
example : (ofGL.std ℤ [1] ⟨0, by simp⟩) ^ 2 ≠ 1 ∧
    ∃ σ : TauCeti.repRing ℚ ℤˣ, σ ^ 2 = 1 ∧ σ ≠ 1 := by
  sorry

-- test TauCeti.RepresentationRing.ofGL_character_test (compatibility)
/- `ch(λ²(std₂ ⊗ std₂)) = P₂(e(X); e(X))` at `X₁, X₂`. -/
example : (ofGL.character ℤ [2]).toRingHom (PreLambdaRing.lambda 2
      (ofGL.std ℤ [2] ⟨0, by simp⟩ * ofGL.std ℤ [2] ⟨0, by simp⟩)) =
    MvPolynomial.aeval (Sum.elim
      (fun i : Fin 2 => MvPolynomial.aeval (fun a : Fin 2 => ofGL.charVar (Ns := [2]) ⟨0, by simp⟩
        (Fin.cast (by simp) a)) (MvPolynomial.esymm (Fin 2) ℤ (i + 1)))
      (fun j : Fin 2 => MvPolynomial.aeval (fun a : Fin 2 => ofGL.charVar (Ns := [2]) ⟨0, by simp⟩
        (Fin.cast (by simp) a)) (MvPolynomial.esymm (Fin 2) ℤ (j + 1))))
      (LambdaRing.productPoly 2) := by
  sorry

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

/-! ### `KTheoryLowDegrees:Z.3/associated-projective-module` and `Z.3/ring-k0-special` -/

namespace TauCeti.RingK0

open TauCeti.RepresentationRing

section Associated

variable (R : Type u) [CommRing R]

/-- **The associated projective module** `V(P)` (`TauCeti.RingK0.associatedModule`): for a
representation `V` of `G = ∏ GL_{N_i}` over `ℤ` and projectives `P_i` of constant ranks `N_i`,
the finitely generated projective module patched from `R[1/s_a] ⊗ V` along the images of the
transition matrices of the `P_i` under the representation. The open-patching construction
(cover, bases, cocycle) is omitted; the value is pinned by the lemmas below. -/
def associatedModule {Ns : List ℕ} (V : GLRep ℤ Ns) (P : Fin Ns.length → Type u)
    [∀ i, AddCommGroup (P i)] [∀ i, Module R (P i)] [∀ i, Module.Finite R (P i)]
    [∀ i, Module.Projective R (P i)]
    (hP : ∀ i p, Module.rankAtStalk (R := R) (P i) p = Ns.get i) : FP R :=
  sorry

variable {R}

section
variable {Ns : List ℕ} (P : Fin Ns.length → Type u) [∀ i, AddCommGroup (P i)]
  [∀ i, Module R (P i)] [∀ i, Module.Finite R (P i)] [∀ i, Module.Projective R (P i)]
  (hP : ∀ i p, Module.rankAtStalk (R := R) (P i) p = Ns.get i)

/-- `std_i(P) ≃ₗ P_i`. -/
@[simp]
theorem associatedModule_std (i : Fin Ns.length) :
    Nonempty ((associatedModule R (ofGL.stdRep ℤ Ns i) P hP).obj ≃ₗ[R] P i) := by
  sorry

/-- `(V ⊗ W)(P) ≃ₗ V(P) ⊗ W(P)`. -/
theorem associatedModule_tensor (V W : GLRep ℤ Ns) :
    Nonempty ((associatedModule R (V ⊗ W) P hP).obj ≃ₗ[R]
      ((associatedModule R V P hP).obj ⊗[R] (associatedModule R W P hP).obj)) := by
  sorry

-- `TauCeti.RingK0.associatedModule_exteriorPower`: not stated here at module level; needs the
-- exterior-power comodule `⋀ᵏV` of a representation, which Tau Ceti does not provide (supplier:
-- KTheoryLowDegrees:Z.3/representation-ring-of-gl, whose pre-λ-structure uses it). Its class-level
-- form is the λ-compatibility of `associatedLambdaHom` below.

/-- `V ↦ V(P)` is exact: a conflation `V₁ ↪ V₂ ↠ V₃` of representations gives a short exact
sequence `0 → V₁(P) → V₂(P) → V₃(P) → 0`. -/
theorem associatedModule_exact (S : ShortComplex (GLRep ℤ Ns))
    (hS : (exactStructure ℤ Ns).Conflation S) :
    ∃ (f : (associatedModule R S.X₁ P hP).obj →ₗ[R] (associatedModule R S.X₂ P hP).obj)
      (g : (associatedModule R S.X₂ P hP).obj →ₗ[R] (associatedModule R S.X₃ P hP).obj),
      Function.Injective f ∧ Function.Surjective g ∧ Function.Exact f g := by
  sorry

/-- `S ⊗[R] V(P) ≃ₗ V(S ⊗ P)` for `R → S`. -/
theorem associatedModule_baseChange (S : Type u) [CommRing S] [Algebra R S] (V : GLRep ℤ Ns)
    (hPS : ∀ i p, Module.rankAtStalk (R := S) (S ⊗[R] P i) p = Ns.get i) :
    Nonempty ((S ⊗[R] (associatedModule R V P hP).obj) ≃ₗ[S]
      (associatedModule S V (fun i => S ⊗[R] P i) hPS).obj) := by
  sorry

end

/-- `τ_P : R_ℤ(G) → K₀(R)`, `[V] ↦ [V(P)]`, a pre-λ-ring homomorphism with `τ_P(std_i) = [P_i]`
(`TauCeti.RingK0.associatedLambdaHom`; construction through `ExactK0.lift` omitted). -/
def associatedLambdaHom (R : Type u) [CommRing R] {Ns : List ℕ} (P : Fin Ns.length → Type u)
    [∀ i, AddCommGroup (P i)] [∀ i, Module R (P i)] [∀ i, Module.Finite R (P i)]
    [∀ i, Module.Projective R (P i)]
    (_hP : ∀ i p, Module.rankAtStalk (R := R) (P i) p = Ns.get i) :
    PreLambdaRing.Hom (ofGL ℤ Ns) (K0 R) :=
  sorry

section
variable {Ns : List ℕ} (P : Fin Ns.length → Type u) [∀ i, AddCommGroup (P i)]
  [∀ i, Module R (P i)] [∀ i, Module.Finite R (P i)] [∀ i, Module.Projective R (P i)]
  (hP : ∀ i p, Module.rankAtStalk (R := R) (P i) p = Ns.get i)

theorem associatedLambdaHom_std (i : Fin Ns.length) :
    (associatedLambdaHom R P hP).toRingHom (ofGL.std ℤ Ns i) = cls R (P i) := by
  sorry

end

-- test TauCeti.RingK0.associatedModule_free_test (degenerate)
/- For free `P_i = R^{N_i}`: `V(P) ≅ R ⊗ V`, so `τ_P([V]) = (rank V)[R]`. -/
example {Ns : List ℕ} (V : GLRep ℤ Ns)
    (h : ∀ i p, Module.rankAtStalk (R := R) (Fin (Ns.get i) → R) p = Ns.get i) :
    (associatedLambdaHom R (fun i => Fin (Ns.get i) → R) h).toRingHom (ofGL.of V) =
      (Module.finrank ℤ V.obj : K0 R) := by
  sorry

-- test TauCeti.RingK0.associatedModule_det_test (computation)
/- For the determinant representation `det = λ^N(std)` of `GL_N`: `τ_P(det) = [⋀ᴺP]`; for
`P = I ⊕ R` over `ℤ[√-5]` it is `[I]`. -/
example (N : ℕ) (P : Fin [N].length → Type u) [∀ i, AddCommGroup (P i)] [∀ i, Module R (P i)]
    [∀ i, Module.Finite R (P i)] [∀ i, Module.Projective R (P i)]
    (hP : ∀ i p, Module.rankAtStalk (R := R) (P i) p = [N].get i) :
    (associatedLambdaHom R P hP).toRingHom
        (PreLambdaRing.lambda N (ofGL.std ℤ [N] ⟨0, by simp⟩)) =
      cls R (⋀[R]^N (P ⟨0, by simp⟩)) := by
  sorry

example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I]
    (hP : ∀ (i : Fin [2].length) p,
      Module.rankAtStalk (R := ℤ√(-5)) (I × ℤ√(-5)) p = [2].get i) :
    (associatedLambdaHom (ℤ√(-5)) (fun _ => I × ℤ√(-5)) hP).toRingHom
        (PreLambdaRing.lambda 2 (ofGL.std ℤ [2] ⟨0, by simp⟩)) = cls (ℤ√(-5)) I := by
  sorry

-- test TauCeti.RingK0.associatedModule_lambda_test (compatibility)
example {Ns : List ℕ} (P : Fin Ns.length → Type u) [∀ i, AddCommGroup (P i)]
    [∀ i, Module R (P i)] [∀ i, Module.Finite R (P i)] [∀ i, Module.Projective R (P i)]
    (hP : ∀ i p, Module.rankAtStalk (R := R) (P i) p = Ns.get i) (i : Fin Ns.length) (n : ℕ) :
    (associatedLambdaHom R P hP).toRingHom (PreLambdaRing.lambda n (ofGL.std ℤ Ns i)) =
      cls R (⋀[R]^n (P i)) ∧ cls R (⋀[R]^n (P i)) = lambda R n (cls R (P i)) := by
  sorry

-- test TauCeti.RingK0.associatedModule_not_abstract_test (non-example): not stated here; needs
-- the evaluation of a `GL₁`-comodule at the point `-1 ∈ GL₁(ℤ)` as a `ℤ`-linear automorphism
-- of the lattice (Tau Ceti's `HopfAlgebra.pointRepresentationEquivComodule` supplies point
-- actions for comodules over a Hopf algebra, but no bridge from `GLRep` built on `FGComoduleCat`)
-- (supplier: KTheoryLowDegrees:Z.3/representation-ring-of-gl).

end Associated

/-- `KTheoryLowDegrees:Z.3/ring-k0-special`: `K₀(R)` is a special λ-ring
(`λ^k(1) = 0` for `k ≥ 2`, the product and composition axioms), by Serre's representation-ring
route; it rests on `Z.3/serre-representation-ring-theorem` (the recorded gap). -/
instance instLambdaRing (R : Type u) [CommRing R] : LambdaRing (K0 R) :=
  { instPreLambdaRing R with
    lambda_one_eq_zero' := fun k hk => lambda_one_class R k hk
    lambda_mul' := by sorry
    lambda_lambda' := by sorry }

-- test TauCeti.RingK0.special_test (compatibility)
/- `K₀(R)` with `Z.3/lambda` is special: e.g. `λ²([P][Q]) = P₂(λ^•[P]; λ^•[Q])`. -/
example (R : Type u) [CommRing R] (x y : K0 R) :
    lambda R 2 (x * y) =
      MvPolynomial.aeval (Sum.elim (fun i : Fin 2 => lambda R (i + 1) x)
        (fun j : Fin 2 => lambda R (j + 1) y)) (LambdaRing.productPoly 2) :=
  LambdaRing.lambda_mul 2 x y

-- Acceptance of `Z.3/ring-k0-special`: `λ²[R⁴] = 6[R]`.
example (R : Type u) [CommRing R] : lambda R 2 (4 : K0 R) = 6 := by
  rw [show (4 : K0 R) = ((4 : ℕ) : K0 R) by norm_num, lambda_natCast]
  norm_num [Nat.choose]

end TauCeti.RingK0

/-! ## Stage `KTheoryLowDegrees:Z.4` — Dedekind domains and `S`-integers

Throughout, `R` is a Dedekind domain (Mathlib's `IsDedekindDomain`; a field is allowed), `Spec R` is
connected, the rank is the integer rank `rankℤ` (the companion's Z.2/rank-connected), and `det` is
`detHom : K₀(R) →+ Additive (Pic R)` of Z.3. `S` in `Set.integer` is a set of height-one primes. -/

namespace TauCeti.RingK0

open scoped Pointwise nonZeroDivisors

section Dedekind

variable (R : Type u) [CommRing R] [IsDedekindDomain R]

/-- Helper instance (a composition of pinned baseline results, not a new node): finitely generated
torsion-free modules over a Dedekind domain are projective
(`IsDedekindDomain.flat_iff_torsion_eq_bot`, `Module.finitePresentation_of_finite`,
`Module.Flat.projective_of_finitePresentation`). -/
instance finiteTorsionFree_projective (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.IsTorsionFree R M] : Module.Projective R M := by
  sorry

/-- Helper instance (a true fact, proof omitted): nonzero ideals of a Dedekind domain are
invertible modules. -/
instance ideal_invertible (I : (Ideal R)⁰) : Module.Invertible R (I : Ideal R) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/coprime-ideal-representative`: for nonzero `I, J` there are
`α ∈ Kˣ` and a nonzero `J' = αJ` with `I + J' = R`; multiplication by `α` gives `J ≃ₗ J'`. -/
theorem exists_coprimeIdeal_equiv (I J : Ideal R) (hI : I ≠ ⊥) (hJ : J ≠ ⊥) :
    ∃ (α : (FractionRing R)ˣ) (J' : Ideal R), J' ≠ ⊥ ∧ IsCoprime I J' ∧
      Submodule.map (Algebra.linearMap R (FractionRing R)) J' =
        (α : FractionRing R) • Submodule.map (Algebra.linearMap R (FractionRing R)) J ∧
      Nonempty (J ≃ₗ[R] J') := by
  sorry

omit [IsDedekindDomain R] in
/-- `KTheoryLowDegrees:Z.4/coprime-ideal-sum`: for any commutative ring and `I + J = R`,
`I × J ≃ₗ R × IJ` (`v ↦ (f v, v - (f(v) i, f(v) j))` for `i + j = 1`). -/
theorem coprimeIdeal_prod (I J : Ideal R) (h : IsCoprime I J) :
    Nonempty ((I × J) ≃ₗ[R] (R × (I * J : Ideal R))) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/ideal-sum`: `I × J ≃ₗ R × IJ` for nonzero ideals of a Dedekind domain. -/
theorem ideal_prod (I J : Ideal R) (hI : I ≠ ⊥) (hJ : J ≠ ⊥) :
    Nonempty ((I × J) ≃ₗ[R] (R × (I * J : Ideal R))) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/projective-ideal-summands`: `P ≃ₗ I₁ × ⋯ × I_m` with nonzero ideals and
`m = rankℤ [P]` (the empty product exactly for `P = 0`). -/
theorem exists_ideal_summands (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    ∃ (n : ℕ) (I : Fin n → Ideal R), (n : ℤ) = rankℤ R (cls R M) ∧ (∀ i, I i ≠ ⊥) ∧
      Nonempty (M ≃ₗ[R] ((i : Fin n) → I i)) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/steinitz`: either `P = 0` (exactly when `rankℤ [P] = 0`), or
`P ≃ₗ Rⁿ × I` with `I` a nonzero ideal, `rankℤ [P] = n + 1` and `Pic.mk I = det P`. -/
theorem steinitz (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    (Subsingleton M ↔ rankℤ R (cls R M) = 0) ∧
      (Subsingleton M ∨ ∃ (n : ℕ) (I : (Ideal R)⁰),
        Nonempty (M ≃ₗ[R] ((Fin n → R) × (I : Ideal R))) ∧
          rankℤ R (cls R M) = n + 1 ∧ CommRing.Pic.mk R (I : Ideal R) = detProjective R M) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/projective-classification`: `P ≃ₗ Q ↔ rankℤ [P] = rankℤ [Q] ∧
det P = det Q`; hence `[P] = [Q] → P ≃ Q`, and projectives cancel. -/
theorem projective_classification (P Q : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] [AddCommGroup Q] [Module R Q] [Module.Finite R Q]
    [Module.Projective R Q] :
    (Nonempty (P ≃ₗ[R] Q) ↔
      rankℤ R (cls R P) = rankℤ R (cls R Q) ∧ detProjective R P = detProjective R Q) ∧
    (cls R P = cls R Q → Nonempty (P ≃ₗ[R] Q)) ∧
    ∀ (M N : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
      [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N],
      Nonempty ((P × M) ≃ₗ[R] (P × N)) → Nonempty (M ≃ₗ[R] N) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/line-class-product`: `[L ⊗ M] = [L] + [M] - [R]` for invertible
`L, M`; equivalently `([L] - [R])([M] - [R]) = 0`. -/
theorem lineClass_mul (L M : CommRing.Pic R) :
    cls R (L * M) = cls R L + cls R M - 1 ∧ (cls R L - 1) * (cls R M - 1) = 0 := by
  sorry

/-! ### `KTheoryLowDegrees:Z.4/reduced-line-class` -/

/-- **The reduced class of a line bundle** (`TauCeti.RingK0.picToK0`): `ofAdd L ↦ [L] - [R]`
(a real definition; additivity is `lineClass_mul`). -/
def picToK0 : Additive (CommRing.Pic R) →+ K0 R where
  toFun a := cls R (CommRing.Pic.AsModule (Additive.toMul a)) - 1
  map_zero' := by sorry
  map_add' := by sorry

variable {R}

omit [IsDedekindDomain R] in
/-- `picToK0 (ofAdd L) = [L] - [R]`. -/
@[simp]
theorem picToK0_apply (L : CommRing.Pic R) : picToK0 R (Additive.ofMul L) = cls R L - 1 :=
  rfl

/-- `picToK0 (ofAdd (Pic.mk R N)) = [N] - [R]` for an invertible module `N`. -/
@[simp]
theorem picToK0_ofAdd_mk (N : Type u) [AddCommGroup N] [Module R N] [Module.Invertible R N] :
    picToK0 R (Additive.ofMul (CommRing.Pic.mk R N)) = cls R N - 1 := by
  sorry

/-- `rankℤ (picToK0 a) = 0`. -/
@[simp]
theorem rankℤ_picToK0 (a : Additive (CommRing.Pic R)) : rankℤ R (picToK0 R a) = 0 := by
  sorry

/-- `det (picToK0 (ofAdd L)) = L`. -/
@[simp]
theorem det_picToK0 (L : CommRing.Pic R) : det R (picToK0 R (Additive.ofMul L)) = L := by
  sorry

/-- `picToK0 a * picToK0 b = 0`. -/
theorem picToK0_mul_picToK0 (a b : Additive (CommRing.Pic R)) :
    picToK0 R a * picToK0 R b = 0 := by
  sorry

/-- `picToK0` is injective, with left inverse `ofAdd ∘ det`. -/
theorem picToK0_injective : Function.Injective (picToK0 R) := by
  sorry

/-- The range of `picToK0` is `ker rankℤ`. -/
theorem range_picToK0 : (picToK0 R).range = (rankℤ R).ker := by
  sorry

-- test TauCeti.RingK0.picToK0_zero_test (degenerate)
example : picToK0 R 0 = 0 := map_zero _

-- test TauCeti.RingK0.picToK0_dual_test (computation)
example (L : Type u) [AddCommGroup L] [Module R L] [Module.Invertible R L] :
    cls R L + cls R (Module.Dual R L) = 2 • (1 : K0 R) ∧
      picToK0 R (Additive.ofMul (CommRing.Pic.mk R L)⁻¹) =
        -picToK0 R (Additive.ofMul (CommRing.Pic.mk R L)) := by
  sorry

-- test TauCeti.RingK0.picToK0_det_test (compatibility)
example (L : CommRing.Pic R) :
    detHom R (picToK0 R (Additive.ofMul L)) = Additive.ofMul L ∧
      rankℤ R (picToK0 R (Additive.ofMul L)) = 0 := by
  sorry

-- test TauCeti.RingK0.picToK0_not_class_test (non-example)
/- `L ↦ [L]` without subtracting `[R]` is not additive: `1 · 1 = 1 ↦ [R]`, but `[R] + [R]` has
rank `2`. -/
example : rankℤ R (cls R (1 * 1 : CommRing.Pic R)) ≠
    rankℤ R (cls R (1 : CommRing.Pic R) + cls R (1 : CommRing.Pic R)) := by
  sorry

variable (R)

/-- `KTheoryLowDegrees:Z.4/projective-class-normal-form`: `[P] = (rankℤ [P] - 1)[R] + [det P]`,
including `P = 0`. -/
theorem class_normal_form (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    cls R M = ((rankℤ R (cls R M) - 1 : ℤ) : K0 R) + cls R (detProjective R M) := by
  sorry

/-! ### `KTheoryLowDegrees:Z.4/rank-pic-equivalence` (with `rank-pic-apply`, `rank-pic-inverse`) -/

/-- **Rank and Picard group** (`TauCeti.RingK0.rankPicEquiv`):
`K₀(R) ≃+ ℤ × Additive (Pic R)`, `x ↦ (rankℤ x, det x)`, with inverse
`(n, L) ↦ n[R] + picToK0 L = (n - 1)[R] + [L]` (a real definition; the inverse laws are omitted). -/
def rankPicEquiv : K0 R ≃+ ℤ × Additive (CommRing.Pic R) where
  toFun x := (rankℤ R x, detHom R x)
  invFun y := (y.1 : K0 R) + picToK0 R y.2
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

variable {R}

/-- `KTheoryLowDegrees:Z.4/rank-pic-apply`: `rankPicEquiv x = (rankℤ x, ofAdd (det x))`. -/
@[simp]
theorem rankPicEquiv_apply (x : K0 R) :
    rankPicEquiv R x = (rankℤ R x, Additive.ofMul (det R x)) :=
  rfl

/-- `KTheoryLowDegrees:Z.4/rank-pic-inverse`: `rankPicEquiv.symm (n, ofAdd L) = (n - 1)[R] + [L]`
for every `n ∈ ℤ`. -/
theorem rankPicEquiv_symm (n : ℤ) (L : CommRing.Pic R) :
    (rankPicEquiv R).symm (n, Additive.ofMul L) = ((n - 1 : ℤ) : K0 R) + cls R L := by
  sorry

/-- `x = y ↔ rankℤ x = rankℤ y ∧ det x = det y`. -/
theorem rankPicEquiv_ext (x y : K0 R) :
    x = y ↔ rankℤ R x = rankℤ R y ∧ det R x = det R y := by
  sorry

/-- `rankPicEquiv [P] = (finrank R P, ofAdd (det P))`. -/
@[simp]
theorem rankPicEquiv_of (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] :
    rankPicEquiv R (cls R P) = ((Module.finrank R P : ℤ), Additive.ofMul (detProjective R P)) := by
  sorry

/-- `rankPicEquiv [R] = (1, 0)`. -/
@[simp]
theorem rankPicEquiv_one : rankPicEquiv R (cls R R) = (1, 0) := by
  sorry

/-- `rankPicEquiv.symm (0, ofAdd L) = picToK0 (ofAdd L) = [L] - [R]`. -/
@[simp]
theorem rankPicEquiv_symm_zero_ofAdd (L : CommRing.Pic R) :
    (rankPicEquiv R).symm (0, Additive.ofMul L) = picToK0 R (Additive.ofMul L) := by
  sorry

variable (R) in
/-- `ker rankℤ ≃+ Additive (Pic R)` by `det`, with inverse `picToK0`
(Weibel's `K̃₀(R) ≅ Pic(R)`). -/
def ker_rankℤ_equiv_pic : (rankℤ R).ker ≃+ Additive (CommRing.Pic R) where
  toFun x := detHom R x
  invFun a := ⟨picToK0 R a, rankℤ_picToK0 a⟩
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry

/-- For a principal ideal domain, `Pic R` is trivial and the first coordinate is an isomorphism
`K₀(R) ≃+ ℤ` (the companion's Z.2/pid-k0). -/
theorem rankPicEquiv_isPrincipalIdealRing [IsPrincipalIdealRing R] :
    Subsingleton (CommRing.Pic R) ∧ Function.Bijective (rankℤ R) := by
  sorry

-- test TauCeti.RingK0.rankPic_zero_test (degenerate)
example : rankPicEquiv R 0 = (0, 0) := map_zero _

-- test TauCeti.RingK0.rankPic_negative_test (computation)
example : (rankPicEquiv R).symm (-1, 0) = (-1 : K0 R) := by sorry

-- test TauCeti.RingK0.rankPic_nontrivial_test (non-example)
example (L : CommRing.Pic R) (hL : L ≠ 1) : cls R L - 1 ≠ 0 := by sorry

-- test TauCeti.RingK0.rankPic_pid_test (compatibility)
example : rankPicEquiv ℤ (cls ℤ (Fin 3 → ℤ)) = (3, 0) := by sorry

-- test TauCeti.RingK0.rankPic_ideal_test (characterisation)
example (I : (Ideal R)⁰) :
    rankPicEquiv R (1 - cls R (I : Ideal R)) =
      (0, Additive.ofMul (CommRing.Pic.mk R (I : Ideal R))⁻¹) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/rank-pic-mul`: `(m, L)(n, M) = (mn, Lⁿ Mᵐ)`, i.e.
`rankℤ(xy) = rankℤ x · rankℤ y` and `det(xy) = det(x)^{rankℤ y} det(y)^{rankℤ x}`. -/
theorem rankPicEquiv_mul (x y : K0 R) :
    rankℤ R (x * y) = rankℤ R x * rankℤ R y ∧
      det R (x * y) = det R x ^ rankℤ R y * det R y ^ rankℤ R x := by
  sorry

/-! ### `KTheoryLowDegrees:Z.4/rank-pic-ring-equiv` -/

/-- Helper instance (not a packet name): `ℤᵐᵒᵖ` acts on `Pic` through `ℤ`. -/
instance : Module ℤᵐᵒᵖ (Additive (CommRing.Pic R)) :=
  Module.compHom _ (RingEquiv.toOpposite ℤ).symm.toRingHom

/-- Helper instance (not a packet name). -/
instance : IsCentralScalar ℤ (Additive (CommRing.Pic R)) :=
  ⟨fun _ _ => rfl⟩

variable (R) in
/-- **The ring `ℤ ⊕ Pic(R)` of a Dedekind domain** (`TauCeti.RingK0.rankPicRingEquiv`):
`K₀(R) ≃+* TrivSqZeroExt ℤ (Additive (Pic R))`, `(m, L)(n, M) = (mn, Lⁿ Mᵐ)`, with underlying
additive equivalence `rankPicEquiv` (`SK₀(R) = 0`; the multiplicativity is omitted). -/
def rankPicRingEquiv : K0 R ≃+* TrivSqZeroExt ℤ (Additive (CommRing.Pic R)) where
  toFun x := TrivSqZeroExt.inl (rankℤ R x) + TrivSqZeroExt.inr (detHom R x)
  invFun y := (rankPicEquiv R).symm (y.fst, y.snd)
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry
  map_add' := by sorry

/-- The underlying additive equivalence is `rankPicEquiv`. -/
theorem rankPicRingEquiv_toAddEquiv (x : K0 R) :
    ((rankPicRingEquiv R x).fst, (rankPicRingEquiv R x).snd) = rankPicEquiv R x := by
  sorry

/-- The first coordinate is `rankℤ`. -/
@[simp]
theorem rankPicRingEquiv_fst (x : K0 R) : (rankPicRingEquiv R x).fst = rankℤ R x := by
  sorry

/-- The second coordinate is `det`. -/
@[simp]
theorem rankPicRingEquiv_snd (x : K0 R) : (rankPicRingEquiv R x).snd = detHom R x := by
  sorry

/-- `rankPicRingEquiv.symm (1, 1) = [R] = 1`. -/
@[simp]
theorem rankPicRingEquiv_symm_one : (rankPicRingEquiv R).symm 1 = 1 := by
  sorry

variable (R) in
/-- `SK₀(R) = 0` for a Dedekind domain (`Z.3/sk-zero`). -/
theorem sk0_eq_bot : SK0 R = ⊥ := by
  sorry

variable (R) in
/-- `(ker rankℤ)² = 0`. -/
theorem ker_rankℤ_sq_eq_bot :
    ∀ x y : K0 R, x ∈ (rankℤ R).ker → y ∈ (rankℤ R).ker → x * y = 0 := by
  sorry

variable (R) in
/-- `rankℤ : K₀(R) →+* ℤ` is a ring homomorphism, split by `n ↦ n[R]` (a real definition over the
additive `rankℤ`). -/
def rankℤ_ringHom : K0 R →+* ℤ :=
  { rankℤ R with
    map_one' := by sorry
    map_mul' := by sorry }

-- test TauCeti.RingK0.rankPicRing_line_sq_test (computation)
example (L : CommRing.Pic R) : cls R L * cls R L = 2 • cls R L - 1 := by sorry

-- test TauCeti.RingK0.rankPicRing_pid_test (degenerate)
example : Function.Bijective (rankℤ_ringHom ℤ) := by sorry

-- test TauCeti.RingK0.rankPicRing_det_not_mul_test (non-example)
example (L : CommRing.Pic R) :
    det R (2 • (1 : K0 R) * cls R L) = L ^ 2 ∧ det R (2 • (1 : K0 R)) * det R (cls R L) = L := by
  sorry

-- test TauCeti.RingK0.rankPicRing_rank_test (compatibility)
example (x : K0 R) :
    (rankPicRingEquiv R x).fst = rankℤ R x ∧ (rankPicRingEquiv R x).snd = detHom R x :=
  ⟨rankPicRingEquiv_fst x, rankPicRingEquiv_snd x⟩

end Dedekind

end TauCeti.RingK0

/-! ### `KTheoryLowDegrees:Z.4/class-group-pic-mk0`, `ideal-class-representative-independence`,
`pic-map-extended-hom` -/

namespace ClassGroup

open scoped nonZeroDivisors

variable {R : Type u} [CommRing R] [IsDedekindDomain R]

/-- `KTheoryLowDegrees:Z.4/class-group-pic-mk0`: `equivPic R (mk0 I) = Pic.mk R I`. -/
theorem equivPic_mk0 (I : (Ideal R)⁰) :
    ClassGroup.equivPic R (ClassGroup.mk0 I) = CommRing.Pic.mk R (I : Ideal R) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/ideal-class-representative-independence`: `mk0 I = mk0 J ↔ I ≃ₗ J`, and
then `[I] = [J]` in `K₀(R)`. -/
theorem mk0_eq_mk0_iff_nonempty_linearEquiv (I J : (Ideal R)⁰) :
    (ClassGroup.mk0 I = ClassGroup.mk0 J ↔ Nonempty ((I : Ideal R) ≃ₗ[R] (J : Ideal R))) ∧
      (ClassGroup.mk0 I = ClassGroup.mk0 J →
        TauCeti.RingK0.cls R (I : Ideal R) = TauCeti.RingK0.cls R (J : Ideal R)) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/pic-map-extended-hom`: for an injective extension of Dedekind domains,
`Pic.mapAlgebra R S (equivPic R c) = equivPic S (extendedHom R S c)`. -/
theorem mapAlgebra_equivPic (S : Type u) [CommRing S] [IsDedekindDomain S] [Algebra R S]
    [Module.IsTorsionFree R S] (c : ClassGroup R) :
    CommRing.Pic.mapAlgebra R S (ClassGroup.equivPic R c) =
      ClassGroup.equivPic S (ClassGroup.extendedHom R S c) := by
  sorry

end ClassGroup

namespace TauCeti.RingK0

open scoped nonZeroDivisors

section DedekindClassGroup

variable (R : Type u) [CommRing R] [IsDedekindDomain R]

/-! ### `KTheoryLowDegrees:Z.4/rank-class-group-equivalence` -/

/-- **Rank and Steinitz class** (`TauCeti.RingK0.rankClassGroupEquiv`):
`K₀(R) ≃+ ℤ × Additive (ClassGroup R)`, the composite of `rankPicEquiv` with
`id × (equivPic R).symm` (a real definition). -/
def rankClassGroupEquiv : K0 R ≃+ ℤ × Additive (ClassGroup R) :=
  (rankPicEquiv R).trans
    (AddEquiv.prodCongr (AddEquiv.refl ℤ) (ClassGroup.equivPic R).symm.toAdditive)

/-- **The Steinitz class** (`TauCeti.RingK0.steinitzClass`): the second coordinate,
`ofAdd ∘ equivPic.symm ∘ det`. -/
def steinitzClass : K0 R →+ Additive (ClassGroup R) :=
  (ClassGroup.equivPic R).symm.toAdditive.toAddMonoidHom.comp (detHom R)

variable {R}

/-- `steinitzClass [Rⁿ × I] = ofAdd (mk0 I)`. -/
@[simp]
theorem steinitzClass_of_prod_ideal (n : ℕ) (I : (Ideal R)⁰) :
    steinitzClass R (cls R ((Fin n → R) × (I : Ideal R))) =
      Additive.ofMul (ClassGroup.mk0 I) := by
  sorry

/-- `rankClassGroupEquiv.symm (n, ofAdd (mk0 I)) = (n - 1)[R] + [I]`. -/
@[simp]
theorem rankClassGroupEquiv_symm_mk0 (n : ℤ) (I : (Ideal R)⁰) :
    (rankClassGroupEquiv R).symm (n, Additive.ofMul (ClassGroup.mk0 I)) =
      ((n - 1 : ℤ) : K0 R) + cls R (I : Ideal R) := by
  sorry

/-- `rankClassGroupEquiv [I] = (1, ofAdd (mk0 I))`. -/
@[simp]
theorem rankClassGroupEquiv_ideal (I : (Ideal R)⁰) :
    rankClassGroupEquiv R (cls R (I : Ideal R)) = (1, Additive.ofMul (ClassGroup.mk0 I)) := by
  sorry

/-- `rankClassGroupEquiv ([R] - [I]) = (0, ofAdd (mk0 I)⁻¹)`. -/
@[simp]
theorem rankClassGroupEquiv_one_sub_ideal (I : (Ideal R)⁰) :
    rankClassGroupEquiv R (1 - cls R (I : Ideal R)) =
      (0, Additive.ofMul (ClassGroup.mk0 I)⁻¹) := by
  sorry

/-- `rankClassGroupEquiv = (refl × (equivPic R).symm) ∘ rankPicEquiv`. -/
theorem rankClassGroupEquiv_eq :
    rankClassGroupEquiv R = (rankPicEquiv R).trans
      (AddEquiv.prodCongr (AddEquiv.refl ℤ) (ClassGroup.equivPic R).symm.toAdditive) :=
  rfl

-- test TauCeti.RingK0.rankClassGroup_int_test (computation)
example : rankClassGroupEquiv ℤ (cls ℤ (Fin 3 → ℤ)) = (3, 0) := by sorry

-- test TauCeti.RingK0.rankClassGroup_zero_test (degenerate)
example : rankClassGroupEquiv R 0 = (0, 0) ∧ rankClassGroupEquiv R 1 = (1, 0) := by sorry

-- test TauCeti.RingK0.rankClassGroup_representative_test (characterisation)
example (I J : (Ideal R)⁰) (x y : R) (hx : x ≠ 0) (hy : y ≠ 0)
    (h : Ideal.span {x} * (I : Ideal R) = Ideal.span {y} * (J : Ideal R)) :
    (rankClassGroupEquiv R).symm (1, Additive.ofMul (ClassGroup.mk0 I)) = cls R (I : Ideal R) ∧
      cls R (I : Ideal R) = cls R (J : Ideal R) := by
  sorry

-- test TauCeti.RingK0.rankClassGroup_nonprincipal_test (non-example)
example (I : (Ideal R)⁰) (hI : ¬ (I : Ideal R).IsPrincipal) :
    rankℤ R (cls R (I : Ideal R)) = rankℤ R 1 ∧
      rankClassGroupEquiv R (cls R (I : Ideal R)) ≠ (1, 0) := by
  sorry

-- test TauCeti.RingK0.rankClassGroup_equivPic_test (compatibility)
example (x : K0 R) :
    ClassGroup.equivPic R (Additive.toMul (rankClassGroupEquiv R x).2) = det R x := by
  sorry

/-- `KTheoryLowDegrees:Z.4/k0-base-change-coordinates`: for `f : R → S` between Dedekind domains,
`rankPicEquiv (map f x) = (rankℤ x, ofAdd (Pic.mapRingHom f (det x)))`; for injective `f`, in
class-group coordinates `(n, c) ↦ (n, extendedHom c)`. -/
theorem rankPicEquiv_map (S : Type u) [CommRing S] [IsDedekindDomain S] (f : R →+* S)
    (x : K0 R) :
    rankPicEquiv S (map R f x) =
      (rankℤ R x, Additive.ofMul (CommRing.Pic.mapRingHom f (det R x))) := by
  sorry

theorem rankClassGroupEquiv_map (S : Type u) [CommRing S] [IsDedekindDomain S] [Algebra R S]
    [Module.IsTorsionFree R S] (x : K0 R) :
    rankClassGroupEquiv S (map R (algebraMap R S) x) =
      ((rankClassGroupEquiv R x).1, Additive.ofMul (ClassGroup.extendedHom R S
        (Additive.toMul (rankClassGroupEquiv R x).2))) := by
  sorry

end DedekindClassGroup

end TauCeti.RingK0

/-! ### `KTheoryLowDegrees:Z.4/localization-eq-integer`, `localization-class-group` -/

namespace IsDedekindDomain

open scoped nonZeroDivisors

variable {R : Type u} [CommRing R] [IsDedekindDomain R] (K : Type u) [Field K] [Algebra R K]
  [IsFractionRing R K]

/-- Helper (not a packet name): the height-one primes meeting a submonoid `M`. -/
def primesMeeting (M : Submonoid R) : Set (HeightOneSpectrum R) :=
  {v | ∃ m ∈ M, m ∈ v.asIdeal}

/-- `KTheoryLowDegrees:Z.4/localization-eq-integer`: for `M ≤ R⁰`, `S_M.integer K` is a localisation
of `R` at `M`, `S_M` the height-one primes meeting `M`. -/
theorem isLocalization_integer (M : Submonoid R) (hM : M ≤ R⁰) :
    IsLocalization M ((primesMeeting M).integer K) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/localization-class-group`: for a localisation `R_M` (`M ≤ R⁰`),
`extendedHom R R_M` is surjective with kernel generated by the classes of the primes meeting `M`;
so `Cl(R_M) ≃* Cl(R) ⧸ ⟨[v] : v ∩ M ≠ ∅⟩`. -/
theorem localization_classGroup (M : Submonoid R) (hM : M ≤ R⁰) (RM : Type u) [CommRing RM]
    [Algebra R RM] [IsLocalization M RM] [IsDedekindDomain RM] [Module.IsTorsionFree R RM] :
    Function.Surjective (ClassGroup.extendedHom R RM) ∧
      (ClassGroup.extendedHom R RM).ker =
        Subgroup.closure (HeightOneSpectrum.classGroupMk '' primesMeeting M) := by
  sorry

end IsDedekindDomain

namespace TauCeti.RingK0

open scoped nonZeroDivisors

/-- `KTheoryLowDegrees:Z.4/k0-localization`: `K₀(R) → K₀(R_M)` is `(n, c) ↦ (n, extendedHom c)` in
class-group coordinates, surjective, with kernel generated by the `[v] - [R]` for the primes `v`
meeting `M`. -/
theorem k0_localization {R : Type u} [CommRing R] [IsDedekindDomain R] (M : Submonoid R)
    (hM : M ≤ R⁰) (RM : Type u) [CommRing RM] [Algebra R RM] [IsLocalization M RM]
    [IsDedekindDomain RM] [Module.IsTorsionFree R RM] :
    Function.Surjective (map R (algebraMap R RM)) ∧
      (map R (algebraMap R RM)).ker = AddSubgroup.closure
        {x | ∃ v ∈ IsDedekindDomain.primesMeeting M,
          x = cls R (v.asIdeal : Ideal R) - 1} := by
  sorry

/-! ### Number fields: `KTheoryLowDegrees:Z.4/k0-ring-of-integers`, `k0-s-integers` -/

/-- `KTheoryLowDegrees:Z.4/k0-ring-of-integers`: `K₀(𝓞_F) ≃+ ℤ × Cl(𝓞_F)`; its torsion subgroup
`ker rankℤ ≅ Cl(𝓞_F)` has order `h_F`, and `K₀(𝓞_F) ≅ ℤ` exactly when `h_F = 1`. -/
theorem k0_ringOfIntegers (F : Type u) [Field F] [NumberField F] :
    Nat.card (rankℤ (NumberField.RingOfIntegers F)).ker = NumberField.classNumber F ∧
      (Function.Bijective (rankℤ (NumberField.RingOfIntegers F)) ↔
        NumberField.classNumber F = 1) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/k0-s-integers`: for `S` a finite set of height-one primes of `𝓞_F` (the
pinned convention; the statement holds for any `S`) and `O_{F,S} = S.integer F`,
`K₀(O_{F,S}) ≃+ ℤ × Additive (Cl(𝓞_F) ⧸ ⟨[𝔭] : 𝔭 ∈ S⟩)` (through Tau Ceti's
`integerClassGroupEquiv`), the class factor is finite, and base change from `𝓞_F` is surjective
with kernel generated by the `[𝔭] - [𝓞_F]`, `𝔭 ∈ S`. -/
theorem k0_sIntegers (F : Type u) [Field F] [NumberField F]
    (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hS : S.Finite) :
    (∃ e : K0 (S.integer F) ≃+ ℤ × Additive (ClassGroup (NumberField.RingOfIntegers F) ⧸
        Subgroup.closure (IsDedekindDomain.HeightOneSpectrum.classGroupMk '' S)),
      ∀ x, (e x).1 = rankℤ (S.integer F) x ∧
        Additive.toMul (e x).2 = IsDedekindDomain.integerClassGroupEquiv F S
          ((ClassGroup.equivPic (S.integer F)).symm (det (S.integer F) x))) ∧
    Finite (ClassGroup (S.integer F)) ∧
    Function.Surjective (map (NumberField.RingOfIntegers F)
      (algebraMap (NumberField.RingOfIntegers F) (S.integer F))) ∧
    (map (NumberField.RingOfIntegers F)
      (algebraMap (NumberField.RingOfIntegers F) (S.integer F))).ker = AddSubgroup.closure
        {x | ∃ v ∈ S, x = cls (NumberField.RingOfIntegers F) v.asIdeal - 1} := by
  sorry

/-! ### `ℤ[√-5]`: `KTheoryLowDegrees:Z.4/zsqrtd-neg-five-integers`, `nonprincipal-ideal-class` -/

open Polynomial in
/-- `KTheoryLowDegrees:Z.4/zsqrtd-neg-five-integers`: for `K = AdjoinRoot (X² + 5)` (Tau Ceti's
model of `ℚ(√-5)`) there is `θ ∈ 𝓞 K` with `θ² = -5` and `Zsqrtd.lift ⟨θ, _⟩ : ℤ[√-5] →+* 𝓞 K`
bijective. -/
theorem zsqrtd_neg_five_integers :
    ∃ (θ : NumberField.RingOfIntegers (AdjoinRoot (X ^ 2 - C (-5 : ℚ))))
      (h : θ * θ = ((-5 : ℤ) : NumberField.RingOfIntegers (AdjoinRoot (X ^ 2 - C (-5 : ℚ))))),
      Function.Bijective (Zsqrtd.lift ⟨θ, h⟩) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/nonprincipal-ideal-class`: for `A = ℤ[√-5]`, `I = (2, 1 + √-5)` and
`x = [I] - [A]`: `rankℤ x = 0`, `det x = Pic.mk I ≠ 1` (so `x ≠ 0`), `I × I ≃ₗ A × A` (so
`2x = 0`), `[I][I] = [A]`, and `K₀(A) ≃+ ℤ × ℤ/2`. -/
theorem nonprincipal_ideal_class [IsDedekindDomain (ℤ√(-5))] (I : Ideal (ℤ√(-5)))
    (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd}) [Module.Invertible (ℤ√(-5)) I] :
    rankℤ (ℤ√(-5)) (cls (ℤ√(-5)) I - 1) = 0 ∧
      det (ℤ√(-5)) (cls (ℤ√(-5)) I - 1) = CommRing.Pic.mk (ℤ√(-5)) I ∧
      CommRing.Pic.mk (ℤ√(-5)) I ≠ 1 ∧ cls (ℤ√(-5)) I - 1 ≠ 0 ∧
      Nonempty ((I × I) ≃ₗ[ℤ√(-5)] (ℤ√(-5) × ℤ√(-5))) ∧
      2 • (cls (ℤ√(-5)) I - 1) = 0 ∧ cls (ℤ√(-5)) I * cls (ℤ√(-5)) I = 1 ∧
      Nonempty (K0 (ℤ√(-5)) ≃+ ℤ × ZMod 2) := by
  sorry

open Zsqrtd Pointwise in
-- Acceptance of `Z.4/nonprincipal-ideal-class` (a complete computation): `I² = (2)` for
-- `I = (2, 1 + √-5)`, from `2 = 2(1 + √-5) - (1 + √-5)² - 2 · 2`.
example : (Ideal.span {(2 : ℤ√(-5)), 1 + sqrtd}) ^ 2 = Ideal.span {2} := by
  apply le_antisymm
  · rw [sq, Ideal.span_mul_span, Ideal.span_le]
    rintro x ⟨a, ha, b, hb, rfl⟩
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb
    rw [SetLike.mem_coe, Ideal.mem_span_singleton]
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact ⟨2, by ring⟩
    · exact ⟨1 + sqrtd, by ring⟩
    · exact ⟨1 + sqrtd, by ring⟩
    · exact ⟨⟨-2, 1⟩, by decide⟩
  · rw [Ideal.span_le, Set.singleton_subset_iff, SetLike.mem_coe, sq]
    have hI2 : (2 : ℤ√(-5)) ∈ Ideal.span {(2 : ℤ√(-5)), 1 + sqrtd} := Ideal.subset_span (by simp)
    have hI1 : 1 + sqrtd ∈ Ideal.span {(2 : ℤ√(-5)), 1 + sqrtd} := Ideal.subset_span (by simp)
    have key : (2 : ℤ√(-5)) = 2 * (1 + sqrtd) - (1 + sqrtd) * (1 + sqrtd) - 2 * 2 := by decide
    rw [key]
    exact Ideal.sub_mem _ (Ideal.sub_mem _ (Ideal.mul_mem_mul hI2 hI1) (Ideal.mul_mem_mul hI1 hI1))
      (Ideal.mul_mem_mul hI2 hI2)

-- Acceptance of `Z.4/nonprincipal-ideal-class`: the norm of `1 + √-5` is `6`.
example : Zsqrtd.norm (1 + Zsqrtd.sqrtd : ℤ√(-5)) = 6 := by decide

end TauCeti.RingK0

/-! ### `KTheoryLowDegrees:Z.4/pic-norm` and the transfer (`Z.4/invertible-injection-class` …
`Z.4/number-field-extension-k0`) -/

namespace CommRing.Pic

open scoped nonZeroDivisors

variable (R S : Type u) [CommRing R] [CommRing S] [IsDedekindDomain R] [IsDedekindDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]

/-- **The norm on Picard groups** (`CommRing.Pic.relNorm`): the transport of Tau Ceti's
`ClassGroup.relNorm` along `ClassGroup.equivPic` on both sides (a real definition). -/
noncomputable def relNorm : CommRing.Pic S →* CommRing.Pic R :=
  (ClassGroup.equivPic R).toMonoidHom.comp
    ((ClassGroup.relNorm (R := R)).comp (ClassGroup.equivPic S).symm.toMonoidHom)

variable {R S}

/-- `relNorm (equivPic S c) = equivPic R (ClassGroup.relNorm c)`. -/
theorem relNorm_equivPic (c : ClassGroup S) :
    relNorm R S (ClassGroup.equivPic S c) = ClassGroup.equivPic R (ClassGroup.relNorm c) := by
  sorry

/-- `relNorm (Pic.mk S J) = Pic.mk R (Ideal.relNorm R J)` for a nonzero ideal `J`. -/
@[simp]
theorem relNorm_mk_ideal (J : (Ideal S)⁰) :
    relNorm R S (CommRing.Pic.mk S (J : Ideal S)) =
      CommRing.Pic.mk R (Ideal.relNorm0 R J : Ideal R) := by
  sorry

/-- `relNorm (mapAlgebra R S c) = c ^ finrank R S`. -/
theorem relNorm_mapAlgebra (c : CommRing.Pic R) :
    relNorm R S (CommRing.Pic.mapAlgebra R S c) = c ^ Module.finrank R S := by
  sorry

variable (R) in
/-- `relNorm R R = id`. -/
@[simp]
theorem relNorm_self : relNorm R R = MonoidHom.id (CommRing.Pic R) := by
  sorry

/-- `relNorm R T ∘ relNorm T S = relNorm R S` for a tower (Mathlib's `Ideal.relNorm_relNorm`). -/
theorem relNorm_relNorm (T : Type u) [CommRing T] [IsDedekindDomain T] [Algebra R T]
    [Module.Finite R T] [Module.IsTorsionFree R T] [Algebra T S] [Module.Finite T S]
    [Module.IsTorsionFree T S] [IsScalarTower R T S] :
    (relNorm R T).comp (relNorm T S) = relNorm R S := by
  sorry

/-- For an invertible `S`-module `L`: `det_R(L|_R) = relNorm (Pic.mk S L) · det_R(S)`
(`Z.4/restriction-determinant` in rank one). -/
theorem relNorm_det_restrict (L : Type u) [AddCommGroup L] [Module S L] [Module.Invertible S L]
    [Module R L] [IsScalarTower R S L] [Module.Finite R L] [Module.Projective R L]
    [Module.Projective R S] :
    TauCeti.RingK0.detProjective R L =
      relNorm R S (CommRing.Pic.mk S L) * TauCeti.RingK0.detProjective R S := by
  sorry

end CommRing.Pic

-- test CommRing.Pic.relNorm_self_test (degenerate)
example (R : Type u) [CommRing R] [IsDedekindDomain R] :
    CommRing.Pic.relNorm R R = MonoidHom.id (CommRing.Pic R) :=
  CommRing.Pic.relNorm_self R

-- test CommRing.Pic.relNorm_integers_test (computation)
/- For `ℤ → 𝓞 K`, `K = ℚ(√-5)`: `Pic ℤ` is trivial, so `relNorm` kills the nontrivial class of
`Pic 𝓞 K ≅ ℤ/2`; the norm is not injective. -/
example : ¬ Function.Injective (CommRing.Pic.relNorm ℤ
    (NumberField.RingOfIntegers (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (-5 : ℚ))))) := by
  sorry

-- test CommRing.Pic.relNorm_equivPic_test (compatibility)
example (R S : Type u) [CommRing R] [CommRing S] [IsDedekindDomain R] [IsDedekindDomain S]
    [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S] (c : ClassGroup S)
    (J : (Ideal S)⁰) (x : S) (hJ : (J : Ideal S) = Ideal.span {x}) :
    CommRing.Pic.relNorm R S (ClassGroup.equivPic S c) =
        ClassGroup.equivPic R (ClassGroup.relNorm c) ∧
      CommRing.Pic.relNorm R S (CommRing.Pic.mk S (J : Ideal S)) = 1 := by
  sorry

-- test CommRing.Pic.relNorm_unnormalised_test (non-example)
/- The unnormalised `L ↦ det_R(L|_R)` sends `1 = Pic.mk S S` to `det_R S`, which is `≠ 1` when `S`
is not free over `R`; `relNorm 1 = 1`. -/
example (R S : Type u) [CommRing R] [CommRing S] [IsDedekindDomain R] [IsDedekindDomain S]
    [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S] [Module.Projective R S]
    (hS : ¬ Module.Free R S) :
    CommRing.Pic.relNorm R S 1 = 1 ∧ TauCeti.RingK0.detProjective R S ≠ 1 := by
  sorry

-- test CommRing.Pic.relNorm_ext_test (characterisation)
example (R S : Type u) [CommRing R] [CommRing S] [IsDedekindDomain R] [IsDedekindDomain S]
    [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S] (c : CommRing.Pic R)
    (hd : Module.finrank R S = 2) (hc : c ^ 2 = 1) :
    CommRing.Pic.relNorm R S (CommRing.Pic.mapAlgebra R S c) = 1 := by
  sorry

namespace Module.Invertible

variable {R : Type u} [CommRing R] {L N : Type u} [AddCommGroup L] [Module R L]
  [AddCommGroup N] [Module R N]

/-- Helper (not a packet name): **the index ideal** `𝔠(f)` of `f : L → N`, the range of
`c_f : Nᵛ ⊗ L → R`, `φ ⊗ l ↦ φ(f l)` (a real definition). -/
def indexIdeal (f : L →ₗ[R] N) : Ideal R :=
  LinearMap.range (TensorProduct.lift ((LinearMap.lcomp R R f).flip.flip))

/-- `KTheoryLowDegrees:Z.4/invertible-injection-class`: for a domain `R`, invertible `L, N` and an
injective `f : L → N`: `c_f` is injective, `𝔠(f)` is a nonzero invertible ideal with
`Pic.mk L = Pic.mk 𝔠(f) · Pic.mk N`, `𝔠` is invariant under equivalences on both sides, and for
free `L, N` with `f(l) = a n`, `𝔠(f) = aR`. (The localisation clause (v) is not restated.) -/
theorem pic_mk_eq_indexIdeal_mul [IsDomain R] [Module.Invertible R L] [Module.Invertible R N]
    (f : L →ₗ[R] N) (hf : Function.Injective f) :
    Function.Injective (TensorProduct.lift ((LinearMap.lcomp R R f).flip.flip)) ∧
      indexIdeal f ≠ ⊥ ∧
      (∃ h : Module.Invertible R (indexIdeal f),
        (haveI := h; CommRing.Pic.mk R L =
          CommRing.Pic.mk R (indexIdeal f) * CommRing.Pic.mk R N)) ∧
      (∀ (g : N ≃ₗ[R] N) (h : L ≃ₗ[R] L),
        indexIdeal (g.toLinearMap ∘ₗ f ∘ₗ h.toLinearMap) = indexIdeal f) ∧
      (∀ (l : L) (n : N) (a : R), (∀ x : L, ∃ r : R, x = r • l) → (∀ y : N, ∃ r : R, y = r • n) →
        f l = a • n → indexIdeal f = Ideal.span {a}) := by
  sorry

end Module.Invertible

namespace TauCeti.RingK0

open scoped nonZeroDivisors

section Transfer

variable (R S : Type u) [CommRing R] [CommRing S] [IsDedekindDomain R] [IsDedekindDomain S]
  [Algebra R S] [Module.Finite R S] [Module.IsTorsionFree R S]

/-- `KTheoryLowDegrees:Z.4/top-exterior-inclusion-injective`: for a nonzero ideal `J` of `S`, `J`
and `S` are finitely generated projective `R`-modules of constant rank `d = finrank R S`, and
`⋀^d_R(J ↪ S)` is injective. -/
theorem topExterior_inclusion_injective (J : (Ideal S)⁰) [Module.Finite R (J : Ideal S)]
    [Module.Projective R (J : Ideal S)] :
    (∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) (J : Ideal S) p = Module.finrank R S ∧
      Module.rankAtStalk (R := R) S p = Module.finrank R S) ∧
    Function.Injective (exteriorPower.map (Module.finrank R S)
      ((J : Ideal S).subtype.restrictScalars R)) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/index-ideal-eq-rel-norm`: the index ideal of `⋀^d_R(J ↪ S)` is
`Ideal.relNorm R J`. -/
theorem indexIdeal_exteriorPower_eq_relNorm (J : (Ideal S)⁰) :
    Module.Invertible.indexIdeal (exteriorPower.map (Module.finrank R S)
      ((J : Ideal S).subtype.restrictScalars R)) = Ideal.relNorm R (J : Ideal S) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/ideal-restriction-determinant`:
`det_R(J) = Pic.mk (Ideal.relNorm R J) · det_R(S)`. -/
theorem ideal_restriction_determinant [Module.Projective R S] (J : (Ideal S)⁰)
    [Module.Finite R (J : Ideal S)] [Module.Projective R (J : Ideal S)] :
    detProjective R (J : Ideal S) =
      CommRing.Pic.mk R (Ideal.relNorm0 R J : Ideal R) * detProjective R S := by
  sorry

/-- `KTheoryLowDegrees:Z.4/restriction-rank`: `rankℤ_R [Q|_R] = d · rankℤ_S [Q]`. -/
theorem restriction_rank (Q : Type u) [AddCommGroup Q] [Module S Q] [Module.Finite S Q]
    [Module.Projective S Q] [Module R Q] [IsScalarTower R S Q] [Module.Finite R Q]
    [Module.Projective R Q] :
    rankℤ R (cls R Q) = Module.finrank R S * rankℤ S (cls S Q) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/restriction-determinant`:
`det_R(Q|_R) = relNorm (det_S Q) · 𝔰^{rankℤ Q}` with `𝔰 = det_R(S)`. -/
theorem restriction_determinant [Module.Projective R S] (Q : Type u) [AddCommGroup Q]
    [Module S Q] [Module.Finite S Q] [Module.Projective S Q] [Module R Q] [IsScalarTower R S Q]
    [Module.Finite R Q] [Module.Projective R Q] :
    detProjective R Q =
      CommRing.Pic.relNorm R S (detProjective S Q) * detProjective R S ^ rankℤ S (cls S Q) := by
  sorry

/-- `KTheoryLowDegrees:Z.4/k0-transfer-coordinates`: `rankPicEquiv (transfer x) =
(d r, ofAdd (relNorm (det x) · 𝔰^r))`, `r = rankℤ x`; hence `transfer (map y) = [S] · y`. -/
theorem rankPicEquiv_transfer [Module.Projective R S] (x : K0 S) :
    rankPicEquiv R (transfer R S x) =
      (Module.finrank R S * rankℤ S x, Additive.ofMul (CommRing.Pic.relNorm R S (det S x) *
        detProjective R S ^ rankℤ S x)) ∧
    ∀ y : K0 R, transfer R S (map R (algebraMap R S) y) = cls R S * y := by
  sorry

/-- `KTheoryLowDegrees:Z.4/restriction-determinant-product`: for `S = Π S_i` a finite product of
finite injective Dedekind extensions of `R`, `rankℤ(transfer x) = Σ d_i r_i` and
`det(transfer x) = ∏ relNorm(det x_i) · 𝔰_i^{r_i}`, with `x_i` the components of `x`. -/
theorem restriction_determinant_product {ι : Type u} [Fintype ι] (T : ι → Type u)
    [∀ i, CommRing (T i)] [∀ i, IsDedekindDomain (T i)] [∀ i, Algebra R (T i)]
    [∀ i, Module.Finite R (T i)] [∀ i, Module.IsTorsionFree R (T i)]
    [Module.Projective R (∀ i, T i)] (x : K0 (∀ i, T i)) :
    rankℤ R (transfer R (∀ i, T i) x) =
        ∑ i, Module.finrank R (T i) * rankℤ (T i) (map _ (Pi.evalRingHom T i) x) ∧
      det R (transfer R (∀ i, T i) x) = ∏ i, CommRing.Pic.relNorm R (T i)
        (det (T i) (map _ (Pi.evalRingHom T i) x)) *
          detProjective R (T i) ^ rankℤ (T i) (map _ (Pi.evalRingHom T i) x) := by
  sorry

end Transfer

/-- `KTheoryLowDegrees:Z.4/number-field-extension-k0`: for number fields `F ⊆ F'`, in the
coordinates `K₀ ≅ ℤ × Cl`, base change is `(n, c) ↦ (n, extendedHom c)` and the transfer is
`(n, c') ↦ (d n, relNorm c' · Stⁿ)`, `St` the Steinitz class of `𝓞_{F'}` over `𝓞_F`. -/
theorem numberField_extension_k0 (F F' : Type u) [Field F] [NumberField F] [Field F']
    [NumberField F'] [Algebra F F'] [Module.Finite (NumberField.RingOfIntegers F)
      (NumberField.RingOfIntegers F')]
    [Module.IsTorsionFree (NumberField.RingOfIntegers F) (NumberField.RingOfIntegers F')] :
    (∀ x : K0 (NumberField.RingOfIntegers F),
      rankClassGroupEquiv _ (map _ (algebraMap (NumberField.RingOfIntegers F)
          (NumberField.RingOfIntegers F')) x) =
        ((rankClassGroupEquiv _ x).1, Additive.ofMul (ClassGroup.extendedHom _ _
          (Additive.toMul (rankClassGroupEquiv _ x).2)))) ∧
    ∀ x : K0 (NumberField.RingOfIntegers F'),
      rankClassGroupEquiv _ (transfer (NumberField.RingOfIntegers F)
          (NumberField.RingOfIntegers F') x) =
        (Module.finrank F F' * (rankClassGroupEquiv _ x).1,
          Additive.ofMul (ClassGroup.relNorm (Additive.toMul (rankClassGroupEquiv _ x).2) *
            (ClassGroup.equivPic _).symm (detProjective (NumberField.RingOfIntegers F)
              (NumberField.RingOfIntegers F')) ^ (rankClassGroupEquiv _ x).1)) := by
  sorry

end TauCeti.RingK0

/-! ## Stage `KTheoryLowDegrees:Z.5` — vector bundles and curves

Vector bundles are objects of Mathlib's `X.Modules` with finite local bases (Mathlib's
`LocalGeneratorsData` with `IsLocallyFreeData` and `IsFiniteType`); `K₀(Vect X)` is Tau Ceti's
`ExactK0` for the exact structure induced from the abelian category `X.Modules` (not the split
one). `Pic X` is the group of units of Tau Ceti's commutative monoid `LineBundleClass X` (every
class is a unit, Stacks 01CT; the group structure is JacobianChallenge layer A's, requested).
`P¹` and `O(n)` are not in the pinned libraries, so their statements are comments. -/

namespace TauCeti.AlgebraicGeometry

open _root_.AlgebraicGeometry Order

section VectorBundle

variable (X : Scheme.{u})

/-- **Vector bundles** (`TauCeti.AlgebraicGeometry.isVectorBundle`,
`KTheoryLowDegrees:Z.5/vector-bundle`): the object property of admitting local generator data that
is locally free with finite local bases (a real definition). -/
def isVectorBundle : ObjectProperty X.Modules :=
  fun E => ∃ q : SheafOfModules.LocalGeneratorsData.{u} (R := X.ringCatSheaf) E,
    q.IsLocallyFreeData ∧ q.IsFiniteType

/-- **The category `Vect(X)`** (`TauCeti.AlgebraicGeometry.VectorBundle`): the full subcategory of
vector bundles, with all `𝒪_X`-module maps. -/
abbrev VectorBundle : Type (u + 1) := (isVectorBundle X).FullSubcategory

/-- `isVectorBundle X` is closed under isomorphisms. -/
instance isVectorBundle.isClosedUnderIsomorphisms :
    (isVectorBundle X).IsClosedUnderIsomorphisms := by
  sorry

variable {X}

/-- `E` is a vector bundle iff every point has an open neighbourhood `U` with `E|U ≅ 𝒪_U^{⊕n}`. -/
theorem isVectorBundle_iff_locallyIso_free (E : X.Modules) :
    isVectorBundle X E ↔ ∀ x : X, ∃ (U : X.Opens) (_ : x ∈ U) (n : ℕ),
      Nonempty ((Scheme.Modules.restrictFunctor U.ι).obj E ≅
        SheafOfModules.free (R := (U : Scheme).ringCatSheaf) (ULift.{u} (Fin n))) := by
  sorry

variable (X) in
/-- `SheafOfModules.free I` is a vector bundle for finite `I`; in particular `𝒪_X` is. -/
theorem isVectorBundle_free (I : Type u) [Finite I] :
    isVectorBundle X (SheafOfModules.free (R := X.ringCatSheaf) I) := by
  sorry

variable (X) in
/-- `𝒪_X` is a vector bundle. -/
theorem isVectorBundle_unit : isVectorBundle X (SheafOfModules.unit X.ringCatSheaf) := by
  sorry

/-- A vector bundle is `IsLocallyFree` and `IsFiniteType`, hence quasi-coherent. -/
theorem isVectorBundle.isLocallyFree {E : X.Modules} (h : isVectorBundle X E) :
    SheafOfModules.IsLocallyFree (R := X.ringCatSheaf) E ∧
      SheafOfModules.IsFiniteType (R := X.ringCatSheaf) E := by
  sorry

variable (X) in
/-- A vector bundle is finitely presented (Tau Ceti's
`LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`), so it is an object of
`FinitelyPresentedSheaf X`. -/
theorem isVectorBundle.isFinitePresentation :
    isVectorBundle X ≤ SheafOfModules.isFinitePresentation X.ringCatSheaf := by
  sorry

/-- **The rank at a point** (`TauCeti.AlgebraicGeometry.VectorBundle.rankAt`): the rank of the
free `𝒪_{X,x}`-module `E_x` (a real definition, `Module.finrank` over the stalk). -/
def VectorBundle.rankAt (E : VectorBundle X) (x : X) : ℕ :=
  Module.finrank (TopCat.Presheaf.stalk (C := RingCat.{u}) (X := X.toTopCat) X.ringCatSheaf.obj x)
    (TopCat.Presheaf.stalk (C := AddCommGrpCat.{u}) (X := X.toTopCat)
      (SheafOfModules.val E.obj).presheaf x)

/-- Helper (not a packet name): an invertible sheaf is a vector bundle. -/
theorem isVectorBundle_of_isInvertible (E : X.Modules)
    [TauCeti.SheafOfModules.IsInvertible (R := X.ringCatSheaf) E] : isVectorBundle X E := by
  sorry

/-- An invertible sheaf (Tau Ceti's `IsInvertible`) is exactly a vector bundle of constant rank
one. -/
theorem isInvertible_iff_isVectorBundle_rankOne (E : X.Modules) :
    TauCeti.SheafOfModules.IsInvertible (R := X.ringCatSheaf) E ↔
      ∃ h : isVectorBundle X E, ∀ x, VectorBundle.rankAt ⟨E, h⟩ x = 1 := by
  sorry

/-- `x ↦ rankAt E x` is locally constant (constant on a connected `X`). -/
theorem VectorBundle.isLocallyConstant_rankAt (E : VectorBundle X) :
    IsLocallyConstant (VectorBundle.rankAt E) := by
  sorry

/-- Isomorphic vector bundles have the same rank function. -/
@[simp]
theorem VectorBundle.rankAt_eq_of_iso {E F : VectorBundle X} (e : E ≅ F) :
    VectorBundle.rankAt E = VectorBundle.rankAt F := by
  sorry

/-- For an open immersion `j : U → X`, `E|U` is a vector bundle with
`rankAt (E|U) u = rankAt E (j u)`. -/
theorem isVectorBundle_restrict {U : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    (E : VectorBundle X) :
    ∃ h : isVectorBundle U ((Scheme.Modules.restrictFunctor j).obj E.obj),
      ∀ u, VectorBundle.rankAt ⟨_, h⟩ u = VectorBundle.rankAt E (j u) := by
  sorry

end VectorBundle

-- test TauCeti.AlgebraicGeometry.isVectorBundle_zero_test (degenerate)
example (X : Scheme.{u}) :
    ∃ h : isVectorBundle X (0 : X.Modules), ∀ x, VectorBundle.rankAt ⟨0, h⟩ x = 0 := by
  sorry

-- test TauCeti.AlgebraicGeometry.rankAt_free_three_test (computation)
example (X : Scheme.{u}) (x : X) :
    VectorBundle.rankAt ⟨_, isVectorBundle_free X (ULift.{u} (Fin 3))⟩ x = 3 := by
  sorry

-- test TauCeti.AlgebraicGeometry.isVectorBundle_weilDivisorSheaf_test (compatibility)
example (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) (D : SchemeWeilDivisor X) :
    ∃ h : isVectorBundle X (SchemeWeilDivisor.toInvertibleSheaf hX D).obj,
      ∀ x, VectorBundle.rankAt ⟨_, h⟩ x = 1 := by
  sorry

-- test TauCeti.AlgebraicGeometry.not_isVectorBundle_free_nat_test (non-example)
example (X : Scheme.{u}) [Nonempty X] :
    SheafOfModules.IsLocallyFree (R := X.ringCatSheaf)
        (SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} ℕ)) ∧
      ¬ isVectorBundle X (SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} ℕ)) := by
  sorry

-- test TauCeti.AlgebraicGeometry.not_isVectorBundle_skyscraper_test (non-example)
/- On `Spec ℤ` the coherent sheaf `(ℤ/2)~` is not a vector bundle. -/
example : ¬ isVectorBundle (Spec (CommRingCat.of ℤ))
    ((tilde.functor (CommRingCat.of ℤ)).obj (ModuleCat.of ℤ (ZMod 2))) := by
  sorry

section ExactStructure

variable (X : Scheme.{u})

/-- `KTheoryLowDegrees:Z.5/vector-bundle-extension-closed` (1): `isVectorBundle X` contains a zero
object. -/
instance isVectorBundle_containsZero : (isVectorBundle X).ContainsZero := by
  sorry

/-- `KTheoryLowDegrees:Z.5/vector-bundle-extension-closed` (1): closure under binary biproducts. -/
instance isVectorBundle_isClosedUnderBinaryProducts :
    (isVectorBundle X).IsClosedUnderBinaryProducts := by
  sorry

/-- `KTheoryLowDegrees:Z.5/vector-bundle-extension-closed` (2)–(3): vector bundles are extension
closed in the abelian exact structure of `X.Modules` (extensions are locally split), and the kernel
of an epimorphism of vector bundles is a vector bundle. -/
theorem isExtensionClosed_isVectorBundle :
    (ExactStructure.abelian X.Modules).IsExtensionClosed (isVectorBundle X) ∧
      ∀ {E F : X.Modules} (p : E ⟶ F) [Epi p], isVectorBundle X E → isVectorBundle X F →
        isVectorBundle X (Limits.kernel p) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/vector-bundle-essentially-small`: `Vect(X)` is essentially small in
universe `u`. -/
instance isVectorBundle_essentiallySmall : ObjectProperty.EssentiallySmall.{u} (isVectorBundle X) :=
  by sorry

/-- Helper (not a packet name): **the exact structure of `Vect(X)`**, induced from the abelian exact
structure of `X.Modules` (Tau Ceti's `ExactStructure.fullSubcategory`); its conflations are the
short exact sequences of `𝒪_X`-modules with vector-bundle terms, not the split ones. -/
def vectorBundleExactStructure : ExactStructure (VectorBundle X) :=
  (ExactStructure.abelian X.Modules).fullSubcategory _ (isExtensionClosed_isVectorBundle X).1

end ExactStructure

namespace KTheory

section K0

variable (X : Scheme.{u})

/-- **`K₀` of vector bundles** (`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0`,
`KTheoryLowDegrees:Z.5/vector-bundle-k-zero`): Tau Ceti's `ExactK0 (vectorBundleExactStructure X)`
(a real definition; no new presentation). -/
def VectorBundleK0 : Type u := ExactK0.{u} (vectorBundleExactStructure X)

instance : AddCommGroup (VectorBundleK0 X) :=
  inferInstanceAs (AddCommGroup (ExactK0.{u} (vectorBundleExactStructure X)))

namespace VectorBundleK0

variable {X}

/-- `[E]` (`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.of`). -/
def of (E : VectorBundle X) : VectorBundleK0 X := ExactK0.of E

/-- `E ≅ F → [E] = [F]`. -/
@[simp]
theorem of_congr {E F : VectorBundle X} (e : E ≅ F) : of E = of F :=
  ExactK0.of_congr e

/-- `[E] = [E'] + [E'']` for a short exact sequence of `𝒪_X`-modules with vector-bundle terms. -/
theorem of_shortExact (S : ShortComplex X.Modules) (hS : S.ShortExact)
    (h₁ : isVectorBundle X S.X₁) (h₂ : isVectorBundle X S.X₂) (h₃ : isVectorBundle X S.X₃) :
    of ⟨S.X₂, h₂⟩ = of ⟨S.X₁, h₁⟩ + of ⟨S.X₃, h₃⟩ := by
  sorry

/-- `[E ⊞ F] = [E] + [F]` and `[0] = 0`. -/
@[simp]
theorem of_biprod (E F : VectorBundle X) : of (E ⊞ F) = of E + of F ∧ of (0 : VectorBundle X) = 0 :=
  ⟨ExactK0.of_biprod E F, ExactK0.of_zero⟩

/-- `[𝒪_X^{⊕n}] = n • [𝒪_X]`. -/
@[simp]
theorem of_free (n : ℕ) :
    of ⟨_, isVectorBundle_free X (ULift.{u} (Fin n))⟩ = n • of ⟨_, isVectorBundle_unit X⟩ := by
  sorry

variable {G : Type*} [AddCommGroup G]

/-- The universal property (`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.lift`): an
isomorphism-invariant function additive on short exact sequences of vector bundles descends (a
real definition through `ExactK0.lift`). -/
def lift (c : VectorBundle X → G) (hiso : ∀ ⦃E F : VectorBundle X⦄, (E ≅ F) → c E = c F)
    (hconf : ∀ ⦃S : ShortComplex (VectorBundle X)⦄, (vectorBundleExactStructure X).Conflation S →
      c S.X₂ = c S.X₁ + c S.X₃) : VectorBundleK0 X →+ G :=
  ExactK0.lift ⟨c, hiso, hconf⟩

theorem lift_of (c : VectorBundle X → G) (hiso : ∀ ⦃E F : VectorBundle X⦄, (E ≅ F) → c E = c F)
    (hconf : ∀ ⦃S : ShortComplex (VectorBundle X)⦄, (vectorBundleExactStructure X).Conflation S →
      c S.X₂ = c S.X₁ + c S.X₃) (E : VectorBundle X) : lift c hiso hconf (of E) = c E :=
  ExactK0.lift_of _ E

/-- Two additive maps agreeing on every `[E]` are equal. -/
@[ext]
theorem hom_ext {f g : VectorBundleK0 X →+ G} (h : ∀ E, f (of E) = g (of E)) : f = g :=
  ExactK0.hom_ext h

/-- Induction on classes of vector bundles. -/
theorem induction_on {motive : VectorBundleK0 X → Prop} (x : VectorBundleK0 X) (zero : motive 0)
    (of_mem : ∀ E, motive (of E)) (sub : ∀ x y, motive x → motive y → motive (x - y)) :
    motive x := by
  sorry

/-- Every class is `[E] - [F]`. -/
theorem exists_eq_sub (x : VectorBundleK0 X) : ∃ E F : VectorBundle X, x = of E - of F := by
  sorry

variable (X) in
/-- The canonical surjection `SplitK0 Vect(X) → K₀(Vect X)` (`ExactK0.fromSplit`), not injective in
general. -/
def fromSplit : SplitK0.{u} (VectorBundle X) →+ VectorBundleK0 X :=
  ExactK0.fromSplit _

end VectorBundleK0

end K0

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.empty_test (degenerate)
example (X : Scheme.{u}) [IsEmpty X] : Subsingleton (VectorBundleK0 X) := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.free_test (computation)
example (X : Scheme.{u}) :
    VectorBundleK0.of (⟨_, isVectorBundle_free X (ULift.{u} (Fin 2))⟩ ⊞ ⟨_, isVectorBundle_unit X⟩ :
      VectorBundle X) = 3 • VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩ := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.spec_field_test (compatibility)
example (F : Type u) [Field F] : Nonempty (VectorBundleK0 (Spec (CommRingCat.of F)) ≃+ ℤ) := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.euler_sequence_test (characterisation):
-- not stated here; needs `P¹_F` and its twisting sheaves `O(m)` as schemes and sheaves (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).
-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.not_split_test (non-example): not stated
-- here; needs the Euler sequence on `P¹_F` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).

/-- Helper (not a packet name): `P~` is a vector bundle on `Spec R` for finitely generated
projective `P`. -/
theorem isVectorBundle_tilde (R : Type u) [CommRing R] (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] :
    isVectorBundle (Spec (CommRingCat.of R))
      ((tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R P)) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/vector-bundle-affine-comparison`: `P ↦ P~` gives an exact equivalence
between finitely generated projective `R`-modules and `Vect(Spec R)`, every conflation of
`Vect(Spec R)` splits, and `K₀(R) ≃+ K₀(Vect Spec R)`, `[P] ↦ [P~]`, with
`rank_x(P~) = rankAtStalk P x`. -/
theorem vectorBundle_affine_comparison (R : Type u) [CommRing R] :
    ∃ e : RingK0.K0 R ≃+ VectorBundleK0 (Spec (CommRingCat.of R)),
      (∀ (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P],
        e (RingK0.cls R P) = VectorBundleK0.of ⟨_, isVectorBundle_tilde R P⟩) ∧
      ∀ S : ShortComplex (VectorBundle (Spec (CommRingCat.of R))),
        (vectorBundleExactStructure _).Conflation S → Nonempty S.Splitting := by
  sorry

section Pullback

variable {X Y : Scheme.{u}}

/-- Helper (not a packet name): pullback of vector bundles, the restriction of Mathlib's
`Scheme.Modules.pullback f` (a real definition; preservation of vector bundles omitted). -/
def pullbackFunctor (f : X ⟶ Y) : VectorBundle Y ⥤ VectorBundle X :=
  ObjectProperty.lift _ ((isVectorBundle Y).ι ⋙ Scheme.Modules.pullback f) (fun _ => by sorry)

/-- Helper instance (a true fact, proof omitted). -/
instance (f : X ⟶ Y) : (pullbackFunctor f).Additive := by sorry

/-- **Pullback on `K₀(Vect)`** (`KTheoryLowDegrees:Z.5/vector-bundle-k-zero-pullback`,
`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback`):
`f^*[E] = [f^*E]` through `ExactK0.map` (conflations of vector bundles are locally split, so no
flatness is needed; the exactness proof is omitted). -/
def VectorBundleK0.pullback (f : X ⟶ Y) : VectorBundleK0 Y →+ VectorBundleK0 X :=
  ExactK0.map (pullbackFunctor f) (by sorry)

/-- `pullback f [E] = [f^*E]`. -/
@[simp]
theorem VectorBundleK0.pullback_of (f : X ⟶ Y) (E : VectorBundle Y) :
    VectorBundleK0.pullback f (VectorBundleK0.of E) =
      VectorBundleK0.of ((pullbackFunctor f).obj E) :=
  ExactK0.map_of _ _ E

/-- `pullback (𝟙 X) = id`. -/
theorem VectorBundleK0.pullback_id :
    VectorBundleK0.pullback (𝟙 X) = AddMonoidHom.id (VectorBundleK0 X) := by
  sorry

/-- `pullback (f ≫ g) = pullback f ∘ pullback g`. -/
theorem VectorBundleK0.pullback_comp {Z : Scheme.{u}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    VectorBundleK0.pullback (f ≫ g) =
      (VectorBundleK0.pullback f).comp (VectorBundleK0.pullback g) := by
  sorry

/-- For an open immersion `j`, `pullback j [E] = [E|U]`. -/
@[simp]
theorem VectorBundleK0.pullback_restrict (j : X ⟶ Y) [IsOpenImmersion j] (E : VectorBundle Y) :
    VectorBundleK0.pullback j (VectorBundleK0.of E) =
      VectorBundleK0.of ⟨_, (isVectorBundle_restrict j E).1⟩ := by
  sorry

/-- Under the affine comparison, `pullback (Spec.map φ) = RingK0.map φ`. -/
theorem VectorBundleK0.pullback_spec {R S : Type u} [CommRing R] [CommRing S] (φ : R →+* S)
    (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P] :
    letI := φ.toAlgebra
    VectorBundleK0.pullback (Spec.map (CommRingCat.ofHom φ))
        (VectorBundleK0.of ⟨_, isVectorBundle_tilde R P⟩) =
      VectorBundleK0.of ⟨_, isVectorBundle_tilde S (S ⊗[R] P)⟩ := by
  sorry

end Pullback

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_id_test (degenerate)
example (X : Scheme.{u}) (x : VectorBundleK0 X) : VectorBundleK0.pullback (𝟙 X) x = x := by
  rw [VectorBundleK0.pullback_id]; rfl

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_unit_test (computation)
example {X Y : Scheme.{u}} (f : X ⟶ Y) :
    VectorBundleK0.pullback f (VectorBundleK0.of ⟨_, isVectorBundle_unit Y⟩) =
        VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩ ∧
      VectorBundleK0.pullback f (3 • VectorBundleK0.of ⟨_, isVectorBundle_unit Y⟩) =
        3 • VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩ := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_spec_test (compatibility)
example : VectorBundleK0.pullback (Spec.map (CommRingCat.ofHom (algebraMap ℤ ℚ)))
      (VectorBundleK0.of ⟨_, isVectorBundle_tilde ℤ ℤ⟩) =
    VectorBundleK0.of ⟨_, isVectorBundle_tilde ℚ ℚ⟩ := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.pullback_not_injective_test (non-example)
/- For `A = ℤ[√-5]` and `Spec K → Spec A` (`K` its fraction field), pullback kills `[I~] - [O]`,
a nonzero class. -/
example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I] :
    ¬ Function.Injective (VectorBundleK0.pullback
      (Spec.map (CommRingCat.ofHom (algebraMap (ℤ√(-5)) (FractionRing (ℤ√(-5))))))) := by
  sorry

section Ring

variable (X : Scheme.{u})

/-- Helper (not a packet name): the tensor product of vector bundles is a vector bundle. -/
theorem isVectorBundle_tensorProduct (E F : VectorBundle X) :
    isVectorBundle X (Scheme.Modules.tensorProduct X E.obj F.obj) := by
  sorry

/-- Helper (not a packet name): `⊗` of vector bundles as a biadditive invariant, descended by
`ExactK0.BiadditiveInvariant.bilift` (a real definition; exactness in each variable omitted). -/
def VectorBundleK0.mulHom : VectorBundleK0 X →+ VectorBundleK0 X →+ VectorBundleK0 X :=
  ExactK0.BiadditiveInvariant.bilift
    { obj := fun E F => VectorBundleK0.of ⟨_, isVectorBundle_tensorProduct X E F⟩
      map_iso₁ := by sorry
      map_iso₂ := by sorry
      map_conflation₂ := by sorry
      map_conflation₁ := by sorry }

/-- **The ring `K₀(Vect X)`** (`KTheoryLowDegrees:Z.5/vector-bundle-k-zero-ring`,
`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.instCommRing`):
`[E][F] = [E ⊗ F]` (Tau Ceti's `SheafOfModules.tensorProduct`), unit `[𝒪_X]` (a real
multiplication; the ring axioms, from the associator, unitors and braiding, are omitted). -/
instance VectorBundleK0.instCommRing : CommRing (VectorBundleK0 X) :=
  letI : Mul (VectorBundleK0 X) := ⟨fun a b => VectorBundleK0.mulHom X a b⟩
  letI : One (VectorBundleK0 X) := ⟨VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩⟩
  { (inferInstance : AddCommGroup (VectorBundleK0 X)) with
    mul := fun a b => VectorBundleK0.mulHom X a b
    one := VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩
    mul_assoc := by sorry
    one_mul := by sorry
    mul_one := by sorry
    left_distrib := by sorry
    right_distrib := by sorry
    zero_mul := by sorry
    mul_zero := by sorry
    mul_comm := by sorry
    natCast := fun n => n • VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩
    natCast_zero := by sorry
    natCast_succ := by sorry
    intCast := fun n => n • VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩
    intCast_ofNat := by sorry
    intCast_negSucc := by sorry
    npow := npowRec
    npow_zero := by sorry
    npow_succ := by sorry }

variable {X}

/-- `[E] * [F] = [E ⊗ F]`. -/
@[simp]
theorem VectorBundleK0.of_mul_of (E F : VectorBundle X) :
    VectorBundleK0.of E * VectorBundleK0.of F =
      VectorBundleK0.of ⟨_, isVectorBundle_tensorProduct X E F⟩ := by
  sorry

/-- `1 = [𝒪_X]`. -/
@[simp]
theorem VectorBundleK0.one_def :
    (1 : VectorBundleK0 X) = VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩ :=
  rfl

/-- `pullback f` is a ring homomorphism. -/
def VectorBundleK0.pullbackRingHom {Y : Scheme.{u}} (f : X ⟶ Y) :
    VectorBundleK0 Y →+* VectorBundleK0 X :=
  { VectorBundleK0.pullback f with
    map_one' := by sorry
    map_mul' := by sorry }

/-- `RingK0 R ≃+* VectorBundleK0 (Spec R)`, the affine comparison with Z.3's product
(`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.affineRingEquiv`; construction omitted). -/
def VectorBundleK0.affineRingEquiv (R : Type u) [CommRing R] :
    RingK0.K0 R ≃+* VectorBundleK0 (Spec (CommRingCat.of R)) :=
  sorry

end Ring

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.one_mul_test (degenerate)
example (X : Scheme.{u}) (x : VectorBundleK0 X) :
    1 * x = x ∧ VectorBundleK0.of (0 : VectorBundle X) * x = 0 := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.free_mul_test (computation)
example (X : Scheme.{u}) :
    VectorBundleK0.of ⟨_, isVectorBundle_free X (ULift.{u} (Fin 2))⟩ *
        VectorBundleK0.of ⟨_, isVectorBundle_free X (ULift.{u} (Fin 3))⟩ =
      6 • (1 : VectorBundleK0 X) := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.affine_mul_test (compatibility)
example (R : Type u) [CommRing R] (x y : RingK0.K0 R) :
    VectorBundleK0.affineRingEquiv R (x * y) =
      VectorBundleK0.affineRingEquiv R x *
        VectorBundleK0.affineRingEquiv R y :=
  map_mul _ x y

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.not_product_ring_test (non-example): not
-- stated here; needs `P¹_F` and `O(-1)` (supplier: AlgebraicModuliForArithmeticGeometry:R09.1).

section Rank

variable (X : Scheme.{u})

/-- **The rank on `K₀(Vect X)`** (`KTheoryLowDegrees:Z.5/vector-bundle-rank`,
`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank`):
`[E] ↦ (x ↦ rank_x E)`, a ring homomorphism to `H⁰(X; ℤ) = LocallyConstant X ℤ` (a real
definition through `lift`; additivity and multiplicativity omitted). -/
def VectorBundleK0.rank : VectorBundleK0 X →+* LocallyConstant X ℤ :=
  { VectorBundleK0.lift (G := LocallyConstant X ℤ)
      (fun E => ⟨fun x => (VectorBundle.rankAt E x : ℤ), by sorry⟩) (by sorry) (by sorry) with
    map_one' := by sorry
    map_mul' := by sorry }

variable {X}

/-- `rank [E] x = rankAt E x`. -/
@[simp]
theorem VectorBundleK0.rank_of (E : VectorBundle X) (x : X) :
    VectorBundleK0.rank X (VectorBundleK0.of E) x = VectorBundle.rankAt E x := by
  sorry

/-- `rank 1 = 1`. -/
@[simp]
theorem VectorBundleK0.rank_one : VectorBundleK0.rank X 1 = 1 :=
  map_one _

variable (X) in
/-- The componentwise free classes: `rankSection : H⁰(X; ℤ) →+* K₀(Vect X)` with
`rank ∘ rankSection = id` (construction by `𝒪^f` omitted). -/
def VectorBundleK0.rankSection : LocallyConstant X ℤ →+* VectorBundleK0 X :=
  sorry

theorem VectorBundleK0.rank_rankSection (f : LocallyConstant X ℤ) :
    VectorBundleK0.rank X (VectorBundleK0.rankSection X f) = f := by
  sorry

variable (X) in
/-- `K̃₀(X) = ker rank`, an ideal (`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.reduced`). -/
def VectorBundleK0.reduced : Ideal (VectorBundleK0 X) := RingHom.ker (VectorBundleK0.rank X)

variable (X) in
/-- On a connected `X`, `rankℤ : K₀(Vect X) →+* ℤ` with `rank = const ∘ rankℤ` (a real definition,
evaluation at any point). -/
def VectorBundleK0.rankℤ [ConnectedSpace X] : VectorBundleK0 X →+* ℤ :=
  (LocallyConstant.evalRingHom (Classical.arbitrary X)).comp (VectorBundleK0.rank X)

/-- `rank (pullback f x) = rank x ∘ f`. -/
theorem VectorBundleK0.rank_pullback {Y : Scheme.{u}} (f : X ⟶ Y) (x : VectorBundleK0 Y) :
    VectorBundleK0.rank X (VectorBundleK0.pullback f x) =
      (VectorBundleK0.rank Y x).comap f.base.hom := by
  sorry

/-- On `Spec R`, `rank` corresponds to `RingK0.rank` under the affine comparison. -/
theorem VectorBundleK0.rank_affine (R : Type u) [CommRing R] (P : Type u) [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] (p : PrimeSpectrum R) :
    VectorBundleK0.rank _ (VectorBundleK0.of ⟨_, isVectorBundle_tilde R P⟩) p =
      RingK0.rank R (RingK0.cls R P) p := by
  sorry

end Rank

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_empty_test (degenerate)
example (X : Scheme.{u}) [IsEmpty X] : Subsingleton (LocallyConstant X ℤ) := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_free_test (computation)
example (X : Scheme.{u}) :
    VectorBundleK0.rank X (3 • VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩ -
      VectorBundleK0.of ⟨_, isVectorBundle_free X (ULift.{u} (Fin 2))⟩) = 1 := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_affine_test (compatibility)
example (R : Type u) [CommRing R] (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] (p : PrimeSpectrum R) :
    VectorBundleK0.rank _ (VectorBundleK0.of ⟨_, isVectorBundle_tilde R P⟩) p =
      RingK0.rank R (RingK0.cls R P) p :=
  VectorBundleK0.rank_affine R P p

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.rank_disconnected_test (non-example)
example (F : Type u) [Field F] :
    ∃ p q : PrimeSpectrum (F × F), VectorBundleK0.rank _
        (VectorBundleK0.of ⟨_, isVectorBundle_tilde (F × F) (RingK0.fstLine F)⟩) p ≠
      VectorBundleK0.rank _
        (VectorBundleK0.of ⟨_, isVectorBundle_tilde (F × F) (RingK0.fstLine F)⟩) q := by
  sorry

end KTheory

end TauCeti.AlgebraicGeometry

/-! ### Exterior powers and determinants of vector bundles -/

namespace TauCeti.SheafOfModules

open _root_.AlgebraicGeometry TauCeti.AlgebraicGeometry

variable {X : Scheme.{u}}

/-- **Exterior powers of a sheaf of modules** (`TauCeti.SheafOfModules.exteriorPower`,
`KTheoryLowDegrees:Z.5/sheaf-exterior-power`): the sheafification (Mathlib's
`PresheafOfModules.sheafification`) of `U ↦ ⋀ⁿ_{𝒪_X(U)} F(U)`. The presheaf of modules (whose
restriction maps are the exterior powers of the restrictions, read through
`Z.3/exterior-base-change`) is not built here; the value is pinned by the lemmas below. -/
def exteriorPower (n : ℕ) (F : X.Modules) : X.Modules :=
  sorry

/-- Helper (not a packet name): the local sections of `ΛⁿF` over `U`. -/
abbrev exteriorPower.sections (n : ℕ) (F : X.Modules) (U : X.Opens) : Type u :=
  Γ(exteriorPower n F, U)

/-- The alternating map `F(U)^{×n} → (ΛⁿF)(U)`, `s₁, …, s_n ↦ s₁ ∧ ⋯ ∧ s_n`
(`TauCeti.SheafOfModules.exteriorPower.ιMulti`; construction omitted). -/
def exteriorPower.ιMulti (n : ℕ) (F : X.Modules) (U : X.Opens) :
    (Fin n → Γ(F, U)) → Γ(exteriorPower n F, U) :=
  sorry

/-- `Λⁿ(φ) : ΛⁿF ⟶ ΛⁿG`, with `map_id` and `map_comp`
(`TauCeti.SheafOfModules.exteriorPower.map`; construction omitted). -/
def exteriorPower.map (n : ℕ) {F G : X.Modules} (φ : F ⟶ G) :
    exteriorPower n F ⟶ exteriorPower n G :=
  sorry

theorem exteriorPower.map_id (n : ℕ) (F : X.Modules) :
    exteriorPower.map n (𝟙 F) = 𝟙 (exteriorPower n F) := by
  sorry

theorem exteriorPower.map_comp (n : ℕ) {F G H : X.Modules} (φ : F ⟶ G) (ψ : G ⟶ H) :
    exteriorPower.map n (φ ≫ ψ) = exteriorPower.map n φ ≫ exteriorPower.map n ψ := by
  sorry

/-- `Λ⁰F ≅ 𝒪_X`. -/
def exteriorPower.zeroIso (F : X.Modules) :
    exteriorPower 0 F ≅ SheafOfModules.unit X.ringCatSheaf :=
  sorry

/-- `Λ¹F ≅ F`. -/
def exteriorPower.oneIso (F : X.Modules) : exteriorPower 1 F ≅ F :=
  sorry

-- `TauCeti.SheafOfModules.exteriorPower.stalkIso`: not stated here; needs the module structure of
-- the stalk `F_x` over the commutative stalk ring `𝒪_{X,x}` (Mathlib's `Stalk.lean` provides it
-- only over the `RingCat`-valued stalk of `X.ringCatSheaf`, on which `⋀ⁿ` cannot be formed)
-- (supplier: KTheoryLowDegrees:Z.5/sheaf-exterior-power). Its rank consequence is
-- `isVectorBundle_exteriorPower` below.

/-- `Λⁿ(F|U) ≅ (ΛⁿF)|U` for an open immersion. -/
theorem exteriorPower.restrictIso (n : ℕ) {U : Scheme.{u}} (j : U ⟶ X) [IsOpenImmersion j]
    (F : X.Modules) :
    Nonempty (exteriorPower n ((Scheme.Modules.restrictFunctor j).obj F) ≅
      (Scheme.Modules.restrictFunctor j).obj (exteriorPower n F)) := by
  sorry

/-- `f^*(ΛⁿF) ≅ Λⁿ(f^*F)`. -/
theorem exteriorPower.pullbackIso (n : ℕ) {Y : Scheme.{u}} (f : Y ⟶ X) (F : X.Modules) :
    Nonempty ((Scheme.Modules.pullback f).obj (exteriorPower n F) ≅
      exteriorPower n ((Scheme.Modules.pullback f).obj F)) := by
  sorry

/-- On `Spec R`, `Λⁿ(M~) ≅ (⋀ⁿ_R M)~`. -/
theorem exteriorPower.tildeIso (n : ℕ) (R : Type u) [CommRing R] (M : Type u) [AddCommGroup M]
    [Module R M] :
    Nonempty (exteriorPower n ((tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R M)) ≅
      (tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R (⋀[R]^n M))) := by
  sorry

-- test TauCeti.SheafOfModules.exteriorPower_zero_test (degenerate)
example (F : X.Modules) : Nonempty (exteriorPower 0 F ≅ SheafOfModules.unit X.ringCatSheaf) :=
  ⟨exteriorPower.zeroIso F⟩

-- test TauCeti.SheafOfModules.exteriorPower_free_test (computation)
example :
    Nonempty (exteriorPower 2 (SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin 3))) ≅
      SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin 3))) := by
  sorry

-- test TauCeti.SheafOfModules.exteriorPower_tilde_test (compatibility)
example (R : Type u) [CommRing R] (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P]
    [Module.Projective R P] (n : ℕ) :
    Nonempty (exteriorPower n ((tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R P)) ≅
      (tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R (⋀[R]^n P))) :=
  exteriorPower.tildeIso n R P

-- test TauCeti.SheafOfModules.exteriorPower_not_presheaf_test (non-example)
/- The presheaf `U ↦ ⋀ⁿ_{𝒪(U)} F(U)` need not be a sheaf, so the sections of `ΛⁿF` are not the
exterior powers of the sections in general (on `P¹` with `F = O(1)²`: `Γ(Λ²F) = Γ(O(2)) = k³` while
`⋀²_k Γ(F) = ⋀²k⁴ = k⁶`); only for vector bundles and affine `U` do they agree. -/
example : ¬ ∀ (X : Scheme.{u}) (F : X.Modules) (U : X.Opens),
    Nonempty (Γ(exteriorPower 2 F, U) ≃+ ⋀[Γ(X, U)]^2 Γ(F, U)) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/exterior-power-vector-bundle`: `ΛⁿE` is a vector bundle with
`rank_x(ΛⁿE) = C(rank_x E, n)`; it vanishes where `rank E < n`. -/
theorem isVectorBundle_exteriorPower (n : ℕ) (E : VectorBundle X) :
    ∃ h : isVectorBundle X (exteriorPower n E.obj),
      ∀ x, VectorBundle.rankAt ⟨_, h⟩ x = (VectorBundle.rankAt E x).choose n := by
  sorry

/-- `KTheoryLowDegrees:Z.5/exterior-power-extension-filtration`: for a short exact sequence
`0 → E' → E → E'' → 0` of vector bundles, `ΛⁿE` has a filtration `F⁰ = ⊤ ⊇ ⋯ ⊇ Fⁿ⁺¹ = ⊥` by
subsheaves with `Fⁱ/Fⁱ⁺¹ ≅ ΛⁱE' ⊗ Λⁿ⁻ⁱE''`; hence `[ΛⁿE] = Σ [ΛⁱE' ⊗ Λⁿ⁻ⁱE'']` in `K₀(Vect X)`. -/
theorem exteriorPower_extension_filtration (S : ShortComplex X.Modules) (hS : S.ShortExact)
    (n : ℕ) :
    ∃ (Fil : ℕ → Subobject (exteriorPower n S.X₂)) (hFil : Antitone Fil),
      Fil 0 = ⊤ ∧ Fil (n + 1) = ⊥ ∧
      ∀ i, i ≤ n → Nonempty (Limits.cokernel (Subobject.ofLE (Fil (i + 1)) (Fil i)
          (hFil (Nat.le_succ i))) ≅
        Scheme.Modules.tensorProduct X (exteriorPower i S.X₁) (exteriorPower (n - i) S.X₃)) := by
  sorry

end TauCeti.SheafOfModules

/-! ### `KTheoryLowDegrees:Z.5/determinant-bundle` and its properties -/

namespace TauCeti.AlgebraicGeometry

open _root_.AlgebraicGeometry Order TauCeti.SheafOfModules

section Determinant

variable {X : Scheme.{u}}

/-- Helper (not a packet name): the clopen subset `X_r = {x : rank_x E = r}` as an open. -/
def VectorBundle.rankOpen (E : VectorBundle X) (r : ℕ) : X.Opens :=
  ⟨{x | VectorBundle.rankAt E x = r}, (VectorBundle.isLocallyConstant_rankAt E).isOpen_fiber r⟩

/-- **The determinant line bundle** (`TauCeti.AlgebraicGeometry.VectorBundle.det`): the invertible
sheaf equal to `Λʳ(E|X_r)` on each clopen `X_r = {rank E = r}` (no gluing condition arises). The
construction (by the disjoint open cover `X = ⊔ X_r`) is omitted; the value is pinned by the
lemmas below. -/
def VectorBundle.det (E : VectorBundle X) : InvertibleSheaf X :=
  sorry

/-- `(det E)|X_r ≅ Λʳ(E|X_r)`. -/
theorem VectorBundle.det_restrict (E : VectorBundle X) (r : ℕ) :
    Nonempty ((Scheme.Modules.restrictFunctor (E.rankOpen r).ι).obj (VectorBundle.det E).obj ≅
      exteriorPower r ((Scheme.Modules.restrictFunctor (E.rankOpen r).ι).obj E.obj)) := by
  sorry

/-- `det φ : det E ≅ det F` for `φ : E ≅ F` (`TauCeti.AlgebraicGeometry.VectorBundle.detIso`;
construction omitted), with `detIso_refl` and `detIso_trans`. -/
def VectorBundle.detIso {E F : VectorBundle X} (φ : E ≅ F) :
    VectorBundle.det E ≅ VectorBundle.det F :=
  sorry

theorem VectorBundle.detIso_refl (E : VectorBundle X) :
    VectorBundle.detIso (Iso.refl E) = Iso.refl _ := by
  sorry

theorem VectorBundle.detIso_trans {E F G : VectorBundle X} (φ : E ≅ F) (ψ : F ≅ G) :
    VectorBundle.detIso (φ ≪≫ ψ) = VectorBundle.detIso φ ≪≫ VectorBundle.detIso ψ := by
  sorry

variable (X) in
/-- `det 𝒪_X^{⊕r} ≅ 𝒪_X`. -/
@[simp]
theorem VectorBundle.det_free (r : ℕ) :
    Nonempty ((VectorBundle.det ⟨_, isVectorBundle_free X (ULift.{u} (Fin r))⟩).obj ≅
      SheafOfModules.unit X.ringCatSheaf) := by
  sorry

/-- Helper (not a packet name): an invertible sheaf as a vector bundle. -/
def lineBundle (L : InvertibleSheaf X) : VectorBundle X :=
  ⟨L.obj, isVectorBundle_of_isInvertible L.obj⟩

/-- `det L ≅ L` for an invertible sheaf `L`. -/
@[simp]
theorem VectorBundle.det_invertible (L : InvertibleSheaf X) :
    Nonempty ((VectorBundle.det (lineBundle L)).obj ≅ L.obj) := by
  sorry

variable (X) in
/-- `det 0 ≅ 𝒪_X`. -/
@[simp]
theorem VectorBundle.det_zero :
    Nonempty ((VectorBundle.det (0 : VectorBundle X)).obj ≅ SheafOfModules.unit X.ringCatSheaf) :=
  by sorry

/-- `det(f^*E) ≅ f^*(det E)`. -/
theorem VectorBundle.det_pullback {Y : Scheme.{u}} (f : Y ⟶ X) (E : VectorBundle X) :
    Nonempty ((VectorBundle.det ((KTheory.pullbackFunctor f).obj E)).obj ≅
      (Scheme.Modules.pullback f).obj (VectorBundle.det E).obj) := by
  sorry

/-- On `Spec R`: `det(P~) ≅ (detProjective P)~`, Z.3's componentwise determinant. -/
theorem VectorBundle.det_tilde (R : Type u) [CommRing R] (P : Type u) [AddCommGroup P]
    [Module R P] [Module.Finite R P] [Module.Projective R P] :
    Nonempty ((VectorBundle.det ⟨_, KTheory.isVectorBundle_tilde R P⟩).obj ≅
      (tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R (RingK0.detModule R P))) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/determinant-bundle-extension`: for a short exact sequence of vector
bundles, `det E' ⊗ det E'' ≅ det E` canonically; in particular
`mk (det E) = mk (det E') * mk (det E'')`. -/
theorem VectorBundle.det_extension (S : ShortComplex X.Modules) (hS : S.ShortExact)
    (h₁ : isVectorBundle X S.X₁) (h₂ : isVectorBundle X S.X₂) (h₃ : isVectorBundle X S.X₃) :
    Nonempty (Scheme.Modules.tensorProduct X (VectorBundle.det ⟨_, h₁⟩).obj
        (VectorBundle.det ⟨_, h₃⟩).obj ≅ (VectorBundle.det ⟨_, h₂⟩).obj) ∧
      LineBundleClass.mk (VectorBundle.det ⟨_, h₂⟩) =
        LineBundleClass.mk (VectorBundle.det ⟨_, h₁⟩) *
          LineBundleClass.mk (VectorBundle.det ⟨_, h₃⟩) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/determinant-bundle-tensor`: for `E, F` of constant ranks `m, n`,
`det(E ⊗ F) ≅ (det E)^{⊗n} ⊗ (det F)^{⊗m}`; on classes `mk (det E)^n * mk (det F)^m`. -/
theorem VectorBundle.det_tensor (E F : VectorBundle X) (m n : ℕ)
    (hE : ∀ x, VectorBundle.rankAt E x = m) (hF : ∀ x, VectorBundle.rankAt F x = n) :
    LineBundleClass.mk (VectorBundle.det ⟨_, KTheory.isVectorBundle_tensorProduct X E F⟩) =
      LineBundleClass.mk (VectorBundle.det E) ^ n *
        LineBundleClass.mk (VectorBundle.det F) ^ m := by
  sorry

end Determinant

-- test TauCeti.AlgebraicGeometry.VectorBundle.det_zero_test (degenerate)
example (X : Scheme.{u}) :
    Nonempty ((VectorBundle.det (0 : VectorBundle X)).obj ≅ SheafOfModules.unit X.ringCatSheaf) :=
  VectorBundle.det_zero X

-- test TauCeti.AlgebraicGeometry.VectorBundle.det_free_test (computation)
example (X : Scheme.{u}) :
    LineBundleClass.mk (VectorBundle.det ⟨_, isVectorBundle_free X (ULift.{u} (Fin 5))⟩) = 1 := by
  sorry

-- test TauCeti.AlgebraicGeometry.VectorBundle.det_tilde_test (compatibility)
/- For `A = ℤ[√-5]`, `I = (2, 1 + √-5)`: `det (A ⊕ I)~ ≅ I~`. -/
example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I] :
    Nonempty ((VectorBundle.det ⟨_, KTheory.isVectorBundle_tilde (ℤ√(-5)) (ℤ√(-5) × I)⟩).obj ≅
      (tilde.functor (CommRingCat.of (ℤ√(-5)))).obj (ModuleCat.of (ℤ√(-5)) I)) := by
  sorry

-- test TauCeti.AlgebraicGeometry.VectorBundle.det_not_top_power_test (non-example)
/- On `Spec(F × F)` with `E = (F × F²)~`: `det E` is invertible while neither `Λ¹E` nor `Λ²E` is. -/
example (F : Type u) [Field F] :
    let E : VectorBundle (Spec (CommRingCat.of (F × F))) :=
      ⟨_, KTheory.isVectorBundle_tilde (F × F)
        (RingK0.fstLine F × (RingK0.sndLine F × RingK0.sndLine F))⟩
    ¬ TauCeti.SheafOfModules.IsInvertible (R := (Spec (CommRingCat.of (F × F))).ringCatSheaf)
        (exteriorPower 1 E.obj) ∧
      ¬ TauCeti.SheafOfModules.IsInvertible (R := (Spec (CommRingCat.of (F × F))).ringCatSheaf)
        (exteriorPower 2 E.obj) := by
  sorry

namespace KTheory

section VectorBundleDeterminant

variable {X : Scheme.{u}}

variable (X) in
/-- Helper (not a packet name): `Pic X`, the group of units of Tau Ceti's commutative monoid
`LineBundleClass X` (which is all of it by Stacks 01CT; JacobianChallenge layer A, requested). -/
abbrev Pic : Type (u + 1) := (LineBundleClass X)ˣ

/-- Helper (not a packet name): the class of a determinant line bundle is a unit. -/
theorem isUnit_mk_det (E : VectorBundle X) : IsUnit (LineBundleClass.mk (VectorBundle.det E)) := by
  sorry

/-- **The determinant on `K₀(Vect X)`** (`KTheoryLowDegrees:Z.5/vector-bundle-determinant`,
`TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det`):
`det : K₀(Vect X) →+ Additive (Pic X)`, `[E] ↦ [det E]`, additive-to-multiplicative (a real
definition through `lift`; multiplicativity on extensions is `VectorBundle.det_extension`). -/
def VectorBundleK0.det : VectorBundleK0 X →+ Additive (Pic X) :=
  VectorBundleK0.lift (fun E => Additive.ofMul (isUnit_mk_det E).unit) (by sorry) (by sorry)

/-- `det [E] = ofMul (mk (det E))`. -/
@[simp]
theorem VectorBundleK0.det_of (E : VectorBundle X) :
    ((Additive.toMul (VectorBundleK0.det (VectorBundleK0.of E)) : Pic X) : LineBundleClass X) =
      LineBundleClass.mk (VectorBundle.det E) := by
  sorry

/-- `toMul (det ([E] - [F])) = mk (det E) * (mk (det F))⁻¹`. -/
@[simp]
theorem VectorBundleK0.det_sub (E F : VectorBundle X) :
    Additive.toMul (VectorBundleK0.det (VectorBundleK0.of E - VectorBundleK0.of F)) =
      (isUnit_mk_det E).unit * (isUnit_mk_det F).unit⁻¹ := by
  sorry

/-- `det [L] = ofMul (mk L)` for an invertible sheaf. -/
@[simp]
theorem VectorBundleK0.det_invertible (L : InvertibleSheaf X) :
    ((Additive.toMul (VectorBundleK0.det (VectorBundleK0.of (lineBundle L))) : Pic X) :
      LineBundleClass X) = LineBundleClass.mk L := by
  sorry

/-- Helper (not a packet name): pullback of an invertible sheaf. -/
theorem isInvertible_pullback {Y : Scheme.{u}} (f : Y ⟶ X) (L : InvertibleSheaf X) :
    TauCeti.AlgebraicGeometry.SheafOfModules.isInvertible Y
      ((Scheme.Modules.pullback f).obj L.obj) :=
  by sorry

/-- `det(pullback f x)` is the pullback of the class `det x`: `det (f^*E) ≅ f^*(det E)`. -/
theorem VectorBundleK0.det_pullback {Y : Scheme.{u}} (f : Y ⟶ X) (E : VectorBundle X) :
    ((Additive.toMul (VectorBundleK0.det (VectorBundleK0.pullback f (VectorBundleK0.of E))) :
        Pic Y) : LineBundleClass Y) =
      LineBundleClass.mk ⟨_, isInvertible_pullback f (VectorBundle.det E)⟩ := by
  sorry

/-- On `Spec R`, `det` corresponds to `RingK0.detHom` under the affine and Picard comparisons. -/
theorem VectorBundleK0.det_affine (R : Type u) [CommRing R] :
    ∃ e : CommRing.Pic R ≃* Pic (Spec (CommRingCat.of R)),
      ∀ (P : Type u) [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P],
        Additive.toMul (VectorBundleK0.det (VectorBundleK0.of ⟨_, isVectorBundle_tilde R P⟩)) =
          e (RingK0.detProjective R P) := by
  sorry

end VectorBundleDeterminant

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_zero_test (degenerate)
example (X : Scheme.{u}) : VectorBundleK0.det (0 : VectorBundleK0 X) = 0 := map_zero _

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_free_test (computation)
example (X : Scheme.{u}) (n : ℤ) :
    VectorBundleK0.det (n • VectorBundleK0.of ⟨_, isVectorBundle_unit X⟩) = 0 := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_affine_test (compatibility)
example (I : Ideal (ℤ√(-5))) (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd})
    [Module.Invertible (ℤ√(-5)) I] :
    VectorBundleK0.det (VectorBundleK0.of ⟨_, isVectorBundle_tilde (ℤ√(-5)) I⟩ -
      VectorBundleK0.of ⟨_, isVectorBundle_tilde (ℤ√(-5)) (ℤ√(-5))⟩) ≠ 0 := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.VectorBundleK0.det_not_ringHom_test (non-example): not
-- stated here; needs `P¹_F` with `O(1)`, `O(2)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1).

/-- `KTheoryLowDegrees:Z.5/rank-determinant-surjective`: `(rank, det)` is surjective onto
`H⁰(X; ℤ) × Pic X`; on a connected `X` it is multiplicative for
`(a, L)(b, M) = (ab, L^b M^a)` (the general `L^a` for locally constant `a` needs Z.3's
`zpowLocallyConstant` on schemes, not formed here). -/
theorem rank_det_surjective (X : Scheme.{u}) :
    Function.Surjective (fun x : VectorBundleK0 X =>
      (VectorBundleK0.rank X x, VectorBundleK0.det x)) ∧
    ∀ [ConnectedSpace X] (x y : VectorBundleK0 X),
      Additive.toMul (VectorBundleK0.det (x * y)) =
        Additive.toMul (VectorBundleK0.det x) ^ VectorBundleK0.rankℤ X y *
          Additive.toMul (VectorBundleK0.det y) ^ VectorBundleK0.rankℤ X x := by
  sorry

/-! ### Regular curves (`Z.5/regular-curve-integral` … `Z.5/doubled-line-example`)

The **regular-curve package**: `X` noetherian and integral, `coheight y ≤ 1` for all `y`
(`hX`), and the stalks at codimension-one points are DVRs — Tau Ceti's hypotheses for
`SchemeWeilDivisor.toLineBundleClass`. No separatedness. -/

/-- `KTheoryLowDegrees:Z.5/regular-curve-integral`: a connected noetherian scheme with regular
local rings of dimension `≤ 1` is integral with DVR stalks at codimension-one points; conversely
the package gives regular local rings. -/
theorem regular_curve_integral (X : Scheme.{u}) [IsNoetherian X] [ConnectedSpace X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) (hdim : ∀ x : X, coheight x ≤ 1) :
    IsIntegral X := by
  sorry

theorem regular_curve_dvr (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) (hdim : ∀ x : X, coheight x ≤ 1) :
    ∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X)) := by
  sorry

theorem regular_curve_integral_converse (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x) := by
  sorry

/-- Helper (not a packet name): the coherent (finitely presented) sheaves as an object property of
`X.Modules` (Tau Ceti's `FinitelyPresentedSheaf`). -/
abbrev isCoherent (X : Scheme.{u}) : ObjectProperty X.Modules :=
  SheafOfModules.isFinitePresentation X.ringCatSheaf

/-- `KTheoryLowDegrees:Z.5/regular-curve-resolution-property`: a noetherian scheme of dimension
`≤ 1` has affine diagonal ((a)); if moreover regular, every coherent sheaf is a quotient of a vector
bundle ((b)). (Part (c), an ample invertible sheaf for separated `X`, is not stated: "ample" is not
in the pinned libraries.) -/
theorem regular_curve_resolution_property (X : Scheme.{u}) [IsNoetherian X]
    (hdim : ∀ x : X, coheight x ≤ 1) :
    (∀ U V : X.Opens, IsAffineOpen U → IsAffineOpen V → IsAffineOpen (U ⊓ V)) ∧
      ((∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) →
        ∀ F : X.Modules, isCoherent X F → ∃ (E : VectorBundle X) (p : E.obj ⟶ F), Epi p) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/regular-curve-finite-resolution`: on a regular noetherian scheme of
dimension `≤ 1` the kernel of every surjection from a vector bundle onto a coherent sheaf is a
vector bundle. -/
theorem regular_curve_finite_resolution (X : Scheme.{u}) [IsNoetherian X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) (hdim : ∀ x : X, coheight x ≤ 1)
    (E : VectorBundle X) (F : X.Modules) (hF : isCoherent X F) (p : E.obj ⟶ F) [Epi p] :
    isVectorBundle X (Limits.kernel p) := by
  sorry

section G0

variable (X : Scheme.{u}) [IsLocallyNoetherian X]

/-- Helper instances (true facts, proofs omitted) for the coherent sheaves. -/
instance : (isCoherent X).ContainsZero := by sorry
instance : (isCoherent X).IsClosedUnderBinaryProducts := by sorry
instance : ObjectProperty.EssentiallySmall.{u} (isCoherent X) := by sorry

/-- Helper (a true fact on a locally noetherian scheme, proof omitted). -/
theorem isExtensionClosed_isCoherent :
    (ExactStructure.abelian X.Modules).IsExtensionClosed (isCoherent X) := by
  sorry

/-- Stand-in for `G₀(X)` (`SchemeKTheoryOperations:S.2/g-theory-of-a-scheme` in degree zero):
Tau Ceti's `ExactK0` of the coherent sheaves with the exact structure induced from `X.Modules`
(on a locally noetherian `X` they form an abelian subcategory, and this is `AbelianK0 (Coh X)`;
Tau Ceti has no abelian instance on `FinitelyPresentedSheaf`). -/
def G0 : Type u :=
  ExactK0.{u}
    ((ExactStructure.abelian X.Modules).fullSubcategory _ (isExtensionClosed_isCoherent X))

instance : AddCommGroup (G0 X) :=
  inferInstanceAs (AddCommGroup (ExactK0.{u}
    ((ExactStructure.abelian X.Modules).fullSubcategory _ (isExtensionClosed_isCoherent X))))

variable {X}

/-- Helper (not a packet name): the class of a coherent sheaf in `G₀(X)`. -/
def G0.of (F : (isCoherent X).FullSubcategory) : G0 X := ExactK0.of F

variable (X)

/-- **The vector-bundle Cartan map** `c_X : K₀(Vect X) → G₀(X)`, `[E] ↦ [E]`, `ExactK0.map` of
`Vect(X) ⊂ Coh(X)` (a real definition; conflation-exactness omitted). -/
def cartan : VectorBundleK0 X →+ G0 X :=
  ExactK0.map (ObjectProperty.ιOfLE (isVectorBundle.isFinitePresentation X)) (by sorry)

end G0

/-- `KTheoryLowDegrees:Z.5/regular-curve-cartan-iso`: for a regular noetherian scheme of dimension
`≤ 1`, `c_X : K₀(Vect X) → G₀(X)` is bijective, with inverse `[F] ↦ [E₀] - [E₁]` for a resolution
`0 → E₁ → E₀ → F → 0`. (Its identification with `π₀` of the Poincaré-duality equivalence is not
stated: it needs `K(X)`, `G(X)` as spectra, SchemeKTheoryOperations:S.2.) -/
theorem regular_curve_cartan_iso (X : Scheme.{u}) [IsNoetherian X]
    (hreg : ∀ x : X, IsRegularLocalRing (X.presheaf.stalk x)) (hdim : ∀ x : X, coheight x ≤ 1) :
    Function.Bijective (cartan X) ∧
      ∀ (S : ShortComplex X.Modules) (hS : S.ShortExact) (h₁ : isVectorBundle X S.X₁)
        (h₂ : isVectorBundle X S.X₂) (hF : isCoherent X S.X₃),
        cartan X (VectorBundleK0.of ⟨_, h₂⟩ - VectorBundleK0.of ⟨_, h₁⟩) = G0.of ⟨_, hF⟩ := by
  sorry

section Curve

variable {X : Scheme.{u}} [IsIntegral X] [IsNoetherian X]
  [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
  (hX : ∀ y : X, coheight y ≤ 1)

/-- Helper (not a packet name): `𝒪(-D) ↪ 𝒪_X` for an effective `D`, through
`SchemeWeilDivisor.sheafHomOfLE` and `unitIsoSheafZero`. -/
def idealSheafInclusion (D : SchemeWeilDivisor X) (hD : WeilDivisor.IsEffective D) :
    SchemeWeilDivisor.sheaf (-D) ⟶ SheafOfModules.unit X.ringCatSheaf :=
  SchemeWeilDivisor.sheafHomOfLE (D := -D) (E := 0) (by sorry) ≫
    (SchemeWeilDivisor.unitIsoSheafZero hX).inv

/-- Helper (not a packet name): the structure sheaf `𝒪_D = coker(𝒪(-D) → 𝒪_X)` of an effective
divisor (for `D = y` the skyscraper `i_{y,*} k(y)`), a real definition in the abelian category
`X.Modules`. -/
def divisorStructureSheaf (D : SchemeWeilDivisor X) (hD : WeilDivisor.IsEffective D) : X.Modules :=
  Limits.cokernel (idealSheafInclusion hX D hD)

/-- Helper (not a packet name): `𝒪(D)` as a vector bundle. -/
def divisorBundle (D : SchemeWeilDivisor X) : VectorBundle X :=
  lineBundle (SchemeWeilDivisor.toInvertibleSheaf hX D)

/-- Helper (not a packet name): `𝒪_D` is coherent. -/
theorem isCoherent_divisorStructureSheaf (D : SchemeWeilDivisor X)
    (hD : WeilDivisor.IsEffective D) : isCoherent X (divisorStructureSheaf hX D hD) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/skyscraper-class`: for a codimension-one point `y`, `𝒪(-y) ↪ 𝒪_X` with
cokernel the skyscraper `𝒪_y`; `𝒪(-y)` and `𝒪(y)` are inverse in `LineBundleClass X`;
`c_X⁻¹[𝒪_y] = [𝒪_X] - [𝒪(-y)]`, of rank `0` and determinant `[𝒪(y)]`. -/
theorem skyscraper_class (y : CodimensionOnePoint X) :
    Mono (idealSheafInclusion hX (WeilDivisor.ofPoint y) (WeilDivisor.isEffective_ofPoint y)) ∧
      SchemeWeilDivisor.toLineBundleClass hX (-WeilDivisor.ofPoint y) *
          SchemeWeilDivisor.toLineBundleClass hX (WeilDivisor.ofPoint y) = 1 ∧
      cartan X (1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y))) =
        G0.of ⟨_, isCoherent_divisorStructureSheaf hX (WeilDivisor.ofPoint y)
          (WeilDivisor.isEffective_ofPoint y)⟩ ∧
      VectorBundleK0.rank X
          (1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y))) = 0 ∧
      ((Additive.toMul (VectorBundleK0.det
          (1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y)))) : Pic X) :
          LineBundleClass X) = SchemeWeilDivisor.toLineBundleClass hX (WeilDivisor.ofPoint y) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/effective-divisor-class`: for `D = Σ n_y y ≥ 0`,
`c_X⁻¹[𝒪_D] = [𝒪_X] - [𝒪(-D)] = Σ n_y ([𝒪_X] - [𝒪(-y)])`, of rank `0` and determinant `[𝒪(D)]`. -/
theorem effective_divisor_class (D : SchemeWeilDivisor X) (hD : WeilDivisor.IsEffective D) :
    cartan X (1 - VectorBundleK0.of (divisorBundle hX (-D))) =
        G0.of ⟨_, isCoherent_divisorStructureSheaf hX D hD⟩ ∧
      1 - VectorBundleK0.of (divisorBundle hX (-D)) =
        D.sum (fun y n => n • (1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y)))) ∧
      ((Additive.toMul (VectorBundleK0.det (1 - VectorBundleK0.of (divisorBundle hX (-D)))) :
          Pic X) : LineBundleClass X) = SchemeWeilDivisor.toLineBundleClass hX D := by
  sorry

/-- `KTheoryLowDegrees:Z.5/principal-divisor-class-vanishes`: for `g ≠ 0` in the function field,
`Σ_y ord_y(g) ([𝒪_X] - [𝒪(-y)]) = 0` in `K₀(Vect X)`. -/
theorem principal_divisor_class_vanishes (g : Additive X.functionFieldˣ) :
    ((WeilDivisor.OrderSystem.ofScheme X).principalDivisor g).sum
        (fun y n => n • (1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y)))) =
      0 := by
  sorry

/-- Helper (not a packet name): the generic rank `[F] ↦ dim_K F_η` on `G₀(X)` (a real definition,
`Module.finrank` of the stalk at the generic point, through `ExactK0.lift`; additivity omitted). -/
def genericRank : G0 X →+ ℤ :=
  ExactK0.lift
    { obj := fun F => (Module.finrank (TopCat.Presheaf.stalk (C := RingCat.{u}) (X := X.toTopCat)
          X.ringCatSheaf.obj (genericPoint X))
        (TopCat.Presheaf.stalk (C := AddCommGrpCat.{u}) (X := X.toTopCat)
          (SheafOfModules.val F.obj).presheaf (genericPoint X)) : ℤ)
      map_iso := by sorry
      map_conflation := by sorry }

/-- `KTheoryLowDegrees:Z.5/generic-rank-kernel`: the generic rank `G₀(X) → ℤ` is surjective with
kernel generated by the skyscraper classes `[𝒪_y]`, and `genericRank ∘ c_X` is the rank. -/
theorem generic_rank_kernel :
    Function.Surjective (genericRank (X := X)) ∧
      (genericRank (X := X)).ker = AddSubgroup.closure
        {z | ∃ y : CodimensionOnePoint X,
          z = G0.of ⟨_, isCoherent_divisorStructureSheaf hX (WeilDivisor.ofPoint y)
            (WeilDivisor.isEffective_ofPoint y)⟩} ∧
      ∀ x : VectorBundleK0 X, genericRank (cartan X x) =
        VectorBundleK0.rank X x (genericPoint X) := by
  sorry

/-- **The divisor-class map** (`TauCeti.AlgebraicGeometry.KTheory.pointClass`,
`KTheoryLowDegrees:Z.5/point-class-map`): `Cl(X) →+ K₀(Vect X)`,
`D = Σ n_y y ↦ Σ n_y ([𝒪_X] - [𝒪(-y)])` (a real definition; vanishing on principal divisors is
`principal_divisor_class_vanishes`). -/
def pointClass : (WeilDivisor.OrderSystem.ofScheme X).ClassGroup →+ VectorBundleK0 X :=
  QuotientAddGroup.lift _
    (Finsupp.liftAddHom fun y =>
      zmultiplesHom _ (1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y))))
    (by sorry)

/-- `pointClass [y] = [𝒪_X] - [𝒪(-y)]`. -/
@[simp]
theorem pointClass_ofPoint (y : CodimensionOnePoint X) :
    pointClass hX ((WeilDivisor.OrderSystem.ofScheme X).divisorClass (WeilDivisor.ofPoint y)) =
      1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y)) := by
  sorry

/-- For `D ≥ 0`, `pointClass [D] = [𝒪_X] - [𝒪(-D)]`. -/
@[simp]
theorem pointClass_effective (D : SchemeWeilDivisor X) (hD : WeilDivisor.IsEffective D) :
    pointClass hX ((WeilDivisor.OrderSystem.ofScheme X).divisorClass D) =
      1 - VectorBundleK0.of (divisorBundle hX (-D)) := by
  sorry

/-- `c_X (pointClass [D]) = Σ n_y [𝒪_y]` in `G₀(X)`. -/
theorem cartan_pointClass (D : SchemeWeilDivisor X) :
    cartan X (pointClass hX ((WeilDivisor.OrderSystem.ofScheme X).divisorClass D)) =
      D.sum (fun y n => n • G0.of
        ⟨_, isCoherent_divisorStructureSheaf hX (WeilDivisor.ofPoint y)
          (WeilDivisor.isEffective_ofPoint y)⟩) := by
  sorry

/-- `rank (pointClass c) = 0`. -/
@[simp]
theorem rank_pointClass (c : (WeilDivisor.OrderSystem.ofScheme X).ClassGroup) :
    VectorBundleK0.rank X (pointClass hX c) = 0 := by
  sorry

/-- `det (pointClass c) = classGroupToLineBundleClassHom c` (Tau Ceti's divisor-to-line-bundle
map). -/
theorem det_pointClass (c : (WeilDivisor.OrderSystem.ofScheme X).ClassGroup) :
    ((Additive.toMul (VectorBundleK0.det (pointClass hX c)) : Pic X) : LineBundleClass X) =
      Additive.toMul (SchemeWeilDivisor.classGroupToLineBundleClassHom hX c) := by
  sorry

/-- `pointClass` is injective (`det` is a left inverse, after
`classGroupToLineBundleClass_injective`). -/
theorem pointClass_injective : Function.Injective (pointClass hX) := by
  sorry

-- `TauCeti.AlgebraicGeometry.KTheory.pointClass_functionFieldDivisor`: not stated here; needs the
-- identification of `Cl(X)` of a regular projective curve over a field with the function-field
-- class group `Cl(F)` (supplier: tauceti:TauCetiRoadmap/AlgebraicCurves layer 12D, requested).

end Curve

-- test TauCeti.AlgebraicGeometry.KTheory.pointClass_zero_test (degenerate)
example (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) : pointClass hX 0 = 0 := map_zero _

-- test TauCeti.AlgebraicGeometry.KTheory.pointClass_int_test (computation)
/- On `Spec ℤ`, `pointClass [(p)] = [ℤ] - [pℤ] = 0`. -/
example [IsIntegral (Spec (CommRingCat.of ℤ))] [IsNoetherian (Spec (CommRingCat.of ℤ))]
    [∀ y : CodimensionOnePoint (Spec (CommRingCat.of ℤ)),
      IsDiscreteValuationRing
        ((Spec (CommRingCat.of ℤ)).presheaf.stalk (y : Spec (CommRingCat.of ℤ)))]
    (hX : ∀ y : Spec (CommRingCat.of ℤ), coheight y ≤ 1)
    (y : CodimensionOnePoint (Spec (CommRingCat.of ℤ))) :
    pointClass hX ((WeilDivisor.OrderSystem.ofScheme _).divisorClass (WeilDivisor.ofPoint y)) =
      0 := by
  sorry

-- test TauCeti.AlgebraicGeometry.KTheory.det_pointClass_test (compatibility)
example (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) (c : (WeilDivisor.OrderSystem.ofScheme X).ClassGroup) :
    ((Additive.toMul (VectorBundleK0.det (pointClass hX c)) : Pic X) : LineBundleClass X) =
      Additive.toMul (SchemeWeilDivisor.classGroupToLineBundleClassHom hX c) :=
  det_pointClass hX c

-- test TauCeti.AlgebraicGeometry.KTheory.pointClass_not_sheafClass_test (non-example)
/- `D ↦ [𝒪_X(D)]` is not additive: `[𝒪(y + z)]` has rank `1`, `[𝒪(y)] + [𝒪(z)]` rank `2`. -/
example (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) [Nonempty X] (D E : SchemeWeilDivisor X) :
    VectorBundleK0.of (divisorBundle hX (D + E)) ≠
      VectorBundleK0.of (divisorBundle hX D) + VectorBundleK0.of (divisorBundle hX E) := by
  sorry

end KTheory

namespace SchemeWeilDivisor

open Order

/-- `KTheoryLowDegrees:Z.5/line-bundle-divisorial`: on a scheme satisfying the regular-curve package
every invertible sheaf is `𝒪_X(D)`, so Tau Ceti's `classGroupToLineBundleClass` is bijective and
every element of `LineBundleClass X` is a unit (`Cl(X) ≃+ Additive (Pic X)`), for every regular
noetherian curve, possibly nonproper or arithmetic. -/
theorem classGroupToLineBundleClass_bijective {X : Scheme.{u}} [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) :
    Function.Bijective (classGroupToLineBundleClass hX) ∧ ∀ c : LineBundleClass X, IsUnit c := by
  sorry

end SchemeWeilDivisor

namespace KTheory

/-- `KTheoryLowDegrees:Z.5/curve-rank-determinant-equivalence`: for a connected regular noetherian
curve, `(rankℤ, det) : K₀(Vect X) → ℤ × Additive (Pic X)` is bijective, with inverse
`(n, L) ↦ (n - 1)[𝒪_X] + [L]`; the skyscraper `[𝒪_X] - [𝒪(-y)]` goes to `(0, 𝒪(y))`. -/
theorem curve_rank_determinant_equivalence (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) :
    Function.Bijective (fun x : VectorBundleK0 X =>
        ((VectorBundleK0.rankℤ X x : ℤ), VectorBundleK0.det x)) ∧
      ∀ (n : ℤ) (L : InvertibleSheaf X),
        VectorBundleK0.rankℤ X (((n - 1 : ℤ) : VectorBundleK0 X) +
          VectorBundleK0.of (lineBundle L)) = n ∧
        ((Additive.toMul (VectorBundleK0.det (((n - 1 : ℤ) : VectorBundleK0 X) +
          VectorBundleK0.of (lineBundle L))) : Pic X) : LineBundleClass X) =
            LineBundleClass.mk L := by
  sorry

/-- `KTheoryLowDegrees:Z.5/curve-k-zero-ring`: under the equivalence the product is
`(a, L)(b, M) = (ab, L^b M^a)`; `K̃₀(X)² = 0`, i.e. `[L ⊗ M] = [L] + [M] - 1`. -/
theorem curve_k_zero_ring (X : Scheme.{u}) [IsIntegral X] [IsNoetherian X]
    [∀ y : CodimensionOnePoint X, IsDiscreteValuationRing (X.presheaf.stalk (y : X))]
    (hX : ∀ y : X, coheight y ≤ 1) :
    (∀ x y : VectorBundleK0 X, x ∈ VectorBundleK0.reduced X → y ∈ VectorBundleK0.reduced X →
      x * y = 0) ∧
    ∀ x y : VectorBundleK0 X, VectorBundleK0.rankℤ X (x * y) =
        VectorBundleK0.rankℤ X x * VectorBundleK0.rankℤ X y ∧
      Additive.toMul (VectorBundleK0.det (x * y)) =
        Additive.toMul (VectorBundleK0.det x) ^ VectorBundleK0.rankℤ X y *
          Additive.toMul (VectorBundleK0.det y) ^ VectorBundleK0.rankℤ X x := by
  sorry

/-- Helper (not a packet name): `P~` is invertible on `Spec R` for an invertible `R`-module `P`. -/
theorem isInvertible_tilde (R : Type u) [CommRing R] (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Invertible R P] :
    TauCeti.AlgebraicGeometry.SheafOfModules.isInvertible (Spec (CommRingCat.of R))
      ((tilde.functor (CommRingCat.of R)).obj (ModuleCat.of R P)) := by
  sorry

/-- `KTheoryLowDegrees:Z.5/picard-affine-comparison`: `P ↦ [P~]` is a monoid isomorphism
`CommRing.Pic R ≃* LineBundleClass (Spec R)` (so the latter is a group), compatible with `⊗`. -/
theorem picard_affine_comparison (R : Type u) [CommRing R] :
    ∃ e : CommRing.Pic R ≃* LineBundleClass (Spec (CommRingCat.of R)),
      ∀ (P : Type u) [AddCommGroup P] [Module R P] [Module.Invertible R P],
        e (CommRing.Pic.mk R P) = LineBundleClass.mk ⟨_, isInvertible_tilde R P⟩ := by
  sorry

/-- `KTheoryLowDegrees:Z.5/dedekind-curve-comparison`: for a Dedekind domain `A` (not a field) and
`X = Spec A`, under the affine comparisons the curve equivalence is `rankPicEquiv`: both send `x` to
`(rank x, det x)`. -/
theorem dedekind_curve_comparison (A : Type u) [CommRing A] [IsDedekindDomain A]
    (hA : ¬ IsField A) :
    ∃ (e : RingK0.K0 A ≃+ VectorBundleK0 (Spec (CommRingCat.of A)))
      (π : CommRing.Pic A ≃* Pic (Spec (CommRingCat.of A))),
      ∀ x : RingK0.K0 A,
        VectorBundleK0.rank _ (e x) =
          LocallyConstant.const _ ((RingK0.rankPicEquiv A x).1) ∧
        Additive.toMul (VectorBundleK0.det (e x)) =
          π (Additive.toMul (RingK0.rankPicEquiv A x).2) := by
  sorry

-- `KTheoryLowDegrees:Z.5/doubled-line-example`: not stated here; needs the affine line with doubled
-- origin as a scheme (two copies of `Spec k[t]` glued along `Spec k[t, t⁻¹]`), which the pinned
-- libraries do not construct (supplier: SchemeKTheoryOperations:S.1/doubled-plane-counterexample,
-- whose gluing construction it shares).

end KTheory

end TauCeti.AlgebraicGeometry

/-! ## Stage `KTheoryLowDegrees:Z.6` — degree-zero comparison and tests

The K-theory spectra, `π₀K(A)`, `π₀K(X)`, `D_perf` and its `K₀`, the support sequences, `P¹_F`,
elliptic curves as schemes and the real conic are in neither pinned library; statements that need
them are comments naming the supplier. What the carriers allow is stated. -/

namespace TauCeti.AlgebraicGeometry.KTheory

open _root_.AlgebraicGeometry Order

-- `KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero`: not stated here; needs Quillen's `K(P(A))` and
-- `π₁(BQP(A), 0)` with its product and naturality (supplier: GeneralAlgebraicKTheory:K.1/pi1-BQ-
-- equals-K0, K.2:plus/plus-equals-Q, K.7/biexact-pairings-and-products).

-- `KTheoryLowDegrees:Z.6/vector-bundle-k-zero-pi-zero`: not stated here; needs `K(X) = K(Perf X)`,
-- `π₀K(X)` and `TriangulatedK0 (D_perf(𝒪_X))` (supplier: SchemeKTheoryOperations:S.2/vector-bundle-
-- k-theory-comparison and S.2/k-zero-of-a-scheme).

-- `KTheoryLowDegrees:Z.6/perfect-complex-euler-class`: not stated here; needs `K₀(D_perf(A))` (an
-- essentially small pretriangulated category of perfect complexes, for Tau Ceti's `TriangulatedK0`)
-- and its identification with `π₀K(Spec A)` (supplier: SchemeKTheoryOperations:S.2/k-zero-of-a-
-- scheme with S.2/affine-k-theory-comparison; for (4) GeneralAlgebraicKTheory:K.5). The Euler class
-- side is Tau Ceti's `moduleEulerClassOf` with `ExactStructure.eulerClassOf_eq` (independence of
-- the resolution), already at the pin.

/-- `KTheoryLowDegrees:Z.6/localisation-projective-class`, the part stated on `K₀`: the degree-zero
map of localisation `K₀(A) → K₀(S⁻¹A)` is `RingK0.map (algebraMap A (S⁻¹A))`,
`[P] ↦ [S⁻¹A ⊗ P] = [S⁻¹P]` (Mathlib's `IsLocalizedModule`). (Its identification with `π₀` of the
support sequence, and exactness of `K₀(A on S) → K₀(A) → K₀(S⁻¹A)`, need `K(A on S)`
(supplier: GeneralAlgebraicKTheory:K.5); the Dedekind case is `RingK0.k0_localization`.) -/
theorem localisation_projective_class (A : Type u) [CommRing A] (S : Submonoid A) (P : Type u)
    [AddCommGroup P] [Module A P] [Module.Finite A P] [Module.Projective A P]
    [Module.Finite (Localization S) (LocalizedModule S P)]
    [Module.Projective (Localization S) (LocalizedModule S P)] :
    RingK0.map A (algebraMap A (Localization S)) (RingK0.cls A P) =
      RingK0.cls (Localization S) (LocalizedModule S P) := by
  sorry

/-- `KTheoryLowDegrees:Z.6/cartan-map-comparison` (2)–(3): for `X = Spec R`, `R` noetherian, the
vector-bundle Cartan map is Tau Ceti's `cartanMap R` under the affine identifications (so there is
one Cartan map); for `R = k[ε]/(ε²)` it is multiplication by `2` on `ℤ`. (Part (1), agreement with
`π₀` of SchemeKTheoryOperations:S.2/cartan-map, needs `K(X)` and `G(X)` as spectra.) -/
theorem cartan_map_comparison (R : Type u) [CommRing R] [IsNoetherianRing R] :
    ∃ (e₁ : RingK0.K0 R ≃+ ExactK0.{u} (finiteProjectiveModulesExactStructure R))
      (a : RingK0.K0 R ≃+ VectorBundleK0 (Spec (CommRingCat.of R)))
      (e₂ : G0 (Spec (CommRingCat.of R)) ≃+ ExactK0.{u} (finiteModulesExactStructure R)),
      ∀ x, e₂ (cartan _ (a x)) = cartanMap R (e₁ x) := by
  sorry

theorem cartanMap_dualNumber (k : Type u) [Field k] :
    ∃ (e₁ : ExactK0.{u} (finiteProjectiveModulesExactStructure (DualNumber k)) ≃+ ℤ)
      (e₂ : ExactK0.{u} (finiteModulesExactStructure (DualNumber k)) ≃+ ℤ),
      ∀ x, e₂ (cartanMap (DualNumber k) x) = 2 * e₁ x := by
  sorry

/-- `KTheoryLowDegrees:Z.6/field-test`, the parts stated here: for a field `F`, `K₀(F) ≅ ℤ` by
dimension, `K₀(Vect Spec F) ≅ ℤ`, `Pic F` is trivial, and the Cartan map is Tau Ceti's
`cartanEquivOfIsSemisimpleRing`; scalar extension `K₀(F) → K₀(E)` is the identity of `ℤ`. (The
`π₀K(F)` and `K₀(D_perf(F))` comparisons need GeneralAlgebraicKTheory:K.1 and
SchemeKTheoryOperations:S.2.) -/
theorem field_test (F E : Type u) [Field F] [Field E] [Algebra F E] :
    RingK0.divisionRingEquiv F (RingK0.cls F (Fin 3 → F)) = 3 ∧
      Nonempty (VectorBundleK0 (Spec (CommRingCat.of F)) ≃+ ℤ) ∧
      Subsingleton (CommRing.Pic F) ∧
      Function.Bijective (cartanMap F) ∧
      ∀ x, RingK0.divisionRingEquiv E (RingK0.map F (algebraMap F E) x) =
        RingK0.divisionRingEquiv F x := by
  sorry

/-- `KTheoryLowDegrees:Z.6/integers-test`, the parts stated here: `K₀(ℤ) ≅ ℤ` by `rankℤ`, `Pic ℤ`
trivial, every skyscraper class on `Spec ℤ` vanishes, the Cartan map is an isomorphism, and
`K₀(ℤ) → K₀(ℚ)` is the identity of `ℤ`. -/
theorem integers_test :
    Function.Bijective (RingK0.rankℤ ℤ) ∧ Subsingleton (CommRing.Pic ℤ) ∧
      Function.Bijective (cartanMap ℤ) ∧
      ∀ x, RingK0.divisionRingEquiv ℚ (RingK0.map ℤ (algebraMap ℤ ℚ) x) = RingK0.rankℤ ℤ x := by
  sorry

theorem integers_test_skyscraper [IsIntegral (Spec (CommRingCat.of ℤ))]
    [IsNoetherian (Spec (CommRingCat.of ℤ))]
    [∀ y : CodimensionOnePoint (Spec (CommRingCat.of ℤ)),
      IsDiscreteValuationRing
        ((Spec (CommRingCat.of ℤ)).presheaf.stalk (y : Spec (CommRingCat.of ℤ)))]
    (hX : ∀ y : Spec (CommRingCat.of ℤ), coheight y ≤ 1)
    (y : CodimensionOnePoint (Spec (CommRingCat.of ℤ))) :
    1 - VectorBundleK0.of (divisorBundle hX (-WeilDivisor.ofPoint y)) = 0 := by
  sorry

/-- `KTheoryLowDegrees:Z.6/field-product-test`, the parts stated here: for `A = F × F`,
`rank : K₀(A) → H⁰(Spec A, ℤ) ≅ ℤ²` is bijective (non-constant rank: `[F × 0] ↦ (1, 0)`),
`Pic A` is trivial, and localisation at `e = (1, 0)` kills `[0 × F]`. -/
theorem field_product_test (F : Type u) [Field F] :
    Function.Bijective (RingK0.rank (F × F)) ∧ Subsingleton (CommRing.Pic (F × F)) ∧
      RingK0.cls (F × F) (RingK0.fstLine F) + RingK0.cls (F × F) (RingK0.sndLine F) = 1 ∧
      RingK0.map (F × F) (algebraMap (F × F) (Localization.Away ((1, 0) : F × F)))
        (RingK0.cls (F × F) (RingK0.sndLine F)) = 0 := by
  sorry

/-- `KTheoryLowDegrees:Z.6/nonprincipal-ideal-test`, the parts stated here: for `A = ℤ[√-5]`,
`I = (2, 1 + √-5)` and `x = [I] - [A]`: `rank x = 0`, `det x ≠ 1`, `x ≠ 0`, `2x = 0`; `x ↦ 0` in
`K₀(A_𝔮)` for every prime `𝔮`; and the Cartan image of `-x` is the class of `A/I` in `G₀(A)` (Tau
Ceti's `cartanMap`). (The Euler class of `I → A` in `K₀(D_perf(A))` needs SchemeKTheoryOperations:
S.2.) -/
theorem nonprincipal_ideal_test [IsDedekindDomain (ℤ√(-5))] (I : Ideal (ℤ√(-5)))
    (hI : I = Ideal.span {2, 1 + Zsqrtd.sqrtd}) [Module.Invertible (ℤ√(-5)) I] :
    RingK0.rankℤ (ℤ√(-5)) (RingK0.cls (ℤ√(-5)) I - 1) = 0 ∧
      RingK0.det (ℤ√(-5)) (RingK0.cls (ℤ√(-5)) I - 1) ≠ 1 ∧
      2 • (RingK0.cls (ℤ√(-5)) I - 1) = 0 ∧
      (∀ q : PrimeSpectrum (ℤ√(-5)),
        RingK0.map (ℤ√(-5)) (algebraMap (ℤ√(-5)) (Localization.AtPrime q.asIdeal))
          (RingK0.cls (ℤ√(-5)) I - 1) = 0) ∧
      cartanMap (ℤ√(-5))
          ((ExactK0.of (⟨ModuleCat.of (ℤ√(-5)) (ℤ√(-5)), ⟨inferInstance, inferInstance⟩⟩ :
              (finiteProjectiveModules (ℤ√(-5))).FullSubcategory) :
              ExactK0.{0} (finiteProjectiveModulesExactStructure (ℤ√(-5)))) -
            (ExactK0.of (⟨ModuleCat.of (ℤ√(-5)) I, ⟨inferInstance, inferInstance⟩⟩ :
              (finiteProjectiveModules (ℤ√(-5))).FullSubcategory) :
              ExactK0.{0} (finiteProjectiveModulesExactStructure (ℤ√(-5))))) =
        (ExactK0.of
            (⟨ModuleCat.of (ℤ√(-5)) (ℤ√(-5) ⧸ I), (ModuleCat.isFG_iff _).mpr inferInstance⟩ :
              FGModuleCat (ℤ√(-5))) : ExactK0.{0} (finiteModulesExactStructure (ℤ√(-5)))) := by
  sorry

-- `KTheoryLowDegrees:Z.6/projective-line-regular-curve`: not stated here; needs
-- `P¹_F = Proj F[T₀, T₁]` with its twisting sheaves `O(m)` (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1, requested).

-- `KTheoryLowDegrees:Z.6/projective-line-rank-pic`: not stated here; needs `P¹_F` and `O(m)`
-- (supplier: AlgebraicModuliForArithmeticGeometry:R09.1, with KTheoryLowDegrees:Z.6/projective-
-- line-regular-curve).

/-- Helper (not a packet name): the change of coordinates `(r, d) ↦ (r + d, -d)` from rank–degree
coordinates to projective-bundle coordinates `(a, b)` on `K₀(P¹_F) ≅ ℤ²` (a real definition; it is
its own inverse). -/
def projectiveLineChangeOfBasis : ℤ × ℤ ≃+ ℤ × ℤ where
  toFun p := (p.1 + p.2, -p.2)
  invFun p := (p.1 + p.2, -p.2)
  left_inv p := by simp
  right_inv p := by simp
  map_add' p q := by ext <;> simp <;> ring

-- `KTheoryLowDegrees:Z.6/projective-line-change-of-basis`: the statement on `K₀(P¹_F)` is not
-- stated here; it needs `P¹_F`, `O(-1)` and the projective-bundle basis of
-- SchemeKTheoryOperations:S.5/projective-line-k-theory (supplier:
-- AlgebraicModuliForArithmeticGeometry:R09.1 and SchemeKTheoryOperations:S.5). The coordinate
-- change itself is `projectiveLineChangeOfBasis`; its acceptance values are computed below.

-- Acceptance of `Z.6/projective-line-change-of-basis`: `(r, d) = (2, 3) ↦ (a, b) = (5, -3)`.
example : projectiveLineChangeOfBasis (2, 3) = (5, -3) := by decide

-- Acceptance: `(0, 1) ↦ (1, -1)` (the rational point) and `(1, -1) ↦ (0, 1)` (`[O(-1)]`).
example : projectiveLineChangeOfBasis (0, 1) = (1, -1) ∧
    projectiveLineChangeOfBasis (1, -1) = (0, 1) := by decide

-- The matrix `[[1, 1], [0, -1]]` is its own inverse and has determinant `-1`.
example : projectiveLineChangeOfBasis.trans projectiveLineChangeOfBasis = AddEquiv.refl _ := by
  ext p <;> simp [projectiveLineChangeOfBasis]

example : Matrix.det !![(1 : ℤ), 1; 0, -1] = -1 := by
  simp [Matrix.det_fin_two]

-- `[O(m)]` has projective-bundle coordinates `(m + 1, -m)` since it has rank `1` and degree `m`.
example (m : ℤ) : projectiveLineChangeOfBasis (1, m) = (m + 1, -m) := by
  simp [projectiveLineChangeOfBasis, add_comm]

-- `KTheoryLowDegrees:Z.6/elliptic-test`: not stated here; needs an elliptic curve over `F` as a
-- scheme with the regular-curve package and a rational origin, and EllipticKTheory:E.2's
-- decomposition `Pic(E) ≅ ℤ ⊕ E(F)` (supplier: EllipticKTheory:E.2/K0-of-an-elliptic-curve
-- and E.2/picard-decomposition-and-the-point-group; the Weierstrass scheme is ModularCurves
-- layer 1A's).

-- `KTheoryLowDegrees:Z.6/pointless-conic-test`: not stated here; needs the conic
-- `X² + Y² + Z² = 0` in `P²_ℝ` as a scheme (supplier: AlgebraicModuliForArithmeticGeometry:R09.1
-- for `P²` and its closed subschemes); its divisor side would use Tau Ceti's `relativeDegree`.

end TauCeti.AlgebraicGeometry.KTheory
