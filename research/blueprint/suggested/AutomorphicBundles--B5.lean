/-
This file is not the roadmap and is not exhaustive. The roadmap document
AutomorphicBundles--B5.md is definitive. These statements suggest Lean forms
so that contributors and reviewers converge on names and signatures.

The target-level planning pass is complete; B5 is planned with explicit gaps.
This file does not supply the missing actual Shimura/formal/logarithmic types.
The omission ledger below names those signatures rather than fabricating them.
The inherited algebraic layer and new actual-scheme/local weight interfaces
are partial prototypes, never claims of implemented geometric nodes.
Full Tau Ceti-pin compilation is unavailable in this run; the Mathlib-only
fragment is checked separately with lean-check, as recorded in the handoff.
-/

import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.AdicCompletion.Noetherian
import Mathlib.RingTheory.Ideal.AssociatedPrime.Finiteness
import Mathlib.NumberTheory.ModularForms.NormTrace
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.RingTheory.Trace.Defs
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Prime.Basic
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Action
import TauCeti.AlgebraicGeometry.Modules.TensorProduct

/- Existing infrastructure: reuse it, do not redeclare it. -/
#check ModularForm.trace
#check CuspForm.trace
#check HeckeRing.GL2.heckeRingHomCharSpace
#check AlgebraicGeometry.Scheme.Modules.tensorProduct
#check AlgebraicGeometry.tilde.isoTop
#check HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime
#check PowerSeries.isUnit_iff_constantCoeff
#check CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono
#check IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
#check IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime

namespace FourierJacobiPrototype

section Recognition

variable {R : Type*} [CommRing R]
variable {A B C D E : Type*}
variable [AddCommGroup A] [Module R A]
variable [AddCommGroup B] [Module R B]
variable [AddCommGroup C] [Module R C]
variable [AddCommGroup D] [Module R D]
variable [AddCommGroup E] [Module R E]

/-- The last diagram chase in the coefficient-recognition proof.

For the geometric application:
A = AF(k,M1), B = AF(k,M), C = AF(k,M/M1);
D and E are the respective products of coefficient-family modules.

`exactRow`, `naturality`, and `quotientInjective` are REAL mathematical
premises of this elementary lemma. Establishing them for those geometric
objects is separately required by the packet; this lemma does not supply or
assume the entire geometric expansion theorem under a renamed field.
The algebraic proof body elaborates; its geometric instantiation remains required.
-/
theorem coefficientRecognitionLinear
    (i : A →ₗ[R] B) (q : B →ₗ[R] C)
    (expansion : B →ₗ[R] D) (quotientExpansion : C →ₗ[R] E)
    (coefficientQuotient : D →ₗ[R] E)
    (exactRow : LinearMap.range i = LinearMap.ker q)
    (naturality : quotientExpansion.comp q = coefficientQuotient.comp expansion)
    (quotientInjective : Function.Injective quotientExpansion)
    (b : B) (hb : coefficientQuotient (expansion b) = 0) :
    b ∈ LinearMap.range i := by
  rw [exactRow]
  change q b = 0
  apply quotientInjective
  calc
    quotientExpansion (q b) = coefficientQuotient (expansion b) :=
      congrArg (fun h : B →ₗ[R] E => h b) naturality
    _ = 0 := hb
    _ = quotientExpansion 0 := (map_zero quotientExpansion).symm

/-- The M1=M edge case of image recognition. -/
example (b : B) : b ∈ LinearMap.range (LinearMap.id : B →ₗ[R] B) := by
  exact ⟨b, rfl⟩

/-- A vanishing expansion detects zero only when injectivity is proved. -/
example (e : B →ₗ[R] D) (he : Function.Injective e) (b : B)
    (hb : e b = 0) : b = 0 := by
  apply he
  simpa using hb

end Recognition

section ExtensionRegression

open CategoryTheory

/-- Apply the EXISTING generic diagram lemma in the actual category of
modules. In B5 the two short complexes must first be constructed from the
Hodge-section and invariant-coefficient rows; this example does not construct
them or discharge their geometric exactness hypotheses.

There is deliberately no `Epi S.g` premise. Global sections of a short exact
sheaf sequence need not be right exact. The pinned source statement and proof
of the imported theorem, and the ModuleCat abelian-instance import, were read.
This application elaborates with the pinned ModuleCat and ShortComplex interfaces.
-/
example {R : Type*} [CommRing R]
    {S T : ShortComplex (ModuleCat R)} (φ : S ⟶ T)
    (hS : S.Exact)
    [Mono S.f] [Mono T.f] [Mono φ.τ₁] [Mono φ.τ₃] :
    Mono φ.τ₂ := by
  exact ShortComplex.mono_τ₂_of_exact_of_mono φ hS

/-- The first torsion extension test genuinely contains a nonzero nilpotent.
A theorem only about reduced coefficient rings does not cover this ring. -/
example : (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) ^ 2 = 0 := by
  decide

/-- Reduction to a residue field is not an injection of coefficient modules.
The devissage must use both terms of the extension, not just reduction. -/
example : ¬ Function.Injective (fun x : ZMod 4 => (x.val : ZMod 2)) := by
  decide

/-- Underlying finite-function test of 0 -> Z/2 -> Z/4 -> Z/2 -> 0.
The inclusion sends the class of one to two. This checks the first injection,
the middle image/kernel equality and the last surjection. It is not the
construction of a new exact-sequence carrier or a Fourier-Jacobi theorem.
The corresponding Z-linear maps are still required in a module instantiation.
-/
example :
    Function.Injective (fun y : ZMod 2 => (2 : ZMod 4) * (y.val : ZMod 4)) ∧
    (∀ x : ZMod 4, (x.val : ZMod 2) = 0 ↔
      ∃ y : ZMod 2, (2 : ZMod 4) * (y.val : ZMod 4) = x) ∧
    Function.Surjective (fun x : ZMod 4 => (x.val : ZMod 2)) := by
  decide

/-- For the C2-action (a,b) -> (a+b,b) on F2^2, the invariant vectors have
b=0. The equivariant second-coordinate quotient is onto before invariants but
not after invariants. Only left exactness of the invariant functor is used.
This finite computation is a regression, not a replacement group-action API.
-/
example :
    ¬ Function.Surjective
      (fun v : {v : ZMod 2 × ZMod 2 // v.1 + v.2 = v.1} => v.1.2) := by
  decide

end ExtensionRegression

section PrimeFiltrationReuse

universe u v

variable (R : Type u) [CommRing R] [IsNoetherianRing R]
variable (M : Type v) [AddCommGroup M] [Module R M] [Module.Finite R M]

/-- Direct application of the existing induction theorem, with its exact
module-universe and linear-equivalence interface. For B5 the motive is
injectivity of the constructed expansion map, not an opaque new predicate.
The three cases must be proved for the actual coefficient functors first.
Surjectivity of g below is on COEFFICIENT modules, not on global sections.
This direct-use example elaborates at the pinned commit. -/
example
    {motive : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → Prop}
    (hzero : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → [Subsingleton N] → motive N)
    (hprime : (N : Type v) → [AddCommGroup N] → [Module R N] →
      [Module.Finite R N] → (p : PrimeSpectrum R) →
      (N ≃ₗ[R] R ⧸ p.1) → motive N)
    (hext : (N₁ : Type v) → [AddCommGroup N₁] → [Module R N₁] →
      [Module.Finite R N₁] →
      (N₂ : Type v) → [AddCommGroup N₂] → [Module R N₂] →
      [Module.Finite R N₂] →
      (N₃ : Type v) → [AddCommGroup N₃] → [Module R N₃] →
      [Module.Finite R N₃] →
      (f : N₁ →ₗ[R] N₂) → (g : N₂ →ₗ[R] N₃) →
      Function.Injective f → Function.Surjective g → Function.Exact f g →
      motive N₁ → motive N₃ → motive N₂) : motive M := by
  exact IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime R
    (inferInstance : Module.Finite R M) (motive := motive) hzero hprime hext

end PrimeFiltrationReuse

-- Zero coefficients: no prime is chosen before the subsingleton case.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime
          (A := ℤ) (M := Fin 0 → ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime
    ℤ (Fin 0 → ℤ)

-- Nilpotent torsion coefficients are permitted; the factors may repeat.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ZMod 4) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ (ZMod 4)

-- A finite prime filtration is not necessarily a finite-length composition series.
example :
    ∃ s : RelSeries {(N₁, N₂) |
        Submodule.IsQuotientEquivQuotientPrime (A := ℤ) (M := ℤ) N₁ N₂},
      s.head = ⊥ ∧ s.last = ⊤ := by
  exact IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime ℤ ℤ

section LocalCompletionBaseline

variable {R : Type*} [CommRing R] [IsNoetherianRing R] [IsLocalRing R]
variable (I : Ideal R) (M : Type*) [AddCommGroup M] [Module R M] [Module.Finite R M]

-- The finite-stalk intersection step is already in Mathlib; no new theorem is planned.
example (hI : I ≠ ⊤) : (⨅ n : ℕ, I ^ n • ⊤ : Submodule R M) = ⊥ :=
  Ideal.iInf_pow_smul_eq_bot_of_isLocalRing I hI

-- The same input gives injectivity into Mathlib's actual completion carrier.
example (hI : I ≠ ⊤) : Function.Injective (AdicCompletion.of I M) := by
  let : IsHausdorff I M := IsHausdorff.of_isLocalRing I M hI
  exact AdicCompletion.of_injective I M

-- This is the germ-detection use, with no completeness premise on M.
example (hI : I ≠ ⊤) (m : M) (hm : AdicCompletion.of I M m = 0) : m = 0 := by
  let : IsHausdorff I M := IsHausdorff.of_isLocalRing I M hI
  exact AdicCompletion.of_injective I M (hm.trans (map_zero _).symm)

end LocalCompletionBaseline

-- The proper-ideal hypothesis is necessary even for a one-dimensional vector space.
example : ¬ Function.Injective (AdicCompletion.of (⊤ : Ideal (ZMod 2)) (ZMod 2)) := by
  sorry

section CompletionRegression

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The unit obstruction that invalidates an unrestricted face-completion map.
This uses the pinned PowerSeries unit criterion, not a new completion type. -/
example : IsUnit (1 - (PowerSeries.X : PowerSeries R)) := by
  sorry

/-- There is no evaluation at one on ALL formal power series over a nonzero
ring, even without imposing continuity or fixing the coefficient subring. -/
example [Nontrivial S] (f : PowerSeries R →+* S) :
    f PowerSeries.X ≠ 1 := by
  sorry

/-- Apply this to the augmentation y -> 1 of the Laurent coefficient ring,
composed with the constant-x coefficient of R[y,y^-1][[x]]. The theorem is
only the algebraic obstruction; the actual toric rings and common-boundary
completion still have to be supplied by their owning roadmaps. -/
example [Nontrivial R] (evaluation : S →+* R) (y : S)
    (hy : evaluation y = 1) :
    ¬ ∃ f : PowerSeries R →+* S, f PowerSeries.X = y := by
  sorry

end CompletionRegression

/- Algebraic shadows of negative tests. These are not replacements for the
geometric tests below. -/

/-- One component does not detect a section supported on another component. -/
example : ((0, 1) : ℤ × ℤ).1 = 0 ∧ ((0, 1) : ℤ × ℤ) ≠ (0, 0) := by
  sorry

/-- A formal coefficient target must allow infinite support. -/
example : ¬ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (1 : ℤ) = 0 := by
  sorry

/-- A group sum is not the identity on trivial invariants in characteristic p. -/
example (p : ℕ) [Fact p.Prime] :
    (∑ _ : Fin p, (1 : ZMod p)) = 0 ∧ (1 : ZMod p) ≠ 0 := by
  sorry

end FourierJacobiPrototype


open CategoryTheory AlgebraicGeometry
open scoped AlgebraicGeometry

/- These are partial interfaces on ACTUAL scheme coefficient sheaves.
E is the sheaf Psi(ell) tensor the boundary bundle tensor_R M after its
formation by B3/SF.0. This does not construct a Shimura chart, its bundle or
its tensor comparison. No arbitrary Type is renamed a coefficient sheaf. -/
namespace FJCoefficient

noncomputable def map {C : Scheme} {E F : C.Modules} (φ : E ⟶ F) :
    Γ(E, (⊤ : C.Opens)) →ₗ[Γ(C, (⊤ : C.Opens))] Γ(F, (⊤ : C.Opens)) where
  toFun := φ.app ⊤
  map_add' := by sorry
  map_smul' := by sorry

theorem map_id {C : Scheme} (E : C.Modules) :
    map (𝟙 E) = LinearMap.id := by sorry

theorem map_comp {C : Scheme} {E F G : C.Modules} (φ : E ⟶ F) (ψ : F ⟶ G) :
    map (φ ≫ ψ) = (map ψ).comp (map φ) := by sorry

/-- On a common actual scheme chart, after the degree/sheaf transport has
been identified with this isomorphism. Cross-chart/cusp transport is omitted. -/
noncomputable def transport {C : Scheme} {E F : C.Modules} (e : E ≅ F) :
    Γ(E, (⊤ : C.Opens)) ≃ₗ[Γ(C, (⊤ : C.Opens))] Γ(F, (⊤ : C.Opens)) where
  toFun := map e.hom
  invFun := map e.inv
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_smul' := by sorry

theorem family_ext {C : Scheme} {I : Type*} (E : I → C.Modules)
    (a b : (i : I) → Γ(E i, (⊤ : C.Opens))) :
    a = b ↔ ∀ i, a i = b i := by sorry

-- FJCoefficient.zeroCoefficients: after the supplied coefficient sheaf is
-- identified with tilde of the zero module on the affine Tate chart.
example {R : CommRingCat} (M : ModuleCat R) [Subsingleton M] :
    Subsingleton ((modulesSpecToSheaf.obj (tilde M)).presheaf.obj (.op ⊤)) := by sorry

-- FJCoefficient.tateTrivialization: the actual affine-section interface.
-- The owner must identify Psi(n) tensor L^k tensor M with this tilde sheaf.
example {R : CommRingCat} (M : ModuleCat R) :
    Nonempty (M ≅ (modulesSpecToSheaf.obj (tilde M)).presheaf.obj (.op ⊤)) := by sorry

-- FJCoefficient.notFiniteSupport: the genuine infinite local power series.
example :
    let f : PowerSeries ℤ := PowerSeries.mk (fun _ => 1)
    (1 - PowerSeries.X) * f = 1 ∧
    (∀ n, PowerSeries.coeff n f = 1) ∧
    ¬ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → PowerSeries.coeff n f = 0 := by sorry

end FJCoefficient

namespace ClassicalHecke

-- ClassicalHecke.weightZeroTrace: local finite-free trace, not a global
-- sheaf trace or a constructed Hecke correspondence. No averaging.
example {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]
    {I : Type*} [Fintype I] (b : Module.Basis I R A) (ν : R) :
    ν * Algebra.trace R A (algebraMap R A 1) = ν * (Fintype.card I : R) := by sorry

-- The degree-(ell+1), det^{-1} normalization on the weight-zero scalar.
example (ell : ℚ) (hell : ell ≠ 0) :
    ell⁻¹ * (ell + 1) = (ell + 1) / ell := by sorry

end ClassicalHecke

namespace VectorFourierJacobi

-- VectorFourierJacobi.rankTwoMonomial: the LOCAL trivialized rank-two
-- calculation. It does not assert a descended/global automorphic form.
example {R : Type*} [CommRing R] (n : ℕ) (v : Fin 2 → R) :
    PowerSeries.coeff n (PowerSeries.monomial (R := Fin 2 → R) n v) = v ∧
    ∀ m, m ≠ n →
      PowerSeries.coeff m (PowerSeries.monomial (R := Fin 2 → R) n v) = 0 := by sorry

end VectorFourierJacobi

namespace SiegelHT

/- These integer calculations are the displayed weight/Tate numerators,
not a substitute for an algebraic representation or cohomology carrier. -/
def coherentWeights (k1 k2 w : ℤ) : Fin 4 → ℤ × ℤ × ℤ :=
  ![(k1, k2, -w), (2-k1, k2, -w), (3-k2, k1+1, -w), (3-k2, 3-k1, -w)]

def twiceTateWeights (k1 k2 w : ℤ) : Fin 4 → ℤ :=
  ![k1+k2+w, 2-k1+k2+w, 4-k2+k1+w, 6-k1-k2+w]

theorem integralTwists (k1 k2 w : ℤ) (hparity : (k1+k2+w) % 2 = 0) :
    ∀ j, ∃ a : ℤ, twiceTateWeights k1 k2 w j = 2*a := by sorry

example : coherentWeights 0 0 0 = ![(0,0,0), (2,0,0), (3,1,0), (3,3,0)] := by sorry

example : twiceTateWeights 0 0 0 = ![0,2,4,6] := by sorry

example : (0+0+1 : ℤ) % 2 ≠ 0 := by sorry

end SiegelHT

/-!
## Omission ledger for the actual geometric interfaces

Each entry below is an explicit missing signature, not an elaborated
declaration. The packet statements and source locators are definitive.
The scheme maps above implement only the section-map specialization on
supplied coefficient sheaves, after the actual degree/bundle/chart transport.
The affine/local tests do not discharge that geometric identification.

AutomorphicBundles:B5/fj-coefficient-module [definition]
Use the good-prime PEL setting of Lan 6.4 and 7.1: R is the indicated localization of the reflex
integers (or its characteristic-zero field version), X is the smooth proper toroidal stack, k is a
nonnegative integer, and M is an R-module. For an actual cusp label Phi, let C_Phi be its abelian
torsor, Psi_Phi(ell) the character-indexed invertible sheaf from the relative torus embedding, and
L_Phi = det_Z(X_Phi) tensor omega_A the boundary Hodge line. Define C_Phi(ell;k,M) = Gamma(C_Phi,
Psi_Phi(ell) tensor L_Phi^k tensor_R M). This definition uses the torsor, not an arbitrary scalar
coefficient ring. For an index set Lambda in the character lattice, the coefficient-family target is
the product over ell in Lambda of these modules, with transport under the actual cusp stabilizer.
API names (full geometric scope still requires the supplied carriers):
  FJCoefficient.map: An R-linear map M to N induces coefficient maps in every degree, respecting identity and
    composition.
  FJCoefficient.transport: A supplied cusp-label or stabilizer isomorphism transports the lattice degree, invertible sheaf
    and coefficient section together, with composition law.
  FJCoefficient.family_ext: Two coefficient families are equal exactly when their components agree in every degree after
    the specified transports.
Test names (local/affine specializations above are identified separately):
  FJCoefficient.zeroCoefficients: With coefficient module M = 0, every C_Phi(ell;k,M) is zero.
  FJCoefficient.tateTrivialization: For C_Phi = Spec R, Psi_Phi(n) and L_Phi trivialized by the Tate-chart data, C_Phi(n;k,M)
    identifies with M by evaluation in those trivializations.
  FJCoefficient.notFiniteSupport: For the rank-one formal chart R[[q]] over nonzero R, the coefficient family of (1-q)^(-1) has
    coefficient 1 in every nonnegative degree; the expansion target must not impose finite
    support.
Owner/carrier inputs: AutomorphicBundles:B3, AutomorphicBundles:B4, ShimuraCompactifications:C0, ShimuraCompactifications:C4, ShimuraCompactifications:C5

AutomorphicBundles:B5/local-fj-expansion [construction]
For a nonempty stratum represented by (Phi,delta,sigma), construct the R-linear map from AF(k,M) =
Gamma(X,omega_tor^k tensor_R M) to the product of C_Phi(ell;k,M) over ell in sigma-dual. It
restricts a section to the formal completion along the stratum, pulls it to the supplied Mumford
chart, identifies the Hodge line, and extracts graded coefficients. Its image satisfies the actual
stabilizer equivariance. The coefficient product is a target, not an assertion that every family is
the expansion of a section or of a completed graded-algebra element.
API names (full geometric scope still requires the supplied carriers):
  FourierJacobi.local_coeff: Evaluation in degree ell equals the coefficient obtained from the actual completed section on
    the Mumford chart.
  FourierJacobi.local_add: The local expansion sends f+g to the sum of the two coefficient families.
  FourierJacobi.local_smul: The local expansion commutes with multiplication by every scalar in R.
Test names (local/affine specializations above are identified separately):
  FourierJacobi.local_zero: The expansion of the zero section has every coefficient zero.
  FourierJacobi.local_tate_monomial: On the rank-one formal Tate chart, the local section q^n(du/u)^k has coefficient 1 in degree n
    and 0 in every other degree. This is a local-chart test, not a claim that the monomial
    extends to a global modular form.
  FourierJacobi.local_coefficient_map: Applying M to N to a section and then expanding gives the degreewise coefficient map applied to
    its expansion.
Owner/carrier inputs: AutomorphicBundles:B5/fj-coefficient-module, AutomorphicBundles:B3, ShimuraCompactifications:C0, ShimuraCompactifications:C4, ShimuraCompactifications:C5, AdicSpacesPartII:F0

AutomorphicBundles:B5/cone-compatibility [lemma]
For a face inclusion sigma1 contained in the closure of sigma2, with both cones in the positive part
of the same cusp fan, sigma2-dual is contained in sigma1-dual. For a global Hodge section whose two
local expansions are obtained from the common formal boundary chart specified in the supplier
contract, its sigma1 coefficients agree with its sigma2 coefficients on sigma2-dual and vanish on
sigma1-dual minus sigma2-dual. Thus the sigma1 family is the extension by zero of the sigma2 family.
Incidence chains of positive cones and the support theorem then put the global expansion in the dual
of the fan support. This compares the common-image sections, not arbitrary elements of the two
separately completed rings.
Owner/carrier inputs: AutomorphicBundles:B5/local-fj-expansion, ShimuraCompactifications:C0, ShimuraCompactifications:C4, ShimuraCompactifications:C5, AdicSpacesPartII:F0, AdicSpacesPartII:F0/completion-of-morphism

AutomorphicBundles:B5/global-fj-expansion [construction]
Restrict the compatible cone expansions to P_Phi-dual to obtain an R-linear cusp-label expansion
FJ_Phi. Its codomain is the submodule of the product of C_Phi(ell;k,M) fixed by the actual action of
the full cusp stabilizer, including its action on degrees and coefficient sheaves. Composing with a
cone inclusion recovers the local expansion. Neither finite support nor division by the order of a
stabilizer enters the definition.
API names (full geometric scope still requires the supplied carriers):
  FourierJacobi.coeff: The ell-th coefficient is evaluation of the family in C_Phi(ell;k,M).
  FourierJacobi.constantTerm: The constant term is evaluation at degree zero, with its coefficient sheaf and stabilizer
    invariance retained.
  FourierJacobi.coefficient_naturality: An R-linear coefficient map M to N commutes with the global expansion and with each coefficient
    evaluation. Its proof obligation is the separate coefficient-naturality node below.
Test names (local/affine specializations above are identified separately):
  FourierJacobi.global_zero: The zero section maps to the zero invariant family.
  FourierJacobi.global_local: Extending the global family to sigma-dual by zero gives the local expansion for that cone.
  FourierJacobi.no_averaging: For a trivial action of the cyclic group of order p on F_p, the invariant submodule is all of
    F_p. A construction that multiplies a section by the group sum, or divides by p, does not
    give this invariant-section identification.
Owner/carrier inputs: AutomorphicBundles:B5/cone-compatibility, AutomorphicBundles:B5/fj-coefficient-module, ShimuraCompactifications:C1, ShimuraCompactifications:C4

AutomorphicBundles:B5/fj-refinement [theorem]
For a compatible smooth fan refinement pi:X_SigmaPrime to X_Sigma, pullback of sections of
omega_tor^k tensor_R M commutes with FJ_Phi under the canonical cusp-label identifications. Using
B3's section comparison and a common refinement gives a canonical identification independent of the
chosen fan, not literal equality of compactifications.
Owner/carrier inputs: AutomorphicBundles:B5/global-fj-expansion, AutomorphicBundles:B3, ShimuraCompactifications:C3

AutomorphicBundles:B5/constant-term-restriction [theorem]
For a stratum represented by a cone in the positive part P_Phi-plus, restriction of f to that
stratum is obtained from the degree-zero coefficient of FJ_Phi(f). Nonzero degrees in P_Phi-dual lie
in the stratum ideal. Descent of this constant term to the lower-dimensional moduli object also uses
full Gamma_Phi invariance and the quotient M_Phi/Gamma_Phi = M_Z; the finite cover M_Phi is not
identified with M_Z before descent.
Owner/carrier inputs: AutomorphicBundles:B5/global-fj-expansion, ShimuraCompactifications:C0, ShimuraCompactifications:C1, ShimuraCompactifications:C4

AutomorphicBundles:B5/coefficient-naturality [lemma]
Fix the actual toroidal model, weight and finite collection I of cusp labels. Write F(M) = AF(k,M)
and G(M) = product over i in I of FJE_Phi_i(k,M). For every R-linear map a:M to N, the constructed
coefficient maps satisfy G(a) composed with FJ_I,M = FJ_I,N composed with F(a). Thus the Fourier-
Jacobi maps form a natural transformation between the actual coefficient functors. This is the
coefficient_naturality API of global-fj-expansion, now a separate proof node because it is used in
the exact-row arguments.
Owner/carrier inputs: AutomorphicBundles:B5/global-fj-expansion, AutomorphicBundles:B5/local-fj-expansion, AutomorphicBundles:B5/fj-coefficient-module, AdicSpacesPartII:F0

AutomorphicBundles:B5/coefficient-sequence-exact [lemma]
For a short exact sequence 0 to N to M to Q to 0 of R-modules, the actual coefficient maps give an
exact sequence 0 to AF(k,N) to AF(k,M) to AF(k,Q). No surjectivity of the last map is asserted. In
particular, coefficient inclusions induce injections of Hodge sections.
Owner/carrier inputs: AutomorphicBundles:B3, AutomorphicBundles:B4, ShimuraCompactifications:C5, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/fj-target-left-exact [lemma]
For the fixed finite collection I and G(M) = product over i in I of FJE_Phi_i(k,M), every short
exact coefficient sequence 0 to N to M to Q to 0 induces a left exact sequence 0 to G(N) to G(M) to
G(Q). This includes infinite products over character degrees and full cusp-stabilizer invariants. It
asserts no surjectivity at G(Q) and no commutation with filtered colimits.
Owner/carrier inputs: AutomorphicBundles:B5/fj-coefficient-module, AutomorphicBundles:B5/global-fj-expansion, ShimuraCompactifications:C1, ShimuraCompactifications:C4, ShimuraCompactifications:C5, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/fj-injectivity-cyclic [lemma]
Let p be a prime ideal of the indicated field or Dedekind base R, including p=0, and put S=R/p.
Suppose the base-changed chosen strata jointly meet every irreducible component of X_S and the
actual completed-chart coefficient comparisons are compatible with this base change. Then the joint
Fourier-Jacobi map on AF(k,S) is injective. For p=0 this uses the reduced total model; for p nonzero
it uses the reduced residue-field model. Fiberwise detection is supplied by the precise geometric
request below; the neat-level route is not silently asserted at non-neat level.
Owner/carrier inputs: AutomorphicBundles:B5/local-fj-expansion, AutomorphicBundles:B5/global-fj-expansion, ShimuraCompactifications:C5, AdicSpacesPartII:F0, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1, AdicSpacesPartII:F0/completion-detects-near-closed

AutomorphicBundles:B5/fj-injectivity-extension [lemma]
For a short exact coefficient sequence 0 to N to M to Q to 0 on the fixed actual PEL model,
injectivity of the joint Fourier-Jacobi maps on AF(k,N) and AF(k,Q) implies injectivity on AF(k,M).
The statement applies to nonsplit extensions, with no flatness assumption on N, M or Q beyond the
geometric flatness already established for the coefficient functors.
Owner/carrier inputs: AutomorphicBundles:B5/coefficient-naturality, AutomorphicBundles:B5/coefficient-sequence-exact, AutomorphicBundles:B5/fj-target-left-exact

AutomorphicBundles:B5/fj-injectivity-finite [lemma]
Assume the geometric hypotheses of fj-injectivity-cyclic for every prime quotient R/p. Then the
joint Fourier-Jacobi map is injective on AF(k,M) for every finitely generated R-module M. A finite
prime filtration and the coefficient-extension lemma, rather than a free-module decomposition or
completion faithfulness on each nonreduced thickening, give the reduction.
Owner/carrier inputs: AutomorphicBundles:B5/fj-injectivity-cyclic, AutomorphicBundles:B5/fj-injectivity-extension, AutomorphicBundles:B5/coefficient-naturality

AutomorphicBundles:B5/fj-injectivity [theorem]
In the setting of Lan 7.1.2.14, choose a finite collection of nonempty strata whose union meets
every irreducible component of the toroidal model. The product of their Fourier-Jacobi morphisms on
AF(k,M) is injective for every R-module M. The source hypothesis is preserved: early C5 must
establish its compatibility with the prime-quotient component-detection hypotheses used below. The
specified neat-level route does not by itself establish the full non-neat source theorem, which
remains an open target.
Owner/carrier inputs: AutomorphicBundles:B5/fj-injectivity-finite, AutomorphicBundles:B5/coefficient-naturality, AutomorphicBundles:B5/fj-target-left-exact, AutomorphicBundles:B4, ShimuraCompactifications:C5, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/coefficient-recognition [theorem]
Let M1 be an R-submodule of M and keep the detecting strata of fj-injectivity. If the expansion of f
in AF(k,M) at every chosen cusp lies in the image of the corresponding coefficient-family module
with coefficients in M1, then f lies in the image of AF(k,M1). This is an image-membership theorem
for actual sections, not an unconditional assertion that global sections commute with every base
change.
Owner/carrier inputs: AutomorphicBundles:B5/fj-injectivity, AutomorphicBundles:B5/coefficient-naturality, AutomorphicBundles:B5/coefficient-sequence-exact, AutomorphicBundles:B5/fj-target-left-exact

AutomorphicBundles:B5/cuspidal-boundary-criterion [theorem]
On a neat smooth toroidal model with its reduced relative normal-crossings divisor D, for the
determinant-Hodge coefficient in this packet, a section belongs to the image of
Gamma(X,omega_tor^k(-D) tensor_R M) precisely when its restriction to D is zero. Where the boundary-
chart restrictions jointly detect this restriction, the condition is equivalently vanishing of the
appropriate constant terms at all proper boundary labels. The exactness and detection assertions
must be proved for the chosen M; a single maximal-cusp constant term is not substituted for all
boundary restrictions.
Owner/carrier inputs: AutomorphicBundles:B3, AutomorphicBundles:B4, AutomorphicBundles:B5/constant-term-restriction, ShimuraCompactifications:C4, ShimuraCompactifications:C5

AutomorphicBundles:B5/hecke-section-operator [construction]
For the B1–B4 automorphic bundle E(V) on a fixed toroidal model X_K over R, take an admissible
prime-to-characteristic element g with K_g=K∩gKg⁻¹ and the correspondence X_K ←p1 X_Kg →p2 X_K.
After compatible cone refinement, the B2/B3 equivariant realization supplies θ_g:p2*E(V)→p1*E(V).
For every R-module M define H_g=tr_p1 ∘ θ_g ∘ p2* on Γ(X_K,E(V)⊗_R M). Here the trace is the
extension of the finite locally free trace through the supplied toric-refinement comparison, not a
trace inferred for an arbitrary proper map. Fix a K-bi-invariant multiplicative character ν of the
admissible monoid with values in R×, and set T_g=ν(g)H_g. The construction is independent of common
refinement and representatives and preserves the subcanonical section module when the boundary ideal
transport is supplied.
API names (full geometric scope still requires the supplied carriers):
  ClassicalHecke.operator: The R-linear composite ν(g)tr_p1 θ_g p2* on the actual section module.
  ClassicalHecke.operator_one: The identity correspondence with ν(1)=1 acts as identity.
  ClassicalHecke.coefficient_map: An R-linear coefficient map M→N commutes with T_g, by coefficient-compatible pullback, trace
    and θ_g.
  ClassicalHecke.refinement: Transport across the B3 section comparison along a common fan refinement intertwines T_g, with
    identity and composition laws.
Test names (local/affine specializations above are identified separately):
  ClassicalHecke.identity: The identity correspondence acts as identity on canonical and subcanonical sections.
  ClassicalHecke.weightZeroTrace: For a finite-free degree-d chart and the trivial bundle, the raw operator on 1 is d, not 1; the
    normalized value is ν(g)d.
  ClassicalHecke.modularNormalization: Over C, after the imported modular comparison and correct coset orientation, GL2 det⁻¹-scaled
    isogeny pull-identify-trace agrees with the existing HeckeRing.GL2.heckeRingHomCharSpace
    action; at an unramified prime its coefficients have the character-weighted ℓ^(k−1) term.
Owner/carrier inputs: AdelicAlgebraicGroups:AA.4/hecke-correspondence, AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B4, ShimuraCompactifications:C3, SchemeAndStackFoundations:SF.0

AutomorphicBundles:B5/hecke-convolution [theorem]
With the correspondences, trace/base-change comparisons, θ cocycle and multiplicative normalization
of hecke-section-operator, the assignment [KgK]↦T_g extends to a unital ring homomorphism from the
existing integral Hecke ring to End_R Γ(X_K,E(V)⊗_R M), and restricts to the subcanonical section
module. The multiplication convention is the existing HeckeCosetModule convolution, after an
explicit right-coset/inverse-orientation comparison; its integer multiplicities are unchanged.
Owner/carrier inputs: AutomorphicBundles:B5/hecke-section-operator, AdelicAlgebraicGroups:AA.4/hecke-cartesian, SchemeAndStackFoundations:SF.0

AutomorphicBundles:B5/non-neat-hecke-descent [theorem]
Let K′◁K be neat and normal with finite Γ=K/K′, and use the actual equivariant canonical or
subcanonical bundle on the stack quotient [X_K′/Γ]. Descent identifies its section module with
Γ(X_K′,E⊗_R M)^Γ for every allowed R-module M. Define the K-Hecke operators through the refined K_g
correspondences and their common neat covers. The resulting operators preserve this descent
equalizer, are independent of the chosen neat cover, and agree under the descent identification with
the stack pull-identify-trace action.
Owner/carrier inputs: AutomorphicBundles:B5/hecke-section-operator, AutomorphicBundles:B5/hecke-convolution, AdelicAlgebraicGroups:AA.4/hecke-cartesian, SchemeAndStackFoundations:SF.1, ShimuraCompactifications:C3

AutomorphicBundles:B5/modular-expansion-comparison [comparison]
Under B3/B4’s modular specialization and the R15.1 all-weight analytic comparison, the rank-one
Fourier–Jacobi expansion is the imported Tate q-expansion, and over C it equals
UpperHalfPlane.qExpansion h at the same cusp parameter q=exp(2πiτ/h) and invariant-differential
trivialization. At full level n≥3 use Tate(q^n) over Z[1/n,ζ_n][[q]] as in the owner: the
Kodaira–Spencer image of the square of the canonical differential is n dq/q. Import the R15.2 all-
component integral q-expansion principle and cusp exact sequence rather than asserting new modular
theorems. Transport Hecke normalization to the existing analytic action and the owned geometric
R15.2 operators.
Owner/carrier inputs: AutomorphicBundles:B5/local-fj-expansion, AutomorphicBundles:B5/hecke-section-operator, AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization, AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison, AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem, AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions, AlgebraicModularFormsAndSerreWeights:R15.2/cuspidal-exact-sequence-equivariance

AutomorphicBundles:B5/vector-fj-expansion [construction]
In Lan’s neat good-prime PEL setup, let R be a Noetherian coefficient algebra over the allowed
reflex/representation base and W a finite projective R-representation of the actual Levi group.
Import Ecan(W) from B2/B3. For each cusp chart the Raynaud/parabolic identification supplies a
locally free bundle E0(W) on its abelian torsor C whose pullback is Ecan(W) on the completed Mumford
family. For every R-module M define degree-ell coefficients as Γ(C,Ψ(ell)⊗E0(W)⊗_R M), and define
the expansion by actual formal restriction, the bundle identification and graded extraction. Impose
the completed support condition and full-stabilizer transports before passing to invariants. For
general characteristic-zero Shimura data use this construction only after C3.general supplies the
actual mixed-boundary formal isomorphism and coefficient-bundle comparison; Milne VII.4.1 is a
conjectural description in the inspected notes, not that supplier’s proof.
API names (full geometric scope still requires the supplied carriers):
  VectorFourierJacobi.coefficient: Extract the degree-ell section of Ψ(ell)⊗E0(W)⊗M from the completed boundary restriction.
  VectorFourierJacobi.coefficient_map: An equivariant R-linear representation map W→W′ and a coefficient map M→M′ induce commuting
    degreewise maps, respecting identities and composition.
  VectorFourierJacobi.transport: A cusp transport moves the lattice degree, Ψ and E0 together and intertwines extraction.
  VectorFourierJacobi.determinant: The determinant-Hodge representation specializes to the scalar FJ map, under B3’s supplied
    boundary bundle isomorphism.
  VectorFourierJacobi.refinement: The canonical section comparison for a common fan refinement intertwines vector expansions and
    has its cocycle law.
Test names (local/affine specializations above are identified separately):
  VectorFourierJacobi.zeroRepresentation: For W=0 or M=0 every coefficient and expansion is zero.
  VectorFourierJacobi.rankTwoMonomial: On a trivial rank-two local coefficient bundle and rank-one chart, q^n(v1,v2) has vector
    coefficient (v1,v2) at n and zero at other degrees.
  VectorFourierJacobi.scalarSpecialization: For the determinant-Hodge representation giving ω^k the expansion equals the scalar map after
    the actual boundary-line identification.
Owner/carrier inputs: AutomorphicBundles:B5/fj-coefficient-module, AutomorphicBundles:B5/local-fj-expansion, AutomorphicBundles:B5/cone-compatibility, AutomorphicBundles:B5/global-fj-expansion, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B3.general, AutomorphicBundles:B4, ShimuraCompactifications:C3.general, ShimuraCompactifications:C4

AutomorphicBundles:B5/vector-expansion-principle [theorem]
Let R be Noetherian, X a qcqs toroidal model smooth over R in the supplied PEL or characteristic-
zero setup, Ecan a finite-rank locally free canonical automorphic bundle, and C_i its R-flat
abelian-torsor charts with locally free E0,i. Require the actual formal restriction/graded
coefficient identification, descent, and a finite collection of strata whose restrictions meet every
irreducible component of X_(R/p) for every prime p⊂R. Then the joint vector Fourier–Jacobi map
Γ(X,Ecan⊗_R M)→∏_i FJE_i(Ecan,M) is injective for every R-module M. For M1⊂M, membership of every
expansion in the image from M1 is equivalent to membership of the global section in Γ(X,Ecan⊗M1).
Boundary-zero coefficients at all required boundary strata characterize the image of Esub=Ecan(−D),
when its relative boundary tensor sequence is exact.
Owner/carrier inputs: AutomorphicBundles:B5/vector-fj-expansion, AutomorphicBundles:B5/coefficient-naturality, AutomorphicBundles:B5/coefficient-sequence-exact, AutomorphicBundles:B5/fj-target-left-exact, AutomorphicBundles:B5/fj-injectivity-finite, AutomorphicBundles:B5/coefficient-recognition, AutomorphicBundles:B5/constant-term-restriction, AutomorphicBundles:B5/cuspidal-boundary-criterion, AdicSpacesPartII:F0/completion-detects-near-closed, SchemeAndStackFoundations:SF.1, AutomorphicBundles:B3, AutomorphicBundles:B4

AutomorphicBundles:B5/hilbert-cusp-expansion [construction]
Use Diamond’s Hilbert setting: F≠Q totally real, a rational prime p possibly ramified in F, a
sufficiently large p-adic field with valuation ring O and embeddings Θ, and U=U^p GL2(O_F,p). Let R
be a Noetherian O-algebra and (k,m)∈Z^Θ×Z^Θ with χ_(k+2m),R trivial on O_F×∩U. For the imported
automorphic line A_(k,m), M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A). At a cusp c represented by 0→I→H→J→0,
polarization λ and level η, set Λ=d_F⁻¹I⁻¹J. Choose a prime-to-p full level N≥3 contained in U,
ζ_N∈O, and a splitting H≅J⊕I. Let D_(k,m),c=⊗_θ (I⁻¹)_θ^⊗kθ ⊗ (d_F(IJ)⁻¹)_θ^⊗mθ. Define q_c by
formal restriction into the series with coefficient line D_c⊗_O R and indices N⁻¹Λ_+∪{0}, using the
actual unit action and completion. Changes of splitting, cusp representative and fine level use the
canonical transports of these data; the expansion at general U is independent of a chosen cusp above
c. The minimal pushforward j_*A is not assumed locally free.
API names (full geometric scope still requires the supplied carriers):
  HilbertQExpansion.map: The R-linear formal restriction q_c into the coefficient-line series in the specified
    fractional positive lattice.
  HilbertQExpansion.coeff: Extract the D_c⊗R coefficient of t∈N⁻¹Λ_+∪{0}, including zero.
  HilbertQExpansion.transport: The canonical lattice/line isomorphism for a cusp representative or splitting change
    intertwines the transformed series; transports compose.
  HilbertQExpansion.coefficient_map: A Noetherian O-algebra map R→R′ commutes with each coefficient after base change of the actual
    form.
  HilbertQExpansion.fineLevel: Restriction to a fine U(N) and any cusp above c gives the same expansion after the canonical
    line/lattice identifications.
Test names (local/affine specializations above are identified separately):
  HilbertQExpansion.zero: The zero form has zero coefficient in every degree; over the zero coefficient ring all forms
    and coefficients vanish.
  HilbertQExpansion.localMonomial: On a chosen formal cusp chart and coefficient-line trivialization, q^t d has coefficient d at t
    and zero elsewhere; no global form or unit invariance of this local monomial is asserted.
  HilbertQExpansion.unitTransport: A family supported at a positive t moved to a different degree by a cusp unit, with nonzero
    coefficient only at t, is not invariant unless its full transported orbit satisfies the
    unit relation. It cannot be declared the expansion of a descended form.
Owner/carrier inputs: AutomorphicBundles:B5/vector-fj-expansion, HilbertModularVarietiesAndShimuraCurves:H2, HilbertModularVarietiesAndShimuraCurves:H3, ShimuraCompactifications:C6, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B4

AutomorphicBundles:B5/hilbert-expansion-principle [theorem]
In hilbert-cusp-expansion’s prime-to-p-level setup, let S be a collection of cusps meeting every
connected component of Ymin, equivalently with surjective determinant map S→F_+×\A_F,f×/det(U). Then
q_S is injective. If R′⊂R is a Noetherian O-subalgebra and every coefficient lies in D_c⊗_O R′ at
all c∈S, then the form comes from M_(k,m)(U;R′). This is Diamond Proposition 6.2.1; its geometric
supplier must verify the component-to-fibre-detection comparison used by the vector principle. No
analogous assertion is made for general Iwahori special fibres Y0(P)min_R, whose irreducible
components need not contain cusps.
Owner/carrier inputs: AutomorphicBundles:B5/hilbert-cusp-expansion, AutomorphicBundles:B5/vector-expansion-principle, AutomorphicBundles:B5/coefficient-recognition, ShimuraCompactifications:C6, HilbertModularVarietiesAndShimuraCurves:H2, HilbertModularVarietiesAndShimuraCurves:H3, SchemeAndStackFoundations:SF.1

AutomorphicBundles:B5/hilbert-cuspidal-boundary [theorem]
In the Hilbert prime-to-p setting, let e_c be the constant coefficient of q_c with values in D_c⊗_O
R. The source’s cusp space is ker(∏_c e_c), using all cusps. Under B3’s canonical/subcanonical
boundary comparison and exact relative boundary tensor sequence, this is the image of
Γ(Ytor,A_(k,m)(−D)⊗_O R) in the canonical sections. Each e_c is independent of splitting and lands
in the actual cusp-unit invariants. In the characteristic-zero/flat O setting of §6.3, if the pair
of weight vectors is not parallel, meaning (kθ,mθ) is not independent of θ, these invariant
constants vanish and every such form is cuspidal; the conclusion is not inferred for arbitrary
torsion R.
Owner/carrier inputs: AutomorphicBundles:B5/hilbert-cusp-expansion, AutomorphicBundles:B5/constant-term-restriction, AutomorphicBundles:B5/cuspidal-boundary-criterion, AutomorphicBundles:B3, ShimuraCompactifications:C6

AutomorphicBundles:B5/hecke-expansion-compatibility [theorem]
For an admissible geometric Hecke correspondence of hecke-section-operator, the actual completed
cusp correspondence and bundle transport induce a coefficient operator H_g^FJ. The square FJ∘T_g =
ν(g)H_g^FJ∘FJ commutes, including cusp-label changes, finite trace and full-stabilizer transport; it
is independent of compatible refinement and commutes with allowed coefficient changes. No universal
scalar formula for higher-dimensional coefficients is asserted: they remain sections on abelian
torsors. At a good modular prime ℓ∤N, under modular-expansion-comparison this specializes to
b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), with a_(n/ℓ)=0 when ℓ∤n and the n=0 term included. In Diamond’s
Hilbert normalization r_m^t, for U1(n) or U(n) and v∤np, it specializes to r_m^t(T_v f)=r_m^(ϖ_v
t)(f)+Nm(v) r_m^(ϖ_v⁻¹t)(S_v f); for U1(n) and v|n the second term is absent. Here r_m^t includes
the coefficient-line/χ_m normalization of (6.1), and S_v is the actual central correspondence.
Owner/carrier inputs: AutomorphicBundles:B5/hecke-section-operator, AutomorphicBundles:B5/non-neat-hecke-descent, AutomorphicBundles:B5/modular-expansion-comparison, AutomorphicBundles:B5/hilbert-cusp-expansion, AutomorphicBundles:B5/vector-fj-expansion, ShimuraCompactifications:C3, ShimuraCompactifications:C4, ShimuraCompactifications:C6, AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions

AutomorphicBundles:B5/classical-bcgp-equivariance [comparison]
In BCGP’s Hodge-type setting, fix neat tame K^p, a sufficiently large p-adic coefficient field E,
the actual Levi M, finite-dimensional algebraic L_κ with κ M-dominant, and compatible smooth
toroidal data. The imported coefficient functor VB^0 identifies VB^0(L_κ)=ω^(κ,sm) with the smooth
tower of the finite-level classical automorphic bundles of B2/B3, with its μ-weight Tate
normalization. Its coherent cohomology is colim_(Kp) RΓ(X_KpK^p,ω_Kp^κ), a complex of smooth
admissible G(Q_p)-representations. The same compatibility holds after tensoring by the actual
boundary ideal (−D). Level pullbacks, prime-to-p Hecke maps and compatible fan refinements commute
with the identification; G(Q_p) may change the fan. For GSp4 the convention check is
ω^((1,0;−1),sm)=ω_A(−1)⊗O^sm, with Q_p(1) of Hodge–Tate weight −1 and Sen eigenvalue +1. The full
derived/analytic VB machinery belongs to the already proposed HigherHidaAndColemanTheory, not to B5.
Owner/carrier inputs: AutomorphicBundles:B1, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B3.general, AutomorphicBundles:B4, HodgeTateAndCanonicalSubgroups:T6:comparison, SchemeAndStackFoundations:SF.2, ShimuraCompactifications:C3.general, AutomorphicBundles:B5/hecke-section-operator

AutomorphicBundles:B5/classical-siegel-ht-comparison [theorem]
For the finite-level GSp4 toroidal model X=X_KpK^p in BCGP’s setting, let κ=(k1,k2;w) be an integral
G-dominant weight with 0≥k1≥k2 and k1+k2+w even, and let V_κ∨ be its canonical pro-Kummer-étale
coefficient local system. Use the untwisted canonical coherent bundles ω^λ of §4.8. Define
λ0=(k1,k2;−w), λ1=(2−k1,k2;−w), λ2=(3−k2,k1+1;−w), λ3=(3−k2,3−k1;−w); 2a0=k1+k2+w, 2a1=2−k1+k2+w,
2a2=4−k2+k1+w, 2a3=6−k1−k2+w. For every i≥0 there is a G_Qp×T_KpK^p-equivariant isomorphism
H^i(X,V_κ∨)⊗_Qp C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj)(−a_j), with negative coherent degrees interpreted
as zero. The étale group is the logarithmic/pro-Kummer cohomology in the source notation; it is not
reinterpreted as ordinary étale cohomology of the proper underlying toroidal space with an arbitrary
lisse extension. The Tate convention is Q_p(1) of Hodge–Tate weight −1, Sen eigenvalue +1.
Owner/carrier inputs: AutomorphicBundles:B1, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B4, HodgeTateAndCanonicalSubgroups:T6:comparison, SchemeAndStackFoundations:SF.2, AutomorphicBundles:B5/classical-bcgp-equivariance, AutomorphicBundles:B5/hecke-convolution

AutomorphicBundles:B5/cuspidal-siegel-ht-comparison [comparison]
With exactly the weight, coefficient local system, finite-level model and Tate convention of
classical-siegel-ht-comparison, there is a G_Qp×T_KpK^p-equivariant isomorphism H_c^i(X,V_κ∨)⊗_Qp
C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj(−D))(−a_j), where D is the actual reduced toroidal boundary divisor
and H_c is the compact-support logarithmic/étale theory used by BCGP. Keep this as a separate
comparison from the ordinary canonical-bundle statement. The cusp twist is the subcanonical
coefficient sheaf, not replacement by a selected set of zero constant terms in cohomological degree
i.
Owner/carrier inputs: AutomorphicBundles:B1, AutomorphicBundles:B2, AutomorphicBundles:B3, AutomorphicBundles:B4, HodgeTateAndCanonicalSubgroups:T6:comparison, SchemeAndStackFoundations:SF.2, AutomorphicBundles:B5/classical-bcgp-equivariance, AutomorphicBundles:B5/hecke-convolution, AutomorphicBundles:B5/classical-siegel-ht-comparison, AutomorphicBundles:B5/cuspidal-boundary-criterion

Missing types: the actual Shimura stack and coefficients (B1–B4/SF.1),
completed graded Mumford family and support/invariants (C0–C6/F0),
Hilbert cusp fractional-lattice/line series (H2/H3/C6), and logarithmic
canonical local-system/cohomology/VB/BGG inputs (T6 and the existing pending
coefficient/representation designs). No field asserts any target theorem.
-/
