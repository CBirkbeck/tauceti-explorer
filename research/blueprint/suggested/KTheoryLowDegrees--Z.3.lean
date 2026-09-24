/-
This suggested file is not the roadmap and is not exhaustive. The roadmap document
is definitive. The statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. All new declarations are unimplemented.
The abbreviations FP, K0 and cls below are notation for pinned baseline carriers,
not a second construction of projective modules or Grothendieck groups.
-/
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.CategoryTheory.Monoidal.Subcategory
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.RingTheory.Flat.TorsionFree
import Mathlib.RingTheory.Flat.EquationalCriterion
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.RingTheory.Binomial
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.Finiteness.Prod
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PicardGroup
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct
universe u
namespace TauCeti.RingK0
variable (R : Type u) [CommRing R]
abbrev FP := (TauCeti.finiteProjectiveModules R).FullSubcategory
abbrev K0 := TauCeti.SplitK0.{u} (FP R)
abbrev cls (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] : K0 R :=
  TauCeti.SplitK0.of ⟨ModuleCat.of R M, ⟨inferInstance, inferInstance⟩⟩


/- KTheoryLowDegrees:Z.3/projective-exterior-power -/
theorem exteriorPower_projective (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Projective R M] (n : ℕ) : Module.Projective R (⋀[R]^n M) := by
  sorry
attribute [local instance] exteriorPower_projective



/- KTheoryLowDegrees:Z.3/finite-projective-monoidal -/
theorem finiteProjective_isMonoidal :
    (TauCeti.finiteProjectiveModules R).IsMonoidal := by
  sorry
attribute [local instance] finiteProjective_isMonoidal
-- The following uses the pinned categorical ring, not a new ring definition.
example : CommRing (K0 R) := inferInstance



/- KTheoryLowDegrees:Z.3/exterior-direct-sum -/
theorem exteriorPower_prod (M N : Type u)
    [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N] (n : ℕ) :
    Nonempty ((⋀[R]^n (M × N)) ≃ₗ[R]
      ((i : Fin (n + 1)) → (⋀[R]^(i : ℕ) M) ⊗[R] (⋀[R]^(n - i) N))) := by
  sorry



/- KTheoryLowDegrees:Z.3/exterior-class-sum -/
theorem exteriorClass_prod (M N : Type u)
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] (n : ℕ) :
    cls R (⋀[R]^n (M × N)) =
      ∑ i ∈ Finset.range (n + 1), cls R (⋀[R]^i M) * cls R (⋀[R]^(n-i) N) := by
  sorry



/- KTheoryLowDegrees:Z.3/total-lambda -/
def lambdaTotal : K0 R →+ Additive (PowerSeries (K0 R))ˣ := by
  sorry
abbrev lambdaSeries (x : K0 R) : PowerSeries (K0 R) :=
  (Additive.toMul (lambdaTotal R x)).val

theorem lambdaTotal_constant (x : K0 R) :
    PowerSeries.coeff 0 (lambdaSeries R x) = 1 := by sorry

theorem lambdaTotal_of (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ) :
    PowerSeries.coeff n (lambdaSeries R (cls R M)) = cls R (⋀[R]^n M) := by sorry

theorem lambdaTotal_unique (f : K0 R →+ Additive (PowerSeries (K0 R))ˣ)
    (hf : ∀ (M : Type u) [AddCommGroup M] [Module R M]
      [Module.Finite R M] [Module.Projective R M],
      ∀ n, PowerSeries.coeff n (Additive.toMul (f (cls R M))).val = cls R (⋀[R]^n M)) :
    f = lambdaTotal R := by sorry

-- TauCeti.RingK0.lambdaTotal_zero_test
example : lambdaSeries R 0 = 1 := by sorry
-- TauCeti.RingK0.lambdaTotal_unit_test
example : lambdaSeries R 1 = 1 + PowerSeries.X := by sorry
-- TauCeti.RingK0.lambdaTotal_neg_unit_test
example (n : ℕ) : PowerSeries.coeff n (lambdaSeries R (-1)) = (-1 : K0 R)^n := by sorry



/- KTheoryLowDegrees:Z.3/total-lambda-constant -/
-- Signature TauCeti.RingK0.lambdaTotal_constant is grouped with its construction above.


/- KTheoryLowDegrees:Z.3/total-lambda-of -/
-- Signature TauCeti.RingK0.lambdaTotal_of is grouped with its construction above.


/- KTheoryLowDegrees:Z.3/lambda -/
def lambda (n : ℕ) (x : K0 R) : K0 R := PowerSeries.coeff n (lambdaSeries R x)
theorem lambda_zero (x : K0 R) : lambda R 0 x = 1 := by sorry
theorem lambda_one (x : K0 R) : lambda R 1 x = x := by sorry
theorem lambda_of (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ) :
    lambda R n (cls R M) = cls R (⋀[R]^n M) := by sorry
-- TauCeti.RingK0.lambda_rank_two_test
example : lambda R 2 (2 : K0 R) = 1 := by sorry
-- TauCeti.RingK0.lambda_neg_unit_test
example : lambda R 2 (-1 : K0 R) = 1 := by sorry
-- TauCeti.RingK0.lambda_zero_class_test
example (n : ℕ) : lambda R (n+1) 0 = 0 := by sorry



/- KTheoryLowDegrees:Z.3/lambda-zero -/
-- Signature grouped with lambda above.


/- KTheoryLowDegrees:Z.3/lambda-one -/
-- Signature grouped with lambda above.


/- KTheoryLowDegrees:Z.3/lambda-of -/
-- Signature grouped with lambda above.


/- KTheoryLowDegrees:Z.3/lambda-add -/
theorem lambda_add (n : ℕ) (x y : K0 R) :
    lambda R n (x+y) = ∑ i ∈ Finset.range (n+1), lambda R i x * lambda R (n-i) y := by
  sorry



/- KTheoryLowDegrees:Z.3/lambda-zero-class -/
theorem lambda_zero_class (n : ℕ) : lambda R (n+1) 0 = 0 := by sorry



/- KTheoryLowDegrees:Z.3/lambda-neg-recursion -/
theorem lambda_neg_recursion (n : ℕ) (hn : 0 < n) (x : K0 R) :
    lambda R n (-x) = -(∑ i ∈ Finset.range n, lambda R (n-i) x * lambda R i (-x)) := by
  sorry



/- KTheoryLowDegrees:Z.3/lambda-free -/
theorem lambda_natCast (m n : ℕ) : lambda R n (m : K0 R) = (m.choose n : K0 R) := by
  sorry



/- KTheoryLowDegrees:Z.3/exterior-base-change -/
theorem exteriorPower_baseChange (S : Type u) [CommRing S] [Algebra R S]
    (M : Type u) [AddCommGroup M] [Module R M] (n : ℕ) :
    Nonempty ((S ⊗[R] (⋀[R]^n M)) ≃ₗ[S] (⋀[S]^n (S ⊗[R] M))) := by
  sorry



/- KTheoryLowDegrees:Z.3/constant-rank-top-invertible -/
theorem topExterior_invertible (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ)
    (hn : ∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) M p = n) :
    Module.Invertible R (⋀[R]^n M) := by sorry



/- KTheoryLowDegrees:Z.3/determinant-projective -/
def detProjective (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] : CommRing.Pic R := by sorry

theorem detProjective_congr (M N : Type u)
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N]
    (e : M ≃ₗ[R] N) : detProjective R M = detProjective R N := by sorry

theorem detProjective_free (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Free R M] : detProjective R M = 1 := by sorry

theorem detProjective_line (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Invertible R M] : detProjective R M = CommRing.Pic.mk R M := by sorry

-- TauCeti.RingK0.detProjective_zero_test
example : detProjective R (Fin 0 → R) = 1 := by sorry
-- TauCeti.RingK0.detProjective_rank_two_test
example : detProjective R (Fin 2 → R) = 1 := by sorry
-- TauCeti.RingK0.detProjective_nontrivial_line_test
example (L : CommRing.Pic R) (hL : L ≠ 1) : detProjective R L ≠ 1 := by sorry



/- KTheoryLowDegrees:Z.3/determinant-congr -/
-- Signature grouped with detProjective above.


/- KTheoryLowDegrees:Z.3/determinant-free -/
-- Signature grouped with detProjective above.


/- KTheoryLowDegrees:Z.3/determinant-line -/
-- Signature grouped with detProjective above.


/- KTheoryLowDegrees:Z.3/determinant-sum -/
theorem detProjective_prod (M N : Type u)
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N] :
    detProjective R (M × N) = detProjective R M * detProjective R N := by sorry



/- KTheoryLowDegrees:Z.3/determinant-hom -/
def detHom : K0 R →+ Additive (CommRing.Pic R) := by sorry
abbrev det (x : K0 R) : CommRing.Pic R := Additive.toMul (detHom R x)
theorem detHom_of (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    det R (cls R M) = detProjective R M := by sorry
theorem det_add (x y : K0 R) : det R (x+y) = det R x * det R y := by sorry
theorem det_neg (x : K0 R) : det R (-x) = (det R x)⁻¹ := by sorry
-- TauCeti.RingK0.det_zero_test
example : det R 0 = 1 := by sorry
-- TauCeti.RingK0.det_free_test
example (n : ℕ) : det R (n : K0 R) = 1 := by sorry
-- TauCeti.RingK0.det_line_test
example (L : CommRing.Pic R) : det R (cls R L) = L := by sorry



/- KTheoryLowDegrees:Z.3/determinant-hom-of -/
-- Signature detHom_of is grouped above.


/- KTheoryLowDegrees:Z.3/determinant-surjective -/
theorem detHom_surjective : Function.Surjective (detHom R) := by sorry



/- KTheoryLowDegrees:Z.3/gamma -/
def gamma (n : ℕ) (x : K0 R) : K0 R := lambda R n (x + ((n-1 : ℕ) : K0 R))
theorem gamma_zero (x : K0 R) : gamma R 0 x = 1 := by sorry
theorem gamma_one (x : K0 R) : gamma R 1 x = x := by sorry
theorem gamma_two (x : K0 R) : gamma R 2 x = lambda R 2 x + x := by sorry
-- TauCeti.RingK0.gamma_unit_test
example (n : ℕ) : gamma R n 1 = 1 := by sorry
-- TauCeti.RingK0.gamma_neg_unit_test
example : gamma R 2 (-1) = 0 := by sorry
-- TauCeti.RingK0.gamma_zero_class_test
example (n : ℕ) : gamma R (n+1) 0 = 0 := by sorry



/- KTheoryLowDegrees:Z.3/gamma-series -/
theorem gamma_expansion (n : ℕ) (hn : 0 < n) (x : K0 R) :
    gamma R n x = ∑ j ∈ Finset.range n, ((n-1).choose j : K0 R) * lambda R (n-j) x := by
  sorry



/- KTheoryLowDegrees:Z.3/gamma-one -/
-- Signature gamma_one is grouped above.


/- KTheoryLowDegrees:Z.3/gamma-add -/
theorem gamma_add (n : ℕ) (x y : K0 R) :
    gamma R n (x+y) = ∑ i ∈ Finset.range (n+1), gamma R i x * gamma R (n-i) y := by sorry



/- KTheoryLowDegrees:Z.3/augmentation -/
-- The parameter below is exactly the Z.2 supplier map, with its normalization.
-- It is not a new construction or an arbitrary replacement K-theory carrier.
variable (rho : K0 R →+* LocallyConstant (PrimeSpectrum R) ℤ)
def augmentation : Ideal (K0 R) := RingHom.ker rho
theorem mem_augmentation (x : K0 R) :
    x ∈ augmentation R rho ↔ rho x = 0 := by sorry
theorem augmentation_map_zero (x : augmentation R rho) : rho x = 0 := by sorry
-- TauCeti.RingK0.augmentation_zero_test
example : (0 : K0 R) ∈ augmentation R rho := by sorry
-- TauCeti.RingK0.augmentation_unit_test
example [Nontrivial R] : (1 : K0 R) ∉ augmentation R rho := by sorry
-- TauCeti.RingK0.augmentation_line_test
example (L : CommRing.Pic R) (hL : rho (cls R L) = 1) :
    cls R L - 1 ∈ augmentation R rho := by sorry



/- KTheoryLowDegrees:Z.3/augmentation-membership -/
-- Signature mem_augmentation is grouped above.


/- KTheoryLowDegrees:Z.3/rank-lambda -/
theorem rank_lambda (hrho : ∀ (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M], ∀ p : PrimeSpectrum R,
    rho (cls R M) p = (Module.rankAtStalk (R := R) M p : ℤ))
    (x : K0 R) (n : ℕ) (p : PrimeSpectrum R) :
    rho (lambda R n x) p = Ring.choose (rho x p) n := by sorry



/- KTheoryLowDegrees:Z.3/gamma-rank-zero -/
theorem gamma_mem_augmentation
    (hrho : ∀ (M : Type u) [AddCommGroup M] [Module R M]
      [Module.Finite R M] [Module.Projective R M], ∀ p : PrimeSpectrum R,
      rho (cls R M) p = (Module.rankAtStalk (R := R) M p : ℤ))
    (x : K0 R) (hx : x ∈ augmentation R rho) (n : ℕ) (hn : 0 < n) :
    gamma R n x ∈ augmentation R rho := by sorry



/- KTheoryLowDegrees:Z.3/gamma-filtration -/
def gammaFiltration (n : ℕ) : Ideal (K0 R) :=
  Ideal.span {y | ∃ (m : ℕ) (k : Fin m → ℕ) (x : Fin m → K0 R),
    (∀ i, 0 < k i) ∧ (∀ i, x i ∈ augmentation R rho) ∧
    n ≤ ∑ i, k i ∧ y = ∏ i, gamma R (k i) (x i)}
theorem gamma_generator_mem (n m : ℕ) (k : Fin m → ℕ) (x : Fin m → K0 R)
    (hk : ∀ i, 0 < k i) (hx : ∀ i, x i ∈ augmentation R rho)
    (hn : n ≤ ∑ i, k i) : (∏ i, gamma R (k i) (x i)) ∈ gammaFiltration R rho n := by sorry
theorem gammaFiltration_antitone : Antitone (gammaFiltration R rho) := by sorry
-- TauCeti.RingK0.gammaFiltration_zero_test
example : gammaFiltration R rho 0 = ⊤ := by sorry
-- TauCeti.RingK0.gammaFiltration_weight_two_test
example (x : K0 R) (hx : x ∈ augmentation R rho) :
    gamma R 2 x ∈ gammaFiltration R rho 2 := by sorry
-- TauCeti.RingK0.gammaFiltration_product_test
example (x y : K0 R) (hx : x ∈ augmentation R rho) (hy : y ∈ augmentation R rho) :
    x*y ∈ gammaFiltration R rho 2 := by sorry



/- KTheoryLowDegrees:Z.3/gamma-filtration-generators -/
-- Signature gamma_generator_mem is grouped above.


/- KTheoryLowDegrees:Z.3/gamma-filtration-zero -/
theorem gammaFiltration_zero : gammaFiltration R rho 0 = ⊤ := by sorry



/- KTheoryLowDegrees:Z.3/gamma-filtration-one -/
theorem gammaFiltration_one
    (hrho : ∀ (M : Type u) [AddCommGroup M] [Module R M]
      [Module.Finite R M] [Module.Projective R M], ∀ p : PrimeSpectrum R,
      rho (cls R M) p = (Module.rankAtStalk (R := R) M p : ℤ)) :
    gammaFiltration R rho 1 = augmentation R rho := by sorry



/- KTheoryLowDegrees:Z.3/gamma-filtration-mul -/
theorem gammaFiltration_mul (i j : ℕ) :
    gammaFiltration R rho i * gammaFiltration R rho j ≤ gammaFiltration R rho (i+j) := by sorry



/- KTheoryLowDegrees:Z.3/projective-dual-base-change -/
theorem dual_baseChange (S : Type u) [CommRing S] [Algebra R S]
    (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    ∃ e : (S ⊗[R] Module.Dual R M) ≃ₗ[S] Module.Dual S (S ⊗[R] M),
      ∀ (s t : S) (f : Module.Dual R M) (m : M),
        e (s ⊗ₜ[R] f) (t ⊗ₜ[R] m) = s * t * algebraMap R S (f m) := by sorry



/- KTheoryLowDegrees:Z.3/exterior-above-rank -/
theorem exteriorPower_subsingleton (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (n : ℕ)
    (hn : ∀ p : PrimeSpectrum R, Module.rankAtStalk (R := R) M p < n) :
    Subsingleton (⋀[R]^n M) := by sorry



section Dedekind
variable [IsDedekindDomain R]
-- This instance is a composition of pinned baseline results, not a new theorem node.
local instance finiteTorsionFree_projective (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.IsTorsionFree R M] : Module.Projective R M := by
  let : Module.FinitePresentation R M := Module.finitePresentation_of_finite R M
  exact Module.Flat.projective_of_finitePresentation


/- KTheoryLowDegrees:Z.4/coprime-ideal-representative -/
theorem exists_coprimeIdeal_equiv (I J : Ideal R) (hI : I ≠ ⊥) (hJ : J ≠ ⊥) :
    ∃ J' : Ideal R, J' ≠ ⊥ ∧ IsCoprime I J' ∧ Nonempty (J ≃ₗ[R] J') := by sorry



/- KTheoryLowDegrees:Z.4/coprime-ideal-sum -/
omit [IsDedekindDomain R] in
theorem coprimeIdeal_prod (I J : Ideal R) (h : IsCoprime I J) :
    Nonempty ((I × J) ≃ₗ[R] (R × (I*J))) := by sorry



/- KTheoryLowDegrees:Z.4/ideal-sum -/
theorem ideal_prod (I J : Ideal R) (hI : I ≠ ⊥) (hJ : J ≠ ⊥) :
    Nonempty ((I × J) ≃ₗ[R] (R × (I*J))) := by sorry



/- KTheoryLowDegrees:Z.4/projective-ideal-summands -/
theorem exists_ideal_summands (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    ∃ (n : ℕ) (I : Fin n → Ideal R), (∀ i, I i ≠ ⊥) ∧
      Nonempty (M ≃ₗ[R] ((i : Fin n) → I i)) := by sorry



/- KTheoryLowDegrees:Z.4/steinitz -/
theorem steinitz (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    Subsingleton M ∨ ∃ (n : ℕ) (I : Ideal R), I ≠ ⊥ ∧
      Nonempty (M ≃ₗ[R] ((Fin n → R) × I)) := by sorry



/- KTheoryLowDegrees:Z.4/line-class-product -/
theorem lineClass_mul (L M : CommRing.Pic R) :
    cls R (L * M) = cls R L + cls R M - 1 := by sorry



variable (rank : K0 R →+ ℤ)
variable (hrank : ∀ (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M],
    rank (cls R M) = (Module.finrank (FractionRing R) (FractionRing R ⊗[R] M) : ℤ))


/- KTheoryLowDegrees:Z.4/projective-class-normal-form -/
theorem class_normal_form (hrank : ∀ (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M],
    rank (cls R M) = (Module.finrank (FractionRing R) (FractionRing R ⊗[R] M) : ℤ)) (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] :
    cls R M = ((rank (cls R M) - 1 : ℤ) : K0 R) + cls R (detProjective R M) := by sorry



/- KTheoryLowDegrees:Z.4/rank-pic-equivalence -/
def rankPicEquiv (hrank : ∀ (M : Type u) [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M],
    rank (cls R M) = (Module.finrank (FractionRing R) (FractionRing R ⊗[R] M) : ℤ)) :
    K0 R ≃+ (ℤ × Additive (CommRing.Pic R)) := by sorry

theorem rankPicEquiv_apply (x : K0 R) :
    rankPicEquiv R rank hrank x = (rank x, detHom R x) := by sorry
theorem rankPicEquiv_symm (n : ℤ) (L : CommRing.Pic R) :
    (rankPicEquiv R rank hrank).symm (n, Additive.ofMul L) =
      ((n-1 : ℤ) : K0 R) + cls R L := by sorry
include hrank in
theorem rankPicEquiv_ext (x y : K0 R) :
    x = y ↔ rank x = rank y ∧ det R x = det R y := by sorry
-- TauCeti.RingK0.rankPic_zero_test
example : rankPicEquiv R rank hrank 0 = (0, 0) := by sorry
-- TauCeti.RingK0.rankPic_negative_test
example : (rankPicEquiv R rank hrank).symm (-1, 0) = (-1 : K0 R) := by sorry
-- TauCeti.RingK0.rankPic_nontrivial_test
example (L : CommRing.Pic R) (hL : L ≠ 1) : cls R L - 1 ≠ 0 := by sorry



/- KTheoryLowDegrees:Z.4/rank-pic-apply -/
-- Signature rankPicEquiv_apply is grouped with rankPicEquiv above.


/- KTheoryLowDegrees:Z.4/rank-pic-inverse -/
-- Signature rankPicEquiv_symm is grouped with rankPicEquiv above.

end Dedekind

end TauCeti.RingK0
