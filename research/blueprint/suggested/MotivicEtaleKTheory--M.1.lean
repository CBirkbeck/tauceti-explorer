import Mathlib.NumberTheory.Cyclotomic.CyclotomicCharacter
import Mathlib.RingTheory.RootsOfUnity.AlgebraicallyClosed
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.FieldTheory.KrullTopology
import Mathlib.FieldTheory.Galois.Notation
import Mathlib.Topology.Instances.ZMod
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.CategoryTheory.Sites.SheafCohomology.Basic
import Mathlib.AlgebraicGeometry.AlgebraicCycle.Basic
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.NumberTheory.Padics.RingHoms
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.InfinitePlace.Basic
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.PicardGroup
import Mathlib.FieldTheory.Perfect
import Mathlib.GroupTheory.Torsion
import Mathlib.Algebra.Ring.Action.Submonoid
import Mathlib.LinearAlgebra.TensorProduct.Basic

/-!
# Suggested Lean prototypes for MotivicEtaleKTheory, M.1–M.5c

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory--M.1.md` is definitive. The
statements here suggest Lean forms so that contributors and reviewers converge on
names and signatures. They claim no implementation: every node of the packet
`research/blueprint/packets/MotivicEtaleKTheory--M.1.json` is unchecked.

The file imports Mathlib only. Tau Ceti's `AbsoluteGaloisGroup`, `KummerCoeff`,
`kummerMap`, `ContCohomology.explicitCup11` and the projection formula are the
baseline the packet cites; they are not imported because the shared build contains
none of the Tau Ceti modules the packet cites (it holds only the adic-space part of
the tree). `TateTwist.GF` and `TateTwist.KummerCoeff` below are verbatim copies of
the pinned Tau Ceti abbreviations (f790474, `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean`
and `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`), so the absolute Galois
group is that of the separable closure, as in Tau Ceti; `TateTwist.kummer` is a
`sorry`-bodied stand-in for `kummerMap`.

The twists of M.1 are honest definitions: `μ_m^{⊗j}` is `ZMod m` (discrete) with `g`
acting by `χ_m(g)^j`, built from Mathlib's `modularCyclotomicCharacter`, and `ℤ_ℓ(j)`,
`ℚ_ℓ(j)` likewise from `cyclotomicCharacter`; Galois cohomology `H^i(F, μ_m^{⊗j})` and
`H^i(F, ℤ_ℓ(j))` are Mathlib's `continuousCohomology` of these representations, as the
packet prescribes. The identification of the `ZMod m` model with the tensor-power
definition of the packet depends on a choice of primitive root (`finite_one`); an
implementation should use the tensor powers of `KummerCoeff`. Objects that no library
provides yet (Milnor K-theory, higher Chow groups, motives, motivic cohomology, étale
cohomology of schemes) are introduced as `sorry`-bodied carriers with the structure
the packet requires. Where a statement needs machinery those carriers do not expose,
the declaration is listed by name and statement in the catalogue at the end, which
says why its Lean signature is omitted.
-/

noncomputable section

universe u

open CategoryTheory

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

/-! ## M.1 — coefficient modules -/

namespace TauCeti.TateTwist

/-- `G_F = Gal(Fˢ/F)`, the definition of Tau Ceti's `TauCeti.AbsoluteGaloisGroup` (Mathlib's
`Field.absoluteGaloisGroup` uses the algebraic closure, which is wrong for imperfect `F`). -/
abbrev GF (F : Type) [Field F] : Type := Gal(SeparableClosure F/F)

/-- Stand-in for Tau Ceti's `TauCeti.KummerCoeff F m`: `μ_m(Fˢ)` written additively. -/
abbrev KummerCoeff (F : Type) [Field F] (m : ℕ) : Type :=
  Additive (rootsOfUnity m (SeparableClosure F))

variable (F : Type) [Field F]

/-- `ℓ` invertible in `F` gives `ℓ^ν` invertible in `F`. -/
instance instNeZeroNatCastPow (ℓ ν : ℕ) [NeZero (ℓ : F)] : NeZero ((ℓ ^ ν : ℕ) : F) :=
  ⟨by rw [Nat.cast_pow]; exact pow_ne_zero ν (NeZero.ne _)⟩

instance instNeZeroNatCastOne : NeZero ((1 : ℕ) : F) := ⟨by simp⟩

/-- The mod-`m` cyclotomic character `χ_m : G_F → (ℤ/m)ˣ`, Mathlib's
`modularCyclotomicCharacter` on the automorphisms of `Fˢ` (`m` invertible in `F`). -/
def cyclotomicOfField (m : ℕ) [NeZero (m : F)] : GF F →* (ZMod m)ˣ :=
  haveI : NeZero m := .of_neZero_natCast F
  (modularCyclotomicCharacter (SeparableClosure F)
      (HasEnoughRootsOfUnity.natCard_rootsOfUnity (SeparableClosure F) m)).comp
    (MulSemiringAction.toRingEquiv _ (SeparableClosure F))

/-- `μ_m^{⊗j}` (packet node `M.1/finite-tate-twist`): `ZMod m`, discrete, with `g` acting by
`χ_m(g)^j`. -/
def finite (m : ℕ) [NeZero (m : F)] (j : ℤ) :
    ContRepresentation (ZMod m) (GF F) (ZMod m) :=
  .ofMonoidHom
    { toFun g := (((cyclotomicOfField F m g) ^ j : (ZMod m)ˣ) : ZMod m) •
        ContinuousLinearMap.id (ZMod m) (ZMod m)
      map_one' := by ext; simp
      map_mul' g h := by ext; simp [mul_zpow, mul_comm] }

theorem smul_eq_cyclotomic (m : ℕ) [NeZero (m : F)] (j : ℤ) (g : GF F) (x : ZMod m) :
    finite F m j g x = (((cyclotomicOfField F m g) ^ j : (ZMod m)ˣ) : ZMod m) * x := sorry

/-- `μ_m^{⊗1} ≅ KummerCoeff F m` equivariantly; the isomorphism is the choice of a generator. -/
theorem finite_one (m : ℕ) [NeZero (m : F)] :
    ∃ e : ZMod m ≃+ KummerCoeff F m, ∀ (g : GF F) (x : ZMod m),
      (((e (finite F m 1 g x)).toMul : (SeparableClosure F)ˣ) : SeparableClosure F) =
        g (((e x).toMul : (SeparableClosure F)ˣ) : SeparableClosure F) := sorry

theorem finite_zero (m : ℕ) [NeZero (m : F)] (g : GF F) :
    finite F m 0 g = ContinuousLinearMap.id (ZMod m) (ZMod m) := sorry

theorem card_finite (m : ℕ) [NeZero (m : F)] (j : ℤ) :
    Nat.card (TopRep.of (finite F m j)) = m := sorry

/-- The twist pairing `μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}` (multiplication on `ZMod m`). -/
def pairing (m : ℕ) : ZMod m →ₗ[ZMod m] ZMod m →ₗ[ZMod m] ZMod m :=
  LinearMap.mul (ZMod m) (ZMod m)

theorem pairing_equivariant (m : ℕ) [NeZero (m : F)] (i j : ℤ) (g : GF F) (x y : ZMod m) :
    pairing m (finite F m i g x) (finite F m j g y) = finite F m (i + j) g (pairing m x y) := sorry

/-- Cartier duality: `μ_m^{⊗(1−j)} ≅ Hom_{ℤ/m}(μ_m^{⊗j}, μ_m)`, `x ↦ (y ↦ pairing y x)`. -/
def homEquiv (m : ℕ) : ZMod m ≃ₗ[ZMod m] (ZMod m →ₗ[ZMod m] ZMod m) :=
  (LinearMap.ringLmapEquivSelf (ZMod m) (ZMod m) (ZMod m)).symm

/-- The duality is `G_F`-equivariant for `g · φ = g ∘ φ ∘ g⁻¹`. -/
theorem dualEquiv (m : ℕ) [NeZero (m : F)] (j : ℤ) (g : GF F) (x y : ZMod m) :
    homEquiv m (finite F m (1 - j) g x) (finite F m j g y) = finite F m 1 g (homEquiv m x y) :=
  sorry

theorem pairing_assoc (m : ℕ) (x y z : ZMod m) :
    pairing m (pairing m x y) z = pairing m x (pairing m y z) := sorry

theorem pairing_comm (m : ℕ) (x y : ZMod m) : pairing m x y = pairing m y x := sorry

/-- With a primitive `m`-th root of unity in `F` the action on `μ_m^{⊗j}` is trivial. -/
theorem trivialise (m : ℕ) [NeZero (m : F)] (ζ : F) (hζ : IsPrimitiveRoot ζ m) (j : ℤ)
    (g : GF F) : finite F m j g = ContinuousLinearMap.id (ZMod m) (ZMod m) := sorry

/-- Restriction `G_E → G_F` for a chosen `F`-embedding `Fˢ → Eˢ` (data: the choice). -/
def galRestrict (E : Type) [Field E] [Algebra F E] : GF E →* GF F := sorry

/-- Restricting `μ_m^{⊗j}(F)` along `G_E → G_F` gives `μ_m^{⊗j}(E)`. -/
theorem res (E : Type) [Field E] [Algebra F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)]
    (j : ℤ) (g : GF E) : finite F m j (galRestrict F E g) = finite E m j g := sorry

/-- Reduction `μ_{m'}^{⊗j} → μ_m^{⊗j}` for `m ∣ m'`. -/
def reduce {m m' : ℕ} (h : m ∣ m') : ZMod m' →+* ZMod m := ZMod.castHom h (ZMod m)

theorem reduce_equivariant {m m' : ℕ} [NeZero (m : F)] [NeZero (m' : F)] (h : m ∣ m') (j : ℤ)
    (g : GF F) (x : ZMod m') :
    reduce h (finite F m' j g x) = finite F m j g (reduce h x) := sorry

example (m : ℕ) [NeZero (m : F)] (g : GF F) (x : ZMod m) :
    finite F m 0 g x = x := sorry -- test_zero_trivial

example (m : ℕ) [NeZero (m : F)] (ζ : SeparableClosure F) (hζ : IsPrimitiveRoot ζ m)
    (g : GF F) (x : ZMod m) :
    g (ζ ^ x.val) = ζ ^ (finite F m 1 g x).val := sorry -- test_kummer_coeff

example : ∃ c : GF ℚ, finite ℚ 3 1 c 1 = -1 ∧ finite ℚ 3 2 c 1 = 1 := sorry -- test_rat_three_square

example : ¬ ∀ g : GF ℚ, finite ℚ 4 1 g = ContinuousLinearMap.id (ZMod 4) (ZMod 4) :=
  sorry -- test_not_trivial_without_root

/-- The `ℓ`-adic cyclotomic character, Mathlib's `cyclotomicCharacter` on `Fˢ`. -/
def cyclotomicAdic (ℓ : ℕ) [Fact ℓ.Prime] : GF F →* ℤ_[ℓ]ˣ :=
  (cyclotomicCharacter (SeparableClosure F) ℓ).comp
    (MulSemiringAction.toRingEquiv _ (SeparableClosure F))

/-- `ℤ_ℓ(j)` (packet node `M.1/adic-tate-twist`): `ℤ_[ℓ]` with `g` acting by `χ(g)^j`. -/
def adic (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) :
    ContRepresentation ℤ_[ℓ] (GF F) ℤ_[ℓ] :=
  .ofMonoidHom
    { toFun g := (((cyclotomicAdic F ℓ g) ^ j : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) •
        ContinuousLinearMap.id ℤ_[ℓ] ℤ_[ℓ]
      map_one' := by ext; simp
      map_mul' g h := by ext; simp [mul_zpow, mul_comm] }

theorem adic_smul (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) (g : GF F) (x : ℤ_[ℓ]) :
    adic F ℓ j g x = (((cyclotomicAdic F ℓ g) ^ j : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) * x := sorry

/-- `ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j}`: reduction mod `ℓ^ν` is equivariant. -/
theorem adicQuotientEquiv (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) (ν : ℕ) (g : GF F)
    (x : ℤ_[ℓ]) :
    PadicInt.toZModPow ν (adic F ℓ j g x) = finite F (ℓ ^ ν) j g (PadicInt.toZModPow ν x) := sorry

/-- `ℤ_ℓ(j) ≅ lim_ν μ_{ℓ^ν}^{⊗j}` as topological `G_F`-modules. -/
theorem adicLimitEquiv (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) :
    ∃ e : ℤ_[ℓ] ≃ {y : (ν : ℕ) → ZMod (ℓ ^ ν) //
        ∀ ν, reduce (pow_dvd_pow ℓ ν.le_succ) (y (ν + 1)) = y ν},
      Continuous e ∧ Continuous e.symm ∧ ∀ (g : GF F) (x : ℤ_[ℓ]) (ν : ℕ),
        (e (adic F ℓ j g x)).1 ν = finite F (ℓ ^ ν) j g ((e x).1 ν) := sorry

/-- `ℚ_ℓ(j) = ℤ_ℓ(j) ⊗ ℚ_ℓ`. -/
def rational (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) :
    ContRepresentation ℚ_[ℓ] (GF F) ℚ_[ℓ] :=
  .ofMonoidHom
    { toFun g := ((((cyclotomicAdic F ℓ g) ^ j : ℤ_[ℓ]ˣ) : ℤ_[ℓ]) : ℚ_[ℓ]) •
        ContinuousLinearMap.id ℚ_[ℓ] ℚ_[ℓ]
      map_one' := by ext; simp
      map_mul' g h := by ext; simp [mul_zpow, mul_comm] }

/-- `ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}`, a discrete `G_F`-module (`0` when `ℓ = char F`). -/
def divisible (F : Type) [Field F] (ℓ : ℕ) (j : ℤ) : Type := sorry

instance (ℓ : ℕ) (j : ℤ) : AddCommGroup (divisible F ℓ j) := sorry

instance (ℓ : ℕ) (j : ℤ) : DistribMulAction (GF F) (divisible F ℓ j) := sorry

/-- The quotient map `ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j)`. -/
def divisibleMk (ℓ : ℕ) [Fact ℓ.Prime] (j : ℤ) : ℚ_[ℓ] →+ divisible F ℓ j := sorry

/-- The coefficient inclusion `ι : μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j}`, multiplication by `ℓ^b`. -/
def coeffInclusion (ℓ a b : ℕ) : ZMod (ℓ ^ a) →+ ZMod (ℓ ^ (a + b)) :=
  ZMod.lift (ℓ ^ a) ⟨zmultiplesHom (ZMod (ℓ ^ (a + b))) ((ℓ : ZMod (ℓ ^ (a + b))) ^ b), by
    rw [zmultiplesHom_apply, zsmul_eq_mul]
    push_cast
    rw [← pow_add, ← Nat.cast_pow, ZMod.natCast_self]⟩

theorem coeffInclusion_injective (ℓ a b : ℕ) [Fact ℓ.Prime] :
    Function.Injective (coeffInclusion ℓ a b) := sorry

/-- `0 → μ_{ℓ^a}^{⊗j} --ι--> μ_{ℓ^{a+b}}^{⊗j} → μ_{ℓ^b}^{⊗j} → 0` is exact in the middle. -/
theorem coeffInclusion_exact (ℓ a b : ℕ) [Fact ℓ.Prime] :
    Function.Exact (coeffInclusion ℓ a b) (reduce (pow_dvd_pow ℓ (Nat.le_add_left b a))) := sorry

theorem coeffInclusion_equivariant (ℓ a b : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ)
    (g : GF F) (x : ZMod (ℓ ^ a)) :
    coeffInclusion ℓ a b (finite F (ℓ ^ a) j g x) =
      finite F (ℓ ^ (a + b)) j g (coeffInclusion ℓ a b x) := sorry

/-- `0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0` is an exact sequence of `G_F`-modules with a
continuous set-theoretic section. -/
theorem shortExact_mul (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) (ν : ℕ) :
    Function.Injective (fun x : ℤ_[ℓ] => (ℓ ^ ν : ℕ) • x) ∧
      Function.Exact (fun x : ℤ_[ℓ] => (ℓ ^ ν : ℕ) • x) (PadicInt.toZModPow ν) ∧
      (∃ s : ZMod (ℓ ^ ν) → ℤ_[ℓ], Continuous s ∧ ∀ y, PadicInt.toZModPow ν (s y) = y) ∧
      ∀ (g : GF F) (x : ℤ_[ℓ]),
        adic F ℓ j g ((ℓ ^ ν : ℕ) • x) = (ℓ ^ ν : ℕ) • adic F ℓ j g x ∧
        PadicInt.toZModPow ν (adic F ℓ j g x) = finite F (ℓ ^ ν) j g (PadicInt.toZModPow ν x) :=
  sorry

/-- `0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0` is exact and equivariant. -/
theorem shortExact_rational (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) :
    Function.Surjective (divisibleMk F ℓ j) ∧
      (∀ x : ℚ_[ℓ], divisibleMk F ℓ j x = 0 ↔ x ∈ Set.range ((↑) : ℤ_[ℓ] → ℚ_[ℓ])) ∧
      ∀ (g : GF F) (x : ℚ_[ℓ]), divisibleMk F ℓ j (rational F ℓ j g x) = g • divisibleMk F ℓ j x :=
  sorry

/-- The pairings `ℤ_ℓ(i) × ℤ_ℓ(j) → ℤ_ℓ(i+j)` (multiplication on `ℤ_[ℓ]`). -/
def adic_pairing (ℓ : ℕ) [Fact ℓ.Prime] : ℤ_[ℓ] →ₗ[ℤ_[ℓ]] ℤ_[ℓ] →ₗ[ℤ_[ℓ]] ℤ_[ℓ] :=
  LinearMap.mul ℤ_[ℓ] ℤ_[ℓ]

theorem adic_pairing_equivariant (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (i j : ℤ) (ν : ℕ)
    (g : GF F) (x y : ℤ_[ℓ]) :
    adic_pairing ℓ (adic F ℓ i g x) (adic F ℓ j g y) = adic F ℓ (i + j) g (adic_pairing ℓ x y) ∧
      PadicInt.toZModPow ν (adic_pairing ℓ x y) =
        pairing (ℓ ^ ν) (PadicInt.toZModPow ν x) (PadicInt.toZModPow ν y) := sorry

example (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (g : GF F) (x : ℤ_[ℓ]) :
    adic F ℓ 0 g x = x := sorry -- test_adic_zero

example (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (g : GF F) (x : ℤ_[ℓ]) :
    adic F ℓ 1 g x =
      (cyclotomicCharacter (SeparableClosure F) ℓ
        (MulSemiringAction.toRingEquiv (GF F) (SeparableClosure F) g) : ℤ_[ℓ]) * x :=
  sorry -- test_adic_char

example : Nonempty (FixedPoints.addSubgroup (GF ℚ) (divisible ℚ 3 2) ≃+ ZMod 3) :=
  sorry -- test_rat_three_w2

/-- The factorwise inclusion `μ_ℓ ⊗ μ_ℓ → μ_{ℓ²} ⊗ μ_{ℓ²}` is multiplication by `ℓ²`, which is
zero, whereas `ι` is not. -/
example (ℓ : ℕ) [Fact ℓ.Prime] :
    coeffInclusion ℓ 1 1 ≠ 0 ∧
      ∀ x : ZMod (ℓ ^ 1), ((ℓ : ZMod (ℓ ^ (1 + 1))) ^ 2) * (x.val : ZMod (ℓ ^ (1 + 1))) = 0 :=
  sorry -- test_factorwise_inclusion_wrong

/-- Along the factorwise inclusions, `ν` steps multiply a class of `μ_{ℓ^ν}^{⊗2}` by `ℓ^{2ν}`, which
is zero, so that colimit is `0`; along `ι` every step is injective. -/
example (ℓ : ℕ) [Fact ℓ.Prime] (ν : ℕ) :
    (∀ x : ZMod (ℓ ^ ν), ((ℓ : ZMod (ℓ ^ (ν + ν))) ^ (2 * ν)) * (x.val : ZMod (ℓ ^ (ν + ν))) = 0) ∧
      Function.Injective (coeffInclusion ℓ ν ν) := sorry -- test_factorwise_colimit_zero

/-- `ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j)` as a discrete `G_F`-module (`M.1/primewise-q-mod-z-twist`). -/
def ratModInt (F : Type) [Field F] (j : ℤ) : Type := sorry

instance (j : ℤ) : AddCommGroup (ratModInt F j) := sorry

instance (j : ℤ) : DistribMulAction (GF F) (ratModInt F j) := sorry

/-- The underlying group of `ℚ/ℤ(j)` is `μ(Fˢ)`; the transported action is `ζ ↦ g^j(ζ)`. -/
def ratModIntEquivRootsOfUnity (j : ℤ) :
    ratModInt F j ≃+ Additive (CommGroup.torsion (SeparableClosure F)ˣ) := sorry

theorem ratModInt_primary (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (j : ℤ) :
    Nonempty (AddCommGroup.primaryComponent (ratModInt F j) ℓ ≃+ divisible F ℓ j) := sorry

/-- `H⁰(ℚ, ℚ/ℤ(2))` is cyclic of order 24 (its order is `w_2(ℚ)`, ArithmeticKTheory N.4's
invariant). -/
example : Nat.card (FixedPoints.addSubgroup (GF ℚ) (ratModInt ℚ 2)) = 24 ∧
    IsAddCyclic (FixedPoints.addSubgroup (GF ℚ) (ratModInt ℚ 2)) := sorry -- test_w2_rat

example : (∀ (g : GF F) (x : ratModInt F 0), g • x = x) ∧
    Infinite (FixedPoints.addSubgroup (GF F) (ratModInt F 0)) := sorry -- test_ratModInt_zero

example (g : GF F) (x : ratModInt F 1) :
    (((ratModIntEquivRootsOfUnity F 1 (g • x)).toMul : (SeparableClosure F)ˣ) : SeparableClosure F) =
      g (((ratModIntEquivRootsOfUnity F 1 x).toMul : (SeparableClosure F)ˣ) : SeparableClosure F) :=
  sorry -- test_one_roots

example : Subsingleton (TensorProduct ℤ (ratModInt F 1) (ratModInt F 1)) ∧
    Nontrivial (ratModInt F 2) := sorry -- test_tensor_square_zero

/-- `H^i(F, μ_m^{⊗j})` (`M.1/twisted-cohomology-ring`): Mathlib's continuous cohomology of `G_F`
with coefficients in `finite F m j`. -/
abbrev H (m : ℕ) [NeZero (m : F)] (i : ℕ) (j : ℤ) : Type :=
  continuousCohomology i (TopRep.of (finite F m j))

/-- `H^i(F, ℤ_ℓ(j))`, continuous cochains for the `ℓ`-adic topology. -/
abbrev Hcont (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (i : ℕ) (j : ℤ) : Type :=
  continuousCohomology i (TopRep.of (adic F ℓ j))

/-- `H^i(F, ℚ_ℓ(j))`. -/
abbrev Hrat (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (i : ℕ) (j : ℤ) : Type :=
  continuousCohomology i (TopRep.of (rational F ℓ j))

/-- `H^i(F, ℚ_ℓ/ℤ_ℓ(j))`, the cohomology of the discrete module `divisible F ℓ j`. -/
def Hdiv (F : Type) [Field F] (ℓ : ℕ) (i : ℕ) (j : ℤ) : Type := sorry

instance (ℓ i : ℕ) (j : ℤ) : AddCommGroup (Hdiv F ℓ i j) := sorry

/-- The cup product `H^i(μ_m^{⊗a}) × H^k(μ_m^{⊗b}) → H^{i+k}(μ_m^{⊗(a+b)})` (Layer 12's cup
product composed with `pairing`). -/
def cup (m : ℕ) [NeZero (m : F)] (i k : ℕ) (a b : ℤ) :
    H F m i a →+ H F m k b →+ H F m (i + k) (a + b) := sorry

/-- Restriction and corestriction along a field extension `E/F` (finite separable for `corH`). -/
def resH (E : Type) [Field E] [Algebra F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)] (i : ℕ)
    (j : ℤ) : H F m i j →+ H E m i j := sorry

def corH (E : Type) [Field E] [Algebra F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)] (i : ℕ)
    (j : ℤ) : H E m i j →+ H F m i j := sorry

theorem cup_assoc (m : ℕ) [NeZero (m : F)] (i k n : ℕ) (a b c : ℤ) (x : H F m i a)
    (y : H F m k b) (z : H F m n c) :
    HEq (cup F m (i + k) n (a + b) c (cup F m i k a b x y) z)
      (cup F m i (k + n) a (b + c) x (cup F m k n b c y z)) := sorry

theorem cup_comm (m : ℕ) [NeZero (m : F)] (i k : ℕ) (a b : ℤ) (x : H F m i a) (y : H F m k b) :
    HEq (cup F m i k a b x y) ((-1 : ℤ) ^ (i * k) • cup F m k i b a y x) := sorry

theorem res_cup (E : Type) [Field E] [Algebra F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)]
    (i k : ℕ) (a b : ℤ) (x : H F m i a) (y : H F m k b) :
    resH F E m (i + k) (a + b) (cup F m i k a b x y) =
      cup E m i k a b (resH F E m i a x) (resH F E m k b y) := sorry

theorem cor_res (E : Type) [Field E] [Algebra F E] [FiniteDimensional F E]
    [Algebra.IsSeparable F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)] (i : ℕ) (j : ℤ)
    (x : H F m i j) : corH F E m i j (resH F E m i j x) = Module.finrank F E • x := sorry

theorem projection_formula (E : Type) [Field E] [Algebra F E] [FiniteDimensional F E]
    [Algebra.IsSeparable F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)] (i k : ℕ) (a b : ℤ)
    (x : H F m i a) (y : H E m k b) :
    corH F E m (i + k) (a + b) (cup E m i k a b (resH F E m i a x) y) =
      cup F m i k a b x (corH F E m k b y) := sorry

/-- Stand-in for Tau Ceti's `kummerMap`: `κ : F^× → H¹(F, μ_m)`. -/
def kummer (m : ℕ) [NeZero (m : F)] : Additive Fˣ →+ H F m 1 1 := sorry

example (i : ℕ) (j : ℤ) : Subsingleton (H F 1 i j) := sorry -- test_m_one

example (m : ℕ) [NeZero (m : F)] : Nonempty (H F m 0 0 ≃+ ZMod m) := sorry -- test_H0

example (n : ℕ) : Nonempty (H ℝ 2 n n ≃+ ZMod 2) := sorry -- test_real_mod_two

example :
    cup ℝ 2 1 1 1 1 (kummer ℝ 2 (Additive.ofMul (-1))) (kummer ℝ 2 (Additive.ofMul (-1))) ≠ 0 :=
  sorry -- test_not_commutative

/-- Reduction of coefficients `H(F, μ_{m'}^{⊗j}) → H(F, μ_m^{⊗j})` for `m ∣ m'`. -/
def reduceH {m m' : ℕ} [NeZero (m : F)] [NeZero (m' : F)] (h : m ∣ m') (i : ℕ) (j : ℤ) :
    H F m' i j →+ H F m i j := sorry

/-- The projections `H^i(F, ℤ_ℓ(j)) → H^i(F, μ_{ℓ^ν}^{⊗j})`. -/
def toFinite (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (i : ℕ) (j : ℤ) (ν : ℕ) :
    Hcont F ℓ i j →+ H F (ℓ ^ ν) i j := sorry

/-- `M.1/continuous-limit-comparison` (a): when the groups `H^i(F, μ_{ℓ^ν}^{⊗j})` are finite,
`H^{i+1}(F, ℤ_ℓ(j)) → lim_ν H^{i+1}(F, μ_{ℓ^ν}^{⊗j})` is bijective. -/
theorem continuous_limit_comparison (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (i : ℕ) (j : ℤ)
    (hfin : ∀ ν, Finite (H F (ℓ ^ ν) i j)) :
    Function.Injective (fun x : Hcont F ℓ (i + 1) j => fun ν => toFinite F ℓ (i + 1) j ν x) ∧
      Set.range (fun x : Hcont F ℓ (i + 1) j => fun ν => toFinite F ℓ (i + 1) j ν x) =
        {y | ∀ ν, reduceH F (pow_dvd_pow ℓ ν.le_succ) (i + 1) j (y (ν + 1)) = y ν} := sorry

end TauCeti.TateTwist

namespace TauCeti.EtaleTwist

open AlgebraicGeometry

/-- The étale sheaf `μ_m^{⊗j}` on the small étale site of `X` (`M.1/etale-twist-sheaf`); in the
implementation this is EDC.0's `TauCeti.EtaleDuality.tateTwistSheaf`, not a second construction. -/
def sheaf (X : Scheme.{0}) (m : ℕ) (j : ℤ) :
    Sheaf (Scheme.smallEtaleTopology X) AddCommGrpCat.{0} := sorry

/-- `H^i_et(X, μ_m^{⊗j})`, meant as `Sheaf.H (sheaf X m j) i`; a carrier because the shared
build supplies no `HasExt` instance for sheaves on the large site `X.Etale`. -/
def H (X : Scheme.{0}) (m : ℕ) (i : ℕ) (j : ℤ) : Type := sorry

instance (X : Scheme.{0}) (m i : ℕ) (j : ℤ) : AddCommGroup (H X m i j) := sorry

/-- Continuous ℓ-adic étale cohomology, the cohomology of `R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j})`. -/
def Hcont (X : Scheme.{0}) (ℓ i : ℕ) (j : ℤ) : Type := sorry

instance (X : Scheme.{0}) (ℓ i : ℕ) (j : ℤ) : AddCommGroup (Hcont X ℓ i j) := sorry

/-- The projections `H^i_cont(X, ℤ_ℓ(j)) → H^i_et(X, μ_{ℓ^ν}^{⊗j})` and the reductions. -/
def toFinite (X : Scheme.{0}) (ℓ i : ℕ) (j : ℤ) (ν : ℕ) : Hcont X ℓ i j →+ H X (ℓ ^ ν) i j :=
  sorry

def reduceH (X : Scheme.{0}) {m m' : ℕ} (h : m ∣ m') (i : ℕ) (j : ℤ) : H X m' i j →+ H X m i j :=
  sorry

/-- The Milnor sequence, in the form used when the finite-level groups are finite (so the
`lim¹` term vanishes). -/
theorem milnor_sequence (X : Scheme.{0}) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : IsUnit ((ℓ : ℕ) : X.presheaf.obj (Opposite.op ⊤))) (i : ℕ) (j : ℤ)
    (hfin : ∀ ν, Finite (H X (ℓ ^ ν) i j)) :
    Function.Injective (fun x : Hcont X ℓ (i + 1) j => fun ν => toFinite X ℓ (i + 1) j ν x) ∧
      Set.range (fun x : Hcont X ℓ (i + 1) j => fun ν => toFinite X ℓ (i + 1) j ν x) =
        {y | ∀ ν, reduceH X (pow_dvd_pow ℓ ν.le_succ) (i + 1) j (y (ν + 1)) = y ν} := sorry

/-- Pullback along a morphism of schemes. -/
def pullback {X Y : Scheme.{0}} (f : X ⟶ Y) (m i : ℕ) (j : ℤ) : H Y m i j →+ H X m i j := sorry

theorem pullback_id (X : Scheme.{0}) (m i : ℕ) (j : ℤ) (x : H X m i j) :
    pullback (𝟙 X) m i j x = x := sorry

theorem pullback_comp {X Y Z : Scheme.{0}} (f : X ⟶ Y) (g : Y ⟶ Z) (m i : ℕ) (j : ℤ)
    (x : H Z m i j) : pullback (f ≫ g) m i j x = pullback f m i j (pullback g m i j x) := sorry

/-- Cup products `H^i_et(μ_m^{⊗a}) × H^k_et(μ_m^{⊗b}) → H^{i+k}_et(μ_m^{⊗(a+b)})`. -/
def cup (X : Scheme.{0}) (m i k : ℕ) (a b : ℤ) : H X m i a →+ H X m k b →+ H X m (i + k) (a + b) :=
  sorry

/-- The long exact sequence of `0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0`, at the middle
term. -/
theorem coeff_long_exact (X : Scheme.{0}) (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : IsUnit ((ℓ : ℕ) : X.presheaf.obj (Opposite.op ⊤))) (i : ℕ) (j : ℤ) (ν : ℕ) :
    Function.Exact (nsmulAddMonoidHom (α := Hcont X ℓ i j) (ℓ ^ ν)) (toFinite X ℓ i j ν) := sorry

example (m i : ℕ) (j : ℤ) (ℓ : ℕ) : Subsingleton (H (Spec (CommRingCat.of PUnit.{1})) m i j) ∧
    Subsingleton (Hcont (Spec (CommRingCat.of PUnit.{1})) ℓ i j) := sorry -- test_empty

example (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (j : ℤ) :
    Nonempty (H (Spec (CommRingCat.of F)) m 0 j ≃+ TauCeti.TateTwist.H F m 0 j) :=
  sorry -- test_field_H0

example : Nonempty (H (Spec (CommRingCat.of (ZMod 5))) 4 1 1 ≃+ ZMod 4) :=
  sorry -- test_finite_field_H1

/-- For `𝔽_5` and `ℓ = 2`: `H¹_cont(𝔽_5, ℤ_2(0)) = ℤ_2 ≠ 0`, whereas `H¹_et` of the constant sheaf
with value the abstract group `ℤ_2` vanishes; so `Hcont` is not the naive group. -/
example : Nontrivial (Hcont (Spec (CommRingCat.of (ZMod 5))) 2 1 0) :=
  sorry -- test_cont_not_naive_limit

/-- `M.1/field-etale-galois-comparison`. -/
theorem field_etale_galois_comparison (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (i : ℕ)
    (j : ℤ) : Nonempty (H (Spec (CommRingCat.of F)) m i j ≃+ TauCeti.TateTwist.H F m i j) := sorry

/-- The Kummer map `A^× → H¹_et(Spec A, μ_n)` and the map `H¹_et(Spec A, μ_n) → Pic(A)`. -/
def kummerEtale (A : Type) [CommRing A] (n : ℕ) :
    Additive Aˣ →+ H (Spec (CommRingCat.of A)) n 1 1 := sorry

def toPic (A : Type) [CommRing A] (n : ℕ) :
    H (Spec (CommRingCat.of A)) n 1 1 →+ Additive (CommRing.Pic A) := sorry

/-- `M.1/etale-kummer-sequences`, first sequence, for `X = Spec A`:
`0 → A^×/n → H¹_et(X, μ_n) → Pic(A)[n] → 0`. -/
theorem etale_kummer_units (A : Type) [CommRing A] (n : ℕ) (hn : IsUnit (n : A)) :
    (kummerEtale A n).ker = (nsmulAddMonoidHom (α := Additive Aˣ) n).range ∧
      Function.Exact (kummerEtale A n) (toPic A n) ∧
      (toPic A n).range = (nsmulAddMonoidHom (α := Additive (CommRing.Pic A)) n).ker := sorry

/-- `M.1/henselian-residue-comparison`. -/
theorem henselian_residue_comparison (A : Type) [CommRing A] [HenselianLocalRing A]
    (m : ℕ) [NeZero (m : IsLocalRing.ResidueField A)] (i : ℕ) (j : ℤ) :
    Nonempty (H (Spec (CommRingCat.of A)) m i j ≃+
      TauCeti.TateTwist.H (IsLocalRing.ResidueField A) m i j) := sorry

end TauCeti.EtaleTwist

/-! ## M.2 — real places -/

namespace TauCeti.RealPlaces

open AlgebraicGeometry NumberField IsDedekindDomain

/-- The ring of `S`-integers `O_{F,S}` for a finite set `S` of finite places (the infinite places
always belong to `S`). -/
abbrev OS (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F))) : Type :=
  ((S : Set (HeightOneSpectrum (𝓞 F))).integer F)

/-- `α^n_S(j) : H^n_et(O_{F,S}, ℤ/2^ν(j)) → ⊕_{σ real} H^n(ℝ, ℤ/2^ν(j))`
(`M.2/real-restriction-map`, finite coefficients). -/
def alpha (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F))) (ν n : ℕ)
    (j : ℤ) :
    TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (2 ^ ν) n j →+
      ({v : InfinitePlace F // v.IsReal} → TauCeti.TateTwist.H ℝ (2 ^ ν) n j) := sorry

theorem alpha_cup (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (ν n k : ℕ) (a b : ℤ) (x : TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (2 ^ ν) n a)
    (y : TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (2 ^ ν) k b)
    (σ : {v : InfinitePlace F // v.IsReal}) :
    alpha F S ν (n + k) (a + b) (TauCeti.EtaleTwist.cup _ (2 ^ ν) n k a b x y) σ =
      TauCeti.TateTwist.cup ℝ (2 ^ ν) n k a b (alpha F S ν n a x σ) (alpha F S ν k b y σ) := sorry

theorem realCohomology_modTwo (n : ℕ) (j : ℤ) :
    Nonempty (TauCeti.TateTwist.H ℝ 2 n j ≃+ ZMod 2) := sorry

theorem realCohomology_divisible (n : ℕ) (hn : 0 < n) (j : ℤ) :
    (Odd (j - n) → Nonempty (TauCeti.TateTwist.Hdiv ℝ 2 n j ≃+ ZMod 2)) ∧
      (Even (j - n) → Subsingleton (TauCeti.TateTwist.Hdiv ℝ 2 n j)) := sorry

/-- On units, `α¹` is the sign map: `α¹(κ(u))_σ = κ_ℝ(σ(u))`. -/
theorem alpha_one_sign (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (u : (OS F S)ˣ) (v : InfinitePlace F) (hv : v.IsReal) :
    alpha F S 1 1 1 (TauCeti.EtaleTwist.kummerEtale (OS F S) (2 ^ 1) (Additive.ofMul u)) ⟨v, hv⟩ =
      TauCeti.TateTwist.kummer ℝ (2 ^ 1)
        (Additive.ofMul (Units.map ((InfinitePlace.embedding_of_isReal hv).comp
          (algebraMap (OS F S) F)).toMonoidHom u)) := sorry

/-- For `F = ℚ` and `2 ∈ S`: `α¹(−1) ≠ 0` and `α¹(2) = 0`. -/
example (S : Finset (HeightOneSpectrum (𝓞 ℚ))) (h2 : IsUnit ((2 : ℕ) : OS ℚ S))
    (σ : {v : InfinitePlace ℚ // v.IsReal}) :
    alpha ℚ S 1 1 1 (TauCeti.EtaleTwist.kummerEtale (OS ℚ S) (2 ^ 1) (Additive.ofMul (-1))) σ ≠ 0 ∧
      alpha ℚ S 1 1 1 (TauCeti.EtaleTwist.kummerEtale (OS ℚ S) (2 ^ 1) (Additive.ofMul h2.unit)) =
        0 := sorry -- test_rat_sign

/-- `H²(ℝ; ℤ/2^∞(2)) = 0` although `H²(ℝ; ℤ/2) ≠ 0`. -/
example : Subsingleton (TauCeti.TateTwist.Hdiv ℝ 2 2 2) ∧ Nontrivial (TauCeti.TateTwist.H ℝ 2 2 0) :=
  sorry -- test_parity

/-- `M.2/positive-and-modified-cohomology`: the kernel groups `H̃^n = ker α^n`. -/
def kernelCohomology (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (ν n : ℕ) (j : ℤ) :
    AddSubgroup (TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (2 ^ ν) n j) :=
  (alpha F S ν n j).ker

/-- Positive cohomology `H^n_+`, the cohomology of the fibre of `α` on cochains, with its maps
to ordinary cohomology and from the real places. -/
def positiveCohomology (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (ν n : ℕ) (j : ℤ) : Type := sorry

instance (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F))) (ν n : ℕ)
    (j : ℤ) : AddCommGroup (positiveCohomology F S ν n j) := sorry

def positiveToOrdinary (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (ν n : ℕ) (j : ℤ) :
    positiveCohomology F S ν n j →+ TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (2 ^ ν) n j :=
  sorry

def positiveBoundary (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (ν n : ℕ) (j : ℤ) :
    ({v : InfinitePlace F // v.IsReal} → TauCeti.TateTwist.H ℝ (2 ^ ν) n j) →+
      positiveCohomology F S ν (n + 1) j := sorry

/-- The long exact sequence `⊕_σ H^n(ℝ) → H^{n+1}_+ → H^{n+1} → ⊕_σ H^{n+1}(ℝ)`, at its two
middle terms. -/
theorem positive_long_exact (F : Type) [Field F] [NumberField F]
    (S : Finset (HeightOneSpectrum (𝓞 F))) (ν n : ℕ) (j : ℤ) :
    Function.Exact (positiveBoundary F S ν n j) (positiveToOrdinary F S ν (n + 1) j) ∧
      Function.Exact (positiveToOrdinary F S ν (n + 1) j) (alpha F S ν (n + 1) j) := sorry

/-- `0 → coker α^n → H^{n+1}_+ → H̃^{n+1} → 0`. -/
theorem positive_to_kernel (F : Type) [Field F] [NumberField F]
    (S : Finset (HeightOneSpectrum (𝓞 F))) (ν n : ℕ) (j : ℤ) :
    (positiveToOrdinary F S ν (n + 1) j).range = kernelCohomology F S ν (n + 1) j ∧
      (positiveBoundary F S ν n j).ker = (alpha F S ν n j).range := sorry

example (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F))) (ν n : ℕ)
    (j : ℤ) (h : InfinitePlace.nrRealPlaces F = 0) :
    Function.Bijective (positiveToOrdinary F S ν n j) ∧ kernelCohomology F S ν n j = ⊤ :=
  sorry -- test_totally_imaginary_agree

example (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (h2 : IsUnit ((2 : ℕ) : OS F S)) (n : ℕ) (hn : 3 ≤ n) :
    kernelCohomology F S 1 n 0 = ⊥ ∧ Subsingleton (positiveCohomology F S 1 n 0) ∧
      Nonempty (TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (2 ^ 1) n 0 ≃+
        ({v : InfinitePlace F // v.IsReal} → ZMod 2)) := sorry -- test_high_degree

example (S : Finset (HeightOneSpectrum (𝓞 ℚ))) (h2 : IsUnit ((2 : ℕ) : OS ℚ S)) :
    Nonempty (TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS ℚ S))) (2 ^ 1) 3 0 ≃+ ZMod 2) ∧
      kernelCohomology ℚ S 1 3 0 = ⊥ := sorry -- test_not_ordinary

/-- `M.2/high-degree-real-isomorphism` (b), finite coefficients. -/
theorem alpha_bijective_of_three_le (F : Type) [Field F] [NumberField F]
    (S : Finset (HeightOneSpectrum (𝓞 F))) (h2 : IsUnit ((2 : ℕ) : OS F S)) (ν n : ℕ) (j : ℤ)
    (hn : 3 ≤ n) : Function.Bijective (alpha F S ν n j) := sorry

/-- `M.2/mod-two-dimension-formulas` (a): `dim H¹_et(O_{F,S}, ℤ/2) = r₁ + r₂ + s + t`. -/
theorem dim_H1_modTwo (F : Type) [Field F] [NumberField F] (S : Finset (HeightOneSpectrum (𝓞 F)))
    (h2 : IsUnit ((2 : ℕ) : OS F S)) (hr : 0 < InfinitePlace.nrRealPlaces F) :
    Nat.card (TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) 2 1 0) =
      2 ^ (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F + S.card) *
        Nat.card (Additive (CommRing.Pic (OS F S)) ⧸
          (nsmulAddMonoidHom (α := Additive (CommRing.Pic (OS F S))) 2).range) := sorry

/-- `M.2/adic-s-integer-cohomology` (a): the finite-level groups are finite. -/
theorem adic_s_integer_finite (F : Type) [Field F] [NumberField F]
    (S : Finset (HeightOneSpectrum (𝓞 F))) (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : IsUnit ((ℓ : ℕ) : OS F S))
    (ν n : ℕ) (j : ℤ) : Finite (TauCeti.EtaleTwist.H (Spec (CommRingCat.of (OS F S))) (ℓ ^ ν) n j) :=
  sorry

end TauCeti.RealPlaces

/-! ## M.3 — the Galois symbol and Tate's theorems -/

namespace TauCeti.GaloisSymbol

open TauCeti.TateTwist

/-- Classical `K₂` of a field (K2SymbolsBrauer T.1), a supplier carrier here. -/
def K2 (F : Type) [Field F] : Type := sorry

instance (F : Type) [Field F] : AddCommGroup (K2 F) := sorry

/-- The Steinberg symbol `{a, b}` (K2SymbolsBrauer T.2). -/
def steinberg (F : Type) [Field F] : Additive Fˣ →+ Additive Fˣ →+ K2 F := sorry

/-- `M.3/cohomological-steinberg`. -/
theorem cohomological_steinberg (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (a : Fˣ)
    (ha : (a : F) ≠ 1) (hb : IsUnit (1 - (a : F))) :
    cup F m 1 1 1 1 (kummer F m (Additive.ofMul a)) (kummer F m (Additive.ofMul hb.unit)) = 0 :=
  sorry

/-- `M.3/galois-symbol`: `h_{F,m} : K₂(F) → H²(F, μ_m^{⊗2})`, killing `m K₂(F)`. -/
def symbol (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] : K2 F →+ H F m 2 2 := sorry

theorem symbol_steinberg (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (a b : Fˣ) :
    symbol F m (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      cup F m 1 1 1 1 (kummer F m (Additive.ofMul a)) (kummer F m (Additive.ofMul b)) := sorry

theorem symbol_mul_m (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (x : K2 F) :
    symbol F m (m • x) = 0 := sorry

theorem symbol_unique (F : Type) [Field F] (m : ℕ) {A : Type} [AddCommGroup A] (f g : K2 F →+ A)
    (h : ∀ a b : Fˣ, f (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      g (steinberg F (Additive.ofMul a) (Additive.ofMul b))) : f = g := sorry

/-- Functoriality of `K₂` along a field extension (K2SymbolsBrauer), supplier carrier. -/
def K2map (F E : Type) [Field F] [Field E] [Algebra F E] : K2 F →+ K2 E := sorry

theorem symbol_res (F E : Type) [Field F] [Field E] [Algebra F E] (m : ℕ) [NeZero (m : F)]
    [NeZero (m : E)] (x : K2 F) :
    resH F E m 2 2 (symbol F m x) = symbol E m (K2map F E x) := sorry

theorem symbol_reduce (F : Type) [Field F] {m m' : ℕ} [NeZero (m : F)] [NeZero (m' : F)]
    (h : m ∣ m') (x : K2 F) : reduceH F h 2 2 (symbol F m' x) = symbol F m x := sorry

theorem symbol_skew (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (a b : Fˣ) :
    symbol F m (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      - symbol F m (steinberg F (Additive.ofMul b) (Additive.ofMul a)) ∧
    symbol F m (steinberg F (Additive.ofMul a) (Additive.ofMul (-a))) = 0 := sorry

/-- For `m = 1` the symbol is the zero map between zero groups, and `h{a, c^m} = 0`. -/
example (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] :
    (Subsingleton (H F 1 2 2) ∧ symbol F 1 = 0) ∧
      ∀ a c : Fˣ, symbol F m (steinberg F (Additive.ofMul a) (Additive.ofMul (c ^ m))) = 0 :=
  sorry -- test_one

example : symbol ℝ 2 (steinberg ℝ (Additive.ofMul (-1 : ℝˣ)) (Additive.ofMul (-1 : ℝˣ))) ≠ 0 :=
  sorry -- test_hamilton

/-- `h_{ℚ,3}{3, 7} ≠ 0`, while every `G_ℚ`-equivariant biadditive pairing `μ_3 × μ_3 → μ_3` is zero. -/
example :
    symbol ℚ 3 (steinberg ℚ (Additive.ofMul (Units.mk0 (3 : ℚ) (by norm_num)))
      (Additive.ofMul (Units.mk0 (7 : ℚ) (by norm_num)))) ≠ 0 ∧
    ∀ φ : ZMod 3 →+ ZMod 3 →+ ZMod 3,
      (∀ (g : GF ℚ) (x y : ZMod 3),
        φ (finite ℚ 3 1 g x) (finite ℚ 3 1 g y) = finite ℚ 3 1 g (φ x y)) → φ = 0 :=
  sorry -- test_not_untwisted

/-- `M.3/adic-galois-symbol`: Tate's `h_F : K₂(F) → H²(F, ℤ_ℓ(2))`. -/
def adicSymbol (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    K2 F →+ Hcont F ℓ 2 2 := sorry

/-- The `ℓ`-adic Kummer map `d_F` and cup product on continuous cohomology. -/
def kummerCont (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    Additive Fˣ →+ Hcont F ℓ 1 1 := sorry

def cupCont (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (i k : ℕ) (a b : ℤ) :
    Hcont F ℓ i a →+ Hcont F ℓ k b →+ Hcont F ℓ (i + k) (a + b) := sorry

/-- Restriction on continuous cohomology along `E/F`. -/
def resCont (F E : Type) [Field F] [Field E] [Algebra F E] (ℓ : ℕ) [Fact ℓ.Prime]
    [NeZero (ℓ : F)] [NeZero (ℓ : E)] (i : ℕ) (j : ℤ) : Hcont F ℓ i j →+ Hcont E ℓ i j := sorry

theorem adicSymbol_steinberg (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)]
    (a b : Fˣ) :
    adicSymbol F ℓ (steinberg F (Additive.ofMul a) (Additive.ofMul b)) =
      cupCont F ℓ 1 1 1 1 (kummerCont F ℓ (Additive.ofMul a)) (kummerCont F ℓ (Additive.ofMul b)) :=
  sorry

theorem adicSymbol_reduce (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] (ν : ℕ)
    (x : K2 F) : toFinite F ℓ 2 2 ν (adicSymbol F ℓ x) = symbol F (ℓ ^ ν) x := sorry

theorem adicSymbol_divisible (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)]
    (x : K2 F) (hx : ∀ n : ℕ, ∃ y, x = ℓ ^ n • y) : adicSymbol F ℓ x = 0 := sorry

theorem adicSymbol_res (F E : Type) [Field F] [Field E] [Algebra F E] (ℓ : ℕ) [Fact ℓ.Prime]
    [NeZero (ℓ : F)] [NeZero (ℓ : E)] (x : K2 F) :
    resCont F E ℓ 2 2 (adicSymbol F ℓ x) = adicSymbol E ℓ (K2map F E x) := sorry

example (F : Type) [Field F] [IsAlgClosed F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    Subsingleton (Hcont F ℓ 2 2) ∧ adicSymbol F ℓ = 0 := sorry -- test_adic_closed

/-- `h_F{a, b} = 0` for `b` an `ℓ^ν`-th power for every `ν`; for `F = ℂ`, `h_F = 0`. -/
example (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    (∀ a b : Fˣ, (∀ ν : ℕ, ∃ c : Fˣ, b = c ^ (ℓ ^ ν)) →
      adicSymbol F ℓ (steinberg F (Additive.ofMul a) (Additive.ofMul b)) = 0) ∧
    adicSymbol ℂ ℓ = 0 := sorry -- test_adic_one

example :
    toFinite ℚ 2 2 2 1 (adicSymbol ℚ 2 (steinberg ℚ (Additive.ofMul (-1 : ℚˣ))
        (Additive.ofMul (-1 : ℚˣ)))) =
      symbol ℚ (2 ^ 1) (steinberg ℚ (Additive.ofMul (-1 : ℚˣ)) (Additive.ofMul (-1 : ℚˣ))) ∧
    symbol ℚ (2 ^ 1) (steinberg ℚ (Additive.ofMul (-1 : ℚˣ)) (Additive.ofMul (-1 : ℚˣ))) ≠ 0 :=
  sorry -- test_adic_reduce

example (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (F : Type) [Field F] [Algebra ℚ_[p] F]
    [FiniteDimensional ℚ_[p] F] [NeZero (ℓ : F)] :
    ¬ Function.Injective (adicSymbol F ℓ) := sorry -- test_adic_not_injective

/-- The Milnor norm `N_{E/F}` on `K₂` (K2SymbolsBrauer T.4), supplier carrier. -/
def norm (F E : Type) [Field F] [Field E] [Algebra F E] : K2 E →+ K2 F := sorry

/-- `M.3/symbol-norm-compatibility`, for `E/F` finite separable (the purely inseparable case
uses multiplication by the degree). -/
theorem symbol_norm (F E : Type) [Field F] [Field E] [Algebra F E] [FiniteDimensional F E]
    [Algebra.IsSeparable F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)] (x : K2 E) :
    corH F E m 2 2 (symbol E m x) = symbol F m (norm F E x) := sorry

/-- `M.3/tate-injectivity-criterion` (b): with `μ_ℓ ⊂ F`, `{a, b} ∈ ℓK₂F ⟺ h_{F,ℓ}{a, b} = 0`. -/
theorem tate_injectivity_criterion (F : Type) [Field F] (ℓ : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)]
    (z : Fˣ) (hz : IsPrimitiveRoot z ℓ) (a b : Fˣ) :
    (∃ y : K2 F, steinberg F (Additive.ofMul a) (Additive.ofMul b) = ℓ • y) ↔
      symbol F ℓ (steinberg F (Additive.ofMul a) (Additive.ofMul b)) = 0 := sorry

/-- `M.3/tate-gamma-kernel` (b), rank part: `dim_{ℚ_ℓ} H¹(F, ℚ_ℓ(2)) = r₂` for a number field. -/
theorem tate_gamma_kernel_rank (F : Type) [Field F] [NumberField F] (ℓ : ℕ) [Fact ℓ.Prime]
    [NeZero (ℓ : F)] :
    Module.finrank ℚ_[ℓ] (Hrat F ℓ 1 2) = NumberField.InfinitePlace.nrComplexPlaces F := sorry

/-- `M.3/tate-local`, for a finite extension of `ℚ_p` and a prime `ℓ`. -/
theorem tate_local (p ℓ : ℕ) [Fact p.Prime] [Fact ℓ.Prime] (F : Type) [Field F] [Algebra ℚ_[p] F]
    [FiniteDimensional ℚ_[p] F] [NeZero (ℓ : F)] :
    Function.Surjective (symbol F ℓ) ∧ (symbol F ℓ).ker = AddSubgroup.map (nsmulAddMonoidHom ℓ) ⊤ :=
  sorry

/-- `M.3/tate-global` (a), (c): `K₂(F)/ℓ^r ≅ H²(F, μ_{ℓ^r}^{⊗2})` for a number field. -/
theorem tate_global (F : Type) [Field F] [NumberField F] (ℓ r : ℕ) [Fact ℓ.Prime]
    [NeZero (ℓ : F)] :
    Function.Surjective (symbol F (ℓ ^ r)) ∧
      (symbol F (ℓ ^ r)).ker = AddSubgroup.map (nsmulAddMonoidHom (ℓ ^ r)) ⊤ := sorry

/-- `M.3/tate-torsion-symbols`: with a primitive `ℓ`-th root `z`, every element of order `ℓ`
in `K₂(F)` is `{z, a}`. -/
theorem tate_torsion_symbols (F : Type) [Field F] [NumberField F] (ℓ : ℕ) [Fact ℓ.Prime]
    (z : Fˣ) (hz : IsPrimitiveRoot z ℓ) (x : K2 F) (hx : ℓ • x = 0) :
    ∃ a : Fˣ, x = steinberg F (Additive.ofMul z) (Additive.ofMul a) := sorry

end TauCeti.GaloisSymbol

/-! ## M.4 — cycle complexes and motivic cohomology -/

namespace TauCeti.HigherChow

open AlgebraicGeometry

/-- The algebraic `n`-simplex `Δ^n_B` (`M.4/algebraic-simplex`). -/
def simplex (B : Scheme.{0}) (n : ℕ) : Scheme.{0} := sorry

def coface (B : Scheme.{0}) (n : ℕ) (i : Fin (n + 2)) : simplex B n ⟶ simplex B (n + 1) := sorry

def codegeneracy (B : Scheme.{0}) (n : ℕ) (i : Fin (n + 1)) :
    simplex B (n + 1) ⟶ simplex B n := sorry

theorem cosimplicial_identities (B : Scheme.{0}) (n : ℕ) (i j : Fin (n + 2)) (hij : i ≤ j) :
    coface B n i ≫ coface B (n + 1) j.succ = coface B n j ≫ coface B (n + 1) i.castSucc := sorry

theorem simplex_iso_affine (B : Scheme.{0}) (n : ℕ) :
    Nonempty (simplex B n ≅ 𝔸(ULift.{0} (Fin n); B)) := sorry

/-- The cube `□^n_B = (ℙ¹_B ∖ {1})^n`. -/
def cube (B : Scheme.{0}) (n : ℕ) : Scheme.{0} := sorry

/-- `Δ(g) : Δ^m_B → Δ^n_B` for an order-preserving `g : [m] → [n]`. -/
def simplexMap (B : Scheme.{0}) {m n : ℕ} (g : Fin (m + 1) →o Fin (n + 1)) :
    simplex B m ⟶ simplex B n := sorry

/-- The cube faces `δ^ε_i : □^n_B → □^{n+1}_B` (`ε = true` for `∞`, `false` for `0`). -/
def cubeFace (B : Scheme.{0}) (n : ℕ) (i : Fin (n + 1)) (ε : Bool) : cube B n ⟶ cube B (n + 1) :=
  sorry

theorem cube_iso_affine (B : Scheme.{0}) (n : ℕ) :
    Nonempty (cube B n ≅ 𝔸(ULift.{0} (Fin n); B)) := sorry

/-- The structure morphism `Δ^n_B → B`. -/
def simplexStructure (B : Scheme.{0}) (n : ℕ) : simplex B n ⟶ B := sorry

example (k : Type) [Field k] :
    Nonempty (simplex (Spec (CommRingCat.of k)) 1 ≅ 𝔸(ULift.{0} (Fin 1); Spec (CommRingCat.of k))) :=
  sorry -- test_simplex_one

example (B B' : Scheme.{0}) (f : B' ⟶ B) (n : ℕ) :
    Nonempty (simplex B' n ≅ Limits.pullback (simplexStructure B n) f) := sorry -- test_base_change

example (B : Scheme.{0}) : Nonempty (simplex B 0 ≅ B) := sorry -- test_simplex_zero

/-- `z^q(X, n)`: admissible codimension-`q` cycles on `X × Δ^n`, as a subgroup of Mathlib's
algebraic cycles (`M.4/admissible-cycles`). -/
def cycles (X : Scheme.{0}) (q n : ℕ) : AddSubgroup (AlgebraicCycle (simplex X n) ℤ) := sorry

def face_restrict (X : Scheme.{0}) (q n : ℕ) (i : Fin (n + 2)) :
    cycles X q (n + 1) →+ cycles X q n := sorry

/-- Dimension-indexed admissible cycles `z_r(X, n)` over a Dedekind base. -/
def cyclesDim (X : Scheme.{0}) (r : ℤ) (n : ℕ) : AddSubgroup (AlgebraicCycle (simplex X n) ℤ) := sorry

/-- Bloch's higher Chow groups `CH^q(X, n)` (`M.4/cycle-complex`). -/
def CH (X : Scheme.{0}) (q n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (q n : ℕ) : AddCommGroup (CH X q n) := sorry

/-- Dimension-indexed higher Chow groups `CH_r(X, n)`. -/
def CHdim (X : Scheme.{0}) (r : ℤ) (n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (r : ℤ) (n : ℕ) : AddCommGroup (CHdim X r n) := sorry

/-- The cycle complex `z^q(X, •)` as a chain complex of abelian groups. -/
def complex (X : Scheme.{0}) (q : ℕ) : ChainComplex AddCommGrpCat.{0} ℕ := sorry

/-- Motivic cohomology `H^p(X, ℤ(q)) = CH^q(X, 2q - p)`, with `A` coefficients. -/
def H (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (q : ℕ) : Type := sorry

instance (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (q : ℕ) :
    AddCommGroup (H X A p q) := sorry

/-- Reduction of coefficients `ℤ(q) → ℤ/m(q)` and the Bockstein `H^p(ℤ/m(q)) → H^{p+1}(ℤ(q))`. -/
def reduceCoeff (X : Scheme.{0}) (m : ℕ) (p : ℤ) (q : ℕ) : H X ℤ p q →+ H X (ZMod m) p q := sorry

def bocksteinCoeff (X : Scheme.{0}) (m : ℕ) (p : ℤ) (q : ℕ) : H X (ZMod m) p q →+ H X ℤ (p + 1) q :=
  sorry

/-- `0 → H^p(X, ℤ(q))/m → H^p(X, ℤ/m(q)) → H^{p+1}(X, ℤ(q))[m] → 0`. -/
theorem H_mod_m (X : Scheme.{0}) (m : ℕ) (p : ℤ) (q : ℕ) :
    (reduceCoeff X m p q).ker = (nsmulAddMonoidHom (α := H X ℤ p q) m).range ∧
      Function.Exact (reduceCoeff X m p q) (bocksteinCoeff X m p q) ∧
      (bocksteinCoeff X m p q).range = (nsmulAddMonoidHom (α := H X ℤ (p + 1) q) m).ker := sorry

theorem CH_neg (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (q : ℕ) (h : 2 * (q : ℤ) < p)
    (x : H X A p q) : x = 0 := sorry

example (F : Type) [Field F] : Nonempty (CH (Spec (CommRingCat.of F)) 0 0 ≃+ ℤ) ∧
    ∀ n, 0 < n → Subsingleton (CH (Spec (CommRingCat.of F)) 0 n) := sorry -- test_q_zero

example (F : Type) [Field F] : Nonempty (CH (Spec (CommRingCat.of F)) 1 1 ≃+ Additive Fˣ) :=
  sorry -- test_field_weight_one

/-- Admissible cubical cycles modulo degenerate ones. -/
def cubeCycles (X : Scheme.{0}) (q n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (q n : ℕ) : AddCommGroup (cubeCycles X q n) := sorry

/-- The cubical differential, external product and cubical higher Chow groups. -/
def cubeDiff (X : Scheme.{0}) (q n : ℕ) : cubeCycles X q (n + 1) →+ cubeCycles X q n := sorry

theorem cube_d_sq (X : Scheme.{0}) (q n : ℕ) :
    (cubeDiff X q n).comp (cubeDiff X q (n + 1)) = 0 := sorry

def cubeProduct {k : Type} [Field k] {X Y : Scheme.{0}} (f : X ⟶ Spec (CommRingCat.of k))
    (g : Y ⟶ Spec (CommRingCat.of k)) (p r n m : ℕ) :
    cubeCycles X p n →+ cubeCycles Y r m →+ cubeCycles (Limits.pullback f g) (p + r) (n + m) := sorry

/-- The face maps `∂^ε_i : z^q_□(X, n+1) → z^q_□(X, n)` and flat pullback on cubical cycles. -/
def cubeFaceMap (X : Scheme.{0}) (q n : ℕ) (i : Fin (n + 1)) (ε : Bool) :
    cubeCycles X q (n + 1) →+ cubeCycles X q n := sorry

def cubeMap {Y X : Scheme.{0}} (f : Y ⟶ X) [Flat f] (q n : ℕ) : cubeCycles X q n →+ cubeCycles Y q n :=
  sorry

def CHcube (X : Scheme.{0}) (q n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (q n : ℕ) : AddCommGroup (CHcube X q n) := sorry

/-- `M.4/simplicial-cubical-comparison`. -/
theorem simplicial_cubical_comparison (X : Scheme.{0}) (q n : ℕ) :
    Nonempty (CH X q n ≃+ CHcube X q n) := sorry

example (X : Scheme.{0}) (q : ℕ) : Nonempty (cubeCycles X q 0 ≃+ cycles X q 0) :=
  sorry -- test_cube_zero

example (X : Scheme.{0}) (q n : ℕ) : Nonempty (CH X q n ≃+ CHcube X q n) :=
  sorry -- test_cube_vs_simplex

/-- Milnor K-theory of a field (K2SymbolsBrauer T.2), supplier carrier, and the Milnor symbol
`{a₁, …, aₙ}`. -/
def KM (F : Type) [Field F] (n : ℕ) : Type := sorry

instance (F : Type) [Field F] (n : ℕ) : AddCommGroup (KM F n) := sorry

def milnorSymbol (F : Type) [Field F] (n : ℕ) : (Fin n → Fˣ) → KM F n := sorry

/-- The cycle `(a₁, …, aₙ) ∈ □^n_F`. -/
def milnorCycle (F : Type) [Field F] (n : ℕ) (a : Fin n → Fˣ) :
    cubeCycles (Spec (CommRingCat.of F)) n n := sorry

example (F : Type) [Field F] (a : Fˣ) (ha : (a : F) ≠ 1) :
    cubeDiff (Spec (CommRingCat.of F)) 1 0 (milnorCycle F 1 ![a]) = 0 := sorry -- test_cube_point

/-- Pullback (`M.4/functoriality`, `M.4/products`). -/
def pullback {Y X : Scheme.{0}} (f : Y ⟶ X) (q n : ℕ) : CH X q n →+ CH Y q n := sorry

def extProduct {k : Type} [Field k] {X Y : Scheme.{0}} (f : X ⟶ Spec (CommRingCat.of k))
    (g : Y ⟶ Spec (CommRingCat.of k)) (p r n m : ℕ) :
    CH X p n →+ CH Y r m →+ CH (Limits.pullback f g) (p + r) (n + m) := sorry

def cup (X : Scheme.{0}) (q r n s : ℕ) : CH X q n →+ CH X r s →+ CH X (q + r) (n + s) := sorry

/-- The unit `[X] ∈ CH^0(X, 0)` and the class of a unit of a field in `CH^1(F, 1)`. -/
def fundamentalClass (X : Scheme.{0}) : CH X 0 0 := sorry

def unitClass (F : Type) [Field F] : Additive Fˣ →+ CH (Spec (CommRingCat.of F)) 1 1 := sorry

example (X : Scheme.{0}) (q n : ℕ) (x : CH X q n) :
    HEq (cup X 0 q 0 n (fundamentalClass X) x) x := sorry -- test_unit

example (F : Type) [Field F] (a : Fˣ) :
    cup _ 1 1 1 1 (unitClass F (Additive.ofMul a)) (unitClass F (Additive.ofMul a)) =
      cup _ 1 1 1 1 (unitClass F (Additive.ofMul a)) (unitClass F (Additive.ofMul (-1))) ∧
    cup _ 1 1 1 1 (unitClass ℝ (Additive.ofMul (-1))) (unitClass ℝ (Additive.ofMul (-1))) ≠ 0 :=
  sorry -- test_sign

theorem cup_comm (X : Scheme.{0}) (q r n s : ℕ) (x : CH X q n) (y : CH X r s) :
    HEq (cup X q r n s x y) ((-1 : ℤ) ^ (n * s) • cup X r q s n y x) := sorry

/-- Proper pushforward and open restriction on the dimension-indexed groups. -/
def pushforwardDim {Z X : Scheme.{0}} (i : Z ⟶ X) (r : ℤ) (n : ℕ) : CHdim Z r n →+ CHdim X r n :=
  sorry

def restrictDim {U X : Scheme.{0}} (j : U ⟶ X) (r : ℤ) (n : ℕ) : CHdim X r n →+ CHdim U r n :=
  sorry

/-- `M.4/functoriality` (b), (c): proper pushforward is functorial. -/
theorem pushforwardDim_comp {Z Y X : Scheme.{0}} (f : Z ⟶ Y) (g : Y ⟶ X) [IsProper f] [IsProper g]
    (r : ℤ) (n : ℕ) : pushforwardDim (f ≫ g) r n = (pushforwardDim g r n).comp (pushforwardDim f r n) :=
  sorry

/-- `M.4/localization-sequence`, exactness at `CH_r(X, n)` for a closed immersion `i` with open
complement `j` (dimension indexing). -/
theorem localization_exact {Z X U : Scheme.{0}} (i : Z ⟶ X) (j : U ⟶ X) [IsClosedImmersion i]
    [IsOpenImmersion j] (hc : ∀ x, x ∈ Set.range i.base ↔ x ∉ Set.range j.base) (r : ℤ) (n : ℕ) :
    Function.Exact (pushforwardDim i r n) (restrictDim j r n) := sorry

/-- `M.4/homotopy-invariance`. -/
theorem homotopy_invariance (X : Scheme.{0}) (q n : ℕ) :
    Function.Bijective (pullback (𝔸(ULift.{0} (Fin 1); X) ↘ X) q n) := sorry

/-- `M.4/nesterenko-suslin-totaro`. -/
theorem nesterenko_suslin_totaro (F : Type) [Field F] (n : ℕ) :
    Nonempty (KM F n ≃+ CH (Spec (CommRingCat.of F)) n n) := sorry

/-- `M.4/vanishing-above-weight`: `CH^i(F, n) = 0` for `n < i`. -/
theorem CH_field_eq_zero (F : Type) [Field F] (i n : ℕ) (h : n < i)
    (x : CH (Spec (CommRingCat.of F)) i n) : x = 0 := sorry

/-- `M.4/weight-zero-and-one` for a field: `H¹(F, ℤ(1)) ≅ F^×`. -/
theorem weight_one_field (F : Type) [Field F] :
    Nonempty (H (Spec (CommRingCat.of F)) ℤ 1 1 ≃+ Additive Fˣ) := sorry

/-- `M.4/weight-two-symbol-comparison` (a): `H²(F, ℤ(2)) ≅ K₂(F)`. -/
theorem weight_two_symbol_comparison (F : Type) [Field F] :
    Nonempty (H (Spec (CommRingCat.of F)) ℤ 2 2 ≃+ TauCeti.GaloisSymbol.K2 F) := sorry

/-- Motivic cohomology of a scheme over a Dedekind base (`M.4/dedekind-cycle-complex`). -/
def dedekind_H (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (n : ℕ) : Type := sorry

instance (X : Scheme.{0}) (A : Type) [AddCommGroup A] (p : ℤ) (n : ℕ) :
    AddCommGroup (dedekind_H X A p n) := sorry

/-- Flat pullback on the Dedekind-base groups. -/
def dedekind_flat_pullback {Y X : Scheme.{0}} (f : Y ⟶ X) [Flat f] (A : Type) [AddCommGroup A]
    (p : ℤ) (n : ℕ) : dedekind_H X A p n →+ dedekind_H Y A p n := sorry

example : Nonempty (dedekind_H (Spec (CommRingCat.of ℤ)) ℤ 0 0 ≃+ ℤ) :=
  sorry -- test_dedekind_weight_zero

example : Nonempty (dedekind_H (Spec (CommRingCat.of (Localization.Away (2 : ℤ)))) ℤ 1 1 ≃+
    Additive (Localization.Away (2 : ℤ))ˣ) ∧
    Subsingleton (dedekind_H (Spec (CommRingCat.of (Localization.Away (2 : ℤ)))) ℤ 2 1) :=
  sorry -- test_dedekind_units

/-- Over the spectrum of a discrete valuation ring, `H^p(X, ℤ(n)) ≅ H_{2n−p}(z^n(X, •))`. -/
theorem dedekind_H_eq_homology_of_local (R : Type) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] (X : Scheme.{0}) (f : X ⟶ Spec (CommRingCat.of R)) (p : ℤ) (n : ℕ)
    (h : p ≤ 2 * n) : Nonempty (dedekind_H X ℤ p n ≃+ CH X n (2 * n - p).toNat) := sorry

end TauCeti.HigherChow

/-! ## M.5a — transfers and effective motives -/

namespace TauCeti.Transfers

open AlgebraicGeometry

/-- `Cor_k(X, Y)` (`M.5a/finite-correspondence`). -/
def Cor (k : Type) [Field k] (X Y : Scheme.{0}) : Type := sorry

instance (k : Type) [Field k] (X Y : Scheme.{0}) : AddCommGroup (Cor k X Y) := sorry

def graph (k : Type) [Field k] {X Y : Scheme.{0}} (f : X ⟶ Y) : Cor k X Y := sorry

def comp (k : Type) [Field k] {X Y Z : Scheme.{0}} : Cor k Y Z →+ Cor k X Y →+ Cor k X Z := sorry

theorem comp_assoc (k : Type) [Field k] {X Y Z W : Scheme.{0}} (f : Cor k X Y) (g : Cor k Y Z)
    (h : Cor k Z W) : comp k h (comp k g f) = comp k (comp k h g) f := sorry

theorem graph_comp (k : Type) [Field k] {X Y Z : Scheme.{0}} (f : X ⟶ Y) (g : Y ⟶ Z) :
    comp k (graph k g) (graph k f) = graph k (f ≫ g) := sorry

/-- The transpose `Γ_f^t ∈ Cor_k(X, Y)` of a finite surjective `f : Y → X`. -/
def transpose_finite (k : Type) [Field k] {X Y : Scheme.{0}} (f : Y ⟶ X) [IsFinite f]
    (hf : Function.Surjective f.base) : Cor k X Y := sorry

example (k : Type) [Field k] (Y : Scheme.{0}) : Subsingleton (Cor k (Spec (CommRingCat.of PUnit.{1})) Y) :=
  sorry -- test_empty

/-- Presheaves and Nisnevich sheaves with transfers, and `ℤ_tr(X)`. -/
def PST (k : Type) [Field k] : Type 1 := sorry

def NST (k : Type) [Field k] : Type 1 := sorry

/-- Étale sheaves with transfers. -/
def EST (k : Type) [Field k] : Type 1 := sorry

/-- The tensor product `F ⊗_tr G` of presheaves with transfers (`M.5a/tensor-product-transfers`). -/
def tensorTr (k : Type) [Field k] : PST k → PST k → PST k := sorry

def ztr (k : Type) [Field k] (X : Scheme.{0}) : PST k := sorry

/-- The effective motives `DM^{eff,−}_Nis(k, R)` (`M.5a/effective-motives`). -/
def DMeff (k : Type) [Field k] (R : Type) [CommRing R] : Type 1 := sorry

/-- The étale analogue `DM^{eff,−}_et(k, R)`. -/
def DMeffEt (k : Type) [Field k] (R : Type) [CommRing R] : Type 1 := sorry

/-- Motivic cohomology `H^{p,q}(X, R)` of `M.5a/suslin-complex-and-motivic-complexes`. -/
def motivicCohomology (k : Type) [Field k] (X : Scheme.{0}) (R : Type) [CommRing R] (p : ℤ)
    (q : ℕ) : Type := sorry

instance (k : Type) [Field k] (X : Scheme.{0}) (R : Type) [CommRing R] (p : ℤ) (q : ℕ) :
    AddCommGroup (motivicCohomology k X R p q) := sorry

/-- Pullback on motivic cohomology and the product `H^{p,q} × H^{p',q'} → H^{p+p',q+q'}`. -/
def pullback (k : Type) [Field k] {X Y : Scheme.{0}} (f : X ⟶ Y) (R : Type) [CommRing R] (p : ℤ)
    (q : ℕ) : motivicCohomology k Y R p q →+ motivicCohomology k X R p q := sorry

def mul (k : Type) [Field k] (X : Scheme.{0}) (R : Type) [CommRing R] (p p' : ℤ) (q q' : ℕ) :
    motivicCohomology k X R p q →+ motivicCohomology k X R p' q' →+
      motivicCohomology k X R (p + p') (q + q') := sorry

example (k : Type) [Field k] :
    Nonempty (motivicCohomology k (Spec (CommRingCat.of k)) ℤ 0 0 ≃+ ℤ) ∧
      ∀ p : ℤ, p ≠ 0 → Subsingleton (motivicCohomology k (Spec (CommRingCat.of k)) ℤ p 0) :=
  sorry -- test_weight_zero

theorem diagonal_milnor (k : Type) [Field k] (n : ℕ) :
    Nonempty (motivicCohomology k (Spec (CommRingCat.of k)) ℤ n n ≃+ TauCeti.HigherChow.KM k n) :=
  sorry

example (k : Type) [Field k] :
    Nonempty (motivicCohomology k (Spec (CommRingCat.of k)) ℤ 1 1 ≃+ Additive kˣ) :=
  sorry -- test_weight_one_field

example (k : Type) [Field k] (p : ℤ) (q : ℕ) (h : (q : ℤ) < p) :
    Subsingleton (motivicCohomology k (Spec (CommRingCat.of k)) ℤ p q) :=
  sorry -- test_negative_vanish

example (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (f : X ⟶ Spec (CommRingCat.of k))
    [Smooth f] (p : ℤ) (q : ℕ) :
    Nonempty (motivicCohomology k X ℤ p q ≃+ TauCeti.HigherChow.H X ℤ p q) :=
  sorry -- test_vs_cycle_complex

/-- `M.5a/etale-motivic-comparison` (b): the map to étale cohomology. -/
def toEtale (k : Type) [Field k] (X : Scheme.{0}) (n : ℕ) (p : ℕ) (q : ℕ) :
    motivicCohomology k X (ZMod n) p q →+ TauCeti.EtaleTwist.H X n p q := sorry

/-- Morphism groups of `DM^{eff,−}`, the motive `M(X)`, the Tate objects `R(q)[p]` and the
twist `− ⊗ ℤ(1)`. -/
def DMHom (k : Type) [Field k] (R : Type) [CommRing R] (M N : DMeff k R) : Type := sorry

def motive (k : Type) [Field k] (R : Type) [CommRing R] (X : Scheme.{0}) : DMeff k R := sorry

def tate (k : Type) [Field k] (R : Type) [CommRing R] (q : ℕ) (p : ℤ) : DMeff k R := sorry

def tateTwist (k : Type) [Field k] (R : Type) [CommRing R] : DMeff k R → DMeff k R := sorry

def twistHom (k : Type) [Field k] (R : Type) [CommRing R] (M N : DMeff k R) :
    DMHom k R M N → DMHom k R (tateTwist k R M) (tateTwist k R N) := sorry

theorem hom_motive_tate (k : Type) [Field k] [PerfectField k] (R : Type) [CommRing R]
    (X : Scheme.{0}) (f : X ⟶ Spec (CommRingCat.of k)) [Smooth f] (p : ℤ) (q : ℕ) : Nonempty (DMHom k R (motive k R X) (tate k R q p) ≃ motivicCohomology k X R p q) :=
  sorry

/-- `Hom(M(X), ℤ(1)[2]) ≅ CH^1(X) = CH^1(X, 0)` for `X` smooth over a perfect field. -/
example (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (f : X ⟶ Spec (CommRingCat.of k))
    [Smooth f] :
    Nonempty (DMHom k ℤ (motive k ℤ X) (tate k ℤ 1 2) ≃ TauCeti.HigherChow.CH X 1 0) :=
  sorry -- test_hom_cycles

/-- `M.5a/cancellation`: tensoring with `ℤ(1)` is bijective on morphisms over a perfect field. -/
theorem cancellation (k : Type) [Field k] [PerfectField k] (M N : DMeff k ℤ) :
    Function.Bijective (twistHom k ℤ M N) := sorry

end TauCeti.Transfers

/-! ## M.5b — operations and norm varieties -/

namespace TauCeti.MotivicSteenrod

open AlgebraicGeometry TauCeti.Transfers

/-- `M.5b/motivic-steenrod-operations`: `P^i` and `β` on `H^{p,q}(X, ℤ/l)`. -/
def reducedPower (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (i : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+
      motivicCohomology k X (ZMod l) (p + 2 * i * (l - 1)) (q + i * (l - 1)) := sorry

def bockstein (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+ motivicCohomology k X (ZMod l) (p + 1) q := sorry

/-- `P^0 = Id` (`M.5b/steenrod-relations`). -/
theorem reducedPower_zero (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    HEq (reducedPower k X l 0 p q x) x := sorry

theorem bockstein_bockstein (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    bockstein k X l (p + 1) q (bockstein k X l p q x) = 0 := sorry

example (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    HEq (reducedPower k X l 0 p q x) x := sorry -- test_P0

/-- `β` and `P^i` commute with pullback. -/
theorem natural (k : Type) [Field k] [PerfectField k] {X Y : Scheme.{0}} (f : X ⟶ Y) (l i : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k Y (ZMod l) p q) :
    bockstein k X l p q (pullback k f (ZMod l) p q x) =
        pullback k f (ZMod l) (p + 1) q (bockstein k Y l p q x) ∧
      reducedPower k X l i p q (pullback k f (ZMod l) p q x) =
        pullback k f (ZMod l) _ _ (reducedPower k Y l i p q x) := sorry

/-- `β B^i = 0` with `B^i = β P^i`. -/
example (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l i : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    bockstein k X l _ _ (bockstein k X l _ _ (reducedPower k X l i p q x)) = 0 :=
  sorry -- test_bockstein_P

/-- `B^i = β P^i` and the classes `τ ∈ H^{0,1}(k, ℤ/2)`, `ρ ∈ H^{1,1}(k, ℤ/2)`. -/
def betaPower (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l i : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+
      motivicCohomology k X (ZMod l) (p + 2 * i * (l - 1) + 1) (q + i * (l - 1)) := sorry

def tau (k : Type) [Field k] : motivicCohomology k (Spec (CommRingCat.of k)) (ZMod 2) 0 1 := sorry

def rho (k : Type) [Field k] : motivicCohomology k (Spec (CommRingCat.of k)) (ZMod 2) 1 1 := sorry

theorem bockstein_tau (k : Type) [Field k] [PerfectField k] [NeZero (2 : k)] :
    bockstein k _ 2 0 1 (tau k) = rho k ∧ bockstein k _ 2 1 1 (rho k) = 0 := sorry

/-- `Sq^1(τ) = ρ ≠ 0` over `ℝ`, whereas `τ · Sq^1(1) = 0`. -/
example : bockstein ℝ _ 2 0 1 (tau ℝ) ≠ 0 := sorry -- test_rho_term

/-- The Milnor operation `Q_i` of bidegree `(2l^i − 1, l^i − 1)`. -/
def milnorOp (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l i : ℕ) (p : ℤ) (q : ℕ) :
    motivicCohomology k X (ZMod l) p q →+
      motivicCohomology k X (ZMod l) (p + 2 * l ^ i - 1) (q + l ^ i - 1) := sorry

theorem milnorOp_zero (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    HEq (milnorOp k X l 0 p q x) (bockstein k X l p q x) := sorry

theorem milnorOp_sq (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l i : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    milnorOp k X l i _ _ (milnorOp k X l i p q x) = 0 := sorry

theorem milnorOp_anticomm (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l i j : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    HEq (milnorOp k X l i _ _ (milnorOp k X l j p q x))
      (-(milnorOp k X l j _ _ (milnorOp k X l i p q x))) := sorry

example (k : Type) [Field k] [PerfectField k] (X : Scheme.{0}) (l : ℕ) (p : ℤ) (q : ℕ)
    (x : motivicCohomology k X (ZMod l) p q) :
    HEq (milnorOp k X l 0 p q x) (bockstein k X l p q x) := sorry -- test_Q0_beta

end TauCeti.MotivicSteenrod

namespace TauCeti.RostMotive

open AlgebraicGeometry

/-- The characteristic number `s_d(X)` of a smooth projective variety (`M.5b/nu-variety`) and the
dimension of `X`. -/
def charNumber (k : Type) [Field k] (X : Scheme.{0}) : ℤ := sorry

def dim (X : Scheme.{0}) : ℕ := sorry

/-- `X` is a `ν_n`-variety for the prime `l`. -/
def IsNuVariety (k : Type) [Field k] (l n : ℕ) (X : Scheme.{0}) : Prop :=
  dim X = l ^ n - 1 ∧ ¬ ((l : ℤ) ^ 2 ∣ charNumber k X)

/-- `X` is a `ν_{≤n}`-variety: a `ν_n`-variety receiving maps from `ν_i`-varieties for `i < n`. -/
def IsNuLeVariety (k : Type) [Field k] (l n : ℕ) (X : Scheme.{0}) : Prop :=
  IsNuVariety k l n X ∧ ∀ i < n, ∃ Y : Scheme.{0}, IsNuVariety k l i Y ∧ Nonempty (Y ⟶ X)

theorem charNumber_prod (k : Type) [Field k] {X Y : Scheme.{0}} (f : X ⟶ Spec (CommRingCat.of k))
    (g : Y ⟶ Spec (CommRingCat.of k)) (hX : 1 ≤ dim X) (hY : 1 ≤ dim Y) :
    charNumber k (Limits.pullback f g) = 0 := sorry

/-- `Spec k(√a)` is a `ν_0`-variety for `l = 2`; a field of degree 4 is not. -/
example (k : Type) [Field k] [CharZero k] (K : Type) [Field K] [Algebra k K] :
    (Module.finrank k K = 2 → IsNuVariety k 2 0 (Spec (CommRingCat.of K))) ∧
      (Module.finrank k K = 4 → ¬ IsNuVariety k 2 0 (Spec (CommRingCat.of K))) :=
  sorry -- test_nu_zero

/-- `X` splits the symbol `a`: `a ↦ 0` in `K^M_n(k(X))/l`, for `X` integral with function field
`K` (passed as a field `K` with `k → K`). -/
def Splits (k K : Type) [Field k] [Field K] [Algebra k K] (l n : ℕ) (a : Fin n → kˣ) : Prop :=
  ∃ y : TauCeti.HigherChow.KM K n,
    TauCeti.HigherChow.milnorSymbol K n (fun i => Units.map (algebraMap k K).toMonoidHom (a i)) =
      l • y

example (k : Type) [Field k] (l n : ℕ) (a : Fin n → kˣ) :
    Splits k k l n a ↔ ∃ y : TauCeti.HigherChow.KM k n,
      TauCeti.HigherChow.milnorSymbol k n a = l • y := sorry -- test_point

theorem splits_baseChange (k K K' : Type) [Field k] [Field K] [Field K'] [Algebra k K]
    [Algebra K K'] [Algebra k K'] [IsScalarTower k K K'] (l n : ℕ) (a : Fin n → kˣ)
    (h : Splits k K l n a) : Splits k K' l n a := sorry

/-- The Pfister neighbour quadric `Q_a` of `M.5b/pfister-norm-variety`, for `a ∈ (k^×)^{n+1}`. -/
def pfisterNeighbourQuadric (k : Type) [Field k] (n : ℕ) (a : Fin (n + 1) → kˣ) : Scheme.{0} :=
  sorry

theorem pfister_dim (k : Type) [Field k] (n : ℕ) (a : Fin (n + 1) → kˣ) :
    dim (pfisterNeighbourQuadric k n a) = 2 ^ n - 1 := sorry

theorem pfister_isNu (k : Type) [Field k] [CharZero k] (n : ℕ) (a : Fin (n + 1) → kˣ) :
    IsNuVariety k 2 n (pfisterNeighbourQuadric k n a) := sorry

/-- The structure morphism `Q_a → Spec k`. -/
def pfisterStructure (k : Type) [Field k] (n : ℕ) (a : Fin (n + 1) → kˣ) :
    pfisterNeighbourQuadric k n a ⟶ Spec (CommRingCat.of k) := sorry

theorem pfister_isNuLe (k : Type) [Field k] [CharZero k] (n : ℕ) (a : Fin (n + 1) → kˣ) :
    IsNuLeVariety k 2 n (pfisterNeighbourQuadric k n a) := sorry

/-- For every field `K ⊇ k`: `Q_a(K) ≠ ∅` iff `{a} = 0` in `K^M(K)/2`. -/
theorem pfister_point_iff (k : Type) [Field k] [CharZero k] (n : ℕ) (a : Fin (n + 1) → kˣ)
    (K : Type) [Field K] [Algebra k K] :
    (∃ s : Spec (CommRingCat.of K) ⟶ pfisterNeighbourQuadric k n a,
      s ≫ pfisterStructure k n a = Spec.map (CommRingCat.ofHom (algebraMap k K))) ↔
      ∃ y : TauCeti.HigherChow.KM K (n + 1), TauCeti.HigherChow.milnorSymbol K (n + 1)
        (fun i => Units.map (algebraMap k K).toMonoidHom (a i)) = 2 • y := sorry

/-- For `a = (−1, −1)` over `ℝ`, `Q_a` is the conic `x² + y² + z² = 0`, with no real point. -/
example : ¬ ∃ s : Spec (CommRingCat.of ℝ) ⟶ pfisterNeighbourQuadric ℝ 1 ![-1, -1],
    s ≫ pfisterStructure ℝ 1 ![-1, -1] = 𝟙 _ := sorry -- test_pfister_conic

/-- The generalised Rost motive of a norm variety (`M.5c/rost-motive`), an object of
`DM^{eff,−}(k, ℤ_(l))`. -/
def rostMotive (k : Type) [Field k] [CharZero k] (l n : ℕ) [(Ideal.span {(l : ℤ)}).IsPrime]
    (hμ : ∃ z : kˣ, IsPrimitiveRoot z l) (hn : 2 ≤ n) (a : Fin n → kˣ) (X : Scheme.{0}) : TauCeti.Transfers.DMeff k (Localization.AtPrime (Ideal.span {(l : ℤ)})) :=
  sorry

end TauCeti.RostMotive

/-! ## M.5c and M.5 — the norm residue homomorphism and theorem -/

namespace TauCeti.NormResidue

open TauCeti.TateTwist (H kummer resH corH reduceH)
open TauCeti.HigherChow (KM milnorSymbol)

/-- `M.5c/galois-symbol-all-degrees`: `h^n_F : K^M_n(F) → H^n(F, μ_m^{⊗n})`, killing `m`. -/
def map (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (n : ℕ) : KM F n →+ H F m n n := sorry

theorem map_reduce (F : Type) [Field F] {m m' : ℕ} [NeZero (m : F)] [NeZero (m' : F)]
    (h : m ∣ m') (n : ℕ) (x : KM F n) : reduceH F h n n (map F m' n x) = map F m n x := sorry

theorem map_mul_m (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (n : ℕ) (x : KM F n) :
    map F m n (m • x) = 0 := sorry

theorem map_one (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (a : Fˣ) :
    map F m 1 (milnorSymbol F 1 ![a]) = kummer F m (Additive.ofMul a) := sorry

theorem map_two (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] (a b : Fˣ) :
    map F m 2 (milnorSymbol F 2 ![a, b]) =
      TauCeti.GaloisSymbol.symbol F m
        (TauCeti.GaloisSymbol.steinberg F (Additive.ofMul a) (Additive.ofMul b)) := sorry

/-- Restriction and Milnor norm on Milnor K-theory (K2SymbolsBrauer T.2, T.4), supplier carriers. -/
def KMmap (F E : Type) [Field F] [Field E] [Algebra F E] (n : ℕ) : KM F n →+ KM E n := sorry

def KMnorm (F E : Type) [Field F] [Field E] [Algebra F E] (n : ℕ) : KM E n →+ KM F n := sorry

theorem map_res (F E : Type) [Field F] [Field E] [Algebra F E] (m : ℕ) [NeZero (m : F)]
    [NeZero (m : E)] (n : ℕ) (x : KM F n) :
    resH F E m n n (map F m n x) = map E m n (KMmap F E n x) := sorry

theorem map_norm (F E : Type) [Field F] [Field E] [Algebra F E] [FiniteDimensional F E]
    [Algebra.IsSeparable F E] (m : ℕ) [NeZero (m : F)] [NeZero (m : E)] (n : ℕ) (x : KM E n) :
    corH F E m n n (map E m n x) = map F m n (KMnorm F E n x) := sorry

example (F : Type) [Field F] (m : ℕ) [NeZero (m : F)] :
    ∃ e : H F m 0 0 ≃+ ZMod m, e (map F m 0 (milnorSymbol F 0 ![])) = 1 :=
  sorry -- test_degree_zero

example (n : ℕ) : map ℝ 2 n (milnorSymbol ℝ n (fun _ => -1)) ≠ 0 := sorry -- test_real

example (F : Type) [Field F] [Fintype F] (m : ℕ) [NeZero (m : F)] (n : ℕ) (hn : 2 ≤ n) :
    Subsingleton (KM F n) ∧ Subsingleton (H F m n n) := sorry -- test_finite_field

/-- `M.5c/mod-l-norm-residue`: bijectivity mod `l` for `char F ≠ l`. -/
theorem mod_l_norm_residue (F : Type) [Field F] (l n : ℕ) [Fact l.Prime] [NeZero (l : F)] :
    Function.Surjective (map F l n) ∧ (map F l n).ker = AddSubgroup.map (nsmulAddMonoidHom l) ⊤ :=
  sorry

/-- `M.5/norm-residue-theorem` (Rost–Voevodsky). -/
theorem norm_residue (F : Type) [Field F] (ℓ r n : ℕ) [Fact ℓ.Prime] [NeZero (ℓ : F)] :
    Function.Surjective (map F (ℓ ^ r) n) ∧
      (map F (ℓ ^ r) n).ker = AddSubgroup.map (nsmulAddMonoidHom (ℓ ^ r)) ⊤ := sorry

end TauCeti.NormResidue

/-!
## Catalogue of the packet's declarations

Every node, API item and unit test of the packet, under the name the packet gives it.
`LEAN` marks an item given a declaration above (for a test: an `example` labelled by its
name); `STATEMENT` marks one whose Lean signature is omitted, with the reason (section 13:
conditions that cannot yet be stated are left out). The packet and the reader give the
mathematical statement of each.
-/

/- ### Finite Tate twists of the roots of unity — packet node `M.1/finite-tate-twist` (construction)
* TauCeti.TateTwist.finite [constructor] — LEAN: For a field F, m invertible in F and j ∈ ℤ, the
    discrete G_F-module μ_m^{⊗j}.
* TauCeti.TateTwist.finite_one [equivalence] — LEAN: μ_m^{⊗1} ≅ KummerCoeff F m as discrete G_F-
    modules.
* TauCeti.TateTwist.finite_zero [equivalence] — LEAN: μ_m^{⊗0} ≅ ℤ/m with the trivial action.
* TauCeti.TateTwist.smul_eq_cyclotomic [characterisation] — LEAN: g • x = χ_m(g)^j • x for g ∈ G_F
    and x ∈ μ_m^{⊗j}.
* TauCeti.TateTwist.card_finite [simp] — LEAN: The underlying group of μ_m^{⊗j} has exactly m
    elements and is free of rank one over ℤ/m.
* TauCeti.TateTwist.pairing [constructor] — LEAN: The equivariant ℤ/m-bilinear pairing μ_m^{⊗i} ×
    μ_m^{⊗j} → μ_m^{⊗(i+j)}.
* TauCeti.TateTwist.pairing_assoc [relation] — LEAN: The pairings are associative under the
    canonical identifications of iterated twists.
* TauCeti.TateTwist.pairing_comm [relation] — LEAN: pairing(x, y) corresponds to pairing(y, x) under
    the swap isomorphism μ_m^{⊗(i+j)} ≅ μ_m^{⊗(j+i)}; on μ_m ⊗ μ_m the swap is the identity of the
    underlying cyclic group.
* TauCeti.TateTwist.homEquiv [equivalence] — LEAN: Cartier duality: the pairing μ_m^{⊗j} ×
    μ_m^{⊗(1−j)} → μ_m^{⊗1} induces a G_F-equivariant isomorphism μ_m^{⊗(1−j)} ≅ Hom_{ℤ/m}(μ_m^{⊗j},
    μ_m), with g acting on Hom by φ ↦ g ∘ φ ∘ g^{−1}.
* TauCeti.TateTwist.dualEquiv [equivalence] — LEAN: The pairing μ_m^{⊗j} × μ_m^{⊗(1−j)} → μ_m^{⊗1} =
    μ_m is perfect: it induces an isomorphism of discrete G_F-modules μ_m^{⊗(1−j)} ≅
    Hom_{ℤ/m}(μ_m^{⊗j}, μ_m) (Cartier duality), compatible with reduction for m | m'.
* TauCeti.TateTwist.trivialise [equivalence] — LEAN: If ζ ∈ F is a primitive m-th root of unity, 1 ↦
    ζ^{⊗j} is a G_F-equivariant isomorphism ℤ/m ≅ μ_m^{⊗j} (the change-of-root rule itself is
    K2SymbolsBrauer T.7's).
* TauCeti.TateTwist.res [functoriality] — LEAN: For a field extension E/F with chosen embedding of
    separable closures, the restriction of μ_m^{⊗j}(F) along G_E → G_F is μ_m^{⊗j}(E); identity and
    composition laws hold.
* TauCeti.TateTwist.reduce [functoriality] — LEAN: For m | m′, the reduction μ_{m′}^{⊗j} → μ_m^{⊗j}:
    for j ≥ 0, ζ ↦ ζ^{m′/m} on each tensor factor; for j < 0, φ ↦ (x ↦ φ(x̃) mod m) with x̃ any lift
    of x along the reduction of μ^{⊗(−j)} (well defined because φ(m·y) = m·φ(y)). It is surjective,
    G_F-equivariant and semilinear over ℤ/m′ → ℤ/m, and reductions compose.
* test TateTwist.test_zero_trivial [degenerate] — LEAN (example): For j = 0, every g ∈ G_F acts
    trivially on μ_m^{⊗0} = ℤ/m.
* test TateTwist.test_m_one [degenerate] — LEAN (example): For m = 1, μ_1^{⊗j} = 0 for every j.
* test TateTwist.test_kummer_coeff [compatibility] — LEAN (example): μ_m^{⊗1} is TauCeti.KummerCoeff
    F m, with the same action and discrete topology.
* test TateTwist.test_rat_three_square [computation] — LEAN (example): For F = ℚ and m = 3, complex
    conjugation acts trivially on μ_3^{⊗2} and by −1 on μ_3^{⊗1}.
* test TateTwist.test_not_trivial_without_root [non-example] — LEAN (example): For F = ℚ and m = 4,
    μ_4^{⊗1} and ℤ/4 (trivial action) are not isomorphic G_ℚ-modules, since complex conjugation acts
    by −1 on μ_4.
-/

/- ### ℓ-adic Tate twists and their coefficient sequences — packet node `M.1/adic-tate-twist` (construction)
* TauCeti.TateTwist.adic [constructor] — LEAN: The compact G_F-module ℤ_ℓ(j), free of rank one over
    ℤ_ℓ.
* TauCeti.TateTwist.adic_smul [characterisation] — LEAN: g • x = (cyclotomicCharacter ℓ g)^j • x on
    ℤ_ℓ(j).
* TauCeti.TateTwist.adicQuotientEquiv [equivalence] — LEAN: ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j} as discrete
    G_F-modules, compatibly in ν.
* TauCeti.TateTwist.adicLimitEquiv [equivalence] — LEAN: ℤ_ℓ(j) ≅ lim_ν μ_{ℓ^ν}^{⊗j} as topological
    G_F-modules.
* TauCeti.TateTwist.rational [constructor] — LEAN: ℚ_ℓ(j) = ℤ_ℓ(j) ⊗_{ℤ_ℓ} ℚ_ℓ with the ℓ-adic
    topology.
* TauCeti.TateTwist.divisible [constructor] — LEAN: ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, the colimit
    along the inclusions ι (induced by multiplication by ℓ on ℤ_ℓ(j)), discrete, with
    ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν] = μ_{ℓ^ν}^{⊗j}.
* TauCeti.TateTwist.coeffInclusion [data] — LEAN: ι : μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j}, induced by
    multiplication by ℓ^b on ℤ_ℓ(j); it is injective with cokernel μ_{ℓ^b}^{⊗j}.
* TauCeti.TateTwist.shortExact_mul [relation] — LEAN: 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0
    is exact and admits a continuous set-theoretic section.
* TauCeti.TateTwist.shortExact_rational [relation] — LEAN: 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0 is
    exact.
* TauCeti.TateTwist.adic_pairing [constructor] — LEAN: Equivariant pairings ℤ_ℓ(i) × ℤ_ℓ(j) →
    ℤ_ℓ(i+j) reducing mod ℓ^ν to the finite pairings.
* test TateTwist.test_adic_zero [degenerate] — LEAN (example): ℤ_ℓ(0) = ℤ_ℓ with trivial G_F-action.
* test TateTwist.test_adic_char [compatibility] — LEAN (example): On ℤ_ℓ(1), g acts by Mathlib's
    cyclotomicCharacter ℓ g.
* test TateTwist.test_rat_three_w2 [computation] — LEAN (example): H⁰(ℚ, ℚ_3/ℤ_3(2)) ≅ ℤ/3.
* test TateTwist.test_factorwise_inclusion_wrong [non-example] — LEAN (example): For j = 2 and a = b
    = 1, the factorwise inclusion μ_ℓ ⊗ μ_ℓ → μ_{ℓ²} ⊗ μ_{ℓ²} is the zero map, whereas ι is
    injective.
* test TateTwist.test_factorwise_colimit_zero [non-example] — LEAN (example): For j = 2, the colimit
    of the μ_{ℓ^ν}^{⊗2} along the factorwise inclusions μ_{ℓ^ν} ⊂ μ_{ℓ^{ν+1}} is 0: k steps send a
    generator to ℓ^{2k} times a generator of ℤ/ℓ^{ν+k}, which vanishes once k ≥ ν. Along ι the
    colimit is ℚ_ℓ/ℤ_ℓ(2), whose ℓ-torsion μ_ℓ^{⊗2} is nonzero.
-/

/- ### The primewise twist ℚ/ℤ(j) — packet node `M.1/primewise-q-mod-z-twist` (construction)
* TauCeti.TateTwist.ratModInt [constructor] — LEAN: The discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠ char F}
    ℚ_ℓ/ℤ_ℓ(j).
* TauCeti.TateTwist.ratModIntEquivRootsOfUnity [equivalence] — LEAN: ℚ/ℤ(j) ≅ μ(F^s) with g acting
    by ζ ↦ g^j(ζ).
* TauCeti.TateTwist.ratModInt_primary [projection] — LEAN: The ℓ-primary part of ℚ/ℤ(j) is
    ℚ_ℓ/ℤ_ℓ(j).
* test TateTwist.test_w2_rat [computation] — LEAN (example): H⁰(ℚ, ℚ/ℤ(2)) is cyclic of order 24:
    its 2-primary part has order 8 (the squares of ℤ_2^× are 1 + 8ℤ_2) and its 3-primary part order
    3, the other parts being 0 (K-book Example VI.2.1.2). The untwisted module gives an infinite
    group and the tensor square gives 0.
* test TateTwist.test_ratModInt_zero [degenerate] — LEAN (example): ℚ/ℤ(0) has trivial action, so
    H⁰(F, ℚ/ℤ(0)) = ⊕_{ℓ≠p} ℚ_ℓ/ℤ_ℓ is infinite.
* test TateTwist.test_one_roots [compatibility] — LEAN (example): ℚ/ℤ(1) ≅ μ(F^s) with its natural
    action, whose m-torsion is KummerCoeff F m for m invertible in F.
* test TateTwist.test_tensor_square_zero [non-example] — LEAN (example): (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0, so
    ℚ/ℤ(2) is not the tensor square of ℚ/ℤ(1).
-/

/- ### The Galois cohomology ring of the twists — packet node `M.1/twisted-cohomology-ring` (construction)
* TauCeti.TateTwist.H [constructor] — LEAN: H^{i}(F, M) for the twist modules, as Layer 10's
    continuous cohomology of G_F.
* TauCeti.TateTwist.cup [constructor] — LEAN: The bigraded cup product H^{i}(μ_m^{⊗a}) ×
    H^{k}(μ_m^{⊗b}) → H^{i+k}(μ_m^{⊗(a+b)}).
* TauCeti.TateTwist.cup_assoc [relation] — LEAN: The cup product is associative.
* TauCeti.TateTwist.cup_comm [relation] — LEAN: x ∪ y = (−1)^{ik} y ∪ x for x of degree i and y of
    degree k, through the twist swap.
* TauCeti.TateTwist.res_cup [functoriality] — LEAN: Restriction to G_E is multiplicative.
* TauCeti.TateTwist.cor_res [relation] — LEAN: cor_{E/F} ∘ res_{E/F} = [E : F] on H^{i}(F,
    μ_m^{⊗j}).
* TauCeti.TateTwist.projection_formula [relation] — LEAN: cor_{E/F}(res(a) ∪ b) = a ∪ cor_{E/F}(b).
* TauCeti.TateTwist.H_le_two_equiv [compatibility] — STATEMENT: For i ≤ 2 the groups and the (1,1)
    cup agree with Tau Ceti's H1, H2 and explicitCup11. Omitted: the cited Tau Ceti declarations are
    not in the shared build.
* test TateTwist.test_H0 [degenerate] — LEAN (example): H⁰(F, μ_m^{⊗0}) = ℤ/m and the unit of the
    ring is 1 ∈ ℤ/m.
* test TateTwist.test_real_mod_two [computation] — LEAN (example): For F = ℝ, m = 2: H^{n}(ℝ,
    μ_2^{⊗n}) ≅ ℤ/2 for all n ≥ 0, generated by κ(−1)^n.
* test TateTwist.test_explicitCup11 [compatibility] — STATEMENT: For i = k = 1 the cup product
    equals TauCeti.ContCohomology.explicitCup11 at the twist pairing. Omitted: the cited Tau Ceti
    declarations are not in the shared build.
* test TateTwist.test_not_commutative [non-example] — LEAN (example): For F = ℝ and m = 2 the
    degree-one class x = κ(−1) has x ∪ x ≠ 0, so the ring is not exterior on degree one (graded
    commutativity does not force x² = 0 when 2 = 0).
-/

/- ### Continuous cohomology of ℓ-adic twists as limits — packet node `M.1/continuous-limit-comparison` (theorem)
Lean signature: TauCeti.TateTwist.continuous_limit_comparison
-/

/- ### Étale Tate twists on schemes and continuous étale cohomology — packet node `M.1/etale-twist-sheaf` (construction)
* TauCeti.EtaleTwist.sheaf [compatibility] — LEAN: The étale sheaf μ_m^{⊗j} on X_et for m invertible
    on X is EDC.0's Tate-twist sheaf (ℤ/m)(j) (TauCeti.EtaleDuality.tateTwistSheaf and its tensor
    powers), used under this name and not constructed a second time.
* TauCeti.EtaleTwist.stalk [characterisation] — STATEMENT: The stalk at a geometric point x̄ is
    μ_m(κ(x̄))^{⊗j}, free of rank one over ℤ/m. Omitted: stalks of sheaves on the small étale site
    at geometric points have no Mathlib API.
* TauCeti.EtaleTwist.H [constructor] — LEAN: H^{i}_et(X, μ_m^{⊗j}) := Sheaf.H of the sheaf.
* TauCeti.EtaleTwist.Hcont [constructor] — LEAN: H^{i}_cont(X, ℤ_ℓ(j)) as cohomology of R lim_ν
    RΓ_et(X, μ_{ℓ^ν}^{⊗j}).
* TauCeti.EtaleTwist.milnor_sequence [relation] — LEAN: 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) →
    H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0.
* TauCeti.EtaleTwist.pullback [functoriality] — LEAN: Pullback along f : X' → X, with id and
    composition laws.
* TauCeti.EtaleTwist.cup [constructor] — LEAN: Cup products H^{i}_et(X, μ_m^{⊗a}) × H^{k}_et(X,
    μ_m^{⊗b}) → H^{i+k}_et(X, μ_m^{⊗(a+b)}).
* TauCeti.EtaleTwist.coeff_long_exact [relation] — LEAN: Long exact sequences for the coefficient
    sequences of adic-tate-twist, natural in X.
* test EtaleTwist.test_empty [degenerate] — LEAN (example): For X = ∅ every H^{i}_et(X, μ_m^{⊗j})
    and H^{i}_cont(X, ℤ_ℓ(j)) is zero.
* test EtaleTwist.test_field_H0 [compatibility] — LEAN (example): For X = Spec F, H⁰_et(X, μ_m^{⊗j})
    = (μ_m^{⊗j})^{G_F}, the H⁰ of finite-tate-twist.
* test EtaleTwist.test_finite_field_H1 [computation] — LEAN (example): For X = Spec 𝔽_5, m = 4, j =
    1: H¹_et(X, μ_4) ≅ 𝔽_5^×/(𝔽_5^×)^4 ≅ ℤ/4.
* test EtaleTwist.test_cont_not_naive_limit [non-example] — LEAN (example): For X = Spec 𝔽_q and ℓ ∤
    q, the constant étale sheaf with value the abstract group ℤ_ℓ (discrete topology) has H¹_et(X,
    ℤ_ℓ) = Hom_cont(Ẑ, ℤ_ℓ^{disc}) = 0, since a continuous homomorphism from a profinite group to a
    torsion-free discrete group is zero, whereas H¹_cont(X, ℤ_ℓ(0)) = lim_ν ℤ/ℓ^ν = ℤ_ℓ ≠ 0:
    continuous ℓ-adic cohomology is not the cohomology of an abstract ℤ_ℓ-valued sheaf.
-/

/- ### Étale cohomology of a field is Galois cohomology — packet node `M.1/field-etale-galois-comparison` (theorem)
Lean signature: TauCeti.EtaleTwist.field_etale_galois_comparison
-/

/- ### Étale cohomology of S-integers is cohomology of G_{F,S} — packet node `M.1/s-integer-galois-comparison` (theorem)
Lean signature: STATEMENT. Omitted: G_{F,S} (ArithmeticGaloisDuality R02.3) has no carrier here.
-/

/- ### Étale Kummer sequences with units, Picard and Brauer terms — packet node `M.1/etale-kummer-sequences` (theorem)
Lean signature: TauCeti.EtaleTwist.etale_kummer_units
-/

/- ### Henselian local rings: cohomology of the closed point — packet node `M.1/henselian-residue-comparison` (theorem)
Lean signature: TauCeti.EtaleTwist.henselian_residue_comparison
-/

/- ### The étale localization sequence of a Dedekind scheme — packet node `M.1/localization-gysin-sequence` (theorem)
Lean signature: STATEMENT. Omitted: cohomology with supports and residue maps on Dedekind schemes
have no carrier here.
-/

/- ### Restriction to the real places — packet node `M.2/real-restriction-map` (construction)
* TauCeti.RealPlaces.alpha [constructor] — LEAN: α^{n}_S(j) : H^{n}_et(O_{F,S}, M) → ⊕_{σ real}
    H^{n}(ℝ, M).
* TauCeti.RealPlaces.alpha_natural [functoriality] — STATEMENT: α commutes with the maps induced by
    S ⊆ T and by coefficient maps. Omitted: the maps O_{F,S} → O_{F,T} and coefficient maps on
    EtaleTwist.H are not exposed.
* TauCeti.RealPlaces.alpha_cup [compatibility] — LEAN: α is multiplicative for cup products.
* TauCeti.RealPlaces.realCohomology_divisible [simp] — LEAN: For n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅ ℤ/2 if
    j − n is odd and 0 if j − n is even.
* TauCeti.RealPlaces.realCohomology_modTwo [simp] — LEAN: H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for every n ≥ 0.
* TauCeti.RealPlaces.alpha_one_sign [characterisation] — LEAN: On H¹(O_{F,S}, ℤ/2) ⊇ O_{F,S}^×/2, α¹
    is the sign map u ↦ (sign σ(u))_σ.
* test RealPlaces.test_totally_imaginary [degenerate] — STATEMENT: If r_1 = 0 the target of
    α^{n}_S(j) is 0. Omitted: the target of `alpha` is indexed by the real places, so the test holds
    by the type; its content is in test_totally_imaginary_agree.
* test RealPlaces.test_rat_sign [computation] — LEAN (example): For F = ℚ, S = {2, ∞}: α¹(−1) ≠ 0
    and α¹(2) = 0.
* test RealPlaces.test_localisation_compat [compatibility] — STATEMENT: For n ≥ 1, α^{n}_S(j) is the
    sum over the real places v of ArithmeticGaloisDuality R02.3's localisation maps loc_v :
    H^{n}(G_{F,S}, M) → Ĥ^{n}(G_v, M), under the equality Ĥ^{n} = H^{n} of Tate and ordinary
    cohomology of G_ℝ in positive degrees. In degree 0 they differ: loc_v is α⁰ followed by M^{G_ℝ}
    → M^{G_ℝ}/N·M, and for M = ℤ/2^∞(0) this quotient is ℚ_2/ℤ_2 → 0, so α⁰ ≠ 0 while R02.3's
    localisation map is 0. Omitted: the localisation maps of ArithmeticGaloisDuality R02.3 and Tate
    cohomology of G_ℝ have no carrier here.
* test RealPlaces.test_parity [non-example] — LEAN (example): H²(ℝ; ℤ/2^∞(2)) = 0 although H²(ℝ;
    ℤ/2) ≠ 0: the divisible and mod-2 targets differ, so α for ℤ/2^∞(j) is not the mod-2 α.
-/

/- ### Positive and modified étale cohomology at the real places — packet node `M.2/positive-and-modified-cohomology` (definition)
* TauCeti.RealPlaces.positiveCohomology [constructor] — LEAN: H^{n}_+(R, M) as cohomology of the
    fibre of α on cochains.
* TauCeti.RealPlaces.positive_long_exact [relation] — LEAN: The long exact sequence … → ⊕_σ
    H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}(R, M) → ⊕_σ H^{n}(ℝ, M) → ….
* TauCeti.RealPlaces.kernelCohomology [constructor] — LEAN: H̃^{n}(R, M) = ker α^{n}.
* TauCeti.RealPlaces.positive_to_kernel [relation] — LEAN: 0 → coker α^{n−1} → H^{n}_+(R, M) →
    H̃^{n}(R, M) → 0 is exact.
* TauCeti.RealPlaces.odd_agree [characterisation] — STATEMENT: For ℓ-primary M with ℓ odd: H̃^{n} =
    H^{n} for n ≥ 1, H^{n}_+ = H^{n} for n ≥ 2, H⁰_+ = ker α⁰, and 0 → coker α⁰ → H¹_+ → H¹ → 0 is
    exact. Omitted: the carriers fix 2-primary coefficients ℤ/2^ν(j).
* TauCeti.RealPlaces.positive_to_tateModified [compatibility] — STATEMENT: The map from ordinary to
    Tate cochains of G_ℝ (bijective on H^{n} for n ≥ 1, the quotient M^{G_ℝ} → M^{G_ℝ}/N·M on H⁰)
    induces a map from H^{n}_+(R, M) to the cohomology of the fibre of RΓ(R, M) → ⊕_σ R̂Γ(G_ℝ, M)
    with Tate complexes at the real places (as in ArithmeticGaloisDuality D7); it is bijective for n
    ≥ 2 and surjective for n = 1. D7's compactly supported cohomology also has the finite places of
    S in its fibre and is not identified with H_+. Omitted: the Tate-modified complexes of
    ArithmeticGaloisDuality D7 have no carrier here.
* test RealPlaces.test_totally_imaginary_agree [degenerate] — LEAN (example): If r_1 = 0 then
    H^{n}_+ = H̃^{n} = H^{n} for all n.
* test RealPlaces.test_rat_kernel [computation] — STATEMENT: For F = ℚ, S = {2, ∞}, M = ℤ/2: H̃¹ is
    spanned by the class of 2 and has dimension 1. Omitted: naming the place 2 of ℚ in
    `HeightOneSpectrum (𝓞 ℚ)` needs API not used here; the statement depends on S = {2, ∞} exactly.
* test RealPlaces.test_high_degree [computation] — LEAN (example): For n ≥ 3, H̃^{n}(R, ℤ/2) = 0
    (α^n is bijective) and H^{n}_+(R, ℤ/2) = 0 (α^{n−1} is surjective, by high-degree-real-
    isomorphism), although H^{n}(R, ℤ/2) ≅ (ℤ/2)^{r_1}.
* test RealPlaces.test_not_ordinary [non-example] — LEAN (example): For F = ℚ, S = {2, ∞}, M = ℤ/2,
    n = 3: H³ ≅ ℤ/2 but H̃³ = 0, so the kernel groups are not ordinary cohomology.
* test RealPlaces.test_odd_degree_one [non-example] — STATEMENT: For F = ℚ(√2), ℓ = 3, M = ℤ/3 and S
    = S_∞ ∪ {v | 3}: α⁰ : ℤ/3 → (ℤ/3)² is the diagonal, so coker α⁰ ≅ ℤ/3 and the canonical map
    H¹_+(R, ℤ/3) → H¹(R, ℤ/3) has kernel ℤ/3, although H̃¹(R, ℤ/3) = H¹(R, ℤ/3): positive cohomology
    differs from ordinary cohomology in degree 1 even for ℓ odd. Omitted: the carriers fix 2-primary
    coefficients ℤ/2^ν(j); this test is for ℓ = 3.
-/

/- ### Cohomological dimension and the real places in high degrees — packet node `M.2/high-degree-real-isomorphism` (theorem)
Lean signature: TauCeti.RealPlaces.alpha_bijective_of_three_le
-/

/- ### The Brauer group of a ring of S-integers — packet node `M.2/s-integer-brauer-sequence` (theorem)
Lean signature: STATEMENT. Omitted: Br'(O_S) = H²_et(−, G_m) (SF.2) and the local invariants have no
carrier here.
-/

/- ### Mod-2 dimensions, the narrow Picard group and the signature defect — packet node `M.2/mod-two-dimension-formulas` (theorem)
Lean signature: TauCeti.RealPlaces.dim_H1_modTwo
-/

/- ### Surjectivity onto the real places in even weight — packet node `M.2/even-twist-real-surjection` (lemma)
Lean signature: STATEMENT. Omitted: the field-level α¹(i) with ℚ_2/ℤ_2(i) coefficients has no
carrier; only finite coefficients over O_{F,S} do.
-/

/- ### ℓ-adic cohomology of S-integers: finiteness and rationalisation — packet node `M.2/adic-s-integer-cohomology` (theorem)
Lean signature: TauCeti.RealPlaces.adic_s_integer_finite
-/

/- ### The degree-two comparison diagram of localization sequences — packet node `M.2/degree-two-localization-diagram` (theorem)
Lean signature: STATEMENT. Omitted: K₂(O_S), tame symbols and étale residue maps have no carrier
here.
-/

/- ### The cohomological Steinberg relation — packet node `M.3/cohomological-steinberg` (theorem)
Lean signature: TauCeti.GaloisSymbol.cohomological_steinberg
-/

/- ### The Galois symbol on K₂ of a field — packet node `M.3/galois-symbol` (construction)
* TauCeti.GaloisSymbol.symbol [constructor] — LEAN: h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}).
* TauCeti.GaloisSymbol.symbol_steinberg [simp] — LEAN: h_{F,m}{a, b} = κ(a) ∪ κ(b).
* TauCeti.GaloisSymbol.symbol_unique [extensionality] — LEAN: Two homomorphisms K_2(F)/m → A
    agreeing on all Steinberg symbols are equal.
* TauCeti.GaloisSymbol.symbol_res [functoriality] — LEAN: res_{E/F} ∘ h_{F,m} = h_{E,m} ∘ (K_2(F)/m
    → K_2(E)/m) for every field extension E/F, restriction along G_E → G_F for an F-embedding of
    separable closures.
* TauCeti.GaloisSymbol.symbol_reduce [functoriality] — LEAN: For m | m' and x ∈ K_2(F): h_{F,m}(x
    mod m) = (r ⊗ r)_*(h_{F,m'}(x mod m')), where r : μ_{m'} → μ_m is ζ ↦ ζ^{m'/m} and r ⊗ r :
    μ_{m'}^{⊗2} → μ_m^{⊗2} is the reduction of coefficients.
* TauCeti.GaloisSymbol.symbol_skew [relation] — LEAN: h{a, b} = −h{b, a} and h{a, −a} = 0.
* test GaloisSymbol.test_one [degenerate] — LEAN (example): For m = 1 the symbol is the zero map
    between zero groups; and for every a ∈ F^× and every m-th power b = c^m, h_{F,m}{a, b} = κ(a) ∪
    κ(c^m) = 0, since the Kummer class of an m-th power vanishes. A definition through a cocycle not
    built from the Kummer classes fails the second clause.
* test GaloisSymbol.test_hamilton [computation] — LEAN (example): For F = ℝ and m = 2, h{−1, −1} ≠ 0
    (Hamilton's quaternions are not split).
* test GaloisSymbol.test_explicitCup11 [compatibility] — STATEMENT: h{a, b} =
    explicitCup11(kummerMap a, kummerMap b) for the tensor pairing KummerCoeff × KummerCoeff →
    μ_m^{⊗2} (Tau Ceti's low-degree model). Omitted: the cited Tau Ceti declarations are not in the
    shared build.
* test GaloisSymbol.test_not_untwisted [non-example] — LEAN (example): For F = ℚ and m = 3:
    h_{ℚ,3}{3, 7} ≠ 0, because by symbol-residue-compatibility its residue at 7 is −κ(3 mod 7) ∈
    H¹(𝔽_7, μ_3) = 𝔽_7^×/𝔽_7^{×3}, and 3 is not a cube modulo 7. By contrast every G_ℚ-equivariant
    biadditive pairing μ_3 × μ_3 → μ_3 is zero (writing it (ζ^i, ζ^j) ↦ w^{ij}, complex conjugation
    forces w = w^{−1}, so w = 1), so a symbol built from κ(a) and κ(b) with untwisted coefficients
    μ_3 vanishes identically.
-/

/- ### Tate's ℓ-adic Galois symbol — packet node `M.3/adic-galois-symbol` (construction)
* TauCeti.GaloisSymbol.adicSymbol [constructor] — LEAN: h_F : K_2(F) → H²(F, ℤ_ℓ(2)).
* TauCeti.GaloisSymbol.adicSymbol_steinberg [simp] — LEAN: h_F{a, b} = d_F a ∪ d_F b.
* TauCeti.GaloisSymbol.adicSymbol_reduce [compatibility] — LEAN: Reducing h_F mod ℓ^ν gives
    h_{F,ℓ^ν}.
* TauCeti.GaloisSymbol.adicSymbol_divisible [relation] — LEAN: h_F vanishes on the ℓ-divisible
    subgroup of K_2(F) (Tate (3.5)(a)).
* TauCeti.GaloisSymbol.adicSymbol_res [functoriality] — LEAN: Natural for field extensions.
* test GaloisSymbol.test_adic_one [degenerate] — LEAN (example): If b ∈ F^× is an ℓ^ν-th power for
    every ν (b is ℓ-divisible in F^×), then h_F{a, b} = 0 in H²(F, ℤ_ℓ(2)) for every a ∈ F^×, since
    every component h_{F,ℓ^ν}{a, b} = κ(a) ∪ κ(b) vanishes; for F = ℂ, ℓ any prime, h_F is the zero
    map.
* test GaloisSymbol.test_adic_closed [computation] — LEAN (example): For F algebraically closed,
    H²(F, ℤ_ℓ(2)) = 0, so h_F = 0.
* test GaloisSymbol.test_adic_reduce [compatibility] — LEAN (example): For F = ℚ, ℓ = 2, ν = 1: the
    reduction of h_ℚ{−1, −1} is h_{ℚ,2}{−1, −1} ≠ 0.
* test GaloisSymbol.test_adic_not_injective [non-example] — LEAN (example): For F a local field, h_F
    is not injective on K_2(F): it kills the uncountable divisible summand of Moore's decomposition.
-/

/- ### The Galois symbol commutes with norms — packet node `M.3/symbol-norm-compatibility` (theorem)
Lean signature: TauCeti.GaloisSymbol.symbol_norm
-/

/- ### The Galois symbol commutes with residues — packet node `M.3/symbol-residue-compatibility` (theorem)
Lean signature: STATEMENT. Omitted: the tame symbol and the cohomological residue of a discretely
valued field have no carrier here.
-/

/- ### Tate's theorem for local fields — packet node `M.3/tate-local` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_local
-/

/- ### Tate's theorem for global fields — packet node `M.3/tate-global` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_global
-/

/- ### Torsion in K₂ of a global field is generated by root-of-unity symbols — packet node `M.3/tate-torsion-symbols` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_torsion_symbols
-/

/- ### Tate's theorem for rings of S-integers — packet node `M.3/tate-s-integer` (theorem)
Lean signature: STATEMENT. Omitted: K₂ of a ring has no carrier here (only K₂ of a field).
-/

/- ### K₂ of S-integers modulo ℓ and the Picard group — packet node `M.3/tate-picard-sequence` (theorem)
Lean signature: STATEMENT. Omitted: K₂ of a ring and the local norm residue symbols have no carrier
here.
-/

/- ### The algebraic simplices and the cubes — packet node `M.4/algebraic-simplex` (construction)
* TauCeti.HigherChow.simplex [constructor] — LEAN: Δ^n_B as a B-scheme, functorial in B.
* TauCeti.HigherChow.coface [data] — LEAN: The coface closed immersions ∂_i : Δ^{n−1}_B → Δ^n_B.
* TauCeti.HigherChow.codegeneracy [data] — LEAN: The codegeneracy maps s_i : Δ^n_B → Δ^{n−1}_B.
* TauCeti.HigherChow.cosimplicial_identities [relation] — LEAN: ∂_j ∂_i = ∂_i ∂_{j−1} for i < j, and
    the remaining cosimplicial identities.
* TauCeti.HigherChow.simplex_iso_affine [equivalence] — LEAN: Δ^n_B ≅ 𝔸^n_B over B.
* TauCeti.HigherChow.cube [constructor] — LEAN: □^n_B = (ℙ¹_B ∖ {1})^n with faces δ^ε_i, ε ∈ {0, ∞}.
* TauCeti.HigherChow.face_regular [characterisation] — STATEMENT: Every face of Δ^n_B (resp. □^n_B)
    of codimension r is cut out by a regular sequence of length r. Omitted: faces as closed
    subschemes and regular sequences on schemes have no carrier here.
* TauCeti.HigherChow.simplexMap [functoriality] — LEAN: For an order-preserving g : [m] → [n], the
    affine map Δ(g) : Δ^m_B → Δ^n_B with Δ(g)^*(t_j) = Σ_{i ∈ g^{−1}(j)} t_i; Δ(id) = id and Δ(g ∘
    h) = Δ(g) ∘ Δ(h).
* TauCeti.HigherChow.cubeFace [data] — LEAN: The face closed immersions δ^ε_i : □^{n−1}_B → □^n_B
    (insert ε ∈ {0, ∞} as the i-th coordinate) and the degeneracies □^n_B → □^{n−1}_B forgetting the
    i-th coordinate, satisfying the cubical identities.
* TauCeti.HigherChow.cube_iso_affine [equivalence] — LEAN: □^n_B ≅ 𝔸^n_B over B by x ↦ 1 − 1/x in
    each coordinate, carrying the faces y_i = ∞ and y_i = 0 to x_i = 0 and x_i = 1.
* test HigherChow.test_simplex_zero [degenerate] — LEAN (example): Δ^0_B ≅ B.
* test HigherChow.test_simplex_one [computation] — LEAN (example): Δ^1_k ≅ 𝔸^1_k with exactly two
    codimension-one faces, the k-points t_0 = 0 and t_1 = 0.
* test HigherChow.test_base_change [compatibility] — LEAN (example): Δ^n_{B'} ≅ Δ^n_B ×_B B' for
    every B' → B.
* test HigherChow.test_faces_not_coordinate_hyperplanes [non-example] — STATEMENT: Δ^n_B is not
    𝔸^{n+1}_B with its coordinate hyperplanes: in Δ^n_B the n + 1 faces t_i = 0 have empty common
    intersection (t_0 + ⋯ + t_n = 1), whereas in 𝔸^{n+1}_B the coordinate hyperplanes meet in the
    origin; so Δ^n has exactly 2^{n+1} − 1 nonempty faces (3 for n = 1). Omitted: faces as closed
    subschemes of Δ^n have no carrier here.
-/

/- ### Cycles meeting the faces properly — packet node `M.4/admissible-cycles` (definition)
* TauCeti.HigherChow.cycles [constructor] — LEAN: z^q(X, n) as a subgroup of AlgebraicCycle(X × Δ^n,
    ℤ).
* TauCeti.HigherChow.mem_cycles_iff [characterisation] — STATEMENT: A cycle lies in z^q(X, n) iff
    each component has codimension q and meets every face properly. Omitted: codimension of points
    and proper intersection with faces have no API here.
* TauCeti.HigherChow.face_restrict [data] — LEAN: Intersection with the i-th face, z^q(X, n) →
    z^q(X, n − 1).
* TauCeti.HigherChow.cyclesDim [constructor] — LEAN: The dimension-indexed groups z_r(X, n), r ∈ ℤ,
    over a field or (with Geisser's dimension) over a Dedekind base.
* TauCeti.HigherChow.cycles_eq_cyclesDim [compatibility] — STATEMENT: For X equidimensional of
    dimension d over a field, z^q(X, n) = z_{d−q}(X, n). Omitted: the dimension of a scheme has no
    carrier in this namespace.
* test HigherChow.test_cycles_zero_n [degenerate] — STATEMENT: z^q(X, 0) is the group of
    codimension-q cycles of X. Omitted: codimension-q cycles of X have no API here.
* test HigherChow.test_point [computation] — STATEMENT: z^1(Spec k, 1) is generated by the closed
    points of Δ^1_k ≅ 𝔸^1_k other than the two vertices. Omitted: closed points of Δ^1 as cycles
    have no API here.
* test HigherChow.test_algebraic_cycle [compatibility] — STATEMENT: z^q(X, 0) agrees with the
    codimension-q part of Mathlib's AlgebraicCycle X ℤ with finite support. Omitted: codimension-q
    parts of AlgebraicCycle have no API here.
* test HigherChow.test_vertex_not_admissible [non-example] — STATEMENT: The vertex t_0 = 0 of Δ^1_k
    is a codimension-one cycle on Δ^1_k that does not meet the face t_0 = 0 properly, so it is not
    in z^1(Spec k, 1). Omitted: proper intersection with faces has no API here.
-/

/- ### Bloch's cycle complex and higher Chow groups — packet node `M.4/cycle-complex` (construction)
* TauCeti.HigherChow.complex [constructor] — LEAN: z^q(X, •) as a simplicial abelian group and its
    chain complex.
* TauCeti.HigherChow.CH [constructor] — LEAN: CH^q(X, n) = H_n(z^q(X, •)).
* TauCeti.HigherChow.motivicComplex [constructor] — STATEMENT: Z(q)_X = z^q(−, •)[−2q] as a complex
    of Zariski (and étale) sheaves on X. Omitted: complexes of Zariski and étale sheaves on X have
    no carrier here.
* TauCeti.HigherChow.H [constructor] — LEAN: H^{p}(X, A(q)) for an abelian group A, with H^{p}(X,
    Z(q)) = CH^q(X, 2q − p).
* TauCeti.HigherChow.d_sq [relation] — STATEMENT: d ∘ d = 0 with d = Σ (−1)^i ∂_i^*. Omitted: d ∘ d
    = 0 is part of the structure of `TauCeti.HigherChow.complex` (a ChainComplex).
* TauCeti.HigherChow.CH_neg [simp] — LEAN: CH^q(X, n) = 0 for n < 0, and H^{p}(X, Z(q)) = 0 for p >
    2q.
* TauCeti.HigherChow.coefficient_long_exact [relation] — STATEMENT: For 0 → A' → A → A'' → 0 there
    is a long exact sequence … → H^{p}(X, A'(q)) → H^{p}(X, A(q)) → H^{p}(X, A''(q)) → H^{p+1}(X,
    A'(q)) → …; in particular the Bockstein triangle Z(q) --m--> Z(q) → Z/m(q). Omitted:
    functoriality of H X A p q in A is not exposed; the Bockstein case is `H_mod_m`.
* TauCeti.HigherChow.H_mod_m [relation] — LEAN: 0 → H^{p}(X, Z(q))/m → H^{p}(X, Z/m(q)) → H^{p+1}(X,
    Z(q))[m] → 0 is exact.
* test HigherChow.test_CH_zero [compatibility] — STATEMENT: CH^q(X, 0) is the Chow group CH^q(X) of
    SchemeAndStackFoundations SF.5. Omitted: the Chow group of SF.5 has no carrier here.
* test HigherChow.test_q_zero [degenerate] — LEAN (example): For X = Spec k: CH^0(Spec k, 0) = ℤ and
    CH^0(Spec k, n) = 0 for n > 0.
* test HigherChow.test_field_weight_one [computation] — LEAN (example): CH^1(Spec k, 1) ≅ k^×, the
    class of a k-rational point (t_0, t_1) of Δ^1_k with t_0 t_1 ≠ 0 going to −t_0/t_1 (a closed
    point with residue field E goes to N_{E/k} of this value). The sign is forced: the line α t_0 +
    β t_1 + γ t_2 = 0 in Δ^2_k (αβγ ≠ 0, so it misses the vertices) has faces on t_0 = 0, t_1 = 0,
    t_2 = 0 with values γ/β, γ/α, β/α, (value 1 when the line is parallel to that edge), and
    (γ/β)(γ/α)^{−1}(β/α) = 1, whereas the unsigned ratio t_0/t_1 gives −1.
* test HigherChow.test_not_naive_cycles [non-example] — STATEMENT: Requiring proper intersection
    only with the codimension-one faces does not give a simplicial abelian group: the line t_1 = t_2
    in Δ^2_k meets each edge t_i = 0 in at most one point, so it meets every codimension-one face
    properly, but it passes through the vertex (1, 0, 0), and its face on t_1 = 0 is a vertex of
    Δ^1, which is not in z^1(Spec k, 1); so this line is not in z^1(Spec k, 2). Omitted: the naive
    (non-admissible) complex has no carrier here.
-/

/- ### The cubical cycle complex — packet node `M.4/cubical-cycle-complex` (construction)
* TauCeti.HigherChow.cubeCycles [constructor] — LEAN: z^q_□(X, n), admissible cubical cycles modulo
    degenerate ones.
* TauCeti.HigherChow.cube_d_sq [relation] — LEAN: d ∘ d = 0 for d = Σ (−1)^i (∂^∞_i − ∂^0_i).
* TauCeti.HigherChow.cubeProduct [constructor] — LEAN: For X, Y over a field k, the external product
    z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X ×_k Y, n + m), Z ⊗ W ↦ Z × W under □^n × □^m = □^{n+m}.
* TauCeti.HigherChow.cube_leibniz [relation] — STATEMENT: d(x × y) = dx × y + (−1)^n x × dy.
    Omitted: the statement needs casts between n + 1 + m and n + m + 1 on the carrier indices.
* TauCeti.HigherChow.milnorCycle [constructor] — LEAN: For a_i ∈ F^× ∖ {1}, the point (a_1, …, a_n)
    ∈ □^n_F as a cycle in z^n_□(F, n).
* TauCeti.HigherChow.cubeFaceMap [data] — LEAN: ∂^ε_i : z^q_□(X, n) → z^q_□(X, n − 1), intersection
    with the face y_i = ε (ε ∈ {0, ∞}, 1 ≤ i ≤ n), with d = Σ_i (−1)^i (∂^∞_i − ∂^0_i).
* TauCeti.HigherChow.cubeNormalized_quasiIso [equivalence] — STATEMENT: For X of finite type over a
    field, the inclusion of the ∞-normalised subcomplex z^q_{□,N}(X, •) (cycles with ∂^0_i = 0 for
    all i and ∂^∞_i = 0 for i ≥ 2) into z^q_□(X, •) is a quasi-isomorphism. Omitted: subcomplexes of
    the cubical complex and quasi-isomorphisms have no carrier here.
* TauCeti.HigherChow.cubeMap [functoriality] — LEAN: Flat pullback and proper pushforward (dimension
    indexing) of cycles act on z_□ as maps of complexes, functorially, preserving degenerate cycles.
* test HigherChow.test_cube_zero [degenerate] — LEAN (example): z^q_□(X, 0) = z^q(X, 0).
* test HigherChow.test_cube_point [computation] — LEAN (example): For a ∈ F^× ∖ {1}, the point a ∈
    □^1_F is a cycle with d = 0 (it avoids 0 and ∞).
* test HigherChow.test_cube_vs_simplex [compatibility] — LEAN (example): The cubical and simplicial
    complexes have isomorphic homology (simplicial-cubical-comparison).
* test HigherChow.test_degenerate_killed [non-example] — STATEMENT: For X = Spec k and q = 0, the
    group of admissible cycles in degree n is ℤ·[□^n] with d[□^n] = Σ_i (−1)^i([□^{n−1}] −
    [□^{n−1}]) = 0, so before quotienting by degenerate cycles the homology is ℤ in every degree n ≥
    0; [□^n] is degenerate for n ≥ 1 (the pullback of [□^{n−1}] along a coordinate projection), and
    the quotient complex has homology ℤ in degree 0 and 0 in degrees n > 0, matching CH^0(Spec k,
    n). Omitted: degenerate cubical cycles have no carrier here.
-/

/- ### Simplicial and cubical higher Chow groups agree — packet node `M.4/simplicial-cubical-comparison` (theorem)
Lean signature: TauCeti.HigherChow.simplicial_cubical_comparison
-/

/- ### Flat pullback and proper pushforward of higher Chow groups — packet node `M.4/functoriality` (theorem)
Lean signature: TauCeti.HigherChow.pushforwardDim_comp
-/

/- ### Homotopy invariance and the translation moving lemma — packet node `M.4/homotopy-invariance` (theorem)
Lean signature: TauCeti.HigherChow.homotopy_invariance
-/

/- ### Bloch's moving lemma for cycle complexes — packet node `M.4/moving-lemma` (theorem)
Lean signature: STATEMENT. Omitted: subcomplexes of the cycle complex in good position have no
carrier here.
-/

/- ### Bloch's localization theorem — packet node `M.4/localization-sequence` (theorem)
Lean signature: TauCeti.HigherChow.localization_exact
-/

/- ### Products and pullback for smooth schemes — packet node `M.4/products` (construction)
* TauCeti.HigherChow.extProduct [constructor] — LEAN: CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n +
    m).
* TauCeti.HigherChow.cup [constructor] — LEAN: The cup product on ⊕ CH^p(X, n) for X smooth.
* TauCeti.HigherChow.pullback [functoriality] — LEAN: f^* for f : Y → X between smooth quasi-
    projective k-schemes, with (g ∘ f)^* = f^* ∘ g^* and id^* = id.
* TauCeti.HigherChow.pullback_flat [compatibility] — STATEMENT: f^* agrees with flat pullback when f
    is flat. Omitted: flat pullback of cycles has no separate carrier here.
* TauCeti.HigherChow.cup_comm [relation] — LEAN: x · y = (−1)^{nm} y · x for x ∈ CH^p(X, n), y ∈
    CH^r(X, m).
* TauCeti.HigherChow.projection_formula [relation] — STATEMENT: f_*(f^*x · y) = x · f_*y for f
    proper between smooth schemes. Omitted: proper pushforward on codimension-indexed groups shifts
    by the relative dimension, which has no carrier here.
* test HigherChow.test_unit [degenerate] — LEAN (example): The class [X] ∈ CH^0(X, 0) is the unit of
    the ring.
* test HigherChow.test_symbol_product [computation] — STATEMENT: For a, b ∈ F^× ∖ {1}, a · b ∈
    CH^2(F, 2) is the class of the point (a, b) ∈ □^2_F. Omitted: classes of points of □^2_F in
    CH^2(F, 2) need the cubical comparison map.
* test HigherChow.test_degree_zero [compatibility] — STATEMENT: On CH^*(X, 0) the cup product is
    SF.5's intersection product for X smooth. Omitted: the intersection product of SF.5 has no
    carrier here.
* test HigherChow.test_sign [non-example] — LEAN (example): For a ∈ F^×, a · a = a · (−1) in CH^2(F,
    2), which is generally nonzero (e.g. F = ℝ, a = −1), so the product is graded-commutative but
    not alternating.
-/

/- ### Higher Chow groups in degree zero are Chow groups — packet node `M.4/chow-degree-zero` (theorem)
Lean signature: STATEMENT. Omitted: the Chow group of SchemeAndStackFoundations SF.5 has no carrier
here.
-/

/- ### Motivic cohomology in weights zero and one — packet node `M.4/weight-zero-and-one` (theorem)
Lean signature: TauCeti.HigherChow.weight_one_field
-/

/- ### Vanishing above the weight for fields, and above weight plus dimension — packet node `M.4/vanishing-above-weight` (theorem)
Lean signature: TauCeti.HigherChow.CH_field_eq_zero
-/

/- ### Milnor K-theory is motivic cohomology on the diagonal — packet node `M.4/nesterenko-suslin-totaro` (theorem)
Lean signature: TauCeti.HigherChow.nesterenko_suslin_totaro
-/

/- ### The weight-two symbol comparison — packet node `M.4/weight-two-symbol-comparison` (theorem)
Lean signature: TauCeti.HigherChow.weight_two_symbol_comparison
-/

/- ### The projective bundle formula for higher Chow groups — packet node `M.4/projective-bundle-formula` (theorem)
Lean signature: STATEMENT. Omitted: projective bundles and c₁(O(1)) have no carrier here.
-/

/- ### Purity for cycle complexes with supports — packet node `M.4/purity-gysin-triangle` (theorem)
Lean signature: STATEMENT. Omitted: cohomology with supports and complexes of sheaves have no
carrier here.
-/

/- ### Cycle complexes over a Dedekind base — packet node `M.4/dedekind-cycle-complex` (construction)
* TauCeti.HigherChow.dedekindComplex [constructor] — STATEMENT: Z(n)_X for X essentially of finite
    type over a Dedekind scheme. Omitted: complexes of Zariski sheaves have no carrier here.
* TauCeti.HigherChow.dedekind_H [constructor] — LEAN: H^{p}(X, A(n)) as Zariski hypercohomology.
* TauCeti.HigherChow.dedekind_restrict_field [compatibility] — STATEMENT: For X with generic fibre
    X_F, colim over nonempty opens V ⊂ B of z^n(X_V, •) is z^n(X_F, •), the cycle complex of cycle-
    complex over the field F; hence H^{p}(X_F, Z(n)) = colim_V H^{p}(X_V, Z(n)). Omitted: generic
    fibres X_F have no carrier here.
* TauCeti.HigherChow.dedekind_flat_pullback [functoriality] — LEAN: Flat pullback Z(n)_X →
    f_*Z(n)_Y.
* TauCeti.HigherChow.dedekind_etale [constructor] — STATEMENT: The étale version Z(n)_et, the same
    complex on the small étale site (its terms are étale sheaves), and the change-of-topology map
    H^{p}(X, Z(n)) → H^{p}_et(X, Z(n)). Omitted: complexes of étale sheaves and Rε_* have no carrier
    here.
* TauCeti.HigherChow.dedekind_H_eq_homology_of_local [characterisation] — LEAN: For B the spectrum
    of a discrete valuation ring, H^{p}(X, Z(n)) ≅ H_{2n−p}(z^n(X, •)) (Geisser Theorem 3.2(b)); for
    general B, H^{p}(X, Z(n)) ≅ H^{p}_Zar(B, p_* Z(n)).
* test HigherChow.test_dedekind_weight_zero [degenerate] — LEAN (example): Z(0)_X ≃ ℤ for X
    connected and essentially smooth over B.
* test HigherChow.test_dedekind_units [computation] — LEAN (example): H^{1}(Spec ℤ[1/2], Z(1)) ≅
    ℤ[1/2]^× ≅ {±1} × 2^ℤ and H^{2}(Spec ℤ[1/2], Z(1)) ≅ Pic(ℤ[1/2]) = 0.
* test HigherChow.test_dedekind_generic [compatibility] — STATEMENT: For X = Spec ℤ[1/2] and n = 1,
    colim over nonempty opens V ⊂ Spec ℤ[1/2] of H^{1}(V, Z(1)) is ℚ^× = H^{1}(Spec ℚ, Z(1)), the
    field cycle complex of cycle-complex. Omitted: colimits over the nonempty opens of B have no
    carrier here.
* test HigherChow.test_not_codimension [non-example] — STATEMENT: Krull dimension is not the right
    dimension function: for X = 𝔸^1_{ℤ_(p)} (dimension 2) the integral closed subscheme V(pt − 1) ≅
    Spec ℚ has codimension 1 in X but Krull dimension 0, the same as the closed points of the
    special fibre, which have codimension 2. With Geisser's convention (Krull dimension of the
    generic fibre plus one for B-flat integral schemes) it has dimension 1 = dim X − codim, so a
    definition indexed by Krull dimension would misplace this cycle. Omitted: codimension and
    dimension of points have no API here.
-/

/- ### Coniveau, Gersten complexes and vanishing over a field or a Dedekind base — packet node `M.4/dedekind-gersten` (theorem)
Lean signature: STATEMENT. Omitted: the Gersten complex and points of codimension one have no
carrier here.
-/

/- ### Zariski descent for cycle complexes — packet node `M.4/zariski-descent` (theorem)
Lean signature: STATEMENT. Omitted: Zariski hypercohomology of the cycle complex of sheaves has no
carrier here.
-/

/- ### Finite correspondences — packet node `M.5a/finite-correspondence` (definition)
* TauCeti.Transfers.Cor [constructor] — LEAN: Cor_k(X, Y) as a free abelian group on elementary
    correspondences.
* TauCeti.Transfers.graph [constructor] — LEAN: Γ_f ∈ Cor_k(X, Y) for f : X → Y.
* TauCeti.Transfers.comp [constructor] — LEAN: Composition Cor_k(Y, Z) × Cor_k(X, Y) → Cor_k(X, Z).
* TauCeti.Transfers.comp_assoc [relation] — LEAN: Composition is associative and bilinear.
* TauCeti.Transfers.graph_comp [simp] — LEAN: Γ_g ∘ Γ_f = Γ_{g∘f} and Γ_id = id.
* TauCeti.Transfers.transpose_finite [other] — LEAN: For f : Y → X finite and surjective with X
    smooth and Y smooth and connected, the transpose Γ_f^t ⊂ X × Y is an elementary correspondence
    in Cor_k(X, Y), and Γ_f ∘ Γ_f^t = deg(f) · id_X in Cor_k(X, X) when X is connected (MVW 1.11,
    Example 2.7).
* TauCeti.Transfers.tensor [structure] — STATEMENT: X ⊗ Y = X × Y and W ⊗ W' = [W × W'] make Cor_k
    an additive symmetric monoidal category with unit Spec k, and Γ_f ⊗ Γ_g = Γ_{f×g} (MVW 1.9).
    Omitted: PST, EST and DMeff are carriers without categorical, monoidal or triangulated
    structure.
* TauCeti.Transfers.baseChange [functoriality] — STATEMENT: For a field extension k ⊂ F, X ↦ X_F
    extends to an additive symmetric monoidal functor Cor_k → Cor_F compatible with graphs; for F/k
    finite separable and U smooth over F, Cor_F(U, X_F) = Cor_k(U, X) (MVW Exercise 1.12), and
    Cor_F(X_F, Y_F) is the colimit of Cor_E(X_E, Y_E) over the subextensions E of finite type (MVW
    Exercise 1.13). Omitted: base change of schemes along field extensions has no carrier here.
* test Transfers.test_point_source [computation] — STATEMENT: Cor_k(Spec k, 𝔸^1_k) is the free
    abelian group on closed points of 𝔸^1_k. Omitted: closed points of 𝔸^1_k as generators have no
    API here.
* test Transfers.test_empty [degenerate] — LEAN (example): Cor_k(∅, Y) = 0 and Cor_k(X, ∅) = 0 for X
    nonempty.
* test Transfers.test_galois_group_ring [compatibility] — STATEMENT: For L/k finite Galois with
    group G, Cor_k(Spec L, Spec L) ≅ ℤ[G] as rings. Omitted: the ring structure on Cor_k(X, X) and
    ℤ[G] comparison are not exposed.
* test Transfers.test_not_all_cycles [non-example] — STATEMENT: The diagonal of 𝔸^1 × 𝔸^1 is a
    correspondence from 𝔸^1 to 𝔸^1, but the line {0} × 𝔸^1 is not (it is not finite over the first
    factor). Omitted: elementary correspondences as closed subschemes are not exposed.
-/

/- ### Presheaves and Nisnevich sheaves with transfers — packet node `M.5a/presheaf-with-transfers` (definition)
* TauCeti.Transfers.PST [constructor] — LEAN: The abelian category of presheaves with transfers.
* TauCeti.Transfers.ztr [constructor] — LEAN: ℤ_tr(X) = Cor_k(−, X), with the Yoneda isomorphism
    Hom(ℤ_tr(X), F) ≅ F(X).
* TauCeti.Transfers.nisnevichTopology [constructor] — STATEMENT: The Nisnevich topology on Sm/k,
    with the covering families of SchemeKTheoryOperations S.4/nisnevich-site; a presheaf is a sheaf
    if and only if it sends elementary distinguished squares to pullback squares (MVW 12.7).
    Omitted: the category Sm/k has no carrier here.
* TauCeti.Transfers.NST [constructor] — LEAN: Nisnevich sheaves with transfers, Sh_Nis(Cor_k).
* TauCeti.Transfers.sheafify_transfers [universal-property] — STATEMENT: The Nisnevich
    sheafification of F ∈ PST has a unique transfer structure making F → F_Nis a map in PST.
    Omitted: PST and NST are uninterpreted carriers without category structure.
* TauCeti.Transfers.ztr_sheaf [characterisation] — STATEMENT: ℤ_tr(X) is an étale sheaf, hence a
    Nisnevich sheaf. Omitted: PST and NST are uninterpreted carriers without category structure.
* TauCeti.Transfers.NST_abelian [instance] — STATEMENT: Sh_Nis(Cor_k, R) is a Grothendieck abelian
    category (hence has enough injectives), and the inclusion into presheaves with transfers has the
    exact left adjoint F ↦ F_Nis (MVW 13.1). Omitted: PST and NST are uninterpreted carriers without
    category structure.
* TauCeti.Transfers.EST [constructor] — LEAN: Étale sheaves with transfers Sh_et(Cor_k, R): a
    Grothendieck abelian category with exact sheafification F ↦ F_et carrying unique transfers (MVW
    6.17–6.19); every Nisnevich sheaf with transfers that is an étale sheaf is one.
* TauCeti.Transfers.ext_ztr [characterisation] — STATEMENT: For X smooth and F a Nisnevich
    (respectively étale) sheaf of R-modules with transfers, Ext^n(R_tr(X), F) ≅ H^n_Nis(X, F)
    (respectively H^n_et(X, F)), and the cohomology presheaves H^n(−, F) are presheaves with
    transfers (MVW 13.4, 6.21, 6.24). Omitted: PST, EST and DMeff are carriers without categorical,
    monoidal or triangulated structure; Ext groups and Nisnevich cohomology are not exposed.
* TauCeti.Transfers.cech_resolution [other] — STATEMENT: For an étale or Nisnevich covering U → X
    the Čech complex of R_tr(U) resolves R_tr(X) as a complex of étale and of Nisnevich sheaves; for
    a Zariski covering {U_1, …, U_n} the finite complex 0 → R_tr(U_1 ∩ ⋯ ∩ U_n) → ⋯ → ⊕ R_tr(U_i) →
    R_tr(X) → 0 is exact as Nisnevich sheaves (MVW 6.12, 6.14), but not as Zariski sheaves (MVW
    6.13). Omitted: PST, EST and DMeff are carriers without categorical, monoidal or triangulated
    structure.
* TauCeti.Transfers.nisnevich_excision [other] — STATEMENT: For f : Y → X étale between smooth
    schemes and Z ⊂ X closed with f^{−1}(Z) → Z an isomorphism, ℤ(Y)/ℤ(Y − f^{−1}Z) → ℤ(X)/ℤ(X − Z)
    is an isomorphism of Nisnevich sheaves (MVW Exercise 12.20), and likewise R_tr(Y)/R_tr(Y −
    f^{−1}Z) → R_tr(X)/R_tr(X − Z) (a correspondence from a henselian local scheme meeting Z lifts
    uniquely along f), as used in MVW 13.19 and 15.15. Omitted: PST, EST and DMeff are carriers
    without categorical, monoidal or triangulated structure.
* test Transfers.test_ztr_point [computation] — STATEMENT: ℤ_tr(Spec k)(X) = ℤ^{π_0(X)}. Omitted:
    sections of PST objects are not exposed.
* test Transfers.test_zero_presheaf [degenerate] — STATEMENT: The zero presheaf is a Nisnevich sheaf
    with transfers. Omitted: PST and NST are uninterpreted carriers without category structure.
* test Transfers.test_units [compatibility] — STATEMENT: O^× with transfers given by norms agrees
    with G_m on Sm/k. Omitted: sections of PST objects are not exposed.
* test Transfers.test_nisnevich_not_etale [non-example] — STATEMENT: For k = ℚ and l = 2, the
    Nisnevich sheaf with transfers O^×/2 (the sheaf associated with U ↦ O^×(U)/O^×(U)^2, equal to
    O^× ⊗_Nis ℤ/2) has value ℚ^×/ℚ^{×2} ≠ 0 at Spec ℚ, while its étale sheafification is 0 (MVW
    Exercise 12.9, Example 13.2): Nisnevich sheaves with transfers are not étale sheaves with
    transfers. Omitted: PST, EST and DMeff are carriers without categorical, monoidal or
    triangulated structure.
-/

/- ### The Suslin complex and the motivic complexes ℤ(q) — packet node `M.5a/suslin-complex-and-motivic-complexes` (construction)
* TauCeti.Transfers.suslinComplex [constructor] — STATEMENT: C_*F for a presheaf (with transfers) F.
    Omitted: complexes of presheaves with transfers have no carrier here.
* TauCeti.Transfers.motivicComplex [constructor] — STATEMENT: ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q] and A(q)
    = ℤ(q) ⊗ A. Omitted: complexes of presheaves with transfers have no carrier here.
* TauCeti.Transfers.motivicCohomology [constructor] — LEAN: H^{p,q}(X, A) = H^{p}_Zar(X, A(q)).
* TauCeti.Transfers.motivicComplex_zero [equivalence] — STATEMENT: ℤ(0) ≃ ℤ. Omitted: complexes of
    presheaves with transfers have no carrier here; test_weight_zero states the consequence on
    cohomology.
* TauCeti.Transfers.motivicComplex_one [equivalence] — STATEMENT: ℤ(1) ≃ O^×[−1] (MVW 4.1). Omitted:
    complexes of presheaves with transfers have no carrier here; test_weight_one_field states the
    consequence for fields.
* TauCeti.Transfers.mul [constructor] — LEAN: Products ℤ(q) ⊗ ℤ(q') → ℤ(q + q') of complexes of
    presheaves, homotopy associative (MVW 3.11), factoring through ℤ(q) ⊗_tr ℤ(q') (MVW 10.4); they
    induce associative pairings H^{p,q}(X, ℤ) ⊗ H^{p',q'}(X, ℤ) → H^{p+p',q+q'}(X, ℤ) (MVW 3.12).
    Their graded commutativity (MVW 15.9) rests on the triviality of the symmetric group action on
    ℤ(n) over a perfect field, MotivesAndAlgebraicCycles MC.4/symmetric-group-acts-trivially-on-
    tate-twists.
* TauCeti.Transfers.diagonal_milnor [equivalence] — LEAN: H^{n,n}(Spec F, ℤ) ≅ K^M_n(F), sending
    {a_1, …, a_n} to the product of the classes of a_i (MVW 5.1).
* TauCeti.Transfers.motivicCohomology_baseChange [functoriality] — STATEMENT: For a field extension
    k ⊂ F there is a natural map H^{p,q}(X, A) → H^{p,q}(X_F, A), and for F/k finite separable and U
    smooth over F the motivic complexes of U over k and over F agree (MVW 3.7, 3.8). Omitted: base
    change of schemes along field extensions has no carrier here.
* test Transfers.test_weight_zero [degenerate] — LEAN (example): H^{0,0}(X, ℤ) = ℤ^{π_0(X)} and
    H^{p,0} = 0 for p ≠ 0.
* test Transfers.test_weight_one_field [computation] — LEAN (example): H^{1,1}(Spec F, ℤ) ≅ F^×.
* test Transfers.test_vs_cycle_complex [compatibility] — LEAN (example): For X smooth over a perfect
    field, H^{p,q}(X, ℤ) ≅ H^{p}(X, Z(q)) of M.4 (MVW 19.1; the comparison is
    MotivesAndAlgebraicCycles MC.4's).
* test Transfers.test_negative_vanish [non-example] — LEAN (example): H^{p,q}(Spec F, ℤ) = 0 for p >
    q (ℤ(q) vanishes in degrees > q and Spec F has Zariski cohomological dimension 0), and the smash
    product matters: with the unreduced complex C_*ℤ_tr(𝔾_m)[−1] in place of ℤ(1), the first
    cohomology at Spec F would be ℤ ⊕ F^× (MVW 4.4, 7.3) instead of H^{1,1}(Spec F, ℤ) = F^×.
-/

/- ### Voevodsky's theorem on homotopy invariant presheaves with transfers — packet node `M.5a/homotopy-invariant-sheaves` (theorem)
Lean signature: STATEMENT. Omitted: PST is an uninterpreted carrier; homotopy invariance and
Nisnevich cohomology are not exposed.
-/

/- ### The triangulated category of effective motives — packet node `M.5a/effective-motives` (construction)
* TauCeti.Transfers.DMeff [constructor] — LEAN: DM^{eff,−}_Nis(k, R) = D^−(Sh_Nis(Cor_k,
    R))[W_A^{−1}], a tensor triangulated category, with the triangulated localisation functor from
    D^−(Sh_Nis(Cor_k, R)).
* TauCeti.Transfers.motive [constructor] — LEAN: M(X) for X ∈ Sm/k and M(𝒳) for smooth simplicial
    schemes.
* TauCeti.Transfers.motive_tensor [simp] — STATEMENT: M(X) ⊗ M(Y) ≅ M(X × Y). Omitted: DMeff is a
    carrier without monoidal or categorical structure.
* TauCeti.Transfers.motive_A1 [simp] — STATEMENT: M(X × 𝔸^1) ≅ M(X). Omitted: DMeff is a carrier
    without isomorphisms of objects.
* TauCeti.Transfers.hom_motive_tate [characterisation] — LEAN: For k perfect and X smooth, Hom(M(X),
    R(i)[n]) ≅ H^{n,i}(X, R), and Hom(M(X), L[n]) ≅ H^n_Zar(X, L) for L A¹-local (MVW 14.16).
* TauCeti.Transfers.localisation_equiv [equivalence] — STATEMENT: For k perfect, the A¹-local
    complexes are those with homotopy invariant cohomology sheaves; they form a full tensor
    triangulated subcategory equivalent to DM^{eff,−}_Nis(k, R), with C_* as left adjoint of the
    inclusion (MVW 14.8, 14.11). Omitted: DMeff is a carrier without categorical structure.
* TauCeti.Transfers.motive_suslin [characterisation] — STATEMENT: K → Tot C_*K is an A¹-weak
    equivalence for every bounded above complex K, so M(X) ≅ C_*R_tr(X) (MVW 14.4). Omitted: PST,
    EST and DMeff are carriers without categorical, monoidal or triangulated structure.
* TauCeti.Transfers.tate_tensor [relation] — STATEMENT: R(i) ⊗ R(j) ≅ R(i + j) in DM^{eff,−}_Nis(k,
    R), induced by the product of MVW 10.4, and R(1)[1] ≅ M(𝔾_m^{∧1}) is the reduced motive of (𝔾_m,
    1). Omitted: PST, EST and DMeff are carriers without categorical, monoidal or triangulated
    structure.
* TauCeti.Transfers.rhom [universal-property] — STATEMENT: For X smooth over a perfect field,
    RHom(R_tr(X), −) is right adjoint to − ⊗ M(X) on D^−(Sh_Nis(Cor_k, R)) and on DM^{eff,−}_Nis(k,
    R), and preserves A¹-local complexes (MVW 14.12). Omitted: PST, EST and DMeff are carriers
    without categorical, monoidal or triangulated structure.
* TauCeti.Transfers.DMeffEt [other] — LEAN: The étale analogue DM^{eff,−}_et(k, R) =
    D^−(Sh_et(Cor_k, R))[W_A^{−1}] (MVW Definition 9.2), with the tensor triangulated sheafification
    functor DM^{eff,−}_Nis(k, R) → DM^{eff,−}_et(k, R) (MVW 14.3).
* test Transfers.test_point [degenerate] — STATEMENT: M(Spec k) = R is the unit object. Omitted:
    DMeff is a carrier without a unit object.
* test Transfers.test_projective_line [computation] — STATEMENT: Over a perfect field, Hom(M(ℙ^1),
    R(1)[2]) ≅ H^{2,1}(ℙ^1, R) ≅ Pic(ℙ^1) ⊗ R ≅ R, while Hom(M(Spec k), R(1)[2]) ≅ H^{2,1}(Spec k,
    R) = 0. Omitted: projective space has no Mathlib carrier.
* test Transfers.test_hom_cycles [compatibility] — LEAN (example): Over a perfect field and for X
    smooth, Hom(M(X), ℤ(1)[2]) ≅ Pic(X) = CH^1(X), Tau Ceti's group of line-bundle classes (MVW 4.2
    and 14.16); the comparison Hom(M(X), ℤ(q)[p]) ≅ CH^q(X, 2q − p) in all weights is
    MotivesAndAlgebraicCycles MC.4/motivic-cohomology-higher-chow.
* test Transfers.test_affine_line [non-example] — STATEMENT: M(𝔸^1) → M(Spec k) is an isomorphism,
    whereas ℤ_tr(𝔸^1) → ℤ is not an isomorphism in D^−(Sh_Nis(Cor_k)): at the point Spec k it is the
    degree map from the zero-cycles of 𝔸^1 to ℤ, whose kernel contains [0] − [1] ≠ 0. A definition
    omitting the A¹-localisation fails this test. Omitted: DMeff is a carrier without direct sums or
    isomorphisms of objects.
-/

/- ### Voevodsky's cancellation theorem — packet node `M.5a/cancellation` (theorem)
Lean signature: TauCeti.Transfers.cancellation
-/

/- ### Transfers on higher Chow groups — packet node `M.5a/cycle-complex-transfers` (theorem)
Lean signature: STATEMENT. Omitted: the action of Cor on CH and the comparison of complexes have no
carrier here.
-/

/- ### Étale motivic cohomology with finite coefficients and the comparison map — packet node `M.5a/etale-motivic-comparison` (theorem)
Lean signature: STATEMENT. Omitted: the map is `TauCeti.Transfers.toEtale`; its weight-one
description needs ℤ/n(q) as complexes.
-/

/- ### Imperfect fields and filtered colimits — packet node `M.5a/imperfect-field-passage` (theorem)
Lean signature: STATEMENT. Omitted: base change of schemes along field extensions has no carrier
here.
-/

/- ### Motivic reduced power operations — packet node `M.5b/motivic-steenrod-operations` (construction)
* TauCeti.MotivicSteenrod.bockstein [constructor] — LEAN: β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳, ℤ/l).
* TauCeti.MotivicSteenrod.reducedPower [constructor] — LEAN: P^i : H̃^{p,q} → H̃^{p+2i(l−1),
    q+i(l−1)}.
* TauCeti.MotivicSteenrod.natural [functoriality] — LEAN: β and P^i commute with pullback along maps
    of pointed simplicial schemes.
* TauCeti.MotivicSteenrod.suspension [compatibility] — STATEMENT: β and P^i commute with the
    simplicial and 𝔾_m suspension isomorphisms. Omitted: suspension isomorphisms of pointed
    simplicial schemes have no carrier here.
* TauCeti.MotivicSteenrod.BSl_cohomology [characterisation] — STATEMENT: H̃^{*,*}(𝒳 ∧ (BS_l)_+, ℤ/l)
    = H̃^{*,*}(𝒳, ℤ/l)[[c, d]]/(c² = τd + ρc) for l = 2 and /(c² = 0) for l odd, with c ∈
    H^{2l−3,l−1}, d ∈ H^{2l−2,l−1}, β̃(c) = d integrally and c restricting to 0 at the base point
    (RPO Theorems 6.14, 6.16). Omitted: BS_l and smash products of simplicial schemes have no
    carrier here.
* TauCeti.MotivicSteenrod.etale_realisation [compatibility] — STATEMENT: The comparison map
    H̃^{p,q}(𝒳, ℤ/l) → H̃^p_et(𝒳, μ_l^{⊗q}) commutes with β when the étale Bockstein is taken for 0
    → μ_l^{⊗q} → μ_{l²}^{⊗q} → μ_l^{⊗q} → 0; for the untwisted étale ℤ/l-Bockstein this needs μ_{l²}
    ⊂ k (compare RPO Lemma 6.9). Omitted: étale Steenrod operations have no carrier here.
* TauCeti.MotivicSteenrod.betaPower [constructor] — LEAN: B^i : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+2i(l−1)+1,
    q+i(l−1)}(𝒳, ℤ/l), the c-coefficient of the total power operation; Sq^{2i+1} = B^i for l = 2.
* TauCeti.MotivicSteenrod.totalPower [data] — STATEMENT: The total power operation P_l :
    H̃^{2d,d}(𝒳, ℤ/l) → H̃^{2dl,dl}(𝒳 ∧ (BS_l)_+, ℤ/l), P_l(w) = Σ_{i≥0}(C_{i+1}(w)·c·d^i +
    D_i(w)·d^i); its restriction along a rational point of BS_l is w ↦ w^l (RPO Lemma 5.10).
    Omitted: BS_l and smash products of simplicial schemes have no carrier here.
* TauCeti.MotivicSteenrod.reducedPower_zero [simp] — LEAN: P^0 = Id, and P^i = B^i = 0 for i < 0.
* TauCeti.MotivicSteenrod.bockstein_tau [simp] — LEAN: For l = 2 and char k ≠ 2: β(τ) = ρ in
    H^{1,1}(k, ℤ/2), and β(ρ) = 0 (ρ lifts to H^{1,1}(k, ℤ) = k^×).
* test MotivicSteenrod.test_P0 [degenerate] — LEAN (example): P^0 = Id.
* test MotivicSteenrod.test_square [computation] — STATEMENT: For u ∈ H̃^{2n,n}, P^n(u) = u^l (RPO
    Lemma 9.7). Omitted: the l-th power u^l needs the product with casts on the bidegrees.
* test MotivicSteenrod.test_bockstein_P [compatibility] — LEAN (example): β P^i = B^i and β B^i = 0
    (RPO Lemma 9.5).
* test MotivicSteenrod.test_rho_term [non-example] — LEAN (example): For l = 2 the operations are
    not H^{*,*}(k, ℤ/2)-linear: Sq^1(τ) = β(τ) = ρ, which is nonzero for k = ℝ (−1 is not a square),
    whereas τ·Sq^1(1) = 0; a definition making Sq^i linear over the coefficients of the point fails
    here.
* test MotivicSteenrod.test_cartan_tau [computation] — STATEMENT: Let l = 2, char k ≠ 2, and u ∈
    H^{1,1}(Bμ_2, ℤ/2), v = β(u) ∈ H^{2,1}(Bμ_2, ℤ/2) the generators of RPO Theorem 6.10 (u² = τv +
    ρu). Then Sq^2(u²) = τ·v² ≠ 0 in H^{4,3}(Bμ_2, ℤ/2) (Cartan formula with Sq^2u = 0 by
    instability); the topological Cartan formula, with coefficient 1 on Sq^1u·Sq^1u, would give v²,
    which lies in the wrong bidegree (4, 2). Omitted: Bμ_2 and products of classes need carriers and
    casts on the bidegrees.
-/

/- ### Cartan formula, instability and Adem relations — packet node `M.5b/steenrod-relations` (theorem)
Lean signature: TauCeti.MotivicSteenrod.reducedPower_zero
-/

/- ### The Milnor operations Q_i — packet node `M.5b/milnor-operations` (construction)
* TauCeti.MotivicSteenrod.milnorOp [constructor] — LEAN: Q_i ∈ A^{2l^i−1, l^i−1}.
* TauCeti.MotivicSteenrod.milnorOp_zero [simp] — LEAN: Q_0 = β.
* TauCeti.MotivicSteenrod.milnorOp_sq [relation] — LEAN: Q_i ∘ Q_i = 0.
* TauCeti.MotivicSteenrod.milnorOp_anticomm [relation] — LEAN: Q_iQ_j = −Q_jQ_i (for l = 2: Q_iQ_j =
    Q_jQ_i, the exterior algebra of RPO Proposition 13.4).
* TauCeti.MotivicSteenrod.Q0_Pb [relation] — STATEMENT: For l > 2 and b = (l^n − 1)/(l − 1): Q_0P^b
    = Σ_{i=0}^{n} (−1)^i P^{b−(l^i−1)/(l−1)}Q_i (Milnor's normalisation of Q_i). Omitted: a sum of
    composites landing in bidegrees equal only up to casts.
* TauCeti.MotivicSteenrod.milnorOp_dual [characterisation] — STATEMENT: ⟨τ(E)ξ(R), Q_i⟩ = 1 if E =
    e_i and R = 0, and 0 for every other basis monomial of A_{*,*}. Omitted: the dual motivic
    Steenrod algebra A_{*,*} has no carrier here.
* TauCeti.MotivicSteenrod.milnorOp_succ [relation] — STATEMENT: For l = 2 and i ≥ 1, Q_i = Q_0q_i −
    q_iQ_0; for l odd, Q_{i+1} = P^{l^i}Q_i − Q_iP^{l^i}. Omitted: the commutator of operations of
    different bidegrees needs casts on the bidegrees.
* TauCeti.MotivicSteenrod.milnorOp_mul [relation] — STATEMENT: For l odd, Q_i(uv) = Q_i(u)v + (−1)^p
    uQ_i(v) for u ∈ H̃^{p,*}; for l = 2, ψ*(Q_i) = 1 ⊗ Q_i + Q_i ⊗ 1 + ρ·Σ c_{E,E'}Q(E) ⊗ Q(E'), so
    the same formula holds when ρ = 0 or when Q_j(u) = 0 for all j < i. Omitted: products and the
    coproduct ψ* need casts on the bidegrees.
* TauCeti.MotivicSteenrod.dualMilnorOp_thomClass [relation] — STATEMENT: q_n(t_V) = s_{l^n−1}(V)·t_V
    for the Thom class t_V of a vector bundle V on a smooth quasi-projective scheme. Omitted: Thom
    classes of vector bundles have no carrier here.
* test MotivicSteenrod.test_Q0_beta [degenerate] — LEAN (example): Q_0 is the Bockstein β.
* test MotivicSteenrod.test_Q_bidegree [computation] — STATEMENT: Q_1 has bidegree (2l − 1, l − 1);
    for l = 2, (3, 1). Omitted: the bidegree is fixed by the type of `milnorOp`, so the test holds
    by the type.
* test MotivicSteenrod.test_Q1_formula [compatibility] — STATEMENT: For l odd, Q_1 = P^1β − βP^1
    (Milnor's topological formula); for l = 2, Q_1 = Sq^3 + Sq^2Sq^1, which in topology is Milnor's
    Q_1 = Sq^3 + Sq^2Sq^1. Omitted: the commutator of operations of different bidegrees needs casts
    on the bidegrees.
* test MotivicSteenrod.test_Q2_not_commutator [non-example] — STATEMENT: For l = 2 and k = ℝ (ρ ≠
    0), Sq^4Q_1 − Q_1Sq^4 = Q_2 + ρQ_0Q_1Sq^2 with ρQ_0Q_1Sq^2 ≠ 0 (A^{*,*} is free over H^{*,*} on
    the Milnor basis), so defining Q_2 by the topological recursion [Sq^4, Q_1] gives the wrong
    operation. Omitted: the commutator of operations of different bidegrees needs casts on the
    bidegrees.
* test MotivicSteenrod.test_Q0_Pb_sign [characterisation] — STATEMENT: For l odd and n = 1 (b = 1):
    Q_0P^1 = P^1Q_0 − Q_1 with Q_1 = P^1β − βP^1; the all-plus display P^1Q_0 + Q_1 equals 2P^1β −
    βP^1 ≠ βP^1, since P^1β and βP^1 are distinct admissible monomials. Omitted: sums of composites
    of operations land in bidegrees equal only up to casts.
-/

/- ### ν_n-varieties and norm varieties — packet node `M.5b/nu-variety` (definition)
* TauCeti.RostMotive.charNumber [constructor] — LEAN: s_d(X) ∈ ℤ for X smooth projective of
    dimension d.
* TauCeti.RostMotive.IsNuVariety [characterisation] — LEAN: For n ≥ 0: X is a ν_n-variety iff dim X
    = l^n − 1 and s_{l^n−1}(X) ≢ 0 mod l² (with s_0(X) = deg X).
* TauCeti.RostMotive.Splits [characterisation] — LEAN: X splits a iff a ↦ 0 in K^M_n(k(X))/l.
* TauCeti.RostMotive.IsNormVariety [constructor] — STATEMENT: For n ≥ 2 and {a} ≠ 0: X is a norm
    variety for a iff X is smooth projective of dimension l^{n−1} − 1, splits a, and is l-generic.
    Omitted: l-genericity needs points over field extensions of k-schemes, and the carriers here are
    bare schemes; a Prop placeholder is not allowed.
* TauCeti.RostMotive.splits_baseChange [functoriality] — LEAN: If X splits a then X_{k'} splits
    a_{k'} for every field extension k'/k.
* TauCeti.RostMotive.IsGenericSplitting [constructor] — STATEMENT: X is l-generic for a iff every
    field F ⊇ k splitting a has a finite extension E of degree prime to l with X(E) ≠ ∅. Omitted:
    points of X over field extensions need k-schemes; the carriers here are bare schemes.
* TauCeti.RostMotive.IsNuLeVariety [constructor] — LEAN: X is a ν_{≤n}-variety iff X is a ν_n-
    variety and for each i < n some ν_i-variety maps to X.
* TauCeti.RostMotive.IsRostVariety [constructor] — STATEMENT: X is a Rost variety for a iff X is a
    ν_{≤(n−1)}-variety splitting a and H_{−1,−1}(X × X) → H_{−1,−1}(X) → k^× is exact. Omitted:
    Rost's norm condition on H_{−1,−1} cannot be stated with the carriers here.
* TauCeti.RostMotive.charNumber_add [relation] — STATEMENT: s_d(E) = s_d(E') + s_d(E'') for 0 → E' →
    E → E'' → 0, and s_d(L) = c_1(L)^d for a line bundle L. Omitted: vector bundles and Chern roots
    have no carrier here.
* TauCeti.RostMotive.charNumber_projectiveSpace [example] — STATEMENT: s_d(ℙ^d) = d + 1. Omitted:
    projective space has no Mathlib carrier.
* TauCeti.RostMotive.charNumber_baseChange [compatibility] — STATEMENT: s_d(X_K) = s_d(X) for every
    field extension K/k; hence X is a ν_n-variety iff X_K is. Omitted: base change of schemes along
    field extensions has no carrier here.
* TauCeti.RostMotive.charNumber_prod [relation] — LEAN: s_{d+e}(X × Y) = 0 if dim X = d ≥ 1 and dim
    Y = e ≥ 1 (T_{X×Y} = pr_1^*T_X ⊕ pr_2^*T_Y and CH^{d+e} of each factor vanishes).
* test RostMotive.test_projective_space [computation] — STATEMENT: s_{l−1}(ℙ^{l−1}) = l, so ℙ^{l−1}
    is a ν_1-variety. Omitted: projective space has no Mathlib carrier.
* test RostMotive.test_point [degenerate] — LEAN (example): Spec k (dimension 0 = l^0 − 1) splits a
    iff a = 0 in K^M_n(k)/l.
* test RostMotive.test_splits_degree_one [compatibility] — STATEMENT: If X has a k-rational point
    and splits a, then a = 0. Omitted: `Splits` is stated through the function field; rational
    points of X are not linked to it here.
* test RostMotive.test_quadric_not_nu [non-example] — STATEMENT: For l = 2: ℙ^3 has dimension 3 = 2²
    − 1 and s_3(ℙ^3) = 4 ≡ 0 (mod 4), so ℙ^3 is not a ν_2-variety although 2 divides s_3 (a
    definition testing divisibility by l instead of l² fails); a smooth conic has s_1 = 2 ≢ 0 (mod
    4) and is a ν_1-variety; ℙ^1 × ℙ^1 has dimension 2 ≠ 2^n − 1 and is not a ν_n-variety for any n.
    Omitted: ℙ^3, conics and ℙ^1 × ℙ^1 have no carrier here.
* test RostMotive.test_nu_zero [computation] — LEAN (example): For l = 2 and a ∈ k^× not a square,
    Spec k(√a) is a ν_0-variety (degree 2 ≢ 0 mod 4); Spec K for a field K of degree 4 over k is
    not.
* test RostMotive.test_rational_curve_not_norm [non-example] — STATEMENT: For l = 2, n = 2 and {a_1,
    a_2} ≠ 0 in K^M_2(k)/2, ℙ^1_k is a ν_1-variety of dimension 2^1 − 1 but not a norm variety for
    a: it has a rational point, so it splits a only if {a} = 0 (test_splits_degree_one). Omitted:
    IsNormVariety cannot be stated (l-genericity needs k-schemes) and ℙ^1 has no carrier.
-/

/- ### Voevodsky's motivic degree theorem — packet node `M.5b/degree-theorem` (theorem)
Lean signature: STATEMENT. Omitted: embedded simplicial schemes, DM_𝒳 and Thom classes have no
carrier here.
-/

/- ### Pfister neighbours as norm varieties for l = 2 — packet node `M.5b/pfister-norm-variety` (construction)
* TauCeti.RostMotive.pfisterNeighbourQuadric [constructor] — LEAN: Q_a ⊂ ℙ^{2^{n−1}} for a ∈
    (k^×)^n.
* TauCeti.RostMotive.pfister_dim [simp] — LEAN: dim Q_a = 2^{n−1} − 1.
* TauCeti.RostMotive.pfister_splits [characterisation] — STATEMENT: Q_a splits {a_1, …, a_n} mod 2.
    Omitted: the function field of `pfisterNeighbourQuadric` has no carrier here.
* TauCeti.RostMotive.pfister_isNu [characterisation] — LEAN: Q_a is a ν_{n−1}-variety for l = 2.
* TauCeti.RostMotive.pfister_point_iff [characterisation] — LEAN: For every field F ⊇ k: Q_a(F) ≠ ∅
    iff {a_1, …, a_n} = 0 in K^M_n(F)/2.
* TauCeti.RostMotive.pfister_isNuLe [characterisation] — LEAN: Q_a is a ν_{≤(n−1)}-variety for l =
    2, through the linear sections Q_{(a_1, …, a_{i+1})} ⊂ Q_a.
* TauCeti.RostMotive.pfister_isNormVariety [characterisation] — STATEMENT: For n ≥ 2 and {a} ≠ 0 in
    K^M_n(k)/2, Q_a is a norm variety for a. Omitted: IsNormVariety cannot be stated with the
    carriers here.
* test RostMotive.test_pfister_n1 [degenerate] — STATEMENT: For n = 1, Q_a is the zero-dimensional
    quadric x² = a_1 z², which has a point iff a_1 is a square. Omitted: zero-dimensional quadrics
    as schemes have no carrier here.
* test RostMotive.test_pfister_conic [computation] — LEAN (example): For n = 2 and a = (−1, −1) over
    ℝ, q_a = ⟨1, 1⟩ ⊥ ⟨1⟩, so Q_a is the conic x² + y² + z² = 0 with no real point, matching {−1,
    −1} ≠ 0 in K^M_2(ℝ)/2.
* test RostMotive.test_pfister_quaternion [compatibility] — STATEMENT: For n = 2, Q_a has a point
    iff the quaternion algebra (a_1, a_2) splits (QuadraticFormInvariants Layer 2). Omitted:
    quaternion algebras (QuadraticFormInvariants Layer 2) are not imported.
* test RostMotive.test_not_full_pfister [non-example] — STATEMENT: For n ≥ 2 the full Pfister
    quadric ⟨⟨a_1, …, a_n⟩⟩ = 0 has dimension 2^n − 2, which is even and ≥ 2, hence not of the form
    2^m − 1; it is not a ν_m-variety for any m and not a norm variety, so the neighbour is required
    (for n = 1 the two quadrics coincide). Omitted: the full Pfister quadric has no carrier here.
-/

/- ### Rost's Chain Lemma and Norm Principle — packet node `M.5b/chain-lemma-and-norm-principle` (theorem)
Lean signature: STATEMENT. Omitted: A_0(X, K_1) and l-special fields have no carrier here.
-/

/- ### Existence of norm varieties — packet node `M.5b/norm-variety-existence` (theorem)
Lean signature: STATEMENT. Omitted: Rost's norm condition on H_{−1,−1} cannot be stated with the
carriers here.
-/

/- ### Čech simplicial schemes and motives over embedded simplicial schemes — packet node `M.5b/cech-simplicial-scheme` (construction)
* TauCeti.RostMotive.cech [constructor] — STATEMENT: Č(X) as a simplicial smooth k-scheme with
    M(Č(X)) → ℤ. Omitted: simplicial schemes have no carrier here.
* TauCeti.RostMotive.cech_point [characterisation] — STATEMENT: If X(k) ≠ ∅ then M(Č(X)) → ℤ is an
    isomorphism. Omitted: simplicial schemes have no carrier here.
* TauCeti.RostMotive.cech_suspension [constructor] — STATEMENT: 𝒳̃ = cone(Č(X)_+ → S^0) and its
    reduced motivic cohomology. Omitted: simplicial schemes have no carrier here.
* TauCeti.RostMotive.cech_baseChange [functoriality] — STATEMENT: Č(X)_{k'} = Č(X_{k'}) and M
    commutes with base change. Omitted: simplicial schemes have no carrier here.
* TauCeti.RostMotive.cech_idempotent [relation] — STATEMENT: M(Č(X)) ⊗ M(Č(X)) ≅ M(Č(X)). Omitted:
    simplicial schemes and tensor products in DMeff have no carrier here.
* TauCeti.RostMotive.cech_weakEquiv_iff [characterisation] — STATEMENT: Č(X) → Spec k is a
    simplicial weak equivalence if and only if X(k) ≠ ∅. Omitted: simplicial schemes and DM_𝒳 have
    no carrier here.
* TauCeti.RostMotive.cech_exponent [relation] — STATEMENT: If X(E) ≠ ∅ for an extension E/k of
    degree e then e·H̃^{*,*}(𝒳̃, ℤ) = 0; with ℤ_(l)-coefficients M(Č(X)) → ℤ_(l) induces
    isomorphisms on motivic cohomology when X has a zero-cycle of degree prime to l. Omitted:
    simplicial schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.cech_lichtenbaum [characterisation] — STATEMENT: For X ≠ ∅, H^{p,q}_L(k, ℤ) →
    H^{p,q}_L(Č(X), ℤ) is an isomorphism for all p, q; hence H̃^{*,*}_L(𝒳̃, A) = 0. Omitted:
    simplicial schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.DMOver [structure] — STATEMENT: For an embedded 𝒳, DM_𝒳 = {N ∈ DM^{eff,−}(k) :
    N ⊗ M(𝒳) → N is an isomorphism}, a localising tensor ideal containing the Tate motives ℤ_𝒳(q)[p]
    = M(𝒳)(q)[p]. Omitted: simplicial schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.mem_DMOver_cech_iff [characterisation] — STATEMENT: M(Y) ∈ DM_{Č(X)} if and
    only if M(Y) → ℤ factors through M(Č(X)) → ℤ; in particular M(Y) ∈ DM_{Č(X)} whenever Hom(Y, X)
    ≠ ∅. Omitted: simplicial schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.hom_tate_over [universal-property] — STATEMENT: For N ∈ DM_𝒳 and P ∈
    DM^{eff,−}(k), Hom(N, P ⊗ M(𝒳)) → Hom(N, P) is bijective; hence Hom(M(Y), ℤ_𝒳(q)[p]) =
    H^{p,q}(Y) for M(Y) ∈ DM_𝒳, and M(Y) → ℤ lifts uniquely to π_𝒳 : M(Y) → ℤ_𝒳. Omitted: simplicial
    schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.suspension_tensor_eq_zero [relation] — STATEMENT: M(𝒳̃) ⊗ N = 0 for every N ∈
    DM_𝒳. Omitted: simplicial schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.IsRestricted [other] — STATEMENT: N ∈ DM_𝒳 is restricted if Hom(P, N) → Hom(P ⊗
    M(𝒳), N) is bijective for all P ∈ DM^{eff,−}(k); M(X) is restricted for X smooth projective with
    M(X) ∈ DM_𝒳, and direct summands of restricted objects are restricted. Omitted: simplicial
    schemes and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.slice_conservative [characterisation] — STATEMENT: On Tate motives over 𝒳 the
    slice functor s_* is conservative and commutes with tensor products; the truncations Π_{≥n},
    Π_{<n} exist (Motives over simplicial schemes, Lemmas 5.14-5.18). Omitted: simplicial schemes
    and DM_𝒳 have no carrier here.
* TauCeti.RostMotive.splittingCech [constructor] — STATEMENT: 𝒳_a = Č(Y_a) for a symbol a mod l; for
    smooth connected X, M(X) ∈ DM_{𝒳_a} if and only if X splits a. Omitted: simplicial schemes and
    DM_𝒳 have no carrier here.
* test RostMotive.test_cech_point [degenerate] — STATEMENT: Č(Spec k) is the constant simplicial
    scheme and M(Č(Spec k)) = ℤ. Omitted: simplicial schemes have no carrier here.
* test RostMotive.test_cech_conic [computation] — STATEMENT: For a smooth conic C over a field of
    characteristic 0 splitting a nonzero quaternion symbol a = {a_1, a_2} mod 2 (so C(k) = ∅),
    H̃^{3,1}(𝒳̃_C, ℤ/2) ≠ 0: it contains the image of the nonzero class δ ∈ H^{2,1}(Č(C), ℤ/2) of
    Voevodsky 2011 Lemma 6.5, since H^{p,q}(𝒳) → H̃^{p+1,q}(𝒳̃) is injective for p > q. Omitted:
    simplicial schemes have no carrier here.
* test RostMotive.test_cech_etale [compatibility] — STATEMENT: For every nonempty smooth X the map
    Č(X) → Spec k induces isomorphisms H^{p,q}_L(k, ℤ) ≅ H^{p,q}_L(Č(X), ℤ) on Lichtenbaum motivic
    cohomology (étale-local contractibility), although M(Č(X)) → ℤ is not an isomorphism in
    DM^{eff,−}(k) when X has no zero-cycle of degree one (for instance a conic without rational
    point). Omitted: simplicial schemes have no carrier here.
* test RostMotive.test_cech_not_X [non-example] — STATEMENT: M(Č(X)) ≠ M(X) for X = ℙ^1: M(ℙ^1) = ℤ
    ⊕ ℤ(1)[2] while M(Č(ℙ^1)) = ℤ. Omitted: simplicial schemes have no carrier here.
* test RostMotive.test_cech_galois_weight_zero [computation] — STATEMENT: For E/k Galois of degree
    l, H^{p,0}(Č(Spec E), ℤ/l) ≅ H^p(Gal(E/k), ℤ/l) ≅ ℤ/l for every p ≥ 0; a definition replacing
    M(Č(X)) by ℤ whenever X ≠ ∅ gives 0 for p ≥ 1. Omitted: simplicial schemes and DM_𝒳 have no
    carrier here.
-/

/- ### The generalised Rost motive — packet node `M.5c/rost-motive` (construction)
* TauCeti.RostMotive.rostMotive [constructor] — LEAN: M_a = S^{l−1}(M_μ) ∈ DM_{𝒳_a} ⊂ DM^{eff,−}(k,
    ℤ_(l)), determined by (𝒳_a, δ); it is a direct summand of M(X) for every ν_{n−1}-variety X
    splitting a.
* TauCeti.RostMotive.rost_triangle [relation] — STATEMENT: Distinguished triangles M(𝒳)(ib)[2ib] →
    M_i → M_{i−1} → M(𝒳)(ib)[2ib + 1] and M_{i−1}(b)[2b] → M_i → M(𝒳) → M_{i−1}(b)[2b + 1] for 1 ≤ i
    ≤ l − 1. Omitted: DMeff is a carrier without triangulated structure.
* TauCeti.RostMotive.rost_summand [characterisation] — STATEMENT: M_a is a direct summand of M(X)
    via the projector p = Dλ ∘ (λ ∘ Dλ)^{−1} ∘ λ. Omitted: DMeff is a carrier without morphisms of
    objects or projectors.
* TauCeti.RostMotive.rost_dual [relation] — STATEMENT: (M_a, e'_M) is an internal Hom-object from
    M_a to ℤ(d)[2d]. Omitted: DMeff is a carrier without internal Hom.
* TauCeti.RostMotive.rost_split_after_splitting [characterisation] — STATEMENT: After a field
    extension splitting a, M_a ≅ ⊕_{i=0}^{l−1} ℤ(ib)[2ib]. Omitted: DMeff is a carrier without
    direct sums or base change.
* TauCeti.RostMotive.symmetric_power_operation [relation] — STATEMENT: φ_{l−1}(α) = c·βP^m(α) for α
    ∈ H̃^{2m+1,m}(−, ℤ/l) and a constant c ∈ (ℤ/l)^× (Voevodsky 2011 Theorem 3.8, node symmetric-
    power-operation); for α = μ mod l and m = b it shows that βP^b(μ) vanishes on M_{l−1}. Omitted:
    symmetric powers in DMeff have no carrier here.
* TauCeti.RostMotive.rost_rational [example] — STATEMENT: M_i ⊗ ℚ ≅ ⊕_{j=0}^{i} ℚ(jb)[2jb], since μ
    is l-torsion; with ℤ_(l)-coefficients M_i does not split. Omitted: DMeff is a carrier without
    direct sums or change of coefficients.
* TauCeti.RostMotive.rost_restricted [characterisation] — STATEMENT: M_a is restricted, and M(𝒳_a) ≅
    M(Č(X)) for every ν_{n−1}-variety X splitting a. Omitted: simplicial schemes and DM_𝒳 have no
    carrier here.
* test RostMotive.test_rost_split [degenerate] — STATEMENT: After base change to E = k(X), where X
    has a rational point, 𝒳_E ≃ Spec E and μ_E ∈ H^{2b+1,b}(E, ℤ_(l)) = 0, so (M_a)_E ≅
    ⊕_{i=0}^{l−1} ℤ_(l)(ib)[2ib]. Omitted: DMeff is a carrier without direct sums.
* test RostMotive.test_rost_conic [computation] — STATEMENT: For l = 2, n = 2: b = 1, d = 1, and M_a
    = M(C) for the conic C, with triangle M(𝒳)(1)[2] → M(C) → M(𝒳). Omitted: DMeff is a carrier
    without triangulated structure.
* test RostMotive.test_rost_rank [compatibility] — STATEMENT: Over k^sep, M_a has the Tate-motive
    decomposition of rank l, matching the l summands ℤ(ib)[2ib]. Omitted: DMeff is a carrier without
    direct sums or base change.
* test RostMotive.test_not_whole_X [non-example] — STATEMENT: For n ≥ 3 and l = 2, M_a ≠ M(Q_a): the
    Pfister neighbour quadric has more Tate summands over k^sep than the Rost motive. Omitted: DMeff
    is a carrier without isomorphisms of objects.
-/

/- ### The norm residue homomorphism in all degrees — packet node `M.5c/galois-symbol-all-degrees` (construction)
* TauCeti.NormResidue.map [constructor] — LEAN: h_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}), a graded ring
    homomorphism.
* TauCeti.NormResidue.map_symbol [simp] — STATEMENT: h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n).
    Omitted: the n-fold cup product needs casts on the degrees n = 1 + ⋯ + 1; `map_one` and
    `map_two` state degrees one and two.
* TauCeti.NormResidue.map_one [equivalence] — LEAN: h^1_F is the Kummer isomorphism F^×/m ≅ H¹(F,
    μ_m).
* TauCeti.NormResidue.map_two [compatibility] — LEAN: h^2_F is M.3's Galois symbol.
* TauCeti.NormResidue.map_res [functoriality] — LEAN: res_{E/F} ∘ h_F = h_E ∘ res_{E/F} for every
    field extension E/F with a chosen embedding of separable closures.
* TauCeti.NormResidue.map_norm [compatibility] — LEAN: cor_{E/F} ∘ h_E = h_F ∘ N_{E/F} for E/F
    finite, with cor the corestriction for E/F separable and multiplication by [E : F] under G_E =
    G_F for E/F purely inseparable.
* TauCeti.NormResidue.map_residue [compatibility] — STATEMENT: ∂_v ∘ h^n_F = (−1)^{n−1}
    h^{n−1}_{k(v)} ∘ ∂^M_v for a discrete valuation v with m invertible in k(v), where ∂^M_v{u_1, …,
    u_{n−1}, π} = {ū_1, …, ū_{n−1}} and ∂_vκ(π) = 1. Omitted: residue maps of discrete valuations
    have no carrier here.
* TauCeti.NormResidue.map_motivic [compatibility] — STATEMENT: h_F equals the composite K^M_n(F)/m ≅
    H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) with the normalised weight-one identification. Omitted:
    the normalised weight-one identification ℤ/m(1) ≃ μ_m needs complexes;
    `TauCeti.Transfers.toEtale` is the map.
* TauCeti.NormResidue.map_reduce [compatibility] — LEAN: For m | m', reduction of coefficients
    μ_{m'}^{⊗n} → μ_m^{⊗n} carries h_{F,m'} to h_{F,m} composed with K^M_n(F)/m' → K^M_n(F)/m.
* TauCeti.NormResidue.map_unramified [compatibility] — STATEMENT: For v-units u_1, …, u_n,
    h^n_F{u_1, …, u_n} is the restriction of κ(u_1) ∪ ⋯ ∪ κ(u_n) ∈ H^n_et(Spec 𝒪_v, μ_m^{⊗n}), whose
    restriction to the closed point is h^n_{k(v)}{ū_1, …, ū_n}. Omitted: étale cohomology of Spec
    𝒪_v and its restriction maps are not exposed.
* test NormResidue.test_degree_zero [degenerate] — LEAN (example): h^0_F : ℤ/m → H^0(F, ℤ/m) = ℤ/m
    is the identity.
* test NormResidue.test_real [computation] — LEAN (example): For F = ℝ, m = 2: h^n{−1, …, −1} =
    κ(−1)^n ≠ 0.
* test NormResidue.test_kummer [compatibility] — STATEMENT: h^1_F(a) is the image of
    TauCeti.kummerMap F m a under Layer 3's comparison of Tau Ceti's explicit H¹ with the canonical
    continuous cohomology; it is the class of σ ↦ σ(α)/α for any α ∈ F^s with α^m = a. Omitted: the
    cited Tau Ceti declarations are not in the shared build; `TauCeti.NormResidue.map_one` states it
    against the stand-in `TateTwist.kummer`.
* test NormResidue.test_finite_field [non-example] — LEAN (example): For F = 𝔽_q and n = 2 both
    sides vanish (K^M_2(𝔽_q) = 0, cd(𝔽_q) = 1); a map defined without the Steinberg relation on the
    tensor algebra would have nonzero source.
* test NormResidue.test_residue_sign [computation] — STATEMENT: For F = ℚ_p (p odd), m = ℓ a prime
    dividing p − 1 and a unit u with ū not an ℓ-th power in 𝔽_p: ∂_p(h²{u, p}) = −κ(ū) ≠ 0 and
    ∂_p(h²{p, u}) = κ(ū); a residue formula with sign +1 in every degree fails here. Omitted:
    residue maps of discrete valuations have no carrier here.
-/

/- ### The inductive step: Hilbert 90 for K^M_n and the vanishing of H^{n+1,n}(𝒳) — packet node `M.5c/hilbert-ninety-induction` (theorem)
Lean signature: STATEMENT. Omitted: reduced motivic cohomology of the Čech simplicial scheme has no
carrier here.
-/

/- ### The mod-l norm residue isomorphism — packet node `M.5c/mod-l-norm-residue` (theorem)
Lean signature: TauCeti.NormResidue.mod_l_norm_residue
-/

/- ### The norm residue theorem (Rost–Voevodsky) — packet node `M.5/norm-residue-theorem` (theorem)
Lean signature: TauCeti.NormResidue.norm_residue
-/

/- ### Tate's diagram (3.3) and the comparison of K₂ with ℓ-adic cohomology — packet node `M.3/tate-adic-comparison` (theorem)
Lean signature: STATEMENT. Omitted: the groups (μ_ℓ ⊗ E^×)^Δ, the maps γ, i and Tate's diagram need
Galois descent data not exposed here.
-/

/- ### Tate's criterion for injectivity of the Galois symbol modulo ℓ — packet node `M.3/tate-injectivity-criterion` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_injectivity_criterion
-/

/- ### The kernel of γ and the rank of H¹(F, ℤ_ℓ(2)) — packet node `M.3/tate-gamma-kernel` (theorem)
Lean signature: TauCeti.GaloisSymbol.tate_gamma_kernel_rank
-/

/- ### The last Gersten terms and graph cycles: CH^p(X) and CH^p(X, 1) — packet node `M.4/gersten-graph-comparison` (theorem)
Lean signature: STATEMENT. Omitted: the Gersten complex, tame symbols and graph cycles have no
carrier here.
-/

/- ### Tensor products of presheaves and sheaves with transfers — packet node `M.5a/tensor-product-transfers` (construction)
* TauCeti.Transfers.tensorTr [constructor] — LEAN: F ⊗_tr G for presheaves of R-modules with
    transfers (MVW 8.2), right exact in each variable and commuting with direct sums.
* TauCeti.Transfers.internalHom [universal-property] — STATEMENT: Hom(F ⊗_tr G, H) ≅ Hom(F, Hom(G,
    H)) with Hom(G, H)(X) = Hom(G ⊗_tr R_tr(X), H) (MVW 8.2, 8.3). Omitted: PST, EST and DMeff are
    carriers without categorical, monoidal or triangulated structure.
* TauCeti.Transfers.ztr_tensor [simp] — STATEMENT: R_tr(X) ⊗_tr R_tr(Y) ≅ R_tr(X × Y), natural in
    finite correspondences (MVW 8.10). Omitted: PST, EST and DMeff are carriers without categorical,
    monoidal or triangulated structure.
* TauCeti.Transfers.ztr_smash [simp] — STATEMENT: R_tr(X_1, x_1) ⊗_tr ⋯ ⊗_tr R_tr(X_n, x_n) ≅
    R_tr(X_1 ∧ ⋯ ∧ X_n); in particular R_tr(𝔾_m^{∧1})^{⊗_tr q} ≅ R_tr(𝔾_m^{∧q}) (MVW 8.10). Omitted:
    PST, EST and DMeff are carriers without categorical, monoidal or triangulated structure.
* TauCeti.Transfers.presheafTensor_toTensorTr [data] — STATEMENT: The natural map F ⊗_R G → F ⊗_tr
    G, given on representables by the external product followed by the diagonal (MVW 8.9). Omitted:
    PST, EST and DMeff are carriers without categorical, monoidal or triangulated structure.
* TauCeti.Transfers.derivedTensor [structure] — STATEMENT: ⊗^L_tr on D^−(PST(k, R)) and
    ⊗^L_{tr,Nis}, ⊗^L_{tr,et} on D^−(Sh_Nis(Cor_k, R)), D^−(Sh_et(Cor_k, R)): symmetric monoidal
    with unit R and triangulated in each variable (MVW 8.8, 8.17, 14.2). Omitted: PST, EST and DMeff
    are carriers without categorical, monoidal or triangulated structure.
* TauCeti.Transfers.derivedTensor_sheafify [compatibility] — STATEMENT: (C ⊗^L_tr D)_Nis depends
    only on C_Nis and D_Nis up to quasi-isomorphism, and sheafification D^−(PST(k, R)) →
    D^−(Sh_Nis(Cor_k, R)) is tensor triangulated (MVW 8.16 and its Nisnevich analogue). Omitted:
    PST, EST and DMeff are carriers without categorical, monoidal or triangulated structure.
* test Transfers.test_tensor_unit [degenerate] — STATEMENT: R ⊗_tr F ≅ F for every presheaf of
    R-modules with transfers F, since R = R_tr(Spec k) and Spec k × X = X. Omitted: PST, EST and
    DMeff are carriers without categorical, monoidal or triangulated structure.
* test Transfers.test_tensor_torsion [computation] — STATEMENT: ℤ/n ⊗_tr ℤ_tr(X) ≅ (ℤ/n)_tr(X) =
    ℤ_tr(X)/n, computed with the projective resolution ℤ --n--> ℤ of ℤ/n (MVW 8.11). Omitted: PST,
    EST and DMeff are carriers without categorical, monoidal or triangulated structure.
* test Transfers.test_not_presheaf_tensor [non-example] — STATEMENT: For k = ℚ the map ℤ_tr(𝔾_m)(ℚ)
    ⊗ ℤ_tr(𝔾_m)(ℚ) → (ℤ_tr(𝔾_m) ⊗_tr ℤ_tr(𝔾_m))(ℚ) = Z_0(𝔾_m × 𝔾_m) of MVW 8.9 is not surjective: it
    sends [x] ⊗ [y] to the cycle of x × y, and for x = y the closed point t² + 1 = 0 this cycle is
    (i, i) + (i, −i), so the closed point (i, i) alone is not in the image. The objectwise tensor
    product is therefore not ⊗_tr. Omitted: PST, EST and DMeff are carriers without categorical,
    monoidal or triangulated structure.
* test Transfers.test_tensor_locally_constant [compatibility] — STATEMENT: For étale sheaves of
    R-modules with transfers F, F' with F' locally constant, (F ⊗_tr F')_et ≅ F ⊗_et F', the tensor
    product of the underlying étale sheaves (MVW 8.13). Omitted: PST, EST and DMeff are carriers
    without categorical, monoidal or triangulated structure.
-/

/- ### Suslin's rigidity theorem — packet node `M.5a/suslin-rigidity` (theorem)
Lean signature: STATEMENT. Omitted: homotopy invariant presheaves with transfers and étale
sheafification are not exposed.
-/

/- ### Étale A¹-local complexes with finite coefficients — packet node `M.5a/etale-a1-local-complexes` (theorem)
Lean signature: STATEMENT. Omitted: PST, EST and DMeff are carriers without categorical, monoidal or
triangulated structure.
-/

/- ### Rost's DN degree theorem — packet node `M.5b/dn-degree-theorem` (theorem)
Lean signature: STATEMENT. Omitted: G-varieties, fixed-point equivalence and the degree map have no
carrier here.
-/

/- ### Symmetric powers of Tate motives and the reduced power βP^m — packet node `M.5c/symmetric-power-operation` (theorem)
Lean signature: STATEMENT. Omitted: symmetric powers of motives over simplicial schemes have no
carrier here.
-/

/- ### Hilbert 90 for K^M implies Beilinson–Lichtenbaum (Voevodsky, Z/2-coefficients paper §§5–6) — packet node `M.5c/hilbert-ninety-implies-beilinson-lichtenbaum` (theorem)
Lean signature: STATEMENT. Omitted: Lichtenbaum cohomology of simplicial schemes and the complexes
L(q), K(q) have no carrier here.
-/

end
