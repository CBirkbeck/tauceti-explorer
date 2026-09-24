import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Module.LocalizedModule.Basic
import Mathlib.Algebra.Module.Torsion.Basic
import Mathlib.Algebra.MvPolynomial.Basic
import Mathlib.Algebra.Ring.Action.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.FreeModule.Basic
import Mathlib.LinearAlgebra.TensorProduct.Quotient
import Mathlib.RingTheory.Flat.FaithfullyFlat.Algebra
import Mathlib.RingTheory.Ideal.AssociatedPrime.Localization
import Mathlib.RingTheory.Ideal.KrullsHeightTheorem
import Mathlib.RingTheory.Ideal.MinimalPrime.Localization
import Mathlib.RingTheory.Ideal.Quotient.Nilpotent
import Mathlib.RingTheory.KrullDimension.Module
import Mathlib.RingTheory.LocalProperties.Reduced
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.BaseChange
import Mathlib.RingTheory.MvPowerSeries.Equiv
import Mathlib.RingTheory.Noetherian.Nilpotent
import Mathlib.RingTheory.PowerSeries.Ideal
import Mathlib.RingTheory.RegularLocalRing.Defs
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.Spectrum.Prime.Module
import Mathlib.RingTheory.Spectrum.Prime.Topology
import Mathlib.RingTheory.Support

/-!
# Suggested Lean forms: support, components and descent (R03.6)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`DeformationAndDerivedPatchingAlgebra`, layer R03.6) is definitive. The statements below suggest
Lean forms, so that contributors and reviewers converge on names and signatures. Every proof of a
new declaration is `sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Conventions

* An `R`-module `M` is *nearly faithful* (`Module.NearlyFaithful`) when
  `Module.annihilator R M ≤ nilradical R`: the radical form. Taylor's nilpotent form
  (`IsNilpotent (Module.annihilator R M)`) is equivalent when the annihilator is finitely
  generated, in particular over a Noetherian ring, and strictly stronger in general.
* "Faithful" is Mathlib's `FaithfulSMul R M`, equivalently `Module.annihilator R M = ⊥`
  (`Module.annihilator_eq_bot`).
* "Supp M" is Mathlib's `Module.support R M ⊆ PrimeSpectrum R`, the primes `p` with `M_p ≠ 0`.
  For finite `M` it is the closed set `zeroLocus (Module.annihilator R M)`.
* The reduced quotient `R_red` is `R ⧸ nilradical R`; "`R_red ≅ T`" is stated as a `RingEquiv`
  together with its value on the classes of elements of `R`.
* The ϖ-torsion-free quotient `R^tf` is `R ⧸ RingHom.ker (algebraMap R (Localization.Away ϖ))`,
  the quotient by the ϖ-power torsion ideal.
* The Hecke-type ring `T` of the last section is a commutative `R`-algebra acting faithfully on
  `H`, with `R → T` surjective. The image of `R` in `End H`, that is `R ⧸ Module.annihilator R H`,
  is the basic example.

## Hypotheses that the pinned Mathlib cannot state

Mathlib `082e2d3` has no `depth`, no Cohen–Macaulay predicate and no Auslander–Buchsbaum formula;
these belong to layer R03.3 of the same roadmap. Wherever the roadmap assumes
`M ≠ 0` and `depth M ≥ dim A` for a finite module `M` over a Noetherian local ring `A`, this file
uses the equivalent hypothesis that there is an `M`-regular sequence `rs`
(`RingTheory.Sequence.IsRegular`, which includes `M ⧸ (rs) M ≠ 0`, hence `M ≠ 0`) inside the
maximal ideal with `rs.length = ringKrullDim A`. Catenarity is stated in its dimension-function
form: `ringKrullDim (A ⧸ p) = ringKrullDim (A ⧸ q) + 1` whenever `p ⋖ q` in `Spec A`.
-/

open TensorProduct

noncomputable section

/-! ## D1 `nearly-faithful` and D2 `supported-on-components` -/

namespace Module

section Defs

variable (R M : Type*) [CommSemiring R] [AddCommMonoid M] [Module R M]

/-- **D1.** An `R`-module `M` is *nearly faithful* if its annihilator lies in the nilradical of
`R` (Taylor 2008, Definition 2.1, in radical form; Calegari–Geraghty §6.1). -/
class NearlyFaithful : Prop where
  annihilator_le_nilradical : Module.annihilator R M ≤ nilradical R

/-- **D2.** `M` is *supported on components* of `Spec R` if every prime minimal over `Ann_R(M)` is a
minimal prime of `R`. For finite `M` this says that `Supp M` is a union of irreducible components
of `Spec R` (`isSupportedOnComponents_iff_exists_irreducibleComponents`). -/
def IsSupportedOnComponents : Prop :=
  (Module.annihilator R M).minimalPrimes ⊆ minimalPrimes R

end Defs

section API

variable {R M N : Type*} [CommRing R] [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

/-! ### API of D1 -/

/-- (characterisation) Unfolding the definition. -/
theorem nearlyFaithful_iff :
    NearlyFaithful R M ↔ Module.annihilator R M ≤ nilradical R := sorry

/-- (compatibility) A faithful module is nearly faithful. -/
instance NearlyFaithful.of_faithfulSMul [FaithfulSMul R M] : NearlyFaithful R M := sorry

/-- (compatibility) Over a reduced ring, nearly faithful is faithful. -/
theorem nearlyFaithful_iff_faithfulSMul [IsReduced R] :
    NearlyFaithful R M ↔ FaithfulSMul R M := sorry

/-- (constructor) A module with nilpotent annihilator is nearly faithful. -/
theorem NearlyFaithful.of_isNilpotent_annihilator (h : IsNilpotent (Module.annihilator R M)) :
    NearlyFaithful R M := sorry

/-- (characterisation) Taylor's nilpotent form, when the annihilator is finitely generated. -/
theorem nearlyFaithful_iff_isNilpotent_annihilator_of_fg (h : (Module.annihilator R M).FG) :
    NearlyFaithful R M ↔ IsNilpotent (Module.annihilator R M) := sorry

/-- (characterisation) Taylor's nilpotent form, over a Noetherian ring. -/
theorem nearlyFaithful_iff_isNilpotent_annihilator [IsNoetherianRing R] :
    NearlyFaithful R M ↔ IsNilpotent (Module.annihilator R M) := sorry

/-- (constructor) If every minimal prime of `R` lies in `Supp M`, then `M` is nearly faithful.
No finiteness is needed. -/
theorem nearlyFaithful_of_forall_minimalPrimes_mem_support
    (h : ∀ p : PrimeSpectrum R, p.asIdeal ∈ minimalPrimes R → p ∈ Module.support R M) :
    NearlyFaithful R M := sorry

/-- (relation) A finite nearly faithful module has full support. -/
theorem NearlyFaithful.support_eq_univ [Module.Finite R M] [NearlyFaithful R M] :
    Module.support R M = Set.univ := sorry

/-- (other) A nearly faithful module over a nontrivial ring is nontrivial. -/
theorem NearlyFaithful.nontrivial [Nontrivial R] [NearlyFaithful R M] : Nontrivial M := sorry

/-- (functoriality) Near faithfulness passes to modules containing `M`. -/
theorem NearlyFaithful.of_injective [NearlyFaithful R M] (f : M →ₗ[R] N)
    (hf : Function.Injective f) : NearlyFaithful R N := sorry

/-- (equivalence) Near faithfulness is invariant under linear equivalence. -/
theorem _root_.LinearEquiv.nearlyFaithful_iff (e : M ≃ₗ[R] N) :
    NearlyFaithful R M ↔ NearlyFaithful R N := sorry

/-! ### API of D2 -/

/-- (projection) Minimal primes over the annihilator are minimal primes of `R`. -/
theorem IsSupportedOnComponents.mem_minimalPrimes (h : IsSupportedOnComponents R M) {p : Ideal R}
    (hp : p ∈ (Module.annihilator R M).minimalPrimes) : p ∈ minimalPrimes R := sorry

/-- (characterisation) For finite `M`, `M` is supported on components iff `Supp M` is a union of
irreducible components of `Spec R`. -/
theorem isSupportedOnComponents_iff_exists_irreducibleComponents [Module.Finite R M] :
    IsSupportedOnComponents R M ↔
      ∃ S ⊆ irreducibleComponents (PrimeSpectrum R), Module.support R M = ⋃₀ S := sorry

/-- (relation) A nearly faithful module is supported on components (all of them). -/
theorem NearlyFaithful.isSupportedOnComponents [NearlyFaithful R M] :
    IsSupportedOnComponents R M := sorry

/-- (equivalence) Being supported on components is invariant under linear equivalence. -/
theorem _root_.LinearEquiv.isSupportedOnComponents_iff (e : M ≃ₗ[R] N) :
    IsSupportedOnComponents R M ↔ IsSupportedOnComponents R N := sorry

end API

/-! ### L4 `nearly-faithful-iff-support-eq-univ` -/

section SupportCharacterisation

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Finite R M]

/-- **L4**, (i) ⇔ (ii): for finite `M` over any ring, nearly faithful iff `Supp M = Spec R`. -/
theorem nearlyFaithful_iff_support_eq_univ :
    NearlyFaithful R M ↔ Module.support R M = Set.univ := sorry

/-- **L4**, (i) ⇔ (iii): for finite `M`, nearly faithful iff every minimal prime of `R` lies in
`Supp M`. -/
theorem nearlyFaithful_iff_forall_minimalPrimes_mem_support :
    NearlyFaithful R M ↔
      ∀ p : PrimeSpectrum R, p.asIdeal ∈ minimalPrimes R → p ∈ Module.support R M := sorry

end SupportCharacterisation

/-! ### L2b `nearly-faithful-restrict-scalars-surjective` -/

/-- **L2b.** For a surjective ring map `A → B` and a `B`-module `N`, `N` is nearly faithful over
`B` iff `Ann_A(N) ⊆ √(ker (A → B))`. No finiteness is needed. -/
theorem nearlyFaithful_iff_annihilator_le_radical_ker {A B : Type*} [CommRing A] [CommRing B]
    [Algebra A B] (hf : Function.Surjective (algebraMap A B)) (N : Type*) [AddCommGroup N]
    [Module A N] [Module B N] [IsScalarTower A B N] :
    NearlyFaithful B N ↔ Module.annihilator A N ≤ (RingHom.ker (algebraMap A B)).radical := sorry

/-! ### L5 `nearly-faithful-quotient` -/

section Quotient

variable {A M : Type*} [CommRing A] [AddCommGroup M] [Module A M] [Module.Finite A M]
  [NearlyFaithful A M]

/-- **L5** (Taylor, Lemma 2.2(1)). If `M` is finite and nearly faithful over `A`, then
`M ⧸ I M` is nearly faithful over `A ⧸ I`. No Noetherian hypothesis is needed. -/
theorem NearlyFaithful.quotient (I : Ideal A) :
    NearlyFaithful (A ⧸ I) (M ⧸ (I • ⊤ : Submodule A M)) := sorry

/-- **L5**, the "in particular" clause: if the action of `A` on `M ⧸ I M` factors through a
surjection `A → B` (so `B = A ⧸ J` with `J = ker`), then `J ⊆ √I`. -/
theorem NearlyFaithful.ker_le_radical_of_equiv_quotient (I : Ideal A) {B N : Type*} [CommRing B]
    [Algebra A B] (hf : Function.Surjective (algebraMap A B)) [AddCommGroup N] [Module A N]
    [Module B N] [IsScalarTower A B N] (e : (M ⧸ (I • ⊤ : Submodule A M)) ≃ₗ[A] N) :
    RingHom.ker (algebraMap A B) ≤ I.radical := sorry

/-- **L5**, the "in particular" clause, second half: if moreover `I ⊆ √J` (for instance
`I ⊆ J`), then `M ⧸ I M` is nearly faithful over `B`. -/
theorem NearlyFaithful.of_equiv_quotient (I : Ideal A) {B N : Type*} [CommRing B]
    [Algebra A B] (hf : Function.Surjective (algebraMap A B)) [AddCommGroup N] [Module A N]
    [Module B N] [IsScalarTower A B N] (e : (M ⧸ (I • ⊤ : Submodule A M)) ≃ₗ[A] N)
    (hI : I ≤ (RingHom.ker (algebraMap A B)).radical) : NearlyFaithful B N := sorry

end Quotient

end Module

/-! ## Unit tests for D1 and D2 -/

namespace SuggestedTest

/-- Test helper: the node `A = k⟦x, y⟧ ⧸ (x y)`. -/
abbrev nodeRing (k : Type*) [Field k] : Type _ :=
  MvPowerSeries (Fin 2) k ⧸
    Ideal.span {(MvPowerSeries.X 0 * MvPowerSeries.X 1 : MvPowerSeries (Fin 2) k)}

/-- Test helper: the image of `x` in the node. -/
abbrev nodeX (k : Type*) [Field k] : nodeRing k :=
  Ideal.Quotient.mk _ (MvPowerSeries.X 0)

/-- Test helper: the image of `y` in the node. -/
abbrev nodeY (k : Type*) [Field k] : nodeRing k :=
  Ideal.Quotient.mk _ (MvPowerSeries.X 1)

/-- Test helper (Stacks, Example 0EGG): `S = k[x₀, x₁, …] ⧸ (x_n^(n+1))`. -/
abbrev locNilRing (k : Type*) [Field k] : Type _ :=
  MvPolynomial ℕ k ⧸
    Ideal.span (Set.range fun n : ℕ ↦ (MvPolynomial.X n : MvPolynomial ℕ k) ^ (n + 1))

/-- Test helper: the ideal `J = (x₀, x₁, …)` of `S`, locally nilpotent but not nilpotent. -/
abbrev locNilIdeal (k : Type*) [Field k] : Ideal (locNilRing k) :=
  Ideal.span (Set.range fun n : ℕ ↦ Ideal.Quotient.mk _ (MvPolynomial.X n))

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

-- Test `nearlyFaithful_test_dualNumber` (non-example): `k = k[ε] ⧸ (ε)` is nearly faithful
-- over `k[ε]` (`ε² = 0`) but not faithful.
example (k : Type*) [Field k] :
    Module.NearlyFaithful (DualNumber k)
        (DualNumber k ⧸ Ideal.span {(DualNumber.eps : DualNumber k)}) ∧
      ¬ FaithfulSMul (DualNumber k)
        (DualNumber k ⧸ Ideal.span {(DualNumber.eps : DualNumber k)}) := sorry

-- Test `nearlyFaithful_test_zero` (degenerate): the zero module over a nontrivial ring is not
-- nearly faithful.
example [Nontrivial R] [Subsingleton M] : ¬ Module.NearlyFaithful R M := sorry

-- Test `nearlyFaithful_test_self` (compatibility): `R` is nearly faithful over itself, through
-- Mathlib's `FaithfulSMul R R`.
example : Module.NearlyFaithful R R := inferInstance

-- Test `nearlyFaithful_test_zmod` (computation): over `ℤ/8`, the module `ℤ/8 ⧸ (4)` has
-- annihilator `(4)` with `4² = 0`, so it is nearly faithful; over `ℤ/6`, `ℤ/6 ⧸ (3)` has
-- annihilator `(3)`, which contains the non-nilpotent `3`, so it is not.
example : Module.NearlyFaithful (ZMod 8) (ZMod 8 ⧸ Ideal.span {(4 : ZMod 8)}) ∧
    ¬ Module.NearlyFaithful (ZMod 6) (ZMod 6 ⧸ Ideal.span {(3 : ZMod 6)}) := sorry

-- Test `nearlyFaithful_test_node` (non-example): `A = k⟦x,y⟧ ⧸ (xy)` acting on `A ⧸ (x)` is not
-- nearly faithful (its support misses the component `y = 0`).
example (k : Type*) [Field k] :
    ¬ Module.NearlyFaithful (nodeRing k) (nodeRing k ⧸ Ideal.span {nodeX k}) := sorry

-- Test `nearlyFaithful_test_int` (compatibility): over the reduced ring `ℤ`, nearly faithful is
-- Mathlib's `FaithfulSMul`.
example (G : Type*) [AddCommGroup G] : Module.NearlyFaithful ℤ G ↔ FaithfulSMul ℤ G := sorry

-- Test `nearlyFaithful_test_notNilpotent` (non-example): the radical form is not Taylor's
-- nilpotent form. `S ⧸ J` is nearly faithful over `S` although its annihilator `J` is not nilpotent.
example (k : Type*) [Field k] :
    Module.NearlyFaithful (locNilRing k) (locNilRing k ⧸ locNilIdeal k) ∧
      ¬ IsNilpotent (Module.annihilator (locNilRing k) (locNilRing k ⧸ locNilIdeal k)) := sorry

-- Test `isSupportedOnComponents_test_zero` (degenerate): the zero module is supported on
-- components (its annihilator is `⊤`, which has no minimal primes).
example [Subsingleton M] : Module.IsSupportedOnComponents R M := sorry

-- Test `isSupportedOnComponents_test_zmod` (non-example): `ℤ/2` over `ℤ` is not supported on
-- components: `(2)` is minimal over `Ann = (2)` but is not a minimal prime of `ℤ`.
example : ¬ Module.IsSupportedOnComponents ℤ (ZMod 2) := sorry

-- Test `isSupportedOnComponents_test_node` (computation): `A ⧸ (x)` over the node is supported
-- on components (`Supp = V(x)`, a component) but is not nearly faithful.
example (k : Type*) [Field k] :
    Module.IsSupportedOnComponents (nodeRing k) (nodeRing k ⧸ Ideal.span {nodeX k}) ∧
      ¬ Module.NearlyFaithful (nodeRing k) (nodeRing k ⧸ Ideal.span {nodeX k}) := sorry

-- Test `isSupportedOnComponents_test_domain` (characterisation): over a domain, a nonzero finite
-- module is supported on components iff it is faithful.
example [IsDomain R] [Nontrivial M] [Module.Finite R M] :
    Module.IsSupportedOnComponents R M ↔ FaithfulSMul R M := sorry

-- Acceptance for L4 (finiteness is needed for (i) ⇒ (ii)): `ℚ ⧸ ℤ` is faithful over `ℤ`, yet the
-- generic point `(0)` is not in its support.
example : FaithfulSMul ℤ (ℚ ⧸ Submodule.span ℤ {(1 : ℚ)}) ∧
    (⟨⊥, Ideal.isPrime_bot⟩ : PrimeSpectrum ℤ) ∉
      Module.support ℤ (ℚ ⧸ Submodule.span ℤ {(1 : ℚ)}) := sorry

end SuggestedTest

/-! ## Support transport: L1 `support-base-change`, L2 `support-restrict-scalars-surjective`,
and Mathlib's `Module.support_quotient` -/

namespace Module

variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]

/-- **L1**, the inclusion valid for every module and every ring map. -/
theorem support_baseChange_subset (M : Type*) [AddCommGroup M] [Module A M] :
    Module.support B (B ⊗[A] M) ⊆
      PrimeSpectrum.comap (algebraMap A B) ⁻¹' Module.support A M := sorry

/-- **L1** (Stacks 0BUR; a TODO of `Mathlib.RingTheory.Support`). For any ring map `A → B` and
finite `A`-module `M`, `Supp_B (B ⊗ M) = (Spec φ)⁻¹ (Supp_A M)`. -/
theorem support_baseChange (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M] :
    Module.support B (B ⊗[A] M) =
      PrimeSpectrum.comap (algebraMap A B) ⁻¹' Module.support A M := sorry

/-- **L1**, flat case: for a flat ring map `A → B` and any `A`-module `M`. -/
theorem support_baseChange_of_flat [Module.Flat A B] (M : Type*) [AddCommGroup M] [Module A M] :
    Module.support B (B ⊗[A] M) =
      PrimeSpectrum.comap (algebraMap A B) ⁻¹' Module.support A M := sorry

/-- **L2.** For a surjection `A → B` (e.g. `A → A ⧸ I`) and a `B`-module `N`, `Supp_A N` is the
image of `Supp_B N` under the closed immersion `Spec B → Spec A`. Mathlib has the inclusion
`Supp_B N ⊆ comap⁻¹ Supp_A N` (`Module.support_subset_preimage_comap`) for any algebra. -/
theorem support_eq_image_comap_of_surjective (hf : Function.Surjective (algebraMap A B))
    (N : Type*) [AddCommGroup N] [Module A N] [Module B N] [IsScalarTower A B N] :
    Module.support A N = PrimeSpectrum.comap (algebraMap A B) '' Module.support B N := sorry

/-- `Supp(M ⧸ I M) = Supp M ∩ V(I)` for finite `M` is Mathlib's `Module.support_quotient`
(a baseline declaration of this layer, not a node). -/
example (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M] (I : Ideal A) :
    Module.support A (M ⧸ (I • ⊤ : Submodule A M)) =
      Module.support A M ∩ PrimeSpectrum.zeroLocus I :=
  Module.support_quotient I

end Module

namespace SuggestedTest

-- Acceptance for L1 (one of the two hypotheses is needed): `ℤ → ℤ/2` is not flat and `ℚ` is not
-- finite over `ℤ`; `ℤ/2 ⊗ ℚ = 0` although `Supp_ℤ ℚ = Spec ℤ`.
example : Module.support (ZMod 2) (ZMod 2 ⊗[ℤ] ℚ) = ∅ ∧ Module.support ℤ ℚ = Set.univ := sorry

end SuggestedTest

/-! ## Near faithfulness under change of ring: L6 `nearly-faithful-base-change`,
L8 `framing-variables` -/

namespace Module

section BaseChange

variable {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]
  (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M]

/-- **L6** (a), ascent along any ring map. -/
theorem NearlyFaithful.baseChange [NearlyFaithful A M] : NearlyFaithful B (B ⊗[A] M) := sorry

/-- **L6** (b), descent when every minimal prime of `A` is the contraction of a prime of `B`. -/
theorem NearlyFaithful.of_baseChange
    (hmin : ∀ p ∈ minimalPrimes A, ∃ q : PrimeSpectrum B,
      Ideal.comap (algebraMap A B) q.asIdeal = p)
    (h : NearlyFaithful B (B ⊗[A] M)) : NearlyFaithful A M := sorry

/-- **L6** (a) and (b) for a faithfully flat map; (c) is the case `B = A ⊗[𝒪] 𝒪'` of a
coefficient change along a faithfully flat `𝒪 → 𝒪'`. -/
theorem nearlyFaithful_baseChange_iff [Module.FaithfullyFlat A B] :
    NearlyFaithful B (B ⊗[A] M) ↔ NearlyFaithful A M := sorry

end BaseChange

end Module

/-- **L8**, the ring-theoretic input: for finitely many variables, the constant coefficient
`A⟦x₁, …, xₙ⟧ → A` has kernel `(x₁, …, xₙ)`. It fails for infinitely many variables. -/
theorem MvPowerSeries.ker_constantCoeff (σ A : Type*) [CommRing A] [Finite σ] :
    RingHom.ker (MvPowerSeries.constantCoeff (σ := σ) (R := A)) =
      Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ A)) := sorry

namespace Module

variable {A : Type*} [CommRing A] (σ : Type*) [Finite σ]

/-- **L8** (a): adding framing variables neither creates nor destroys near faithfulness. No
Noetherian or flatness hypothesis is needed. -/
theorem nearlyFaithful_mvPowerSeries_baseChange_iff (M : Type*) [AddCommGroup M] [Module A M]
    [Module.Finite A M] :
    NearlyFaithful (MvPowerSeries σ A) (MvPowerSeries σ A ⊗[A] M) ↔ NearlyFaithful A M := sorry

/-- **L8** (b): if `N` is finite and nearly faithful over `A⟦x⟧`, then `N ⧸ (x) N` is nearly
faithful over `A`. -/
theorem NearlyFaithful.quotient_span_X (N : Type*) [AddCommGroup N]
    [Module (MvPowerSeries σ A) N] [Module A N] [IsScalarTower A (MvPowerSeries σ A) N]
    [Module.Finite (MvPowerSeries σ A) N] [NearlyFaithful (MvPowerSeries σ A) N] :
    NearlyFaithful A (N ⧸ (Ideal.span (Set.range (MvPowerSeries.X : σ → MvPowerSeries σ A)) •
      ⊤ : Submodule (MvPowerSeries σ A) N)) := sorry

end Module

namespace SuggestedTest

-- Acceptance for L6 (a), a concrete instance: `ℤ` is nearly faithful over itself, so
-- `ℤ⟦X⟧ ⊗[ℤ] ℤ` is nearly faithful over `ℤ⟦X⟧`.
example : Module.NearlyFaithful (PowerSeries ℤ) (PowerSeries ℤ ⊗[ℤ] ℤ) :=
  Module.NearlyFaithful.baseChange ℤ

-- Acceptance for L6 (c): a coefficient change along a faithfully flat `𝒪 → 𝒪'`.
example (O O' A M : Type*) [CommRing O] [CommRing O'] [CommRing A] [Algebra O O'] [Algebra O A]
    [Module.FaithfullyFlat O O'] [AddCommGroup M] [Module A M] [Module.Finite A M] :
    Module.NearlyFaithful (A ⊗[O] O') ((A ⊗[O] O') ⊗[A] M) ↔ Module.NearlyFaithful A M :=
  Module.nearlyFaithful_baseChange_iff M

-- Acceptance for L6 (b) (the surjectivity hypothesis is needed): along the first projection
-- `k × k → k`, `M = k × 0` becomes faithful, but `M` is not nearly faithful over `k × k`.
example (k : Type*) [Field k] :
    ¬ Module.NearlyFaithful (k × k) ((k × k) ⧸ Ideal.span {((0 : k), (1 : k))}) := sorry

end SuggestedTest

/-! ## Minimal primes and inverting ϖ: L9 `minimal-primes-of-torsion-free`,
L10 `nearly-faithful-after-inverting` -/

/-- **L9**, first half, is Mathlib's `Ideal.disjoint_nonZeroDivisors_of_mem_minimalPrimes`
(a baseline declaration; no DVR or Noetherian hypothesis): a nonzerodivisor lies in no minimal
prime. -/
example {R : Type*} [CommRing R] {ϖ : R} (hϖ : ϖ ∈ nonZeroDivisors R) {p : Ideal R}
    (hp : p ∈ minimalPrimes R) : ϖ ∉ p :=
  fun h ↦ Set.disjoint_left.mp (Ideal.disjoint_nonZeroDivisors_of_mem_minimalPrimes hp) h hϖ

/-- **L9**, second half: if `ϖ` is a nonzerodivisor, contraction along `R → R[1/ϖ]` is a
bijection of minimal primes (injectivity is `PrimeSpectrum.localization_comap_injective`). -/
theorem IsLocalization.Away.comap_minimalPrimes_eq_of_mem_nonZeroDivisors {R : Type*}
    [CommRing R] {ϖ : R} (hϖ : ϖ ∈ nonZeroDivisors R) (S : Type*) [CommRing S] [Algebra R S]
    [IsLocalization.Away ϖ S] :
    Ideal.comap (algebraMap R S) '' minimalPrimes S = minimalPrimes R := sorry

namespace Module

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- **L10**, (i) ⇔ (ii) (Calegari–Geraghty, proof of Theorem 6.4). No Noetherian hypothesis. -/
theorem nearlyFaithful_iff_localizedModule_away {ϖ : R} (hϖ : ϖ ∈ nonZeroDivisors R)
    [Module.Finite R M] :
    NearlyFaithful R M ↔ NearlyFaithful (Localization.Away ϖ) (LocalizedModule.Away ϖ M) := sorry

/-- **L10**, (i) ⇔ (iii): every irreducible component of `Spec R[1/ϖ]` lies in `Supp M[1/ϖ]`. -/
theorem nearlyFaithful_iff_forall_minimalPrimes_away_mem_support {ϖ : R}
    (hϖ : ϖ ∈ nonZeroDivisors R) [Module.Finite R M] :
    NearlyFaithful R M ↔ ∀ p : PrimeSpectrum (Localization.Away ϖ),
      p.asIdeal ∈ minimalPrimes (Localization.Away ϖ) →
        p ∈ Module.support (Localization.Away ϖ) (LocalizedModule.Away ϖ M) := sorry

/-- **L10**, (iv) ⇔ (v): if `R[1/ϖ]` is reduced, faithfulness can be tested after inverting `ϖ`
(Khare–Wintenberger II, Lemma 9.6 b); Kisin (3.3.1)). -/
theorem faithfulSMul_iff_localizedModule_away {ϖ : R} (hϖ : ϖ ∈ nonZeroDivisors R)
    [IsReduced (Localization.Away ϖ)] [Module.Finite R M] :
    FaithfulSMul R M ↔ FaithfulSMul (Localization.Away ϖ) (LocalizedModule.Away ϖ M) := sorry

end Module

/-! ## Components: L11 `maximal-cm-support-top-components`,
`nearly-faithful-maximal-depth-equidimensional`, L12 `maximal-cm-nearly-faithful-irreducible`,
L13 `support-group-transitive`, `nearly-faithful-lift-from-special-fibre` -/

namespace Module

section MaximalDepth

variable {A : Type*} [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
  {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]

/-- **L11**, associated primes: if `M ≠ 0` has depth `≥ dim A` (a maximal regular sequence; see
the module docstring), every associated prime of `M` is a minimal prime of `A` of maximal
dimension. -/
theorem mem_minimalPrimes_of_mem_associatedPrimes_of_isRegular (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A) {P : Ideal A}
    (hP : P ∈ associatedPrimes A M) :
    P ∈ minimalPrimes A ∧ ringKrullDim (A ⧸ P) = ringKrullDim A := sorry

/-- **L11**, primes minimal over the annihilator have maximal dimension. -/
theorem ringKrullDim_quotient_eq_of_isRegular (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A) {P : Ideal A}
    (hP : P ∈ (Module.annihilator A M).minimalPrimes) :
    ringKrullDim (A ⧸ P) = ringKrullDim A := sorry

/-- **L11**, `Supp M` is a union of (top-dimensional) irreducible components of `Spec A`. -/
theorem isSupportedOnComponents_of_isRegular (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A) :
    IsSupportedOnComponents A M := sorry

/-- **`nearly-faithful-maximal-depth-equidimensional`** (Calegari–Geraghty, Remark 6.5): a
nearly faithful module of maximal depth forces `A` to be equidimensional. -/
theorem NearlyFaithful.ringKrullDim_quotient_eq_of_isRegular [NearlyFaithful A M] (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A) {P : Ideal A}
    (hP : P ∈ minimalPrimes A) : ringKrullDim (A ⧸ P) = ringKrullDim A := sorry

/-- **L12** (Taylor, Lemma 2.3, with `M ≠ 0`). If `A` has a unique minimal prime, a nonzero
module of maximal depth is nearly faithful. -/
theorem nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A)
    (hA : (minimalPrimes A).Subsingleton) :
    NearlyFaithful A M := sorry

/-- **L12**, corollary (Calegari–Geraghty, Theorem 6.4(2)): if `ϖ` is a nonzerodivisor of `A` and
`Spec A[1/ϖ]` is irreducible, a nonzero module of maximal depth is nearly faithful. -/
theorem nearlyFaithful_of_isRegular_of_subsingleton_minimalPrimes_away (rs : List A)
    (hreg : RingTheory.Sequence.IsRegular M rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal A)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim A) {ϖ : A} (hϖ : ϖ ∈ nonZeroDivisors A)
    (hA : (minimalPrimes (Localization.Away ϖ)).Subsingleton) :
    NearlyFaithful A M := sorry

end MaximalDepth

section GroupAction

variable {G A M : Type*} [Group G] [CommRing A] [MulSemiringAction G A]
  [AddCommGroup M] [Module A M] [DistribMulAction G M] [SMulDistribClass G A M]

/-- **L13**, first part: for a semilinear action (`g • (a • m) = (g • a) • (g • m)`), the
annihilator of `M` is `G`-stable. -/
theorem smul_mem_annihilator_of_smulDistribClass (g : G) {a : A}
    (ha : a ∈ Module.annihilator A M) : g • a ∈ Module.annihilator A M := sorry

/-- **L13**, second part: `Supp M` is `G`-stable. -/
theorem comap_mulSemiringAction_mem_support (g : G) {p : PrimeSpectrum A}
    (hp : p ∈ Module.support A M) :
    PrimeSpectrum.comap (MulSemiringAction.toRingHom G A g) p ∈ Module.support A M := sorry

/-- **L13**, third part: if `G` acts transitively on the minimal primes of `A` and `Supp M`
contains one of them, then `M` is nearly faithful. No finiteness of `G` or `M` and no Noetherian
hypothesis. -/
theorem nearlyFaithful_of_forall_minimalPrimes_exists_smul
    (htrans : ∀ p ∈ minimalPrimes A, ∀ q ∈ minimalPrimes A,
      ∃ g : G, Ideal.comap (MulSemiringAction.toRingHom G A g) p = q)
    (p : PrimeSpectrum A) (hp : p.asIdeal ∈ minimalPrimes A) (hpM : p ∈ Module.support A M) :
    NearlyFaithful A M := sorry

/-- **L13**, fourth part: over a reduced ring the conclusion is faithfulness. -/
theorem faithfulSMul_of_forall_minimalPrimes_exists_smul [IsReduced A]
    (htrans : ∀ p ∈ minimalPrimes A, ∀ q ∈ minimalPrimes A,
      ∃ g : G, Ideal.comap (MulSemiringAction.toRingHom G A g) p = q)
    (p : PrimeSpectrum A) (hp : p.asIdeal ∈ minimalPrimes A) (hpM : p ∈ Module.support A M) :
    FaithfulSMul A M := sorry

end GroupAction

/-- **`nearly-faithful-lift-from-special-fibre`** (Taylor, Lemma 2.2(2)). Let `A` be a Noetherian
local ring and `ϖ ∈ 𝔪_A`. Assume `A` is catenary (in dimension-function form), equidimensional,
that no minimal prime contains `ϖ`, and that every prime minimal over `ϖ A` contains exactly one
minimal prime. If `M` is finite, `ϖ` is `M`-regular and `M ⧸ ϖ M` is nearly faithful over
`A ⧸ ϖ A`, then `M` is nearly faithful over `A`. -/
theorem NearlyFaithful.of_quotient_of_isSMulRegular {A : Type*} [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] {ϖ : A} (hϖ : ϖ ∈ IsLocalRing.maximalIdeal A)
    (hcat : ∀ p q : PrimeSpectrum A, p ⋖ q →
      ringKrullDim (A ⧸ p.asIdeal) = ringKrullDim (A ⧸ q.asIdeal) + 1)
    (hequi : ∀ P ∈ minimalPrimes A, ringKrullDim (A ⧸ P) = ringKrullDim A)
    (hgen : ∀ P ∈ minimalPrimes A, ϖ ∉ P)
    (huniq : ∀ Q ∈ (Ideal.span {ϖ}).minimalPrimes, ∃! P, P ∈ minimalPrimes A ∧ P ≤ Q)
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] (hM : IsSMulRegular M ϖ)
    (h : NearlyFaithful (A ⧸ Ideal.span {ϖ}) (M ⧸ (Ideal.span {ϖ} • ⊤ : Submodule A M))) :
    NearlyFaithful A M := sorry

end Module

namespace SuggestedTest

-- Acceptance for L11/L12: over the node `A = k⟦x,y⟧ ⧸ (xy)` (dimension 1), `M = A ⧸ (x)`
-- carries the regular element `x + y` in the maximal ideal, so it is maximal Cohen–Macaulay, yet
-- it is not nearly faithful: maximal depth does not give support on every component.
example (k : Type*) [Field k] :
    RingTheory.Sequence.IsRegular (nodeRing k ⧸ Ideal.span {nodeX k}) [nodeX k + nodeY k] ∧
      ringKrullDim (nodeRing k) = 1 ∧
      ¬ Module.NearlyFaithful (nodeRing k) (nodeRing k ⧸ Ideal.span {nodeX k}) := sorry

end SuggestedTest

/-! ## Patching conclusions: L14 `patching-nearly-faithful-descends`,
L15 `patching-free-conclusion`, `patched-module-support-theorem` -/

namespace Module

section Patching

variable {S Rinf R : Type*} [CommRing S] [CommRing Rinf] [CommRing R] [Algebra S Rinf]
  [Algebra Rinf R] (a : Ideal S)
  {Minf H : Type*} [AddCommGroup Minf] [Module Rinf Minf] [Module.Finite Rinf Minf]
  [AddCommGroup H] [Module Rinf H] [Module R H] [IsScalarTower Rinf R H]

/-- **L14**, radical comparison. `S → R_∞` carries the patching and framing variables,
`φ = algebraMap R_∞ R` is surjective, `H ≅ M_∞ ⧸ 𝔞 M_∞` is an `R`-module through `φ` (hypothesis
(a)), and `ha` is hypothesis (b): `ı(𝔞) ⊆ ker φ + Ann(M_∞)`. -/
theorem NearlyFaithful.radical_map_eq_radical_ker [NearlyFaithful Rinf Minf]
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    (a.map (algebraMap S Rinf)).radical = (RingHom.ker (algebraMap Rinf R)).radical := sorry

/-- **L14**, `H` is nearly faithful over `R` (Calegari–Geraghty, Theorem 6.4(2)–(3) algebra). -/
theorem NearlyFaithful.of_patching [NearlyFaithful Rinf Minf]
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    NearlyFaithful R H := sorry

/-- **L14**, `(R_∞ ⧸ 𝔞 R_∞)_red ≅ R_red`, compatibly with the canonical maps. -/
theorem NearlyFaithful.exists_ringEquiv_nilradical_of_patching [NearlyFaithful Rinf Minf]
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    ∃ f : ((Rinf ⧸ a.map (algebraMap S Rinf)) ⧸ nilradical (Rinf ⧸ a.map (algebraMap S Rinf)))
        ≃+* (R ⧸ nilradical R),
      ∀ x : Rinf, f (Ideal.Quotient.mk _ (Ideal.Quotient.mk _ x)) =
        Ideal.Quotient.mk _ (algebraMap Rinf R x) := sorry

/-- **L15**, `ker φ = 𝔞 R_∞` (Calegari–Geraghty, Theorem 6.4(1) algebra). `R_∞` is regular local
and `M_∞ ≠ 0` has maximal depth; no near-faithfulness hypothesis. -/
theorem ker_algebraMap_eq_map_of_patching [IsRegularLocalRing Rinf] (rs : List Rinf)
    (hreg : RingTheory.Sequence.IsRegular Minf rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal Rinf)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim Rinf)
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    RingHom.ker (algebraMap Rinf R) = a.map (algebraMap S Rinf) := sorry

/-- **L15**, `H` is free of positive rank over `R`. -/
theorem free_of_patching [IsRegularLocalRing Rinf] (rs : List Rinf)
    (hreg : RingTheory.Sequence.IsRegular Minf rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal Rinf)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim Rinf)
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    Module.Free R H ∧ Nontrivial H := sorry

/-- **`patched-module-support-theorem`**, part (2) (Calegari–Geraghty, Theorem 6.4(2), module
form): `R_∞` Noetherian local with a unique minimal prime and `M_∞` of maximal depth. -/
theorem NearlyFaithful.of_patching_of_subsingleton_minimalPrimes [IsLocalRing Rinf]
    [IsNoetherianRing Rinf] (rs : List Rinf)
    (hreg : RingTheory.Sequence.IsRegular Minf rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal Rinf)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim Rinf)
    (hmin : (minimalPrimes Rinf).Subsingleton)
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    NearlyFaithful R H := sorry

/-- **`patched-module-support-theorem`**, part (3) (Calegari–Geraghty, Theorem 6.4(3), module
form): `ϖ` a nonzerodivisor of `R_∞` and every component of `Spec R_∞[1/ϖ]` in the support of
`M_∞[1/ϖ]`. -/
theorem NearlyFaithful.of_patching_of_away {ϖ : Rinf} (hϖ : ϖ ∈ nonZeroDivisors Rinf)
    (hsupp : ∀ p : PrimeSpectrum (Localization.Away ϖ),
      p.asIdeal ∈ minimalPrimes (Localization.Away ϖ) →
        p ∈ Module.support (Localization.Away ϖ) (LocalizedModule.Away ϖ Minf))
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H) :
    NearlyFaithful R H := sorry

/-- **`patched-module-support-theorem`**, part (1) (Calegari–Geraghty, Theorem 6.4(1), module
form): for `R_∞` regular, `R` maps isomorphically onto any ring `T` through which it acts
faithfully on `H`. -/
theorem bijective_algebraMap_of_patching [IsRegularLocalRing Rinf] (rs : List Rinf)
    (hreg : RingTheory.Sequence.IsRegular Minf rs)
    (hmem : ∀ r ∈ rs, r ∈ IsLocalRing.maximalIdeal Rinf)
    (hlen : (rs.length : WithBot ℕ∞) = ringKrullDim Rinf)
    (hφ : Function.Surjective (algebraMap Rinf R))
    (ha : a.map (algebraMap S Rinf) ≤
      RingHom.ker (algebraMap Rinf R) ⊔ Module.annihilator Rinf Minf)
    (e : (Minf ⧸ (a.map (algebraMap S Rinf) • ⊤ : Submodule Rinf Minf)) ≃ₗ[Rinf] H)
    (T : Type*) [CommRing T] [Algebra R T] [Module T H] [IsScalarTower R T H] [FaithfulSMul T H]
    (hT : Function.Surjective (algebraMap R T)) :
    Function.Bijective (algebraMap R T) := sorry

end Patching

/-! ## `R = T`: L16 `r-equals-t-reduced`, L17 `r-equals-t-torsion-free-quotient`,
L18 `r-equals-t-free` -/

section RT

variable {R T H : Type*} [CommRing R] [CommRing T] [Algebra R T]
  [AddCommGroup H] [Module R H] [Module T H] [IsScalarTower R T H] [FaithfulSMul T H]

/-- **L16**, the kernel of `R → T` lies in the nilradical. -/
theorem NearlyFaithful.ker_algebraMap_le_nilradical [NearlyFaithful R H] :
    RingHom.ker (algebraMap R T) ≤ nilradical R := sorry

/-- **L16**, over a Noetherian ring the kernel is nilpotent. -/
theorem NearlyFaithful.isNilpotent_ker_algebraMap [IsNoetherianRing R] [NearlyFaithful R H] :
    IsNilpotent (RingHom.ker (algebraMap R T)) := sorry

/-- **L16**, `R_red ≅ T_red`. -/
theorem NearlyFaithful.exists_ringEquiv_nilradical [NearlyFaithful R H]
    (hsurj : Function.Surjective (algebraMap R T)) :
    ∃ e : (R ⧸ nilradical R) ≃+* (T ⧸ nilradical T),
      ∀ r : R, e (Ideal.Quotient.mk _ r) = Ideal.Quotient.mk _ (algebraMap R T r) := sorry

/-- **L16**, `T` is reduced iff `ker (R → T) = √0`, i.e. iff `R_red → T` is an isomorphism:
"`T` reduced" is necessary and sufficient. -/
theorem NearlyFaithful.isReduced_iff_ker_eq_nilradical [NearlyFaithful R H]
    (hsurj : Function.Surjective (algebraMap R T)) :
    IsReduced T ↔ RingHom.ker (algebraMap R T) = nilradical R := sorry

/-- **L16**, if `T` is reduced, `R_red ≅ T` (Taylor, Theorem 4.1). -/
theorem NearlyFaithful.exists_ringEquiv_of_isReduced [NearlyFaithful R H] [IsReduced T]
    (hsurj : Function.Surjective (algebraMap R T)) :
    ∃ e : (R ⧸ nilradical R) ≃+* T, ∀ r : R, e (Ideal.Quotient.mk _ r) = algebraMap R T r :=
  sorry

/-- **L17** (a): if `ϖ` is `H`-regular, `R → T` kills the ϖ-power torsion of `R`, so it factors
through `R^tf`. -/
theorem ker_away_le_ker_algebraMap (ϖ : R) (hH : IsSMulRegular H ϖ) :
    RingHom.ker (algebraMap R (Localization.Away ϖ)) ≤ RingHom.ker (algebraMap R T) := sorry

/-- **L17** (b), the torsion-free `R = T`: `R^tf ≅ T` iff `H[1/ϖ]` is faithful over `R[1/ϖ]`
(Kisin (3.3.1); Khare–Wintenberger II, Proposition 9.2(III)). -/
theorem exists_ringEquiv_torsionFree_iff_faithfulSMul (ϖ : R) (hH : IsSMulRegular H ϖ)
    (hsurj : Function.Surjective (algebraMap R T)) :
    (∃ e : (R ⧸ RingHom.ker (algebraMap R (Localization.Away ϖ))) ≃+* T,
        ∀ r : R, e (Ideal.Quotient.mk _ r) = algebraMap R T r) ↔
      FaithfulSMul (Localization.Away ϖ) (LocalizedModule.Away ϖ H) := sorry

/-- **L17** (c): for nearly faithful `H`, the ϖ-power torsion of `R` lies in the nilradical. -/
theorem NearlyFaithful.ker_away_le_nilradical [NearlyFaithful R H] (ϖ : R)
    (hH : IsSMulRegular H ϖ) :
    RingHom.ker (algebraMap R (Localization.Away ϖ)) ≤ nilradical R := sorry

/-- **L17** (c): `T` is reduced iff `T[1/ϖ]` is. -/
theorem isReduced_iff_isReduced_away (ϖ : R) (hH : IsSMulRegular H ϖ) :
    IsReduced T ↔ IsReduced (Localization.Away (algebraMap R T ϖ)) := sorry

/-- **L18**, the integral `R = T`: `R → T` is an isomorphism iff `H` is faithful over `R`. -/
theorem bijective_algebraMap_iff_faithfulSMul (hsurj : Function.Surjective (algebraMap R T)) :
    Function.Bijective (algebraMap R T) ↔ FaithfulSMul R H := sorry

/-- **L18**, free form: a nonzero free `R`-module is faithful, so `R ≅ T`. -/
theorem bijective_algebraMap_of_free [Module.Free R H] [Nontrivial H]
    (hsurj : Function.Surjective (algebraMap R T)) : Function.Bijective (algebraMap R T) := sorry

end RT

end Module

namespace SuggestedTest

-- Acceptance for L16 (the image of `R` in `End H`): the annihilator is the kernel of the action
-- map, so `T := R ⧸ Module.annihilator R H` is the image of `R` in `End H`.
example {R H : Type*} [CommRing R] [AddCommGroup H] [Module R H] :
    Module.annihilator R H = RingHom.ker (Module.toAddMonoidEnd R H) := rfl

-- Acceptance for L17 (the ideal defining `R^tf`): the kernel of `R → R[1/ϖ]` is the ϖ-power
-- torsion of `R`.
example {R : Type*} [CommRing R] (ϖ : R) (r : R) :
    r ∈ RingHom.ker (algebraMap R (Localization.Away ϖ)) ↔ ∃ n : ℕ, ϖ ^ n * r = 0 := sorry

-- Acceptance for L18 (faithfulness, not freeness, is the hypothesis): the zero module is free,
-- and `ℤ` does not act faithfully on it.
example : Module.Free ℤ PUnit ∧ ¬ FaithfulSMul ℤ PUnit := sorry

end SuggestedTest

end
