/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroNumberFields.md` is definitive. These statements
suggest Lean forms so contributors and reviewers converge on names and signatures.
They claim no implementation: all roadmap declarations remain unchecked.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

HB.1 and HB.2 use positive Kummer and bar/Bott conventions. The raw Soulé
product is negative; the separately negated degree-(2,1) map is distinct.
The fixed CGZ/GSWZ source-sign comparison remains an obligation. The early
refinement is conditional; the unconditional assembly is HabiroNahmSeries HB.5.
The root-change exponent in weight two is inverse, and epsilon_m=c_m^2
is exported at every order. Ordinary unit classes are not eigenunit choices.

HB.6 retains full cyclotomic coefficient algebras and actual prime root
transitions. Re-expansion is p-adic, never ordinary formal substitution.
HB.7 uses the integral linear section shape and defect p/x. Effective
global descent precedes tensor bijectivity and the Picard character;
section norms are whole-series determinants in finite free algebras.

The shared namespace is TauCeti.HabiroNF. HB2 contains the finite regulator
prototypes, HB67 the arithmetic ring and local family models, HB6 the
completion comparisons, and HB7 the first-jet, Picard and norm forms.
HB6.Suppliers contains transparent signatures of HC.1/HC.3's unimplemented
completion/Taylor APIs; it imports the parent's coefficient and root data.
No ownership of those generic constructions is reassigned here.

Tau Ceti power classes are imported and reused. K3, Bloch/configuration
homology, finite Chern classes, Coleman functions and actual Kummer torsor
transports are absent at the pins. A signature that needs these objects is
explicitly omitted with its missing input named. No missing condition is
encoded as a proposition-valued field, an arbitrary predicate, or True.
Acceptance examples and active signatures remain proved by sorry; they
are proposals, not implementation tests. Import checking is reported in
the handoff rather than inferred from the individual input files.
-/
import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Defs
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Functoriality
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.Algebra.Module.ZMod
import Mathlib.Data.Finsupp.SMul
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.FreeAbelianGroup
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.RingTheory.DedekindDomain.SelmerGroup
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.Cyclotomic.Basic
import Mathlib.RepresentationTheory.Homological.GroupHomology.LowDegree
import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval
import Mathlib.RingTheory.AdjoinRoot
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.NumberTheory.NumberField.Discriminant.Different
import Mathlib.NumberTheory.Cyclotomic.PrimitiveRoots
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.Analysis.SpecialFunctions.Pow.Complex
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Ramification
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.RamificationInertia.Inertia
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RepresentationTheory.Basic
import Mathlib.Basic.Complex.Basic
import Mathlib.Data.ZMod.Basic
import TauCeti.Algebra.Group.PowerClassGroup
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import Mathlib.RingTheory.Polynomial.Cyclotomic.Expand
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.Data.Nat.Factorization.Defs
import Mathlib.RingTheory.PowerSeries.Log
import Mathlib.RingTheory.PowerSeries.Exp
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Norm.Basic
import Mathlib.RingTheory.Norm.Transitivity

universe u
noncomputable section
open Polynomial
open scoped BigOperators TensorProduct

namespace TauCeti.HabiroNF

open NumberField

/-! ## HB.1/cyclotomic-character-and-eigenspaces -/

section Eigenspace

variable {n : ℕ} {G : Type*} [Group G]
  (M : Type*) [AddCommGroup M] [Module (ZMod n) M] [DistribMulAction G M]
  [SMulCommClass G (ZMod n) M]

/-- The `χ ^ j`-eigenspace `{x | ∀ σ, σ • x = χ(σ) ^ j • x}` (CGZ (4), §2.6): the kernel
formulation, defined for every `n`, with no division. -/
def charEigenspace (χ : G →* (ZMod n)ˣ) (j : ℤ) : Submodule (ZMod n) M := sorry

variable {M}

@[simp] theorem mem_charEigenspace_iff (χ : G →* (ZMod n)ˣ) (j : ℤ) (x : M) :
    x ∈ charEigenspace M χ j ↔ ∀ σ : G, σ • x = (((χ σ) ^ j : (ZMod n)ˣ) : ZMod n) • x := sorry

theorem charEigenspace_map_le {N : Type*} [AddCommGroup N] [Module (ZMod n) N]
    [DistribMulAction G N] [SMulCommClass G (ZMod n) N] (f : M →ₗ[ZMod n] N)
    (hf : ∀ (σ : G) (x : M), f (σ • x) = σ • f x) (χ : G →* (ZMod n)ˣ) (j : ℤ) :
    (charEigenspace M χ j).map f ≤ charEigenspace N χ j := sorry

theorem charEigenspace_eq_top_of_subsingleton [Subsingleton G] (χ : G →* (ZMod n)ˣ) (j : ℤ) :
    charEigenspace M χ j = ⊤ := sorry

end Eigenspace

section CycloChar

variable {F L : Type*} [Field F] [Field L] [Algebra F L] {n : ℕ} [NeZero n] {ζ : L}

/-- CGZ's `χ : Gal(Fₙ/F) → (ℤ/n)ˣ`, `σ ζ = ζ ^ χ(σ)`: Mathlib's `IsPrimitiveRoot.autToPow`. -/
abbrev cycloChar (hζ : IsPrimitiveRoot ζ n) : (L ≃ₐ[F] L) →* (ZMod n)ˣ := hζ.autToPow F

theorem cycloChar_spec (hζ : IsPrimitiveRoot ζ n) (σ : L ≃ₐ[F] L) :
    σ ζ = ζ ^ ((cycloChar (F := F) hζ σ : ZMod n)).val := sorry

theorem cycloChar_injective [IsCyclotomicExtension {n} F L] (hζ : IsPrimitiveRoot ζ n) :
    Function.Injective (cycloChar (F := F) hζ) := sorry

theorem cycloChar_independent (hζ : IsPrimitiveRoot ζ n) {ζ' : L} (hζ' : IsPrimitiveRoot ζ' n) :
    cycloChar (F := F) hζ = cycloChar (F := F) hζ' := sorry

theorem cycloChar_eq_modularCyclotomicCharacter (hζ : IsPrimitiveRoot ζ n)
    (hn : Nat.card (rootsOfUnity n L) = n) (σ : L ≃ₐ[F] L) :
    cycloChar (F := F) hζ σ = modularCyclotomicCharacter L hn σ.toRingEquiv := sorry

/-- `Lˣ ⧸ (Lˣ)ⁿ`, written additively. -/
abbrev PowerClasses (L : Type*) [Field L] (n : ℕ) : Type _ :=
  Additive (TauCeti.powerClassQuotient Lˣ n)

/-- `(𝓞 L)ˣ ⧸ ((𝓞 L)ˣ)ⁿ`, written additively. -/
abbrev UnitClasses (L : Type*) [Field L] [NumberField L] (n : ℕ) : Type _ :=
  Additive (TauCeti.powerClassQuotient (𝓞 L)ˣ n)

instance (L : Type*) [Field L] (n : ℕ) : Module (ZMod n) (PowerClasses L n) := sorry
instance (L : Type*) [Field L] [NumberField L] (n : ℕ) : Module (ZMod n) (UnitClasses L n) := sorry
instance (F L : Type*) [Field F] [Field L] [Algebra F L] (n : ℕ) :
    DistribMulAction (L ≃ₐ[F] L) (PowerClasses L n) := sorry
instance (F L : Type*) [Field F] [Field L] [Algebra F L] [NumberField L] (n : ℕ) :
    DistribMulAction (L ≃ₐ[F] L) (UnitClasses L n) := sorry
instance (F L : Type*) [Field F] [Field L] [Algebra F L] (n : ℕ) :
    SMulCommClass (L ≃ₐ[F] L) (ZMod n) (PowerClasses L n) := sorry
instance (F L : Type*) [Field F] [Field L] [Algebra F L] [NumberField L] (n : ℕ) :
    SMulCommClass (L ≃ₐ[F] L) (ZMod n) (UnitClasses L n) := sorry

/-- The map from unit classes to power classes. -/
def unitClassesToPowerClasses (L : Type*) [Field L] [NumberField L] (n : ℕ) :
    UnitClasses L n →ₗ[ZMod n] PowerClasses L n := sorry

theorem unitClassesToPowerClasses_injective (L : Type*) [Field L] [NumberField L] (n : ℕ) :
    Function.Injective (unitClassesToPowerClasses L n) := sorry

end CycloChar

/-- (test `charEigenspace_dilog_five`, computation) `F = ℚ`, `n = 5`:
`v = ∏ₖ (1 - 2ζᵏ)ᵏ` lies in the `χ⁻¹`-eigenspace and not in the `χ`-eigenspace
(PARI/GP: `σ₂ v / v³` is a fifth power, `σ₂ v / v²` is not). -/
example (ζ : CyclotomicField 5 ℚ) (hζ : IsPrimitiveRoot ζ 5)
    (hv : (∏ k ∈ Finset.range 5, (1 - 2 * ζ ^ k) ^ k) ≠ 0) :
    let v : PowerClasses (CyclotomicField 5 ℚ) 5 :=
      Additive.ofMul (QuotientGroup.mk (Units.mk0 _ hv))
    v ∈ charEigenspace _ (cycloChar (F := ℚ) hζ) (-1) ∧
      v ∉ charEigenspace _ (cycloChar (F := ℚ) hζ) 1 := sorry

/-- (test `charEigenspace_units_seven`, computation) `F = ℚ`, `n = 7`. -/
example (ζ : CyclotomicField 7 ℚ) (hζ : IsPrimitiveRoot ζ 7) :
    Module.finrank (ZMod 7)
        (charEigenspace (UnitClasses (CyclotomicField 7 ℚ) 7) (cycloChar (F := ℚ) hζ) (-1)) = 0 ∧
      Module.finrank (ZMod 7)
        (charEigenspace (UnitClasses (CyclotomicField 7 ℚ) 7) (cycloChar (F := ℚ) hζ) 1) = 1 :=
  sorry

/-- (test `charEigenspace_units_three`, non-example) `n = 3`: `χ = χ⁻¹`, and the
`χ⁻¹`-eigenspace has dimension `1` although `r₂(ℚ) = 0`. -/
example (ζ : CyclotomicField 3 ℚ) (hζ : IsPrimitiveRoot ζ 3) :
    Module.finrank (ZMod 3)
        (charEigenspace (UnitClasses (CyclotomicField 3 ℚ) 3) (cycloChar (F := ℚ) hζ) (-1)) = 1 ∧
      InfinitePlace.nrComplexPlaces ℚ = 0 := sorry

/-- (test `charEigenspace_trivial_group`, degenerate). -/
example {n : ℕ} (M : Type*) [AddCommGroup M] [Module (ZMod n) M]
    [DistribMulAction (ℚ ≃ₐ[ℚ] ℚ) M] [SMulCommClass (ℚ ≃ₐ[ℚ] ℚ) (ZMod n) M]
    (χ : (ℚ ≃ₐ[ℚ] ℚ) →* (ZMod n)ˣ) : charEigenspace M χ (-1) = ⊤ := sorry

/-- (test `cycloChar_eq_autToPow`, compatibility). -/
example (ζ : CyclotomicField 5 ℚ) (hζ : IsPrimitiveRoot ζ 5) :
    cycloChar (F := ℚ) hζ = hζ.autToPow ℚ := rfl

/-! ## HB.1/the-eigenspace-and-division-by-a-group-order -/

section Projector

variable {n : ℕ} {G : Type*} [Group G] [Fintype G]
  {M : Type*} [AddCommGroup M] [Module (ZMod n) M] [DistribMulAction G M]
  [SMulCommClass G (ZMod n) M]

/-- `e_j = |G|⁻¹ ∑_σ χ(σ)^{-j} σ`; it exists only when `|G|` is a unit mod `n`. -/
def eigenProjector (hG : IsUnit (Fintype.card G : ZMod n)) (χ : G →* (ZMod n)ˣ) (j : ℤ) :
    M →ₗ[ZMod n] M := sorry

theorem eigenProjector_apply (hG : IsUnit (Fintype.card G : ZMod n)) (χ : G →* (ZMod n)ˣ)
    (j : ℤ) (x : M) :
    eigenProjector hG χ j x =
      ((hG.unit⁻¹ : (ZMod n)ˣ) : ZMod n) •
        ∑ σ : G, (((χ σ) ^ (-j) : (ZMod n)ˣ) : ZMod n) • (σ • x) := sorry

theorem range_eigenProjector (hG : IsUnit (Fintype.card G : ZMod n)) (χ : G →* (ZMod n)ˣ)
    (j : ℤ) : LinearMap.range (eigenProjector (M := M) hG χ j) = charEigenspace M χ j := sorry

theorem eigenProjector_idem (hG : IsUnit (Fintype.card G : ZMod n)) (χ : G →* (ZMod n)ˣ)
    (j : ℤ) :
    (eigenProjector (M := M) hG χ j).comp (eigenProjector hG χ j) = eigenProjector hG χ j :=
  sorry

theorem eigenProjector_apply_of_mem (hG : IsUnit (Fintype.card G : ZMod n))
    (χ : G →* (ZMod n)ˣ) (j : ℤ) {x : M} (hx : x ∈ charEigenspace M χ j) :
    eigenProjector hG χ j x = x := sorry

/-- Exactness of the eigenspace functor when `|G|` is invertible. -/
theorem charEigenspace_map_eq_of_surjective (hG : IsUnit (Fintype.card G : ZMod n))
    {N : Type*} [AddCommGroup N] [Module (ZMod n) N] [DistribMulAction G N]
    [SMulCommClass G (ZMod n) N] (f : M →ₗ[ZMod n] N)
    (hf : ∀ (σ : G) (x : M), f (σ • x) = σ • f x) (hsurj : Function.Surjective f)
    (χ : G →* (ZMod n)ˣ) (j : ℤ) :
    (charEigenspace M χ j).map f = charEigenspace N χ j := sorry

end Projector

/-- The twisted augmentation `ℤ/n[G] → ℤ/n`, `g ↦ χ(g)⁻¹`. -/
def twistedAugmentation {n : ℕ} {G : Type*} [Group G] (χ : G →* (ZMod n)ˣ) :
    (G →₀ ZMod n) →ₗ[ZMod n] ZMod n :=
  Finsupp.linearCombination (ZMod n) (fun g => (((χ g)⁻¹ : (ZMod n)ˣ) : ZMod n))

section NonExample

attribute [local instance] Finsupp.comapDistribMulAction

instance : SMulCommClass (ZMod 9)ˣ (ZMod 9) ((ZMod 9)ˣ →₀ ZMod 9) := sorry

/-- (non-example) `n = 9`, `G = (ℤ/9)ˣ`: `twistedAugmentation` is onto `ℤ/9`, but the image
of the `χ⁻¹`-eigenspace is `3ℤ/9`; the eigenspace functor is not right exact. -/
example : Function.Surjective (twistedAugmentation (MonoidHom.id (ZMod 9)ˣ)) ∧
    (charEigenspace ((ZMod 9)ˣ →₀ ZMod 9) (MonoidHom.id (ZMod 9)ˣ) (-1)).map
        (twistedAugmentation (MonoidHom.id (ZMod 9)ˣ)) =
      Submodule.span (ZMod 9) {(3 : ZMod 9)} := sorry

end NonExample

/-! ## HB.1/sahs-lemma -/

/-- Sah's lemma: a central element acting on `A` by a scalar `c` makes `c - 1` kill
`Hⁱ(G, A)`. -/
theorem groupCohomology_smul_sub_one_eq_zero_of_mem_center {k G : Type u} [CommRing k] [Group G]
    (A : Rep k G) {g : G} (hg : g ∈ Subgroup.center G) (c : k)
    (hc : ∀ a : A, A.ρ g a = c • a) (i : ℕ) (x : groupCohomology A i) :
    (c - 1) • x = 0 := sorry

/-- The twist `ℤ/n(χ^m)` of `ℤ/n` by the `m`-th power of a character. -/
def twistRep {n : ℕ} {G : Type} [Group G] (χ : G →* (ZMod n)ˣ) (m : ℕ) : Rep (ZMod n) G :=
  sorry

/-- The finite-group form of the step in CGZ Lemma 3.1 that uses Sah's lemma: if some
`χ(g)^m - 1` is a unit, `H¹(G, ℤ/n(χ^m))` vanishes. -/
theorem subsingleton_H1_twistRep {n : ℕ} {G : Type} [CommGroup G] (χ : G →* (ZMod n)ˣ)
    (m : ℕ) (g : G) (hg : IsUnit ((((χ g) ^ m : (ZMod n)ˣ) : ZMod n) - 1)) :
    Subsingleton (groupCohomology (twistRep χ m) 1) := sorry

/-! ## HB.1/the-excluded-primes -/

section Excluded

variable (F : Type*) [Field F] [NumberField F]

/-- CGZ Remark 1.4: `M_F = 6 |Δ_F| |K₂(𝓞_F)|`. `K₂(𝓞_F)` is not in the libraries; its
order is the explicit argument `k₂` (supplied by ArithmeticKTheory). -/
def cgzExcludedInteger (k₂ : ℕ) : ℕ := 6 * (NumberField.discr F).natAbs * k₂

/-- `M′_F = 2 |Δ_F| |K₂(𝓞_F)|`, for use when `9 ∤ n`. -/
def cgzExcludedIntegerNotNine (k₂ : ℕ) : ℕ := 2 * (NumberField.discr F).natAbs * k₂

theorem cgzExcludedInteger_ne_zero {k₂ : ℕ} (hk : k₂ ≠ 0) : cgzExcludedInteger F k₂ ≠ 0 :=
  sorry

theorem prime_dvd_cgzExcludedInteger_iff {p k₂ : ℕ} (hp : p.Prime) :
    p ∣ cgzExcludedInteger F k₂ ↔
      p = 2 ∨ p = 3 ∨ p ∣ (NumberField.discr F).natAbs ∨ p ∣ k₂ := sorry

theorem coprime_torsionOrder_of_coprime_cgzExcludedIntegerNotNine {n k₂ : ℕ}
    (h : n.Coprime (cgzExcludedIntegerNotNine F k₂)) :
    n.Coprime (NumberField.Units.torsionOrder F) := sorry

end Excluded

/-- (test `cgzExcludedInteger_rat`, computation) `K₂(ℤ) ≅ ℤ/2`. -/
example : cgzExcludedInteger ℚ 2 = 12 ∧ cgzExcludedIntegerNotNine ℚ 2 = 4 := sorry

/-- (test `cgzExcludedInteger_gaussian`, computation) `Δ_{ℚ(i)} = -4`, `K₂(ℤ[i]) = 0`. -/
example [NumberField (CyclotomicField 4 ℚ)] :
    cgzExcludedInteger (CyclotomicField 4 ℚ) 1 = 24 ∧
      cgzExcludedIntegerNotNine (CyclotomicField 4 ℚ) 1 = 8 := sorry

/-- (test `cgzExcludedInteger_three_admissible`, non-example) `n = 3` is admissible for
`M′_ℚ` although `3 ∣ w₂(ℚ) = 24`. -/
example : Nat.Coprime 3 (cgzExcludedIntegerNotNine ℚ 2) ∧ ¬ (9 ∣ 3) ∧ (3 ∣ 24) := sorry

/-- (test `cgzExcludedInteger_one`, degenerate). -/
example (F : Type*) [Field F] [NumberField F] (k₂ : ℕ) :
    Nat.Coprime 1 (cgzExcludedInteger F k₂) := sorry

/-! ## HB.1/eigenspace-of-units-mod-p (CGZ Proposition 2.12(b)) -/

theorem finrank_charEigenspace_unitClasses (F L : Type*) [Field F] [NumberField F] [Field L]
    [NumberField L] [Algebra F L] {p : ℕ} [Fact p.Prime] [IsCyclotomicExtension {p} F L]
    {ζ : L} (hζ : IsPrimitiveRoot ζ p) (hdeg : Module.finrank F L = p - 1)
    (hχ : ∃ σ : L ≃ₐ[F] L, (cycloChar (F := F) hζ σ) ^ 2 ≠ 1) :
    Module.finrank (ZMod p) (charEigenspace (UnitClasses L p) (cycloChar (F := F) hζ) (-1)) =
      InfinitePlace.nrComplexPlaces F := sorry

end TauCeti.HabiroNF


namespace TauCeti.HabiroNF

/-! ### HB.1 -/

-- HB.1/bloch-group-conventions: not stated; needs Suslin, published and arXiv Bloch groups and their specified comparison maps of
--   K3BlochGroups V.3 and the identification K₃(F)/n ≅ B_CGZ(F)/n of K3BlochGroups V.6.
-- coprime_w2_of_coprime_cgzExcludedInteger: not stated; needs w₂(F) (ArithmeticKTheory N.4,
--   `the-w-invariant`), which is not in the pinned libraries.
-- HB.1/finite-coefficient-K3-and-the-chern-class: not stated; needs K₃(E; ℤ/N) (StableHomotopyKTheory
--   H.6) and Soulé's c̄_{2,1} (requested early M.8 prefix).
-- HB.1/inflation-restriction-injectivity: not stated; needs continuous Galois cohomology
--   H¹(F, ℤ/n(m)) with inflation–restriction (Tau Ceti ProfiniteCohomology layer 5, MotivicEtaleKTheory M.1).
-- HB.1/the-chern-class-map-c-zeta: not stated; needs Soulé's ℓ-adic Chern classes on K_{2m−1}(F)
--   (requested early M.8 prefix), the Tate twists ℤ/n(m) (M.1) and the Kummer isomorphism
--   H¹(L, μ_n) ≅ Lˣ/(Lˣ)^n (Tau Ceti ProfiniteCohomology layer 9).
-- twistTrivialization: not stated; needs the Galois modules ℤ/n(m) = μ_n^{⊗m} (MotivicEtaleKTheory M.1).
-- twistTrivialization_equivariant: not stated; needs twistTrivialization.
-- twistTrivialization_pow: not stated; needs twistTrivialization.
-- chernClassMap: not stated; needs the objects of HB.1/the-chern-class-map-c-zeta above.
-- chernClassMap_mem_eigenspace: not stated; needs chernClassMap.
-- chernClassMap_pow_root: not stated; needs chernClassMap.
-- chernClassMap_baseChange: not stated; needs chernClassMap and K₃ functoriality.
-- Test chernClassMap_pow_root_test: not stated; needs chernClassMap.
-- Test chernClassMap_rat_three: not stated; needs K₃(ℚ) ≅ ℤ/48 (K3BlochGroups V.5) and chernClassMap.
-- Test chernClassMap_weight_one: not stated; needs chernClassMap for m = 1.
-- Test chernClassMap_trivial_torsion: not stated; needs chernClassMap.
-- HB.1/hutchinson-chern-class-agrees: not stated; needs both constructions of c_ζ (early M.8 prefix and actual source-sign comparison).
-- HB.1/quillen-lichtenbaum-degree-three: not stated; needs K₃(F) ⊗ ℤ_p and H¹_ét(O_F[1/p], ℤ_p(2))
--   (MotivicEtaleKTheory M.7).
-- HB.1/injectivity-of-c-zeta: not stated; needs chernClassMap.
-- HB.1/s-units-realise-c-zeta: not stated; needs chernClassMap (the Selmer-group input is Tau Ceti's
--   `IsDedekindDomain.selmerGroup.ker_toClassGroup`).
-- HB.1/units-realise-c-zeta: not stated; needs chernClassMap and Keune's injection (gap).
-- HB.1/equivariant-unit-rank: the exact complex-character form is oddCharacter_unitMultiplicity below;
--   prime reduction is unit_inverseCyclotomicEigen_torsionSequence, not a composite scalar character.
-- HB.1/cgz-theorem-1-5: not stated; needs chernClassMap.

end TauCeti.HabiroNF


open scoped TensorProduct
open NumberField

namespace TauCeti.HabiroNF

/-! Node `finite-endomorphism-obstruction-criterion`.
Surjectivity modulo n detects n-torsion in the kernel of an endomorphism of
a finite abelian group. There is no claim that invariants and coinvariants
are canonically isomorphic.
-/
theorem finiteEndomorphism_torsionKernel_eq_zero
    {A : Type*} [AddCommGroup A] [Finite A] (n : ℕ) (f : A →+ A)
    (hmod : ∀ x : A, ∃ y z : A, x = f y + n • z)
    (x : A) (hx : n • x = 0) (hfx : f x = 0) : x = 0 := by
  sorry

/-! Node `injective-exact-map-eigenclass-lift`.
The hypotheses describe an exact sequence and its actions. No invertibility
of the order of G is assumed. In particular this applies at p-power orders.
-/
theorem eigenclass_existsUnique_lift
    {R G U M C : Type*} [CommRing R] [Group G]
    [AddCommGroup U] [Module R U] [AddCommGroup M] [Module R M]
    [AddCommGroup C] [Module R C]
    (ρU : Representation R G U) (ρM : Representation R G M)
    (ρC : Representation R G C) (η : G →* Rˣ)
    (i : U →ₗ[R] M) (δ : M →ₗ[R] C)
    (hi : Function.Injective i) (hexact : LinearMap.range i = LinearMap.ker δ)
    (hi_equivariant : ∀ g u, i (ρU g u) = ρM g (i u))
    (hδ_equivariant : ∀ g x, δ (ρM g x) = ρC g (δ x))
    (hC : ∀ c : C, (∀ g : G, ρC g c = (η g : R) • c) → c = 0)
    (x : M) (hx : ∀ g : G, ρM g x = (η g : R) • x) :
    ∃! u : U, i u = x ∧ ∀ g : G, ρU g u = (η g : R) • u := by
  sorry

/-! Node `cyclotomic-prime-valuation-action`.
The statement uses global ideals and Mathlib's actual e and f carriers.
Its proof imports the existing local Eisenstein and completion dictionary.
-/
theorem cyclotomic_primePrimes_fixed
    (F L : Type*) [Field F] [Field L] [NumberField F] [NumberField L]
    [Algebra F L] [FiniteDimensional F L]
    (p m : ℕ) [Fact p.Prime] (hp : 2 < p) (hm : 0 < m)
    [NeZero (p ^ m)] [IsCyclotomicExtension {p ^ m} F L]
    {ζ : L} (hζ : IsPrimitiveRoot ζ (p ^ m))
    (hdisc : ¬ (p : ℤ) ∣ NumberField.discr F) :
    Function.Surjective (hζ.autToPow F) ∧
      Module.finrank F L = Nat.totient (p ^ m) ∧
      (∀ q : Ideal (𝓞 F), q.IsPrime → q ≠ ⊥ → (p : 𝓞 F) ∈ q →
        ∃! P : Ideal (𝓞 L), P.IsPrime ∧ P.LiesOver q) ∧
      (∀ P : Ideal (𝓞 L), P.IsPrime → (p : 𝓞 L) ∈ P →
        P.ramificationIdx (𝓞 F) = Nat.totient (p ^ m) ∧
          P.inertiaDeg (𝓞 F) = 1 ∧
          ∀ σ : L ≃ₐ[F] L,
            Ideal.map (NumberField.RingOfIntegers.mapRingHom σ.toRingHom) P = P) := by
  sorry

/-! Node `odd-cyclotomic-unit-multiplicity`.
This is the ordinary integral unit group, not the distinguished subgroup
usually called cyclotomic units. The proof uses the pinned conjugation-existence
theorem at real base places; its cyclotomic specialization also uses
`cyclotomic-prime-valuation-action`.
The statement is the exact application of the logarithmic argument that HB.1
needs. It also covers the trivial extension of a totally imaginary field:
the nontrivial-character hypothesis then has no instances. The action on units
is restriction of the field automorphism; on infinite places Mathlib uses
σ • w = w ∘ σ⁻¹. The scalar ℂ is fixed in the tensor action.

The span in the conclusion is the eigenspace: the set of simultaneous
eigenvectors is already a complex linear subspace. It avoids introducing a
second carrier for the eigenspace owned by the accepted parent.
-/
theorem oddCharacter_unitMultiplicity
    (F L : Type*) [Field F] [Field L] [NumberField F] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L]
    [NumberField.IsTotallyComplex L]
    (η : (L ≃ₐ[F] L) →* ℂˣ)
    (hη : ∃ σ : L ≃ₐ[F] L, (η σ : ℂ) ≠ 1)
    (hodd : ∀ (w : NumberField.InfinitePlace L) (σ : L ≃ₐ[F] L),
      (w.comap (algebraMap F L)).IsReal → σ ∈ MulAction.stabilizer (L ≃ₐ[F] L) w →
      σ ≠ 1 → (η σ : ℂ) = -1) :
    Module.finrank ℂ
      (Submodule.span ℂ
        {x : ℂ ⊗[ℤ] Additive ((𝓞 L)ˣ) |
          ∀ σ : L ≃ₐ[F] L,
            TensorProduct.map (LinearMap.id : ℂ →ₗ[ℤ] ℂ)
              ((Units.map
                (NumberField.RingOfIntegers.mapRingHom σ.toRingHom).toMonoidHom
                ).toAdditive.toIntLinearMap) x = (η σ : ℂ) • x}) =
      NumberField.InfinitePlace.nrComplexPlaces F := by
  sorry

/-! The arithmetic contracts use upstream objects absent at the pin.
The names agree with the packet; none is an active Lean declaration here.

Node `keune-picard-eigen-obstruction`:
`picard_inverseCyclotomicEigen_torsion_eq_zero`.
F number field, p odd, m≥1, p∤disc(F), p∤#K₂(𝓞 F), n=p^m,
L=F(ζ_n), G=Gal(L/F), χ(σ) specified by σζ=ζ^χ(σ):
(Pic(𝓞 L[1/p])[n])^{χ⁻¹}=0. Import Keune's injection from
ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection. Its original-source
hypotheses remain a recorded gap at that supplier. The injection is on
(Pic/n)_{χ⁻¹}, not on Pic[n]. Use the finite-endomorphism criterion above
after choosing a generator of cyclic G.

Node `ordinary-unit-eigenclass-lift`:
`etale_inverseCyclotomicEigen_unitLift`.
Under the hypotheses of the Picard-obstruction contract, every χ⁻¹-eigenclass
in H¹_ét(𝓞 L[1/p],μ_n) has a unique preimage in
((𝓞 L)ˣ/((𝓞 L)ˣ)^n)^{χ⁻¹} under Kummer followed by inclusion.
The étale Kummer/localization compatibility is requested at M.1's realization
interface, alongside the field Kummer supplier; M.3 is the K₂ comparison.
Use the injective exact-map lemma twice: first for Kummer, then for
0→U/n→U_p/n→D/n→0, where D is the image of the integer valuation map.
Do not replace D/n by (ℤ/n)^{S_p} without checking saturation of D.
This is an eigenCLASS lift. It does not assert an eigenunit representative.
The inherited c_ζ factors through this lift; its finite Chern input is the
requested early M.8 prefix, not the whole cyclic late stage M.8.

Node `prime-unit-torsion-exact-sequence`:
`unit_inverseCyclotomicEigen_torsionSequence`.
F number field, p odd and p∤disc(F), L=F(ζ_p), U=(𝓞 L)ˣ,
T=NumberField.Units.torsion L, χ:G≃(ℤ/p)ˣ. There is an exact sequence
0→(T/T^p)^{χ⁻¹}→(U/U^p)^{χ⁻¹}→((U/T)/(U/T)^p)^{χ⁻¹}→0.
The right term has F_p-dimension r₂(F). The left term has dimension 1 for
p=3 and 0 for p≥5; hence the middle dimension is r₂(F)+[p=3].
Use the integral logarithmic lattice, the inverse Teichmüller character, and
the projector only for |G|=p−1. The complex finrank statement above alone
does not determine a mod-p eigenspace without this integral comparison.
The pinned `NumberField.Units.basisModTorsion` supplies the finite free
integral quotient, whose p-torsion vanishes in the tensor exact sequence.
-/

end TauCeti.HabiroNF


namespace TauCeti.HabiroNF.HB2

/-! ## HB.2/the-cyclic-quantum-dilogarithm -/

/-- CGZ (8): `D_ζ(x) = ∏_{k=1}^{n-1} (1 - ζ^k x)^k`. -/
def cyclicQuantumDilog {R : Type*} [CommRing R] (n : ℕ) (ζ : R) : R[X] :=
  ∏ k ∈ Finset.Ico 1 n, (1 - C (ζ ^ k) * X) ^ k

theorem cyclicQuantumDilog_map {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (n : ℕ) (ζ : R) : (cyclicQuantumDilog n ζ).map f = cyclicQuantumDilog n (f ζ) := sorry

/-- CGZ (21), denominators cleared. -/
theorem cyclicQuantumDilog_eval_mul_zeta_pow {K : Type*} [Field K] {n : ℕ} {ζ : K}
    (hζ : IsPrimitiveRoot ζ n) (m : ℕ) (x : K) :
    (1 - x ^ n) ^ m * (cyclicQuantumDilog n ζ).eval (ζ ^ m * x) =
      (cyclicQuantumDilog n ζ).eval x * ∏ k ∈ Finset.range m, (1 - ζ ^ k * x) ^ n := sorry

/-- CGZ (23), `n` odd. -/
theorem cyclicQuantumDilog_eval_one_sq {K : Type*} [Field K] {n : ℕ} {ζ : K}
    (hζ : IsPrimitiveRoot ζ n) (hn : Odd n) :
    ((cyclicQuantumDilog n ζ).eval 1) ^ 2 =
      (-1) ^ (n * (n - 1) / 2) * ζ ^ ((n - 1) * n * (2 * n - 1) / 6) * (n : K) ^ n := sorry

theorem cyclicQuantumDilog_eval_one_pow_24 {K : Type*} [Field K] {n : ℕ} {ζ : K}
    (hζ : IsPrimitiveRoot ζ n) :
    ((cyclicQuantumDilog n ζ).eval 1) ^ 24 = (n : K) ^ (12 * n) := sorry

/-- CGZ Lemma 2.4(b), in the stronger form modulo `n`-th powers of `K` itself. -/
theorem cyclicQuantumDilog_eval_one_mem_pow {K : Type*} [Field K] {n : ℕ} {ζ : K}
    (hζ : IsPrimitiveRoot ζ n) (hn : Odd n) :
    ∃ y : K, (cyclicQuantumDilog n ζ).eval 1 = (if 3 ∣ n then ζ ^ (n / 3) else 1) * y ^ n := sorry

/-- Test `cyclicQuantumDilog_two` (computation). -/
theorem cyclicQuantumDilog_two : cyclicQuantumDilog 2 (-1 : ℚ) = 1 + X := sorry

/-- Test `cyclicQuantumDilog_eval_one_pow_24n_ne` (non-example): GSWZ's `D(1)^{24m} = m^{12m}`
is false in CGZ's normalisation. -/
theorem cyclicQuantumDilog_eval_one_pow_72_ne {K : Type*} [Field K] [CharZero K] {ζ : K}
    (hζ : IsPrimitiveRoot ζ 3) :
    ((cyclicQuantumDilog 3 ζ).eval 1) ^ (24 * 3) ≠ (3 : K) ^ (12 * 3) := sorry

/-! ## HB.2/kummer-value-P -/

/-- `Lˣ ⧸ (Lˣ)ⁿ` (the same type as Mathlib's local notation `L / n` in `SelmerGroup.lean`). -/
abbrev PowClass (L : Type*) [Field L] (n : ℕ) : Type _ :=
  TauCeti.powerClassQuotient Lˣ n

/-- CGZ (20): `P_ζ(X) = D_ζ(x) / D_ζ(1)` modulo `n`-th powers, computed from a chosen root `x`
(`x ^ n ≠ 1` makes `D_ζ(x) ≠ 0`). -/
def Pzeta {H : Type*} [Field H] {n : ℕ} {ζ : H} (hζ : IsPrimitiveRoot ζ n) (x : Hˣ)
    (hx : (x : H) ^ n ≠ 1) : PowClass H n := sorry

theorem Pzeta_spec {H : Type*} [Field H] {n : ℕ} {ζ : H} (hζ : IsPrimitiveRoot ζ n) (x : Hˣ)
    (hx : (x : H) ^ n ≠ 1) (hDx : (cyclicQuantumDilog n ζ).eval (x : H) ≠ 0)
    (hD1 : (cyclicQuantumDilog n ζ).eval 1 ≠ 0) :
    Pzeta hζ x hx = QuotientGroup.mk (Units.mk0 _ hDx / Units.mk0 _ hD1) := sorry

/-- CGZ Lemma 2.4(a): independence of the root. -/
theorem Pzeta_root_indep {H : Type*} [Field H] {n : ℕ} {ζ : H} (hζ : IsPrimitiveRoot ζ n)
    (x x' : Hˣ) (j : ℕ) (hxx' : (x' : H) = ζ ^ j * x) (hx : (x : H) ^ n ≠ 1)
    (hx' : (x' : H) ^ n ≠ 1) :
    Pzeta hζ x' hx' = Pzeta hζ x hx := sorry

/-- CGZ Lemma 2.4(c) for odd `n`. -/
theorem Pzeta_mul_inv {H : Type*} [Field H] {n : ℕ} (hn : Odd n) {ζ : H} (hζ : IsPrimitiveRoot ζ n)
    (x : Hˣ) (hx : (x : H) ^ n ≠ 1) (hx' : ((x⁻¹ : Hˣ) : H) ^ n ≠ 1) :
    Pzeta hζ x hx * Pzeta hζ x⁻¹ hx' = 1 := sorry

/-- CGZ Lemma 2.7(1) at the level of `P`: `P_{ζ^k} = P_ζ^{k⁻¹}`. -/
theorem Pzeta_zeta_pow {H : Type*} [Field H] {n : ℕ} [NeZero n] {ζ : H} (hζ : IsPrimitiveRoot ζ n)
    {k : ℕ} (hk : k.Coprime n) (x : Hˣ) (hx : (x : H) ^ n ≠ 1) :
    Pzeta (hζ.pow_of_coprime k hk) x hx = Pzeta hζ x hx ^ ((k : ZMod n)⁻¹).val := sorry

/-- Test `Pzeta_zeta_sq_ne` (non-example): over `F_{19^2}`, `P_{ζ^2} ≠ P_ζ^2`. -/
theorem Pzeta_zeta_sq_ne_sq [Fact (Nat.Prime 19)] {ζ : GaloisField 19 2} (hζ : IsPrimitiveRoot ζ 5) :
    ∃ (x : (GaloisField 19 2)ˣ) (hx : (x : GaloisField 19 2) ^ 5 ≠ 1),
      Pzeta (hζ.pow_of_coprime 2 (by decide)) x hx ≠ Pzeta hζ x hx ^ 2 := sorry

/-! ## HB.2/kms-identity and HB.2/five-term-distribution-and-galois -/

/-- The `q`-Pochhammer symbol `(a; q)_k`. -/
def qPochhammer {R : Type*} [CommRing R] (a q : R) (k : ℕ) : R :=
  ∏ j ∈ Finset.range k, (1 - a * q ^ j)

/-- KMS (C.7) as quoted in CGZ §2.5, denominators cleared. -/
theorem kms_identity {K : Type*} [Field K] {n : ℕ}
    (hn : 3 ≤ n) (hodd : Odd n) (hunit : IsUnit (n : K)) {ζ : K} (hζ : IsPrimitiveRoot ζ n)
    {x y z : K} (hx : x ≠ 0) (hy : y ≠ 0) (hz : z ≠ 0) (hX : x ^ n ≠ 1) (hY : y ^ n ≠ 1)
    (hXY : x ^ n ≠ y ^ n) (hrel : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    (∑ k ∈ Finset.range n, qPochhammer (ζ * y) ζ k / qPochhammer (ζ * x) ζ k * z ^ k) ^ n *
        ((cyclicQuantumDilog n ζ).eval (1 / x) * (cyclicQuantumDilog n ζ).eval (y * ζ) *
          (cyclicQuantumDilog n ζ).eval (ζ / z)) =
      (ζ * y) ^ (n * (n - 1) / 2) *
        ((cyclicQuantumDilog n ζ).eval 1 * (cyclicQuantumDilog n ζ).eval (y * ζ / x) *
          (cyclicQuantumDilog n ζ).eval (x / (y * z))) := sorry

/-- CGZ Theorem 2.11 at the level of `P`, with explicit roots `x, y, z` of `X, Y, Z`. -/
theorem Pzeta_fiveTerm {H : Type*} [Field H] {n : ℕ} (hn : Odd n) {ζ : H}
    (hζ : IsPrimitiveRoot ζ n) (x y z : Hˣ)
    (hrel : (1 - (y : H) ^ n) * (z : H) ^ n = 1 - (x : H) ^ n)
    (hx : (x : H) ^ n ≠ 1) (hy : (y : H) ^ n ≠ 1) (hxy : (x : H) ^ n ≠ (y : H) ^ n)
    (h₁ : ((y / x : Hˣ) : H) ^ n ≠ 1) (h₂ : ((y * z / x : Hˣ) : H) ^ n ≠ 1)
    (h₃ : (z : H) ^ n ≠ 1) :
    Pzeta hζ x hx / Pzeta hζ y hy * Pzeta hζ (y / x) h₁ / Pzeta hζ (y * z / x) h₂ *
      Pzeta hζ z h₃ = 1 := sorry

/-! ## HB.2/the-map-R-zeta -/

/-- CGZ §1.1: `d[X] = X ∧ (1 - X)` modulo `n`, on Suslin's generators. -/
def blochBoundaryModN (F : Type*) [Field F] (n : ℕ) :
    FreeAbelianGroup {x : F // x ≠ 0 ∧ x ≠ 1} →+ ⋀[ℤ]^2 (Additive (PowClass F n)) := sorry

/-- `A(F; Z/n)`. -/
def blochCyclesModN (F : Type*) [Field F] (n : ℕ) :
    AddSubgroup (FreeAbelianGroup {x : F // x ≠ 0 ∧ x ≠ 1}) :=
  (blochBoundaryModN F n).ker

/-- The `χ⁻¹`-eigenspace of `Lˣ/(Lˣ)ⁿ` for `Gal(L/F)`, in the integral (kernel) formulation. -/
def chiInvPart {F L : Type*} [Field F] [Field L] [Algebra F L] {n : ℕ} [NeZero n] {ζ : L}
    (hζ : IsPrimitiveRoot ζ n) : Subgroup (PowClass L n) := sorry

theorem mem_chiInvPart_iff {F L : Type*} [Field F] [Field L] [Algebra F L] {n : ℕ} [NeZero n]
    {ζ : L} (hζ : IsPrimitiveRoot ζ n) (a : Lˣ) :
    (QuotientGroup.mk a : PowClass L n) ∈ chiInvPart (F := F) hζ ↔
      ∀ σ : L ≃ₐ[F] L, ∃ b : Lˣ,
        Units.map σ.toRingEquiv.toMonoidHom a ^ ((hζ.autToPow F σ : ZMod n).val) = a * b ^ n := sorry

/-- CGZ Proposition 2.5(b): `R_ζ` on `A(F; Z/n)` when `F` has no non-trivial `n`-th root of 1. -/
def Rzeta {F L : Type*} [Field F] [Field L] [Algebra F L] {n : ℕ} [NeZero n] {ζ : L}
    (hζ : IsPrimitiveRoot ζ n) (hw : ∀ ω : F, ω ^ n = 1 → ω = 1) :
    blochCyclesModN F n →+ Additive (chiInvPart (F := F) hζ) := sorry

/-- Test `Rzeta_thirtytwo_not_unit` (non-example): over `ℚ` with `n = 5`, the class of
`D_ζ(2)/D_ζ(1)` (which is `R_ζ([32])`) has valuation not divisible by 5 at a prime above 31. -/
theorem Pzeta_thirtytwo_not_unramified {L : Type*} [Field L] [NumberField L]
    [IsCyclotomicExtension {5} ℚ L] {ζ : L} (hζ : IsPrimitiveRoot ζ 5)
    (hD : (cyclicQuantumDilog 5 ζ).eval 2 / (cyclicQuantumDilog 5 ζ).eval 1 ≠ 0) :
    (QuotientGroup.mk (Units.mk0 _ hD) : PowClass L 5) ∉
      IsDedekindDomain.selmerGroup (R := NumberField.RingOfIntegers L) (K := L) (S := ∅) (n := 5) :=
  sorry

/-! ## HB.2/the-exported-interface -/

/-- GSWZ (16)–(17): the group in which `ε_m(ξ)` lives, `χ⁻¹`-classes unramified outside `S`. -/
def epsilonTarget (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L] [Algebra K L]
    (m : ℕ) [NeZero m] {ζ : L} (hζ : IsPrimitiveRoot ζ m)
    (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers L))) :
    Subgroup (PowClass L m) :=
  IsDedekindDomain.selmerGroup (R := NumberField.RingOfIntegers L) (K := L) (S := S) (n := m) ⊓
    chiInvPart (F := K) hζ

/-- `ε_m := c_{ζ_m}^2` (that is, `2 • c` additively), given HB.1's Chern class map `c` (a parameter: `K₃` is not in Mathlib). -/
def epsilonUnit {K3 L : Type*} [AddCommGroup K3] [Field L] (m : ℕ)
    (c : K3 →+ Additive (PowClass L m)) : K3 →+ Additive (PowClass L m) :=
  sorry

/-- Test `epsilonUnit_rootLine_indep` (characterisation): the root line depends only on the class. -/
theorem span_root_eq_of_eq_mul_pow {L E : Type*} [Field L] [Field E] [Algebra L E] {m : ℕ}
    (hm : 0 < m) {ζ : L} (hζ : IsPrimitiveRoot ζ m) {ε u : L} (hε : ε ≠ 0) (hu : u ≠ 0)
    {y y' : E} (hy : y ^ m = algebraMap L E ε) (hy' : y' ^ m = algebraMap L E (ε * u ^ m)) :
    Submodule.span L {y} = Submodule.span L {y'} := sorry

/-! ## HB.2/cyclic-bar-chains -/

/-- Hutchinson Lemma 2.1: `α₃(t) = Σ_{j < N} [t | t^j | t]` as an inhomogeneous 3-chain. -/
def cyclicBarChain₃ {G : Type} [Group G] (t : G) (N : ℕ) : G × G × G →₀ ℤ :=
  ∑ j ∈ Finset.range N, Finsupp.single (t, t ^ j, t) 1

/-- Test `cyclicBarChain_three_isCycle` (characterisation). -/
theorem d₃₂_cyclicBarChain₃ {G : Type} [Group G] (t : G) {N : ℕ} (hN : t ^ N = 1) :
    (groupHomology.d₃₂ (Rep.trivial ℤ G ℤ)).hom (cyclicBarChain₃ t N) = 0 := sorry

/-- Test `cyclicBarChain_two_boundary` (non-example): `α₂(t)` is a cycle only modulo `N`. -/
theorem d₂₁_cyclicBarChain₂ {G : Type} [Group G] (t : G) {N : ℕ} (hN : t ^ N = 1) :
    (groupHomology.d₂₁ (Rep.trivial ℤ G ℤ)).hom
        (∑ j ∈ Finset.range N, Finsupp.single (t, t ^ j) (1 : ℤ)) =
      Finsupp.single t (N : ℤ) := sorry

/-! ## HB.2/soule-formula-in-degree-three -/

/-- The index bookkeeping of Hutchinson Corollary 2.13: the only term of Soulé's sum for
`c̄_{2,1}` on `K₁ × K₂` is `(i', k', i'', k'') = (1, 1, 1, 0)`. -/
theorem soule_indices_deg_three (i' k' i'' k'' : ℕ) (h₁ : i' + i'' = 2) (h₂ : k' + k'' = 1)
    (h₃ : 2 * i' = 1 + k') (h₄ : 2 * i'' = 2 + k'') : (i', k', i'', k'') = (1, 1, 1, 0) := sorry

/-- Test `soule_sign`: granted Soulé's formula with its minus sign and `c̄_{1,0}(β) = ζ`,
multiplication by the Bott element gives MINUS the cup product with `ζ`. All groups are
parameters; `cup a ζ` is the class `a ⊗ ζ`. -/
theorem chern21_mul_bott {K1 K2 K3 C1 C2 M : Type*} [AddCommGroup K1] [AddCommGroup K2]
    [AddCommGroup K3] [AddCommGroup C1] [AddCommGroup C2] [AddCommGroup M]
    (mul : K1 →+ K2 →+ K3) (c11 : K1 →+ C1) (c10 : K2 →+ M) (c21 : K3 →+ C2)
    (cup : C1 →+ M →+ C2) (soule : ∀ a b, c21 (mul a b) = -cup (c11 a) (c10 b))
    (β : K2) (ζ : M) (hβ : c10 β = ζ) (x : K1) :
    c21 (mul x β) = -cup (c11 x) ζ := sorry

end TauCeti.HabiroNF.HB2


namespace TauCeti.HabiroNF.HB2

open Polynomial

/-! ### HB.2 -/

/-- API `gswzDilog`: GSWZ's normalisation `∏_{ℓ<m} (1 − ζ^ℓ z)^{ℓ/m}` on `|z| < 1`, with the
principal branch; its `m`-th power is `D_ζ(z)`. -/
def gswzDilog (m : ℕ) (ζ z : ℂ) : ℂ := ∏ ℓ ∈ Finset.Ico 1 m, (1 - ζ ^ ℓ * z) ^ ((ℓ : ℂ) / m)

/-- Test `cyclicQuantumDilog_eval_one_pow_24_example` (computation): `D_ζ(1)^24 = n^{12n}` for
`2 ≤ n ≤ 16` (PARI/GP). -/
example {K : Type*} [Field K] [CharZero K] {n : ℕ} (h2 : 2 ≤ n) (h16 : n ≤ 16) {ζ : K}
    (hζ : IsPrimitiveRoot ζ n) :
    ((cyclicQuantumDilog n ζ).eval 1) ^ 24 = (n : K) ^ (12 * n) := sorry

/-- Test `cyclicQuantumDilog_eval_mul_zeta` (characterisation): CGZ (21),
`D_ζ(ζx)(1 − x^n) = D_ζ(x)(1 − x)^n`. -/
example {K : Type*} [Field K] {n : ℕ} {ζ : K} (hζ : IsPrimitiveRoot ζ n) :
    (cyclicQuantumDilog n ζ).comp (C ζ * X) * (1 - X ^ n) = cyclicQuantumDilog n ζ * (1 - X) ^ n :=
  sorry

/-- Test `cyclicQuantumDilog_eval_one_nine` (computation): in `ℚ(ζ₉)`, `D_ζ(1)/ζ³` is a ninth
power and `D_ζ(1)/ζ^e` is not for `e ≠ 3` (PARI/GP). -/
example {K : Type*} [Field K] [CharZero K] {ζ : K} (hζ : IsPrimitiveRoot ζ 9)
    (hK : Algebra.adjoin ℚ {ζ} = ⊤) :
    (∃ y : K, (cyclicQuantumDilog 9 ζ).eval 1 = ζ ^ 3 * y ^ 9) ∧
      ∀ e < 9, e ≠ 3 → ¬ ∃ y : K, (cyclicQuantumDilog 9 ζ).eval 1 = ζ ^ e * y ^ 9 := sorry

-- Pzeta_galois: not stated; needs the Galois action on the classes `PowClass H n` of the Kummer
--   extension H/F_n, which is not constructed here.

/-- Test `Pzeta_root_indep_finite_field` (computation): in `F_{19²}` with `n = 5`, changing `x` by
a power of `ζ` does not change `P_ζ(x)` (checked in PARI/GP). -/
example [Fact (Nat.Prime 19)] {ζ : GaloisField 19 2} (hζ : IsPrimitiveRoot ζ 5)
    (x x' : (GaloisField 19 2)ˣ) (j : ℕ) (hxx' : (x' : GaloisField 19 2) = ζ ^ j * x)
    (hx : (x : GaloisField 19 2) ^ 5 ≠ 1) (hx' : (x' : GaloisField 19 2) ^ 5 ≠ 1) :
    Pzeta hζ x' hx' = Pzeta hζ x hx :=
  Pzeta_root_indep hζ x x' j hxx' hx hx'

/-- Test `Pzeta_mul_inv_finite_field` (computation): in `F_{19²}` with `n = 5`,
`P_ζ(x) P_ζ(1/x) = 1` (checked in PARI/GP). -/
example [Fact (Nat.Prime 19)] {ζ : GaloisField 19 2} (hζ : IsPrimitiveRoot ζ 5)
    (x : (GaloisField 19 2)ˣ) (hx : (x : GaloisField 19 2) ^ 5 ≠ 1)
    (hx' : ((x⁻¹ : (GaloisField 19 2)ˣ) : GaloisField 19 2) ^ 5 ≠ 1) :
    Pzeta hζ x hx * Pzeta hζ x⁻¹ hx' = 1 :=
  Pzeta_mul_inv (by decide) hζ x hx hx'

-- Test Pzeta_one: not stated; `P_ζ` is defined here on `x` with `x^n ≠ 1`, and the value at `1`
--   (and at `0`, `∞`) needs the extension of `P_ζ` to `P¹(F)` of CGZ (20).
-- HB.2/lifting-obstruction-is-a-cup-product: not stated; needs H²(Gal(H/F_n), μ_n) with the cup
--   product (Tau Ceti ProfiniteCohomology).
-- Rzeta_spec: not stated; needs the lift from `PowClass` of the Kummer extension to `chiInvPart`,
--   which `Rzeta` above takes as its definition (the descent is not constructed).
-- Rzeta_of_rep: not stated; needs Rzeta_spec.
-- Rzeta_pow_wF: not stated; needs the Bloch group B(F; ℤ/n) of HB.2/etale-bloch-group-and-K2.
-- Rzeta_add: not stated; `Rzeta` is additive by its type (an additive homomorphism).
-- Test Rzeta_eta_five: not stated; needs η_ζ (HB.2/the-element-eta).
-- Test Rzeta_two_Q: not stated; needs Rzeta_spec.
-- Test Rzeta_chi_inv: not stated; needs Rzeta_spec.
-- HB.2/root-of-unity-dependence: not stated; needs Rzeta_spec (for P_ζ it is `Pzeta_zeta_pow`).
-- HB.2/distribution-in-the-order: not stated; needs Rzeta_spec.
-- HB.2/change-of-field: not stated; needs Rzeta_spec and the Bloch groups' functoriality (K3BlochGroups V.3).
-- HB.2/etale-bloch-group-and-K2: not stated; needs K₂(F)/n and Tate's theorem (MotivicEtaleKTheory M.3).
-- HB.2/the-element-eta: not stated; needs the Bloch group B_CGZ(F) (K3BlochGroups V.3).
-- etaZeta: not stated; needs the Bloch group.
-- etaZeta_eq_crossRatio: not stated; needs etaZeta.
-- etaZeta_boundary: not stated; needs etaZeta.
-- etaZeta_nsmul: not stated; needs etaZeta.
-- etaZeta_conj: not stated; needs etaZeta.
-- Test etaZeta_five: not stated; needs etaZeta.
-- Test etaZeta_eq_crossRatio_small: not stated; needs etaZeta.
-- Test etaZeta_local_value: not stated; needs etaZeta and the local maps.
-- Test etaZeta_three: not stated; needs etaZeta.
-- cyclicBarChain: stated in degree three as `cyclicBarChain₃`; the chain map α_* in all degrees
--   needs the bar complex as a chain complex over ℤ[G] (Mathlib's `Rep.barResolution` gives it, but the
--   comparison with α_* is not stated here).
-- cyclicBarChain_isChainMap: not stated; needs cyclicBarChain in all degrees.
-- cyclicBarChain_three_generates: not stated; needs group homology H₃(ℤ/N) ≅ ℤ/N with its generator.
-- cyclicBarChain_mod_generates: not stated; needs H₃(ℤ/N; ℤ/N).
-- cyclicBarChain_pontryagin: not stated; needs the Pontryagin product on group homology.
-- cyclicBarChain_map: not stated; needs cyclicBarChain in all degrees.
-- Test cyclicBarChain_order_three: not stated; needs cyclicBarChain_three_generates.
-- Test cyclicBarChain_trivial: not stated; needs cyclicBarChain in all degrees.
-- HB.2/bott-element: not stated; needs K₂(R; ℤ/N) (StableHomotopyKTheory H.6).
-- bottElement: not stated; needs K₂(R; ℤ/N).
-- bockstein_bottElement: not stated; needs bottElement.
-- chern10_bottElement: not stated; needs bottElement and Soulé's c̄_{1,0} (MotivicEtaleKTheory M.8).
-- bottElement_map: not stated; needs bottElement.
-- bottElement_pow: not stated; needs bottElement.
-- Test bottElement_not_integral: not stated; needs bottElement.
-- Test bottElement_Zzeta: not stated; needs bottElement.
-- Test bottElement_algClosure: not stated; needs bottElement.
-- HB.2/hurewicz-mod-odd-N: not stated; needs the Hurewicz map K₃ → H₃(SL₂) (K3BlochGroups V.2, V.4).
-- HB.2/eta-is-zeta-times-bott: not stated; needs etaZeta and bottElement.
-- HB.2/chern-sign-conventions: the sign bookkeeping is the form `chern21_mul_bott` above; the
--   conventions themselves need Soulé's classes (MotivicEtaleKTheory M.8).
-- HB.2/chern-class-of-eta: not stated; needs etaZeta and chernClassMap.
-- HB.2/local-maps-at-primes-of-norm-minus-one: not stated; needs the Bloch groups of finite fields
--   (K3BlochGroups V.5) and K₃ of finite fields (KTheoryFiniteLocalFields L.2, L.7).
-- Rzeta_local: not stated; needs B(F_q) ⊗ ℤ/n (K3BlochGroups V.5).
-- chern_local: not stated; needs K₃(F_q) (KTheoryFiniteLocalFields L.2).
-- Rzeta_local_reduction: not stated; needs Rzeta_local.
-- chern_local_reduction: not stated; needs chern_local.
-- suslin_reduction: not stated; needs Suslin's map (K3BlochGroups V.4).
-- Test Rzeta_local_eta: not stated; needs Rzeta_local and etaZeta.
-- Test Rzeta_local_no_kummer: not stated; needs Rzeta_local.
-- Test Rzeta_local_q_one_mod_n: not stated; needs Rzeta_local.
-- HB.2/eta-generates: not stated; needs etaZeta and the local maps.
-- HB.2/local-R-is-an-isomorphism: not stated; needs Rzeta_local.
-- HB.2/chebotarev-detection: not stated; needs the Chebotarev density theorem (Tau Ceti Chebotarev
--   roadmap, layer 10).
-- HB.2/the-comparison-with-the-chern-class: not stated; needs chernClassMap and Rzeta_spec.
-- HB.2/scalar-from-eta: not stated; needs the comparison above.
-- HB.2/eta-galois-scaling: not stated; needs etaZeta.
-- HB.2/R-injectivity-and-image: not stated; needs Rzeta_spec and chernClassMap.
-- HB.2/hutchinson-refinement: not stated; needs the comparison with EXPLICIT
--   prime-power evaluation/CRT hypotheses. The unconditional CGZ input is late HB.4/HB.5.
-- epsilonUnit_mem_selmer: not stated; needs chernClassMap (the target is `epsilonTarget`).
-- epsilonUnit_add: `epsilonUnit` is additive by its type.
-- epsilonUnit_galois: not stated; needs chernClassMap_mem_eigenspace.
-- epsilonUnit_coherent: not stated; needs chernClassMap for varying m.
-- epsilonUnit_rootLine: the root line depends only on the class (`span_root_eq_of_eq_mul_pow`); its
--   definition from ε_m needs chernClassMap.
-- epsilonUnit_kummer: not stated; needs the Kummer isomorphism (Tau Ceti ProfiniteCohomology layer 9).
-- epsilonUnit_eq_Rzeta: not stated; requires the late unconditional comparison,
--   or all the evaluation and normalization premises of the early conditional implication.
-- epsilonUnit_unit_rep: not stated; needs HB.2/R-injectivity-and-image.
-- Test epsilonUnit_Q: not stated; needs K₃(ℚ) and chernClassMap.
-- Test epsilonUnit_mu_in_K: not stated; needs chernClassMap for ℚ(√−3), m = 3.
-- Test epsilonUnit_coherent_local: not stated; needs epsilonUnit_coherent.
-- Test epsilonUnit_one: not stated; needs chernClassMap for m = 1.

end TauCeti.HabiroNF.HB2


open scoped BigOperators

namespace TauCeti.HabiroNF

/-! ## HabiroNumberFields:HB.2/cyclic-hypergeometric-sum -/

/-- The total finite expression in CGZ §2.5 and GZ Appendix A (56).
The product starts at `ζ * y`, and the sum includes `k = 0`.
Periodicity requires the cyclic hypotheses of `cyclicHypergeom_shift_z`. -/
noncomputable def cyclicHypergeom {K : Type*} [Field K]
    (n : ℕ) (ζ x y z : K) : K :=
  ∑ k ∈ Finset.range n,
    (HB2.qPochhammer (ζ * y) ζ k / HB2.qPochhammer (ζ * x) ζ k) * z ^ k

theorem cyclicHypergeom_eq_sum {K : Type*} [Field K]
    (n : ℕ) (ζ x y z : K) :
    cyclicHypergeom n ζ x y z =
      ∑ k ∈ Finset.range n,
        ((∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * y)) /
         (∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * x))) * z ^ k := sorry

@[simp] theorem cyclicHypergeom_zero {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 0 ζ x y z = 0 := sorry

@[simp] theorem cyclicHypergeom_one {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 1 ζ x y z = 1 := sorry

@[simp] theorem cyclicHypergeom_two {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 2 ζ x y z = 1 + (1 - ζ * y) / (1 - ζ * x) * z := sorry

theorem cyclicHypergeom_map {K L : Type*} [Field K] [Field L]
    (φ : K →+* L) (n : ℕ) (ζ x y z : K) :
    φ (cyclicHypergeom n ζ x y z) =
      cyclicHypergeom n (φ ζ) (φ x) (φ y) (φ z) := sorry

theorem cyclicHypergeom_diagonal {K : Type*} [Field K]
    (n : ℕ) (ζ x z : K)
    (hx : ∀ k ∈ Finset.range n,
      (∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * x)) ≠ 0) :
    cyclicHypergeom n ζ x x z = ∑ k ∈ Finset.range n, z ^ k := sorry

/-- Compatibility with Mathlib's `IsPrimitiveRoot.geom_sum_eq_zero`. -/
theorem cyclicHypergeom_diagonal_root {K : Type*} [Field K]
    {n : ℕ} (hn : 1 < n) (ζ x z : K) (hz : IsPrimitiveRoot z n)
    (hx : ∀ k ∈ Finset.range n,
      (∏ j ∈ Finset.range k, (1 - ζ ^ (j + 1) * x)) ≠ 0) :
    cyclicHypergeom n ζ x x z = 0 := sorry

theorem cyclicHypergeom_shift_z {K : Type*} [Field K]
    {n : ℕ} (hn : 0 < n) (ζ x y z : K) (hζ : IsPrimitiveRoot ζ n)
    (hx : x ^ n ≠ 1) (hy : y ^ n ≠ 1)
    (hperiod : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    (1 - z) * cyclicHypergeom n ζ x y z =
      (x - ζ * y * z) * cyclicHypergeom n ζ x y (ζ * z) := sorry

/-- Test `cyclicHypergeom_empty` (degenerate). -/
example {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 0 ζ x y z = 0 := sorry

/-- Test `cyclicHypergeom_singleton` (computation). -/
example {K : Type*} [Field K] (ζ x y z : K) :
    cyclicHypergeom 1 ζ x y z = 1 := sorry

/-- Test `cyclicHypergeom_rational_two` (computation).
A product starting at `y` instead of `ζ * y` fails this test. -/
example : cyclicHypergeom 2 (-1 : ℚ) 2 3 5 = 23 / 3 := sorry

/-- Test `cyclicHypergeom_diagonal_three` (compatibility). -/
example (ζ : ℂ) (hζ : IsPrimitiveRoot ζ 3) :
    cyclicHypergeom 3 ζ 0 0 ζ = 0 := sorry

/-! ## HabiroNumberFields:HB.2/kms-odd-order-proof -/

/-- The odd-order KMS identity quoted by CGZ §2.5, with denominators cleared.
`D` is the evaluation of HB2.cyclicQuantumDilog above.
The analytic proof uses the corrected Gaussian/product constants and the
explicit eta phase. Integral specialization covers positive characteristic. -/
theorem kms_oddOrder {K : Type*} [Field K] {n : ℕ}
    (hn : 3 ≤ n) (hodd : Odd n) (hunit : IsUnit (n : K))
    (ζ x y z : K) (hζ : IsPrimitiveRoot ζ n)
    (hx0 : x ≠ 0) (hy0 : y ≠ 0) (hz0 : z ≠ 0)
    (hx : x ^ n ≠ 1) (hy : y ^ n ≠ 1) (hxy : x ^ n ≠ y ^ n)
    (hperiod : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
    let D : K → K := fun u => (HB2.cyclicQuantumDilog n ζ).eval u
    cyclicHypergeom n ζ x y z ^ n * D (1 / x) * D (ζ * y) * D (ζ / z) =
      (ζ * y) ^ (n * (n - 1) / 2) * D 1 * D (ζ * y / x) * D (x / (y * z)) := sorry

/-! ## Actual homology/Bloch and K-theory/Chern comparisons -/

-- eta_bar_bloch_specialization: not stated; needs the actual cyclic group
-- resolution and homology classes, the V.4 refined configuration map,
-- the V.3 Suslin-to-CGZ convention maps, and the parent's eta element.
-- The required statement is equality of the image of the positive
-- alpha_3(t) with eta in B_CGZ(Q(zeta + zeta^-1))/N. The N=3 image is [0],
-- not zero after dropping the correction term. The determinant-one
-- conjugation in the roadmap is a proof component, not a substitute map.

-- eta_chern_signed_evaluation: not stated; needs actual finite-coefficient
-- K-theory, the Bott class with boundary zeta, the early M.8 finite-Chern
-- prefix and the continuous Kummer identification of ProfiniteCohomology
-- Layer 9. For N an odd prime power with the standard positive bar/Bott
-- and Kummer conventions, raw Soule evaluates to [zeta^-1].
-- The independently negated degree-(2,1) Chern map evaluates to [zeta].
-- Identifying CGZ/GSWZ's fixed map with
-- either one is a separate obligation; no normalization is chosen by eta.

/-- Acceptance for the signed evaluation: classes of a primitive cubic
root and its inverse differ. This uses Tau Ceti's actual power-class map;
the unit has value 2 and inverse 4 in F_7. -/
example :
    let ζ : (ZMod 7)ˣ := ⟨2, 4, by decide, by decide⟩
    TauCeti.powerClassHom (ZMod 7)ˣ 3 ζ ≠
      (TauCeti.powerClassHom (ZMod 7)ˣ 3 ζ)⁻¹ := sorry

-- The full regulator conclusion is HabiroNahmSeries:HB.5's assembly:
-- import HB.4/acceptance-andrews-gordon, QM.0's Andrews–Gordon API,
-- QM.1's theta/eta transformations, and HB.2's scalar-from-eta.
-- Export the convention-qualified comparison to HabiroNahmSeries HB.9.
-- No HB.4 theorem is a premise of an HB.2 declaration here.

end TauCeti.HabiroNF


namespace TauCeti.HabiroNF.HB67

/-! ## HB.6/compatible-roots-of-unity -/

/-- The full cyclotomic coefficient algebra `R[ζ_m] := R[t]/(Φ_m) = R ⊗_ℤ ℤ[ζ_m]`. -/
abbrev CoeffRing (R : Type*) [CommRing R] (m : ℕ) : Type _ :=
  AdjoinRoot (cyclotomic m R)

/-- The generator `ζ_m`. -/
abbrev zeta (R : Type*) [CommRing R] (m : ℕ) : CoeffRing R m :=
  AdjoinRoot.root (cyclotomic m R)

/-- API `CoeffRing.zeta`: the same universal root as `zeta`. -/
abbrev CoeffRing.zeta (R : Type*) [CommRing R] (m : ℕ) : CoeffRing R m := TauCeti.HabiroNF.HB67.zeta R m

/-- `e(p,m)`: `e ≡ p [MOD p ^ (v_p m + 1)]`, `e ≡ 1 [MOD m / p ^ v_p m]`, reduced mod `p * m`. -/
def compatExp (p m : ℕ) : ℕ := sorry

theorem compatExp_modEq_left (p m : ℕ) [Fact p.Prime] (hm : 0 < m) :
    compatExp p m ≡ p [MOD p ^ (m.factorization p + 1)] := sorry

theorem compatExp_modEq_right (p m : ℕ) [Fact p.Prime] (hm : 0 < m) :
    compatExp p m ≡ 1 [MOD m / p ^ m.factorization p] := sorry

/-- The transition map `R[ζ_m] → R[ζ_{pm}]`, `ζ_m ↦ ζ_{pm}^{e(p,m)}` (GSWZ (7)). -/
def transition (R : Type*) [CommRing R] (p m : ℕ) (hp : p.Prime) (hm : 0 < m) : CoeffRing R m →+* CoeffRing R (p * m) :=
  AdjoinRoot.lift (algebraMap R (CoeffRing R (p * m))) (zeta R (p * m) ^ compatExp p m) sorry

@[simp] theorem transition_zeta (R : Type*) [CommRing R] (p m : ℕ) (hp : p.Prime) (hm : 0 < m) :
    transition R p m hp hm (zeta R m) = zeta R (p * m) ^ compatExp p m := sorry

/-- `sub_pow_totient_mem`: `(ζ_{pm} − ζ_m)^{φ(p^{v_p m + 1})} ∈ p · ℤ[ζ_{pm}]ˣ`. -/
theorem sub_pow_totient_mem (p m : ℕ) [Fact p.Prime] (hm : 0 < m) :
    ∃ u : (CoeffRing ℤ (p * m))ˣ,
      (zeta ℤ (p * m) - transition ℤ p m Fact.out hm (zeta ℤ m)) ^
          Nat.totient (p ^ (m.factorization p + 1)) = (p : CoeffRing ℤ (p * m)) * u := sorry

/-- test `compatExp_two_five` (computation). -/
example : compatExp 2 5 = 6 := sorry

/-- test `traditional_roots_not_close` (non-example): `ω₁₀ − ω₅ = ζ − ζ²` is a unit. -/
example : IsUnit (zeta ℤ 10 - zeta ℤ 10 ^ 2) := sorry

/-- test `compatible_one` (degenerate): `(ζ_p − 1)^{p−1} ∈ p · ℤ[ζ_p]ˣ`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ u : (CoeffRing ℤ (p * 1))ˣ, (zeta ℤ (p * 1) - 1) ^ (p - 1) = (p : CoeffRing ℤ (p * 1)) * u :=
  sorry

/-! ## HB.6/coefficient-rings-and-frobenius -/

section Frobenius

variable (K : Type*) [Field K] [NumberField K] (Δ : ℕ)

/-- `R = 𝓞_K[1/Δ]`. -/
abbrev SIntegers : Type _ := Localization.Away (Δ : NumberField.RingOfIntegers K)

/-- `R^_p[ζ_n]`, the `p`-adic completion of `R[ζ_n]` (`= R^_p ⊗ ℤ[ζ_n]`). -/
abbrev CompletedCoeff (R : Type*) [CommRing R] (p n : ℕ) : Type _ :=
  AdicCompletion (Ideal.span {(p : CoeffRing R n)}) (CoeffRing R n)

theorem CompletedCoeff.subsingleton_of_dvd {p : ℕ} (hp : p.Prime) (h : p ∣ Δ) (n : ℕ) :
    Subsingleton (CompletedCoeff (SIntegers K Δ) p n) := sorry

theorem CompletedCoeff.isAdicComplete (p n : ℕ) :
    IsAdicComplete (Ideal.span {(p : CompletedCoeff (SIntegers K Δ) p n)})
      (CompletedCoeff (SIntegers K Δ) p n) := sorry

/-- GSWZ Definition 1.1's Frobenius `φ_p ⊗ id` on `R^_p[ζ_n]`, fixing `ζ_n`
(meaningful for `p ∤ Δ`; for `p ∣ Δ` the ring is `0`). -/
def frobenius (p n : ℕ) :
    CompletedCoeff (SIntegers K Δ) p n →+* CompletedCoeff (SIntegers K Δ) p n := sorry

@[simp] theorem frobenius_zeta (p n : ℕ) :
    frobenius K Δ p n (algebraMap _ _ (zeta (SIntegers K Δ) n)) =
      algebraMap _ _ (zeta (SIntegers K Δ) n) := sorry

theorem frobenius_sub_pow_mem {p : ℕ} (hp : p.Prime) (hΔ : NumberField.discr K ∣ (Δ : ℤ))
    (hpΔ : ¬ p ∣ Δ) (n : ℕ) (a : SIntegers K Δ) :
    frobenius K Δ p n (algebraMap _ _ (algebraMap _ (CoeffRing (SIntegers K Δ) n) a)) -
        (algebraMap _ _ (algebraMap _ (CoeffRing (SIntegers K Δ) n) a)) ^ p ∈
      Ideal.span {(p : CompletedCoeff (SIntegers K Δ) p n)} := sorry

theorem frobenius_unique {p : ℕ} (hp : p.Prime) (hΔ : NumberField.discr K ∣ (Δ : ℤ))
    (hpΔ : ¬ p ∣ Δ) (n : ℕ)
    (φ : CompletedCoeff (SIntegers K Δ) p n →+* CompletedCoeff (SIntegers K Δ) p n)
    (h₁ : φ (algebraMap _ _ (zeta (SIntegers K Δ) n)) = algebraMap _ _ (zeta (SIntegers K Δ) n))
    (h₂ : ∀ a : SIntegers K Δ,
      φ (algebraMap _ _ (algebraMap _ (CoeffRing (SIntegers K Δ) n) a)) -
        (algebraMap _ _ (algebraMap _ (CoeffRing (SIntegers K Δ) n) a)) ^ p ∈
          Ideal.span {(p : CompletedCoeff (SIntegers K Δ) p n)}) :
    φ = frobenius K Δ p n := sorry

theorem frobenius_bijective {p : ℕ} (hp : p.Prime) (hΔ : NumberField.discr K ∣ (Δ : ℤ))
    (hpΔ : ¬ p ∣ Δ) (n : ℕ) : Function.Bijective (frobenius K Δ p n) := sorry

/-- Extension (ii): for `p ∤ m`, the Frobenius of `R^_p[ζ_m]` with `ζ_m ↦ ζ_m^p` (Lemma 3.4). -/
def cyclotomicFrobenius (p m : ℕ) :
    CompletedCoeff (SIntegers K Δ) p m →+* CompletedCoeff (SIntegers K Δ) p m := sorry

theorem cyclotomicFrobenius_zeta {p m : ℕ} (hp : p.Prime) (hpm : ¬ p ∣ m) :
    cyclotomicFrobenius K Δ p m (algebraMap _ _ (zeta (SIntegers K Δ) m)) =
      algebraMap _ _ (zeta (SIntegers K Δ) m) ^ p := sorry

/-- test `frobenius_rat` (compatibility): for `K = ℚ`, `φ_p = id`. -/
example (Δ p n : ℕ) : frobenius ℚ Δ p n = RingHom.id _ := sorry

/-- test `frobenius_not_global` (non-example): if `K ∋ ∛2`, `disc K ∣ Δ` and `5 ∤ Δ`, then
`φ_5 ≠ id`; for `K = ℚ(∛2)`, whose only automorphism is the identity, `φ_5` is not induced by
an automorphism of `K`. -/
example (α : K) (hα : α ^ 3 = 2) (hΔ : NumberField.discr K ∣ (Δ : ℤ)) (h5 : ¬ 5 ∣ Δ) :
    frobenius K Δ 5 1 ≠ RingHom.id _ := sorry

/-- test `coeffRing_gaussian_splits` (non-example): for `K = ℚ(i)`, `R[ζ₄]` is not a domain. -/
example : ¬ IsDomain (CoeffRing (SIntegers (CyclotomicField 4 ℚ) 4) 4) := sorry

end Frobenius

/-! ## HB.6/the-substitution-exists (uses HC.3's re-expansion) -/

/-- Stand-in for `HabiroCyclotomicCompletions` HC.3/p-adic-re-expansion: `f(x) ↦ f(x + c)`
for `c` topologically nilpotent in a `p`-adically complete ring. -/
def rex {B : Type*} [CommRing B] (p : ℕ) (hB : IsAdicComplete (Ideal.span {(p : B)}) B)
    (c : B) (hc : ∃ N, c ^ N ∈ Ideal.span {(p : B)}) : PowerSeries B →+* PowerSeries B := sorry

section Gluing

variable (K : Type*) [Field K] [NumberField K] (Δ : ℕ)

/-- `c = ζ_{pm} − ζ_m ∈ R^_p[ζ_{pm}]`. -/
def rootDifference (p m : ℕ) (hp : p.Prime) (hm : 0 < m) : CompletedCoeff (SIntegers K Δ) p (p * m) :=
  algebraMap _ _ (zeta (SIntegers K Δ) (p * m) - transition (SIntegers K Δ) p m hp hm (zeta _ m))

theorem rootDifference_pow_mem {p : ℕ} (hp : p.Prime) (m : ℕ) (hm : 0 < m) :
    ∃ N, rootDifference K Δ p m hp hm ^ N ∈ Ideal.span {(p : CompletedCoeff (SIntegers K Δ) p (p * m))} :=
  sorry

/-- `rootDifference` is not nilpotent, so `PowerSeries.HasSubst` fails (for `p ∤ Δ`). -/
theorem not_isNilpotent_rootDifference {p : ℕ} (hp : p.Prime) (hΔ : NumberField.discr K ∣ (Δ : ℤ))
    (hpΔ : ¬ p ∣ Δ) (m : ℕ) (hm : 0 < m) : ¬ IsNilpotent (rootDifference K Δ p m hp hm) := sorry

/-! ## HB.6/the-gluing-condition -/

/-- `P_R = ∏_{m ≥ 1} R[ζ_m][[x]]`. -/
abbrev Families (R : Type*) [CommRing R] : Type _ := ∀ m : ℕ+, PowerSeries (CoeffRing R m)

/-- GSWZ (13) at `(p, m)`. -/
def GluesAt {p : ℕ} (hp : p.Prime) (m : ℕ+) (f : Families (SIntegers K Δ)) : Prop :=
  rex p (CompletedCoeff.isAdicComplete K Δ p (p * m)) (rootDifference K Δ p m hp m.pos)
      (rootDifference_pow_mem K Δ hp m m.pos)
      (PowerSeries.map ((algebraMap (CoeffRing (SIntegers K Δ) (p * m)) (CompletedCoeff (SIntegers K Δ) p (p * m))).comp
        (transition (SIntegers K Δ) p m hp m.pos)) (f m)) =
    PowerSeries.map (frobenius K Δ p (p * m))
      (PowerSeries.map (algebraMap (CoeffRing (SIntegers K Δ) (p * m)) (CompletedCoeff (SIntegers K Δ) p (p * m)))
        (f ⟨p * m, Nat.mul_pos hp.pos m.pos⟩))

/-- The Habiro ring `H_R` (GSWZ Definition 1.1). -/
def habiroRing : Subring (Families (SIntegers K Δ)) where
  carrier := {f | ∀ (p : ℕ) (hp : p.Prime) (m : ℕ+), GluesAt K Δ hp m f}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

theorem mem_habiroRing_iff (f : Families (SIntegers K Δ)) :
    f ∈ habiroRing K Δ ↔ ∀ (p : ℕ) (hp : p.Prime) (m : ℕ+), GluesAt K Δ hp m f := Iff.rfl

/-- test `gluesAt_of_dvd` (degenerate). -/
theorem gluesAt_of_dvd {p : ℕ} (hp : p.Prime) (h : p ∣ Δ) (m : ℕ+) (f : Families (SIntegers K Δ)) :
    GluesAt K Δ hp m f := sorry

/-- The projection `f ↦ f_m`. -/
def habiroRing.proj (m : ℕ+) : habiroRing K Δ →+* PowerSeries (CoeffRing (SIntegers K Δ) m) :=
  sorry

/-- The evaluation `f ↦ f_m(0)`. -/
def habiroRing.eval (m : ℕ+) : habiroRing K Δ →+* CoeffRing (SIntegers K Δ) m :=
  (PowerSeries.constantCoeff (R := CoeffRing (SIntegers K Δ) m)).comp (habiroRing.proj K Δ m)

/-- Families on orders prime to `γ`. -/
abbrev FamiliesPrimeTo (R : Type*) [CommRing R] (γ : ℕ) : Type _ :=
  ∀ m : {m : ℕ+ // Nat.Coprime m γ}, PowerSeries (CoeffRing R m)

/-- GSWZ (13) at `(p, m)` for a family on orders prime to `γ` (both `m` and `pm` prime to `γ`). -/
def GluesAtPrimeTo (γ : ℕ) {p : ℕ} (hp : p.Prime) (m : ℕ+) (hm : Nat.Coprime (p * m) γ)
    (f : FamiliesPrimeTo (SIntegers K Δ) γ) : Prop :=
  rex p (CompletedCoeff.isAdicComplete K Δ p (p * m)) (rootDifference K Δ p m hp m.pos)
      (rootDifference_pow_mem K Δ hp m m.pos)
      (PowerSeries.map ((algebraMap (CoeffRing (SIntegers K Δ) (p * m)) (CompletedCoeff (SIntegers K Δ) p (p * m))).comp
        (transition (SIntegers K Δ) p m hp m.pos)) (f ⟨m, Nat.Coprime.coprime_mul_left hm⟩)) =
    PowerSeries.map (frobenius K Δ p (p * m))
      (PowerSeries.map (algebraMap (CoeffRing (SIntegers K Δ) (p * m)) (CompletedCoeff (SIntegers K Δ) p (p * m)))
        (f ⟨⟨p * m, Nat.mul_pos hp.pos m.pos⟩, hm⟩))

/-- `H_R|γ`. -/
def habiroRingPrimeTo (γ : ℕ) : Subring (FamiliesPrimeTo (SIntegers K Δ) γ) where
  carrier := {f | ∀ (p : ℕ) (hp : p.Prime) (m : ℕ+) (hm : Nat.Coprime (p * m) γ),
    GluesAtPrimeTo K Δ γ hp m hm f}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- Restriction `H_R → H_R|γ`. -/
def habiroRing.restrict (γ : ℕ) : habiroRing K Δ →+* habiroRingPrimeTo K Δ γ := sorry

/-- test `constant_i_not_glued` (non-example): the constant family `i` is not in `H_R`
for `K = ℚ(i)`, `Δ = 4`. -/
example (i : NumberField.RingOfIntegers (CyclotomicField 4 ℚ)) (hi : i ^ 2 = -1) :
    (fun m : ℕ+ => PowerSeries.C (algebraMap _ (CoeffRing (SIntegers (CyclotomicField 4 ℚ) 4) m)
      (algebraMap (NumberField.RingOfIntegers (CyclotomicField 4 ℚ)) (SIntegers (CyclotomicField 4 ℚ) 4) i))) ∉
      habiroRing (CyclotomicField 4 ℚ) 4 := sorry

/-- test `odd_indicator_Z_half` (characterisation): GSWZ Example 5.7. -/
example :
    let e : Families (SIntegers ℚ 2) := fun m => if Odd (m : ℕ) then 1 else 0
    e ∈ habiroRing ℚ 2 ∧ e * e = e ∧ e ≠ 0 ∧ e ≠ 1 := sorry

example : ¬ IsDomain (habiroRing ℚ 2) := sorry

end Gluing

/-! ## HB.6/the-p-completed-ring -/

section PCompleted

variable (K : Type*) [Field K] [NumberField K] (Δ : ℕ)

/-- `H_{R^_p} = ∏_{(m,p)=1} R^_p[ζ_m][[x]]`. -/
abbrev PCompletedHabiroRing (p : ℕ) : Type _ :=
  ∀ m : {m : ℕ+ // Nat.Coprime m p}, PowerSeries (CompletedCoeff (SIntegers K Δ) p m)

/-- `f ↦ (f_m)_{(m,p)=1}`. -/
def toPCompleted (p : ℕ) : habiroRing K Δ →+* PCompletedHabiroRing K Δ p := sorry

theorem PCompletedHabiroRing.subsingleton_of_dvd {p : ℕ} (hp : p.Prime) (h : p ∣ Δ) :
    Subsingleton (PCompletedHabiroRing K Δ p) := sorry

/-- The Frobenius twist `f ↦ (φ_p^{v_p m} f_m)_m`. -/
def frobeniusTwist (p : ℕ) :
    Families (SIntegers K Δ) →+* ∀ m : ℕ+, PowerSeries (CompletedCoeff (SIntegers K Δ) p m) :=
  sorry

/-- The transition map `R^_p[ζ_m] → R^_p[ζ_{pm}]` on completions. -/
def completedTransition (p : ℕ) (hp : p.Prime) (m : ℕ+) :
    CompletedCoeff (SIntegers K Δ) p m →+* CompletedCoeff (SIntegers K Δ) p (p * m) := sorry

/-- Untwisted gluing over `R^_p` at `(p, m)`. -/
def UntwistedGluesAt {p : ℕ} (hp : p.Prime) (m : ℕ+)
    (g : ∀ m : ℕ+, PowerSeries (CompletedCoeff (SIntegers K Δ) p m)) : Prop :=
  rex p (CompletedCoeff.isAdicComplete K Δ p (p * m)) (rootDifference K Δ p m hp m.pos)
      (rootDifference_pow_mem K Δ hp m m.pos)
      (PowerSeries.map (completedTransition K Δ p hp m) (g m)) =
    g ⟨p * m, Nat.mul_pos hp.pos m.pos⟩

theorem mem_habiroRing_iff_twist (f : Families (SIntegers K Δ)) :
    f ∈ habiroRing K Δ ↔
      ∀ (p : ℕ) (hp : p.Prime), ¬ p ∣ Δ → ∀ m : ℕ+, UntwistedGluesAt K Δ hp m (frobeniusTwist K Δ p f) :=
  sorry

end PCompleted

/-! ## HB.6/decomposition-into-classes -/

section Decomposition

variable (K : Type*) [Field K] [NumberField K] (Δ : ℕ)

/-- The `Δ`-part `∏_{p ∣ Δ} p^{v_p m}`; the class of `m` under `∼_Δ`. -/
def deltaPart (Δ m : ℕ) : ℕ := ∏ p ∈ Δ.primeFactors, p ^ m.factorization p

/-- The idempotent of the class with `Δ`-part `d`. -/
def classIdempotent (d : ℕ) : habiroRing K Δ :=
  ⟨fun m => if deltaPart Δ m = d then 1 else 0, sorry⟩

theorem classIdempotent_mul_self (d : ℕ) :
    classIdempotent K Δ d * classIdempotent K Δ d = classIdempotent K Δ d := sorry

theorem classIdempotent_mul_of_ne {d d' : ℕ} (h : d ≠ d') :
    classIdempotent K Δ d * classIdempotent K Δ d' = 0 := sorry

theorem not_isDomain_of_one_lt (hΔ : 1 < Δ) : ¬ IsDomain (habiroRing K Δ) := sorry

theorem isDomain_primeTo (hΔpos : 0 < Δ) (hΔ : NumberField.discr K ∣ (Δ : ℤ)) :
    IsDomain (habiroRingPrimeTo K Δ Δ) := sorry

/-- test (non-example to GSWZ Remark 1.2): for `K = ℚ(i)`, `Δ = 4`, the factor of the
class of `4` has a non-trivial idempotent. -/
example : ∃ e ∈ habiroRing (CyclotomicField 4 ℚ) 4,
    e * e = e ∧ e * (classIdempotent (CyclotomicField 4 ℚ) 4 4 : Families _) = e ∧ e ≠ 0 ∧
      e ≠ (classIdempotent (CyclotomicField 4 ℚ) 4 4 : Families _) := sorry

end Decomposition

/-! ## HB.6/ring-operations-and-the-classical-comparison (`K = ℚ`) -/

section Classical

/-- `(q;q)_N = ∏_{i<N} (1 − q^{i+1})`. -/
def qPoch (A : Type*) [CommRing A] (N : ℕ) : A[X] :=
  ∏ i ∈ Finset.range N, (1 - X ^ (i + 1))

/-- Habiro's ring `A[q]^ℕ = lim_N A[q]/((q;q)_N)` (HC.1, via cofinality), as compatible families. -/
def classicalHabiro (A : Type*) [CommRing A] :
    Subring (∀ N : ℕ, A[X] ⧸ Ideal.span {qPoch A N}) where
  carrier := {x | ∀ N : ℕ,
    Ideal.Quotient.factor (show Ideal.span {qPoch A (N + 1)} ≤ Ideal.span {qPoch A N} from sorry)
      (x (N + 1)) = x N}
  mul_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- The Taylor family `F ↦ (σ_{ζ_m} F)_m`. -/
def taylorFamily (Δ : ℕ) :
    classicalHabiro (SIntegers ℚ Δ) →+* Families (SIntegers ℚ Δ) := sorry

theorem taylorFamily_injective (Δ : ℕ) : Function.Injective (taylorFamily Δ) := sorry

theorem range_taylorFamily (Δ : ℕ) : (taylorFamily Δ).range = habiroRing ℚ Δ := sorry

/-- The Kontsevich series `∑ (q;q)_n` as an element of `ℤ[q]^ℕ` (Δ = 1). -/
def kontsevich : classicalHabiro (SIntegers ℚ 1) := sorry

/-- test `kontsevich_rational` (computation). -/
example :
    (List.range 7).map (fun k => PowerSeries.coeff k (taylorFamily 1 kontsevich 1)) =
      [1, -1, 2, -5, 15, -53, 217].map (fun z : ℤ => (z : CoeffRing (SIntegers ℚ 1) 1)) := sorry

example : PowerSeries.constantCoeff (taylorFamily 1 kontsevich 3) =
    5 - zeta (SIntegers ℚ 1) ((3 : ℕ+) : ℕ) := sorry

example : PowerSeries.constantCoeff (taylorFamily 1 kontsevich 4) =
    8 - 3 * zeta (SIntegers ℚ 1) ((4 : ℕ+) : ℕ) := sorry

end Classical

/-! ## HB.6/abelian-fields -/

section Abelian

variable (K : Type*) [Field K] [NumberField K] (Δ : ℕ)

/-- `a ↦ (φ_m⁻¹ a)_m` (GSWZ footnote 1, corrected). -/
def abelianEmbedding [IsGalois ℚ K] (hab : ∀ σ τ : K ≃ₐ[ℚ] K, σ * τ = τ * σ)
    (hΔ : NumberField.discr K ∣ (Δ : ℤ)) : SIntegers K Δ →+* habiroRing K Δ := sorry

/-- The base-change isomorphism `H_{ℤ[1/Δ]} ⊗ R ≅ H_R` for abelian `K`. -/
def abelianBaseChange [IsGalois ℚ K] (hab : ∀ σ τ : K ≃ₐ[ℚ] K, σ * τ = τ * σ)
    (hΔ : NumberField.discr K ∣ (Δ : ℤ)) :
    TensorProduct ℤ (habiroRing ℚ Δ) (SIntegers K Δ) ≃+* habiroRing K Δ := sorry

end Abelian

end TauCeti.HabiroNF.HB67


namespace TauCeti.HabiroNF.HB67

open Polynomial

/-! ### HB.6 -/

/-- API `CoeffRing.transition_zeta_pow`: the transition sends `ζ_m` to `ζ_{pm}^{e(p,m)}`. -/
theorem CoeffRing.transition_zeta_pow (R : Type*) [CommRing R] (p m : ℕ) (hp : p.Prime) (hm : 0 < m) :
    transition R p m hp hm (zeta R m) = zeta R (p * m) ^ compatExp p m := sorry

-- changeOfSystem: not stated; needs the profinite units Ẑˣ acting on the compatible systems.

/-- Test `valuation_table` (computation): `(ζ₁₂ − ζ₄)² ∈ 3·ℤ[ζ₁₂]ˣ` and `(ζ₉ − ζ₃)⁶ ∈ 3·ℤ[ζ₉]ˣ`. -/
example :
    (∃ u : (CoeffRing ℤ (3 * 4))ˣ,
      (zeta ℤ (3 * 4) - transition ℤ 3 4 (by decide) (by decide) (zeta ℤ 4)) ^ 2 = (3 : CoeffRing ℤ (3 * 4)) * u) ∧
    ∃ u : (CoeffRing ℤ (3 * 3))ˣ,
      (zeta ℤ (3 * 3) - transition ℤ 3 3 (by decide) (by decide) (zeta ℤ 3)) ^ 6 = (3 : CoeffRing ℤ (3 * 3)) * u := sorry

/-- API `CoeffRing.map`: a ring map `R → R'` induces `R[ζ_m] → R'[ζ_m]`. -/
def CoeffRing.map {R R' : Type*} [CommRing R] [CommRing R'] (φ : R →+* R') (m : ℕ) :
    CoeffRing R m →+* CoeffRing R' m := sorry

/-- API `frobenius_comm_transition`. -/
theorem frobenius_comm_transition (K : Type*) [Field K] [NumberField K] (Δ p : ℕ) (hp : p.Prime) (hΔ : NumberField.discr K ∣ (Δ : ℤ)) (m : ℕ+) :
    (frobenius K Δ p (p * m)).comp (completedTransition K Δ p hp m) =
      (completedTransition K Δ p hp m).comp (frobenius K Δ p m) := sorry

/-- API `frobenius_rat`: for `K = ℚ` the Frobenius is the identity. -/
theorem frobenius_rat (Δ p n : ℕ) : frobenius ℚ Δ p n = RingHom.id _ := sorry

/-- Test `completedCoeff_zero_of_dvd` (degenerate): for `K = ℚ(i)`, `Δ = 4`, `R^_2[ζ_n] = 0`. -/
example (n : ℕ) : Subsingleton (CompletedCoeff (SIntegers (CyclotomicField 4 ℚ) 4) 2 n) := sorry

/-- Test `frobenius_gaussian` (computation): for `K = ℚ(i)`, `Δ = 4`, `φ₃(i) = −i` and `φ₅(i) = i`. -/
example (i : NumberField.RingOfIntegers (CyclotomicField 4 ℚ)) (hi : i ^ 2 = -1) :
    let ι : ∀ p : ℕ, CompletedCoeff (SIntegers (CyclotomicField 4 ℚ) 4) p 1 := fun p =>
      algebraMap (CoeffRing (SIntegers (CyclotomicField 4 ℚ) 4) 1) _
        (algebraMap (SIntegers (CyclotomicField 4 ℚ) 4) _
          (algebraMap (NumberField.RingOfIntegers (CyclotomicField 4 ℚ)) _ i))
    frobenius (CyclotomicField 4 ℚ) 4 3 1 (ι 3) = -ι 3 ∧
      frobenius (CyclotomicField 4 ℚ) 4 5 1 (ι 5) = ι 5 := sorry

/-- Test `cyclotomicFrobenius_zeta` (compatibility): for `K = ℚ`, `p = 2`, `m = 3`, the Frobenius
of `ℤ₂[ζ₃]` sends `ζ₃` to `ζ₃²`, while the Frobenius of Definition 1.1 fixes it. -/
example :
    cyclotomicFrobenius ℚ 1 2 3 (algebraMap _ _ (zeta (SIntegers ℚ 1) 3)) =
        algebraMap _ _ (zeta (SIntegers ℚ 1) 3) ^ 2 ∧
      frobenius ℚ 1 2 3 (algebraMap _ _ (zeta (SIntegers ℚ 1) 3)) =
        algebraMap _ _ (zeta (SIntegers ℚ 1) 3) :=
  ⟨cyclotomicFrobenius_zeta ℚ 1 Nat.prime_two (by decide), frobenius_zeta ℚ 1 2 3⟩

-- Families.galoisInvariant: not stated; needs the families at all roots of unity with the action of
--   Gal(ℚ^ab/ℚ).

/-- API `habiroRing.ext`. -/
theorem habiroRing.ext (K : Type*) [Field K] [NumberField K] (Δ : ℕ) {f g : habiroRing K Δ} :
    f = g ↔ ∀ m, f.1 m = g.1 m := sorry

-- Test traditional_roots_undefined: not stated; the algebraic encoding has no complex roots
--   ω_m = e^{2πi/m} (the corresponding non-example is `traditional_roots_not_close` above).

/-- Test `classical_case` (characterisation): for `K = ℚ`, `Δ = 1`, the Taylor maps identify
Habiro's ring with `H_ℤ`. -/
example : Function.Injective (taylorFamily 1) ∧ (taylorFamily 1).range = habiroRing ℚ 1 :=
  ⟨taylorFamily_injective 1, range_taylorFamily 1⟩

-- untwistedGlued_equiv: stated in its membership form `mem_habiroRing_iff_twist`; the ring
--   isomorphism needs the subring of untwisted-glued families over R^_p, not defined here.
-- mem_families_of_forall_padic: not stated; needs the families over K[ζ_m] (P_R) as a ring.

/-- Test `pCompleted_zero_of_dvd` (degenerate): `K = ℚ`, `Δ = 6`, `p = 3`: `H_{R^_3} = 0`. -/
example : Subsingleton (PCompletedHabiroRing ℚ 6 3) := sorry

-- Test kontsevich_two_adic: not stated; needs the identification R^_2 ≅ ℤ₂ for K = ℚ, Δ = 1, and
--   HabiroCyclotomicCompletions HC.3's re-expansion (the stand-in `rex` has no computation rules).

/-- Test `gaussian_split_prime` (computation): for `K = ℚ(i)`, `Δ = 4`, `R^_5 ≅ ℤ₅ × ℤ₅`. -/
example [Fact (Nat.Prime 5)] :
    Nonempty (CompletedCoeff (SIntegers (CyclotomicField 4 ℚ) 4) 5 1 ≃+* ℤ_[5] × ℤ_[5]) :=
  sorry

-- Test untwisted_map_fails: not stated; needs HB.6/abelian-fields' embedding evaluated on `i` and the
--   untwisted gluing at (3, 1).
-- HB.6/the-p-adic-classical-ring: the local second/third comparisons are
--   primeToPTaylorEquiv and untwistedFamilies_image in HB6 below. The first
--   global p-completion isomorphism of GSWZ (14) is not asserted by them.
-- HB.6/what-is-not-true-of-this-ring: stated by `not_isDomain_of_one_lt`, the class idempotents and
--   the non-examples above (the constant family `i`, and `¬ IsDomain (habiroRing ℚ 2)`).

end TauCeti.HabiroNF.HB67


local instance : Fact (Nat.Prime 11) := ⟨by decide⟩
namespace TauCeti.HabiroNF.HB6
open Polynomial
open scoped BigOperators Classical

namespace Suppliers

variable (R : Type*) [CommRing R]

/-- Imported HC.1 completion model in a cofinal sequence of quotient polynomials.
The concrete transition map always sends a polynomial class to that same class. -/
def quotientTransition (g h : R[X]) (hdiv : g ∣ h) : AdjoinRoot h →ₐ[R] AdjoinRoot g :=
  sorry

def compatibleQuotients (f : ℕ → R[X]) (hdiv : ∀ n, f n ∣ f (n + 1)) :
    Subalgebra R (∀ n : ℕ, AdjoinRoot (f n)) where
  carrier := {a | ∀ n, quotientTransition R (f n) (f (n + 1)) (hdiv n) (a (n + 1)) = a n}
  algebraMap_mem' := by sorry
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry

/-- HC.1 factorial cofinality: the quotient by 1 at n=0 is intentionally zero. -/
abbrev factorialPoly (n : ℕ) : R[X] := HB67.qPoch R n

theorem factorialPoly_dvd (n : ℕ) : factorialPoly R n ∣ factorialPoly R (n + 1) :=
  sorry

abbrev Naive := HB67.classicalHabiro R

/-- HC.1 coefficient algebra via compatible constant polynomial families. -/
instance naiveAlgebra : Algebra R (Naive R) := sorry

def fromPoly : R[X] →ₐ[R] Naive R := sorry

/-- The products below are cofinal in the WHOLE chain monoid: a fixed finite
product with exponents e_k divides chainPoly N when N≥k+e_k for every k. -/
def chainPoly (p : ℕ) (m : ℕ+) (n : ℕ) : R[X] :=
  ∏ k ∈ Finset.range n, cyclotomic (m * p ^ k) R ^ (n - k)

theorem chainPoly_dvd (p : ℕ) (m : ℕ+) (n : ℕ) :
    chainPoly R p m n ∣ chainPoly R p m (n + 1) := sorry

abbrev Chain (p : ℕ) (m : ℕ+) :=
  compatibleQuotients R (chainPoly R p m) (chainPoly_dvd R p m)

def chainFromPoly (p : ℕ) (m : ℕ+) : R[X] →ₐ[R] Chain R p m := sorry

/-- Imported full universal coefficient algebra, HB.6 and HC.4. -/
abbrev CycloCoeff (m : ℕ+) := HB67.CoeffRing R m

abbrev root (m : ℕ+) : CycloCoeff R m := HB67.zeta R m

def rootUnit (m : ℕ+) : (CycloCoeff R m)ˣ := sorry

theorem rootUnit_val (m : ℕ+) : (rootUnit R m : CycloCoeff R m) = root R m := sorry

abbrev TaylorProduct := ∀ m : ℕ+, PowerSeries (CycloCoeff R m)

def coeffMap {S : Type*} [CommRing S] (φ : R →+* S) (m : ℕ+) :
    CycloCoeff R m →+* CycloCoeff S m := sorry

def taylorProductMap {S : Type*} [CommRing S] (φ : R →+* S) :
    TaylorProduct R →+* TaylorProduct S := sorry

/-- HC.3/the-taylor-map, additive x=q-zeta_m. -/
def taylorAll : Naive R →+* TaylorProduct R := sorry

def polynomialTaylor (m : ℕ+) : R[X] →+* PowerSeries (CycloCoeff R m) :=
  Polynomial.eval₂RingHom ((PowerSeries.C).comp (algebraMap R (CycloCoeff R m)))
    (PowerSeries.C (root R m) + PowerSeries.X)

theorem taylorAll_fromPoly (g : R[X]) (m : ℕ+) :
    taylorAll R (fromPoly R g) m = polynomialTaylor R m g := sorry

variable (p : ℕ) [Fact (Nat.Prime p)]

/-- All-order coefficient inclusions from HB.6/compatible-roots-of-unity.
For m=p^k*m' with p∤m', e satisfies e≡p mod p^(k+1), e≡1 mod m'. -/
abbrev compatibleExponent (p : ℕ) (m : ℕ+) : ℕ := HB67.compatExp p m

def stepOrder (m : ℕ+) : ℕ+ := ⟨p * m, by
  exact Nat.mul_pos (Fact.out : Nat.Prime p).pos m.pos⟩

def coeffStep (m : ℕ+) : CycloCoeff R m →+* CycloCoeff R (stepOrder p m) :=
  HB67.transition R p m Fact.out m.pos

theorem coeffStep_root (m : ℕ+) :
    coeffStep R p m (root R m) = root R (stepOrder p m) ^ compatibleExponent p m := sorry

/-- HC.3 re-expansion signature; ordinary formal substitution is inappropriate. -/
def rex (B : Type*) [CommRing B] [IsAdicComplete (Ideal.span {(p : B)}) B]
    (c : B) (hc : ∃ n : ℕ, c ^ n ∈ Ideal.span {(p : B)}) :
    PowerSeries B →+* PowerSeries B := HB67.rex p inferInstance c hc

/-- HB.6/coefficient-rings-and-frobenius; finite monic quotients of Z_p are
p-complete. This is an imported coefficient-ring instance, not a new packet node. -/
instance cycloComplete (m : ℕ+) :
    IsAdicComplete (Ideal.span {(p : CycloCoeff ℤ_[p] m)}) (CycloCoeff ℤ_[p] m) := sorry

def shift (m : ℕ+) : CycloCoeff ℤ_[p] (stepOrder p m) :=
  root ℤ_[p] (stepOrder p m) - coeffStep ℤ_[p] p m (root ℤ_[p] m)

theorem shift_nilpotent_mod_p (m : ℕ+) :
    ∃ n : ℕ, (shift p m) ^ n ∈ Ideal.span {(p : CycloCoeff ℤ_[p] (stepOrder p m))} := sorry

def stepTaylor (m : ℕ+) :
    PowerSeries (CycloCoeff ℤ_[p] m) →+* PowerSeries (CycloCoeff ℤ_[p] (stepOrder p m)) :=
  (rex p _ (shift p m) (shift_nilpotent_mod_p p m)).comp
    (PowerSeries.map (coeffStep ℤ_[p] p m))

/-- The local version of the parent gluing definition, with actual equations. -/
def PGlued : Subring (TaylorProduct ℤ_[p]) where
  carrier := {f | ∀ m, stepTaylor p m (f m) = f (stepOrder p m)}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

abbrev PrimeToP := {m : ℕ+ // ¬p ∣ (m : ℕ)}
abbrev LocalProduct := ∀ m : PrimeToP p, PowerSeries (CycloCoeff ℤ_[p] m.val)

def mixedIdeal (m : ℕ+) : Ideal ℤ_[p][X] :=
  Ideal.span {C (p : ℤ_[p]), cyclotomic m ℤ_[p]}

abbrev Mixed (m : ℕ+) := AdicCompletion (mixedIdeal p m) ℤ_[p][X]

/-- Concrete coordinate change, reusing Mathlib rescaling. -/
def coordinateChange : TaylorProduct R ≃+* TaylorProduct R where
  toFun f m := PowerSeries.rescale (-(rootUnit R m : CycloCoeff R m)) (f m)
  invFun f m := PowerSeries.rescale (-(((rootUnit R m)⁻¹ : (CycloCoeff R m)ˣ) : CycloCoeff R m)) (f m)
  left_inv := by sorry
  right_inv := by sorry
  map_add' := by sorry
  map_mul' := by sorry

/-- HC.4/multiplicative-taylor-comparison is defined by this rescaling of HC.3,
in coordinates q=zeta_m(1-u). No separate Taylor construction is assumed. -/
def multiplicativeTaylor : Naive R →+* TaylorProduct R :=
  (coordinateChange R).toRingHom.comp (taylorAll R)

abbrev RationalRing (Δ : ℕ) := Localization.Away (Δ : ℤ)

/-- Parent rational coefficient-completion map, defined only when p∤Δ. -/
def toPadic (Δ : ℕ) (hpΔ : ¬p ∣ Δ) : RationalRing Δ →+* ℤ_[p] := sorry

/-- Parent HB.6/the-gluing-condition at K=Q; Frobenius is the identity. -/
def rationalGlued (Δ : ℕ) : Subring (TaylorProduct (RationalRing Δ)) where
  carrier := {f | ∀ (ℓ : ℕ) (hℓ : Nat.Prime ℓ) (hℓΔ : ¬ℓ ∣ Δ),
    letI : Fact (Nat.Prime ℓ) := ⟨hℓ⟩
    taylorProductMap (RationalRing Δ) (toPadic ℓ Δ hℓΔ) f ∈ PGlued ℓ}
  zero_mem' := by sorry
  one_mem' := by sorry
  add_mem' := by sorry
  mul_mem' := by sorry
  neg_mem' := by sorry

end Suppliers
open Suppliers

variable (p : ℕ) [Fact (Nat.Prime p)]

/-- HB.6/p-chain-mixed-adic-comparison: the finite monic quotient / double-limit
argument is essential, since the raw ideals over Z_p are not cofinal. -/
def chainMixedEquiv (m : PrimeToP p) : Chain ℤ_[p] p m.val ≃+* Mixed p m.val := sorry

theorem chainMixedEquiv_polynomial (m : PrimeToP p) (g : ℤ_[p][X]) :
    chainMixedEquiv p m (chainFromPoly ℤ_[p] p m.val g) =
      algebraMap ℤ_[p][X] (Mixed p m.val) g := sorry

/-- HB.6/prime-to-p-taylor-equivalence. -/
def primeToPTaylorEquiv : Naive ℤ_[p] ≃+* LocalProduct p := sorry

theorem primeToPTaylorEquiv_component (F : Naive ℤ_[p]) (m : PrimeToP p) :
    primeToPTaylorEquiv p F m = taylorAll ℤ_[p] F m.val := sorry

theorem primeToPTaylorEquiv_polynomial (g : ℤ_[p][X]) (m : PrimeToP p) :
    primeToPTaylorEquiv p (fromPoly ℤ_[p] g) m = polynomialTaylor ℤ_[p] m.val g := sorry

theorem primeToPTaylorEquiv_constant (a : ℤ_[p]) (m : PrimeToP p) :
    primeToPTaylorEquiv p (fromPoly ℤ_[p] (C a)) m =
      PowerSeries.C (algebraMap ℤ_[p] (CycloCoeff ℤ_[p] m.val) a) := sorry

theorem primeToPTaylorEquiv_X (m : PrimeToP p) :
    primeToPTaylorEquiv p (fromPoly ℤ_[p] X) m =
      PowerSeries.C (root ℤ_[p] m.val) + PowerSeries.X := sorry

theorem primeToPTaylorEquiv_symm_component (g : LocalProduct p) (m : PrimeToP p) :
    taylorAll ℤ_[p] ((primeToPTaylorEquiv p).symm g) m.val = g m := sorry

theorem primeToPTaylorEquiv_ext (F G : Naive ℤ_[p])
    (h : ∀ m : PrimeToP p, taylorAll ℤ_[p] F m.val = taylorAll ℤ_[p] G m.val) :
    F = G := sorry

theorem primeToPTaylorEquiv_idempotent (T : Set (PrimeToP p)) :
    let F := (primeToPTaylorEquiv p).symm (fun m => if m ∈ T then 1 else 0)
    F * F = F ∧ ∀ m : PrimeToP p, taylorAll ℤ_[p] F m.val = if m ∈ T then 1 else 0 := sorry

/-- Test primeToP_zero. -/
example : primeToPTaylorEquiv 2 0 = 0 := sorry

/-- Test primeToP_square_at_one. -/
example (m : PrimeToP 2) (hm : m.val = 1) :
    let f := primeToPTaylorEquiv 2 (fromPoly ℤ_[2] (X ^ 2)) m
    PowerSeries.coeff 0 f = 1 ∧ PowerSeries.coeff 1 f = 2 ∧
      PowerSeries.coeff 2 f = 1 ∧ PowerSeries.coeff 3 f = 0 := sorry

/-- Test primeToP_full_cyclotomic_algebra. In particular, the component at order
5 has four residue factors, even though one chosen primitive root lies in Z_11. -/
example : Nonempty (Module.Basis (Fin 4) ℤ_[11] (CycloCoeff ℤ_[11] 5)) ∧
    Nonempty (CycloCoeff (ZMod 11) 5 ≃+* (Fin 4 → ZMod 11)) := sorry

/-- Test primeToP_independent_orders. -/
example : ∃ F : Naive ℤ_[2], F * F = F ∧
    ∀ m : PrimeToP 2, taylorAll ℤ_[2] F m.val = if m.val = 1 then 1 else 0 := sorry

/-- HB.6/untwisted-families-are-classical-taylor-families. -/
theorem untwistedFamilies_image :
    Function.Injective (taylorAll ℤ_[p]) ∧
      Set.range (taylorAll ℤ_[p]) = (PGlued p : Set (TaylorProduct ℤ_[p])) := sorry

theorem untwistedFamilies_reconstruct (f : PGlued p) :
    taylorAll ℤ_[p] ((primeToPTaylorEquiv p).symm (fun m => f.val m.val)) = f.val := sorry

/-- Acceptance: the local gluing equation does not allow arbitrary ramified
components once the prime-to-p restriction is fixed. -/
example : (fun m : ℕ+ => if m = 1 then (1 : PowerSeries (CycloCoeff ℤ_[2] m)) else 0)
    ∉ PGlued 2 := sorry

/-- Acceptance: ordinary ideal cofinality fails, even at the constant 2. -/
example (n : ℕ) (hn : 0 < n) : ¬chainPoly ℤ_[2] 2 1 n ∣ C (2 : ℤ_[2]) := sorry

/-- Acceptance: modulo (4,Phi_2), Phi_1^2 vanishes. The exponent a*E,
rather than E alone, is needed when reducing modulo p^a. -/
example : (X - 1 : ℤ_[2][X]) ^ 2 ∈
    Ideal.span {C (4 : ℤ_[2]), cyclotomic 2 ℤ_[2]} := sorry

section Coordinates
variable (R : Type*) [CommRing R]

/-- HB.6/additive-and-multiplicative-taylor-coordinates. These are simultaneous
properties of the existing rescale map, rather than a new substitution API. -/
theorem additiveToMultiplicative_coeff (f : TaylorProduct R) (m : ℕ+) (l : ℕ)
    (hl : 0 < l) :
    PowerSeries.coeff (l - 1) (coordinateChange R f m) =
      (-root R m) ^ (l - 1) * PowerSeries.coeff (l - 1) (f m) := sorry

theorem additiveToMultiplicative_taylor (F : Naive R) :
    coordinateChange R (taylorAll R F) = multiplicativeTaylor R F := sorry

theorem additiveToMultiplicative_natural {S : Type*} [CommRing S] (φ : R →+* S)
    (f : TaylorProduct R) :
    coordinateChange S (taylorProductMap R φ f) =
      taylorProductMap R φ (coordinateChange R f) := sorry

theorem additiveToMultiplicative_precision (f : TaylorProduct R) (N : ℕ) :
    (∀ (m : ℕ+) (k : ℕ), (m : ℕ) * (k + 1) < N → PowerSeries.coeff k (f m) = 0) ↔
    (∀ (m : ℕ+) (k : ℕ), (m : ℕ) * (k + 1) < N →
      PowerSeries.coeff k (coordinateChange R f m) = 0) := sorry

/-- Acceptance: order 1 changes 1+x into 1-u, including its constant term. -/
example : PowerSeries.rescale (-1 : R) (1 + PowerSeries.X) = 1 - PowerSeries.X := sorry

/-- Acceptance: order 2 has zeta_2=-1, so additive x becomes multiplicative u. -/
example : coordinateChange R (fun m => if m = 2 then PowerSeries.X else 0) 2 =
    (PowerSeries.X : PowerSeries (CycloCoeff R 2)) := sorry

/-- Acceptance: N=4 retains order-one coefficients 0,1,2 and discards 3.
The full tuple is zero at every other order. -/
example : ∀ (m : ℕ+) (k : ℕ), (m : ℕ) * (k + 1) < 4 →
    PowerSeries.coeff k
      ((fun n : ℕ+ => if n = 1 then
        (PowerSeries.X ^ 3 : PowerSeries (CycloCoeff R n)) else 0) m) = 0 := sorry
end Coordinates

/-- HB.6/rational-gluing-image-criterion. Actual range and gluing predicates,
not a theorem field in a comparison record. -/
theorem rationalGluing_image (Δ : ℕ) (hΔ : 0 < Δ) :
    Function.Injective (taylorAll (RationalRing Δ)) ∧
      Set.range (taylorAll (RationalRing Δ)) =
        (rationalGlued Δ : Set (TaylorProduct (RationalRing Δ))) := sorry

/-- Acceptance: the parity idempotent exists over Z[1/2]. -/
example : ∃ F : Naive (RationalRing 2), F * F = F ∧
    ∀ m : ℕ+, taylorAll (RationalRing 2) F m = if Odd (m : ℕ) then 1 else 0 := sorry

/-- Acceptance: that same family fails the order-1/order-2 gluing over Z. -/
example : (fun m : ℕ+ => if Odd (m : ℕ) then
    (1 : PowerSeries (CycloCoeff (RationalRing 1) m)) else 0) ∉ rationalGlued 1 := sorry

end TauCeti.HabiroNF.HB6


namespace TauCeti.HabiroNF.HB67
open Polynomial

/-! ## HB.7 -/

section Modules

variable (K : Type*) [Field K] [NumberField K] (Δ : ℕ)

/-- What HB.7 takes from HB.2 and D.4 for a class `ξ ∈ K₃(K)`. -/
structure ClassData where
  /-- representatives of `ε_m(ξ)` (HB.2), units at the relevant places -/
  eps : ∀ m : ℕ+, (CoeffRing K m)ˣ
  /-- `D_p(ξ) ∈ K ⊗ ℚ_p` (D.4) -/
  reg : ∀ (p : ℕ) [Fact p.Prime], TensorProduct ℚ K ℚ_[p]

/-- The data of the zero class. -/
def ClassData.zero : ClassData K := ⟨fun _ => 1, fun _ _ => 0⟩

/-- `K[ζ_m][T]/(T^m − ε_m)`, containing `ε_m^{1/m} = T`. -/
abbrev KummerAlg (D : ClassData K) (m : ℕ+) : Type _ :=
  AdjoinRoot (X ^ (m : ℕ) - C ((D.eps m : CoeffRing K m)))

/-- The ambient `∏_m ε_m^{1/m} K[ζ_m][[x]]`, as families over the Kummer algebras. -/
abbrev ModuleFamilies (D : ClassData K) : Type _ := ∀ m : ℕ+, PowerSeries (KummerAlg K D m)

/-- `f_m ∈ ε_m^{1/m} K[ζ_m][[x]]`. -/
def HasRootShape (D : ClassData K) (f : ModuleFamilies K D) : Prop :=
  ∀ m : ℕ+, ∃ g : PowerSeries (CoeffRing K m),
    f m = PowerSeries.C (AdjoinRoot.root _) * PowerSeries.map (algebraMap _ _) g

/-- The logarithmic Frobenius defect of GSWZ (21), with the formal completion (22). -/
def logFrobeniusDefect (D : ClassData K) (p : ℕ) [Fact p.Prime] (f : ModuleFamilies K D)
    (m : {m : ℕ+ // Nat.Coprime m p}) :
    LaurentSeries (CoeffRing (TensorProduct ℚ K ℚ_[p]) m) := sorry

/-- `R^_p[ζ_m] → K_p[ζ_m]` (data; `K_p = R^_p[1/p]` for `p ∤ Δ`). -/
def completedToLocal (p : ℕ) [Fact p.Prime] (m : ℕ) :
    CompletedCoeff (SIntegers K Δ) p m →+* CoeffRing (TensorProduct ℚ K ℚ_[p]) m := sorry

/-- `(p/x)·R^_p[ζ_m][[x]]` inside the Laurent series over `K_p[ζ_m]`. -/
def pOverX (p : ℕ) [Fact p.Prime] (m : ℕ) :
    Set (LaurentSeries (CoeffRing (TensorProduct ℚ K ℚ_[p]) m)) :=
  {g | ∃ h : PowerSeries (CompletedCoeff (SIntegers K Δ) p m),
    g = (p : LaurentSeries _) * HahnSeries.single (-1 : ℤ) 1 *
      HahnSeries.ofPowerSeries ℤ _ (PowerSeries.map (completedToLocal K Δ p m) h)}

/-- `K[ζ_m] → K_p[ζ_m]`. -/
def localize (p : ℕ) [Fact p.Prime] (m : ℕ) :
    CoeffRing K m →+* CoeffRing (TensorProduct ℚ K ℚ_[p]) m := sorry

/-- The `p`-adic Kummer algebra `K_p[ζ_m][T]/(T^m − ε_m)`. -/
abbrev LocalKummerAlg (D : ClassData K) (p : ℕ) [Fact p.Prime] (m : ℕ+) : Type _ :=
  AdjoinRoot (X ^ (m : ℕ) - C (localize K p m (D.eps m : CoeffRing K m)))

/-- `K[ζ_m, ε_m^{1/m}] → K_p[ζ_m, ε_m^{1/m}]`, `T ↦ T`. -/
def toLocalKummer (D : ClassData K) (p : ℕ) [Fact p.Prime] (m : ℕ+) :
    KummerAlg K D m →+* LocalKummerAlg K D p m := sorry

/-- The corrected shape `ε_m^{1/m}(R^_p[ζ_m]ˣ + x R^_p[ζ_m] + x² K_p[ζ_m][[x]])` (GSWZ (195)). -/
def HasSectionShape (D : ClassData K) (p : ℕ) [Fact p.Prime] (f : ModuleFamilies K D) : Prop :=
  ∀ m : ℕ+, Nat.Coprime m p →
    ∃ (u : (CompletedCoeff (SIntegers K Δ) p m)ˣ) (v : CompletedCoeff (SIntegers K Δ) p m)
      (g : PowerSeries (CoeffRing (TensorProduct ℚ K ℚ_[p]) m)),
      PowerSeries.map (toLocalKummer K D p m) (f m) =
        PowerSeries.C (AdjoinRoot.root _) *
          PowerSeries.map (algebraMap _ (LocalKummerAlg K D p m))
            (PowerSeries.C (completedToLocal K Δ p m u) +
              PowerSeries.X * PowerSeries.C (completedToLocal K Δ p m v) + PowerSeries.X ^ 2 * g)

/-- Invertible `L_p(ξ)`-sections (GSWZ Definition 1.3, corrected shape). -/
def IsInvertibleSection (D : ClassData K) (p : ℕ) [Fact p.Prime] (f : ModuleFamilies K D) :
    Prop :=
  HasSectionShape K Δ D p f ∧ ∀ m : {m : ℕ+ // Nat.Coprime m p}, logFrobeniusDefect K D p f m ∈ pOverX K Δ p m

/-- test `one_is_section` (degenerate). -/
example (p : ℕ) [Fact p.Prime] : IsInvertibleSection K Δ (ClassData.zero K) p 1 := sorry

/-- test `q_power_excluded` (non-example): `(1 + x/ζ_m)^{1/5}` has defect `0` but is not a
section (its linear coefficient is not `5`-integral). -/
example [Fact (Nat.Prime 5)] (f : ModuleFamilies ℚ (ClassData.zero ℚ))
    (hf : ∀ m, logFrobeniusDefect ℚ (ClassData.zero ℚ) 5 f m = 0)
    (h1 : PowerSeries.coeff 1 (f 1) = algebraMap ℚ (KummerAlg ℚ (ClassData.zero ℚ) 1) (1 / 5)) :
    ¬ IsInvertibleSection ℚ 1 (ClassData.zero ℚ) 5 f := sorry

/-- The local module `H_{R^_p,ξ}`: finite `H_{R^_p}`-combinations of invertible sections
(orders prime to `p`). -/
def IsInLocalModule (D : ClassData K) (p : ℕ) [Fact p.Prime] (f : ModuleFamilies K D) : Prop :=
  ∃ (n : ℕ) (a : Fin n → PCompletedHabiroRing K Δ p) (s : Fin n → ModuleFamilies K D),
    (∀ i, IsInvertibleSection K Δ D p (s i)) ∧
    ∀ m : {m : ℕ+ // Nat.Coprime m p},
      PowerSeries.map (toLocalKummer K D p m) (f m) =
        ∑ i, PowerSeries.map ((algebraMap _ (LocalKummerAlg K D p m)).comp
            (completedToLocal K Δ p m)) (a i m) *
          PowerSeries.map (toLocalKummer K D p m) (s i m)

/-- `f(q^γ)^γ · f(q^{−1})` on orders prime to `γ`, with the Kummer factors cancelled by the
`χ⁻¹`-equivariance datum of HB.2 (data). -/
def gluingProduct (D : ClassData K) (γ : ℕ+) (f : ModuleFamilies K D) : FamiliesPrimeTo K γ :=
  sorry

/-- `O_K[1/(Δγ)] → K` on families. -/
def familiesToField (γ : ℕ) : FamiliesPrimeTo (SIntegers K (Δ * γ)) γ →+* FamiliesPrimeTo K γ :=
  sorry

/-- The global module `H_{R,ξ}` as a set (Definition 1.4, with `p ∤ Δ`, the product in (24)
and the localisation `R[1/γ] = O_K[1/(Δγ)]`); closure under addition is part of Theorem 2 (gap). -/
def habiroModuleSet (D : ClassData K) : Set (ModuleFamilies K D) :=
  {f | HasRootShape K D f ∧
    (∀ (p : ℕ) [Fact p.Prime], ¬ p ∣ Δ → IsInLocalModule K Δ D p f) ∧
    ∀ γ : ℕ+, gluingProduct K D γ f ∈ (habiroRingPrimeTo K (Δ * γ) γ).map (familiesToField K Δ γ)}

/-- The ring as module families of the zero class. -/
def toKummer (D : ClassData K) (m : ℕ+) : CoeffRing (SIntegers K Δ) m →+* KummerAlg K D m :=
  sorry

/-- test `zero_class` (degenerate), Theorem 2 (1): `H_{R,0} = H_R`. -/
theorem habiroModuleSet_zero :
    habiroModuleSet K Δ (ClassData.zero K) =
      Set.range (fun f : habiroRing K Δ =>
        (fun m => PowerSeries.map (toKummer K Δ (ClassData.zero K) m) (f.1 m) :
          ModuleFamilies K (ClassData.zero K))) := sorry

-- mul_mem_habiroModuleSet: not stated. Needs the actual HB.2 Kummer-line
-- multiplication into the line of xi+eta, with its regulator and Frobenius
-- compatibility. Arbitrary homomorphisms between the ambient Kummer algebras
-- do not supply this. The exact target is HB.7/the-ring-case-and-tensor-products;
-- the tensor bijectivity statement uses followup-effective-global-descent.

/-! ### operations (Proposition 1.5) -/

/-- `γ*` on ring families: `(γ*f)(q) = f(q^γ)`; at `ζ_m` a substitution of the series
`(ζ_m + x)^γ − ζ_m^γ`, whose constant coefficient is `0`, so `PowerSeries.subst` applies. -/
def gammaStar (R : Type*) [CommRing R] (γ : ℤ) (hγ : γ ≠ 0) : Families R →+* Families R := sorry

theorem gammaStar_mul (R : Type*) [CommRing R] {γ γ' : ℤ} (hγ : γ ≠ 0) (hγ' : γ' ≠ 0) :
    gammaStar R (γ * γ') (mul_ne_zero hγ hγ') = (gammaStar R γ hγ).comp (gammaStar R γ' hγ') :=
  sorry

/-- test `tau_involution` (characterisation). -/
example (R : Type*) [CommRing R] (f : Families R) :
    gammaStar R (-1) (by norm_num) (gammaStar R (-1) (by norm_num) f) = f := sorry

/-- Proposition 1.5 (f): for `(m, Δ) = 1`, `f_m(0) ∈ R[ζ_m, ε_m^{1/m}]`. -/
theorem constantCoeff_mem (D : ClassData K) {f : ModuleFamilies K D} (hf : f ∈ habiroModuleSet K Δ D)
    (m : ℕ+) (hm : Nat.Coprime m Δ) :
    PowerSeries.constantCoeff (f m) ∈
      Subring.closure (Set.range (toKummer K Δ D m) ∪ {AdjoinRoot.root _}) := sorry

/-- `1 − q` in Habiro's ring. -/
def oneSubQ : classicalHabiro (SIntegers ℚ 1) :=
  ⟨fun N => Ideal.Quotient.mk _ (1 - X), sorry⟩

/-- test (non-example for 'multiplication maps are isomorphisms'): multiplication by `1 − q`
on `H_ℤ` is not surjective, since `1` is not in its image (`1 − q` vanishes at `q = 1`). -/
example : ¬ ∃ g : habiroRing ℚ 1,
    (taylorFamily 1 oneSubQ : Families (SIntegers ℚ 1)) * g.1 = 1 := sorry

end Modules

end TauCeti.HabiroNF.HB67


namespace TauCeti.HabiroNF.HB67
open Polynomial

/-! ### HB.7 -/

-- HB.7/invertible-local-sections: `IsInvertibleSection` (with the corrected shape `HasSectionShape`
--   and the defect `logFrobeniusDefect`).
-- formalCompletion: built into `logFrobeniusDefect`; as a separate map it needs D_p(ξ)
--   (PadicHodgeRegulators D.4).
-- localModule: stated as the predicate `IsInLocalModule`; as an H_{R^_p}-submodule it needs closure
--   under addition, which follows from the definition as a span.
-- IsInvertibleSection.mul: not stated; needs the sum of two `ClassData` (ε multiplicative, D_p additive).

/-- API `IsInvertibleSection.one`: `1` is an invertible `L_p(0)`-section. -/
theorem IsInvertibleSection.one (K : Type*) [Field K] [NumberField K] (Δ p : ℕ) [Fact p.Prime] :
    IsInvertibleSection K Δ (ClassData.zero K) p 1 := sorry

-- independent_of_choices: not stated; needs the change of p-unit representative of ε_m(ξ) in `ClassData`.
-- Test pole_allowed: not stated; needs D_p(ξ) ≠ 0 (PadicHodgeRegulators D.4).
-- Test shape_without_frobenius: not stated; needs the logarithm of `1 + x/5` in ℚ₅[[x]] (the defect is
--   `(8/5)x² + O(x³)`), which is not computed here.
-- Test mul_section: not stated; needs IsInvertibleSection.mul.
-- HB.7/dworks-lemma: not stated; needs the p-adic logarithm on 1 + x K_p[ζ][[x]].
-- HB.7/pochhammer-dwork-difference: not stated; needs the infinite Pochhammer symbol over K_p.
-- HB.7/pochhammer-sections: not stated; needs pochhammerSection.
-- pochhammerSection: not stated; needs the infinite Pochhammer symbol (q^{1/2}ζ; q)_∞ over K_p and the
--   p-adic dilogarithm (PadicHodgeRegulators D.4).
-- pochhammerSection.isInvertibleSection: not stated; needs pochhammerSection (GSWZ Theorem 10).
-- pochhammerSectionOf: not stated; needs pochhammerSection.
-- pochhammerSectionOf_independent: not stated; needs pochhammerSectionOf.
-- Test empty_presentation: not stated; needs pochhammerSectionOf.
-- Test two_presentations: not stated; needs pochhammerSectionOf.
-- Test shape_of_psi: not stated; needs pochhammerSection.
-- Test small_primes_excluded: not stated; needs pochhammerSection.
-- HB.7/local-freeness: not stated; needs pochhammerSection (GSWZ Theorem 1).
-- HB.7/extension-to-all-roots: not stated; needs Dwork's lemma above.
-- HB.7/the-global-module: `habiroModuleSet`.
-- HabiroModule: stated as the set `habiroModuleSet`; the H_R-submodule structure needs closure under
--   addition, which is part of the gap of Theorem 2.
-- HabiroModule.mem_iff: the defining conditions of `habiroModuleSet`.
-- HabiroModule.expandAt: not stated; needs the χ⁻¹-equivariance datum of HB.2 in `ClassData`.
-- HabiroModule.gluing_independent_of_roots: not stated; needs HabiroModule.expandAt.
-- HabiroModule.restrict: not stated; needs the module families on orders prime to γ.
-- HabiroModule.toLocal: not stated; the local condition is `IsInLocalModule` (a predicate).
-- Test product_not_ratio: not stated; needs `gluingProduct` computed on `1 − q`.

/-- Test `small_primes` (characterisation): no `γ` prime to `2` (resp. `3`) has `γ² − 1` prime to
`2` (resp. `3`), while for `p ≥ 5`, `γ = 2` works. -/
example : (∀ γ : ℕ, Nat.Coprime γ 2 → ¬ Nat.Coprime (γ ^ 2 - 1) 2) ∧
    (∀ γ : ℕ, Nat.Coprime γ 3 → ¬ Nat.Coprime (γ ^ 2 - 1) 3) ∧
    ∀ p : ℕ, p.Prime → 5 ≤ p → Nat.Coprime 2 p ∧ Nat.Coprime (2 ^ 2 - 1) p := sorry

-- Test local_span_not_sections: not stated; needs `habiroModuleSet` closed under p• and containing 0
--   (part of the gap of Theorem 2).
-- HB.7/the-ring-case-and-tensor-products: `habiroModuleSet_zero`; actual root-line multiplication
--   is the omitted `mul_mem_habiroModuleSet` above. Tensor/Picard targets are in HB7 below.
-- HB.7/operations-on-the-modules: `gammaStar`, `gammaStar_mul` and `tau` below.

/-- API `tau`: the involution `τ = (−1)*`, `f(q) ↦ f(q⁻¹)`. -/
def tau (R : Type*) [CommRing R] : Families R →+* Families R := gammaStar R (-1) (by decide)

-- tau_mem: not stated; needs τ on the module families (`ModuleFamilies`).
-- gammaStar_pow_mem: not stated; needs `habiroModuleSet` over `R[1/γ]` on orders prime to γ.
-- gammaStar_habiroRing: not stated; needs the restriction of `gammaStar` to `habiroRing` with its target
--   `habiroRingPrimeTo` over `R[1/γ]`.

/-- Test `gammaStar_polynomial` (computation): for `K = ℚ`, `2*(1 − q) = 1 − q²`, whose component at
`m = 1` is `−2x − x²`. -/
example : gammaStar (SIntegers ℚ 1) 2 (by decide) (taylorFamily 1 oneSubQ) 1 =
    -2 * PowerSeries.X - PowerSeries.X ^ 2 := sorry

-- Test tau_ring_case: not stated; needs the component of τ(Σ(q;q)_n) at m = 1 as f_1(−x/(1 + x)).
-- Test xi_over_gamma_not_defined: not stated; it records that no membership of γ*f itself is claimed.
-- HB.7/involution-pairing: not stated; needs tau_mem.
-- HB.7/vanishing-propagates: not stated; needs HB.7/extension-to-all-roots.
-- HB.7/constant-terms: `constantCoeff_mem`.
-- HB.7/what-the-local-picture-does-not-give: the non-example for multiplication by `1 − q` above.

end TauCeti.HabiroNF.HB67


open scoped TensorProduct

namespace TauCeti.HabiroNF.HB7

section Coefficient

variable {L L' : Type*} [Field L] [CharZero L] [Field L'] [CharZero L']

/-- The first jet after removing the Kummer constant. Analytic use excludes z=1. -/
def halfShiftLinearCoeff (z r : L) : L := -z / (24 * r * (1 - z))

lemma halfShiftLinearCoeff_map (ι : L →+* L') (z r : L) :
    ι (halfShiftLinearCoeff z r) = halfShiftLinearCoeff (ι z) (ι r) := by
  sorry

lemma halfShiftLinearCoeff_scale (z r a : L) (ha : a ≠ 0) :
    halfShiftLinearCoeff z (a * r) = halfShiftLinearCoeff z r / a := by
  sorry

lemma halfShiftLinearCoeff_neg_one (r : L) :
    halfShiftLinearCoeff (-1) r = 1 / (48 * r) := by
  sorry

/-- Test halfShiftLinearCoeff_minus_one: the half-shift gives a positive coefficient. -/
example : halfShiftLinearCoeff (-1 : ℚ) 1 = 1 / 48 := by
  sorry

/-- Test halfShiftLinearCoeff_two: an algebraic test of the rational function's sign. -/
example : halfShiftLinearCoeff (2 : ℚ) 1 = 1 / 12 := by
  sorry

/-- Test halfShiftLinearCoeff_level: x/r contributes the inverse root coordinate. -/
example : halfShiftLinearCoeff (-1 : ℚ) 2 = 1 / 96 := by
  sorry

/-- Test halfShiftLinearCoeff_even_root: at r=zeta_2=-1 the x/r sign reverses. -/
example : halfShiftLinearCoeff (-1 : ℚ) (-1) = -1 / 48 := by
  sorry

/-- This does not extend the analytic formula to z=1. -/
example : ¬ IsUnit (1 - (1 : ℚ)) := by
  sorry

end Coefficient

section FormalJets

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- Algebraic step in followup-half-shift-first-jet:
exp of a zero-constant formal series has its same linear coefficient. -/
theorem coeff_one_formal_exp (g : PowerSeries A)
    (hg : PowerSeries.constantCoeff g = 0) :
    PowerSeries.coeff 1 ((PowerSeries.exp A).subst g) =
      PowerSeries.coeff 1 g := by
  sorry

/-- The constant term is one, independently of higher coefficients. -/
theorem constantCoeff_formal_exp (g : PowerSeries A)
    (hg : PowerSeries.constantCoeff g = 0) :
    PowerSeries.constantCoeff ((PowerSeries.exp A).subst g) = 1 := by
  sorry

/-- Integral-linear-jet's weighted-product step.
All exponents are scalars in the rational coefficient algebra; in the
application they are images of integral p-adic scalars. -/
theorem coeff_one_weighted_product {ι : Type*} [Fintype ι]
    (g : ι → PowerSeries A) (a : ι → A)
    (hg : ∀ i, PowerSeries.constantCoeff (g i) = 0) :
    PowerSeries.coeff 1 (∏ i, (PowerSeries.exp A).subst (a i • g i)) =
      ∑ i, a i * PowerSeries.coeff 1 (g i) := by
  sorry

-- halfShiftFirstJet: not stated as an actual analytic theorem.
-- Needs imported regularized Pochhammer logarithm from the accepted
-- HB.7/pochhammer-sections and D.1. Exact target: with
-- h=log(1+x/zeta_m), the formal sqrt(q^m) is exp(m*h/2),
-- with constant 1, zeta != 1, p>3 unramified,
-- the normalized U has constant 1 and coeff 1 = halfShiftLinearCoeff zeta zeta_m.
-- Its formal log is sum_{k>=2} B_k(1/2)/k! * m^(k-2) * Li_{2-k}(zeta)*h^(k-1).
-- The Bernoulli computation and regularization are specified in the reader.
-- At even m this half power need not be the ordinary monomial q^(m/2).
-- For m=2, zeta_m=-1, zeta=-1, the branch-one coefficient is -1/48;
-- the monomial q instead gives Pochhammer input 1 at the expansion point.

-- integralLinearJet: not stated. Needs the D.3 valid finite presentation,
-- the integer subrings of all local factors, and actual normalized U above.
-- Exact target: coefficient -sum a_zeta*zeta/(24*zeta_m*(1-zeta)) belongs
-- to O[zeta_m], p>3 unramified, m prime to p, zeta nontrivial prime-to-p.
-- No p=2/3 or zeta=1 extension; higher coefficients may be rational.

end FormalJets

section PicardCharacterForms

variable {H G : Type u} [CommRing H] [AddCommGroup G]
variable (M : G → Type u)
variable [∀ g, AddCommGroup (M g)] [∀ g, Module H (M g)]
variable [∀ g, Module.Invertible H (M g)]

/-- Picard character using the supplied zero and tensor equivalences. -/
def k3PicardMap
    (e0 : M 0 ≃ₗ[H] H)
    (eadd : ∀ g h, (M g ⊗[H] M h) ≃ₗ[H] M (g + h)) :
    G →+ Additive (CommRing.Pic H) := by
  sorry

-- CommRing.Pic.mk_eq_mk_iff transports e0 and eadd to Picard equalities;
-- mk_self and mk_tensor then supply the additive-homomorphism laws.

variable (e0 : M 0 ≃ₗ[H] H)
variable (eadd : ∀ g h, (M g ⊗[H] M h) ≃ₗ[H] M (g + h))

lemma k3PicardMap_apply (g : G) :
    k3PicardMap M e0 eadd g =
      Additive.ofMul (CommRing.Pic.mk H (M g)) := by
  sorry

lemma k3PicardMap_zero :
    k3PicardMap M e0 eadd 0 = 0 := by
  sorry

lemma k3PicardMap_add (g h : G) :
    k3PicardMap M e0 eadd (g + h) =
      k3PicardMap M e0 eadd g + k3PicardMap M e0 eadd h := by
  sorry

lemma k3PicardMap_neg (g : G) :
    k3PicardMap M e0 eadd (-g) =
      -k3PicardMap M e0 eadd g := by
  sorry

/-- Test k3PicardMap_zero_test. -/
example : k3PicardMap M e0 eadd 0 = 0 := by
  sorry

/-- Test k3PicardMap_inverse_test. -/
example (g : G) :
    k3PicardMap M e0 eadd g + k3PicardMap M e0 eadd (-g) = 0 := by
  sorry

/-- Test k3PicardMap_power_test: identify the actual class, not a constant zero map. -/
example (g : G) (h : CommRing.Pic.mk H (M g) ≠ 1) :
    k3PicardMap M e0 eadd g ≠ 0 ∧
      k3PicardMap M e0 eadd (2 • g) =
        Additive.ofMul (CommRing.Pic.mk H (M g) ^ 2) := by
  sorry

-- HabiroModule.tensorPowerEquiv: not stated; needs actual Habiro modules
-- and their multiplication, then TensorPower n H H_{R,xi} equiv H_{R,n*xi}.
-- Include n=0 and the ring-line identification.
-- HabiroModule.tensorCoherence: not stated; needs actual multiplication
-- maps and unit identification. Assert associativity, symmetry and unit
-- diagrams on pure tensors, not arbitrary eadd coherence.

end PicardCharacterForms

section NormChecks

variable {A : Type*} [CommRing A]

/-- Test norm_split_cross_term: the series norm in a split degree-two algebra
is multiplication, not coefficientwise scalar norm. -/
example (a b : A) :
    PowerSeries.coeff 1
      ((1 + PowerSeries.C a * PowerSeries.X) *
       (1 + PowerSeries.C b * PowerSeries.X)) = a + b ∧
    PowerSeries.coeff 2
      ((1 + PowerSeries.C a * PowerSeries.X) *
       (1 + PowerSeries.C b * PowerSeries.X)) = a * b := by
  sorry

/-- Algebraic norm/Frobenius square: the finite free coefficient algebras
in the application exclude the norm's no-finite-basis fallback. -/
theorem norm_frobenius
    {B : Type*} [CommRing B] [Algebra A B]
    [Module.Free A B] [Module.Finite A B]
    (φA : A ≃+* A) (φB : B ≃+* B)
    (hφ : (algebraMap A B).comp φA = φB.toRingHom.comp (algebraMap A B))
    (b : B) :
    Algebra.norm A (φB b) = φA (Algebra.norm A b) := by
  sorry

/-- The coefficient-algebra component of norm_res; rank is the extension degree,
not a K3 grade. Actual section and torsor transport are still omitted below. -/
theorem norm_scalar
    {B : Type*} [CommRing B] [Algebra A B]
    [Module.Free A B] [Module.Finite A B] (a : A) :
    Algebra.norm A (algebraMap A B a) = a ^ Module.finrank A B := by
  sorry

/-- The coefficient-algebra component of norm_tower, using Algebra.norm_norm. -/
theorem norm_tower
    {B C : Type*} [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] [Algebra B C] [IsScalarTower A B C]
    [Module.Free A B] [Module.Finite A B]
    [Module.Free B C] [Module.Finite B C] (c : C) :
    Algebra.norm A (Algebra.norm B c) = Algebra.norm A c := by
  sorry

/-- Test norm_zero_test: finite free nontrivial algebras exclude the fallback
norm=1, including when the section's K3 grade is zero. -/
example {B : Type*} [CommRing B] [Algebra A B]
    [Module.Free A B] [Module.Finite A B] [Nontrivial B] :
    Algebra.norm A (0 : B) = 0 := by
  sorry

end NormChecks

/-
Exact omitted arithmetic declarations. These omissions follow PROTOCOL §13:
the actual imported objects are absent at the pinned libraries. They are
not represented by new arbitrary carriers with unproved predicates.

effectiveGlobalDescent: not stated; needs actual HB.6 Habiro ring and HB.7
global family set, local/rational line maps, and Kummer transition data.
Prove additive closure, finite projective rank one, actual chart base
changes, and conservative detection. G-global-descent is unresolved.

tensorMultiplication_bijective: not stated; needs the actual additive
modules and bilinear family multiplication. Prove Function.Bijective of
the tensor linear map using effective descent, then extract sum f_i*g_i=1.

HabiroModule.baseChange: not stated; needs actual rings/lines, K3 restriction,
M.8 Kummer torsor pullback and D.1/D.4 scalar/regulator naturality.
Signature: semilinear map H_{R,xi} -> H_{S,res xi}, over H_R -> H_S.
HabiroModule.baseChange_coeff: not stated; induced full cyclotomic coefficient
map on each normalized coefficient, torsor transport on the constant.
HabiroModule.baseChange_id: not stated; identity embedding with fixed Delta.
HabiroModule.baseChange_comp: not stated; tower composition with index transport.
HabiroModule.baseChange_smul: not stated; f(a*s)=fRing(a)*f(s).
HabiroModule.baseChange_zero: not stated; zero in each degree maps to zero.
HabiroModule.baseChange_add: not stated; preserves addition within each degree.
HabiroModule.baseChange_mul: not stated; preserves section multiplication,
with res(xi+eta)=res(xi)+res(eta) and the canonical torsor identifications.
HabiroModule.baseChange_ext: not stated; two semilinear comparisons with the
same ring map and torsor identifications agree if all component maps agree.
Test baseChange_identity: not stated; identity on every actual component.
Test baseChange_zero_index: not stated; agreement with the ring map and its unit.
Test baseChange_all_factors: not stated; Q -> Q(i), p=5, Delta divisible by 24,
the local map is Z_5 -> Z_5 x Z_5, a |-> (a,a), retaining both factors.

scalarExtensionEquiv: not stated; needs those maps and actual scalar tensor.
Signature: H_S tensor_{H_R} H_{R,xi} equiv H_{S,res xi} via b tensor f |-> b*f(f).
It depends on G-global-descent; a coefficient map alone is insufficient.
The Picard identity uses CommRing.Pic.mapAlgebra and mk_eq_mk_iff,
with actual Module.Invertible instances supplied by the Picard-character target.

HabiroModule.galois: not stated; needs baseChange for sigma and sigma inverse.
Signature: semilinear equivalence H_{R,xi} -> H_{R,sigma_*xi}, root coordinate fixed.
HabiroModule.galois_coeff: not stated; coefficient sigma and Kummer transport.
HabiroModule.galois_one: not stated; identity automorphism.
HabiroModule.galois_mul: not stated; sigma after tau, including degree transport.
HabiroModule.galois_smul: not stated; sigma(a*s)=sigma(a)*sigma(s).
HabiroModule.galois_section_mul: not stated; sigma(f*g)=sigma(f)*sigma(g)
with transported summed degrees. This differs from automorphism composition.
Test galois_identity: not stated; identity on all degrees.
Test galois_complex_conjugation: not stated; Q(i) conjugation squares to identity,
i goes to -i in the rational coefficient family, abstract zeta_m fixed.
Test galois_changed_index: not stated; sigma_*xi != xi has changed target degree.
No fixed-degree H_R-linear action is substituted for this semilinear action.

localNormDefect: not stated as a section theorem; needs actual local sections,
completed logarithm, D.4 trace naturality and M.8 normed Kummer torsors.
Exact target: completed defect of norm is trace of completed defect;
(p/x)*O_E[zeta_m][[x]] maps into (p/x)*O_F[zeta_m][[x]].
Check both Frobenius conventions and the corrected integral linear shape.
The algebraic norm/Frobenius square above is only one valid component.

HabiroModule.norm: not stated; needs actual global modules, K3 transfer,
full cyclotomic algebras and coherent torsor norm.
Signature: multiplicative map on the total graded sections,
H_{S,xi} -> H_{R,tr xi}; it is not an additive linear map.
HabiroModule.norm_mul: not stated; N(f*g)=N(f)*N(g), transferred summed degree.
HabiroModule.norm_one: not stated; ring unit in zero degree.
HabiroModule.norm_tower: not stated; composition along finite towers.
HabiroModule.norm_res: not stated; N(res f)=f^[E:F], tr(res xi)=[E:F]*xi.
HabiroModule.norm_eval: not stated; Kummer evaluation/norm square, (m,Delta)=1.
HabiroModule.norm_zero: not stated; N(0)=0 in every transferred grade,
since the finite coefficient extension has positive rank [E:F].
HabiroModule.norm_expandAt: not stated; expansion is the determinant norm of
the whole series over the full coefficient algebra with Kummer torsor transport.
Test norm_identity: not stated for actual modules; degree-one identity extension.
Test norm_res_degree_two: not stated; N(res f)=f^2 in degree 2*xi.
Test norm_split_cross_term: elaborated above as an actual power-series test.
Test norm_zero_test: the finite coefficient-algebra component is elaborated above;
the actual Habiro-section assertion also needs the omitted objects and transport.

All field extensions use common Delta divisible by 6 and both discriminants,
all local factors are kept, and no assertion for ramified excluded primes is made.
-/

end TauCeti.HabiroNF.HB7
