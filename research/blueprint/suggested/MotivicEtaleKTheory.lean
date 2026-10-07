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
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.PiTensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Data.ZMod.QuotientGroup
import Mathlib.Data.ENat.Basic
import Mathlib.LinearAlgebra.Complex.Module
import Mathlib.LinearAlgebra.Dual.Defs

/-!
# Suggested Lean prototypes for MotivicEtaleKTheory, M.1–M.8

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/MotivicEtaleKTheory.md` is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures. They claim no implementation: every packet node is unchecked.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174
and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The shared build
contains Mathlib and the Tau Ceti adic modules, but not the Galois/Kähler
modules cited by the packets; this file therefore imports individual Mathlib
modules only. TateTwist.GF and TateTwist.KummerCoeff reproduce the pinned
abbreviations for Gal(Fˢ/F) and the additive roots of unity. TateTwist.kummer
is a sorry-bodied stand-in for the pinned kummerMap, not a new library owner.

Finite twists use the cyclotomic ZMod model, and adic twists use the actual
cyclotomic characters and continuousCohomology carrier. Identifying the finite
model with tensor powers of KummerCoeff requires a primitive-root choice;
an implementation should construct the tensor powers. The finite-to-divisible
coefficient transitions use the lattice multiplication map, not factorwise
inclusion. Derived-limit statements retain their arithmetic suppliers.

A single explicitly labelled T.2 tensor/Steinberg presentation is shared by
HigherChow.KM, NormResidue.map and DifferentialSymbol.Milnor. Classical K₂
remains T.1's carrier until its Matsumoto comparison is supplied. Absolute
forms use Mathlib Kähler differentials and exterior powers. Exact forms are an
additive subgroup, never their field-linear span. Semilinear naturality takes
the genuine type of the pinned Tau Ceti map with its derivation law. De Rham,
Cartier, Witt, higher Chow, motivic and spectrum carriers absent from the build
remain typed supplier stand-ins, with their owners recorded in the catalogue.

M.1's part review is accepted; M.5d's review is needs_changes. The assembly
preserves those verdicts. Reviewed incomplete filtered, eigenspace, norm-family
and period-line signatures are omitted explicitly instead of asserting claims
about unrelated additive maps. A conditional weight-separation lemma records
only the expressible algebraic step in rational degeneration. The actual
filtered/geometric comparison and unresolved source proofs are still required.
Other unavailable scheme, site and realization hypotheses remain omitted from
parametric forms, as permitted by PROTOCOL §13; the packet and reader's full
mathematics is binding. Elaboration with sorry proves none of these targets.

The catalogue lists all current nodes, every API item and every unit test by
its proposed name, including mathematical statements and reasons for omitted
signatures. Names in comments alone do not establish a faithful Lean signature.
-/

noncomputable section
universe u v w
open CategoryTheory
open scoped TensorProduct
set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

/-! ## Shared imported Milnor K-theory presentation (K2SymbolsBrauer T.2) -/

namespace TauCeti.DifferentialSymbol

abbrev Forms (F : Type u) [Field F] (n : ℕ) :=
  ⋀[F]^n (KaehlerDifferential ℤ F)

abbrev Tensors (F : Type u) [Field F] (n : ℕ) :=
  ⨂[ℤ] _ : Fin n, Additive Fˣ

variable (F : Type u) [Field F]

/-- Imported T.2 presentation, not a new packet definition. -/
def milnorRelations (n : ℕ) : Submodule ℤ (Tensors F n) :=
  Submodule.span ℤ {z | ∃ (a : Fin n → Fˣ) (i j : Fin n),
    j.val = i.val + 1 ∧ (a i : F) + a j = 1 ∧
    z = PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))}

abbrev Milnor (n : ℕ) := Tensors F n ⧸ milnorRelations F n

def symbol {n : ℕ} (a : Fin n → Fˣ) : Milnor F n :=
  Submodule.Quotient.mk (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k)))

end TauCeti.DifferentialSymbol

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
/- Shared imported T.2 tensor/Steinberg presentation, also used by M.5d. -/
abbrev KM (F : Type) [Field F] (n : ℕ) : Type :=
  TauCeti.DifferentialSymbol.Milnor F n

instance (F : Type) [Field F] (n : ℕ) : AddCommGroup (KM F n) := inferInstance

abbrev milnorSymbol (F : Type) [Field F] (n : ℕ) : (Fin n → Fˣ) → KM F n :=
  TauCeti.DifferentialSymbol.symbol F

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


/-! ## M.5d–M.8 -/

namespace TauCeti.DifferentialSymbol
variable (F : Type u) [Field F]

/-- Imported T.2 field map and product. -/
def milnorMap {E : Type v} [Field E] (f : F →ₐ[ℤ] E) (n : ℕ) :
    Milnor F n →+ Milnor E n := sorry

def milnorProduct (i j : ℕ) : Milnor F i →+ Milnor F j →+ Milnor F (i+j) := sorry

/-- Ordinary additive quotient by multiplication by p, not a K-spectrum with coefficients. -/
abbrev ModP (p n : ℕ) := Milnor F n ⧸ (nsmulAddMonoidHom (α := Milnor F n) p).range

def reduce (p n : ℕ) : Milnor F n →+ ModP F p n :=
  QuotientAddGroup.mk' _

/-- Imported DD.2 ordinary de Rham differential. -/
def deRham (n : ℕ) : Forms F n →+ Forms F (n+1) := sorry

/-- Imported DD.2 exact subgroup, degree zero zero. -/
def exactForms : (n : ℕ) → AddSubgroup (Forms F n)
  | 0 => ⊥
  | n+1 => (deRham F n).range

abbrev FormsQuotient (n : ℕ) := Forms F n ⧸ exactForms F n

def project (n : ℕ) : Forms F n →+ FormsQuotient F n := QuotientAddGroup.mk' _

/-- Imported DD.2 semilinear field pullback, not an F-linear map. -/
def formsMap {E : Type v} [Field E] (f : F →ₐ[ℤ] E) (n : ℕ) :
    Forms F n →ₛₗ[f.toRingHom] Forms E n := sorry

/-- Imported DD.2 wedge, with the displayed degree order. -/
def wedge (i j : ℕ) : Forms F i →ₗ[F] Forms F j →ₗ[F] Forms F (i+j) := sorry

/-- Imported DD.3 inverse Cartier with its Frobenius scalar convention. -/
def inverseCartier (p : ℕ) [Fact p.Prime] [CharP F p] (n : ℕ) : Forms F n →+ FormsQuotient F n := sorry

variable {F}

/-- M.5d/logarithmic-one-form. -/
def logOne : Additive Fˣ →+ KaehlerDifferential ℤ F := sorry

theorem logOne_apply (a : Fˣ) :
    logOne (Additive.ofMul a) = (a : F)⁻¹ • KaehlerDifferential.D ℤ F (a : F) := by sorry

theorem logOne_mul (a b : Fˣ) :
    logOne (Additive.ofMul (a*b)) = logOne (Additive.ofMul a) + logOne (Additive.ofMul b) := by sorry

theorem logOne_inv (a : Fˣ) :
    logOne (Additive.ofMul a⁻¹) = -logOne (Additive.ofMul a) := by sorry

theorem logOne_pow (a : Fˣ) (m : ℕ) :
    logOne (Additive.ofMul (a^m)) = m • logOne (Additive.ofMul a) := by sorry

-- logOne_test_one
example : logOne (F := F) (Additive.ofMul (1 : Fˣ)) = 0 := by sorry
-- logOne_test_nonzero
example (a : Fˣ) (h : KaehlerDifferential.D ℤ F (a : F) ≠ 0) :
    logOne (Additive.ofMul a) ≠ 0 := by sorry
-- logOne_test_inverse
example (a : Fˣ) :
    logOne (Additive.ofMul a⁻¹) + logOne (Additive.ofMul a) = 0 := by sorry

/-- M.5d/logarithmic-one-form-natural. -/
theorem logOne_natural {E : Type v} [Field E] (f : F →ₐ[ℤ] E)
    (differentialPullback : KaehlerDifferential ℤ F →ₛₗ[f.toRingHom] KaehlerDifferential ℤ E)
    (hD : ∀ x : F, differentialPullback (KaehlerDifferential.D ℤ F x) =
      KaehlerDifferential.D ℤ E (f x))
    (a : Fˣ) :
    differentialPullback (logOne (Additive.ofMul a)) =
      logOne (Additive.ofMul (Units.map f.toMonoidHom a)) := by sorry

/-- M.5d/tensor-differential-symbol. -/
def tensorSymbol (n : ℕ) : Tensors F n →ₗ[ℤ] Forms F n := sorry

theorem tensorSymbol_pure (n : ℕ) (a : Fin n → Fˣ) :
    tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

theorem tensorSymbol_unique (n : ℕ) (g : Tensors F n →ₗ[ℤ] Forms F n)
    (h : ∀ a : Fin n → Fˣ,
      g (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) :
    g = tensorSymbol n := by sorry

theorem tensorSymbol_update_mul (n : ℕ) (a : Fin n → Fˣ) (i : Fin n) (b c : Fˣ) :
    tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul ((Function.update a i (b*c)) k))) =
      tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul ((Function.update a i b) k))) +
      tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul ((Function.update a i c) k))) := by sorry

-- tensorSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (tensorSymbol 0 (PiTensorProduct.tprod ℤ (fun i : Fin 0 ↦ Fin.elim0 i))) = 1 := by sorry
-- tensorSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (tensorSymbol 1 (PiTensorProduct.tprod ℤ (fun _ : Fin 1 ↦ Additive.ofMul a))) =
      logOne (Additive.ofMul a) := by sorry
-- tensorSymbol_test_repeated
example (a : Fˣ) : tensorSymbol 2
    (PiTensorProduct.tprod ℤ (fun _ : Fin 2 ↦ Additive.ofMul a)) = 0 := by sorry

/-- M.5d/steinberg-vanishing; distinct positions, including characteristic two. -/
theorem steinberg_vanish (n : ℕ) (a : Fin n → Fˣ) (i j : Fin n)
    (hij : i ≠ j) (ha : (a i : F) + a j = 1) :
    tensorSymbol n (PiTensorProduct.tprod ℤ (fun k ↦ Additive.ofMul (a k))) = 0 := by sorry

/-- M.5d/milnor-differential-symbol. -/
def differentialSymbol (n : ℕ) : Milnor F n →+ Forms F n := sorry

theorem differentialSymbol_symbol (n : ℕ) (a : Fin n → Fˣ) :
    differentialSymbol n (symbol F a) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

theorem differentialSymbol_quotient (n : ℕ) (x : Tensors F n) :
    differentialSymbol n (Submodule.Quotient.mk x) = tensorSymbol n x := by sorry

theorem differentialSymbol_unique (n : ℕ) (g : Milnor F n →+ Forms F n)
    (h : ∀ a : Fin n → Fˣ, g (symbol F a) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) :
    g = differentialSymbol n := by sorry

-- differentialSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (differentialSymbol 0 (symbol F ![])) = 1 := by sorry
-- differentialSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (differentialSymbol 1 (symbol F ![a])) = (a : F)⁻¹ • KaehlerDifferential.D ℤ F (a : F) := by sorry
-- differentialSymbol_test_repeated
example (a : Fˣ) : differentialSymbol 2 (symbol F ![a,a]) = 0 := by sorry

/-- M.5d/milnor-symbol-natural. -/
theorem differentialSymbol_natural {E : Type v} [Field E] (f : F →ₐ[ℤ] E)
    (n : ℕ) (x : Milnor F n) :
    formsMap F f n (differentialSymbol n x) = differentialSymbol n (milnorMap F f n x) := by sorry

/-- M.5d/milnor-symbol-product. -/
theorem differentialSymbol_product (i j : ℕ) (x : Milnor F i) (y : Milnor F j) :
    differentialSymbol (i+j) (milnorProduct F i j x y) =
      wedge F i j (differentialSymbol i x) (differentialSymbol j y) := by sorry

variable (p : ℕ) [hp : Fact p.Prime] [hchar : CharP F p]
include hp hchar

/-- M.5d/characteristic-annihilation. -/
theorem forms_p_smul (n : ℕ) (ω : Forms F n) : p • ω = 0 := by sorry

/-- M.5d/mod-p-differential-symbol. -/
def modPSymbol (p : ℕ) [Fact p.Prime] [CharP F p] (n : ℕ) : ModP F p n →+ Forms F n := sorry

theorem modPSymbol_reduce (n : ℕ) (x : Milnor F n) :
    modPSymbol p n (reduce F p n x) = differentialSymbol n x := by sorry

theorem modPSymbol_unique (n : ℕ) (g : ModP F p n →+ Forms F n)
    (h : ∀ x, g (reduce F p n x) = differentialSymbol n x) : g = modPSymbol p n := by sorry

theorem modPSymbol_symbol (n : ℕ) (a : Fin n → Fˣ) :
    modPSymbol p n (reduce F p n (symbol F a)) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

-- modPSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (modPSymbol p 0 (reduce F p 0 (symbol F ![]))) = 1 := by sorry
-- modPSymbol_test_p_multiple
example (n : ℕ) (x : Milnor F n) : modPSymbol p n (reduce F p n (p • x)) = 0 := by sorry
-- modPSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (modPSymbol p 1 (reduce F p 1 (symbol F ![a]))) = logOne (Additive.ofMul a) := by sorry

/-- M.5d/artin-schreier-differential; opposite sign to BK's 1-C^{-1}, same kernel. -/
def artinSchreier (n : ℕ) : Forms F n →+ FormsQuotient F n :=
  inverseCartier F p n - project F n

theorem artinSchreier_apply (n : ℕ) (ω : Forms F n) :
    artinSchreier p n ω = inverseCartier F p n ω - project F n ω := by sorry

/-- M.5d/artin-schreier-logarithmic-formula: promoted from the API because fixedness uses it. -/
theorem artinSchreier_logarithmic (n : ℕ) (x : F) (a : Fin n → Fˣ) :
    artinSchreier p n (x • exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) =
      project F n ((x^p-x) • exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k)))) := by sorry

theorem artinSchreier_add (n : ℕ) (x y : Forms F n) :
    artinSchreier p n (x+y) = artinSchreier p n x + artinSchreier p n y := by sorry

-- artinSchreier_test_zero
example : artinSchreier (F := F) p 0 0 = 0 := by sorry
-- artinSchreier_test_unit
example : artinSchreier p 0 ((exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm 1) = 0 := by sorry
-- artinSchreier_test_not_zero_map
example (x : F) (h : x^p ≠ x) :
    artinSchreier p 0 ((exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm x) ≠ 0 := by sorry

/-- M.5d/logarithmic-differential-group. -/
def logarithmicForms (n : ℕ) : AddSubgroup (Forms F n) := (artinSchreier (F := F) p n).ker

theorem logarithmicForms_mem (n : ℕ) (ω : Forms F n) :
    ω ∈ logarithmicForms p n ↔ inverseCartier F p n ω = project F n ω := by sorry

def logarithmicFormsMap {E : Type v} [Field E] [CharP E p] (f : F →ₐ[ℤ] E) (n : ℕ) :
    logarithmicForms (F := F) p n →+ logarithmicForms (F := E) p n := sorry

theorem logarithmicFormsMap_coe {E : Type v} [Field E] [CharP E p]
    (f : F →ₐ[ℤ] E) (n : ℕ) (ω : logarithmicForms (F := F) p n) :
    (logarithmicFormsMap p f n ω : Forms E n) = formsMap F f n ω := by sorry

theorem logarithmicFormsMap_id (n : ℕ) (ω : logarithmicForms (F := F) p n) :
    logarithmicFormsMap p (AlgHom.id ℤ F) n ω = ω := by sorry

theorem logarithmicFormsMap_comp {E : Type v} [Field E] [CharP E p]
    {L : Type w} [Field L] [CharP L p] (f : F →ₐ[ℤ] E) (g : E →ₐ[ℤ] L)
    (n : ℕ) (ω : logarithmicForms (F := F) p n) :
    logarithmicFormsMap p (g.comp f) n ω = logarithmicFormsMap p g n (logarithmicFormsMap p f n ω) := by sorry

-- logarithmicForms_test_zero
example (n : ℕ) : (0 : Forms F n) ∈ logarithmicForms p n := by sorry
-- logarithmicForms_test_degree_zero
example (x : F) : (exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm x ∈ logarithmicForms p 0 ↔ x^p = x := by sorry
-- logarithmicForms_test_not_F_submodule
example (x : F) (h : x^p ≠ x) :
    x • (exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)).symm 1 ∉ logarithmicForms p 0 := by sorry

/-- M.5d/differential-symbol-fixed. -/
theorem differentialSymbol_fixed (n : ℕ) (x : Milnor F n) :
    differentialSymbol n x ∈ logarithmicForms p n := by sorry

/-- M.5d/logarithmic-symbol. -/
def logarithmicSymbol (n : ℕ) : ModP F p n →+ logarithmicForms (F := F) p n := sorry

theorem logarithmicSymbol_coe (n : ℕ) (x : ModP F p n) :
    (logarithmicSymbol p n x : Forms F n) = modPSymbol p n x := by sorry

theorem logarithmicSymbol_unique (n : ℕ)
    (g : ModP F p n →+ logarithmicForms (F := F) p n)
    (h : ∀ x, (g x : Forms F n) = modPSymbol p n x) : g = logarithmicSymbol p n := by sorry

theorem logarithmicSymbol_symbol (n : ℕ) (a : Fin n → Fˣ) :
    (logarithmicSymbol p n (reduce F p n (symbol F a)) : Forms F n) =
      exteriorPower.ιMulti F n (fun k ↦ logOne (Additive.ofMul (a k))) := by sorry

-- logarithmicSymbol_test_zero
example : exteriorPower.zeroEquiv F (KaehlerDifferential ℤ F)
    (logarithmicSymbol p 0 (reduce F p 0 (symbol F ![]))) = 1 := by sorry
-- logarithmicSymbol_test_one
example (a : Fˣ) : exteriorPower.oneEquiv F (KaehlerDifferential ℤ F)
    (logarithmicSymbol p 1 (reduce F p 1 (symbol F ![a]))) = logOne (Additive.ofMul a) := by sorry
-- logarithmicSymbol_test_repeated
example (a : Fˣ) : logarithmicSymbol p 2 (reduce F p 2 (symbol F ![a,a])) = 0 := by sorry

/-- M.5d/weight-zero-comparison. -/
theorem logarithmicSymbol_zero_bijective : Function.Bijective (logarithmicSymbol (F := F) p 0) := by sorry

/-- M.5d/perfect-field-differentials. -/
theorem perfect_forms_zero (h : Function.Surjective (fun x : F ↦ x^p))
    (n : ℕ) (hn : 0 < n) (ω : Forms F n) : ω = 0 := by sorry

/-- M.5d/perfect-field-milnor-mod-p. -/
theorem perfect_modP_zero (h : Function.Surjective (fun x : F ↦ x^p))
    (n : ℕ) (hn : 0 < n) (x : ModP F p n) : x = 0 := by sorry

/-- M.5d/weight-one-injectivity. -/
theorem logarithmicSymbol_one_injective : Function.Injective (logarithmicSymbol (F := F) p 1) := by sorry

end TauCeti.DifferentialSymbol

namespace TauCeti.MotivicEtale
open TauCeti.DifferentialSymbol

/-! The higher sections are typed interfaces to the genuine supplier carriers.
Smoothness, admissible sheaf sites, coherent stable diagram maps, the actual
realization functors and their source hypotheses are omitted where they cannot
currently be expressed. No arbitrary proposition field replaces these conditions.
The packet/reader, including every scheme and coefficient restriction, is binding.
-/

section DifferentialComparison
variable {F : Type u} [Field F] (p : ℕ) [Fact p.Prime] [CharP F p]

/-- M.5d/bloch-gabber-kato; independent of the motivic norm-residue proof. -/
theorem bloch_gabber_kato (q : ℕ) :
    Function.Bijective (logarithmicSymbol (F := F) p q) := by sorry

variable (W : ℕ → ℕ → Type v) [∀ r q, AddCommGroup (W r q)]
/-- CR.4 supplies W r q = H⁰_et(F,W_r Ω^q_log), Teichmüller wedges and maps. -/
def wittSymbol (r q : ℕ) : ModP F (p ^ r) q →+ W r q := sorry

theorem wittSymbol_symbol (r q : ℕ) (a : Fin q → Fˣ)
    (teichLogWedge : (Fin q → Fˣ) → W r q) :
    wittSymbol p W r q (reduce F (p ^ r) q (symbol F a)) = teichLogWedge a := by sorry

theorem wittSymbol_restrict (r q : ℕ) (hr : 2 ≤ r)
    (R : W r q →+ W (r-1) q)
    (ρ : ModP F (p ^ r) q →+ ModP F (p ^ (r-1)) q) :
    R.comp (wittSymbol p W r q) = (wittSymbol p W (r-1) q).comp ρ := by sorry

theorem wittSymbol_insert (r q : ℕ) (hr : 2 ≤ r)
    (i : ModP F (p ^ 1) q →+ ModP F (p ^ r) q) (j : W 1 q →+ W r q) :
    (wittSymbol p W r q).comp i = j.comp (wittSymbol (F := F) p W 1 q) := by sorry

-- wittSymbol_test_zero
example (r : ℕ) (hr : 1 ≤ r) (e : W r 0 ≃+ ZMod (p ^ r)) :
    e (wittSymbol p W r 0 (reduce F (p ^ r) 0 (symbol F ![]))) = 1 := by sorry
-- wittSymbol_test_perfect
example (r q : ℕ) (hr : 1 ≤ r) (hq : 0 < q)
    (hperfect : Function.Surjective (fun x : F ↦ x ^ p)) :
    (∀ x : ModP F (p ^ r) q, x = 0) ∧ (∀ x : W r q, x = 0) := by sorry
-- wittSymbol_test_teichmuller: under W₂(F₃)≃Z/9, [2]=8 and [1]=1.
example : (8 : ZMod 9) + 8 = 7 ∧ (7 : ZMod 9) ≠ 1 := by sorry

/-- H.6's additive coefficient quotient, for the general abelian-group row. -/
abbrev coefficientGroup (A : Type u) [AddCommGroup A] (m : ℕ) :=
  A ⧸ (nsmulAddMonoidHom (α := A) m).range

/-- Canonical i([a])=[p^(r-1)a], ρ reduction and its Tor lift come from H.6.
The displayed evaluation identities bind the supplier maps to these canonical
coefficient maps; they are expressible at the pinned additive-group baseline. -/
theorem milnor_coefficient_row {A : Type u} [AddCommGroup A]
    (p r : ℕ) [Fact p.Prime] (hr : 2 ≤ r)
    (i : coefficientGroup A p →+ coefficientGroup A (p ^ r))
    (ρ : coefficientGroup A (p ^ r) →+ coefficientGroup A (p ^ (r-1)))
    (torReduction : (nsmulAddMonoidHom (α := A) (p ^ r)).ker →+
      (nsmulAddMonoidHom (α := A) (p ^ (r-1))).ker)
    (hi : ∀ a : A,
      i (QuotientAddGroup.mk' ((nsmulAddMonoidHom (α := A) p).range) a) =
        QuotientAddGroup.mk' ((nsmulAddMonoidHom (α := A) (p ^ r)).range)
          ((p ^ (r-1)) • a))
    (hρ : ∀ a : A,
      ρ (QuotientAddGroup.mk' ((nsmulAddMonoidHom (α := A) (p ^ r)).range) a) =
        QuotientAddGroup.mk' ((nsmulAddMonoidHom (α := A) (p ^ (r-1))).range) a)
    (hTor : ∀ x, (torReduction x : A) = p • (x : A)) :
    i.range = ρ.ker ∧ Function.Surjective ρ ∧
    i.ker = ((nsmulAddMonoidHom (α := A) (p ^ (r-1))).ker).map
      (QuotientAddGroup.mk' ((nsmulAddMonoidHom (α := A) p).range)) ∧
    (∀ x, (torReduction x : A) = p • (x : A)) := by sorry

theorem prime_power_bgk (r q : ℕ) (hr : 1 ≤ r) :
    Function.Bijective (wittSymbol (F := F) p W r q) := by sorry

theorem milnor_torsion_divisible (q : ℕ) (x : Milnor F q)
    (hx : ∃ m : ℕ, (p ^ m) • x = 0) :
    ∃ y : Milnor F q, p • y = x ∧ ∃ m : ℕ, (p ^ m) • y = 0 := by sorry
end DifferentialComparison

section FieldCoefficientComparisons
/- M.4 supplies the cycle-complex and étale-truncation carriers. The precise
norm-residue/semilocal transfer hypotheses are omitted in this prototype. -/
variable (Motivic Etale : ℕ → ℤ → Type u)
    [∀ j a, AddCommGroup (Motivic j a)] [∀ j a, AddCommGroup (Etale j a)]
variable (cycleMap : ∀ j a, Motivic j a →+ Etale j a)

theorem mod_prime_motivic_comparison (j : ℕ) (a : ℤ) (ha : a ≤ j) :
    Function.Bijective (cycleMap j a) := by sorry

/-- The M.5d prime-power map is induced by the same norm-residue map as
M.5c, on the common T.2 presentation. Quotient descent uses map_mul_m. -/
def primePowerSymbol (F : Type) [Field F] (ℓ r j : ℕ) [Fact ℓ.Prime]
    [NeZero (ℓ : F)] :
    ModP F (ℓ ^ r) j →+ TauCeti.TateTwist.H F (ℓ ^ r) j j :=
  QuotientAddGroup.lift _ (TauCeti.NormResidue.map F (ℓ ^ r) j) (by sorry)

theorem prime_power_norm_residue (F : Type) [Field F] (ℓ r j : ℕ)
    [Fact ℓ.Prime] [NeZero (ℓ : F)] (hr : 1 ≤ r) :
    Function.Bijective (primePowerSymbol F ℓ r j) := by sorry

/-- Actual filtered-field colimits and comparison maps come from M.1/T.2/DD/CR.4. -/
theorem filtered_colimit_comparisons {A B : Type u} [AddCommGroup A] [AddCommGroup B]
    (comparison : A →+ B) : Function.Bijective comparison := by sorry

theorem inseparable_and_characteristic_reductions {F E : Type v} [Field F] [Field E]
    (p m q : ℕ) [Fact p.Prime] [CharP F p] [CharP E p] (hm : m.Coprime p)
    (restriction : ModP F m q →+ ModP E m q) : Function.Bijective restriction := by sorry
end FieldCoefficientComparisons

section Supports
variable {Point : Type u} {Face : Type v}
/-- Closedness and face codimension are actual geometric supplier data. -/
def admissibleSupports (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) : Set (Set Point) :=
  {W | W ∈ closed ∧ ∀ f, (p : WithTop ℕ) ≤ codim W f}

theorem admissibleSupports_iff (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) (W : Set Point) :
    W ∈ admissibleSupports closed codim p ↔
      W ∈ closed ∧ ∀ f, (p : WithTop ℕ) ≤ codim W f := by sorry

theorem admissibleSupports_union (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ)
    (hclosed : ∀ W V, W ∈ closed → V ∈ closed → W ∪ V ∈ closed)
    (hcodim : ∀ W V f, codim (W ∪ V) f = min (codim W f) (codim V f))
    (p : ℕ) (W V : Set Point)
    (hW : W ∈ admissibleSupports closed codim p)
    (hV : V ∈ admissibleSupports closed codim p) :
    W ∪ V ∈ admissibleSupports closed codim p := by sorry

theorem admissibleSupports_face (closed : Set (Set Point))
    (codim : Set Point → Face → WithTop ℕ) (p : ℕ) (W : Set Point)
    (hW : W ∈ admissibleSupports closed codim p) (f : Face) :
    (p : WithTop ℕ) ≤ codim W f := by sorry

-- admissibleSupports_test_empty: empty codimension is infinity.
example (closed : Set (Set Point)) (codim : Set Point → Face → WithTop ℕ)
    (he : (∅ : Set Point) ∈ closed) (hc : ∀ f, codim ∅ f = ⊤) (p : ℕ) :
    (∅ : Set Point) ∈ admissibleSupports closed codim p := by sorry
-- admissibleSupports_test_zero
example (closed : Set (Set Point)) (codim : Set Point → Face → WithTop ℕ) :
    admissibleSupports closed codim 0 = closed := by sorry
-- admissibleSupports_test_face: proper whole-simplex codimension alone fails.
example (closed : Set (Set Point)) (codim : Set Point → Fin 2 → WithTop ℕ)
    (W : Set Point) (hwhole : codim W 0 = 1) (hvertex : codim W 1 = 0) :
    W ∉ admissibleSupports closed codim 1 := by sorry
end Supports

section Coniveau
variable {Spectrum : Type v} {Support : Type u}
variable (supports : ℕ → ℕ → Set Support) (Ksupport : ℕ → Support → Spectrum)
    (hocolim : {I : Type u} → (I → Spectrum) → Spectrum)
    (realize : (ℕ → Spectrum) → Spectrum)
/-- M.6a: construct the tower before its page. Stable diagram coherence is omitted. -/
def coniveauTower (p : ℕ) : Spectrum :=
  realize (fun r ↦ hocolim (fun W : {w // w ∈ supports p r} ↦ Ksupport r W.1))

theorem coniveauTower_level (p : ℕ) :
    coniveauTower supports Ksupport hocolim realize p =
      realize (fun r ↦ hocolim (fun W : {w // w ∈ supports p r} ↦ Ksupport r W.1)) := by sorry

variable (Hom : Spectrum → Spectrum → Type w)
    (Iso : Spectrum → Spectrum → Type w) (zero : Spectrum)
    (π : ℤ → Spectrum → Type u) [∀ m E, AddCommGroup (π m E)]
/-- The support inclusions supply the transition maps. -/
def coniveauTransition (p : ℕ) :
    Hom (coniveauTower supports Ksupport hocolim realize (p+1))
      (coniveauTower supports Ksupport hocolim realize p) := sorry

theorem coniveauTower_transition (p : ℕ)
    (supportInclusion : Hom (coniveauTower supports Ksupport hocolim realize (p+1))
      (coniveauTower supports Ksupport hocolim realize p)) :
    coniveauTransition supports Ksupport hocolim realize Hom p = supportInclusion := by sorry

theorem coniveauTower_pullback (p : ℕ)
    (supportsY : ℕ → ℕ → Set Support) :
    Nonempty (Hom (coniveauTower supports Ksupport hocolim realize p)
      (coniveauTower supportsY Ksupport hocolim realize p)) := by sorry

-- coniveauTower_test_zero
example (KX : Spectrum) :
    Nonempty (Iso (coniveauTower supports Ksupport hocolim realize 0) KX) := by sorry
-- coniveauTower_test_dimension
example (d m p : ℕ) (hp : d+m < p)
    (x : π m (coniveauTower supports Ksupport hocolim realize p)) : x = 0 := by sorry
-- coniveauTower_test_field_layer: degree-zero layer for a field is HZ.
example (layerZero HZ : Spectrum) : Nonempty (Iso layerZero HZ) := by sorry

theorem moving_and_excision (movedTower ordinaryTower : ℕ → Spectrum) (p : ℕ) :
    Nonempty (Iso (movedTower p) (ordinaryTower p)) := by sorry

theorem k_theory_well_connected (semilocalSupport : Spectrum) (m : ℤ) (hm : m < 0)
    (x : π m semilocalSupport) : x = 0 := by sorry

theorem coniveau_cycle_layer (layer : ℕ → Spectrum) (cycleEM : ℕ → Spectrum) (p : ℕ) :
    Nonempty (Iso (layer p) (cycleEM p)) := by sorry

/- Omitted signature: M.6a/global-model-comparison.
A levelwise isomorphism is insufficient. A filtered comparison must commute with transitions, augmentations and cycle-layer identifications. The coherent stable-diagram supplier and its comparison proof remain unavailable.
The current mathematical target and all API/tests appear in the catalogue below. -/

end Coniveau

section MotivicPages
variable {Spectrum Couple Sequence : Type u}
variable (π : ℤ → Spectrum → Type v) [∀ m E, AddCommGroup (π m E)]
    (D E : Couple → ℕ → ℤ → Type v)
    [∀ c p m, AddCommGroup (D c p m)] [∀ c p m, AddCommGroup (E c p m)]
/-- H.6 exact-couple functor instantiated on the already constructed tower. -/
def motivicCouple (tower : ℕ → Spectrum) (coupleFunctor : (ℕ → Spectrum) → Couple) :
    Couple := coupleFunctor tower

/- Omitted signature: M.6b/motivic-exact-couple.
The imported exact-couple data must bind D, E, i, j, k and the derived differentials, including their exactness and square-zero laws. Nonempty of an additive hom would be witnessed by zero.
The current mathematical target and all API/tests appear in the catalogue below. -/

-- motivicCouple_test_indices: a=p-m,b=-p; raw s becomes page r=s+1.
example (m p s : ℤ) :
    (p+s-(m-1), -(p+s)) = ((p-m)+(s+1), (-p)-(s+1)+1) := by sorry
/- Omitted signature: M.6b/motivic-exact-couple API/tests.
Arbitrary j and k need not compose to zero. The boundary and weight-zero tests require the actual support exact couple and field cycle-layer comparison.
The current mathematical target and all API/tests appear in the catalogue below. -/

/-- Same sequence assembled from the same couple; generic machinery is imported. -/
def motivicSequence (c : Couple) (sequenceFunctor : Couple → Sequence) : Sequence :=
  sequenceFunctor c

variable (Page : Sequence → ℕ → ℤ → ℤ → Type v)
    [∀ s r a b, AddCommGroup (Page s r a b)]
    (HM : ℤ → ℤ → Type v) [∀ a j, AddCommGroup (HM a j)]
    (K : ℤ → Type v) [∀ m, AddCommGroup (K m)]

/- Omitted signature: M.6/motivic-spectral-sequence.
The page, abutment and pullback must be the ones induced by this tower and exact couple, with naturality on every page. Unbound HM and K carriers cannot state the specified field diagonal and finite-field tests.
The current mathematical target and all API/tests appear in the catalogue below. -/

theorem motivic_strong_convergence (tower : ℕ → Spectrum) (d m p : ℕ)
    (hp : d+m < p) (x : π m (tower p)) : x = 0 := by sorry

theorem filtered_motivic_products (tower : ℕ → Spectrum)
    (Smash : Spectrum → Spectrum → Spectrum) (Hom : Spectrum → Spectrum → Type v)
    (p q : ℕ) : Nonempty (Hom (Smash (tower p) (tower q)) (tower (p+q))) := by sorry

/- Omitted signature: M.6b/filtered-adams-operations and M.6b/rational-motivic-degeneration.
The actual Adams action must arise from compatible filtered operations. An arbitrary endomorphism has no weight, and an arbitrary differential need not vanish. The algebraic consequence of two compatible, distinct scalar actions is given just below; attaching those actions to this tower remains a supplier/proof obligation.
The current mathematical target and all API/tests appear in the catalogue below. -/

/-- Algebraic weight-separation step used in M.6b. The geometric filtered
Adams action, its E₂ weight formula and its passage to each later page still
need to be supplied. This conditional form does not claim they exist. -/
theorem rational_motivic_degeneration
    {A B : Type v} [AddCommGroup A] [Module ℚ A] [AddCommGroup B] [Module ℚ B]
    (dr : A →ₗ[ℚ] B) (ψA : A →ₗ[ℚ] A) (ψB : B →ₗ[ℚ] B)
    (sourceWeight targetWeight : ℚ)
    (hA : ψA = sourceWeight • LinearMap.id)
    (hB : ψB = targetWeight • LinearMap.id)
    (hcompat : dr.comp ψA = ψB.comp dr)
    (hdistinct : sourceWeight ≠ targetWeight) : dr = 0 := by sorry

variable (Kweight : ℕ → ℕ → Type v) [∀ m j, AddCommGroup (Kweight m j)]
    [∀ m j, Module ℚ (Kweight m j)] (HMQ : ℤ → ℕ → Type v)
    [∀ a j, AddCommGroup (HMQ a j)] [∀ a j, Module ℚ (HMQ a j)]

theorem rational_weight_comparison (m j : ℕ) :
    Nonempty (Kweight m j ≃ₗ[ℚ] HMQ (2*(j : ℤ)-m) j) := by sorry
end MotivicPages

section EtaleComparison
variable {Spectrum Sheaf Site : Type u}
    (derivedSections : Site → Sheaf → Spectrum)
/-- Hypercomplete periodic finite-coefficient K sheaf, supplied by H.3/H.5/H.6. -/
def etaleK (site : Site) (periodicKSheaf : Sheaf) : Spectrum :=
  derivedSections site periodicKSheaf

variable (Hom Iso : Spectrum → Spectrum → Type v)
    (π : ℤ → Spectrum → Type w) [∀ n S, AddCommGroup (π n S)]

theorem etaleK_compare (site : Site) (periodicKSheaf : Sheaf) (ordinaryK : Spectrum) :
    Nonempty (Hom ordinaryK (etaleK derivedSections site periodicKSheaf)) := by sorry

theorem etaleK_hyperdescent (site : Site) (periodicKSheaf : Sheaf)
    (hypercoverLimit : Spectrum) :
    Nonempty (Iso (etaleK derivedSections site periodicKSheaf) hypercoverLimit) := by sorry

theorem etaleK_coefficients (site : Site) (Kr Ks : Sheaf)
    (ordinaryR ordinaryS : Spectrum)
    (cR : Hom ordinaryR (etaleK derivedSections site Kr))
    (cS : Hom ordinaryS (etaleK derivedSections site Ks))
    (redK : Hom ordinaryR ordinaryS)
    (redEt : Hom (etaleK derivedSections site Kr) (etaleK derivedSections site Ks))
    (comp : {A B C : Spectrum} → Hom B C → Hom A B → Hom A C) :
    comp redEt cR = comp cS redK := by sorry

-- etaleK_test_separable_closed: geometric trivialization of every finite Tate twist.
example (site : Site) (KS : Sheaf) (ℓ r : ℕ) (j : ℤ) :
    Nonempty (π (2*j) (etaleK derivedSections site KS) ≃+ ZMod (ℓ^r)) ∧
    (∀ x : π (2*j+1) (etaleK derivedSections site KS), x = 0) := by sorry
-- etaleK_test_rank
example (site : Site) (KS : Sheaf) (ℓ r : ℕ)
    (e : π 0 (etaleK derivedSections site KS) ≃+ ZMod (ℓ^r))
    (unitClass : π 0 (etaleK derivedSections site KS)) : e unitClass = 1 := by sorry
-- etaleK_test_periodic: negative even groups must survive periodicization.
example (site : Site) (KS : Sheaf) (ℓ r : ℕ) :
    Nonempty (π (-2) (etaleK derivedSections site KS) ≃+ ZMod (ℓ^r)) := by sorry

theorem bott_etale_descent (bottInverted periodicEtale : Spectrum) :
    Nonempty (Iso bottInverted periodicEtale) := by sorry
end EtaleComparison

section ArithmeticComparison
/- These carriers are genuine finite/adic K and continuous-cohomology groups;
field cd bounds, Thomason's hypothesis, regularity and admitted coefficient primes
are supplied in the packet and omitted from these parametric signatures. -/
variable (K Ket : ℤ → Type u) [∀ n, AddCommGroup (K n)] [∀ n, AddCommGroup (Ket n)]
    (comparison : ∀ n, K n →+ Ket n)

theorem beilinson_lichtenbaum (j : ℕ) (a : ℤ) (ha : a ≤ j)
    {HM HE : Type v} [AddCommGroup HM] [AddCommGroup HE] (cycleMap : HM →+ HE) :
    Function.Bijective cycleMap := by sorry

theorem dedekind_motivic_comparison (j : ℕ) (a : ℤ) (ha : a ≤ j)
    {HM HE : Type v} [AddCommGroup HM] [AddCommGroup HE] (cycleMap : HM →+ HE) :
    Function.Bijective cycleMap := by sorry

theorem quillen_lichtenbaum_field_range (d : ℕ) (n : ℤ) (hn : 0 ≤ n) :
    ((d : ℤ)-1 ≤ n → Function.Bijective (comparison n)) ∧
    (n = (d : ℤ)-2 → Function.Injective (comparison n)) := by sorry

theorem s_integer_comparison_range :
    (∀ n : ℤ, 1 ≤ n → Function.Bijective (comparison n)) ∧
    Function.Injective (comparison 0) := by sorry

variable (H : ℕ → ℕ → Type v) [∀ a j, AddCommGroup (H a j)]

theorem arithmetic_adic_degrees (j : ℕ) (hj : 2 ≤ j) :
    Nonempty (K (2*(j : ℤ)-1) ≃+ H 1 j) ∧
    Nonempty (K (2*(j : ℤ)-2) ≃+ H 2 j) := by sorry

theorem etale_adams_weights (j a : ℕ) (ψ : H 1 j →+ H 1 j) (x : H 1 j) :
    ψ x = (a ^ j) • x := by sorry

theorem etale_k_transfer {KY KX HY HX : Type w}
    [AddCommGroup KY] [AddCommGroup KX] [AddCommGroup HY] [AddCommGroup HX]
    (transfer : KY →+ KX) (corestriction : HY →+ HX)
    (regY : KY →+ HY) (regX : KX →+ HX) :
    regX.comp transfer = corestriction.comp regY := by sorry

/-- K here is localized away from 2, and Q^s/Q^s_- each supply this duality. -/
theorem number_ring_duality_sign (n : ℕ) (hn : 2 ≤ n)
    (dualityOdd : K (2*(n : ℤ)-1) →+ K (2*(n : ℤ)-1))
    (dualityEven : K (2*(n : ℤ)-2) →+ K (2*(n : ℤ)-2)) :
    (∀ x, dualityOdd x = ((-1 : ℤ)^n) • x) ∧
    (∀ x, dualityEven x = ((-1 : ℤ)^n) • x) := by sorry

theorem suslin_real_comparison (m n : ℕ) (hm : 1 ≤ m) (hn : 1 ≤ n)
    (BOmod : ℕ → Type v) [∀ a, AddCommGroup (BOmod a)] :
    Nonempty (K n ≃+ BOmod n) := by sorry

/-- The real mod-2 sequence has the differential pattern specified in the reader. -/
theorem real_mod_two_sequence (page : ℕ → ℤ → ℤ → Type v)
    [∀ r a b, AddCommGroup (page r a b)] (a b : ℤ) (hab : b ≤ a) (ha : a ≤ 0) :
    Nonempty (page 2 a b ≃+ ZMod 2) ∧ Nonempty (K 2 ≃+ ZMod 4) := by sorry

/-- K is finite-coefficient Q₂/Z₂ K here; H is continuous cohomology. The n=0
slot is separate. This preserves the unsplit 8k+5 short exact sequence. -/
theorem dyadic_s_integer_extensions (r₁ : ℕ) (hr : 1 ≤ r₁) (k : ℕ)
    (w : ℕ → ℕ) (Htilde : ℕ → Type v) [∀ j, AddCommGroup (Htilde j)] :
    Nonempty (K (8*(k : ℤ)+1) ≃+ H 1 (4*k+1)) ∧
    Nonempty (K (8*(k : ℤ)+2) ≃+ ZMod 2) ∧
    Nonempty (K (8*(k : ℤ)+3) ≃+ H 1 (4*k+2)) ∧
    Nonempty (K (8*(k : ℤ)+4) ≃+ (ZMod (2*w (4*k+2)) × (Fin (r₁-1) → ZMod 2))) ∧
    (∀ x : K (8*(k : ℤ)+6), x = 0) ∧
    Nonempty (K (8*(k : ℤ)+7) ≃+ Htilde (4*k+4)) ∧
    (0 < k → Nonempty (K (8*(k : ℤ)) ≃+ ZMod (w (4*k)))) ∧
    (∃ i : (Fin (r₁-1) → ZMod 2) →+ K (8*(k : ℤ)+5),
      ∃ q : K (8*(k : ℤ)+5) →+ H 1 (4*k+3),
        Function.Injective i ∧ i.range = q.ker ∧ Function.Surjective q) := by sorry
end ArithmeticComparison

section RealCorrection
variable {Spectrum : Type u} (Hom : Spectrum → Spectrum → Type v)
    (fiber : {A B : Spectrum} → Hom A B → Spectrum)
/-- Actual fibre of the map to the direct sum over real places. -/
def realCorrection {A B : Spectrum} (α : Hom A B) : Spectrum := fiber α

theorem realCorrection_triangle {A B : Spectrum} (α : Hom A B) :
    Nonempty (Hom (realCorrection Hom fiber α) A) := by sorry

theorem realCorrection_pageMap {HM HR : Type w} [AddCommGroup HM] [AddCommGroup HR]
    (actualPageMap α : HM →+ HR) : actualPageMap = α := by sorry

theorem realCorrection_kernel {HM HR : Type w} [AddCommGroup HM] [AddCommGroup HR]
    (α₁ : HM →+ HR) (Htilde : AddSubgroup HM) : Htilde = α₁.ker := by sorry

-- realCorrection_test_imaginary: the fibre of a map to zero is the source.
example (Iso : Spectrum → Spectrum → Type v) (A zero : Spectrum) (α : Hom A zero) :
    Nonempty (Iso (realCorrection Hom fiber α) A) := by sorry
-- realCorrection_test_real_higher
example {HM HR : Type w} [AddCommGroup HM] [AddCommGroup HR]
    (s : ℕ) (hs : 3 ≤ s) (αs : HM →+ HR) : Function.Bijective αs := by sorry
-- realCorrection_test_extension: an exact nonsplit Z/4 model distinguishes splitting.
example : ¬ Nonempty (ZMod 4 ≃+ (ZMod 2 × ZMod 2)) := by sorry
end RealCorrection

section ChernMaps
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)]
    (H : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (H a j)]
/-- Positive higher Chern class, defined by universal equivariant Chern classes. -/
def finiteChern (i n : ℕ) (_hi : 1 ≤ i) (_hn : 1 ≤ n) : K n →+ H (2*(i : ℤ)-n) i := sorry

theorem finiteChern_natural (i n : ℕ) (hi : 1 ≤ i) (hn : 1 ≤ n)
    (KY : ℕ → Type u) [∀ m, AddCommGroup (KY m)]
    (HY : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (HY a j)]
    (pullK : K n →+ KY n) (pullH : H (2*(i : ℤ)-n) i →+ HY (2*(i : ℤ)-n) i) :
    (finiteChern KY HY i n hi hn).comp pullK = pullH.comp (finiteChern K H i n hi hn) := by sorry

theorem finiteChern_bockstein {Det : Type w} [AddCommGroup Det]
    (detBoundary : K 2 →+ Det) (kummer : Det →+ H 0 1) :
    finiteChern K H 1 2 (by decide) (by decide) = kummer.comp detBoundary := by sorry

theorem finiteChern_milnor (i : ℕ) (hi : 1 ≤ i) {F : Type w} [Field F]
    (milnorToK : Milnor F i →+ K i)
    (cupKummer : (Fin i → Fˣ) → H (2*(i : ℤ)-i) i) (a : Fin i → Fˣ) :
    finiteChern K H i i hi hi (milnorToK (symbol F a)) =
      (((-1 : ℤ)^(i-1)) * (Nat.factorial (i-1) : ℤ)) • cupKummer a := by sorry

-- finiteChern_test_unit
example {Units : Type w} [AddCommGroup Units] (det : K 1 →+ Units)
    (kummer : Units →+ H 1 1) (x : K 1) :
    finiteChern K H 1 1 (by decide) (by decide) x = kummer (det x) := by sorry
-- finiteChern_test_bott
example {IntegralK₂ : Type w} [AddCommGroup IntegralK₂]
    (integralReduction : IntegralK₂ →+ K 2) (β : K 2) (ζ : H 0 1) :
    finiteChern K H 1 2 (by decide) (by decide) β = ζ ∧
      ∀ x, finiteChern K H 1 2 (by decide) (by decide) (integralReduction x) = 0 := by sorry
-- finiteChern_test_factorial
example {F : Type w} [Field F] (milnorToK : Milnor F 2 →+ K 2)
    (cupKummer : (Fin 2 → Fˣ) → H 2 2) (a : Fin 2 → Fˣ) :
    finiteChern K H 2 2 (by decide) (by decide) (milnorToK (symbol F a)) = -cupKummer a := by sorry
end ChernMaps

section MotivicCharacter
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)] [∀ n, Module ℚ (K n)]
    (H : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (H a j)] [∀ a j, Module ℚ (H a j)]
/-- Rational total character; K₀ uses Newton polynomials rather than additive c_i. -/
def motivicChern (i n : ℕ) : K n →ₗ[ℚ] H (2*(i : ℤ)-n) i := sorry

theorem motivicChern_positive (i n : ℕ) (hi : 1 ≤ i) (hn : 1 ≤ n)
    (rationalChern : K n →+ H (2*(i : ℤ)-n) i) (x : K n) :
    (Nat.factorial (i-1) : ℚ) • motivicChern K H i n x =
      ((-1 : ℚ)^(i-1)) • rationalChern x := by sorry

theorem motivicChern_product (m n i : ℕ) (x : K m) (y : K n)
    (prodK : K m → K n → K (m+n))
    (cup : ∀ (a b : ℕ), H (2*(a : ℤ)-m) a → H (2*(b : ℤ)-n) b →
      H (2*(i : ℤ)-(m+n)) i) :
    motivicChern K H i (m+n) (prodK x y) =
      ∑ a ∈ Finset.range (i+1), cup a (i-a)
        (motivicChern K H a m x) (motivicChern K H (i-a) n y) := by sorry

/- Omitted signature: M.8/motivic-chern-character weight API.
The argument must lie in the Adams weight-j eigenspace, and the comparison must be the canonical one from M.6 with its Adams compatibility. An arbitrary map and arbitrary x do not satisfy this assertion.
The current mathematical target and all API/tests appear in the catalogue below. -/

-- motivicChern_test_rank
example (rank : K 0 →ₗ[ℚ] H 0 0) : motivicChern K H 0 0 = rank := by sorry
-- motivicChern_test_line: the cup power includes the weight/degree shift.
example (i : ℕ) (lineBundle : K 0) (c₁power : H (2*(i : ℤ)-(0 : ℕ)) i) :
    (Nat.factorial i : ℚ) • motivicChern K H i 0 lineBundle = c₁power := by sorry
-- motivicChern_test_milnor
example {F : Type w} [Field F] (i : ℕ) (hi : 1 ≤ i)
    (milnorToK : Milnor F i →+ K i)
    (cycleSymbol : Milnor F i →+ H (2*(i : ℤ)-i) i) (x : Milnor F i) :
    motivicChern K H i i (milnorToK x) = cycleSymbol x := by sorry

theorem supported_cycle_character {KS HE : Type w} [AddCommGroup KS] [AddCommGroup HE]
    (cl : KS →+ HE) (cycleToK : KS) (refinedCycleClass : HE) :
    cl cycleToK = refinedCycleClass := by sorry
end MotivicCharacter

section DeligneRegulator
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)] [∀ n, Module ℚ (K n)]
    (HD : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (HD a j)] [∀ a j, Module ℚ (HD a j)]
/-- Realization of the normalized motivic character into genuine Deligne cohomology. -/
def deligneRegulator (j m : ℕ) : K m →ₗ[ℚ] HD (2*(j : ℤ)-m) j := sorry

theorem deligneRegulator_natural (j m : ℕ)
    (KY : ℕ → Type u) [∀ n, AddCommGroup (KY n)] [∀ n, Module ℚ (KY n)]
    (HDY : ℤ → ℕ → Type v) [∀ a j, AddCommGroup (HDY a j)] [∀ a j, Module ℚ (HDY a j)]
    (pullK : K m →ₗ[ℚ] KY m)
    (pullHD : HD (2*(j : ℤ)-m) j →ₗ[ℚ] HDY (2*(j : ℤ)-m) j) :
    (deligneRegulator KY HDY j m).comp pullK =
      pullHD.comp (deligneRegulator K HD j m) := by sorry

theorem deligneRegulator_product (m n i : ℕ) (x : K m) (y : K n)
    (prodK : K m → K n → K (m+n))
    (cup : ∀ (a b : ℕ), HD (2*(a : ℤ)-m) a → HD (2*(b : ℤ)-n) b →
      HD (2*(i : ℤ)-(m+n)) i) :
    deligneRegulator K HD i (m+n) (prodK x y) =
      ∑ a ∈ Finset.range (i+1), cup a (i-a)
        (deligneRegulator K HD a m x) (deligneRegulator K HD (i-a) n y) := by sorry

theorem deligneRegulator_real (j : ℕ) (conjugation : HD 0 j →+ HD 0 j)
    (tateLattice : ℤ →+ HD 0 j) (n : ℤ) :
    conjugation (tateLattice n) = tateLattice (((-1 : ℤ)^j)*n) := by sorry

-- deligneRegulator_test_point: τ denotes the genuine (2πi)^j generator.
example {D : Type w} [AddCommGroup D] (τ : ℂ) :
    Nonempty (D ≃+ (ℂ ⧸ Submodule.span ℝ {τ})) := by sorry
-- deligneRegulator_test_integral_point: the integral quotient is a different carrier.
example {D : Type w} [AddCommGroup D] (τ : ℂ) :
    Nonempty (D ≃+ (ℂ ⧸ AddSubgroup.zmultiples τ)) := by sorry
-- deligneRegulator_test_line
example {KD DB HB : Type w} [AddCommGroup KD] [AddCommGroup DB] [AddCommGroup HB]
    (integralChern : KD →+ DB) (betti : DB →+ HB) (topologicalChern : KD →+ HB)
    (lineBundle : KD) : betti (integralChern lineBundle) = topologicalChern lineBundle := by sorry

theorem number_field_deligne_normalization (j : ℕ) (hj : 2 ≤ j)
    {V : Type w} [AddCommGroup V] [Module ℝ V] [Module ℚ V]
    (earlyRegulator : K (2*j-1) →ₗ[ℚ] V)
    (normalizedUniversalClass : K (2*j-1) →ₗ[ℚ] V) :
    earlyRegulator = normalizedUniversalClass := by sorry

theorem chern_functoriality {KY KX HY HX : Type w}
    [AddCommGroup KY] [AddCommGroup KX] [AddCommGroup HY] [AddCommGroup HX]
    (finiteEtaleTransfer : KY →+ KX) (trace : HY →+ HX)
    (regY : KY →+ HY) (regX : KX →+ HX) :
    regX.comp finiteEtaleTransfer = trace.comp regY := by sorry
end DeligneRegulator

section IntegralStructures
variable {Model Generic : Type u} [AddCommGroup Model] [AddCommGroup Generic]
/-- Actual image subgroup, not an arbitrary rational subspace. -/
def integralStructures (restriction : Model →+ Generic) : AddSubgroup Generic :=
  restriction.range

abbrev integralLattice (restriction : Model →+ Generic) :=
  (integralStructures restriction) ⧸ AddCommGroup.torsion (integralStructures restriction)

/-- Rational scalar-extension image supplied by the motivic coefficient comparison. -/
def integralRationalPart {GenericQ : Type v} [AddCommGroup GenericQ] [Module ℚ GenericQ]
    (restrictionQ : (ℚ ⊗[ℤ] Model) →ₗ[ℚ] GenericQ) : Submodule ℚ GenericQ :=
  restrictionQ.range

theorem integralStructures_image (restriction : Model →+ Generic)
    {GenericQ : Type v} [AddCommGroup GenericQ] [Module ℚ GenericQ]
    (restrictionQ : (ℚ ⊗[ℤ] Model) →ₗ[ℚ] GenericQ) :
    integralStructures restriction = restriction.range ∧
    integralRationalPart restrictionQ = restrictionQ.range := by sorry

theorem integralStructures_torsion (restriction : Model →+ Generic) :
    (QuotientAddGroup.mk' (AddCommGroup.torsion (integralStructures restriction))).ker =
      AddCommGroup.torsion (integralStructures restriction) := by sorry

theorem integralStructures_lattice (restriction : Model →+ Generic)
    (hfg : ∃ s : Finset (integralStructures restriction),
      AddSubgroup.closure (s : Set (integralStructures restriction)) = ⊤) :
    ∃ r : ℕ, Nonempty (integralLattice restriction ≃+ (Fin r → ℤ)) := by sorry

-- integralStructures_test_torsion
example (m : ℕ) (hm : 1 < m) :
    (∀ x : (ZMod m ⧸ AddCommGroup.torsion (ZMod m)), x = 0) ∧
    (∀ x : ℚ ⊗[ℤ] ZMod m, x = 0) := by sorry
-- integralStructures_test_free
example (r : ℕ) :
    Nonempty (((Fin r → ℤ) ⧸ AddCommGroup.torsion (Fin r → ℤ)) ≃+ (Fin r → ℤ)) ∧
    Nonempty ((ℚ ⊗[ℤ] (Fin r → ℤ)) ≃ₗ[ℚ] (Fin r → ℚ)) := by sorry
-- integralStructures_test_index: same rational span, different integral images.
example : (AddSubgroup.zmultiples (1 : ℚ)) ≠ AddSubgroup.zmultiples (2 : ℚ) ∧
    Submodule.span ℚ {(1 : ℚ)} = Submodule.span ℚ {(2 : ℚ)} := by sorry
end IntegralStructures

section RealizationDictionary
/-- Cohomological geometric-Frobenius convention; q is nonzero and unramified. -/
theorem tate_elliptic_realization_dictionary (q : ℚ) (hq : q ≠ 0) (a : ℚ) (j : ℤ)
    (tateEuler ellipticEuler : ℚ → ℚ) :
    (∀ T, tateEuler T = 1-q^(-j)*T) ∧
    (∀ T, ellipticEuler T = 1-a*q^(-j)*T+q^(1-2*j)*T^2) := by sorry
end RealizationDictionary

section NormFamilies
variable (K : ℕ → Type u) [∀ n, AddCommGroup (K n)]
    (transition : ∀ n, K (n+1) →+ K n)
/-- transition = norm after coefficient reduction, with genuine K norm variance. -/
def normFamilies : AddSubgroup (∀ n, K n) where
  carrier := {x | ∀ n, transition n (x (n+1)) = x n}
  zero_mem' := by sorry
  add_mem' := by sorry
  neg_mem' := by sorry

theorem normFamilies_projection (x : normFamilies K transition) (n : ℕ) :
    transition n (x.1 (n+1)) = x.1 n := by sorry

theorem normFamilies_regulator (H : ℕ → Type v) [∀ n, AddCommGroup (H n)]
    (corestriction : ∀ n, H (n+1) →+ H n) (reg : ∀ n, K n →+ H n)
    (htransfer : ∀ n, (reg n).comp (transition n) =
      (corestriction n).comp (reg (n+1)))
    (x : normFamilies K transition) (n : ℕ) :
    corestriction n (reg (n+1) (x.1 (n+1))) = reg n (x.1 n) := by sorry

/-- The particular unit/Bott norm family, with compatibility supplied by the
projection formula. K n here is the coefficient-level group in K-degree 2i−1. -/
def souleFamily (unitBottPower : ∀ n, K n) (norm : ∀ n, K n →+ K n)
    (hcompat : ∀ n, transition n (norm (n+1) (unitBottPower (n+1))) =
      norm n (unitBottPower n)) : normFamilies K transition :=
  ⟨fun n ↦ norm n (unitBottPower n), hcompat⟩

theorem normFamilies_soule (i n : ℕ) (_hi : 1 ≤ i)
    (unitBottPower : ∀ n, K n) (norm : ∀ n, K n →+ K n)
    (hcompat : ∀ n, transition n (norm (n+1) (unitBottPower (n+1))) =
      norm n (unitBottPower n)) :
    (souleFamily K transition unitBottPower norm hcompat).1 n =
      norm n (unitBottPower n) := by rfl

-- normFamilies_test_constant
example {A : Type v} [AddCommGroup A] :
    Nonempty (normFamilies (fun _ ↦ A) (fun _ ↦ AddMonoidHom.id A) ≃+ A) := by sorry
/- Omitted signature: M.8/norm-compatible-regulator-families degree/transfer tests.
Degree arithmetic alone does not test the cyclotomic unit/Bott family. The transfer square must use actual K-norm and cohomological corestriction, after coefficient reduction; arbitrary homomorphisms need not commute. The normalized source computation remains required.
The current mathematical target and all API/tests appear in the catalogue below. -/

-- normFamilies_nonexample: an equalizer cannot contain arbitrary tuples.
example : (fun _ : ℕ ↦ (1 : ℤ)) ∉
    normFamilies (fun _ ↦ ℤ) (fun _ ↦ nsmulAddMonoidHom 2) := by sorry

theorem euler_factor_regulator_compatibility (H : ℕ → Type v) [∀ n, AddCommGroup (H n)]
    (corestriction : ∀ n, H (n+1) →+ H n) (reg : ∀ n, K n →+ H n)
    (P_K : K 0 →+ K 0) (P_H : H 0 →+ H 0) (x₁ : K 1) (x₀ : K 0)
    (hnorm : transition 0 x₁ = P_K x₀)
    (htransfer : (reg 0).comp (transition 0) = (corestriction 0).comp (reg 1))
    (hpoly : (reg 0).comp P_K = P_H.comp (reg 0)) :
    corestriction 0 (reg 1 x₁) = P_H (reg 0 x₀) := by sorry
end NormFamilies

section FundamentalLines
variable {Cpx : Type u} {R : Type v} [CommRing R]
    (detInv : Cpx → Type w) [∀ C, AddCommGroup (detInv C)] [∀ C, Module R (detInv C)]
/-- Inverse determinant of the supplied perfect compact-support complex. -/
abbrev fundamentalLine (C : Cpx) := detInv C

/- Omitted signature: M.8/arithmetic-fundamental-line base-change/triangle API.
These comparisons require the independent L5 determinant functor with actual scalar extension and distinguished-triangle data. Arbitrary line carriers and arbitrary triples of complexes cannot supply the API. The PS.4 period prefix is separately unresolved.
The current mathematical target and all API/tests appear in the catalogue below. -/

theorem fundamentalLine_basis (C : Cpx) (z : fundamentalLine detInv C)
    (multiply : R →ₗ[R] fundamentalLine detInv C) (hm : ∀ a, multiply a = a • z) :
    Function.Bijective multiply ↔
      ∃ e : R ≃ₗ[R] fundamentalLine detInv C, ∀ a, e a = a • z := by sorry

/- Omitted signature: M.8/arithmetic-fundamental-line zero/shift tests.
The zero and shifted complexes must be actual complexes, and detInv the determinant functor. The tests are listed mathematically instead of asserting equivalences for arbitrary type parameters.
The current mathematical target and all API/tests appear in the catalogue below. -/

-- fundamentalLine_test_nonunit: p has become invertible over the fraction field only.
example (p : ℕ) [Fact p.Prime] :
    IsUnit (p : ℚ_[p]) ∧ ¬ IsUnit (p : ℤ_[p]) := by sorry

theorem selmer_regulator_factorization {K Global Selmer : Type u}
    [AddCommGroup K] [AddCommGroup Global] [AddCommGroup Selmer]
    (reg : K →+ Global) (selmerInclusion : Selmer →+ Global)
    (hinj : Function.Injective selmerInclusion)
    (hlocal : reg.range ≤ selmerInclusion.range) :
    ∃ selmerReg : K →+ Selmer, selmerInclusion.comp selmerReg = reg := by sorry

/- Omitted signature: M.8/regulator-determinant-comparison.
The independent realization/period-line prefix has not been isolated from PS.4/PS.3. A rational scalar-extension equivalence with an arbitrary period line would not encode the conditional integral regulator comparison. Keep the recorded supplier gap.
The current mathematical target and all API/tests appear in the catalogue below. -/

end FundamentalLines

end TauCeti.MotivicEtale

/-! ## Current mathematical declaration, API and test catalogue

The following inventory follows the current packets, including review corrections.
A prototype elsewhere is only a partial form where its supplier conditions are omitted.
For omitted executable forms, use the full mathematical target below and the reader.
-/

/- Node MotivicEtaleKTheory:M.1/finite-tate-twist: Finite Tate twists of the roots of unity
(construction; unchecked).
Let F be a field with separable closure F^s and absolute Galois group G_F, let m ≥ 1 be an integer
invertible in F, and let j ∈ ℤ. The finite Tate twist μ_m^{⊗j} is the discrete G_F-module defined as
follows. For j = 0 it is ℤ/m with trivial action. For j = 1 it is Tau Ceti's KummerCoeff F m, the
group μ_m(F^s) written additively, with its discrete topology. For j ≥ 2 it is the j-fold tensor
product over ℤ/m of μ_m with the diagonal action. For j < 0 it is Hom_{ℤ/m}(μ_m^{⊗(−j)}, ℤ/m) with
g·φ = φ ∘ g^{−1}. In every case the underlying group is free of rank one over ℤ/m, and g ∈ G_F acts
as multiplication by χ_m(g)^j, where χ_m : G_F → (ℤ/m)^× is the mod-m cyclotomic character
(Mathlib's modularCyclotomicCharacter on the automorphisms of F^s). The action factors through
Gal(F(μ_m)/F), so it is continuous for the discrete topology. The construction comes with
equivariant ℤ/m-bilinear pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)} for all i, j ∈ ℤ, which are
associative and graded-symmetric through the swap isomorphism.
Hypotheses: F a field; m ≥ 1 with m invertible in F; j ∈ ℤ.; Twists are taken over ℤ/m; no primitive
m-th root of unity is assumed to lie in F.
Direct prerequisites: tauceti:TauCeti.KummerCoeff, tauceti:TauCeti.AbsoluteGaloisGroup,
mathlib:modularCyclotomicCharacter, mathlib:rootsOfUnity
Proposed namespace: TauCeti.TateTwist
API TauCeti.TateTwist.finite [constructor]: For a field F, m invertible in F and j ∈ ℤ, the discrete
G_F-module μ_m^{⊗j}.
API TauCeti.TateTwist.finite_one [equivalence]: μ_m^{⊗1} ≅ KummerCoeff F m as discrete G_F-modules.
API TauCeti.TateTwist.finite_zero [equivalence]: μ_m^{⊗0} ≅ ℤ/m with the trivial action.
API TauCeti.TateTwist.smul_eq_cyclotomic [characterisation]: g • x = χ_m(g)^j • x for g ∈ G_F and x
∈ μ_m^{⊗j}.
API TauCeti.TateTwist.card_finite [simp]: The underlying group of μ_m^{⊗j} has exactly m elements
and is free of rank one over ℤ/m.
API TauCeti.TateTwist.pairing [constructor]: The equivariant ℤ/m-bilinear pairing μ_m^{⊗i} ×
μ_m^{⊗j} → μ_m^{⊗(i+j)}.
API TauCeti.TateTwist.pairing_assoc [relation]: The pairings are associative under the canonical
identifications of iterated twists.
API TauCeti.TateTwist.pairing_comm [relation]: pairing(x, y) corresponds to pairing(y, x) under the
swap isomorphism μ_m^{⊗(i+j)} ≅ μ_m^{⊗(j+i)}; on μ_m ⊗ μ_m the swap is the identity of the
underlying cyclic group.
API TauCeti.TateTwist.homEquiv [equivalence]: Cartier duality: the pairing μ_m^{⊗j} × μ_m^{⊗(1−j)} →
μ_m^{⊗1} induces a G_F-equivariant isomorphism μ_m^{⊗(1−j)} ≅ Hom_{ℤ/m}(μ_m^{⊗j}, μ_m), with g
acting on Hom by φ ↦ g ∘ φ ∘ g^{−1}.
API TauCeti.TateTwist.dualEquiv [equivalence]: The pairing μ_m^{⊗j} × μ_m^{⊗(1−j)} → μ_m^{⊗1} = μ_m
is perfect: it induces an isomorphism of discrete G_F-modules μ_m^{⊗(1−j)} ≅ Hom_{ℤ/m}(μ_m^{⊗j},
μ_m) (Cartier duality), compatible with reduction for m | m'.
API TauCeti.TateTwist.trivialise [equivalence]: If ζ ∈ F is a primitive m-th root of unity, 1 ↦
ζ^{⊗j} is a G_F-equivariant isomorphism ℤ/m ≅ μ_m^{⊗j} (the change-of-root rule itself is
K2SymbolsBrauer T.7's).
API TauCeti.TateTwist.res [functoriality]: For a field extension E/F with chosen embedding of
separable closures, the restriction of μ_m^{⊗j}(F) along G_E → G_F is μ_m^{⊗j}(E); identity and
composition laws hold.
API TauCeti.TateTwist.reduce [functoriality]: For m | m′, the reduction μ_{m′}^{⊗j} → μ_m^{⊗j}: for
j ≥ 0, ζ ↦ ζ^{m′/m} on each tensor factor; for j < 0, φ ↦ (x ↦ φ(x̃) mod m) with x̃ any lift of x
along the reduction of μ^{⊗(−j)} (well defined because φ(m·y) = m·φ(y)). It is surjective,
G_F-equivariant and semilinear over ℤ/m′ → ℤ/m, and reductions compose.
Test TateTwist.test_zero_trivial [degenerate]: For j = 0, every g ∈ G_F acts trivially on μ_m^{⊗0} =
ℤ/m.
Test TateTwist.test_m_one [degenerate]: For m = 1, μ_1^{⊗j} = 0 for every j.
Test TateTwist.test_kummer_coeff [compatibility]: μ_m^{⊗1} is TauCeti.KummerCoeff F m, with the same
action and discrete topology.
Test TateTwist.test_rat_three_square [computation]: For F = ℚ and m = 3, complex conjugation acts
trivially on μ_3^{⊗2} and by −1 on μ_3^{⊗1}.
Test TateTwist.test_not_trivial_without_root [non-example]: For F = ℚ and m = 4, μ_4^{⊗1} and ℤ/4
(trivial action) are not isomorphic G_ℚ-modules, since complex conjugation acts by −1 on μ_4.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/adic-tate-twist: ℓ-adic Tate twists and their coefficient sequences
(construction; unchecked).
Let F be a field, ℓ a prime different from the characteristic of F, and j ∈ ℤ. Define the compact
G_F-module ℤ_ℓ(1) = lim_ν μ_{ℓ^ν} (transition maps ζ ↦ ζ^ℓ), a free ℤ_ℓ-module of rank one on which
g ∈ G_F acts by Mathlib's cyclotomicCharacter ℓ (g) ∈ ℤ_ℓ^×; ℤ_ℓ(j) = ℤ_ℓ(1)^{⊗j} for j ≥ 0 and
ℤ_ℓ(j) = Hom_{ℤ_ℓ}(ℤ_ℓ(−j), ℤ_ℓ) for j < 0, with the ℓ-adic topology; ℚ_ℓ(j) = ℤ_ℓ(j) ⊗ ℚ_ℓ; and the
discrete module ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, the colimit taken along the inclusions ι below (b
= 1); along the factorwise inclusions of roots of unity the colimit would be 0 for j ≥ 2. The
canonical identifications are ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j}, ℚ_ℓ/ℤ_ℓ(j) ≅ ℚ_ℓ(j)/ℤ_ℓ(j) and μ_{ℓ^ν}^{⊗j}
≅ ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν]. The coefficient sequences 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0, 0 →
ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0, 0 → μ_{ℓ^ν}^{⊗j} → ℚ_ℓ/ℤ_ℓ(j) --ℓ^ν--> ℚ_ℓ/ℤ_ℓ(j) → 0 and 0 →
μ_{ℓ^a}^{⊗j} --ι--> μ_{ℓ^{a+b}}^{⊗j} → μ_{ℓ^b}^{⊗j} → 0 are exact, where ι is the map induced by
multiplication by ℓ^b on ℤ_ℓ(j), ℤ_ℓ(j)/ℓ^a → ℤ_ℓ(j)/ℓ^{a+b}. For j ≥ 2 this ι is not the map
induced factorwise by the inclusions μ_{ℓ^a} ⊂ μ_{ℓ^{a+b}}.
Hypotheses: F a field, ℓ a prime with ℓ ≠ char F, j ∈ ℤ, ν, a, b ≥ 1.; ℤ_ℓ(j) and ℚ_ℓ(j) carry the
ℓ-adic topology; ℚ_ℓ/ℤ_ℓ(j) and μ_{ℓ^ν}^{⊗j} are discrete.
Direct prerequisites: MotivicEtaleKTheory:M.1/finite-tate-twist, mathlib:cyclotomicCharacter,
mathlib:TopRep, ArithmeticGaloisDuality:R02.1/mittag-leffler
Proposed namespace: TauCeti.TateTwist
API TauCeti.TateTwist.adic [constructor]: The compact G_F-module ℤ_ℓ(j), free of rank one over ℤ_ℓ.
API TauCeti.TateTwist.adic_smul [characterisation]: g • x = (cyclotomicCharacter ℓ g)^j • x on
ℤ_ℓ(j).
API TauCeti.TateTwist.adicQuotientEquiv [equivalence]: ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j} as discrete
G_F-modules, compatibly in ν.
API TauCeti.TateTwist.adicLimitEquiv [equivalence]: ℤ_ℓ(j) ≅ lim_ν μ_{ℓ^ν}^{⊗j} as topological
G_F-modules.
API TauCeti.TateTwist.rational [constructor]: ℚ_ℓ(j) = ℤ_ℓ(j) ⊗_{ℤ_ℓ} ℚ_ℓ with the ℓ-adic topology.
API TauCeti.TateTwist.divisible [constructor]: ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, the colimit along
the inclusions ι (induced by multiplication by ℓ on ℤ_ℓ(j)), discrete, with ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν] =
μ_{ℓ^ν}^{⊗j}.
API TauCeti.TateTwist.coeffInclusion [data]: ι : μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j}, induced by
multiplication by ℓ^b on ℤ_ℓ(j); it is injective with cokernel μ_{ℓ^b}^{⊗j}.
API TauCeti.TateTwist.shortExact_mul [relation]: 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0 is
exact and admits a continuous set-theoretic section.
API TauCeti.TateTwist.shortExact_rational [relation]: 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0 is exact.
API TauCeti.TateTwist.adic_pairing [constructor]: Equivariant pairings ℤ_ℓ(i) × ℤ_ℓ(j) → ℤ_ℓ(i+j)
reducing mod ℓ^ν to the finite pairings.
Test TateTwist.test_adic_zero [degenerate]: ℤ_ℓ(0) = ℤ_ℓ with trivial G_F-action.
Test TateTwist.test_adic_char [compatibility]: On ℤ_ℓ(1), g acts by Mathlib's cyclotomicCharacter ℓ
g.
Test TateTwist.test_rat_three_w2 [computation]: H⁰(ℚ, ℚ_3/ℤ_3(2)) ≅ ℤ/3.
Test TateTwist.test_factorwise_inclusion_wrong [non-example]: For j = 2 and a = b = 1, the
factorwise inclusion μ_ℓ ⊗ μ_ℓ → μ_{ℓ²} ⊗ μ_{ℓ²} is the zero map, whereas ι is injective.
Test TateTwist.test_factorwise_colimit_zero [non-example]: For j = 2, the colimit of the
μ_{ℓ^ν}^{⊗2} along the factorwise inclusions μ_{ℓ^ν} ⊂ μ_{ℓ^{ν+1}} is 0: k steps send a generator to
ℓ^{2k} times a generator of ℤ/ℓ^{ν+k}, which vanishes once k ≥ ν. Along ι the colimit is ℚ_ℓ/ℤ_ℓ(2),
whose ℓ-torsion μ_ℓ^{⊗2} is nonzero.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist: The primewise twist ℚ/ℤ(j) (construction;
unchecked).
Let F be a field of characteristic p ≥ 0 and j ∈ ℤ. Define the discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠
p} ℚ_ℓ/ℤ_ℓ(j), the sum of the divisible ℓ-adic twists of adic-tate-twist over the primes ℓ different
from p. Equivalently ℚ/ℤ(j) is the group μ(F^s) of all roots of unity of F^s, with g ∈ G_F acting by
ζ ↦ g^j(ζ) in the sense of K-book Definition VI.1.7. It is not the tensor power (ℚ/ℤ)^{⊗j}, which
vanishes for j ≥ 2. Its invariants W_j(F) = H⁰(F, ℚ/ℤ(j)), their order w_j(F) when finite and the
ℓ-parts w_j^{(ℓ)}(F) = #H⁰(F, ℚ_ℓ/ℤ_ℓ(j)) are defined in ArithmeticKTheory N.4
(N.4/the-w-invariant), which imports this module; they are not defined again here.
Hypotheses: F a field of characteristic p ≥ 0 (p = 0 allowed); j ∈ ℤ.
Direct prerequisites: MotivicEtaleKTheory:M.1/adic-tate-twist
Proposed namespace: TauCeti.TateTwist
API TauCeti.TateTwist.ratModInt [constructor]: The discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠ char F}
ℚ_ℓ/ℤ_ℓ(j).
API TauCeti.TateTwist.ratModIntEquivRootsOfUnity [equivalence]: ℚ/ℤ(j) ≅ μ(F^s) with g acting by ζ ↦
g^j(ζ).
API TauCeti.TateTwist.ratModInt_primary [projection]: The ℓ-primary part of ℚ/ℤ(j) is ℚ_ℓ/ℤ_ℓ(j).
Test TateTwist.test_w2_rat [computation]: H⁰(ℚ, ℚ/ℤ(2)) is cyclic of order 24: its 2-primary part
has order 8 (the squares of ℤ_2^× are 1 + 8ℤ_2) and its 3-primary part order 3, the other parts
being 0 (K-book Example VI.2.1.2). The untwisted module gives an infinite group and the tensor
square gives 0.
Test TateTwist.test_ratModInt_zero [degenerate]: ℚ/ℤ(0) has trivial action, so H⁰(F, ℚ/ℤ(0)) =
⊕_{ℓ≠p} ℚ_ℓ/ℤ_ℓ is infinite.
Test TateTwist.test_one_roots [compatibility]: ℚ/ℤ(1) ≅ μ(F^s) with its natural action, whose
m-torsion is KummerCoeff F m for m invertible in F.
Test TateTwist.test_tensor_square_zero [non-example]: (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0, so ℚ/ℤ(2) is not the
tensor square of ℚ/ℤ(1).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/twisted-cohomology-ring: The Galois cohomology ring of the twists
(construction; unchecked).
For a field F and m invertible in F, set H^{i}(F, μ_m^{⊗j}) = the continuous cohomology (Mathlib's
continuousCohomology) of G_F with coefficients in the discrete module μ_m^{⊗j} of finite-tate-twist,
and H^{i}(F, ℤ_ℓ(j)), H^{i}(F, ℚ_ℓ(j)), H^{i}(F, ℚ_ℓ/ℤ_ℓ(j)) likewise for the modules of
adic-tate-twist. The cup product of ProfiniteCohomology Layer 12 composed with the twist pairings
gives an associative bigraded product H^{i}(F, μ_m^{⊗a}) × H^{k}(F, μ_m^{⊗b}) → H^{i+k}(F,
μ_m^{⊗(a+b)}), graded-commutative with the sign (−1)^{ik}. In particular H^{*}(F, μ_m^{⊗*}) = ⊕_{n}
H^{n}(F, μ_m^{⊗n}) is a graded-commutative ℤ/m-algebra. For an open subgroup G_E ⊂ G_F (E/F finite
separable) the restriction is a ring map, the corestriction is a module map over it (projection
formula cor(res(a) ∪ b) = a ∪ cor(b)) and cor ∘ res is multiplication by [E : F]. In degrees ≤ 2
these groups and maps agree with Tau Ceti's explicit H1/H2 model and its explicitCup11, explicitCor
and explicitRes, through ProfiniteCohomology Layer 3.
Hypotheses: F a field; E/F finite separable inside F^s; m invertible in F; ℓ ≠ char F.
Direct prerequisites: MotivicEtaleKTheory:M.1/finite-tate-twist,
MotivicEtaleKTheory:M.1/adic-tate-twist, mathlib:continuousCohomology,
tauceti:TauCeti.ofDiscreteModule, tauceti:TauCeti.ContCohomology.explicitCup11,
tauceti:TauCeti.ContCohomology.explicitCup_projection11,
tauceti:TauCeti.ContCohomology.explicitCor2_comp_res2,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms
Proposed namespace: TauCeti.TateTwist
API TauCeti.TateTwist.H [constructor]: H^{i}(F, M) for the twist modules, as Layer 10's continuous
cohomology of G_F.
API TauCeti.TateTwist.cup [constructor]: The bigraded cup product H^{i}(μ_m^{⊗a}) × H^{k}(μ_m^{⊗b})
→ H^{i+k}(μ_m^{⊗(a+b)}).
API TauCeti.TateTwist.cup_assoc [relation]: The cup product is associative.
API TauCeti.TateTwist.cup_comm [relation]: x ∪ y = (−1)^{ik} y ∪ x for x of degree i and y of degree
k, through the twist swap.
API TauCeti.TateTwist.res_cup [functoriality]: Restriction to G_E is multiplicative.
API TauCeti.TateTwist.cor_res [relation]: cor_{E/F} ∘ res_{E/F} = [E : F] on H^{i}(F, μ_m^{⊗j}).
API TauCeti.TateTwist.projection_formula [relation]: cor_{E/F}(res(a) ∪ b) = a ∪ cor_{E/F}(b).
API TauCeti.TateTwist.H_le_two_equiv [compatibility]: For i ≤ 2 the groups and the (1,1) cup agree
with Tau Ceti's H1, H2 and explicitCup11.
Test TateTwist.test_H0 [degenerate]: H⁰(F, μ_m^{⊗0}) = ℤ/m and the unit of the ring is 1 ∈ ℤ/m.
Test TateTwist.test_real_mod_two [computation]: For F = ℝ, m = 2: H^{n}(ℝ, μ_2^{⊗n}) ≅ ℤ/2 for all n
≥ 0, generated by κ(−1)^n.
Test TateTwist.test_explicitCup11 [compatibility]: For i = k = 1 the cup product equals
TauCeti.ContCohomology.explicitCup11 at the twist pairing.
Test TateTwist.test_not_commutative [non-example]: For F = ℝ and m = 2 the degree-one class x =
κ(−1) has x ∪ x ≠ 0, so the ring is not exterior on degree one (graded commutativity does not force
x² = 0 when 2 = 0).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/continuous-limit-comparison: Continuous cohomology of ℓ-adic twists as
limits (theorem; unchecked).
Let F be a field, ℓ ≠ char F a prime and j ∈ ℤ, and identify ℤ_ℓ(j) with lim_ν μ_{ℓ^ν}^{⊗j}
(adic-tate-twist). This node instantiates ArithmeticGaloisDuality R02.1 at G = G_F and these
coefficients. (a) For i ≥ 1 there is a natural short exact sequence 0 → lim^1_ν H^{i−1}(F,
μ_{ℓ^ν}^{⊗j}) → H^{i}(F, ℤ_ℓ(j)) → lim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}) → 0; if H^{i−1}(F, μ_{ℓ^ν}^{⊗j}) is
finite for every ν, then H^{i}(F, ℤ_ℓ(j)) ≅ lim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}); and H⁰(F, ℤ_ℓ(j)) = lim_ν
H⁰(F, μ_{ℓ^ν}^{⊗j}). (b) H^{i}(F, ℚ_ℓ/ℤ_ℓ(j)) ≅ colim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}), the colimit along
the maps induced by ι. (c) H^{i}(F, ℚ_ℓ(j)) ≅ H^{i}(F, ℤ_ℓ(j)) ⊗_{ℤ_ℓ} ℚ_ℓ for every i and every
field F, with no finiteness hypothesis. (d) The coefficient sequences of adic-tate-twist give
natural long exact sequences, among them … → H^{i}(F, ℤ_ℓ(j)) --ℓ^ν--> H^{i}(F, ℤ_ℓ(j)) → H^{i}(F,
μ_{ℓ^ν}^{⊗j}) → H^{i+1}(F, ℤ_ℓ(j)) → … and the Bockstein sequence for ι. (e) For E/F finite
separable inside F^s, restriction to G_E and corestriction (transfer) to G_F act on H^{i}(−, ℤ_ℓ(j))
and H^{i}(−, ℚ_ℓ(j)), commute with the maps of (a)–(d), and satisfy cor ∘ res = [E : F] and
cor(res(a) ∪ b) = a ∪ cor(b); on the finite levels they are those of twisted-cohomology-ring.
Hypotheses: F a field, ℓ ≠ char F, j ∈ ℤ, i ≥ 0.; The limit formula in (a) needs every H^{i−1}(F,
μ_{ℓ^ν}^{⊗j}) finite (or surjective transition maps, Tate (2.2) Corollary); for rings of S-integers
this finiteness is ArithmeticGaloisDuality R02.4/global-finiteness, used in
M.2/adic-s-integer-cohomology. For a general field the lim^1 term need not vanish (H¹(ℚ, μ_ℓ) =
ℚ^×/ℚ^{×ℓ} is infinite).; (c) holds for every field: no finite-generation hypothesis on H^{i}(F,
ℤ_ℓ(j)) is needed.
Direct prerequisites: MotivicEtaleKTheory:M.1/adic-tate-twist,
MotivicEtaleKTheory:M.1/twisted-cohomology-ring, ArithmeticGaloisDuality:R02.1/tate-inverse-limit,
ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit,
ArithmeticGaloisDuality:R02.1/carrier-comparison, ArithmeticGaloisDuality:R02.1/rationalization,
ArithmeticGaloisDuality:R02.1/continuous-section-long-exact,
ArithmeticGaloisDuality:R02.1/continuous-section-exists,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/etale-twist-sheaf: Étale Tate twists on schemes and continuous étale
cohomology (construction; unchecked).
Let X be a scheme and m ≥ 1 with m invertible in Γ(X, O_X). The étale sheaf μ_m^{⊗j} on the small
étale site X_et (Mathlib's smallEtaleTopology) is the Tate-twist sheaf (ℤ/m)(j) of
EtaleDualityAndPerverseSheaves EDC.0/tate-twist with Λ = ℤ/m: μ_m is U ↦ μ_m(Γ(U, O_U)), locally
free of rank one over ℤ/m, and μ_m^{⊗j} is its j-th tensor power for j ≥ 0 and the ℤ/m-dual of
μ_m^{⊗(−j)} for j < 0. It is imported, not constructed again; this node identifies its stalks with
finite-tate-twist and adds the ℓ-adic and divisible coefficients. Étale cohomology H^{i}_et(X,
μ_m^{⊗j}) is Mathlib's sheaf cohomology Sheaf.H of this sheaf. For a prime ℓ invertible on X,
continuous ℓ-adic étale cohomology is H^{i}_cont(X, ℤ_ℓ(j)) = H^{i}(R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j})),
the cohomology of the derived limit of the tower of complexes with transition maps induced by
ℤ_ℓ(j)/ℓ^{ν+1} → ℤ_ℓ(j)/ℓ^ν; it sits in the Milnor sequence 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) →
H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0. H^{i}_cont(X, ℚ_ℓ(j)) = H^{i}_cont(X,
ℤ_ℓ(j)) ⊗ ℚ and H^{i}_et(X, ℚ_ℓ/ℤ_ℓ(j)) = colim_ν H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) along the maps induced
by ι (for X quasi-compact and quasi-separated this is the cohomology of the sheaf colim_ν
μ_{ℓ^ν}^{⊗j}). All are contravariant in X, and the pairings of finite-tate-twist give cup products.
Hypotheses: X a scheme; m invertible on X; ℓ a prime invertible on X; j ∈ ℤ.; The derived limit is
taken in the derived category of abelian groups; no left-completeness of the étale topos is assumed.
Direct prerequisites: MotivicEtaleKTheory:M.1/finite-tate-twist,
MotivicEtaleKTheory:M.1/adic-tate-twist, EtaleDualityAndPerverseSheaves:EDC.0/tate-twist,
mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology, mathlib:CategoryTheory.Sheaf.H,
ArithmeticGaloisDuality:R02.1/milnor-sequence, SchemeAndStackFoundations:SF.2
Proposed namespace: TauCeti.EtaleTwist
API TauCeti.EtaleTwist.sheaf [compatibility]: The étale sheaf μ_m^{⊗j} on X_et for m invertible on X
is EDC.0's Tate-twist sheaf (ℤ/m)(j) (TauCeti.EtaleDuality.tateTwistSheaf and its tensor powers),
used under this name and not constructed a second time.
API TauCeti.EtaleTwist.stalk [characterisation]: The stalk at a geometric point x̄ is
μ_m(κ(x̄))^{⊗j}, free of rank one over ℤ/m.
API TauCeti.EtaleTwist.H [constructor]: H^{i}_et(X, μ_m^{⊗j}) := Sheaf.H of the sheaf.
API TauCeti.EtaleTwist.Hcont [constructor]: H^{i}_cont(X, ℤ_ℓ(j)) as cohomology of R lim_ν RΓ_et(X,
μ_{ℓ^ν}^{⊗j}).
API TauCeti.EtaleTwist.milnor_sequence [relation]: 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) →
H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0.
API TauCeti.EtaleTwist.pullback [functoriality]: Pullback along f : X' → X, with id and composition
laws.
API TauCeti.EtaleTwist.cup [constructor]: Cup products H^{i}_et(X, μ_m^{⊗a}) × H^{k}_et(X, μ_m^{⊗b})
→ H^{i+k}_et(X, μ_m^{⊗(a+b)}).
API TauCeti.EtaleTwist.coeff_long_exact [relation]: Long exact sequences for the coefficient
sequences of adic-tate-twist, natural in X.
Test EtaleTwist.test_empty [degenerate]: For X = ∅ every H^{i}_et(X, μ_m^{⊗j}) and H^{i}_cont(X,
ℤ_ℓ(j)) is zero.
Test EtaleTwist.test_field_H0 [compatibility]: For X = Spec F, H⁰_et(X, μ_m^{⊗j}) =
(μ_m^{⊗j})^{G_F}, the H⁰ of finite-tate-twist.
Test EtaleTwist.test_finite_field_H1 [computation]: For X = Spec 𝔽_5, m = 4, j = 1: H¹_et(X, μ_4) ≅
𝔽_5^×/(𝔽_5^×)^4 ≅ ℤ/4.
Test EtaleTwist.test_cont_not_naive_limit [non-example]: For X = Spec 𝔽_q and ℓ ∤ q, the constant
étale sheaf with value the abstract group ℤ_ℓ (discrete topology) has H¹_et(X, ℤ_ℓ) = Hom_cont(Ẑ,
ℤ_ℓ^{disc}) = 0, since a continuous homomorphism from a profinite group to a torsion-free discrete
group is zero, whereas H¹_cont(X, ℤ_ℓ(0)) = lim_ν ℤ/ℓ^ν = ℤ_ℓ ≠ 0: continuous ℓ-adic cohomology is
not the cohomology of an abstract ℤ_ℓ-valued sheaf.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/field-etale-galois-comparison: Étale cohomology of a field is Galois
cohomology (theorem; unchecked).
Let F be a field, F^s a separable closure and G_F = Gal(F^s/F). The functor 𝓕 ↦ colim_E 𝓕(Spec E)
(E/F finite separable inside F^s) is an equivalence between étale sheaves of abelian groups on Spec
F and discrete G_F-modules, and the derived functors of global sections and of invariants agree:
H^{i}_et(Spec F, 𝓕) ≅ H^{i}(G_F, 𝓕(F^s)) (Stacks 03QQ; imported through SchemeAndStackFoundations
SF.2, and for finite coefficients it is AnabelianGeometryAndNonabelianChabauty NC.0/field, 'fields
are étale K(π,1)'). This node realises the twists in it: for m invertible in F, the stalk of
μ_m^{⊗j} (etale-twist-sheaf) at Spec F^s is the module μ_m^{⊗j} of finite-tate-twist, so
H^{i}_et(Spec F, μ_m^{⊗j}) ≅ H^{i}(F, μ_m^{⊗j}) of twisted-cohomology-ring, and H^{i}_cont(Spec F,
ℤ_ℓ(j)) ≅ H^{i}(F, ℤ_ℓ(j)) for ℓ invertible in F. The identification is compatible with long exact
sequences, with cup products, with pullback along a field extension F → F′ (with compatible
separable closures) on the left and restriction on the right, and, for E/F finite separable inside
F^s, with corestriction, which defines the transfer H^{i}_et(Spec E, μ_m^{⊗j}) → H^{i}_et(Spec F,
μ_m^{⊗j}). Two invariance properties follow: for a filtered colimit of fields F = colim F_α with
compatible separable closures, H^{i}(F, μ_m^{⊗j}) = colim_α H^{i}(F_α, μ_m^{⊗j}); and for E/F purely
inseparable, restriction H^{i}(F, μ_m^{⊗j}) → H^{i}(E, μ_m^{⊗j}) is an isomorphism, because G_E →
G_F is an isomorphism of profinite groups.
Hypotheses: F a field; 𝓕 an étale sheaf of abelian groups on Spec F (a discrete G_F-module); m, ℓ
invertible in F where the twists occur.; The general sheaf–module comparison is imported (SF.2,
requested); this node does not prove it again.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.1/finite-tate-twist, MotivicEtaleKTheory:M.1/twisted-cohomology-ring,
MotivicEtaleKTheory:M.1/continuous-limit-comparison, mathlib:CategoryTheory.Sheaf.H,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees,
AnabelianGeometryAndNonabelianChabauty:NC.0/field, SchemeAndStackFoundations:SF.2,
ArithmeticGaloisDuality:R02.1/cochains-inverse-limit
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/s-integer-galois-comparison: Étale cohomology of S-integers is
cohomology of G_{F,S} (theorem; unchecked).
Let F be a number field, S a finite set of places of F containing the archimedean places, O_{F,S}
the ring of S-integers, U = Spec O_{F,S}, F_S ⊂ F^s the maximal extension unramified outside S and
G_{F,S} = Gal(F_S/F) (ArithmeticGaloisDuality R02.3/restricted-ramification-group). Let M be a
finite discrete G_{F,S}-module whose order is invertible on U, and 𝓕 the corresponding locally
constant étale sheaf on U. Then H^{i}_et(U, 𝓕) ≅ H^{i}(G_{F,S}, M) for all i ≥ 0, naturally in M and
compatibly with long exact sequences, cup products, enlarging S, and pullback to the generic point
(inflation H^{i}(G_{F,S}, M) → H^{i}(F, M) under field-etale-galois-comparison). In particular, for
m invertible on U, H^{i}_et(U, μ_m^{⊗j}) ≅ H^{i}(G_{F,S}, μ_m^{⊗j}) (μ_m ⊂ F_S because the primes
dividing m lie in S), and, passing to limits, H^{i}_cont(U, ℤ_ℓ(j)) ≅ H^{i}(G_{F,S}, ℤ_ℓ(j)) for ℓ
invertible on U. For i = 1 and M = μ_m the isomorphism carries the étale Kummer sequence 0 →
O_{F,S}^×/m → H¹_et(U, μ_m) → Pic(O_{F,S})[m] → 0 of etale-kummer-sequences to the S-unit Kummer
sequence of ArithmeticGaloisDuality R02.3/s-unit-kummer-sequence. For a finite extension E ⊂ F_S of
F, the comparison for O_{E,S} is that for O_{F,S} restricted to the open subgroup G_{E,S} =
Gal(F_S/E), and corestriction G_{E,S} → G_{F,S} defines the transfer H^{i}_et(Spec O_{E,S},
μ_m^{⊗j}) → H^{i}_et(U, μ_m^{⊗j}), with cor ∘ res = [E : F].
Hypotheses: F a number field (the supplier R02.3 treats number fields only); S finite with S ⊇ S_∞;
the order of M invertible on O_{F,S}.; For ℓ = 2 and F with real places the comparison is for the
ordinary groups H^{i}(G_{F,S}, M), which do not vanish in high degrees; modified groups are M.2's.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison,
MotivicEtaleKTheory:M.1/continuous-limit-comparison, MotivicEtaleKTheory:M.1/etale-kummer-sequences,
MotivicEtaleKTheory:M.1/localization-gysin-sequence,
ArithmeticGaloisDuality:R02.3/restricted-ramification-group,
ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence,
ArithmeticGaloisDuality:R02.4/global-finiteness,
ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees,
SchemeAndStackFoundations:SF.2
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/etale-kummer-sequences: Étale Kummer sequences with units, Picard and
Brauer terms (theorem; unchecked).
Let X be a scheme and n ≥ 1 invertible on X. The sequence of étale sheaves 1 → μ_n → G_m --n--> G_m
→ 1 is exact, and, writing Pic(X) = H¹_et(X, G_m) and Br'(X) ⊂ H²_et(X, G_m) for the cohomological
Brauer group of SchemeAndStackFoundations SF.2/cohomological-brauer (the torsion subgroup, so that
H²_et(X, G_m)[n] = Br'(X)[n]), it gives natural exact sequences 0 → O(X)^×/n → H¹_et(X, μ_n) →
Pic(X)[n] → 0 and 0 → Pic(X)/n → H²_et(X, μ_n) → Br'(X)[n] → 0. For X = Spec F the first map
O(X)^×/n → H¹_et(X, μ_n) ≅ H¹(F, μ_n) is Tau Ceti's kummerMap, and it is an isomorphism (Hilbert 90,
ProfiniteCohomology Layer 9). For X = Spec O_{F,S} with n invertible these are the sequences used in
K-book VI.8.5 and in HabiroNumberFields HB.1 for O_L[1/p], and the inclusion O_{F,S} → F makes them
compatible with the field sequences; their identification with the Galois-side S-unit Kummer
sequence of ArithmeticGaloisDuality R02.3/s-unit-kummer-sequence is part of
s-integer-galois-comparison.
Hypotheses: X a scheme; n invertible on X.; The exactness of 1 → μ_n → G_m → G_m → 1 on X_et and
Pic(X) = H¹_et(X, G_m) (Hilbert 90 for G_m) are SchemeAndStackFoundations SF.2's imports from
ConstructibleEtale (requested); this node derives the cohomology sequences and their
compatibilities.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison, tauceti:TauCeti.kummerMap,
tauceti:TauCeti.ker_kummerMap,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory,
SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.2/cohomological-brauer
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/henselian-residue-comparison: Henselian local rings: cohomology of the
closed point (theorem; unchecked).
Let A be a henselian local ring with residue field k (for example a complete discrete valuation ring
𝒪_v), and m invertible in k. For every j ∈ ℤ and i ≥ 0, restriction to the closed point induces
isomorphisms H^{i}_et(Spec A, μ_m^{⊗j}) ≅ H^{i}_et(Spec k, μ_m^{⊗j}) ≅ H^{i}(k, μ_m^{⊗j}), natural
in A and compatible with cup products; passing to limits, the same holds for H^{i}_cont(−, ℤ_ℓ(j))
with ℓ invertible in k.
Hypotheses: A henselian local; m invertible in the residue field k (hence in A); j ∈ ℤ.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison,
MotivicEtaleKTheory:M.1/continuous-limit-comparison,
ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5,
mathlib:HenselianLocalRing
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.1/localization-gysin-sequence: The étale localization sequence of a
Dedekind scheme (theorem; unchecked).
Let B be a Dedekind scheme (for example Spec O_{F,S} or the spectrum of a discrete valuation ring),
Z ⊂ B a finite set of closed points with open complement V, m invertible on B and j ∈ ℤ. For each
closed point v, purity gives isomorphisms H^{i}_{\{v\}}(B, μ_m^{⊗j}) ≅ H^{i−2}(k(v), μ_m^{⊗(j−1)}),
and hence a natural long exact sequence … → H^{i}_et(B, μ_m^{⊗j}) → H^{i}_et(V, μ_m^{⊗j}) --∂-->
⊕_{v∈Z} H^{i−1}(k(v), μ_m^{⊗(j−1)}) → H^{i+1}_et(B, μ_m^{⊗j}) → … . If B is integral with function
field F, passing to the colimit over Z gives the sequence with Spec F in place of V and the sum over
all closed points. The residue ∂_v : H^{i}(F, μ_m^{⊗j}) → H^{i−1}(k(v), μ_m^{⊗(j−1)}) satisfies
∂_v(κ(a)) = v(a) mod m in H⁰(k(v), μ_m^{⊗0}) = ℤ/m for j = 1, i = 1, and ∂_v(κ(u) ∪ x) =
−κ_{k(v)}(ū) ∪ ∂_v(x) for a v-unit u (equivalently ∂_v(x ∪ κ(u)) = ∂_v(x) ∪ κ_{k(v)}(ū)). For ℓ
invertible on B the sequence for finite Z holds with continuous ℤ_ℓ(j) and ℚ_ℓ(j) coefficients, and
both sequences hold with ℚ_ℓ/ℤ_ℓ(j) coefficients. The generic-point sequence with ℤ_ℓ(j)
coefficients is not asserted: ℓ-adic completion does not commute with the infinite direct sum (for B
= Spec ℤ[1/ℓ] and j = 1, H¹_cont(ℚ, ℤ_ℓ(1)) is the ℓ-adic completion of ℚ^×, whose image is not
contained in ⊕_p ℤ_ℓ).
Hypotheses: B a Dedekind scheme (noetherian, regular, of dimension ≤ 1); m invertible on B, so that
every residue characteristic is prime to m; for the generic-point form, B integral with function
field F.; A closed point of a Dedekind scheme of mixed characteristic is not a smooth pair over a
field, so EtaleDualityAndPerverseSheaves EDC.3/smooth-pair-purity does not apply (that node excludes
regular pairs over a trait); purity is proved here from the henselian trait. No perfectness of the
residue fields is needed.; The sign of ∂_v on cup products is fixed by the convention ∂_v(κ(π)) = 1
for a uniformiser π; M.3/symbol-residue-compatibility compares it with K2SymbolsBrauer's tame
symbol.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.1/henselian-residue-comparison,
MotivicEtaleKTheory:M.1/etale-kummer-sequences,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison,
EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports,
ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence, SchemeAndStackFoundations:SF.2
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/real-restriction-map: Restriction to the real places (construction;
unchecked).
Let F be a number field with r_1 real embeddings σ : F → ℝ, S a set of places containing S_∞ and the
places above 2, R = O_{F,S}, and M one of the coefficient modules ℤ/2^ν(j) = μ_{2^ν}^{⊗j}, ℤ_2(j) or
ℤ/2^∞(j) = ℚ_2/ℤ_2(j). For each real place σ the decomposition group G_ℝ = Gal(ℂ/ℝ) ⊂ G_{F,S} gives
a restriction H^{n}_et(R, M) ≅ H^{n}(G_{F,S}, M) → H^{n}(ℝ, M); their sum is α^{n}_S(j) :
H^{n}_et(R, M) → ⊕_{σ real} H^{n}(ℝ, M). The targets are periodic: for n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅
ℤ/2 if j − n is odd and 0 if j − n is even; H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for all n ≥ 0; and, for n > 0,
H^{n}(ℝ; ℤ_2(j)) ≅ ℤ/2 if n ≡ j (mod 2) and 0 otherwise. Complex conjugation acts on ℤ_2(j) by
(−1)^j.
Hypotheses: F a number field with r_1 ≥ 0 real places; S ⊇ S_∞ ∪ {v | 2}; ν ≥ 1, j ∈ ℤ.
Direct prerequisites: MotivicEtaleKTheory:M.1/s-integer-galois-comparison,
MotivicEtaleKTheory:M.1/adic-tate-twist, ArithmeticGaloisDuality:R02.3/localisation-maps,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees,
mathlib:NumberField.InfinitePlace, mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven,
mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd
Proposed namespace: TauCeti.RealPlaces
API TauCeti.RealPlaces.alpha [constructor]: α^{n}_S(j) : H^{n}_et(O_{F,S}, M) → ⊕_{σ real} H^{n}(ℝ,
M).
API TauCeti.RealPlaces.alpha_natural [functoriality]: α commutes with the maps induced by S ⊆ T and
by coefficient maps.
API TauCeti.RealPlaces.alpha_cup [compatibility]: α is multiplicative for cup products.
API TauCeti.RealPlaces.realCohomology_divisible [simp]: For n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅ ℤ/2 if j − n
is odd and 0 if j − n is even.
API TauCeti.RealPlaces.realCohomology_modTwo [simp]: H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for every n ≥ 0.
API TauCeti.RealPlaces.alpha_one_sign [characterisation]: On H¹(O_{F,S}, ℤ/2) ⊇ O_{F,S}^×/2, α¹ is
the sign map u ↦ (sign σ(u))_σ.
Test RealPlaces.test_totally_imaginary [degenerate]: If r_1 = 0 the target of α^{n}_S(j) is 0.
Test RealPlaces.test_rat_sign [computation]: For F = ℚ, S = {2, ∞}: α¹(−1) ≠ 0 and α¹(2) = 0.
Test RealPlaces.test_localisation_compat [compatibility]: For n ≥ 1, α^{n}_S(j) is the sum over the
real places v of ArithmeticGaloisDuality R02.3's localisation maps loc_v : H^{n}(G_{F,S}, M) →
Ĥ^{n}(G_v, M), under the equality Ĥ^{n} = H^{n} of Tate and ordinary cohomology of G_ℝ in positive
degrees. In degree 0 they differ: loc_v is α⁰ followed by M^{G_ℝ} → M^{G_ℝ}/N·M, and for M =
ℤ/2^∞(0) this quotient is ℚ_2/ℤ_2 → 0, so α⁰ ≠ 0 while R02.3's localisation map is 0.
Test RealPlaces.test_parity [non-example]: H²(ℝ; ℤ/2^∞(2)) = 0 although H²(ℝ; ℤ/2) ≠ 0: the
divisible and mod-2 targets differ, so α for ℤ/2^∞(j) is not the mod-2 α.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/positive-and-modified-cohomology: Positive and modified étale
cohomology at the real places (definition; unchecked).
In the setting of real-restriction-map, three theories are kept separate. (i) Ordinary cohomology
H^{n}_et(R, M). (ii) Positive (Kahn's totally positive) cohomology H^{n}_+(R, M), the cohomology of
RΓ_+(R, M) = fibre(RΓ_et(R, M) → ⊕_{σ real} RΓ(G_ℝ, M)); it sits in the exact sequence … → ⊕_σ
H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}_et(R, M) --α^n--> ⊕_σ H^{n}(ℝ, M) → … . (iii) The kernel
groups H̃^{n}(R, M) = ker(α^{n}) of K-book VI.9, which receive H^{n}_+(R, M) surjectively with
kernel coker(α^{n−1}). Neither (ii) nor (iii) is the compactly supported or Tate-modified cohomology
of ArithmeticGaloisDuality D7, which uses Tate cohomology at the real places; for ℓ odd, H^{n}(ℝ, M)
= 0 for n ≥ 1, so H̃^{n} = H^{n} for n ≥ 1 and H^{n}_+ = H^{n} for n ≥ 2, while H⁰_+ = ker α⁰ and
H¹_+ is an extension of H¹ by coker α⁰, because the ordinary H⁰(ℝ, M) = M^{G_ℝ} is not zero.
Hypotheses: As in real-restriction-map; M a 2-primary coefficient module; the same fibre is formed
for ℓ-primary M with ℓ odd, where it differs from ordinary cohomology only in degrees 0 and 1.; H̃
is a subgroup of ordinary cohomology; H_+ is defined by a mapping fibre; D7's modified complexes are
imported, not redefined.
Direct prerequisites: MotivicEtaleKTheory:M.2/real-restriction-map,
ArithmeticGaloisDuality:D7/compact-support-without-p
Proposed namespace: TauCeti.RealPlaces
API TauCeti.RealPlaces.positiveCohomology [constructor]: H^{n}_+(R, M) as cohomology of the fibre of
α on cochains.
API TauCeti.RealPlaces.positive_long_exact [relation]: The long exact sequence … → ⊕_σ H^{n−1}(ℝ, M)
→ H^{n}_+(R, M) → H^{n}(R, M) → ⊕_σ H^{n}(ℝ, M) → ….
API TauCeti.RealPlaces.kernelCohomology [constructor]: H̃^{n}(R, M) = ker α^{n}.
API TauCeti.RealPlaces.positive_to_kernel [relation]: 0 → coker α^{n−1} → H^{n}_+(R, M) → H̃^{n}(R,
M) → 0 is exact.
API TauCeti.RealPlaces.odd_agree [characterisation]: For ℓ-primary M with ℓ odd: H̃^{n} = H^{n} for
n ≥ 1, H^{n}_+ = H^{n} for n ≥ 2, H⁰_+ = ker α⁰, and 0 → coker α⁰ → H¹_+ → H¹ → 0 is exact.
API TauCeti.RealPlaces.positive_to_tateModified [compatibility]: The map from ordinary to Tate
cochains of G_ℝ (bijective on H^{n} for n ≥ 1, the quotient M^{G_ℝ} → M^{G_ℝ}/N·M on H⁰) induces a
map from H^{n}_+(R, M) to the cohomology of the fibre of RΓ(R, M) → ⊕_σ R̂Γ(G_ℝ, M) with Tate
complexes at the real places (as in ArithmeticGaloisDuality D7); it is bijective for n ≥ 2 and
surjective for n = 1. D7's compactly supported cohomology also has the finite places of S in its
fibre and is not identified with H_+.
Test RealPlaces.test_totally_imaginary_agree [degenerate]: If r_1 = 0 then H^{n}_+ = H̃^{n} = H^{n}
for all n.
Test RealPlaces.test_rat_kernel [computation]: For F = ℚ, S = {2, ∞}, M = ℤ/2: H̃¹ is spanned by the
class of 2 and has dimension 1.
Test RealPlaces.test_high_degree [computation]: For n ≥ 3, H̃^{n}(R, ℤ/2) = 0 (α^n is bijective) and
H^{n}_+(R, ℤ/2) = 0 (α^{n−1} is surjective, by high-degree-real-isomorphism), although H^{n}(R, ℤ/2)
≅ (ℤ/2)^{r_1}.
Test RealPlaces.test_not_ordinary [non-example]: For F = ℚ, S = {2, ∞}, M = ℤ/2, n = 3: H³ ≅ ℤ/2 but
H̃³ = 0, so the kernel groups are not ordinary cohomology.
Test RealPlaces.test_odd_degree_one [non-example]: For F = ℚ(√2), ℓ = 3, M = ℤ/3 and S = S_∞ ∪ {v |
3}: α⁰ : ℤ/3 → (ℤ/3)² is the diagonal, so coker α⁰ ≅ ℤ/3 and the canonical map H¹_+(R, ℤ/3) → H¹(R,
ℤ/3) has kernel ℤ/3, although H̃¹(R, ℤ/3) = H¹(R, ℤ/3): positive cohomology differs from ordinary
cohomology in degree 1 even for ℓ odd.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/high-degree-real-isomorphism: Cohomological dimension and the real
places in high degrees (theorem; unchecked).
Let F be a number field, S ⊇ S_∞ ∪ {v | ℓ} and R = O_{F,S}. (a) If ℓ is odd, or F is totally
imaginary, then cd_ℓ(G_{F,S}) ≤ 2, so H^{n}_et(R, M) = 0 for n ≥ 3 and every ℓ-primary torsion
module M. For every F (ℓ = 2 included), the open subgroup Gal(F_S/F(√−1)) = G_{F(√−1),S}, of index
at most 2 (F(√−1) ⊂ F_S because S contains the places above 2), has cd_ℓ ≤ 2, so vcd_ℓ(G_{F,S}) ≤ 2:
this is the finite virtual cohomological dimension that étale descent uses. (b) For ℓ = 2 and every
2-primary torsion discrete G_{F,S}-module M (finite, or a filtered colimit of finite ones such as
ℤ/2^∞(j)), α^{n}_S : H^{n}_et(R, M) → ⊕_σ H^{n}(ℝ, M) is an isomorphism for n ≥ 3. (c) For ℓ = 2 and
every finite 2-primary M, α² : H²_et(R, M) → ⊕_σ H²(ℝ, M) is surjective; in particular α² is onto
for M = ℤ/2. For S finite, i ∈ ℤ and M = ℤ/2^∞(i), α²_S(i) is surjective with kernel the divisible
subgroup H²_cont(R, ℤ_2(i)) ⊗ ℚ_2/ℤ_2, so α²_S(i) is an isomorphism exactly when H²_cont(R, ℤ_2(i))
is finite. That finiteness for i ≥ 2 (K-book Exercises VI.8.1–8.2, used in Exercise VI.9.1) rests on
the finiteness of K_{2i−2}(R) through the motivic spectral sequence, not on Poitou–Tate duality, and
is not part of this theorem. Here cd_ℓ is ProfiniteCohomology Layer 11's cohomological dimension.
Hypotheses: F a number field; S ⊇ S_∞ ∪ {v | ℓ}; M an ℓ-primary torsion G_{F,S}-module.; In (c) for
ℤ/2^∞(i), S is finite, so that H²_cont(R, ℤ_2(i)) is a finitely generated ℤ_2-module.
Direct prerequisites: MotivicEtaleKTheory:M.2/real-restriction-map,
ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound,
ArithmeticGaloisDuality:R02.4/h2-localisation-surjective, ArithmeticGaloisDuality:R02.4/poitou-tate,
MotivicEtaleKTheory:M.1/s-integer-galois-comparison,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension,
MotivicEtaleKTheory:M.2/adic-s-integer-cohomology
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/s-integer-brauer-sequence: The Brauer group of a ring of S-integers
(theorem; unchecked).
Let F be a number field, S a finite set of places containing S_∞ and at least one finite place, and
O_S = O_{F,S}. Then H²_et(Spec O_S, G_m) is a torsion group, so it equals the cohomological Brauer
group Br'(O_S) of SchemeAndStackFoundations SF.2, and it fits into the exact sequence 0 → Br'(O_S) →
(ℤ/2)^{r_1} ⊕ ⊕_{v ∈ S finite} ℚ/ℤ --add--> ℚ/ℤ → 0, where the maps to the summands are the local
invariants inv_v (ℤ/2 = ½ℤ/ℤ at real places) and the last map is the sum. In particular, for ℓ odd,
Br'(O_S)[ℓ] ≅ (ℤ/ℓ)^{s−1} with s the number of finite places in S. No prime needs to be invertible
on O_S: the sequence describes every ℓ-primary part, including those for the residue characteristics
of primes outside S. Without a finite place in S the sum map is not onto (for S = S_∞ its image is
½ℤ/ℤ if r_1 > 0 and 0 if r_1 = 0); its cokernel is then H³_et(Spec O_F, G_m) (Milne ADT II.2.1).
Hypotheses: F a number field; S finite, S ⊇ S_∞; for the surjectivity of the sum map, S contains at
least one finite place.; No invertibility condition on any prime.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-kummer-sequences,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants,
SchemeAndStackFoundations:SF.2/cohomological-brauer, SchemeAndStackFoundations:SF.2,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/mod-two-dimension-formulas: Mod-2 dimensions, the narrow Picard group
and the signature defect (theorem; unchecked).
Let F be a number field with r_1 > 0 real and r_2 complex places, R = O_{F,S} with 1/2 ∈ R, s the
number of finite places in S, t = dim_{𝔽_2} Pic(R)/2 and u = dim_{𝔽_2} Pic^+(R)/2, where Pic^+(R) is
the narrow Picard group (cokernel of the restricted divisor map F^×_+ → ⊕_{𝔭 ∉ S} ℤ; it is the
quotient of Tau Ceti's NumberField.NarrowClassGroup F by the classes of the finite places of S).
Then (a) dim H¹_et(R, ℤ/2) = r_1 + r_2 + s + t and dim H²_et(R, ℤ/2) = r_1 + s + t − 1; (b) there is
an exact sequence 0 → H̃¹(R; ℤ/2) → H¹(R; ℤ/2) --α¹--> (ℤ/2)^{r_1} → Pic^+(R)/2 → Pic(R)/2 → 0; (c)
the signature defect j(R) = dim coker α¹ satisfies u = t + j(R) and 0 ≤ j(R) < r_1; (d) dim H̃¹(R,
ℤ/2) = r_2 + s + u and dim H̃²(R, ℤ/2) = t + s − 1.
Hypotheses: F a number field with r_1 > 0; S ⊇ S_∞ ∪ {v | 2} finite.
Direct prerequisites: MotivicEtaleKTheory:M.2/positive-and-modified-cohomology,
MotivicEtaleKTheory:M.2/s-integer-brauer-sequence,
MotivicEtaleKTheory:M.2/high-degree-real-isomorphism,
MotivicEtaleKTheory:M.1/etale-kummer-sequences, mathlib:CommRing.Pic,
ArithmeticKTheory:N.2/S-unit-and-class-group-sequence, mathlib:NumberField.Units.finrank_eq,
mathlib:NumberField.RingOfIntegers.instFintypeClassGroup, tauceti:NumberField.NarrowClassGroup
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/even-twist-real-surjection: Surjectivity onto the real places in even
weight (lemma; unchecked).
Let F be a number field with r_1 > 0 and i even. Then α¹(i) : H¹(F, ℤ/2^∞(i)) → ⊕_σ H¹(ℝ, ℤ/2^∞(i))
≅ (ℤ/2)^{r_1} is a split surjection, and for all sufficiently large finite S, H¹(O_S; ℤ/2^∞(i)) ≅
(ℤ/2)^{r_1} ⊕ H̃¹(O_S; ℤ/2^∞(i)).
Hypotheses: F a number field with r_1 > 0; i even; S ⊇ S_∞ ∪ {v | 2} finite and large enough that
the S-units realise every sign vector in (ℤ/2)^{r_1}.
Direct prerequisites: MotivicEtaleKTheory:M.2/real-restriction-map,
MotivicEtaleKTheory:M.2/positive-and-modified-cohomology,
MotivicEtaleKTheory:M.1/etale-kummer-sequences, MotivicEtaleKTheory:M.1/continuous-limit-comparison
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/adic-s-integer-cohomology: ℓ-adic cohomology of S-integers: finiteness
and rationalisation (theorem; unchecked).
Let F be a number field, ℓ a prime, S ⊇ S_∞ ∪ {v | ℓ} finite and R = O_{F,S}. For every j ∈ ℤ and n
≥ 0: (a) H^{n}_et(R, μ_{ℓ^ν}^{⊗j}) is finite, so H^{n}_cont(R, ℤ_ℓ(j)) = lim_ν H^{n}_et(R,
μ_{ℓ^ν}^{⊗j}) is a finitely generated ℤ_ℓ-module; (b) H^{n}_cont(R, ℚ_ℓ(j)) = H^{n}_cont(R, ℤ_ℓ(j))
⊗ ℚ_ℓ; (c) the torsion subgroup is H^{n}_cont(R, ℤ_ℓ(j))_tors ≅ coker(H^{n−1}_cont(R, ℚ_ℓ(j)) →
H^{n−1}_et(R, ℚ_ℓ/ℤ_ℓ(j))); in particular for j ≠ 0, H¹_cont(R, ℤ_ℓ(j))_tors ≅ H⁰(R, ℚ_ℓ/ℤ_ℓ(j)) =
ℤ/w_j^{(ℓ)}(F). (d) Tate's Euler characteristic formula gives rank H¹_cont(R, ℤ_ℓ(j)) − rank
H²_cont(R, ℤ_ℓ(j)) = r_2 for j even and r_1 + r_2 for j odd, for every j ≠ 0 and every prime ℓ (for
ℓ = 2 a real place contributes the bounded factor #H⁰(ℝ, μ_{2^ν}^{⊗j}) = 2 when j is odd, which does
not change ranks).
Hypotheses: F a number field; S ⊇ S_∞ ∪ {v | ℓ} finite; j ∈ ℤ.; (d) holds for every ℓ:
R02.4/global-euler-characteristic uses ordinary H⁰ at the real places, and only H⁰, H¹, H² enter it.
Direct prerequisites: MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.1/s-integer-galois-comparison,
MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist, ArithmeticGaloisDuality:R02.4/global-finiteness,
ArithmeticGaloisDuality:R02.4/global-euler-characteristic,
ArithmeticGaloisDuality:R02.1/tate-inverse-limit, ArithmeticGaloisDuality:R02.1/rationalization,
ArithmeticGaloisDuality:R02.1/continuous-section-long-exact,
ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.2/degree-two-localization-diagram: The degree-two comparison diagram of
localization sequences (theorem; unchecked).
Let F be a number field, S ⊇ S_∞ a finite set of places, O_S = O_{F,S}, and m = ℓ^r with ℓ
invertible on O_S. (a) The K-theory row. Tate's sequence 0 → K_2(O_S) → K_2(F) --d^S--> ⊕_{v∉S}
k(v)^× → 0 (K2SymbolsBrauer T.5; d^S = (d_v) the tame symbols) and the snake lemma for
multiplication by m give the exact sequence 0 → K_2(O_S)[m] → K_2(F)[m] --d^S--> ⊕_{v∉S} μ_m(k(v)) →
K_2(O_S)/m → K_2(F)/m --d^S--> ⊕_{v∉S} k(v)^×/m → 0, using k(v)^×[m] = μ_m(k(v)). (b) The étale row.
The localization sequence of M.1 for O_S ⊂ F gives the exact sequence H¹_et(O_S, μ_m^{⊗2}) → H¹(F,
μ_m^{⊗2}) --∂--> ⊕_{v∉S} H⁰(k(v), μ_m) → H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) --∂--> ⊕_{v∉S}
H¹(k(v), μ_m) → 0; the last map is onto because H³_et(O_S, μ_m^{⊗2}) → H³(F, μ_m^{⊗2}) is injective:
both groups vanish when ℓ is odd or F is totally imaginary, and for ℓ = 2 both are identified with
⊕_{σ real} H³(ℝ, μ_m^{⊗2}) by the real restriction maps. (c) The residue columns. For v ∉ S,
μ_m(k(v)) = H⁰(k(v), μ_m) and the Kummer map k(v)^×/m → H¹(k(v), μ_m) are isomorphisms. The residue
maps of the two rows satisfy, for a v-unit u, x ∈ F^× and z ∈ μ_m(F): ∂_v(κ(u) ∪ κ(x)) =
−v(x)·κ_{k(v)}(ū) and d_v{u, x} = ū^{v(x)}; d_v{z, x} = z^{v(x)}. (d) The ring column is not
determined by the field column: the kernel of H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) is the cokernel
of ∂ : H¹(F, μ_m^{⊗2}) → ⊕_{v∉S} H⁰(k(v), μ_m); when μ_m ⊂ F it is (Pic(O_S)/m) ⊗ μ_m, which is
nonzero for F = ℚ(μ_37), S the places above 37 and ∞, and m = 37. So a map K_2(O_S)/m → H²_et(O_S,
μ_m^{⊗2}) compatible with a map K_2(F)/m → H²(F, μ_m^{⊗2}) is not unique, and the ring column is a
separate construction. Given vertical maps that commute with both rows (the identity, up to the sign
of the conventions, on ⊕_{v∉S} μ_m(k(v)) and the Kummer isomorphisms on ⊕_{v∉S} k(v)^×/m), if the
field map is bijective and the images of K_2(F)[m] and of H¹(F, μ_m^{⊗2}) in ⊕_{v∉S} μ_m(k(v))
coincide, then the ring map is bijective.
Hypotheses: F a number field; S ⊇ S_∞ finite; m = ℓ^r invertible on O_S.; The tame symbol convention
is K2SymbolsBrauer T.3's (d_v{u, π} = ū); the cohomological residue is M.1's (∂_v(κ(π)) = 1 and
∂_v(κ(u) ∪ y) = −κ(ū) ∪ ∂_v(y)).; No vertical map out of K_2(O_S)/m or K_2(F)/m is constructed here:
the Galois symbol and its compatibility with residues are M.3/galois-symbol and
M.3/symbol-residue-compatibility.
Direct prerequisites: MotivicEtaleKTheory:M.1/localization-gysin-sequence,
MotivicEtaleKTheory:M.1/etale-kummer-sequences,
MotivicEtaleKTheory:M.2/high-degree-real-isomorphism,
K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence, K2SymbolsBrauer:T.3/tame-symbol-hom
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/cohomological-steinberg: The cohomological Steinberg relation (theorem;
unchecked).
Let F be a field and m ≥ 1 invertible in F, and let κ : F^× → H¹(F, μ_m) be the Kummer map (Tau
Ceti's kummerMap). For every a ∈ F with a ≠ 0, 1, κ(a) ∪ κ(1 − a) = 0 in H²(F, μ_m^{⊗2}), the cup
product being that of M.1/twisted-cohomology-ring for the tensor pairing μ_m × μ_m → μ_m ⊗ μ_m =
μ_m^{⊗2}, (ζ, ξ) ↦ ζ ⊗ ξ (multiplication of roots of unity μ_m × μ_m → μ_m is not biadditive and is
not used). The same holds for Tate's ℓ-adic classes: d_F a ∪ d_F(1 − a) = 0 in H²(F, ℤ_ℓ(2)) for
every prime ℓ ≠ char F (Tate's relation (∗) in the proof of (3.1)). The adic form does not follow
from the finite-level statements alone, because the kernel of H²(F, ℤ_ℓ(2)) → lim_ν H²(F,
μ_{ℓ^ν}^{⊗2}) is lim¹_ν H¹(F, μ_{ℓ^ν}^{⊗2}).
Hypotheses: F a field, m invertible in F (ℓ ≠ char F in the adic form); a ∈ F ∖ {0, 1}.; The
coefficient pairing is the tensor pairing μ_m × μ_m → μ_m^{⊗2} with the diagonal Galois action; no
primitive root of unity is assumed.
Direct prerequisites: MotivicEtaleKTheory:M.1/twisted-cohomology-ring,
MotivicEtaleKTheory:M.1/adic-tate-twist, tauceti:TauCeti.kummerMap,
tauceti:TauCeti.ContCohomology.explicitCup_projection11,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory,
MotivicEtaleKTheory:M.1/continuous-limit-comparison, ArithmeticGaloisDuality:R02.1/rationalization
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/galois-symbol: The Galois symbol on K₂ of a field (construction;
unchecked).
Let F be a field and m ≥ 1 invertible in F. The Galois symbol (norm residue symbol of degree two) is
the unique homomorphism h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}) with h_{F,m}{a, b} = κ(a) ∪ κ(b) for
all a, b ∈ F^×, where K_2(F) is classical K₂ (K2SymbolsBrauer T.1) presented by Matsumoto's theorem
(K2SymbolsBrauer T.2/matsumoto), κ is the Kummer map, and the cup product is that of
M.1/twisted-cohomology-ring for the tensor pairing μ_m × μ_m → μ_m ⊗ μ_m = μ_m^{⊗2}, (ζ, ξ) ↦ ζ ⊗ ξ.
It is natural for every field extension E/F: res_{E/F} ∘ h_{F,m} = h_{E,m} ∘ (K_2(F)/m → K_2(E)/m),
restriction being taken along G_E → G_F for an F-embedding of separable closures (the map on
cohomology does not depend on the embedding). It is compatible with change of m: for m | m' and x ∈
K_2(F), h_{F,m}(x mod m) = (r ⊗ r)_*(h_{F,m'}(x mod m')) with r : μ_{m'} → μ_m, ζ ↦ ζ^{m'/m}. For m
= ℓ prime it is Tate's h_1 of diagram (3.3). Its compatibility with norms and residues is
symbol-norm-compatibility and symbol-residue-compatibility. M.3 constructs no Chern class: the
degree-two étale Chern class c_{2,2} is MotivicEtaleKTheory:M.8/finite-etale-chern (RS-08 keeps the
étale Chern classes in M.8), and its comparison with h_{F,m} is K2SymbolsBrauer
T.7/chern-class-agreement, which consumes this node.
Hypotheses: F a field; m invertible in F. No primitive m-th root of unity is assumed.
Direct prerequisites: MotivicEtaleKTheory:M.3/cohomological-steinberg,
MotivicEtaleKTheory:M.1/twisted-cohomology-ring, K2SymbolsBrauer:T.2/matsumoto,
K2SymbolsBrauer:T.1/k2-definition, tauceti:TauCeti.kummerMap,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory
Proposed namespace: TauCeti.GaloisSymbol
API TauCeti.GaloisSymbol.symbol [constructor]: h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}).
API TauCeti.GaloisSymbol.symbol_steinberg [simp]: h_{F,m}{a, b} = κ(a) ∪ κ(b).
API TauCeti.GaloisSymbol.symbol_unique [extensionality]: Two homomorphisms K_2(F)/m → A agreeing on
all Steinberg symbols are equal.
API TauCeti.GaloisSymbol.symbol_res [functoriality]: res_{E/F} ∘ h_{F,m} = h_{E,m} ∘ (K_2(F)/m →
K_2(E)/m) for every field extension E/F, restriction along G_E → G_F for an F-embedding of separable
closures.
API TauCeti.GaloisSymbol.symbol_reduce [functoriality]: For m | m' and x ∈ K_2(F): h_{F,m}(x mod m)
= (r ⊗ r)_*(h_{F,m'}(x mod m')), where r : μ_{m'} → μ_m is ζ ↦ ζ^{m'/m} and r ⊗ r : μ_{m'}^{⊗2} →
μ_m^{⊗2} is the reduction of coefficients.
API TauCeti.GaloisSymbol.symbol_skew [relation]: h{a, b} = −h{b, a} and h{a, −a} = 0.
Test GaloisSymbol.test_one [degenerate]: For m = 1 the symbol is the zero map between zero groups;
and for every a ∈ F^× and every m-th power b = c^m, h_{F,m}{a, b} = κ(a) ∪ κ(c^m) = 0, since the
Kummer class of an m-th power vanishes. A definition through a cocycle not built from the Kummer
classes fails the second clause.
Test GaloisSymbol.test_hamilton [computation]: For F = ℝ and m = 2, h{−1, −1} ≠ 0 (Hamilton's
quaternions are not split).
Test GaloisSymbol.test_explicitCup11 [compatibility]: h{a, b} = explicitCup11(kummerMap a, kummerMap
b) for the tensor pairing KummerCoeff × KummerCoeff → μ_m^{⊗2} (Tau Ceti's low-degree model).
Test GaloisSymbol.test_not_untwisted [non-example]: For F = ℚ and m = 3: h_{ℚ,3}{3, 7} ≠ 0, because
by symbol-residue-compatibility its residue at 7 is −κ(3 mod 7) ∈ H¹(𝔽_7, μ_3) = 𝔽_7^×/𝔽_7^{×3}, and
3 is not a cube modulo 7. By contrast every G_ℚ-equivariant biadditive pairing μ_3 × μ_3 → μ_3 is
zero (writing it (ζ^i, ζ^j) ↦ w^{ij}, complex conjugation forces w = w^{−1}, so w = 1), so a symbol
built from κ(a) and κ(b) with untwisted coefficients μ_3 vanishes identically.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/adic-galois-symbol: Tate's ℓ-adic Galois symbol (construction;
unchecked).
Let F be a field and ℓ ≠ char F a prime. Tate's adic Galois symbol is the unique homomorphism h_F :
K_2(F) → H²(F, ℤ_ℓ(2)) with h_F{a, b} = d_F a ∪ d_F b (cup product for the pairing ℤ_ℓ(1) × ℤ_ℓ(1) →
ℤ_ℓ(2) of M.1/adic-tate-twist), where d_F : F^× = H⁰(F, F_s^×) → H¹(F, ℤ_ℓ(1)) is the connecting map
of Tate's exact sequence 0 → ℤ_ℓ(1) → lim_i F_s^× → F_s^× → 0 (the limit taken along x ↦ x^ℓ, the
last map (x_i)_i ↦ x_0; Tate §3). Under H¹(F, ℤ_ℓ(1)) ≅ lim_ν H¹(F, μ_{ℓ^ν}), which is bijective
because the groups μ_{ℓ^ν}(F) are finite, d_F a is the compatible family of Kummer classes
(κ_{ℓ^ν}(a))_ν. The reduction of h_F modulo ℓ^ν, composed with H²(F, ℤ_ℓ(2))/ℓ^ν → H²(F,
μ_{ℓ^ν}^{⊗2}), is the Galois symbol h_{F,ℓ^ν}.
Hypotheses: F a field; ℓ ≠ char F prime.
Direct prerequisites: MotivicEtaleKTheory:M.3/cohomological-steinberg,
MotivicEtaleKTheory:M.3/galois-symbol, MotivicEtaleKTheory:M.1/continuous-limit-comparison,
K2SymbolsBrauer:T.2/matsumoto, MotivicEtaleKTheory:M.1/adic-tate-twist,
MotivicEtaleKTheory:M.1/twisted-cohomology-ring, tauceti:TauCeti.kummerMap
Proposed namespace: TauCeti.GaloisSymbol
API TauCeti.GaloisSymbol.adicSymbol [constructor]: h_F : K_2(F) → H²(F, ℤ_ℓ(2)).
API TauCeti.GaloisSymbol.adicSymbol_steinberg [simp]: h_F{a, b} = d_F a ∪ d_F b.
API TauCeti.GaloisSymbol.adicSymbol_reduce [compatibility]: Reducing h_F mod ℓ^ν gives h_{F,ℓ^ν}.
API TauCeti.GaloisSymbol.adicSymbol_divisible [relation]: h_F vanishes on the ℓ-divisible subgroup
of K_2(F) (Tate (3.5)(a)).
API TauCeti.GaloisSymbol.adicSymbol_res [functoriality]: Natural for field extensions.
Test GaloisSymbol.test_adic_one [degenerate]: If b ∈ F^× is an ℓ^ν-th power for every ν (b is
ℓ-divisible in F^×), then h_F{a, b} = 0 in H²(F, ℤ_ℓ(2)) for every a ∈ F^×, since every component
h_{F,ℓ^ν}{a, b} = κ(a) ∪ κ(b) vanishes; for F = ℂ, ℓ any prime, h_F is the zero map.
Test GaloisSymbol.test_adic_closed [computation]: For F algebraically closed, H²(F, ℤ_ℓ(2)) = 0, so
h_F = 0.
Test GaloisSymbol.test_adic_reduce [compatibility]: For F = ℚ, ℓ = 2, ν = 1: the reduction of
h_ℚ{−1, −1} is h_{ℚ,2}{−1, −1} ≠ 0.
Test GaloisSymbol.test_adic_not_injective [non-example]: For F a local field, h_F is not injective
on K_2(F): it kills the uncountable divisible summand of Moore's decomposition.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/symbol-norm-compatibility: The Galois symbol commutes with norms
(theorem; unchecked).
Let E/F be a finite extension of fields and m invertible in F. Let N_{E/F} : K_2(E) → K_2(F) be the
Milnor norm (transfer) of K2SymbolsBrauer T.4, which agrees with Quillen's transfer on K₂
(K2SymbolsBrauer T.3/milnor-quillen-transfer-comparison). Then cor_{E/F} ∘ h_{E,m} = h_{F,m} ∘
N_{E/F} : K_2(E)/m → H²(F, μ_m^{⊗2}), where cor is corestriction for E/F separable and, for E/F
purely inseparable of degree p^a, cor is multiplication by p^a after the identification G_E = G_F,
and in general cor_{E/F} = cor_{E_0/F} ∘ cor_{E/E_0} with E_0 the separable closure of F in E. On
symbols with one entry from F this is Tate's Lemma (3.2): cor_{E/F} h_E{a, b} = h_F{a, N_{E/F} b}
for a ∈ F^×, b ∈ E^×.
Hypotheses: E/F finite; m invertible in F.
Direct prerequisites: MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.1/twisted-cohomology-ring, K2SymbolsBrauer:T.4/milnor-projection-formula,
K2SymbolsBrauer:T.4/milnor-transfer-transitivity, K2SymbolsBrauer:T.4/prime-to-p-closure,
K2SymbolsBrauer:T.4/p-closed-generation, K2SymbolsBrauer:T.4/transfer-base-change,
K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/symbol-residue-compatibility: The Galois symbol commutes with residues
(theorem; unchecked).
Let F be a field with a discrete valuation v, residue field k(v) and uniformiser π, and let m be
invertible in k(v). Let ∂^{tame}_v : K_2(F) → k(v)^× be K2SymbolsBrauer's tame symbol homomorphism
(T.3/tame-symbol-hom; with its convention ∂^{tame}_v{u, π} = ū for a v-unit u) and ∂_v : H²(F,
μ_m^{⊗2}) → H¹(k(v), μ_m) the residue of M.1/localization-gysin-sequence. Then ∂_v ∘ h_{F,m} =
−κ_{k(v)} ∘ ∂^{tame}_v mod m, i.e. ∂_v(κ(u) ∪ κ(π)) = −κ_{k(v)}(ū) and ∂_v(κ(u) ∪ κ(w)) = 0 for
v-units u, w.
Hypotheses: (F, v) a discretely valued field; m invertible in the residue field. The residue ∂_v is
that of M.1/localization-gysin-sequence for the Dedekind scheme Spec O_v with its closed point.
Direct prerequisites: MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.1/localization-gysin-sequence, K2SymbolsBrauer:T.3/tame-symbol-hom,
K2SymbolsBrauer:T.2/matsumoto
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-local: Tate's theorem for local fields (theorem; unchecked).
Let F be a locally compact non-discrete field (a finite extension of ℚ_p or of 𝔽_p((t)), or ℝ, or ℂ)
and ℓ ≠ char F a prime. (a) h_{F,ℓ} : K_2(F)/ℓ → H²(F, μ_ℓ^{⊗2}) is bijective (Tate, Corollary to
(4.5)). (b) For every r ≥ 1, h_{F,ℓ^r} : K_2(F)/ℓ^r → H²(F, μ_{ℓ^r}^{⊗2}) is bijective. When μ_ℓ ⊂
F, Tate reads h_{F,ℓ} through H²(F, μ_ℓ^{⊗2}) ≅ μ_ℓ ⊗ Br(F)[ℓ] as z ⊗ (a, b), (a, b) the class of
the cyclic algebra A_z(a, b), with the appropriate sign convention (Tate (4.2)); that normalised
comparison, with the Hilbert symbol and the local invariant, is K2SymbolsBrauer T.7's and is not
restated here.
Hypotheses: F locally compact non-discrete; ℓ ≠ char F prime. For F = ℝ only ℓ = 2 gives nonzero
groups; for F = ℂ both sides vanish.
Direct prerequisites: MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.3/tate-injectivity-criterion, MotivicEtaleKTheory:M.3/tate-adic-comparison,
MotivicEtaleKTheory:M.1/etale-kummer-sequences,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-global: Tate's theorem for global fields (theorem; unchecked).
Let F be a number field and ℓ a prime. (a) h_{F,ℓ} : K_2(F)/ℓ → H²(F, μ_ℓ^{⊗2}) is bijective (Tate
(5.1)). (b) K_2(F) is a torsion group with no nonzero divisible subgroup, and the adic symbol h_F of
adic-galois-symbol induces an isomorphism from the ℓ-primary part K_2(F){ℓ} onto the torsion
subgroup of H²(F, ℤ_ℓ(2)) (Tate (5.4)). (c) For every r ≥ 1, h_{F,ℓ^r} : K_2(F)/ℓ^r → H²(F,
μ_{ℓ^r}^{⊗2}) is bijective, also for ℓ = 2 when F has real places. Tate proves (a) and (b) for every
global field and ℓ ≠ char F; the case of global function fields is a recorded gap of this packet,
because ClassFieldTheory's global layers and K2SymbolsBrauer T.5 are stated for number fields only.
Hypotheses: F a number field; ℓ any prime.
Direct prerequisites: MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.3/adic-galois-symbol, MotivicEtaleKTheory:M.3/tate-local,
MotivicEtaleKTheory:M.3/tate-injectivity-criterion, MotivicEtaleKTheory:M.3/tate-adic-comparison,
MotivicEtaleKTheory:M.1/etale-kummer-sequences,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence,
K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence,
ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-torsion-symbols: Torsion in K₂ of a global field is generated by
root-of-unity symbols (theorem; unchecked).
Let F be a number field and ℓ a prime, E = F(μ_ℓ) and Δ = Gal(E/F). The top row (μ_ℓ ⊗ E^×)^Δ --γ-->
K_2F --ℓ--> K_2F → K_2F/ℓK_2F → 0 of Tate's diagram (3.3) (tate-adic-comparison (a)) is exact; that
is, the image of γ is the ℓ-torsion (K_2F)_ℓ (Tate (6.1)). In particular, if F contains a primitive
ℓ-th root of unity z, every element of order ℓ in K_2F is of the form {z, a} with a ∈ F^×. The
kernel of γ is tate-gamma-kernel (Tate (6.3)).
Hypotheses: F a number field; ℓ prime. Tate proves the statement for every global field and ℓ ≠ char
F; the function-field case belongs to the gap recorded for tate-global.
Direct prerequisites: MotivicEtaleKTheory:M.3/tate-global,
MotivicEtaleKTheory:M.3/tate-adic-comparison, MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.3/adic-galois-symbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-s-integer: Tate's theorem for rings of S-integers (theorem;
unchecked).
Let F be a number field, ℓ a prime, S a finite set of places of F containing the archimedean places
and all places above ℓ (so 1/ℓ ∈ O_S), O_S = O_{F,S} and r ≥ 1. (a) H²_cont(O_S, ℤ_ℓ(2)) is finite,
and the map H²_cont(O_S, ℤ_ℓ(2)) → H²(F, ℤ_ℓ(2)) induced by Spec F → Spec O_S (inflation along G_F →
G_{F,S}) is injective, with image the torsion classes whose residues at all v ∉ S vanish. (b) Tate's
adic symbol h_F (adic-galois-symbol) maps K_2(O_S) ⊆ K_2(F) (K2SymbolsBrauer T.5) into that image,
and the resulting S-integer Galois symbol h_{O_S} : K_2(O_S) ⊗ ℤ_ℓ → H²_cont(O_S, ℤ_ℓ(2)) is an
isomorphism. (c) Its reduction h_{O_S,ℓ^r} : K_2(O_S)/ℓ^r → H²_cont(O_S, ℤ_ℓ(2))/ℓ^r → H²_et(O_S,
μ_{ℓ^r}^{⊗2}) is an isomorphism; this includes ℓ = 2 when F has real places. (d) h_{O_S} and
h_{O_S,ℓ^r} are natural for S ⊆ T, agree with h_F and h_{F,ℓ^r} after restriction to Spec F, and are
compatible with the residues at the places outside S. This ring statement is a separate declaration
from the field statement tate-global.
Hypotheses: F a number field; ℓ prime; S ⊇ S_∞ ∪ {v | ℓ} finite; r ≥ 1.; The places above ℓ must lie
in S (ℓ invertible on O_S): μ_{ℓ^r}^{⊗2} is a locally constant étale sheaf of invertible order on
Spec O_S only then, and K-book VI.8.6 quotes Tate's theorem under 1/m ∈ O_S.; No restriction at ℓ =
2: the real places enter only through H³_cont(O_S, ℤ_2(2)), which vanishes.
Direct prerequisites: MotivicEtaleKTheory:M.3/tate-global,
MotivicEtaleKTheory:M.3/adic-galois-symbol, MotivicEtaleKTheory:M.3/symbol-residue-compatibility,
MotivicEtaleKTheory:M.3/tate-gamma-kernel, MotivicEtaleKTheory:M.1/localization-gysin-sequence,
MotivicEtaleKTheory:M.1/s-integer-galois-comparison, MotivicEtaleKTheory:M.1/etale-twist-sheaf,
MotivicEtaleKTheory:M.2/adic-s-integer-cohomology,
MotivicEtaleKTheory:M.2/high-degree-real-isomorphism,
ArithmeticGaloisDuality:R02.1/continuous-section-long-exact,
ArithmeticGaloisDuality:R02.1/rationalization,
ArithmeticGaloisDuality:R02.4/global-euler-characteristic,
K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence,
ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-picard-sequence: K₂ of S-integers modulo ℓ and the Picard group
(theorem; unchecked).
Let F be a number field containing μ_ℓ (ℓ prime), S a finite set of places of F containing the
archimedean places and the places above ℓ, O_S the ring of S-integers and S_c ⊆ S the set of complex
places. There is a natural exact sequence 0 → μ_ℓ ⊗ Pic(O_S) → K_2(O_S)/ℓK_2(O_S) --h_ℓ^S-->
(⊕_{v∈S∖S_c} μ_ℓ)_0 → 0, where (⊕ μ_ℓ)_0 is the subgroup of elements (z_v) with Σ_v z_v = 0 (μ_ℓ
written additively) and h_ℓ^S, Tate's map induced by the ℓ-th power norm residue symbols at v ∈ S ∖
S_c, is the composite K_2(O_S)/ℓ → K_2(F)/ℓ --h_{F,ℓ}--> H²(F, μ_ℓ^{⊗2}) ≅ μ_ℓ ⊗ Br(F)[ℓ] →
⊕_{v∈S∖S_c} μ_ℓ ⊗ Br(F_v)[ℓ] ≅ ⊕_{v∈S∖S_c} μ_ℓ, the last map by the local invariants (Tate (6.2)).
Real places occur in S ∖ S_c only for ℓ = 2.
Hypotheses: F a number field with μ_ℓ ⊂ F; S ⊇ S_∞ ∪ {v | ℓ} finite. Tate states (6.2) for global
fields, with S finite and nonempty in the function-field case; that case belongs to the gap recorded
for tate-global.
Direct prerequisites: MotivicEtaleKTheory:M.3/tate-global,
MotivicEtaleKTheory:M.3/tate-torsion-symbols, MotivicEtaleKTheory:M.3/symbol-residue-compatibility,
MotivicEtaleKTheory:M.1/etale-kummer-sequences,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants,
K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/algebraic-simplex: The algebraic simplices and the cubes (construction;
unchecked).
For a base scheme B and n ≥ 0, the algebraic n-simplex is Δ^n_B = Spec_B O_B[t_0, …, t_n]/(t_0 + ⋯ +
t_n − 1) ≅ 𝔸^n_B. An order-preserving map g : [m] → [n] gives the affine map Δ(g) : Δ^m_B → Δ^n_B
with Δ(g)^*(t_j) = Σ_{i ∈ g^{−1}(j)} t_i, making Δ^•_B a cosimplicial B-scheme; the coface ∂_i :
Δ^{n−1} → Δ^n has ∂_i^*(t_j) = t_j for j < i, 0 for j = i, t_{j−1} for j > i (its image is the face
t_i = 0), and the codegeneracy s_i : Δ^n → Δ^{n−1} has s_i^*(t_j) = t_j for j < i, t_i + t_{i+1} for
j = i, t_{j+1} for j > i. A face of Δ^n is a closed subscheme t_{i_1} = ⋯ = t_{i_r} = 0 with r ≤ n;
the intersection of all n + 1 hyperplanes t_i = 0 is empty. The algebraic n-cube is □^n_B = (ℙ^1_B ∖
{1})^n with coordinates y_1, …, y_n; its codimension-one faces are y_i = 0 and y_i = ∞, its faces
are their intersections, and its degeneracies are the coordinate projections □^n → □^{n−1}
forgetting one coordinate. The isomorphism 𝔸^1 ≅ ℙ^1 ∖ {1}, x ↦ 1 − 1/x, sends 0 ↦ ∞ and 1 ↦ 0, so
□^n_B ≅ 𝔸^n_B, carrying Totaro's faces y_i ∈ {∞, 0} to the faces x_i ∈ {0, 1} of the cube (𝔸^1)^n
used by Levine.
Hypotheses: B a scheme (in applications a field or a Dedekind scheme).
Direct prerequisites: mathlib:AlgebraicGeometry.AffineSpace
Proposed namespace: TauCeti.HigherChow
API TauCeti.HigherChow.simplex [constructor]: Δ^n_B as a B-scheme, functorial in B.
API TauCeti.HigherChow.coface [data]: The coface closed immersions ∂_i : Δ^{n−1}_B → Δ^n_B.
API TauCeti.HigherChow.codegeneracy [data]: The codegeneracy maps s_i : Δ^n_B → Δ^{n−1}_B.
API TauCeti.HigherChow.cosimplicial_identities [relation]: ∂_j ∂_i = ∂_i ∂_{j−1} for i < j, and the
remaining cosimplicial identities.
API TauCeti.HigherChow.simplex_iso_affine [equivalence]: Δ^n_B ≅ 𝔸^n_B over B.
API TauCeti.HigherChow.cube [constructor]: □^n_B = (ℙ¹_B ∖ {1})^n with faces δ^ε_i, ε ∈ {0, ∞}.
API TauCeti.HigherChow.face_regular [characterisation]: Every face of Δ^n_B (resp. □^n_B) of
codimension r is cut out by a regular sequence of length r.
API TauCeti.HigherChow.simplexMap [functoriality]: For an order-preserving g : [m] → [n], the affine
map Δ(g) : Δ^m_B → Δ^n_B with Δ(g)^*(t_j) = Σ_{i ∈ g^{−1}(j)} t_i; Δ(id) = id and Δ(g ∘ h) = Δ(g) ∘
Δ(h).
API TauCeti.HigherChow.cubeFace [data]: The face closed immersions δ^ε_i : □^{n−1}_B → □^n_B (insert
ε ∈ {0, ∞} as the i-th coordinate) and the degeneracies □^n_B → □^{n−1}_B forgetting the i-th
coordinate, satisfying the cubical identities.
API TauCeti.HigherChow.cube_iso_affine [equivalence]: □^n_B ≅ 𝔸^n_B over B by x ↦ 1 − 1/x in each
coordinate, carrying the faces y_i = ∞ and y_i = 0 to x_i = 0 and x_i = 1.
Test HigherChow.test_simplex_zero [degenerate]: Δ^0_B ≅ B.
Test HigherChow.test_simplex_one [computation]: Δ^1_k ≅ 𝔸^1_k with exactly two codimension-one
faces, the k-points t_0 = 0 and t_1 = 0.
Test HigherChow.test_base_change [compatibility]: Δ^n_{B'} ≅ Δ^n_B ×_B B' for every B' → B.
Test HigherChow.test_faces_not_coordinate_hyperplanes [non-example]: Δ^n_B is not 𝔸^{n+1}_B with its
coordinate hyperplanes: in Δ^n_B the n + 1 faces t_i = 0 have empty common intersection (t_0 + ⋯ +
t_n = 1), whereas in 𝔸^{n+1}_B the coordinate hyperplanes meet in the origin; so Δ^n has exactly
2^{n+1} − 1 nonempty faces (3 for n = 1).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/admissible-cycles: Cycles meeting the faces properly (definition;
unchecked).
Let X be an equidimensional scheme of finite type over a field (or, in dimension-indexed form,
essentially of finite type over a Dedekind scheme B) and q, n ≥ 0. Then z^q(X, n) is the free
abelian group on the integral closed subschemes Z ⊂ X × Δ^n of codimension q such that for every
face F ⊂ Δ^n, every irreducible component of Z ∩ (X × F) has codimension ≥ q in X × F. In the
dimension indexing, for r ∈ ℤ (r may be negative: CH^1(Spec k, 1) = CH_{−1}(Spec k, 1)), z_r(X, n)
is generated by the integral Z ⊂ X × Δ^n of dimension r + n such that every irreducible component of
Z ∩ (X × F) has dimension ≤ r + dim F; it needs no equidimensionality. Over a Dedekind scheme B, for
X of finite type over B, the dimension of an integral B-scheme V is Geisser's: the Krull dimension
if V lies in a closed fibre, and the dimension of the generic fibre plus one if V is flat over B;
for X essentially of finite type and equidimensional over B (local and semilocal schemes) the
codimension-indexed groups z^q(X, n) are used, as in Geisser §3. Cycles are elements of Mathlib's
AlgebraicCycle (locally finite functions on points) with finite support.
Hypotheses: X equidimensional of finite type over a field k for the codimension-indexed groups; X of
finite type over a field or over a Dedekind scheme B for the dimension-indexed groups; X essentially
of finite type and equidimensional over B for the codimension-indexed groups over B.
Direct prerequisites: MotivicEtaleKTheory:M.4/algebraic-simplex,
mathlib:AlgebraicGeometry.AlgebraicCycle
Proposed namespace: TauCeti.HigherChow
API TauCeti.HigherChow.cycles [constructor]: z^q(X, n) as a subgroup of AlgebraicCycle(X × Δ^n, ℤ).
API TauCeti.HigherChow.mem_cycles_iff [characterisation]: A cycle lies in z^q(X, n) iff each
component has codimension q and meets every face properly.
API TauCeti.HigherChow.face_restrict [data]: Intersection with the i-th face, z^q(X, n) → z^q(X, n −
1).
API TauCeti.HigherChow.cyclesDim [constructor]: The dimension-indexed groups z_r(X, n), r ∈ ℤ, over
a field or (with Geisser's dimension) over a Dedekind base.
API TauCeti.HigherChow.cycles_eq_cyclesDim [compatibility]: For X equidimensional of dimension d
over a field, z^q(X, n) = z_{d−q}(X, n).
Test HigherChow.test_cycles_zero_n [degenerate]: z^q(X, 0) is the group of codimension-q cycles of
X.
Test HigherChow.test_point [computation]: z^1(Spec k, 1) is generated by the closed points of Δ^1_k
≅ 𝔸^1_k other than the two vertices.
Test HigherChow.test_algebraic_cycle [compatibility]: z^q(X, 0) agrees with the codimension-q part
of Mathlib's AlgebraicCycle X ℤ with finite support.
Test HigherChow.test_vertex_not_admissible [non-example]: The vertex t_0 = 0 of Δ^1_k is a
codimension-one cycle on Δ^1_k that does not meet the face t_0 = 0 properly, so it is not in
z^1(Spec k, 1).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/cycle-complex: Bloch's cycle complex and higher Chow groups
(construction; unchecked).
For X as in admissible-cycles and q ≥ 0, the groups z^q(X, n), n ≥ 0, with face maps the
intersections with the faces ∂_i and degeneracy maps the flat pullbacks along the codegeneracies
s_i, form a simplicial abelian group z^q(X, •); its associated chain complex has differential d =
Σ_i (−1)^i ∂_i^*. Bloch's higher Chow groups are CH^q(X, n) = H_n(z^q(X, •)). The cycle complex of
sheaves is Z(q)_X = z^q(−, •)[−2q] on the small Zariski (or étale) site of X, a cohomologically
graded complex with z^q(−, 2q − i) in degree i; for X over a field, motivic cohomology is defined as
H^{p}(X, Z(q)) := CH^q(X, 2q − p), the cohomology of the global sections Z(q)_X(X); zariski-descent
identifies it with the Zariski hypercohomology of Z(q)_X. Over a Dedekind base the Zariski
hypercohomology is the definition (dedekind-cycle-complex), since global sections compute it only
over a semilocal base. For an abelian group A, Z(q) ⊗ A and H^{p}(X, A(q)) are defined by tensoring
the free complex. The definition does not refer to K-theory.
Hypotheses: X equidimensional, of finite type over a field (or over a Dedekind scheme for the
dimension-indexed version); q ≥ 0.
Direct prerequisites: MotivicEtaleKTheory:M.4/admissible-cycles,
MotivicEtaleKTheory:M.4/algebraic-simplex
Proposed namespace: TauCeti.HigherChow
API TauCeti.HigherChow.complex [constructor]: z^q(X, •) as a simplicial abelian group and its chain
complex.
API TauCeti.HigherChow.CH [constructor]: CH^q(X, n) = H_n(z^q(X, •)).
API TauCeti.HigherChow.motivicComplex [constructor]: Z(q)_X = z^q(−, •)[−2q] as a complex of Zariski
(and étale) sheaves on X.
API TauCeti.HigherChow.H [constructor]: H^{p}(X, A(q)) for an abelian group A, with H^{p}(X, Z(q)) =
CH^q(X, 2q − p).
API TauCeti.HigherChow.d_sq [relation]: d ∘ d = 0 with d = Σ (−1)^i ∂_i^*.
API TauCeti.HigherChow.CH_neg [simp]: CH^q(X, n) = 0 for n < 0, and H^{p}(X, Z(q)) = 0 for p > 2q.
API TauCeti.HigherChow.coefficient_long_exact [relation]: For 0 → A' → A → A'' → 0 there is a long
exact sequence … → H^{p}(X, A'(q)) → H^{p}(X, A(q)) → H^{p}(X, A''(q)) → H^{p+1}(X, A'(q)) → …; in
particular the Bockstein triangle Z(q) --m--> Z(q) → Z/m(q).
API TauCeti.HigherChow.H_mod_m [relation]: 0 → H^{p}(X, Z(q))/m → H^{p}(X, Z/m(q)) → H^{p+1}(X,
Z(q))[m] → 0 is exact.
Test HigherChow.test_CH_zero [compatibility]: CH^q(X, 0) is the Chow group CH^q(X) of
SchemeAndStackFoundations SF.5.
Test HigherChow.test_q_zero [degenerate]: For X = Spec k: CH^0(Spec k, 0) = ℤ and CH^0(Spec k, n) =
0 for n > 0.
Test HigherChow.test_field_weight_one [computation]: CH^1(Spec k, 1) ≅ k^×, the class of a
k-rational point (t_0, t_1) of Δ^1_k with t_0 t_1 ≠ 0 going to −t_0/t_1 (a closed point with residue
field E goes to N_{E/k} of this value). The sign is forced: the line α t_0 + β t_1 + γ t_2 = 0 in
Δ^2_k (αβγ ≠ 0, so it misses the vertices) has faces on t_0 = 0, t_1 = 0, t_2 = 0 with values γ/β,
γ/α, β/α, (value 1 when the line is parallel to that edge), and (γ/β)(γ/α)^{−1}(β/α) = 1, whereas
the unsigned ratio t_0/t_1 gives −1.
Test HigherChow.test_not_naive_cycles [non-example]: Requiring proper intersection only with the
codimension-one faces does not give a simplicial abelian group: the line t_1 = t_2 in Δ^2_k meets
each edge t_i = 0 in at most one point, so it meets every codimension-one face properly, but it
passes through the vertex (1, 0, 0), and its face on t_1 = 0 is a vertex of Δ^1, which is not in
z^1(Spec k, 1); so this line is not in z^1(Spec k, 2).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/cubical-cycle-complex: The cubical cycle complex (construction;
unchecked).
For X as in admissible-cycles and q ≥ 0, let c^q(X, n) be the free abelian group on integral closed
Z ⊂ X × □^n of codimension q meeting all faces of □^n properly, and let z^q_□(X, n) = c^q(X,
n)/(degenerate cycles), the degenerate cycles being pullbacks along the coordinate projections □^n →
□^{n−1}. With d = Σ_{i=1}^{n} (−1)^{i} (∂^∞_i − ∂^0_i), z^q_□(X, •) is a chain complex; the cubical
higher Chow groups are its homology. The ∞-normalised subcomplex z^q_{□,N}(X, •), generated in
degree n by the cycles Z with ∂^0_i Z = 0 for 1 ≤ i ≤ n and ∂^∞_i Z = 0 for 2 ≤ i ≤ n (on which d
restricts to −∂^∞_1), includes quasi-isomorphically into z^q_□(X, •) for X of finite type over a
field (Park 2021, Theorem 2.2.1, after Bloch). For X, Y over a field k there is an external product
z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X ×_k Y, n + m) given by the product of cycles under □^n × □^m
= □^{n+m}; it is not defined over a Dedekind base, where the product of two cycles in the same
closed fibre does not meet the faces properly.
Hypotheses: X as in admissible-cycles; q ≥ 0; for the external product and the normalisation, X and
Y of finite type over a field.
Direct prerequisites: MotivicEtaleKTheory:M.4/algebraic-simplex,
MotivicEtaleKTheory:M.4/admissible-cycles
Proposed namespace: TauCeti.HigherChow
API TauCeti.HigherChow.cubeCycles [constructor]: z^q_□(X, n), admissible cubical cycles modulo
degenerate ones.
API TauCeti.HigherChow.cube_d_sq [relation]: d ∘ d = 0 for d = Σ (−1)^i (∂^∞_i − ∂^0_i).
API TauCeti.HigherChow.cubeProduct [constructor]: For X, Y over a field k, the external product
z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X ×_k Y, n + m), Z ⊗ W ↦ Z × W under □^n × □^m = □^{n+m}.
API TauCeti.HigherChow.cube_leibniz [relation]: d(x × y) = dx × y + (−1)^n x × dy.
API TauCeti.HigherChow.milnorCycle [constructor]: For a_i ∈ F^× ∖ {1}, the point (a_1, …, a_n) ∈
□^n_F as a cycle in z^n_□(F, n).
API TauCeti.HigherChow.cubeFaceMap [data]: ∂^ε_i : z^q_□(X, n) → z^q_□(X, n − 1), intersection with
the face y_i = ε (ε ∈ {0, ∞}, 1 ≤ i ≤ n), with d = Σ_i (−1)^i (∂^∞_i − ∂^0_i).
API TauCeti.HigherChow.cubeNormalized_quasiIso [equivalence]: For X of finite type over a field, the
inclusion of the ∞-normalised subcomplex z^q_{□,N}(X, •) (cycles with ∂^0_i = 0 for all i and ∂^∞_i
= 0 for i ≥ 2) into z^q_□(X, •) is a quasi-isomorphism.
API TauCeti.HigherChow.cubeMap [functoriality]: Flat pullback and proper pushforward (dimension
indexing) of cycles act on z_□ as maps of complexes, functorially, preserving degenerate cycles.
Test HigherChow.test_cube_zero [degenerate]: z^q_□(X, 0) = z^q(X, 0).
Test HigherChow.test_cube_point [computation]: For a ∈ F^× ∖ {1}, the point a ∈ □^1_F is a cycle
with d = 0 (it avoids 0 and ∞).
Test HigherChow.test_cube_vs_simplex [compatibility]: The cubical and simplicial complexes have
isomorphic homology (simplicial-cubical-comparison).
Test HigherChow.test_degenerate_killed [non-example]: For X = Spec k and q = 0, the group of
admissible cycles in degree n is ℤ·[□^n] with d[□^n] = Σ_i (−1)^i([□^{n−1}] − [□^{n−1}]) = 0, so
before quotienting by degenerate cycles the homology is ℤ in every degree n ≥ 0; [□^n] is degenerate
for n ≥ 1 (the pullback of [□^{n−1}] along a coordinate projection), and the quotient complex has
homology ℤ in degree 0 and 0 in degrees n > 0, matching CH^0(Spec k, n).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/simplicial-cubical-comparison: Simplicial and cubical higher Chow
groups agree (theorem; unchecked).
Let X be an equidimensional scheme, separated and of finite type over a field k, and s a finite set
of closed subsets of X (s = {X} for the plain complexes). Let Tot be the total complex of Levine's
double complex z^q_s(X, m, n) of cycles on X × □^m × Δ^n meeting S × (every face) properly for S ∈
s, normalised as in Levine §4 (intersections with all faces vanish except with the last cubical face
y_m = ∞ and the simplicial face t_0 = 0), with the cubical differential (intersection with y_m = ∞)
in m and the simplicial differential (intersection with t_0 = 0) in n. The two augmentations ε′ :
Tot → z^q_{□,s}(X, •) and ε″ : Tot → z^q_s(X, •) are quasi-isomorphisms, so z^q_{□,s}(X, •) and
z^q_s(X, •) are naturally isomorphic in the derived category and H_n(z^q(X, •)) ≅ H_n(z^q_□(X, •))
for all q, n. The isomorphism is natural for flat pullback and proper pushforward, and it carries
Bloch's simplicial external product to the cubical one (Totaro §1).
Hypotheses: X equidimensional, separated and of finite type over a field k; s a finite set of closed
subsets of X.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/cubical-cycle-complex, MotivicEtaleKTheory:M.4/homotopy-invariance,
MotivicEtaleKTheory:M.4/functoriality
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/functoriality: Flat pullback and proper pushforward of higher Chow
groups (theorem; unchecked).
Let f : Y → X be a morphism of schemes of finite type over a field. (a) If X and Y are
equidimensional and f is flat of relative dimension d, pullback of cycles f^* : z^q(X, •) → z^q(Y,
•) (the cycle of the scheme-theoretic inverse image, multiplied out on X × Δ^n) is a map of
simplicial abelian groups, inducing f^* on CH^q(−, n). (b) If f is proper, pushforward of cycles f_*
: z_r(Y, •) → z_r(X, •), r ∈ ℤ, given termwise by Mathlib's pushforward of cycles with dimension
weights (the coefficient of f(V) is [k(V) : k(f(V))] if dim f(V) = dim V and 0 otherwise), is a map
of complexes inducing f_* on CH_r(−, n); for X, Y equidimensional of dimensions d_X, d_Y it reads
CH^q(Y, n) → CH^{q + d_X − d_Y}(X, n). (c) Pullback and pushforward are functorial, satisfy base
change g^* f_* = f′_* g′^* for a cartesian square with g flat and f proper, and in degree n = 0 are
SF.5's flat pullback and proper pushforward on Chow groups. (d) The same holds over a Dedekind
scheme B: flat pullback for flat morphisms of equidimensional schemes essentially of finite type
over B (codimension indexing), and proper pushforward for proper morphisms of schemes of finite type
over B in Geisser's dimension indexing.
Hypotheses: Morphisms of schemes of finite type over a field (or over a Dedekind scheme for (d));
for (a) flat of relative dimension d between equidimensional schemes; for (b) proper.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
mathlib:AlgebraicGeometry.AlgebraicCycle.map, SchemeAndStackFoundations:SF.5
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/homotopy-invariance: Homotopy invariance and the translation moving
lemma (theorem; unchecked).
Let X be an equidimensional scheme, separated and of finite type over a field k, s a finite set of
closed subsets of X, and p : X × 𝔸^m → X the projection. (a) Flat pullback p^* : z^q_s(X, •) →
z^q_{p^{−1}s}(X × 𝔸^m, •) is a quasi-isomorphism, where z^q_s denotes the subcomplex of cycles
meeting S × F properly for every S ∈ s and every face F; for s = {X} this gives p^* : CH^q(X, n) ≅
CH^q(X × 𝔸^m, n) for all q, n (Bloch). (b) The same holds for the cubical complexes z^q_{□,s}
(Levine). (c) (Translation moving lemma.) For closed subsets H_1, …, H_r of 𝔸^m_k, the inclusion of
the subcomplex of z^q_{p^{−1}s}(X × 𝔸^m, •) (resp. of the cubical complex) consisting of cycles that
also meet every X × H_j × F properly is a quasi-isomorphism. No smoothness or quasi-projectivity of
X is needed.
Hypotheses: X equidimensional, separated and of finite type over a field k; s a finite set of closed
subsets of X; H_j closed in 𝔸^m_k.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/cubical-cycle-complex, MotivicEtaleKTheory:M.4/functoriality
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/moving-lemma: Bloch's moving lemma for cycle complexes (theorem;
unchecked).
(a) Let X be smooth and quasi-projective over a field and 𝒲 a finite set of locally closed subsets
of X. Let z^q_𝒲(X, •) ⊂ z^q(X, •) be the subcomplex of cycles Z such that every component of Z ∩ (W
× F) has codimension ≥ q in W × F for every W ∈ 𝒲 and every face F. Then the inclusion z^q_𝒲(X, •) ⊂
z^q(X, •) is a quasi-isomorphism (Bloch). (b) Let X be smooth and affine over a field k and w : W →
X a morphism with W locally equidimensional (for example the support of a finite correspondence into
X). The subcomplex z^q(X, •)_w of cycles T such that every component of w^{−1}(T) has codimension ≥
q in W × Δ^n and meets every W × F properly includes quasi-isomorphically into z^q(X, •) (Levine;
MVW Proposition 17.6 and its proof). (c) Let S = Spec D for a Dedekind domain D of mixed
characteristic, X smooth and affine over S, and F a finite set of closed immersions Z_i → X with
each Z_i smooth over S. Then the inclusion of the subcomplex of cycles in good position with respect
to the Z_i into the normalised chain complex of z^q(X, •) is a quasi-isomorphism (Levine; Spitzweck
Theorem 5.8).
Hypotheses: (a) X smooth quasi-projective over a field, 𝒲 finite; (b) X smooth affine over a field,
w : W → X with W locally equidimensional; (c) X smooth affine over the spectrum of a Dedekind domain
of mixed characteristic, finitely many smooth closed subschemes.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex, MotivicEtaleKTheory:M.4/functoriality
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/localization-sequence: Bloch's localization theorem (theorem;
unchecked).
Let X be an equidimensional scheme, separated and of finite type over a field k, Z ⊂ X a closed
subscheme of pure codimension c, and j : U = X ∖ Z → X. Then j^* : z^q(X, •) → z^q(U, •) has kernel
i_* z^{q−c}(Z, •) and acyclic cokernel, so z^{q−c}(Z, •) --i_*--> z^q(X, •) --j^*--> z^q(U, •)
extends to a distinguished triangle in the derived category of abelian groups and gives the long
exact sequence … → CH^{q−c}(Z, n) → CH^q(X, n) → CH^q(U, n) → CH^{q−c}(Z, n − 1) → … → CH^q(U, 0) →
0, natural for flat pullback and proper pushforward of such triples. Without equidimensionality, in
the dimension indexing (r ∈ ℤ): … → CH_r(Z, n) → CH_r(X, n) → CH_r(U, n) → CH_r(Z, n − 1) → … . The
same holds for X essentially of finite type over the spectrum of a discrete valuation ring (Levine;
Geisser Theorem 3.2). Over a Dedekind scheme B and X essentially of finite type over B, it holds as
a distinguished triangle of Zariski sheaves i_* Z(q − c)_Z[−2c] → Z(q)_X → j_* Z(q)_U on X (Geisser
Corollary 3.3(a)), hence as a long exact sequence of Zariski hypercohomology … → H^{p−2c}(Z, Z(q −
c)) → H^p(X, Z(q)) → H^p(U, Z(q)) → H^{p−2c+1}(Z, Z(q − c)) → … .
Hypotheses: X equidimensional, separated and of finite type over a field (dimension indexing: of
finite type, not necessarily equidimensional), or essentially of finite type over a discrete
valuation ring; over a Dedekind scheme only the sheaf-level triangle and the hypercohomology
sequence; Z closed of pure codimension c.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/cubical-cycle-complex,
MotivicEtaleKTheory:M.4/simplicial-cubical-comparison, MotivicEtaleKTheory:M.4/functoriality
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/products: Products and pullback for smooth schemes (construction;
unchecked).
For X, Y equidimensional, separated and of finite type over a field k, the external product of
cubical cycles z^p_□(X, •) ⊗ z^r_□(Y, •) → z^{p+r}_□(X ×_k Y, •), transported through
simplicial-cubical-comparison (equivalently Bloch's product via a triangulation of Δ^n × Δ^m), gives
a map in the derived category inducing CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n + m). For X
smooth and quasi-projective over k, pullback along the diagonal (defined by the moving lemma) gives
the cup product, making ⊕_{p,n} CH^p(X, n) a bigraded ring, graded-commutative in n and associative
and unital; for any morphism f : Y → X of smooth quasi-projective k-schemes there is a pullback f^*
: CH^q(X, n) → CH^q(Y, n), functorial, agreeing with flat pullback when f is flat, and
multiplicative. Equivalently ⊕_{p,q} H^{p}(X, Z(q)) is a bigraded ring with H^{p}(X, Z(q)) ·
H^{p'}(X, Z(q')) ⊂ H^{p+p'}(X, Z(q+q')).
Hypotheses: X, Y equidimensional of finite type over a field; for the cup product and general
pullback, smooth and quasi-projective.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/cubical-cycle-complex,
MotivicEtaleKTheory:M.4/simplicial-cubical-comparison, MotivicEtaleKTheory:M.4/moving-lemma,
MotivicEtaleKTheory:M.4/functoriality
Proposed namespace: TauCeti.HigherChow
API TauCeti.HigherChow.extProduct [constructor]: CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n + m).
API TauCeti.HigherChow.cup [constructor]: The cup product on ⊕ CH^p(X, n) for X smooth.
API TauCeti.HigherChow.pullback [functoriality]: f^* for f : Y → X between smooth quasi-projective
k-schemes, with (g ∘ f)^* = f^* ∘ g^* and id^* = id.
API TauCeti.HigherChow.pullback_flat [compatibility]: f^* agrees with flat pullback when f is flat.
API TauCeti.HigherChow.cup_comm [relation]: x · y = (−1)^{nm} y · x for x ∈ CH^p(X, n), y ∈ CH^r(X,
m).
API TauCeti.HigherChow.projection_formula [relation]: f_*(f^*x · y) = x · f_*y for f proper between
smooth schemes.
Test HigherChow.test_unit [degenerate]: The class [X] ∈ CH^0(X, 0) is the unit of the ring.
Test HigherChow.test_symbol_product [computation]: For a, b ∈ F^× ∖ {1}, a · b ∈ CH^2(F, 2) is the
class of the point (a, b) ∈ □^2_F.
Test HigherChow.test_degree_zero [compatibility]: On CH^*(X, 0) the cup product is SF.5's
intersection product for X smooth.
Test HigherChow.test_sign [non-example]: For a ∈ F^×, a · a = a · (−1) in CH^2(F, 2), which is
generally nonzero (e.g. F = ℝ, a = −1), so the product is graded-commutative but not alternating.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/chow-degree-zero: Higher Chow groups in degree zero are Chow groups
(theorem; unchecked).
For X equidimensional of finite type over a field, CH^q(X, 0) = z^q(X, 0)/d(z^q(X, 1)) is
canonically the Chow group CH^q(X) of SchemeAndStackFoundations SF.5 (codimension-q cycles modulo
rational equivalence), compatibly with flat pullback, with proper pushforward (in the dimension
indexing) and, for X smooth and quasi-projective, with the cup product of products, which in degree
zero is SF.5's intersection product.
Hypotheses: X equidimensional of finite type over a field.; For the product compatibility, X smooth
and quasi-projective over the field.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.4/products, SchemeAndStackFoundations:SF.5
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/weight-zero-and-one: Motivic cohomology in weights zero and one
(theorem; unchecked).
Let X be smooth over a field k. (a) Z(0)_X ≃ ℤ, so H^{p}(X, Z(0)) = H^{p}_Zar(X, ℤ), which is
ℤ^{π_0(X)} for p = 0 and 0 for p ≠ 0. (b) There is a quasi-isomorphism Z(1)_X ≃ O_X^×[−1] of Zariski
complexes; hence H^{1}(X, Z(1)) ≅ O(X)^×, H^{2}(X, Z(1)) ≅ Pic(X) (Tau Ceti's line-bundle classes),
and H^{p}(X, Z(1)) = 0 for p ∉ {1, 2}. For X = Spec F: H^{1}(F, Z(1)) = F^× and H^{p}(F, Z(1)) = 0
for p ≠ 1.
Hypotheses: X smooth over a field k (essentially smooth allowed for local rings and fields).
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/chow-degree-zero, tauceti:TauCeti.AlgebraicGeometry.LineBundleClass,
MotivicEtaleKTheory:M.4/zariski-descent
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/vanishing-above-weight: Vanishing above the weight for fields, and
above weight plus dimension (theorem; unchecked).
Let A be an abelian group. (a) For a field F and integers q ≥ 0 and p > q, H^{p}(F, A(q)) = 0; in
particular H^{p}(F, Z(q)) = CH^q(F, 2q − p) = 0 for p > q, and H^{p}(F, ℚ(q)) = 0 for p > q. (b)
More generally, for X equidimensional of dimension d and of finite type over a field, H^{p}(X, A(q))
= 0 for p > q + d and for p > 2q. The local statement (the cohomology sheaves of Z(q) vanish in
degrees above q on schemes essentially smooth over a field or a Dedekind scheme) is not part of this
node: it is dedekind-gersten (c), Geisser's Corollary 4.4, whose proof uses (a) together with
nesterenko-suslin-totaro.
Hypotheses: (a) F a field, q ≥ 0, A an abelian group.; (b) X equidimensional of dimension d and of
finite type over a field.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/admissible-cycles
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro: Milnor K-theory is motivic cohomology on the
diagonal (theorem; unchecked).
For every field F and n ≥ 0 there is a natural isomorphism φ_n : K^M_n(F) ≅ CH^n(F, n) = H^{n}(F,
Z(n)), where K^M_*(F) is Milnor K-theory (K2SymbolsBrauer T.2/milnor-k-theory). On symbols, φ_n{a_1,
…, a_n} is the class of the point (a_1, …, a_n) ∈ □^n_F for a_i ≠ 1 (cubical model); φ = ⊕ φ_n is a
ring isomorphism K^M_*(F) ≅ ⊕_n H^{n}(F, Z(n)); φ commutes with norms (Milnor norm N_{E/F} on the
left, proper pushforward on the right) and is natural for field extensions E/F (restriction on the
left, flat pullback along Spec E → Spec F on the right). For a discrete valuation ring R with
fraction field F, residue field k and valuation v, φ intertwines the higher residue ∂_v of
K2SymbolsBrauer T.3 (∂_v{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}) with the boundary δ_R : H^{n}(F,
Z(n)) → H^{n−1}(k, Z(n − 1)) of the localization sequence of Spec R: δ_R ∘ φ_n = ε_n · φ_{n−1} ∘ ∂_v
with an explicit sign ε_n = ±1 fixed by the cubical boundary convention. Consequently H^{n}(F,
Z/m(n)) ≅ K^M_n(F)/m for every m.
Hypotheses: F any field, of any characteristic and not necessarily perfect; n ≥ 0.; For the residue
compatibility, R a discrete valuation ring with fraction field F.
Direct prerequisites: MotivicEtaleKTheory:M.4/cubical-cycle-complex,
MotivicEtaleKTheory:M.4/products, MotivicEtaleKTheory:M.4/vanishing-above-weight,
MotivicEtaleKTheory:M.4/weight-zero-and-one, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.4/localization-sequence, K2SymbolsBrauer:T.2/milnor-k-theory,
K2SymbolsBrauer:T.4/milnor-transfer-transitivity, K2SymbolsBrauer:T.4/weil-reciprocity,
K2SymbolsBrauer:T.3/higher-milnor-residues, MotivicEtaleKTheory:M.4/simplicial-cubical-comparison,
K2SymbolsBrauer:T.4/restriction-transfer-degree, K2SymbolsBrauer:T.4/valuation-comparison
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/weight-two-symbol-comparison: The weight-two symbol comparison
(theorem; unchecked).
For a field F: (a) H^{2}(F, Z(2)) ≅ K_2(F), the composite of nesterenko-suslin-totaro (n = 2) with
Matsumoto's identification K^M_2(F) = K_2(F) (K2SymbolsBrauer T.2/matsumoto); on symbols {a, b} ↦
the class of the point (a, b) of □^2_F (a, b ≠ 1), and the Steinberg element (a, 1 − a) is the
boundary of Totaro's rational curve in □^3_F; (b) for every m ≥ 1, H^{2}(F, Z/m(2)) ≅ K_2(F)/m, from
the exact coefficient sequence 0 → H^{2}(F, Z(2))/m → H^{2}(F, Z/m(2)) → H^{3}(F, Z(2))[m] = 0; (c)
H^{p}(F, Z(2)) = 0 and H^{p}(F, Z/m(2)) = 0 for p ≥ 3. This is the symbol half of the weight-two
comparison. The Bloch-group half concerns H^{1}(F, Z(2)): K3BlochGroups
V.2/indecomposable-motivic-edge-equivalence identifies it with K_3^ind(F) through the motivic
spectral sequence, and K3BlochGroups V.4 (Suslin's exact sequence) compares that group with the
Bloch group; those nodes depend on M.4, so M.4 does not import them. The identification of (b),
composed with the motivic-to-étale map, with M.3's Galois symbol is M.5c/galois-symbol-all-degrees
in degree two.
Hypotheses: F a field.
Direct prerequisites: MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro,
MotivicEtaleKTheory:M.4/vanishing-above-weight, MotivicEtaleKTheory:M.4/cycle-complex,
K2SymbolsBrauer:T.2/matsumoto
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/projective-bundle-formula: The projective bundle formula for higher
Chow groups (theorem; unchecked).
Let X be smooth quasi-projective over a field, E a vector bundle of rank r + 1 on X, π : ℙ(E) → X
its projectivisation and ξ = c_1(O(1)) ∈ CH^1(ℙ(E), 0). Then ⊕_{i=0}^{r} CH^{q−i}(X, n) → CH^q(ℙ(E),
n), (x_i) ↦ Σ_i π^*(x_i) · ξ^i, is an isomorphism for all q, n; the classes ξ^i are the universal
classes used for Chern classes in M.8.
Hypotheses: X smooth quasi-projective over a field; E locally free of rank r + 1.
Direct prerequisites: MotivicEtaleKTheory:M.4/localization-sequence,
MotivicEtaleKTheory:M.4/homotopy-invariance, MotivicEtaleKTheory:M.4/products,
MotivicEtaleKTheory:M.4/zariski-descent, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.4/weight-zero-and-one
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/purity-gysin-triangle: Purity for cycle complexes with supports
(theorem; unchecked).
Let X be as in localization-sequence: equidimensional of finite type over a field, or
equidimensional and essentially of finite type over a Dedekind scheme B (dedekind-cycle-complex).
Let i : Z → X be a closed subscheme of pure codimension c with open complement j : U → X. Then there
is a distinguished triangle of complexes of Zariski sheaves on X, i_* Z(q − c)_Z[−2c] → Z(q)_X →
Rj_* Z(q)_U → i_* Z(q − c)_Z[−2c + 1], equivalently a purity isomorphism Ri^! Z(q)_X ≅ Z(q −
c)_Z[−2c]. Hence motivic cohomology with supports is H^{p}_Z(X, Z(q)) ≅ H^{p−2c}(Z, Z(q − c)) =
CH^{q−c}(Z, 2q − p), with shift 2c and twist c, and there is a long exact Gysin sequence ⋯ →
H^{p−2c}(Z, Z(q − c)) → H^{p}(X, Z(q)) → H^{p}(U, Z(q)) → H^{p−2c+1}(Z, Z(q − c)) → ⋯, natural for
flat pullback of pairs. No smoothness of Z is needed for the cycle complex; when X and Z are smooth
over a field it is the Gysin triangle of a smooth pair, and over B it applies in particular to a
fibre X_b over a closed point b (c = 1), where Z is smooth over k(b) but not over B.
Hypotheses: X equidimensional of finite type over a field, or equidimensional and essentially of
finite type over a Dedekind scheme B.; Z ⊂ X closed of pure codimension c; U = X ∖ Z.
Direct prerequisites: MotivicEtaleKTheory:M.4/localization-sequence,
MotivicEtaleKTheory:M.4/cycle-complex, MotivicEtaleKTheory:M.4/zariski-descent,
MotivicEtaleKTheory:M.4/dedekind-cycle-complex
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/dedekind-cycle-complex: Cycle complexes over a Dedekind base
(construction; unchecked).
Let B be the spectrum of a Dedekind ring (for example O_{F,S}) and X an equidimensional scheme
essentially of finite type over B (essentially smooth over B for the Gersten, vanishing and
comparison theorems). For n ≥ 0 let z^n(X, •) be the simplicial group of integral closed subschemes
of X × Δ^• of codimension n meeting all faces properly (admissible-cycles over B), and Z(n)_X the
cohomological complex of presheaves U ↦ z^n(U, 2n − •) on the small Zariski site; its terms are
sheaves for the Zariski and for the étale topology (Geisser, Lemma 3.1), and Z(n)_et denotes the
same complex on the small étale site. For an abelian group A, A(n) = Z(n) ⊗ A. Motivic cohomology is
Zariski hypercohomology, H^{p}(X, A(n)) = H^{p}_Zar(X, A(n)); étale motivic cohomology is
H^{p}_et(X, A(n)). Dimensions of integral B-schemes follow Geisser's convention (Krull dimension
inside a closed fibre, Krull dimension of the generic fibre plus one for B-flat ones), so that on
equidimensional X codimension and dimension indexing agree. When B is local (a field or a discrete
valuation ring) H^{p}(X, Z(n)) is the homology H_{2n−p}(z^n(X, •)) of the global complex (Geisser,
Theorem 3.2(b)); for general B, H^{p}(X, Z(n)) = H^{p}_Zar(B, p_* Z(n)) (Corollary 3.3(b)). This is
the construction used for S-integers; theorems stated only for smooth varieties over a field are not
applied to Spec O_F.
Hypotheses: B the spectrum of a Dedekind ring; X equidimensional and essentially of finite type over
B.; Essential smoothness of X over B is assumed only where a theorem requires it (dedekind-gersten).
Direct prerequisites: MotivicEtaleKTheory:M.4/admissible-cycles,
MotivicEtaleKTheory:M.4/cycle-complex, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.4/localization-sequence, MotivicEtaleKTheory:M.4/zariski-descent
Proposed namespace: TauCeti.HigherChow
API TauCeti.HigherChow.dedekindComplex [constructor]: Z(n)_X for X essentially of finite type over a
Dedekind scheme.
API TauCeti.HigherChow.dedekind_H [constructor]: H^{p}(X, A(n)) as Zariski hypercohomology.
API TauCeti.HigherChow.dedekind_restrict_field [compatibility]: For X with generic fibre X_F, colim
over nonempty opens V ⊂ B of z^n(X_V, •) is z^n(X_F, •), the cycle complex of cycle-complex over the
field F; hence H^{p}(X_F, Z(n)) = colim_V H^{p}(X_V, Z(n)).
API TauCeti.HigherChow.dedekind_flat_pullback [functoriality]: Flat pullback Z(n)_X → f_*Z(n)_Y.
API TauCeti.HigherChow.dedekind_etale [constructor]: The étale version Z(n)_et, the same complex on
the small étale site (its terms are étale sheaves), and the change-of-topology map H^{p}(X, Z(n)) →
H^{p}_et(X, Z(n)).
API TauCeti.HigherChow.dedekind_H_eq_homology_of_local [characterisation]: For B the spectrum of a
discrete valuation ring, H^{p}(X, Z(n)) ≅ H_{2n−p}(z^n(X, •)) (Geisser Theorem 3.2(b)); for general
B, H^{p}(X, Z(n)) ≅ H^{p}_Zar(B, p_* Z(n)).
Test HigherChow.test_dedekind_weight_zero [degenerate]: Z(0)_X ≃ ℤ for X connected and essentially
smooth over B.
Test HigherChow.test_dedekind_units [computation]: H^{1}(Spec ℤ[1/2], Z(1)) ≅ ℤ[1/2]^× ≅ {±1} × 2^ℤ
and H^{2}(Spec ℤ[1/2], Z(1)) ≅ Pic(ℤ[1/2]) = 0.
Test HigherChow.test_dedekind_generic [compatibility]: For X = Spec ℤ[1/2] and n = 1, colim over
nonempty opens V ⊂ Spec ℤ[1/2] of H^{1}(V, Z(1)) is ℚ^× = H^{1}(Spec ℚ, Z(1)), the field cycle
complex of cycle-complex.
Test HigherChow.test_not_codimension [non-example]: Krull dimension is not the right dimension
function: for X = 𝔸^1_{ℤ_(p)} (dimension 2) the integral closed subscheme V(pt − 1) ≅ Spec ℚ has
codimension 1 in X but Krull dimension 0, the same as the closed points of the special fibre, which
have codimension 2. With Geisser's convention (Krull dimension of the generic fibre plus one for
B-flat integral schemes) it has dimension 1 = dim X − codim, so a definition indexed by Krull
dimension would misplace this cycle.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/dedekind-gersten: Coniveau, Gersten complexes and vanishing over a
field or a Dedekind base (theorem; unchecked).
Let B be the spectrum of a Dedekind ring or of a field and X equidimensional and essentially smooth
over B. (a) Coniveau: for X local, filtering z^n(X, •) by the codimension in X of the projection of
supports gives a spectral sequence E_1^{s,t} = ⊕_{x∈X^{(s)}} H^{2n−s+t}(k(x), Z(n − s)) ⇒
H^{2n+s+t}(X, Z(n)), whose rows are the Gersten complexes. (b) If X is the local ring at a point x
of an essentially smooth B-scheme, lying over b ∈ B, the Gersten complex 0 → H^{t}(X, Z(n)) →
⊕_{y∈X^{(0)}} H^{t}(k(y), Z(n)) → ⊕_{y∈X^{(1)}} H^{t−1}(k(y), Z(n − 1)) → ⋯ is exact except possibly
at its first two terms. With V the local ring of X at the generic point of the fibre X_b, it is
exact at the first term if H^{t}(V, Z(n)) → H^{t}(k(X), Z(n)) is injective and at the second if
H^{t+1}(V, Z(n)) → H^{t+1}(k(X), Z(n)) is injective. If b is the generic point of B, in particular
if X is essentially smooth over a field, then V = k(X) and the complex is exact. Geisser's Theorem
1.1 (the Gersten resolution of the sheaves H^{t}(Z(n)) on X) assumes this injectivity for every
discrete valuation ring essentially of finite type over B; that hypothesis is not asserted here. (c)
Unconditionally, for X essentially smooth over B the cohomology sheaves vanish above the weight:
H^{i}(Z(n)_X) = 0 for i > n; for X local, H^{p}(X, Z(n)) = 0 for p > n. (d) For X semilocal and
essentially smooth over a field k, H^{p}(X, Z(n)) → H^{p}(k(X), Z(n)) is injective for all p, n.
Hypotheses: B the spectrum of a Dedekind ring or of a field; X equidimensional and essentially
smooth over B.; (a), (b): X local; (d): X semilocal and essentially smooth over a field.; No
injectivity hypothesis for discrete valuation rings is assumed; (b) states exactly what depends on
it.
Direct prerequisites: MotivicEtaleKTheory:M.4/dedekind-cycle-complex,
MotivicEtaleKTheory:M.4/localization-sequence, MotivicEtaleKTheory:M.4/purity-gysin-triangle,
MotivicEtaleKTheory:M.4/moving-lemma, MotivicEtaleKTheory:M.4/homotopy-invariance,
MotivicEtaleKTheory:M.4/functoriality, MotivicEtaleKTheory:M.4/vanishing-above-weight,
MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro,
SchemeKTheoryOperations:S.4/quillen-presentation-lemma, SchemeKTheoryOperations:S.4
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/zariski-descent: Zariski descent for cycle complexes (theorem;
unchecked).
Let X be equidimensional of finite type over a field, or equidimensional and essentially of finite
type over the spectrum of a discrete valuation ring. The presheaf of complexes U ↦ z^q(U, •) on
X_Zar has the Mayer–Vietoris property: for opens U, V the square z^q(U ∪ V, •) → z^q(U, •) ⊕ z^q(V,
•) → z^q(U ∩ V, •) is homotopy cartesian. Hence it satisfies Zariski descent: CH^q(U, n) →
H^{2q−n}_Zar(U, Z(q)) is an isomorphism for every open U ⊂ X. Over a general Dedekind scheme B and X
essentially of finite type over B, p_* Z(q) → Rp_* Z(q) is a quasi-isomorphism on B_Zar, so H^{p}(X,
Z(q)) = H^{p}_Zar(B, p_* Z(q)).
Hypotheses: X equidimensional of finite type over a field, or equidimensional and essentially of
finite type over the spectrum of a discrete valuation ring; for the last sentence, X essentially of
finite type over a Dedekind scheme B.
Direct prerequisites: MotivicEtaleKTheory:M.4/localization-sequence,
SchemeKTheoryOperations:S.4/brown-gersten-vanishing
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/finite-correspondence: Finite correspondences (definition; unchecked).
Let k be a field. For X smooth and connected over k and Y separated of finite type over k, an
elementary correspondence from X to Y is an integral closed subscheme W ⊂ X × Y that is finite and
surjective over X; Cor_k(X, Y) is the free abelian group on elementary correspondences (for
non-connected X, the direct sum over the connected components). For X and Y smooth, W ∈ Cor_k(X, Y)
and W' ∈ Cor_k(Y, Z), the composition W' ∘ W ∈ Cor_k(X, Z) is the pushforward to X × Z of the
intersection product (W × Z) · (X × W') on X × Y × Z, which is defined because the two cycles meet
properly and every component of their intersection is finite and surjective over X (MVW Lemma 1.7,
which needs Y normal; Y smooth suffices). Composition is bilinear and associative, and Cor_k, with
objects the smooth separated k-schemes of finite type, is an additive category containing Sm/k
through the graph functor f ↦ Γ_f, with disjoint union as direct sum; X ⊗ Y = X × Y and W ⊗ W' = [W
× W'] make it a symmetric monoidal category (MVW 1.5, 1.9).
Hypotheses: k a field; X smooth over k and Y separated of finite type over k for Cor_k(X, Y).; For
the composition W' ∘ W, X and Y are smooth over k; Z is smooth in Cor_k, and separated of finite
type for the representable presheaves of non-smooth schemes (MVW Exercise 2.11).
Direct prerequisites: mathlib:AlgebraicGeometry.AlgebraicCycle,
MotivicEtaleKTheory:M.4/functoriality, SchemeAndStackFoundations:SF.5
Proposed namespace: TauCeti.Transfers
API TauCeti.Transfers.Cor [constructor]: Cor_k(X, Y) as a free abelian group on elementary
correspondences.
API TauCeti.Transfers.graph [constructor]: Γ_f ∈ Cor_k(X, Y) for f : X → Y.
API TauCeti.Transfers.comp [constructor]: Composition Cor_k(Y, Z) × Cor_k(X, Y) → Cor_k(X, Z).
API TauCeti.Transfers.comp_assoc [relation]: Composition is associative and bilinear.
API TauCeti.Transfers.graph_comp [simp]: Γ_g ∘ Γ_f = Γ_{g∘f} and Γ_id = id.
API TauCeti.Transfers.transpose_finite [other]: For f : Y → X finite and surjective with X smooth
and Y smooth and connected, the transpose Γ_f^t ⊂ X × Y is an elementary correspondence in Cor_k(X,
Y), and Γ_f ∘ Γ_f^t = deg(f) · id_X in Cor_k(X, X) when X is connected (MVW 1.11, Example 2.7).
API TauCeti.Transfers.tensor [structure]: X ⊗ Y = X × Y and W ⊗ W' = [W × W'] make Cor_k an additive
symmetric monoidal category with unit Spec k, and Γ_f ⊗ Γ_g = Γ_{f×g} (MVW 1.9).
API TauCeti.Transfers.baseChange [functoriality]: For a field extension k ⊂ F, X ↦ X_F extends to an
additive symmetric monoidal functor Cor_k → Cor_F compatible with graphs; for F/k finite separable
and U smooth over F, Cor_F(U, X_F) = Cor_k(U, X) (MVW Exercise 1.12), and Cor_F(X_F, Y_F) is the
colimit of Cor_E(X_E, Y_E) over the subextensions E of finite type (MVW Exercise 1.13).
Test Transfers.test_point_source [computation]: Cor_k(Spec k, 𝔸^1_k) is the free abelian group on
closed points of 𝔸^1_k.
Test Transfers.test_empty [degenerate]: Cor_k(∅, Y) = 0 and Cor_k(X, ∅) = 0 for X nonempty.
Test Transfers.test_galois_group_ring [compatibility]: For L/k finite Galois with group G,
Cor_k(Spec L, Spec L) ≅ ℤ[G] as rings.
Test Transfers.test_not_all_cycles [non-example]: The diagonal of 𝔸^1 × 𝔸^1 is a correspondence from
𝔸^1 to 𝔸^1, but the line {0} × 𝔸^1 is not (it is not finite over the first factor).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/presheaf-with-transfers: Presheaves and Nisnevich sheaves with
transfers (definition; unchecked).
Let k be a field, Sm/k the category of smooth separated k-schemes of finite type and R a commutative
ring. A presheaf with transfers over k (with coefficients in R) is an additive contravariant functor
F : Cor_k → R-mod; its restriction along the graph functor Sm/k → Cor_k is a presheaf on Sm/k. The
representable presheaf is ℤ_tr(X) = Cor_k(−, X) and R_tr(X) = ℤ_tr(X) ⊗ R; by Yoneda Hom(R_tr(X), F)
≅ F(X), and R_tr(X) is projective. A Nisnevich (respectively étale) sheaf with transfers is a
presheaf with transfers whose underlying presheaf is a sheaf for the Nisnevich (respectively étale)
topology on Sm/k; the Nisnevich covering families are the families of étale maps {U_i → X} such that
every point x ∈ X has a preimage with the same residue field, and a presheaf is a Nisnevich sheaf if
and only if it takes every elementary (upper) distinguished square to a pullback square (MVW Lemma
12.7). ℤ_tr(X) is an étale, hence Nisnevich, sheaf for every scheme X of finite type (MVW 6.2), and
the Nisnevich (respectively étale) sheafification of a presheaf with transfers carries a unique
structure of presheaf with transfers making F → F_Nis a map of presheaves with transfers (MVW 13.1,
6.17). Sh_Nis(Cor_k, R) and Sh_et(Cor_k, R) are Grothendieck abelian categories, with enough
injectives, and for X smooth, Ext^n(R_tr(X), F) ≅ H^n_Nis(X, F) (respectively H^n_et(X, F)) (MVW
13.4, 6.24). For an étale or Nisnevich covering U → X the Čech complex … → R_tr(U ×_X U) → R_tr(U) →
R_tr(X) → 0 is exact as a complex of étale and of Nisnevich sheaves, and for a Zariski covering the
finite Čech complex of the cover is (MVW 6.12, 6.14).
Hypotheses: k a field; Sm/k the smooth separated schemes of finite type over k; R a commutative ring
(R = ℤ unless stated).
Direct prerequisites: MotivicEtaleKTheory:M.5a/finite-correspondence,
mathlib:AlgebraicGeometry.Scheme.smallGrothendieckTopology,
SchemeKTheoryOperations:S.4/nisnevich-site, mathlib:CategoryTheory.IsGrothendieckAbelian,
mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives
Proposed namespace: TauCeti.Transfers
API TauCeti.Transfers.PST [constructor]: The abelian category of presheaves with transfers.
API TauCeti.Transfers.ztr [constructor]: ℤ_tr(X) = Cor_k(−, X), with the Yoneda isomorphism
Hom(ℤ_tr(X), F) ≅ F(X).
API TauCeti.Transfers.nisnevichTopology [constructor]: The Nisnevich topology on Sm/k, with the
covering families of SchemeKTheoryOperations S.4/nisnevich-site; a presheaf is a sheaf if and only
if it sends elementary distinguished squares to pullback squares (MVW 12.7).
API TauCeti.Transfers.NST [constructor]: Nisnevich sheaves with transfers, Sh_Nis(Cor_k).
API TauCeti.Transfers.sheafify_transfers [universal-property]: The Nisnevich sheafification of F ∈
PST has a unique transfer structure making F → F_Nis a map in PST.
API TauCeti.Transfers.ztr_sheaf [characterisation]: ℤ_tr(X) is an étale sheaf, hence a Nisnevich
sheaf.
API TauCeti.Transfers.NST_abelian [instance]: Sh_Nis(Cor_k, R) is a Grothendieck abelian category
(hence has enough injectives), and the inclusion into presheaves with transfers has the exact left
adjoint F ↦ F_Nis (MVW 13.1).
API TauCeti.Transfers.EST [constructor]: Étale sheaves with transfers Sh_et(Cor_k, R): a
Grothendieck abelian category with exact sheafification F ↦ F_et carrying unique transfers (MVW
6.17–6.19); every Nisnevich sheaf with transfers that is an étale sheaf is one.
API TauCeti.Transfers.ext_ztr [characterisation]: For X smooth and F a Nisnevich (respectively
étale) sheaf of R-modules with transfers, Ext^n(R_tr(X), F) ≅ H^n_Nis(X, F) (respectively H^n_et(X,
F)), and the cohomology presheaves H^n(−, F) are presheaves with transfers (MVW 13.4, 6.21, 6.24).
API TauCeti.Transfers.cech_resolution [other]: For an étale or Nisnevich covering U → X the Čech
complex of R_tr(U) resolves R_tr(X) as a complex of étale and of Nisnevich sheaves; for a Zariski
covering {U_1, …, U_n} the finite complex 0 → R_tr(U_1 ∩ ⋯ ∩ U_n) → ⋯ → ⊕ R_tr(U_i) → R_tr(X) → 0 is
exact as Nisnevich sheaves (MVW 6.12, 6.14), but not as Zariski sheaves (MVW 6.13).
API TauCeti.Transfers.nisnevich_excision [other]: For f : Y → X étale between smooth schemes and Z ⊂
X closed with f^{−1}(Z) → Z an isomorphism, ℤ(Y)/ℤ(Y − f^{−1}Z) → ℤ(X)/ℤ(X − Z) is an isomorphism of
Nisnevich sheaves (MVW Exercise 12.20), and likewise R_tr(Y)/R_tr(Y − f^{−1}Z) → R_tr(X)/R_tr(X − Z)
(a correspondence from a henselian local scheme meeting Z lifts uniquely along f), as used in MVW
13.19 and 15.15.
Test Transfers.test_ztr_point [computation]: ℤ_tr(Spec k)(X) = ℤ^{π_0(X)}.
Test Transfers.test_zero_presheaf [degenerate]: The zero presheaf is a Nisnevich sheaf with
transfers.
Test Transfers.test_units [compatibility]: O^× with transfers given by norms agrees with G_m on
Sm/k.
Test Transfers.test_nisnevich_not_etale [non-example]: For k = ℚ and l = 2, the Nisnevich sheaf with
transfers O^×/2 (the sheaf associated with U ↦ O^×(U)/O^×(U)^2, equal to O^× ⊗_Nis ℤ/2) has value
ℚ^×/ℚ^{×2} ≠ 0 at Spec ℚ, while its étale sheafification is 0 (MVW Exercise 12.9, Example 13.2):
Nisnevich sheaves with transfers are not étale sheaves with transfers.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes: The Suslin complex and the
motivic complexes ℤ(q) (construction; unchecked).
For a presheaf F on Sm/k, C_•F is the simplicial presheaf U ↦ F(U × Δ^•) and C_*F its chain complex;
if F has transfers, so does C_*F, and the homology presheaves of C_*F are homotopy invariant (MVW
2.14, 2.19). For q ≥ 0 the motivic complex is ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q], a bounded-above cochain
complex of presheaves with transfers, zero in degrees > q (ℤ_tr(𝔾_m^{∧q}) the direct summand of
ℤ_tr(𝔾_m^{×q}) complementary to the images of the coordinate inclusions, 𝔾_m pointed at 1; MVW 2.12,
2.13); A(q) = ℤ(q) ⊗ A for an abelian group A. Motivic cohomology is H^{p,q}(X, A) = H^{p}_Zar(X,
A(q)) for X smooth, contravariant in X and covariant in the base field (MVW 3.4, 3.7), and unchanged
by finite separable extension of the base field (MVW 3.8). There are quasi-isomorphisms ℤ(0) ≃ ℤ and
ℤ(1) ≃ O^×[−1] of complexes of presheaves with transfers (MVW 4.1), homotopy-associative products
ℤ(q) ⊗ ℤ(q') → ℤ(q + q') of complexes of presheaves (MVW 3.11) factoring through ℤ(q) ⊗_tr ℤ(q')
(MVW 10.4), and for every field F, H^{n,n}(Spec F, ℤ) ≅ K^M_n(F) (MVW 5.1).
Hypotheses: k a field; q ≥ 0; A an abelian group; X smooth over k (motivic cohomology of fields F is
taken over the prime field, or any subfield over which F is essentially smooth).
Direct prerequisites: MotivicEtaleKTheory:M.5a/presheaf-with-transfers,
MotivicEtaleKTheory:M.4/algebraic-simplex, MotivicEtaleKTheory:M.5a/finite-correspondence,
MotivicEtaleKTheory:M.5a/tensor-product-transfers, K2SymbolsBrauer:T.2/milnor-k-theory,
K2SymbolsBrauer:T.4/milnor-transfer-transitivity, K2SymbolsBrauer:T.4/weil-reciprocity,
tauceti:TauCeti.AlgebraicGeometry.LineBundleClass
Proposed namespace: TauCeti.Transfers
API TauCeti.Transfers.suslinComplex [constructor]: C_*F for a presheaf (with transfers) F.
API TauCeti.Transfers.motivicComplex [constructor]: ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q] and A(q) = ℤ(q) ⊗
A.
API TauCeti.Transfers.motivicCohomology [constructor]: H^{p,q}(X, A) = H^{p}_Zar(X, A(q)).
API TauCeti.Transfers.motivicComplex_zero [equivalence]: ℤ(0) ≃ ℤ.
API TauCeti.Transfers.motivicComplex_one [equivalence]: ℤ(1) ≃ O^×[−1] (MVW 4.1).
API TauCeti.Transfers.mul [constructor]: Products ℤ(q) ⊗ ℤ(q') → ℤ(q + q') of complexes of
presheaves, homotopy associative (MVW 3.11), factoring through ℤ(q) ⊗_tr ℤ(q') (MVW 10.4); they
induce associative pairings H^{p,q}(X, ℤ) ⊗ H^{p',q'}(X, ℤ) → H^{p+p',q+q'}(X, ℤ) (MVW 3.12). Their
graded commutativity (MVW 15.9) rests on the triviality of the symmetric group action on ℤ(n) over a
perfect field, MotivesAndAlgebraicCycles MC.4/symmetric-group-acts-trivially-on-tate-twists.
API TauCeti.Transfers.diagonal_milnor [equivalence]: H^{n,n}(Spec F, ℤ) ≅ K^M_n(F), sending {a_1, …,
a_n} to the product of the classes of a_i (MVW 5.1).
API TauCeti.Transfers.motivicCohomology_baseChange [functoriality]: For a field extension k ⊂ F
there is a natural map H^{p,q}(X, A) → H^{p,q}(X_F, A), and for F/k finite separable and U smooth
over F the motivic complexes of U over k and over F agree (MVW 3.7, 3.8).
Test Transfers.test_weight_zero [degenerate]: H^{0,0}(X, ℤ) = ℤ^{π_0(X)} and H^{p,0} = 0 for p ≠ 0.
Test Transfers.test_weight_one_field [computation]: H^{1,1}(Spec F, ℤ) ≅ F^×.
Test Transfers.test_vs_cycle_complex [compatibility]: For X smooth over a perfect field, H^{p,q}(X,
ℤ) ≅ H^{p}(X, Z(q)) of M.4 (MVW 19.1; the comparison is MotivesAndAlgebraicCycles MC.4's).
Test Transfers.test_negative_vanish [non-example]: H^{p,q}(Spec F, ℤ) = 0 for p > q (ℤ(q) vanishes
in degrees > q and Spec F has Zariski cohomological dimension 0), and the smash product matters:
with the unreduced complex C_*ℤ_tr(𝔾_m)[−1] in place of ℤ(1), the first cohomology at Spec F would
be ℤ ⊕ F^× (MVW 4.4, 7.3) instead of H^{1,1}(Spec F, ℤ) = F^×.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves: Voevodsky's theorem on homotopy invariant
presheaves with transfers (theorem; unchecked).
Let k be a perfect field and F a homotopy invariant presheaf with transfers (F(X) ≅ F(X × 𝔸^1) for X
smooth). Then each presheaf H^{n}_Nis(−, F_Nis), n ≥ 0, is homotopy invariant (MVW Theorem 13.8; its
proof is completed in MVW 24.1, the case n = 0 in 22.3), and it is a presheaf with transfers (MVW
13.4). Consequences over a perfect field: for a homotopy invariant Nisnevich sheaf with transfers F
and X smooth, H^n_Zar(X, F) ≅ H^n_Nis(X, F) (MVW 13.9); for a bounded above complex C of Nisnevich
sheaves with transfers with homotopy invariant cohomology sheaves, H^n_Zar(X, C) ≅ H^n_Nis(X, C)
(MVW 13.10); if F is a presheaf with transfers with F_Nis = 0, then (C_*F)_Nis ≃ 0 and (C_*F)_Zar ≃
0 (MVW 13.12); and a map of bounded above complexes of presheaves with transfers that is a
quasi-isomorphism on all henselian local schemes induces a quasi-isomorphism of Tot C_* on all local
schemes (MVW 13.14). Over any field k: if F is a homotopy invariant presheaf with transfers with
F(Spec E) = 0 for every field E over k, then F_Zar = 0 (MVW 11.2), and a map A → B of complexes of
presheaves with transfers with homotopy invariant cohomology presheaves which is a quasi-isomorphism
on every field over k is a Zariski quasi-isomorphism (MVW 13.7).
Hypotheses: k perfect for MVW 13.8–13.14; MVW 11.2 and 13.7 hold over any field.; F a homotopy
invariant presheaf with transfers on Sm/k; complexes are bounded above.
Direct prerequisites: MotivicEtaleKTheory:M.5a/presheaf-with-transfers,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/effective-motives: The triangulated category of effective motives
(construction; unchecked).
For a field k and a commutative ring R, let D^− = D^−(Sh_Nis(Cor_k, R)) be the derived category of
cohomologically bounded above complexes and E_A ⊂ D^− the smallest thick subcategory containing the
cones of R_tr(X × 𝔸^1) → R_tr(X) for all smooth X and closed under the direct sums that exist in
D^−. The A¹-weak equivalences W_A are the morphisms with cone in E_A, and DM^{eff,−}_Nis(k, R) =
D^−[W_A^{−1}] is the Verdier localisation (MVW Definition 14.1). The motive of X ∈ Sm/k is M(X), the
image of R_tr(X); for every bounded above K the map K → Tot C_*K is an A¹-weak equivalence, so M(X)
≅ C_*R_tr(X) (MVW 14.4). The derived tensor product of tensor-product-transfers descends, making
DM^{eff,−}_Nis(k, R) a tensor triangulated category with unit M(Spec k) = R and M(X) ⊗ M(Y) ≅ M(X ×
Y) (MVW 14.2), and the Tate objects are the images R(q) of the motivic complexes, with R(i) ⊗ R(j) ≅
R(i + j). If k is perfect, a complex is A¹-local exactly when its cohomology sheaves are homotopy
invariant (MVW 14.8), C_* is left adjoint to the inclusion of the A¹-local complexes, which
identifies DM^{eff,−}_Nis(k, R) with them as tensor triangulated categories (MVW 14.11), and motivic
cohomology is representable: H^{n,i}(X, R) ≅ Hom(M(X), R(i)[n]) and more generally H^n_Zar(X, L) ≅
Hom(M(X), L[n]) for L A¹-local (MVW 14.16). Simplicial smooth schemes 𝒳 have motives M(𝒳), the class
of the bounded above complex associated with the simplicial sheaf R_tr(𝒳_•), with reduced versions
for pointed ones. The étale analogue DM^{eff,−}_et(k, R) = D^−(Sh_et(Cor_k, R))[W_A^{−1}] is defined
in the same way (MVW Definition 9.2).
Hypotheses: k a field and R a commutative ring for the definition, the tensor structure and MVW
14.4.; k perfect for the description by A¹-local complexes (MVW 14.8, 14.11) and the
representability of motivic cohomology (MVW 14.16), which rest on homotopy-invariant-sheaves.
Direct prerequisites: MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes, mathlib:DerivedCategory,
mathlib:CategoryTheory.ObjectProperty.trW,
mathlib:CategoryTheory.Triangulated.Localization.pretriangulated,
mathlib:CategoryTheory.Localization.Monoidal.toMonoidalCategory,
MotivicEtaleKTheory:M.5a/presheaf-with-transfers, MotivicEtaleKTheory:M.5a/tensor-product-transfers,
mathlib:DerivedCategory.Minus, mathlib:CategoryTheory.Triangulated.Localization.isTriangulated,
mathlib:CategoryTheory.LocalizedMonoidal, mathlib:CategoryTheory.MorphismProperty.IsMonoidal
Proposed namespace: TauCeti.Transfers
API TauCeti.Transfers.DMeff [constructor]: DM^{eff,−}_Nis(k, R) = D^−(Sh_Nis(Cor_k, R))[W_A^{−1}], a
tensor triangulated category, with the triangulated localisation functor from D^−(Sh_Nis(Cor_k, R)).
API TauCeti.Transfers.motive [constructor]: M(X) for X ∈ Sm/k and M(𝒳) for smooth simplicial
schemes.
API TauCeti.Transfers.motive_tensor [simp]: M(X) ⊗ M(Y) ≅ M(X × Y).
API TauCeti.Transfers.motive_A1 [simp]: M(X × 𝔸^1) ≅ M(X).
API TauCeti.Transfers.hom_motive_tate [characterisation]: For k perfect and X smooth, Hom(M(X),
R(i)[n]) ≅ H^{n,i}(X, R), and Hom(M(X), L[n]) ≅ H^n_Zar(X, L) for L A¹-local (MVW 14.16).
API TauCeti.Transfers.localisation_equiv [equivalence]: For k perfect, the A¹-local complexes are
those with homotopy invariant cohomology sheaves; they form a full tensor triangulated subcategory
equivalent to DM^{eff,−}_Nis(k, R), with C_* as left adjoint of the inclusion (MVW 14.8, 14.11).
API TauCeti.Transfers.motive_suslin [characterisation]: K → Tot C_*K is an A¹-weak equivalence for
every bounded above complex K, so M(X) ≅ C_*R_tr(X) (MVW 14.4).
API TauCeti.Transfers.tate_tensor [relation]: R(i) ⊗ R(j) ≅ R(i + j) in DM^{eff,−}_Nis(k, R),
induced by the product of MVW 10.4, and R(1)[1] ≅ M(𝔾_m^{∧1}) is the reduced motive of (𝔾_m, 1).
API TauCeti.Transfers.rhom [universal-property]: For X smooth over a perfect field, RHom(R_tr(X), −)
is right adjoint to − ⊗ M(X) on D^−(Sh_Nis(Cor_k, R)) and on DM^{eff,−}_Nis(k, R), and preserves
A¹-local complexes (MVW 14.12).
API TauCeti.Transfers.DMeffEt [other]: The étale analogue DM^{eff,−}_et(k, R) = D^−(Sh_et(Cor_k,
R))[W_A^{−1}] (MVW Definition 9.2), with the tensor triangulated sheafification functor
DM^{eff,−}_Nis(k, R) → DM^{eff,−}_et(k, R) (MVW 14.3).
Test Transfers.test_point [degenerate]: M(Spec k) = R is the unit object.
Test Transfers.test_projective_line [computation]: Over a perfect field, Hom(M(ℙ^1), R(1)[2]) ≅
H^{2,1}(ℙ^1, R) ≅ Pic(ℙ^1) ⊗ R ≅ R, while Hom(M(Spec k), R(1)[2]) ≅ H^{2,1}(Spec k, R) = 0.
Test Transfers.test_hom_cycles [compatibility]: Over a perfect field and for X smooth, Hom(M(X),
ℤ(1)[2]) ≅ Pic(X) = CH^1(X), Tau Ceti's group of line-bundle classes (MVW 4.2 and 14.16); the
comparison Hom(M(X), ℤ(q)[p]) ≅ CH^q(X, 2q − p) in all weights is MotivesAndAlgebraicCycles
MC.4/motivic-cohomology-higher-chow.
Test Transfers.test_affine_line [non-example]: M(𝔸^1) → M(Spec k) is an isomorphism, whereas
ℤ_tr(𝔸^1) → ℤ is not an isomorphism in D^−(Sh_Nis(Cor_k)): at the point Spec k it is the degree map
from the zero-cycles of 𝔸^1 to ℤ, whose kernel contains [0] − [1] ≠ 0. A definition omitting the
A¹-localisation fails this test.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/cancellation: Voevodsky's cancellation theorem (theorem; unchecked).
Let k be a perfect field. For all M, N in DM^{eff,−}_Nis(k, ℤ), tensoring with ℤ(1) induces a
bijection Hom(M, N) → Hom(M(1), N(1)) (Voevodsky, Corollary 4.10), and the same argument with R_tr
in place of ℤ_tr gives it in DM^{eff,−}_Nis(k, R) for every commutative ring R. In particular, for X
smooth, H^{p,q}(X, ℤ) ≅ H^{p+1,q+1}(X × 𝔾_m, ℤ)/H^{p+1,q+1}(X, ℤ), the quotient by the split image
of the pullback along the projection. No resolution of singularities is assumed. This is the input
for the full faithfulness of Tate stabilisation, which MotivesAndAlgebraicCycles MC.4 owns.
Hypotheses: k a perfect field; integral coefficients in Voevodsky's Corollary 4.10, and any
commutative ring R by the same argument.
Direct prerequisites: MotivicEtaleKTheory:M.5a/effective-motives,
MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves,
MotivicEtaleKTheory:M.5a/tensor-product-transfers, MotivicEtaleKTheory:M.5a/finite-correspondence
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/cycle-complex-transfers: Transfers on higher Chow groups (theorem;
unchecked).
Let k be a field. Finite correspondences act on higher Chow groups: for W ∈ Cor_k(X, Y) between
smooth separated k-schemes of finite type there is W^* : CH^i(Y, m) → CH^i(X, m). For Y affine it is
induced by the chain map W^*(𝒵) = π_*((W × Δ^m) · (X × 𝒵)) on the subcomplex z^i(Y, •)_W ⊂ z^i(Y, •)
of cycles in good position for W, which is quasi-isomorphic to z^i(Y, •) (Levine's moving lemma, MVW
17.6, 17.10, 17.11); in general it is defined through affine vector bundle torsors given by
Jouanolou's device (MVW 17.17), independently of choices. These maps make CH^i(−, m) a presheaf with
transfers on Sm/k (MVW 17.21), compatible with the graph functor (W = Γ_f gives the Bloch–Levine
pullback f^*, which is flat pullback when f is flat) and, for m = 0, equal to the action of
correspondences on Chow groups of MVW Example 2.5. The comparison of motivic cohomology with higher
Chow groups (MVW 19.1) and its compatibility with these transfers (MVW 19.6, 19.8) belong to
MotivesAndAlgebraicCycles MC.4 (MC.4/suslin-friedlander-into-cycle-complex,
MC.4/motivic-cohomology-higher-chow), which imports this node.
Hypotheses: k a field (no perfectness or resolution of singularities is needed); X, Y smooth
separated of finite type over k; the moving lemma is applied with Y affine.
Direct prerequisites: MotivicEtaleKTheory:M.5a/finite-correspondence,
MotivicEtaleKTheory:M.4/cycle-complex, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.4/moving-lemma, MotivicEtaleKTheory:M.4/localization-sequence,
MotivicEtaleKTheory:M.5a/presheaf-with-transfers, MotivicEtaleKTheory:M.4/homotopy-invariance,
SchemeAndStackFoundations:SF.5
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/etale-motivic-comparison: Étale motivic cohomology with finite
coefficients and the comparison map (theorem; unchecked).
Let k be a field and n invertible in k. (a) The map μ_n^{⊗q} → ℤ/n(q) of complexes of étale sheaves
with transfers on Sm/k, obtained from the quasi-isomorphism μ_n ≃ ℤ/n(1)_et and the products of the
motivic complexes, is a quasi-isomorphism (MVW Theorem 10.3). Hence H^{p,q}_L(X, ℤ/n) := H^{p}_et(X,
ℤ/n(q)) ≅ H^{p}_et(X, μ_n^{⊗q}) for X smooth, where μ_n^{⊗q} restricts on X_et to the étale twist of
M.1 (MVW Theorem 10.2). (b) Change of topology from the Zariski to the étale site gives a natural
map H^{p,q}(X, ℤ/n) → H^{p}_et(X, ℤ/n(q)) ≅ H^{p}_et(X, μ_n^{⊗q}), multiplicative and a map of
presheaves with transfers in X. In weight one and degree one it is an isomorphism H^{1,1}(X, ℤ/n) ≅
H^{1}_et(X, μ_n) (MVW 4.9), restricting on the subgroup O(X)^×/n to the Kummer map; for X = Spec F
it is the Kummer isomorphism F^×/n ≅ H^1(F, μ_n). This is the motivic-to-étale map of the norm
residue theorem.
Hypotheses: k a field; n invertible in k; X smooth over k.; MVW's proof of 10.3 uses Lemma 9.31,
which assumes cd_n(k) < ∞; the general case is reduced to it in the proof sketch.
Direct prerequisites: MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.1/etale-twist-sheaf, MotivicEtaleKTheory:M.1/etale-kummer-sequences,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison,
MotivicEtaleKTheory:M.5a/presheaf-with-transfers, MotivicEtaleKTheory:M.5a/tensor-product-transfers,
MotivicEtaleKTheory:M.5a/etale-a1-local-complexes
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/imperfect-field-passage: Imperfect fields and filtered colimits
(theorem; unchecked).
(a) Let k ⊂ k' be a purely inseparable algebraic extension of fields of characteristic p > 0, X an
equidimensional scheme of finite type over k and R a commutative ring in which p is invertible. Flat
pullback along X_{k'} → X induces isomorphisms CH^q(X, n) ⊗ R ≅ CH^q(X_{k'}, n) ⊗ R for all q and n.
For fields the same holds for motivic cohomology: if E/F is a purely inseparable extension of fields
of characteristic p, restriction H^{a,b}(Spec F, R) → H^{a,b}(Spec E, R) is an isomorphism. (b)
Filtered colimits: for a field extension k ⊂ F and X smooth over k, H^{*,*}(X_F, A) = colim
H^{*,*}(X_E, A) over the subextensions k ⊂ E ⊂ F of finite type; for a smooth morphism X → S of
smooth k-schemes with S connected and F = k(S), H^{*,*}(X ×_S Spec F, A) = colim H^{*,*}(X ×_S U, A)
over the nonempty open U ⊂ S (MVW 3.9); the cycle complexes satisfy the same colimit formulas along
flat pullback. The statement concerns cycle complexes over any base field and motivic cohomology of
fields; it makes no claim about MVW's motivic complexes of smooth schemes over an imperfect base
field.
Hypotheses: (a) p = char k > 0 invertible in R; X equidimensional of finite type over k; k'/k purely
inseparable algebraic, finite or not; motivic cohomology of fields is taken over the prime field.;
(b) X smooth over k; S a connected smooth k-scheme; A an abelian group.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.5a/finite-correspondence
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/motivic-steenrod-operations: Motivic reduced power operations
(construction; unchecked).
Let k be a perfect field and l a prime different from char k. For every pointed smooth simplicial
scheme (more generally every pointed simplicial sheaf on (Sm/k)_Nis) 𝒳 over k there are natural
operations on reduced motivic cohomology with ℤ/l coefficients: the Bockstein β : H̃^{p,q}(𝒳, ℤ/l) →
H̃^{p+1,q}(𝒳, ℤ/l), the connecting map of 0 → ℤ/l → ℤ/l² → ℤ/l → 0; the reduced powers P^i :
H̃^{p,q} → H̃^{p+2i(l−1), q+i(l−1)}; and the operations B^i : H̃^{p,q} → H̃^{p+2i(l−1)+1, q+i(l−1)}
(i ∈ ℤ). For l = 2 one writes Sq^{2i} = P^i and Sq^{2i+1} = B^i. They come from the total power
operation P_l : H̃^{2d,d}(𝒳) → H̃^{2dl,dl}(𝒳 ∧ (BS_l)_+) and the computation H̃^{*,*}(𝒳 ∧ (BS_l)_+,
ℤ/l) = H̃^{*,*}(𝒳, ℤ/l)[[c, d]]/(c² = τd + ρc) for l = 2, resp. /(c² = 0) for l odd, with c ∈
H^{2l−3,l−1}(BS_l, ℤ/l), d = e(ξ_l/𝒪) ∈ H^{2l−2,l−1}(BS_l, ℤ/l), ρ the class of −1 in H^{1,1}(k,
ℤ/2) = k^×/k^{×2} and τ the generator of H^{0,1}(k, ℤ/2) = μ_2(k): writing P_l(w) = Σ_{i≥0}
(C_{i+1}(w)·c·d^i + D_i(w)·d^i) for w ∈ H̃^{2d,d}, one sets P^i(w) = D_{d−i}(w), B^i(w) =
C_{d−i}(w), and extends P^i, B^i to all bidegrees by the simplicial and 𝔾_m suspension isomorphisms
(RPO §9). Theorem numbers below are those of arXiv v1; the published version shifts the numbering in
§§3, 7 and 9 by one.
Hypotheses: k a perfect field (the published RPO, §1, works over a perfect field; the arXiv v1 proof
of Proposition 3.8 uses that k is perfect); l a prime different from char k.; 𝒳 a pointed smooth
simplicial scheme over k, or a pointed simplicial sheaf on (Sm/k)_Nis, with H̃^{p,q}(𝒳, A) =
Hom_{H_•(k)}(𝒳, K(p, q, A)) in the pointed A¹-homotopy category H_•(k).
Direct prerequisites: MotivicEtaleKTheory:M.5a/effective-motives,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivesAndAlgebraicCycles:MC.4/projective-bundle-theorem
Proposed namespace: TauCeti.MotivicSteenrod
API TauCeti.MotivicSteenrod.bockstein [constructor]: β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳, ℤ/l).
API TauCeti.MotivicSteenrod.reducedPower [constructor]: P^i : H̃^{p,q} → H̃^{p+2i(l−1), q+i(l−1)}.
API TauCeti.MotivicSteenrod.natural [functoriality]: β and P^i commute with pullback along maps of
pointed simplicial schemes.
API TauCeti.MotivicSteenrod.suspension [compatibility]: β and P^i commute with the simplicial and
𝔾_m suspension isomorphisms.
API TauCeti.MotivicSteenrod.BSl_cohomology [characterisation]: H̃^{*,*}(𝒳 ∧ (BS_l)_+, ℤ/l) =
H̃^{*,*}(𝒳, ℤ/l)[[c, d]]/(c² = τd + ρc) for l = 2 and /(c² = 0) for l odd, with c ∈ H^{2l−3,l−1}, d
∈ H^{2l−2,l−1}, β̃(c) = d integrally and c restricting to 0 at the base point (RPO Theorems 6.14,
6.16).
API TauCeti.MotivicSteenrod.etale_realisation [compatibility]: The comparison map H̃^{p,q}(𝒳, ℤ/l) →
H̃^p_et(𝒳, μ_l^{⊗q}) commutes with β when the étale Bockstein is taken for 0 → μ_l^{⊗q} →
μ_{l²}^{⊗q} → μ_l^{⊗q} → 0; for the untwisted étale ℤ/l-Bockstein this needs μ_{l²} ⊂ k (compare RPO
Lemma 6.9).
API TauCeti.MotivicSteenrod.betaPower [constructor]: B^i : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+2i(l−1)+1,
q+i(l−1)}(𝒳, ℤ/l), the c-coefficient of the total power operation; Sq^{2i+1} = B^i for l = 2.
API TauCeti.MotivicSteenrod.totalPower [data]: The total power operation P_l : H̃^{2d,d}(𝒳, ℤ/l) →
H̃^{2dl,dl}(𝒳 ∧ (BS_l)_+, ℤ/l), P_l(w) = Σ_{i≥0}(C_{i+1}(w)·c·d^i + D_i(w)·d^i); its restriction
along a rational point of BS_l is w ↦ w^l (RPO Lemma 5.10).
API TauCeti.MotivicSteenrod.reducedPower_zero [simp]: P^0 = Id, and P^i = B^i = 0 for i < 0.
API TauCeti.MotivicSteenrod.bockstein_tau [simp]: For l = 2 and char k ≠ 2: β(τ) = ρ in H^{1,1}(k,
ℤ/2), and β(ρ) = 0 (ρ lifts to H^{1,1}(k, ℤ) = k^×).
Test MotivicSteenrod.test_P0 [degenerate]: P^0 = Id.
Test MotivicSteenrod.test_square [computation]: For u ∈ H̃^{2n,n}, P^n(u) = u^l (RPO Lemma 9.7).
Test MotivicSteenrod.test_bockstein_P [compatibility]: β P^i = B^i and β B^i = 0 (RPO Lemma 9.5).
Test MotivicSteenrod.test_rho_term [non-example]: For l = 2 the operations are not H^{*,*}(k,
ℤ/2)-linear: Sq^1(τ) = β(τ) = ρ, which is nonzero for k = ℝ (−1 is not a square), whereas τ·Sq^1(1)
= 0; a definition making Sq^i linear over the coefficients of the point fails here.
Test MotivicSteenrod.test_cartan_tau [computation]: Let l = 2, char k ≠ 2, and u ∈ H^{1,1}(Bμ_2,
ℤ/2), v = β(u) ∈ H^{2,1}(Bμ_2, ℤ/2) the generators of RPO Theorem 6.10 (u² = τv + ρu). Then Sq^2(u²)
= τ·v² ≠ 0 in H^{4,3}(Bμ_2, ℤ/2) (Cartan formula with Sq^2u = 0 by instability); the topological
Cartan formula, with coefficient 1 on Sq^1u·Sq^1u, would give v², which lies in the wrong bidegree
(4, 2).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/steenrod-relations: Cartan formula, instability and Adem relations
(theorem; unchecked).
Let k be a perfect field, l a prime different from char k, and β, P^i, B^i the operations of
motivic-steenrod-operations. (a) P^i = B^i = 0 for i < 0 and P^0 = Id. (b) β² = 0, β(uv) = β(u)v +
(−1)^p uβ(v) for u ∈ H̃^{p,*}, βP^i = B^i and βB^i = 0. (c) Cartan formula: for l odd and u ∈
H̃^{p,*}, P^i(uv) = Σ_{r=0}^{i} P^r(u)P^{i−r}(v) and B^i(uv) = Σ_{r=0}^{i} (B^r(u)P^{i−r}(v) +
(−1)^p P^r(u)B^{i−r}(v)); for l = 2, Sq^{2i}(uv) = Σ_{r=0}^{i} Sq^{2r}(u)Sq^{2i−2r}(v) + τ
Σ_{s=0}^{i−1} Sq^{2s+1}(u)Sq^{2i−2s−1}(v) and Sq^{2i+1}(uv) = Σ_{r=0}^{i} (Sq^{2r+1}(u)Sq^{2i−2r}(v)
+ Sq^{2r}(u)Sq^{2i−2r+1}(v)) + ρ Σ_{s=0}^{i−1} Sq^{2s+1}(u)Sq^{2i−2s−1}(v). (d) Instability: P^n(u)
= u^l for u ∈ H̃^{2n,n}, and P^n(u) = 0 for u ∈ H̃^{p,q} with n > p − q and n ≥ q. (e) Adem
relations: for l odd and 0 < a < lb, P^aP^b = Σ_{t=0}^{[a/l]} (−1)^{a+t} C((l−1)(b−t)−1, a−lt)
P^{a+b−t}P^t, with the companion relation for P^aβP^b when 0 < a ≤ lb (RPO Theorem 10.3, whose
printed range is a misprint: MotivicEtaleKTheory/E15), exactly as in topology; for l = 2 and 0 < a <
2b, Sq^aSq^b = Σ_{j=0}^{[a/2]} C(b−1−j, a−2j) Sq^{a+b−j}Sq^j for a, b odd, Sq^aSq^b =
Σ_{j=0}^{[a/2]} τ^{j mod 2} C(b−1−j, a−2j) Sq^{a+b−j}Sq^j for a, b even, and for a + b odd the same
sum plus ρ times a sum of terms Sq^xSq^y with x, y odd and x + y = a + b − 1; for a odd and b even
this correction is ρ Σ_{j odd} C(b−1−j, a−1−2j) Sq^{a+b−j−1}Sq^j (RPO Theorem 10.2, whose printed
odd case is not bidegree-homogeneous: MotivicEtaleKTheory/E10). (f) The motivic Steenrod algebra
A^{*,*}(k, ℤ/l), the algebra of bistable operations generated by the P^i, B^i and multiplication by
H^{*,*}(k, ℤ/l), is a free left H^{*,*}(k, ℤ/l)-module on the admissible monomials
β^{ε_0}P^{s_1}β^{ε_1}⋯P^{s_m}β^{ε_m} with s_i ≥ l·s_{i+1} + ε_i (RPO Lemma 11.1, Corollary 11.5).
For l odd it is the twisted tensor product of the topological mod-l Steenrod algebra (P^i in
bidegree (2i(l−1), i(l−1)), β in (1, 0)) with H^{*,*}(k, ℤ/l) for the action of the operations on
H^{*,*}(k, ℤ/l); for l = 2 it is not of this form even when ρ = 0, because the Adem relations carry
τ (for instance Sq^2Sq^2 = τSq^3Sq^1).
Hypotheses: k a perfect field; l a prime different from char k.
Direct prerequisites: MotivicEtaleKTheory:M.5b/motivic-steenrod-operations
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/milnor-operations: The Milnor operations Q_i (construction;
unchecked).
Let k be a perfect field and l a prime different from char k. The bigraded dual A_{*,*} of the
motivic Steenrod algebra has the left H^{*,*}(k, ℤ/l)-basis of monomials τ(E)ξ(R) = ∏_i τ_i^{ε_i}
∏_j ξ_j^{r_j} (ε_i ∈ {0, 1}, r_j ≥ 0), with τ_i of bidegree (2l^i − 1, l^i − 1) and ξ_j of bidegree
(2l^j − 2, l^j − 1) (RPO §12). The Milnor operation Q_i ∈ A^{2l^i−1, l^i−1}(k, ℤ/l) is the element
of the dual basis dual to τ_i, and q_i ∈ A^{2l^i−2, l^i−1} the element dual to ξ_i (RPO §13). Then:
Q_0 = β (Lemma 13.5); Q_i² = 0 for all i; for l = 2, Q_i = [Q_0, q_i] for i ≥ 1 (Proposition 13.6),
the ℤ/2[ρ]-span of the products Q(E) = ∏Q_i^{ε_i} is the exterior algebra on the Q_i, and the
coproduct is ψ*(Q_i) = 1 ⊗ Q_i + Q_i ⊗ 1 + ρ·Σ c_{E,E'} Q(E) ⊗ Q(E') (Proposition 13.4), so Q_i is a
derivation up to ρ-multiples of products of lower Q_j; for l odd the Q_i have the properties of
Milnor's topological operations: Q_{i+1} = P^{l^i}Q_i − Q_iP^{l^i}, Q_iQ_j = −Q_jQ_i and Q_i(uv) =
Q_i(u)v + (−1)^p uQ_i(v) for u ∈ H̃^{p,*}. For the Thom class t_V of a vector bundle V, q_n(t_V) =
s_{l^n−1}(V)·t_V (RPO Corollary 14.3), where s_{l^n−1} is the characteristic class of Σ_j
t_j^{l^n−1}. For l odd and b = (l^n − 1)/(l − 1): Q_0P^b = Σ_{i=0}^{n} (−1)^i
P^{b−(l^i−1)/(l−1)}Q_i; Voevodsky 2011 Lemma 5.13 prints all signs +, which is the same identity for
the operations (−1)^iQ_i (MotivicEtaleKTheory/E11). For l = 2 the topological recursion Q_{i+1} =
[Sq^{2^{i+1}}, Q_i] fails when ρ ≠ 0: Sq^4Q_1 − Q_1Sq^4 = Q_2 + ρQ_0Q_1Sq^2 (RPO Example 13.7).
Hypotheses: k a perfect field (characteristic 0 wherever the operations are used in this stage); l a
prime different from char k.
Direct prerequisites: MotivicEtaleKTheory:M.5b/steenrod-relations,
MotivicEtaleKTheory:M.5b/motivic-steenrod-operations
Proposed namespace: TauCeti.MotivicSteenrod
API TauCeti.MotivicSteenrod.milnorOp [constructor]: Q_i ∈ A^{2l^i−1, l^i−1}.
API TauCeti.MotivicSteenrod.milnorOp_zero [simp]: Q_0 = β.
API TauCeti.MotivicSteenrod.milnorOp_sq [relation]: Q_i ∘ Q_i = 0.
API TauCeti.MotivicSteenrod.milnorOp_anticomm [relation]: Q_iQ_j = −Q_jQ_i (for l = 2: Q_iQ_j =
Q_jQ_i, the exterior algebra of RPO Proposition 13.4).
API TauCeti.MotivicSteenrod.Q0_Pb [relation]: For l > 2 and b = (l^n − 1)/(l − 1): Q_0P^b =
Σ_{i=0}^{n} (−1)^i P^{b−(l^i−1)/(l−1)}Q_i (Milnor's normalisation of Q_i).
API TauCeti.MotivicSteenrod.milnorOp_dual [characterisation]: ⟨τ(E)ξ(R), Q_i⟩ = 1 if E = e_i and R =
0, and 0 for every other basis monomial of A_{*,*}.
API TauCeti.MotivicSteenrod.milnorOp_succ [relation]: For l = 2 and i ≥ 1, Q_i = Q_0q_i − q_iQ_0;
for l odd, Q_{i+1} = P^{l^i}Q_i − Q_iP^{l^i}.
API TauCeti.MotivicSteenrod.milnorOp_mul [relation]: For l odd, Q_i(uv) = Q_i(u)v + (−1)^p uQ_i(v)
for u ∈ H̃^{p,*}; for l = 2, ψ*(Q_i) = 1 ⊗ Q_i + Q_i ⊗ 1 + ρ·Σ c_{E,E'}Q(E) ⊗ Q(E'), so the same
formula holds when ρ = 0 or when Q_j(u) = 0 for all j < i.
API TauCeti.MotivicSteenrod.dualMilnorOp_thomClass [relation]: q_n(t_V) = s_{l^n−1}(V)·t_V for the
Thom class t_V of a vector bundle V on a smooth quasi-projective scheme.
Test MotivicSteenrod.test_Q0_beta [degenerate]: Q_0 is the Bockstein β.
Test MotivicSteenrod.test_Q_bidegree [computation]: Q_1 has bidegree (2l − 1, l − 1); for l = 2, (3,
1).
Test MotivicSteenrod.test_Q1_formula [compatibility]: For l odd, Q_1 = P^1β − βP^1 (Milnor's
topological formula); for l = 2, Q_1 = Sq^3 + Sq^2Sq^1, which in topology is Milnor's Q_1 = Sq^3 +
Sq^2Sq^1.
Test MotivicSteenrod.test_Q2_not_commutator [non-example]: For l = 2 and k = ℝ (ρ ≠ 0), Sq^4Q_1 −
Q_1Sq^4 = Q_2 + ρQ_0Q_1Sq^2 with ρQ_0Q_1Sq^2 ≠ 0 (A^{*,*} is free over H^{*,*} on the Milnor basis),
so defining Q_2 by the topological recursion [Sq^4, Q_1] gives the wrong operation.
Test MotivicSteenrod.test_Q0_Pb_sign [characterisation]: For l odd and n = 1 (b = 1): Q_0P^1 =
P^1Q_0 − Q_1 with Q_1 = P^1β − βP^1; the all-plus display P^1Q_0 + Q_1 equals 2P^1β − βP^1 ≠ βP^1,
since P^1β and βP^1 are distinct admissible monomials.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/nu-variety: ν_n-varieties and norm varieties (definition; unchecked).
Let k be a field of characteristic 0 and l a prime. (i) For a smooth projective k-variety X of
dimension d ≥ 1, s_d(X) = deg s_d(T_X) ∈ ℤ, where s_d is the characteristic class of the symmetric
polynomial Σ_j t_j^d in the Chern roots; s_d(L) = c_1(L)^d for a line bundle L, s_d is additive on
short exact sequences, and s_d(X) does not change under extension of the base field. For d = 0 one
sets s_0(X) = deg X = dim_k Γ(X, 𝒪_X). (ii) For n ≥ 0, X is a ν_n-variety if dim X = l^n − 1 and
s_{l^n−1}(X) ≢ 0 (mod l²); for n ≥ 1, l divides s_{l^n−1}(X) (degree-theorem (a)). X is a
ν_{≤n}-variety if it is a ν_n-variety and for every i < n there are a ν_i-variety X_i and a morphism
X_i → X (Voevodsky 2011 Definition 6.2). (iii) For a = (a_1, …, a_n) ∈ (k^×)^n, a field F ⊇ k splits
a if {a_1, …, a_n} = 0 in K^M_n(F)/l, and a smooth connected X splits a if k(X) does. A splitting
variety X is l-generic if every field F ⊇ k splitting a has a finite extension E of degree prime to
l with X(E) ≠ ∅. (iv) For n ≥ 2 and {a} ≠ 0 in K^M_n(k)/l, a norm variety for a is a smooth
projective l-generic splitting variety for a of dimension l^{n−1} − 1 (Haesemeyer–Weibel,
introduction). (v) A Rost variety for a is a ν_{≤(n−1)}-variety X splitting a for which H_{−1,−1}(X
× X) --pr_{1∗} − pr_{2∗}--> H_{−1,−1}(X) --N--> H_{−1,−1}(Spec k) = k^× is exact, where H_{−1,−1}(X)
= Hom_DM(ℤ, M(X)(1)[1]) ≅ A_0(X, 𝒦_1) and N is induced by the structure map (Haesemeyer–Weibel
Definition 0.5; the conditions of Voevodsky 2011 Theorem 6.3). Being a norm or Rost variety is a
property proved for particular varieties: an arbitrary smooth projective variety of dimension
l^{n−1} − 1, even a ν_{n−1}-variety, need not split a or be l-generic.
Hypotheses: k a field of characteristic 0 (the range of Voevodsky 2011 §§4-6 and of
Haesemeyer–Weibel); l a prime; a ∈ (k^×)^n.; Norm and Rost varieties are defined for n ≥ 2 and {a} ≠
0 in K^M_n(k)/l, as in Haesemeyer–Weibel.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, SchemeAndStackFoundations:SF.5,
MotivicEtaleKTheory:M.5a/effective-motives
Proposed namespace: TauCeti.RostMotive
API TauCeti.RostMotive.charNumber [constructor]: s_d(X) ∈ ℤ for X smooth projective of dimension d.
API TauCeti.RostMotive.IsNuVariety [characterisation]: For n ≥ 0: X is a ν_n-variety iff dim X = l^n
− 1 and s_{l^n−1}(X) ≢ 0 mod l² (with s_0(X) = deg X).
API TauCeti.RostMotive.Splits [characterisation]: X splits a iff a ↦ 0 in K^M_n(k(X))/l.
API TauCeti.RostMotive.IsNormVariety [constructor]: For n ≥ 2 and {a} ≠ 0: X is a norm variety for a
iff X is smooth projective of dimension l^{n−1} − 1, splits a, and is l-generic.
API TauCeti.RostMotive.splits_baseChange [functoriality]: If X splits a then X_{k'} splits a_{k'}
for every field extension k'/k.
API TauCeti.RostMotive.IsGenericSplitting [constructor]: X is l-generic for a iff every field F ⊇ k
splitting a has a finite extension E of degree prime to l with X(E) ≠ ∅.
API TauCeti.RostMotive.IsNuLeVariety [constructor]: X is a ν_{≤n}-variety iff X is a ν_n-variety and
for each i < n some ν_i-variety maps to X.
API TauCeti.RostMotive.IsRostVariety [constructor]: X is a Rost variety for a iff X is a
ν_{≤(n−1)}-variety splitting a and H_{−1,−1}(X × X) → H_{−1,−1}(X) → k^× is exact.
API TauCeti.RostMotive.charNumber_add [relation]: s_d(E) = s_d(E') + s_d(E'') for 0 → E' → E → E'' →
0, and s_d(L) = c_1(L)^d for a line bundle L.
API TauCeti.RostMotive.charNumber_projectiveSpace [example]: s_d(ℙ^d) = d + 1.
API TauCeti.RostMotive.charNumber_baseChange [compatibility]: s_d(X_K) = s_d(X) for every field
extension K/k; hence X is a ν_n-variety iff X_K is.
API TauCeti.RostMotive.charNumber_prod [relation]: s_{d+e}(X × Y) = 0 if dim X = d ≥ 1 and dim Y = e
≥ 1 (T_{X×Y} = pr_1^*T_X ⊕ pr_2^*T_Y and CH^{d+e} of each factor vanishes).
Test RostMotive.test_projective_space [computation]: s_{l−1}(ℙ^{l−1}) = l, so ℙ^{l−1} is a
ν_1-variety.
Test RostMotive.test_point [degenerate]: Spec k (dimension 0 = l^0 − 1) splits a iff a = 0 in
K^M_n(k)/l.
Test RostMotive.test_splits_degree_one [compatibility]: If X has a k-rational point and splits a,
then a = 0.
Test RostMotive.test_quadric_not_nu [non-example]: For l = 2: ℙ^3 has dimension 3 = 2² − 1 and
s_3(ℙ^3) = 4 ≡ 0 (mod 4), so ℙ^3 is not a ν_2-variety although 2 divides s_3 (a definition testing
divisibility by l instead of l² fails); a smooth conic has s_1 = 2 ≢ 0 (mod 4) and is a ν_1-variety;
ℙ^1 × ℙ^1 has dimension 2 ≠ 2^n − 1 and is not a ν_n-variety for any n.
Test RostMotive.test_nu_zero [computation]: For l = 2 and a ∈ k^× not a square, Spec k(√a) is a
ν_0-variety (degree 2 ≢ 0 mod 4); Spec K for a field K of degree 4 over k is not.
Test RostMotive.test_rational_curve_not_norm [non-example]: For l = 2, n = 2 and {a_1, a_2} ≠ 0 in
K^M_2(k)/2, ℙ^1_k is a ν_1-variety of dimension 2^1 − 1 but not a norm variety for a: it has a
rational point, so it splits a only if {a} = 0 (test_splits_degree_one).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/degree-theorem: Voevodsky's motivic degree theorem (theorem;
unchecked).
Let k be a field of characteristic 0, l a prime, n ≥ 1 and d = l^n − 1; coefficients ℤ means ℤ_(l).
(a) (Voevodsky 2011 Lemma 4.1) Let X be a smooth projective variety of dimension d, V its stable
normal bundle and τ : T^N → Th_X(V) the morphism defining the degree map (Voevodsky's construction
for the ℤ/2 case), t ∈ H̃^{2N−2d,N−d}(Th_X(V), ℤ) the Thom class, t̃ ∈ H̃^{2N−2d,N−d}(Th_X(V)/T^N,
ℤ) its unique lift along p : Th_X(V) → Th_X(V)/T^N (t restricts to zero on T^N for weight reasons),
and v ∈ H̃^{2N+1,N}(Th_X(V)/T^N, ℤ) the pullback of the tautological class along ∂ : Th_X(V)/T^N →
Σ_s T^N. Then l divides deg s_d(X) and Q_n(t̃) = (deg s_d(X)/l)·v mod l. (b) (Lemma 4.3) If 𝒳 is a
simplicial scheme embedded with respect to ℤ/l-coefficients and some ν_n-variety X has M(X, ℤ/l) ∈
DM_𝒳, the Margolis homology of (H̃^{*,*}(𝒳̃, ℤ/l), Q_n) vanishes, where 𝒳̃ = cone(𝒳_+ → S^0). (c)
(Theorem 4.4, the motivic degree theorem) In the setting of (b), let τ_𝒳 : ℤ/l_𝒳(d)[2d] → M(X) be
the relative fundamental class and π_𝒳 : M(X) → ℤ/l_𝒳 the factorisation of the structure map, and
let s : M(X) → N and r : N → ℤ/l_𝒳 be morphisms in DM_𝒳(ℤ/l) with r ∘ s = π_𝒳. If some α ∈
H^{p,q}(𝒳, ℤ/l) satisfies p > q, α ≠ 0, α ∘ r = 0 and Q_n(α) = 0, then s ∘ τ_𝒳 ≠ 0.
Hypotheses: k of characteristic 0 (Voevodsky's degree map and motivic duality for smooth projective
varieties are established there); l prime; n ≥ 1; d = l^n − 1.; (b), (c): 𝒳 embedded with respect to
ℤ/l-coefficients; X a ν_n-variety with M(X, ℤ/l) ∈ DM_𝒳(ℤ/l).
Direct prerequisites: MotivicEtaleKTheory:M.5b/milnor-operations,
MotivicEtaleKTheory:M.5b/nu-variety, MotivicEtaleKTheory:M.5a/effective-motives,
MotivicEtaleKTheory:M.5b/cech-simplicial-scheme
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/pfister-norm-variety: Pfister neighbours as norm varieties for l = 2
(construction; unchecked).
Let k be a field of characteristic 0, n ≥ 1 and a = (a_1, …, a_n) ∈ (k^×)^n. With the minus-sign
convention ⟨⟨b⟩⟩ = ⟨1, −b⟩ of QuadraticFormInvariants Layer 4, let ⟨⟨a_1, …, a_{n−1}⟩⟩ = ⊗_{i<n} ⟨1,
−a_i⟩ (the form ⟨1⟩ when n = 1) and q_a = ⟨⟨a_1, …, a_{n−1}⟩⟩ ⊥ ⟨−a_n⟩, a nondegenerate form of
dimension 2^{n−1} + 1 that is a subform of the n-fold Pfister form ⟨⟨a_1, …, a_n⟩⟩ (a Pfister
neighbour). Its quadric Q_a ⊂ ℙ^{2^{n−1}} is smooth projective of dimension 2^{n−1} − 1. (i) For n ≥
2, s_{2^{n−1}−1}(Q_a) ≡ 2 (mod 4), and for n = 1, deg Q_a = 2; so Q_a is a ν_{n−1}-variety for l =
2. (ii) For i < n − 1 the quadric of ⟨⟨a_1, …, a_i⟩⟩ ⊥ ⟨−a_{i+1}⟩ is a ν_i-variety and a linear
section of Q_a, so Q_a is a ν_{≤(n−1)}-variety. (iii) For every field F ⊇ k, Q_a(F) ≠ ∅ iff {a_1, …,
a_n} = 0 in K^M_n(F)/2. Hence for n ≥ 2 the geometrically integral quadric Q_a splits a and is
2-generic, so it is a norm variety for a when {a} ≠ 0 (nu-variety). This is the l = 2 splitting
variety of Voevodsky's proof of the Milnor conjecture.
Hypotheses: k of characteristic 0 (char k ≠ 2 suffices for (i)-(iii)); n ≥ 1; a_i ∈ k^×; l = 2.
Direct prerequisites: MotivicEtaleKTheory:M.5b/nu-variety,
tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal
Proposed namespace: TauCeti.RostMotive
API TauCeti.RostMotive.pfisterNeighbourQuadric [constructor]: Q_a ⊂ ℙ^{2^{n−1}} for a ∈ (k^×)^n.
API TauCeti.RostMotive.pfister_dim [simp]: dim Q_a = 2^{n−1} − 1.
API TauCeti.RostMotive.pfister_splits [characterisation]: Q_a splits {a_1, …, a_n} mod 2.
API TauCeti.RostMotive.pfister_isNu [characterisation]: Q_a is a ν_{n−1}-variety for l = 2.
API TauCeti.RostMotive.pfister_point_iff [characterisation]: For every field F ⊇ k: Q_a(F) ≠ ∅ iff
{a_1, …, a_n} = 0 in K^M_n(F)/2.
API TauCeti.RostMotive.pfister_isNuLe [characterisation]: Q_a is a ν_{≤(n−1)}-variety for l = 2,
through the linear sections Q_{(a_1, …, a_{i+1})} ⊂ Q_a.
API TauCeti.RostMotive.pfister_isNormVariety [characterisation]: For n ≥ 2 and {a} ≠ 0 in
K^M_n(k)/2, Q_a is a norm variety for a.
Test RostMotive.test_pfister_n1 [degenerate]: For n = 1, Q_a is the zero-dimensional quadric x² =
a_1 z², which has a point iff a_1 is a square.
Test RostMotive.test_pfister_conic [computation]: For n = 2 and a = (−1, −1) over ℝ, q_a = ⟨1, 1⟩ ⊥
⟨1⟩, so Q_a is the conic x² + y² + z² = 0 with no real point, matching {−1, −1} ≠ 0 in K^M_2(ℝ)/2.
Test RostMotive.test_pfister_quaternion [compatibility]: For n = 2, Q_a has a point iff the
quaternion algebra (a_1, a_2) splits (QuadraticFormInvariants Layer 2).
Test RostMotive.test_not_full_pfister [non-example]: For n ≥ 2 the full Pfister quadric ⟨⟨a_1, …,
a_n⟩⟩ = 0 has dimension 2^n − 2, which is even and ≥ 2, hence not of the form 2^m − 1; it is not a
ν_m-variety for any m and not a norm variety, so the neighbour is required (for n = 1 the two
quadrics coincide).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle: Rost's Chain Lemma and Norm Principle
(theorem; unchecked).
Let k be a field of characteristic 0, l a prime and n ≥ 2, and suppose k is l-special (l divides the
degree of every finite extension of k; then μ_l ⊂ k). Let {a} = {a_1, …, a_n} ∈ K^M_n(k)/l be
nonzero. (Chain Lemma, Haesemeyer–Weibel Theorem 0.1) There are a smooth projective cellular variety
S over k and invertible sheaves J = J_1, J'_1, …, J_{n−1}, J'_{n−1} on S with nonzero l-forms γ =
γ_1, γ'_1, …, γ_{n−1}, γ'_{n−1} such that: (1) dim S = l(l^{n−1} − 1) = l^n − l; (2) {a_1, …, a_n} =
{a_1, …, a_{n−2}, γ_{n−1}, γ'_{n−1}} in K^M_n(k(S))/l and {a_1, …, a_{i−1}, γ_i} = {a_1, …, a_{i−2},
γ_{i−1}, γ'_{i−1}} in K^M_i(k(S))/l for 2 ≤ i < n, so {a} = {γ, γ'_1, …, γ'_{n−1}} in K^M_n(k(S))/l;
(3) γ ∉ Γ(S, J)^{⊗(−l)}; (4) for every s ∈ V(γ_i) ∪ V(γ'_i), k(s) splits {a}; (5) I(V(γ_i)) +
I(V(γ'_i)) ⊆ lℤ for all i, where I(V) ⊆ ℤ is generated by the degrees [k(v) : k] of the closed
points of V; (6) deg(c_1(J)^{dim S}) is prime to l. For the sheaf of Kummer algebras A =
⊕_{i=0}^{l−1} J^{⊗i}, the projective bundle ℙ(A) over S has dimension l^n − 1 and l² ∤
s_{l^n−1}(ℙ(A)) (Theorem 8.1). (Norm Principle, Theorem 0.3) If X is a norm variety for {a}
(nu-variety: smooth projective, l-generic, splitting, of dimension l^{n−1} − 1) and [z, β] ∈ Ā_0(X,
𝒦_1) with [k(z) : k] = l^ν, ν > 1, then there are a closed point x ∈ X with [k(x) : k] = l and α ∈
k(x)^× such that [z, β] = [x, α] in Ā_0(X, 𝒦_1), the quotient of A_0(X, 𝒦_1) ≅ H_{−1,−1}(X) by the
image of pr_{1∗} − pr_{2∗} from A_0(X × X, 𝒦_1). Consequently (Corollary 9.8, which is Theorem
0.7(3)) every element of Ā_0(X, 𝒦_1) is of the form [x, α] with [k(x) : k] ∈ {1, l}, and the norm N
: Ā_0(X, 𝒦_1) → k^× is injective.
Hypotheses: k of characteristic 0 and l-special (so μ_l ⊂ k, the standing hypothesis of
Haesemeyer–Weibel); n ≥ 2; {a} ≠ 0 in K^M_n(k)/l.; Norm Principle: X a norm variety for {a} in the
sense of nu-variety (l-generic splitting variety); the injectivity of N is the conclusion, not a
hypothesis. The Bloch–Kato conjecture in degree n − 1 is not used.
Direct prerequisites: MotivicEtaleKTheory:M.5b/nu-variety,
MotivicEtaleKTheory:M.5b/dn-degree-theorem, SchemeAndStackFoundations:SF.5,
K2SymbolsBrauer:T.2/milnor-k-theory
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/norm-variety-existence: Existence of norm varieties (theorem;
unchecked).
Let k be a field of characteristic 0 containing a primitive l-th root of unity, l a prime, n ≥ 2 and
a = (a_1, …, a_n) ∈ (k^×)^n with {a} ≠ 0 in K^M_n(k)/l. Assume that the norm residue homomorphism
K^M_{n−1}(F)/l → H^{n−1}_et(F, μ_l^{⊗(n−1)}) is bijective for every field F of characteristic 0 (the
induction hypothesis under which M.5c applies this theorem). Then: (i) there is a geometrically
irreducible norm variety X for a (nu-variety), which admits morphisms from ν_i-varieties for all i <
n − 1; (ii) if k is l-special, every norm variety for a is geometrically irreducible and a
ν_{n−1}-variety, and its norm N : Ā_0(X, 𝒦_1) → k^× is injective; (iii) consequently there is a Rost
variety for a: a ν_{≤(n−1)}-variety X splitting a such that H_{−1,−1}(X × X) --pr_{1∗} − pr_{2∗}-->
H_{−1,−1}(X) → k^× is exact integrally when k is l-special, and after ⊗ℤ_(l) for general k, the form
used in Voevodsky 2011 Lemma 6.15 (Voevodsky 2011 Theorem 6.3). For l = 2 the Pfister neighbour
quadric Q_a of pfister-norm-variety is a norm variety and a ν_{≤(n−1)}-variety without any induction
hypothesis, so (ii)-(iii) apply to it. For n = 1 and a_1 ∉ k^{×l}, Spec k(a_1^{1/l}) is a
ν_0-variety splitting a, and the norm Ā_0 → k^× is injective by Hilbert 90.
Hypotheses: k of characteristic 0 with μ_l ⊂ k (the standing hypothesis of Haesemeyer–Weibel;
automatic for l = 2 and for l-special k); l prime; n ≥ 2; {a} ≠ 0 in K^M_n(k)/l.; The norm residue
homomorphism is bijective in degree n − 1 for all fields of characteristic 0: Haesemeyer–Weibel
state that Theorem 0.7 assumes it, and Suslin–Joukhovitski use it to prove that their varieties are
l-generic. Voevodsky 2011 states Theorem 6.3 without it but applies it only under it
(MotivicEtaleKTheory/E12).
Direct prerequisites: MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle,
MotivicEtaleKTheory:M.5b/pfister-norm-variety, MotivicEtaleKTheory:M.5b/nu-variety,
MotivicEtaleKTheory:M.5b/dn-degree-theorem
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/cech-simplicial-scheme: Čech simplicial schemes and motives over
embedded simplicial schemes (construction; unchecked).
Let k be a perfect field (of characteristic 0 in the norm-residue application) and X a smooth
k-scheme. The Čech simplicial scheme Č(X) has Č(X)_n = X^{n+1}, with partial projections as faces
and diagonals as degeneracies; its motive M(Č(X)) ∈ DM^{eff,−}(k) is the totalisation of the
M(X^{n+1}) and comes with the structure map M(Č(X)) → ℤ. Let 𝒳̃ = cone(Č(X)_+ → S^0) be the
unreduced suspension. The map Č(X) → Spec k is a simplicial weak equivalence if and only if X(k) ≠
∅; if X has a point over an extension of k of degree e, then e·H̃^{*,*}(𝒳̃, A) = 0 for every
coefficient group A (transfer argument), and Č(X) → Spec k induces an isomorphism on motivic
cohomology with ℤ_(l)-coefficients if and only if X has a zero-cycle of degree prime to l (MCZ2
Appendix B, Lemmas 9.2-9.3). For X ≠ ∅ it induces isomorphisms H^{p,q}_L(k, ℤ) ≅ H^{p,q}_L(Č(X), ℤ)
on Lichtenbaum (étale) motivic cohomology for all p, q (MCZ2 Lemma 7.3). Č(X) is embedded: the
projections M(Č(X) × Č(X)) → M(Č(X)) are isomorphisms. For an embedded 𝒳, the motives over 𝒳 that
matter form the full subcategory DM_𝒳 ⊂ DM^{eff,−}(k) of the N for which N ⊗ M(𝒳) → N is an
isomorphism; it is a localising tensor ideal containing the Tate motives ℤ_𝒳(q)[p] = M(𝒳)(q)[p]. For
N ∈ DM_𝒳 and P ∈ DM^{eff,−}(k), composition with P ⊗ M(𝒳) → P is a bijection Hom(N, P ⊗ M(𝒳)) ≅
Hom(N, P), so Hom(M(Y), ℤ_𝒳(q)[p]) = H^{p,q}(Y) when M(Y) ∈ DM_𝒳; M(Y) ∈ DM_{Č(X)} if and only if
M(Y) → ℤ factors through M(Č(X)) → ℤ, in particular whenever Hom(Y, X) ≠ ∅; and M(𝒳̃) ⊗ N = 0 for N
∈ DM_𝒳 (Motives over simplicial schemes, Lemmas 6.9, 6.11, 6.18). For a symbol a = (a_1, …, a_n) mod
l, 𝒳_a := Č(Y_a), where Y_a is the disjoint union of representatives of the isomorphism classes of
smooth connected k-schemes splitting a; a smooth connected X has M(X) ∈ DM_{𝒳_a} if and only if X
splits a (Voevodsky 2011 §6, before Lemma 6.6).
Hypotheses: k a perfect field (characteristic 0 in the application to the norm residue theorem); X,
Y smooth k-schemes; the terms of simplicial schemes are disjoint unions of smooth k-schemes of
finite type.; Motives in DM^{eff,−}(k) with ℤ or ℤ_(l) coefficients, as indicated; H_L is
Lichtenbaum (étale) motivic cohomology.
Direct prerequisites: MotivicEtaleKTheory:M.5a/effective-motives,
MotivicEtaleKTheory:M.5a/finite-correspondence, MotivicEtaleKTheory:M.5a/etale-motivic-comparison
Proposed namespace: TauCeti.RostMotive
API TauCeti.RostMotive.cech [constructor]: Č(X) as a simplicial smooth k-scheme with M(Č(X)) → ℤ.
API TauCeti.RostMotive.cech_point [characterisation]: If X(k) ≠ ∅ then M(Č(X)) → ℤ is an
isomorphism.
API TauCeti.RostMotive.cech_suspension [constructor]: 𝒳̃ = cone(Č(X)_+ → S^0) and its reduced
motivic cohomology.
API TauCeti.RostMotive.cech_baseChange [functoriality]: Č(X)_{k'} = Č(X_{k'}) and M commutes with
base change.
API TauCeti.RostMotive.cech_idempotent [relation]: M(Č(X)) ⊗ M(Č(X)) ≅ M(Č(X)).
API TauCeti.RostMotive.cech_weakEquiv_iff [characterisation]: Č(X) → Spec k is a simplicial weak
equivalence if and only if X(k) ≠ ∅.
API TauCeti.RostMotive.cech_exponent [relation]: If X(E) ≠ ∅ for an extension E/k of degree e then
e·H̃^{*,*}(𝒳̃, ℤ) = 0; with ℤ_(l)-coefficients M(Č(X)) → ℤ_(l) induces isomorphisms on motivic
cohomology when X has a zero-cycle of degree prime to l.
API TauCeti.RostMotive.cech_lichtenbaum [characterisation]: For X ≠ ∅, H^{p,q}_L(k, ℤ) →
H^{p,q}_L(Č(X), ℤ) is an isomorphism for all p, q; hence H̃^{*,*}_L(𝒳̃, A) = 0.
API TauCeti.RostMotive.DMOver [structure]: For an embedded 𝒳, DM_𝒳 = {N ∈ DM^{eff,−}(k) : N ⊗ M(𝒳) →
N is an isomorphism}, a localising tensor ideal containing the Tate motives ℤ_𝒳(q)[p] = M(𝒳)(q)[p].
API TauCeti.RostMotive.mem_DMOver_cech_iff [characterisation]: M(Y) ∈ DM_{Č(X)} if and only if M(Y)
→ ℤ factors through M(Č(X)) → ℤ; in particular M(Y) ∈ DM_{Č(X)} whenever Hom(Y, X) ≠ ∅.
API TauCeti.RostMotive.hom_tate_over [universal-property]: For N ∈ DM_𝒳 and P ∈ DM^{eff,−}(k),
Hom(N, P ⊗ M(𝒳)) → Hom(N, P) is bijective; hence Hom(M(Y), ℤ_𝒳(q)[p]) = H^{p,q}(Y) for M(Y) ∈ DM_𝒳,
and M(Y) → ℤ lifts uniquely to π_𝒳 : M(Y) → ℤ_𝒳.
API TauCeti.RostMotive.suspension_tensor_eq_zero [relation]: M(𝒳̃) ⊗ N = 0 for every N ∈ DM_𝒳.
API TauCeti.RostMotive.IsRestricted [other]: N ∈ DM_𝒳 is restricted if Hom(P, N) → Hom(P ⊗ M(𝒳), N)
is bijective for all P ∈ DM^{eff,−}(k); M(X) is restricted for X smooth projective with M(X) ∈ DM_𝒳,
and direct summands of restricted objects are restricted.
API TauCeti.RostMotive.slice_conservative [characterisation]: On Tate motives over 𝒳 the slice
functor s_* is conservative and commutes with tensor products; the truncations Π_{≥n}, Π_{<n} exist
(Motives over simplicial schemes, Lemmas 5.14-5.18).
API TauCeti.RostMotive.splittingCech [constructor]: 𝒳_a = Č(Y_a) for a symbol a mod l; for smooth
connected X, M(X) ∈ DM_{𝒳_a} if and only if X splits a.
Test RostMotive.test_cech_point [degenerate]: Č(Spec k) is the constant simplicial scheme and
M(Č(Spec k)) = ℤ.
Test RostMotive.test_cech_conic [computation]: For a smooth conic C over a field of characteristic 0
splitting a nonzero quaternion symbol a = {a_1, a_2} mod 2 (so C(k) = ∅), H̃^{3,1}(𝒳̃_C, ℤ/2) ≠ 0:
it contains the image of the nonzero class δ ∈ H^{2,1}(Č(C), ℤ/2) of Voevodsky 2011 Lemma 6.5, since
H^{p,q}(𝒳) → H̃^{p+1,q}(𝒳̃) is injective for p > q.
Test RostMotive.test_cech_etale [compatibility]: For every nonempty smooth X the map Č(X) → Spec k
induces isomorphisms H^{p,q}_L(k, ℤ) ≅ H^{p,q}_L(Č(X), ℤ) on Lichtenbaum motivic cohomology
(étale-local contractibility), although M(Č(X)) → ℤ is not an isomorphism in DM^{eff,−}(k) when X
has no zero-cycle of degree one (for instance a conic without rational point).
Test RostMotive.test_cech_not_X [non-example]: M(Č(X)) ≠ M(X) for X = ℙ^1: M(ℙ^1) = ℤ ⊕ ℤ(1)[2]
while M(Č(ℙ^1)) = ℤ.
Test RostMotive.test_cech_galois_weight_zero [computation]: For E/k Galois of degree l,
H^{p,0}(Č(Spec E), ℤ/l) ≅ H^p(Gal(E/k), ℤ/l) ≅ ℤ/l for every p ≥ 0; a definition replacing M(Č(X))
by ℤ whenever X ≠ ∅ gives 0 for p ≥ 1.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5c/rost-motive: The generalised Rost motive (construction; unchecked).
Let k be a field of characteristic 0 containing a primitive l-th root of unity, n ≥ 2, a = (a_1, …,
a_n) nonzero in K^M_n(k)/l, 𝒳 = 𝒳_a (cech-simplicial-scheme), X a ν_{n−1}-variety splitting a (so
M(X) ∈ DM_𝒳), and δ ∈ H^{n,n−1}(𝒳, ℤ/l) with Q_0Q_1⋯Q_{n−1}(δ) ≠ 0 (supplied by
hilbert-ninety-induction (a)). All motives have ℤ_(l)-coefficients. Set b = (l^{n−1} − 1)/(l − 1), d
= b(l − 1) = l^{n−1} − 1 = dim X and μ = Q̃_0Q_1⋯Q_{n−2}(δ) ∈ H^{2b+1,b}(𝒳, ℤ_(l)), with Q̃_0 the
integral Bockstein; μ is l-torsion and Q_i(μ mod l) = 0 for i < n − 1. Let M be the Tate motive over
𝒳 defined by the triangle ℤ_𝒳(b)[2b] → M → ℤ_𝒳 →μ ℤ_𝒳(b)[2b + 1] (Voevodsky 2011 (5.3)) and M_i =
S^i(M) for 0 ≤ i ≤ l − 1; they sit in triangles M_{i−1}(b)[2b] → M_i → ℤ_𝒳 → M_{i−1}(b)[2b + 1] and
ℤ_𝒳(ib)[2ib] → M_i → M_{i−1} → ℤ_𝒳(ib)[2ib + 1] ((5.5), (5.6)), and M_i ⊗ ℚ ≅ ⊕_{j≤i} ℚ(jb)[2jb].
The generalised Rost motive is M_a := M_{l−1}. There is λ : M(X) → M_{l−1} lifting π_X : M(X) → ℤ_𝒳
(Lemma 5.11); with Dλ its dual for the internal Hom-objects (M(X), e_X) (Proposition 5.14, motivic
duality) and (M_{l−1}, e_{l−1}) (Lemma 5.7), λ ∘ Dλ is an isomorphism (Lemma 5.15, Corollary 5.10),
and with φ = (λ ∘ Dλ)^{−1} the endomorphism p = Dλ ∘ φ ∘ λ of M(X) is a projector with image
M_{l−1}, so M_{l−1} is a direct summand of M(X). M_{l−1} is restricted (Theorem 5.16), (M_{l−1},
e'_M) is an internal Hom-object from M_{l−1} to ℤ(d)[2d] in DM^{eff,−}(k) (Corollary 5.17), and M(𝒳)
≅ M(Č(X)) (Proposition 5.18, Lemma 6.8).
Hypotheses: k a field of characteristic 0 containing a primitive l-th root of unity (Voevodsky 2011
§5 works in characteristic 0 to use Theorem 3.8 and motivic duality).; n ≥ 2; a a symbol nonzero mod
l; X a ν_{n−1}-variety splitting a; δ ∈ H^{n,n−1}(𝒳_a, ℤ/l) with Q_0Q_1⋯Q_{n−1}(δ) ≠ 0.;
Coefficients ℤ_(l) (every prime other than l invertible); symmetric powers S^i only for i < l.
Direct prerequisites: MotivicEtaleKTheory:M.5b/cech-simplicial-scheme,
MotivicEtaleKTheory:M.5c/symmetric-power-operation, MotivicEtaleKTheory:M.5b/degree-theorem,
MotivicEtaleKTheory:M.5b/milnor-operations, MotivicEtaleKTheory:M.5b/motivic-steenrod-operations,
MotivicEtaleKTheory:M.5b/nu-variety, MotivicEtaleKTheory:M.5a/cancellation,
MotivicEtaleKTheory:M.5a/effective-motives,
MotivesAndAlgebraicCycles:MC.4/dual-of-motive-of-smooth-scheme,
MotivesAndAlgebraicCycles:MC.4/symmetric-group-acts-trivially-on-tate-twists
Proposed namespace: TauCeti.RostMotive
API TauCeti.RostMotive.rostMotive [constructor]: M_a = S^{l−1}(M_μ) ∈ DM_{𝒳_a} ⊂ DM^{eff,−}(k,
ℤ_(l)), determined by (𝒳_a, δ); it is a direct summand of M(X) for every ν_{n−1}-variety X splitting
a.
API TauCeti.RostMotive.rost_triangle [relation]: Distinguished triangles M(𝒳)(ib)[2ib] → M_i →
M_{i−1} → M(𝒳)(ib)[2ib + 1] and M_{i−1}(b)[2b] → M_i → M(𝒳) → M_{i−1}(b)[2b + 1] for 1 ≤ i ≤ l − 1.
API TauCeti.RostMotive.rost_summand [characterisation]: M_a is a direct summand of M(X) via the
projector p = Dλ ∘ (λ ∘ Dλ)^{−1} ∘ λ.
API TauCeti.RostMotive.rost_dual [relation]: (M_a, e'_M) is an internal Hom-object from M_a to
ℤ(d)[2d].
API TauCeti.RostMotive.rost_split_after_splitting [characterisation]: After a field extension
splitting a, M_a ≅ ⊕_{i=0}^{l−1} ℤ(ib)[2ib].
API TauCeti.RostMotive.symmetric_power_operation [relation]: φ_{l−1}(α) = c·βP^m(α) for α ∈
H̃^{2m+1,m}(−, ℤ/l) and a constant c ∈ (ℤ/l)^× (Voevodsky 2011 Theorem 3.8, node
symmetric-power-operation); for α = μ mod l and m = b it shows that βP^b(μ) vanishes on M_{l−1}.
API TauCeti.RostMotive.rost_rational [example]: M_i ⊗ ℚ ≅ ⊕_{j=0}^{i} ℚ(jb)[2jb], since μ is
l-torsion; with ℤ_(l)-coefficients M_i does not split.
API TauCeti.RostMotive.rost_restricted [characterisation]: M_a is restricted, and M(𝒳_a) ≅ M(Č(X))
for every ν_{n−1}-variety X splitting a.
Test RostMotive.test_rost_split [degenerate]: After base change to E = k(X), where X has a rational
point, 𝒳_E ≃ Spec E and μ_E ∈ H^{2b+1,b}(E, ℤ_(l)) = 0, so (M_a)_E ≅ ⊕_{i=0}^{l−1} ℤ_(l)(ib)[2ib].
Test RostMotive.test_rost_conic [computation]: For l = 2, n = 2: b = 1, d = 1, and M_a = M(C) for
the conic C, with triangle M(𝒳)(1)[2] → M(C) → M(𝒳).
Test RostMotive.test_rost_rank [compatibility]: Over k^sep, M_a has the Tate-motive decomposition of
rank l, matching the l summands ℤ(ib)[2ib].
Test RostMotive.test_not_whole_X [non-example]: For n ≥ 3 and l = 2, M_a ≠ M(Q_a): the Pfister
neighbour quadric has more Tate summands over k^sep than the Rost motive.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The norm residue homomorphism in all
degrees (construction; unchecked).
Let F be a field and m ≥ 1 invertible in F. The norm residue homomorphism is the unique graded ring
homomorphism h_F = ⊕_n h^n_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}) = ⊕_{n≥0} H^n(F, μ_m^{⊗n}) whose
degree-one part is the Kummer map κ : F^×/m ≅ H¹(F, μ_m) of ProfiniteCohomology Layer 9 (Tau Ceti's
kummerMap, read in the canonical carrier through Layer 3); thus h^0_F is the identity of ℤ/m and
h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n). The cup products are those of M.1/twisted-cohomology-ring,
built from Layer 12's cup product and the equivariant tensor pairings μ_m^{⊗i} ⊗ μ_m^{⊗j} →
μ_m^{⊗(i+j)} of M.1/finite-tate-twist (concatenation of tensors, not multiplication of roots of
unity). The map is well defined because κ(a) ∪ κ(1 − a) = 0 (M.3/cohomological-steinberg), and h^2_F
is M.3's Galois symbol under Matsumoto's identification K^M_2(F) = K_2(F). (i) Naturality: res_{E/F}
∘ h_F = h_E ∘ res_{E/F} for every field extension E/F with a chosen embedding of separable closures.
(ii) Change of m: for m | m', the reduction μ_{m'}^{⊗n} → μ_m^{⊗n} (ζ ↦ ζ^{m'/m} on each factor)
carries h_{F,m'} to h_{F,m}. (iii) Norms: for E/F finite, cor_{E/F} ∘ h_E = h_F ∘ N_{E/F}, with
N_{E/F} the Milnor norm of K2SymbolsBrauer T.4 and cor_{E/F} the corestriction when E/F is separable
and multiplication by [E : F] under G_E = G_F when E/F is purely inseparable (in general the
composite along the separable closure of F in E). (iv) Residues: for a discrete valuation v on F
with uniformiser π and residue field k(v) in which m is invertible, ∂_v ∘ h^n_F = (−1)^{n−1}
h^{n−1}_{k(v)} ∘ ∂^M_v, where ∂^M_v is K2SymbolsBrauer T.3's higher residue (∂^M_v{u_1, …, u_{n−1},
π} = {ū_1, …, ū_{n−1}}) and ∂_v : H^n(F, μ_m^{⊗n}) → H^{n−1}(k(v), μ_m^{⊗(n−1)}) the residue of
M.1/localization-gysin-sequence (∂_vκ(π) = 1); for v-units u_i, h^n_F{u_1, …, u_n} is unramified and
specialises to h^n_{k(v)}{ū_1, …, ū_n}. (v) Motivic comparison: h^n_F equals the composite
K^M_n(F)/m ≅ H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) of the diagonal isomorphism
(M.5a/suslin-complex-and-motivic-complexes) and the motivic-to-étale map of
M.5a/etale-motivic-comparison, normalised in weight one to be κ; for F not of finite type over a
perfect field both sides are filtered colimits over smooth models (M.5a/imperfect-field-passage
(b)).
Hypotheses: F a field; m ≥ 1 invertible in F; no primitive m-th root of unity is assumed.; For (iv),
m invertible in the residue field k(v); for (iii), E/F finite.
Direct prerequisites: MotivicEtaleKTheory:M.3/cohomological-steinberg,
MotivicEtaleKTheory:M.3/galois-symbol, MotivicEtaleKTheory:M.3/symbol-norm-compatibility,
MotivicEtaleKTheory:M.3/symbol-residue-compatibility, MotivicEtaleKTheory:M.1/finite-tate-twist,
MotivicEtaleKTheory:M.1/twisted-cohomology-ring,
MotivicEtaleKTheory:M.1/localization-gysin-sequence, MotivicEtaleKTheory:M.1/etale-kummer-sequences,
MotivicEtaleKTheory:M.5a/etale-motivic-comparison,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.5a/imperfect-field-passage, tauceti:TauCeti.kummerMap,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees,
K2SymbolsBrauer:T.2/milnor-k-theory, K2SymbolsBrauer:T.2/matsumoto,
K2SymbolsBrauer:T.3/higher-milnor-residues, K2SymbolsBrauer:T.4/milnor-transfer-transitivity,
K2SymbolsBrauer:T.4/milnor-projection-formula, K2SymbolsBrauer:T.4/prime-to-p-closure,
K2SymbolsBrauer:T.4/p-closed-generation, K2SymbolsBrauer:T.4/transfer-base-change
Proposed namespace: TauCeti.NormResidue
API TauCeti.NormResidue.map [constructor]: h_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}), a graded ring
homomorphism.
API TauCeti.NormResidue.map_symbol [simp]: h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n).
API TauCeti.NormResidue.map_one [equivalence]: h^1_F is the Kummer isomorphism F^×/m ≅ H¹(F, μ_m).
API TauCeti.NormResidue.map_two [compatibility]: h^2_F is M.3's Galois symbol.
API TauCeti.NormResidue.map_res [functoriality]: res_{E/F} ∘ h_F = h_E ∘ res_{E/F} for every field
extension E/F with a chosen embedding of separable closures.
API TauCeti.NormResidue.map_norm [compatibility]: cor_{E/F} ∘ h_E = h_F ∘ N_{E/F} for E/F finite,
with cor the corestriction for E/F separable and multiplication by [E : F] under G_E = G_F for E/F
purely inseparable.
API TauCeti.NormResidue.map_residue [compatibility]: ∂_v ∘ h^n_F = (−1)^{n−1} h^{n−1}_{k(v)} ∘ ∂^M_v
for a discrete valuation v with m invertible in k(v), where ∂^M_v{u_1, …, u_{n−1}, π} = {ū_1, …,
ū_{n−1}} and ∂_vκ(π) = 1.
API TauCeti.NormResidue.map_motivic [compatibility]: h_F equals the composite K^M_n(F)/m ≅
H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) with the normalised weight-one identification.
API TauCeti.NormResidue.map_reduce [compatibility]: For m | m', reduction of coefficients
μ_{m'}^{⊗n} → μ_m^{⊗n} carries h_{F,m'} to h_{F,m} composed with K^M_n(F)/m' → K^M_n(F)/m.
API TauCeti.NormResidue.map_unramified [compatibility]: For v-units u_1, …, u_n, h^n_F{u_1, …, u_n}
is the restriction of κ(u_1) ∪ ⋯ ∪ κ(u_n) ∈ H^n_et(Spec 𝒪_v, μ_m^{⊗n}), whose restriction to the
closed point is h^n_{k(v)}{ū_1, …, ū_n}.
Test NormResidue.test_degree_zero [degenerate]: h^0_F : ℤ/m → H^0(F, ℤ/m) = ℤ/m is the identity.
Test NormResidue.test_real [computation]: For F = ℝ, m = 2: h^n{−1, …, −1} = κ(−1)^n ≠ 0.
Test NormResidue.test_kummer [compatibility]: h^1_F(a) is the image of TauCeti.kummerMap F m a under
Layer 3's comparison of Tau Ceti's explicit H¹ with the canonical continuous cohomology; it is the
class of σ ↦ σ(α)/α for any α ∈ F^s with α^m = a.
Test NormResidue.test_finite_field [non-example]: For F = 𝔽_q and n = 2 both sides vanish
(K^M_2(𝔽_q) = 0, cd(𝔽_q) = 1); a map defined without the Steinberg relation on the tensor algebra
would have nonzero source.
Test NormResidue.test_residue_sign [computation]: For F = ℚ_p (p odd), m = ℓ a prime dividing p − 1
and a unit u with ū not an ℓ-th power in 𝔽_p: ∂_p(h²{u, p}) = −κ(ū) ≠ 0 and ∂_p(h²{p, u}) = κ(ū); a
residue formula with sign +1 in every degree fails here.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5c/hilbert-ninety-induction: The inductive step: Hilbert 90 for K^M_n and
the vanishing of H^{n+1,n}(𝒳) (theorem; unchecked).
Let l be a prime and n ≥ 2, and assume H90(q, l) for every q ≤ n − 1: H^{q+1}_L(F, ℤ_(l)(q)) = 0 for
every field F of characteristic 0 (so hilbert-ninety-implies-beilinson-lichtenbaum gives the norm
residue isomorphism in degrees ≤ n − 1 and the Beilinson–Lichtenbaum comparison in weights ≤ n − 1
over such fields; H_L is Lichtenbaum motivic cohomology). Let k be a field of characteristic 0
containing a primitive l-th root of unity, a = (a_1, …, a_n) a symbol nonzero in K^M_n(k)/l, 𝒳 =
𝒳_a, and X a norm variety for a (M.5b/norm-variety-existence: a ν_{≤(n−1)}-variety splitting a with
H_{−1,−1}(X × X) → H_{−1,−1}(X) → k^× exact). Then: (a) the image of a in H^n_et(k, μ_l^{⊗n}) is
nonzero (Lemma 6.4), and there is δ ≠ 0 in H^{n,n−1}(𝒳, ℤ/l) (Lemma 6.5) with Q_{n−1}⋯Q_0(δ) ≠ 0
(Lemma 6.7); (b) H̃^{p,q}(𝒳̃, ℤ/l) = 0 for q ≤ n − 1 and p ≤ q + 1 (Lemma 6.6); (c) H^{n+1,n}(𝒳,
ℤ_(l)) = 0 (Proposition 6.11, via Lemmas 6.12-6.15 and the Rost motive); (d) the sequence
H^{n+1,n}(𝒳, ℤ_(l)) → H^{n+1,n}_L(k, ℤ_(l)) → H^{n+1,n}_L(k(X), ℤ_(l)) is exact (Lemma 6.9), so
restriction H^{n+1}_L(k, ℤ_(l)(n)) → H^{n+1}_L(k(X), ℤ_(l)(n)) is injective, while a = 0 in
K^M_n(k(X))/l; (e) consequently H90(n, l) holds: H^{n+1}_L(F, ℤ_(l)(n)) = 0 for every field F of
characteristic 0 (Hilbert 90 for K^M_n; MCZ2, proof of Theorem 7.4, pp. 96-97).
Hypotheses: k of characteristic 0 containing a primitive l-th root of unity; n ≥ 2.; Induction
hypothesis H90(q, l) for all q ≤ n − 1 and all fields of characteristic 0.; a a symbol nonzero mod
l; X a norm variety for a.
Direct prerequisites: MotivicEtaleKTheory:M.5c/rost-motive,
MotivicEtaleKTheory:M.5b/cech-simplicial-scheme, MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees,
MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum,
MotivicEtaleKTheory:M.5b/norm-variety-existence, MotivicEtaleKTheory:M.5b/degree-theorem,
MotivicEtaleKTheory:M.5b/milnor-operations, MotivicEtaleKTheory:M.5a/etale-motivic-comparison,
K2SymbolsBrauer:T.4/prime-to-p-closure, K2SymbolsBrauer:T.4/restriction-transfer-degree
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5c/mod-l-norm-residue: The mod-l norm residue isomorphism (theorem;
unchecked).
Let l be a prime and k a field with char k ≠ l. For every n ≥ 0 the norm residue homomorphism h^n_k
: K^M_n(k)/l → H^n(k, μ_l^{⊗n}) of galois-symbol-all-degrees is an isomorphism (Voevodsky 2011
Theorems 6.1 and 6.16). If char k = 0, H90(n, l) holds for k for every n, and by
hilbert-ninety-implies-beilinson-lichtenbaum (a) for every pointed smooth simplicial scheme 𝒳 over k
the maps H̃^{p,q}(𝒳, ℤ/l) → H̃^{p,q}_L(𝒳, ℤ/l) are isomorphisms for p ≤ q and monomorphisms for p =
q + 1 (Theorem 6.17(1) for such k). The ℓ^r-coefficient theorem is M.5d/prime-power-norm-residue,
and the comparison for smooth schemes over arbitrary fields is M.7/beilinson-lichtenbaum.
Hypotheses: l prime; k a field with char k ≠ l; n ≥ 0.; The simplicial-scheme comparison is stated
for char k = 0.
Direct prerequisites: MotivicEtaleKTheory:M.5c/hilbert-ninety-induction,
MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum,
MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees, MotivicEtaleKTheory:M.5b/norm-variety-existence,
MotivicEtaleKTheory:M.1/localization-gysin-sequence,
MotivicEtaleKTheory:M.1/henselian-residue-comparison, K2SymbolsBrauer:T.3/rigidity,
K2SymbolsBrauer:T.4/restriction-transfer-degree, mathlib:WittVector.isDiscreteValuationRing,
mathlib:WittVector.isAdicCompleteIdealSpanP, mathlib:WittVector.quotientPEquiv,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5/norm-residue-theorem: The norm residue theorem (Rost–Voevodsky)
(theorem; unchecked).
Let F be a field, ℓ a prime invertible in F and r ≥ 1. For every j ≥ 0, the norm residue
homomorphism h^j_F : K^M_j(F)/ℓ^r → H^j(F, μ_{ℓ^r}^{⊗j}) of M.5c/galois-symbol-all-degrees is an
isomorphism; together they form a graded ring isomorphism K^M_*(F)/ℓ^r ≅ ⊕_j H^j(F, μ_{ℓ^r}^{⊗j}).
Consequently, for every integer m invertible in F, h_F : K^M_*(F)/m → ⊕_j H^j(F, μ_m^{⊗j}) is a
graded ring isomorphism. In degree one it is the Kummer isomorphism of ProfiniteCohomology Layer 9;
in degree two it is the Merkurjev–Suslin theorem, whose arithmetic special cases are M.3's Tate
theorems. Its Beilinson–Lichtenbaum form (Z/m(i) ≃ τ_{≤i}Rα_*μ_m^{⊗i} for smooth schemes over F) is
MotivicEtaleKTheory:M.7/beilinson-lichtenbaum, and the residue-characteristic statement
(Bloch–Gabber–Kato) is M.5d/bloch-gabber-kato, a separate theorem.
Hypotheses: F a field; ℓ prime with ℓ ≠ char F; r ≥ 1; j ≥ 0.
Direct prerequisites: MotivicEtaleKTheory:M.5c/mod-l-norm-residue,
MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees,
MotivicEtaleKTheory:M.5d/prime-power-norm-residue,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-adic-comparison: Tate's diagram (3.3) and the comparison of K₂
with ℓ-adic cohomology (theorem; unchecked).
Let F be a field, ℓ ≠ char F a prime, E = F(μ_ℓ) and Δ = Gal(E/F). (a) (Tate (3.3), (3.4)) There are
homomorphisms γ : (μ_ℓ ⊗ E^×)^Δ → (K_2F)_ℓ and i : (μ_ℓ ⊗ E^×)^Δ → H¹(F, μ_ℓ^{⊗2}), with γ(z ⊗ a) =
{z, a} and i(z ⊗ a) = z ∪ κ(a) when μ_ℓ ⊂ F, and in general defined through the restriction maps
(K_2F)_ℓ → ((K_2E)_ℓ)^Δ and H¹(F, μ_ℓ^{⊗2}) → H¹(E, μ_ℓ^{⊗2})^Δ, which are bijective because [E : F]
divides ℓ − 1; i is an isomorphism. They make Tate's diagram (3.3) commute: its top row (μ_ℓ ⊗
E^×)^Δ --γ--> K_2F --ℓ--> K_2F → K_2F/ℓ → 0 is exact except possibly at the left-hand K_2F, its
bottom row H¹(F, μ_ℓ^{⊗2}) --δ--> H²(F, ℤ_ℓ(2)) --ℓ--> H²(F, ℤ_ℓ(2)) → H²(F, μ_ℓ^{⊗2}) is exact, and
the vertical maps are i, h_F, h_F and h_{F,ℓ}. (b) (Tate (3.5)(a)) ker h_F contains the maximal
ℓ-divisible subgroup (K_2F)_{ℓ-div}, and h_F maps (K_2F)_ℓ onto H²(F, ℤ_ℓ(2))_ℓ. (c) (Tate (3.5)(b)
and Corollary) If h_{F,ℓ} is injective, then ker h_F = (K_2F)_{ℓ-div}, coker h_F has no ℓ-torsion,
and K_2F{ℓ} is the direct sum of its maximal divisible subgroup, killed by h_F, and a subgroup
mapped isomorphically by h_F onto H²(F, ℤ_ℓ(2)){ℓ}. (d) If h_{F,ℓ} is bijective, then H³(F,
ℤ_ℓ(2))[ℓ] = 0 and h_{F,ℓ^r} : K_2F/ℓ^r → H²(F, μ_{ℓ^r}^{⊗2}) is bijective for every r ≥ 1.
Hypotheses: F a field; ℓ ≠ char F prime; r ≥ 1.; (c) needs only injectivity of h_{F,ℓ}; (d) needs
bijectivity.
Direct prerequisites: MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.3/adic-galois-symbol, MotivicEtaleKTheory:M.1/twisted-cohomology-ring,
MotivicEtaleKTheory:M.1/continuous-limit-comparison, MotivicEtaleKTheory:M.1/adic-tate-twist,
ArithmeticGaloisDuality:R02.1/rationalization, K2SymbolsBrauer:T.4/restriction-transfer-degree,
K2SymbolsBrauer:T.2/matsumoto,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory,
K2SymbolsBrauer:T.4
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-injectivity-criterion: Tate's criterion for injectivity of the
Galois symbol modulo ℓ (theorem; unchecked).
Let F be a field and ℓ ≠ char F a prime. (a) (Tate (4.1)) With E = F(μ_ℓ): if h_{E,ℓ} is injective
(resp. bijective), so is h_{F,ℓ}. Assume now μ_ℓ ⊂ F. (b) (Tate (4.3)) For a, b ∈ F^×: {a, b} ∈
ℓK_2F ⟺ h_{F,ℓ}{a, b} = 0 ⟺ b is a norm from F(a^{1/ℓ}); and when a ∉ F^{×ℓ}, the classes of H²(F,
μ_ℓ^{⊗2}) whose restriction to F(a^{1/ℓ}) vanishes are exactly the h_{F,ℓ}{a, b}, b ∈ F^×. (c) (Tate
(4.4) and Corollary) Let u : F^× ⊗ F^× → H²(F, μ_ℓ^{⊗2}), a ⊗ b ↦ h_{F,ℓ}{a, b}. Then ker h_{F,ℓ} ≅
Ker u/(Ker u)', where (Ker u)' is the subgroup generated by the decomposable elements a ⊗ b of Ker
u; so h_{F,ℓ} is injective if and only if Ker u is generated by decomposable elements, and this
holds when (i) for a, b, c, d ∈ F^× with u(a ⊗ b) = u(c ⊗ d) there are x, y ∈ F^× with u(a ⊗ b) =
u(x ⊗ b) = u(x ⊗ y) = u(c ⊗ y) = u(c ⊗ d), and (ii) for a_1, a_2, b_1, b_2 ∈ F^× there are c_1, c_2,
d ∈ F^× with u(a_1 ⊗ b_1) = u(c_1 ⊗ d) and u(a_2 ⊗ b_2) = u(c_2 ⊗ d). (d) (Tate (4.5)) If Br(F)[ℓ]
is cyclic, conditions (i) and (ii) hold and h_{F,ℓ} is injective.
Hypotheses: F a field; ℓ ≠ char F prime; in (b)–(d) μ_ℓ ⊂ F.; u and conditions (i), (ii) are stated
through h_{F,ℓ}, without choosing a primitive root; Tate's cyclic-algebra form (a, b) differs from
them by the choice of z ⊗ −, and the normalised Brauer-valued symbol is K2SymbolsBrauer T.7's.
Direct prerequisites: MotivicEtaleKTheory:M.3/galois-symbol,
MotivicEtaleKTheory:M.3/symbol-norm-compatibility, MotivicEtaleKTheory:M.1/twisted-cohomology-ring,
MotivicEtaleKTheory:M.1/etale-kummer-sequences, K2SymbolsBrauer:T.2/matsumoto,
K2SymbolsBrauer:T.4/milnor-projection-formula, K2SymbolsBrauer:T.4/restriction-transfer-degree,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory,
tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.3/tate-gamma-kernel: The kernel of γ and the rank of H¹(F, ℤ_ℓ(2))
(theorem; unchecked).
Let F be a number field, ℓ a prime, r_2 the number of complex places of F, E = F(μ_ℓ) and Δ =
Gal(E/F). (a) (Tate (6.3)) The kernel of γ : (μ_ℓ ⊗ E^×)^Δ → K_2F (tate-adic-comparison (a)) is an
elementary abelian group of order ℓ^{r_2+ε}, where ε = 1 if H⁰(F, μ_ℓ^{⊗2}) ≠ 0, i.e. [F(μ_ℓ) : F] ≤
2, and ε = 0 otherwise. In particular, if F contains a primitive ℓ-th root of unity z and A = {a ∈
F^× : {z, a} = 0}, then (A : F^{×ℓ}) = ℓ^{r_2+1}. (b) (Tate (6.5) and Corollary) H¹(F, ℤ_ℓ(2)) ≅
ℤ_ℓ^{r_2} × ℤ/ℓ^m, where m is the largest integer ≥ 0 such that F(μ_{ℓ^m}) is contained in a
composite of quadratic extensions of F; so H¹(F, ℚ_ℓ(2)) has dimension r_2 over ℚ_ℓ.
Hypotheses: F a number field; ℓ prime. Tate states (6.3) and (6.5) for global fields (r_2 = 0 for
function fields); the function-field case belongs to the gap recorded for tate-global.
Direct prerequisites: MotivicEtaleKTheory:M.3/tate-picard-sequence,
MotivicEtaleKTheory:M.3/tate-torsion-symbols, MotivicEtaleKTheory:M.3/tate-adic-comparison,
MotivicEtaleKTheory:M.3/tate-global, ArithmeticKTheory:N.2/S-unit-and-class-group-sequence,
mathlib:NumberField.Units.finrank_eq, MotivicEtaleKTheory:M.1/continuous-limit-comparison,
ArithmeticGaloisDuality:R02.1/rationalization
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.4/gersten-graph-comparison: The last Gersten terms and graph cycles:
CH^p(X) and CH^p(X, 1) (theorem; unchecked).
Let X be smooth, equidimensional and quasi-projective over a field k, and p ≥ 1. Let G^p(X) be the
last three terms of the Gersten complex, ⊕_{y∈X^{(p−2)}} K^M_2(k(y)) --T--> ⊕_{y∈X^{(p−1)}} k(y)^×
--div--> Z^p(X), where for y with closure Y, div(f) = Σ_z ord_z(f)·z over the codimension-one points
z of Y (orders defined through the normalisation Ỹ: ord_z = Σ_{w over z} [k(w) : k(z)] ord_w), and T
is the Gersten differential, whose component from y to a codimension-one point z of Y is Σ_{w ∈ Ỹ
over z} N_{k(w)/k(z)} ∂_w with ∂_w the tame symbol of K2SymbolsBrauer T.3 at w. Then: (a) div ∘ T =
0 and coker(div) = CH^p(X) (chow-degree-zero). (b) For f ∈ k(y)^× ∖ {1}, the graph cycle Γ_f ⊂ X ×
□^1 (the closure of the graph of f on Y in Y × ℙ^1, intersected with X × (ℙ^1 ∖ {1}); Γ_1 = 0) is
admissible of codimension p, and its cubical boundary is d Γ_f = div(f) as cycles. (c) The map
(f_y)_y ↦ Σ_y Γ_{f_y} sends ker(div) to cycles, and induces a natural isomorphism ker(div)/im(T) ≅
CH^p(X, 1) = H^{2p−1}(X, Z(p)) (in the simplicial model through simplicial-cubical-comparison). (d)
For y ∈ X^{(p−2)} and f, g ∈ k(y)^× ∖ {1} whose divisors on Ỹ have no common component, the graph
Γ_{f,g} ⊂ X × □^2 (pushed forward from Ỹ) is admissible and d Γ_{f,g} = Σ_D (ord_D(f)·Γ_{g|D} −
ord_D(g)·Γ_{f|D}) over the prime divisors D of Ỹ (pushed forward to X). Since the tame symbol at
such D is ∂_D{f, g} = f^{ord_D g} g^{−ord_D f} with no sign, d Γ_{f,g} + Σ_D Γ_{∂_D{f,g}} lies in
the subgroup generated by the cycles Γ_{ab} − Γ_a − Γ_b, which are zero in CH^p(X, 1) by (c); so the
graph map carries T to boundaries, with sign −1 for the conventions of cubical-cycle-complex and
T.3, and Γ_{f,g} is an explicit witness. Part (c) does not depend on (d).
Hypotheses: X smooth, equidimensional and quasi-projective over a field k; p ≥ 1.; Tame symbols,
norms and the cubical boundary are normalised as in K2SymbolsBrauer T.3/T.4 and
cubical-cycle-complex.
Direct prerequisites: MotivicEtaleKTheory:M.4/dedekind-gersten,
MotivicEtaleKTheory:M.4/localization-sequence, MotivicEtaleKTheory:M.4/vanishing-above-weight,
MotivicEtaleKTheory:M.4/weight-zero-and-one, MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro,
MotivicEtaleKTheory:M.4/chow-degree-zero, MotivicEtaleKTheory:M.4/cubical-cycle-complex,
MotivicEtaleKTheory:M.4/simplicial-cubical-comparison, MotivicEtaleKTheory:M.4/functoriality,
K2SymbolsBrauer:T.3/tame-symbol, K2SymbolsBrauer:T.4/milnor-transfer-transitivity
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/tensor-product-transfers: Tensor products of presheaves and sheaves
with transfers (construction; unchecked).
Let k be a field and R a commutative ring, and let PST(k, R) be the category of additive functors
Cor_k^op → R-mod. The tensor product ⊗_tr on PST(k, R) is F ⊗_tr G = H_0(P ⊗ Q) for resolutions P →
F, Q → G by direct sums of representables, where R_tr(X) ⊗ R_tr(Y) = R_tr(X × Y) on representables
(MVW Definition 8.2); it is right exact, commutes with direct sums, and F ⊗_tr − is left adjoint to
the internal Hom with Hom(G, H)(X) = Hom(G ⊗_tr R_tr(X), H) (MVW 8.3). The total derived tensor
product C ⊗^L_tr D = Tot(P ⊗ Q) of bounded above complexes makes D^−(PST(k, R)) a tensor
triangulated category (MVW 8.8). Its Nisnevich sheafification C ⊗^L_{tr,Nis} D = (C ⊗^L_tr D)_Nis
depends only on C_Nis and D_Nis up to quasi-isomorphism, and makes D^−(Sh_Nis(Cor_k, R)) a tensor
triangulated category with unit R and R_tr(X) ⊗ R_tr(Y) ≅ R_tr(X × Y) (MVW 14.2, the Nisnevich
analogue of MVW 8.14–8.17); the same holds for the étale topology (MVW 8.17). There is a natural map
F ⊗_R G → F ⊗_tr G from the presheaf tensor product (MVW 8.9), and for pointed smooth schemes
R_tr(X_1, x_1) ⊗_tr ⋯ ⊗_tr R_tr(X_n, x_n) = R_tr(X_1 ∧ ⋯ ∧ X_n), in particular R_tr(𝔾_m^{∧1})^{⊗_tr
q} = R_tr(𝔾_m^{∧q}) (MVW 8.10). Tensor triangulated means, as in MVW Definition 8A.1: a triangulated
category with a symmetric monoidal structure whose tensor product commutes with the shift in each
variable through isomorphisms l, r with rl = −lr, and sends distinguished triangles in either
variable to distinguished triangles.
Hypotheses: k a field; R a commutative ring.; Complexes are cohomologically bounded above.
Direct prerequisites: MotivicEtaleKTheory:M.5a/finite-correspondence,
MotivicEtaleKTheory:M.5a/presheaf-with-transfers, mathlib:DerivedCategory.Minus,
mathlib:CategoryTheory.LocalizedMonoidal, mathlib:CategoryTheory.MorphismProperty.IsMonoidal,
mathlib:CategoryTheory.Triangulated.Localization.isTriangulated
Proposed namespace: TauCeti.Transfers
API TauCeti.Transfers.tensorTr [constructor]: F ⊗_tr G for presheaves of R-modules with transfers
(MVW 8.2), right exact in each variable and commuting with direct sums.
API TauCeti.Transfers.internalHom [universal-property]: Hom(F ⊗_tr G, H) ≅ Hom(F, Hom(G, H)) with
Hom(G, H)(X) = Hom(G ⊗_tr R_tr(X), H) (MVW 8.2, 8.3).
API TauCeti.Transfers.ztr_tensor [simp]: R_tr(X) ⊗_tr R_tr(Y) ≅ R_tr(X × Y), natural in finite
correspondences (MVW 8.10).
API TauCeti.Transfers.ztr_smash [simp]: R_tr(X_1, x_1) ⊗_tr ⋯ ⊗_tr R_tr(X_n, x_n) ≅ R_tr(X_1 ∧ ⋯ ∧
X_n); in particular R_tr(𝔾_m^{∧1})^{⊗_tr q} ≅ R_tr(𝔾_m^{∧q}) (MVW 8.10).
API TauCeti.Transfers.presheafTensor_toTensorTr [data]: The natural map F ⊗_R G → F ⊗_tr G, given on
representables by the external product followed by the diagonal (MVW 8.9).
API TauCeti.Transfers.derivedTensor [structure]: ⊗^L_tr on D^−(PST(k, R)) and ⊗^L_{tr,Nis},
⊗^L_{tr,et} on D^−(Sh_Nis(Cor_k, R)), D^−(Sh_et(Cor_k, R)): symmetric monoidal with unit R and
triangulated in each variable (MVW 8.8, 8.17, 14.2).
API TauCeti.Transfers.derivedTensor_sheafify [compatibility]: (C ⊗^L_tr D)_Nis depends only on C_Nis
and D_Nis up to quasi-isomorphism, and sheafification D^−(PST(k, R)) → D^−(Sh_Nis(Cor_k, R)) is
tensor triangulated (MVW 8.16 and its Nisnevich analogue).
Test Transfers.test_tensor_unit [degenerate]: R ⊗_tr F ≅ F for every presheaf of R-modules with
transfers F, since R = R_tr(Spec k) and Spec k × X = X.
Test Transfers.test_tensor_torsion [computation]: ℤ/n ⊗_tr ℤ_tr(X) ≅ (ℤ/n)_tr(X) = ℤ_tr(X)/n,
computed with the projective resolution ℤ --n--> ℤ of ℤ/n (MVW 8.11).
Test Transfers.test_not_presheaf_tensor [non-example]: For k = ℚ the map ℤ_tr(𝔾_m)(ℚ) ⊗ ℤ_tr(𝔾_m)(ℚ)
→ (ℤ_tr(𝔾_m) ⊗_tr ℤ_tr(𝔾_m))(ℚ) = Z_0(𝔾_m × 𝔾_m) of MVW 8.9 is not surjective: it sends [x] ⊗ [y] to
the cycle of x × y, and for x = y the closed point t² + 1 = 0 this cycle is (i, i) + (i, −i), so the
closed point (i, i) alone is not in the image. The objectwise tensor product is therefore not ⊗_tr.
Test Transfers.test_tensor_locally_constant [compatibility]: For étale sheaves of R-modules with
transfers F, F' with F' locally constant, (F ⊗_tr F')_et ≅ F ⊗_et F', the tensor product of the
underlying étale sheaves (MVW 8.13).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/suslin-rigidity: Suslin's rigidity theorem (theorem; unchecked).
Let k be a field and F a homotopy invariant presheaf with transfers on Sm/k whose groups F(X) are
torsion of exponent prime to char k. Then the étale sheafification F_et is locally constant: F_et ≅
π^*M for the discrete Gal(k^sep/k)-module M = F(k^sep) = colim F(Spec l) over the finite separable
extensions l/k (MVW Theorem 7.20). Equivalently, if k is separably closed then F(S) = F(Spec k) for
the henselisation S of 𝔸^d at 0, for every d (MVW Proposition 7.21).
Hypotheses: k a field; F a homotopy invariant presheaf with transfers whose values are torsion
groups of exponent prime to char k.
Direct prerequisites: MotivicEtaleKTheory:M.5a/presheaf-with-transfers,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.1/etale-twist-sheaf, MotivicEtaleKTheory:M.1/etale-kummer-sequences,
SchemeAndStackFoundations:SF.2, tauceti:TauCeti.AlgebraicGeometry.LineBundleClass
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5a/etale-a1-local-complexes: Étale A¹-local complexes with finite
coefficients (theorem; unchecked).
Let k be a field, R a commutative ring and D^−_et = D^−(Sh_et(Cor_k, R)). An étale A¹-weak
equivalence is a morphism of D^−_et whose cone lies in the smallest thick subcategory containing the
cones of R_tr(X × 𝔸^1) → R_tr(X), X smooth, and closed under the direct sums that exist (MVW
Definition 9.2; the localisation is DM^{eff,−}_et(k, R) of effective-motives), and K is A¹-local if
Hom(−, K) inverts étale A¹-weak equivalences (MVW 9.17). Then: (a) K → Tot C_*K is an étale A¹-weak
equivalence for every bounded above complex K of étale sheaves with transfers (MVW 9.15); (b) an
étale A¹-weak equivalence between A¹-local complexes is a quasi-isomorphism (MVW 9.21); (c) an étale
sheaf with transfers is A¹-local exactly when H^i_et(X × 𝔸^1, F) ≅ H^i_et(X, F) for all smooth X and
i, so every locally constant étale sheaf of torsion prime to char k is A¹-local (MVW 9.23–9.25); (d)
if 1/m ∈ k and cd_m(k) < ∞, then Tot C_*K is A¹-local for every bounded above complex K of étale
sheaves of ℤ/m-modules with transfers, in particular ℤ/m(q) is A¹-local for every q (MVW 9.31,
9.33).
Hypotheses: k a field; R a commutative ring.; (c): torsion prime to char k; (d): 1/m ∈ k and cd_m(k)
< ∞, the running assumption of MVW Lecture 9 from 9.26 on.
Direct prerequisites: MotivicEtaleKTheory:M.5a/presheaf-with-transfers,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.5a/effective-motives, MotivicEtaleKTheory:M.5a/suslin-rigidity,
MotivicEtaleKTheory:M.1/etale-twist-sheaf, SchemeAndStackFoundations:SF.2
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5b/dn-degree-theorem: Rost's DN degree theorem (theorem; unchecked).
Let k be a field of characteristic 0, l a prime, n ≥ 1, d = l^n − 1 and G an algebraic group (μ_l^n
in the application). Let u_1, …, u_r (r ≥ 1) be symbols in K^M_{n+1}(k)/l and X = X_1 × ⋯ × X_r,
where the X_i are irreducible smooth projective G-varieties of dimension d such that (1) k(X_i)
splits u_i, (2) u_i is nonzero over k(X_1 × ⋯ × X_{i−1}), and (3) l² ∤ s_d(X_i). Let Y be a smooth
irreducible projective G-variety which is G-fixed point equivalent to the disjoint union of m copies
of X with l ∤ m (the fixed loci are 0-dimensional, lie in the smooth loci, and correspond
bijectively over a separable extension with isomorphic tangent representations), F a finite
extension of k(Y) of degree prime to l, and Spec F → X a point with model f : W → X, where W → Y is
finite. Then f is dominant and of degree prime to l (Haesemeyer–Weibel Theorem A.1).
Hypotheses: k of characteristic 0; l prime; n ≥ 1; d = l^n − 1.; X_i, Y smooth projective
G-varieties as stated; l ∤ m; [F : k(Y)] prime to l.
Direct prerequisites: MotivicEtaleKTheory:M.5b/nu-variety, SchemeAndStackFoundations:SF.5,
K2SymbolsBrauer:T.2/milnor-k-theory
Proposed namespace: TauCeti.RostMotive
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5c/symmetric-power-operation: Symmetric powers of Tate motives and the
reduced power βP^m (theorem; unchecked).
Let k be a field of characteristic 0, l a prime and R = ℤ/l or ℤ_(l). For a smooth simplicial scheme
𝒳 and a Tate motive M over 𝒳 given with a triangle R(p)[2q] → M → R →α R(p)[2q + 1] (p, q ≥ 0), the
symmetric powers S^i(M), i < l (images of the averaging projector of the symmetric group on M^{⊗i}),
sit in distinguished triangles R(ip)[2iq] → S^i(M) → S^{i−1}(M) → R(ip)[2iq + 1] and
S^{i−1}(M)(p)[2q] → S^i(M) → R → S^{i−1}(M)(p)[2q + 1] (Voevodsky 2011 Lemma 3.1); for i = l − 1
their connecting maps define a natural operation φ_{l−1} : H^{2q+1,p}(−, R) → H^{2ql+2,pl}(−, R),
extended to reduced cohomology of pointed smooth simplicial schemes. Then for every m ≥ 0 there is c
∈ (ℤ/l)^× such that φ_{l−1}(α) = c·βP^m(α) for every pointed smooth simplicial scheme 𝒴 and every α
∈ H̃^{2m+1,m}(𝒴, ℤ/l) (Theorem 3.8), where β is the Bockstein and P^m the reduced power operation of
M.5b/motivic-steenrod-operations.
Hypotheses: k of characteristic 0 (the uniqueness Theorem 2.1 uses the Tate decomposition of motivic
Eilenberg–MacLane spaces over such k).; l prime; coefficients in which every prime other than l is
invertible; symmetric powers only below l.
Direct prerequisites: MotivicEtaleKTheory:M.5b/cech-simplicial-scheme,
MotivicEtaleKTheory:M.5b/motivic-steenrod-operations, MotivicEtaleKTheory:M.5b/steenrod-relations,
MotivicEtaleKTheory:M.5a/effective-motives
Proposed namespace: TauCeti.RostMotive
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum: Hilbert 90 for K^M
implies Beilinson–Lichtenbaum (Voevodsky, Z/2-coefficients paper §§5–6) (theorem; unchecked).
Let k be a field, l a prime different from char k, and w ≥ 0. Write H^{p,q}_L(𝒳, A) = H^p_et(𝒳, A ⊗
ℤ(q)) for Lichtenbaum motivic cohomology (so H^{p,q}_L(𝒳, ℤ/l^ν) ≅ H^p_et(𝒳, μ_{l^ν}^{⊗q}),
M.5a/etale-motivic-comparison), π : (Sm/k)_et → (Sm/k)_Nis, L(q) = τ_{≤q+1}Rπ_*π^*ℤ(q) and K(q) the
cone of ℤ(q) → L(q) (MCZ2 (20)). Say that H90(q, l) holds over k if H^{q+1}_L(F, ℤ_(l)(q)) = 0 for
every field extension F of k (equivalently, by passage to filtered colimits, for every F finitely
generated over k). (a) If H90(q, l) holds over k for every q ≤ w, then K(w) ⊗ ℤ_(l) ≃ 0 (Theorem
6.6); for every smooth simplicial scheme 𝒳 over k the maps H^{p,q}(𝒳, ℤ_(l)) → H^{p,q}_L(𝒳, ℤ_(l))
are isomorphisms for p ≤ q + 1 and monomorphisms for p = q + 2, and H^{p,q}(𝒳, ℤ/l^ν) → H^{p,q}_L(𝒳,
ℤ/l^ν) are isomorphisms for p ≤ q and monomorphisms for p = q + 1, whenever q ≤ w (Corollary 6.9).
(b) Under the same hypothesis, for every field F over k and q ≤ w the norm residue map h^q_F :
K^M_q(F)/l → H^q(F, μ_l^{⊗q}) of galois-symbol-all-degrees is bijective (Corollary 6.10), and for
every cyclic extension E/F of degree l with generator σ the sequence K^M_q(E) →(1 − σ) K^M_q(E)
→N_{E/F} K^M_q(F) is exact (Lemma 6.11). (c) If H90(q, l) holds over k for q ≤ w − 1, X is smooth
over k and U ⊂ X is dense open, then H^*(X, K(w) ⊗ ℤ_(l)) → H^*(U, K(w) ⊗ ℤ_(l)) is an isomorphism
(Lemmas 6.12-6.13). (d) If H90(q, l) holds over k for q ≤ w − 1 and F is a field over k with no
extensions of degree prime to l and K^M_w(F) = l·K^M_w(F), then H^w_et(F, ℤ/l) = 0 (Theorem 5.9) and
H^{w+1}_L(F, ℤ_(l)(w)) = 0.
Hypotheses: k a field; l a prime with l ≠ char k; w ≥ 0.; In the norm residue induction
(hilbert-ninety-induction) k has characteristic 0; part (c) uses the Gysin triangle, which
MotivesAndAlgebraicCycles MC.4 supplies over fields with resolution of singularities.
Direct prerequisites: MotivicEtaleKTheory:M.5a/etale-motivic-comparison,
MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves, MotivicEtaleKTheory:M.5a/effective-motives,
MotivicEtaleKTheory:M.5a/cancellation, MotivicEtaleKTheory:M.5a/cycle-complex-transfers,
MotivicEtaleKTheory:M.5a/imperfect-field-passage, MotivicEtaleKTheory:M.5a/finite-correspondence,
MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees, MotivicEtaleKTheory:M.1/twisted-cohomology-ring,
MotivesAndAlgebraicCycles:MC.4/gysin-triangle, K2SymbolsBrauer:T.4/milnor-projection-formula,
K2SymbolsBrauer:T.4/p-closed-generation, K2SymbolsBrauer:T.4/prime-to-p-closure,
K2SymbolsBrauer:T.4/restriction-transfer-degree,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory
Proposed namespace: TauCeti.NormResidue
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/logarithmic-one-form: Logarithmic one-form (construction; unchecked).
Define logOne:F× (written additively)→Ω_(F/Z) by a↦a⁻¹ da. Its map structure encodes
dlog(ab)=dlog(a)+dlog(b); zero is excluded by the unit domain.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: mathlib:KaehlerDifferential.D, mathlib:Derivation.leibniz,
mathlib:Derivation.map_one_eq_zero
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.logOne_apply [simp]: For a∈F×, logOne(a)=a⁻¹ da.
API TauCeti.DifferentialSymbol.logOne_mul [relation]: For units a,b, logOne(ab)=logOne(a)+logOne(b).
API TauCeti.DifferentialSymbol.logOne_inv [simp]: For a unit a, logOne(a⁻¹)=−logOne(a).
API TauCeti.DifferentialSymbol.logOne_pow [simp]: For a unit a and m≥0, logOne(a^m)=m logOne(a).
Test logOne_test_one [degenerate]: logOne(1)=0.
Test logOne_test_nonzero [non-example]: If da≠0 for a unit a, then logOne(a)≠0; the zero
homomorphism fails this test.
Test logOne_test_inverse [compatibility]: logOne(a⁻¹)+logOne(a)=0 for every unit a.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural: Naturality of the logarithmic
differential (lemma; unchecked).
For a Z-algebra homomorphism f:F→E between fields and a∈F×, the existing semilinear Kaehler map
sends logOne(a) to logOne(fa).
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: MotivicEtaleKTheory:M.5d/logarithmic-one-form,
tauceti:KaehlerDifferential.mapSemilinear, tauceti:KaehlerDifferential.mapSemilinear_D,
tauceti:KaehlerDifferential.mapSemilinear_smul
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/tensor-differential-symbol: Tensor differential symbol (construction;
unchecked).
For n≥0, tensorSymbol is the Z-linear map (F×)^(⊗n)→Ω_F^n sending the pure tensor (a₁,…,a_n) to
dlog(a₁)∧…∧dlog(a_n). Empty wedge means 1∈F under the existing degree-zero exterior equivalence.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: MotivicEtaleKTheory:M.5d/logarithmic-one-form, mathlib:PiTensorProduct.lift,
mathlib:exteriorPower.ιMulti, mathlib:exteriorPower.zeroEquiv, mathlib:exteriorPower.oneEquiv
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.tensorSymbol_pure [simp]: Evaluate a pure tensor as the wedge of its
logarithmic differentials.
API TauCeti.DifferentialSymbol.tensorSymbol_unique [universal-property]: Any Z-linear map with the
same values on every pure tensor equals tensorSymbol.
API TauCeti.DifferentialSymbol.tensorSymbol_update_mul [relation]: Replacing the ith unit by bc
gives the sum of the values with b and c in that position.
Test tensorSymbol_test_zero [degenerate]: In degree zero the empty tensor maps to 1, not 0.
Test tensorSymbol_test_one [compatibility]: Under exteriorPower.oneEquiv the degree-one value is
logOne(a).
Test tensorSymbol_test_repeated [computation]: In degree two the tensor (a,a) maps to zero, in every
characteristic.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/steinberg-vanishing: Vanishing on Steinberg tensors (lemma;
unchecked).
If i≠j and a_i+a_j=1 in F for a tuple of units, tensorSymbol(a₁⊗…⊗a_n)=0. This includes
characteristic two.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: MotivicEtaleKTheory:M.5d/tensor-differential-symbol,
MotivicEtaleKTheory:M.5d/logarithmic-one-form, mathlib:Derivation.map_one_eq_zero,
mathlib:AlternatingMap.map_eq_zero_of_eq
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/milnor-differential-symbol: Differential symbol on Milnor K-theory
(construction; unchecked).
There is a unique additive differentialSymbol:K_n^M(F)→Ω_F^n taking {a₁,…,a_n} to the wedge of
dlog(a_i). The source is the existing T.2 tensor/Steinberg presentation, not an exterior algebra on
F×.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
MotivicEtaleKTheory:M.5d/tensor-differential-symbol, MotivicEtaleKTheory:M.5d/steinberg-vanishing,
mathlib:Submodule.liftQ
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.differentialSymbol_symbol [simp]: The value of {a₁,…,a_n} is
dlog(a₁)∧…∧dlog(a_n).
API TauCeti.DifferentialSymbol.differentialSymbol_quotient [compatibility]: Composing with the
tensor quotient projection is tensorSymbol.
API TauCeti.DifferentialSymbol.differentialSymbol_unique [extensionality]: An additive map from
K_n^M(F) with these values on all symbols equals differentialSymbol.
Test differentialSymbol_test_zero [degenerate]: The empty Milnor symbol maps to 1∈Ω_F^0=F.
Test differentialSymbol_test_one [compatibility]: Under Ω_F^1≃Ω_(F/Z), {a} maps to a⁻¹ da.
Test differentialSymbol_test_repeated [non-example]: The image of {a,a} is zero. This imposes no
assertion that the integral Milnor symbol itself is zero.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/milnor-symbol-natural: Naturality of the Milnor differential symbol
(lemma; unchecked).
For every field homomorphism f:F→E, dlog_E∘K_n^M(f)=Ω^n(f)∘dlog_F as additive homomorphisms; Ω^n(f)
is semilinear over f.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
MotivicEtaleKTheory:M.5d/milnor-differential-symbol,
MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural, DerivedDeRhamCohomology:DD.2/forms-pullback,
DerivedDeRhamCohomology:DD.2/pullback-differential
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/milnor-symbol-product: Products of differential symbols (lemma;
unchecked).
For x∈K_i^M(F) and y∈K_j^M(F), dlog(xy)=dlog(x)∧dlog(y) in Ω_F^(i+j), with x placed before y.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
MotivicEtaleKTheory:M.5d/milnor-differential-symbol,
DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex,
DerivedDeRhamCohomology:DD.2/differential-graded-leibniz
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/characteristic-annihilation: Characteristic annihilates absolute forms
(lemma; unchecked).
For every n≥0 and every ω∈Ω_F^n in characteristic p, pω=0.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: mathlib:exteriorPower.ιMulti
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/mod-p-differential-symbol: Differential symbol modulo p (construction;
unchecked).
Write k_n(F)=K_n^M(F)/pK_n^M(F), the additive quotient by the range of multiplication by p. Define
modPSymbol:k_n(F)→Ω_F^n as the unique map whose composite with reduction is differentialSymbol.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: MotivicEtaleKTheory:M.5d/milnor-differential-symbol,
MotivicEtaleKTheory:M.5d/characteristic-annihilation, mathlib:QuotientGroup.lift,
mathlib:QuotientGroup.mk'
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.modPSymbol_reduce [compatibility]:
modPSymbol([x])=differentialSymbol(x).
API TauCeti.DifferentialSymbol.modPSymbol_unique [universal-property]: An additive map k_n(F)→Ω_F^n
whose composite with reduction is dlog equals modPSymbol.
API TauCeti.DifferentialSymbol.modPSymbol_symbol [simp]: The class of {a₁,…,a_n} maps to the wedge
of the logarithmic differentials.
Test modPSymbol_test_zero [degenerate]: The class of the empty symbol maps to 1, even in
characteristic p.
Test modPSymbol_test_p_multiple [computation]: For any x the class of px maps to zero.
Test modPSymbol_test_one [compatibility]: The class of {a} maps to a⁻¹ da under the degree-one
exterior equivalence.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/artin-schreier-differential: Artin–Schreier differential operator
(construction; unchecked).
Let B_F^0=0 and B_F^n=dΩ_F^(n−1) for n>0 as ADDITIVE subgroups. Import the ordinary de Rham
differential and inverse Cartier C⁻¹:Ω_F^n→Ω_F^n/B_F^n. Define the additive homomorphism
wp=C⁻¹−projection. Its logarithmic coefficient formula is the next lemma. In general wp is not
F-linear.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: DerivedDeRhamCohomology:DD.3, MotivicEtaleKTheory:M.5d/logarithmic-one-form,
mathlib:QuotientGroup.lift, mathlib:QuotientGroup.mk',
DerivedDeRhamCohomology:DD.2/ordinary-differential
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.artinSchreier_apply [data]: wp(ω)=C⁻¹(ω)−[ω].
API TauCeti.DifferentialSymbol.artinSchreier_logarithmic [simp]: For x∈F and units a_i, wp(x∧_i
dlog(a_i))=[(x^p−x)∧_i dlog(a_i)].
API TauCeti.DifferentialSymbol.artinSchreier_add [structure]: wp(ω+η)=wp(ω)+wp(η).
Test artinSchreier_test_zero [degenerate]: In degree zero wp(0)=0.
Test artinSchreier_test_unit [computation]: In degree zero wp(1)=0.
Test artinSchreier_test_not_zero_map [non-example]: If x^p≠x in F then wp(x)≠0 in degree zero, since
B_F^0=0.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula: Artin–Schreier operator on
logarithmic wedges (lemma; unchecked).
For p prime, F of characteristic p, n≥0, x∈F and units a₁,…,a_n, wp(x dlog(a₁)∧…∧dlog(a_n)) is the
class of (x^p−x)dlog(a₁)∧…∧dlog(a_n) in Ω_F^n/B_F^n. For n=0 the wedge is 1 and B_F^0=0.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: MotivicEtaleKTheory:M.5d/artin-schreier-differential,
DerivedDeRhamCohomology:DD.3, MotivicEtaleKTheory:M.5d/logarithmic-one-form
Suggested target: TauCeti.DifferentialSymbol.artinSchreier_logarithmic
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/logarithmic-differential-group: Logarithmic differential forms
(definition; unchecked).
Define ν_n(F)=ker(wp:Ω_F^n→Ω_F^n/B_F^n) as an additive subgroup of Ω_F^n. Its elements satisfy
C⁻¹ω=[ω]. The field-map action is the restriction of DD.2 pullback; it preserves the kernel by
naturality of inverse Cartier. No F-module structure on ν_n is asserted.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: MotivicEtaleKTheory:M.5d/artin-schreier-differential,
DerivedDeRhamCohomology:DD.3, mathlib:MonoidHom.ker,
DerivedDeRhamCohomology:DD.2/ordinary-differential
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.logarithmicForms_mem [characterisation]: ω lies in ν_n(F) exactly
when C⁻¹ω=[ω].
API TauCeti.DifferentialSymbol.logarithmicFormsMap [functoriality]: For a field map f:F→E of
characteristic p, restrict Ω^n(f) to an additive map ν_n(F)→ν_n(E).
API TauCeti.DifferentialSymbol.logarithmicFormsMap_coe [coercion]: The underlying form of the image
is Ω^n(f)(ω).
API TauCeti.DifferentialSymbol.logarithmicFormsMap_id [functoriality]: The identity field map
induces the identity on ν_n.
API TauCeti.DifferentialSymbol.logarithmicFormsMap_comp [functoriality]: The map on ν_n for g∘f is
the composite of those for f and g.
Test logarithmicForms_test_zero [degenerate]: The zero form belongs to ν_n(F) in every degree.
Test logarithmicForms_test_degree_zero [characterisation]: Under Ω_F^0=F, x∈ν_0(F) if and only if
x^p=x.
Test logarithmicForms_test_not_F_submodule [non-example]: If x^p≠x, the scalar multiple x·1 does not
belong to ν_0(F), though 1 does.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/differential-symbol-fixed: Differential symbols are Cartier fixed
(lemma; unchecked).
For every x∈K_n^M(F), differentialSymbol(x) belongs to ν_n(F).
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
MotivicEtaleKTheory:M.5d/milnor-differential-symbol,
MotivicEtaleKTheory:M.5d/artin-schreier-differential,
MotivicEtaleKTheory:M.5d/logarithmic-differential-group,
MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/logarithmic-symbol: Logarithmic symbol modulo p (construction;
unchecked).
Define logarithmicSymbol:k_n(F)→ν_n(F) by corestricting modPSymbol to the Cartier kernel. Its
underlying form is the wedge of logarithmic differentials on each symbol. This construction makes no
assertion yet that it is an isomorphism.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: MotivicEtaleKTheory:M.5d/mod-p-differential-symbol,
MotivicEtaleKTheory:M.5d/differential-symbol-fixed,
MotivicEtaleKTheory:M.5d/logarithmic-differential-group
Proposed namespace: TauCeti.DifferentialSymbol
API TauCeti.DifferentialSymbol.logarithmicSymbol_coe [coercion]: The underlying differential form of
logarithmicSymbol(x) is modPSymbol(x).
API TauCeti.DifferentialSymbol.logarithmicSymbol_unique [universal-property]: Any additive map
k_n(F)→ν_n(F) with this underlying form equals logarithmicSymbol.
API TauCeti.DifferentialSymbol.logarithmicSymbol_symbol [simp]: The underlying form of the class of
{a₁,…,a_n} is ∧_i dlog(a_i).
Test logarithmicSymbol_test_zero [degenerate]: The class of the empty symbol maps to the element
with underlying form 1∈F.
Test logarithmicSymbol_test_one [compatibility]: The class of {a} has underlying one-form a⁻¹ da.
Test logarithmicSymbol_test_repeated [computation]: The class of {a,a} has zero image in ν_2(F).
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/weight-zero-comparison: Degree-zero differential comparison (theorem;
unchecked).
For every field F of characteristic p, logarithmicSymbol:k_0(F)→ν_0(F) is bijective; under
k_0(F)=Z/p and ν_0(F)=F_p it is the identity on the prime field.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
MotivicEtaleKTheory:M.5d/logarithmic-symbol, MotivicEtaleKTheory:M.5d/artin-schreier-differential,
mathlib:exteriorPower.zeroEquiv, mathlib:Int.range_nsmulAddMonoidHom,
mathlib:Int.quotientZMultiplesNatEquivZMod, mathlib:Subfield.mem_bot_iff_pow_eq_self,
MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula, mathlib:mem_bot_iff_intCast
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/perfect-field-differentials: Positive-degree forms over a perfect
field (lemma; unchecked).
Assume the pth-power map on F is surjective. For every n>0, Ω_F^n=0.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: mathlib:Derivation.leibniz_pow,
mathlib:KaehlerDifferential.span_range_derivation, mathlib:exteriorPower.ιMulti_span,
MotivicEtaleKTheory:M.5d/characteristic-annihilation, mathlib:AlternatingMap.map_coord_zero
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/perfect-field-milnor-mod-p: Milnor groups modulo p over a perfect
field (lemma; unchecked).
If the pth-power map on F is surjective, then k_n(F)=0 for every n>0, independently of BGK.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, mathlib:QuotientGroup.mk'
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/weight-one-injectivity: Injectivity of the degree-one differential
symbol (lemma; unchecked).
For every field F of characteristic p, logarithmicSymbol:k_1(F)→ν_1(F) is injective.
Hypotheses: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power
over F of Ω_(F/Z).; All symbol entries are units; degree n is a nonnegative integer.; p is prime and
F has characteristic p.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
MotivicEtaleKTheory:M.5d/logarithmic-symbol, MotivicEtaleKTheory:M.5d/logarithmic-one-form,
DerivedDeRhamCohomology:DD.3, mathlib:exteriorPower.oneEquiv
Proposed namespace: TauCeti.DifferentialSymbol
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/bloch-gabber-kato: Bloch–Gabber–Kato theorem (theorem; unchecked).
For every field F of characteristic p>0 and q≥0, dlog:K^M_q(F)/p →
ν_q(F)=ker(C⁻¹−1:Ω_F^q→Ω_F^q/dΩ_F^(q−1)) is an isomorphism of abelian groups, natural for field
embeddings and compatible with products. The target is an additive group, not an F-vector space.
Hypotheses: p prime; F arbitrary, including imperfect fields; exact forms in degree zero are zero.
Direct prerequisites: MotivicEtaleKTheory:M.5d/logarithmic-symbol,
MotivicEtaleKTheory:M.5d/weight-zero-comparison, MotivicEtaleKTheory:M.5d/weight-one-injectivity,
K2SymbolsBrauer:T.3/higher-milnor-residues, K2SymbolsBrauer:T.4/bass-tate-sequence,
K2SymbolsBrauer:T.4/restriction-transfer-degree, DerivedDeRhamCohomology:DD.3,
MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons
Named target: TauCeti.MotivicEtale.bloch_gabber_kato
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol: Witt logarithmic symbol (construction;
unchecked).
For r≥1 and q≥0 define h_r:K^M_q(F)/p^r→H⁰_et(Spec F,W_rΩ^q_log) by {a₁,…,a_q}↦dlog[a₁]∧…∧dlog[a_q],
where [a] is the Teichmüller unit. Degree zero sends 1 to 1∈Z/p^r. The target is the genuine étale
logarithmic Witt sheaf group supplied by CR.4, independently of the image of h_r.
Hypotheses: F characteristic p, p prime; W_r is p-typical; r≥1; additive Z-module target.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, CrystallineCohomology:CR.4
Named target: TauCeti.MotivicEtale.wittSymbol
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.wittSymbol_symbol [simp]: h_r of a pure Milnor symbol is the displayed
wedge of Teichmüller logarithms.
API TauCeti.MotivicEtale.wittSymbol_restrict [compatibility]: For r≥2, R∘h_r=h_(r−1)∘ρ, with ρ
coefficient reduction.
API TauCeti.MotivicEtale.wittSymbol_insert [compatibility]: For r≥2, h_r∘i=j∘h₁, where
i([a])=[p^(r−1)a].
Test wittSymbol_test_zero [computation]: At q=0, h_r is the canonical Z/p^r identity.
Test wittSymbol_test_perfect [degenerate]: For perfect F and q>0 the source and logarithmic target
vanish.
Test wittSymbol_test_teichmuller [non-example]: In W₂(F₃)=Z/9, [2]+[2]=7 whereas [1]=1; replacing
Teichmüller lifts by an additive map is invalid.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/milnor-coefficient-row: Milnor coefficient row (lemma; unchecked).
For every abelian group A and r≥2, C_r=A/p^rA has the right-exact row C₁ --i→ C_r --ρ→ C_(r−1)→0,
i([a])=[p^(r−1)a], ρ reduction. ker i=(A[p^(r−1)]+pA)/pA. The Tor map A[p^r]→A[p^(r−1)] induced by
reduction is multiplication by p.
Hypotheses: A arbitrary abelian group; p prime; r≥2.
Direct prerequisites: StableHomotopyKTheory:H.6/moore-spectrum-change-of-coefficients,
StableHomotopyKTheory:H.6/bockstein-long-exact-sequence
Named target: TauCeti.MotivicEtale.milnor_coefficient_row
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/prime-power-bgk: Prime-power Bloch–Gabber–Kato theorem (theorem;
unchecked).
For every characteristic-p field F, r≥1 and q≥0, h_r:K^M_q(F)/p^r≃H⁰_et(F,W_rΩ_log^q). In the
diagram of the coefficient row and 0→B₁ --j→B_r --R→B_(r−1), both rows become short exact after the
induction; all h_r commute with coefficient reduction.
Hypotheses: p prime; no perfectness assumption.
Direct prerequisites: MotivicEtaleKTheory:M.5d/bloch-gabber-kato,
MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol, MotivicEtaleKTheory:M.5d/milnor-coefficient-row,
CrystallineCohomology:CR.4
Named target: TauCeti.MotivicEtale.prime_power_bgk
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/milnor-torsion-divisible: Divisibility of residue-characteristic
torsion (theorem; unchecked).
The p-primary torsion subgroup of K^M_q(F) is p-divisible for characteristic-p F. This does not
assert that it is zero, nor that K^M_q(F) itself is p-divisible for imperfect F.
Hypotheses: q≥0; F characteristic p.
Direct prerequisites: MotivicEtaleKTheory:M.5d/prime-power-bgk,
MotivicEtaleKTheory:M.5d/milnor-coefficient-row
Named target: TauCeti.MotivicEtale.milnor_torsion_divisible
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison: Mod-prime motivic comparison (theorem;
unchecked).
Let ℓ≠char F be prime and assume the mod-ℓ norm-residue theorem for all finitely generated
extensions of F and all weights up to j, with its motivic transfers input. Then Z/ℓ(j)→Rα_*μ_ℓ^⊗j on
smooth F-schemes is a quasi-isomorphism through degree j, equivalently Z/ℓ(j)≃τ≤jRα_*μ_ℓ^⊗j. This is
the resolution-free Geisser–Levine form of the Suslin–Voevodsky implication.
Hypotheses: j≥0; α:étale→Zariski; use the genuine M.4 cycle complex and M.5a motivic comparison.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/vanishing-above-weight, MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.5a/cycle-complex-transfers, MotivicEtaleKTheory:M.5a/etale-motivic-comparison,
MotivicEtaleKTheory:M.5c/mod-l-norm-residue,
MotivesAndAlgebraicCycles:MC.4/suslin-friedlander-into-cycle-complex,
MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow
Named target: TauCeti.MotivicEtale.mod_prime_motivic_comparison
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/prime-power-norm-residue: Prime-power norm-residue comparison
(theorem; unchecked).
For ℓ≠char F prime, r≥1 and j≥0, the Galois symbol K^M_j(F)/ℓ^r→H^j(F,Z/ℓ^r(j)) is an isomorphism,
natural for field maps and compatible with products and the coefficient Bocksteins. The coefficient
object is T_ℓ^⊗j/ℓ^r, not a naive tensor of the inclusion μ_ℓ→μ_ℓ^r.
Hypotheses: M.5c supplies mod-ℓ norm residue for every field extension and all weights; M.4 supplies
the diagonal motivic identification.
Direct prerequisites: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison,
MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro, MotivicEtaleKTheory:M.4/vanishing-above-weight,
MotivicEtaleKTheory:M.1/finite-tate-twist, MotivicEtaleKTheory:M.1/adic-tate-twist,
StableHomotopyKTheory:H.6/bockstein-long-exact-sequence
Named target: TauCeti.MotivicEtale.prime_power_norm_residue
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons: Filtered-colimit comparison (theorem;
unchecked).
For a filtered union of fields F=colim F_i, the maps colim K^M_q(F_i)/m→K^M_q(F)/m and colim
H^q(F_i,Z/m(j))→H^q(F,Z/m(j)) are isomorphisms when m is invertible; in characteristic p, colim
ν_q(F_i)≃ν_q(F) and colim H⁰_et(F_i,W_rΩ_log^q)≃H⁰_et(F,W_rΩ_log^q). All symbol maps commute with
these isomorphisms.
Hypotheses: q,j≥0, m≥1; filtered system of field embeddings; fixed finite r in the Witt assertion.
Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory,
DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex, CrystallineCohomology:CR.4,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison,
tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees
Named target: TauCeti.MotivicEtale.filtered_colimit_comparisons
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions: Permitted field reductions
(theorem; unchecked).
For a purely inseparable extension E/F in characteristic p and m coprime to p, restriction is an
isomorphism K^M_q(F)/m≃K^M_q(E)/m and H^q(F,Z/m(j))≃H^q(E,Z/m(j)). General fields reduce to finitely
generated prime-field extensions by the colimit theorem. These reductions do not identify a
residue-characteristic symbol with a prime-to-characteristic one or specialize across
characteristics without a henselian/smooth comparison theorem.
Hypotheses: q,j≥0; m prime to p; arbitrary purely inseparable extensions obtained by filtered union.
Direct prerequisites: MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons,
K2SymbolsBrauer:T.4/restriction-transfer-degree, ArithmeticGaloisDuality:R02.2,
MotivicEtaleKTheory:M.1/field-etale-galois-comparison
Named target: TauCeti.MotivicEtale.inseparable_and_characteristic_reductions
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6a/admissible-k-supports: Admissible K-theory supports (definition;
unchecked).
For X smooth of finite type over a perfect field k and p,r≥0, S_X^(p)(r) is the filtered poset of
closed W⊂X×Δ^r such that codim_(X×F)(W∩(X×F))≥p for every face F of Δ^r, including the whole
simplex. Use Perf_W(X×Δ^r) and its support K-theory spectrum from S.3/S.4; pullbacks along simplex
maps give the simplicial support diagram.
Hypotheses: X smooth, finite-dimensional, separated of finite type over perfect k; codimension
interpreted componentwise; an empty intersection has infinite codimension.
Direct prerequisites: SchemeKTheoryOperations:S.4/codimension-support-filtration,
SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence,
MotivicEtaleKTheory:M.4/algebraic-simplex, MotivicEtaleKTheory:M.4/admissible-cycles
Named target: TauCeti.MotivicEtale.admissibleSupports
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.admissibleSupports_iff [characterisation]: Membership is exactly the
codimension inequality for every face.
API TauCeti.MotivicEtale.admissibleSupports_union [structure]: Finite unions are admissible, giving
a filtered indexing poset.
API TauCeti.MotivicEtale.admissibleSupports_face [functoriality]: Face pullback induces the
indicated support-poset map with the simplicial identities.
Test admissibleSupports_test_empty [degenerate]: The empty support is admissible in every p,r.
Test admissibleSupports_test_zero [computation]: At p=0 every closed support is admissible.
Test admissibleSupports_test_face [non-example]: For X=Spec k, a vertex in Δ¹ has codimension 1 in
Δ¹ but codimension 0 on that face, so it is excluded at p=1.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower: Homotopy coniveau tower (construction;
unchecked).
Define K^(p)(X,r)=hocolim_(W∈S_X^(p)(r))K^W(X×Δ^r), and K^(p)(X)=|r↦K^(p)(X,r)|. Inclusion of
supports defines K^(p+1)→K^(p); the layer is cofib(K^(p+1)→K^(p)), and K→K^(0) is the A¹
augmentation. Nisnevich regularization with supports adapted to each map gives a functorial tower on
Sm/k.
Hypotheses: Same smooth perfect-field class as admissible supports; K is the genuine connective
regular-scheme spectrum, with support fibres; finite k requires A3, verified by finite
restriction/transfer after inverting the extension degree.
Direct prerequisites: MotivicEtaleKTheory:M.6a/admissible-k-supports,
SchemeKTheoryOperations:S.5/homotopy-invariance-regular,
SchemeKTheoryOperations:S.4/nisnevich-excision-square, EnhancedDerivedSheaves:E3,
EnhancedDerivedSheaves:E5:spectra-comparison
Named target: TauCeti.MotivicEtale.coniveauTower
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.coniveauTower_level [data]: The level is the displayed realization of the
support hocolimit.
API TauCeti.MotivicEtale.coniveauTower_transition [projection]: The transition is induced by
S^(p+1)⊂S^(p), commuting with augmentation.
API TauCeti.MotivicEtale.coniveauTower_pullback [functoriality]: Adapted-support moving induces
pullback for smooth-scheme maps, with identity and composition in the homotopy category.
Test coniveauTower_test_zero [characterisation]: K→K^(0) is an equivalence by A¹ invariance.
Test coniveauTower_test_dimension [degenerate]: K^(p)(X,r)=0 for p>dim X+r before realization.
Test coniveauTower_test_field_layer [computation]: For Spec k the weight-zero layer is HZ, so the
constant zero tower is excluded.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6a/moving-and-excision: Moving and excision theorem (theorem; unchecked).
On the stated smooth perfect-field K-theory setting, the adapted-support inclusion for f:Y→X induces
equivalences K^(p)(X)_f≃K^(p)(X), and the localized support sequence for a closed Z⊂X and U=X−Z is a
fibre sequence. The induced layer maps are natural in the corresponding good-position supports.
Hypotheses: K satisfies A1 homotopy invariance, A2 Nisnevich excision and A3 finite-field degree
descent; localization uses the base restrictions in Levine Theorem 3.2.1 (over a field its
infinite-residue version, finite fields via A3).
Direct prerequisites: MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower,
SchemeKTheoryOperations:S.4/nisnevich-excision-square,
SchemeKTheoryOperations:S.6/support-product-pairings
Named target: TauCeti.MotivicEtale.moving_and_excision
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6a/k-theory-well-connected: Well-connected K-theory (theorem; unchecked).
K on smooth perfect-field schemes is well connected: support spectra used in the tower are
connective, and the P¹-loop iterates have no nonzero homotopy in degrees other than zero on the
indicated multirelative semilocal simplices. Their degree-zero cycle maps give the codimension-p
cycle generators.
Hypotheses: Levine Definition 6.1.1 well-connectedness; semilocal Δ with all faces and their
boundary; regular ambient schemes, not arbitrary singular K-theory.
Direct prerequisites: MotivicEtaleKTheory:M.6a/moving-and-excision,
SchemeKTheoryOperations:S.5/projective-bundle-theorem,
SchemeKTheoryOperations:S.5/negative-k-vanishing-regular
Named target: TauCeti.MotivicEtale.k_theory_well_connected
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6a/coniveau-cycle-layer: Coniveau cycle-layer comparison (theorem;
unchecked).
For p≥0 and X in the smooth perfect-field class, cofib(K^(p+1)(X)→K^(p)(X))≃H(z^p(X,•)), the
Eilenberg–Mac Lane spectrum of Bloch’s homological cycle complex. Therefore π_m of this layer is
CH^p(X,m)=H^(2p−m)(X,Z(p)). Face maps have the intersection multiplicities of the cycle complex.
Hypotheses: Bloch cycle complex and motivic identification imported from M.4; no
resolution-of-singularities assumption in Levine 2008 Theorem 6.4.2.
Direct prerequisites: MotivicEtaleKTheory:M.6a/k-theory-well-connected,
MotivicEtaleKTheory:M.6a/moving-and-excision, MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/localization-sequence, MotivicEtaleKTheory:M.4/moving-lemma
Named target: TauCeti.MotivicEtale.coniveau_cycle_layer
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6a/global-model-comparison: Global motivic model comparison (theorem;
unchecked).
For smooth quasi-projective X over a perfect field, the regularized homotopy-coniveau model and the
Friedlander–Suslin global support model admit a natural filtered zigzag of equivalences compatible
with K augmentation and the cycle maps. Hence their reindexed spectral sequences agree. This claim
requires a filtered comparison, not merely agreement of E₂ pages.
Hypotheses: Common smooth quasi-projective perfect-field range; global Zariski/Nisnevich derived
sections, actual tower maps and their homotopies.
Direct prerequisites: MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower,
MotivicEtaleKTheory:M.6a/coniveau-cycle-layer
Named target: TauCeti.MotivicEtale.global_model_comparison
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6b/motivic-exact-couple: Motivic exact couple (construction; unchecked).
Apply the generic tower exact-couple functor to K^(p+1)→K^(p)→L^p. With D₁^(p,m)=π_mK^(p),
E₁^(p,m)=π_mL^p, take i:D₁^(p+1,m)→D₁^(p,m), j:D₁^(p,m)→E₁^(p,m), k:E₁^(p,m)→D₁^(p+1,m−1).
Derivation gives d_s:E_s^(p,m)→E_s^(p+s,m−1), and after the conventional page renumbering
E₂^(a,b)=H^(a−b)(X,Z(−b)).
Hypotheses: Actual support tower; H.6 exact-couple convention transported by s=−p, with the motivic
E₂ page equal to the raw tower E₁; q=−b, m=−a−b.
Direct prerequisites: MotivicEtaleKTheory:M.6a/coniveau-cycle-layer,
StableHomotopyKTheory:H.6/exact-couple,
StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence
Named target: TauCeti.MotivicEtale.motivicCouple
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.motivicCouple_D [data]: D is the homotopy of the tower level in the stated
raw indexing.
API TauCeti.MotivicEtale.motivicCouple_E [data]: E is the homotopy of the actual cycle layer.
API TauCeti.MotivicEtale.motivicCouple_differential [projection]: Differentials come from k,
iterated lifts through i, then j; motivic bidegree is (r,1−r).
Test motivicCouple_test_indices [computation]: a=−m+j,b=−j gives H^(2j−m)(X,Z(j)) and total K_m.
Test motivicCouple_test_boundary [compatibility]: At the raw first page the map is j∘k and squares
to zero by triangle exactness.
Test motivicCouple_test_zero_weight [degenerate]: Weight j=0 has no incoming negative-weight layer;
it is not a second independent K-spectrum.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6b/motivic-strong-convergence: Strong convergence of the motivic tower
(theorem; unchecked).
For X smooth of dimension d over a perfect field and each m≥0, π_mK^(p)(X)=0 for p>d+m.
K^(0)(X)≃K(X), and holim_p K^(p)(X)=0, including its Milnor lim¹ obstruction. The induced filtration
on K_m(X) is finite, exhaustive and separated; the motivic spectral sequence strongly converges to
K_m(X).
Hypotheses: Finite d; connective support K spectra and geometric realization; no such claim for an
arbitrary unbounded spectrum or an infinite-dimensional scheme.
Direct prerequisites: MotivicEtaleKTheory:M.6a/k-theory-well-connected,
MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower, MotivicEtaleKTheory:M.6b/motivic-exact-couple,
StableHomotopyKTheory:H.6/milnor-sequence
Named target: TauCeti.MotivicEtale.motivic_strong_convergence
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6b/filtered-motivic-products: Filtered motivic products (theorem;
unchecked).
The support tensor product and moving of pairs give K^(p)(X)∧K^(q)(X)→K^(p+q)(X), compatible with
the tower and layer cup products. Thus the motivic spectral sequence is multiplicative and d_r is a
graded derivation; it acts as a module spectral sequence on finite coefficients. An intrinsic
product on finite coefficients requires its actual chosen multiplication and coherence. The imported
Moore-spectrum ring theorem supplies this for prime powers outside {2,3,4,8}; the module action of
integral K on coefficients does not require such a coefficient-ring structure.
Hypotheses: Smooth perfect-field X; product supports must first be moved into proper intersection;
finite coefficient coherence stated separately.; No unital product is inferred on S/2; no
associative/commutative product is inferred from the imported theorem at the exceptional levels
3,4,8. Any stronger K-specific product needs a separate supplier theorem.
Direct prerequisites: MotivicEtaleKTheory:M.6a/moving-and-excision,
MotivicEtaleKTheory:M.6b/motivic-exact-couple, SchemeKTheoryOperations:S.6/support-product-pairings,
StableHomotopyKTheory:H.6/moore-spectrum-multiplication, MotivicEtaleKTheory:M.4/products,
MotivicEtaleKTheory:M.4/moving-lemma, MotivicEtaleKTheory:M.4/cubical-cycle-complex
Named target: TauCeti.MotivicEtale.filtered_motivic_products
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6b/filtered-adams-operations: Filtered Adams operations (theorem;
unchecked).
For k≥2, the imported Adams operation ψ^k on K extends to the motivic support tower in the proven
regular finite-dimensional smooth-field setting. It commutes with transition/boundary maps and acts
by k^j on E₂^(a,−j)=H^(a+j)(X,Z(j)). The operation on the abutment is the actual scheme ψ^k.
Hypotheses: Same scheme class; support operations and Adams–Riemann–Roch normalizations imported
from S.6/S.7.
Direct prerequisites: MotivicEtaleKTheory:M.6a/coniveau-cycle-layer,
MotivicEtaleKTheory:M.6b/motivic-exact-couple,
SchemeKTheoryOperations:S.6/scheme-adams-multiplicative,
SchemeKTheoryOperations:S.7/gamma-chern-character
Named target: TauCeti.MotivicEtale.filtered_adams_operations
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6b/rational-motivic-degeneration: Rational motivic degeneration (theorem;
unchecked).
After tensoring by Q all differentials d_r for r≥2 vanish. For fixed total degree m the finite
filtration on K_m(X)_Q splits canonically into Adams eigenspaces of weights 0≤j≤d+m. The weight-j
piece is its cycle-layer quotient.
Hypotheses: Smooth perfect-field X of dimension d; m≥0; rational coefficients, with ψ^k for k≥2.
Direct prerequisites: MotivicEtaleKTheory:M.6b/filtered-adams-operations,
MotivicEtaleKTheory:M.6b/motivic-strong-convergence
Named target: TauCeti.MotivicEtale.rational_motivic_degeneration
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6/motivic-spectral-sequence: Motivic spectral sequence (construction;
unchecked).
Assemble the actual coniveau exact couple, cycle-layer comparison and strong convergence into
E₂^(a,b)=H^(a−b)(X,Z(−b))⇒K_(−a−b)(X), b≤0, with d_r of bidegree (r,1−r). This is the same tower,
not another definition of K or motivic cohomology.
Hypotheses: X smooth separated finite type over a perfect field, dim X finite; m=−a−b≥0; for the FS
comparison require quasi-projectivity.
Direct prerequisites: MotivicEtaleKTheory:M.6b/motivic-exact-couple,
MotivicEtaleKTheory:M.6a/coniveau-cycle-layer, MotivicEtaleKTheory:M.6b/motivic-strong-convergence,
MotivicEtaleKTheory:M.6b/filtered-motivic-products,
MotivicEtaleKTheory:M.6b/filtered-adams-operations
Named target: TauCeti.MotivicEtale.motivicSequence
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.motivicSequence_pageTwo [equivalence]: The displayed E₂ page is motivic
cohomology with its cycle-complex shift.
API TauCeti.MotivicEtale.motivicSequence_abutment [equivalence]: The finite filtration abuts to the
genuine K_m(X) in the stated range.
API TauCeti.MotivicEtale.motivicSequence_pullback [functoriality]: Smooth-scheme pullbacks preserve
the filtered sequence; identity/composition agree with the tower maps.
Test motivicSequence_test_field_diagonal [computation]: For a field and a=0,b=−j the page term is
K^M_j(F), using M.4.
Test motivicSequence_test_weight_zero [degenerate]: At a=b=0 the term is H⁰(X,Z(0)); the rank edge
is the usual K₀ rank.
Test motivicSequence_test_finite_field [compatibility]: For F_q, the finite-field motivic input
recovers K_(2j−1)(F_q)=Z/(q^j−1) and K_(2j)(F_q)=0 for j≥1.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.6/rational-weight-comparison: Rational K-theory weight comparison
(theorem; unchecked).
For the stated smooth finite-dimensional perfect-field X, m,j≥0, K_m(X)_Q^(j)≃H^(2j−m)(X,Q(j)),
natural for smooth-scheme maps and products. Both sides vanish for j>d+m. The isomorphism is the
normalized higher motivic Chern character, with no factorial ambiguity.
Hypotheses: The eigenspace is simultaneous ψ^k=k^j, k≥2; normalization in positive K degree is
ch_(j,m)=(-1)^(j−1)c_(j,m)/(j−1)! for j≥1, while degree-zero ch_j uses Newton polynomials/j!.
Direct prerequisites: MotivicEtaleKTheory:M.6b/rational-motivic-degeneration,
MotivicEtaleKTheory:M.6/motivic-spectral-sequence,
SchemeKTheoryOperations:S.7/gamma-chern-character, SchemeKTheoryOperations:S.7/chern-character,
SchemeKTheoryOperations:S.7/chern-character-ring-homomorphism
Named target: TauCeti.MotivicEtale.rational_weight_comparison
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/beilinson-lichtenbaum: Beilinson–Lichtenbaum comparison (theorem;
unchecked).
For X smooth over a field, m≥1 invertible in the field and j≥0, the motivic cycle map gives
Z/m(j)≃τ≤jRα_*μ_m^⊗j. Consequently H^a(X,Z/m(j))→H_et^a(X,μ_m^⊗j) is an isomorphism for a≤j and an
injection for a=j+1. This is the explicit bridge from norm residue and cycle complexes to finite
coefficient E₂ pages.
Hypotheses: Genuine M.4 motivic complex; α étale→Zariski; full prime-power norm residue and the
resolution-free field implication.
Direct prerequisites: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison,
MotivicEtaleKTheory:M.5d/prime-power-norm-residue, MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/vanishing-above-weight,
MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes,
MotivicEtaleKTheory:M.5a/cycle-complex-transfers, MotivicEtaleKTheory:M.5a/etale-motivic-comparison,
MotivesAndAlgebraicCycles:MC.4/suslin-friedlander-into-cycle-complex,
MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow
Named target: TauCeti.MotivicEtale.beilinson_lichtenbaum
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/dedekind-motivic-comparison: Dedekind motivic comparison (theorem;
unchecked).
Let B be a Dedekind scheme, X equidimensional and essentially smooth over B, and m invertible on B.
The cycle map Z/m(j)_et≃μ_m^⊗j is a quasi-isomorphism; H^a(X,Z/m(j))→H_et^a(X,μ_m^⊗j) is an
isomorphism for a≤j. In particular these assertions hold on Spec O_(F,S)[1/ℓ] for m=ℓ^r.
Hypotheses: j≥0; use the genuine mixed-base cycle complex and its localization/purity statements;
Geisser 2004 Theorem 1.2 is conditional on norm residue, now supplied.
Direct prerequisites: MotivicEtaleKTheory:M.7/beilinson-lichtenbaum,
MotivicEtaleKTheory:M.4/dedekind-cycle-complex, MotivicEtaleKTheory:M.4/dedekind-gersten,
MotivicEtaleKTheory:M.4/purity-gysin-triangle, MotivicEtaleKTheory:M.4/zariski-descent,
ArithmeticGaloisDuality:R02.3
Named target: TauCeti.MotivicEtale.dedekind_motivic_comparison
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/finite-etale-k-theory: Finite étale K-theory (construction; unchecked).
For the stated schemes and m invertible, define K^et(X;Z/m) as derived étale sections of the
hypercomplete periodic finite-coefficient K-theory sheaf. The canonical map K(X)/m→K^et(X;Z/m) comes
from sheafification and Bott periodicization. Its local homotopy sheaves are μ_m^⊗j in degree 2j,
for all integer j, and zero in odd degrees. Coefficients/completion are those of H.6, not underived
tensor products of K-groups.
Hypotheses: For descent/convergence here restrict to fields of finite ℓ-cd with the stated Thomason
field hypothesis, or O_(F,S)[1/ℓ] at odd ℓ (and totally imaginary F at ℓ=2); m=ℓ^r. The
carrier/construction of hypercomplete sheaves of spectra is requested from E5.
Direct prerequisites: KTheoryFiniteLocalFields:L.2/gabber-rigidity,
StableHomotopyKTheory:H.6/coefficient-spectrum, EnhancedDerivedSheaves:E3,
EnhancedDerivedSheaves:E5:spectra-comparison, EnhancedDerivedSheaves:E2
Named target: TauCeti.MotivicEtale.etaleK
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.etaleK_compare [projection]: The ordinary-to-étale comparison is induced by
the sheafification and periodicization maps.
API TauCeti.MotivicEtale.etaleK_hyperdescent [characterisation]: Derived sections send an étale
hypercover to the corresponding homotopy limit.
API TauCeti.MotivicEtale.etaleK_coefficients [compatibility]: Reduction maps commute with comparison
and the coefficient Bockstein triangles.
Test etaleK_test_separable_closed [computation]: On a separably closed field with ℓ invertible,
π_(2j)=Z/ℓ^r(j), π_(2j+1)=0 for every integer j.
Test etaleK_test_rank [compatibility]: In degree zero over that field the comparison sends the unit
class to 1.
Test etaleK_test_periodic [non-example]: Its π_(-2) is Z/ℓ^r(−1); a connective K spectrum with
negative groups zero fails this test.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/bott-etale-descent: Bott-inverted étale descent (theorem; unchecked).
For X=Spec F with finite ℓ-cohomological dimension and Thomason’s Tate–Tsen filtration hypothesis,
or X=Spec O_(F,S)[1/ℓ] at odd ℓ, Bott-inverted K(X;Z/ℓ^r) agrees with the periodic étale target. The
convergent descent sequence is E₂^(s,t)=H_et^s(X,Z/ℓ^r(t/2))⇒K^et_(t−s)(X;Z/ℓ^r), t even, s≥0, with
d_r of bidegree (r,r−1).
Hypotheses: ℓ odd in the FGV Bott-telescope proof; for dyadic totally imaginary schemes use the
separately requested Thomason version, not an odd-prime telescope without modification. Finite ℓ-cd
is the convergence bound.
Direct prerequisites: MotivicEtaleKTheory:M.7/finite-etale-k-theory,
StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence, ArithmeticGaloisDuality:R02.3
Named target: TauCeti.MotivicEtale.bott_etale_descent
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range: Quillen–Lichtenbaum field range
(theorem; unchecked).
For a field F with ℓ invertible, finite d=cd_ℓ(F) and the preceding Thomason field hypothesis,
K_n(F;Z/ℓ^r)→K^et_n(F;Z/ℓ^r) is an isomorphism for n≥d−1 and an injection for n=d−2, in nonnegative
degrees. The ℓ-adic spectrum comparison in this range is obtained by derived inverse limits with the
boundary range checked one degree higher.
Hypotheses: ℓ odd for the read FGV proof; r≥1; d finite; extension to every admissible dyadic field
needs the specified Thomason proof.
Direct prerequisites: MotivicEtaleKTheory:M.7/beilinson-lichtenbaum,
MotivicEtaleKTheory:M.6/motivic-spectral-sequence, MotivicEtaleKTheory:M.7/bott-etale-descent,
StableHomotopyKTheory:H.6/milnor-sequence
Named target: TauCeti.MotivicEtale.quillen_lichtenbaum_field_range
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/s-integer-comparison-range: S-integer comparison range (theorem;
unchecked).
For a number field F, finite S, and odd ℓ, set R=O_(F,S)[1/ℓ]. K_n(R;Z/ℓ^r)→K^et_n(R;Z/ℓ^r) is an
isomorphism for n≥1 and an injection for n=0. The map K_n(O_(F,S))^∧_ℓ→K_n(R)^∧_ℓ is an isomorphism
for n≥2; it is not asserted in degree one. At ℓ=2 the analogous finite-cd formulation requires F
totally imaginary.
Hypotheses: r≥1; genuine derived ℓ-completion; finite residue-field K calculation and arithmetic
cd=2 supplied by their owners.
Direct prerequisites: MotivicEtaleKTheory:M.7/dedekind-motivic-comparison,
MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range,
KTheoryFiniteLocalFields:L.1/finite-field-mod-m-groups,
GeneralAlgebraicKTheory:K.3/abelian-localization-theorem,
GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, ArithmeticGaloisDuality:R02.3,
MotivicEtaleKTheory:M.2/high-degree-real-isomorphism,
MotivicEtaleKTheory:M.2/adic-s-integer-cohomology
Named target: TauCeti.MotivicEtale.s_integer_comparison_range
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/arithmetic-adic-degrees: Arithmetic ℓ-adic comparison (theorem;
unchecked).
For R=O_(F,S)[1/ℓ], ℓ odd (or ℓ=2 and F totally imaginary) and j≥2,
π_(2j−1)(K(R)^∧_ℓ)≃H¹_cont(R,Z_ℓ(j)) and π_(2j−2)(K(R)^∧_ℓ)≃H²_cont(R,Z_ℓ(j)). Finite generation
further identifies these completed homotopy groups with K_(2j−1)(R)⊗Z_ℓ and K_(2j−2)(R)⊗Z_ℓ. The
same n≥2 outputs apply before inverting ℓ.
Hypotheses: Continuous cohomology uses derived inverse limit of μ_ℓ^r^⊗j; arithmetic H⁰
positive-twist invariants vanish; H^s=0 for s>2 in this coefficient regime.
Direct prerequisites: MotivicEtaleKTheory:M.7/s-integer-comparison-range,
StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence,
StableHomotopyKTheory:H.6/completion-finite-type,
ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers,
MotivicEtaleKTheory:M.1/adic-tate-twist, MotivicEtaleKTheory:M.1/continuous-limit-comparison,
MotivicEtaleKTheory:M.1/etale-twist-sheaf, MotivicEtaleKTheory:M.1/s-integer-galois-comparison,
ArithmeticGaloisDuality:R02.3, MotivicEtaleKTheory:M.2/high-degree-real-isomorphism,
MotivicEtaleKTheory:M.2/adic-s-integer-cohomology
Named target: TauCeti.MotivicEtale.arithmetic_adic_degrees
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/etale-adams-weights: Étale Adams weights (theorem; unchecked).
For a prime-to-ℓ integer a, ψ^a acts on the finite periodic étale homotopy sheaf Z/ℓ^r(j) by a^j and
therefore on every descent term by the same scalar. Dualization ψ^(−1) acts by (−1)^j. The
comparison map intertwines these operations.
Hypotheses: Same finite coefficient and descent range; a is a unit modulo ℓ; operations with a
divisible by ℓ are not asserted to preserve Bott inversion.
Direct prerequisites: MotivicEtaleKTheory:M.7/bott-etale-descent,
MotivicEtaleKTheory:M.6b/filtered-adams-operations
Named target: TauCeti.MotivicEtale.etale_adams_weights
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/etale-k-transfer: Étale K-theory transfer comparison (theorem;
unchecked).
For finite étale f:Y→X in the stated regular finite-cd setting, the genuine K-theory transfer and
étale corestriction form a map of the Bott/étale descent sequences. Under the arithmetic single-term
identifications, transfer on K_(2j−1)^∧_ℓ and K_(2j−2)^∧_ℓ is corestriction on H¹(Z_ℓ(j)) and
H²(Z_ℓ(j)). A ramified Dedekind transfer requires the finite-perfect pushforward and supported
purity comparison, and is not assumed to commute with duality without its different-line correction.
Hypotheses: Finite étale first; for number-field transfer localize every ramified prime in S.
Projection formula and Tate twists use one arithmetic Frobenius convention.
Direct prerequisites: MotivicEtaleKTheory:M.7/bott-etale-descent,
MotivicEtaleKTheory:M.7/arithmetic-adic-degrees,
SchemeKTheoryOperations:S.6/finite-etale-transfer-adams,
GeneralAlgebraicKTheory:K.3/abelian-localization-theorem,
GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, ArithmeticGaloisDuality:R02.2
Named target: TauCeti.MotivicEtale.etale_k_transfer
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/number-ring-duality-sign: Number-ring duality sign (theorem;
unchecked).
For O a ring of S-integers in a number field and n≥2, the C₂-actions on K induced by the symmetric
Poincaré structures Q^s and Q^s_− on perfect complexes both act as multiplication by (−1)^n on
K_(2n−1)(O)[1/2] and K_(2n−2)(O)[1/2]. This plans only the routed Lemma 3.2.4, not general hermitian
K-theory.
Hypotheses: O as stated; inversion of 2; underlying dualizing equivalences for the two Poincaré
structures coincide.
Direct prerequisites: MotivicEtaleKTheory:M.7/arithmetic-adic-degrees,
MotivicEtaleKTheory:M.7/etale-adams-weights,
ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers,
GeneralAlgebraicKTheory:K.2
Named target: TauCeti.MotivicEtale.number_ring_duality_sign
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/suslin-real-comparison: Suslin real comparison (theorem; unchecked).
For every m≥1 and n≥1, the comparison from algebraic to topological real K-theory gives
K_n(R;Z/m)≃π_n(BO;Z/m). This statement precedes all dyadic real-place calculations and uses the real
BO/KO Bott-periodic carrier supplied by RefinedTraceMethods.
Hypotheses: R is the real numbers; finite coefficients are Moore homotopy coefficients, not
π_n(BO)⊗Z/m; degree zero handled separately by rank.
Direct prerequisites: KTheoryFiniteLocalFields:L.2/gabber-rigidity, GeneralAlgebraicKTheory:K.2,
RefinedTraceMethods:RT.4
Named target: TauCeti.MotivicEtale.suslin_real_comparison
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/real-mod-two-sequence: Real mod-2 motivic sequence (theorem;
unchecked).
For R, the mod-2 motivic sequence has E₂^(a,b)=F₂ in b≤a≤0. Its d₂ maps with nonzero source in
columns a≡1,2 mod 4 are isomorphisms, and it degenerates at E₃. For n≥1, K_n(R;Z/2) has period-eight
orders 2,4,2,2,1,1,1,2 for n≡1,2,3,4,5,6,7,0 respectively; K_(8k+2)(R;Z/2)=Z/4 is the nontrivial
extension.
Hypotheses: M.4 supplies the real motivic page, H.6 supplies finite coefficient homotopy, and RT.4
supplies real Bott periodicity. Use integral spectral-sequence module action, not a nonexistent
natural mod-2 K-ring product.
Direct prerequisites: MotivicEtaleKTheory:M.7/suslin-real-comparison,
MotivicEtaleKTheory:M.6/motivic-spectral-sequence,
MotivicEtaleKTheory:M.6b/filtered-motivic-products, MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/weight-zero-and-one, MotivicEtaleKTheory:M.4/products,
RefinedTraceMethods:RT.4
Named target: TauCeti.MotivicEtale.real_mod_two_sequence
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/real-place-correction: Real-place correction sequence (construction;
unchecked).
For R=O_(F,S) with 1/2∈R and r₁ real embeddings, form the map of motivic K coefficient towers
K(R;Z/2^∞)→⊕_σK(R;Z/2^∞). On cohomology write α_s(j):H^s(R,Q₂/Z₂(j))→⊕_σH^s(R,Q₂/Z₂(j)) and H̃¹=ker
α₁. Its fibre long exact sequence is the corrected real-place comparison; retain the connecting maps
and the induced filtration extensions.
Hypotheses: Arithmetic real-place Tate/Poitou–Tate comparison from M.2/D7; ordinary real Galois
cohomology has infinite cd₂, so it is not the finite-cd odd-prime argument. Finite direct sum of
real spectra.
Direct prerequisites: MotivicEtaleKTheory:M.7/real-mod-two-sequence,
MotivicEtaleKTheory:M.2/real-restriction-map,
MotivicEtaleKTheory:M.2/positive-and-modified-cohomology,
MotivicEtaleKTheory:M.2/high-degree-real-isomorphism, ArithmeticGaloisDuality:D7,
StableHomotopyKTheory:H.6/qp-zp-coefficients
Named target: TauCeti.MotivicEtale.realCorrection
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.realCorrection_triangle [structure]: The correction spectrum sits in the
defining fibre triangle and its long exact homotopy sequence.
API TauCeti.MotivicEtale.realCorrection_pageMap [compatibility]: The page map is α_(a−b)(−b), with
the stated ordinary/Tate real-place conventions.
API TauCeti.MotivicEtale.realCorrection_kernel [characterisation]: The critical cohomology term H̃¹
is precisely ker α₁, without a chosen complement.
Test realCorrection_test_imaginary [degenerate]: If r₁=0 the real target is zero and the correction
fibre is K(R;Z/2∞).
Test realCorrection_test_real_higher [computation]: For s≥3, α_s is an isomorphism in the
Tate/Poitou–Tate range used by the source.
Test realCorrection_test_extension [non-example]: At n≡5 mod 8 a quotient and kernel do not specify
a direct-sum decomposition; the extension class must be retained.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions: Dyadic S-integer extensions (theorem;
unchecked).
For F with r₁>0 real places and R=O_(F,S) containing 1/2, K_n(R;Q₂/Z₂) has the following mod-eight
description: n=8k: Z/w_(4k)(F){2}; 8k+1: H¹(R,Q₂/Z₂(4k+1)); 8k+2: Z/2; 8k+3: H¹(R,Q₂/Z₂(4k+2));
8k+4: Z/(2w_(4k+2)(F){2})⊕(Z/2)^(r₁−1); 8k+5: an extension 0→(Z/2)^(r₁−1)→K_n→H¹(R,Q₂/Z₂(4k+3))→0;
8k+6:0; 8k+7:H̃¹(R,Q₂/Z₂(4k+4)). In the n=0 slot H⁰(R,Q₂/Z₂(0))=Q₂/Z₂ replaces the finite
positive-weight notation. No splitting is asserted in the 8k+5 case.
Hypotheses: n≥0; k≥0; w_j(F){2}=|H⁰(F,Q₂/Z₂(j))| for j>0; modified real and coefficient conventions
as in the correction construction.
Direct prerequisites: MotivicEtaleKTheory:M.7/real-place-correction,
MotivicEtaleKTheory:M.7/real-mod-two-sequence, ArithmeticGaloisDuality:R02.4,
ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers,
MotivicEtaleKTheory:M.2/real-restriction-map, MotivicEtaleKTheory:M.2/high-degree-real-isomorphism,
MotivicEtaleKTheory:M.2/adic-s-integer-cohomology
Named target: TauCeti.MotivicEtale.dyadic_s_integer_extensions
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/finite-etale-chern: Finite étale Chern maps (construction; unchecked).
For a regular scheme X with m invertible, i≥1 and n≥1, construct the additive higher Chern map
c_(i,n):K_n(X;Z/m)→H_et^(2i−n)(X,μ_m^⊗i). It is defined from universal equivariant Chern classes,
independently of p-adic Hodge theory and Borel regulators. The n=0 ordinary Chern classes obey
Whitney sum rather than additivity. On the Milnor diagonal c_(i,i) sends a pure symbol to
(−1)^(i−1)(i−1)! times the cup of its Kummer classes.
Hypotheses: Use schemes admitted by the universal projective-bundle and twisted-duality
constructions; m≥2 is invertible on X; no division by a factorial in Z/m. Finite-coefficient
products are only used for m odd or 8 dividing m, as in the source.
Direct prerequisites: GeneralAlgebraicKTheory:K.2,
SchemeKTheoryOperations:S.7/gamma-chern-character, MotivicEtaleKTheory:M.1/finite-tate-twist,
MotivicEtaleKTheory:M.1/etale-twist-sheaf, MotivicEtaleKTheory:M.4/products,
MotivicEtaleKTheory:M.4/projective-bundle-formula,
StableHomotopyKTheory:H.6/bockstein-long-exact-sequence
Named target: TauCeti.MotivicEtale.finiteChern
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.finiteChern_natural [compatibility]: Pullback commutes with c_(i,n)
whenever the K/cohomology pullbacks are defined.
API TauCeti.MotivicEtale.finiteChern_bockstein [compatibility]: For i=1,n=2, c_(1,2) is the
coefficient boundary applied to determinant, as in the displayed Bockstein diagram.
API TauCeti.MotivicEtale.finiteChern_milnor [simp]: On a degree-i Milnor symbol,
c_(i,i)=(−1)^(i−1)(i−1)! times the cup-Kummer symbol.
Test finiteChern_test_unit [computation]: c_(1,1)(u) is the Kummer class of det(u).
Test finiteChern_test_bott [compatibility]: For a primitive m-th root ζ and its Bott lift β,
c_(1,2)(β)=ζ, while c_(1,2)(image K₂/m)=0.
Test finiteChern_test_factorial [non-example]: c_(2,2) on a two-unit symbol is minus the cup-Kummer
symbol; treating every c_(i,n) as a multiplicative character fails this sign test.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/motivic-chern-character: Motivic Chern character (construction;
unchecked).
For smooth quasi-projective X over a field, construct integral c_(i,n):K_n(X)→H_M^(2i−n)(X,Z(i)) for
n≥1 and the rational additive character ch_(i,n):K_n(X)⊗Q→H_M^(2i−n)(X,Q(i)). Its positive-degree
normalization is ch_(i,n)=(−1)^(i−1)c_(i,n)/(i−1)!; at n=0 it is the Newton polynomial in ordinary
Chern classes divided by i!. The total character respects products and rational Adams weights and
identifies the rational weight-j summand from M.6.
Hypotheses: i≥1 for positive-degree displayed normalization; weight zero at K₀ is rank; smooth
quasi-projective scheme class from the cited theorem.
Direct prerequisites: MotivicEtaleKTheory:M.6/rational-weight-comparison,
MotivicEtaleKTheory:M.6b/filtered-motivic-products, MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/products, MotivicEtaleKTheory:M.4/projective-bundle-formula,
SchemeKTheoryOperations:S.7/gamma-chern-character,
SchemeKTheoryOperations:S.7/grothendieck-riemann-roch
Named target: TauCeti.MotivicEtale.motivicChern
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.motivicChern_positive [simp]: For n>0, (i−1)! ch_(i,n)=(−1)^(i−1)c_(i,n)
after rationalization.
API TauCeti.MotivicEtale.motivicChern_product [compatibility]: ch_i(xy)=Σ_(a+b=i) ch_a(x)∪ch_b(y),
with degrees 2a−m and 2b−n adding to 2i−m−n.
API TauCeti.MotivicEtale.motivicChern_weight [characterisation]: On K_m(X)_Q^(j), ch_j is the M.6
weight-j comparison and ch_i=0 for i≠j.
Test motivicChern_test_rank [degenerate]: At m=i=0, ch₀ is rank.
Test motivicChern_test_line [computation]: For a line bundle L, ch_i([L])=c₁(L)^i/i!.
Test motivicChern_test_milnor [compatibility]: The normalized degree-i character sends a Milnor
symbol to itself in H_M^i(F,Q(i)); the integral Chern class retains (−1)^(i−1)(i−1)!.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/supported-cycle-character: Supported cycle Chern character (theorem;
unchecked).
Let 𝒳 be regular, proper and flat over O_K with smooth generic fibre, and let ℓ be invertible in its
residue characteristic. The supported Gillet cycle-character map cl gives
F^dK₀^Z(𝒳)→H_Z^(2d)(𝒳,Q_ℓ(d)); on the generic fibre X the map agrees with the refined étale cycle
class of a codimension-d cycle, by Lemma B.6. The lemma is not asserted for arbitrary vertical
cycles on 𝒳. Supported products land in Z₁∩Z₂ and weight d₁+d₂, with the refined intersection/Gysin
compatibility. This is the exact Appendix-B input of Li–Liu, not an unnormalized ordinary c_d.
Hypotheses: Admit the support intersections and refined Gysin morphisms of the source; rational
coefficients for γ-filtration multiplication; no universal singular-scheme Riemann–Roch.
Direct prerequisites: MotivicEtaleKTheory:M.8/motivic-chern-character, SchemeKTheoryOperations:S.3,
SchemeKTheoryOperations:S.7/scheme-gamma-filtration, SchemeAndStackFoundations:SF.5,
MotivicEtaleKTheory:M.4/purity-gysin-triangle, MotivicEtaleKTheory:M.4/localization-sequence,
MotivicEtaleKTheory:M.4/products
Named target: TauCeti.MotivicEtale.supported_cycle_character
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/deligne-regulator: Deligne regulator (construction; unchecked).
For smooth projective X/C, use the genuine Deligne complex Z(j)_D=[Z(j)→O_X→Ω_X¹→⋯→Ω_X^(j−1)] with
Z(j)=(2πi)^j Z in degree zero. Realization of the motivic class defines
c_D:K_m(X)→H_D^(2j−m)(X,Z(j)); composing the normalized rational character gives
r_D:K_m(X)⊗Q→H_D^(2j−m)(X,Q(j)), and its real version. For nonproper X use the logarithmic
mixed-Hodge Deligne–Beilinson complex supplied by the Hodge owner, not ordinary analytic Deligne
cohomology.
Hypotheses: j≥1; m≥0; the displayed simple complex applies to proper smooth X; open varieties
require a good compactification and the logarithmic/mixed-Hodge comparison.
Direct prerequisites: MotivicEtaleKTheory:M.8/motivic-chern-character,
tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne,
MotivesAndAlgebraicCycles:MC.2
Named target: TauCeti.MotivicEtale.deligneRegulator
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.deligneRegulator_natural [compatibility]: Pullback of admitted smooth
varieties commutes with r_D.
API TauCeti.MotivicEtale.deligneRegulator_product [compatibility]: The total rational r_D carries K
products to Deligne cup products with the same weight/degree sum as ch.
API TauCeti.MotivicEtale.deligneRegulator_real [compatibility]: For X over R, descent is through
conjugation on the Tate lattice and forms; conjugation acts on R(j) by (−1)^j.
Test deligneRegulator_test_point [computation]: For Spec C and j≥1, H_D¹(C,R(j))=C/(2πi)^jR.
Test deligneRegulator_test_integral_point [non-example]: H_D¹(C,Z(j))=C/(2πi)^jZ; replacing this by
the real quotient destroys the integral lattice.
Test deligneRegulator_test_line [compatibility]: For a line bundle on a smooth projective curve, c_D
maps under Betti realization to the ordinary integral first Chern class.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/number-field-deligne-normalization: Number-field Deligne normalization
(theorem; unchecked).
For a number field F and j≥2, identify H_D¹(F⊗R,R(j)) with (∏_(σ:F→C)R(j−1))^conjugation using
C/R(j)≃R(j−1) and the conjugate pairing. The universal rational K_(2j−1) character is the normalized
suspension of the universal topological Chern character, ch_j=(2πi)^j pr_j/j! before suspension. The
simplicial first-infinitesimal-diagonal realization, Adams weight, products and embeddings commute
with this map. This export has no R.7 or D2 prerequisite.
Hypotheses: pr_j is the primitive Newton class with the stated topological normalization; after
positive-degree suspension the relation is the (j−1)! normalization of the preceding node. j≥2; no
Borel analytic normalization assumed.
Direct prerequisites: MotivicEtaleKTheory:M.8/deligne-regulator,
MotivicEtaleKTheory:M.8/motivic-chern-character, GeneralAlgebraicKTheory:K.2,
tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne
Named target: TauCeti.MotivicEtale.number_field_deligne_normalization
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/chern-functoriality: Chern realization functoriality (theorem;
unchecked).
The motivic and Deligne rational total Chern characters commute with admitted pullbacks and are
multiplicative. Finite integral étale Chern classes commute with pullbacks and satisfy the universal
Chern product identities; an individual finite Chern class is not a multiplicative character, and
factorial denominators cannot be inverted in arbitrary finite coefficients. For a smooth
codimension-c immersion the supported realization maps intertwine localization residues with the
boundary H^a(U,B(j))→H^(a−2c+1)(Z,B(j−c)). Finite étale transfers use cohomological traces; the
integral universal Chern formulas retain their normalization. For K₀ on the smooth projective
schemes admitted by S.7, rational proper pushforward uses its GRR formula with Todd correction. No
general higher proper regulator RR theorem is supplied by that K₀ result. Rational Adams ψ^a acts on
weight j by a^j.
Hypotheses: Use only existing support/purity and coherent realization morphisms; finite coefficients
retain the product regime m odd or 8|m; Deligne uses the admitted scheme class.; Finite higher Chern
classes have positive K-degree and positive weight; rational character multiplicativity is a
statement about the total character. Proper GRR is restricted to the source-scoped K₀ smooth
projective setting.
Direct prerequisites: MotivicEtaleKTheory:M.8/finite-etale-chern,
MotivicEtaleKTheory:M.8/motivic-chern-character, MotivicEtaleKTheory:M.8/deligne-regulator,
MotivicEtaleKTheory:M.8/supported-cycle-character, MotivicEtaleKTheory:M.7/etale-k-transfer,
SchemeKTheoryOperations:S.7/grothendieck-riemann-roch, MotivicEtaleKTheory:M.4/functoriality,
MotivicEtaleKTheory:M.4/products, MotivicEtaleKTheory:M.4/projective-bundle-formula,
MotivesAndAlgebraicCycles:MC.2, SchemeAndStackFoundations:SF.5
Named target: TauCeti.MotivicEtale.chern_functoriality
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/integral-motivic-structures: Integral motivic structures (construction;
unchecked).
For a specified regular arithmetic model 𝒳 with generic fibre X, retain H_Z=H_M^a(𝒳,Z(j)), the
subgroup I=im(H_Z→H_M^a(X,Z(j))), its torsion-free quotient L=I/I_tors, and the rational integral
part I_Q=im(H_Z⊗Q→H_M^a(X,Q(j))). A regulator lattice is the image of L in a real or ℓ-adic
realization after proving finite generation and injectivity in the specified case. No integral part
is defined as the entire rational space by default.
Hypotheses: Model 𝒳 and the restriction/realization map are part of the data; lattice claims require
finite generation and torsion-kernel/injectivity facts. Number-field positive-weight cases import
arithmetic finiteness and Borel rank; arbitrary motives do not.
Direct prerequisites: MotivicEtaleKTheory:M.4/cycle-complex,
MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro, MotivicEtaleKTheory:M.8/chern-functoriality,
ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers,
BorelRegulators:R.4/regulator-lattice, mathlib:CommGroup.torsion, mathlib:QuotientGroup.mk'
Named target: TauCeti.MotivicEtale.integralStructures
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.integralStructures_image [characterisation]: I is the image of model
restriction and I_Q is its scalar-extension image in rational generic-fibre cohomology.
API TauCeti.MotivicEtale.integralStructures_torsion [characterisation]: The map I→L has kernel
exactly I_tors; a characteristic-zero regulator factors through L.
API TauCeti.MotivicEtale.integralStructures_lattice [compatibility]: In the stated finite-generation
and injectivity case, L is a free finite-rank Z-lattice in its rational span.
Test integralStructures_test_torsion [degenerate]: If I=Z/m, then L=0 and I_Q=0 although I is
nonzero for m>1.
Test integralStructures_test_free [computation]: For I=Z^r embedded in Q^r, L=Z^r and I_Q=Q^r.
Test integralStructures_test_index [non-example]: The images Z and 2Z in Q have the same rational
integral part and different integral lattices; rational equality does not determine covolume.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary: Tate and elliptic realization
dictionary (application; unchecked).
Use the motive and realization exports for Q(j) and h¹(E)(j) of an elliptic curve E over a number
field F, with cohomological variance. At an unramified good place v, q=Nv, geometric Frobenius on
Q_ℓ(j) has Euler polynomial 1−q^(−j)T, and on H¹_et(Ē,Q_ℓ)(j) it has 1−a_v q^(−j)T+q^(1−2j)T²,
where a_v=q+1−|E(k_v)|. Integral Tate lattices and elliptic ℓ-adic lattices, Betti/de Rham
realizations and their comparison maps are imported; dual homological T_ℓE has the corresponding
dual Frobenius convention.
Hypotheses: ℓ≠residue characteristic, good reduction for E; specify geometric Frobenius throughout
this node; j integer. Bad-place factors require the existing inertia/local-comparison owner and are
not replaced by the good-place polynomial.
Direct prerequisites: MotivesAndAlgebraicCycles:MC.1, MotivesAndAlgebraicCycles:MC.2,
tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68,
MotivicEtaleKTheory:M.1/finite-tate-twist, MotivicEtaleKTheory:M.1/adic-tate-twist,
tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1,
tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv,
EtaleDualityAndPerverseSheaves:EDC.2:pairings
Named target: TauCeti.MotivicEtale.tate_elliptic_realization_dictionary
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/norm-compatible-regulator-families: Norm-compatible regulator families
(construction; unchecked).
Given a directed tower of admitted finite extensions F_n/F and finite coefficient levels with actual
compatible K-theory norm maps, form the subgroup of ∏_n K_m(O_(F_n,S_n);Z/p^n) of families x_n
satisfying coefficient reduction followed by norm equals x_n. The levelwise étale Chern/regulator
maps induce a map to the corresponding continuous-cohomology inverse limit, with corestriction on
the cohomology side. For cyclotomic units u_n and compatible roots ζ_n, Soulé’s x_n=N_n(u_n
β_n^(i−1)) gives the explicit K_(2i−1) family for i≥1.
Hypotheses: For the explicit Soulé product family p is odd, all ramified primes are included in S_n,
and finite-coefficient products have the actual coherence supplied by H.6. Use the cofinal levels
p^n outside {2,3,4,8}; for p=3 start at n≥2 and obtain level one by reduction. The norm/coefficient
square is supplied by the generic K-transfer owner. Retain derived completion/lim¹ when interpreting
a homotopy group of the inverse-limit spectrum.
Direct prerequisites: MotivicEtaleKTheory:M.8/finite-etale-chern,
MotivicEtaleKTheory:M.7/etale-k-transfer,
StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence,
EulerSystemsCyclotomicMainConjecture:L0, StableHomotopyKTheory:H.6/moore-spectrum-multiplication
Named target: TauCeti.MotivicEtale.normFamilies
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.normFamilies_projection [constructor]: The level-n projection of a
compatible family is x_n and satisfies norm(reduce x_(n+1))=x_n.
API TauCeti.MotivicEtale.normFamilies_regulator [compatibility]: At every level the regulator of the
family is the regulator of its level component, and transitions are corestrictions.
API TauCeti.MotivicEtale.normFamilies_soule [simp]: The Soulé family in degree 2i−1 is N_n(u_n
β_n^(i−1)), with c_(i,2i−1) retaining its higher-Chern normalization.
API TauCeti.MotivicEtale.souleFamily [constructor]: Given the specified levelwise norm of unit/Bott
powers and their projection-formula transition compatibility, construct that particular
norm-compatible family; it is not an arbitrary element of the equalizer.
Test normFamilies_test_constant [degenerate]: For the constant identity-transition tower A_n=A,
compatible families identify with A.
Test normFamilies_test_degree [computation]: For i=1 the Soulé construction is the norm-compatible
unit family in K₁; for i=2 its degree is K₃.
Test normFamilies_test_transfer [compatibility]: For an unramified finite extension the regulator
transition square is the actual K norm versus cohomological corestriction; using restriction on both
sides fails it.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility: Euler-factor regulator
compatibility (theorem; unchecked).
If a K-theory family satisfies N_(Mv/M)(x_(Mv))=P_v(Fr_v^(−1))x_M for its actual coefficient/Adams
Galois action and the declared local Euler polynomial, its étale regulator image satisfies the
identical corestriction relation. The Tate and elliptic polynomials are those of the realization
dictionary; a plain norm-compatible family is only the case P_v=1 and does not automatically become
an Euler system.
Hypotheses: The Euler relation is supplied as a hypothesis from the existing Euler-system owner.
Geometric/arithmetic Frobenius and dualization conventions must be reconciled explicitly; the
inverse in the relation is not silently changed.
Direct prerequisites: MotivicEtaleKTheory:M.8/norm-compatible-regulator-families,
MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary,
MotivicEtaleKTheory:M.8/chern-functoriality, MotivicEtaleKTheory:M.7/etale-adams-weights,
SelmerIwasawaCohomology:L4
Named target: TauCeti.MotivicEtale.euler_factor_regulator_compatibility
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/selmer-regulator-factorization: Selmer regulator factorization
(comparison; unchecked).
For a chosen Tate or elliptic realization V with integral lattice T, a global regulator class in
H¹(G_(F,S),V) factors through the existing Selmer group exactly after proving its localizations
satisfy the selected local conditions. At v∤p use the unramified condition when the class extends
over O_v; at v|p the Bloch–Kato finite/geometric condition is imposed in the p-adic Hodge regime
admitted by D2–D5. Give the induced map of the existing Selmer mapping-fibre complexes before using
determinant functoriality.
Hypotheses: The local comparison theorem and local conditions are supplied, not inferred merely from
being a motivic class. Integral and rational local conditions are distinguished, and real places use
the chosen ordinary/modified convention.
Direct prerequisites: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary,
MotivicEtaleKTheory:M.8/chern-functoriality, SelmerIwasawaCohomology:L2, SelmerIwasawaCohomology:L4,
PadicHodgeRegulators:D.2, PadicHodgeRegulators:D.3, PadicHodgeRegulators:D.5,
PadicHodgeRegulators:L1, SelmerIwasawaCohomology:L2/unramified-condition
Named target: TauCeti.MotivicEtale.selmer_regulator_factorization
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/arithmetic-fundamental-line: Arithmetic fundamental line (construction;
unchecked).
For the supplied perfect compactly supported arithmetic cohomology complex C_c(T) over Z_p (or the
supplied coefficient order), set Δ_p(T)=det^(−1) C_c(T) using the determinant functor from
PadicMeasuresIwasawaAlgebras:L5. Retain its integral invertible module, rationalization and
base-change/triangle isomorphisms. For a Tate or elliptic motive, the rational fundamental line and
its Betti/de Rham/K-theory factors are the exact chosen period-line construction of PS.4; comparison
maps/trivializations are separate data. The Tamagawa-number statement asks for a rational zeta
element whose p-adic image is a basis of Δ_p(T) and whose real-period image is the specified leading
L-value, with all finiteness and realization assumptions explicit.
Hypotheses: Perfectness, boundedness and coefficient-ring hypotheses supplied by
determinant/cohomology owners; no unconditional existence of zeta elements or solution of the
Tamagawa conjecture. The rational/real comparison can itself require conjectural motivic finiteness
or regulators.
Direct prerequisites: MotivicEtaleKTheory:M.8/selmer-regulator-factorization,
MotivicEtaleKTheory:M.8/integral-motivic-structures, PadicMeasuresIwasawaAlgebras:L5,
PeriodsAndSpecialValues:PS.4, SelmerIwasawaCohomology:L2, ArithmeticGaloisDuality:D7,
mathlib:PadicInt, mathlib:PadicInt.isUnit_iff
Named target: TauCeti.MotivicEtale.fundamentalLine
Proposed namespace: TauCeti.MotivicEtale
API TauCeti.MotivicEtale.fundamentalLine_baseChange [compatibility]: Derived coefficient base change
induces the supplied determinant-line isomorphism on Δ_p.
API TauCeti.MotivicEtale.fundamentalLine_triangle [structure]: A distinguished triangle gives the
supplied tensor-product determinant isomorphism with the inverse-determinant convention.
API TauCeti.MotivicEtale.fundamentalLine_basis [characterisation]: An element z is an integral basis
precisely when the multiplication map Z_p→Δ_p(T), a↦a z, is an isomorphism; rational nonzero is
weaker.
Test fundamentalLine_test_zero [degenerate]: For the zero perfect complex the determinant and
inverse determinant are the coefficient ring.
Test fundamentalLine_test_shift [compatibility]: Shifting a perfect complex by one dualizes its
determinant line.
Test fundamentalLine_test_nonunit [non-example]: In the line Z_p, the nonzero element p becomes a
rational basis but is not an integral basis.
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/

/- Node MotivicEtaleKTheory:M.8/regulator-determinant-comparison: Regulator determinant comparison
(comparison; unchecked).
For the admitted number-field Tate cases, compare the early Deligne regulator with the existing
Borel regulator using R.7’s explicit factor-two normalization, and transport the actual integral
lattice/determinant comparison from R.4. For Tate and elliptic realizations with the required
Selmer, p-adic Hodge, motivic-finiteness and period comparison inputs, the induced determinant maps
identify the specialized rational fundamental line with the real period line and Δ_p(T)⊗Q_p. This is
a conditional infrastructure comparison, not the Tamagawa-number conjecture.
Hypotheses: All required comparison isomorphisms, perfectness and finiteness hypotheses listed; R.7
is used only here, downstream of the early Deligne export. Integral basis statements also require
the integral local/Tamagawa factors.
Direct prerequisites: MotivicEtaleKTheory:M.8/number-field-deligne-normalization,
MotivicEtaleKTheory:M.8/arithmetic-fundamental-line,
MotivicEtaleKTheory:M.8/selmer-regulator-factorization, BorelRegulators:R.7/regulator-factor-two,
BorelRegulators:R.4/regulator-lattice, BorelRegulators:R.4/regulator-transfer,
BorelRegulators:R.4/regulator-determinant, PeriodsAndSpecialValues:PS.4,
PadicMeasuresIwasawaAlgebras:L5
Named target: TauCeti.MotivicEtale.regulator_determinant_comparison
Proposed namespace: TauCeti.MotivicEtale
Omitted-form reason: unavailable supplier structures, maps or geometric hypotheses must be
constructed before the full target can be encoded; use the packet/reader. Review-specific omissions
are identified at their original positions above.
-/
