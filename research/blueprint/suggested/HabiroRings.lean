import Mathlib.Algebra.Category.Ring.Constructions
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Algebra.Colimit.Ring
import Mathlib.Algebra.MvPolynomial.Expand
import Mathlib.Algebra.Polynomial.Expand
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Analysis.SpecialFunctions.Complex.Circle
import Mathlib.CategoryTheory.Functor.Basic
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.NumberTheory.Divisors
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.Discriminant.Different
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.AdicCompletion.RingHom
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Flat.TorsionFree
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Roots
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.RingHom.Etale
import Mathlib.RingTheory.RingHom.FaithfullyFlat
import Mathlib.RingTheory.RingHom.Flat
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.Smooth.AdicCompletion
import Mathlib.RingTheory.Smooth.Fiber
import Mathlib.RingTheory.Spectrum.Prime.Basic
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.Unramified.Basic
import Mathlib.RingTheory.Unramified.Locus
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.Verschiebung
import TauCeti.RingTheory.Cyclotomic.Lift

/-!
# Suggested Lean forms for `HabiroRings` (stages HR.1–HR.7, with HR.5-number-field-comparison)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroRings.md` is definitive. The statements below suggest Lean forms
so that contributors and reviewers converge on names and signatures; they claim no
implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` against Mathlib `082e2d3` (the `lake env` paths of a project pinned to it) and
the imported `TauCeti.RingTheory.Cyclotomic` modules built from the pinned `f790474` sources onto
`LEAN_PATH`; the only warnings are uses of `sorry`.

## Pinned conventions

* **Λ-rings** are in torsion-free Adams form: a torsion-free commutative ring with ring
  endomorphisms `ψ^m`, `m ≥ 1`, with `ψ^1 = id`, `ψ^{mn} = ψ^m ∘ ψ^n` and the Frobenius congruence
  `ψ^p(x) ≡ x^p mod p` — **not** `ψ^p ≡ id mod p`, which excludes the toric `ℤ[x]`
  (`LambdaRing`, test `LambdaRing.toric_congruence`). "Λ-ring" is the arithmetic λ-ring, never an
  Iwasawa algebra. Levels `m` and the indices of the Adams operations are positive integers `ℕ+`.
* **The Habiro ring** of `A` is `lim_m A[q]^∧_{(q^m - 1)}` over the positive integers ordered by
  divisibility, equivalently `lim_N A[q]/((q;q)_N)`; completion is not inverting the `q^m - 1`.
  Its ring-level carrier is the stand-in `HabiroRing A = CycloCompletion A Set.univ` of
  `HabiroCyclotomicCompletions:HC.1`.
* **`H_{R/A}`** is defined only for `R` étale over a perfectly covered Λ-ring `A`
  (`HabiroRings.relativeHabiro`); perfect covering is a hypothesis, never automatic. The
  transitions `H_{R/A,m} → H_{R/A,d}` deform the q-Witt **Frobenius** `F_{m/d}`; no interface names a
  restriction operator on q-Witt vectors (there is none: `QWittVector.no_restriction_map`).
* **Numbering**: statements of the q-Witt paper follow arXiv:2410.23078**v5** (for example
  Lemma 2.46, Proposition 2.48, Corollaries 2.51 and 2.52; v4's numbering differs), and those of
  Wagner's q-Hodge paper follow arXiv:2510.04782**v2**.
* The coefficient algebras of the Taylor factors are the full `(R ⊗_{A,ψ^m} A)[x]/Φ_m(x)`, never a
  quotient through one embedding of `ζ_m`; `Φ_m` is separable, not irreducible, modulo `ℓ ∤ m`
  (`phi_five_over_f_eleven`).

## Library declarations imported and reused

* Tau Ceti: `TauCeti.Cyclotomic` and `TauCeti.Cyclotomic.conjugateResiduesRingHom`
  (`TauCeti/RingTheory/Cyclotomic/Basic.lean`, `Lift.lean`), in `phi_five_over_f_eleven`; the
  surjectivity clause there is `TauCeti.Cyclotomic.conjugateResidues_lift`.
* Mathlib, in signatures: `IsAddTorsionFree`; `MvPolynomial.expand` (the toric `ψ^m`);
  `Polynomial.cyclotomic`; `RingHom.FaithfullyFlat`, `RingHom.Flat`, `RingHom.Etale`,
  `Module.Basis`, `Module.Flat`; `Ring.DirectLimit` with `of` and `map` (the colimit perfection);
  `AddMonoidAlgebra.mapDomainRingHom`; `AdicCompletion` with `liftRingHom`, `evalₐ`, `evalOneₐ`;
  `Ideal.quotientMap`, `Ideal.Quotient.factor`, `Ideal.radical`, `PrimeSpectrum.zeroLocus`;
  `Algebra.Etale` (with `Algebra.Etale.baseChange` and the localisation instance);
  `Algebra.TensorProduct` (`lift`, `includeLeftRingHom`, `includeRight`, `lmul'`); `frobenius`,
  `CharP`; `LaurentPolynomial` (`T`, `eval₂`, `Polynomial.toLaurent`); `Localization`,
  `IsLocalization.mk'`, `IsLocalization.Away`; `Finsupp.linearCombination`, `Function.Exact`;
  `WittVector.ghostComponent`, `TruncatedWittVector` (`out`); `PowerSeries` (`map`, `C`, `X`,
  `constantCoeff`); `PadicInt` (`PadicInt.toZMod`), `ZMod`, `GaloisField`, `AdjoinRoot`,
  `GaussianInt`; `NumberField.RingOfIntegers`, `NumberField.discr`; `IsPrimitiveRoot`
  (`eq_pow_of_pow_eq_one`), `Complex.exp`; `RingHom.eqLocus` (whose universal property is
  `CommRingCat.equalizerForkIsLimit`), `RingHom.pi`, `Pi.evalRingHom`, `RingHom.codRestrict`,
  `Subring`, `Subalgebra`; `CommRing.Pic.mapAlgebra`; `CategoryTheory.Category`,
  `CategoryTheory.Functor`.
* Mathlib, as proof inputs named in docstrings (from the packet's baseline): the adic lifting
  lemmas `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` and
  `Algebra.FormallyUnramified.ext_of_iInf`, `IsAdicComplete.liftRingHom`,
  `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`, `Polynomial.cyclotomic.dvd_X_pow_sub_one`,
  `Polynomial.cyclotomic_prime_pow_eq_geom_sum`, `Polynomial.separable_cyclotomic`,
  `Polynomial.cyclotomic.irreducible_rat`, `Ideal.quotientInfRingEquivPiQuotient`,
  `Algebra.FormallyEtale.iff_comp_bijective`, `Algebra.Etale.of_isLocalizationAway`,
  `Algebra.Etale.of_formallyUnramified_of_flat`, `Algebra.formallyUnramified_iff_forall`,
  `IsDedekindDomain.flat_iff_torsion_eq_bot`, `NumberField.not_dvd_discr_iff_isUnramifiedIn`, and
  the scheme-theoretic inputs of the relative Frobenius lemma.

## Stand-ins, helpers and omissions

Λ-rings, big Witt vectors, q-Witt vectors, the relative Habiro rings and the Taylor presentation
are in neither library; they are planned by this roadmap and defined here honestly:

* `LambdaRing` is a real structure (the congruence is a field), with real `delta`, `IsPerfect`,
  `IsPerfectlyCovered`, `trivialInt`, `toric` and the colimit perfection as a `Ring.DirectLimit`.
* `BigWittVector S R` has the real carrier `R^S`, real ghost maps, restrictions, Teichmüller lifts
  and functoriality; its ring structure (Dwork's lemma) is a `sorry` instance whose construction is
  `HabiroRings:HR.4/truncated-big-witt-vectors`'s work. `QWittVector R m` is the honest quotient
  `W_m(R)[q]/I_m` of q-Witt Lemma 2.9, and `RelQWittVector Λ R m` the honest quotient of
  `q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m - 1)` of Lemma 2.41.
* `RelHabiroStage` is the ordinary ring of glued families `(x_d)_{d ∣ m}` in
  `∏ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}` (the ordinary limit over the poset of Corollary 2.4, which is
  the whole `E∞`-algebra by the staticity of Theorem 2.9), and `HabiroRings.relativeHabiro` the
  ordinary limit of these along the transitions; ring-level statements are made about them.
* Stand-ins for other roadmaps: `IsPDerivation` for the δ-rings of `PrismaticCohomology:PR.0`;
  `factorialPoly`, `cycloIndex`, `CycloCompletion`, `HabiroRing`, `kontsevichSeries` for
  `HabiroCyclotomicCompletions:HC.1`, named as that roadmap's suggested file names them.
* Maps whose construction is a node's work (Frobenius lifts, gluings, Frobenius and Verschiebung
  operators, comparison and completion isomorphisms) are `def`s with `sorry` bodies over the real
  carriers, each characterised by the theorems that follow it.

Derived ∞-categories, Habiro-completeness and Habiro completion of complexes, `E∞`-algebras,
solid spectra, `K_3` and the Habiro–Hodge complex are in neither library. A statement that needs
them is left out, and a comment `<name>: not stated here; needs … (supplier: …)` records it in
place; where a test has an honest ring-level part, that part is stated and the rest is recorded
the same way. Every packet name appears in this file. Unit tests are `example`s preceded by
`-- test <name> (<kind>)`.
-/

noncomputable section

open Polynomial CategoryTheory
open scoped TensorProduct

namespace TauCeti.Habiro

universe u v w

/-! ## Prelude: helpers, and honest stand-ins for carriers other roadmaps own

The helpers below are real definitions. `Via f` is a type synonym that turns a ring map into an
algebra structure without clashing with existing instances; it is how the Frobenius twists
`R ⊗_{A,ψ^m} A` are formed. The stand-ins are documented with the node that owns the real object:
the `δ`-ring condition of `PrismaticCohomology:PR.0`, and the ordinary cyclotomic completions and
factorial polynomials of `HabiroCyclotomicCompletions:HC.1` (named as that roadmap's suggested
file names them, so that they can be replaced by imports). -/

section Prelude

/-- `B` regarded as an `A`-algebra through the ring map `f : A →+* B`. A type synonym, so that the
algebra structure never clashes with an existing `Algebra A B` (for instance `Algebra.id` when
`f = ψ^m`). `R ⊗[A] Via (ψ^m)` is the Frobenius twist `R ⊗_{A,ψ^m} A`. -/
@[nolint unusedArguments]
def Via {A : Type u} {B : Type v} [CommRing A] [CommRing B] (_f : A →+* B) : Type v := B

namespace Via

variable {A : Type u} {B : Type v} [CommRing A] [CommRing B] (f : A →+* B)

instance : CommRing (Via f) := inferInstanceAs (CommRing B)

instance : Algebra A (Via f) := f.toAlgebra

/-- The identity of `B`, read as a ring isomorphism `B ≃+* Via f`. -/
def equiv : B ≃+* Via f := RingEquiv.refl B

theorem algebraMap_eq : algebraMap A (Via f) = (equiv f).toRingHom.comp f := rfl

end Via

/-- The classical `p`-adic completion `R̂_p = lim_n R/p^n`. For the `p`-torsion-free rings of this
roadmap (Wagner 2.7) it is also the derived `p`-completion. -/
abbrev pCompletion (R : Type u) [CommRing R] (p : ℕ) : Type u :=
  AdicCompletion (Ideal.span {(p : R)}) R

/-- The map of adic completions induced by a ring map `g : R →+* S` with `I.map g ≤ J`
(a real definition, through `AdicCompletion.liftRingHom`). -/
def adicCompletionMap {R : Type u} {S : Type v} [CommRing R] [CommRing S] {I : Ideal R}
    {J : Ideal S} (g : R →+* S) (hg : I.map g ≤ J) :
    AdicCompletion I R →+* AdicCompletion J S :=
  AdicCompletion.liftRingHom J
    (fun n => (Ideal.quotientMap (I := I ^ n) (J ^ n) g
      (Ideal.map_le_iff_le_comap.1 ((Ideal.map_pow g I n).trans_le
        (Ideal.pow_right_mono hg n)))).comp (AdicCompletion.evalₐ I n).toRingHom)
    (fun _ => sorry)

/-- The map `ĝ_p : R̂_p → Ŝ_p` of `p`-adic completions induced by a ring map `g`. -/
def pCompletionMap {R : Type u} {S : Type v} [CommRing R] [CommRing S] (g : R →+* S) (p : ℕ) :
    pCompletion R p →+* pCompletion S p :=
  adicCompletionMap g (by rw [Ideal.map_span, Set.image_singleton, map_natCast])

/-- `ℕ+` ordered by divisibility: the index category of the colimit perfection. -/
def DivPNat : Type := ℕ+

/-- A positive integer as an index of `DivPNat`. -/
def DivPNat.of (m : ℕ+) : DivPNat := m

/-- The positive integer underlying an index of `DivPNat`. -/
def DivPNat.val (a : DivPNat) : ℕ+ := a

instance : Preorder DivPNat where
  le a b := (a.val : ℕ) ∣ (b.val : ℕ)
  le_refl _ := dvd_refl _
  le_trans _ _ _ := dvd_trans

/-- The quotient `m / d` of positive integers with `d ∣ m`, as a positive integer. -/
def pnatDiv (m d : ℕ+) (h : (d : ℕ) ∣ m) : ℕ+ :=
  ⟨(m : ℕ) / d, Nat.div_pos (Nat.le_of_dvd m.pos h) d.pos⟩

/-- Stand-in for the `δ`-rings of `PrismaticCohomology:PR.0`: `δ : B → B` is a `p`-derivation,
`δ(0) = δ(1) = 0`, `δ(x + y) = δ(x) + δ(y) - ∑_{0<i<p} (C(p,i)/p) xⁱ y^{p-i}` and
`δ(xy) = xᵖ δ(y) + yᵖ δ(x) + p δ(x) δ(y)`. Then `x ↦ xᵖ + p δ(x)` is a Frobenius lift. This is a
real condition, not a placeholder; the δ-ring structure and its equivalence with Frobenius lifts
on `p`-torsion-free rings are PR.0's. -/
structure IsPDerivation {B : Type u} [CommRing B] (p : ℕ) (δ : B → B) : Prop where
  map_zero : δ 0 = 0
  map_one : δ 1 = 0
  map_add : ∀ x y, δ (x + y) =
    δ x + δ y - ∑ i ∈ Finset.Ioo 0 p, ((p.choose i / p : ℕ) : B) * x ^ i * y ^ (p - i)
  map_mul : ∀ x y, δ (x * y) = x ^ p * δ y + y ^ p * δ x + p * δ x * δ y

/-! ### Stand-ins for `HabiroCyclotomicCompletions:HC.1`

The ordinary cyclotomic completion `R[q]^S = lim_{f ∈ Φ*_S} R[q]/(f)` and the factorial
polynomials are HC.1's (nodes `HC.1/the-cyclotomic-completion`, `HC.1/the-factorial-polynomials`).
They are defined here exactly as that roadmap's suggested file defines them, as the compatible
families in the product of the finite quotients; `HabiroRing R = R[q]^ℕ` is Habiro's ring for
`R = ℤ`. -/

/-- Stand-in for `HC.1/the-factorial-polynomials`: `(q;q)_N = ∏_{i=1}^N (1 - qⁱ)`. -/
def factorialPoly (R : Type u) [CommRing R] (N : ℕ) : R[X] :=
  ∏ i ∈ Finset.Icc 1 N, (1 - X ^ i)

/-- Stand-in for HC.1's index monoid `Φ*_S`, generated by the `Φ_n`, `n ∈ S`. -/
def cycloIndex (R : Type u) [CommRing R] (S : Set ℕ) : Submonoid R[X] :=
  Submonoid.closure ((fun n => cyclotomic n R) '' S)

/-- The compatible families in `∏_{f ∈ Φ*_S} R[q]/(f)`. -/
def compatSubalgebra (R : Type u) [CommRing R] (S : Set ℕ) :
    Subalgebra R[X] (∀ f : cycloIndex R S, R[X] ⧸ Ideal.span {(f : R[X])}) where
  carrier := {x | ∀ (f g : cycloIndex R S) (h : (f : R[X]) ∣ (g : R[X])),
    Ideal.Quotient.factor (Ideal.span_singleton_le_span_singleton.mpr h) (x g) = x f}
  mul_mem' := sorry
  add_mem' := sorry
  algebraMap_mem' := sorry

/-- Stand-in for `HC.1/the-cyclotomic-completion`: Habiro's `R[q]^S`, an `R[q]`-algebra (the type
of compatible families, with the ring structure of the subalgebra). -/
def CycloCompletion (R : Type u) [CommRing R] (S : Set ℕ) : Type u :=
  ↥(compatSubalgebra R S)

instance (R : Type u) [CommRing R] (S : Set ℕ) : CommRing (CycloCompletion R S) :=
  inferInstanceAs (CommRing ↥(compatSubalgebra R S))

instance (R : Type u) [CommRing R] (S : Set ℕ) : Algebra R[X] (CycloCompletion R S) :=
  inferInstanceAs (Algebra R[X] ↥(compatSubalgebra R S))

/-- Habiro's ring `R[q]^ℕ = lim_m R[q]^∧_{(q^m-1)}` (stand-in for HC.1's `HabiroRing`). For
`R = ℤ` it is `H = lim_N ℤ[q]/((q;q)_N)`. -/
abbrev HabiroRing (R : Type u) [CommRing R] : Type u := CycloCompletion R Set.univ

namespace CycloCompletion

variable (R : Type u) [CommRing R] (S : Set ℕ)

/-- The map `ι : R[q] → R[q]^S`. -/
abbrev fromPoly : R[X] →+* CycloCompletion R S := algebraMap R[X] (CycloCompletion R S)

/-- The projection `R[q]^S → R[q]/(f)`, `f ∈ Φ*_S`. -/
def proj (f : cycloIndex R S) : CycloCompletion R S →+* R[X] ⧸ Ideal.span {(f : R[X])} :=
  (Pi.evalRingHom (fun g : cycloIndex R S => R[X] ⧸ Ideal.span {(g : R[X])}) f).comp
    (compatSubalgebra R S).val.toRingHom

/-- The restriction `R[q]^S → R[q]^{S'}` for `S' ⊆ S` (HC.1's `restrict`). -/
def restrict {S' : Set ℕ} (_h : S' ⊆ S) : CycloCompletion R S →+* CycloCompletion R S' := sorry

/-- Functoriality in the coefficient ring (HC.1's `mapRing`). -/
def mapRing {R' : Type v} [CommRing R'] (φ : R →+* R') :
    CycloCompletion R S →+* CycloCompletion R' S := sorry

end CycloCompletion

/-- The product `∏_{i=1}^N (qⁱ - 1) = (-1)^N (q;q)_N`, which lies in the index monoid `Φ*_ℕ`. -/
def factorialIndex (R : Type u) [CommRing R] (N : ℕ) : cycloIndex R Set.univ :=
  ⟨∏ i ∈ Finset.Icc 1 N, (X ^ i - 1), sorry⟩

/-- Kontsevich's element `∑_{n ≥ 0} (q;q)_n` of Habiro's ring (HC.1's `kontsevichSeries`):
its image modulo `(q;q)_N` is the finite sum `∑_{n < N} (q;q)_n` (`kontsevichSeries_proj`). -/
def kontsevichSeries : HabiroRing ℤ := sorry

theorem kontsevichSeries_proj (N : ℕ) :
    CycloCompletion.proj ℤ Set.univ (factorialIndex ℤ N) kontsevichSeries =
      Ideal.Quotient.mk _ (∑ n ∈ Finset.range N, factorialPoly ℤ n) := by
  sorry

/-- The test ring `ℤ[i][1/2] = O_F[1/disc F]` for `F = ℚ(i)` (étale over `ℤ`). -/
abbrev GaussianHalf : Type := Localization.Away (2 : GaussianInt)

/-- The test ring `ℤ[∛2][1/6] = O_F[1/disc F]` for `F = ℚ(∛2)`, `disc F = -108` (étale over `ℤ`),
presented as `(ℤ[x]/(x^3 - 2))[1/6]`. -/
abbrev CubeRootTwo : Type := Localization.Away (6 : AdjoinRoot (X ^ 3 - C 2 : ℤ[X]))

end Prelude

/-! ## HR.1 — Λ-rings, perfect covering, pairs and the local Frobenius -/

/-! ### `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`

Pinned convention: a Λ-ring is torsion free and carries ring endomorphisms `ψ^m` (`m ≥ 1`) with
`ψ^1 = id`, `ψ^{mn} = ψ^m ∘ ψ^n` and the Frobenius congruence `ψ^p(x) ≡ x^p mod p` — never
`ψ^p ≡ id mod p`. "Λ-ring" is the arithmetic λ-ring, not an Iwasawa algebra. -/

/-- `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`: a Λ-structure on a torsion-free
commutative ring `A`, in Adams form. `adams` is a monoid map `ℕ+ →* (A →+* A)` for composition,
so `ψ^1 = id` and `ψ^{mn} = ψ^m ∘ ψ^n` are `map_one` and `map_mul`. -/
structure LambdaRing (A : Type u) [CommRing A] where
  /-- The Adams operations `ψ^m`, `m ≥ 1`. -/
  adams : ℕ+ →* (A →+* A)
  /-- `A` is torsion free as an abelian group (the stage text's standing hypothesis). -/
  isAddTorsionFree : IsAddTorsionFree A
  /-- The Frobenius congruence: `ψ^p(x) - x^p ∈ pA` for every prime `p` (it replaces the former
  `frobCongruence`). -/
  adams_prime_sub_pow_mem : ∀ (p : ℕ+), (p : ℕ).Prime → ∀ x : A,
    adams p x - x ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : A)}

namespace LambdaRing

variable {A : Type u} [CommRing A] (Λ : LambdaRing A)

@[simp] theorem adams_one : Λ.adams 1 = RingHom.id A := map_one Λ.adams

theorem adams_mul (m n : ℕ+) : Λ.adams (m * n) = (Λ.adams m).comp (Λ.adams n) :=
  map_mul Λ.adams m n

/-- Commutation, derived from `adams_mul` and `mn = nm`. -/
theorem adams_comm (m n : ℕ+) :
    (Λ.adams m).comp (Λ.adams n) = (Λ.adams n).comp (Λ.adams m) := by
  sorry

/-- `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations` (`LambdaRing.Hom`): a Λ-map is
a ring map commuting with every `ψ^m`. -/
structure Hom {B : Type v} [CommRing B] (ΛA : LambdaRing A) (ΛB : LambdaRing B)
    extends A →+* B where
  comm_adams : ∀ m : ℕ+, toRingHom.comp (ΛA.adams m) = (ΛB.adams m).comp toRingHom

instance {B : Type v} [CommRing B] (ΛB : LambdaRing B) : CoeFun (Λ.Hom ΛB) (fun _ => A → B) :=
  ⟨fun f => f.toRingHom⟩

/-- The identity Λ-map. -/
def Hom.id : Λ.Hom Λ where
  toRingHom := RingHom.id A
  comm_adams _ := rfl

/-- Composition of Λ-maps. -/
def Hom.comp {B : Type v} {C : Type w} [CommRing B] [CommRing C] {ΛB : LambdaRing B}
    {ΛC : LambdaRing C} (g : ΛB.Hom ΛC) (f : Λ.Hom ΛB) : Λ.Hom ΛC where
  toRingHom := g.toRingHom.comp f.toRingHom
  comm_adams _ := sorry

/-- `δ_p(x) = (ψ^p(x) - x^p)/p`, well defined by torsion freeness (a real definition: the quotient
exists by the Frobenius congruence and is unique because `A` is torsion free). -/
def delta (p : ℕ+) (hp : (p : ℕ).Prime) (x : A) : A :=
  (Ideal.mem_span_singleton'.mp (Λ.adams_prime_sub_pow_mem p hp x)).choose

/-- `δ_p` is a `p`-derivation, so `A` is a δ-ring at `p` with Frobenius `ψ^p` (the δ-ring
interface of `PrismaticCohomology:PR.0`, through the stand-in `IsPDerivation`), and Λ-maps are
δ-maps. -/
theorem toDeltaRing (p : ℕ+) (hp : (p : ℕ).Prime) :
    IsPDerivation p (Λ.delta p hp) ∧
      (∀ x, Λ.adams p x = x ^ (p : ℕ) + (p : A) * Λ.delta p hp x) ∧
      ∀ {B : Type v} [CommRing B] (ΛB : LambdaRing B) (f : Λ.Hom ΛB) (x : A),
        f (Λ.delta p hp x) = ΛB.delta p hp (f x) := by
  sorry

/-- A Λ-ring is perfect when every `ψ^p` (equivalently every `ψ^m`) is bijective. -/
def IsPerfect : Prop :=
  ∀ p : ℕ+, (p : ℕ).Prime → Function.Bijective (Λ.adams p)

/-- `ℤ` with every `ψ^m` the identity (Fermat: `n^p ≡ n mod p`). -/
def trivialInt : LambdaRing ℤ where
  adams := 1
  isAddTorsionFree := inferInstance
  adams_prime_sub_pow_mem := sorry

/-- `ℚ` with every `ψ^m` the identity; the congruence is vacuous because `pℚ = ℚ` (a helper for
the test `LambdaRing.rat_isPerfect`). -/
def trivialRat : LambdaRing ℚ where
  adams := 1
  isAddTorsionFree := inferInstance
  adams_prime_sub_pow_mem := sorry

/-- The toric Λ-structure on `ℤ[x_i | i ∈ I]`: `ψ^m = MvPolynomial.expand m`, `ψ^m(x_i) = x_i^m`
(the source's `λ^n(x_i) = 0` for `n > 1`). -/
def toric (I : Type u) : LambdaRing (MvPolynomial I ℤ) where
  adams :=
    { toFun := fun m => (MvPolynomial.expand (m : ℕ)).toRingHom
      map_one' := sorry
      map_mul' := sorry }
  isAddTorsionFree := sorry
  adams_prime_sub_pow_mem := sorry

-- LambdaRing.toBigWitt: stated in the HR.4 section below, after the stand-in `BigWittVector`
-- (the structure map `s : A → W(A)` needs big Witt vectors and the Wilkerson comparison, gap
-- 'Λ-rings as big-Witt coalgebras versus the torsion-free Adams form, and big Witt vectors').

/-- The Frobenius twist `R ⊗_{A,ψ^m} A`, with `A` acting on the right factor through `ψ^m`. -/
abbrev twist (R : Type v) [CommRing R] [Algebra A R] (m : ℕ+) : Type (max v u) :=
  R ⊗[A] Via (Λ.adams m)

end LambdaRing

/-- The category `LambdaRingCat` of Λ-rings (torsion-free Adams form) and Λ-maps. -/
structure LambdaRingCat : Type (u + 1) where
  /-- The underlying type. -/
  carrier : Type u
  [commRing : CommRing carrier]
  /-- The Λ-structure. -/
  str : LambdaRing carrier

attribute [instance] LambdaRingCat.commRing

instance : CoeSort LambdaRingCat.{u} (Type u) := ⟨LambdaRingCat.carrier⟩

instance : Category LambdaRingCat.{u} where
  Hom A B := A.str.Hom B.str
  id A := LambdaRing.Hom.id A.str
  comp f g := LambdaRing.Hom.comp _ g f
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-! #### Unit tests for `LambdaRing` (on `ℤ[x] = MvPolynomial (Fin 1) ℤ`) -/

section LambdaRingTests

open MvPolynomial

-- test LambdaRing.toric_adams_computation (computation)
example : (LambdaRing.toric (Fin 1)).adams 2 (X 0 ^ 2 + 3 * X 0) = X 0 ^ 4 + 3 * X 0 ^ 2 ∧
    (LambdaRing.toric (Fin 1)).adams 2 ((LambdaRing.toric (Fin 1)).adams 3 (X 0)) = X 0 ^ 6 ∧
    (LambdaRing.toric (Fin 1)).adams 3 ((LambdaRing.toric (Fin 1)).adams 2 (X 0)) = X 0 ^ 6 ∧
    (LambdaRing.toric (Fin 1)).adams 6 (X 0) = X 0 ^ 6 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · simp [LambdaRing.toric, MvPolynomial.expand_X, map_ofNat, ← pow_mul]
  all_goals simp [LambdaRing.toric, MvPolynomial.expand_X, ← pow_mul]

-- test LambdaRing.toric_congruence (non-example)
/- The congruence `ψ^p(x) ≡ x^p` holds on the nose for the toric generator, while
`ψ^p(x) - x = x^p - x` is not divisible by `p` (its coefficient of `x` is `-1`): a definition with
`ψ^p ≡ id mod p` would exclude the toric example. -/
example (p : ℕ+) (hp : (p : ℕ).Prime) :
    (LambdaRing.toric (Fin 1)).adams p (X 0) - X 0 ^ (p : ℕ) = 0 ∧
      (LambdaRing.toric (Fin 1)).adams p (X 0) - X 0 ∉
        Ideal.span {((p : ℕ) : MvPolynomial (Fin 1) ℤ)} := by
  sorry

-- test LambdaRing.not_trivial_on_polynomials (non-example)
/- The identity operations on `ℤ[x]` are no Λ-structure: `ψ^2(x) - x^2 = x - x^2 ∉ 2ℤ[x]`. -/
example : ¬ ∃ Λ : LambdaRing (MvPolynomial (Fin 1) ℤ), ∀ m, Λ.adams m = RingHom.id _ := by
  sorry

example : (X 0 - X 0 ^ 2 : MvPolynomial (Fin 1) ℤ) ∉ Ideal.span {(2 : MvPolynomial (Fin 1) ℤ)} := by
  sorry

-- test LambdaRing.int_delta (degenerate)
example : LambdaRing.trivialInt.delta 2 Nat.prime_two 3 = -3 := by
  sorry

-- test LambdaRing.rat_isPerfect (degenerate)
example : LambdaRing.trivialRat.IsPerfect := by
  sorry

-- test LambdaRing.toric_toDeltaRing (compatibility)
example (p : ℕ+) (hp : (p : ℕ).Prime) : (LambdaRing.toric (Fin 1)).delta p hp (X 0) = 0 := by
  sorry

end LambdaRingTests

/-! ### `HabiroRings:HR.1/the-colimit-perfection` -/

namespace LambdaRing

variable {A : Type u} [CommRing A] (Λ : LambdaRing A)

/-- `HabiroRings:HR.1/the-colimit-perfection`: the colimit perfection `A_∞`, the colimit over `ℕ+`
ordered by divisibility of `m ↦ A`, with transition `ψ^{m/d}` for `d ∣ m` (a real definition,
through `Ring.DirectLimit`). The class of `x` in the copy at `m` behaves like `(ψ^m)⁻¹(x)`. -/
def colimPerfection : Type u :=
  Ring.DirectLimit (fun _ : DivPNat => A) (fun d m h => ⇑(Λ.adams (pnatDiv m.val d.val h)))

namespace colimPerfection

instance : CommRing Λ.colimPerfection :=
  inferInstanceAs (CommRing (Ring.DirectLimit (fun _ : DivPNat => A) _))

/-- The copy of `A` at the index `m`. -/
def stage (m : ℕ+) : A →+* Λ.colimPerfection :=
  Ring.DirectLimit.of (fun _ : DivPNat => A) _ (DivPNat.of m)

/-- The Λ-structure of `A_∞`: `ψ^n` is induced by `ψ^n` on every copy (a real definition of the
operations, through `Ring.DirectLimit.map`; the axioms are proof obligations). -/
def str : LambdaRing Λ.colimPerfection where
  adams :=
    { toFun := fun n => Ring.DirectLimit.map (fun _ => Λ.adams n) (fun _ _ _ => by
        rw [Λ.adams_comm])
      map_one' := sorry
      map_mul' := sorry }
  isAddTorsionFree := sorry
  adams_prime_sub_pow_mem := sorry

/-- The Λ-map `A → A_∞` from the copy at `m = 1`. -/
def of : Λ.Hom (str Λ) where
  toRingHom := stage Λ 1
  comm_adams := sorry

/-- `A_∞` is perfect. -/
theorem isPerfect : (str Λ).IsPerfect := by
  sorry

/-- The universal property: a Λ-map `f : A → B` to a perfect Λ-ring extends to `A_∞`, sending the
class of `x` at `m` to `(ψ_B^m)⁻¹(f x)`. -/
def lift {B : Type u} [CommRing B] {ΛB : LambdaRing B} (_f : Λ.Hom ΛB) (_hB : ΛB.IsPerfect) :
    (str Λ).Hom ΛB := sorry

theorem lift_comp_of {B : Type u} [CommRing B] {ΛB : LambdaRing B} (f : Λ.Hom ΛB)
    (hB : ΛB.IsPerfect) : (lift Λ f hB).toRingHom.comp (of Λ).toRingHom = f.toRingHom := by
  sorry

theorem lift_unique {B : Type u} [CommRing B] {ΛB : LambdaRing B} (f : Λ.Hom ΛB)
    (hB : ΛB.IsPerfect) (g : (str Λ).Hom ΛB)
    (hg : g.toRingHom.comp (of Λ).toRingHom = f.toRingHom) : g.toRingHom = (lift Λ f hB).toRingHom := by
  sorry

/-- Functoriality `A_∞ → A'_∞` of a Λ-map (a real definition, through `Ring.DirectLimit.map`). -/
def map {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} (f : Λ.Hom Λ') :
    (str Λ).Hom (str Λ') where
  toRingHom := Ring.DirectLimit.map (fun _ => f.toRingHom) (fun _ _ _ => by rw [f.comm_adams])
  comm_adams := sorry

theorem map_id : (map Λ (Hom.id Λ)).toRingHom = RingHom.id _ := by
  sorry

theorem map_comp {A' A'' : Type u} [CommRing A'] [CommRing A''] {Λ' : LambdaRing A'}
    {Λ'' : LambdaRing A''} (f : Λ.Hom Λ') (g : Λ'.Hom Λ'') :
    (map Λ (g.comp Λ f)).toRingHom = (map Λ' g).toRingHom.comp (map Λ f).toRingHom := by
  sorry

end colimPerfection

end LambdaRing

/-- The perfect toric Λ-ring `ℤ[x^a | a ∈ ℚ_{≥0}]`, the monoid algebra of `ℚ_{≥0}`, with
`ψ^m(x^a) = x^{ma}` (a helper for the colimit-perfection tests; a real definition of the operations
through `AddMonoidAlgebra.mapDomainRingHom`). -/
def LambdaRing.perfectToric : LambdaRing (AddMonoidAlgebra ℤ NNRat) where
  adams :=
    { toFun := fun m => AddMonoidAlgebra.mapDomainRingHom ℤ (AddMonoidHom.mulLeft ((m : ℕ) : NNRat))
      map_one' := sorry
      map_mul' := sorry }
  isAddTorsionFree := sorry
  adams_prime_sub_pow_mem := sorry

/-- The toric Λ-map `ℤ[x] → ℤ[x^a | a ∈ ℚ_{≥0}]`, `x ↦ x^1` (test helper). -/
def LambdaRing.toricToPerfect : (LambdaRing.toric (Fin 1)).Hom LambdaRing.perfectToric where
  toRingHom := (MvPolynomial.aeval (fun _ => AddMonoidAlgebra.single (1 : NNRat) (1 : ℤ))).toRingHom
  comm_adams := sorry

section ColimPerfectionTests

open MvPolynomial

-- test LambdaRing.colimPerfection_toric (computation)
/- `A_∞ ≅ ℤ[x^a | a ∈ ℚ_{≥0}]` for toric `ℤ[x]`, with `ψ^m(x^a) = x^{ma}`; the class of `x` at
stage `m` is `x^{1/m}`. -/
example : ∃ e : (LambdaRing.toric (Fin 1)).colimPerfection ≃+* AddMonoidAlgebra ℤ NNRat,
    (∀ m : ℕ+, e (LambdaRing.colimPerfection.stage _ m (X 0)) =
      AddMonoidAlgebra.single (1 / (m : NNRat)) 1) ∧
    ∀ (m : ℕ+) (y : (LambdaRing.toric (Fin 1)).colimPerfection),
      e ((LambdaRing.colimPerfection.str _).adams m y) = LambdaRing.perfectToric.adams m (e y) := by
  sorry

-- test LambdaRing.colimPerfection_of_isPerfect (degenerate)
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (h : Λ.IsPerfect) :
    Function.Bijective (LambdaRing.colimPerfection.of Λ).toRingHom := by
  sorry

example : Function.Bijective (LambdaRing.colimPerfection.of LambdaRing.trivialInt).toRingHom ∧
    Function.Bijective (LambdaRing.colimPerfection.of LambdaRing.trivialRat).toRingHom := by
  sorry

-- test LambdaRing.colimPerfection_lift_apply (characterisation)
example (h : LambdaRing.perfectToric.IsPerfect) (m : ℕ+) (k : ℕ) :
    LambdaRing.colimPerfection.lift _ LambdaRing.toricToPerfect h
        (LambdaRing.colimPerfection.stage _ m (X 0 ^ k)) =
      AddMonoidAlgebra.single ((k : NNRat) / (m : NNRat)) 1 := by
  sorry

end ColimPerfectionTests

/-! ### `HabiroRings:HR.1/perfectly-covered` -/

namespace LambdaRing

variable {A : Type u} [CommRing A] (Λ : LambdaRing A)

/-- `HabiroRings:HR.1/perfectly-covered`: there is a faithfully flat Λ-map from `A` into a perfect
Λ-ring (Wagner 1.22(e)). A hypothesis, never automatic. -/
def IsPerfectlyCovered : Prop :=
  ∃ (B : Type u) (_ : CommRing B) (ΛB : LambdaRing B) (f : Λ.Hom ΛB),
    ΛB.IsPerfect ∧ f.toRingHom.FaithfullyFlat

/-- (i) ⇔ (ii): every Adams operation is faithfully flat. -/
theorem isPerfectlyCovered_iff_faithfullyFlat_adams :
    Λ.IsPerfectlyCovered ↔ ∀ m : ℕ+, (Λ.adams m).FaithfullyFlat := by
  sorry

/-- (i) ⇔ (iii): `A → A_∞` is faithfully flat (the q-Witt paper's definition, Remark 2.47). -/
theorem isPerfectlyCovered_iff_faithfullyFlat_colimPerfection :
    Λ.IsPerfectlyCovered ↔ (colimPerfection.of Λ).toRingHom.FaithfullyFlat := by
  sorry

theorem IsPerfect.isPerfectlyCovered {Λ : LambdaRing A} (h : Λ.IsPerfect) :
    Λ.IsPerfectlyCovered := by
  sorry

theorem isPerfectlyCovered_int : trivialInt.IsPerfectlyCovered := by
  sorry

theorem isPerfectlyCovered_toric (I : Type u) : (toric I).IsPerfectlyCovered := by
  sorry

/-- The toric Λ-structure on `ℤ[x,y]/(xy)`, `ψ^m(x) = x^m`, `ψ^m(y) = y^m` (the Λ-quotient of toric
`ℤ[x,y]`; a helper for `not_isPerfectlyCovered_toric_xy`, with the operations induced by
`MvPolynomial.expand` through `Ideal.quotientMap`). -/
def toricXY : LambdaRing (MvPolynomial (Fin 2) ℤ ⧸
    Ideal.span {(MvPolynomial.X 0 * MvPolynomial.X 1 : MvPolynomial (Fin 2) ℤ)}) where
  adams :=
    { toFun := fun m => Ideal.quotientMap _ (MvPolynomial.expand (m : ℕ)).toRingHom sorry
      map_one' := sorry
      map_mul' := sorry }
  isAddTorsionFree := sorry
  adams_prime_sub_pow_mem := sorry

theorem not_isPerfectlyCovered_toric_xy : ¬ toricXY.IsPerfectlyCovered := by
  sorry

-- LambdaRing.IsPerfectlyCovered.adicCompletion_static: not stated here; needs the derived
-- p-completion of a module and its comparison with `AdicCompletion` under bounded torsion
-- (supplier: DerivedDeRhamCohomology:DD.1). Its classical input — that `R ⊗_{A,ψ^m} A` is
-- p-torsion free for R flat over A — is the statement DD.1's criterion is applied to.

end LambdaRing

section PerfectlyCoveredTests

open MvPolynomial

-- test LambdaRing.isPerfectlyCovered_int (degenerate)
example : LambdaRing.trivialInt.IsPerfectlyCovered := LambdaRing.isPerfectlyCovered_int

-- test LambdaRing.toric_free_over_adams (computation)
/- `ℤ[x]` is free over `ψ^2(ℤ[x]) = ℤ[x^2]` with basis `{1, x}`; for example
`x^3 + 5x^2 + 1 = x·x^2 + (5x^2 + 1)·1`. -/
example : ∃ b : Module.Basis (Fin 2) (MvPolynomial (Fin 1) ℤ)
      (Via ((LambdaRing.toric (Fin 1)).adams 2)),
    b 0 = Via.equiv _ 1 ∧ b 1 = Via.equiv _ (X 0) := by
  sorry

example : (X 0 ^ 3 + 5 * X 0 ^ 2 + 1 : MvPolynomial (Fin 1) ℤ) =
    X 0 * (LambdaRing.toric (Fin 1)).adams 2 (X 0) +
      (LambdaRing.toric (Fin 1)).adams 2 (5 * X 0 + 1) := by
  sorry

-- test LambdaRing.toric_colimPerfection_free (characterisation)
/- `A → A_∞ = ℤ[x^a | a ∈ ℚ_{≥0}]` is free, with basis the `x^a`, `0 ≤ a < 1`. -/
example : ∃ (e : (LambdaRing.toric (Fin 1)).colimPerfection ≃+* AddMonoidAlgebra ℤ NNRat)
    (b : Module.Basis {a : NNRat // a < 1} (MvPolynomial (Fin 1) ℤ)
      (Via (LambdaRing.colimPerfection.of (LambdaRing.toric (Fin 1))).toRingHom)),
    ∀ a, e ((Via.equiv _).symm (b a)) = AddMonoidAlgebra.single (a : NNRat) 1 := by
  sorry

-- test LambdaRing.not_isPerfectlyCovered_toric_xy (non-example)
/- Every `ψ^m` of `ℤ[x,y]/(xy)` is injective, yet `ψ^2` is not flat: a definition requiring only
injectivity would accept it. -/
example : ¬ LambdaRing.toricXY.IsPerfectlyCovered ∧
    (∀ m, Function.Injective (LambdaRing.toricXY.adams m)) ∧
    ¬ (LambdaRing.toricXY.adams 2).Flat := by
  sorry

end PerfectlyCoveredTests

/-! ### `HabiroRings:HR.1/morphisms-of-pairs` -/

/-- `HabiroRings:HR.1/morphisms-of-pairs`: an étale pair `(A, R)`, a perfectly covered Λ-ring `A`
with an étale `A`-algebra `R`. `R` carries no Adams operations. -/
structure EtalePair : Type (u + 1) where
  /-- The base. -/
  A : Type u
  [commRingA : CommRing A]
  /-- The Λ-structure of the base. -/
  lambda : LambdaRing A
  /-- The base is perfectly covered. -/
  isPerfectlyCovered : lambda.IsPerfectlyCovered
  /-- The étale algebra. -/
  R : Type u
  [commRingR : CommRing R]
  [algebra : Algebra A R]
  [etale : Algebra.Etale A R]

attribute [instance] EtalePair.commRingA EtalePair.commRingR EtalePair.algebra EtalePair.etale

namespace EtalePair

/-- A morphism of pairs `(f, g)`: a Λ-map `f` of bases and a ring map `g` of algebras over it.
Compatibility of the completed maps with the Frobenius lifts is a theorem
(`frobLift_naturality`), not a condition. -/
@[ext]
structure Hom (P Q : EtalePair.{u}) where
  /-- The Λ-map on bases. -/
  base : P.lambda.Hom Q.lambda
  /-- The ring map on algebras. -/
  alg : P.R →+* Q.R
  comm : alg.comp (algebraMap P.A P.R) = (algebraMap Q.A Q.R).comp base.toRingHom

/-- The identity morphism of a pair. -/
def Hom.id (P : EtalePair.{u}) : Hom P P where
  base := LambdaRing.Hom.id P.lambda
  alg := RingHom.id P.R
  comm := rfl

/-- Composition of morphisms of pairs, componentwise. -/
def Hom.comp {P Q T : EtalePair.{u}} (F : Hom P Q) (G : Hom Q T) : Hom P T where
  base := G.base.comp _ F.base
  alg := G.alg.comp F.alg
  comm := sorry

instance instCategory : Category EtalePair.{u} where
  Hom := Hom
  id := Hom.id
  comp := Hom.comp
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The forgetful functor `(A, R) ↦ A` to Λ-rings. -/
def forget : EtalePair.{u} ⥤ LambdaRingCat.{u} where
  obj P := ⟨P.A, P.lambda⟩
  map F := F.base
  map_id := sorry
  map_comp := sorry

/-- Base change `(A, R) ↦ (A', A' ⊗_A R)` along a Λ-map `f : A → A'` to a perfectly covered `A'`
(`Algebra.Etale.baseChange`), for `f` the structure map of `Algebra P.A A'`. -/
def baseChange (P : EtalePair.{u}) (A' : Type u) [CommRing A'] [Algebra P.A A']
    (Λ' : LambdaRing A') (hΛ' : Λ'.IsPerfectlyCovered) (f : P.lambda.Hom Λ')
    (_hf : f.toRingHom = algebraMap P.A A') : EtalePair.{u} where
  A := A'
  lambda := Λ'
  isPerfectlyCovered := hΛ'
  R := A' ⊗[P.A] P.R

/-- The canonical morphism `(A, R) → (A', A' ⊗_A R)` of the base change. -/
def baseChange.hom (P : EtalePair.{u}) (A' : Type u) [CommRing A'] [Algebra P.A A']
    (Λ' : LambdaRing A') (hΛ' : Λ'.IsPerfectlyCovered) (f : P.lambda.Hom Λ')
    (hf : f.toRingHom = algebraMap P.A A') : P ⟶ baseChange P A' Λ' hΛ' f hf where
  base := f
  alg := Algebra.TensorProduct.includeRight.toRingHom
  comm := sorry

/-- The pair `(A, A)` of a perfectly covered Λ-ring (a helper for the tests). -/
def self (A : Type u) [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) :
    EtalePair.{u} where
  A := A
  lambda := Λ
  isPerfectlyCovered := hΛ
  R := A

end EtalePair

section EtalePairTests

open MvPolynomial

-- test EtalePair.not_hom_of_non_lambda (non-example)
/- On toric `ℤ[x]` the ring automorphism `x ↦ x + 1` is not a Λ-map:
`f(ψ^2 x) = x^2 + 2x + 1` but `ψ^2(f x) = x^2 + 1`; so `(f, f)` is no morphism of pairs. -/
example : (MvPolynomial.aeval (fun _ => X 0 + 1) : MvPolynomial (Fin 1) ℤ →ₐ[ℤ] MvPolynomial (Fin 1) ℤ)
      ((LambdaRing.toric (Fin 1)).adams 2 (X 0)) = X 0 ^ 2 + 2 * X 0 + 1 ∧
    (LambdaRing.toric (Fin 1)).adams 2 (MvPolynomial.aeval (fun _ => X 0 + 1) (X 0 : MvPolynomial (Fin 1) ℤ)) =
      X 0 ^ 2 + 1 ∧
    ¬ ∃ F : EtalePair.self (MvPolynomial (Fin 1) ℤ) (LambdaRing.toric (Fin 1))
        (LambdaRing.isPerfectlyCovered_toric (Fin 1)) ⟶
        EtalePair.self (MvPolynomial (Fin 1) ℤ) (LambdaRing.toric (Fin 1))
          (LambdaRing.isPerfectlyCovered_toric (Fin 1)),
      F.base.toRingHom = (MvPolynomial.aeval (fun _ => X 0 + 1)).toRingHom := by
  sorry

-- test EtalePair.hom_self (degenerate)
/- Morphisms `(A, A) → (A', A')` are exactly the Λ-maps `A → A'` (`g = f` is forced). -/
example {A A' : Type u} [CommRing A] [CommRing A'] (Λ : LambdaRing A) (Λ' : LambdaRing A')
    (hΛ : Λ.IsPerfectlyCovered) (hΛ' : Λ'.IsPerfectlyCovered) :
    Nonempty ((EtalePair.self A Λ hΛ ⟶ EtalePair.self A' Λ' hΛ') ≃ Λ.Hom Λ') ∧
      ∀ F : EtalePair.self A Λ hΛ ⟶ EtalePair.self A' Λ' hΛ', F.alg = F.base.toRingHom := by
  sorry

-- test EtalePair.conj_frobenius: stated after `frobLift` below.

-- test EtalePair.baseChange_toric (compatibility)
/- `(ℤ, ℤ[i][1/2]) → (ℤ[x], ℤ[x] ⊗ ℤ[i][1/2])` along `ℤ → toric ℤ[x]` is the base-change
morphism, and the base-changed algebra is `ℤ[i][1/2][x]`, with `r ↦ r` on constants. -/
example [Algebra.Etale ℤ GaussianHalf]
    (f : LambdaRing.trivialInt.Hom (LambdaRing.toric (Fin 1)))
    (hf : f.toRingHom = algebraMap ℤ (MvPolynomial (Fin 1) ℤ)) :
    let P : EtalePair.{0} :=
      { A := ℤ, lambda := LambdaRing.trivialInt,
        isPerfectlyCovered := LambdaRing.isPerfectlyCovered_int,
        R := GaussianHalf }
    ∃ e : (EtalePair.baseChange P (MvPolynomial (Fin 1) ℤ) (LambdaRing.toric (Fin 1))
        (LambdaRing.isPerfectlyCovered_toric (Fin 1)) f hf).R ≃+*
        MvPolynomial (Fin 1) GaussianHalf,
      ∀ r : P.R, e ((EtalePair.baseChange.hom P (MvPolynomial (Fin 1) ℤ) (LambdaRing.toric (Fin 1))
        (LambdaRing.isPerfectlyCovered_toric (Fin 1)) f hf).alg r) = MvPolynomial.C r := by
  sorry

end EtalePairTests

/-! ### `HabiroRings:HR.1/the-etale-frobenius-lift`

`R̂_p` is the classical `p`-adic completion; all rings here are `p`-torsion free, so it is the
derived one. `R` itself need not have a Frobenius lift (test `no_global_frobenius`). -/

section FrobeniusLift

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R] (p : ℕ+) (hp : (p : ℕ).Prime)

/-- `HabiroRings:HR.1/the-etale-frobenius-lift`: the Frobenius lift `φ_p : R̂_p → R̂_p`, the unique
ring endomorphism restricting to `ψ^p` on `A` and congruent to `x ↦ x^p` modulo `p`. -/
@[nolint unusedArguments]
def frobLift (Λ : LambdaRing A) (_hΛ : Λ.IsPerfectlyCovered) (R : Type v) [CommRing R]
    [Algebra A R] [Algebra.Etale A R] (p : ℕ+) (_hp : (p : ℕ).Prime) :
    pCompletion R p →+* pCompletion R p := sorry

@[simp] theorem frobLift_comp_algebraMap :
    (frobLift Λ hΛ R p hp).comp (algebraMap A (pCompletion R p)) =
      (algebraMap A (pCompletion R p)).comp (Λ.adams p) := by
  sorry

theorem frobLift_sub_pow_mem (x : pCompletion R p) :
    frobLift Λ hΛ R p hp x - x ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : pCompletion R p)} := by
  sorry

theorem frobLift_unique (φ : pCompletion R p →+* pCompletion R p)
    (h₁ : φ.comp (algebraMap A (pCompletion R p)) = (algebraMap A (pCompletion R p)).comp (Λ.adams p))
    (h₂ : ∀ x, φ x - x ^ (p : ℕ) ∈ Ideal.span {((p : ℕ) : pCompletion R p)}) :
    φ = frobLift Λ hΛ R p hp := by
  sorry

/-- `R̂_p` is a δ-ring with Frobenius `φ_p` (PR.0, through the stand-in `IsPDerivation`), and
`A → R̂_p` is a δ-map. -/
theorem frobLift_toDeltaRing :
    ∃ δ : pCompletion R p → pCompletion R p, IsPDerivation p δ ∧
      (∀ x, frobLift Λ hΛ R p hp x = x ^ (p : ℕ) + (p : pCompletion R p) * δ x) ∧
      ∀ a : A, δ (algebraMap A _ a) = algebraMap A _ (Λ.delta p hp a) := by
  sorry

/-- The completed twist `(R̂_p ⊗_{A,ψ^p} A)^∧_p`. -/
abbrev twistedCompletion : Type (max v u) :=
  pCompletion (Λ.twist (pCompletion R p) p) p

/-- The linearised Frobenius `φ_{p/A} : (R̂_p ⊗_{A,ψ^p} A)^∧_p → R̂_p`, `x ⊗ a ↦ φ_p(x)·a`. -/
@[nolint unusedArguments]
def linearisedFrob (Λ : LambdaRing A) (_hΛ : Λ.IsPerfectlyCovered) (R : Type v) [CommRing R]
    [Algebra A R] [Algebra.Etale A R] (p : ℕ+) (_hp : (p : ℕ).Prime) :
    twistedCompletion Λ R p →+* pCompletion R p := sorry

theorem linearisedFrob_tmul (x : pCompletion R p) (a : Via (Λ.adams p)) :
    linearisedFrob Λ hΛ R p hp (algebraMap _ _ (x ⊗ₜ[A] a : Λ.twist (pCompletion R p) p)) =
      frobLift Λ hΛ R p hp x * algebraMap A _ ((Via.equiv _).symm a) := by
  sorry

/-- The linearised Frobenius is an isomorphism (it replaces `linearisedFrob_equiv`). -/
theorem linearisedFrob_bijective : Function.Bijective (linearisedFrob Λ hΛ R p hp) := by
  sorry

/-- Naturality for a morphism of pairs `(f, g)`: `ĝ_p ∘ φ_p = φ'_p ∘ ĝ_p`. -/
theorem frobLift_naturality {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'}
    (hΛ' : Λ'.IsPerfectlyCovered) {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R']
    (f : Λ.Hom Λ') (g : R →+* R')
    (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) :
    (pCompletionMap g p).comp (frobLift Λ hΛ R p hp) =
      (frobLift Λ' hΛ' R' p hp).comp (pCompletionMap g p) := by
  sorry

/-- The canonical comparison `((R̂_p ⊗_{A,ψ^p} A)^∧_p ⊗_A A')^∧_p → (R'̂_p ⊗_{A',ψ'^p} A')^∧_p` for
`R' = A' ⊗_A R` (a helper for `linearisedFrob_baseChange`). -/
def twistedCompletionBaseChange {A' : Type u} [CommRing A'] [Algebra A A'] (Λ' : LambdaRing A') :
    pCompletion (A' ⊗[A] twistedCompletion Λ R p) p →+*
      twistedCompletion Λ' (A' ⊗[A] R) p := sorry

/-- The canonical comparison `(A' ⊗_A R̂_p)^∧_p → (A' ⊗_A R)^∧_p` (a helper for
`linearisedFrob_baseChange`). -/
def pCompletionBaseChange (A' : Type u) [CommRing A'] [Algebra A A'] :
    pCompletion (A' ⊗[A] pCompletion R p) p →+* pCompletion (A' ⊗[A] R) p := sorry

/-- Base change along a Λ-map `A → A'`: both canonical comparisons are isomorphisms, and under them
`φ_{p/A'}` for `R' = A' ⊗_A R` restricts to `φ_{p/A}` on `1 ⊗ (R̂_p ⊗_{A,ψ^p} A)^∧_p`; since
`φ_{p/A'}` is `A'`-linear, it is the completed base change of `φ_{p/A}`. -/
theorem linearisedFrob_baseChange {A' : Type u} [CommRing A'] [Algebra A A'] (Λ' : LambdaRing A')
    (hΛ' : Λ'.IsPerfectlyCovered) (f : Λ.Hom Λ') (_hf : f.toRingHom = algebraMap A A') :
    Function.Bijective (twistedCompletionBaseChange Λ R p Λ') ∧
      Function.Bijective (pCompletionBaseChange (A := A) R p A') ∧
      ∀ x : twistedCompletion Λ R p,
        linearisedFrob Λ' hΛ' (A' ⊗[A] R) p hp (twistedCompletionBaseChange Λ R p Λ'
            (algebraMap _ _ ((1 : A') ⊗ₜ[A] x))) =
          pCompletionBaseChange (A := A) R p A'
            (algebraMap _ _ ((1 : A') ⊗ₜ[A] linearisedFrob Λ hΛ R p hp x)) := by
  sorry

/-- The linearisation `(R̂_p ⊗_{A,ψ^{p^k}} A)^∧_p → R̂_p`, `x ⊗ a ↦ φ_p^k(x)·a`, of the iterate
(a helper for `frobLift_iterate`). -/
@[nolint unusedArguments]
def linearisedFrobPow (Λ : LambdaRing A) (_hΛ : Λ.IsPerfectlyCovered) (R : Type v) [CommRing R]
    [Algebra A R] [Algebra.Etale A R] (p : ℕ+) (_hp : (p : ℕ).Prime) (k : ℕ) :
    pCompletion (Λ.twist (pCompletion R p) (p ^ k)) p →+* pCompletion R p := sorry

/-- `φ_p^k` is the unique lift of `ψ^{p^k}`, and its linearisation, the composite of Frobenius twists
of `φ_{p/A}`, is an isomorphism (it replaces `linearisedFrob_iterate`). -/
theorem frobLift_iterate (k : ℕ) :
    (∀ φ : pCompletion R p →+* pCompletion R p,
      φ.comp (algebraMap A (pCompletion R p)) =
          (algebraMap A (pCompletion R p)).comp (Λ.adams (p ^ k)) →
        (∀ x, φ x - x ^ ((p : ℕ) ^ k) ∈ Ideal.span {((p : ℕ) : pCompletion R p)}) →
        φ = (frobLift Λ hΛ R p hp) ^ k) ∧
      Function.Bijective (linearisedFrobPow Λ hΛ R p hp k) := by
  sorry

/-- For `R = A`, `φ_p = ψ^p` on `Â_p`: the completion of `ψ^p`. -/
theorem frobLift_self [Algebra.Etale A A] :
    frobLift Λ hΛ A p hp = pCompletionMap (Λ.adams p) p := by
  sorry

end FrobeniusLift

section FrobeniusLiftTests

-- test frobLift_gaussian_inert (computation)
/- `A = ℤ`, `R = ℤ[i][1/2]`, `p = 3`: `φ_3(i) = -i`. -/
example [Algebra.Etale ℤ GaussianHalf] :
    frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        GaussianHalf 3 Nat.prime_three
        (algebraMap _ _ (algebraMap GaussianInt GaussianHalf ⟨0, 1⟩)) =
      -algebraMap _ _ (algebraMap GaussianInt GaussianHalf ⟨0, 1⟩) := by
  sorry

-- test frobLift_gaussian_split (computation)
/- Same `R`, `p = 5`: `x^2 + 1 ≡ (x + 2)(x - 2) mod 5`, `R̂_5 ≅ ℤ_5 × ℤ_5` and `φ_5 = id`. -/
example [Fact (Nat.Prime 5)] [Algebra.Etale ℤ GaussianHalf] :
    Nonempty (pCompletion GaussianHalf 5 ≃+* ℤ_[5] × ℤ_[5]) ∧
      frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        GaussianHalf 5 Nat.prime_five = RingHom.id _ := by
  sorry

-- test frobLift_self (degenerate)
/- `R = A`: `φ_p = ψ^p` on `Â_p`; for toric `ℤ[x]`, `φ_p(x) = x^p`. -/
example (p : ℕ+) (hp : (p : ℕ).Prime) :
    frobLift (LambdaRing.toric (Fin 1)) (LambdaRing.isPerfectlyCovered_toric (Fin 1))
        (MvPolynomial (Fin 1) ℤ) p hp
        (algebraMap (MvPolynomial (Fin 1) ℤ) (pCompletion (MvPolynomial (Fin 1) ℤ) p) (MvPolynomial.X 0)) =
      algebraMap (MvPolynomial (Fin 1) ℤ) (pCompletion (MvPolynomial (Fin 1) ℤ) p)
        (MvPolynomial.X 0 ^ (p : ℕ)) := by
  sorry

-- test no_global_frobenius (non-example)
/- `A = ℤ`, `R = ℤ[2^{1/3}, 1/6]`, étale over `ℤ`: its only ring endomorphism is the identity, which
is not a Frobenius lift at `5` (`R/5 ≅ 𝔽_5 × 𝔽_25`); yet `φ_5` exists on `R̂_5`. -/
example [Fact (Nat.Prime 5)]
    [Algebra.Etale ℤ CubeRootTwo] :
    (∀ g : CubeRootTwo →+*
        CubeRootTwo, g = RingHom.id _) ∧
      (¬ ∀ x : CubeRootTwo,
        x - x ^ 5 ∈ Ideal.span {(5 : CubeRootTwo)}) ∧
      Nonempty (pCompletion CubeRootTwo 5 ≃+*
        ℤ_[5] × WittVector 5 (GaloisField 5 2)) := by
  sorry

-- test EtalePair.conj_frobenius (characterisation)
/- Complex conjugation `σ` of `ℤ[i][1/2]` is a morphism `(ℤ, R) → (ℤ, R)`; its `3`-adic completion
commutes with `φ_3` without this being imposed (an instance of `frobLift_naturality`). -/
example [Algebra.Etale ℤ GaussianHalf]
    (σ : GaussianHalf →+* GaussianHalf)
    (hσ : ∀ z : GaussianInt, σ (algebraMap _ _ z) = algebraMap _ _ (star z)) :
    (pCompletionMap σ 3).comp (frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        GaussianHalf 3 Nat.prime_three) =
      (frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        GaussianHalf 3 Nat.prime_three).comp (pCompletionMap σ 3) := by
  sorry

end FrobeniusLiftTests

/-! ### `HabiroRings:HR.1/relative-frobenius-of-an-etale-algebra` -/

/-- The relative Frobenius `F_{B/A} : B ⊗_{A,Frob_A} A → B`, `b ⊗ a ↦ b^p·a`, of an algebra over an
`𝔽_p`-algebra `A` (characterised by `relFrobenius_tmul`). -/
def relFrobenius (A : Type u) (B : Type v) [CommRing A] [CommRing B] [Algebra A B] (p : ℕ)
    [Fact p.Prime] [CharP A p] : B ⊗[A] Via (frobenius A p) →+* B := sorry

theorem relFrobenius_tmul (A : Type u) (B : Type v) [CommRing A] [CommRing B] [Algebra A B]
    (p : ℕ) [Fact p.Prime] [CharP A p] (b : B) (a : Via (frobenius A p)) :
    relFrobenius A B p (b ⊗ₜ a) = b ^ p * algebraMap A B ((Via.equiv _).symm a) := by
  sorry

/-- `HabiroRings:HR.1/relative-frobenius-of-an-etale-algebra` ([Stacks, Tag 0EBS], used in
Wagner 2.7): for `B` étale over an `𝔽_p`-algebra `A`, the relative Frobenius is an isomorphism.
It fails for smooth non-étale `B` (`𝔽_p[t]`, where the image is `𝔽_p[t^p]`). -/
theorem relFrobenius_bijective_of_etale (A : Type u) (B : Type v) [CommRing A] [CommRing B]
    [Algebra A B] (p : ℕ) [Fact p.Prime] [CharP A p] [Algebra.Etale A B] :
    Function.Bijective (relFrobenius A B p) := by
  sorry

/-! ## HR.2 — Habiro-complete modules

Habiro-completeness and Habiro completion are notions in the derived ∞-category `D(A[q^{±1}])`
(Wagner B.1), which neither pinned library has; they are not stated here. What is stated is the
localisation `Rr`, its two-term resolution, and the ring-level shadows of the tests: for a static
input with nonzerodivisors `(q;q)_N` and a surjective tower, the derived Habiro completion is the
classical ring `lim_N ℤ[q]/((q;q)_N)` (completeness-via-the-factorial-tower), which is the
stand-in `HabiroRing ℤ`. -/

/-! ### `HabiroRings:HR.2/habiro-complete-modules` -/

/-- The submonoid of `ℤ[q^{±1}]` generated by the `q^m - 1`, `m ≥ 1`. -/
def habiroSubmonoid : Submonoid (LaurentPolynomial ℤ) :=
  Submonoid.closure (Set.range fun m : ℕ+ => (LaurentPolynomial.T (m : ℤ) - 1 : LaurentPolynomial ℤ))

/-- `HabiroRings:HR.2/habiro-complete-modules` (`habiroLocalisation`): `Rr`, the localisation of
`ℤ[q^{±1}]` inverting every `q^m - 1`. -/
abbrev habiroLocalisation : Type := Localization habiroSubmonoid

/-- `Rr` is also the localisation at all `Φ_d(q)`, `d ≥ 1` (`q^m - 1 = ∏_{d ∣ m} Φ_d(q)`). -/
theorem habiroLocalisation_eq_cyclotomic :
    IsLocalization (Submonoid.closure (Set.range fun d : ℕ+ =>
      ((cyclotomic (d : ℕ) ℤ).toLaurent : LaurentPolynomial ℤ))) habiroLocalisation := by
  sorry

-- IsHabiroComplete: not stated here; needs the derived ∞-category `D(A[q^{±1}])` with
-- `RHom_{ℤ[q^{±1}]}(Rr, −)` (supplier: EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1).
-- habiroCompletion: not stated here; needs derived `(q^m − 1)`-completion and derived limits over
-- the divisibility poset (supplier: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E0).
-- habiroCompletion.unit: not stated here; needs `habiroCompletion` (same suppliers).
-- IsHabiroComplete.of_adicComplete: not stated here; needs derived completeness
-- (supplier: DerivedDeRhamCohomology:DD.1) and `IsHabiroComplete`.
-- isHabiroComplete_habiroCompletion: not stated here; needs `IsHabiroComplete` and
-- `habiroCompletion` (supplier: EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1).
-- IsHabiroComplete.limit: not stated here; needs limits, fibres and shifts in `D(A[q^{±1}])`
-- (supplier: EnhancedDerivedSheaves:E0, EnhancedDerivedSheaves:E1).
-- isHabiroComplete_iff_restrictScalars: not stated here; needs `IsHabiroComplete` and the
-- restriction of scalars `D(A[q^{±1}]) → D(ℤ[q^{±1}])` (supplier: EnhancedDerivedSheaves:E1).
-- habiroCompletion_polynomial_eq_laurent: not stated here; needs `habiroCompletion` (supplier:
-- DerivedDeRhamCohomology:DD.1). Its ring-level shadow for `A = ℤ`, that `q` is a unit of
-- `lim_N ℤ[q]/((q;q)_N)`, is the test `habiroTensor_unit_int` below.

section HabiroCompleteModulesTests

-- test habiroCompletion_localisation_eq_zero (non-example)
/- Ring-level part: `q^m - 1` is a unit of `Rr`, so `Rr/(q^m - 1) = 0` for every `m` (this quotient
is also the derived one). The conclusion `Rr^∧_H ≃ 0`, and that `Rr` is not Habiro-complete, are
not stated here; they need `habiroCompletion` and `IsHabiroComplete` (supplier:
DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1). -/
example (m : ℕ+) : Subsingleton (habiroLocalisation ⧸ Ideal.span
    {algebraMap (LaurentPolynomial ℤ) habiroLocalisation (LaurentPolynomial.T (m : ℤ) - 1)}) := by
  sorry

-- test isHabiroComplete_powerSeries (characterisation): not stated here; needs the derived
-- predicate `IsHabiroComplete` on `D(ℤ[q^{±1}])` (supplier: EnhancedDerivedSheaves:E1,
-- DerivedDeRhamCohomology:DD.1). Its input that `q - 1` acts invertibly on `Rr` is
-- `IsLocalization.map_units`.

-- test habiroCompletion_ne_powerSeries (non-example)
/- Modulo `Φ_2(q) = q + 1`: `ℤ[[q - 1]]/(q + 1) ≅ ℤ[[t]]/(t + 2) ≅ ℤ_2` (with `t = q - 1`), whereas
`H/(q + 1) ≅ ℤ` for Habiro's ring `H = ℤ[q^{±1}]^∧_H` (a domain, so this quotient is the derived
one); hence no `ℤ[q]`-algebra isomorphism `H ≅ ℤ[[q - 1]]`. -/
example : Nonempty (PowerSeries ℤ ⧸ Ideal.span {(PowerSeries.X + 2 : PowerSeries ℤ)} ≃+* ℤ_[2]) ∧
    Nonempty (HabiroRing ℤ ⧸ Ideal.span {CycloCompletion.fromPoly ℤ Set.univ (X + 1)} ≃+* ℤ) ∧
    ¬ ∃ e : HabiroRing ℤ ≃+* PowerSeries ℤ,
      e (CycloCompletion.fromPoly ℤ Set.univ X) = 1 + PowerSeries.X := by
  sorry

-- test habiroCompletion_q_inverse (computation)
/- `q·(1 + q - q^2) - 1 = -(q;q)_2 = -(1 - q)(1 - q^2)`, so `q` is a unit of `ℤ[q]/((q;q)_2)`. -/
example : (X * (1 + X - X ^ 2) - 1 : ℤ[X]) = -factorialPoly ℤ 2 ∧
    factorialPoly ℤ 2 = (1 - X) * (1 - X ^ 2) ∧
    IsUnit (Ideal.Quotient.mk (Ideal.span {factorialPoly ℤ 2}) (X : ℤ[X])) := by
  have h : factorialPoly ℤ 2 = (1 - X) * (1 - X ^ 2) := by
    simp [factorialPoly, Finset.prod_Icc_succ_top, pow_one]
  have h1 : (X * (1 + X - X ^ 2) - 1 : ℤ[X]) = -factorialPoly ℤ 2 := by rw [h]; ring
  refine ⟨h1, h, IsUnit.of_mul_eq_one (Ideal.Quotient.mk _ (1 + X - X ^ 2)) ?_⟩
  rw [← map_mul, ← map_one (Ideal.Quotient.mk _), Ideal.Quotient.eq, h1]
  exact (Ideal.neg_mem_iff _).2 (Ideal.subset_span rfl)

-- test not_isHabiroComplete_laurent (non-example)
/- Ring-level form: `∑_{n ≥ 0} (q;q)_n ∈ H` is not the image of a Laurent polynomial, i.e.
`q^s · ∑ (q;q)_n` is never the image of a polynomial; so `ℤ[q^{±1}] → lim_N ℤ[q]/((q;q)_N)` is
not surjective, which by B.2(c) says that `ℤ[q^{±1}]` is not Habiro-complete. -/
example : ∀ (s : ℕ) (g : ℤ[X]), CycloCompletion.fromPoly ℤ Set.univ (X ^ s) * kontsevichSeries ≠
    CycloCompletion.fromPoly ℤ Set.univ g := by
  sorry

end HabiroCompleteModulesTests

/-! ### `HabiroRings:HR.2/the-two-term-resolution` -/

/-- The denominator `∏_{j=1}^i (q^j - 1) = (-1)^i (q;q)_i` as an element of the submonoid. -/
def habiroDenom (i : ℕ) : habiroSubmonoid :=
  ⟨∏ j ∈ Finset.Icc 1 i, (LaurentPolynomial.T (j : ℤ) - 1 : LaurentPolynomial ℤ), sorry⟩

/-- The first arrow `(a_i) ↦ (a_i - (1 - q^i) a_{i-1})` (corrected; the source prints `(q;q)_i`),
i.e. `e_i ↦ e_i - (1 - q^{i+1}) e_{i+1}`. -/
def habiroResolution.d₁ : (ℕ →₀ LaurentPolynomial ℤ) →ₗ[LaurentPolynomial ℤ]
    (ℕ →₀ LaurentPolynomial ℤ) :=
  Finsupp.linearCombination (LaurentPolynomial ℤ) fun i =>
    Finsupp.single i 1 - Finsupp.single (i + 1) (1 - LaurentPolynomial.T ((i : ℤ) + 1))

/-- The second arrow `(a_i) ↦ ∑ a_i / (q;q)_i`. -/
def habiroResolution.d₂ : (ℕ →₀ LaurentPolynomial ℤ) →ₗ[LaurentPolynomial ℤ] habiroLocalisation :=
  Finsupp.linearCombination (LaurentPolynomial ℤ) fun i =>
    IsLocalization.mk' habiroLocalisation ((-1) ^ i : LaurentPolynomial ℤ) (habiroDenom i)

/-- `HabiroRings:HR.2/the-two-term-resolution`: `0 → ⊕ ℤ[q^{±1}] → ⊕ ℤ[q^{±1}] → Rr → 0` is exact.
(The consequence that `RHom(Rr, N)` lives in degrees `0` and `1` needs `D(ℤ[q^{±1}])`; supplier:
EnhancedDerivedSheaves:E1.) -/
theorem habiroLocalisation_twoTermResolution :
    Function.Injective habiroResolution.d₁ ∧
      Function.Exact habiroResolution.d₁ habiroResolution.d₂ ∧
      Function.Surjective habiroResolution.d₂ := by
  sorry

/-- The printed first arrow `e_1 ↦ e_1 - (q;q)_2 e_2` does not compose to zero: its image is
`1/(1 - q) - 1 = q/(1 - q) ≠ 0` (source issue `HabiroRings/E8`). -/
example : habiroResolution.d₂ (Finsupp.single 1 1 - Finsupp.single 2 (factorialPoly ℤ 2).toLaurent)
    ≠ 0 := by
  sorry

/-! ### Derived statements of HR.2 (comments)

`detection_results` (`HabiroRings:HR.2/the-detection-results`, Corollary B.4): not stated here;
needs `D̂_H(A[q^{±1}])`, homotopy modules `π_n` and derived reductions `M/Φ_m(q)` (supplier:
EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1).

`completeness_via_factorial_tower` (`HabiroRings:HR.2/completeness-via-the-factorial-tower`, B.2
(a)⇔(b)⇔(c), the left adjoint, idempotence): not stated here; needs `IsHabiroComplete`, derived
quotients and derived limits (supplier: DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E0,
EnhancedDerivedSheaves:E3). Its last clause — `ℤ[q^{±1}]^∧_H` is the classical Habiro ring — is
what makes `HabiroRing ℤ` the ring-level carrier of the tests above.

`completeness_on_homotopy_groups` (`HabiroRings:HR.2/completeness-on-homotopy-groups`, B.2
(a)⇔(d)): not stated here; needs `D(A[q^{±1}])` and its Postnikov filtration (supplier:
EnhancedDerivedSheaves:E1).

`derived_nakayama` (`HabiroRings:HR.2/the-derived-nakayama-lemma`, B.3 with B.5): not stated
here; needs `IsHabiroComplete` and derived quotients (supplier: DerivedDeRhamCohomology:DD.1). Even
the static case needs `Ext¹_{ℤ[q^{±1}]}(Rr, M) = 0` as the meaning of completeness.

`solid_comparison_bounded_below` (`HabiroRings:HR.2/the-solid-comparison-is-bounded-below`,
Lemma B.8): not stated here; needs solid light condensed spectra `Mod_{S_H}(Sp■)` (gap 'Solid
light condensed spectra have no supplier'; supplier: VStackSheavesAndLisseCategories:VS2 for
modules, StableHomotopyKTheory:H.6). -/

/-! ### `HabiroRings:HR.2/the-monoidal-structure` (all API items need `D̂_H`) -/

-- habiroTensor: not stated here; needs `D̂_H(A[q^{±1}])` with the derived tensor product and
-- `habiroCompletion` (supplier: EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1).
-- habiroTensor_unit: not stated here; needs `habiroTensor` (same suppliers).
-- habiroComplete.symmetricMonoidal: not stated here; needs symmetric monoidal ∞-categories and
-- [L-HA, 2.2.1.9] (supplier: EnhancedDerivedSheaves:E5:abstract).
-- habiroCompletion_monoidal: not stated here; needs `habiroComplete.symmetricMonoidal` (supplier:
-- EnhancedDerivedSheaves:E5:abstract).
-- habiroCompletion_tensor: not stated here; needs `habiroTensor` and `habiroCompletion`
-- (supplier: EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1).
-- habiroCompletion_eq_zero_iff: not stated here; needs `habiroCompletion` and `Rr`-modules in
-- `D(A[q^{±1}])` (supplier: EnhancedDerivedSheaves:E1).
-- habiroTensor_baseChange: not stated here; needs `habiroTensor` (supplier:
-- EnhancedDerivedSheaves:E1, E5:abstract).
-- habiroComplete_spectral_comparison: not stated here; needs the module ∞-categories over
-- `S[q^{±1}]` and `S_Rr` (gap 'Spectral module categories for the spectral Habiro completion';
-- supplier: StableHomotopyKTheory:H.6, EnhancedDerivedSheaves:E5).

section MonoidalStructureTests

-- test habiroTensor_unit_int (computation)
/- Ring-level part: the unit for `A = ℤ` is `H = lim_N ℤ[q]/((q;q)_N)`, in which `q` is a unit
(`q·(1 + q - q^2) ≡ 1` modulo `(q;q)_2`), and `ℤ[q] → H` is not surjective. That `H` is the unit
of `⊗̂_H` needs `habiroTensor` (supplier: EnhancedDerivedSheaves:E1). -/
example : IsUnit (CycloCompletion.fromPoly ℤ Set.univ X) ∧
    (X * (1 + X - X ^ 2) - 1 : ℤ[X]) ∈ Ideal.span {factorialPoly ℤ 2} ∧
    ¬ Function.Surjective (CycloCompletion.fromPoly ℤ Set.univ) := by
  sorry

-- test habiroTensor_torsion (computation)
/- The two homotopy groups of `ℤ[q]/(q^2 - 1) ⊗^L ℤ[q]/(q^3 - 1)`: `π_0 = ℤ[q]/(q - 1)` and
`π_1 = ker(q^3 - 1 on ℤ[q]/(q^2 - 1)) = ℤ·(1 + q)`, which an underived definition would lose. The
derived tensor product itself needs `D(ℤ[q^{±1}])` (supplier: EnhancedDerivedSheaves:E1). -/
example : Ideal.span {(X ^ 2 - 1 : ℤ[X]), X ^ 3 - 1} = Ideal.span {X - 1} ∧
    LinearMap.ker (LinearMap.mulLeft ℤ
      (Ideal.Quotient.mk (Ideal.span {(X ^ 2 - 1 : ℤ[X])}) (X ^ 3 - 1))) =
      Submodule.span ℤ {Ideal.Quotient.mk (Ideal.span {(X ^ 2 - 1 : ℤ[X])}) (1 + X)} := by
  sorry

-- test ordinary_tensor_not_complete (non-example)
/- Ring-level part: the multiplication `H ⊗_{ℤ[q]} H → H` is not injective. That `H ⊗^L H` is not
Habiro-complete needs `IsHabiroComplete` (supplier: EnhancedDerivedSheaves:E1). -/
example : ¬ Function.Injective (Algebra.TensorProduct.lmul' ℤ[X] (S := HabiroRing ℤ)) := by
  sorry

-- test habiroCompletion_ne_smashing (non-example)
/- Ring-level part: `Rr ⊗ ℤ[[q - 1]] ≠ 0` (it contains `ℤ((q - 1))`), for `ℤ[[q - 1]]` an
`ℤ[q^{±1}]`-algebra through `q ↦ 1 + (q - 1)`, a unit. That its Habiro completion vanishes needs
`habiroCompletion` (supplier: DerivedDeRhamCohomology:DD.1). -/
example (u : (PowerSeries ℤ)ˣ) (_hu : (u : PowerSeries ℤ) = 1 + PowerSeries.X) :
    Nontrivial (habiroLocalisation ⊗[LaurentPolynomial ℤ]
      Via (LaurentPolynomial.eval₂ (Int.castRingHom (PowerSeries ℤ)) u)) := by
  sorry

-- test habiroTensor_unit_law (degenerate): not stated here; needs `habiroTensor` (supplier:
-- EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1).

end MonoidalStructureTests

/-! ### `HabiroRings:HR.2/habiro-complete-solid-spectra` (all items need solid spectra) -/

-- IsHabiroCompleteSolid: not stated here; needs `Mod_{S[q^{±1}]}(Sp■)`, solid light condensed
-- spectra (gap 'Solid light condensed spectra have no supplier'; supplier:
-- VStackSheavesAndLisseCategories:VS2, StableHomotopyKTheory:H.6).
-- habiroCompletionSolid: not stated here; needs `Mod_{S[q^{±1}]}(Sp■)` (same gap).
-- toSolid: not stated here; needs `Mod_{S_H}(Sp)^∧_H` and `Mod_{S_H}(Sp■)` (same gap, and gap
-- 'Spectral module categories for the spectral Habiro completion').
-- toSolid_fullyFaithful: not stated here; needs `toSolid` (same gaps).
-- toSolid_eval_point: not stated here; needs `toSolid` (same gaps).
-- test toSolid_unit (computation): not stated here; needs `toSolid` and the spherical Habiro
-- ring `S_H` (same gaps).
-- test toSolid_torsion (degenerate): not stated here; needs `toSolid` (same gaps).
-- test toSolid_sum_ne_discrete (non-example): not stated here; needs `toSolid` and
-- `IsHabiroCompleteSolid` (same gaps).

/-! ## HR.3 — finite cyclotomic descent

Only the arithmetic of the divisor poset is ring-level; the descent statements are equivalences
of ∞-categories of complete objects and of their `E∞`-algebras. -/

/-! ### `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` -/

section DivisorPoset

/-- The chain `T_{d,p} = {d, pd, …, p^{v_p(m)} d}` of divisors of `m` (for `p ∤ d`). -/
def divisorChain (m d p : ℕ) : Finset ℕ :=
  (Finset.range (m.factorization p + 1)).image fun i => p ^ i * d

/-- `I_S = (Φ_d(q) : d ∈ S) ⊆ A[q]`. -/
def cyclotomicIdeal (A : Type u) [CommRing A] (S : Finset ℕ) : Ideal A[X] :=
  Ideal.span ((fun d => cyclotomic d A) '' (S : Set ℕ))

variable (A : Type u) [CommRing A]

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (a):
`V(q^m - 1) = ⋃_{d ∣ m} V(Φ_d(q))` in `Spec A[q]`. -/
theorem zeroLocus_X_pow_sub_one_eq_iUnion {m : ℕ} (hm : 0 < m) :
    PrimeSpectrum.zeroLocus {(X ^ m - 1 : A[X])} =
      ⋃ d ∈ m.divisors, PrimeSpectrum.zeroLocus {cyclotomic d A} := by
  sorry

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (b): if a non-empty set `S` of
divisors of `m` lies in no chain `T_{d,p}`, then `I_S = A[q]`. -/
theorem cyclotomicIdeal_eq_top_of_forall_not_subset_divisorChain {m : ℕ} {S : Finset ℕ}
    (hS : S ⊆ m.divisors) (hne : S.Nonempty)
    (h : ∀ d p, p.Prime → ¬ p ∣ d → d ∣ m → ¬ S ⊆ divisorChain m d p) :
    cyclotomicIdeal A S = ⊤ := by
  sorry

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (b), the equivalent form: `S` lies in
no chain iff two distinct elements of `S` have a ratio that is not `p^α`, `α ≠ 0` (tested in both
directions, so a ratio such as `3/2` is not a prime power). -/
theorem forall_not_subset_divisorChain_iff {m : ℕ} (hm : 0 < m) {S : Finset ℕ}
    (hS : S ⊆ m.divisors) (hne : S.Nonempty) :
    (∀ d p, p.Prime → ¬ p ∣ d → d ∣ m → ¬ S ⊆ divisorChain m d p) ↔
      ∃ a ∈ S, ∃ b ∈ S, a ≠ b ∧
        ¬ ∃ p k, p.Prime ∧ 0 < k ∧ (a = p ^ k * b ∨ b = p ^ k * a) := by
  sorry

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (c): for `S ⊆ T_{d,p}` with
`|S| ≥ 2`, `I_S` and `(p, Φ_d(q))` have the same radical. -/
theorem radical_cyclotomicIdeal_of_subset_divisorChain {m d p : ℕ} (hp : p.Prime) (hpd : ¬ p ∣ d)
    (hdm : d ∣ m) {S : Finset ℕ} (hS : S ⊆ divisorChain m d p) (h2 : 2 ≤ S.card) :
    (cyclotomicIdeal A S).radical = (Ideal.span {C (p : A), cyclotomic d A}).radical := by
  sorry

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (d), first half: `{d} = T_{d,ℓ}` for
any prime `ℓ ∤ m`. -/
theorem divisorChain_eq_singleton {m d ℓ : ℕ} (hℓ : ℓ.Prime) (hℓm : ¬ ℓ ∣ m) :
    divisorChain m d ℓ = {d} := by
  sorry

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (d), second half: distinct chains
with at least two elements are incomparable. -/
theorem not_divisorChain_subset {m d d' p p' : ℕ} (hp : p.Prime) (hp' : p'.Prime)
    (hpd : ¬ p ∣ d) (hpd' : ¬ p' ∣ d') (hdm : d ∣ m) (hdm' : d' ∣ m)
    (h2 : 2 ≤ (divisorChain m d p).card) (h2' : 2 ≤ (divisorChain m d' p').card)
    (hne : divisorChain m d p ≠ divisorChain m d' p') :
    ¬ divisorChain m d p ⊆ divisorChain m d' p' := by
  sorry

/-- `HabiroRings:HR.3/the-divisor-poset-and-its-intersections` (e): if the prime-to-`p` parts of
`a` and `b` differ, then `(p, Φ_a(q), Φ_b(q)) = A[q]`. -/
theorem span_prime_cyclotomic_cyclotomic_eq_top {p a b : ℕ} (hp : p.Prime) (ha : 0 < a)
    (hb : 0 < b) (h : a / p ^ a.factorization p ≠ b / p ^ b.factorization p) :
    Ideal.span {C (p : A), cyclotomic a A, cyclotomic b A} = ⊤ := by
  sorry

-- Acceptance instances (`m = 6`, `m = 4` and (e)).
example : cyclotomic 3 ℤ - X * cyclotomic 2 ℤ = 1 := by
  rw [cyclotomic_three, cyclotomic_two]; ring

example : cyclotomic 6 ℤ - X * cyclotomic 1 ℤ = 1 := by
  sorry

example : cyclotomicIdeal ℤ {1, 4} = Ideal.span {X - 1, C 2} ∧ cyclotomicIdeal ℤ {1, 4} ≠ ⊤ ∧
    divisorChain 4 1 2 = {1, 2, 4} := by
  sorry

example : Ideal.span {C (2 : ℤ), cyclotomic 1 ℤ, cyclotomic 3 ℤ} = ⊤ ∧
    Ideal.span {C (2 : ℤ), cyclotomic 3 ℤ, cyclotomic 6 ℤ} = Ideal.span {C 2, cyclotomic 3 ℤ} ∧
    Ideal.span {C (2 : ℤ), cyclotomic 3 ℤ} ≠ ⊤ ∧
    Ideal.span {C (3 : ℤ), cyclotomic 2 ℤ, cyclotomic 4 ℤ} = ⊤ := by
  sorry

end DivisorPoset

/-! ### The ∞-categorical descent statements of HR.3 (comments)

`complete_descent_corollary` (`HabiroRings:HR.3/the-complete-descent-corollary`, Corollary 2.4):
not stated here; needs derived `Φ_d(q)`-complete `E∞`-`A[q]`-algebras, their `p`-completions and
the contractibility of a space of solutions (supplier: EnhancedDerivedSheaves:E5:abstract,
DerivedDeRhamCohomology:DD.1). No relation among the `h_d` is imposed because the poset `P` has
height one; this is not a licence to glue arbitrary pairwise isomorphisms.

`morphism_level_statement` (`HabiroRings:HR.3/the-morphism-level-statement`): not stated here;
needs the ∞-categories `D̂_{I_S}(A[q])`, their limit over `P` and `CAlg` of it (supplier:
DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E3, EnhancedDerivedSheaves:E5:abstract).

`general_descent_principle` (`HabiroRings:HR.3/the-general-descent-principle`, Setup 2.1 and
Lemma 2.2): not stated here; needs presentable stable symmetric monoidal ∞-categories,
`CAlg(Pr^L_st)` and straightening over a poset (gap 'Higher-categorical inputs of the general
descent principle'; supplier: EnhancedDerivedSheaves:E0, E3, E5:presentability, E5:abstract).

`fracture_square_pieces` (`HabiroRings:HR.3/the-fracture-square-pieces`, Remark 2.5): not stated
here; needs the glued `E∞`-algebra of Corollary 2.4 (supplier: EnhancedDerivedSheaves:E5:abstract,
DerivedDeRhamCohomology:DD.1). Its arithmetic input is part (e) above. -/

/-! ## HR.4 — big Witt vectors, q-Witt vectors, relative q-Witt rings and the finite stages

Big Witt vectors with truncation sets are in neither library (Mathlib has only the `p`-typical
`WittVector`), so HR.4 plans them (`HabiroRings:HR.4/truncated-big-witt-vectors`). Below, the
carrier `R^S` is a real definition; the ring structure, the unique functorial one making the
ghost maps ring maps (Dwork's lemma for truncation sets), is a `sorry` instance whose
construction is that node's work. The ghost maps, restrictions, Teichmüller lifts and the
functoriality are real functions over it. q-Witt vectors are then an honest quotient of
`W_m(R)[q]` by the ideal of q-Witt Lemma 2.9, and relative q-Witt vectors an honest quotient of a
tensor product (Lemma 2.41). Levels `m` are positive integers. -/

/-! ### `HabiroRings:HR.4/truncated-big-witt-vectors` -/

/-- A truncation set: a set of positive integers closed under divisors. -/
structure TruncationSet where
  /-- The set. -/
  carrier : Set ℕ
  pos : ∀ n ∈ carrier, 0 < n
  dvd_mem : ∀ n ∈ carrier, ∀ d, d ∣ n → d ∈ carrier

namespace TruncationSet

/-- `T_m`, the divisors of `m`. -/
def divisors (m : ℕ+) : TruncationSet where
  carrier := ↑(Nat.divisors (m : ℕ))
  pos _ h := Nat.pos_of_mem_divisors h
  dvd_mem _ h _ hd := Nat.mem_divisors.2
    ⟨dvd_trans hd (Nat.dvd_of_mem_divisors h), m.ne_zero⟩

/-- All positive integers. -/
def univ : TruncationSet where
  carrier := {n | 0 < n}
  pos _ h := h
  dvd_mem _ h _ hd := Nat.pos_of_dvd_of_pos hd h

theorem mem_divisors {m : ℕ+} {d : ℕ} : d ∈ (divisors m).carrier ↔ d ∣ (m : ℕ) :=
  Finset.mem_coe.trans (Nat.mem_divisors.trans ⟨fun h => h.1, fun h => ⟨h, m.ne_zero⟩⟩)

theorem mem_of_dvd (S : TruncationSet) {m d : ℕ+} (hm : (m : ℕ) ∈ S.carrier) (h : d ∣ m) :
    (d : ℕ) ∈ S.carrier :=
  S.dvd_mem _ hm _ (PNat.dvd_iff.1 h)

end TruncationSet

/-- A divisor `d ∈ Nat.divisors m` as a positive integer. -/
def divisorPNat (m : ℕ+) (d : (m : ℕ).divisors) : ℕ+ :=
  ⟨d, Nat.pos_of_mem_divisors d.2⟩

theorem divisorPNat_dvd (m : ℕ+) (d : (m : ℕ).divisors) : divisorPNat m d ∣ m :=
  PNat.dvd_iff.2 (Nat.dvd_of_mem_divisors d.2)

/-- `HabiroRings:HR.4/truncated-big-witt-vectors` (`BigWittVector`): the `S`-truncated big Witt
ring `W_S(R)`, with underlying set `R^S`. -/
@[ext]
structure BigWittVector (S : TruncationSet) (R : Type u) where
  /-- The coordinates `(x_n)_{n ∈ S}`. -/
  mk ::
  coeff : S.carrier → R

/-- `W_m(R) = W_{T_m}(R)`. -/
abbrev WittLevel (m : ℕ+) (R : Type u) : Type u := BigWittVector (TruncationSet.divisors m) R

namespace BigWittVector

variable (S : TruncationSet) (R : Type u) [CommRing R]

/-- The ring structure of `W_S(R)`: the unique one, functorial in `R`, for which every ghost map
`gh_n` is a ring map (q-Witt 2.6; integrality is Dwork's lemma for truncation sets). Its
construction is the work of `HabiroRings:HR.4/truncated-big-witt-vectors`. -/
instance instCommRing : CommRing (BigWittVector S R) := sorry

/-- The ghost map `gh_n(x) = ∑_{d ∣ n} d · x_d^{n/d}`, `n ∈ S` (a real function; that it is a ring
map is the defining property of the ring structure). -/
def ghost (n : ℕ) (hn : n ∈ S.carrier) : BigWittVector S R →+* R where
  toFun x := ∑ d ∈ n.divisors.attach,
    ((d : ℕ) : R) * x.coeff ⟨d, S.dvd_mem n hn d (Nat.dvd_of_mem_divisors d.2)⟩ ^ (n / d)
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- For `ℤ`-torsion-free `R`, `x ↦ (gh_n(x))_{n ∈ S}` is injective. -/
theorem ghost_injective [IsAddTorsionFree R] :
    Function.Injective (fun x : BigWittVector S R => fun n : S.carrier => ghost S R n n.2 x) := by
  sorry

/-- The Frobenius `F_{m/d} : W_m(R) → W_d(R)` for `d ∣ m`, a ring map (`ghost_frobenius`). -/
def frobenius {m d : ℕ+} (_h : d ∣ m) : WittLevel m R →+* WittLevel d R := sorry

/-- The Verschiebung `V_{m/d} : W_d(R) → W_m(R)` for `d ∣ m` (the source prints the target
`W_d(R)`, source issue `HabiroRings/E11`), additive (`ghost_verschiebung`). -/
def verschiebung {m d : ℕ+} (_h : d ∣ m) : WittLevel d R →+ WittLevel m R := sorry

/-- The restriction `Res_{m/d} : W_m(R) → W_d(R)`, restriction of coordinates to `T_d` (a real
function; it does not extend to q-Witt vectors, `QWittVector.no_restriction_map`). -/
def restrict {m d : ℕ+} (h : d ∣ m) : WittLevel m R →+* WittLevel d R where
  toFun x := ⟨fun e => x.coeff ⟨e.1, TruncationSet.mem_divisors.2
    (dvd_trans (TruncationSet.mem_divisors.1 e.2) (PNat.dvd_iff.1 h))⟩⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- The Teichmüller lift `τ(r) = (r, 0, 0, …)`, multiplicative (a real function). -/
def teichmuller : R →* BigWittVector S R where
  toFun r := ⟨fun n => if (n : ℕ) = 1 then r else 0⟩
  map_one' := sorry
  map_mul' := sorry

theorem _root_.TauCeti.Habiro.TruncationSet.mul_mem_divisors {m d : ℕ+} (h : d ∣ m) {e : ℕ}
    (he : e ∈ (TruncationSet.divisors d).carrier) :
    (m : ℕ) / d * e ∈ (TruncationSet.divisors m).carrier := by
  sorry

theorem _root_.TauCeti.Habiro.TruncationSet.div_mem_divisors {m d : ℕ+} (h : d ∣ m) {e : ℕ}
    (he : e ∈ (TruncationSet.divisors m).carrier) (hne : (m : ℕ) / d ∣ e) :
    e / ((m : ℕ) / d) ∈ (TruncationSet.divisors d).carrier := by
  sorry

/-- `gh_e ∘ F_{m/d} = gh_{(m/d)e}`. -/
theorem ghost_frobenius {m d : ℕ+} (h : d ∣ m) (e : ℕ)
    (he : e ∈ (TruncationSet.divisors d).carrier) (x : WittLevel m R) :
    ghost _ R e he (frobenius R h x) =
      ghost _ R ((m : ℕ) / d * e) (TruncationSet.mul_mem_divisors h he) x := by
  sorry

/-- `gh_e ∘ V_n = n · gh_{e/n}` if `n ∣ e` and `0` otherwise (`n = m/d`). -/
theorem ghost_verschiebung {m d : ℕ+} (h : d ∣ m) (e : ℕ)
    (he : e ∈ (TruncationSet.divisors m).carrier) (x : WittLevel d R) :
    ghost _ R e he (verschiebung R h x) =
      if hd : (m : ℕ) / d ∣ e then
        (((m : ℕ) / d : ℕ) : R) * ghost _ R (e / ((m : ℕ) / d))
          (TruncationSet.div_mem_divisors h he hd) x
      else 0 := by
  sorry

theorem ghost_teichmuller (n : ℕ) (hn : n ∈ S.carrier) (r : R) :
    ghost S R n hn (teichmuller S R r) = r ^ n := by
  sorry

/-- `F_{d/e} ∘ F_{m/d} = F_{m/e}` and `V_{m/d} ∘ V_{d/e} = V_{m/e}` for `e ∣ d ∣ m`. -/
theorem frobenius_comp {m d e : ℕ+} (hed : e ∣ d) (hdm : d ∣ m) :
    (frobenius R hed).comp (frobenius R hdm) = frobenius R (dvd_trans hed hdm) ∧
      (verschiebung R hdm).comp (verschiebung R hed) = verschiebung R (dvd_trans hed hdm) := by
  sorry

/-- `F_n ∘ V_n = n`, and `F_n ∘ V_k = V_k ∘ F_n` for coprime `k, n` (the levels are
`W_{nc} → W_{k(nc)} → W_{kc}` and `W_{nc} → W_c → W_{kc}`). `V_n ∘ F_n = n` is false. -/
theorem frobenius_verschiebung {m d : ℕ+} (h : d ∣ m) (k n c : ℕ+) (hkn : Nat.Coprime k n) :
    (frobenius R h).toAddMonoidHom.comp (verschiebung R h) =
        ((m : ℕ) / d) • AddMonoidHom.id (WittLevel d R) ∧
      (frobenius R (mul_dvd_mul_left k (dvd_mul_left c n))).toAddMonoidHom.comp
          (verschiebung R (dvd_mul_left (n * c) k)) =
        (verschiebung R (dvd_mul_left c k)).comp (frobenius R (dvd_mul_left c n)).toAddMonoidHom := by
  sorry

@[simp] theorem frobenius_teichmuller {m d : ℕ+} (h : d ∣ m) (r : R) :
    frobenius R h (teichmuller _ R r) = teichmuller _ R r ^ ((m : ℕ) / d) := by
  sorry

/-- `x = ∑_{d ∣ m} V_{m/d}(τ_d(x_{m/d}))`. -/
theorem eq_sum_verschiebung_teichmuller (m : ℕ+) (x : WittLevel m R) :
    x = ∑ d : (m : ℕ).divisors, verschiebung R (divisorPNat_dvd m d)
      (teichmuller _ R (x.coeff ⟨(m : ℕ) / d, TruncationSet.mem_divisors.2
        (Nat.div_dvd_of_dvd (Nat.dvd_of_mem_divisors d.2))⟩)) := by
  sorry

/-- `Res_{na/ne} ∘ V_n = V_n ∘ Res_{a/e}` for `e ∣ a`, and `Res_{m/d} ∘ V_n = 0` if `n ∤ d`. -/
theorem restrict_verschiebung (n a e : ℕ+) (hea : e ∣ a) (d : ℕ+) (hd : d ∣ n * a)
    (hnd : ¬ n ∣ d) :
    (restrict R (mul_dvd_mul_left n hea)).toAddMonoidHom.comp (verschiebung R (dvd_mul_left a n)) =
        (verschiebung R (dvd_mul_left e n)).comp (restrict R hea).toAddMonoidHom ∧
      (restrict R hd).toAddMonoidHom.comp (verschiebung R (dvd_mul_left a n)) = 0 := by
  sorry

/-- Functoriality, coordinatewise (a real function). -/
def map {R' : Type v} [CommRing R'] (f : R →+* R') : BigWittVector S R →+* BigWittVector S R' where
  toFun x := ⟨fun n => f (x.coeff n)⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

theorem map_id : map S R (RingHom.id R) = RingHom.id _ := by
  sorry

theorem map_comp {R' : Type v} {R'' : Type w} [CommRing R'] [CommRing R''] (f : R →+* R')
    (g : R' →+* R'') : map S R (g.comp f) = (map S R' g).comp (map S R f) := by
  sorry

/-- `map` commutes with `gh`, `F`, `V`, `Res` and `τ`. -/
theorem map_natural {R' : Type v} [CommRing R'] (f : R →+* R') {m d : ℕ+} (h : d ∣ m) :
    (∀ n hn x, ghost S R' n hn (map S R f x) = f (ghost S R n hn x)) ∧
      (map _ R f).comp (frobenius R h) = (frobenius R' h).comp (map _ R f) ∧
      (map _ R f).toAddMonoidHom.comp (verschiebung R h) =
        (verschiebung R' h).comp (map _ R f).toAddMonoidHom ∧
      (map _ R f).comp (restrict R h) = (restrict R' h).comp (map _ R f) ∧
      ∀ r, map S R f (teichmuller S R r) = teichmuller S R' (f r) := by
  sorry

/-- `p^n` as a positive integer. -/
def primePow (p : ℕ) [Fact p.Prime] (n : ℕ) : ℕ+ :=
  ⟨p ^ n, pow_pos (Fact.out : p.Prime).pos n⟩

/-- For `m = p^n`, `W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R`, `x ↦ (x_{p^i})_{i ≤ n}`, matching
`gh_{p^k}` with `WittVector.ghostComponent k` and `F_p`, `V_p`, `τ` with the `p`-typical operators
(q-Witt Remark 2.7). -/
def equivTruncatedWittVector (p : ℕ) [Fact p.Prime] (n : ℕ) :
    WittLevel (primePow p n) R ≃+* TruncatedWittVector p (n + 1) R := sorry

/-- The section `s : A → W_S(A)` of a Λ-ring, `gh_n(s(x)) = ψ^n(x)` (Dwork's criterion with the
Frobenius lifts `ψ^p`; q-Witt 2.31). -/
def lambdaSection {A : Type u} [CommRing A] (_Λ : LambdaRing A) (S : TruncationSet) :
    A →+* BigWittVector S A := sorry

theorem ghost_lambdaSection {A : Type u} [CommRing A] (Λ : LambdaRing A) (S : TruncationSet)
    (n : ℕ) (hn : n ∈ S.carrier) (x : A) :
    ghost S A n hn (lambdaSection Λ S x) = Λ.adams ⟨n, S.pos n hn⟩ x := by
  sorry

end BigWittVector

/-- `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations` (`LambdaRing.toBigWitt`): the
structure map `s : A → W(A)` to the big Witt vectors with `gh_m ∘ s = ψ^m` (q-Witt 2.31), over
the stand-in `BigWittVector`. -/
def LambdaRing.toBigWitt {A : Type u} [CommRing A] (Λ : LambdaRing A) :
    A →+* BigWittVector TruncationSet.univ A :=
  BigWittVector.lambdaSection Λ TruncationSet.univ

/-- For torsion-free `A` the Adams operations determine `s` (the Wilkerson comparison, gap
'Λ-rings as big-Witt coalgebras versus the torsion-free Adams form, and big Witt vectors'). -/
theorem LambdaRing.toBigWitt_unique {A : Type u} [CommRing A] (Λ : LambdaRing A)
    (s : A →+* BigWittVector TruncationSet.univ A)
    (hs : ∀ n hn x, BigWittVector.ghost _ A n hn (s x) = Λ.adams ⟨n, hn⟩ x) :
    s = Λ.toBigWitt := by
  sorry

section BigWittTests

open BigWittVector

variable {R : Type u} [CommRing R]

/-- The two coordinates of `W_2(R)`. -/
theorem one_mem_divisors (m : ℕ+) : (1 : ℕ) ∈ (TruncationSet.divisors m).carrier :=
  TruncationSet.mem_divisors.2 (one_dvd _)

theorem self_mem_divisors (m : ℕ+) : (m : ℕ) ∈ (TruncationSet.divisors m).carrier :=
  TruncationSet.mem_divisors.2 (dvd_refl _)

-- test BigWittVector.ghost_two_int (computation)
/- `(gh_1, gh_2) : W_2(ℤ) → ℤ × ℤ`, `(x_1, x_2) ↦ (x_1, x_1^2 + 2x_2)`, is injective with image
`{(a, b) : a ≡ b mod 2}`. -/
example : (∀ x : WittLevel 2 ℤ, ghost _ ℤ 1 (one_mem_divisors 2) x = x.coeff ⟨1, one_mem_divisors 2⟩ ∧
      ghost _ ℤ 2 (self_mem_divisors 2) x =
        x.coeff ⟨1, one_mem_divisors 2⟩ ^ 2 + 2 * x.coeff ⟨2, self_mem_divisors 2⟩) ∧
    Function.Injective (fun x : WittLevel 2 ℤ =>
      (ghost _ ℤ 1 (one_mem_divisors 2) x, ghost _ ℤ 2 (self_mem_divisors 2) x)) ∧
    Set.range (fun x : WittLevel 2 ℤ =>
      (ghost _ ℤ 1 (one_mem_divisors 2) x, ghost _ ℤ 2 (self_mem_divisors 2) x)) =
      {ab | ab.1 ≡ ab.2 [ZMOD 2]} := by
  sorry

-- test BigWittVector.verschiebung_frobenius_ne (non-example)
/- `V_2(F_2(1)) = V_2(1)` has ghost vector `(0, 2)`, while `2` has `(2, 2)`: `V_2 ∘ F_2 ≠ 2`. -/
example : verschiebung ℤ (one_dvd (2 : ℕ+)) (frobenius ℤ (one_dvd (2 : ℕ+)) 1) ≠ 2 ∧
    (frobenius ℤ (one_dvd (2 : ℕ+))).toAddMonoidHom.comp (verschiebung ℤ (one_dvd (2 : ℕ+))) =
      2 • AddMonoidHom.id _ := by
  sorry

-- test BigWittVector.teichmuller_two (computation)
/- `τ_2(2) = (2, 0)` has ghost vector `(2, 4)`, and `x = τ_2(x_1) + V_2(τ_1(x_2))` in `W_2(R)`. -/
example : (teichmuller _ ℤ 2 : WittLevel 2 ℤ).coeff ⟨1, one_mem_divisors 2⟩ = 2 ∧
    (teichmuller _ ℤ 2 : WittLevel 2 ℤ).coeff ⟨2, self_mem_divisors 2⟩ = 0 ∧
    ghost _ ℤ 1 (one_mem_divisors 2) (teichmuller _ ℤ 2) = 2 ∧
    ghost _ ℤ 2 (self_mem_divisors 2) (teichmuller _ ℤ 2) = 4 ∧
    ∀ x : WittLevel 2 R, x = teichmuller _ R (x.coeff ⟨1, one_mem_divisors 2⟩) +
      verschiebung R (one_dvd (2 : ℕ+)) (teichmuller _ R (x.coeff ⟨2, self_mem_divisors 2⟩)) := by
  sorry

-- test BigWittVector.equivTruncatedWittVector_ghost (compatibility)
/- Under `W_{p^n}(R) ≅ TruncatedWittVector p (n+1) R`, `gh_{p^k}` is `WittVector.ghostComponent k`
of the zero-extension, the Witt polynomial `∑_{i ≤ k} p^i X_i^{p^{k-i}}`. -/
example (p : ℕ) [Fact p.Prime] (n k : ℕ) (hk : k ≤ n) (x : WittLevel (primePow p n) R) :
    ghost _ R (p ^ k) ((TruncationSet.mem_divisors (m := primePow p n)).2 (pow_dvd_pow p hk)) x =
      WittVector.ghostComponent k (equivTruncatedWittVector R p n x).out := by
  sorry

-- test BigWittVector.restrict_two (computation)
/- `Res_2 : W_2(R) → W_1(R) = R` is `(x_1, x_2) ↦ x_1 = gh_1(x)`, and `Res_2(V_2(1)) = 0`. -/
example (x : WittLevel 2 R) :
    (restrict R (one_dvd (2 : ℕ+)) x).coeff ⟨1, one_mem_divisors 1⟩ =
        x.coeff ⟨1, one_mem_divisors 2⟩ ∧
      ghost _ R 1 (one_mem_divisors 2) x = x.coeff ⟨1, one_mem_divisors 2⟩ ∧
      restrict R (one_dvd (2 : ℕ+)) (verschiebung R (one_dvd (2 : ℕ+)) 1) = 0 := by
  sorry

-- test BigWittVector.one (degenerate)
/- `W_1(R) = R` with `gh_1` the identity; `F_1`, `V_1`, `Res_1` are identities. -/
example : Function.Bijective (ghost _ R 1 (one_mem_divisors 1)) ∧
    frobenius R (dvd_refl (1 : ℕ+)) = RingHom.id _ ∧
    verschiebung R (dvd_refl (1 : ℕ+)) = AddMonoidHom.id _ ∧
    restrict R (dvd_refl (1 : ℕ+)) = RingHom.id _ := by
  sorry

end BigWittTests

/-! ### `HabiroRings:HR.4/q-witt-vectors` -/

/-- The `q`-integer `[k]_{q^e} = 1 + q^e + ⋯ + q^{e(k-1)}`. -/
def qInt (R : Type u) [CommRing R] (k e : ℕ) : R[X] :=
  ∑ i ∈ Finset.range k, X ^ (e * i)

/-- The quotient map `A[q]/(q^m - 1) → A[q]/Φ_d(q)` for `d ∣ m`. -/
def quotCyclotomic (A : Type u) [CommRing A] {m d : ℕ+} (_h : d ∣ m) :
    A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} →+* A[X] ⧸ Ideal.span {cyclotomic (d : ℕ) A} :=
  Ideal.Quotient.factor sorry

/-- The quotient map `A[q]/(q^m - 1) → A[q]/(q^d - 1)` for `d ∣ m`. -/
def quotXPow (A : Type u) [CommRing A] {m d : ℕ+} (_h : d ∣ m) :
    A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} →+* A[X] ⧸ Ideal.span {(X ^ (d : ℕ) - 1 : A[X])} :=
  Ideal.Quotient.factor sorry

/-- The map `R[q]/Φ_d(q) → R'[q]/Φ_d(q)` induced by a ring map `f : R →+* R'`. -/
def cyclotomicQuotMap {R : Type u} {R' : Type v} [CommRing R] [CommRing R'] (f : R →+* R')
    (d : ℕ) : R[X] ⧸ Ideal.span {cyclotomic d R} →+* R'[X] ⧸ Ideal.span {cyclotomic d R'} :=
  Ideal.quotientMap _ (Polynomial.mapRingHom f) sorry

/-- The map `R[q]/(q^m - 1) → R'[q]/(q^m - 1)` induced by a ring map `f : R →+* R'`. -/
def xPowQuotMap {R : Type u} {R' : Type v} [CommRing R] [CommRing R'] (f : R →+* R')
    (m : ℕ) : R[X] ⧸ Ideal.span {(X ^ m - 1 : R[X])} →+* R'[X] ⧸ Ideal.span {(X ^ m - 1 : R'[X])} :=
  Ideal.quotientMap _ (Polynomial.mapRingHom f) sorry

/-- The ideal `I_m ⊆ W_m(R)[q]` of q-Witt Lemma 2.9, generated by `(q^d - 1)·im V_{m/d}` for
`d ∣ m` and by `im([d/e]_{q^e} V_{m/d} - V_{m/e} F_{d/e})` for `e ∣ d ∣ m`. -/
def qWittIdeal (R : Type u) [CommRing R] (m : ℕ+) : Ideal (WittLevel m R)[X] :=
  Ideal.span ({z | ∃ (d : ℕ+) (h : d ∣ m) (x : WittLevel d R),
      z = (X ^ (d : ℕ) - 1) * C (BigWittVector.verschiebung R h x)} ∪
    {z | ∃ (e d : ℕ+) (hed : e ∣ d) (hdm : d ∣ m) (x : WittLevel d R),
      z = qInt (WittLevel m R) ((d : ℕ) / e) e * C (BigWittVector.verschiebung R hdm x) -
        C (BigWittVector.verschiebung R (dvd_trans hed hdm) (BigWittVector.frobenius R hed x))})

/-- `HabiroRings:HR.4/q-witt-vectors` (`QWittVector`): the `m`-truncated big q-Witt vectors
`q-W_m(R) := W_m(R)[q]/I_m`, an algebra over `ℤ[q]/(q^m - 1)`. -/
def QWittVector (R : Type u) [CommRing R] (m : ℕ+) : Type u :=
  (WittLevel m R)[X] ⧸ qWittIdeal R m

namespace QWittVector

variable (R : Type u) [CommRing R]

instance (m : ℕ+) : CommRing (QWittVector R m) :=
  inferInstanceAs (CommRing ((WittLevel m R)[X] ⧸ qWittIdeal R m))

/-- The map `ℤ[q] → q-W_m(R)` (a real definition). -/
def ofIntPoly (m : ℕ+) : ℤ[X] →+* QWittVector R m :=
  (Ideal.Quotient.mk (qWittIdeal R m)).comp (Polynomial.mapRingHom (Int.castRingHom _))

instance (m : ℕ+) : Algebra ℤ[X] (QWittVector R m) := (ofIntPoly R m).toAlgebra

/-- The canonical map `W_m(R) → q-W_m(R)`, `x ↦ [x]` (a real definition). -/
def fromWitt (m : ℕ+) : WittLevel m R →+* QWittVector R m :=
  (Ideal.Quotient.mk (qWittIdeal R m)).comp C

/-- The surjection `W_m(R)[q]/(q^m - 1) → q-W_m(R)`. -/
def ofWitt (m : ℕ+) :
    (WittLevel m R)[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : (WittLevel m R)[X])} →+* QWittVector R m :=
  Ideal.Quotient.factor sorry

/-- `F_{m/d} : q-W_m(R) → q-W_d(R)`, a `ℤ[q]`-algebra map, for `d ∣ m`. -/
def frobenius {m d : ℕ+} (_h : d ∣ m) : QWittVector R m →ₐ[ℤ[X]] QWittVector R d := sorry

/-- `V_{m/d} : q-W_d(R) → q-W_m(R)`, `ℤ[q]`-linear, for `d ∣ m`. -/
def verschiebung {m d : ℕ+} (_h : d ∣ m) : QWittVector R d →ₗ[ℤ[X]] QWittVector R m := sorry

theorem frobenius_verschiebung {m d : ℕ+} (h : d ∣ m) (x : QWittVector R d) :
    frobenius R h (verschiebung R h x) = ((m : ℕ) / d : ℕ) • x := by
  sorry

theorem verschiebung_frobenius {m d : ℕ+} (h : d ∣ m) (x : QWittVector R m) :
    verschiebung R h (frobenius R h x) = algebraMap ℤ[X] _ (qInt ℤ ((m : ℕ) / d) d) * x := by
  sorry

theorem frobenius_comp {m d e : ℕ+} (hed : e ∣ d) (hdm : d ∣ m) :
    (frobenius R hed).comp (frobenius R hdm) = frobenius R (dvd_trans hed hdm) ∧
      (verschiebung R hdm).comp (verschiebung R hed) = verschiebung R (dvd_trans hed hdm) := by
  sorry

/-- The ghost map `gh_{m/d} : q-W_m(R) → R[ζ_d] = R[q]/Φ_d(q)`, `gh_{m/d} = gh_1 ∘ F_{m/d}`. -/
def ghost {m d : ℕ+} (_h : d ∣ m) : QWittVector R m →+* R[X] ⧸ Ideal.span {cyclotomic (d : ℕ) R} :=
  sorry

theorem ghost_eq_comp {m d : ℕ+} (h : d ∣ m) :
    ghost R h = (ghost R (dvd_refl d)).comp (frobenius R h).toRingHom := by
  sorry

/-- `gh_{m/d}` on `W_m(R)` is the classical `gh_{m/d}` followed by `R → R[ζ_d]`. -/
theorem ghost_fromWitt {m d : ℕ+} (h : d ∣ m) (x : WittLevel m R) :
    ghost R h (fromWitt R m x) = Ideal.Quotient.mk _ (C (BigWittVector.ghost _ R ((m : ℕ) / d)
      (TruncationSet.mem_divisors.2 (Nat.div_dvd_of_dvd (PNat.dvd_iff.1 h))) x)) := by
  sorry

/-- `gh_1` identifies `R[q]/Φ_m(q)` with `q-W_m(R)/(im V_p : p prime, p ∣ m)`. -/
theorem ghost_one_eq_quotient (m : ℕ+) :
    Function.Surjective (ghost R (dvd_refl m)) ∧
      RingHom.ker (ghost R (dvd_refl m)) = Ideal.span {y | ∃ (d : ℕ+) (h : d ∣ m),
        ((m : ℕ) / d).Prime ∧ ∃ x, y = verschiebung R h x} := by
  sorry

/-- Lemma 2.23: if `R` is `p`-torsion-free for every prime `p ∣ m`, the ghost maps are jointly
injective. -/
theorem ghost_jointly_injective (m : ℕ+)
    (hR : ∀ p : ℕ, p.Prime → p ∣ (m : ℕ) → ∀ x : R, (p : R) * x = 0 → x = 0) :
    Function.Injective (fun x : QWittVector R m => fun d : {d : ℕ+ // d ∣ m} => ghost R d.2 x) := by
  sorry

/-- The Teichmüller lift `τ_m : R → q-W_m(R)`, the image of the Witt Teichmüller lift (a real
definition). -/
def teichmuller (m : ℕ+) : R →* QWittVector R m :=
  (fromWitt R m).toMonoidHom.comp (BigWittVector.teichmuller _ R)

/-- Functoriality in `R`. -/
def map {R' : Type v} [CommRing R'] (_f : R →+* R') (m : ℕ+) :
    QWittVector R m →ₐ[ℤ[X]] QWittVector R' m := sorry

theorem map_id (m : ℕ+) : map R (RingHom.id R) m = AlgHom.id _ _ := by
  sorry

theorem map_comp {R' : Type v} {R'' : Type w} [CommRing R'] [CommRing R''] (f : R →+* R')
    (g : R' →+* R'') (m : ℕ+) : map R (g.comp f) m = (map R' g m).comp (map R f m) := by
  sorry

/-- `map` is compatible with `F`, `V`, `gh` and `τ`. -/
theorem map_natural {R' : Type v} [CommRing R'] (f : R →+* R') {m d : ℕ+} (h : d ∣ m) :
    (map R f d).comp (frobenius R h) = (frobenius R' h).comp (map R f m) ∧
      (map R f m).toLinearMap.comp (verschiebung R h) =
        (verschiebung R' h).comp (map R f d).toLinearMap ∧
      (ghost R' h).comp (map R f m).toRingHom =
        (cyclotomicQuotMap f d).comp (ghost R h) ∧
      ∀ r, map R f m (teichmuller R m r) = teichmuller R' m (f r) := by
  sorry

end QWittVector

/-- q-Witt Lemma 2.2: in `ℤ[q]`, the ideal generated by the `[p]_{q^{m/p}}` for the primes `p ∣ m`
is `(Φ_m(q))`. -/
theorem Polynomial.span_geomSum_eq_span_cyclotomic (m : ℕ+) (hm : 1 < (m : ℕ)) :
    Ideal.span {f : ℤ[X] | ∃ p, p.Prime ∧ p ∣ (m : ℕ) ∧ f = qInt ℤ p ((m : ℕ) / p)} =
      Ideal.span {cyclotomic (m : ℕ) ℤ} := by
  sorry

/-- The algebra structure of `W_m(R)[q]/(q^m - 1)` over `ℤ[q]` (a real definition). -/
instance (R : Type u) [CommRing R] (m : ℕ+) :
    Algebra ℤ[X] ((WittLevel m R)[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : (WittLevel m R)[X])}) :=
  ((Ideal.Quotient.mk _).comp (Polynomial.mapRingHom (Int.castRingHom _))).toAlgebra

/-- `HabiroRings:HR.4/q-witt-vectors` (`QFVSystem`): a q-FV-system of rings over `R` truncated at
`S` (q-Witt Definition 2.8 and Remark 2.12): `ℤ[q]`-algebras `W_m`, `m ∈ S`, with structure maps
from `W_m(R)[q]/(q^m - 1)`, Frobenii `F_{m/d}` and Verschiebungen `V_{m/d}` compatible with those
of Witt vectors, `F V = m/d` and `V F = [m/d]_{q^d}`. -/
structure QFVSystem (R : Type u) [CommRing R] (S : TruncationSet) where
  /-- The rings `W_m`. -/
  obj : {m : ℕ+ // (m : ℕ) ∈ S.carrier} → Type u
  [commRing : ∀ m, CommRing (obj m)]
  [algebra : ∀ m, Algebra ℤ[X] (obj m)]
  /-- The structure maps `W_m(R)[q]/(q^m - 1) → W_m`. -/
  str : ∀ m, (WittLevel m.1 R)[X] ⧸ Ideal.span {(X ^ (m.1 : ℕ) - 1 : (WittLevel m.1 R)[X])} →ₐ[ℤ[X]]
    obj m
  /-- The Frobenii. -/
  frob : ∀ (m : {m : ℕ+ // (m : ℕ) ∈ S.carrier}) {d : ℕ+} (h : d ∣ m.1),
    obj m →ₐ[ℤ[X]] obj ⟨d, S.mem_of_dvd m.2 h⟩
  /-- The Verschiebungen. -/
  versch : ∀ (m : {m : ℕ+ // (m : ℕ) ∈ S.carrier}) {d : ℕ+} (h : d ∣ m.1),
    obj ⟨d, S.mem_of_dvd m.2 h⟩ →ₗ[ℤ[X]] obj m
  frob_str : ∀ m {d : ℕ+} (h : d ∣ m.1) (x : WittLevel m.1 R),
    frob m h (str m (Ideal.Quotient.mk _ (C x))) =
      str ⟨d, S.mem_of_dvd m.2 h⟩ (Ideal.Quotient.mk _ (C (BigWittVector.frobenius R h x)))
  versch_str : ∀ m {d : ℕ+} (h : d ∣ m.1) (x : WittLevel d R),
    versch m h (str ⟨d, S.mem_of_dvd m.2 h⟩ (Ideal.Quotient.mk _ (C x))) =
      str m (Ideal.Quotient.mk _ (C (BigWittVector.verschiebung R h x)))
  frob_versch : ∀ m {d : ℕ+} (h : d ∣ m.1) x, frob m h (versch m h x) = ((m.1 : ℕ) / d : ℕ) • x
  versch_frob : ∀ m {d : ℕ+} (h : d ∣ m.1) x,
    versch m h (frob m h x) = algebraMap ℤ[X] _ (qInt ℤ ((m.1 : ℕ) / d) d) * x

attribute [instance] QFVSystem.commRing QFVSystem.algebra

/-- Morphisms of q-FV-systems. -/
structure QFVSystem.Hom {R : Type u} [CommRing R] {S : TruncationSet} (W W' : QFVSystem R S) where
  /-- The components. -/
  app : ∀ m, W.obj m →ₐ[ℤ[X]] W'.obj m
  app_str : ∀ m, (app m).comp (W.str m) = W'.str m
  app_frob : ∀ m {d : ℕ+} (h : d ∣ m.1),
    (app ⟨d, S.mem_of_dvd m.2 h⟩).comp (W.frob m h) = (W'.frob m h).comp (app m)
  app_versch : ∀ m {d : ℕ+} (h : d ∣ m.1),
    (app m).toLinearMap.comp (W.versch m h) = (W'.versch m h).comp (app ⟨d, _⟩).toLinearMap

namespace QWittVector

variable (R : Type u) [CommRing R]

/-- The q-Witt vectors truncated at `S` as a q-FV-system. -/
def system (S : TruncationSet) : QFVSystem R S where
  obj m := QWittVector R m.1
  str m := sorry
  frob := fun _ {_} h => frobenius R h
  versch := fun _ {_} h => verschiebung R h
  frob_str := sorry
  versch_str := sorry
  frob_versch := sorry
  versch_frob := sorry

/-- q-Witt Lemma 2.9: `(q-W_m(R))_m` is the initial q-FV-system. -/
def lift (W : QFVSystem R TruncationSet.univ) : (system R TruncationSet.univ).Hom W := sorry

theorem lift_unique (W : QFVSystem R TruncationSet.univ) (f : (system R TruncationSet.univ).Hom W) :
    f.app = (lift R W).app := by
  sorry

/-- Remark 2.12: initiality among `S`-truncated q-FV-systems, for every truncation set `S`. -/
def truncatedLift (S : TruncationSet) (W : QFVSystem R S) : (system R S).Hom W := sorry

theorem truncatedLift_unique (S : TruncationSet) (W : QFVSystem R S) (f : (system R S).Hom W) :
    f.app = (truncatedLift R S W).app := by
  sorry

end QWittVector

section QWittTests

open QWittVector

-- test QWittVector.two_int (computation)
/- `q-W_2(ℤ) ≅ ℤ[q]/(q^2 - 1)`, `1 ↦ 1`, `V_2(1) ↦ 1 + q`. -/
example : ∃ e : QWittVector ℤ 2 ≃ₐ[ℤ[X]] ℤ[X] ⧸ Ideal.span {(X ^ 2 - 1 : ℤ[X])},
    e (verschiebung ℤ (one_dvd (2 : ℕ+)) 1) = Ideal.Quotient.mk _ (1 + X) := by
  sorry

-- test QWittVector.frobenius_verschiebung_two (computation)
/- `F_2(V_2(1)) = 2` and `V_2(F_2(1)) = 1 + q = [2]_q`; `q-W_1(ℤ) = ℤ` with `q = 1`. -/
example : frobenius ℤ (one_dvd (2 : ℕ+)) (verschiebung ℤ (one_dvd (2 : ℕ+)) 1) = 2 ∧
    verschiebung ℤ (one_dvd (2 : ℕ+)) (frobenius ℤ (one_dvd (2 : ℕ+)) 1) =
      algebraMap ℤ[X] _ (1 + X) ∧
    algebraMap ℤ[X] (QWittVector ℤ 1) X = 1 := by
  sorry

-- test QWittVector.teichmuller_two (computation)
/- `τ_2(2) = 3 + q` in `q-W_2(ℤ)`, with ghost values `2` at `q = -1` and `4` at `q = 1`. -/
example : teichmuller ℤ 2 2 = algebraMap ℤ[X] _ (3 + X) ∧
    ghost ℤ (dvd_refl (2 : ℕ+)) (teichmuller ℤ 2 2) = Ideal.Quotient.mk _ (C 2) ∧
    ghost ℤ (one_dvd (2 : ℕ+)) (teichmuller ℤ 2 2) = Ideal.Quotient.mk _ (C 4) := by
  sorry

-- test QWittVector.not_naive_quotient (non-example)
/- `q-W_2(ℤ)` has `ℤ`-rank `2`, `W_2(ℤ)[q]/(q^2 - 1)` has rank `4`: the generators of the second
kind cannot be omitted. -/
example : Module.finrank ℤ (QWittVector ℤ 2) = 2 ∧
    Module.finrank ℤ ((WittLevel 2 ℤ)[X] ⧸ Ideal.span {(X ^ 2 - 1 : (WittLevel 2 ℤ)[X])}) = 4 := by
  sorry

-- test QWittVector.not_q_deformation (non-example)
/- `q-W_2(ℤ)/(q - 1) ≅ ℤ`, whereas `W_2(ℤ)` has `ℤ`-rank `2` (q-Witt Remark 2.11). -/
example : Nonempty (QWittVector ℤ 2 ⧸ Ideal.span {algebraMap ℤ[X] (QWittVector ℤ 2) (X - 1)} ≃+* ℤ) ∧
    Module.finrank ℤ (WittLevel 2 ℤ) = 2 := by
  sorry

-- test QWittVector.ghost_not_injective_F2 (non-example)
/- `q-W_2(𝔽_2) ≅ ℤ/4` with `q = 1`; both ghost maps kill `2`, so without `p`-torsion-freeness the
ghost maps are not jointly injective. -/
example : (∃ e : QWittVector (ZMod 2) 2 ≃+* ZMod 4, e (algebraMap ℤ[X] _ X) = 1) ∧
    ¬ Function.Injective (fun x : QWittVector (ZMod 2) 2 =>
      fun d : {d : ℕ+ // d ∣ 2} => ghost (ZMod 2) d.2 x) := by
  sorry

-- test QWittVector.ofWitt_small (compatibility)
/- `W_2(ℤ) → q-W_2(ℤ)` is bijective, while `W_4(ℤ) → q-W_4(ℤ)` is injective but not surjective. -/
example : Function.Bijective (fromWitt ℤ 2) ∧ Function.Injective (fromWitt ℤ 4) ∧
    ¬ Function.Surjective (fromWitt ℤ 4) := by
  sorry

-- test QWittVector.one (degenerate)
example (R : Type u) [CommRing R] :
    Nonempty (QWittVector R 1 ≃+* R) ∧ algebraMap ℤ[X] (QWittVector R 1) X = 1 := by
  sorry

end QWittTests

/-! ### `HabiroRings:HR.4/there-is-no-restriction-map` -/

/-- `HabiroRings:HR.4/there-is-no-restriction-map` (q-Witt 1.3 and 2.14): a `ℤ[q]`-algebra map
`r : q-W_m(R) → q-W_d(R)`, `d ∣ m`, `d ≠ m`, compatible with `Res_{m/d}` induces
`R[ζ_m] → R[ζ_d]`, so `Φ_m(q) = 0` in `R[q]/Φ_d(q)`; for `m = p^α` and `p·1_R ≠ 0` no such `r`
exists. The maps that do exist between the levels are the `F_{m/d}` and `V_{m/d}`. -/
theorem QWittVector.no_restriction_map (R : Type u) [CommRing R] {m d : ℕ+} (h : d ∣ m)
    (hdm : d ≠ m) (r : QWittVector R m →ₐ[ℤ[X]] QWittVector R d)
    (hr : ∀ x, r (fromWitt R m x) = fromWitt R d (BigWittVector.restrict R h x)) :
    Ideal.Quotient.mk (Ideal.span {cyclotomic (d : ℕ) R}) (cyclotomic (m : ℕ) R) = 0 := by
  sorry

theorem QWittVector.not_exists_restriction_map (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    {α β : ℕ} (hβα : β < α) (hp : (p : R) ≠ 0) :
    ¬ ∃ r : QWittVector R (BigWittVector.primePow p α) →ₐ[ℤ[X]]
        QWittVector R (BigWittVector.primePow p β),
      ∀ x, r (fromWitt R _ x) =
        fromWitt R _ (BigWittVector.restrict R (m := BigWittVector.primePow p α)
          (d := BigWittVector.primePow p β) (PNat.dvd_iff.2 (pow_dvd_pow p hβα.le)) x) := by
  sorry

-- Acceptance: `Φ_9 ≡ 3` modulo `Φ_3`, and in characteristic `2` the reduction `ℤ/4 → 𝔽_2`
-- extends `Res_2`, so the hypothesis `p·1_R ≠ 0` cannot be dropped.
example : Ideal.Quotient.mk (Ideal.span {cyclotomic 3 ℤ}) (cyclotomic 9 ℤ) =
    Ideal.Quotient.mk _ (C 3) := by
  sorry

/-! ### `HabiroRings:HR.4/the-lambda-ring-comparison-maps` -/

namespace BigWittVector

/-- `ε_m : W_m(A) → A` (maps of sets), with `gh_m(x) = ∑_{d ∣ m} d·ψ^{m/d}(ε_d(Res_{m/d}(x)))`
(`ghost_eq_sum_epsilon`; q-Witt 2.31–2.34, for torsion-free `A`). -/
def epsilon {A : Type u} [CommRing A] (_Λ : LambdaRing A) (m : ℕ+) : WittLevel m A → A := sorry

theorem ghost_eq_sum_epsilon {A : Type u} [CommRing A] (Λ : LambdaRing A) (m : ℕ+)
    (x : WittLevel m A) :
    ghost _ A m (self_mem_divisors m) x = ∑ d : (m : ℕ).divisors, ((d : ℕ) : A) *
      Λ.adams (pnatDiv m (divisorPNat m d) (Nat.dvd_of_mem_divisors d.2))
        (epsilon Λ (divisorPNat m d) (restrict A (divisorPNat_dvd m d) x)) := by
  sorry

end BigWittVector

namespace QWittVector

variable {A : Type u} [CommRing A] (Λ : LambdaRing A)

/-- The trivial map `s_m : A[q]/(q^m - 1) → q-W_m(A)`, the `ℤ[q]`-linear extension of the section
`s : A → W_m(A)` of `gh_1` (a real definition from `BigWittVector.lambdaSection`). -/
def trivialMap (m : ℕ+) : A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} →+* QWittVector A m :=
  Ideal.Quotient.lift _ ((Ideal.Quotient.mk _).comp
    (Polynomial.mapRingHom (BigWittVector.lambdaSection Λ (TruncationSet.divisors m)))) sorry

/-- `gh_{m/d} ∘ s_m = ψ^{m/d} ∘ (A[q]/(q^m - 1) → A[q]/Φ_d(q))`. -/
@[simp] theorem ghost_trivialMap {m d : ℕ+} (h : d ∣ m) :
    (ghost A h).comp (trivialMap Λ m) =
      (cyclotomicQuotMap (Λ.adams (pnatDiv m d (PNat.dvd_iff.1 h))) d).comp (quotCyclotomic A h) := by
  sorry

/-- The ring map `c_m : q-W_m(A) → A[q]/(q^m - 1)` (q-Witt Lemma 2.34 and Corollary 2.35, whose
"Let R be" is a misprint for "Let A be", source issue `HabiroRings/E12`). -/
def cyclicMap (Λ : LambdaRing A) (m : ℕ+) :
    QWittVector A m →+* A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} := sorry

@[simp] theorem cyclicMap_ofWitt (m : ℕ+) (x : WittLevel m A) :
    cyclicMap Λ m (fromWitt A m x) = ∑ d : (m : ℕ).divisors, Ideal.Quotient.mk _
      (qInt A d ((m : ℕ) / d) * C (Λ.adams (pnatDiv m (divisorPNat m d) (Nat.dvd_of_mem_divisors d.2))
        (BigWittVector.epsilon Λ (divisorPNat m d)
          (BigWittVector.restrict A (divisorPNat_dvd m d) x)))) := by
  sorry

/-- `c_m ≡ ψ^d ∘ gh_{m/d}` modulo `Φ_d(q)`. -/
theorem cyclicMap_mod_cyclotomic {m d : ℕ+} (h : d ∣ m) :
    (quotCyclotomic A h).comp (cyclicMap Λ m) = (cyclotomicQuotMap (Λ.adams d) d).comp (ghost A h) := by
  sorry

theorem cyclicMap_frobenius {m d : ℕ+} (h : d ∣ m) :
    (quotXPow A h).comp (cyclicMap Λ m) = (cyclicMap Λ d).comp (frobenius A h).toRingHom := by
  sorry

/-- `c_m ∘ V_{m/d} = [m/d]_{q^d} · c_d`, for any lift of `c_d(x)` to `A[q]/(q^m - 1)`. -/
theorem cyclicMap_verschiebung {m d : ℕ+} (h : d ∣ m) (x : QWittVector A d)
    (z : A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])}) (hz : quotXPow A h z = cyclicMap Λ d x) :
    cyclicMap Λ m (verschiebung A h x) = Ideal.Quotient.mk _ (qInt A ((m : ℕ) / d) d) * z := by
  sorry

/-- `c_m ∘ s_m = ψ^m`, extended `ℤ[q]`-linearly. -/
theorem cyclicMap_trivialMap (m : ℕ+) :
    (cyclicMap Λ m).comp (trivialMap Λ m) = xPowQuotMap (Λ.adams m) m := by
  sorry

/-- If every `ψ^n` is injective, `c_m` is injective with image
`∑_{d ∣ m} [d]_{q^{m/d}} ψ^{m/d}(A)[q]/(q^m - 1)`. -/
theorem cyclicMap_injective (hΛ : ∀ n, Function.Injective (Λ.adams n)) (m : ℕ+) :
    Function.Injective (cyclicMap Λ m) ∧
      Set.range (cyclicMap Λ m) = {z | ∃ f : (m : ℕ).divisors → A[X],
        z = ∑ d : (m : ℕ).divisors, Ideal.Quotient.mk _
        (qInt A d ((m : ℕ) / d) *
          (f d).map (Λ.adams (pnatDiv m (divisorPNat m d) (Nat.dvd_of_mem_divisors d.2))))} := by
  sorry

/-- For a perfect Λ-ring, `c_m` is an isomorphism (q-Witt Corollary 2.37). -/
def cyclicMapEquivOfPerfect (_h : Λ.IsPerfect) (m : ℕ+) :
    QWittVector A m ≃+* A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} :=
  RingEquiv.ofBijective (cyclicMap Λ m) sorry

theorem trivialMap_bijective_of_perfect (h : Λ.IsPerfect) (m : ℕ+) :
    Function.Bijective (trivialMap Λ m) := by
  sorry

/-- `c_m` and `s_m` are natural in maps of Λ-rings. -/
theorem cyclicMap_natural {A' : Type v} [CommRing A'] {Λ' : LambdaRing A'} (f : Λ.Hom Λ')
    (m : ℕ+) :
    (xPowQuotMap f.toRingHom m).comp (cyclicMap Λ m) =
        (cyclicMap Λ' m).comp (map A f.toRingHom m).toRingHom ∧
      (trivialMap Λ' m).comp (xPowQuotMap f.toRingHom m) =
        (map A f.toRingHom m).toRingHom.comp (trivialMap Λ m) := by
  sorry

end QWittVector

section ComparisonTests

open QWittVector BigWittVector

-- test QWittVector.cyclicMap_two_int (computation)
/- For `A = ℤ`: `c_2(x) = gh_1(x) + (1 + q)(gh_2(x) - gh_1(x))/2`; `c_2(V_2(1)) = 1 + q` and
`c_2(τ_2(2)) = 3 + q`. -/
example (x : WittLevel 2 ℤ) :
    cyclicMap LambdaRing.trivialInt 2 (fromWitt ℤ 2 x) = Ideal.Quotient.mk _
      (C (ghost _ ℤ 1 (one_mem_divisors 2) x) + (1 + X) *
        C ((ghost _ ℤ 2 (self_mem_divisors 2) x - ghost _ ℤ 1 (one_mem_divisors 2) x) / 2)) ∧
    cyclicMap LambdaRing.trivialInt 2 (QWittVector.verschiebung ℤ (one_dvd (2 : ℕ+)) 1) =
      Ideal.Quotient.mk _ (1 + X) ∧
    cyclicMap LambdaRing.trivialInt 2 (QWittVector.teichmuller ℤ 2 2) =
      Ideal.Quotient.mk _ (3 + X) := by
  sorry

-- test QWittVector.cyclicMap_eval_two_int (characterisation)
/- `c_2(x)` is `gh_1(x)` at `q = -1` (modulo `Φ_2`) and `gh_2(x)` at `q = 1` (modulo `Φ_1`). -/
example (x : WittLevel 2 ℤ) :
    quotCyclotomic ℤ (dvd_refl (2 : ℕ+)) (cyclicMap LambdaRing.trivialInt 2 (fromWitt ℤ 2 x)) =
        Ideal.Quotient.mk _ (C (ghost _ ℤ 1 (one_mem_divisors 2) x)) ∧
      quotCyclotomic ℤ (one_dvd (2 : ℕ+)) (cyclicMap LambdaRing.trivialInt 2 (fromWitt ℤ 2 x)) =
        Ideal.Quotient.mk _ (C (ghost _ ℤ 2 (self_mem_divisors 2) x)) := by
  sorry

-- test QWittVector.cyclicMap_trivialMap_toric (computation)
/- Toric `ℤ[T]`: `s_2(T) = τ_2(T)` and `c_2(s_2(T)) = T^2 = ψ^2(T)`. -/
example : trivialMap (LambdaRing.toric (Fin 1)) 2 (Ideal.Quotient.mk _ (C (MvPolynomial.X 0 : MvPolynomial (Fin 1) ℤ))) =
      QWittVector.teichmuller _ 2 (MvPolynomial.X 0 : MvPolynomial (Fin 1) ℤ) ∧
    cyclicMap (LambdaRing.toric (Fin 1)) 2
        (trivialMap (LambdaRing.toric (Fin 1)) 2 (Ideal.Quotient.mk _ (C (MvPolynomial.X 0 : MvPolynomial (Fin 1) ℤ)))) =
      Ideal.Quotient.mk _ (C (MvPolynomial.X 0 ^ 2 : MvPolynomial (Fin 1) ℤ)) := by
  sorry

-- test QWittVector.cyclicMap_range_toric (non-example)
/- The image of `c_2` for toric `ℤ[T]` does not contain `T` (its image at `q = -1` is `ℤ[T^2]`):
`c_2` does not identify `q-W_2(ℤ[T])` with `ℤ[T][q]/(q^2 - 1)`. -/
example : Ideal.Quotient.mk _ (C (MvPolynomial.X 0 : MvPolynomial (Fin 1) ℤ)) ∉
    Set.range (cyclicMap (LambdaRing.toric (Fin 1)) 2) := by
  sorry

-- test QWittVector.cyclicMap_one (degenerate)
example {A : Type u} [CommRing A] (Λ : LambdaRing A) :
    Function.Bijective (cyclicMap Λ 1) ∧ (cyclicMap Λ 1).comp (trivialMap Λ 1) = RingHom.id _ := by
  sorry

-- test QWittVector.cyclicMapEquivOfPerfect_int (compatibility)
/- `q-W_m(ℤ) ≅ ℤ[q]/(q^m - 1)` for all `m`, with `c_2(V_2(1)) = 1 + q`. -/
example (h : LambdaRing.trivialInt.IsPerfect) :
    cyclicMapEquivOfPerfect LambdaRing.trivialInt h 2
      (QWittVector.verschiebung ℤ (one_dvd (2 : ℕ+)) 1) = Ideal.Quotient.mk _ (1 + X) ∧
    ∀ m : ℕ+, Function.Bijective (cyclicMapEquivOfPerfect LambdaRing.trivialInt h m) := by
  sorry

end ComparisonTests

/-! ### `HabiroRings:HR.4/relative-q-witt-rings` -/

/-- `A → R ⊗_{A,ψ^m} A`, `a ↦ 1 ⊗ a`: the structure map of the Frobenius twist as an `A`-algebra
through its right factor (a real definition). -/
def LambdaRing.twistRight {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R]
    [Algebra A R] (m : ℕ+) : A →+* Λ.twist R m :=
  (Algebra.TensorProduct.includeRight : Via (Λ.adams m) →ₐ[A] R ⊗[A] Via (Λ.adams m)).toRingHom.comp
    (Via.equiv (Λ.adams m)).toRingHom

/-- For a Λ-structure `ΛR` on an `A`-algebra `R` making `A → R` a Λ-map, the linearised Adams
operation `R ⊗_{A,ψ^m} A → R`, `r ⊗ a ↦ ψ_R^m(r)·a` (a real definition, through
`Algebra.TensorProduct.lift`). -/
def LambdaRing.linearisedAdams {A : Type u} [CommRing A] (Λ : LambdaRing A) {R : Type v}
    [CommRing R] [Algebra A R] (ΛR : LambdaRing R)
    (_hR : ∀ n, (algebraMap A R).comp (Λ.adams n) = (ΛR.adams n).comp (algebraMap A R))
    (m : ℕ+) : Λ.twist R m →+* R :=
  (Via.equiv ((algebraMap A R).comp (Λ.adams m))).symm.toRingHom.comp
    (Algebra.TensorProduct.lift
      ({ toRingHom := (Via.equiv ((algebraMap A R).comp (Λ.adams m))).toRingHom.comp (ΛR.adams m)
         commutes' := sorry } : R →ₐ[A] Via ((algebraMap A R).comp (Λ.adams m)))
      ({ toRingHom := (Via.equiv ((algebraMap A R).comp (Λ.adams m))).toRingHom.comp
           ((algebraMap A R).comp (Via.equiv (Λ.adams m)).symm.toRingHom)
         commutes' := sorry } : Via (Λ.adams m) →ₐ[A] Via ((algebraMap A R).comp (Λ.adams m)))
      (fun _ _ => Commute.all _ _)).toRingHom

namespace RelQWittVector

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R] [Algebra A R]

/-- `q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m - 1)`, with `q-W_m(R)` a `q-W_m(A)`-algebra through
functoriality and `A[q]/(q^m - 1)` through `c_m`. -/
def preTensor (m : ℕ+) : Type (max u v) :=
  Via (QWittVector.map A (algebraMap A R) m).toRingHom ⊗[QWittVector A m]
    Via (QWittVector.cyclicMap Λ m)

instance (m : ℕ+) : CommRing (preTensor Λ R m) :=
  inferInstanceAs (CommRing (Via (QWittVector.map A (algebraMap A R) m).toRingHom ⊗[QWittVector A m]
    Via (QWittVector.cyclicMap Λ m)))

/-- `x ⊗ w` in `q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m - 1)`. -/
def tmul {m : ℕ+} (x : QWittVector R m) (w : A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])}) :
    preTensor Λ R m :=
  (Via.equiv _ x) ⊗ₜ[QWittVector A m] (Via.equiv (QWittVector.cyclicMap Λ m) w)

/-- The ideal `U_m`, generated by `V_{m/d}(xy) ⊗ 1 - V_{m/d}(x) ⊗ c_d(y)` for `d ∣ m`,
`x ∈ q-W_d(R)`, `y ∈ q-W_d(A)`, and any lift of `c_d(y)` to `A[q]/(q^m - 1)` (q-Witt
Lemma 2.41). -/
def relIdeal (m : ℕ+) : Ideal (preTensor Λ R m) :=
  Ideal.span {z | ∃ (d : ℕ+) (h : d ∣ m) (x : QWittVector R d) (y : QWittVector A d)
      (w : A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])}),
    quotXPow A h w = QWittVector.cyclicMap Λ d y ∧
      z = tmul Λ R (QWittVector.verschiebung R h (x * QWittVector.map A (algebraMap A R) d y)) 1 -
        tmul Λ R (QWittVector.verschiebung R h x) w}

end RelQWittVector

/-- `HabiroRings:HR.4/relative-q-witt-rings` (`RelQWittVector`): the relative q-Witt vectors
`q-W_m(R/A) = (q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m - 1))/U_m`, an `A[q]/(q^m - 1)`-algebra (a real
definition: an honest quotient of an honest tensor product). -/
def RelQWittVector {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R]
    [Algebra A R] (m : ℕ+) : Type (max u v) :=
  RelQWittVector.preTensor Λ R m ⧸ RelQWittVector.relIdeal Λ R m

namespace RelQWittVector

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R] [Algebra A R]

instance (m : ℕ+) : CommRing (RelQWittVector Λ R m) :=
  inferInstanceAs (CommRing (preTensor Λ R m ⧸ relIdeal Λ R m))

/-- The surjection `q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m - 1) → q-W_m(R/A)`. -/
def mk (m : ℕ+) : preTensor Λ R m →+* RelQWittVector Λ R m := Ideal.Quotient.mk _

/-- The structure map `A[q]/(q^m - 1) → q-W_m(R/A)`, `w ↦ [1 ⊗ w]` (a real definition). -/
def ofCyc (m : ℕ+) : A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} →+* RelQWittVector Λ R m where
  toFun w := mk Λ R m (tmul Λ R 1 w)
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

instance (m : ℕ+) : Algebra A[X] (RelQWittVector Λ R m) :=
  ((ofCyc Λ R m).comp (Ideal.Quotient.mk _)).toAlgebra

instance (m : ℕ+) : Algebra A (RelQWittVector Λ R m) :=
  ((ofCyc Λ R m).comp ((Ideal.Quotient.mk _).comp C)).toAlgebra

/-- The map `q-W_m(R) → q-W_m(R/A)`, `x ↦ [x ⊗ 1]` (a real definition). -/
def ofAbs (m : ℕ+) : QWittVector R m →+* RelQWittVector Λ R m where
  toFun x := mk Λ R m (tmul Λ R x 1)
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- `F_{m/d} : q-W_m(R/A) → q-W_d(R/A)`, an `A[q]`-algebra map, for `d ∣ m`. -/
def frobenius {m d : ℕ+} (_h : d ∣ m) : RelQWittVector Λ R m →ₐ[A[X]] RelQWittVector Λ R d := sorry

/-- `V_{m/d} : q-W_d(R/A) → q-W_m(R/A)`, `A[q]`-linear, for `d ∣ m`. -/
def verschiebung {m d : ℕ+} (_h : d ∣ m) : RelQWittVector Λ R d →ₗ[A[X]] RelQWittVector Λ R m :=
  sorry

/-- `F_{m/d} V_{m/d} = m/d`, `V_{m/d} F_{m/d} = [m/d]_{q^d}`, and the composition laws along chains
of divisors. -/
theorem frobenius_verschiebung {m d e : ℕ+} (h : d ∣ m) (hed : e ∣ d) :
    (∀ x, frobenius Λ R h (verschiebung Λ R h x) = ((m : ℕ) / d : ℕ) • x) ∧
      (∀ x, verschiebung Λ R h (frobenius Λ R h x) = algebraMap A[X] _ (qInt A ((m : ℕ) / d) d) * x) ∧
      (frobenius Λ R hed).comp (frobenius Λ R h) = frobenius Λ R (dvd_trans hed h) ∧
      (verschiebung Λ R h).comp (verschiebung Λ R hed) = verschiebung Λ R (dvd_trans hed h) := by
  sorry

/-- The relative ghost map `gh_{m/d} : q-W_m(R/A) → R ⊗_{A,ψ^d} A[q]/Φ_d(q)`, `d ∣ m`. -/
def ghost {m d : ℕ+} (_h : d ∣ m) :
    RelQWittVector Λ R m →+* (Λ.twist R d)[X] ⧸ Ideal.span {cyclotomic (d : ℕ) (Λ.twist R d)} :=
  sorry

theorem ghost_eq_comp {m d : ℕ+} (h : d ∣ m) :
    ghost Λ R h = (ghost Λ R (dvd_refl d)).comp (frobenius Λ R h).toRingHom := by
  sorry

/-- `gh_{m/m}` is the quotient by the images of the `V_{m/d}`, `d ≠ m`. -/
theorem ghost_top_eq_quotient (m : ℕ+) :
    Function.Surjective (ghost Λ R (dvd_refl m)) ∧
      RingHom.ker (ghost Λ R (dvd_refl m)) =
        Ideal.span {y | ∃ (d : ℕ+) (h : d ∣ m), d ≠ m ∧ ∃ x, y = verschiebung Λ R h x} := by
  sorry

/-- For `A` perfectly covered and `R` `p`-torsion-free for the primes `p ∣ m`, the relative ghost
maps are jointly injective (from Lemma 2.23 by faithfully flat descent along `A → A_∞`). -/
theorem ghost_jointly_injective (hΛ : Λ.IsPerfectlyCovered) (m : ℕ+)
    (hR : ∀ p : ℕ, p.Prime → p ∣ (m : ℕ) → ∀ x : R, (p : R) * x = 0 → x = 0) :
    Function.Injective (fun x : RelQWittVector Λ R m =>
      fun d : {d : ℕ+ // d ∣ m} => ghost Λ R d.2 x) := by
  sorry

/-- Functoriality for a morphism of pairs: a Λ-map `f : A → A'` and a compatible `g : R → R'`. -/
def map {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} {R' : Type v} [CommRing R'] [Algebra A' R']
    (_f : Λ.Hom Λ') (_g : R →+* R')
    (_hg : _g.comp (algebraMap A R) = (algebraMap A' R').comp _f.toRingHom) (m : ℕ+) :
    RelQWittVector Λ R m →+* RelQWittVector Λ' R' m := sorry

theorem map_id (m : ℕ+) :
    map Λ R (LambdaRing.Hom.id Λ) (RingHom.id R) rfl m = RingHom.id _ := by
  sorry

theorem map_comp {A' A'' : Type u} [CommRing A'] [CommRing A''] {Λ' : LambdaRing A'}
    {Λ'' : LambdaRing A''} {R' R'' : Type v} [CommRing R'] [CommRing R''] [Algebra A' R']
    [Algebra A'' R''] (f : Λ.Hom Λ') (g : R →+* R')
    (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) (f' : Λ'.Hom Λ'')
    (g' : R' →+* R'') (hg' : g'.comp (algebraMap A' R') = (algebraMap A'' R'').comp f'.toRingHom)
    (m : ℕ+) :
    map Λ R (f'.comp Λ f) (g'.comp g) (by
        rw [RingHom.comp_assoc, hg, ← RingHom.comp_assoc, hg']; rfl) m =
      (map Λ' R' f' g' hg' m).comp (map Λ R f g hg m) := by
  sorry

/-- `map` is compatible with `F`, `V` and the relative ghost maps (the latter through the maps of
twists, `twistMap`). -/
theorem map_frobenius {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} {R' : Type v} [CommRing R']
    [Algebra A' R'] (f : Λ.Hom Λ') (g : R →+* R')
    (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) {m d : ℕ+} (h : d ∣ m) :
    (map Λ R f g hg d).comp (frobenius Λ R h).toRingHom =
        (frobenius Λ' R' h).toRingHom.comp (map Λ R f g hg m) ∧
      ∀ x, map Λ R f g hg m (verschiebung Λ R h x) = verschiebung Λ' R' h (map Λ R f g hg d x) := by
  sorry

/-- Base change (q-Witt Lemma 2.46): `q-W_m(R/A) ⊗_A A' ≅ q-W_m(R ⊗_A A'/A')` for a map of Λ-rings
`A → A'`. -/
def baseChangeEquiv {A' : Type u} [CommRing A'] [Algebra A A'] (Λ' : LambdaRing A')
    (_f : Λ.Hom Λ') (_hf : _f.toRingHom = algebraMap A A') (m : ℕ+) :
    A' ⊗[A] RelQWittVector Λ R m ≃+* RelQWittVector Λ' (A' ⊗[A] R) m := sorry

/-- `q-W_m(A/A) ≅ A[q]/(q^m - 1)`, with `F_{m/d}` the projection and `V_{m/d}` multiplication by
`[m/d]_{q^d}`. -/
def selfEquiv (m : ℕ+) : RelQWittVector Λ A m ≃+* A[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : A[X])} :=
  sorry

/-- For `A = ℤ`, `q-W_m(R/ℤ) ≅ q-W_m(R)` (q-Witt Remark 2.47 with the perfect Λ-ring `ℤ`). -/
def equivAbsolute (R : Type v) [CommRing R] (m : ℕ+) :
    RelQWittVector LambdaRing.trivialInt R m ≃+* QWittVector R m := sorry

/-- For a Λ-`A`-algebra `(R, ΛR)`, the comparison `c_{m/A} : q-W_m(R/A) → R[q]/(q^m - 1)`
(q-Witt 2.45). -/
def cyclicMap (ΛR : LambdaRing R)
    (_hR : ∀ n, (algebraMap A R).comp (Λ.adams n) = (ΛR.adams n).comp (algebraMap A R)) (m : ℕ+) :
    RelQWittVector Λ R m →+* R[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : R[X])} := sorry

/-- The relative trivial map `s_{m/A} : R ⊗_{A,ψ^m} A[q]/(q^m - 1) → q-W_m(R/A)` (a helper for
`cyclicMap`). -/
def trivialMap (ΛR : LambdaRing R)
    (_hR : ∀ n, (algebraMap A R).comp (Λ.adams n) = (ΛR.adams n).comp (algebraMap A R)) (m : ℕ+) :
    (Λ.twist R m)[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : (Λ.twist R m)[X])} →+* RelQWittVector Λ R m :=
  sorry

/-- `c_{m/A} ∘ s_{m/A}` is the linearised Adams operation `r ⊗ a ↦ ψ_R^m(r)·a`. -/
theorem cyclicMap_trivialMap (ΛR : LambdaRing R)
    (hR : ∀ n, (algebraMap A R).comp (Λ.adams n) = (ΛR.adams n).comp (algebraMap A R)) (m : ℕ+) :
    (cyclicMap Λ R ΛR hR m).comp (trivialMap Λ R ΛR hR m) =
      xPowQuotMap (Λ.linearisedAdams ΛR hR m) m := by
  sorry

/-- For `A` perfectly covered and `R` relatively perfect over `A` (every linearised Adams operation
bijective), `s_{m/A}` and `c_{m/A}` are isomorphisms (Remark 2.47). -/
theorem cyclicMapEquiv (hΛ : Λ.IsPerfectlyCovered) (ΛR : LambdaRing R)
    (hR : ∀ n, (algebraMap A R).comp (Λ.adams n) = (ΛR.adams n).comp (algebraMap A R))
    (hperf : ∀ n, Function.Bijective (Λ.linearisedAdams ΛR hR n)) (m : ℕ+) :
    Function.Bijective (cyclicMap Λ R ΛR hR m) ∧ Function.Bijective (trivialMap Λ R ΛR hR m) := by
  sorry

end RelQWittVector

/-- `HabiroRings:HR.4/relative-q-witt-rings` (`RelQFVSystem`): relative q-FV-systems (q-Witt
Definition 2.40): `A[q]`-algebras `W_m` with `A[q]`-algebra maps from
`q-W_m(R) ⊗_{q-W_m(A), c_m} A[q]/(q^m - 1)`, Frobenii and Verschiebungen compatible with those of
q-Witt vectors, `F V = m/d` and `V F = [m/d]_{q^d}`. -/
structure RelQFVSystem {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R]
    [Algebra A R] where
  /-- The rings `W_m`. -/
  obj : ℕ+ → Type (max u v)
  [commRing : ∀ m, CommRing (obj m)]
  [algebra : ∀ m, Algebra A[X] (obj m)]
  /-- The structure maps. -/
  str : ∀ m, RelQWittVector.preTensor Λ R m →+* obj m
  str_cyc : ∀ m (p : A[X]), str m (RelQWittVector.tmul Λ R 1 (Ideal.Quotient.mk _ p)) =
    algebraMap A[X] (obj m) p
  /-- The Frobenii. -/
  frob : ∀ {m d : ℕ+}, d ∣ m → obj m →ₐ[A[X]] obj d
  /-- The Verschiebungen. -/
  versch : ∀ {m d : ℕ+}, d ∣ m → obj d →ₗ[A[X]] obj m
  frob_str : ∀ {m d : ℕ+} (h : d ∣ m) (x : QWittVector R m),
    frob h (str m (RelQWittVector.tmul Λ R x 1)) =
      str d (RelQWittVector.tmul Λ R (QWittVector.frobenius R h x) 1)
  versch_str : ∀ {m d : ℕ+} (h : d ∣ m) (x : QWittVector R d),
    versch h (str d (RelQWittVector.tmul Λ R x 1)) =
      str m (RelQWittVector.tmul Λ R (QWittVector.verschiebung R h x) 1)
  frob_versch : ∀ {m d : ℕ+} (h : d ∣ m) x, frob h (versch h x) = ((m : ℕ) / d : ℕ) • x
  versch_frob : ∀ {m d : ℕ+} (h : d ∣ m) x,
    versch h (frob h x) = algebraMap A[X] _ (qInt A ((m : ℕ) / d) d) * x

attribute [instance] RelQFVSystem.commRing RelQFVSystem.algebra

/-- `HabiroRings:HR.4/relative-q-witt-rings` (`RelQWittVector.lift`): the unique morphism from
`q-W_•(R/A)` to a relative q-FV-system, compatible with `mk`, `F` and `V`. -/
def RelQWittVector.lift {A : Type u} [CommRing A] {Λ : LambdaRing A} {R : Type v} [CommRing R]
    [Algebra A R] (W : RelQFVSystem Λ R) (m : ℕ+) : RelQWittVector Λ R m →+* W.obj m := sorry

theorem RelQWittVector.lift_mk {A : Type u} [CommRing A] {Λ : LambdaRing A} {R : Type v}
    [CommRing R] [Algebra A R] (W : RelQFVSystem Λ R) :
    (∀ m, (RelQWittVector.lift W m).comp (RelQWittVector.mk Λ R m) = W.str m) ∧
      (∀ {m d : ℕ+} (h : d ∣ m), (RelQWittVector.lift W d).comp
        (RelQWittVector.frobenius Λ R h).toRingHom = (W.frob h).toRingHom.comp (RelQWittVector.lift W m)) ∧
      ∀ g : ∀ m, RelQWittVector Λ R m →+* W.obj m,
        (∀ m, (g m).comp (RelQWittVector.mk Λ R m) = W.str m) → g = RelQWittVector.lift W := by
  sorry

section RelQWittTests

open RelQWittVector

-- test RelQWittVector.one (degenerate)
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R] [Algebra A R] :
    Nonempty (RelQWittVector Λ R 1 ≃+* R) := by
  sorry

-- test RelQWittVector.selfEquiv_ops (computation)
/- `q-W_m(A/A) ≅ A[q]/(q^m - 1)`, with `F_{m/d}` the projection and `V_{m/d}` multiplication by
`[m/d]_{q^d}`; hence `F_{m/d} V_{m/d} = [m/d]_{q^d} mod (q^d - 1) = m/d`. -/
example {A : Type u} [CommRing A] (Λ : LambdaRing A) {m d : ℕ+} (h : d ∣ m) :
    (∀ x, selfEquiv Λ d (frobenius Λ A h x) = quotXPow A h (selfEquiv Λ m x)) ∧
      (∀ x z, quotXPow A h z = selfEquiv Λ d x →
        selfEquiv Λ m (verschiebung Λ A h x) = Ideal.Quotient.mk _ (qInt A ((m : ℕ) / d) d) * z) ∧
      quotXPow A h (Ideal.Quotient.mk _ (qInt A ((m : ℕ) / d) d)) =
        Ideal.Quotient.mk _ (C (((m : ℕ) / d : ℕ) : A)) := by
  sorry

-- test RelQWittVector.equivAbsolute_two (compatibility)
/- `q-W_2(ℤ/ℤ) ≅ ℤ[q]/(q^2 - 1) ≅ q-W_2(ℤ)`; in general `q-W_m(R/ℤ) ≅ q-W_m(R)` (`equivAbsolute`). -/
example : Nonempty (RelQWittVector LambdaRing.trivialInt ℤ 2 ≃+* ℤ[X] ⧸ Ideal.span {(X ^ 2 - 1 : ℤ[X])}) ∧
    Nonempty (QWittVector ℤ 2 ≃+* ℤ[X] ⧸ Ideal.span {(X ^ 2 - 1 : ℤ[X])}) := by
  sorry

-- test RelQWittVector.relative_ne_absolute_toric (non-example)
/- For `A = R = ℤ[T]` toric, `q-W_2(ℤ[T]/ℤ[T]) ≅ ℤ[T][q]/(q^2 - 1)`, while `c_2` embeds the absolute
`q-W_2(ℤ[T])` as a subring not containing `T`. -/
example : Nonempty (RelQWittVector (LambdaRing.toric (Fin 1)) (MvPolynomial (Fin 1) ℤ) 2 ≃+*
      (MvPolynomial (Fin 1) ℤ)[X] ⧸ Ideal.span {(X ^ 2 - 1 : (MvPolynomial (Fin 1) ℤ)[X])}) ∧
    Function.Injective (QWittVector.cyclicMap (LambdaRing.toric (Fin 1)) 2) ∧
    Ideal.Quotient.mk _ (C (MvPolynomial.X 0 : MvPolynomial (Fin 1) ℤ)) ∉
      Set.range (QWittVector.cyclicMap (LambdaRing.toric (Fin 1)) 2) := by
  sorry

-- test RelQWittVector.ghost_toric (characterisation)
/- For `A = R = ℤ[T]`, the relative ghost maps of `q-W_2(A/A) = A[q]/(q^2 - 1)` are the projections to
`A[q]/(q + 1)` and `A[q]/(q - 1)` after `a ⊗ b ↦ ψ^d(a) b`, and they are jointly injective. -/
example : (∀ {d : ℕ+} (h : d ∣ 2) (x : RelQWittVector (LambdaRing.toric (Fin 1)) (MvPolynomial (Fin 1) ℤ) 2),
      cyclotomicQuotMap ((LambdaRing.toric (Fin 1)).linearisedAdams (LambdaRing.toric (Fin 1))
          (fun _ => RingHom.ext fun _ => rfl) d) d (ghost _ _ h x) =
        quotCyclotomic _ h (selfEquiv _ 2 x)) ∧
    Function.Injective (fun x : RelQWittVector (LambdaRing.toric (Fin 1)) (MvPolynomial (Fin 1) ℤ) 2 =>
      fun d : {d : ℕ+ // d ∣ 2} => ghost _ _ d.2 x) := by
  sorry

end RelQWittTests

/-! ### `HabiroRings:HR.4/q-witt-vectors-of-etale-maps` and
`HabiroRings:HR.4/ghost-maps-and-etale-base-change` -/

namespace RelQWittVector

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) {R R' : Type v} [CommRing R] [CommRing R']
  [Algebra A R] [Algebra A R']

/-- The map `q-W_m(R/A) → q-W_m(R'/A)` of an `A`-algebra map `g`. -/
def mapAlg (g : R →ₐ[A] R') (m : ℕ+) : RelQWittVector Λ R m →+* RelQWittVector Λ R' m :=
  map Λ R (LambdaRing.Hom.id Λ) g.toRingHom sorry m

/-- `W_m(R) → q-W_m(R) → q-W_m(R/A)` (a real definition). -/
def wittToRel (R : Type v) [CommRing R] [Algebra A R] (m : ℕ+) :
    WittLevel m R →+* RelQWittVector Λ R m :=
  (ofAbs Λ R m).comp (QWittVector.fromWitt R m)

/-- The canonical map `W_m(R') ⊗_{W_m(R)} q-W_m(R/A) → q-W_m(R'/A)`. -/
def wittBaseChange (g : R →ₐ[A] R') (m : ℕ+) :
    Via (BigWittVector.map (TruncationSet.divisors m) R g.toRingHom) ⊗[WittLevel m R]
      Via (wittToRel Λ R m) →+* RelQWittVector Λ R' m := sorry

/-- The canonical map `q-W_m(R'/A) ⊗_{q-W_m(R/A), F_{m/d}} q-W_d(R/A) → q-W_d(R'/A)`. -/
def frobeniusBaseChange (g : R →ₐ[A] R') {m d : ℕ+} (_h : d ∣ m) :
    Via (mapAlg Λ g m) ⊗[RelQWittVector Λ R m] Via (frobenius Λ R _h).toRingHom →+*
      RelQWittVector Λ R' d := sorry

/-- `HabiroRings:HR.4/q-witt-vectors-of-etale-maps` (q-Witt Proposition 2.48): for an étale map
`g : R → R'` of `A`-algebras, (a) `W_m(R') ⊗_{W_m(R)} q-W_m(R/A) ≅ q-W_m(R'/A)`,
(b) `q-W_m(R/A) → q-W_m(R'/A)` is étale, (c) `q-W_m(R'/A) ⊗_{q-W_m(R/A), F_{m/d}} q-W_d(R/A) ≅
q-W_d(R'/A)` (the source prints the target of `F_{m/d}` as `q-W_{m/d}(R/A)`, source issue
`HabiroRings/E13`). No perfect covering is needed. -/
theorem of_etale_map (g : R →ₐ[A] R') (hg : g.toRingHom.Etale) (m : ℕ+) :
    Function.Bijective (wittBaseChange Λ g m) ∧ (mapAlg Λ g m).Etale ∧
      ∀ {d : ℕ+} (h : d ∣ m), Function.Bijective (frobeniusBaseChange Λ g h) := by
  sorry

/-- `HabiroRings:HR.4/q-witt-vectors-of-etale-maps`, last sentence: for `R` étale over `A`,
`q-W_m(R/A)` is étale over `q-W_m(A/A) ≅ A[q]/(q^m - 1)`. -/
theorem etale_ofCyc (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R] (m : ℕ+) :
    (ofCyc Λ R m).Etale := by
  sorry

/-- The map `q-W_m(R/A)/Φ_d(q) → R ⊗_{A,ψ^d} A[q]/Φ_d(q)` induced by `gh_{m/d}`. -/
def ghostQuot (R : Type v) [CommRing R] [Algebra A R] {m d : ℕ+} (h : d ∣ m) :
    RelQWittVector Λ R m ⧸ Ideal.span {algebraMap A[X] (RelQWittVector Λ R m) (cyclotomic (d : ℕ) A)}
      →+* (Λ.twist R d)[X] ⧸ Ideal.span {cyclotomic (d : ℕ) (Λ.twist R d)} :=
  Ideal.Quotient.lift _ (ghost Λ R h) sorry

/-- The canonical map `q-W_m(R'/A) ⊗_{q-W_m(R/A)} (R ⊗_{A,ψ^d} A[ζ_d]) → R' ⊗_{A,ψ^d} A[ζ_d]` of the
ghost square. -/
def ghostPushoutMap (g : R →ₐ[A] R') {m d : ℕ+} (_h : d ∣ m) :
    Via (mapAlg Λ g m) ⊗[RelQWittVector Λ R m]
      Via (B := (Λ.twist R d)[X] ⧸ Ideal.span {cyclotomic (d : ℕ) (Λ.twist R d)}) (ghost Λ R _h) →+*
      (Λ.twist R' d)[X] ⧸ Ideal.span {cyclotomic (d : ℕ) (Λ.twist R' d)} := sorry

/-- `HabiroRings:HR.4/ghost-maps-and-etale-base-change` (q-Witt Corollary 2.51): for an étale map
`R → R'` the ghost square is a pushout (underived; the derived pushout follows since
`q-W_m(R/A) → q-W_m(R'/A)` is flat by `of_etale_map`), and for `R` étale over `A`, `gh_{m/d}` induces
`q-W_m(R/A) ⊗_{A[q]/(q^m - 1)} A[q]/Φ_d(q) ≅ R ⊗_{A,ψ^d} A[q]/Φ_d(q)`. -/
theorem ghost_etale_pushout (g : R →ₐ[A] R') (hg : g.toRingHom.Etale) {m d : ℕ+} (h : d ∣ m) :
    Function.Bijective (ghostPushoutMap Λ g h) ∧
      ∀ [Algebra.Etale A R], Function.Bijective (ghostQuot Λ R h) := by
  sorry

end RelQWittVector

/-! ### `HabiroRings:HR.4/the-finite-relative-habiro-rings`

`H_{R/A,m}` is the `(q^m - 1)`-complete `E∞`-`A[q]`-algebra that Corollary 2.4 glues from the
`E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}` along the Frobenius gluings `h_d`. By the staticity clause of
Theorem 2.9 it is an ordinary ring, hence the ordinary limit over the poset `P` of these static
rings: the ring of families `(x_d)_{d ∣ m}`, `x_d ∈ E_d`, with `h_d(x_{pd}) = x_d` in `(E_d)^∧_p`
for every prime `p` with `pd ∣ m`. That ring is defined below (a real definition over the `sorry`
gluing maps, whose construction from `φ_{p/A}` is this node's work); its agreement with the
`E∞`-algebra of Corollary 2.4 is Theorem 2.9 (`HabiroRings:HR.4/the-etale-lift`), which needs the
missing derived carriers. -/

section FiniteStages

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R]

/-- `E_d = (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}` (classical; `Φ_d` is monic, so this is the derived
completion). -/
abbrev RelHabiroStage.localPiece (d : ℕ+) : Type (max v u) :=
  AdicCompletion (Ideal.span {cyclotomic (d : ℕ) (Λ.twist R d)}) (Λ.twist R d)[X]

/-- The Frobenius gluing `h_d : (E_{pd})^∧_p ≃ (E_d)^∧_p` for a prime `p`, induced by `φ_{p/A}`
through `R ⊗_{A,ψ^{pd}} A = (R ⊗_{A,ψ^p} A) ⊗_{A,ψ^d} A` and completed at `(p, Φ_d(q))`. -/
def RelHabiroStage.gluing (Λ : LambdaRing A) (_hΛ : Λ.IsPerfectlyCovered) (R : Type v) [CommRing R]
    [Algebra A R] [Algebra.Etale A R] (p : ℕ+) (_hp : (p : ℕ).Prime) (d : ℕ+) :
    pCompletion (RelHabiroStage.localPiece Λ R (p * d)) p ≃+*
      pCompletion (RelHabiroStage.localPiece Λ R d) p := sorry

/-- The ring of glued families `(x_d)_{d ∣ m}` with `h_d(x_{pd}) = x_d` after `p`-completion. -/
def relHabiroStageSubring (m : ℕ+) :
    Subring (∀ d : {d : ℕ+ // d ∣ m}, RelHabiroStage.localPiece Λ R d.1) where
  carrier := {x | ∀ (p : ℕ+) (hp : (p : ℕ).Prime) (d : ℕ+) (h : p * d ∣ m),
    RelHabiroStage.gluing Λ hΛ R p hp d (algebraMap _ _ (x ⟨p * d, h⟩)) =
      algebraMap _ _ (x ⟨d, dvd_trans (dvd_mul_left d p) h⟩)}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- `HabiroRings:HR.4/the-finite-relative-habiro-rings` (`RelHabiroStage`): `H_{R/A,m}`, as the
ordinary ring of glued families (see the section note). -/
def RelHabiroStage (m : ℕ+) : Type (max v u) := ↥(relHabiroStageSubring Λ hΛ R m)

namespace RelHabiroStage

instance (m : ℕ+) : CommRing (RelHabiroStage Λ hΛ R m) :=
  inferInstanceAs (CommRing ↥(relHabiroStageSubring Λ hΛ R m))

/-- The component `H_{R/A,m} → E_d`, `d ∣ m` (a real definition). -/
def component {m d : ℕ+} (h : d ∣ m) : RelHabiroStage Λ hΛ R m →+* localPiece Λ R d :=
  (Pi.evalRingHom (fun e : {e : ℕ+ // e ∣ m} => localPiece Λ R e.1) ⟨d, h⟩).comp
    (relHabiroStageSubring Λ hΛ R m).subtype

/-- The structure map `A[q] → H_{R/A,m}` (a real definition; `A` acts on each `E_d` through the
right factor of the twist). -/
def ofPoly (m : ℕ+) : A[X] →+* RelHabiroStage Λ hΛ R m where
  toFun f := ⟨fun d => algebraMap _ _ (f.map (Λ.twistRight R d.1)), sorry⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

instance (m : ℕ+) : Algebra A[X] (RelHabiroStage Λ hΛ R m) := (ofPoly Λ hΛ R m).toAlgebra

/-- `(H_{R/A,m})^∧_{Φ_d(q)} ≃ E_d`; under it `h_d` becomes the identity of
`(H_{R/A,m})^∧_{(Φ_d(q), Φ_{pd}(q))}`. -/
def completionEquiv {m d : ℕ+} (_h : d ∣ m) :
    AdicCompletion (Ideal.span {ofPoly Λ hΛ R m (cyclotomic (d : ℕ) A)}) (RelHabiroStage Λ hΛ R m)
      ≃+* localPiece Λ R d := sorry

theorem completionEquiv_algebraMap {m d : ℕ+} (h : d ∣ m) (x : RelHabiroStage Λ hΛ R m) :
    completionEquiv Λ hΛ R h (algebraMap _ _ x) = component Λ hΛ R h x := by
  sorry

/-- Under the components, `h_d` becomes the identity: for `pd ∣ m`, `h_d` carries the `p`-completed
`E_{pd}`-component of `H_{R/A,m}` to its `p`-completed `E_d`-component (the second clause of
`completionEquiv`, in the ring-level model). -/
theorem gluing_component (p : ℕ+) (hp : (p : ℕ).Prime) {m d : ℕ+} (h : p * d ∣ m) :
    (gluing Λ hΛ R p hp d).toRingHom.comp ((algebraMap _ _).comp (component Λ hΛ R h)) =
      (algebraMap _ _).comp (component Λ hΛ R (dvd_trans (dvd_mul_left d p) h)) := by
  sorry

/-- The transition `t_{m,d} : H_{R/A,m} → H_{R/A,d}`, `d ∣ m`: restriction of families (a real
definition), which is `H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d - 1)}` composed with the completion. -/
def transition {m d : ℕ+} (h : d ∣ m) : RelHabiroStage Λ hΛ R m →+* RelHabiroStage Λ hΛ R d where
  toFun x := ⟨fun e => x.1 ⟨e.1, dvd_trans e.2 h⟩, sorry⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- `H_{R/A,d} ≃ (H_{R/A,m})^∧_{(q^d - 1)}`, the preferred equivalence of Corollary 2.4. -/
theorem transition_completion {m d : ℕ+} (h : d ∣ m) :
    ∃ e : AdicCompletion (Ideal.span {ofPoly Λ hΛ R m (X ^ (d : ℕ) - 1)}) (RelHabiroStage Λ hΛ R m)
        ≃+* RelHabiroStage Λ hΛ R d,
      e.toRingHom.comp (algebraMap _ _) = transition Λ hΛ R h := by
  sorry

/-- Functoriality for a morphism of pairs. -/
def map {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} (hΛ' : Λ'.IsPerfectlyCovered)
    {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R'] (_f : Λ.Hom Λ')
    (_g : R →+* R') (_hg : _g.comp (algebraMap A R) = (algebraMap A' R').comp _f.toRingHom)
    (m : ℕ+) : RelHabiroStage Λ hΛ R m →+* RelHabiroStage Λ' hΛ' R' m := sorry

theorem map_id (m : ℕ+) :
    map Λ hΛ R hΛ (LambdaRing.Hom.id Λ) (RingHom.id R) rfl m = RingHom.id _ := by
  sorry

theorem map_comp {A' A'' : Type u} [CommRing A'] [CommRing A''] {Λ' : LambdaRing A'}
    {Λ'' : LambdaRing A''} (hΛ' : Λ'.IsPerfectlyCovered) (hΛ'' : Λ''.IsPerfectlyCovered)
    {R' R'' : Type v} [CommRing R'] [CommRing R''] [Algebra A' R'] [Algebra A'' R'']
    [Algebra.Etale A' R'] [Algebra.Etale A'' R''] (f : Λ.Hom Λ') (g : R →+* R')
    (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) (f' : Λ'.Hom Λ'')
    (g' : R' →+* R'') (hg' : g'.comp (algebraMap A' R') = (algebraMap A'' R'').comp f'.toRingHom)
    (m : ℕ+) :
    map Λ hΛ R hΛ'' (f'.comp Λ f) (g'.comp g) (by
        rw [RingHom.comp_assoc, hg, ← RingHom.comp_assoc, hg']; rfl) m =
      (map Λ' hΛ' R' hΛ'' f' g' hg' m).comp (map Λ hΛ R hΛ' f g hg m) := by
  sorry

/-- The map is compatible with the identifications `completionEquiv`. -/
theorem map_component {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} (hΛ' : Λ'.IsPerfectlyCovered)
    {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R'] (f : Λ.Hom Λ')
    (g : R →+* R') (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom)
    {m d : ℕ+} (h : d ∣ m) :
    ∃ gd : localPiece Λ R d →+* localPiece Λ' R' d,
      (component Λ' hΛ' R' h).comp (map Λ hΛ R hΛ' f g hg m) = gd.comp (component Λ hΛ R h) := by
  sorry

/-- Isomorphic étale presentations give equivalent `H_{R/A,m}`. -/
def equivOfIso {P Q : EtalePair.{u}} (_e : P ≅ Q) (m : ℕ+) :
    RelHabiroStage P.lambda P.isPerfectlyCovered P.R m ≃+*
      RelHabiroStage Q.lambda Q.isPerfectlyCovered Q.R m := sorry

/-- `H_{A/A,m} ≃ A[q]^∧_{(q^m - 1)}`. -/
def selfEquiv (m : ℕ+) :
    RelHabiroStage Λ hΛ A m ≃+* AdicCompletion (Ideal.span {(X ^ (m : ℕ) - 1 : A[X])}) A[X] :=
  sorry

end RelHabiroStage

section FiniteStageTests

open RelHabiroStage

-- test RelHabiroStage.one (degenerate)
/- `m = 1`: no prime edges, `H_{R/A,1} ≃ E_1 = R[q]^∧_{(q - 1)}`. -/
example : Nonempty (RelHabiroStage Λ hΛ R 1 ≃+* AdicCompletion (Ideal.span {(X - 1 : R[X])}) R[X]) := by
  sorry

-- test RelHabiroStage.int (computation)
/- `A = R = ℤ`: all `h_d` are identities and `H_{ℤ/ℤ,m} ≃ ℤ[q]^∧_{(q^m - 1)}` (Remark 2.8). -/
example (m : ℕ+) :
    Nonempty (RelHabiroStage LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ m ≃+*
      AdicCompletion (Ideal.span {(X ^ (m : ℕ) - 1 : ℤ[X])}) ℤ[X]) := by
  sorry

-- test RelHabiroStage.selfEquiv (compatibility)
/- For `R = A`, `a ⊗ b ↦ ψ^d(a) b` identifies `E_d` with `A[q]^∧_{Φ_d(q)}` and `h_d` with the identity,
so `H_{A/A,m} ≃ A[q]^∧_{(q^m - 1)}`, compatibly with the structure maps from `A[q]`. -/
example (m : ℕ+) (f : A[X]) :
    selfEquiv Λ hΛ m (ofPoly Λ hΛ A m f) = algebraMap A[X] _ f := by
  sorry

-- test RelHabiroStage.localised (computation)
/- `A = ℤ`, `R = ℤ[1/2]`, `m = 2`: `(E_2)^∧_2 = 0`, so no gluing, and
`H_{ℤ[1/2]/ℤ,2} ≃ ℤ[1/2][[q - 1]] × ℤ[1/2][[q + 1]] ≅ ℤ[1/2][q]^∧_{(q^2 - 1)}`. -/
example : Subsingleton (pCompletion (RelHabiroStage.localPiece LambdaRing.trivialInt
      (Localization.Away (2 : ℤ)) 2) 2) ∧
    Nonempty (RelHabiroStage LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
      (Localization.Away (2 : ℤ)) 2 ≃+*
        PowerSeries (Localization.Away (2 : ℤ)) × PowerSeries (Localization.Away (2 : ℤ))) ∧
    Nonempty (RelHabiroStage LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
      (Localization.Away (2 : ℤ)) 2 ≃+*
        AdicCompletion (Ideal.span {(X ^ 2 - 1 : (Localization.Away (2 : ℤ))[X])})
          (Localization.Away (2 : ℤ))[X]) := by
  sorry

end FiniteStageTests

/-! ### `HabiroRings:HR.4/the-etale-lift` and `HabiroRings:HR.4/the-transitions-are-frobenius` -/

/-- The identification `H_{R/A,m}/(q^m - 1) ≃ q-W_m(R/A)` of Theorem 2.9 (characterised by
`etale_lift`). -/
def RelHabiroStage.qWittEquiv (m : ℕ+) :
    RelHabiroStage Λ hΛ R m ⧸ Ideal.span {RelHabiroStage.ofPoly Λ hΛ R m (X ^ (m : ℕ) - 1)} ≃+*
      RelQWittVector Λ R m := sorry

/-- `HabiroRings:HR.4/the-etale-lift` (Theorem 2.9 at finite level, ring-level part; the printed
"R an A-algebra" must read "R an étale A-algebra", source issue `HabiroRings/E2`): the
identification `H_{R/A,m}/(q^m - 1) ≃ q-W_m(R/A)` reduces modulo each `Φ_d(q)` to the ghost
identification (`gh_{m/d}` against the reduction of the component `E_d`), `q^m - 1` is a
nonzerodivisor on `H_{R/A,m}`, and the identification is natural in morphisms of pairs. That
`H_{R/A,m}` is the unique `(q^m - 1)`-completely étale `E∞`-lift of `q-W_m(R/A)` is not stated here;
it needs derived `(q^m - 1)`-complete `E∞`-algebras and unique étale deformations (gap 'Unique
completed deformations of étale algebras'; supplier: DerivedDeRhamCohomology:DD.1,
EnhancedDerivedSheaves:E5:abstract). -/
theorem RelHabiroStage.etale_lift (m : ℕ+) :
    (∀ {d : ℕ+} (h : d ∣ m) (x : RelHabiroStage Λ hΛ R m),
      RelQWittVector.ghost Λ R h (RelHabiroStage.qWittEquiv Λ hΛ R m (Ideal.Quotient.mk _ x)) =
        (AdicCompletion.evalOneₐ _).toRingHom (RelHabiroStage.component Λ hΛ R h x)) ∧
    (∀ y : RelHabiroStage Λ hΛ R m, RelHabiroStage.ofPoly Λ hΛ R m (X ^ (m : ℕ) - 1) * y = 0 → y = 0) ∧
    ∀ {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} (hΛ' : Λ'.IsPerfectlyCovered)
      {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R'] (f : Λ.Hom Λ')
      (g : R →+* R') (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom)
      (x : RelHabiroStage Λ hΛ R m),
      RelHabiroStage.qWittEquiv Λ' hΛ' R' m
          (Ideal.Quotient.mk _ (RelHabiroStage.map Λ hΛ R hΛ' f g hg m x)) =
        RelQWittVector.map Λ R f g hg m (RelHabiroStage.qWittEquiv Λ hΛ R m (Ideal.Quotient.mk _ x)) := by
  sorry

/-- `HabiroRings:HR.4/the-transitions-are-frobenius` (Remark 2.10): the transitions form a functor
on the positive integers ordered by divisibility (`t_{m,m} = id`, `t_{d,e} ∘ t_{m,d} = t_{m,e}`),
and modulo `q^m - 1`, `q^d - 1` they induce the q-Witt **Frobenius** `F_{m/d}`, not a restriction
(there is none, `QWittVector.no_restriction_map`); the system is natural in morphisms of pairs. -/
theorem RelHabiroStage.transitions_are_frobenius {m d e : ℕ+} (h : d ∣ m) (hed : e ∣ d) :
    RelHabiroStage.transition Λ hΛ R (dvd_refl m) = RingHom.id _ ∧
      (RelHabiroStage.transition Λ hΛ R hed).comp (RelHabiroStage.transition Λ hΛ R h) =
        RelHabiroStage.transition Λ hΛ R (dvd_trans hed h) ∧
      (∀ x, RelHabiroStage.qWittEquiv Λ hΛ R d
          (Ideal.Quotient.mk _ (RelHabiroStage.transition Λ hΛ R h x)) =
        RelQWittVector.frobenius Λ R h (RelHabiroStage.qWittEquiv Λ hΛ R m (Ideal.Quotient.mk _ x))) ∧
      ∀ {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} (hΛ' : Λ'.IsPerfectlyCovered)
        {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R'] (f : Λ.Hom Λ')
        (g : R →+* R') (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom),
        (RelHabiroStage.transition Λ' hΛ' R' h).comp (RelHabiroStage.map Λ hΛ R hΛ' f g hg m) =
          (RelHabiroStage.map Λ hΛ R hΛ' f g hg d).comp (RelHabiroStage.transition Λ hΛ R h) := by
  sorry

-- Acceptance of `the-transitions-are-frobenius`: `t_{2,1} ∘ t_{4,2} = t_{4,1}`.
example : (RelHabiroStage.transition Λ hΛ R (one_dvd (2 : ℕ+))).comp
      (RelHabiroStage.transition Λ hΛ R (⟨2, rfl⟩ : (2 : ℕ+) ∣ 4)) =
    RelHabiroStage.transition Λ hΛ R (one_dvd (4 : ℕ+)) := by
  sorry

end FiniteStages

/- `limit_of_finite_stages_is_static` (`HabiroRings:HR.4/the-limit-of-the-finite-stages-is-static`,
the last clause of Theorem 2.9): not stated here; needs the derived limit in `D(A[q])` over the
divisibility poset, Habiro-completeness and staticity (supplier: DerivedDeRhamCohomology:DD.1,
EnhancedDerivedSheaves:E0; the detection result `HabiroRings:HR.2/the-detection-results`). The
ordinary limit of the rings `RelHabiroStage` is `HabiroRings.relativeHabiro` below; that it is the
derived limit is exactly this node. -/

/-! ## HR.5 — the relative Habiro ring

`H_{R/A} = lim_m H_{R/A,m}` over the positive integers ordered by divisibility (2.7 with (2.1)). Its
terms are ordinary rings (Theorem 2.9), so the limit is the ordinary limit of the rings
`RelHabiroStage` along the Frobenius transitions; that this ordinary limit is the derived one, and
that it is static and Habiro-complete, is
`HabiroRings:HR.4/the-limit-of-the-finite-stages-is-static` (a comment: it needs derived limits). -/

section RelativeHabiro

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R]

instance (m : ℕ+) : Algebra A (RelHabiroStage Λ hΛ R m) :=
  ((RelHabiroStage.ofPoly Λ hΛ R m).comp C).toAlgebra

/-- The compatible families `(x_m)_m`, `t_{m,d}(x_m) = x_d`. -/
def HabiroRings.relativeHabiroSubring : Subring (∀ m : ℕ+, RelHabiroStage Λ hΛ R m) where
  carrier := {x | ∀ (m d : ℕ+) (h : d ∣ m), RelHabiroStage.transition Λ hΛ R h (x m) = x d}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- `HabiroRings:HR.5/the-relative-habiro-ring` (`HabiroRings.relativeHabiro`): the relative Habiro
ring `H_{R/A} = lim_m H_{R/A,m}` for `R` étale over a perfectly covered Λ-ring `A`. -/
def HabiroRings.relativeHabiro : Type (max v u) := ↥(HabiroRings.relativeHabiroSubring Λ hΛ R)

namespace HabiroRings.relativeHabiro

instance : CommRing (relativeHabiro Λ hΛ R) :=
  inferInstanceAs (CommRing ↥(relativeHabiroSubring Λ hΛ R))

/-- The projections `π_m : H_{R/A} → H_{R/A,m}` (a real definition). -/
def proj (m : ℕ+) : relativeHabiro Λ hΛ R →+* RelHabiroStage Λ hΛ R m :=
  (Pi.evalRingHom (fun m : ℕ+ => RelHabiroStage Λ hΛ R m) m).comp
    (relativeHabiroSubring Λ hΛ R).subtype

theorem transition_proj {m d : ℕ+} (h : d ∣ m) :
    (RelHabiroStage.transition Λ hΛ R h).comp (proj Λ hΛ R m) = proj Λ hΛ R d := by
  sorry

theorem ext {x y : relativeHabiro Λ hΛ R} (h : ∀ m, proj Λ hΛ R m x = proj Λ hΛ R m y) : x = y := by
  sorry

/-- The universal property of the limit: a compatible family of maps `B → H_{R/A,m}` factors
uniquely through `H_{R/A}` (in ordinary rings for every `B`; the packet states it for
Habiro-complete `A[q]`-algebras `B`, for which the ordinary and derived limits agree). -/
def lift {B : Type w} [CommRing B] (f : ∀ m, B →+* RelHabiroStage Λ hΛ R m)
    (_hf : ∀ (m d : ℕ+) (h : d ∣ m), (RelHabiroStage.transition Λ hΛ R h).comp (f m) = f d) :
    B →+* relativeHabiro Λ hΛ R :=
  (RingHom.pi f).codRestrict (relativeHabiroSubring Λ hΛ R) sorry

theorem proj_lift {B : Type w} [CommRing B] (f : ∀ m, B →+* RelHabiroStage Λ hΛ R m)
    (hf : ∀ (m d : ℕ+) (h : d ∣ m), (RelHabiroStage.transition Λ hΛ R h).comp (f m) = f d)
    (m : ℕ+) : (proj Λ hΛ R m).comp (lift Λ hΛ R f hf) = f m ∧
      ∀ g : B →+* relativeHabiro Λ hΛ R, (∀ m, (proj Λ hΛ R m).comp g = f m) →
        g = lift Λ hΛ R f hf := by
  sorry

/-- The structure map `A[q] → H_{R/A}` (a real definition, through `lift`). -/
def ofPoly : A[X] →+* relativeHabiro Λ hΛ R :=
  lift Λ hΛ R (fun m => RelHabiroStage.ofPoly Λ hΛ R m) (fun _ _ _ => sorry)

instance : Algebra A[X] (relativeHabiro Λ hΛ R) := (ofPoly Λ hΛ R).toAlgebra

/-- The level `(n + 1)!` of the cofinal factorial chain. -/
def factorialLevel (n : ℕ) : ℕ+ := ⟨(n + 1).factorial, Nat.factorial_pos _⟩

theorem factorialLevel_dvd (n : ℕ) : factorialLevel n ∣ factorialLevel (n + 1) :=
  PNat.dvd_iff.2 (Nat.factorial_dvd_factorial (Nat.le_succ _))

/-- The limit over the chain `{n!}`. -/
def factorialSubring : Subring (∀ n : ℕ, RelHabiroStage Λ hΛ R (factorialLevel n)) where
  carrier := {x | ∀ n, RelHabiroStage.transition Λ hΛ R (factorialLevel_dvd n) (x (n + 1)) = x n}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- The limit over the cofinal chain `{n!}` is canonically `H_{R/A}` (footnote (2.1)). -/
def factorialEquiv : ↥(factorialSubring Λ hΛ R) ≃+* relativeHabiro Λ hΛ R := sorry

-- HabiroRings.relativeHabiro.isStatic: not stated here; needs `H_{R/A}` as an object of the
-- derived category `D(A[q])` and staticity (supplier: DerivedDeRhamCohomology:DD.1,
-- EnhancedDerivedSheaves:E1; proof through `HabiroRings:HR.2/the-detection-results`).
-- HabiroRings.relativeHabiro.isHabiroComplete: not stated here; needs `IsHabiroComplete` of
-- `HabiroRings:HR.2/habiro-complete-modules` (supplier: EnhancedDerivedSheaves:E1,
-- DerivedDeRhamCohomology:DD.1).

/-- `(H_{R/A})^∧_{(q^m - 1)} ≃ H_{R/A,m}` (classical completion; `q^m - 1` is a nonzerodivisor on the
static `H_{R/A}`, so it is the derived one). -/
def completionEquiv (m : ℕ+) :
    AdicCompletion (Ideal.span {ofPoly Λ hΛ R (X ^ (m : ℕ) - 1)}) (relativeHabiro Λ hΛ R) ≃+*
      RelHabiroStage Λ hΛ R m := sorry

/-- `(H_{R/A})^∧_{Φ_d(q)} ≃ (R ⊗_{A,ψ^d} A)[q]^∧_{Φ_d(q)}`; for `d = 1` this is `R[[q - 1]]`. -/
def cyclotomicCompletionEquiv (d : ℕ+) :
    AdicCompletion (Ideal.span {ofPoly Λ hΛ R (cyclotomic (d : ℕ) A)}) (relativeHabiro Λ hΛ R) ≃+*
      RelHabiroStage.localPiece Λ R d := sorry

/-- `H_{R/A}/(q^m - 1) ≃ q-W_m(R/A)` (Theorem 2.9). -/
def quotientEquiv (m : ℕ+) :
    relativeHabiro Λ hΛ R ⧸ Ideal.span {ofPoly Λ hΛ R (X ^ (m : ℕ) - 1)} ≃+* RelQWittVector Λ R m :=
  sorry

/-- Under `quotientEquiv`, the transition `H/(q^m - 1) → H/(q^d - 1)` is the Frobenius `F_{m/d}`
(Remark 2.10). -/
theorem quotientEquiv_frobenius {m d : ℕ+} (h : d ∣ m) (x : relativeHabiro Λ hΛ R) :
    quotientEquiv Λ hΛ R d (Ideal.Quotient.mk _ x) =
      RelQWittVector.frobenius Λ R h (quotientEquiv Λ hΛ R m (Ideal.Quotient.mk _ x)) := by
  sorry

/-- The ring map `H_{R/A} → H_{R'/A'}` of a morphism of pairs. -/
def map {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'} (hΛ' : Λ'.IsPerfectlyCovered)
    {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R'] (f : Λ.Hom Λ')
    (g : R →+* R') (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) :
    relativeHabiro Λ hΛ R →+* relativeHabiro Λ' hΛ' R' :=
  lift Λ' hΛ' R' (fun m => (RelHabiroStage.map Λ hΛ R hΛ' f g hg m).comp (proj Λ hΛ R m))
    (fun _ _ _ => sorry)

theorem map_id :
    map Λ hΛ R hΛ (LambdaRing.Hom.id Λ) (RingHom.id R) rfl = RingHom.id _ := by
  sorry

theorem map_comp {A' A'' : Type u} [CommRing A'] [CommRing A''] {Λ' : LambdaRing A'}
    {Λ'' : LambdaRing A''} (hΛ' : Λ'.IsPerfectlyCovered) (hΛ'' : Λ''.IsPerfectlyCovered)
    {R' R'' : Type v} [CommRing R'] [CommRing R''] [Algebra A' R'] [Algebra A'' R'']
    [Algebra.Etale A' R'] [Algebra.Etale A'' R''] (f : Λ.Hom Λ') (g : R →+* R')
    (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) (f' : Λ'.Hom Λ'')
    (g' : R' →+* R'') (hg' : g'.comp (algebraMap A' R') = (algebraMap A'' R'').comp f'.toRingHom) :
    map Λ hΛ R hΛ'' (f'.comp Λ f) (g'.comp g) (by
        rw [RingHom.comp_assoc, hg, ← RingHom.comp_assoc, hg']; rfl) =
      (map Λ' hΛ' R' hΛ'' f' g' hg').comp (map Λ hΛ R hΛ' f g hg) := by
  sorry

end HabiroRings.relativeHabiro

end RelativeHabiro

section RelativeHabiroTests

open HabiroRings

-- test HabiroRings.relativeHabiro_zero (degenerate)
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) (R : Type v)
    [CommRing R] [Algebra A R] [Algebra.Etale A R] [Subsingleton R] :
    Subsingleton (relativeHabiro Λ hΛ R) := by
  sorry

-- test HabiroRings.relativeHabiro_self (degenerate)
/- `H_{A/A} ≅ A[q]^ℕ = lim_m A[q]^∧_{(q^m - 1)}`; for `A = ℤ` Habiro's ring. -/
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) :
    ∃ e : relativeHabiro Λ hΛ A ≃+* CycloCompletion A Set.univ,
      ∀ f, e (relativeHabiro.ofPoly Λ hΛ A f) = CycloCompletion.fromPoly A Set.univ f := by
  sorry

-- test HabiroRings.relativeHabiro_quotient_Phi4_gaussian (computation)
/- `A = ℤ`, `R = ℤ[i][1/2]`: `H/Φ_4(q) ≅ R[q]/(q^2 + 1) ≅ R × R` (`q^2 + 1 = (q - i)(q + i)` and
`(q - i) - (q + i) = -2i` is a unit), and `H/(q - 1) ≅ R`; adjoining `ζ_4` through one embedding
would give `R`. -/
example [Algebra.Etale ℤ GaussianHalf] :
    Nonempty (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        GaussianHalf ⧸ Ideal.span {relativeHabiro.ofPoly
          LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int _ (cyclotomic 4 ℤ)} ≃+*
      GaussianHalf × GaussianHalf) ∧
    Nonempty (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        GaussianHalf ⧸ Ideal.span {relativeHabiro.ofPoly
          LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int _ (X - 1)} ≃+*
      GaussianHalf) ∧
    IsUnit (algebraMap GaussianInt GaussianHalf (-2 * ⟨0, 1⟩)) := by
  sorry

-- test HabiroRings.relativeHabiro_qMinusOne (compatibility)
/- `(H_{R/A})^∧_{(q - 1)} ≅ R[[q - 1]]`, compatibly with the projection to `H_{R/A,1}`. -/
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) (R : Type v)
    [CommRing R] [Algebra A R] [Algebra.Etale A R] :
    Nonempty (AdicCompletion (Ideal.span {relativeHabiro.ofPoly Λ hΛ R (X - 1)})
      (relativeHabiro Λ hΛ R) ≃+* PowerSeries R) ∧
    Nonempty (RelHabiroStage Λ hΛ R 1 ≃+* PowerSeries R) := by
  sorry

-- test HabiroRings.relativeHabiro_quotient_qWitt (compatibility)
/- `H_{R/A}/(q^m - 1) ≅ q-W_m(R/A)` (`relativeHabiro.quotientEquiv`); for `A = R = ℤ` it is
`ℤ[q]/(q^m - 1)`, by `q-W_m(ℤ) ≅ ℤ[q]/(q^m - 1)`. -/
example (m : ℕ+) :
    Nonempty (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ ⧸
      Ideal.span {relativeHabiro.ofPoly LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ
        (X ^ (m : ℕ) - 1)} ≃+* ℤ[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : ℤ[X])}) := by
  sorry

-- test HabiroRings.relativeHabiro_not_localisation (non-example)
/- `q - 1` is not a unit of `H_{ℤ/ℤ}`: its image in `ℤ[[q - 1]]` is not invertible. -/
example : ¬ IsUnit (relativeHabiro.ofPoly LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
    ℤ (X - 1)) := by
  sorry

-- test HabiroRings.relativeHabiro_not_naive (non-example)
/- For `R = ℤ[∛2][1/6]`, `H_{R/ℤ,5}` is not `R[q]^∧_{(q^5 - 1)}` as a `ℤ[q]`-algebra
(`HabiroRings:HR.7/the-stage-is-not-the-naive-completion`). -/
example [Algebra.Etale ℤ CubeRootTwo] :
    ¬ ∃ e : RelHabiroStage LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        CubeRootTwo 5 ≃+*
        AdicCompletion (Ideal.span {(X ^ 5 - 1 : CubeRootTwo[X])}) CubeRootTwo[X],
      e (RelHabiroStage.ofPoly LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int _ 5 X) =
        algebraMap CubeRootTwo[X] _ X := by
  sorry

end RelativeHabiroTests

/-! ### `HabiroRings:HR.5/roots-choices-and-substitutions`

The coefficient algebra at `m` is the full `(R ⊗_{A,ψ^m} A) ⊗_ℤ ℤ[ζ_m]`, written here in its
embedding-free form `(R ⊗_{A,ψ^m} A)[x]/Φ_m(x)` (the packet's own `≅`), in which the class `x̄`
of `x` plays the role of `ζ_m`; no root is selected through an embedding. The compatible system of
roots enters through the maps between levels: `ℤ[ζ_m] → ℤ[ζ_{pm}]` sends `ζ_m` to `ζ_{pm}^k` for
the exponent `k` with `ζ_{pm}^k = ζ_m` (`CompatibleRoots.exponent`). Since every other compatible
system is `ζ^a`, `a ∈ Ẑ^×`, with the same exponents, the Galois isomorphisms
`σ_a : T_m(ζ) ≅ T_m(ζ^a)` of the packet become the identity of the embedding-free `T_m`, and
change-of-choice invariance is the statement that `can`, `φ` and `τ` do not depend on the system
(`CompatibleRoots.galoisEquiv_comm`). -/

/-- `HabiroRings:HR.5/roots-choices-and-substitutions` (`HabiroRings.CompatibleRoots`): primitive
`m`-th roots of unity `ζ_m ∈ ℂ` with `ζ_{mn} = ζ_m ζ_n` for coprime `m, n` and
`ζ_{p^α} = ζ_{p^{α+1}}^p` (2.11). The traditional `e^{2πi/m}` is not such a system. -/
structure HabiroRings.CompatibleRoots where
  /-- The roots. -/
  ζ : ℕ+ → ℂ
  isPrimitiveRoot : ∀ m : ℕ+, IsPrimitiveRoot (ζ m) m
  mul_coprime : ∀ m n : ℕ+, Nat.Coprime m n → ζ (m * n) = ζ m * ζ n
  pow_prime_pow : ∀ (p : ℕ+), (p : ℕ).Prime → ∀ α : ℕ, ζ (p ^ α) = ζ (p ^ (α + 1)) ^ (p : ℕ)

namespace HabiroRings.CompatibleRoots

/-- The standard system `ζ_m := ∏_p e^{2πi/p^{v_p(m)}}` (a real definition of the roots). -/
def standard : CompatibleRoots where
  ζ m := ∏ p ∈ (m : ℕ).primeFactors,
    Complex.exp (2 * Real.pi * Complex.I / ((p ^ (m : ℕ).factorization p : ℕ) : ℂ))
  isPrimitiveRoot := sorry
  mul_coprime := sorry
  pow_prime_pow := sorry

/-- The inverse system `(ζ_m⁻¹)_m` (the change of choice by `a = -1`; a real definition). -/
def inv (ζ : CompatibleRoots) : CompatibleRoots where
  ζ m := (ζ.ζ m)⁻¹
  isPrimitiveRoot := sorry
  mul_coprime := sorry
  pow_prime_pow := sorry

/-- The exponent `k < n` with `ζ_n^k = ζ_m`, for `m ∣ n` (a real definition). -/
def exponent (ζ : CompatibleRoots) {m n : ℕ+} (h : m ∣ n) : ℕ :=
  ((ζ.isPrimitiveRoot n).eq_pow_of_pow_eq_one (ξ := ζ.ζ m) (by
    obtain ⟨k, hk⟩ := PNat.dvd_iff.1 h
    rw [hk, pow_mul, (ζ.isPrimitiveRoot m).pow_eq_one, one_pow])).choose

/-- `ζ_m - ζ_{pm}` is topologically nilpotent `p`-adically: some `p`-power of it lies in
`p·ℤ[ζ_{pm}]`, since `ζ_m/ζ_{pm}` has `p`-power order. -/
theorem sub_topologicallyNilpotent (ζ : CompatibleRoots) (p : ℕ+) (hp : (p : ℕ).Prime) (m : ℕ+) :
    ∃ e : ℕ, ∃ y ∈ Algebra.adjoin ℤ {ζ.ζ (p * m)},
      (ζ.ζ m - ζ.ζ (p * m)) ^ ((p : ℕ) ^ e) = (p : ℂ) * y := by
  sorry

end HabiroRings.CompatibleRoots

section Roots

open HabiroRings

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R]

/-- `HabiroRings.coeffAlgebra`: the full coefficient algebra `(R ⊗_{A,ψ^m} A)[ζ_m] :=
(R ⊗_{A,ψ^m} A) ⊗_ℤ ℤ[ζ_m] ≅ (R ⊗_{A,ψ^m} A)[x]/Φ_m(x)`, never a quotient through one embedding. -/
abbrev HabiroRings.coeffAlgebra (m : ℕ+) : Type (max v u) :=
  (Λ.twist R m)[X] ⧸ Ideal.span {cyclotomic (m : ℕ) (Λ.twist R m)}

/-- `HabiroRings.taylorFactor`: `T_m := (R ⊗_{A,ψ^m} A)[ζ_m][[q - ζ_m]]` (the power series variable
is `q - ζ_m`). -/
abbrev HabiroRings.taylorFactor (m : ℕ+) : Type (max v u) := PowerSeries (coeffAlgebra Λ R m)

/-- The `p`-adic coefficient algebra `(R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}]`, the full
`(R̂_p ⊗_{A,ψ^m} A)^∧_p[x]/Φ_{pm}(x)`. -/
abbrev HabiroRings.padicCoeff (p m : ℕ+) : Type (max v u) :=
  (pCompletion (Λ.twist (pCompletion R p) m) p)[X] ⧸
    Ideal.span {cyclotomic ((p * m : ℕ+) : ℕ) (pCompletion (Λ.twist (pCompletion R p) m) p)}

/-- `HabiroRings.taylorFactor` (the `p`-adic factor): `T_{p,m} :=
(R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}][[q - ζ_m]]`. -/
abbrev HabiroRings.taylorFactor.padic (p m : ℕ+) : Type (max v u) :=
  PowerSeries (padicCoeff Λ R p m)

/-- The coefficient map `(R ⊗_{A,ψ^m} A)[ζ_m] → (R̂_p ⊗_{A,ψ^m} A)^∧_p[ζ_{pm}]`: extension of
coefficients `R → R̂_p`, completion, and `ζ_m ↦ ζ_{pm}^k` with `k = ζ.exponent (m ∣ pm)`. -/
def HabiroRings.canonicalCoeffMap (_ζ : CompatibleRoots) (p m : ℕ+) :
    coeffAlgebra Λ R m →+* padicCoeff Λ R p m := sorry

/-- `HabiroRings.canonicalMap`: `can_{p,m} : T_m → T_{p,m}`, extension of coefficients with the
variable `q - ζ_m` kept (a real definition over the coefficient map: `PowerSeries.map`, so it
never re-expands). -/
def HabiroRings.canonicalMap (ζ : CompatibleRoots) (p m : ℕ+) :
    taylorFactor Λ R m →+* taylorFactor.padic Λ R p m :=
  PowerSeries.map (canonicalCoeffMap Λ R ζ p m)

/-- `HabiroRings.frobeniusMap`: `φ_{p,m} : T_{pm} → T_{p,m}`, `φ_{p/A} ⊗ id` on coefficients
(through `R ⊗_{A,ψ^{pm}} A = (R ⊗_{A,ψ^p} A) ⊗_{A,ψ^m} A`) followed by the re-expansion
`q - ζ_{pm} = (q - ζ_m) + (ζ_m - ζ_{pm})` of HC.3, defined only after `p`-completion. -/
def HabiroRings.frobeniusMap (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) (R : Type v)
    [CommRing R] [Algebra A R] [Algebra.Etale A R] (ζ : CompatibleRoots) (p : ℕ+)
    (hp : (p : ℕ).Prime) (m : ℕ+) :
    taylorFactor Λ R (p * m) →+* taylorFactor.padic Λ R p m := sorry

/-- `HabiroRings.taylorComponent`: `τ_m : (R ⊗_{A,ψ^m} A)[q]^∧_{Φ_m(q)} → T_m`,
`q ↦ ζ_m + (q - ζ_m)`. -/
def HabiroRings.taylorComponent (m : ℕ+) :
    RelHabiroStage.localPiece Λ R m →+* taylorFactor Λ R m := sorry

/-- The constant coefficient of `τ_m(f)` is the value of `f` at `ζ_m`, i.e. `f mod Φ_m(q)`. -/
theorem HabiroRings.constantCoeff_taylorComponent (m : ℕ+) (x : RelHabiroStage.localPiece Λ R m) :
    PowerSeries.constantCoeff (taylorComponent Λ R m x) = AdicCompletion.evalOneₐ _ x := by
  sorry

-- HabiroRings.frobeniusMap_int: not stated here; needs HC.3's re-expansion `rex_{ζ_m - ζ_{pm}}`
-- (supplier: HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion); the test
-- `frobeniusMap_int_example` below states its value on the variable.

/-- `HabiroRings.CompatibleRoots.galoisEquiv`: the change-of-choice isomorphism
`σ_a : T_m(ζ) ≅ T_m(ζ^a)` between two compatible systems. In the embedding-free coefficient
algebra it is the identity of `T_m` (see the section note), and its content is
`galoisEquiv_comm`. -/
def HabiroRings.CompatibleRoots.galoisEquiv (_ζ _ζ' : CompatibleRoots) (m : ℕ+) :
    taylorFactor Λ R m ≃+* taylorFactor Λ R m :=
  RingEquiv.refl _

/-- `σ_a` intertwines `can`, `φ` and `τ`: in the embedding-free form, these do not depend on the
compatible system. -/
theorem HabiroRings.CompatibleRoots.galoisEquiv_comm (ζ ζ' : CompatibleRoots) (p : ℕ+)
    (hp : (p : ℕ).Prime) (m : ℕ+) :
    ζ.exponent (dvd_mul_left m p) = ζ'.exponent (dvd_mul_left m p) ∧
      canonicalMap Λ R ζ p m = canonicalMap Λ R ζ' p m ∧
      frobeniusMap Λ hΛ R ζ p hp m = frobeniusMap Λ hΛ R ζ' p hp m := by
  sorry

end Roots

section RootsTests

open HabiroRings

-- test HabiroRings.CompatibleRoots.standard_two_adic (non-example)
/- For the standard system `ζ_6 = ζ_2 ζ_3 = -ζ_3`, so `ζ_3 - ζ_6 = 2ζ_3` is `2`-adically small,
whereas `e^{2πi/3} - e^{2πi/6} = -1` is a unit: the traditional roots admit no `2`-adic
re-expansion from order `6` to order `3`. -/
example : CompatibleRoots.standard.ζ 6 = -CompatibleRoots.standard.ζ 3 ∧
    CompatibleRoots.standard.ζ 3 - CompatibleRoots.standard.ζ 6 =
      2 * CompatibleRoots.standard.ζ 3 ∧
    Complex.exp (2 * Real.pi * Complex.I / 3) - Complex.exp (2 * Real.pi * Complex.I / 6) = -1 := by
  sorry

-- test HabiroRings.taylorComponent_value_ne_expansion (computation)
/- In `E_3` for `A = R = ℤ`, `f = 1 - q^3` and `0` have the same value `0` at `ζ_3`, but
`τ_3(f) = -3ζ_3^2 X - 3ζ_3 X^2 - X^3 ≠ 0` with `X = q - ζ_3`. -/
example :
    let x : coeffAlgebra LambdaRing.trivialInt ℤ 3 := Ideal.Quotient.mk _ X
    let f : RelHabiroStage.localPiece LambdaRing.trivialInt ℤ 3 :=
      algebraMap _ _ ((1 - X ^ 3 : ℤ[X]).map (LambdaRing.trivialInt.twistRight ℤ 3))
    PowerSeries.constantCoeff (taylorComponent LambdaRing.trivialInt ℤ 3 f) = 0 ∧
      taylorComponent LambdaRing.trivialInt ℤ 3 f =
        -(3 * PowerSeries.C (x ^ 2) * PowerSeries.X + 3 * PowerSeries.C x * PowerSeries.X ^ 2 +
          PowerSeries.X ^ 3) ∧
      taylorComponent LambdaRing.trivialInt ℤ 3 f ≠ 0 := by
  sorry

-- test HabiroRings.coeffAlgebra_gaussian (non-example)
/- `A = ℤ`, `R = ℤ[i][1/2]`, `m = 4`: `(R ⊗ ℤ[ζ_4]) ≅ R × R`; `e = (1 - i ⊗ ζ_4)/2` is a non-trivial
idempotent (sent to `1` by `ζ_4 ↦ i`, to `0` by `ζ_4 ↦ -i`), so one embedding loses a factor. -/
example [Algebra.Etale ℤ GaussianHalf] (i half : LambdaRing.trivialInt.twist GaussianHalf 4)
    (hi : i ^ 2 = -1) (hhalf : 2 * half = 1) :
    let e : coeffAlgebra LambdaRing.trivialInt GaussianHalf 4 :=
      Ideal.Quotient.mk _ (C half * (1 - C i * X))
    Nonempty (coeffAlgebra LambdaRing.trivialInt GaussianHalf 4 ≃+* GaussianHalf × GaussianHalf) ∧
      IsIdempotentElem e ∧ e ≠ 0 ∧ e ≠ 1 := by
  sorry

-- test HabiroRings.frobeniusMap_int_example (computation)
/- `A = R = ℤ`, `p = 2`, `m = 1`: `φ_{2,1}` sends `q + 1 = q - ζ_2` to `(q - 1) + 2`, and `can_{2,1}`
is the inclusion `ℤ[[q - 1]] ⊂ ℤ_2[[q - 1]]`. -/
example (ζ : CompatibleRoots) :
    frobeniusMap LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ ζ 2 Nat.prime_two 1
        PowerSeries.X = PowerSeries.X + 2 ∧
      Function.Injective (canonicalMap LambdaRing.trivialInt ℤ ζ 2 1) := by
  sorry

-- test HabiroRings.CompatibleRoots.galoisEquiv_neg_one (characterisation)
/- For `a = -1`: `σ_{-1}` commutes with `can` and `φ`, and `σ_{-1} ∘ τ_m(ζ) = τ_m(ζ⁻¹)`. -/
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) (R : Type v)
    [CommRing R] [Algebra A R] [Algebra.Etale A R] (ζ : CompatibleRoots) (p : ℕ+)
    (hp : (p : ℕ).Prime) (m : ℕ+) :
    canonicalMap Λ R ζ p m = canonicalMap Λ R ζ.inv p m ∧
      frobeniusMap Λ hΛ R ζ p hp m = frobeniusMap Λ hΛ R ζ.inv p hp m ∧
      (CompatibleRoots.galoisEquiv Λ R ζ ζ.inv m).toRingHom.comp (taylorComponent Λ R m) =
        taylorComponent Λ R m := by
  sorry

-- test HabiroRings.rex_needs_completion (non-example)
/- The re-expansion of `∑_k (q - 1)^k` at `ζ_3` would need `∑_k (ζ_3 - 1)^k`, meaningless in the
discrete `ℤ[ζ_3]` (`1 - ζ_3` is not nilpotent) and convergent in `ℤ_3[ζ_3]`, since
`(1 - ζ_3)^2 = -3ζ_3`. -/
example : (1 - CompatibleRoots.standard.ζ 3) ^ 2 = -3 * CompatibleRoots.standard.ζ 3 ∧
    ¬ IsNilpotent (1 - Ideal.Quotient.mk (Ideal.span {cyclotomic 3 ℤ}) (X : ℤ[X])) := by
  sorry

end RootsTests

/-! ### `HabiroRings:HR.5/the-equaliser-presentation` -/

section Equaliser

open HabiroRings

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R] (ζ : CompatibleRoots)

/-- The pairs `(p, m)` with `p` prime. -/
abbrev PrimeLevel : Type := {x : ℕ+ × ℕ+ // (x.1 : ℕ).Prime}

/-- The Taylor components `H_{R/A} → ∏_m T_m` (a real definition: the `Φ_m(q)`-components
followed by `τ_m`). -/
def HabiroRings.taylorProd : relativeHabiro Λ hΛ R →+* ∀ m : ℕ+, taylorFactor Λ R m :=
  RingHom.pi fun m => (taylorComponent Λ R m).comp
    ((RelHabiroStage.component Λ hΛ R (dvd_refl m)).comp (relativeHabiro.proj Λ hΛ R m))

/-- `can : ∏_m T_m → ∏_{p,m} T_{p,m}`, `can_{p,m}` on the factor `m` (a real definition). -/
def HabiroRings.canProd : (∀ m : ℕ+, taylorFactor Λ R m) →+*
    ∀ x : PrimeLevel, taylorFactor.padic Λ R x.1.1 x.1.2 :=
  RingHom.pi fun x => (canonicalMap Λ R ζ x.1.1 x.1.2).comp
    (Pi.evalRingHom (fun m : ℕ+ => taylorFactor Λ R m) x.1.2)

/-- `φ/A : ∏_m T_m → ∏_{p,m} T_{p,m}`, `φ_{p,m}` on the factor `pm` (a real definition). -/
def HabiroRings.frobProd : (∀ m : ℕ+, taylorFactor Λ R m) →+*
    ∀ x : PrimeLevel, taylorFactor.padic Λ R x.1.1 x.1.2 :=
  RingHom.pi fun x => (frobeniusMap Λ hΛ R ζ x.1.1 x.2 x.1.2).comp
    (Pi.evalRingHom (fun m : ℕ+ => taylorFactor Λ R m) (x.1.1 * x.1.2))

/-- The equaliser `eq(can, φ/A) ⊆ ∏_m T_m`, Mathlib's `RingHom.eqLocus`. -/
def HabiroRings.equaliserSubring : Subring (∀ m : ℕ+, taylorFactor Λ R m) :=
  @RingHom.eqLocus (∀ m : ℕ+, taylorFactor Λ R m) _
    (∀ x : PrimeLevel, taylorFactor.padic Λ R x.1.1 x.1.2) _ (canProd Λ R ζ) (frobProd Λ hΛ R ζ)

/-- `HabiroRings:HR.5/the-equaliser-presentation` (Lemma 2.12, ring-level): the Taylor components
identify `H_{R/A}` with the equaliser of `can` and `φ/A`, i.e. with the subring
`RingHom.eqLocus can (φ/A)` of `∏_m T_m` (whose universal property is
`CommRingCat.equalizerForkIsLimit`). The `E∞` form is not stated here (supplier:
EnhancedDerivedSheaves:E5:abstract). The ℓ-adic step of the source's proof is repaired by
`ell_adic_taylor_comparison` (source issue `HabiroRings/E5`). -/
theorem HabiroRings.equaliser_presentation :
    Function.Injective (taylorProd Λ hΛ R) ∧
      (taylorProd Λ hΛ R).range = equaliserSubring Λ hΛ R ζ ∧
      Nonempty (relativeHabiro Λ hΛ R ≃+* equaliserSubring Λ hΛ R ζ) := by
  sorry

end Equaliser

/-! ### `HabiroRings:HR.5/the-ell-adic-taylor-comparison` -/

section TaylorComparison

/-- `HabiroRings:HR.5/the-ell-adic-taylor-comparison` (a): for a prime `ℓ ∤ m`,
`q ↦ ζ_m + (q - ζ_m)` is an isomorphism `ℤ_ℓ[q]^∧_{(ℓ, Φ_m(q))} ≅ ℤ_ℓ[ζ_m][[q - ζ_m]]`, with
`ℤ_ℓ[ζ_m] = ℤ_ℓ[x]/Φ_m(x)` the full algebra. Modulo `(ℓ, Φ_m)` both sides are `𝔽_ℓ[q]/Φ_m(q)`, finite
étale over `𝔽_ℓ` (`Φ_m` is separable, not irreducible), a product of `φ(m)/f` copies of `𝔽_{ℓ^f}`,
`f` the order of `ℓ` modulo `m`, and a field only when `ℓ` generates `(ℤ/m)^×`. -/
theorem ell_adic_taylor_comparison (ℓ : ℕ) [Fact ℓ.Prime] (m : ℕ+) (hℓm : ¬ ℓ ∣ (m : ℕ)) :
    (∃ e : AdicCompletion (Ideal.span {C (ℓ : ℤ_[ℓ]), cyclotomic (m : ℕ) ℤ_[ℓ]}) ℤ_[ℓ][X] ≃+*
        PowerSeries (ℤ_[ℓ][X] ⧸ Ideal.span {cyclotomic (m : ℕ) ℤ_[ℓ]}),
      ∀ f : ℤ_[ℓ][X], e (algebraMap _ _ f) =
        f.eval₂ (PowerSeries.C.comp ((Ideal.Quotient.mk _).comp C))
          (PowerSeries.C (Ideal.Quotient.mk _ X) + PowerSeries.X)) ∧
    Algebra.Etale (ZMod ℓ) ((ZMod ℓ)[X] ⧸ Ideal.span {cyclotomic (m : ℕ) (ZMod ℓ)}) ∧
    Nonempty ((ZMod ℓ)[X] ⧸ Ideal.span {cyclotomic (m : ℕ) (ZMod ℓ)} ≃+*
      (Fin ((m : ℕ).totient / orderOf (ℓ : ZMod m)) → GaloisField ℓ (orderOf (ℓ : ZMod m)))) ∧
    (IsField ((ZMod ℓ)[X] ⧸ Ideal.span {cyclotomic (m : ℕ) (ZMod ℓ)}) ↔
      orderOf (ℓ : ZMod m) = (m : ℕ).totient) := by
  sorry

/-- `HabiroRings:HR.5/the-ell-adic-taylor-comparison` (b), componentwise: for a factorisation
`Φ_m = G_1 ⋯ G_r` over `ℤ_ℓ` into monic factors with pairwise coprime reductions (the Hensel lift
of the distinct irreducible factors modulo `ℓ`), the isomorphism of (a) is the product of the
isomorphisms `ℤ_ℓ[q]^∧_{(ℓ, G_i(q))} ≅ (ℤ_ℓ[x]/G_i)[[q - x_i]]`. -/
theorem ell_adic_taylor_comparison_componentwise (ℓ : ℕ) [Fact ℓ.Prime] (m : ℕ+)
    (hℓm : ¬ ℓ ∣ (m : ℕ)) {r : ℕ} (G : Fin r → ℤ_[ℓ][X]) (hG : ∀ i, (G i).Monic)
    (hprod : ∏ i, G i = cyclotomic (m : ℕ) ℤ_[ℓ])
    (hcop : Pairwise fun i j => IsCoprime ((G i).map (PadicInt.toZMod (p := ℓ)))
      ((G j).map (PadicInt.toZMod (p := ℓ)))) :
    ∃ e : AdicCompletion (Ideal.span {C (ℓ : ℤ_[ℓ]), cyclotomic (m : ℕ) ℤ_[ℓ]}) ℤ_[ℓ][X] ≃+*
        ∀ i, PowerSeries (ℤ_[ℓ][X] ⧸ Ideal.span {G i}),
      ∀ (f : ℤ_[ℓ][X]) (i : Fin r), e (algebraMap _ _ f) i =
        f.eval₂ (PowerSeries.C.comp ((Ideal.Quotient.mk _).comp C))
          (PowerSeries.C (Ideal.Quotient.mk _ X) + PowerSeries.X) := by
  sorry

/-- `HabiroRings:HR.5/the-ell-adic-taylor-comparison` (c): `ℚ[q]^∧_{Φ_m(q)} ≅ ℚ(ζ_m)[[q - ζ_m]]`. -/
theorem rat_taylor_comparison (m : ℕ+) :
    ∃ e : AdicCompletion (Ideal.span {cyclotomic (m : ℕ) ℚ}) ℚ[X] ≃+*
        PowerSeries (AdjoinRoot (cyclotomic (m : ℕ) ℚ)),
      ∀ f : ℚ[X], e (algebraMap _ _ f) =
        f.eval₂ (PowerSeries.C.comp (AdjoinRoot.of _)) (PowerSeries.C (AdjoinRoot.root _) +
          PowerSeries.X) := by
  sorry

end TaylorComparison

/-! ### `HabiroRings:HR.5/untwisted-relative-habiro-rings` and
`HabiroRings:HR.5/completed-base-change` -/

section Untwisted

open HabiroRings

/-- The completion map `R[q]^∧_{(q^m - 1)} → R[q]^∧_{(q^d - 1)}` for `d ∣ m`. -/
def xPowCompletionMap (R : Type v) [CommRing R] {m d : ℕ+} (_h : d ∣ m) :
    AdicCompletion (Ideal.span {(X ^ (m : ℕ) - 1 : R[X])}) R[X] →+*
      AdicCompletion (Ideal.span {(X ^ (d : ℕ) - 1 : R[X])}) R[X] :=
  adicCompletionMap (RingHom.id _) sorry

/-- `HabiroRings:HR.5/untwisted-relative-habiro-rings` (the positive side of Remark 2.8): if `R`
carries a Λ-structure `ΛR` for which `A → R` is a Λ-map (global compatible Frobenius lifts
`ψ^m_R`) and every linearisation `R ⊗_{A,ψ^m} A → R` is an isomorphism, then
`H_{R/A,m} ≅ R[q]^∧_{(q^m - 1)}` compatibly with the transitions (which become the completion
maps), and `H_{R/A} ≅ R[q]^ℕ`, HC.1's cyclotomic completion. -/
theorem untwisted_relative_habiro {A : Type u} [CommRing A] (Λ : LambdaRing A)
    (hΛ : Λ.IsPerfectlyCovered) (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R]
    (ΛR : LambdaRing R)
    (hR : ∀ n, (algebraMap A R).comp (Λ.adams n) = (ΛR.adams n).comp (algebraMap A R))
    (hlin : ∀ n, Function.Bijective (Λ.linearisedAdams ΛR hR n)) :
    (∃ e : ∀ m : ℕ+, RelHabiroStage Λ hΛ R m ≃+*
        AdicCompletion (Ideal.span {(X ^ (m : ℕ) - 1 : R[X])}) R[X],
      ∀ (m d : ℕ+) (h : d ∣ m), (e d).toRingHom.comp (RelHabiroStage.transition Λ hΛ R h) =
        (xPowCompletionMap R h).comp (e m).toRingHom) ∧
    Nonempty (relativeHabiro Λ hΛ R ≃+* CycloCompletion R Set.univ) := by
  sorry

/-- The trivial Λ-structure on `ℤ[1/N]` (every `ψ^m` the identity; a helper for the `ℤ[1/N]`
instance of `untwisted_relative_habiro`). -/
def LambdaRing.trivialLocalization (N : ℕ) : LambdaRing (Localization.Away (N : ℤ)) where
  adams := 1
  isAddTorsionFree := sorry
  adams_prime_sub_pow_mem := sorry

-- Acceptance instances of `untwisted_relative_habiro`: `R = A` (in particular `A = ℤ`, the toric
-- `ℤ[x]`), and `A = ℤ`, `R = ℤ[1/N]`.
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) :
    Nonempty (relativeHabiro Λ hΛ A ≃+* CycloCompletion A Set.univ) :=
  (untwisted_relative_habiro Λ hΛ A Λ (fun _ => RingHom.ext fun _ => rfl) (fun _ => sorry)).2

example (N : ℕ) :
    Nonempty (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
      (Localization.Away (N : ℤ)) ≃+* CycloCompletion (Localization.Away (N : ℤ)) Set.univ) := by
  sorry

end Untwisted

section BaseChange

open HabiroRings

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type u) [CommRing R] [Algebra A R] [Algebra.Etale A R]

/-- `HabiroRings:HR.5/completed-base-change` (ring-level, for flat `A → A'`, where the derived
tensor product is the ordinary one): for a map of perfectly covered Λ-rings `A → A'` and
`R' = A' ⊗_A R`, the maps of the morphism of pairs give
`(A' ⊗_A H_{R/A,m})^∧_{(q^m - 1)} ≅ H_{R'/A',m}`. The completion is always needed (the non-example
below). The derived form for non-flat `A'` and the Habiro-completed form
`(H_{R/A} ⊗^L_{A[q]} A'[q])^∧_H ≃ H_{R'/A'}` are not stated here; they need derived tensor
products and `habiroCompletion` (supplier: EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1,
`HabiroRings:HR.2/habiro-complete-modules`). -/
theorem completed_base_change {A' : Type u} [CommRing A'] [Algebra A A'] [Module.Flat A A']
    (Λ' : LambdaRing A') (hΛ' : Λ'.IsPerfectlyCovered) (f : Λ.Hom Λ')
    (_hf : f.toRingHom = algebraMap A A') (m : ℕ+) :
    Nonempty (AdicCompletion (Ideal.span {(1 : A') ⊗ₜ[A]
        RelHabiroStage.ofPoly Λ hΛ R m (X ^ (m : ℕ) - 1)}) (A' ⊗[A] RelHabiroStage Λ hΛ R m) ≃+*
      RelHabiroStage Λ' hΛ' (A' ⊗[A] R) m) := by
  sorry

/-- The completion cannot be dropped: for `A = R = ℤ` and the toric `A' = ℤ[x]`,
`H ⊗_ℤ ℤ[x] = H[x] → H_{ℤ[x]/ℤ[x]} ≅ ℤ[x][q]^ℕ` is not surjective (`∑_N x^N (q;q)_N` is missed). -/
theorem completed_base_change_not_uncompleted :
    ¬ Function.Surjective (Polynomial.eval₂RingHom
      (CycloCompletion.mapRing ℤ Set.univ (algebraMap ℤ (MvPolynomial (Fin 1) ℤ)))
      (CycloCompletion.fromPoly (MvPolynomial (Fin 1) ℤ) Set.univ (C (MvPolynomial.X 0)))) := by
  sorry

end BaseChange

/-! ### `HabiroRings:HR.5-number-field-comparison` -/

section NumberFieldComparison

open HabiroRings NumberField

/-- `HabiroRings:HR.5-number-field-comparison/the-classical-ring` (Remark 2.14), parts (a) and
(b): `H_{ℤ/ℤ} ≅ H = ℤ[q]^ℕ` compatibly with `ℤ[q]`, and `H` is the equaliser of `can` and `φ/ℤ`
(pure re-expansion, `φ_{p/ℤ} = id`). Part (c), that the `m`-th projection is HC.3's Taylor map
`σ_{ζ_m}`, is not stated here; it needs HC.3's Taylor map (supplier:
HabiroCyclotomicCompletions:HC.3/the-taylor-map). -/
theorem classical_ring (ζ : CompatibleRoots) :
    (∃ e : relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ ≃+* HabiroRing ℤ,
      ∀ f, e (relativeHabiro.ofPoly _ _ ℤ f) = CycloCompletion.fromPoly ℤ Set.univ f) ∧
    Function.Injective (taylorProd LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ) ∧
    (taylorProd LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ).range =
      equaliserSubring LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ ζ := by
  sorry

/-- `HabiroRings:HR.5-number-field-comparison/the-inverted-discriminant-ring-is-etale`: for a number
field `F` and a non-zero `Δ` divisible by `disc F`, `O_F[1/Δ]` is étale over `ℤ` (used without
comment by Corollary 2.13). -/
theorem etale_localization_away_discr (F : Type) [Field F] [NumberField F] (Δ : ℤ) (hΔ : Δ ≠ 0)
    (hd : discr F ∣ Δ) (R : Type) [CommRing R] [Algebra (𝓞 F) R]
    [IsLocalization.Away (Δ : 𝓞 F) R] : Algebra.Etale ℤ R := by
  sorry

/-- The same with the weaker hypothesis that every prime dividing `disc F` divides `Δ`. -/
theorem etale_localization_away_of_prime_dvd (F : Type) [Field F] [NumberField F] (Δ : ℤ)
    (hΔ : Δ ≠ 0) (hd : ∀ p : ℕ, p.Prime → (p : ℤ) ∣ discr F → (p : ℤ) ∣ Δ) (R : Type) [CommRing R]
    [Algebra (𝓞 F) R] [IsLocalization.Away (Δ : 𝓞 F) R] : Algebra.Etale ℤ R := by
  sorry

-- Acceptance: `ℤ[i][1/2]` (`disc ℚ(i) = -4`) is étale over `ℤ`; so is `ℤ[∛2][1/6]`
-- (`disc ℚ(∛2) = -108 = -2^2·3^3`), which in this file is presented as `CubeRootTwo`.
/- `number_field_ring` (`HabiroRings:HR.5-number-field-comparison/the-number-field-ring`,
Corollary 2.13): not stated here; needs GSWZ's Habiro ring `H_{O_F[1/Δ]}` with its Frobenius and
gluing condition (supplier: HabiroNumberFields:HB.6, nodes `HB.6/the-gluing-condition`,
`HB.6/coefficient-rings-and-frobenius`, `HB.6/ring-operations-and-the-classical-comparison`).
Its input `R = O_F[1/disc F]` étale over `ℤ` is `etale_localization_away_discr`; the comparison is
stated for `Δ = disc F` exactly, its extension to `disc F ∣ Δ` is not printed in the source, and
divisibility by `6` is not a hypothesis of the ring comparison. -/

end NumberFieldComparison

/-! ## HR.6 — coefficient and cohomology interfaces -/

/- `degree_zero_identification` (`HabiroRings:HR.6/the-degree-zero-identification`,
Corollary 3.13): not stated here; needs the Habiro–Hodge complex `qHdg_{R/A}` of Theorem 3.11 and
its multiplicative upgrade (supplier: HabiroCohomologyFoundations:HQ.3/habiro-descent,
HQ.3/q-hodge-filtrations, HQ.3/multiplicative-upgrades, HQ.4/hodge-against-nygaard,
HQ.4/etale-base-change-and-the-sheaf-property, HQ.5), and `E∞`-`A[q]`-algebras. The source cites
Theorem 3.11(a) where part (b) computes the quotient (source issue `HabiroRings/E6`). -/

/-! ### `HabiroRings:HR.6/completed-scalar-extension` -/

section ScalarExtension

open HabiroRings

variable {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered)
  (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R]

-- HabiroRings.completedScalarExtension: not stated here; needs the ∞-category `D̂_H(H_{R/A})` of
-- Habiro-complete `H_{R/A}`-modules in `D(A[q])` and derived base change (supplier:
-- `HabiroRings:HR.2/the-monoidal-structure`, EnhancedDerivedSheaves:E1).
-- HabiroRings.completedScalarExtension.adjunction: not stated here; needs `completedScalarExtension`
-- and restriction of scalars on `D̂_H` (same suppliers, EnhancedDerivedSheaves:E3).
-- HabiroRings.completedScalarExtension.monoidal: not stated here; needs `habiroTensor`
-- (supplier: `HabiroRings:HR.2/the-monoidal-structure`).
-- HabiroRings.completedScalarExtension.map_id: not stated here; needs `completedScalarExtension`.
-- HabiroRings.completedScalarExtension.map_comp: not stated here; needs `completedScalarExtension`.
-- HabiroRings.completedScalarExtension.perfect: not stated here; needs perfect complexes over
-- `H_{R/A}` in `D(A[q])` (supplier: EnhancedDerivedSheaves:E1).
-- HabiroRings.completedScalarExtension.quotient: not stated here; needs
-- `completedScalarExtension`; its ring-level shadow is the test `quotient_example` below.

/-- `HabiroRings:HR.6/completed-scalar-extension` (`HabiroRings.picMap`): `Pic(H_{R/A}) →
Pic(H_{R'/A'})`, `[L] ↦ [L ⊗_{H_{R/A}} H_{R'/A'}]`, for a morphism of pairs (a real definition,
through `CommRing.Pic.mapAlgebra`). -/
def HabiroRings.picMap {A' : Type u} [CommRing A'] {Λ' : LambdaRing A'}
    (hΛ' : Λ'.IsPerfectlyCovered) {R' : Type v} [CommRing R'] [Algebra A' R'] [Algebra.Etale A' R']
    (f : Λ.Hom Λ') (g : R →+* R')
    (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom) :
    CommRing.Pic (relativeHabiro Λ hΛ R) →* CommRing.Pic (relativeHabiro Λ' hΛ' R') :=
  letI := (relativeHabiro.map Λ hΛ R hΛ' f g hg).toAlgebra
  CommRing.Pic.mapAlgebra _ _

-- HabiroRings.picMap_eq: not stated here; needs the invertible objects of `D̂_H(H_{R/A})` and
-- `completedScalarExtension` (supplier: `HabiroRings:HR.2/the-monoidal-structure`,
-- EnhancedDerivedSheaves:E1).

end ScalarExtension

section ScalarExtensionTests

open HabiroRings

-- test HabiroRings.completedScalarExtension_id (degenerate)
/- Ring-level part: for `f = id`, `picMap = id`; `f^* ≃ id` needs `completedScalarExtension`. -/
example {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) (R : Type v)
    [CommRing R] [Algebra A R] [Algebra.Etale A R] :
    picMap Λ hΛ R hΛ (LambdaRing.Hom.id Λ) (RingHom.id R) rfl = MonoidHom.id _ := by
  sorry

-- test HabiroRings.completedScalarExtension_quotient_example (computation)
/- Ring-level part: for `(ℤ, ℤ) → (ℤ, ℤ[1/2])`, `H_{ℤ[1/2]/ℤ}/(q^2 - 1) ≅ ℤ[1/2][q]/(q^2 - 1) ≅
ℤ[1/2] × ℤ[1/2]`, since `(q - 1) - (q + 1) = -2` is a unit (the last step stated for every ring
in which `2` is a unit). The identification with
`f^*(H_{ℤ/ℤ}/(q^2 - 1))` needs `completedScalarExtension`. -/
example : Nonempty (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
      (Localization.Away (2 : ℤ)) ⧸ Ideal.span {relativeHabiro.ofPoly LambdaRing.trivialInt
        LambdaRing.isPerfectlyCovered_int _ (X ^ 2 - 1)} ≃+*
      Localization.Away (2 : ℤ) × Localization.Away (2 : ℤ)) ∧
    ∀ (L : Type) [CommRing L], IsUnit (2 : L) →
      Nonempty (L[X] ⧸ Ideal.span {(X ^ 2 - 1 : L[X])} ≃+* L × L) := by
  sorry

-- test HabiroRings.directSum_not_habiroComplete (non-example): not stated here; needs
-- `IsHabiroComplete` for `H_{ℤ/ℤ}`-modules (supplier: `HabiroRings:HR.2/habiro-complete-modules`).
-- test HabiroRings.completedScalarExtension_free (compatibility): not stated here; needs
-- `completedScalarExtension` (same supplier).
-- test HabiroRings.completedScalarExtension_adjunction_unit (characterisation): not stated here; needs
-- `completedScalarExtension.adjunction` (same supplier).

end ScalarExtensionTests

/- `transported_regulator` (`HabiroRings:HR.6/the-transported-regulator`): not stated here; needs
`K_3(F)`, HB.7's invertible modules `H_{R,ξ}` with `H_{R,ξ} ⊗ H_{R,ξ'} ≅ H_{R,ξ+ξ'}` (supplier:
HabiroNumberFields:HB.7/the-global-module, HB.7/operations-on-the-modules) and the isomorphism
`κ : H_{R/ℤ} ≅ H_R` of `HabiroRings:HR.5-number-field-comparison/the-number-field-ring`
(supplier: HabiroNumberFields:HB.6). Hypothesis `6·disc F ∣ Δ`. -/

/-! ### `HabiroRings:HR.6/the-q-minus-one-completion-is-not-injective` -/

section QMinusOne

open HabiroRings

/-- The `(q - 1)`-completion `c : H_{R/A} → (H_{R/A})^∧_{(q-1)} ≅ R[[q - 1]]`, the projection to
`H_{R/A,1} = R[q]^∧_{(q-1)}`. -/
def HabiroRings.qMinusOneCompletion {A : Type u} [CommRing A] (Λ : LambdaRing A)
    (hΛ : Λ.IsPerfectlyCovered) (R : Type v) [CommRing R] [Algebra A R] [Algebra.Etale A R] :
    relativeHabiro Λ hΛ R →+* PowerSeries R := sorry

/-- `HabiroRings:HR.6/the-q-minus-one-completion-is-not-injective`: `c` is natural in morphisms
of pairs and injective for `A = R = ℤ`, but for `R = ℤ[1/p]` it kills a non-zero idempotent (that
of a factor `ℤ[1/p][q]^{S_a}`, `a ≥ 1`, of HC.5's decomposition): the `(q - 1)`-completion forgets
the cyclotomic components not connected to `q = 1`. -/
theorem q_minus_one_completion_not_injective (p : ℕ) (hp : p.Prime) :
    (∀ {A : Type u} [CommRing A] (Λ : LambdaRing A) (hΛ : Λ.IsPerfectlyCovered) (R : Type v)
      [CommRing R] [Algebra A R] [Algebra.Etale A R] {A' : Type u} [CommRing A']
      {Λ' : LambdaRing A'} (hΛ' : Λ'.IsPerfectlyCovered) {R' : Type v} [CommRing R']
      [Algebra A' R'] [Algebra.Etale A' R'] (f : Λ.Hom Λ') (g : R →+* R')
      (hg : g.comp (algebraMap A R) = (algebraMap A' R').comp f.toRingHom),
      (PowerSeries.map g).comp (qMinusOneCompletion Λ hΛ R) =
        (qMinusOneCompletion Λ' hΛ' R').comp (relativeHabiro.map Λ hΛ R hΛ' f g hg)) ∧
    Function.Injective
      (qMinusOneCompletion LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int ℤ) ∧
    ∃ e : relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
        (Localization.Away (p : ℤ)),
      IsIdempotentElem e ∧ e ≠ 0 ∧
        qMinusOneCompletion LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int _ e = 0 := by
  sorry

end QMinusOne

/- `regulator_dies_after_q_minus_one_completion`
(`HabiroRings:HR.6/the-regulator-dies-after-q-minus-one-completion`, Wagner §1.4, asserted
there without proof): not stated here; needs `K_3(F)`, the transported modules `κ^*H_{R,ξ}`
(supplier: HabiroNumberFields:HB.7/the-global-module, HB.7/invertible-local-sections) and the
isomorphism `κ` (HabiroNumberFields:HB.6); gap 'The vanishing of the regulator classes after
(q−1)-completion is asserted, not proved'. With those carriers it would read: the composite
`K_3(F) → Pic(H_{R/ℤ}) → Pic(R[[q - 1]])` (the second map `CommRing.Pic.mapAlgebra` along
`qMinusOneCompletion`) is trivial. -/

/-! ## HR.7 — the acceptance tests

The generic equaliser universal property that the HR.7 stage text mentions is Mathlib's
(`RingHom.eqLocus`, `CommRingCat.equalizerFork`, `CommRingCat.equalizerForkIsLimit`) and is not
restated; `HabiroRings.equaliser_presentation` instantiates it with `can` and `φ/A`. -/

/-! ### `HabiroRings:HR.7/phi-five-over-f-eleven` -/

/-- `HabiroRings:HR.7/phi-five-over-f-eleven`: `Φ_5 = (q - 3)(q - 4)(q - 5)(q - 9)` over `𝔽_11`, so
`𝔽_11[q]/Φ_5 ≅ 𝔽_11^4` is finite étale but not a field; the conjugate-residue map
`ℤ[ζ_5] → 𝔽_11^4` at `α = 3` (Tau Ceti) is the reduction modulo `11`; `ℤ_11 ⊗ ℤ[ζ_5] ≅ ℤ_11^4`,
and `ℤ_11[q]^∧_{(11, Φ_5)} ≅ ∏_{i=1}^4 ℤ_11[[q - ω_i]]`. This refutes the p. 18 claim that `Φ_m`
is irreducible modulo every `ℓ ∤ m` (source issue `HabiroRings/E5`). -/
theorem phi_five_over_f_eleven [Fact (Nat.Prime 11)] (h3 : IsPrimitiveRoot (3 : ZMod 11) 5) :
    cyclotomic 5 (ZMod 11) = (X - C 3) * (X - C 4) * (X - C 5) * (X - C 9) ∧
    Nonempty ((ZMod 11)[X] ⧸ Ideal.span {cyclotomic 5 (ZMod 11)} ≃+* (Fin 4 → ZMod 11)) ∧
    ¬ IsField ((ZMod 11)[X] ⧸ Ideal.span {cyclotomic 5 (ZMod 11)}) ∧
    Function.Surjective (TauCeti.Cyclotomic.conjugateResiduesRingHom h3) ∧
    RingHom.ker (TauCeti.Cyclotomic.conjugateResiduesRingHom h3) = Ideal.span {11} ∧
    Nonempty (ℤ_[11][X] ⧸ Ideal.span {cyclotomic 5 ℤ_[11]} ≃+* (Fin 4 → ℤ_[11])) ∧
    Nonempty (AdicCompletion (Ideal.span {C (11 : ℤ_[11]), cyclotomic 5 ℤ_[11]}) ℤ_[11][X] ≃+*
      (Fin 4 → PowerSeries ℤ_[11])) := by
  sorry

-- Acceptance: the Hensel lifts `2786, 7825, 1963, 2066` of `3, 4, 5, 9` are roots of `Φ_5`
-- modulo `11^4` (a real computation).
example : ((2786 : ZMod 14641) ^ 4 + 2786 ^ 3 + 2786 ^ 2 + 2786 + 1 = 0) ∧
    ((7825 : ZMod 14641) ^ 4 + 7825 ^ 3 + 7825 ^ 2 + 7825 + 1 = 0) ∧
    ((1963 : ZMod 14641) ^ 4 + 1963 ^ 3 + 1963 ^ 2 + 1963 + 1 = 0) ∧
    ((2066 : ZMod 14641) ^ 4 + 2066 ^ 3 + 2066 ^ 2 + 2066 + 1 = 0) := by
  decide

/-! ### `HabiroRings:HR.7/inverting-a-prime` -/

open HabiroRings in
/-- `HabiroRings:HR.7/inverting-a-prime`: for `R = ℤ[1/p]`, `H_{R/ℤ} ≅ ℤ[1/p][q]^ℕ ≅
∏_{a ≥ 0} ℤ[1/p][q]^{S_a}`, `S_a = {n : v_p(n) = a}` (HC.5's decomposition), with infinitely many
non-zero factors, so `H_{R/ℤ}` is not a domain; and the localisation `ℤ_(p)` is not an admissible
input, not being of finite presentation, hence not étale, over `ℤ`. -/
theorem inverting_a_prime (p : ℕ) (hp : p.Prime) [(Ideal.span {(p : ℤ)}).IsPrime] :
    Nonempty (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
      (Localization.Away (p : ℤ)) ≃+* CycloCompletion (Localization.Away (p : ℤ)) Set.univ) ∧
    Nonempty (CycloCompletion (Localization.Away (p : ℤ)) Set.univ ≃+*
      ∀ a : ℕ, CycloCompletion (Localization.Away (p : ℤ)) {n | 0 < n ∧ n.factorization p = a}) ∧
    (∀ a : ℕ, Nontrivial
      (CycloCompletion (Localization.Away (p : ℤ)) {n | 0 < n ∧ n.factorization p = a})) ∧
    ¬ IsDomain (relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int
      (Localization.Away (p : ℤ))) ∧
    ¬ Algebra.Etale ℤ (Localization.AtPrime (Ideal.span {(p : ℤ)})) := by
  sorry

/-! ### `HabiroRings:HR.7/constant-families-do-not-glue` -/

section ConstantFamilies

open HabiroRings

/-- `R → R ⊗_{A,ψ^m} A`, `r ↦ r ⊗ 1` (a real definition). -/
def LambdaRing.twistLeft {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R]
    [Algebra A R] (m : ℕ+) : R →+* Λ.twist R m :=
  Algebra.TensorProduct.includeLeftRingHom

/-- The constant family `c(r) = (r ⊗ 1)_m ∈ ∏_m T_m` (a real definition). -/
def HabiroRings.constFamily {A : Type u} [CommRing A] (Λ : LambdaRing A) (R : Type v) [CommRing R]
    [Algebra A R] (r : R) : ∀ m : ℕ+, taylorFactor Λ R m :=
  fun m => PowerSeries.C (Ideal.Quotient.mk _ (C (Λ.twistLeft R m r)))

/-- The cube root of `2` in `ℤ[∛2][1/6]`. -/
def cubeRootTwo : CubeRootTwo := algebraMap _ _ (AdjoinRoot.root (X ^ 3 - C 2 : ℤ[X]))

/-- `HabiroRings:HR.7/constant-families-do-not-glue`: for `R = ℤ[∛2][1/6] = O_F[1/disc F]`,
`F = ℚ(∛2)`, a constant family lies in the equaliser of Lemma 2.12 iff `φ_p(r) = r` in `R̂_p` for
every prime `p ∤ 6`; this fails for `r = ∛2`, `p = 5` (`R̂_5 ≅ ℤ_5 × ℤ_25`, and `φ_5` swaps the two
roots of the lifted quadratic factor), so `r ↦ c(r)` is not a ring map `R → H_{R/ℤ}` and `H_{R/ℤ}`
has no `R`-algebra structure by constant families; and `R` has no non-identity endomorphism. -/
theorem constant_families_do_not_glue [Fact (Nat.Prime 5)] [Algebra.Etale ℤ CubeRootTwo]
    (ζ : CompatibleRoots) :
    (∀ r : CubeRootTwo, constFamily LambdaRing.trivialInt CubeRootTwo r ∈
        equaliserSubring LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int CubeRootTwo ζ ↔
      ∀ (p : ℕ+) (hp : (p : ℕ).Prime), ¬ (p : ℕ) ∣ 6 →
        frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int CubeRootTwo p hp
          (algebraMap _ _ r) = algebraMap _ _ r) ∧
    frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int CubeRootTwo 5 Nat.prime_five
        (algebraMap _ _ cubeRootTwo) ≠ algebraMap _ _ cubeRootTwo ∧
    Nonempty (pCompletion CubeRootTwo 5 ≃+* ℤ_[5] × WittVector 5 (GaloisField 5 2)) ∧
    (¬ ∃ ρ : CubeRootTwo →+* relativeHabiro LambdaRing.trivialInt
        LambdaRing.isPerfectlyCovered_int CubeRootTwo,
      ∀ r, taylorProd LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int CubeRootTwo (ρ r) =
        constFamily LambdaRing.trivialInt CubeRootTwo r) ∧
    ∀ g : CubeRootTwo →+* CubeRootTwo, g = RingHom.id _ := by
  sorry

end ConstantFamilies

/-! ### `HabiroRings:HR.7/the-stage-is-not-the-naive-completion` -/

section NotNaive

open HabiroRings

/-- `HabiroRings:HR.4/an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift`: q-Witt v5
Corollary 2.52, which the next theorem needs. For `R` étale over `ℤ` with `R → R̂_p` injective, a
`ℤ[q]`-algebra isomorphism
`q-W_m(R) ≅ R[q]/(q^m - 1)` for some `m` divisible by `p` makes the Frobenius lift `φ_p` of `R̂_p`
restrict to an endomorphism of `R`. -/
theorem QWittVector.frobLift_restricts_of_equiv (R : Type) [CommRing R] [Algebra.Etale ℤ R]
    (p : ℕ+) (hp : (p : ℕ).Prime) (hinj : Function.Injective (algebraMap R (pCompletion R p)))
    (m : ℕ+) (hpm : p ∣ m)
    (ψ : QWittVector R m ≃+* R[X] ⧸ Ideal.span {(X ^ (m : ℕ) - 1 : R[X])})
    (hψ : ψ (algebraMap ℤ[X] _ X) = Ideal.Quotient.mk _ X) :
    ∃ φ : R →+* R, (algebraMap R (pCompletion R p)).comp φ =
      (frobLift LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int R p hp).comp
        (algebraMap R (pCompletion R p)) := by
  sorry

/-- `HabiroRings:HR.7/the-stage-is-not-the-naive-completion`: for `R = ℤ[∛2][1/6]` and every `m`
divisible by `5` there is no `ℤ[q]`-algebra isomorphism `H_{R/ℤ,m} ≅ R[q]^∧_{(q^m - 1)}`, and
`H_{R/ℤ} ≇ R[q]^ℕ`: the Frobenius twist in the gluing is visible. -/
theorem stage_is_not_naive_completion [Algebra.Etale ℤ CubeRootTwo] :
    (∀ m : ℕ+, 5 ∣ (m : ℕ) → ¬ ∃ e : RelHabiroStage LambdaRing.trivialInt
        LambdaRing.isPerfectlyCovered_int CubeRootTwo m ≃+*
        AdicCompletion (Ideal.span {(X ^ (m : ℕ) - 1 : CubeRootTwo[X])}) CubeRootTwo[X],
      e (RelHabiroStage.ofPoly LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int _ m X) =
        algebraMap CubeRootTwo[X] _ X) ∧
    ¬ ∃ e : relativeHabiro LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int CubeRootTwo ≃+*
        CycloCompletion CubeRootTwo Set.univ,
      e (relativeHabiro.ofPoly LambdaRing.trivialInt LambdaRing.isPerfectlyCovered_int _ X) =
        CycloCompletion.fromPoly CubeRootTwo Set.univ X := by
  sorry

end NotNaive

end TauCeti.Habiro

end
