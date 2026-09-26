/-
This file is not the roadmap and is not exhaustive. The roadmap document
AutomorphicBundles--B5.md is definitive. These statements suggest Lean forms
so that contributors and reviewers converge on names and signatures.

PARTIAL CHECKPOINT: this file has NOT been compiled. This includes the new
proof bodies below. It does not yet give the geometric signatures of the
fifteen packet nodes or their nine definition/construction unit tests.
Missing types are not replaced by opaque propositions or fabricated
scheme/bundle carriers. The omissions are recorded in the packet and handoff.

The examples below are algebraic regression patterns, NOT formalizations of
the toroidal geometry, Fourier-Jacobi construction, or expansion principle.
-/

import Mathlib.Algebra.Module.Submodule.Range
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.Ideal.AssociatedPrime.Finiteness
import Mathlib.NumberTheory.ModularForms.NormTrace
import TauCeti.NumberTheory.ModularForms.HeckeSlash.Nebentypus.Prime.Basic

/- Existing infrastructure: reuse it, do not redeclare it. -/
#check ModularForm.trace
#check CuspForm.trace
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
The proof body is a prototype and has not been elaborated in this session.
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
This application itself has not been compiled.
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
This example has not been compiled. -/
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
example : (0, 1 : ℤ × ℤ).1 = 0 ∧ (0, 1 : ℤ × ℤ) ≠ (0, 0) := by
  sorry

/-- A formal coefficient target must allow infinite support. -/
example : ¬ ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (1 : ℤ) = 0 := by
  sorry

/-- A group sum is not the identity on trivial invariants in characteristic p. -/
example (p : ℕ) [Fact p.Prime] :
    (∑ _ : Fin p, (1 : ZMod p)) = 0 ∧ (1 : ZMod p) ≠ 0 := by
  sorry

end FourierJacobiPrototype

/-!
## Geometric signatures still to be written

These are explicit omissions, not elaborated declarations. They are listed
with the packet's names so the next worker can reconcile coverage. Before
writing them, identify the actual B3/B4 sheaf/section carriers, C0/C4/C5
boundary chart and coefficient carriers, and F0 completion operations.

1. B5/fj-coefficient-module
   C_Phi(ell;k,M) = Gamma(C_Phi, Psi_Phi(ell) tensor L_Phi^k tensor_R M).
   APIs:
   * FJCoefficient.map: functoriality in the R-module M.
   * FJCoefficient.transport: degree AND coefficient-sheaf transport.
   * FJCoefficient.family_ext: equality by equality in every degree.
   Tests to state as actual geometric examples:
   * FJCoefficient.zeroCoefficients: M=0 gives zero coefficient modules.
   * FJCoefficient.tateTrivialization: the actual Tate-chart coefficient is M.
   * FJCoefficient.notFiniteSupport: coefficients of the local (1-q)^(-1).

2. B5/local-fj-expansion
   Construct the section -> formal completion -> Mumford chart -> coefficient
   morphism; do not give an arbitrary linear map that is merely named FJ.
   APIs:
   * FourierJacobi.local_coeff: evaluation of the actual completed section.
   * FourierJacobi.local_add: additivity of that map.
   * FourierJacobi.local_smul: R-linearity of that map.
   Tests:
   * FourierJacobi.local_zero.
   * FourierJacobi.local_tate_monomial: local q^n(du/u)^k, not asserted global.
   * FourierJacobi.local_coefficient_map: naturality under M -> N.

3. B5/cone-compatibility
   For sigma1 a face of sigma2 in the positive part, sigma2-dual is contained
   in sigma1-dual. Compare only sections pulled back from a COMMON boundary
   completion. The individual stratum completions map to that common object;
   no unrestricted map from the sigma2 completed ring to the sigma1 completed
   ring is assumed. The common chart, its map to the toroidal model, its
   coefficient extraction and descent are explicit C0/C4/C5/F0 requests.
   The newly allowed degrees have zero coefficients. The zero-face/ray
   example tests only algebraic character inclusions, not completed maps.
   The three CompletionRegression examples above reject the invalid shortcut.

4. B5/global-fj-expansion
   Construct the map on the full dual support cone into the actual fixed
   submodule for the full cusp stabilizer, with degree transport.
   APIs:
   * FourierJacobi.coeff.
   * FourierJacobi.constantTerm.
   * FourierJacobi.coefficient_naturality (separate proof node 10 below).
   Tests:
   * FourierJacobi.global_zero.
   * FourierJacobi.global_local: extension to each local cone.
   * FourierJacobi.no_averaging: actual invariant-submodule comparison,
     including a trivial cyclic order-p action on F_p.

5. B5/fj-refinement
   The coefficient map commutes with the canonical pullback of the SAME
   Hodge sections along a fan refinement, including torsion coefficients.
   Do not deduce the required refinement cohomology theorem merely from the
   injectivity devissage. The finite-projective part uses a direct summand,
   not an unsupported filtered union of free submodules.

6. B5/constant-term-restriction
   Reduce by the actual stratum ideal. Then descend the constant term using
   the FULL stabilizer and the finite-cover quotient. Do not remove the
   quotient or its invariance condition from the signature.

7. B5/fj-injectivity
   Preserve the source's TOTAL-model component-detection hypothesis. Early C5
   still has to prove the residue-fiber detection needed by node 13, or give
   another argument recovering that same source hypothesis.
   Use node 15 for finite coefficients. For arbitrary M, lift the section from
   a finite submodule N by the qcqs-stack section/colimit theorem, then use
   injectivity of G(N) -> G(M). Do NOT commute infinite coefficient products
   with the filtered colimit. No replacement Prop encoding the geometric
   conclusion is introduced here.

8. B5/coefficient-recognition
   Use joint injectivity for the QUOTIENT module M/M1 and the genuinely proved
   exact rows and naturality. The typed lemma above covers only the final
   linear diagram chase, not the geometric instantiation.

9. B5/cuspidal-boundary-criterion
   Identify the image of sections of the ACTUAL subcanonical twist with the
   kernel of restriction to the reduced relative boundary, and then with
   all the required constant-term conditions. Prove tensor exactness for M;
   node 11's change-of-coefficients sequence does not prove this boundary case.

10. B5/coefficient-naturality
   Construct the square G(a) o FJ_M = FJ_N o F(a) from the actual completion,
   Hodge identification and coefficient projections for every R-linear a.
   Keep full-stabilizer equivariance and transport under coefficient isomorphism.

11. B5/coefficient-sequence-exact
   X is R-flat and the Hodge sheaf is locally free over O_X. Thus it is R-flat.
   For 0 -> N -> M -> Q -> 0, obtain 0 -> F(N) -> F(M) -> F(Q) left exact
   by the actual sheaf tensor, atlas descent and global sections. No last epi.

12. B5/fj-target-left-exact
   Prove the corresponding row for actual coefficient sheaves on R-flat
   abelian torsors, then products and invariants. Invariant lifts are unique
   because the first coefficient map is injective. Do not use averaging or
   claim that invariants preserve the final surjection.

13. B5/fj-injectivity-cyclic
   For each prime p of R, including zero, work on the actual reduced model
   X_(R/p). Zero coefficients imply zero completed sections, then zero germs
   by finite-stalk Krull intersection, then global zero by componentwise density
   and reducedness. State residue-fiber component detection explicitly and
   prove the flat-atlas passage; do not assume every affine chart meets a cusp.
   AF(k,R/p) = Gamma(X_(R/p),omega^k) is a closed-base-change SHEAF comparison,
   not an arbitrary global-section tensor/base-change isomorphism.

14. B5/fj-injectivity-extension
   Form the morphism of actual ModuleCat short complexes from nodes 10-12 and
   apply ShortComplex.mono_τ₂_of_exact_of_mono. There is no new generic
   middle-injectivity theorem to implement. The abstract example above checks
   only this intended signature; the FJ-specific diagram remains to construct.

15. B5/fj-injectivity-finite
   Apply the EXISTING pinned Mathlib induction theorem
   IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime.
   Its filtration supplier is exists_relSeries_isQuotientEquivQuotientPrime.
   Prove the zero case on actual sections; transport node 13 through the
   prime-case linear equivalence using node 10; use node 14 on each exact
   coefficient sequence. The coefficient quotient is onto, but its induced
   section map need not be. This needs no generic R03.3 request and includes
   R/p^n and nonfree finite projectives. The algebraic examples above do not
   provide the missing FJ carrier or discharge those geometric cases.

Not included: the generic geometric Hecke action, arithmetic normalization,
non-neat Hecke descent, general Levi-valued coefficients, ramified Hilbert
models, and the comparison with analytic qExpansion. These remain genuine
B5 tasks and are not consequences of the prototypes in this file.
-/
