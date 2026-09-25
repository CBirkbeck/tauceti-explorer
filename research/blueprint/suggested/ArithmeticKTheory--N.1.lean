import Mathlib.Algebra.DirectSum.Basic
import Mathlib.GroupTheory.Abelianization.Defs
import Mathlib.GroupTheory.Divisible
import Mathlib.GroupTheory.Exponent
import Mathlib.GroupTheory.NoncommPiCoprod
import Mathlib.GroupTheory.Torsion
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.NumberTheory.Bernoulli
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.NumberField.ClassNumber
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.Padics.PadicVal.Basic
import Mathlib.RingTheory.ClassGroup.ExtendedHom
import Mathlib.RingTheory.DedekindDomain.IntegralClosure
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.DedekindDomain.SelmerGroup
import Mathlib.RingTheory.Localization.AsSubring
import Mathlib.RingTheory.Localization.LocalizationLocalization
import Mathlib.RingTheory.Norm.Defs
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.RootsOfUnity.Basic
import Mathlib.RingTheory.ZMod.UnitsCyclic
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.CategoryTheory.GrothendieckGroup.Split
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup
import TauCeti.FieldTheory.GaloisCohomology.Coefficients
import TauCeti.NumberTheory.ClassGroup.ElementaryTwoQuotient
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.ElementaryTwoQuotient
import TauCeti.NumberTheory.NumberField.Units.Signature.Integer
import TauCeti.RepresentationTheory.Homological.ContCohomology.Corestriction
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
import TauCeti.RingTheory.ClassGroup.Basic
import TauCeti.RingTheory.ClassGroup.RelNorm
import TauCeti.RingTheory.DedekindDomain.SInteger.Basic
import TauCeti.RingTheory.DedekindDomain.SInteger.ClassGroup
import TauCeti.RingTheory.DedekindDomain.SInteger.Spectrum
import TauCeti.RingTheory.DedekindDomain.SInteger.Unit
import TauCeti.RingTheory.DedekindDomain.SelmerGroup

/-!
# Suggested Lean forms for `ArithmeticKTheory--N.1` (stages N.1–N.6)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/ArithmeticKTheory--N.1.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures; they claim no
implementation, and `implementationStatus` stays `"unchecked"` for every node.

Pinned commits: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Compiled with `lean` on the Lake package paths of a project whose Mathlib is `082e2d3`, the
Tau Ceti modules imported below having been compiled from the pinned `f790474` sources into a
directory placed first on `LEAN_PATH`; the only warnings are uses of `sorry`.

## Pinned conventions

* **`O_{F,S}` is Mathlib's `Set.integer S F`** for a set `S` of height-one primes of `𝓞 F`
  (`IsDedekindDomain.HeightOneSpectrum`): the `x` with `v(x) ≤ 1` for every `v ∉ S`. There is no
  second carrier; `S` need not be finite unless a statement says so, and `S.unit F` is the group of
  `S`-units (`Set.unitEquivUnitsInteger`).
* **The class map of the localisation sequence is `e_𝔭 ↦ [𝔭]⁻¹`**, the boundary `Fˣ → ⊕_𝔭 ℤ`
  being the divisor `f ↦ (ord_𝔭 f)_𝔭` (`divisorClassMap`, `sClassMap`). Tau Ceti's
  `Set.unitValuation` records Mathlib's multiplicative valuation `v(u) = ofAdd (-ord_v u)`, so in
  its coordinates the same class map reads `f ↦ ∏_v [v] ^ toAdd (f v)` (`sClassMap_mulSingle`).
* **`w_i(F) = |H⁰(F, ℚ/ℤ(i))|`** (`wInvariant F i = Nat.card (WInvariant F i)`), where `ℚ/ℤ(i)`
  is the group `µ(Fˢ)` of all roots of unity of a separable closure with `g ∈ G_F` acting by
  `ζ ↦ g^i(ζ)` (K-book Definition VI.1.7; `TateTwist`). It is the *twisted* module, not the roots
  of unity of `F`: `w₂(ℚ) = 24` while `ℚ` has two roots of unity. `Nat.card` of an infinite group
  is `0`, so every general statement about `w_i` carries a finiteness hypothesis.
* **The rank formula for `n ≥ 2` is read off `n mod 4`**: `rank K_n(O_{F,S}) = r₁ + r₂`, `r₂` or
  `0` according as `n ≡ 1 (mod 4)`, `n ≡ 3 (mod 4)` or `n` is even (`borelRank`). Degree one is
  excluded: `rank K₁(O_{F,S}) = r₁ + r₂ + |S| − 1`.
* **K-book locators**: PDF page = book page + 8 (author-hosted draft of 29 August 2013).

## Library declarations imported and reused

* Mathlib: `Set.integer`, `Set.unit`, `Set.unitEquivUnitsInteger`, `IsDedekindDomain.integer_empty`,
  `IsDedekindDomain.integer_univ`, `IsDedekindDomain.HeightOneSpectrum` with `valuation`,
  `intValuation` and `valuationOfNeZero`, `IsLocalization`, `IsLocalization.Away`,
  `Localization.subalgebra.ofField`, `IsIntegralClosure`, `ClassGroup`, `ClassGroup.extendedHom`,
  `ClassGroup.equivPic` (for comparison with `CommRing.Pic`), `NumberField.RingOfIntegers`,
  `NumberField.InfinitePlace.nrRealPlaces`, `nrComplexPlaces`, `NumberField.IsTotallyComplex`,
  `NumberField.Units.torsionOrder`, `IsCyclotomicExtension`, `CyclotomicField`,
  `cyclotomicCharacter`, `modularCyclotomicCharacter`, `rootsOfUnity`, `CommGroup.torsion`,
  `IsPrimitiveRoot`,
  `Monoid.exponent`, `AddCommGroup.primaryComponent`, `DirectSum.IsInternal`, `IsAddCyclic`,
  `Algebra.norm`, `Abelianization`, `DivisibleBy`, `bernoulli`, `padicValInt`, `ZMod`,
  `IsDedekindDomain.selmerGroup`,
  `IntermediateField.fixingSubgroup` with `IntermediateField.finrank_eq_fixingSubgroup_index`.
* Tau Ceti: `Set.mem_integer_iff`, `IsDedekindDomain.integer_map_asIdeal_eq_top`,
  `Set.unitValuation` with `Set.unitValuation_ker`, `Set.unit_mono`, `Set.unit_fg_of_units`,
  `IsDedekindDomain.integerClassGroupEquiv`, `IsDedekindDomain.ker_integer_extendedHom`,
  `IsDedekindDomain.integer_extendedHom_surjective`, `IsDedekindDomain.finite_integer_classGroup`,
  `IsDedekindDomain.integerHeightOneSpectrumEquiv`, `HeightOneSpectrum.classGroupMk`,
  `HeightOneSpectrum.finite_setOfPred_valuation_ne_one`, `ClassGroup.relNorm` with
  `ClassGroup.relNorm_extendedHom`, `TauCeti.AbsoluteGaloisGroup`, `TauCeti.KummerCoeff` (with its
  Galois action), `TauCeti.ContCohomology.H0`,
  `explicitRes0`, `explicitCor0`, `explicitCor0_comp_res0`, `H0_eq_top_of_smul_eq_self`,
  `TauCeti.finiteProjectiveModules` and `TauCeti.SplitK0` (for `K₀`),
  `TauCeti.GlobalNumberFields.signHom`, `TauCeti.twoRank`, `TauCeti.ClassGroup.twoRank` and
  `NumberField.NarrowClassGroup.twoRank` (for the signature defect).

## Stand-ins, helpers and omissions

Neither pinned library has an algebraic K-group beyond degree zero, a localisation sequence, étale
cohomology, the twists `ℚ/ℤ(i)` or the e-invariant. The prelude defines, honestly and each as a
stand-in for the supplier node it replaces: `K₀(R)` as Tau Ceti's split Grothendieck group of the
finitely generated projective modules (the notation of the `KTheoryLowDegrees` suggested file);
`K₁(R)` as the abelianisation of the stable general linear group `⋃ₙ GLₙ(R)`, realised as the
automorphisms of `R^{(ℕ)}` that fix all but finitely many basis vectors; and `ℚ/ℤ(i)` as `µ(Fˢ)`
with the twisted action, whose `G_F`-invariants are `W_i(F)`. Operations whose construction is the
supplier's work (base change, transfer, the determinant, the rank–class-group splitting of `K₀`)
are `def`s with `sorry` bodies over these real carriers. The signature defect is given in the form
that avoids étale cohomology, through Mathlib's Selmer group (see its section: this is also a
review finding). A statement needing a carrier that neither exists nor can honestly be defined here
— `K_n` for `n ≥ 2`, the localisation sequence, étale cohomology, K-theory with coefficients, the
e-invariant, the wild kernel, the order certificates — is left out, and a comment
`<name>: not stated here; needs … (supplier: …)` records it in place, so that every packet name
appears in this file.
-/

noncomputable section

open scoped nonZeroDivisors TensorProduct DirectSum Pointwise

universe u v

/-! ## Prelude: honest local stand-ins for the supplier stages -/

namespace TauCeti.RingK0

variable (R : Type u) [CommRing R]

/-- The finitely generated projective `R`-modules as a full subcategory of `ModuleCat R`
(Tau Ceti's `finiteProjectiveModules`); notation, as in the `KTheoryLowDegrees` suggested file. -/
abbrev FP := (TauCeti.finiteProjectiveModules R).FullSubcategory

/-- Stand-in for `K₀` of `KTheoryLowDegrees:Z.3`/`Z.4`: `K₀(R)` is Tau Ceti's split Grothendieck
group of the finitely generated projective `R`-modules. A real definition on pinned carriers. -/
abbrev K0 := TauCeti.SplitK0.{u} (FP R)

/-- The class `[M] ∈ K₀(R)` of a finitely generated projective module. -/
abbrev cls (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M] :
    K0 R :=
  TauCeti.SplitK0.of ⟨ModuleCat.of R M, ⟨inferInstance, inferInstance⟩⟩

/-- Stand-in for `KTheoryLowDegrees:Z.4/rank-pic-equivalence` for a Dedekind domain (the Z.3
suggested file's `TauCeti.RingK0.rankPicEquiv`, composed with Mathlib's `ClassGroup.equivPic`):
`K₀(R) ≃ ℤ ⊕ Cl(R)` by rank and determinant, `[P] ↦ (rank P, [det P])`. The construction is
Z.4's. -/
def rankClassGroupEquiv [IsDedekindDomain R] : K0 R ≃+ ℤ × Additive (ClassGroup R) :=
  sorry

/-- Stand-in for the pullback `f^*` of `KTheoryLowDegrees:Z.4`: base change `P ↦ S ⊗_R P` on
`K₀`. The construction (base change preserves finite projectives) is Z.4's. -/
def baseChange {S : Type v} [CommRing S] (f : R →+* S) : K0 R →+ K0 S :=
  sorry

/-- Stand-in for the transfer `f_*` of `KTheoryLowDegrees:U.5`: restriction of scalars along a
finite projective algebra `R → S`. The construction is U.5's. -/
def transfer {S : Type v} [CommRing S] [Algebra R S] [Module.Finite R S] [Module.Projective R S] :
    K0 S →+ K0 R :=
  sorry

end TauCeti.RingK0

namespace TauCeti.RingK1

variable (R : Type u) [CommRing R]

/-- The stable general linear group `GL(R) = ⋃ₙ GLₙ(R)`, realised as the automorphisms of
`R^{(ℕ)}` fixing all but finitely many standard basis vectors. Such an automorphism preserves the
span of the first `m` basis vectors for `m` large, so it lies in the image of `GLₘ(R)` under
`g ↦ diag(g, 1)`; conversely every element of that image fixes `eₙ` for `n ≥ m`. -/
def StableGL : Subgroup ((ℕ →₀ R) ≃ₗ[R] (ℕ →₀ R)) where
  carrier := {g | ∀ᶠ n in Filter.atTop, g (Finsupp.single n 1) = Finsupp.single n 1}
  mul_mem' {g h} hg hh := (hg.and hh).mono fun n hn => by
    rw [LinearEquiv.mul_apply, hn.2, hn.1]
  one_mem' := Filter.Eventually.of_forall fun _ => rfl
  inv_mem' := by
    sorry

/-- Stand-in for `K₁` of `KTheoryLowDegrees:U.3`: `K₁(R) = GL(R)^{ab}`, a real definition. -/
abbrev K1 : Type u := Abelianization (StableGL R)

/-- Stand-in for the determinant `K₁(R) → Rˣ` of `KTheoryLowDegrees:U.3` (commutative `R`); its
kernel is `SK₁(R)`. The construction (the determinant of a finite block) is U.3's. -/
def det : K1 R →* Rˣ :=
  sorry

variable {R}

/-- Stand-in for functoriality of `K₁` along a ring homomorphism (`KTheoryLowDegrees:U.3`). -/
def map {S : Type v} [CommRing S] (f : R →+* S) : K1 R →* K1 S :=
  sorry

variable (R) in
/-- Stand-in for the transfer on `K₁` of `KTheoryLowDegrees:U.5`: restriction of scalars along a
finite projective algebra. -/
def transfer {S : Type v} [CommRing S] [Algebra R S] [Module.Finite R S] [Module.Projective R S] :
    K1 S →* K1 R :=
  sorry

end TauCeti.RingK1

namespace TauCeti

variable (F : Type u) [Field F]

/-- The group `µ = µ(Fˢ)` of all roots of unity of a separable closure (the torsion of `(Fˢ)ˣ`),
written additively: the underlying group of every Tate twist. In characteristic `p` it is the
prime-to-`p` part of `ℚ/ℤ`. -/
abbrev SepRootsOfUnity : Type u := Additive (CommGroup.torsion (SeparableClosure F)ˣ)

/-- Stand-in for `MotivicEtaleKTheory:M.1`'s twist `ℚ/ℤ(i)` (K-book Definition VI.1.7): the group
`µ(Fˢ)` with `g ∈ G_F` acting by `ζ ↦ g^i(ζ)`. On `µ_{ℓ^ν}` this is `ζ ↦ ζ^{χ_ℓ(g)^i}`, because
`G_F` acts on `µ_{ℓ^ν}` through the abelian group `(ℤ/ℓ^ν)ˣ` (Mathlib's
`modularCyclotomicCharacter`). It is not the tensor power `(ℚ/ℤ)^{⊗i}`, which is zero. -/
def TateTwist (_i : ℤ) : Type u := SepRootsOfUnity F

namespace TateTwist

variable (i : ℤ)

instance : AddCommGroup (TateTwist F i) := inferInstanceAs (AddCommGroup (SepRootsOfUnity F))

/-- The identity of underlying groups `ℚ/ℤ(i) = µ(Fˢ)`. -/
def toRoots : TateTwist F i ≃+ SepRootsOfUnity F := AddEquiv.refl _

/-- The twisted action `ζ ↦ g^i(ζ)`, a real definition. -/
def twistAct (g : AbsoluteGaloisGroup F) (x : TateTwist F i) : TateTwist F i :=
  (toRoots F i).symm (Additive.ofMul ⟨(g ^ i) • ((Additive.toMul (toRoots F i x) :
      CommGroup.torsion (SeparableClosure F)ˣ) : (SeparableClosure F)ˣ),
    (CommGroup.mem_torsion _).2 ((MulDistribMulAction.toMonoidHom (SeparableClosure F)ˣ
      (g ^ i)).isOfFinOrder ((CommGroup.mem_torsion _).1 (Additive.toMul (toRoots F i x)).2))⟩)

/-- `ℚ/ℤ(i)` as a `G_F`-module. The associativity `(gh)^i(ζ) = g^i(h^i(ζ))` holds because the
action on each `µ_n` factors through the abelian group `(ℤ/n)ˣ`; its proof is omitted. -/
instance : DistribMulAction (AbsoluteGaloisGroup F) (TateTwist F i) where
  smul := twistAct F i
  one_smul x := by
    change twistAct F i 1 x = x
    unfold twistAct
    simp [one_zpow]
  mul_smul g h x := by
    sorry
  smul_zero g := by
    change twistAct F i g 0 = 0
    unfold twistAct
    apply (toRoots F i).injective
    simp only [AddEquiv.apply_symm_apply, map_zero]
    apply Additive.toMul.injective
    apply Subtype.ext
    simp
  smul_add g x y := by
    change twistAct F i g (x + y) = twistAct F i g x + twistAct F i g y
    unfold twistAct
    apply (toRoots F i).injective
    simp only [AddEquiv.apply_symm_apply, map_add]
    apply Additive.toMul.injective
    apply Subtype.ext
    simp [toRoots, smul_mul']

/-- The inclusion of Tau Ceti's Kummer coefficients `KummerCoeff F n = µ_n(Fˢ)` into every twist
(Mathlib's `rootsOfUnity n (Fˢ)` inside `µ(Fˢ)`), a real definition: its image is `µ_n(i)`. -/
def ofKummerCoeff (n : ℕ) [NeZero n] : KummerCoeff F n →+ TateTwist F i :=
  (toRoots F i).symm.toAddMonoidHom.comp (MonoidHom.toAdditive (Subgroup.inclusion
    fun ζ hζ => (CommGroup.mem_torsion _).2 (isOfFinOrder_iff_pow_eq_one.2
      ⟨n, NeZero.pos n, (mem_rootsOfUnity n ζ).1 hζ⟩)))

theorem ofKummerCoeff_injective (n : ℕ) [NeZero n] :
    Function.Injective (ofKummerCoeff F i n) := by
  sorry

/-- The twist convention on `µ_n`: `g` acts on `µ_n(i)` by `ζ ↦ ζ^{χ_n(g)^i}`, with `χ_n` Mathlib's
`modularCyclotomicCharacter` (`hn` says that `Fˢ` has `n` distinct `n`-th roots of unity). -/
theorem smul_ofKummerCoeff (n : ℕ) [NeZero n]
    (hn : Nat.card (rootsOfUnity n (SeparableClosure F)) = n) (g : AbsoluteGaloisGroup F)
    (ζ : KummerCoeff F n) :
    g • ofKummerCoeff F i n ζ = ofKummerCoeff F i n
      ((((modularCyclotomicCharacter (SeparableClosure F) hn g.toRingEquiv) ^ i :
        (ZMod n)ˣ) : ZMod n).val • ζ) := by
  sorry

/-- In weight one the twist is `µ(Fˢ)` with its Galois action: `ofKummerCoeff` is equivariant for
Tau Ceti's untwisted action on `KummerCoeff F n`, so `ℚ/ℤ(1)` is the colimit of the
`KummerCoeff F ℓ^ν`. -/
theorem ofKummerCoeff_one_smul (n : ℕ) [NeZero n] (g : AbsoluteGaloisGroup F)
    (ζ : KummerCoeff F n) : ofKummerCoeff F 1 n (g • ζ) = g • ofKummerCoeff F 1 n ζ := by
  sorry

end TateTwist

end TauCeti

/-! ## `ArithmeticKTheory:N.1` — the arithmetic carriers in degrees zero and one -/

namespace TauCeti.ArithmeticK

open IsDedekindDomain NumberField

section Localisation

variable {R : Type u} [CommRing R] [IsDedekindDomain R] (S : Set (HeightOneSpectrum R))
  (K : Type v) [Field K] [Algebra R K] [IsFractionRing R K]

/-- The submonoid `M_S ⊆ R` of the elements whose image in `O_S = S.integer K` is a unit (the
preimage of Mathlib's `IsUnit.submonoid`). -/
def sUnitSubmonoid : Submonoid R :=
  (IsUnit.submonoid (S.integer K)).comap (algebraMap R (S.integer K))

/-- `M_S` is the set of `r ≠ 0` with `v(r) = 1` for every `v ∉ S`. -/
theorem mem_sUnitSubmonoid_iff {r : R} :
    r ∈ sUnitSubmonoid S K ↔ r ≠ 0 ∧ ∀ v ∉ S, v.intValuation r = 1 := by
  sorry

/-- **`ArithmeticKTheory:N.1/S-integers-as-a-localisation`.** For a submonoid `M ⊆ R`, `O_S` is
the localisation of `R` at `M` exactly when `M ⊆ M_S` and every prime of `S` meets `M`. No
finiteness of `S` is needed. -/
theorem integer_isLocalization_iff (M : Submonoid R) :
    IsLocalization M (S.integer K) ↔
      M ≤ sUnitSubmonoid S K ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal := by
  sorry

/-- `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, independence of the presentation: every
submonoid satisfying the criterion gives, as a subring of `K`, the same ring `O_S`. -/
theorem ofField_eq_integer (M : Submonoid R) (hM : M ≤ R⁰)
    (h : M ≤ sUnitSubmonoid S K ∧ ∀ v ∈ S, ∃ m ∈ M, m ∈ v.asIdeal) :
    Localization.subalgebra.ofField K M hM = S.integer K := by
  sorry

-- acceptance (`S = ∅`): `M = {1}` presents `O_∅ = R` (Mathlib's `IsDedekindDomain.integer_empty`).
example : IsLocalization (⊥ : Submonoid R) ((∅ : Set (HeightOneSpectrum R)).integer K) := by
  sorry

-- acceptance (`S` all primes): `M = R⁰` presents `O_S = K` (Mathlib's `integer_univ`).
example : IsLocalization R⁰ ((Set.univ : Set (HeightOneSpectrum R)).integer K) := by
  sorry

/-- **`ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`.** If `Cl(R)` is a
torsion group, `M_S` meets every prime of `S`, so `O_S` is the localisation of `R` at `M_S`, for
every set `S`. -/
theorem integer_isLocalization_of_isMulTorsion (h : IsMulTorsion (ClassGroup R)) :
    IsLocalization (sUnitSubmonoid S K) (S.integer K) := by
  sorry

/-- `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, concretely: if
`v ^ h_v = (a_v)` with `h_v` the (finite) order of `[v]`, every submonoid between
`{a_v : v ∈ S}` and `M_S` presents `O_S`. -/
theorem integer_isLocalization_of_generators (a : S → R)
    (hfin : ∀ v : S, IsOfFinOrder (v : HeightOneSpectrum R).classGroupMk)
    (ha : ∀ v : S, Ideal.span {a v} =
      (v : HeightOneSpectrum R).asIdeal ^ orderOf (v : HeightOneSpectrum R).classGroupMk)
    (M : Submonoid R) (haM : ∀ v, a v ∈ M) (hM : M ≤ sUnitSubmonoid S K) :
    IsLocalization M (S.integer K) := by
  sorry

/-- `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, finite `S`:
`O_S = R[1/a]` with `a = ∏_{v ∈ S} a_v`. -/
theorem exists_isLocalization_away_integer (h : IsMulTorsion (ClassGroup R)) [Finite S] :
    ∃ a : R, IsLocalization.Away a (S.integer K) := by
  sorry

/-- **`ArithmeticKTheory:N.1/S-integers-monotone`**: enlarging `S` enlarges the ring. -/
theorem integer_mono {S S' : Set (HeightOneSpectrum R)} (h : S ⊆ S') :
    S.integer K ≤ S'.integer K :=
  fun _ hx v hv => hx v fun hvS => hv (h hvS)

/-- The inclusion `O_S ⊆ O_{S'}` as an algebra, for `S ⊆ S'`. -/
abbrev integerAlgebra {S S' : Set (HeightOneSpectrum R)} (h : S ⊆ S') :
    Algebra (S.integer K) (S'.integer K) :=
  (Subalgebra.inclusion (integer_mono K h)).toRingHom.toAlgebra

/-- `ArithmeticKTheory:N.1/S-integers-monotone`, the compatible presentations: with a torsion class
group, `O_{S'}` is `O_S` with the image of `M_{S'}` inverted
(from Mathlib's `IsLocalization.isLocalization_of_submonoid_le`). -/
theorem integer_isLocalization_of_subset (htor : IsMulTorsion (ClassGroup R))
    {S S' : Set (HeightOneSpectrum R)} (h : S ⊆ S') :
    letI := integerAlgebra K h
    IsLocalization ((sUnitSubmonoid S' K).map (algebraMap R (S.integer K))) (S'.integer K) := by
  sorry

end Localisation

/-- `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group` for a number field:
the class group of `𝓞 F` is finite (Mathlib's `NumberField.RingOfIntegers.instFintypeClassGroup`),
so `O_{F,S}` is the localisation of `𝓞 F` at `M_S` for every `S`. -/
theorem integer_isLocalization_ringOfIntegers (F : Type u) [Field F] [NumberField F]
    (S : Set (HeightOneSpectrum (𝓞 F))) :
    IsLocalization (sUnitSubmonoid S F) (S.integer F) := by
  sorry

section IntExamples

/-- The height-one prime `(p)` of `ℤ` (test notation). -/
def intPrime (p : ℕ) [hp : Fact p.Prime] : HeightOneSpectrum ℤ where
  asIdeal := Ideal.span {(p : ℤ)}
  isPrime := (Ideal.span_singleton_prime (by exact_mod_cast hp.out.ne_zero)).2
    (Nat.prime_iff_prime_int.1 hp.out)
  ne_bot := by simpa using hp.out.ne_zero

-- acceptance (the S-integers of `ℚ` at `{2}` are `ℤ[1/2]`): the powers of `2` present them.
example : IsLocalization (Submonoid.powers (2 : ℤ))
    (({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ) := by
  sorry

-- acceptance (the same ring as a subalgebra of `ℚ`): `O_{ℚ,{2}} = ℤ[1/2]`.
example :
    ({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ = Algebra.adjoin ℤ {(1 / 2 : ℚ)} := by
  sorry

-- acceptance (non-example): `M = {1}` does not present `O_{ℚ,{2}}`.
example : ¬ IsLocalization (⊥ : Submonoid ℤ)
    (({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ) := by
  sorry

-- acceptance (`S-integers-monotone`): `ℤ[1/6]` is `ℤ[1/2]` with `3` inverted.
example :
    letI := integerAlgebra ℚ (show ({intPrime 2} : Set (HeightOneSpectrum ℤ)) ⊆
      {intPrime 2, intPrime 3} from Set.singleton_subset_iff.2 (Set.mem_insert _ _))
    IsLocalization.Away (algebraMap ℤ (({intPrime 2} : Set (HeightOneSpectrum ℤ)).integer ℚ) 3)
      (({intPrime 2, intPrime 3} : Set (HeightOneSpectrum ℤ)).integer ℚ) := by
  sorry

end IntExamples

section FiniteExtension

variable {F : Type u} [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))
  (F' : Type u) [Field F'] [NumberField F'] [Algebra F F']

/-- The primes of `𝓞_{F'}` lying over a prime of `S` (the `S'` of the finite-extension lemma). -/
def primesOver : Set (HeightOneSpectrum (𝓞 F')) :=
  {w | ∃ v ∈ S, w.asIdeal.comap (algebraMap (𝓞 F) (𝓞 F')) = v.asIdeal}

/-- `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, first half: `O_{F,S} ⊆ O_{F',S'}`. -/
theorem algebraMap_mem_integer {x : F} (hx : x ∈ S.integer F) :
    algebraMap F F' x ∈ (primesOver S F').integer F' := by
  sorry

/-- The inclusion `O_{F,S} → O_{F',S'}`. -/
def integerRingHom : S.integer F →+* (primesOver S F').integer F' :=
  ((algebraMap F F').comp (S.integer F).val.toRingHom).codRestrict _
    fun x => algebraMap_mem_integer S F' x.2

instance : Algebra (S.integer F) ((primesOver S F').integer F') := (integerRingHom S F').toAlgebra

instance : Algebra (S.integer F) F' :=
  ((algebraMap F F').comp (algebraMap (S.integer F) F)).toAlgebra

/-- **`ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`**: `O_{F',S'}` is the integral
closure of `O_{F,S}` in `F'`. -/
theorem integer_isIntegralClosure :
    IsIntegralClosure ((primesOver S F').integer F') (S.integer F) F' := by
  sorry

/-- `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`: finitely generated. -/
theorem integer_finite : Module.Finite (S.integer F) ((primesOver S F').integer F') := by
  sorry

/-- `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`: projective. -/
theorem integer_projective : Module.Projective (S.integer F) ((primesOver S F').integer F') := by
  sorry

/-- `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`: of rank `[F' : F]`. -/
theorem finrank_integer :
    Module.finrank (S.integer F) ((primesOver S F').integer F') = Module.finrank F F' := by
  sorry

instance : Module.Finite (S.integer F) ((primesOver S F').integer F') := integer_finite S F'

instance : Module.Projective (S.integer F) ((primesOver S F').integer F') :=
  integer_projective S F'

/-- `O_{F',S'}` is torsion-free over `O_{F,S}` (an extension of domains). -/
instance : Module.IsTorsionFree (S.integer F) ((primesOver S F').integer F') := by
  sorry

open TauCeti.RingK0

/-- The Steinitz class `𝔰 = det_{O_{F,S}}(O_{F',S'}) ∈ Cl(O_{F,S})`: the class-group coordinate of
`[O_{F',S'}] ∈ K₀(O_{F,S})`. -/
def steinitzClass : ClassGroup (S.integer F) :=
  Additive.toMul (rankClassGroupEquiv (S.integer F)
    (cls (S.integer F) ((primesOver S F').integer F'))).2

/-- `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, the pullback: `i^*(n, c) = (n, ext c)`,
with `ext` Mathlib's `ClassGroup.extendedHom`. -/
theorem rankClassGroupEquiv_baseChange (x : K0 (S.integer F)) :
    rankClassGroupEquiv _ (RingK0.baseChange _ (integerRingHom S F') x) =
      ((rankClassGroupEquiv _ x).1,
        Additive.ofMul (ClassGroup.extendedHom (S.integer F) ((primesOver S F').integer F')
          (Additive.toMul (rankClassGroupEquiv _ x).2))) := by
  sorry

/-- `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, the transfer:
`i_*(n, c') = (d n, N(c') 𝔰^n)`, with `N` Tau Ceti's `ClassGroup.relNorm` and `d = [F' : F]`
(Z.4's formula `det(Res P) = N(det P) · 𝔰^{rank P}`). -/
theorem rankClassGroupEquiv_transfer (y : K0 ((primesOver S F').integer F')) :
    rankClassGroupEquiv _ (RingK0.transfer (S.integer F) y) =
      ((Module.finrank F F' : ℤ) * (rankClassGroupEquiv _ y).1,
        Additive.ofMul (ClassGroup.relNorm (R := S.integer F)
            (Additive.toMul (rankClassGroupEquiv _ y).2) *
          steinitzClass S F' ^ (rankClassGroupEquiv _ y).1)) := by
  sorry

/-- **`ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`**: `i_* i^*` is multiplication by
`[O_{F',S'}] = (d, 𝔰)`, that is `(n, c) ↦ (d n, c^d 𝔰^n)`. It is multiplication by the degree on
all of `K₀` only when the Steinitz class `𝔰` is trivial. -/
theorem K0_transfer_comp_baseChange (x : K0 (S.integer F)) :
    rankClassGroupEquiv _
        (RingK0.transfer (S.integer F) (RingK0.baseChange _ (integerRingHom S F') x)) =
      ((Module.finrank F F' : ℤ) * (rankClassGroupEquiv _ x).1,
        Additive.ofMul (Additive.toMul (rankClassGroupEquiv _ x).2 ^ Module.finrank F F' *
          steinitzClass S F' ^ (rankClassGroupEquiv _ x).1)) := by
  sorry

-- acceptance (`i_*(1) = (d, 𝔰)`, not `(d, 1)`): the class of `O_{F',S'}` over `O_{F,S}`.
example : rankClassGroupEquiv _ (cls (S.integer F) ((primesOver S F').integer F')) =
    ((Module.finrank F F' : ℤ), Additive.ofMul (steinitzClass S F')) := by
  sorry

open TauCeti.RingK1

/-- `ArithmeticKTheory:N.1/transfer-and-norm-on-units`, the pullback: under the determinant the
map `K₁(O_{F,S}) → K₁(O_{F',S'})` is the inclusion of units. -/
theorem K1_det_map_integerRingHom (x : K1 (S.integer F)) :
    RingK1.det _ (RingK1.map (integerRingHom S F') x) =
      Units.map (integerRingHom S F' : S.integer F →* (primesOver S F').integer F')
        (RingK1.det _ x) := by
  sorry

/-- `ArithmeticKTheory:N.1/transfer-and-norm-on-units`: the field norm `N_{F'/F}` maps
`S'`-units to `S`-units. -/
theorem norm_mem_unit {x : F'ˣ} (hx : x ∈ (primesOver S F').unit F') :
    Units.map (Algebra.norm F) x ∈ S.unit F := by
  sorry

/-- `ArithmeticKTheory:N.1/transfer-and-norm-on-units`, the transfer: under the determinant, and
inside `Fˣ`, the transfer `K₁(O_{F',S'}) → K₁(O_{F,S})` is the field norm. -/
theorem K1_det_transfer (y : K1 ((primesOver S F').integer F')) :
    Units.map (algebraMap (S.integer F) F : S.integer F →* F)
        (RingK1.det _ (RingK1.transfer (S.integer F) y)) =
      Units.map (Algebra.norm F) (Units.map (algebraMap ((primesOver S F').integer F') F' :
        (primesOver S F').integer F' →* F') (RingK1.det _ y)) := by
  sorry

/-- **`ArithmeticKTheory:N.1/transfer-and-norm-on-units`**: `i_* i^* = (·)^d` on `K₁(O_{F,S})`,
also when the Steinitz class is non-trivial (it acts trivially on units). -/
theorem K1_transfer_comp_map (x : K1 (S.integer F)) :
    RingK1.transfer (S.integer F) (RingK1.map (integerRingHom S F') x) =
      x ^ Module.finrank F F' := by
  sorry

end FiniteExtension

section KOne

variable {F : Type u} [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))

/-- `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, what the node adds: `Fˣ = K₁(F)`
is not finitely generated (already `ℚˣ` maps onto `⊕_p ℤ` by the `p`-adic valuations). -/
theorem not_fg_units : ¬ Group.FG Fˣ := by
  sorry

/-- `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`: for finite `S` the `S`-units are
finitely generated (Tau Ceti's `Set.unit_fg_of_units`), so they are never all of `Fˣ`. -/
theorem unit_ne_top [Finite S] : S.unit F ≠ ⊤ := by
  sorry

/-- `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`: `K₁(O_{F,S}) → K₁(F)` is
injective (`SK₁(O_{F,S}) = 0`, Bass–Milnor–Serre, imported from `KTheoryLowDegrees:U.4`). -/
theorem K1_map_integer_injective [Finite S] :
    Function.Injective (RingK1.map (algebraMap (S.integer F) F)) := by
  sorry

/-- **`ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`**: under the determinant
`K₁(F) ≅ Fˣ`, the image of `K₁(O_{F,S})` is the `S`-unit group `S.unit F`. -/
theorem K1_integer_det [Finite S] :
    ((RingK1.det F).comp (RingK1.map (algebraMap (S.integer F) F))).range = S.unit F := by
  sorry

end KOne

end TauCeti.ArithmeticK

/-! ## `ArithmeticKTheory:N.2` — localisation and finite support

The localisation sequence of a Dedekind domain lives in all degrees and needs `K_n` for `n ≥ 2`,
Quillen's localisation and dévissage theorems and the filtered-colimit compatibility; none is in
either pinned library. What is stated here is its end in degrees one and zero in classical form —
the divisor and the class group, with the pinned sign `e_𝔭 ↦ [𝔭]⁻¹` — and the `S`-unit and
class-group sequence, whose unpinned middle exactness is the new statement. -/

namespace TauCeti.ArithmeticK

open IsDedekindDomain NumberField

section ClassicalRow

variable {R : Type u} [CommRing R] [IsDedekindDomain R] (K : Type v) [Field K] [Algebra R K]
  [IsFractionRing R K]

/-- The divisor `Fˣ → ⊕_𝔭 ℤ`, `f ↦ (ord_𝔭 f)_𝔭` (finitely supported by Tau Ceti's
`HeightOneSpectrum.finite_setOfPred_valuation_ne_one`). Mathlib's multiplicative valuation is
`v(f) = ofAdd (-ord_v f)`, whence the sign. -/
def divisor : Additive Kˣ →+ (HeightOneSpectrum R →₀ ℤ) where
  toFun x := Finsupp.ofSupportFinite
    (fun v => -Multiplicative.toAdd (v.valuationOfNeZero (Additive.toMul x))) (by sorry)
  map_zero' := by
    sorry
  map_add' := by
    sorry

variable (R) in
/-- The class map `⊕_𝔭 ℤ → Cl(R)` with the pinned convention `e_𝔭 ↦ [𝔭]⁻¹`. -/
def divisorClassMap : (HeightOneSpectrum R →₀ ℤ) →+ Additive (ClassGroup R) :=
  Finsupp.liftAddHom fun v => zmultiplesHom _ (Additive.ofMul v.classGroupMk⁻¹)

/-- The convention pin: `e_𝔭 ↦ [𝔭]⁻¹`. -/
theorem divisorClassMap_single (v : HeightOneSpectrum R) :
    divisorClassMap R (Finsupp.single v 1) = Additive.ofMul v.classGroupMk⁻¹ := by
  simp [divisorClassMap]

/-- `ArithmeticKTheory:N.2/the-three-classical-rows`, row (a) in classical form (I.3.6): the
ideal-class-group sequence `Fˣ →div ⊕_𝔭 ℤ → Cl(R) → 0` is exact at `⊕_𝔭 ℤ`. With the class map
`e_𝔭 ↦ [𝔭]` the divisor must be replaced by `−div`. -/
theorem divisor_classGroup_exact : Function.Exact (divisor (R := R) K) (divisorClassMap R) := by
  sorry

/-- `ArithmeticKTheory:N.2/the-three-classical-rows`, row (a): the class map is onto. -/
theorem divisorClassMap_surjective : Function.Surjective (divisorClassMap R) := by
  sorry

/-- `ArithmeticKTheory:N.2/the-three-classical-rows`, row (a): `1 → Rˣ → Fˣ →div ⊕_𝔭 ℤ` is exact
at `Fˣ`. -/
theorem ker_divisor :
    (divisor (R := R) K).ker =
      Subgroup.toAddSubgroup (Units.map (algebraMap R K : R →* K)).range := by
  sorry

/-- `ArithmeticKTheory:N.2/the-three-classical-rows`, row (a) in `K₀`: the class
`[R/𝔭] = [R] − [𝔭]` has rank–class coordinates `(0, [𝔭]⁻¹)`, the sign that `divisorClassMap`
pins. (The projectivity of `𝔭` is Mathlib's `Submodule.projective_of_isUnit`, taken here as an
instance argument.) -/
theorem rankClassGroupEquiv_cls_sub_cls (v : HeightOneSpectrum R)
    [Module.Projective R v.asIdeal] :
    RingK0.rankClassGroupEquiv R (RingK0.cls R R - RingK0.cls R v.asIdeal) =
      (0, Additive.ofMul v.classGroupMk⁻¹) := by
  sorry

/- `ArithmeticKTheory:N.2/the-three-classical-rows`, the K-theoretic identifications: that the
boundary `K₁(F) → ⊕_𝔭 K₀(R/𝔭)` of (6.6) is `divisor` under `K₁(F) = Fˣ`, `K₀(R/𝔭) = ℤ`, that
the map `⊕_𝔭 ℤ → K₀(R)` of (6.6) sends `e_𝔭` to `[R] − [𝔭]`, and row (b)
`⊕_𝔭 K₂(R/𝔭) → K₂(R) → K₂(F) → ⊕_𝔭 (R/𝔭)ˣ → SK₁(R) → 1`: not stated here; needs the localisation
sequence (6.6) with its boundary and `K₂` (supplier: GeneralAlgebraicKTheory K.1, K.3, K.7, with
KTheoryLowDegrees Z.4, U.3, U.5). The tame-symbol identification is K2SymbolsBrauer T.3's. -/

end ClassicalRow

section SUnitSequence

variable {R : Type u} [CommRing R] [IsDedekindDomain R] (S : Set (HeightOneSpectrum R)) [Finite S]
  (K : Type v) [Field K] [Algebra R K] [IsFractionRing R K]

/-- The class map `⊕_{𝔭 ∈ S} ℤ → Cl(R)` in Tau Ceti's `Set.unitValuation` coordinates
`f v = ofAdd (-ord_v)`: `f ↦ ∏_v [v] ^ toAdd (f v)`, which is `e_𝔭 ↦ [𝔭]⁻¹` on divisors
(`sClassMap_mulSingle`). -/
def sClassMap : (↥S → Multiplicative ℤ) →* ClassGroup R :=
  haveI := Fintype.ofFinite S
  MonoidHom.noncommPiCoprod
    (fun v : S => zpowersHom (ClassGroup R) (v : HeightOneSpectrum R).classGroupMk)
    fun _ _ _ _ _ => Commute.all _ _

open scoped Classical in
/-- The convention pin: the divisor `e_v` (order `1` at `v`, which `Set.unitValuation` writes as
`ofAdd (-1)`) maps to `[v]⁻¹`. -/
theorem sClassMap_mulSingle (v : S) :
    sClassMap S (Pi.mulSingle v (Multiplicative.ofAdd (-1))) =
      (v : HeightOneSpectrum R).classGroupMk⁻¹ := by
  sorry

/-- `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`, exactness at `⊕_{𝔭∈S} ℤ` (not
pinned): the valuations of the `S`-units are exactly the divisors supported on `S` whose class
vanishes. -/
theorem range_unitValuation_eq_ker_sClassMap :
    (Set.unitValuation S K).range = (sClassMap S).ker := by
  sorry

/-- `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`, exactness at `Cl(R)` in the form of
the class map (Tau Ceti's `IsDedekindDomain.ker_integer_extendedHom`). -/
theorem ker_integer_extendedHom_eq_range_sClassMap :
    (ClassGroup.extendedHom R (S.integer K)).ker = (sClassMap S).range := by
  sorry

/-- **`ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`**: the exact sequence
`1 → Rˣ → O_Sˣ → ⊕_{𝔭∈S} ℤ → Cl(R) → Cl(O_S) → 0`, with the valuation map `Set.unitValuation`, the
class map `e_𝔭 ↦ [𝔭]⁻¹` and extension of ideal classes. Exactness at `O_Sˣ`
(`Set.unitValuation_ker`) and at the end (`integer_extendedHom_surjective`) is Tau Ceti's. -/
theorem sUnit_classGroup_exact :
    (Set.unitValuation S K).ker = ((∅ : Set (HeightOneSpectrum R)).unit K).subgroupOf (S.unit K) ∧
      (Set.unitValuation S K).range = (sClassMap S).ker ∧
      (ClassGroup.extendedHom R (S.integer K)).ker = (sClassMap S).range ∧
      Function.Surjective (ClassGroup.extendedHom R (S.integer K)) :=
  ⟨Set.unitValuation_ker S K, range_unitValuation_eq_ker_sClassMap S K,
    ker_integer_extendedHom_eq_range_sClassMap S K, integer_extendedHom_surjective K S⟩

end SUnitSequence

section ResidueFields

variable {R : Type u} [CommRing R] [IsDedekindDomain R] (S : Set (HeightOneSpectrum R))
  (K : Type v) [Field K] [Algebra R K] [IsFractionRing R K]

/-- `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, the `S`-integer
specialisation: for `𝔭 ∉ S`, `R/𝔭 → O_S/𝔭O_S` is an isomorphism, so the residue terms of the
sequence of `O_S` are those of `R` at the primes outside `S` (with Tau Ceti's
`integerHeightOneSpectrumEquiv` for the primes). -/
theorem bijective_quotientMap_integer {v : HeightOneSpectrum R} (hv : v ∉ S) :
    Function.Bijective (Ideal.quotientMap (v.asIdeal.map (algebraMap R (S.integer K)))
      (algebraMap R (S.integer K)) Ideal.le_comap_map) := by
  sorry

end ResidueFields

/- `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`: the long exact sequence
`⋯ → K_{n+1}(F) →∂ ⊕_𝔭 K_n(R/𝔭) → K_n(R) → K_n(F) → ⋯ → K₀(F) → 0` of `K_*(R)`-modules: not stated
here; needs `K_n` for all `n`, Quillen localisation and dévissage and the filtered colimit over
`R[1/s]` (supplier: GeneralAlgebraicKTheory K.1, K.3, K.7). -/

/- `ArithmeticKTheory:N.2/finite-support`: that the boundary `∂ : K_{n+1}(F) → ⊕_𝔭 K_n(R/𝔭)` lands
in the direct sum, each class coming from some `K_{n+1}(R[1/s])` with support in the primes over
`s`: not stated here; needs `K_n` and the boundary of the localisation sequence (supplier:
GeneralAlgebraicKTheory K.1, K.3, K.7). In degree one it is the finite support of `divisor`. -/

/- `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`: the morphism of
localisation sequences induced by the transfers `N_{R'/R}`, `N_{F'/F}` and `⊕ N_{𝔭'/𝔭}`: not stated
here; needs the localisation sequences and their transfers in all degrees (supplier:
GeneralAlgebraicKTheory K.1, K.3). The degree-one shadow, that `N_{F'/F}` maps `S'`-units to
`S`-units, is `norm_mem_unit`. -/

/- `ArithmeticKTheory:N.2/even-degree-injectivity`: `K_n(R) → K_n(F)` is injective for even `n ≥ 2`
when all residue fields are finite: not stated here; needs `K_n` for `n ≥ 2`, exactness of (6.6) and
`K_{2j}(𝔽_q) = 0` (supplier: GeneralAlgebraicKTheory K.1, K.3; KTheoryFiniteLocalFields L.1). -/

end TauCeti.ArithmeticK

/-! ## `ArithmeticKTheory:N.3` — finite generation and the ranks

Every statement of N.3 is about `K_n` for all `n`, so only its degree-zero and degree-one cases,
the cross-checks the packet names, are stated in Lean; the rank function is defined to pin the
period-four convention. -/

namespace TauCeti.ArithmeticK

open IsDedekindDomain NumberField

section Ranks

variable (F : Type u) [Field F] [NumberField F]

/-- The Borel rank `ρ(n)` for `n ≥ 2`: `r₁ + r₂`, `r₂` or `0` according as `n ≡ 1 (mod 4)`,
`n ≡ 3 (mod 4)` or `n` is even (`ArithmeticKTheory:N.3:ranks/borel-rank-theorem`). At `n = 1` it
is not the rank of `K₁(O_{F,S})`, which is `r₁ + r₂ + |S| − 1`. -/
def borelRank (n : ℕ) : ℕ :=
  if n % 4 = 1 then InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F
  else if n % 4 = 3 then InfinitePlace.nrComplexPlaces F else 0

-- acceptance (`borel-rank-theorem`): `K₃(ℤ)`, `K₇(ℤ)` have rank `0`, `K₅(ℤ)`, `K₉(ℤ)` rank `1`.
example : borelRank ℚ 3 = 0 ∧ borelRank ℚ 7 = 0 ∧ borelRank ℚ 5 = 1 ∧ borelRank ℚ 9 = 1 := by
  sorry

-- acceptance (`borel-rank-theorem`): the even groups have rank `0`.
example (j : ℕ) : borelRank F (2 * j) = 0 := by
  simp only [borelRank]
  split_ifs <;> omega

-- acceptance (`borel-rank-theorem`, degree one excluded): for `ℤ` the period-four value at `n = 1`
-- is `1`, while `K₁(ℤ) = {±1}` has rank `0`.
example : borelRank ℚ 1 = 1 := by
  sorry

end Ranks

section LowDegrees

variable {F : Type u} [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))

/-- `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, degree zero:
`K₀(O_{F,S}) ≅ ℤ ⊕ Cl(O_{F,S})` is finitely generated (Tau Ceti's `finite_integer_classGroup`). -/
theorem fg_K0_integer : AddGroup.FG (RingK0.K0 (S.integer F)) := by
  sorry

/-- `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, degree one:
`K₁(O_{F,S}) ≅ O_{F,S}ˣ` is finitely generated for finite `S` (Tau Ceti's
`Set.unit_fg_of_units`). -/
theorem fg_K1_integer [Finite S] : Group.FG (RingK1.K1 (S.integer F)) := by
  sorry

-- acceptance (`finite-generation-of-K-of-S-integers`): for infinite `S` the conclusion fails in
-- degree one; inverting every prime gives `K₁ = Fˣ`, which is not finitely generated.
example : ¬ Group.FG (RingK1.K1 ((Set.univ : Set (HeightOneSpectrum (𝓞 F))).integer F)) := by
  sorry

end LowDegrees

/- `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`: `K_n(O_{F,S})` is
finitely generated for every `n ≥ 0` and finite `S`: not stated here beyond degrees zero and one;
needs `K_n` for `n ≥ 2` and the localisation sequence (supplier: GeneralAlgebraicKTheory K.1, K.3;
KTheoryFiniteLocalFields L.1). -/

/- `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`: a Dedekind domain with
finite `Pic(R)` and finitely generated `H_n(Aut_R(P); St(P ⊗_R F))` has finitely generated
`K_n(R)`: not stated here; needs `K_n` (Quillen's Q-construction) and the Steinberg module of the
Tits building (supplier: GeneralAlgebraicKTheory K.1; StableHomotopyKTheory H.2; the gap on the
arithmetic-group input). -/

/- `ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem`: `K_n(R)` is finitely
generated for an integrally closed `R ⊂ F` finite over `ℤ`: not stated here; needs `K_n` and the
Borel–Serre finiteness (supplier: GeneralAlgebraicKTheory K.1; BorelRegulators R.1). -/

/- `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`: `K_n(O_{F,S}) ⊗ ℚ ≅ K_n(F) ⊗ ℚ` and
`rank K_n(O_{F,S}) = borelRank F n` for `n ≥ 2`: not stated here; needs `K_n` for `n ≥ 2` (supplier:
GeneralAlgebraicKTheory K.1; BorelRegulators R.3; KTheoryFiniteLocalFields L.1). -/

/- `ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion`: `K_{2i}(F)` is an
infinite torsion group for `i ≥ 1`: not stated here; needs `K_{2i}(F)` and the localisation sequence
(supplier: GeneralAlgebraicKTheory K.1, K.3; BorelRegulators R.3; KTheoryFiniteLocalFields L.1). -/

/- `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`: `K_n(O_{F,S}) ≅ ℤ^{borelRank F n} ⊕ T_n`
with `T_n` finite for `n ≥ 2` (Mathlib's `AddCommGroup.equiv_free_prod_directSum_zmod`), the
torsion canonical and the splitting not: not stated here; needs `K_n` for `n ≥ 2` (supplier:
GeneralAlgebraicKTheory K.1; BorelRegulators R.3). -/

end TauCeti.ArithmeticK

/-! ## `ArithmeticKTheory:N.4` — the numbers `w_i(F)`

No K-theory enters: `W_i(F)` is the group of `G_F`-invariants of the stand-in `TateTwist F i` for
`MotivicEtaleKTheory:M.1`'s `ℚ/ℤ(i)`, taken with Tau Ceti's `ContCohomology.H0`, and restriction
and transfer are Tau Ceti's `explicitRes0` and `explicitCor0`. For an intermediate field `E` of
`Fˢ/F` the group `W_i(E)` is computed inside `Fˢ` as the invariants of `G_E = Gal(Fˢ/E)` on the same
module; its identification with `WInvariant E i` (built on `SeparableClosure E`) depends on an
`E`-isomorphism `SeparableClosure E ≃ Fˢ` and is not canonical, which is why `res` and `cor` are
stated inside `Fˢ`. -/

namespace TauCeti

open NumberField

section WInvariant

variable (F : Type u) [Field F] (i : ℤ)

/-- **`TauCeti.WInvariant`** (`ArithmeticKTheory:N.4/the-w-invariant`):
`W_i(F) = H⁰(G_F, ℚ/ℤ(i))`, the fixed points of `G_F` on the twist, as an additive subgroup. -/
def WInvariant : AddSubgroup (TateTwist F i) :=
  ContCohomology.H0 (AbsoluteGaloisGroup F) (TateTwist F i)

/-- **`TauCeti.wInvariant`**: `w_i(F) = #W_i(F)`. It is the source's number only when `W_i(F)` is
finite (`Nat.card` of an infinite group is `0`), so every statement about it carries that
hypothesis or a value that implies it. -/
def wInvariant : ℕ := Nat.card (WInvariant F i)

namespace WInvariant

/-- **`TauCeti.WInvariant.primary`**: `W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}`, the `ℓ`-primary
component of `W_i(F)` (Mathlib's `AddCommGroup.primaryComponent`); for `ℓ = char F` it is `0`. -/
def primary (ℓ : ℕ) : AddSubgroup (WInvariant F i) :=
  AddCommGroup.primaryComponent (WInvariant F i) ℓ

/-- **`TauCeti.WInvariant.isInternal_primary`**: `W_i(F)` is the internal direct sum of the
`W_i^{(ℓ)}(F)` over the primes `ℓ ≠ char F`. -/
theorem isInternal_primary :
    DirectSum.IsInternal (fun ℓ : {ℓ : ℕ // ℓ.Prime ∧ (ℓ : F) ≠ 0} => primary F i ℓ) := by
  sorry

/-- **`TauCeti.WInvariant.isCyclic`**: a finite `W_i(F)` is cyclic, being a finite subgroup of
`µ(Fˢ) ⊆ (Fˢ)ˣ` (Mathlib's `isCyclic_subgroup_units`). -/
instance isCyclic [Finite (WInvariant F i)] : IsAddCyclic (WInvariant F i) := by
  sorry

end WInvariant

/-- **`TauCeti.wInvariant_eq_prod_primary`**: `w_i(F) = ∏_ℓ w_i^{(ℓ)}(F)`, a finite product. -/
theorem wInvariant_eq_prod_primary [Finite (WInvariant F i)] :
    wInvariant F i = ∏ᶠ (ℓ : ℕ) (_ : ℓ.Prime), Nat.card (WInvariant.primary F i ℓ) := by
  sorry

namespace WInvariant

/-- **`TauCeti.WInvariant.neg_eq`**: `W_{-i}(F) = W_i(F)` as subgroups of `µ(Fˢ)`. -/
theorem neg_eq :
    (WInvariant F (-i)).map (TateTwist.toRoots F (-i)).toAddMonoidHom =
      (WInvariant F i).map (TateTwist.toRoots F i).toAddMonoidHom := by
  sorry

/-- **`TauCeti.WInvariant.zero_eq_top`**: `W₀(F)` is all of `µ(Fˢ)`, the action being trivial. -/
theorem zero_eq_top : WInvariant F 0 = ⊤ :=
  ContCohomology.H0_eq_top_of_smul_eq_self fun g x => by
    change TateTwist.twistAct F 0 g x = x
    unfold TateTwist.twistAct
    simp

/-- **`TauCeti.WInvariant.oneEquivRootsOfUnity`**: `W₁(F) ≅ µ(F)`, the roots of unity of `F`
(for a number field, `NumberField.Units.torsion F`); from `InfiniteGalois` fixed points. -/
def oneEquivRootsOfUnity : WInvariant F 1 ≃+ Additive (CommGroup.torsion Fˣ) :=
  sorry

/-- A finite intermediate field of `Fˢ/F` has a fixing subgroup of finite index
(`IntermediateField.finrank_eq_fixingSubgroup_index`). -/
instance fixingSubgroup_finiteIndex (E : IntermediateField F (SeparableClosure F))
    [FiniteDimensional F E] : E.fixingSubgroup.FiniteIndex :=
  ⟨by rw [← IntermediateField.finrank_eq_fixingSubgroup_index]; exact Module.finrank_pos.ne'⟩

/-- **`TauCeti.WInvariant.res`**: restriction `W_i(F) → W_i(E)` to an intermediate field `E` of
`Fˢ/F`, Tau Ceti's `explicitRes0` (the inclusion of fixed points). -/
def res (E : IntermediateField F (SeparableClosure F)) :
    WInvariant F i →+ ContCohomology.H0 E.fixingSubgroup (TateTwist F i) :=
  ContCohomology.explicitRes0 (AbsoluteGaloisGroup F) (TateTwist F i) E.fixingSubgroup

/-- `TauCeti.WInvariant.res` is injective. -/
theorem res_injective (E : IntermediateField F (SeparableClosure F)) :
    Function.Injective (res F i E) := by
  intro x y h
  have h' := congrArg
    (fun z : ContCohomology.H0 E.fixingSubgroup (TateTwist F i) => (z : TateTwist F i)) h
  simp only [res] at h'
  exact Subtype.ext h'

/-- **`TauCeti.WInvariant.cor`**: transfer `W_i(E) → W_i(F)` for a finite intermediate field,
Tau Ceti's `explicitCor0` (the norm over `G_F/G_E`). -/
def cor (E : IntermediateField F (SeparableClosure F)) [FiniteDimensional F E] :
    ContCohomology.H0 E.fixingSubgroup (TateTwist F i) →+ WInvariant F i :=
  ContCohomology.explicitCor0 (AbsoluteGaloisGroup F) (TateTwist F i) E.fixingSubgroup

/-- **`TauCeti.WInvariant.cor_comp_res`**: `cor ∘ res = [E : F] • id`, from Tau Ceti's
`explicitCor0_comp_res0` and Mathlib's `finrank_eq_fixingSubgroup_index`. -/
theorem cor_comp_res (E : IntermediateField F (SeparableClosure F)) [FiniteDimensional F E]
    (m : WInvariant F i) : cor F i E (res F i E m) = Module.finrank F E • m := by
  rw [IntermediateField.finrank_eq_fixingSubgroup_index]
  exact ContCohomology.explicitCor0_comp_res0 _ _ _ m

end WInvariant

/-- **`TauCeti.wInvariant_dvd_of_finite`**: for `E/F` finite separable with `W_i(E)` finite,
`W_i(F)` is finite and `w_i(F) ∣ w_i(E)`. -/
theorem wInvariant_dvd_of_finite (E : Type v) [Field E] [Algebra F E] [FiniteDimensional F E]
    [Algebra.IsSeparable F E] [Finite (WInvariant E i)] :
    Finite (WInvariant F i) ∧ wInvariant F i ∣ wInvariant E i := by
  sorry

end WInvariant

/-! ### Unit tests for `ArithmeticKTheory:N.4/the-w-invariant` -/

section WInvariantTests

-- test TauCeti.wInvariant_finiteField (computation)
example (k : Type u) [Field k] [Fintype k] (n : ℕ) (hn : 0 < n) :
    wInvariant k n = Fintype.card k ^ n - 1 := by
  sorry

-- test TauCeti.wInvariant_rat_of_odd (computation)
example (i : ℤ) (hi : Odd i) : wInvariant ℚ i = 2 := by
  sorry

-- test TauCeti.wInvariant_gaussian_of_odd (computation)
example (K : Type u) [Field K] [CharZero K] [IsCyclotomicExtension {4} ℚ K] (i : ℤ) (hi : Odd i) :
    wInvariant K i = 4 := by
  sorry

-- test TauCeti.wInvariant_one_eq_torsionOrder (compatibility)
example (F : Type u) [Field F] [NumberField F] :
    wInvariant F 1 = NumberField.Units.torsionOrder F := by
  sorry

-- test TauCeti.WInvariant.zero_infinite (degenerate)
example (F : Type u) [Field F] : Infinite (WInvariant F 0) := by
  sorry

-- test TauCeti.wInvariant_two_rat_ne_torsionOrder (non-example)
example : wInvariant ℚ 2 = 24 ∧ NumberField.Units.torsionOrder ℚ = 2 := by
  sorry

-- test TauCeti.WInvariant.not_tensorPower (non-example)
example : Subsingleton ((ℚ ⧸ (Int.castAddHom ℚ).range) ⊗[ℤ] (ℚ ⧸ (Int.castAddHom ℚ).range)) ∧
    wInvariant ℚ 2 = 24 := by
  sorry

-- test TauCeti.WInvariant.neg_eq_rat (characterisation)
example : (WInvariant ℚ (-2)).map (TateTwist.toRoots ℚ (-2)).toAddMonoidHom =
      (WInvariant ℚ 2).map (TateTwist.toRoots ℚ 2).toAddMonoidHom ∧ wInvariant ℚ (-2) = 24 := by
  sorry

end WInvariantTests

/-! ### `ArithmeticKTheory:N.4/exceptional-fields-at-two` -/

/-- **`TauCeti.IsExceptional`** (`ArithmeticKTheory:N.4/exceptional-fields-at-two`, the source's
definition): `char F = 0` and `Gal(F(ζ_{2^ν})/F)` is not cyclic for all large `ν`, with Mathlib's
`CyclotomicField (2 ^ ν) F` as the model of `F(ζ_{2^ν})`. -/
structure IsExceptional (F : Type u) [Field F] : Prop where
  /-- **`TauCeti.IsExceptional.charZero`**: an exceptional field has characteristic zero. -/
  charZero : CharZero F
  /-- For all large `ν`, `Gal(F(ζ_{2^ν})/F)` is not cyclic. -/
  eventually_not_isCyclic : ∀ᶠ ν in Filter.atTop,
    ¬ IsCyclic (CyclotomicField (2 ^ ν) F ≃ₐ[F] CyclotomicField (2 ^ ν) F)

namespace IsExceptional

variable (F : Type u) [Field F]

/-- **`TauCeti.IsExceptional.iff_inf_cyclotomic_isTotallyReal`**: a number field is exceptional
iff `F ∩ ℚ(ζ_{2^∞})` is totally real (every complex embedding of `F` is real on it), iff `-1` is in
the image of `G_F` under the `2`-adic cyclotomic character. -/
theorem iff_inf_cyclotomic_isTotallyReal [NumberField F] :
    (IsExceptional F ↔ ∀ φ : F →+* ℂ, ∀ x ∈ (Subfield.closure
        {z : SeparableClosure F | ∃ ν : ℕ, z ^ 2 ^ ν = 1}).comap
          (algebraMap F (SeparableClosure F)), (φ x).im = 0) ∧
      (IsExceptional F ↔ ∃ g : AbsoluteGaloisGroup F,
        cyclotomicCharacter (SeparableClosure F) 2 g.toRingEquiv = -1) := by
  sorry

/-- **`TauCeti.IsExceptional.of_nrRealPlaces_pos`**: a number field with a real place is
exceptional (complex conjugation acts on `µ_{2^∞}` by `-1`). -/
theorem of_nrRealPlaces_pos [NumberField F] (h : 0 < InfinitePlace.nrRealPlaces F) :
    IsExceptional F := by
  sorry

/-- **`TauCeti.IsExceptional.not_of_sqrt_neg_one_mem`**: if `-1` is a square in `F`, `F` is
non-exceptional (`Gal(F(ζ_{2^ν})/F) ⊆ 1 + 4ℤ/2^ν` is cyclic). -/
theorem not_of_sqrt_neg_one_mem (h : ∃ x : F, x ^ 2 = -1) : ¬ IsExceptional F := by
  sorry

/-- **`TauCeti.IsExceptional.of_extension`**: a subfield of an exceptional field is exceptional. -/
theorem of_extension (E : Type v) [Field E] [Algebra F E] (h : IsExceptional E) :
    IsExceptional F := by
  sorry

/-- **`TauCeti.IsExceptional.rat`**: `ℚ` is exceptional. -/
theorem rat : IsExceptional ℚ := by
  sorry

end IsExceptional

section ExceptionalTests

-- test TauCeti.IsExceptional.rat (computation)
example : IsExceptional ℚ := by
  sorry

-- test TauCeti.IsExceptional.not_gaussian (computation)
example (K : Type u) [Field K] [NumberField K] [IsCyclotomicExtension {4} ℚ K] :
    ¬ IsExceptional K := by
  sorry

-- test TauCeti.IsExceptional.sqrt_neg_seven (computation)
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = -7) : IsExceptional K := by
  sorry

-- test TauCeti.IsExceptional.not_sqrt_neg_two (non-example)
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = -2) : IsTotallyComplex K ∧ (¬ ∃ y : K, y ^ 2 = -1) ∧ ¬ IsExceptional K := by
  sorry

-- test TauCeti.IsExceptional.not_of_charP (degenerate)
example : ¬ IsExceptional (ZMod 3) := by
  intro h
  have := h.charZero
  exact absurd (ZMod.natCast_self 3) (Nat.cast_ne_zero.mpr (by norm_num))

end ExceptionalTests

/-! ### The theorems of `ArithmeticKTheory:N.4` -/

section WTheorems

variable (F : Type u) [Field F] (i : ℤ)

/-- **`ArithmeticKTheory:N.4/exponent-criterion`** (K-book Lemma VI.2.2.1): for `ℓ ≠ char F`,
`µ_{ℓ^ν}(i) ⊆ W_i(F)` iff `Gal(F(ζ_{ℓ^ν})/F)` has exponent dividing `i` (the source's proof says
"exponent `i`"). -/
theorem WInvariant.exponent_criterion (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : F) ≠ 0) (ν : ℕ)
    (L : Type v) [Field L] [Algebra F L] [IsCyclotomicExtension {ℓ ^ ν} F L] :
    (TateTwist.ofKummerCoeff F i (ℓ ^ ν)).range ≤ WInvariant F i ↔
      (Monoid.exponent (L ≃ₐ[F] L) : ℤ) ∣ i := by
  sorry

/-- `ArithmeticKTheory:N.4/exponent-criterion`, the max formula: when `W_i^{(ℓ)}(F)` is finite,
`ℓ^ν ∣ w_i^{(ℓ)}(F)` iff `Gal(F(ζ_{ℓ^ν})/F)` has exponent dividing `i`. -/
theorem WInvariant.pow_dvd_card_primary_iff (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : (ℓ : F) ≠ 0)
    [Finite (WInvariant.primary F i ℓ)] (ν : ℕ) :
    ℓ ^ ν ∣ Nat.card (WInvariant.primary F i ℓ) ↔
      (Monoid.exponent (CyclotomicField (ℓ ^ ν) F ≃ₐ[F] CyclotomicField (ℓ ^ ν) F) : ℤ) ∣ i := by
  sorry

/-- `ArithmeticKTheory:N.4/exponent-criterion` over `ℚ`: `ℓ^ν ∣ w_i(ℚ)` iff `(ℤ/ℓ^ν)ˣ` has
exponent dividing `i` (`Gal(ℚ(ζ_{ℓ^ν})/ℚ) ≅ (ℤ/ℓ^ν)ˣ`, `IsCyclotomicExtension.autEquivPow`). -/
theorem wInvariant_rat_dvd_iff (ℓ ν : ℕ) [Fact ℓ.Prime] :
    ℓ ^ ν ∣ wInvariant ℚ i ↔ (Monoid.exponent (ZMod (ℓ ^ ν))ˣ : ℤ) ∣ i := by
  sorry

-- acceptance (`exponent-criterion`): the tests that give `w₂(ℚ) = 8 · 3 = 24`.
example : (Monoid.exponent (ZMod 8)ˣ : ℤ) ∣ 2 ∧ ¬ (Monoid.exponent (ZMod 16)ˣ : ℤ) ∣ 2 ∧
    (Monoid.exponent (ZMod 3)ˣ : ℤ) ∣ 2 ∧ ¬ (Monoid.exponent (ZMod 9)ˣ : ℤ) ∣ 2 ∧
    ∀ ℓ : ℕ, ℓ.Prime → 5 ≤ ℓ → ¬ (Monoid.exponent (ZMod ℓ)ˣ : ℤ) ∣ 2 := by
  sorry

-- acceptance (`exponent-criterion`): the tests that give `w₁₀(ℚ) = 8 · 3 · 11 = 264`; `5 ∤ w₁₀(ℚ)`
-- because `(ℤ/5)ˣ` has exponent `4 ∤ 10`, against the printed `w₁₀ = 1320` of Example VI.2.1.2.
example : (Monoid.exponent (ZMod 8)ˣ : ℤ) ∣ 10 ∧ ¬ (Monoid.exponent (ZMod 16)ˣ : ℤ) ∣ 10 ∧
    (Monoid.exponent (ZMod 3)ˣ : ℤ) ∣ 10 ∧ ¬ (Monoid.exponent (ZMod 9)ˣ : ℤ) ∣ 10 ∧
    ¬ (Monoid.exponent (ZMod 5)ˣ : ℤ) ∣ 10 ∧ ¬ (Monoid.exponent (ZMod 7)ˣ : ℤ) ∣ 10 ∧
    (Monoid.exponent (ZMod 11)ˣ : ℤ) ∣ 10 ∧ ¬ (Monoid.exponent (ZMod 121)ˣ : ℤ) ∣ 10 ∧
    ∀ ℓ : ℕ, ℓ.Prime → 13 ≤ ℓ → ¬ (Monoid.exponent (ZMod ℓ)ˣ : ℤ) ∣ 10 := by
  sorry

/-- **`ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`** (Proposition VI.2.2):
for an odd prime `ℓ ≠ char F`, `L = F(ζ_ℓ)` with `r = [L : F]`, and `a` maximal with a primitive
`ℓ^a`-th root of unity in `L`, `w_i^{(ℓ)}(F) = ℓ^{a + v_ℓ(i)}` if `r ∣ i` and `1` otherwise. -/
theorem WInvariant.card_primary_of_cyclotomic (ℓ : ℕ) [Fact ℓ.Prime] (hℓ2 : ℓ ≠ 2)
    (hℓ : (ℓ : F) ≠ 0) (L : Type v) [Field L] [Algebra F L] [IsCyclotomicExtension {ℓ} F L]
    (a : ℕ) (ha : ∃ ζ : L, IsPrimitiveRoot ζ (ℓ ^ a))
    (ha' : ¬ ∃ ζ : L, IsPrimitiveRoot ζ (ℓ ^ (a + 1))) (hi : i ≠ 0) :
    Nat.card (WInvariant.primary F i ℓ) =
      if (Module.finrank F L : ℤ) ∣ i then ℓ ^ (a + padicValInt ℓ i) else 1 := by
  sorry

/-- `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `a = ∞`: if `L = F(ζ_ℓ)`
contains all `ℓ`-power roots of unity and `[L : F] ∣ i`, then `W_i^{(ℓ)}(F)` is infinite. -/
theorem WInvariant.infinite_primary_of_cyclotomic (ℓ : ℕ) [Fact ℓ.Prime] (hℓ2 : ℓ ≠ 2)
    (hℓ : (ℓ : F) ≠ 0) (L : Type v) [Field L] [Algebra F L] [IsCyclotomicExtension {ℓ} F L]
    (ha : ∀ a : ℕ, ∃ ζ : L, IsPrimitiveRoot ζ (ℓ ^ a)) (hr : (Module.finrank F L : ℤ) ∣ i) :
    Infinite (WInvariant.primary F i ℓ) := by
  sorry

-- acceptance (`computing-w-from-the-cyclotomic-character`, `F = ℚ`, `a = 1`, `r = ℓ - 1`):
-- `w₂^{(3)}(ℚ) = 3`, `w₆^{(3)}(ℚ) = 9`, `w₆^{(7)}(ℚ) = 7`, `w₄^{(5)}(ℚ) = 5`.
example : Nat.card (WInvariant.primary ℚ 2 3) = 3 ∧ Nat.card (WInvariant.primary ℚ 6 3) = 9 ∧
    Nat.card (WInvariant.primary ℚ 6 7) = 7 ∧ Nat.card (WInvariant.primary ℚ 4 5) = 5 := by
  sorry

-- acceptance (`computing-w-from-the-cyclotomic-character`, `F = ℚ(√-7) ⊆ ℚ(ζ₇)`, `r = 3`):
-- `w₃^{(7)}(ℚ(√-7)) = 7` while `w₃^{(7)}(ℚ) = 1`.
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = -7) :
    Nat.card (WInvariant.primary K 3 7) = 7 ∧ Nat.card (WInvariant.primary ℚ 3 7) = 1 := by
  sorry

/-- **`ArithmeticKTheory:N.4/two-primary-w-invariant`**, case (a) of Proposition VI.2.3: if
`√-1 ∈ F` (`char F ≠ 2`) and `a` is maximal with a primitive `2^a`-th root of unity in
`L = F(√-1) = F(ζ₄)`, then `w_i^{(2)}(F) = 2^{a + v₂(i)}` for every `i ≠ 0`. -/
theorem WInvariant.card_two_primary_of_sqrt_neg_one_mem (hF : (2 : F) ≠ 0) (L : Type v)
    [Field L] [Algebra F L] [IsCyclotomicExtension {4} F L] (a : ℕ)
    (ha : ∃ ζ : L, IsPrimitiveRoot ζ (2 ^ a)) (ha' : ¬ ∃ ζ : L, IsPrimitiveRoot ζ (2 ^ (a + 1)))
    (h : ∃ x : F, x ^ 2 = -1) (hi : i ≠ 0) :
    Nat.card (WInvariant.primary F i 2) = 2 ^ (a + padicValInt 2 i) := by
  sorry

/-- `ArithmeticKTheory:N.4/two-primary-w-invariant`, case (b): if `√-1 ∉ F` and `i` is odd,
`w_i^{(2)}(F) = 2`. -/
theorem WInvariant.card_two_primary_of_odd (hF : (2 : F) ≠ 0) (h : ¬ ∃ x : F, x ^ 2 = -1)
    (hi : Odd i) : Nat.card (WInvariant.primary F i 2) = 2 := by
  sorry

/-- `ArithmeticKTheory:N.4/two-primary-w-invariant`, case (c) (the source's Exercise VI.2.2):
if `√-1 ∉ F`, `F` is exceptional and `i ≠ 0` is even, `w_i^{(2)}(F) = 2^{a + v₂(i)}`. -/
theorem WInvariant.card_two_primary_of_isExceptional (hF : (2 : F) ≠ 0) (L : Type v) [Field L]
    [Algebra F L] [IsCyclotomicExtension {4} F L] (a : ℕ)
    (ha : ∃ ζ : L, IsPrimitiveRoot ζ (2 ^ a)) (ha' : ¬ ∃ ζ : L, IsPrimitiveRoot ζ (2 ^ (a + 1)))
    (h : ¬ ∃ x : F, x ^ 2 = -1) (hE : IsExceptional F) (hi : Even i) (hi0 : i ≠ 0) :
    Nat.card (WInvariant.primary F i 2) = 2 ^ (a + padicValInt 2 i) := by
  sorry

/-- `ArithmeticKTheory:N.4/two-primary-w-invariant`, case (d): if `√-1 ∉ F`, `F` is
non-exceptional and `i ≠ 0` is even, `w_i^{(2)}(F) = 2^{a + v₂(i) - 1}`. -/
theorem WInvariant.card_two_primary_of_not_isExceptional (hF : (2 : F) ≠ 0) (L : Type v)
    [Field L] [Algebra F L] [IsCyclotomicExtension {4} F L] (a : ℕ)
    (ha : ∃ ζ : L, IsPrimitiveRoot ζ (2 ^ a)) (ha' : ¬ ∃ ζ : L, IsPrimitiveRoot ζ (2 ^ (a + 1)))
    (h : ¬ ∃ x : F, x ^ 2 = -1) (hE : ¬ IsExceptional F) (hi : Even i) (hi0 : i ≠ 0) :
    Nat.card (WInvariant.primary F i 2) = 2 ^ (a + padicValInt 2 i - 1) := by
  sorry

-- acceptance (`two-primary-w-invariant`, `ℚ`, case (c) with `a = 2`): `w₂^{(2)}(ℚ) = 8`,
-- `w₄^{(2)}(ℚ) = 16`.
example : Nat.card (WInvariant.primary ℚ 2 2) = 8 ∧ Nat.card (WInvariant.primary ℚ 4 2) = 16 := by
  sorry

-- acceptance (`two-primary-w-invariant`, `ℚ(√-2)`, case (d) with `a = 3`): `8`, not the `16` of
-- case (c).
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = -2) : Nat.card (WInvariant.primary K 2 2) = 8 := by
  sorry

-- acceptance (`two-primary-w-invariant`, `ℚ(√2)`, real hence exceptional, `a = 3`):
-- `w₂^{(2)} = 16` and `w₂ = 48`.
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = 2) : Nat.card (WInvariant.primary K 2 2) = 16 ∧ wInvariant K 2 = 48 := by
  sorry

-- acceptance (`two-primary-w-invariant`, `𝔽₃`, non-exceptional, `a = 3`): `w₂^{(2)}(𝔽₃) = 8`,
-- the `2`-part of `3² - 1`.
example : Nat.card (WInvariant.primary (ZMod 3) 2 2) = 8 := by
  sorry

/-- **`ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`**: for a number field and `i ≠ 0`,
`W_i(F)` is finite. -/
theorem finite_wInvariant [NumberField F] (hi : i ≠ 0) : Finite (WInvariant F i) := by
  sorry

/-- `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`: `W_i^{(ℓ)}(F) = 0` as soon as
`ℓ - 1 > |i| · [F : ℚ]` (for `i ≠ 0`; every `ℓ`-part of `W₀(F)` is infinite). -/
theorem WInvariant.primary_eq_bot_of_lt [NumberField F] (hi : i ≠ 0) (ℓ : ℕ) [Fact ℓ.Prime]
    (h : |i| * (Module.finrank ℚ F : ℤ) < ℓ - 1) : WInvariant.primary F i ℓ = ⊥ := by
  sorry

/-- `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`: `w_i(F)` is the product of its
`ℓ`-parts over the primes `ℓ ≤ |i| [F : ℚ] + 1`. -/
theorem wInvariant_eq_prod_range [NumberField F] (hi : i ≠ 0) :
    wInvariant F i = ∏ ℓ ∈ (Finset.range (i.natAbs * Module.finrank ℚ F + 2)).filter Nat.Prime,
      Nat.card (WInvariant.primary F i ℓ) := by
  sorry

/-- **`ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`**: for even `i ≠ 0`,
`w_i(ℚ) = 2^{2 + v₂(i)} · ∏ ℓ^{1 + v_ℓ(i)}` over the odd primes `ℓ` with `(ℓ - 1) ∣ i`. -/
theorem wInvariant_rat_of_even (hi : Even i) (hi0 : i ≠ 0) :
    wInvariant ℚ i = 2 ^ (2 + padicValInt 2 i) *
      ∏ ℓ ∈ (Finset.range (i.natAbs + 2)).filter
          (fun ℓ : ℕ => ℓ.Prime ∧ ℓ ≠ 2 ∧ ((ℓ : ℤ) - 1) ∣ i),
        ℓ ^ (1 + padicValInt ℓ i) := by
  sorry

/-- `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`: `w_i(ℚ) = 2` for odd
`i`. -/
theorem wInvariant_rat_eq_two_of_odd (hi : Odd i) : wInvariant ℚ i = 2 := by
  sorry

/-- `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`: `w₂(ℚ) = 24`. -/
theorem wInvariant_rat_two : wInvariant ℚ 2 = 24 := by
  sorry

/-- `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`: `w₁₀(ℚ) = 264`
(Example VI.2.1.2 prints `1320`, contradicting Lemma VI.2.4). -/
theorem wInvariant_rat_ten : wInvariant ℚ 10 = 264 := by
  sorry

/-- `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`, the cross-check with
Lemma VI.2.4: `w_{2k}(ℚ)` is the denominator of `B_k / 4k` (topologists'
`B_k = |bernoulli (2k)|`). -/
theorem wInvariant_rat_eq_den (k : ℕ) (hk : 0 < k) :
    wInvariant ℚ (2 * k : ℕ) = (bernoulli (2 * k) / (4 * k : ℚ)).den := by
  sorry

-- acceptance (`w2-of-the-rationals-and-the-divisibility-tests`): the table of Example VI.2.1.2
-- with `w₁₀` corrected.
example : wInvariant ℚ 4 = 240 ∧ wInvariant ℚ 6 = 504 ∧ wInvariant ℚ 8 = 480 ∧
    wInvariant ℚ 12 = 65520 := by
  sorry

end WTheorems

end TauCeti

/-! ## `ArithmeticKTheory:N.5` — the odd groups and their integral structure

Every statement of N.5 is about `K_{2i-1}(F)` or `K_{2i-1}(O_{F,S})` with `i ≥ 2`, about K-theory
with finite or `ℚ_ℓ/ℤ_ℓ` coefficients, or about the e-invariant defined on them; none of these
carriers exists in either pinned library or can honestly be defined here. They are recorded in
place. -/

/- `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`: for `F` totally imaginary
(`NumberField.IsTotallyComplex F`) and `n = 2i - 1 ≥ 3`,
`K_n(O_S) ≅ K_n(F) ≅ ℤ^{nrComplexPlaces F} ⊕ ℤ/wInvariant F i`: not stated here; needs `K_n` for
odd `n ≥ 3` (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7). -/

/- `ArithmeticKTheory:N.5/the-real-case-modulo-eight`: for `0 < nrRealPlaces F` and odd `n ≥ 3`,
`K_n(F) ≅ ℤ^{r₁+r₂} ⊕ ℤ/w_i`, `ℤ^{r₂} ⊕ ℤ/2w_i ⊕ (ℤ/2)^{r₁-1}`, `ℤ^{r₁+r₂} ⊕ ℤ/(w_i/2)` or
`ℤ^{r₂} ⊕ ℤ/w_i` according to `n mod 8`, with `i = (n + 1)/2`: not stated here; needs `K_n` for odd
`n ≥ 3` and the `2`-adic comparison (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory
M.7; StableHomotopyKTheory H.6). -/

/- `ArithmeticKTheory:N.5/soule-theorem`: `K_n(O_{F,S}) → K_n(F)` is an isomorphism for odd `n ≥ 3`
and injective with cokernel `⊕_{𝔭∉S} K_{n-1}(k(𝔭))` for even `n ≥ 2`: not stated here; needs `K_n`,
the localisation sequence and K-theory with `ℤ/ℓ` coefficients (supplier: GeneralAlgebraicKTheory
K.1, K.3; KTheoryFiniteLocalFields L.1; the gap "K-theory with finite coefficients has no supplier
stage"). -/

/- `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`: the boundary
`K_n(F; ℤ/ℓ) → ⊕_𝔭 K_{n-1}(R/𝔭; ℤ/ℓ)` is onto for even `n ≥ 2`: not stated here; needs K-theory with
`ℤ/ℓ` coefficients, its localisation sequence, products and the Bott element (supplier: none — the
gap "K-theory with finite coefficients has no supplier stage"). -/

/-! ### `ArithmeticKTheory:N.5/e-invariant` (definition)

The e-invariant `e : K_{2i-1}(F)_tors → K_{2i-1}(Fˢ)^G_tors ≅ µ(i)^G = W_i(F)` needs `K_{2i-1}` and
Suslin's `G`-isomorphism `K_{2i-1}(Fˢ)_tors ≅ µ(i)`. Only its target, `TauCeti.WInvariant F i`,
exists here; the `K₁` stand-in covers `i = 1` but not the map for general `i`. -/

-- TauCeti.eInvariant: not stated here; needs K_{2i-1}(F) and Suslin's isomorphism K_{2i-1}(Fˢ)_tors
--   ≅ µ(i) (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7; the gap "No stage names
--   Suslin's computation of the torsion of K_*(Fˢ)")
-- TauCeti.eInvariant.primary: not stated here; needs TauCeti.eInvariant, hence K_{2i-1}(F){ℓ}
--   (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7)
-- TauCeti.eInvariant_natural: not stated here; needs TauCeti.eInvariant and K_{2i-1}(F → E)
--   (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7); its target side is
--   TauCeti.WInvariant.res
-- TauCeti.eInvariant_one: not stated here; needs TauCeti.eInvariant (supplier:
--   GeneralAlgebraicKTheory K.1; KTheoryLowDegrees U.3 for K₁(F) = Fˣ); its target is
--   TauCeti.WInvariant.oneEquivRootsOfUnity
-- TauCeti.eInvariant_finiteField_bijective: not stated here; needs K_{2i-1}(𝔽_q) and
--   TauCeti.eInvariant (supplier: KTheoryFiniteLocalFields L.1; MotivicEtaleKTheory M.7)
-- test TauCeti.eInvariant_finiteField_bijective (computation): not stated here; needs K_{2i-1}(𝔽_q)
--   ≅ ℤ/(q^i - 1) and TauCeti.eInvariant (supplier: KTheoryFiniteLocalFields L.1); the target value
--   is the test TauCeti.wInvariant_finiteField
-- test TauCeti.eInvariant_rat_three_not_injective (non-example): not stated here; needs K₃(ℚ) ≅
--   ℤ/48 and TauCeti.eInvariant (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7);
--   the target order is wInvariant_rat_two
-- test TauCeti.eInvariant_sepClosed (degenerate): not stated here; needs K_{2i-1}(Fˢ)_tors and
--   Suslin's isomorphism (supplier: MotivicEtaleKTheory M.7)
-- test TauCeti.eInvariant_one (compatibility): not stated here; needs TauCeti.eInvariant (supplier:
--   GeneralAlgebraicKTheory K.1; KTheoryLowDegrees U.3)

/- `ArithmeticKTheory:N.5/harris-segal-summand`: for `F` a number field (non-exceptional if
`ℓ = 2`), `K_{2i-1}(F)` has a cyclic summand of order `w_i^{(ℓ)}(F)` on which the e-invariant is an
isomorphism: not stated here; needs `K_{2i-1}` and `TauCeti.eInvariant` (supplier:
GeneralAlgebraicKTheory K.1; KTheoryFiniteLocalFields L.1, L.2; the gap "Harris and Segal's theorem
is quoted, not proved"). The hypothesis side is `TauCeti.IsExceptional`. -/

/- `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`: for `ℓ` odd, or `ℓ = 2` with `F`
totally imaginary, and `n = 2i - 1 ≥ 3`, `K_n(O_S){ℓ}` is cyclic of order
`Nat.card (WInvariant.primary F i ℓ)`, identified with `H⁰(O_S[1/ℓ]; ℚ_ℓ/ℤ_ℓ(i))`: not stated here;
needs `K_n`, K-theory with `ℚ_ℓ/ℤ_ℓ` coefficients and étale cohomology (supplier:
GeneralAlgebraicKTheory K.1; StableHomotopyKTheory H.6; MotivicEtaleKTheory M.7, M.8). -/

/-! ## `ArithmeticKTheory:N.6` — the even groups and arithmetic cohomology

The signature defect (through the Selmer group) and the divisible subgroup (pure group theory) are
stated in Lean. The even K-groups, the étale cohomology `H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1))`, the maps to
the completions and the real-place maps `α^n` in degree `≥ 2` are in neither pinned library. -/

/- `ArithmeticKTheory:N.6/even-groups-at-odd-primes`: `K_{2i}(O_S){ℓ} ≅ H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1))`
for `ℓ` odd, or `ℓ = 2` with `F` totally imaginary: not stated here; needs `K_{2i}` and étale
cohomology with `ℤ_ℓ(i+1)` coefficients (supplier: GeneralAlgebraicKTheory K.1;
MotivicEtaleKTheory M.7; StableHomotopyKTheory H.6). -/

/- `ArithmeticKTheory:N.6/the-two-primary-corrections`: the eight rows of Theorem VI.9.11 for
`K_n(O_S){2}` with `0 < nrRealPlaces F` and `1/2 ∈ O_S`, with the integer `ρ` and the signature
defect `j = signatureDefect S`: not stated here; needs `K_n`, `H²_et(R; ℤ₂(·))` and `H̃²` (supplier:
MotivicEtaleKTheory M.2, M.3, M.7; K2SymbolsBrauer T.7; StableHomotopyKTheory H.6). -/

/-! ### `ArithmeticKTheory:N.6/tame-and-wild-kernels` (definition; namespace
`TauCeti.ArithmeticK`, module `TauCeti/NumberTheory/KTheory/WildKernel`)

`WK_{2i}(F) = ⋂_v ker (K_{2i}(F) → K_{2i}(F_v))` needs `K_{2i}` of the field and of its completions.
In degree two the tame kernel is K2SymbolsBrauer T.5's `unramifiedSubgroup` and is not redefined. -/

-- wildKernel: not stated here; needs K_{2i}(F) and the maps K_{2i}(F) → K_{2i}(F_v) to the
--   completions (supplier: GeneralAlgebraicKTheory K.1; KTheoryFiniteLocalFields L.7)
-- mem_wildKernel_iff: not stated here; needs wildKernel (supplier: GeneralAlgebraicKTheory K.1;
--   KTheoryFiniteLocalFields L.7)
-- wildKernel_le_ker: not stated here; needs wildKernel and K_{2i}(F_v) (supplier:
--   KTheoryFiniteLocalFields L.7)
-- wildKernel_le_range: not stated here; needs wildKernel and K_{2i}(O_F) → K_{2i}(F) (supplier:
--   GeneralAlgebraicKTheory K.1, K.3; ArithmeticKTheory:N.5/soule-theorem)
-- wildKernel_two_le_unramifiedSubgroup: not stated here; needs wildKernel and K2SymbolsBrauer's
--   unramifiedSubgroup of K₂(F) (supplier: K2SymbolsBrauer T.5/unramified-subgroup;
--   KTheoryFiniteLocalFields L.7)
-- wildKernel_two_eq_ker_hilbert: not stated here; needs wildKernel and the Hilbert symbols at the
--   finite and real places (supplier: K2SymbolsBrauer T.7/classical-local-symbols;
--   KTheoryFiniteLocalFields L.3)
-- wildKernel_restrict_le: not stated here; needs wildKernel and K_{2i}(F) → K_{2i}(E) (supplier:
--   GeneralAlgebraicKTheory K.1; KTheoryFiniteLocalFields L.7)
-- test wildKernel_two_rat (computation): not stated here; needs wildKernel ℚ 1 and K₂(ℤ) (supplier:
--   KTheoryFiniteLocalFields L.7; K2SymbolsBrauer T.5/real-sign-symbol)
-- test wildKernel_ne_tameKernel_rat (non-example): not stated here; needs wildKernel ℚ 1 and the
--   tame kernel (supplier: K2SymbolsBrauer T.5/unramified-subgroup; KTheoryFiniteLocalFields L.7)
-- test wildKernel_two_gaussian (degenerate): not stated here; needs wildKernel ℚ(i) 1 and K₂(ℤ[i])
--   = 1 (supplier: K2SymbolsBrauer T.5; KTheoryFiniteLocalFields L.7)
-- test wildKernel_two_hilbert (compatibility): not stated here; needs wildKernel F 1 and the
--   Hilbert symbols (supplier: K2SymbolsBrauer T.7/classical-local-symbols;
--   KTheoryFiniteLocalFields L.3)
-- test wildKernel_two_Q_sqrt_neg14 (characterisation): not stated here; needs wildKernel ℚ(√-14) 1
--   and the Steinberg symbol {-1, -1} ∈ K₂ (supplier: K2SymbolsBrauer T.1/T.2;
--   KTheoryFiniteLocalFields L.7)

/-! ### `ArithmeticKTheory:N.6/certificate-driven-computation` (construction)

The certificate format is K2SymbolsBrauer T.5's `OrderCertificate` on Mathlib's `Module.Relations`
and `Module.Presentation`; the lower bound N.6 supplies is a surjection of `K_{2i}(O_S)` onto
`⊕_{ℓ∈L} H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1))`. Neither the format nor `K_{2i}` nor `H²_et` is pinned. -/

-- OrderCertificate.ofCohomology: not stated here; needs K2SymbolsBrauer's OrderCertificate,
--   K_{2i}(O_S) and H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) (supplier: K2SymbolsBrauer
--   T.5/certified-presentation; GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7)
-- evenK_toPrimaryCohomology_surjective: not stated here; needs K_{2i}(O_S), H²_et and the
--   isomorphism of ArithmeticKTheory:N.6/even-groups-at-odd-primes (supplier:
--   GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7)
-- OrderCertificate.ofCohomology_card: not stated here; needs K_{2i}(O_S) and H²_et (supplier:
--   GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7)
-- OrderCertificate.ofCohomology_two_real: not stated here; needs K_{2i}(O_S), H²_et(R; ℤ₂(i+1)),
--   H̃²_et and the two-primary table (supplier: MotivicEtaleKTheory M.2, M.7;
--   ArithmeticKTheory:N.6/the-two-primary-corrections)
-- OrderCertificate.ofCohomology_toPresentation: not stated here; needs K2SymbolsBrauer's
--   OrderCertificate.toPresentation (supplier: K2SymbolsBrauer T.5/certified-presentation)
-- test ofCohomology_K2_int (compatibility): not stated here; needs K₂(ℤ), H²(ℤ[1/2]; ℤ₂(2)) and
--   T.5's sign-symbol certificate (supplier: K2SymbolsBrauer T.5; MotivicEtaleKTheory M.7)
-- test ofCohomology_trivial (degenerate): not stated here; needs OrderCertificate.ofCohomology
--   (supplier: K2SymbolsBrauer T.5/certified-presentation)
-- test ofCohomology_missing_prime (non-example): not stated here; needs
--   OrderCertificate.ofCohomology and K₂(ℤ) (supplier: K2SymbolsBrauer T.5/certified-presentation)
-- test ofCohomology_two_row_four (non-example): not stated here; needs K₄(ℤ[√7]) and H²(ℤ[√7, 1/2];
--   ℤ₂(3)) (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7)
-- test ofCohomology_isPresentation (characterisation): not stated here; needs the certificate and
--   K_{2i}(O_S); Mathlib's Module.Presentation is the pinned half (supplier: K2SymbolsBrauer
--   T.5/certified-presentation)

/- `ArithmeticKTheory:N.6/even-groups-of-a-totally-imaginary-field`: for `F` totally imaginary and
`i ≥ 1`, `K_{2i}(O_S) ≅ ⊕_ℓ H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1))`: not stated here; needs `K_{2i}` and étale
cohomology (supplier: GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.7). -/

/- `ArithmeticKTheory:N.6/even-groups-modulo-l`: `K_{2i}(O_S)/ℓ ≅ H²_et(O_S[1/ℓ]; µ_ℓ^{⊗(i+1)})` for
`ℓ` odd (or `ℓ = 2`, `F` totally imaginary): not stated here; needs `K_{2i}`, the twists
`µ_ℓ^{⊗(i+1)}` as étale sheaves and étale cohomology (supplier: GeneralAlgebraicKTheory K.1;
MotivicEtaleKTheory M.1, M.2). -/

/- `ArithmeticKTheory:N.6/l-rank-from-class-group-data`: for `ζ_ℓ ∈ F`, `ℓ` odd, `S` the primes over
`ℓ` and `t` the `𝔽_ℓ`-rank of `Pic(O_S)/ℓ` (`ClassGroup (S.integer F)` with Tau Ceti's
`integerClassGroupEquiv`), `H²_et(O_S; µ_ℓ)` and `K_{2i}(O_S)/ℓ` have rank `t + |S| - 1`: not stated
here; needs étale cohomology, the Brauer group of `O_S` and `K_{2i}` (supplier: MotivicEtaleKTheory
M.1, M.2; K2SymbolsBrauer T.7/twisted-roots-of-unity; GeneralAlgebraicKTheory K.1). -/

/-! ### `ArithmeticKTheory:N.6/signature-defect` (definition; namespace `TauCeti.ArithmeticK`,
module `TauCeti/NumberTheory/NumberField/SignatureDefect`)

The packet defines `j(R)` as `finrank (ZMod 2)` of the cokernel of
`α¹ : H¹_et(R; ℤ/2) → (ℤ/2)^{r₁}`. Étale cohomology is not pinned, and read literally for
`1/2 ∉ R` that definition breaks the node's own API: `H¹_et(Spec ℤ; ℤ/2) = 0`, so `j(ℤ) = 1 = r₁`,
against `signatureDefect_lt_nrRealPlaces` and against `signatureDefect_ringOfIntegers` (`u - t = 0`
for `ℚ`). The Lean form below uses the flat Kummer group instead: Mathlib's Selmer group
`F⟮S, 2⟯ = H¹_fl(O_S; µ₂)` with Tau Ceti's `signHom`. When `1/2 ∈ O_S` (the case of Theorem
VI.9.11) Kummer theory identifies it with `H¹_et(O_S; ℤ/2)` and the two definitions agree; for
`1/2 ∉ O_S` it is the form under which every API item below holds. -/

namespace TauCeti.ArithmeticK

open IsDedekindDomain NumberField

section SignatureDefect

variable {F : Type u} [Field F] [NumberField F] (S : Set (HeightOneSpectrum (𝓞 F)))

/-- The primes of `𝓞 F` dividing `a`, so that `O_S = 𝓞_F[1/a]` for `S = primesDividing F a`
(test notation). -/
def primesDividing (F : Type u) [Field F] [NumberField F] (a : 𝓞 F) :
    Set (HeightOneSpectrum (𝓞 F)) :=
  {v | a ∈ v.asIdeal}

/-- The sign map `α¹` on classes of elements: `F⟮S, 2⟯ → ∏_{σ real} ℤˣ`,
`x F^{×2} ↦ (sign σ(x))_σ`, Tau Ceti's `signHom` on representatives (squares are totally
positive). -/
def selmerSign :
    selmerGroup (K := F) (S := S) (n := 2) →* ({w : InfinitePlace F // w.IsReal} → ℤˣ) :=
  (QuotientGroup.lift _ TauCeti.GlobalNumberFields.signHom (by sorry)).comp
    (selmerGroup (K := F) (S := S) (n := 2)).subtype

/-- **`signatureDefect`** (`ArithmeticKTheory:N.6/signature-defect`, Lean form): the
`𝔽₂`-dimension (Tau Ceti's `TauCeti.twoRank`) of the cokernel of the sign map on `F⟮S, 2⟯`. It is
Definition VI.9.6.1 when `1/2 ∈ O_S`; see the section note for `1/2 ∉ O_S`. -/
def signatureDefect : ℕ :=
  TauCeti.twoRank (({w : InfinitePlace F // w.IsReal} → ℤˣ) ⧸ (selmerSign S).range)

/-- **`signatureDefect_eq_sub_finrank_selmer`**: `j(O_S) = r₁ − dim_{𝔽₂} sign(F⟮S, 2⟯)`. In the
Lean form this is linear algebra; the packet's content, Kummer's identification
`H¹_et(O_S; ℤ/2) ≅ F⟮S, 2⟯` for `1/2 ∈ O_S`, is what justifies the Lean form and needs
`MotivicEtaleKTheory:M.1`. -/
theorem signatureDefect_eq_sub_finrank_selmer :
    signatureDefect S = InfinitePlace.nrRealPlaces F - TauCeti.twoRank (selmerSign S).range := by
  sorry

/-- **`signatureDefect_lt_nrRealPlaces`**: the class of `-1` has sign `(-1, …, -1)`, so
`j(O_S) < r₁` when `r₁ > 0`. -/
theorem signatureDefect_lt_nrRealPlaces (h : 0 < InfinitePlace.nrRealPlaces F) :
    signatureDefect S < InfinitePlace.nrRealPlaces F := by
  sorry

/-- **`signatureDefect_antitone`**: the Selmer group grows with `S`, so `j` decreases. -/
theorem signatureDefect_antitone {S S' : Set (HeightOneSpectrum (𝓞 F))} (h : S ⊆ S') :
    signatureDefect S' ≤ signatureDefect S := by
  sorry

/-- **`signatureDefect_eventually_eq_zero`**: the sign map `Fˣ → (ℤ/2)^{r₁}` is onto (Tau Ceti's
`NumberField.fieldUnitSignature_surjective`), so `j(O_S) = 0` for all `S` containing some finite
`S₀`. -/
theorem signatureDefect_eventually_eq_zero :
    ∃ S₀ : Set (HeightOneSpectrum (𝓞 F)), S₀.Finite ∧
      ∀ S : Set (HeightOneSpectrum (𝓞 F)), S₀ ⊆ S → signatureDefect S = 0 := by
  sorry

-- add_signatureDefect_eq: not stated here; needs the narrow Picard group Pic⁺(O_S) of a ring of
--   S-integers, which Tau Ceti has only for 𝓞 F (supplier: MotivicEtaleKTheory M.2 for (9.6.2));
--   the case S = ∅ is signatureDefect_ringOfIntegers

/-- **`signatureDefect_ringOfIntegers`**: `j(𝓞 F) = u − t`, with Tau Ceti's
`NumberField.NarrowClassGroup.twoRank` and `TauCeti.ClassGroup.twoRank`. -/
theorem signatureDefect_ringOfIntegers :
    signatureDefect (∅ : Set (HeightOneSpectrum (𝓞 F))) =
      NumberField.NarrowClassGroup.twoRank F - TauCeti.ClassGroup.twoRank (𝓞 F) := by
  sorry

/-- **`signatureDefect_of_isTotallyComplex`**: with no real place the target is trivial. -/
@[simp]
theorem signatureDefect_of_isTotallyComplex [IsTotallyComplex F] : signatureDefect S = 0 := by
  sorry

end SignatureDefect

section SignatureDefectTests

-- test signatureDefect_int_half (computation)
example : signatureDefect (primesDividing ℚ 2) = 0 := by
  sorry

-- test signatureDefect_sqrt7_half (computation)
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = 7) : signatureDefect (primesDividing K 2) = 1 := by
  sorry

-- test signatureDefect_sqrt7_fourteen (computation)
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = 7) : signatureDefect (primesDividing K 14) = 0 := by
  sorry

-- test signatureDefect_ringOfIntegers_sqrt7 (compatibility)
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = 7) :
    NumberField.NarrowClassGroup.twoRank K - TauCeti.ClassGroup.twoRank (𝓞 K) = 1 ∧
      signatureDefect (∅ : Set (HeightOneSpectrum (𝓞 K))) = 1 := by
  sorry

-- test signatureDefect_not_unit_sign_codim (non-example)
example (K : Type u) [Field K] [NumberField K] (hK : Module.finrank ℚ K = 2) (x : K)
    (hx : x ^ 2 = 34) :
    signatureDefect (primesDividing K 2) = 0 ∧
      InfinitePlace.nrRealPlaces K - TauCeti.twoRank (TauCeti.GlobalNumberFields.signHom.comp
        ((primesDividing K 2).unit K).subtype).range = 1 := by
  sorry

-- test signatureDefect_totallyComplex (degenerate)
example (K : Type u) [Field K] [NumberField K] [IsCyclotomicExtension {4} ℚ K]
    (S : Set (HeightOneSpectrum (𝓞 K))) : signatureDefect S = 0 := by
  sorry

end SignatureDefectTests

end TauCeti.ArithmeticK

/- `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`: for `F` totally real and even
`i > 0`, `2^{r₁} |K_{2i-2}(O_S)| / |K_{2i-1}(O_S)| = ∏_ℓ |H²_et(O_S[1/ℓ]; ℤ_ℓ(i))| /
∏_ℓ |H¹_et(O_S[1/ℓ]; ℤ_ℓ(i))|`: not stated here; needs `K_n` and étale cohomology (supplier:
GeneralAlgebraicKTheory K.1; MotivicEtaleKTheory M.1, M.7). -/

/-! ### `ArithmeticKTheory:N.6/divisible-subgroup` (definition; namespace `TauCeti`, module
`TauCeti/GroupTheory/DivisibleSubgroup`) -/

namespace TauCeti

section DivisibleSubgroup

variable (A : Type*) [AddCommGroup A]

/-- **`divisibleSubgroup`** (`ArithmeticKTheory:N.6/divisible-subgroup`): the subgroup of divisible
elements `div A = ⋂_{m ≥ 1} m·A`. It need not be divisible, so it is in general larger than the
maximal divisible subgroup; Mathlib has only the class `DivisibleBy`. -/
def divisibleSubgroup : AddSubgroup A :=
  ⨅ (m : ℕ) (_ : 1 ≤ m), m • (⊤ : AddSubgroup A)

variable {A}

/-- **`mem_divisibleSubgroup_iff`**: `x ∈ div A ↔ ∀ m ≥ 1, ∃ y, m • y = x`. -/
theorem mem_divisibleSubgroup_iff {x : A} :
    x ∈ divisibleSubgroup A ↔ ∀ m : ℕ, 1 ≤ m → ∃ y, m • y = x := by
  simp only [divisibleSubgroup, AddSubgroup.mem_iInf, AddSubgroup.mem_smul_pointwise_iff_exists,
    AddSubgroup.mem_top, true_and]

/-- **`divisibleSubgroup_map_le`**: `f(div A) ⊆ div B`. -/
theorem divisibleSubgroup_map_le {B : Type*} [AddCommGroup B] (f : A →+ B) :
    (divisibleSubgroup A).map f ≤ divisibleSubgroup B := by
  rintro _ ⟨x, hx, rfl⟩
  rw [SetLike.mem_coe, mem_divisibleSubgroup_iff] at hx
  rw [mem_divisibleSubgroup_iff]
  intro m hm
  obtain ⟨y, rfl⟩ := hx m hm
  exact ⟨f y, (map_nsmul f m y).symm⟩

/-- **`divisibleSubgroup_directSum`**: `div (⨁ i, A i) = ⨁ i, div (A i)`, componentwise. -/
theorem divisibleSubgroup_directSum {ι : Type*} [DecidableEq ι] (A : ι → Type*)
    [∀ i, AddCommGroup (A i)] (x : ⨁ i, A i) :
    x ∈ divisibleSubgroup (⨁ i, A i) ↔ ∀ i, x i ∈ divisibleSubgroup (A i) := by
  sorry

/-- **`divisibleSubgroup_eq_bot_of_finite`**: `div A = 0` for finite `A` (take `m = |A|`). -/
@[simp]
theorem divisibleSubgroup_eq_bot_of_finite [Finite A] : divisibleSubgroup A = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  rw [mem_divisibleSubgroup_iff] at hx
  obtain ⟨y, rfl⟩ := hx (Nat.card A) Nat.card_pos
  simp [card_nsmul_eq_zero']

/-- **`le_divisibleSubgroup_of_divisibleBy`**: a subgroup that is divisible (Mathlib's
`DivisibleBy`) lies in `div A`. -/
theorem le_divisibleSubgroup_of_divisibleBy (D : AddSubgroup A) [DivisibleBy D ℤ] :
    D ≤ divisibleSubgroup A := by
  intro x hx
  rw [mem_divisibleSubgroup_iff]
  intro m hm
  refine ⟨(DivisibleBy.div (A := D) (α := ℤ) ⟨x, hx⟩ m : A), ?_⟩
  have h := DivisibleBy.div_cancel (A := D) (α := ℤ) ⟨x, hx⟩ (show (m : ℤ) ≠ 0 by omega)
  rw [natCast_zsmul] at h
  exact congrArg Subtype.val h

end DivisibleSubgroup

/-- Test notation for `divisibleSubgroup_ne_maxDivisible`: the relations `p·a = 0` and
`p^{k+1}·b_{k+1} = a` on the free abelian group on `a = none` and `b_{k+1} = some k`. -/
def divisibleTestRels (p : ℕ) : AddSubgroup (Option ℕ →₀ ℤ) :=
  AddSubgroup.closure ({(p : ℤ) • Finsupp.single none 1} ∪
    Set.range fun k : ℕ => ((p : ℤ) ^ (k + 1)) • Finsupp.single (some k) 1 - Finsupp.single none 1)

section DivisibleTests

-- test divisibleSubgroup_ratCircle (computation)
example : divisibleSubgroup (ℚ ⧸ (Int.castAddHom ℚ).range) = ⊤ := by
  sorry

-- test divisibleSubgroup_int (degenerate)
example : divisibleSubgroup ℤ = ⊥ ∧
    ∀ (B : Type) [AddCommGroup B] [Finite B], divisibleSubgroup B = ⊥ := by
  sorry

-- test divisibleSubgroup_ne_maxDivisible (non-example)
example (p : ℕ) [Fact p.Prime] :
    let A := (Option ℕ →₀ ℤ) ⧸ divisibleTestRels p
    let a : A := QuotientAddGroup.mk (Finsupp.single none 1)
    divisibleSubgroup A = AddSubgroup.zmultiples a ∧ Nat.card (AddSubgroup.zmultiples a) = p ∧
      ∀ D : AddSubgroup A, (∀ n : ℕ, n ≠ 0 → ∀ x ∈ D, ∃ y ∈ D, n • y = x) → D = ⊥ := by
  sorry

-- test divisibleSubgroup_K2_rat (compatibility): not stated here; needs K₂(ℚ) ≅ ℤ/2 ⊕ ⨁_p 𝔽_pˣ and
--   the real sign symbol (supplier: K2SymbolsBrauer T.1, T.5; GeneralAlgebraicKTheory K.1)

-- test mem_divisibleSubgroup_iff_quotients (characterisation)
example (A : Type) [AddCommGroup A] (x : A) :
    x ∈ divisibleSubgroup A ↔
      ∀ m : ℕ, 1 ≤ m → (QuotientAddGroup.mk x : A ⧸ m • (⊤ : AddSubgroup A)) = 0 := by
  sorry

end DivisibleTests

end TauCeti

/- `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`:
`divisibleSubgroup (K_{2i}(F)) ≤ wildKernel F i` with index at most two, equality unless `i` is odd
and `F` is special (Weibel 2006, Theorem A; the K-book's V.6.8.2 states an isomorphism with no
exception): not stated here; needs `K_{2i}(F)` and `wildKernel` (supplier: GeneralAlgebraicKTheory
K.1; KTheoryFiniteLocalFields L.7; MotivicEtaleKTheory M.7). The group-theoretic side is
`TauCeti.divisibleSubgroup`, and "special" refines `TauCeti.IsExceptional`. -/
