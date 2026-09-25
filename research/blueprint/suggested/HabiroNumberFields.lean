/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroNumberFields.md` is definitive. These statements suggest
Lean forms so that contributors and reviewers can converge on names and signatures. They
claim no implementation.

BP-HabiroNumberFields, revised by the independent review REV-HabiroNumberFields: partial
prototype, implementationStatus = unchecked.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Synced with the reviewed packet (67 nodes) and elaborated with the Lean toolchain of
Mathlib 082e2d3 against its prebuilt library: `sorry` is the only warning. The file imports
only Mathlib; the Tau Ceti declarations the packet cites (the Kummer map, the Selmer
sequence, power classes) are named in comments.

Conventions fixed here.
* The cyclotomic character is Mathlib's `IsPrimitiveRoot.autToPow`
  (`σ ζ = ζ ^ χ(σ)`, CGZ (4)); eigenspaces are the kernel sets
  `{x | ∀ σ, σ • x = χ(σ) ^ j • x}`, defined for every `n` with no division.
* Changing the root: `R_{ζ^k} = R_ζ ^ (k⁻¹)` (CGZ Lemma 2.7(1)), not `R_ζ ^ k`.
* `M_F = 6 |Δ_F| |K₂(O_F)|` and `M′_F = 2 |Δ_F| |K₂(O_F)|` (CGZ Remark 1.4) are integers.
* The exported units are GSWZ's `ε_m = c_{ζ_m} ^ 2` on `K₃(K)`, for every `m`.
* The coefficient rings are the full algebras `R[ζ_m] = R[t]/(Φ_m)`, with GSWZ's
  compatible roots of unity; the shift by `ζ_pm − ζ_m` is the p-adic re-expansion of
  HabiroCyclotomicCompletions HC.3 (a stand-in `rex` here), never `PowerSeries.subst`.
* GSWZ (21) has `(p / x)`; (24) is the product `f(q^γ)^γ f(q⁻¹)` in the Habiro ring of
  `R[1/γ]`; invertible sections have the corrected shape (195).

Objects that another roadmap owns are not re-planned. Algebraic K-theory, the Bloch groups,
Soulé's Chern classes, the p-adic regulator and the Bott element are not in the pinned
libraries: K-theoretic statements take the groups and maps as parameters and are stated as
forms, true once the parameters are instantiated by the owners' objects; items that cannot be
stated honestly yet are comments `-- <name>: not stated; needs <missing object>`. Nothing below
encodes a missing theorem as an assumed structure field or as a placeholder `Prop`, and no
statement is `True`. `sorry` occurs only as the body of a declaration or as a proof obligation
inside one.

Unit tests are `example`s (or theorems) whose docstring begins "Test `<name>`" or
"test `<name>`" with the name the packet gives, or comments `-- Test <name>: not stated;
needs …`.
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

universe u

noncomputable section

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
  Additive (Lˣ ⧸ (powMonoidHom n : Lˣ →* Lˣ).range)

/-- `(𝓞 L)ˣ ⧸ ((𝓞 L)ˣ)ⁿ`, written additively. -/
abbrev UnitClasses (L : Type*) [Field L] [NumberField L] (n : ℕ) : Type _ :=
  Additive ((𝓞 L)ˣ ⧸ (powMonoidHom n : (𝓞 L)ˣ →* (𝓞 L)ˣ).range)

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

noncomputable section

open Polynomial

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
  Lˣ ⧸ (powMonoidHom n : Lˣ →* Lˣ).range

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
theorem kms_identity {K : Type*} [Field K] {n : ℕ} {ζ : K} (hζ : IsPrimitiveRoot ζ n)
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

/-! ## HB.6–HB.7

`rex` stands for HabiroCyclotomicCompletions HC.3/p-adic-re-expansion (built there from
`PowerSeries.eval₂Hom` under `HasEval`); `K₃(K)`, `ε_m(ξ)` (HB.2) and `D_p(ξ)`
(PadicHodgeRegulators D.4) enter through the data `ClassData` those layers export, and
statements that need the data to come from one class `ξ` are given for `ξ = 0`. -/

noncomputable section

open Polynomial

namespace TauCeti.HabiroNF.HB67

/-! ## HB.6/compatible-roots-of-unity -/

/-- The full cyclotomic coefficient algebra `R[ζ_m] := R[t]/(Φ_m) = R ⊗_ℤ ℤ[ζ_m]`. -/
abbrev CoeffRing (R : Type*) [CommRing R] (m : ℕ) : Type _ :=
  AdjoinRoot (cyclotomic m R)

/-- The generator `ζ_m`. -/
abbrev zeta (R : Type*) [CommRing R] (m : ℕ) : CoeffRing R m :=
  AdjoinRoot.root (cyclotomic m R)

/-- `e(p,m)`: `e ≡ p [MOD p ^ (v_p m + 1)]`, `e ≡ 1 [MOD m / p ^ v_p m]`, reduced mod `p * m`. -/
def compatExp (p m : ℕ) : ℕ := sorry

theorem compatExp_modEq_left (p m : ℕ) [Fact p.Prime] (hm : 0 < m) :
    compatExp p m ≡ p [MOD p ^ (m.factorization p + 1)] := sorry

theorem compatExp_modEq_right (p m : ℕ) [Fact p.Prime] (hm : 0 < m) :
    compatExp p m ≡ 1 [MOD m / p ^ m.factorization p] := sorry

/-- The transition map `R[ζ_m] → R[ζ_{pm}]`, `ζ_m ↦ ζ_{pm}^{e(p,m)}` (GSWZ (7)). -/
def transition (R : Type*) [CommRing R] (p m : ℕ) : CoeffRing R m →+* CoeffRing R (p * m) :=
  AdjoinRoot.lift (algebraMap R (CoeffRing R (p * m))) (zeta R (p * m) ^ compatExp p m) sorry

@[simp] theorem transition_zeta (R : Type*) [CommRing R] (p m : ℕ) :
    transition R p m (zeta R m) = zeta R (p * m) ^ compatExp p m := sorry

/-- `sub_pow_totient_mem`: `(ζ_{pm} − ζ_m)^{φ(p^{v_p m + 1})} ∈ p · ℤ[ζ_{pm}]ˣ`. -/
theorem sub_pow_totient_mem (p m : ℕ) [Fact p.Prime] (hm : 0 < m) :
    ∃ u : (CoeffRing ℤ (p * m))ˣ,
      (zeta ℤ (p * m) - transition ℤ p m (zeta ℤ m)) ^
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
def rootDifference (p m : ℕ) : CompletedCoeff (SIntegers K Δ) p (p * m) :=
  algebraMap _ _ (zeta (SIntegers K Δ) (p * m) - transition (SIntegers K Δ) p m (zeta _ m))

theorem rootDifference_pow_mem {p : ℕ} (hp : p.Prime) (m : ℕ) (hm : 0 < m) :
    ∃ N, rootDifference K Δ p m ^ N ∈ Ideal.span {(p : CompletedCoeff (SIntegers K Δ) p (p * m))} :=
  sorry

/-- `rootDifference` is not nilpotent, so `PowerSeries.HasSubst` fails (for `p ∤ Δ`). -/
theorem not_isNilpotent_rootDifference {p : ℕ} (hp : p.Prime) (hΔ : NumberField.discr K ∣ (Δ : ℤ))
    (hpΔ : ¬ p ∣ Δ) (m : ℕ) (hm : 0 < m) : ¬ IsNilpotent (rootDifference K Δ p m) := sorry

/-! ## HB.6/the-gluing-condition -/

/-- `P_R = ∏_{m ≥ 1} R[ζ_m][[x]]`. -/
abbrev Families (R : Type*) [CommRing R] : Type _ := ∀ m : ℕ+, PowerSeries (CoeffRing R m)

/-- GSWZ (13) at `(p, m)`. -/
def GluesAt {p : ℕ} (hp : p.Prime) (m : ℕ+) (f : Families (SIntegers K Δ)) : Prop :=
  rex p (CompletedCoeff.isAdicComplete K Δ p (p * m)) (rootDifference K Δ p m)
      (rootDifference_pow_mem K Δ hp m m.pos)
      (PowerSeries.map ((algebraMap (CoeffRing (SIntegers K Δ) (p * m)) (CompletedCoeff (SIntegers K Δ) p (p * m))).comp
        (transition (SIntegers K Δ) p m)) (f m)) =
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
  rex p (CompletedCoeff.isAdicComplete K Δ p (p * m)) (rootDifference K Δ p m)
      (rootDifference_pow_mem K Δ hp m m.pos)
      (PowerSeries.map ((algebraMap (CoeffRing (SIntegers K Δ) (p * m)) (CompletedCoeff (SIntegers K Δ) p (p * m))).comp
        (transition (SIntegers K Δ) p m)) (f ⟨m, Nat.Coprime.coprime_mul_left hm⟩)) =
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
def completedTransition (p : ℕ) (m : ℕ+) :
    CompletedCoeff (SIntegers K Δ) p m →+* CompletedCoeff (SIntegers K Δ) p (p * m) := sorry

/-- Untwisted gluing over `R^_p` at `(p, m)`. -/
def UntwistedGluesAt {p : ℕ} (hp : p.Prime) (m : ℕ+)
    (g : ∀ m : ℕ+, PowerSeries (CompletedCoeff (SIntegers K Δ) p m)) : Prop :=
  rex p (CompletedCoeff.isAdicComplete K Δ p (p * m)) (rootDifference K Δ p m)
      (rootDifference_pow_mem K Δ hp m m.pos)
      (PowerSeries.map (completedTransition K Δ p m) (g m)) =
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

theorem isDomain_primeTo (hΔ : NumberField.discr K ∣ (Δ : ℤ)) :
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
    TensorProduct ℤ (habiroRing ℚ Δ) (SIntegers K Δ) ≃+ habiroRing K Δ := sorry

end Abelian

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

/-- The multiplication map (Theorem 2, the proved part), under the multiplicativity of the
imported data. -/
theorem mul_mem_habiroModuleSet (D D' D'' : ClassData K)
    (heps : ∀ m, D''.eps m = D.eps m * D'.eps m)
    (hreg : ∀ (p : ℕ) [Fact p.Prime], D''.reg p = D.reg p + D'.reg p)
    (ι : ∀ m, KummerAlg K D m →+* KummerAlg K D'' m) (ι' : ∀ m, KummerAlg K D' m →+* KummerAlg K D'' m)
    {f : ModuleFamilies K D} {g : ModuleFamilies K D'}
    (hf : f ∈ habiroModuleSet K Δ D) (hg : g ∈ habiroModuleSet K Δ D') :
    (fun m => PowerSeries.map (ι m) (f m) * PowerSeries.map (ι' m) (g m)) ∈ habiroModuleSet K Δ D'' :=
  sorry

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

/-! ## Remaining names of the packet

The nodes, API items and tests below either are stated here against the objects above, or are
comments naming the missing object. K-theoretic objects (`K₃`, the Bloch groups, Soulé's Chern
classes, the Bott element, the p-adic regulator, continuous Galois cohomology) are not in the
pinned libraries; their owners are K3BlochGroups, MotivicEtaleKTheory, StableHomotopyKTheory,
GeneralAlgebraicKTheory, PadicHodgeRegulators and the Tau Ceti ProfiniteCohomology roadmap. -/

namespace TauCeti.HabiroNF

/-! ### HB.1 -/

-- HB.1/bloch-group-conventions: not stated; needs the three Bloch groups and the comparison κ of
--   K3BlochGroups V.3 and the identification K₃(F)/n ≅ B_CGZ(F)/n of K3BlochGroups V.6.
-- coprime_w2_of_coprime_cgzExcludedInteger: not stated; needs w₂(F) (ArithmeticKTheory N.4,
--   `the-w-invariant`), which is not in the pinned libraries.
-- HB.1/finite-coefficient-K3-and-the-chern-class: not stated; needs K₃(E; ℤ/N) (StableHomotopyKTheory
--   H.6) and Soulé's c̄_{2,1} (MotivicEtaleKTheory M.8).
-- HB.1/inflation-restriction-injectivity: not stated; needs continuous Galois cohomology
--   H¹(F, ℤ/n(m)) with inflation–restriction (Tau Ceti ProfiniteCohomology layer 5, MotivicEtaleKTheory M.1).
-- HB.1/the-chern-class-map-c-zeta: not stated; needs Soulé's ℓ-adic Chern classes on K_{2m−1}(F)
--   (MotivicEtaleKTheory M.8), the Tate twists ℤ/n(m) (M.1) and the Kummer isomorphism
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
-- HB.1/hutchinson-chern-class-agrees: not stated; needs both constructions of c_ζ (M.8).
-- HB.1/quillen-lichtenbaum-degree-three: not stated; needs K₃(F) ⊗ ℤ_p and H¹_ét(O_F[1/p], ℤ_p(2))
--   (MotivicEtaleKTheory M.7).
-- HB.1/injectivity-of-c-zeta: not stated; needs chernClassMap.
-- HB.1/s-units-realise-c-zeta: not stated; needs chernClassMap (the Selmer-group input is Tau Ceti's
--   `IsDedekindDomain.selmerGroup.ker_toClassGroup`).
-- HB.1/units-realise-c-zeta: not stated; needs chernClassMap and Keune's injection (gap).
-- HB.1/equivariant-unit-rank: not stated; needs the Galois-module structure of the units (gap).
-- HB.1/cgz-theorem-1-5: not stated; needs chernClassMap.

end TauCeti.HabiroNF

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
-- HB.2/hutchinson-refinement: not stated; needs the comparison and CGZ Theorem 7.4 (gap).
-- epsilonUnit_mem_selmer: not stated; needs chernClassMap (the target is `epsilonTarget`).
-- epsilonUnit_add: `epsilonUnit` is additive by its type.
-- epsilonUnit_galois: not stated; needs chernClassMap_mem_eigenspace.
-- epsilonUnit_coherent: not stated; needs chernClassMap for varying m.
-- epsilonUnit_rootLine: the root line depends only on the class (`span_root_eq_of_eq_mul_pow`); its
--   definition from ε_m needs chernClassMap.
-- epsilonUnit_kummer: not stated; needs the Kummer isomorphism (Tau Ceti ProfiniteCohomology layer 9).
-- epsilonUnit_eq_Rzeta: not stated; needs the comparison and the refinement.
-- epsilonUnit_unit_rep: not stated; needs HB.2/R-injectivity-and-image.
-- Test epsilonUnit_Q: not stated; needs K₃(ℚ) and chernClassMap.
-- Test epsilonUnit_mu_in_K: not stated; needs chernClassMap for ℚ(√−3), m = 3.
-- Test epsilonUnit_coherent_local: not stated; needs epsilonUnit_coherent.
-- Test epsilonUnit_one: not stated; needs chernClassMap for m = 1.

end TauCeti.HabiroNF.HB2

namespace TauCeti.HabiroNF.HB67

open Polynomial

/-! ### HB.6 -/

/-- API `CoeffRing.transition_zeta_pow`: the transition sends `ζ_m` to `ζ_{pm}^{e(p,m)}`. -/
theorem CoeffRing.transition_zeta_pow (R : Type*) [CommRing R] (p m : ℕ) :
    transition R p m (zeta R m) = zeta R (p * m) ^ compatExp p m := sorry

-- changeOfSystem: not stated; needs the profinite units Ẑˣ acting on the compatible systems.

/-- Test `valuation_table` (computation): `(ζ₁₂ − ζ₄)² ∈ 3·ℤ[ζ₁₂]ˣ` and `(ζ₉ − ζ₃)⁶ ∈ 3·ℤ[ζ₉]ˣ`. -/
example :
    (∃ u : (CoeffRing ℤ (3 * 4))ˣ,
      (zeta ℤ (3 * 4) - transition ℤ 3 4 (zeta ℤ 4)) ^ 2 = (3 : CoeffRing ℤ (3 * 4)) * u) ∧
    ∃ u : (CoeffRing ℤ (3 * 3))ˣ,
      (zeta ℤ (3 * 3) - transition ℤ 3 3 (zeta ℤ 3)) ^ 6 = (3 : CoeffRing ℤ (3 * 3)) * u := sorry

/-- API `CoeffRing.map`: a ring map `R → R'` induces `R[ζ_m] → R'[ζ_m]`. -/
def CoeffRing.map {R R' : Type*} [CommRing R] [CommRing R'] (φ : R →+* R') (m : ℕ) :
    CoeffRing R m →+* CoeffRing R' m := sorry

/-- API `frobenius_comm_transition`. -/
theorem frobenius_comm_transition (K : Type*) [Field K] [NumberField K] (Δ p : ℕ) (m : ℕ+) :
    (frobenius K Δ p (p * m)).comp (completedTransition K Δ p m) =
      (completedTransition K Δ p m).comp (frobenius K Δ p m) := sorry

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
-- HB.6/the-p-adic-classical-ring: not stated; needs Habiro's completion over ℤ_p
--   (HabiroCyclotomicCompletions HC.1), which is not importable into this file.
-- HB.6/what-is-not-true-of-this-ring: stated by `not_isDomain_of_one_lt`, the class idempotents and
--   the non-examples above (the constant family `i`, and `¬ IsDomain (habiroRing ℚ 2)`).

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
-- HB.7/the-ring-case-and-tensor-products: `habiroModuleSet_zero` and `mul_mem_habiroModuleSet`.
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
